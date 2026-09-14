#!/usr/bin/env python3
"""Compare named Boolean-source runs with an independent signed-head tape.

The Lean harness executes the actual deterministic source definitions. Python
uses an integer head and sparse tape, then exports the finite observed window.
No source encoder, CTS simulation or pure-S trajectory is materialized here.
"""
from __future__ import annotations

import argparse
from datetime import datetime, timezone
import difflib
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import time
import uuid

from local_workspace import LocalWorkspace, absolute_lake
from lean_runtime_checks import terminate_owned
from verification_runtime import require_assertions_enabled

require_assertions_enabled()

ROOT = Path(__file__).resolve().parents[1]
FORMAL = ROOT / "formalization"
HARNESS = ROOT / "tests/lean/DeterministicTapeSourceExamples.lean"


def require(condition, reason):
    if not condition:
        raise ValueError(reason)


def cases():
    halt = ((None, None),)
    flip = (((True, 0, 1), (False, 0, 1)), (None, None))
    loop = (((False, 0, 0), (True, 0, 0)),)
    grow = lambda direction: (((True, direction, 1), (False, direction, 1)),
                              ((True, direction, 2), (True, direction, 2)), (None, None))
    return [
        ("immediate_empty", halt, (), 2),
        ("immediate_false", halt, (False,), 2),
        ("immediate_true", halt, (True,), 2),
        ("flip_false", flip, (False,), 3),
        ("flip_true", flip, (True,), 3),
        ("left_growth", grow(-1), (False,), 4),
        ("right_growth", grow(1), (True,), 4),
        ("loop_false", loop, (False,), 4),
        ("loop_true", loop, (True,), 4),
    ]


