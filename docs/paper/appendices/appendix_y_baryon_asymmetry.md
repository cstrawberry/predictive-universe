# Appendix Y — Baryon Asymmetry from Predictive Anomaly Inflow

## Y.1 Overview and Derivation Chain

This appendix formulates a conditional baryogenesis transport branch. The finite structural chain fixes registered exponent and flavor inputs, but the baryon yield is an output only after a source, transport, freeze-out, washout, normalization, and residual certificate is supplied:
$$
K_0=3\longrightarrow d_0=8\longrightarrow(a,b)=(2,6)\longrightarrow M=24
\longrightarrow\kappa_{EW}=38.5\longrightarrow\kappa_B=19.48.
$$
Without an accepted transport certificate, the numerical value of $\eta_B$ is open. The observed value is comparison data, not a PU output.

| Quantity | Branch value | Observed | Status |
|----------|--------------|----------|--------|
| $\eta_B$ | validation run $(6.2 \pm 0.5) \times 10^{-10}$ | $(6.12 \pm 0.04) \times 10^{-10}$ | model/threshold branch pending $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or $\mathfrak C_B^{\mathrm{APSK}}$ |
| $\delta_{\mathrm{CKM}}$ | $66.7^\circ$ | $65.72^\circ\pm1.49^\circ$ | $+0.7\sigma$ |
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

**Recall from Theorem 31.** The binary SPAP quotient has structural log-cardinality $\varepsilon_0=\ln2$. A registered reset obeys $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; a physical $\ln2$ lower bound additionally requires a conditionally uniform binary record with no retained copy.

**Corollary Y.1.1** (Irreversible Branch Selection). At the verification step of each nontrivial SPAP cycle, the 2-to-1 merge selects one retained branch of the predictive $\mathbb Z_2$ ledger and exports at least $\ln2$ nats of bath entropy only when the discarded binary label is conditionally uniform and not retained as side information. Let $\mathcal E_\Omega$ be a finite set of baryon-relevant update events in a finite spacetime region $\Omega$, equipped with the charge-conjugation pairing $e\mapsto\bar e$ from Proposition Y.1 and an orientation character
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

## Y.3 Conditional Sakharov-Branch Realization

**Theorem Y.2 (Conditional Sakharov-Branch Realization).** Suppose the retained branch carries: (i) the electroweak anomaly channel, (ii) a nonzero certified CP-odd datum, (iii) active baryon-number-changing transitions, and (iv) an accepted response-active nonstationary transport, boundary/inflow, preparation, or freeze-out record satisfying Theorems Y.6.1i--Y.6.1k. Then the three Sakharov conditions are realized on that branch. The SPAP arrow and update cost alone do not discharge item (iv).


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

The SPAP cycle is intrinsically irreversible (Theorem 31: $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)\quad\text{on a registered reset branch}$). The cosmological arrow of time and nonzero predictive-update cost do not by themselves prove that the retained electroweak state departs from KMS stationarity. In the PU baryogenesis mechanism, active sphalerons produce a net yield only when an accepted $\dot\theta_{\mathrm{PU}}$, boundary/inflow, nonstationary preparation, or freeze-out record discharges Theorem Y.6.1i; $e^{-\kappa_B}$ is only a multiplicative branch weight.

*Proof of Theorem Y.2.*  
(1) On the SM-gauge branch (Theorem G.8.4b), Equation (Y.1), derived from the chiral $SU(2)_L$ anomaly, gives $\partial_\mu J^\mu_{B+L}\neq 0$ whenever the topological density $W\tilde W$ has nonzero integral, so baryon number is violated.  
(2) On the chiral SM gauge structure, the electroweak interaction distinguishes charge-conjugate configurations, and on the Berry-loop branch of Appendix T, Theorem T.56 supplies a nonzero CP-violating phase $\delta = 66.7°$, so CP is violated.  
(3) Theorem 31 provides a reset-heat bound $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ on a registered reset branch; strict positivity requires a separate entropy floor for the underlying predictive update, and Appendix O supplies the macroscopic arrow of time. The baryogenesis-specific departure from equilibrium must be supplied by the driven transport or boundary/freeze-out certificate of Theorems Y.6.1i--Y.6.1k; the factor $e^{-\kappa_B}$ cannot supply it. Thus Theorem Y.2 is conditional on the complete response-active branch record. Its anomaly, family, CP, transition, and nonequilibrium entries are branch inputs; no unconditional derivation of them from the bare PU axioms is asserted.


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

**Definition Y.4.1 (Registered CP Transport Affinity).** Let $A_{CP}(t)$ be the dimensionless signed affinity obtained from a specified nonequilibrium transport calculation.

**Definition Y.4.2 (Two-Rate Response Branch).** If $\Gamma_0(t)>0$ and
$$
\Gamma_\pm(t)=\Gamma_0(t)e^{\pm A_{CP}(t)},
$$
then
$$
\frac{\Gamma_+(t)-\Gamma_-(t)}{\Gamma_+(t)+\Gamma_-(t)}
=\tanh A_{CP}(t).
$$
The lattice sphaleron rate does not supply $A_{CP}$, and no universal factor $1/(2\pi\alpha_W)$ follows. ∎

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

For finite-action gauge histories whose initial and final configurations approach pure gauge with the stated orientation and normalization,
$$
Q_W=\Delta N_{\mathrm{CS}}.
$$
Without these asymptotic boundary conditions, the equality is not asserted.

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

