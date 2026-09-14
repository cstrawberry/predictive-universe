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

**Theorem 2.4.1b (Uniform Stagewise-Bound Criterion for a Full-Hierarchy Realizer).** Retain the finite program alphabet, integer-valued prefix-program length, nested admissible sets, and attained-minimum convention of Theorem 2.4.1a. For $B\in\mathbb N$, define the finite prefix-program census
$$
\mathcal W_{\le B}:=\{P:K(P)\le B\}.
\tag{2.4.1b.1}
$$
For a fixed microstate $\mu$, the following conditions are equivalent:

1. $\mu$ is full-constraint-realizable:
$$
\bigcap_{n\ge0}\mathcal M_n(\mu)\ne\varnothing.
$$
2. The stagewise realizers have a uniform finite length bound: there is $B<\infty$ such that
$$
\mathcal M_n(\mu)\cap\mathcal W_{\le B}\ne\varnothing
\qquad(n\ge0).
\tag{2.4.1b.2}
$$
3. The stagewise minima are uniformly finite:
$$
\sup_{n\ge0}C_{P,n}(\mu)<\infty.
\tag{2.4.1b.3}
$$

When these conditions hold,
$$
c_\mu
:=
\sup_{n\ge0}C_{P,n}(\mu)
=
C_P(\mu)
=
\min_{P\in\cap_{n\ge0}\mathcal M_n(\mu)}K(P).
\tag{2.4.1b.4}
$$
Moreover, the finite sets
$$
S_n^{(c_\mu)}
:=
\{P\in\mathcal M_n(\mu):K(P)=c_\mu\}
\tag{2.4.1b.5}
$$
form a nonempty descending sequence and stabilize to
$$
S_\infty^{(c_\mu)}
=
\operatorname*{arg\,min}_{P\in\cap_{n\ge0}\mathcal M_n(\mu)}K(P).
\tag{2.4.1b.6}
$$

*Proof.* Condition 1 implies condition 2 with $B=K(P_{\mathrm{phys}})$ for any common witness. Condition 2 implies condition 3 because every stage has a program of length at most $B$. Conversely, under condition 3 choose an integer $B$ bounding all $C_{P,n}(\mu)$. The sets
$$
T_n:=\mathcal M_n(\mu)\cap\mathcal W_{\le B}
$$
are nonempty, satisfy $T_{n+1}\subseteq T_n$, and lie in the finite set $\mathcal W_{\le B}$. A descending sequence of nonempty subsets of a finite set stabilizes to a nonempty set. Every member of that stable set belongs to every $\mathcal M_n(\mu)$, proving condition 1.

Theorem 2.4.1a now gives finite stabilization of the integer minima and the equality in (2.4.1b.4). A minimum-length common realizer belongs to every set in (2.4.1b.5), so those sets are nonempty. They are descending subsets of the finite length-$c_\mu$ census and therefore stabilize. A program lies in their stable value exactly when it belongs to every refinement and has length $c_\mu$, which proves (2.4.1b.6). ∎

**Corollary 2.4.1b.a (Empty-Hierarchy Alternative).** Under the hypotheses of Theorem 2.4.1b,
$$
\bigcap_{n\ge0}\mathcal M_n(\mu)=\varnothing
\quad\Longleftrightarrow\quad
(\forall B\in\mathbb N)(\exists n\ge0)\;
\mathcal M_n(\mu)\cap\mathcal W_{\le B}=\varnothing
\quad\Longleftrightarrow\quad
\sup_{n\ge0}C_{P,n}(\mu)=\infty.
\tag{2.4.1b.7}
$$

*Proof.* The first equivalence is the contrapositive of conditions 1 and 2 in Theorem 2.4.1b. The attained-minimum convention identifies failure of the length-$B$ census with $C_{P,n}(\mu)>B$ or $C_{P,n}(\mu)=\infty$, giving the second equivalence. ∎

**Theorem 2.4.1c (Uniform Effective-Stabilization Obstruction).** Suppose the fixed universal-machine presentation admits finite programs $P_0,P_1$ and encoded microstates $\mu_{\mathrm{ref}},\mu$ satisfying
$$
U(P_0,\mu_{\mathrm{ref}})
=
U(P_1,\mu_{\mathrm{ref}})
=\mu,
\qquad
K(P_0)<K(P_1).
\tag{2.4.1c.0}
$$
On the class of uniformly decidable nested hierarchies over this presentation that satisfy the finite-alphabet and integer-length hypotheses of Theorem 2.4.1a and carry $P_1$ as a supplied common witness, there is no total algorithm that always returns a nonnegative integer $N$ such that
$$
C_{P,n}(\mu)=C_{P,N}(\mu)
\qquad(n\ge N).
\tag{2.4.1c.1}
$$

*Proof.* For a machine code $e$ and input $w$, prepend one idle transition and define
$$
\mathcal M_n^{e,w}
=
\begin{cases}
\{P_0,P_1\},&
e(w)\text{ has not halted within }n\text{ transitions},\\[2mm]
\{P_1\},&
e(w)\text{ has halted within }n\text{ transitions}.
\end{cases}
\tag{2.4.1c.2}
$$
Membership is uniformly decidable by an $n$-transition simulation, the hierarchy is nested, and $P_1$ is a supplied common witness. Suppose the stated algorithm returns $N$. Simulate $e(w)$ for $N$ transitions. If it has halted, report halting. If it has not halted, a later halt at a transition $T>N$ would give $C_{P,N}=K(P_0)$ and $C_{P,T}=K(P_1)$, contradicting (2.4.1c.1). The second outcome therefore reports nonhalting. This would decide the halting problem, contradicting its undecidability; it is the halting reduction used in the proof of Theorem A.2.3 with $\mathsf{TERM}$ as the fixed target property. ∎

**Definition 2.4.1d (Finite Full-Hierarchy Closure Certificates).** On an effectively arithmetized constraint hierarchy, define the canonical precommit core
$$
\mathfrak H_{\mathrm{pre}}
=
\left(
\iota_H,\Sigma,U,\mathsf{Code}_\mu,\mu_{\mathrm{ref}},K,
\mathfrak I_H,\mathcal P_{\mathrm{par}},
\mathsf G_{\mathcal L},\rho_{\mathcal L},
\mathfrak T_{\mathsf V},\widehat{\mathfrak B}_{\mathrm{pre}},
\Pi_H^{\mathrm{pre}}
\right).
$$
Its immutable commitment witness is
$$
\kappa_H
=
(h_{\mathrm{pre}},t_{\mathrm{lock}},\iota_{\mathrm{commit}},
\sigma_{\mathrm{cust}}),
$$
where $h_{\mathrm{pre}}$ is the hash of the canonical serialization of $\mathfrak H_{\mathrm{pre}}$, and $\iota_{\mathrm{commit}}$ or $\sigma_{\mathrm{cust}}$ authenticates that hash and lock time. The completed **hierarchy-registration record** is the finite tuple
$$
\mathfrak H_0
=
(\mathfrak H_{\mathrm{pre}},\kappa_H,
\mathfrak B_{\mathrm{post}},\chi_H).
\tag{2.4.1d.1}
$$
Here $\iota_H$ is a stable identifier; $\Sigma$ is the finite program alphabet; every finite string $P\in\Sigma^*$ is a syntactic program candidate; $U$ is the registered partial prefix machine; and
$$
K(P)=|P|_\Sigma
\qquad(P\in\Sigma^*)
$$
is total and integer-valued. The set $\mathsf{Code}_\mu$ consists of finite canonical microstate codes with literal decidable equality, and $\mu_{\mathrm{ref}}\in\mathsf{Code}_\mu$ is fixed by the hierarchy registration.

The independently frozen inventory
$$
\mathfrak I_H
=
(h_{\mathrm{src}},\mathsf E_H,\mathcal I_H,\pi_{\mathrm{own}})
$$
contains a source-snapshot hash, a typed eligibility rule $\mathsf E_H$, a classification of every constraint-owning declaration in that snapshot, and a checked proof that every owner is included or excluded exactly once with its source, status, and reason. The finite manifest $\mathcal P_{\mathrm{par}}$ records the exact statement, type, source, dependency set, and hash of every eligible parent constraint schema. The total generator $\mathsf G_{\mathcal L}$ emits the sentence $P\in\mathcal L_n$, and $\rho_{\mathcal L}$ is a well-founded rank on its finite schema-dependency graph.

