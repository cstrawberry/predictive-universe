# Appendix Y — Baryon Asymmetry from Predictive Anomaly Inflow

## Y.1 Overview and Derivation Chain

This appendix formulates the Appendix Y baryogenesis transport branch and its validation run. The finite transport chain is:
$$K_0=3 \xrightarrow{\text{Thm 23}} d_0=8 \xrightarrow{\text{Def 15a}} (a,b)=(2,6) \xrightarrow{\text{Thm Z.5}} M=24$$
$$\xrightarrow{\text{Thm T.5}} \kappa_{EW} = 38.5 \xrightarrow{\text{Thm T.56}} \delta = 66.7° \xrightarrow{\text{Thm Y.8}} \kappa_B = 19.48$$
$$\xrightarrow{\text{Thm Y.9}} \eta_B^{\mathrm{val}} = (6.2 \pm 0.5) \times 10^{-10}.$$
The numerical value is theorem-level only after an accepted $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or APS-Kubo certificate $\mathfrak C_B^{\mathrm{APSK}}$ fixes the electroweak threshold record, CP-sector record, sphaleron coefficient, washout profile, transport window, quadrature ledger, photon normalization, and residual interval before comparison.

| Quantity | Branch value | Observed | Status |
|----------|--------------|----------|--------|
| $\eta_B$ | validation run $(6.2 \pm 0.5) \times 10^{-10}$ | $(6.12 \pm 0.04) \times 10^{-10}$ | model/threshold branch pending $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or $\mathfrak C_B^{\mathrm{APSK}}$ |
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

**Corollary Y.1.1** (Irreversible Branch Selection). At the verification step of each nontrivial SPAP cycle, the 2-to-1 merge selects one retained branch of the predictive $\mathbb Z_2$ ledger and exports at least $\ln2$ nats of entropy when the discarded branch is not retained as side information. Let $\mathcal E_\Omega$ be a finite set of baryon-relevant update events in a finite spacetime region $\Omega$, equipped with the charge-conjugation pairing $e\mapsto\bar e$ from Proposition Y.1 and an orientation character
$$
\chi(e)\in\{+1,-1\},
\qquad
\chi(\bar e)=-\chi(e).
\tag{Y.1.1}
$$
Let $q_B(e)\ge0$ be the baryon-number magnitude contributed by event $e$ on the chosen transport branch, and let $w(e)$ be the forward-oriented event weight after the Appendix O time-orientation gate. Define the predictive momentum ledger
$$
\mathcal P_B(\Omega)
:=
\sum_{e\in\mathcal E_\Omega}
\chi(e)q_B(e)w(e).
\tag{Y.1.2}
$$
Then
$$
\mathcal P_B(\Omega)
=
\sum_{[e]}
q_B(e)\big(w(e)-w(\bar e)\big),
\tag{Y.1.3}
$$
where the sum is over charge-conjugation pairs with $q_B(e)=q_B(\bar e)$ and with the representative chosen so that $\chi(e)=+1$. In any CP-symmetric equilibrium branch for which
$$
w(e)=w(\bar e)
\tag{Y.1.4}
$$
for every pair, the predictive momentum ledger vanishes:
$$
\mathcal P_B(\Omega)=0.
\tag{Y.1.5}
$$
A nonzero matter excess on the Appendix Y branch is therefore exactly the finite retained value of the CP-odd, forward-oriented, baryon-number transport ledger (Y.1.2). This is the precise sense in which the matter excess is predictive momentum: its sign is the sign of the baryon transport ledger relative to the Appendix O update orientation, while its magnitude is fixed only by the anomaly, CP, out-of-equilibrium, sphaleron, washout, and transport certificates used later in Appendix Y.

*Proof.* The event set decomposes into disjoint charge-conjugation pairs $\{e,\bar e\}$ on the retained odd sector. A fixed point would require $\chi(e)=-\chi(e)$, impossible for $\chi\in\{\pm1\}$, so fixed points carry no retained odd contribution. Summing the two members of a pair gives
$$
\chi(e)q_B(e)w(e)+\chi(\bar e)q_B(\bar e)w(\bar e)
=
\chi(e)q_B(e)\big(w(e)-w(\bar e)\big).
$$
Choosing the representative with $\chi(e)=+1$ gives (Y.1.3). If CP symmetry and equilibrium make the paired weights equal, each pair contribution is zero, proving (Y.1.5). The positive entropy cost of the branch selection is Theorem J.1, and the forward orientation of the ledger is supplied by Appendix O. ∎

---

## Y.3 Sakharov Conditions as Necessary Consequences

**Theorem Y.2** (Sakharov Conditions on the Appendix Y baryogenesis branch). *On the SM-gauge, three-generation, Berry-CP, and electroweak nonequilibrium branch package — comprising (i) the SM-like gauge algebra of Theorem G.8.4b on its anomaly/hypercharge hypotheses, (ii) the realized three-generation count $N_g = 3$ on the pre-flavor family-redundancy PPI branch (Theorem R.3.4 supplies minimal admissibility; Proposition R.3.5.1a supplies exact realization), (iii) the nonzero CKM CP phase $\delta = 66.7°$ on the Berry-loop branch of Appendix T (Theorem T.56 with the Berry-area branch labels recorded in the branch ledger), and (iv) the SPAP/arrow-of-time structure (Theorem 31, Appendix O) — the three Sakharov ingredients are realized in the framework:*


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

**(e) Complexity cost.** On the CP half-step branch of Theorem Y.11.2, the CP-odd observable is placed on the equal-exponent exponential branch: the CP involution is free or response-null on the retained leading saddle support, the reduced measure is CP-invariant, the CP-odd projection is nonzero at leading order, and the electroweak exponential weight splits into two equal components. Under those branch hypotheses, equivalently by Theorem Y.11.2a with $G=\mathbb Z_2$, the retained CP-odd component has
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
- $S_{N_g}$ symmetry: Generation manifold has permutation symmetry up to relabeling of the three family-charge sectors selected by Theorem R.3.4 and realized by Proposition R.3.5.1a; Proposition R.4.2 records the compatible $D_4$ triality $S_3$ orbit without replacing the family-charge derivation
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
\mathfrak A_\eta
=
\left(
W_{\mathrm{EW}},
A_{\mathrm{EW}},
\mathfrak R_{\mathrm{EW}},
\mathfrak C_{\mathrm{fl}}^{\circ},
\Gamma_{\mathrm{fl}},
\mathcal L_{\mathrm{Berry}},
D_W,
\Delta N_{CS},
\eta_{\partial W},
h_{\partial W},
\mathfrak o_{\mathrm{KMS}},
B_{\mathrm{ret}},
\mathcal N_{\mathrm{APS}},
I_{CP},
I_{tr},
\mathfrak h_\eta
\right)
\tag{Y.6.1a.1}
$$
where:

1. $W_{\mathrm{EW}}$ is a compact oriented four-dimensional Euclidean electroweak interpolation cobordism with APS boundary $\partial W_{\mathrm{EW}}=\Sigma_i\cup\Sigma_f$.

2. $A_{\mathrm{EW}}$ is the determinant-compatible electroweak connection on the same global gauge form and hypercharge lattice used by the accepted electroweak threshold record.

3. $\mathfrak R_{\mathrm{EW}}$ is an accepted electroweak threshold certificate of Definition T.78.10, or an accepted equivalent spectral-action/torus threshold certificate with the same normalization and forward lock. It fixes the finite sector projections, Dynkin-index map, gauge normalization, and threshold finite parts entering the baryogenesis calculation.

4. $\mathfrak C_{\mathrm{fl}}^{\circ}$ is either the accepted flavor/CP certificate $\mathfrak C_{\mathrm{fl}}$ of Definition T.79.4, the accepted joint threshold-flavor certificate $\mathfrak J_{\mathrm{RHG-fl}}$, or an explicitly registered flavor-independent CP certificate $\mathfrak C_{CP}^{0}$ proving a nonzero CP-odd source without using masses, mixings, or phases as targets. In the absence of $\mathfrak C_{CP}^{0}$ the Appendix Y numerical baryogenesis route is downstream of the accepted threshold and flavor rows.

5. $\Gamma_{\mathrm{fl}}:W_{\mathrm{EW}}\to\mathrm{Gr}(2,8)$ is the retained flavor-generation branch map pulled from $\mathfrak C_{\mathrm{fl}}^{\circ}$, and $\mathcal L_{\mathrm{Berry}}$ is its determinant-line Berry line with orientation already fixed by the flavor certificate.

6. $D_W$ is the chiral retained Dirac operator on $W_{\mathrm{EW}}$, twisted by $A_{\mathrm{EW}}$ and by $\Gamma_{\mathrm{fl}}^*\mathcal L_{\mathrm{Berry}}$, with APS boundary conditions. Its determinant line, boundary zero-mode convention, and finite-part convention are part of the same certificate and are not selected from $\eta_B$.

7. $\Delta N_{CS}\in\mathbb Z$ is the oriented Chern-Simons change of the sphaleron interpolation in the gauge normalization fixed by $\mathfrak R_{\mathrm{EW}}$.

8. $\eta_{\partial W}=\eta(D_{\Sigma_f})-\eta(D_{\Sigma_i})$ and $h_{\partial W}=\dim\ker D_{\Sigma_f}-\dim\ker D_{\Sigma_i}$ are the oriented APS boundary eta and kernel corrections, computed with the same finite-part convention as $D_W$.

9. $\mathfrak o_{\mathrm{KMS}}\in\{+1,-1\}$ is the PCE/KMS time orientation of the determinant line.

10. $B_{\mathrm{ret}}$ is the finite baryon-number generator on the retained chiral matter quotient. It is a diagonal finite operator on the accepted matter package and includes the response-null quotient, global gauge form, and anomaly-bordism orientation used by the electroweak and flavor certificates.

11. $\mathcal N_{\mathrm{APS}}=(\mathcal N_{CP},\mathcal N_B,\mathcal D_{\mathrm{Dyn}})$ is the coefficient-normalization ledger: $\mathcal D_{\mathrm{Dyn}}$ maps the finite sector projections to Dynkin indices, $\mathcal N_{CP}$ normalizes the CP-odd topological-density coefficient, and $\mathcal N_B$ normalizes the baryon-number spectral-flow coefficient.

12. The Berry-to-topological-density matching index is
$$
I_{CP}
=
\mathcal N_{CP}
\left[
\frac{1}{\Delta N_{CS}}
\left(
\int_{W_{\mathrm{EW}}}
\hat A(R)\operatorname{ch}\left(F_{\mathrm{EW}}\oplus\Gamma_{\mathrm{fl}}^*F_{\mathcal L_{\mathrm{Berry}}}\right)\big|_{[4]}
-
\frac{\eta_{\partial W}+h_{\partial W}}2
\right)
\right].
\tag{Y.6.1a.2}
$$

13. The baryon-number transport index is
$$
I_{tr}
=
\mathcal N_B
\frac{\operatorname{SF}_{B_{\mathrm{ret}}}(D_W)}{N_g\Delta N_{CS}},
\tag{Y.6.1a.3}
$$
where $\operatorname{SF}_{B_{\mathrm{ret}}}(D_W)$ is the $B_{\mathrm{ret}}$-weighted spectral flow of the spatial APS family.

14. $\mathfrak h_\eta$ is the source-exhaustion and forward-lock entry. It records that the CP-odd source, baryon generator, Dynkin-index map, determinant orientation, eta finite part, and normalization factors were fixed before comparison with $\eta_B$ and that no source is counted again in the electroweak threshold, flavor, sphaleron, washout, or photon-normalization records.

The certificate is accepted exactly when all entries above are finite, the APS boundary problem is Fredholm, the anomaly/bordism signs agree with the determinant-line orientation, and $\mathfrak h_\eta$ proves overlap compatibility with $\mathfrak R_{\mathrm{EW}}$ and $\mathfrak C_{\mathrm{fl}}^{\circ}$.

**Theorem Y.6.1b (APS-Eta Transport Gate).** On a baryogenesis branch carrying an accepted APS-eta certificate $\mathfrak A_\eta$ of Definition Y.6.1a, the CP matching coefficient and the baryon transport coefficient are
$$
\chi_{CP}=I_{CP},
\qquad
\chi_{tr}=I_{tr}.
\tag{Y.6.1b.1}
$$
The canonical unit-response branch is theorem-level exactly when
$$
I_{CP}=1,
\qquad
I_{tr}=1,
\qquad
\mathfrak o_{\mathrm{KMS}}
\operatorname{or}(W_{\mathrm{EW}})
\operatorname{or}(\mathcal L_{\mathrm{Berry}})
=+1.
\tag{Y.6.1b.2}
$$
If the accepted certificate gives different values, those values replace the unit coefficients in the baryogenesis transport equation. If no accepted $\mathfrak A_\eta$ exists, the Berry-to-density coefficient, the determinant-line sign, and the baryon-number spectral-flow normalization are irreducible baryogenesis branch data.

