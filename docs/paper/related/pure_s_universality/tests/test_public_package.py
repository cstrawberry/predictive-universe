"""Public file requirements and exact-source receipt rejection."""

from __future__ import annotations

import contextlib
import hashlib
import io
import json
from pathlib import Path
import re
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

import check_package
import release_verification as current
import check_formal_continuity
import check_paper_claims
from replay_receipt import RECEIPT_PREFIX, parse_active_replay_receipt
from toolchain_lock import parse_lock


class PublicPackageTests(unittest.TestCase):
    def test_public_requirements_need_no_development_records(self) -> None:
        for name in ("research", "review-evidence", "verification-evidence", "sidecars"):
            self.assertFalse((ROOT / name).exists(), name)
        actual = check_package.actual_package_files(repository=True, post_verification=True)
        current.check_required(actual)

    def test_missing_public_runner_is_rejected_before_other_checks(self):
        with self.assertRaisesRegex(ValueError,"src/run_current_verification.py"):
            current.check_required(current.REQUIRED-{"src/run_current_verification.py"})

    def test_manuscript_check_without_development_records(self) -> None:
        with contextlib.redirect_stdout(io.StringIO()) as output:
            check_paper_claims.main()
        self.assertIn("PASS paper claim audit", output.getvalue())
        self.assertNotIn("checked novelty exports", output.getvalue())

    def test_claim_boundary_accepts_relocated_exact_scope_section(self) -> None:
        text = check_paper_claims.TEMPLATE.read_text(encoding="utf-8")
        headings = re.findall(r"(?m)^### F\.\d+ Exact scope of the claims$", text)
        self.assertEqual(len(headings), 1)
        for number in (2, 5, 12):
            with self.subTest(number=number):
                relocated = text.replace(
                    headings[0], f"### F.{number} Exact scope of the claims", 1
                )
                audit = check_paper_claims.Audit(relocated)
                check_paper_claims.check_claim_boundary_table(audit, relocated, term_only=True)
                self.assertEqual(audit.failures, [])

    def test_claim_boundary_rejects_table_in_following_section(self) -> None:
        text = check_paper_claims.TEMPLATE.read_text(encoding="utf-8")
        heading = re.search(r"(?m)^### F\.\d+ Exact scope of the claims$", text).group(0)
        displaced = text.replace(
            heading, heading + "\n\n### F.99 Supporting discussion", 1
        )
        audit = check_paper_claims.Audit(displaced)
        check_paper_claims.check_claim_boundary_table(audit, displaced, term_only=True)
        self.assertTrue(any(
            failure.rule == "claim-boundary"
            and "What does the halting reduction certify?" in failure.message
            for failure in audit.failures
        ))

    def test_claim_boundary_rejects_missing_or_duplicate_scope_heading(self) -> None:
        text = check_paper_claims.TEMPLATE.read_text(encoding="utf-8")
        heading = re.search(r"(?m)^### F\.\d+ Exact scope of the claims$", text).group(0)
        for replacement in (
            "### F.5 Supporting discussion",
            heading + "\n\n### F.99 Exact scope of the claims",
        ):
            with self.subTest(replacement=replacement):
                changed = text.replace(heading, replacement, 1)
                audit = check_paper_claims.Audit(changed)
                check_paper_claims.check_claim_boundary_table(audit, changed, term_only=True)
                self.assertTrue(any(
                    failure.rule == "claim-boundary" for failure in audit.failures
                ))

    def test_priority_wording_still_rejects_absolute_absence(self) -> None:
        audit = check_paper_claims.Audit("No predecessor exists.")
        check_paper_claims.check_priority_wording(audit, audit.source)
        self.assertTrue(audit.failures)

    def test_each_receipt_rejects_a_different_source_identity(self):
        original=current.read
        def altered(path):
            data=original(path)
            if Path(path).name=="verified-source-manifest.json":
                data["formalization/PureSFormal.lean"]="0"*64
            return data
        with patch.object(current,"read",side_effect=altered):
            with self.assertRaisesRegex(ValueError,"changed/missing evidence"):
                current.source_binding()

    def test_public_evidence_check_uses_the_source_digest(self):
        with patch.object(current,"source_binding",side_effect=ValueError("source digest differs")) as binding:
            with self.assertRaisesRegex(ValueError,"source digest differs"):
                current.check_proof_evidence()
            binding.assert_called_once()


