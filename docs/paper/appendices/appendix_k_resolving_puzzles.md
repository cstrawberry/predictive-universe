# Appendix K: Resolving Outstanding Puzzles in Fundamental Physics

## K.1 Introduction

This appendix demonstrates how the Predictive Universe (PU) framework resolves several long-standing puzzles in fundamental physics and cosmology. Each section pairs an unsolved problem with specific PU mechanisms derived in the main text and appendices, showing how the framework provides quantitative resolutions or clear pathways toward them. The material ranges from rigorously established results with precise numerical predictions to exploratory directions requiring further theoretical development.

The framework's core insight—that physical law emerges from the operational requirements, logical limitations, and thermodynamic costs of prediction itself as instantiated by the MPU network—yields concrete, testable predictions for fundamental constants, selected hierarchy invariants and mixings, and cosmological parameters. Several rows achieve sub-percent agreement after their status-carrying inputs are specified. In the quark sector, mixed-scale comparisons initially show 11–15% deviations, while a common-scheme reduction enables controlled same-scale hierarchy invariants; incorporating the down-sector $A_2/D_4$ frustration correction derived in Section T.25.6a brings these invariants into sub-percent agreement at $\mu=M_Z$, with explicit T1/T2/T3 budgets for both the common-scale reduction (Section T.25.5.3) and the frustration correction (Section T.25.6a.11).

## K.2 Values of the Fundamental Constants

**Puzzle:** The Standard Model of particle physics and general relativity contain approximately 25 fundamental parameters (masses, coupling constants, mixing angles) whose specific numerical values are precisely measured experimentally but are not derived from first principles within standard frameworks. Why these particular values?

**PU Resolution:** The framework organizes specific values of fundamental constants into branch-separated derivation chains, all rooted in the dynamically determined equilibrium state of the MPU network governed by minimizing the global PCE Potential $V(x)$ (Appendix D, Definition D.1) and satisfying derived constraints. Appendix X makes the coupling sector precise through Constraint-Coupling Duality: when a constant is the coefficient of an active physical admissibility constraint, its canonical coefficient is the relevant KKT shadow price after the branch normalization map; when the branch uses a rate coordinate, the observed coupling is the normalized active boundary coordinate together with the associated shadow price. These equilibrium parameters are shaped by the underlying MPU properties ($C_{op}, K_0, \varepsilon$, ND-RID dynamics, interaction costs $\Phi$) and environmental factors. The constants below carry the branch labels of their source appendices: some are theorem-level on the minimal PCE branch, others are canonical-branch predictions, calibration/exchange-rate definitions, or validation-level quantities conditional on the branch closures specified in their source appendices. The branch table at the end of this section consolidates these distinctions. In the per-quantity discussions, terminology such as "rigorously derived" refers to the within-branch dependence of each chain rather than an unconditional, branch-independent claim.

**Invariant speed of light $c$:** Theorem 46 supplies a uniform operational causal-speed upper bound only on a branch with a separately registered positive edge-update time, a nonzero microscopic length scale, successive edge-by-edge serialization in the propagation-cost metric, and bounded edge weights. An attained invariant frontier requires an additional attainment record and the Corollary 46a/Appendix O Lorentzian package; the normalization $c=\ell_0/\tau_{\min}$ further requires the normalized uniform-weight one-link-saturation branch. Theorem 29 alone does not establish these additional hypotheses.

**Reduced Planck constant $\hbar$:** Acts as the fundamental quantum of action. Within PU, it is rigorously identified as the exchange rate between information-theoretic (nats) and mechanical (J·s) descriptions of physical processes through the Action-Entropy Identity (Appendix Q, Theorem Q.0.1):
$$\boxed{\frac{\mathcal{S}}{\hbar} = \sum_{\text{cycles}} \varepsilon_i}$$
The constant $\hbar$ scales the unitary generator and acts as the registered action-unit conversion on the Appendix Q branch. Theorem 29 identifies $\hat H_v$ and a task-dependent characteristic timescale; it does not supply a universal positive cycle duration. Any identification with reset entropy, a minimum action, or a physical cycle clock requires the separate Appendix Q and reset-implementation hypotheses.

**Boltzmann constant $k_B$:** Functions as the conversion factor between dimensionless information/entropy measures (nats) and thermodynamic entropy (energy/temperature). Its value is inherent in the fundamental thermodynamic interpretation of the MPU dynamics (Section 12) and the link between information costs ($\varepsilon$) and energy dissipation ($k_B T \varepsilon$). Together with $\hbar$ and $c$, these constants form a complete set of exchange rates connecting the operational domains of the framework (Section P.6.5.5).

**Gravitational constant $G$:** Rigorously derived from the thermodynamic properties of the MPU network at causal boundaries (Section 12). As established in Appendix E (Theorem E.6), 
$$G = \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{\max}(f_{RID})}$$
**(Equation E.9)**. Here, $\delta$ is the effective MPU spacing, $\eta$ is a geometric packing factor, $\chi$ is a correlation factor, and $C_{\max}$ is the ND-RID channel capacity. Theorem E.2 gives $C_{\max}<\ln d_0$ on the refresh/minorization branch, while Proposition E.2a gives $C_{\max}\le\ln d_0-\ln2$ on the completed binary reset-support branch. These parameters determine the effective surface density of channels $\sigma_{\mathrm{eff\,link}} = \chi / (\eta \delta^2)$ (Theorem E.3). The fundamental relationship **(Equation E.7)** is:
$$\frac{\chi C_{\max}(f_{RID})}{\eta \delta^2} = \frac{c^3}{4 \hbar G}$$
This relationship is further constrained by the PCE-driven optimization of these parameters in the vacuum state. Appendix Q provides the complete calculation (with zero continuously adjustable parameters) of the ratio $\delta/L_P \approx 2.355$ through minimization of the global PCE potential, linking the microscopic MPU scale to the emergent Planck scale. The derivation proceeds by constructing $V_{vac}(\delta, \chi, \eta, C_{\max})$ and finding the unique stable equilibrium satisfying all framework constraints (Appendix Q, Equations Q.1-Q.18).

**Electromagnetic coupling $\alpha$:** Appendix Z gives the Thomson-limit sinc-core value and the diagnostic-only hypercharge-recoil (operator realization open) certificate row on the candidate finite Ward branch. The complete core derivation establishes:
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
where $u^* = 2^{1/8} - 1$, $K_0 = 3$, and $R_\alpha$ is determined only by the residual gate. The derivation proceeds through a seven-stage chain: MPU invariants ($d_0 = 8$, $\varepsilon_0=\ln2$) → active kernel dimension $a = 2$ via the Physical Instantiation Principle (Theorem Z.1) → interface mode count $M = 2ab = 24$ (Theorem Z.5) → PCE-Attractor orbit $\mathrm{Gr}(2,8)$ → operational distinguishability → mode-channel correspondence → Ward identity → electromagnetic coupling formula (Appendix Z, Sections Z.1-Z.21). On the democratic visible-response branch $L_{\mathrm{vis}}=1/(ad_0)$, the second-order correction uses the Grassmannian curvature sector (Theorem Z.24; Lemma Z.24a) and minimal holonomy (Lemma Z.14); the exact transport factor is $\operatorname{sinc}(u^*)$ from the $SU(2)$ geodesic-chord relation in each interface subblock. The derivation simultaneously establishes the emergent spacetime dimension $D = 4$ from the mode-channel correspondence (Theorems Z.10-Z.11), while Appendix G supplies an independent stability-based reinforcement.

**Strong coupling $g_s$ and weak coupling $g_w$:** These relate to stiffness or inverse-stiffness coefficients in the effective gauge actions (Appendix G, Equation G.5.2). Under the KKT regularity and normalization map of Theorem X.8c, $1/g_i^2$ is the normalized shadow price of the corresponding active gauge-coherence constraint; the interaction-strength convention uses the reciprocal normalized price after matching factors are supplied. The algebra $\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)$ is selected in the determinant-compatible finite-response block-frame capacity class (Appendix G, Theorem G.8.4b and Corollary G.8.4c). On the specified Bures-to-gauge calibration branch of Theorems T.39a and T.39a.2,
$$
g_U^2=\frac{2\pi}{M\chi_U},
\qquad
\alpha_U^{-1}=2M\chi_U.
$$
The values $g_U^2=\pi/6$ and $\alpha_U^{-1}=24$ require the additional specialization $M=24$ and $\chi_U=1/2$.

A continuous-time quantum-error-correction model could compare gauge-coherence maintenance costs only after specifying the noise generator, code family, recovery dynamics, target logical error, physical resource metric, predictive-benefit function, and matching scale. The adjoint Casimirs
$$
C_2(\operatorname{Adj}_{U(1)})=0,
\qquad
C_2(\operatorname{Adj}_{SU(2)})=2,
\qquad
C_2(\operatorname{Adj}_{SU(3)})=3
$$
are possible group-theoretic inputs to such a model, but they do not determine a polynomial cost law or the minimizing couplings. Any proposed ultraviolet ordering of $g_1,g_2,g_3$ is therefore model-conditional, and its low-energy ordering must be obtained by integrating the registered beta functions with specified boundary, threshold, and normalization data.

**Electroweak Scale, Weinberg Angle, and Higgs Status:** Appendix T organizes these rows in one ledger, but their dependency records and statuses differ. The electroweak complexity $\kappa_{EW}=bk/2+\dim(G/H)-m/2=38.5$ is branch-level, while
$$v=A_{EW}e^{-\kappa_{EW}}M_{Pl}\approx252\ \text{GeV}$$
is model-conditional on the determinant prescription for $A_{EW}$ **(Theorem T.5; Theorem T.29.2; Corollary T.29.1)**. The PU-normalized tree-level Weinberg angle is $\sin^2\theta_W^{(0)}=3/8$ from PCE isotropy **(Theorem T.14)**. The value near $125$ GeV is instead an external-RG validation value: a forward Higgs-pole claim requires a completed threshold record plus $\mathfrak H_T=(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}})$ fixed before comparison **(Definition T.25.2; Theorems T.26, T.28, and T.79.2)**. The current manuscript has no accepted $\mathfrak M_\lambda$.
- Signal-parity decomposition of M = 24 modes into k = 12 signal and k = 12 parity subspaces via the Extended Binary Golay Code (Proposition T.1c)
- Electroweak coset $\mathcal{M}_{EW} = (SU(2)_L \times U(1)_Y)/U(1)_{em} \cong S^3$ with dimension 3 (Definition T.6a)
- Discrete action $S_{EW} = N_0 + \dim(G/H) - m/2 = 38.5$ from alignment constraints and zero-mode subtraction (Theorem T.4)
- PCE isotropy at the attractor requiring equal gauge kinetic stiffness across all directions (Theorems T.13-T.16)
- Conditional metastability validation via renormalization-group evolution from $\mu_G=M_R=M_{Pl}e^{-9}$; a forward pole claim additionally requires a completed threshold record plus accepted $\mathfrak H_T$ (Sections T.16-T.21)

The shared Golay bookkeeping places these rows alongside Appendix U, but it does not turn the branch-level $\kappa_{EW}$, model-conditional $v$, tree-level Weinberg angle, and validation-level Higgs comparison into one unified quantitative derivation.

**Fermion Masses and Yukawa Couplings: Conditional Certificate Ledger.** The three-generation count has its own anomaly/CP and pre-flavor PPI hypotheses. It does not select physical flavor roots or determine masses and mixings.

1. $E_8$ supplies admissible discrete distances, but a physical generation-to-root assignment is separate model data.
2. Converting a selected distance record into a Yukawa or mass ratio requires a registered response function, continuous coefficients, effective dimensions, common-scale scheme, normalization, and nonzero remainder interval.
3. CKM, PMNS, and CP quantities additionally require forward-locked overlap or holonomy maps, phase conventions, threshold transport, covariance, and held-out validation data.

Equation R.17 is therefore only a leading algebraic diagnostic under a common-coefficient ansatz. The numerical flavor comparisons in Appendices R and T are retrospective or calibrated model evaluations unless every upstream entry is locked before comparison; proximity to observed values is not an independent derivation.



1. **Topological:** The second homotopy group $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$ provides seven independent topological charges (Theorem R.1.1). Combined with gauge-topology correspondence (Theorem R.3.1), the family-charge anomaly constraints, and the CP-violation requirement, this yields the minimal admissible three-generation pattern with family charges $\{a,-a,0\}$ (Theorem R.3.4), with exact realization on the pre-flavor family-redundancy PPI branch (Proposition R.3.5.1a).

2. **Triality/geometric compatibility:** Proposition R.4.2 records the $D_4$ triality orbit $\{V,S^+,S^-\}$ as a representation-theoretic compatibility check, while the $E_8$ root system emerges as the information-optimal coordinatization of the 8-dimensional real subspace (Section R.2.1). Squared $E_8$ root distances $d^2 \in \{0, 2, 4, 6, 8\}$ determine mass ratios via Gaussian suppression on the PCE-Attractor orbit Gr(2,8) with hierarchy coefficient $\alpha = 3/2$ (Corollary T.41.3), and furnish a three-fold compatibility structure consistent with $N=3$.

The Mass Hierarchy Invariant:
$$\mathcal{R} := \frac{\ln(m_3/m_1)}{\ln(m_3/m_2)} = \frac{d^2_{31}}{d^2_{32}} \in \left\{\frac{4}{3}, \frac{3}{2}, 2, 3, 4\right\}$$
**(Equation R.17)** provides a discrete prediction with zero continuously adjustable parameters. In the charged lepton sector, the observed value $\mathcal{R}_\ell \approx 2.889$ matches the discrete prediction $\mathcal{R} = 3$ to within 3.8%, providing strong phenomenological support. Absolute mass scales are set by the emergent VEV through sector prefactors $c_f$ determined by Bures/gauge normalization (Appendix T, Section T.21).

Appendix T (Section T.25) establishes status-labeled hierarchy comparisons with no additional continuous fitting after the stated geometric assignments, threshold data, common-scale reductions, and sector normalizations are fixed:
- $m_\tau^{(0)} \approx 0.94$ GeV at leading order; factor $\approx 1.9$ normalization gap open pending two-loop threshold and Van Vleck–Morette corrections (Remark T.45.1; Lemma T.45.1a). Anchored to $m_\tau^{\rm obs} = 1776.86$ MeV (Particle Data Group (2024)), the $E_8$ log-ratio predictions give $m_\mu = 105.78$ MeV (observed: 105.66 MeV, deviation: $+0.12\%$) and $m_e = 0.5121$ MeV (observed: 0.5110 MeV, deviation: $+0.22\%$)
- $\ln(m_\tau/m_\mu) = 2.8212$ (observed: 2.8224, deviation: $\approx 0.04\%$)
- Cabibbo angle $|V_{us}|=0.2261$ from frustration-induced tunneling between quark-sector vacua (PDG-2024 global-fit comparison: $0.22501\pm0.00068$; deviation: $+0.5\%$)
- Lepton-quark bridge $c_\ell/c_d = 8/3$ from gauge normalization constraints (Theorem T.44)

The τ/μ mass ratio achieves $\approx\mathbf{0.04\%}$ **precision** in the log ratio ($|\Delta\ln|=0.0012$), with zero adjustable parameters, representing the single most precise test of the geometric hierarchy mechanism.

**Branch-Separated Summary of Derived Constants:**

| Quantity | Derivation chain | Branch class |
|---|---|---|
| $K_0, d_0, M, D$ | Minimal PCE chain (Theorems 15, 23, Z.5, Z.10–Z.11) | Theorem-level on minimal branch |
| $c$ | Uniform speed upper bound from Theorem 46; equality requires registered clock, attainment, scale normalization, and Lorentzian branch | Conditional branch result |
| $\hbar$ | Action-entropy exchange rate (Theorem Q.0.1) | Exchange-rate definition; existence is theorem-level on Q.0.2 branch |
| $k_B$ | Thermodynamic conversion factor (Section 12) | Exchange-rate definition |
| $\alpha^{-1} = 137.036$ | Appendix Z seven-stage chain | Canonical Z branch prediction (with the branch qualifiers) |
| $G$, $\delta/L_P \approx 2.355$ | Channel-capacity area-law normalization (Theorem E.6) and Appendix Q packing | Area-law calibration plus Appendix Q branch |
| $v \approx 246$ GeV | Golay-Steiner electroweak complexity (Theorem T.5 / Corollary T.29.1) | Appendix T determinant-model branch |
| $\sin^2\theta_W^{(0)} = 3/8$ | PCE isotropy at attractor (Theorem T.14) | Theorem-level on the unbroken-tree branch; running to $M_Z$ remains validation-level |
| $m_H \approx 125$ GeV | External SM metastability trajectory compared only after a completed threshold record plus accepted $\mathfrak H_T$ (Definition T.25.2; Theorems T.28 and T.79.2) | Validation-level; no accepted current $\mathfrak M_\lambda$ or complete forward record |
| $\Lambda$ | Appendix U Golay-Steiner reference exponent | Five-mode reference branch / four-mode corrected branch (Theorems U.8c, U.13b) |
| $g_s, g_w, \alpha_s(M_Z), \sin^2\theta_W(M_Z)$ | Lifted spectral threshold tuple (Theorems T.16, T.18, T.78.2, T.78.5) | Validation-level in the canonical minimal ledger; positive theorem-level status requires an appended forward block-sum spectral package |
| $N_g = 3$ | Anomaly+CP minimal admissible $N_{\min}=3$; exact $N_g=3$ on the pre-flavor family-redundancy PPI branch; $D_4$ triality and Leech/$E_8$ are compatibility checks (Theorem R.3.4; Proposition R.3.5.1a; Proposition R.4.2) | Theorem-level minimal admissible / branch-level exact realization |
| Fermion mass ratios | Conditional $E_8$ overlap models (Appendices R and T) | Candidate diagnostics; root labels, coefficients, scale maps, and remainders require independent forward certificates |



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

