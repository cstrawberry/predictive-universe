#!/usr/bin/env python3
"""Require the exact Lean and Lake release declared by this project."""

from __future__ import annotations

import argparse
import hashlib
import json
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
PACKAGE_ROOT = ROOT.parent
sys.path.insert(0, str(PACKAGE_ROOT / "src"))

from toolchain_lock import parse_lock
from local_workspace import LocalWorkspace, lake_command


def run(command: list[str]) -> str:
    result = subprocess.run(
        command,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
    )
    if result.returncode != 0:
        raise SystemExit(
            f"toolchain command failed ({' '.join(command)}):\n"
            f"{result.stdout.rstrip()}"
        )
    return result.stdout.strip()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--lake", default="lake")
    args = parser.parse_args()
    lake = lake_command(args.lake)
    workspace = LocalWorkspace(PACKAGE_ROOT)
    workspace.output(ROOT / ".lake")
    workspace.activate()
    lock = parse_lock(PACKAGE_ROOT / "TOOLCHAIN.lock")
    lean_version = lock["lean"]
    lean_commit = lock["lean-commit"]
    lake_version = lock["lake"]

    lean_output = run([*lake, "env", "lean", "--version"])
    lean = re.search(r"Lean \(version ([^,]+),.*commit ([0-9a-f]+),", lean_output)
    if lean is None:
        raise SystemExit(f"unrecognized Lean version output: {lean_output}")
    if lean.group(1) != lean_version or lean.group(2) != lean_commit:
        raise SystemExit(
            "wrong Lean toolchain: "
            f"expected {lean_version} commit {lean_commit}; "
            f"found {lean.group(1)} commit {lean.group(2)}"
        )

    lake_output = run([*lake, "--version"])
    lake_match = re.search(
        r"Lake version ([^- ]+)-[0-9A-Za-z+]+ \(Lean version ([^)]+)\)",
        lake_output,
    )
    if lake_match is None:
        raise SystemExit(f"unrecognized Lake version output: {lake_output}")
    if lake_match.group(1) != lake_version or lake_match.group(2) != lean_version:
        raise SystemExit(
            "wrong Lake toolchain: "
            f"expected Lake {lake_version} with Lean {lean_version}; "
            f"found {lake_match.group(1)} with Lean {lake_match.group(2)}"
        )

    if lock.values.get("verification-profile") == "pure-s-formalization-verification-v1":
        record = json.loads((PACKAGE_ROOT / lock["provenance-file"]).read_text())
        runtime = pathlib.Path(run([*lake, "env", "lean", "--print-prefix"]))
        for name in ("lean", "lake", "leanchecker"):
            actual = hashlib.sha256((runtime / "bin" / name).read_bytes()).hexdigest()
            if actual != record[name]["binary_sha256"]:
                raise SystemExit(f"changed pinned {name} binary")

    manifest_path = ROOT / "lake-manifest.json"
    try:
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise SystemExit(f"invalid Lake manifest {manifest_path}: {error}") from error
    if not isinstance(manifest, dict) or manifest.get("packages") != []:
        raise SystemExit(
            "external Lake dependencies are forbidden: "
            f"expected packages=[], found {manifest.get('packages')!r}"
        )

    print(
        "PASS exact Lean toolchain "
        f"lean={lean_version} commit={lean_commit} lake={lake_version} "
        f"external_packages=0 lock_sha256={lock.sha256}"
    )


if __name__ == "__main__":
    main()