## Y.5 CP-Odd Berry Datum and Driven Baryon Transport

### Y.5.1 The Predictive Flavor Bundle

**Definition Y.5** (Predictive Flavor Bundle). *Over the electroweak vacuum manifold $\mathcal{M}_{EW}$, the predictive flavor bundle $\mathcal{E} \to \mathcal{M}_{EW}$ has fiber at each point carrying the generation structure inherited from the $E_8$ embedding (Appendix R).*

The Berry connection on this bundle is:
$$\mathcal{A} = i\sum_{\alpha,\beta} \bar{z}_{\alpha\beta}\, dz_{\alpha\beta} \tag{Y.5}$$

where $z_{\alpha\beta}$ are local coordinates on $\text{Gr}(2,8)$ (Lemma T.53.1). The Berry curvature is the Kähler form:
$$\mathcal{F} = d\mathcal{A} = i\sum_{\alpha,\beta} dz_{\alpha\beta} \wedge d\bar{z}_{\alpha\beta} = \omega_{KE} \tag{Y.6}$$

### Y.5.2 Holonomy as Geometric CP Violation

**Theorem Y.6** (CP-Odd Holonomy Datum). *The Berry-Simon holonomy over a minimal update cycle surface $\Sigma$ provides a gauge-invariant CP-odd datum; it becomes a baryon source only through the nonstationary transport gate of Theorems Y.6.1i--Y.6.1j:*

$$\gamma = \oint_{\gamma} \mathcal{A} = \int_{\Sigma} \mathcal{F} \tag{Y.7}$$

For the flavor-changing loop $\gamma: u_3 \to d_3 \to d_2 \to u_2 \to u_3$, the holonomy is computed in Theorem T.56 from the $E_8$ sector mismatch:
$$\delta = 2\arctan\left(\frac{\sqrt{2}}{2}\right) \times \text{sinc}\left(\frac{1}{\sqrt{3}}\right) = 70.53° \times 0.9454 = 66.7°$$

The CP-violating phase entering the master formula is:
$$\sin\delta = \sin(66.7°) = 0.918 \tag{Y.8}$$

### Y.5.3 CP-Odd Effective Action

**Theorem Y.6.1 (Normalized CP-Odd Operator and Open Matching Coefficient).** Under the finite-action and pure-gauge boundary conditions registered before Theorem Y.4.3b, define
$$
Q_W
:=\frac{g^2}{32\pi^2}
\int W^a_{\mu\nu}\widetilde W^{a\mu\nu}\,d^4x
=\Delta N_{\mathrm{CS}}.
$$
A normalized local contribution has
$$
\frac{\Delta S_{CP}}{\hbar}=\chi_{CP}f(\delta)Q_W,
$$
where $f$ is odd and $2\pi$-periodic and $\chi_{CP}$ is an independent matching coefficient. Symmetry fixes neither $\chi_{CP}$ nor a nonequilibrium rate affinity. On a separately certified two-rate branch, the bounded response is $\tanh A_{CP}$; a static phase term alone supplies no production bias. ∎

**Proposition Y.7** (Saturated CP Weight in a Certified Driven Single-Harmonic Truncation). *Under the single-harmonic choice $f(\delta)=\sin\delta$, when $\mathcal{S} \cdot \sin\delta \gg 1$, the dimensionless CP response weight saturates:*
$$\mathcal{F}_{CP} \equiv \frac{\Gamma^{(+)} - \Gamma^{(-)}}{\Gamma^{(+)} + \Gamma^{(-)}} = \tanh(\mathcal{S} \sin\delta) \to 1$$

*In this regime, phase variations barely change the bounded CP weight. Net baryon production still requires the independently certified source, transport, freeze-out, and washout records of Theorems Y.6.1i--Y.6.1k.*

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

$$
\eta_B-\eta_{\mathrm{hom}}-r_B
=
\int_{t_i}^{t_f}K_B(t)\dot\theta_{\mathrm{PU}}(t)\,dt,
\qquad
r_B\in\mathcal R_B.
$$
Static factors such as $\tanh(\mathcal S\sin\delta)$ and $e^{-\kappa_B}$ may occur only inside the certified kernel or a separately proved product reduction; they are not additional sources.

**Structural Correspondence:**

| Spontaneous (CK) | PU Baryogenesis | Role |
|:-----------------|:----------------|:-----|
| Scalar field $\phi$ | Berry phase $\gamma$ | CP-odd datum; $\dot\theta_{\mathrm{PU}}$ or boundary inflow is the source |
| $\dot{\phi}/M$ | $\dot\theta_{\mathrm{PU}}$ or accepted boundary/inflow | response-active source; $\sin\delta$ is a CP-odd weight |
| Driven $\dot\theta_{\mathrm{PU}}$, boundary inflow, or freeze-out | accepted APS-Kubo source and $f_{\mathrm{neq}}$ | response-active departure from equilibrium |
| $\Gamma_{sph}/H$ | $\tanh(\mathcal{S}\sin\delta)$ | Sphaleron efficiency |

**Key Differences:**

1. **Origin of CP-odd field:** In Cohen-Kaplan, the scalar $\phi$ is postulated with an ad hoc coupling. In PU, the Berry phase emerges from the derived generation manifold structure.

