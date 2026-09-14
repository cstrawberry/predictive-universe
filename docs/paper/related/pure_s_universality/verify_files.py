#!/usr/bin/env python3
"""Check all files listed in the package SHA256SUMS manifest."""
from pathlib import Path, PurePosixPath
import hashlib
import re

ROOT = Path(__file__).resolve().parent
seen = set()
for line in (ROOT / "SHA256SUMS").read_text(encoding="utf-8").splitlines():
    match = re.fullmatch(r"([0-9a-f]{64})  (.+)", line)
    if not match:
        raise SystemExit("FAIL invalid manifest entry")
    expected, name = match.groups()
    relative = PurePosixPath(name)
    if relative.is_absolute() or ".." in relative.parts or name in seen:
        raise SystemExit("FAIL invalid or duplicate manifest path")
    seen.add(name)
    path = ROOT / relative
    if not path.is_file() or not path.resolve().is_relative_to(ROOT):
        raise SystemExit(f"FAIL missing or external file: {name}")
    with path.open("rb") as stream:
        actual = hashlib.file_digest(stream, "sha256").hexdigest()
    if actual != expected:
        raise SystemExit(f"FAIL checksum mismatch: {name}")
print(f"PASS package checksums: {len(seen)} files")
