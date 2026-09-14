#!/usr/bin/env python3
"""Execute/replay the 85-contraction fresh-root 101 worked example.

This is an independent fixture replay, not another implementation of the
selector. Python parses lossless bare trees and applies only native S at the
addresses actually returned by Lean. It independently reads the literal CTS
checkpoints and replays every local command of the first selector invocation.
The existing six-fixture runtime suite is neither changed nor invoked here.
"""
from __future__ import annotations

import argparse
from collections import Counter
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import threading
import time
import uuid

from local_workspace import LocalWorkspace, absolute_lake
from lean_runtime_checks import terminate_owned
from verification_runtime import require_assertions_enabled

require_assertions_enabled()

ROOT = Path(__file__).resolve().parents[1]
HARNESS = ROOT / "tests/lean/RootResetWorkedTrace.lean"
S = "S"
APPENDANTS = ((1,), ())


def require(ok, reason):
    if not ok:
        raise ValueError(reason)


def ap(*terms):
    result = terms[0]
    for term in terms[1:]:
        result = (result, term)
    return result


B = ap(S, S)
P = ap(S, B)
C0 = ap(S, B, B)
VALUES = (ap(S, C0), ap(S, ap(S, C0)))
LIVE = tuple(ap(B, v) for v in VALUES)
HALT_TAG = ap(B, S)
HALT = ap(B, HALT_TAG)


def code(leaves=(0, 1, 2, 3)):
    if len(leaves) == 1:
        phase, bit = divmod(leaves[0], 2)
        action = P
        for value in reversed(APPENDANTS[phase] if bit else ()):
            action = ap(S, ap(S, action), LIVE[value])
        return ap(B, action)
    half = len(leaves) // 2
    return ap(B, ap(S, code(leaves[:half]), code(leaves[half:])))


ACTIONS = code()
ACT = ap(S, HALT, ACTIONS)


class ParseMiss(ValueError):
    pass


def pair(term):
    if not isinstance(term, tuple) or len(term) != 2:
        raise ParseMiss("application expected")
    return term


def validate_address(address):
    require(isinstance(address, str) and all(side in "LR" for side in address),
            "invalid address: expected a string containing only L and R")


def at(term, address):
    validate_address(address)
    for side in address:
        term = pair(term)[side == "R"]
    return term


def prefix(term):
    stack, pieces = [term], []
    while stack:
        term = stack.pop()
        if term == S:
            pieces.append("S")
        else:
            left, right = pair(term)
            pieces.append("A")
            stack.extend((right, left))
    return "".join(pieces)


def parse_prefix(text):
    require(isinstance(text, str) and bool(text), "missing lossless tree")
    stack = []
    for token in reversed(text):
        if token == "S":
            stack.append(S)
        elif token == "A":
            require(len(stack) >= 2, "incomplete application")
            stack.append((stack.pop(), stack.pop()))
        else:
            raise ValueError("nonliteral tree serialization")
    require(len(stack) == 1, "trailing tree serialization")
    return stack[0]


def contract(term, address):
    validate_address(address)
    focus, parents = term, []
    for side in address:
        left, right = pair(focus)
        parents.append((side, right if side == "L" else left))
        focus = left if side == "L" else right
    f, z = pair(focus)
    g, y = pair(f)
    head, x = pair(g)
    require(head == S, "reported occurrence is not exactly (((S x) y) z)")
    reduced = ap(ap(x, z), ap(y, z))
    for side, sibling in reversed(parents):
        reduced = (reduced, sibling) if side == "L" else (sibling, reduced)
    return reduced


def arity(term):
    count = 0
    while term != S:
        term, _ = pair(term)
        count += 1
    return count


def carrier(term):
    count = 0
    while term != C0:
        fn, term = pair(term)
        if fn != B:
            raise ParseMiss("not a carrier numeral")
        count += 1
    return count


