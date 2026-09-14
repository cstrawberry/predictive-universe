#!/usr/bin/env python3
"""Explicit, source-locked native Windows verifier profile.

The Linux lock is unchanged.  Native checkers use a separately identified recipe
with deterministic PE timestamps and separately pinned executable hashes.
"""
from __future__ import annotations

from dataclasses import dataclass
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import platform
import re
import subprocess
import sys

from checker_provenance import BuiltChecker, attach_locked_dependency_metadata, export_locked_tree, sha256_file
from local_workspace import LocalWorkspace, absolute_lake
from toolchain_lock import LockError, ToolchainLock, verify_git_source

SCHEMA = "PURE_S_WINDOWS_VERIFICATION_PROFILE_V1"
RECEIPT_SCHEMA = "PURE_S_WINDOWS_ACTIVE_REPLAY_RECEIPT_V1"
RECEIPT_PREFIX = "WINDOWS_ACTIVE_REPLAY_RECEIPT "
COMPILER_OVERRIDE = "+-Wl,--no-insert-timestamp"
HEX64 = re.compile(r"[0-9a-f]{64}")
NATIVE_OVERRIDE_VARIABLES = (
    "LEAN", "LAKE", "ELAN_TOOLCHAIN", "LEAN_SYSROOT", "LEAN_PATH", "LEAN_SRC_PATH", "LAKE_PACKAGES_DIR",
    "LEAN_OPTS", "LEAN_CC", "LEAN_AR", "LEAN_ABORT_ON_PANIC", "CC", "AR", "CCC_OVERRIDE_OPTIONS",
    "CLANG_CONFIG_FILE_USER_DIR", "CLANG_CONFIG_FILE_SYSTEM_DIR",
)


def native_environment(lake: str, inherited: dict[str, str] | None = None) -> dict[str, str]:
    """Select the pinned installation for every child, ignoring caller overrides."""
    installed = Path(absolute_lake(lake))
    environment = LocalWorkspace().environment(inherited)
    for name in NATIVE_OVERRIDE_VARIABLES:
        environment.pop(name, None)
    environment["LEAN_SYSROOT"] = str(installed.parent.parent)
    environment["PATH"] = str(installed.parent) + os.pathsep + environment.get("PATH", "")
    return environment


def activate_native_environment(lake: str) -> None:
    environment = native_environment(lake)
    for name in NATIVE_OVERRIDE_VARIABLES:
        os.environ.pop(name, None)
    os.environ.update(environment)


def recipe(name: str) -> str:
    if name not in {"lean4checker", "lean4lean"}:
        raise LockError(f"unknown native checker {name!r}")
    return f"CCC_OVERRIDE_OPTIONS={COMPILER_OVERRIDE} lake build {name}\n"


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise LockError(message)


def _pairs(pairs: list[tuple[str, object]]) -> dict[str, object]:
    result: dict[str, object] = {}
    for key, value in pairs:
        _require(key not in result, f"duplicate Windows profile key {key!r}")
        result[key] = value
    return result


def _keys(value: object, expected: set[str], label: str) -> dict:
    _require(type(value) is dict and set(value) == expected, f"{label}: fields differ")
    assert isinstance(value, dict)
    return value


def _digest(value: object, label: str) -> str:
    _require(isinstance(value, str) and HEX64.fullmatch(value) is not None and value != "0" * 64,
             f"{label}: invalid SHA-256")
    assert isinstance(value, str)
    return value


@dataclass(frozen=True)
class WindowsProfile:
    path: Path
    values: dict
    sha256: str