The trust-base record
$$
\mathfrak T_{\mathsf V}
=
(\iota_{\mathsf V},h_{\mathsf V},\mathcal A_{\mathsf V},\Pi_{\mathrm{sound}})
$$
fixes a named, versioned, total proof checker $\mathsf V$, its finite axiom allowlist $\mathcal A_{\mathsf V}$, and an independently accepted soundness theorem for the registered interpretation. The allowlist is a PU-independent logical and arithmetic trust root. Every hierarchy-specific premise occurs instead in $\mathcal P_{\mathrm{par}}$. Soundness has the form
$$
\mathsf V(\pi,\ulcorner\varphi\urcorner)=1
\quad\Longrightarrow\quad
\varphi.
\tag{2.4.1d.2}
$$
The builder-visible precommit provenance record $\widehat{\mathfrak B}_{\mathrm{pre}}$ contains the prompt and input hashes, a commitment certificate
$$
\mathfrak C_Q
=
(\iota_{\mathrm{Com}},h_{\mathrm{Com}},\mathsf{par}_{\mathrm{Com}},
L_{\mathrm{pad}},\mathcal P_{\mathrm{prov}},\Pi_{\mathrm{Com}}),
$$
a commitment $c_Q$, the admitted-access boundary, the deterministic hierarchy-builder source, the complete pre-lock read-access transcript, and the responsible process identifier and prior-exposure status. Here $\mathcal P_{\mathrm{prov}}$ is a finite target-independent manifest of the exact commitment, signature, randomness, and clock assumptions, sources, versions, and hashes, while $\Pi_{\mathrm{Com}}$ contains checked proofs that canonical padding is injective and has fixed public length $L_{\mathrm{pad}}$, that opening is exact, that the commitment is perfectly hiding under certified uniform fresh randomness, and that it is binding in the registered security model. The corresponding custodian envelope is
$$
\mathfrak Q_H
=
(\mathcal Q_H,\mathsf{Cl}_H,\mathcal T_H,\Pi_T,
r_Q,\pi_{\mathrm{rng}},t_Q,\sigma_Q),
$$
where $\mathcal Q_H$ is the finite seed quarantine set, $\mathsf{Cl}_H$ is an independently reviewed finite transform grammar on finite artifact strings, and $\mathcal T_H$ is a finite canonical enumeration. The finite proof tuple $\Pi_T$ verifies that $\mathcal Q_H\subseteq\mathcal T_H$, supplies a grammar derivation of every member of $\mathcal T_H$ from $\mathcal Q_H$, and proves that $\mathcal T_H$ is closed under every rule of $\mathsf{Cl}_H$. Thus $\mathcal T_H$ is exactly the least $\mathsf{Cl}_H$-closed taint set and membership terminates by finite lookup. If $e_Q$ is the canonical serialization of $(\mathcal Q_H,\mathsf{Cl}_H,\mathcal T_H,\Pi_T)$, then
$$
c_Q
=
\mathsf{Com}_{\mathsf{par}_{\mathrm{Com}}}
(\mathsf{Pad}_{L_{\mathrm{pad}}}(e_Q);r_Q).
$$
The artifact $\pi_{\mathrm{rng}}$ authenticates an independent uniform draw of $r_Q$ in the registered randomness space before the custodian time $t_Q$, and $\sigma_Q$ binds $(\iota_{\mathrm{Com}},c_Q,e_Q,t_Q)$ to the custodian. The responsible process has no read access to the plaintext envelope before unblinding. The post-lock record is
$$
\mathfrak B_{\mathrm{post}}
=
(\mathsf{Trace}_{\mathrm{post}},t_{\mathrm{open}},\mathfrak Q_H,b_H,
\pi_{\mathrm{blind}}),
\qquad
b_H\in\{\mathsf{dependency\mbox{-}blind},
\mathsf{target\mbox{-}blind}\},
$$
where $\mathsf{Trace}_{\mathrm{post}}$ records access between locking and unblinding and $t_{\mathrm{open}}$ is the authenticated unblinding time.

Write
$$
\Pi_H^{\mathrm{pre}}
=
(\pi_{\mathrm{syn}},\pi_{\mathrm{tot}},\pi_{\mathrm{cov}},
\pi_{\subset},\pi_{\mathrm{dep}}).
\tag{2.4.1d.3}
$$
The hierarchy registration is accepted only when $\mathsf V$ verifies finite proofs of all the following claims:

1. $\Sigma^*$ has decidable syntax, $K(P)=|P|_\Sigma$ on every string, canonical microstate-code equality is literal and decidable, and $\mathsf G_{\mathcal L}$ is total.
2. The coverage map between $\mathcal I_H$ and $\mathcal P_{\mathrm{par}}$ is one-to-one on every $\mathsf E_H$-eligible owner, every excluded owner has its checked typed reason, and $\mathsf G_{\mathcal L}$ generates exactly the hierarchy compiled from that complete eligible manifest.
3. The relation $\mathcal L_{n+1}\subseteq\mathcal L_n$ holds for every $n$. Every generated schema-dependency edge strictly lowers $\rho_{\mathcal L}$ and terminates in $\mathcal P_{\mathrm{par}}\cup\mathcal A_{\mathsf V}$.
4. The transitive source-and-dependency manifest of every entry in $\mathcal P_{\mathrm{par}}$ is finite and acyclic. Its leaves are frozen inventory owners or members of the PU-independent trust root. No manifest entry or dependency asserts, or has a checked same-language equivalence to, a common realizer, a hierarchy minimum, a stabilization cutoff, or global hierarchy emptiness; and no entry is defined using $C_P$, $C_{op}$, an MPU, or a downstream result whose hypotheses already use those objects.
5. Replay of the registered builder on the admitted inputs reproduces the builder-derived hierarchy fields, generated literals, and proof objects byte-for-byte. The pre-lock transcript in $\widehat{\mathfrak B}_{\mathrm{pre}}$ contains no read outside the admitted boundary; every finite prompt, admitted input, builder-source token or literal, generated hierarchy field or literal, and proof input fails membership in $\mathcal T_H$; recomputation gives $h_{\mathrm{pre}}$; and $\kappa_H$ authenticates $(h_{\mathrm{pre}},t_{\mathrm{lock}})$ in an append-only commitment ledger or by the registered custodian signature. After unblinding, the checker verifies $\Pi_{\mathrm{Com}}$, $\Pi_T$, and $\pi_{\mathrm{rng}}$, verifies the displayed opening equation, verifies $t_Q\le t_{\mathrm{lock}}<t_{\mathrm{open}}$, and checks $\sigma_Q$. The record $\mathfrak B_{\mathrm{post}}$ and proof $\pi_{\mathrm{blind}}$ authenticate $t_{\mathrm{open}}$ and the provenance class. Target-blind status additionally requires a responsible process with no prior target access in the registered isolation environment and is relative to the accepted security model in $\mathcal P_{\mathrm{prov}}$. A process with prior exposure, plaintext-envelope access before $t_{\mathrm{open}}$, a failed commitment or taint check, or an incomplete access transcript carries dependency-blind status and does not satisfy this item.

Accordingly, an accepted hierarchy-registration record has $b_H=\mathsf{target\mbox{-}blind}$. A dependency-blind record may be retained as a finite rejected audit record, but it does not satisfy item 5 and cannot supply an accepted $\mathfrak H_0$.

The checker-extracted dependency DAG of every hierarchy proof in $\Pi_H^{\mathrm{pre}}$ must itself be finite and acyclic with leaves in $\mathcal P_{\mathrm{par}}\cup\mathcal A_{\mathsf V}$. The dependency DAGs of the provenance proofs in $\Pi_{\mathrm{Com}}\cup\Pi_T\cup\{\pi_{\mathrm{rng}},\pi_{\mathrm{blind}}\}$ must be finite and acyclic with leaves in $\mathcal P_{\mathrm{prov}}\cup\mathcal A_{\mathsf V}$, and no provenance premise may occur in a hierarchy-proof DAG. The record $\chi_H$ verifies the inventory, access, dependency, source, and artifact hashes, validates $\kappa_H$ against $\mathfrak H_{\mathrm{pre}}$, validates the finite envelope and opening against $c_Q$ and $\mathfrak C_Q$, and verifies that the precommit precedes access to the target microstate, candidate realizer, candidate minimum, exclusion levels, and minimizer family. Denote the hash of the accepted completed record $\mathfrak H_0$ by $h_H$.

