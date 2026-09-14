#!/usr/bin/env python3
"""Build the single universality-first prize manuscript."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
from io import BytesIO
from pathlib import Path
from local_workspace import LocalWorkspace, temporary_directory


ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(LocalWorkspace(ROOT).path / 'publication/python'))
PAPER_TITLE = (
    "Pure S Is Computationally Universal Under a Fixed "
    "Root-Restarted Finite Controller"
)
PDF_SUBJECT = (
    "Pure-S computational universality under a fixed root-restarted "
    "finite controller"
)
PDF_ATTRIBUTION = "Project coordinator: Alexander Filin"
UNIFIED_TEMPLATE = ROOT / "paper" / "unified_template.md"
UNIFIED_MARKDOWN = ROOT / "paper.md"
PAPER_PDF = ROOT / "output" / "pdf" / "pure_s_universality.pdf"
PUBLIC_THEOREM_SIGNATURES = (
    ROOT / "formalization" / "generated" / "public_theorem_signatures.md"
)
PUBLIC_API = ROOT / "formalization" / "generated" / "public_api.json"
REFERENCE_SOURCE = ROOT / "paper" / "references.md"
ROGOZHIN_CTS_ARTIFACT = ROOT / "artifacts" / "rogozhin46_cook_cts.json"
SOURCES = (
    UNIFIED_TEMPLATE,
    REFERENCE_SOURCE,
    PUBLIC_THEOREM_SIGNATURES,
    PUBLIC_API,
    ROGOZHIN_CTS_ARTIFACT,
)
THEOREM_SIGNATURE_HEADINGS = {
    "{{SIG_THEOREM_1}}": (
        "Uniform selected-path realization",
        "Selected-path exact recognition",
        "Selected-path noncheckpoint exclusion",
    ),
    "{{SIG_THEOREM_2}}": (
        "Fixed selected-path period-912 endpoint",
        "Premise-free deterministic-tape to fixed-Cook endpoint",
        "Premise-free deterministic-tape selected-path endpoint",
        "Named pointwise deterministic-tape halting equivalence",
        "Complete tape encoder program agreement",
        "Complete tape encoder is primitive recursive",
        "Effective deterministic-tape halting reduction",
        "Output path starts at the certified encoder",
        "Every source-output path edge is a native S contraction",
        "Output-preserving encoder is primitive recursive",
        "Exact bare-term source-row readback",
        "Exact bare-term terminal-row readback",
        "Exact scanned-bit output preservation",
        "Nonhalting source runs reject terminal observations",
        "Fixed Boolean negation through the pure-S path",
    ),
    "{{SIG_THEOREM_3}}": (
        "Selected-path exact recognition",
        "Selected-path noncheckpoint exclusion",
        "Selected-path cubic checkpoint bound",
        "Selected-path checkpoint tree-size bound",
        "Selected-path per-contraction microtick bound",
        "Primitive public decoder certificate",
        "Primitive marked detector certificate",
        "Primitive immutable-seed readback certificate",
        "Fixed endpoint generator program agreement",
        "Fixed endpoint generator is primitive recursive",
        "Fixed endpoint generator is computable",
        "Tape encoder primitive-recursive transfer",
        "Tape encoder computability transfer",
    ),
    "{{SIG_THEOREM_4}}": (
        "Generic confluence obstruction to exclusive branching",
        "Generic confluence obstruction to distinct terminal forks",
    ),
    "{{SIG_THEOREM_5}}": (
        "Persistent certificate enumeration",
        "Exact terminal-observation bridge",
        "Whole-observer resource certificate",
    ),
}
ROOT_RESET_SIGNATURE_HEADINGS = (
    "Complete root-reset headline contract",
    "Complete root-reset headline theorem",
    "Finite root-reset selection at every contraction",
    "Uniform finite root-reset universality",
    "Bare-term iteration equals the certified path",
    "Contract projection equals actual runtime output",
    "Fixed root-reset computation contract",
    "Fixed root-reset computation universality theorem",
    "Root-reset returned scanned-bit output",
    "Measured root-reset output agreement",
    "Ordered literal source sampling for every defined finite prefix",
    "Cumulative invocation bound on every native-S path",
    "Cumulative fresh-root source microticks",
)
SUPPORTING_SIGNATURE_HEADINGS = (
    "Finite bottom-up tree automaton representation",
    "Finite marker observer all-input contract",
    "Finite marker observer makes no contraction",
    "Native S contraction determines its occurrence",
    "Physical fresh-field contraction iff eventual CTS emptiness",
    "Root marker observation iff eventual CTS emptiness",
    "Tree automaton agrees with the finite observer on every tree",
    "Fixed regular halting automaton",
    "Fixed regular language detects source halting",
    "Infinite-tape initial representation",
    "Infinite-tape forward step agreement",
    "Infinite-tape backward step agreement",
    "Infinite-tape undefined-step agreement",
    "Infinite-tape forward exact-fuel run",
    "Infinite-tape backward exact-fuel run",
    "Infinite-tape halting agreement",
    "Infinite-tape returned scanned-bit agreement",
    "Challenge persistent-cursor contract",
    "Challenge persistent-cursor universality theorem",
    "Challenge contract: fixed period",
    "Challenge contract: duplicate-free controller cover",
    "Challenge contract: exhaustive controller cover",
    "Challenge contract: textbook controller agreement",
    "Challenge contract: fixed endpoint counts",
    "Challenge contract: realization of every input",
    "Challenge contract: every sampled edge is pure S",
    "Challenge contract: strictly increasing checkpoints",
    "Challenge contract: exact checkpoint decoding",
    "Challenge contract: fixed tape-halting endpoint",
    "Challenge contract: fixed tape-encoder shape",
    "Challenge contract: linear cyclic-tag encoder size",
    "Challenge contract: computable cyclic-tag encoder",
    "Challenge contract: bounded next contraction",
    "Challenge contract: total selector decision",
    "Challenge contract: bounded decoder",
    "Challenge contract: bounded detector",
    "Challenge contract: periodicity without S",
    "Contextual pure-S contraction",
    "Textbook pure-S rule agreement",
    "Exact concrete scheduler checkpoints",
    "Fixed cyclic-tag program period",
    "Cyclic-tag phase arithmetic",
    "Deterministic tape to primitive three-counter halting",
    "Primitive three-counter to restricted tag halting",
    "Restricted tag to Rogozhin-machine halting",
    "Rogozhin machine to fixed cyclic-tag emptiness",
    "Fixed cyclic-tag emptiness to marked-checkpoint observation",
    "Deterministic tape to compiled three-counter job",
    "Deterministic tape to compiled restricted tag job",
    "Literal decoder factorization",
    "Marked-checkpoint detector characterization",
    "Selected-path global raw-microtick bound",
    "Quadratic-log source-horizon transfer",
    "Mutation-free cursor periodicity",
    "Bounded next contraction on every realized sample",
    "All-configuration bounded selector decision",
    "Contraction-disabled controller periodicity",
    "Counted decoder value agreement",
    "Counted decoder all-input bound",
    "Counted detector value agreement",
    "Counted detector all-input bound",
    "Fixed endpoint raw cover counts",
    "Fixed controller has a duplicate-free cover",
    "Fixed controller cover is exhaustive",
    "Fixed controller agrees with the textbook tree-walker",
    "Fixed endpoint input dependence",
    "Initial bare-root classifier agreement",
    "Every defined tape run has a decoded primitive boundary",
    "Retained tape-compiler exponential primitive lower bound",
    "Retained compiled-boundary double-exponential lower bound",
    "Shared-store kernel certificate",
    "Concrete finite-arena interpreter certificate",
    "Unified selected-path resource ledger",
    "Logarithmic pointer-word representation",
)
UNNUMBERED_HEADINGS = frozenset(
    {
        "Abstract",
        "References",
    }
)
# Long Lean identifiers are converted to breakable ``\nolinkurl`` text in the
# PDF-only source.  This guard catches prose mistakes without rejecting the
# public declaration names used by the unified theorem map.
MAX_INLINE_CODE_LENGTH = 96
SOURCE_DATE_EPOCH = "1789344000"  # 14 September 2026 00:00:00 UTC
DOI_MARKDOWN_LINK_PATTERN = re.compile(
    r"\[(?P<label>doi:(?P<identifier>[^\]\s]+))\]"
    r"\(<?https://doi\.org/(?P=identifier)>?\)"
)
TAGGED_TEMPLATE_PREFIX = (
    "\\DocumentMetadata{\n"
    "  lang=en-US,\n"
    "  pdfversion=1.7\n"
    "}\n"
)


def without_title(path: Path) -> str:
    lines = path.read_text(encoding="utf-8").splitlines()
    if not lines or not lines[0].startswith("# "):
        raise ValueError(f"expected a level-one title in {path}")
    return "\n".join(lines[1:]).lstrip() + "\n"


def replace_once(text: str, token: str, replacement: str) -> str:
    """Replace one required assembly token and reject duplicate/missing slots."""
    if text.count(token) != 1:
        raise ValueError(f"unified template must contain exactly one {token}")
    return text.replace(token, replacement)


def normalized_headings(
    text: str, *, promote: bool = False, strip_appendix_labels: bool = False
) -> str:
    """Normalize source numbering without touching fenced code."""
    output: list[str] = []
    fenced = False
    for line in text.splitlines():
        if line.startswith(("```", "~~~")):
            fenced = not fenced
            output.append(line)
            continue
        match = None if fenced else re.match(r"^(#{2,6})\s+(.+)$", line)
        if match is not None:
            marks, title = match.groups()
            if promote:
                marks = marks[1:]
            if not title.endswith(" {-}"):
                title = re.sub(r"^\d+(?:\.\d+)*\.?\s+", "", title)
            if strip_appendix_labels:
                title = re.sub(r"^Appendix [A-Z]\.\s+", "", title)
                title = re.sub(r"^[A-Z](?:\.\d+)+\.?\s+", "", title)
            if title in UNNUMBERED_HEADINGS:
                title += " {-}"
            line = f"{marks} {title}"
        output.append(line)
    return "\n".join(output) + "\n"


def validate_source_typography() -> None:
    """Reject inline code spans that become unbreakable PDF text boxes."""
    failures: list[str] = []
    for path in SOURCES:
        fenced = False
        for line_number, line in enumerate(
            path.read_text(encoding="utf-8").splitlines(), start=1
        ):
            if line.startswith(("```", "~~~")):
                fenced = not fenced
                continue
            if fenced:
                continue
            for match in re.finditer(r"`([^`]+)`", line):
                if len(match.group(1)) > MAX_INLINE_CODE_LENGTH:
                    failures.append(
                        f"{path.relative_to(ROOT)}:{line_number}: "
                        f"inline code length {len(match.group(1))}"
                    )
    if failures:
        raise ValueError(
            "overlong inline code would overflow the PDF:\n" + "\n".join(failures)
        )


def public_text(text: str) -> str:
    """Prepare root-level generated Markdown for GitHub and Pandoc."""
    text = re.sub(r"\)\{width=[^}]+\}", ")", text)
    text = text.replace(r"\(P=2\)", "$P=2$")
    text = text.replace("](../", "](")
    return text.replace("](figures/", "](paper/figures/")


def number_equations(text: str) -> tuple[str, dict[str, int]]:
    """Number displays by occurrence while retaining stable source identities.

    A template tag names an equation; it is not its publication number.
    References and destinations are derived from that same map.
    """
    tags = re.findall(r"\\tag\{([A-Za-z0-9]+)\}", text)
    if len(tags) != len(set(tags)):
        raise ValueError("duplicate source equation identity")
    numbering = {tag: index for index, tag in enumerate(tags, 1)}
    display = re.compile(r"(?ms)(^\$\$\s*\n.*?^\$\$|^\\begin\{align\}.*?^\\end\{align\})")
    anchored: set[str] = set()

    def anchor(match: re.Match[str]) -> str:
        identities = re.findall(r"\\tag\{([A-Za-z0-9]+)\}", match.group(0))
        anchored.update(identities)
        prefix = "".join(f"[]{{#equation-{tag.lower()}}}" for tag in identities)
        return (prefix + "\n\n" if prefix else "") + match.group(0)

    rendered = display.sub(anchor, text)
    if anchored != set(tags):
        raise ValueError(f"equation tag outside a recognized display: {sorted(set(tags) - anchored)}")
    rendered = re.sub(r"\\tag\{([A-Za-z0-9]+)\}",
                      lambda m: f"\\tag{{{numbering[m.group(1)]}}}", rendered)
    reference = re.compile(
        r"\b(Equations? )\(([A-Za-z0-9]+)\)"
        r"((?:(?:--|–|—| and |, )\([A-Za-z0-9]+\))*)")

    def link(match: re.Match[str]) -> str:
        label, first, tail = match.groups()
        identities = [first, *re.findall(r"\(([A-Za-z0-9]+)\)", tail)]
        missing = set(identities) - set(numbering)
        if missing:
            raise ValueError(f"reference to absent equation: {sorted(missing)}")
        result = f"[{label}({numbering[first]})](#equation-{first.lower()})"
        result += re.sub(r"\(([A-Za-z0-9]+)\)",
                         lambda m: f"[({numbering[m.group(1)]})](#equation-{m.group(1).lower()})", tail)
        return result

    output: list[str] = []
    fenced = False
    for line in rendered.splitlines():
        if line.startswith(("```", "~~~")):
            fenced = not fenced
        output.append(line if fenced else reference.sub(link, line))
    return "\n".join(output) + "\n", numbering


def publication_navigation(text: str) -> str:
    """Use Pandoc's heading counters for Markdown and every displayed reference.

    Source numbers identify sections; stable link targets identify explicitly
    linked objects. Neither supplies a publication label independently of the
    heading order. Code, mathematics and external links remain opaque.
    """
    destinations: dict[tuple[str, str], str] = {}
    labels: dict[str, dict[str, str]] = {}
    output: list[str] = []
    fenced = False
    appendix = False
    counters = [0] * 5
    bibliography = False
    for line in text.splitlines():
        if line.startswith(("```", "~~~")):
            fenced = not fenced
        heading = None if fenced else re.match(r"^(#{2,6})\s+(.+)$", line)
        if heading:
            marks, title = heading.groups()
            clean = re.sub(r"\s+\{[^}]*\}$", "", title)
            unnumbered = clean in UNNUMBERED_HEADINGS or title.endswith(" {-}") or ".unnumbered" in title
            if clean == "References":
                bibliography = True
            explicit = re.search(r"\{#([a-z0-9-]+)(?:\s[^}]*)?\}", title)
            key = None
            if not unnumbered:
                depth = len(marks) - 2
                if re.match(r"Appendix ([A-Z])\.", clean) and not appendix:
                    appendix = True
                    counters = [0] * 5
                counters[depth] += 1
                counters[depth + 1:] = [0] * (4 - depth)
                number = ".".join(map(str, counters[:depth + 1]))
                if appendix:
                    number = chr(ord("A") + counters[0] - 1) + number[len(str(counters[0])):]
                kind = "Appendix" if appendix else "Section"
                theorem = re.match(r"Theorem (\d+[A-Z]?)\.", clean)
                if theorem:
                    key = ("Theorem", theorem.group(1))
                elif appendix:
                    key = ("Appendix", number)
                elif match := re.match(r"(\d+(?:\.\d+)*)\.?\s", clean):
                    key = ("Section", match.group(1))
                else:
                    key = ("Section", number)
                identifier = (explicit.group(1) if explicit else
                              f"{key[0].lower()}-{key[1].lower().replace('.', '-')}")
                if key in destinations:
                    raise ValueError(f"duplicate publication object: {key}")
                destinations[key] = identifier
                labels[identifier] = {kind: number}
                if theorem:
                    labels[identifier]["Theorem"] = theorem.group(1)
                    if appendix:
                        destinations[("Appendix", number)] = identifier
                caption = re.sub(r"^(?:Appendix [A-Z]\.\s+|[A-Z](?:\.\d+)+\.?\s+|\d+(?:\.\d+)*\.?\s+)", "", clean)
                prefix = f"Appendix {number}. " if appendix and depth == 0 else number + (". " if depth == 0 else " ")
                attributes = title[len(clean):] if explicit else f" {{#{identifier}}}"
                line = f"{marks} {prefix}{caption}{attributes}"
        if not fenced:
            if match := re.match(r"^\*\*\[(Theorem|Corollary) ([A-Z]?(?:\d|\.)+)\]\(#([a-z0-9-]+)\)", line):
                kind, number, identifier = match.groups()
                destinations[(kind, number)] = identifier
                labels[identifier] = {kind: number}
            if match := re.match(r"^\*\*Corollary (\d+(?:\.\d+)*)\b", line):
                key = ("Corollary", match.group(1))
                if key in destinations:
                    raise ValueError(f"duplicate publication object: {key}")
                identifier = "corollary-" + match.group(1).replace(".", "-")
                destinations[key] = identifier
                labels[identifier] = {"Corollary": match.group(1)}
                output.append(f"[]{{#{identifier}}}\n")
            if bibliography and (match := re.match(r"^(\d+)\.\s+", line)):
                key = ("Reference", match.group(1))
                if key in destinations:
                    raise ValueError(f"duplicate publication object: {key}")
                identifier = "reference-" + match.group(1)
                destinations[key] = identifier
                line = line[:match.end()] + f"[]{{#{identifier}}}" + line[match.end():]
        output.append(line)

    protected = re.compile(r"(`[^`]*`|!?\[[^\]\n]*\]\([^\n]*?\)|\$[^$\n]*\$)")
    reference = re.compile(r"\b(Section|Appendix|Theorem|Corollary) (\d+(?:\.\d+)*[A-Z]?|[A-Z](?:\.\d+)*)\b")
    citation = re.compile(r"\[(\d+(?:(?:--|–|-)\d+)?(?:,\d+(?:(?:--|–|-)\d+)?)*)\]")

    def link_prose(value: str) -> str:
        def link(match: re.Match[str]) -> str:
            key = (match.group(1), match.group(2))
            if key not in destinations:
                raise ValueError(f"reference to absent publication object: {match.group(0)}")
            identifier = destinations[key]
            return f"[{key[0]} {labels[identifier][key[0]]}](#{identifier})"
        def link_citation(match: re.Match[str]) -> str:
            def number(item: re.Match[str]) -> str:
                key = ("Reference", item.group(0))
                if key not in destinations:
                    raise ValueError(f"reference to absent bibliography entry: {item.group(0)}")
                return f"[{item.group(0)}](#{destinations[key]})"
            return r"\[" + re.sub(r"\d+", number, match.group(1)) + r"\]"
        def linked_label(piece: str) -> str:
            match = re.fullmatch(r"\[(Section|Appendix|Theorem|Corollary) [^\]]+\]\(#([a-z0-9-]+)\)", piece)
            if match is None:
                return piece
            kind, identifier = match.groups()
            if identifier not in labels or kind not in labels[identifier]:
                raise ValueError(f"numbered link has no matching publication object: {piece}")
            return f"[{kind} {labels[identifier][kind]}](#{identifier})"
        pieces = protected.split(value)
        return "".join(linked_label(piece) if index % 2 else reference.sub(link, citation.sub(link_citation, piece))
                       for index, piece in enumerate(pieces))

    result: list[str] = []
    fenced = False
    for line in output:
        if line.startswith(("```", "~~~")):
            fenced = not fenced
        result.append(line if fenced or line.startswith(("#", "```", "~~~"))
                      else link_prose(line))
    rendered = "\n".join(result) + "\n"
    identifiers = re.findall(r"\{#([a-z0-9-]+)(?:\s[^}]*)?\}", rendered)
    if len(identifiers) != len(set(identifiers)):
        raise ValueError("duplicate internal publication destination")
    missing = set(re.findall(r"\]\(#([a-z0-9-]+)\)", rendered)) - set(identifiers)
    if missing:
        raise ValueError(f"unresolved internal publication links: {sorted(missing)}")
    return rendered


def breakable_long_identifiers(text: str) -> str:
    """Make long PDF-only inline identifiers breakable without editing sources."""
    output: list[str] = []
    fenced = False
    # A three-column audit table reaches its safe break width before prose does;
    # use the table-safe threshold uniformly across the paper.
    pattern = re.compile(r"`([A-Za-z][A-Za-z0-9_./?-]{23,})`")
    for line in text.splitlines():
        if line.startswith(("```", "~~~")):
            fenced = not fenced
            output.append(line)
            continue
        if not fenced:
            line = pattern.sub(lambda match: r"\nolinkurl{" + match.group(1) + "}", line)
        output.append(line)
    return "\n".join(output) + "\n"


def public_declaration_links(text: str, api: dict) -> str:
    """Link exact public names and unambiguous suffixes to their ledger entries.

    The checked ledger remains unchanged. Its heading anchors provide a target
    for each name even when a PDF viewer copies a typeset identifier in pieces.
    Existing links, fenced code and mathematical expressions stay opaque.
    """
    aliases: dict[str, set[str]] = {}
    targets: dict[str, str] = {}
    for entry in api["exports"]:
        name = entry["declaration"]
        anchor = re.sub(r"[^a-z0-9 -]", "", entry["heading"].lower()).replace(" ", "-")
        target = "formalization/generated/public_theorem_signatures.md#" + anchor
        if target in targets.values():
            raise ValueError(f"ambiguous public ledger heading anchor: {anchor}")
        targets[name] = target
        parts = name.split(".")
        for offset in range(len(parts)):
            aliases.setdefault(".".join(parts[offset:]), set()).add(name)
    tokens = re.compile(r"(!?\[[^\]\n]*\]\([^\n]*?\)|\$[^$\n]*\$|`([^`\n]+)`)")

    def link(match: re.Match[str]) -> str:
        label = match.group(2)
        matches = aliases.get(label, set())
        if label is None or len(matches) != 1:
            return match.group(0)
        name = next(iter(matches))
        return f"[`{label}`]({targets[name]})"

    output: list[str] = []
    fenced = False
    for line in text.splitlines():
        if line.startswith(("```", "~~~")):
            fenced = not fenced
            output.append(line)
            continue
        output.append(line if fenced else tokens.sub(link, line))
    return "\n".join(output) + "\n"


def breakable_doi_links(text: str) -> str:
    """Use URL-aware PDF text for DOI labels while preserving their links."""
    output: list[str] = []
    fenced = False
    for line in text.splitlines():
        if line.startswith(("```", "~~~")):
            fenced = not fenced
            output.append(line)
            continue
        if not fenced:
            line = DOI_MARKDOWN_LINK_PATTERN.sub(
                lambda match: (
                    r"\href{https://doi.org/" + match.group("identifier") +
                    r"}{\nolinkurl{" + match.group("label") + "}}"
                ),
                line,
            )
        output.append(line)
    return "\n".join(output) + "\n"


def keep_table_headings(text: str) -> str:
    """Start table-led sections together instead of orphaning their headings."""
    pattern = re.compile(
        r"(?m)^(#{1,6}\s+[^\n]+)\n\n"
        r"(?=\|[^\n]+\|\n\|\s*:?-{3,})"
    )
    return pattern.sub(
        r"\\Needspace{12\\baselineskip}\n\n\1\n\n",
        text,
    )


def pdf_layout_text(text: str) -> str:
    """Apply PDF-only line- and page-breaking aids to authored Markdown."""
    # Keep the map introduction with its table; a long declaration in this
    # paragraph must not finish on the following page.
    text = text.replace(
        "**Clause-to-declaration map.**",
        "\\Needspace{8\\baselineskip}\n\n**Clause-to-declaration map.**",
    )
    return keep_table_headings(
        breakable_doi_links(breakable_long_identifiers(text))
    )


PDF_REPOSITORY_LINK_PREFIXES = (
    "artifacts/",
    "formalization/",
    "research/",
    "src/",
    "CITATION.cff",
    "LICENSE",
    "README.md",
    "TRUSTED_DEFINITIONS.md",
    "VERIFICATION.md",
)


def rebase_pdf_repository_links(text: str) -> str:
    """Make repository-file links resolve from ``output/pdf/`` in the PDF.

    Pandoc preserves relative link targets in PDF annotations.  The public
    Markdown lives at the repository root, whereas the PDF lives two levels
    below it, so repository-file links need a PDF-only ``../../`` prefix.
    Images are deliberately excluded: Pandoc resolves those during the build
    through ``--resource-path`` rather than leaving them as file links.
    """
    pattern = re.compile(r"(?<!!)\]\((?P<target>[^)\s]+)\)")

    def rebase(match: re.Match[str]) -> str:
        target = match.group("target")
        if target.startswith(PDF_REPOSITORY_LINK_PREFIXES):
            return f"](../../{target})"
        return match.group(0)

    return pattern.sub(rebase, text)


def generated_signature_sections(path: Path) -> dict[str, str]:
    """Read uniquely headed generated statements without their H2 preamble."""
    text = path.read_text(encoding="utf-8")
    first_entry = re.search(r"(?m)^###\s+", text)
    if first_entry is None:
        raise ValueError(f"generated signature manifest is empty: {path}")
    preamble = text[: first_entry.start()]
    entries = text[first_entry.start() :]
    if "## Configured kernel-elaborated claim statements" not in preamble:
        raise ValueError(f"generated signature heading is missing in {path}")
    if len(re.findall(r"(?m)^###\s+", entries)) < 1:
        raise ValueError(f"generated signature manifest is empty: {path}")
    sections = re.split(r"(?m)(?=^###\s+)", entries)
    by_heading: dict[str, str] = {}
    for section in sections:
        match = re.match(r"###\s+(.+?)\s*$", section, flags=re.MULTILINE)
        if match is not None:
            heading = match.group(1)
            if heading in by_heading:
                raise ValueError(f"duplicate generated signature heading in {path}: {heading}")
            by_heading[heading] = section.strip()
    return by_heading


def generated_signature_entries(
    path: Path, *, selected_headings: tuple[str, ...] | None = None
) -> str:
    """Return selected generated H3 statements in the requested order."""
    by_heading = generated_signature_sections(path)
    if selected_headings is None:
        return "\n\n".join(by_heading.values())
    missing = [heading for heading in selected_headings if heading not in by_heading]
    if missing:
        raise ValueError(
            f"generated signature manifest is missing headings in {path}: "
            + ", ".join(missing)
        )
    return "\n\n".join(by_heading[heading] for heading in selected_headings)


def declaration_name(section: str) -> str:
    """Extract the fully qualified declaration copied by one generated #check."""
    match = re.search(
        r"```lean\s*\n\s*([A-Za-z_][A-Za-z0-9_'.?]*(?:\.[A-Za-z_][A-Za-z0-9_'.?]*)+)",
        section,
    )
    if match is None:
        raise ValueError("generated signature entry has no qualified declaration")
    return match.group(1).rstrip(".")