def parse_profile(path: Path, lock: ToolchainLock) -> WindowsProfile:
    raw = path.read_bytes()
    try:
        value = json.loads(raw, object_pairs_hook=_pairs)
    except (UnicodeDecodeError, json.JSONDecodeError) as error:
        raise LockError(f"invalid Windows profile JSON: {error}") from None
    record = _keys(value, {"schema", "platform", "toolchain_lock_sha256", "python", "lean_files", "checkers"}, "Windows profile")
    _require(record["schema"] == SCHEMA and record["platform"] == "windows/amd64", "wrong Windows profile schema or platform")
    _require(record["toolchain_lock_sha256"] == lock.sha256, "Windows profile is not bound to TOOLCHAIN.lock")
    python = _keys(record["python"], {"implementation", "version", "executable_sha256", "runtime_dll_sha256"}, "Windows Python")
    _require(python["implementation"] == "CPython" and isinstance(python["version"], str)
             and re.fullmatch(r"[0-9]+\.[0-9]+\.[0-9]+", python["version"]) is not None,
             "invalid Windows Python implementation or version")
    _require(tuple(map(int, python["version"].split("."))) >= tuple(map(int, lock["verifier-python-minimum"].split("."))),
             "Windows Python is below the locked verifier minimum")
    _digest(python["executable_sha256"], "Python executable")
    _digest(python["runtime_dll_sha256"], "Python runtime DLL")
    files = record["lean_files"]
    _require(type(files) is dict and bool(files), "Windows Lean file manifest must be nonempty")
    for name, digest in files.items():
        path_name = PurePosixPath(name)
        _require(isinstance(name, str) and path_name.as_posix() == name and not path_name.is_absolute()
                 and not any(part in {"", ".", ".."} or ":" in part or "\\" in part for part in path_name.parts),
                 f"unsafe Windows Lean file path {name!r}")
        _digest(digest, name)
    _require({"bin/lean.exe", "bin/lake.exe", "bin/clang.exe", "bin/ld.lld.exe", "bin/llvm-ar.exe",
              "bin/libleanshared.dll", "bin/libInit_shared.dll", "bin/libLLVM-15.dll", "bin/libclang-cpp.dll"} <= set(files),
             "Windows Lean manifest omits required native tools")
    checkers = _keys(record["checkers"], {"lean4checker", "lean4lean"}, "Windows checkers")
    for name, checker in checkers.items():
        checker = _keys(checker, {"recipe", "recipe_sha256", "binary_sha256"}, name)
        _require(checker["recipe"] == recipe(name), f"{name}: unrecognized Windows recipe")
        _require(checker["recipe_sha256"] == hashlib.sha256(recipe(name).encode()).hexdigest(), f"{name}: Windows recipe hash differs")
        _digest(checker["binary_sha256"], name)
    return WindowsProfile(path.resolve(strict=True), record, hashlib.sha256(raw).hexdigest())


def fingerprint(profile: WindowsProfile, lock: ToolchainLock, lake: str) -> dict:
    """Reject a foreign OS or any changed executable/runtime input."""
    _require(os.name == "nt" and platform.system() == "Windows" and platform.machine().lower() in {"amd64", "x86_64"},
             "Windows profile requires native Windows AMD64")
    _require(__debug__ and not os.environ.get("PYTHONOPTIMIZE"), "Windows verification requires assertions")
    _require(not os.environ.get("PURE_S_CANONICAL_CONTAINER"), "Windows profile cannot claim a canonical Linux container")
    expected = profile.values["python"]
    _require(platform.python_implementation() == expected["implementation"] and platform.python_version() == expected["version"],
             "Windows Python runtime differs from profile")
    executable = Path(sys.executable).resolve(strict=True)
    runtime_dll = executable.with_name(f"python{sys.version_info.major}{sys.version_info.minor}.dll")
    _require(sha256_file(executable) == expected["executable_sha256"] and sha256_file(runtime_dll) == expected["runtime_dll_sha256"],
             "Windows Python binary digest differs from profile")
    lean_root = Path(absolute_lake(lake)).parent.parent
    actual = {path.relative_to(lean_root).as_posix(): sha256_file(path)
              for path in lean_root.rglob("*") if path.is_file() and not path.is_symlink()}
    _require(not any(path.is_symlink() for path in lean_root.rglob("*")), "Windows Lean distribution contains symbolic links")
    _require(actual == profile.values["lean_files"], "Windows Lean distribution differs from exact profile manifest")
    for tool, fragments in (("lean.exe", (lock["lean"], lock["lean-commit"])), ("lake.exe", (lock["lake"], lock["lean"]))):
        result = subprocess.run([str(lean_root / "bin" / tool), "--version"], capture_output=True, text=True, check=True)
        _require(all(fragment in result.stdout for fragment in fragments), f"native {tool} version differs")
    _require(sha256_file(profile.path) == profile.sha256, "Windows profile changed during validation")
    return {"schema": "PURE_S_WINDOWS_VERIFICATION_ENVIRONMENT_V1", "canonical": False,
            "profile": "windows-native", "profile_sha256": profile.sha256, "lock_sha256": lock.sha256,
            "runtime": {"system": platform.system(), "machine": platform.machine(), "platform": platform.platform(),
                        "implementation": platform.python_implementation(), "python": platform.python_version()},
            "lean_file_count": len(actual)}