For every submitted target code, define the extended stage supremum
$$
C_{P,\mathrm{ext}}^{(h_H)}(\mu)
:=
\sup_{n\ge0}C_{P,n}^{(h_H)}(\mu)
\in\mathbb N\cup\{\infty\}.
\tag{2.4.1d.3a}
$$
This quantity is defined whether or not the full hierarchy has a common realizer. By Theorem 2.4.1b and Corollary 2.4.1b.a,
$$
C_{P,\mathrm{ext}}^{(h_H)}(\mu)
=
\begin{cases}
C_P^{(h_H)}(\mu),&
\displaystyle\bigcap_{n\ge0}\mathcal M_n^{(h_H)}(\mu)\ne\varnothing,\\[2mm]
\infty,&
\displaystyle\bigcap_{n\ge0}\mathcal M_n^{(h_H)}(\mu)=\varnothing.
\end{cases}
\tag{2.4.1d.3b}
$$
The symbol $C_P^{(h_H)}$ in the first branch has the same full-constraint-realizability domain as $C_P$ in Section 2.4.1.

A **baseline-identity extension** $(h_H,h_{\mathrm{base}},\pi_{\mathrm{id}},\chi_{\mathrm{id}})$ is accepted when $h_{\mathrm{base}}=h_{\mathrm{src}}$ is the precommitted source snapshot owning Section 2.4.1, the inventory audit verifies inclusion of every $\mathsf E_H$-eligible physical constraint owner, and $\mathsf V$ verifies
$$
\Sigma^{(h_H)}=\Sigma^{\mathrm{base}},
\quad
U^{(h_H)}=U^{\mathrm{base}},
\quad
\mathsf{Code}_\mu^{(h_H)}=\mathsf{Code}_\mu^{\mathrm{base}},
\quad
\mu_{\mathrm{ref}}^{(h_H)}=\mu_{\mathrm{ref}}^{\mathrm{base}},
\quad
K^{(h_H)}=K^{\mathrm{base}},
$$
$$
(\forall n)(\forall P\in\Sigma^*)\quad
P\in\mathcal L_n^{(h_H)}
\Longleftrightarrow
P\in\mathcal L_n^{\mathrm{base}}.
$$
These identities give
$$
\mathcal M_n^{(h_H)}(\mu)
=\mathcal M_n^{\mathrm{base}}(\mu),
\qquad
C_{P,n}^{(h_H)}(\mu)
=C_{P,n}^{\mathrm{base}}(\mu)
\tag{2.4.1d.3c}
$$
for every submitted target code $\mu$ and every $n$, and hence
$$
C_{P,\mathrm{ext}}^{(h_H)}(\mu)
=C_{P,\mathrm{ext}}^{\mathrm{base}}(\mu)
\tag{2.4.1d.3d}
$$
for every submitted target code. For a target with a common full-hierarchy realizer, Theorem 2.4.1b identifies both finite extended values with their domain-defined complexities and gives
$$
C_P^{(h_H)}(\mu)=C_P^{\mathrm{base}}(\mu).
\tag{2.4.1d.3e}
$$
For an empty full hierarchy, (2.4.1d.3d) remains valid with value $\infty$, while neither side of (2.4.1d.3e) is defined. The record $\chi_{\mathrm{id}}$ verifies the proof dependencies and all snapshot, inventory, generator, and proof hashes.

For a target code $\mu\in\mathsf{Code}_\mu$ submitted after hierarchy commitment, write $\mathcal L_n^{(h_H)}$, $\mathcal M_n^{(h_H)}(\mu)$, $C_{P,n}^{(h_H)}(\mu)$, and $C_{P,\mathrm{ext}}^{(h_H)}(\mu)$ for the hierarchy-relative objects. When an accepted common realizer establishes full-constraint realizability, also write $C_P^{(h_H)}(\mu)$ for the finite value in (2.4.1d.3b). Acceptance of the baseline-identity extension identifies the stagewise and extended objects with their unsuperscripted baseline counterparts for every submitted target and identifies $C_P^{(h_H)}$ with $C_P$ on their common full-realizability domain.

For a submitted target code $\mu\in\mathsf{Code}_\mu$ and candidate $P_\infty\in\Sigma^*$, write $c=K(P_\infty)$ and
$$
\mathcal W_{<c}:=\{Q\in\Sigma^*:K(Q)<c\},
\qquad
\mathcal W_{=c}:=\{Q\in\Sigma^*:K(Q)=c\}.
$$
A **minimum-value realizer certificate** is the finite record
$$
\mathfrak C_{\mathrm{real}}(\mu)
=
\left(
h_H,\mu,P_\infty,\tau_\infty,\pi_0,\pi_+,
\{(Q,e_Q,\pi_Q^-)\}_{Q\in\mathcal W_{<c}},
\chi_{\mathrm{real}}
\right).
\tag{2.4.1d.4}
$$
It is accepted when all of the following finite checks pass.

1. The hash $h_H$ resolves to the accepted hierarchy registration, $\mu$ is a canonical finite code, and $\tau_\infty$ verifies literal equality of the finite output code $U(P_\infty,\mu_{\mathrm{ref}})$ with $\mu$ and verifies $K(P_\infty)=c$.
2. The registered proof checker accepts
$$
\mathsf V\!\left(
\pi_0,
\left\ulcorner P_\infty\in\mathcal L_0^{(h_H)}\right\urcorner
\right)=1,
\qquad
\mathsf V\!\left(
\pi_+,
\left\ulcorner
(\forall n)\bigl[P_\infty\in\mathcal L_n^{(h_H)}
\Longrightarrow P_\infty\in\mathcal L_{n+1}^{(h_H)}\bigr]
\right\urcorner
\right)=1.
\tag{2.4.1d.5}
$$
3. The indexed family contains every member of the mechanically enumerable finite set $\mathcal W_{<c}$ exactly once, and
$$
e_Q\in\mathbb N,
\qquad
\mathsf V\!\left(
\pi_Q^-,
\left\ulcorner
Q\notin\mathcal M_{e_Q}^{(h_H)}(\mu)
\right\urcorner
\right)=1
\quad(Q\in\mathcal W_{<c}).
\tag{2.4.1d.6}
$$
4. For $\tau_\infty$, $\pi_0$, $\pi_+$, and every $\pi_Q^-$, the checker extracts a finite acyclic theorem-and-axiom dependency DAG whose leaves lie in $\mathcal P_{\mathrm{par}}\cup\mathcal A_{\mathsf V}$. The record $\chi_{\mathrm{real}}$ verifies those manifests, the exhaustive candidate census, and every source, registration, checker, execution, and proof hash.

Define the value-stabilization cutoff
$$
N_{\mathrm{val}}(\mathfrak C_{\mathrm{real}})
:=
\max\!\left(
\{e_Q:Q\in\mathcal W_{<c}\}\cup\{0\}
\right).
\tag{2.4.1d.7}
$$

An **exact-minimizer certificate** is the finite extension
$$
\mathfrak C_{\mathrm{arg}}(\mu)
=
\left(
\mathfrak C_{\mathrm{real}}(\mu),S_\infty,
\{(P,\tau_P,\pi_{0,P},\pi_{+,P})\}_{P\in S_\infty},
\{(Q,e_Q,\pi_Q^-)\}_{Q\in\mathcal W_{=c}\setminus S_\infty},
\chi_{\mathrm{arg}}
\right),
\tag{2.4.1d.8}
$$
where $S_\infty$ is a nonempty subset of $\mathcal W_{=c}$ containing $P_\infty$. For every $P\in S_\infty$, the execution, base, and persistence artifacts pass the checks in items 1, 2, and 4. For every $Q\in\mathcal W_{=c}\setminus S_\infty$, the registered checker verifies
$$
e_Q\in\mathbb N,
\qquad
\mathsf V\!\left(
\pi_Q^-,
\left\ulcorner
Q\notin\mathcal M_{e_Q}^{(h_H)}(\mu)
\right\urcorner
\right)=1,
\tag{2.4.1d.9}
$$
and its checker-extracted dependency DAG passes item 4. The record $\chi_{\mathrm{arg}}$ verifies the exact length-$c$ census, all added dependencies and hashes, and the accepted core reference. Define
$$
N_{\mathrm{arg}}
:=
\max\!\left(
\{N_{\mathrm{val}}\}
\cup
\{e_Q:Q\in\mathcal W_{=c}\setminus S_\infty\}
\right).
\tag{2.4.1d.10}
$$

