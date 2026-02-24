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
For any predictive partition by orthogonal projectors $\mathcal{P}=\{P_i\}$, we define the associated Cost Frame Function $f(\mathcal{P})$ as the contribution to the total PCE potential $V(x)$ associated with the existence of these potential outcome branches. The definition of the Cost Frame Function as $f(\mathcal{P}) = \sum_i f(P_i)$ (Equation G.1.1) is justified by the PCE imperative for efficient resource accounting. Here, $f(P_i)$ represents the effective conditional PCE Potential contribution $V(P_i)$ associated with the potential outcome branch $P_i$. Each $P_i$ in an orthogonal partition $\mathcal{P}$ represents a *mutually exclusive, physically distinct potential pathway* the system might actualize into.
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

**Lemma G.1.1ba (Additivity of $f$ over Orthogonal Sums).**
If $P = \sum_{j=1}^k Q_j$ where $\{Q_j\}$ are mutually orthogonal projectors, then the cost associated with the combined outcome $P$ must be the sum of the costs of the constituent exclusive outcomes $Q_j$:
$$
f\left(\sum_{j=1}^k Q_j\right) = \sum_{j=1}^k f(Q_j)
\quad \text{(G.1.2)}
$$
*Proof.* This follows directly from the definition of the Cost Frame Function (Equation G.1.1). Consider the partition $\mathcal{P}' = \{Q_1, Q_2, \dots, Q_k\}$ whose elements sum to $P$. By Equation (G.1.1), the cost associated with this partition considered as describing the (potentially coarser) outcome $P$ is $f(P) \equiv f(\mathcal{P}') = \sum_{j=1}^k f(Q_j)$. The argument implicitly assumes that if $P$ is resolved into orthogonal sub-components $\{Q_j\}$, the cost associated with "considering" $P$ is the sum of costs of "considering" its distinct sub-components. This reflects PCE's preference for consistent accounting: the resource implications of a composite possibility should reflect the sum of resource implications of its exclusive constituents. QED

**G.1.2 Non-contextuality Enforced by POP / PCE**

A crucial property mandated by the global optimization principles of POP and PCE is non-contextuality. The physical cost or resource implication associated with a specific potential outcome (represented by projector $P$) must depend only on the physical process corresponding to $P$ itself, and *not* on the particular set of alternative outcomes (the partition $\mathcal{P}$) considered alongside it.

**Lemma G.1.1b (Non-Contextuality from Dynamical Stability).**
Non-contextuality is a necessary condition for the stability and consistency of the PCE-driven adaptation dynamics. The dynamics are modeled as a stochastic gradient flow on the PCE Potential $V(x)$ (Appendix D, Equation D.8), which serves as a stochastic Lyapunov function for the system.
Assume, for contradiction, that the cost function is contextual, so that the cost associated with outcome $P$ depends on the partition $\mathcal{P}$ it is considered part of: $f(P|\mathcal{P})$. This would mean the potential itself depends on the choice of partition, $V(x, \mathcal{P})$. For a fixed physical configuration $x$, the potential could take different values $V(x, \mathcal{P}_1) \neq V(x, \mathcal{P}_2)$ depending on the system's internal conceptual framing.
This introduces a fatal ambiguity into the adaptation dynamics. The gradient $\nabla_x V$, which drives the system's evolution, would become ill-defined, depending on the arbitrary choice of partition $\mathcal{P}$ rather than solely on the objective physical configuration $x$. A potential function that is not a single-valued function of the physical state cannot serve as a proper Lyapunov function to guarantee concentration on stable physical equilibria (as established in Theorem D.5). For the PCE optimization process to be well-defined and dynamically stable, the potential $V$ must depend only on the physical configuration $x$. This mandates that the cost component $f(P)$ must be a function of the physical process associated with $P$ alone, and not the context of other considered possibilities. Therefore, non-contextuality is a prerequisite for a dynamically consistent optimization framework.

Therefore, $f(P)$ depends only on the projector $P$ itself.

**G.1.3 Gleason-type Result for the Cost Functional**


The cost function $f(P)$ defined on projectors $P$ on the MPU Hilbert space $\mathcal{H}$ (where $\dim(\mathcal{H}) = d_0 \ge 8$, Theorem 23) satisfies the necessary conditions for Gleason's Theorem:
1.  **Domain:** Defined on the set of orthogonal projectors $P$ on $\mathcal{H}$.
2.  **Non-negativity:** $f(P) = V(P) \ge 0$ (Definition G.1.1, as conditional potential $V(P)$ components like $V_{op}, V_{prop}$ are non-negative costs, and $V_{benefit}$ is bounded and subtracted appropriately such that the net functional represents effective cost/weight).
3.  **Additivity:** $f(\sum_j Q_j) = \sum_j f(Q_j)$ for any finite set of mutually orthogonal projectors $\{Q_j\}$ (Lemma G.1.1ba).
4.  **Non-contextuality:** $f(P)$ depends only on $P$ (Lemma G.1.1b).
5.  **Boundedness:** For any projector $P$, $f(P) \le f(\mathbf{1})$. The cost $f(\mathbf{1}) = V(\mathbf{1})$ represents the total potential contribution associated with resolving all possibilities (e.g., summing $f(P_i)$ over a complete basis $\{P_i\}$), which is assumed bounded for viable MPU configurations operating within the framework and its dynamic PCE optimization that inherently avoids unbounded costs (Assumption A1, A5 Appendix D relating to coercivity of $V(x)$ and confinement).

**Theorem G.1.3 (Quadratic Form from Cost Function).**
Let $\mathcal{H}$ be a complex Hilbert space with $\dim(\mathcal{H}) \ge 3$. Any function $f$ mapping orthogonal projectors $P$ on $\mathcal{H}$ to non-negative real numbers, satisfying additivity over orthogonal sums ($f(\sum_j Q_j) = \sum_j f(Q_j)$ for finite sums of orthogonal projectors) and boundedness ($0 \le f(P) \le M < \infty$ for some constant $M$), must be of the form:
$$
f(P) = \text{Tr}(\rho P)
\quad \text{(G.1.3)}
$$
for some unique positive semi-definite trace-class operator $\rho$ on $\mathcal{H}$.

