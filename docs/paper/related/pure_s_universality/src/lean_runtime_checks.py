#!/usr/bin/env python3
"""Run every declared native Lean runtime regression; fail on incomplete evidence.

The encoder preflight is deliberately distinguished from unmaterialized full
encoder execution. No proof stopping-time budget or global state cover is run.
"""
from __future__ import annotations

import argparse
from collections import Counter
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from functools import lru_cache
import hashlib
import json
import os
from pathlib import Path
import re
import signal
import subprocess
import sys
import threading
import time
import uuid

from local_workspace import LocalWorkspace, absolute_lake
from verification_runtime import require_assertions_enabled

ROOT = Path(__file__).resolve().parents[1]
FIXTURES = {
    "differential": ("RootResetRuntimeDifferential.lean", ["120"]),
    "arbitrary": ("RootResetArbitraryRuntime.lean", []),
    "output": ("RootResetOutputRuntime.lean", ["small"]),
    "encoder-preflight": ("RootResetOutputRuntime.lean", ["preflight"]),
}
DIFFERENTIAL_NAMES = {
    "initial_empty", "single_false", "true_empty_appendant",
    "true_nonempty_appendant", "period2_drain", "period2_mixed",
}


def require(condition: bool, reason: str) -> None:
    if not condition:
        raise ValueError(reason)


def fields(parts: list[str]) -> dict[str, int | str]:
    result: dict[str, int | str] = {}
    for part in parts:
        key, value = part.split("=", 1)
        require(key not in result, f"duplicate field {key}")
        result[key] = int(value) if value.isdecimal() else value
    return result


def records(text: str):
    for line in text.splitlines():
        require("FAIL" not in line and "error:" not in line, line)
        require(re.search(r"\bSKIP(?:PED)?\b", line, re.IGNORECASE) is None, "a skipped check cannot pass")
        yield line.split(",")


def validate_differential(text: str) -> dict:
    fixtures: dict[str, dict] = {}
    completed = None
    for parts in records(text):
        if parts[0] == "FIXTURE":
            name = parts[1]
            require(name not in fixtures, f"duplicate fixture {name}")
            limits = fields(parts[2:])
            require(limits == {"samples": 120, "rootCap": 1000000,
                              "persistentCap": 100000, "termCap": 1000000}, "changed differential coverage/caps")
            fixtures[name] = {"rows": [], "limits": limits}
        elif parts[0] == "ROW":
            require(len(parts) == 10, "malformed differential row")
            fixture = fixtures[parts[1]]
            require("reported" not in fixture, "row after completed fixture")
            fixture["rows"].append((*map(int, parts[2:8]), parts[8], parts[9]))
        elif parts[0] == "PASS":
            fixture = fixtures[parts[1]]
            require("reported" not in fixture, "duplicate fixture completion")
            fixture["reported"] = fields(parts[2:])
        elif parts[0] == "ALL_PASS":
            require(completed is None, "duplicate overall completion")
            completed = fields(parts[1:])
    require(set(fixtures) == DIFFERENTIAL_NAMES, "missing or changed differential fixtures")
    require(completed == {"fixtures": 6, "samples": 720}, "incomplete differential run")
    summary = {}
    for name, fixture in fixtures.items():
        rows = fixture["rows"]
        require([row[0] for row in rows] == list(range(120)), f"incomplete/nonconsecutive prefix {name}")
        require(all(row[5] == 1 for row in rows), "root mutation count is not one")
        require(all(0 < row[3] <= 1000000 and 0 < row[4] <= 100000 for row in rows), "microtick cap exceeded")
        require(all(0 < row[1] <= 1000000 and row[2] > 0 for row in rows), "source-size cap exceeded")
        require(all(set(row[7]) <= {"L", "R"} for row in rows), "invalid occurrence address")
        actual = {"samples": 120, "rootTicks": sum(row[3] for row in rows),
                  "persistentTicks": sum(row[4] for row in rows),
                  "maxRootTicks": max(row[3] for row in rows),
                  "maxTermSize": max(max(row[1], row[2]) for row in rows)}
        require(actual == fixture.get("reported"), f"missing/inconsistent totals {name}")
        summary[name] = {**actual, "limits": fixture["limits"],
                         "mutationRows": dict(Counter(row[6].split("_pc")[0] for row in rows))}
    return {"contractions": 720, "fixtures": summary}


