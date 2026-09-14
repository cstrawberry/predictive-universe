"""Reject optional font mappings that change the published PDF bytes."""
from pathlib import Path
import subprocess
import sys
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'src'))
import publication_environment as publication


class FontMappingPolicyTests(unittest.TestCase):
    def lookup(self, code, output='', error=''):
        return patch.object(publication.subprocess, 'run', return_value=
                            subprocess.CompletedProcess([], code, output, error))

    def test_absent_mapping_is_recorded_using_xelatex_search(self):
        environment = {'PATH': '/tools', 'MISCFONTS': '/fonts'}
        with self.lookup(1) as command:
            self.assertEqual(publication.verify_optional_resources(environment),
                             {'tex-text.tec': 'absent'})
        self.assertEqual(command.call_args.args[0],
                         ['kpsewhich', '--progname=xelatex', '--format=miscfont', 'tex-text.tec'])
        self.assertEqual(command.call_args.kwargs['env'], environment)

    def test_present_mapping_rejected_before_positive_fingerprints(self):
        with self.lookup(0, '/fonts/tex-text.tec\n'):
            with self.assertRaisesRegex(RuntimeError, 'tex-text.tec must be absent'):
                publication.verify_resources({'PATH': '/tools'})

    def test_failed_or_ambiguous_lookup_is_not_treated_as_absence(self):
        for code, output, error in ((2, '', 'lookup failed'), (0, '', ''),
                                    (1, '/fonts/tex-text.tec', ''), (1, '', 'warning')):
            with self.subTest(code=code, output=output, error=error):
                with self.lookup(code, output, error):
                    with self.assertRaisesRegex(RuntimeError, 'could not establish'):
                        publication.verify_optional_resources({'PATH': '/tools'})


if __name__ == '__main__':
    unittest.main()