*Proof.* This is a direct statement of Gleason's Theorem [Gleason 1957], as extended and understood in modern contexts (e.g., [Busch 2003] discusses the conditions for POVMs, implying coverage for projectors). The premises established above (non-negativity, additivity over finite orthogonal sums derived from Def G.1.1 via Lemma G.1.1ba and Lemma G.1.1b regarding PCE-optimal accounting, non-contextuality via Lemma G.1.1b, and boundedness from physical system constraints on $V(x)$) precisely match the conditions required by Gleason's theorem for projectors on a Hilbert space of dimension $\ge 3$. Since MPUs operate with $\dim(\mathcal{H}_0) = d_0 \ge 8$ (Theorem 23), the theorem applies directly. Therefore, the cost functional $f(P)$, dictated by POP/PCE principles applied to projective outcomes, must take the form $\text{Tr}(\rho P)$ for some unique positive semi-definite trace-class operator $\rho$. Uniqueness of $\rho$ follows from the properties of the trace functional and projectors. The full derivation of the Born rule from these principles is provided in **Theorem G.1.7**. QED

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
    *Justification:* This is a direct consequence of PCE. As argued in Lemma G.1.1b, any contextuality or non-additivity in the cost-accounting represents an inefficiency that increases the global PCE potential $V(x)$. PCE dynamics will therefore select for configurations where the internal accounting is maximally simple and consistent across all possible measurement types, enforcing additivity for POVMs.

    **Claim.** Let $f$ assign to each effect $E$ on $\mathbb C^2$ a number $f(E)\in[0,1]$ such that: (i) finite additivity on POVMs: for every finite POVM $\{E_i\}$ such that $\sum_i E_i = \mathbf{1}$, we have $\sum_i f(E_i)=f(\mathbf{1})$; (ii) $f$ is continuous in the operator norm; and (iii) normalization $f(\mathbf 1)=1$.Then there exists a unique density operator $\rho$ on $\mathbb C^2$ with $f(E)=\mathrm{tr}(\rho E)$ for all effects $E$.

    *Proof.* By the principle, $f$ is a bounded, positive, finitely additive functional on the effect algebra. For $E,F\ge 0$ with $E+F\le I$, embed $\{E,F,I-E-F\}$ into a POVM to get $f(E+F)=f(E)+f(F)$; by scaling, extend $f$ to all positive $T\le I$, then to the positive cone by homogeneity, to self-adjoints by Jordan decomposition, and to all of $\mathcal B(\mathbb C^2)$ by complex linearity (details as in Busch 2003). By the Riesz representation theorem there exists a unique $\rho\ge 0$, $\mathrm{tr}\,\rho=1$, such that $f(E)=\mathrm{tr}(\rho E)$ for all effects $E$. Specializing to projections $P$ recovers the Born weights $f(P)=\mathrm{tr}(\rho P)$. This closes the $d=2$ case. [Busch 2003; Caves et al. 2004] ∎

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
3.  **Why Complex Hilbert Space?:** The PCE imperative for efficiency selects the complex field $\mathbb{C}$ over real ($\mathbb{R}$) or quaternionic ($\mathbb{H}$) alternatives. While all can support vector space structures, the complex Hilbert space is uniquely efficient for the tasks required by POP.
   *   **Local Tomography & Information Cost:** A key measure of efficiency is the balance between the predictive power of the representation and the information cost (e.g., number of measurements) needed to determine a state (local tomography). The dimension of the state space (number of parameters) determines this cost. For the PCE-Attractor, the orbit dimension $\dim_{\mathbb{C}}(\text{Gr}(2,8)) = ab = 12$ equals the Golay code dimension $k$, providing independent geometric confirmation of the information-theoretic structure via the correspondence established in Theorem U.7a. For a $d$-dimensional system, this is $d^2-1$ for complex spaces, $(d(d+1)/2)-1$ for real spaces, and $(d(2d-1))-1$ for quaternionic spaces. While real spaces require fewer parameters, they lack the expressive power to efficiently model interference phenomena and the $U(1)$ phase crucial for emergent gauge theories (Section G.2). Complex Hilbert spaces provide the necessary structure efficiently, while quaternionic spaces are significantly less efficient (more parameters) without providing necessary additional predictive utility.
   *   **Symmetry, Dynamics, and Composition:** The complex structure provides the unique framework where the generators of continuous symmetries (Lie algebra) are naturally identified with the observables themselves (via Stone's theorem), simplifying the dynamics. Furthermore, the tensor product structure for composing subsystems is uniquely straightforward in complex Hilbert spaces, unlike real or quaternionic spaces where the local structure does not necessarily determine the global structure [Hardy 2001; Wootters 1990]. Crucially, the $U(1)$ phase freedom that gives rise to electromagnetism (Section G.7) is a natural feature of the complex structure.
   *   **PCE Selection:** A system based on $\mathbb{R}$ or $\mathbb{H}$ would incur higher information acquisition costs (more measurements for tomography) and/or higher complexity costs to represent the necessary dynamics compared to a system based on $\mathbb{C}$. PCE, by minimizing these costs within the potential $V(x)$, selects the complex Hilbert space as the most resource-efficient substrate for prediction.
4.  **Uniqueness & Optimality:** The combination of (a) Gleason's theorem (underpinned by POP/PCE cost consistency) selecting the trace-form for costs/probabilities, and (b) the GNS construction providing a unique Hilbert space representation for systems supporting such trace-form states, establishes that the complex Hilbert space structure is uniquely determined (up to isomorphism) as the necessary arena for the self-consistent, PCE-optimized predictive processing modeled by the PU framework. This also makes Proposition 4 (Emergence of Complex Hilbert Space) a derived theorem based on Theorem G.1.8

**Corollary G.1.9 (PCE Instability of Alternative Predictive Algebras).**
Any proposed alternative algebraic structure for prediction (e.g., classical probability on phase space, real or quaternionic Hilbert spaces, Jordan algebras, $L^p$ spaces with $p \neq 2$) would be unstable under PCE optimization compared to the complex Hilbert space structure.
*Proof.* Let $\mathfrak{A}$ denote a proposed predictive algebra (states, sharp outcomes, and composition rules) used by an MPU. For $\mathfrak{A}$ to be PCE-stable, the POP/PCE accounting of outcome branches must admit a nonnegative, finitely additive, non-contextual frame functional $f(P)$ on sharp outcomes (Definition G.1.1), because any contextual dependence introduces avoidable bookkeeping and is penalized by the PCE potential $V(x)$ (Lemma G.1.1b and Appendix D, Definition D.1). Under these premises and $\dim(\mathcal{H}_0)\ge 3$ (Theorem 23), Theorem G.1.7 enforces the trace-form rule for costs/probabilities,
$$
f(P)=\operatorname{Tr}(\rho_{phys}P),
\qquad
p(P)=\operatorname{Tr}(\rho_{phys}P),
$$
for all projectors $P$ in the operational theory.

Now take any alternative proposal $\mathfrak{A}_{alt}$:

- If $\mathfrak{A}_{alt}$ supports such a globally non-contextual additive frame functional and also supports efficient composition/local tomography as required by POP, then Theorem G.1.8 applies: the operational theory admits a (GNS) Hilbert representation and is, up to isomorphism of predictions and composition, the complex Hilbert-space theory. In this case there is no genuinely distinct alternative—PCE-stable realizations of $\mathfrak{A}_{alt}$ reproduce complex Hilbert behavior.

- If $\mathfrak{A}_{alt}$ fails to supply this structure naturally, then an MPU using it must either (i) accept reduced predictive performance $PP$ (lowering $V_{benefit}$), or (ii) impose extra constraints/hidden degrees/contextual correction rules to recover PU consistency. Case (ii) contributes a strictly positive excess cost, which appears as an effective structural penalty in the PCE potential:
$$
V(x)_{alt}=V(x)_{complex_H}+V_{penalty,struc},
$$
with $V_{penalty,struc}>0$ whenever $\mathfrak{A}_{alt}$ is genuinely inequivalent. Under the PCE adaptation dynamics (Appendix D, Equation D.8) and the long-run stochastic behavior characterized in Theorem D.5, configurations with strictly higher potential are disfavored in the low-noise stationary regime, and are outcompeted by those implementing the complex Hilbert-space structure.

The examples listed fall into this dichotomy:

1. **Classical phase space:** Classical probability is a simplex theory and is excluded already by Corollary G.1.10 (complementarity from SPAP). Any attempt to emulate complementarity requires extra hidden structure or contextuality, which increases $V_{penalty,struc}$.

2. **Real Hilbert spaces:** Although some quantum features persist, the local phase/gauge mechanism derived in Section G.2 (and summarized in Section G.7) is not naturally available without complexification (or an equivalent doubling/constraint construction), adding operational cost without improving $PP$.

3. **Quaternionic Hilbert spaces:** The non-commutative scalar field enlarges symmetry and state-parameter counts and complicates composition; absent demonstrable net benefit that lowers $V(x)$, PCE selects the complex subtheory and the unused extra structure contributes only positive $V_{penalty,struc}$.

4. **Jordan algebras and $L^p$ spaces with $p\neq 2$:** These frameworks do not, in general, provide a natural globally non-contextual additive frame functional compatible with the trace-form assignment demanded by Theorem G.1.7 across all physically realizable decompositions; enforcing that consistency again amounts to added constraints and hence added penalty.

Therefore the complex Hilbert-space structure is uniquely stable under PCE. QED

**Corollary G.1.10 (Non-Simplex State Space from SPAP).**
The self-referential structure of SPAP (Theorem 10, Theorem 11) logically excludes simplex state spaces, independent of efficiency considerations.

*Proof.*

**Step 1 (SPAP implies complementarity).** The Self-Referential Paradox of Accurate Prediction (Theorems 10, 11) establishes fundamental limitations on simultaneous prediction accuracy. By Definition 12, this constitutes Logical Indeterminacy—in-principle unpredictability arising from self-referential structure. Corollary 1 formalizes these limitations: any predictive system possessing Property R faces inherent constraints on predicting certain aspects of its future state. As established in Proposition 8, these limitations manifest as complementarity—the existence of observable pairs $(A, B)$ for which no state permits simultaneous perfect prediction of both.

**Step 2 (Simplex state spaces admit no complementary pairs).** In any finite-dimensional generalized probabilistic theory (GPT), a simplex state space corresponds to classical probability theory [Plavala 2021]. For a simplex with extreme points $\{v_1, \ldots, v_n\}$, any normalized state is a convex combination $\omega = \sum_i p_i v_i$ with $p_i \geq 0$, $\sum_i p_i = 1$. Sharp observables—those yielding definite outcomes, including the binary predictions $\phi \in \{0,1\}$ central to SPAP—are affine functionals determined by their values on vertices. For any two sharp observables $A, B$, each vertex $v_i$ yields definite outcomes $A(v_i)$ and $B(v_i)$. Both observables take simultaneously definite values at every extreme point, yielding $\Delta A = \Delta B = 0$ for pure states. Consequently, no complementary observable pairs can exist in simplex state spaces [Plavala 2016].


**Step 3 (Conclusion).** Step 1 establishes that SPAP-implementing systems necessarily possess complementary observable pairs. Step 2 establishes that simplex state spaces cannot support complementary pairs. Therefore, no SPAP-implementing system can have a simplex state space. ∎

*Remark G.1.10a: Logical Foundation.* This result derives from the Logical Necessity foundation of Property R (§A.0.2), which establishes computational richness from the structure of prediction itself, independent of physical implementation. The exclusion of simplex state spaces therefore follows from the logical structure of self-reference without invoking PCE optimization dynamics. The derivation chain is:
$$\text{SPAP} \xrightarrow{\text{Def 12}} \text{Logical Indeterminacy} \xrightarrow{\text{Cor 1, Prop 8}} \text{Complementarity} \xrightarrow{\text{Step 2}} \text{Non-simplex}$$
This establishes that non-classical state space structure is logically necessary for self-referential predictive systems. The PCE-based arguments (Theorems G.1.7, G.1.8) then determine the specific form (complex Hilbert space with Born rule) among non-classical alternatives.

*Remark G.1.10b: Connection to Hilbert Space Formalism.* Within the MPU Hilbert space $\mathcal{H}_0$ established by Theorem G.1.8, complementary observables necessarily satisfy $[\hat{A}, \hat{B}] \neq 0$ (Lemma 14.2a). The present result provides a logically prior exclusion of classical alternatives, while the efficiency-based derivations of Section G.1 determine the specific quantum structure among non-classical candidates.

**G.2 Local Phase Freedom and Emergence of Gauge Structure**

Having established the necessity of a complex Hilbert space $\mathcal{H}$ and the Born rule from PCE principles, we now derive the origin of gauge symmetries.

**Proposition G.M1 (SM gauge group from PCE cost minimization under the Local Module Hypothesis).**

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

**Note on irreducible competitors.** Competing **simple** groups acting irreducibly on $\mathbb C^5 \cong \mathbb C^2 \oplus \mathbb C^3$ (e.g., $SU(5)$) are disfavored by the cost (2.0 vs 1.5) and **ruled out** in PU by the **capacity bound** ($\dim SU(5)=24 > n_{\max}$, Equation G.8.0). Orthogonal/symplectic alternatives have real/pseudoreal fundamentals that obstruct the required **chirality**, providing a second, independent exclusion. ∎

For the simplest case of a single predictive field, the group of PCE-preserving automorphisms is $U(1)$. The physical predictions (probabilities $p_i$) derived from a state vector $|\Psi(x)\rangle$ depend only on the squared amplitudes. This implies an inherent redundancy: multiplying the state vector by a local phase factor leaves all local physical predictions unchanged:
$$
|\Psi(x)\rangle \longrightarrow |\Psi'(x)\rangle = e^{\,i q \theta(x)}|\Psi(x)\rangle
\quad (\theta(x)\in\mathbb{R})
\quad \text{(G.2.1)}
$$
Here, $q$ represents a "charge" associated with the field $\Psi$, indicating how it transforms under this phase rotation. This constitutes a local $U(1)$ gauge symmetry intrinsic to the description.

**G.3 The Predictive-Coherence Problem**

Effective prediction across the MPU network (required by POP, Axiom 1) necessitates comparing predictive states (amplitudes) at different spacetime points, say $x$ and $x+dx$. This comparison is essential for calculating gradients, predicting propagation, and maintaining coherent superposition across the network. However, the local gauge freedom (Equation G.2.1) obstructs simple comparison using the standard partial derivative $\partial_\mu$. If we transform $|\Psi(x)\rangle \to e^{iq\theta(x)}|\Psi(x)\rangle$, the derivative transforms as:
$$
\partial_{\mu}|\Psi(x)\rangle \longrightarrow \partial_{\mu}(e^{iq\theta(x)}|\Psi(x)\rangle) = e^{iq\theta(x)} \left( \partial_{\mu}|\Psi(x)\rangle + iq(\partial_{\mu}\theta(x))|\Psi(x)\rangle \right)
\quad \text{(G.2.2)}
$$
The derivative transforms inhomogeneously (acquiring the extra $iq(\partial_{\mu}\theta)|\Psi\rangle$ term), making the difference $\partial_{\mu}|\Psi(x)\rangle dx^\mu$ depend on the arbitrary local phase choices $\theta(x)$.

Maintaining predictive coherence by explicitly tracking all relative phases between the $N$ MPUs in a large aggregate would require managing $\mathcal{O}(N^2)$ relative phases. The propagation cost component of the PCE Potential, $V_{prop}$, would scale super-extensively as $\mathcal{O}(N^2)$, while the available resource budget and predictive benefits scale extensively as $\mathcal{O}(N)$. In contrast, introducing a local gauge field to manage coherence introduces a cost that scales with the number of field degrees of freedom, which is extensive, $\mathcal{O}(N)$. For any sufficiently large system ($N > N_{crit}$), the extensive cost of the gauge field solution is guaranteed to be lower than the super-extensive cost of explicit phase tracking. PCE, which minimizes the total potential $V(x)$, therefore necessarily selects the gauge field solution as the only viable and efficient mechanism for maintaining coherence in large MPU aggregates.

**G.4 Emergent Connection and Covariant Derivative**

PCE demands the most resource-efficient mechanism to enable reliable comparison of predictive states across spacetime points despite the local phase freedom. Introducing a connection $A$ with curvature $F=dA+A\wedge A$, the **unique** local, quadratic, second‑order, gauge‑invariant kinetic term is (up to an overall scale and total derivatives) [Yang & Mills 1954; Utiyama 1956]
$$
\mathcal L_{\mathrm{YM}}=\tfrac12\,\kappa\,\mathrm{Tr}(F_{\mu\nu}F^{\mu\nu}).
$$
Introducing a dynamical connection field $A_\mu(x)$ that transforms appropriately under the gauge transformation provides such a mechanism.

**Definition G.4.1 (Covariant Derivative $D_\mu$).**
A covariant derivative $D_\mu$ is defined to incorporate the connection $A_\mu$ such that $D_\mu \Psi$ transforms homogeneously (like $\Psi$) under the gauge transformation (Equation G.2.1). The emergent spacetime is curved (Section 11, Theorem 46), requiring incorporation of the geometric spin connection $\Omega_\mu$ (from Theorem 48) for fields with spin. For scalar fields (simplest case for illustration), $\Omega_\mu$ acts trivially. The covariant derivative is:
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
    *   **Result:** Covariant derivative $D_\mu$, connection $A_\mu$ transformation law (Equation G.4.2).

5.  **G.5: Field Dynamics**
    *   **Content:** Minimize field energy cost contribution to $V(x)$; form $\propto F^2$ is simplest gauge/Lorentz invariant.
    *   **POP / PCE Justification Principle Applied:** PCE favors simplest, stable dynamics for new field, minimizing unnecessary additions to $V(x)$.
    *   **Result:** Maxwell action $S_{\text{field}}$ (Equation G.5.3), source-free equations $\nabla_\mu F^{\mu\nu}=0$.

6.  **G.6: Matter Coupling**
    *   **Content:** Replace $\partial_{\mu} \to D_{\mu}$ in $\mathcal{L}_m$ to maintain gauge invariance for interaction.
    *   **POP / PCE Justification Principle Applied:** PCE favors minimal complexity additions to action, ensures maintained symmetries.
    *   **Result:** Minimal coupling interaction terms, sourced Maxwell Equations (Equation G.6.3).

The $U(1)$ gauge theory of electromagnetism emerges as the unique, most resource-efficient (PCE-optimal) structure necessitated by the requirement to maintain predictive coherence across the network in the face of the inherent local phase freedom of the emergent complex Hilbert space description.

## G.8 The Standard Model Gauge Group and Spacetime Dimension D=4 as a Unified PCE-Optimal Structure

### G.8.1 Introduction and Objective: Co-selection from First Principles

This section extends the logic of the Principle of Compression Efficiency (PCE, Definition 15) to argue for the emergence of the Standard Model (SM) gauge group, $G_{SM} = SU(3)\times SU(2)\times U(1)$ with its chiral fermion content, and the D=4 dimensionality of spacetime as a *unified, co-selected optimal structure*. Building upon the established emergence of a complex Hilbert space (Theorem G.1.8) and a $U(1)$ gauge symmetry (Section G.7) from POP/PCE, we argue that PCE, when applied to the selection of more complex non‑Abelian gauge structures and the dimensional arena for their operation, strongly favors the observed D=4 SM configuration.

The hypothesis is that neither the SM structure nor D=4 dimensionality are arbitrary empirical inputs but are necessary and robust consequences of the MPU network minimizing a global PCE potential. This potential, $V_{global}(G, {\psi}, D, \dots)$, is minimized over a vast configuration space where the gauge group $G$, its fermion content ${\psi}$, and the effective spacetime dimension $D$ are treated as co‑optimized variables. D=4 with the SM emerges as a unique “PCE sweet spot” because it simultaneously satisfies multiple, stringent, and dimension‑dependent criteria essential for a predictively viable, informationally efficient, and structurally complex universe (quantitatively reflected by the coefficients in Equation G.8.5).

We construct a physically motivated model for the PCE potential’s dependence on these properties and show that minimizing this potential, subject to fundamental constraints (MPU network information capacity, mathematical consistency via anomaly cancellation, and structural stability), strongly favors the D=4 SM configuration over conceivable alternatives.

### G.8.2 Foundational Principles for Co-selection

The selection of a stable gauge structure and its operational dimensionality is governed by the minimization of the global PCE potential $V(x)$ (Definition D.1), incorporating $D$ as a variable, subject to fundamental constraints.

#### G.8.2.1 The PCE Potential as the Master Functional

The MPU network evolves to minimize $V(x)$, representing the net resource cost rate. For the gauge sector and dimensionality, this potential accounts for:

*   **Predictive Benefit ($V_{benefit}$):** A gauge structure in an appropriate dimension provides benefits by enabling efficient management of predictive coherence and supporting the formation of complex MPU aggregates necessary for advanced prediction.
*   **Operational & Propagation Costs ($V_{op}, V_{prop}$):** Maintaining a gauge structure and specific network dimensionality incurs costs (gauge field energy, information load for coherence, network propagation costs, structural stability costs).
*   **Consistency Penalties ($V_{penalty}$):** Mathematically or physically inconsistent structures (e.g., anomalous gauge theories in a given $D$, unstable orbital dynamics in another $D$) incur effectively infinite penalties.

#### G.8.2.2 Information Capacity Constraint (D-Independent MPU Property)

The MPU network’s ability to support a complex gauge structure is fundamentally limited by the classical capacity $C_{\max} < \ln d_0$ of the underlying ND‑RID channels (Appendix E, Theorem E.2), where $d_0 \ge 8$ is the MPU Hilbert space dimension. This capacity $C_{\max}$ and the PCE‑optimal information rate $\alpha_{load}$ (in nats per link per cycle) are taken as fundamental MPU network properties. Specifically, $\alpha_{load}$ represents the D‑independent information rate (in nats per link per cycle) required to maintain the coherence of a single gauge generator’s state (e.g., reliably tracking its phase evolution) across an MPU–MPU link. This reliable tracking necessitates achieving the dynamically optimal low effective logical error rate $p_{err}^*$ derived from PCE principles (Appendix A.0, Theorem A.0.2). These parameters ($C_{\max}, \alpha_{load}, p_{err}^*$) are tied to the intrinsic $d_0$‑dimensional Hilbert space and ND‑RID logic of individual MPUs, which are pre‑geometric and thus independent of the emergent macroscopic dimension $D$. This imposes a D‑independent hard upper limit on the total number of gauge group generators $n_G$ that can be coherently supported.

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

#### G.8.2.2a Symplectic Structure of the QFI-Active Tangent Space

The channel capacity bound (Equation G.8.0) admits a complementary geometric derivation from the symplectic structure of the QFI-active tangent space at the PCE-Attractor.

**Definition G.8.2a (Interface Generator Basis).** For each pair $(\alpha, \beta)$ with $\alpha \in A = \{1, 2\}$ and $\beta \in B = \{3, \ldots, 8\}$, define the Hermitian interface generators:

$$
X_{\alpha\beta} := |\alpha\rangle\langle\beta| + |\beta\rangle\langle\alpha|, \quad Y_{\alpha\beta} := -i(|\alpha\rangle\langle\beta| - |\beta\rangle\langle\alpha|)
$$

The set $\{X_{\alpha\beta}, Y_{\alpha\beta}\}_{(\alpha,\beta) \in A \times B}$ comprises $2ab = 24$ generators spanning the QFI-active tangent space $T_{\rho_0}$ (Theorem Z.5).

**Corollary G.8.2.2b (Interface Algebra).** The interface generators span the real vector space:

$$\mathfrak{m} = \left\{ \begin{pmatrix} 0_{a \times a} & Z \\ Z^\dagger & 0_{b \times b} \end{pmatrix} : Z \in \mathbb{C}^{a \times b} \right\}$$

with $\dim_{\mathbb{R}}(\mathfrak{m}) = 2ab = 24$. This is the off-diagonal block structure coupling active and inactive subspaces.

*Remark: Basis Independence.* The labeling $A = \{1, 2\}$, $B = \{3, \ldots, 8\}$ represents a choice of eigenbasis for $\rho_0$. By Proposition Z.1, any two choices of $a = 2$ dimensional active subspace are related by a unitary $U \in SU(8)$, and the symplectic structure derived below is invariant under this equivalence.


**Definition G.8.2b (Symplectic Incompatibility Form).** The natural symplectic form on $T_{\rho_0}$ induced by quantum incompatibility is:

$$
\omega(H_1, H_2) := -i \, \mathrm{Tr}[\rho_0 [H_1, H_2]]
$$

This form quantifies the obstruction to simultaneous optimal estimation of parameters along directions $H_1$ and $H_2$ (Matsumoto 2002; Ragy et al. 2016). Non-degeneracy on the interface subspace follows from the uniform QFI eigenvalue $\lambda = 1$ (Theorem Z.5, Step 5).

**Lemma G.8.2c (Canonical Symplectic Decomposition).** Direct calculation yields $\omega(X_{\alpha\beta}, Y_{\alpha\beta}) = 1$ for each pair $(\alpha, \beta)$, with all other pairings vanishing. Hence $T_{\rho_0}$ decomposes into $ab = 12$ canonical symplectic 2-planes:

$$
T_{\rho_0} = \bigoplus_{(\alpha,\beta) \in A \times B} \mathrm{span}(X_{\alpha\beta}, Y_{\alpha\beta})
$$

*Proof.* The commutator is $[X_{\alpha\beta}, Y_{\alpha\beta}] = 2i(|\alpha\rangle\langle\alpha| - |\beta\rangle\langle\beta|)$. Evaluating: $\omega(X_{\alpha\beta}, Y_{\alpha\beta}) = -i \cdot \mathrm{Tr}[\rho_0 \cdot 2i(|\alpha\rangle\langle\alpha| - |\beta\rangle\langle\beta|)] = 2(p_\alpha - p_\beta) = 2(\tfrac{1}{2} - 0) = 1$. For distinct pairs, the commutator lies in the AA $\oplus$ BB block where $\mathrm{Tr}[\rho_0[\cdots]] = 0$. ∎

**Definition G.8.2d ($\omega$-Isotropic Subspace).** A subspace $L \subseteq T_{\rho_0}$ is $\omega$-isotropic if $\omega(v, w) = 0$ for all $v, w \in L$. A maximal $\omega$-isotropic subspace (Lagrangian) has $\dim(L) = \dim(T_{\rho_0})/2 = 12$.

**Theorem G.8.2e (Geometric Bound on Jointly Estimable Generators).** The maximum number of gauge generators supporting joint optimal parameter estimation equals the Lagrangian dimension:

$$
n_G^{(\mathrm{geom})} = ab = 12
$$

*Proof.* A maximal $\omega$-isotropic subspace is obtained by selecting exactly one generator from each symplectic 2-plane (either $X_{\alpha\beta}$ or $Y_{\alpha\beta}$, but not both), giving $\dim(L_{\max}) = 12$. Any subspace of dimension $> 12$ must contain at least one complete 2-plane, which has $\omega(X_{\alpha\beta}, Y_{\alpha\beta}) = 1 \neq 0$, violating isotropy. ∎

**Corollary G.8.2f (Consistency with Channel Capacity).** The geometric bound $n_G^{(\mathrm{geom})} = 12$ refines the channel capacity range $n_{\max} \approx 7.5$–$20$ (Equation G.8.0) by providing a sharp upper constraint from symplectic geometry. The Standard Model gauge algebra $\mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak{u}(1)$ with $\dim = 8 + 3 + 1 = 12$ saturates the geometric bound.

**Remark G.8.2g: Connection to Golay Structure.** The Lagrangian dimension $ab = 12$ equals the Golay code dimension $k = M/2 = 12$ (Theorem Z.13). This correspondence reflects structural unity: both the symplectic geometry (joint estimability) and the error-correction structure (optimal redundancy) select the same 12-dimensional subspace of the 24-dimensional interface. Gauge generators failing joint estimability incur additional PCE costs from incompatibility-induced measurement trade-offs, manifesting as increased operational cost $V_{\mathrm{op}}$ due to the necessity of sequential rather than simultaneous optimal estimation.

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
*   A universe unable to form stable complex structures incurs a catastrophic loss of $V_{benefit}$ (as these structures are the primary engines of advanced prediction) and is thus strongly disfavored by PCE. It is a core hypothesis of this co‑selection argument that PCE robustly translates these D‑sensitive stability issues into highly unfavorable D‑dependent coefficients within the PCE potential model (Equation G.8.5), for instance, by yielding a significantly lower benefit coefficient $\eta_{ben}(D)$ or imposing high effective penalty terms for dimensions $D\neq 4$ that fail to support such stable complexity.

#### G.8.2.5 Information‑Theoretic and Network Efficiency (D‑Sensitive)

The MPU network’s efficiency under PCE depends on D‑sensitive information‑theoretic properties.

*   **Holographic Efficiency:** The horizon‑entropy area law $S=\mathcal A/(4G)$ holds in the emergent D=4 spacetime. The efficiency of bulk–boundary information encoding (related to how much complexity $C_P$ can be supported within a volume relative to its boundary information capacity) may be optimal in D=4. Other dimensions might lead to less favorable scaling or consistency issues between bulk degrees of freedom and boundary information limits.
*   **Network Propagation and Coherence ($V_{prop}$):** Costs of information propagation, maintaining coherence, and error correction (achieving $p_{err}^*$ in App. A.0) are D‑sensitive. For instance, the nature of random walks (fundamental to information diffusion and error propagation) changes qualitatively: they are recurrent in $D_{\text{space}}\le 2$ but transient in $D_{\text{space}}\ge 3$. D=4 ($D_{\text{space}}=3$) may offer an optimal trade‑off between network connectivity, path‑length scaling, and the stability of information propagation against noise for achieving robust, large‑scale predictive coherence. It is further hypothesized that PCE favors dimensions where these D‑sensitive network efficiencies (which would contribute to minimizing cost coefficients like $\lambda_c(D)$ or maximizing benefit coefficients like effective $\eta_{ben}(D)$ in Equation G.8.5) are optimized, with D=4 emerging as a strong candidate under such comprehensive optimization.

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

PCE favors system parameters such that $\eta_{ben}(D)>\lambda_c(D)\alpha_{load}/C_{\max}$, making the coefficient of the linear $n_G$ term negative. This implies that, all else being equal, there is an incentive to increase the number of generators to gain predictive benefit, a trend limited by the capacity $n_{\max}$ (Equation G.8.0) and the rising quadratic ($n_Gk_G$) and fermion costs.

### G.8.4 PCE Selection Criteria for Gauge Groups and Dimension

The search space is the set of compact, reductive gauge algebras acting faithfully on the inactive subspace $\mathcal{B} = \mathbb{C}^6$.

A triplet $(G,{\psi},D)$ is a stable, PCE‑optimal solution if it satisfies:

1.  **Anomaly Freedom:** $V_{\text{anom}}(G,{\psi},D)=0$.
2.  **Capacity Constraint:** $n_G \leq n_{\max}$. The channel capacity estimate (Equation G.8.0) yields the range $n_{\max} \approx 7.5$–$20$. The geometric bound from the Lagrangian dimension of the QFI symplectic structure (Theorem G.8.2e) yields $n_G \leq ab = 12$. This bound equals the complex dimension of the attractor orbit: $\dim_{\mathbb{C}}(\text{Gr}(2,8)) = ab = 12$, providing a geometric interpretation of the gauge dimension constraint. Since $12$ lies within the channel capacity range, the geometric bound provides the sharp constraint $n_G \leq 12$. This value equals both the Golay code dimension $k = 12$ (Theorem Z.13) and the complex dimension of the attractor orbit $\dim_{\mathbb{C}}(\text{Gr}(2,8)) = ab = 12$ (Theorem Z.6.3a). The triple coincidence—channel capacity bound, code dimension, and orbit dimension—provides strong evidence for the structural uniqueness of the gauge sector. The convergence of channel capacity, symplectic geometry, and error-correction theory at the value 12 constitutes a non-trivial consistency check on the framework.
    
    The bound $n_G \leq 12$ traces to two foundational parameters through the derivation chain:
    $$\text{SPAP} \xrightarrow{\text{Thm 31}} \varepsilon = \ln 2 \xrightarrow{\text{Thm Z.1}} a = 2 \xrightarrow{d_0 = 8} b = d_0 - a = 6 \xrightarrow{} ab = 12$$
    where $d_0 = 8$ is the minimal Hilbert space dimension for on-cycle injectivity of self-referential logic (Theorem 23, Lemma Z.1) and $\varepsilon = \ln 2$ is the SPAP entropy cost from the 2-to-1 state merge (Theorem 31, Appendix J).

3.  **Structural Stability:** $D$ must allow for the formation and persistence of stable, complex MPU aggregates capable of advanced prediction (Section G.8.2.4). This criterion strongly favors $D=4$.
4.  **Information Efficiency:** $D$ should optimize information‑theoretic and network efficiencies related to holography, propagation, and coherence (Section G.8.2.5). This criterion is hypothesized to further favor $D=4$.
5.  **Potential Minimization:** Among all triplets $(G,{\psi},D)$ satisfying (1)–(4), the optimal solution minimizes $V_{net}$ given by Equation G.8.5.

### G.8.4a Gauge Algebra via Exhaustive Partition Analysis

This section derives the Standard Model gauge algebra via exhaustive classification of module decompositions, providing complementary verification of the cost-minimization approach in Proposition G.M1. The inactive subspace $\mathcal{B} = \mathbb{C}^b$ with $b = d_0 - a = 8 - 2 = 6$ (where $a = 2$ follows from Theorem Z.1) carries the gauge representation. The derivation proceeds through three stages: exclusion of simple groups, enumeration of viable partitions, and unique selection by physical constraints.

**Theorem G.8.4a (No Simple 12-Dimensional Gauge Algebra).**
No complex simple Lie algebra has dimension $12$. In particular, any gauge algebra saturating the Lagrangian capacity bound $n_G = 12$ (Theorem G.8.2e) is necessarily non-simple: its semisimple part $[\mathfrak{g},\mathfrak{g}]$ contains at least two simple factors.

*Proof.*

**Step 1 (Classification of simple Lie algebra dimensions).** The dimensions of simple Lie algebras over $\mathbb{C}$ are given by standard formulas. For the classical families:

| Family | Dimension Formula | Values for small rank |
|:-------|:------------------|:----------------------|
| $\mathfrak{su}(n)$, $n \geq 2$ | $n^2 - 1$ | 3, 8, 15, 24, 35, ... |
| $\mathfrak{so}(n)$, $n \geq 5$ | $n(n-1)/2$ | 10, 15, 21, 28, ... |
| $\mathfrak{sp}(2n)$, $n \geq 1$ | $n(2n+1)$ | 3, 10, 21, 36, ... |

For the exceptional algebras:
$$
\dim(\mathfrak{g}_2) = 14,\quad
\dim(\mathfrak{f}_4) = 52,\quad
\dim(\mathfrak{e}_6) = 78,\quad
\dim(\mathfrak{e}_7) = 133,\quad
\dim(\mathfrak{e}_8) = 248.
$$

We now verify explicitly that $12$ does not occur in this list.

For $\mathfrak{su}(n)$:
$$
n^2 - 1 = 12 \;\Longrightarrow\; n^2 = 13
$$
which has no integer solution.

For $\mathfrak{so}(n)$:
$$
\frac{n(n-1)}{2} = 12 \;\Longrightarrow\; n(n-1) = 24 \;\Longrightarrow\; n^2 - n - 24 = 0
$$
The discriminant is $\Delta = 1 + 96 = 97$, which is not a perfect square, so there is no integer solution.

For $\mathfrak{sp}(2n)$:
$$
n(2n+1) = 12 \;\Longrightarrow\; 2n^2 + n - 12 = 0
$$
The discriminant is $\Delta = 1 + 96 = 97$, not a perfect square, so there is no integer solution.

The exceptional dimensions listed above do not include $12$. Therefore no simple complex Lie algebra has dimension $12$.

**Step 2 (Exclusion of simple 12-dimensional candidates).** Suppose for contradiction that a simple complex Lie algebra $\mathfrak{g}$ satisfies $\dim \mathfrak{g} = 12$. By the classification of simple Lie algebras, $\mathfrak{g}$ must belong either to one of the classical families or to the exceptional list. Step 1 shows that no such algebra has dimension $12$, yielding a contradiction.

**Step 3 (Implication for capacity-saturating gauge algebras).** If a gauge algebra $\mathfrak{g}$ saturates the Lagrangian capacity bound $n_G = 12$ (Theorem G.8.2e), then $\dim \mathfrak{g} = 12$. By Step 2, $\mathfrak{g}$ cannot be simple. Therefore its semisimple part $[\mathfrak{g},\mathfrak{g}]$ must be a direct sum of at least two simple Lie algebras. In particular, any simple unification candidate with $\dim \mathfrak{g} > 12$ (such as $SU(5)$, $SO(10)$, or $E_6$ with dimensions $24$, $45$, and $78$ respectively) is excluded outright by the bound $n_G \leq 12$. ∎

**Theorem G.8.4b (Unique Module Decomposition).**
Let $\mathfrak{g}$ be a reductive Lie algebra of dimension at most 12 acting faithfully on $\mathcal{B} = \mathbb{C}^6$. If $\mathfrak{g}$ supports chiral fermion representations and anomaly-free matter content, then the unique module decomposition is:
$$
\mathcal{B} = \mathbb{C}^3 \oplus \mathbb{C}^2 \oplus \mathbb{C}^1
$$
and $\mathfrak{g} = \mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak{u}(1)$ with $\dim(\mathfrak{g}) = 12$.

*Proof.*

**Step 1 (Reductivity from compactness).** The gauge group $G$ acting on the MPU Hilbert space is compact (Appendix G, Sections G.1–G.3). By standard structure theory of compact Lie groups, its complexified Lie algebra $\mathfrak{g}$ is reductive:
$$
\mathfrak{g} = \mathfrak{z}(\mathfrak{g}) \oplus [\mathfrak{g},\mathfrak{g}]
$$
where $\mathfrak{z}(\mathfrak{g})$ is the center (abelian) and $[\mathfrak{g},\mathfrak{g}]$ is semisimple. For representations of reductive Lie algebras, every finite-dimensional complex representation is completely reducible. Hence the faithful action of $\mathfrak{g}$ on the inactive subspace $\mathcal{B} = \mathbb{C}^6$ decomposes as a direct sum of irreducible $\mathfrak{g}$-modules:
$$
\mathcal{B} \cong \mathbb{C}^{n_1} \oplus \cdots \oplus \mathbb{C}^{n_r}
$$
with each $\mathbb{C}^{n_i}$ an irreducible $\mathfrak{g}$-module. We refer to $(n_1,\ldots,n_r)$ as the module dimension partition of $\mathcal{B}$.

**Step 2 (Partition enumeration).** The module dimensions $(n_1, \ldots, n_r)$ partition $b = 6$. The eleven unordered partitions of 6, together with the maximal faithful algebra for each partition (taking $\mathfrak{u}(n) = \mathfrak{su}(n) \oplus \mathfrak{u}(1)$ with $\dim(\mathfrak{u}(n)) = n^2$), are:

| Partition | Maximal Faithful Algebra | $\dim$ | 
|:---------:|:-------------------------|:------:|
| $(6)$ | $\mathfrak{u}(6)$ | 36 |
| $(5,1)$ | $\mathfrak{u}(5) \oplus \mathfrak{u}(1)$ | 26 |
| $(4,2)$ | $\mathfrak{u}(4) \oplus \mathfrak{u}(2)$ | 20 |
| $(4,1,1)$ | $\mathfrak{u}(4) \oplus \mathfrak{u}(1)^2$ | 18 |
| $(3,3)$ | $\mathfrak{u}(3)^2$ | 18 |
| $(3,2,1)$ | $\mathfrak{u}(3) \oplus \mathfrak{u}(2) \oplus \mathfrak{u}(1)$ | 14 |
| $(3,1,1,1)$ | $\mathfrak{u}(3) \oplus \mathfrak{u}(1)^3$ | 12 |
| $(2,2,2)$ | $\mathfrak{u}(2)^3$ | 12 |
| $(2,2,1,1)$ | $\mathfrak{u}(2)^2 \oplus \mathfrak{u}(1)^2$ | 10 |
| $(2,1,1,1,1)$ | $\mathfrak{u}(2) \oplus \mathfrak{u}(1)^4$ | 8 |
| $(1^6)$ | $\mathfrak{u}(1)^6$ | 6 |

**Step 3 (Capacity bound filter).** The constraint $n_G \leq 12$ (Theorem G.8.2e) eliminates partitions whose maximal faithful algebra exceeds 12:

- $(6)$: $\dim = 36 > 12$. Eliminated.
- $(5,1)$: $\dim = 26 > 12$. Eliminated.
- $(4,2)$: $\dim = 20 > 12$. Eliminated.
- $(4,1,1)$: $\dim = 18 > 12$. Eliminated.
- $(3,3)$: $\dim = 18 > 12$. Eliminated.
- $(3,2,1)$: $\dim = 14 > 12$. Requires subalgebra analysis (Step 7).

Remaining candidates with maximal $\dim \leq 12$: $(3,1,1,1)$, $(2,2,2)$, $(2,2,1,1)$, $(2,1,1,1,1)$, $(1^6)$.

**Step 4 (Coherence-compression saturation filter).** From Equation G.8.1, the predictive benefit satisfies $V_{\text{benefit}} \propto \eta_{\text{ben}}(D) \cdot n_G$, creating an incentive to maximize the generator count up to the capacity bound. This follows from the PCE potential structure (Equation G.8.5): when $\eta_{\text{ben}}(D) > \lambda_c(D)\alpha_{\text{load}}/C_{\max}$, the coefficient of the linear $n_G$ term in $V_{\text{net}}$ is negative, favoring larger $n_G$. PCE optimization therefore selects algebras achieving $n_G = 12$ when this is attainable, provided the PCE potential structure satisfies this condition. Partitions with maximal dimension strictly less than 12 are PCE-suboptimal under this condition:

- $(2,2,1,1)$: $\dim_{\max} = 10 < 12$. Eliminated.
- $(2,1,1,1,1)$: $\dim_{\max} = 8 < 12$. Eliminated.
- $(1^6)$: $\dim_{\max} = 6 < 12$. Eliminated.

Remaining candidates: $(3,1,1,1)$, $(2,2,2)$, and $(3,2,1)$ (pending subalgebra analysis).

**Step 5 (Chirality filter).** Chiral fermions require complex representations inequivalent to their conjugates. For $SU(2)$, the fundamental representation $\mathbf{2}$ is pseudoreal: if $\psi$ transforms as $\psi \to U\psi$ for $U \in SU(2)$, then $\epsilon \psi^*$ (where $\epsilon = i\sigma_2$ is the antisymmetric tensor) transforms identically, establishing $\mathbf{2} \cong \bar{\mathbf{2}}$. All irreducible representations of $SU(2)$ are either real (integer spin) or pseudoreal (half-integer spin).

For partition $(2,2,2)$, the maximal semisimple subalgebra is $\mathfrak{su}(2)^3$, acting on three copies of $\mathbb{C}^2$. Each $\mathbb{C}^2$ carries the pseudoreal fundamental. All representations of $SU(2)^3$ are self-conjugate, precluding chiral matter. Partition $(2,2,2)$ is eliminated.

Remaining candidates: $(3,1,1,1)$ and $(3,2,1)$.

**Step 6 (Anomaly filter on $(3,1,1,1)$).** For partition $(3,1,1,1)$, the maximal algebra is $\mathfrak{u}(3) \oplus \mathfrak{u}(1)^3$ with $\dim = 9 + 3 = 12$. Although this partition satisfies the capacity bound and coherence-compression saturation, it fails the anomaly constraints.

Consider the $[SU(3)]^2 \times U(1)_i$ anomaly for each $U(1)_i$ factor. The anomaly coefficient is:
$$
\mathcal{A}_i = \sum_{\text{left-chiral}} Y_i \cdot T(R) - \sum_{\text{right-chiral}} Y_i \cdot T(R)
$$
where $T(R)$ is the Dynkin index of representation $R$ (with $T(\mathbf{3}) = 1/2$). The single $\mathbb{C}^3$ module transforms as the fundamental $\mathbf{3}$ of $SU(3)$. For anomaly cancellation $\mathcal{A}_i = 0$, either:
(a) The $\mathbf{3}$ is vector-like (equal left and right chiralities), eliminating chiral fermions, or
(b) $Y_i^{(\mathbf{3})} = 0$ for all $i$.

Option (b) renders all $U(1)$ factors trivial on the color sector. Standard Model phenomenology requires hypercharge to couple non-trivially to quarks ($Y_q \neq 0$). This requirement follows from the observed electric charges of quarks: $Q = T_3 + Y/2$ with $Q(u) = +2/3$ and $Q(d) = -1/3$ necessitates nonzero $Y_q$. Partition $(3,1,1,1)$ cannot support anomaly-free chiral matter with appropriate abelian-color coupling. Eliminated.

Remaining candidate: $(3,2,1)$.

**Step 7 (Subalgebra analysis of $(3,2,1)$).** The maximal faithful algebra for $(3,2,1)$ is $\mathfrak{u}(3) \oplus \mathfrak{u}(2) \oplus \mathfrak{u}(1)$ with $\dim = 9 + 4 + 1 = 14 > 12$. We seek a 12-dimensional subalgebra acting faithfully.

Decompose:
$$
\mathfrak{u}(3) = \mathfrak{su}(3) \oplus \mathfrak{u}(1)_3, \quad \mathfrak{u}(2) = \mathfrak{su}(2) \oplus \mathfrak{u}(1)_2
$$
The three $\mathfrak{u}(1)$ factors $(\mathfrak{u}(1)_3, \mathfrak{u}(1)_2, \mathfrak{u}(1)_1)$ span a 3-dimensional abelian subalgebra. To achieve $\dim(\mathfrak{g}) = 12$, we must reduce by 2 dimensions, leaving exactly one $\mathfrak{u}(1)$ factor.

The anomaly cancellation conditions for Standard Model fermion content with $N_c = 3$ colors require (cf. Section G.8.5):
$$
[SU(3)]^2 U(1): \quad 2y_q + y_{u^c} + y_{d^c} = 0
$$
$$
[SU(2)]^2 U(1): \quad 3y_q + y_\ell = 0
$$
These constraints, together with gravitational anomaly cancellation, fix the relative $U(1)$ charges up to an overall normalization. The solution is unique: a single linear combination $U(1)_Y$ (hypercharge) survives as the physical abelian factor. The orthogonal combinations are either anomalous or decouple. Therefore exactly one physical $U(1)$ remains:
$$
\mathfrak{g} = \mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak{u}(1)_Y
$$
with $\dim = 8 + 3 + 1 = 12$.

**Step 8 (Faithfulness verification).** The algebra $\mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak{u}(1)_Y$ acts on $\mathcal{B} = \mathbb{C}^3 \oplus \mathbb{C}^2 \oplus \mathbb{C}^1$ as follows:
- $\mathfrak{su}(3)$ acts faithfully on $\mathbb{C}^3$ via the fundamental representation, trivially on $\mathbb{C}^2 \oplus \mathbb{C}^1$.
- $\mathfrak{su}(2)$ acts faithfully on $\mathbb{C}^2$ via the fundamental representation, trivially on $\mathbb{C}^3 \oplus \mathbb{C}^1$.
- $\mathfrak{u}(1)_Y$ acts with eigenvalues determined by hypercharge assignments on each summand.

For the combined action to be faithful, no nonzero element of $\mathfrak{g}$ can annihilate all of $\mathcal{B}$. Since each simple factor acts faithfully on its designated module, and $U(1)_Y$ distinguishes the summands via distinct hypercharge values (as fixed by anomaly cancellation in Step 7), the combined action is faithful. ∎

**Corollary G.8.4c (Standard Model Gauge Algebra Uniqueness).**
The gauge algebra $\mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak{u}(1)$ is the unique Lie algebra of dimension at most 12 acting faithfully on $\mathbb{C}^6$ that satisfies: (i) the Lagrangian capacity bound $n_G \leq 12$; (ii) coherence-compression saturation $n_G = 12$; (iii) chirality compatibility (complex representations); and (iv) anomaly-free chiral matter content.

*Proof.* Theorem G.8.4b establishes that $(3,2,1)$ is the unique partition surviving all constraints. The module decomposition $\mathbb{C}^3 \oplus \mathbb{C}^2 \oplus \mathbb{C}^1$ forces the algebra $\mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak{u}(1)$ as the unique 12-dimensional faithful, chirality-compatible, anomaly-free solution. ∎

**Corollary G.8.4c.1 (Exclusion of Simple Unification Groups).**
*Grand unified theories based on simple gauge groups are excluded by the capacity bound:*

| Group | $\dim(\mathfrak{g})$ | Status |
|:------|:-------------------:|:-------|
| $SU(5)$ | 24 | Excluded ($> 12$) |
| $SO(10)$ | 45 | Excluded ($> 12$) |
| $E_6$ | 78 | Excluded ($> 12$) |

*Proof.* The standard dimensions $\dim(SU(5)) = 24$, $\dim(SO(10)) = 45$, and $\dim(E_6) = 78$ are tabulated in [Slansky 1981]. By Theorem G.8.4a, the capacity bound $n_G \leq 12$ excludes all simple Lie algebras of dimension greater than 12. ∎


**Corollary G.8.4c.2 (Proton Stability).**
*The proton lifetime against gauge-mediated decay channels is infinite within the framework: $\tau_p^{\text{gauge}} = \infty$.*

*Proof.* Gauge-mediated proton decay in GUT models proceeds via exchange of heavy gauge bosons ($X$, $Y$) corresponding to generators in $\mathfrak{g}_{\text{GUT}}/\mathfrak{g}_{\text{SM}}$ [Georgi & Glashow 1974; Langacker 1981]. By Corollary G.8.4c.1, the capacity bound $n_G \leq 12$ excludes all such extensions. The Standard Model gauge algebra saturates the bound at $\dim = 12$, leaving no room for additional gauge generators. Since Standard Model renormalizable gauge interactions preserve baryon number, and no baryon-number-violating gauge extensions exist within the capacity bound, the gauge-mediated proton decay rate is exactly zero. Observable proton decay, if present, must arise from non-gauge mechanisms. ∎


**Remark G.8.4c.3: Experimental Status.** Current experimental lower limits on partial lifetimes are $\tau/B(p \to e^+ \pi^0) > 2.4 \times 10^{34}$ years and $\tau/B(p \to \mu^+ \pi^0) > 1.6 \times 10^{34}$ years [Super-Kamiokande Collaboration 2020]. Minimal $SU(5)$ scenarios typically predict $\tau/B(p \to e^+ \pi^0)$ in the $10^{31}$–$10^{32}$ year range (model-dependent), which is excluded by more than two orders of magnitude [Nath & Fileviez Pérez 2007; Langacker 1981]. The framework predicts continued null results in searches for gauge-mediated proton decay modes.


**Remark G.8.4d: Complementary Derivation Methods.** The module decomposition $\mathcal{B} = \mathbb{C}^3 \oplus \mathbb{C}^2 \oplus \mathbb{C}^1$ derived via exhaustive partition analysis coincides with the Local Module Hypothesis of Proposition G.M1. Both methods use the same foundational constraints—the capacity bound $n_G \leq 12$, anomaly cancellation, chirality requirements, and PCE optimization—but apply them differently: Proposition G.M1 proceeds by direct cost minimization, while Theorem G.8.4b proceeds by systematic elimination. The convergence of these complementary approaches establishes that the Standard Model gauge structure is uniquely determined by framework principles.

**Remark G.8.4e: Geometric Interpretation via Attractor Orbit.** The PCE-Attractor orbit is the Grassmannian $\text{Gr}(2,8)$ with isotropy group $K = U(2) \times U(6)$. The tangent space $T_{x_0}\text{Gr}(2,8) \cong \text{Hom}(\mathbb{C}^2, \mathbb{C}^6)$ is irreducible under $K$. By Schur's lemma, any $K$-invariant potential $V_{PCE}$ has scalar Hessian $H = \lambda I$ at the minimum with $\lambda = 3/2$ (Corollary T.41.3). 

The gauge decomposition $\mathbb{C}^6 = \mathbb{C}^3 \oplus \mathbb{C}^2 \oplus \mathbb{C}^1$ induces a symmetry-breaking pattern $U(6) \to U(3) \times U(2) \times U(1)$ that splits the tangent space into components:
$$\text{Hom}(\mathbb{C}^2, \mathbb{C}^6) = \text{Hom}(\mathbb{C}^2, \mathbb{C}^3) \oplus \text{Hom}(\mathbb{C}^2, \mathbb{C}^2) \oplus \text{Hom}(\mathbb{C}^2, \mathbb{C}^1)$$
with complex dimensions $6 + 4 + 2 = 12$. Realizing multiple distinct Hessian eigenvalues from this structure would require constructing an explicit $V_{PCE}$ that respects the reduced symmetry $U(2) \times U(3) \times U(2) \times U(1)$ but not the full $K$.

**Theorem G.8.4f (12-Fold Structural Correspondence).** *The number 12 appears as a structural constant across multiple framework domains:*

| Quantity | Value | Origin |
|:---------|:-----:|:-------|
| Golay signal dimension | $k = 12$ | Rate-$\frac{1}{2}$ optimal code on $n = 24$ (Theorem Z.13) |
| Gauge generators | $n_G = 12$ | Capacity bound saturation (Theorem G.8.4b) |
| Grassmannian complex dimension | $\dim_{\mathbb{C}}(\text{Gr}(2,8)) = ab = 12$ | QFI tangent structure (Theorem Z.6.3a) |
| Interface mode pairs | $M/2 = 12$ | Signal-parity partition (Theorem Z.5) |
| Golay parity constraints | $n - k = 12$ | Parity check matrix rows |
| Stabilizer generators (each type) | 12 | CSS construction from self-dual $\mathcal{G}_{24}$ (Remark G.8.4g.1a) |

*These appearances reflect a single structural identity:*
$$
12 = \frac{M}{2} = ab = k = n_G = \dim_{\mathbb{C}}(\text{Gr}(2,8))
$$

*Proof.* From Theorem Z.5, the interface mode count is $M = 2ab = 24$. The rate-$\frac{1}{2}$ Golay code $[24, 12, 8]$ partitions these into $k = 12$ signal and $n - k = 12$ parity modes (Theorem Z.13). From Theorem G.8.2e, the Lagrangian capacity bound is $n_G^{max} = k = 12$. The Standard Model gauge algebra saturates this bound: $\dim(\mathfrak{g}_{SM}) = 8 + 3 + 1 = 12$ (Theorem G.8.4b). The complex Grassmannian dimension is $\dim_{\mathbb{C}}(\text{Gr}(a, d_0)) = a(d_0 - a) = 2 \times 6 = 12$ (Theorem Z.6.3a). ∎

**Corollary G.8.4f.1 (Gauge-Code Correspondence).** *The rate-$\frac{1}{2}$ Golay code structure determines the gauge sector dimension: the 12 signal modes correspond to 12 gauge generators, while the 12 parity modes provide error-correcting redundancy. This correspondence reflects the optimal balance between information capacity and error protection at the PCE-Attractor.*

**Theorem G.8.4g (Classical Code-Gauge Structural Analogy).** *The gauge structure of the Standard Model exhibits a structural analogy to classical error-correcting code organization.*

*Statement.* For the self-dual extended binary Golay code $\mathcal{G}_{24} = \mathcal{G}_{24}^\perp$ with parameters $[24, 12, 8]$ [MacWilliams & Sloane 1977]:

| Classical Code Structure | Gauge Theory Structure |
|:-------------------------|:-----------------------|
| Block length: $n = 24$ | Interface modes: $M = 24$ |
| Message dimension: $k = 12$ | Dynamical degrees of freedom |
| Parity dimension: $n - k = 12$ | Gauge generators: $n_G = 12$ |
| Codewords | Gauge-invariant configurations |
| Syndrome space | Gauge-variant quantities |
| Minimum distance: $d = 8$ | Robustness scale |

*Proof.* The extended binary Golay code $[24, 12, 8]$ is self-dual: $\mathcal{G}_{24} = \mathcal{G}_{24}^\perp$. The rate-$\frac{1}{2}$ structure partitions the 24-dimensional space into:
- 12 signal dimensions (message space)
- 12 parity dimensions (redundancy for error detection/correction)

For the Standard Model gauge algebra: $\dim(\mathfrak{g}_{SM}) = 8 + 3 + 1 = 12 = n - k$.

The correspondence identifies organizational structure: 12-dimensional redundancy (parity/gauge) protecting or constraining 12-dimensional content (message/matter). This is a structural parallel at the level of dimensionality, not an algebraic isomorphism. ∎

**Remark G.8.4g.1: Clarification on CSS Quantum Codes.** A CSS quantum code constructed from the self-dual Golay code using $C_1 = C_2 = \mathcal{G}_{24}$ has parameters $[[24, 0, 8]]$ with zero logical qubits, since $k_{\text{quantum}} = k_1 + k_2 - n = 12 + 12 - 24 = 0$ for self-dual codes [Calderbank & Shor 1996; Steane 1996]. The quantum Singleton bound $n - k \geq 2(d-1)$ requires $k \leq 10$ for $[[24, k, 8]]$, confirming that $[[24, 12, 8]]$ is impossible. The analogy presented here concerns the **classical** code structure, not CSS quantum parameters. The structural correspondence is between the classical rate-$\frac{1}{2}$ partition ($k = n - k = 12$) and the gauge/matter sector organization.

**Remark G.8.4g.1a: Vacuum Stabilizer Interpretation.** The $[[24, 0, 8]]$ CSS construction yields a unique stabilizer state $|\Omega_{\text{Golay}}\rangle$, the uniform superposition over all 4096 Golay codewords:
$$|\Omega_{\text{Golay}}\rangle = \frac{1}{64} \sum_{c \in \mathcal{G}_{24}} |c\rangle$$
This state is stabilized by 24 independent generators: 12 X-type generators $S_i^X = X^{g_i}$ (where $g_i$ is the $i$-th row of a generator matrix) and 12 Z-type generators $S_j^Z = Z^{h_j}$ (where $h_j$ is the $j$-th row of a parity-check matrix). The "12 + 12" structure thus manifests as stabilizer generators rather than signal versus parity qubits. The Golay minimum distance 8 implies that the smallest-weight non-identity stabilizer elements have weight 8; equivalently, any Pauli error of weight less than 8 produces a nontrivial syndrome under stabilizer measurement. The state is invariant under the Mathieu group $M_{24} = \text{Aut}(\mathcal{G}_{24})$, with $|M_{24}| = 244,823,040$.

**Remark G.8.4g.2: Functional Analogy.** The analogy suggests that gauge invariance serves a function analogous to error detection: gauge transformations identify physically equivalent configurations, just as parity constraints identify valid codewords. Physical observables must be gauge-invariant, just as transmitted messages must satisfy parity checks. The number 12 appears in both contexts because both derive from the rate-$\frac{1}{2}$ optimization on $M = 24$ modes (Theorem Z.13).

### G.8.5 The Standard Model, Hypercharge, and Three Generations as a Unified PCE Optimum

The PU framework provides a robust, multi-layered argument for the co-selection of D=4 spacetime and the Standard Model gauge group with its specific fermion content and three-generation structure. This selection is a derived consequence of minimizing the global PCE potential under the standing principles of compression efficiency and predictive invariance.

1.  **Primacy of D=4 for Structural Stability and Information Efficiency:**
    As argued in Sections G.8.2.4 and G.8.2.5, D=4 is strongly and uniquely favored by PCE. The mode count $M = 2ab = 24$ equals both the real dimension of the attractor orbit $\dim_{\mathbb{R}}(\text{Gr}(2,8)) = 24$ and the kissing number $K(4) = 24$ in four dimensions, establishing a geometric bridge between internal Hilbert space structure and emergent spacetime dimensionality. It is the dimension that robustly supports stable, complex MPU aggregates (via inverse-square force structure) and favorable network information efficiency. These factors make D=4 the unique, stable dimensional arena for a complex, predictive universe. This stability-based selection is independently confirmed by the mode-channel correspondence derived in Appendix Z (Theorem Z.11): the $M=24$ interface modes of the PCE-Attractor must match the kissing number $K(D)$ for optimal geometric packing, and $K(D)=24$ has the unique solution $D=4$. The convergence of these two independent derivations—one from dynamical stability, one from information-geometric correspondence—provides strong evidence that $D=4$ is multiply determined by the framework's principles.

2.  **Selection of $G_{SM}$, Hypercharge, and Three Generations within D=4:**
    Within the stable D=4 arena, PCE selects the optimal gauge group and matter content subject to capacity and consistency constraints.
    *   **Gauge group $G_{SM}$.** By the cost-minimization principle under Proposition G.M1 and the Local Module Hypothesis, established by exhaustive partition analysis (Theorem G.8.4b, Corollary G.8.4c), the module decomposition $\mathcal{B} = \mathbb{C}^3 \oplus \mathbb{C}^2 \oplus \mathbb{C}^1$ is uniquely selected. The non-abelian part is $SU(2) \times SU(3)$ acting in fundamentals; adding **exactly one** non-trivial $U(1)$ factor is sufficient and cost-minimal for SM-like chiral content. Simple unification groups are excluded by capacity bounds (Theorem G.8.4a, Corollary G.8.4c.1). The total generator count $n_G = 12$ saturates the Lagrangian capacity bound (Theorem G.8.2e), lies within the channel capacity range (Equation G.8.0), and equals the Golay code dimension $k = 12$ (Theorem Z.13). The tree-level Weinberg angle $\sin^2\theta_W^{(0)} = 3/8$ emerges from PCE isotropy at the PU fixed point without requiring grand unified gauge symmetry; the value $3/8$ coincides with the standard tree-level $SU(5)$ unification prediction [de Boer 1994] (Appendix T, Theorem T.14).
    *   **Hypercharge Uniqueness (one chiral family, no $n^c$).** Let the left‑chiral hypercharges be $y_q,y_{u^c},y_{d^c},y_\ell,y_{e^c}$. Imposing cancellation of all local and mixed gauge and gravitational anomalies in $D=4$ yields the constraints:
        $$
        \begin{alignedat}{2}
        &[SU(3)]^2 U(1): &\quad &2y_q+y_{u^c}+y_{d^c}=0,\\
        &[SU(2)]^2 U(1): &\quad &N_c y_q+y_\ell=0,\\
        &[\text{grav}]^2 U(1): &\quad &2N_c y_q+N_c y_{u^c}+N_c y_{d^c}+2y_\ell+y_{e^c}=0,\\
        &[U(1)]^3: &\quad &N_c(2y_q^3+y_{u^c}^3+y_{d^c}^3)+2y_\ell^3+y_{e^c}^3=0.
        \end{alignedat}
        $$
        Treating $N_c$ as a variable, the anomaly constraints admit the family $y_\ell=-N_c y_q,\ y_{e^c}=2N_c y_q,\ y_{d^c}=(N_c-1)y_q,\ y_{u^c}=-(N_c+1)y_q$. Witten’s global $SU(2)$ anomaly enforces $N_c+1$ even $\Rightarrow N_c$ odd. The SM gauge group dimension is $n_G = (N_c^2-1) + (2^2-1) + 1 = N_c^2+3$. PU’s capacity bound $n_G \le n_{\max}$ (Equation G.8.0). If we take the central estimate $n_{\max} \approx 12$, then $N_c^2+3 \le 12$, implying $N_c^2\le 9$, so $N_c\le 3$. With $N_c=3$, the PCE cost of the hypercharge configuration, modeled as being proportional to the sum of squared charges, $S \propto \sum_i n_i y_i^2$, is equal for both anomaly‑allowed branches. Choosing the conventional SM branch gives, up to an overall normalization/sign factor, the unique Standard Model hypercharge assignments:
        $$
        y_q=\tfrac{1}{6},\quad y_{u^c}=-\tfrac{2}{3},\quad y_{d^c}=\tfrac{1}{3},\quad y_\ell=-\tfrac{1}{2},\quad y_{e^c}=1.
        $$
        This solution is also consistent with the global $SU(2)$ anomaly (4 doublets/family). Furthermore, requiring gauge invariance of the renormalizable Yukawa interactions with a single Higgs doublet $H$,
        $$
         y_q+y_H+y_{u^c}=0,\qquad y_q-y_H+y_{d^c}=0,\qquad y_\ell-y_H+y_{e^c}=0,
          $$

       **Theorem G.8.1 (Hypercharges fixed up to overall scale).** With one Higgs doublet $H$, impose Yukawa gauge invariance
       $$
       y_q+y_H+y_{u^c}=0,\qquad y_q-y_H+y_{d^c}=0,\qquad y_\ell-y_H+y_{e^c}=0,
       $$
       and the linear anomaly cancellations
       $$
       2y_q+y_{u^c}+y_{d^c}=0,\quad 3y_q+y_\ell=0,\quad 6y_q+3y_{u^c}+3y_{d^c}+2y_\ell+y_{e^c}=0.
       $$
       Then the unique solution up to an overall scale $a$ is [Weinberg 1996]
       $$
       y_H=3a,\quad y_q=a,\quad y_{u^c}=-4a,\quad y_{d^c}=2a,\quad y_\ell=-3a,\quad y_{e^c}=6a,
       $$
       and the cubic $U(1)^3$ anomaly vanishes identically. *Proof.* Solve the Yukawa constraints for $y_{u^c},y_{d^c},y_{e^c}$, use $3y_q+y_\ell=0$ to get $y_\ell=-3y_q$, insert into the gravitational anomaly to obtain $y_H=3y_q$, then set $a:=y_q$. ∎

       **Corollary G.8.2** (canonical normalization). The PCE tie‑breaker of minimal denominator complexity fixes $a=1/6$, giving $(y_q,y_H,y_{u^c},y_{d^c},y_\ell,y_{e^c})=(1/6,1/2,-2/3,1/3,-1/2,1)$.
       
       Quantitative constraints on electroweak coupling ratios at the PCE-attractor—including a branch-specific prediction for $\sin^2\theta_W(\mu^*)$ under the cap-active alignment (Assumption W.3.A)—are derived in Appendix W (Theorem W.11; Eqs. W.3.1–W.3.3).

    *   **PCE Corollary – Singlet Neutrality.** Assigning non‑zero hypercharge to a pure non‑abelian singlet increases PCE cost without predictive gain; the minimum sets the hypercharge of any potential sterile right-handed neutrino to zero.
    *   **Three Generations (Unique Minimizer).** Appendix R (Proposition R.3.5) shows—using PCE together with anomaly cancellation and CP violation requirements—that (i) the smallest nontrivial anomaly-consistent family structure is $N=3$ with offsets $\{a,-a,0\}$, (ii) abelian "doping" is disfavored, and (iii) the three-generation structure is over-determined by both topological (anomaly cancellation) and geometric (E$_8$/Leech lattice) constraints (Proposition R.4.2).

3.  **Confluence and Co-selection:**
    D=4 provides the stable arena; within it, the SM gauge group with its uniquely determined chiral fermion content is PCE-efficient, and the family replication uniquely selected by PCE is $N=3$. The capacity bound $n_G \leq 12$ excludes simple unification groups (Corollary G.8.4c.1), predicting proton stability against gauge-mediated decay (Corollary G.8.4c.2).
    
### G.8.6 Emergent Couplings and Masses

The specific numerical values of gauge couplings ($g_s,g_2,g_Y$) and fermion Yukawas are determined by the location and depth of the PCE minimum. Computing these from first principles requires evaluating the D-dependent coefficients in the PCE potential (Equation G.8.5) from MPU microdynamics. The ratios between these couplings are further constrained by the PCE optimization, a topic explored in Appendix W, and a concrete, attractor-matched estimate for the fine-structure constant is provided in Appendix Z (with order‑unity matching fixed at the PCE capacity point).


## G.9 Rate-Level PCE Potential and the Pathway to $\alpha_{\mathrm{em}}$

This section develops the general formalism for deriving gauge couplings from a rate-level PCE potential, which balances the **power cost** of maintaining gauge coherence against the **predictive information rate** benefit it provides. This general framework is further constrained by the alphabet identities derived in Appendix W. The complete derivation of the fine-structure constant at the Thomson limit, with zero continuously adjustable parameters, which uses the framework's foundational constants ($d_0=8$, $\varepsilon=\ln 2$) to fix the spectral inputs to this program and solve for $\alpha^{-1} ≈ 137.036$ at the unique PCE-Attractor (Definition 15a), is presented in Appendix Z.

The rate-level PCE potential for a $U(1)$ gauge coupling $u=g_e^2$ is given by:
$$
\phi(u) = P_{\mathrm{cost}}(u) - \Gamma_0 V_{\mathrm{benefit}}(u)
$$
where $P_{\mathrm{cost}}(u) \approx A_{\mathrm{PCE}} u^{\gamma_{\mathrm{eff}}}$ is the power cost of maintaining coherence and $V_{\mathrm{benefit}}(u) = \sum_i \ln(1+\lambda_i u)$ is the per-event predictive information gain, derived from the Local Asymptotic Normality (LAN) of the MPU's predictive channel. The system seeks the value $u^*$ that minimizes this potential, subject to the alphabet capacity constraint $V_{\mathrm{benefit}}(u) \le \ln d_0$.

As rigorously established in Appendix X, this rate-level potential and its minimization are equivalent to finding the stationary point of the full QFT effective potential. The physical coupling is then $\alpha_{\mathrm{em}}(\mu^*) = u^*/(4\pi\kappa)$, where the normalization $\kappa$ is determined by the emergent field theory (Appendix X.3). The inputs to this calculation—specifically the QFI spectrum $\{\lambda_i\}$—are operational functionals of the baseline PCE-optimal MPU cycle. Appendix Z demonstrates that at the PCE-Attractor, these spectral inputs are uniquely determined by the framework's foundational constants, leading to a complete calculation of $\alpha_{\mathrm{em}}$ with zero continuously adjustable parameters.


## G.1.9 Unified Origin of Probability Measures from ND-RID Equilibration

The Born rule derivation (Sections G.1.1–G.1.4) established that PCE-enforced non-contextuality, combined with additivity over orthogonal projectors, uniquely determines quantum probability via Gleason's theorem. This section demonstrates that the same ND-RID dynamics, operating under PCE optimization, provide a unified mechanism for the emergence of probability measures across quantum, thermal, and gravitational contexts. The unification arises not from formal analogy but from the common dynamical process of equilibration to Gibbs fixed points, with the constraint geometry determining the specific modular Hamiltonian.

This probability unification is the dynamical complement to the entropy unification established in Appendix P (Thesis P.6.1, Section P.6.5). Where Section P.6.5 establishes that all entropies—SPAP, Shannon, thermodynamic, von Neumann, and Bekenstein-Hawking—are manifestations of a single foundational structure, this section establishes that all probability measures arise from a single dynamical mechanism. The two unifications are related through the Gibbs structure: entropy characterizes the equilibrium state, while probability describes how systems reach that state.

### G.1.9.1 The Derivation Chain from SPAP to the Reference State

The logical foundation for probability measures in the PU framework traces through a rigorous derivation chain:

$$
\text{SPAP} \xrightarrow{\text{Thm 31}} \varepsilon = \ln 2 \xrightarrow{\text{Thm Z.1}} a = 2 \xrightarrow{\text{Def 15a}} \tau^* = \frac{I_a}{a} \oplus 0_b
$$

**Stage 1: Irreducible Entropy Cost.** The Self-Referential Paradox of Accurate Prediction (Theorems 10–11) requires a logically irreversible 2-to-1 state merge in each predictive cycle (Lemma Z.2). By Landauer's principle [Landauer 1961], this merge has an irreducible thermodynamic cost (Theorem 31, Appendix J):

$$
\varepsilon \geq \ln 2 \text{ nats}
\tag{G.1.9.1}
$$

The bound is exact and saturated by optimal erasure protocols [Bennett 1982]. This entropy cost $\varepsilon = \ln 2$ is the foundational element of the unified entropy structure (Thesis P.6.1, Appendix P), from which all other entropy measures derive as domain-specific expressions.

**Stage 2: Physical Instantiation of the Cost.** The Principle of Physical Instantiation (PPI, Appendix P, Definition P.6.2) requires abstract logical costs to manifest as actual physical subsystems. The von Neumann entropy of a maximally mixed state on an $a$-dimensional Hilbert space satisfies $S(\rho) \le \ln a$ nats, with equality only for the maximally mixed state [von Neumann 1932]. Admissibility requires $\ln a \ge \varepsilon$; since $a \in \mathbb{N}$, PPI-optimality selects the minimal admissible $a$ (Theorem Z.1):

$$
a = 2
\tag{G.1.9.2}
$$

This 2-dimensional "Landauer Pointer" is the minimal physical realization of the irreducible cost.

**Stage 3: The PCE-Attractor State.** With $d_0 = 8$ (Theorem 23) and $a = 2$, the inactive subspace has dimension $b = d_0 - a = 6$. The PCE-Attractor (Definition 15a) is the unique equilibrium state maximally mixed on the active subspace and zero on the inactive complement:

$$
\tau^* = \rho_0 = \frac{I_2}{2} \oplus 0_6
\tag{G.1.9.3}
$$

with eigenvalues $(1/2, 1/2, 0, 0, 0, 0, 0, 0)$. The von Neumann entropy restricted to the active subspace is:

$$
S(\tau^*|_{\mathcal{A}}) = -\text{Tr}\left(\frac{I_2}{2} \ln \frac{I_2}{2}\right) = -2 \cdot \frac{1}{2} \ln\frac{1}{2} = \ln 2 = \varepsilon
\tag{G.1.9.4}
$$

At the PCE-Attractor, quantum entropy and SPAP entropy coincide exactly. This identity confirms the entropy unification thesis: the von Neumann entropy $S(\tau^*|_{\mathcal{A}})$ and the SPAP entropy $\varepsilon$ are not merely equal but are the same quantity expressed in the same units.

### G.1.9.2 ND-RID Channel Structure and Fixed Points

The average 'Evolve' channel $\mathcal{E}_N$ is modeled as a convex combination (Appendix E, Lemma E.1):

$$
\mathcal{E}_N = (1-p)\Psi + p \cdot T_\sigma, \quad 0 < p \leq 1
\tag{G.1.9.5}
$$

where $\Psi$ is an arbitrary CPTP map representing the reversible/update phase and $T_\sigma(\rho) = \text{Tr}(\rho)\sigma$ is the full-rank reset channel to state $\sigma \succ 0$. 

**Lemma G.1.9.1 (Nonzero Refresh Weight).** In the PU coarse-grained ND-RID description, the averaged 'Evolve' channel includes a nonzero input-independent refresh component (Equation (G.1.9.5)), i.e. it admits a decomposition
$$
\mathcal{E}_N = (1-p)\Psi + p\,T_\sigma
\quad\text{with}\quad
p\in(0,1].
\tag{G.1.9.6}
$$
The irreducible cost $\varepsilon=\ln 2$ (Theorem 31) is the thermodynamic signature of logically irreversible refresh/reset in the SPAP cycle, but $\varepsilon$ alone does not determine a universal quantitative lower bound on $p$ without additional microscopic assumptions about how entropy production is partitioned between $\Psi$ and the refresh component.

*Proof.* Equation (G.1.9.5) defines $p$ as the weight of the input-independent refresh component in a convex decomposition of the averaged channel. Theorem 31 establishes that each cycle incurs a strictly positive irreducible entropy cost, which must be physically instantiated (Stage 2) and is operationally associated with refresh/reset in the SPAP update. At the level of the averaged channel model, this corresponds to $p>0$.

However, $\varepsilon$ constrains only the total irreversible entropy production per cycle, not uniquely the decomposition weights: if $\Psi$ itself contributes irreversible entropy production, then the refresh weight $p$ can be smaller while the total cost remains $\varepsilon$. Therefore no universal numeric lower bound on $p$ follows from $\varepsilon$ alone at this abstraction level. QED

**Theorem G.1.9.1 (Contractivity and Conditional Primitivity of ND-RID).** Let $\mathcal{E}_N$ be as in Equation (G.1.9.5), with $p\in(0,1]$. Then for all states $\rho_1,\rho_2$,
$$
D_{tr}\\!\bigl(\mathcal{E}_N(\rho_1),\mathcal{E}_N(\rho_2)\bigr)
\le (1-p)\,D_{tr}(\rho_1,\rho_2),
\qquad
f_{RID}\le 1-p<1.
$$
If additionally $\sigma\succ 0$ (full rank), then $\mathcal{E}_N$ is strictly positive and hence primitive (unique full-rank fixed point) [Sanz et al. 2010].

*Proof.* Let $\Delta:=\rho_1-\rho_2$ so $\mathrm{Tr}(\Delta)=0$. Since $T_\sigma(\Delta)=\mathrm{Tr}(\Delta)\sigma=0$, Equation (G.1.9.5) implies
$$
\mathcal{E}_N(\Delta)=(1-p)\Psi(\Delta).
$$
For any CPTP map $\Psi$, trace distance is contractive, hence $\|\Psi(\Delta)\|_1\le \|\Delta\|_1$. Therefore
$$
D_{tr}\\!\bigl(\mathcal{E}_N(\rho_1),\mathcal{E}_N(\rho_2)\bigr)
=\tfrac12\|\mathcal{E}_N(\Delta)\|_1
=(1-p)\tfrac12\|\Psi(\Delta)\|_1
\le (1-p)\tfrac12\|\Delta\|_1
=(1-p)\,D_{tr}(\rho_1,\rho_2),
$$
which gives the stated strict contraction.

If $\sigma\succ0$ and $p>0$, then for any state $\rho$,
$$
\mathcal{E}_N(\rho)=(1-p)\Psi(\rho)+p\sigma\succ0,
$$
so $\mathcal{E}_N$ is strictly positive. Strict positivity implies primitivity and uniqueness of a full-rank fixed point [Sanz et al. 2010]. QED

*Remark: Primitivity vs. PCE-Attractor.* The primitivity argument establishes *contractivity*—that states converge exponentially. The *destination* of this convergence is determined by PCE optimization (Definition 15), which selects the PCE-Attractor $\tau^*$ as the equilibrium configuration. While a primitive channel on the full $d_0$-dimensional space has a unique full-rank fixed point, the PCE-Attractor $\tau^* = (I_2/2) \oplus 0_6$ represents the PCE-optimal state within the orbit of equilibrium configurations, with dynamics effectively restricted to the active subspace by the thermodynamic decoupling of inactive modes (Appendix Z, Section Z.6.2).

### G.1.9.3 PCE Optimization and Detailed Balance

The connection between PCE optimization and the thermal structure of the fixed point requires analysis of entropy production.

**Definition G.1.9.1 (Entropy Production Decomposition).** For a quantum dynamical semigroup generator $\mathcal{L}$ with faithful stationary state $\sigma$ (i.e., $\mathcal{L}^*(\sigma) = 0$ with $\sigma \succ 0$), the entropy production for the induced CPTP map $\Phi_t = e^{t\mathcal{L}}$ acting on state $\rho$ decomposes as [Spohn 1978]:

$$
\Delta S_{tot}[\rho; \Phi_t] = -\Delta D(\rho \| \sigma) + \sigma_{irr}[\rho; \Phi_t]
\tag{G.1.9.7}
$$

where:
- $D(\rho \| \sigma) = \text{Tr}(\rho \ln \rho - \rho \ln \sigma)$ is the Umegaki relative entropy
- $\Delta D = D(\Phi_t(\rho) \| \sigma) - D(\rho \| \sigma) \leq 0$ represents contraction toward the stationary state
- $\sigma_{irr} \geq 0$ is the irreversible entropy production

This decomposition is fundamental to the entropy unification program: the total entropy production $\Delta S_{tot}$ is the thermodynamic entropy (measurable as heat divided by temperature), while the relative entropy $D_{KL}$ is the information-theoretic entropy. The Spohn decomposition makes explicit that these are components of a single quantity.

**Theorem G.1.9.2 (PCE Selection of Detailed Balance).** The Principle of Compression Efficiency (Definition 15) drives the ND-RID channel toward configurations satisfying $\sigma_{irr} = 0$.

*Proof.* The term $\sigma_{irr}$ represents entropy production beyond the minimum required for fixed-point convergence. This constitutes pure thermodynamic waste—entropy generated without predictive benefit. Definition 15 mandates minimizing Signal Cost while maintaining predictive utility. Since $\sigma_{irr}$ contributes to Signal Cost (via the thermodynamic resource expenditure $k_B T \sigma_{irr}$) without improving Meaning Potential, PCE optimization selects for channels with $\sigma_{irr} \to 0$. 

Consider two channels $\mathcal{E}_A$ and $\mathcal{E}_B$ with the same fixed point and predictive utility but $\sigma_{irr}^{(A)} < \sigma_{irr}^{(B)}$. Channel $\mathcal{E}_A$ achieves the same predictive outcome at lower cost, so PCE selects $\mathcal{E}_A$. In the limit of PCE optimization, $\sigma_{irr} \to 0$. QED

**Theorem G.1.9.3 (Detailed Balance Characterization).** For a quantum dynamical semigroup with faithful stationary state $\sigma$, the generator $\mathcal{L}$ satisfies $\sigma_{irr}[\rho; e^{t\mathcal{L}}] = 0$ for all states $\rho$ and $t > 0$ if and only if $\mathcal{L}$ satisfies quantum detailed balance with respect to $\sigma$:

$$
\text{Tr}(A \cdot \mathcal{L}(B) \cdot \sigma) = \text{Tr}(\mathcal{L}^{\dagger_\sigma}(A) \cdot B \cdot \sigma)
\tag{G.1.9.8}
$$

where $\mathcal{L}^{\dagger_\sigma}$ is the adjoint with respect to the $\sigma$-weighted inner product $\langle A, B \rangle_\sigma = \text{Tr}(A^\dagger B \sigma)$ [Spohn 1978; Fagnola & Umanità 2007].

*Proof.* The equivalence between vanishing irreversible entropy production and quantum detailed balance is a standard result in quantum dynamical semigroups. The condition $\sigma_{irr} = 0$ is equivalent to the channel satisfying the quantum detailed balance condition, which generalizes the classical notion of microscopic reversibility [Kossakowski et al. 1977]. QED

**Corollary G.1.9.1 (PCE-Optimal ND-RID Satisfies Detailed Balance).** The PCE-optimal ND-RID channel $\mathcal{E}_N^*$ satisfies quantum detailed balance with respect to the PCE-Attractor state $\tau^*$.

### G.1.9.4 The Gibbs Structure of PCE-Optimal Fixed Points

**Definition G.1.9.2 (Modular Hamiltonian).** For any faithful density operator $\rho$ on a finite-dimensional Hilbert space $\mathcal{H}$, the modular Hamiltonian $K_\rho$ is the unique self-adjoint operator satisfying [Haag 1996]:

$$
\rho = \frac{e^{-K_\rho}}{Z}, \quad Z = \text{Tr}(e^{-K_\rho})
\tag{G.1.9.9}
$$

Explicitly, if $\rho = \sum_i p_i |i\rangle\langle i|$ with $p_i > 0$, then $K_\rho = -\sum_i (\ln p_i)|i\rangle\langle i|$.

The modular Hamiltonian provides the bridge between probability and entropy: for a Gibbs state $\rho = Z^{-1}e^{-K}$, the von Neumann entropy is $S(\rho) = \langle K \rangle + \ln Z$, directly connecting the probability distribution (encoded in $\rho$) to the entropy (encoded in $S$).

**Theorem G.1.9.4 (Gibbs Structure of PCE-Attractor).** The PCE-Attractor state $\tau^*$ (Equation G.1.9.3) has the Gibbs form when restricted to its support. On the active subspace $\mathcal{A} = \text{supp}(\tau^*)$, the modular Hamiltonian is:

$$
K^*|_{\mathcal{A}} = (\ln 2) \cdot I_2
\tag{G.1.9.10}
$$

The full modular Hamiltonian is formally written as $K^* = (\ln 2) \cdot I_2 \oplus (+\infty) \cdot I_6$, where the infinite values on the inactive subspace $\mathcal{B}$ enforce the zero eigenvalues via the limiting procedure $\lim_{K \to \infty} e^{-K} = 0$.

*Proof.* Direct computation from Definition G.1.9.2. On the active subspace $\mathcal{A}$:

$$
e^{-K^*|_{\mathcal{A}}} = e^{-(\ln 2) I_2} = \frac{1}{2} I_2
$$

Normalizing: $Z^* = \text{Tr}(e^{-K^*}) = \text{Tr}(I_2/2) = 1$, yielding $\tau^*|_{\mathcal{A}} = I_2/2$. On the inactive subspace $\mathcal{B}$, $K^*|_{\mathcal{B}} = +\infty$ ensures $e^{-K^*|_{\mathcal{B}}} = 0$. QED

**Theorem G.1.9.5 (KMS Characterization of PCE-Optimal States).** States satisfying detailed balance with respect to a quantum dynamical semigroup are characterized by the Kubo-Martin-Schwinger (KMS) condition [Kubo 1957; Martin & Schwinger 1959]. Restricted to the active subspace $\mathcal{A} = \text{supp}(\tau^*)$, where $\tau^*|_{\mathcal{A}}$ is faithful, the PCE-Attractor state satisfies the KMS condition at inverse temperature $\beta = 1$ with respect to the modular flow $\sigma_t(A) = e^{iK^*|_{\mathcal{A}} t} A e^{-iK^*|_{\mathcal{A}} t}$:

$$
\omega^*(A \sigma_t(B)) = \omega^*(\sigma_{t+i}(B) A)
\tag{G.1.9.11}
$$

where $\omega^*(\cdot) = \text{Tr}(\tau^*|_{\mathcal{A}} \cdot)$ is the state functional on $\mathcal{B}(\mathcal{A})$.

*Proof.* The KMS condition at $\beta = 1$ characterizes Gibbs states $\rho = Z^{-1}e^{-K}$ with respect to their modular automorphism [Haag 1996]. On the active subspace $\mathcal{A}$, where $\tau^*|_{\mathcal{A}} = I_2/2$ is faithful (full-rank on $\mathcal{A}$), the standard Tomita-Takesaki theory applies. Since $\tau^*|_{\mathcal{A}} = Z^{-1}e^{-K^*|_{\mathcal{A}}}$ is a Gibbs state by Theorem G.1.9.4, it satisfies KMS with respect to $\sigma_t$ generated by $K^*|_{\mathcal{A}}$. The inverse temperature $\beta = 1$ is a convention inherent in the definition of the modular Hamiltonian. QED

The KMS condition characterizes the thermal equilibrium states whose entropy is unified across domains (Section P.6.5). The KMS states are precisely those for which the distinction between "thermodynamic equilibrium" and "information-theoretic equilibrium" dissolves—they are equilibrium states in both senses simultaneously.

### G.1.9.5 Constraint Geometry and the Modular Hamiltonian

The unified framework emerges from recognizing that different physical contexts modify the modular Hamiltonian $K^*$ while preserving the Gibbs structure.

**Theorem G.1.9.6 (Constraint Geometry Determines Modular Hamiltonian).** Physical constraints on the ND-RID equilibration process modify the PCE-Attractor modular Hamiltonian $K^*$ additively:

$$
K^*_{total} = K^*_{PCE} + K^*_{constraint}
\tag{G.1.9.12}
$$

where $K^*_{PCE} = (\ln 2) \cdot I_a \oplus (+\infty) \cdot I_b$ is the baseline from SPAP, and $K^*_{constraint}$ encodes additional physical constraints.

| Physical Context | Constraint | $K^*_{constraint}$ | Resulting Distribution |
|------------------|------------|-------------------|------------------------|
| Quantum measurement | Perspective $s$ determines basis | $-\ln \rho_{phys} - K^*_{PCE}$ | Born: $p_i = \text{Tr}(\rho_{phys} P_i)$ |
| Thermal equilibrium | $\langle H \rangle = U$ | $\beta H$ | Boltzmann: $p_n = Z^{-1}e^{-\beta E_n}$ |
| Horizon crossing | Boost invariance | $(2\pi/\kappa) K_{boost}$ | Unruh: $T_U = \hbar\kappa/(2\pi k_B c)$ |

*Remark.* The additivity in Equation (G.1.9.12) holds when the constraints are mutually commuting or when the constraint acts on degrees of freedom independent of the baseline PCE structure. For strongly interacting constraints, cross-terms may arise, though the Gibbs form $\rho^* = Z^{-1}e^{-K^*_{total}}$ is preserved.

*Proof.*

**Part A (Quantum Measurement—Reference Case):** The quantum measurement case serves as the reference point of the unification. The Born rule derivation (Sections G.1.1–G.1.4) establishes that PCE-enforced non-contextuality and additivity yield $p_i = \text{Tr}(\rho_{phys} P_i)$ via Gleason's theorem [Gleason 1957]. 

By Definition G.1.9.2, any density matrix $\rho_{phys}$ admits the Gibbs representation $\rho_{phys} = Z^{-1}e^{-K}$ with $K = -\ln \rho_{phys}$. This is the identity case of the Gibbs structure—not an additional constraint but the baseline from which constraint modifications are measured. The measurement context (perspective $s \in \Sigma$) determines the basis $\{P_i\}$ in which probabilities are evaluated:

$$
p_i = \text{Tr}\left(\frac{e^{-K^*}}{Z} P_i\right) = \text{Tr}(\rho_{phys} P_i)
\tag{G.1.9.13}
$$

The substantive content of the unification lies in Parts B and C, where physical constraints impose structure on the modular Hamiltonian beyond this identity.

**Part B (Thermal Equilibrium):** When ND-RID interactions conserve energy on average, the equilibration process is constrained by $\langle H \rangle = U$. Standard maximum entropy arguments [Jaynes 1957] show the equilibrium state minimizes free energy $F = \langle K \rangle - S$, yielding $K^*_{constraint} = \beta H$ where $\beta$ is the Lagrange multiplier enforcing the energy constraint. The resulting state is:

$$
\rho^*_{thermal} = \frac{e^{-(K^*_{PCE} + \beta H)}}{Z} \propto e^{-\beta H}
\tag{G.1.9.14}
$$

on the active subspace, recovering the Boltzmann distribution. Here the constraint $K^*_{constraint} = \beta H$ is non-trivial: it reflects the physical restriction of energy conservation and introduces the temperature $T = 1/(k_B \beta)$ as a derived quantity.

**Part C (Horizon Crossing):** For Rindler horizons in the emergent spacetime (Theorem 46), the Bisognano-Wichmann theorem [Bisognano & Wichmann 1975, 1976] establishes that the modular Hamiltonian is proportional to the boost generator:

$$
K^*_{horizon} = \frac{2\pi}{\kappa} K_{boost}
\tag{G.1.9.15}
$$

where $\kappa$ is the surface gravity. This yields the Unruh temperature $T_U = \hbar\kappa/(2\pi k_B c)$ for accelerated observers [Unruh 1976], which is the kinematic result underlying the entanglement first law (Equation E.6e) and the thermodynamic derivation of gravity (Section 12). The constraint here arises from the geometric structure of the horizon itself—boost invariance of the vacuum state restricts the form of $K^*$ to be proportional to $K_{boost}$. QED

### G.1.9.6 Connection to the Entanglement First Law

The modular Hamiltonian structure connects directly to the entanglement first law, which is central to the derivation of Einstein's equations (Section 12, Theorem 50).

**Theorem G.1.9.7 (Entanglement First Law from Modular Structure).** For small perturbations $\delta\rho$ to the vacuum state across a causal horizon $\mathcal{H}$, the first law of entanglement entropy relates entropy change to the modular Hamiltonian expectation value (Equation E.6e):

$$
\delta S_{ent} = \delta \langle K \rangle
\tag{G.1.9.16}
$$

For local perturbations near a Rindler horizon with surface gravity $\kappa$:

$$
\delta S_{ent} = \frac{2\pi}{\hbar\kappa} \delta\langle T_{\mu\nu}\rangle \chi^\mu d\Sigma^\nu = \frac{\delta Q}{T_U}
\tag{G.1.9.17}
$$

where $\delta Q$ is the energy flux through the horizon and $T_U$ is the Unruh temperature.

*Proof.* This follows from the Tomita-Takesaki theory of modular operators [Takesaki 1970; Haag 1996]. The modular Hamiltonian $K$ generates the modular automorphism group $\sigma_t$, and the entanglement first law is the linearization of the relative entropy formula $S(\rho \| \sigma) = \text{Tr}(\rho \ln \rho - \rho \ln \sigma)$ around the reference state [Blanco et al. 2013]. The specific form (G.1.9.17) uses the Bisognano-Wichmann identification of $K$ with the boost generator. This result is kinematic—it follows from quantum field theory on curved spacetime and does not assume the Einstein equations [Jacobson 2016; Casini, Huerta & Myers 2011]. QED

**Corollary G.1.9.2 (Thermodynamic Consistency Fixes $\eta_{ent}$).** Requiring the local Clausius relation $\delta S = \delta Q/T$ to hold for all Rindler horizons uniquely determines the entanglement entropy coefficient (Theorem E.5):

$$
\eta_{ent} = \frac{1}{4G}
\tag{G.1.9.18}
$$

This identifies the gravitational constant $G$ as an emergent quantity determined by the MPU network's entanglement structure, consistent with the Bekenstein-Hawking entropy formula [Bekenstein 1973; Hawking 1975].

The result $\eta_{ent} = 1/(4G)$ connects directly to the gravitational entropy in the unified entropy framework (Section P.6.5). The Bekenstein-Hawking entropy $S_{BH} = \mathcal{A}/4G$ arises from the channel capacity of ND-RID interactions crossing the horizon (Theorems E.3–E.5). This is not an analogy but an identity: horizon entropy counts the Shannon entropy of channel capacity across the boundary, measured in Planck units. The derivation chain from SPAP to horizon entropy (Section P.6.5.2) makes this explicit:

$$
\varepsilon > 0 \xrightarrow{\text{E.1}} f_{RID} < 1 \xrightarrow{\text{E.2}} C_{\max} < \ln d_0 \xrightarrow{\text{E.3}} N_{eff} \propto \mathcal{A} \xrightarrow{\text{E.5}} S_{BH} = \frac{\mathcal{A}}{4G}
$$

### G.1.9.7 The Unified Mechanism

**Theorem G.1.9.8 (Unified Origin of Physical Probability).** In the Predictive Universe framework, probability measures across quantum, thermal, and gravitational contexts emerge from a common mechanism: ND-RID equilibration to Gibbs fixed points under PCE optimization.

The unification is characterized by:

1. **Common Dynamics:** All probability measures arise from equilibration under ND-RID channels satisfying quantum detailed balance (Corollary G.1.9.1).

2. **Common Reference State:** The baseline fixed point is the PCE-Attractor $\tau^* = (I_a/a) \oplus 0_b$, derived from SPAP (Theorem G.1.9.4).

3. **Common Thermodynamic Form:** All equilibrium states satisfy the KMS condition with respect to their modular Hamiltonians (Theorem G.1.9.5).

4. **Constraint-Dependent Modular Hamiltonian:** The physical context determines $K^*$ via Equation (G.1.9.12), with:
   - Quantum (reference): $K^* = -\ln \rho_{phys}$
   - Thermal: $K^* = K^*_{PCE} + \beta H$
   - Gravitational: $K^* = K^*_{PCE} + (2\pi/\kappa)K_{boost}$

5. **Common Capacity Bound:** All distributions respect the channel capacity limit $C_{\max}(f_{RID}) < \ln d_0$ (Theorem E.2) imposed by ND-RID irreversibility.

The Gibbs structure $\rho^* = Z^{-1}e^{-K^*}$ connects directly to the unified entropy framework (Thesis P.6.1). The von Neumann entropy $S(\rho^*) = \langle K^* \rangle + \ln Z$ is the domain-specific expression of the foundational SPAP entropy $\varepsilon = \ln 2$, scaled by the constraint geometry.

*Proof.* The theorem synthesizes Theorems G.1.9.1–G.1.9.7. The derivation chain establishes:

$$
\text{SPAP} \xrightarrow{\varepsilon \geq \ln 2} \text{Contractivity } f_{RID} < 1 \xrightarrow{\text{PCE}} \text{Detailed Balance} \xrightarrow{} \text{Gibbs Fixed Point}
$$

The constraint geometry $\mathcal{C}$ enters through the specific form of $K^*_{constraint}$, while the universal Gibbs structure $\rho^* = Z^{-1}e^{-K^*}$ is fixed by PCE optimization through the ND-RID channel. QED

### G.1.9.8 The Conversion Factor: $\varepsilon = \ln 2$

The irreducible entropy cost $\varepsilon = \ln 2$ plays the role of a fundamental conversion factor, analogous to $c^2$ in mass-energy equivalence.

**Theorem G.1.9.9 (Landauer Conversion).** The SPAP entropy cost $\varepsilon = \ln 2$ establishes the conversion between:

| Domain | Quantity | Conversion |
|--------|----------|------------|
| Logical | SPAP cycle cost | $\varepsilon = \ln 2$ nats |
| Thermodynamic | Minimum heat dissipation | $Q_{min} = k_B T \ln 2$ |
| Information | Active subspace dimension | $a = 2$ |
| Geometric | Interface mode count | $M = 2ab = 24$ |

These conversions realize the entropy domain correspondences of Thesis P.6.1 (Section P.6.5.1). The constants $k_B$, $\hbar$, $c$, and $G$ serve as exchange rates between operational domains, while $\varepsilon = \ln 2$ is the fundamental quantum of entropy from which all domain-specific expressions derive.

*Proof.* Each conversion follows from the derivation chain:

1. **Logical → Thermodynamic:** Landauer's principle (Theorem 31) establishes $Q_{min} = k_B T \varepsilon = k_B T \ln 2$ [Landauer 1961].

2. **Thermodynamic → Information:** PPI-optimality (Theorem Z.1) selects the minimal $a \in \mathbb{N}$ satisfying $\ln a \ge \varepsilon$, yielding $a = 2$.

3. **Information → Geometric:** The QFI mode count is $M = 2ab = 2 \cdot 2 \cdot 6 = 24$ (Theorem Z.5), which matches the kissing number $K(4) = 24$ [Conway & Sloane 1999], determining spacetime dimension $D = 4$ (Theorem Z.11). QED

### G.1.9.9 Summary

This section has established:

1. **Derived Reference State:** The PCE-Attractor state $\tau^* = (I_2/2) \oplus 0_6$ emerges from SPAP + Landauer + PCE, not by assumption (Section G.1.9.1).

2. **PCE → Detailed Balance:** PCE optimization of the ND-RID channel enforces quantum detailed balance with respect to $\tau^*$ (Theorems G.1.9.2–G.1.9.3).

3. **Gibbs Fixed Points:** The equilibrium states are Gibbs states $\rho^* = Z^{-1}e^{-K^*}$ characterized by the KMS condition (Theorems G.1.9.4–G.1.9.5).

4. **Unified Modular Structure:** Constraint geometry determines the modular Hamiltonian $K^*$, yielding Born (quantum), Boltzmann (thermal), and Unruh-Hawking (gravitational) distributions from the same mechanism (Theorem G.1.9.6).

5. **Foundation for Gravity:** The modular Hamiltonian framework connects to the entanglement first law, providing the thermodynamic foundation for deriving Einstein's equations (Section G.1.9.6).

Together with the entropy unification of Section P.6.5, this establishes that the entire statistical structure of physics—both equilibrium properties (entropy) and approach to equilibrium (probability)—emerges from the same foundational elements: SPAP, Landauer, and PCE. The two unifications are summarized in the following correspondence:

| Entropy Unification (P.6.5) | Probability Unification (G.1.9) |
|-----------------------------|--------------------------------|
| SPAP entropy $\varepsilon = \ln 2$ | Irreducible cycle cost |
| Shannon entropy $H$ | State distinguishability |
| Thermodynamic entropy $dS = \delta Q/T$ | Boltzmann distribution |
| von Neumann entropy $S(\rho)$ | Born rule |
| Bekenstein-Hawking entropy $S_{BH}$ | Unruh-Hawking distribution |

The complete derivation chain from foundational principles to physical probability is:

$$
\boxed{
\text{SPAP} \xrightarrow{\text{Thm 31}} \varepsilon = \ln 2 \xrightarrow{\text{Thm Z.1}} a = 2 \xrightarrow{\text{Def 15a}} \tau^* \xrightarrow{\text{PCE}} \text{Detailed Balance} \xrightarrow{\mathcal{C}} \rho^*_{\mathcal{C}} = Z^{-1}e^{-K^*(\mathcal{C})}
}
$$

The apparent diversity of probability measures in physics—quantum, thermal, gravitational—reflects not different foundations but different constraint geometries $\mathcal{C}$ within a unified framework of ND-RID equilibration to Gibbs fixed points.

### G.1.9.10 Topological Origin of the Factor $2\pi$

The factor $2\pi$ appears throughout the framework: holonomy quantization (Theorem Q.0.4), Unruh temperature (Theorem G.1.9.6), Bohr-Sommerfeld conditions (Proposition Q.0.9), and phase coherence. This section establishes their common topological origin in the $U(1)$ structure selected by PCE optimization.

**Proposition G.1.9.10a (Unified Topological Source of $2\pi$).** *The factor $2\pi$ appearing in the framework's quantization conditions arises from the topology of the circle $S^1 \cong U(1)$, whose fundamental group $\pi_1(S^1) = \mathbb{Z}$ enforces single-valuedness constraints on quantum amplitudes.*

*Proof.*

**Part A (Holonomy Quantization).** Theorem Q.0.4 establishes that for closed paths $\gamma$ in configuration space:
$$\oint_\gamma \sum_i \varepsilon_i = 2\pi k, \quad k \in \mathbb{Z}$$

This follows from single-valuedness of the amplitude $e^{i\mathcal{S}/\hbar}$. For any closed loop $\gamma$, single-valuedness requires $e^{i\oint_\gamma d\mathcal{S}/\hbar} = 1$, hence $\oint_\gamma d\mathcal{S}/\hbar \in 2\pi\mathbb{Z}$. The factor $2\pi$ is the circumference of $S^1$ in the standard parametrization.

**Part B (Unruh Temperature).** Theorem G.1.9.6 identifies the horizon modular Hamiltonian as $K^*_{\text{horizon}} = (2\pi/\kappa) K_{\text{boost}}$, following from the Bisognano-Wichmann theorem. In Rindler coordinates covering the right wedge $x > |t|$, the boost Killing vector generates orbits that become periodic with period $2\pi/\kappa$ under analytic continuation to imaginary time $t \to -i\tau$. This periodicity is topological: Euclidean Rindler space has polar geometry with angular period $2\pi$.

**Part C (Bohr-Sommerfeld).** Proposition Q.0.9 derives $\oint p\,dq = nh$ with $h = 2\pi\hbar$ from interference conditions on closed orbits. The quantization in units of $2\pi\hbar$ rather than $\hbar$ reflects winding number interpretation: classical orbits wind once around phase space, accumulating $2\pi$ radians of phase. QED

**Corollary G.1.9.10b (SPAP-Topological Ratio).** *The ratio $2\pi/\varepsilon = 2\pi/\ln 2 \approx 9.065$ determines the number of minimum-cost SPAP cycles per quantum of orbital action.*

*Proof.* From the Action-Entropy Identity (Corollary Q.0.1), action in units of $\hbar$ equals total SPAP entropy: $\mathcal{S}/\hbar = \sum_i \varepsilon_i$. At the SPAP minimum, each cycle contributes $\varepsilon = \ln 2$ nats (Theorem 31). For one Bohr-Sommerfeld quantum $\mathcal{S} = h = 2\pi\hbar$:
$$N_{\text{cycles}} = \frac{2\pi\hbar/\hbar}{\ln 2} = \frac{2\pi}{\ln 2} \approx 9.065$$
QED

**Remark G.1.9.10c: Complementary Roles of $\varepsilon$ and $2\pi$.** The quantities $\varepsilon = \ln 2$ and $2\pi$ operate in complementary domains:

| Quantity | Domain | Origin | Role in Framework |
|:---------|:-------|:-------|:------------------|
| $\varepsilon = \ln 2$ | Measure-theoretic | SPAP logical merge (Theorem 31) | Irreducible information cost |
| $2\pi$ | Topological | $\pi_1(U(1)) = \mathbb{Z}$ | Phase quantization period |

Neither is derivable from the other. The measure-theoretic entropy $\varepsilon$ counts distinguishable states; the topological factor $2\pi$ enforces consistency under cyclic evolution. Their ratio $2\pi/\ln 2$ characterizes the computational depth of one action quantum.

**Remark G.1.9.10d: Connection to Modular Flow.** The KMS condition (Theorem G.1.9.5) characterizes equilibrium states with respect to modular flow $\sigma_t(A) = e^{iK^* t} A e^{-iK^* t}$ at inverse temperature $\beta = 1$. On the active subspace, $K^*|_{\mathcal{A}} = (\ln 2)\cdot I_2$ (Theorem G.1.9.4), so the modular Hamiltonian eigenvalue is $\ln 2$. The ratio $2\pi/\ln 2 \approx 9.065$ appearing in Corollary G.1.9.10b characterizes the action-entropy conversion: one topological quantum of phase ($2\pi$) corresponds to $2\pi/\ln 2$ units of SPAP entropy.

### G.8.7 Mode-Polarization Correspondence

**Definition G.8.7a (Gauge Polarization Space).** In $D = 4$ spacetime, each massless gauge boson has $n_{\mathrm{pol}} = D - 2 = 2$ transverse polarizations. The total gauge polarization space has dimension:

$$\dim(\mathcal{P}_{24}) = \dim(\mathfrak{g}_{\mathrm{SM}}) \times n_{\mathrm{pol}} = 12 \times 2 = 24$$

**Theorem G.8.7b (Mode-Polarization Bijection).** There exists a canonical metric-preserving bijection:

$$\Phi: \mathcal{M}_{24} \xrightarrow{\sim} \mathcal{P}_{24}$$

where $\mathcal{M}_{24}$ is the 24-dimensional space of QFI-active interface modes (Theorem Z.5) and $\mathcal{P}_{24}$ is the 24-dimensional space of physical gauge polarizations.

*Construction.* Define $\Phi$ by:

$$\Phi(X_{\alpha\beta}) = T_{[\alpha,\beta]} \otimes e_1, \quad \Phi(Y_{\alpha\beta}) = T_{[\alpha,\beta]} \otimes e_2$$

where $T_{[\alpha,\beta]}$ is the gauge generator indexed by the pair $(\alpha, \beta) \in A \times B$, and $\{e_1, e_2\}$ is the orthonormal basis of polarization space $\mathbb{R}^2$.

*Proof.* Both $g_{\mathrm{QFI}}$ on $\mathcal{M}_{24}$ and the natural metric on $\mathcal{P}_{24}$ equal $I_{24}$ (Theorem Z.5). The map $\Phi$ is linear, bijective by dimension counting, and preserves inner products. ∎

**Theorem G.8.7c (Critical Identity).** At the PCE-optimal configuration:

$$a = D - 2$$

where $a = 2$ is the Landauer active dimension (Theorem Z.1) and $D = 4$ is the emergent spacetime dimension (Theorem Z.11).

*Proof.* From Theorem Z.1, PPI-optimality with Landauer cost $\varepsilon = \ln 2$ selects active dimension $a = 2$. From Theorem Z.11, the mode-channel correspondence $M = K(D)$ with $M = 24$ uniquely selects $D = 4$. Therefore $D - 2 = 4 - 2 = 2 = a$.

This equality holds specifically at the PCE-optimal point. Checking alternatives:

| $\varepsilon$ | $a$ | $b = 8 - a$ | $M = 2ab$ | $D$ from $K(D) = M$ | $a = D-2$? |
|:-------------:|:---:|:-----------:|:---------:|:-------------------:|:----------:|
| $\ln 2$ | 2 | 6 | 24 | 4 | ✓ |
| $\ln 3$ | 3 | 5 | 30 | — | ✗ |
| $\ln 1.5$ | — | — | — | — | ✗ |

Only the unique solution $(\varepsilon, a, b, M, D) = (\ln 2, 2, 6, 24, 4)$ exists, and it satisfies $a = D - 2$. ∎

**Remark G.8.7d: Interpretation.** The identity $a = D - 2$ connects thermodynamic irreversibility (the Landauer pointer requires 2 distinguishable states) to relativistic gauge theory (massless vectors have 2 transverse polarizations). This is "accidental necessity"—necessary because no other consistent configuration exists.

**Table G.8.7 (Factor Correspondence).**

| Factor | Source ($\mathcal{M}_{24}$) | Target ($\mathcal{P}_{24}$) | Value |
|:-------|:----------------------------|:----------------------------|:-----:|
| Complex pairs | $ab$ | Gauge generators $n_G$ | 12 |
| Real components | 2 | Polarizations $n_{\mathrm{pol}}$ | 2 |
| Total | $2ab$ | $n_G \times n_{\mathrm{pol}}$ | 24 |

**Proposition G.8.7e (Golay-Lagrangian Correspondence).** The Golay code dimension $k = 12$ equals the Lagrangian dimension $ab = 12$. The correspondence is:

- 12 signal modes ↔ one Lagrangian subspace $L$
- 12 parity modes ↔ complementary Lagrangian $L'$

*Proof.* PCE isotropy at the attractor (Theorem Z.5) implies equal costs per mode. The optimal rate balancing information and redundancy is $R = 1/2$, giving $k = M/2 = 12$ (Theorem Z.13). The 12 signal modes span a subspace requiring joint estimability ($\omega = 0$ on all pairs), which is exactly the isotropic condition (Definition G.8.2d). The Golay code self-duality $\mathcal{G}_{24} = \mathcal{G}_{24}^\perp$ reflects the symmetric relationship between complementary Lagrangian subspaces. ∎

**Theorem G.8.7f (Canonicity).** The bijection $\Phi$ is canonical—it involves no arbitrary choices.

*Proof.* The partition $(a, b) = (2, 6)$ is uniquely determined by $\varepsilon = \ln 2$ (Theorem Z.1). The Grassmannian $\mathrm{Gr}(2, 8)$ has a unique compatible complex structure (Appendix P). The Golay code selects a unique (up to equivalence) Lagrangian subspace (Theorem Z.13). The SM gauge algebra is the unique 12-dimensional algebra satisfying all physical constraints (Theorem G.8.4b). The little group $SO(2)$ in $D = 4$ acts on the 2-dimensional transverse polarization plane via its defining representation. All ingredients are uniquely determined by framework constraints. ∎

## G.10 Emergence of Spinor Structure from SPAP Logic

The preceding sections derived the gauge structure of the Standard Model from PCE optimization on the MPU Hilbert space. This section completes the derivation by establishing that matter fields necessarily transform as spinors under the emergent Lorentz group. The derivation draws on results from Appendix N (mass-information equivalence), Appendix O (temporal structure), and Appendix Z (Landauer partition). The spinor structure is not postulated but emerges from the $\mathbb{Z}_2$ involution inherent in the SPAP update cycle (Theorem 10) when physically instantiated on the minimal active kernel via the Principle of Physical Instantiation (PPI, Definition P.6.2).

## G.10.1 The SPAP $\mathbb{Z}_2$ Structure

### G.10.1.1 The Logical Involution

**Definition G.10.1 (SPAP Involution).** The core logical operation of the Self-Referential Paradox of Accurate Prediction (SPAP, Theorem 10) is the reflexive update:
$$
\phi_{t+1} = \text{NOT}(\hat{\phi}_t) \tag{G.10.1}
$$
where $\hat{\phi}_t$ is the stored prediction. The NOT operation defines a $\mathbb{Z}_2$ involution $\iota: \{0,1\} \to \{0,1\}$ satisfying $\iota^2 = \text{id}$.

This involution is the logical foundation of the entire framework. The SPAP update rule $\phi_{t+1} = \text{NOT}(\hat{\phi}_t)$ operates on binary states $\phi \in \{0,1\}$, and NOT is the unique non-trivial involution on this set, generating the cyclic group $\mathbb{Z}_2 = \{e, \iota\}$ with $\iota \circ \iota = e$.

**Lemma G.10.1 (Irreducibility of $\mathbb{Z}_2$).** The $\mathbb{Z}_2$ structure of the SPAP involution cannot be reduced to the trivial group.

*Proof.* Suppose the SPAP update could be implemented with $\iota = \text{id}$. Then $\phi_{t+1} = \hat{\phi}_t$, and the system would achieve perfect self-prediction, contradicting Theorem 10 (Deterministic SPAP). The diagonalization argument (Appendix A.1, Theorem A.1.1) establishes that any predictor $P_f$ applied to the diagonal system $S_{diag}$ with rule $\phi_{t+1} = \text{NOT}(\hat{\phi}_{P_f})$ yields a contradiction: $\hat{\phi} = \text{NOT}(\hat{\phi})$. Therefore, the non-trivial involution $\iota \neq \text{id}$ is logically necessary for any system possessing Property R (Definition 10). ∎

### G.10.1.2 Connection to Landauer Cost

The $\mathbb{Z}_2$ structure directly generates the irreducible entropy cost $\varepsilon = \ln 2$ (Theorem 31). By Lemma Z.2 (Appendix Z), the physical instantiation of the SPAP cycle implements a 2-to-1 logical state merge: the input space $\{0,1\} \times \{0,1\}$ (state and prediction registers) maps to output space $\{0,1\} \times \{p_{\text{ready}}\}$, compressing 4 states to 2. This state-space structure follows from the operational requirement that the prediction register must reset to a determinate ready state before each new cycle can commence. Specifically, the cycle map $G_{\text{cycle}}: (\phi_t, p_t) \mapsto (\phi_{t+1}, p_{t+1})$ satisfies:
- Input: 4 distinct logical states $\{(0,0), (0,1), (1,0), (1,1)\}$
- Output: 2 distinct logical states $\{(0, p_{\text{ready}}), (1, p_{\text{ready}})\}$

Landauer's principle [Landauer 1961] requires minimum entropy production for any logically irreversible operation mapping $N$ input states to $M$ output states:
$$
\Delta S_{\text{env}}^{(\min)} = k_B \ln(N/M)
$$
For the SPAP merge with $N = 4$, $M = 2$:
$$
\varepsilon = \ln\left(\frac{4}{2}\right) = \ln 2 \text{ nats} \tag{G.10.2}
$$

This establishes the chain: $\text{SPAP} \xrightarrow{\mathbb{Z}_2} \varepsilon = \ln 2$.

---

## G.10.2 Physical Instantiation of the Involution

### G.10.2.1 The Active Kernel Dimension

**Theorem G.10.2 (Unitary Realization of SPAP Involution).** The Principle of Physical Instantiation (PPI, Definition P.6.2) requires the logical involution $\iota$ to be realized as a unitary operator on the active kernel $\mathcal{H}_a \cong \mathbb{C}^a$ with $a = 2$ (Theorem Z.1). The PCE-optimal realization satisfying $U_\iota^2 = I$ is:
$$
U_\iota = \sigma_x = \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix} \tag{G.10.3}
$$
up to unitary equivalence.

