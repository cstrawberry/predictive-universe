"""Run the current package tests and record their actual source-bound result."""
from datetime import datetime, timezone
import json
from pathlib import Path
import subprocess
import sys

from release_verification import sha
from check_public_privacy import check_text

ROOT = Path(__file__).resolve().parents[1]


def inputs():
    return {p.relative_to(ROOT).as_posix(): sha(p) for folder in ('src', 'tests')
            for p in sorted((ROOT / folder).glob('*.py'))}


def main():
    import re
    before = inputs()
    command = [sys.executable, '-X', 'utf8', '-B', '-m', 'unittest', 'discover', '-v']
    started = datetime.now(timezone.utc).isoformat()
    result = subprocess.run(command, cwd=ROOT, capture_output=True, text=True, encoding='utf-8')
    output = result.stdout + result.stderr
    print(output, end='')
    if before != inputs():
        raise RuntimeError('test inputs changed during execution')
    result.check_returncode()
    count = re.search(r'(?m)^Ran (\d+) tests? in ', output)
    if count is None or not re.search(r'(?m)^OK\s*$', output):
        raise RuntimeError('test runner did not report complete success')
    check_text(output, 'package test output', record=True)
    directory = ROOT / 'evidence/tests'
    directory.mkdir(parents=True, exist_ok=True)
    log = directory / 'public-package-tests.log'
    log.write_text(output, encoding='utf-8', newline='\n')
    record = {'status': 'PASS', 'tests': int(count[1]), 'command': ['python', *command[1:]],
              'command_path_policy': 'Public copy: the interpreter location is omitted.',
              'python_version': sys.version.split()[0],
              'log': log.name, 'log_sha256': sha(log), 'source_hashes': before,
              'started_utc': started, 'recorded_utc': datetime.now(timezone.utc).isoformat()}
    stage = directory / 'receipt.pending.json'
    stage.write_text(json.dumps(record, indent=2) + '\n', encoding='utf-8')
    stage.replace(directory / 'receipt.json')


if __name__ == '__main__':
    main()
