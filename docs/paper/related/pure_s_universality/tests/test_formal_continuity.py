"""Reject incompatible measured formal inputs and execution records."""
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
import release_verification as continuity


class FormalContinuityTests(unittest.TestCase):
    def assert_hash_change_rejected(self, relative: str, message: str) -> None:
        actual_sha = continuity.sha
        changed = (ROOT / relative).resolve()

        def observed_sha(path):
            return "0" * 64 if Path(path).resolve() == changed else actual_sha(path)

        with patch.object(continuity, "sha", side_effect=observed_sha):
            with self.assertRaisesRegex(ValueError, message):
                continuity.check_proof_evidence()

    def test_changed_receipt_parser_rejects_retention(self):
        self.assert_hash_change_rejected(
            "src/lean_runtime_checks.py", "changed verified input")

    def test_changed_raw_execution_output_rejects_retention(self):
        receipt = continuity.read(continuity.EVIDENCE / 'receipt.json')
        log = next(c['log'] for c in receipt['checks'] if c['label']=='fresh-0')
        self.assert_hash_change_rejected(
            "evidence/formal/headline-complete/" + log, "changed/missing evidence")

    def test_changed_verified_manifest_rejects_retention(self):
        self.assert_hash_change_rejected(
            "evidence/formal/headline-complete/verified-source-manifest.json", "changed/missing evidence")


if __name__ == "__main__":
    unittest.main()