**Proposition K.1 (Semiclassical Late-Stage Fractional-Emission Scaling).** In the Schwarzschild semiclassical regime $M\gg M_P$, a Hawking quantum of characteristic energy $\Delta E\sim k_BT_H$ produces a fractional mass update of order $(M_P/M)^2$. Hence that fractional update grows as $M$ decreases for as long as the semiclassical approximation remains valid. No claim is made by extrapolating this approximation through the Planck regime to $M=0$.

*Proof.* The Hawking temperature is
$$
T_H=\frac{\hbar c^3}{8\pi Gk_BM}.
$$
A characteristic emitted quantum therefore has
$$
\Delta E\sim k_BT_H
=\frac{\hbar c^3}{8\pi GM},
\qquad
|\Delta M|\sim\frac{\Delta E}{c^2}
=\frac{\hbar c}{8\pi GM}.
$$
Consequently
$$
\frac{|\Delta M|}{M}
\sim
\frac{\hbar c}{8\pi GM^2}
=\frac1{8\pi}\left(\frac{M_P}{M}\right)^2,
$$
where $M_P^2=\hbar c/G$. This quantity increases monotonically as $M$ decreases within $M\gg M_P$. The derivation supplies no control when $M=O(M_P)$, so it does not imply a physical divergence at $M=0$. ∎

**Proposition K.2 (Conditional Timing Obstruction for Local Sequential Retrieval).** Let $\mathcal P_{\mathrm{seq}}$ be a declared class of local sequential Hawking-radiation retrieval protocols. Assume that a separate PIC capacity-and-cost calculation proves
$$
t_{\mathrm{extract}}(P)>t_{\mathrm{evap}}
\qquad
\text{for every }P\in\mathcal P_{\mathrm{seq}}.
$$
Then no protocol in $\mathcal P_{\mathrm{seq}}$ recovers the complete initial-state information before evaporation.

*Proof.* If some $P\in\mathcal P_{\mathrm{seq}}$ completed recovery before evaporation, then $t_{\mathrm{extract}}(P)\le t_{\mathrm{evap}}$, contradicting the hypothesis. ∎

The fractional-update growth of Proposition K.1 may enter a future derivation of the timing hypothesis, but it does not supply that derivation by itself.

### K.3.2 Thermodynamic Cost and the Perspectival Information Channel

Suppose each of $N$ horizon measurements closes one registered cyclic reset satisfying Definition 28 and suppose its conditional entropy obeys $H_{q_j}(P_j\mid R_j)\ge h_{\min}>0$. Theorem 31 and Theorem J.4a then give
$$
\Delta S_{\mathrm{bath}}/k_B
=\sum_{j=1}^N\varepsilon_{\mathrm{reset}}(j)
\ge Nh_{\min}.
$$
On the conditionally uniform binary branch, $h_{\min}=\ln2$; equality additionally requires zero dissipative overhead in every reset. No such per-measurement heat follows for an unregistered or reversibly retained measurement record.

The **Perspectival Information Channel (PIC)** is the communication channel from the black hole interior to an external observer, mediated by Hawking radiation. This channel has capacity $C_{PIC}$ limited by:
1. **Channel Limits:** The finite-dimensional bound $C_{\max}\le\ln d_0$, sharpened to $C_{\max}<\ln d_0$ by Theorem E.2 on the refresh/minorization branch and to $C_{\max}\le\ln d_0-\ln2$ by Proposition E.2a on the completed binary reset-support branch
2. **Registered Reset Cost:** The distribution-sensitive reset ledger of Theorem 31 and Appendix J for each reset actually performed
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
   *Theorem-level branch:* Theorem K.3.3a supplies retained horizon correlations. If the horizon also lies on the geometric, density-certificate, saturation, additive-ledger, and calibration branch of Theorem E.6, the available boundary scale may be written as $S_{BH}=\mathcal A/(4G_{\mathrm{op}})$ in natural units. Neither theorem alone proves that spectral deviations are suppressed by a specified function of $S_{BH}$; that quantitative law belongs to the emission-channel promotion certificate below.
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

**Corollary K.3.1 (Second-Moment Page-Purity Closure with a Declared Dual Norm).** Let $\Delta_t^{(2)}$ be the difference between the PU and Haar second-moment functionals. Assume the horizon certificate uses a norm $\|\cdot\|_{(2)}$ and its dual such that
$$
\|\Delta_t^{(2)}\|_{(2)}\le\varepsilon_t^{\mathrm{mom}},
\qquad
\|W_E\|_{(2),*}\le c_E,
$$
where $W_E$ is the swap on the two early-radiation copies. Then
$$
\left|
\mathbb E\,\operatorname{tr}\big((\rho_E^{\mathrm{PU}}(t))^2\big)
-
\frac{d_E(t)+d_L(t)}{d_E(t)d_L(t)+1}
\right|
\le
c_E\varepsilon_t^{\mathrm{mom}}.
\tag{K.3.3}
$$
In a certificate normalized by $c_E=1$, set $\varepsilon_t^{(2)}:=\varepsilon_t^{\mathrm{mom}}$.

*Proof.* The swap identity gives
$$
\operatorname{tr}(\rho_E^2)=\operatorname{tr}(W_E\rho_E^{\otimes2}).
$$
Consequently the difference of the two expected purities is $\Delta_t^{(2)}(W_E)$. Duality yields
$$
|\Delta_t^{(2)}(W_E)|
\le\|\Delta_t^{(2)}\|_{(2)}\|W_E\|_{(2),*}
\le c_E\varepsilon_t^{\mathrm{mom}}.
$$
The Haar swap calculation gives
$$
\mathbb E_{\mathrm{Haar}}\operatorname{tr}(\rho_E^2)
=\frac{d_E+d_L}{d_Ed_L+1},
$$
which proves (K.3.3). ∎

**Corollary K.3.1a (Second-Moment/Entropy Separation Witness).** Equality of the Haar Page-purity average does not imply equality of the Haar Page-entropy average. In the $2\times2$ bipartition, there is a finite ensemble of pure states whose reduced-state average purity is exactly Haar but whose average von Neumann entropy is not Haar.

*Proof.* Consider the finite ensemble consisting of the $60$ two-qubit stabilizer pure states with the uniform measure. Under the $2\times2$ bipartition, exactly $36$ of these states are product stabilizer states and exactly $24$ are Bell-type maximally entangled stabilizer states. Hence their reduced early-system purities are
$$
\operatorname{tr}(\rho_E^2)=1
\quad\text{for the }36\text{ product states},
$$
and
$$
\operatorname{tr}(\rho_E^2)=\frac12
\quad\text{for the }24\text{ Bell states}.
$$
Therefore
$$
\mathbb E_{\mathrm{stab}}\operatorname{tr}(\rho_E^2)
=
\frac{36}{60}\cdot1+
\frac{24}{60}\cdot\frac12
=
\frac45.
$$
The Haar Page-purity value for $d_E=d_L=2$ is
$$
\frac{d_E+d_L}{d_Ed_L+1}
=
\frac{2+2}{4+1}
=
\frac45.
$$
Thus the purity averages agree exactly.

For entropy, the same ensemble gives
$$
\mathbb E_{\mathrm{stab}}S(\rho_E)
=
\frac{36}{60}\cdot0+
\frac{24}{60}\cdot\ln2
=
\frac25\ln2.
$$
Page's exact Haar entropy for $d_E=d_L=2$ is
$$
S_{\mathrm{Page}}(2,2)
=
\sum_{j=3}^{4}\frac1j-\frac{1}{4}
=
\frac13.
$$
Since
$$
\frac25\ln2\ne\frac13,
$$
the entropy averages differ although the purity averages coincide. Consequently a second-moment or Page-purity certificate cannot by itself imply the von Neumann Page-entropy estimate of Theorem K.3. The trace-coupled promotion certificate of Definition K.3d.4c is therefore a logically independent input. The witness is exhibited at $d_E=d_L=2$; this is the worked instance establishing logical separation, not a quantitative claim about the magnitude of the purity-entropy gap at higher dimensions, which is governed by the trace-coupled promotion data of Definition K.3d.4c. The witness is consistent with the standard fact that the uniform pure two-qubit stabilizer ensemble is an exact projective $2$-design in the moment sense — its degree-$(2,2)$ polynomial averages match Haar. That moment identity is not a trace-norm coupling of the reduced-state distribution to Haar, and it does not control the non-polynomial entropy functional. The witness exploits exactly this gap between second-moment matching and trace-continuity control. ∎

**Corollary K.3a (Conditional Black-Hole Anomaly-Inflow Criterion).** Suppose a horizon branch assigns the exterior, horizon, and interface sectors anomaly classes in one abelian anomaly group and supplies a gluing theorem under which the anomaly of the glued generating functional is their sum. Then exterior descent to the gauge/frame quotient requires
$$
[\mathcal A_{\mathrm{outside}}]
+
[\mathcal A_{\mathrm{horizon}}]
+
[\mathcal A_{\mathrm{interface}}]
=0.
$$
Any specified horizon/interface completion satisfying this equation is anomaly-compatible. Cancellation alone does not prove that such a completion is unique or minimal. If the same branch satisfies the Appendix E area-law channel bound on the horizon cross-section, then
$$
\dim\mathcal H_{\mathrm{edge}}
\le
\exp\left(\frac{\mathcal A}{4L_P^2}\right).
$$

*Proof.* By the assumed gluing theorem, a gauge/frame transformation multiplies the three sector functionals by phases whose anomaly classes add in the common anomaly group. The glued functional descends only if the total phase is trivial, which is precisely the displayed cancellation equation. The dimension inequality is the Appendix E capacity bound applied under the separately assumed area-law calibration. Neither inference compares two anomaly-compatible completions, so neither yields uniqueness or minimality. ∎

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

**Theorem K.3c (Finite Predictive-Island Cost Minimization).** On a finite black-hole evaporation branch whose candidate reconstruction regions form the finite family $\mathcal I_R$, define
$$
S_{\mathrm{rec}}(R)
:=
\min_{I\in\mathcal I_R}
S_{\mathrm{gen}}^{\mathrm{PU}}(R;I).
\tag{K.3c.1}
$$
At least one minimizing candidate exists. The term $C_{\partial I}$ is a boundary channel-capacity cost, not a fundamental geometric area operator. On a regular thermodynamic continuum branch satisfying the Appendix E channel-density hypotheses, that term has the corresponding horizon-area representation. Identifying a minimizer with a minimal Markov blanket requires an additional certificate that relates candidate deletion to both conditional predictions and the boundary cost.

*Proof.* For each candidate $I$, Definition K.3b assigns the cost
$$
S_{\mathrm{gen}}^{\mathrm{PU}}(R;I)
=C_{\partial I}
+S_{\mathrm{pred}}(R\cup I)-S_{\mathrm{pred}}(I).
$$
Because $\mathcal I_R$ is finite, the finite set of real candidate costs has a minimum, proving (K.3c.1) and existence of a minimizer. The Appendix E area reading follows only on its channel-density branch. No conclusion about Markov-blanket minimality follows without a rule showing that deletion preserves admissibility, controls $C_{\partial I}$, and strictly lowers total cost whenever a component is response-null. ∎

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

**Definition K.3d.1a (Horizon Graph-Functional Page Certificate).** For a radiation record $R_t$, set $\mathcal I_t:=\mathcal I_{R_t}$ from Theorem K.3c and
$$
F_t(I)=C_{\partial I}+S_{\mathrm{pred}}(R_t\cup I)-S_{\mathrm{pred}}(I).
$$
An accepted record fixes $C_G(t,I)$ and $\epsilon_{\mathrm{MC}}\ge0$ with
$$
\sup_{I\in\mathcal I_t}|F_t(I)-C_G(t,I)|\le\epsilon_{\mathrm{MC}},
\tag{K.3d.1a.1}
$$
together with graph, capacity, candidate-to-cut, and trace-continuity data.

**Theorem K.3d.1b (Uniform Minimum Stability).** The record gives
$$
\left|S_{\mathrm{rec}}(R_t)-\min_{I\in\mathcal I_t}C_G(t,I)\right|
\le\epsilon_{\mathrm{MC}}.
\tag{K.3d.1b.1}
$$
A two-candidate form additionally requires
$$
C_G(t,I)\ge\min\{C_G(t,\varnothing),C_G(t,I_{\mathcal H})\}
\quad(I\notin\{\varnothing,I_{\mathcal H}\}).
\tag{K.3d.1b.2}
$$

*Proof.* Use Theorem K.3c and $|\min F-\min C_G|\le\sup|F-C_G|$. Condition (K.3d.1b.2) is exactly the exhaustive two-candidate gate. ∎

**Definition K.3d.4 (Horizon Moment-Operator and Frame-Potential $k$-Design Certificate).** A horizon $k$-design certificate is a finite record
$$
\mathfrak C_{\mathrm{Hdesign}}
=
\left(
\mathcal H_{\mathrm{edge}},
\nu_H,
t_{\mathrm{des}},
\Pi_t^{\mathrm{Haar}},
\mathcal M_t,
\mathcal F_t,
\gamma_t,
N_t,
\varepsilon_t^{\mathrm{mom}},
\varepsilon_t^{\mathrm{frame}},
\varepsilon_{\mathrm{emit}},
\mathfrak T_{\mathrm{tr}},
\varepsilon_{\mathrm{Page}},
\chi_{\mathrm{Hdesign}}
\right)
\tag{K.3d.4}
$$
where:

1. $\mathcal H_{\mathrm{edge}}$ is the finite horizon edge-code Hilbert space on the branch.

2. $\nu_H$ is a finitely supported probability measure on horizon update unitaries generated by the retained MPU edge dynamics.

3. $t_{\mathrm{des}}\ge2$ is the design order required for the Page or scrambling estimate being claimed.

4. $\Pi_t^{\mathrm{Haar}}$ is the Haar moment projection on $\mathcal B(\mathcal H_{\mathrm{edge}}^{\otimes t_{\mathrm{des}}})$.

5. The one-step moment operator is
$$
\mathcal M_t(\nu_H)(X)
=
\mathbb E_{U\sim\nu_H}
\left[
U^{\otimes t_{\mathrm{des}}}X(U^\dagger)^{\otimes t_{\mathrm{des}}}
\right].
\tag{K.3d.4.1}
$$
It satisfies the certified gap inequality
$$
\left\|
\left(\mathcal M_t(\nu_H)-\Pi_t^{\mathrm{Haar}}\right)
\left(I-\Pi_t^{\mathrm{Haar}}\right)
\right\|_{\mathrm{op}}
\le
1-\gamma_t,
\qquad
0<\gamma_t\le1.
\tag{K.3d.4.2}
$$

6. $N_t$ is the certified number of horizon update steps and
$$
\varepsilon_t^{\mathrm{mom}}
\ge
\left\|\mathcal M_t(\nu_H^{*N_t})-\Pi_t^{\mathrm{Haar}}\right\|_{\mathrm{op}}
+
\varepsilon_{\mathrm{emit}}
\tag{K.3d.4.3}
$$
is the moment-operator error entering the radiation channel.

7. $\mathcal F_t$ is the normalized $t_{\mathrm{des}}$-frame potential of $\nu_H^{*N_t}$ and
$$
0
\le
\mathcal F_t(\nu_H^{*N_t})-\mathcal F_t(\mathrm{Haar})
\le
\varepsilon_t^{\mathrm{frame}}
\tag{K.3d.4.4}
$$
is the certified frame-potential error.

8. $\mathfrak T_{\mathrm{tr}}$ is the trace-continuity conversion record. It is either absent, in which case the certificate supplies moment/Page-purity control only, or it is a finite map proving
$$
\frac12\left\|\rho_E^{\mathrm{PU}}(t)-\rho_E^{\mathrm{Page}}(t)\right\|_1
\le
\mathfrak T_{\mathrm{tr}}
\left(\varepsilon_t^{\mathrm{mom}},\varepsilon_t^{\mathrm{frame}},d_E,d_L,t_{\mathrm{des}}\right)
=:\varepsilon_{\mathrm{Page}}.
\tag{K.3d.4.5}
$$

9. $\chi_{\mathrm{Hdesign}}$ records that the update support, moment gap, frame potential, step count, emission error, trace-continuity conversion, and Page error were fixed before comparison with any Page-curve reconstruction.

A base moment-design certificate is accepted for Page-purity estimates when items 1--7 and 9 hold. A von Neumann Page-curve estimate additionally requires the trace-continuity slot in item 8.
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

**Theorem K.3d.4b (Golay-Expander Certificate Supplies the Horizon Design Gate).** An accepted $\mathfrak C_{\mathrm{HGol}}$ canonically supplies the moment-operator part of a horizon $k$-design certificate $\mathfrak C_{\mathrm{Hdesign}}$ of Definition K.3d.4 with
$$
\gamma_t=\gamma_t^{G},
\qquad
\varepsilon_t^{\mathrm{mom}}
=
(1-\gamma_t^{G})^{N_t}+\varepsilon_{\mathrm{emit}}.
\tag{K.3d.4b.1}
$$
Consequently
$$
\left\|
\mathcal M_t^{G}(\nu_H^{*N_t})-
\Pi_t^{\mathrm{Haar}}
\right\|_{\mathrm{op}}
\le
(1-\gamma_t^{G})^{N_t}.
\tag{K.3d.4b.2}
$$
If the accepted Golay-expander record also supplies the frame-potential evaluation, then
$$
0\le
\mathcal F_t(\nu_H^{*N_t})-
\mathcal F_t(\mathrm{Haar})
\le
\varepsilon_t^{\mathrm{frame}}.
\tag{K.3d.4b.3}
$$
If, in addition, it supplies the trace-continuity conversion $\mathfrak T_{\mathrm{tr}}$, then the von Neumann Page error is the certified value
$$
\varepsilon_{\mathrm{Page}}
=
\mathfrak T_{\mathrm{tr}}
\left((1-\gamma_t^{G})^{N_t}+\varepsilon_{\mathrm{emit}},\varepsilon_t^{\mathrm{frame}},d_E,d_L,t_{\mathrm{des}}\right).
\tag{K.3d.4b.4}
$$
If the capacity-scaled gap (K.3d.4a.4) is part of the accepted record, then for every $0<\varepsilon<1$, every integer $N_t$ satisfying
$$
N_t
\ge
\frac{S_Hp_t}{c_t}
\log\frac{1}{\varepsilon}
\tag{K.3d.4b.5}
$$
obeys
$$
(1-\gamma_t^{G})^{N_t}
\le
e^{-N_t\gamma_t^{G}}
\le
\varepsilon.
\tag{K.3d.4b.6}
$$

