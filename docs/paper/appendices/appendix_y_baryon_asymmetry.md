# Appendix Y — Baryon Asymmetry from Predictive Anomaly Inflow

## Y.1 Overview and Derivation Chain

This appendix derives the baryon-to-photon ratio $\eta_B$ from the foundational constants of the Predictive Universe framework. The complete derivation chain is:

$$K_0 = 3 \xrightarrow{\text{Thm 23}} d_0 = 8 \xrightarrow{\text{Def 15a}} (a,b) = (2,6) \xrightarrow{\text{Thm Z.5}} M = 24$$

$$\xrightarrow{\text{Thm T.5}} \kappa_{EW} = 38.5 \xrightarrow{\text{Thm T.56}} \delta = 66.7° \xrightarrow{\text{Thm Y.8}} \kappa_B = 19.48$$

$$\xrightarrow{\text{Thm Y.9}} \eta_B = (6.2 \pm 0.5) \times 10^{-10}$$

**Summary of Results:**

| Quantity | Derived Value | Observed Value | Discrepancy |
|:---------|:-------------:|:--------------:|:-----------:|
| $\eta_B$ | $(6.2 \pm 0.5) \times 10^{-10}$ | $(6.12 \pm 0.04) \times 10^{-10}$ | $+0.2\sigma$ |
| $\delta$ | $66.7°$ | $65.7° \pm 1.5°$ | $+0.7\sigma$ |
| $J_{CP}$ | $3.22 \times 10^{-5}$ | $(3.12^{+0.13}_{-0.12}) \times 10^{-5}$ | $+0.8\sigma$ |


---

## Y.2 Foundations: Matter-Antimatter Duality from SPAP

### Y.2.1 The NOT Operation and Binary Duality

**Recall from Theorem 10 (SPAP).** Any non-trivial predictive system $\mathcal{P}$ attempting to predict its own future state $\phi_{t+1}$ while the prediction $p$ is stored internally generates a logical contradiction resolved by the update rule
$$\phi_{t+1} = \text{NOT}(p_{\text{stored}}).$$
This binary contradiction is the source of the duality structure used below.

The NOT operation on binary states generates two complementary branches:
- Branch $\mathcal{A}$: prediction was 0 → outcome is 1
- Branch $\mathcal{B}$: prediction was 1 → outcome is 0

**Proposition Y.1** (Predictive $\mathbb{Z}_2$ Involution and Charge-Conjugation Modeling). *The SPAP update determines a canonical logical $\mathbb{Z}_2$ involution on the predictive two-branch state space. Interpreting that involution as particle-antiparticle exchange is an additional physical identification, modeled by charge conjugation $\mathsf{C}$ on a chosen two-state sector.*

This proposition establishes a correspondence principle between logical and physical structures:

| SPAP Logic | Particle Physics Interpretation |
|:-----------|:--------------------------------|
| Binary state $\phi \in \{0,1\}$ | Two-state particle/antiparticle sector |
| NOT operation | Modeled by charge conjugation $\mathsf{C}$ |
| $\mathbb{Z}_2$ symmetry | Discrete exchange symmetry in the chosen sector |
| 2-to-1 merge | Effective annihilation / branch-selection analogue |

*Proof.* The SPAP update rule $\phi_{t+1} = \text{NOT}(\hat{\phi}_t)$ acts on the binary set $\{0,1\}$, and NOT is the unique non-trivial involution on that set. Therefore the predictive state space carries a canonical $\mathbb{Z}_2$ action. By the Principle of Physical Instantiation (Definition P.6.2), any concrete realization of this two-branch structure must choose a physical involution exchanging the two branches. In a relativistic particle-antiparticle sector, a natural choice is charge conjugation $\mathsf{C}$. The CPT theorem [Pauli 1955; Lüders 1954] guarantees that such a charge-conjugation operator fits consistently into the usual discrete-symmetry structure of local relativistic QFT, but it does not by itself prove that every predictive $\mathbb{Z}_2$ involution must equal $\mathsf{C}$. After adopting this modeling identification, one may choose a basis $|0\rangle,|1\rangle$ with
$$
\mathsf{C}|0\rangle = |1\rangle, \qquad \mathsf{C}|1\rangle = |0\rangle.
$$
The proposition therefore establishes a model-level correspondence between the predictive involution and charge conjugation, not an unconditional derivation of $\mathsf{C}$ from CPT. ∎

### Y.2.2 The 2-to-1 Merge and Branch Selection

**Recall from Theorem 31.** Resolution of the SPAP contradiction requires irreversible state merging with minimum entropy cost
$$\varepsilon_0=\ln2 \text{ nats}.$$
This Landauer floor is the thermodynamic input used in the branch-selection argument below.

**Corollary Y.1.1** (Irreversible Branch Selection). *At the verification step of each SPAP cycle, the 2-to-1 merge selects one branch of the NOT duality and irreversibly erases the other. This selection determines whether the local predictive outcome manifests as "particle" or "antiparticle."*

The global preponderance of matter over antimatter reflects the cumulative effect of branch selections across the cosmic MPU network, with the initial selection determined by boundary conditions on the primordial predictive state.

---

## Y.3 Sakharov Conditions as Necessary Consequences

**Theorem Y.2** (Sakharov Conditions on the Appendix Y baryogenesis branch). *On the SM-gauge, three-generation, Berry-CP, and electroweak nonequilibrium branch package — comprising (i) the SM-like gauge algebra of Theorem G.8.4b on its anomaly/hypercharge hypotheses, (ii) the realized three-generation count $N_g = 3$ on the MDL/PCE minimal-family branch (Theorem R.3.4 supplies minimal admissibility; exact realization requires the minimal-family/PCE branch), (iii) the nonzero CKM CP phase $\delta = 66.7°$ on the Berry-loop branch of Appendix T (Theorem T.56 with the Berry-area branch labels recorded in the branch ledger), and (iv) the SPAP/arrow-of-time structure (Theorem 31, Appendix O) — the three Sakharov ingredients are realized in the framework:*


### Y.3.1 Baryon Number Non-Conservation

The gauge structure $\mathfrak{g} = \mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak{u}(1)$ emerges as PCE-preserving automorphisms of predictive frames (Theorem G.8.4b). On this branch the gauge anomaly classes vanish by the predictive-descent requirement of Theorem X.8d and Section G.8.2.3. The current $B+L$ is not a gauge/frame redundancy; it is a global current. Its electroweak anomaly is therefore an admissible physical update channel rather than a failure of predictive descent. The chiral coupling of left-handed fermions to $SU(2)_L$ implies the Adler-Bell-Jackiw anomaly:

$$\partial_\mu J_{B+L}^\mu = \frac{N_g g^2}{16\pi^2} W^a_{\mu\nu}\tilde{W}^{a\mu\nu} \tag{Y.1}$$

where $N_g = 3$ is the number of generations (Theorem R.3.4), $W^a_{\mu\nu}$ is the $SU(2)_L$ field strength, and $\tilde{W}^{a\mu\nu} = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma}W^a_{\rho\sigma}$ is its dual.

*Derivation:* For a single left-handed $SU(2)_L$ doublet, the $SU(2)$ chiral anomaly contributes
$$
\partial_\mu j^\mu = \frac{g^2}{32\pi^2}W^a_{\mu\nu}\tilde W^{a\mu\nu}
$$
to the divergence of the unit-charged current. Weighting by the $B+L$ charge and summing over left-handed doublets in one generation gives: three quark doublets with $B=\frac{1}{3}$ (one per color) contribute total $B$ charge $3\cdot\frac{1}{3}=1$, and the lepton doublet contributes total $L$ charge $1$. Hence the total $B+L$ charge per generation is $2$, yielding
$$
\partial_\mu J^\mu_{B+L} = 2\cdot \frac{g^2}{32\pi^2}W^a_{\mu\nu}\tilde W^{a\mu\nu}
= \frac{g^2}{16\pi^2}W^a_{\mu\nu}\tilde W^{a\mu\nu}.
$$
Multiplying by $N_g$ gives (Y.1).

### Y.3.2 C and CP Violation

**Imported result (Theorem T.56, CP Phase from Berry Holonomy).** The CP-violating phase in the CKM matrix arises as the Berry holonomy around the minimal flavor-changing loop on the generation manifold $\text{Gr}(2,8)$:

$$\delta = \delta_{\text{flat}} \times f_{\text{sinc}} = 70.53° \times 0.9454 = 66.7°$$

where
- $\delta_{\text{flat}} = 2\arctan(\sqrt{2}/2) = 70.53°$ is the base phase from the up-down sector mismatch in $E_8$ root space,
- $f_{\text{sinc}} = \text{sinc}(1/\sqrt{3}) = 0.9454$ is the coherent averaging factor over the generation wavepacket (Theorem T.55).

The CP phase is non-zero because the up and down quark sectors occupy geometrically distinct triads in the $E_8$ root lattice:
- Down quarks: $(d^2_{32}, d^2_{31}) = (2, 4)$
- Up quarks: $(d^2_{32}, d^2_{31}) = (4, 8)$

This mismatch generates a non-trivial Berry curvature, and the holonomy around the flavor quadrilateral $(u_3 \to d_3 \to d_2 \to u_2 \to u_3)$ yields the physical CP phase.

### Y.3.3 Departure from Thermal Equilibrium

The SPAP cycle is intrinsically irreversible (Theorem 31: $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$). At the cosmological level, the arrow of time (Appendix O) and the nonzero thermodynamic cost of predictive updating prevent exact global equilibrium. In the PU baryogenesis mechanism, the electroweak epoch is the regime in which sphaleron transitions are active, while the residual nonequilibrium efficiency is encoded by the complexity-suppression factor introduced later as $e^{-\kappa_B}$.

*Proof of Theorem Y.2.*  
(1) On the SM-gauge branch (Theorem G.8.4b), Equation (Y.1), derived from the chiral $SU(2)_L$ anomaly, gives $\partial_\mu J^\mu_{B+L}\neq 0$ whenever the topological density $W\tilde W$ has nonzero integral, so baryon number is violated.  
(2) On the chiral SM gauge structure, the electroweak interaction distinguishes charge-conjugate configurations, and on the Berry-loop branch of Appendix T, Theorem T.56 supplies a nonzero CP-violating phase $\delta = 66.7°$, so CP is violated.  
(3) Theorem 31 provides a strictly positive irreversible budget $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$ for the underlying predictive update, and Appendix O supplies the macroscopic arrow of time. The remaining baryogenesis-specific departure from equilibrium is encoded by the factor $e^{-\kappa_B}$, whose magnitude is set by the Appendix Y baryogenesis branch. The Sakharov ingredients are therefore realized on the combined branch package; they are not independent assumptions, but an unconditional theorem-level result would require derivations of the SM gauge content, exact $N_g = 3$, nonzero CKM phase, and electroweak nonequilibrium environment from PU axioms alone. ∎


---

## Y.4 Anomaly Inflow and Topological Baryon Production

### Y.4.1 Chern-Simons Number and Vacuum Structure

**Definition Y.3** (Chern-Simons Functional). *On a spatial hypersurface $\Sigma$, the $SU(2)$ Chern-Simons number is:*

$$N_{CS}(\Sigma) = \frac{g^2}{32\pi^2}\int_{\Sigma} \text{tr}\left(\mathcal{A} \wedge d\mathcal{A} + \frac{2}{3}\mathcal{A} \wedge \mathcal{A} \wedge \mathcal{A}\right) \tag{Y.2}$$

The electroweak vacuum has a periodic structure with $N_{CS} \in \mathbb{Z}$ labeling topologically distinct sectors. Transitions between adjacent vacua ($\Delta N_{CS} = \pm 1$) violate $B + L$ by $2N_g$ units.

**Theorem Y.4** (Baryon Number from Anomaly Inflow). *For a spacetime 4-volume $\mathcal{V}$ bounded by initial and final Cauchy surfaces $\Sigma_i$ and $\Sigma_f$:*

$$\Delta B + \Delta L = 2N_g \left[N_{CS}(\Sigma_f) - N_{CS}(\Sigma_i)\right] \tag{Y.3}$$

*Proof.* Integrate the anomaly equation (Y.1) over $\mathcal{V}$:
$$\Delta(B+L) = \int_{\mathcal{V}} d^4x\, \partial_\mu J_{B+L}^\mu = \frac{N_g g^2}{16\pi^2}\int_{\mathcal{V}} W\tilde{W}$$

Using $W\tilde{W} = \partial_\mu K^\mu$ where $K^\mu$ is the Chern-Simons current, Stokes' theorem gives:
$$\Delta(B+L) = \frac{N_g g^2}{16\pi^2}\left[\int_{\Sigma_f} K^0 - \int_{\Sigma_i} K^0\right] = 2N_g \Delta N_{CS}$$
∎