@lru_cache(None)
def trees(internal: int):
    if internal == 0:
        return (None,)
    return tuple((left, right) for count in range(internal)
                 for left in trees(count) for right in trees(internal - 1 - count))


def redexes(tree) -> list[str]:
    if tree is None:
        return []
    left, right = tree
    root = left is not None and left[0] is not None and left[0][0] is None
    return ([""] if root else []) + ["L" + p for p in redexes(left)] + ["R" + p for p in redexes(right)]


def small_terms():
    terms = [tree for internal in range(7) for tree in trees(internal)]
    sizes = [2 * internal + 1 for internal in range(7) for _ in trees(internal)]
    require(len(terms) == len(set(terms)) == 197, "Python tree census mismatch")
    require([len(trees(n)) for n in range(7)] == [1, 1, 2, 5, 14, 42, 132], "Catalan counts mismatch")
    return terms, sizes


def validate_arbitrary(text: str) -> dict:
    terms, sizes = small_terms()
    fixtures: dict[str, list] = {}
    reported = {}
    completed = None
    for parts in records(text):
        if parts[0] == "FIXTURE":
            require(parts[1] not in fixtures, "duplicate arbitrary fixture")
            require(fields(parts[2:]) == {"terms": 197, "maxNodes": 13, "microtickCap": 1000000}, "changed arbitrary coverage/cap")
            fixtures[parts[1]] = []
        elif parts[0] == "ROW":
            require(len(parts) == 9 and parts[1] not in reported, "malformed/late arbitrary row")
            fixtures[parts[1]].append(parts[2:])
        elif parts[0] == "PASS":
            require(parts[1] not in reported, "duplicate arbitrary completion")
            reported[parts[1]] = fields(parts[2:])
        elif parts[0] == "ALL_PASS":
            require(completed is None, "duplicate arbitrary overall completion")
            completed = fields(parts[1:])
    require(set(fixtures) == set(reported) == {"period1_empty", "period2_mixed"}, "missing arbitrary fixture")
    require(completed == {"fixtures": 2, "termsPerFixture": 197, "executions": 394}, "incomplete arbitrary run")
    summary = {}
    for name, rows in fixtures.items():
        require(len(rows) == 197, "incomplete arbitrary tree set")
        normal = selected = total = maximum = 0
        for index, (got_index, size, count, tag, ticks, mutations, address) in enumerate(rows):
            expected = redexes(terms[index])
            require(int(got_index) == index and int(size) == sizes[index], "wrong enumeration index/size")
            require(int(count) == len(expected), "independent redex count mismatch")
            require(int(mutations) == bool(expected), "zero/one mutation mismatch")
            require(tag == "PureSFormal.Research.RootResetSelectorContract.HaltKind." + ("redex" if expected else "nf"), "halt tag mismatch")
            require(not expected or address in expected, "selected occurrence is not a syntactic redex")
            require(0 < int(ticks) <= 1000000, "arbitrary microtick cap exceeded")
            selected += bool(expected)
            normal += not expected
            total += int(ticks)
            maximum = max(maximum, int(ticks))
        actual = {"terms": 197, "normal": normal, "redex": selected, "microticks": total, "maxMicroticks": maximum}
        require(actual == reported[name], "arbitrary aggregate totals mismatch")
        summary[name] = actual
    return {"executions": 394, "fixtures": summary}


