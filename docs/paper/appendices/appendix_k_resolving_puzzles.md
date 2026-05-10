# Appendix K: Resolving Outstanding Puzzles in Fundamental Physics

## K.1 Introduction

This appendix demonstrates how the Predictive Universe (PU) framework resolves several long-standing puzzles in fundamental physics and cosmology. Each section pairs an unsolved problem with specific PU mechanisms derived in the main text and appendices, showing how the framework provides quantitative resolutions or clear pathways toward them. The material ranges from rigorously established results with precise numerical predictions to exploratory directions requiring further theoretical development.

The framework's core insight—that physical law emerges from the operational requirements, logical limitations, and thermodynamic costs of prediction itself as instantiated by the MPU network—yields concrete, testable predictions for fundamental constants, selected hierarchy invariants and mixings, and cosmological parameters. Several rows achieve sub-percent agreement after their status-carrying inputs are fixed. In the quark sector, mixed-scale comparisons initially show 11–15% deviations, while a common-scheme reduction enables controlled same-scale hierarchy invariants; incorporating the down-sector $A_2/D_4$ frustration correction derived in Section T.25.6a brings these invariants into sub-percent agreement at $\mu=M_Z$, with explicit T1/T2/T3 budgets for both the common-scale reduction (Section T.25.5.3) and the frustration correction (Section T.25.6a.10).

## K.2 Values of the Fundamental Constants

**Puzzle:** The Standard Model of particle physics and general relativity contain approximately 25 fundamental parameters (masses, coupling constants, mixing angles) whose specific numerical values are precisely measured experimentally but are not derived from first principles within standard frameworks. Why these particular values?

**PU Resolution:** The framework organizes specific values of fundamental constants into branch-separated derivation chains, all rooted in the dynamically determined equilibrium state of the MPU network governed by minimizing the global PCE Potential $V(x)$ (Appendix D, Definition D.1) and satisfying derived constraints. Appendix X makes the coupling sector precise through Constraint-Coupling Duality: when a constant is the coefficient of an active physical admissibility constraint, its canonical coefficient is the relevant KKT shadow price after the branch normalization map; when the branch uses a rate coordinate, the observed coupling is the normalized active boundary coordinate together with the associated shadow price. These equilibrium parameters are shaped by the underlying MPU properties ($C_{op}, K_0, \varepsilon$, ND-RID dynamics, interaction costs $\Phi$) and environmental factors. The constants below carry the branch labels of their source appendices: some are theorem-level on the minimal PCE branch, others are canonical-branch predictions, calibration/exchange-rate definitions, or validation-level quantities conditional on the branch closures specified in their source appendices. The branch table at the end of this section consolidates these distinctions. In the per-quantity discussions, terminology such as "rigorously derived" refers to the within-branch dependence of each chain rather than an unconditional, branch-independent claim.

**Invariant speed of light $c$:** Emerges from the finite minimum MPU processing time $\tau_{min} > 0$ (Theorem 29) and the effective microscopic length scale $\ell_0$ (Definition 35), with $c \approx \ell_0 / \tau_{min}$ (Theorem 46). These scales are set by the minimal operational requirements of the MPU cycle.

**Reduced Planck constant $\hbar$:** Acts as the fundamental quantum of action. Within PU, it is rigorously identified as the exchange rate between information-theoretic (nats) and mechanical (J·s) descriptions of physical processes through the Action-Entropy Identity (Appendix Q, Theorem Q.0.1):
$$\boxed{\frac{\mathcal{S}}{\hbar} = \sum_{\text{cycles}} \varepsilon_i}$$
Physical action counts SPAP entropy production. The constant $\hbar$ scales the generator of unitary evolution (Equation 43), relates energy/frequency to information, and is associated with the fundamental scales of energy (from $\hat{H}_v$, Theorem 29) and time ($\tau_{min}$, Theorem 29) intrinsic to the MPU cycle. Its value is determined by the self-consistent scale of minimal actions in the PCE optimization, with the existence of this exchange rate proven necessary by the Principle of Physical Instantiation (Appendix Q, Theorem Q.0.2).

**Boltzmann constant $k_B$:** Functions as the conversion factor between dimensionless information/entropy measures (nats) and thermodynamic entropy (energy/temperature). Its value is inherent in the fundamental thermodynamic interpretation of the MPU dynamics (Section 12) and the link between information costs ($\varepsilon$) and energy dissipation ($k_B T \varepsilon$). Together with $\hbar$ and $c$, these constants form a complete set of exchange rates connecting the operational domains of the framework (Section P.6.5.5).

**Gravitational constant $G$:** Rigorously derived from the thermodynamic properties of the MPU network at causal boundaries (Section 12). As established in Appendix E (Theorem E.6), 
$$G = \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{\max}(f_{RID})}$$
**(Equation E.9)**. Here, $\delta$ is the effective MPU spacing, $\eta$ is a geometric packing factor, $\chi$ is a correlation factor, and $C_{\max}$ is the ND-RID channel capacity (limited by $\varepsilon$, Theorem E.2). These parameters determine the effective surface density of channels $\sigma_{eff\_link} = \chi / (\eta \delta^2)$ (Theorem E.3). The fundamental relationship **(Equation E.7)** is:
$$\frac{\chi C_{\max}(f_{RID})}{\eta \delta^2} = \frac{c^3}{4 \hbar G}$$
This relationship is further constrained by the PCE-driven optimization of these parameters in the vacuum state. Appendix Q provides the complete calculation (with zero continuously adjustable parameters) of the ratio $\delta/L_P \approx 2.355$ through minimization of the global PCE potential, linking the microscopic MPU scale to the emergent Planck scale. The derivation proceeds by constructing $V_{vac}(\delta, \chi, \eta, C_{\max})$ and finding the unique stable equilibrium satisfying all framework constraints (Appendix Q, Equations Q.1-Q.18).

**Electromagnetic coupling $\alpha$:** Appendix Z gives the Thomson-limit sinc-core value and its residual-gated certificate row. The complete core derivation establishes:
$$\boxed{D = 4}$$

$$
\boxed{
\alpha^{-1}_{0}
=
\frac{4\pi}{u^*}
-
\frac{\pi}{\sqrt{K_0}}
+
\frac{\pi u^*}{24\sqrt{K_0}}\operatorname{sinc}(u^*)
=
137.03609205522863\ldots,
\qquad
\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha
}
$$
where $u^* = 2^{1/8} - 1$, $K_0 = 3$, and $R_\alpha$ is fixed only by the residual gate. The derivation proceeds through a seven-stage chain: MPU invariants ($d_0 = 8$, $\varepsilon_0=\ln2$) → active kernel dimension $a = 2$ via the Physical Instantiation Principle (Theorem Z.1) → interface mode count $M = 2ab = 24$ (Theorem Z.5) → PCE-Attractor orbit $\mathrm{Gr}(2,8)$ → operational distinguishability → mode-channel correspondence → Ward identity → electromagnetic coupling formula (Appendix Z, Sections Z.1-Z.21). The second-order correction arises from the Grassmannian curvature sector (Theorem Z.24; Lemma Z.24a) and minimal holonomy (Lemma Z.14), and the exact transport factor is $\operatorname{sinc}(u^*)$ from the $SU(2)$ geodesic-chord relation in each interface subblock. The derivation simultaneously establishes the emergent spacetime dimension $D = 4$ from the mode-channel correspondence (Theorems Z.10-Z.11), while Appendix G supplies an independent stability-based reinforcement.

**Strong coupling $g_s$ and weak coupling $g_w$:** These relate to the effective stiffness or inverse-stiffness coefficients in the emergent gauge field actions (Appendix G, Equation G.5.2). In the stiffness convention of Theorem X.8c, the coefficient $1/g_i^2$ is the normalized shadow price of maintaining the corresponding gauge-coherence constraint; in the interaction-strength convention, $g_i^2$ is the reciprocal normalized price after the matching factors are applied. The unified gauge structure $G_{SM} = SU(3)_C \times SU(2)_L \times U(1)_Y$ with dimension 12 emerges from the thermodynamically optimal partition $H_0 \cong \mathbb{C}^2 \oplus \mathbb{C}^6$ (Appendix G, Proposition G.M1; Appendix Z, Theorem Z.1). At the PCE-optimal attractor, the unified coupling satisfies $g_U^2 = \pi/6$ with $\alpha_U^{-1} = 24$ (Appendix T, Theorem T.39a), derived from first principles via Bures holonomy on $\mathrm{Gr}(2,8)$.

The hierarchy among couplings at a common fundamental scale arises from the information-theoretic costs of maintaining gauge coherence on the noisy MPU substrate. Modeling this as continuous-time quantum error correction, the minimal Predictive Physical Complexity $C_P(G, g)$ required to maintain coherence scales polynomially with the group's self-interaction complexity, quantified by the quadratic Casimir of the adjoint representation $C_2(\text{Adj})$. For $U(1)$, $C_2(\text{Adj}) = 0$; for $SU(2)$, $C_2(\text{Adj}) = 2$; for $SU(3)$, $C_2(\text{Adj}) = 3$. PCE optimization balancing coherence cost against predictive benefit predicts the UV hierarchy $g_1^* > g_2^* > g_3^*$, which standard renormalization group evolution transforms into the observed low-energy hierarchy $g_3 > g_2 > g_1$.

**Electroweak Scale, Weinberg Angle, and Higgs Mass:** These three fundamental puzzles are addressed simultaneously through the Appendix T construction. The electroweak scale emerges from the Golay-Steiner structure with electroweak complexity $\kappa_{EW} = bk/2 + \dim(G/H) - m/2 = 38.5$, yielding:
$$v = A_{EW} e^{-\kappa_{EW}} M_{Pl} \approx 252 \text{ GeV}$$
**(Theorem T.5 / Corollary T.29.1)**. The PU-normalized tree-level Weinberg angle is $\sin^2\theta_W^{(0)} = 3/8$ from the PCE isotropy conditions **(Theorem T.14)**, while the Higgs-mass prediction near $125$ GeV is conditional on the Standard Model metastability-boundary matching used in **Theorem T.28**. These results require no continuous fitting inside the stated Appendix T setup, but the Higgs and threshold sectors rely on the explicit matching assumptions recorded there.
- Signal-parity decomposition of M = 24 modes into k = 12 signal and k = 12 parity subspaces via the Extended Binary Golay Code (Proposition T.1)
- Electroweak coset $\mathcal{M}_{EW} = (SU(2)_L \times U(1)_Y)/U(1)_{em} \cong S^3$ with dimension 3 (Definition T.6)
- Discrete action $S_{EW} = N_0 + \dim(G/H) - m/2 = 38.5$ from alignment constraints and zero-mode subtraction (Theorem T.4)
- PCE isotropy at the attractor requiring equal gauge kinetic stiffness across all directions (Theorems T.13-T.16)
- Metastability analysis via renormalization group evolution from boundary conditions at matching scale $\mu_G = M_R = M_{Pl}e^{-9}$ (Sections T.16-T.21)

The unified derivation connects these three observables through the same underlying Golay code structure that determines the cosmological constant (Appendix U).

**Fermion Masses and Yukawa Couplings:** The specific values arise from geometric overlaps of generation vacua on the MPU's internal Perspective Space $\Sigma_8 = U(8)/U(1)^8$, as rigorously derived in Appendix R. The generation count itself is derived by the anomaly+CP route with exact pre-flavor PPI realization, while the structural sector supplies the $D_4$ triality compatibility check, the geometric mass-hierarchy mechanism, and a compatible Leech/$E_8$ three-fold scaffold:

1. **Topological:** The second homotopy group $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$ provides seven independent topological charges (Theorem R.1.1). Combined with gauge-topology correspondence (Theorem R.3.1), the family-charge anomaly constraints, and the CP-violation requirement, this yields the minimal admissible three-generation pattern with family charges $\{a,-a,0\}$ (Theorem R.3.4), with exact realization on the pre-flavor family-redundancy PPI branch (Proposition R.3.5.1a).

2. **Triality/geometric compatibility:** Proposition R.4.2 records the $D_4$ triality orbit $\{V,S^+,S^-\}$ as a representation-theoretic compatibility check, while the $E_8$ root system emerges as the information-optimal coordinatization of the 8-dimensional real subspace (Section R.2.1). Squared $E_8$ root distances $d^2 \in \{0, 2, 4, 6, 8\}$ determine mass ratios via Gaussian suppression on the PCE-Attractor orbit Gr(2,8) with hierarchy coefficient $\alpha = 3/2$ (Corollary T.41.3), and furnish a three-fold compatibility structure consistent with $N=3$.

The Mass Hierarchy Invariant:
$$\mathcal{R} := \frac{\ln(m_3/m_1)}{\ln(m_3/m_2)} = \frac{d^2_{31}}{d^2_{32}} \in \left\{\frac{4}{3}, \frac{3}{2}, 2, 3, 4\right\}$$
**(Equation R.17)** provides a discrete prediction with zero continuously adjustable parameters. In the charged lepton sector, the observed value $\mathcal{R}_\ell \approx 2.889$ matches the discrete prediction $\mathcal{R} = 3$ to within 3.8%, providing strong phenomenological support. Absolute mass scales are set by the emergent VEV through sector prefactors $c_f$ determined by Bures/gauge normalization (Appendix T, Section T.21).

Appendix T (Section T.25) establishes status-labeled hierarchy comparisons with no additional continuous fitting after the stated geometric assignments, threshold data, common-scale reductions, and sector normalizations are fixed:
- $m_\tau^{(0)} \approx 0.94$ GeV at leading order; factor $\approx 1.9$ normalization gap open pending two-loop threshold and Van Vleck–Morette corrections (Remark T.45.1; Lemma T.45.1a). Anchored to $m_\tau^{\rm obs} = 1776.86$ MeV (Particle Data Group (2024)), the $E_8$ log-ratio predictions give $m_\mu = 105.78$ MeV (observed: 105.66 MeV, deviation: $+0.12\%$) and $m_e = 0.5121$ MeV (observed: 0.5110 MeV, deviation: $+0.22\%$)
- $\ln(m_\tau/m_\mu) = 2.8212$ (observed: 2.8224, deviation: $\approx 0.04\%$)
- Cabibbo angle $|V_{us}| = 0.2261$ from frustration-induced tunneling between quark sector vacua (observed: $0.2243 \pm 0.0008$, deviation: +0.8%)
- Lepton-quark bridge $c_\ell/c_d = 8/3$ from gauge normalization constraints (Theorem T.44)

The τ/μ mass ratio achieves $\approx\mathbf{0.04\%}$ **precision** in the log ratio ($|\Delta\ln|=0.0012$), with zero adjustable parameters, representing the single most precise test of the geometric hierarchy mechanism.

**Branch-Separated Summary of Derived Constants:**

| Quantity | Derivation chain | Branch class |
|---|---|---|
| $K_0, d_0, M, D$ | Minimal PCE chain (Theorems 15, 23, Z.5, Z.10–Z.11) | Theorem-level on minimal branch |
| $c$ | Minimal operational scales (Theorem 29, 46) | Theorem-level on minimal branch |
| $\hbar$ | Action-entropy exchange rate (Theorem Q.0.1) | Exchange-rate definition; existence is theorem-level on Q.0.2 branch |
| $k_B$ | Thermodynamic conversion factor (Section 12) | Exchange-rate definition |
| $\alpha^{-1} = 137.036$ | Appendix Z seven-stage chain | Canonical Z branch prediction (with the branch qualifiers) |
| $G$, $\delta/L_P \approx 2.355$ | Channel-capacity area-law normalization (Theorem E.6) and Appendix Q packing | Area-law calibration plus Appendix Q branch |
| $v \approx 246$ GeV | Golay-Steiner electroweak complexity (Theorem T.5 / Corollary T.29.1) | Appendix T determinant-model branch |
| $\sin^2\theta_W^{(0)} = 3/8$ | PCE isotropy at attractor (Theorem T.14) | Theorem-level on the unbroken-tree branch; running to $M_Z$ remains validation-level |
| $m_H \approx 125$ GeV | PU quartic boundary matched to SM metastability (Theorem T.28) | Conditional on SM metastability-boundary matching branch |
| $\Lambda$ | Appendix U Golay-Steiner reference exponent | Five-mode reference branch / four-mode corrected branch (Theorems U.8c, U.13b) |
| $g_s, g_w, \alpha_s(M_Z), \sin^2\theta_W(M_Z)$ | Lifted spectral threshold tuple (Theorems T.16, T.18, T.78.2, T.78.5) | Validation-level in the canonical minimal ledger; positive theorem-level status requires an appended forward block-sum spectral package |
| $N_g = 3$ | Anomaly+CP minimal admissible $N_{\min}=3$; exact $N_g=3$ on the pre-flavor family-redundancy PPI branch; $D_4$ triality and Leech/$E_8$ are compatibility checks (Theorem R.3.4; Proposition R.3.5.1a; Proposition R.4.2) | Theorem-level minimal admissible / branch-level exact realization |
| Fermion mass ratios | $E_8$ geometric overlaps (Appendix R, T.41-T.45) | Theorem-level discrete predictions; absolute scales calibrated through Appendix T sector prefactors |

If the fundamental rules and parameters of the MPU model and POP/PCE optimization are simple, the complex pattern of observed fundamental constants arises as the unique stable minimum of the high-dimensional PCE potential landscape. Fine-tuning in observed constants is reinterpreted as thermodynamic or informational optimality.

**Next Steps:** Continue developing explicit MPU network models to quantitatively evaluate the PCE Potential $V(x)$ for remaining constants (strong and weak couplings beyond unified attractor, neutrino masses). Refine predictions as experimental precision improves to test higher-order corrections in mass hierarchies (Section T.25.10).


## K.3 PU Pathway to Black Hole Information Resolution: Reflexive Dynamics and Perspectival Encoding

The Black Hole Information Paradox, which arises from the conflict between quantum unitarity and the apparent information loss in thermal Hawking radiation, can be recast within the Predictive Universe framework by treating information retrieval as a **reflexive computational problem**. This perspective reveals that the paradox stems not merely from computational limits but from the fundamental logical structure of self-reference inherent in the measurement process—a structure central to the PU framework.

### K.3.1 Black Hole Information Retrieval as a Reflexive Problem

We frame the task of recovering the information of an initial pure state $|\psi_{in}\rangle$ that formed a black hole as a computational problem with inherent reflexivity.

**Problem Instance $I_t$:** The "instance" at time $t$ is the complete physical state of the black hole, characterized by macroscopic parameters (mass $M_t$, charge $Q_t$, angular momentum $J_t$) and internal MPU network state $|S_{BH}(t)\rangle$, which encodes the scrambled information of $|\psi_{in}\rangle$.

**Solution Attempt $S_t$:** A "solution attempt" corresponds to an external observer performing a measurement on outgoing Hawking radiation during interval $\Delta t$. This measurement involves an interaction realized by an 'Evolve' process (Definition 27) extracting a quantum of information.



**Reflexive Structure:** Each measurement $S_t$ modifies the problem instance itself: the act of extracting information changes the black hole's state $I_t \to I_{t+1}$, altering future extractable information. The solver (observer) cannot separate themselves from the problem—they are entangled with the system being solved. This is precisely the Self-referential Paradox of Accurate Prediction (SPAP) operating at the horizon.

**Definition K.1 (Contractive vs. Expansive Reflexivity).**
- **Contractive Reflexivity:** If sequential measurements cause the state of the black hole to converge towards a stable, predictable final state, the problem would be solvable in principle. This corresponds to the transformation $T$ being a contraction mapping in the space of problem instances.
- **Expansive Reflexivity:** If sequential measurements cause the state of the black hole to change in an accelerating or increasingly unpredictable manner, the problem instance diverges from the solver, creating a computational infinite regress.

**Proposition K.1 (Expansive-Reflexivity Scaling in Late-Stage Evaporation).** For a black hole in the final stages of its evaporation, the standard Hawking-emission scaling laws imply that the fractional impact of one emitted Hawking quantum on the remaining state grows without bound as $M_t \to 0$.

*Proof.*
1. **Accelerating dynamics.** As the black hole's mass $M_t$ decreases, its temperature $T_H \propto 1/M_t$ and evaporation rate $dM/dt \propto -1/M_t^2$ both increase.
2. **Diverging relative impact.** A Hawking quantum has characteristic energy $\Delta E \sim k_B T_H \propto 1/M_t$, so the fractional mass change satisfies $|\Delta M|/M_t \propto 1/M_t^2$. Hence, for every threshold $B>0$, there is $M_B>0$ such that $|\Delta M|/M_t>B$ whenever $0<M_t<M_B$.
3. **Expansive-reflexivity scaling.** A local sequential model of the remaining black-hole state receives an update whose relative scale diverges along the late-stage evaporation sequence. This is the expansive-reflexivity scaling asserted in the proposition. ∎

**Proposition K.2 (Expansive-Reflexivity Obstruction for Local Sequential Retrieval).** On the Perspectival Information Channel (PIC) branch defined in K.3.2 — under which the channel capacity $C_{\mathrm{PIC}}(t)$ and the per-cycle reflexive update cost $\varepsilon$ together imply $t_{\mathrm{extract}} > t_{\mathrm{evap}}$ for any local sequential Hawking-radiation retrieval protocol — no local sequential algorithm in that protocol class recovers the complete information of the initial state $|\psi_{in}\rangle$ before evaporation completes, regardless of available computational resources internal to the observer.

*Proof.* Proposition K.1 gives the increasing per-step update load. On the PIC branch, the channel capacity bound and reflexivity cost $\varepsilon$ imply that the cumulative resource budget required for complete sequential retrieval exceeds what is available before $t_{\mathrm{evap}}$; equivalently, $t_{\mathrm{extract}}>t_{\mathrm{evap}}$ for the protocol class. A protocol that finishes after evaporation cannot recover the complete initial-state information before the endpoint. Therefore no local sequential algorithm in the stated protocol class completes the retrieval before evaporation. ∎

### K.3.2 Thermodynamic Cost and the Perspectival Information Channel

By Theorem 31, each irreversible measurement operation (each 'Evolve' at the horizon) incurs the minimal SPAP entropy cost $\varepsilon_0=\ln2$ nats. For complete information recovery requiring $N \sim S_{BH}$ measurements (where $S_{BH}$ is the Bekenstein-Hawking entropy), the cumulative cost is:
$$\Delta S_{cumulative} \geq N \cdot \ln 2 \sim S_{BH} \cdot \ln 2$$

The **Perspectival Information Channel (PIC)** is the communication channel from the black hole interior to an external observer, mediated by Hawking radiation. This channel has capacity $C_{PIC}$ limited by:
1. **Thermodynamic Limits:** Horizon channel capacity $C_{\max}$ from ND-RID bounds (Appendix E, Theorem E.2)
2. **Reflexivity Cost:** SPAP entropy $\varepsilon$ per bit extracted (Appendix J)
3. **Scrambling Time:** Information thermalization time $t_{scramble} \sim (S_{BH}/C_{\max}) \ln S_{BH}$

### K.3.3 Expansive Reflexivity and Information Conservation

The framework proposes that information is never truly lost but becomes **expansively reflexive**: accessing it requires solving progressively more complex self-referential problems. The key insight is that the notion of "information loss" is observer-dependent, determined by available computational resources relative to the reflexive depth required for extraction.

For observers with finite resources operating over finite time, complete information recovery becomes thermodynamically infeasible as:
$$t_{extract} \gg t_{evap}$$
where $t_{extract}$ is the time needed to extract information at rate $C_{PIC}$ and $t_{evap}$ is the evaporation timescale.

However, **retained information is not deleted globally** through the MPU network substrate.

**Theorem K.3.3a (Retained Horizon No-Deletion).** Let $\mathcal H_{\mathrm{tot}}(t)$ be the finite-response Hilbert representative of the retained black-hole-plus-radiation branch at time $t$, and let
$$
U_{t_1t_0}:\mathcal H_{\mathrm{tot}}(t_0)\to\mathcal H_{\mathrm{tot}}(t_1)
$$
be the global retained microscopic update supplied by the MPU network substrate on that branch. Suppose $U_{t_1t_0}$ is an isometry, unitary when the retained total Hilbert dimension is unchanged. Let $\mathcal A_{\mathrm{ret}}(t_0)\subset\mathcal B(\mathcal H_{\mathrm{tot}}(t_0))$ be the finite retained response algebra at $t_0$. Define the Heisenberg transport
$$
\iota_{t_1t_0}(A)
=
U_{t_1t_0} A U_{t_1t_0}^{\dagger}
\qquad
(A\in\mathcal A_{\mathrm{ret}}(t_0)).
$$
Then $\iota_{t_1t_0}$ is injective. Consequently no two distinct retained response operators at $t_0$ are identified by the global horizon evolution.

*Proof.* Let $A,B\in\mathcal A_{\mathrm{ret}}(t_0)$ and suppose
$$
\iota_{t_1t_0}(A)=\iota_{t_1t_0}(B).
$$
Then
$$
U_{t_1t_0}(A-B)U_{t_1t_0}^{\dagger}=0.
$$
Multiplying on the left by $U_{t_1t_0}^{\dagger}$ and on the right by $U_{t_1t_0}$ gives
$$
U_{t_1t_0}^{\dagger}U_{t_1t_0}(A-B)U_{t_1t_0}^{\dagger}U_{t_1t_0}=0.
$$
Since $U_{t_1t_0}$ is an isometry,
$$
U_{t_1t_0}^{\dagger}U_{t_1t_0}=I,
$$
hence
$$
A-B=0.
$$
Therefore $A=B$, so $\iota_{t_1t_0}$ is injective. If two retained response classes were deleted into one class by the global update, two distinct retained response operators would have the same Heisenberg image, contradicting injectivity. ∎

This theorem is the structural conservation layer. The injectivity of $\iota_{t_1t_0}$ asserts that no two distinct retained response classes already present at $t_0$ are merged by the global update; it does not assert that the image $\iota_{t_1t_0}(\mathcal A_{\mathrm{ret}}(t_0))$ exhausts $\mathcal B(\mathcal H_{\mathrm{tot}}(t_1))$, and when the retained Hilbert dimensions differ the image is in general a proper subalgebra. The theorem also does not by itself assert exterior recovery from a coarse exterior algebra. Exterior recovery is the stronger existence of a response-preserving reconstruction map
$$
R_{\mathrm{ext}}\circ\iota_{t_1t_0}
=
\mathrm{id}
$$
on the retained interior subalgebra, and Page-curve behavior is stronger still because it requires the entropy/scrambling input of Section K.3.5. The apparent information loss emerges from the perspectival limitations of local observers, not from fundamental deletion of retained finite-response classes already encoded at $t_0$.

### K.3.4 Testable Predictions and Open Questions

The PU framework makes layer-separated black-hole diagnostics. Each row records the branch on which it is theorem-level, the certificate that would promote the next branch, and the observation that would falsify the branch.

1. **Modified Hawking Spectrum.**
   *Theorem-level branch:* the retained horizon-correlation branch where outgoing radiation couples to retained horizon response classes (Theorem K.3.3a). On this branch, finite deviations from perfect thermality are suppressed by the horizon capacity scale $S_{BH}$ supplied by Theorem E.6.
   *Promotion certificate (to a quantitative spectral law):* an accepted emission-channel certificate $\mathfrak C_{\mathrm{emit}}$ specifying the horizon moment channel $\mathcal M_t$, the certified emission mismatch $\varepsilon_{\mathrm{emit}}$, and the protocol bandwidth before comparison.
   *Falsifier:* a measured emission spectrum strictly thermal to a precision exceeding the certified $\varepsilon_{\mathrm{emit}}$ ceiling on the accepted branch, or non-thermal structure inconsistent with the moment-channel form (K.3d.7)–(K.3d.8).

