"""Prepare and record the package-local publication dependencies on Linux."""
from __future__ import annotations
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import urllib.request
import zipfile

ROOT = Path(__file__).resolve().parents[1]
EXTRA_SHA256 = 'db88906dc6c7d814edbb878041d75e389c6d898b76fa5dc2efe71abb9da5f0fd'
EXTRA_URL = ('https://archive.ubuntu.com/ubuntu/pool/universe/t/texlive-extra/'
             'texlive-latex-extra_2023.20240207-1_all.deb')
EXTRA_DIRECTORIES = ('tagpdf', 'xurl', 'needspace', 'upquote')


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def prepare(archive: Path | None = None):
    from local_workspace import LocalWorkspace
    work = LocalWorkspace(ROOT).directory('publication')
    target = work / 'extra'
    with tempfile.TemporaryDirectory(prefix='prepare-', dir=work) as temporary:
        stage = Path(temporary)
        if archive is None:
            archive = stage / 'extra.deb'
            with urllib.request.urlopen(EXTRA_URL, timeout=90) as response, archive.open('wb') as output:
                shutil.copyfileobj(response, output)
        if digest(archive) != EXTRA_SHA256:
            raise ValueError('publication dependency archive SHA-256 differs')
        subprocess.run(['dpkg-deb', '--extract', str(archive.resolve()), str(stage / 'extracted')], check=True)
        source = stage / 'extracted/usr/share/texlive/texmf-dist/tex/latex'
        for name in EXTRA_DIRECTORIES:
            for path in (source / name).rglob('*'):
                if path.is_file():
                    destination = target / path.relative_to(source)
                    destination.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copyfile(path, destination)
        record = {'archive_url': EXTRA_URL, 'archive_sha256': EXTRA_SHA256,
                  'files': {p.relative_to(target).as_posix(): digest(p)
                            for p in sorted(target.rglob('*')) if p.is_file()}}
        (work / 'extra.json').write_text(json.dumps(record, indent=2) + '\n', encoding='utf-8')
        lock = json.loads((ROOT / 'PUBLICATION-TOOLCHAIN.json').read_text(encoding='utf-8'))
        with urllib.request.urlopen('https://pypi.org/pypi/pypdf/' + lock['pypdf'] + '/json', timeout=30) as response:
            metadata = json.load(response)
        wheel_info = next(entry for entry in metadata['urls'] if entry['filename'].endswith('.whl')
                          and entry['digests']['sha256'] == lock['pypdf-wheel-sha256'])
        wheel = stage / 'pypdf.whl'
        with urllib.request.urlopen(wheel_info['url'], timeout=60) as response:
            wheel.write_bytes(response.read())
        if digest(wheel) != lock['pypdf-wheel-sha256']:
            raise ValueError('pypdf wheel SHA-256 differs')
        python_root = work / 'python'
        with zipfile.ZipFile(wheel) as package:
            for name in package.namelist():
                if name.startswith('pypdf/') and not name.endswith('/'):
                    destination = python_root / name
                    if '..' in Path(name).parts:
                        raise ValueError('unsafe wheel path')
                    destination.parent.mkdir(parents=True, exist_ok=True)
                    destination.write_bytes(package.read(name))
        python_record = {p.relative_to(python_root).as_posix(): digest(p)
                         for p in sorted(python_root.rglob('*')) if p.is_file()}
        (work / 'python.json').write_text(json.dumps(python_record, indent=2) + '\n', encoding='utf-8')
    print('PASS publication dependencies: ' + str(target))


def configure(environment: dict[str, str]) -> dict[str, str]:
    from local_workspace import LocalWorkspace
    work = LocalWorkspace(ROOT).directory('publication')
    receipt = work / 'extra.json'
    if not receipt.is_file():
        raise RuntimeError('Run python3 -B src/publication_environment.py --prepare first; see PUBLICATION.md')
    record = json.loads(receipt.read_text(encoding='utf-8'))
    target = work / 'extra'
    actual = {p.relative_to(target).as_posix(): digest(p) for p in sorted(target.rglob('*')) if p.is_file()}
    if record['archive_sha256'] != EXTRA_SHA256 or record['files'] != actual:
        raise RuntimeError('publication dependency files differ; repeat --prepare')
    python_root = work / 'python'
    python_expected = json.loads((work / 'python.json').read_text(encoding='utf-8'))
    python_actual = {p.relative_to(python_root).as_posix(): digest(p)
                     for p in sorted(python_root.rglob('*')) if p.is_file() and '__pycache__' not in p.parts}
    if python_expected != python_actual:
        raise RuntimeError('publication Python files differ; repeat --prepare')
    result = environment.copy()
    # Do not inherit an unrecorded package override or a stale prebuilt format.
    result['TEXINPUTS'] = os.pathsep.join(str(target / name) for name in EXTRA_DIRECTORIES) + os.pathsep
    result['TZ'] = 'UTC'
    result['LC_ALL'] = 'C.UTF-8'
    return result


