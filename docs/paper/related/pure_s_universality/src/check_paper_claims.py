#!/usr/bin/env python3
"""Audit the prize-paper claims, notation, citations, and local links.

This checker deliberately reads the canonical Markdown template rather than the
typeset PDF.  It rejects silent drift in the claim boundary, the universality
comparison, the literal checkpoint constructors, the fixed endpoint counts, and
the distinction between selected-path computation and observer verification.
"""

from __future__ import annotations

import hashlib
import json
import re
import sys
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from pathlib import Path
from urllib.parse import unquote, urlsplit


sys.dont_write_bytecode = True

ROOT = Path(__file__).resolve().parents[1]
TEMPLATE = ROOT / "paper" / "unified_template.md"
REFERENCES = ROOT / "paper" / "references.md"
GRAMMAR = ROOT / "artifacts" / "checkpoint_grammar.json"
PUBLIC_API = ROOT / "formalization" / "generated" / "public_api.json"
PUBLIC_LEDGER = ROOT / "formalization" / "generated" / "public_theorem_signatures.md"
BUILD_PAPER = ROOT / "src" / "build_paper.py"

PERSISTENT_TITLE = (
    "# Pure S Is Computationally Universal Under a Fixed "
    "Persistent-Cursor Evaluator"
)
TERM_ONLY_TITLE = (
    "# Pure S Is Computationally Universal Under a Fixed "
    "Root-Restarted Finite Controller"
)

REQUIRED_HEADINGS = (
    "## Abstract",
    "## 1. Problem and central idea",
    "## 2. Model and main theorem",
    "## 3. A worked computation",
    "## 4. Representation and exact checkpoints",
    "## 5. Selection from a fresh root",
    "## 6. Universal compilation and source output",
    "## 7. Interface bounds and execution evidence",
    "## 8. Formal assurance and related work",
    "## Appendix A. Glossary",
    "## Appendix B. Formal declaration map",
    "## Appendix C. Unrestricted reduction and certificate histories",
    "## Appendix D. Fixed Rogozhin table and compiler conventions",
    "## Appendix E. Persistent-controller traces and finite-control counts",
    "## Appendix F. Comparison of computation models",
    "## References",
)

REQUIRED_THEOREM_HEADINGS = (
    "### Theorem 1.",
    "### Theorem 2.",
    "### Theorem 3.",
    "### Theorem 4.",
    "### Theorem 5.",
)

EXPECTED_PLACEHOLDERS = {
    "SIG_THEOREM_1": 1,
    "SIG_THEOREM_2": 1,
    "SIG_THEOREM_3": 1,
    "SIG_THEOREM_4": 1,
    "SIG_THEOREM_5": 1,
    "PUBLIC_THEOREM_SIGNATURES": 1,
    "PUBLIC_EXPORT_COUNT": 2,
    "REFERENCES": 1,
    "ROGOZHIN_CTS_SHA256": 1,
}

DOI_LINK = re.compile(
    r"\[doi:(?P<label>[^\]]+)\]\("
    r"(?:<(?P<angle>https://doi\.org/[^>]+)>|"
    r"(?P<plain>https://doi\.org/[^)\s]+))\)"
)
MARKDOWN_LINK = re.compile(
    r"!?\[[^\]]*\]\((?P<destination><[^>]+>|[^)\s]+)\)"
)
TAG = re.compile(r"\\tag\{([^}]+)\}")
PLACEHOLDER = re.compile(r"\{\{([A-Z0-9_]+)\}\}")
# These are stable source identities. Their displayed numbering is generated
# from first occurrence after the manuscript has been assembled.
NUMERIC_SOURCE_TAGS = {str(number) for number in range(1, 21)}


@dataclass(frozen=True)
class Failure:
    rule: str
    message: str
    line: int | None = None


class Audit:
    def __init__(self, source: str) -> None:
        self.source = source
        self.failures: list[Failure] = []

    def line_of(self, needle: str) -> int | None:
        index = self.source.find(needle)
        if index < 0:
            return None
        return self.source.count("\n", 0, index) + 1

    def require(
        self, condition: bool, rule: str, message: str, *, needle: str | None = None
    ) -> None:
        if not condition:
            self.failures.append(
                Failure(rule, message, None if needle is None else self.line_of(needle))
            )

    def fail(self, rule: str, message: str, line: int | None = None) -> None:
        self.failures.append(Failure(rule, message, line))


def section(text: str, heading: str, next_heading: str | None = None) -> str:
    start = text.find(heading)
    if start < 0:
        return ""
    end = -1 if next_heading is None else text.find(next_heading, start + len(heading))
    if end < 0:
        # Bound claims to their own section, and preserve independent
        # diagnostics when an explicitly named following heading is absent.
        level = len(heading) - len(heading.lstrip("#"))
        candidate = re.search(
            rf"(?m)^#{{1,{level}}}\s+", text[start + len(heading) :]
        )
        end = (
            len(text)
            if candidate is None
            else start + len(heading) + candidate.start()
        )
    return text[start:end]


def without_fenced_code(text: str) -> str:
    """Replace fenced-code contents by blank lines, preserving line numbers."""
    output: list[str] = []
    fenced = False
    fence_marker = ""
    for line in text.splitlines():
        stripped = line.lstrip()
        if stripped.startswith(("```", "~~~")):
            marker = stripped[:3]
            if not fenced:
                fenced = True
                fence_marker = marker
            elif marker == fence_marker:
                fenced = False
                fence_marker = ""
            output.append("")
        else:
            output.append("" if fenced else line)
    return "\n".join(output)


