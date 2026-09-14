"""Reject an actually compiled ill-typed declaration from locked checker tests."""
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import os
import subprocess

from checker_provenance import BuiltChecker, export_locked_tree, sha256_file
from local_workspace import LocalWorkspace, absolute_lake
from toolchain_lock import LockError, ToolchainLock, verify_git_source

CANARY_MODULE = "Lean4CheckerTests.AddFalse"
CANARY_SOURCE_SHA256 = "6d1a27d8b361785528cd0972f0445de6455afc1bc09da7554a5ec32d5ee867e0"


@dataclass(frozen=True)
class Canary:
    source: Path
    olean: Path
    source_sha256: str
    olean_sha256: str


def prepare(lock: ToolchainLock, checker_source: Path, destination: Path, lake: str) -> Canary:
    workspace = LocalWorkspace()
    workspace.activate()
    destination = workspace.output(destination)
    lake = absolute_lake(lake)
    from windows_verification import native_environment
    verify_git_source(lock, "lean4checker", checker_source)
    export_locked_tree(checker_source, lock["lean4checker-commit"], destination)
    source_files = {path: sha256_file(path) for path in destination.rglob("*") if path.is_file()}
    result = subprocess.run([lake, "build", CANARY_MODULE], cwd=destination, capture_output=True,
                            env=native_environment(lake), text=True, encoding="utf-8", errors="replace")
    if result.returncode:
        raise LockError("locked invalid-proof canary did not compile:\n" + result.stdout + result.stderr)
    if any(sha256_file(path) != expected for path, expected in source_files.items()):
        raise LockError("canary build mutated its locked source export")
    verify_git_source(lock, "lean4checker", checker_source)
    source = destination / "Lean4CheckerTests/AddFalse.lean"
    olean = destination / ".lake/build/lib/lean/Lean4CheckerTests/AddFalse.olean"
    if not olean.is_file() or olean.is_symlink():
        raise LockError("invalid-proof canary object was not built")
    if sha256_file(source) != CANARY_SOURCE_SHA256:
        raise LockError("locked invalid-proof canary source differs from its explicit identity")
    return Canary(source, olean, sha256_file(source), sha256_file(olean))


def is_kernel_type_rejection(returncode: int, output: str) -> bool:
    """Missing imports, missing executables and successful exits never qualify."""
    return (returncode != 0 and "(kernel)" in output and "type mismatch" in output
            and "false" in output.lower())


def check(canary: Canary, checker: BuiltChecker, lake: str) -> dict:
    if checker.name not in {"lean4checker", "lean4lean"}:
        raise LockError(f"unknown invalid-proof canary checker {checker.name!r}")
    checker.verify_unchanged()
    if (canary.source_sha256 != CANARY_SOURCE_SHA256
            or sha256_file(canary.source) != canary.source_sha256
            or sha256_file(canary.olean) != canary.olean_sha256):
        raise LockError("invalid-proof canary source/object changed before replay")
    lake = absolute_lake(lake)
    root = Path(lake).parent.parent
    from windows_verification import native_environment
    environment = native_environment(lake)
    environment.update({"LEAN_SYSROOT": str(root), "LEAN_PATH": str(canary.olean.parents[1]),
                        "PATH": str(root / "bin") + os.pathsep + environment.get("PATH", "")})
    positive = subprocess.run([str(checker.binary), "--fresh", "Init.Prelude"], cwd=canary.source.parent,
                              env=environment, capture_output=True, text=True, encoding="utf-8", errors="replace")
    if positive.returncode:
        raise LockError(f"{checker.name}: positive canary failed:\n" + positive.stdout + positive.stderr)
    flags = ["--fresh"] if checker.name == "lean4checker" else []
    command = [str(checker.binary), *flags, CANARY_MODULE]
    negative = subprocess.run(command, cwd=canary.source.parent, env=environment, capture_output=True,
                              text=True, encoding="utf-8", errors="replace")
    diagnostic = negative.stdout + negative.stderr
    if not is_kernel_type_rejection(negative.returncode, diagnostic):
        raise LockError(f"{checker.name}: invalid proof was not rejected for a kernel type error:\n" + diagnostic)
    if sha256_file(canary.source) != canary.source_sha256 or sha256_file(canary.olean) != canary.olean_sha256:
        raise LockError("invalid-proof canary source/object changed during replay")
    checker.verify_unchanged()
    import hashlib
    return {"kind": "compiled-ill-typed-declaration", "module": CANARY_MODULE,
            "source_sha256": canary.source_sha256, "olean_sha256": canary.olean_sha256,
            "positive_fresh_replay_passed": True, "kernel_type_mismatch_rejected": True,
            "mode": "fresh" if flags else "scoped", "diagnostic_sha256": hashlib.sha256(diagnostic.encode()).hexdigest()}


def check_all(lock: ToolchainLock, source: Path | None, destination: Path, lake: str,
              checkers: tuple[BuiltChecker, ...]) -> dict[str, dict]:
    """Require the compiled canary for every requested checker on every platform."""
    if not checkers:
        return {}
    if source is None:
        raise LockError("checker replay requires --invalid-proof-canary-source or --lean4checker-source")
    canary = prepare(lock, source, destination, lake)
    return {checker.name: check(canary, checker, lake) for checker in checkers}
