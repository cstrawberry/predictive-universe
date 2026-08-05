# 2. Foundational Principles: Prediction, Optimization, and Resources

**Branch-scope convention for foundational identifications.** The axioms below define the formal POP/PCE/PPI setting. When later sections identify an information-theoretic object with a physical observable, that step is a PPI or branch map unless the local theorem explicitly proves the identification. The foundational section therefore supplies the formal substrate; it does not by itself remove the branch assumptions in the later gauge, flavor, cosmology, CC, and gravity sectors.

**Pre-axiomatic non-closure convention.** The formal presentation below keeps POP, Predictive Capacity, Operational Viability, PCE, and PPI as the named axioms, principles, and bridges used for derivations. Appendix A.6 and Appendix P.16c add a conservative scoped reading of their origin: a trace-certified predictor admits no total standard-sound same-cycle Boolean closure on a domain containing its targeted live diagonal sentence. A finite partial closure supports prediction, verification, and update only for cycles satisfying every hypothesis of Theorem A.6.4, including finite-budget retention, binary verification, verification-preserving composition, logical memory, uniform specification, and the live-diagonal guard. The named axioms and bridges are therefore treated as the formal stabilizers of the admissible finite-response domain, not as a claim that total self-closure has been achieved.

This section establishes the core axioms and definitions underpinning the Predictive Universe (PU) framework. Appendix P provides the epistemic bridge for the chosen axiom set. Foundational Certainty P.2.1 gives only $\exists\mathcal{C}$: an indubitable locus of awareness/process. Section P.3 then operationally distills $\mathcal{C}$ into prediction, because a knowledge-bearing process must maintain distinctions, anticipate, verify, and update. The formal axioms below do not add a second immutable substance; they specify the stable finite-response rules by which that process is modeled. POP states the optimization problem faced by such processes, Predictive Capacity states the condition for nontrivial predictive success, Operational Viability states the survival window, PPI states when an operational structure has finite physical content, and PCE selects no-surplus representatives. Under this bridge, MPUs enter later as minimal finite physical representatives of the predictive loop, not as an independently assumed material substrate. Appendix P.1 summarizes the forcing logic and the epistemic status stratification (certainty, theorem, empirical anchor, and framework selection) used throughout the paper. The Cogito's self-verification supplies a retained distinction between the certified occurrence of the process and propositions not certified by that occurrence. Proposition A.0.1 gives a binary retained verification predicate, and Proposition A.0.2 supplies NOT, AND, and OR only when the retained acceptance-set class is closed under complements, finite intersections, and finite unions. The stronger finite-computation/Property-R conclusion is available only on the model-class branch of Theorem A.0.1 and Corollary A.0.1, which additionally assumes composition closure, logical memory, uniform specification, arbitrarily large finite memory and composition depth, and a formal arithmetic capable of coding finite strings, circuits, and bounded computations. On a uniformly diagonal-closed class, SPAP (Theorems 10–11) excludes a single predictor that is exact on every constructible prediction-contingent system. On every effectively coded pointed RID class containing the registered-clock family $\mathbf S_{e,w}$ of Appendix A.2, RUD excludes total uniform decision of the fixed terminal-reachability property $\mathsf{TERM}$; its probabilistic extension additionally assumes a computable finite runtime bound, computable complete finite support lists with rational probabilities, and a fixed positive advantage. Neither result asserts that every individual system is unpredictable or that no system can decide any statement about itself. The section then defines POP, functional information and knowledge, $C_P$, its operational proxy $\hat C_v$, and the corresponding resource-cost operators.

**2.1 Axiom 1 (Ax 1): The Prediction Optimization Problem (POP)**


Adaptive systems operating within uncertain environments face the fundamental challenge of optimizing the predictive quality ($Q$) of their internal state or model concerning aspects of their internal and external environment relevant to their continued functioning and goals. This optimization aims to maximize the expected improvement in predictive quality ($\Delta Q$). This improvement is quantified by metrics reflecting reduced uncertainty (e.g., decreased entropy), enhanced accuracy (e.g., increased log-likelihood, reduced prediction error), or reduced Bayes risk, achievable through information processing, interaction, and adaptation. This ongoing optimization is performed subject to limited physical and computational resources, including available energy, processing time, and achievable system complexity ($C_P$). This fundamental, resource-constrained drive to enhance predictive capability is termed the Prediction Optimization Problem (POP).

For concreteness, all predictive-quality functionals $Q$ are assumed measurable and bounded below on the feasible state space so that expectations and improvements $\mathbb{E}[\Delta Q]$ are well-defined.

**2.2 Axiom 2 (Ax 2): Predictive Capacity Foundation**