def build_checker(lock: ToolchainLock, name: str, caller_source: Path, private_root: Path, lake: str,
                  *, batteries_source: Path | None = None, expected_sha256: str | None = None) -> BuiltChecker:
    """Build unchanged locked sources with the explicit deterministic PE recipe.

    An absent expected digest is permitted only for profile preparation; runners
    must supply the validated profile's pinned digest before accepting a replay.
    """
    workspace = LocalWorkspace()
    workspace.activate()
    private_root = workspace.output(private_root)
    lake = absolute_lake(lake)
    caller_source = caller_source.resolve(strict=True)
    verify_git_source(lock, name, caller_source)
    private_source = private_root / name
    export_locked_tree(caller_source, lock[f"{name}-commit"], private_source)
    if name == "lean4lean":
        _require(batteries_source is not None, "native lean4lean requires locked Batteries")
        assert batteries_source is not None
        batteries_target = private_source / ".lake/packages/batteries"
        export_locked_tree(batteries_source, lock["lean4lean-batteries-commit"], batteries_target)
        attach_locked_dependency_metadata(lock, "lean4lean-batteries", batteries_source, batteries_target)
    environment = native_environment(lake)
    environment["CCC_OVERRIDE_OPTIONS"] = COMPILER_OVERRIDE
    environment["PATH"] = str(Path(lake).parent) + os.pathsep + environment.get("PATH", "")
    result = subprocess.run([lake, "build", name], cwd=private_source, env=environment,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, encoding="utf-8", errors="replace")
    print(result.stdout, end="", flush=True)
    _require(result.returncode == 0, f"native {name} build failed")
    verify_git_source(lock, name, caller_source)
    if batteries_source is not None:
        verify_git_source(lock, "lean4lean-batteries", batteries_source)
        verify_git_source(lock, "lean4lean-batteries", private_source / ".lake/packages/batteries")
    binary = private_source / (lock[f"{name}-executable"] + ".exe")
    _require(binary.is_file() and not binary.is_symlink() and binary.read_bytes()[:2] == b"MZ", f"native {name} did not create a regular PE executable")
    binary_digest = sha256_file(binary)
    if expected_sha256 is not None:
        _require(binary_digest == expected_sha256, f"native {name} executable differs from Windows profile")
    return BuiltChecker(name, lock[f"{name}-commit"], lock[f"{name}-tree"], lock[f"{name}-source-sha256"],
                        hashlib.sha256(recipe(name).encode()).hexdigest(), binary, binary_digest)


