"""Integrity controls for the compact public verification evidence."""
from pathlib import Path
import gzip
import hashlib
import json
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
import evidence_storage as storage
import release_verification as release


class EvidenceStorageTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.directory = self.root / "evidence/formal/headline-complete"
        self.directory.mkdir(parents=True)
        self.original = b'{"declarations": ["checked"]}\n'
        self.blob = self.directory / "before.json.gz"
        self.blob.write_bytes(gzip.compress(self.original, mtime=0))
        self.records = {name: {"file": "before.json.gz", "encoding": "gzip"}
                        for name in ("before.json", "after.json")}
        self.write_index()
        self.manifest = {name: hashlib.sha256(self.original).hexdigest()
                         for name in self.records}
        (self.directory / "MANIFEST.json").write_text(json.dumps(self.manifest))

    def write_index(self):
        (self.directory / storage.INDEX).write_text(
            json.dumps({"version": 1, "files": self.records}), encoding="utf-8")

    def test_original_records_and_physical_compressed_hashes_are_distinct(self):
        release.check_manifest(self.directory, self.manifest, exact=True)
        for name in self.manifest:
            self.assertEqual(storage.read_bytes(self.directory / name), self.original)
        self.assertEqual(release.sha(self.blob),
                         hashlib.sha256(self.blob.read_bytes()).hexdigest())
        self.assertIn(self.blob.relative_to(self.root).as_posix(),
                      release.public_files(self.root))

    def test_changed_compressed_content_fails_original_hash(self):
        self.blob.write_bytes(gzip.compress(b'changed content', mtime=0))
        with self.assertRaisesRegex(ValueError, "changed/missing evidence"):
            release.check_manifest(self.directory, self.manifest, exact=True)

    def test_corrupt_compressed_record_is_rejected(self):
        self.blob.write_bytes(b'not gzip')
        with self.assertRaisesRegex(ValueError, "invalid compressed evidence"):
            release.check_manifest(self.directory, self.manifest, exact=True)

    def test_missing_shared_record_is_rejected(self):
        self.blob.unlink()
        with self.assertRaisesRegex(ValueError, "missing stored evidence"):
            release.check_manifest(self.directory, self.manifest, exact=True)

    def test_missing_alias_is_rejected(self):
        del self.records['after.json']
        self.write_index()
        with self.assertRaisesRegex(ValueError, "changed/missing evidence"):
            release.check_manifest(self.directory, self.manifest, exact=True)

    def test_additional_record_and_unlisted_gzip_are_rejected(self):
        extra = self.directory / 'extra.gz'
        extra.write_bytes(gzip.compress(b'extra', mtime=0))
        with self.assertRaisesRegex(ValueError, "evidence inventory differs"):
            release.check_manifest(self.directory, self.manifest, exact=True)
        with self.assertRaisesRegex(ValueError, "compiled/archive artifact"):
            release.public_files(self.root)

    def test_alias_cannot_hide_a_physical_file(self):
        (self.directory / 'after.json').write_bytes(self.original)
        with self.assertRaisesRegex(ValueError, "shadows a physical record"):
            release.check_manifest(self.directory, self.manifest, exact=True)

    def test_alias_cannot_escape_or_chain(self):
        for name in ('../outside.gz', '/absolute.gz', 'C:/outside.gz',
                     'nested\\outside.gz', 'before.json'):
            with self.subTest(name=name):
                self.records['after.json']['file'] = name
                self.write_index()
                with self.assertRaises(ValueError):
                    storage.read_bytes(self.directory / 'after.json')

    def test_uncompressed_evidence_still_works(self):
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            (directory / 'run.log').write_bytes(self.original)
            release.check_manifest(directory,
                {'run.log': hashlib.sha256(self.original).hexdigest()}, exact=True)


if __name__ == '__main__':
    unittest.main()