**Corollary Y.4a (Electroweak Anomaly as an Admissible Predictive Update Channel).** On the SM-gauge branch of Theorem G.8.4b, the electroweak relation in Theorem Y.4 is compatible with Predictive Anomaly Descent. The gauge anomaly class vanishes, while the $B+L$ anomaly is a global-current update channel:
$$
[\mathcal A_{\mathrm{gauge}}^{\mathrm{tot}}]=0,
\qquad
\partial_\mu J_{B+L}^\mu
=
\frac{N_g g^2}{16\pi^2}W^a_{\mu\nu}\tilde W^{a\mu\nu}.
$$
Thus baryon-plus-lepton number changes are physical transitions between topological sectors, not inconsistencies of the gauge quotient.

*Proof.* Gauge transformations belong to the redundancy groupoid $\mathcal R$ of Theorem X.8d, so their anomaly class must vanish for the branch to be admissible. This is precisely the anomaly-free SM-gauge hypothesis propagated through Theorem G.8.4b. The $B+L$ transformation is not part of the gauge quotient on this branch; it labels a global current. By Corollary X.8d.1, a nonzero Ward identity for such a current is a physical update channel rather than a descent obstruction. Integrating that Ward identity over $\mathcal V$ gives Theorem Y.4, so the topological transition changes $B+L$ while preserving gauge consistency. ∎

### Y.4.2 Sphaleron Transitions

