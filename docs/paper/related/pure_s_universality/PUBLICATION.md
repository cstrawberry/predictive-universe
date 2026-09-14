# Building the paper

Run these commands from the extracted package root on Ubuntu 24.04, x86-64.
The tested TeX packages are `texlive-base`, `texlive-latex-base`,
`texlive-latex-recommended` and `texlive-fonts-recommended` at
`2023.20240207-1`, `texlive-binaries` at `2023.20230311.66589-9build3`,
and both `fonts-lmodern` and `lmodern` at `2.005-1`. The latter supplies the
TeX style and metric files used by the paper. Pandoc is 3.1.3. The publication lock
is [PUBLICATION-TOOLCHAIN.json](PUBLICATION-TOOLCHAIN.json).

The supplied PDF requires `tex-text.tec` to be absent from XeLaTeX's font-mapping
search path. This optional mapping changes punctuation substitutions even when
the recorded package and font files match. The lock records this absence,
the build checks it with XeLaTeX's Kpathsea search settings before typesetting,
and each new environment record includes the result. An installed mapping
causes an explicit failure. Use the package set above in a clean environment;
do not add [`texlive-xetex`](https://packages.ubuntu.com/noble/all/texlive-xetex/filelist),
which supplies this mapping. The Docker recipe uses
the same base packages and prepares only the listed extra files locally.
Missing-mapping messages in the supplied engine logs are expected for this
release. The final full-byte comparison remains required.

Prepare the local dependencies with Python 3.12:

```sh
python3 -B src/publication_environment.py --prepare
python3 -B src/build_paper.py --check-pdf
```

The preparation command downloads the exact `texlive-latex-extra` archive
from the [Ubuntu package archive](https://archive.ubuntu.com/ubuntu/pool/universe/t/texlive-extra/).
It verifies SHA-256
`db88906dc6c7d814edbb878041d75e389c6d898b76fa5dc2efe71abb9da5f0fd`
and places only `tagpdf`, `xurl`, `needspace` and `upquote` in
`.work/publication/extra`. It uses `dpkg-deb` and does not change system
packages. It also downloads the pinned pypdf wheel from PyPI, verifies its
hash from the publication lock, and places its Python package in
`.work/publication/python`. Pip and a virtual environment are not required.
To use an existing TeX archive, supply
`--archive /path/to/texlive-latex-extra_2023.20240207-1_all.deb`;
the pypdf download still requires network access.

Each build creates its own XeLaTeX format from the installed, recorded source
files, uses the package-local extra dependencies, and retains its raw engine
logs, format log, recorder files and resource fingerprints under
`.work/publication-logs/`. After a typesetting attempt, the command prints
the diagnostics directory whether typesetting succeeds or fails. Preliminary
checks can fail before that location is printed; their error messages identify
the rejected condition. Engine version strings alone do not identify the complete
TeX environment; the recorded resources include the actual package and font
files. [The build environment](evidence/pdf/environment.json) identifies the
resources used for the supplied PDF. A preflight check rejects different
recorded packages, fonts or executables with their names before typesetting.

`--check-pdf` builds twice at unequal path lengths and compares both complete
PDF byte streams with the supplied PDF. It leaves the supplied PDF intact.
To produce a separate candidate instead:

```sh
python3 -B src/build_paper.py --output .work/candidate.pdf
```

The build also checks tagged-PDF structure and compares every explicit heading
destination with its heading's bookmark page and height. Package validation
checks the manuscript's Lean declaration links, current release pointers,
verification counts and source-bound test receipt. To execute and record the
package tests:

```sh
PYTHONPATH=.work/publication/python python3 -B src/record_package_tests.py
```