To generate predictions that are demonstrably better than chance (i.e., to achieve a positive expected predictive improvement, $\Delta Q > 0$, relative to a baseline random predictor), a system must possess an internal model ($M_t$) capable of capturing and exploiting discoverable regularities within the relevant data streams. The capacity for effective prediction relies fundamentally on the system's ability to leverage Information (Definition 1) via its internal modeling processes ($M_t$) to achieve a positive expected improvement in predictive quality with respect to future states pertinent to its operational goals (Axiom 1).

**2.3 Information and Prediction-Based Knowledge**

We define information and knowledge not intrinsically, but functionally in terms of their role within predictive systems operating under POP.

**2.3.1 Definition 1 (Def 1): Information**

Within the Predictive Universe framework, information is defined functionally as any physically instantiated (I), substrate-independent (S) pattern or correlation structure (P) that, when processed by a suitable predictive system (E), has the objective potential to yield a positive expected improvement in predictive quality (F) concerning states relevant (R) to that system's Prediction Optimization Problem (POP, Axiom 1). Suitability is task-relative: the system must possess an admissible model class $\mathcal M$ and enough resources to realize at least one procedure witnessing the positive improvement in clause (F). The Horizon Constant $K_0$ is not imposed by this definition; it applies only to the SPAP register realization class of Theorem 15 and transfers to $C_P$ only through Corollary 3's bridge. 

*Elaboration:*
*   **(P) Pattern:** A discernible structure, regularity, or deviation from randomness that allows for distinctions relevant to prediction.
*   **(I) Physical Instantiation:** The pattern must be embodied in a physical configuration or process, linking it to physical dynamics, resource costs, and thermodynamic constraints.
*   **(S) Substrate Independence:** The functional content of the pattern (its potential predictive utility) is, in principle, substrate-independent and can be represented on different physical substrates.
*   **(E) System Enablement:** The potential of the pattern to serve as information is relative to a system with $M_t\in\mathcal M$ and sufficient task-specific resources to detect and process it so as to realize the improvement required by clause (F). No universal $K_0$ lower bound follows for this general information-bearing class.
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

To define Predictive Physical Complexity ($C_P$), fix a universal machine $U$, a finite program alphabet, a reference microstate $\mu_{ref}$, and a decreasing sequence of admissible program classes
$$
\mathcal L_0\supseteq\mathcal L_1\supseteq\cdots
$$
whose membership conditions are specified without reference to $C_P$, $C_{op}$, an MPU, or any result whose hypotheses already use those objects. For a microstate $\mu$, define
$$
\mathcal M_n(\mu):=\{P\in\mathcal L_n:U(P,\mu_{ref})=\mu\}.
$$
Define
$$
C_{P,n}(\mu):=\inf_{P\in\mathcal M_n(\mu)}K(P),
$$
with $C_{P,n}(\mu)=\infty$ when $\mathcal M_n(\mu)=\varnothing$. Relative to the fixed data $(U,\mu_{\mathrm{ref}},\{\mathcal L_n\}_{n\ge0})$, call $\mu$ **full-constraint-realizable** when there is a common witness
$$
P_{\mathrm{phys}}\in\bigcap_{n\ge0}\mathcal M_n(\mu),
\qquad K(P_{\mathrm{phys}})<\infty.
$$
Because $\mathcal M_{n+1}(\mu)\subseteq\mathcal M_n(\mu)$, the sequence $C_{P,n}(\mu)$ is nondecreasing. If $\mu$ is full-constraint-realizable, its common witness gives $C_{P,n}(\mu)\le K(P_{\mathrm{phys}})$ for every $n$. Hence, on that explicitly conditional domain,
$$
C_P(\mu):=\lim_{n\to\infty}C_{P,n}(\mu) \quad \text{(1)}
$$
exists and is finite. This definition does not prove that a full-constraint-realizable microstate exists, construct a physical realization, or construct a model of a joint PU theory. A constraint proved only for objects defined using $C_P$ may be imposed as a downstream conditional restriction, but it is not a parent constraint in this acyclic hierarchy.

Remark: Level 0 uses algorithmic complexity $K(P)$ as a non-circular bookkeeping device. Exact integer invariants derived later (e.g., $K_0=3$ bits) are fixed by operational distinguishability and minimal register-size arguments expressed in the physically anchored capacity units $C_{cap}=\log_2 d_0$ (Convention 1), and therefore do not depend on the additive-constant ambiguity of $K(P)$ under changes of the reference universal machine. Corollary A.4.1b supplies a conservative recursion-theoretic consistency check: admissible finite verifier transformers can have self-referential fixed-point presentations. That existence result does not supply a full-constraint witness, does not remove the Appendix D alignment condition for $\hat C_v$, and does not derive $K_0=3$ without the operational distinguishability argument of Theorem 15.

