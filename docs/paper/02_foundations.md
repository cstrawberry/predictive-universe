# 2 Foundational Principles: Prediction, Optimization, and Resources

This section establishes the core axioms and definitions underpinning the Predictive Universe (PU) framework. Appendix P provides the epistemic motivation for the chosen axiom set: starting from the Cogito as a minimal self-verifying process, we model its operational essence as prediction and treat this as the primitive from which further structure is derived. Appendix P.1 summarizes the forcing logic and the epistemic status stratification (certainty, theorem, empirical anchor, and framework selection) used throughout the paper. The Cogito's self-verification structure—the binary distinction between epistemic certainty (the thinking self exists) and epistemic uncertainty (all else)—provides an intrinsic distinction-making substrate that supports Boolean operations (NOT, AND, OR) as operational constructions (Propositions A.0.1–A.0.2). This grounds the framework in the operational principles governing systems that engage in adaptive prediction, constrained by physical resources and fundamental logical limitations. Two complementary theorems establish the framework's logical boundaries: the **Self-Referential Paradox of Accurate Prediction** (SPAP, Theorem 10) proves that no predictor can accurately predict its own prediction-contingent behavior, while **Reflexive Undecidability** (RUD, Theorem A.2.3) proves that no system can decide all statements about its own behavior within bounded resources. Together, SPAP and RUD provide dual foundations for Logical Indeterminacy (Definition 12). We define the central challenge driving these systems—the Prediction Optimization Problem (POP)—and formalize the concepts of information and knowledge from a functional, prediction-centric perspective. We then introduce the crucial concept of Predictive Physical Complexity ($C_P$) as the theoretical resource cost, and its operational proxy ($\hat{C}_v$). We justify the necessary alignment between these two measures through dynamical principles. Finally, we define the resource cost functions and operators derived from this complexity measure.

**2.1 Axiom 1 (Ax 1): The Prediction Optimization Problem (POP)**

Adaptive systems operating within uncertain environments face the fundamental challenge of optimizing the predictive quality ($Q$) of their internal state or model concerning aspects of their internal and external environment relevant to their continued functioning and goals. This optimization aims to maximize the expected improvement in predictive quality ($\Delta Q$). This improvement is quantified by metrics reflecting reduced uncertainty (e.g., decreased entropy), enhanced accuracy (e.g., increased log-likelihood, reduced prediction error), or reduced Bayes risk, achievable through information processing, interaction, and adaptation. This ongoing optimization is performed subject to limited physical and computational resources, including available energy, processing time, and achievable system complexity ($C_P$). This fundamental, resource-constrained drive to enhance predictive capability is termed the Prediction Optimization Problem (POP).

For concreteness, all predictive-quality functionals $Q$ are assumed measurable and bounded below on the feasible state space so that expectations and improvements $\mathbb{E}[\Delta Q]$ are well-defined.

**2.2 Axiom 2 (Ax 2): Predictive Capacity Foundation**

To generate predictions that are demonstrably better than chance (i.e., to achieve a positive expected predictive improvement, $\Delta Q > 0$, relative to a baseline random predictor), a system must possess an internal model ($M_t$) capable of capturing and exploiting discoverable regularities within the relevant data streams. The capacity for effective prediction relies fundamentally on the system's ability to leverage Information (Definition 1) via its internal modeling processes ($M_t$) to achieve a positive expected improvement in predictive quality with respect to future states pertinent to its operational goals (Axiom 1).

**2.3 Information and Prediction-Based Knowledge**

We define information and knowledge not intrinsically, but functionally in terms of their role within predictive systems operating under POP.

**2.3.1 Definition 1 (Def 1): Information**

Within the Predictive Universe framework, information is defined functionally as any physically instantiated (I), substrate-independent (S) pattern or correlation structure (P) that, when processed by a suitable predictive system (E), has the objective potential to yield a positive expected improvement in predictive quality (F) concerning states relevant (R) to that system's Prediction Optimization Problem (POP, Axiom 1). A suitable system must possess sufficient complexity ($C \ge K_0$, the Horizon Constant; see **Section 5, Theorem 15**) and an appropriate model class $\mathcal{M}$.

*Elaboration:*
*   **(P) Pattern:** A discernible structure, regularity, or deviation from randomness that allows for distinctions relevant to prediction.
*   **(I) Physical Instantiation:** The pattern must be embodied in a physical configuration or process, linking it to physical dynamics, resource costs, and thermodynamic constraints.
*   **(S) Substrate Independence:** The functional content of the pattern (its potential predictive utility) is, in principle, substrate-independent and can be represented on different physical substrates.
*   **(E) System Enablement:** The potential of the pattern to serve as information is relative to a system capable of detecting and processing it to improve its predictions ($C \ge K_0$, $M_t \in \mathcal{M}$).
*   **(F) Functional Potential.** Let $\mathcal{M}$ denote the admissible class of inference/prediction procedures available to the system under the POP constraints (energy, time, and complexity). The pattern constitutes information if there exists a procedure $M\in\mathcal{M}$ and a measurable feature/event $E$ (representing the pattern) in the relevant $\sigma$‑algebra with nonzero probability such that the expected improvement in predictive quality, conditioned on utilizing $E$ via $M$, is strictly positive:
    $$
    \mathbb{E}\big[\Delta Q \mid E;\, M\big] > 0.
    $$
    Equivalently, the definition requires the existence of an admissible procedure and an operationally relevant input distribution under which the system achieves an overall positive expected improvement $\mathbb{E}[\Delta Q]>0$.