*Proof.* Definition K.3d.4a supplies a finite edge Hilbert space, update measure, design order, Haar moment projection, one-step moment gap, step count, emission error, and forward lock. Forgetting the Golay-origin labels gives the moment part of Definition K.3d.4 with $\gamma_t=\gamma_t^G$. Repeated application of the moment gap gives (K.3d.4b.2), and adding the emission mismatch gives the first equality in (K.3d.4b.1). Frame-potential and trace-continuity statements require the additional records displayed in Definition K.3d.4; when supplied, they give (K.3d.4b.3) and (K.3d.4b.4) by their definitions. The capacity-scaled gap estimate is the same exponential contraction calculation as before. ∎

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

**Definition K.3d.4d (Relative-Entropy Contraction Trace-Coupling Certificate).** A relative-entropy contraction trace-coupling certificate is a finite record
$$
\mathfrak C_{\mathrm{REC-TV}}
=
(\mathfrak C_{\mathrm{base}},\Gamma_t,D_0,\gamma_{\mathrm{REC}},N_t,\chi_{\mathrm{REC}})
\tag{K.3d.4d.1}
$$
where $\mathfrak C_{\mathrm{base}}$ is an accepted certificate of Definition K.3d.4 or K.3d.4a, $\Gamma_t$ is a certified coupling of the PU reduced early-radiation state $\rho_E^{\mathrm{PU}}(t)$ and the Haar reduced state $\rho_E^{\mathrm{Haar}}(t)$ on the same early-radiation Hilbert space, $D_0<\infty$ is an initial relative-entropy ceiling, $\gamma_{\mathrm{REC}}>0$ is a certified entropy-contraction rate per retained cycle, and $N_t$ is the retained-cycle counter. The record is accepted only if the relative entropy is finite on the certified support and it certifies, before Page-curve comparison, that every paired state in the support of $\Gamma_t$ obeys
$$
D(\rho_E^{\mathrm{PU}}(t)\|\rho_E^{\mathrm{Haar}}(t))
\le
D_0e^{-2\gamma_{\mathrm{REC}}N_t}
\tag{K.3d.4d.2}
$$
under the natural-log convention. The named Landauer-tight substatus records the special subcase $\gamma_{\mathrm{REC}}=\varepsilon_0=\ln2$ when, and only when, the branch separately proves that the retained-cycle entropy-contraction rate equals the structural binary reset-support value of Proposition 5 and Definition 28. This numerical equality does not identify the contraction rate with physical reset heat; a registered physical reset is governed separately by Theorem 31. Absent such a separate proof on a concrete horizon branch, the Landauer-tight substatus is empty and the certificate is just a generic relative-entropy contraction certificate. The contraction estimate (K.3d.4d.2), not the Landauer-tight label, is the certificate entry used for promotion.

**Theorem K.3d.4e (Certificate-to-Trace-Coupling Promotion).** An accepted relative-entropy contraction trace-coupling certificate supplies the trace-coupled promotion data of Definition K.3d.4c with
$$
\varepsilon_{\mathrm{Page}}^{\mathrm{REC}}(t)
=
\sqrt{\frac{D_0}{2}}e^{-\gamma_{\mathrm{REC}}N_t},
\tag{K.3d.4e.1}
$$
provided $\varepsilon_{\mathrm{Page}}^{\mathrm{REC}}(t)\le1-1/d_E(t)$.

*Proof.* For every paired state in the certified coupling $\Gamma_t$, quantum Pinsker under the natural-log convention gives
$$
D(\rho\|\sigma)\ge\frac12\|\rho-\sigma\|_1^2.
$$
Combining this with (K.3d.4d.2) yields
$$
\frac12\|\rho_E^{\mathrm{PU}}(t)-\rho_E^{\mathrm{Haar}}(t)\|_1
\le
\sqrt{\frac{D_0}{2}}e^{-\gamma_{\mathrm{REC}}N_t}.
$$
Thus the trace-distance input in (K.3d.4c.2) holds almost surely under $\Gamma_t$, with the stated ceiling condition. The forward-lock follows from $\chi_{\mathrm{REC}}$, because the coupling, entropy ceiling, contraction rate, retained-cycle counter, and norm are fixed before Page-curve comparison. ∎

**Corollary K.3d.4f (Conditional Page-Entropy Promotion).** The von Neumann Page-curve estimate is theorem-level on a horizon branch only when that branch carries either the original trace-coupled promotion certificate of Definition K.3d.4c or an accepted certificate of Definition K.3d.4d satisfying Theorem K.3d.4e. A bare Landauer entropy ledger, a second-moment design certificate, or a Golay-expander moment certificate without (K.3d.4c.2) remains Page-purity or certificate-pending data rather than a full entropy-curve theorem.

*Proof.* Theorem K.3 applies Audenaert continuity to the trace-distance input (K.3.1), and Definition K.3d.4c supplies exactly that input. Theorem K.3d.4e promotes an accepted relative-entropy contraction certificate to the same trace-distance datum by quantum Pinsker. In contrast, Theorem K.3d.5 supplies only moment-norm control; at second order this controls purity by Corollary K.3.1 but does not imply (K.3d.4c.2). Thus precisely the two stated certificate routes license the entropy conclusion. ∎

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
Thus on the orthogonal complement of the Haar-invariant subspace, the one-step contraction norm is at most $1-\gamma_t$ by (K.3d.4.2). Therefore
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
\Pi_X = \operatorname{diag}(\mathbf{1}_X),
\qquad
\Pi_P = \operatorname{diag}(\mathbf{1}_P),
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

Since the operator norm is bounded by the Hilbert-Schmidt norm, $\|\Pi_X F_\Lambda \Pi_P\|_{\mathrm{op}} \leq \|\Pi_X F_\Lambda \Pi_P\|_{\mathrm{HS}} = \sqrt{|X||P|/\Lambda}$, which is (K.3e.3). For $\Lambda\ge2$ and nonempty supports, Equation (K.3e.4) follows by substituting $|X| = \Lambda^{\delta_X}$, $|P| = \Lambda^{\delta_P}$ into (K.3e.3) and rewriting in terms of $h = 1/\Lambda$. For saturation, let $X$ be a subgroup of $\mathbb Z/\Lambda\mathbb Z$ and let $P=X^\perp$. Then $|X||P|=\Lambda$, and the normalized indicator of $P$ is mapped by $F_\Lambda$ to the normalized indicator of $P^\perp=X$ up to phase. This unit input lies in $\operatorname{ran}\Pi_P$ and its unit output lies in $\operatorname{ran}\Pi_X$, so $\|\Pi_XF_\Lambda\Pi_P\|_{\mathrm{op}}=1$, matching (K.3e.3). For general supports the Hilbert--Schmidt estimate is only an upper bound. $\square$

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

**Remark K.3f.1 (Status and Scope).** Theorem K.3e and Corollary K.3f are operator-norm statements for the specified discrete Fourier map on a finite-budget cyclic group. For a unit vector supported on $P$, they give one-step leakage outside $X$ of at least $1-h^{1-\delta_X-\delta_P}$ when $\delta_X+\delta_P<1$. Applying this estimate to a physical evaporation or remnant sector requires a separate protocol map identifying its state and readout supports with $P$ and $X$ and identifying the relevant update with $F_\Lambda$. Excluding indefinite storage additionally requires an iterated-dynamics or mixing theorem. The finite Fourier estimate alone supplies neither physical identification.

**Remark K.3f.2 (Conditional Connection to the Center-Ledger Area-Law Criterion).** On the rootless flux-tube branch of Proposition Z.8d, Theorem X.9.5d.4 gives a finite center-ledger criterion for Wilson-loop area law when its unbroken-center and positive-surface-gap hypotheses hold. Corollary K.3f can be applied to that sector only if an additional finite representation identifies the physical Wilson-line protocol with the cyclic Hilbert space, identifies the trapped flux and conjugate update sectors with $\Pi_X$ and $\Pi_P$, and intertwines the physical update with $F_\Lambda$. Under that representation, the condition $\delta_X+\delta_P<1$ gives the leakage bound of Corollary K.3f. Without it, the Fourier inequality and the center-ledger area-law criterion are separate statements.


## K.4 Arrow of Time and Temporal Asymmetry

**Puzzle:** Why does time have a preferred direction, with entropy increasing toward the future? Within standard statistical mechanics, the entropy conjecture — that the universe's coarse-grained entropy evolves as a time-symmetric, time-translation invariant Markov process [Wolpert, Rovelli & Scharnhorst 2025] — does not by itself select a temporal direction. As those authors prove rigorously, any such selection requires conditioning on boundary data at a chosen time, and neither the Boltzmann brain hypothesis (conditioning on the present) nor the Past Hypothesis (conditioning on the Big Bang) is privileged by the formalism. The second law's justification is circular within this framework: establishing the reliability of experimental records requires the second law, which in turn rests on those records [Wolpert, Rovelli & Scharnhorst 2025; Wolpert & Kipper 2024; Rovelli 2022].

**PU Resolution:** A thermodynamic arrow is obtained on branches carrying a registered-reset ledger with a positive conditional-entropy floor. For every reset event satisfying Definition 28, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; strict positivity additionally requires $H_q(P\mid R)\ge h_{\min}>0$. A noninjective prescribed-ready merge is available on the declared binary-ancilla architecture only under the reachable-domain hypothesis of Appendix J, Lemma J.1.

On the hypotheses of Appendix O, Theorem O.2, the registered production rate obeys
$$
\frac{dS_{total}}{dt} = \sum_{\text{registered events}} \frac{\varepsilon_i}{\tau_i} \geq 0.
$$
Strict increase requires at least one event with a positive registered production contribution. The quantitative suppression of reversed trajectories, $P_R/P_F\le e^{-N\varepsilon}$ (Theorem O.3), additionally requires its low-noise detailed-balance and uniform positive-cost hypotheses. The ordering of verification after prediction in Theorem P.12.2 supplies a logical event order, but identifying that order with a thermodynamic arrow requires the registered positive-production branch.

**Cosmological Implications:** On that branch, a low-entropy initial condition may be modeled as a state with small accumulated registered production. Any claim that PCE dynamically selects such an initial condition requires an independent cosmological boundary-selection theorem; it does not follow from Theorem 31 or Theorems O.2–O.3 alone.

**Connection to Other Arrows:** The framework naturally unifies multiple arrows of time:
- **Thermodynamic**: SPAP entropy production
- **Causal**: ND-RID channel directionality (Appendix E)
- **Psychological**: Memory formation costs $\varepsilon$ per bit (Appendix J)
- **Cosmological**: Expansion driven by relaxation of predictive tension

**Perspectival Structure of the Arrow:** On a branch satisfying Proposition O.4.2, self-referential depth grades the registered observer-relative obstruction. A level-0 MPU has a thermodynamic production contribution only when its cycle performs a reset satisfying Definition 28; Theorem 31 gives $\varepsilon_{\mathrm{reset}}\geq H_q(P\mid R)$, and strict positivity requires $H_q(P\mid R)\geq h_{\min}>0$. For a self-modeling system, Theorems M.10.3, M.10.4, and M.10.6 govern the declared self-restoration reachability branch. Transferring that obstruction to the quantitative processing lower bound of Theorem B.2 additionally requires the uniform reduction certificate of Corollary B.2.1. Under the registered positive-production and reduction-certificate hypotheses, the model yields an observer-relative irreversible ledger compatible with the closed finite-layer unitary branch of Theorem E.9.5. Claims about external access or assistance retain the separate hypotheses of Corollaries O.4.1 and O.4.3.

On the registered-reset branch with a positive conditional-entropy floor, the cited results supply a conditional microscopic production orientation. They do not prove that every MPU cycle has positive production, select a cosmological boundary measure, remove all temporal conditioning choices, or compare the probability of Boltzmann-brain histories with ordinary cosmological histories. Establishing a global arrow and an initial low-entropy state therefore requires additional network-dynamical and cosmological boundary-selection results.

## K.5 Operational Weak Cosmic Censorship

**Puzzle:** General relativity predicts singularities (infinite curvature) at black hole centers and the Big Bang. Classical weak cosmic censorship conjectures that singularities are hidden behind horizons, but lacks rigorous proof. Are naked singularities physically possible?

**PU Resolution:** The framework provides a rigorous information-theoretic exclusion of operationally meaningful naked singularities through throughput bounds and curvature-resolution limits.

**Definition K.5.1 (Predictive Throughput).**
For a protocol $\mathcal P_n$ consisting of $n$ registered boundary rounds, let $M_n$ be a finite classical message encoded into admissible interior preparations, let $\mathcal R_n$ be the exterior classical record, and let $T_n$ be the actual elapsed physical time. On the registered round-clock branch, $T_n\ge n\tau_{\min}$ with $\tau_{\min}>0$. Define
$$
L(S):=\sup_{\{\mathcal P_n\}}\limsup_{n\to\infty}\frac{I(M_n;\mathcal R_n)}{T_n},
$$
where the supremum is over admissible message ensembles and protocols satisfying that clock certificate. This message-rate definition does not become trivial merely because a fixed interior Hilbert space has finite dimension.

**Theorem K.5.1 (Conditional ND-RID Throughput Bound).**
Assume geometric regularity, the boundary-density certificate of Theorem E.3, and the throughput hypotheses of Theorem 14.2.4.1: every effective crossing link is a memoryless refresh-branch channel $\mathcal E_N=(1-p)\Psi+pT_\sigma$ with $p>0$; the aggregate boundary capacity is at most the sum of the registered link capacities; no bypass channel is present; and each link is used at most once per registered round of duration at least $\tau_{\min}>0$. Then
$$L(S) \leq \frac{N_{\mathrm{eff\,links}}(S)C_{\max}}{\tau_{\min}} = \frac{\sigma_{\mathrm{eff\,link}}A(S)C_{\max}}{\tau_{\min}} + o(A),$$
where $C_{\max}:=C(\mathcal E_N)<\ln d_0$ by Theorem E.2 and $\sigma_{\mathrm{eff\,link}}=\chi/(\eta\delta^2)$ by Theorem E.3.

*Proof.* The aggregate-capacity hypothesis bounds one boundary round by $N_{\mathrm{eff\,links}}(S)C_{\max}$ nats. The registered clock gives at most one round per $\tau_{\min}$, and the density certificate gives the area form. ∎

**Lemma K.5.2 (Uniform Cyclewise Trace-Distance Contraction).**
Let
$$
\mathcal E_\gamma
=\mathcal U_n\circ\mathcal N_n\circ\cdots\circ
\mathcal U_1\circ\mathcal N_1,
\qquad n=n(\gamma),
$$
where every $\mathcal U_j(\rho)=U_j\rho U_j^\dagger$ is unitary and every CPTP map $\mathcal N_j$ obeys
$$
D_{tr}(\mathcal N_j(\rho),\mathcal N_j(\sigma))
\le f_{RID}D_{tr}(\rho,\sigma),
\qquad 0\le f_{RID}<1,
$$
for all states in the retained branch. Then
$$
D_{tr}(\mathcal E_\gamma(\rho_1),\mathcal E_\gamma(\rho_2))
\le f_{RID}^{n(\gamma)}D_{tr}(\rho_1,\rho_2).
$$

*Proof.* Unitary invariance of the trace norm gives
$$
D_{tr}(\mathcal U_j(\rho),\mathcal U_j(\sigma))
=D_{tr}(\rho,\sigma).
$$
Applying the assumed contraction at the first dissipative step and unitary invariance at the following holonomy gives a factor $f_{RID}$. Repeating this argument through all $n$ pairs yields by induction
$$
D_{tr}(\mathcal E_\gamma(\rho_1),\mathcal E_\gamma(\rho_2))
\le\prod_{j=1}^n f_{RID},D_{tr}(\rho_1,\rho_2)
=f_{RID}^nD_{tr}(\rho_1,\rho_2).
$$
Thus the unitary holonomies preserve trace distance and the declared dissipative maps supply all strict contraction. ∎

**Lemma K.5.3 (Framewise Curvature Criterion for a Controlled Local Expansion).**
Let $\gamma$ be a timelike geodesic in a Lorentzian manifold and let $e_a$ be a parallel orthonormal frame along $\gamma$ and extend it over the Fermi-normal neighborhood by parallel transport along the orthogonal coordinate geodesics. On that framed neighborhood of radius $\delta$, define
$$
\|R\|_{\mathrm{fr},\delta}
:=
\sup_{x\in U_\delta}\max_{a,b,c,d}|R_{abcd}(x)|.
$$
Assume the Fermi-normal expansion has a uniform remainder bound
$$
g_{ab}(x)=\eta_{ab}+Q_{ab}(R(0),x)+\mathcal R_{ab}(x),
\qquad
|Q_{ab}|\le C_1\|R\|_{\mathrm{fr},\delta}|x|^2,
\qquad
|\mathcal R_{ab}(x)|\le C_2|x|^3
$$
on $U_\delta$. A sufficient condition for the quadratic curvature correction to remain perturbative at resolution $\delta$ is
$$
C_1\|R\|_{\mathrm{fr},\delta}\delta^2\ll1
$$
together with $C_2\delta^3\ll1$. If the first dimensionless quantity is large, this Fermi-normal perturbative certificate fails. No equivalence with a single Lorentzian scalar curvature invariant is asserted.

