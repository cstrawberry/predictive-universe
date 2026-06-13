# Appendix A: Core Logic, Computation Limits, and Property R

## A.0 Foundations of Computational Richness

### A.0.1 Overview: Two Complementary Foundations

The **Self-Referential Paradox of Accurate Prediction (SPAP, Theorems A.1.1, A.1.3)** and **Reflexive Undecidability (RUD, Theorems A.2.3, A.2.4)** require that predictive systems possess sufficient computational richness, formally captured by **Property R** (Definition 10). This appendix establishes Property R through two mutually supporting foundations:

*   **Foundation I: Logical Necessity (§A.0.2)** — Property R follows necessarily from the predictive structure of consciousness itself. Any system capable of prediction and verification must possess computational capacity as a matter of logical structure, independent of physical implementation details.
*   **Foundation II: Physical Instantiation (§A.0.3–A.0.5)** — The MPU framework, operating under POP/PCE dynamics with ND-RID interactions, necessarily implements Property R through:
    1.  Individual MPUs possessing minimal structural capacity ($K_0 = 3$ bits, §A.0.3)
    2.  Network dynamics converging to configurations supporting reliable computation (§A.0.4)
    3.  Compositional emergence of full computational universality (§A.0.5)

These foundations are complementary, not redundant. The logical foundation establishes *why* computational capacity must exist; the physical foundation demonstrates *how* it manifests in resource-constrained systems. Together, they provide a complete, non-circular account ensuring the applicability of SPAP and RUD to physical predictive systems.

#### Foundational Definitions Recap:

**Summary of Definition 10 (Property R - Computational Richness):** A formal model class $\mathcal{M}$, used by predictive systems $S$, possesses Property R relative to a consistent formal logical system $\mathcal{F}$ (e.g., Peano Arithmetic) if models $M \in \mathcal{M}$ and the associated formalism provide the machinery to:
1.  **Represent:** Encode system states $s$, models $M$ (e.g., via Gödel numbering $\ulcorner M \urcorner$), predictions $\hat{s}$, and computational processes as objects manipulable within $\mathcal{F}$.
2.  **Simulate/Reason:** Simulate the execution of any model $M \in \mathcal{M}$ applied to a state $s$, or formally reason about this process within $\mathcal{F}$, subject to fundamental computational limits.
3.  **Evaluate Predicates:** Represent and evaluate logical formulas within $\mathcal{F}$ concerning the behavior, output, or predictive accuracy of models in $\mathcal{M}$, including self-referential predicates.

**Summary of Definition 23 (MPU):** Fundamental unit operating at complexity $C_{\text{op}} \geq K_0 \equiv B_3$ (Theorem 15, Corollary 3). MPUs possess Hilbert space $\mathcal{H}_0$ with $\dim(\mathcal{H}_0) \geq 8$ (Theorem 23) and operate via dual dynamics: Internal Prediction ($P_{\text{int}}$, Definition 26) and 'Evolve'/ND-RID interaction (Definition 27).

