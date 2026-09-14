# Verification

The delivered formalization uses Lean 4.33.1, commit
`819816b2e0a3bf405af45ae5c7af2491d8f5bee6`, with Lake 5.0.0.
It has no external Lake packages or Mathlib dependency.

| Check | Completed coverage |
|---|---|
| Build from an empty cache | All 1,239 inventoried modules |
| Compiled census | 53,408 module/declaration records: 52,716 safe and 692 generated partial runtime |
| Public signatures | All 319 exports, including the complete headline theorem and 22 for Appendix F |
| Fresh `leanchecker` replay | All 1,239 modules and their transitive imports, in two import groups |
| Scoped `lean4lean` replay | All 1,239 exact modules, in 31 batches; 49,508 declarations added |
| Checker controls | Valid controls accepted; deliberately ill-typed compiled proofs rejected |
| Runtime fixtures | 720 differential contractions, 394 small-term executions, output and encoder preflight |
| Source-machine examples | Nine cases and 37 exact rows, compared with an independent Python model |
| Worked trace | 85 contractions, all 86 checkpoint decisions and the first invocation's 1,562 local commands |
| Selector regression | Four jobs of 220 contractions: 880 comparisons |

The [completion receipt](evidence/formal/headline-complete/COMPLETE-VERIFICATION.json)
binds one complete fresh execution of the build, audits, replays and runtime
checks for the delivered formal sources. The
[public theorem ledger](formalization/generated/public_theorem_signatures.md)
and [public API](formalization/generated/public_api.json) identify the exact
statements and axiom dependencies. Appendix F has Lean proofs in 45 modules,
including its audit module, and 22 public exports for its stated results and
supporting constructions. Appendices B and F map the prose to these declarations.

## Check the delivered release

Use Python 3.11 or later, with assertions enabled:

```sh
python3 -m pip install --require-hashes -r requirements.txt
python3 -B src/check_package.py
```

For a repository checkout, add `--repository`. After local Lean builds, add
`--post-verification`. These options exclude only the documented work, Git,
sharing ZIP and Lean cache paths; all published inputs retain the same checks.

The command verifies the evidence inventory, exact formal-source bytes, public
axiom policy, complete replay coverage, runtime source/object bindings and
saved outputs against the Python validators. It also checks the assembled
manuscript, scientific artifacts, tagged PDF, citation links and SHA256SUMS.
Changing or omitting a delivered proof source fails the check.

## Axioms and checker scope

The central development admits only `propext` and `Quot.sound`. Appendix F
additionally uses the standard `Classical.choice` axiom where its exact report
records it. Of the 319 public exports, 228 depend on the quotient axiom and
seven Appendix F exports depend on classical choice. The
standard library introduces this dependency through function extensionality,
well-founded recursion and arithmetic proofs. No mathematical library proof or
public export uses `sorryAx` or a custom axiom. The full census allows classical
choice only in Appendix F, its explicitly named public aliases, and the
separately listed command-line declarations below. The central theorem's axiom
policy is unchanged.

The command-line demo has a separate allowance for exactly 29 safe declarations
that depend on `Classical.choice` through standard UTF-8 string routines. The
census records generated partial runtime declarations and their dependencies
separately. These are outside the safe-proof policy. The
[compressed census](evidence/formal/headline-complete/full-declaration-census.json.gz)
records each declaration's exact dependencies. It preserves the original JSON
bytes and can be read with any gzip reader or the command in the
[evidence guide](evidence/formal/README.md).

The official distribution's `leanchecker` supplies fresh kernel replay.
`lean4lean` is an alternate implementation derived from Lean's C++ kernel;
its scoped pass assumes each module's imported environment. The
[exact-module driver](src/ExactMain.lean) schedules calls to the unchanged
upstream replay function, 40 modules per process. Its implementation objects,
source, binary and controls are recorded in the evidence. Unsafe and partial
bodies are outside the safe-declaration replay scope.

## Reproduce the proofs

Install the Linux x86-64 archive identified in
[VERIFICATION-TOOLCHAIN.json](VERIFICATION-TOOLCHAIN.json). The formal verifier
checks the actual Lean, Lake and `leanchecker` binary hashes. Supply the
installed Lake executable, not an elan proxy.

For the complete build and axiom/signature audit in a fresh directory:

```sh
python3 -B src/run_current_verification.py \
  --lake /absolute/path/to/lean-4.33.1-linux/bin/lake \
  --work-dir /absolute/path/to/new-audit \
  --stage audit
```

For both supplemental replays, supply a pristine `lean4lean` checkout at
`8223d223ed98661882e95d9d6a7126df7097cd76`. Its
`.lake/packages/batteries` directory must be a pristine checkout at
`76e1c118b0700b4ceafe99532e887d6431625e1a`. The runner verifies every tracked
Git blob, copies the sources, builds the checker, and runs rejection controls.
It does not download dependencies.

```sh
python3 -B src/run_current_verification.py \
  --lake /absolute/path/to/lean-4.33.1-linux/bin/lake \
  --lean4lean-source /absolute/path/to/lean4lean \
  --work-dir /absolute/path/to/new-verification \
  --stage all
```

Every work directory must be new. The command leaves logs, source and object
hashes, and a success or failure receipt. Use `--stage replay` or
`--stage runtime` to reproduce those checks separately; both begin with a
fresh inventory build. The in-place command
`python3 -B formalization/scripts/run_audit.py --lake /absolute/path/to/lake`
also remains available.

## Runtime coverage

The supported full runtime command is `run_current_verification.py --stage runtime`
with the same toolchain, checker-source and new-work-directory arguments.
It builds native differential, small-term and worked-trace executables.
Output and preflight fixtures run through `Lean --run`.

The native output/preflight executables encountered stack limits, including
with a 64 MiB process stack. The successful
interpreted executions supply those declared cases; general native output
executable support is not claimed. The recorded interpreted/native differential
prefix and complete small-term records agree.

The full padded universal encoder seed has not been materialized or executed:
even the code-zero seed has a lower bound of 2^57207 bits. Preflight executes
decoding, padding and table construction. The all-input encoder and output
results are formal theorems. Runtime fixtures retain their explicitly bounded
scope and the separate meanings of source steps, CTS steps, S-contractions,
controller microticks and physical runtime.

## PDF and release reproduction

The tested setup is documented in [PUBLICATION.md](PUBLICATION.md).
[PUBLICATION-TOOLCHAIN.json](PUBLICATION-TOOLCHAIN.json) identifies the tool
requirements and the exact package, font and executable fingerprints.
It also requires the optional `tex-text.tec` font mapping to be absent;
the build rejects an environment in which XeLaTeX can find it.
The current build and rendered review are in [evidence/pdf](evidence/pdf/README.md).

```sh
python3 -B src/publication_environment.py --prepare
python3 -B src/build_paper.py --check-pdf
```

This creates two clean builds and compares their bytes with the supplied PDF.
To build a replacement explicitly:

```sh
python3 -B src/build_paper.py --output output/pdf/pure_s_universality.pdf
```

The [Dockerfile](Dockerfile) provides a pinned Linux recipe for the same
commands. Its default runs the full verifier in a writable `.work` volume.
The recorded verification platform is WSL2 Linux; a Docker image build is a
separate reproduction route, not part of that recorded execution.

The current release tests include rejected proof-source changes, missing
modules, altered replay logs, unknown safe axioms, and malformed paths:

```sh
python3 -B -m unittest discover -v
```