*   **(R) Relevant States:** The relevant states are determined contextually by the system's operational goals as defined by its specific POP, namely those state distinctions whose prediction can materially improve predictive quality under the system's operative resource constraints.

In essence, information is any physically grounded pattern exploitable by a predictive system to achieve measurable improvements in predictive quality relevant to its adaptive goals.

**2.3.2 Definition 2 (Def 2): Prediction-Based Knowledge**

A system possesses knowledge to the extent that its internal models ($M_t$) can effectively process available information (Definition 1) to generate predictions yielding quantifiable predictive improvement ($\Delta Q > 0$) with respect to variables relevant to its POP. Knowledge is the realized capacity, embodied in the system’s structure and dynamics, for effective prediction. It facilitates measurable improvements in predictive quality (e.g., reduced entropy $\Delta H < 0$, reduced KL divergence $\Delta D_{KL} < 0$, reduced Bayes risk, or increased operational performance). It represents the accumulated, functional residue of successful adaptation cycles that have encoded discovered regularities into the system’s predictive machinery.

**2.4 Predictive Physical Complexity ($C_P$) and Operational Measures**

Having established the foundational role of prediction and optimization, we now introduce the critical concept of complexity. Within the PU framework, complexity quantifies the minimal resources required to physically instantiate the structures and processes enabling adaptive prediction. We first define the theoretical measure, Predictive Physical Complexity ($C_P$), through a rigorous hierarchical approach designed to avoid circularity. We then introduce its operational proxy, the Hermitian operator $\hat{C}_v$. We justify the necessary functional correspondence between the theoretical measure and the operational proxy by demonstrating that this alignment is dynamically enforced by the framework's core optimization principles. This provides the foundation for defining physically grounded resource costs.

**2.4.1 Defining Predictive Physical Complexity ($C_P$)**

To define Predictive Physical Complexity ($C_P$) without presupposing the physical laws we aim to derive, we employ a non-circular hierarchical approach. Each level incorporates only previously established or framework-independent constraints. The definition conceptually proceeds through levels:
*   **Level 0 ($C_{P,0}$):** Quantifies minimal *algorithmic* complexity (e.g., Kolmogorov complexity relative to a fixed Universal Turing Machine $U$ within model class $\mathcal{M}$) to specify an abstract process $P \in \mathcal{M}$ transforming a reference microstate $\mu_{ref}$ to a target microstate $\mu$ that enables prediction significantly better ($\epsilon_{acc} > 0$) than random chance, using only finite abstract computational resources. This level relies only on computability theory [Li & Vitányi 1997].
*   **Level 1 ($C_{P,1}$):** Refines $C_{P,0}$ by restricting allowed processes $P$ to those compatible with a minimal, framework-independent set of base physical constraints $\mathcal{L}_{phys}^{(base)}$. These constraints are treated as properties of the physical *substrate* upon which any computation must be instantiated. They include fundamental conservation laws (e.g., of energy) and the **statistical nature of thermodynamics**. This means the substrate is governed by statistical mechanics, such that processes which would systematically violate the statistical Second Law (e.g., a perpetual motion machine of the second kind) are not physically realizable programs. 
*   **Level n ($C_{P,n}$, $n \ge 2$):** Further refines $C_{P,n-1}$ by incorporating additional physical constraints (such as the thermodynamic cost $\varepsilon \ge \ln 2$ derived in **Theorem 31** and the reflexivity constraint $\kappa_r > 0$ from **Theorem 33**, which are established later in the framework) that are themselves derived independently using only constraints from levels $n-1$ and below applied to the analysis of MPU dynamics.

Here $\mu$ denotes a microstate. Each refinement level $n$ specifies an admissible program set $\mathcal{M}_n(\mu)\subseteq\mathcal{M}$ consisting of programs $P$ that (i) transform a reference microstate $\mu_{ref}$ into $\mu$ and (ii) obey the constraint set up to level $n$. Define
$$
C_{P,n}(\mu):=\inf_{P\in\mathcal{M}_n(\mu)} K(P),
$$
with the convention $C_{P,n}(\mu)=\infty$ if $\mathcal{M}_n(\mu)=\emptyset$. For physically realizable $\mu$ (Definition 17), $\mathcal{M}_n(\mu)$ is non-empty for all sufficiently large $n$. The final, self-consistent definition of $C_P$ is the limit of this iterating refinement:
$$
C_P(\mu)\;=\;\lim_{n\to\infty} C_{P,n}(\mu) \quad \text{(1)}
$$