At temperatures $T \gtrsim 100$ GeV, thermal fluctuations can excite the gauge-Higgs system over the energy barrier (the sphaleron) between adjacent $N_{CS}$ sectors. The sphaleron rate per unit volume in the symmetric phase is [D'Onofrio et al. 2014]:

$$\frac{\Gamma_{\text{sph}}}{V} = \kappa_{\text{sph}} \alpha_W^5 T^4 \tag{Y.4}$$

with $\kappa_{\text{sph}} \approx 18 \pm 3$ from lattice simulations and $\alpha_W = g^2/(4\pi) \approx 1/30$.

**Definition Y.4.1** (Sphaleron Action). *The Euclidean action of the sphaleron configuration is:*
$$S_{\text{sph}} = \frac{4\pi}{\alpha_W} \approx 377$$

**Definition Y.4.2** (Sphaleron Enhancement Factor). *The dimensionless sphaleron enhancement factor is:*
$$\mathcal{S} \equiv \frac{S_{\text{sph}}}{8\pi^2} = \frac{1}{2\pi\alpha_W} \approx 4.77$$

This factor governs the magnitude of CP-odd corrections to sphaleron rates.

---

### Y.4.3 Predictive Index Form of Anomaly-Mediated Update

**Definition Y.4.3a (Chiral Predictive Update Operator).** Let $X$ be a compact regular Euclidean interpolation region between initial and final Cauchy hypersurfaces $\Sigma_i$ and $\Sigma_f$. Let $D_X^+$ be the chiral Dirac operator coupled to the electroweak gauge background on the SM branch, with Atiyah-Patodi-Singer boundary conditions. Define the predictive update index
$$
\operatorname{Ind}_{\mathrm{upd}}(D_X)
=
\dim\ker D_X^+
-
\dim\ker D_X^-.
\tag{Y.12a}
$$

**Theorem Y.4.3b (Predictive Index Theorem for Baryon Update).** On the regular electroweak anomaly branch,
$$
\operatorname{Ind}_{\mathrm{upd}}(D_X)
=
\int_X \widehat A(R)\operatorname{ch}(F)\big|_4
-
\frac{\eta(D_{\Sigma_f})-\eta(D_{\Sigma_i})+h_f-h_i}{2},
\tag{Y.12b}
$$
where $\eta(D_{\Sigma})$ is the eta invariant of the boundary Dirac operator and $h_\Sigma=\dim\ker D_\Sigma$. For an electroweak topological transition with
$$
Q_W=\Delta N_{CS},
$$
the baryon-plus-lepton update is
$$
\Delta(B+L)
=
2N_g\,\operatorname{Ind}_{\mathrm{upd}}(D_X)
=
2N_g\,\Delta N_{CS}.
\tag{Y.12c}
$$

*Proof.* Equation (Y.12b) is the Atiyah-Patodi-Singer index theorem applied to the chiral Dirac operator on the compact interpolation region $X$. On a product interpolation, the same index equals the spectral flow of the corresponding family of spatial Dirac operators between $\Sigma_i$ and $\Sigma_f$. In the electroweak $SU(2)$ sector, the spectral flow equals the gauge topological charge
$$
Q_W=\Delta N_{CS}
$$
with the standard anomaly normalization used in Theorem Y.4. For each generation, the anomaly changes baryon number and lepton number by the same topological unit, so the combined $B+L$ change per generation is $2Q_W$. Summing over $N_g$ generations gives
$$
\Delta(B+L)=2N_gQ_W.
$$
Substituting $Q_W=\operatorname{Ind}_{\mathrm{upd}}(D_X)$ gives (Y.12c). ∎

**Corollary Y.4.3c (Chirality, Anomaly Inflow, and Baryogenesis Share One Index).** On the Appendix Y branch, chiral spectral flow, anomaly-mediated update, and baryon production are three descriptions of the same integer index.

*Proof.* Theorem Y.4.3b identifies the chiral spectral flow with $\operatorname{Ind}_{\mathrm{upd}}(D_X)$ and identifies the same integer with $\Delta N_{CS}$. Theorem Y.4 identifies $\Delta N_{CS}$ with anomaly-mediated baryon update. Therefore all three quantities are the same index data with different projections. ∎

## Y.5 CP-Violating Source from Berry Holonomy

### Y.5.1 The Predictive Flavor Bundle

**Definition Y.5** (Predictive Flavor Bundle). *Over the electroweak vacuum manifold $\mathcal{M}_{EW}$, the predictive flavor bundle $\mathcal{E} \to \mathcal{M}_{EW}$ has fiber at each point carrying the generation structure inherited from the $E_8$ embedding (Appendix R).*

The Berry connection on this bundle is:
$$\mathcal{A} = i\sum_{\alpha,\beta} \bar{z}_{\alpha\beta}\, dz_{\alpha\beta} \tag{Y.5}$$

where $z_{\alpha\beta}$ are local coordinates on $\text{Gr}(2,8)$ (Lemma T.53.1). The Berry curvature is the Kähler form:
$$\mathcal{F} = d\mathcal{A} = i\sum_{\alpha,\beta} dz_{\alpha\beta} \wedge d\bar{z}_{\alpha\beta} = \omega_{KE} \tag{Y.6}$$

### Y.5.2 Holonomy as Geometric CP Violation

**Theorem Y.6** (CP Source from Holonomy). *The Berry-Simon holonomy over a minimal update cycle surface $\Sigma$ provides a gauge-invariant CP-violating source:*

$$\gamma = \oint_{\gamma} \mathcal{A} = \int_{\Sigma} \mathcal{F} \tag{Y.7}$$

For the flavor-changing loop $\gamma: u_3 \to d_3 \to d_2 \to u_2 \to u_3$, the holonomy is computed in Theorem T.56 from the $E_8$ sector mismatch:
$$\delta = 2\arctan\left(\frac{\sqrt{2}}{2}\right) \times \text{sinc}\left(\frac{1}{\sqrt{3}}\right) = 70.53° \times 0.9454 = 66.7°$$

The CP-violating phase entering the master formula is:
$$\sin\delta = \sin(66.7°) = 0.918 \tag{Y.8}$$

### Y.5.3 CP-Odd Effective Action

**Theorem Y.6.1** (CP-Odd Effective Action from Berry Holonomy on the Unit Berry-Topological Response Branch). *Fix the flavor loop $\gamma$ on $\mathrm{Gr}(2,8)$ used in Theorem T.56, and let $\delta=\oint_\gamma\mathcal A=\int_\Sigma\mathcal F$ be its gauge-invariant holonomy angle. Any local CP-odd contribution of this sector to the four-dimensional electroweak effective action has the form*
$$
\Delta S_{CP}=\frac{\chi_{CP}\,f(\delta)}{16\pi^2}\int d^4x\,W^a_{\mu\nu}\tilde W^{a\mu\nu},
$$
*where $f$ is an odd $2\pi$-periodic scalar function and $\chi_{CP}$ is the dimensionless EFT matching coefficient connecting the flavor-space Berry holonomy to the four-dimensional electroweak topological density. In the single-harmonic truncation used for the rate estimate below, $f(\delta)=\sin\delta$. The Appendix Y canonical baryogenesis branch takes $\chi_{CP}=1$. A theorem-level value of $\chi_{CP}$ is supplied only by an accepted APS-eta transport certificate of Definition Y.6.1a and Theorem Y.6.1b; otherwise the rate-bias saturation analysis of Step 6 below depends on $\chi_{CP}$ through $\mathcal F_{CP}=\tanh(\chi_{CP}\,\mathcal S\sin\delta)$.*


*Proof.* 

**Step 1 (Holonomy is the scalar input).** The Berry curvature $\mathcal{F} = d\mathcal{A} + \mathcal{A}\wedge\mathcal{A}$ is a 2-form on the generation manifold $\text{Gr}(2,8)$, so it cannot itself appear as a scalar coefficient in a four-dimensional spacetime action. For a fixed flavor loop $\gamma$, the gauge-invariant scalar associated with the Berry sector is instead the holonomy angle
$$
\delta = \oint_\gamma \mathcal{A} = \int_\Sigma \mathcal{F},
$$
by Stokes' theorem and Theorem T.56.

**Step 2 (Allowed local CP-odd operator on the unit-response branch).** In four spacetime dimensions, the lowest-order local gauge-invariant CP-odd operator built from the $SU(2)_L$ field strength is $W^a_{\mu\nu}\tilde W^{a\mu\nu}$. Symmetry therefore restricts any local CP-odd coupling induced by the Berry-holonomy sector to the scalar form
$$
\Delta S_{CP} = \frac{\chi_{CP}\, f(\delta)}{16\pi^2}\int d^4x\,W^a_{\mu\nu}\tilde W^{a\mu\nu}
$$
for some scalar function $f$ and dimensionless EFT matching coefficient $\chi_{CP}$. Symmetry alone fixes the operator but not the coefficient; matching the PU flavor-Berry sector onto the four-dimensional electroweak EFT is required to fix $\chi_{CP}$. The Appendix Y canonical baryogenesis branch sets $\chi_{CP} = 1$ and is propagated through the rest of the proof; alternative values would rescale the saturation argument $\mathcal{S} \sin\delta \to \chi_{CP}\, \mathcal{S} \sin\delta$, with $\chi_{CP} \ll 1$ moving $\mathcal{F}_{CP}$ out of saturation and shifting $\eta_B$ accordingly.


**Step 3 (Parity and periodicity).** Because $\delta$ is an angle, $f$ must be $2\pi$-periodic. Because $W\tilde W$ is CP-odd, $f$ must be odd: $f(-\delta)=-f(\delta)$. The single-harmonic truncation keeps the leading odd periodic term and sets
$$
f(\delta)=\sin\delta.
$$

**Step 4 (Unit topological transition).** With this truncation on the unit Berry-topological response branch,
$$
\Delta S_{CP}=\frac{\sin\delta}{16\pi^2}\int d^4x\,W\tilde W.
$$
Using the Chern-Simons identity (Y.3),
$$
\int d^4x\,W\tilde W = \frac{32\pi^2}{g^2}\,\Delta N_{CS},
$$
so for $\Delta N_{CS}=\pm 1$,
$$
\Delta S_{CP}(\pm)=\pm\frac{2\sin\delta}{g^2}
=\pm\sin\delta\frac{S_{sph}}{8\pi^2},
$$
since $S_{sph}=16\pi^2/g^2$.

**Step 5 (Rate asymmetry).** The CP-odd action shift modifies the forward and backward sphaleron rates to
$$
\Gamma_{\text{sph}}^{(\pm)} = \Gamma_{\text{sph}}^{(0)} \exp\left(\pm \frac{\sin\delta \cdot S_{\text{sph}}}{8\pi^2}\right) = \Gamma_{\text{sph}}^{(0)} \exp\left(\pm \mathcal{S} \sin\delta\right),
$$
where $\mathcal{S}=S_{sph}/(8\pi^2)$. Therefore
$$
\frac{\Gamma^{(+)} - \Gamma^{(-)}}{\Gamma^{(+)} + \Gamma^{(-)}} = \tanh(\mathcal{S} \cdot \sin\delta) \tag{Y.9}
$$

**Step 6 (Numerical evaluation).** With $\mathcal{S} = 4.77$ and $\sin\delta = 0.918$:
$$
\mathcal{S} \cdot \sin\delta = 4.77 \times 0.918 = 4.37886 \approx 4.38
$$
and therefore
$$
\tanh(4.37886) = 0.999686\ldots \approx 0.9997.
$$
This is the saturation regime. ∎

**Proposition Y.7** (Saturated CP Asymmetry in the Single-Harmonic Truncation). *Under the single-harmonic choice $f(\delta)=\sin\delta$, when $\mathcal{S} \cdot \sin\delta \gg 1$, the sphaleron asymmetry saturates:*
$$\mathcal{F}_{CP} \equiv \frac{\Gamma^{(+)} - \Gamma^{(-)}}{\Gamma^{(+)} + \Gamma^{(-)}} = \tanh(\mathcal{S} \sin\delta) \to 1$$

*In this regime, the baryon asymmetry is controlled by the efficiency of converting the near-maximal CP asymmetry into net baryon number, not by small variations of the phase itself.*

### Y.5.4 Comparison with Spontaneous Baryogenesis

The PU mechanism has structural similarities to spontaneous baryogenesis [Cohen & Kaplan 1987, 1988]. 

**Spontaneous Baryogenesis (Cohen-Kaplan):**

A time-dependent scalar field $\phi(t)$ couples to the baryon current:
$$\mathcal{L}_{int} = \frac{\partial_\mu \phi}{M} J_B^\mu$$

This induces an effective chemical potential:
$$\mu_B = \frac{\dot{\phi}}{M}$$

The baryon asymmetry generated is:
$$\eta_B^{CK} \propto \frac{\dot{\phi}}{M T} \cdot \frac{\Gamma_{sph}}{H}$$

**PU Baryogenesis:**

The Berry phase $\gamma$ on the generation manifold couples to the Chern-Simons current:
$$\mathcal{L}_{int} = \frac{\gamma}{16\pi^2} W_{\mu\nu}\tilde{W}^{\mu\nu}$$

This induces an effective theta-angle:
$$\theta_{eff} = \gamma = \oint \mathcal{A}$$

The baryon asymmetry generated is:
$$\eta_B^{PU} \propto \Big(\frac{S_{sph}}{8\pi^2}\Big)\tanh\left(\theta_{eff}\frac{S_{sph}}{8\pi^2}\right)e^{-\kappa_B}$$

**Structural Correspondence:**

| Spontaneous (CK) | PU Baryogenesis | Role |
|:-----------------|:----------------|:-----|
| Scalar field $\phi$ | Berry phase $\gamma$ | CP-odd source |
| $\dot{\phi}/M$ | $\sin\delta$ | CP violation magnitude |
| Expansion $H$ | $e^{-\kappa_B}$ | Out-of-equilibrium factor |
| $\Gamma_{sph}/H$ | $\tanh(\mathcal{S}\sin\delta)$ | Sphaleron efficiency |

**Key Differences:**

1. **Origin of CP-odd field:** In Cohen-Kaplan, the scalar $\phi$ is postulated with an ad hoc coupling. In PU, the Berry phase emerges from the derived generation manifold structure.

2. **Time dependence:** Cohen-Kaplan requires explicit $\dot{\phi}(t)$ during a phase transition. PU encodes time dependence implicitly in the cosmological evolution of the predictive state.

3. **Suppression mechanism:** Cohen-Kaplan uses the expansion rate $H$ for departure from equilibrium. PU uses configuration space complexity $\kappa_B$.

4. **Saturation:** Cohen-Kaplan is linear in $\dot{\phi}/M$ (perturbative regime). PU saturates via $\tanh(\mathcal{S}\sin\delta) \to 1$ (non-perturbative regime).

**Theorem Y.7.1** (PU as Geometric Spontaneous Baryogenesis). *The PU baryogenesis mechanism is the geometric realization of spontaneous baryogenesis, where the scalar field $\phi$ is replaced by the Berry phase $\gamma$, the coupling $1/M$ is replaced by $1/(16\pi^2)$, and the cosmological dynamics is encoded in $e^{-\kappa_B}$.*

---

## Y.6 Baryogenesis Complexity from Configuration Space

### Y.6.1 The Complexity Principle

The PU framework exhibits a universal pattern: physical quantities involving vacuum selection or symmetry breaking are exponentially suppressed by configuration space complexity:

$$\mathcal{O} = A \cdot e^{-\kappa} \tag{Y.10}$$

where $\kappa$ counts the effective dimensionality of the relevant configuration space and $A$ is an $O(1)$ prefactor.

| Quantity | Complexity | Configuration Space | Suppression | Result |
|:---------|:----------:|:--------------------|:-----------:|:-------|
| $\Lambda L_P^2$ | $\kappa_{\mathrm{ref}} = 141.5$ on the Appendix U five-mode reference branch | $\text{Gr}(12, 24)$ | $e^{-2\kappa}$ on that branch | $\sim 10^{-122}$ |
| $v/M_{Pl}$ | $\kappa_{EW} = 38.5$ | $(SU(2) \times U(1))/U(1)$ | $e^{-\kappa}$ | $\sim 10^{-17}$ |
| $\eta_B$ | $\kappa_B = 19.48$ | CP-odd sphaleron moduli | $e^{-\kappa}$ | $\sim 10^{-9}$ |

### Y.6.2 Derivation of Baryogenesis Complexity

**Theorem Y.8** (Baryogenesis Complexity). *Assume that:*
1. *the CP half-step law of Theorem Y.11.2 holds for the relevant electroweak saddle sector, so $\kappa_{CP}=\kappa_{EW}/2$; and*
2. *to leading exponential order, the baryogenesis measure factorizes into independent CP-odd gauge and generation-coherence sectors, so the corresponding suppression factors multiply and the exponents add.*

*Then the baryogenesis complexity is:*

$$\boxed{\kappa_B = \kappa_{CP} + \kappa_{gen} = 19.25 + 0.23 = 19.48} \tag{Y.11}$$

*Proof.*

**Step 1: Electroweak Base Complexity.** Baryogenesis occurs via sphaleron transitions during the electroweak epoch. The underlying gauge-Higgs configuration space inherits the electroweak complexity $\kappa_{EW} = 38.5$ (Theorem T.5).

**Step 2: CP-Odd Projection via Symplectic Structure.**

**Lemma Y.8.1** (CP-Odd Complexity via Orientation Reversal). *The baryogenesis complexity arises from the orientation structure of the electroweak configuration space.*

*Proof of Lemma.*

**(a) Contact structure and Haar measure.** The electroweak configuration space $\mathcal{M}_{EW} \cong S^3 \cong SU(2)$ is a compact, orientable 3-manifold. As a Lie group, $SU(2)$ carries a bi-invariant Haar measure $\mu_H$ and a canonical volume form $\Omega_3$. The Kähler structure on the ambient $\mathbb{C}^2$ induces the standard contact structure on $S^3$: the restriction of the ambient Liouville 1-form defines a contact form $\eta$ with $\eta \wedge d\eta$ proportional to $\Omega_3$. In particular, $S^3$ is odd-dimensional and cannot carry a symplectic 2-form; the relevant structure for CP projection is the orientation of $\Omega_3$, not a symplectic pairing.

**(b) CP action on configuration space.** Under the identification $S^3 \cong SU(2)$, CP acts by the $\mathbb{Z}_2$ involution $U \mapsto U^{-1}$ (equivalently quaternionic conjugation on unit quaternions), which reverses orientation:
$$\mathsf{CP}^* \Omega_3 = -\Omega_3$$
This is the correct mathematical characterization—CP reverses the orientation of the $SU(2)$ group manifold. (The differential of inversion at the identity is $-I$ on $\mathfrak{su}(2)$, so $\det(d\,\mathsf{CP}) = (-1)^3 = -1$.)

**(c) Haar measure.** The path integral measure $\mathcal{D}A \, e^{-S}$ transforms under CP as:
$$\mathcal{D}(\mathsf{CP} \cdot A) = |\det(\mathsf{CP}^*)| \, \mathcal{D}A = \mathcal{D}A$$
The Haar measure is CP-invariant (since $|\det| = 1$), but the integrand splits into CP-even and CP-odd components under the $\mathbb{Z}_2$ grading induced by the orientation reversal.

**(d) CP-odd projection.** Net baryon number is CP-odd and is controlled by the CP-odd effective action shift (Theorem Y.6.1), which is proportional to the Chern-Simons change. For a unit transition $\Delta N_{CS}=\pm 1$,
$$\Delta S_{CP}(\pm)=\frac{\sin\delta}{16\pi^2}\int d^4x\,W\tilde W
=\pm\frac{2\sin\delta}{g^2}
=\pm\sin\delta\frac{S_{sph}}{8\pi^2}.$$

**(e) Complexity cost.** In PU the CP operation is the $\mathbb{Z}_2$ half-step channel whose square reproduces the full electroweak locking step (Theorem Y.11.2). Since PCE costs add under sequential composition, the corresponding suppression exponents add: $\kappa(\mathcal{C}^2)=2\kappa(\mathcal{C})$. The electroweak hierarchy involves the full step with exponent $\kappa_{EW}$, while baryogenesis depends on the single CP half-step, giving $\kappa_{CP}=\kappa_{EW}/2$.
$$\kappa_{CP} = \frac{\kappa_{EW}}{2} = \frac{38.5}{2} = 19.25$$

∎

**Step 3: Generational Coherence Correction.**

**Lemma Y.8.2** (Generational Cost Distribution on the democratic single-verification branch). *Assume the generation-coherence sector incurs a single Landauer/SPAP verification cost $\varepsilon$ for the full coherent process, and assume the democratic single-verification branch rule assigning equal share $1/N_g$ of that cost to each coherently participating generation path. Then*
$$\kappa_{gen} = \frac{\varepsilon_0}{N_g} = \frac{\ln 2}{3} = 0.231.$$


*Proof of Lemma.*

**(a) Information-theoretic setup.** The CKM matrix $V$ encodes flavor mixing across $N_g = 3$ generations. CP violation requires the Jarlskog invariant:
$$J_{CP} = \text{Im}(V_{us}V_{cb}V_{ub}^*V_{cs}^*) \neq 0$$
This is non-zero only if $N_g \geq 3$ (Theorem R.3.4).

**(b) Coherent superposition.** The generation state during a flavor-changing process is:
$$|\psi_{gen}\rangle = \sum_{g=1}^{N_g} c_g |g\rangle$$
where $\sum_g |c_g|^2 = 1$. The CP-violating phase $\delta$ arises from the coherent interference of all three generation paths (Berry holonomy on Gr(2,8)).

**(c) Information content.** The information required to specify which generation participates in a given interaction is:
$$I_{gen} = -\sum_g |c_g|^2 \log |c_g|^2$$
For the democratic distribution $|c_g|^2 = 1/N_g$ (maximum entropy, PCE-favored):
$$I_{gen} = \log N_g = \log 3 \text{ nats}$$

**(d) SPAP verification cost on the democratic single-verification branch.** The SPAP cycle (Theorem 10) requires verifying the prediction outcome. For baryogenesis, this verification resolves a single binary question: did the net baryon asymmetry have positive or negative sign? The CP-odd/even distinction is encoded in $\kappa_{CP}$ via the $\mathbb{Z}_2$ orientation projection on $SU(2)$.

Total cost: $\varepsilon$. On the democratic single-verification branch, the branch rule assigns equal share $1/N_g$ of that cost to each coherently participating generation path:
$$\kappa_{gen} = \frac{\varepsilon_0}{N_g} = \frac{\ln 2}{3} = 0.231.$$
The democratic amplitude distribution $|c_g|^2 = 1/N_g$ from subpart (c) supplies the amplitude profile consistent with this branch rule; the branch rule itself is the assignment of total verification cost to per-generation cost shares and is not uniquely fixed by the amplitude distribution alone.


**(e) Democratic amplitude distribution and branch cost-sharing rule.** The democratic amplitude distribution $|c_g|^2 = 1/N_g$ follows from:
- PCE optimization: Maximum entropy distribution minimizes description length
- $S_{N_g}$ symmetry: Generation manifold has permutation symmetry up to relabeling of the three family-charge sectors (Theorem R.3.4)
- CKM unitarity: $\sum_g |V_{ig}|^2 = 1$ enforces normalization

These ingredients fix the amplitude profile $|c_g|^2 = 1/N_g$. The additional branch rule assigning a single-verification total cost $\varepsilon$ democratically to the $N_g$ coherent paths, giving $\kappa_{gen} = \varepsilon_0/N_g$, is the democratic single-verification branch introduced in the statement of this lemma. Alternative cost-sharing rules compatible with the same amplitude distribution (e.g. a total cost $\varepsilon$ without per-path division, or a weighted rule summing squared amplitudes) would define distinct branches with different numerical $\kappa_{gen}$.

The single-verification form ($\varepsilon_0/N_g$ rather than $2\varepsilon_0/N_g$) follows because the CP-sector selection is accounted for in $\kappa_{CP} = \kappa_{EW}/2$.



**Remark Y.8.2.1 (Branch Dependence of the Sharing Rule).** The numerical value $\kappa_{gen} = 0.231$ depends on the democratic single-verification cost-sharing rule of Lemma Y.8.2. The named supporting ingredients (maximum-entropy amplitude distribution, $S_{N_g}$ permutation symmetry, CKM unitarity) fix the amplitude profile $|c_g|^2 = 1/N_g$ but do not uniquely determine how the total Landauer/SPAP verification cost partitions across coherently participating generation paths. A change of the sharing rule from $\varepsilon_0/N_g$ to $\chi \varepsilon_0/N_g$ for a dimensionless branch factor $\chi > 0$ propagates to the baryon-to-photon ratio as $\eta_B(\chi) = \eta_B(1) \exp[-(\chi-1)\varepsilon_0/N_g]$, giving approximately a 21% shift per unit change in $\chi$ at the minimal branch values $\varepsilon_0=\ln2$, $N_g = 3$.


∎

**Step 4: Leading-Exponential Factorization.** By the factorization hypothesis in the theorem statement, the baryogenesis measure separates at leading exponential order into a CP-odd gauge contribution and a generation-coherence contribution:
$$
d\mu_B = d\mu_{CP}\, d\mu_{gen}\,(1+o(1)).
$$
Hence the suppression factors multiply:
$$
e^{-\kappa_B} = e^{-\kappa_{CP}} e^{-\kappa_{gen}},
$$
and therefore the exponents add:
$$
\kappa_B = \kappa_{CP} + \kappa_{gen}.
$$

**Step 5: Total Complexity.**
$$
\kappa_B = \kappa_{CP} + \kappa_{gen} = 19.25 + 0.23 = 19.48.
$$

The value $\kappa_{gen} = 0.23$ corresponds to single verification ($\varepsilon_0/N_g$), consistent with the CP-odd projection already captured in $\kappa_{CP}$.

∎

**Corollary Y.8.3** (Sensitivity to Generation Number). *If $N_g \neq 3$:*
- *$N_g = 2$: $J_{CP} = 0$ identically, no CP violation, no baryogenesis*
- *$N_g = 4$: $\kappa_{gen} = \ln 2/4 = 0.173$, $c_{sph} = 36/101 = 0.356$, $\mathcal{C}_{eff} = 0.212$, giving $\kappa_B = 19.42$, predicting $\eta_B = 4.9 \times 10^{-10}$*

*The three-generation structure is thus independently testable through the $\eta_B$ prediction.*

### Y.6.3 Structure Summary

| Component | Value | Physical Origin |
|:----------|:-----:|:----------------|
| $\kappa_{EW}/2$ | 19.25 | CP-odd projection via $\mathbb{Z}_2$ orientation reversal on $SU(2)$ |
| $\varepsilon_0/N_g$ | 0.23 | Landauer cost distributed over 3 generations on the democratic single-verification branch |

| $\kappa_B$ | 19.48 | Total baryogenesis complexity |

---

## Y.7 Master Formula and Numerical Derivation

### Y.7.1 The Baryogenesis Master Formula

**Definition Y.6.1a (APS-Eta Baryon Transport Certificate).** An APS-eta baryon transport certificate is a finite record
$$
\mathfrak A_\eta=\left(W_{\mathrm{EW}},A_{SU(2)\times U(1)},\Gamma_{\mathrm{fl}},\mathcal L_{\mathrm{Berry}},D_W,\eta_{\partial W},h_{\partial W},\mathfrak o_{\mathrm{KMS}},I_{CP},I_{tr}\right)
\tag{Y.6.1a.1}
$$
where:

1. $W_{\mathrm{EW}}$ is a compact oriented four-dimensional Euclidean electroweak interpolation manifold with APS boundary $\partial W_{\mathrm{EW}}=\Sigma_i\cup\Sigma_f$, connecting the initial and final electroweak Cauchy configurations used in Theorem Y.4;

2. $A_{SU(2)\times U(1)}$ is the electroweak connection on $W_{\mathrm{EW}}$ extending the boundary configurations on $\Sigma_i\cup\Sigma_f$;

3. $\Gamma_{\mathrm{fl}}:W_{\mathrm{EW}}\to\mathrm{Gr}(2,8)$ is a smooth branch map pulling the flavor Berry line bundle $\mathcal L_{\mathrm{Berry}}$ from the generation manifold to the cobordism, with restriction $\Gamma_{\mathrm{fl}}|_{\Sigma_f}\circ(\Gamma_{\mathrm{fl}}|_{\Sigma_i})^{-1}$ tracing the flavor loop $\gamma$ of Theorem T.56;

4. $D_W$ is the chiral SM Dirac operator on $W_{\mathrm{EW}}$ twisted by $A_{SU(2)\times U(1)}$ and by $\Gamma_{\mathrm{fl}}^*\mathcal L_{\mathrm{Berry}}$, with Atiyah–Patodi–Singer boundary conditions on $\partial W_{\mathrm{EW}}=\Sigma_i\cup\Sigma_f$ rendering the boundary problem Fredholm;

5. $\eta_{\partial W}=\eta(D_{\Sigma_f})-\eta(D_{\Sigma_i})$ is the oriented boundary eta-invariant difference, and $h_{\partial W}=\dim\ker D_{\Sigma_f}-\dim\ker D_{\Sigma_i}$ is the corresponding oriented APS boundary-kernel correction; on branches with no boundary zero modes, $h_{\partial W}=0$;

6. $\mathfrak o_{\mathrm{KMS}}\in\{+1,-1\}$ is the chosen PCE/KMS time orientation of the determinant line of $D_W$, fixed by the Appendix O thermodynamic ratchet;

7. the Berry-to-topological-density matching index is
$$
I_{CP}=\frac{1}{\Delta N_{CS}}\!\int_{W_{\mathrm{EW}}}\!\hat A(R)\operatorname{ch}\!\left(\Gamma_{\mathrm{fl}}^*F_{\mathcal L_{\mathrm{Berry}}}\right)\!\big|_{[4]}\!-\!\frac{\eta_{\partial W}+h_{\partial W}}{2\Delta N_{CS}},
\tag{Y.6.1a.2}
$$
where $[4]$ denotes the $4$-form component on $W_{\mathrm{EW}}$, normalized by the topological Chern-Simons charge $\Delta N_{CS}$ of the interpolation;

8. the baryon-number transport index is
$$
I_{tr}=\frac{\operatorname{SF}(D_W)_B}{N_g\Delta N_{CS}},
\tag{Y.6.1a.3}
$$
where $\operatorname{SF}(D_W)_B$ is the baryon-number weighted spectral flow of the family of spatial Dirac operators along the cobordism, normalized by the standard $N_g\Delta N_{CS}$ denominator of Theorem Y.4.

The certificate is accepted only when (1)–(6) hold, the APS index theorem applies to (7), and the spectral flow in (8) is well-defined. The two index outputs $I_{CP}$ and $I_{tr}$ are dimensionless branch numbers determined by the certificate data and fixed before comparison with the observed $\eta_B$. The transport index $I_{tr}$ is rational when the spectral-flow numerator and $N_g\Delta N_{CS}$ denominator are integral; the APS-eta contribution to $I_{CP}$ is a real spectral invariant unless the accepted branch supplies an additional rationality theorem for the eta difference.

**Theorem Y.6.1b (APS-Eta Transport Gate).** On a baryogenesis branch carrying an accepted APS-eta certificate $\mathfrak A_\eta$ of Definition Y.6.1a, the EFT matching coefficient of Theorem Y.6.1 and the transport coefficient of Proposition Y.9.1 are determined by the index outputs:
$$
\chi_{CP}=I_{CP},\qquad\chi_{tr}=I_{tr}.
\tag{Y.6.1b.1}
$$
The canonical unit-response Appendix Y branch is theorem-level exactly when
$$
I_{CP}=1,\qquad I_{tr}=1,\qquad\mathfrak o_{\mathrm{KMS}}\cdot\operatorname{or}(W_{\mathrm{EW}})\cdot\operatorname{or}(\mathcal L_{\mathrm{Berry}})=+1.
\tag{Y.6.1b.2}
$$
If the accepted certificate yields different index outputs, those values replace the unit branch coefficients in the master formula of Theorem Y.9.

*Proof.* By Definition Y.6.1a (1)–(4), $D_W$ is a Fredholm chiral Dirac operator with APS boundary conditions on the compact oriented four-dimensional interpolation manifold $W_{\mathrm{EW}}$, twisted by both the electroweak gauge connection and the pulled-back flavor Berry bundle $\Gamma_{\mathrm{fl}}^*\mathcal L_{\mathrm{Berry}}$. The Atiyah–Patodi–Singer index theorem then expresses the bulk-plus-boundary index
$$
\operatorname{Ind}_{\mathrm{APS}}(D_W)=\int_{W_{\mathrm{EW}}}\hat A(R)\operatorname{ch}(F)\big|_{[4]}-\frac{\eta_{\partial W}+h_{\partial W}}{2}
$$
with the standard oriented boundary-kernel correction $h_{\partial W}$ included when it is nonzero. Restricting to the flavor-Berry component of the Chern character — which by standard anomaly descent descends to the four-dimensional EFT operator $W^a_{\mu\nu}\tilde W^{a\mu\nu}$ via standard Stora–Zumino descent — gives the Berry-twisted contribution to the topological-density coefficient. Normalizing this contribution by the gauge topological charge $\Delta N_{CS}$ of the cobordism yields (Y.6.1a.2). By the inflow construction, the EFT matching coefficient $\chi_{CP}$ in Theorem Y.6.1 equals this normalized index, hence $\chi_{CP}=I_{CP}$.

The baryon-number anomaly $\partial_\mu J^\mu_{B+L}=2N_g\partial_\mu K^\mu/(g^2/16\pi^2)$ of Theorem Y.4 expresses the integrated $B+L$ change as $2N_g\Delta N_{CS}$ on the cobordism. By the APS-spectral flow correspondence (Atiyah–Patodi–Singer Part III), the chiral spectral flow of the family $\{D_{\Sigma_t}\}_{t\in[0,1]}$ of spatial Dirac operators along $W_{\mathrm{EW}}$ equals $\operatorname{Ind}_{\mathrm{APS}}(D_W)$. The baryon-number-weighted projection of this spectral flow, divided by $N_g\Delta N_{CS}$, gives (Y.6.1a.3). The transport coefficient $\chi_{tr}$ multiplying the sphaleron product structure in Proposition Y.9.1 records exactly this normalized spectral flow on the canonical branch, hence $\chi_{tr}=I_{tr}$.

The sign of the determinant-line contribution to the baryon yield is the product of three orientation signs: the cobordism orientation $\operatorname{or}(W_{\mathrm{EW}})$, the Berry-line orientation $\operatorname{or}(\mathcal L_{\mathrm{Berry}})$, and the KMS time orientation $\mathfrak o_{\mathrm{KMS}}$. The canonical unit branch of Theorem Y.10 (matter dominance, $\eta_B>0$) requires this orientation product to be $+1$ together with $I_{CP}=I_{tr}=1$; condition (Y.6.1b.2) makes that requirement explicit. If the accepted certificate produces different rational outputs $I_{CP}$, $I_{tr}$, the same APS calculation supplies replacement coefficients via (Y.6.1b.1), and the orientation product determines the sign of $\eta_B$ via Theorem Y.10. ∎

**Theorem Y.9** (Master Formula). *The baryon-to-photon ratio is:*

$$\boxed{\eta_B = \mathcal{C}_{eff} \cdot \mathcal{F}_{CP} \cdot f_{wash} \cdot e^{-\kappa_B}} \tag{Y.12}$$

*where:*
- $\mathcal{C}_{eff}$ = efficiency coefficient (derived below)
- $\mathcal{F}_{CP} = \tanh(\mathcal{S}\sin\delta)$ = CP-violating factor
- $f_{wash}$ = washout survival factor
- $e^{-\kappa_B}$ = complexity suppression

### Y.7.2 Derivation of Efficiency Coefficient

**Proposition Y.9.1** (Efficiency Coefficient on the Sphaleron-Transport Branch). *On the Appendix Y sphaleron-transport branch — under which the Boltzmann/transport solution for sphaleron-mediated baryogenesis with the PU CP source factorizes as a product of (a) the standard chemical-equilibrium $c_{sph}$ factor, (b) the $1/(2N_g)$ B+L-to-B normalization, (c) the sphaleron enhancement $\mathcal{S}$, and (d) the departure-from-equilibrium factor $f_{neq}$ — the effective coefficient is modeled as:*

$$\mathcal{C}_{eff} = \chi_{tr}\cdot \frac{c_{sph}}{2N_g} \cdot \mathcal{S} \cdot f_{neq} \tag{Y.13}$$

*where $\chi_{tr}$ is a dimensionless transport coefficient set to $\chi_{tr}=1$ on the canonical Appendix Y branch, or fixed by $\chi_{tr}=I_{tr}$ when an APS-eta transport certificate is accepted (Definition Y.6.1a, Theorem Y.6.1b), and:*
- $c_{sph} = 28/79 \approx 0.354$ — sphaleron-to-baryon conversion factor [Khlebnikov & Shaposhnikov 1988]
- $N_g = 3$ — number of generations
- $\mathcal{S} = 1/(2\pi\alpha_W) \approx 4.77$ — sphaleron enhancement factor
- $f_{neq} \approx 1$ — departure from equilibrium factor at EW crossover

*A theorem-level value of $\chi_{tr}$ requires either solving the electroweak transport equations with the PU CP source (Theorem Y.6.1 with $\chi_{CP}$ on its branch) and freeze-out profile, and reducing the resulting baryon yield to the displayed product structure, or supplying the APS-eta transport certificate of Definition Y.6.1a; in the latter case Theorem Y.6.1b gives $\chi_{tr}=I_{tr}$. $\eta_B$ is linear in $\mathcal C_{eff}$, so an $O(1)$ deviation from $\chi_{tr}=1$ propagates linearly into the prediction and exceeds the within-branch $9\%$ uncertainty.*


*Proof.* 

**Step 1 (Anomaly conversion).** Each sphaleron transition changes $B + L$ by $2N_g$ units (Theorem Y.4). The conversion to net baryon number depends on the chemical equilibrium relations among SM species.

**Step 2 (Sphaleron conversion factor).** The sphaleron-to-baryon conversion efficiency arises from chemical equilibrium relations during sphaleron freeze-out [Khlebnikov & Shaposhnikov 1988]. For $N_g$ generations and $n_H$ Higgs doublets:
$$c_{sph} = \frac{8N_g + 4n_H}{22N_g + 13n_H}$$
With $N_g = 3$ (Theorem R.3.4) and $n_H = 1$:
$$c_{sph} = \frac{8 \times 3 + 4 \times 1}{22 \times 3 + 13 \times 1} = \frac{28}{79} \approx 0.354$$
This is not a free parameter but a calculable consequence of the derived Standard Model content.

**Step 3 (Enhancement from saturation).** The sphaleron enhancement factor $\mathcal{S} = 4.77$ enters because the CP asymmetry in rates (Eq. Y.9) is amplified by the large sphaleron action.

**Step 4 (Combination).** The net efficiency combines these factors:
$$\mathcal{C}_{eff} = \frac{c_{sph}}{2N_g} \times \mathcal{S} \times f_{neq} = \frac{0.354}{6} \times 4.77 \times 1.0 = 0.282$$

∎

### Y.7.3 Washout Correction

**Proposition Y.9.2** (Washout Factor). *Sphaleron processes remain active after the CP-violating source diminishes, partially washing out the asymmetry:*
$$f_{wash} = \exp\left(-\int_{T_{EW}}^{T_{fo}} \frac{\Gamma_{sph}(T)}{H(T)} \frac{dT}{T}\right) \approx 0.63 \tag{Y.14}$$

*where $T_{EW} \sim 160$ GeV is the electroweak crossover temperature and $T_{fo} \sim 130$ GeV is the sphaleron freeze-out temperature.*

The washout integral depends on the ratio of sphaleron rate to Hubble rate during the crossover epoch. Lattice determinations [D'Onofrio et al. 2014] combined with standard cosmological expansion give $f_{wash} \approx 0.63 \pm 0.05$.

### Y.7.4 Validation-Run Electroweak Coupling

**Lemma Y.9.3** (Validation-Run Electroweak Coupling). *The SU(2)$_L$ coupling $\alpha_W$ at the sphaleron temperature $T_{sph} \approx 160$ GeV is evaluated from:*
$$\alpha_W = \frac{\alpha_{em}}{\sin^2\theta_W}$$

*Proof.*

**Step 1 (Fine structure constant).** From Appendix Z, Theorem Z.26, the Thomson-limit fine structure constant is derived from capacity saturation on the PCE-Attractor with interface corrections:
$$
\alpha_{em}^{-1}(\text{Thomson}) = 137.036092 \pm 0.000060
$$
where the quoted $1\sigma$ uncertainty is the combined Appendix Z, Section Z.27.9 theory budget, dominated by subgroup-projection/matching systematics rather than by truncation.

**Step 2 (QED running).** Standard QED running from $q^2 = 0$ to the sphaleron scale $T_{sph} \approx 160$ GeV gives:
$$\alpha_{em}^{-1}(T_{sph}) \approx 127.5$$

**Step 3 (Weinberg angle).** From Appendix T, Theorem T.14, the PU-normalized tree-level Weinberg angle is $\sin^2\theta_W^{(0)} = 3/8$. Using the Appendix T validation tuple of Theorem T.18, namely $(\Delta_1,\Delta_2)=(15.14,20.94)$ and $(Z_1,Z_2)=\left(1+\frac{15.14}{24},\,1+\frac{20.94}{24}\right)$, the corresponding validation-run boundary value at $\mu_G$ is $\sin^2\theta_W(\mu_G) = 3Z_2/(3Z_2 + 5Z_1) \approx 0.408$. Theorem T.78.5 proves that this tuple is not a theorem-level output of the current canonical ledger, because no PU-internal global spectral branch package supplies it. One-loop SM RG running to the sphaleron scale gives:
$$\sin^2\theta_W(T_{sph}) \approx 0.234$$

**Step 4 (Combination).** By definition of the Weinberg angle:
$$\alpha_W = \frac{\alpha_{em}}{\sin^2\theta_W} = \frac{1/127.5}{0.234} \approx \frac{1}{29.8} \approx \frac{1}{30}$$

This numerical evaluation is validation-level because it depends on the Appendix T validation tuple together with the standard one-loop RG running used above; by Theorem T.78.5 it is not promoted to a theorem-level PU input in the canonical minimal ledger. A theorem-level input would require an appended global spectral branch extension fixed before comparison and evaluated forward. ∎

### Y.7.5 Complete Numerical Calculation

**Input Parameters and Validation-Run Inputs:**

| Parameter | Value | Source |
|:----------|:------|:-------|
| $K_0$ | 3 | Definition (Horizon Constant) |
| $d_0 = 2^{K_0}$ | 8 | Theorem 23 |
| $(a, b)$ | $(2, 6)$ | Definition 15a |
| $M = 2ab$ | 24 | Theorem Z.5 |
| $k = M/2$ | 12 | Golay code dimension |
| $\kappa_{EW}$ | 38.5 | Theorem T.5 |
| $\varepsilon$ | $\ln 2 = 0.6931$ | Theorem 31 |
| $N_g$ | 3 | Theorem R.3.4 |
| $\delta$ | $66.7°$ | Theorem T.56 |
| $\alpha_{em}^{-1}$(Thomson) | $137.036092 \pm 0.000060$ | Theorem Z.26 |
| $\sin^2\theta_W^{(0)}$ | $3/8$ | Gauge normalization (Theorem T.14) |
| $\alpha_W$ | $\approx 1/30$ | Validation-run value from $\alpha_{em}/\sin^2\theta_W(T_{sph})$ using the Appendix T threshold tuple; status governed by Theorem T.78.5 |
| $c_{sph}$ | $28/79 = 0.354$ | $(8N_g + 4n_H)/(22N_g + 13n_H)$ with $N_g = 3$ |

**Step-by-Step Derivation:**

**Step 1: Baryogenesis Complexity**
$$\kappa_B = \frac{\kappa_{EW}}{2} + \frac{\varepsilon_0}{N_g} = \frac{38.5}{2} + \frac{0.6931}{3} = 19.25 + 0.23 = 19.48$$

The single-verification form $\varepsilon_0/N_g$ is used because the CP-sector selection is already encoded in the factor $\kappa_{EW}/2$.

**Step 2: Complexity Suppression Factor**
$$e^{-\kappa_B} = e^{-19.48} = 3.47 \times 10^{-9}$$

**Step 3: Sphaleron Enhancement Factor**
$$\mathcal{S} = \frac{1}{2\pi\alpha_W} = \frac{1}{2\pi \times (1/30)} = \frac{30}{2\pi} = 4.77$$

**Step 4: Efficiency Coefficient**
$$\mathcal{C}_{eff} = \frac{c_{sph}}{2N_g} \times \mathcal{S} = \frac{0.354}{6} \times 4.77 = 0.0590 \times 4.77 = 0.282$$

**Step 5: CP Factor**
$$\mathcal{S} \cdot \sin\delta = 4.77 \times \sin(66.7°) = 4.77 \times 0.918 = 4.38$$
$$\mathcal{F}_{CP} = \tanh(4.38) = 0.9997$$

**Step 6: Washout Factor**
$$f_{wash} = 0.63$$

**Step 7: Baryon Asymmetry**
$$\eta_B = \mathcal{C}_{eff} \times \mathcal{F}_{CP} \times f_{wash} \times e^{-\kappa_B}$$
$$= 0.282 \times 0.9997 \times 0.63 \times 3.47 \times 10^{-9}$$
$$= 6.16 \times 10^{-10}$$

### Y.7.5 Uncertainty Analysis

| Source | Contribution to $\sigma(\eta_B)/\eta_B$ |
|:-------|:--------------------------------------:|
| $c_{sph}$ (lattice uncertainty) | ±3% |
| $f_{wash}$ (thermal modeling) | ±8% |
| $\alpha_W$ (SM running) | ±2% |
| **Total (quadrature)** | **±9%** |

The complexity $\kappa_B = 19.48$ is derived from the stated PU counting chain $K_0 \to d_0 \to (a,b) \to M \to \kappa_{EW} \to \kappa_B$ on the Appendix T hierarchy branch. The uncertainty budget above covers the external Standard Model and thermal inputs; the use of $\alpha_W$ remains validation-level in the canonical minimal ledger by Theorem T.78.5 unless an appended Appendix T global spectral branch extension is fixed before comparison and evaluated forward.

**Validation-Run Result:**
$$\boxed{\eta_B = (6.2 \pm 0.5) \times 10^{-10}}$$

---

## Y.8 Comparison with Observation

### Y.8.1 Primary Result

$$\eta_B^{\text{val}} = (6.2 \pm 0.5) \times 10^{-10}$$

**Observational Value** [Planck Collaboration 2020a]:
$$\eta_B^{\text{obs}} = (6.12 \pm 0.04) \times 10^{-10}$$

| Quantity | Validation run | Observation | Pull |
|:---------|:--------------:|:-----------:|:----:|
| $\eta_B$ | $(6.2 \pm 0.5) \times 10^{-10}$ | $(6.12 \pm 0.04) \times 10^{-10}$ | $+0.2\sigma$ |

The validation-run prediction agrees with observation within combined uncertainties. The stated uncertainty arises from external Standard Model and thermal inputs ($c_{sph}$, $f_{wash}$, $\alpha_W$); its Appendix T gauge-threshold component remains status-limited by Theorem T.78.5.

### Y.8.2 Consistency Checks

**CKM CP Phase:**

| Quantity | PU Prediction | Measurement [Particle Data Group 2024] | Pull |
|:---------|:-------------:|:----------------------:|:----:|
| $\delta$ | $66.7°$ | $65.7° \pm 1.5°$ | $+0.7\sigma$ |

**Jarlskog Invariant:**

| Quantity | PU Prediction | Measurement [Particle Data Group 2024] | Pull |
|:---------|:-------------:|:----------------------:|:----:|
| $J_{CP}$ | $3.22 \times 10^{-5}$ | $(3.12^{+0.13}_{-0.12}) \times 10^{-5}$ | $+0.8\sigma$ |



All derived quantities are consistent with observation.

### Y.8.3 Parameter Accounting

| Parameter | Status | Origin |
|:----------|:-------|:-------|
| $K_0 = 3$ | Foundational | Horizon constant (axiom) |
| $\varepsilon_0=\ln2$ | Derived | Landauer limit (Theorem 31) |
| $N_g = 3$ | Derived | Anomaly cancellation (Theorem R.3.4) |
| $\delta = 66.7°$ | Derived | Berry holonomy (Theorem T.56) |
| $\alpha_{em}^{-1} = 137.036092 \pm 0.000060$ | Derived | Capacity saturation (Theorem Z.26) |
| $\sin^2\theta_W^{(0)} = 3/8$ | Derived | Bures geometry (Theorem T.14) |
| $\alpha_W \approx 1/30$ | Validation-level | $\alpha_{em}/\sin^2\theta_W$ at $T_{sph}$ using the Appendix T threshold tuple; status governed by Theorem T.78.5 |
| $c_{sph} = 28/79$ | Derived | $(8N_g + 4n_H)/(22N_g + 13n_H)$ |
| $f_{wash} = 0.63$ | Calculated | $\exp(-\int \Gamma_{sph}/H \, dT/T)$ |

**Continuously adjustable parameters in the displayed validation run: Zero.** The structural quantities trace to $K_0 = 3$ through the stated PU derivation chain, while $\alpha_W$ inherits the validation-level status of the Appendix T threshold tuple because Theorem T.78.5 closes the current-framework spectral gate negatively. A positive theorem-level $\alpha_W$ input would require an independently appended spectral branch extension fixed before validation comparison.

---

## Y.9 Sign of the Baryon Asymmetry

**Theorem Y.10** (Matter Dominance from Boundary Conditions). *The sign of $\eta_B>0$ (matter over antimatter) is determined by the orientation of the initial predictive boundary, with no additional continuous dynamical parameter once the boundary orientation has been fixed. The orientation itself — comprising the sign of $\sin\delta$ from the Berry-holonomy convention on $\mathrm{Gr}(2,8)$, the past hypothesis $N_{CS}(\Sigma_i)=0$ on the primordial Cauchy surface, and the time orientation of the KMS drive — is a discrete branch choice on the predictive boundary, by analogy with spontaneous symmetry breaking, unless an accepted APS-eta certificate of Definition Y.6.1a supplies the determinant-line orientation product of Theorem Y.6.1b condition (Y.6.1b.2) that ties the three signs into a single coherent index output.*


*Proof.* The SPAP 2-to-1 merge (Theorem 31) selects one branch of the NOT duality:
- Selection of branch $\mathcal{A}$ ⇒ universe contains matter
- Selection of branch $\mathcal{B}$ ⇒ universe contains antimatter

The Berry holonomy $\delta$ determines the *magnitude* of the asymmetry through its appearance in Eq. (Y.12). The *sign* is fixed by:
1. Sign of $\sin\delta > 0$ (from Berry holonomy orientation on Gr(2,8))
2. Initial condition $N_{CS}(\Sigma_i) = 0$ on the primordial Cauchy surface (the "Past Hypothesis" in PU language)
3. Time orientation of the KMS drive

Under CP conjugation:
$$\mathsf{CP}: \delta \to -\delta, \quad N_{CS} \to -N_{CS}$$

The product $\sin\delta \cdot \Delta N_{CS}$ is CP-even, but the initial condition $N_{CS}(\Sigma_i) = 0$ combined with the time-orientation of the KMS drive selects a definite sign for $\Delta N_{CS}$, hence for $\eta_B$.

This is analogous to spontaneous symmetry breaking: the underlying equations are CP-symmetric, but the boundary conditions select one vacuum. ∎

**Corollary Y.10.1** (No Antimatter Parameter). *The framework contains no free parameter determining matter versus antimatter dominance. The observed matter dominance is a consequence of initial conditions on the predictive boundary.*

**Corollary Y.10.2 (CP Phase as Predictive Orientation Defect).** On the Berry-loop baryogenesis branch, the CKM CP phase is the predictive-orientation holonomy
$$
\delta_{\mathrm{CP}}
=
\oint_{\gamma_{\mathrm{flavor}}}\mathcal A_{\mathrm{Berry}}
=
\int_{\Sigma_{\mathrm{flavor}}}\mathcal F_{\mathrm{Berry}},
$$
and the sign of the baryon asymmetry is fixed by the orientation product
$$
\mathrm{sign}(\eta_B)
=
\mathrm{sign}\!\left(
\sin\delta_{\mathrm{CP}}\cdot
\Delta N_{CS}\cdot
\mathcal T_{\mathrm{KMS}}
\right),
$$
where $\mathcal T_{\mathrm{KMS}}=\pm1$ is the selected thermodynamic time orientation of the KMS drive. Thus CP violation is not an independent scalar insertion on this branch; it is the orientation defect of predictive transport in the generation bundle, projected into the electroweak topological channel.

*Proof.* Theorem T.56 and Theorem Y.6 identify the phase entering the CP source with Berry holonomy over the flavor loop. Stokes' theorem on the chosen Berry surface gives
$$
\oint_{\gamma_{\mathrm{flavor}}}\mathcal A_{\mathrm{Berry}}
=
\int_{\Sigma_{\mathrm{flavor}}}\mathcal F_{\mathrm{Berry}}.
$$
Theorem Y.10 states that matter dominance is fixed by the sign of $\sin\delta$, the initial Chern-Simons boundary condition, and the KMS time orientation. Writing these three signs as the displayed product gives the result. ∎

---

## Y.10 Relation to Standard Electroweak Baryogenesis

### Y.10.1 The Standard Model Deficit

In standard electroweak baryogenesis (EWBG), the baryon asymmetry is estimated as [Kajantie et al. 1996; Gavela et al. 1994]:
$$\eta_B^{\text{SM}} \sim J_{CP} \times f_{\text{sphaleron}} \times f_{\text{PT}} \times f_{\text{washout}}$$

where:
- $J_{CP} \sim 10^{-5}$: Jarlskog invariant (kinematically suppressed)
- $f_{\text{sphaleron}} \sim 10^{-2}$: sphaleron conversion efficiency
- $f_{\text{PT}} \sim 10^{-9}$: phase transition departure from equilibrium (SM crossover, not first-order)
- $f_{\text{washout}} \sim 10^{-4}$: survival against washout processes

The product gives:
$$\eta_B^{\text{SM}} \sim 10^{-5} \times 10^{-2} \times 10^{-9} \times 10^{-4} \sim 10^{-20}$$

This is $\sim 10^{10}$ times smaller than the observed value $(6.12 \pm 0.04) \times 10^{-10}$, constituting the "baryogenesis problem" that motivates BSM physics.

### Y.10.2 PU Resolution

The PU framework resolves this deficit through the following mechanisms:

| Factor | Standard EWBG | PU Baryogenesis | Enhancement |
|:-------|:-------------:|:---------------:|:-----------:|
| CP source | $J_{CP} \sim 10^{-5}$ | $\tanh(\mathcal{S}\sin\delta) \approx 1$ | $\sim 10^{5}$ |
| Out-of-equilibrium | $f_{\text{PT}} \sim 10^{-9}$ | $e^{-\kappa_B} \sim 3 \times 10^{-9}$ | $\sim 1$ |
| Washout survival | $f_{\text{washout}} \sim 10^{-4}$ | $f_{wash} \sim 0.6$ | $\sim 6 \times 10^{3}$ |
| Efficiency | $f_{\text{sphaleron}} \sim 10^{-2}$ | $\mathcal{C}_{eff} \sim 0.3$ | $\sim 30$ |
| **Total** | $\sim 10^{-20}$ | $\sim 6 \times 10^{-10}$ | $\sim 10^{10}$ |

**Mechanism 1: Saturated Geometric CP Violation**

The Jarlskog invariant $J_{CP}$ is suppressed by products of small mixing angles because it measures interference between different flavor paths. In the PU mechanism, the Berry holonomy $\delta$ enters through $\tanh(\mathcal{S}\sin\delta)$. Since $\mathcal{S}\sin\delta = 4.38 \gg 1$, the CP asymmetry *saturates* at unity rather than suffering kinematic suppression.

**Mechanism 2: Complexity-Regulated Efficiency**

In standard EWBG, the efficiency is controlled by the detailed dynamics of the phase transition, which in the SM is too weak (crossover rather than first-order). In PU, the out-of-equilibrium factor is controlled by the configuration space complexity $\kappa_B$, which derives from the fundamental Golay-Leech structure. The complexity $\kappa_B = 19.48$ yields $e^{-\kappa_B} \sim 3 \times 10^{-9}$, providing the required suppression without requiring a first-order transition.

**Mechanism 3: Reduced Washout**

The PU mechanism operates during a different dynamical regime than standard EWBG, with sphaleron freeze-out occurring in a manner that preserves more of the generated asymmetry.

## Y.10.3 The Hierarchy Unification Theorem

### Y.10.3.1 Statement of Result

**Theorem Y.11** (Hierarchy Link with Branch-Fixed Efficiency Prefactor). *The baryon asymmetry and the electroweak hierarchy are not independent. Their dominant exponential dependence satisfies a square-root relation, with a dimensionless prefactor fixed once the Appendix T determinant model, the CP-profile branch, and the washout branch are fixed:*

$$\boxed{\eta_B = \mathcal{P}_{\mathrm{eff}}\sqrt{\frac{v}{M_{Pl}}}}$$

*Equivalently:*

$$\boxed{\eta_B^2 = \mathcal{P}_{\mathrm{eff}}^2\frac{v}{M_{Pl}}}$$

*Proof.* From Theorem T.6 and Proposition T.4 within the determinant model of Theorem T.29, the electroweak scale satisfies
$$
\frac{v}{M_{Pl}} = A_{EW} e^{-\kappa_{EW}},
\qquad
\kappa_{EW}=38.5,
\qquad
A_{EW}=1.084\pm0.005.
$$

From Theorem Y.8, the baryogenesis complexity is
$$
\kappa_B = \frac{\kappa_{EW}}{2} + \frac{\varepsilon_0}{N_g}.
$$
Therefore
$$
e^{-\kappa_B}
=
e^{-\varepsilon_0/N_g} e^{-\kappa_{EW}/2}
=
e^{-\varepsilon_0/N_g} A_{EW}^{-1/2}\sqrt{\frac{v}{M_{Pl}}}.
$$

The remaining CP and washout factors are dimensionless and are collected into the prefactor
$$
\mathcal{P}_{\mathrm{eff}} := \mathcal{C}_{eff}\mathcal{F}_{CP}f_{wash}e^{-\varepsilon_0/N_g}A_{EW}^{-1/2}.
$$
Hence the full hierarchy link takes the stated prefactor-weighted square-root form. ∎

### Y.10.3.2 Numerical Verification

**Proposition Y.11.1** (Numerical Consistency). *The leading square-root scaling holds quantitatively once the branch-fixed prefactor is included:*

| Quantity | Expression | Value |
|:---------|:-----------|:-----:|
| Electroweak hierarchy | $v/M_{Pl}$ | $2.0 \times 10^{-17}$ |
| Square root | $\sqrt{v/M_{Pl}}$ | $4.5 \times 10^{-9}$ |
| Observed $\eta_B$ | — | $6.1 \times 10^{-10}$ |
| Ratio | $\sqrt{v/M_{Pl}}/\eta_B$ | $7.4$ |

The factor of $\sim 7$ is accounted for by the branch-fixed prefactor:
$$
\mathcal{C}_{eff} \times \mathcal{F}_{CP} \times f_{wash} \times e^{-\varepsilon_0/N_g} \times A_{EW}^{-1/2}
=
0.282 \times 0.9997 \times 0.63 \times 0.79 \times 1.084^{-1/2}
\approx 0.135
$$

Therefore:
$$
\eta_B \approx 0.135 \times \sqrt{\frac{v}{M_{Pl}}}
\approx 0.135 \times 4.5 \times 10^{-9}
\approx 6.1 \times 10^{-10} \checkmark
$$

### Y.10.3.3 Origin of the Square Root

**Theorem Y.11.2** (Conditional CP Half-Step Law). *Assume that the CP involution acts freely on the relevant electroweak saddle sector, preserves the reduced measure on that sector, and splits the leading PCE complexity equally between the CP-even and CP-odd components. Then*
$$
\kappa_{CP} = \frac{\kappa_{EW}}{2},
\qquad
e^{-\kappa_{CP}} = e^{-\kappa_{EW}/2}.
$$

*Proof.*

**Step 1 (CP involution).** The CP transformation satisfies $(\mathsf{CP})^2 = 1$, so it defines a $\mathbb{Z}_2$ action on the relevant electroweak configuration sector $\mathcal{M}_{EW}$.

**Step 2 (Sector decomposition).** By the hypothesis that this action is free on the relevant saddle sector and preserves the reduced measure, the sector decomposes into two measure-matched components,
$$
\mathcal{M}_{EW} = \mathcal{M}_{+} \sqcup \mathcal{M}_{-},
$$
interchanged by CP.

**Step 3 (Equal leading complexity split).** By the equal-split hypothesis, the leading PCE complexity carried by each component is half of the total electroweak complexity:
$$
\kappa(\mathcal{M}_{+}) = \kappa(\mathcal{M}_{-}) = \frac{\kappa_{EW}}{2}.
$$

**Step 4 (Definition of the CP contribution).** The baryogenesis CP contribution is the leading suppression exponent attached to the CP-odd component, so
$$
\kappa_{CP} := \kappa(\mathcal{M}_{-}) = \frac{\kappa_{EW}}{2}.
$$

**Step 5 (Suppression factor).** Exponentiating the previous identity gives
$$
e^{-\kappa_{CP}} = e^{-\kappa_{EW}/2}.
$$

This is the square-root relation used in Theorem Y.8. ∎

**Corollary Y.11.3** (Topological Origin). *The factor of 2 in $\kappa_B = \kappa_{EW}/2$ is exact, not approximate. It reflects the topological structure of $\mathbb{Z}_2$, which has exactly two elements.*

### Y.10.3.4 Unification of Hierarchy Problems

**Theorem Y.11.4** (Single Hierarchy). *The electroweak hierarchy problem and the baryon asymmetry problem are manifestations of a single underlying structure.*

*Proof.* Both quantities derive from the same complexity:

| Problem | Quantity | Complexity | Suppression |
|:--------|:---------|:----------:|:-----------:|
| Electroweak hierarchy | $v/M_{Pl}$ | $\kappa_{EW}$ | $e^{-38.5} \sim 10^{-17}$ |
| Baryon asymmetry | $\eta_B$ | $\kappa_{EW}/2$ | $e^{-19.25} \sim 10^{-9}$ |

The complexities satisfy $\kappa_B \approx \kappa_{EW}/2$, hence the suppressions satisfy:
$$\eta_B \sim \sqrt{v/M_{Pl}}$$

Any mechanism that explains $\kappa_{EW}$ automatically constrains $\eta_B$, and vice versa. The two problems have a common origin in the Golay-Steiner structure (Theorem T.5). ∎

**Corollary Y.11.4a (Hierarchy Bridge Ratio).** *The prefactor $\mathcal{P}_{\mathrm{eff}}$ has two determinations, one from the adopted Appendix T/Y model branch and one from observational inversion, and the two values agree at the $0.6\%$ level.*

*Proof.* Theorem Y.11 gives
$$
\mathcal{P}_{\mathrm{eff}} = \mathcal{C}_{eff}\,\mathcal{F}_{CP}\,f_{wash}\,e^{-\varepsilon_0/N_g}A_{EW}^{-1/2}.
$$
At the PCE-Attractor, $\varepsilon_0=\ln2$ and $N_g = 3$, so
$$
e^{-\varepsilon_0/N_g} = e^{-\ln 2/3} = 2^{-1/3}.
$$
Using the branch-fixed values $\mathcal{C}_{eff} = 0.282$, $\mathcal{F}_{CP} = 0.9997$, $f_{wash} = 0.63$, and $A_{EW} = 1.084$ gives
$$
\mathcal{P}_{\mathrm{eff}}^{(\mathrm{th})}
=
0.282 \times 0.9997 \times 0.63 \times 2^{-1/3} \times 1.084^{-1/2}
=
0.1354.
$$
For comparison, with $\eta_B^{\mathrm{obs}} = 6.12 \times 10^{-10}$, $v_{\mathrm{obs}} = 246.22\,\mathrm{GeV}$, and $M_{Pl} = 1.2209 \times 10^{19}\,\mathrm{GeV}$,
$$
\mathcal{P}_{\mathrm{eff}}^{(\mathrm{obs})}
=
\frac{\eta_B^{\mathrm{obs}}}{\sqrt{v_{\mathrm{obs}}/M_{Pl}}}
=
\frac{6.12 \times 10^{-10}}{\sqrt{246.22/(1.2209 \times 10^{19})}}
=
0.1363.
$$
Therefore
$$
\frac{\left|\mathcal{P}_{\mathrm{eff}}^{(\mathrm{th})} - \mathcal{P}_{\mathrm{eff}}^{(\mathrm{obs})}\right|}{\mathcal{P}_{\mathrm{eff}}^{(\mathrm{obs})}}
\approx 0.0065,
$$
i.e. $0.6\%$. ∎

**Remark Y.11.4a.** The ratio $\eta_B / \sqrt{v/M_{Pl}}$ removes the common exponential suppression carried by the two observables and isolates the derived $O(1)$ prefactor $\mathcal{P}_{\mathrm{eff}}$.

**Corollary Y.11.4b (Electroweak–Baryon Square-Root Lock).** On the Appendix Y canonical baryogenesis branch,
$$
\boxed{
\eta_B
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}2^{-1/3}
\sqrt{\frac{v}{A_{EW}M_{Pl}}}.
}
\tag{Y.11.4b}
$$
Equivalently,
$$
\boxed{
\frac{\eta_B}
{
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}
}
=
2^{-1/3}
\sqrt{\frac{v}{A_{EW}M_{Pl}}}.
}
$$
The factor $2^{-1/3}$ is the generation-shared Landauer correction. The square root is the CP half-step of the electroweak instanton exponent.