def prose_sentences(text: str) -> list[tuple[int, str]]:
    """Return approximate prose sentences with stable starting line numbers."""
    masked = without_fenced_code(text)
    # Displayed mathematics is irrelevant to prose-qualification checks.
    masked = re.sub(r"\$\$.*?\$\$", lambda m: "\n" * m.group(0).count("\n"), masked, flags=re.S)
    result: list[tuple[int, str]] = []
    for match in re.finditer(r"(?:^|(?<=[.!?]))\s+(.+?)(?=(?:[.!?](?:\s+|$))|\Z)", masked, re.S):
        value = re.sub(r"\s+", " ", match.group(1)).strip()
        if not value:
            continue
        result.append((masked.count("\n", 0, match.start(1)) + 1, value))
    return result


def normalized_latex(value: str) -> str:
    # Alignment markers do not alter the term represented by a display.
    return re.sub(r"[\s&]+", "", value)


def exported_text() -> str:
    pieces: list[str] = []
    if PUBLIC_API.is_file():
        pieces.append(PUBLIC_API.read_text(encoding="utf-8"))
    if PUBLIC_LEDGER.is_file():
        pieces.append(PUBLIC_LEDGER.read_text(encoding="utf-8"))
    return "\n".join(pieces)


def has_term_only_theorem(exports: str) -> bool:
    # A recursive term selector alone does not establish a finite machine.
    # Require the unconditional aggregate type, whose fields join
    # the actual invocation contract, every-sample agreement and interfaces.
    return has_exact_public_types(exports, {
        "PureSFormal.RootResetChallenge.sCombinatorIsRootResetComputationUniversal":
            ": RootResetComputationUniversality",
    })


def has_computable_reduction(exports: str) -> bool:
    try:
        api, _ = json.JSONDecoder().raw_decode(exports.lstrip())
        records = api["exports"]
        by_name = {record["declaration"]: record for record in records}
        if len(by_name) != len(records):
            return False
        compiler = "PureSFormal.Computation.CookEncodingComputability"
        reduction = "PureSFormal.Computation.DeterministicTapeEffectiveReduction.effectiveReduction"
        expected = {
            compiler + ".Program.eval_sourceTerm":
                "(number : Nat) : sourceTerm.eval₁ number = "
                "(DeterministicTapePureS.encodeTerm (DeterministicTapeCode.instanceDecodeCode number)).code",
            compiler + ".sourceTerm_computable":
                ": PartialRecursive.Computable fun number => "
                "(DeterministicTapePureS.encodeTerm (DeterministicTapeCode.instanceDecodeCode number)).code",
            reduction:
                ": PartialRecursive.Computable encoder ∧ "
                "ReducesVia encoder sourcePredicate targetPredicate",
        }
        return all(
            " ".join(by_name[name]["normalized_type"].split()) == name + " " + signature
            and set(by_name[name]["axioms"]) <= {"propext", "Quot.sound"}
            for name, signature in expected.items()
        )
    except (KeyError, TypeError, ValueError):
        return False


def has_generator_computability(exports: str) -> bool:
    names = (
        "generatorProgram_correct",
        "generatorCode_primitiveRecursive",
        "generatorCode_computable",
    )
    return all(name in exports for name in names) and "PartialRecursive.Computable" in exports


def has_exact_public_types(exports: str, expected: dict[str, str]) -> bool:
    try:
        api, _ = json.JSONDecoder().raw_decode(exports.lstrip())
        records = api["exports"]
        by_name = {record["declaration"]: record for record in records}
        if len(by_name) != len(records):
            return False
        return all(
            " ".join(by_name[name]["normalized_type"].split()) == name + " " + signature
            and set(by_name[name]["axioms"]) <= {"propext", "Quot.sound"}
            for name, signature in expected.items()
        )
    except (KeyError, TypeError, ValueError):
        return False


def has_literal_source_output(exports: str) -> bool:
    namespace = "PureSFormal.Computation.DeterministicTapePureSOutput."
    tape = "Research.ProtectedTrieDeterministicCompiler.DeterministicTape."
    source = f"(source : {tape}Instance)"
    row = f"(row : {tape}Row)"
    run = f"∃ sourceFuel, {tape}runFor? source.machine ({tape}initialRow source) sourceFuel = some row"
    expected = {
        "termAt_zero": source + " : termAt source 0 = encode source",
        "termAt_step": source + " (sample : Nat) : PureS.Step (termAt source sample) (termAt source (sample + 1))",
        "encode_code_primitiveRecursive":
            ": PrimitiveRecursive fun number => (encode (DeterministicTapeCode.instanceDecodeCode number)).code",
        "exists_literalRow_iff": source + " " + row +
            " : (∃ sample, decodeRow? (termAt source sample) = some row) ↔ " + run,
        "exists_terminalRow_iff": source + " " + row +
            " : (∃ sample, decodeTerminalRow? (termAt source sample) = some row) ↔ (" + run +
            f") ∧ {tape}step? source.machine row = none",
        "exists_scannedOutput_iff": source +
            " (output : Bool) : (∃ sample, decodeScannedOutput? (termAt source sample) = some output) ↔ Returns source output",
        "bitToggle_output_iff": "(input output : Bool) : "
            "(∃ sample, decodeScannedOutput? (termAt (CookSeedOutputExample.source input) sample) = some output) ↔ output = !input",
    }
    return has_exact_public_types(exports, {namespace + name: signature for name, signature in expected.items()})