def receipt_line(receipt: dict, profile: WindowsProfile) -> str:
    record = dict(receipt)
    record["schema"] = RECEIPT_SCHEMA
    record["windows_profile_sha256"] = profile.sha256
    return RECEIPT_PREFIX + json.dumps(record, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def validate_grouped_replay(value: object, replays: object, roots: tuple[str, ...],
                            project_imports: dict[str, tuple[str, ...]]) -> dict:
    """Check root coverage against source imports, separately from invocation count."""
    from grouped_replay import SCHEMA as GROUP_SCHEMA
    from replay_scope import MODULE, dependency_closure
    grouped = _keys(value, {"schema", "original_ordered_roots", "expected_project_closure",
        "actual_invocation_modules", "actual_invocation_count", "groups", "attempts",
        "artifact_bindings", "absent_project_artifacts"}, "grouped native replay")
    expected = dependency_closure(project_imports, roots)
    _require(grouped["schema"] == GROUP_SCHEMA and grouped["original_ordered_roots"] == list(roots),
             "grouped replay original root scope differs")
    _require(grouped["expected_project_closure"] == list(expected), "grouped replay source dependency coverage differs")
    groups = grouped["groups"]
    _require(type(groups) is list and bool(groups), "grouped replay has no actual groups")
    bindings = grouped["artifact_bindings"]
    _require(type(bindings) is list and bool(bindings), "grouped replay has no bound artifacts")
    bound: dict[str, str] = {}
    for item in bindings:
        item = _keys(item, {"path", "sha256"}, "grouped artifact")
        _require(type(item["path"]) is str and bool(item["path"]), "grouped artifact path is absent")
        path = item["path"].replace("\\", "/")
        _require(path not in bound, "grouped artifact path is duplicated")
        bound[path] = _digest(item["sha256"], "grouped artifact")
    def bound_suffix(suffix: str, digest: str | None = None) -> None:
        matches = [value for path, value in bound.items() if path.endswith("/" + suffix)]
        _require(len(matches) == 1 and (digest is None or matches == [digest]),
                 "grouped replay lacks a uniquely bound artifact: " + suffix)
    for name in expected:
        bound_suffix(".lake/build/lib/lean/" + name.replace(".", "/") + ".olean")
    modules: list[str] = []
    partition: list[str] = []
    for group in groups:
        group = _keys(group, {"module", "roots", "source_sha256", "olean_sha256", "own_declarations",
            "direct_compiled_imports", "actual_imported_modules", "coverage_log_sha256"}, "native replay group")
        module, members = group["module"], group["roots"]
        _require(type(module) is str and re.fullmatch(r"PureSNativeReplayGroup[0-9]{3,}", module) is not None
                 and module not in project_imports and module not in modules, "invalid or duplicate replay group name")
        _require(type(members) is list and bool(members) and all(type(name) is str and name in roots for name in members),
                 "grouped replay contains an unexpected root")
        _require(type(group["own_declarations"]) is int and group["own_declarations"] == 0,
                 "group must have zero own declarations")
        _require(group["direct_compiled_imports"] == ["Init", *members], "group direct compiled imports differ")
        actual = group["actual_imported_modules"]
        _require(type(actual) is list and all(type(name) is str and MODULE.fullmatch(name) for name in actual)
                 and actual == sorted(set(actual)), "group actual import metadata is malformed")
        _require({name for name in actual if name in project_imports} == set(dependency_closure(project_imports, tuple(members))),
                 "group compiled dependency coverage differs from source imports")
        source_digest = hashlib.sha256("".join(f"import {name}\n" for name in members).encode()).hexdigest()
        _require(group["source_sha256"] == source_digest, "group source is not the exact import-only root list")
        bound_suffix(module + ".lean", source_digest)
        bound_suffix(module + ".olean", _digest(group["olean_sha256"], "group object"))
        bound_suffix(module + ".coverage.log", _digest(group["coverage_log_sha256"], "group metadata log"))
        modules.append(module)
        partition.extend(members)
    _require(partition == list(roots), "group partition loses, duplicates or reorders original roots")
    _require(grouped["actual_invocation_modules"] == modules and type(grouped["actual_invocation_count"]) is int
             and grouped["actual_invocation_count"] == len(modules), "group actual invocation count or order differs")
    _require(type(replays) is list and len(replays) == len(modules), "group replay results are incomplete")
    for module, replay in zip(modules, replays):
        replay = _keys(replay, {"module", "returncode", "output_sha256"}, "group replay result")
        _require(replay["module"] == module and type(replay["returncode"]) is int and replay["returncode"] == 0,
                 "group checker invocation failed or was reordered")
        _digest(replay["output_sha256"], "group checker output")
    attempts = grouped["attempts"]
    _require(type(attempts) is list and bool(attempts), "group preparation attempts are absent")
    successful: list[str] = []
    for attempt in attempts:
        attempt = _keys(attempt, {"module", "roots", "returncode", "source_sha256", "build_log_sha256"}, "group preparation attempt")
        _require(type(attempt["module"]) is str and type(attempt["roots"]) is list
                 and all(type(name) is str and name in roots for name in attempt["roots"])
                 and type(attempt["returncode"]) is int, "invalid group preparation attempt")
        bound_suffix(attempt["module"] + ".build.log", _digest(attempt["build_log_sha256"], "group build log"))
        bound_suffix(attempt["module"] + ".lean", _digest(attempt["source_sha256"], "group build source"))
        if attempt["returncode"] == 0:
            successful.append(attempt["module"])
    _require(successful == modules, "successful group preparation differs from actual invocations")
    absent = grouped["absent_project_artifacts"]
    _require(type(absent) is list and all(type(path) is str for path in absent) and len(set(absent)) == len(absent),
             "group missing-artifact guards are malformed")
    for group in groups:
        for name in group["actual_imported_modules"]:
            if name not in project_imports:
                suffix = "/.lake/build/lib/lean/" + name.replace(".", "/") + ".olean"
                _require(any(path.replace("\\", "/").endswith(suffix) for path in absent),
                         "group lacks an import-shadowing guard for " + name)
    return grouped


def parse_receipt(transcript: str, *, profile: WindowsProfile, lock: ToolchainLock,
                  source_sha256: str, lean4checker_roots, lean4lean_modules,
                  project_imports: dict[str, tuple[str, ...]]) -> dict:
    """Require a complete native receipt bound to the profile and actual scope."""
    lines = [line for line in transcript.splitlines() if line.startswith(RECEIPT_PREFIX)]
    _require(len(lines) == 1, "log must contain exactly one Windows active replay receipt")
    try:
        record = json.loads(lines[0][len(RECEIPT_PREFIX):], object_pairs_hook=_pairs)
    except json.JSONDecodeError as error:
        raise LockError(f"invalid Windows receipt JSON: {error}") from None
    record = _keys(record, {"schema", "result", "toolchain_lock_sha256", "environment_fingerprint_sha256",
                            "formal_source_tree_sha256", "windows_profile_sha256", "checkers"}, "Windows receipt")
    _require(lines[0] == receipt_line(record, profile), "Windows receipt is not canonical JSON")
    _require(record["schema"] == RECEIPT_SCHEMA and record["result"] == "success", "Windows receipt is not a successful recognized receipt")
    _require(record["toolchain_lock_sha256"] == lock.sha256 and record["windows_profile_sha256"] == profile.sha256,
             "Windows receipt source lock or profile digest differs")
    _require(record["formal_source_tree_sha256"] == _digest(source_sha256, "source digest"), "Windows receipt source digest differs")
    _digest(record["environment_fingerprint_sha256"], "environment fingerprint")
    for marker, expected in (("TOOLCHAIN_LOCK_SHA256", lock.sha256), ("WINDOWS_PROFILE_SHA256", profile.sha256),
                             ("FORMAL_SOURCE_TREE_SHA256", source_sha256),
                             ("ENVIRONMENT_FINGERPRINT_SHA256", record["environment_fingerprint_sha256"])):
        actual = set(re.findall(rf"^{marker} ([0-9a-f]{{64}})$", transcript, re.MULTILINE))
        _require(actual == {expected}, f"{marker} markers differ from native receipt")
    checkers = _keys(record["checkers"], {"lean4checker", "lean4lean"}, "Windows receipt checkers")
    for name, roots in (("lean4checker", tuple(lean4checker_roots)), ("lean4lean", tuple(lean4lean_modules))):
        fields = {"commit", "tree", "source_sha256", "build_recipe_sha256", "binary_sha256_before", "binary_sha256_after",
                  "negative_canary_rejected", "ordered_roots", "passed", "total", "invalid_proof_canary"}
        if name == "lean4lean":
            fields.add("dependency")
        else:
            fields.update({"grouped_replay", "group_replays"})
        checker = _keys(checkers[name], fields, f"Windows receipt {name}")
        for field, suffix in (("commit", "commit"), ("tree", "tree"), ("source_sha256", "source-sha256")):
            _require(checker[field] == lock[f"{name}-{suffix}"], f"{name}: locked source identity differs")
        native = profile.values["checkers"][name]
        _require(checker["build_recipe_sha256"] == native["recipe_sha256"], f"{name}: native recipe differs")
        _require(checker["binary_sha256_before"] == checker["binary_sha256_after"] == native["binary_sha256"],
                 f"{name}: native executable changed or differs from profile")
        _require(checker["negative_canary_rejected"] is True, f"{name}: negative canary was not rejected")
        from checker_canary import CANARY_MODULE, CANARY_SOURCE_SHA256
        canary = _keys(checker["invalid_proof_canary"], {"kind", "module", "source_sha256", "olean_sha256",
                        "positive_fresh_replay_passed", "kernel_type_mismatch_rejected", "mode", "diagnostic_sha256"}, "invalid-proof canary")
        _require(canary["kind"] == "compiled-ill-typed-declaration" and canary["module"] == CANARY_MODULE
                 and canary["source_sha256"] == CANARY_SOURCE_SHA256, f"{name}: invalid-proof canary identity differs")
        _require(canary["positive_fresh_replay_passed"] is True and canary["kernel_type_mismatch_rejected"] is True,
                 f"{name}: actual invalid-proof canary did not pass")
        _require(canary["mode"] == ("fresh" if name == "lean4checker" else "scoped"), f"{name}: invalid-proof canary used wrong replay mode")
        _digest(canary["olean_sha256"], "invalid-proof canary object")
        _digest(canary["diagnostic_sha256"], "invalid-proof canary diagnostic")
        _require(type(checker["ordered_roots"]) is list and tuple(checker["ordered_roots"]) == roots,
                 f"{name}: native replay scope differs")
        _require(type(checker["passed"]) is int and type(checker["total"]) is int
                 and checker["passed"] == checker["total"] == len(roots), f"{name}: native replay count differs")
        if name == "lean4lean":
            dependency = _keys(checker["dependency"], {"commit", "tree", "source_sha256"}, "native Batteries")
            for field, suffix in (("commit", "commit"), ("tree", "tree"), ("source_sha256", "source-sha256")):
                _require(dependency[field] == lock[f"lean4lean-batteries-{suffix}"], "native Batteries source identity differs")
        else:
            validate_grouped_replay(checker["grouped_replay"], checker["group_replays"], roots, project_imports)
    return record