This definition ensures $C_P$ is well-defined and incorporates all emergent physical constraints without circularity. For physically realizable $\mu$ (Definition 17), the hierarchy $\{C_{P,n}(\mu)\}$ is monotone non-decreasing and admits a finite uniform upper bound given by any witness admissible construction of $\mu$ under the full constraint set; hence the limit exists and is finite.

Remark: Level 0 uses algorithmic complexity $K(P)$ as a non-circular bookkeeping device. Exact integer invariants derived later (e.g., $K_0=3$ bits) are fixed by operational distinguishability and minimal register-size arguments expressed in the physically anchored capacity units $C_{cap}=\log_2 d_0$ (Convention 1), and therefore do not depend on the additive-constant ambiguity of $K(P)$ under changes of the reference universal machine.

**Lemma 1 (Convergence of Complexity Hierarchy):** The hierarchically defined sequence $\{C_{P,n}(\mu)\}$ converges to a finite limit $C_P(\mu)$ for any physically realizable microstate $\mu$.

*Proof.*

**Monotonicity:** Each refinement step $n \to n+1$ adds constraints to the physical laws that must be satisfied, so the admissible program set satisfies $\mathcal{M}_{n+1}(\mu)\subseteq\mathcal{M}_n(\mu)$. Since $C_{P,n}(\mu)$ is defined as an infimum/minimum of $K(P)$ over the admissible set, restricting the set cannot decrease the value; hence $C_{P,n+1}(\mu) \ge C_{P,n}(\mu)$ and $\{C_{P,n}(\mu)\}$ is monotonically non-decreasing.

**Boundedness:** Fix a physically realizable microstate $\mu$ (Definition 17). By definition, there exists at least one admissible construction program $P_{\mathrm{phys}}$ that realizes $\mu$ while obeying the full physical constraint set $\mathcal{L}_{phys}$ used in the hierarchy. Let $B_{\mu}:=K(P_{\mathrm{phys}})$ denote the Level 0 description complexity of such a witness program (within the fixed model class $\mathcal{M}$). Since $P_{\mathrm{phys}}$ satisfies all constraints, it is admissible at every finite refinement level $n$, hence $C_{P,n}(\mu)\le B_{\mu}$ for all $n$. Thus $\{C_{P,n}(\mu)\}$ is bounded above by the finite constant $B_{\mu}$.

**Convergence:** By the monotone bounded sequence theorem, the limit $C_P(\mu) := \lim_{n\to\infty} C_{P,n}(\mu)$ exists and is finite. QED

**Convention for Information Capacity in Quantum Systems:** For quantum systems, such as the Minimal Predictive Units (MPUs) hypothesized to be fundamental constituents of reality (Definition 23), the maximum information capacity required to specify their distinguishable states is determined by the dimensionality $d_0$ of the MPU's Hilbert space $\mathcal{H}_0$ (Proposition 4). We adopt the standard quantum information convention for this capacity $C_{cap}$ (measured in bits):
$$
C_{cap} = \log_2 d_0 \quad \text{(Convention 1)}
$$
Equivalently, in natural-log units (nats),
$$
\ln d_0 = (\ln 2)\,C_{cap}.
$$
This establishes that a system with a Hilbert space of $d_0$ dimensions has a state-space capacity of $C_{cap}$ bits (or $\ln d_0$ nats), i.e., the maximum number of mutually orthogonal, operationally distinguishable configurations that can be encoded in a single-cycle internal state. This capacity is a structural constraint used to translate logical distinguishability requirements into Hilbert-space dimension bounds. In particular, the Horizon Constant $K_0$ (Theorem 15) lower-bounds the required capacity for SPAP-encodable predictive cycles, so any MPU-admissible implementation must satisfy
$$
C_{cap}=\log_2 d_0 \ge K_0 \quad \Leftrightarrow \quad d_0 \ge 2^{K_0}.
$$
Theorem 23 later yields $d_0 \ge 2^{K_0}=8$ for MPUs; at the PCE-Attractor, PCE selects the minimal saturating case $d_0=8$. The dynamical resource expenditure of prediction is tracked separately by $C_P$ and its operational proxy $\langle \hat{C}_v \rangle$ (Theorems 1–2), which need not be bounded by the single-state capacity.

This completes the non-circular foundation for $C_P$ needed for the subsequent emergence derivations.

**Remark on Irreversibility and the Arrow of Time:** It is critical to distinguish the minimal thermodynamic constraint assumed in Level 1 from the universal, dynamical Arrow of Time derived as a major conclusion of this framework (Appendix O).

*   **The Assumption:** We assume only that the physical substrate is governed by statistical mechanics. This is a passive *constraint* on physical realizability, reflecting a statistical tendency towards higher entropy in macroscopic systems. It does not, by itself, provide a universal, microscopic, forward-driving engine for time.

*   **The Derivation:** The framework later derives the **dynamical Arrow of Time** from the logic of prediction itself. The self-referential nature of the MPU's predictive cycle, when physically instantiated, is shown to necessitate a minimal, irreversible, per-operation thermodynamic cost ($\varepsilon \geq \ln 2$, Theorem 31). This ubiquitous $\varepsilon$-cost acts as a microscopic *ratchet*.

