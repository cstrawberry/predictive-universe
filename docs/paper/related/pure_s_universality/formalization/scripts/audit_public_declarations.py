#!/usr/bin/env python3
"""Axiom-audit declarations in the public source modules listed in MODULES."""

from __future__ import annotations

import argparse
import pathlib
import re
import subprocess
import sys

from audit_sources import without_comments


ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(ROOT.parent / "src"))
from local_workspace import lake_command, temporary_directory
from lean_axiom_report import axiom_report_lines
MODULES = (
    (
        ROOT / "PureSFormal" / "Public.lean",
        "PureSFormal.Public",
    ),
    (
        ROOT / "PureSFormal" / "StrongMultiwayUniversality.lean",
        "PureSFormal.StrongMultiwayUniversality",
    ),
    (
        ROOT / "PureSFormal" / "Research" / "ProtectedTrieStrongTheorem.lean",
        "PureSFormal.Research.ProtectedTrieStrongTheorem",
    ),
    (
        ROOT / "PureSFormal" / "Research" /
        "ProtectedTrieWholeObserverExactCost.lean",
        "PureSFormal.Research.ProtectedTrieWholeObserverExactCost",
    ),
    (
        ROOT / "PureSFormal" / "Research" /
        "ProtectedTrieTableauExactResource.lean",
        "PureSFormal.Research.ProtectedTrieTableauExactResource",
    ),
    (
        ROOT / "PureSFormal" / "Research" /
        "ProtectedTrieCurrentTermObserverNecessity.lean",
        "PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity",
    ),
)
DECLARATION_RE = re.compile(
    r"^(?P<prefix>(?:@\[[^\n]*\]\s*)*(?:(?:noncomputable|protected|private)\s+)*)"
    r"(?:def|abbrev|theorem|structure|inductive|class)\s+"
    r"(?P<name>[A-Za-z_][A-Za-z0-9_'.?]*)(?=\s|[:(])",
    flags=re.MULTILINE,
)
NONE_RE = re.compile(r"^'([^']+)' does not depend on any axioms$")
SOME_RE = re.compile(r"^'([^']+)' depends on axioms: \[([^]]*)\]$")
ALLOWED = frozenset({"propext", "Quot.sound"})


def source_declarations() -> tuple[str, ...]:
    declarations: list[str] = []
    for path, namespace in MODULES:
        clean = without_comments(path.read_text(encoding="utf-8"))
        for match in DECLARATION_RE.finditer(clean):
            if "private" in match.group("prefix").split():
                continue
            declarations.append(f"{namespace}.{match.group('name')}")
    duplicates = sorted({name for name in declarations if declarations.count(name) > 1})
    if duplicates:
        raise SystemExit(f"duplicate public source declarations: {duplicates}")
    if not declarations:
        raise SystemExit("no public source declarations discovered")
    return tuple(declarations)


def audit_source(declarations: tuple[str, ...]) -> str:
    lines = ["import PureSFormal.Public", ""]
    lines.extend(f"#print axioms {declaration}" for declaration in declarations)
    return "\n".join(lines) + "\n"


def parse_axioms(raw: str) -> frozenset[str]:
    if not raw.strip():
        return frozenset()
    return frozenset(part.strip() for part in raw.split(","))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--lake", default="lake")
    args = parser.parse_args()
    declarations = source_declarations()
    lake = lake_command(args.lake)

    with temporary_directory(prefix="pure-s-public-axioms-") as tmp:
        source = pathlib.Path(tmp) / "PublicDeclarationAxioms.lean"
        source.write_text(audit_source(declarations), encoding="utf-8", newline="\n")
        result = subprocess.run(
            [*lake, "env", "lean", "-Dformat.width=1000000", str(source)],
            cwd=ROOT,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
    if result.returncode != 0:
        raise SystemExit("automatic public declaration audit failed:\n" + result.stdout.rstrip())

    found: dict[str, frozenset[str]] = {}
    failures: list[str] = []
    for line in axiom_report_lines(result.stdout):
        none = NONE_RE.match(line)
        some = SOME_RE.match(line)
        if none:
            declaration, axioms = none.group(1), frozenset()
        elif some:
            declaration, axioms = some.group(1), parse_axioms(some.group(2))
        else:
            continue
        found[declaration] = axioms
        allowed = ALLOWED | ({"Classical.choice"} if declaration.startswith("PureSFormal.Public.appendixF") else set())
        unexpected = axioms - allowed
        if unexpected:
            failures.append(f"{declaration}: unexpected axioms {sorted(unexpected)}")

    missing = sorted(set(declarations) - found.keys())
    extra = sorted(found.keys() - set(declarations))
    if missing:
        failures.append(f"no axiom output for source declarations: {missing}")
    if extra:
        failures.append(f"unexpected axiom output: {extra}")
    if failures:
        raise SystemExit("automatic public declaration audit failed:\n" + "\n".join(failures))

    empty = sum(not axioms for axioms in found.values())
    propext = sum(axioms == frozenset({"propext"}) for axioms in found.values())
    print(
        "PASS automatic public declaration axiom coverage "
        f"modules={len(MODULES)} declarations={len(found)} "
        f"empty={empty} propext_only={propext} "
        f"quotient_dependent={sum('Quot.sound' in a for a in found.values())}"
    )
    print(
        "SCOPE named top-level source declarations only; generated projections, "
        "constructors, and transitive environment declarations are not enumerated"
    )


if __name__ == "__main__":
    main()
