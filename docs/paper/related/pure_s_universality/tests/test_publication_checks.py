"""Reject stale metadata, moved declarations and destinations before page breaks."""
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'src'))
from pypdf import PdfReader, PdfWriter
from publication_checks import check_lean_line_links, check_heading_destinations
import release_verification as release


class PublicationChecksTests(unittest.TestCase):
    def test_lean_link_rejects_a_line_that_no_longer_names_the_declaration(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            (root / 'A.lean').write_text('namespace A\ntheorem result : True := trivial\n')
            source = '[`A.result`](A.lean#L2)'
            self.assertEqual(check_lean_line_links(source, root), 1)
            with self.assertRaisesRegex(ValueError, 'misses A.result'):
                check_lean_line_links(source.replace('#L2', '#L1'), root)

    def test_all_current_named_lean_links(self):
        self.assertGreater(check_lean_line_links(
            (ROOT / 'paper/unified_template.md').read_text(encoding='utf-8'), ROOT / 'paper'), 0)

    def test_pdf_target_must_share_the_heading_page(self):
        for destination_page in (0, 1):
            writer = PdfWriter()
            for _ in range(3):
                writer.add_blank_page(width=600, height=800)
            writer.add_outline_item('Abstract', 0)
            writer.add_outline_item('Test heading', 1)
            writer.add_outline_item('References', 2)
            writer.add_named_destination('test-heading', destination_page)
            stream = io.BytesIO()
            writer.write(stream)
            reader = PdfReader(stream)
            # PdfWriter uses a null top coordinate for outline items by default;
            # give it the same real heading height as the named destination.
            from pypdf.generic import FloatObject, NameObject
            outline = reader.outline
            outline[1][NameObject('/Top')] = FloatObject(reader.named_destinations['test-heading'].top)
            reader._outline = outline
            from unittest.mock import patch, PropertyMock
            with patch.object(PdfReader, 'outline', new_callable=PropertyMock, return_value=outline):
                if destination_page == 1:
                    self.assertEqual(check_heading_destinations(reader, '# Test heading {#test-heading}')[0]['page'], 2)
                else:
                    with self.assertRaisesRegex(ValueError, 'lands on page 1, heading is on page 2'):
                        check_heading_destinations(reader, '# Test heading {#test-heading}')

    def test_release_metadata_rejects_stale_pointers_counts_and_test_sources(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            def write(name, value):
                path = root / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(json.dumps(value), encoding='utf-8')
            metadata = json.loads((ROOT / 'RELEASE.json').read_text(encoding='utf-8'))
            write('RELEASE.json', metadata)
            write(metadata['verification'], {'source_modules': 1239, 'public_exports': 319})
            write('PUBLICATION-TOOLCHAIN.json', {'date': metadata['date']})
            (root / 'evidence/README.md').write_text('1,239 modules; 319 public exports')
            log = root / 'evidence/tests/run.log'
            log.parent.mkdir(parents=True)
            log.write_text('Ran 2 tests in 0.01s\n\nOK\n')
            tests = {'status': 'PASS', 'tests': 2, 'log': 'run.log',
                     'log_sha256': release.sha(log), 'source_hashes': {}}
            write(metadata['tests'], tests)
            release.check_release_metadata(root)
            for field, bad, message in (
                ('formal_sources', 'evidence/formal/old/manifest.json', 'stale release pointer'),
                ('source_modules', 1193, 'stale release count'),
                ('public_exports', 295, 'stale release count'),
                ('date', '2026-09-13', 'stale release date'),
            ):
                with self.subTest(field=field):
                    write('RELEASE.json', dict(metadata, **{field: bad}))
                    with self.assertRaisesRegex(ValueError, message):
                        release.check_release_metadata(root)
            write('RELEASE.json', metadata)
            (root / 'src').mkdir()
            (root / 'src/new.py').write_text('pass\n')
            with self.assertRaisesRegex(ValueError, 'do not bind current sources'):
                release.check_release_metadata(root)

    def test_pdf_target_below_heading_text_is_rejected(self):
        from types import SimpleNamespace
        heading = SimpleNamespace(title='Test heading', top=720)
        target = SimpleNamespace(top=704)
        reader = SimpleNamespace(
            outline=[SimpleNamespace(title='Abstract'), heading, SimpleNamespace(title='References')],
            named_destinations={'test-heading': target}, get_destination_page_number=lambda value: 1)
        with self.assertRaisesRegex(ValueError, 'displaced from heading'):
            check_heading_destinations(reader, '# Test heading {#test-heading}')
        target.top = 724
        self.assertEqual(check_heading_destinations(reader, '# Test heading {#test-heading}')[0]['page'], 2)


if __name__ == '__main__':
    unittest.main()
