#!/usr/bin/env python3
"""Compile every Lean source named by the formalization inventory."""

from __future__ import annotations

import argparse
from pathlib import Path, PurePosixPath
import re
import subprocess
import sys


ROOT = Path(__file__).resolve().parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT.parent / "src"))
from local_workspace import LocalWorkspace, absolute_lake


def inventoried_sources(root: Path) -> list[PurePosixPath]:
    entries = (root / "FILES").read_text(encoding="utf-8").splitlines()
    sources: list[PurePosixPath] = []
    seen: set[str] = set()
    for entry in entries:
        if not entry or entry.startswith("#"):
            continue
        path = PurePosixPath(entry)
        if path.is_absolute() or ".." in path.parts or str(path) != entry:
            raise ValueError(f"noncanonical inventory path: {entry}")
        if entry in seen:
            raise ValueError(f"duplicate inventory path: {entry}")
        seen.add(entry)
        if path.suffix != ".lean":
            continue
        if any(not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", part)
               for part in path.with_suffix("").parts):
            raise ValueError(f"unsupported Lean module path: {entry}")
        source = root / path
        if (not source.is_file() or source.is_symlink()
                or not source.resolve().is_relative_to(root.resolve())):
            raise ValueError(f"missing or linked Lean source: {entry}")
        sources.append(path)
    if not sources:
        raise ValueError("formalization inventory has no Lean sources")
    actual = {path.relative_to(root).as_posix()
              for path in root.rglob("*.lean")
              if ".lake" not in path.relative_to(root).parts}
    expected = {str(path) for path in sources}
    if actual != expected:
        raise ValueError(
            f"Lean inventory mismatch: unlisted={sorted(actual - expected)} "
            f"missing={sorted(expected - actual)}"
        )
    return sources


def build_inventory(root: Path, lake: str) -> None:
    sources = inventoried_sources(root)
    lake = absolute_lake(lake)
    workspace = LocalWorkspace(ROOT.parent)
    workspace.output(root / ".lake")
    workspace.activate()
    library = [path for path in sources
               if path.parts[0] == "PureSFormal" or
               path in (PurePosixPath("PureSFormal.lean"), PurePosixPath("Demo.lean"))]
    standalone = [path for path in sources if path not in library]
    modules = [".".join(path.with_suffix("").parts) for path in library]
    # Bounded argument lists also work below Windows' command-line limit.
    for offset in range(0, len(modules), 50):
        subprocess.run([lake, "--rehash", "--log-level=error", "build",
                        *modules[offset:offset + 50]], cwd=root, check=True)
    for path in standalone:
        destination = workspace.output(
            root / ".lake" / "build" / "lib" / "lean" / path.with_suffix(".olean")
        )
        destination.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run(
            [lake, "env", "lean", "-o", str(destination), str(path)],
            cwd=root, check=True,
        )
    print(f"PASS inventory build: {len(sources)} Lean modules", flush=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lake", default="lake")
    args = parser.parse_args()
    build_inventory(ROOT, args.lake)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, ValueError, subprocess.CalledProcessError) as error:
        raise SystemExit(f"FAIL inventory build: {error}") from None