*Proof.*

**Step 1 (Active kernel dimension from PPI).** By Theorem Z.1, the irreducible Landauer cost $\varepsilon = \ln 2$ (Theorem 31) requires physical instantiation on a subsystem whose entropy capacity can accommodate the Landauer cost. The von Neumann entropy of a state on an $a$-dimensional space satisfies $S(\rho) \le \ln a$ [von Neumann 1932]. Admissibility requires $\ln a \ge \varepsilon$; since $a \in \mathbb{N}$, PPI-optimality selects the minimal admissible value:
$$
a = 2 \tag{G.10.4}
$$
This is the "Landauer Pointer"—the minimal 2-dimensional active kernel within the $d_0 = 8$ MPU Hilbert space (Theorem 23).

**Step 2 (Unitarity requirement).** PPI requires the logical operation to preserve the Hilbert space structure. The involution must therefore be realized as a unitary operator $U_\iota \in U(2)$ acting on $\mathcal{H}_a \cong \mathbb{C}^2$.

**Step 3 (Involution constraint).** The logical requirement $\iota^2 = \text{id}$ translates to $U_\iota^2 = e^{i\theta} I$ for some phase $\theta$. In the SPAP context, the computational basis $\{|0\rangle, |1\rangle\}$ is physically defined by the state register encoding—these are not abstract mathematical states but correspond to distinguishable physical configurations of the prediction apparatus. The requirement that the NOT operation maps between these physically distinguished basis states, combined with $\iota^2 = \text{id}$ at the logical level, constrains $U_\iota^2 = I$ (rather than a general phase).