def envelope(term):
    head, d = pair(term)
    sf, seed = pair(d)
    sfhead, act = pair(sf)
    sh, payload = pair(seed)
    if head != S or sfhead != S or sh != S or act != ACT:
        raise ParseMiss("wrong fixed environment")
    return payload


def cell(term):
    fn, arg = pair(term)
    if fn in LIVE:
        return LIVE.index(fn), arg
    head, predecessor = pair(fn)
    tag, _ = pair(arg)
    if head == S and tag in VALUES:
        return None, predecessor
    raise ParseMiss("not a live cell or tombstone")


def cell_word(term, *, literal=False):
    reverse = []
    while term != S:
        bit, term = cell(term)
        if bit is None and literal:
            raise ParseMiss("time-zero word contains a tombstone")
        if bit is not None:
            reverse.append(bit)
    return tuple(reversed(reverse))


def base_queue(term):
    f, _beta = pair(term)
    outer, alpha = pair(f)
    af, inner = pair(alpha)
    active, dormant = pair(af)
    found_b, dormant_e = pair(dormant)
    if outer != inner or found_b != B:
        raise ParseMiss("not the Base boundary")
    envelope(dormant_e)
    return envelope(active)


def selected_action(route, leaves=(0, 1, 2, 3)):
    if arity(route) != 2:
        raise ParseMiss("uncompleted dispatcher route")
    inner = pair(route)[1]
    if len(leaves) == 1:
        return inner, leaves[0]
    left, right = pair(inner)
    half = len(leaves) // 2
    if arity(left) == 2 and arity(right) == 3:
        return selected_action(left, leaves[:half])
    if arity(left) == 3 and arity(right) == 2:
        return selected_action(right, leaves[half:])
    raise ParseMiss("ambiguous or unfinished dispatcher")


def local(term):
    f, continuation_audit = pair(term)
    ff, seed_audit = pair(f)
    halt, route = pair(ff)
    hfn, haudit = pair(halt)
    if hfn == HALT:
        marked = False
    else:
        hhead, _ = pair(hfn)
        tag, _ = pair(haudit)
        if hhead != S or tag != HALT_TAG:
            raise ParseMiss("wrong halt tag")
        marked = True
    if arity(seed_audit) != 2:
        raise ParseMiss("wrong dormant seed prefix")
    continuation, _ = pair(continuation_audit)
    action, leaf = selected_action(route)
    phase, bit = divmod(leaf, 2)
    emitted = APPENDANTS[phase] if bit else ()
    if arity(action) != len(emitted) + 2:
        raise ParseMiss("unfinished action")
    body = action
    for _ in emitted:
        body = pair(body)[0]
    phead, accumulator = pair(body)
    if phead != P:
        raise ParseMiss("wrong action prefix")
    predecessor = accumulator
    for expected in reversed(emitted):
        fn, _ = pair(predecessor)
        found, nxt = cell(predecessor)
        if found is None:
            found = VALUES.index(pair(pair(predecessor)[1])[0])
        if found != expected:
            raise ParseMiss("wrong emitted label")
        predecessor = nxt
    return marked, phase, accumulator, continuation


def queue(term):
    reverse = []
    while True:
        try:
            return cell_word(base_queue(term)) + tuple(reversed(reverse))
        except ParseMiss:
            pass
        try:
            _, _, term, _ = local(term)
            continue
        except ParseMiss:
            pass
        bit, term = cell(term)
        if bit is not None:
            reverse.append(bit)


def decode(term):
    """Independent syntactic readback for this fixed two-appendant fixture."""
    try:
        f, env = pair(term)
        left, right = pair(f)
        if carrier(left) == carrier(right) == 0:
            data = cell_word(envelope(env), literal=True)
            return {"horizon": 0, "phase": 0, "data": "".join(map(str, data))}
    except ParseMiss:
        pass
    try:
        current, last = term, None
        while True:
            try:
                last = local(current)
                current = last[3]
            except ParseMiss:
                break
        if last is None:
            return None
        f, env = pair(current)
        left, right = pair(f)
        k = carrier(left)
        if k < 2 or carrier(right) != k:
            return None
        envelope(env)
        marked, phase, accumulator, _ = last
        data = queue(accumulator)
        horizon = k - 1
        if phase != (horizon - 1) % 2 or marked != (not data):
            return None
        return {"horizon": horizon, "phase": horizon % 2, "data": "".join(map(str, data))}
    except (ParseMiss, ValueError):
        return None


