#!/usr/bin/env python3
"""Check runtime transcripts against their delivered sources and build objects."""

from __future__ import annotations

import ast
from datetime import datetime
import hashlib
import json
from pathlib import Path, PurePosixPath
import posixpath
import re
import tempfile

from replay_scope import header_imports


ROOT = Path(__file__).resolve().parents[1]
MODULE = re.compile(r"[A-Za-z_][A-Za-z_0-9]*(?:\.[A-Za-z_][A-Za-z_0-9]*)*\Z")
SHA256 = re.compile(r"[0-9a-f]{64}\Z")
SPECS = {
    "suite": {
        "runner": "src/lean_runtime_checks.py",
        "harnesses": (
            "tests/lean/RootResetRuntimeDifferential.lean",
            "tests/lean/RootResetArbitraryRuntime.lean",
            "tests/lean/RootResetOutputRuntime.lean",
        ),
        "status": "PASS_DECLARED_RUNTIME_CASES",
    },
    "worked_trace": {
        "runner": "src/verify_root_reset_worked_trace.py",
        "harnesses": ("tests/lean/RootResetWorkedTrace.lean",),
        "status": "PASS_WORKED_TRACE",
    },
    "source_examples": {
        "runner": "src/verify_deterministic_tape_examples.py",
        "harnesses": ("tests/lean/DeterministicTapeSourceExamples.lean",),
        "status": "PASS_SOURCE_EXAMPLES",
    },
}
LAKE_INPUTS = (
    "formalization/lean-toolchain",
    "formalization/lakefile.toml",
    "formalization/lake-manifest.json",
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def sha256(path: Path) -> str:
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def checked_file(root: Path, name: str) -> Path:
    require(isinstance(name, str) and bool(name), "empty evidence path")
    relative = PurePosixPath(name)
    require(not relative.is_absolute() and ".." not in relative.parts
            and "\\" not in name and ":" not in name
            and relative.as_posix() == name,
            "invalid evidence path: " + name)
    path = root / name
    require(path.is_file(), "missing evidence/input file: " + name)
    require(path.resolve().is_relative_to(root.resolve()),
            "evidence path escapes its root: " + name)
    return path


def read_json(path: Path) -> dict:
    def unique(pairs):
        result = {}
        for name, value in pairs:
            require(name not in result, f"duplicate JSON key {name!r} in {path.name}")
            result[name] = value
        return result

    value = json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=unique)
    require(isinstance(value, dict), "expected a JSON object: " + path.name)
    return value


def verify_hashes(root: Path, hashes: dict, *, label: str) -> None:
    require(isinstance(hashes, dict) and bool(hashes), label + " has no inputs")
    for name, expected in hashes.items():
        require(isinstance(expected, str) and SHA256.fullmatch(expected) is not None,
                label + " has an invalid hash for " + name)
        require(sha256(checked_file(root, name)) == expected,
                label + " hash mismatch: " + name)


def project_sources(root: Path, harnesses: tuple[str, ...]) -> dict[str, str]:
    """Derive the complete project import closure from actual Lean headers."""
    modules: dict[str, str] = {}
    active: set[str] = set()

    def visit(path: Path) -> None:
        for module in header_imports(path.read_text(encoding="utf-8")):
            require(MODULE.fullmatch(module) is not None, "invalid import: " + module)
            relative = "formalization/" + module.replace(".", "/") + ".lean"
            imported = root / relative
            if not imported.is_file():
                require(module.split(".")[0] in {"Init", "Lean", "Std", "Lake"},
                        "missing project import: " + module)
                continue
            require(module not in active, "cyclic project import: " + module)
            if module in modules:
                continue
            active.add(module)
            visit(checked_file(root, relative))
            active.remove(module)
            modules[module] = sha256(imported)

    for harness in harnesses:
        visit(checked_file(root, harness))
    return dict(sorted(modules.items()))