def validate_public_signature_correspondence(path: Path, api: dict) -> None:
    """Require the paper's ledger and public API to identify the same statements."""
    sections = generated_signature_sections(path)
    exports = api["exports"]
    if api["export_count"] != len(exports):
        raise ValueError("public API export count differs from its export list")
    headings = [entry["heading"] for entry in exports]
    declarations = [entry["declaration"] for entry in exports]
    if len(set(headings)) != len(headings):
        raise ValueError("public API contains duplicate headings")
    if len(set(declarations)) != len(declarations):
        raise ValueError("public API contains duplicate declarations")
    if tuple(sections) != tuple(headings):
        raise ValueError("generated ledger and public API headings or ordering differ")
    for entry in exports:
        heading = entry["heading"]
        section = sections[heading]
        if declaration_name(section) != entry["declaration"]:
            raise ValueError(f"generated ledger and public API declaration differ: {heading}")
        blocks = re.findall(r"```lean\s*\n(.*?)\n```", section, flags=re.DOTALL)
        if len(blocks) != 1:
            raise ValueError(f"generated signature needs exactly one Lean code block: {heading}")
        if " ".join(blocks[0].split()) != entry["normalized_type"]:
            raise ValueError(f"generated ledger and public API type differ: {heading}")


def generated_declaration_references(text: str, theorem_number: int) -> str:
    """Render readable claim labels beside a theorem; exact names stay in Appendix B."""
    sections = re.split(r"(?m)(?=^###\s+)", text)
    headings: list[str] = []
    for section in sections:
        if not section.startswith("### "):
            continue
        match = re.match(r"###\s+(.+?)\s*$", section, flags=re.MULTILINE)
        if match is not None:
            # Validate that every readable label still comes from a generated
            # #check entry with an elaborated declaration name.
            declaration_name(section)
            headings.append(match.group(1))
    if not headings:
        raise ValueError("selected generated signature group is empty")
    return (
        f"**Kernel correspondence.** [Appendix B.{theorem_number + 1}]"
        f"(#formal-theorem-{theorem_number}) lists the checked "
        "declarations. The public ledger gives their complete types and exact axiom sets."
    )