2. **Time dependence:** Cohen-Kaplan requires explicit $\dot{\phi}(t)$ during a phase transition. PU requires time dependence to appear explicitly in the certified $\dot\theta_{\mathrm{PU}}$, boundary/inflow, nonstationary preparation, or freeze-out entry.

3. **Suppression mechanism:** Cohen-Kaplan uses the expansion rate $H$ for departure from equilibrium. PU uses a certified driven or boundary/freeze-out record for departure from equilibrium; $\kappa_B$ supplies only a branch weight.

4. **Saturation:** Cohen-Kaplan is linear in $\dot{\phi}/M$ (perturbative regime). PU saturates via $\tanh(\mathcal{S}\sin\delta) \to 1$ (non-perturbative regime).

**Theorem Y.7.1** (PU Holonomy on a Geometric Spontaneous-Baryogenesis Branch). *The PU baryogenesis mechanism is the geometric realization of spontaneous baryogenesis, where the scalar field $\phi$ is replaced by the Berry phase $\gamma$, the coupling $1/M$ is replaced by $1/(16\pi^2)$, the physical source is the certified $\dot\theta_{\mathrm{PU}}$ or boundary/inflow term, and $e^{-\kappa_B}$ is only a reduced branch weight.*

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

**Corollary Y.6.1b.2 (Normalized Unit Spectral-Flow Branch).** Suppose an accepted $\mathfrak A_\eta$ additionally records one mapping-torus family whose APS index, spectral flow, eta/kernel boundary correction, orientation, Chern-Simons increment, and normalization satisfy
$$
I_{CP}
=
\mathcal N_{CP}
\frac{\operatorname{sf}(D_\gamma)}{\Delta N_{CS}}
=\sigma_{CP},
\qquad
|\sigma_{CP}|=1.
\tag{Y.6.1b.3}
$$
Then Theorem Y.6.1b gives $\chi_{CP}=\sigma_{CP}$. Unit spectral flow by itself does not imply this conclusion; the denominator, normalization, boundary correction, and orientation in (Y.6.1b.3) are essential.

**Corollary Y.6.1b.3 (Normalized Unit Spectral-Flow Branch).** Suppose an accepted $\mathfrak A_\eta$ records a mapping-torus family with $\Delta N_{CS}\ne0$ and proves, in one orientation and normalization,
$$
I_{CP}
=\mathcal N_{CP}
\frac{\operatorname{Ind}_{\mathrm{APS}}(D_W)}{\Delta N_{CS}}
=\mathcal N_{CP}
\frac{\operatorname{SF}(D_\gamma)}{\Delta N_{CS}}
=\sigma_{CP},
\qquad |\sigma_{CP}|=1.
\tag{Y.6.1b.3.1}
$$
Then Theorem Y.6.1b gives $\chi_{CP}=\sigma_{CP}$. Unit spectral flow without the denominator, APS boundary correction, normalization, and orientation is insufficient.

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

**Corollary Y.6.1e (Product-Formula Reduction of the APS-Kubo Ledger).** If the APS-Kubo certificate has a factorized transport window on which the entire nonresidual transport output satisfies
$$
\mathcal N_\gamma(t_f)
\left[
Y_B(t_i)e^{-\int_{t_i}^{t_f}\Gamma_{\mathrm{wash}}(u)\,du}
+
\int_{t_i}^{t_f}
\mathcal N_B
\frac{W_{\mathrm{PU}}(t)\dot\theta_{\mathrm{PU}}(t)\Gamma_{\mathrm{CS}}(t)}{s(t)}
\exp\left[-\int_t^{t_f}\Gamma_{\mathrm{wash}}(u)\,du\right]dt
\right]
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B},
\tag{Y.6.1e.1}
$$
and the product-level theorem branch has $\mathcal R_B^{\mathrm{APSK}}=\{0\}$, then Theorem Y.9 follows from Theorem Y.6.1d with the same certified normalization and transport window. If the equality (Y.6.1e.1) or the zero-residual product branch is not supplied, the interval (Y.6.1d.1) replaces the product formula for theorem-level use.

*Proof.* Substitute the full bracketed equality (Y.6.1e.1) into (Y.6.1d.1). The zero-residual condition removes the remaining interval term, giving the master formula of Theorem Y.9 on that product branch. If (Y.6.1e.1) or the zero-residual condition is absent, Theorem Y.6.1d still supplies the unique transport output, while the bare product decomposition is not licensed. ∎

**Definition Y.6.1f (Holonomy-Transport Surface).** On an accepted APS-Kubo branch, a holonomy-transport surface is a $C^1$ map
$$
\Gamma:[t_i,t_f]\times S^1\to\mathrm{Gr}(2,8)
\tag{Y.6.1f.1}
$$
together with a $C^1$ real lift of the determinant-line phase on $[t_i,t_f]$. The time slices $\gamma_t(s)=\Gamma(t,s)$ are the retained flavor loops used in the phase lift of Definition Y.6.1c. Let
$$
\Theta_\eta(t)=\frac12\eta(D_{\partial X,t})
$$
be the accepted $C^1$ APS boundary phase representative in the same finite-part convention. The real lift is required to satisfy
$$
\theta_{\mathrm{PU}}(t)
\equiv
\Theta_\eta(t)+\oint_{\gamma_t}\mathcal A_{\mathrm{Berry}}
\pmod{2\pi}.
\tag{Y.6.1f.2}
$$
Define the baryogenesis transport weight
$$
\mathcal W_B(t)
:=
\mathcal N_B
\frac{W_{\mathrm{PU}}(t)\Gamma_{\mathrm{CS}}(t)}{s(t)}
\exp\left[-\int_t^{t_f}\Gamma_{\mathrm{wash}}(u)\,du\right].
\tag{Y.6.1f.3}
$$

