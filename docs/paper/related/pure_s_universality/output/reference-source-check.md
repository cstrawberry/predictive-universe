# Reference sources

This document identifies the external sources examined for the paper's
comparisons and the scope of those checks. External source PDFs are not
bundled in this package. The [bibliography](../paper/references.md) provides publisher,
repository and author links for obtaining the sources where available.

The confluence comparison cites Rosen's 1973 article. The normalization
comparison cites Waldmann's 2000 journal article and 1998 thesis. The
effective-strategy comparison cites Statman's October 1996 research report.
The relevant statements, hypotheses and page locators support these uses in
the manuscript.

| Reference | Available source | Relevant pages |
|---|---|---|
| [2] Rosen (1973) | Final JACM article, `321738.321750.pdf` | Theorem 5.6, p. 171; rule-schemata conditions and application to combinatory logic, pp. 176–177. |
| [5] Waldmann (2000) | Final Information and Computation article, supplied separately as `1-s2.0-S0890540100928748-main.pdf` | Normalization decision, theorem 55, p. 13; regular grammar, theorem 56 and Appendix 2, pp. 13, 18–19. |
| [19] Asperti–Mairson (2001) | Final Information and Computation article, `1-s2.0-S089054010192869X-main.pdf` | Theorem 5.3 and Corollaries 5.4–5.6, beginning on p. 71. |
| [29] Ibarra–Trân (1993) | Final TCS article, `1-s2.0-030439759390028R-main.pdf` | Input convention, normal form, separation results and conclusion, pp. 392–396. |
| [33] Fokker (1992) | Final Formal Aspects of Computing article, `BF03180572.pdf` | Definitions, p. 776; Theorem 3 and basis identities, pp. 779–780. |
| [42] Waldmann (1998) | Thesis Part II, `Waldmann_1998_thesis_Part_II.pdf`, printed pp. 43–85 | Top termination, Chapter 7, pp. 61–68; normalization decision, theorem 8.6.1, p. 79. |
| [43] Statman (1996) | Mathematical Sciences Research Report No. 96-195, `Statman_1996_CMU_report_96-195.pdf` and `Effective_reduction_and_conversion_strategies_for_.pdf` | Effectiveness and cofinal reduction, Sections 1–2, pp. 1–5; conversion-class enumeration, Section 4, pp. 6–8. |

## Context checks

**Rosen [2].** The Main Theorem 5.6 on printed p. 171 establishes the
Church–Rosser property for unequivocal closed subtree-replacement systems.
The definitions and proof in Section 5 and the rule-schemata construction in
Section 6 state the required hypotheses. Theorem 6.5, pp. 176–177, gives
sufficient conditions for closure; the discussion on p. 177 applies this
framework to combinatory logic. These passages support the paper's confluence
background. Applying the framework to the native S rule uses its left-linear
left-hand side and lack of overlapping nonvariable redex patterns. Confluence
alone supplies no halting or computational-universality theorem.

**Ibarra–Trân [29].** Printed p. 392 explicitly fixes unary input initially
in one counter and no input tape. Lemmas 2.1–2.3 on pp. 392–394 describe the
normal form and computation phases. Theorem 3.2, pp. 394–395, separates the
set of primes; Theorem 3.3 extends the separation to fixed powers. The
conclusion on p. 396 distinguishes deterministic machines from the questions
about nondeterminism and alternation. All five mathematical pages,
392–396, were inspected as rendered scans. The manuscript's qualified
two-counter statement is supported. Its input convention is essential when
comparing this result with Minsky's encoded register initialization.

**Asperti–Mairson [19].** Theorem 5.3 on printed p. 71 gives explicitly typed
closed terms of linear size that normalize in a linear number of parallel
beta steps while their implementation cost exceeds any fixed elementary
bound. Corollaries 5.4–5.6 treat local graph interactions, readback and the
gap from ordinary beta steps. The abstract and surrounding discussion preserve
the distinction between a Lévy-family parallel step and the implementation
work needed to carry it out. This supports the paper's caution about costs
hidden by parallel reduction. It does not establish the paper's separate
shared-arena implementation obligations or give a lower bound for every
possible rewriting strategy.

**Fokker [33].** The definitions on p. 776 and Theorem 3 on p. 779 construct
a closed lambda-term forming a one-combinator basis. The displayed reduction
identities recover K and S from that constructed term. The comparison table
on p. 779 and the further derivation on p. 780 retain this meaning. The
manuscript correctly treats this as an alternative constructed basis, rather
than completeness of the preassigned native S rule.

**Waldmann [5,42].** The journal article's theorem 55, printed p. 13,
decides normal-form existence for ground pure-S terms. Its theorem 56 and
Appendix 2 give a regular grammar for the normalizing terms. The thesis
states the decision procedure in theorem 8.6.1, p. 79, and proves top
termination in Chapter 7. These results concern normalization and root
contractions. The manuscript's halting observation concerns a marked event
along its specified computation path. The later corrected automaton count
is attributed separately to Endrullis, de Vrijer and Waldmann [40].

**Statman [43].** The title page identifies Research Report No. 96-195,
Department of Mathematical Sciences, Carnegie Mellon University, October
1996. Section 1 fixes applicative S,K terms and defines effectiveness as
total recursiveness after encoding. Section 2 constructs and proves a
cofinal one-step reduction strategy. Section 4 constructs a one-step
conversion strategy that enumerates a conversion class from a suitable
representative. The manuscript preserves the distinction between reduction
and conversion. Its finite controller and all-input linear selection bound
are separate resource requirements.

## Related-work comparisons

**Kutrib--Meyer [51].** The publisher record and abstract identify
*Tree-Walking-Storage Automata*, DLT 2023, LNCS 13911, pp. 182--194,
first online 19 May 2023. This establishes the earlier conference precursor.
The full conference proof was not inspected; the theorem numbers and
non-erasing simulation used in the paper are attributed to the inspected
expanded 2026 article [8].

**Douglas [52].** The inspected repository version is commit
`5a7d3a25014983ec3bebef3eb9870933585209cb`, dated 25 August 2026.
`Universality/Defs.lean` requires an injective, path-preserving map in
`PathEncoding`. `Universality/Calibration.lean` excludes such a map from
SK into pure S by acyclicity. `Decidability.lean` supplies decidability of
reachability between two given pure-S terms. These source definitions and
proofs were inspected, but this external Lean project was not rebuilt.
The present construction reads repeated source rows from different target
terms and tests an unbounded sequence against a fixed halting language;
neither operation requires the excluded fixed-representative encoding.
The repository's own status statement leaves S universality unresolved.

**Klop--van Oostrom--van Raamsdonk [53].** The author manuscript's
Section 4, Theorem 3 and proof state pure-S acyclicity. This is classical
background for the fixed-representative obstruction, not a new impossibility
result for the present selected-trajectory construction. The source's
attribution to Bergstra--Klop (1979) was not independently checked against
that earlier original and is not substituted for the inspected 2007 proof.

## Source inventory

The [supplied-source inventory](../evidence/references/supplied-source-inventory.json)
records filenames, page counts and SHA-256 hashes for the nine external PDFs
examined together. They included the cited final publications, alongside the
34-page Asperti–Mairson manuscript and Fokker author copy as additional
versions. This inventory identifies the external documents examined; those
PDFs are not bundled in this package. The bibliography identifies the thesis and technical
report by their own publication details.