def generated_headline_map(path: Path) -> str:
    """Render a compact Appendix-B map with stable theorem destinations."""
    root_reset = generated_signature_entries(path, selected_headings=ROOT_RESET_SIGNATURE_HEADINGS)
    root_rows: list[str] = []
    for entry in re.split(r"(?m)(?=^###\s+)", root_reset):
        heading = re.match(r"###\s+(.+?)\s*$", entry, flags=re.MULTILINE)
        if heading is not None:
            identity = declaration_name(entry)
            root_rows.append(f"- **{heading.group(1)}.** `{identity}`.")
    groups: list[str] = ["### Theorem 1R and the fixed root-reset aggregate {#formal-theorem-1r}\n\n" + "\n".join(root_rows)]
    for number, headings in enumerate(THEOREM_SIGNATURE_HEADINGS.values(), 1):
        selected = generated_signature_entries(path, selected_headings=headings)
        sections = re.split(r"(?m)(?=^###\s+)", selected)
        rows: list[str] = []
        for section in sections:
            heading = re.match(r"###\s+(.+?)\s*$", section, flags=re.MULTILINE)
            if heading is None:
                continue
            identity = declaration_name(section)
            rows.append(f"- **{heading.group(1)}.** `{identity}`.")
        groups.append(f"### Theorem {number} {{#formal-theorem-{number}}}\n\n" + "\n".join(rows))
    selected = generated_signature_entries(
        path, selected_headings=SUPPORTING_SIGNATURE_HEADINGS
    )
    sections = re.split(r"(?m)(?=^###\s+)", selected)
    supporting: list[str] = []
    for section in sections:
        heading = re.match(r"###\s+(.+?)\s*$", section, flags=re.MULTILINE)
        if heading is None:
            continue
        identity = declaration_name(section)
        supporting.append(f"- **{heading.group(1)}.** `{identity}`.")
    groups.append("### Supporting declarations\n\n" + "\n".join(supporting))
    appendix = []
    for heading, section in generated_signature_sections(path).items():
        if heading.startswith("F."):
            appendix.append(f"- **{heading}.** `{declaration_name(section)}`.")
    if appendix:
        groups.append("### Appendix F declarations {#formal-appendix-f}\n\n" + "\n".join(appendix))
    return "\n\n".join(groups)