def source_config(horizon):
    data, phase = (1, 0, 1), 0
    for _ in range(horizon):
        if data:
            data = data[1:] + (APPENDANTS[phase] if data[0] else ())
        phase = (phase + 1) % 2
    return {"horizon": horizon, "phase": phase, "data": "".join(map(str, data))}


def validate(log, output):
    controls, ticks, rows, checkpoints = {}, [], [], []
    complete = header = initial = None
    with log.open(encoding="utf-8") as stream:
        for line in stream:
            require(line.startswith("{"), "Lean emitted a diagnostic/non-JSON line")
            obj = json.loads(line)
            kind = obj["kind"]
            if kind == "header":
                require(header is None, "duplicate header")
                header = obj
            elif kind == "initial":
                require(initial is None, "duplicate initial term")
                initial = obj
            elif kind == "control":
                require(obj["id"] == len(controls), "nonconsecutive control registry")
                controls[obj["id"]] = obj["description"]
            elif kind == "microtick":
                require(obj["tick"] == len(ticks) and obj["sample"] == 0, "incomplete microtick prefix")
                ticks.append(obj)
            elif kind == "halt":
                halt = obj
            elif kind == "contraction":
                require(complete is None and obj["sample"] == len(rows), "incomplete/late contraction prefix")
                rows.append(obj)
            elif kind == "complete":
                require(complete is None, "duplicate completion")
                complete = obj
            else:
                raise ValueError("unknown trace record")
    require(header is not None and initial is not None and complete is not None, "incomplete trace")
    require(header["schema"] == "FRESH_ROOT_WORKED_TRACE_V1" and header["samples"] == 85, "wrong schema/coverage")
    require(header["appendants"] == ["1", ""] and header["input"] == "101", "wrong fixture")
    require(len(rows) == 85, "exactly 85 contractions required")
    term = parse_prefix(initial["term"])
    word = S
    for b in (1, 0, 1):
        word = ap(LIVE[b], word)
    generated = ap(ap(C0, C0), ap(S, ap(S, ACT, ap(S, word))))
    require(term == generated and initial["nodes"] == len(initial["term"]) == 171, "independent initial encoder mismatch")

    def check_decode(index, term, reported):
        found = decode(term)
        require(found == reported, f"literal decoder mismatch at contraction {index}: {found} != {reported}")
        if found is not None:
            require(found == source_config(found["horizon"]), "literal queue disagrees with independent CTS step")
            checkpoints.append({"contraction": index, **found, "nodes": len(prefix(term))})

    check_decode(0, term, initial["decoded"])
    micro_term, address, previous = term, "", None
    commands = Counter()
    for row in ticks:
        require(row["address"] == address, "microtick cursor discontinuity")
        require(row["control"] in controls and row["next_control"] in controls, "unknown control ID")
        require(previous is None or previous == row["control"], "control transition discontinuity")
        focus = at(micro_term, address)
        require(row["node"] == ("S" if focus == S else "A"), "wrong actual node observation")
        require(row["incoming"] == (address[-1] if address else "root"), "wrong actual incoming edge")
        command = row["command"]
        commands[command] += 1
        require(row["mutations"] == (command == "Rdx"), "wrong microtick mutation count")
        if command in ("L", "R"):
            pair(focus)
            address += command
        elif command == "U":
            require(bool(address), "U at root")
            address = address[:-1]
        elif command == "Rdx":
            micro_term = contract(micro_term, address)
        else:
            require(command == "stay", "rejection/unknown command")
        require(row["next_address"] == address, "command/cursor mismatch")
        previous = row["next_control"]
    require(ticks and halt["tick"] == len(ticks) == rows[0]["root_microticks"], "first invocation microtick coverage missing")
    require(halt["control"] == previous and halt["address"] == address == rows[0]["address"], "wrong terminal state/address")
    require(commands["Rdx"] == 1 and prefix(micro_term) == rows[0]["target"], "first invocation command replay failed")
    summaries = []
    for index, row in enumerate(rows):
        require(row["initial_address"] == "" and row["initial_control"] == "RootResetReadonlySelector.Control.probe tinySpec.start", "fresh-root initialization missing")
        require(row["mutations"] == 1 and row["absorbing_ticks_checked"] == 2, "contraction/absorption checks missing")
        require(0 < row["root_microticks"] <= header["root_cap"] and 0 < row["persistent_microticks"] <= header["persistent_cap"], "microtick cap violated")
        require(len(prefix(term)) == row["source_nodes"] <= header["term_cap"], "source size mismatch/cap")
        term = contract(term, row["address"])
        serialized = prefix(term)
        require(serialized == row["target"], f"Python native contraction differs from literal Lean output {index+1}")
        require(len(serialized) == row["target_nodes"], "target size mismatch")
        check_decode(index+1, term, row["decoded"])
        summaries.append({k:v for k,v in row.items() if k != "target"})
    require([c["contraction"] for c in checkpoints] == [0, 22, 85], "wrong checkpoint set")
    require([c["nodes"] for c in checkpoints] == [171, 17057, 339285], "worked example checkpoint sizes changed")
    require(complete == {"kind":"complete", "samples":85, "root_microticks":sum(r["root_microticks"] for r in rows), "persistent_microticks":sum(r["persistent_microticks"] for r in rows), "final_nodes":339285}, "incorrect/missing aggregate completion")
    (output/"contractions.json").write_text(json.dumps(summaries, indent=2)+"\n", encoding="utf-8")
    (output/"first-invocation.json").write_text(json.dumps({"controls":controls, "microticks":ticks, "halt":halt}, indent=2)+"\n", encoding="utf-8")
    return {"contractions":85, "checkpoints":checkpoints, "first_invocation_microticks":len(ticks), "first_invocation_control_object_diagnostic_ids":len(controls), "first_invocation_commands":dict(commands), "root_microticks":complete["root_microticks"], "persistent_microticks":complete["persistent_microticks"], "max_root_microticks":max(r["root_microticks"] for r in rows), "literal_tree_outputs_replayed":85, "all_86_checkpoint_decisions_compared":True}