*Proof.* For $|x|\le\delta$, the assumed estimate gives
$$
|g_{ab}(x)-\eta_{ab}|
\le C_1\|R\|_{\mathrm{fr},\delta}\delta^2+C_2\delta^3.
$$
Both terms are small under the displayed conditions, so the local expansion is controlled. If $C_1\|R\|_{\mathrm{fr},\delta}\delta^2\gg1$, the quadratic term is not a small perturbation and this certificate gives no manifold approximation at scale $\delta$. Lorentzian contractions can cancel and therefore cannot replace the framewise bound. ∎

**Theorem K.5.4 (Finite-Resolution Exit of the Certified Fermi Expansion).**
Assume the hypotheses and framewise norm of Lemma K.5.3 along a curve, with constant operational resolution $\delta>0$. If
$$
\|R\|_{\mathrm{fr},\delta}\longrightarrow\infty,
$$
then the sufficient perturbative condition
$$
C_1\|R\|_{\mathrm{fr},\delta}\delta^2\ll1
$$
fails at a finite value of the framewise curvature scale. Therefore the certified Fermi-normal continuum approximation cannot be continued all the way to the formal curvature divergence. This result does not prove formation of a horizon, a continuation of the underlying MPU dynamics, or weak cosmic censorship.

*Proof.* Since $C_1>0$ and $\delta>0$ are constant on the declared branch, divergence of $\|R\|_{\mathrm{fr},\delta}$ implies that $C_1\|R\|_{\mathrm{fr},\delta}\delta^2$ eventually exceeds every perturbative threshold. Lemma K.5.3 then ceases to certify the local expansion. No statement about the causal structure or microscopic successor dynamics follows from loss of this continuum certificate. ∎

**Corollary K.5.5 (Boundary Entropy on the Saturated Area-Law Branch).** At capacity saturation,
$$
S_{BH}(S)
=N_{\mathrm{eff\,links}}(S)C_{\max}
=\frac{c^3}{4G\hbar}A(S)+o(A).
$$

*Proof.* The boundary-density certificate gives
$$
N_{\mathrm{eff\,links}}(S)
=\frac{\chi}{\eta\delta^2}A(S)+o(A).
$$
Equation E.9 gives
$$
G=\frac{\eta\delta^2c^3}{4\hbar\chi C_{\max}},
\qquad
\frac{c^3}{4G\hbar}=\frac{\chi C_{\max}}{\eta\delta^2}.
$$
Multiplying the link count by $C_{\max}$ and substituting the last identity proves the result. ∎

**Physical Interpretation:** The framework replaces geometric cosmic censorship with information-theoretic censorship: one cannot extract infinite information about a would-be singularity through finite area. The "singularity" manifests as either (i) a computation-induced information horizon where throughput saturates, or (ii) a breakdown of the continuum approximation where discrete MPU structure becomes dominant. Both outcomes preserve exterior predictability.


## K.6 Strong CP Problem Resolution

**Puzzle:** Quantum Chromodynamics (QCD) permits a CP-violating term proportional to $\theta_{\text{QCD}} \, \mathrm{tr}(G_{\mu\nu} \tilde{G}^{\mu\nu})$, yet the experimental bound on the neutron electric dipole moment constrains $|\bar{\theta}| < 10^{-10}$ (Abel et al. 2020). Why is this parameter so unnaturally small, and why does CP violation appear in the weak sector but not in the strong sector?

**PU Resolution:** The framework provides a branch-level resolution through two independent geometric mechanisms operating on the PCE-Attractor orbit $\operatorname{Gr}(2,8)$. The first fixes $\theta_{\text{QCD}}=0$ on the σ-symmetric topological-cost branch. The second fixes $\arg(\det M_q)=0$ only on a certified positive-orientation real-Yukawa branch: $E_8$ reality supplies real Yukawa data, while the determinant-orientation certificate selects the positive connected component. Under both branch inputs, $\bar\theta=0$.

### K.6.1 The Physical θ-Parameter

The physical CP-violating parameter in QCD is the combination:
$$\bar{\theta} = \theta_{\text{QCD}} + \arg(\det M_q)$$
where $\theta_{\text{QCD}}$ is the vacuum angle and $M_q$ is the quark mass matrix. The experimental constraint $|\bar{\theta}| < 10^{-10}$ from the neutron electric dipole moment (Abel et al. 2020; Baker et al. 2006) requires explanation for both terms.

**Definition K.6.1 (Topological Charge Density and Quantized Sector).** Adopt $\operatorname{tr}(T^aT^b)=\delta^{ab}/2$ and $\widetilde G^{\mu\nu}=\epsilon^{\mu\nu\rho\sigma}G_{\rho\sigma}/2$. Define
$$
Q(x)=\frac{g_s^2}{32\pi^2}G^a_{\mu\nu}(x)\widetilde G^{a\mu\nu}(x).
$$
For a smooth finite-action Euclidean $SU(3)$ connection on a compact oriented four-manifold, or on $\mathbb R^4$ with pure-gauge asymptotics that extend the bundle over $S^4$,
$$
\nu=\int d^4x\,Q(x)\in\mathbb Z
$$
is the second Chern number in this convention. For a general local configuration or noncompact boundary condition, the integral need not be an integer.

The neutron electric dipole moment scales as $d_n \sim 10^{-16} \bar{\theta}$ e·cm (Crewther et al. 1979; Pospelov & Ritz 2005), making the current experimental bound $|d_n| < 1.8 \times 10^{-26}$ e·cm (Abel et al. 2020) a precision probe of CP violation in the strong sector.

### K.6.2 Framework Context and Fundamental Parameters

The resolution employs the geometric structures established in earlier sections:

**Table K.6.0: Fundamental Parameters**

| Quantity | Symbol | Value | Source |
|:---------|:-------|:------|:-------|
| Minimal complexity | $K_0$ | 3 | Theorem 15 |
| Hilbert space dimension | $d_0$ | 8 on the minimal Appendix Z branch | Theorem 23; Theorem Z.2 |
| Structural binary reset-support value | $\varepsilon_0$ | $\ln 2$ on the attractor branch | Proposition 5; Definition 28; Definition 15a |
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

**Lemma K.6.1 (Bures--Kähler Relation under the QFI Normalization).** Assume the invariant Kähler--Einstein metric on $\operatorname{Gr}(2,8)$ is normalized so that its tensor on the registered interface tangent basis equals the SLD quantum Fisher tensor:
$$
g_{KE}=F_Q.
$$
Then
$$
g_B=\frac14g_{KE}.
$$

*Proof.* By the Bures convention used in the manuscript, $g_B=F_Q/4$. The normalization hypothesis gives $F_Q=g_{KE}$, so substitution yields $g_B=g_{KE}/4$. In the interface basis of Theorem Z.5, $F_Q=I_{24}$ and hence $g_B=I_{24}/4$. ∎

**Proposition K.6.1 (Properties of σ).**

(a) $\sigma^2 = \text{id}$ (involution)

(b) $\sigma_* \circ J = -J \circ \sigma_*$ (anti-holomorphic)

(c) $\sigma^* g_{KE} = g_{KE}$ (isometry)

(d) $\sigma^* \omega = -\omega$ (anti-symplectic)

*Proof.* Conjugation twice is the identity, so $\sigma^2=\operatorname{id}$. At a point $W$, identify
$$
T_W\operatorname{Gr}(2,8)\cong\operatorname{Hom}_{\mathbb C}(W,W^\perp).
$$
In these coordinates, $d\sigma(A)=\overline A$ and $J(A)=iA$. Hence
$$
d\sigma(JA)=\overline{iA}=-i\overline A=-J(d\sigma A),
$$
proving anti-holomorphicity. With the invariant normalization, the Kähler metric at the base point is
$$
g_{KE}(A,B)=\operatorname{Re}\operatorname{tr}(A^\dagger B).
$$
Therefore
$$
g_{KE}(\overline A,\overline B)
=\operatorname{Re}\operatorname{tr}(A^TB^*)
=\operatorname{Re}\overline{\operatorname{tr}(A^\dagger B)}
=g_{KE}(A,B).
$$
Transitivity and invariance propagate this equality over the orbit, proving $\sigma^*g_{KE}=g_{KE}$. Finally,
$$
(\sigma^*\omega)(A,B)
=g_{KE}(Jd\sigma A,d\sigma B)
=-g_{KE}(d\sigma JA,d\sigma B)
=-g_{KE}(JA,B)
=-\omega(A,B).
$$
Thus all four assertions hold. ∎

**Proposition K.6.2 (Parity Transformation of Gauge Fields).** Under the parity transformation $P: \mathbf{x} \to -\mathbf{x}$, the components of the gluon field strength tensor transform as:
$$P: G^{0i} \to -G^{0i}, \quad G^{ij} \to G^{ij}$$

*Proof.* The field strength tensor $G_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu + ig[A_\mu, A_\nu]$ transforms under parity according to the vector nature of $A_\mu$. Since $A_0$ is a scalar and $A_i$ are vectors under parity, we have $P: A_0(\mathbf{x}) \to A_0(-\mathbf{x})$ and $P: A_i(\mathbf{x}) \to -A_i(-\mathbf{x})$. Combined with $\partial_0 \to \partial_0$ and $\partial_i \to -\partial_i$, the components transform as stated. The dual tensor $\tilde{G}^{\mu\nu} = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma}G_{\rho\sigma}$ inherits opposite parity, yielding $P: \mathrm{tr}(G\tilde{G}) \to -\mathrm{tr}(G\tilde{G})$. ∎

**Theorem K.6.1 (Conditional $\sigma$--CP Correspondence).** Assume the retained gauge-vacuum branch carries an equivariant parameter map
$$
\Phi_{CP}:\mathcal M_{mathrm{vac}}\longrightarrow\operatorname{Gr}(2,8)
$$
that intertwines physical CP with complex conjugation $\sigma$, and assume its registered $U(1)$ holonomy coordinate obeys $e^{i\theta}\mapsto e^{-i\theta}$. Then:

1. $\sigma$ is antiholomorphic on $\operatorname{Gr}(2,8)$;
2. physical CP is represented unitarily on Hilbert space, while its induced action on the declared complex parameter coordinate is antiholomorphic;
3. the registered holonomy coordinate transforms as $\theta\mapsto-\theta$ modulo $2\pi$.

*Proof.* Complex conjugation on $\mathbb C^8$ descends to $W\mapsto\overline W$ on $U(8)/(U(2)\times U(6))$ and satisfies $d\sigma\circ J=-J\circ d\sigma$, proving item 1. The equivariance hypothesis transfers this action to the physical CP parameter branch, while CP itself has a unitary Hilbert-space implementation, proving item 2. Finally,
$$
\overline{e^{i\theta}}=e^{-i\theta},
$$
so injectivity of the circle coordinate modulo $2\pi$ gives item 3. ∎

### K.6.4 θ-Parameter Embedding in the Attractor Geometry

The θ-vacuum structure of QCD embeds naturally into the PCE-Attractor geometry through the following construction.

**Definition K.6.5 (Tautological Bundle).** Let $\mathcal{S} \to \text{Gr}(2,8)$ be the tautological bundle, where the fiber over $V \in \text{Gr}(2,8)$ is the 2-plane $V$ itself:
$$\mathcal{S} = \{(V, v) : V \in \text{Gr}(2,8), v \in V\}$$

**Definition K.6.6 (Determinant Line Bundle).** The determinant line bundle is:
$$\mathcal{L} = \det(\mathcal{S}) = \Lambda^2 \mathcal{S}$$

This is a complex line bundle over $\text{Gr}(2,8)$ whose fiber over $V$ is $\Lambda^2 V \cong \mathbb{C}$.

**Definition K.6.7 (Instanton Topological-Sector Classification).** Isomorphism classes of principal $\mathrm{SU}(3)$ bundles over $S^4$ are classified by
$$
\pi_3(\mathrm{SU}(3))\cong\mathbb Z.
$$
A framed finite-action $\mathrm{SU}(3)$ connection on $\mathbb R^4$ that extends over the point at infinity therefore has an integer topological charge $\nu$. This integer labels the topological sector; it does not classify gauge-equivalence classes of instanton connections inside that sector.

*Proof.* Cover $S^4$ by two closed four-balls. Their intersection deformation-retracts to $S^3$, and the clutching theorem for principal bundles over spheres (Steenrod 1951) identifies bundle classes with homotopy classes of transition maps $S^3\to\mathrm{SU}(3)$, namely $\pi_3(\mathrm{SU}(3))$. The homogeneous-space fibration
$$
\mathrm{SU}(2)\longrightarrow\mathrm{SU}(3)\longrightarrow S^5
$$
has long exact homotopy segment
$$
\pi_4(S^5)\longrightarrow\pi_3(\mathrm{SU}(2))
\longrightarrow\pi_3(\mathrm{SU}(3))
\longrightarrow\pi_3(S^5).
$$
Because $\pi_4(S^5)=0$, $\pi_3(S^5)=0$, and $\mathrm{SU}(2)\cong S^3$, exactness gives
$$
\pi_3(\mathrm{SU}(3))\cong\pi_3(S^3)\cong\mathbb Z.
$$
Under the Chern--Weil normalization, this integer is the second Chern number
$$
\nu=\frac1{8\pi^2}\int_{S^4}\operatorname{tr}(F\wedge F).
$$
Embedding the charge-one BPST $\mathrm{SU}(2)$ instanton (Belavin, Polyakov, Schwartz, and Tyupkin 1975) into $\mathrm{SU}(3)$ realizes a generator. Continuous position, scale, and gauge-orientation parameters remain within a charge sector, so $\nu$ classifies sectors rather than individual connections. ∎

**Definition K.6.8 ($\theta$-Vacuum as a Generalized Sector State).** Let $|n\rangle$ denote orthonormal winding-sector representatives. For $N\in\mathbb N$, define the normalized approximant
$$
|\theta;N\rangle
=\frac1{\sqrt{2N+1}}
\sum_{n=-N}^{N}e^{in\theta}|n\rangle.
$$
The symbol $|\theta\rangle$ denotes the associated generalized superselection label or a separately constructed thermodynamic-limit state; the formal series
$$
\sum_{n\in\mathbb Z}e^{in\theta}|n\rangle
$$
is not a norm-convergent Hilbert-space vector.

**Proposition K.6.3 (CP Transformation of θ-Vacuum).** Under CP transformation:
$$\text{CP}|\theta\rangle = |-\theta\rangle$$

*Proof.* The topological charge density transforms as $Q(x) \xrightarrow{\text{CP}} -Q(x)$. Therefore the instanton number changes sign: $\nu \to -\nu$, implying $|n\rangle \to |-n\rangle$. Consequently:
$$\text{CP}|\theta\rangle = \sum_n e^{in\theta}|-n\rangle = \sum_m e^{-im\theta}|m\rangle = |-\theta\rangle$$
∎

**Corollary K.6.1 (CP-Invariant $\theta$).** CP-invariant vacuum labels satisfy
$$
\theta\in\{0,\pi\}
\qquad\text{modulo }2\pi.
$$

*Proof.* Proposition K.6.3 maps the label $\theta$ to $-\theta$. Invariance therefore requires
$$
\theta\equiv-\theta\pmod{2\pi},
$$
or $2\theta\equiv0\pmod{2\pi}$. The two solutions modulo $2\pi$ are $0$ and $\pi$. ∎

**Proposition K.6.4 (Gauge-Topology Bridge Requirement).** The embedding $\iota:G_{\mathrm{SM}}\hookrightarrow U(8)$ does not by itself identify QCD instanton sectors with holonomies of the tautological determinant line over $\operatorname{Gr}(2,8)$. Such an identification requires an additional construction mapping the second Chern class of the retained $SU(3)$ gauge bundle to the first-Chern or holonomy datum of a specified line bundle, together with a proof that the map preserves the integer charge and the CP action.

*Proof.* For every $g:S^3\to SU(3)$,
$$
\det g(x)=1
\qquad(x\in S^3),
$$
so the determinant map sends every class of $\pi_3(SU(3))\cong\mathbb Z$ to the trivial map. Hence the instanton winding cannot be recovered from the determinant of the gauge transformation at spatial infinity. Equivalently, instanton number is represented by $c_2$ of the four-dimensional $SU(3)$ bundle, whereas a determinant line carries $c_1$. The group embedding alone supplies no homomorphism equating those characteristic classes. Therefore the claimed correspondence is available only after the additional bridge construction stated above. ∎

### K.6.5 PCE Cost Functional on S¹

The θ-parameter lives on the circle $S^1 \cong U(1)$. The PCE cost functional on this space is uniquely determined by geometric constraints.

**Definition K.6.9 (Topological Susceptibility).** Assume a translation-invariant Euclidean state for which the connected correlation integral and thermodynamic limit exist. Then
$$
\chi_{\mathrm{top}}
:=
\int d^4x\,\langle Q(x)Q(0)\rangle_c
=
\lim_{V\to\infty}
\frac{\langle\nu_V^2\rangle-\langle\nu_V\rangle^2}{V}.
$$
On a CP-symmetric branch, $\langle\nu_V\rangle=0$ and the numerator reduces to $\langle\nu_V^2\rangle$.

**Theorem K.6.2 (First-Harmonic PCE Cost Ansatz on $S^1$).** Let $V_0>0$. Assume that the retained cost is smooth, even, $2\pi$-periodic, vanishes at $\theta=0$, has local expansion
$$
V(\theta)=\frac12V_0\theta^2+O(\theta^4),
$$
and is truncated to the constant and first cosine harmonic. Then
$$
V_{\mathrm{PCE}}(\theta)=V_0(1-\cos\theta).
$$

*Proof.* The truncation and evenness give $V(\theta)=a_0+a_1\cos\theta$. The condition $V(0)=0$ gives $a_0=-a_1$. Since $V''(0)=-a_1=V_0$, one has $a_1=-V_0$ and $a_0=V_0$. Hence $V(\theta)=V_0(1-\cos\theta)$. Its Taylor series is
$$
V_0(1-\cos\theta)=\frac12V_0\theta^2-\frac1{24}V_0\theta^4+O(\theta^6),
$$
and its unique minimum modulo $2\pi$ is at $\theta=0$.