def unified_markdown_manuscript() -> str:
    """Assemble one paper with compact maps extracted from generated #check output."""
    validate_source_typography()
    if not PUBLIC_THEOREM_SIGNATURES.is_file():
        raise ValueError(
            "configured generated Lean claim signatures are missing: "
            f"{PUBLIC_THEOREM_SIGNATURES.relative_to(ROOT)}"
        )
    api = json.loads(PUBLIC_API.read_text(encoding="utf-8"))
    validate_public_signature_correspondence(PUBLIC_THEOREM_SIGNATURES, api)

    template = UNIFIED_TEMPLATE.read_text(encoding="utf-8")
    if template.count(f"# {PAPER_TITLE}") != 1:
        raise ValueError("unified_template.md must contain the exact paper title once")

    assembled = template
    for theorem_number, (token, headings) in enumerate(
        THEOREM_SIGNATURE_HEADINGS.items(), start=1
    ):
        signatures = generated_signature_entries(
            PUBLIC_THEOREM_SIGNATURES,
            selected_headings=headings,
        )
        actual_headings = tuple(re.findall(r"(?m)^###\s+(.+?)\s*$", signatures))
        if actual_headings != headings:
            raise ValueError(f"generated theorem group has changed for {token}")
        assembled = replace_once(
            assembled,
            token,
            generated_declaration_references(signatures, theorem_number),
        )

    assembled = replace_once(
        assembled,
        "{{PUBLIC_THEOREM_SIGNATURES}}",
        generated_headline_map(PUBLIC_THEOREM_SIGNATURES),
    )
    assembled = replace_once(
        assembled,
        "{{REFERENCES}}",
        without_title(REFERENCE_SOURCE).strip(),
    )
    assembled = replace_once(
        assembled,
        "{{ROGOZHIN_CTS_SHA256}}",
        hashlib.sha256(ROGOZHIN_CTS_ARTIFACT.read_bytes()).hexdigest(),
    )
    if assembled.count("{{PUBLIC_EXPORT_COUNT}}") != 2:
        raise ValueError("unified template must contain two public-export count tokens")
    assembled = assembled.replace(
        "{{PUBLIC_EXPORT_COUNT}}", str(api["export_count"])
    )
    if re.search(r"\{\{[A-Z0-9_]+\}\}", assembled) is not None:
        raise ValueError("unexpanded token remains in the assembled paper")
    if len(re.findall(r"(?m)^#\s+", assembled)) != 1:
        raise ValueError("assembled paper must contain exactly one level-one title")
    numbered, _ = number_equations(assembled.rstrip() + "\n")
    return public_text(publication_navigation(public_declaration_links(numbered, api)))