def has_primitive_interface_bounds(exports: str) -> bool:
    namespace = "PureSFormal.PureS.PrimitiveInterfaceCertificates."
    parameters = "(program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) : "
    interfaces = (
        ("primitivePublicDecoder_resource_certificate", "PublicDecoderPrimitive", "decode", "PublicDecoder.decode"),
        ("primitiveMarkedDetector_resource_certificate", "TermEventPrimitive", "observesMarkedCheckpoint", "TermEvent.observesMarkedCheckpoint?"),
        ("primitiveSeedReadback_resource_certificate", "CheckpointSeedReadbackPrimitive", "decode", "CheckpointSeedReadback.decode?"),
    )
    expected = {}
    for name, module, function, reference in interfaces:
        call = f"({module}.{function} program tree term)"
        expected[namespace + name] = parameters + (
            f"{call}.value = {reference} program tree term ∧ "
            f"{call}.operations ≤ {module}.coefficient program tree * (term.size + 1) ^ 2"
        )
    return has_exact_public_types(exports, expected)


def check_structure(audit: Audit, text: str, *, term_only: bool) -> None:
    lines = text.splitlines()
    expected_title = TERM_ONLY_TITLE if term_only else PERSISTENT_TITLE
    audit.require(bool(lines) and lines[0] == expected_title, "title", f"first line must be exactly {expected_title!r}")

    positions: list[int] = []
    for heading in REQUIRED_HEADINGS:
        count = lines.count(heading)
        audit.require(count == 1, "sections", f"required heading must occur once: {heading} (found {count})", needle=heading)
        positions.append(text.find(heading))
    if all(position >= 0 for position in positions):
        audit.require(positions == sorted(positions), "sections", "required sections are not in canonical order")

    for prefix in REQUIRED_THEOREM_HEADINGS:
        matches = [line for line in lines if line.startswith(prefix)]
        audit.require(len(matches) == 1, "theorems", f"required theorem heading must occur once: {prefix} (found {len(matches)})")

    abstract = section(text, "## Abstract")
    model = section(text, "## 2. Model and main theorem")
    normalized_model = re.sub(r"\s+", " ", model)
    cursor_phrase = "temporary cursor" if term_only else "persistent cursor"
    for phrase in ("$(q,p,T)$", "finite control", cursor_phrase):
        audit.require(
            phrase in normalized_model,
            "claim-boundary",
            f"Section 2 is missing evaluator boundary {phrase!r}",
            needle="## 2. Model and main theorem",
        )
    audit.require(
        any(phrase in normalized_model for phrase in (
            "arbitrary depth", "arbitrary-depth", "can grow with tree depth",
        )),
        "claim-boundary",
        "Section 2 must expose the cursor's unbounded address depth",
        needle="## 2. Model and main theorem",
    )
    audit.require(
        any(phrase in normalized_model for phrase in (
            "Only the contraction changes $T$",
            "only a contextual $\\mathbf S$-contraction changes $T$",
        )) and "contextual" in normalized_model and normalized_latex(
            r"(((\mathbf S X)Y)Z)\longrightarrow_{\mathbf S}(XZ)(YZ)"
        ) in normalized_latex(model),
        "claim-boundary",
        "Section 2 must identify native contextual S-contraction as the only term mutation",
        needle="## 2. Model and main theorem",
    )
    if term_only:
        for phrase in (
            "Every invocation starts at the root in the same initial control",
            "returns the contracted bare term",
            "temporary control and cursor are discarded",
        ):
            audit.require(
                phrase in normalized_model,
                "claim-boundary",
                f"Section 2 is missing the root-reset contract {phrase!r}",
                needle="## 2. Model and main theorem",
            )
    else:
        audit.require(
            "cursor is retained between contractions and is not part of $T$" in normalized_model,
            "claim-boundary",
            "persistent-cursor paper must expose the state retained outside the bare term",
            needle="## 2. Model and main theorem",
        )

    first_page = text[: text.find("## 1. Problem and central idea")]
    for phrase in (("root", "temporary cursor") if term_only else ("persistent", "cursor")):
        audit.require(phrase.lower() in re.sub(r"\s+", " ", first_page.lower()), "first-page-boundary", f"first-page model boundary is missing {phrase!r}")
    audit.require("using only `propext` and `Quot.sound`" in abstract, "axiom-wording", "abstract must use 'using only `propext` and `Quot.sound`'")

    main_theorem = section(text, "### Theorem 1R.")
    if term_only:
        audit.require(
            bool(main_theorem) and main_theorem in model,
            "main-theorem-order",
            "the root-reset main theorem must appear in Section 2, before the worked computation and construction",
        )
    worked = section(text, "## 3. A worked computation")
    worked_trace = section(text, "### 3.2 Computing 101 → 011 → 11")
    worked_observations = section(text, "### 3.3 Observed checkpoints")
    grammar_position = text.find("### 4.2 The checkpoint grammar")
    audit.require(
        bool(worked) and bool(worked_trace) and bool(worked_observations)
        and worked_trace in worked and worked_observations in worked
        and "\\tag{G2}" in worked and grammar_position > text.find(worked),
        "worked-example-order",
        "Section 3 must contain the local contraction (G2), worked computation and observed checkpoints before the Section 4 checkpoint grammar",
    )
    for phrase in (
        "strictly increasing",
        "ordered sampling of every defined finite source prefix",
        "Neither statement identifies source time from a row value or orders every accepted source-row observation",
        "Repeated configurations and observations can have different times",
    ):
        audit.require(
            phrase in normalized_model,
            "source-order-boundary",
            f"Section 2 must state the finite-prefix versus complete-observation-order boundary: {phrase!r}",
            needle="## 2. Model and main theorem",
        )


