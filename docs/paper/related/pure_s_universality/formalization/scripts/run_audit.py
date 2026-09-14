#!/usr/bin/env python3
"""Run the complete inventoried Lean build and audit without a shell or Make."""

from __future__ import annotations

import argparse
from pathlib import Path
import shlex
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT.parent / "src"))
from local_workspace import LocalWorkspace, absolute_lake


def audit_commands(python: list[str], lake: str) -> tuple[list[str], ...]:
    """The inventory build covers all library, strong, research and demo roots."""
    return (
        [*python, "scripts/check_toolchain.py", "--lake", lake],
        [*python, "scripts/build_inventory.py", "--lake", lake],
        [*python, "scripts/audit_sources.py"],
        [*python, "scripts/audit_axioms.py", "--lake", lake],
        [*python, "scripts/audit_all_axioms.py", "--lake", lake],
        [*python, "scripts/audit_public_declarations.py", "--lake", lake],
        [*python, "scripts/check_public_signatures.py", "--lake", lake, "--check"],
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lake", required=True)
    parser.add_argument("--python", default=sys.executable)
    args = parser.parse_args()
    python = [args.python] if Path(args.python).is_file() else shlex.split(args.python)
    if not python:
        raise ValueError("provide a Python interpreter")
    if "-B" not in python:
        python.append("-B")
    lake = absolute_lake(args.lake)
    LocalWorkspace(ROOT.parent).activate()
    for command in audit_commands(python, lake):
        print("AUDIT " + " ".join(command), flush=True)
        subprocess.run(command, cwd=ROOT, check=True)
    print("PASS complete portable formalization audit", flush=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, ValueError, subprocess.CalledProcessError) as error:
        raise SystemExit(f"FAIL portable formalization audit: {error}") from None
