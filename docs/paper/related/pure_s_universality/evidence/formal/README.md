# Formal verification

The [Lean 4.33.1 completion record](headline-complete/COMPLETE-VERIFICATION.json)
binds the successful build, audits, replays and runtime checks.
[MANIFEST.json](headline-complete/MANIFEST.json) inventories the preserved evidence.
[verified-source-manifest.json](headline-complete/verified-source-manifest.json)
binds every delivered formalization file to the verified candidate.

The public report describes the isolated complete verification of all 1,239 modules
and 319 exports, including the headline theorem and Appendix F. The current
[verification guide](../../VERIFICATION.md) gives the supported public commands.
The composite completion record identifies the successful checks and their
exact coverage.

The public release validator checks complete exact-module alternate replay,
fresh replay source bindings, the compiled census, axiom allowlists and controls.
The [execution receipt](headline-complete/receipt.json) records the complete
run using the delivered reproduction command. Its directory includes the
exact executed runner, all command logs, before/after source and object hashes,
checker and native executable bindings, and the compiled declaration census.

Large records use gzip compression. Identical records share one stored copy.
[STORAGE.json](headline-complete/STORAGE.json) maps their original names to
physical files. Personal paths have been replaced with symbolic paths as
explained in [PUBLIC-COPY.md](../PUBLIC-COPY.md). The manifests and receipt hashes
authenticate these public copies, including the separate before/after records.
SHA256SUMS also authenticates the complete physical file inventory.

To read a public record, run this from the repository root:

```sh
python3 -B src/evidence_storage.py evidence/formal/headline-complete/full-declaration-census.json
```

The helper writes the uncompressed content to standard output. Ordinary gzip tools
can also read the `.gz` files directly. Fresh verification runs still generate
ordinary uncompressed records in their requested work directory.
