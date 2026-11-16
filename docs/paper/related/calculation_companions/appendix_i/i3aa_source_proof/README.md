# Source construction and proofs for Theorem I.3aa

This folder holds the source construction behind Theorem I.3aa of Appendix I, its supporting proofs, and the programs that compute and check its finite parts. The companion [i3aa-selected-native-source.md](../i3aa-selected-native-source.md) summarizes the result.

## Main documents

1. [construction/INDEXED_MASTER_CONSTRUCTION.md](construction/INDEXED_MASTER_CONSTRUCTION.md): the indexed common source, its resource ledger, its physical, source and observation maps, and the scope of what is computed.
2. [stress/EXACT_ACTION_CONGRUENCE_ELLIPTIC_JOIN.md](stress/EXACT_ACTION_CONGRUENCE_ELLIPTIC_JOIN.md): exact on-shell stress, cosmological congruence and the elliptic join.
3. [geometry/CURVED_GEOMETRY_BE_MOSCO_CERTIFICATE.md](geometry/CURVED_GEOMETRY_BE_MOSCO_CERTIFICATE.md): the warped geometry, its finite network and its continuum limit.

## Folders

| Folder | Contents |
|:--|:--|
| `construction/` | Indexed common source and fixed entry language; programs for the native source, certified spectra, canonical entries, history and classical bounds; their checks |
| `common_source/` | Finite source selector, source-equation geometry selector, native edge cost and channel, capacity volume; programs for the candidate registry, intervals and source task; symbolic check of the Einstein and material residual formulas |
| `geometry/` | Curved geometry certificate (main branch) and flat four-torus comparison lemma, with their programs and checks |
| `geometry/slab/` | Finite reflecting slab, fixed-domain Mosco and spectral passage, and smooth receipts, with program and checks |
| `stress/` | Canonical matter source, stress and congruence, semiclassical constants, native source search, exact cutoffs and endpoints; the canonical source program and its tests |
| `qualifier/` | Source-relative Definition 23 qualification and counted endpoint integration; qualifying-port certificate and full response tables |
| `qualifying_port/` | Native qualifying-port source program and its record |
| `refined_join/` | One stocked source family for the response, direction, spatial-clock and area conjunction |
| `return_adapter/` | Exact native reusable-return adapter and boundary channel |

Each program writes its results to the `.json` file beside it. The programs need Python 3 with NumPy, SciPy, SymPy and mpmath.