2. **Page-Time Branch.**
   *Theorem-level branch:* retained no-deletion (Theorem K.3.3a), which holds without scrambling input.
   *Promotion certificate (to a von Neumann Page curve):* a trace-coupled horizon entropy-continuity promotion certificate $\mathfrak C_{\mathrm{PageTV}}$ supplying the coupling error in (K.3.1). Such a certificate may be appended to an accepted horizon moment-operator certificate $\mathfrak C_{\mathrm{Hdesign}}$ of Definition K.3d.4 or to the Golay-expander certificate of Definition K.3d.4a, but a bare moment certificate supplies only the Page-purity law of Corollary K.3.1 unless it also carries this trace-coupled promotion.
   *Falsifier:* on a system carrying an accepted $\mathfrak C_{\mathrm{PageTV}}$, a measured radiation entropy that exits the band (K.3.2) by more than $\varepsilon_{\mathrm{Page}}\ln(d_E-1)+h_2(\varepsilon_{\mathrm{Page}})$ at the certified $d_E,d_L$.

3. **Horizon Complexity Scaling.**
   *Theorem-level branch:* the finite-resource Perspectival Information Channel and reflexive-update cost bounds of Appendix K.3.6 and Appendix J on a fixed protocol class.
   *Promotion certificate (to an exponential law $\exp(C\cdot S_{BH})$):* a registered local sequential extraction protocol class together with a fixed constant $C$ tied to the SPAP/Landauer floor $\varepsilon_0=\ln2$ before comparison.
   *Falsifier:* a registered protocol that decodes late-time Hawking quanta in time polynomial in $S_{BH}$ on the accepted branch, contradicting the registered exponential constant $C$.

### K.3.5 Consistency with the Page Curve

On the horizon entropy-continuity branch, the PU framework is consistent with Page-curve behavior for the entanglement entropy of the Hawking radiation. Let $S_E(t)$ denote the von Neumann entropy of the early radiation subsystem at time $t$. The structural information-conservation result is independent of this trace-coupled promotion branch; the von Neumann Page-curve estimate is not. Bare moment-design control supplies the Page-purity law of Corollary K.3.1 unless it is strengthened by the trace-coupled certificate of Definition K.3d.4c.

**Theorem K.3 (Page Curve Consistency on the Horizon Entropy-Continuity Branch).** Let $d_E(t)\ge2$ and $d_L(t)$ be the early-radiation and late/interior Hilbert dimensions on a finite evaporation branch. Let $S_{\mathrm{Page}}(d_E,d_L)$ denote the exact Haar-average entropy of the smaller subsystem:
$$
S_{\mathrm{Page}}(d_E,d_L)
=
\sum_{j=d_>(t)+1}^{d_E(t)d_L(t)}
\frac1j
-
\frac{d_<(t)-1}{2d_>(t)},
$$
where
$$
d_<(t)=\min\{d_E(t),d_L(t)\},
\qquad
d_>(t)=\max\{d_E(t),d_L(t)\}.
$$
Assume the horizon scrambling branch supplies a finite entropy-continuity coupling certificate: there is a coupling of the PU reduced early-radiation state $\rho_E^{\mathrm{PU}}(t)$ and the Haar reduced state $\rho_E^{\mathrm{Haar}}(t)$ such that, almost surely,
$$
T_t
:=
\frac12
\left\|
\rho_E^{\mathrm{PU}}(t)-\rho_E^{\mathrm{Haar}}(t)
\right\|_1
\le
\varepsilon_t,
\qquad
0\le\varepsilon_t\le1-\frac1{d_E(t)}.
\tag{K.3.1}
$$
Then
$$
\left|
\mathbb E\,S(\rho_E^{\mathrm{PU}}(t))
-
S_{\mathrm{Page}}(d_E(t),d_L(t))
\right|
\le
\varepsilon_t\ln(d_E(t)-1)+h_2(\varepsilon_t),
\tag{K.3.2}
$$
where
$$
h_2(x)=-x\ln x-(1-x)\ln(1-x)
$$
is binary entropy in nats, with the convention $h_2(0)=h_2(1)=0$. At the boundary $d_E(t)=2$, the factor $\ln(d_E(t)-1)=0$ and the entropy bound (K.3.2) reduces to $h_2(\varepsilon_t)$; in particular when $\varepsilon_t=0$ the right-hand side is $0$, with no implicit $0\cdot\infty$ ambiguity.

If the accepted horizon entropy-continuity promotion certificate $\mathfrak C_{\mathrm{PageTV}}$ of Definition K.3d.4c supplies the stronger trace-coupled error
$$
\varepsilon_t
\le
\varepsilon_{\mathrm{Page}},
$$
then (K.3.2) holds with $\varepsilon_{\mathrm{Page}}$ in place of $\varepsilon_t$. A bare moment-design certificate without this trace-coupled promotion supplies Corollary K.3.1 rather than the von Neumann entropy estimate.

*Proof.* Page's theorem gives
$$
\mathbb E\,S(\rho_E^{\mathrm{Haar}}(t))
=
S_{\mathrm{Page}}(d_E(t),d_L(t)).
$$
By the coupling certificate, $T_t\le\varepsilon_t\le1-1/d_E(t)$ almost surely. Audenaert's sharp Fannes inequality gives, for every coupled pair,
$$
\left|
S(\rho_E^{\mathrm{PU}}(t))
-
S(\rho_E^{\mathrm{Haar}}(t))
\right|
\le
T_t\ln(d_E(t)-1)+h_2(T_t).
$$
On $[0,1-1/d_E(t)]$, the function $x\mapsto x\ln(d_E(t)-1)+h_2(x)$ is increasing, so
$$
\left|
S(\rho_E^{\mathrm{PU}}(t))
-
S(\rho_E^{\mathrm{Haar}}(t))
\right|
\le
\varepsilon_t\ln(d_E(t)-1)+h_2(\varepsilon_t).
$$
Taking expectations and substituting Page's theorem gives (K.3.2). The final statement follows by monotonicity of the same right-hand side in the certified error parameter. ∎

**Corollary K.3.1 (Second-Moment Page-Purity Closure).** If the accepted horizon design certificate supplies only second-moment control, then the theorem-level conclusion is the Haar Page purity law rather than the full von Neumann entropy law:
$$
\left|
\mathbb E\,\operatorname{tr}\big((\rho_E^{\mathrm{PU}}(t))^2\big)
-
\frac{d_E(t)+d_L(t)}{d_E(t)d_L(t)+1}
\right|
\le
\varepsilon^{(2)}_t.
\tag{K.3.3}
$$

*Proof.* The Haar average purity of a subsystem of a random pure state on $\mathbb C^{d_E}\otimes\mathbb C^{d_L}$ is
$$
\mathbb E_{\mathrm{Haar}}\operatorname{tr}(\rho_E^2)
=
\frac{d_E+d_L}{d_Ed_L+1}.
$$
A second-moment design certificate is exactly a bound on the deviation of degree-$(2,2)$ polynomial observables from their Haar averages. The purity $\operatorname{tr}(\rho_E^2)$ is such a degree-$(2,2)$ observable. Applying the certificate to this observable gives (K.3.3). ∎

**Corollary K.3a (Black-Hole Edge Modes as Predictive Anomaly Inflow).** On a horizon branch where exterior predictive descriptions are quotiented by gauge/frame redundancies but interior degrees of freedom are operationally inaccessible, exterior descent is consistent only when the total anomaly class cancels across the horizon interface:
$$
[\mathcal A_{\mathrm{outside}}]
+
[\mathcal A_{\mathrm{horizon}}]
+
[\mathcal A_{\mathrm{interface}}]
=
0.
$$
The horizon edge code is therefore the minimal boundary completion that makes exterior prediction descend consistently. When the boundary completion saturates the Appendix E area-law channel density, its number of distinguishable edge states is bounded by
$$
\dim\mathcal H_{\mathrm{edge}}
\le
\exp\left(\frac{\mathcal A}{4L_P^2}\right).
$$

*Proof.* Exterior observers identify gauge/frame-related descriptions as redundancies. If the exterior sector alone has nonzero anomaly class, its predictive functional does not descend to the quotient. Adding horizon/interface degrees of freedom multiplies the exterior generating functional by boundary factors, so anomaly phases add. Descent holds exactly when the displayed sum vanishes. The channel bound is Appendix E's area-law capacity bound applied to the edge subsystem on the horizon cross-section. ∎

**Definition K.3b (Predictive Island Markov-Blanket Cost).** Let $R$ be a finite exterior radiation record algebra on a black-hole evaporation branch. Let $\mathcal I_R$ be the finite family of candidate disconnected interior or horizon-adjacent MPU regions whose boundary channels can be admitted into the exterior reconstruction ledger. The empty candidate $\varnothing$ is included. For $I\in\mathcal I_R$, let $C_{\partial I}$ be the Appendix E boundary-channel capacity cost of admitting the boundary of $I$, with
$$
C_{\partial\varnothing}=0.
$$
Define the PU generalized reconstruction cost
$$
S_{\mathrm{gen}}^{\mathrm{PU}}(R;I)
:=
C_{\partial I}
+
S_{\mathrm{pred}}(R\cup I)
-
S_{\mathrm{pred}}(I).
\tag{K.3b.1}
$$
Here $S_{\mathrm{pred}}$ is the retained predictive entropy of the finite record algebra after PCE compression. The second and third terms form the conditional predictive entropy of the radiation relative to the admitted candidate island.

**Theorem K.3c (Predictive Island Markov-Blanket Formula).** On a finite black-hole evaporation branch whose candidate reconstruction regions are the finite family $\mathcal I_R$, the PCE-selected reconstructed radiation entropy is
$$
S_{\mathrm{rec}}(R)
=
\min_{I\in\mathcal I_R}
S_{\mathrm{gen}}^{\mathrm{PU}}(R;I).
\tag{K.3c.1}
$$
Any minimizer $I_*$ is the PCE-minimal disconnected Markov-blanket component for the radiation record. The term $C_{\partial I_*}$ is a boundary channel-capacity cost, not a fundamental geometric area operator. In the regular thermodynamic continuum representation, this capacity term is represented by the usual horizon-area density of Appendix E.

*Proof.* For a fixed candidate $I$, an exterior reconstruction using $R\cup I$ must pay two costs. First, it must admit the boundary channel of $I$, whose finite channel-capacity cost is $C_{\partial I}$. Second, after $I$ is admitted, the residual uncertainty of the radiation record is the conditional predictive entropy
$$
S_{\mathrm{pred}}(R\mid I)
=
S_{\mathrm{pred}}(R\cup I)-S_{\mathrm{pred}}(I).
$$
Thus the total finite predictive reconstruction cost of the candidate is exactly (K.3b.1).

The family $\mathcal I_R$ is finite, so a minimizer exists. PCE selects the admissible reconstruction with least total predictive cost among candidates that preserve the same exterior operational content. Therefore the selected entropy is (K.3c.1).

It remains to identify the minimizer as a Markov blanket. If an additional label or subregion inside the chosen candidate does not change the conditional exterior predictions, Corollary F.10.6c removes it by PCE. If removing a component changes the conditional exterior predictions, then that component is part of the shielding boundary required by Theorem F.10.6b. Hence the retained minimizing component is exactly the PCE-minimal Markov blanket for the radiation record, possibly disconnected. The continuum area reading follows only after the Appendix E channel-density limit is taken. ∎

**Corollary K.3d (PU Page Transition as Island-Blanket Switch).** A nonempty candidate $I$ beats the empty candidate precisely when
$$
C_{\partial I}
<
S_{\mathrm{pred}}(R)
-
\left[
S_{\mathrm{pred}}(R\cup I)-S_{\mathrm{pred}}(I)
\right].
\tag{K.3d.1}
$$
Thus the Page transition is the point at which the predictive-entropy reduction gained by admitting a disconnected Markov-blanket component exceeds the boundary channel-capacity cost of admitting it.

*Proof.* The empty candidate has
$$
S_{\mathrm{gen}}^{\mathrm{PU}}(R;\varnothing)=S_{\mathrm{pred}}(R).
$$
A nonempty candidate wins exactly when
$$
S_{\mathrm{gen}}^{\mathrm{PU}}(R;I)<S_{\mathrm{gen}}^{\mathrm{PU}}(R;\varnothing).
$$
Substituting Definition K.3b gives (K.3d.1). ∎

**Definition K.3d.4 (Horizon Moment-Operator $k$-Design Certificate).** A horizon $k$-design certificate is a finite record
$$
\mathfrak C_{\mathrm{Hdesign}}
=
\left(
\mathcal H_{\mathrm{edge}},
\nu_H,
t_{\mathrm{des}},
\Pi_t^{\mathrm{Haar}},
\gamma_t,
N_t,
\varepsilon_{\mathrm{emit}},
\chi_{\mathrm{Hdesign}}
\right)
\tag{K.3d.4}
$$
where:

1. $\mathcal H_{\mathrm{edge}}$ is the finite horizon edge-code Hilbert space on the branch.

2. $\nu_H$ is a finitely supported probability measure on horizon update unitaries generated by the retained MPU edge dynamics.

3. $t_{\mathrm{des}}\ge2$ is the design order required for the entropy/Page estimate being claimed.

4. $\Pi_t^{\mathrm{Haar}}$ is the Haar moment projection on
$$
\mathcal B(\mathcal H_{\mathrm{edge}}^{\otimes t_{\mathrm{des}}}).
$$

5. The one-step moment operator
$$
\mathcal M_t(\nu_H)(X)
=
\mathbb E_{U\sim\nu_H}
\left[
U^{\otimes t_{\mathrm{des}}}X(U^\dagger)^{\otimes t_{\mathrm{des}}}
\right]
\tag{K.3d.5}
$$
satisfies the certified gap inequality
$$
\left\|
\left(\mathcal M_t(\nu_H)-\Pi_t^{\mathrm{Haar}}\right)
\left(I-\Pi_t^{\mathrm{Haar}}\right)
\right\|_{\mathrm{op}}
\le
1-\gamma_t,
\qquad
0<\gamma_t\le1.
\tag{K.3d.6}
$$

6. $N_t$ is the certified number of horizon update steps.

7. $\varepsilon_{\mathrm{emit}}$ is the certified emission/edge-coupling error between the horizon design channel and the radiation channel used in Theorem K.3.

8. $\chi_{\mathrm{Hdesign}}$ records that the update support, gap, step count, and emission error were fixed before comparison with any Page-curve reconstruction.

**Definition K.3d.4a (Horizon Golay-Expander Design Certificate).** A horizon Golay-expander design certificate is a finite record
$$
\mathfrak C_{\mathrm{HGol}}
=
\left(
\mathcal G_{24}^{H},
\mathcal S_H,
\nu_H,
t_{\mathrm{des}},
\Pi_t^{\mathrm{Haar}},
\gamma_t^{G},
N_t,
\varepsilon_{\mathrm{emit}},
S_H,
p_t,
\chi_{\mathrm{HGol}}
\right)
\tag{K.3d.4a.1}
$$
where:

1. $\mathcal G_{24}^{H}$ is the marked horizon Golay-Leech syndrome frame inherited from the retained horizon edge code;

2. $\mathcal S_H$ is a finite symmetric support of horizon update unitaries generated by syndrome permutations, syndrome phase gates, and ND-RID refresh-compatible edge moves preserving $\mathcal G_{24}^{H}$;

3. $\nu_H$ is a probability measure supported on $\mathcal S_H$;

4. $t_{\mathrm{des}}\ge2$ is the required design order;

5. $\Pi_t^{\mathrm{Haar}}$ is the Haar moment projection on $\mathcal B(\mathcal H_{\mathrm{edge}}^{\otimes t_{\mathrm{des}}})$;

6. the moment operator
$$
\mathcal M_t^{G}(\nu_H)(X)
=
\mathbb E_{U\sim\nu_H}
\left[
U^{\otimes t_{\mathrm{des}}}X(U^\dagger)^{\otimes t_{\mathrm{des}}}
\right]
\tag{K.3d.4a.2}
$$
has a certified Golay-expander gap
$$
\left\|
\left(\mathcal M_t^{G}(\nu_H)-\Pi_t^{\mathrm{Haar}}\right)
\left(I-\Pi_t^{\mathrm{Haar}}\right)
\right\|_{\mathrm{op}}
\le
1-\gamma_t^{G},
\qquad
0<\gamma_t^{G}\le1;
\tag{K.3d.4a.3}
$$

7. $S_H=A_H/(4L_P^2)$ is the horizon capacity in nats on the branch, and $p_t$ is the certified polynomial overhead for the $t_{\mathrm{des}}$ moment representation;

8. if a capacity-scaled lower bound is claimed, the certificate supplies a fixed constant $c_t>0$ such that
$$
\gamma_t^{G}\ge \frac{c_t}{S_Hp_t};
\tag{K.3d.4a.4}
$$

9. $\varepsilon_{\mathrm{emit}}$ is the finite emission-channel mismatch used in Definition K.3d.4;

10. $\chi_{\mathrm{HGol}}$ records that $\mathcal S_H,\nu_H,\gamma_t^{G},N_t,\varepsilon_{\mathrm{emit}}$, and any constants in (K.3d.4a.4) were fixed before Page-curve comparison.

**Theorem K.3d.4b (Golay-Expander Certificate Supplies the Horizon Design Gate).** An accepted $\mathfrak C_{\mathrm{HGol}}$ canonically supplies a horizon moment-operator $k$-design certificate $\mathfrak C_{\mathrm{Hdesign}}$ of Definition K.3d.4 with
$$
\gamma_t=\gamma_t^{G}.
\tag{K.3d.4b.1}
$$
Consequently
$$
\left\|
\mathcal M_t^{G}(\nu_H^{*N_t})-\Pi_t^{\mathrm{Haar}}
\right\|_{\mathrm{op}}
\le
(1-\gamma_t^{G})^{N_t},
\tag{K.3d.4b.2}
$$
and the Page input error is
$$
\varepsilon_{\mathrm{Page}}
=
(1-\gamma_t^{G})^{N_t}+\varepsilon_{\mathrm{emit}}.
\tag{K.3d.4b.3}
$$
If the capacity-scaled gap (K.3d.4a.4) is part of the accepted record, then every
$$
N_t
\ge
\frac{S_Hp_t}{c_t}
\log\frac{1}{\varepsilon}
\tag{K.3d.4b.4}
$$
gives
$$
(1-\gamma_t^{G})^{N_t}\le e^{-N_t\gamma_t^{G}}\le\varepsilon.
\tag{K.3d.4b.5}
$$

*Proof.* Definition K.3d.4 requires a finite edge Hilbert space, a finite update measure, a design order, a Haar moment projection, a one-step moment gap, a step count, an emission error, and a forward-lock record. Definition K.3d.4a supplies exactly these entries with the additional restriction that the support is generated by the marked Golay-Leech syndrome frame. Therefore the same tuple, after forgetting the Golay-origin labels, is a valid $\mathfrak C_{\mathrm{Hdesign}}$ with $\gamma_t=\gamma_t^{G}$.

Equation (K.3d.4b.2) is the contraction estimate of Theorem K.3d.5 applied to the supplied moment gap. Equation (K.3d.4b.3) is the triangle inequality with the certified emission mismatch, as in (K.3d.8). If (K.3d.4a.4) holds and $N_t$ satisfies (K.3d.4b.4), then
$$
N_t\gamma_t^{G}
\ge
\log\frac1\varepsilon.
$$
Since $1-x\le e^{-x}$ for $x\in[0,1]$, (K.3d.4b.5) follows. ∎

**Definition K.3d.4c (Horizon Entropy-Continuity Promotion Certificate).** A horizon entropy-continuity promotion certificate is a finite record
$$
\mathfrak C_{\mathrm{PageTV}}
=
(\mathfrak C_{\mathrm{base}},d_E,d_L,\varepsilon_{\mathrm{Page}},\chi_{\mathrm{PageTV}})
\tag{K.3d.4c.1}
$$
where $\mathfrak C_{\mathrm{base}}$ is either an accepted horizon moment-operator certificate $\mathfrak C_{\mathrm{Hdesign}}$ of Definition K.3d.4 or an accepted Golay-expander certificate $\mathfrak C_{\mathrm{HGol}}$ of Definition K.3d.4a. The base certificate supplies the registered moment/Golay branch only; the additional promotion data, not $\mathfrak C_{\mathrm{base}}$ by itself, certify a coupling of the PU reduced early-radiation state and the Haar reduced state satisfying
$$
\frac12
\left\|
\rho_E^{\mathrm{PU}}(t)-\rho_E^{\mathrm{Haar}}(t)
\right\|_1
\le
\varepsilon_{\mathrm{Page}},
\qquad
0\le\varepsilon_{\mathrm{Page}}\le1-\frac1{d_E(t)}
\tag{K.3d.4c.2}
$$
for the registered evaporation time and dimensions. The forward-lock $\chi_{\mathrm{PageTV}}$ records that the coupling protocol, dimension ledger, norm, and error ceiling were fixed before Page-curve comparison. This promotion certificate is stronger than a moment-design certificate: a bare $t_{\mathrm{des}}=2$ moment certificate controls the Haar Page-purity observable, while the von Neumann entropy estimate of Theorem K.3 requires the trace-coupled condition (K.3d.4c.2).

**Remark K.3d.4c.a (Status of the Promotion Data).** The trace-coupled bound (K.3d.4c.2) is an additional certified hypothesis, not a consequence of the base moment-design certificate alone. A derivation of (K.3d.4c.2) from $\mathfrak C_{\mathrm{Hdesign}}$ would have to supply an explicit high-moment-to-trace-norm upgrade theorem, including the required scaling of $t_{\mathrm{des}}$ in $d_E$ and the associated error constants; in common polynomial-approximation routes this requires $t_{\mathrm{des}}$ to grow with the relevant dimension parameter, often at least logarithmically in $d_E$. Alternatively, the certificate may supply a separate dynamical coupling or trace-mixing estimate directly in trace norm. The branch organization therefore records $\mathfrak C_{\mathrm{PageTV}}$ as admissible promotion data, not as freely available from $\mathfrak C_{\mathrm{base}}$. Supplying such a trace-coupled promotion certificate from first principles for a concrete physical horizon remains a branch-level development task.

**Theorem K.3d.5 (Certified Horizon $k$-Design Mixing).** If $\mathfrak C_{\mathrm{Hdesign}}$ is accepted, then after $N_t$ horizon update steps the moment channel obeys
$$
\left\|
\mathcal M_t(\nu_H^{*N_t})-\Pi_t^{\mathrm{Haar}}
\right\|_{\mathrm{op}}
\le
(1-\gamma_t)^{N_t}.
\tag{K.3d.7}
$$
The corresponding radiation channel is an
$$
\varepsilon_{\mathrm{mom}}
=
(1-\gamma_t)^{N_t}+\varepsilon_{\mathrm{emit}}
\tag{K.3d.8}
$$
approximate $t_{\mathrm{des}}$-design input in moment norm. This moment bound is sufficient for the Page-purity law of Corollary K.3.1 when the controlled observable is $\operatorname{tr}(\rho_E^2)$. It becomes a von Neumann Page-curve input for Theorem K.3 only when paired with the trace-coupled promotion certificate $\mathfrak C_{\mathrm{PageTV}}$ of Definition K.3d.4c, in which case the certified trace error is denoted $\varepsilon_{\mathrm{Page}}$.

*Proof.* Since $\Pi_t^{\mathrm{Haar}}$ is the Haar fixed-point projection,
$$
\mathcal M_t(\nu_H)\Pi_t^{\mathrm{Haar}}=\Pi_t^{\mathrm{Haar}},
\qquad
\Pi_t^{\mathrm{Haar}}\mathcal M_t(\nu_H)=\Pi_t^{\mathrm{Haar}}.
$$
Thus on the orthogonal complement of the Haar-invariant subspace, the one-step contraction norm is at most $1-\gamma_t$ by (K.3d.6). Therefore
$$
\left\|
\left(\mathcal M_t(\nu_H)\right)^{N_t}
-
\Pi_t^{\mathrm{Haar}}
\right\|_{\mathrm{op}}
=
\left\|
\left[
\left(\mathcal M_t(\nu_H)-\Pi_t^{\mathrm{Haar}}\right)
\left(I-\Pi_t^{\mathrm{Haar}}\right)
\right]^{N_t}
\right\|_{\mathrm{op}}
\le
(1-\gamma_t)^{N_t}.
$$
The convolution law for independent horizon update steps gives
$$
\mathcal M_t(\nu_H^{*N_t})=\left(\mathcal M_t(\nu_H)\right)^{N_t},
$$
so (K.3d.7) follows. The emission channel differs from the certified horizon moment channel by at most $\varepsilon_{\mathrm{emit}}$ in the same moment norm, hence the triangle inequality gives the moment-norm error (K.3d.8). Moment-norm control alone does not imply the trace-coupled entropy-continuity estimate (K.3.1); that stronger conclusion is exactly the additional content of Definition K.3d.4c. ∎

**Corollary K.3d.6 (Page-Curve Promotion Gate).** The von Neumann Page-curve statement of Theorem K.3 is theorem-level only on a branch carrying an accepted horizon entropy-continuity promotion certificate $\mathfrak C_{\mathrm{PageTV}}$ of Definition K.3d.4c. A bare accepted moment-design certificate $\mathfrak C_{\mathrm{Hdesign}}$ with $t_{\mathrm{des}}\ge2$ supplies moment control; for $t_{\mathrm{des}}=2$ the closed theorem-level output is the Page-purity law of Corollary K.3.1. Without the trace-coupled promotion certificate, the structural information-conservation, edge-inflow, and island-blanket results remain theorem-level on their stated branches, while the full von Neumann Page-curve shape remains a trace-coupled entropy-continuity branch result.

*Proof.* Theorem K.3 assumes the trace-distance coupling (K.3.1), not merely equality of finitely many Haar moments. Theorem K.3d.5 supplies a certified moment-norm estimate; applying that estimate to the degree-$(2,2)$ purity observable gives Corollary K.3.1. To use Audenaert's entropy-continuity inequality in Theorem K.3, one additionally needs the trace-coupled bound certified by Definition K.3d.4c. Therefore the full entropy Page-curve estimate is promoted exactly on the $\mathfrak C_{\mathrm{PageTV}}$ branch. ∎

**Current Status:** The conceptual framework for black hole information conservation is established, with key components (SPAP dynamics, thermodynamic bounds, perspectival encoding, retained no-deletion, horizon edge-inflow consistency, Page-purity control on the certified moment-design branch, and the finite predictive island Markov-blanket formula) rigorously derived on their stated branches. The full von Neumann Page-curve estimate is theorem-level only on the stronger trace-coupled entropy-continuity promotion branch of Definition K.3d.4c. Detailed calculations of information extraction rates, explicit construction of the Perspectival Information Channel capacity as a function of observer resources, accepted horizon moment-operator design certificates, accepted $\mathfrak C_{\mathrm{PageTV}}$ certificates, and the continuum quantum-extremal-surface representation of the finite Markov-blanket minimizer remain branch-level development tasks.

### K.3.6 Finite-Budget Predictive Uncertainty Gate

The finite-channel-capacity bounds of Appendix E and the predictive island Markov-blanket cost of Definition K.3b together bound the information that can be encoded on integer-dimensional supports of an evaporating-horizon configuration. This subsection records the complementary norm bound that controls *jointly trapped* configuration and update-momentum supports at finite cycle budget, ruling out hidden-remnant sectors whose support has joint dimension below a budget-dependent threshold.