Without the first-harmonic hypothesis the listed geometric conditions do not determine the function. For example, for every $\lambda\ge0$,
$$
V_\lambda(\theta)
=V_0(1-\cos\theta)+\lambda V_0(1-\cos\theta)^2
$$
has the same quadratic coefficient, parity, periodicity, and minimum, but differs away from zero. ∎

**Corollary K.6.2 (Conditional Topological-Cost Normalization).** If the topological-cost branch supplies the normalization map
$$
V_0:=2\alpha\sigma_B^2,
$$
then the values $\alpha=3/2$ and $\sigma_B^2=1/24$ give
$$
V_0
=2\left(\frac32\right)\left(\frac1{24}\right)
=\frac18.
$$
The Bures variance and hierarchy coefficient alone do not derive the normalization map.

*Proof.* Direct multiplication gives $2(3/2)(1/24)=3/24=1/8$. ∎

**Remark K.6.1: Consistency with QCD.** The QCD dilute instanton gas approximation yields $V(\theta) = \chi_{\text{top}}(1 - \cos\theta)$ where $\chi_{\text{top}}$ is the topological susceptibility (Callan, Dashen & Gross 1976). The agreement with the PCE-derived form is a consistency check: both the geometric PCE derivation and the QCD calculation yield the same functional form because both respect the U(1) holonomy structure and the physical requirement of quadratic cost near the vacuum.

### K.6.6 First Mechanism: σ-Invariance Selects θ = 0

**Theorem K.6.3 (Hermiticity under the Normal-Observable Hypothesis).** Assume physical observables on the finite retained Hilbert space are represented by normal operators and that their possible outcomes are their spectral values. If every outcome is real, then the observable operator is Hermitian.

*Proof.* Let $O$ be normal. The finite-dimensional spectral theorem gives a unitary $U$ and eigenvalues $\lambda_j$ such that
$$
O=U\operatorname{diag}(\lambda_1,\ldots,\lambda_n)U^\dagger.
$$
If every spectral value is real, then
$$
O^\dagger
=U\operatorname{diag}(\overline{\lambda_1},\ldots,\overline{\lambda_n})U^\dagger
=O.
$$
Thus $O$ is Hermitian. Normality is essential: a nonnormal operator may have an entirely real spectrum without being Hermitian. ∎

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

**Corollary K.6.3 (Conditional Gibbs Weight of the First-Harmonic Cost).** Suppose a probability law is separately declared by
$$
P_\beta(\theta)=Z_\beta^{-1}e^{-\beta V_{\mathrm{PCE}}(\theta)},
$$
where $\beta V_{\mathrm{PCE}}$ is dimensionless. On the first-harmonic branch of Theorem K.6.2,
$$
\frac{P_\beta(\pi)}{P_\beta(0)}
=e^{-\beta[V_{\mathrm{PCE}}(\pi)-V_{\mathrm{PCE}}(0)]}
=e^{-2\beta V_0}.
$$
No equality with $e^{-16\pi^2/g_s^2}$ follows unless an independent bridge proves
$$
2\beta V_0=\frac{16\pi^2}{g_s^2}.
$$

*Proof.* The ratio cancels the partition function. Since $V_{\mathrm{PCE}}(\pi)=2V_0$ and $V_{\mathrm{PCE}}(0)=0$, substitution gives the displayed result. ∎

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
T_W\mathrm{Gr}(2,8) \cong \operatorname{Hom}_{\mathbb C}(W,W^\perp).
$$
The differential $d\sigma$ acts on this space by complex conjugation, and the tangent space of the invariant locus is the $+1$ eigenspace
$$
T_W\mathrm{Gr}_{\mathbb R}(2,8) \cong \operatorname{Hom}_{\mathbb R}(V,V^\perp).
$$
The complex structure is multiplication by $i$, while $d\sigma(iA)=-i\,d\sigma(A)$. Thus no nonzero vector in the fixed tangent space is invariant after multiplication by $i$; equivalently
$$
T_W\mathrm{Gr}_{\mathbb R}(2,8) \cap i\,T_W\mathrm{Gr}_{\mathbb R}(2,8)=\{0\}.
$$
Hence the fixed locus is totally real. ∎

**Corollary K.6.4 ($\sigma$-Invariant Vacuum Representative).** If the PCE-Attractor vacuum is $\sigma$-invariant, then its Grassmannian representative lies in $\operatorname{Gr}_{\mathbb R}(2,8)$. Coordinates and tensors constructed solely and equivariantly from that representative may be chosen real. This conclusion does not constrain Berry holonomies, determinant orientations, or parameters supplied by independent sectors.

*Proof.* By definition,
$$
\operatorname{Gr}(2,8)^\sigma
=\{W:\sigma(W)=W\}
\cong\operatorname{Gr}_{\mathbb R}(2,8).
$$
Thus a $\sigma$-invariant representative belongs to the real locus. No statement about data not determined by that representative follows from this membership relation. ∎

### K.6.8 Second Mechanism: $E_8$ Root Reality

The quark mass matrix contribution $\arg(\det M_q)$ is controlled by the Yukawa coupling structure, which derives from $E_8$ geometry on the attractor orbit.

**Definition K.6.11 ($E_8$ Root System).** The $E_8$ root system consists of 240 vectors in $\mathbb{R}^8$ of squared norm 2:

- **Type I (112 roots):** All permutations of $(\pm 1, \pm 1, 0, 0, 0, 0, 0, 0)$
- **Type II (128 roots):** All vectors $(\pm\frac{1}{2}, \pm\frac{1}{2}, \ldots, \pm\frac{1}{2})$ with an even number of minus signs

**Lemma K.6.2 ($E_8$ Reality).** All $E_8$ roots have real coordinates:
$$
E_8\subset\mathbb R^8.
$$

*Proof.* In Definition K.6.11, every Type-I coordinate belongs to $\{-1,0,1\}\subset\mathbb R$, and every Type-II coordinate belongs to $\{-1/2,1/2\}\subset\mathbb R$. Both families therefore lie in $\mathbb R^8$, and their union is the stated root system. ∎

**Lemma K.6.3 ($E_8$ Distance Spectrum).** For distinct roots $r_i, r_j \in E_8$, the squared Euclidean distance satisfies:
$$d^2_{E_8}(r_i, r_j) = |r_i - r_j|^2 \in \{2, 4, 6, 8\}$$

*Proof.* Every root has squared norm $2$, so
$$
\|r_i-r_j\|^2
=4-2\langle r_i,r_j\rangle.
$$
The $E_8$ coordinate description gives integral inner products, and Cauchy--Schwarz gives $-2\le\langle r_i,r_j\rangle\le2$. Equality at $2$ holds only when $r_i=r_j$, which is excluded. Thus for distinct roots
$$
\langle r_i,r_j\rangle\in\{-2,-1,0,1\},
$$
and substitution yields
$$
\|r_i-r_j\|^2\in\{8,6,4,2\}.
$$
This is the asserted set. ∎

**Theorem K.6.7 (Yukawa Reality on the Toeplitz-Kraus Probability-Overlap Branch).** Assume the Gaussian localization, Toeplitz-Kraus probability-overlap rule, Bures variance, and local Bures-$E_8$ conversion of Theorem T.41.5, Lemma T.41.2, and Lemma T.41.4. Then, to quadratic order in the registered local chart,
$$
Y_{ij}
\propto
\exp\left[-\alpha d_{E_8}^2(r_i,r_j)\right]
\in\mathbb R_{>0},
\qquad
\alpha=\frac{1}{16\sigma_B^2}=\frac32.
$$

*Proof.* Theorem T.41.5 distinguishes the amplitude overlap from the physical Yukawa magnitude:
$$
\langle\psi_i\mid\psi_j\rangle
\propto e^{-d_B^2/(4\sigma_B^2)},
\qquad
Y_{ij}\propto|\langle\psi_i\mid\psi_j\rangle|^2
=e^{-d_B^2/(2\sigma_B^2)}.
$$
Using $d_B^2=d_{E_8}^2/8$ at the retained quadratic order gives
$$
Y_{ij}
\propto
\exp\left[-\frac{d_{E_8}^2}{16\sigma_B^2}\right].
$$
With $\sigma_B^2=1/24$, the coefficient is $24/16=3/2$. Finally, $d_{E_8}^2(r_i,r_j)$ is a nonnegative real number, so every displayed exponential is strictly positive and real. ∎

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
e^{-\|\omega\|^2/(4\gamma)}d\omega.
$$
The integrand is nonnegative. If the integral vanished, then
$$
F(\omega):=\sum_i c_i e^{i\omega\cdot r_i}
$$
would vanish almost everywhere and hence everywhere because $F$ is real analytic. Choose a vector $v$ for which the numbers $v\cdot r_i$ are pairwise distinct. Then $F(tv)=0$ for all $t$, and differentiating at $t=0$ for orders $0,1,2$ gives a Vandermonde system in the three distinct frequencies. Its determinant is nonzero, so every $c_i=0$, a contradiction. Thus the integral is strictly positive for nonzero $c$. The same-root Gaussian matrix is positive definite and has positive determinant, while a general row-column cross-overlap construction need not. ∎

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
For the standard ordered block basis and $\dim M_q=6$,
$$
\operatorname{Pf}_{\mathrm{std}}(\mathcal D_q)
=(-1)^{6\cdot5/2}\det M_q
=-\det M_q.
$$
The certificate adopts the positive-reference orientation and denotes the orientation-adjusted scalar by
$$
\operatorname{Pf}(\mathcal D_q)
:=-\operatorname{Pf}_{\mathrm{std}}(\mathcal D_q)
=\det M_q.
$$
Consequently,
$$
\operatorname{Pf}(\mathcal D_q)^2
=\det\mathcal D_q
=(\det M_q)^2.
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

**Theorem K.6.14 (Distance-Pair Enumeration for the Mass-Ratio Invariant).** Let
$$
d_{31}^2,d_{32}^2\in\{2,4,6,8\},
\qquad d_{31}^2>d_{32}^2.
$$
Then the pairs compatible with each value of $\mathcal R=d_{31}^2/d_{32}^2$ are
$$
\begin{array}{c|c}
\mathcal R&(d_{32}^2,d_{31}^2)\\ \hline
4/3&(6,8)\\
3/2&(4,6)\\
2&(2,4),(4,8)\\
3&(2,6)\\
4&(2,8).
\end{array}
$$
This enumeration does not select a unique $E_8$ triad. Moreover, for $\alpha>0$ the function
$$
C(a,b)=e^{-\alpha a}+e^{-\alpha b}
$$
is strictly decreasing in each argument, so minimizing this particular expression cannot justify selection of the smallest admissible distances.

*Proof.* Enumerating the six ordered pairs
$$
(2,4),(2,6),(2,8),(4,6),(4,8),(6,8)
$$
gives the table by direct division. For the cost claim,
$$
\frac{\partial C}{\partial a}=-\alpha e^{-\alpha a}<0,
\qquad
\frac{\partial C}{\partial b}=-\alpha e^{-\alpha b}<0.
$$
Thus larger arguments lower $C$. Distances alone also leave the actual root labels and their mutual geometry unspecified. ∎

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

**Theorem K.6.16 (Real-Locus Kähler-Holonomy Constraint).** The invariant locus $\operatorname{Gr}(2,8)^\sigma$ is Lagrangian. Consequently, if a contractible loop $\gamma$ bounds a surface $\Sigma$ contained in that locus and the Berry curvature is the restricted Kähler form, then
$$
\int_\Sigma\omega_{KE}=0.
$$
A nonzero continuous curvature holonomy therefore requires a certified relative loop or spanning surface that is not contained in the real locus. A flat topological holonomy not represented by the curvature integral requires its own bundle certificate.

*Proof.* At a point of the invariant locus, every tangent vector $X$ satisfies $d\sigma(X)=X$. Since $\sigma^*\omega_{KE}=-\omega_{KE}$,
$$
\omega_{KE}(X,Y)
=\omega_{KE}(d\sigma X,d\sigma Y)
=-\omega_{KE}(X,Y),
$$
so $\omega_{KE}(X,Y)=0$ for all tangent $X,Y$. Proposition K.6.5 gives real dimension $12$, half the ambient real dimension $24$, hence the invariant locus is Lagrangian. The curvature integral over any surface contained in it vanishes. ∎

**Theorem K.6.17 (Certificate-Gated Type Classification).** On the $\sigma$-symmetric topological-cost branch with a certified positive-orientation real-Yukawa determinant:

- **Type I** strong-sector phases vanish.
- **Type II** phases are permitted only when the flavor branch supplies a relative Berry-loop certificate whose holonomy is nonzero, obeys the declared $\sigma$/CP transformation law, and changes a retained generation protocol. A continuous Kähler-curvature realization must satisfy the off-real-locus condition of Theorem K.6.16.

*Proof.* Theorem K.6.6 gives $\theta_{\mathrm{QCD}}=0$ on its stated branch, and Corollary K.6.5 gives $\arg\det M_q=0$ when its orientation data are supplied; hence the Type-I conclusion follows. For Type II, a connection and loop define
$$
\delta=\arg\operatorname{Hol}_\gamma(\mathcal A_B)
$$
only after the bundle, connection, and loop are specified. Nonzero holonomy plus the response condition makes that relative phase physical. Theorem K.6.16 excludes a nonzero continuous Kähler-curvature integral for a spanning surface wholly inside the real locus, so the stated additional certificate is necessary. ∎

**Theorem K.6.18 (Conditional CKM Phase on the Nonlinear Phase-Response Branch).** Assume the branch registers the additional nonlinear response ansatz of Theorem T.56,
$$
\delta_{\mathrm{CKM}}
:=
\delta_{\mathrm{flat}}\operatorname{sinc}(1/\sqrt3),
\qquad
\delta_{\mathrm{flat}}=70.53^\circ.
$$
Then
$$
\delta_{\mathrm{CKM}}
=70.53^\circ\times0.9454\ldots
=66.7^\circ
$$
to the displayed precision.

*Proof.* Theorem T.55 gives
$$
\left\langle e^{i(\delta_{\mathrm{flat}}+\xi)}\right\rangle
=e^{i\delta_{\mathrm{flat}}}\operatorname{sinc}(1/\sqrt3),
$$
whose positive real factor preserves the phase and reduces only visibility. Theorem T.56 separately defines the nonlinear phase-response ansatz displayed above. Substitution into that registered ansatz gives $66.7^\circ$. ∎

**Table K.6.2: Strong vs Weak CP**

| Effect | Type | Determinant-line status | Result |
|:-------|:-----|:------------------------|:-------|
| $\theta_{\text{QCD}}$ | I | Absolute σ-exact class plus topological-cost selection | $=0$ on the σ-symmetric branch |
| $\arg\det M_q$ | I | Real $E_8$ determinant class plus positive-orientation certificate | $=0$ on the certified orientation branch |
| $\delta_{\text{CKM}}$ | II | Relative flavor holonomy | $=66.7°$ |
| $\delta_{\text{PMNS}}$ | II | Relative neutrino-sector holonomy | Appendix T branch value |
| Baryogenesis CP-odd datum | II | Relative holonomy weighted by a driven APS-Kubo update | Appendix Y branch value; Theorems Y.6.1i--Y.6.1k |

**Theorem K.6.18a (Relative Determinant-Line CP Ledger under Explicit Bridge Data).** Let $D_{\mathrm{PU}}(x)$ be a smooth retained family of finite chiral update operators over the gauge-flavor parameter branch, and let
$$
\mathcal L_{\det}(D_{\mathrm{PU}})
=
\det\ker D_{\mathrm{PU}}
\otimes
(\det\operatorname{coker}D_{\mathrm{PU}})^*
\tag{K.6.18a.1}
$$
be its determinant line equipped with a declared connection. For a retained loop $\gamma$, define
$$
\Theta_{\det}(\gamma)
=
\arg\operatorname{Hol}_{\gamma}(\mathcal L_{\det})
+
\Theta_{\mathrm{APS}}(\gamma)
\pmod{2\pi}.
\tag{K.6.18a.2}
$$
Assume the branch supplies:

1. a connection-preserving identification between the flavor restriction of $\mathcal L_{\det}$ and the Berry line used in Appendix T;
2. an APS interpolation, boundary condition, phase convention, and gluing formula defining $\Theta_{\mathrm{APS}}(\gamma)$;
3. an index-preserving map from the resulting APS family to the anomaly-update operator used in Appendix Y; and
4. an operational response certificate showing that the relative holonomy changes a retained flavor or anomaly protocol.

In the convention $\Theta_{\mathrm{APS}}(\gamma)=\pi\eta_\gamma$, the phase is $\arg\operatorname{Hol}_\gamma(\mathcal L_{\det})+\pi\eta_\gamma$. On the $\sigma$-symmetric PCE-Attractor branch with a certified positive-orientation real-Yukawa determinant branch and the four bridge entries above:

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

3. The baryogenesis CP-odd weight is the projection of the same relative holonomy through the anomaly-update index; the production source remains the driven or boundary term of Theorem Y.6.1i:
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

For baryogenesis, Theorem Y.4.3b identifies the anomaly-mediated update with the APS index of the chiral predictive update operator, including the APS boundary phase contribution on the boundary Dirac operator. Corollary Y.10.2 identifies the CP phase weighting the certified baryogenesis transport response with predictive orientation holonomy. Substituting the relative determinant-line phase into the Appendix Y CP factor gives (K.6.18a.5). Therefore the Type I/Type II split is the exact/non-exact split of the determinant-line CP ledger. ∎

### K.6.12 Connection to Baryogenesis



The retained Type II CP datum is one input to baryogenesis, not a complete source.

**Proposition K.6.6 (Conditional Sakharov-Branch Realization).** A branch satisfies the three Sakharov conditions for baryogenesis (Sakharov 1967) if it carries:

1. **Baryon number violation:** the certified electroweak sphaleron/anomaly source of Appendix Y, Section Y.4;
2. **C and CP violation:** a nonzero CP response, with $\delta=66.7^\circ$ only on the nonlinear phase-response branch of Theorem K.6.18 and Theorem T.56; and
3. **Departure from equilibrium:** the independently registered driven nonequilibrium/freeze-out certificate used by Appendix Y. Theorem 31 supplies a conditional reset-heat ledger and does not by itself prove departure from equilibrium.

*Proof.* On a branch carrying item 1, the anomaly/sphaleron update violates baryon number. Item 2 supplies the required nonzero C- and CP-odd response. Item 3 supplies a state outside thermal equilibrium. These are precisely the three Sakharov conditions. The conclusion is conditional because removal of any one certificate removes the corresponding condition. ∎

**Theorem K.6.19 (Baryon Asymmetry on the Certified Driven Reduction).** The product value below is licensed only when the Appendix Y source, freeze-out, transport, and residual entries satisfy Theorems Y.6.1i--Y.6.1k. The cosmological baryon asymmetry is:
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

**Prediction K.6.1 (No Axion on the Strong-CP Branch).** On the σ-symmetric, certified positive-orientation real-Yukawa branch, the framework predicts $\bar\theta=0$ exactly without introducing an axion degree of freedom or Peccei-Quinn symmetry (Peccei & Quinn 1977a, 1977b). This branch therefore contains no QCD axion in the strong-CP sector.

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

**Prediction K.6.3 (Static $\theta$-Vacuum Stability on the First-Harmonic Branch).** For $V_0>0$,
$$
V_{\mathrm{PCE}}'(0)=0,
\qquad
V_{\mathrm{PCE}}''(0)=V_0>0,
$$
so $\theta=0$ is a strict local minimum of the declared static cost. A decay law and characteristic timescale require an additional dynamical equation, such as a certified gradient-flow mobility or a kinetic term with damping; the cost curvature alone does not determine either quantity.

**Table K.6.5: Consistency Checks**

| Observable | PU Prediction | Measured Value | Status |
|:-----------|:--------------|:---------------|:-------|
| CKM phase $\delta_{\mathrm{CKM}}$ | $66.7^\circ$ | $65.72^\circ\pm1.49^\circ$ | ✓ ($+0.7\sigma$) |
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
| **Peccei-Quinn** (Peccei & Quinn 1977a, 1977b) | U(1)_PQ → axion | Axion field | $m_a \sim 10^{-5}$ eV | Testable |
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
| $\eta_B$ | validation run $(6.2 \pm 0.5)\times10^{-10}$; theorem-level only after $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or $\mathfrak C_B^{\mathrm{APSK}}$ | Baryogenesis | Theorem K.6.19; Definitions Y.11.7a, Y.11.7e, and Y.6.1c; Theorem Y.6.1d |

**Key Insights:**

1. **σ-invariance forces θ_QCD = 0**: The anti-holomorphic involution on Gr(2,8) corresponds to CP in QFT. Physical (Hermitian) observables are σ-invariant, restricting θ to {0, π}. PCE then selects θ = 0.

2. **$E_8$ reality plus orientation fixes $\arg(\det M_q)=0$**: Yukawa couplings derive from Gaussian overlaps on the real $E_8$ lattice, giving real positive entries. The determinant phase is fixed only after the branch supplies a positive-orientation certificate, either by a nonzero determinant path or by an ordered heat-kernel chamber.

3. **No fine-tuning**: Both contributions vanish independently through different branch mechanisms rather than by cancellation.

4. **Weak CP survives**: Berry holonomy (Type II) is σ-compatible, allowing the CKM phase δ = 66.7° needed for baryogenesis.

5. **Falsifiable branch**: The Appendix K strong-CP branch predicts no QCD axion and exact $\bar\theta=0$ within its stated symmetry and orientation hypotheses.

The resolution requires no new particles (no axion), no new symmetries (Peccei & Quinn 1977a, 1977b), and no fine-tuning on the stated branch. The mechanism naturally explains why CP is violated in weak interactions (Type II, Berry phase) but not in strong interactions (Type I, forbidden by σ-symmetry plus positive-orientation real Yukawa data).

The same geometric structure that generates the three-generation hierarchy (Appendix R) and the fine-structure constant (Appendix Z) also supplies the branch data for $\bar\theta=0$. The Strong CP resolution is not an independent postulate but emerges on the unified PCE-Attractor branch.

---


## K.7 Hierarchy Problem and Naturalness: Conditional Status

The relation $v=A_{EW}e^{-\kappa_{EW}}M_{Pl}$ is a determinant-model ansatz on its declared branch. A combinatorial label for $\kappa_{EW}$ does not protect a dimensionful scale from radiative or threshold corrections. Technical naturalness requires a renormalized effective action, symmetry or nonrenormalization mechanism, beta functions, matching thresholds, counterterm scheme, and determinant-remainder bounds.

Therefore PU does not presently provide a complete hierarchy-problem solution. Numerical proximity after inserting the determinant-model inputs is a validation datum, not a derivation. Gaussian and higher corrections have no universal $O(1)$ bound without the missing fluctuation-spectrum and renormalization certificate.



**Puzzle:** The electroweak scale $v \approx 246$ GeV is 17 orders of magnitude smaller than the Planck scale $M_{Pl} \approx 10^{19}$ GeV. In quantum field theory, radiative corrections should drive the Higgs mass to $M_{Pl}$ unless parameters are fine-tuned to extraordinary precision ($\sim 10^{-34}$). Similarly, the baryon asymmetry $\eta_B \sim 10^{-10}$ appears to require fine-tuning. Why are these hierarchies stable?

**PU Status:** Appendix T supplies a branch-level combinatorial exponent and a model-conditional determinant formula; it does not establish technical naturalness.

**Electroweak Complexity:** On the declared structural branch,
$$
\kappa_{EW}
=\frac{bk}{2}+\dim(G/H)-\frac m2
=36+3-\frac12
=38.5,
$$
where the three terms are the alignment count, electroweak-coset dimension, and declared collective-mode subtraction of Appendix T.

**Determinant-Model Scale:** If the Appendix T determinant prescription supplies $A_{EW}$, then
$$
v=A_{EW}e^{-\kappa_{EW}}M_{Pl},
\qquad
\frac v{M_{Pl}}=A_{EW}e^{-38.5}.
$$
This is a conditional scale formula, not a radiative-stability theorem.

**Naturalness Status:** Discreteness of the Golay parameters protects only their combinatorial values. Protection of the dimensionful electroweak scale requires a renormalized effective action, a symmetry or nonrenormalization mechanism, beta functions, matching thresholds, counterterms, and quantitative bounds on the fluctuation determinant. Without those data, neither Gaussian nor higher corrections have a universal $O(1)$ bound.
- Connection to cosmological constant: both $v$ and $\Lambda$ emerge from the same Golay-Steiner structure via different complexity channels ($\kappa_{EW} = 38.5$ versus the Appendix U five-mode reference exponent $\kappa_{\Lambda,\mathrm{ref}} = 141.5$; Theorem U.8c qualifies that value as branch-dependent, while the corresponding four-mode branch value is $\kappa_{\Lambda,\mathrm{trans}} = 142$ on the corrected full-discrete branch of Theorem U.13b under its explicit false-vacuum spectral hypotheses)

**Weinberg Angle and Higgs Status:** The two rows have different dependency ledgers:
- Weinberg angle: $\sin^2\theta_W^{(0)} = 3/8$ from PCE isotropy requiring equal gauge kinetic stiffness **(Theorem T.14)**
- Higgs comparison: the external observed-input SM trajectory has $\lambda_{\mathrm{SM}}(\mu_\lambda)=0$; mapping the PU theory-space quartic to an SM boundary and then to $m_H$ requires a completed threshold record plus $\mathfrak H_T=(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}})$, so no current forward Higgs prediction follows from Theorem T.25 alone

**Phenomenological Success:**
- Hierarchy: $v \approx 246$ GeV (input) → test internal consistency
- $\sin^2\theta_W(M_Z)$: conditional on the lifted spectral threshold tuple $(\Delta_1,\Delta_2,\Delta_3)=(15.14,20.94,18.41)$ on $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$, one-loop SM RG evolution from the matching boundary $\sin^2\theta_W(\mu_G) = 3Z_2/(3Z_2+5Z_1)$ with $Z_i=1+\Delta_i/24$ yields the observed Z-pole range **(Theorem T.16, T.18)** on the validation run; Theorem T.78.5 proves that the current canonical ledger supplies no PU-internal spectral branch package deriving that tuple
- $m_H\approx125$ GeV as an external-RG validation value; a completed threshold record plus every member of $\mathfrak H_T$ must be fixed before it becomes a forward branch prediction
- Fermion mass ratios (Appendix T, Section T.25)

The electroweak hierarchy chain gives a model-conditional internal expression for the scale $v$ once the Appendix T determinant prescription is fixed. The abstract PU zero-slack statement concerns $\lambda_{\mathrm{PU}}(\mathfrak A_{\mathrm{PU}})$ on the accepted target-shift branch; it is not the observed-input SM crossing $\lambda_{\mathrm{SM}}(\mu_\lambda)=0$. A Higgs pole value near $125$ GeV remains an external-RG validation value until a completed threshold record and $\mathfrak H_T=(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}})$ are accepted before comparison. The quantitative gauge-threshold sector likewise remains validation-level in the canonical minimal ledger by Theorem T.78.5 unless an appended spectral branch is fixed and evaluated forward.


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
(Theorems U.15-U.16). Theorem U.8c strengthens the status statement: in the current Definition U.4 continuum action, the pure-coordinate dilatation tangent has strictly negative Hessian quadratic form and is not a zero mode; the theorem does not identify it as a Hessian eigenvector. The five-mode value therefore remains a reference branch rather than a theorem-level vacuum closure. The corresponding four-mode branch value is $\kappa_{\mathrm{trans}}=142$, and Theorem U.13b closes the corrected full discrete problem under the explicit false-vacuum spectral hypotheses stated there.

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

**Corollary K.9.3b (Bianchi-Consistent Effective-Fluid Form on a Nonstationary FLRW Interval).** On any time interval on which $H(t)\ne0$, the homogeneous background equations can be written as
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

The exclusion of singularities established by Definition K.5.1, Theorem K.5.1, Lemmas K.5.2–K.5.3, Theorem K.5.4, and Corollary K.5.5 has a direct counterpart in quantum field theory: the exclusion of ultraviolet divergences. Both phenomena arise from extrapolating continuum descriptions beyond their domain of validity, and both are resolved by the same information-theoretic bounds.

**Definition K.10.1 (Operational Observable).** A quantity $\mathcal{O}$ is an operational observable if for every target precision $\epsilon>0$ there exists an MPU-admissible protocol $\mathcal{P}_\epsilon$ (i.e., a finite physically implementable procedure using the allowed interaction/update dynamics, including $\mathcal{E}_N$ updates of Definition 27) that estimates $\langle\mathcal{O}\rangle$ to within $\epsilon$ and uses finite resources, i.e. it has finite predictive complexity and hence finite cost rate:
$$
R(C_P(\mathcal{P}_\epsilon)) + R_I(C_P(\mathcal{P}_\epsilon)) < \infty,
$$
where $R,R_I$ are the resource cost functions (Definition 3).

**Lemma K.10.2 (Operational Finiteness).** If $\mathcal{O}$ is an operational observable (Definition K.10.1), then its operational expectation value $\langle\mathcal{O}\rangle$ is finite. In particular, no MPU-admissible finite-resource protocol can certify $\langle\mathcal{O}\rangle=\infty$.

*Proof.* By Definition K.10.1, for $\epsilon=1$ there exists an MPU-admissible finite-resource protocol $\mathcal{P}_1$ producing an estimate within additive error $1$ of $\langle\mathcal{O}\rangle$. If $\langle\mathcal{O}\rangle$ were infinite, no finite real-valued estimate could satisfy an additive-error bound, contradicting the definition. Hence $\langle\mathcal{O}\rangle$ is finite. ∎

**Definition K.10.3 (MPU Wavenumber, Momentum, and Energy Scales).** Define
$$
k_{\mathrm{MPU}}:=\delta^{-1},\qquad p_{\mathrm{MPU}}:=\hbar k_{\mathrm{MPU}},\qquad E_{\mathrm{MPU}}:=cp_{\mathrm{MPU}}.
$$
For ordinary wavelength $\lambda=2\pi/k$, the condition $k>k_{\mathrm{MPU}}$ is equivalent to $\lambda<2\pi\delta$. For reduced wavelength $\bar\lambda:=1/k$, it is equivalent to $\bar\lambda<\delta$. These are intrinsic comparison scales; treating them as a hard dynamical cutoff requires a separately certified lattice/dispersion realization.

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

*Proof.* Fix any finite-resource MPU instantiation or protocol $\mathcal P$ on a bounded operational domain. By the finite-resource hypothesis itself, it uses finitely many update cycles and finitely many finite-dimensional channels; no universal lower update duration is needed for this step. Every channel on a $d_0$-dimensional input has finite classical capacity $C_{\max}\le\ln d_0$; Theorem E.2 sharpens this inequality on the refresh/minorization branch. Hence the total distinguishability budget of $\mathcal P$ is bounded by some finite number
$$
B(\mathcal P)<\infty.
$$
Equivalently, the number of mutually distinguishable alternatives that can be selected, stored, transmitted, or erased by $\mathcal P$ is at most $\exp(B(\mathcal P))$.

If $\mathfrak C$ were instantiated exactly by that finite resource object, then the same physical instantiation would have to support the distinctions needed for every resolution $\nu>0$. Since $\ln N_{\mathfrak C}(\nu)\to\infty$, choose $\nu$ such that
$$
\ln N_{\mathfrak C}(\nu)>B(\mathcal P).
$$
Then $N_{\mathfrak C}(\nu)>\exp(B(\mathcal P))$, contradicting the finite distinguishability bound. The same conclusion follows from Landauer accounting: selecting or erasing one alternative among $N_{\mathfrak C}(\nu)$ alternatives costs at least $\ln N_{\mathfrak C}(\nu)$ nats, which cannot be absorbed by a fixed finite-resource instantiation as $\nu\to0$. Therefore exact continuum structure is not PU-admissible as physical ontology; only finite-resolution approximants or closures carry operational content. ∎

**Theorem K.10.4 (Conditional Effective-Cutoff Interpretation).** Let $\mathcal A_{\mathrm{phys}}(\mu)$ be an operational observable at external scale $\mu$. Its operational value is finite. The spacing $\delta$ defines the comparison scales
$$
k_{\mathrm{MPU}}=\delta^{-1},
\qquad
p_{\mathrm{MPU}}=\hbar\delta^{-1},
\qquad
E_{\mathrm{MPU}}=c\hbar\delta^{-1}.
$$
If a branch additionally supplies a microscopic lattice or bandlimit, a dispersion relation, a regulator, and a matching theorem controlling the residual error of registered observables, then its continuum representation may be treated as hard-cut off at the certified scales. Spacing and finite capacity alone do not imply that hard cutoff.

*Proof.* Lemma K.10.2 gives finiteness of every operational expectation. The three scales follow by substituting $k=1/\delta$, $p=\hbar k$, and $E=cp$. Hence
$$
k>k_{\mathrm{MPU}}
\Longleftrightarrow
\bar\lambda:=k^{-1}<\delta,
\qquad
p>p_{\mathrm{MPU}}.
$$
On the additional certificate branch, the lattice or bandlimit removes independent modes beyond its registered domain and the matching theorem transfers the regulated predictions to the retained observables. Without that hypothesis, the algebraic comparison scales impose no support condition on a continuum Fourier transform, so ordinary renormalization remains necessary. ∎

**Definition K.10.4a (Hadamard-Subtracted UV PCE Cost).** Let $U$ be a relatively compact normal neighborhood in the regular AQFT branch of Theorem F.10.2. Let $\omega_2$ be the two-point distribution of a quasifree local state on $U$, and let $H_U$ be the local Hadamard parametrix with the same antisymmetric commutator singularity. Define the Hadamard-subtracted remainder
$$
r_U:=\omega_2-H_U.
\tag{K.10.4a.1}
$$
Choose a countable family $\{Q_j\}_{j\ge1}$ of properly supported order-zero pseudodifferential cutoffs with compact base localization such that their elliptic sets cover $T^*(U\times U)\setminus0$. For every integer Sobolev order $m\ge0$, define the ordinary Sobolev norm
$$
N_{j,m}(r_U):=\lVert Q_jr_U\rVert_{H^m(U\times U)}.
$$
The compact base localization makes this a numerical norm, and elliptic coverage ensures that finiteness for every $j,m$ detects every nonzero wavefront direction.
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
| UV (QFT) | $\int_0^\infty d^4k$ | $C_{\max} \leq \ln d_0$, discrete $\delta$ |
| Strong-curvature (GR) | $\|R\| \to \infty$ | $S \leq A/(4G)$, discrete $\delta$ |

*Proof.* Both exclusions use three framework bounds:

(i) **Finite channel capacity:** A $d_0$-dimensional input has $C_{\max}\le\ln d_0=\ln8$. Theorem E.2 gives the strict inequality on the refresh/minorization branch. Specifying an infinite family of operationally distinguishable alternatives would require an unbounded total protocol budget, which no specified finite collection of such channels supplies.

(ii) **Holographic bound** (Theorem 49): $S \leq A/(4G)$. Information content scales with boundary area. Infinite density in finite volume violates this bound.

(iii) **Discrete substrate** (Appendix Q): $\delta/L_P = \sqrt{8\ln 2}$. The continuum manifold is an approximation valid for $\ell > \delta$. Extrapolation below this scale produces artifacts—curvature divergences in the strong-curvature regime, momentum integral divergences in the UV regime—with no operational content.

The parallel is structural: in both cases, the divergence signals breakdown of the continuum approximation below $\ell\sim\delta$, where no operationally admissible protocol can access additional independent degrees of freedom. ∎