**Theorem Y.6.1g (Holonomy-Index Normal Form for Baryon Transport).** On a branch carrying an accepted APS-Kubo certificate and a holonomy-transport surface of Definition Y.6.1f, the certified transport output in Theorem Y.6.1d has the exact normal form
$$
\eta_B
\in
\mathcal N_\gamma(t_f)
\left[
Y_B(t_i)e^{-\int_{t_i}^{t_f}\Gamma_{\mathrm{wash}}(u)\,du}
+
\int_{t_i}^{t_f}\mathcal W_B(t)\dot\Theta_\eta(t)\,dt
+
\int_{[t_i,t_f]\times S^1}\mathcal W_B(t)\,\Gamma^*\mathcal F_{\mathrm{Berry}}
\right]
+
\mathcal R_B^{\mathrm{APSK}}.
\tag{Y.6.1g.1}
$$
If the accepted APS boundary convention is stationary on the transport window, $\dot\Theta_\eta(t)=0$, then the CP-active source is precisely the weighted Berry-curvature flux through the finite predictive flavor surface:
$$
\eta_B
\in
\mathcal N_\gamma(t_f)
\left[
Y_B(t_i)e^{-\int_{t_i}^{t_f}\Gamma_{\mathrm{wash}}(u)\,du}
+
\int_{[t_i,t_f]\times S^1}\mathcal W_B(t)\,\Gamma^*\mathcal F_{\mathrm{Berry}}
\right]
+
\mathcal R_B^{\mathrm{APSK}}.
\tag{Y.6.1g.2}
$$
Thus the Appendix Y CP source is not an independent scalar insertion on an accepted transport branch. It is the finite predictive transport image of APS boundary phase plus Berry curvature, pushed through the same sphaleron, washout, entropy, photon, and residual ledgers.

*Proof.* By Definition Y.6.1f, the accepted real lift gives an integer $m$ that is constant on the connected transport window such that
$$
\theta_{\mathrm{PU}}(t)
=
\Theta_\eta(t)+\oint_{S^1}\Gamma^*\mathcal A_{\mathrm{Berry}}(\partial_s)\,ds+2\pi m.
$$
Differentiating the loop integral gives
$$
\frac{d}{dt}\oint_{S^1}\Gamma^*\mathcal A_{\mathrm{Berry}}(\partial_s)\,ds
=
\int_{S^1}\Gamma^*\mathcal F_{\mathrm{Berry}}(\partial_t,\partial_s)\,ds.
\tag{Y.6.1g.3}
$$
Indeed, in any accepted local gauge for the pulled-back Berry line,
$$
\partial_t\big(\Gamma^*\mathcal A_{\mathrm{Berry}}(\partial_s)\big)
=
\Gamma^*\mathcal F_{\mathrm{Berry}}(\partial_t,\partial_s)
+
\partial_s\big(\Gamma^*\mathcal A_{\mathrm{Berry}}(\partial_t)\big),
$$
and the total $s$-derivative integrates to zero on the closed loop $S^1$. On overlaps, a gauge change adds a closed-loop integral of a total derivative and, for a nontrivial transition winding, an integer multiple of $2\pi$ that is constant on the connected lift interval. Its derivative is therefore zero. Hence the derivative of the accepted real holonomy lift is the curvature flux. Therefore
$$
\dot\theta_{\mathrm{PU}}(t)
=
\dot\Theta_\eta(t)
+
\int_{S^1}\Gamma^*\mathcal F_{\mathrm{Berry}}(\partial_t,\partial_s)\,ds.
\tag{Y.6.1g.4}
$$
Substitute (Y.6.1g.4) into the integral term of Theorem Y.6.1d and use the definition (Y.6.1f.3) of $\mathcal W_B(t)$. Fubini's theorem on the finite retained transport window converts
$$
\int_{t_i}^{t_f}\mathcal W_B(t)
\left[
\int_{S^1}\Gamma^*\mathcal F_{\mathrm{Berry}}(\partial_t,\partial_s)\,ds
\right]dt
$$
into the surface integral in (Y.6.1g.1). The residual interval is unchanged because no approximation is introduced; only the accepted phase derivative is rewritten by Stokes-Cartan calculus on the same finite record. Setting $\dot\Theta_\eta=0$ gives (Y.6.1g.2). ∎

**Corollary Y.6.1h (No Scalar CP-Source Replacement).** On an accepted APS-Kubo branch, replacing $\dot\theta_{\mathrm{PU}}$ by a scalar CP parameter is theorem-level only if the replacement is the evaluated value of the right-hand side of (Y.6.1g.4) under the same holonomy-transport surface, APS boundary convention, transport normalization, and residual ledger.

*Proof.* Theorem Y.6.1g expresses the certified source as a fixed finite transport image. A scalar substitute that does not factor through the same expression changes the source entry of the certificate. By Theorem Y.11.7h, changing a required source entry creates a different branch and cannot promote the original numerical row. ∎