**Definition K.3e (Finite-Budget Update Group and Discrete Fourier).** Let $\Lambda \geq 1$ be the SPAP cycle budget on a fixed evaporation branch. Let $\mathbb{Z}/\Lambda\mathbb{Z}$ be the finite-budget update-count group of Definition Q.0.6a.1 truncated to budget $\Lambda$. The *finite-budget discrete Fourier operator* $F_\Lambda$ on $\ell^2(\mathbb{Z}/\Lambda\mathbb{Z})$ is the unitary

$$
(F_\Lambda \psi)(k)
:=
\frac{1}{\sqrt{\Lambda}}
\sum_{N=0}^{\Lambda-1}
\psi(N)\,e^{-2\pi i N k/\Lambda},
\qquad
k \in \mathbb{Z}/\Lambda\mathbb{Z}.
\tag{K.3e.1}
$$

For subsets $X \subset \mathbb{Z}/\Lambda\mathbb{Z}$ (configuration support) and $P \subset \mathbb{Z}/\Lambda\mathbb{Z}$ (update-momentum support), the associated projections are

$$
\Pi_X = \mathrm{diag}(\mathbf{1}_X),
\qquad
\Pi_P = \mathrm{diag}(\mathbf{1}_P),
\tag{K.3e.2}
$$

acting diagonally on $\ell^2(\mathbb{Z}/\Lambda\mathbb{Z})$ and on its Fourier dual respectively. Whenever logarithmic dimensions are used below, assume $\Lambda\ge2$ and $X,P$ are nonempty; if either support is empty, the restricted norm is $0$.

**Theorem K.3e (Finite-Budget Predictive Uncertainty Gate).** *For every budget $\Lambda \geq 1$ and every pair of supports $X, P \subset \mathbb{Z}/\Lambda\mathbb{Z}$, the operator norm satisfies*

$$
\bigl\|\Pi_X\,F_\Lambda\,\Pi_P\bigr\|_{\mathrm{op}}
\leq
\sqrt{\frac{|X|\cdot|P|}{\Lambda}}.
\tag{K.3e.3}
$$

*If $\Lambda\ge2$ and $X,P$ are nonempty, then with finite-budget resolution $h := 1/\Lambda$ and effective dimensions $\delta_X := \log_\Lambda|X|$, $\delta_P := \log_\Lambda|P|$,*

$$
\bigl\|\Pi_X\,F_\Lambda\,\Pi_P\bigr\|_{\mathrm{op}}
\leq
h^{(1 - \delta_X - \delta_P)/2}.
\tag{K.3e.4}
$$

*The Hilbert--Schmidt estimate is sharp in the subgroup-dual saturation case $|X|\cdot|P|=\Lambda$. No sharpness claim is made for arbitrary supports.*

*Proof.* By definition of $F_\Lambda$ in (K.3e.1), the matrix entries of $F_\Lambda$ in the standard basis satisfy $|(F_\Lambda)_{kN}| = 1/\sqrt{\Lambda}$ for every $k, N$. The composition $\Pi_X F_\Lambda \Pi_P$ has matrix entries

$$
(\Pi_X F_\Lambda \Pi_P)_{kN}
=
\mathbf{1}_X(k)\,(F_\Lambda)_{kN}\,\mathbf{1}_P(N),
$$

a $|X| \times |P|$ submatrix of $F_\Lambda$ (extended by zeros to $\Lambda \times \Lambda$). The Hilbert-Schmidt norm satisfies

$$
\|\Pi_X F_\Lambda \Pi_P\|_{\mathrm{HS}}^2
=
\sum_{k \in X, N \in P}|(F_\Lambda)_{kN}|^2
=
\frac{|X|\cdot|P|}{\Lambda}.
$$

Since the operator norm is bounded by the Hilbert-Schmidt norm, $\|\Pi_X F_\Lambda \Pi_P\|_{\mathrm{op}} \leq \|\Pi_X F_\Lambda \Pi_P\|_{\mathrm{HS}} = \sqrt{|X||P|/\Lambda}$, which is (K.3e.3). For $\Lambda\ge2$ and nonempty supports, Equation (K.3e.4) follows by substituting $|X| = \Lambda^{\delta_X}$, $|P| = \Lambda^{\delta_P}$ into (K.3e.3) and rewriting in terms of $h = 1/\Lambda$. The saturation statement follows in the subgroup-dual case. If $X$ is a subgroup of $\mathbb{Z}/\Lambda\mathbb{Z}$ and $P=X^{\perp}$ is its annihilator subgroup, then $|X||P|=\Lambda$ and the normalized indicator of $X$ is mapped by $F_\Lambda$ to the normalized indicator of $P$ up to phase. Thus the restricted operator has norm $1$, matching (K.3e.3). For general supports the Hilbert--Schmidt estimate is only an upper bound. $\square$

**Corollary K.3f (No-Hidden-Remnant Theorem).** *Let an evaporation-branch protocol have budget $\Lambda\ge2$ and let its predictive response functional be supported jointly on a configuration trapped set $X$ and an update-momentum trapped set $P$ with nonempty supports satisfying $|X|\cdot|P| < \Lambda$. Then for every initial state $\psi$ supported on $P$ and every output observable $O$ supported on $X$,*

$$
\bigl|\langle O,\,F_\Lambda \psi\rangle\bigr|
\leq
\sqrt{\frac{|X|\cdot|P|}{\Lambda}}\,
\|O\|\,\|\psi\|.
\tag{K.3f.1}
$$

*Equivalently, for every unit vector $\psi$ supported on $P$, the leakage probability outside $X$ obeys*

$$
\left\|({\rm id}-\Pi_X)F_\Lambda\psi\right\|^2
\ge
1-\frac{|X|\cdot|P|}{\Lambda}
=
1-h^{1-\delta_X-\delta_P}
>0.
\tag{K.3f.2}
$$

*Proof.* Inequality (K.3f.1) is the operator-norm identity applied to states with $\Pi_P\psi = \psi$ and observables with $\Pi_X O = O$:

$$
|\langle O, F_\Lambda \psi\rangle|
=
|\langle \Pi_X O, F_\Lambda \Pi_P \psi\rangle|
\leq
\|\Pi_X F_\Lambda \Pi_P\|_{\mathrm{op}}\,\|O\|\,\|\psi\|,
$$

and Theorem K.3e bounds the right factor. For unit $\psi$ with $\Pi_P\psi=\psi$, unitarity gives
$$
1
=
\|F_\Lambda\psi\|^2
=
\|\Pi_XF_\Lambda\psi\|^2
+
\|({\rm id}-\Pi_X)F_\Lambda\psi\|^2.
$$
By Theorem K.3e, $\|\Pi_XF_\Lambda\psi\|^2\le |X||P|/\Lambda$. Substitution gives (K.3f.2). $\square$

**Remark K.3f.1 (Status and Scope).** Theorem K.3e and Corollary K.3f are operator-norm statements on a finite-budget cyclic group; they do not invoke any continuous spacetime construction and are compatible with the smooth emergent IR geometry of Section 11 and the regularity necessity of Theorem C.2. The trapped sets $X$ and $P$ are *operational* obstruction sets indexed by the SPAP cycle structure of Definition Q.0.6a.1; they are not fundamental ontological objects. The bound applies to every evaporation-branch protocol of finite budget, including the predictive island Markov-blanket configurations of Definition K.3b: any candidate hidden-remnant sector with joint configuration-momentum support of dimension $\delta_X + \delta_P < 1$ has leakage probability at least $1-h^{1-\delta_X-\delta_P}$, ruling out indefinitely persistent hidden ledgers at finite resolution.

**Remark K.3f.2 (Connection to the Center-Ledger Area-Law Criterion).** On the rootless flux-tube branch of Proposition Z.8d, Theorem X.9.5d.4 gives the finite center-ledger criterion for Wilson-loop area law once the electric center class is unbroken and the branch supplies a positive surface gap. Corollary K.3f bounds the leakage rate of any line-protocol trapped sector at finite cycle budget through finite-resolution Wilson-line probes, supplying a quantitative companion to that criterion: indefinite confinement of a center charge in a fractal-supported flux configuration would require $\delta_X+\delta_P\ge1$, which is the integer-form regime addressed by the center-ledger datum of Definition X.9.5d.3. The finite-budget gate therefore bounds the would-be loophole of subcritical fractal-supported hidden remnants while Theorem X.9.5d.4 supplies the area-law criterion.


## K.4 Arrow of Time and Temporal Asymmetry

**Puzzle:** Why does time have a preferred direction, with entropy increasing toward the future? Within standard statistical mechanics, the entropy conjecture — that the universe's coarse-grained entropy evolves as a time-symmetric, time-translation invariant Markov process [Wolpert, Rovelli & Scharnhorst 2025] — does not by itself select a temporal direction. As those authors prove rigorously, any such selection requires conditioning on boundary data at a chosen time, and neither the Boltzmann brain hypothesis (conditioning on the present) nor the Past Hypothesis (conditioning on the Big Bang) is privileged by the formalism. The second law's justification is circular within this framework: establishing the reliability of experimental records requires the second law, which in turn rests on those records [Wolpert, Rovelli & Scharnhorst 2025; Wolpert & Kipper 2024; Rovelli 2022].

**PU Resolution:** The thermodynamic arrow of time emerges directly from the irreversibility of the SPAP cycle. As rigorously established in Appendix O (Section O.4) and Appendix J, each predictive operation incurs the irreducible entropy cost $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$ nats (Theorem 31). This fundamental irreversibility arises from the 2-to-1 state merge required by self-referential prediction (Lemma Z.2) and cannot be eliminated without violating logical consistency of the predict-verify-update cycle.

The framework establishes (Appendix O, Theorem O.2):
$$\frac{dS_{total}}{dt} = \sum_{\text{MPUs}} \frac{\varepsilon_i}{\tau_i} \geq 0$$
with equality only for static (non-predictive) configurations. The arrow of time is not imposed but derived: the forward direction is defined by increasing total SPAP entropy, which is necessary for the network to maintain predictive coherence. This provides a microscopic foundation for the Second Law of Thermodynamics. The PU derivation chain does not exhibit the circularity identified by Wolpert, Rovelli & Scharnhorst [2025] — that the second law is needed to trust the data from which the second law is inferred. The qualitative arrow follows unconditionally from the per-cycle entropy cost: SPAP $\to$ Lemma Z.2 $\to$ Theorem 31 ($\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$) $\to$ Theorem P.8.2 (time is necessarily directional). The quantitative suppression of reversed trajectories, $P_R/P_F \leq e^{-N\varepsilon}$ (Theorem O.3), holds in the low-noise detailed-balance regime. Both results proceed from the logical structure of prediction, not from conditioning on cosmological boundary data. The direction of memory follows from the same source: memory records verified outcomes, and the ordering of verification after prediction is fixed by the SPAP cycle (Theorem P.12.2, Step 2), not by an independent thermodynamic assumption.

**Cosmological Implications:** The low-entropy Big Bang corresponds to a state with minimal SPAP accumulation — the network begins in a high-information-potential configuration and irreversibly evolves toward thermodynamic equilibrium through cumulative prediction cycles. The "Past Hypothesis" [Albert 2000; Davies 1977; Reichenbach 1956] — that the early universe had low entropy — is reinterpreted as the initial condition of maximum predictive capacity. Unlike the standard formulation, which must posit this condition as a brute cosmological fact [Carroll 2020], the PU framework offers a dynamical account: PCE optimization of the nascent MPU network favors an initial configuration of maximal predictive capacity, providing a candidate mechanism for selecting the low-entropy boundary condition.

**Connection to Other Arrows:** The framework naturally unifies multiple arrows of time:
- **Thermodynamic**: SPAP entropy production
- **Causal**: ND-RID channel directionality (Appendix E)
- **Psychological**: Memory formation costs $\varepsilon$ per bit (Appendix J)
- **Cosmological**: Expansion driven by relaxation of predictive tension

**Perspectival Structure of the Arrow:** The arrow of time is not uniform across systems but graded by self-referential depth (Proposition O.4.2). Level 0 systems (MPUs) exhibit the bare thermodynamic ratchet: $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$ per cycle. Level 1 simple aggregates remain SPAP-flat and Shannon-level. A self-modeling system (Level 2 and above) experiences a ratchet with additional internal structure: patterns targeting its self-model $\mathcal{M}_S$ at sufficient depth incur the SPAP-divergent cost of Theorem M.10.3, with exact self-restoration sitting at the unprocessable $\mu_S = \infty$ boundary (Theorems M.10.4 and M.10.6). Partial or shallow self-model corrections may remain at baseline cost (Remark M.10.3), but the processing cost grows without bound as the self-referential depth of the restoration demand increases (Corollary B.2.1). The second law is therefore not merely a statement about ensembles but a perspectival necessity: fundamental for every observer, compatible with global information conservation (Theorem E.9.5), and impossible to circumvent from within the observer's own perspective even when aided by a more complex external agent (Corollary O.4.1; Corollary O.4.3). The depth of irreversibility — the cost of temporal self-restoration — depends on the observer's position in the complexity hierarchy. The same event-history is externally accessible to a more complex observer and internally sealed to the system that lived it (Corollary O.4.3).

This resolution is rigorous and complete, with the arrow of time emerging as a theorem rather than an axiom. In the terminology of Wolpert, Rovelli & Scharnhorst [2025], the PU framework sidesteps the need to choose a "nailed set" of conditioning times for the entropy process: the arrow operates at every MPU cycle via the $\varepsilon$-ratchet, so no boundary conditioning is required and the Boltzmann brain hypothesis — along with variants such as their instructive "1000CE hypothesis" — does not arise as a competing account of temporal direction. Further development includes simulating MPU network dynamics incorporating the $\varepsilon$-cost to demonstrate robust emergence of a global arrow of time and exploring whether this mechanism can explain the universe's initial low effective entropy state from a PCE perspective.

## K.5 Operational Weak Cosmic Censorship

**Puzzle:** General relativity predicts singularities (infinite curvature) at black hole centers and the Big Bang. Classical weak cosmic censorship conjectures that singularities are hidden behind horizons, but lacks rigorous proof. Are naked singularities physically possible?

**PU Resolution:** The framework provides a rigorous information-theoretic exclusion of operationally meaningful naked singularities through throughput bounds and curvature-resolution limits.

**Definition K.5.1 (Predictive Throughput).**
For a closed surface $S$ with area $A(S)$, the predictive throughput requirement is:
$$L(S) := \sup_{\mathcal{P}} \limsup_{n \to \infty} \frac{I(\rho_{\mathrm{int}}^{(\mathcal{P},n)}; \mathcal{R}_n^{(\mathcal{P})})}{n \, \tau_{min}}$$
where $I$ is the mutual information between interior state and classical measurement record, and the supremum is over all MPU-admissible protocols $\mathcal{P}$.

**Theorem K.5.1 (ND-RID Throughput Bound).**
Conditional on geometric regularity (Theorem 43):
$$L(S) \leq \frac{N_{eff\_links}(S) \cdot C_{\max}}{\tau_{min}} = \frac{\sigma_{eff\_link} \, A(S) \cdot C_{\max}}{\tau_{min}} + o(A)$$
with $C_{\max} < \ln d_0$ (Theorem E.2) and $\sigma_{eff\_link} = \chi/(\eta\delta^2)$ (Theorem E.3).

*Proof.* Each of $N_{eff\_links}(S)$ independent channels has capacity at most $C_{\max}$ per use. Each channel operates at most once per $\tau_{min}$. The bound follows from Theorems E.2 and E.3.

**Lemma K.5.2 (Curvature-Sensitivity Bound).**
For CPTP transport $\mathcal{E}_\gamma$ on the refresh/minorization branch with ND-RID contraction factor $f_{RID} < 1$ over $n(\gamma)$ cycles:
$$D_{tr}(\mathcal{E}_\gamma(\rho_1), \mathcal{E}_\gamma(\rho_2)) \leq f_{RID}^{n(\gamma)} D_{tr}(\rho_1, \rho_2)$$
Curvature-dependent unitary holonomy preserves trace distance; only the dissipative component contracts.

**Lemma K.5.3 (Operational Curvature-Resolution Bound).**
In the manifold regime at MPU resolution $\delta$, the continuum curvature tensor is operationally meaningful only when:
$$\|R_{\mu\nu\rho\sigma}R^{\mu\nu\rho\sigma}\|^{1/2} \delta^2 = O(1)$$
equivalently $\|R\| = O(1/\delta^2)$. When $\|R\|\delta^2 \gg 1$, the manifold approximation fails.

*Proof.* In Fermi normal coordinates, metric corrections scale as $R x^2$. For the expansion to be controlled on the minimal operational neighborhood $|x| \sim \delta$, one requires $|R|\delta^2 = O(1)$.

**Theorem K.5.4 (Operational Weak Cosmic Censorship).**
In the manifold regime (Theorem 43), curvature blow-up visible to exterior observers is operationally excluded. Any would-be naked singularity ($\|R\| \to \infty$ along a curve future-causally connected to exterior observers through finite-area $S$) is resolved by one of:

1. **Horizon formation:** A capacity-saturating boundary forms, decoupling exterior predictions from interior microdetails.
2. **Manifold breakdown:** The classical manifold approximation fails before curvature divergence becomes operationally meaningful at MPU resolution.

*Proof.* By Lemma K.5.3, $\|R\| \to \infty$ cannot occur while remaining in the manifold regime at fixed $\delta$. Once $\|R\|$ exceeds $O(1/\delta^2)$, the continuum description is no longer valid. The dichotomy follows.

**Corollary K.5.5 (Boundary Entropy).**
At capacity saturation, the boundary entropy is:
$$S_{BH}(S) = N_{eff\_links}(S) \cdot C_{\max} = \frac{c^3}{4G\hbar} A(S) + o(A)$$
using the identification $G = \eta\delta^2 c^3/(4\hbar\chi C_{\max})$ from Equation E.9.

**Physical Interpretation:** The framework replaces geometric cosmic censorship with information-theoretic censorship: one cannot extract infinite information about a would-be singularity through finite area. The "singularity" manifests as either (i) a computation-induced information horizon where throughput saturates, or (ii) a breakdown of the continuum approximation where discrete MPU structure becomes dominant. Both outcomes preserve exterior predictability.


## K.6 Strong CP Problem Resolution

**Puzzle:** Quantum Chromodynamics (QCD) permits a CP-violating term proportional to $\theta_{\text{QCD}} \, \mathrm{tr}(G_{\mu\nu} \tilde{G}^{\mu\nu})$, yet the experimental bound on the neutron electric dipole moment constrains $|\bar{\theta}| < 10^{-10}$ (Abel et al. 2020). Why is this parameter so unnaturally small, and why does CP violation appear in the weak sector but not in the strong sector?

**PU Resolution:** The framework provides a branch-level resolution through two independent geometric mechanisms operating on the PCE-Attractor orbit $\operatorname{Gr}(2,8)$. The first fixes $\theta_{\text{QCD}}=0$ on the σ-symmetric topological-cost branch. The second fixes $\arg(\det M_q)=0$ only on a certified positive-orientation real-Yukawa branch: $E_8$ reality supplies real Yukawa data, while the determinant-orientation certificate selects the positive connected component. Under both branch inputs, $\bar\theta=0$.

### K.6.1 The Physical θ-Parameter

The physical CP-violating parameter in QCD is the combination:
$$\bar{\theta} = \theta_{\text{QCD}} + \arg(\det M_q)$$
where $\theta_{\text{QCD}}$ is the vacuum angle and $M_q$ is the quark mass matrix. The experimental constraint $|\bar{\theta}| < 10^{-10}$ from the neutron electric dipole moment (Abel et al. 2020; Baker et al. 2006) requires explanation for both terms.

**Definition K.6.1 (Topological Charge Density).**
$$Q(x) = \frac{g_s^2}{32\pi^2} G^a_{\mu\nu}(x) \tilde{G}^{a\mu\nu}(x)$$

The integrated topological charge $\nu = \int d^4x \, Q(x) \in \mathbb{Z}$ counts the instanton number.

The neutron electric dipole moment scales as $d_n \sim 10^{-16} \bar{\theta}$ e·cm (Crewther et al. 1979; Pospelov & Ritz 2005), making the current experimental bound $|d_n| < 1.8 \times 10^{-26}$ e·cm (Abel et al. 2020) a precision probe of CP violation in the strong sector.

### K.6.2 Framework Context and Fundamental Parameters

The resolution employs the geometric structures established in earlier sections:

**Table K.6.0: Fundamental Parameters**

| Quantity | Symbol | Value | Source |
|:---------|:-------|:------|:-------|
| Minimal complexity | $K_0$ | 3 | Theorem 15 |
| Hilbert space dimension | $d_0$ | 8 on the minimal Appendix Z branch | Theorem 23; Theorem Z.2 |
| SPAP dissipation | $\varepsilon$ | $\ln 2$ on the attractor branch | Theorem 31; Definition 15a |
| Active dimension | $a$ | 2 | Theorem Z.1 |
| Inactive dimension | $b$ | $d_0 - a = 6$ | Definition |
| Interface modes | $M$ | $2ab = 24$ | Theorem Z.5 |
| Golay code dimension | $k$ | $M/2=12$ on the predictive-recovery MacWilliams branch | Def Z.13b.0; Thm Z.13b.0a; Thm Z.13b |

**Definition K.6.2 (PCE-Attractor State).**
$$\rho_0 = \frac{1}{a}I_a \oplus 0_b = \frac{1}{2}\begin{pmatrix} I_2 & 0 \\ 0 & 0_6 \end{pmatrix}$$

**Imported result (Theorem Z.6.3a, Attractor Orbit).** The orbit of $\rho_0$ under unitary conjugation is:
$$\mathcal{O}_{\rho_0} = \{U\rho_0 U^\dagger : U \in U(8)\} \cong \text{Gr}(2,8)$$
the complex Grassmannian of 2-planes in $\mathbb{C}^8$, with complex dimension $\dim_{\mathbb{C}} = ab = 12$ and real dimension $\dim_{\mathbb{R}} = 2ab = 24 = M$.

### K.6.3 The σ-Involution on Gr(2,8)

**Definition K.6.3 (σ-Involution).** The complex Grassmannian $\text{Gr}(2,8)$ admits a canonical anti-holomorphic involution $\sigma$ induced by complex conjugation on $\mathbb{C}^8$:
$$\sigma: \text{Gr}(2,8) \to \text{Gr}(2,8), \quad W \mapsto \bar{W}$$
where $\bar{W}$ denotes the complex conjugate subspace. Equivalently, on density matrices: $\sigma(\rho) = \bar{\rho}$.

**Definition K.6.4 (Kähler Triple).** The Grassmannian $\text{Gr}(2,8)$ carries three compatible structures:

- **Riemannian metric** $g_{KE}$: the Kähler-Einstein metric
- **Complex structure** $J$: multiplication by $i$ on tangent spaces
- **Symplectic form** $\omega$: the Kähler form

satisfying $\omega(X, Y) = g_{KE}(JX, Y)$ and $\nabla J = 0$.

**Lemma K.6.1 (Bures-Kähler Relation).** The Bures metric relates to the Kähler-Einstein metric by:
$$g_B = \frac{1}{4}g_{KE}$$

*Proof.* From Theorem Z.5 (Step 5), the QFI eigenvalue is $\lambda = 1$ for interface generators. The Bures metric is $g_B = F_Q/4$ by definition, where $F_Q$ is the quantum Fisher information. At the PCE-Attractor with $F_Q = 1$ per interface mode, this gives $g_B = (1/4)I_{24}$. ∎

**Proposition K.6.1 (Properties of σ).**

(a) $\sigma^2 = \text{id}$ (involution)

(b) $\sigma_* \circ J = -J \circ \sigma_*$ (anti-holomorphic)

(c) $\sigma^* g_{KE} = g_{KE}$ (isometry)

(d) $\sigma^* \omega = -\omega$ (anti-symplectic)

*Proof.*

(a) $\sigma(\sigma(\rho)) = \bar{\bar{\rho}} = \rho$ since double conjugation is identity.

(b) The complex structure $J$ acts as multiplication by $i$. Under conjugation, $i \mapsto -i$, so $\sigma_*(JX) = -J\sigma_*(X)$.

(c) The metric $g_{KE}$ is defined by real inner products in the tangent space. Complex conjugation preserves real inner products.

(d) The symplectic form satisfies $\omega(X,Y) = g_{KE}(JX, Y)$. Using (b) and (c):
$$\sigma^*\omega(X,Y) = \omega(\sigma_*X, \sigma_*Y) = g_{KE}(J\sigma_*X, \sigma_*Y) = g_{KE}(-\sigma_*JX, \sigma_*Y) = -g_{KE}(JX, Y) = -\omega(X,Y)$$
∎

**Proposition K.6.2 (Parity Transformation of Gauge Fields).** Under the parity transformation $P: \mathbf{x} \to -\mathbf{x}$, the components of the gluon field strength tensor transform as:
$$P: G^{0i} \to -G^{0i}, \quad G^{ij} \to G^{ij}$$

*Proof.* The field strength tensor $G_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu + ig[A_\mu, A_\nu]$ transforms under parity according to the vector nature of $A_\mu$. Since $A_0$ is a scalar and $A_i$ are vectors under parity, we have $P: A_0(\mathbf{x}) \to A_0(-\mathbf{x})$ and $P: A_i(\mathbf{x}) \to -A_i(-\mathbf{x})$. Combined with $\partial_0 \to \partial_0$ and $\partial_i \to -\partial_i$, the components transform as stated. The dual tensor $\tilde{G}^{\mu\nu} = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma}G_{\rho\sigma}$ inherits opposite parity, yielding $P: \mathrm{tr}(G\tilde{G}) \to -\mathrm{tr}(G\tilde{G})$. ∎

**Theorem K.6.1 (σ-Correspondence with CP).** The anti-holomorphic involution $\sigma$ on $\text{Gr}(2,8)$ corresponds to the combined CP transformation acting on the moduli space of gauge vacua. Specifically:

1. σ acts anti-holomorphically on the complex structure of $\text{Gr}(2,8)$
2. CP acts anti-unitarily on Hilbert space but anti-holomorphically on parameter space
3. For the U(1) fiber parametrized by $\theta \in S^1$, the action is $\sigma: \theta \mapsto -\theta$

*Proof.* The PCE-Attractor orbit $\text{Gr}(2,8) = U(8)/(U(2) \times U(6))$ carries a natural Kähler structure (Theorem Z.6.3a; Kobayashi & Nomizu 1969). Complex conjugation on $\mathbb{C}^8$ induces an anti-holomorphic map on this Kähler manifold. For U(1) parameters embedded as holonomies of line bundles over $\text{Gr}(2,8)$, complex conjugation acts as $e^{i\theta} \mapsto e^{-i\theta}$, i.e., $\theta \mapsto -\theta$. The CP transformation, while unitary on the physical Hilbert space, acts anti-holomorphically on the space of coupling constants and vacuum parameters (Weinberg 1996). ∎

### K.6.4 θ-Parameter Embedding in the Attractor Geometry

The θ-vacuum structure of QCD embeds naturally into the PCE-Attractor geometry through the following construction.

**Definition K.6.5 (Tautological Bundle).** Let $\mathcal{S} \to \text{Gr}(2,8)$ be the tautological bundle, where the fiber over $V \in \text{Gr}(2,8)$ is the 2-plane $V$ itself:
$$\mathcal{S} = \{(V, v) : V \in \text{Gr}(2,8), v \in V\}$$