*Proof.* Items 1--8 of Definition Y.6.1a give a Fredholm APS boundary problem for the retained chiral Dirac operator on the electroweak cobordism. The APS index theorem gives the bulk Chern-character term minus the eta/kernel boundary correction. Projecting this index through the Berry determinant line and dividing by the accepted Chern-Simons charge gives (Y.6.1a.2), so the CP-odd topological-density coefficient is $I_{CP}$. The baryon-number anomaly is the same spectral-flow statement evaluated with the finite generator $B_{\mathrm{ret}}$ and normalized by the accepted $N_g\Delta N_{CS}$ denominator, giving (Y.6.1a.3). The determinant-line contribution to the sign is the product of the cobordism, Berry-line, and KMS orientations, proving (Y.6.1b.2). Since every normalization and orientation is an entry of the accepted finite record, changing any one after comparison changes the branch rather than retuning the same source. ∎

**Definition Y.6.1c (APS-Kubo Baryon Transport Certificate).** An APS-Kubo baryon transport certificate is a finite record
$$
\mathfrak C_B^{\mathrm{APSK}}
=
\left(
\mathfrak A_\eta,
\mathfrak R_{\mathrm{EW}},
\mathfrak C_{\mathrm{fl}}^{\circ},
B_{\mathrm{ret}},
\theta_{\mathrm{PU}},
\dot\theta_{\mathrm{PU}},
\Gamma_{CS},
\Gamma_{\mathrm{wash}},
W_{\mathrm{PU}},
s,
\mathcal N_\gamma,
\mathcal N_B,
[t_i,t_f],
Y_B(t_i),
\mathcal Q_B,
\mathcal R_B^{\mathrm{APSK}},
\chi_{\mathrm{APSK}}
\right)
\tag{Y.6.1c.1}
$$
where:

1. $\mathfrak A_\eta$ is an accepted APS-eta certificate of Definition Y.6.1a, and its threshold and CP entries agree with the displayed $\mathfrak R_{\mathrm{EW}}$ and $\mathfrak C_{\mathrm{fl}}^{\circ}$.

2. $B_{\mathrm{ret}}$ is the finite baryon-number generator of Definition Y.6.1a and fixes the baryon functional used in the transport equation.

3. $\theta_{\mathrm{PU}}(t)$ is a continuous determinant-line CP phase lift on the retained transport window,
$$
\theta_{\mathrm{PU}}(t)
=
\frac12\eta(D_{\partial X,t})
+
\int_{\gamma_t}\mathcal A_{\mathrm{Berry}}
\quad \mathrm{mod}\ 2\pi,
\tag{Y.6.1c.2}
$$
and $\dot\theta_{\mathrm{PU}}$ is the derivative in the accepted clock convention. Both are fixed by $\mathfrak C_{\mathrm{fl}}^{\circ}$ or by the accepted flavor-independent CP substitute.

4. $\Gamma_{CS}(t)$ is the finite Kubo Chern-Simons diffusion ledger. It consists of finite volume/time windows $(V_j,\tau_j)$, estimator values,
$$
\Gamma_{CS,j}(t)
=
\frac{1}{V_j\tau_j}
\left\langle
\left(N_{CS}(t+\tau_j)-N_{CS}(t)\right)^2
\right\rangle_j,
\tag{Y.6.1c.3}
$$
and a certified tail interval whose limit is the accepted $\Gamma_{CS}(t)$. The branch may not replace the window, estimator, or tail bound after dependent threshold or flavor rows are fixed.

5. $\Gamma_{\mathrm{wash}}(t)\ge0$ is the washout/freeze-out profile on $[t_i,t_f]$.

6. $W_{\mathrm{PU}}(t)$ is the CP Kubo pairing from the determinant-line phase source to the finite baryon-number generator. It includes the susceptibility, chemical-potential conversion, and sphaleron-generator normalization not already contained in $\Gamma_{CS}$.

7. $s(t)>0$ is the entropy density convention, $\mathcal N_\gamma(t_f)=s(t_f)/n_\gamma(t_f)$ is the photon-normalization factor, and $\mathcal N_B$ is the coefficient normalization inherited from $\mathcal N_{\mathrm{APS}}$.

8. $[t_i,t_f]$ is the transport window and $Y_B(t_i)$ is the initial baryon-to-entropy vector or scalar fixed by the branch.

9. The retained transport equation is
$$
\frac{dY_B}{dt}
+
\Gamma_{\mathrm{wash}}(t)Y_B(t)
=
\mathcal N_B
\frac{W_{\mathrm{PU}}(t)\dot\theta_{\mathrm{PU}}(t)\Gamma_{CS}(t)}{s(t)},
\qquad
Y_B(t_i)\ \text{fixed}.
\tag{Y.6.1c.4}
$$

10. $\mathcal Q_B$ is the quadrature and tail ledger for the time or temperature integral, including endpoint, interpolation, and Kubo-tail errors.

11. $\mathcal R_B^{\mathrm{APSK}}$ is the propagated residual interval for all finite approximations and certified tails.

12. $\chi_{\mathrm{APSK}}$ records source exhaustion, no target-fitting, and no double counting with electroweak threshold, flavor, sphaleron, washout, photon-normalization, or future residual rows.