**Theorem Y.6.1i (Static-Holonomy KMS Obstruction).** Let $\mathcal L$ be the accepted finite transport generator, let $\rho_\beta$ be an exact stationary KMS state with $\mathcal L(\rho_\beta)=0$, and let $B_{\mathrm{ret}}$ have no explicit time dependence. Then
$$
\frac{d}{dt}\operatorname{tr}(\rho_\beta B_{\mathrm{ret}})
=
\operatorname{tr}\!\left(\mathcal L(\rho_\beta)B_{\mathrm{ret}}\right)=0.
\tag{Y.6.1i.1}
$$
Therefore a time-independent Berry holonomy angle is CP-odd branch data but cannot change the stationary baryon expectation. If a separate CP/CPT, chemical-potential, and boundary certificate fixes that expectation to zero, it remains zero; this theorem does not itself determine the value. A secularly generated yield requires at least one response-active nonequilibrium entry: $\dot\theta_{\mathrm{PU}}\ne0$, nonstationary state preparation, boundary/inflow spectral flow, an initial asymmetry followed by freeze-out, or another explicitly certified drive.

*Proof.* Stationarity and absence of explicit observable time dependence give the displayed equality. A static parameter may change the stationary generator or equilibrium state, but once the accepted state is stationary it cannot produce secular change of $\langle B_{\mathrm{ret}}\rangle$. Its constant value is not fixed by stationarity alone. The listed alternatives are precisely ways to leave that premise or add boundary transport. ∎

**Theorem Y.6.1j (Sharp Holonomy-Transport Cost Bound).** On a real finite transport window, suppose the accepted linear-response reduction is
$$
\eta_B
=
\eta_{\mathrm{hom}}
+\int_{t_i}^{t_f}K_B(t)q(t)\,dt
+r_B,
\qquad
q(t)=\dot\theta_{\mathrm{PU}}(t),
\qquad
r_B\in\mathcal R_B,
\tag{Y.6.1j.1}
$$
where $\mathcal R_B\subset\mathbb R$ is nonempty and closed and $m(t)>0$ almost everywhere. Define
$$
\Sigma_\theta[q]=\int_{t_i}^{t_f}m(t)q(t)^2\,dt,
\qquad
X_B=\int_{t_i}^{t_f}\frac{K_B(t)^2}{m(t)}\,dt<\infty.
\tag{Y.6.1j.2}
$$
Every pair $(q,r_B)$ that attains a target value $\eta_B^{\mathrm{tar}}$ obeys
$$
\Sigma_\theta[q]
\ge
\frac{\operatorname{dist}\!\left(\eta_B^{\mathrm{tar}}-\eta_{\mathrm{hom}},\mathcal R_B\right)^2}{X_B}
\tag{Y.6.1j.3}
$$
whenever $X_B>0$. If the admissible set is $L^2([t_i,t_f],m\,dt)\times\mathcal R_B$, the bound is sharp: with a closest residual representative fixed, equality holds exactly when
$$
q(t)=\lambda\frac{K_B(t)}{m(t)}
\tag{Y.6.1j.4}
$$
almost everywhere, with $\lambda$ chosen to reach the target. For a constrained admissible set, the lower bound remains valid, and equality is asserted only when the closest residual and proportional drive are jointly admissible.

*Proof.* Weighted Cauchy--Schwarz gives
$$
\left|\int K_Bq\,dt\right|^2
\le
\left(\int\frac{K_B^2}{m}\,dt\right)
\left(\int mq^2\,dt\right)
=X_B\Sigma_\theta[q].
$$
For any allowed residual, the magnitude of the response integral is at least the distance appearing in (Y.6.1j.3). Equality in weighted Cauchy--Schwarz is equivalent to (Y.6.1j.4). ∎

**Corollary Y.6.1k (Status of the Product Formula).** Theorem Y.9 is a reduced product representation only on a nonstationary transport branch whose $\chi_{\mathrm{tr}}$, $f_{\mathrm{neq}}$, source $q=\dot\theta_{\mathrm{PU}}$, freeze-out map, and residual ledger reproduce (Y.6.1j.1). A static factor such as $\tanh(\mathcal S\sin\delta)$ may weight a driven response but cannot replace $q$. The factor $e^{-\kappa_B}$ is a branch weight, not a proof of departure from equilibrium.

**Relation to Corollary Y.6.1h.** Corollary Y.6.1h already forbids an uncertified scalar replacement of $\dot\theta_{\mathrm{PU}}$. Theorems Y.6.1i--Y.6.1j add, respectively, the exact stationary-state obstruction and the sharp minimum-cost theorem for an accepted driven response.

**Theorem Y.9 (Conditional Reduced Product Formula).** Assume an accepted transport certificate proves that its finite output factorizes into an efficiency coefficient, a CP-odd response, a washout survival factor, and the registered complexity weight. Then
$$
\eta_B
=\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B}.
\tag{Y.12}
$$
The three prefactors are outputs of that same certificate; the factorization assigns none of them a default value. Without the factorization certificate, the applicable statement is the certified finite transport image and residual interval. ∎

### Y.7.2 Derivation of Efficiency Coefficient

**Proposition Y.9.1 (Conditional Transport Coefficient).** Let an accepted transport certificate reduce the finite yield to Theorem Y.9's product form. Then $\mathcal C_{\mathrm{eff}}$ is the coefficient obtained from that reduction. The chemical-equilibrium conversion factor is
$$
c_{\mathrm{sph}}
=\frac{8N_g+4n_H}{22N_g+13n_H},
$$
so $c_{\mathrm{sph}}=28/79$ for $(N_g,n_H)=(3,1)$ under the Standard-Model chemical-equilibrium assumptions (Harvey--Turner conversion). This identity supplies no universal factor $1/(2\pi\alpha_W)$, unit transport coefficient, or default nonequilibrium factor. ∎