**Lemma 1 (Convergence of Complexity Hierarchy):** If $\mu$ has the common full-constraint witness displayed above, then the hierarchically defined sequence $\{C_{P,n}(\mu)\}$ converges to a finite limit $C_P(\mu)$.

*Proof.*

**Monotonicity:** Each refinement step $n \to n+1$ adds constraints to the physical laws that must be satisfied, so the admissible program set satisfies $\mathcal{M}_{n+1}(\mu)\subseteq\mathcal M_n(\mu)$. Restricting the set cannot decrease the infimum of $K(P)$, hence $C_{P,n+1}(\mu) \ge C_{P,n}(\mu)$ and $\{C_{P,n}(\mu)\}$ is monotonically non-decreasing.

**Boundedness:** Let $P_{\mathrm{phys}}$ be the assumed common witness and set $B_{\mu}:=K(P_{\mathrm{phys}})<\infty$. Since $P_{\mathrm{phys}}\in\mathcal M_n(\mu)$ at every finite refinement level, each $\mathcal M_n(\mu)$ is nonempty and $C_{P,n}(\mu)\le B_{\mu}$ for all $n$. Thus $\{C_{P,n}(\mu)\}$ is bounded above by the finite constant $B_{\mu}$.

**Convergence:** By the monotone bounded sequence theorem, the limit $C_P(\mu) := \lim_{n\to\infty} C_{P,n}(\mu)$ exists and is finite. This conditional result supplies no witness when the intersection is empty. QED

**Theorem 2.4.1a (Finite Stabilization and Common Realizer of the Complexity Hierarchy).** Fix a finite program alphabet and an integer-valued prefix-program length $K(P)$. Let
$$
\mathcal M_{n+1}(\mu)\subseteq\mathcal M_n(\mu),
\qquad
C_{P,n}(\mu)=\min_{P\in\mathcal M_n(\mu)}K(P).
\tag{2.4.1a.1}
$$
Suppose there is a full-constraint witness
$$
P_{\mathrm{phys}}\in\bigcap_{n\ge0}\mathcal M_n(\mu),
\qquad
K(P_{\mathrm{phys}})=B_\mu<\infty.
\tag{2.4.1a.2}
$$
Then:

1. $C_{P,n}(\mu)$ has at most $B_\mu-C_{P,0}(\mu)$ strict increases. Hence there are $n_*$ and an integer $C_\infty$ such that
$$
C_{P,n}(\mu)=C_\infty
\quad\text{for every }n\ge n_*.
\tag{2.4.1a.3}
$$
2. There is one finite program $P_\infty$ satisfying every refinement simultaneously and attaining that value:
$$
P_\infty\in\bigcap_{n\ge0}\mathcal M_n(\mu),
\qquad
K(P_\infty)=C_\infty.
\tag{2.4.1a.4}
$$
Consequently,
$$
C_P(\mu)
=C_\infty
=\min_{P\in\cap_n\mathcal M_n(\mu)}K(P).
\tag{2.4.1a.5}
$$

*Proof.* Lemma 1 gives monotonicity and (2.4.1a.2) gives $C_{P,n}\le B_\mu$. A nondecreasing integer sequence in the finite set $\{C_{P,0},\ldots,B_\mu\}$ can increase only finitely often, proving (2.4.1a.3).

For $n\ge n_*$ define
$$
A_n
:=
\{P\in\mathcal M_n(\mu):K(P)=C_\infty\}.
$$
Every $A_n$ is nonempty, $A_{n+1}\subseteq A_n$, and all $A_n$ lie in the finite set of program strings of length $C_\infty$ over the fixed finite alphabet. A descending sequence of nonempty subsets of a finite set stabilizes, so $\cap_{n\ge n_*}A_n\ne\varnothing$. Any $P_\infty$ in this intersection belongs to all earlier $\mathcal M_n$ as well because the hierarchy is nested. This proves (2.4.1a.4), and (2.4.1a.5) follows from minimality at every stabilized level. ∎

**Corollary 2.4.1a.1 (No Effective Stabilization-Time Claim).** Theorem 2.4.1a proves existence of a finite stabilization index but supplies no bound on $n_*$ from the numerical data $C_{P,0}$ and $B_\mu$ alone. Such a bound requires effective information about the constraint hierarchy and the program-length minima, which the definition of $C_P$ does not assume.

*Proof.* Let $N$ be any positive integer. Choose two program strings $P_0,P_1$ with $K(P_0)=1$ and $K(P_1)=2$, and define a nested hierarchy by
$$
\mathcal M_n=\{P_0,P_1\}\quad(0\le n<N),
\qquad
\mathcal M_n=\{P_1\}\quad(n\ge N).
$$
Every set is nonempty, $\mathcal M_{n+1}\subseteq\mathcal M_n$, and the common upper bound is $B_\mu=2$. Nevertheless,
$$
C_{P,n}=1\quad(0\le n<N),
\qquad
C_{P,n}=2\quad(n\ge N),
$$
so the least stabilization index is $N$. Because $N$ is arbitrary while $C_{P,0}=1$ and $B_\mu=2$ are unchanged, those numerical data supply no stabilization-time bound. ∎