**Definition K.6.6 (Determinant Line Bundle).** The determinant line bundle is:
$$\mathcal{L} = \det(\mathcal{S}) = \Lambda^2 \mathcal{S}$$

This is a complex line bundle over $\text{Gr}(2,8)$ whose fiber over $V$ is $\Lambda^2 V \cong \mathbb{C}$.

**Definition K.6.7 (Instanton Classification).** Yang-Mills instantons on $S^4$ are classified by the third homotopy group:
$$\pi_3(\text{SU}(3)) \cong \mathbb{Z}$$
The integer winding number $\nu \in \mathbb{Z}$ measures the topological charge of the gauge configuration.

*Proof.* This is a standard result in algebraic topology (Nakahara 2003). The group SU(3) has the homotopy groups $\pi_1(\text{SU}(3)) = 0$, $\pi_2(\text{SU}(3)) = 0$, and $\pi_3(\text{SU}(3)) \cong \mathbb{Z}$. The generator of $\pi_3$ corresponds to the BPST instanton (Belavin et al. 1975; 't Hooft 1976). ∎

**Definition K.6.8 (θ-Vacuum).** The θ-vacuum is the coherent superposition over instanton sectors:
$$|\theta\rangle = \sum_{n \in \mathbb{Z}} e^{in\theta} |n\rangle$$
where $|n\rangle$ denotes the vacuum state in the sector with winding number $n$.

**Proposition K.6.3 (CP Transformation of θ-Vacuum).** Under CP transformation:
$$\text{CP}|\theta\rangle = |-\theta\rangle$$

*Proof.* The topological charge density transforms as $Q(x) \xrightarrow{\text{CP}} -Q(x)$. Therefore the instanton number changes sign: $\nu \to -\nu$, implying $|n\rangle \to |-n\rangle$. Consequently:
$$\text{CP}|\theta\rangle = \sum_n e^{in\theta}|-n\rangle = \sum_m e^{-im\theta}|m\rangle = |-\theta\rangle$$
∎

**Corollary K.6.1 (CP-Invariant θ).** CP-invariant vacua require $\theta \in \{0, \pi\}$.

**Proposition K.6.4 (Gauge-Topology Correspondence).** The SM gauge embedding $\iota: G_{\text{SM}} \hookrightarrow U(8)$ (Definition R.3.1) induces a correspondence between instanton sectors and holonomies on the determinant line bundle over $\text{Gr}(2,8)$.

*Proof.* By Theorem R.3.1, the gauge embedding induces a homomorphism $\Phi: \pi_2(\Sigma_8) \to \Lambda_{\text{Cartan}}(G_{\text{SM}})$ from the topological charge group to the Cartan weight lattice. For the SU(3) factor, the relevant holonomy is captured by the determinant of the gauge transformation at spatial infinity. The θ-parameter appears as the holonomy of the associated U(1) bundle:
$$\theta = \oint_{\gamma} \mathcal{A}_{\det}$$
where $\mathcal{A}_{\det}$ is the connection on the determinant line bundle and $\gamma$ is a generator of $\pi_1(U(1)) \cong \mathbb{Z}$. ∎

### K.6.5 PCE Cost Functional on S¹

The θ-parameter lives on the circle $S^1 \cong U(1)$. The PCE cost functional on this space is uniquely determined by geometric constraints.

**Definition K.6.9 (Topological Susceptibility).** In QCD, the topological susceptibility is:
$$\chi_{\text{top}} = \int d^4x \, \langle Q(x) Q(0) \rangle = \lim_{V \to \infty} \frac{\langle \nu^2 \rangle}{V}$$

This measures fluctuations in topological charge.

**Theorem K.6.2 (PCE Cost on S¹).** The PCE cost functional for a U(1) parameter $\theta \in S^1$ with reference point $\theta = 0$ takes the minimal form:
$$V_{\text{PCE}}(\theta) = V_0 (1 - \cos\theta)$$
by the requirements of:

1. Quadratic behavior near the minimum: $V(\theta) = \frac{1}{2}V_0 \theta^2 + O(\theta^4)$
2. Periodicity: $V(\theta + 2\pi) = V(\theta)$
3. σ-invariance: $V(-\theta) = V(\theta)$

*Proof.* 

**Step 1 (Geodesic distance).** On $S^1$ with the round metric of unit radius, the geodesic distance from $0$ to $\theta$ is $d(0, \theta) = \min(|\theta|, 2\pi - |\theta|)$. For $|\theta| < \pi$, this equals $|\theta|$.

**Step 2 (PCE cost principle).** The natural PCE cost on any Riemannian manifold is the squared geodesic distance from the reference state (Appendix D, Definition D.1):
$$V(\theta) \propto d^2(0, \theta) = \theta^2 + O(\theta^4)$$

**Step 3 (Periodic extension).** We seek a smooth function $f: S^1 \to \mathbb{R}$ satisfying: $f(\theta) = \frac{\theta^2}{2} + O(\theta^4)$ for small $\theta$; $f(\theta + 2\pi) = f(\theta)$; $f(-\theta) = f(\theta)$; and unique minimum at $\theta = 0$.

Expanding in Fourier series: $f(\theta) = a_0 + \sum_{n=1}^{\infty} a_n \cos(n\theta)$. The constraint $f(0) = 0$ gives $a_0 = -\sum_n a_n$. The condition $f''(0) = 1$ (matching $\theta^2/2$ leading term) gives $\sum_n n^2 a_n = 1$. The unique minimum at $\theta = 0$ requires $f(\pi) > 0$.

The simplest solution satisfying all constraints is $a_1 = -1$, $a_0 = 1$, $a_{n>1} = 0$, giving:
$$f(\theta) = 1 - \cos\theta$$

**Step 4 (Verification).** Taylor expanding: $1 - \cos\theta = \frac{\theta^2}{2} - \frac{\theta^4}{24} + O(\theta^6)$, confirming the quadratic behavior. The function has a unique global minimum at $\theta = 0$ with $f(0) = 0$, and maximum at $\theta = \pi$ with $f(\pi) = 2$. ∎

**Corollary K.6.2 (Normalization).** The coefficient $V_0$ is determined by the Bures metric curvature at the PCE-Attractor. From Corollary T.41.3, the hierarchy coefficient $\alpha = 3/2$ and from Lemma T.41.2, the per-mode Bures variance $\sigma_B^2 = 1/24$ from capacity saturation. The normalization is:
$$V_0 = 2\alpha \sigma_B^2 = 2 \times \frac{3}{2} \times \frac{1}{24} = \frac{1}{8}$$

**Remark K.6.1: Consistency with QCD.** The QCD dilute instanton gas approximation yields $V(\theta) = \chi_{\text{top}}(1 - \cos\theta)$ where $\chi_{\text{top}}$ is the topological susceptibility (Callan, Dashen & Gross 1976). The agreement with the PCE-derived form is a consistency check: both the geometric PCE derivation and the QCD calculation yield the same functional form because both respect the U(1) holonomy structure and the physical requirement of quadratic cost near the vacuum.

### K.6.6 First Mechanism: σ-Invariance Selects θ = 0

**Theorem K.6.3 (PCE Requires Hermitian Observables).** In the PU framework, physical observables must be represented by Hermitian operators.

*Proof.* The SPAP cycle (Theorem 10) requires Predict → Evolve → Verify → Update. The verification step must yield a definite outcome to update the model. PCE (Definition 15) minimizes complexity for given predictive utility. A measurement yielding complex outcomes would require additional processing to extract real information, incurring higher complexity ($C_P$) for the same predictive content. Real-valued measurement outcomes have strictly lower complexity than complex-valued outcomes (one real number vs. two). In the complex Hilbert space structure (Theorem G.1.8), the unique operators with real spectra are Hermitian operators: $O = O^\dagger$. ∎

**Lemma K.6.4 (σ-Invariance Implies Hermiticity in the Fixed Real Structure).** Let $\sigma$ denote the antiholomorphic involution on $\mathbb{C}^8$ fixed in Definition K.6.3, acting on density matrices by $\sigma(\rho) = \bar\rho$ in the fixed basis. If $\sigma(\rho) = \rho$, then $\rho$ has real matrix elements in that basis and is therefore real-symmetric and Hermitian. The converse is false in general: a Hermitian density matrix need not be σ-invariant under the fixed conjugation, since its eigenvectors cannot generally be chosen real with respect to a fixed real structure unless $\rho$ commutes with $\sigma$.

*Proof.* (σ-invariance ⇒ real-symmetric Hermitian.) If $\sigma(\rho) = \rho$, then $\bar\rho = \rho$ in the fixed basis, so $\rho$ has real matrix elements. A real positive semidefinite matrix satisfies $\rho = \rho^T = \rho^\dagger$ and is therefore Hermitian.

(Counterexample to the converse.) The matrix
$$
\rho = \frac{1}{2}\begin{pmatrix} 1 & -ia \\ ia & 1 \end{pmatrix}, \qquad 0 < a < 1,
$$
is Hermitian and positive definite but satisfies $\sigma(\rho) = \frac{1}{2}\bigl[\begin{smallmatrix} 1 & ia \\ -ia & 1 \end{smallmatrix}\bigr] \neq \rho$. Its eigenvectors $\frac{1}{\sqrt{2}}(1, \mp i)^T$ admit no phase choice making both components real, illustrating that Hermiticity does not imply σ-invariance under the fixed conjugation.

Consequently, the strong-CP argument below uses σ-invariance as a PCE symmetry condition characterizing the σ-symmetric attractor branch, not as a derived consequence of Hermiticity alone. ∎

**Theorem K.6.5 (θ-Selection on the σ-Symmetric PCE-Attractor Branch).** On the σ-symmetric PCE-attractor branch — under which the physical vacuum is required to be invariant under the antiholomorphic involution $\sigma$ of Definition K.6.3 — and using the action $\sigma: \theta \mapsto -\theta$, the vacuum θ-parameter is restricted to:
$$\theta_{\text{QCD}} \in \{0, \pi\}.$$
The σ-symmetric attractor branch is supplied by Lemma K.6.4 as a symmetry condition on the PCE-Attractor state $\rho_0$ rather than as a consequence of Hermiticity. The energy-selection step in Theorem K.6.6 then resolves the two-valued σ-symmetric set to $\theta_{\text{QCD}} = 0$.

*Proof.* On the σ-symmetric PCE-attractor branch, the PCE-Attractor state $\rho_0$ is required to be invariant under the geometric involution $\sigma$ of Definition K.6.3, motivated by maximal-symmetry selection (Definition 15a) and the cost of unnecessary symmetry-breaking (Appendix P, Section P.6.4). This σ-invariance is the branch input — not a derived consequence of Hermiticity, by Lemma K.6.4.

For a state parametrized by $\theta$, σ-invariance requires $\sigma(\theta) = \theta$, i.e., $-\theta \equiv \theta \pmod{2\pi}$. This has exactly two solutions: $\theta = 0$ and $\theta = \pi$. ∎

**Theorem K.6.6 (Energy Selection of θ = 0).** Between the two σ-invariant values, PCE selects the global minimum of the cost functional:
$$V_{\text{PCE}}(0) = 0 < V_{\text{PCE}}(\pi) = 2V_0$$
Therefore $\theta_{\text{QCD}} = 0$ exactly.

*Proof.* From Theorem K.6.2, $V_{\text{PCE}}(\theta) = V_0(1 - \cos\theta)$. Evaluating at the σ-invariant points: $V_{\text{PCE}}(0) = V_0(1 - 1) = 0$ and $V_{\text{PCE}}(\pi) = V_0(1 - (-1)) = 2V_0$. PCE minimization (Definition 15) selects the global minimum, yielding $\theta_{\text{QCD}} = 0$. ∎

**Corollary K.6.3 (Quantitative Suppression).** The Boltzmann suppression of $\theta = \pi$ relative to $\theta = 0$ is:
$$\frac{P(\theta = \pi)}{P(\theta = 0)} = e^{-2V_0/k_BT} = e^{-2S_{\text{inst}}} = e^{-16\pi^2/g_s^2}$$

For $\alpha_s(M_Z) \approx 0.118$ (i.e., $g_s^2 \approx 1.5$):
$$\frac{P(\pi)}{P(0)} \sim e^{-105} \sim 10^{-46}$$

This is not merely suppressed—it is cosmologically impossible.

### K.6.7 The Real Locus of Gr(2,8)

**Definition K.6.10 (Real Grassmannian).** The fixed-point set of the σ-involution is the real Grassmannian:
$$\text{Gr}(2,8)^{\sigma} = \{W \in \text{Gr}(2,8) : \sigma(W) = W\} \cong \text{Gr}_{\mathbb{R}}(2,8)$$

**Proposition K.6.5 (Real Locus Properties).** The real locus $\text{Gr}_{\mathbb{R}}(2,8)$ is:

1. A totally real submanifold of $\text{Gr}(2,8)$
2. Diffeomorphic to $O(8)/(O(2) \times O(6))$
3. Of real dimension $\dim_{\mathbb{R}}(\text{Gr}_{\mathbb{R}}(2,8)) = 12$

*Proof.* Let $\sigma$ denote complex conjugation on $\mathbb C^8$, and let $W\in \mathrm{Gr}(2,8)^\sigma$. The condition $\sigma(W)=W$ means that $W$ is the complexification of a unique real 2-plane $V:=W\cap \mathbb R^8$, so $W=V\otimes_{\mathbb R}\mathbb C$. Conversely, if $V\subset \mathbb R^8$ is a real 2-plane, then $V\otimes_{\mathbb R}\mathbb C$ is fixed by complex conjugation. Therefore
$$
\mathrm{Gr}(2,8)^\sigma \cong \mathrm{Gr}_{\mathbb R}(2,8).
$$

The orthogonal group $O(8)$ acts transitively on real 2-planes in $\mathbb R^8$: given $V_1,V_2\in \mathrm{Gr}_{\mathbb R}(2,8)$, choose orthonormal bases of $V_1$ and $V_2$ and extend them to orthonormal bases of $\mathbb R^8$; the linear map sending one basis to the other lies in $O(8)$ and carries $V_1$ to $V_2$. The stabilizer of the standard plane $\mathbb R^2\oplus 0\subset \mathbb R^8$ consists exactly of block-diagonal orthogonal transformations preserving that plane and its orthogonal complement, namely $O(2)\times O(6)$. Hence
$$
\mathrm{Gr}_{\mathbb R}(2,8) \cong O(8)/(O(2)\times O(6)).
$$

For the dimension,
$$
\dim O(8)=\frac{8\cdot 7}{2}=28,\qquad
\dim O(2)=1,\qquad
\dim O(6)=\frac{6\cdot5}{2}=15,
$$
so
$$
\dim_{\mathbb R}\mathrm{Gr}_{\mathbb R}(2,8)=28-1-15=12.
$$

To prove total reality, let $W=V\otimes_{\mathbb R}\mathbb C$ be a fixed point. The complex tangent space of $\mathrm{Gr}(2,8)$ at $W$ is
$$
T_W\mathrm{Gr}(2,8) \cong \mathrm{Hom}_{\mathbb C}(W,W^\perp).
$$
The differential $d\sigma$ acts on this space by complex conjugation, and the tangent space of the fixed locus is the $+1$ eigenspace
$$
T_W\mathrm{Gr}_{\mathbb R}(2,8) \cong \mathrm{Hom}_{\mathbb R}(V,V^\perp).
$$
The complex structure is multiplication by $i$, while $d\sigma(iA)=-i\,d\sigma(A)$. Thus no nonzero vector in the fixed tangent space is invariant after multiplication by $i$; equivalently
$$
T_W\mathrm{Gr}_{\mathbb R}(2,8) \cap i\,T_W\mathrm{Gr}_{\mathbb R}(2,8)=\{0\}.
$$
Hence the fixed locus is totally real. ∎

**Corollary K.6.4 (σ-Invariant Vacuum).** The PCE-Attractor vacuum, being σ-invariant, lies in the real locus $\text{Gr}_{\mathbb{R}}(2,8)$. All physical parameters associated with this vacuum take real values.

### K.6.8 Second Mechanism: $E_8$ Root Reality

The quark mass matrix contribution $\arg(\det M_q)$ is controlled by the Yukawa coupling structure, which derives from $E_8$ geometry on the attractor orbit.

**Definition K.6.11 ($E_8$ Root System).** The $E_8$ root system consists of 240 vectors in $\mathbb{R}^8$ of squared norm 2:

- **Type I (112 roots):** All permutations of $(\pm 1, \pm 1, 0, 0, 0, 0, 0, 0)$
- **Type II (128 roots):** All vectors $(\pm\frac{1}{2}, \pm\frac{1}{2}, \ldots, \pm\frac{1}{2})$ with an even number of minus signs

**Lemma K.6.2 ($E_8$ Reality).** All $E_8$ roots have real coordinates: $E_8 \subset \mathbb{R}^8$.

**Lemma K.6.3 ($E_8$ Distance Spectrum).** For distinct roots $r_i, r_j \in E_8$, the squared Euclidean distance satisfies:
$$d^2_{E_8}(r_i, r_j) = |r_i - r_j|^2 \in \{2, 4, 6, 8\}$$

*Proof.* Direct calculation using the root coordinates. For roots with $|r|^2 = 2$:
$$d^2 = |r_i|^2 + |r_j|^2 - 2\langle r_i, r_j \rangle = 4 - 2\langle r_i, r_j \rangle$$

The inner product $\langle r_i, r_j \rangle \in \{-2, -1, 0, 1, 2\}$ for distinct roots, giving $d^2 \in \{0, 2, 4, 6, 8\}$. Excluding $d^2 = 0$ (same root), the result follows. ∎

**Theorem K.6.7 (Yukawa Reality from $E_8$).** The Yukawa coupling matrix $Y_{ij}$ derived from $E_8$ geodesic overlaps has real positive entries:
$$Y_{ij} \propto \exp(-\gamma \, d^2_{E_8}(r_i, r_j)) \in \mathbb{R}_{>0}$$
where $\gamma = 4\alpha/d_0 = 3/4$ combines the hierarchy coefficient $\alpha = 3/2$ (Corollary T.41.3) with the factor $4/d_0 = 1/2$ arising from the Bures-$E_8$ distance scaling (Lemma T.41.4), and $d^2_{E_8}$ is the squared $E_8$ root distance.

*Proof.* 

**Step 1 (Gaussian localization).** Generation vacua are localized as Gaussian wavepackets on the attractor orbit (Section R.5.3). Among distributions with fixed second moment, Gaussians maximize entropy (Cover & Thomas 2006), aligning with PCE optimization.

**Step 2 (Overlap integral).** The Yukawa coupling between generations $i$ and $j$ is the overlap of their Gaussian wavepackets (Theorem T.41.5):
$$Y_{ij} \propto \int d\mu(x) \, \psi_i(x) \, \psi_j(x) \propto \exp\left(-\frac{d_B^2(p_i, p_j)}{4\sigma_B^2}\right)$$
where $d_B$ is the Bures distance and $\sigma_B^2 = 1/24$ from capacity saturation (Lemma T.41.2).

**Step 3 ($E_8$ correspondence).** By Lemma T.41.4, the Bures and $E_8$ distances are related by $d_B^2 = \frac{1}{8}d_{E_8}^2$ for small SU(2) rotations. Substituting with $\sigma_B^2 = 1/24$ yields:
$$Y_{ij} \propto \exp\left(-\frac{d_{E_8}^2}{32\sigma_B^2}\right) = \exp\left(-\frac{3}{4} d_{E_8}^2\right)$$

**Step 4 (Reality).** From Lemma K.6.2, $r_i, r_j \in \mathbb{R}^8$. The Euclidean distance $d_{E_8}^2 = |r_i - r_j|^2$ is manifestly real and positive. The exponential of a real negative number is real and positive. Therefore $Y_{ij} \in \mathbb{R}_{>0}$. ∎

**Theorem K.6.8 (Real Yukawa Orientation Decomposition).** Let $Y_f$ be a real nondegenerate $3\times3$ Yukawa matrix. Then there exist $O_{L,f},O_{R,f}\in O(3)$ and
$$
D_f=\operatorname{diag}(y_1^f,y_2^f,y_3^f),
\qquad
y_i^f>0,
$$
such that
$$
Y_f=O_{L,f}D_fO_{R,f}^T.
$$
The determinant orientation of the sector is
$$
\epsilon_f
:=
\operatorname{sgn}\det Y_f
=
\det O_{L,f}\det O_{R,f}
\in\{+1,-1\}.
\tag{K.6.8.1}
$$
This sign is independent of the singular-vector choices inside degenerate singular-value subspaces. Theorem K.6.7 fixes the real-positive entry property of the Gaussian overlap branch, but that property alone does not fix $\epsilon_f$.

*Proof.* Since $Y_f$ is real and nondegenerate, the real singular-value theorem gives orthogonal matrices $O_{L,f},O_{R,f}$ and positive singular values $y_i^f$ with $Y_f=O_{L,f}D_fO_{R,f}^T$. Taking determinants gives
$$
\det Y_f=(\det O_{L,f})(\det D_f)(\det O_{R,f}),
$$
and $\det D_f=\prod_i y_i^f>0$, hence (K.6.8.1). If a singular value has multiplicity, the corresponding singular-vector bases may be changed by the same orthogonal matrix $S$ on the left and right singular subspaces. This multiplies $\det O_{L,f}$ and $\det O_{R,f}$ by the same factor $\det S$, so their product is unchanged. Thus $\epsilon_f$ is a well-defined orientation invariant of the real nondegenerate Yukawa matrix. The final sentence follows because entrywise positivity is a condition on matrix entries, whereas $\epsilon_f$ is the connected-component sign of $GL(3,\mathbb R)$. ∎

**Theorem K.6.9 (Orientation-Preserving Real-Yukawa Branch Criterion).** Let $Y_f$ be a real nondegenerate Yukawa matrix in one fermion sector, with determinant orientation $\epsilon_f$ as in Theorem K.6.8. Suppose the branch supplies a continuous path
$$
Y_f(t)\in GL(3,\mathbb R),
\qquad
0\le t\le1,
$$
generated by the same finite flavor data, such that
$$
Y_f(0)=D_f,
\qquad
Y_f(1)=Y_f,
\qquad
\det Y_f(t)\ne0
\quad\text{for all }t\in[0,1].
\tag{K.6.9.1}
$$
Then
$$
\det Y_f>0,
\qquad
\epsilon_f=+1.
\tag{K.6.9.2}
$$
Equivalently, in any real SVD orientation decomposition of Theorem K.6.8,
$$
\det O_{L,f}\det O_{R,f}=+1.
\tag{K.6.9.3}
$$
Real positive entries of $Y_f$ alone do not imply (K.6.9.2).

*Proof.* The determinant is a continuous nonzero real-valued function along the path (K.6.9.1). Hence $\operatorname{sgn}\det Y_f(t)$ is constant on $[0,1]$. Since $Y_f(0)=D_f$ and $\det D_f=\prod_i y_i^f>0$, the endpoint satisfies $\det Y_f>0$. Formula (K.6.8.1) then gives $\epsilon_f=+1$ and (K.6.9.3).

It remains to record why the hypothesis is not automatic from entrywise positivity. Let $\gamma>0$ and set $x=e^{-2\gamma}\in(0,1)$. The following six vectors are $E_8$ roots:
$$
\begin{aligned}
\nu_1&=(0,0,-1,0,0,0,1,0),&
\nu_2&=(1/2,1/2,-1/2,1/2,1/2,-1/2,1/2,1/2),&
\nu_3&=(1/2,1/2,1/2,-1/2,-1/2,1/2,1/2,1/2),\\
w_1&=(1,0,1,0,0,0,0,0),&
w_2&=(-1,0,0,1,0,0,0,0),&
w_3&=(-1,0,1,0,0,0,0,0).
\end{aligned}
$$
Their cross squared-distance matrix is
$$
\left(\|\nu_i-w_j\|^2\right)_{ij}
=
\begin{pmatrix}
6&4&6\\
4&4&6\\
2&6&4
\end{pmatrix}.
$$
The corresponding cross-Gaussian matrix is
$$
Y(x)=
\begin{pmatrix}
x^3&x^2&x^3\\
x^2&x^2&x^3\\
x&x^3&x^2
\end{pmatrix},
$$
whose entries are strictly positive and whose determinant is
$$
\det Y(x)=-x^6(x-1)^2(x+1)<0.
$$
Thus cross-Gaussian $E_8$ positivity can lie in the negative determinant component. The orientation-preserving condition must therefore be supplied by the finite branch certificate unless the matrix is a same-root Gaussian Gram matrix. In that special same-root case, for distinct roots $r_1,r_2,r_3$,
$$
Y_{ij}=e^{-\gamma\|r_i-r_j\|^2}
$$
is positive definite because
$$
\sum_{i,j}\overline c_i c_j e^{-\gamma\|r_i-r_j\|^2}
=
C_\gamma\int_{\mathbb R^8}
\left|\sum_i c_i e^{i\omega\cdot r_i}\right|^2
 e^{-\|\omega\|^2/(4\gamma)}d\omega>0
$$
for every nonzero $c\in\mathbb C^3$. Hence the same-root Gram construction gives $\det Y>0$, while a general row-column cross-overlap construction does not. ∎

**Theorem K.6.9a (Ordered Gaussian Total-Positivity Orientation Theorem).** Let
$$
x_1<\cdots<x_m,
\qquad
 y_1<\cdots<y_m,
\qquad
\gamma>0,
$$
and define
$$
G_{ij}=\exp(-\gamma(x_i-y_j)^2).
\tag{K.6.9a.1}
$$
Then every square minor with the same increasing row and column order is strictly positive. In particular, for $m=3$,
$$
\det G>0.
\tag{K.6.9a.2}
$$

*Proof.* It is enough to prove the full determinant statement for arbitrary equal-size ordered sublists, since applying the same argument to those sublists proves every ordered minor. For a fixed ordered pair of sublists, write
$$
G_{ij}=e^{-\gamma x_i^2}e^{-\gamma y_j^2}e^{2\gamma x_i y_j}.
\tag{K.6.9a.3}
$$
The row and column factors are strictly positive, so the determinant sign is the sign of $\det(e^{a x_i y_j})$ with $a=2\gamma>0$. Translating all $x_i$ and all $y_j$ by constants multiplies rows and columns of $(e^{a x_i y_j})$ by strictly positive factors and does not change the determinant sign. Choose such translations so that all $x_i$ and $y_j$ are positive.

Expanding the exponential and applying Cauchy-Binet gives
$$
\det(e^{a x_i y_j})_{i,j=1}^m
=
\sum_{0\le n_1<\cdots<n_m}
\left(\prod_{r=1}^m\frac{a^{n_r}}{n_r!}\right)
\det(x_i^{n_r})_{i,r=1}^m
\det(y_j^{n_r})_{j,r=1}^m.
\tag{K.6.9a.4}
$$
For positive ordered variables and strictly increasing exponents, each generalized Vandermonde determinant is the ordinary Vandermonde determinant times a Schur polynomial with nonnegative coefficients, hence is nonnegative; for the exponent set $(0,1,\ldots,m-1)$ both determinants are the ordinary positive Vandermonde determinants. Therefore the sum contains one strictly positive term and no negative terms, so the determinant is strictly positive. ∎

**Corollary K.6.9a.1 (Forced Positive Yukawa Orientation from an Ordered Heat-Kernel Chamber).** If a finite flavor certificate places the three generations of a real Yukawa sector in ordered one-dimensional flag coordinates $x_1<x_2<x_3$ and $y_1<y_2<y_3$ and gives the real amplitude matrix
$$
Y_{ij}=c_i d_j\exp(-\gamma(x_i-y_j)^2),
\qquad
c_i>0,
\quad d_j>0,
\quad \gamma>0,
\tag{K.6.9a.5}
$$
then $\det Y>0$ and the sector lies in the positive determinant component.

*Proof.* Positive row and column factors multiply the determinant by $(\prod_i c_i)(\prod_j d_j)>0$. The remaining determinant is positive by Theorem K.6.9a with $m=3$. ∎

**Theorem K.6.10 (Quark Mass Matrix Phase on the Real Branch).** Let $M_f=vY_f/\sqrt2$ with $v>0$ fixed by electroweak gauge choice and $Y_f\in GL(3,\mathbb R)$. Then
$$
\arg\det M_f
=
\begin{cases}
0,&\det Y_f>0,\\
\pi,&\det Y_f<0,
\end{cases}
\quad\text{mod }2\pi.
\tag{K.6.10.1}
$$
In particular, any positive-orientation branch certified by Theorem K.6.9 or Corollary K.6.9a.1 gives $\arg\det M_f=0$ in that sector.

*Proof.* Since $v/\sqrt2>0$,
$$
\det M_f=(v/\sqrt2)^3\det Y_f,
$$
so the phase of $\det M_f$ is exactly the phase of the nonzero real number $\det Y_f$. A nonzero real number has phase $0$ if positive and $\pi$ if negative, modulo $2\pi$. The final sentence follows from (K.6.9.2) or Corollary K.6.9a.1. ∎

**Corollary K.6.5 (arg(det M_q) = 0 on a Certified Positive-Orientation Real-Yukawa Branch).** On the branch where both quark Yukawa matrices either satisfy the nonzero-path criterion of Theorem K.6.9 or are certified by the ordered heat-kernel chamber of Corollary K.6.9a.1,
$$
\arg(\det M_q)=0.
$$
Without a positive-orientation certificate, $E_8$ reality gives real Yukawa data and hence only the alternatives $\arg\det M_f\in\{0,\pi\}$ sector by sector.

*Proof.* The quark determinant entering the strong-CP parameter is
$$
\det M_q=\frac{v^6}{2^3}\det Y_u\det Y_d.
$$
The electroweak gauge choice fixes $v>0$. Theorem K.6.9 gives $\det Y_f>0$ when the branch supplies a nonzero path from the positive diagonal reference. Corollary K.6.9a.1 gives $\det Y_f>0$ when the branch supplies an ordered heat-kernel chamber. If both quark sectors satisfy either certificate, then $\det Y_u>0$ and $\det Y_d>0$, hence $\det M_q>0$ and $\arg(\det M_q)=0$ modulo $2\pi$. The last sentence is Theorem K.6.10 applied before imposing a positive-orientation certificate. ∎

**Definition K.6.10a (Pfaffian Real-Orientation Certificate).** For a real quark Yukawa branch, define the real doubled skew operator
$$
\mathcal D_q(Y_u,Y_d)
:=
\begin{pmatrix}
0 & M_q\\
-M_q^T & 0
\end{pmatrix},
\qquad
M_q:=M_u\oplus M_d.
\tag{K.6.10a.1}
$$
Since $\mathcal D_q$ is real skew-symmetric,
$$
\operatorname{Pf}(\mathcal D_q)^2=\det\mathcal D_q=(\det M_q)^2.
\tag{K.6.10a.2}
$$
A Pfaffian real-orientation certificate is a finite record
$$
\mathfrak O_{\mathrm{Pf}}
=
\left(
\mathcal Y_{\mathbb R}^+,
\operatorname{Pf}(\mathcal D_q),
\nabla_{\mathrm{Pf}},
w_1(\mathrm{Pf}),
\Delta_{\mathrm{gap}},
V_{\mathrm{top}},
\chi_{\mathrm{Pf}}
\right)
\tag{K.6.10a.3}
$$
such that:

1. $\mathcal Y_{\mathbb R}^+$ is a connected retained real-Yukawa chamber;

2. $M_q$ is invertible throughout $\mathcal Y_{\mathbb R}^+$;

3. the Pfaffian line is orientable on the chamber,
$$
w_1(\mathrm{Pf})=0;
\tag{K.6.10a.4}
$$

4. the accepted orientation is fixed by a positive diagonal reference point $Y_{\mathrm{diag}}$;

5. the finite gap satisfies
$$
|\operatorname{Pf}(\mathcal D_q)|\ge\Delta_{\mathrm{gap}}>0
\tag{K.6.10a.5}
$$
on the retained chamber;

6. any path leaving $\mathcal Y_{\mathbb R}^+$ either crosses $\det M_q=0$ or pays topological orientation overhead
$$
\Delta V_{\mathrm{top}}\ge\varepsilon_0;
\tag{K.6.10a.6}
$$

7. $\chi_{\mathrm{Pf}}$ records that the chamber, orientation, gap, and overhead were fixed before comparison with the neutron electric dipole bound.

**Theorem K.6.10b (Pfaffian Orientation Forces the Quark Determinant Phase).** On a branch carrying an accepted $\mathfrak O_{\mathrm{Pf}}$,
$$
\arg\det M_q=0.
\tag{K.6.10b.1}
$$
Moreover, the opposite determinant-orientation component cannot be reached inside the same finite branch without either closing the quark determinant gap or paying the explicit orientation overhead (K.6.10a.6).

*Proof.* At the positive diagonal reference point, the accepted orientation gives
$$
\operatorname{Pf}(\mathcal D_q)>0.
$$
Because $w_1(\mathrm{Pf})=0$, the Pfaffian line has a global orientation on $\mathcal Y_{\mathbb R}^+$. Because $|\operatorname{Pf}(\mathcal D_q)|\ge\Delta_{\mathrm{gap}}>0$, the Pfaffian cannot change sign along any path in the chamber. Therefore
$$
\operatorname{Pf}(\mathcal D_q)>0
$$
throughout $\mathcal Y_{\mathbb R}^+$. With the reference orientation of (K.6.10a.1), positivity of the Pfaffian is equivalent to positivity of $\det M_q$ on the same connected chamber. Hence $\det M_q>0$, and a positive real determinant has phase $0$ modulo $2\pi$.

A path to the opposite determinant component must change the sign of the Pfaffian. Since the Pfaffian is continuous, this requires $\operatorname{Pf}(\mathcal D_q)=0$ somewhere unless the path leaves the certified oriented chamber. By (K.6.10a.2), $\operatorname{Pf}(\mathcal D_q)=0$ implies $\det M_q=0$. If the path leaves the chamber without closing the gap, the certificate assigns the explicit topological overhead (K.6.10a.6), so it is not the same zero-surplus PCE branch. ∎

### K.6.9 Combined Resolution

**Theorem K.6.11 (Strong CP Resolution on the σ-Symmetric Positive-Orientation Branch).** On the branch satisfying the σ-symmetric PCE-attractor condition of Theorem K.6.6 and either:

1. one of the positive-orientation real-Yukawa certificates of Corollary K.6.5 in both quark sectors, or

2. an accepted Pfaffian real-orientation certificate $\mathfrak O_{\mathrm{Pf}}$ of Definition K.6.10a,

the physical strong-CP parameter is
$$
\bar\theta
=
\theta_{\text{QCD}}+\arg(\det M_q)
=
0.
$$

*Proof.* Theorem K.6.6 gives $\theta_{\text{QCD}}=0$ on the σ-symmetric PCE-attractor branch. Corollary K.6.5 gives $\arg(\det M_q)=0$ on any certified positive-orientation real-Yukawa branch. Theorem K.6.10b gives the same determinant-phase conclusion on the Pfaffian orientation branch. Therefore $\bar\theta=0+0=0$ in either certified case. Without a positive-orientation determinant or Pfaffian-orientation certificate, $E_8$ reality gives real Yukawa data but does not exclude the negative determinant component, so the theorem is branch-level exactly as stated. ∎

**Theorem K.6.12 (Independence of Mechanisms).** The two mechanisms are mathematically independent branch inputs:

1. **Mechanism I** ($\theta_{\text{QCD}}=0$): uses the complex structure of $\operatorname{Gr}(2,8)$ via the anti-holomorphic involution σ and the topological-cost selection.
2. **Mechanism II** ($\arg(\det M_q)=0$): uses real Yukawa data together with a positive-orientation determinant certificate, supplied either by the nonzero-path criterion of Theorem K.6.9 or by the ordered heat-kernel chamber of Corollary K.6.9a.1.

*Proof.* Mechanism I operates on the parameter space of gauge vacua, utilizing the Kähler geometry of $\operatorname{Gr}(2,8)$ and the action of complex conjugation as an anti-holomorphic involution. Mechanism II operates on the internal flavor space. The fact that $E_8$ roots lie in real Euclidean space $\mathbb R^8$ supplies real Yukawa entries. The determinant-component selection is supplied separately: either by a nonzero determinant path from the diagonal reference, or by the strict total-positivity theorem for an ordered Gaussian heat-kernel chamber.

The mechanisms share the common origin $d_0=8$ on the minimal Appendix Z branch (Theorem Z.2; Theorem 23 gives $d_0\ge8$) but employ disjoint geometric data: complex structure and topological cost for $\theta_{\text{QCD}}$, versus real-lattice Yukawa data and determinant orientation for $\arg(\det M_q)$. Neither mechanism implies the other; both are required for the complete branch-level resolution. ∎

**Remark K.6.2: Contrast with Fine-Tuning.** In standard treatments, $\bar\theta\approx0$ would require $\theta_{\text{QCD}}\approx-\arg(\det M_q)$ with both terms potentially $\mathcal O(1)$ but canceling to high precision. In the PU branch stated here, $\theta_{\text{QCD}}=0$ is selected by σ-invariance plus PCE, and $\arg(\det M_q)=0$ is selected by a positive-orientation real-Yukawa branch. No cancellation is used. The $E_8$ input supplies real Yukawa data; the determinant-orientation certificate supplies the sign.

### K.6.10 $E_8$ Triad Selection

**Definition K.6.12 (Mass Ratio Invariant).** For path-additive Dirac-type generation sectors with masses $m_3 > m_2 > m_1$:
$$\mathcal{R} := \frac{\ln(m_3/m_1)}{\ln(m_3/m_2)} = \frac{d^2_{31}}{d^2_{32}}$$

For Majorana neutrinos, the corresponding invariant is read in the anchored form $\mathcal R_\nu=\Delta_1/\Delta_2=3$ (Theorem T.24.11); the $1\leftrightarrow2$ $A_2$ edge is a mixing-geometry input rather than an independent mass-ratio equation.

**Theorem K.6.13 (Discrete ℛ Values).** The mass ratio invariant takes values in the discrete set:
$$\mathcal{R} \in \left\{\frac{4}{3}, \frac{3}{2}, 2, 3, 4\right\}$$

*Proof.* From the Gaussian suppression formula (Theorem T.41.5): $\ln(m_3/m_g) = \alpha \, d^2_{3g}$. Therefore $\mathcal{R} = d^2_{31}/d^2_{32}$. With $d^2 \in \{2, 4, 6, 8\}$ and requiring $d^2_{31} > d^2_{32}$ (since $m_1 < m_2$), the allowed ratios with $\mathcal{R} > 1$ are: $4/3, 3/2, 2, 3, 4$. ∎

**Theorem K.6.14 (PCE Triad Selection).** For each discrete $\mathcal{R}$ value, there exists a unique PCE-optimal $E_8$ triad minimizing the total action cost (Theorem T.42.1).

*Proof.* Given $\mathcal{R} = d^2_{31}/d^2_{32}$, the constraint $d^2_{31} = \mathcal{R} \cdot d^2_{32}$ with both values in $\{2, 4, 6, 8\}$ typically has a unique solution.

For $\mathcal{R} = 3$ (charged leptons): $d^2_{31} = 3 \cdot d^2_{32}$ requires $d^2_{32} = 2 \Rightarrow d^2_{31} = 6$ (valid) or $d^2_{32} = 4 \Rightarrow d^2_{31} = 12$ (not in allowed set). The unique solution is $(d^2_{32}, d^2_{31}) = (2, 6)$.

Among triads with the same $\mathcal{R}$, PCE selects the one minimizing total complexity cost $\propto \exp(-\alpha d^2_{32}) + \exp(-\alpha d^2_{31})$, which corresponds to minimizing $d^2_{32}$ (the smaller distance dominates). ∎

**Table K.6.1: $E_8$ Triad Assignments**

| Sector | $\mathcal{R}_{\text{obs}}$ | Nearest $\mathcal{R}$ | $(d^2_{32}, d^2_{31})$ | Agreement |
|:-------|:---------------------------|:----------------------|:-----------------------|:----------|
| Charged leptons | 2.889 | 3 | (2, 6) | 3.8% |
| Down quarks | 1.79 | 2 | (2, 4) | 12% |
| Up quarks | 2.30 | 2 | (4, 8) | 15% |

### K.6.11 Type I and Type II CP Violation

The framework distinguishes two geometric types of CP violation, explaining why strong CP is absent on the stated Appendix K branch while weak CP is present.

**Definition K.6.13 (Type I CP Violation).** CP violation appearing in strong-sector Lagrangian parameters or absolute determinant-line data. Such violation requires $\theta_{\text{QCD}}\ne0$, complex Yukawa entries, or an unfixed real Yukawa determinant orientation contributing a nonzero $\arg(\det M_q)$.

**Definition K.6.14 (Type II CP Violation).** CP violation appearing as Berry holonomy on the generation manifold, arising from the geometric phase acquired during flavor-changing processes.

**Theorem K.6.15 (Strong-Sector Type I Gate).** On the σ-symmetric topological-cost branch together with a certified positive-orientation real-Yukawa determinant branch, strong-sector Type I CP phases vanish.

*Proof.* The σ-symmetric topological-cost branch gives $\theta_{\text{QCD}}=0$ by Theorem K.6.6. $E_8$ reality gives real Yukawa data by Theorem K.6.7, and the positive-orientation certificate of Corollary K.6.5 fixes $\arg(\det M_q)=0$ when its finite data are supplied. Hence both absolute strong-sector Type I contributions vanish on the stated branch. Without the determinant-orientation certificate, real Yukawa data alone leave the determinant sign unfixed, so the gate is branch-level exactly as stated. ∎

**Theorem K.6.16 (Type II is σ-Compatible).** Type II CP violation is compatible with σ-invariance.

*Proof.* Under σ, the Berry connection transforms as $\sigma^* \mathcal{A} = -\mathcal{A}$ (anti-invariant, like the symplectic form). For a closed loop $\gamma$ lying entirely in the real locus $\text{Gr}(2,8)^σ$:
$$\delta = \oint_\gamma \mathcal{A} = \int_\Sigma \omega_{KE}$$
where $\Sigma$ is a surface bounded by $\gamma$. If $\gamma \subset \text{Gr}(2,8)^σ$, then $\Sigma$ can be chosen as a totally real surface. The integral of the Kähler form over a totally real surface gives a real number (the symplectic area). A real number $\delta \in \mathbb{R}$ satisfies $\bar{\delta} = \delta$, hence is σ-invariant. The enclosed area can be nonzero if $\gamma$ is non-contractible or encloses curvature. ∎

**Theorem K.6.17 (Type Classification).** Under the geometric framework:

- **Type I** strong-sector phases are excluded on the σ-symmetric, certified positive-orientation real-Yukawa branch.
- **Type II** phases are permitted and generate the CKM phase through Berry holonomy.

*Proof.* Type I violation requires either: (a) $\theta_{\text{QCD}}\ne0$, forbidden on the σ-symmetric topological-cost branch by Theorem K.6.6; or (b) an unfixed quark determinant phase. $E_8$ reality (Theorem K.6.7) excludes complex Yukawa entries, and the positive-orientation certificate of Corollary K.6.5 fixes the remaining real determinant sign when its finite data are supplied.

Type II violation arises from the Berry connection on the generation manifold. By Theorem T.53, the CP-violating phase is:
$$\delta = \oint_{\gamma} \mathcal{A}_B$$
where $\mathcal{A}_B$ is the Berry connection and $\gamma$ is the flavor-changing loop. This holonomy is non-zero even when the connection 1-form is real, because the loop encloses non-trivial curvature. The σ-involution preserves the loop $\gamma$ but reverses the orientation of the configuration space volume form (Lemma Y.8.1: $\mathsf{CP}^* \Omega_3 = -\Omega_3$ on $SU(2) \cong S^3$), allowing non-zero holonomy consistent with overall CP as a symmetry of the vacuum. ∎

**Theorem K.6.18 (CKM Phase from Berry Holonomy).** The CKM CP-violating phase is imported from the Berry-holonomy model of Appendix T:
$$\delta = 66.7° \pm 1.2°$$
where the combined uncertainty reflects geometric and wavepacket contributions.

*Proof.* By the conditional Berry-holonomy calculation of Theorem T.56, the CP phase is computed from the geometric structure of the generation manifold:
$$\delta = \delta_{\text{flat}} \times f_{\text{sinc}} = 70.53^\circ \times 0.9454 = 66.7^\circ$$
where:

- $\delta_{\text{flat}} = 2\arctan(\sqrt{2}/2) = 70.53°$ is the base phase from the up-down sector mismatch in $E_8$ root space
- $f_{\text{sinc}} = \text{sinc}(1/\sqrt{3}) = 0.9454$ is the coherent averaging factor over the generation wavepacket (Theorem T.55)

The experimental value $\delta_{\text{exp}} = 65.7° \pm 1.5°$ (Particle Data Group 2024) agrees within $+0.7\sigma$. ∎

**Table K.6.2: Strong vs Weak CP**

| Effect | Type | Determinant-line status | Result |
|:-------|:-----|:------------------------|:-------|
| $\theta_{\text{QCD}}$ | I | Absolute σ-exact class plus topological-cost selection | $=0$ on the σ-symmetric branch |
| $\arg\det M_q$ | I | Real $E_8$ determinant class plus positive-orientation certificate | $=0$ on the certified orientation branch |
| $\delta_{\text{CKM}}$ | II | Relative flavor holonomy | $=66.7°$ |
| $\delta_{\text{PMNS}}$ | II | Relative neutrino-sector holonomy | Appendix T branch value |
| Baryogenesis CP source | II | Relative holonomy projected through APS update index | Appendix Y branch value |

**Theorem K.6.18a (Relative Determinant-Line CP Ledger).** Let $D_{\mathrm{PU}}$ be the finite chiral update operator on a retained CP branch, and let
$$
\mathcal L_{\det}(D_{\mathrm{PU}})
=
\det\ker D_{\mathrm{PU}}
\otimes
(\det\operatorname{coker}D_{\mathrm{PU}})^*
\tag{K.6.18a.1}
$$
be its determinant line. For a retained loop $\gamma$ in the gauge-flavor parameter branch, define the determinant-line CP phase by
$$
\Theta_{\det}(\gamma)
=
\arg\operatorname{Hol}_{\gamma}(\mathcal L_{\det})
+
\Theta_{\mathrm{APS}}(\gamma)
\pmod{2\pi},
\tag{K.6.18a.2}
$$
where $\Theta_{\mathrm{APS}}(\gamma)$ is the branch-fixed finite APS boundary phase when $\gamma$ is represented by an interpolation region. In conventions where the APS phase is normalized as $\pi\eta_\gamma$, this reduces to $\arg\operatorname{Hol}_\gamma(\mathcal L_{\det})+\pi\eta_\gamma$.

On the $\sigma$-symmetric PCE-Attractor branch with a certified positive-orientation real-Yukawa determinant branch:

1. Type I CP phases are absolute determinant-line classes. The QCD vacuum contribution is σ-exact and PCE-null, and the quark determinant contribution is positive-oriented:
$$
\Theta_{\det}(\gamma_{\mathrm{abs}})
=
\bar\theta
=
0.
\tag{K.6.18a.3}
$$

2. Type II CP phases are relative determinant-line holonomies. On the active flavor branches,
$$
\Theta_{\det}(\gamma_{\mathrm{flavor}})
=
\oint_{\gamma_{\mathrm{flavor}}}\mathcal A_{\mathrm{Berry}},
\tag{K.6.18a.4}
$$
so the CKM and PMNS CP phases are retained exactly when the corresponding relative holonomy acts nontrivially on generation-changing protocols.

3. The baryogenesis CP source is the projection of the same relative holonomy through the anomaly-update index:
$$
\Delta(B+L)
=
2N_g\,\operatorname{Ind}_{\mathrm{upd}}(D_X),
\qquad
\mathcal F_{\mathrm{CP}}
=
\tanh\!\left(\mathcal S\sin\Theta_{\det}(\gamma_{\mathrm{flavor}})\right).
\tag{K.6.18a.5}
$$

Thus absolute CP phase is exact and removed, while relative CP holonomy is physical when it changes a finite generation or anomaly protocol response.

*Proof.* The determinant line of a finite Fredholm update operator is functorial under direct sum, dualization, and restriction to retained finite sectors. The $\sigma$-involution of Definition K.6.3 acts by complex conjugation on this line. For an absolute Type I phase, Theorem K.6.6 gives a σ-invariant real trivialization of the QCD vacuum angle after PCE selection of the $\theta=0$ minimum. The quark-mass determinant contribution is real by Theorem K.6.7 and has positive determinant orientation only when the branch supplies the finite certificate of Corollary K.6.5. Under those two branch inputs, the absolute determinant-line phase is trivial, so (K.6.18a.3) follows.

For a relative flavor loop, the endpoints are compared inside the same real vacuum class, but the path may enclose Berry curvature on the generation bundle. The determinant-line connection restricted to the retained flavor bundle is the Berry connection used in Theorem K.6.18 and Appendix T. Hence its relative holonomy is (K.6.18a.4). Because PPI identifies only protocol-invisible phases, a relative holonomy survives exactly when it changes a generation-changing response presheaf.

For baryogenesis, Theorem Y.4.3b identifies the anomaly-mediated update with the APS index of the chiral predictive update operator, including the APS boundary phase contribution on the boundary Dirac operator. Corollary Y.10.2 identifies the CP phase entering the baryogenesis source with predictive orientation holonomy. Substituting the relative determinant-line phase into the Appendix Y CP factor gives (K.6.18a.5). Therefore the Type I/Type II split is the exact/non-exact split of the determinant-line CP ledger. ∎

### K.6.12 Connection to Baryogenesis

The preservation of Type II CP violation is essential for baryogenesis via the Sakharov conditions.

**Proposition K.6.6 (Sakharov Conditions Satisfied).** The framework satisfies all three Sakharov conditions for baryogenesis (Sakharov 1967):

1. **Baryon number violation:** Electroweak sphalerons (Appendix Y, Section Y.4)
2. **C and CP violation:** Berry holonomy $\delta = 66.7°$ (Theorem K.6.18)
3. **Departure from equilibrium:** SPAP irreversibility $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$ (Theorem 31)

**Theorem K.6.19 (Baryon Asymmetry).** The cosmological baryon asymmetry is:
$$\eta_B = (6.2 \pm 0.5) \times 10^{-10}$$

*Proof.* Appendix Y provides the master formula (Theorem Y.9, Equation (Y.12)):
$$
\eta_B = \mathcal{C}_{eff} \cdot \mathcal{F}_{CP} \cdot f_{wash} \cdot e^{-\kappa_B}.
$$
The baryogenesis complexity is $\kappa_B = \kappa_{CP} + \kappa_{gen}$ with $\kappa_{CP} = \kappa_{EW}/2 = 19.25$ (Theorem T.5) and $\kappa_{gen} = \varepsilon_0/N_g = (\ln 2)/3 \approx 0.231$, hence $\kappa_B = 19.48$ (Appendix Y, Theorem Y.8). The CP factor is $\mathcal{F}_{CP}=\tanh(\mathcal{S}\sin\delta)$ (Appendix Y, Theorem Y.9) with $\mathcal{S}=1/(2\pi\alpha_W)\approx 4.77$ and $\delta=66.7^\circ$ (Theorem K.6.18), so $\mathcal{S}\sin\delta\approx 4.4$ and $\mathcal{F}_{CP}\approx 1$. The efficiency coefficient is $\mathcal{C}_{eff}=\frac{c_{sph}}{2N_g}\mathcal{S}f_{neq}$ (Appendix Y, Proposition Y.9.1) with $c_{sph}=28/79$, $N_g=3$, and $f_{neq}\approx 1$, giving $\mathcal{C}_{eff}\approx 0.282$. With $f_{wash}\approx 0.63\pm 0.05$ (Appendix Y, Proposition Y.9.2) and $e^{-\kappa_B}=e^{-19.48}\approx 3.49\times 10^{-9}$, one obtains
$$
\eta_B \approx 0.282 \times 1 \times 0.63 \times 3.49\times 10^{-9} = 6.2\times 10^{-10},
$$
which yields the stated uncertainty and matches $\eta_B^{\text{obs}} = (6.12 \pm 0.04) \times 10^{-10}$ [Planck Collaboration 2020a]. ∎

### K.6.13 Experimental Predictions

**Prediction K.6.1 (No Axion on the Strong-CP Branch).** On the σ-symmetric, certified positive-orientation real-Yukawa branch, the framework predicts $\bar\theta=0$ exactly without introducing an axion degree of freedom or Peccei-Quinn symmetry (Peccei & Quinn 1977). This branch therefore contains no QCD axion in the strong-CP sector.

This prediction is falsifiable at the branch level: detection of a QCD axion with coupling $g_{a\gamma\gamma}\propto1/f_a$ in the canonical window $10^9\lesssim f_a\lesssim10^{12}$ GeV would refute the Appendix K strong-CP branch. Experiments such as ADMX, ABRACADABRA, and CASPEr are testing this window (Graham et al. 2015).

**Table K.6.3: Axion Search Experiments**

| Axion Type | Mass Range | Detection Method | PU Prediction |
|:-----------|:-----------|:-----------------|:--------------|
| KSVZ | $10^{-6}$ – $10^{-3}$ eV | ADMX, HAYSTAC | Not present |
| DFSZ | $10^{-6}$ – $10^{-3}$ eV | IAXO | Not present |
| Ultralight | $10^{-22}$ – $10^{-18}$ eV | Cosmological | Not present |

**Prediction K.6.2 (Neutron EDM on the Strong-CP Branch).** On the σ-symmetric, certified positive-orientation Appendix K branch, the framework predicts
$$
d_n=0\quad\text{from the strong-CP contribution}
$$
modulo small SM contributions from the CKM phase at the level $|d_n|\sim10^{-31}$ e·cm (Pospelov & Ritz 2005), far below current experimental sensitivity.

**Table K.6.4: Neutron EDM Experiments**

| Experiment | Projected Sensitivity | Timeline | PU Prediction |
|:-----------|:----------------------|:---------|:--------------|
| n2EDM (PSI) | $10^{-27}$ e·cm | 2025+ | Null |
| LANL nEDM | $10^{-27}$ e·cm | 2025+ | Null |
| PanEDM | $10^{-28}$ e·cm | 2030+ | Null |

**Prediction K.6.3 (θ-Vacuum Stability).** The $\theta = 0$ vacuum is dynamically stable under PCE evolution. Perturbations $\delta\theta$ decay with characteristic timescale set by the PCE cost curvature at the minimum.

**Table K.6.5: Consistency Checks**

| Observable | PU Prediction | Measured Value | Status |
|:-----------|:--------------|:---------------|:-------|
| CKM phase δ | 66.7° | 65.7° ± 1.5° | ✓ (+0.7σ) |
| Jarlskog invariant | $3.22 \times 10^{-5}$ | $(3.12^{+0.13}_{-0.12}) \times 10^{-5}$ | ✓ (+0.8σ) |
| Baryon asymmetry | $(6.2 \pm 0.5) \times 10^{-10}$ | $(6.12 \pm 0.04) \times 10^{-10}$ | ✓ (+0.2σ) |
| Neutron EDM | $0$ on the Appendix K strong-CP branch | $<1.8 \times 10^{-26}$ e·cm | branch-consistent |

### K.6.14 Derivation Chain Summary

**Chain for θ_QCD = 0:**

$$\text{PCE} \to \text{Hermiticity} \to \sigma\text{-invariance} \to \theta \in \{0,\pi\} \to \text{PCE cost} \to \theta_{\text{QCD}} = 0$$

Explicitly:
1. PCE (Definition 15) requires minimal complexity.
2. Physical observables have real spectra (Theorem K.6.3).
3. Hermiticity: $O=O^\dagger$ (Step 4 of Theorem K.6.3).
4. σ-invariance of the PCE-Attractor is a branch input, with σ-invariance implying Hermiticity (Lemma K.6.4).
5. CP corresponds to σ through the antiunitary structure (Theorem K.6.1).
6. The θ-vacuum embeds in $\operatorname{Gr}(2,8)$ with $\theta\mapsto-\theta$ under σ (Proposition K.6.4).
7. σ-invariance forces $\theta\in\{0,\pi\}$ (Theorem K.6.5).
8. PCE cost gives $V(\pi)=2V_0>V(0)=0$ (Theorem K.6.6).
9. Therefore $\theta_{\text{QCD}}=0$.

**Chain for $\arg(\det M_q)=0$:**

$$E_8 \subset \mathbb R^8 \to d^2\in\mathbb R \to Y_{ij}\in\mathbb R_{>0} \to \text{positive-orientation certificate} \to \arg(\det M_q)=0$$

Explicitly:
1. $E_8\subset\mathbb R^8$ (Lemma K.6.2).
2. $d^2_{E_8}\in\mathbb R_{\ge0}$ (Lemma K.6.3).
3. Gaussian overlap gives real positive entries $Y_{ij}=Ce^{-\alpha d^2}$ (Theorem K.6.7).
4. Real positive entries alone do not fix the determinant component (Theorem K.6.9).
5. The finite branch supplies either a path from the positive diagonal reference to the physical Yukawa matrix inside $GL(3,\mathbb R)$ or an ordered heat-kernel chamber (Theorem K.6.9; Corollary K.6.9a.1).
6. The certificate gives $\det Y_u>0$ and $\det Y_d>0$.
7. Therefore $\arg(\det M_q)=0$ (Corollary K.6.5).

### K.6.15 Comparison with Alternative Solutions

**Table K.6.6: Alternative Solutions to the Strong CP Problem**

| Solution | Mechanism | New Physics | Prediction | Status |
|:---------|:----------|:------------|:-----------|:-------|
| **Peccei-Quinn** (Peccei & Quinn 1977) | U(1)_PQ → axion | Axion field | $m_a \sim 10^{-5}$ eV | Testable |
| **Nelson-Barr** | Spontaneous CP | New scalars | Model-dependent | Viable |
| **Massless u** | θ unphysical | None | $m_u = 0$ | Ruled out |
| **Anthropic** | Selection | None | Non-predictive | Unfalsifiable |
| **PU (this work)** | σ-invariance + $E_8$ reality + positive-orientation certificate | None | $\bar\theta=0$ on the Appendix K branch | Testable |

**Key Distinction:** The PU solution requires no new particles or symmetries beyond the Standard Model. The same geometric structures determine:

- Fine-structure constant α (Appendix Z)
- Spacetime dimension $D = 4$ (Theorem Z.11)
- Cosmological constant Λ (Appendix U)
- Electroweak scale v (Appendix T)
- Baryon asymmetry η_B (Appendix Y)

### K.6.16 Summary

**Main Result (Theorem K.6.11):**
$$\boxed{\bar\theta=\theta_{\text{QCD}}+\arg(\det M_q)=0\quad\text{on the σ-symmetric positive-orientation branch}}$$

The Strong CP Problem is resolved through two independent geometric mechanisms:

**Table K.6.7: Resolution Summary**

| Component | Value | Mechanism | Reference |
|:----------|:------|:----------|:----------|
| $\theta_{\text{QCD}}$ | 0 | σ-invariance + PCE minimization | Theorem K.6.6 |
| $\arg(\det M_q)$ | 0 | $E_8$ root reality + positive-orientation determinant certificate | Corollary K.6.5 |
| $\bar{\theta}$ | 0 | Combined | Theorem K.6.11 |
| CKM phase $\delta$ | 66.7° | Berry holonomy (Type II) | Theorem K.6.18 |
| $\eta_B$ | validation run $(6.2 \pm 0.5)\times10^{-10}$; theorem-level only after $\mathfrak C_B$ or $\mathfrak C_B^{\mathrm{tr}}$ | Baryogenesis | Theorem K.6.19; Definitions Y.11.7a and Y.11.7e |

**Key Insights:**

1. **σ-invariance forces θ_QCD = 0**: The anti-holomorphic involution on Gr(2,8) corresponds to CP in QFT. Physical (Hermitian) observables are σ-invariant, restricting θ to {0, π}. PCE then selects θ = 0.

2. **$E_8$ reality plus orientation fixes $\arg(\det M_q)=0$**: Yukawa couplings derive from Gaussian overlaps on the real $E_8$ lattice, giving real positive entries. The determinant phase is fixed only after the branch supplies a positive-orientation certificate, either by a nonzero determinant path or by an ordered heat-kernel chamber.

3. **No fine-tuning**: Both contributions vanish independently through different branch mechanisms rather than by cancellation.

4. **Weak CP survives**: Berry holonomy (Type II) is σ-compatible, allowing the CKM phase δ = 66.7° needed for baryogenesis.

5. **Falsifiable branch**: The Appendix K strong-CP branch predicts no QCD axion and exact $\bar\theta=0$ within its stated symmetry and orientation hypotheses.

The resolution requires no new particles (no axion), no new symmetries (Peccei & Quinn 1977), and no fine-tuning on the stated branch. The mechanism naturally explains why CP is violated in weak interactions (Type II, Berry phase) but not in strong interactions (Type I, forbidden by σ-symmetry plus positive-orientation real Yukawa data).

The same geometric structure that generates the three-generation hierarchy (Appendix R) and the fine-structure constant (Appendix Z) also supplies the branch data for $\bar\theta=0$. The Strong CP resolution is not an independent postulate but emerges on the unified PCE-Attractor branch.

---


## K.7 Hierarchy Problem and Naturalness

**Puzzle:** The electroweak scale $v \approx 246$ GeV is 17 orders of magnitude smaller than the Planck scale $M_{Pl} \approx 10^{19}$ GeV. In quantum field theory, radiative corrections should drive the Higgs mass to $M_{Pl}$ unless parameters are fine-tuned to extraordinary precision ($\sim 10^{-34}$). Similarly, the baryon asymmetry $\eta_B \sim 10^{-10}$ appears to require fine-tuning. Why are these hierarchies stable?

**PU Resolution:** Appendix T provides a complete resolution through the Golay-Steiner structure. The hierarchy is not fine-tuned but emerges from discrete information-theoretic complexity:

**Electroweak Complexity:** The complexity parameter $\kappa_{EW}$ counts the number of independent constraints required to specify the electroweak vacuum:
$$\kappa_{EW} = \frac{bk}{2} + \dim(G/H) - \frac{m}{2} = 36 + 3 - 0.5 = 38.5$$
**(Theorem T.4)**, where:
- $bk/2 = 36$ counts alignment constraints between left-chiral information modes and reservoir coordinates
- $\dim(G/H) = 3$ is the dimension of the electroweak coset $(SU(2)_L \times U(1)_Y)/U(1)_{em}$
- $m/2 = 0.5$ subtracts the collective zero mode on $S^3$

**Exponential Suppression:** The electroweak scale emerges as:
$$v = A_{EW} e^{-\kappa_{EW}} M_{Pl}$$
**(Theorem T.6, with $\kappa_{EW}$ from Theorem T.5 and $A_{EW}$ from Theorem T.29)**, where $A_{EW}=O(1)$ is supplied by the Appendix T determinant-model branch. This yields:
$$\frac{v}{M_{Pl}} = A_{EW} e^{-38.5} \approx 2 \times 10^{-17}$$
in excellent agreement with the observed hierarchy.

**Stability Mechanism:** The hierarchy is protected by the discrete structure of the Golay code. Radiative corrections cannot arbitrarily shift $\kappa_{EW}$ because it is determined by the combinatorial properties of the Extended Binary Golay Code $[24, 12, 8]$—specifically, the rate-$\frac{1}{2}$ 12+12 organization selected on the $M = 24$ interface. The code parameters $(n=24, k=12, d=8)$ are discrete combinatorial invariants of the PCE-optimal information structure, not continuous parameters subject to quantum corrections.

**Technical Details:**
- The discrete action $S_{EW} = \kappa_{EW}$ counts real configuration space dimensions subject to alignment (Theorem T.4)
- Gaussian fluctuations around the vacuum minimum contribute at most $O(1)$ corrections, never $O(M_{Pl}^2/v^2) \sim 10^{34}$
- The PCE-Attractor orbit Gr(2,8) with Bures metric provides the geometric arena; the code structure selects specific minima
- Connection to cosmological constant: both $v$ and $\Lambda$ emerge from the same Golay-Steiner structure via different complexity channels ($\kappa_{EW} = 38.5$ versus the Appendix U five-mode reference exponent $\kappa_{\Lambda,\mathrm{ref}} = 141.5$; Theorem U.8c qualifies that value as branch-dependent, while the corresponding four-mode branch value is $\kappa_{\Lambda,\mathrm{trans}} = 142$ on the corrected full-discrete branch of Theorem U.13b under its explicit false-vacuum spectral hypotheses)

**Weinberg Angle and Higgs Mass:** The same mechanism determines:
- Weinberg angle: $\sin^2\theta_W^{(0)} = 3/8$ from PCE isotropy requiring equal gauge kinetic stiffness **(Theorem T.14)**
- Higgs quartic: $\lambda(\mu_\lambda) = 0$ at the metastability boundary **(Theorem T.25)**, predicting $m_H \approx 125$ GeV

**Phenomenological Success:**
- Hierarchy: $v \approx 246$ GeV (input) → test internal consistency
- $\sin^2\theta_W(M_Z)$: conditional on the lifted spectral threshold tuple $(\Delta_1,\Delta_2,\Delta_3)=(15.14,20.94,18.41)$ on $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$, one-loop SM RG evolution from the matching boundary $\sin^2\theta_W(\mu_G) = 3Z_2/(3Z_2+5Z_1)$ with $Z_i=1+\Delta_i/24$ yields the observed Z-pole range **(Theorem T.16, T.18)** on the validation run; Theorem T.78.5 proves that the current canonical ledger supplies no PU-internal spectral branch package deriving that tuple
- $m_H \approx 125$ GeV from the Appendix T metastability-boundary matching branch
- Fermion mass ratios (Appendix T, Section T.25)

The electroweak hierarchy chain gives a closed internal expression for the scale $v$ once the Appendix T determinant-model branch (Theorems T.5, T.29 with the unit-normalization branch) is fixed. The Higgs mass $m_H \approx 125$ GeV is a conditional prediction obtained by matching the PU quartic boundary $\lambda(\mu_\lambda) = 0$ to the Standard Model metastability trajectory as in Theorem T.28, on the SM metastability-boundary matching branch. The quantitative gauge-threshold sector ($\sin^2\theta_W$, $\alpha_s$, $\alpha_{\mathrm{em}}^{-1}$ at the Z pole) remains validation-level in the canonical minimal ledger by Theorem T.78.5 unless an appended spectral branch extension is fixed before comparison and evaluated forward.


## K.8 Cosmological Constant and Primordial Perturbations

**Puzzle:** Quantum field theory predicts vacuum energy $\rho_{vac} \sim M_{Pl}^4$, yet observation requires $\rho_{vac} \sim (10^{-3} \text{ eV})^4$—a discrepancy of 120 orders of magnitude. Similarly, the primordial perturbation amplitude $Q \sim 10^{-5}$ and inflationary observables lack derivation from first principles.

**PU Resolution:** Appendix U supplies a reference scaling law for the cosmological constant within a specific semiclassical counting convention based on the Golay-Steiner vacuum model. The vacuum is modeled by the information-theoretic structure of the Extended Binary Golay Code $\mathcal{G}_{24}$, and the reference weight is written as
$$\boxed{\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-2\kappa_{\mathrm{ref}}}}$$
(Corollary U.17), where $A_{\text{eff}} := K \cdot N_{\text{eff}}$ is the dimensionless prefactor of Proposition U.15a.