For $B\in\mathbb N$, a **bounded exclusion certificate** is the exhaustive finite record
$$
\mathfrak C_{\varnothing,\le B}(\mu)
=
\left(
h_H,\mu,B,
\{(Q,e_Q,\pi_Q^-)\}_{Q\in\mathcal W_{\le B}},
\chi_{\varnothing}
\right),
\tag{2.4.1d.11}
$$
where $\mu$ is a canonical finite code, every displayed proof is accepted for $Q\notin\mathcal M_{e_Q}^{(h_H)}(\mu)$, and $\chi_{\varnothing}$ verifies the exhaustive census, the accepted hierarchy and trust-base references, the dependency manifests, and all proof and provenance hashes. 

A **global exclusion extension** is
$$
\mathfrak C_{\varnothing}(\mu)
=
(\mathfrak C_{\varnothing,\le B}(\mu),\omega,\pi_\omega,
\chi_{\mathrm{glob}}),
\qquad
\omega\in\{\mathsf{cap},\mathsf{direct}\},
\tag{2.4.1d.12}
$$
where $\pi_{\mathsf{cap}}$ proves that every full-hierarchy realizer has length at most $B$, or $\pi_{\mathsf{direct}}$ proves that every program fails some finite hierarchy level. The proof and $\chi_{\mathrm{glob}}$ pass the same trust-base, dependency, and hash checks.

**Theorem 2.4.1e (Effective Stabilization from an Accepted Realizer Certificate).** If $\mathfrak C_{\mathrm{real}}(\mu)$ is accepted, then $P_\infty$ is a minimum-length full-constraint realizer for the registered hierarchy and
$$
C_{P,n}^{(h_H)}(\mu)
=
C_P^{(h_H)}(\mu)
=
c
=
\min_{P\in\cap_{j\ge0}\mathcal M_j^{(h_H)}(\mu)}K(P)
\qquad
\bigl(n\ge N_{\mathrm{val}}\bigr).
\tag{2.4.1e.1}
$$
The terminating verifier confirms the submitted realizer and returns
$$
\mathfrak C_{\mathrm{real}}(\mu)
\longmapsto
\bigl(\mathsf{accepted},h_H,\mu,P_\infty,c,N_{\mathrm{val}}\bigr).
\tag{2.4.1e.2}
$$
If $\mathfrak C_{\mathrm{arg}}(\mu)$ is accepted, then
$$
\{P\in\mathcal M_n^{(h_H)}(\mu):K(P)=c\}
=
S_\infty
=
\operatorname*{arg\,min}_{P\in\cap_{j\ge0}\mathcal M_j^{(h_H)}(\mu)}K(P)
\qquad
\bigl(n\ge N_{\mathrm{arg}}\bigr).
\tag{2.4.1e.3}
$$

*Proof.* The accepted registration fixes the hierarchy and its nesting relation. Soundness of $\mathsf V$, the verified execution trace, and (2.4.1d.5) place $P_\infty$ in every $\mathcal M_n^{(h_H)}(\mu)$ by induction. Let $n\ge N_{\mathrm{val}}$ and $Q\in\mathcal W_{<c}$. Equation (2.4.1d.6) gives $Q\notin\mathcal M_{e_Q}^{(h_H)}(\mu)$, while nesting and $n\ge e_Q$ give
$$
\mathcal M_n^{(h_H)}(\mu)\subseteq\mathcal M_{e_Q}^{(h_H)}(\mu).
$$
Hence $Q\notin\mathcal M_n^{(h_H)}(\mu)$. The stage-$n$ minimum is at least $c$, and the permanent candidate $P_\infty$ attains $c$, proving (2.4.1e.1). The checker is total and every submitted census, trace, proof, dependency manifest, and maximum is finite. It therefore verifies the supplied $P_\infty$, computes $c$ and $N_{\mathrm{val}}$, and returns (2.4.1e.2). Theorem 2.4.1c governs uniform cutoff construction from hierarchy code; (2.4.1e.2) governs terminating verification of submitted finite evidence.

For an accepted exact-minimizer certificate, every supplied member of $S_\infty$ survives every level. Every other length-$c$ program is absent from every level at or beyond its certified exclusion level. At $n\ge N_{\mathrm{arg}}$ the length-$c$ slice is therefore exactly the supplied and verified set $S_\infty$. Equation (2.4.1e.1) identifies that slice with both the stagewise and full-hierarchy minimizer families, proving (2.4.1e.3). ∎

**Corollary 2.4.1e.a (Bounded and Global Emptiness Certificates).** Acceptance of $\mathfrak C_{\varnothing,\le B}(\mu)$ gives
$$
\left(
\bigcap_{n\ge0}\mathcal M_n^{(h_H)}(\mu)
\right)
\cap\mathcal W_{\le B}
=
\varnothing.
\tag{2.4.1e.1.1}
$$
Each accepted pair $(e_Q,\pi_Q^-)$ is a finite counterexample certificate to $Q$ as a full-constraint realizer. If the global exclusion extension is accepted in $\mathsf{cap}$ mode, its proof establishes
$$
(\forall P)\left[
P\in\bigcap_{n\ge0}\mathcal M_n^{(h_H)}(\mu)
\Longrightarrow K(P)\le B
\right],
\tag{2.4.1e.1.2}
$$
and the extension proves
$$
\bigcap_{n\ge0}\mathcal M_n^{(h_H)}(\mu)=\varnothing.
\tag{2.4.1e.1.3}
$$
If the global exclusion extension is accepted in $\mathsf{direct}$ mode, its proof establishes the equivalent sentence
$$
(\forall P)(\exists n\ge0)\;
P\notin\mathcal M_n^{(h_H)}(\mu)
\tag{2.4.1e.1.4}
$$
and therefore proves (2.4.1e.1.3).

*Proof.* For every $Q\in\mathcal W_{\le B}$, soundness gives an index $e_Q$ with $Q\notin\mathcal M_{e_Q}^{(h_H)}(\mu)$, so $Q$ cannot belong to the full intersection. This proves (2.4.1e.1.1). Equations (2.4.1e.1.1) and (2.4.1e.1.2) make a member of the full intersection impossible, proving (2.4.1e.1.3). The equivalence of (2.4.1e.1.3) and (2.4.1e.1.4) follows by expanding membership in the intersection. ∎

Every value, realizer, cutoff, and exclusion conclusion above is relative to the accepted hierarchy hash. Acceptance of the baseline-identity extension and its physical-constraint inventory coverage identifies the stagewise and extended hierarchy values for every submitted target and identifies $C_P^{(h_H)}$ with the baseline $C_P$ on the full-constraint-realizable domain. On an accepted global exclusion extension, the empty-intersection conclusion is equivalently $C_{P,\mathrm{ext}}^{(h_H)}(\mu)=\infty$; $C_P^{(h_H)}(\mu)$ is then outside its declared domain. Finite PPI instantiation remains governed by Definition P.6.2, and identification of a domain-defined $C_P$ with the operational proxy $\langle\hat C_v\rangle$ remains governed by Theorem 2.

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

**Resolution record 2.4.1-R1 (Full-Hierarchy Classification).** Theorems 2.4.1a--2.4.1e and Corollaries 2.4.1b.a and 2.4.1e.a resolve the mathematical component of `TV-FND-01`. For every hierarchy satisfying the frozen finite-alphabet, integer-length, nesting and attained-stage-minimum hypotheses, Theorem 2.4.1b gives the exhaustive dichotomy
$$
\sup_n C_{P,n}(\mu)<\infty
\Longleftrightarrow
\bigcap_n\mathcal M_n(\mu)\ne\varnothing,
$$
identifies the stable minimum and complete minimizer set, and Corollary 2.4.1b.a classifies the empty alternative. Theorem 2.4.1c is `negative-refutation` of a uniform algorithm that computes the stabilization index from arbitrary uniformly decidable hierarchy code, while Theorem 2.4.1e is `positive-discharge` of effective verification and cutoff extraction from an accepted finite realizer certificate.