Statistical-mechanics input enters only as a background constraint on physically realizable processes at Level 1; the directional arrow of time is derived later from the SPAP-mandated irreversible update cost $\varepsilon \ge \ln 2$ acting as a microscopic thermodynamic ratchet (Appendix O).

**2.4.2 The Operational Complexity Proxy Operator ($\hat{C}_v$)**

Since the theoretical $C_P$ (Equation 1) is generally uncomputable, systems must employ a physically meaningful and accessible operational proxy within their dynamics. Essential properties required for such a proxy include: (1) Physical Cost Monotonicity (higher proxy value implies non-decreasing operational cost rate $\langle\hat{R}\rangle$), (2) Approximate Compositional Additivity (complexity of independent systems adds), and (3) Computational Accessibility (computable spectrum/projectors). Within the quantum setting emerging in the PU framework (Section 8), quantum circuit complexity provides a canonical representative of this admissible proxy class. We therefore use a (coarse-grained) circuit-complexity observable, defined up to affine rescaling within the admissible family, as the operational proxy.

**Theorem 1 (Operational Complexity Operator $\hat{C}_v$):** Fix an admissible coarse-grained proxy family for MPU $v$ at the chosen operational resolution, represented by mutually orthogonal projectors $\{\hat P_d\}_{d=0}^{d_{\max}}$ on $\mathcal{H}_v$ satisfying
$$
\hat P_d\hat P_{d'}=\delta_{dd'}\hat P_d,
\qquad
\sum_{d=0}^{d_{\max}} \hat P_d = I,
$$
together with a non-decreasing eigenvalue assignment $\lambda(d)=K_0+\Delta C(d)$ with $\Delta C(0)=0$. Then
$$
\hat{C}_v = \sum_{d=0}^{d_{\max}} (K_0 + \Delta C(d)) \hat{P}_d \quad \text{(2)}
$$
is a Hermitian positive semi-definite operator on $\mathcal{H}_v$. For every $|\psi\rangle\in\mathcal H_v$,
$$
\langle\psi|\hat{C}_v|\psi\rangle
=
\sum_{d=0}^{d_{\max}} (K_0 + \Delta C(d))\,\|\hat P_d\psi\|^2.
$$
Hence $\hat{C}_v$ defines an operational complexity observable. Any affine rescaling $a\hat C_v+bI$ with $a>0$ preserves the ordering of complexity shells and remains in the same admissible proxy class.

*Proof.* The projector relations imply that the sum in Equation (2) is a finite linear combination of bounded self-adjoint operators, hence $\hat C_v$ is self-adjoint. Because $K_0>0$ and $\Delta C(d)\ge 0$ for all $d$, every eigenvalue $\lambda(d)=K_0+\Delta C(d)$ is nonnegative. Therefore, for any $|\psi\rangle\in\mathcal H_v$,
$$
\langle\psi|\hat C_v|\psi\rangle
=
\sum_{d,d'=0}^{d_{\max}} \lambda(d)\langle\psi|\hat P_d\hat P_{d'}|\psi\rangle
=
\sum_{d=0}^{d_{\max}} \lambda(d)\langle\psi|\hat P_d|\psi\rangle
=
\sum_{d=0}^{d_{\max}} \lambda(d)\,\|\hat P_d\psi\|^2
\ge 0.
$$
Thus $\hat C_v$ is positive semi-definite. The displayed expectation formula shows that $\langle\psi|\hat C_v|\psi\rangle$ is the spectral average of the operational complexity shells in state $|\psi\rangle$, so $\hat C_v$ serves as an operational complexity observable. Finally, if $a>0$, then $a\hat C_v+bI$ has eigenvalues $a\lambda(d)+b$, which preserve the same ordering in $d$; therefore such affine rescalings remain in the same admissible proxy class. ∎

The expectation value $\langle\psi|\hat{C}_v|\psi\rangle$ serves as the system's internal, operational measure of complexity used in adaptation dynamics. Its physical relevance hinges on its dynamically enforced alignment with the theoretical $C_P$. The critical justification for using this operational proxy in place of the theoretical $C_P$ relies on Theorem 2 (Dynamically Enforced Functional Correspondence), rigorously detailed in Appendix D.

**2.4.3 Justification: Operational Alignment via Physical Feedback and Dynamic Optimization**

The crucial link between the theoretical (but uncomputable) $C_P$ and the operational (computable) proxy $\langle \hat{C}_v \rangle$ is not merely an approximation but a necessary condition for viable equilibrium states dynamically enforced by the PU framework's core optimization principles (POP, Axiom 1; PCE, Definition 15). A detailed argument, including the role of the observable work-cost gap as feedback, is provided in Appendix D. The essential result is formalized in Theorem 2.

