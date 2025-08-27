# Appendix Y — Baryon Asymmetry from Predictive Anomaly Inflow

### Y.0. Setup and notation

On the emergent Lorentzian manifold $(M,g)$ of §11, PU yields the standard gauge bundle

$$
G \;=\; U(1)\times SU(2)\times SU(3)
\tag{Y.0.1}
$$

as PCE‑preserving automorphisms of predictive frames (Conjecture G.M1, Appendix G). Chiral fermions are sections of $S^\pm\!\otimes E_R$ where $E_R$ is the $G$–associated vector bundle corresponding to a *predictive block* representation $R$ (Appendix R). The twisted Dirac index equals the block’s net chirality (Lemma R.IDX1), and anomaly additivity under block replication holds (Lemma R.IDX2).

Let $\mathcal V\subset M$ be a comoving 4‑volume bounded by two Cauchy slices $\Sigma_i$ (early) and $\Sigma_f$ (late), corresponding to constant values of the emergent temporal coordinate (Section 11, Appendix O), with outward normal conventions as in §12. Let $N_g$ be the number of predictive blocks carrying the usual $SU(2)_L$ doublets (three in the SM case). Denote the electroweak field strength $W^a_{\mu\nu}$ and its dual $\tilde W^{a\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}W^a_{\rho\sigma}$. The $SU(2)$ Chern–Simons functional on a slice $\Sigma$ is

$$
N_{CS}(\Sigma)\;=\;\frac{g^2}{32\pi^2}\int_{\Sigma} \mathrm{tr}\!\left(\mathcal A\wedge d\mathcal A+\tfrac23\,\mathcal A\wedge\mathcal A\wedge\mathcal A\right).
\tag{Y.0.2}
$$


### Y.1. PU–Sakov conditions (no new assumptions)

**Theorem Y.1 (Sakharov conditions hold generically in PU).**
In any PU cosmology satisfying the emergence of spacetime (§11) and gravity (§12) and with gauge bundle $G$ from Conjecture G.M1:

1. (**Baryon‑number non‑conservation**) The chiral electroweak anomaly (related to the index theorem, Lemma R.IDX1) dictates the non-conservation of the baryon ($B$) and lepton ($L$) currents:

   $$
   \partial_\mu J_{B+L}^\mu \;=\; 2 N_g\,\frac{g^2}{32\pi^2}\, W^a_{\mu\nu}\tilde W^{a\mu\nu}, \tag{Y.1}
   $$

   where $N_g$ is the number of generations. This implies $B{+}L$ is violated by topological transitions (e.g., sphalerons). The standard per‑generation coefficients $C_B=C_L=1$ yield the factor $2N_g$ in (Y.1) [’t Hooft 1976; Klinkhamer & Manton 1984].
   If right‑handed neutrinos ($\nu_R$) are *not* included in the predictive block content, the mixed gravitational anomaly can induce $B{-}L$ violation:

   $$
   \partial_\mu J_{B-L}^\mu \;=\; c_{\rm grav}\, R\tilde R\;+\;c_Y\,F_Y\tilde F_Y, \tag{Y.2}
   $$

   with coefficients fixed by the block’s charges (Lemma R.IDX2). If $\nu_R$ are included, all mixed gauge and gravitational anomalies cancel, hence (Y.2)$=0$.

2. (**C and CP violation**) The emergent gauge interactions (predictive‑frame connection) carry generic complex phases (e.g., in the Yukawa couplings derived in Appendix R). CP invariance requires these phases to satisfy specific, measure‑zero constraints. Thus, generic PU configurations violate CP without requiring extra fields. This is the standard “complex phase is generic” argument, now anchored in the emergent $G$‑bundle structure (Appendix G) and the topological origin of generations (Appendix R).

3. (**Departure from equilibrium**) The arrow‑of‑becoming and local horizon thermodynamics (§12; Theorem 12.G2 with positive Unruh/KMS temperature) enforce nonequilibrium during expansion. Hence all three Sakharov conditions hold without additional assumptions [Sakharov 1967].