class RepositoryInventoryTests(unittest.TestCase):
    def setUp(self) -> None:
        temporary = tempfile.TemporaryDirectory(prefix="pure-s-package-test-")
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.patch_root = patch.object(check_package, "ROOT", self.root)
        self.patch_root.start()
        self.addCleanup(self.patch_root.stop)
        self.write("public.txt", "public input\n")

    def write(self, name: str, text: str = "local data\n") -> None:
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(text.encode("utf-8"))

    def assert_rejected(self, *, repository: bool = False,
                        post_verification: bool = False) -> None:
        with patch.object(check_package, "check_public_required_files"), \
                patch.object(check_package, "check_formalization_inventory"):
            with self.assertRaisesRegex(AssertionError, "must not be published"):
                check_package.check_tree(evidence_integrity=True, repository=repository,
                                         post_verification=post_verification)

    def test_repository_prunes_only_root_metadata_and_named_zip(self) -> None:
        for name in (".git/objects/test", ".work/private/status.md",
                     "pure_s_universality_submission.zip"):
            self.write(name)
        visited = []
        original_walk = check_package.os.walk

        def recorded_walk(*args, **kwargs):
            for row in original_walk(*args, **kwargs):
                visited.append(Path(row[0]))
                yield row

        with patch.object(check_package.os, "walk", side_effect=recorded_walk):
            self.assertEqual(check_package.actual_package_files(repository=True), {"public.txt"})
        self.assertEqual(visited, [self.root])
        self.assertEqual(set(check_formal_continuity.current_files(self.root)), {"public.txt"})

    def test_repository_accepts_root_git_worktree_file(self) -> None:
        self.write(".git", "gitdir: /separate/repository/worktrees/task\n")
        self.assertEqual(check_package.actual_package_files(repository=True), {"public.txt"})
        self.assertEqual(set(check_formal_continuity.current_files(self.root)), {"public.txt"})
        self.assert_rejected()

    def test_default_archive_mode_rejects_each_local_exclusion(self) -> None:
        for name in (".git", ".work", "pure_s_universality_submission.zip"):
            with self.subTest(name=name):
                self.write(name)
                self.assert_rejected()
                (self.root / name).unlink()

    def test_repository_rejects_nested_private_paths_and_other_archives(self) -> None:
        for name in ("nested/.git/config", "nested/.work/note.md",
                     "another.zip", "nested/pure_s_universality_submission.zip",
                     "research/notes.md", "__pycache__/example.pyc",
                     "formalization/.lake/object.olean", "nested/.lake/object.olean"):
            with self.subTest(name=name):
                self.write(name)
                self.assertIn(name, check_package.actual_package_files(repository=True))
                self.assert_rejected(repository=True)
                (self.root / name).unlink()
                parent = (self.root / name).parent
                while parent != self.root:
                    parent.rmdir()
                    parent = parent.parent

    def test_only_post_verification_excludes_formal_cache(self) -> None:
        self.write("formalization/.lake/object.olean")
        self.assertIn("formalization/.lake/object.olean",
                      check_package.actual_package_files(repository=True))
        self.assertEqual(check_package.actual_package_files(
            repository=True, post_verification=True), {"public.txt"})
        self.write("nested/.work/note.md")
        self.assert_rejected(repository=True, post_verification=True)

    def test_repository_manifest_still_binds_every_public_byte(self) -> None:
        for name in (".git/config", ".work/state.json", "pure_s_universality_submission.zip"):
            self.write(name)
        digest = hashlib.sha256((self.root / "public.txt").read_bytes()).hexdigest()
        self.write("SHA256SUMS", f"{digest}  public.txt\n")
        with patch.object(check_package, "DIGEST_MANIFEST", self.root / "SHA256SUMS"), \
                patch.object(check_package, "check_formalization_inventory"):
            check_package.check_digest_manifest(repository=True)
            self.write("public.txt", "different public input\n")
            with self.assertRaisesRegex(AssertionError, "differing entries.*public.txt"):
                check_package.check_digest_manifest(repository=True)

    def test_continuity_does_not_omit_nested_metadata_or_other_zip(self) -> None:
        names = ("nested/.git/config", "nested/.work/note.md", "another.zip",
                 "nested/pure_s_universality_submission.zip")
        for name in names:
            self.write(name)
        actual = check_formal_continuity.current_files(self.root)
        self.assertEqual(set(actual), {"public.txt", *names})
        self.write("public.txt", "different public input\n")
        self.assertNotEqual(actual["public.txt"],
                            check_formal_continuity.current_files(self.root)["public.txt"])

    def test_metadata_redirection_is_rejected_before_exclusion(self) -> None:
        self.write(".git")
        with patch.object(Path, "is_symlink", lambda path: path == self.root / ".git"):
            with self.assertRaisesRegex(AssertionError, "symbolic link or junction"):
                check_package.package_paths(repository=True)
            with self.assertRaisesRegex(ValueError, "redirected delivery path"):
                check_formal_continuity.current_files(self.root)

    def test_cli_passes_repository_mode_to_inventory_and_manifest_checks(self):
        names=("check_required","check_proof_evidence","check_surface","check_runtime","check_pdf","check_public_execution","checksums")
        with contextlib.ExitStack() as stack:
            mocks={name:stack.enter_context(patch.object(current,name)) for name in names}
            paths=stack.enter_context(patch.object(current,"public_files",return_value={}))
            stack.enter_context(patch.object(sys,"argv",["check_package.py","--repository"]))
            stack.enter_context(contextlib.redirect_stdout(io.StringIO()))
            current.main()
        paths.assert_called_once_with(repository=True,post_verification=False)
        mocks["checksums"].assert_called_once_with(repository=True,post_verification=False,write=False)


if __name__ == "__main__":
    unittest.main()