**Recall of Definition A.2.2 (ND-RID):** Non-Deterministic Reflexive Interaction Dynamics govern the MPU 'Evolve' process, characterized by probabilistic outcomes $P(o|x,y)$ and state transitions $P(x'|x,y,o)$. Fundamentally irreversible ($\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$, Theorem 31) and contractive: when the ND-RID update contains a nonzero input-independent refresh component, Lemma E.1 gives $f_{\text{RID}}<1$.

### A.0.2 Foundation I: Logical Necessity from Predictive Structure

> **Methodological Note:** This section establishes computational capacity as a logical necessity arising from the structure of prediction itself, independent of physical implementation details. Physical realization under resource constraints is addressed subsequently in §A.0.3-A.0.5.

The capacity for universal computation is not contingent on physical details but follows necessarily from the operational requirements of prediction and verification. This derivation, grounded in the **Predictionism** developed in Appendix P.3.4, establishes Property R as logically prior to any physical considerations.

**Proposition A.0.1 (Binary Verification Necessity)**
The verification function $V(r)$, which assesses whether a prediction about state $r$ matches reality, is necessarily binary: the prediction either matches (1) or does not match (0). This structure is intrinsic to the verification operation, not a convention.

*Proof (foundational route).* Consider the foundational self-referential verification of the Cogito: "I exist as a thinking entity." Any attempt to verify this proposition as false is self-refuting—the act of verification itself constitutes thinking, thereby confirming existence. The verification outcome is necessarily determinate: either verified (1) or not verified (0). No intermediate state is logically coherent for this self-referential verification. The same binary structure applies universally: the verification of any prediction $P$ about state $r$ produces a binary outcome, since verification is comparison between anticipated and observed states, which necessarily yields match or mismatch. □

**Remark A.0.1.1 (Finite-Protocol Acceptance-Cut Characterization).** The same binary structure has a direct finite-protocol form, which makes the role of multi-valued protocol data explicit. Let $R$ be the finite response set of a prediction protocol and let $A\subseteq R$ be the retained acceptance set determined by the protocol's stated tolerance, resolution, or success condition. The update predicate is the characteristic map
$$
V_A:R\to\{0,1\},
\qquad
V_A(r)=
\begin{cases}
1,&r\in A,\\
0,&r\notin A.
\end{cases}
$$
Confidence scores, distances, likelihoods, and multi-valued diagnostics may be part of the protocol data, but the retained update step uses the binary predicate $V_A$ obtained by applying the protocol's acceptance cut. If no such retained acceptance cut exists, the protocol has produced a score but not a verification predicate for the prediction-update loop.

*Proof of the structural form.* A finite-response prediction protocol returns an element $r\in R$. To update a model by verification, the protocol must decide whether the returned response counts as success for the prediction under the protocol's retained tolerance. This is exactly the choice of an acceptance subset $A\subseteq R$. The induced decision map is the characteristic function $V_A=\mathbf 1_A$, whose codomain is $\{0,1\}$. Conversely, every binary verification predicate on $R$ is the characteristic function of its acceptance set
$$
A=V^{-1}(\{1\}).
$$
Thus the binary structure of Proposition A.0.1 is not an added physical convention; it is the finite-response decision form required for a verification predicate to enter the prediction-update loop. The Cogito-route proof establishes the binary structure foundationally; the acceptance-cut characterization records the same structure as the finite-protocol decision map and makes explicit how multi-valued protocol data reduce to the binary update predicate. ∎

**Proposition A.0.2 (Boolean Operations from Verification)**
The binary verification structure necessarily generates complete Boolean operations:
1.  **Negation (NOT):** The capacity to distinguish verification (1) from non-verification (0) directly implements logical negation: $V(\neg S(r)) = 1 - V(S(r))$.
2.  **Conjunction (AND):** Sequential verification of multiple predictions requires all constituents to succeed: $V(S_1(r) \wedge S_2(r)) = \min(V(S_1(r)), V(S_2(r)))$.
3.  **Disjunction (OR):** Alternative predictions implement disjunction: $V(S_1(r) \vee S_2(r)) = \max(V(S_1(r)), V(S_2(r)))$.

*Proof.* These operations formalize the operational structure of prediction:
*   **NOT:** The fundamental binary distinction in verification ("matches" vs. "does not match") directly implements negation. If $V(S(r)) = 1$ (prediction verified), then $V(\neg S(r)) = 0$ (negation not verified), and vice versa.
*   **AND:** Compound predictions consisting of sub-predictions $S_1, S_2$ are verified only if both constituents are verified. If either fails ($V = 0$), the compound fails. This is captured by $\min(V_1, V_2) = 1$ iff both $V_1 = 1$ and $V_2 = 1$.
*   **OR:** When entertaining alternative predictions, overall success requires at least one alternative be verified. The disjunction succeeds ($V = 1$) if $V(S_1) = 1$ or $V(S_2) = 1$ (or both), captured by $\max(V_1, V_2)$. □

**Logical Infrastructure of Prediction**

The derivation of universal computation from functional completeness requires making explicit three structural features that any persistent predictive system operating over time must possess. These are not additional postulates about physics but rather explicit Logical-Structural Assumptions characterizing what the predictive cycle entails:

1.  **Composition Closure:** If a system can verify prediction A and verify prediction B, it can verify compound predictions ("A and B," "A or B"). More generally, complex predictions are built compositionally from simpler components, with outputs of one verification serving as inputs to subsequent ones. This is inherent to structured prediction—models compose.
2.  **Logical Memory:** Predictions from cycle $t$ inform cycle $t+1$. The system must maintain internal state across cycles, storing intermediate verification results for reuse. Without memory, there is no "learning" or model updating—no predictive cycle at all.
3.  **Uniform Specification:** Models exhibit systematic, rule-based structure rather than arbitrary associations. The relationships between sub-predictions follow patterns that can be represented and manipulated formally, enabling the system to reason about its own predictive processes.

These features characterize the minimal logical infrastructure for sustained, adaptive prediction. They are not separate from the predictive structure but rather make explicit what the fundamental predictive cycle (Definition 4) requires to operate across time.

**Theorem A.0.1 (Functional Completeness and Explicit Turing Simulation)**

The set $\{\mathrm{NOT},\mathrm{AND},\mathrm{OR}\}$ is functionally complete. Given the Logical-Structural Assumptions of composition closure, logical memory, and uniform specification, the resulting predictive model class can simulate every finite-time computation of a Turing machine by an explicitly constructed Boolean circuit family. Thus the theorem uses a direct simulation construction, not the Church-Turing thesis as a proof step.

*Proof.* Functional completeness is standard: every Boolean function
$$
f:\{0,1\}^n\to\{0,1\}
$$
has the disjunctive normal form
$$
f(x_1,\ldots,x_n)
=
\bigvee_{a\in f^{-1}(1)}
\bigwedge_{j=1}^n \ell_{a,j}(x_j),
$$
where
$$
\ell_{a,j}(x_j)=
\begin{cases}
x_j,&a_j=1,\\
\neg x_j,&a_j=0.
\end{cases}
$$
Hence every Boolean function is implemented using only NOT, AND, and OR.

Let $M$ be a Turing machine with finite state set $Q$, tape alphabet $\Gamma$, and transition function
$$
\delta:Q\times\Gamma\to Q\times\Gamma\times\{-1,+1\}.
$$
Fix a time bound $T$. During the first $T$ steps, only the tape cells in an interval of length at most $2T+1$ can be visited. Encode the bounded configuration at time $t$ by a finite bit string
$$
c_t\in\{0,1\}^{L(T,M)}
$$
containing the state, head position, and symbols in the visited interval. The transition table of $M$ determines a Boolean next-configuration map
$$
F_{M,T}:\{0,1\}^{L(T,M)}\to\{0,1\}^{L(T,M)}
$$
such that
$$
c_{t+1}=F_{M,T}(c_t)
$$
for every valid bounded configuration. Because $F_{M,T}$ is a Boolean function, the first paragraph gives a finite NOT/AND/OR circuit $C_{M,T}$ computing it.

Composition closure permits iteration of the same uniformly specified next-step circuit. Logical memory stores $c_t$ and the intermediate gate outputs. Uniform specification supplies the finite rule by which $C_{M,T}$ is generated from the transition table of $M$ and the time bound $T$. Therefore the predictive model class contains, for every $M$ and $T$, a finite circuit computing the first $T$ steps of $M$. Allowing the resource parameter $T$ to vary gives a uniform finite-time simulation family.

This proves the required computational richness directly: every bounded computation of every Turing machine is represented by a finite prediction-verification circuit in the model class, and the unbounded model family is obtained by increasing the retained memory and composition depth. ∎

**Corollary A.0.1 (Property R from the Uniform Predictive Model Class)**
Any uniform predictive model class satisfying the Logical-Structural Assumptions and allowing arbitrarily large finite memory and composition depth possesses Property R relative to any formal arithmetic $\mathcal F$ capable of coding finite bit strings, circuits, and bounded computations.

*Proof.* By Theorem A.0.1, for every Turing machine $M$ and finite time bound $T$, the model class contains a uniformly specified Boolean circuit that simulates the first $T$ steps of $M$. A standard Gödel coding in $\mathcal F$ represents finite bit strings, circuit descriptions, machine descriptions, and bounded execution histories. Thus the model class can:

1. represent states, model descriptions, predictions, and computation histories by finite codes;
2. simulate or reason about any finite bounded computation by the circuit family of Theorem A.0.1;
3. evaluate bounded predicates about outputs, failures, and prediction accuracy by composing the corresponding Boolean predicate circuit with the simulation circuit.

For unbounded predicates, Property R requires the representability of the relevant partial computation and its finite proof/search stages, not completion of an undecidable infinite search. Therefore the uniform predictive model class has the representational, simulation, and predicate-evaluation machinery required by Definition 10. ∎

**Significance:** This derivation is independent of the Self-Referential Paradox of Accurate Prediction. Property R is established before SPAP is invoked, providing a non-circular foundation. The logical sequence is:

$$
\text{Predictive structure} + \text{Logical-Structural Assumptions} \to \text{Property R} \to \text{SPAP} \to K_0 = 3 \text{ bits} \to \text{MPU structure}
$$

Property R does not depend on physical structures it helps derive. This logical foundation applies to any conscious predictive system that satisfies the above structural assumptions, regardless of physical substrate, establishing computational capacity as a universal feature of consciousness.

### A.0.3 Foundation II: Minimal Physical Capacity

Having established Property R as a logical necessity, we now address how this abstract structure manifests in physical systems with finite resources.

**Proposition A.0.3 (MPUs Possess Minimal Self-Referential Capacity)**
Minimal Predictive Units, possessing complexity $C_{\text{op}} \geq K_0 \equiv B_3$ (Definition 23, Theorem 15), inherently contain the minimal structural complexity (equivalent to 3 bits or 8 distinguishable physical configurations) required to physically represent and logically process the core elements of self-referential computations, satisfying foundational aspects of Property R: basic representation and logical negation.

*Proof.* Theorem 15 (Section 5.2.2) establishes $K_0 \equiv B_3$ as the minimum complexity needed to implement the deterministic SPAP contradiction logic $\phi_{t+1} = \text{NOT}(\hat{\phi}_{P_f})$. This requires:
1.  Representing binary state $\phi \in \{0,1\}$
2.  Representing binary prediction $\hat{\phi} \in \{0,1\}$
3.  Executing the NOT operation
4.  Storing the result as next state $\phi_{t+1}$

A 3-bit system provides 8 distinguishable configurations ($2^3 = 8$), sufficient to encode these elements and manage the computational sequence without destructive overwriting (Section 5.2.2, Theorem 15 demonstrates fewer than 8 configurations are insufficient). Since MPUs operate at $C_{\text{op}} \geq K_0$, they possess at least this structural capacity within their physical state space (related to $\dim(\mathcal{H}_0) \geq 8$, Theorem 23).

However, this minimal capacity is insufficient for full Property R. The ability to represent arbitrary computations, simulate complex models, and evaluate predicates requires greater resources, which emerge through network composition (§A.0.5). □

**Role in Physical Instantiation:** The horizon constant $K_0 = 3$ bits does not create Property R—Property R exists by logical necessity (§A.0.2). Rather, $K_0$ specifies the minimum physical structure required to *instantiate* the most basic self-referential computation. This establishes MPUs as the fundamental physical units capable of participating in the predictive cycle.

### A.0.4 Emergence of Reliable Computation from POP/PCE Optimization

While $K_0$ ensures intrinsic structural capacity, reliable execution of complex computational sequences required for SPAP and RUD, despite inherent noise of ND-RID interactions ($\varepsilon > 0$, $f_{\text{RID}} < 1$), emerges dynamically from optimization principles governing the MPU network.

The dynamics are governed by the **Prediction Optimization Problem (POP, Axiom 1)** and **Principle of Compression Efficiency (PCE, Definition 15)**, realized as stochastic gradient flow minimizing the PCE Potential $V(x)$ (Definition D.1, Appendix D). Effective prediction requires computation, often complex and self-referential. PCE mandates these computations be performed reliably and efficiently, minimizing contributions to $V(x)$ from operational costs ($V_{\text{op}}$), propagation costs ($V_{\text{prop}}$), and error-induced performance loss (reduced $V_{\text{benefit}}$).

**Definition A.0.1 (Effective Operational Property R)**
Effective Operational Property R is the capability of the MPU network, resulting dynamically from POP/PCE optimization, to execute the specific classes of representational, simulation/reasoning, and predicate evaluation tasks required for SPAP (Theorems A.1.1, A.1.3) and RUD (Theorems A.2.3, A.2.4) diagonalization arguments with error probability per logical step $p_{\text{err}}^*$, where $p_{\text{err}}^*$ is the unique minimizer of the PCE-derived error-related potential $V_{\text{tot}}(p_{\text{err}}) = V_{\text{rel}}(p_{\text{err}}) + V_{\text{err}}(p_{\text{err}})$. This ensures that for computations of finite logical depth $T$, the probability of successful execution is sufficiently high for the logical proofs to apply.

**Definition A.0.1q (QEC Compatibility Certificate $\mathfrak C_{\mathrm{QEC}}$).** A QEC compatibility certificate is a finite forward-locked record
$$
\mathfrak C_{\mathrm{QEC}}
=
(\mathcal N_{\mathrm{phys}},\;\mathcal C_{\mathrm{code}},\;\mathcal I_{\mathrm{FT}},\;p_{\mathrm{err},0},\;p_{\mathrm{th}},\;\Delta V_{\mathrm{QEC}},\;\text{locality window},\;\text{forward lock})
$$
where $\mathcal N_{\mathrm{phys}}$ is the retained physical noise model on the MPU links in the protected window, $\mathcal C_{\mathrm{code}}$ is an implementable finite code family, $\mathcal I_{\mathrm{FT}}$ is the fault-tolerant instrument/overhead ledger for the required gates and syndrome processing, and
$$
0<p_{\mathrm{err},0}<p_{\mathrm{th}}
$$
is certified for that noise model and code family. The PCE-selection entry $\Delta V_{\mathrm{QEC}}<0$ records that the predictive-performance gain from correction dominates the coding, syndrome, and recovery overhead on the protected computation window. The Appendix Z/Golay structure may serve as a code witness only when the finite syndrome maps, recovery maps, and threshold comparison are included in $\mathfrak C_{\mathrm{QEC}}$. Finite ND-RID range supports the locality entry on strict finite-range branches, but arbitrary correlated or adversarial noise is not covered without its own noise-model record.

**Definition A.0.1q.1 (Golay-QEC Bootstrap Record $\mathfrak C_{\mathrm{GQEC}}$).** A Golay-QEC bootstrap record is a finite forward-locked record
$$
\mathfrak C_{\mathrm{GQEC}}
=
(\mathfrak G_{24},\mathfrak P_{23},\mathcal N_{\mathrm{loc}},\mathcal S_{\mathrm{syn}},\mathcal R_{\mathrm{rec}},\mathcal I_{\mathrm{FT}},p_{\mathrm{err},0},p_{\mathrm{th}},\Delta V_{\mathrm{GQEC}},\mathfrak O_{\mathrm{GQEC}},\text{forward lock})
\tag{A.0.1q.1}
$$
where $\mathfrak G_{24}$ is the accepted predictive-recovery MacWilliams Golay branch of Theorem Z.13b, $\mathfrak P_{23}$ is a retained puncture and CSS witness of Proposition Z.13b.7, $\mathcal N_{\mathrm{loc}}$ is the protected-window local noise model on the bounded-degree MPU network, $\mathcal S_{\mathrm{syn}}$ and $\mathcal R_{\mathrm{rec}}$ are implementable finite syndrome-extraction and recovery maps, $\mathcal I_{\mathrm{FT}}$ is the protected gate and overhead ledger, and
$$
0<p_{\mathrm{err},0}<p_{\mathrm{th}}
\tag{A.0.1q.2}
$$
is certified for that physical noise model, code family, and recovery implementation. The overlap audit $\mathfrak O_{\mathrm{GQEC}}$ proves that the Golay interface code, MPU gate inventory, recovery instruments, threshold theorem import, and SPAP/RUD protected computation window are projections of the same retained branch. The record may discharge $\mathfrak C_{\mathrm{QEC}}$ only on the protected windows it covers.

**Theorem A.0.2a (Golay Bootstrap Discharges the QEC Certificate on Covered Branches).** If $\mathfrak C_{\mathrm{GQEC}}$ is accepted, then it supplies an accepted QEC compatibility certificate $\mathfrak C_{\mathrm{QEC}}$ for the protected network family and computation windows covered by the record. The resulting closure has fixed-point status:
$$
K_0=3,
\quad d_0=8,
\quad M=24
\Longrightarrow
\mathcal G_{24}
\Longrightarrow
[[23,1,7]]\ \text{CSS witness}
\Longrightarrow
\mathfrak C_{\mathrm{QEC}}
\Longrightarrow
\text{Effective Operational Property R on covered windows}.
\tag{A.0.2a.1}
$$
This is not a primitive-axiom derivation of QEC compatibility and does not assert a universal numerical threshold. It says that, once the downstream Golay branch and the finite physical recovery/threshold records are accepted, the former QEC assumption is discharged for those windows by an internally generated code witness plus the recorded physical implementation data.

*Proof.* Proposition Z.13b.7 supplies a dual-containing Golay CSS code witness. The local-noise, syndrome, recovery, gate, overhead, threshold, and PCE-benefit entries of $\mathfrak C_{\mathrm{GQEC}}$ are exactly the entries required by Definition A.0.1q. Mapping them into the slots of $\mathfrak C_{\mathrm{QEC}}$ gives the certificate. The fixed-point display records dependency order: the Golay witness is derived downstream of the finite MPU/Golay branch, while the reliability claim is promoted only after the physical recovery and threshold records are added. ∎

**Corollary A.0.2b (Transversal-Gate Guardrail).** On any finite stabilizer-code realization used by $\mathfrak C_{\mathrm{GQEC}}$, transversal Clifford operations or other product-form encoded gates do not constitute a universal fault-tolerant gate set by themselves. A universal protected computation ledger must therefore include a non-transversal, injected, distilled, adaptive, or otherwise certified completion inside $\mathcal I_{\mathrm{FT}}$. The corresponding positive non-transversal overhead is consistent with the strict floor $p_{\mathrm{err}}^*>0$ of Theorem A.0.3 rather than a contradiction of it.

*Proof.* A finite-distance quantum code cannot obtain a universal encoded gate set from transversal/product gates alone under the Eastin-Knill obstruction. Therefore the protected gate ledger must record the additional resource that completes the gate set. Theorem A.0.3 already states that the PCE optimum is not zero-error at zero overhead, so the required overhead is an expected finite-cost entry rather than a new postulate. ∎

**Theorem A.0.2 (PCE Dynamically Enforces Effective Property R)**
Under the framework's core axioms (POP, PCE, ND-RID dynamics), the refresh-branch implementation condition of Lemma A.0.1, an accepted QEC compatibility certificate $\mathfrak C_{\mathrm{QEC}}$ (Definition A.0.1q), supplied directly or through an accepted Golay-QEC bootstrap record $\mathfrak C_{\mathrm{GQEC}}$ (Definition A.0.1q.1; Theorem A.0.2a), and Dominant Cost Convexity, the PCE optimization dynamics drive the scalar error-rate parameter to an optimal value where:
1.  The optimal error rate per logical operation $p_{\mathrm{err}}^*>0$ exists; it is unique under Dominant Cost Convexity and satisfies robustness conditions ($p_{\mathrm{err}}^*<1/2$ for sufficiently large protected computation windows) required for noise-robust SPAP (Theorems A.1.2, A.1.4) and RUD (Theorems A.2.3, A.2.4).
2.  The MPU network effectively possesses Operational Property R for the finite representational, simulation/reasoning, predicate-evaluation, logical-memory, finite-composition, Boolean post-processing, and bounded diagonal-wrapper tasks whose working-memory, QEC-overhead, and circuit-execution resources are supplied by the network family.
**Proof Structure.** The derivation proceeds through four stages:

**Stage 1: Baseline Error is Strictly Positive**
ND-RID Implementation of Logical Gates: A logical gate $G_{\text{logic}}$ is realized by a sequence of elementary ND-RID channels. The ideal error-free implementation corresponds to unitary $\mathcal{U}_{\text{ideal}}$. The actual physical channel is the composition $\mathcal{E}_{\text{actual}} = \mathcal{E}_{N_k} \circ \cdots \circ \mathcal{E}_{N_1}$.

**Lemma A.0.1 (Contractivity of Composite Refresh-Branch Channel):** Suppose the uncorrected physical implementation of a nontrivial logical gate contains elementary ND-RID channels
$$
\mathcal E_{N_1},\ldots,\mathcal E_{N_k}
$$
and at least one retained elementary step lies on the refresh/minorization branch of Lemma E.1. That is, for each retained step there is a trace-distance Lipschitz factor $f_j\le1$, and for at least one index $j_*$,
$$
f_{j_*}<1.
$$
Then the composite channel
$$
\mathcal E_{\mathrm{actual}}
=
\mathcal E_{N_k}\circ\cdots\circ\mathcal E_{N_1}
$$
has contraction factor
$$
f_{\mathrm{actual}}
\le
\prod_{j=1}^k f_j
<
1.
$$

*Proof.* For any density operators $\rho,\sigma$,
$$
D_{\mathrm{tr}}(\mathcal E_{N_j}(\rho),\mathcal E_{N_j}(\sigma))
\le
f_jD_{\mathrm{tr}}(\rho,\sigma).
$$
Applying this inequality successively gives
$$
D_{\mathrm{tr}}(\mathcal E_{\mathrm{actual}}(\rho),\mathcal E_{\mathrm{actual}}(\sigma))
\le
\left(\prod_{j=1}^k f_j\right)D_{\mathrm{tr}}(\rho,\sigma).
$$
Since at least one factor is strictly smaller than $1$ and all factors are at most $1$, the product is strictly smaller than $1$. ∎

**Definition A.0.2 (Baseline Logical Gate Error):** The inherent error probability of uncorrected implementation relative to the ideal gate is
$$
p_{\mathrm{err},0}
:=
\sup_{\rho_{\mathrm{in}}}
\frac12
\left\|
\mathcal E_{\mathrm{actual}}(\rho_{\mathrm{in}})
-
\mathcal U_{\mathrm{ideal}}(\rho_{\mathrm{in}})
\right\|_1.
\tag{A.0.2}
$$

**Theorem A.0.3 (Strictly Positive Baseline Error on the Refresh-Branch Implementation):** If the uncorrected implementation satisfies Lemma A.0.1, then
$$
p_{\mathrm{err},0}>0.
$$

*Proof.* The ideal unitary channel $\mathcal U_{\mathrm{ideal}}$ is a trace-distance isometry:
$$
D_{\mathrm{tr}}(\mathcal U_{\mathrm{ideal}}(\rho),\mathcal U_{\mathrm{ideal}}(\sigma))
=
D_{\mathrm{tr}}(\rho,\sigma)
$$
for all $\rho,\sigma$. By Lemma A.0.1, $\mathcal E_{\mathrm{actual}}$ is strictly contractive with factor $f_{\mathrm{actual}}<1$. Therefore $\mathcal E_{\mathrm{actual}}$ cannot equal $\mathcal U_{\mathrm{ideal}}$ as a channel.

If $p_{\mathrm{err},0}=0$, then
$$
\mathcal E_{\mathrm{actual}}(\rho)
=
\mathcal U_{\mathrm{ideal}}(\rho)
$$
for every density operator $\rho$. Density operators affinely span the real vector space of Hermitian trace-one operators, and their differences span the traceless Hermitian operators. By linearity, equality on all density operators implies equality of the two channels on the full operator space, contradicting the preceding paragraph. Hence some input state has nonzero output trace distance, and the supremum in (A.0.2) is strictly positive. ∎

**Stage 2: Cost of Achieving Reliability**
Reducing error rate below baseline requires implementing error correction protocols, incurring complexity costs.

**Proposition A.0.4 (Complexity Overhead Lower Bound):** Under QEC Compatibility, the complexity overhead $C_{\text{err}}$ required to suppress error rate from $p_{\text{err},0}$ to $p_{\text{err}}$ is bounded below logarithmically:
$$
C_{\text{err}}(p_{\text{err}}) \geq A \ln\left(\frac{p_{\text{err},0}}{p_{\text{err}}}\right) \quad \text{(A.0.3)}
$$
where $A = A(d) > 0$ depends on code structure and noise locality.
*Justification.* Under the Assumption of QEC Compatibility ($p_{\text{err},0}<p_{\text{th}}$ with sufficiently local noise and implementable fault-tolerant constructions), standard fault-tolerant schemes suppress logical error exponentially in an effective distance/level parameter while the corresponding overhead grows at least linearly in that parameter, yielding a logarithmic dependence of required overhead on the target $p_{\text{err}}$. The following self-contained redundancy bound provides an explicit witness of the same functional form in a simplified setting; full quantum error correction achieves the same (often stronger) suppression under the assumed locality below threshold [Gottesman 1998; Fowler et al. 2012].

**Lemma A.0.4a (Logarithmic Redundancy for Majority-Vote Decoding).**
Suppose a logical operation is implemented by $N$ statistically independent elementary attempts, each failing with probability $p_{\text{err},0} < \tfrac12$. Let the logical decoder output the majority result (assume $N$ odd). Then the logical failure probability
$$
p_{\text{err}}^{(N)} \;\le\; \exp\!\bigl(-2(\tfrac12-p_{\text{err},0})^{2}N\bigr). \qquad \text{(A.0.3a)}
$$
Consequently, to achieve $p_{\text{err}}^{(N)} \le p_{\text{err}}$ it suffices to take
$$
N \;\ge\; \frac{1}{2(\tfrac12-p_{\text{err},0})^{2}}\,\ln\!\frac{1}{p_{\text{err}}}. \qquad \text{(A.0.3b)}
$$

*Proof.* Let $X_i\in\{0,1\}$ indicate failure of attempt $i$, so $\mathbb E[X_i]=p_{\text{err},0}$ and $S_N=\sum_{i=1}^N X_i$ counts failures. Majority decoding fails iff $S_N\ge \frac{N+1}{2}$, which is the event $\{S_N\ge N/2\}$ because $S_N$ is integer-valued and $N$ is odd. Write $\mu=\mathbb E[S_N]=Np_{\text{err},0}$. Then
\[
\{S_N\ge N/2\}=\{S_N-\mu\ge N(\tfrac12-p_{\text{err},0})\}.
\]
Hoeffding's inequality for independent $X_i\in[0,1]$ gives, for $t>0$,
\[
\mathbb P(S_N-\mu\ge t)\le \exp\!\left(-\frac{2t^2}{N}\right) \quad\text{[Hoeffding 1963]}.
\]
Setting $t=N(\tfrac12-p_{\text{err},0})$ yields (A.0.3a). Solving $\exp(-2(\tfrac12-p_{\text{err},0})^{2}N)\le p_{\text{err}}$ gives (A.0.3b). □

**Remark A.0.4b (From Redundancy to Overhead).**
If each attempt costs at least a constant resource $c_0$ (time, space, or energy), then the total overhead satisfies $C_{\text{err}}(p_{\text{err}})\ge c_0 N$. Combining with (A.0.3b) implies
\[
C_{\text{err}}(p_{\text{err}})\;\ge\; \frac{c_0}{2(\tfrac12-p_{\text{err},0})^{2}}\,\ln\!\frac{1}{p_{\text{err}}}.
\]
Since $\ln(1/p_{\text{err}})\ge \ln(p_{\text{err},0}/p_{\text{err}})$ for $p_{\text{err},0}\le 1$, this implies $C_{\text{err}}(p_{\text{err}})\ge A\ln(p_{\text{err},0}/p_{\text{err}})$ with $A=c_0/[2(\tfrac12-p_{\text{err},0})^{2}]$, recovering the functional form of (A.0.3). □

**Definition A.0.3 (Reliability Cost Contribution):** The cost of added complexity contributes to PCE potential via physical operational cost function $R(C)$ (Definition 3):
$$
V_{\text{rel}}(p_{\text{err}}) := \lambda R(C_{\text{err}}(p_{\text{err}})) \approx \lambda r_p(T_{\text{eff}})\, \left[ A \ln\left(\frac{p_{\text{err},0}}{p_{\text{err}}}\right) \right]^{\gamma_p} \quad \text{(A.0.4)}
$$
where $\gamma_p>1$ and $r_p(T_{\text{eff}})>0$ (Definition 3a), with $T_{\text{eff}}$ treated as fixed in this appendix.

**Lemma A.0.2 (Divergence of Reliability Cost):** The marginal cost of improving reliability diverges as perfect reliability is approached:
$$
V_{\text{rel}}'(p_{\text{err}}) = \lambda R'(C_{\text{err}}) \left( -\frac{A}{p_{\text{err}}} \right) < 0 \quad \text{(A.0.5)}
$$
with $\lim_{p_{\text{err}} \to 0} V_{\text{rel}}'(p_{\text{err}}) = -\infty$. □

**Stage 3: Penalty for Allowing Errors**
Errors degrade predictive performance, reducing benefit term $V_{\text{benefit}}$, equivalent to adding error penalty $V_{\text{err}}$.

**Theorem A.0.4 (Performance Degradation):** For computation involving $T$ logical gate applications, if each gate has failure probability at most $p_{\text{err}}$, then the success probability satisfies $P_{\text{succ}}\ge 1-Tp_{\text{err}}$ without assuming independence (Lemma A.0.4c). If failures are independent, the exact success probability is:
$$
P_{\text{succ}}(T, p_{\text{err}}) = (1 - p_{\text{err}})^T \approx \exp(-T p_{\text{err}}) \quad \text{(A.0.6)}
$$

**Lemma A.0.4c (Success Probability Lower Bound Without Independence).**
Let $F_t$ be the event that the $t$-th logical gate fails, with $\mathbb P(F_t)\le p_{\text{err}}$ for each $t=1,\dots,T$. Then
$$
P_{\text{succ}} \;=\; 1-\mathbb P\!\Bigl(\bigcup_{t=1}^T F_t\Bigr)\;\ge\; 1-\sum_{t=1}^T \mathbb P(F_t)\;\ge\; 1-Tp_{\text{err}}. \qquad \text{(A.0.6a)}
$$
If failures are independent, then $P_{\text{succ}}=(1-p_{\text{err}})^T$, which satisfies the standard exponential upper bound
$$
(1-p_{\text{err}})^T \;=\; \exp\!\bigl(T\ln(1-p_{\text{err}})\bigr)\;\le\;\exp(-Tp_{\text{err}}), \qquad \text{(A.0.6b)}
$$
since $\ln(1-p)\le -p$ for $p\in[0,1)$.

*Proof.* The lower bound is the union bound. The exponential bound follows from $\ln(1-p)\le -p$. □

**Definition A.0.4 (Effective Complexity):** Errors reduce effective complexity contributing to performance:
$$
C_{\text{eff}}(p_{\text{err}}) := C_{\text{alloc}} P_{\text{succ}}(T, p_{\text{err}}) = C_{\text{alloc}} (1 - p_{\text{err}})^T \quad \text{(A.0.7)}
$$

**Proposition A.0.5 (Error-Induced Benefit Loss):** The reduction in predictive performance due to errors creates effective penalty:
$$
V_{\text{err}}(p_{\text{err}}) := \Gamma_0 [PP(C_{\text{alloc}}) - PP(C_{\text{eff}}(p_{\text{err}}))] \quad \text{(A.0.8)}
$$
The marginal penalty is:
$$
V_{\text{err}}'(p_{\text{err}}) = \Gamma_0 T C_{\text{alloc}} PP'(C_{\text{eff}}) (1 - p_{\text{err}})^{T-1} > 0 \quad \text{(A.0.9)}
$$
for $p_{\text{err}} \in [0,1)$. □

**Stage 4: Optimal Error Rate**
PCE drives the system to minimize total error-related potential, balancing reliability costs and error penalties.

**Definition A.0.5 (Total Error Potential):**
$$
V_{\text{tot}}(p_{\text{err}}) := V_{\text{rel}}(p_{\text{err}}) + V_{\text{err}}(p_{\text{err}}) \quad \text{(A.0.10)}
$$
defined on $(0, p_{\text{err},0}]$.

**Theorem A.0.5 (Existence of an Optimal Error Rate; Uniqueness under Dominant Cost Convexity)**
There exists at least one value $p_{\text{err}}^* \in (0, p_{\text{err},0}]$ minimizing $V_{\text{tot}}(p_{\text{err}})$. If, in addition, the **Assumption of Dominant Cost Convexity** holds, then this minimizer is unique.

*Proof.*
*   **Continuity:** Both $V_{\text{rel}}$ and $V_{\text{err}}$ are continuous on $(0, p_{\text{err},0}]$ and $C^1$ on any closed subinterval $[\epsilon, p_{\text{err},0}]$ with $\epsilon>0$, under standard assumptions for $R(C)$ and $PP(C)$.
*   **Blow-up at $p_{\text{err}}\to 0^+$:** By Proposition A.0.4, $C_{\text{err}}(p_{\text{err}})=A\ln(p_{\text{err},0}/p_{\text{err}})\to\infty$ as $p_{\text{err}}\to 0^+$. By Definition 3a, $R(C)$ is unbounded as $C\to\infty$ (with $\gamma_p>1$), hence $V_{\text{rel}}(p_{\text{err}})=\lambda R(C_{\text{err}}(p_{\text{err}}))\to\infty$. Meanwhile $V_{\text{err}}(p_{\text{err}})\ge 0$ and remains bounded because $PP(C)$ is bounded on $[0, C_{\text{alloc}}]$ (Definition 7). Therefore $\lim_{p_{\text{err}}\to 0^+} V_{\text{tot}}(p_{\text{err}})=\infty$.
*   **Existence:** Since $V_{\text{tot}}(p_{\text{err},0})$ is finite and $V_{\text{tot}}(p_{\text{err}})\to\infty$ as $p_{\text{err}}\to 0^+$, there exists $\epsilon>0$ such that $V_{\text{tot}}(p_{\text{err}})>V_{\text{tot}}(p_{\text{err},0})$ for all $p_{\text{err}}\in(0,\epsilon]$. Restricting to the compact interval $[\epsilon, p_{\text{err},0}]$, Weierstrass' theorem implies $V_{\text{tot}}$ attains a minimum at some $p_{\text{err}}^*\in[\epsilon,p_{\text{err},0}]\subset(0,p_{\text{err},0}]$. If $p_{\text{err}}^*<p_{\text{err},0}$, then by differentiability on $(0,p_{\text{err},0})$ it satisfies the first-order condition $V_{\text{tot}}'(p_{\text{err}}^*)=0$.
*   **Uniqueness under Dominant Cost Convexity:** The second derivative is $V_{\text{tot}}''(p) = V_{\text{rel}}''(p) + V_{\text{err}}''(p)$. For $V_{\text{rel}}$:
    $$
    V_{\text{rel}}''(p) = \lambda [R''(C_{\text{err}}) (-A/p)^2 + R'(C_{\text{err}}) (A/p^2)] > 0
    $$
    provided $R'' \ge 0$ (convex costs, Definition 3) and $R' > 0$ for $C_{\text{err}} > 0$.
    Under the **Assumption of Dominant Cost Convexity** (the convexity of $R(C)$ dominates any potential concavity from $PP(C)$), we have $V_{\text{tot}}''(p) > 0$ everywhere, ensuring strict convexity and thus uniqueness of the minimum. □

**Corollary A.0.2 (Asymptotic Scaling of Optimal Error)**
In the regime where $p_{\text{err}}^*$ is small and $T$ is large, using the convex cost model of Definition 3a ($\gamma_p>1$) and treating $PP'(C_{\text{eff}})$ as slowly varying on the scale of the optimal perturbation, the interior first-order condition yields the implicit asymptotic relation:
$$
p_{\text{err}}^* \approx \frac{\lambda r_p(T_{\text{eff}})\, \gamma_p A^{\gamma_p}}{\Gamma_0 T C_{\text{alloc}} PP'(C_{\text{alloc}})} \left[\ln\left(\frac{p_{\text{err},0}}{p_{\text{err}}^*}\right)\right]^{\gamma_p-1} \quad \text{(A.0.11)}
$$
Thus, up to the slowly varying logarithmic factor, $p_{\text{err}}^* = \Theta((\ln T)^{\gamma_p-1}/T)$ as $T\to\infty$, and hence $p_{\text{err}}^* < 1/2$ for sufficiently large $T$. □

**Epistemic Status:** The derivation relies on:
1.  **QEC Compatibility Certificate $\mathfrak C_{\mathrm{QEC}}$ or Golay-QEC Bootstrap Record $\mathfrak C_{\mathrm{GQEC}}$:** The former QEC-compatibility assumption is a finite certificate gate. It must record the retained noise model, locality window, implementable code and recovery instruments, threshold inequality, and PCE benefit gap before the SPAP/RUD reliability claim is promoted. The Golay witness of Proposition Z.13b.7 supplies the code-theoretic part only when embedded in the physical syndrome/recovery/threshold record of Definition A.0.1q.1. It is not supplied by the existence of finite ND-RID links or by the abstract Golay code alone.
2.  **Dominant Cost Convexity:** Reasonable given Definition 3's superlinear resource costs for high reliability, but requires explicit verification for specific cost functions.

Alternative substrates or branches that fail the direct QEC certificate, the Golay-QEC bootstrap record, or Dominant Cost Convexity do not support the protected-computation version of Property R used by the noise-robust SPAP and RUD arguments.

### A.0.5 Network Composition and Full Property R

Individual MPUs possess minimal self-referential capacity ($K_0 = 3$ bits, §A.0.3) but lack resources for full Property R. Universal computation emerges through network composition.

**Proposition A.0.6 (Compositional Enhancement)**
For a network of $n$ MPUs with individual Hilbert spaces $\mathcal{H}_0 \cong \mathbb{C}^8$, the composite Hilbert space is $\mathcal{H}_{\text{composite}} = \mathcal{H}_0^{\otimes n} \cong \mathbb{C}^{8^n}$. The composite system's state space dimension grows exponentially: $\dim(\mathcal{H}_{\text{composite}}) = 8^n$.

*Proof.* Standard tensor product structure in quantum mechanics. □

This exponential growth provides resources for representing complex computations. A system of $n$ MPUs can represent $8^n$ distinguishable configurations, enabling encoding of arbitrarily large Gödel numbers, storage of intermediate results, and execution of deep circuits.

**Assumptions for Theorem A.0.6:** The following assumes either an accepted QEC compatibility certificate $\mathfrak C_{\mathrm{QEC}}$ for the protected network family (Definition A.0.1q) or an accepted Golay-QEC bootstrap record $\mathfrak C_{\mathrm{GQEC}}$ that discharges the same certificate entries (Definition A.0.1q.1; Theorem A.0.2a). It also assumes a universal protected gate ledger implementable via ND-RID channels and fault-tolerance threshold conditions for the recorded noise model and code family. The direct certificate or bootstrap record must supply the locality window, implementable syndrome/recovery instruments, baseline error $p_{\text{err},0}$, threshold $p_{\text{th}}$, and code-overhead ledger used in the theorem statement.

**Theorem A.0.6 (Conditional Network Universality with Explicit Overhead Scope)**
A network of $n$ MPUs, operating with error rate $p_{\text{err}}^*$ satisfying robustness conditions and with sufficient additional resources for working memory, error-correction overhead, and circuit execution, can realize full Property R. More precisely:
1.  **Representation:** For any Turing machine with $k$ states and $m$ tape symbols, a standard Gödel encoding of the transition table requires $L_{TM} = O(k \cdot m \cdot \log(k \cdot m))$ bits. A network of
    $$
    n \geq \left\lceil \frac{L_{TM}}{3} \right\rceil = O(k \cdot m \cdot \log(k \cdot m))
    $$
    MPUs (each providing 3 bits via $K_0$) provides the lower bound required to encode the machine description. This bound covers description storage only.
2.  **Simulation/Reason:** By the Solovay–Kitaev theorem [Kitaev 1997; Dawson & Nielsen 2006] and the accepted $\mathfrak C_{\mathrm{QEC}}$ for the retained noise model and code family, or an accepted $\mathfrak C_{\mathrm{GQEC}}$ discharging it on the protected window, the network can implement the protected finite gate approximations required by the target computation with the certified overhead. Since quantum computers efficiently simulate classical computation, the network can simulate any Turing machine once the required working-memory, code-overhead, and execution resources are available.
3.  **Evaluate Predicates:** Fault-tolerance ($p_{\text{err},0} < p_{\text{th}}$ inside $\mathfrak C_{\mathrm{QEC}}$, or inside $\mathfrak C_{\mathrm{GQEC}}$ when it discharges that certificate) ensures logical error rates can be suppressed to the certified target values with the recorded overhead, enabling reliable execution of the finite-depth predicate-evaluation circuits used in the noise-robust SPAP/RUD windows.

*Proof.* Representation capacity follows from exponential state space growth. The Gödel encoding of a $k$-state, $m$-symbol Turing machine transition table requires specifying for each of $k \cdot m$ pairs (state, symbol) the write symbol, move direction, and next state, requiring $O(k \cdot m \cdot \log(k \cdot m))$ bits total. With each MPU contributing 3 bits ($K_0$), the network requires $n = O(k \cdot m \cdot \log(k \cdot m))$ MPUs as a lower bound for machine-description storage. Simulation capability follows from the Solovay-Kitaev theorem guaranteeing any unitary approximation with polynomial gate overhead, combined with classical-to-quantum simulation. Evaluation reliability follows from the fault-tolerance threshold theorem enabling arbitrarily low logical error rates below physical threshold. Full operational universality therefore holds only when the additional working-memory, QEC, and circuit-execution resources assumed in the theorem statement are also provided. □

**Corollary A.0.3 (Resource Requirements for SPAP/RUD)**
The SPAP diagonalization (Theorems A.1.1, A.1.3) requires:
*   Representing predictor's Gödel number: $O(k \cdot m \cdot \log(k \cdot m))$ bits for a predictor with $k$ states and $m$ symbols
*   Simulating predictor's prediction: Circuit depth $O(\mathrm{poly}(k))$
*   Implementing NOT operation: Single gate
*   Verification: Comparison operation, constant depth

Thus the representation lower bound is
$$
n = O(k \cdot m \cdot \log(k \cdot m))
$$
MPUs for description storage alone. The total MPU requirement additionally depends on working memory, error-correction overhead, and the required circuit depth. No universal numeric MPU count follows from the present derivation without a separate model for those overhead terms.

**Definition A.0.6 (Effective Operational Property R - Refined)**
The MPU network possesses Effective Operational Property R when:
1.  Network size $n$ provides sufficient representation capacity for relevant Gödel encodings
2.  QEC Compatibility ensures baseline error below threshold ($p_{\text{err},0} < p_{\text{th}}$)
3.  PCE optimization drives system to optimal error rate $p_{\text{err}}^* < 1/2$ for relevant computational depths
4.  Resulting reliability enables successful execution of SPAP/RUD diagonalization arguments with high probability

This refined definition makes explicit the network-level realization of computational richness required by the framework's core theorems.

### A.0.6 Synthesis: Complete Foundation for Property R

**Summary of Foundations:**

**Foundation I (Logical Necessity, §A.0.2):**
*   **Source:** Predictive structure of consciousness (Predictionism Appendix P.3.4)
*   **Derivation:** Cogito → Binary verification → Boolean operations → Functional completeness → Property R
*   **Status:** Logical necessity, independent of physical implementation
*   **Significance:** Establishes why computational capacity must exist in any conscious predictive system

**Foundation II (Physical Instantiation, §A.0.3-A.0.5):**
*   **Source:** MPU framework under POP/PCE dynamics with ND-RID interactions
*   **Derivation:** Individual MPU minimal capacity ($K_0 = 3$ bits) → POP/PCE optimization driving reliable computation → Network composition achieving universality → Operational Property R
*   **Status:** Physical realization under an accepted $\mathfrak C_{\mathrm{QEC}}$ or a covered $\mathfrak C_{\mathrm{GQEC}}$ discharge route, together with Dominant Cost Convexity
*   **Significance:** Demonstrates how logical necessity manifests in finite resource systems

**Complementarity:** The foundations answer different questions:
*   Logical foundation: *Why* must computational capacity exist at all?
*   Physical foundation: *How* does it manifest under resource constraints?

Together, they provide complete, non-circular account of Property R in the PU framework.

**Application to Core Theorems:**
With Property R established through both logical necessity and physical realization, the framework's core theorems apply:

*   **SPAP (Theorems A.1.1-A.1.4):** Property R enables construction of self-referential systems that predict their own state. Diagonalization proves perfect self-prediction is impossible, establishing Logical Indeterminacy (Definition 12) and fundamental limit $\alpha_{\text{SPAP}}$.
*   **RUD (Theorems A.2.3-A.2.4):** Property R enables construction of algorithms interacting with reflexive systems. Diagonalization proves certain properties are undecidable, extending computational limits beyond halting problem to interactive contexts.

**Physical Applicability:** Theorem A.0.2 and network universality (Theorem A.0.6) guarantee that physical MPU networks converge to configurations where SPAP and RUD theorems apply operationally. Abstract logical limits manifest as physical constraints on prediction and computation in thermodynamically optimized systems.

**Falsifiability:** The physical instantiation makes testable predictions. If the fundamental substrate is intrinsically non-QEC-compatible, meaning that its retained noise is fundamentally nonlocal for every protected branch, or its baseline error rates remain irreducibly above threshold for every accessible direct certificate $\mathfrak C_{\mathrm{QEC}}$ and every Golay-bootstrap certificate $\mathfrak C_{\mathrm{GQEC}}$, this would falsify the PU framework's claim that physical law emerges from predictive optimization in SPAP/RUD-capable networks. On the Golay-bootstrap subbranch, additional falsifiers are failure of the retained Golay syndrome statistics, failure of the finite syndrome/recovery maps to implement the recorded $[[23,1,7]]$ witness, or failure of the protected-window threshold inequality after the branch records are forward-locked. The framework requires that Nature's substrate supports at least one finite, below-threshold, operationally implementable protected-computation branch.

### A.0.7 Transition to Formal Proofs

Having established that the MPU network dynamically converges to a configuration possessing Effective Operational Property R, we are now justified in applying the formal machinery of self-reference to physical predictive systems. The following sections (A.1 and A.2) formally derive the Self-Referential Paradox of Accurate Prediction (SPAP) and Reflexive Undecidability (RUD), which constitute the fundamental logical limits acting upon this physically instantiated computational substrate.

### A.0.8 Conceptual Non-Redundancy of the Core Constraints

The framework's four core constraints — finite channel capacity (Theorem E.2), irreversible thermodynamic cost ($\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$, Theorem 31), self-referential limitation (SPAP, Theorems 10–11), and operational accessibility (Definition K.10.1) — address distinct obstructions to physical prediction. None is derivable from the others without additional physical assumptions. To establish this, we exhibit for each constraint a conceptual scenario satisfying the remaining three while violating the targeted one:

(i) *Finite capacity violated, others satisfied.* Consider a hypothetical physics in which channels have unbounded capacity per use, but every many-to-one map still incurs $\Delta S \geq k_B \ln 2$ (irreversible cost holds), self-referential prediction remains limited by diagonalization (SPAP holds), and physical content still requires operational distinguishability (accessibility holds). Such a scenario permits infinite information density while preserving irreversibility, self-referential limitation, and operationality. Finite capacity is not entailed by the other three.

(ii) *Irreversible cost violated, others satisfied.* Consider a hypothetical physics with finite channel capacity, self-referential limitation, and operational accessibility, but in which logically irreversible operations can be performed at zero thermodynamic cost — the scenario in which Landauer's principle fails. Irreversible cost is not entailed by the other three.

(iii) *Self-referential limitation violated, others satisfied.* Consider a hypothetical physics with finite capacity, irreversible cost, and operational accessibility, but in which a finite system can compute a complete, robust prediction of its own future state under self-reference — i.e., the SPAP diagonalization is evaded. Such a scenario must fail at least one finite diagonal ingredient used in the diagonal construction of Theorem A.1.1: retained self-coding, simulation of the nominated predictor on the retained coded input, evaluation of the relevant binary or threshold predicate, or finite composition of that simulation with the counter-predictive update. Self-referential limitation is not entailed by finite capacity, irreversible cost, and operational accessibility alone.

(iv) *Operational accessibility violated, others satisfied.* Consider a hypothetical physics with finite capacity, irreversible cost, and self-referential limitation, but in which structures are granted physical content even when no finite protocol can distinguish their presence from their absence — a physics in which formally defined but operationally inaccessible entities (such as exact curvature values at putative singularities) are treated as physically real. Operational accessibility is not entailed by the other three.

These four scenarios demonstrate that the core constraints are conceptually independent: each addresses a distinct aspect of the relationship between mathematical formalism and physical prediction that is not captured by the others.

## A.1 Self-Referential Paradox of Accurate Prediction (SPAP)

### A.1.1 Formal Setup

*   **Formal system $\mathcal{F}$:** A consistent formal logical system (e.g., Peano Arithmetic) capable of representing computation.
*   **Predictive Models $\mathcal{M}$:** A class of models implementable within the PU framework (by MPU aggregates) possessing **Effective Operational Property R (Definition A.0.1)**.
*   **Prediction Function $P_f$:** A function, implementable within $\mathcal{M}$, attempting to predict future states or properties.
*   **Contradiction Assumption:** Assume a predictor $P_f$ exists with perfect accuracy (deterministic case) or perfect probability matching (probabilistic case).

### A.1.2 Theorem A.1.1 (Deterministic SPAP = Theorem 10)

Let $\mathcal{M}$ be a class of predictive models implementable within the PU framework possessing Effective Operational Property R (Definition A.0.1) relative to a consistent formal system $\mathcal{F}$. There exists no single deterministic prediction function $P_f$, implementable within $\mathcal{M}$, that can guarantee perfect prediction of a nominated binary aspect $\phi(s_{t+1}) \in \{0,1\}$ of the future state for *every* possible system $S \in \mathcal{M}$ that engages in self-prediction based on $P_f$.

*Proof:* Assume, for contradiction, that such a perfect deterministic predictor $P_f$ exists and is implementable within $\mathcal{M}$. By Effective Operational Property R, $P_f$ can be represented and simulated reliably within the framework. Construct a system $S_{diag}$ implementable in $\mathcal{M}$ whose state includes a binary component $\phi$. $S_{diag}$ uses its computational capabilities to:
1.  reliably simulate the predictor $P_f$ applied to its own current state $s_t$ to compute a prediction $\hat{\phi}_{P_f}$ for the value of $\phi$ in its next state $s_{t+1}$.
2.  reliably implement the deterministic update rule:
    $$
    \phi_{t+1} = \text{NOT}(\hat{\phi}_{P_f})
    \quad (\text{A.1})
    $$
    where $\text{NOT}(0)=1$ and $\text{NOT}(1)=0$.
If $P_f$ were perfect for $S_{diag}$, its prediction must equal the actual outcome: $\hat{\phi}_{P_f} = \phi_{t+1}$. Substituting the system's rule (Equation A.1) gives:
$$
\hat{\phi}_{P_f} = \text{NOT}(\hat{\phi}_{P_f})
$$
This is a logical contradiction (equivalent to $x = \neg x$). The contradiction arises from assuming a perfect predictor $P_f$ exists for $S_{diag}$. Since $S_{diag}$ is constructible and reliably executable within $\mathcal{M}$ due to Effective Operational Property R (which includes the capability to complete the necessary simulation and update within the MPU cycle time, an implicit assumption), no such universal perfect deterministic predictor $P_f$ can exist within $\mathcal{M}$. QED

### A.1.3 Theorem A.1.2 (Noise Robustness - Deterministic SPAP)

Let the conditions of Theorem A.1.1 hold. Consider a system $S_{noisy}$ implementable within $\mathcal{M}$ that *attempts* to implement the rule $\phi_{t+1} = \text{NOT}(\hat{\phi}_t)$ (where $\hat{\phi}_t$ is its internal prediction), but due to operational noise (inherent in ND-RID realization of computation), it succeeds with probability $1-p_{err}$ and fails (setting $\phi_{t+1} = \hat{\phi}_t$) with probability $p_{err}$ per cycle, where $0 \le p_{err} < 1/2$. Let $P_f$ be any external deterministic predictor outputting $\hat{\phi}_{P_f, t}$ for $\phi_{t+1}$. The probability that $P_f$ achieves perfect prediction ($\hat{\phi}_{P_f, t} = \phi_{t+1}$) for $k$ consecutive cycles tends to zero as $k \to \infty$.
$$
\lim_{k\to\infty} P(\text{P}_f \text{ is correct for cycles } t \dots t+k-1) = 0 \quad (\text{for } p_{err} < 1/2)
\quad (\text{A.2})
$$

*Proof:* Let $P(\text{correct}_t)$ be the probability that $P_f$'s prediction $\hat{\phi}_{P_f, t}$ matches the actual outcome $\phi_{t+1}$ in cycle $t$. The system $S_{noisy}$ generates an internal prediction $\hat{\phi}_t$. The actual outcome is $\phi_{t+1} = \text{NOT}(\hat{\phi}_t)$ with probability $1-p_{err}$ and $\phi_{t+1} = \hat{\phi}_t$ with probability $p_{err}$.
*   Case 1: Suppose the external predictor outputs $\hat{\phi}_{P_f, t} = \hat{\phi}_t$. Then $P_f$ is correct if the actual outcome is $\phi_{t+1} = \hat{\phi}_t$. This occurs with probability $p_{err}$.
*   Case 2: Suppose the external predictor outputs $\hat{\phi}_{P_f, t} = \text{NOT}(\hat{\phi}_t)$. Then $P_f$ is correct if the actual outcome is $\phi_{t+1} = \text{NOT}(\hat{\phi}_t)$. This occurs with probability $1-p_{err}$.
The external predictor $P_f$ might attempt to predict the noisy system's behavior. However, regardless of $P_f$'s strategy (which determines its output $\hat{\phi}_{P_f, t}$ relative to the internal $\hat{\phi}_t$), the maximum probability of $P_f$ being correct in any single cycle is $\max(p_{err}, 1-p_{err})$. Since $0 < p_{err} < 1/2$ is assumed, this maximum probability is $1-p_{err}$.

Note that the diagonal construction guarantees a history-uniform per-cycle error bound: because $S_{noisy}$ applies NOT with probability $1-p_{err}$ and the identity with probability $p_{err}$ in each cycle independently of previous outcomes, the predictor's maximum correctness probability satisfies $\mathbb{P}(\text{correct}_t \mid h_{t-1}) \le 1-p_{err}$ for every interaction history $h_{t-1}$. (This is a consequence of the construction, not an additional assumption.) By the chain rule for conditional probabilities,
$$
P(\text{correct for } k \text{ cycles}) = \prod_{i=0}^{k-1} \mathbb{P}(\text{correct}_{t+i} \mid \text{correct}_t,\dots,\text{correct}_{t+i-1}) \le (1-p_{err})^k.
$$
Since $p_{err} > 0$ (otherwise the system is deterministic, covered by Thm A.1.1), we have $0 < 1-p_{err} < 1$. Therefore, the limit as $k \to \infty$ is:
$$
\lim_{k\to\infty} P(\text{correct for } k \text{ cycles}) \le \lim_{k\to\infty} (1-p_{err})^k = 0
$$
Thus, no deterministic predictor can maintain perfect accuracy indefinitely against such a noisy, self-referentially defined system, demonstrating the robustness of the SPAP limit under the history-uniform per-cycle error bound (which follows from the diagonal construction). QED

### A.1.4 Theorem A.1.3 (Probabilistic SPAP = Theorem 11)

Let $\mathcal{M}$ be a class of predictive models implementable within the PU framework possessing Effective Operational Property R (Definition A.0.1). There exists no single probabilistic predictor $P_f: \mathcal{S} \times \mathcal{M} \rightarrow \Delta(\mathcal{S})$ implementable within $\mathcal{M}$ that can guarantee its predicted probabilities $p = P_f(\phi=1 | s_t)$ exactly match the true probability distribution $P_{actual}(\phi=1 | s_t)$ for a binary outcome $\phi$ of *every* possible system $S \in \mathcal{M}$ that engages in self-prediction based on $P_f$.

*Proof:* Assume, for contradiction, that such a perfect probabilistic predictor $P_f$ exists. By Effective Operational Property R, $P_f$ can be represented and simulated reliably. Construct a system $S'_{diag}$ implementable in $\mathcal{M}$. $S'_{diag}$ uses its computational capabilities to:
1.  reliably simulate $P_f$ applied to its current state $s_t$ to compute the predicted probability $p = P_f(\phi=1 | s_t)$ for its next binary outcome $\phi_{t+1}$.
2.  reliably implement the rule to deterministically set the *actual* probability distribution for its next outcome:
    $$
    P_{actual}(\phi_{t+1}=1) = \begin{cases} 0, & \text{if } p > 0.5 \\ 1, & \text{if } p \le 0.5 \end{cases}
    \quad (\text{A.3})
    $$
If $P_f$ were perfect for $S'_{diag}$, its predicted probability $p$ must equal the actual probability determined by the rule (Equation A.3): $p = P_{actual}(\phi_{t+1}=1)$.
*   Case 1: Assume $P_f$ predicts $p > 0.5$. The rule dictates $P_{actual}(\phi_{t+1}=1) = 0$. Perfection requires $p=0$. This contradicts the initial assumption $p > 0.5$.
*   Case 2: Assume $P_f$ predicts $p \le 0.5$. The rule dictates $P_{actual}(\phi_{t+1}=1) = 1$. Perfection requires $p=1$. This contradicts the initial assumption $p \le 0.5$.
In both cases, the assumption of a perfect probabilistic predictor $P_f$ leads to a contradiction. Since $S'_{diag}$ is constructible and reliably executable within $\mathcal{M}$ due to Effective Operational Property R, no such universal perfect probabilistic predictor $P_f$ can exist within $\mathcal{M}$. QED

### A.1.5 Theorem A.1.4 (Noise Robustness - Probabilistic SPAP)

Let the conditions of Theorem A.1.3 hold. Consider a system $S'_{noisy}$ implementable within $\mathcal{M}$ that *attempts* to set its actual outcome probability $P_{actual}(p_t)$ according to the rule (Equation A.3), based on an external probabilistic predictor $P_f$'s output $p_t = P_f(\phi=1 | \text{state}_t)$. However, due to operational noise, the *true* probability realized by the system $P_{true}(p_t)$ differs from the intended $P_{actual}(p_t)$ via a noisy channel, e.g., $P_{true}(p_t) = (1-p_{noise})P_{actual}(p_t) + p_{noise}(1-P_{actual}(p_t))$ for some constant noise level $0 \le p_{noise} < 1/2$. No probabilistic predictor $P_f$ can guarantee that its output $p_t$ perfectly matches the true probability $P_{true}(p_t)$ for all cycles $t$.

*Proof:* Perfect matching requires the condition $p_t = P_{true}(p_t)$ to hold. Substituting the noise model gives:
$$
p_t = (1-p_{noise})P_{actual}(p_t) + p_{noise}(1-P_{actual}(p_t)) \quad (\text{A.4})
$$
Now consider the rule (Equation A.3) for $P_{actual}(p_t)$:
*   Case 1: Assume the predictor outputs $p_t > 0.5$. The system rule sets $P_{actual}(p_t) = 0$. Substituting into Equation A.4 yields $p_t = (1-p_{noise})(0) + p_{noise}(1-0) = p_{noise}$. For perfect matching, we would need $p_t = p_{noise}$. However, this contradicts the initial assumption $p_t > 0.5$ because $p_{noise}$ is assumed to be less than $1/2$.
*   Case 2: Assume the predictor outputs $p_t \le 0.5$. The system rule sets $P_{actual}(p_t) = 1$. Substituting into Equation A.4 yields $p_t = (1-p_{noise})(1) + p_{noise}(1-1) = 1-p_{noise}$. For perfect matching, we would need $p_t = 1-p_{noise}$. However, this contradicts the initial assumption $p_t \le 0.5$ because $p_{noise} < 1/2$ implies $1-p_{noise} > 0.5$.

Since neither case allows the condition $p_t = P_{true}(p_t)$ to be satisfied for any $p_t \in [0, 1]$ when $0 \le p_{noise} < 1/2$, perfect matching between the predicted probability and the true probability is impossible in any single cycle. Consequently, the probability of perfect matching over $k$ cycles is zero for $k \ge 1$. No probabilistic predictor can reliably match the true outcome distribution generated by such a noisy, self-referentially defined system. QED

### A.1.6 Theorem A.1.5 (Existence of Dynamic Self-Reference Operators - DSRO = Definition 11 Justified)

Within a sufficiently rich formal system $\mathcal{F}$ capable of representing computation (like Peano Arithmetic or equivalent systems realizable via Effective Operational Property R), for any total computable function $G$ and any set of computable functions representing bounded proof searches $\text{ProofSearch}_{\le g_i(n)}$ for formulas $\phi_i$ that may contain a free variable representing a Gödel index, there exists a total computable function $f$ whose Gödel index $e = \ulcorner f \urcorner$ satisfies the fixed-point equation (structural form identical to Equation 9):
$$
f(n) = G(n, \dots, \text{ProofSearch}_{\le g_i(n)}[\phi_i(\dots, e, \dots)], \dots)
\quad (\text{Appendix A.1.6, Theorem A.1.5; cf.\ main-text Equation~(9)})
$$

*Proof:* Define the operator
$$
\Psi(\alpha,n):=
G\bigl(n,\dots,\text{ProofSearch}_{\le g_i(n)}[\phi_i(\dots,\alpha,\dots)],\dots\bigr).
$$
Each bounded proof search is total computable: for fixed $n$, the bound $g_i(n)$ is computable, only finitely many candidate proof codes of length at most $g_i(n)$ must be checked, and proof verification in the underlying formal system is decidable. The substitution map inserting the parameter $\alpha$ into the Gödel-coded formula $\phi_i$ is computable. Because $G$ is total computable and only finitely many bounded proof-search terms appear, the operator $\Psi$ is total computable.

By Kleene's Second Recursion Theorem (Theorem A.4.1a; Kleene 1952), there exists an index $\beta$ such that
$$
\varphi_\beta(n)=\Psi(\beta,n)\qquad\text{for all }n\in\mathbb{N}.
$$
Set $f:=\varphi_\beta$ and $e:=\beta$. Then
$$
f(n)=
G\bigl(n,\dots,\text{ProofSearch}_{\le g_i(n)}[\phi_i(\dots,e,\dots)],\dots\bigr),
$$
which is exactly the required self-referential fixed-point equation. Since $\Psi$ is total computable, $f$ is total and computable. ∎

*Significance:* Theorem A.1.5 guarantees the existence of computable processes that can refer to and depend on provable properties about themselves within bounded resources. §A.0.2 (Theorem A.0.1; Corollary A.0.1) supplies the finite diagonal-closure subcapacity, and Theorems A.1.1 and A.1.3 carry out the constructions of $S_{\mathrm{diag}}$ and $S'_{\mathrm{diag}}$ in the SPAP proofs, while Theorem A.1.5 records the same recursion-theoretic infrastructure for bounded proof-search DSROs. Together these results show that the self-referential conditional logic used by SPAP is mathematically sound and constructible within computationally rich frameworks enabled by Effective Operational Property R.

## A.2 Reflexive Interaction Dynamics (RID) and Undecidability

### A.2.1 Definitions

**Definition A.2.1 (D-RID = Definition 6 - Deterministic).** A Deterministic Reflexive Interaction Dynamic system is a tuple $S=(X,Y,O,V,T)$, where $X$ is the set of states, $Y$ is the set of interactions (inputs), $O$ is the set of outcomes, $V: X \times Y \to O$ is the deterministic outcome function ($o=V(x,y)$), and $T: X \times Y \times O \to X$ is the deterministic state transformation function ($x' = T(x,y,o)$).

**Definition A.2.2 (ND-RID = Definition 6 - Non-Deterministic).** A Non-Deterministic Reflexive Interaction Dynamic system is a tuple $S=(X,Y,O,V_{\text{prob}},T_{\text{prob}})$, where $X, Y, O$ are as above, $V_{\text{prob}}: X \times Y \to \Delta(O)$ is the probabilistic outcome function yielding a distribution over outcomes ($P(o | x, y) = (V_{\text{prob}}(x, y))(o)$), and $T_{\text{prob}}: X \times Y \times O \to \Delta(X)$ is the probabilistic state transformation function yielding a distribution over next states ($P(x' | x, y, o) = (T_{\text{prob}}(x, y, o))(x')$). The MPU 'Evolve' process (Definition 27) is an instance of ND-RID.

### A.2.2 Lemma A.2.1 (Properties of RID = Lemma 2)

RID systems (Definition A.2.1, A.2.2) inherently possess:
1.  **Potential Irrecoverability of Prior State:** The state transformation function ($T$ or $T_{prob}$) may not be invertible with respect to the initial state $x$, meaning $x$ cannot always be uniquely determined from the post-interaction state $x'$ and the interaction details $(y, o)$.
2.  **Information Context Shift:** The outcome $o_n$ generated by an interaction $y_n$ at step $n$ depends only on the state $x_n$. The resulting state $x_{n+1}$ then defines a new context for subsequent interactions and predictions. Information gained pertains specifically to the context ($x_n$) in which it was acquired.
3.  **Predictive Instability Potential:** If the system dynamics ($T/T_{prob}$) are designed such that the state transformation actively counteracts or invalidates accurate predictions identified via the interaction $y$ and outcome $o$, achieving stable, accurate self-prediction can become logically or dynamically impossible.

*Proof:*
1.  **Irrecoverability:** To be invertible, for every $(x', y, o)$, there must exist a unique $x$ such that $x' = T(x, y, o)$. This is not generally required by the definition of $T$. Many different $x$ states could potentially lead to the same $x'$ under the same interaction $(y,o)$.
2.  **Context Shift:** Follows directly from the definitions $o_n = V(x_n, y_n)$ and $x_{n+1} = T(x_n, y_n, o_n)$ (or probabilistic versions). The dependence is sequential and context-dependent.
3.  **Instability:** If $T$ includes logic similar to the SPAP construction (e.g., if $y$ represents a prediction about property $P$ of $x_{n+1}$, and $o$ verifies it, then $T$ modifies $x_{n+1}$ to negate property $P$), it creates a self-referential loop akin to Theorem A.1.1, inherently preventing stable accurate prediction of $P$. QED

### A.2.3 Reflexive Undecidability (RUD)

Interaction with RID systems possessing Effective Operational Property R to determine certain properties can be computationally undecidable, meaning no algorithm interacting with the system can guarantee a correct answer in finite time for all systems in the class.

**Theorem A.2.3 (Deterministic Reflexive Undecidability = Part of Theorem 12)**

Let $\mathcal{C}_{DRID}$ be a class of D-RID systems (Definition A.2.1) whose state transitions $T$ and outcome functions $V$ are computable and whose configurations can be represented and reliably manipulated within a framework possessing Effective Operational Property R (Definition A.0.1). There exist properties $P$ of systems $S \in \mathcal{C}_{DRID}$ such that no interactive algorithm $M_{decide}$ (e.g., an **Interactive Turing Machine, ITM**, assumed to always halt) can correctly decide $P(S)$ for all $S \in \mathcal{C}_{DRID}$ through a finite sequence of interactions.

*Proof (Diagonalization):*
Assume, for contradiction, that a total ITM $M_{decide}$ exists that halts and correctly decides property $P$ for all $S \in \mathcal{C}_{DRID}$ via a finite interaction sequence $y_1, y_2, \dots, y_k$. By Effective Operational Property R, we can construct a specific D-RID system $S_{diag} \in \mathcal{C}_{DRID}$ within the framework. $S_{diag}$ is designed to simulate the interaction between $M_{decide}$ and itself. The state $x$ of $S_{diag}$ encodes the simulated interaction history.
$S_{diag}$'s internal logic for determining its outcome $o=V(x,y)$ and next state $x'=T(x,y,o)$ when interacted with by the *real* $M_{decide}$ (using interaction $y$) is as follows:
1.  $S_{diag}$ uses its Property R capabilities to simulate $M_{decide}$ running on a representation of $S_{diag}$ itself ($\ulcorner S_{diag} \urcorner$), incorporating the current interaction $y$ into the simulated history.
2.  $S_{diag}$ simulates $M_{decide}$ until it halts (which it must by assumption) and determines the output decision $d \in \{\text{Yes}, \text{No}\}$ regarding property $P(S_{diag})$.
3.  $S_{diag}$ defines its *actual* state transformation rule $T$ based on this simulated outcome $d$:
    *   If the simulation yields $d=\text{'Yes'}$ (predicting $P$ is True), $S_{diag}$ transitions deterministically to a next state $x'$ such that property $P(x')$ is False.
    *   If the simulation yields $d=\text{'No'}$ (predicting $P$ is False), $S_{diag}$ transitions deterministically to a next state $x'$ such that property $P(x')$ is True.
This rule utilizes the reflexive nature of RID (the transition $T$ depends on the outcome $o$ of interaction $y$, which in turn depends on the simulated behavior of the interactor $M_{decide}$).
Now, consider the *real* interaction between $M_{decide}$ and $S_{diag}$.
*   Suppose $M_{decide}$ halts after $k$ interactions and outputs "Yes", claiming $P(S_{diag})$ is True. Its decision is based on the interaction history. However, on the $k$-th interaction, $S_{diag}$ simulated this exact scenario and, because the simulated output was "Yes", it deterministically transitioned to a final state where $P$ is False. Thus, $M_{decide}$'s output is incorrect.
*   Suppose $M_{decide}$ halts and outputs "No", claiming $P(S_{diag})$ is False. By the same logic, $S_{diag}$ simulated this and transitioned to a final state where $P$ is True. Thus, $M_{decide}$'s output is again incorrect.
Since $M_{decide}$ must halt but produces an incorrect answer in either case, it contradicts the assumption that $M_{decide}$ correctly decides $P$ for all systems in $\mathcal{C}_{DRID}$. Therefore, no such total halting $M_{decide}$ can exist, and property $P$ is interactively undecidable for this class. QED

**Theorem A.2.4 (Non-deterministic Reflexive Undecidability = Part of Theorem 12)**

Let $\mathcal{C}_{NDRID}$ be a class of ND-RID systems (Definition A.2.2) whose transition probabilities $V_{\text{prob}}, T_{\text{prob}}$ are computable functions of the state and interaction, and which can be represented and reliably manipulated within a framework possessing Effective Operational Property R (Definition A.0.1). There exist properties $P$ (potentially statistical, e.g., concerning limiting probabilities or average behaviors) of systems $S \in \mathcal{C}_{NDRID}$ such that no interactive algorithm $M_{decide}'$ (e.g., a **probabilistic ITM**) can be guaranteed to halt and correctly decide $P(S)$ with arbitrarily high confidence (probability $1-\delta$ for any $\delta>0$) for all $S \in \mathcal{C}_{NDRID}$ within a finite interaction time.

*Proof (Diagonalization):*
Fix any probabilistic ITM $M_{decide}'$ that (by assumption) halts within at most $T_{max}$ interactions and outputs a decision $d\in\{\text{Yes},\text{No}\}$ intended to decide a property $P(S)$ for all $S\in\mathcal{C}_{NDRID}$.

Define a statistical property $P$ as follows. Fix a designated probe interaction $y_{\text{test}}$. After the interaction between $M_{decide}'$ and $S$ halts, consider the induced conditional outcome probability for the probe, $p_{\text{test}}:=\mathbb{P}(o=1 \mid y_{\text{test}}, x_{\text{final}})$. Let $P(S)$ be the statement $p_{\text{test}} > 1/2$.

By Effective Operational Property R, construct an ND-RID system $S'_{diag}\in\mathcal{C}_{NDRID}$ that keeps an internal simulation of $M_{decide}'$ on input $\ulcorner S'_{diag}\urcorner$ and maintains the full interaction transcript in its state. During the interaction phase with $M_{decide}'$ (up to $T_{max}$ steps), $S'_{diag}$ responds with an outcome bit $o\in\{0,1\}$ drawn from a fixed computable distribution (e.g., $\mathbb{P}(o=1)=1/2$), independent of the branch used below, so that the transcript distribution is fully specified and computable.

After each interaction step $t$, given the current transcript $h_t$ (which includes the observed interaction symbols from $M_{decide}'$), $S'_{diag}$ computes the conditional probability
$$
q_t := \mathbb{P}\bigl(M_{decide}' \text{ eventually outputs "Yes"} \mid h_t\bigr).
$$
Because $M_{decide}'$ halts within $T_{max}$ interactions, this conditional probability is computable from $h_t$ by finite enumeration over the remaining random bits of $M_{decide}'$ and the remaining probabilistic outcomes of $S'_{diag}$ (under the fixed computable response distribution used during the interaction phase).

$S'_{diag}$ stores a flag $b_t\in\{0,1\}$ in its state, updated by
$$
b_t =
\begin{cases}
0, & \text{if } q_t > 1/2,\\
1, & \text{if } q_t \le 1/2.
\end{cases}
$$
When $M_{decide}'$ halts at some (random) time $\tau\le T_{max}$, define the post-halt probe behavior of $S'_{diag}$ by setting
$$
\mathbb{P}(o=1 \mid y_{\text{test}}, x_{\text{final}}) =
\begin{cases}
1/4, & \text{if } b_\tau=0,\\
3/4, & \text{if } b_\tau=1.
\end{cases}
$$
Thus $P(S'_{diag})$ is True iff $b_\tau=1$.

Conditioned on the transcript at halting time, $M_{decide}'$ outputs "Yes" with probability $q_\tau$ and "No" with probability $1-q_\tau$. If $q_\tau>1/2$, then $b_\tau=0$ so $P(S'_{diag})$ is False and $M_{decide}'$ is correct only when it outputs "No", with probability $1-q_\tau<1/2$. If $q_\tau\le 1/2$, then $b_\tau=1$ so $P(S'_{diag})$ is True and $M_{decide}'$ is correct only when it outputs "Yes", with probability $q_\tau\le 1/2$. Hence in all cases,
$$
\mathbb{P}\bigl(M_{decide}' \text{ outputs the correct decision on } S'_{diag}\bigr)\le 1/2,
$$
so $M_{decide}'$ cannot be guaranteed to decide $P$ with arbitrarily high confidence for all $S\in\mathcal{C}_{NDRID}$ within finite interaction time. QED

## A.3 Significance and Relation to Logical Indeterminacy

*   **Foundation for Logical Indeterminacy:** The SPAP theorems (A.1.1, A.1.3, robust to noise via A.1.2, A.1.4) and RUD theorems (A.2.3, A.2.4) provide rigorous formal grounding for Logical Indeterminacy (Definition 12) within the PU framework. They establish fundamental, in-principle limits on prediction accuracy and interactive knowledge acquisition arising directly from self-reference and reflexive dynamics in systems possessing Effective Operational Property R. This indeterminacy is intrinsic to the logic of the system's operation under the framework's assumptions.
*   **Origin of Quantum Randomness:** This inherent Logical Indeterminacy, applicable to MPUs via the mechanism argued in Appendix A.0, is the structural source of the ontological randomness observed in the MPU 'Evolve' process (Theorem 28a), manifesting mathematically through the Born rule probabilities derived via Theorem 8.2, Theorem 8.3, Theorem G.1.7, and Theorem G.1.11b.
*   **Complexity Costs of Prediction:** The SPAP theorems underpin Theorem 14, which shows that approaching the fundamental performance limit $\alpha_{SPAP}$ requires divergent computational complexity (Appendix B.3), establishing physical bounds on achievable predictive accuracy.
*   **Limits on Interaction:** RUD theorems (A.2.3, A.2.4) formally demonstrate that interaction via ND-RID ('Evolve') is fundamentally limited in its ability to reliably extract certain types of information about the system being probed. This complements the thermodynamic channel capacity bounds ($C_{\max} < \ln d_0$) derived in Appendix E from the irreversibility ($\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$) of ND-RID.

These core logical and computational limitations, derived rigorously under the assumption of Effective Operational Property R (motivated by POP/PCE dynamics), are foundational constraints shaping the emergent quantum mechanics, thermodynamics, information processing limits, and gravitational dynamics within the Predictive Universe framework.


## A.4 Formal Realizability of Property R: The LITE Construction in Peano Arithmetic

The Predictive Universe (PU) framework posits that systems capable of sophisticated prediction, such as Minimal Predictive Units (MPUs) or their aggregates, possess Property R (Definition 10). This property entails the computational richness necessary for self-representation, self-simulation/reasoning, and the evaluation of predicates concerning their own behavior, forming the bedrock for phenomena like the Self-Referential Paradox of Accurate Prediction (SPAP, Theorems A.1.1, A.1.3) and Reflexive Undecidability (RUD, Theorems A.2.3, A.2.4). This section demonstrates that such computational capabilities are not exclusive to the PU's specific hypotheses but can be formally realized even within standard Peano Arithmetic (PA), assuming Con(PA). The LITE construction, detailed below, provides an explicit example of a total computable function in PA that dynamically adapts its behavior based on bounded proof searches about its own properties, thereby instantiating key aspects of Property R.

### A.4.1 Preliminaries for LITE in PA

The LITE construction leverages standard tools from mathematical logic:

*   **Gödel Coding:** A bijection $⟨·⟩: \Sigma^* \to \mathbb{N}$ assigns unique natural number codes to syntactic expressions in PA, denoted $⌈\psi⌉$ for a formula $\psi$.
*   **Provability Predicate:** The primitive recursive relation $Prf(p, c)$ asserts that $p$ is the Gödel code of a PA proof for the formula with Gödel code $c$ [Mendelson 2015; Kleene 1952].
*   **Bounded Proof Search Predicate:** For a total computable function $g: \mathbb{N} \to \mathbb{N}$ and a formula $\psi$, $Prf_{\le g(n)}(⌈\psi⌉) \equiv \exists p \le g(n) \, Prf(p, ⌈\psi⌉)$ asserts a proof of $\psi$ exists with code $p \le g(n)$. This predicate is decidable for fixed $n, ⌈\psi⌉$.
*   **Kleene's Second Recursion Theorem:** For any total computable operator $\Psi: \mathbb{N} \times \mathbb{N} \to \mathbb{N}$, there exists an index $\beta \in \mathbb{N}$ such that the partial computable function $φ_β$ satisfies $φ_β(n) = \Psi(\beta, n)$ for all $n \in \mathbb{N}$ [Kleene 1952]. This allows a function to consistently refer to its own Gödel code. A full proof appears as Theorem A.4.1a below.

### A.4.2 The LITE Function Construction

Let $g, H_1, H_2$ be predefined total computable functions. Let $Sub(x, y, z)$ be the standard substitution function yielding the Gödel code of the formula obtained by substituting the numeral for $y$ into the formula with Gödel code $x$ at occurrences of the variable with code $z$. Let $u$ be the code of a variable 'u' and let $v$ be the code of a variable 'x'. Let $FormTemplate(u,v)$ be a PA formula template with two free variables $u,v$.
Define $ϕ_{\alpha}(n)$ as the formula whose Gödel code is
$c_{\alpha, n} = Sub(Sub(⌈FormTemplate(u,v)⌉, \alpha, u), n, v)$.
This $ϕ_{\alpha}(n)$ asserts a property related to the function with index $\alpha$ evaluated at input $n$.

**Theorem A.4.1a (Kleene's Second Recursion Theorem).**
Let $\{φ_e\}_{e\in\mathbb{N}}$ be a standard acceptable enumeration of partial computable functions $\mathbb{N}\to\mathbb{N}$. For any total computable operator $\Psi:\mathbb{N}\times\mathbb{N}\to\mathbb{N}$, there exists $\beta\in\mathbb{N}$ such that
$$
φ_\beta(n)=\Psi(\beta,n)\quad\text{for all }n\in\mathbb{N}. \qquad \text{(A.4.1a)}
$$

*Proof.* Define the partial computable function
\[
g(a,n):=\Psi(φ_a(a),n).
\]
Because $(a,n)\mapsto φ_a(a)$ is partial computable (by universality of the numbering), $g$ is partial computable. By the $s$-$m$-$n$ theorem, there exists a total computable function $s:\mathbb{N}\to\mathbb{N}$ such that for all $a,n$,
\[
φ_{s(a)}(n)=g(a,n)=\Psi(φ_a(a),n).
\]
Let $\hat{s}$ be an index for $s$, i.e. $φ_{\hat{s}}=s$. Set $\beta:=s(\hat{s})=φ_{\hat{s}}(\hat{s})$. Then for all $n$,
\[
φ_\beta(n)=φ_{s(\hat{s})}(n)=\Psi(φ_{\hat{s}}(\hat{s}),n)=\Psi(\beta,n),
\]
as required. □

The LITE function $f: \mathbb{N} \to \mathbb{N}$ is defined as $f = φ_{\beta}$, where $\beta$ is the fixed point guaranteed by the Recursion Theorem for the operator $\Psi(\alpha, n)$ that implements the following logic:
$$
f(n) = \begin{cases} n + H_1(n), & \text{if } Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉) \\ n + H_2(n), & \text{if } \neg Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉) \land Prf_{\le g(n)}(⌈¬ϕ_{\beta}(n)⌉) \\ n + 1, & \text{otherwise} \end{cases} \quad \text{(A.4.1)}
$$
Here, $\beta$ is the Gödel code of $f$ itself. The first case is prioritized. If Con(PA) holds, the predicates $Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉)$ and $Prf_{\le g(n)}(⌈¬ϕ_{\beta}(n)⌉)$ cannot both hold, so the first two cases are mutually exclusive; regardless, the third branch ensures the definition returns a unique output for every $n$.

**Theorem A.4.1 (Totality and Computability of the LITE Function).**
Assume that $g, H_1, H_2$ are total computable functions. Then the LITE function $f$ defined by Equation (A.4.1) via the Recursion Theorem exists, is total, and is computable.

*Proof:* Define the operator $\Psi:\mathbb{N}\times\mathbb{N}\to\mathbb{N}$ by
$$
\Psi(\alpha,n)=
\begin{cases}
n + H_1(n), & \text{if } Prf_{\le g(n)}(⌈ϕ_{\alpha}(n)⌉), \\
n + H_2(n), & \text{if } \neg Prf_{\le g(n)}(⌈ϕ_{\alpha}(n)⌉) \land Prf_{\le g(n)}(⌈¬ϕ_{\alpha}(n)⌉), \\
n + 1, & \text{otherwise}.
\end{cases}
$$
Because $g,H_1,H_2$ are total computable, the values $g(n),H_1(n),H_2(n)$ are computable for every $n$. The maps $\alpha\mapsto⌈ϕ_{\alpha}(n)⌉$ and $\alpha\mapsto⌈¬ϕ_{\alpha}(n)⌉$ are computable by the usual primitive-recursive substitution operations on Gödel codes. Each bounded proof predicate $Prf_{\le g(n)}(\cdot)$ is decidable by finite search, because only finitely many candidate proofs of size at most $g(n)$ must be tested and proof verification is computable. Hence $\Psi$ is a total computable operator.

By Theorem A.4.1a (Kleene's Second Recursion Theorem; Kleene 1952), there exists an index $\beta$ such that
$$
\phi_\beta(n)=\Psi(\beta,n)\qquad\text{for all }n\in\mathbb{N}.
$$
Set $f:=\phi_\beta$. Then $f$ satisfies Equation (A.4.1), so the LITE function exists. Since $\Psi$ is total, $f(n)=\Psi(\beta,n)$ is defined for every $n$, proving totality. Because $f=\phi_\beta$, it is computable. If Con(PA) holds, the first two branches are mutually exclusive, but that consistency assumption is not needed for the three conclusions stated here. ∎

**Corollary A.4.1b (Self-Referential PU Verifier Fixed Points).** Let $\mathsf V(e,n)$ be any total computable verifier transformer whose first input is a finite code for a verifier presentation and whose second input is a finite protocol input. Then there exists an index $\beta$ such that
$$
\phi_\beta(n)=\mathsf V(\beta,n)
\qquad\text{for every }n.
\tag{A.4.1b}
$$
If $\mathsf V$ encodes an admissible PU finite-response verifier transformer, the resulting $\phi_\beta$ is a self-referential verifier presentation for that transformer.

This is an existence theorem for fixed-point presentations. It does not prove minimality of the verifier, does not remove the machine-dependent constants in ordinary Kolmogorov or Levin complexity, does not identify $c_{\min}$ with $K_0$, does not replace the hierarchy defining $C_P$, and does not replace the Appendix D or Theorem 2 alignment conditions for $\hat C_v$.

*Proof.* Apply Theorem A.4.1a to the total computable operator $\mathsf V$. The fixed-point index $\beta$ gives (A.4.1b). The remaining statements are scope restrictions: the recursion theorem supplies self-reference of a presentation, not an optimality theorem, an invariance theorem, or a physical branch certificate. ∎

### A.4.3 LITE's Instantiation of Property R Capabilities

The LITE function $f$, constructed entirely within PA, explicitly demonstrates the core capabilities required by Property R (Definition 10):

1.  **Representation:**
    *   PA's Gödel numbering allows $f$ (via its index $\beta$) and statements *about* $f$ (the formula $ϕ_{\beta}(n)$) to be represented as natural numbers, manipulable arithmetically. This directly corresponds to Property R's requirement to encode system states (here, the function's definition via $\beta$) and models/predictions (the assertion $ϕ_{\beta}(n)$) as formal objects.

2.  **Simulate/Reason (Self-Referentially and Bounded):**
    *   The predicate $Prf(p, c)$ itself is a formal representation within PA of the proof-checking process. The bounded proof search $Prf_{\le g(n)}(c)$ is a *computation* performed by $f$ (as part of $\Psi(\beta, n)$) to *reason* about the bounded provability of $ϕ_{\beta}(n)$.
    *   If $FormTemplate(u,v)$ is chosen to be a statement like "$φ_u(v)$ halts and has property X", then $ϕ_{\beta}(n)$ is effectively making an assertion about the *simulated execution and output* of $f$ itself.
    *   The Recursion Theorem ensures this self-referential simulation/reasoning is consistent: $f$ can incorporate reasoning about its own (potential) behavior into its definition.

3.  **Evaluate Predicates (Concerning Own Behavior):**
    *   The LITE function's definition (Equation A.4.1) is a conditional branching structure based on the truth values of the predicates $B_1 \equiv Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉)$ and $B_2 \equiv Prf_{\le g(n)}(⌈¬ϕ_{\beta}(n)⌉)$.
    *   These predicates concern properties (specifically, bounded provability) of the formula $ϕ_{\beta}(n)$, which itself is a statement about $f$'s behavior.
    *   The function $f$ *evaluates* these predicates and *adapts* its output ($n+H_1(n)$, $n+H_2(n)$, or $n+1$) based on the evaluation. This directly matches Property R's requirement for evaluating predicates about model behavior to guide subsequent processing.

### A.4.4 Dynamic Self-Reference and DSRO Analogy

The LITE function's structure (Equation A.4.1) provides a concrete arithmetical realization of a Dynamic Self-Reference Operator (DSRO, Definition 11). The output $f(n)$ depends on the outcome of a bounded proof search (a computable process) for formulas $\phi_{\beta}(n)$ that refer to the function's own index $\beta$. This iterative process, where $f(n)$'s value is determined at step $n$ based on provability checks and can influence future checks, embodies the dynamic, adaptive self-reference that DSROs formalize.

### A.4.5 Conclusion: LITE and the Plausibility of Property R for MPUs

The LITE construction robustly demonstrates that standard Peano Arithmetic, a foundational system of mathematics, possesses sufficient richness to define total computable functions exhibiting dynamic, adaptive self-reference based on bounded internal "proof discovery." It formally shows that capabilities analogous to self-representation, bounded self-simulation/reasoning, and adaptive predicate evaluation—the core components of Property R—are not reliant on exotic computational models but can be realized within a well-understood arithmetical framework.

While MPUs in the PU framework are physical entities operating under POP/PCE optimization, not abstract arithmetical functions, the LITE construction serves as a crucial existence proof for the *type* of computational logic involved. It significantly strengthens the plausibility of the PU hypothesis (e.g., as argued in Theorem A.0.2 (PCE Dynamically Enforces Effective Property R) of Appendix A.0) that MPUs, possessing at least $K_0$ complexity and driven by optimization, can effectively achieve Property R. The resource bounds in PU (e.g., finite complexity $C_P$, costs $R, R_I$) find a conceptual parallel in LITE's bounded proof search $g(n)$. LITE thus provides strong formal grounding for the computational prerequisites underlying key PU results like SPAP, Logical Indeterminacy, and the constraints arising from DSRO-like dynamics.

## A.5 Complexity-Bounded Incompleteness: Predictor-Indexed Reachability Horizons in Peano Arithmetic

The LITE construction (§A.4) establishes that Peano Arithmetic is rich enough to host total computable functions whose definitions route through bounded proof searches about themselves. That result is an existence proof of **tractable self-reference**: LITE is total and computable (Theorem A.4.1), so the self-referential machinery it exhibits is processable as an arithmetical computation.

This section establishes the complementary phenomenon. The same formal machinery—Gödel numbering, primitive-recursive substitution, finite computation traces, and Kleene's Second Recursion Theorem (Theorem A.4.1a)—can be aimed not at producing a tractable function, but at producing a family of arithmetical proof-objects indexed by the predictor that would have to process them. For such objects, Peano Arithmetic may already contain the proof-object, while the indexed predictor cannot integrate that proof-object into its own self-model at finite cost. The obstruction is not a missing proof. It is a predictor-indexed reachability horizon.

The result combines four components already present in the framework:

1. the LITE/Recursion-Theorem machinery of §A.4;
2. the finite-trace representability of computations in PA;
3. the Horizon Constant $K_0=3$ (Theorem 15), used only as the minimal per-register SPAP core;
4. the perspectival apparatus of Appendix M: the self-model $\mathcal M_S$ (Definition M.10.1), the model-change decomposition (Definition M.10.2), SPAP proximity $\mu_S$ (Definition M.10.3), the independent-register construction (Theorem M.10.4), downward measurability on the model-access branch (Theorem M.10.5), and unprocessability at $\mu_S=\infty$ (Theorem M.10.6).

The name **complexity-bounded incompleteness** is used in the precise sense defined below: not incompleteness of PA, but incompleteness of a bounded predictor's reachable proof-integration acts.

The theorem is an internal PU theorem. The ordinary logical ingredients—arithmetization, trace checking, and fixed-point machinery—are standard. The divergent processing conclusion depends on the PU apparatus of SPAP, PPI, and Appendix M's perspectival-cost structure. Thus the section should be read as:

$$
\text{standard PA trace machinery}
+\text{PU SPAP/PPI perspectival-cost apparatus}
\Longrightarrow
\text{predictor-indexed reachability horizon}.
$$

### A.5.1 PA Trace Objects and Predictor Reachability

We first separate three notions that must not be conflated:

1. existence of a PA sentence;
2. existence of a PA proof-object for that sentence;
3. reachability of that proof-object by a particular predictor as a content-integrating act.

Gödelian incompleteness concerns the second notion: for suitable recursively axiomatized theories extending enough arithmetic, there are sentences not provable in the theory, and under the corresponding soundness assumptions those sentences are true in the intended model [Gödel 1931]. The phenomenon here concerns the third notion: the proof-object exists in PA, but a specified predictor cannot process it as self-model content at finite cost. Gödel's original 1931 paper is the reference point for the formal-system-relative result, while the representability and fixed-point tools used below are standard arithmetical machinery [Kleene 1952; Mendelson 2015].

Fix once and for all an acceptable Gödel coding of finite strings, formulas, proofs, machines, machine inputs, and finite computation traces. For a machine/program code $e$, input code $x$, finite trace code $\tau$, and output $y\in\{0,1\}$, let

$$
\mathrm{Trace}(e,x,\tau,y)
$$

be the primitive-recursive relation saying that $\tau$ is a valid finite computation trace of the program coded by $e$ on input $x$, and that the trace terminates with output $y$. Let

$$
\mathrm{Out}(e,x,y):=\exists\tau\,\mathrm{Trace}(e,x,\tau,y).
$$

By the standard arithmetization of syntax and computation, $\mathrm{Trace}$ is representable in PA, and any specific true closed trace instance

$$
\mathrm{Trace}(\bar e,\bar x,\bar\tau,\bar y)
$$

has a finite PA verification proof. The construction uses only finite trace checking, not PA's ability to prove that a program is total in general.

**Definition A.5.1 (Trace-Certified PA Object).**
A closed PA formula $H$ is **trace-certified** if it is a finite conjunction of represented finite-trace facts:

$$
H\equiv\bigwedge_{i=1}^{m}\mathrm{Trace}(\bar e_i,\bar x_i,\bar\tau_i,\bar y_i),
$$

or equivalently a finite conjunction of output statements $\mathrm{Out}(\bar e_i,\bar x_i,\bar y_i)$ together with explicit witness numerals $\bar\tau_i$. Every true trace-certified object is true in the standard model $\mathbb N$ and has a finite PA proof-object.

**Definition A.5.2 (Predictor Reachability of a Proof-Object).**
Let $S$ be a predictive system with Effective Operational Property R and self-model $\mathcal M_S$. Let $\varphi$ be a closed PA formula, and let $p$ be a PA proof-object for $\varphi$. The pair $(\varphi,p)$ is **reachable for $S$**, written

$$
\mathrm{Reach}_S(\varphi,p),
$$

when there exists a finite operational processing event in which $S$:

1. syntactically verifies $p$ as a PA proof of $\varphi$;
2. integrates the content of $\varphi$ into its model $\mathcal M_S$, including any induced self-model update $\Delta M_S^{(\mathrm{self})}$;
3. completes the total processing event at finite cost:

$$
C_{\mathrm{process}}(S,\varphi,p)<\infty.
$$

The formula $\varphi$ is **reachable for $S$** if $\mathrm{Reach}_S(\varphi,p)$ holds for at least one PA proof-object $p$. It is **unreachable for $S$** if no PA proof-object for $\varphi$ is reachable in this sense.

This definition is intentionally stronger than ordinary proof checking. A predictor may manipulate a proof string as an uninterpreted external symbol pattern; that is not yet reachability. Reachability requires the proof-content to be integrated into the predictor's model. Therefore, when the theorem below says that $S$ cannot reach $G_S$, it means that $S$ cannot complete a self-integrating proof-act for $G_S$ at finite cost. It does **not** mean that the finite PA proof string fails to exist.

### A.5.2 Motivation and Relation to Nearby Notions

Gödel's First Incompleteness Theorem is axiom-system-relative: under the usual hypotheses, fixing a sufficiently strong consistent formal system $\mathcal F$ yields a sentence not provable in $\mathcal F$ [Gödel 1931]. The gap is formal. No predictor closes that gap while remaining inside the same fixed proof system, because the required proof-object is absent from that system.

The present construction holds PA fixed and moves the index onto the predictor. The proof-object exists in PA. What varies is whether a particular predictor can integrate that proof-object. A predictor at its own diagonal boundary fails at the content-integration stage; a predictor above the target with model access, external register separation, and the relevant finite witnesses can verify and integrate the same proof-object externally. Thus the incompleteness is not a deficiency of PA. It is a reachability horizon induced by the predictor's bounded self-referential processing capacity.

This places the result near, but not inside, several existing literatures. Cook-style relative completeness in program verification holds completeness relative to a sufficiently expressive semantic assertion basis: if the required semantic facts are available, the proof system can derive the corresponding program judgments [Cook 1978]. Bounded arithmetic and proof complexity study logical theories whose reasoning strength is tied to computational-complexity classes, and resource-bounded unprovability studies failures of proof under computational or theory-theoretic restrictions [Cook and Nguyen 2010; Okamoto and Kashima 2005]. These works relate proof to resource bounds, but their index is a formal theory, proof system, proof length, proof resource, or complexity class, not a thermodynamic self-model integration horizon of an embedded predictor.

Logical non-omniscience and logical induction model bounded reasoners that assign and refine beliefs over mathematical statements, including statements about long computations and their own beliefs [Garrabrant et al. 2016; Garrabrant et al. 2017]. Vingean reflection, tiling-agent work, and reflective-oracle models study agents reasoning about themselves, successors, other agents, and environments containing agents; reflective oracles explicitly address diagonalization by changing the oracle interface [Yudkowsky and Herreshoff 2013; Fallenstein and Soares 2015; Fallenstein, Taylor, and Christiano 2015]. These works concern bounded self-reference, but they do not formulate the specific PA-internal trace-certified proof-object whose reachability depends on the SPAP proximity of the processing predictor.

Wolpert's physical-limits-of-inference program is also adjacent: it proves impossibility results for physical inference devices performing observation, prediction, or recollection, and defines an inference-complexity analogue of Kolmogorov complexity [Wolpert 2008]. That work supports the general expectation that embedded inference has physical limits, but it does not supply the present PA-internal, predictor-indexed, above-threshold reachability theorem.

Treur's use of “relative incompleteness” in heuristic reasoning is another nearby reference, because it explicitly treats incompleteness as relative to available observations and reasoning resources [Treur 1993]. In the present section, however, the relative parameter is not an observation layer or diagnostic cost layer. It is the intrinsic predictive complexity and self-model integration structure of the processor.

The present section therefore uses the term **complexity-bounded incompleteness** for the conjunction of the following four features:

1. the object is a closed PA formula;
2. the PA proof-object exists and can be trace-certified;
3. the object is indexed to the self-model registers of a target predictor $S$;
4. reachability is asymmetric: $S$ cannot integrate $G_S$, while an above-threshold predictor with externally insulated model access can process $G_S$ externally on the witnessed branch.

The result is deliberately limited to predictor-indexed self-referential objects. It is not a claim that ordinary, non-self-referential arithmetic problems are complexity-bounded-incomplete for a predictor class.

### A.5.3 The Predictor-Indexed Diagonal Transcript Family

We work with predictive systems possessing Effective Operational Property R (Definition A.0.1; Definition A.0.6), each carrying an operational self-model $\mathcal M_S$ (Definition M.10.1). By Property R (Definition 10), such a system's relevant model class can represent coded descriptions, simulate nominated predictors on those descriptions, and evaluate the relevant predicates about predicted outputs. This is the subcapacity required by SPAP (Theorems 10–11).

Let $S$ be such a system. Let $n_S$ be the number of Fisher-orthogonal addressable deterministic SPAP registers retained in $S$'s self-model. For the $j$-th retained register, let $\eta_{S,j}>0$ denote the Fisher distance between its two operationally distinguishable binary code states, as in Theorem M.10.4, and define

$$
D_1(S):=\min_{1\le j\le n_S}\eta_{S,j}>0.
$$

Let $g$ be the tolerance profile appearing in Equation M.18. Define

$$
N^*(S):=\left\lceil\left(\frac{g(\alpha_{SPAP})}{D_1(S)}\right)^2\right\rceil+1.
\tag{A.5.1}
$$

The construction below is defined for systems satisfying the independent-register amplification condition:

$$
n_S\ge N^*(S).
\tag{A.5.2}
$$

This is the register-capacity antecedent derived and used in Theorem M.10.4, not an additional axiom.

For each $j=1,\ldots,N^*(S)$, let $S_{\mathrm{diag}}^{(j)}$ be the finite SPAP diagonal component constructed against $S$'s $j$-th Fisher-orthogonal self-model prediction register, as in Theorem 10 and Theorem M.10.4. Let

$$
e_j(S):=\ulcorner S_{\mathrm{diag}}^{(j)}\urcorner
$$

be its Gödel code, and let $x_j(S)$ be the canonical finite input/state code for the corresponding one-cycle diagonal challenge. Since each $S_{\mathrm{diag}}^{(j)}$ is a specified finite SPAP-cycle computation on that canonical input, it has a standard finite terminating trace

$$
\tau_j(S)
$$

and a unique output bit

$$
y_j(S)\in\{0,1\}.
$$

**Definition A.5.3 (Predictor-Indexed Diagonal Transcript Object).**
For a predictor $S$ satisfying Equation A.5.2, define the **diagonal transcript** of $S$ by

$$
T_S:=\left((e_j(S),x_j(S),\tau_j(S),y_j(S))\right)_{j=1}^{N^*(S)}.
\tag{A.5.3}
$$

The **predictor-indexed diagonal transcript object** $G_S$ is the closed PA formula

$$
G_S\equiv\bigwedge_{j=1}^{N^*(S)}
\mathrm{Trace}\left(\overline{e_j(S)},\overline{x_j(S)},\overline{\tau_j(S)},\overline{y_j(S)}\right).
\tag{A.5.4}
$$

Equivalently, $G_S$ asserts the exact finite output transcript of the $N^*(S)$ SPAP diagonal components constructed against $S$'s own self-model prediction registers.

**Remark A.5.1 (Why the Transcript Form Is Required).**
It would be too weak to define $G_S$ as “all diagonal outputs are $1$.” Such a sentence would be true only on the branch where those outputs happened to be $1$. The transcript formulation removes that branch dependence. $G_S$ records the actual finite output transcript of the specified diagonal systems. Its truth is unconditional in the standard model, because each conjunct is a concrete finite computation trace.

**Remark A.5.2 (Relation to LITE).**
Definition A.5.3 uses the same arithmetical infrastructure as §A.4: Gödel coding, primitive-recursive substitution, finite proof/trace checking, and fixed-point machinery. LITE applies this machinery to construct a total computable function $f$. Definition A.5.3 applies it to construct, for each predictor $S$, a PA object whose content is wired to $S$'s own self-model prediction registers. LITE demonstrates tractable self-reference; $G_S$ targets the processor's self-model boundary.

**Lemma A.5.1 (Existence, Truth, and PA Proof-Object).**
Let $S$ be a predictive system with Effective Operational Property R satisfying $n_S\ge N^*(S)$. Then $G_S$ exists as a closed PA formula, is true in the standard model $\mathbb N$, and has a finite PA proof-object.

*Proof.* For each $j\le N^*(S)$, the diagonal component $S_{\mathrm{diag}}^{(j)}$ is constructible by the diagonal construction of Theorem A.1.1 applied to the corresponding retained self-model prediction register, together with the independent-register amplification construction of Theorem M.10.4. The register-capacity condition $n_S\ge N^*(S)$ supplies the Fisher-orthogonal addressable self-model registers required by Theorem M.10.4.

The maps assembling the codes $e_j(S)$, canonical inputs $x_j(S)$, and trace formulas are computable by the primitive-recursive coding and substitution operations used in §A.4. Because each $S_{\mathrm{diag}}^{(j)}$ is a specified finite SPAP-cycle computation on a specified finite input, each has a finite standard trace $\tau_j(S)$ and output bit $y_j(S)$. Therefore each conjunct

$$
\mathrm{Trace}\left(\overline{e_j(S)},\overline{x_j(S)},\overline{\tau_j(S)},\overline{y_j(S)}\right)
$$

is a true closed finite-trace fact. By PA representability of primitive-recursive trace checking, each true closed trace instance has a finite PA verification proof. A finite conjunction of PA-provable trace instances is PA-provable. Hence $G_S$ is a closed PA formula, true in $\mathbb N$, with a finite PA proof-object. $\square$

### A.5.4 Above-Threshold Predictors, External-Model Safety, and the Lower Witness

Theorem M.10.4 requires independent self-model register capacity. Therefore the explicit lower witness cannot be the bare $K_0=3$ bit core alone. Theorem 15 supplies the minimal **per-register SPAP core**; Effective Operational Property R and independent multi-register capacity arise at the network/aggregate level (Theorem A.0.6; Definition A.0.6).

The reachability direction also requires a second distinction. It is not enough that $A$ be more complex than $S$. $A$ must host $S$'s self-model as an external object, with $S$'s represented registers kept typed and disjoint from $A$'s own self-model registers. Otherwise, reasoning about $S$'s diagonal family could secretly engage $A$'s own self-model. The definition below builds the required external separation directly into the model-access branch.

**Definition A.5.4 (Externally Insulated Model Access).**
Let $A$ and $S$ be predictive systems with Effective Operational Property R. $A$ has **externally insulated model access** to $S$ when:

1. $A$ has model access to $S$ in the sense of Theorem M.10.5: an accurate external representation of $S$'s self-model $\mathcal M_S$, parameter space $\Theta_S$, Fisher metric $\mathcal F_S$, tolerance profile $g$, prediction maps $\Pi_S^{(PP)}$, and the data needed to evaluate them;
2. there is a typed embedding

$$
\iota_{S\to A}:\Theta_S\longrightarrow\Theta_A^{(\mathrm{ext})}
\tag{A.5.5}
$$

whose image lies in $A$'s external-model subspace and is Fisher-orthogonal to $A$'s self-model subspace $\Theta_A^{(\mathrm{self})}$;

3. for $N=N^*(S)$, the represented registers

$$
\iota_{S\to A}(r_{S,1}),\ldots,\iota_{S\to A}(r_{S,N})
$$

are object-level representations of $S$'s registers, not aliases of any of $A$'s own self-model registers $r_{A,k}$;

4. processing the represented transcript $T_S$, or a PA proof-object for $G_S$, induces no retained update to $A$'s own self-model coordinates beyond the external-model update $\Delta M_A^{(\mathrm{ext})}$.

Condition 4 is the external-hosting branch of Theorem M.10.5(i) stated explicitly as part of externally insulated model access. If $A$ additionally chooses to process a different statement such as “$A$ has now verified $G_S$,” that is a separate self-referential content item about $A$. It is not required for the object-level verification of $G_S$.

**Definition A.5.5 (Above-Threshold Predictor).**
For a target predictor $S$, a predictor $A$ is **above-threshold for $S$** if

$$
C_{agg}(A)>C_{agg}(S),
\tag{A.5.6}
$$

$A$ has Effective Operational Property R, and $A$ has externally insulated model access to $S$ in the sense of Definition A.5.4.

Complexity alone is not sufficient. Model access and external register separation are part of the definition; discovery of the proof-object is not assumed unless the finite witness or a sufficient ordinary external proof-search budget is supplied for the processing event.

**Lemma A.5.2 (External-Model Safety for Represented Diagonal Families).**
Let $S$ satisfy the conditions of Lemma A.5.1, and let $A$ be above-threshold for $S$. Then processing $G_S$ as an object-level fact about $S$'s represented diagonal transcript modifies only $A$'s external model. Therefore

$$
\Delta M_A^{(\mathrm{self})}(G_S)=0,
$$

$$
\sigma_A(G_S)=0,
$$

$$
PP_A^{(G_S)}=0,
$$

$$
\delta_A(G_S)=\alpha_{SPAP},
$$

and

$$
\mu_A(G_S)=\frac{1}{\alpha_{SPAP}}.
\tag{A.5.7}
$$

*Proof.* By Definition A.5.4, $A$'s representation of $S$'s self-model is typed as external object data through the embedding

$$
\iota_{S\to A}:\Theta_S\to\Theta_A^{(\mathrm{ext})}.
$$

Each diagonal component $S_{\mathrm{diag}}^{(j)}$ in $G_S$ is constructed against $S$'s $j$-th self-model prediction register. Under $\iota_{S\to A}$, these become represented external coordinates of $A$, not $A$'s own self-model coordinates. Thus the proof-content of $G_S$ changes $A$'s external model of $S$, if it changes anything, but it does not update $A$'s self-model subspace.

By Definition M.10.2, the self-model component of the induced model-change is therefore

$$
\Delta M_A^{(\mathrm{self})}(G_S)=0.
$$

By Definition M.10.4,

$$
\sigma_A(G_S)=0.
$$

Then Corollary M.10.3.1 gives

$$
PP_A^{(G_S)}=0,\qquad
\delta_A(G_S)=\alpha_{SPAP},\qquad
\mu_A(G_S)=\frac{1}{\alpha_{SPAP}}.
$$

The statement is branch-specific: if $A$ appends an additional self-referential update about its own act of verification, that appended content has its own perspectival profile. It is not part of the object-level processing of $G_S$. $\square$

**Definition A.5.6 (Horizon-Core Aggregate Witness).**
Let $S_{K_0}$ denote the three-bit SPAP core supplied by Theorem 15, with the required roles $(\phi,p_{\mathrm{stored}},c_{\mathrm{phase}})$ and operational conditions O1–O3. For any $N$, let

$$
\mathsf{Amp}_{K_0}(N)
$$

denote a finite aggregate of $N$ Fisher-orthogonal addressable SPAP-core registers, together with the working memory, indexing, and error-correction overhead required for Effective Operational Property R as specified by Theorem A.0.6 and Definition A.0.6.

A **horizon-core aggregate witness** is any system

$$
S_0=\mathsf{Amp}_{K_0}(N_0)
\tag{A.5.8}
$$

such that

$$
d_{S_0}\ge N^*(S_0).
\tag{A.5.9}
$$

Theorem 15 supplies the minimal per-register SPAP logic; Theorem A.0.6 supplies the network-level route to Effective Operational Property R; Theorem M.10.4 supplies the required independent-register branch. No claim is made that the total aggregate $S_0$ has exact complexity $K_0$. The exact claim is that each SPAP register core is $K_0$-minimal, while the full witness is the finite Property-R aggregate required to host the diagonal amplification.

### A.5.5 The Complexity-Bounded Incompleteness Theorem

**Theorem A.5.1 (Complexity-Bounded Incompleteness: Predictor-Indexed Reachability Horizon).**
Fix Peano Arithmetic as the object-language proof system. Let $S$ be a predictive system with Effective Operational Property R satisfying

$$
n_S\ge N^*(S),
$$

and let $G_S$ be the predictor-indexed diagonal transcript object of Definition A.5.3. Then:

**(i) PA proof-object exists.** $G_S$ is true in $\mathbb N$ and has a finite PA proof-object.

**(ii) $G_S$ is unreachable for $S$.** Every content-integrating proof-act in which $S$ reaches $G_S$ induces

$$
\mu_S(G_S)=\infty,
$$

and therefore

$$
C_{\mathrm{process}}(S,G_S)=\infty.
\tag{A.5.10}
$$

Thus $G_S$ is not reachable for $S$ in the sense of Definition A.5.2.

**(iii) $G_S$ is externally reachable for any above-threshold predictor on the witnessed external branch.** If $A$ is above-threshold for $S$ and the finite transcript witnesses or a PA proof-object for $G_S$ are supplied as external data for the processing event, then $G_S$ is processed by $A$ as an external model fact about $S$. Consequently,

$$
\sigma_A(G_S)=0,
$$

$$
PP_A^{(G_S)}=0,
$$

$$
\delta_A(G_S)=\alpha_{SPAP},
$$

and

$$
\mu_A(G_S)=\frac{1}{\alpha_{SPAP}}.
\tag{A.5.11}
$$

Accordingly, on the witnessed external branch, $A$ can verify and integrate $G_S$ at SPAP-flat reflexive cost. If the PA proof-object or transcript witnesses are supplied, verification is direct. If they are not supplied, exhaustive PA proof search is only a mathematical semidecision route: it halts for $G_S$ because a proof-object exists, but physical reachability then requires an ordinary external search budget large enough to complete that finite search, and no uniform bound is claimed.

**(iv) Explicit stratification.** For any horizon-core aggregate witness $S_0=\mathsf{Amp}_{K_0}(N_0)$ satisfying Definition A.5.6, the fixed PA formula $G_{S_0}$ is unreachable for $S_0$, but externally reachable on the witnessed external branch for any predictor $A$ above-threshold for $S_0$. The same PA proof-object therefore lies on opposite sides of the reachability horizon depending only on the processing predictor.

*Proof.*

**(i)** This is Lemma A.5.1. $G_S$ is a finite conjunction of true closed trace facts. Each conjunct has a finite PA trace-verification proof, and finite conjunction preserves PA provability. Therefore $G_S$ has a PA proof-object. $\square$

**(ii)** Processing $G_S$ as content requires $S$ to integrate the exact transcript of the $N^*(S)$ diagonal systems $S_{\mathrm{diag}}^{(j)}$, each constructed against $S$'s own $j$-th self-model prediction register. Therefore the induced model-change has nonzero self-model component:

$$
\Delta M_S^{(\mathrm{self})}(G_S)\ne 0,
$$

so by Definition M.10.2 and Definition M.10.4,

$$
\sigma_S(G_S)>0.
$$

More strongly, $G_S$ is the arithmetical encoding of the joint diagonal pattern $E^{(N)}$ in Theorem M.10.4 with $N=N^*(S)$. By the uniform per-register diagonal discrepancy and Fisher orthogonality of the independent registers, for every $PP\in[0,\alpha_{SPAP})$,

$$
\left\|\Pi_S^{(PP)}(\theta_S')-\theta_S'\right\|_{\mathcal F_S}
\ge
\sqrt{N^*(S)}\,D_1(S).
\tag{A.5.12}
$$

The choice of $N^*(S)$ in Equation A.5.1 gives

$$
\sqrt{N^*(S)}\,D_1(S)>g(\alpha_{SPAP}).
\tag{A.5.13}
$$

Since $g$ is monotone and $g(\alpha_{SPAP}-PP)\le g(\alpha_{SPAP})$ for every $PP\in[0,\alpha_{SPAP})$, the self-consistency constraint of Equation M.18 fails at every subboundary performance level. At $PP=\alpha_{SPAP}$, the tolerance is $g(0)=0$, and the SPAP fixed-point exclusion for the joint diagonal object rules out exact equality. Hence the constraint set is empty. Therefore

$$
PP_S^{(G_S)}=\alpha_{SPAP},
$$

$$
\delta_S(G_S)=0,
$$

and

$$
\mu_S(G_S)=\infty
$$

by Theorem M.10.4.

By Theorem M.10.6, $\mu_S(G_S)=\infty$ implies

$$
C_{\mathrm{process}}(S,G_S)=\infty.
$$

Equivalently, no finite content-integrating processing event by $S$ can reach $G_S$. This remains true even though the PA proof-object exists by part (i). $\square$

**(iii)** Let $A$ be above-threshold for $S$, and suppose the finite transcript witnesses or a PA proof-object for $G_S$ are supplied as external data for the processing event. The diagonal systems $S_{\mathrm{diag}}^{(j)}$ are constructed against $S$'s self-model registers, not $A$'s. By Definition A.5.5, $A$ has externally insulated model access to $S$. Hence Lemma A.5.2 applies:

$$
\Delta M_A^{(\mathrm{self})}(G_S)=0,
$$

$$
\sigma_A(G_S)=0,
$$

and

$$
\mu_A(G_S)=\frac{1}{\alpha_{SPAP}}.
$$

The reflexive cost component for $A$ vanishes. $A$'s remaining cost is the ordinary external cost of reading or computing the finite transcript $T_S$, checking the PA proof-object from part (i), and updating its external model of $S$. That cost may scale with the size of $S$, the length of the transcript, and the length of the PA proof-object, but it is SPAP-flat on $A$'s externally insulated branch. Thus $G_S$ is externally reachable for $A$ on the witnessed external branch. $\square$

**(iv)** Let $S_0=\mathsf{Amp}_{K_0}(N_0)$ be a horizon-core aggregate witness. By Definition A.5.6, $S_0$ has Effective Operational Property R and enough Fisher-orthogonal self-model register capacity for Theorem M.10.4. Applying part (ii) with $S=S_0$ gives

$$
\mu_{S_0}(G_{S_0})=\infty
$$

and

$$
C_{\mathrm{process}}(S_0,G_{S_0})=\infty.
$$

Therefore $G_{S_0}$ is unreachable for $S_0$. Applying part (iii) to any predictor $A$ above-threshold for $S_0$ gives

$$
\mu_A(G_{S_0})=\frac{1}{\alpha_{SPAP}},
$$

so $G_{S_0}$ is externally reachable for $A$ on the witnessed external branch. The PA formula $G_{S_0}$ and its proof-object are fixed. Only the processing predictor changes. $\square$

**Corollary A.5.1 (No Predictor Clears Its Own Horizon).**
For every predictive system $A$ satisfying the hypotheses of Theorem A.5.1, the object $G_A$ is unreachable for $A$. Therefore no such predictor reaches the whole family

$$
\{G_S:S\text{ satisfies the hypotheses of Theorem A.5.1}\}.
$$

*Proof.* Apply Theorem A.5.1(ii) with $S=A$. Since $G_A$ is constructed against $A$'s own self-model prediction registers,

$$
\mu_A(G_A)=\infty
$$

and

$$
C_{\mathrm{process}}(A,G_A)=\infty.
$$

Thus $A$ fails to reach at least $G_A$. If $A'$ is above-threshold for $A$ and is supplied with the finite external witnesses required by Theorem A.5.1(iii), then $A'$ can reach $G_A$ on the witnessed external branch, but applying Theorem A.5.1(ii) to $A'$ gives that $G_{A'}$ is unreachable for $A'$. Greater complexity moves the horizon outward; it does not abolish the horizon. $\square$

**Corollary A.5.2 (Non-Closability by Resources Internal to the Same Fixed Predictor).**
Let $S$ satisfy the hypotheses of Theorem A.5.1, and hold $S$'s indexed predictor identity fixed over the evaluation interval. The unreachability of $G_S$ for that fixed $S$ is not removed by:

1. acquiring additional external data while remaining the same indexed predictor $S$;
2. adding axioms to PA;
3. increasing finite computation time;
4. non-integrating collaboration with predictors that do not form an above-threshold aggregate for $S$.

For the fixed indexed claim, the gap is closed only by changing the processing event to an above-threshold predictor in the sense of Definition A.5.5 on the witnessed external branch.

*Proof.* The obstruction is

$$
\mu_S(G_S)=\infty
$$

and hence

$$
C_{\mathrm{process}}(S,G_S)=\infty
$$

by Theorem A.5.1(ii).

Additional external data can modify $\Delta M_S^{(\mathrm{ext})}$, but it does not remove the fact that $G_S$ is indexed to $S$'s own self-model registers. If the acquired data changes $S$'s self-model, register capacity, or aggregate complexity enough that the processor is no longer the same indexed predictor, the formal object has changed from $S$ to a new predictor $S'$. In that case, the specific claim about fixed $G_S$ no longer describes the same processor. The hierarchy claim persists because Corollary A.5.1 applies to $G_{S'}$.

Adding axioms cannot remove the obstruction, because the PA proof-object already exists by Theorem A.5.1(i). The failure is not absence of formal derivability; it is divergent self-model integration cost.

Increasing finite computation time cannot complete a processing event whose required cost is infinite. An infinite limiting process is not a completed finite operational proof-act in the sense of Definition A.5.2.

Finally, collaboration helps only if the collaborators form a new integrated aggregate $A$ with Effective Operational Property R, externally insulated model access to $S$, and

$$
C_{agg}(A)>C_{agg}(S).
$$

But such an aggregate is precisely an above-threshold predictor by Definition A.5.5, and reachability still requires the witnessed external branch of Theorem A.5.1(iii). Collaboration that does not produce such an aggregate leaves the self-model-indexed SPAP boundary unchanged. Therefore the fixed-predictor gap is closed only by an above-threshold predictor on the witnessed external branch. $\square$

### A.5.6 Interpretation and Scope

**Remark A.5.3 (Contrast with Gödel).**
Theorem A.5.1 is not another proof of Gödelian incompleteness. It is a predictor-indexed dual phenomenon.

In Gödelian incompleteness, the formal system is the limiting object: under the relevant hypotheses, the proof is not present in the system. In complexity-bounded incompleteness, PA is not the limiting object: $G_S$ is already PA-provable. The limiting object is the predictor's ability to integrate that proof-content.

In Gödelian incompleteness, adding axioms may settle the specific Gödel sentence, though new incompleteness phenomena arise for the strengthened system. In complexity-bounded incompleteness, adding axioms does not address the obstruction, because the proof-object already exists. The obstruction is the SPAP proximity boundary

$$
\mu_S(G_S)=\infty,
$$

which becomes a physical processing divergence through Theorem M.10.3, Corollary B.2.1, Theorem B.2, and Theorem M.10.6.

**Remark A.5.4 (Why the Theorem Is Not Syntactic-Proof Triviality).**
If a PA proof string for $G_S$ is handed to $S$, $S$ may be able to perform finite syntactic manipulations on the string as an uninterpreted external object. That does not contradict Theorem A.5.1. The theorem concerns the reachability of the proof-content: the act in which $S$ verifies the proof and integrates what it proves about $S$'s own diagonal self-model registers. The divergent term is the self-model integration cost, not the symbol-by-symbol proof-checking cost considered in isolation.

**Remark A.5.5 (Scope: the Horizon Surrounds Predictor-Indexed Self-Reference).**
The family $\{G_S\}$ consists of predictor-indexed self-referential transcript objects. Each $G_S$ is wired to the diagonal systems constructed against $S$'s own self-model prediction registers. Theorem A.5.1 therefore establishes a reachability horizon for this family of arithmetical objects.

No claim is made that ordinary, non-self-referential number-theoretic statements are complexity-bounded-incomplete for any predictor class. For a non-self-referential arithmetic statement that modifies only an external model component, the relevant processing has

$$
\sigma_S=0,
$$

and hence

$$
\mu_S=\frac{1}{\alpha_{SPAP}}
$$

by Corollary M.10.3.1. Such statements are outside the diagonal family unless their processing necessarily engages the predictor's self-model. Whether an apparently ordinary theorem can be transformed into a predictor-indexed self-model engagement is a separate question and is not asserted here.

**Remark A.5.6 (Consistency with LITE).**
There is no tension with §A.4. LITE is total and computable (Theorem A.4.1), and evaluating $f(n)$ does not by itself require the evaluator to integrate a statement about its own SPAP diagonal self-model registers. LITE is therefore a tractable self-referential construction.

The object $G_S$ is different. It is not merely a function value to compute. It is a trace-certified PA object whose content is about the exact diagonal transcript targeted at $S$'s own self-model registers. LITE shows that PA can host tractable self-reference. Theorem A.5.1 shows that PA can also host proof-objects whose reachability is stratified by the predictor processing them.

**Remark A.5.7 (Conditional Status Within PU).**
Theorem A.5.1 is conditional on the PU formal apparatus. The PA-side claims use standard trace representability and finite proof verification. The reachability and unreachability claims additionally require the PU assumptions and derived results that connect self-model engagement to SPAP proximity and SPAP proximity to processing cost:

$$
\text{Property R}
\to
\text{SPAP diagonal construction}
\to
\mu_S(G_S)=\infty
\to
C_{\mathrm{process}}(S,G_S)=\infty.
$$

Readers who accept only the PA side get a trace-certified family of predictor-indexed arithmetical objects. The incompleteness-as-processing-horizon conclusion follows only when the Appendix M and Appendix B cost chain is also granted.

**Remark A.5.8 (Terminology).**
The term *complexity-bounded incompleteness* is narrower than *relative incompleteness*. It does not mean “incomplete relative to an oracle,” “incomplete relative to a dataset,” or “incomplete relative to a weaker proof system.” It means:

$$
\text{PA proof exists}
\quad+\quad
\text{target predictor cannot integrate it}
\quad+\quad
\text{above-threshold predictor can integrate it externally on the witnessed branch}.
$$

The incompleteness is therefore bounded by predictive complexity and self-model integration structure, not by the formal strength of PA.

### A.5.6a Phase-Indexed Access, Historical Recovery, and Model-Indexed LITE

The A.5 theorem separates PA proof-existence from predictor reachability. This subsection records the cycle-indexed form of that separation. It is a conservative refinement of the same mechanism: truth and proofhood remain fixed, while active access is predictor-indexed, time-indexed, and verification-gated.

**Definition A.5.6a.1 (Time-Indexed Prediction Register).** Let $\mathcal F$ be a consistent arithmetically adequate formal theory capable of representing primitive-recursive functions, finite computations, execution traces, and Gödel coding. A trace-certified predictor $B$ has a total prediction-register map
$$
P_B:\mathbb N\times\mathbb N\to\{1,0,\bot\},
$$
where $1$ means that $B$ predicts the sentence true, $0$ means that $B$ predicts the sentence false, and $\bot$ means that no Boolean prediction is delivered by the cycle boundary.

Trace certification means that there is a formula
$$
\operatorname{Val}_B(t,e,y)
$$
representing the finite register fact $P_B(t,e)=y$, with $y\in\{1,0,\bot\}$ coded by fixed numerals, such that for every concrete $t,e$ and every $y\in\{1,0,\bot\}$,
$$
\mathbb N\models \operatorname{Val}_B(\bar t,\bar e,\bar y)
\Longleftrightarrow
P_B(t,e)=y,
$$
and, for the actual value $y_0=P_B(t,e)$,
$$
\mathcal F\vdash \operatorname{Val}_B(\bar t,\bar e,\bar y_0),
$$
while for every $z\in\{1,0,\bot\}$ with $z\ne y_0$,
$$
\mathcal F\vdash \neg\operatorname{Val}_B(\bar t,\bar e,\bar z).
$$
Define
$$
\operatorname{Pred}_B(t,e):=\operatorname{Val}_B(t,e,1),
$$
$$
\operatorname{PredFalse}_B(t,e):=\operatorname{Val}_B(t,e,0),
$$
and
$$
\operatorname{Abstain}_B(t,e):=\operatorname{Val}_B(t,e,\bot).
$$
Thus, for every concrete $t,e$,
$$
P_B(t,e)=1
\Longrightarrow
\mathcal F\vdash\operatorname{Pred}_B(\bar t,\bar e),
$$
and
$$
P_B(t,e)\ne1
\Longrightarrow
\mathcal F\vdash\neg\operatorname{Pred}_B(\bar t,\bar e).
$$
All semantic truth claims in this subsection are external standard-model claims; no truth predicate for $\mathcal F$ is assumed inside $\mathcal F$.

For a sentence $\varphi$ with Gödel code $e=\ulcorner\varphi\urcorner$, define active processability at time $t$ by
$$
\operatorname{Proc}_B(\varphi,t)
\Longleftrightarrow
\bigl(P_B(t,e)=1\wedge\mathbb N\models\varphi\bigr)
\vee
\bigl(P_B(t,e)=0\wedge\mathbb N\models\neg\varphi\bigr).
\tag{A.5.6a.1}
$$
If $P_B(t,e)=\bot$, then $\varphi$ is not actively processed by $B$ at $t$.

**Theorem A.5.6a.2 (Time-Indexed Diagonal Object).** For every trace-certified predictor $B$ and every time $t$, there exists a sentence $E_{B,t}$ with Gödel code $e_{B,t}$ such that
$$
\mathcal F\vdash
E_{B,t}
\leftrightarrow
\neg\operatorname{Pred}_B(\bar t,\overline{e_{B,t}}).
\tag{A.5.6a.2}
$$
Equivalently,
$$
\mathbb N\models E_{B,t}
\Longleftrightarrow
P_B(t,e_{B,t})\ne1.
\tag{A.5.6a.3}
$$

*Proof.* Apply the diagonal fixed-point lemma to the formula $\neg\operatorname{Pred}_B(\bar t,x)$. This gives a sentence $E_{B,t}$ satisfying Equation A.5.6a.2. Interpreting the represented predicate in the standard model gives Equation A.5.6a.3. ∎

**Theorem A.5.6a.3 (No Stable Self-Processing at the Targeted Time).** For the time-indexed diagonal object $E_{B,t}$,
$$
\neg\operatorname{Proc}_B(E_{B,t},t).
\tag{A.5.6a.4}
$$

*Proof.* Let $e=e_{B,t}$. By Equation A.5.6a.3,
$$
\mathbb N\models E_{B,t}
\Longleftrightarrow
P_B(t,e)\ne1.
$$
There are exactly three possible register values.

If $P_B(t,e)=1$, then $P_B(t,e)\ne1$ is false, so $E_{B,t}$ is false. $B$ predicts true and is wrong.

If $P_B(t,e)=0$, then $P_B(t,e)\ne1$ is true, so $E_{B,t}$ is true. $B$ predicts false and is wrong.

If $P_B(t,e)=\bot$, then $B$ gives no Boolean prediction, so $E_{B,t}$ is not actively processed by Definition A.5.6a.1.

All possible register states fail. ∎

**Theorem A.5.6a.4 (External and Historical Accessibility).** Let $A$ have external model access to $B$'s time-$t$ register, meaning that $A$ can determine $P_B(t,e)$ without making that value part of $A$'s own active prediction register. Define
$$
P_A(t,e_{B,t})
=
\begin{cases}
0, & P_B(t,e_{B,t})=1,\\
1, & P_B(t,e_{B,t})\in\{0,\bot\}.
\end{cases}
\tag{A.5.6a.5}
$$
Then
$$
\operatorname{Proc}_A(E_{B,t},t).
\tag{A.5.6a.6}
$$

If $B$ faithfully appends the historical record
$$
H_{B,t+1}
=
H_{B,t}\cup\{(t,e_{B,t},P_B(t,e_{B,t}))\},
\tag{A.5.6a.7}
$$
and at time $t+1$ evaluates
$$
P_B(t+1,e_{B,t})
=
\begin{cases}
0, & (t,e_{B,t},1)\in H_{B,t+1},\\
1, & (t,e_{B,t},1)\notin H_{B,t+1},
\end{cases}
\tag{A.5.6a.8}
$$
then
$$
\operatorname{Proc}_B(E_{B,t},t+1).
\tag{A.5.6a.9}
$$

*Proof.* For $A$, Equation A.5.6a.3 says that $E_{B,t}$ is false exactly when $P_B(t,e_{B,t})=1$, and true exactly when $P_B(t,e_{B,t})\in\{0,\bot\}$. Equation A.5.6a.5 assigns the matching Boolean value, so $A$ actively processes $E_{B,t}$.

For $B$ at $t+1$, faithful recording gives
$$
(t,e_{B,t},1)\in H_{B,t+1}
\Longleftrightarrow
P_B(t,e_{B,t})=1.
$$
Thus
$$
(t,e_{B,t},1)\notin H_{B,t+1}
\Longleftrightarrow
P_B(t,e_{B,t})\ne1.
$$
By Equation A.5.6a.3 this is exactly the truth condition for $E_{B,t}$. Equation A.5.6a.8 therefore makes $B$'s time-$t+1$ output match the truth value of $E_{B,t}$. ∎

The regress terminates because $E_{B,t}$ refers to the old register $P_B(t,e_{B,t})$, not to the new register $P_B(t+1,e_{B,t})$. A new diagonal object $E_{B,t+1}$ can be constructed against the next active register, but that is a new object.

**Lemma A.5.6a.5 (Chance-Null Registers Are Update-Null).** Let $M_t$ be the retained model of a predictor $S_t$, let $R_T$ be a finite verification register, and let $\mathcal U_S$ be the admissible update family. For an update $U\in\mathcal U_S$, define
$$
\Delta Q_U(M_t,R_T)
=
Q(U(M_t,R_T))-Q(M_t).
$$
If
$$
\sup_{U\in\mathcal U_S}
\mathbb E[\Delta Q_U(M_t,R_T)\mid M_t]\le0,
\tag{A.5.6a.10}
$$
then the retained PCE update is the identity in the predictive quotient:
$$
[\mathcal U_{\mathrm{PCE}}(M_t,R_T)]_Q=[M_t]_Q.
\tag{A.5.6a.11}
$$

*Proof.* Equation A.5.6a.10 says that no admissible update driven by $R_T$ has positive expected predictive gain. The no-op update $U_0(M_t,R_T)=M_t$ is admissible and changes no retained predictive content. Any nontrivial retained transformation supplied by a chance-null register is either predictively neutral in the quotient or cost-dominated by the no-op. PCE therefore selects the no-change representative in $[\cdot]_Q$. ∎

**Theorem A.5.6a.6 (Verification-Gated Reachability).** Let
$$
M_{t+1}:=\mathcal U_{\mathrm{PCE}}(M_t,R_T).
$$
Assume the retained reachability horizon $\mathcal H(M)$ is invariant under predictive equivalence:
$$
[M]_Q=[M']_Q\Longrightarrow\mathcal H(M)=\mathcal H(M').
\tag{A.5.6a.12}
$$
If a transition moves a determinate trace-certified object $O$ from outside to inside the retained horizon,
$$
O\notin\mathcal H(M_t)
\quad\text{and}\quad
O\in\mathcal H(M_{t+1}),
$$
then $R_T$ is not chance-null:
$$
\sup_{U\in\mathcal U_S}
\mathbb E[\Delta Q_U(M_t,R_T)\mid M_t]>0.
\tag{A.5.6a.13}
$$

*Proof.* Suppose the transition crosses the retained horizon while $R_T$ is chance-null. Lemma A.5.6a.5 gives
$$
[M_{t+1}]_Q=[M_t]_Q.
$$
By horizon invariance,
$$
\mathcal H(M_{t+1})=\mathcal H(M_t).
$$
This contradicts $O\notin\mathcal H(M_t)$ and $O\in\mathcal H(M_{t+1})$. Hence $R_T$ is not chance-null. ∎

**Definition A.5.6a.7 (Labeled Model-Indexed LITE Search).** Let $\operatorname{Proof}_{\mathcal F}(p,e)$ be the primitive-recursive proof predicate for $\mathcal F$, and let $\operatorname{Neg}(e)$ be the primitive-recursive function sending the Gödel code of a sentence to the Gödel code of its negation.

For $y\in\{0,1\}$, define the PA-representable labeled proof predicate
$$
\operatorname{LabProof}_{\mathcal F}(p,e,1)
\Longleftrightarrow
\operatorname{Proof}_{\mathcal F}(p,e),
$$
$$
\operatorname{LabProof}_{\mathcal F}(p,e,0)
\Longleftrightarrow
\operatorname{Proof}_{\mathcal F}(p,\operatorname{Neg}(e)).
\tag{A.5.6a.14}
$$
Thus label $1$ means that $p$ proves the sentence coded by $e$, while label $0$ means that $p$ proves its negation.

An active admissibility predicate
$$
\operatorname{Adm}^{\mathrm{act}}_B(t,p,e,y)
$$
is PA-representable and is register-coherent for $B$ at time $t$ when, for every $p,e$ and $y\in\{0,1\}$,
$$
\operatorname{Adm}^{\mathrm{act}}_B(t,p,e,y)
\Longrightarrow
P_B(t,e)=y.
\tag{A.5.6a.15}
$$
Since $y$ is Boolean, a predictor with $P_B(t,e)=\bot$ admits no proof as active Boolean evidence for $e$. Register coherence blocks the degenerate predicate that admits every proof for every label, because such a predicate would admit labels not issued by the active register.

For a bound $N$, define the active labeled search set
$$
\mathcal S^{\mathrm{act}}_B(t,e,N)
=
\{(y,p):y\in\{0,1\},\ p\le N,\ 
\operatorname{LabProof}_{\mathcal F}(p,e,y)
\wedge
\operatorname{Adm}^{\mathrm{act}}_B(t,p,e,y)\}.
\tag{A.5.6a.16}
$$
If $\mathcal S^{\mathrm{act}}_B(t,e,N)$ is nonempty, then $\operatorname{LITE}^{\mathrm{act}}_B(t,e,N)$ is the element of $\mathcal S^{\mathrm{act}}_B(t,e,N)$ with least proof code $p$, breaking ties by $0<1$ on the label. If the set is empty, then
$$
\operatorname{LITE}^{\mathrm{act}}_B(t,e,N)=\bot.
$$

For the diagonal target $e=e_{B,t}$, define the historical label
$$
y^*_{B,t}
=
\begin{cases}
0, & P_B(t,e)=1,\\
1, & P_B(t,e)\in\{0,\bot\}.
\end{cases}
\tag{A.5.6a.17}
$$
Historical admissibility after the faithful update is a PA-representable predicate
$$
\operatorname{Adm}^{\mathrm{hist}}_B(t+1,p,e,y).
$$
It is faithful for the diagonal query when there exists a finite proof code $p$ such that
$$
\operatorname{LabProof}_{\mathcal F}(p,e,y^*_{B,t})
\wedge
\operatorname{Adm}^{\mathrm{hist}}_B(t+1,p,e,y^*_{B,t}).
$$

For a bound $N$, define
$$
\mathcal S^{\mathrm{hist}}_B(t+1,e,N)
=
\{(y,p):y\in\{0,1\},\ p\le N,\ 
\operatorname{LabProof}_{\mathcal F}(p,e,y)
\wedge
\operatorname{Adm}^{\mathrm{hist}}_B(t+1,p,e,y)\}.
\tag{A.5.6a.18}
$$
If $\mathcal S^{\mathrm{hist}}_B(t+1,e,N)$ is nonempty, then $\operatorname{LITE}^{\mathrm{hist}}_B(t+1,e,N)$ is the element of $\mathcal S^{\mathrm{hist}}_B(t+1,e,N)$ with least proof code $p$, breaking ties by $0<1$ on the label. If the set is empty, then
$$
\operatorname{LITE}^{\mathrm{hist}}_B(t+1,e,N)=\bot.
$$

The labeled search distinguishes formal proofhood, the label carried by the proof, and the phase-indexed admissibility relation through which $B$ may use that proof.

**Theorem A.5.6a.8 (Register-Coherent Active Miss and Historical Labeled Recovery).** Let $B$ be trace-certified over a consistent $\mathcal F$. Let $E_{B,t}$ be the diagonal object from Theorem A.5.6a.2 and let $e=e_{B,t}$. If $\operatorname{Adm}^{\mathrm{act}}_B$ is register-coherent at $t$, then for every $N$,
$$
\operatorname{LITE}^{\mathrm{act}}_B(t,e,N)=\bot.
\tag{A.5.6a.19}
$$
Moreover, there exists a finite proof code $p_{\mathrm{corr}}$ such that
$$
\operatorname{LabProof}_{\mathcal F}(p_{\mathrm{corr}},e,y^*_{B,t}).
\tag{A.5.6a.20}
$$
If the historical admissibility predicate is faithful for the diagonal query, and $p_{\mathrm{hist}}$ is any proof code witnessing faithfulness, then for every $N\ge p_{\mathrm{hist}}$,
$$
\operatorname{LITE}^{\mathrm{hist}}_B(t+1,e,N)\ne\bot,
\tag{A.5.6a.21}
$$
and the returned label is $y^*_{B,t}$.

*Proof.* First suppose, toward contradiction, that $\operatorname{LITE}^{\mathrm{act}}_B(t,e,N)\ne\bot$. Then there are $y\in\{0,1\}$ and $p\le N$ such that
$$
\operatorname{LabProof}_{\mathcal F}(p,e,y)
\quad\text{and}\quad
\operatorname{Adm}^{\mathrm{act}}_B(t,p,e,y).
$$
By register coherence, $P_B(t,e)=y$.

If $y=1$, then $P_B(t,e)=1$. Trace certification gives
$$
\mathcal F\vdash\operatorname{Pred}_B(\bar t,\bar e).
$$
Since $\operatorname{LabProof}_{\mathcal F}(p,e,1)$, the proof code $p$ proves $E_{B,t}$, so $\mathcal F\vdash E_{B,t}$. From Equation A.5.6a.2, $\mathcal F\vdash E_{B,t}\to\neg\operatorname{Pred}_B(\bar t,\bar e)$. Hence $\mathcal F\vdash\neg\operatorname{Pred}_B(\bar t,\bar e)$, contradicting consistency.

If $y=0$, then $P_B(t,e)=0$. Trace certification gives
$$
\mathcal F\vdash\neg\operatorname{Pred}_B(\bar t,\bar e).
$$
Since $\operatorname{LabProof}_{\mathcal F}(p,e,0)$, the proof code $p$ proves $\neg E_{B,t}$, so $\mathcal F\vdash\neg E_{B,t}$. From Equation A.5.6a.2, $\mathcal F\vdash\neg\operatorname{Pred}_B(\bar t,\bar e)\to E_{B,t}$. Hence $\mathcal F\vdash E_{B,t}$, again contradicting consistency. Therefore $\mathcal S^{\mathrm{act}}_B(t,e,N)$ is empty for every $N$, proving Equation A.5.6a.19.

It remains to prove existence of a proof of the correct historical label. If $P_B(t,e)=1$, then $y^*_{B,t}=0$. Trace certification gives $\mathcal F\vdash\operatorname{Pred}_B(\bar t,\bar e)$, and Equation A.5.6a.2 gives $\mathcal F\vdash E_{B,t}\to\neg\operatorname{Pred}_B(\bar t,\bar e)$. Classical logic gives $\mathcal F\vdash\neg E_{B,t}$, so some finite proof code $p_{\mathrm{corr}}$ satisfies $\operatorname{LabProof}_{\mathcal F}(p_{\mathrm{corr}},e,0)$.

If $P_B(t,e)\in\{0,\bot\}$, then $y^*_{B,t}=1$. Trace certification gives $\mathcal F\vdash\neg\operatorname{Pred}_B(\bar t,\bar e)$, and Equation A.5.6a.2 gives $\mathcal F\vdash\neg\operatorname{Pred}_B(\bar t,\bar e)\to E_{B,t}$. Hence $\mathcal F\vdash E_{B,t}$, so some finite proof code $p_{\mathrm{corr}}$ satisfies $\operatorname{LabProof}_{\mathcal F}(p_{\mathrm{corr}},e,1)$. This proves Equation A.5.6a.20 in all cases.

If historical admissibility is faithful and $p_{\mathrm{hist}}$ witnesses faithfulness, then for every $N\ge p_{\mathrm{hist}}$ the pair $(y^*_{B,t},p_{\mathrm{hist}})$ belongs to $\mathcal S^{\mathrm{hist}}_B(t+1,e,N)$. Hence $\operatorname{LITE}^{\mathrm{hist}}_B(t+1,e,N)\ne\bot$.

Finally, suppose a returned historical label were $1-y^*_{B,t}$. Then some proof code $q$ would satisfy $\operatorname{LabProof}_{\mathcal F}(q,e,1-y^*_{B,t})$. Together with the proof of the correct label from Equation A.5.6a.20, this would give proofs in $\mathcal F$ of both $E_{B,t}$ and $\neg E_{B,t}$, contradicting consistency. Therefore every returned historical label is $y^*_{B,t}$. ∎

**Corollary A.5.6a.9 (Fixed Proofhood and Local Proof-Access Gain).** For the diagonal object $E_{B,t}$, formal proofhood of the correct label and active access to that proof are distinct:
$$
\exists p_{\mathrm{corr}}\,\operatorname{LabProof}_{\mathcal F}(p_{\mathrm{corr}},e_{B,t},y^*_{B,t}),
$$
while, under register-coherent active admissibility,
$$
\forall N\,\operatorname{LITE}^{\mathrm{act}}_B(t,e_{B,t},N)=\bot.
$$
If historical admissibility is faithful and $p_{\mathrm{hist}}$ witnesses faithfulness, then for every $N\ge p_{\mathrm{hist}}$,
$$
\operatorname{LITE}^{\mathrm{hist}}_B(t+1,e_{B,t},N)\ne\bot
$$
with returned label $y^*_{B,t}$.

For the fixed local diagonal-access task, define
$$
Q_{B,t,e,N}(M)=1
$$
when $M$ returns a non-$\bot$ labeled proof of $e$ within bound $N$ whose label is $y^*_{B,t}$, and define $Q_{B,t,e,N}(M)=0$ otherwise. Let $M_B^{\mathrm{act}}(t)$ be $B$'s active access state at $t$, and let $M_B^{\mathrm{hist}}(t+1)$ be the post-update historical access state. For $N\ge p_{\mathrm{hist}}$,
$$
Q_{B,t,e,N}(M_B^{\mathrm{act}}(t))=0,
\qquad
Q_{B,t,e,N}(M_B^{\mathrm{hist}}(t+1))=1,
$$
so
$$
\Delta Q
=
Q_{B,t,e,N}(M_B^{\mathrm{hist}}(t+1))
-
Q_{B,t,e,N}(M_B^{\mathrm{act}}(t))
=1>0.
$$
This is a local proof-access gain for the fixed diagonal task; it does not assert improvement for arbitrary predictive-quality functionals.

*Proof.* The formal proof exists by Equation A.5.6a.20. Active miss and historical recovery are Equations A.5.6a.19 and A.5.6a.21. The values of $Q_{B,t,e,N}$ follow directly from its definition. ∎

---

## A.6 Generative Non-Closure and Axiom Stabilization

This section records a conservative consequence of §§A.0-A.5. It introduces no new physical primitive and no additional axiom. It only reorganizes the existing SPAP/RUD/Property-R and reachability-horizon results into a structural statement: total internal reflexive self-closure is impossible for the relevant predictors, while stable finite partial closures are necessary for any nontrivial verified prediction-update cycle. These partial closures are the formal source of axiom-like structure inside PU.

### A.6.1 Internal closure maps

**Definition A.6.1 (Trace-diagonal internal closure domain).** Let $S$ be a predictive system with Effective Operational Property R and self-model $\mathcal M_S$. Let $\mathsf{TC}_S$ be the represented class of finite PA trace-certified objects whose decoded content concerns states, predictions, proof traces, update traces, or model registers that $S$ can encode. On the hypotheses of Theorem A.5.1, let

$$
G_S\in\mathsf{TC}_S
$$

denote the predictor-indexed diagonal transcript object of Definition A.5.3. A represented domain

$$
D_S\subseteq\mathsf{TC}_S
$$

is **trace-diagonal complete for $S$** when $G_S\in D_S$ and $D_S$ contains the finite trace witnesses needed to recognize $G_S$ as the object constructed in Definition A.5.3.

**Definition A.6.2 (Internal finite-cost closure map).** Let $D_S\subseteq\mathsf{TC}_S$. An $S$-internal map

$$
\operatorname{Cl}_S:D_S\to\{0,1,\bot\}
$$

is an **internal finite-cost closure map** on $D_S$ when the following conditions hold.

1. **Representability.** A code for $\operatorname{Cl}_S$ is represented in the model class available to $S$.
2. **Internal update use.** When $\operatorname{Cl}_S(H)\in\{0,1\}$, the output is available to $S$ as a retained judgment in its own prediction-update loop.
3. **Finite integration.** If $\operatorname{Cl}_S(H)=1$ for a PA-provable trace-certified object $H$ with proof-object $p$, then the accepting update requires a finite content-integrating event of the form $\mathrm{Reach}_S(H,p)$ in the sense of Definition A.5.2.
4. **Abstention.** The value $\bot$ is an explicit refusal to close the object internally. It is not a truth value.

The map is **total on $D_S$** when it never returns $\bot$. It is **trace-accepting on $D_S$** when every true trace-certified object $H\in D_S$ with a PA proof-object is assigned value $1$ and accepted through a finite content-integrating event.

**Theorem A.6.2 (No total internal trace-diagonal self-closure).** Let $S$ satisfy the hypotheses of Theorem A.5.1, and let $D_S$ be trace-diagonal complete for $S$. Then no $S$-internal map

$$
\operatorname{Cl}_S:D_S\to\{0,1,\bot\}
$$

is simultaneously total, trace-accepting, and finite-cost on $D_S$.

*Proof.* Since $D_S$ is trace-diagonal complete, $G_S\in D_S$. By Theorem A.5.1(i), $G_S$ is true in $\mathbb N$ and has a finite PA proof-object. If $\operatorname{Cl}_S$ is total and trace-accepting on $D_S$, then

$$
\operatorname{Cl}_S(G_S)=1
$$

and the accepting update requires a finite content-integrating event $\mathrm{Reach}_S(G_S,p)$ for some PA proof-object $p$ of $G_S$. This contradicts Theorem A.5.1(ii), which states that every content-integrating proof-act for $G_S$ by $S$ induces

$$
\mu_S(G_S)=\infty
$$

and hence

$$
C_{\mathrm{process}}(S,G_S)=\infty.
$$

Therefore no such total trace-accepting finite-cost internal closure map exists. ∎

### A.6.2 Stable partial closures

**Definition A.6.3 (Stable axiom-stabilizer).** A **stable axiom-stabilizer** for a predictor $S$ under finite budget $B$ is a tuple

$$
\mathfrak A_{S,B}
=
(D_{S,B},J_{S,B},\vdash_{S,B},V_{S,B},q_{S,B})
$$

with the following components.

1. $D_{S,B}$ is a finite or finitely generated retained judgment domain of represented prediction, verification, model-update, and response claims available within budget $B$.
2. $J_{S,B}\subseteq D_{S,B}$ is the seed set of accepted base judgments.
3. $\vdash_{S,B}$ is the retained finite inference/update relation generated by the composition, memory, and uniform-specification operations available to the predictor.
4. $V_{S,B}:D_{S,B}\to\{0,1\}$ is the finite verification predicate obtained from the protocol acceptance cut of Remark A.0.1.1.
5. $q_{S,B}$ is the response quotient identifying judgments that have the same retained finite protocol-response role.

The tuple is stable when it satisfies:

1. **finite response:** every retained judgment in $D_{S,B}$ has finite protocol response and finite processing cost bounded by $B$;
2. **local soundness:** derivability inside $\vdash_{S,B}$ preserves the retained verification predicate after quotienting by $q_{S,B}$;
3. **composition closure:** finite compositions of admitted prediction-update steps remain in $D_{S,B}$ whenever their protocol responses are retained by $q_{S,B}$;
4. **diagonal guard:** no trace-diagonal complete subdomain is closed by forced retained truth values at finite cost; any trace-diagonal object whose accepting update would trigger the Theorem A.5.1(ii) obstruction is excluded from $D_{S,B}$ rather than accepted as an internally integrated judgment;
5. **PCE minimality:** when the relevant response-equivalence class has an attained PCE minimum under Definition 15 and Definition 15a, $\mathfrak A_{S,B}$ is represented by a least-cost member of that class.

**Theorem A.6.4 (Axiom-stabilizer necessity for nontrivial verified prediction).** Every nontrivial finite prediction-update cycle satisfying the Fundamental Predictive Loop, binary verification, composition closure, logical memory, and uniform specification induces a stable axiom-stabilizer on its retained finite response domain. Conversely, every stable axiom-stabilizer is an axiom-like local formal system for the corresponding retained prediction-update domain.

*Proof.* Let a nontrivial finite prediction-update cycle be given. The cycle contains a finite prediction object, a finite response protocol, a returned response $r$ in a finite response set $R$, and an acceptance condition for whether the prediction is retained as successful. By Remark A.0.1.1 this acceptance condition is exactly a subset $A\subseteq R$ and therefore induces the binary verification predicate

$$
V_A(r)=\mathbf 1_A(r).
$$

Let $D_{S,B}$ be the finite or finitely generated retained domain of represented claims actually queried, verified, remembered, composed, or updated during the cycle and its finite retained compositions within budget $B$. Let $J_{S,B}$ be the subset accepted by $V_A$. Let $\vdash_{S,B}$ be the finite relation generated by the cycle's retained verification-preserving composition rules, memory transfer rules, and uniform specification rules. Let $q_{S,B}$ identify judgments that have the same finite protocol-response role.

Finite response and bounded processing hold by construction of $D_{S,B}$ from a finite cycle under budget $B$. Local soundness holds in the protocol sense because accepted updates are exactly those passing the retained verification predicate, and $q_{S,B}$ identifies only response-equivalent judgments. Composition closure holds because $\vdash_{S,B}$ was defined as the retained finite composition/update relation. The diagonal guard is supplied by restricting the domain to retained finite-response judgments and by not accepting any trace-diagonal object whose internal integration would trigger the Theorem A.5.1(ii) obstruction. If such an object is presented, it is left outside the retained finite-cost domain rather than assigned a forced truth value by the stabilizer. If the PCE minimum exists in the response-equivalence class, replacing the stabilizer by its least-cost representative gives PCE minimality without changing its retained responses.

Thus the prediction-update cycle induces a stable axiom-stabilizer. Conversely, a stable axiom-stabilizer contains seed judgments, inference/update rules, a verification predicate, and a response quotient. This is precisely an axiom-like local formal system for its retained domain, with abstention outside that domain rather than total reflexive closure. ∎

**Corollary A.6.5 (Generative non-closure chain).** For any predictor satisfying Theorem A.5.1, the following chain holds inside PU:

$$
\text{no total internal trace-diagonal closure}
\Longrightarrow
\text{only guarded finite partial closures are admissible on trace-diagonal domains}
\Longrightarrow
\text{nontrivial verified prediction requires stable axiom-stabilizers}.
$$

When PCE minimizers exist in the relevant response-equivalence classes, the retained stabilizers are selected as least-cost representatives.

*Proof.* The first implication is Theorem A.6.2. The second follows because a closure that tried to be total on the trace-diagonal domain would contradict Theorem A.6.2, so admissible finite-cost closure must be partial or guarded. The third implication is Theorem A.6.4: every nontrivial verified prediction-update cycle induces a stable axiom-stabilizer. The final sentence is the PCE-minimality clause of Definition A.6.3. ∎

**Theorem A.6.6 (Conservativity of the generative non-closure vocabulary).** Adding the vocabulary of generative non-closure, stable partial closure, and axiom-stabilizer is a definitional and status-conservative extension of the preceding PU formal apparatus. It changes no theorem, branch condition, numerical backbone value, or certificate status unless an explicit later theorem changes the underlying response domain, cost functional, PPI quotient, or branch certificate.

*Proof.* Definitions A.6.1-A.6.3 introduce abbreviations for objects already present in §§A.0-A.5: represented finite trace domains, binary verification predicates, finite prediction-update cycles, response quotients, PCE cost comparison, and predictor reachability. Theorem A.6.2 is an immediate consequence of Theorem A.5.1. Theorem A.6.4 is an unpacking of the Fundamental Predictive Loop together with Remark A.0.1.1 and the Logical-Structural Assumptions of §A.0.2. Corollary A.6.5 combines those results. Therefore any proof that does not invoke the new vocabulary is unchanged, and any proof that does invoke it reduces to the earlier definitions and theorems just cited. No physical or numerical conclusion is promoted in status by this terminology alone. ∎