**Step 4 (Non-triviality).** By Lemma G.10.1, $U_\iota \neq I$. Combined with $U_\iota^2 = I$, the operator must have eigenvalues $\{+1, -1\}$ with at least one of each.

**Step 5 (PCE selection).** Among Hermitian unitaries with eigenvalues $\pm 1$ on $\mathbb{C}^2$, PCE (Definition 15) selects the operator that directly implements the swap $|0\rangle \leftrightarrow |1\rangle$ in the computational basis defined by the SPAP register. This is precisely $\sigma_x$, which achieves the logical NOT with minimal circuit complexity (single gate, depth 1).

**Step 6 (Uniqueness up to basis choice).** Any Hermitian unitary with eigenvalues $\pm 1$ on $\mathbb{C}^2$ is unitarily equivalent to $\sigma_z = \text{diag}(1, -1)$, hence also to $\sigma_x = V\sigma_z V^\dagger$ where $V$ is the Hadamard gate. In the computational basis defined by the SPAP register, $\sigma_x$ is the canonical choice implementing NOT. The PCE-Attractor state $\tau^* = \frac{I_2}{2} \oplus 0_6$ (Equation G.1.9.3) provides the canonical basis in which $\sigma_x$ is the natural realization. ∎

---

## G.10.3 Emergence of SU(2) as Active Kernel Symmetry