*Proof.* Theorem Y.9 gives
$$
\eta_B
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B}.
$$
Theorem Y.8 gives
$$
\kappa_B=\frac{\kappa_{EW}}2+\frac{\varepsilon_0}{N_g}.
$$
On the minimal branch, $\varepsilon_0=\ln2$ and $N_g=3$, so
$$
e^{-\varepsilon_0/N_g}=e^{-\ln2/3}=2^{-1/3}.
$$
The electroweak branch gives
$$
\frac{v}{M_{Pl}}=A_{EW}e^{-\kappa_{EW}},
$$
hence
$$
e^{-\kappa_{EW}/2}
=
\sqrt{\frac{v}{A_{EW}M_{Pl}}}.
$$
Multiplying these two factors gives
$$
e^{-\kappa_B}
=
2^{-1/3}\sqrt{\frac{v}{A_{EW}M_{Pl}}},
$$
and substitution into the master formula proves the result. ∎

### Y.10.3.5 Experimental Consequences

**Prediction Y.1** (Sphaleron Saturation). *The geometric CP mechanism predicts that any deformation that modifies the electroweak scale within the same baryogenesis regime produces correlated modifications to the baryon asymmetry at leading order:*

$$\frac{\delta\eta_B}{\eta_B} \approx \frac{1}{2}\frac{\delta v}{v}$$