**Corollary K.10.5a (Finite-Substrate Cutoff and Continuum-Exit Wall).** On the residual-budget, throughput-saturated, ideal-packing branch of Appendix Q, the MPU spacing is
$$
\delta=\sqrt{8\ln2}\,L_P
$$
and the corresponding invariant MPU momentum cutoff (consistent with Definition K.10.3) is
$$
\Lambda_{\mathrm{MPU}}
=
\frac{\hbar}{\delta}
=
\frac{m_Pc}{\sqrt{8\ln2}}.
$$

This cutoff is not an auxiliary regulator placed on top of an underlying continuum. It is the finite operational resolution of the MPU substrate. Consequently:

1. **No sub-cutoff continuum modes on the certified bandlimit branch.** With angular wavenumber $k$ and reduced wavelength $\bar\lambda:=1/k$, the momentum condition $p>\Lambda_{\mathrm{MPU}}=\hbar/\delta$ is equivalent to
   $$
   k>\delta^{-1}
   \qquad\Longleftrightarrow\qquad
   \bar\lambda<\delta.
   $$
   For ordinary wavelength $\lambda:=2\pi/k$, the equivalent condition is $\lambda<2\pi\delta$. On a branch carrying the ultraviolet lattice or bandlimit certificate of Theorem K.10.4, such modes are not independent retained degrees of freedom.

2. **Exit of the certified local curvature expansion.** On a branch satisfying Lemma K.5.3, let
   $$
   \|R\|_{\mathrm{fr},\delta}
   =\sup_{x\in U_\delta}\max_{a,b,c,d}|R_{abcd}(x)|
   $$
   in the declared parallel orthonormal frame. The sufficient Fermi-expansion certificate requires
   $$
   C_1\|R\|_{\mathrm{fr},\delta}\delta^2\ll1,
   \qquad
   C_2\delta^3\ll1.
   $$
   A trajectory along which $\|R\|_{\mathrm{fr},\delta}\to\infty$ exits this certificate at a finite value of the framewise curvature scale. No single Lorentzian scalar contraction is used as an equivalent tensor norm.

3. **Finite-area capacity wall.** For any finite-area boundary $S$, the retained exterior-accessible information throughput is bounded by the finite ND--RID channel capacity and the area-law channel density. Therefore a continuum extrapolation requiring infinitely many independent interior distinctions through finite $A(S)$ is not a physically certified PU state.

The resulting obstruction is a **continuum-exit wall**: classical continuum evolution cannot be operationally continued through a regime requiring sub-$\delta$ distinctions, infinite curvature, or infinite finite-area information density. The corollary does not by itself specify a smooth bounce or a post-wall successor state. Those require an additional finite MPU transition theorem.

*Proof.* The value
$$
\delta=\sqrt{8\ln2}\,L_P
$$
is Equation Q.18 on the residual-budget, throughput-saturated, ideal-packing branch. Definition K.10.3 then gives
$$
\Lambda_{\mathrm{MPU}}=\hbar/\delta.
$$

For item 1, Theorem K.10.3a states that exact continuum structures requiring uniformly refinable distinctions at arbitrarily small resolution are not physically instantiated by a finite-resource MPU object. Theorem K.10.4 applies this principle to continuum QFT observables: wavelengths below $\delta$, equivalently momenta above $\Lambda_{\mathrm{MPU}}$, are not independent operational degrees of freedom and can influence larger-scale observables only through the parameters of the effective description at the cutoff.

For item 2, Lemma K.5.3 states that in the manifold regime the continuum curvature tensor is operationally meaningful only when
$$
\|R\|\,\delta^2=O(1).
$$
If a continuum solution has $\|R\|\to\infty$, then since $\delta>0$ is fixed on the branch, there is a finite point along the trajectory at which $\|R\|\delta^2$ leaves the $O(1)$ regime. Beyond that point the manifold approximation is not certified.

For item 3, Theorem K.5.1 bounds predictive throughput by the number of effective boundary links times the finite per-link capacity. If the boundary satisfies the geometric hypotheses of Lemma E.5.1, that link count is finite and grows at most proportionally to area, so a finite-area boundary cannot transmit or certify infinitely many independent retained distinctions. The sharper coefficient of Theorem E.6 requires its density certificate; equality in Bekenstein–Hawking form additionally requires saturation, additivity, and calibration. Under the finite-link conclusion, the operational dichotomy of Theorem K.5.4 applies: the extrapolation reaches capacity saturation or exits the certified manifold regime.

Thus sub-cutoff continuum modes, curvature divergences, and finite-area infinite-information extrapolations are all excluded by the same finite-substrate mechanism. ∎

**Definition K.10.5b (MPU Diffusion Certificate).** A branch supplies an **MPU diffusion certificate** when it specifies finite response data
$$
\mathcal D_{\mathrm{MPU}}
=
(G_\delta,m,\Delta_{\mathrm{MPU}},K_\sigma)
$$
with the following components:

1. a finite or locally finite MPU graph or network $G_\delta$ with operational edge scale $\delta$;

2. a positive vertex or cell measure $m$;

3. a Markov or heat generator $\Delta_{\mathrm{MPU}}$ on retained scalar response classes, with the corresponding semigroup
   $$
   K_\sigma=e^{-\sigma\Delta_{\mathrm{MPU}}},
   $$
   where $\sigma$ is diffusion time with dimensions of length squared;

4. positivity preservation and mass conservation:
   $$
   K_\sigma f\ge0\quad\text{when }f\ge0,
   \qquad
   K_\sigma 1=1;
   $$

5. a return kernel
   $$
   P_\sigma(x,x)
   :=
   K_\sigma(x,x)
   $$
   defined with respect to $m$;

6. compatibility with the finite MPU propagation and locality bounds of Appendix E / Appendix F;

7. on continuum branches, a convergence statement identifying the mesoscopic limit of $\Delta_{\mathrm{MPU}}$ with a Laplace-type diffusion operator on the emergent regular manifold.

On such a branch, the local spectral dimension at probe scale $\ell$ is defined by
$$
D_s(x,\ell)
:=
-2
\left.
\frac{\partial\ln P_\sigma(x,x)}
{\partial\ln\sigma}
\right|_{\sigma=\ell^2}.
\tag{K.10.5b.1}
$$

If a spatial average over a finite region $U$ is required, define
$$
\overline D_s(U,\ell)
:=
-2
\left.
\frac{\partial}{\partial\ln\sigma}
\ln
\left(
\frac{1}{m(U)}
\sum_{x\in U}m_xP_\sigma(x,x)
\right)
\right|_{\sigma=\ell^2}.
\tag{K.10.5b.2}
$$

Without an MPU diffusion certificate, $D_s$ is not a PU-defined observable. A Lieb--Robinson or serialized-propagation bound supplies locality and finite signal speed; it does not by itself define a diffusion semigroup or a heat-kernel return probability.

**Theorem K.10.5c (Cutoff and Serialized Propagation Do Not Determine Spectral Dimension).** The intrinsic MPU cutoff
$$
\delta
$$
and the serialized propagation bound
$$
v_{\max}=\delta/\tau_{\min}
$$
do not determine the cutoff-scale spectral dimension.

More precisely, the data
$$
(\delta,\tau_{\min},v_{\max})
$$
together with nearest-neighbor locality or a Lieb--Robinson-type finite-propagation constraint are insufficient to derive a theorem-level value or interval such as
$$
D_s(\delta)\in[1,2].
$$

A theorem-level statement about $D_s(\ell)$ requires an MPU diffusion certificate in the sense of Definition K.10.5b.

*Proof.* The serialized propagation bound controls how quickly operational influence can cross MPU links. It is a causal or locality constraint. Spectral dimension, by contrast, is defined from the logarithmic scaling of the heat-kernel return probability
$$
P_\sigma(x,x).
$$
These are distinct data.

To see the underdetermination explicitly, choose the same microscopic spacing $\delta$ and minimum update time $\tau_{\min}$. Consider nearest-neighbor discrete-time random walks in which one step traverses one edge of length $\delta$ in one update time $\tau_{\min}$. Each model has the same serialized speed bound
$$
v_{\max}=\delta/\tau_{\min}.
$$
Because these lattices are bipartite, return probabilities vanish at odd times; the asymptotic comparison is taken along $n=2m$.

On a one-dimensional chain,
$$
P_{2m}(0,0)\sim c_1m^{-1/2},
$$
with $c_1>0$, so the spectral dimension is $D_s=1$.

On a four-dimensional hypercubic lattice with the same edge length and one-edge-per-update rule,
$$
P_{2m}(0,0)\sim c_4m^{-2},
$$
with $c_4>0$, so the spectral dimension is $D_s=4$.

Both examples obey the same cutoff scale and the same serialized nearest-neighbor propagation speed. They differ only in the diffusion generator / graph connectivity data. Therefore the cutoff and speed bound alone do not determine $D_s$.

Consequently, no theorem-level claim such as
$$
D_s(\delta)\in[1,2]
$$
follows from the current cutoff and propagation theorems alone. Such a claim requires the additional branch data specified in Definition K.10.5b. ∎

**Corollary K.10.5d (Continuum Spectral Dimension under a Quantitative Heat-Kernel Certificate).** Suppose a branch satisfies the operational-continuum package of Theorem 43.5, the regular-manifold closure hypotheses of Theorem 44a, and the four-dimensional tangent-cell selector of Theorem Z.11, and supplies an MPU diffusion certificate together with the quantitative diagonal heat-kernel estimate
$$
P_\sigma(x,x)=(4\pi\sigma)^{-2}[1+r_\delta(x,\sigma)]
$$
throughout $\delta^2\ll\sigma\ll L_{\mathrm{curv}}^2$, where $|r_\delta|\le1/2$ and
$$
|r_\delta(x,\sigma)|
+
\left|\sigma\partial_\sigma r_\delta(x,\sigma)\right|
\le
C\left(\frac{\sigma}{L_{\mathrm{curv}}^2}+\frac{\delta^2}{\sigma}\right).
$$
Then
$$
D_s(x,\sqrt\sigma)
=4+O\left(\frac{\sigma}{L_{\mathrm{curv}}^2}\right)
+O\left(\frac{\delta^2}{\sigma}\right).
$$

*Proof.* Taking logarithms gives
$$
\ln P_\sigma=-2\ln(4\pi\sigma)+\ln(1+r_\delta).
$$
Hence
$$
-2\frac{\partial\ln P_\sigma}{\partial\ln\sigma}
=4-\frac{2\sigma\partial_\sigma r_\delta}{1+r_\delta}.
$$
Because $|r_\delta|\le1/2$, one has $|1+r_\delta|^{-1}\le2$. The derivative bound therefore yields
$$
|D_s-4|
\le4C\left(\frac{\sigma}{L_{\mathrm{curv}}^2}+\frac{\delta^2}{\sigma}\right),
$$
which proves the result. ∎

**Remark K.10.5e (Status of Dimensional Flow and Bounce Claims).** Corollary K.10.5a proves a finite-substrate cutoff and continuum-exit wall. It does not prove a smooth bounce, nor does it specify the post-wall MPU successor dynamics.

Definition K.10.5b and Theorem K.10.5c show that spectral dimension is not determined by the cutoff alone. A scale-dependent spectral-dimension flow
$$
D_s(\ell)
$$
requires a branch supplying an explicit MPU diffusion certificate. Once such a certificate is supplied, Corollary K.10.5d gives the theorem-level continuum limit
$$
D_s\to4
$$
in the mesoscopic local heat-kernel window. The cutoff-scale endpoint
$$
D_s(\delta)
$$
and any monotone interpolation between $D_s(\ell\gg\delta)=4$ and $D_s(\delta)$ remain branch-level until the discrete MPU diffusion generator is explicitly computed.

Thus the theorem-level PU content is:

1. the cutoff
   $$
   \delta=\sqrt{8\ln2}\,L_P;
   $$

2. non-instantiation of sub-$\delta$ continuum modes;

3. finite-area capacity exclusion of operational singularities;

4. continuum exit at finite curvature scale
   $$
   \|R\|\delta^2=O(1);
   $$

5. the requirement of a diffusion certificate before any spectral-dimension endpoint can be claimed.

This is an operational finite-substrate result, not a metaphysical simulation postulate.

**Corollary K.10.6 (Certificate-Gated Divergent Complexity Cost).** On a declared task class carrying certificate $\mathfrak C_{B.2}$, let
$$
\delta_{\mathrm{SPAP}}:=\alpha_{\mathrm{SPAP}}-\alpha\in(0,1).
$$
Theorem 14 and Appendix B, Equation (B.5), give
$$
C_{\mathrm{uni}}(\delta_{\mathrm{SPAP}})
=\Omega\!\left(
\frac{\log(1/\delta_{\mathrm{SPAP}})}{\delta_{\mathrm{SPAP}}^2}
\right).
$$
Consequently $C_{\mathrm{uni}}(\delta_{\mathrm{SPAP}})\to\infty$ as $\delta_{\mathrm{SPAP}}\downarrow0$, so no finite-complexity system in that certified task class attains zero error margin.

*Proof.* By the meaning of the $\Omega$ bound, there are $c>0$ and $\delta_0\in(0,1)$ such that
$$
C_{\mathrm{uni}}(\delta)
\ge c\frac{\log(1/\delta)}{\delta^2}
$$
for $0<\delta<\delta_0$. Both $\log(1/\delta)$ and $\delta^{-2}$ diverge to $+\infty$ as $\delta\downarrow0$, so their positive product and hence $C_{\mathrm{uni}}$ diverge. ∎

**Theorem K.10.7 (Scope of the FRG-to-PCE Comparison).** Let $\Gamma_k$ be an effective average action satisfying the regulated FRG equation
$$
\partial_k \Gamma_k[\phi]
=\frac12\,\mathrm{STr}\!\left[(\Gamma_k^{(2)}[\phi]+R_k)^{-1}\partial_kR_k\right].
$$
This equation supplies a continuum coarse-graining flow. It does not by itself identify that flow with PCE minimization. Such an identification requires a scale-dependent map from retained MPU models to $\Gamma_k$, a declared PCE functional on its image, and a proof that the mapped flow is a descent or stationary flow of that functional. Likewise, identifying RG stationary data with PCE equilibria requires a proved correspondence between dimensionless RG beta functions and the PCE gradient.

*Proof.* The right-hand side of the FRG equation is determined by $\Gamma_k^{(2)}$ and the regulator $R_k$; it contains no occurrence of $C_P$, $\Delta$, or $\mathcal L_{\mathrm{PCE}}^{(k)}$. Therefore the differential equation alone imposes no variational identity involving those quantities. Near an RG scaling solution, relevance is determined by eigenvalues of the linearized dimensionless beta-function operator, including anomalous dimensions and operator mixing, not solely by canonical dimension. Consequently the FRG equation proves the coarse-graining statement, while every PCE identification requires the additional map and functional identity stated above. ∎

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

**Corollary K.10.8 (Conditional RG Universality).** Suppose a dimensionless RG flow has a hyperbolic scaling solution with a controlled eigenoperator decomposition and a stable manifold. Perturbations along irrelevant eigenoperators decay toward the infrared according to their full scaling exponents, including anomalous dimensions, while relevant directions require a finite set of macroscopic coordinates. This gives the usual conditional universality statement. Interpreting that decay as PCE selection additionally requires the bridge data of Theorem K.10.7.

*Proof.* Linearizing the dimensionless beta functions about the scaling solution diagonalizes the flow into scaling fields $u_i$ satisfying $\partial_tu_i=y_i u_i+O(u^2)$. Along infrared flow, fields with the irrelevant sign of $y_i$ decay on the stable manifold, whereas the complementary fields parameterize departures from the universality class. The PCE reading is an additional identification because no PCE functional occurs in this linearized RG argument. ∎

**Theorem K.10.9 (Operational Parameter-Information Criterion).** Let $C_P(\mu,\epsilon)$ be the infimum of the predictive complexity of descriptions that reproduce a specified operational observable at scale $\mu$ to error at most $\epsilon$.

1. If $C_P(\mu,\epsilon_0)=+\infty$ for some prescribed $\epsilon_0>0$, no finite-resource protocol realizes that target within the chosen description class.
2. If $C_P(\mu,\epsilon)<\infty$ for every $\epsilon>0$ but $C_P(\mu,\epsilon)\to\infty$ as $\epsilon\to0$, each nonzero precision may remain operationally admissible; only an exact zero-error realization is excluded by this divergence.

*Proof.* Definition K.10.1 requires a finite-resource protocol for every prescribed nonzero error. Thus $C_P(\mu,\epsilon_0)=\infty$ contradicts admissibility at that particular target. In the second case, the definition is satisfied pointwise whenever each $C_P(\mu,\epsilon)$ is finite, even though no one finite protocol can attain the limiting value $\epsilon=0$. These are distinct quantifier statements and prove the two conclusions. ∎

**Theorem K.10.10 (Conditional Local-Horizon Thermodynamic Gravity Bridge).** Assume the operational-continuum package of Theorem 43.5 and the regular-manifold closure hypotheses of Theorem 44a, together with a Lorentzian continuation, supply a regular Lorentzian continuum branch carrying, at every point and null direction, a local Rindler horizon; a constant entropy first-variation density; the equilibrium Raychaudhuri expansion with vanishing initial expansion and shear; the local KMS temperature; the Clausius relation for every generator; a symmetric conserved MPU stress-energy source; and the area-density calibration of Appendix E. Then the Jacobson local-horizon argument yields the Einstein equation with a cosmological integration constant on each connected component. On the area-calibrated branch,
$$
G=\frac{\eta\delta^2c^3}{4\hbar\chi C_{\max}}.
$$
The operational continuum results allow the metric to be interpreted as a collective network variable; they do not decide whether its perturbations also admit an effective quantum-field description.

*Proof.* The linearized Raychaudhuri equation converts the horizon-area variation into an integral of $R_{\mu\nu}k^\mu k^\nu$ along each generator. The KMS temperature and Clausius relation equate that integral to the corresponding heat-flux integral of $T_{\mu\nu}k^\mu k^\nu$. Since the equality holds for every null $k^\mu$, the two symmetric tensors differ by a scalar multiple of the metric. Stress-energy conservation and the contracted Bianchi identity make that scalar the combination producing a componentwise constant cosmological term. The Appendix E area-density calibration sets the proportionality coefficient and gives the displayed expression for $G$. None of these tensor identities contains a statement excluding an effective quantization of perturbations. ∎