**Reference Exponent:** The underlying configuration space is the complex Grassmannian
$$\mathcal{M} = \text{Gr}_{\mathbb{C}}(12,24)$$
of complex dimension $\kappa_0 = k(M-k)=144$ (Theorem U.3). Appendix U then introduces the leading-order reference-counting convention
$$\kappa_{\mathrm{ref}} = \frac{N_{\mathbb{R}} - m}{2},$$
with $N_{\mathbb{R}}=288$ and $m=5$ used as the Appendix U five-mode reference count, giving
$$\kappa_{\mathrm{ref}} = 141.5$$
(Theorems U.15-U.16). Theorem U.8c strengthens the status statement: in the current Definition U.4 continuum action, the pure-coordinate dilatation tangent is a strict negative mode rather than a zero mode, so the five-mode value remains a reference branch rather than a theorem-level vacuum closure. The corresponding four-mode branch value is $\kappa_{\mathrm{trans}}=142$, and Theorem U.13b closes the corrected full discrete problem under the explicit false-vacuum spectral hypotheses stated there.

**Geometric Foundation:** The reference count is tied to the following discrete structures:
- **Interface modes:** $M = 2ab = 24$ where $a = 2$ (active kernel, Theorem Z.1) and $b = 6$ (inactive complement)
- **Code structure:** Extended Binary Golay Code $[24,12,8]$ is PCE-optimal (Theorem Z.13)
- **Steiner system:** the 759 octads form $S(5, 8, 24)$ (Theorem U.2)
- **Hessian identity:** $r - \lambda = 176 = d_0(M - a)$ connects design parameters to PU constants (Theorem U.6)
- **24-cell polytope:** the 24 vertices form a spherical 5-design on $S^3$ (Theorems U.7 and U.30), establishing mode-vertex correspondence (Theorem U.7b)

