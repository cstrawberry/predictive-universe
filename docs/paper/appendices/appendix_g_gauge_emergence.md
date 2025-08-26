# Appendix G: Emergence of Quantum Weights and Gauge Structure

**G.0 Introduction**

This appendix demonstrates how the Predictive Universe (PU) framework's core principles—specifically the Prediction Optimization Problem (POP, Axiom 1) and the Principle of Compression Efficiency (PCE, Definition 15)—lead to the emergence of crucial structures underpinning modern physics. We first derive the Born probability rule governing quantum outcomes from the principle of optimal resource allocation in predictive processes (Section G.1), simultaneously rigorously justifying the necessity of a complex Hilbert space representation (Theorem G.1.8). We then show how the need for efficient predictive coherence across the network necessitates the emergence of a U(1) gauge connection (electromagnetism) as the minimal PCE-optimal solution (Sections G.2–G.7). Finally, we present a comprehensive argument (Section G.8) for how the Standard Model (SM) gauge group $SU(3)\times SU(2)\times U(1)$ with its chiral fermion content, and the D=4 dimensionality of spacetime, can emerge as a unified, co-selected PCE-optimal structure.

The analysis takes place on the emergent Lorentzian manifold $(M,g_{\mu\nu})$ whose existence is justified conditionally in Section 11 and Appendix D. Natural units $\hbar=c=k_B=1$ are used unless stated otherwise.

**G.1 Born Weights from Cost Optimisation**

The probabilistic structure of quantum mechanics, encapsulated by the Born rule, is derived here as a necessary consequence of efficient resource allocation (PCE) applied to the representation and processing of predictive information within the emergent Hilbert space structure of the MPU network.

**G.1.1 Predictive Partitions and Cost Frame Functions**

Let $\mathcal{H}$ be the complex Hilbert space emerging as the necessary structure for MPU state amplitudes (Proposition 4, justified by Theorem G.1.8 below). Physical interactions ('Evolve', Definition 27) allow the system to gain information regarding potential outcomes, represented mathematically by effects—positive semi-definite operators $E$ on $\mathcal{H}$ satisfying $0 \le E \le \mathbf{1}$. A complete set of mutually exclusive outcomes corresponds to a predictive partition, a set of effects $\mathcal{E}=\{E_i\}$ such that $\sum_i E_i = \mathbf{1}$. A special case is a partition by orthogonal projectors $\mathcal{P}=\{P_i\}$, where $P_i^2 = P_i$, $P_i P_j = \delta_{ij} P_i$, and $\sum_i P_i = \mathbf{1}$. Each projector $P_i$ corresponds to a distinct, potential outcome branch into which the system state might resolve.

The Principle of Compression Efficiency (PCE, Definition 15) mandates minimizing the overall PCE Potential $V(x)$ (Definition D.1), which represents the net rate of resource consumption minus predictive benefit. This potential provides a basis for assigning a cost to considering or resolving different predictive possibilities.

**Definition G.1.1 (Cost Frame Function $f$).**
For any predictive partition by orthogonal projectors $\mathcal{P}=\{P_i\}$, we define the associated Cost Frame Function $f(\mathcal{P})$ as the contribution to the total PCE potential $V(x)$ associated with the existence of these potential outcome branches. The definition of the Cost Frame Function as $f(\mathcal{P}) = \sum_i f(P_i)$ (Equation G.1.1), where $f(P_i)$ is the conditional PCE Potential $V(P_i)$ for branch $P_i$, is itself justified by the PCE imperative for efficient resource accounting and modeling. Each $P_i$ in an orthogonal partition $\mathcal{P}$ represents a *mutually exclusive, physically distinct potential pathway* the system might actualize into.
The components of $V(P_i) = \langle V_{op}(P_i) + V_{prop}(P_i) - V_{benefit}(P_i) \rangle_{\rho|P_i}$ are (Definition D.1):
*   $V_{op}(P_i)$: Expected operational cost rate if $P_i$ occurs. This represents the ongoing cost of maintaining complexity and processing information based on the system's operational estimate of complexity conditional on outcome $P_i$.
*   $V_{prop}(P_i)$: Expected propagation cost rate if $P_i$ occurs. This represents the cost of maintaining network coherence and communication infrastructure relevant to achieving or dealing with outcome $P_i$.
*   $V_{benefit}(P_i)$: Expected predictive benefit (derived from PP, Definition 7) if $P_i$ occurs.
A rigorous justification for additivity arises directly from PCE. Any non-additive "interference cost" $\Delta_{int}(\mathcal{P})$ associated purely with the *representation* of the partition $\mathcal{P}$ (i.e., $f(\mathcal{P}) = \sum_i f(P_i) + \Delta_{int}(\mathcal{P})$) would itself require additional Predictive Physical Complexity $C_{int}$ to compute and manage. This additional complexity incurs a physical operational cost $R(C_{int})$ that contributes positively to the total PCE Potential $V(x)$. However, since the branches $\{P_i\}$ are mutually exclusive (orthogonal), this interference cost provides no direct predictive benefit for any single actualized outcome. Therefore, any configuration with $C_{int} > 0$ has a strictly higher $V(x)$ than a configuration with $C_{int}=0$. PCE dynamics, which minimize $V(x)$, will drive the system to configurations where such purely representational overheads are eliminated, forcing $C_{int} \to 0$ and thus ensuring $\Delta_{int}(\mathcal{P}) \to 0$. Additivity is therefore a necessary condition for a PCE-optimal predictive accounting system.
$$
f(\mathcal{P}) = \sum_i f(P_i)
\quad \text{(G.1.1)}
$$
Since physical costs ($V_{op}, V_{prop}$) are non-negative and benefits ($V_{benefit}$) are bounded within the operational range, each $f(P_i) = V(P_i)$ is non-negative and bounded.

**Lemma G.1.2 (Additivity of $f$ over Orthogonal Sums).**
If $P = \sum_{j=1}^k Q_j$ where $\{Q_j\}$ are mutually orthogonal projectors, then the cost associated with the combined outcome $P$ must be the sum of the costs of the constituent exclusive outcomes $Q_j$:
$$
f\left(\sum_{j=1}^k Q_j\right) = \sum_{j=1}^k f(Q_j)
\quad \text{(G.1.2)}
$$
*Proof.* This follows directly from the definition of the Cost Frame Function (Equation G.1.1). Consider the partition $\mathcal{P}' = \{Q_1, Q_2, \dots, Q_k\}$ whose elements sum to $P$. By Equation (G.1.1), the cost associated with this partition considered as describing the (potentially coarser) outcome $P$ is $f(P) \equiv f(\mathcal{P}') = \sum_{j=1}^k f(Q_j)$. The argument implicitly assumes that if $P$ is resolved into orthogonal sub-components $\{Q_j\}$, the cost associated with "considering" $P$ is the sum of costs of "considering" its distinct sub-components. This reflects PCE's preference for consistent accounting: the resource implications of a composite possibility should reflect the sum of resource implications of its exclusive constituents. QED

**G.1.2 Non-contextuality Enforced by POP / PCE**

A crucial property mandated by the global optimization principles of POP and PCE is non-contextuality. The physical cost or resource implication associated with a specific potential outcome (represented by projector $P$) must depend only on the physical process corresponding to $P$ itself, and *not* on the particular set of alternative outcomes (the partition $\mathcal{P}$) considered alongside it.

**Lemma G.1.1 (Non-Contextuality from Dynamical Stability).**
Non-contextuality is a necessary condition for the stability and consistency of the PCE-driven adaptation dynamics. The dynamics are modeled as a stochastic gradient flow on the PCE Potential $V(x)$ (Appendix D, Eq. D.8), which serves as a stochastic Lyapunov function for the system.
Assume, for contradiction, that the cost function is contextual, so that the cost associated with outcome $P$ depends on the partition $\mathcal{P}$ it is considered part of: $f(P|\mathcal{P})$. This would mean the potential itself depends on the choice of partition, $V(x, \mathcal{P})$. For a fixed physical configuration $x$, the potential could take different values $V(x, \mathcal{P}_1) \neq V(x, \mathcal{P}_2)$ depending on the system's internal conceptual framing.
This introduces a fatal ambiguity into the adaptation dynamics. The gradient $\nabla_x V$, which drives the system's evolution, would become ill-defined, depending on the arbitrary choice of partition rather than solely on the objective physical state $x$. A potential function that is not a single-valued function of the physical state cannot serve as a proper Lyapunov function to guarantee convergence to a stable physical equilibrium (as proven in Theorem D.5). For the PCE optimization process to be well-defined and dynamically stable, the potential $V$ must depend only on the physical configuration $x$. This mandates that the cost component $f(P)$ must be a function of the physical process associated with $P$ alone, and not the context of other considered possibilities. Therefore, non-contextuality is a prerequisite for a dynamically consistent optimization framework.

Therefore, $f(P)$ depends only on the projector $P$ itself.

**G.1.3 Gleason-type Result for the Cost Functional**


The cost function $f(P)$ defined on projectors $P$ on the MPU Hilbert space $\mathcal{H}$ (where $\dim(\mathcal{H}) = d_0 \ge 8$, Theorem 23) satisfies the necessary conditions for Gleason's Theorem:
1.  **Domain:** Defined on the set of orthogonal projectors $P$ on $\mathcal{H}$.
2.  **Non-negativity:** $f(P) = V(P) \ge 0$ (Definition G.1.1, as conditional potential $V(P)$ components like $V_{op}, V_{prop}$ are non-negative costs, and $V_{benefit}$ is bounded and subtracted appropriately such that the net functional represents effective cost/weight).
3.  **Additivity:** $f(\sum_j Q_j) = \sum_j f(Q_j)$ for any finite set of mutually orthogonal projectors $\{Q_j\}$ (Lemma G.1.2).
4.  **Non-contextuality:** $f(P)$ depends only on $P$ (Lemma G.1.1).
5.  **Boundedness:** For any projector $P$, $f(P) \le f(\mathbf{1})$. The cost $f(\mathbf{1}) = V(\mathbf{1})$ represents the total potential contribution associated with resolving all possibilities (e.g., summing $f(P_i)$ over a complete basis $\{P_i\}$), which is assumed bounded for viable MPU configurations operating within the framework and its dynamic PCE optimization that inherently avoids unbounded costs (Assumption A1, A5 Appendix D relating to coercivity of $V(x)$ and confinement).

**Theorem G.1.3 (Quadratic Form from Cost Function).**
Let $\mathcal{H}$ be a complex Hilbert space with $\dim(\mathcal{H}) \ge 3$. Any function $f$ mapping orthogonal projectors $P$ on $\mathcal{H}$ to non-negative real numbers, satisfying additivity over orthogonal sums ($f(\sum_j Q_j) = \sum_j f(Q_j)$ for finite sums of orthogonal projectors) and boundedness ($0 \le f(P) \le M < \infty$ for some constant $M$), must be of the form:
$$
f(P) = \text{Tr}(\rho P)
\quad \text{(G.1.3)}
$$
for some unique positive semi-definite trace-class operator $\rho$ on $\mathcal{H}$.

*Proof.* This is a direct statement of Gleason's Theorem [Gleason 1957], as extended and understood in modern contexts (e.g., [Busch 2003] discusses the conditions for POVMs, implying coverage for projectors). The premises established above (non-negativity, additivity over finite orthogonal sums derived from Def G.1.1 via Lemma G.1.2 and Lemma G.1.1 regarding PCE-optimal accounting, non-contextuality via Lemma G.1.1, and boundedness from physical system constraints on $V(x)$) precisely match the conditions required by Gleason's theorem for projectors on a Hilbert space of dimension $\ge 3$. Since MPUs operate with $\dim(\mathcal{H}_0) = d_0 \ge 8$ (Theorem 23), the theorem applies directly. Therefore, the cost functional $f(P)$, dictated by POP/PCE principles applied to projective outcomes, must take the form $\text{Tr}(\rho P)$ for some unique positive semi-definite trace-class operator $\rho$. Uniqueness of $\rho$ follows from the properties of the trace functional and projectors. The full derivation of the Born rule from these principles is provided in **Theorem G.1.7**. QED