**Theorem Y.6.1d (APS-Kubo Transport Lock).** On a branch carrying an accepted $\mathfrak C_B^{\mathrm{APSK}}$, the baryon-to-photon ratio is the certified interval
$$
\eta_B
\in
\mathcal N_\gamma(t_f)
\left[
Y_B(t_i)e^{-\int_{t_i}^{t_f}\Gamma_{\mathrm{wash}}(u)\,du}
+
\int_{t_i}^{t_f}
\mathcal N_B
\frac{W_{\mathrm{PU}}(t)\dot\theta_{\mathrm{PU}}(t)\Gamma_{CS}(t)}{s(t)}
\exp\left[-\int_t^{t_f}\Gamma_{\mathrm{wash}}(u)\,du\right]dt
\right]
+
\mathcal R_B^{\mathrm{APSK}}.
\tag{Y.6.1d.1}
$$
If the branch uses temperature as a monotone clock with
$$
dt=-\frac{dT}{H(T)T},
\tag{Y.6.1d.2}
$$
then the source term in (Y.6.1d.1) is equivalently
$$
\int_{T_f}^{T_i}
\mathcal N_B
\frac{W_{\mathrm{PU}}(T)\dot\theta_{\mathrm{PU}}(T)\Gamma_{CS}(T)}{s(T)H(T)T}
\exp\left[-\int_{T_f}^{T}\frac{\Gamma_{\mathrm{wash}}(T')}{H(T')T'}\,dT'\right]dT.
\tag{Y.6.1d.3}
$$
Thus the CP source, APS index, sphaleron diffusion, transport coefficient, washout, entropy density, photon normalization, and residual interval are one finite record. A scalar product formula is theorem-level only when it is derived as the evaluated reduction of (Y.6.1d.1) with the same $\mathcal Q_B$ and $\mathcal R_B^{\mathrm{APSK}}$.

*Proof.* Equation (Y.6.1c.4) is a finite first-order linear transport equation with fixed coefficients on the accepted window. Multiplication by the integrating factor $\exp(\int_{t_i}^t\Gamma_{\mathrm{wash}})$ gives (Y.6.1d.1) after integration and multiplication by the fixed photon-normalization factor. The temperature form is the change of variables (Y.6.1d.2). The quadrature ledger and Kubo-tail certificate propagate exactly into $\mathcal R_B^{\mathrm{APSK}}$. Since $\mathfrak A_\eta$, $\mathfrak R_{\mathrm{EW}}$, and $\mathfrak C_{\mathrm{fl}}^{\circ}$ are entries of the same certificate, the output is downstream of the accepted threshold and CP/flavor records unless the explicit substitute $\mathfrak C_{CP}^{0}$ has already discharged flavor independence. ∎

**Corollary Y.6.1e (Product-Formula Reduction of the APS-Kubo Ledger).** If the APS-Kubo certificate has a factorized transport window on which
$$
\mathcal N_\gamma(t_f)\frac1{s(t_f)}
\int_{t_i}^{t_f}
W_{\mathrm{PU}}(t)\dot\theta_{\mathrm{PU}}(t)\Gamma_{\mathrm{CS}}(t)
\exp\left[-\int_t^{t_f}\Gamma_{\mathrm{wash}}(u)\,du\right]dt
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B},
\tag{Y.6.1e.1}
$$
then Theorem Y.9 follows from Theorem Y.6.1d with the same certified interval. If the equality (Y.6.1e.1) is not supplied, the integral (Y.6.1d.1) replaces the product formula for theorem-level use.

*Proof.* Substitute (Y.6.1e.1) into (Y.6.1d.1). This gives the master formula of Theorem Y.9. If (Y.6.1e.1) is absent, Theorem Y.6.1d still supplies the unique transport output, while the product decomposition is not licensed. ∎

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
\alpha_{em}^{-1}(\text{Thomson})=\alpha^{-1}_{0}+R_\alpha,
\qquad
\alpha^{-1}_{0}=137.03609205522863\ldots
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
| $N_{\mathrm{vis}}^{\min}=2^{K_0}$ | 8 | Theorem 15 |
| $d_0$ | 8 | Theorem 23; Theorem Z.2 |
| $(a, b)$ | $(2, 6)$ | Definition 15a |
| $M = 2ab$ | 24 | Theorem Z.5 |
| $k=M/2$ | 12 | Golay code dimension on the predictive-recovery MacWilliams branch (Def Z.13b.0; Thm Z.13b.0a; Thm Z.13b) |
| $\kappa_{EW}$ | 38.5 | Theorem T.5 |
| $\varepsilon$ | $\ln 2 = 0.6931$ | Theorem 31 |
| $N_g$ | 3 | Theorem R.3.4 |
| $\delta$ | $66.7°$ | Theorem T.56 |
| $\alpha_{em}^{-1}$(Thomson) | $\alpha^{-1}_{0}=137.03609205522863\ldots$; $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$ | Theorem Z.26; Definition Z.27.11a; Theorem Z.27.11j.1 |
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
$$
\boxed{\eta_B^{\mathrm{val}}=(6.2\pm0.5)\times10^{-10}}
$$
The theorem-level row is the finite transport image fixed by $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or the APS-Kubo certificate $\mathfrak C_B^{\mathrm{APSK}}$ of Definition Y.6.1c and Theorem Y.6.1d.

---

## Y.8 Comparison with Observation

### Y.8.1 Primary Result

$$
\eta_B^{\mathrm{val}}=(6.2\pm0.5)\times10^{-10}
$$

**Observational Value** [Planck Collaboration 2020a]:
$$
\eta_B^{\mathrm{obs}}=(6.12\pm0.04)\times10^{-10}
$$

| Quantity | Validation run | Observation | Status |
|:---------|:--------------:|:-----------:|:-------|
| $\eta_B$ | $(6.2\pm0.5)\times10^{-10}$ | $(6.12\pm0.04)\times10^{-10}$ | model/threshold branch consistent; theorem-level only after $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or $\mathfrak C_B^{\mathrm{APSK}}$ |

The validation-run value is consistent with observation within combined uncertainties. The stated uncertainty arises from external Standard Model and thermal inputs ($c_{sph}$, $f_{wash}$, $\alpha_W$); its Appendix T gauge-threshold component remains status-limited by Theorem T.78.5.

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
| $\alpha_{em}^{-1} = \alpha^{-1}_{0}+R_\alpha$ with $\alpha^{-1}_{0}=137.03609205522863\ldots$ | closed-form core; residual-gated comparison | Capacity saturation and interface/sinc core (Theorem Z.26); residual gate (Definition Z.27.11a; Theorem Z.27.11j.1) |
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

**Theorem Y.11.2a (Finite Abelian Group-Step Exponent Template).** Let
$$
\mathfrak D_G=(\mathcal M,G,\mu,\widehat G,\kappa_{\mathcal M},\mathcal O_{\mathcal M})
$$
be a finite abelian PCE reduction datum on a retained saddle sector $\mathcal M$, where $G$ is finite abelian of order $n=|G|$, $\mu$ is the reduced PCE measure, $\widehat G$ is the character group, and
$$
\mathcal O_{\mathcal M}=A_{\mathcal M}e^{-\kappa_{\mathcal M}}(1+o(1))
$$
is the parent observable on the PCE-exponential branch. For $\chi\in\widehat G$, let
$$
P_\chi=\frac1{|G|}\sum_{g\in G}\overline{\chi(g)}U_g
$$
be the character projector whenever the action is measure-preserving.

Assume the following branch hypotheses:

1. the $G$-action is free on the retained leading saddle support, or all fixed-locus contributions are response-null;
2. the reduced PCE measure is $G$-invariant;
3. the leading saddle fiber carries the regular $G$-representation and the leading PCE complexity form is scalar on that regular fiber;
4. the character projection has nonzero leading coefficient;
5. the observable uses exponential placement rather than prefactor, variance, or normalization placement;
6. (**Equal-exponent decomposition**) the parent exponential weight factorizes additively along the $G$-orbit into $|G|$ equal PCE-exponential components,
$$
\kappa_{\mathcal M}=\sum_{g\in G}\kappa_g,
\qquad
\kappa_g=\frac{\kappa_{\mathcal M}}{|G|}\quad\text{for every }g\in G,
$$
and the retained character observable selects one such normalized component at exponential order rather than at the prefactor or normalization level.

Then every retained nonzero character component has
$$
\kappa_\chi=\frac{\kappa_{\mathcal M}}{|G|},
$$
and
$$
\mathcal O_\chi
=
A_\chi e^{-\kappa_{\mathcal M}/|G|}(1+o(1)).
$$
For $G=\mathbb Z_2$, this reduces to the CP half-step law
$$
\kappa_{CP}=\frac{\kappa_{EW}}2.
$$
The load-bearing hypotheses are the regular-isotypic equal split, the equal-exponent decomposition (hypothesis 6), the nonzero leading projection, and the exponential-placement branch. Without hypothesis 6, character projection generically changes amplitudes and prefactors while leaving the saddle exponent unchanged; the $1/|G|$ exponent step is not automatic from group theory alone. Group theory alone does not promote a physical sector.

**Theorem Y.11.2b (Finite Isotropic Character-Projection Template).** Let $V$ carry one retained regular finite abelian $G$-fiber of order $|G|=n$, and let $X$ be a mean-zero fluctuation with covariance isotropic on that regular fiber and total RMS normalization
$$
\mathbb E\lVert X\rVert^2=\sigma_{\mathrm{tot}}^2.
$$
Then projection onto a normalized complex character line satisfies
$$
\mathbb E\lVert P_\chi X\rVert^2=\frac{\sigma_{\mathrm{tot}}^2}{|G|},
\qquad
\lVert P_\chi X\rVert_{\mathrm{RMS}}
=
\frac{\lVert X\rVert_{\mathrm{RMS}}}{\sqrt{|G|}}.
$$
If the physical field is real, $\chi\ne\bar\chi$, and the observable retains the full conjugate pair $V_\chi\oplus V_{\bar\chi}$, the RMS factor is
$$
\sqrt{\frac{2}{|G|}},
$$
not $|G|^{-1/2}$. For self-conjugate characters, the factor is determined by the retained real component dimension rather than by doubling. Therefore a claimed $1/\sqrt{|G|}$ physical factor requires a certificate that the observable selects one normalized complex character line, one oriented real projection direction, or an equivalent response-normalized component.

This RMS projection law is distinct from Theorem Y.11.2a. It does not imply
$$
\kappa_\chi=\frac{\kappa_{\mathcal M}}{|G|},
$$
and the exponent-step law does not imply an RMS factor.

**Proposition Y.11.2c (Certificate-Pending Triality Route for a Majorana Projection Factor).** A triality route to a Majorana coefficient is certificate-pending unless a finite record
$$
\mathfrak C_{\mathbb Z_3\text{-Maj}}
=(\rho_3,\mathcal M_\nu,\mu_\nu,V_\nu,K_\nu,\mathcal B_\nu)
$$
verifies all of the following:

1. an order-three lift $\rho_3$ acts on the retained Majorana saddle package and stabilizes $\mathcal M_\nu$;
2. fixed loci are absent on the retained support or response-null with no leading quotient-stack correction;
3. $\mu_\nu$ is triality-invariant;
4. $V_\nu$ carries a regular isotropic $\mathbb Z_3$ fiber at leading order;
5. the physical Weinberg-overlap observable selects one normalized nontrivial character line or equivalent oriented response component, not the whole real conjugate pair;
6. the branch-placement record $\mathcal B_\nu$ proves that the RMS factor lands on the Gaussian exponent coefficient.

Only under these conditions does Theorem Y.11.2b give
$$
\alpha_\nu=\frac{\alpha_{\mathrm{UV}}}{\sqrt3}=\frac{\sqrt3}{2}
$$
when $\alpha_{\mathrm{UV}}=3/2$. The equality is not selected merely because it numerically matches a target. It is falsified if the triality lift fails, if non-null fixed points contribute, if the real observable keeps $\chi\oplus\bar\chi$, or if the projection factor lands in a prefactor, distance variable, or covariance instead of the exponent coefficient.

A global free $\mathbb Z_3$ action on all of $\mathrm{Gr}_{\mathbb C}(2,8)$ is obstructed because
$$
\chi(\mathrm{Gr}_{\mathbb C}(2,8))=\binom82=28
$$
is not divisible by $3$. Thus any free-action assertion must be restricted to the retained Majorana saddle support or accompanied by a fixed-locus response-null audit.

**Corollary Y.11.3** (Certified Half-Step Origin). *On the hypotheses of Theorem Y.11.2, equivalently the finite group-step template of Theorem Y.11.2a with $G=\mathbb Z_2$, the denominator $2$ in $\kappa_B=\kappa_{EW}/2$ is exact on that branch. It reflects both the order of the CP action and the equal-exponent exponential-placement certificate. It is not a consequence of group order alone.*

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

**Remark Y.11.7a.0 (Anchor to the Global Ledger).** Definition Y.11.7a supplies the local strict PPI/PCE certificate of the baryon asymmetry row in Convention P.14.1k. Theorem Y.11.7b is the local determinacy theorem and Definition Y.11.7e refines the certificate to the finite transport-integral form. Definition Y.6.1c and Theorem Y.6.1d supply the APS-Kubo transport route. An accepted $\mathfrak C_B$, accepted $\mathfrak C_B^{\mathrm{tr}}$, or accepted $\mathfrak C_B^{\mathrm{APSK}}$ closes the row by the corresponding finite transport certificate.

**Definition Y.11.7a (Baryogenesis Transport Certificate).** A baryogenesis transport certificate is a finite record
$$
\mathfrak C_B
=
\left(
\mathfrak R_{\mathrm{EW}},
\mathfrak C_{\mathrm{fl}}^{\circ},
\mathcal G_B,
\mathcal S_{\mathrm{sph}},
\mathcal A_{\mathrm{APS}},
\mathcal P_{CP},
\mathcal K_{CP},
\mathcal W_{\mathrm{wash}},
\mathcal T_B,
\mathcal N_\gamma,
\mathcal N_{\mathrm{coeff}},
\mathcal R_B,
\mathfrak O_B,
\chi_B
\right)
\tag{Y.11.7a.1}
$$
fixed before comparison with $\eta_B$, where:

1. $\mathfrak R_{\mathrm{EW}}$ is an accepted electroweak threshold record: an accepted $\mathfrak R_{\mathrm{RHG}}$, accepted $\mathfrak C_{\mathrm{tor}}$, accepted spectral-action threshold record, or accepted equivalent satisfying Definition T.78.10.

2. $\mathfrak C_{\mathrm{fl}}^{\circ}$ is an accepted $\mathfrak C_{\mathrm{fl}}$, accepted $\mathfrak J_{\mathrm{RHG-fl}}$, or accepted flavor-independent CP certificate $\mathfrak C_{CP}^{0}$. Without $\mathfrak C_{CP}^{0}$ the source remains downstream of the flavor/CP row.

3. $\mathcal G_B$ is the finite baryon-number generator on the retained matter quotient, including global gauge form, hypercharge normalization, anomaly-bordism orientation, and response-null quotient.

4. $\mathcal S_{\mathrm{sph}}$ is the sphaleron generator and Chern-Simons transition ledger, including the Dynkin-index map and the finite convention for $\Delta N_{CS}$.

5. $\mathcal A_{\mathrm{APS}}$ is either the accepted APS-eta record $\mathfrak A_\eta$ of Definition Y.6.1a or the statement that the chosen baryogenesis branch does not use an APS source.

6. $\mathcal P_{CP}$ is the determinant-line CP phase profile, with phase origin, orientation, derivative convention, and finite interpolation record.

7. $\mathcal K_{CP}$ is the CP Kubo pairing that maps $\mathcal P_{CP}$ and $\mathcal G_B$ to a baryon-number source.

8. $\mathcal W_{\mathrm{wash}}$ is the washout and freeze-out profile, including the finite transport window and tail bound.

9. $\mathcal T_B$ is the finite transport map from source profile to final baryon-to-entropy output.

10. $\mathcal N_\gamma$ is the photon normalization and $\mathcal N_{\mathrm{coeff}}$ is the coefficient-normalization ledger for entropy, sphaleron, anomaly, and Dynkin-index conventions.

11. $\mathcal R_B$ is the certified residual interval for threshold, CP, Kubo, washout, quadrature, and normalization errors.

12. $\mathfrak O_B$ is the no-double-counting audit proving that no contribution is simultaneously assigned to the electroweak threshold row, flavor row, APS source, sphaleron generator, washout map, photon normalization, or any future residual entry.

13. $\chi_B$ records that no entry is chosen from the observed baryon asymmetry or from a downstream validation tuple.

The certificate is accepted exactly when every response-active contribution to $\eta_B$ is assigned to one named source in (Y.11.7a.1), every overlap map in $\mathfrak O_B$ commutes, and the only residual uncertainty is the interval $\mathcal R_B$.

**Theorem Y.11.7b (Certified Baryogenesis Determinacy and Branch Classification).** If $\mathfrak C_B$ is accepted, then the Appendix Y baryon asymmetry is the deterministic interval
$$
\eta_B
\in
\mathcal N_\gamma\,\mathcal T_B
\left(
\mathcal K_{CP}(\mathcal P_{CP},\mathcal G_B,\mathcal S_{\mathrm{sph}})
\right)
+
\mathcal R_B.
\tag{Y.11.7b.1}
$$
If no accepted $\mathfrak C_B$ exists, the surviving admissible baryogenesis branches are classified by the finite labels
$$
\left(
\mathfrak R_{\mathrm{EW}},
\mathfrak C_{\mathrm{fl}}^{\circ},
\mathcal G_B,
\mathcal S_{\mathrm{sph}},
\mathcal A_{\mathrm{APS}},
\mathcal P_{CP},
\mathcal K_{CP},
\mathcal W_{\mathrm{wash}},
\mathcal N_\gamma,
\mathcal N_{\mathrm{coeff}}
\right),
\tag{Y.11.7b.2}
$$
and the numerical value of $\eta_B$ is model-layer for every branch whose label is not fully certified.

*Proof.* Definition Y.11.7a fixes the threshold, CP/flavor, anomaly, sphaleron, transport, washout, photon, and coefficient-normalization entries before comparison. Therefore the finite composition in (Y.11.7b.1) is single-valued up to the certified interval $\mathcal R_B$. The overlap audit prevents assigning the same source twice or moving a source between ledgers after the fact. If any entry in (Y.11.7a.1) is absent, changing that entry while preserving all already accepted rows gives a distinct admissible finite transport branch with a different possible $\eta_B$, so Theorem P.14.1f gives non-identifiability and the classification labels (Y.11.7b.2) are irreducible branch data. ∎

**Corollary Y.11.7c (No Baryogenesis Back-Fitting).** Changing the sphaleron coefficient, washout integral, CP profile, threshold input, photon normalization, coefficient normalization, no-double-counting audit, or uncertainty interval after comparison with $\eta_B$ defines a new transport branch and cannot confirm the original Appendix Y numerical branch.

*Proof.* Each listed item is part of $\mathfrak C_B$. The forward-lock condition $\chi_B$ forbids choosing it from the target value. ∎

**Corollary Y.11.7d (Baryogenesis Numerical Dependence on Threshold and CP Certificates).** The Appendix Y baryogenesis number is theorem-level only if the electroweak threshold record, flavor/CP certificate or accepted flavor-independent CP substitute, sphaleron generator, APS/Kubo source, washout integral, photon normalization, coefficient normalization, no-double-counting audit, and uncertainty interval are all fixed in an accepted $\mathfrak C_B$. The existence of $N_g=3$ and nonzero CP capacity is not by itself a numerical baryogenesis prediction.

*Proof.* Theorem Y.11.7b states that $\eta_B$ is the deterministic image of $\mathfrak C_B$. Exact $N_g=3$ and the existence of CP-active structure determine qualitative admissibility of the channel, while the magnitude requires the finite records listed in Definition Y.11.7a. ∎

**Definition Y.11.7e (Finite Baryogenesis Transport Integral Certificate).** A finite baryogenesis transport integral certificate is a refinement of $\mathfrak C_B$:
$$
\mathfrak C_B^{\mathrm{tr}}
=
\left(
\mathfrak C_B,
[t_i,t_f],
\mathcal H_B,
Y_B(t_i),
\mathcal L_B(t),
S_{CP}(t),
W_B(t),
\mathcal U_B,
\mathcal Q_B,
\mathcal N_\gamma,
\mathcal R_B^{\mathrm{tr}},
\chi_B^{\mathrm{tr}}
\right)
\tag{Y.11.7e}
$$
where:

1. $\mathcal H_B$ is the finite retained baryon-transport state space and quotient by response-null baryon labels.

2. $[t_i,t_f]$ is the certified electroweak transport window.

3. $Y_B(t_i)$ is the fixed initial baryon vector or scalar.

4. $\mathcal L_B(t)$ is the finite baryon-number transport generator on $\mathcal H_B$; it includes the reversible transport part and any linear washout/freeze-out part not represented separately by $W_B(t)$.

5. $S_{CP}(t)$ is the determinant-line CP source profile produced by $\mathcal K_{CP}$.

6. $W_B(t)$ is the nonnegative scalar washout/freeze-out survival profile when the branch uses a scalar survival factor; if washout is already contained in $\mathcal L_B(t)$, then $W_B(t)=0$ and this entry is marked response-null.

7. $\mathcal U_B(t_2,t_1)$ is the time-ordered propagator generated by $\mathcal L_B(t)$.

8. $\mathcal Q_B$ is the quadrature and tail-bound ledger for all time integrals and finite Kubo sums.

9. $\mathcal N_\gamma$ is the photon-normalization convention inherited from $\mathfrak C_B$.

10. $\mathcal R_B^{\mathrm{tr}}$ is the propagated residual interval.

11. $\chi_B^{\mathrm{tr}}$ records that no transport entry is selected using the observed baryon asymmetry.

The transport solution is
$$
Y_B(t_f)
=
\mathcal U_B(t_f,t_i)Y_B(t_i)
+
\int_{t_i}^{t_f}
\mathcal U_B(t_f,t)
S_{CP}(t)
\exp\left[-\int_t^{t_f}W_B(u)\,du\right]
\,dt.
\tag{Y.11.7e.1}
$$
The propagator is
$$
\mathcal U_B(t_2,t_1)
=
\mathcal T\exp
\left(
\int_{t_1}^{t_2}\mathcal L_B(s)\,ds
\right).
\tag{Y.11.7e.2}
$$

**Theorem Y.11.7f (Certified Baryogenesis Transport Determinacy).** If $\mathfrak C_B^{\mathrm{tr}}$ is accepted, then the baryon asymmetry satisfies
$$
\eta_B
\in
\mathcal N_\gamma\,\nu_B\!\bigl(Y_B(t_f)\bigr)
+
\mathcal R_B^{\mathrm{tr}},
\tag{Y.11.7f.1}
$$
where $\nu_B$ is the finite baryon-number readout functional fixed by $\mathcal G_B$. The interval in (Y.11.7f.1) is the only theorem-level numerical output of the transport branch.

*Proof.* The finite state space, initial condition, generator, CP source, washout profile, photon normalization, and readout functional are fixed entries of $\mathfrak C_B^{\mathrm{tr}}$. Finite-dimensional nonautonomous linear transport therefore has the unique time-ordered solution (Y.11.7e.1). The quadrature and Kubo-tail ledger supplies the residual interval $\mathcal R_B^{\mathrm{tr}}$. Applying the fixed readout and photon normalization gives (Y.11.7f.1). ∎

**Corollary Y.11.7g (No Transport-Factor Replacement).** The product form
$$
0.282\cdot0.9997\cdot0.63\cdot3.47\times10^{-9}
$$
is theorem-level only if it is the evaluated reduction of an accepted $\mathfrak C_B^{\mathrm{tr}}$ or an accepted certificate explicitly proving equivalence to that transport integral. Otherwise it remains the Appendix Y transport-branch value.

*Proof.* Theorem Y.11.7f defines theorem-level transport closure through the finite generator, CP source, washout profile, quadrature ledger, and residual interval. A scalar product not derived from those entries does not instantiate the transport equation. If a factor is replaced after comparison, $\chi_B^{\mathrm{tr}}$ fails and the replacement is a new branch. ∎

**Theorem Y.11.7h (Baryogenesis Certificate Classification and Current Status).** The theorem-level baryogenesis row is accepted exactly on one finite record
$$
\mathfrak C_B,
\qquad
\mathfrak C_B^{\mathrm{tr}},
\qquad
\mathfrak C_B^{\mathrm{APSK}},
\tag{Y.11.7h.1}
$$
or on an equivalent completed spectral tuple proving equality to one of these records. Such a record must fix, before comparison, the electroweak threshold record, flavor/CP record or explicitly registered flavor-independent CP substitute, sphaleron generator, APS eta/index data when used, CP Kubo pairing, finite baryon-number generator, transport window, CP source, washout/freeze-out profile, quadrature and tail ledger, photon normalization, coefficient normalization, residual interval, overlap audit, and forward-lock entry.

On an accepted finite-transport branch the certified interval is
$$
\eta_B
\in
\mathcal N_\gamma
\left[
\nu_B\!\left(
\mathcal U_B(t_f,t_i)Y_B(t_i)
+
\int_{t_i}^{t_f}
\mathcal U_B(t_f,t)S_{CP}(t)e^{-W_B(t)}\,dt
\right)
\right]
+
\mathcal R_B^{\mathrm{tr}},
\tag{Y.11.7h.2}
$$
with $\nu_B$ the branch-fixed baryon-number readout. On an accepted APS-Kubo branch the certified interval is the interval of Theorem Y.6.1d after the same photon-normalization and overlap audit. A product formula is theorem-level only when Corollary Y.6.1e or Corollary Y.11.7g proves that it is the evaluated reduction of one of these finite intervals.

If no record in (Y.11.7h.1) is accepted, Appendix Y supplies the validation-run value
$$
\eta_B^{\mathrm{val}}=(6.2\pm0.5)\times10^{-10}
\tag{Y.11.7h.3}
$$
but not a theorem-level certified interval. The irreducible branch coordinates are precisely the missing entries among threshold input, CP/flavor source, sphaleron normalization, APS/Kubo coefficient, finite transport generator, washout and freeze-out profile, photon normalization, quadrature/tail ledger, residual interval, and no-double-counting audit.

*Proof.* Definitions Y.6.1c, Y.11.7a, and Y.11.7e are the only Appendix Y finite baryogenesis routes. When one is accepted, the finite nonautonomous transport equation or APS-Kubo integral is single-valued up to its stated residual interval. If a listed entry is absent, two admissible completions can agree on all accepted upstream data while differing in the absent CP, transport, washout, photon, or residual datum, and hence in $\eta_B$. Theorem P.14.1f blocks theorem-level promotion in that case. The overlap audit prevents double counting with electroweak thresholds, flavor determinants, hypercharge, APS boundary terms, sphaleron negative modes, thermal finite parts, primordial determinants, vacuum determinant entries, or final spectral calibration symbols. ∎