def validate_output(text: str) -> dict:
    rows = []
    reported = None
    for parts in records(text):
        if parts[0] == "ROW":
            require(len(parts) == 6 and reported is None, "malformed/late output row")
            rows.append(tuple(map(int, parts[1:])))
        elif parts[0] == "OUTPUT_PASS":
            require(reported is None, "duplicate output completion")
            reported = fields(parts[1:])
    _, sizes = small_terms()
    require([row[0] for row in rows] == list(range(197)), "incomplete output tree set")
    require([row[1] for row in rows] == sizes, "wrong output enumeration sizes")
    require(all(min(row[2:]) > 0 for row in rows), "nonpositive operation count")
    actual = {"terms": 197, "measuredCalls": 591, "publicCalls": 591,
              "rowOperations": sum(row[2] for row in rows),
              "terminalOperations": sum(row[3] for row in rows),
              "scannedOperations": sum(row[4] for row in rows)}
    require(actual == reported, "incomplete/inconsistent output observer run")
    return actual


def validate_preflight(text: str) -> dict:
    metadata = {}
    for parts in records(text):
        if parts[0].startswith("PREFLIGHT_"):
            require(parts[0] not in metadata, "duplicate preflight record")
            metadata[parts[0]] = fields(parts[1:])
    require(metadata.get("PREFLIGHT_SOURCE") == {"code": 0, "originalStates": 0, "paddedStates": 1,
            "initialState": 0, "inputLength": 0, "decodeOperations": 18, "paddingOperations": 38}, "source/padding preflight mismatch")
    require(metadata.get("PREFLIGHT_COUNTER") == {"instructions": 127, "operations": 1554635}, "counter table preflight mismatch")
    require(metadata.get("PREFLIGHT_T2") == {"productions": 3813, "productionCells": 15831,
            "initialWordLength": 18, "programTapeCellsLowerBound": 19068,
            "seedBitsAtLeastPowerOfTwo": 57207}, "T2/lower-bound preflight mismatch")
    require(metadata.get("PREFLIGHT_PASS") == {"decodePaddingAndTable": "true",
            "fullSeedAndTermMaterialized": "false"}, "missing/overstated preflight completion")
    return {"scope": "partial encoder execution; full literal seed/term not materialized",
            "full_encoder_execution": False, "seed_bits_lower_bound": "2^57207", "metadata": metadata}


VALIDATORS = {"differential": validate_differential, "arbitrary": validate_arbitrary,
              "output": validate_output, "encoder-preflight": validate_preflight}


def sha256(path: Path) -> str:
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def snapshot(lake: Path, root: Path = ROOT) -> dict:
    """Bind all transitive project sources and their actual compiled imports."""
    harnesses = {root / "tests/lean" / name for name, _ in FIXTURES.values()}
    pending = list(harnesses)
    modules: dict[str, dict] = {}
    while pending:
        source = pending.pop()
        for line in source.read_text(encoding="utf-8").splitlines():
            if not line.startswith("import "):
                continue
            for module in line.partition("--")[0].split()[1:]:
                candidate = root / "formalization" / (module.replace(".", "/") + ".lean")
                if module in modules or not candidate.is_file():
                    continue
                compiled = root / "formalization/.lake/build/lib/lean" / (module.replace(".", "/") + ".olean")
                require(compiled.is_file(), f"missing compiled project import: {compiled}; build the proof library first")
                modules[module] = {"source_sha256": sha256(candidate), "olean_sha256": sha256(compiled)}
                pending.append(candidate)
    lean = lake.with_name("lean.exe" if os.name == "nt" else "lean")
    require(lean.is_file(), "pinned Lean executable is not adjacent to Lake")
    fixed = [root / "formalization/lean-toolchain", root / "formalization/lakefile.toml",
             root / "formalization/lake-manifest.json", Path(__file__).resolve()]
    return {"harnesses": {str(p.relative_to(root)).replace("\\", "/"): sha256(p) for p in sorted(harnesses)},
            "project_modules": modules,
            "fixed_files": {str(p.relative_to(root)).replace("\\", "/"): sha256(p) for p in fixed},
            "lake_sha256": sha256(lake), "lean_sha256": sha256(lean)}


