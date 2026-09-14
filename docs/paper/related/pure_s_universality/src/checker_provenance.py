#!/usr/bin/env python3
"""Build replay checkers from locked Git objects in private directories."""

from __future__ import annotations

from dataclasses import dataclass
import hashlib
import io
import os
from pathlib import Path, PurePosixPath
import shutil
import subprocess
import tarfile

from toolchain_lock import LockError, ToolchainLock, verify_git_source


@dataclass(frozen=True)
class BuiltChecker:
    name: str
    source_commit: str
    source_tree: str
    source_sha256: str
    build_recipe_sha256: str
    binary: Path
    binary_sha256_before: str

    def verify_unchanged(self) -> str:
        after = sha256_file(self.binary)
        if after != self.binary_sha256_before:
            raise LockError(f"{self.name}: checker binary changed during replay")
        return after


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as source:
        for block in iter(lambda: source.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def export_locked_tree(source: Path, commit: str, destination: Path) -> None:
    """Export exactly one committed Git tree, rejecting archive link entries."""
    from local_workspace import LocalWorkspace
    workspace = LocalWorkspace()
    destination = workspace.output(destination)
    archive = subprocess.run(
        ["git", "-C", str(source), "archive", "--format=tar", commit],
        check=True,
        capture_output=True,
    ).stdout
    destination.mkdir(parents=True)
    with tarfile.open(fileobj=io.BytesIO(archive), mode="r:") as stream:
        members = stream.getmembers()
        def safe_link_target(member: tarfile.TarInfo) -> bool:
            link = PurePosixPath(member.linkname)
            if link.is_absolute():
                return False
            resolved: list[str] = list(PurePosixPath(member.name).parent.parts)
            for part in link.parts:
                if part in {"", "."}:
                    continue
                if part == "..":
                    if not resolved:
                        return False
                    resolved.pop()
                else:
                    resolved.append(part)
            return bool(resolved)

        for member in members:
            path = PurePosixPath(member.name)
            if (
                path.is_absolute()
                or any(part in {"", ".", ".."} for part in path.parts)
                or member.islnk()
                or not (member.isdir() or member.isfile() or member.issym())
                or (member.issym() and not safe_link_target(member))
            ):
                raise LockError(f"unsafe checker archive member: {member.name!r}")
        for member in members:
            target = workspace.output(destination.joinpath(*PurePosixPath(member.name).parts))
            if member.isdir():
                target.mkdir(parents=True, exist_ok=True)
                continue
            target.parent.mkdir(parents=True, exist_ok=True)
            if member.issym():
                target.symlink_to(member.linkname)
                continue
            extracted = stream.extractfile(member)
            if extracted is None:
                raise LockError(f"missing checker archive payload: {member.name!r}")
            with target.open("wb") as output:
                shutil.copyfileobj(extracted, output)
            target.chmod(member.mode & 0o777)


def attach_locked_dependency_metadata(lock: ToolchainLock, name: str, caller_source: Path,
                                      exported: Path) -> None:
    """Give Lake a local pinned Git HEAD without rewriting exported source files.

    Lake 5.0/Lean 4.19 materializes a manifest dependency without fetching only
    when its Git HEAD already equals the manifest revision. A bare file export
    has no HEAD. Import just the verified local Git object, then reset the index
    (never the worktree); no remote network operation is permitted here.
    """
    from local_workspace import LocalWorkspace
    def require(condition: bool, message: str) -> None:
        if not condition:
            raise LockError(message)
    workspace = LocalWorkspace()
    exported = workspace.output(exported)
    caller_source = caller_source.resolve(strict=True)
    verify_git_source(lock, name, caller_source)
    require(not (exported / ".git").exists(), "dependency export already has Git metadata")
    def payload() -> dict[str, tuple[str, str]]:
        result = {}
        for path in exported.rglob("*"):
            relative = path.relative_to(exported)
            if relative.parts[0] == ".git":
                continue
            require(not getattr(path, "is_junction", lambda: False)(), "dependency export contains a junction")
            if path.is_symlink():
                result[relative.as_posix()] = ("symlink", os.readlink(path))
            elif path.is_file():
                result[relative.as_posix()] = ("file", sha256_file(path))
        return result
    before = payload()
    def git(*arguments: str) -> None:
        result = subprocess.run(["git", "-c", "safe.directory=" + exported.as_posix(),
            "-c", "core.longpaths=true", "-c", "protocol.allow=never", "-c", "protocol.file.allow=always", "-C", str(exported), *arguments],
            capture_output=True, text=True, encoding="utf-8", errors="replace")
        require(result.returncode == 0, "private dependency Git metadata failed: " + result.stdout + result.stderr)
    git("init", "--quiet", "--template=")
    git("config", "core.autocrlf", "false")
    git("config", "core.symlinks", "true")
    git("config", "core.longpaths", "true")
    git("remote", "add", "origin", lock[f"{name}-repository"])
    git("fetch", "--no-tags", "--no-write-fetch-head", str(caller_source), lock[f"{name}-commit"])
    git("reset", "--mixed", "--quiet", lock[f"{name}-commit"])
    require(payload() == before, "private dependency metadata changed exported source bytes or links")
    verify_git_source(lock, name, exported)


def _run_build(lake: str, source: Path, target: str) -> None:
    result = subprocess.run(
        [lake, "build", target],
        cwd=source,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    if result.returncode != 0:
        raise LockError(f"checker build failed for {target}:\n{result.stdout}")


def build_locked_checker(
    lock: ToolchainLock,
    name: str,
    caller_source: Path,
    private_root: Path,
    lake: str,
    *,
    batteries_source: Path | None = None,
) -> BuiltChecker:
    """Verify, export, and clean-build one checker from its locked object."""
    from local_workspace import LocalWorkspace, absolute_lake
    workspace = LocalWorkspace()
    private_root = workspace.output(private_root)
    lake = absolute_lake(lake)
    workspace.activate()
    caller_source = caller_source.resolve(strict=True)
    verify_git_source(lock, name, caller_source)
    private_source = private_root / name
    export_locked_tree(caller_source, lock[f"{name}-commit"], private_source)

    if batteries_source is not None:
        batteries_source = batteries_source.resolve(strict=True)
        verify_git_source(lock, "lean4lean-batteries", batteries_source)
        batteries_target = private_source / ".lake" / "packages" / "batteries"
        batteries_target.parent.mkdir(parents=True)
        export_locked_tree(
            batteries_source,
            lock["lean4lean-batteries-commit"],
            batteries_target,
        )
        attach_locked_dependency_metadata(lock, "lean4lean-batteries", batteries_source, batteries_target)

    target = "lean4checker" if name == "lean4checker" else "lean4lean"
    recipe = f"lake build {target}\n".encode()
    recipe_digest = hashlib.sha256(recipe).hexdigest()
    if recipe_digest != lock[f"{name}-build-recipe-sha256"]:
        raise LockError(f"{name}: implemented build recipe differs from the lock")
    _run_build(lake, private_source, target)
    binary = private_source / lock[f"{name}-executable"]
    if not binary.is_file() or binary.is_symlink():
        raise LockError(f"{name}: build did not create the locked executable")
    binary_digest = sha256_file(binary)
    if binary_digest != lock[f"{name}-binary-sha256"]:
        raise LockError(
            f"{name}: built binary digest {binary_digest} differs from the lock"
        )
    return BuiltChecker(
        name=name,
        source_commit=lock[f"{name}-commit"],
        source_tree=lock[f"{name}-tree"],
        source_sha256=lock[f"{name}-source-sha256"],
        build_recipe_sha256=recipe_digest,
        binary=binary,
        binary_sha256_before=binary_digest,
    )


def require_negative_canary(command: list[str], *, cwd: Path, name: str) -> None:
    result = subprocess.run(
        command,
        cwd=cwd,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
    )
    if result.returncode == 0:
        raise LockError(f"{name}: negative checker canary was incorrectly accepted")