def pdf_front_matter() -> str:
    """Pinned Pandoc metadata for the single paper."""
    return (
        "---\n"
        f"title: '{PAPER_TITLE}'\n"
        "author: |\n"
        f"  {PDF_ATTRIBUTION}  \n"
        "  `\\href{mailto:contact@cinematicstrawberry.com}{\\textrm{contact@cinematicstrawberry.com}}\\\\[0.8em]`{=latex}\n"
        "  \\small `\\disclosureruleline{1.45em}{Developed with substantial AI assistance within the}`{=latex}  \n"
        "  \\small Predictive Universe (PU) framework; see the  \n"
        "  \\small `\\hyperref[project-context-and-contributions]{contribution statement.}`{=latex}\n"
        "date: '`\\raisebox{-12pt}[\\height][\\depth]{14 September 2026}`{=latex}'\n"
        "lang: en-US\n"
        "mainfont: 'Latin Modern Roman'\n"
        "mathfont: 'Latin Modern Math'\n"
        "monofont: 'DejaVu Sans Mono'\n"
        f"subject: '{PDF_SUBJECT}'\n"
        "keywords: [combinatory logic, S combinator, term rewriting, "
        "root-restarted finite controller, exact checkpoint decoder, "
        "cyclic tag systems, literal source output]\n"
        "---\n\n"
    )


