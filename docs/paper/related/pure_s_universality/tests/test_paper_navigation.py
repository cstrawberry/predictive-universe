"""Small regressions for publication links and exact declaration labels."""

import json
from pathlib import Path
import re
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
import build_paper


class PaperNavigationTests(unittest.TestCase):
    def test_external_reference_remains_external(self):
        source = (
            "# Title\n\n## 4.3 Internal section\n\n"
            "### Theorem 1. Internal theorem\n\n"
            "See Theorem 1 and Section 4.3.\n"
            "Canal's [Theorem 1](https://example.org/canal#page=3) and "
            "Neary's [Section 4.3](https://example.org/neary#page=90).\n"
        )
        result = build_paper.publication_navigation(source)
        self.assertIn("[Theorem 1](#theorem-1)", result)
        self.assertIn("[Section 1](#section-4-3)", result)
        self.assertIn("[Theorem 1](https://example.org/canal#page=3)", result)
        self.assertIn("[Section 4.3](https://example.org/neary#page=90)", result)

    def test_theorem_heading_advances_the_same_counter_as_pdf(self):
        source = (
            "## 6. Compilation\n\n### 6.1 Model\n\n"
            "### Theorem 2. Endpoint\n\n### 6.2 Readback\n\n"
            "See Section 6.2 and [Section 6.2](#section-6-2).\n"
        )
        result = build_paper.publication_navigation(source)
        self.assertIn("### 1.2 Theorem 2. Endpoint {#theorem-2}", result)
        self.assertIn("### 1.3 Readback {#section-6-2}", result)
        self.assertEqual(result.count("[Section 1.3](#section-6-2)"), 2)
        pdf = build_paper.normalized_headings(result, promote=True)
        self.assertIn("## Theorem 2. Endpoint", pdf)
        self.assertIn("## Readback", pdf)

    def test_appendix_link_label_follows_its_target_after_insertion(self):
        source = (
            "## Appendix A. Tables\n\n### First\n\n"
            "### Inserted\n\n### Derivation {#resource-derivation}\n\n"
            "See [Appendix A.2](#resource-derivation).\n"
        )
        result = build_paper.publication_navigation(source)
        self.assertIn("### A.3 Derivation {#resource-derivation}", result)
        self.assertIn("[Appendix A.3](#resource-derivation)", result)

    def test_real_numbered_labels_match_heading_destinations(self):
        result = build_paper.unified_markdown_manuscript()
        self.assertIn("### 6.5 Boundary representations and literal readback", result)
        self.assertIn("[Appendix B.11](#primitive-resource-derivation)", result)
        self.assertNotIn("[Appendix B.10](#primitive-resource-derivation)", result)

    def test_exact_names_and_unique_suffixes_link_without_touching_code(self):
        api = {"exports": [
            {"declaration": "A.B.long_name?", "heading": "Exact public declaration"},
            {"declaration": "A.shared", "heading": "First shared name"},
            {"declaration": "B.shared", "heading": "Second shared name"},
        ]}
        source = "`A.B.long_name?` and `long_name?`; `shared`.\n```lean\nA.B.long_name?\n```\n"
        result = build_paper.public_declaration_links(source, api)
        target = "formalization/generated/public_theorem_signatures.md#exact-public-declaration"
        self.assertIn(f"[`A.B.long_name?`]({target})", result)
        self.assertIn(f"[`long_name?`]({target})", result)
        self.assertIn("; `shared`.", result)
        self.assertIn("```lean\nA.B.long_name?\n```", result)
        self.assertEqual(build_paper.public_declaration_links(result, api), result)

    def test_real_ledger_targets_and_known_wrapped_identifiers(self):
        api = json.loads(build_paper.PUBLIC_API.read_text(encoding="utf-8"))
        build_paper.validate_public_signature_correspondence(build_paper.PUBLIC_THEOREM_SIGNATURES, api)
        headings = build_paper.generated_signature_sections(build_paper.PUBLIC_THEOREM_SIGNATURES)
        anchors = {re.sub(r"[^a-z0-9 -]", "", heading.lower()).replace(" ", "-") for heading in headings}
        names = [entry["declaration"] for entry in api["exports"]]
        names.append("strongTerminalObservationSemidecidable")
        linked = build_paper.public_declaration_links("\n".join(f"`{name}`" for name in names), api)
        targets = re.findall(r"\]\(formalization/generated/public_theorem_signatures.md#([^)]+)\)", linked)
        self.assertEqual(len(targets), len(names))
        self.assertTrue(set(targets) <= anchors)
        self.assertIn("[`strongTerminalObservationSemidecidable`]", linked)
        self.assertIn(".exists_decodedPrimitiveBoundary_of_runFor?_eq_some`]", linked)
        pdf = build_paper.pdf_layout_text(build_paper.rebase_pdf_repository_links(linked))
        self.assertIn("../../formalization/generated/public_theorem_signatures.md#", pdf)
        self.assertIn(r"\nolinkurl{strongTerminalObservationSemidecidable}", pdf)


if __name__ == "__main__":
    unittest.main()