**Convention for Information Capacity in Quantum Systems:** For quantum systems, such as the Minimal Predictive Units (MPUs) hypothesized to be fundamental constituents of reality (Definition 23), the maximum information capacity required to specify their distinguishable states is determined by the dimensionality $d_0$ of the MPU's Hilbert space $\mathcal{H}_0$ (Proposition 4). We adopt the standard quantum information convention for this capacity $C_{cap}$ (measured in bits):
$$
C_{cap} = \log_2 d_0 \quad \text{(Convention 1)}
$$
Equivalently, in natural-log units (nats),
$$
\ln d_0 = (\ln 2)\,C_{cap}.
$$
This establishes that a system with a Hilbert space of $d_0$ dimensions has a state-space capacity of $C_{cap}$ bits (or $\ln d_0$ nats), i.e., the maximum number of mutually orthogonal, operationally distinguishable configurations that can be encoded in a single-cycle internal state. This capacity is a structural constraint used to translate logical distinguishability requirements into Hilbert-space dimension bounds. In particular, Theorem 15 first fixes the finite operational-context floor
$$
N_{\mathrm{vis}}^{\min}=2^{K_0}=8.
$$
On a Hilbert carrier, representing these contexts as mutually perfectly distinguishable alternatives requires
$$
C_{cap}=\log_2 d_0 \ge \log_2 N_{\mathrm{vis}}^{\min}=K_0
\quad \Leftrightarrow \quad
 d_0 \ge N_{\mathrm{vis}}^{\min}=2^{K_0}.
$$
Theorem 23 later gives this Hilbert-rank bound for MPUs. Equality $d_0=8$ is available on either of two explicitly additional branches: Theorem Z.2's same-presheaf carrier comparator with strict rank cost, or Principle 8.0b and Theorem 8.0d's sharp complex-carrier closure with a faithful $M_8(\mathbb C)$ comparator and strict total-cost exclusion of every larger same-presheaf representative. Theorem 15 alone gives only $d_0\ge8$. The dynamical resource expenditure $C_P$ is distinct from single-state capacity; no comparison follows from Definitions 1--2 alone. Principle 5c instead defines the online capacity $C_{\mathrm{on}}\ge\log_2N_{\mathrm{dist}}$. Relating the program-description quantity $C_P$ or its infimum $C_{op}$ to $C_{\mathrm{on}}$ requires Corollary 3's separately declared complexity--capacity bridge.

This completes the non-circular foundation for $C_P$ needed for the subsequent emergence derivations.

**Remark on Irreversibility and the Arrow of Time:** Theorem 4 supplies only the ordered present-to-future parameter built into the definition of prediction. Thermodynamic irreversibility is a separate branch statement. For a registered reset, Theorem 31 gives
$$
\varepsilon_{\mathrm{reset}}
=
H_q(P\mid R)+\varepsilon_{\mathrm{diss}}
\ge H_q(P\mid R),
$$
and a positive uniform floor requires the independent certificate $H_q(P\mid R)\ge h_{\min}>0$. A directional pathwise ratchet additionally requires the common forward/reverse path-measure and positive pathwise-production hypotheses of Theorem O.3 or O.3a. Statistical mechanics remains a background constraint on physical realizability. Neither SPAP nor the structural value $\varepsilon_0=\ln2$ implies a positive heat cost for every update or a universal microscopic thermodynamic arrow.

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
Hence $\hat{C}_v$ defines an operational complexity observable. An affine transform $a\hat C_v+bI$ with $a>0$ preserves the ordering of complexity shells. It is positive semi-definite if and only if $aK_0+b\ge0$, and it preserves the normalization of the lowest shell at $K_0$ if and only if $b=(1-a)K_0$.

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
Thus $\hat C_v$ is positive semi-definite. The displayed expectation formula shows that $\langle\psi|\hat C_v|\psi\rangle$ is the spectral average of the operational complexity shells in state $|\psi\rangle$, so $\hat C_v$ serves as an operational complexity observable. The transformed eigenvalues are $a\lambda(d)+b$, whose ordering is preserved because $a>0$. Their minimum is $aK_0+b$, proving the positivity criterion. The lowest transformed shell equals $K_0$ exactly when $aK_0+b=K_0$, equivalently $b=(1-a)K_0$. ∎