def sha(path):
    with Path(path).open("rb") as f:
        return hashlib.file_digest(f, "sha256").hexdigest()


def snapshot(lake):
    pending, modules = [HARNESS], {}
    while pending:
        source = pending.pop()
        for mod in re.findall(r"^import (\S+)", source.read_text(encoding="utf-8"), re.M):
            file = ROOT/"formalization"/(mod.replace(".", "/")+".lean")
            if mod in modules or not file.is_file():
                continue
            compiled = ROOT/"formalization/.lake/build/lib/lean"/(mod.replace(".", "/")+".olean")
            require(compiled.is_file(), f"missing compiled import {mod}")
            modules[mod] = {"source_sha256":sha(file), "olean_sha256":sha(compiled)}
            pending.append(file)
    fixed = [HARNESS, Path(__file__).resolve(), ROOT/"src/local_workspace.py", ROOT/"src/lean_runtime_checks.py", ROOT/"formalization/lean-toolchain", ROOT/"formalization/lakefile.toml", ROOT/"formalization/lake-manifest.json"]
    return {"files":{p.relative_to(ROOT).as_posix():sha(p) for p in fixed}, "project_modules":modules, "lake_sha256":sha(lake), "lean_sha256":sha(lake.with_name("lean.exe" if os.name == "nt" else "lean"))}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lake", required=True)
    parser.add_argument("--timeout-seconds", type=int, default=1800)
    args = parser.parse_args()
    require(args.timeout_seconds > 0, "invalid timeout")
    workspace = LocalWorkspace(ROOT)
    workspace.activate()
    lake = Path(absolute_lake(args.lake))
    output = workspace.directory("submission-execution/worked-trace/run-"+datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")+"-"+uuid.uuid4().hex[:8])
    before = snapshot(lake)
    (output/"inputs-before.json").write_text(json.dumps(before, indent=2, sort_keys=True)+"\n", encoding="utf-8")
    command = [str(lake), "env", "lean", "--run", str(HARNESS)]
    env = workspace.environment()
    env["PATH"] = str(lake.parent)+os.pathsep+env["PATH"]
    started = time.monotonic()
    failures = []
    log = output/"trace.jsonl"
    print("WORKED TRACE START", output, flush=True)
    timed_out = threading.Event()
    with log.open("w", encoding="utf-8", newline="\n") as f:
        child = subprocess.Popen(command, cwd=ROOT/"formalization", env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, encoding="utf-8", start_new_session=os.name != "nt")
        def expire():
            timed_out.set()
            terminate_owned(child)
        timer = threading.Timer(args.timeout_seconds, expire)
        timer.start()
        try:
            for line in child.stdout:
                f.write(line)
                f.flush()
                if line.startswith('{"kind":"complete"'):
                    print(line.rstrip(), flush=True)
                if '"kind":"contraction"' in line:
                    r = json.loads(line)
                    if r["sample"] % 10 == 0 or r["decoded"] is not None:
                        print(f"WORKED TRACE contraction={r['sample']+1} rootTicks={r['root_microticks']} nodes={r['target_nodes']} decoded={r['decoded']}", flush=True)
            status = child.wait()
        finally:
            timer.cancel()
            terminate_owned(child)
            child.stdout.close()
    results = None
    try:
        require(not timed_out.is_set() and status == 0, "Lean execution incomplete/failed")
        results = validate(log, output)
    except (ValueError, KeyError, UnboundLocalError) as error:
        failures.append(str(error))
    after = snapshot(lake)
    (output/"inputs-after.json").write_text(json.dumps(after, indent=2, sort_keys=True)+"\n", encoding="utf-8")
    if before != after:
        failures.append("harness, validator, project source, compiled import or executable changed during run")
    receipt = {"status":"PASS_WORKED_TRACE" if not failures else "FAIL", "completed_utc":datetime.now(timezone.utc).isoformat(), "command":command, "elapsed_seconds":round(time.monotonic()-started,3), "input_manifest_sha256":sha(output/"inputs-before.json"), "trace_sha256":sha(log), "source_and_imports_stable":before==after, "fresh_transitive_import_rebuild":False, "scope":"85 actual fresh-root selector invocations for P=[1,empty], input101; independent Python native-address and literal checkpoint replay; full local-command/observation logging and diagnostic control IDs/descriptions only for invocation0", "limitations":["Uses existing compiled project imports, hashed with their current sources; no fresh transitive source-to-olean rebuild is claimed.", "Runtime caps/counters/serializations are test-driver instrumentation, not finite-controller storage.", "Control IDs denote retained process-local objects, not structural finite-control equality; descriptions deliberately omit probe successors. Test-only unsafe pointer comparison supplies these diagnostic IDs and does not select commands. No global state cover was evaluated.", "The Python checker replays observed commands; it does not independently implement the Lean selector transition table.", "This fixture check does not replace the all-input proof or the unchanged six-fixture runtime suite."], "results":results, "failures":failures}
    receipt["lean_returncode"] = child.returncode
    receipt["timed_out"] = timed_out.is_set()
    receipt["artifacts"] = {p.name:sha(p) for p in output.iterdir() if p.is_file()}
    (output/"receipt.json").write_text(json.dumps(receipt, indent=2, sort_keys=True)+"\n", encoding="utf-8")
    print(receipt["status"], output/"receipt.json", failures, flush=True)
    return bool(failures)


if __name__ == "__main__":
    raise SystemExit(main())
