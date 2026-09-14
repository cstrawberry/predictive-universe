"""Focused source-closure and compiled-object rejection controls."""

from __future__ import annotations

import copy
from pathlib import Path
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

import check_runtime_evidence as runtime


class RuntimeEvidenceTests(unittest.TestCase):
    def setUp(self) -> None:
        self.temporary = tempfile.TemporaryDirectory(prefix="pure-s-runtime-test-")
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        self.write("formalization/PureSFormal/Leaf.lean", "def leaf := 1\n")
        self.write("formalization/PureSFormal/Root.lean",
                   "/- outer /- nested -/ comment -/\nimport PureSFormal.Leaf -- required\ndef root := leaf\n")
        spec = runtime.SPECS["suite"]
        for name in spec["harnesses"]:
            self.write(name, "import PureSFormal.Root\n")
        for name in (*runtime.LAKE_INPUTS, spec["runner"]):
            self.write(name, "fixture input\n")
        self.modules = runtime.project_sources(self.root, spec["harnesses"])
        self.snapshot = {
            "harnesses": {name: runtime.sha256(self.root / name) for name in spec["harnesses"]},
            "fixed_files": {name: runtime.sha256(self.root / name)
                            for name in (*runtime.LAKE_INPUTS, spec["runner"])},
            "project_modules": {module: {"source_sha256": digest, "olean_sha256": "a" * 64}
                                for module, digest in self.modules.items()},
            "lean_sha256": "b" * 64,
            "lake_sha256": "c" * 64,
        }
        self.objects = {module: {**record, "ilean_sha256": "d" * 64}
                        for module, record in self.snapshot["project_modules"].items()}

    def write(self, name: str, text: str) -> None:
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")

    def test_complete_current_sources_and_built_objects_pass(self) -> None:
        self.assertEqual(runtime.validate_source_snapshot(self.root, "suite", self.snapshot), self.modules)
        runtime.validate_built_objects("suite", self.snapshot, self.objects)

    def test_changed_imported_source_is_rejected(self) -> None:
        self.write("formalization/PureSFormal/Leaf.lean", "-- changed bytes\ndef leaf := 1\n")
        with self.assertRaisesRegex(ValueError, "imported source hash mismatch: PureSFormal.Leaf"):
            runtime.validate_source_snapshot(self.root, "suite", self.snapshot)

    def test_omitted_transitive_import_is_rejected(self) -> None:
        del self.snapshot["project_modules"]["PureSFormal.Leaf"]
        with self.assertRaisesRegex(ValueError, "import closure mismatch.*PureSFormal.Leaf"):
            runtime.validate_source_snapshot(self.root, "suite", self.snapshot)

    def test_conflicting_build_and_run_object_is_rejected(self) -> None:
        changed = copy.deepcopy(self.objects)
        changed["PureSFormal.Leaf"]["olean_sha256"] = "e" * 64
        with self.assertRaisesRegex(ValueError, "build/run olean_sha256 mismatch: PureSFormal.Leaf"):
            runtime.validate_built_objects("suite", self.snapshot, changed)

    def test_missing_built_object_is_rejected(self) -> None:
        del self.objects["PureSFormal.Leaf"]
        with self.assertRaisesRegex(ValueError, "build object manifest omits import: PureSFormal.Leaf"):
            runtime.validate_built_objects("suite", self.snapshot, self.objects)

    def test_source_example_receipt_has_declared_scope(self) -> None:
        import release_verification as current
        directory=current.EVIDENCE/"verified-source-examples"
        receipt=current.read(directory/"receipt.json")
        self.assertEqual(receipt["actual_records"],37)
        self.assertEqual(receipt["cases"],9)
        self.assertEqual(receipt["status"],"PASS_SOURCE_EXAMPLES")
        self.assertIn("no compiled CTS or pure-S execution",receipt["scope"])


if __name__ == "__main__":
    unittest.main()