The expectation value $\langle\psi|\hat{C}_v|\psi\rangle$ serves as the system's internal, operational measure of complexity used in adaptation dynamics. Its physical relevance hinges on its dynamically enforced alignment with the theoretical $C_P$. The critical justification for using this operational proxy in place of the theoretical $C_P$ relies on Theorem 2 (Dynamically Enforced Functional Correspondence), rigorously detailed in Appendix D.

**2.4.3 Justification: Operational Alignment via Physical Feedback and Dynamic Optimization**

The crucial link between the theoretical (but uncomputable) $C_P$ and the operational (computable) proxy $\langle \hat{C}_v \rangle$ is not merely an approximation but a necessary condition for viable equilibrium states dynamically enforced by the PU framework's core optimization principles (POP, Axiom 1; PCE, Definition 15). A detailed argument, including the role of the observable work-cost gap as feedback, is provided in Appendix D. The essential result is formalized in Theorem 2.

**Theorem 2 (Dynamically Enforced Functional Correspondence on the Faithful-Cost-Identifiability Branch):** Let $x^*$ be a stable equilibrium of the complete physical adaptation dynamics governed by the true PCE objective $V_{true}$ of Appendix D. Assume the Dominance of Stabilizing Costs (DSC) condition and the faithful-cost-identifiability branch of Lemma D.1: a persistent per-MPU proxy-cost mismatch cannot be exactly compensated by changes in other MPUs or in non-complexity coordinates at a true stable PCE equilibrium. Then, for every MPU $v$ in the aggregate,
$$
C_P(v) = \langle\hat C_v\rangle_{x^\star}. \quad \text{(3)}
$$

*Proof.* For each MPU $v$, define
$$
\delta_v := C_P(v)-\langle \hat C_v\rangle.
$$
Lemma D.1 states that, on the faithful-cost-identifiability branch, a stable minimum of $V_{true}$ must satisfy $\delta_v=0$ for every $v$; otherwise the persistent per-MPU mismatch produces a true-cost discrepancy that cannot be canceled by the remaining coordinates. Corollary D.1 applies this necessary condition to stable equilibria of the complete physical adaptation dynamics. Hence
$$
C_P(v)=\langle \hat C_v\rangle_{x^\star}
$$
for every MPU $v$, which is Equation (3). ∎


**2.4.4 Physical Resource Costs: Functions ($R, R_I$) and Operators ($\hat{R}, \hat{R}_I$)**