def python_sources(root: Path, runners: tuple[str, ...]) -> set[str]:
    """Include each shipped Python helper imported by the execution runners."""
    found: set[str] = set()
    pending = list(runners)
    while pending:
        name = pending.pop()
        if name in found:
            continue
        found.add(name)
        tree = ast.parse(checked_file(root, name).read_text(encoding="utf-8"))
        imports = []
        for node in ast.walk(tree):
            if isinstance(node, ast.Import):
                imports.extend(alias.name for alias in node.names)
            elif isinstance(node, ast.ImportFrom):
                require(node.level == 0, "unsupported relative Python import in " + name)
                imports.append(node.module or "")
        for module in imports:
            local = "src/" + module.replace(".", "/") + ".py"
            if (root / local).is_file():
                pending.append(local)
    return found


def validate_source_snapshot(root: Path, kind: str, snapshot: dict) -> dict[str, str]:
    spec = SPECS[kind]
    expected = project_sources(root, spec["harnesses"])
    recorded = snapshot.get("project_modules")
    require(isinstance(recorded, dict), kind + " lacks a project import manifest")
    missing, extra = sorted(expected.keys() - recorded.keys()), sorted(recorded.keys() - expected.keys())
    require(not missing and not extra,
            f"{kind} import closure mismatch: missing={missing}, extra={extra}")
    for module, source_hash in expected.items():
        record = recorded[module]
        require(isinstance(record, dict) and record.get("source_sha256") == source_hash,
                kind + " imported source hash mismatch: " + module)
        require(isinstance(record.get("olean_sha256"), str)
                and SHA256.fullmatch(record["olean_sha256"]) is not None,
                kind + " invalid compiled object hash: " + module)

    if kind == "suite":
        require(set(snapshot.get("harnesses", {})) == set(spec["harnesses"]),
                "suite harness inventory mismatch")
        verify_hashes(root, snapshot["harnesses"], label="suite harness")
        fixed = snapshot.get("fixed_files")
        required = {*LAKE_INPUTS, spec["runner"]}
    else:
        fixed = snapshot.get("files")
        required = {*LAKE_INPUTS, *spec["harnesses"], spec["runner"],
                    "src/local_workspace.py", "src/lean_runtime_checks.py"}
    require(isinstance(fixed, dict) and set(fixed) == required,
            kind + " fixed input inventory mismatch")
    verify_hashes(root, fixed, label=kind + " fixed input")
    for tool in ("lake_sha256", "lean_sha256"):
        require(isinstance(snapshot.get(tool), str)
                and SHA256.fullmatch(snapshot[tool]) is not None,
                kind + " missing pinned tool identity: " + tool)
    return expected


def validate_built_objects(kind: str, snapshot: dict, objects: dict) -> None:
    for module, record in snapshot["project_modules"].items():
        require(module in objects, "build object manifest omits import: " + module)
        built = objects[module]
        for key in ("source_sha256", "olean_sha256"):
            require(built.get(key) == record.get(key),
                    f"{kind} build/run {key} mismatch: {module}")


def check_command(command: list, harness: str, arguments: tuple[str, ...] = ()) -> None:
    require(isinstance(command, list) and len(command) == 5 + len(arguments),
            "unexpected runtime command")
    require(command[1:4] == ["env", "lean", "--run"]
            and str(command[4]).replace("\\", "/").endswith("/" + harness)
            and command[5:] == list(arguments), "runtime command does not execute its declared harness")