def expected_records():
    lines, coverage = [], {}
    for name, table, bits, horizon in cases():
        # Coordinates are relative to the initial scanned cell, not list indices.
        state, head, lower, upper = 0, 0, -1, len(bits)
        tape = {position: True for position, bit in enumerate(bits) if bit}
        live, rows, terminal, growth = True, [], None, set()
        for tick in range(horizon + 1):
            if not live:
                lines.append(f"SOURCE|{name}|{tick}|none")
                continue
            symbol = tape.get(head, False)
            rule = table[state][int(symbol)] if state < len(table) else None
            window = "".join(str(int(tape.get(position, False))) for position in range(lower, upper + 1))
            row = (state, head - lower, window)
            rows.append(row)
            lines.append(f"SOURCE|{name}|{tick}|{state}|{head-lower}|{window}|{int(symbol)}|{int(rule is None)}")
            if rule is None:
                terminal = {"horizon": tick, "scanned_output": symbol}
                live = False
                continue
            write, movement, next_state = rule
            if write:
                tape[head] = True
            else:
                tape.pop(head, None)
            head += movement
            state = next_state
            if head < lower:
                lower = head
                growth.add("left")
            if head > upper:
                upper = head
                growth.add("right")
        coverage[name] = {"horizons": list(range(horizon + 1)), "literal_rows": rows,
                          "terminal": terminal, "growth": sorted(growth),
                          "all_observed_rows_equal": len(set(rows)) == 1}
    require(len(lines) == 37, "wrong source-example record count")
    require(coverage["immediate_false"]["terminal"] == {"horizon": 0, "scanned_output": False}, "missing immediate false halt")
    require(coverage["immediate_true"]["terminal"] == {"horizon": 0, "scanned_output": True}, "missing immediate true halt")
    require(coverage["flip_false"]["terminal"] == {"horizon": 1, "scanned_output": True}, "missing computed true output")
    require(coverage["flip_true"]["terminal"] == {"horizon": 1, "scanned_output": False}, "missing computed false output")
    for direction in ("left", "right"):
        require(coverage[direction + "_growth"]["growth"] == [direction], "missing tape growth")
        require(coverage[direction + "_growth"]["terminal"]["horizon"] == 2, "missing multistep halt")
    for name in ("loop_false", "loop_true"):
        require(coverage[name]["terminal"] is None and coverage[name]["all_observed_rows_equal"], "missing repeated literal-row loop")
    return lines, coverage


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def snapshot(lake):
    pending, modules = [HARNESS], {}
    while pending:
        source = pending.pop()
        for name in re.findall(r"^import ([\w.]+)", source.read_text(encoding="utf-8"), re.M):
            file = FORMAL / (name.replace(".", "/") + ".lean")
            if name in modules or not file.is_file():
                continue
            compiled = FORMAL / ".lake/build/lib/lean" / (name.replace(".", "/") + ".olean")
            require(compiled.is_file(), f"missing compiled import {name}; build the source dependency first")
            modules[name] = {"source_sha256": sha(file), "olean_sha256": sha(compiled)}
            pending.append(file)
    fixed = [HARNESS, Path(__file__).resolve(), ROOT / "src/local_workspace.py", ROOT / "src/lean_runtime_checks.py",
             FORMAL / "lean-toolchain", FORMAL / "lakefile.toml", FORMAL / "lake-manifest.json"]
    return {"files": {p.relative_to(ROOT).as_posix(): sha(p) for p in fixed}, "project_modules": modules,
            "lake_sha256": sha(lake), "lean_sha256": sha(lake.with_name("lean.exe" if os.name == "nt" else "lean"))}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lake", required=True)
    parser.add_argument("--timeout-seconds", type=int, default=120)
    args = parser.parse_args()
    require(args.timeout_seconds > 0, "timeout must be positive")
    expected, coverage = expected_records()
    workspace = LocalWorkspace(ROOT)
    workspace.activate()
    lake = Path(absolute_lake(args.lake))
    output = workspace.directory("submission-execution/source-examples/run-" + datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ") + "-" + uuid.uuid4().hex[:8])
    before = snapshot(lake)
    (output / "inputs-before.json").write_text(json.dumps(before, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    command = [str(lake), "env", "lean", "--run", str(HARNESS)]
    environment = workspace.environment()
    environment["PATH"] = str(lake.parent) + os.pathsep + environment["PATH"]
    started, failures, status = time.monotonic(), [], None
    log = output / "source-rows.log"
    print("SOURCE EXAMPLES START", output, flush=True)
    with log.open("w", encoding="utf-8") as stream:
        child = subprocess.Popen(command, cwd=FORMAL, env=environment, stdout=stream, stderr=subprocess.STDOUT,
                                 text=True, encoding="utf-8", start_new_session=os.name != "nt")
        try:
            status = child.wait(timeout=args.timeout_seconds)
        except subprocess.TimeoutExpired:
            failures.append("source-example execution timed out")
        finally:
            terminate_owned(child)
    actual = log.read_text(encoding="utf-8").splitlines()
    if status != 0:
        failures.append(f"Lean emitter exit code {status}")
    if actual != expected:
        (output / "mismatch.diff").write_text("\n".join(difflib.unified_diff(expected, actual, fromfile="independent-signed-head-python", tofile="actual-lean-source")) + "\n", encoding="utf-8")
        failures.append("source rows, terminality or scanned bits disagree")
    after = snapshot(lake)
    if before != after:
        failures.append("inputs changed during execution")
    (output / "inputs-after.json").write_text(json.dumps(after, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    (output / "coverage.json").write_text(json.dumps(coverage, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    receipt = {"status": "FAIL" if failures else "PASS_SOURCE_EXAMPLES", "completed_utc": datetime.now(timezone.utc).isoformat(),
               "command": command, "elapsed_seconds": round(time.monotonic() - started, 3), "cases": len(cases()),
               "expected_records": 37, "actual_records": len(actual), "inputs_stable": before == after,
               "fresh_transitive_import_rebuild": False, "scope": "Named deterministic Boolean-source runs and independent signed-head/sparse-tape comparison; no compiled CTS or pure-S execution",
               "failures": failures, "artifacts": {p.name: sha(p) for p in output.iterdir() if p.is_file()}}
    (output / "receipt.json").write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(receipt["status"], output / "receipt.json", failures, flush=True)
    return bool(failures)


if __name__ == "__main__":
    raise SystemExit(main())