The operator $\rho$ derived here, determined by the cost structure arising from the PCE potential minimization, represents the effective statistical weighting assigned to different potential outcomes.

**G.1.4 Emergence of the Born Weights**

The 'Evolve' process (Definition 27) is intrinsically probabilistic (Hypothesis 2, from Logical Indeterminacy, Definition 12). The system, driven by POP (Axiom 1), must assign probabilities $p_i$ to potential outcomes $P_i$ to guide its decision-making and adaptive strategies. Simultaneously, PCE (Definition 15) drives the system to a configuration $x^*$ where its PCE Potential $V(x)$ (Definition D.1) is minimized. As established by Theorem G.1.3, the components of $V(x)$ related to outcome branches $P_i$ (the cost frame function) necessarily sum to give $f(P_i) = \text{Tr}(\rho P_i)$. This $f(P_i)$ represents the system's own optimal, objective assessment of the "value" or "PCE-cost-weighted significance" of outcome branch $P_i$.

For the system's probabilistic model $\{p_i\}$ to be self-consistent with its own PCE-optimized resource allocation and valuation schema $\{f(P_i)\}$, the probabilities $p_i$ must align with $f(P_i)$. Specifically, if the system assigns probabilities $p_i$ that are *not* proportional to $f(P_i)$, it means its explicit predictive model (using $p_i$) is misaligned with its implicit PCE-derived valuation $f(P_i)$. This is analogous to a rational agent whose subjective probabilities deviate from objective odds it has itself determined as optimal based on resource costs and payoffs. Such a misalignment implies sub-optimal decision-making concerning future actions or resource allocations that depend on these probabilities (e.g., how much complexity $C$ to allocate via the Law of Prediction, Thm 19, based on a $\hat{C}_{target}$ value inferred probabilistically).

**POP and PCE select for this alignment.** A system whose $p_i$ does not track $f(P_i)$ would consistently misallocate resources, leading to a higher average $V(x)$ over time compared to a system where $p_i \propto f(P_i)$. The drive to minimize $V(x)$ globally (as per Appendix D dynamics) thus forces this alignment.
Therefore, the only stable, PCE-optimal probability assignment is $p_i = c \cdot f(P_i) = c \cdot \text{Tr}(\rho P_i)$ for some constant $c$.
The constant of proportionality $c$ is fixed by the normalization requirement $\sum_i p_i = 1$ for any complete set of orthogonal projectors $\{P_i\}$ satisfying $\sum_i P_i = \mathbf{1}$.
$$
\sum_i p_i = c \sum_i \text{Tr}(\rho P_i) = c \text{Tr}\left(\rho \sum_i P_i\right) = c \text{Tr}(\rho \mathbf{1}) = c \text{Tr}(\rho) = 1
$$
The operator $\rho$ emerging from the cost functional (Theorem G.1.3) is positive semi-definite and trace-class. The physical state of the MPU, $\rho_{phys}$, is also determined by the same global PCE optimization that determines $V(x)$ and its components $f(P_i)$. Thus, PCE self-consistency demands that the $\rho$ appearing in $f(P_i)=\text{Tr}(\rho P_i)$ must be the actual physical state $\rho_{phys}$ of the system. If they were different, it would imply the system's internal cost valuation (determining $\rho$) is based on a "phantom" state, misaligned with its actual physical state $\rho_{phys}$, violating PCE's drive for accurate correspondence between internal models and physical reality (akin to the misalignment penalized by $V_{proxy}$ in Theorem D.1, but here applied to the valuation of predictive branches). The density operator representing a physical state must have unit trace: $\text{Tr}(\rho_{phys}) = 1$. This forces $c=1$.

Therefore, the unique probability assignment consistent with the PCE-derived cost structure is the Born rule:
$$
p_i = \text{Tr}(\rho_{phys} P_i)
\quad \text{(G.1.4)}
$$
For a system in a pure state $|\psi\rangle$, the density operator is $\rho_{phys} = |\psi\rangle\langle\psi|$, and the probability becomes:
$$
p_i = \text{Tr}(|\psi\rangle\langle\psi| P_i)
$$
If $P_i = |i\rangle\langle i|$ projects onto a basis state $|i\rangle$ (associated with perspective $s$), then
$$
p_i = \text{Tr}(|\psi\rangle\langle\psi| |i\rangle_s\langle i|_s) = \langle i | \psi \rangle_s \langle \psi | i \rangle_s = |\langle i|\psi\rangle_s|^2
$$
This recovers the standard form of the Born rule (Proposition 7, Equation 50).

**G.1.5 The Two-Dimensional Case**

Gleason's original proof required the Hilbert space dimension to be $\dim(\mathcal{H}) \ge 3$. Since the MPU Hilbert space $\mathcal{H}_0$ has $\dim d_0 \ge 8$ (Theorem 23), the theorem applies directly to the fundamental MPU outcome space. However, for effective two-dimensional subspaces (qubits) that emerge within larger MPU aggregates or represent specific degrees of freedom, the validity of the Born rule requires separate justification. The framework provides two complementary and robust arguments for its universal applicability.

1.  **Higher-Dimensional Embedding:** From a physical perspective, no effective qubit is a truly isolated system. It is always embedded within the MPU's native $d_0 \ge 8$ space and coupled to its environment. The full Hilbert space of the interacting system (qubit + environment/rest of MPU) is high-dimensional, satisfying the conditions for Gleason's theorem. The Born rule for the qubit subsystem then follows from the consistency of the larger system's description.

2.  **Extension via POVMs and PCE:** From a formal perspective, the derivation can be extended to cover the $\dim=2$ case by considering the most general class of quantum measurements, described by Positive Operator-Valued Measures (POVMs). POVMs arise naturally in describing the open-system interactions of ND-RID ('Evolve') and restricted measurements on subsystems. The Principle of Compression Efficiency (PCE) demands consistent and efficient resource accounting for *all* physically realizable predictive operations, including those described by POVMs. This leads to the following derived principle:

    **Principle of Generalized Additivity (PCE-Derived).** The cost frame function $f$ must be additive over all possible predictive partitions, including those represented by POVMs. That is, for any finite POVM $\{E_i\}$ satisfying $\sum_i E_i = \mathbf{1}$, the cost additivity $f(\{E_i\}) = \sum_i f(E_i)$ must hold.
    *Justification:* This is a direct consequence of PCE. As argued in Lemma G.1.1, any contextuality or non-additivity in the cost-accounting represents an inefficiency that increases the global PCE potential $V(x)$. PCE dynamics will therefore select for configurations where the internal accounting is maximally simple and consistent across all possible measurement types, enforcing additivity for POVMs.

    **Claim.** Let $f$ assign to each effect $E$ on $\mathbb C^2$ a number $f(E)\in[0,1]$ such that: (i) for every finite POVM $\{E_i\}$, $\sum_i f(E_i)=1$ (finite additivity on POVM refinements); (ii) $f$ is continuous in the operator norm; and (iii) $f(\mathbf 1)=1$. Then there exists a unique density operator $\rho$ on $\mathbb C^2$ with $f(E)=\mathrm{tr}(\rho E)$ for all effects $E$.

    *Proof.* By the principle, $f$ is a bounded, positive, finitely additive functional on the effect algebra. For $E,F\ge 0$ with $E+F\le I$, embed $\{E,F,I-E-F\}$ into a POVM to get $f(E+F)=f(E)+f(F)$; by scaling, extend $f$ to all positive $T\le I$, then to the positive cone by homogeneity, to self-adjoints by Jordan decomposition, and to all of $\mathcal B(\mathbb C^2)$ by complex linearity (details as in Busch 2003). By the Riesz representation theorem there exists a unique $\rho\ge 0$, $\mathrm{tr}\,\rho=1$, such that $f(E)=\mathrm{tr}(\rho E)$ for all effects $E$. Specializing to projections $P$ recovers the Born weights $f(P)=\mathrm{tr}(\rho P)$. This closes the $d=2$ case. [Busch 2003; Caves–Fuchs–Manne–Renes 2004] ∎

Therefore, both the physical embedding and the formal extension via PCE-enforced consistency for POVMs ensure that the Born rule derivation holds universally within the framework.

**G.1.6 Physical Interpretation**

The derivation shows that the Born rule is not an ad-hoc postulate but emerges as the unique, self-consistent way to assign predictive weights (probabilities) that align with the optimal resource allocation determined by the fundamental PCE optimization principle operating within the Hilbert space structure. The quadratic dependence on amplitudes ($|\langle i|\psi\rangle|^2$) arises naturally from the trace functional applied to projectors, reflecting the underlying structure of the PCE potential landscape. The density operator $\rho_{phys}$ serves simultaneously as the descriptor of the physical state and the generator of the consistent cost/probability measure.

**G.1.7 Summary Theorem**

**Theorem G.1.7 (Born Rule from Cost Optimisation).**
In the Predictive Universe framework, the principles of Prediction Optimization (POP, Axiom 1) and Compression Efficiency (PCE, Definition 15) imply that the effective cost associated with potential physical outcomes (represented by orthogonal projectors $P_i$ on the emergent Hilbert space $\mathcal{H}$) defines a non-negative, bounded, additive, and non-contextual frame function $f(P_i)$. By Gleason's Theorem (Theorem G.1.3), this function must take the form $f(P_i) = \text{Tr}(\rho P_i)$ for a unique density operator $\rho$. Consistency between this optimization-derived weighting and the probabilistic nature of outcomes required by Logical Indeterminacy (Hypothesis 2) mandates that the probability $p_i$ of outcome $P_i$, for a system in physical state $\rho_{phys}$, be given by the Born rule: $p_i = \text{Tr}(\rho_{phys} P_i)$.

**G.1.8 Hilbert-Space Uniqueness under POP + PCE**

The existence of a well-behaved cost functional satisfying the premises of Theorem G.1.3 not only leads to the Born rule but also provides a justification for the emergence of the Hilbert space structure itself as the unique optimal framework for predictive processing under POP/PCE.

**Theorem G.1.8 (Hilbert-Space Uniqueness from POP + PCE).**
Let $\mathfrak{A}$ be an abstract algebraic structure describing the predictive possibilities and operations of a system governed by POP and PCE. Assume that this structure admits a physically meaningful, non-negative, bounded, additive, and non-contextual cost functional $f$ defined on its projections (representing potential outcomes), satisfying the conditions derived from PCE consistency that lead to Theorem G.1.3 (i.e., $f(P)=\text{Tr}(\rho P)$ must hold for the PCE-optimal state $\rho$). Then, for consistency with the requirements of representing such a trace functional, the algebraic structure $\mathfrak{A}$ must be representable as an algebra of operators acting on a complex Hilbert space $\mathcal{H}$, unique up to isomorphism (for $\dim \ge 2$). This theorem rigorously justifies Proposition 4 (Emergence of Complex Hilbert Space $\mathcal{H}_0$) in the main text.