def markdown_body_after_metadata(text: str) -> str:
    """Drop the public title and attribution before the abstract."""
    marker = "\n## Abstract\n"
    if marker not in text:
        raise ValueError("unified paper has no Abstract heading")
    return text.split(marker, 1)[1]


def unified_manuscript() -> str:
    """Return the Pandoc source for the single typeset paper."""
    public = unified_markdown_manuscript()
    body = "## Abstract\n" + markdown_body_after_metadata(public)
    appendix = "## Appendix A. Glossary"
    if body.count(appendix) != 1:
        raise ValueError("unified paper appendix sentinel is missing or ambiguous")
    body = body.replace(appendix, "\\appendix\n\n" + appendix, 1)
    body = rebase_pdf_repository_links(body)
    return (
        pdf_front_matter()
        + f"\\hypersetup{{pdfauthor={{{PDF_ATTRIBUTION}}}}}\n\n"
        + "\\renewcommand{\\papershorttitle}{Pure S root-restarted universality}\n\n"
        + "\\setcounter{section}{0}\n\n"
        + normalized_headings(
            pdf_layout_text(body),
            promote=True,
            strip_appendix_labels=True,
        )
    )


def install_xelatex_wrapper(work: Path, environment: dict[str, str]) -> None:
    """Use the fresh private format and retain each engine pass's diagnostics."""
    search_path = environment.get("PATH", os.defpath)
    xetex = shutil.which("xetex", path=search_path)
    if xetex is None:
        raise RuntimeError("neither xelatex nor xetex is available")
    command_dir = work / "tex-command"
    command_dir.mkdir()
    wrapper = command_dir / "xelatex"
    wrapper.write_text(
        f"#!{sys.executable}\n"
        "import os, pathlib, shutil, subprocess, sys\n"
        f"result = subprocess.run([{xetex!r}, '-fmt=xelatex', '-progname=xelatex', '-recorder', *sys.argv[1:]])\n"
        "args = sys.argv[1:]\n"
        "out = pathlib.Path(args[args.index('-output-directory') + 1])\n"
        "logs = pathlib.Path(os.environ['PURE_S_PDF_LOG_DIR'])\n"
        "number = len(list(logs.glob('pass-*.log'))) + 1\n"
        "for suffix in ('log', 'fls'):\n"
        "    source = out / ('input.' + suffix)\n"
        "    if source.is_file(): shutil.copyfile(source, logs / ('pass-' + str(number) + '.' + suffix))\n"
        "sys.exit(result.returncode)\n",
        encoding="utf-8",
    )
    wrapper.chmod(0o755)
    environment["PATH"] = f"{command_dir}{os.pathsep}{search_path}"


def xelatex_environment(work: Path) -> dict[str, str]:
    """Return an environment with a usable XeLaTeX format.

    Build the standard format privately on every invocation so that the
    installed format cannot disagree with the recorded package sources.
    """
    from publication_environment import configure
    environment = configure(os.environ.copy())
    environment["SOURCE_DATE_EPOCH"] = SOURCE_DATE_EPOCH
    environment["FORCE_SOURCE_DATE"] = "1"
    ini_found = subprocess.run(
        ["kpsewhich", "xelatex.ini"],
        check=False,
        capture_output=True,
        text=True,
    ).stdout.strip()
    latex_found = subprocess.run(
        ["kpsewhich", "latex.ltx"],
        check=False,
        capture_output=True,
        text=True,
    ).stdout.strip()
    ini = Path(ini_found) if ini_found else Path(
        "/usr/share/texlive/texmf-dist/tex/latex/tex-ini-files/xelatex.ini"
    )
    latex_source = Path(latex_found) if latex_found else Path(
        "/usr/share/texlive/texmf-dist/tex/latex/base/latex.ltx"
    )
    if not ini.is_file() or not latex_source.is_file():
        raise RuntimeError("XeLaTeX sources are unavailable")

    # .../texmf-dist/tex/latex/base/latex.ltx -> .../texmf-dist
    texmf_dist = latex_source.parents[3]
    format_dir = work / "xelatex-format"
    format_dir.mkdir()
    inherited_texinputs = [
        value
        for value in environment.get("TEXINPUTS", "").split(os.pathsep)
        if value
    ]
    texinputs = inherited_texinputs + [
        f"{texmf_dist / 'tex'}//",
        "/usr/share/texmf/tex//",
    ]
    environment["TEXINPUTS"] = os.pathsep.join(texinputs) + os.pathsep
    environment["TFMFONTS"] = (
        f"{texmf_dist / 'fonts' / 'tfm'}//:/usr/share/texmf/fonts/tfm//:"
    )
    environment["OPENTYPEFONTS"] = (
        f"{texmf_dist / 'fonts' / 'opentype'}//:"
        "/usr/share/texmf/fonts/opentype//:"
    )
    environment["TTFONTS"] = (
        f"{texmf_dist / 'fonts' / 'truetype'}//:"
        "/usr/share/texmf/fonts/truetype//:"
    )
    environment["MISCFONTS"] = f"{texmf_dist / 'fonts' / 'misc'}//:"
    environment["T1FONTS"] = (
        f"{texmf_dist / 'fonts' / 'type1'}//:/usr/share/texmf/fonts/type1//:"
    )
    environment["VFFONTS"] = f"{texmf_dist / 'fonts' / 'vf'}//:"
    environment["ENCFONTS"] = f"{texmf_dist / 'fonts' / 'enc'}//:"
    environment["TEXFONTMAPS"] = f"{texmf_dist / 'fonts' / 'map'}//:"
    environment["CMAPFONTS"] = f"{texmf_dist / 'fonts' / 'cmap'}//:"
    subprocess.run(
        [
            "xetex",
            "-ini",
            "-recorder",
            "-etex",
            "-jobname=xelatex",
            "-progname=xelatex",
            str(ini),
        ],
        cwd=format_dir,
        env=environment,
        check=True,
        stdout=subprocess.DEVNULL,
    )
    environment["TEXFORMATS"] = f"{format_dir}:"
    logs = Path(environment['PURE_S_PDF_LOG_DIR'])
    for suffix in ('log', 'fls'):
        shutil.copyfile(format_dir / ('xelatex.' + suffix), logs / ('format.' + suffix))
    install_xelatex_wrapper(work, environment)
    return environment