**Theorem 2 (Dynamically Enforced Functional Correspondence - Necessary Alignment at Viable Equilibria):** Let $x^*$ represent any configuration corresponding to a stable equilibrium state (attractor) of the adaptation dynamics governed by the Prediction Optimization Problem (Axiom 1) and the Principle of Compression Efficiency (Definition 15), as described by minimization of the PCE Potential $V(x)$ (Appendix D). Assume the Dominance of Stabilizing Costs (DSC) condition (see Note on Corollary 3 below). Then a necessary condition for $x^*$ to be such a stable equilibrium is that, for every MPU $v$ in the aggregate,
$$
C_P(v) = \langle\hat C_v\rangle_{x^\star}. \quad \text{(3)}
$$

*Proof.* For each MPU $v$, write the alignment defect as
$$
\delta_v := C_P(v)-\langle \hat C_v\rangle.
$$
Appendix D, Lemma D.1 shows that if some $\delta_v\neq 0$, then the operational potential minimized by the adaptation dynamics does not coincide with the true physical PCE objective, because the true cost term depends on $R(C_P(v))$ whereas the operational dynamics use $R(\langle\hat C_v\rangle)$. Under the DSC hypothesis, stable equilibria must minimize the true PCE objective rather than a misaligned proxy. Corollary D.1 then states precisely that every stable equilibrium of the Appendix-D dynamics satisfies $\delta_v=0$ for all $v$. Therefore every stable equilibrium $x^*$ obeys
$$
C_P(v)=\langle \hat C_v\rangle_{x^\star}
$$
for every MPU $v$, which is Equation (3). ∎


**2.4.4 Physical Resource Costs: Functions ($R, R_I$) and Operators ($\hat{R}, \hat{R}_I$)**