**Corollary K.10.11 (Scope of the Emergent-Metric Interpretation).** On the branch of Theorem K.10.10, the metric field equations admit a thermodynamic collective interpretation. This does not imply that metric perturbations lack an effective quantum-field description. Perturbative nonrenormalizability states that the Einstein-Hilbert interaction requires an unbounded tower of counterterms when treated as a fundamental ultraviolet theory; it remains compatible with a low-energy quantum effective field theory and with a microscopic MPU completion. Establishing the nature of that completion requires an independent dynamical theorem.

*Proof.* Theorem K.10.10 derives a conditional macroscopic equation and explicitly leaves the quantization status undecided. A collective variable can possess quantized effective excitations, so emergence does not imply non-quantizability. Nonrenormalizability constrains ultraviolet predictive closure of the Einstein-Hilbert expansion but does not select one microscopic completion. ∎

**Theorem K.10.12 (Independent Inputs in the Gravity-Bridge Package).** On the completed reset-support branch, Proposition E.2a gives
$$
C_{\max}\le\ln d_0-\ln2,
$$
with the stated residual-budget specialization. This capacity datum has the following distinct roles:

1. together with an ultraviolet lattice or bandlimit certificate, it bounds the independent distinctions available below the MPU resolution;
2. together with boundary-link density, horizon saturation, and the Appendix E area calibration, it gives the operational boundary entropy density $1/(4G)$;
3. together with the independent local Rindler/KMS, Clausius, Raychaudhuri, and conserved stress-energy-source hypotheses, it supplies the normalization used in the conditional Jacobson derivation.

Finite capacity alone does not imply items 2 or 3.

*Proof.* For item 1, the finite protocol budget bounds the number of independently resolvable alternatives, while the ultraviolet certificate identifies sub-resolution continuum modes with those alternatives. For item 2, boundary saturation gives
$$
S=\frac{\chi C_{\max}}{\eta\delta^2}A,
$$
and the area calibration defines the coefficient as $1/(4G)$ in the manuscript's unit convention. For item 3, Theorem K.10.10 shows that the KMS/Clausius/Raychaudhuri/source package yields the tensor equation; the capacity-area relation sets its gravitational normalization. Since those thermodynamic and geometric hypotheses are not consequences of a channel-capacity inequality, the three roles form a package of independent inputs rather than one inference from capacity. ∎

**Corollary K.10.13 (Status of Gravitational Waves).** The framework predicts:

(i) Gravitational waves are collective excitations of MPU network geometry—propagating disturbances in the relational structure of the network.

(ii) At wavelengths $\lambda \gg \delta$, these excitations satisfy the linearized Einstein equations and exhibit massless spin-2 tensor structure, consistent with observations.

(iii) The framework does not require a fundamental graviton: the spin-2 behavior at $\lambda \gg \delta$ is a property of collective perturbations of the emergent metric. If a "graviton" description is used, it is an effective quasiparticle language for those collective modes rather than a fundamental degree of freedom.

(iv) On the finite-substrate cutoff branch of Theorem K.10.4 and Corollary K.10.5a, wavelengths $\lambda\sim\delta\approx2.355\,L_P$ lie at the boundary of the operational continuum description.

*Proof.* Linearizing an emergent metric $g_{\mu\nu}=\eta_{\mu\nu}+h_{\mu\nu}$ about Minkowski space yields the standard linearized tensor equations only on a branch that has already established the Einstein dynamics and the required smooth-background approximation. Theorem K.10.4 and Corollary K.10.5a identify $k\sim\Lambda_{\mathrm{MPU}}$ as the conditional effective-cutoff boundary. They do not by themselves determine whether an effective quasiparticle description persists at that boundary. ∎

**Proposition K.10.14 (Conditional Cutoff-Matching Status of Parameters).** In a regulated QFT, bare parameters depend on the regulator, cutoff, and renormalization prescription; they may diverge, vanish, or approach finite values as the cutoff is removed. On a PU branch carrying the ultraviolet lattice or bandlimit and matching certificate of Theorem K.10.4:

1. coefficients assigned above the certified operational bandlimit are not independent retained observables;
2. coefficients at the matching scale are finite only if the microscopic action and matching theorem establish finiteness;
3. parameters below the matching scale encode operational predictions together with threshold and truncation residuals.

*Proof.* The ultraviolet certificate specifies the microscopic regulator and the map from its finite data to the lower-scale effective action. Modes removed by that map can affect low-energy observables through matched Wilson coefficients, so they cannot simply be declared consequence-free. Finiteness and predictive meaning therefore follow from the certificate's microscopic parameter bounds and matching estimates, not from the existence of a length scale alone. ∎

**Remark K.10.15 (Distinction from Wilsonian Effective Field Theory).**

Third, PU records distinct conditional objects: a refresh-branch mixing gap, a Leech norm gap, and an action-per-update floor. None alone is a Yang--Mills particle mass gap. Converting the norm gap to an absolute physical gap requires the confinement/spectral bridge, $\mathfrak B_{mass}$, and norm--information calibration; this claim is separate from the Wilsonian continuum question.



**Connection to Horizon Thermodynamics.** On the complete protocol branch of Theorem Q.0.10 and Corollary Q.0.10c, with the declared local acceleration or surface-gravity identification, the conditional Rindler-Landauer rate is
$$
\dot{N} = \frac{a}{2\pi c}.
$$
The black-hole specialization additionally uses Theorem Q.0.12; an MPU-substrate interpretation requires a separate clock-and-scale identification. Theorem Q.0.15 places this rate beside the Bekenstein-Hawking entropy, horizon-area calibration, and gravitational coupling on their joint hypothesis package. It is a compatibility ledger.

Application of finite information bounds to ultraviolet physics separately requires the ultraviolet lattice or bandlimit and matching certificate of Theorem K.10.4. The horizon protocol and gravity-bridge hypotheses do not supply that certificate.

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
a=\frac{2}{3},\qquad b=-\frac{5}{3}.
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
where
$$
D(\rho\Vert\sigma)
=
\begin{cases}
\operatorname{Tr}\rho(\log\rho-\log\sigma),
&\operatorname{supp}\rho\subseteq\operatorname{supp}\sigma,\\
+\infty,&\text{otherwise}.
\end{cases}
$$
Equality and Petz-recovery statements below are made only for pairs with finite relative entropy and a finite common value of $C_{\mathrm{pred}}$.

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

**Corollary K.10.18c (Endpoint Central-Datum Inequality).** Suppose an RG branch has conformal endpoints $k_1$ and $k_2$, and the declared normalization identifies $C_{\mathrm{pred}}(k_i)$ with central data $c_i$ at those endpoints. Then
$$
c_2\le c_1.
$$
Calling $C_{\mathrm{pred}}(k)$ the standard central function at intermediate scales requires a separate all-scale identification.

*Proof.* Theorem K.10.18b gives $C_{\mathrm{pred}}(k_2)\le C_{\mathrm{pred}}(k_1)$. Substituting the two endpoint identifications gives $c_2\le c_1$. No premise identifies the intermediate values with a conventional central function, so no stronger conclusion follows. ∎

**Corollary K.10.18d (Equality Conditions for Predictive RG Monotonicity).** Suppose
$$
C_{\mathrm{pred}}(k_2)=C_{\mathrm{pred}}(k_1)<\infty.
$$
If both suprema are attained, then at least one fine-scale maximizing pair maps to a coarse-scale maximizing pair and has zero data-processing loss. Petz sufficiency for the entire branch family is sufficient, but not necessary, for equality. Without attainment, equality yields a sequence of preimage pairs whose coarse values approach the common supremum and whose data-processing loss tends to zero.

*Proof.* Let $(\rho'_*,\sigma'_*)$ attain the coarse supremum. Since $\mathcal S_{k_2}=\mathcal E(\mathcal S_{k_1})$, choose preimages $\rho_*,\sigma_*\in\mathcal S_{k_1}$. Data processing and equality of the suprema give
$$
C_{\mathrm{pred}}(k_1)
=D(\rho'_*\Vert\sigma'_*)
\le D(\rho_*\Vert\sigma_*)
\le C_{\mathrm{pred}}(k_1).
$$
Both inequalities are equalities. Thus the preimage pair is fine-scale maximizing and has zero loss; equality in data processing for that pair is equivalent to pairwise Petz recovery. Without attainment, choose coarse pairs with values tending to the coarse supremum and choose preimages. If $D_n'$ and $D_n$ are their coarse and fine relative entropies, then
$$
0\le D_n-D_n'\le C_{\mathrm{pred}}(k_1)-D_n'\longrightarrow0,
$$
which proves the sequence statement. ∎

**Common-monotone comparison protocol.** Identifying PCE descent, geometric flow, generalized entropy, and RG flow with one scalar monotone requires maps from one state space, equality or stated monotone reparameterization of the functionals, compatible flow orientation, and residual control. Convergence of the scalar alone proves neither state convergence, a unique fixed point, nor a finite EFT operator basis.

**Common-monotone comparison protocol.** A claim that PCE descent, geometric flow, generalized entropy, and RG flow are representations of one scalar monotone must provide: maps from a common state space into each sector; equality or a stated monotone reparameterization of the four functionals on the image; control of every additional cost term; compatible flow parameters and orientations; and residual bounds. Without these entries, data processing proves only (K.10.24).

Monotone convergence of the number $C_{\mathrm{pred}}(k)$ does not imply convergence of the state, existence or uniqueness of an RG fixed point, or finiteness of the EFT operator set. Such conclusions require, respectively, a topology and precompact orbit, an invariance or LaSalle-type condition, uniqueness data, and a separate operator-basis/power-counting theorem. Finite operational distinguishability at fixed resolution gives a finite atlas of response cells, not generic renormalizability.

## K.11 Outlook and Future Directions

The Predictive Universe framework has successfully resolved several fundamental puzzles through rigorous derivations. This section summarizes established results, identifies active development areas, and outlines priority theoretical work and experimental validation strategies.

### K.11.1 Established Results

The following ledger mixes exact mathematical results with branch-qualified numerical model outputs; each row inherits the status of its cited source.

| Result | Value | Source |
|:-------|:------|:-------|
| Fine-structure constant | $\alpha^{-1}_{0}=137.03609205522863\ldots$; diagnostic-only hypercharge-recoil (operator realization open) branch $\alpha^{-1}_{\mathrm{cand}}=\alpha^{-1}_{0}+R_{\alpha}^{YR\perp}=137.03599917753023\ldots$; passive-complement downgrade interval $[137.03599917502362\ldots,137.03599917878353\ldots]$ | Appendix Z, Theorems Z.24-Z.26; Definition Z.27.11a; Theorem Z.27.11j.1; Definition Z.27.11k.16a; Theorem Z.27.11k.16b; Corollary Z.27.11k.16c; Definition Z.27.11k.12; Theorem Z.27.11k.20; Corollary Z.27.11k.21; Corollary Z.27.11k.21.1 |
| Electroweak scale | $\kappa_{EW}=38.5$ on the stated structural branch; $v\approx252$ GeV on the model-conditional $A_{EW}$ determinant branch | Appendix T, Theorem T.5, Theorem T.29.2, and Corollary T.29.1 |
| Weinberg angle | $\sin^2\theta_W^{(0)} = 3/8$ | Appendix T, Theorem T.14 |
| Higgs mass | External-RG validation value near $125$ GeV; a completed threshold record plus accepted $\mathfrak H_T$ is currently open | Appendix T, Definition T.25.2; Theorems T.26, T.28, and T.79.2 |
| Fermion mass ratios | Retrospective leading-order lepton diagnostic | Appendices R and T; not an independent prediction until the flavor ledger is fixed before comparison |


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

**Problem-of-time protocol.** An event count is a physical clock only after a constrained model supplies a phase-space clock $T$, monotonicity on the branch, and gauge-invariant relational observables $O(T)$. A discrete count does not remove the Hamiltonian constraint.

**Cosmological-measure protocol.** State the sample space, event algebra, normalized measure or regulator, cutoff-removal rule, conditioning data, and observer-selection function, and prove regulator independence at the claimed resolution.

**Cross-domain recurrence certificate.** Fix
$$
\mathfrak C_{\mathrm{cross}}=
\bigl(X_i,X_*,F_i,\mathcal O_i,\mathcal O_*,J_i,J_*,R_i,\chi_{\mathrm{lock}}\bigr)_{i=1}^n.
$$
Transporting optimality requires the common optimum to lie in $F_i(X_i)$ and $J_i$ to be the pullback, or a declared strictly monotone reparameterization, of $J_*$ on that image. Injectivity on the retained response quotient is additionally required to transport uniqueness. Shared numbers or structures without these maps establish analogy only.

**Problem-of-time protocol.** An event count may be proposed as a physical clock only after the constrained model supplies a phase-space function $T$, proves the required monotonicity on the chosen branch, and shows that the relational observables $O(T)$ are gauge invariant or satisfy the appropriate Dirac condition. A discrete count can itself be reparametrization invariant and does not remove the Hamiltonian constraint. SPAP excludes specified internal total self-models; it does not exclude the external mathematical state used to formulate a constrained theory.

**Cosmological-measure protocol.** A single realized history does not by itself define probabilities for regions or observations within that history. A measure proposal must state its sample space, event algebra, normalized measure or regulator, cutoff-removal rule, conditioning data, and observer-selection function, and must prove regulator independence at the claimed resolution. Gleason--Busch probabilities on quantum effects do not supply those cosmological entries. Fluctuation-observer claims require an independently defined production and observation model.

**Cross-domain recurrence certificate.** A common discrete structure appearing in several domains may be compared through a finite certificate
$$
\mathfrak C_{\mathrm{cross}}
=
\bigl(
X_i,F_i,\mathcal O_i,\mathcal O_*,R_i,\chi_{\mathrm{lock}}
\bigr)_{i=1}^n,
$$
where $X_i$ is the domain object, $F_i:X_i\to X_*$ is an explicit reduction to one common problem, $\mathcal O_i$ and $\mathcal O_*$ are declared response families, and $R_i$ bounds failure of response preservation. Uniqueness or optimality can be transported back to a domain only when the relevant $F_i$ is injective on the retained response quotient. Shared integers, codes, lattices, or optimization language without these maps establish analogy, not identity.

**Optional research-program register.**

| Topic | Retained form | Status |
|---|---|---|
| Source superposition | competing non-exhaustive channels | protocol |
| Actualization calorimetry | certified reset-support heat floor | conditional identity |
| Hubble comparison | locked galactic-to-FRW projection | certificate-gated diagnostic |
| Coupling drift | common-coordinate response fit | certificate-gated diagnostic |
| Horizon step | entropy/area/energy conversion | conditional identity |
| Network emulator | response-faithful implementation test | protocol |
| Exponent ledger | named-branch arithmetic | conditional identity |
| Cosmic stabilizer | stabilizer-to-cosmology bridge record | hypothesis |
| Spatial SPAP | boundary-factorization rate bound | conditional inequality |
| Unified monotone | common-state-space comparison | protocol |
| Reciprocity | Hessian symmetry with physical bridge | conditional identity |
| Measurement independence | independent causal-statistical condition | guardrail |
| Action--entropy | named-cycle exchange law | guardrail |
| Problem of time | constrained-clock construction | open protocol |
| Cosmological measure | explicit measure/regulator construction | open protocol |
| Renormalizability | topology, invariance, and operator-basis gates | guardrail |
| Cross-domain recurrence | response-preserving reduction certificate | protocol |
| Verify--generate | instance/total-domain distinction | guardrail |
| Quantum reconstruction | typed operational-axiom certificate | certificate boundary |
| External AQFT comparison | non-load-bearing comparison | literature context |

The register reports status only; it does not promote any row to theorem level.

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
- Registry-entered Thomson branch $\alpha^{-1}_{\mathrm{cand}}=\alpha^{-1}_{0}+R_{\alpha}^{YR\perp}=137.03599917753023\ldots$, with passive-complement downgrade interval $[137.03599917502362\ldots,137.03599917878353\ldots]$ if the seventh-order source is weakened
- $\sin^2\theta_W$ and $m_H$ consistency checks with RG evolution to high precision

**Particle Physics:**
- - Fermion hierarchy model: preregister the root labels, continuous coefficients, scheme, and remainder interval, then test only held-out mass data


- Three-generation structure from topological constraints (Appendix R)

**Consciousness and Complexity:**
- Consciousness Complexity scaling (Section 13): compare a preregistered activity observable $A(N)$ with a model $A(N)=aN^\beta$ only after specifying the size variable $N$, network ensemble, observation window, scaling range, estimator, covariance, and uncertainty interval; the framework does not derive the numerical exponents $0.8$ and $0.6$ without such a model
- CC threshold behavior and endpoint-bias bound $\alpha_{CC,max} < 0.5$

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

Finite channel capacity is one input shared by several conditional branches, not a sufficient premise for their conclusions. The strict inequality $C(\mathcal E_N)<\ln d_0$ requires the refresh/minorization hypothesis of Theorem E.2. The following additional records are independent:
- The operational UV cutoff of Theorem K.10.4 requires finite spacing and its finite-substrate interpretation.
- The holographic entropy bound requires geometric boundary-link control and the Theorem E.6 branch; saturation and normalization require its extra certificates.
- Einstein's equation requires the local-equilibrium horizon, Clausius, Unruh, conservation, and metric-continuum hypotheses of the gravity bridge.
- Theorem 39 supplies an endpoint reliability threshold on its bounded-bias branch; exact causal compliance is the separate Theorem 39c branch.
- The spacetime-dimension result of Theorem Z.11 retains its lattice, representation, and selection certificates.

The framework therefore supplies a conditional dependency stack with a recurrent finite-capacity input. It does not derive the five conclusions from the capacity inequality alone.