def validate_outputs(kind: str, directory: Path, receipt: dict) -> None:
    """Recheck recorded outputs with the delivered independent fixture validators."""
    if kind == "suite":
        from lean_runtime_checks import FIXTURES, VALIDATORS
        require({path.name for path in directory.iterdir()} ==
                {"receipt.json", "inputs-before.json", "inputs-after.json", *(name + ".log" for name in FIXTURES)},
                "runtime suite file inventory mismatch")
        outcomes = receipt.get("outcomes", {})
        require(set(outcomes) == set(FIXTURES), "incomplete runtime fixture outcomes")
        require(receipt.get("full_encoder_execution") is False,
                "bounded runtime evidence claims a full encoder execution")
        for fixture, (harness, arguments) in FIXTURES.items():
            outcome = outcomes[fixture]
            require(outcome.get("status") == "PASS_DECLARED_CASES", "failed fixture: " + fixture)
            check_command(outcome.get("command"), "tests/lean/" + harness, tuple(arguments))
            log = checked_file(directory, fixture + ".log")
            require(outcome.get("log_sha256") == sha256(log), "fixture log hash mismatch: " + fixture)
            require(VALIDATORS[fixture](log.read_text(encoding="utf-8")) == outcome.get("results"),
                    "fixture results differ from the transcript: " + fixture)
    elif kind == "worked_trace":
        from verify_root_reset_worked_trace import validate
        check_command(receipt.get("command"), SPECS[kind]["harnesses"][0])
        require(receipt.get("lean_returncode") == 0 and receipt.get("timed_out") is False
                and receipt.get("source_and_imports_stable") is True,
                "worked trace did not complete with stable inputs")
        log = checked_file(directory, "trace.jsonl")
        require(receipt.get("trace_sha256") == sha256(log), "worked trace hash mismatch")
        with tempfile.TemporaryDirectory(prefix="pure-s-runtime-replay-") as temporary:
            output = Path(temporary)
            require(validate(log, output) == receipt.get("results"),
                    "worked trace results differ from literal replay")
            for name in ("contractions.json", "first-invocation.json"):
                require(json.loads((output / name).read_text(encoding="utf-8")) ==
                        json.loads(checked_file(directory, name).read_text(encoding="utf-8")),
                        "worked trace replay artifact mismatch: " + name)
    else:
        from verify_deterministic_tape_examples import cases, expected_records
        check_command(receipt.get("command"), SPECS[kind]["harnesses"][0])
        expected, coverage = expected_records()
        require(checked_file(directory, "source-rows.log").read_text(encoding="utf-8").splitlines() == expected,
                "source examples disagree with the independent tape model")
        require(read_json(checked_file(directory, "coverage.json")) == json.loads(json.dumps(coverage)),
                "source-example coverage differs from the independent tape model")
        require(receipt.get("cases") == len(cases()) and receipt.get("expected_records") == len(expected)
                and receipt.get("actual_records") == len(expected) and receipt.get("inputs_stable") is True
                and receipt.get("fresh_transitive_import_rebuild") is False,
                "source-example receipt scope or completion mismatch")


def validate_run(root: Path, kind: str, directory: Path, *, objects: dict | None = None,
                 tools: dict | None = None) -> dict:
    receipt = read_json(checked_file(directory, "receipt.json"))
    require(receipt.get("status") == SPECS[kind]["status"] and not receipt.get("failures"),
            kind + " is not a successful completed run")
    before = checked_file(directory, "inputs-before.json")
    after = checked_file(directory, "inputs-after.json")
    require(before.read_bytes() == after.read_bytes(), kind + " inputs changed during execution")
    if kind != "source_examples":
        require(receipt.get("input_manifest_sha256") == sha256(before),
                kind + " receipt input-manifest hash mismatch")
    snapshot = read_json(before)
    closure = validate_source_snapshot(root, kind, snapshot)
    if objects is not None:
        validate_built_objects(kind, snapshot, objects)
        for tool in ("lake_sha256", "lean_sha256"):
            require(snapshot[tool] == tools.get(tool), kind + " tool differs from the fresh build: " + tool)
    if kind != "suite":
        artifacts = receipt.get("artifacts")
        expected_artifacts = {path.name for path in directory.iterdir()
                              if path.is_file() and path.name != "receipt.json"}
        require(isinstance(artifacts, dict) and set(artifacts) == expected_artifacts,
                kind + " artifact inventory mismatch")
        verify_hashes(directory, artifacts, label=kind + " artifact")
    validate_outputs(kind, directory, receipt)
    return {"modules": len(closure), "completed_utc": receipt.get("completed_utc")}