*Proof.*
1.  **Existence of Trace Form Cost Functional:** By Theorem G.1.7, POP/PCE optimization leads to an effective cost structure for outcome branches $P$ that necessitates $f(P) = \text{Tr}(\rho_{phys} P)$, where $\rho_{phys}$ is the system's physical state (a positive semi-definite operator). The trace functional is central.
2.  **GNS Construction for Hilbert Space Representation:** The state $\omega(A) = \text{Tr}(\rho_{phys} A)$ is a positive linear functional on any C*-algebra $\mathfrak{A}_{ops}$ of operators that includes the projectors and observables. The Gelfand-Naimark-Segal (GNS) construction [Reed & Simon 1980] guarantees that for any such state on a C*-algebra, there exists a unique (up to unitary equivalence) Hilbert space $\mathcal{H}_\omega$, a representation $\pi_\omega: \mathfrak{A}_{ops} \to B(\mathcal{H}_\omega)$ (bounded operators on $\mathcal{H}_\omega$), and a cyclic vector $|\Omega_\omega\rangle \in \mathcal{H}_\omega$ such that $\omega(A) = \langle \Omega_\omega | \pi_\omega(A) | \Omega_\omega \rangle$.
3.  **Why Complex Hilbert Space?:** The PCE imperative for efficiency selects the complex field $\mathbb{C}$ over real ($\mathbb{R}$) or quaternionic ($\mathbb{H}$) alternatives. While all can support vector space structures, the complex Hilbert space is uniquely efficient for the tasks required by POP.
    *   **Local Tomography & Information Cost:** A key measure of efficiency is the number of measurements needed to determine a state (local tomography). For a $d$-dimensional system, quantum state tomography on a complex Hilbert space requires $\mathcal{O}(d^2)$ measurements. For a real Hilbert space, it requires $\mathcal{O}(d^2)$, but for a quaternionic space, it requires $\mathcal{O}(2d^2)$ measurements.
    *   **Symmetry and Dynamics:** The group of unitary transformations $U(d)$ on $\mathbb{C}^d$ is simpler and more computationally efficient to represent than the orthogonal group $O(d)$ on $\mathbb{R}^d$ or the compact symplectic group $Sp(d)$ on $\mathbb{H}^d$ for many tasks. Crucially, the $U(1)$ phase freedom that gives rise to electromagnetism as a PCE-optimal solution (Section G.7) is a natural feature of the complex structure, but is absent or more complex in real and quaternionic spaces.
    *   **PCE Selection:** A system based on $\mathbb{R}$ or $\mathbb{H}$ would incur higher information acquisition costs (more measurements for tomography) and/or higher complexity costs to represent the necessary dynamics compared to a system based on $\mathbb{C}$. PCE, by minimizing these costs within the potential $V(x)$, selects the complex Hilbert space as the most resource-efficient substrate for prediction.
4.  **Uniqueness & Optimality:** The combination of (a) Gleason's theorem (underpinned by POP/PCE cost consistency) selecting the trace-form for costs/probabilities, and (b) the GNS construction providing a unique Hilbert space representation for systems supporting such trace-form states, establishes that the complex Hilbert space structure is uniquely determined (up to isomorphism) as the necessary arena for the self-consistent, PCE-optimized predictive processing modeled by the PU framework. This also makes Proposition 4 (Emergence of Complex Hilbert Space) a derived theorem based on Theorem G.1.8.QED

**Corollary G.1.9 (PCE Instability of Alternative Predictive Algebras).**
Any proposed alternative algebraic structure for prediction (e.g., classical probability on phase space, real or quaternionic Hilbert spaces, Jordan algebras, $L^p$ spaces with $p \neq 2$) would be unstable under PCE optimization compared to the complex Hilbert space structure.
*Proof Sketch:*
1.  **Classical Phase Space:** Lacks the capacity for superposition and non-commuting observables necessary to efficiently model the full range of MPU interactions and internal states required by POP (e.g., resolving SPAP/Logical Indeterminacy constraints requires QM-like complementarity, efficiently handled in Hilbert space). It also cannot directly support a cost functional satisfying Gleason's theorem conditions in a way that leads to QM probabilities.
2.  **Real Hilbert Spaces:** While supporting some quantum features, they lack the natural $U(1)$ phase freedom essential for the emergence of electromagnetism (Section G.2) and face restrictions with Gleason's theorem for general probability measures, potentially leading to contextual or non-additive cost functions that are sub-optimal under PCE. Tensor products and certain symmetries are also more cumbersome.
3.  **Quaternionic Hilbert Spaces:** Introduce additional non-commutative structure in the scalar field, leading to different symmetry groups and typically more complex dynamics. Unless these extra structures provide a significant, demonstrable PCE benefit (e.g., vastly improving $PP$ or reducing $R, R_I$ costs without other penalties), PCE would favor the simpler complex Hilbert space.
4.  **General Failure to Support Optimal Cost Structure:** For these alternatives to be viable under PU, they would need to support a cost frame functional $f(P)$ exhibiting non-contextual additivity (from Lemma G.1.1) and consistency with $P(P)=\text{Tr}(\rho_{phys}P)$ globally (from Section G.1.4 logic). If an alternative structure fails to naturally yield this, then imposing it would be akin to adding constraints. This deviation from the structure intrinsically optimal for complex Hilbert spaces would manifest as an additional effective penalty term in its PCE potential $V(x)_{alt} = V(x)_{complex_H} + V_{penalty,struc}$. PCE dynamics minimizing $V(x)_{alt}$ would then drive the system either towards behaviors that mimic complex Hilbert space dynamics or to states that are demonstrably less efficient, thus being outcompeted by true complex Hilbert space based MPU configurations. Thus, the complex Hilbert space structure is uniquely stable under PCE. QED

**G.2 Local Phase Freedom and Emergence of Gauge Structure**

Having established the necessity of a complex Hilbert space $\mathcal{H}$ and the Born rule from PCE principles, we now derive the origin of gauge symmetries.

**Conjecture G.M1 (SM gauge group from PCE cost minimization under the Local Module Hypothesis).**
Let $\mathcal P\to M$ be the bundle of predictive frames that **preserve PCE** under refinements. The fiber consists of **ordered, PCE‑adapted orthonormal frames**, on which the group of frame transformations acts freely.
(i) The group $G_x$ of local predictive‑frame transformations that preserve the predictive state $\omega$ acts **freely and transitively** on the fiber, making $\mathcal P$ a **principal $G$‑bundle**.
(ii) A PCE‑least‑action transport defines a **connection** $A$ on $\mathcal P$ with curvature $F=dA+A\wedge A$.
(iii) **Local Module Hypothesis (LMH).** If the local MPU Hilbert space decomposes as a direct sum of predictive modules $H_x\cong \mathbb C\oplus\mathbb C^2\oplus\mathbb C^3$ (as expected when predictive partitions decouple to leading order under PCE locality) and the predictive‑frame symmetry acts **locally** as a product group
$$
G\ \cong\ G_1\times G_2\times G_3,
$$
then the total PCE coherence cost **adds** across modules.
*Partition‑to‑Module Lemma.* If a predictive partition $\mathcal H=\bigoplus_i \mathcal H_i$ saturates the PCE locality bound and inter‑module predictive mutual information vanishes at leading order, then there exists a local frame in which PCE coherence costs **add** across modules up to higher‑order corrections: $\mathcal C\big(\bigoplus_i\mathcal H_i\big)=\sum_i \mathcal C(\mathcal H_i)+O(\epsilon_{\rm int})$.

For a simple compact factor $G_i$ acting irreducibly on an $n$‑dimensional module, we posit a PCE-motivated cost functional. All quadratic Casimirs $C_2$ below use the standard physics convention (long roots of length‑squared 2; for $SU(N)$, $\mathrm{Tr}(T_aT_b)=\tfrac{1}{2}\delta_{ab}$). A minimal, physically motivated form is:
$$
\mathcal C(G_i)=\frac{n}{n+1}\,C_2(U_i),
$$
where $C_2(U_i)$ is the quadratic Casimir of the representation $U_i$ of $G_i$ on $\mathbb{C}^n$. This form follows from the PCE risk expansion on complex projective space $\mathrm{CP}^{n-1}$: the expected second‑order predictive loss along Killing‑normalized generators scales as $\frac{n}{n+1}\mathrm{Tr}\big(\sum_a H_a^2\,\rho\big)=\frac{n}{n+1}C_2(U_i)$; cross‑module terms vanish under the Lemma above. For $U(1)$, we use the aggregate cost over fields: $\mathcal C_{U(1)}\propto \sum_{\text{fields}} (\text{multiplicity})\cdot Y^2$.

**Minimization under LMH** yields:
*   On $\mathbb C^2$: The unique simple option with a faithful 2‑dimensional complex irrep is $SU(2)$. Minimal cost selects the fundamental representation with $C_2(SU(2)_{\mathbf{2}})=\frac{3}{4}$.
*   On $\mathbb C^3$: Candidates are $SU(3)$ in the fundamental and $SU(2)$ in the spin-1 (adjoint) representation. The respective costs are:
    $$
    \mathcal C(SU(3)_{\mathbf{3}}) = \frac{3}{4}\,C_2(SU(3)_{\mathbf{3}})=\frac{3}{4}\cdot\frac{4}{3}=1
    \quad<\quad
    \mathcal C(SU(2)_{j=1})=\frac{3}{4}\,C_2(SU(2)_{j=1})=\frac{3}{4}\cdot 2=\frac{3}{2}.
    $$
    PCE selects the lower-cost option, $SU(3)$. Thus, the non‑abelian part is **$SU(2)\times SU(3)$** acting in fundamentals.
*   **Abelian factor:** A **single** non‑trivial $U(1)$ factor is **sufficient** and **cost‑minimal** for SM‑like chiral content. With a common proportionality constant across abelian sectors, **any additional non‑trivial $U(1)$** strictly increases the abelian cost; hence one and only one $U(1)$ is cost‑minimal.

**Note on irreducible competitors.** Competing **simple** groups acting irreducibly on $\mathbb C^5 \cong \mathbb C^2 \oplus \mathbb C^3$ (e.g., $SU(5)$) are disfavored by the cost (2.0 vs 1.5) and **ruled out** in PU by the **capacity bound** ($\dim SU(5)=24 > n_{\max}$, Eq. G.8.0). Orthogonal/symplectic alternatives have real/pseudoreal fundamentals that obstruct the required **chirality**, providing a second, independent exclusion. ∎

For the simplest case of a single predictive field, the group of PCE-preserving automorphisms is $U(1)$. The physical predictions (probabilities $p_i$) derived from a state vector $|\Psi(x)\rangle$ depend only on the squared amplitudes. This implies an inherent redundancy: multiplying the state vector by a local phase factor leaves all local physical predictions unchanged:
$$
|\Psi(x)\rangle \longrightarrow |\Psi'(x)\rangle = e^{\,i q \theta(x)}|\Psi(x)\rangle
\quad (\theta(x)\in\mathbb{R})
\quad \text{(G.2.1)}
$$
Here, $q$ represents a "charge" associated with the field $\Psi$, indicating how it transforms under this phase rotation. This constitutes a local $U(1)$ gauge symmetry intrinsic to the description.

**G.3 The Predictive-Coherence Problem**

Effective prediction across the MPU network (required by POP, Axiom 1) necessitates comparing predictive states (amplitudes) at different spacetime points, say $x$ and $x+dx$. This comparison is essential for calculating gradients, predicting propagation, and maintaining coherent superposition across the network. However, the local gauge freedom (Eq. G.2.1) obstructs simple comparison using the standard partial derivative $\partial_\mu$. If we transform $|\Psi(x)\rangle \to e^{iq\theta(x)}|\Psi(x)\rangle$, the derivative transforms as:
$$
\partial_{\mu}|\Psi(x)\rangle \longrightarrow \partial_{\mu}(e^{iq\theta(x)}|\Psi(x)\rangle) = e^{iq\theta(x)} \left( \partial_{\mu}|\Psi(x)\rangle + iq(\partial_{\mu}\theta(x))|\Psi(x)\rangle \right)
\quad \text{(G.2.2)}
$$
The derivative transforms inhomogeneously (acquiring the extra $iq(\partial_{\mu}\theta)|\Psi\rangle$ term), making the difference $\partial_{\mu}|\Psi(x)\rangle dx^\mu$ depend on the arbitrary local phase choices $\theta(x)$.