*Proof.* From the leading scaling $\eta_B \propto \sqrt{v}$ at fixed prefactor regime,
$$\delta\eta_B = \frac{\partial\eta_B}{\partial v}\delta v = \frac{\eta_B}{2v}\delta v.$$

Therefore:
$$\frac{\delta\eta_B}{\eta_B} = \frac{1}{2}\frac{\delta v}{v}. $$

∎

**Corollary Y.11.5** (BSM Constraints). *Models of electroweak symmetry breaking are constrained by cosmological observations:*

| If $v$ changes by | Then $\eta_B$ changes by | CMB constraint |
|:-----------------:|:------------------------:|:--------------:|
| $\pm 1\%$ | $\pm 0.5\%$ | Marginally detectable |
| $\pm 10\%$ | $\pm 5\%$ | Strongly constrained |
| $\pm 50\%$ | $\pm 25\%$ | Excluded by Planck |

*Any proposed solution to the electroweak hierarchy problem that modifies $v$ at the $> 10\%$ level must be checked against the observed value $\eta_B = (6.12 \pm 0.04) \times 10^{-10}$.*

### Y.10.3.6 Conceptual Significance

The hierarchy unification theorem implies:

1. **Reduction of mysteries.** Two apparently independent fine-tuning problems reduce to one. The question "why is $\eta_B \sim 10^{-10}$?" becomes "why is $v/M_{Pl} \sim 10^{-17}$?", which was already being asked.