**Resolution TV-FND-01-R1 (Metadata).** Exact domain: nested admissible-program hierarchies under the finite-alphabet, integer-length and attained-stage-minimum convention. Premises: Theorems 2.4.1a--2.4.1e's frozen hypotheses. Equivalence: exact equality of registered program strings and minimizer sets. Budget: the full countable hierarchy for the structural theorem and the submitted finite trace for certificate verification. Verifier: the nesting/cardinality proof and Theorem 2.4.1e's exact certificate checker. Falsifier: a bounded-minimum hierarchy with empty full intersection, a full realizer outside the stable minimizer set, or an accepted cutoff failing later. Provenance class: source-internal exact mathematics with no empirical input. Downstream consumers: Definition 17, Definition 13 and every branch using domain-defined $C_P$. Nonvacuity: the explicit two-program hierarchies in Corollary 2.4.1a.1 and Theorem 2.4.1c.

The remaining gate is instance-level rather than a missing mathematical alternative: no accepted target-blind hierarchy registration, baseline-identity extension and populated realizer or global-exclusion certificate is supplied for a physical microstate. Finite PPI realization is also separate. Accordingly `TV-FND-01` retains `C+R`; its mathematical hierarchy classification is complete, while certificate population and physical realization remain live.

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

The Cogito-to-prediction bridge supplies the common operational foundation for this organization. On every finite self-verifying presentation with expected responses, updates, and verification statistics, Theorem P.6.1c.3 and Corollary P.6.1c.4 give a canonical predictive normal form, while Corollary P.6.1b.8b identifies physically retained distinctions with invariants of the finite response-presheaf quotient. Within that domain, Theorems 4–7 establish an ordering parameter for verification and adaptation, distinguishable verification states, exploitable statistical dependence, and a representational medium. Definition 2.6a separately registers the six semantic labels, protocol families, response restrictions, branch predicates, and overlap obligations for time, space, energy, matter, force, and charge; Theorem 2.6b classifies their finite compatible lifts. Definition 2.6c and Theorem 2.6d supply the finite gates for a common PPI-physicalizable carrier, source and ownership closure, calibration, and any strict target-independent PPI/PCE selection. Empirical realization identification retains the independent record of Definition P.14.9g.

At a chosen finite resolution, fix a registered self-verifying operational presentation $\mathfrak T$ and write
$$
\mathfrak P_0
:=
\mathcal N_{\mathrm{pred}}(\mathfrak T)
=
(\mathsf P,\mathcal R_{\mathfrak T},U_{\mathfrak T},V_{\mathfrak T})
\tag{2.6.0}
$$
for its canonical predictive normal form from Definition P.6.1c.2 and Theorem P.6.1c.3. A finite-cost PPI-physicalizable branch may enrich this response-level object to
$$
\mathfrak{P} := (\mathcal{N}, \mathcal{E}_N, V),
$$
where (i) $\mathcal{N}$ is the MPU interaction network (Section 11.1), with vertices given by MPUs (Definition 23) and propagation/throughput costs as in Definition 35, (ii) $\mathcal{E}_N$ is the nominated ND-RID `Evolve` interaction/update channel of Definition 27, which represents actualization only on the separately accepted Hilbert/Born/instrument/single-outcome branch, and (iii) $V$ is the PCE potential over configurations (Definition 20; Appendix D, Definition D.1):
$$
V(x)=V_{op}(x)+V_{prop}(x)-V_{benefit}(x)+V_{penalty}(x).
$$
Definition 2.6a separately registers the finite protocol response functor $\mathcal Y_B$, the sector inclusions $j_i$, and the corestrictions $R_i$ of $j_i^*\mathcal Y_B$ to their finite full images. Each $R_i$ is therefore fixed relative to the registered pair $(\mathcal Y_B,j_i)$. The sector registration is additional finite datum, and a common enriched carrier is an additional completion-certificate field.
Thermodynamic instantiation distinguishes a structural binary register size from a physical reset cost. A declared reusable binary SPAP implementation has structural log-cardinality $\varepsilon_0=\ln2$ (Proposition 5; Theorem J.1). On a branch satisfying the registered-reset hypotheses of Definition 28, the physical reset ledger obeys
$$
\varepsilon_{\mathrm{reset}}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}
\ge H_q(P\mid R),
$$
with $\varepsilon_{\mathrm{diss}}\ge0$ (Theorem 31; see also [Landauer 1961]). A positive uniform physical floor requires an independent bound $H_q(P\mid R)\ge h_{\min}>0$; $\varepsilon_0=\ln2$ alone supplies no ensemble-independent heat floor.

**Definition (Physical category).** A physical category $\mathfrak C$ is a family of operational observables used to describe the world: time, space, energy, matter, force, or charge. This phenomenological use of “category” is represented by the registered finite realization data of Definition 2.6a.

**Definition (Predictive derivation).** At fixed finite resolution, a category is *response-derived relative to an accepted datum* when its response functor is one of the registered corestrictions $R_i$ of $j_i^*\mathcal Y_B$. It is *PPI-physically derived* when, for the corresponding $q\in\operatorname{Rep}\pi_0(\mathscr J_B)$, a categorical-unity record is common-realization-complete over $q$, carries $\mathsf{base\mbox{-}exhausted}$ source status, and supplies an object $\omega\in\mathscr E_q$ with finite-cost PPI dressing. A lift with an independently adopted response-active sector leaf is an augmented predictive projection, with that leaf retained in its premise ledger. Empirical realization identification is the separate record of Definition P.14.9g.

**Thesis 2.6 (Categorical Unity).** Relative to an accepted registered datum, the six sector response functors are registered corestrictions of the single response-normal-form functor $\mathcal Y_B$; at the distinguished object $p_B$, the values $\kappa_iR_i(p_B)$ are restrictions of $\mathfrak P_0\!\restriction_B$. If a categorical-unity record is common-realization-complete over $q\in\operatorname{Rep}\pi_0(\mathscr J_B)$ with $\mathsf{base\mbox{-}exhausted}$ source status and $\mathscr E_q\ne\varnothing$, the six lifts factor through one common finite-cost PPI-physicalizable carrier. Theorem 2.6b gives the generic finite compatible-lift classification. Definition 2.6c specifies the populated-census and PPI-physicalizability certificate fields, and Theorem 2.6d warrants their conclusions when the required fields are accepted.

**Definition 2.6a (Registered Finite Categorical-Unity Datum).** Fix a finite protocol budget $B$, a declared exact decidable coefficient domain $\mathbb D_B$, and
$$
I_6=\{\mathsf t,\mathsf s,\mathsf e,\mathsf m,\mathsf f,\mathsf q\}
\tag{2.6a.1}
$$
for time, space, energy, matter, force, and charge. A registered finite categorical-unity datum $\mathfrak D_{\mathrm{CU},B}$ consists of the following canonical finite data.

1. A finite source category $\mathsf S_B$ with distinguished object $p_B$, a finite protocol category $\mathsf P_B$, and a finite response-normal-form category $\mathsf{RNF}_B$. An object of $\mathsf{RNF}_B$ is a triple
   $$
   X=(\mathcal R_X,U_X,V_X),
   \tag{2.6a.2}
   $$
   where $\mathcal R_X:\mathsf P_B^{op}\to\mathsf{Prob}_{\mathrm{fin}}(\mathbb D_B)$ is a normalized exact response presheaf and $U_X,V_X$ are the registered finite update and verification maps. Morphisms intertwine all three fields. The datum supplies a functor
   $$
   \mathcal Y_B:\mathsf S_B\longrightarrow\mathsf{RNF}_B
   \tag{2.6a.3}
   $$
   and a checked isomorphism
   $$
   \zeta_B:\mathcal Y_B(p_B)\xRightarrow{\sim}\mathfrak P_0\!\restriction_B.
   \tag{2.6a.4}
   $$

2. For each $i\in I_6$, a registered inclusion $j_i:\mathsf P_{i,B}\hookrightarrow\mathsf P_B$ and the unique corestriction
   $$
   R_i:\mathsf S_B\longrightarrow\mathsf R_{i,B},
   \qquad
   \kappa_iR_i=j_i^*\mathcal Y_B,
   \tag{2.6a.5}
   $$
   where $\mathsf R_{i,B}$ is the finite full image of $j_i^*\mathcal Y_B$ and $\kappa_i$ is its full-subcategory inclusion. The semantic audit $\mathfrak A_{\mathrm{sem},B}$ assigns the six labels bijectively, verifies typed protocol eligibility and coverage, records every permitted sector overlap, and verifies that its labels, predicates, and inclusions were frozen before access to the quarantined comparison target.

