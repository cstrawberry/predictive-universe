# Verification evidence

- [Formal verification](formal/README.md): Lean 4.33.1, all 1,239 modules,
  319 public exports, the declaration census and both complete checker passes.
- [Runtime verification](runtime/README.md): bounded executions, source/object
  bindings and saved outputs checked against the Python models.
- [PDF construction](pdf/README.md): current input hashes, build, reproduction
  and rendered layout checks.
- [Package tests](tests/receipt.json): the complete current test suite, including rejection of
  changed proofs, missing modules, altered logs and unknown safe axioms.
- [Reference-source review](../output/reference-source-check.md): supplied
  publication versions, theorem locators and context checks.

These are [public copies](PUBLIC-COPY.md) with personal paths and internal
working-directory names removed. Execution timestamps, results and scientific
source hashes are retained. Record hashes bind the public copies. SHA256SUMS
binds every delivered file. Large records are compressed and identical records
share storage.