### Y.7.3 Washout Correction

**Proposition Y.9.2 (Conditional Washout Survival).** Let $\gamma_{\mathrm{wash}}:[t_i,t_f]\to[0,\infty]$ be measurable and define
$$
G_{\mathrm{wash}}:=\int_{t_i}^{t_f}\gamma_{\mathrm{wash}}(t)\,dt\in[0,\infty].
$$
Set
$$
f_{\mathrm{wash}}:=e^{-G_{\mathrm{wash}}},\qquad e^{-\infty}:=0.
$$
Then $0\le f_{\mathrm{wash}}\le1$, with $f_{\mathrm{wash}}>0$ exactly when $G_{\mathrm{wash}}<\infty$. ∎

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

**Input and Open-Output Ledger:**

The structural exponent $\kappa_B=19.48$ yields the arithmetic weight $e^{-\kappa_B}=3.47\times10^{-9}$ on its declared model branch. A baryon yield additionally requires the transport coefficient $\mathcal C_{\mathrm{eff}}$, a CP response $\mathcal F_{CP}$, and the washout survival $f_{\mathrm{wash}}$ from one accepted transport certificate. The conditional reduction is
$$
\eta_B=\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B}.
$$
The values $0.282$, $0.9997$, and $0.63$ are not derived by the current archive. Inserting them gives the arithmetic product $6.16\times10^{-10}$, but this is an illustrative factor product, not a prediction or validation interval.

#### Y.7.5a Uncertainty Status

No uncertainty for $\eta_B$ is defined until the source, transport, washout, threshold, normalization, residual, and covariance records are fixed. The factor $c_{\mathrm{sph}}=28/79$ is a chemical-equilibrium conversion under its field-content assumptions; it is not a lattice quantity with a $3\%$ uncertainty.

## Y.8 Comparison with Observation

### Y.8.1 Baryon-Yield Status

The observational comparison value is
$$
\eta_B^{\mathrm{obs}}=(6.12\pm0.04)\times10^{-10}.
$$
The present Appendix Y branch has no certified numerical theory interval because its CP-source, transport, washout, and normalization certificate is open. Consequently no baryon-yield pull, agreement claim, or falsification interval is reported.

### Y.8.2 Independent Flavor Diagnostics

The conditional CKM rows are separate diagnostics and do not close the baryon transport certificate. The $66.7^\circ$ CKM phase is itself conditional on the nonlinear phase-response ansatz in Theorem T.56.

### Y.8.3 Parameter Accounting

The open outputs include $A_{CP}(t)$, $\mathcal C_{\mathrm{eff}}$, $\mathcal F_{CP}$, $\gamma_{\mathrm{wash}}$, the transport generator, the photon normalization, and their covariance/residual ledger. Therefore the displayed illustrative product does not have zero adjustable or external parameters.

## Y.9 Sign of the Baryon Asymmetry

**Theorem Y.10 (Conditional Sign of the Baryon Asymmetry).** The initial condition $N_{CS}(\Sigma_i)=0$ and a time orientation do not determine the sign of $\Delta N_{CS}$. On an accepted transport branch, the sign is fixed by the signed CP source, the oriented transport kernel, the topological transition, and the readout convention. In particular,
$$
\operatorname{sign}(\eta_B)
=\operatorname{sign}\!\left[
\mathcal N_\gamma\nu_B\!\left(
\int_{t_i}^{t_f}\mathcal U_B(t_f,t)S_{CP}(t)
e^{-\int_t^{t_f}W_B(u)\,du}\,dt
\right)
\right]
$$
when the initial homogeneous term vanishes. Matter dominance follows only if this certified quantity is positive. ∎

**Corollary Y.10.1 (Open Sign Gate).** There is no continuous sign parameter after a complete signed transport certificate is fixed, but the current archive has not derived that certificate from the boundary condition alone. ∎

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

The Jarlskog invariant measures flavor-path interference, while the retained PU truncation uses the bounded profile $\tanh(\mathcal S\sin\delta)$. At $\mathcal S\sin\delta=4.38$ this profile is near one, so it is a saturated CP-odd weight. It neither supplies time dependence nor proves a baryon yield without the response-active certificate of Y.6.1i--Y.6.1k. In the PU mechanism, the Berry holonomy $\delta$ enters through $\tanh(\mathcal{S}\sin\delta)$. Since $\mathcal{S}\sin\delta = 4.38 \gg 1$, the CP asymmetry *saturates* at unity rather than suffering kinematic suppression.

**Mechanism 2: Complexity-Regulated Efficiency**

In PU, the configuration-space complexity $\kappa_B$ may supply a reduced response weight, but nonequilibrium is controlled by the response-active drive, inflow, preparation, and freeze-out data of Theorems Y.6.1i--Y.6.1k. The branch value $\kappa_B=19.48$ gives $e^{-\kappa_B}\sim3\times10^{-9}$ only as a multiplicative weight; it neither establishes departure from equilibrium nor replaces a certified transport solution.

**Mechanism 3: Reduced Washout**