3. For each $i$, a finite operational realization category $\mathsf O_{i,B}$, a functor $\rho_i:\mathsf O_{i,B}\to\mathsf R_{i,B}$, and a decidable natural-isomorphism-invariant predicate $\mathfrak B_i$ encoding the row-specific PPI, domain, normalization, unit, source, and finite-cost conditions. The local-lift groupoid has objects
   $$
   (F_i,\alpha_i),
   \qquad
   F_i:\mathsf S_B\to\mathsf O_{i,B},
   \qquad
   \alpha_i:\rho_iF_i\xRightarrow{\sim}R_i,
   \qquad
   \mathfrak B_i(F_i)=1,
   \tag{2.6a.6}
   $$
   and arrows the natural isomorphisms $u:F_i\Rightarrow F_i'$ satisfying $\alpha_i'\circ(\rho_i u)=\alpha_i$.

4. A finite overlap graph $G_B=(I_6,E_B)$ with finite overlap categories and restriction functors. An overlap-decorated tuple consists of one local lift in each sector and an isomorphism between the two restricted lifts on every edge. The finite overlap audit $\mathfrak I_{\mathrm{ov},B}$ exhausts the required edge, cycle, multiple-overlap, unit, source-ownership, calibration, and higher-coherence cells. The compatible-lift groupoid $\mathscr J_B$ is the full subgroupoid on exactly the tuples that pass every predicate in that audit.

Definition P.6.1d.1 gives the exact serialization, table equations, coverage records, and total table-validity checker for these fields. A submitted datum is **table-valid** exactly when that checker accepts every required type, identity, composition, normalization, intertwining, semantic-coverage, and overlap-coverage check.

**Theorem 2.6b (Registered Response Restrictions and Exact Compatible-Lift Classification).** Every table-valid datum $\mathfrak D_{\mathrm{CU},B}$ satisfies
$$
R_i=\operatorname{corestrict}_{\mathsf R_{i,B}}(j_i^*\mathcal Y_B),
\qquad
\kappa_iR_i(p_B)\xRightarrow{\sim}j_i^*(\mathfrak P_0\!\restriction_B),
\tag{2.6b.1}
$$
for $i\in I_6$. These conclusions are canonical relative to the frozen inclusions $j_i$; the accepted semantic audit supplies their physical labels and protocol coverage.

A local lift exists exactly when
$$
R_i\in\operatorname{EssIm}\!\left(
(\rho_i)_*^{\mathfrak B_i}:
[\mathsf S_B,\mathsf O_{i,B}]_{\mathfrak B_i}
\longrightarrow
[\mathsf S_B,\mathsf R_{i,B}]
\right).
\tag{2.6b.2}
$$
If an accepted proof establishes that $\rho_i$ is fully faithful on the realization subcategory containing every $\mathfrak B_i$-admissible image, including unique lifting of the registered update and verification intertwiners, then $\operatorname{Lift}_i(R_i)$ is empty or equivalent to the terminal groupoid. Theorem P.6.1b.3 supplies the response-presheaf part of that premise only on its separating, protocol-complete branch; Lemma P.6.1d.2 records the additional enriched-lifting obligation.

The finite compatible-lift groupoid has the exact classification
$$
\operatorname{class}_{\mathrm{lift}}(\mathscr J_B)
=
\begin{cases}
\mathsf{lift\mbox{-}empty},&\mathscr J_B=\varnothing,\\
\mathsf{lift\mbox{-}rigid},&|\pi_0(\mathscr J_B)|=1\text{ and every }\operatorname{Aut}_{\mathscr J_B}(q)=\{1_q\},\\
\mathsf{lift\mbox{-}unique\mbox{-}with\mbox{-}symmetry},&|\pi_0(\mathscr J_B)|=1\text{ and some }\operatorname{Aut}_{\mathscr J_B}(q)\ne\{1_q\},\\
\mathsf{lift\mbox{-}moduli},&|\pi_0(\mathscr J_B)|>1.
\end{cases}
\tag{2.6b.3}
$$
Exhaustive enumeration returns representatives of all components, the complete isomorphism matrix, and complete automorphism-group tables. Equation (2.6b.3) classifies compatible mathematical lifts. Definition 2.6c and Theorem 2.6d separately classify their common global realizations.

*Proof.* Restriction along $j_i$ followed by corestriction to the finite full image gives (2.6b.1), and applying $j_i^*$ to $\zeta_B$ gives the displayed comparison at $p_B$. Equation (2.6b.2) expands the definition of essential image. Under the stated enriched full-faithfulness premise, every comparison of two lifts has a unique lift through $\rho_i$, so a nonempty local-lift groupoid is terminal up to equivalence. Finally, every object, arrow, predicate, and equality table is finite and decidable; exhaustive enumeration computes the components and stabilizers and yields the four disjoint cases in (2.6b.3). Lemma P.6.1d.2 and Theorem P.6.1d.3 give the complete enriched-lifting and enumeration checks. ∎

**Definition 2.6c (Categorical-Unity Completion Certificate).** A categorical-unity completion certificate for a submitted $\mathfrak D_{\mathrm{CU},B}$ is a finite record with these independently checked modules:

1. a versioned proof-kernel and total deterministic checker trust record, together with an exact coefficient bridge;
2. datum, local-lift, and compatible-lift proofs and exhaustive finite tables;
3. a frozen bounded physical theory and exhaustive object-and-arrow census forming a finite global PPI-equivalence groupoid $\mathscr L_{\Omega,B}$;
4. a restriction functor $\operatorname{res}_B:\mathscr L_{\Omega,B}\to\mathscr J_B$, its typed bridge to the registered ambient quotient, and, for every $q\in\operatorname{Rep}\pi_0(\mathscr J_B)$, the full essential preimage
   $$
   \mathscr E_q
   :=
   \mathscr L_{\Omega,B}
   \big|_{\{\omega:\operatorname{res}_B(\omega)\simeq q\}};
   \tag{2.6c.1}
   $$
5. exhaustive source, no-double-counting ownership, and observable-calibration records;
6. a selection field equal either to the token $\mathsf{unselected}$ or to a tuple $\mathfrak C_{\mathrm{sel}}$ containing a descended target-independent PPI/PCE cost, a proposed class $[\omega_*]$, a verified strict positive gap, a compatible selected sector tuple, and their proofs;
7. a forward-lock field, an optional target-blind provenance field, and an optional continuum-completion field.

Definitions P.6.1d.4–P.6.1d.12 specify the exact finite types, generators, parsers, coverage equalities, source graph, ownership projections, calibration squares, selection inequalities, commitment checks, continuum data, hashes, and replay rules for these modules. Each module has status $\mathsf{accepted}$, $\mathsf{failed}$, $\mathsf{pending}$, or, for an expressly optional module, $\mathsf{not\mbox{-}claimed}$. A module is accepted exactly when every required finite table, proof, dependency, coverage, provenance, and hash check passes; a finite mismatch gives failed status and incomplete evidence gives pending status.

The canonical payload $\mathfrak C_{\mathrm{CU},B}^{\circ}$ excludes its final hash, status vector, and checker trace. With the registered hash algorithm $H_{\mathrm{CU}}$, set
$$
h_{\mathrm{CU}}
=H_{\mathrm{CU}}\!\left(\operatorname{ser}(\mathfrak C_{\mathrm{CU},B}^{\circ})\right),
\qquad
\mathfrak C_{\mathrm{CU},B}
=
(\mathfrak C_{\mathrm{CU},B}^{\circ},h_{\mathrm{CU}},\sigma_{\mathrm{CU}},\chi_{\mathrm{CU}}).
\tag{2.6c.2}
$$
Acceptance requires hash recomputation and deterministic checker replay; neither checker output occurs in the hashed payload.

The record is **classification-complete** when the trust, datum, local, and compatibility modules are accepted. It is **common-realization-complete over $q$** when it is classification-complete and the global, restriction, $\mathsf E_q$, source, ownership, and calibration modules are accepted. It is **selection-complete** when it is classification-complete and the global, restriction, $\mathsf E_{q_*}$, source, ownership, calibration, selected-tuple, cost-descent, strict-selection, and lock modules are accepted. Target-blind provenance and continuum completion require acceptance of their respective optional modules. Empirical realization identification is the independent comparison record of Definition P.14.9g.

**Theorem 2.6d (Soundness of the Finite Categorical-Unity Classification).** Assume that the trust module of Definition 2.6c is accepted. The total checker terminates on every finite submitted record. At the registered budget $B$, accepted modules warrant exactly the following conclusions.