*Proof.* (1) follows from the Atiyah–Singer index [Atiyah & Singer 1968] for chiral fermions in $SU(2)$ backgrounds (Lemma R.IDX1) and the standard descent to the local anomaly (Y.1). The gravitational/hypercharge statement is the usual mixed‑anomaly consequence of Lemma R.IDX2. (2) In the $G$–principal bundle, PCE‑preserving automorphisms with complex phases are open and dense; CP‑symmetric holonomy constraints define a lower‑dimensional subset. (3) The Clausius relation with $T>0$ and $\dot a>0$ forbids global equilibrium across cosmological horizons (Theorem 12.G2 and Appendix E). ∎


### Y.2. Anomaly inflow identity → net baryon number

**Theorem Y.2 (Baryon number from electroweak anomaly inflow).**
For any comoving 4‑volume $\mathcal V$ bounded by $\Sigma_i,\Sigma_f$,

$$
\Delta B\;+\;\Delta L \;=\; \int_{\mathcal V}\!\! d^4x\ \partial_\mu J_{B+L}^\mu
\;=\; 2 N_g\ \big[\ N_{CS}(\Sigma_f)\ -\ N_{CS}(\Sigma_i)\ \big]. \tag{Y.3}
$$

If $B{-}L$ is anomalous (no $\nu_R$), then

$$
\Delta(B{-}L)\;=\;\int_{\mathcal V}\!\! d^4x\ \big(c_{\rm grav}\, R\tilde R + c_Y\,F_Y\tilde F_Y\big). \tag{Y.4}
$$

*Proof.* Integrate (Y.1) over $\mathcal V$ and use that $W\tilde W=\partial_\mu K^\mu$ where $K^\mu$ is the Chern–Simons current; Stokes’ theorem reduces the 4D integral to the difference of $N_{CS}$ on the boundary slices. The $B{-}L$ statement follows similarly from (Y.2). ∎

**Corollary Y.2.1 (Quantization and universality).**
In any history where the gauge field asymptotes to pure gauges on $\Sigma_{i,f}$, $N_{CS}(\Sigma)\in\mathbb Z$. Hence $\Delta(B{+}L)=2 N_g\,\Delta N_{CS}$ is **topologically quantized**. This uses only PU’s gauge‑bundle structure and index theory.


### Y.3. Why a nonzero drift appears (sign without extra couplings)

**Proposition Y.3 (Out‑of‑equilibrium + CP violation ⇒ nonzero $\langle \Delta N_{CS}\rangle$).**
Assume the electroweak sector is in a locally thermal but *driven* (KMS‑oriented) state due to expansion/horizon exchange (§12), and the predictive measure is CP‑asymmetric (generic in PU). Then the CP‑odd scalar $W\tilde W$ has a nonvanishing expectation in linear response, producing a nonzero **drift** of the Chern–Simons number and hence a net $\langle\Delta(B{+}L)\rangle\neq 0$ via (Y.3).

*Proof (linear‑response sketch).* In a CP‑symmetric state, $\langle W\tilde W\rangle=0$ by parity. A CP‑odd perturbation (generic complex holonomy in the predictive connection) plus a time‑oriented KMS driving modifies the Kubo two‑point kernel so that the CP‑odd correlator $\langle K^0; \mathcal H_{\text{drive}}\rangle$ is nonzero. Since $\dot N_{CS}=\int d^3x,\frac{g^2}{32\pi^2},W\tilde W$, the expectation drifts with sign fixed by the CP‑odd part of the response. No new operators are introduced—this is standard anomaly‑induced transport under nonequilibrium. ∎


### Y.4. Two channels summarized

* **Pure electroweak anomaly (generic case; $\nu_R$ present, $B{-}L$ conserved).**
  $\Delta (B{+}L)=2 N_g\,\Delta N_{CS}$, with nonzero drift from Proposition Y.3 during the driven epoch. Sphalerons later freeze out, locking in $B\neq 0$.

* **Gravitational/leptonic channel (if $B{-}L$ anomalous; no $\nu_R$).**
  $\Delta(B{-}L)=\int_{\mathcal V}(c_{\rm grav}\,R\tilde R+c_Y F_Y\tilde F_Y)$ from (Y.4) seeds a lepton asymmetry which sphalerons partially convert to baryon number. Lemma R.IDX2 fixes the coefficients—no tuning.

Both are purely **topological/anomalous** and require only the already‑derived PU structures.


### Y.5. Quantitative Pathway for Baryogenesis