def timestamp(value: str) -> datetime:
    require(isinstance(value, str), "missing command timestamp")
    result = datetime.fromisoformat(value)
    require(result.tzinfo is not None, "command timestamp lacks a timezone")
    return result


def validate_command(build: Path, record: dict) -> tuple[datetime, datetime]:
    require(isinstance(record, dict) and record.get("returncode") == 0,
            "fresh runtime command did not complete successfully")
    argv = record.get("argv")
    require(isinstance(argv, list) and argv and all(isinstance(part, str) for part in argv),
            "missing fresh runtime command arguments")
    require(isinstance(record.get("cwd"), str) and PurePosixPath(record["cwd"]).is_absolute(),
            "missing fresh runtime command directory")
    start, finish = timestamp(record.get("started_utc")), timestamp(record.get("finished_utc"))
    require(start <= finish, "reversed command timestamps")
    for stream in ("stdout", "stderr"):
        output = record.get(stream, {})
        path = checked_file(build, output.get("file"))
        require(output.get("sha256") == sha256(path) and output.get("bytes") == path.stat().st_size,
                "fresh runtime command stream mismatch: " + stream)
    return start, finish


def absolute_posix(path: str, base: str = "") -> str:
    require(isinstance(path, str) and bool(path) and "\\" not in path,
            "invalid measured Linux path")
    full = path if path.startswith("/") else posixpath.join(base, path)
    require(full.startswith("/"), "relative measured Linux path without a directory")
    return posixpath.normpath(full)


def validate_resolver(root: Path, build: Path, record: dict, *, harnesses: tuple[str, ...],
                      objects: dict, source_root: str, runtime: dict,
                      build_finished: datetime, run_started: datetime) -> None:
    lake, python = runtime["lake"]["path"], runtime["python"]["path"]
    lean = runtime["lean"]["path"]
    cwd = source_root + "/formalization"
    logical_project = cwd + "/.lake/build/lib/lean"
    require(record.get("project_object_logical_root") == logical_project,
            "resolver logical object directory differs from its build source")
    project = absolute_posix(record.get("project_object_root"))
    require(PurePosixPath(project).is_relative_to(PurePosixPath(source_root).parent),
            "resolved project objects are outside the fresh runtime workspace")
    toolchain = str(PurePosixPath(lake).parent.parent)
    environment_command = record.get("environment_command", {})
    started, finished = validate_command(build, environment_command)
    require(build_finished <= started <= finished <= run_started,
            "resolver measurement is outside the build/run interval")
    require(environment_command["cwd"] == cwd
            and environment_command["argv"][:5] == [lake, "env", python, "-B", "-c"],
            "resolver command uses a different runtime or source tree")
    environment = read_json(checked_file(build, environment_command["stdout"]["file"]))
    require(record.get("environment") == environment and environment.get("cwd") == cwd
            and environment.get("lean") == lean,
            "measured Lake environment differs from the resolver record")
    require(isinstance(environment.get("LEAN_PATH"), str), "resolver has no Lean import search path")
    logical_search = [absolute_posix(path, cwd) for path in environment["LEAN_PATH"].split(":") if path]
    bindings = record.get("search_path_bindings", [])
    require(isinstance(bindings, list) and len(bindings) == len(logical_search)
            and [absolute_posix(item.get("logical")) for item in bindings] == logical_search,
            "resolver path bindings differ from the measured Lean search path")
    search = [absolute_posix(item.get("resolved")) for item in bindings]
    require(any(logical == logical_project and resolved == project
                for logical, resolved in zip(logical_search, search)),
            "resolver lacks the fresh logical-to-physical object path binding")
    require(record.get("search_path") == search and project in search
            and all(path == project or PurePosixPath(path).is_relative_to(toolchain) for path in search),
            "resolver permits an import path outside the fresh project and pinned toolchain")
    resolved = record.get("project_object_resolution", {})
    require(set(resolved) == set(objects), "resolver omits a transitive project object")
    for module, obj in objects.items():
        require(resolved[module] == {
            "path": project + "/" + module.replace(".", "/") + ".olean",
            "sha256": obj["olean_sha256"],
        }, "resolved project object differs from the fresh build: " + module)
    dependencies = record.get("harness_dependencies", {})
    require(set(dependencies) == set(harnesses), "resolver harness inventory mismatch")
    for harness in harnesses:
        dependency = dependencies[harness]
        command = dependency.get("command", {})
        started, finished = validate_command(build, command)
        require(build_finished <= started <= finished <= run_started,
                "dependency measurement is outside the build/run interval")
        require(command["cwd"] == cwd and command["argv"] ==
                [lake, "env", "lean", "--deps", source_root + "/" + harness],
                "dependency command does not inspect its declared harness")
        paths = []
        for line in checked_file(build, command["stdout"]["file"]).read_text(encoding="utf-8").splitlines():
            path = absolute_posix(line, cwd)
            for logical, resolved in sorted(zip(logical_search, search), key=lambda pair: -len(pair[0])):
                if PurePosixPath(path).is_relative_to(logical):
                    path = str(PurePosixPath(resolved) / PurePosixPath(path).relative_to(logical))
                    break
            paths.append(path)
        listed = dependency.get("dependencies", [])
        require(isinstance(listed, list) and [item.get("path") for item in listed] == paths,
                "Lean dependency output differs from its manifest")
        for item in listed:
            path = item["path"]
            require(isinstance(item.get("sha256"), str) and SHA256.fullmatch(item["sha256"]) is not None,
                    "invalid measured dependency hash")
            if PurePosixPath(path).is_relative_to(project):
                relative = str(PurePosixPath(path).relative_to(project))
                require(relative.endswith(".olean"), "unexpected project dependency artifact")
                module = relative[:-6].replace("/", ".")
                require(module in objects and objects[module]["olean_sha256"] == item["sha256"],
                        "Lean dependency differs from the fresh object: " + module)
            else:
                require(PurePosixPath(path).is_relative_to(toolchain),
                        "Lean dependency resolves outside the pinned toolchain")
        direct = {project + "/" + module.replace(".", "/") + ".olean"
                  for module in header_imports(checked_file(root, harness).read_text(encoding="utf-8"))
                  if module in objects}
        require(direct <= set(paths), "Lean dependency listing omits a direct project import")