1. A classification-complete record gives Theorem 2.6b's exact compatible-lift classification of $\mathscr J_B$. A response-distinction conclusion additionally requires a separating registered protocol.

2. If the record is classification-complete and its global, restriction, and $\mathsf E_q$ modules are accepted, then
   $$
   \pi_0(\mathscr E_q)
   =
   \overline{\operatorname{res}}_B^{-1}([q]),
   \tag{2.6d.1}
   $$
   and
   $$
   \begin{array}{rcl}
   \mathscr E_q\ne\varnothing
   &\Longleftrightarrow&
   \text{$q$ has a common finite-cost PPI-physicalizable carrier in the registered scope},\\[1mm]
   |\pi_0(\mathscr E_q)|=1
   &\Longleftrightarrow&
   \text{that global lift is unique up to registered global PPI equivalence},\\[1mm]
   \mathscr E_q\simeq\mathbf1
   &\Longleftrightarrow&
   \text{that global lift is unique and has no retained automorphism}.
   \end{array}
   \tag{2.6d.2}
   $$
   An accepted empty census is a finite no-global-lift certificate for the registered scope.

3. An accepted source module derives every response-active field through its checked acyclic constructor graph. Its $\mathsf{base\mbox{-}exhausted}$ tag records no response-active premise beyond the registered predictive base and logical trust root; its $\mathsf{augmented}$ tag records exactly the displayed independent leaves. An accepted ownership module counts every eligible contribution exactly once, and an accepted calibration module makes each observable total, normalized, unit-consistent, overlap-compatible, and constant on global PPI-equivalence classes.

4. A selection-complete record proves
   $$
   \operatorname*{argmin}_{[\omega]\in\pi_0(\mathscr L_{\Omega,B})}
   \overline V_{\Omega,B}([\omega])
   =\{[\omega_*]\},
   \tag{2.6d.3}
   $$
   so $[\omega_*]$ is the unique forward-locked PPI/PCE-selected global class in the declared finite scope and restricts to the accepted compatible sector tuple. Acceptance of the blind module adds its registered provenance class.

5. Manuscript status is propagated through the independently accepted strict-certificate registry of Definition P.14.1m and Algorithm P.14.1m.0, with the meet rule of Corollary D.8.9d and Convention P.14.1l. A continuum conclusion follows exactly on acceptance of the continuum module. Empirical realization identification follows through the independent calibrated comparison record of Definition P.14.9g and retains Theorem P.14.9h's distinction between external actuality and mathematical completion.

*Proof.* Finiteness and the accepted totality results make every parse, equality, table, proof, coverage, graph, and hash check terminating. Theorem 2.6b proves item 1. The exhaustive object-and-arrow census, restriction bridge, and essential-preimage census prove (2.6d.1)–(2.6d.2). Topological induction on the source graph proves source closure; the ownership projections and calibration squares give item 3. Exhaustive finite comparison and the accepted strict gap prove (2.6d.3). The registry, continuum, and empirical conclusions apply their named owners. The complete module-by-module verification is Theorem P.6.1d.13. ∎

**Corollary 2.6d.a (Strictness and Nonconverses of the Closure Gates).** For every classification-complete record and every $q\in\operatorname{Rep}\pi_0(\mathscr J_B)$,
$$
\mathscr E_q\simeq\mathbf1
\Longrightarrow
|\pi_0(\mathscr E_q)|=1
\Longrightarrow
\mathscr E_q\ne\varnothing
\Longrightarrow
q\in\mathscr J_B,
\tag{2.6d.a.1}
$$
and
$$
\mathscr J_B\ne\varnothing
\Longrightarrow
\operatorname{Lift}_i(R_i)\ne\varnothing
\qquad(i\in I_6).
\tag{2.6d.a.2}
$$
Every reverse implication fails on a full finite registered record.

1. The record $\mathfrak R_{\mathrm{ov}}$ of Lemma P.6.1d.14(a) has six terminal local-lift groupoids and an empty compatible-lift groupoid.
2. The record $\mathfrak R(\varnothing,\mathbf1,!)$ has $\mathscr J_B=\mathbf1$ and $\mathscr E_q=\varnothing$.
3. The record $\mathfrak R(\{\omega_0,\omega_1\}_{\mathrm{disc}},\mathbf1,!)$ has a nonempty essential preimage with two components.
4. The record $\mathfrak R(B(\mathbb Z/2),\mathbf1,!)$ has one essential-preimage component and a nontrivial retained automorphism group, so its essential preimage is not equivalent to $\mathbf1$.

Strict selection and essential-preimage uniqueness are incomparable. Lemma P.6.1d.14(c) gives a selection-complete record with unique selected class $[\omega_0]$ and $|\pi_0(\mathscr E_q)|=2$. Conversely, $\mathfrak R(\mathbf1,\mathbf1,!)$ has $\mathscr E_q\simeq\mathbf1$; when its selection field is $\mathsf{unselected}$, it supplies no strict-selection conclusion.

*Proof.* The implications in (2.6d.a.1) follow from the definitions of equivalence to the terminal groupoid, connected components, nonemptiness, and full essential preimage. Equation (2.6d.a.2) follows because every object of $\mathscr J_B$ contains one admissible local lift in each sector. Lemma P.6.1d.14 constructs all certificate fields and verifies the object, arrow, restriction, source, ownership, calibration, and, where invoked, strict-selection tables for the five displayed records. Their component and automorphism counts give the four failed converses and the two selection non-implications. ∎

**Resolution record 2.6d-R1 (Finite Categorical-Unity Classifier).** Theorem 2.6b exhausts every compatible local-lift groupoid of a table-valid finite datum into the four cases `lift-empty`, `lift-rigid`, `lift-unique-with-symmetry`, and `lift-moduli`. Theorem 2.6d then classifies the full common-realization fiber $\mathscr E_q$ by nonemptiness, connected components and automorphisms, and Corollary 2.6d.a proves that none of those gates can be inferred from a weaker one. This is `positive-discharge` of the generic finite mathematical classification in `TV-FND-02` and `nonentailment` of joint existence or uniqueness from six separate local lifts.

**Resolution TV-FND-02-R1 (Metadata).** Exact domain: table-valid finite categorical-unity data and their compatible-lift groupoids. Premises: Definitions 2.6a and 2.6c and Theorems 2.6b--2.6d's source, ownership, restriction and calibration checks. Equivalence: isomorphism in each lift groupoid and in the common essential-preimage fiber. Budget: exhaustive enumeration of the submitted finite tables and arrows. Verifier: the exact groupoid census and completion-certificate checks. Falsifier: a table-valid datum outside the four disjoint cases, an omitted isomorphism class, or a failed claimed converse. Provenance class: source-internal finite classification. Downstream consumers: Thesis 2.6 and every sector map invoking a common realization fiber. Nonvacuity: Lemma P.6.1d.14's five finite records.

No populated bounded physical-theory census, common essential-preimage record, source-exhaustion module, calibration module or empirical realization-identification record is accepted here. `TV-FND-02` therefore retains `C+R+O`: the finite classifier is complete, while selecting the realized fiber and extracting its observables remain certificate- and realization-gated.

### 2.6.1 Derivation Map (Operational Identifications)