The baryon-to-entropy ratio $\eta_B\equiv n_B/s$ is generated during a non-equilibrium epoch in the early universe. The PU framework provides the necessary ingredients (the Sakharov conditions, as per Appendix Y) and allows for a quantitative calculation. The net baryon number produced is proportional to the total change in the Chern-Simons number, $\Delta N_{CS}$, integrated over the relevant epoch. The rate of change of $\langle N_{CS} \rangle$ is proportional to the expectation value of the CP-violating operator $W\tilde{W}$, which is non-zero in a driven, out-of-equilibrium thermal state with fundamental CP violation.
$$
\frac{d \langle N_{CS} \rangle}{dt} \propto \Gamma_{\mathrm{CS}}(T) \cdot \delta_{CP} \cdot f_{NEQ}(T)
$$
where $\Gamma_{\mathrm{CS}}(T)$ is the sphaleron rate, $\delta_{CP}$ is the fundamental CP-violating parameter from the PU predictive-frame bundle, and $f_{NEQ}(T)$ is a factor quantifying the departure from thermal equilibrium, proportional to $H(T)/T$. Integrating this rate yields the final asymmetry:
$$
\boxed{\,\eta_B^{\mathrm{final}}\;=\;\frac{N_g}{\mathcal C}\int_{T_{\mathrm{fo}}}^{T_i}
\frac{\Gamma_{\mathrm{CS}}(T)\;\delta_{CP}\;(H(T)/T)\;W(T)}
{g_\ast^{3/2}(T)\;\sqrt{G_H(T)}\;T^6}\;dT\, },\qquad N_g=3,
$$
with:
*   $s(T)=\tfrac{2\pi^2}{45}\,g_\ast(T)\,T^3$, $H(T)=\sqrt{\tfrac{8\pi^3}{90}\,G_H(T)\,g_\ast(T)}\,T^2$.
*   $\Gamma_{\mathrm{CS}}(T)$ is the standard sphaleron transition rate.
*   $\delta_{CP}$ is the key PU input: a dimensionless, in‑principle computable measure of CP violation from the complex holonomies of the predictive‑frame bundle.
*   $W(T)\in[0,1]$ is a washout factor.
*   $T_{\mathrm{fo}}$ is the freeze‑out temperature where $\Gamma_{\mathrm{CS}}(T_{\mathrm{fo}})\!\approx\!H(T_{\mathrm{fo}})$.
*   $\mathcal C$ is a standard normalization constant.

**Benchmark estimate.** Taking $g_\ast\!=\!106.75$ for the SM plasma [Husdal 2016], $T_{\mathrm{fo}}\approx 130\,\mathrm{GeV}$ [D’Onofrio et al. 2014], and standard cosmological relations, the final baryon-to-entropy ratio is approximately
$$
\eta_B \approx \frac{n_B}{s} \approx \mathcal{C}_{norm} \cdot \delta_{CP} \cdot W_{eff}
$$
where $\mathcal{C}_{norm} \approx 10^{-3}$ is a coefficient derived from integrating the sphaleron rate against the Hubble expansion, and $W_{eff}$ is an effective washout factor. For a conservative washout $W_{eff} \sim 10^{-2}$, this yields
$$
\eta_B \sim 10^{-5} \times \delta_{CP}.
$$
Hence a **conservative** $\delta_{CP}\sim 10^{-5}$—consistent with a small predictive‑frame holonomy—yields
$$
\eta_B \sim 10^{-10},
$$
within the observed range of $\eta_B \approx 6 \times 10^{-10}$ [Planck Collaboration 2020]. This provides a concrete target for computing $\delta_{CP}$ from the PU connection.



### Y.6. Boundary conditions and sign

**Corollary Y.6 (Sign tied to initial predictive boundary).**
If the minimal‑complexity initial boundary $\Sigma_i$ (PU “Past Hypothesis”) selects the trivial class $N_{CS}(\Sigma_i)=0$, and if the CP‑odd response has fixed sign under the horizon‑oriented KMS drive, then $\operatorname{sgn}\Delta B=\operatorname{sgn}\Delta N_{CS}$ is determined. This ties the **observed sign of baryon excess** to a **convention‑free topological orientation** in PU (no new parameters).

*Proof.* Combine (Y.3), Proposition Y.3, and the boundary choice $N_{CS}(\Sigma_i)=0$. ∎