2. **Mandatory cross-talk.** The electroweak physics community and the baryogenesis community are studying the same problem from different angles. Solutions must satisfy both constraints simultaneously.

3. **CP as geometry.** The $\mathbb{Z}_2$ structure of CP is not incidental to baryogenesis — it determines the power law relating $\eta_B$ to $v/M_{Pl}$. The square root is a geometric consequence of the two-element structure of $\mathbb{Z}_2$.

4. **Predictive correlation.** The relationship $\delta\eta_B/\eta_B \approx (1/2)\delta v/v$ is a parameter-free prediction that can be tested against any BSM scenario.

**Theorem Y.11.6 (Generation-Locked Baryogenesis in the Appendix Y Channel).** Within the PU electroweak baryogenesis mechanism of this appendix, the same data that make flavor CP violation possible are structurally required by the baryogenesis formula. In particular:

1. Theorem R.3.4 shows that the smallest anomaly-free family-charge pattern permitting physical CP violation in the modeled class is the three-sector pattern $\{a,-a,0\}$, hence $N_g=3$.
2. Theorem T.56 gives a nonzero CKM phase $\delta$ from Berry holonomy on the generation manifold.
3. Theorem Y.2 uses exactly these two inputs—$N_g=3$ and nonzero $\delta$—to realize the Sakharov conditions in the PU channel.
4. Theorems Y.8 and Y.9 then make both inputs enter the baryogenesis formula through
$$
\kappa_B=\frac{\kappa_{EW}}{2}+\frac{\varepsilon_0}{N_g},
\qquad
\mathcal F_{CP}=\tanh(\mathcal S\sin\delta).
$$

