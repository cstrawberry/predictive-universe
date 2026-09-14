"""Regression checks for malformed trace addresses and the public entry point."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from evidence_storage import read_text
import verify_rogozhin_source as rogozhin
import verify_root_reset_worked_trace as trace


class TraceAddressTests(unittest.TestCase):
    def test_valid_root_and_nested_contractions(self):
        redex = trace.ap(trace.S, trace.S, trace.S, trace.S)
        reduced = trace.ap(trace.ap(trace.S, trace.S), trace.ap(trace.S, trace.S))
        for address in ("", "L", "R", "LR", "RL"):
            before, after = redex, reduced
            for side in reversed(address):
                before = (before, trace.S) if side == "L" else (trace.S, before)
                after = (after, trace.S) if side == "L" else (trace.S, after)
            with self.subTest(address=address):
                self.assertEqual(trace.at(before, address), redex)
                self.assertEqual(trace.contract(before, address), after)

    def test_rejects_invalid_addresses_before_traversal(self):
        # Reject invalid symbols at every position before traversing the term.
        redex = trace.ap(trace.S, trace.S, trace.S, trace.S)
        term = ((redex, redex), (redex, redex))
        invalid = ("X", "LX", "RX", "r", " L", "R\n", None, 1, [], ["R"], b"R")
        for operation in (trace.at, trace.contract):
            for address in invalid:
                with self.subTest(operation=operation.__name__, address=address):
                    with self.assertRaisesRegex(ValueError, "invalid address"):
                        operation(term, address)
        with self.assertRaisesRegex(ValueError, "invalid address"):
            trace.contract(trace.S, "LX")

    def test_real_trace_passes_and_later_invalid_address_fails(self):
        raw = read_text(ROOT / "evidence/formal/headline-complete/067-worked-trace.log")
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory)
            log = output / "trace.jsonl"
            log.write_text(raw, encoding="utf-8")
            result = trace.validate(log, output)
            self.assertEqual(result["contractions"], 85)
            lines = raw.splitlines(keepends=True)
            changed = False
            for index, line in enumerate(lines):
                row = json.loads(line)
                if row["kind"] == "contraction" and row["sample"] == 2:
                    self.assertEqual(row["address"], "LR")
                    row["address"] = "LX"
                    lines[index] = json.dumps(row) + "\n"
                    changed = True
                    break
            self.assertTrue(changed)
            log.write_text("".join(lines), encoding="utf-8")
            with self.assertRaisesRegex(ValueError, "invalid address"):
                trace.validate(log, output)


class PublicEntryPointTests(unittest.TestCase):
    def test_legacy_help_delegates_to_current_runner(self):
        result = subprocess.run(
            [sys.executable, "-X", "utf8", "-B", str(ROOT / "src/run_formalization.py"), "--help"],
            cwd=ROOT, capture_output=True, text=True, encoding="utf-8", timeout=30,
        )
        self.assertEqual(result.returncode, 0, result.stderr)
        for option in ("--lake", "--lean4lean-source", "--work-dir", "--stage"):
            self.assertIn(option, result.stdout)


class ArrowNotationTests(unittest.TestCase):
    def test_arrow_names_match_manuscript_and_numeric_machine(self):
        self.assertEqual(rogozhin.SYMBOL_RENAMING["b_right"], 2)
        self.assertEqual(rogozhin.SYMBOL_RENAMING["b_left"], 3)
        normalized = rogozhin.normalize(rogozhin.source_table())
        self.assertEqual(normalized, rogozhin.artifact_table())
        self.assertEqual(normalized, rogozhin.lean_table())
        self.assertTrue(rogozhin.macrotrace_matches(
            rogozhin.PUBLISHED_MACROTRACE, rogozhin.source_table()))


if __name__ == "__main__":
    unittest.main()
