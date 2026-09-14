#!/usr/bin/env python3
"""Reject proof escapes in the Lean staging sources."""

from __future__ import annotations

import pathlib
import re


ROOT = pathlib.Path(__file__).resolve().parents[1]
FORBIDDEN_ANYWHERE = re.compile(
    r"\b(sorry|admit|unsafe|partial|native_decide)\b|"
    r"@\[(implemented_by|extern)\b"
)
FORBIDDEN_DECLARATION = re.compile(
    r"(?m)^\s*(?:(?:private|protected|noncomputable)\s+|@\[[^\]\n]*\]\s*)*"
    r"(axiom|constant|opaque)\b"
)


def without_comments(source: str) -> str:
    """Erase Lean line comments and nested block comments, preserving lines."""
    out: list[str] = []
    index = 0
    depth = 0
    quoted = False
    while index < len(source):
        pair = source[index : index + 2]
        char = source[index]
        if depth:
            if pair == "/-":
                depth += 1
                out.extend("  ")
                index += 2
            elif pair == "-/":
                depth -= 1
                out.extend("  ")
                index += 2
            else:
                out.append("\n" if char == "\n" else " ")
                index += 1
        elif not quoted and pair == "/-":
            depth = 1
            out.extend("  ")
            index += 2
        elif not quoted and pair == "--":
            while index < len(source) and source[index] != "\n":
                out.append(" ")
                index += 1
        else:
            out.append(char)
            if char == '"' and (index == 0 or source[index - 1] != "\\"):
                quoted = not quoted
            index += 1
    if depth:
        raise SystemExit("unterminated Lean block comment")
    return "".join(out)


def main() -> None:
    failures: list[str] = []
    paths = sorted(ROOT.rglob("*.lean"))
    for path in paths:
        clean = without_comments(path.read_text(encoding="utf-8"))
        for pattern in (FORBIDDEN_ANYWHERE, FORBIDDEN_DECLARATION):
            for match in pattern.finditer(clean):
                line = clean.count("\n", 0, match.start()) + 1
                token = next(group for group in match.groups() if group is not None)
                failures.append(f"{path.relative_to(ROOT)}:{line}: {token}")
    if failures:
        raise SystemExit("forbidden Lean proof escape:\n" + "\n".join(failures))
    print(f"PASS Lean source audit files={len(paths)} forbidden_tokens=0")


if __name__ == "__main__":
    main()