def tagged_pandoc_template(
    work: Path, environment: dict[str, str]
) -> Path:
    """Create the Pandoc template that activates LaTeX's structure tagging."""
    required = ("tagpdf.sty", "xurl.sty")
    missing: list[str] = []
    for filename in required:
        found = subprocess.run(
            ["kpsewhich", filename],
            env=environment,
            check=False,
            capture_output=True,
            text=True,
        ).stdout.strip()
        if not found:
            missing.append(filename)
    if missing:
        raise RuntimeError(
            "tagged PDF support is unavailable; install texlive-latex-extra "
            "(missing " + ", ".join(missing) + ")"
        )

    default_template = subprocess.run(
        ["pandoc", "--print-default-template=latex"],
        env=environment,
        check=True,
        capture_output=True,
        text=True,
    ).stdout
    if default_template.count("\\documentclass") != 1:
        raise RuntimeError("unexpected Pandoc LaTeX template structure")
    template = work / "tagged-pandoc-template.tex"
    template.write_text(
        TAGGED_TEMPLATE_PREFIX + default_template,
        encoding="utf-8",
    )
    return template


def assert_page_marked_content_balance(reader: object) -> None:
    """Require balanced marked-content operators in each concatenated page stream."""
    for page_number, page in enumerate(reader.pages, 1):
        contents = page.get_contents()
        if contents is None:
            continue
        depth = 0
        for operation_index, (_operands, operator) in enumerate(contents.operations):
            if operator in (b"BMC", b"BDC"):
                depth += 1
            elif operator == b"EMC":
                if depth == 0:
                    raise RuntimeError(
                        f"PDF marked-content balance failed: page {page_number}, "
                        f"operation {operation_index}: unmatched EMC"
                    )
                depth -= 1
        if depth:
            raise RuntimeError(
                f"PDF marked-content balance failed: page {page_number}: "
                f"{depth} unclosed marked-content span(s)"
            )


def assert_tagged_pdf(output: Path) -> None:
    """Require structure, parent mapping, marked content, and balanced page spans."""
    try:
        from pypdf import PdfReader
    except ImportError as error:
        raise RuntimeError(
            "tagged-PDF validation requires the pinned pypdf dependency"
        ) from error

    def dereference(value: object) -> object:
        getter = getattr(value, "get_object", None)
        return getter() if getter is not None else value

    reader = PdfReader(output, strict=True)
    assert_page_marked_content_balance(reader)
    catalog = dereference(reader.trailer.get("/Root"))
    if not hasattr(catalog, "get"):
        raise RuntimeError("PDF structure-tag assertion failed: no catalog")
    mark_info = dereference(catalog.get("/MarkInfo"))
    if not hasattr(mark_info, "get") or not bool(mark_info.get("/Marked")):
        raise RuntimeError("PDF structure-tag assertion failed: catalog is unmarked")
    structure = dereference(catalog.get("/StructTreeRoot"))
    if not hasattr(structure, "get"):
        raise RuntimeError("PDF structure-tag assertion failed: no structure tree")
    if not structure.get("/K"):
        raise RuntimeError("PDF structure-tag assertion failed: empty structure tree")
    parent_tree = dereference(structure.get("/ParentTree"))
    if not hasattr(parent_tree, "get") or not parent_tree.get("/Nums"):
        raise RuntimeError("PDF structure-tag assertion failed: empty parent tree")
    if not any("/StructParents" in page for page in reader.pages):
        raise RuntimeError(
            "PDF structure-tag assertion failed: pages have no structure parents"
        )
    if not any(
        contents is not None and b"/MCID" in contents.get_data()
        for page in reader.pages
        if (contents := page.get_contents()) is not None
    ):
        raise RuntimeError(
            "PDF structure-tag assertion failed: pages have no marked content"
        )


def normalize_pdf_identifier(output: Path) -> None:
    """Canonicalize the final trailer ID, including PDF literal strings.

    xdvipdfmx chooses either hex or escaped literal strings for its random ID.
    Replacing the final trailer array may change its width: this is safe only
    after all referenced object starts, with the xref stream bytes untouched.
    Parse that trailer and verify its final placement before changing anything.
    """
    from pypdf import PdfReader
    from pypdf.generic import ArrayObject, NameObject, read_object

    payload = output.read_bytes()
    reader = PdfReader(BytesIO(payload), strict=True)
    final = re.search(rb"startxref\s+(\d+)\s+%%EOF\s*\Z", payload)
    if final is None:
        raise RuntimeError("PDF has no final cross-reference pointer")
    xref = int(final.group(1))
    is_stream = not payload[xref:].startswith(b"xref")
    if is_stream:
        header = re.match(rb"\d+\s+\d+\s+obj\s*<<", payload[xref:])
        if header is None:
            raise RuntimeError("PDF final pointer does not identify a cross-reference object")
        dictionary = xref + header.end() - 2
    else:
        trailer = payload.rfind(b"trailer", xref, final.start())
        header = re.match(rb"trailer\s*<<", payload[trailer:]) if trailer >= 0 else None
        if header is None:
            raise RuntimeError("PDF has no final trailer dictionary")
        dictionary = trailer + header.end() - 2

    stream = BytesIO(payload)
    stream.seek(dictionary + 2)

    def skip_space() -> None:
        while True:
            token = stream.read(1)
            if token == b"%":
                while token and token not in (b"\r", b"\n"):
                    token = stream.read(1)
            elif token and token in b"\x00\t\n\f\r ":
                continue
            else:
                if not token:
                    raise RuntimeError("PDF trailer ended unexpectedly")
                stream.seek(-1, 1)
                return

    entries = {}
    identifier_span = None
    while True:
        skip_space()
        if stream.read(2) == b">>":
            break
        stream.seek(-2, 1)
        key = read_object(stream, reader)
        if not isinstance(key, NameObject) or key in entries:
            raise RuntimeError("PDF trailer has an invalid or duplicate key")
        skip_space()
        start = stream.tell()
        value = read_object(stream, reader)
        entries[key] = value
        if key == "/ID":
            if (not isinstance(value, ArrayObject) or len(value) != 2
                    or any(len(getattr(item, "original_bytes", b"")) != 16 for item in value)):
                raise RuntimeError("PDF trailer ID must contain two 16-byte strings")
            identifier_span = (start, stream.tell())
    if identifier_span is None or any(key in entries for key in ("/Prev", "/XRefStm", "/Encrypt")):
        raise RuntimeError("PDF normalization requires one unencrypted, nonincremental final trailer ID")
    tail = payload[stream.tell():final.start()]
    if is_stream:
        opening = re.match(rb"\s*stream(?:\r\n|\r|\n)", tail)
        length = entries.get("/Length")
        if (entries.get("/Type") != "/XRef" or opening is None or not isinstance(length, int)
                or length < 0 or not re.fullmatch(rb"\s*endstream\s+endobj\s*", tail[opening.end() + length:])):
            raise RuntimeError("PDF cross-reference stream is not the final object")
    elif tail.strip():
        raise RuntimeError("PDF trailer is not final")

    start, end = identifier_span
    zero = b"0" * 32
    canonical_input = payload[:start] + b"[<" + zero + b"><" + zero + b">]" + payload[end:]
    identifier = hashlib.sha256(canonical_input).hexdigest()[:32].encode("ascii")
    normalized = payload[:start] + b"[<" + identifier + b"><" + identifier + b">]" + payload[end:]
    if len(PdfReader(BytesIO(normalized), strict=True).pages) != len(reader.pages):
        raise RuntimeError("PDF trailer normalization changed the readable page count")
    output.write_bytes(normalized)