**Reference Evaluation:**
$$\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-283}$$

For $A_{\text{eff}} = 1$, the five-mode reference convention gives $\Lambda L_P^2 = 3.13\times10^{-122}$. Using the Appendix U working value $A_{\text{eff}} = 0.923 \pm 0.011$ from Corollary U.15b gives the five-mode branch reference evaluation $\Lambda L_P^2 = (2.88 \pm 0.03)\times10^{-122}$. Theorem U.8c obstructs this five-mode value as an unconditional false-vacuum closure in the current Definition U.4 action. The Definition U.6 four-mode branch fixes the exponent $\kappa=142$ under Theorem U.13b and has forward expression $\Lambda_4L_P^2=8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284}$; substituting the same working prefactor gives $(1.06 \pm 0.01)\times10^{-122}$ only as a same-prefactor reference check. Holding $\kappa_{\mathrm{ref}}$ fixed, the observed value $\Lambda L_P^2 = (2.86599 \pm 0.04849)\times10^{-122}$ (Appendix V, Eq. (V.5)) implies $A_{\text{eff}}^{(\text{obs})}=0.917\pm0.016$ on the five-mode reference branch; the corresponding four-mode exponent branch would require $A_{\text{eff}}^{(\text{obs},4)}=2.49\pm0.04$.

**Key Insight:** The same Golay code structure organizes both the electroweak and vacuum sectors, but the logical status differs. The electroweak scale uses the determinant model of Appendix T, whereas the cosmological-constant reference exponent additionally depends on the Appendix U five-mode reference-counting convention and the Appendix U prefactor convention. Theorem U.8c shows that the pure-coordinate dilatation tangent needed for the five-mode branch is obstructed in the current Definition U.4 continuum action. The numerical ratio
$$\frac{2\kappa_{\Lambda,\mathrm{ref}}}{\kappa_{EW}} = \frac{283}{38.5} \approx 7.35$$
is therefore a comparison between two reference exponents, not an unconditional theorem about exact vacuum and electroweak actions.

**Primordial Sector:** The same Golay-Steiner structure determines inflationary observables through a second complexity channel. The primordial configuration space is $\mathbb{CP}^{11}$ (the projectivization of the 12-dimensional signal subspace), with complexity $\kappa_Q = 11$ **(Identification U.20)**. This yields the primordial perturbation amplitude:
$$Q = \frac{e^{-\kappa_Q}}{\sqrt{2}} = \frac{e^{-11}}{\sqrt{2}} = 1.18 \times 10^{-5}$$
**(Theorem U.27)**. The 24-cell spherical 5-design and 12-line adjacency structure determine inflation dynamics via the Starobinsky effective action **(Assumption U.48)**, with geometric e-fold count $N_e = 59.4$ **(Result U.60)**.

**Inflationary Predictions (Appendix U, Sections U.24-U.25):**

| Observable | Prediction | Observed | Tension |
|:-----------|:----------:|:--------:|:-------:|
| $n_s$ | $0.9663$ | $0.9649 \pm 0.0042$ | $0.3\sigma$ |
| $r$ | $0.0034$ | $< 0.036$ | Consistent |
| $A_s$ | $2.08 \times 10^{-9}$ | $(2.10 \pm 0.03) \times 10^{-9}$ | $0.7\sigma$ |
| $\Delta N_e$ | $\pm 0.5$ | N/A | Geometric uncertainty |
| $f_{\text{amp}}$ | $0.98$ | N/A | Amplitude correction |

On the Appendix U five-mode reference branch, the hierarchy $\kappa_{\Lambda,\mathrm{ref}}/\kappa_Q = 141.5/11 \approx 13$ explains why the cosmological-constant reference scale ($e^{-283}$) is exponentially smaller than primordial perturbations ($e^{-22}$). The corresponding four-mode branch value gives $142/11 \approx 13$ and $e^{-284}$ instead. Both sectors derive from the Golay code $[24, 12, 8]$: the vacuum sector involves the full Grassmannian $\text{Gr}_\mathbb{C}(12,24)$, while the primordial sector involves the signal subspace $\mathbb{CP}^{11}$.


## K.9 Cosmology: Time-Varying Gravitational Coupling and Unified Dark Sector

**Puzzle:** Cosmological observations reveal accelerated expansion ($\sim 70$% dark energy) and structure formation governed by non-luminous matter ($\sim 25$% dark matter), yet the Standard Model contains no suitable candidates.

**PU Pathway:** The framework proposes a unified description where the late-time dark response is generated by the same PCE-driven relaxation mechanism that governs the galaxy-sector law modification of Appendix I, but applied to the homogeneous FLRW background. The vacuum sector remains fixed by Appendix U, while the non-vacuum sector couples through a time-dependent effective factor.

**Proposition K.9.1 (Comoving de Sitter Limit of the Effective Temperature).** In the exact de Sitter limit, for a comoving MPU aggregate with negligible internal predictive-acceleration contribution on the coarse-grained background, the effective temperature entering the operational cost reduces to
$$
T_{eff}^{\mathrm{cosmo}} = T_{dS} = \frac{\hbar c}{2\pi k_B}\sqrt{\frac{\Lambda}{3}}.
\tag{K.9.1}
$$

*Proof.* Appendix N gives the effective temperature as the sum of background-bath, Unruh, and internal predictive-acceleration contributions. For a comoving aggregate, the proper-acceleration term vanishes. In the exact de Sitter limit, the background bath is the Gibbons-Hawking bath at temperature $T_{dS}$. Under the stated negligible-internal-term assumption on the coarse-grained background, the effective temperature is therefore $T_{dS}$. ∎

Below, the FLRW background equations are written in units $c=1$.

**Definition K.9.1a (Non-Vacuum Enthalpy Density).** Write
$$
\rho_{nv}(t):=\rho_b(t)+\rho_r(t), \qquad p_{nv}(t):=p_r(t)=\frac{1}{3}\rho_r(t),
\tag{K.9.2}
$$
and define the homogeneous enthalpy density
$$
h_{nv}(t):=\rho_{nv}(t)+p_{nv}(t)=\rho_b(t)+\frac{4}{3}\rho_r(t).
\tag{K.9.3}
$$
The vacuum density is fixed by Appendix U:
$$
\rho_\Lambda:=\frac{\Lambda}{8\pi G_0}.
\tag{K.9.4}
$$

**Definition K.9.1b (Cosmological Sparsity Variable).** For $h_{nv}(t)>0$ define
$$
s_{bg}(t):=\frac{\rho_\Lambda}{h_{nv}(t)},
\tag{K.9.5}
$$
and define $s_{bg}=+\infty$ on the exact de Sitter branch $h_{nv}=0$.

**Postulate K.9.2 (Single-Scale Homogeneous Relaxation).** Let
$$
u(s):=\frac{\Upsilon_G(s)-1}{A_c}, \qquad \Upsilon_G(t):=\frac{G_{eff}(t)}{G_0},
\tag{K.9.6}
$$
where $A_c>0$ is the asymptotic homogeneous relaxation amplitude. The minimal one-scale PCE closure assumes
$$
\frac{du}{d(s^n)}=1-u, \qquad u(0)=0, \qquad n\ge 1.
\tag{K.9.7}
$$

**Theorem K.9.3 (Closed Time-Varying Coupling Law).** Under Postulate K.9.2, the effective background coupling is
$$
\Upsilon_G(t)=1+A_c\left[1-e^{-s_{bg}(t)^n}\right], \qquad G_{eff}(t)=G_0\,\Upsilon_G(t).
\tag{K.9.8}
$$
Equivalently,
$$
G_{eff}(t)=G_0\left[1+A_c\left(1-\exp\left[-\left(\frac{\rho_\Lambda}{\rho_b(t)+\frac{4}{3}\rho_r(t)}\right)^n\right]\right)\right].
\tag{K.9.9}
$$
This law satisfies
$$
G_{eff}(t)\to G_0 \quad \text{as}\quad \rho_b+\frac{4}{3}\rho_r\to\infty,
\qquad
G_{eff}(t)\to G_0(1+A_c) \quad \text{as}\quad \rho_b+\frac{4}{3}\rho_r\to 0.
\tag{K.9.10}
$$

*Proof.* The ODE (K.9.7) has the unique solution $u(s)=1-e^{-s^n}$. Substituting into (K.9.6) yields (K.9.8). Equation (K.9.9) follows from (K.9.3)-(K.9.5). The limits are immediate from $s_{bg}\to 0$ in the dense early universe and $s_{bg}\to\infty$ on the asymptotically de Sitter branch. ∎

**Corollary K.9.3a (Time Derivative of the Coupling).** If baryons and radiation satisfy the standard background continuity equations
$$
\dot\rho_b + 3H\rho_b = 0, \qquad \dot\rho_r + 4H\rho_r = 0,
\tag{K.9.11}
$$
then
$$
\dot s_{bg}
=
H\,s_{bg}\,
\frac{3\rho_b+\frac{16}{3}\rho_r}{\rho_b+\frac{4}{3}\rho_r},
\tag{K.9.12}
$$
and therefore
$$
\dot\Upsilon_G
=
A_c n\,e^{-s_{bg}^n}s_{bg}^{\,n}\,
H\,
\frac{3\rho_b+\frac{16}{3}\rho_r}{\rho_b+\frac{4}{3}\rho_r}.
\tag{K.9.13}
$$

*Proof.* Differentiate (K.9.5) and use (K.9.11). Differentiating (K.9.8) then yields (K.9.13). ∎

**Corollary K.9.3b (Bianchi-Consistent Effective-Fluid Form).** The homogeneous background equations can be written as
$$
H^2 = \frac{8\pi G_0}{3}\left[\rho_\Lambda + \Upsilon_G(t)\rho_{nv}(t)\right] - \frac{k}{a^2},
\tag{K.9.14}
$$
$$
\dot H = -4\pi G_0\left[\Upsilon_G(t)h_{nv}(t) - \frac{\dot\Upsilon_G(t)}{3H}\rho_{nv}(t)\right] + \frac{k}{a^2}.
\tag{K.9.15}
$$
Equivalently, with
$$
\rho_{ad}(t):=\bigl(\Upsilon_G(t)-1\bigr)\rho_{nv}(t),
\qquad
p_{ad}(t):=\bigl(\Upsilon_G(t)-1\bigr)p_{nv}(t)-\frac{\dot\Upsilon_G(t)}{3H}\rho_{nv}(t),
\tag{K.9.16}
$$
the cosmological dynamics take the constant-$G_0$ form
$$
H^2 = \frac{8\pi G_0}{3}\left[\rho_\Lambda + \rho_{nv} + \rho_{ad}\right] - \frac{k}{a^2},
\tag{K.9.17}
$$
$$
\dot H = -4\pi G_0\left[\rho_{nv}+p_{nv}+\rho_{ad}+p_{ad}\right] + \frac{k}{a^2},
\tag{K.9.18}
$$
and the adaptive sector is conserved:
$$
\dot\rho_{ad} + 3H\bigl(\rho_{ad}+p_{ad}\bigr)=0.
\tag{K.9.19}
$$

*Proof.* Differentiate (K.9.14) and use the continuity equations (K.9.11) together with (K.9.13) to obtain (K.9.15). The definitions in (K.9.16) convert (K.9.14)-(K.9.15) to the constant-$G_0$ form (K.9.17)-(K.9.18). A direct substitution shows (K.9.19). ∎

**Remark K.9.3b.1 (de Sitter consistency).** On the exact de Sitter branch, $h_{nv}=0$, hence $s_{bg}=+\infty$, $\Upsilon_G\to 1+A_c$, and $\dot\Upsilon_G\to 0$. Because $\rho_{nv}\to 0$, the adaptive sector decouples and the background limit remains $H^2\to \Lambda/3$.

**Remark K.9.3b.2 (Relation to Appendix I).** Appendix I uses the same saturating exponential response for quasistatic spatial sparsity, with the environmental proxy written as $R/L_0$. The present section is the homogeneous FLRW analogue, with the non-vacuum enthalpy density $h_{nv}$ supplying the covariant background sparsity variable instead of a radial coordinate.

**Observational Signatures:**
- Early-universe suppression: $\Upsilon_G-1 = O\!\left((\rho_\Lambda/h_{nv})^n\right)$, so BBN and CMB deviations are parametrically small in the dense regime.
- Late-time growth modification: linear structure growth is enhanced by the factor $\Upsilon_G(a)$.
- Effective negative pressure: in matter domination, $p_{ad} = -\dot\Upsilon_G\rho_b/(3H)$.
- Local gravity tests constrain the slow drift rate $|\dot\Upsilon_G/\Upsilon_G|$ rather than a universal shift of the vacuum sector.

**Current Status:** The constitutive law is closed at the homogeneous FLRW level. A finite entropic-bridge branch below gives the precise condition under which $(A_c,n)$ are selected by the Appendix D relaxation potential rather than stipulated. Perturbation-level confrontation with growth, lensing, BAO, and CMB data remains a separate observational branch task.