## Y.11 Baryogenesis Derivation Chain Summary

The complete logical chain from $K_0 = 3$ to $\eta_B$:

$$\boxed{
\begin{aligned}
K_0 = 3 &\xrightarrow{\text{Thm 15}} N_{\mathrm{vis}}^{\min}=2^{K_0}=8 \xrightarrow{\text{Thm 23/Z.2}} d_0 = 8 \\[4pt]
&\xrightarrow{\text{Thm Z.1}} a = 2, \quad b = d_0 - a = 6 \\[4pt]
&\xrightarrow{\text{Thm Z.5}} M = 2ab = 24, \quad k = 12 \\[4pt]
&\xrightarrow{\text{Thm T.5}} \kappa_{EW} = \frac{bk}{2} + \dim(G/H) - \frac{m}{2} = 38.5 \\[4pt]
&\xrightarrow{\text{Thm 31}} \varepsilon_0=\ln2 \\[4pt]
&\xrightarrow{\text{Thm R.3.4}} N_g = 3 \\[4pt]
&\xrightarrow{\text{Thm Y.8}} \kappa_B = \frac{\kappa_{EW}}{2} + \frac{\varepsilon_0}{N_g} = 19.48 \\[4pt]
&\xrightarrow{\text{Thm T.56}} \delta = 66.7° \implies \sin\delta = 0.918 \\[4pt]
&\xrightarrow{\text{Thm Y.9}} \eta_B = \mathcal{C}_{eff} \cdot \tanh(\chi_{CP}\mathcal{S}\sin\delta) \cdot f_{wash} \cdot e^{-\kappa_B} \\[4pt]
&= 0.282 \times 0.9997 \times 0.63 \times 3.47 \times 10^{-9} = 6.2 \times 10^{-10}\quad\text{on the canonical validation branch}
\end{aligned}
}$$

**Continuous fit-parameter count: Zero after fixing the Appendix T/R/Z/Y branch data and the finite branch tuple of Theorem Y.11.7h.** Every quantity in the displayed validation result traces back to the foundational constant $K_0=3$, to independently measured/calculated Standard Model quantities, or to the explicit branch labels of the canonical Appendix Y baryogenesis branch. A theorem-level numerical row additionally requires an accepted $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or $\mathfrak C_B^{\mathrm{APSK}}$ fixing the electroweak threshold record, flavor/CP record or accepted flavor-independent CP substitute, sphaleron generator, APS/Kubo source, washout and freeze-out profile, photon normalization, quadrature ledger, residual interval, overlap audit, and forward-lock entry. Before those finite entries are accepted, the displayed product is a validation-run branch value with zero retuning inside the branch, not an unconditional PU prediction.


---

## Y.12 Experimental Predictions and Tests

### Y.12.1 Precision CMB Measurements

The Planck satellite constrains $\eta_B = (6.12 \pm 0.04) \times 10^{-10}$. Future experiments will improve precision:

| Experiment | Projected $\sigma(\eta_B)/\eta_B$ | Timeline |
|:-----------|:---------------------------------:|:---------|
| Planck (current) | $0.7\%$ | Complete |
| LiteBIRD | $0.2\%$ | 2030s |

**Validation-run target:** $\eta_B^{\mathrm{val}}=(6.2\pm0.5)\times10^{-10}$. If future measurements converge outside the range $(5.7,6.7)\times10^{-10}$, they falsify the displayed validation branch or an accepted baryogenesis certificate if one has been supplied; before certificate acceptance they do not constitute a theorem-level refutation of the closed PU backbone.

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
| Electron | $\lvert d_e\rvert < 1.1 \times 10^{-29}$ e·cm | $\sim 10^{-38}$ e·cm |
| Neutron | $\lvert d_n\rvert < 1.8 \times 10^{-26}$ e·cm | $\sim 10^{-31}$ e·cm |

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

Within the canonical Appendix Y baryogenesis branch, the components $\kappa_{EW} = 38.5$, $\varepsilon_0=\ln2$, and $N_g = 3$ are fixed by their source branch ledgers: $\kappa_{EW}$ on the Appendix T weak-left projection, row-pair, predictive-recovery MacWilliams Golay, and electroweak hierarchy branch (Theorem T.5 and the branch labels recorded for Theorems T.18a, T.8, T.1c); $\varepsilon_0=\ln2$ on the PCE-Attractor (Definition 15a; Theorem 31 supplies the lower bound); $N_g = 3$ as the realized generation count on the pre-flavor family-redundancy PPI branch (Theorem R.3.4 supplies minimal admissibility, with exact realization by Proposition R.3.5.1a). The displayed $9\%$ uncertainty above is the within-branch validation-run uncertainty conditional on these branch choices, the unit Berry-topological response coefficient $\chi_{CP} = 1$ (Theorem Y.6.1), and the unit sphaleron-transport coefficient $\chi_{tr} = 1$ (Proposition Y.9.1). It does not include alternative-branch uncertainty in the electroweak hierarchy, generation, CP-response, or sphaleron-transport mappings. A unit shift $\delta\kappa_B = 0.1$ alone shifts $e^{-\kappa_B}$ by $\sim 9.5\%$, comparable to the entire stated within-branch uncertainty.


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

The Appendix Y branch gives the validation-run transport value

$$
\eta_B^{\mathrm{val}}
=
\mathcal{C}_{eff}\cdot\tanh(\mathcal{S}\sin\delta)\cdot f_{wash}\cdot e^{-\kappa_B}
=
(6.2\pm0.5)\times10^{-10}.
$$

This is the validation-run value of the canonical Appendix Y branch. Theorem-level numerical status requires an accepted $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or accepted APS-Kubo certificate $\mathfrak C_B^{\mathrm{APSK}}$ before comparison.

The derivation reveals that:
- **CP violation** is geometric (Berry holonomy on the flavor manifold), operating in a saturated regime where $\tanh(\mathcal{S}\sin\delta) \approx 1$
- **Efficiency** is controlled by configuration space complexity $\kappa_B = 19.48$, derived from the electroweak structure
- **Matter dominance** is a boundary condition on the initial predictive state, not a dynamical parameter

The framework provides a structurally constrained branch explanation for the sign and scale of the matter excess. The exact numerical row is the finite transport image of the accepted baryogenesis certificate, with the efficiency and washout modeling detailed in Section Y.4.

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