def check_claim_boundary_table(audit: Audit, text: str, *, term_only: bool) -> None:
    comparison = section(text, "### F.1 Selected paths and unrestricted reduction")
    rows: list[tuple[int, str]] = []
    for line in comparison.splitlines():
        cells = [cell.strip() for cell in line.strip().split("|")[1:-1]] if line.strip().startswith("|") else []
        if not cells:
            continue
        number = re.sub(r"[*_`]", "", cells[0]).strip()
        if number.isdigit():
            rows.append((int(number), line))
    numbers = [number for number, _ in rows]
    audit.require(numbers == list(range(1, 9)), "model-comparison", f"comparison must contain entries 1--8 in order; found {numbers}")
    by_number = {number: row.lower() for number, row in rows}
    audit.require("persistent" in by_number.get(5, "") and "proved" in by_number.get(5, ""), "model-comparison", "entry 5 must state the proved persistent-cursor result")
    if not term_only:
        audit.require("not claimed" in by_number.get(6, ""), "model-comparison", "entry 6 must remain explicitly outside the proved result")
    else:
        audit.require("finite" in by_number.get(6, "") and "proved" in by_number.get(6, ""),
                      "model-comparison", "entry 6 must identify the proved finite root-restarted selector")

    appendix = section(text, "## Appendix F. Comparison of computation models")
    scope_headings = re.findall(
        r"(?m)^### F\.\d+ Exact scope of the claims[ \t]*$", appendix
    )
    audit.require(
        len(scope_headings) == 1,
        "claim-boundary",
        "Appendix F must contain exactly one 'Exact scope of the claims' subsection",
    )
    boundary = section(appendix, scope_headings[0]) if len(scope_headings) == 1 else ""
    audit.require("| Question | Exact status |" in boundary, "claim-boundary", "The exact-scope subsection must contain the compact claim-boundary table")
    for phrase in (
        "one fixed finite controller with one persistent cursor",
        "decoder use only the current bare term",
        "every deterministic tape row decoded",
        "What does the halting reduction certify?",
        "unrestricted graph simulate source branching locally",
    ):
        audit.require(phrase in boundary, "claim-boundary", f"The exact-scope subsection is missing boundary question {phrase!r}")
    if not term_only:
        audit.require(
            "No such theorem is used here" in boundary and "arbitrary-depth cursor" in boundary,
            "claim-boundary",
            "The exact-scope subsection must distinguish the persistent-cursor theorem from a term-only theorem",
        )


