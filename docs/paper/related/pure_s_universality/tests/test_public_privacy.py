"""Public-copy checks must inspect encoded paths and container metadata."""
import base64
import gzip
import json
from pathlib import Path
import struct
import subprocess
import sys
import tempfile
import unittest
import zlib

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
import check_public_privacy as privacy


def private_path():
    return "/" + "mnt/c/" + "Users" + "/reviewer/Desktop/project/paper.tex"


class PublicPrivacyTests(unittest.TestCase):
    def test_plain_escaped_encoded_and_wrapped_paths_rejected(self):
        path = private_path()
        windows = "C:" + "\\" + "Users" + "\\reviewer\\Desktop\\project"
        variants = (path, windows, windows.replace("\\", "\\\\"),
                    path.replace("/", "%2F"), path[:20] + "\n" + path[20:],
                    path.encode("utf-16-le").decode("utf-8"))
        for value in variants:
            with self.subTest(value=value):
                with self.assertRaisesRegex(ValueError, "personal computer path"):
                    privacy.check_text(value, "fixture")

    def test_gzip_record_is_inspected(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "snapshot.json.gz"
            path.write_bytes(gzip.compress(private_path().encode()))
            with self.assertRaisesRegex(ValueError, "personal computer path"):
                privacy.check_file(path, "evidence/snapshot.json.gz")

    def test_decoded_json_paths_rejected_directly_and_by_cli(self):
        private = (private_path(), "/" + "home" + "/reviewer/project",
                   "C:" + "\\" + "Users" + "\\reviewer\\project")
        for secret in private:
            escaped = "".join("\\u" + format(ord(char), "04x") for char in secret)
            documents = (
                '{"nested":[{"path":"' + escaped + '"}]}',
                '{"nested":[{"' + escaped + '":"value"}]}',
                '{"path":"' + escaped + '","path":"public/value"}',
            )
            for compressed in (False, True):
                for document in documents:
                    with self.subTest(compressed=compressed, document=document):
                        with tempfile.TemporaryDirectory() as directory:
                            path = Path(directory) / ("snapshot.json.gz" if compressed else "snapshot.json")
                            raw = document.encode()
                            path.write_bytes(gzip.compress(raw) if compressed else raw)
                            with self.assertRaisesRegex(ValueError, "personal computer path"):
                                privacy.check_file(path, "evidence/" + path.name)
                            result = subprocess.run(
                                [sys.executable, "-B", str(ROOT / "src/check_public_privacy.py"),
                                 "--root", directory], capture_output=True, text=True)
                            self.assertNotEqual(result.returncode, 0)
                            self.assertIn("personal computer path", result.stderr)
                            self.assertNotIn("PASS public privacy scan", result.stdout)

    def test_decoded_json_record_fields_are_inspected(self):
        for compressed in (False, True):
            with self.subTest(compressed=compressed), tempfile.TemporaryDirectory() as directory:
                path = Path(directory) / ("snapshot.json.gz" if compressed else "snapshot.json")
                raw = json.dumps({"computername": "host-example"}).replace("c", "\\u0063").encode()
                path.write_bytes(gzip.compress(raw) if compressed else raw)
                with self.assertRaisesRegex(ValueError, "local execution detail"):
                    privacy.check_file(path, "evidence/" + path.name)

    def test_malformed_json_rejected_directly_and_by_cli(self):
        for compressed in (False, True):
            with self.subTest(compressed=compressed), tempfile.TemporaryDirectory() as directory:
                path = Path(directory) / ("snapshot.json.gz" if compressed else "snapshot.json")
                raw = b'{"path":'
                path.write_bytes(gzip.compress(raw) if compressed else raw)
                with self.assertRaisesRegex(ValueError, "invalid JSON"):
                    privacy.check_file(path, "evidence/" + path.name)
                result = subprocess.run(
                    [sys.executable, "-B", str(ROOT / "src/check_public_privacy.py"),
                     "--root", directory], capture_output=True, text=True)
                self.assertNotEqual(result.returncode, 0)
                self.assertIn("invalid JSON", result.stderr)
                self.assertNotIn("PASS public privacy scan", result.stdout)

    def test_decoded_public_json_accepted_directly_and_by_cli(self):
        value = {"nested": ["https://example.org/paper", "/verification/run/package",
                            "relative/paper.tex", "public\u00e9", 12, True, None]}
        for compressed in (False, True):
            with self.subTest(compressed=compressed), tempfile.TemporaryDirectory() as directory:
                path = Path(directory) / ("snapshot.json.gz" if compressed else "snapshot.json")
                raw = json.dumps(value).replace("/", "\\u002f").encode()
                path.write_bytes(gzip.compress(raw) if compressed else raw)
                privacy.check_file(path, "evidence/" + path.name)
                result = subprocess.run(
                    [sys.executable, "-B", str(ROOT / "src/check_public_privacy.py"),
                     "--root", directory], capture_output=True, text=True)
                self.assertEqual(result.returncode, 0, result.stderr)
                self.assertIn("PASS public privacy scan", result.stdout)

    def test_pdf_metadata_is_inspected(self):
        from pypdf import PdfWriter
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "paper.pdf"
            writer = PdfWriter()
            writer.add_blank_page(width=100, height=100)
            writer.add_metadata({"/Subject": private_path()})
            writer.write(path)
            with self.assertRaisesRegex(ValueError, "personal computer path"):
                privacy.check_file(path, "paper.pdf")

    def test_pdf_compressed_nonpage_stream_is_inspected(self):
        from pypdf import PdfWriter
        from pypdf.generic import DecodedStreamObject, NameObject
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "paper.pdf"
            writer = PdfWriter()
            writer.add_blank_page(width=100, height=100)
            stream = DecodedStreamObject()
            stream.set_data(private_path().encode())
            writer.root_object[NameObject("/PrivateFixture")] = writer._add_object(stream.flate_encode())
            writer.write(path)
            with self.assertRaisesRegex(ValueError, "personal computer path"):
                privacy.check_file(path, "paper.pdf")

    def test_png_compressed_text_is_inspected(self):
        png = base64.b64decode(
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+a3ioAAAAASUVORK5CYII=")
        data = b"Comment\0\0" + zlib.compress(private_path().encode())
        kind = b"zTXt"
        chunk = struct.pack(">I", len(data)) + kind + data + struct.pack(">I", zlib.crc32(kind + data))
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "figure.png"
            path.write_bytes(png[:-12] + chunk + png[-12:])
            with self.assertRaisesRegex(ValueError, "personal computer path"):
                privacy.check_file(path, "figure.png")

    def test_internal_record_locations_and_machine_fields_rejected(self):
        values = ("/" + "var/" + "tmp/internal-job/package", '"computername": "host-example"',
                  '("PATH", "private-environment")',
                  "[" + "0x1234abcd" + "]")
        for value in values:
            with self.subTest(value=value), self.assertRaisesRegex(ValueError, "local execution detail"):
                privacy.check_text(value, "evidence/fixture.log", record=True)

    def test_public_versions_urls_and_symbolic_paths_accepted(self):
        privacy.check_text('https://example.org/paper /verification/run/package Lean 4.33.1',
                           "evidence/fixture.log", record=True)

    def test_delivered_files_have_no_personal_paths(self):
        self.assertGreater(privacy.check_files(ROOT, (p for p in ROOT.rglob("*") if p.is_file())), 0)


if __name__ == "__main__":
    unittest.main()
