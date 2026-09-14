# Pure S Is Computationally Universal Under a Fixed Root-Restarted Finite Controller

[Read the paper](output/pdf/pure_s_universality.pdf).

The construction represents arbitrary deterministic Boolean-tape computation
using contextual contractions of the native rule `S X Y Z -> X Z (Y Z)`.
One fixed finite controller starts each invocation at the root of the current
bare term. Fixed readers recover source configurations and terminal outputs;
one fixed regular tree language detects source halting along the selected path.

The principal formal theorem is
[`RootResetHeadline.sCombinatorIsRootResetUniversal`](formalization/PureSFormal/RootResetHeadline.lean).
It combines the computation contract, regular halting language and ordered
finite source observations on the same encoded trajectory.
The Lean 4.33.1 development contains 1,239 Lean modules and 319 public exports,
including the results of Appendix F. Its proofs use only standard Lean axioms;
the exact dependencies of every export appear in the public theorem ledger.

Appendix F proves regular-observation algorithms for tagged carriers and
recursive I/G calls, and their obstruction to an exact every-strategy halting
equivalence. These architectural results have both displayed mathematical
proofs and Lean proofs, with 22 public exports covering their claims and
supporting constructions.

| Contents | Location |
|---|---|
| Paper PDF | [output/pdf/pure_s_universality.pdf](output/pdf/pure_s_universality.pdf) |
| PDF build setup | [PUBLICATION.md](PUBLICATION.md) |
| Manuscript and figures | [paper/unified_template.md](paper/unified_template.md), [assembled manuscript](paper.md) |
| Formal statements and proofs | [formalization/PureSFormal/Public.lean](formalization/PureSFormal/Public.lean) |
| Complete public theorem types | [formal theorem ledger](formalization/generated/public_theorem_signatures.md) |
| Definitions and agreement theorems | [TRUSTED_DEFINITIONS.md](TRUSTED_DEFINITIONS.md) |
| Verification and reproduction | [VERIFICATION.md](VERIFICATION.md) |
| Pinned dependencies | [TOOLCHAIN.lock](TOOLCHAIN.lock), [requirements.txt](requirements.txt) |
| File checksums | [SHA256SUMS](SHA256SUMS) |

Check the public package with Python 3.11 or later:

```sh
python3 -m pip install --require-hashes -r requirements.txt
python3 -B src/check_package.py
```

For a repository checkout containing `.git`, local work files, or the sharing
ZIP, use `python3 -B src/check_package.py --repository`.

The check matches the supplied proofs to the exact sources of the completed
Lean 4.33.1 verification. It validates both checker replays, the axiom census,
saved runtime results, the current manuscript and PDF, and every packaged hash.
It checks recorded evidence; [the verification guide](VERIFICATION.md) gives
commands for fresh executions.

This repository includes the completed verification run. Large execution records are compressed and
identical records share one stored copy. Personal paths are removed from the
[public records](evidence/PUBLIC-COPY.md); the validator checks their uncompressed hashes. See [the evidence guide](evidence/formal/README.md)
for reading individual records.

The theorem concerns the specified controller and observation interfaces.
The paper states the exact quantifiers, cost models, and execution scope.
Bibliographic references are included in the paper and
[reference list](paper/references.md).