| Category | Registered operational identification and branch conditions | Primary PU locus |
|:---------|:-------------------------------------------------------------|:-----------------|
| Time | Predictive cycles have a directed verification/update ordering, sharpened to a thermodynamic arrow on the registered irreversible branch. Theorem 29 supplies an internal characteristic timescale; a positive minimum tick for every update is separate clock-certificate data. | Theorem 4; Definition 27; Theorem 29; Theorem 31; Appendix O |
| Space | Propagation costs define $d_{\mathcal N}$. Theorem 43 makes certified irregular global minimizers impossible only on its strict-comparator branch; a continuum manifold and metric additionally require the independent Theorem-43.5 package and Theorems 44–45. | Definition 35; Theorem 43; Theorem 43.5; Theorems 44–45 |
| Spacetime unity | Nonzero spacing, a separately registered positive edge-update duration, serialized propagation, and bounded weights give the uniform operational speed upper bound of Theorem 46. An attained normalized frontier $c=\delta/\tau_{\min}$ requires the separate uniform-weight one-link-attainment branch. The Appendix Z contract fixes only the Euclidean response-carrier value $D=4$; identifying it with spacetime dimension and Lorentzian signature requires Corollary 46a and the full Appendix O package. | Theorem 46; Corollary 46a; Definition Z.9a; Theorem Z.11; Appendix O; Appendix P (P.8.11) |
| Energy | Resource-cost rates $R(C)$ and $R_I(C)$ lift to cost operators, while Theorem 29 identifies the internal Hamiltonian and a characteristic task-dependent timescale. A universal minimum update duration is not used. Coarse-graining yields $T_{\mu\nu}^{(MPU)}$ only on the Appendix B branch. | Definition 3; Theorem 3; Theorem 29; Appendix B (Definition B.8) |
| Matter | Definition 23 MPUs and Definition 29 aggregates enter a physical matter identification only on a common-realization-complete categorical-unity record over $q\in\operatorname{Rep}\pi_0(\mathscr J_B)$ with $\mathscr E_q\ne\varnothing$; its source audit either establishes base exhaustion or lists every retained independent sector premise. Field-like realization on $(M,g)$ additionally requires the accepted continuum-completion, localization, and response records. On the separate $d_0=8$ Perspective-Space branch, Appendix R proves $\pi_2(\Sigma_8)\cong\mathbb Z^7$, which supplies an integral candidate-sector group whose selection as stable physical matter sectors retains the realization and dynamical-stability gates. | Definition 23; Definition 25; Definition 29; Definition 2.6c; Theorems 2.6b and 2.6d; Appendix R |
| Force | Effective response channels selected by PCE as responses of $\mathfrak{P}$ to gradients, curvatures, holonomies, or capacity deficits of the same underlying cost structure. The response channels split by the Equivalence–Constitutive Separation Law: metric-universal channels have a common source/response ledger and carry an equivalence principle; sector-selective channels carry retained charge, representation, material, or constitutive labels and do not carry a universal equivalence principle. Generalized forces are gradients of $V$ (Definition 20; Appendix D, Definition D.1), gauge forces are internal connection/representation responses (Appendix G), and gravity is the metric-universal response sourced by $T_{\mu\nu}^{(MPU)}$ (Theorem 50; Appendix N, Theorem N.11a). | Definition 20; Appendix D (Definition D.1); Appendix G; Theorem 50; Appendix N (Theorem N.11a); Appendix X |
| Charge | The representation weight $q$ in $D_\mu=\partial_\mu+\Omega_\mu+iqA_\mu$ specifies participation in a local gauge connection only on the separately reconstructed Appendix G symmetry branch. The arithmetic density of a chosen cyclic phase subgroup in $U(1)$ does not derive local gauge redundancy, a connection, or a Noether current; those require the Appendix G and Appendix X operational-symmetry hypotheses. Charge quantization additionally depends on the global bundle structure and boundary conditions, while numerical interaction strength requires its own normalized shadow-price or capacity-boundary certificate. | Appendix G (Definition G.4.1; Equation G.6.3); Appendix X (Theorem X.8c); Appendix Z (Corollary Z.8.2a) |

This map lists candidate realization functors and branch predicates for the six sector restrictions registered relative to an accepted $\mathfrak D_{\mathrm{CU},B}$. A row contributes a local lift only after its branch predicate and response-isomorphism checks pass; the local tuple lies in $\mathscr J_B$ only after every typed overlap cell passes. On a common-realization-complete record over $q\in\operatorname{Rep}\pi_0(\mathscr J_B)$, a compatible tuple has a common finite-cost PPI-physicalizable carrier in the registered exhaustive class exactly when $\mathscr E_q\ne\varnothing$. Each named branch theorem supplies its law from its own action, state-space, operator, continuum, and realization package; the common branch-indexed PCE variational grammar organizes those branch-specific derivations. “Spacetime unity” is the registered time--space compatibility row within the six-element index set $I_6$.

### 2.6.2 Structural Identities (Inter‑Category Relations as Necessities)

For a record that is common-realization-complete over $q\in\operatorname{Rep}\pi_0(\mathscr J_B)$, with $\omega\in\mathscr E_q$, the following are branch theorems or cross-sector compatibility equations on the registered common PPI-physicalizable lift. Each retains its named branch, calibration, source, and overlap gates. A coherence cell is an explicitly registered commuting naturality or overlap diagram:

1. **Mass–energy equivalence.** On $\mathfrak B_{mass}$, rest energy is the proper-time action-rate assigned to the maintained relational-information ledger; outside that branch PU does not derive the absolute coefficient.



2. **Lorentzian spacetime with invariant $c$.** Theorem 29 supplies a task-dependent characteristic timescale and Theorem 31 supplies a registered-reset entropy ledger; neither gives a universal edge-update clock or causal frontier. A uniform speed upper bound requires the independent nonzero-spacing, positive edge-clock, serialization, and bounded-weight hypotheses of Theorem 46. The normalization $c=\delta/\tau_{\min}$ additionally requires uniform weights and one-link frontier attainment. The Appendix Z contract fixes only the Euclidean response-carrier value $D=4$; its $3+1$ spacetime interpretation and Lorentzian signature follow only on the full Corollary 46a/Appendix O branch.

3. **Forces from connections/gradients.** In the continuum effective description, interactions are encoded in the connections required for predictive coherence: the internal connection $A_\mu$ (Appendix G) and the geometric/spin connection (Theorem 48) together form the transport structure whose curvature yields physical interaction content (Theorem 47). On $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$, Theorem N.6 identifies the accepted inertial coefficient with a certified relational action/update ledger only after a mechanical-realization certificate. It does not derive Newton's second law or a force law; those require the independent worldline and mechanical response maps of the declared Lorentzian branch. Where both packages coexist, relational reconfiguration cost is compatible with, but does not replace, the classical force response.


4. **Charge conservation.** On the branch carrying the accepted gauge-invariant minimally coupled action and the on-shell matter equations, variation gives $\nabla_\mu F^{\mu\nu}=J^\nu$ (Equation G.6.3), and antisymmetry of $F^{\mu\nu}$ yields $\nabla_\nu J^\nu=0$. Appendix G's quadratic link cost is a constructive realization of this branch; predictive coherence alone does not uniquely select minimal coupling or the complete local operator content.

5. **Equivalence principle and response separation.** On canonical $\mathfrak B_{mass}$, probe-independent realization maps $m_I=\beta_I L$ and $m_G=\beta_G L$ give a universal ratio. One independently calibrated reference probe with $m_G=m_I$ fixes that ratio to one for the tested class. The branch requires separate realization-map, metric-universality, source-exhaustion, and reference-calibration records.



### 2.6.3 Compressed Ontology Statement

The finite response-level content of an accepted registered datum is the relative restriction tuple
$$
\boxed{
(\mathcal Y_B,(j_i)_{i\in I_6})
\longmapsto
(R_{\mathsf t},R_{\mathsf s},R_{\mathsf e},R_{\mathsf m},R_{\mathsf f},R_{\mathsf q}),
\qquad
R_i=\operatorname{corestrict}(j_i^*\mathcal Y_B).
}
\tag{2.6.3.1}
$$
For a common-realization-complete record over $q\in\operatorname{Rep}\pi_0(\mathscr J_B)$, the common-carrier classifier is the full essential-preimage groupoid
$$
\mathscr E_q
:=
\mathscr L_{\Omega,B}
\big|_{\{\omega:\operatorname{res}_B(\omega)\simeq q\}}.
\tag{2.6.3.2}
$$
A common carrier exists exactly when $\mathscr E_q\ne\varnothing$. Global PPI-equivalence uniqueness is $|\pi_0(\mathscr E_q)|=1$, and rigid uniqueness is $\mathscr E_q\simeq\mathbf1$. A passing source audit classifies the PPI-physicalizable projection as $\mathsf{base\mbox{-}exhausted}$ when every response-active leaf lies in $\mathsf A_0\cup\mathsf A_{\log}$ and as $\mathsf{augmented}$ when an independent sector premise remains.

Theorem 2.6b gives the generic exact classification of $\mathscr J_B$ for any accepted finite datum. An accepted populated census records which classifier case the registered datum occupies, and each accepted $\mathsf E_q$ field records the corresponding essential-preimage conclusions. On a registered reset branch, $\mathcal E_N$ obeys
$$
\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R),
$$
with a positive floor when the independent bound $H_q(P\mid R)\ge h_{\min}>0$ is accepted (Theorem 31). The potential $V$ belongs to the branch-indexed family of Definition D.1, Definition D.1f, and Theorem D.1g. Definition P.14.9g supplies the separate empirical realization-identification record.




