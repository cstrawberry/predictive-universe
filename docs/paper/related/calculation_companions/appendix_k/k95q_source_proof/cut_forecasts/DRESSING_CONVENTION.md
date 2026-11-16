# Single-dressing convention

This fixes the bare and physical notation of the cut_completion construction
without changing any primitive kernel. There is exactly ONE PCE history
conjugation and ONE holding conjugation.

1. L_bare = Lscalar I-(H²/C)[K_cut_union+L0(F/(1+F)I+C_G)].
   This is exactly the primitive entry actual_primitive_entry of
   CUT_FINITE_COMPILER.md C4, built from cut_forecast.bare_auxiliary_entry
   and src.bare_parts. The receiver's actual source/histories/guard remain
   inside K_cut_union; 'bare' here undresses the PCE history only, not the
   receiver source.
2. Let h_bare be the normalized seven-root Legendre composition of L_bare.
   Define K_A=Omega P_D[OpW(chi*hscalar)I+OpAW(chi*(h_bare-hscalar))]P_D.
   This K_A is the undressed PCE full-native completed matrix used by
   C4-C8 and the supplied-stock energy/entropy ledger. Its K_BQ restriction
   is the actual prediction matrix; full native K_A is still used for Gibbs.
3. The physical primitive entry primitive_parts is
   L_phys=V L_bare V*. By source-independent constant-unitary covariance,
   h_phys=V h_bare V* and K_phys=V K_A V*. This equality is the physical-root
   statement of the cut_completion root action. It is NOT an instruction
   to conjugate an already dressed h_phys by V a second time.
4. The final held physical generator is
   K_held=W_D V K_A V* W_D*, with T=W_D V applied exactly once to initial
   states, observables and endpoint data. If one instead constructs K_phys
   directly from the physical primitive entry program, then the final step
   is W_D K_phys W_D*, with no additional V.

The same choice applies to the Ramsey endpoint: its physical source entry
already carries V, so direct physical construction receives only W_D. The
bare construction uses the bare endpoint and T once. All actual momentum
and source derivatives retain their complete scalar source and W_D metric
connection. V has no source derivative. No geometry/native factor is
identified or removed by this convention, and no physical source changes.

CUT_FINITE_COMPILER.md C4-C8 uses items 1-2 followed by item 4; there h_new
denotes the bare root h_bare of item 2.
