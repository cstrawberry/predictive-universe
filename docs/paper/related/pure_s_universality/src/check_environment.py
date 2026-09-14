#!/usr/bin/env python3
"""Validate the locked verification environment."""

from __future__ import annotations

import argparse
import importlib.metadata
import json
import locale
import os
from pathlib import Path
import platform
import subprocess
import sys

sys.dont_write_bytecode = True
from toolchain_lock import DEFAULT_LOCK, LockError, parse_lock


def command_version(command: list[str]) -> str:
    completed = subprocess.run(command, check=True, capture_output=True, text=True)
    return (completed.stdout or completed.stderr).splitlines()[0].strip()


def fingerprint(*, canonical: bool) -> dict[str, object]:
    lock = parse_lock(DEFAULT_LOCK)
    actual = {
        "implementation": platform.python_implementation(),
        "python": platform.python_version(),
        "system": platform.system(),
        "machine": platform.machine(),
        "locale": locale.setlocale(locale.LC_ALL, None),
        "timezone": os.environ.get("TZ", ""),
        "source_date_epoch": os.environ.get("SOURCE_DATE_EPOCH", ""),
        "python_hash_seed": os.environ.get("PYTHONHASHSEED", ""),
        "canonical_container": os.environ.get("PURE_S_CANONICAL_CONTAINER", ""),
    }
    if canonical:
        expected = {
            "implementation": lock["verification-python-implementation"],
            "python": lock["verification-python"],
            "system": "Linux",
            "machine": "x86_64",
            "timezone": lock["timezone"],
            "source_date_epoch": lock["source-date-epoch"],
            "python_hash_seed": lock["python-hash-seed"],
            "canonical_container": "1",
        }
        disagreements = {
            key: {"expected": value, "actual": actual[key]}
            for key, value in expected.items()
            if actual[key] != value
        }
        if lock["locale"] not in str(actual["locale"]):
            disagreements["locale"] = {
                "expected": lock["locale"],
                "actual": actual["locale"],
            }
        if disagreements:
            raise LockError("noncanonical environment: " + json.dumps(disagreements, sort_keys=True))
        lean = command_version(["lean", "--version"])
        lake = command_version(["lake", "--version"])
        pandoc = command_version(["pandoc", "--version"])
        xetex = command_version(["xelatex", "--version"])
        kpathsea = command_version(["kpsewhich", "--version"])
        pypdf = importlib.metadata.version("pypdf")
        expected_fragments = {
            "Lean": (lock["lean"], lock["lean-commit"]),
            "Lake": (lock["lake"], lock["lean"]),
            "Pandoc": (lock["verification-pandoc"],),
            "XeTeX": (lock["verification-xetex"],),
            "kpathsea": (lock["kpathsea"],),
        }
        outputs = {
            "Lean": lean,
            "Lake": lake,
            "Pandoc": pandoc,
            "XeTeX": xetex,
            "kpathsea": kpathsea,
        }
        wrong_tools = {
            name: {"required_fragments": fragments, "actual": outputs[name]}
            for name, fragments in expected_fragments.items()
            if not all(fragment in outputs[name] for fragment in fragments)
        }
        if pypdf != lock["pypdf"]:
            wrong_tools["pypdf"] = {"expected": lock["pypdf"], "actual": pypdf}
        if wrong_tools:
            raise LockError("noncanonical tools: " + json.dumps(wrong_tools, sort_keys=True))
        actual["tools"] = {**outputs, "pypdf": pypdf}
    return {
        "schema": "PURE_S_VERIFICATION_ENVIRONMENT_V1",
        "canonical": canonical,
        "lock_sha256": lock.sha256,
        "runtime": actual,
    }


def main() -> int:
    from local_workspace import LocalWorkspace
    parser = argparse.ArgumentParser()
    parser.add_argument("--canonical", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    record = fingerprint(canonical=args.canonical)
    payload = json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n"
    if args.output is not None:
        workspace = LocalWorkspace()
        args.output = workspace.output(args.output)
        temporary = workspace.output(args.output.with_suffix(args.output.suffix + ".tmp"))
        temporary.write_text(payload, encoding="utf-8", newline="\n")
        temporary.replace(args.output)
    print(payload, end="")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (LockError, OSError, subprocess.CalledProcessError) as error:
        raise SystemExit(f"FAIL environment verification: {error}") from None