def validate_environment(root: Path, summary: dict) -> dict:
    from toolchain_lock import parse_lock
    lock = parse_lock(root / "TOOLCHAIN.lock")
    before = summary.get("canonical_environment_before")
    require(isinstance(before, dict) and before == summary.get("canonical_environment_after")
            and before.get("schema") == "PURE_S_VERIFICATION_ENVIRONMENT_V1"
            and before.get("canonical") is True and before.get("lock_sha256") == lock.sha256,
            "fresh runtime canonical environment or lock changed")
    environment = before.get("runtime", {})
    expected = {
        "implementation": lock["verification-python-implementation"],
        "python": lock["verification-python"], "system": "Linux", "machine": "x86_64",
        "timezone": lock["timezone"], "source_date_epoch": lock["source-date-epoch"],
        "python_hash_seed": lock["python-hash-seed"], "canonical_container": "1",
    }
    require(all(environment.get(key) == value for key, value in expected.items())
            and lock["locale"] in str(environment.get("locale", "")),
            "fresh runtime does not match the canonical environment")
    require(lock["lean"] in environment.get("tools", {}).get("Lean", "")
            and lock["lean-commit"] in environment.get("tools", {}).get("Lean", "")
            and lock["lake"] in environment.get("tools", {}).get("Lake", ""),
            "fresh runtime tool versions do not match the lock")
    runtime = summary.get("runtime_before")
    require(isinstance(runtime, dict) and runtime == summary.get("runtime_after")
            and set(runtime) == {"python", "lake", "lean"}, "fresh runtime executable identities changed")
    for name, tool in runtime.items():
        require(isinstance(tool, dict) and set(tool) == {"path", "resolved", "sha256"}
                and absolute_posix(tool["path"]) == tool["path"]
                and absolute_posix(tool["resolved"]) == tool["resolved"]
                and isinstance(tool["sha256"], str) and SHA256.fullmatch(tool["sha256"]) is not None,
                "invalid fresh runtime executable identity: " + name)
    require(str(PurePosixPath(runtime["lake"]["path"]).with_name("lean")) == runtime["lean"]["path"],
            "Lean and Lake do not belong to the same toolchain")
    return runtime