Consequently, within the Appendix Y channel, the flavor-topology sector and the cosmological matter-asymmetry sector are structurally locked: if $N_g<3$ or $\delta=0$, the present mechanism ceases to produce the observed-type baryogenesis channel.

*Proof.* Theorem R.3.4 proves that two generations cannot support a physical CKM phase after rephasing, whereas the minimal anomaly-free family-charge pattern allowing CP violation is the three-sector pattern $\{a,-a,0\}$. Theorem T.56 then gives a nonzero CKM phase $\delta$ as Berry holonomy. Theorem Y.2 imports both facts into the Sakharov analysis: baryon violation uses the electroweak anomaly with coefficient proportional to $N_g$, while CP violation uses the nonzero Berry-holonomy phase $\delta$. Finally, Theorem Y.8 inserts $N_g$ into the exponent through the generation-sharing term $\varepsilon_0/N_g$, and Theorem Y.9 inserts $\delta$ into the CP factor through $\sin\delta$. If $N_g<3$, the modeled class loses physical CKM CP violation; if $\delta=0$, then $\mathcal F_{CP}=\tanh(0)=0$. In either case the present Appendix Y mechanism collapses. ∎

**Corollary Y.11.6a (Three Generations Are Operational in the Appendix Y Mechanism).** In the present PU baryogenesis channel, three generations are not merely compatible with the asymmetry calculation; they are part of the mechanism's operating conditions.

*Proof.* Immediate from Theorem Y.11.6. ∎

**Definition Y.11.7a (Baryogenesis Transport Certificate).** A baryogenesis transport certificate is a finite record
$$
\mathfrak C_B
=
\left(
\mathfrak R_{\mathrm{RHG}},
\mathfrak C_{\mathrm{fl}},
\mathcal S_{\mathrm{sph}},
\mathcal W_{\mathrm{wash}},
\mathcal P_{CP},
\mathcal T_B,
\chi_B
\right)
$$
fixed before comparison with $\eta_B$, where:

1. $\mathfrak R_{\mathrm{RHG}}$ is the accepted electroweak threshold record of Definition T.78.10.
2. $\mathfrak C_{\mathrm{fl}}$ is the accepted flavor completion certificate of Definition T.79.4, or an explicitly stated branch substitute with the same forward-lock condition.
3. $\mathcal S_{\mathrm{sph}}$ is the finite sphaleron or anomaly-transport coefficient.
4. $\mathcal W_{\mathrm{wash}}$ is the finite washout and freeze-out integral with certified tail bounds.
5. $\mathcal P_{CP}$ is the relative determinant-line CP phase profile used in the transport equation.
6. $\mathcal T_B$ is the total uncertainty interval from threshold, transport, washout, and CP-profile residuals.
7. $\chi_B$ records that no entry is chosen from the observed baryon asymmetry.

**Theorem Y.11.7b (Certified Baryogenesis Determinacy).** If $\mathfrak C_B$ is accepted, then the Appendix Y value of $\eta_B$ is uniquely determined up to the certified interval $\mathcal T_B$. If no accepted $\mathfrak C_B$ exists, the numerical baryogenesis value remains model-layer.

*Proof.* Appendix Y expresses $\eta_B$ as a deterministic function of electroweak threshold data, the three-generation CP-active flavor branch, sphaleron/anomaly conversion, washout, and transport factors. Definition Y.11.7a fixes each of these inputs as a finite record before comparison with $\eta_B$. The accepted RHG and flavor certificates determine the threshold and CP-sector entries; $\mathcal S_{\mathrm{sph}}$, $\mathcal W_{\mathrm{wash}}$, and $\mathcal P_{CP}$ determine the transport channel; and $\mathcal T_B$ bounds the residual uncertainty. Thus $\eta_B$ is the deterministic image of a finite accepted record up to $\mathcal T_B$. Without such a record, at least one transport input remains branch-supplied, so the numerical output is model-layer. ∎

**Corollary Y.11.7c (No Baryogenesis Back-Fitting).** Changing the sphaleron coefficient, washout integral, CP profile, threshold input, or uncertainty interval after comparison with $\eta_B$ defines a new transport branch and cannot confirm the original Appendix Y numerical branch.

*Proof.* Each listed item is part of $\mathfrak C_B$. The forward-lock condition $\chi_B$ forbids choosing it from the target value. ∎

