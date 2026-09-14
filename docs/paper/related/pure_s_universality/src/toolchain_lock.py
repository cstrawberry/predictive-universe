#!/usr/bin/env python3
"""Strict parser and source-identity checks for ``TOOLCHAIN.lock``.

The lock is deliberately a small, line-oriented format.  Its schema is closed:
unknown, missing, and duplicate keys are errors.  Source-tree digests are
domain-separated SHA-256 digests over the byte content named by a Git tree, not
over a caller-supplied build directory.
"""

from __future__ import annotations

from dataclasses import dataclass
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
from typing import Mapping


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_LOCK = ROOT / "TOOLCHAIN.lock"

HEX40 = re.compile(r"[0-9a-f]{40}")
HEX64 = re.compile(r"[0-9a-f]{64}")
VERSION = re.compile(r"[0-9]+(?:\.[0-9]+){1,3}(?:[-+][0-9A-Za-z.-]+)?")

LOCK_KEYS = frozenset(
    {
        "package-version",
        "canonical-platform",
        "container-base",
        "container-base-index-digest",
        "ubuntu-package-snapshot",
        "verification-python-implementation",
        "verification-python",
        "verification-python-source-url",
        "verification-python-source-sha256",
        "verifier-python-minimum",
        "elan",
        "lean",
        "lean-commit",
        "lean-toolchain",
        "lake",
        "lake-external-packages",
        "lean4checker-repository",
        "lean4checker-tag",
        "lean4checker-commit",
        "lean4checker-tree",
        "lean4checker-source-sha256",
        "lean4checker-executable",
        "lean4checker-build-recipe-sha256",
        "lean4checker-binary-sha256",
        "lean4checker-role",
        "lean4lean-repository",
        "lean4lean-commit",
        "lean4lean-tree",
        "lean4lean-source-sha256",
        "lean4lean-executable",
        "lean4lean-build-recipe-sha256",
        "lean4lean-binary-sha256",
        "lean4lean-batteries-repository",
        "lean4lean-batteries-commit",
        "lean4lean-batteries-tree",
        "lean4lean-batteries-source-sha256",
        "lean4lean-role",
        "mathlib",
        "pypdf",
        "pypdf-wheel-sha256",
        "verification-pandoc",
        "verification-pandoc-lua",
        "verification-xetex",
        "texlive",
        "kpathsea",
        "source-date-epoch",
        "locale",
        "timezone",
        "python-hash-seed",
    }
)


class LockError(ValueError):
    """A malformed lock or a source/lock disagreement."""


@dataclass(frozen=True)
class ToolchainLock:
    path: Path
    values: Mapping[str, str]

    def __getitem__(self, key: str) -> str:
        return self.values[key]

    @property
    def sha256(self) -> str:
        return hashlib.sha256(self.path.read_bytes()).hexdigest()

    def integer(self, key: str) -> int:
        value = self[key]
        if not value.isascii() or not value.isdecimal():
            raise LockError(f"{key} must be a nonnegative decimal integer")
        return int(value)


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise LockError(message)