def build_pdf(output: Path = PAPER_PDF) -> None:
    output = LocalWorkspace(ROOT).output(output)
    """Build the single typeset paper at an explicitly selected destination."""
    source = unified_manuscript()
    output.parent.mkdir(parents=True, exist_ok=True)
    logs_root = LocalWorkspace(ROOT).directory('publication-logs')
    logs = Path(tempfile.mkdtemp(prefix='build-', dir=logs_root))
    prior_log_dir = os.environ.get('PURE_S_PDF_LOG_DIR')
    os.environ['PURE_S_PDF_LOG_DIR'] = str(logs)

    with temporary_directory(prefix="pure_s_paper_") as tmp:
        build_dir = Path(tmp)
        merged = build_dir / "manuscript.md"
        merged.write_text(source, encoding="utf-8")
        try:
            environment = xelatex_environment(build_dir)
        finally:
            if prior_log_dir is None:
                os.environ.pop('PURE_S_PDF_LOG_DIR', None)
            else:
                os.environ['PURE_S_PDF_LOG_DIR'] = prior_log_dir
        from publication_environment import verify_resources
        verify_resources(environment)
        template = tagged_pandoc_template(build_dir, environment)
        command = [
            "pandoc",
            str(merged),
            "--from=markdown+tex_math_dollars+raw_tex",
            "--standalone",
            "--template",
            str(template),
        ]
        command.extend(
            [
                "--number-sections",
                "--pdf-engine=xelatex",
                "--lua-filter",
                str(ROOT / "paper" / "table_layout.lua"),
                "--variable=tables:true",
                "--include-in-header",
                str(ROOT / "paper" / "header.tex"),
                "--include-before-body",
                str(ROOT / "paper" / "before_body.tex"),
                "--resource-path",
                os.pathsep.join((str(ROOT), str(ROOT / "paper"))),
                "--metadata=link-citations:true",
                "--variable=geometry:margin=0.9in",
                "--variable=fontsize:11pt",
                "--variable=linestretch:1.04",
                "--variable=documentclass:article",
                "--output",
                str(output),
            ]
        )
        insertion = command.index("--include-before-body")
        command[insertion:insertion] = [
            "--include-in-header",
            str(ROOT / "paper" / "derived_header.tex"),
        ]
        result = subprocess.run(
            command + ['--verbose'],
            cwd=ROOT,
            env=environment,
            check=False, capture_output=True, text=True,
        )
        (logs / 'pandoc.stdout.log').write_text(result.stdout, encoding='utf-8')
        (logs / 'pandoc.stderr.log').write_text(result.stderr, encoding='utf-8')
        from publication_environment import record_resources
        record_resources(logs, environment)
        print('PDF diagnostics: ' + str(logs), flush=True)
        if result.returncode:
            raise RuntimeError(f'PDF build failed (exit {result.returncode}); see {logs / "pandoc.stderr.log"}')
        assert_tagged_pdf(output)
        from publication_checks import check_heading_destinations
        from pypdf import PdfReader
        check_heading_destinations(PdfReader(output), source)
        normalize_pdf_identifier(output)


def check_pdf_build() -> None:
    """Reproduce the PDF twice at unequal path lengths and compare all bytes."""
    pdf = PAPER_PDF
    if not pdf.is_file():
        raise SystemExit(f"FAIL PDF reproduction: committed PDF is missing: {pdf}")
    with temporary_directory(prefix="pure_s_pdf_check_") as tmp:
        short_root = Path(tmp) / "a"
        long_root = Path(tmp) / "a_deliberately_longer_clean_build_root"
        short_root.mkdir()
        long_root.mkdir()
        first_candidate = short_root / pdf.name
        second_candidate = long_root / pdf.name
        build_pdf(first_candidate)
        build_pdf(second_candidate)
        committed_bytes = pdf.read_bytes()
        first_bytes = first_candidate.read_bytes()
        second_bytes = second_candidate.read_bytes()
        if first_bytes != second_bytes:
            first_digest = hashlib.sha256(first_bytes).hexdigest()
            second_digest = hashlib.sha256(second_bytes).hexdigest()
            raise SystemExit(
                "FAIL PDF reproduction: clean builds at unequal absolute path "
                "lengths differ\n"
                f"  first sha256:  {first_digest}\n"
                f"  second sha256: {second_digest}"
            )
        if first_bytes != committed_bytes:
            committed_digest = hashlib.sha256(committed_bytes).hexdigest()
            candidate_digest = hashlib.sha256(first_bytes).hexdigest()
            raise SystemExit(
                "FAIL PDF reproduction: temporary build differs from the "
                "committed PDF\n"
                f"  committed sha256: {committed_digest}\n"
                f"  candidate sha256: {candidate_digest}\n"
                "  committed PDF was not modified"
            )
    print(
        "PASS two clean PDF builds at unequal path lengths match each other "
        "and the committed PDF byte for byte"
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument(
        "--markdown-only",
        action="store_true",
        help="write the assembled Markdown paper without invoking Pandoc",
    )
    modes.add_argument(
        "--check-pdf",
        action="store_true",
        help="build a temporary PDF and compare it with the committed paper",
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.markdown_only:
        output = args.output or UNIFIED_MARKDOWN
        LocalWorkspace(ROOT).output(output).write_bytes(
            unified_markdown_manuscript().encode("utf-8")
        )
        return
    if args.check_pdf:
        check_pdf_build()
        return
    output = args.output or PAPER_PDF
    build_pdf(output)


if __name__ == "__main__":
    main()