def load_grammar(audit: Audit) -> dict[str, object]:
    try:
        data = json.loads(GRAMMAR.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        audit.fail("grammar-ledger", f"cannot read {GRAMMAR.relative_to(ROOT)}: {exc}")
        return {}
    audit.require(data.get("schema") == "PURE_S_PAPER_CHECKPOINT_GRAMMAR_V1", "grammar-ledger", "unexpected checkpoint-grammar schema")
    return data


def check_grammar(audit: Audit, text: str, grammar: dict[str, object]) -> None:
    grammar_section = section(text, "### 4.2 The checkpoint grammar")
    queue_section = section(text, "### 3.1 Queue cells and cyclic-tag steps")
    audit.require(bool(grammar_section), "checkpoint-grammar", "checkpoint-grammar section is missing")
    audit.require(bool(queue_section), "checkpoint-grammar", "worked queue-constructor section is missing")
    queue_constructors = {
        "b", "C_zero", "C_successor", "v_zero", "v_one", "omega",
        "live_cell", "live_cell_contractum",
    }
    constructors = grammar.get("constructors", [])
    audit.require(isinstance(constructors, list) and bool(constructors), "grammar-ledger", "constructor ledger must be a nonempty list")
    names: list[str] = []
    for entry in constructors if isinstance(constructors, list) else []:
        if not isinstance(entry, dict):
            audit.fail("grammar-ledger", "every constructor entry must be an object")
            continue
        name = entry.get("name")
        latex = entry.get("latex")
        source = entry.get("source")
        witness = entry.get("source_witness")
        if not all(isinstance(value, str) and value for value in (name, latex, source, witness)):
            audit.fail("grammar-ledger", f"malformed constructor entry: {entry!r}")
            continue
        names.append(name)
        constructor_heading = (
            "### 3.1 Queue cells and cyclic-tag steps"
            if name in queue_constructors else "### 4.2 The checkpoint grammar"
        )
        normalized = normalized_latex(
            queue_section if name in queue_constructors else grammar_section
        )
        audit.require(
            normalized_latex(latex) in normalized,
            "checkpoint-grammar",
            f"displayed constructor {name!r} differs from the machine-readable ledger: {latex}",
            needle=constructor_heading,
        )
        source_path = ROOT / source
        audit.require(source_path.is_file(), "grammar-source", f"constructor {name!r} names missing source {source}")
        if source_path.is_file():
            audit.require(
                witness in source_path.read_text(encoding="utf-8"),
                "grammar-source",
                f"constructor {name!r} source witness is absent from {source}",
            )
    audit.require(len(names) == len(set(names)), "grammar-ledger", "constructor names must be unique")

    audit.require("opaque" in grammar_section.lower() and "never compares" in grammar_section.lower(), "checkpoint-grammar", "grammar must state that audit/history fields are opaque and not compared")


def check_fixed_endpoint(audit: Audit, text: str, grammar: dict[str, object]) -> None:
    endpoint = grammar.get("fixed_endpoint", {})
    if not isinstance(endpoint, dict):
        audit.fail("fixed-endpoint", "fixed_endpoint ledger entry must be an object")
        return
    artifact_name = endpoint.get("artifact")
    if not isinstance(artifact_name, str):
        audit.fail("fixed-endpoint", "fixed endpoint has no artifact path")
        return
    artifact_path = ROOT / artifact_name
    audit.require(artifact_path.is_file(), "fixed-endpoint", f"missing endpoint artifact {artifact_name}")
    if not artifact_path.is_file():
        return
    try:
        artifact = json.loads(artifact_path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        audit.fail("fixed-endpoint", f"invalid endpoint artifact JSON: {exc}")
        return
    compiler = artifact.get("compiler", {})
    appendants = artifact.get("cts_appendants", [])
    alphabet = artifact.get("tag_alphabet", [])
    productions = artifact.get("tag_productions", [])
    expected_period = endpoint.get("period")
    expected_delete = endpoint.get("deletion_number")
    expected_alphabet = endpoint.get("tag_alphabet_size")
    expected_production_appendants = endpoint.get("production_appendants")
    expected_empty = endpoint.get("empty_appendants")
    audit.require(isinstance(compiler, dict), "fixed-endpoint", "artifact compiler field must be an object")
    if isinstance(compiler, dict):
        audit.require(compiler.get("cts_period") == expected_period, "fixed-endpoint", "ledger/artifact CTS period mismatch")
        audit.require(compiler.get("deletion_number") == expected_delete, "fixed-endpoint", "ledger/artifact deletion number mismatch")
        audit.require(compiler.get("tag_alphabet_size") == expected_alphabet, "fixed-endpoint", "ledger/artifact alphabet-size mismatch")
    audit.require(isinstance(appendants, list) and len(appendants) == expected_period, "fixed-endpoint", "artifact appendant count does not equal its period")
    audit.require(isinstance(alphabet, list) and len(alphabet) == expected_alphabet, "fixed-endpoint", "artifact tag alphabet count mismatch")
    audit.require(isinstance(productions, list) and len(productions) == expected_production_appendants, "fixed-endpoint", "artifact production count mismatch")
    if isinstance(appendants, list) and isinstance(expected_production_appendants, int):
        tail = appendants[expected_production_appendants:]
        audit.require(len(tail) == expected_empty and all(not item for item in tail), "fixed-endpoint", "artifact does not end in exactly 798 empty appendants")

    endpoint_section = section(text, "## 6. Universal compilation and source output")
    for fragment in (
        "The first 114 appendants are the encoded productions",
        "798 empty appendants",
        "114\\cdot8=912",
        "`{{ROGOZHIN_CTS_SHA256}}`",
    ):
        audit.require(normalized_latex(fragment) in normalized_latex(endpoint_section), "fixed-endpoint", f"Section 6 is missing endpoint fact {fragment!r}")
    build_source = BUILD_PAPER.read_text(encoding="utf-8") if BUILD_PAPER.is_file() else ""
    audit.require("{{ROGOZHIN_CTS_SHA256}}" in build_source and "hashlib.sha256(ROGOZHIN_CTS_ARTIFACT.read_bytes()).hexdigest()" in build_source, "fixed-endpoint", "paper builder must inject the endpoint artifact's computed SHA-256")

    # Numeric controller claims are read from their proof source, not copied
    # from this script as a second authority.
    count_source_path = ROOT / "formalization/PureSFormal/PureS/ControllerStateCount.lean"
    count_source = count_source_path.read_text(encoding="utf-8") if count_source_path.is_file() else ""
    claims = {
        "cook_registerCoverEntryCount": "21,888",
        "cook_codeNodeCoverEntryCount": "3,647",
        "cook_macroTemplateCount": "10,970",
        "cook_probeTemplateCount": "417,822",
        "cook_scriptTemplateCount": "3,028,833",
        "cook_controlTemplateCount": "3,457,625",
        "cook_controlCoverEntryCount": "75,680,496,000",
        "cook_runtimeCoverEntryCount": "75,680,496,001",
    }
    evaluator_section = section(text, "### E.4 The persistent control cover")
    for theorem, formatted in claims.items():
        raw = formatted.replace(",", "")
        theorem_match = re.search(rf"theorem\s+{re.escape(theorem)}\b[\s\S]{{0,420}}?=\s*{raw}\s*:=", count_source)
        audit.require(theorem_match is not None, "controller-counts", f"could not recover {theorem} = {raw} from ControllerStateCount.lean")
        audit.require(formatted in evaluator_section, "controller-counts", f"Appendix E.4 is missing checked controller count {formatted} ({theorem})")


def check_placeholders_and_tags(audit: Audit, text: str, grammar: dict[str, object]) -> None:
    placeholders = PLACEHOLDER.findall(text)
    audit.require(set(placeholders) == set(EXPECTED_PLACEHOLDERS), "placeholders", f"template placeholder set drifted: found {sorted(set(placeholders))}")
    for token, expected_count in EXPECTED_PLACEHOLDERS.items():
        audit.require(
            placeholders.count(token) == expected_count,
            "placeholders",
            f"placeholder {token} must occur exactly {expected_count} time(s)",
        )
    masked = without_fenced_code(text)
    for pattern, label in (
        (r"\bTODO\b", "TODO"),
        (r"\bTBD\b", "TBD"),
        (r"\bFIXME\b", "FIXME"),
        (r"(?<![0-9a-f])0{64}(?![0-9a-f])", "zero SHA-256"),
    ):
        match = re.search(pattern, masked, flags=re.I)
        if match:
            audit.fail("stale-marker", f"manuscript contains stale marker {label}", masked.count("\n", 0, match.start()) + 1)

    tags = TAG.findall(masked)
    duplicates = sorted(tag for tag in set(tags) if tags.count(tag) > 1)
    audit.require(not duplicates, "equation-tags", f"duplicate equation tags: {duplicates}")
    required_grammar_tags = grammar.get("required_grammar_tags", [])
    audit.require([tag for tag in tags if tag.startswith("G")] == required_grammar_tags, "equation-tags", f"grammar tags must be exactly {required_grammar_tags}")
    numeric = {tag for tag in tags if tag.isdigit()}
    audit.require(numeric == NUMERIC_SOURCE_TAGS, "equation-tags", f"numeric source equation identities must remain exactly {sorted(NUMERIC_SOURCE_TAGS, key=int)}; found {sorted(numeric, key=int)}")
    audit.require(tags.count("W1") == 1, "equation-tags", "worked-construction tag W1 must occur exactly once")
    allowed = set(required_grammar_tags if isinstance(required_grammar_tags, list) else []) | {"W1", "2a", "1R", "RootPotential", "RootLinear", "SourceOrder", "RegularCTS", "RegularSource"} | NUMERIC_SOURCE_TAGS
    audit.require(set(tags) <= allowed, "equation-tags", f"unexpected named equation tags: {sorted(set(tags) - allowed)}")


def check_equation_numbering(
    audit: Audit, source: str, assembled: str, mapping: dict[str, int]
) -> None:
    """Check the builder's source-identity map and final visible equation tags."""
    source_tags = TAG.findall(without_fenced_code(source))
    expected_mapping = {tag: index for index, tag in enumerate(source_tags, 1)}
    audit.require(
        len(source_tags) == len(set(source_tags)),
        "equation-numbering",
        "each source equation identity must occur exactly once before numbering",
    )
    audit.require(
        isinstance(mapping, dict)
        and mapping == expected_mapping
        and all(type(number) is int for number in mapping.values()),
        "equation-numbering",
        "the builder must map every source equation identity exactly once to its first-occurrence integer",
    )
    visible_tags = TAG.findall(without_fenced_code(assembled))
    expected_visible = [str(number) for number in range(1, len(source_tags) + 1)]
    audit.require(
        visible_tags == expected_visible,
        "equation-numbering",
        f"assembled visible equation tags must be consecutive integers 1--{len(source_tags)}; found {visible_tags}",
    )


def check_assembled_equations(audit: Audit, source: str) -> None:
    # Use the same numbering helper and complete signature-checked assembly
    # that produce the manuscript, then independently check their result.
    import build_paper

    try:
        _, mapping = build_paper.number_equations(source)
        assembled = build_paper.unified_markdown_manuscript()
    except (OSError, ValueError, TypeError, KeyError, AttributeError) as exc:
        audit.fail("equation-numbering", f"cannot validate assembled equation numbering: {exc}")
        return
    check_equation_numbering(audit, source, assembled, mapping)


def citation_numbers(text: str) -> set[int]:
    numbers: set[int] = set()
    masked = without_fenced_code(text)
    in_display = False
    pattern = re.compile(r"(?<![A-Za-z0-9_+{])\[(\d+(?:(?:--|–|-)\d+)?(?:,\d+(?:(?:--|–|-)\d+)?)*)\]")
    for line in masked.splitlines():
        if line.count("$$") % 2 == 1:
            in_display = not in_display
            continue
        if in_display:
            continue
        # A list literal inside inline mathematics is data, not a citation.
        prose_line = re.sub(r"(?<!\\)\$(?!\$).*?(?<!\\)\$", "", line)
        prose_line = re.sub(r"`[^`]*`", "", prose_line)
        for match in pattern.finditer(prose_line):
            for part in match.group(1).split(","):
                range_match = re.fullmatch(r"(\d+)(?:--|–|-)(\d+)", part)
                if range_match:
                    first, last = map(int, range_match.groups())
                    if first <= last:
                        numbers.update(range(first, last + 1))
                    else:
                        numbers.update((first, last))
                else:
                    numbers.add(int(part))
    return numbers


def check_references(audit: Audit, text: str, references: str) -> None:
    entries = [int(value) for value in re.findall(r"(?m)^(\d+)\.\s", references)]
    expected = list(range(1, len(entries) + 1))
    audit.require(entries == expected, "references", f"references must be numbered consecutively; found {entries}")
    cited = citation_numbers(text)
    nonexistent = sorted(cited - set(entries))
    uncited = sorted(set(entries) - cited)
    audit.require(not nonexistent, "citations", f"citations have no reference entry: {nonexistent}")
    audit.require(not uncited, "citations", f"reference entries are never cited: {uncited}")

    doi_occurrences = references.lower().count("doi:")
    matches = list(DOI_LINK.finditer(references))
    audit.require(doi_occurrences == len(matches), "doi-links", f"found {doi_occurrences} DOI labels but only {len(matches)} well-formed DOI links")
    identifiers: list[str] = []
    destinations: list[str] = []
    for match in matches:
        label = match.group("label")
        destination = match.group("angle") or match.group("plain")
        identifier = destination.removeprefix("https://doi.org/")
        audit.require(label.casefold() == identifier.casefold(), "doi-links", f"DOI label/target mismatch: {label!r} vs {identifier!r}")
        identifiers.append(identifier.casefold())
        destinations.append(destination.casefold())
    audit.require(len(identifiers) == len(set(identifiers)), "doi-links", "duplicate DOI identifier in references")
    audit.require(len(destinations) == len(set(destinations)), "doi-links", "duplicate DOI target in references")


def check_relative_links(audit: Audit, paths: tuple[Path, ...]) -> None:
    root_resolved = ROOT.resolve()
    for path in paths:
        source = path.read_text(encoding="utf-8")
        for match in MARKDOWN_LINK.finditer(source):
            destination = match.group("destination").strip("<>")
            parsed = urlsplit(destination)
            if parsed.scheme or destination.startswith("#"):
                continue
            local = unquote(parsed.path)
            if not local:
                continue
            line = source.count("\n", 0, match.start()) + 1
            candidate = (path.parent / local).resolve()
            try:
                candidate.relative_to(root_resolved)
            except ValueError:
                audit.fail("relative-links", f"{path.relative_to(ROOT)} link escapes package root: {destination}", line)
                continue
            if not candidate.exists():
                audit.fail("relative-links", f"{path.relative_to(ROOT)} has broken local link: {destination}", line)


def check_dangerous_wording(
    audit: Audit, text: str, *, term_only: bool, computable_reduction: bool
) -> None:
    prose = without_fenced_code(text)
    lowered = prose.lower()
    for phrase in ("s alone is universal", "the s combinator is universal", "strong multiway universality", "sole axiom"):
        index = lowered.find(phrase)
        if index >= 0:
            audit.fail("claim-wording", f"forbidden or misleading phrase: {phrase!r}", prose.count("\n", 0, index) + 1)
    extensional_many_one = re.search(r"extensional(?:ly)?\s+many[-‑]one", prose, flags=re.I)
    if extensional_many_one:
        audit.fail("computability-wording", "an extensional relation must not be called many-one", prose.count("\n", 0, extensional_many_one.start()) + 1)

    sentences = prose_sentences(text)
    for line, sentence in sentences:
        plain = sentence.replace("$", "").replace("\\mathbf", "").replace("{", "").replace("}", "")
        low = plain.lower()
        if re.search(r"(?:pure[- ]?s|s combinator)(?:\s+alone)?\s+is\s+(?:computationally\s+)?universal\b", low):
            if not any(qualifier in low for qualifier in (" under ", "evaluator", "strategy")):
                audit.fail("qualified-universality", "pure S is called universal without naming the evaluator/strategy in the same sentence", line)
        if "finite-state evaluator" in low and not term_only:
            context = " ".join(value for candidate_line, value in sentences if abs(candidate_line - line) <= 5).lower()
            if not ("cursor" in context and ("unbounded" in context or "arbitrary-depth" in context)):
                audit.fail("cursor-boundary", "'finite-state evaluator' must be adjacent to the unbounded-cursor qualification", line)

        reduction_language = any(
            marker in low
            for marker in (
                "many-one",
                "many‑one",
                "effective reduction",
                "computable reduction from coded",
                "computably reduces",
                "computable hardness",
                "c.e.-complete",
            )
        )
        if reduction_language and not computable_reduction:
            allowed = any(
                marker in low
                for marker in (
                    "not described",
                    "not a formal",
                    "required",
                    "obligation",
                    "needed for",
                    "does not yet",
                    "no computability",
                    "separate",
                    "statman",
                    "standard many-one terminology",
                )
            )
            if not allowed:
                audit.fail("computability-wording", "computable/many-one language is positive but no computability-bearing public theorem is present", line)

        if "polynomial simulation" in low and not any(marker in low for marker in ("conditional", "premise", "if ", "not ", "no ")):
            audit.fail("complexity-wording", "polynomial simulation requires its premise and cost unit in the same sentence", line)

    theorem_five = section(text, "### Theorem 5.")
    for match in re.finditer(r"\b(?:multiway simulation|bisimulation|step-for-step simulation)\b", theorem_five, flags=re.I):
        start = max(0, theorem_five.rfind(".", 0, match.start()) + 1)
        end_match = re.search(r"[.!?]", theorem_five[match.end():])
        end = len(theorem_five) if end_match is None else match.end() + end_match.end()
        sentence = theorem_five[start:end].lower()
        if not any(marker in sentence for marker in ("not ", "no ", "does not", "rather than", "cannot")):
            line = text.count("\n", 0, text.find("### Theorem 5.") + match.start()) + 1
            audit.fail("theorem-5-boundary", "Theorem 5 is described positively as simulation/bisimulation", line)

    # Waldmann's result supports the normal-form target obstruction, not a
    # blanket impossibility of computation by other observables.
    for match in re.finditer(r"normal(?:ization| form)[^.]{0,180}decid", prose, flags=re.I):
        window = prose[match.start() : match.start() + 520].lower()
        if "consequently" in window or "therefore" in window or "hence" in window:
            if not ("normal-form existence" in window and "computable reduction" in window):
                audit.fail("normalization-scope", "normalization decidability is used beyond the normal-form-existence reduction obstruction", prose.count("\n", 0, match.start()) + 1)


def check_cross_surface_boundaries(
    audit: Audit, text: str, *, term_only: bool, computable_reduction: bool, exports: str
) -> None:
    if term_only:
        audit.require(text.count("### Theorem 1R.") == 1 and TAG.findall(text).count("1R") == 1,
                      "finite-root-reset-claim", "the finite aggregate requires one root-reset theorem and its exact successor equation")
    else:
        audit.require("### Theorem 1R." not in text and "1R" not in TAG.findall(text),
                      "finite-root-reset-claim", "a root-reset theorem requires the unconditional finite-controller aggregate")
    abstract = section(text, "## Abstract")
    theorem_one = section(text, "### Theorem 1.")
    theorem_five = section(text, "### Theorem 5.")
    conclusion = section(text, "### 8.3 Consequence")
    for name, surface in (
        ("abstract", abstract),
        ("Theorem 1", theorem_one),
        ("Section 8.3 consequence", conclusion),
    ):
        lower = surface.lower()
        audit.require("checkpoint" in lower and ("reject" in lower or "every other" in lower), "checkpoint-exclusion", f"{name} must state checkpoint acceptance and noncheckpoint rejection")
        if not term_only:
            audit.require("cursor" in lower and "persistent" in lower, "cursor-boundary", f"{name} must name the persistent cursor")
    audit.require("observer" in theorem_five.lower() and "verif" in theorem_five.lower(), "theorem-5-boundary", "Theorem 5 must be explicitly observer-verified")
    audit.require(
        any(phrase in re.sub(r"\s+", " ", theorem_five.lower()) for phrase in (
            "not target-local simulation", "not a bisimulation or step-for-step source simulation",
        )),
        "theorem-5-boundary",
        "Theorem 5 must locally distinguish observer-verified histories from target-local simulation",
    )
    # If certificate histories are advertised in the abstract, the same
    # qualification is still needed there; an abstract solely about the main
    # selected-path theorem need not summarize unrelated appendix results.
    if re.search(
        r"theorem\s+5|certificate\s+(?:histor|trie|enumeration)|observer-verified histor",
        abstract,
        flags=re.I,
    ):
        audit.require(
            "not target-local" in abstract.lower(),
            "theorem-5-boundary",
            "an abstract advertising certificate histories must distinguish them from target-local simulation",
        )

    evolution_exported = "deterministicTape_evolution_on_fixedPureSTrajectory" in exports
    theorem_two_prime = "### Theorem 2′." in text or "### Theorem 2'." in text
    audit.require(theorem_two_prime == evolution_exported, "evolution-claim", "Theorem 2′ heading and exported tape-evolution theorem must appear together")
    source_output_exported = has_literal_source_output(exports)
    source_output_claimed = "Corollary 2.1 (Literal source computation and output)" in text
    audit.require(source_output_claimed == source_output_exported, "source-output-claim",
                  "the source-output corollary requires the complete exact public row/output and encoder/path certificates")
    if source_output_claimed:
        audit.require(TAG.findall(text).count("2a") == 1, "source-output-claim",
                      "the source-output corollary must contain exactly one equation 2a")
    if not evolution_exported and not source_output_exported:
        audit.require("direct tape-row decoder" in text and "open strengthening" in text, "evolution-claim", "missing tape-evolution theorem must be stated as an open strengthening")
    if "primitive-operation parser certificates" in text:
        audit.require(has_primitive_interface_bounds(exports), "primitive-interface-claim",
                      "primitive decoder/detector/seed bounds require exact all-input value and quadratic operation certificates")

    if not computable_reduction:
        lower_abstract = abstract.lower()
        audit.require(
            "many-one" not in lower_abstract,
            "computability-wording",
            "abstract overclaims a computable reduction not present in the public API",
        )
        if "primitive-recursive" in lower_abstract:
            audit.require(
                has_generator_computability(exports)
                and "cyclic-tag input word" in lower_abstract
                and "pure-$\\mathbf s$ term" in lower_abstract,
                "computability-wording",
                "abstract primitive-recursive claim must be limited to the certified cyclic-tag word-to-term generator",
            )


def check_priority_wording(audit: Audit, text: str) -> None:
    """Keep priority claims bounded by the evidence actually stated in the paper."""
    normalized = re.sub(r"\s+", " ", text)
    bounded_search = "No matching predecessor was found in the recorded search" in normalized
    explicit_limits = all(phrase in normalized.lower() for phrase in
                          ("recorded search", "coverage limits", "does not establish the absence"))
    priority_claim = re.search(
        r"\b(?:first (?:proof|formalization|mechanization|kernel-checked|machine-checked)|"
        r"no matching predecessor|to our knowledge|recorded search)\b", normalized, flags=re.I,
    )
    if priority_claim:
        audit.require(bounded_search or explicit_limits, "novelty-search",
                      "a priority or search-result assertion must state the scope of its search evidence")
    assertion = re.search(
        r"(?<!cannot prove that )(?<!does not prove that )(?<!not claim that )(?<!not proof that )no predecessor exists",
        normalized,
        flags=re.I,
    )
    if assertion:
        audit.fail("novelty-search", "search cannot establish the absolute assertion 'no predecessor exists'", text.count("\n", 0, text.find(assertion.group(0))) + 1)


def main() -> None:
    text = TEMPLATE.read_text(encoding="utf-8")
    references = REFERENCES.read_text(encoding="utf-8")
    audit = Audit(text)
    exports = exported_text()
    term_only = has_term_only_theorem(exports)
    computable_reduction = has_computable_reduction(exports)
    grammar = load_grammar(audit)

    check_structure(audit, text, term_only=term_only)
    check_claim_boundary_table(audit, text, term_only=term_only)
    check_grammar(audit, text, grammar)
    check_fixed_endpoint(audit, text, grammar)
    check_placeholders_and_tags(audit, text, grammar)
    check_assembled_equations(audit, text)
    check_references(audit, text, references)
    check_relative_links(audit, (TEMPLATE, REFERENCES))
    check_dangerous_wording(
        audit,
        text,
        term_only=term_only,
        computable_reduction=computable_reduction,
    )
    check_cross_surface_boundaries(
        audit,
        text,
        term_only=term_only,
        computable_reduction=computable_reduction,
        exports=exports,
    )
    check_priority_wording(audit, text)

    if audit.failures:
        for failure in audit.failures:
            location = "paper/unified_template.md"
            if failure.line is not None:
                location += f":{failure.line}"
            print(f"FAIL [{failure.rule}] {location}: {failure.message}")
        raise SystemExit(f"FAIL paper claim audit: {len(audit.failures)} issue(s)")

    grammar_digest = hashlib.sha256(GRAMMAR.read_bytes()).hexdigest()
    print(
        "PASS paper claim audit: 8-entry model comparison and exact claim boundary, "
        f"{len(grammar.get('constructors', []))} checked constructors, "
        f"{len(citation_numbers(text))} cited references, "
        f"grammar_sha256={grammar_digest}"
    )


if __name__ == "__main__":
    main()