def terminate_owned(process: subprocess.Popen) -> None:
    if process.poll() is not None:
        return
    if os.name == "nt":
        subprocess.run(["taskkill", "/PID", str(process.pid), "/T", "/F"],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
    else:
        os.killpg(process.pid, signal.SIGTERM)
    try:
        process.wait(timeout=10)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait()


def execute(name: str, lake: Path, directory: Path, environment: dict,
            timeout_seconds: int, print_lock: threading.Lock) -> dict:
    filename, arguments = FIXTURES[name]
    command = [str(lake), "env", "lean", "--run", str(ROOT / "tests/lean" / filename), *arguments]
    log = directory / (name + ".log")
    started = time.monotonic()
    with print_lock:
        print(f"RUNTIME START {name}: {' '.join(command)}", flush=True)
    timed_out = threading.Event()
    with log.open("w", encoding="utf-8", newline="\n") as output:
        process = subprocess.Popen(command, cwd=ROOT / "formalization", env=environment,
                                   stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True,
                                   encoding="utf-8", errors="strict", start_new_session=os.name != "nt")
        def expire():
            timed_out.set()
            terminate_owned(process)
        timer = threading.Timer(timeout_seconds, expire)
        timer.start()
        try:
            require(process.stdout is not None, "no child output pipe")
            count = 0
            for line in process.stdout:
                output.write(line)
                output.flush()
                if line.startswith("ROW,"):
                    count += 1
                if not line.startswith("ROW,") or count % 20 == 0:
                    with print_lock:
                        print(f"RUNTIME {name}: {line.rstrip()}", flush=True)
            status = process.wait()
        except BaseException:
            terminate_owned(process)
            raise
        finally:
            timer.cancel()
            if process.stdout is not None:
                process.stdout.close()
    require(not timed_out.is_set(), f"{name} exceeded {timeout_seconds}s; incomplete run is failure")
    require(status == 0, f"{name} exited {status}; see {log}")
    result = VALIDATORS[name](log.read_text(encoding="utf-8"))
    return {"status": "PASS_DECLARED_CASES", "command": command,
            "elapsed_seconds": round(time.monotonic() - started, 3),
            "log_sha256": sha256(log), "results": result}


def main() -> int:
    require_assertions_enabled()
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lake", required=True)
    parser.add_argument("--jobs", type=int, default=2)
    parser.add_argument("--timeout-seconds", type=int, default=3600)
    args = parser.parse_args()
    require(1 <= args.jobs <= 4 and args.timeout_seconds > 0, "invalid runtime jobs/timeout")
    workspace = LocalWorkspace(ROOT)
    workspace.activate()
    lake = Path(absolute_lake(args.lake))
    environment = workspace.environment()
    environment["PATH"] = str(lake.parent) + os.pathsep + environment["PATH"]
    environment["PYTHONUTF8"] = "1"
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    directory = workspace.directory(f"runtime-checks/{stamp}-{uuid.uuid4().hex[:8]}")
    before = snapshot(lake)
    (directory / "inputs-before.json").write_text(json.dumps(before, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    outcomes, failures = {}, {}
    lock = threading.Lock()
    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        futures = {pool.submit(execute, name, lake, directory, environment, args.timeout_seconds, lock): name
                   for name in FIXTURES}
        for future in as_completed(futures):
            name = futures[future]
            try:
                outcomes[name] = future.result()
            except Exception as error:
                failures[name] = f"{type(error).__name__}: {error}"
                print(f"RUNTIME FAIL {name}: {error}", flush=True)
    after = snapshot(lake)
    (directory / "inputs-after.json").write_text(json.dumps(after, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    if before != after:
        failures["input_stability"] = "source, harness, compiled project import, or pinned executable changed"
    receipt = {"status": "PASS_DECLARED_RUNTIME_CASES" if not failures else "FAIL",
               "full_encoder_execution": False,
               "encoder_limitation": "code-zero literal seed has at least 2^57207 bits; preflight is partial execution",
               "outcomes": outcomes, "failures": failures,
               "input_manifest_sha256": sha256(directory / "inputs-before.json"),
               "completed_utc": datetime.now(timezone.utc).isoformat()}
    (directory / "receipt.json").write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(f"RUNTIME {receipt['status']} receipt={directory / 'receipt.json'}", flush=True)
    return int(bool(failures))


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (ValueError, OSError) as error:
        print(f"FAIL runtime checks: {error}", file=sys.stderr)
        raise SystemExit(1) from error