The PU mechanism operates during a different dynamical regime than standard EWBG, with sphaleron freeze-out occurring in a manner that preserves more of the generated asymmetry.

## Y.10.3 The Hierarchy Unification Theorem

### Y.10.3.1 Statement of Result

**Theorem Y.11** (Conditional Algebraic Square-Root Reduction). *Assume the equal-exponent decomposition, the Appendix T determinant relation, and an accepted transport certificate fixing every prefactor. Then:*

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

**Proposition Y.11.1 (Open Numerical Prefactor).** The square-root formula in Theorem Y.11 is an algebraic rearrangement after $\mathcal C_{\mathrm{eff}}$, $\mathcal F_{CP}$, $f_{\mathrm{wash}}$, the equal-exponent decomposition, and $A_{EW}$ are fixed. The current archive does not independently determine the first three entries. Therefore the observational ratio
$$
\frac{\eta_B^{\mathrm{obs}}}{\sqrt{v_{\mathrm{obs}}/M_{Pl}}}
$$
is an inversion target, not a numerical verification of the prefactor. ∎

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

**Theorem Y.11.4** (Conditional Shared-Exponent Statement). *Only under the equal-exponent decomposition and a complete baryon transport certificate do the two model expressions share the stated exponential factor.*

*Proof.* Both quantities derive from the same complexity:

| Problem | Quantity | Complexity | Suppression |
|:--------|:---------|:----------:|:-----------:|
| Electroweak hierarchy | $v/M_{Pl}$ | $\kappa_{EW}$ | $e^{-38.5} \sim 10^{-17}$ |
| Baryon asymmetry | $\eta_B$ | $\kappa_{EW}/2$ | $e^{-19.25} \sim 10^{-9}$ |

The complexities satisfy $\kappa_B \approx \kappa_{EW}/2$, hence the suppressions satisfy:
$$\eta_B \sim \sqrt{v/M_{Pl}}$$

Any mechanism that explains $\kappa_{EW}$ automatically constrains $\eta_B$, and vice versa. The two problems have a common origin in the Golay-Steiner structure (Theorem T.5). ∎

**Corollary Y.11.4a (Hierarchy Bridge Ratio).** *The prefactor $\mathcal{P}_{\mathrm{eff}}$ has two determinations, one from the adopted Appendix T/Y model branch and one from observational inversion, and their unrounded values agree at approximately the $0.65\%$ level.*

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
i.e. approximately $0.65\%$. ∎

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
3. Theorem Y.2 uses $N_g=3$ and nonzero $\delta$ only for the family/CP parts of the conditional branch; realization also requires its anomaly, active-transition, and response-active nonequilibrium records. Theorem Y.2 uses exactly these two inputs—$N_g=3$ and nonzero $\delta$—to realize the Sakharov conditions in the PU channel.
4. Theorems Y.8 and Y.9 then make both inputs enter the baryogenesis formula through
$$
\kappa_B=\frac{\kappa_{EW}}{2}+\frac{\varepsilon_0}{N_g},
\qquad
\mathcal F_{CP}=\tanh(\mathcal S\sin\delta).
$$

Consequently, within the Appendix Y channel, the flavor-topology sector and the cosmological matter-asymmetry sector are structurally locked: if $N_g<3$ or $\delta=0$, the present mechanism ceases to produce the observed-type baryogenesis channel.

*Proof.* Theorem R.3.4 proves that two generations cannot support a physical CKM phase after rephasing, whereas the minimal anomaly-free family-charge pattern allowing CP violation is the three-sector pattern $\{a,-a,0\}$. Theorem T.56 then gives a nonzero CKM phase $\delta$ as Berry holonomy. Theorem Y.2 imports both facts into the family/CP part of the Sakharov analysis: baryon violation uses the electroweak anomaly with coefficient proportional to $N_g$, CP violation uses the nonzero Berry-holonomy phase $\delta$, and the independent response-active transport, boundary/inflow, preparation, or freeze-out record supplies the required departure from stationarity. Finally, Theorem Y.8 inserts $N_g$ into the exponent through the generation-sharing term $\varepsilon_0/N_g$, and Theorem Y.9 inserts $\delta$ into the CP factor through $\sin\delta$. If $N_g<3$, the modeled class loses physical CKM CP violation; if $\delta=0$, then $\mathcal F_{CP}=\tanh(0)=0$. In either case the present Appendix Y mechanism collapses. ∎

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
\mathcal U_B(t_f,t)S_{CP}(t)\exp\!\left[-\int_t^{t_f}W_B(u)\,du\right]\,dt
\right)
\right]
+
\mathcal R_B^{\mathrm{tr}},
\tag{Y.11.7h.2}
$$
with $\nu_B$ the branch-fixed baryon-number readout. On an accepted APS-Kubo branch the certified interval is the interval of Theorem Y.6.1d after the same photon-normalization and overlap audit. A product formula is theorem-level only when Corollary Y.6.1e or Corollary Y.11.7g proves that it is the evaluated reduction of one of these finite intervals.