def verify_optional_resources(environment: dict[str, str]) -> dict[str, str]:
    """Bind required absence as well as positive resource fingerprints."""
    lock = json.loads((ROOT / 'PUBLICATION-TOOLCHAIN.json').read_text(encoding='utf-8'))
    states = {}
    for name in lock['required_absent_font_mappings']:
        result = subprocess.run(
            ['kpsewhich', '--progname=xelatex', '--format=miscfont', name],
            cwd=ROOT, env=environment, capture_output=True, text=True,
        )
        if result.returncode == 0 and result.stdout.strip():
            raise RuntimeError('publication environment differs: ' + name +
                               ' must be absent from the XeLaTeX font-mapping search path; '
                               'see PUBLICATION.md')
        if result.returncode != 1 or result.stdout.strip() or result.stderr.strip():
            raise RuntimeError('could not establish required absence of ' + name)
        states[name] = 'absent'
    return states


def record_resources(directory: Path, environment: dict[str, str]):
    """Hash the actual TeX resources recorded by XeTeX, including fonts."""
    resources = {}
    for recorder in directory.glob('*.fls'):
        for line in recorder.read_text(encoding='utf-8', errors='replace').splitlines():
            if not line.startswith('INPUT '):
                continue
            path = Path(line[6:])
            if not path.is_absolute():
                path = ROOT / path
            if not path.is_file() or path.suffix == '.fmt':
                continue
            name = path.as_posix()
            if '/texmf-dist/' in name:
                name = 'texmf-dist/' + name.split('/texmf-dist/', 1)[1]
            elif '/usr/share/texmf/' in name:
                name = 'texmf/' + name.split('/usr/share/texmf/', 1)[1]
            elif '/publication/extra/' in name:
                name = 'extra/' + name.split('/publication/extra/', 1)[1]
            else:
                continue
            resources[name] = digest(path)
    tools = {}
    for name in ('pandoc', 'xetex', 'xdvipdfmx', 'kpsewhich'):
        path = shutil.which(name)
        tools[name] = {'sha256': digest(path), 'version': subprocess.run(
            [path, '--version'], check=True, capture_output=True, text=True).stdout.splitlines()[0]}
    record = {'tools': tools, 'resources': dict(sorted(resources.items())),
              'optional_font_mappings': verify_optional_resources(environment)}
    (directory / 'environment.json').write_text(json.dumps(record, indent=2) + '\n', encoding='utf-8')
    return record


def verify_resources(environment: dict[str, str]):
    from local_workspace import LocalWorkspace
    verify_optional_resources(environment)
    expected = json.loads((ROOT / 'evidence/pdf/environment.json').read_text(encoding='utf-8'))
    directories = {'texmf-dist': Path('/usr/share/texlive/texmf-dist'),
                   'texmf': Path('/usr/share/texmf'),
                   'extra': LocalWorkspace(ROOT).directory('publication') / 'extra'}
    mismatches = []
    for name, value in expected['tools'].items():
        path = shutil.which(name, path=environment['PATH'])
        if path is None or digest(path) != value['sha256']:
            mismatches.append('executable ' + name)
    for name, sha256 in expected['resources'].items():
        category, relative = name.split('/', 1)
        path = directories[category] / relative
        if not path.is_file() or digest(path) != sha256:
            mismatches.append(name)
    if mismatches:
        raise RuntimeError('publication environment differs from the tested files: ' +
                           ', '.join(mismatches) + '; see PUBLICATION.md')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare', action='store_true', required=True)
    parser.add_argument('--archive', type=Path, help='Use a local copy of the pinned Debian archive')
    args = parser.parse_args()
    prepare(args.archive)