**Definition K.9.4 (Homogeneous Finite Entropic-Bridge Branch).** Let $X_N$ be a finite coarse FLRW predictive state space with detailed-balance reference generator $L_N$ in the sense of Definition D.8.6d. Fix a finite protocol time grid
$$
0=t_0<t_1<\cdots<t_M=1
$$
and let $\Omega_N=X_N^{M+1}$ be the finite path ledger. Let $\mathbb P_{0,N}$ be the strictly positive reference path measure induced by the finite transition kernels of $L_N$ on this grid. Fix endpoint laws
$$
(e_0)_{\#}\mathbb P=\rho_{\mathrm{early}},
\qquad
(e_M)_{\#}\mathbb P=\rho_{\mathrm{late}},
\tag{K.9.20}
$$
and a finite PCE running cost
$$
\mathcal A_{\mathrm{PCE},N}(\omega)
=
\sum_{\ell=0}^{M-1}
(t_{\ell+1}-t_\ell)
\mathcal L_{\mathrm{PCE},N}(x_\ell,x_{\ell+1})
\ge0
$$
for $\omega=(x_0,\dots,x_M)\in\Omega_N$. The homogeneous finite entropic bridge is
$$
\mathbb P_{*,N}
=
\arg\min_{\mathbb P}
\left[
\operatorname{Ent}(\mathbb P\mid\mathbb P_{0,N})
+
\mathbb E_{\mathbb P}\mathcal A_{\mathrm{PCE},N}
\right],
\tag{K.9.21}
$$
where the minimization is over probability measures on the finite path ledger satisfying (K.9.20). The endpoint constraints are part of the branch datum and are assumed feasible.

Let $s_N:X_N\to[0,\infty]$ be the finite sparsity observable converging to $s_{bg}$ in the regular FLRW limit, and let $G_N/G_0-1$ be the finite non-vacuum response observable on the same ledger. Define the bridge-selected response curve by
$$
g_{*,N}(s)
:=
\mathbb E_{\mathbb P_{*,N}}\!\left[
\frac{G_N/G_0-1}{1}
\ \middle|\ s_N=s
\right]
\tag{K.9.22}
$$
for sparsity values with positive bridge weight. The one-scale family is
$$
g_{A,n}(s)=A\left(1-e^{-s^n}\right),
\qquad A\ge0,\quad n\ge1.
\tag{K.9.23}
$$
The branch is one-scale identifiable when the weighted projection problem
$$
(A_c,n)
=
\arg\min_{A\ge0,\ n\ge1}
\int_0^\infty
\left(g_{*,N}(s)-g_{A,n}(s)\right)^2
\,dw_{*,N}(s)
\tag{K.9.24}
$$
has a unique minimizer with positive Hessian on the active parameter tangent, where $w_{*,N}$ is the bridge-induced sparsity measure. In the regular limit, the same definition is used only when the branch supplies convergence of $s_N,w_{*,N},g_{*,N}$ to their continuum limits.

**Theorem K.9.5 (Entropic-Bridge Selection of the Homogeneous Coupling Law).** On a homogeneous finite entropic-bridge branch:

1. the finite bridge $\mathbb P_{*,N}$ exists and is unique;

2. the induced response curve $g_{*,N}$ is unique on the support of $w_{*,N}$;

3. if the branch is one-scale identifiable, then $(A_c,n)$ in (K.9.24) is uniquely selected before comparison with cosmological data;

4. if the bridge-selected curve lies exactly in the one-scale family, so that
$$
g_{*,N}(s)=A_c(1-e^{-s^n}),
\tag{K.9.25}
$$
and the regular FLRW convergence certificate holds, then the homogeneous coupling law is exactly
$$
\Upsilon_G(t)=1+A_c\left[1-e^{-s_{bg}(t)^n}\right],
\qquad
G_{eff}(t)=G_0\Upsilon_G(t),
\tag{K.9.26}
$$
in the regular FLRW limit;

5. the Bianchi-consistent effective-fluid form remains (K.9.14)-(K.9.19).

This is an emergent metric/channel-capacity thermodynamic closure of the homogeneous non-vacuum response. It introduces no fundamental gravitational Hilbert sector.

*Proof.* At fixed $N$ and fixed protocol time grid, the path ledger $\Omega_N=X_N^{M+1}$ is finite. The constraint set defined by (K.9.20) is a closed convex subset of a finite probability simplex and is nonempty by the feasibility assumption. Because $\mathbb P_{0,N}$ is strictly positive, relative entropy is strictly convex on this simplex. Adding the linear expectation of the finite nonnegative running cost preserves strict convexity. Therefore the minimizer (K.9.21) exists and is unique. This proves item 1. The conditional expectation defining $g_{*,N}$ is then fixed by the unique bridge measure, proving item 2 on the support of $w_{*,N}$.

On a one-scale identifiable branch, Definition K.9.4 requires the projection functional (K.9.24) to have a unique minimizer with positive Hessian on the active tangent. Hence $(A_c,n)$ is selected by the bridge-induced response curve and the fixed sparsity measure, not by validation data. This proves item 3.

If the response curve lies exactly in the one-scale family, then substituting (K.9.25) into
$$
\Upsilon_G=1+g_{*,N}
$$
and using the branch convergence $s_N\to s_{bg}$ gives (K.9.26), which is the law of Theorem K.9.3. This proves item 4.

Finally, Corollary K.9.3b derived (K.9.14)-(K.9.19) from the homogeneous coupling law and the standard background continuity equations. Since the entropic-bridge branch changes only the selection rule for $(A_c,n)$ and not the Bianchi identity or the definitions of $\rho_{ad}$ and $p_{ad}$, the effective-fluid form remains unchanged. ∎


## K.10 Renormalization from Operational Finiteness

The exclusion of singularities established in Sections K.5.1–K.5.5 has a direct counterpart in quantum field theory: the exclusion of ultraviolet divergences. Both phenomena arise from extrapolating continuum descriptions beyond their domain of validity, and both are resolved by the same information-theoretic bounds.

**Definition K.10.1 (Operational Observable).** A quantity $\mathcal{O}$ is an operational observable if for every target precision $\epsilon>0$ there exists an MPU-admissible protocol $\mathcal{P}_\epsilon$ (i.e., a finite physically implementable procedure using the allowed interaction/update dynamics, including $\mathcal{E}_N$ updates of Definition 27) that estimates $\langle\mathcal{O}\rangle$ to within $\epsilon$ and uses finite resources, i.e. it has finite predictive complexity and hence finite cost rate:
$$
R(C_P(\mathcal{P}_\epsilon)) + R_I(C_P(\mathcal{P}_\epsilon)) < \infty,
$$
where $R,R_I$ are the resource cost functions (Definition 3).

**Lemma K.10.2 (Operational Finiteness).** If $\mathcal{O}$ is an operational observable (Definition K.10.1), then its operational expectation value $\langle\mathcal{O}\rangle$ is finite. In particular, no MPU-admissible finite-resource protocol can certify $\langle\mathcal{O}\rangle=\infty$.

*Proof.* By Definition K.10.1, for $\epsilon=1$ there exists an MPU-admissible finite-resource protocol $\mathcal{P}_1$ producing an estimate within additive error $1$ of $\langle\mathcal{O}\rangle$. If $\langle\mathcal{O}\rangle$ were infinite, no finite real-valued estimate could satisfy an additive-error bound, contradicting the definition. Hence $\langle\mathcal{O}\rangle$ is finite. ∎

**Definition K.10.3 (MPU Momentum Cutoff).** The MPU network defines an intrinsic momentum scale:
$$
\Lambda_{\text{MPU}} := \frac{\hbar}{\delta} = \frac{m_P c}{\sqrt{8\ln 2}} \approx 0.424\, m_P c,
$$
where $\delta = \sqrt{8\ln 2}\, L_P \approx 2.355\, L_P$ is the PCE-optimal MPU spacing (Appendix Q, Equation Q.18) and $m_P = \sqrt{\hbar c/G}$ is the Planck mass. In natural units ($\hbar = c = 1$), the corresponding wavenumber is $k_{\text{MPU}} = 1/\delta = 1/(\sqrt{8\ln 2} \cdot L_P) \approx 0.424/L_P$, which sets the scale at which the continuum approximation breaks down. This is an invariant operational cutoff scale, not by itself a Lorentz-violating photon-dispersion scale; any such dispersion law requires the separate non-attractor branch data described in Appendix Q, Prediction Q.6.2.

**Theorem K.10.3a (Operational Anti-Continuum Principle).** Let $\mathfrak C$ be a mathematical structure whose exact physical interpretation would require uniformly refinable distinctions at all resolutions $\nu>0$ on a fixed bounded operational domain. Let $N_{\mathfrak C}(\nu)$ be the minimum number of mutually distinguishable alternatives required to specify those distinctions to resolution $\nu$. If
$$
\lim_{\nu\to0}\ln N_{\mathfrak C}(\nu)=+\infty,
$$
then $\mathfrak C$ cannot be physically instantiated as an exact object by any single finite-resource MPU instantiation. It can enter PU only through finite-resolution quotients, effective closures, or coarse-grained descriptions whose required $N_{\mathfrak C}(\nu)$ is finite at the resolution actually used.

In particular, an exact real-number continuum, an exact uniformly refinable positive-dimensional Lie symmetry, a continuum of ontic branch labels, or a continuum field with independently meaningful sub-$\delta$ modes is not a physically instantiated PU object. Such structures are mathematical completions of finite operational data.

**Corollary K.10.3b (Operational Continuum as a Universality Class).** Let $\{\mathcal N_i,\mathcal E_i,V_i\}_{i\in I}$ be finite MPU-network descriptions with common operational resolution $\delta$ and let
$$
\mathcal O_{\le\delta}
$$
be the admissible observable algebra at that resolution. If for every pair $i,j$ and every $O\in\mathcal O_{\le\delta}$ the induced outcome distributions agree up to operational tolerance,
$$
d_{\mathrm{TV}}\!\left(P_i(O),P_j(O)\right)\le \epsilon_\delta,
$$
then the descriptions belong to the same operational-continuum universality class:
$$
[\mathcal N_i]_{\mathrm{cont}}
=
[\mathcal N_j]_{\mathrm{cont}}.
$$
The emergent manifold, metric, and AQFT net are therefore representatives of a finite-resolution closure class rather than an ontological $\delta\to0$ limit.

*Proof.* MPU-equivalence at resolution $\delta$ is defined by equality of all admissible predictive distributions up to the readout tolerance. The displayed total-variation bound is exactly that equivalence criterion for the observable algebra $\mathcal O_{\le\delta}$. Quotienting finite descriptions by this operational equivalence produces classes. Any continuum structure assigned to the class is determined only by the shared predictions of its representatives, not by sub-$\delta$ distinctions. Hence the continuum is a universality class of finite closures. ∎

*Proof.* Fix any finite-resource MPU instantiation or protocol $\mathcal P$ on a bounded operational domain. It uses finitely many update cycles and finitely many finite-dimensional channels. Since each update requires at least $\tau_{\min}>0$ (Theorem 29), the number of update layers in any finite duration is finite. Since each channel has finite capacity $C_{\max}<\ln d_0$ (Theorem E.2), the total distinguishability budget of $\mathcal P$ is bounded by some finite number
$$
B(\mathcal P)<\infty.
$$
Equivalently, the number of mutually distinguishable alternatives that can be selected, stored, transmitted, or erased by $\mathcal P$ is at most $\exp(B(\mathcal P))$.

If $\mathfrak C$ were instantiated exactly by that finite resource object, then the same physical instantiation would have to support the distinctions needed for every resolution $\nu>0$. Since $\ln N_{\mathfrak C}(\nu)\to\infty$, choose $\nu$ such that
$$
\ln N_{\mathfrak C}(\nu)>B(\mathcal P).
$$
Then $N_{\mathfrak C}(\nu)>\exp(B(\mathcal P))$, contradicting the finite distinguishability bound. The same conclusion follows from Landauer accounting: selecting or erasing one alternative among $N_{\mathfrak C}(\nu)$ alternatives costs at least $\ln N_{\mathfrak C}(\nu)$ nats, which cannot be absorbed by a fixed finite-resource instantiation as $\nu\to0$. Therefore exact continuum structure is not PU-admissible as physical ontology; only finite-resolution approximants or closures carry operational content. ∎

**Theorem K.10.4 (Intrinsic UV Finiteness).** Let $\mathcal{A}_{phys}(\mu)$ denote any operational scattering observable whose preparation and readout are defined at a characteristic external scale $\mu$ (i.e., all operational coarse-graining lengths satisfy $\ell\sim 1/\mu \gg \delta$). Then:

(i) $\mathcal{A}_{phys}(\mu)$ is finite.

(ii) Any continuum QFT representation used to compute $\mathcal{A}_{phys}(\mu)$ must be interpreted as an effective description valid only above the intrinsic MPU spacing $\delta$ (Appendix Q, Eq. Q.18), and therefore may be taken to be regulated at the intrinsic cutoff $\Lambda_{MPU}:=\hbar/\delta$ (Definition K.10.3). Degrees of freedom with wavelengths $\lambda<\delta$ (equivalently momenta $k>\Lambda_{MPU}$) are not independently operational in PU and can influence $\mu$-scale observables only through the parameters of the regulated effective action at $\Lambda_{MPU}$.

(iii) Consequently, ultraviolet divergences arising from the formal $\Lambda\to\infty$ limit of continuum integrals are extrapolation artifacts: they arise from extending the continuum description into the non-operational regime $\lambda<\delta$ and have no operational meaning.

*Proof.*
(i) By Definition K.10.1, $\mathcal{A}_{phys}(\mu)$ is an operational observable; by Lemma K.10.2 its operational value is finite.

(ii) In PU the fundamental degrees of freedom are MPU-network degrees of freedom with characteristic spacing $\delta$ (Definition 35; Appendix Q, Eq. Q.18). Operational protocols act by finite MPU-admissible interaction/update steps (Definition 27) across finite-capacity channels (Theorem E.2). Any purported "mode" with $\lambda<\delta$ would require independent operational distinguishability of sub-MPU structure, which is not available to MPU-admissible protocols. Therefore changes confined to $\lambda<\delta$ cannot be represented as independently measurable degrees of freedom and can affect operational predictions only via their induced change in the effective dynamics of the MPU-resolved degrees of freedom. In a continuum representation this is exactly the statement that the effect of $k>\Lambda_{MPU}$ is encoded in the parameters of the effective action defined at $\Lambda_{MPU}$.

(iii) UV divergences in continuum QFT arise from integrating over arbitrarily large momenta, i.e., from assuming operational meaning for $\lambda\to 0$. Since PU enforces a non-operational regime below $\delta$, those divergent contributions are outside the domain of the effective description and cannot correspond to any operational observable. ∎

**Definition K.10.4a (Hadamard-Subtracted UV PCE Cost).** Let $U$ be a relatively compact normal neighborhood in the regular AQFT branch of Theorem F.10.2. Let $\omega_2$ be the two-point distribution of a quasifree local state on $U$, and let $H_U$ be the local Hadamard parametrix with the same antisymmetric commutator singularity. Define the Hadamard-subtracted remainder
$$
r_U:=\omega_2-H_U.
\tag{K.10.4a.1}
$$
Choose a countable family $\{Q_j\}_{j\ge1}$ of properly supported order-zero pseudodifferential microlocal cutoffs whose conic supports cover $T^*(U\times U)\setminus0$. For Sobolev order $m\ge0$, write
$$
N_{j,m}(r_U):=\lVert Q_j r_U\rVert_{H^m_{\mathrm{loc}}(U\times U)}.
$$
The local UV PCE gate cost is
$$
\mathcal C_{\mathrm{Had}}(\omega;U)
:=
\begin{cases}
\displaystyle
\sum_{j,m\ge1}2^{-j-m}
\frac{N_{j,m}(r_U)}{1+N_{j,m}(r_U)},
&
N_{j,m}(r_U)<\infty\ \text{for all }j,m,\\[1.2em]
+\infty,
&
\text{otherwise.}
\end{cases}
\tag{K.10.4a.2}
$$
The global regular-branch cost is finite when (K.10.4a.2) is finite on every normal-neighborhood member of an admissible finite cover.

**Theorem K.10.4b (Hadamard-PCE State Gate).** On the regular quasifree AQFT branch, a continuum state is PU-admissible at finite renormalized UV PCE cost if and only if its two-point function is Hadamard:
$$
\mathcal C_{\mathrm{Had}}(\omega;U)<\infty
\quad\Longleftrightarrow\quad
\omega_2\ \text{is Hadamard on }U.
\tag{K.10.4b.1}
$$
Equivalently,
$$
\operatorname{WF}(\omega_2)
=
\{(x,k_x;y,-k_y):(x,k_x)\sim(y,k_y),\ k_x\in\overline V^+_x\}
\tag{K.10.4b.2}
$$
on the regular branch. Non-Hadamard continuum states are therefore not additional physical states of PU; they are continuum representatives whose sub-resolution singular data have infinite renormalized predictive description cost.

*Proof.* A distribution $u$ is smooth on $U\times U$ if and only if every microlocal cutoff $Q_j u$ belongs to $H^m_{\mathrm{loc}}(U\times U)$ for every $m\ge0$. The family $\{Q_j\}$ covers all nonzero cotangent directions, so this criterion applies to $r_U=\omega_2-H_U$.

If $\omega_2$ is Hadamard, the local Hadamard theorem gives
$$
\omega_2=H_U+s_U
$$
with $s_U\in C^\infty(U\times U)$. Hence $r_U=s_U$, so $N_{j,m}(r_U)<\infty$ for all $j,m$. The sum in (K.10.4a.2) is then bounded by
$$
\sum_{j,m\ge1}2^{-j-m}<\infty,
$$
and $\mathcal C_{\mathrm{Had}}(\omega;U)<\infty$.

Conversely, suppose $\mathcal C_{\mathrm{Had}}(\omega;U)<\infty$. Then every $N_{j,m}(r_U)$ is finite. Hence $Q_jr_U$ is in all local Sobolev spaces for every $j$. Since the $Q_j$ cover every nonzero cotangent direction, $r_U$ has empty wavefront set. Thus $r_U$ is smooth. Therefore $\omega_2$ differs from the local Hadamard parametrix by a smooth remainder, which is equivalent to the microlocal Hadamard spectrum condition (K.10.4b.2).

If $\omega_2$ is not Hadamard, then $r_U$ is not smooth on some normal neighborhood. Its wavefront set contains a nonzero covector. Some $Q_j$ is elliptic on a conic neighborhood of that covector, so $Q_jr_U$ is not in $H^m_{\mathrm{loc}}$ for some $m$. By Definition K.10.4a the cost is $+\infty$. ∎

**Corollary K.10.4c (Stress-Energy and Null-Energy Regularity Gate).** The MPU stress-energy source construction, the local Rindler/KMS horizon branch, and the predictive null-energy inequality are continuum-admissible only on the Hadamard-PCE finite-cost state sector. On that sector the point-split stress tensor and Wick powers have finite renormalized local representatives. Outside that sector, the would-be continuum stress tensor is not a PU observable because the state already fails the UV PCE gate.

*Proof.* The point-splitting construction subtracts the universal Hadamard singularity before taking the coincidence limit. By Theorem K.10.4b the subtracted remainder is smooth exactly on the finite-cost sector, so the local derivatives required in the stress tensor and Wick powers are well defined there. If the state is non-Hadamard, some microlocal derivative order has infinite UV PCE cost, so no finite-resource MPU protocol can promote that continuum expression to an operational observable. ∎

**Theorem K.10.5 (UV–Strong-Curvature Unified Exclusion).** UV divergences in continuum QFT and curvature singularities in continuum GR are excluded by the same operational mechanism: both arise from extrapolating continuum descriptions beyond the domain enforced by finite information-processing capacity and the discrete MPU scale.

| Divergence Type | Formal Expression | Exclusion Mechanism |
|:----------------|:------------------|:--------------------|
| UV (QFT) | $\int_0^\infty d^4k$ | $C_{\max} < \ln d_0$, discrete $\delta$ |
| Strong-curvature (GR) | $\|R\| \to \infty$ | $S \leq A/(4G)$, discrete $\delta$ |

*Proof.* Both exclusions follow from three framework bounds:

(i) **Finite channel capacity** (Theorem E.2): $C_{\max} < \ln d_0 = \ln 8$. Specifying an infinite quantity requires infinite information transfer, which finite-capacity channels cannot support.

(ii) **Holographic bound** (Theorem 49): $S \leq A/(4G)$. Information content scales with boundary area. Infinite density in finite volume violates this bound.

(iii) **Discrete substrate** (Appendix Q): $\delta/L_P = \sqrt{8\ln 2}$. The continuum manifold is an approximation valid for $\ell > \delta$. Extrapolation below this scale produces artifacts—curvature divergences in the strong-curvature regime, momentum integral divergences in the UV regime—with no operational content.

The parallel is structural: in both cases, the divergence signals breakdown of the continuum approximation below $\ell\sim\delta$, where no operationally admissible protocol can access additional independent degrees of freedom. ∎

**Corollary K.10.6 (Divergent Complexity Cost).** Achieving predictive accuracy $\alpha$ approaching the SPAP limit requires complexity $C_{\text{uni}}(\delta_{\text{SPAP}})$ satisfying (Theorem 14, Appendix B Equation B.5):
$$
C_{\text{uni}}(\delta_{\text{SPAP}}) = \Omega\left(\log\left(\frac{1}{\delta_{\text{SPAP}}}\right) \cdot \frac{1}{\delta_{\text{SPAP}}^2}\right)
$$
where $\delta_{\text{SPAP}} = \alpha_{\text{SPAP}} - \alpha$ is the error margin. As $\delta_{\text{SPAP}} \to 0$ (perfect resolution), $C_{\text{uni}} \to \infty$. Finite systems cannot achieve vanishing error margins in self-referential prediction tasks. Extrapolations that require infinite precision therefore have no operational content in PU.

**Theorem K.10.7 (FRG Coarse-Graining as Operational Compression).** The functional renormalization group flow (Appendix X, Equation X.4)
$$
\partial_k \Gamma_k[\phi] = \frac{1}{2}\,\mathrm{STr}\!\left[\left(\Gamma_k^{(2)}[\phi] + R_k\right)^{-1} \partial_k R_k\right]
$$
implements a one-parameter family of effective descriptions in which degrees of freedom with momenta $q\gtrsim k$ are systematically integrated out. In PU, this flow is identified with the continuum analogue of PCE-selected compression: moving to smaller $k$ discards microscopic detail that is not operationally accessible or predictively efficient at the corresponding resolution scale.

*Proof.* At momentum scale $k$, the effective action $\Gamma_k$ encodes physics for modes with momenta $q < k$. Modes with $q > k$ contribute only through their effect on lower-momentum dynamics. PCE (Definition 15) mandates that predictive models minimize the total PCE Potential (Appendix D, Definition D.1). At momentum scale $k$, this corresponds to minimizing:
$$
\mathcal{L}_{\text{PCE}}^{(k)} = C_P[\Gamma_k] + \lambda \cdot \Delta[\Gamma_k]
$$
where $C_P[\Gamma_k]$ is the predictive complexity required to specify the effective action at scale $k$, and $\Delta[\Gamma_k]$ quantifies the dissipation associated with coarse-graining from higher momenta.

**Part A (Irrelevant operators are PCE-suppressed).** Operators of dimension $d > 4$ contribute $O((k/\Lambda_{\text{MPU}})^{d-4})$ to low-energy physics. Their retention increases $C_P[\Gamma_k]$ without proportionate predictive benefit at scale $k$. By PCE optimization (Definition 15), such operators are suppressed.

**Part B (Relevant operators are PCE-preserved).** Operators of dimension $d < 4$ dominate low-energy physics. Their contribution to predictive performance exceeds their complexity cost. PCE preserves them.

**Part C (Marginal operators persist with running).** Operators of dimension $d = 4$ contribute at all scales with logarithmic running. Their PCE cost-benefit ratio remains balanced across the RG flow.

**Part D (Fixed points as PCE equilibria).** At RG fixed points, $\partial_k \Gamma_k = 0$. This corresponds to $\partial \mathcal{L}_{\text{PCE}}/\partial \Gamma = 0$: the system has reached a local extremum of the PCE functional. The RG fixed point structure thus reflects the landscape of PCE equilibria. ∎

**Remark K.10.7a (Categorical Language for Operational RG).** The RG-compression statement of Theorem K.10.7 can be expressed categorically without adding a new physical postulate. Let $\mathsf P_\Lambda$ be the finite category of MPU-admissible prediction protocols at resolution $\Lambda$, let
$$
F_\Lambda:\mathsf P_\Lambda\to\mathsf{Prob}
$$
assign outcome distributions, and let
$$
q_{\Lambda\to\mu}:\mathsf P_\Lambda\to\mathsf P_\mu
$$
be the finite coarse-graining functor that forgets protocol distinctions invisible at scale $\mu<\Lambda$. The lower-resolution predictive functor may be written as the universal finite pushforward
$$
F_\mu\simeq \operatorname{Lan}_{q_{\Lambda\to\mu}}F_\Lambda
$$
whenever the left Kan extension exists in the finite stochastic category being used. In this reading, universality classes are natural-isomorphism classes of lower-resolution prediction functors. This is an organizing language for Theorem K.10.7, not an independent derivation of the MPU-to-RG correspondence.

**Corollary K.10.8 (Universality from PCE).** The universality of critical phenomena—insensitivity of long-distance physics to microscopic details—follows from PCE selecting against propagation of high-complexity microscopic information to macroscopic scales. Near a critical point, only relevant operators (low PCE cost) survive; irrelevant operators (high PCE cost) are suppressed by factors of $(k/\Lambda_{\text{MPU}})^{d-4}$.

**Theorem K.10.9 (Operational Meaning of Non-Renormalizability).** Let a continuum effective description at scale $\mu$ be specified by an operator expansion with coefficients $\{c_n\}$. If achieving a fixed target prediction precision $\epsilon>0$ for a given operational observable at scale $\mu$ requires specification of an unbounded amount of independent information in $\{c_n\}$ (equivalently, predictive complexity $C_P\to\infty$ as $\epsilon\to 0$ at fixed $\mu$), then the description is not MPU-admissible and signals a mismatch between the chosen variables and the operational degrees of freedom at the intrinsic cutoff $\Lambda_{MPU}$.

*Proof.* For fixed $\mu$ and target precision $\epsilon$, an operational protocol must be finite-resource realizable (Definition K.10.1), hence must have finite predictive complexity and finite cost rate. If the effective description requires an unbounded amount of independent parameter information to reach that precision, then encoding the model itself forces $C_P\to\infty$, contradicting finite-resource realizability (Definition 3; Theorem 3; Theorem 14). Therefore, only effective descriptions whose parameter information demand remains bounded at fixed operational precision can be MPU-admissible. ∎

**Theorem K.10.10 (Gravity as Emergent Thermodynamics).** In the PU framework, gravitational dynamics emerge from thermodynamic consistency at causal boundaries:

(i) The Einstein field equations arise from requiring that entropy flux through local Rindler horizons saturates the Bekenstein bound [Jacobson 1995; Appendix Q, Theorem Q.0.17].

(ii) The gravitational coupling $G$ is determined by MPU channel capacity (Equation E.9):
$$
G = \frac{\eta \delta^2 c^3}{4\hbar \chi C_{\max}}
$$

(iii) The metric $g_{\mu\nu}$ is a collective variable describing MPU network geometry, not an independent quantum field.

*Proof.*

(i) The Jacobson construction derives $G_{\mu\nu} = 8\pi G T_{\mu\nu}$ from the thermodynamic identity $\delta Q = T \, dS$ applied to local Rindler horizons, using $T = \hbar a/(2\pi k_B c)$ [Unruh 1976] and $dS = dA/(4G)$ [Bekenstein 1973; Hawking 1975]. This derivation requires no graviton propagator or metric quantization.

(ii) Equation E.9 follows from Theorem E.5 (thermodynamic consistency) with PCE optimization fixing $\delta/L_P = \sqrt{8\ln 2}$ (Appendix Q).

(iii) The emergent manifold (Section 11, Theorem 43) arises as a continuum approximation to discrete MPU network correlations. The metric encodes distances between MPU nodes; it is not a fluctuating quantum field but a thermodynamic variable characterizing the network's collective geometry. Just as temperature fluctuations in a gas are real but derive from molecular dynamics rather than a quantized temperature field, metric fluctuations are real but derive from MPU network dynamics rather than graviton exchange. ∎

**Corollary K.10.11 (Non-Renormalizability Explained).** The non-renormalizability of perturbative quantum gravity is a correct diagnosis: gravity is not a quantum field theory in the conventional sense.

(i) Attempting to quantize $g_{\mu\nu}$ as a spin-2 field treats an emergent collective variable as fundamental.

(ii) The resulting infinities signal operational mismatch (Theorem K.10.9), not missing physics.

(iii) The UV completion is not a conventional theory of quantized gravitons at high energy but the discrete MPU dynamics from which the metric emerges. What would be identified as gravitons in a perturbative treatment are collective excitations of the MPU network geometry.

**Theorem K.10.12 (Unified Origin of UV Finiteness and Gravity on the Gravity-Bridge Package).** The finite boundary-information ingredient is supplied quantitatively by the completed reset-support capacity bound
$$
C_{\max}\le\ln d_0-\ln2
$$
(Proposition E.2a), with $C_{\max}^*=2\ln2$ on the minimal $d_0=8$ residual-budget branch, and strictly on refresh/minorization branches by $C_{\max}<\ln d_0$ (Theorem E.2). On the gravity-bridge package — comprising (a) horizon saturation, (b) the local Rindler/KMS modular branch of Appendix F, (c) the Clausius relation $\delta Q=T\,dS$ at local Rindler horizons, and (d) the MPU stress-energy source construction of Appendix B (Theorems B.3, B.8b, on the momentum-flux closure and admissible coarse-graining branches) — this ingredient simultaneously:

(i) Excludes UV divergences by limiting information extractable from sub-MPU scales (Theorem K.10.4).

(ii) Enforces the Bekenstein bound $S \leq A/(4G)$ on the area-law calibration branch (Theorem 49, Theorem E.6).

(iii) Enters the Jacobson-style derivation of Einstein's equations when saturated at horizons (Theorem Q.0.17), with components (b)–(d) of the bridge package supplying the Clausius/KMS/source ingredients beyond the channel-capacity input itself.

*Proof.* All three follow from finite channel capacity:

(i) Modes with $k>\Lambda_{\mathrm{MPU}}$ require distinctions below the MPU resolution scale $\delta$. On a fixed finite boundary or finite protocol domain, the number of distinguishable alternatives needed to resolve such modes grows beyond the finite-response channel budget of Proposition E.2a and Theorem K.10.3a. They are therefore operationally inaccessible as independent physical observables.

(ii) The effective link density $\sigma_{\text{eff}} = \chi/(\eta\delta^2)$ and capacity $C_{\max}$ yield boundary entropy $S = \sigma_{\text{eff}} \cdot C_{\max} \cdot A = A/(4G)$ (Theorem E.3, Theorem E.5).

(iii) The Rindler-Landauer cycle time $\tau_U = 2\pi c/a$ (Theorem Q.0.10) sets the computational rate at horizons. Requiring entropy production to match Bekenstein-Hawking at this rate yields the Einstein tensor (Appendix Q, Section Q.0.9.8). ∎

**Corollary K.10.13 (Status of Gravitational Waves).** The framework predicts:

(i) Gravitational waves are collective excitations of MPU network geometry—propagating disturbances in the relational structure of the network.

(ii) At wavelengths $\lambda \gg \delta$, these excitations satisfy the linearized Einstein equations and exhibit massless spin-2 tensor structure, consistent with observations.

(iii) The framework does not require a fundamental graviton: the spin-2 behavior at $\lambda \gg \delta$ is a property of collective perturbations of the emergent metric. If a "graviton" description is used, it is an effective quasiparticle language for those collective modes rather than a fundamental degree of freedom.

(iv) At wavelengths $\lambda \sim \delta \approx 2.355\, L_P$, the continuum description fails and discrete MPU dynamics dominate.

*Proof.* Linearizing the emergent metric $g_{\mu\nu} = \eta_{\mu\nu} + h_{\mu\nu}$ about Minkowski space yields wave equations for $h_{\mu\nu}$ with spin-2 tensor structure. This is a property of the geometry of perturbations, not a particle propagator. The distinction is analogous to sound waves in a crystal: phonon language is useful but phonons are not fundamental particles—they are collective lattice excitations. Similarly, gravitational waves are collective MPU network excitations. At $k \sim \Lambda_{\text{MPU}}$, the continuum approximation breaks down (Theorem 43), and no particle interpretation remains even as a convenient fiction. ∎

**Proposition K.10.14 (Bare Parameters).** In standard QFT, "bare" parameters at cutoff $\Lambda \to \infty$ are taken to infinity to cancel divergences. In the PU framework:

(i) Bare parameters at $\Lambda > \Lambda_{\text{MPU}}$ have no operational meaning—they refer to a regime where the continuum approximation is invalid.

(ii) Parameters at $\Lambda_{\text{MPU}}$ are finite and, in principle, derivable from MPU dynamics.

(iii) Renormalized parameters at scale $\mu < \Lambda_{\text{MPU}}$ encode operationally accessible physics at that scale.

*Proof.* By Theorem K.10.4, modes with $k > \Lambda_{\text{MPU}}$ are operationally inaccessible. Parameters defined in terms of such modes have no measurable consequences. The renormalization procedure extracts the finite, operationally meaningful content by integrating out inaccessible modes and absorbing their effects into redefined parameters at accessible scales. ∎

**Remark K.10.15 (Distinction from Wilsonian Effective Field Theory).** A natural objection is that Wilsonian EFT already embodies the principle that sub-cutoff physics is irrelevant to low-energy observables, rendering the PU treatment redundant. This objection conflates three distinct claims. First, in the Wilsonian framework the lattice (or cutoff) is an auxiliary regularization device introduced to make calculations well-defined, with the continuum limit $a \to 0$ taken as the physically fundamental description; in PU, the lattice at spacing $\delta = \sqrt{8\ln 2} \cdot L_P$ (Appendix Q, Eq. Q.18) *is* the physical substrate, and the continuum is the approximation — the priority of lattice and continuum is reversed. Second, Wilsonian EFT provides no *principled reason* why sub-cutoff physics should be irrelevant; it is an empirical observation elevated to methodology. In PU, the irrelevance is derived: modes with $k > \Lambda_{\text{MPU}}$ are operationally inaccessible because resolving them requires channel capacity exceeding the bound $C_{\max} < \ln d_0$ (Theorem E.2) and predictive complexity exceeding $C_{\text{uni}}(\delta_{\text{SPAP}})$ (Theorem 14, Corollary K.10.6), which incurs divergent resource costs. Third, the PU framework derives the mass gap through three independent routes (thermodynamic contractivity from $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$, geometric rootlessness of the Leech lattice $\Lambda_{24}$, and the Action-Entropy Identity of Corollary Q.0.1) without invoking the continuum limit as a bridge between coupling regimes. These derivations are unavailable within standard Wilsonian EFT, which requires asymptotic freedom to connect strong and weak coupling.

**Connection to Horizon Thermodynamics.** The results of Appendix Q (Section Q.0.9, Theorems Q.0.10–Q.0.17) complete this unified picture. The Rindler-Landauer cycle time $\tau_U = 2\pi c/a$ (Theorem Q.0.10) establishes that horizons process information at finite rate:
$$
\dot{N} = \frac{a}{2\pi c}.
$$
This computational rate bound applies universally: at black hole horizons (Theorem Q.0.12), at acceleration horizons, and implicitly at the MPU substrate level. The UV cutoff $\Lambda_{\text{MPU}}$ and the IR horizon bounds are dual manifestations of the same finite information-processing capacity.

The equivalence established in Theorem Q.0.15—linking Bekenstein-Hawking entropy, Landauer dissipation, horizon area, and gravitational coupling—extends to UV physics: renormalization succeeds because it respects the same information bounds that exclude singularities.

**Summary.** Within the Predictive Universe framework, renormalization extracts operational predictions from continuum approximations that, if extrapolated literally, would describe operationally inaccessible physics. The framework's finite reset-support channel budget (Proposition E.2a), discrete substrate spacing $\delta=\sqrt{8\ln2}\,L_P$ on the Appendix Q packing branch, and divergent complexity costs (Theorem 14) guarantee that UV divergences are extrapolation artifacts rather than retained finite-response observables. The same operational mechanism that excludes physically meaningful curvature singularities (Theorem K.5.4) excludes ultraviolet divergences as physical observables (Theorem K.10.4).

The non-renormalizability of perturbative quantum gravity receives a definitive explanation: gravity is not a quantum field theory in the conventional sense. The metric $g_{\mu\nu}$ is a collective variable encoding MPU network geometry, and Einstein's equations emerge from thermodynamic consistency at causal boundaries (Theorem K.10.10). Attempting to quantize this emergent structure produces infinities that correctly signal operational mismatch (Corollary K.10.11).

UV finiteness and emergent gravity are unified: both arise from the finite reset-support information capacity of the MPU network together with the gravity-bridge package (horizon saturation; local Rindler/KMS branch of Appendix F; Clausius relation $\delta Q=T\,dS$; MPU stress-energy source construction of Appendix B), as stated in Theorem K.10.12. The cutoff at $\Lambda_{\mathrm{MPU}}$ is not an external regularization but the scale at which the discrete substrate—from which gravity itself emerges—becomes directly relevant.

---

**Theorem K.10.16 (Operational Inertial-Range Turbulence Scaling).** Let an MPU-admissible fluid description possess a finite inertial range
$$
k_0\ll k\ll k_d\le \Lambda_{\mathrm{MPU}},
\tag{K.10.20}
$$
with forcing confined to $k\lesssim k_0$ and dissipation confined to $k\gtrsim k_d$. Suppose that inside the inertial range:

1. the only conserved transferred scalar relevant to the one-dimensional energy spectrum is the scale-independent energy flux per unit mass $\varepsilon_T$;
2. PCE compression removes dependence on forcing details, viscosity, molecular structure, and sub-MPU degrees of freedom from the inertial-range closure;
3. the inertial-range spectrum $E(k)$ is locally determined only by $\varepsilon_T$ and $k$.

Then the spectrum has the universal exponent
$$
E(k)=C_K\,\varepsilon_T^{2/3}k^{-5/3},
\tag{K.10.21}
$$
where $C_K$ is a dimensionless branch constant not fixed by dimensional closure alone.

*Proof.* In a statistically stationary inertial range, energy neither accumulates at an intermediate wavenumber nor is created there. The flux entering each inertial shell equals the flux leaving it, so the flux is independent of $k$ and is denoted $\varepsilon_T$. The dimensions are
$$
[E(k)]=L^3T^{-2},
\qquad
[\varepsilon_T]=L^2T^{-3},
\qquad
[k]=L^{-1}.
$$
By assumption 3, write
$$
E(k)=C_K\varepsilon_T^a k^b
$$
with dimensionless $C_K$. Matching dimensions gives
$$
L^3T^{-2}=L^{2a-b}T^{-3a}.
$$
Thus
$$
-3a=-2,\qquad 2a-b=3.
$$
The unique solution is
$$
a=\frac23,\qquad b=-\frac53.
$$
Substitution yields (K.10.21). PCE enters by justifying the absence of additional inertial-range dimensional inputs: operationally irrelevant microscopic detail is compressed away, while the finite MPU cutoff supplies $k_d\le\Lambda_{\mathrm{MPU}}$ rather than a continuum limit. ∎

**Corollary K.10.16.1 (Finite-Resolution Status of the Turbulent Cascade).** PU does not require an exact continuum Navier-Stokes cascade extending to arbitrarily large $k$. The $-5/3$ exponent holds only on the finite operational band $k_0\ll k\ll k_d$, with deviations expected near forcing, dissipation, boundaries, anisotropic constraints, or $k_d\sim\Lambda_{\mathrm{MPU}}$.

*Proof.* Theorem K.10.16 assumes a finite inertial interval. If $k$ approaches $k_0$, forcing details become operationally relevant and assumption 2 fails. If $k$ approaches $k_d$, dissipation or MPU-scale discreteness becomes operationally relevant and assumption 3 fails. Therefore the exponent is a finite-band universality statement, not a claim about an exact all-scale continuum. ∎

### K.10.17 Finite Operational Theory-Space

**Definition K.10.17a (Operational Theory Pseudometric at Fixed Resolution).** Fix an energy bound $E$, resolution $\delta$, finite predictive capacity bound $C$, and protocol depth bound $L$. Let $\mathcal P(E,\delta,C,L)$ be the finite set of MPU-admissible experimental protocols constructible from the finite interface alphabet, with depth at most $L$, energy at most $E$, and readout resolution $\delta$. Define the operational pseudometric
$$
d_{E,\delta,C,L}(T_1,T_2)
=
\max_{P\in\mathcal P(E,\delta,C,L)}
d_{\mathrm{TV}}\bigl(\Pr_{T_1}(\cdot\mid P),\Pr_{T_2}(\cdot\mid P)\bigr).
\tag{K.10.22}
$$
A family of theories is $\delta$-distinguishable when its distinct members have pseudometric distance greater than $\delta$.

**Theorem K.10.17b (Finite Operational Theory-Space).** For fixed $(E,\delta,C,L)$ with $\delta>0$, every $\delta$-distinguishable family in
$$
\mathcal T(E,\delta,C,L)
$$
is finite. Equivalently, the induced prediction set has a finite $\delta$-cover in the operational pseudometric.

*Proof.* The protocol grammar is finite: the interface alphabet is finite at fixed MPU resolution, and the depth bound $L$ allows only finitely many finite words in that alphabet. Hence $\mathcal P(E,\delta,C,L)=\{P_1,\dots,P_N\}$ is finite. For each protocol $P_i$, finite capacity and finite readout resolution imply a finite outcome partition
$$
\Omega_i=\{\omega_{i1},\dots,\omega_{im_i}\}.
$$
A theory determines a point in the finite product of probability simplices
$$
\Delta
=
\prod_{i=1}^N\Delta(\Omega_i).
$$
Each simplex $\Delta(\Omega_i)$ is compact and finite-dimensional, so it admits a finite $\delta$-net in total variation distance. The finite product $\Delta$ therefore admits a finite $\delta$-net with cardinality bounded by the product of the finite covering numbers of the factors. If two theories map to the same net cell, then all protocol outcome distributions differ by at most the chosen operational tolerance after refining the net by a factor of two. Thus only finitely many equivalence classes can be distinguished by MPU-admissible protocols at fixed $(E,\delta,C,L)$. ∎

**Corollary K.10.17c (Operational Landscape Finiteness).** Infinite continuum parameter spaces in EFT, cosmology, or dark-sector modeling reduce at finite PU resolution to a finite atlas of distinguishable predictive cells.

*Proof.* Such parameter spaces define maps into the finite product simplex $\Delta$ of Theorem K.10.17b. The image of any set under a finite-cover has no more distinguishable cells than the finite cover of $\Delta$. ∎

### K.10.18 Predictive $c/a$-Theorem from Data Processing

**Definition K.10.18a (Predictive Distinguishability Function).** Let $k_1>k_2$ denote two operational resolution scales, with $k_1$ the finer scale. Let
$$
\mathcal E_{k_1\to k_2}
$$
be the completely positive trace-preserving coarse-graining channel from the retained state space at scale $k_1$ to the retained state space at scale $k_2$. For a branch family $\mathcal S_{k_1}$, define $\mathcal S_{k_2}:=\mathcal E_{k_1\to k_2}(\mathcal S_{k_1})$ and
$$
C_{\mathrm{pred}}(k)
=
\sup_{\rho,\sigma\in\mathcal S_k}
D(\rho\Vert\sigma),
\tag{K.10.23}
$$
where $D(\rho\Vert\sigma)=\operatorname{Tr}\rho(\log\rho-\log\sigma)$ is quantum relative entropy on the common support.

**Theorem K.10.18b (Predictive RG Monotonicity).** For every admissible coarse-graining channel,
$$
C_{\mathrm{pred}}(k_2)\le C_{\mathrm{pred}}(k_1).
\tag{K.10.24}
$$

*Proof.* For any $\rho,\sigma\in\mathcal S_{k_1}$, monotonicity of quantum relative entropy under completely positive trace-preserving maps gives
$$
D(\mathcal E_{k_1\to k_2}(\rho)\Vert
\mathcal E_{k_1\to k_2}(\sigma))
\le
D(\rho\Vert\sigma).
$$
Taking the supremum over $\rho,\sigma\in\mathcal S_{k_1}$ gives
$$
\sup_{\rho',\sigma'\in\mathcal S_{k_2}}
D(\rho'\Vert\sigma')
\le
\sup_{\rho,\sigma\in\mathcal S_{k_1}}
D(\rho\Vert\sigma),
$$
because every element of $\mathcal S_{k_2}$ is the coarse-grained image of an element of $\mathcal S_{k_1}$. This is (K.10.24). ∎

**Corollary K.10.18c (Central-Function Reading on Conformal Branches).** On any branch where $C_{\mathrm{pred}}(k)$ is normalized to equal the appropriate central datum at conformal fixed points, such as $c$, $F$, or $a$ depending on dimension and symmetry class, Theorem K.10.18b supplies the PU monotonicity theorem for that central function.

*Proof.* Theorem K.10.18b proves monotonicity along the RG channel. If the endpoint normalization identifies $C_{\mathrm{pred}}$ with the standard fixed-point central datum, then the same monotone function interpolates between those fixed-point values. ∎

**Corollary K.10.18d (RG Irreversibility as Predictive Irreversibility).** A coarse-graining step can preserve $C_{\mathrm{pred}}$ only when it is sufficient for the branch family: for every pair $\rho,\sigma\in\mathcal S_{k_1}$ attaining the supremum, equality in data processing must hold.

*Proof.* Equality in (K.10.24) requires equality in the data-processing inequality for the relevant maximizing pairs. The equality condition for relative entropy monotonicity is precisely recoverability by a Petz recovery channel on the involved states. Thus no predictive distinguishability is lost only when the coarse-grained description is sufficient for those distinctions. ∎

## K.11 Outlook and Future Directions

The Predictive Universe framework has successfully resolved several fundamental puzzles through rigorous derivations. This section summarizes established results, identifies active development areas, and outlines priority theoretical work and experimental validation strategies.

### K.11.1 Established Results

The following results have been derived with precise numerical predictions:

| Result | Value | Source |
|:-------|:------|:-------|
| Fine-structure constant | $\alpha^{-1}_{0}=137.03609205522863\ldots$; $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$ | Appendix Z, Theorems Z.24-Z.26; Definition Z.27.11a; Theorem Z.27.11j.1 |
| Electroweak scale | $v \approx 246$ GeV from $\kappa_{EW} = 38.5$ | Appendix T, Theorem T.5 |
| Weinberg angle | $\sin^2\theta_W^{(0)} = 3/8$ | Appendix T, Theorem T.14 |
| Higgs mass | $m_H \approx 125$ GeV from metastability | Appendix T, Theorem T.28 |
| Fermion mass ratios | Lepton $\mathcal{R} = 3$ to 3.8% accuracy | Appendices R, T |
| Gravitational constant | $G$ from channel-capacity area-law normalization (Theorem E.6) on the gravity-bridge package of Theorem K.10.12; $\delta/L_P \approx 2.355$ on the Appendix Q packing branch | Appendices E, Q |
| Cosmological constant | Appendix U reference evaluation $\Lambda L_P^2 = 8\pi A_{\text{eff}}e^{-283}\sim 10^{-122}$ under the stated counting and prefactor conventions | Appendix U |
| Primordial observables | $n_s = 0.9663$, $r = 0.0034$, $A_s = 2.08 \times 10^{-9}$, conditional on the Appendix U primordial identifications and assumptions | Appendix U |
| Spacetime dimension | $D = 4$ from mode-channel correspondence, independently reinforced in Appendices G and H | Appendices Z, G, H |
| Arrow of time | From irreducible SPAP entropy $\varepsilon_0=\ln2$ | Appendix O |
| Cosmic censorship | Operational throughput bounds exclude naked singularities | Section K.5, Theorem K.5.4 |
| Arrow of time | From irreducible SPAP entropy $\varepsilon_0=\ln2$ | Appendix O |
| Cosmic censorship | Operational throughput bounds exclude naked singularities | Section K.5, Theorem K.5.4 |
| UV finiteness | Intrinsic cutoff $\Lambda_{\text{MPU}} \approx 0.424\, m_P c$ | Section K.10, Theorem K.10.4 |

### K.11.2 Active Development Areas

The following areas have established conceptual frameworks with detailed calculations in progress:

1. **Black hole information:** Perspectival Information Channel and reflexive extraction costs defined (Section K.3); detailed calculations of information recovery rates and scrambling times in progress.

2. **Strong CP problem:** PCE mechanism proposed (Section K.6) with $\sigma$-invariance selecting $\theta = 0$; explicit derivation of the topological cost term $V_{\text{topo}}(\theta)$ from first principles required.

3. **Modified cosmology:** homogeneous FLRW constitutive law closed at the background level (Section K.9); derivation of $(A_c,n)$ from the relaxation potential and perturbation-level observational tests remain.

4. **Renormalization-PCE correspondence:** FRG flow identified with PCE-selected compression (Theorem K.10.7); rigorous derivation of the PCE functional $\mathcal{L}_{\text{PCE}}^{(k)}$ from MPU dynamics required.

5. **Nuclear finite-aggregate sector:** Appendix T fixes the elementary electroweak/flavor parameter sector on its stated branch, but isotope stability, magic-number gaps, and spin-dependent nuclear effects require a derived finite nuclear Hamiltonian $H_A^{\mathrm{PU}}$ on the many-nucleon aggregate space. The determinacy boundary is Theorem T.79a.

6. **Critical spectra in adaptive systems:** Appendix D derives $1/f$ spectra on the scale-neutral marginal PCE branch (Theorem D.8b). Domain-specific work remains in identifying the active relaxation cutoffs $\lambda_{\min},\lambda_{\max}$ and the exponent-shift profile $h(\lambda)\sim\lambda^s$ in concrete systems.

7. **Operational turbulence constants:** The inertial-range exponent $-5/3$ follows from finite-resolution PCE cascade closure (Theorem K.10.16). The dimensionless constant $C_K$, intermittency corrections, and boundary-specific deviations remain branch-level fluid-dynamical quantities.

### K.11.3 Priority Theoretical Work

1. **MPU Network Modeling:** Develop detailed models to quantitatively evaluate the global PCE Potential $V(x)$ for remaining coupling constants (strong/weak beyond unified attractor, neutrino masses). This is crucial for deriving constraints on emergent parameters and extending predictive power beyond the established results.

2. **Emergent Effective Actions:** Rigorously derive the structure of the emergent effective action for matter and gauge fields beyond the $U(1)$ case (Appendix G). Extend to full Standard Model and establish how PCE optimization shapes interactions, symmetries, and particle content at scales $\mu \ll \Lambda_{\text{MPU}}$.

3. **Information Dynamics at Horizons:** Develop detailed models of information flow, ND-RID channel capacity limits, and thermodynamic consistency across causal horizons. Essential for completing black hole information resolution (Section K.3) and connecting to the unified UV-gravity picture (Theorem K.10.12).

4. **Cosmological Model Refinement:** Derive $(A_c,n)$ from the Appendix D relaxation potential, extend the homogeneous constitutive closure to perturbations and lensing, and compare the resulting PU cosmology against the full observational suite (CMB, SNe, BAO, LSS, $H(z)$, local $\dot{G}/G$ bounds).

5. **Topological Cost Terms:** Rigorously derive from fundamental PU principles the effective cost terms for strong CP problem ($V_{\text{topo}}(\theta)$, Section K.6) and other topological effects. Establish connection to instanton calculus in PCE formulation. derive or justify (a) the stiffness hierarchy assumption $\Lambda_{\text{stiff}} \gg 1$ from the structure of the PCE potential in the space of Yukawa phases, and (b) the orientation-preserving real-Yukawa branch ($\det Y_u, \det Y_d > 0$) used in Theorem K.6.10 / Corollary K.6.5, including the admissibility of the adiabatic continuation path from $D_f$ to the physical Yukawa matrices.

6. **Computational Limits:** Further explore consequences of the curvature-resolution bound (Lemma K.5.3) and full implications of Prediction Relativity (Appendix N) for systems operating near fundamental predictive limits. The operational cosmic censorship theorem (Theorem K.5.4) establishes the basic dichotomy; remaining work includes detailed modeling of the horizon-formation versus manifold-breakdown transition.

7. **Renormalization from First Principles:** Derive the correspondence between RG fixed points and PCE equilibria (Theorem K.10.7, Part D) more rigorously by constructing the explicit map between Wilsonian effective actions and MPU network configurations at different resolution scales.

### K.11.4 Experimental Validation

The framework makes precise, falsifiable predictions across multiple domains:

**Fundamental Constants:**
- Accepted Thomson certificate interval for $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$ after the residual gate is fixed before comparison
- $\sin^2\theta_W$ and $m_H$ consistency checks with RG evolution to high precision

**Particle Physics:**
- Fermion mass hierarchy invariants: $\mathcal{R}_\ell = 3$ to 3.8% accuracy (test with improved $\tau/\mu$ mass ratio)
- Three-generation structure from topological constraints (Appendix R)

**Consciousness and Complexity:**
- Consciousness Complexity scaling (Section 13): Neural activity $\sim N^{0.8}$ vs. $N^{0.6}$ for random networks
- CC threshold behavior and causality bound $\alpha_{CC,max} < 0.5$

**Cosmology:**
- Modified $f\sigma_8(z)$ from $G_{\text{eff}}$ evolution
- Potential $H_0$ tension resolution
- Primordial observables: $n_s$, $r$, $A_s$ consistency

**Gravitational Physics:**
- Gravitational wave behavior at wavelengths approaching $\lambda \sim \delta$ (Corollary K.10.13)
- Absence of trans-Planckian signatures in any operational observable

The experimental program outlined in Section 13, particularly tests of the Consciousness Complexity (CC) hypothesis, provides crucial empirical anchors. Positive or null results will validate, falsify, or refine core framework aspects and guide future theoretical development.

### K.11.5 Broader Implications

The framework demonstrates that deep structure of physical law emerges from operational requirements, logical limitations, and thermodynamic costs of prediction itself. The unity revealed—connecting fundamental constants, particle masses, cosmological parameters, UV finiteness, emergent gravity, and consciousness scaling through the same information-theoretic principles—suggests a profound simplification underlying apparent complexity.

The central insight is that the finite information-processing capacity of the MPU network ($C_{\max} < \ln d_0$) simultaneously:
- Excludes UV divergences (Theorem K.10.4)
- Enforces holographic entropy bounds (Theorem 49)
- Implies Einstein's equations (Theorem Q.0.17)
- Bounds consciousness complexity (Theorem 39)
- Selects spacetime dimension (Theorem Z.11)

This convergence from a single information-theoretic constraint to the observed structure of physics constitutes the framework's strongest evidence for internal consistency and suggests that prediction—subject to irreducible logical and thermodynamic limits—is the organizing principle of physical reality.