def parse_lock(path: Path = DEFAULT_LOCK) -> ToolchainLock:
    raw = path.read_bytes()
    _require(raw.endswith(b"\n"), f"{path.name} must end with one newline")
    try:
        text = raw.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise LockError(f"{path.name} is not UTF-8") from exc

    if text.startswith("verification-profile: "):
        expected = {"verification-profile", "lean", "lean-commit", "lean-toolchain", "lake",
                    "lake-external-packages", "mathlib", "canonical-platform",
                    "provenance-file", "provenance-sha256"}
        current: dict[str, str] = {}
        for line in text.splitlines():
            key, separator, value = line.partition(": ")
            _require(separator == ": " and key in expected and key not in current,
                     "invalid or duplicate formalization lock field")
            _require(value and value == value.strip(), "empty or padded lock value")
            current[key] = value
        _require(current.keys() == expected, "incomplete formalization lock")
        _require(current["verification-profile"] == "pure-s-formalization-verification-v1", "unknown verification profile")
        _require(HEX40.fullmatch(current["lean-commit"]) is not None, "invalid Lean commit")
        _require(all(VERSION.fullmatch(current[k]) for k in ["lean", "lake"]), "invalid tool version")
        _require(current["lean-toolchain"] == "leanprover/lean4:v" + current["lean"], "inconsistent Lean toolchain")
        _require(current["lake-external-packages"] == current["mathlib"] == "none", "unexpected formalization dependencies")
        _require(current["canonical-platform"] == "linux/amd64", "unexpected platform")
        _require(current["provenance-file"] == "VERIFICATION-TOOLCHAIN.json", "unexpected provenance file")
        _require(HEX64.fullmatch(current["provenance-sha256"]) is not None, "invalid provenance digest")
        evidence = (path.parent / current["provenance-file"]).read_bytes()
        _require(hashlib.sha256(evidence).hexdigest() == current["provenance-sha256"], "changed toolchain provenance")
        record = json.loads(evidence)
        _require(record["profile"] == current["verification-profile"] and
                 record["lean"]["version"] == current["lean"] and
                 record["lean"]["commit"] == current["lean-commit"] and
                 record["lake"]["version"] == current["lake"], "inconsistent toolchain provenance")
        return ToolchainLock(path=path, values=current)

    values: dict[str, str] = {}
    for number, line in enumerate(text.splitlines(), start=1):
        _require(line != "", f"{path.name}:{number}: blank lines are not allowed")
        _require(not line[:1].isspace(), f"{path.name}:{number}: leading whitespace")
        key, separator, value = line.partition(": ")
        _require(separator == ": ", f"{path.name}:{number}: expected 'key: value'")
        _require(key in LOCK_KEYS, f"{path.name}:{number}: unknown key {key!r}")
        _require(key not in values, f"{path.name}:{number}: duplicate key {key!r}")
        _require(value != "" and value == value.strip(), f"{path.name}:{number}: empty or padded value")
        _require("\x00" not in value, f"{path.name}:{number}: NUL in value")
        values[key] = value

    missing = sorted(LOCK_KEYS - values.keys())
    _require(not missing, f"{path.name}: missing keys: {missing}")

    for key in (
        "lean4checker-commit",
        "lean4checker-tree",
        "lean4lean-commit",
        "lean4lean-tree",
        "lean4lean-batteries-commit",
        "lean4lean-batteries-tree",
    ):
        _require(HEX40.fullmatch(values[key]) is not None, f"{key} must be 40 lowercase hex digits")
    for key in (
        "verification-python-source-sha256",
        "lean4checker-source-sha256",
        "lean4checker-build-recipe-sha256",
        "lean4checker-binary-sha256",
        "lean4lean-source-sha256",
        "lean4lean-build-recipe-sha256",
        "lean4lean-binary-sha256",
        "lean4lean-batteries-source-sha256",
        "pypdf-wheel-sha256",
    ):
        _require(HEX64.fullmatch(values[key]) is not None, f"{key} must be 64 lowercase hex digits")
    _require(values["container-base-index-digest"].startswith("sha256:"), "container-base-index-digest must be a sha256 digest")
    _require(HEX64.fullmatch(values["container-base-index-digest"][7:]) is not None, "invalid container-base-index-digest")
    for key in (
        "package-version",
        "verification-python",
        "verifier-python-minimum",
        "elan",
        "lean",
        "lake",
        "pypdf",
    ):
        _require(VERSION.fullmatch(values[key]) is not None, f"{key} has an invalid version")
    for key in (
        "verification-python-source-url",
        "lean4checker-repository",
        "lean4lean-repository",
        "lean4lean-batteries-repository",
    ):
        if key == "verification-python-source-url":
            _require(values[key].startswith("https://www.python.org/"), f"{key} must be an official HTTPS Python URL")
        else:
            _require(values[key].startswith("https://github.com/"), f"{key} must be an HTTPS GitHub URL")
    for key in ("lean4checker-executable", "lean4lean-executable"):
        candidate = Path(values[key])
        _require(not candidate.is_absolute() and ".." not in candidate.parts, f"{key} must be a safe relative path")
    _require(values["canonical-platform"] == "linux/amd64", "canonical-platform must be linux/amd64")
    _require(values["verification-python-implementation"] == "CPython", "canonical Python implementation must be CPython")
    _require(values["lake-external-packages"] == "none", "the formalization must not acquire external Lake packages")
    _require(values["mathlib"] == "none", "Mathlib must remain absent")
    _require(values["timezone"] == "UTC", "canonical timezone must be UTC")
    _require(values["python-hash-seed"] == "0", "canonical Python hash seed must be zero")
    lock = ToolchainLock(path=path, values=values)
    lock.integer("source-date-epoch")
    return lock


def _git(repository: Path, *arguments: str, text: bool = True) -> str | bytes:
    environment = os.environ.copy()
    environment["GIT_OPTIONAL_LOCKS"] = "0"
    result = subprocess.run(
        ["git", "-C", str(repository), *arguments],
        check=True,
        capture_output=True,
        text=text,
        env=environment,
    )
    return result.stdout


def git_tree_digest(repository: Path, commit: str) -> str:
    """Hash the regular-file content of ``commit`` in stable tree order."""
    listing = _git(repository, "ls-tree", "-rz", "--full-tree", commit, text=False)
    assert isinstance(listing, bytes)
    digest = hashlib.sha256()
    digest.update(b"pure-s-locked-git-tree-v1\0")
    for record in listing.split(b"\0"):
        if not record:
            continue
        metadata, separator, path = record.partition(b"\t")
        _require(separator == b"\t", "malformed git ls-tree record")
        mode, object_type, object_id = metadata.split(b" ")
        _require(object_type == b"blob", f"submodules and non-blobs are forbidden: {path!r}")
        payload = _git(repository, "cat-file", "blob", object_id.decode("ascii"), text=False)
        assert isinstance(payload, bytes)
        digest.update(mode)
        digest.update(b"\0")
        digest.update(path)
        digest.update(b"\0")
        digest.update(len(payload).to_bytes(8, "big"))
        digest.update(payload)
    return digest.hexdigest()


def verify_git_source(lock: ToolchainLock, name: str, repository: Path) -> None:
    """Require a pristine checkout to match every locked source identity."""
    prefix = f"{name}-"
    expected_commit = lock[prefix + "commit"]
    actual_commit = str(_git(repository, "rev-parse", "HEAD")).strip()
    _require(actual_commit == expected_commit, f"{name}: wrong commit {actual_commit}")
    actual_tree = str(_git(repository, "rev-parse", "HEAD^{tree}")).strip()
    _require(actual_tree == lock[prefix + "tree"], f"{name}: wrong Git tree {actual_tree}")
    remote = str(_git(repository, "remote", "get-url", "origin")).strip().removesuffix(".git")
    expected_remote = lock[prefix + "repository"].removesuffix(".git")
    _require(remote == expected_remote, f"{name}: wrong origin {remote!r}")
    status = str(_git(repository, "status", "--porcelain=v1", "--untracked-files=all"))
    _require(status == "", f"{name}: checkout is dirty or has untracked files")
    actual_digest = git_tree_digest(repository, expected_commit)
    _require(actual_digest == lock[prefix + "source-sha256"], f"{name}: source digest differs")


if __name__ == "__main__":
    parsed = parse_lock()
    print(f"PASS strict toolchain lock keys={len(parsed.values)} sha256={parsed.sha256}")