**Corollary Y.11.7d (Baryogenesis Numerical Dependence on RHG and Flavor Certificates).** The Appendix Y baryogenesis number is theorem-level only if the RHG threshold record, flavor or CP-sector certificate, sphaleron coefficient, washout integral, CP profile, and uncertainty interval are all fixed in an accepted $\mathfrak C_B$. The existence of $N_g=3$ and nonzero CP capacity is not by itself a numerical baryogenesis prediction.

*Proof.* Theorem Y.11.7b states that $\eta_B$ is the deterministic image of $\mathfrak C_B$. The inputs of $\mathfrak C_B$ include $\mathfrak R_{\mathrm{RHG}}$, $\mathfrak C_{\mathrm{fl}}$ or a branch substitute, $\mathcal S_{\mathrm{sph}}$, $\mathcal W_{\mathrm{wash}}$, $\mathcal P_{CP}$, and $\mathcal T_B$. Exact $N_g=3$ and the existence of CP-active structure determine only qualitative admissibility of the transport channel. Varying the washout integral or CP profile within admissible finite records changes the numerical asymmetry. Theorem P.14.1f therefore blocks theorem-level numerical promotion without the accepted transport certificate. ∎

## Y.11 Derivation Chain Summary

The complete logical chain from $K_0 = 3$ to $\eta_B$:

$$\boxed{
\begin{aligned}
K_0 = 3 &\xrightarrow{\text{Thm 23}} d_0 = 2^{K_0} = 8 \\[4pt]
&\xrightarrow{\text{Thm Z.1}} a = 2, \quad b = d_0 - a = 6 \\[4pt]
&\xrightarrow{\text{Thm Z.5}} M = 2ab = 24, \quad k = 12 \\[4pt]
&\xrightarrow{\text{Thm T.5}} \kappa_{EW} = \frac{bk}{2} + \dim(G/H) - \frac{m}{2} = 38.5 \\[4pt]
&\xrightarrow{\text{Thm 31}} \varepsilon_0=\ln2 \\[4pt]
&\xrightarrow{\text{Thm R.3.4}} N_g = 3 \\[4pt]
&\xrightarrow{\text{Thm Y.8}} \kappa_B = \frac{\kappa_{EW}}{2} + \frac{\varepsilon_0}{N_g} = 19.48 \\[4pt]
&\xrightarrow{\text{Thm T.56}} \delta = 66.7° \implies \sin\delta = 0.918 \\[4pt]
&\xrightarrow{\text{Thm Y.9}} \eta_B = \mathcal{C}_{eff} \cdot \tanh(\mathcal{S}\sin\delta) \cdot f_{wash} \cdot e^{-\kappa_B} \\[4pt]
&= 0.282 \times 0.9997 \times 0.63 \times 3.47 \times 10^{-9} = 6.2 \times 10^{-10}
\end{aligned}
}$$

**Continuous fit-parameter count: Zero after fixing the Appendix T/R/Z/Y branch data.** Every quantity in the final result traces back to the foundational constant $K_0=3$, to independently measured/calculated Standard Model quantities, or to the explicit branch labels of the canonical Appendix Y baryogenesis branch (the SM-gauge branch from Appendix G; the realized $N_g=3$ on the minimal-family branch of Appendix R; the $\kappa_{EW}$ branch package of Appendix T; the residual-budget and predictive-recovery MacWilliams Golay branches of Appendices E/Q/Z; the unit Berry-topological response branch $\chi_{CP}=1$ or an APS-eta index output $\chi_{CP}=I_{CP}$ via Theorem Y.6.1b; the unit sphaleron-transport branch $\chi_{tr}=1$ or an APS-eta index output $\chi_{tr}=I_{tr}$ via Theorem Y.6.1b; the unit boundary orientation of Theorem Y.10 or the determinant-line orientation product of Theorem Y.6.1b condition (Y.6.1b.2)). This is not the same as saying that every branch input is an unconditional theorem-level result.


---

## Y.12 Experimental Predictions and Tests

### Y.12.1 Precision CMB Measurements

The Planck satellite constrains $\eta_B = (6.12 \pm 0.04) \times 10^{-10}$. Future experiments will improve precision:

| Experiment | Projected $\sigma(\eta_B)/\eta_B$ | Timeline |
|:-----------|:---------------------------------:|:---------|
| Planck (current) | $0.7\%$ | Complete |
| LiteBIRD | $0.2\%$ | 2030s |

**Prediction:** $\eta_B = (6.2 \pm 0.5) \times 10^{-10}$. If future measurements converge outside the range $(5.7, 6.7) \times 10^{-10}$, the framework requires refinement.

### Y.12.2 CKM Phase Measurements

The CP phase $\delta$ is measured at B-factories and LHCb. Current world average [Particle Data Group 2024]:
$$\delta = 65.7° \pm 1.5°$$

**Prediction:** $\delta = 66.7°$ from Theorem T.56.

Projected LHCb upgrade sensitivity: $\sigma(\delta) \sim 1°$, providing a direct test of the prediction.

### Y.12.3 Saturation Regime Test

**Prediction Y.2** (Sphaleron Saturation). *The geometric CP mechanism predicts that the baryon asymmetry is insensitive to the precise value of $\sin\delta$ in the range $\sin\delta > 0.2$, because the CP asymmetry saturates ($\tanh(\mathcal{S}\sin\delta) \approx 1$).*

*Testable consequence:* If future measurements shift $\delta$ within experimental uncertainties, the $\eta_B$ prediction should remain stable. This distinguishes the PU mechanism from scenarios where $\eta_B \propto \sin\delta$.

### Y.12.4 CPT Tests

The framework predicts exact CPT symmetry (the NOT operation is symmetric under time reversal when combined with CP). High-precision tests with antihydrogen at CERN/ALPHA constrain CPT violation at the $10^{-15}$ level.

**Prediction:** No CPT violation. Any observed asymmetry between hydrogen and antihydrogen spectra would falsify the framework.

### Y.12.5 Electric Dipole Moments

CP violation beyond the CKM mechanism would manifest in electric dipole moments (EDMs). Current bounds:

| System | Bound | SM Prediction |
|:-------|:------|:--------------|
| Electron | $|d_e| < 1.1 \times 10^{-29}$ e·cm | $\sim 10^{-38}$ e·cm |
| Neutron | $|d_n| < 1.8 \times 10^{-26}$ e·cm | $\sim 10^{-31}$ e·cm |

**Prediction:** EDMs at or below SM predictions. The PU CP violation is encoded in $\delta$ (CKM mechanism), not in new CP-odd operators.

---

## Y.13 Theoretical Uncertainties

### Y.13.1 Identified Sources

| Source | Estimated Effect on $\eta_B$ | Origin |
|:-------|:----------------------------:|:-------|
| $c_{sph}$ lattice uncertainty | ±3% | D'Onofrio et al. 2014 |
| $f_{wash}$ thermal modeling | ±8% | Sphaleron freeze-out dynamics |
| $\alpha_W$ running | ±2% | SM uncertainty at EW scale |
| **Total (quadrature)** | **±9%** | $\sqrt{3^2 + 8^2 + 2^2} \approx 8.8\%$ |

Within the canonical Appendix Y baryogenesis branch, the components $\kappa_{EW} = 38.5$, $\varepsilon_0=\ln2$, and $N_g = 3$ are fixed by their source branch ledgers: $\kappa_{EW}$ on the Appendix T weak-left projection, row-pair, predictive-recovery MacWilliams Golay, and electroweak hierarchy branch (Theorem T.5 and the branch labels recorded for Theorems T.18a, T.8, T.1c); $\varepsilon_0=\ln2$ on the PCE-Attractor (Definition 15a; Theorem 31 supplies the lower bound); $N_g = 3$ as the realized generation count on the MDL/PCE minimal-family branch (Theorem R.3.4 supplies minimal admissibility, with exact realization on the minimal-family branch). The displayed $9\%$ uncertainty above is the within-branch validation-run uncertainty conditional on these branch choices, the unit Berry-topological response coefficient $\chi_{CP} = 1$ (Theorem Y.6.1), and the unit sphaleron-transport coefficient $\chi_{tr} = 1$ (Proposition Y.9.1). It does not include alternative-branch uncertainty in the electroweak hierarchy, generation, CP-response, or sphaleron-transport mappings. A unit shift $\delta\kappa_B = 0.1$ alone shifts $e^{-\kappa_B}$ by $\sim 9.5\%$, comparable to the entire stated within-branch uncertainty.


### Y.13.2 Robustness of Saturation

The saturated regime $\tanh(\mathcal{S}\sin\delta) \approx 1$ is robust to uncertainties in $\delta$:

| $\delta$ | $\sin\delta$ | $\mathcal{S}\sin\delta$ | $\tanh(\mathcal{S}\sin\delta)$ |
|:--------:|:------------:|:-----------------------:|:------------------------------:|
| 60° | 0.866 | 4.13 | 0.9995 |
| 66.7° | 0.918 | 4.38 | 0.9997 |
| 70° | 0.940 | 4.48 | 0.9997 |

The prediction is insensitive to $\delta$ variations of several degrees.

---

## Y.14 Conclusion

The baryon asymmetry of the universe is derived from the foundational constant $K_0 = 3$:

$$\eta_B = \mathcal{C}_{eff} \cdot \tanh(\mathcal{S}\sin\delta) \cdot f_{wash} \cdot e^{-\kappa_B} = (6.2 \pm 0.5) \times 10^{-10}$$

This agrees with the observed value $(6.12 \pm 0.04) \times 10^{-10}$ within uncertainties.

The derivation reveals that:
- **CP violation** is geometric (Berry holonomy on the flavor manifold), operating in a saturated regime where $\tanh(\mathcal{S}\sin\delta) \approx 1$
- **Efficiency** is controlled by configuration space complexity $\kappa_B = 19.48$, derived from the electroweak structure
- **Matter dominance** is a boundary condition on the initial predictive state, not a dynamical parameter

The framework provides a structurally constrained explanation for why the universe contains matter, how much matter it contains, and why antimatter is absent at cosmological scales, with the efficiency and washout modeling detailed in Section Y.4.

---

## Y.A: Self-Contained Derivations of Key Inputs

### Y.A.1 Derivation of $\kappa_{EW} = 38.5$

**Source:** Theorem T.5 (Appendix T)

The electroweak complexity counts constrained degrees of freedom:
$$\kappa_{EW} = N_0 + \dim(G/H) - \frac{m}{2}$$

**Step 1:** From $K_0 = 3$: $d_0 = 2^3 = 8$ and $(a,b) = (2,6)$.

**Step 2:** The Golay code [24,12,8] gives $M = 24$, $k = 12$.

**Step 3:** $N_0 = bk/2 = 6 \times 12/2 = 36$.

**Step 4:** The electroweak coset is $(SU(2)_L \times U(1)_Y)/U(1)_{em}$:
$$\dim(G/H) = (3 + 1) - 1 = 3$$

**Step 5:** One zero mode from unbroken $U(1)_{em}$: $m = 1$.

**Result:** $\kappa_{EW} = 36 + 3 - 0.5 = 38.5$ ∎

### Y.A.2 Derivation of $\delta = 66.7°$

**Source:** Theorem T.56 (Appendix T)

The CKM CP phase arises from Berry holonomy on Gr(2,8).

**Step 1:** The $E_8$ triads for quark sectors are:
- Down: $(d^2_{32}, d^2_{31}) = (2, 4)$
- Up: $(d^2_{32}, d^2_{31}) = (4, 8)$

**Step 2:** The mismatch angle at the 3↔2 interface:
$$\theta_{mismatch} = \arctan\left(\frac{\sqrt{2}}{2}\right) = 35.26°$$

**Step 3:** The holonomy around the flavor quadrilateral:
$$\delta_{flat} = 2\theta_{mismatch} = 70.53°$$

**Step 4:** Finite wavepacket correction:
$$f_{sinc} = \text{sinc}(1/\sqrt{3}) = \frac{\sin(1/\sqrt{3})}{1/\sqrt{3}} = 0.9454$$

**Result:** $\delta = 70.53° \times 0.9454 = 66.7°$ ∎

### Y.A.3 Derivation of $N_g = 3$

**Source:** Theorem R.3.4 (Appendix R)

Three generations emerge from two independent constraints:

**Constraint 1 (Anomaly cancellation):** Family charges $\{F_g\}$ must satisfy:
$$\sum_g F_g = 0, \quad \sum_g F_g^3 = 0$$

The minimal solution permitting CP violation is $\{a, -a, 0\}$ with $N_g = 3$.

**Constraint 2 (CP violation):** The Jarlskog invariant requires:
$$J_{CP} = c_{12}s_{12}c_{23}s_{23}c_{13}^2s_{13}\sin\delta \neq 0$$

This requires at least 3 generations (for $N_g = 2$, the CKM matrix is real).

**Constraint 3 (PCE minimality):** Additional generations ($N_g > 3$) increase complexity without predictive benefit.

**Result:** $N_g = 3$ is uniquely selected ∎

---