The physical realization of systems with complexity $C_P$ incurs resource costs, fundamentally linked to thermodynamics (e.g., Landauer's principle, $\varepsilon \ge \ln 2$ (Theorem 31)). These costs constrain the POP, as they limit feasible model complexity and predictive performance. To make the dynamics tractable without restricting generality beyond what is used in later theorems, we assume only that $R(C_P)$ is nonnegative, strictly increasing, and convex (DSC), and that $R_I(C_P)$ is nonnegative, increasing, and satisfies $R_I(K_0)=0$; when explicit closed forms are required, we use the representative functional forms below. In the general case, these cost rates are functions of both complexity and the effective temperature of the environment, $R(C, T_{eff})$, a dependence that becomes essential in the analysis of Prediction Relativity (Appendix N). We then define the corresponding operators acting on the Hilbert space.

**Definition 3 (Resource–Cost Functions).**
- **Definition 3a (Physical operational cost $R(C; T_{\text{eff}})$).** The rate of physical resource consumption required to maintain structures and run processes of complexity $C$ at effective temperature $T_{\text{eff}}$.
  - $R$ is non‑decreasing in $C$ ($R'(C)\ge 0$). For $C > C_{op}$ (Operational Threshold; Definition 13), we adopt strict convexity, $R''(C) > 0$, reflecting the increasing coordination, error‑correction, and communication overhead at scale. Intuitively, adding one bit must be integrated with the existing $2^C$ states; this raises the marginal cost $R'(C)$, yielding convexity. A minimal parametric form is
   $$
    R(C; T_{\text{eff}})
    \;=\; R(C_{\text{op}}; T_{\text{eff}})
    \;+\; r_p(T_{\text{eff}})\,\bigl(C - C_{\text{op}}\bigr)^{\gamma_p},
    \quad C\ge C_{\text{op}},\ \gamma_p>1,\ r_p(T_{\text{eff}})>0. \quad \text{(4)}
    $$
- **Definition 3b (Reflexive‑information cost $R_I(C; T_{\text{eff}})$).** The informational overhead rate associated with self‑referential verification (SPAP). Reflecting diminishing returns beyond the Horizon Constant $K_0$,
$$
  R_I(C; T_{\text{eff}})
  \;=\; \frac{r_I(T_{\text{eff}})}{\ln 2}\,\ln\!\Bigl(\frac{C}{K_0}\Bigr),
  \quad C\ge K_0,\qquad R_I(K_0; T_{\text{eff}}):=0. \quad \text{(5)}
  $$
  The temperature‑dependence $r_p(T_{\text{eff}}), r_I(T_{\text{eff}})$ allows coupling to environmental operating conditions used later (e.g., Prediction Relativity in App. N).

**Note on Corollary 3.** The Operational Threshold and Horizon Constant obey $C_{op}\!\ge\!K_0$ (Corollary 3, Section 5.2.3), so both cost functions are simultaneously well-defined at $C=C_{op}$. In the limiting case $C_{op}=K_0$, the **excess** reflexive overhead above the baseline physical cost tends to zero at the threshold. For stable adaptation dynamics (see Theorem 22), we assume the **Dominance of Stabilizing Costs (DSC)**: the strict convexity of the physical cost $R(C)$ together with performance saturation (concave $PP(C)$) dominates any destabilizing concavity in the informational cost $R_I(C)$, ensuring a unique, stable equilibrium $C^*$.

The corresponding operators used in operational dynamics are derived via functional calculus.

**Theorem 3 (Resource Cost Operators $\hat{R}, \hat{R}_I$):** Let
$$
\hat C_v = \sum_{d=0}^{d_{\max}} \lambda(d)\hat P_d,
\qquad
\lambda(d)=K_0+\Delta C(d),
$$
be the operational complexity operator of Theorem 1. Then the operational resource-cost operators are defined by functional calculus as
$$
\hat{R}(C_v) := R(\hat{C}_v) = \sum_{d=0}^{d_{\max}} R\bigl(K_0 + \Delta C(d)\bigr) \hat{P}_d \quad \text{(6)}
$$
and
$$
\hat{R}_I(C_v) := R_I(\hat{C}_v) = \sum_{d=0}^{d_{\max}} R_I\bigl(K_0 + \Delta C(d)\bigr) \hat{P}_d \quad \text{(7)}.
$$
For every state $|\psi\rangle$,
$$
\langle\psi|\hat R(C_v)|\psi\rangle
=
\sum_{d=0}^{d_{\max}} R\bigl(\lambda(d)\bigr)\,\|\hat P_d\psi\|^2,
$$
$$
\langle\psi|\hat R_I(C_v)|\psi\rangle
=
\sum_{d=0}^{d_{\max}} R_I\bigl(\lambda(d)\bigr)\,\|\hat P_d\psi\|^2.
$$

*Proof.* Since $\hat C_v$ is self-adjoint with finite spectrum $\{\lambda(d)\}_{d=0}^{d_{\max}}$, the spectral theorem gives
$$
f(\hat C_v)=\sum_{d=0}^{d_{\max}} f\bigl(\lambda(d)\bigr)\hat P_d
$$
for every Borel function $f$ on $\sigma(\hat C_v)$. Applying this to $f=R$ and $f=R_I$ yields Equations (6) and (7). Taking expectation values in a state $|\psi\rangle$ and using $\langle\psi|\hat P_d|\psi\rangle=\|\hat P_d\psi\|^2$ gives the displayed formulas. ∎

*Justification.* Theorem 2 states that at viable equilibria one has
$$
C_P(v)=\langle \hat C_v\rangle_{x^\star}.
$$
This identifies the scalar theoretical complexity with the expectation of the operational proxy, but it does not by itself imply
$$
\langle R(\hat C_v)\rangle = R\bigl(C_P(v)\bigr)
\qquad\text{or}\qquad
\langle R_I(\hat C_v)\rangle = R_I\bigl(C_P(v)\bigr)
$$
for arbitrary states. For the convex physical-cost function $R$, Jensen's inequality gives
$$
\langle R(\hat C_v)\rangle \ge R\bigl(\langle \hat C_v\rangle\bigr)=R\bigl(C_P(v)\bigr).
$$
For the logarithmic representative $R_I(C;T_{\text{eff}})=\frac{r_I(T_{\text{eff}})}{\ln 2}\ln(C/K_0)$, concavity gives
$$
\langle R_I(\hat C_v)\rangle \le R_I\bigl(\langle \hat C_v\rangle\bigr)=R_I\bigl(C_P(v)\bigr).
$$
Exact equality holds only in sharply peaked or affine regimes. Accordingly, the operator expectations are exact spectral averages, while the mean-field replacement
$$
\langle R(\hat C_v)\rangle \approx R\bigl(\langle \hat C_v\rangle\bigr)
$$
is an additional low-variance approximation used later in the adaptation dynamics.

**2.5 Foundational Theorems: Necessary Conditions for Prediction**

Several conditions are logically necessary for any system to perform prediction as modeled within this framework.

**Theorem 4 (Necessity of time directionality).** Prediction requires an ordered, directional concept of time allowing distinction between “now” (t) and a strictly later instant (t + Δt, Δt > 0).

*Proof.* By definition, prediction maps information available at t to a distribution over states at t + Δt. Without a partial order with a nonempty forward cone, t + Δt is undefined and the mapping is meaningless. ∎

**Theorem 5 (Necessity of state distinguishability).** Prediction requires the capacity to distinguish the input state S(t), the predicted state Ŝ(t + Δt), and the realized subsequent state S(t + Δt) within the experiment’s σ-algebra.

*Proof.* If these states are indistinguishable (almost surely identical as measurable random variables), then no verification of predictive performance is possible, and improvement ΔQ cannot be assessed. ∎

**Theorem 6 (Necessity of discoverable regularities).** Prediction based only on the present-state data $S(t)$ and achieving better-than-chance performance requires mutual information $I(S(t); S(t + \Delta t)) > 0$ under the true dynamics.

*Proof.* Assume a predictor $\hat S$ is formed solely from the present-state information, so $\hat S = f(S(t))$ for some measurable map $f$. If $I(S(t); S(t + \Delta t)) = 0$, then $S(t)$ and $S(t + \Delta t)$ are independent. The data-processing inequality applied to the Markov chain
$$
\hat S \leftarrow S(t) \rightarrow S(t+\Delta t)
$$
gives
$$
I(\hat S; S(t+\Delta t)) \le I(S(t); S(t+\Delta t)) = 0.
$$
Hence $\hat S$ is independent of the future state. Therefore conditioning on $\hat S$ cannot change the conditional law of $S(t+\Delta t)$ relative to the marginal law, so no predictor using only $S(t)$ can improve Bayes risk, cross-entropy, or any equivalent proper-scoring prediction criterion relative to the marginal predictor. Thus better-than-chance prediction from present-state data alone requires $I(S(t); S(t+\Delta t))>0$. ∎

**Theorem 7 (Necessity of a representational medium).** Prediction requires a physical medium capable of encoding and processing the relevant states S(t), internal models M_t, and predictions Ŝ(t + Δt).

*Proof.* Information processing requires a substrate to instantiate random variables and transformations. Absent such a medium, S(t), M_t, and Ŝ(t + Δt) cannot be realized. ∎


## 2.6 Categorical Unity: Physical Ontology from Predictive Structure

Theorems 4–7 identify core structural necessities for any non-trivial predictive system: a directed ordering parameter for verification and update (Theorem 4), distinguishable verification states enabling recognition of error (Theorem 5), discoverable regularity enabling better-than-chance prediction (Theorem 6), and a physically realized representational medium (Theorem 7). Together with finite-resource realizability (Definition 3; Theorem 3; Definition 15) and thermodynamic/causal bounds on instantiation (Theorems 29 and 31; Theorem E.2), these necessities become the structural origin of physical ontology: once prediction is taken as the core activity grounded in the Cogito [Descartes 1641] (Appendix P) and physically instantiated under finite resources and finite time (PPI, Definition P.6.2), the familiar categories of physics are fixed as the resource-optimal realizations of predictive functionality. The traditional "categories" of physics—time, space, energy, matter, force, charge—are not independent primitives; they are operational aspects of a single instantiated optimization process governed by POP (Axiom 1) and PCE (Definition 15).

Let the physically instantiated predictive structure be represented (at a chosen resolution) by the triple
$$
\mathfrak{P} := (\mathcal{N}, \mathcal{E}_N, V),
$$
where (i) $\mathcal{N}$ is the MPU interaction network (Section 11.1), with vertices given by MPUs (Definition 23) and propagation/throughput costs as in Definition 35, (ii) $\mathcal{E}_N$ is the ND‑RID "Evolve" channel implementing physical interaction/actualization (Definition 27), and (iii) $V$ is the PCE potential over configurations (Definition 20; Appendix D, Definition D.1):
$$
V(x)=V_{op}(x)+V_{prop}(x)-V_{benefit}(x)+V_{penalty}(x).
$$
Thermodynamic instantiation imposes an irreducible cost floor on $\mathcal{E}_N$: whenever an $\mathcal{E}_N$ update resolves nontrivial self-referential information ($\Delta I>0$), the dimensionless entropy cost satisfies
$$
\varepsilon=\Delta S_{\min}/k_B \ge \ln 2
$$
(Theorem 31; see also [Landauer 1961]).

**Definition (Physical category).** A physical category $\mathfrak{C}$ is a family of operational observables used to describe the world (time, space, energy, matter, force, charge).

**Definition (Predictive derivation).** A category $\mathfrak{C}$ is predictively derived if its operational observables can be constructed as functionals of $\mathfrak{P}$ (including continuum limits selected by PCE), i.e., if there exists a map $\pi_{\mathfrak{C}}$ such that $\mathfrak{C}=\pi_{\mathfrak{C}}(\mathfrak{P})$.

**Thesis 2.6 (Categorical Unity).** In PU, each traditional physical category is a projection of the single instantiated predictive structure $\mathfrak{P}$. None of $\{\text{time, space, energy, matter, force, charge}\}$ is an additional ontological primitive beyond prediction under POP/PCE with physical instantiation.

### 2.6.1 Derivation Map (Operational Identifications)

| Category | Operational identification as a functional of $\mathfrak{P}$ | Primary PU locus |
|:---------|:-------------------------------------------------------------|:-----------------|
| Time | The directed ordering of predictive cycles required for verification/update (Theorem 4), sharpened to a thermodynamic arrow by ND‑RID irreversibility and per‑cycle cost $\varepsilon\ge\ln 2$; minimal tick set by $\tau_{min}>0$. | Theorem 4; Definition 27; Theorem 29; Theorem 31; Appendix O |
| Space | Metric structure induced by coherence/propagation costs on $\mathcal{N}$: $d_{\mathcal{N}}$ from propagation costs (Definition 35) whose PCE‑selected regularity yields a continuum manifold with metric tensor $g_{\mu\nu}$. | Definition 35; Theorem 43–45 |
| Spacetime unity | Finite $\tau_{\min}$ and bounded propagation costs imply an invariant maximum causal speed $c$ (Theorem 46). With the emergent dimension fixed to $D=4$ from the mode-channel correspondence (Theorem Z.11; Appendix P, P.8.11), Theorem 46 then yields a Lorentzian signature for the continuum effective metric. | Theorem 46; Theorem Z.11; Appendix P (P.8.11) |
| Energy | Resource-cost rate required to maintain predictive organization: $R(C)$ and $R_I(C)$ (Definition 3) lift to cost operators (Theorem 3), with an operational Hamiltonian/energy scale set by the minimum cycle time $\tau_{\min}$ (Theorem 29). Coarse-graining yields $T_{\mu\nu}^{(MPU)}$. | Definition 3; Theorem 3; Theorem 29; Appendix B (Definition B.8) |
| Matter | Persistent, localized predictive structure: MPUs (Definition 23) and their stable aggregates (Definition 29) support field-like degrees of freedom on $(M,g)$ whose stable internal sectors are determined by the topology of the MPU perspective space (Definition 25 with $d_0=8$; Appendix R). | Definition 23; Definition 25; Definition 29; Appendix R |
| Force | Effective interactions as the PCE-optimal response of $\mathfrak{P}$ to gradients/curvatures of the same underlying cost structure: (i) generalized "forces" as gradients of $V$ in configuration space (Definition 20; Appendix D, Definition D.1), (ii) gauge forces via connection dynamics and minimal coupling (Appendix G), (iii) gravity as metric response sourced by $T_{\mu\nu}^{(MPU)}$ (Theorem 50). | Definition 20; Appendix D (Definition D.1); Appendix G; Theorem 50; Appendix X |
| Charge | Coherence-participation parameter: the coupling $q$ in the covariant derivative $D_\mu=\partial_\mu+\Omega_\mu+iqA_\mu$ required by local phase freedom and PCE-efficient coherence management. Gauge invariance yields a conserved Noether current (Appendix G, Eq. G.6.3). Charge quantization, when present in an effective theory, is fixed by the global structure and boundary conditions of the emergent gauge bundle; it is not imposed at the substrate level without specifying those data. | Appendix G (Definition G.4.1; Eq. G.6.3) |

This map provides operational constructions from $(\mathcal{N},\mathcal{E}_N,V)$, and the familiar laws of each category arise as coarse‑grained consequences of the same variational/thermodynamic structure (Appendix D; Appendix X).

### 2.6.2 Structural Identities (Inter‑Category Relations as Necessities)

Because the categories are projections of one structure, canonical inter‑category relations appear as internal identities rather than independent empirical "bridges":

1. **Mass–energy equivalence.** Rest energy is the maintenance cost of relational/predictive information. PU recovers $E=mc^2$ [Einstein 1905b] as a consequence of identifying mass with the action/energy required to maintain relational information content; see Corollary N.5.1 and the associated development in Appendix N.

2. **Lorentzian spacetime with invariant $c$.** The same physical instantiation constraints that enforce $\tau_{\min}>0$ (Theorem 29) and $\varepsilon\ge\ln 2$ (Theorem 31) bound causal influence propagation and yield an invariant maximum speed $c$. With the emergent dimension fixed to $D=4$ from the mode-channel correspondence (Theorem Z.11), Theorem 46 then yields the Lorentzian signature.

3. **Forces from connections/gradients.** In the continuum effective description, interactions are encoded in the connections required for predictive coherence: the internal connection $A_\mu$ (Appendix G) and the geometric/spin connection (Theorem 48) together form the transport structure whose curvature yields physical interaction content (Theorem 47). In the classical limit, inertial response and Newton's second law are recovered from the same entropy/action accounting (Theorem N.6), tying "force" to the cost of relational reconfiguration.

4. **Charge conservation.** With minimal coupling fixed by predictive-coherence cost, varying the total action yields $\nabla_\mu F^{\mu\nu}=J^\nu$ (Eq. G.6.3), where $J^\nu$ is the conserved Noether current of the gauge symmetry; thus $\nabla_\nu J^\nu=0$ follows directly from the gauge-invariant structure required by coherence management (Appendix G).

5. **Equivalence principle.** For simple systems (those not in the high-complexity correction regime), inertial and gravitational mass coincide because both are measures of the same relational information maintenance cost: $m_I=m_G$ (Theorem N.7), with the sourcing of curvature mediated by $T_{\mu\nu}^{(MPU)}$ (Definition B.8) through the emergent Einstein equations (Theorem 50). Where PU allows controlled departures, it does so by specifying the correction mechanism and regime (Appendix N, Theorem N.8; Section 9).

### 2.6.3 Compressed Ontology Statement

The PU ontology is therefore compactly expressible as:
$$
\boxed{
\mathfrak{P}=(\mathcal{N},\mathcal{E}_N,V)
\quad\Longrightarrow\quad
\{\text{time, space, energy, matter, force, charge}\}
=
\{\pi_{\mathfrak{C}}(\mathfrak{P})\}_{\mathfrak{C}}
}
$$
with $\mathcal{E}_N$ constrained by $\varepsilon\ge \ln 2$ (Theorem 31) and $V$ given by the single PCE Potential (Appendix D, Definition D.1). The plurality of physical categories reflects the plurality of stable operational questions one can ask of $\mathfrak{P}$, not a plurality of independent ontological primitives.