The physical realization of systems with complexity $C_P$ incurs resource costs, fundamentally linked to thermodynamics (e.g., Landauer's principle, $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$ (Theorem 31)). These costs constrain the POP, as they limit feasible model complexity and predictive performance. To make the dynamics tractable without restricting generality beyond what is used in later theorems, we assume only that $R(C_P)$ is nonnegative, strictly increasing, and convex (DSC), and that $R_I(C_P)$ is nonnegative, increasing, and satisfies $R_I(K_0)=0$; when explicit closed forms are required, we use the representative functional forms below. In the general case, these cost rates are functions of both complexity and the effective temperature of the environment, $R(C, T_{eff})$, a dependence that becomes essential in the analysis of Prediction Relativity (Appendix N). We then define the corresponding operators acting on the Hilbert space.

**Definition 3 (Resource–Cost Functions).**
- **Definition 3a (Physical operational cost $R(C; T_{\text{eff}})$).** Let $\mathfrak t=(\mathcal E,A,f_{random},\epsilon_{acc})$ be the declared task tuple of Definition 13, and let $C_{op}$ denote the threshold produced by that definition for $\mathfrak t$. The physical operational cost is the rate of physical resource consumption required to maintain structures and run processes of complexity $C$ at effective temperature $T_{\text{eff}}$.
  - $R$ is non‑decreasing in $C$ ($R'(C)\ge 0$). For $C > C_{op}$ on the declared task tuple, we adopt strict convexity, $R''(C) > 0$, reflecting the increasing coordination, error‑correction, and communication overhead at scale. Intuitively, adding one bit must be integrated with the existing $2^C$ states; this raises the marginal cost $R'(C)$, yielding convexity. A minimal parametric form is
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

**Note on Corollary 3.** The inequality $C_{op}\ge K_0$ holds only when every qualifying implementation satisfies the realization and complexity-capacity bridge hypotheses of Corollary 3. If the qualifying set is nonempty, $C_{op}<\infty$, and $C_{op}\ge K_0$ on that branch, both cost functions are simultaneously well-defined at $C=C_{op}$. Outside it, Equation (5) applies only to the declared self-referential cost branch for $C\ge K_0$ and does not constrain the general task threshold. In the limiting case $C_{op}=K_0$ on the Corollary 3 branch, the **excess** reflexive overhead above the baseline physical cost tends to zero at the threshold. For stable adaptation dynamics (see Theorem 22), we assume the **Dominance of Stabilizing Costs (DSC)**: the strict convexity of the physical cost $R(C)$ together with performance saturation (concave $PP(C)$) dominates any destabilizing concavity in the informational cost $R_I(C)$, ensuring a unique, stable equilibrium $C^*$. 

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

**Theorem 5 (Necessary Measurability of Prediction and Verification Records).** Empirically assessable prediction requires that the input record $S(t)$ be measurable to the predictor and that the prediction record $\hat S(t+\Delta t)$ and realized outcome $S(t+\Delta t)$ be jointly measurable in an experimental $\sigma$-algebra supporting the chosen discrepancy or scoring function. The input and prediction records need not take distinct values.

*Proof.* The predictor cannot condition on $S(t)$ unless the input record is measurable to it. Verification requires evaluation of a measurable score $S_{score}(\hat S(t+\Delta t),S(t+\Delta t))$ or discrepancy statistic. If the prediction and outcome records admit no jointly measurable comparison, that score is not an experimental random variable and predictive improvement $\Delta Q$ cannot be assessed. No step requires $S(t)$ and $\hat S(t+\Delta t)$ to differ; for example, a persistence predictor may copy the input record. ∎

**Theorem 6 (Necessity of Present–Future Dependence for Improvement over the No-Input Baseline).** Let $X:=S(t)$ and $Y:=S(t+\Delta t)$ be random elements of standard Borel spaces with a joint law for which $I(X;Y)$ is defined. Let the predictor output $Z$ be generated from $X$ by a Markov kernel using no information about $Y$ beyond $X$, so that $Y-X-Z$ is a Markov chain. Fix a loss function, and define the chance baseline as the minimum expected risk among decisions having no access to $X$. If a decision based on $Z$ has strictly smaller expected risk than that baseline, then $I(X;Y)>0$.

*Proof.* Suppose $I(X;Y)=0$. Since mutual information is the relative entropy between the joint law and the product of its marginals, equality to zero implies that $X$ and $Y$ are independent. The Markov property gives
$$
I(Z;Y)\le I(X;Y)=0
$$
by the data-processing inequality, so $Z$ and $Y$ are independent. For any decision rule $a(Z)$,
$$
\mathbb E[\ell(a(Z),Y)]
=
\int \mathbb E[\ell(a(z),Y)]\,P_Z(dz),
$$
which is an average of risks of decisions having no access to $X$. It is therefore at least the minimum no-input risk. Thus no decision based only on $Z$ can strictly improve on the stated chance baseline when $I(X;Y)=0$. The contrapositive proves the claim. ∎

**Theorem 7 (Representational Medium under Physical Instantiation).** Suppose a prediction process is physically instantiated in the operational PPI sense of Definition P.6.2: its finite input record $S(t)$, internal-model record $M_t$, output record $\hat S(t+\Delta t)$, and update operations are represented by finite protocol-distinguishable physical states and transformations. Then the process requires a physical medium carrying those states and transformations.

*Proof.* By the stated PPI hypothesis, each of $S(t)$, $M_t$, and $\hat S(t+\Delta t)$ is represented by a protocol-distinguishable physical state, and each processing step is represented by a physical transformation between such states. The collection of physical degrees of freedom supporting those representations and transformations is a representational medium. Therefore every prediction process satisfying the physical-instantiation hypothesis has such a medium. ∎


## 2.6 Categorical Unity: Physical Ontology from Predictive Structure

The Cogito-to-prediction bridge supplies a common operational foundation rather than a mere vocabulary choice. On every finite self-verifying presentation with expected responses, updates, and verification statistics, Theorem P.6.1c.3 and Corollary P.6.1c.4 give a canonical predictive normal form, while Corollary P.6.1b.8b identifies physically retained distinctions with invariants of the finite response-presheaf quotient. Within that domain, Theorems 4–7 establish four structural necessities: an ordering parameter for verification and adaptation, distinguishable verification states, exploitable statistical dependence, and a representational medium. Thesis 2.6 may therefore organize time, space, energy, matter, force, and charge as operational projections of one predictive structure. Their specific realizations and uniqueness, however, follow only after the corresponding network, continuum, Hilbert, gauge, source, response, and strict-selection hypotheses are supplied.

Let the physically instantiated predictive structure be represented (at a chosen resolution) by the triple
$$
\mathfrak{P} := (\mathcal{N}, \mathcal{E}_N, V),
$$
where (i) $\mathcal{N}$ is the MPU interaction network (Section 11.1), with vertices given by MPUs (Definition 23) and propagation/throughput costs as in Definition 35, (ii) $\mathcal{E}_N$ is the nominated ND-RID `Evolve` interaction/update channel of Definition 27, which represents actualization only on the separately accepted Hilbert/Born/instrument/single-outcome branch, and (iii) $V$ is the PCE potential over configurations (Definition 20; Appendix D, Definition D.1):
$$
V(x)=V_{op}(x)+V_{prop}(x)-V_{benefit}(x)+V_{penalty}(x).
$$
Thermodynamic instantiation distinguishes a structural binary register size from a physical reset cost. A declared reusable binary SPAP implementation has structural log-cardinality $\varepsilon_0=\ln2$ (Proposition 5; Theorem J.1). On a branch satisfying the registered-reset hypotheses of Definition 28, the physical reset ledger obeys
$$
\varepsilon_{\mathrm{reset}}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}
\ge H_q(P\mid R),
$$
with $\varepsilon_{\mathrm{diss}}\ge0$ (Theorem 31; see also [Landauer 1961]). A positive uniform physical floor requires an independent bound $H_q(P\mid R)\ge h_{\min}>0$; $\varepsilon_0=\ln2$ alone supplies no ensemble-independent heat floor.

**Definition (Physical category).** A physical category $\mathfrak{C}$ is a family of operational observables used to describe the world (time, space, energy, matter, force, charge).

**Definition (Predictive derivation).** A category $\mathfrak{C}$ is predictively derived if its operational observables can be constructed as functionals of $\mathfrak{P}$ (including continuum limits selected by PCE), i.e., if there exists a map $\pi_{\mathfrak{C}}$ such that $\mathfrak{C}=\pi_{\mathfrak{C}}(\mathfrak{P})$.

**Thesis 2.6 (Categorical Unity).** In PU, each traditional physical category is a projection of the single instantiated predictive structure $\mathfrak{P}$. None of $\{\text{time, space, energy, matter, force, charge}\}$ is an additional ontological primitive beyond prediction under POP/PCE with physical instantiation.

### 2.6.1 Derivation Map (Operational Identifications)

| Category | Operational identification as a functional of $\mathfrak{P}$ | Primary PU locus |
|:---------|:-------------------------------------------------------------|:-----------------|
| Time | Predictive cycles have a directed verification/update ordering, sharpened to a thermodynamic arrow on the registered irreversible branch. Theorem 29 supplies an internal characteristic timescale; a positive minimum tick for every update is separate clock-certificate data. | Theorem 4; Definition 27; Theorem 29; Theorem 31; Appendix O |
| Space | Propagation costs define $d_{\mathcal N}$. Theorem 43 makes certified irregular global minimizers impossible only on its strict-comparator branch; a continuum manifold and metric additionally require the independent Theorem-43.5 package and Theorems 44–45. | Definition 35; Theorem 43; Theorem 43.5; Theorems 44–45 |
| Spacetime unity | Nonzero spacing, a separately registered positive edge-update duration, serialized propagation, and bounded weights give the uniform operational speed upper bound of Theorem 46. An attained normalized frontier $c=\delta/\tau_{\min}$ requires the separate uniform-weight one-link-attainment branch. The Appendix Z contract fixes only the Euclidean response-carrier value $D=4$; identifying it with spacetime dimension and Lorentzian signature requires Corollary 46a and the full Appendix O package. | Theorem 46; Corollary 46a; Definition Z.9a; Theorem Z.11; Appendix O; Appendix P (P.8.11) |
| Energy | Resource-cost rates $R(C)$ and $R_I(C)$ lift to cost operators, while Theorem 29 identifies the internal Hamiltonian and a characteristic task-dependent timescale. A universal minimum update duration is not used. Coarse-graining yields $T_{\mu\nu}^{(MPU)}$ only on the Appendix B branch. | Definition 3; Theorem 3; Theorem 29; Appendix B (Definition B.8) |
| Matter | Persistent, localized predictive structure: MPUs (Definition 23) and their stable aggregates (Definition 29) support field-like degrees of freedom on $(M,g)$ whose stable internal sectors are determined by the topology of the MPU perspective space (Definition 25 with $d_0=8$; Appendix R). | Definition 23; Definition 25; Definition 29; Appendix R |
| Force | Effective response channels selected by PCE as responses of $\mathfrak{P}$ to gradients, curvatures, holonomies, or capacity deficits of the same underlying cost structure. The response channels split by the Equivalence–Constitutive Separation Law: metric-universal channels have a common source/response ledger and carry an equivalence principle; sector-selective channels carry retained charge, representation, material, or constitutive labels and do not carry a universal equivalence principle. Generalized forces are gradients of $V$ (Definition 20; Appendix D, Definition D.1), gauge forces are internal connection/representation responses (Appendix G), and gravity is the metric-universal response sourced by $T_{\mu\nu}^{(MPU)}$ (Theorem 50; Appendix N, Theorem N.11a). | Definition 20; Appendix D (Definition D.1); Appendix G; Theorem 50; Appendix N (Theorem N.11a); Appendix X |

| Charge | The representation weight $q$ in $D_\mu=\partial_\mu+\Omega_\mu+iqA_\mu$ specifies participation in a local gauge connection only on the separately reconstructed Appendix G symmetry branch. The arithmetic density of a chosen cyclic phase subgroup in $U(1)$ does not derive local gauge redundancy, a connection, or a Noether current; those require the Appendix G and Appendix X operational-symmetry hypotheses. Charge quantization additionally depends on the global bundle structure and boundary conditions, while numerical interaction strength requires its own normalized shadow-price or capacity-boundary certificate. | Appendix G (Definition G.4.1; Equation G.6.3); Appendix X (Theorem X.8c); Appendix Z (Corollary Z.8.2a) |

This map provides operational constructions from $(\mathcal{N},\mathcal{E}_N,V)$, and the familiar laws of each category arise as coarse‑grained consequences of the same branch-indexed PCE variational grammar and thermodynamic response structure (Appendix D, Definition D.1f and Theorem D.1g; Appendix X).

### 2.6.2 Structural Identities (Inter‑Category Relations as Necessities)

Because the categories are projections of one structure, canonical inter‑category relations appear as internal identities rather than independent empirical "bridges":

1. **Mass–energy equivalence.** On $\mathfrak B_{mass}$, rest energy is the proper-time action-rate assigned to the maintained relational-information ledger; outside that branch PU does not derive the absolute coefficient.



2. **Lorentzian spacetime with invariant $c$.** Theorem 29 supplies a task-dependent characteristic timescale and Theorem 31 supplies a registered-reset entropy ledger; neither gives a universal edge-update clock or causal frontier. A uniform speed upper bound requires the independent nonzero-spacing, positive edge-clock, serialization, and bounded-weight hypotheses of Theorem 46. The normalization $c=\delta/\tau_{\min}$ additionally requires uniform weights and one-link frontier attainment. The Appendix Z contract fixes only the Euclidean response-carrier value $D=4$; its $3+1$ spacetime interpretation and Lorentzian signature follow only on the full Corollary 46a/Appendix O branch.

3. **Forces from connections/gradients.** In the continuum effective description, interactions are encoded in the connections required for predictive coherence: the internal connection $A_\mu$ (Appendix G) and the geometric/spin connection (Theorem 48) together form the transport structure whose curvature yields physical interaction content (Theorem 47). On $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$, Theorem N.6 identifies the accepted inertial coefficient with a certified relational action/update ledger only after a mechanical-realization certificate. It does not derive Newton's second law or a force law; those require the independent worldline and mechanical response maps of the declared Lorentzian branch. Where both packages coexist, relational reconfiguration cost is compatible with, but does not replace, the classical force response.


4. **Charge conservation.** On the branch carrying the accepted gauge-invariant minimally coupled action and the on-shell matter equations, variation gives $\nabla_\mu F^{\mu\nu}=J^\nu$ (Equation G.6.3), and antisymmetry of $F^{\mu\nu}$ yields $\nabla_\nu J^\nu=0$. Appendix G's quadratic link cost is a constructive realization of this branch; predictive coherence alone does not uniquely select minimal coupling or the complete local operator content.

5. **Equivalence principle and response separation.** On canonical $\mathfrak B_{mass}$, probe-independent realization maps $m_I=\beta_I L$ and $m_G=\beta_G L$ give a universal ratio. One independently calibrated reference probe with $m_G=m_I$ fixes that ratio to one for the tested class. Simplicity alone supplies neither realization map, metric universality, source exhaustion, nor the reference calibration:



### 2.6.3 Compressed Ontology Statement

The branch-indexed PU ontology thesis can be written as
$$
\boxed{
(\mathfrak P,\mathfrak B_{\mathfrak C})
\longmapsto
\pi_{\mathfrak C}^{\mathfrak B_{\mathfrak C}}(\mathfrak P),
\qquad
\mathfrak C\in
\{\text{time, space, energy, matter, force, charge}\},
}
$$
where $\mathfrak B_{\mathfrak C}$ denotes the category-specific hypotheses and certificates listed in the derivation map. On a registered reset branch, $\mathcal E_N$ obeys
$$
\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R),
$$
with a positive floor only when $H_q(P\mid R)\ge h_{\min}>0$ (Theorem 31). The potential $V$ belongs to the branch-indexed family of Definition D.1, Definition D.1f, and Theorem D.1g. The thesis treats the resulting categories as operational projections of one predictive model; it does not assert that the bare triple $(\mathcal N,\mathcal E_N,V)$ uniquely determines every projection.