**Theorem G.10.3 (SU(2) as Active Kernel Symmetry Group).** The symmetry group of the active kernel $\mathcal{H}_a \cong \mathbb{C}^2$, constrained by PCE and the SPAP involution structure, is SU(2).

*Proof.*

**Step 1 (Physical equivalence under phase).** On density matrices $\rho$, the action of $U \in U(2)$ is $\rho \mapsto U\rho U^\dagger$. For any $U$ and phase $e^{i\phi}$, we have $(e^{i\phi}U)\rho(e^{i\phi}U)^\dagger = U\rho U^\dagger$. The overall U(1) phase factor is therefore physically unobservable—it does not affect any measurable prediction. PCE (Definition 15) penalizes redundant degrees of freedom that provide no predictive benefit. Since U(2) ≅ (SU(2) × U(1))/Z₂, the subgroup SU(2) $\subset$ U(2) captures all physically distinguishable transformations while eliminating the redundant global phase degree of freedom.

**Step 2 (Generator structure).** The SPAP involution $U_\iota = \sigma_x$ generates a $\mathbb{Z}_2$ subgroup of SU(2). The complete Lie algebra $\mathfrak{su}(2)$ is spanned by:
$$
\mathfrak{su}(2) = \text{span}_{\mathbb{R}}\{i\sigma_x, i\sigma_y, i\sigma_z\} \tag{G.10.5}
$$
where the Pauli matrices satisfy the commutation relations $[\sigma_i, \sigma_j] = 2i\epsilon_{ijk}\sigma_k$.