def validate_build(root: Path, build: Path) -> tuple[dict, dict, dict]:
    summary = read_json(checked_file(build, "summary.json"))
    require(summary.get("schema") == "PURE_S_FRESH_RUNTIME_BUILD_V1"
            and summary.get("status") == "PASS_FRESH_RUNTIME_BUILD_AND_RUNS",
            "fresh runtime build is not complete")
    for field in ("fresh_empty_build_tree", "sources_unchanged", "objects_unchanged", "runtime_unchanged"):
        require(summary.get(field) is True, "fresh runtime build lacks " + field)
    formal = read_json(checked_file(root, "evidence/formal/summary.json"))
    require(summary.get("image_id") == formal.get("image_id"), "fresh runtime image differs from the pinned environment")
    before = checked_file(build, "sources-before.json")
    after = checked_file(build, "sources-after.json")
    require(before.read_bytes() == after.read_bytes() and summary.get("source_manifest_sha256") == sha256(before),
            "fresh runtime source manifests differ")
    sources = read_json(before)
    harnesses = (*SPECS["suite"]["harnesses"], *SPECS["worked_trace"]["harnesses"])
    modules = project_sources(root, harnesses)
    helpers = python_sources(root, (SPECS["suite"]["runner"], SPECS["worked_trace"]["runner"],
                                    "src/check_environment.py", "src/replay_scope.py"))
    expected = {*LAKE_INPUTS, "TOOLCHAIN.lock", *harnesses, *helpers,
                *("formalization/" + module.replace(".", "/") + ".lean" for module in modules)}
    require(set(sources) == expected, "fresh runtime source/helper manifest omits or adds inputs")
    verify_hashes(root, sources, label="fresh runtime source")
    require(summary.get("source_files") == len(sources) and summary.get("project_modules") == sorted(modules)
            and summary.get("harnesses") == list(harnesses) and summary.get("runner_helpers") == sorted(helpers),
            "fresh runtime source coverage differs from the derived closure")
    require(summary.get("driver_sha256") == sha256(checked_file(build, "driver.py")),
            "fresh runtime capture driver hash mismatch")
    object_before = checked_file(build, "objects-before-runs.json")
    require(object_before.read_bytes() == checked_file(build, "objects-after-runs.json").read_bytes(),
            "compiled objects changed across runtime executions")
    objects = read_json(object_before)
    require(set(objects) == set(modules), "fresh build object closure differs from the harness imports")
    for module, obj in objects.items():
        require(isinstance(obj, dict) and set(obj) == {"source_sha256", "olean_sha256", "ilean_sha256"}
                and obj["source_sha256"] == modules[module]
                and all(isinstance(value, str) and SHA256.fullmatch(value) is not None for value in obj.values()),
                "invalid fresh build object identity: " + module)
    runtime = validate_environment(root, summary)
    source_root = absolute_posix(summary.get("source_root"))
    mount = summary.get("source_mount", {})
    require(mount.get("RW") is False and mount.get("Type") == "bind"
            and PurePosixPath(source_root).is_relative_to(absolute_posix(mount.get("Destination")) + "/.work"),
            "fresh runtime source is not inside the measured read-only package's workspace")
    build_command = summary.get("build_command", {})
    build_started, build_finished = validate_command(build, build_command)
    targets = sorted({module for harness in harnesses
                      for module in header_imports(checked_file(root, harness).read_text(encoding="utf-8"))
                      if module in modules})
    require(summary.get("build_targets") == targets
            and build_command["argv"] == [runtime["lake"]["path"], "build", *targets]
            and build_command["cwd"] == source_root + "/formalization",
            "fresh build command does not build the harness roots")
    require(set(summary.get("executions", {})) == {"suite", "worked_trace"}
            and set(summary.get("resolver", {})) == {"before_suite", "before_worked_trace"},
            "fresh build lacks both runtime executions and import-resolution records")
    for kind in ("suite", "worked_trace"):
        command = summary["executions"][kind]
        started, finished = validate_command(build, command)
        require(build_finished <= started <= finished <= timestamp(summary.get("finished_utc"))
                and timestamp(summary.get("started_utc")) <= build_started,
                "fresh build/runtime command chronology mismatch")
        args = [runtime["python"]["path"], "-B", source_root + "/" + SPECS[kind]["runner"],
                "--lake", runtime["lake"]["path"]]
        if kind == "suite":
            args += ["--jobs", "2"]
        require(command["argv"] == args and command["cwd"] == source_root,
                "fresh execution command uses a different runner or tree")
        validate_resolver(root, build, summary["resolver"]["before_" + kind],
                          harnesses=SPECS[kind]["harnesses"], objects=objects, source_root=source_root,
                          runtime=runtime, build_finished=build_finished, run_started=started)
    return summary, objects, {name + "_sha256": runtime[name]["sha256"] for name in ("lake", "lean")}