If no record in (Y.11.7h.1) is accepted, Appendix Y supplies no certified numerical yield or uncertainty interval. The legacy factor product is illustrative only. The irreducible branch coordinates are precisely the missing entries among threshold input, CP/flavor source, sphaleron normalization, APS/Kubo coefficient, finite transport generator, washout and freeze-out profile, photon normalization, quadrature/tail ledger, residual interval, and no-double-counting audit.

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
&\xrightarrow{\text{Thm Y.6.1g, APSK branch}} \dot\theta_{\mathrm{PU}}=\dot\Theta_\eta+\int_{S^1}\Gamma^*\mathcal F_{\mathrm{Berry}}(\partial_t,\partial_s)\,ds \\[4pt]
&\xrightarrow{\text{Thm Y.9}} \eta_B = \mathcal{C}_{eff} \cdot \tanh(\chi_{CP}\mathcal{S}\sin\delta) \cdot f_{wash} \cdot e^{-\kappa_B} \\[4pt]
&= 0.282 \times 0.9997 \times 0.63 \times 3.47 \times 10^{-9} = 6.2 \times 10^{-10}\quad\text{as an illustrative factor product}
\end{aligned}
}$$

**Open-input status.** The displayed illustrative factor product uses undetermined transport, CP-response, washout, threshold, and normalization entries. A theorem-level numerical row requires an accepted $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or $\mathfrak C_B^{\mathrm{APSK}}$ fixing the electroweak threshold record, flavor/CP record or accepted flavor-independent CP substitute, sphaleron generator, APS/Kubo source, washout and freeze-out profile, photon normalization, quadrature ledger, residual interval, overlap audit, and forward-lock entry. Before those finite entries are accepted, the displayed product is a validation-run branch value with zero retuning inside the branch, not an unconditional PU prediction.


---

## Y.12 Experimental Predictions and Tests

### Y.12.1 Precision CMB Measurements

The Planck satellite constrains $\eta_B = (6.12 \pm 0.04) \times 10^{-10}$. Future experiments will improve precision:

| Experiment | Projected $\sigma(\eta_B)/\eta_B$ | Timeline |
|:-----------|:---------------------------------:|:---------|
| Planck (current) | $0.7\%$ | Complete |
| LiteBIRD | $0.2\%$ | 2030s |

**Illustrative factor-product value:** $\eta_B^{\mathrm{illustr}}=(6.2\pm0.5)\times10^{-10}$. If future measurements converge outside the range $(5.7,6.7)\times10^{-10}$, they falsify the displayed validation branch or an accepted baryogenesis certificate if one has been supplied; before certificate acceptance they do not constitute a theorem-level refutation of the closed PU backbone.

### Y.12.2 CKM Phase Measurements

The CP phase $\delta$ is measured at B-factories and LHCb. Current world average [Particle Data Group 2024]:
$$\delta_{\mathrm{CKM}}=65.72^\circ\pm1.49^\circ$$

**Prediction:** $\delta = 66.7°$ from Theorem T.56.

Projected LHCb sensitivity of order $1^\circ$ concerns the unitarity-triangle angle $\gamma$. It constrains this branch only after a specified standard-unitary mapping from $\gamma$ to $\delta_{\mathrm{CKM}}$ and a theory covariance are fixed.

### Y.12.3 Saturation Regime Test

**Prediction Y.2** (Conditional Driven Sphaleron-Weight Saturation). *On a certified nonstationary reduction with fixed source, freeze-out, and residual ledger, the CP response weight is insensitive to the precise value of $\sin\delta$ in the range $\sin\delta>0.2$ because $\tanh(\mathcal S\sin\delta)\approx1$; this does not remove the source requirement of Theorem Y.6.1i.*

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

No numerical uncertainty interval for $\eta_B$ is defined by the current archive. A valid uncertainty ledger must be produced by the same accepted transport certificate and must include the CP source, transport kernel, washout and freeze-out histories, electroweak thresholds, photon normalization, residual interval, covariance, and forward-lock record. The factor $c_{\mathrm{sph}}=28/79$ is an exact chemical-equilibrium conversion under the stated Standard-Model field-content assumptions, not a lattice quantity with a $3\%$ error. The illustrative values $0.282$, $0.9997$, and $0.63$ cannot be assigned a quadrature uncertainty before their joint source and covariance are supplied.

### Y.13.2 CP-Response Sensitivity Status

The CP-response sensitivity remains open until an accepted transport calculation supplies $A_{CP}(t)$ or an equivalent certified affinity. The sphaleron rate and a static phase do not determine that affinity, so no saturation table or phase-insensitivity conclusion follows from the current archive.

---

## Y.14 Conclusion

The Appendix Y branch gives the illustrative factor-product value

$$
\eta_B^{\mathrm{illustr}}
=
\mathcal{C}_{eff}\cdot\tanh(\mathcal{S}\sin\delta)\cdot f_{wash}\cdot e^{-\kappa_B}
=
(6.2\pm0.5)\times10^{-10}.
$$

This is the illustrative factor-product value on the canonical Appendix Y branch. Theorem-level numerical status requires an accepted $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or accepted APS-Kubo certificate $\mathfrak C_B^{\mathrm{APSK}}$ before comparison.

The derivation reveals that:
- **CP violation** is geometric transport data. On an accepted APS-Kubo branch, $\dot\theta_{\mathrm{PU}}$ is the APS boundary-phase derivative plus Berry-curvature flux around the retained flavor loop. Transport weighting produces the surface term in (Y.6.1g.1). The approximation $\tanh(\mathcal S\sin\delta)\approx1$ belongs only to the separately certified saturated product branch.
- **Efficiency** is controlled by the branch value $\kappa_B=19.48$.
- **Matter dominance** is fixed by the retained initial-condition record, not by an adjustable transport parameter.

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