Maintaining predictive coherence by explicitly tracking all relative phases between the $N$ MPUs in a large aggregate would require managing $\mathcal{O}(N^2)$ relative phases. The propagation cost component of the PCE Potential, $V_{prop}$, would scale super-extensively as $\mathcal{O}(N^2)$, while the available resource budget and predictive benefits scale extensively as $\mathcal{O}(N)$. In contrast, introducing a local gauge field to manage coherence introduces a cost that scales with the number of field degrees of freedom, which is extensive, $\mathcal{O}(N)$. For any sufficiently large system ($N > N_{crit}$), the extensive cost of the gauge field solution is guaranteed to be lower than the super-extensive cost of explicit phase tracking. PCE, which minimizes the total potential $V(x)$, therefore necessarily selects the gauge field solution as the only viable and efficient mechanism for maintaining coherence in large MPU aggregates.

**G.4 Emergent Connection and Covariant Derivative**

PCE demands the most resource-efficient mechanism to enable reliable comparison of predictive states across spacetime points despite the local phase freedom. Introducing a dynamical connection field $A_\mu(x)$ that transforms appropriately under the gauge transformation provides such a mechanism.

**Definition G.4.1 (Covariant Derivative $D_\mu$).**
A covariant derivative $D_\mu$ is defined to incorporate the connection $A_\mu$ such that $D_\mu \Psi$ transforms homogeneously (like $\Psi$) under the gauge transformation (Eq. G.2.1). The emergent spacetime is curved (Section 11, Theorem 46), requiring incorporation of the geometric spin connection $\Omega_\mu$ (from Theorem 48) for fields with spin. For scalar fields (simplest case for illustration), $\Omega_\mu$ acts trivially. The covariant derivative is:
$$
D_{\mu}\Psi(x) = (\partial_{\mu} + \Omega_{\mu} + iqA_{\mu}(x))\Psi(x)
\quad \text{(G.4.1)}
$$
To ensure $D_\mu \Psi$ transforms as $D_\mu \Psi \mapsto e^{iq\theta(x)} D_\mu \Psi$ when $\Psi \mapsto e^{iq\theta(x)}\Psi$ and the connection field transforms $A_\mu \mapsto A'_\mu$, we must satisfy:
$$
(\partial_\mu + \Omega_\mu + iqA'_\mu)(e^{iq\theta(x)}\Psi(x)) = e^{iq\theta(x)}(\partial_\mu + \Omega_\mu + iqA_\mu(x))\Psi(x)
$$
Expanding the left-hand side using the Leibniz rule for $\partial_\mu$ and $\Omega_\mu$ (which acts linearly):
$e^{iq\theta(x)} (iq\partial_\mu\theta(x))\Psi(x) + e^{iq\theta(x)}\partial_\mu\Psi(x) + e^{iq\theta(x)}\Omega_\mu\Psi(x) + e^{iq\theta(x)}(iqA'_\mu(x))\Psi(x)$
$= e^{iq\theta(x)}(\partial_\mu\Psi(x) + \Omega_\mu\Psi(x) + iqA_\mu(x)\Psi(x))$
Dividing by the non-zero factor $e^{iq\theta(x)}\Psi(x)$ (assuming $\Psi(x) \neq 0$) and cancelling common terms yields the required transformation law for the connection field $A_\mu$:
$$
iq(\partial_\mu\theta(x)) + iqA'_\mu(x) = iqA_\mu(x)
$$
$$
A'_{\mu}(x) = A_{\mu}(x) - \partial_{\mu}\theta(x)
\quad \text{(G.4.2)}
$$
(Note: Standard convention uses charge $e$ and defines $D_\mu = \partial_\mu - ieA_\mu$, leading to $A'_\mu = A_\mu + (1/e)\partial_\mu\theta$. The physics is identical, differing only by conventions for charge sign and coupling constant placement in the covariant derivative. For this derivation, $iqA_\mu$ is used directly).

The introduction of the connection $A_\mu$ and covariant derivative $D_\mu$ is the minimal structural modification required to allow local, phase-invariant comparison of field values. This represents the most resource-efficient solution, strongly favored by PCE, to overcome the predictive coherence problem arising from local phase freedom. If the $U(1)$ symmetry group is compact (which is physically expected for charge conservation), consistency of the gauge theory (e.g., topological considerations for magnetic monopoles, if they exist) generally requires that the charge $q$ be quantized in units of some fundamental charge $e_0$.

**G.5 Field Dynamics from PCE**

The connection field $A_\mu$ is a new dynamical degree of freedom introduced for predictive efficiency. It carries energy and complexity, contributing to the overall PCE potential $V(x)$. PCE favors dynamics that minimize the contribution of this field to the potential. The simplest (lowest order in derivatives, typically second order for standard kinetic terms), local, gauge-invariant, and Lorentz-invariant cost term that penalizes variations in the field is constructed from the field strength tensor $F_{\mu\nu}$:
$$
F_{\mu\nu}(x) = \partial_{\mu}A_{\nu}(x) - \partial_{\nu}A_{\mu}(x)
\quad \text{(G.5.1)}
$$
*Convention.* We absorb the coupling into the covariant derivative: $D_\mu=\partial_\mu+i\,q\,A_\mu$. Then $A_\mu\mapsto A_\mu-\partial_\mu\theta$ and $\psi\mapsto e^{iq\theta}\psi$. In the non‑abelian case, $D_\mu=\partial_\mu+i\,g\,A_\mu^aT^a$ and $F_{\mu\nu}=\partial_\mu A_\nu-\partial_\nu A_\mu+i g\,[A_\mu,A_\nu]$; in differential‑form notation with anti‑Hermitian $A$, $F=dA+A\wedge A$.

This $F_{\mu\nu}$ is automatically gauge invariant under the transformation Equation (G.4.2):
$F'_{\mu\nu} = \partial_{\mu}A'_{\nu} - \partial_{\nu}A'_{\mu} = \partial_{\mu}(A_{\nu} - \partial_{\nu}\theta) - \partial_{\nu}(A_{\mu} - \partial_{\mu}\theta)$
$F'_{\mu\nu} = (\partial_{\mu}A_{\nu} - \partial_{\nu}A_{\mu}) - (\partial_{\mu}\partial_{\nu}\theta - \partial_{\nu}\partial_{\mu}\theta) = F_{\mu\nu}$ (since partial derivatives commute).
The unique quadratic Lorentz invariant constructed from $F_{\mu\nu}$ is $F_{\mu\nu}F^{\mu\nu}$. The contribution to the PCE potential density (a cost) associated with field strength should be positive definite (penalizing strong fields for stability) and typically quadratic in fields for linear equations of motion. A plausible form arising from minimizing $V(x)$ components is $\mathcal{V}_{field} = \frac{1}{4\kappa_F} F_{\mu\nu}F^{\mu\nu}$, where $\kappa_F > 0$ is an effective coupling strength (a positive constant because PCE penalizes this field strength as a resource cost). The corresponding term in the action functional (whose variation gives equations of motion, and which is related to $-\int \mathcal{V}_{field} dV dt$ integrated over spacetime volume) is:
$$
S_{\text{field}}[A] = \int d^{D}x\,\sqrt{-g}\;\left(-\frac{1}{4\kappa_F} F_{\mu\nu}(x)F^{\mu\nu}(x)\right)
\quad \text{(G.5.2)}
$$
(using D=4 for spacetime dimension). By rescaling the field $A_\mu \to \sqrt{\kappa_F} A_\mu$ and absorbing the coupling $\sqrt{\kappa_F}$ into the definition of the charge $q$ (such that the product $qA_\mu$ remains invariant, e.g., if original $q \to q/\sqrt{\kappa_F}$ and original $A_\mu \to \sqrt{\kappa_F} A_\mu$, then $qA_\mu \to (q/\sqrt{\kappa_F}) (\sqrt{\kappa_F} A_\mu) = q A_\mu$; effectively this redefines the charge $q$ to incorporate $\kappa_F$), we obtain the standard dimensionless form for the Maxwell action:
 $$
S_{\text{field}}[A] = \int d^{4}x\,\sqrt{-g}\;\left(-\frac{1}{4} F_{\mu\nu}(x)F^{\mu\nu}(x)\right)
\quad \text{(G.5.3)}
 $$
Minimizing this action with respect to variations in $A_\nu$ ($\delta S_{field} / \delta A_\nu = 0$) yields the source-free Maxwell equations in curved spacetime: $\nabla_{\mu}F^{\mu\nu} = 0$ (where $\nabla_\mu$ is the metric-compatible covariant derivative). This represents the simplest, most resource-efficient dynamics for the emergent connection field, strongly favored by PCE as it minimizes unnecessary field energy contributions to $V(x)$.

**G.6 Minimal Coupling to Matter**

The interaction between the emergent gauge field $A_\mu$ and matter fields arises from the same microscopic coherence cost that necessitates the gauge field's existence. The propagation cost component of the PCE Potential, $V_{prop}$, penalizes any loss of predictive coherence between neighboring MPUs. On the emergent network with effective spacing $\delta$, this cost for a link between site $v$ and $v+\mu$ can be modeled by a functional that is minimized for perfect coherence. For a coarse-grained scalar field $\psi$ representing the slow modes of the MPU state, this cost is proportional to $|\psi_v - \mathcal{U}_{v,\mu} \psi_{v+\mu}|^2$, where the link transporter $\mathcal{U}_{v,\mu} = e^{iq\delta A_\mu(v)}$ is the lattice gauge field.

To derive the effective action for the matter field $\psi$ in the continuum limit, we perform a gradient expansion of this microscopic link cost. The gauged finite difference is:
$$
\psi_v - \mathcal{U}_{v,\mu} \psi_{v+\mu} = \psi(x) - e^{iq\delta A_\mu(x)} \psi(x+\delta\hat{e}_\mu)
$$
Expanding both terms to first order in the spacing $\delta$:
$$
\approx \psi(x) - (1 + iq\delta A_\mu(x)) (\psi(x) + \delta \partial_\mu \psi(x))
$$
$$
\approx \psi(x) - (\psi(x) + \delta \partial_\mu \psi(x) + iq\delta A_\mu(x)\psi(x)) = -\delta(\partial_\mu + iqA_\mu(x))\psi(x)
$$
The link cost is therefore proportional to $\delta^2 |D_\mu \psi|^2$, where $D_\mu = \partial_\mu + iqA_\mu$ is precisely the covariant derivative. Summing this cost over all links and taking the continuum limit ($\sum_v \delta^D \to \int d^Dx$) demonstrates that the kinetic term for the matter field emerging from the microscopic PCE coherence cost is exactly the minimally coupled term. This provides a constructive, "bottom-up" justification for the principle of minimal coupling, showing it to be the unique, lowest-order structure consistent with the underlying gauge invariance required for predictive coherence. The standard procedure is thus to replace all partial derivatives $\partial_\mu$ in the free-field Lagrangian with the full covariant derivative $D_\mu$ (Equation G.4.1).
For a complex scalar field $\phi$ with charge $q$:
$$
\mathcal{L}_{\text{scalar, free}} = g^{\mu\nu}(\partial_\mu \phi)^* (\partial_\nu \phi) - m^2 |\phi|^2
$$
becomes under minimal coupling (ignoring $\Omega_\mu$ for scalar field):
$$
\mathcal{L}_{\text{scalar}} = g^{\mu\nu}(D_\mu \phi)^* (D_\nu \phi) - m^2 |\phi|^2 = g^{\mu\nu}((\partial_\mu \phi^* - iqA_\mu\phi^*)) ((\partial_\nu \phi + iqA_\nu\phi)) - m^2 \phi^*\phi
\quad \text{(G.6.1)}
$$
For a Dirac field $\Psi$ with charge $q$:
$$
\mathcal{L}_{\text{Dirac, free}} = \bar{\Psi}(i\gamma^\mu (\partial_\mu + \Omega_\mu) - m)\Psi
$$
becomes under minimal coupling:
$$
\mathcal{L}_{\text{Dirac}} = \bar{\Psi}(i\gamma^\mu D_\mu - m)\Psi = \bar{\Psi}(i\gamma^\mu (\partial_\mu + \Omega_\mu + iqA_\mu) - m)\Psi
\quad \text{(G.6.2)}
$$
This procedure automatically generates gauge-invariant interaction terms between the matter fields and the connection field $A_\mu$. Varying the total action $S = S_{field} + S_{matter}$ with respect to $A_\mu$ (where $S_{matter} = \int \mathcal{L}_{matter} \sqrt{-g} d^4x$) now yields the sourced Maxwell equations:
$$
\nabla_{\mu}F^{\mu\nu} = J^{\nu}
\quad \text{(G.6.3)}
$$
where $J^\nu$ is the conserved Noether current associated with the $U(1)$ symmetry of the matter Lagrangian (e.g., $J^\nu = iq(\phi^* (D^\nu \phi) - \phi (D^\nu \phi)^*)$ for a scalar field, $J^\nu = q \bar{\Psi}\gamma^\nu \Psi$ for a Dirac field). The conservation of this current, $\nabla_\nu J^\nu = 0$, is automatically satisfied when the matter field equations (derived from $\delta S_{matter}/\delta\phi^* = 0$ or $\delta S_{matter}/\delta\bar\Psi = 0$) hold.

**G.7 Summary of $U(1)$ Emergence**

The emergence of $U(1)$ gauge theory can be summarized in the following steps, driven by POP/PCE principles:

1.  **G.1: Quantum Weights**
    *   **Content:** Derive $p_i = \text{Tr}(\rho_{phys} P_i)$
    *   **POP / PCE Justification Principle Applied:** Optimal resource allocation implies consistent, PCE-derived cost structure for outcomes (non-contextual, additive).
    *   **Result:** Born rule and complex Hilbert space (Thm G.1.7, G.1.8).

2.  **G.2: Local Phase Redundancy**
    *   **Content:** $|\Psi(x)\rangle \sim e^{iq\theta(x)}|\Psi(x)\rangle$
    *   **POP / PCE Justification Principle Applied:** Inherent symmetry of complex Hilbert space description.
    *   **Result:** Local $U(1)$ gauge freedom.

3.  **G.3: Predictive Coherence Problem**
    *   **Content:** $\partial_{\mu}$ comparison fails, leading to high (super-extensive) PCE costs for explicit phase tracking.
    *   **POP / PCE Justification Principle Applied:** PCE disfavors super-extensive cost contributions to $V(x)$.
    *   **Result:** Need for efficient (PCE-optimal) coherence mechanism.

4.  **G.4: Emergent Connection**
    *   **Content:** Introduce $A_\mu, D_\mu$ to ensure homogeneous transformation of derivatives.
    *   **POP / PCE Justification Principle Applied:** Minimal complexity solution for local gauge-invariant comparison, favored by PCE.
    *   **Result:** Covariant derivative $D_\mu$, connection $A_\mu$ transformation law (Eq. G.4.2).

5.  **G.5: Field Dynamics**
    *   **Content:** Minimize field energy cost contribution to $V(x)$; form $\propto F^2$ is simplest gauge/Lorentz invariant.
    *   **POP / PCE Justification Principle Applied:** PCE favors simplest, stable dynamics for new field, minimizing unnecessary additions to $V(x)$.
    *   **Result:** Maxwell action $S_{\text{field}}$ (Eq. G.5.3), source-free equations $\nabla_\mu F^{\mu\nu}=0$.

6.  **G.6: Matter Coupling**
    *   **Content:** Replace $\partial_{\mu} \to D_{\mu}$ in $\mathcal{L}_m$ to maintain gauge invariance for interaction.
    *   **POP / PCE Justification Principle Applied:** PCE favors minimal complexity additions to action, ensures maintained symmetries.
    *   **Result:** Minimal coupling interaction terms, sourced Maxwell Equations (Eq. G.6.3).

The $U(1)$ gauge theory of electromagnetism emerges as the unique, most resource-efficient (PCE-optimal) structure necessitated by the requirement to maintain predictive coherence across the network in the face of the inherent local phase freedom of the emergent complex Hilbert space description.

## G.8 The Standard Model Gauge Group and Spacetime Dimension D=4 as a Unified PCE-Optimal Structure

### G.8.1 Introduction and Objective: Co-selection from First Principles

This section extends the logic of the Principle of Compression Efficiency (PCE, Definition 15) to argue for the emergence of the Standard Model (SM) gauge group, $G_{SM} = SU(3)\times SU(2)\times U(1)$ with its chiral fermion content, and the D=4 dimensionality of spacetime as a *unified, co-selected optimal structure*. Building upon the established emergence of a complex Hilbert space (Theorem G.1.8) and a $U(1)$ gauge symmetry (Section G.7) from POP/PCE, we argue that PCE, when applied to the selection of more complex non‑Abelian gauge structures and the dimensional arena for their operation, strongly favors the observed D=4 SM configuration.

The hypothesis is that neither the SM structure nor D=4 dimensionality are arbitrary empirical inputs but are necessary and robust consequences of the MPU network minimizing a global PCE potential. This potential, $V_{global}(G, {\psi}, D, \dots)$, is minimized over a vast configuration space where the gauge group $G$, its fermion content ${\psi}$, and the effective spacetime dimension $D$ are treated as co‑optimized variables. D=4 with the SM emerges as a unique “PCE sweet spot” because it simultaneously satisfies multiple, stringent, and dimension‑dependent criteria essential for a predictively viable, informationally efficient, and structurally complex universe (quantitatively reflected by the coefficients in Eq. G.8.5).

We construct a physically motivated model for the PCE potential’s dependence on these properties and show that minimizing this potential, subject to fundamental constraints (MPU network information capacity, mathematical consistency via anomaly cancellation, and structural stability), strongly favors the D=4 SM configuration over conceivable alternatives.

### G.8.2 Foundational Principles for Co-selection

The selection of a stable gauge structure and its operational dimensionality is governed by the minimization of the global PCE potential $V(x)$ (Definition D.1), incorporating $D$ as a variable, subject to fundamental constraints.

#### G.8.2.1 The PCE Potential as the Master Functional

The MPU network evolves to minimize $V(x)$, representing the net resource cost rate. For the gauge sector and dimensionality, this potential accounts for:

*   **Predictive Benefit ($V_{benefit}$):** A gauge structure in an appropriate dimension provides benefits by enabling efficient management of predictive coherence and supporting the formation of complex MPU aggregates necessary for advanced prediction.
*   **Operational & Propagation Costs ($V_{op}, V_{prop}$):** Maintaining a gauge structure and specific network dimensionality incurs costs (gauge field energy, information load for coherence, network propagation costs, structural stability costs).
*   **Consistency Penalties ($V_{penalty}$):** Mathematically or physically inconsistent structures (e.g., anomalous gauge theories in a given $D$, unstable orbital dynamics in another $D$) incur effectively infinite penalties.

#### G.8.2.2 Information Capacity Constraint (D-Independent MPU Property)

The MPU network’s ability to support a complex gauge structure is fundamentally limited by the classical capacity $C_{\max} < \ln d_0$ of the underlying ND‑RID channels (Appendix E, Theorem E.2), where $d_0 \ge 8$ is the MPU Hilbert space dimension. This capacity $C_{\max}$ and the PCE‑optimal information rate $\alpha_{load}$ (in nats per link per cycle) are taken as fundamental MPU network properties. Specifically, $\alpha_{load}$ represents the D‑independent information rate needed to maintain the coherence of a single gauge generator’s state (e.g., reliably tracking its phase evolution) across an MPU–MPU link; this reliable tracking necessitates a low effective logical error rate $p_{err}^*$ per cycle for the underlying computations, where $p_{err}^*$ is the dynamically optimal error rate derived from PCE principles in Appendix A.0 (Theorem A.0.2). These parameters ($C_{\max}, \alpha_{load}, p_{err}^*$) are tied to the intrinsic $d_0$‑dimensional Hilbert space and ND‑RID logic of individual MPUs, which are pre‑geometric and thus independent of the emergent macroscopic dimension $D$. This imposes a D‑independent hard upper limit on the total number of gauge group generators $n_G$ that can be coherently supported.

*   **Capacity Limit on $n_G$:** The total number of generators must satisfy:

    $$
    n_G \le n_{\max} := \left\lfloor \frac{C_{\max}}{\alpha_{load}} \right\rfloor
    \tag{G.8.0}
    $$

    Using plausible estimates from the PU framework ($C_{\max} \approx 1.5-2.0$ nats, derived from $f_{RID}<1$ which follows from $\varepsilon \ge \ln 2$; $\alpha_{load} \approx 0.1-0.2$ nats, related to achieving sufficient signal‑to‑noise for coherence), we get a target range for the maximum viable total gauge group dimension:

    $$
    n_{\max} \approx \frac{1.5 \text{ to } 2.0}{0.1 \text{ to } 0.2} = 7.5 \text{ to } 20
    $$

    Any gauge group with $n_G$ significantly exceeding 20 is likely unsupportable due to prohibitive information costs, irrespective of $D$.

#### G.8.2.3 Anomaly Cancellation as a PCE Imperative (D‑Sensitive)

Quantum gauge theories with chiral fermions can suffer from quantum anomalies, which are acutely sensitive to spacetime dimension $D$. An anomalous gauge structure implies inconsistency and is assigned an infinite PCE penalty:

$$
V_{\text{anom}}(G,\{\psi\},D)=
\begin{cases}
0, & \text{if anomaly‑free in dimension } D\\[2pt]
+\infty, & \text{if anomalous in dimension } D
\end{cases}
$$

PCE co‑selects $G$, ${\psi}$, and $D$ to ensure $V_{\text{anom}}=0$.

#### G.8.2.4 Stability of Complex Structures (D‑Sensitive)

The existence of stable, complex, bound MPU aggregates ($C_{agg}\gg C_{op}$) is essential for generating significant predictive benefit ($V_{benefit}$). The stability of such structures (e.g., “atoms,” “planetary systems,” “galaxies” in the MPU‑network sense) depends critically on the long‑range behavior of fundamental forces, which is D‑sensitive.

*   For unscreened massless force carriers (like those associated with $U(1)$ gauge fields or gravity), the classical potential in D‑dimensional spacetime scales as $1/r^{D-3}$ for $D>3$ and $\ln r$ for $D=3$ (corresponding to $D_{\text{space}}=D-1$ spatial dimensions). Stable, closed, non‑circular orbits under attractive central forces are robustly supported for an inverse‑square force law ($F\propto 1/r^2$, potential $\propto 1/r$), corresponding to $D_{\text{space}}=3$, i.e., $D=4$ spacetime dimensions [Bertrand, 1873].
*   Higher spatial dimensions ($D_{\text{space}}>3$, i.e., $D>4$) tend towards unstable orbits for such potentials, making the formation and persistence of complex, gravitationally or electrodynamically bound MPU aggregates highly problematic. Lower spatial dimensions ($D_{\text{space}}<3$) can be too restrictive for the topological complexity and degrees of freedom needed for rich aggregate structures.
*   A universe unable to form stable complex structures incurs a catastrophic loss of $V_{benefit}$ (as these structures are the primary engines of advanced prediction) and is thus strongly disfavored by PCE. It is a core hypothesis of this co‑selection argument that PCE robustly translates these D‑sensitive stability issues into highly unfavorable D‑dependent coefficients within the PCE potential model (Eq. G.8.5), for instance, by yielding a significantly lower benefit coefficient $\eta_{ben}(D)$ or imposing high effective penalty terms for dimensions $D\neq 4$ that fail to support such stable complexity.

#### G.8.2.5 Information‑Theoretic and Network Efficiency (D‑Sensitive)

The MPU network’s efficiency under PCE depends on D‑sensitive information‑theoretic properties.

*   **Holographic Efficiency:** The horizon‑entropy area law $S=\mathcal A/(4G)$ holds in the emergent D=4 spacetime. The efficiency of bulk–boundary information encoding (related to how much complexity $C_P$ can be supported within a volume relative to its boundary information capacity) may be optimal in D=4. Other dimensions might lead to less favorable scaling or consistency issues between bulk degrees of freedom and boundary information limits.
*   **Network Propagation and Coherence ($V_{prop}$):** Costs of information propagation, maintaining coherence, and error correction (achieving $p_{err}^*$ in App. A.0) are D‑sensitive. For instance, the nature of random walks (fundamental to information diffusion and error propagation) changes qualitatively: they are recurrent in $D_{\text{space}}\le 2$ but transient in $D_{\text{space}}\ge 3$. D=4 ($D_{\text{space}}=3$) may offer an optimal trade‑off between network connectivity, path‑length scaling, and the stability of information propagation against noise for achieving robust, large‑scale predictive coherence. It is further hypothesized that PCE favors dimensions where these D‑sensitive network efficiencies (which would contribute to minimizing cost coefficients like $\lambda_c(D)$ or maximizing benefit coefficients like effective $\eta_{ben}(D)$ in Eq. G.8.5) are optimized, with D=4 emerging as a strong candidate under such comprehensive optimization.

### G.8.3 A Model for the PCE Potential of the Gauge Sector (in a given D)

For a fixed dimension $D$, consistent with the approach outlined in Section 6.7 regarding the use of minimal phenomenological models for tractability, we model the net PCE potential contribution per MPU, $V_{net}(G,{\psi},D)/N$, for a candidate gauge group $G=\prod_i G_i$ (a product of simple compact Lie groups and $U(1)$ factors) and its fermion content ${\psi}$. This contribution is a component of the global PCE potential $V(x)$ (Definition D.1). The terms included in this model are motivated by their fundamental role in the operation and consistency of a predictive network supporting gauge symmetries, as dictated by PCE:

**Definition G.8.1 (PCE Potential Model for the Gauge Sector in Dimension $D$).**
The net PCE potential contribution per MPU (a power term) is modeled as:

$$
\frac{V_{net}(G,\{\psi\},D)}{N}
=\frac{V_{\text{cost}}(G,\{\psi\},D)}{N}
-\frac{V_{\text{benefit}}(G,D)}{N}.
$$

where:

1.  **Predictive Benefit ($V_{benefit}$):** A richer gauge structure (more generators $n_G=\dim G$) allows for more sophisticated internal models of interaction and conservation laws, enhancing the network’s capacity to predict complex dynamics and form stable, diverse MPU aggregates. This increased predictive power translates to a higher aggregate Predictive Performance $PP_{agg}$, yielding a benefit term. We model this as directly proportional to $n_G$:

    $$
    \frac{V_{\text{benefit}}(G,D)}{N}=\eta_{ben}(D)\cdot n_G,
    \tag{G.8.1}
    $$

    where $\eta_{ben}(D)>0$ is a D‑dependent effective benefit coefficient (units of power) per generator, reflecting the marginal gain in predictive utility from an additional degree of internal symmetry. Although modeled as linear in $n_G$ for tractability, PCE generically induces diminishing returns at large $n_G$, weakening the effective coefficient near $n_{\max}$.

2.  **Total Cost ($V_{cost}$):** This comprises several dominant PCE‑relevant factors:

    *   **(a) Communication Cost for Coherence ($V_{comm}$):** Maintaining coherence for a gauge symmetry across the MPU network requires the reliable transmission of phase information (or its equivalent) for each of the $n_G$ generators. Each generator’s state must be tracked across MPU–MPU links. As established in Section G.8.2.2, this incurs a D‑independent information load of $\alpha_{load}$ (nats per link per cycle) per generator to achieve the necessary fidelity (low $p_{err}^*$). The cost of transmitting this total load $n_G\alpha_{load}$ is inversely proportional to the fundamental MPU channel capacity $C_{\max}$ (Theorem E.2), which is also D‑independent. Thus, the communication cost per MPU scales as:

        $$
        \frac{V_{\text{comm}}(G,D)}{N}
        =\lambda_c(D)\cdot\frac{n_G\,\alpha_{load}}{C_{\max}},
        \tag{G.8.2}
        $$

        where $\lambda_c(D)>0$ is a PCE‑derived D‑dependent cost coefficient (units of power) representing the physical resources per unit of information load handled by the network’s communication infrastructure.
    *   **(b) Gauge Field Energy Cost ($V_{field}$):** Gauge fields contribute to vacuum energy via zero‑point fluctuations. A minimal scaling model sets this proportional to the number of polarizations (hence $n_G$) and the quadratic Casimir of the adjoint, $k_G=C_2(\text{Adj})$ ($=N$ for $SU(N)$ and $=0$ for $U(1)$), reflecting self‑interaction strength. PCE penalizes excessive vacuum energy as non‑productive resource cost:

        $$
        \frac{V_{\text{field}}(G,D)}{N}
        =\lambda_f(D)\cdot n_G\,k_G,
        \tag{G.8.3}
        $$

        with $\lambda_f(D)>0$ a D‑dependent cost coefficient (power).
    *   **(c) Fermion Sector Cost ($V_{fermion}$):** Chiral fermions ${\psi}$ introduce complexity and resource costs. The minimal, anomaly‑free set and their gauge representations drive a complexity measure $C_{fermion}({\psi},D)=\sum_i w_i(D)\dim(R_i)$, with $R_i$ the representation of $\psi_i$ under $G$ and $w_i(D)$ dimensionless D‑dependent weights, interpretable as MDL‑coded description‑length penalties per representation (shorter code → lower cost). The associated power cost per MPU is

        $$
        \frac{V_{\text{fermion}}(G,\{\psi\},D)}{N}
        =\lambda_m(D)\cdot C_{fermion}(\{\psi\},D),
        \tag{G.8.4}
        $$

        with $\lambda_m(D)>0$ (power).

Combining these terms, the function to be minimized for a given $D$ is:

$$
\frac{V_{net}(G,\{\psi\},D)}{N}
=\left(\lambda_c(D)\frac{\alpha_{load}}{C_{\max}}-\eta_{ben}(D)\right)n_G
+\lambda_f(D)\,n_G\,k_G
+\lambda_m(D)\,C_{fermion}(\{\psi\},D).
\tag{G.8.5}
$$

PCE favors system parameters such that $\eta_{ben}(D)>\lambda_c(D)\alpha_{load}/C_{\max}$, making the coefficient of the linear $n_G$ term negative. This implies that, all else being equal, there is an incentive to increase the number of generators to gain predictive benefit, a trend limited by the capacity $n_{\max}$ (Eq. G.8.0) and the rising quadratic ($n_Gk_G$) and fermion costs.

### G.8.4 PCE Selection Criteria for Gauge Groups and Dimension

A triplet $(G,{\psi},D)$ is a stable, PCE‑optimal solution if it satisfies:

1.  **Anomaly Freedom:** $V_{\text{anom}}(G,{\psi},D)=0$.
2.  **Capacity Constraint:** $n_G\le n_{\max}$ (Eq. G.8.0, where $n_{\max}$ is D‑independent, derived from MPU properties).
3.  **Structural Stability:** $D$ must allow for the formation and persistence of stable, complex MPU aggregates capable of advanced prediction (Section G.8.2.4). This criterion strongly favors $D=4$.
4.  **Information Efficiency:** $D$ should optimize information‑theoretic and network efficiencies related to holography, propagation, and coherence (Section G.8.2.5). This criterion is hypothesized to further favor $D=4$.
5.  **Potential Minimization:** Among all triplets $(G,{\psi},D)$ satisfying (1)–(4), the optimal solution minimizes $V_{net}$ given by Eq. G.8.5.

### G.8.5 The Standard Model, Hypercharge, and Three Generations as a Unified PCE Optimum

The PU framework provides a robust, multi-layered argument for the co-selection of D=4 spacetime and the Standard Model gauge group with its specific fermion content and three-generation structure. This selection is a derived consequence of minimizing the global PCE potential under the standing principles of compression efficiency and predictive invariance.

1.  **Primacy of D=4 for Structural Stability and Information Efficiency:**
    As argued in Sections G.8.2.4 and G.8.2.5, D=4 is strongly and uniquely favored by PCE. It is the dimension that robustly supports stable, complex MPU aggregates (via inverse-square force structure) and favorable network information efficiency. These factors make D=4 the unique, stable dimensional arena for a complex, predictive universe.

2.  **Selection of $G_{SM}$, Hypercharge, and Three Generations within D=4:**
    Within the stable D=4 arena, PCE selects the optimal gauge group and matter content subject to capacity and consistency constraints.
    *   **Gauge group $G_{SM}$.** By the cost‑minimization principle under Conjecture G.M1 and the Local Module Hypothesis, the non‑abelian part is $SU(2)\times SU(3)$ acting in fundamentals; adding **exactly one** non‑trivial $U(1)$ factor is sufficient and cost‑minimal for SM‑like chiral content. The total generator count $n_G=12$ lies within the information‑capacity range (see §G.8.2).
    *   **Hypercharge Uniqueness (one chiral family, no $n^c$).** Let the left‑chiral hypercharges be $y_q,y_{u^c},y_{d^c},y_\ell,y_{e^c}$. Imposing cancellation of all local and mixed gauge and gravitational anomalies in $D=4$ yields the constraints:
        $$
        \begin{aligned}
        &SU(3)^2U(1):\quad 2y_q+y_{u^c}+y_{d^c}=0,\\
        &SU(2)^2U(1):\quad N_c y_q+y_\ell=0,\\
        &\text{grav}^2U(1):\quad 2N_c y_q+N_c y_{u^c}+N_c y_{d^c}+2y_\ell+y_{e^c}=0,\\
        &U(1)^3:\quad N_c(2y_q^3+y_{u^c}^3+y_{d^c}^3)+2y_\ell^3+y_{e^c}^3=0.
        \end{aligned}
        $$
        Treating $N_c$ as a variable, the anomaly constraints admit the family $y_\ell=-N_c y_q,\ y_{e^c}=2N_c y_q,\ y_{d^c}=(N_c-1)y_q,\ y_{u^c}=-(N_c+1)y_q$. Witten’s global $SU(2)$ anomaly enforces $N_c+1$ even $\Rightarrow N_c$ odd. PU’s capacity bound $n_G=(N_c^2-1)+3+1\le n_{\max}$ (Eq. G.8.0) implies $N_c^2\le 9$ for $n_{\max}=12$, so $N_c\le 3$. Because PU’s predictive-role taxonomy requires a confining non‑abelian sector to stabilize MPU aggregates, $N_c=1$ is excluded; hence with $N_c$ odd and $N_c\le 3$ we obtain **$N_c=3$**. With $N_c=3$, the PCE cost of the hypercharge configuration, modeled as being proportional to the sum of squared charges, $S \propto \sum_i n_i y_i^2$, is equal for both anomaly‑allowed branches. Choosing the conventional SM branch gives, up to an overall normalization/sign factor, the unique Standard Model hypercharge assignments:
        $$
        y_q=\tfrac{1}{6},\quad y_{u^c}=-\tfrac{2}{3},\quad y_{d^c}=\tfrac{1}{3},\quad y_\ell=-\tfrac{1}{2},\quad y_{e^c}=1.
        $$
        This solution is also consistent with the global $SU(2)$ anomaly (4 doublets/family). Furthermore, requiring gauge invariance of the renormalizable Yukawa interactions with a single Higgs doublet $H$,
        $$
         y_q+y_H+y_{u^c}=0,\qquad y_q-y_H+y_{d^c}=0,\qquad y_\ell-y_H+y_{e^c}=0,
          $$
       selects the same pattern of hypercharges. Among the equivalent overall normalizations, a PCE-favored tie-breaker of minimal denominator complexity sets the conventional scale $y_H=1/2$ and $y_q=1/6$.

    *   **PCE Corollary – Singlet Neutrality.** Assigning non‑zero hypercharge to a pure non‑abelian singlet increases PCE cost without predictive gain; the minimum sets the hypercharge of any potential sterile right-handed neutrino to zero.
    *   **Three Generations (Unique Minimizer).** Appendix R (Section R.3.5) shows—using PCE together with a standard MDL replication lemma—that (i) the smallest nontrivial anomaly-consistent family structure is $N=3$ with offsets $\{a,-a,0\}$, (ii) abelian “doping” is disfavored, and (iii) there exists a **non-empty open region** of PCE weights for which the global potential attains a **unique** minimum at exactly **three generations**.

3.  **Confluence and Co-selection:**
    D=4 provides the stable arena; within it, the SM gauge group with its uniquely determined chiral fermion content is PCE-efficient, and the family replication uniquely selected by PCE is $N=3$.
    
### G.8.6 Emergent Couplings and Masses

The specific numerical values of gauge couplings ($g_s,g_2,g_Y$) and fermion Yukawas are determined by the location and depth of the PCE minimum. Computing these from first principles requires evaluating the D-dependent coefficients in the PCE potential (Eq. G.8.5) from MPU microdynamics. The ratios between these couplings are further constrained by the PCE optimization, a topic explored in **Appendix W**, and a concrete, attractor-matched estimate for the fine-structure constant is provided in **Appendix Z** (with order‑unity matching fixed at the PCE capacity point).


## G.9 A Proposed Pathway Toward Deriving the Fine‑Structure Constant $\alpha_{em}$

This section develops the general formalism and computational program for deriving the electromagnetic fine-structure constant `α_em` from a rate-level PCE potential. The calculation balances the **power cost** of maintaining U(1) coherence against the **predictive information rate** benefit it provides. This general framework is further constrained by the alphabet identities derived in **Appendix W**. The complete, parameter-free derivation, which uses the framework's fundamental constants (`d₀`, `ε`) to fix the spectral inputs to this program and solve for `α_em` at the PCE-Attractor, is presented in **Appendix Z**.

*Units.* Natural units with $\hbar=c=\varepsilon_0=1$ (Heaviside–Lorentz/rationalized). Information is in **nats**. In these units

$$
\alpha_{em}=\frac{g_e^2}{4\pi}.
\tag{G.9.1}
$$

### G.9.1 Assumptions, Notation, and Symbols

**Assumptions.**

A1. *LAN regularity.* The one‑cycle FPL channel family $p_{g_e}$ is differentiable in quadratic mean at $g_e=0$; the induced stationary process is ergodic and $\beta$‑mixing with summable correlations; the **per‑event Fisher information operator** exists and is finite.

A2. *Mismatch energetics.* For small $g_e$, the free‑energy penalty for gauge‑invariant mismatch admits $\Delta\mathcal F_{\mathrm{mismatch}}(g_e)=\kappa_F g_e^2+O(g_e^4)$ with $\kappa_F>0$.

A3. *Coding overhead law.* To achieve per‑cycle logical error probability $p_L\ll1$, the minimal incremental **complexity** scales as
$\Delta C_{\mathrm{gauge}}(p_L)\sim K[\ln(1/p_L)]^\gamma$ with $\gamma\ge1$, $K>0$ (poly‑log reliability cost; capacity‑approaching codes).

A4. *Power–complexity convexity.* The power–complexity relation $R(C)$ is strictly convex near $C_0$ and admits
$R(C)=R(C_0)+r_p(C-C_0)^{\gamma_p}$ with $\gamma_p>1$, $r_p>0$.

A5. *POVM readout.* Each FPL cycle ends with a finite‑outcome POVM on $\mathcal H_0$ (dimension $d_0=8$).

A6. *Mode accounting.* The per‑event Fisher information operator $J$ at $g_e=0$ has $M$ nonzero eigenvalues ${\lambda_i}_{i=1}^M$ with trace $S_1\coloneqq\sum_i\lambda_i$, $1\le M\le d_0^2-1$.

**Table G.9.1. Symbols and units.**

| Symbol                      | Meaning                                                                    | Units          |
| --------------------------- | -------------------------------------------------------------------------- | -------------- |
| $g_e$                       | $U(1)$ coupling (electric charge)                                          | —              |
| $u$                         | $u\coloneqq g_e^2$                                                         | —              |
| $\alpha_{em}$               | $g_e^2/(4\pi)$                                                             | —              |
| $\tau,\ \nu$                | FPL cadence time $\tau$, event rate $\nu=1/\tau$                           | time,\ 1/time  |
| $\mu^*$                     | Operating (renormalization) scale $\mu^*=\kappa_\mu\nu$, $\kappa_\mu=O(1)$ | energy         |
| $C, C_0$                    | Predictive Physical Complexity (baseline $C_0$)                            | —              |
| $R(C)$                      | **Power** at complexity $C$                                                | energy/time    |
| $r_p,\ \gamma_p$            | Parameters of $R(C)$                                                       | energy/time, — |
| $\Gamma_0$                  | Power-conversion factor (rate-level)                                       | energy/time    |
| $P_{\mathrm{cost}}(g_e)$    | Operating power at coupling $g_e$                                          | energy/time    |
| $I_{\mathrm{rate}}(g_e)$    | Predictive‑information **rate**                                            | nats/time      |
| $V_{\mathrm{benefit}}(g_e)$ | Per‑event predictive benefit                                               | nats/event     |
| $p_L$                       | Logical mismatch probability per cycle                                     | —              |
| $\beta_{\mathrm{eff}}$      | Cadence‑scale inverse temperature                                          | 1/energy       |
| $\kappa_F$                  | Small‑deviation field‑mismatch scale                                       | energy         |
| $J$                         | Per‑event Fisher information operator at $g_e=0$                           | —              |
| ${\lambda_i}$               | Nonzero spectrum of $J$                                                    | —              |
| $S_1$                       | $\sum_i\lambda_i=\mathrm{Tr}\,J$ (spectral sum)                            | —              |
| $\gamma$                    | Coherence‑overhead complexity exponent ($\ge1$)                            | —              |
| $c_\gamma$                  | Gauge‑overhead coefficient $=K(\beta_{\mathrm{eff}}\kappa_F)^\gamma$       | —              |
| $\gamma_{\mathrm{eff}}$     | Effective cost exponent $=\gamma\gamma_p>1$                                | —              |
| $A_{\mathrm{PCE}}$          | Effective cost coefficient $=r_p c_\gamma^{\gamma_p}$                      | energy/time    |
| $d_0$                       | MPU alphabet size / Hilbert‑space dimension ($=2^{K_0}=8$)                 | —              |

*Mode counting.* We adopt the **complex‑mode** convention: per mode $\ln(1+\mathrm{SNR})$ nats/event. (A real‑mode convention with $\tfrac12\ln(1+\mathrm{SNR})$ per real scalar and doubled count yields the same total benefit if applied consistently.)

### G.9.2 Predictive Benefit from LAN Information Geometry

Let one FPL cycle with POVM readout induce a classical kernel $p_{g_e}(x_{t+1}|x_t,y_t)$. Define the score $s(z)=\partial_{g_e} \ln p_{g_e}(z)|_{g_e=0}$ with $\mathbb E_{p_0}[s]=0$. Under A1 (LAN), the one‑cycle log‑likelihood ratio admits the Gaussian tangent expansion. Diagonalizing the **per‑event** Fisher information operator $J$ yields $M$ independent complex Gaussian shift modes with eigenvalues ${\lambda_i}$. In the whitened basis (unit noise covariance per mode), the per‑mode small‑signal SNR is $\lambda_i u$ with $u=g_e^2$.

For a complex Gaussian mode, the **per‑event** mutual information is $\ln(1+\lambda_i u)$ nats. Summing over modes gives the per-event benefit:

$$
V_{\mathrm{benefit}}(g_e)=\sum_{i=1}^M \ln(1+\lambda_i u).
$$

The corresponding information **rate** is $I_{\mathrm{rate}}(g_e)=\nu\,V_{\mathrm{benefit}}(g_e)$.
\tag{G.9.2}

Equivalently, $V_{\mathrm{benefit}}(g_e)=\log\det(I+u\Lambda)$, with $\Lambda=\mathrm{diag}(\lambda_1,\dots,\lambda_M)$. Since $\ln(1+x)=x+O(x^2)$,
$\dfrac{d}{du}V_{\mathrm{benefit}}(u)\big|_{u=0}=S_1$ with $S_1=\sum_i\lambda_i$.

**Capacity cap (alphabet bound).** Because each cycle ends with a $d_0$‑outcome POVM, where $d_0=8$ is the MPU alphabet size (Theorem 23), the accessible classical information per event satisfies $\le H(\mathrm{output})\le \ln d_0$, hence:

$$
V_{\mathrm{benefit}}(g_e)\ \le\ \ln d_0\ (= \ln 8).
\tag{G.9.3}
$$

### G.9.3 Gauge‑Mismatch Tail, Coding Overhead, and Convex Power Cost

A cadence‑scale Gibbs–Donsker–Varadhan variational principle [Dembo & Zeitouni, 1998] implies the gauge‑invariant mismatch tail

$$
p_L(g_e)\ \le\ \exp\!\Big(-\beta_{\mathrm{eff}}\ \Delta\mathcal F_{\mathrm{mismatch}}(g_e)\Big),
\qquad
\Delta\mathcal F_{\mathrm{mismatch}}(g_e)=\kappa_F g_e^2+O(g_e^4).
\tag{G.9.4}
$$

Under A3, the minimal **incremental complexity** required to drive $p_L$ to the tail (achievable via exponential tilting compatible with ND–RID) scales as

$$
\Delta C_{\mathrm{gauge}}(g_e)\ \approx\ c_\gamma\,g_e^{2\gamma},
\qquad
c_\gamma\coloneqq K(\beta_{\mathrm{eff}}\kappa_F)^\gamma .
\tag{G.9.5}
$$

With A4, the **incremental power** cost is

$$
P_{\mathrm{cost}}(g_e)-R(C_0)=r_p\!\left(\Delta C_{\mathrm{gauge}}(g_e)\right)^{\gamma_p}
\ \approx\ A_{\mathrm{PCE}}\,g_e^{2\gamma_{\mathrm{eff}}}, 
\tag{G.9.6}
$$

where

$$
\gamma_{\mathrm{eff}}\coloneqq \gamma\gamma_p>1,
\qquad
A_{\mathrm{PCE}}\coloneqq r_p\,c_\gamma^{\gamma_p}>0.
\tag{G.9.7}
$$

### G.9.4 Rate‑Level PCE Potential and Equilibrium

Define the **rate‑level** PCE potential

$$
V_{\mathrm{PCE}}(g_e)\coloneqq P_{\mathrm{cost}}(g_e)-\Gamma_0\,V_{\mathrm{benefit}}(g_e).
\tag{G.9.8}
$$

With $u=g_e^2$ and dropping the additive constant $R(C_0)$, minimize

$$
\phi(u)\ \coloneqq\ A_{\mathrm{PCE}}\,u^{\gamma_{\mathrm{eff}}}
-\Gamma_0\sum_{i=1}^M \ln(1+\lambda_i u),
\qquad u\ge 0.
\tag{G.9.9}
$$

**Theorem G.9.1 (Strict convexity; unique emergence).**
If $\gamma_{\mathrm{eff}}>1$ and $A_{\mathrm{PCE}},\Gamma_0>0$, then $\phi$ is strictly convex on $(0,\infty)$ and $\displaystyle \lim_{u\to0^+}\phi'(u)=-\Gamma_0 S_1<0$ with $S_1=\sum_i\lambda_i$. Hence the non‑interacting point $u=0$ is unstable and there is a unique PCE‑optimal $u^*>0$.

*Proof.* $\phi'(u)=A_{\mathrm{PCE}}\gamma_{\mathrm{eff}}u^{\gamma_{\mathrm{eff}}-1}-\Gamma_0\sum_i\frac{\lambda_i}{1+\lambda_i u}$.
$\ \phi''(u)=A_{\mathrm{PCE}}\gamma_{\mathrm{eff}}(\gamma_{\mathrm{eff}}-1)u^{\gamma_{\mathrm{eff}}-2}+\Gamma_0\sum_i\frac{\lambda_i^2}{(1+\lambda_i u)^2}>0$ for $u>0$. $\square$

The equilibrium $u^*$ solves

$$
A_{\mathrm{PCE}}\gamma_{\mathrm{eff}}\,(u^*)^{\gamma_{\mathrm{eff}}-1}
=\Gamma_0\sum_{i=1}^M \frac{\lambda_i}{1+\lambda_i u^*}.
\tag{G.9.10}
$$

**Capacity‑aware upper bound.** By Schur‑concavity, $\sum_i\ln(1+\lambda_i u)$ is maximized at fixed $(S_1,M)$ by the flat spectrum $\lambda_i=S_1/M$. Imposing the cap (G.9.3) in that worst case yields the universal bound

$$
M\ln\!\Big(1+\tfrac{S_1}{M}u^*\Big)\ \le\ \ln d_0
\quad\Rightarrow\quad
u^*\ \le\ \frac{M}{S_1}\Big(d_0^{\,1/M}-1\Big).
\tag{G.9.11}
$$

If the unconstrained minimizer of (G.9.9) violates this inequality, the optimum lies on the boundary $V_{\mathrm{benefit}}(g_e)=\ln d_0$.

**Lemma (Active‑cap optimality).** Consider $\min_{u\ge 0}\ \phi(u)$ subject to $V_{\mathrm{benefit}}(u)\le \ln d_0$, where $\phi$ is given by (G.9.9) and $V_{\mathrm{benefit}}(u)=\sum_{i=1}^M\ln(1+\lambda_i u)$ (Section G.9.2). Then there exist multipliers $\eta,\mu\ge 0$ such that at any optimizer $u^{\cap}$,
$$
\phi'(u^{\cap})+\eta\,V'_{\mathrm{benefit}}(u^{\cap})-\mu=0,\quad
\eta\big(V_{\mathrm{benefit}}(u^{\cap})-\ln d_0\big)=0,\quad
\mu\,u^{\cap}=0.
$$
If the unconstrained minimizer $u^\circ$ of $\phi'(u)=0$ is infeasible, i.e. $V_{\mathrm{benefit}}(u^\circ)>\ln d_0$, then $\eta>0$ and the optimum satisfies $V_{\mathrm{benefit}}(u^{\cap})=\ln d_0$ (the capacity cap is active).

*Proof.* In one dimension the feasible set $\{u\ge 0:V_{\mathrm{benefit}}(u)\le \ln d_0\}$ is an interval. Since $\phi$ is strictly convex (Theorem G.9.1) and $V_{\mathrm{benefit}}$ is increasing and concave, this is a convex program and KKT conditions are necessary and sufficient. If $u^\circ$ violates the cap, complementary slackness forces $\eta>0$; with $V'_{\mathrm{benefit}}(u)>0$ and $u^{\cap}>0$, stationarity excludes $\mu>0$, hence $V_{\mathrm{benefit}}(u^{\cap})=\ln d_0$. $\square$

Using Lemma W.1–W.2 (Appendix W), the flat‑spectrum proxy yields the Jensen boundary $u^{\cap}\le \frac{M}{S_1}(d_0^{1/M}-1)$, i.e. (G.9.11).

**Special case (flat spectrum, minimal exponents).**
Let $\lambda_i=S_1/M$, $\gamma=1$, and $\gamma_p=2$ so that $\gamma_{\mathrm{eff}}=2$. Then (G.9.10) reduces to

$$
2A_{\mathrm{PCE}}\,u^*=\Gamma_0\,\frac{S_1}{1+\tfrac{S_1}{M}u^*},
\tag{G.9.12}
$$

with positive solution

$$
u^*=\frac{M}{2S_1}\!\left(\sqrt{\,1+\frac{2\,\Gamma_0\,S_1^2}{A_{\mathrm{PCE}}\,M}}\ -\ 1\right),
\qquad
\alpha_{em}(\mu^*)=\frac{u^*}{4\pi},\ \ \mu^*=\kappa_\mu\nu .
\tag{G.9.13}
$$

For large $\Gamma_0/A_{\mathrm{PCE}}$,

$$
u^*\ =\ \frac{\sqrt{M}}{2}\sqrt{\frac{2\,\Gamma_0}{A_{\mathrm{PCE}}}}\ -\ \frac{M}{2S_1}\ +\ O\!\left(\sqrt{\frac{A_{\mathrm{PCE}}}{\Gamma_0}}\right).
\tag{G.9.14}
$$

### G.9.5 Computational Program

1.  **Baseline ($g_e=0$).** Fix an admissible FPL on $\mathcal H_0$ ($d_0=8$), an ND–RID‑compatible noise model, and a strictly convex $R(C)$. Solve the baseline PCE to obtain $\Phi_0^*$, $C_0$, $\Gamma_0$, $\nu$, and the stationary kernel $p_0$.
2.  **Small‑$g_e$ response.** Specify the $U(1)$ deformation; compute the **per‑event** Fisher information operator $J$, its spectrum ${\lambda_i}$, and $S_1=\sum_i\lambda_i$.
3.  **Coherence overhead.** Choose any capacity-approaching code family (fixing $\gamma$); estimate $c_\gamma=K(\beta_{\mathrm{eff}}\kappa_F)^\gamma$; set $A_{\mathrm{PCE}}=r_p c_\gamma^{\gamma_p}$.
4.  **Equilibrium and cap.** Solve (G.9.10) for $u^*$ and verify the capacity bound (G.9.11); if violated, place the optimum on the boundary $V_{\mathrm{benefit}}=\ln d_0$.
5.  **RG matching.** Report $\alpha_{em}^{\overline{\mathrm{MS}}}(\mu^*)=u^*/(4\pi)$ (or specify the on‑shell scheme), with $\kappa_\mu=O(1)$ fixed by the cadence/clock‑rate mapping. Evolve to laboratory scales by standard QED running with threshold matching.

### G.9.6 Conclusion

Within PU, the electromagnetic coupling emerges as a **rate‑level PCE equilibrium** balancing the predictive benefit of $U(1)$ coherence against the power cost of maintaining it. Under LAN and strict convexity, the non‑interacting state $g_e=0$ is unstable and the unique optimum $u^*>0$ determines the bare coupling. As rigorously established in **Appendix X**, this rate-level potential and its minimization under the MPU alphabet capacity constraint are equivalent to finding the stationary point of the full QFT effective potential. The physical coupling is then $\alpha_{em}(\mu^*)=u^*/(4\pi\kappa)$, where the normalization $\kappa$ is determined by the emergent field theory (Appendix X.3). The inputs are operational functionals of the baseline PCE‑optimal FPL. As demonstrated in **Appendix Z**, the framework's foundational constants (`d₀=8`, `ε=ln 2`) are sufficient to fix these spectral inputs, leading to a complete, parameter-free calculation of `α_em` at the PCE-Attractor.

## G.10 Conclusion

This appendix (G) has demonstrated how the Predictive Universe framework, driven by the Prediction Optimization Problem (POP, Axiom 1) and the Principle of Compression Efficiency (PCE, Definition 15), provides potential pathways for deriving fundamental structures of modern physics:
1.  The Born probability rule (Theorem G.1.7) and the necessity of a complex Hilbert space (Theorem G.1.8) emerge from the requirement of consistent, optimal resource allocation in predictive tasks, directly linking quantum mechanical probability to PCE optimization principles.
2.  U(1) gauge theory (electromagnetism) emerges as the minimal PCE-optimal solution for maintaining predictive coherence across the MPU network despite the local phase freedom inherent in the complex Hilbert space description (Section G.7).
3.  A comprehensive argument (Section G.8) has been presented showing how the Standard Model gauge group $SU(3)\!\times\!SU(2)\!\times\!U(1)$ and the D=4 dimensionality of spacetime are co-selected as a unified PCE-optimal structure. This co-selection is driven by D=4's unique ability to support stable complex MPU aggregates and the Standard Model being a uniquely efficient and mathematically consistent (anomaly-free) solution within that dimensional arena. Crucially, **Appendix R** derives—via a standard MDL replication lemma—that for a **non-empty open region** of PCE weights the potential is **uniquely minimized** at exactly **three generations** of the SM fermion block.
4.  A rigorous, first-principles pathway for deriving the value of the fine-structure constant `α_em` has been established (**Section G.9**). The value emerges as the unique PCE-optimal equilibrium of a **rate-level potential**, balancing the thermodynamic **power cost** of maintaining U(1) coherence against the **predictive information rate** benefit it enables. This transforms the framework's principles into a complete computational program, reducing the calculation of a fundamental constant of nature to the evaluation of well-defined **operational functionals** of the MPU's baseline predictive cycle.

The analysis throughout this appendix highlights the potential for PU principles to provide a unified origin for the quantum measurement framework, the gauge structure of particle interactions, and even the dimensionality of spacetime, grounding these fundamental aspects of physics in the overarching logic and resource economics of prediction. The quantitative predictions for fundamental constants derived here are further constrained and supported by the general alphabet identities and bounds derived in **Appendix W**.

*¹* For $d=2$ the same probability functional is fixed either by
embedding the qubit in its naturally larger interaction Hilbert space
(e.g., within the MPU's $d_0 \ge 8$ space) or, if one prefers, by Deutsch’s decision-theoretic argument [Deutsch 1999] applied within a PCE framework. Both routes, when driven by POP–PCE consistency requirements for optimal resource allocation and consistent probability assignment, are expected to converge to the quadratic Born rule as the unique self-consistent measure; we primarily rely on the Gleason argument due to $d_0 \ge 8$.