def check_runtime_evidence(root: Path = ROOT) -> dict:
    runtime_root = root / "evidence/runtime"
    index = read_json(checked_file(runtime_root, "index.json"))
    require(index.get("schema") == "PURE_S_RUNTIME_EVIDENCE_V1" and index.get("build") == "build"
            and set(index.get("runs", {})) == set(SPECS), "invalid runtime evidence index")
    require(len(set(index["runs"].values())) == len(SPECS), "runtime evidence reuses a run directory")
    require({path.name for path in runtime_root.iterdir()} ==
            {"README.md", "index.json", "build", *index["runs"].values()},
            "runtime evidence contains an unindexed file or run directory")
    summary, objects, tools = validate_build(root, runtime_root / "build")
    results = {}
    for kind in SPECS:
        directory = checked_file(runtime_root, index["runs"][kind] + "/receipt.json").parent
        if kind in summary["executions"]:
            command = summary["executions"][kind]
            receipt = read_json(directory / "receipt.json")
            require(command.get("run_directory") == index["runs"][kind]
                    and command.get("receipt_sha256") == sha256(directory / "receipt.json")
                    and command.get("input_manifest_sha256") == sha256(directory / "inputs-before.json"),
                    "fresh build links a different runtime receipt: " + kind)
            require(timestamp(command["started_utc"]) <= timestamp(receipt.get("completed_utc"))
                    <= timestamp(command["finished_utc"]),
                    "runtime receipt completion is outside its measured execution interval")
            commands = ([outcome.get("command") for outcome in receipt.get("outcomes", {}).values()]
                        if kind == "suite" else [receipt.get("command")])
            for invocation in commands:
                require(isinstance(invocation, list) and len(invocation) >= 5
                        and invocation[0] == summary["runtime_before"]["lake"]["path"]
                        and invocation[4] in {summary["source_root"] + "/" + name for name in SPECS[kind]["harnesses"]},
                        "recorded runtime harness command resolves outside its measured source tree")
        results[kind] = validate_run(root, kind, directory,
                                     objects=objects if kind != "source_examples" else None, tools=tools)
    print("PASS runtime evidence: exact source closures, fresh build/object resolution, and recorded fixture outputs")
    return results


if __name__ == "__main__":
    try:
        if (ROOT / "TOOLCHAIN.lock").read_text().startswith("verification-profile: "):
            from release_verification import check_runtime, source_binding
            source_binding()
            check_runtime()
        else:
            check_runtime_evidence()
    except (ValueError, OSError, KeyError, TypeError) as error:
        raise SystemExit("FAIL runtime evidence: " + str(error)) from None