**Step 3 (Completeness for prediction).** The predict-verify-update cycle (Definition 4) requires the ability to prepare arbitrary predictions on $\mathcal{H}_a$. By standard quantum control theory [D'Alessandro 2007], complete controllability on $\mathbb{C}^2$ requires the full SU(2) action: the Lie algebra generated by any two non-commuting elements of $\mathfrak{su}(2)$ is all of $\mathfrak{su}(2)$, and the corresponding group acts transitively on the space of pure states (the Bloch sphere). The $\mathbb{Z}_2$ subgroup generated by $\sigma_x$ alone cannot reach states like $|+\rangle = (|0\rangle + |1\rangle)/\sqrt{2}$ from $|0\rangle$.

**Step 4 (Minimality).** SU(2) is the minimal connected Lie group that: (i) contains the SPAP involution, (ii) acts transitively on pure states of $\mathbb{C}^2$, and (iii) eliminates the physically redundant U(1) phase. SU(2) acts transitively on the Bloch sphere $S^2 \cong \text{SU}(2)/\text{U}(1)$, which parametrizes pure states. Any smaller group would fail transitivity; any larger group would contain redundant transformations violating PCE. ∎

---

## G.10.4 The Double Cover and Spinor Representation

### G.10.4.1 SU(2) as Double Cover of SO(3)

**Theorem G.10.4 (Double Cover Structure).** The group SU(2) is the universal double cover of SO(3):
$$
1 \to \mathbb{Z}_2 \to \text{SU}(2) \xrightarrow{\pi} \text{SO}(3) \to 1 \tag{G.10.6}
$$
with $\ker(\pi) = \{I, -I\}$.

*Proof.* This is a standard result in Lie theory [Hall 2015]. The homomorphism $\pi: \text{SU}(2) \to \text{SO}(3)$ is given by the adjoint action: for $U \in \text{SU}(2)$ and $\vec{v} \in \mathbb{R}^3$ identified with the traceless Hermitian matrix $V = \vec{v} \cdot \vec{\sigma}$, define $\pi(U)$ by $U V U^\dagger = (\pi(U)\vec{v}) \cdot \vec{\sigma}$. Both $U$ and $-U$ yield the same rotation, so $\ker(\pi) = \{I, -I\} \cong \mathbb{Z}_2$. ∎

### G.10.4.2 Spinor Sign Flip Under 2π Rotation

**Corollary G.10.4.1 (Spinor Structure from Active Kernel Symmetry).** Fields transforming under the fundamental representation of the active kernel symmetry group SU(2) are spinors: they acquire a sign flip under $2\pi$ rotation.

*Proof.* Let $|\psi\rangle \in \mathcal{H}_a \cong \mathbb{C}^2$ transform under $U \in \text{SU}(2)$. A rotation by angle $\theta$ about axis $\hat{n}$ is implemented by:
$$
U(\theta, \hat{n}) = \exp\left(-\frac{i\theta}{2} \hat{n} \cdot \vec{\sigma}\right) \tag{G.10.7}
$$
For $\theta = 2\pi$:
$$
U(2\pi, \hat{n}) = \exp(-i\pi \hat{n} \cdot \vec{\sigma}) = -I \tag{G.10.8}
$$
using the identity $(\hat{n} \cdot \vec{\sigma})^2 = I$ and the matrix exponential $e^{-i\pi A} = \cos(\pi)I - i\sin(\pi)A = -I$ for any matrix $A$ with $A^2 = I$ [Sakurai & Napolitano 2017]. Thus $|\psi\rangle \mapsto -|\psi\rangle$ under $2\pi$ rotation, which is the defining property of a spinor. ∎

**Remark G.10.1: Causal Chain from SPAP $\mathbb{Z}_2$ to Spinor $\mathbb{Z}_2$.** The $\mathbb{Z}_2$ structure appears at two distinct points in the derivation chain: first as the logical involution of SPAP ($\iota: \phi \mapsto \text{NOT}(\phi)$), and second as the kernel $\{I, -I\}$ of the double cover $\pi: \text{SU}(2) \to \text{SO}(3)$. These are mathematically distinct objects—the SPAP $\mathbb{Z}_2$ acts on the logical states $\{0, 1\}$ via negation, while the double cover $\mathbb{Z}_2$ acts on the active kernel $\mathbb{C}^2$ by scalar multiplication. However, these two $\mathbb{Z}_2$ structures are *connected through necessary implication* in the derivation chain established in this appendix:

1. The SPAP logical involution (Definition G.10.1) determines the 2-to-1 merge structure (Lemma Z.2)
2. This merge structure determines $\varepsilon = \ln 2$ via Landauer's principle (Theorem 31)
3. PPI-optimality selects the minimal admissible subsystem dimension $a = 2$ (Theorem Z.1)
4. PCE selects SU(2) as the symmetry group of this 2-dimensional active kernel (Theorem G.10.3)
5. SU(2) inherently possesses center $\{I, -I\} \cong \mathbb{Z}_2$ and is the universal double cover of SO(3)

The complete causal chain is therefore:
$$
\text{SPAP } \mathbb{Z}_2 \xrightarrow{\text{Landauer}} \varepsilon = \ln 2 \xrightarrow{\text{PPI}} a = 2 \xrightarrow{\text{PCE}} \text{SU}(2) \xrightarrow{\text{Lie theory}} \ker(\pi) = \mathbb{Z}_2
$$

The spinor sign flip under $2\pi$ rotation is thus ultimately traceable to the logical structure of self-referential prediction: the SPAP $\mathbb{Z}_2$ necessarily implies (through this derivation chain) the spinor $\mathbb{Z}_2$, even though they act on different mathematical objects.

---

## G.10.5 Lorentzian Extension to Spin(1,3)

**Theorem G.10.5 (Emergence of Spin(1,3)).** The combination of the SU(2) structure on the active kernel (Theorem G.10.3) with the temporal direction required for prediction (Theorem O.3) extends to the spin group Spin(1,3), the double cover of the Lorentz group SO$^+(1,3)$.

*Proof.*

**Step 1 (Temporal direction from prediction).** By Theorem O.3 (The Arrow of Time), prediction requires a distinguished temporal direction: prediction precedes verification precedes update. This causal ordering defines the arrow of time (Appendix O) and establishes a temporal asymmetry that must be incorporated into the symmetry structure.

**Step 2 (Lorentz algebra structure).** The proper orthochronous Lorentz group SO$^+(1,3)$ has Lie algebra $\mathfrak{so}(1,3)$ of dimension 6, spanned by three rotation generators $J_i$ and three boost generators $K_i$. The complexification satisfies [Weinberg 1995; Hall 2015]:
$$
\mathfrak{so}(1,3)_{\mathbb{C}} \cong \mathfrak{sl}(2,\mathbb{C}) \oplus \mathfrak{sl}(2,\mathbb{C}) \tag{G.10.9}
$$
where we use the isomorphism $\mathfrak{su}(2)_{\mathbb{C}} \cong \mathfrak{sl}(2,\mathbb{C})$. Defining $\vec{N}^\pm = \frac{1}{2}(\vec{J} \pm i\vec{K})$, these satisfy two independent $\mathfrak{su}(2)$ algebras: $[N_i^+, N_j^+] = i\epsilon_{ijk}N_k^+$, $[N_i^-, N_j^-] = i\epsilon_{ijk}N_k^-$, and $[N_i^+, N_j^-] = 0$. The real Lorentz algebra is recovered by taking the real form with $\vec{J} = \vec{N}^+ + \vec{N}^-$ (Hermitian) and $\vec{K} = -i(\vec{N}^+ - \vec{N}^-)$ (anti-Hermitian).

**Step 3 (Universal cover).** The universal cover of the proper orthochronous Lorentz group SO$^+(1,3)$ is:
$$
\text{Spin}(1,3) \cong \text{SL}(2,\mathbb{C}) \tag{G.10.10}
$$
with the double cover projection $\pi: \text{SL}(2,\mathbb{C}) \to \text{SO}^+(1,3)$. The kernel $\ker(\pi) = \{I, -I\} \cong \mathbb{Z}_2$ coincides with the rotation case.

**Step 4 (Embedding of spatial structure).** The restriction of SL(2,$\mathbb{C}$) to unitary elements recovers SU(2):
$$
\text{SL}(2,\mathbb{C}) \cap U(2) = \text{SU}(2) \tag{G.10.11}
$$
This corresponds to the spatial rotation subgroup. The SPAP involution $\sigma_x \in \text{SU}(2) \subset \text{SL}(2,\mathbb{C})$ embeds naturally into the Lorentzian structure. ∎

**Definition G.10.2 (Weyl Spinors).** A left-handed Weyl spinor is a field $\psi_L$ transforming under the $(\frac{1}{2}, 0)$ representation of SL(2,$\mathbb{C}$), corresponding to the fundamental representation of the first $\mathfrak{sl}(2,\mathbb{C})$ factor with the second acting trivially. A right-handed Weyl spinor $\psi_R$ transforms under $(0, \frac{1}{2})$. A Dirac spinor combines both: $\Psi = (\psi_L, \psi_R)^T$.

---

## G.10.6 The Spinor-Mass Correspondence

### G.10.6.1 Mass from Active Kernel Processing

**Theorem G.10.6 (Fundamental Fermion Mass from Active Kernel Processing).** Fundamental fermionic fields carrying non-zero rest mass necessarily transform as spinors under the emergent Lorentz group.

*Proof.*

**Step 1 (Mass from relational information).** By Theorem N.5 (Mass-Information Equivalence, Appendix N), rest mass for fundamental matter is determined by relational information content:
$$
m = \frac{\mathcal{I}_{\text{rel}}}{2\sqrt{8\varepsilon}} \cdot m_P \approx 0.212 \cdot \mathcal{I}_{\text{rel}} \cdot m_P \tag{G.10.12}
$$
where $\varepsilon = \ln 2$ (Theorem 31), $m_P = \sqrt{\hbar c/G}$ is the Planck mass, and $\mathcal{I}_{\text{rel}}$ quantifies the system's predictive correlations with the network.

**Step 2 (Relational information requires active kernel processing).** The relational information $\mathcal{I}_{\text{rel}}$ for fundamental matter fields is maintained through the SPAP cycle, which necessarily involves processing on the active kernel $\mathcal{H}_a \cong \mathbb{C}^2$. The irreversible entropy cost $\varepsilon = \ln 2$ per cycle (Theorem 31, Appendix J) is incurred on this 2-dimensional subsystem. By Corollary N.4.1 (Appendix N), the entropy flow rate maintaining $\mathcal{I}_{\text{rel}}$ is:
$$
\frac{d\mathcal{S}}{d\tau} = \frac{\mathcal{I}_{\text{rel}}}{2\tau_{\text{min}}} \tag{G.10.13}
$$
where $\tau_{\text{min}} = \sqrt{8\varepsilon} \cdot t_P$ is the temporal discretization scale (Theorem Q.6.1).

**Step 3 (Active kernel fields transform under SU(2)).** Fields encoding information on the active kernel $\mathcal{H}_a$ transform under the symmetry group SU(2) $\subset$ Spin(1,3) (Theorems G.10.3, G.10.5). By Corollary G.10.4.1, such fields are spinors.

**Step 4 (Conclusion for fundamental fermions).** Fundamental fermionic matter fields—those whose mass arises from direct participation in the SPAP-processed relational information—necessarily transform as spinors. ∎

**Remark G.10.3: Scope of Theorem G.10.6.** This theorem applies to *fundamental fermions* whose mass originates from the relational information mechanism of Theorem N.5. It does not apply to:
- **Composite particles** (e.g., protons, neutrons) whose mass arises predominantly from QCD binding energy
- **Scalar bosons** (e.g., the Higgs) whose mass arises from the scalar potential
- **Gauge bosons** which acquire mass through symmetry breaking mechanisms

The Higgs boson, for instance, is massive and spin-0; its mass arises from the Higgs potential $V(\phi) = -\mu^2|\phi|^2 + \lambda|\phi|^4$, not from direct active kernel processing in the sense of Theorem N.5.

### G.10.6.2 Gauge Boson Masslessness

**Corollary G.10.6.1 (Gauge Boson Masslessness at Tree Level).** Gauge bosons, transforming in the adjoint representation of the gauge group rather than the fundamental representation of the active kernel, are massless prior to symmetry breaking.

*Proof.* The adjoint representation of SU($N$) has dimension $N^2 - 1$. For SU(2), $\dim(\text{adj}) = 3 \neq 2 = \dim(\text{fund})$. Gauge fields transform under the adjoint representation of their respective gauge groups (SU(3)$_C$, SU(2)$_L$, U(1)$_Y$), not the fundamental representation of the active kernel SU(2). They therefore do not directly encode SPAP-processed relational information in the sense of Theorem N.5 and have $\mathcal{I}_{\text{rel}} = 0$ at tree level. By Equation (G.10.12), $m = 0$.

Mass acquisition via the Higgs mechanism involves coupling to the electroweak symmetry breaking sector. The Higgs doublet transforms under SU(2)$_L$, and its vacuum expectation value breaks this symmetry, enabling the W and Z bosons to acquire mass through the standard Brout-Englert-Higgs mechanism while the photon remains massless. ∎

---

## G.10.7 The Spin-Statistics Connection

### G.10.7.1 Fermi-Dirac Statistics from Spinor Structure

**Theorem G.10.7 (Pauli Exclusion from Spinor Structure).** Identical spinor fields obey Fermi-Dirac statistics with antisymmetric multi-particle wavefunctions:
$$
\Psi(x_1, x_2) = -\Psi(x_2, x_1) \tag{G.10.14}
$$

*Proof.*

**Step 1 (Exchange and rotation in configuration space).** Consider two identical particles in $\mathbb{R}^3$. The configuration space with coincident points removed is $(\mathbb{R}^3 \times \mathbb{R}^3 \setminus \Delta)/S_2$ where $\Delta$ is the diagonal and $S_2$ is the permutation group. For the relative coordinate $\vec{r} = \vec{x}_1 - \vec{x}_2$, the exchange $\vec{x}_1 \leftrightarrow \vec{x}_2$ corresponds to $\vec{r} \mapsto -\vec{r}$, which is homotopic to a $\pi$ rotation of particle 1 about particle 2 followed by a $\pi$ rotation of particle 2 about the center of mass. In the covering space, this corresponds to a $2\pi$ rotation acting on the internal degrees of freedom [Finkelstein & Rubinstein 1968; Berry & Robbins 1997].

**Step 2 (Spinor phase under exchange).** By Corollary G.10.4.1, spinor fields acquire a phase factor of $(-1)$ under $2\pi$ rotation (Equation G.10.8). The spin-statistics connection follows from the requirement that the total wavefunction be single-valued on the physical configuration space.

**Step 3 (Antisymmetry).** The wavefunction for two identical spinors therefore satisfies:
$$
\Psi(x_2, x_1) = (-1) \cdot \Psi(x_1, x_2) = -\Psi(x_1, x_2) \tag{G.10.15}
$$

**Step 4 (Exclusion principle).** Setting $x_1 = x_2$ in Equation (G.10.15) yields $\Psi(x, x) = -\Psi(x, x)$, which implies $\Psi(x, x) = 0$. Two identical spinors cannot occupy the same quantum state. ∎

This result is consistent with the spin-statistics theorem of axiomatic quantum field theory [Streater & Wightman 1964; Pauli 1940], which is recovered in the emergent AQFT framework (Theorem F.2, Appendix F).

**Remark G.10.2: PCE Interpretation of Spin-Statistics.** Theorem G.10.7 derives the spin-statistics connection from the topological structure of configuration space combined with the spinor transformation property. An independent, information-theoretic perspective is provided in Appendix F, Proposition F.2, which establishes that Fermi-Dirac statistics minimize aggregate predictive complexity $C_{agg}$ for multi-particle configurations of half-integer spin fields. The antisymmetric wavefunction eliminates redundant configuration-space volume by enforcing the Pauli exclusion constraint automatically, reducing the effective Hilbert space dimension from $d_{int}^N$ to $\binom{d_{int}}{N}$. Both derivations—the topological (Theorem G.10.7) and the PCE-based (Proposition F.2)—arrive at the same conclusion through complementary routes, reinforcing the consistency of the framework.

---

## G.10.8 Summary: The Complete Derivation Chain

**Table G.10.1: Derivation Chain from SPAP to Spinor Structure**

| Step | Result | Origin | Status | Reference |
|:----:|:-------|:-------|:------:|:----------|
| 1 | $\iota^2 = \text{id}$, $\iota \neq \text{id}$ | SPAP logical structure | Derived | Theorem 10, Lemma G.10.1 |
| 2 | $\varepsilon = \ln 2$ | Landauer + 2-to-1 merge | Derived | Theorem 31, Lemma Z.2 |
| 3 | $a = 2$ | PPI-optimality | Derived | Theorem Z.1 |
| 4 | $U_\iota = \sigma_x \in U(2)$ | Unitary realization | Derived | Theorem G.10.2 |
| 5 | SU(2) symmetry | PCE + completeness | Derived | Theorem G.10.3 |
| 6 | Double cover SU(2) → SO(3) | Lie theory | Recovered | Theorem G.10.4 |
| 7 | Spinor representation | $2\pi \to -1$ | Recovered | Corollary G.10.4.1 |
| 8 | Spin(1,3) $\cong$ SL(2,$\mathbb{C}$) | Temporal extension | Derived | Theorem G.10.5 |
| 9 | Fundamental fermions spinorial | $\mathcal{I}_{\text{rel}}$ on active kernel | Derived | Theorem G.10.6 |
| 10 | Gauge bosons massless | Adjoint $\neq$ fundamental | Derived | Corollary G.10.6.1 |
| 11 | Fermi-Dirac statistics | Configuration space topology | Recovered | Theorem G.10.7 |

**Status Legend:**
- **Derived:** Novel result following from framework axioms
- **Recovered:** Known mathematical result reproduced within the framework

The complete derivation chain is:

$$
\boxed{
\text{SPAP} \xrightarrow{\mathbb{Z}_2} \varepsilon = \ln 2 \xrightarrow{\text{PPI}} a = 2 \xrightarrow{\text{PCE}} \text{SU}(2) \xrightarrow{\text{time}} \text{Spin}(1,3) \xrightarrow{} \textbf{Spinors} \xrightarrow{\mathcal{I}_{\text{rel}}} \textbf{Mass}
} \tag{G.10.16}
$$

**Corollary G.10.8.1 (Unified Origin of Fermionic Matter).** The existence of massive fermionic matter is not a contingent feature of our universe but a direct consequence of self-referential predictive logic operating under finite resource constraints. The $\mathbb{Z}_2$ structure of SPAP, when physically instantiated via PPI and optimized under PCE, generates both the spinor representation (determining transformation properties) and the mass-information correspondence (determining dynamical properties for fundamental fermions).


**Note:** The spinor derivation (Section G.10) depends on Theorem N.5 from Appendix N for the mass-information correspondence. The logical chain from SPAP to spinors (Sections G.10.1–G.10.5) is self-contained within this appendix.

## G.11 Conclusion

This appendix has demonstrated how the Predictive Universe framework derives fundamental structures of modern physics from the Prediction Optimization Problem (POP, Axiom 1) and the Principle of Compression Efficiency (PCE, Definition 15):

1. **Quantum Probability:** The Born rule (Theorem G.1.7) and complex Hilbert space structure (Theorem G.1.8) emerge from PCE-enforced non-contextuality and Gleason's theorem, grounding quantum measurement in optimal predictive resource allocation.

2. **Gauge Structure:** U(1) electromagnetism arises as the minimal PCE-optimal mechanism for maintaining predictive coherence across local phase freedom (Section G.7). The full Standard Model gauge group $SU(3) \times SU(2) \times U(1)$ emerges from the thermodynamically optimal $\mathbb{C}^2 \oplus \mathbb{C}^6$ partition of the MPU Hilbert space (Section G.8).

3. **Spacetime Dimension:** $D = 4$ is uniquely selected by the mode-channel correspondence $M = K(D)$, where the 24 QFI interface modes match the kissing number $K(4) = 24$ (Theorem Z.11).

4. **Three Generations:** Anomaly cancellation, CP violation requirements, and $E_8$ geometric constraints uniquely minimize the generation potential at $N_g = 3$ (Appendix R, Propositions R.3.5, R.4.2).

5. **Fine-Structure Constant:** The value $\alpha_{em}^{-1} = 137.036092 \pm 0.000050$ emerges as the unique PCE-optimal equilibrium balancing U(1) coherence costs against predictive information rates (Section G.9), with the calculation reduced to evaluation of operational functionals on the MPU baseline cycle.

6. **Unified Probability Measures:** Quantum (Born), thermal (Boltzmann), and gravitational (Unruh-Hawking) probability distributions arise from a common mechanism—ND-RID equilibration to Gibbs fixed points under PCE optimization (Section G.1.9).

These results ground the quantum measurement framework, gauge interactions, spacetime dimensionality, and fundamental constants in the unified logic and resource economics of prediction. Quantitative predictions are further constrained by the alphabet identities of Appendix W.

---

*Note:* For $d = 2$, the Born rule follows either from embedding within the MPU's $d_0 \geq 8$ space or from decision-theoretic arguments [Deutsch 1999]; we rely primarily on the Gleason route given $d_0 \geq 8$ (Theorem 23).
