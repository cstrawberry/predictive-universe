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


#### Y.4.1 Quantitative Plausibility Sketch

To demonstrate quantitative viability, we outline a standard, PU-compatible electroweak-era mechanism that can yield the correct order of magnitude for the baryon-to-entropy ratio:
$$
\eta_B \;\equiv\; \frac{n_B}{n_\gamma} \;\approx\; 6\times10^{-10}.
$$
The effective evolution of the comoving baryon yield $Y_B$ in the out-of-equilibrium region near the electroweak crossover (with $z\equiv T_c/T$) is governed by a Boltzmann-type equation:
$$
\frac{dY_B}{dz}
\;=\;
-\frac{\Gamma_{\rm sph}(z)}{H(z)}\Big(Y_B-c_{\rm sph}\,Y_{B-L}\Big)
\;+\;\frac{S_B(z)}{s(z)H(z)}
\;-\;\frac{W(z)}{H(z)}\,Y_B,
$$
where $s$ is the entropy density, $c_{\rm sph}=28/79$ is the sphaleron conversion factor, $S_B$ is the CP-violating source term, and $W$ encodes washout processes. In a thin-freeze-out approximation, where the source and washout are localized, the final asymmetry is:
$$
\eta_B
\;\simeq\;
\zeta_{\rm dil}\;\times\;c_{\rm sph}\;\times\;\epsilon_{\rm CP}\;\times\;
\left.\frac{\Gamma_{\rm sph}}{H}\right|_{z_*}\;\times\;f_{\rm wash},
$$
with $\epsilon_{\rm CP}$ being the effective CP asymmetry, $\zeta_{\rm dil}$ a dilution factor, and $f_{\rm wash}$ the washout survival fraction.

**Illustrative PU-compatible parameters:** Taking
$$
\epsilon_{\rm CP}\sim 10^{-6},\qquad
\left.\frac{\Gamma_{\rm sph}}{H}\right|_{z_*}\sim 3\times10^{-2},\qquad
f_{\rm wash}\sim 0.1,\qquad
\zeta_{\rm dil}\sim 1,
$$
gives
$$
\eta_B \;\simeq\; (28/79)\times 10^{-6}\times 3\times10^{-2}\times 0.1 \times 1
\;\approx\; 1\times10^{-9}.
$$
This demonstrates that the mechanism is quantitatively plausible. In the PU framework, the key parameters are not arbitrary inputs. The predictive viscosity and relaxation scales set the out-of-equilibrium dynamics (entering $z_*$ and $\Gamma_{\rm sph}/H$), while the capacity-limited gauge kinetics and the geometric holonomy of the predictive bundle (as detailed in Section Y.5) determine the fundamental CP asymmetry $\epsilon_{\rm CP}$. A full computation can thus promote these from phenomenological inputs to derived parameters, enabling a falsifiable estimate of $\eta_B$.

### Y.5. Quantitative Pathway for Baryogenesis from Predictive Holonomy

This section provides a computable pipeline to derive the baryon asymmetry $\eta_B$ from the geometric invariants of the PU predictive bundle.

#### Y.5.1 CP Source and Chemical Potential
Let $\delta_{\rm CP}$ be the Berry–Simon holonomy of the predictive bundle, computed via the integral of the curvature of the connection $\mathcal{A}$ over a minimal update cycle surface $\Sigma$:

$$
\boxed{\ \delta_{\rm CP}\ =\ \int_{\Sigma} d\mathcal A\ }\tag{Y.5}
$$

This holonomy is a gauge-invariant, dimensionless measure of the fundamental CP violation.

**CP source and Kubo definition.** The PU‑induced CP source acts as an effective baryon chemical potential,
\[
\mu_B(T)=J_{\rm PU}(T)\,\delta_{\rm CP}\,T,\qquad
J_{\rm PU}(T)=\lim_{\omega\to0^+}\frac{1}{T}\frac{\Im\,G^R_{B\,\mathcal O}(\omega)}{\omega},
\]
where \(G^R_{B\,\mathcal O}\) is the retarded correlator between the conserved baryon number density and the PU predictive operator \(\mathcal O\) that sources the holonomy.

**Baryon yield.** In the relativistic, small‑\(\mu/T\) regime, the baryon‑to‑entropy ratio can be written as
\[
\eta_B=\frac{15}{4\pi^2 g_\*(T)}\!
\left(\sum_i g_i B_i^2\right)
\int_{t_i}^{t_f}\!dt\,\frac{\Gamma_{\rm sph}(T)}{T^2}\,
\frac{\mu_B(T)}{T}\,
e^{-\int_t^{t_f}\!dt'\,\Gamma_{\rm wash}(T')},
\]
where the species sum runs over relativistic degrees of freedom with baryon charge \(B_i\) and degeneracy \(g_i\). Defining the thermal coefficient
\[
C_{\rm th}(T)\equiv \frac{15}{4\pi^2 g_\*(T)}\sum_i g_i B_i^2,
\]
we have the compact form
\[
\eta_B=\delta_{\rm CP}\int_{t_i}^{t_f}\!dt\;C_{\rm th}(T)\,
\Gamma_{\rm sph}(T)\,J_{\rm PU}(T)\,
e^{-\int_t^{t_f}\!dt'\,\Gamma_{\rm wash}(T')}\,.
\]
**Electroweak window.** The integral is taken across the electroweak crossover where sphaleron transitions are active and subsequently freeze out; lattice‑informed \(\Gamma_{\rm sph}(T)\) and standard model inputs determine \(C_{\rm th}(T)\).

#### Y.5.3 Computational Program

1. Compute $\delta_{\rm CP}$ from the holonomy integral (Y.5) using the MPU's alphabet kernel.
2. Compute the transport coefficient $J_{\rm PU}(T)$ from the PU response functions.
3. Evaluate the thermodynamic integral $\mathcal K_{\rm PU}$ using standard thermal field theory for $\Gamma_{\rm sph}$ and $\Gamma_{\rm wash}$.
4. The observed $\eta_B \approx 6 \times 10^{-10}$ then provides a sharp, falsifiable prediction for the value of $\delta_{\rm CP}$.


### Y.6. Boundary conditions and sign

**Corollary Y.6 (Sign tied to initial predictive boundary).**
If the minimal‑complexity initial boundary $\Sigma_i$ (PU “Past Hypothesis”) selects the trivial class $N_{CS}(\Sigma_i)=0$, and if the CP‑odd response has fixed sign under the horizon‑oriented KMS drive, then $\operatorname{sgn}\Delta B=\operatorname{sgn}\Delta N_{CS}$ is determined. This ties the **observed sign of baryon excess** to a **convention‑free topological orientation** in PU (no new parameters).

*Proof.* Combine (Y.3), Proposition Y.3, and the boundary choice $N_{CS}(\Sigma_i)=0$. ∎