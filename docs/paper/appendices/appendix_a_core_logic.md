# Appendix A: Core Logic, Computation Limits, and Property R

## A.0 Foundations of Computational Richness

### A.0.1 Overview: Two Complementary Foundations

Two routes provide the abilities needed for self-reference. One builds them in a logical model; the other asks when a protected physical network can carry them. Each route applies only when its stated construction and reliability conditions hold.

**Technical ledger.**

The **Self-Referential Paradox of Accurate Prediction (SPAP, Theorems A.1.1, A.1.3)** and **Reflexive Undecidability (RUD, Theorems A.2.3, A.2.4)** apply to predictive systems possessing the computational subcapacities collected under **Property R** (Definition 10). This appendix gives two conditional routes:

*   **Foundation I: Logical construction (§A.0.2)** — Composition closure, logical memory, uniform specification, arbitrarily large finite memory and composition depth, and a formal arithmetic representing bounded computations yield Property R for the resulting uniform predictive model class.
*   **Foundation II: Physical instantiation (§A.0.3–A.0.5)** — On a refresh-branch MPU implementation carrying an accepted QEC compatibility certificate or Golay-QEC bootstrap record, Dominant Cost Convexity, a universal protected gate ledger, and sufficient working-memory and execution resources:
    1. individual MPUs supply the minimal registered carrier capacity;
    2. the certified optimization branch selects a finite protected error rate;
    3. network composition realizes the finite Property-R tasks covered by the certificate.

Foundation I supplies the logical model-class route without using the later MPU construction. Foundation II is a conditional physical realization of that capacity. SPAP or RUD applies to a physical network only when the relevant coding, diagonal-closure, computability, and protected-execution hypotheses are all satisfied.

#### Foundational Definitions Recap:

**Summary of Definition 10 (Property R - Computational Richness):** Property R means that a model can describe computations, reason about them, and test statements about its own predictive behavior.

**Technical ledger.**

A formal model class $\mathcal{M}$, used by predictive systems $S$, possesses Property R relative to a consistent formal logical system $\mathcal{F}$ (e.g., Peano Arithmetic) if models $M \in \mathcal{M}$ and the associated formalism provide the machinery to:
1.  **Represent:** Encode system states $s$, models $M$ (e.g., via Gödel numbering $\ulcorner M \urcorner$), predictions $\hat{s}$, and computational processes as objects manipulable within $\mathcal{F}$.
2.  **Simulate/Reason:** Simulate the execution of any model $M \in \mathcal{M}$ applied to a state $s$, or formally reason about this process within $\mathcal{F}$, subject to fundamental computational limits.
3.  **Evaluate Predicates:** Represent and evaluate logical formulas within $\mathcal{F}$ concerning the behavior, output, or predictive accuracy of models in $\mathcal{M}$, including self-referential predicates.

**Summary of Definition 23 (MPU):** A Minimal Predictive Unit is the least costly system that completes the full cycle of prediction, checking, and update within the chosen class. Stronger claims about its memory and state capacity require the additional implementation conditions listed below.

**Technical ledger.**

An MPU is a qualifying full-loop implementation that attains $C_P=C_{op}$ on the declared nonempty implementation class. It has the dual Internal Prediction and 'Evolve'/ND-RID dynamics of Definitions 26–27. The inequalities $C_{op}\ge K_0=3$ and $d_0\ge8$ apply only when the MPU additionally satisfies Theorem 15's (O1)–(O3), (FC) SPAP-register conditions, represents the eight contexts as mutually perfectly distinguishable Hilbert alternatives, and obeys Corollary 3's complexity-capacity bridge.

**Recall of Definition A.2.2 (ND-RID):** Non-Deterministic Reflexive Interaction Dynamics govern the MPU 'Evolve' process, characterized by probabilistic outcomes $P(o|x,y)$ and state transitions $P(x'|x,y,o)$. On a registered cyclic-reset branch satisfying Definition 28, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$, with a positive uniform floor only when $H_q(P\mid R)\ge h_{\min}>0$. Independently, when the ND-RID update contains a nonzero input-independent refresh component, Lemma E.1 gives $f_{\text{RID}}<1$. Neither physical branch follows from the definition of ND-RID alone.

### A.0.2 Foundation I: Conditional Property R from Predictive Closure Structure

> **Methodological Note:** This section proves a sufficient formal construction: Property R follows for predictive model classes satisfying the declared composition, memory, uniformity, scalability, and arithmetic-coding hypotheses. It does not claim that prediction alone supplies those hypotheses. Physical realization under resource constraints is addressed subsequently in §A.0.3-A.0.5.

For a predictive model class satisfying composition closure, logical memory, uniform specification, and arbitrarily large finite memory and composition depth, the finite computational subcapacity of Property R follows without choosing a physical implementation. The construction below is logically prior to the MPU realization but conditional on those explicit structural hypotheses.


**Proposition A.0.1 (Binary Necessity for Retained Verification Decisions)**
The Cogito predicate has a determinate retained verification value, and every finite prediction protocol that enters a prediction-update loop through a declared acceptance set has a binary retained decision predicate. More precisely, let a finite protocol have response set $R$ and declared acceptance set $A\subseteq R$. Then
$$
V_A(r)=\mathbf1_A(r)\in\{0,1\}.
$$
The underlying protocol data may remain multi-valued.

*Proof.* For the foundational self-reference predicate, an attempted retained verdict that the thinking process does not occur is self-refuting: producing that verdict is itself an occurrence of the process. Thus the Cogito predicate is retained as verified, while its negation is rejected. For a general finite prediction protocol, each $r\in R$ satisfies exactly one of $r\in A$ and $r\notin A$. Hence the characteristic map $V_A=\mathbf1_A$ has codomain $\{0,1\}$. Scores, distances, likelihoods, and confidence reports may remain in a larger response alphabet; they become a retained verification decision precisely when the declared acceptance cut is applied. ∎

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

**Proposition A.0.2 (Boolean Operations under Acceptance-Set Closure)**
Let a finite protocol use binary predicates $V_A=\mathbf1_A$. Assume its retained protocol class is closed under complementary acceptance sets, finite intersections, and finite unions. Then
1.  **Negation (NOT):** $V_{R\setminus A}(r)=1-V_A(r)$.
2.  **Conjunction (AND):** $V_{A_1\cap A_2}(r)=\min(V_{A_1}(r),V_{A_2}(r))$.
3.  **Disjunction (OR):** $V_{A_1\cup A_2}(r)=\max(V_{A_1}(r),V_{A_2}(r))$.

*Proof.* For $r\in R$, exactly one of $r\in A$ and $r\in R\setminus A$ holds, proving the first identity. Membership in $A_1\cap A_2$ holds exactly when both characteristic values are one, proving the second. Membership in $A_1\cup A_2$ holds exactly when at least one characteristic value is one, proving the third. The closure hypothesis ensures that all three acceptance sets are retained protocols. ∎

**Logical Infrastructure of Prediction**

The derivation of uniform bounded computation from functional completeness requires three explicit structural hypotheses on the declared predictive model class. Adaptive prediction by itself does not entail these hypotheses: a finite-state predictor may forecast, verify, and update without composition closure, arbitrarily scalable memory, or a universal specification mechanism. The Property-R branch therefore assumes:

1.  **Composition Closure:** If a member of the class can verify prediction A and verify prediction B, the class contains retained protocols for the compound predictions ("A and B," "A or B") and permits outputs of one verification to serve as inputs to subsequent ones.
2.  **Logical Memory:** The class contains implementations that retain intermediate verification and gate results across the number of cycles required by each bounded simulation.
3.  **Uniform Specification:** One finite rule generates the relevant model, circuit, and update descriptions from their finite codes and resource bounds.

These hypotheses characterize the computationally rich predictive class used by Theorem A.0.1. They are sufficient for that theorem and are not asserted for every sustained, adaptive, or above-chance predictor.

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

*Proof.* Choose a finite description alphabet of size $b\ge2$. A word $a_0\cdots a_{\ell-1}$ with digits $0\le a_i<b$ can be encoded injectively by
$$
\operatorname{code}(a_0\cdots a_{\ell-1})
=b^\ell+\sum_{i=0}^{\ell-1}a_i b^i.
$$
The leading power records the length, so decoding is effective. Iterating any primitive-recursive pairing map encodes finite tuples of words. Hence states, circuit descriptions, machine descriptions, predictions, and bounded execution histories have finite arithmetic codes, and the hypothesis on $\mathcal F$ makes these coding and decoding operations representable.

By Theorem A.0.1, for every Turing machine $M$ and bound $T$, the model class contains a uniformly specified Boolean circuit simulating the first $T$ steps of $M$. A bounded history has finitely many configurations; checking its initial configuration, each transition-table relation, and its final output is therefore a finite conjunction of Boolean conditions. Functional completeness and finite composition produce a circuit for that conjunction. Composing it with the simulation circuit evaluates bounded predicates about outputs, failures, and prediction accuracy.

For an unbounded partial computation, each finite search stage is represented by its time bound $T$ and the corresponding bounded circuit; no claim of terminating an undecidable infinite search is required. Thus all representation, bounded-simulation, and finite predicate-evaluation clauses of Definition 10 hold. ∎

**Significance:** This derivation is independent of the Self-Referential Paradox of Accurate Prediction. Property R is established before SPAP is invoked, providing a non-circular foundation. The logical sequence is:

$$
\begin{aligned}
&\text{Predictive structure}+\text{Logical-Structural Assumptions}
\to\text{Property R}
\to\text{SPAP diagonal limitation},\\
&(\mathrm{O1})\text{--}(\mathrm{O3})+(\mathrm{FC})
\to N_{\mathrm{vis}}^{\min}=8
\to K_0=3.
\end{aligned}
$$

The two rows are independent. Transfer of the second row to an MPU's $C_P$ additionally requires Definition 23, Hilbert distinguishability, and Corollary 3's complexity-capacity bridge. Property R does not depend on the later MPU structures it helps analyze. The conclusion applies only to predictive model classes satisfying composition closure, logical memory, uniform specification, arbitrarily large finite memory and composition depth, and a formal arithmetic capable of coding finite strings, circuits, and bounded computations. It establishes no unconditional claim about consciousness or about finite physical systems that lack those hypotheses.
### A.0.3 Foundation II: Minimal Physical Capacity

Having established Property R on the stated uniform computationally rich model class, we now address how that conditional abstract structure may be represented in physical systems with finite resources.

**Proposition A.0.3 (Conditional Self-Referential Carrier Capacity of an MPU)**
Let $\mu_*$ be an MPU in the sense of Definition 23. Assume that its registered SPAP sub-dynamics satisfies (O1)–(O3) and (FC), that its eight response contexts are represented by mutually perfectly distinguishable states on a Hilbert carrier of dimension $d_0(\mu_*)$, and that

$$
C_P(\mu_*)\ge C_{cap}(\mu_*)=\log_2d_0(\mu_*).
$$
Then
$$
|\mathcal S_{\mathrm{vis}}(\mu_*)|\ge8,
\qquad
d_0(\mu_*)\ge8,
\qquad
C_P(\mu_*)=C_{op}\ge K_0=3.
$$
The registered sub-dynamics therefore carries the state, stored-prediction, and phase/comparison readouts required by the stated SPAP encoding. This carrier result alone does not establish Effective Operational Property R.

*Proof.* By the (FC) hypothesis, the joint response map
$$
r=(r_m,r_p,r_v):
\mathcal S_{\mathrm{vis}}(\mu_*)\to\{0,1\}^3
$$
is surjective. Hence
$$
|\mathcal S_{\mathrm{vis}}(\mu_*)|
\ge|\{0,1\}^3|
=8
$$
by the finite cardinality inequality. Mutually perfect distinguishability of these eight contexts on the Hilbert carrier gives

$$
d_0(\mu_*)\ge8
$$
and therefore
$$
C_{cap}(\mu_*)=\log_2d_0(\mu_*)\ge3.
$$
The complexity-capacity bridge yields
$$
C_P(\mu_*)\ge C_{cap}(\mu_*)\ge3.
$$
Definition 23 gives $C_P(\mu_*)=C_{op}$, so $C_{op}\ge3=K_0$ on this branch.

Finally, the hypothesis that $\mu_*$ realizes the registered SPAP sub-dynamics supplies the reflex update itself; the cardinality argument supplies its carrier lower bound and does not independently derive the update law. The conditional carrier result is insufficient for full Property R. Representation of the finite computations covered by a declared SPAP or RUD protocol requires the separate coding, composition, working-memory, protected-execution, and reliability certificates of Definition A.0.1 and Theorems A.0.2 and A.0.6. ∎

**Role in Physical Instantiation:** Proposition A.0.3 is conditional on the registered SPAP realization, full-context, Hilbert-distinguishability, and complexity-capacity hypotheses. It does not show that every MPU or every above-chance predictor has eight operational contexts. On its stated branch, $K_0=3$ is the attained lower bound for the SPAP context encoding; Property R retains its independent logical and physical certificates.

### A.0.4 Emergence of Reliable Computation from POP/PCE Optimization

While $K_0$ supplies structural carrier capacity on its realization branch, reliable execution of the finite computations required for SPAP and RUD is a separate physical problem. The analysis below uses the refresh-branch premise that each relevant ND-RID implementation contains a nonzero input-independent refresh component, for which Lemma E.1 gives $f_{\mathrm{RID}}<1$, together with the protected-computation certificates stated below.

POP (Axiom 1) and PCE (Definition 15) nominate the comparison objective. Definition D.1 and Equation D.8 represent that objective by a stochastic gradient model only on a branch fixing a smooth state manifold $X$, metric defining $\operatorname{grad}_gV$, tangent mobility $\eta_x:T_xX\to T_xX$, coefficient domains and regularity, filtered $m$-dimensional Brownian motion, diffusion factor $\sigma_x:\mathbb R^m\to T_xX$ with $\sigma_x\sigma_x^*=2D_x$, boundary behavior, and either a Stratonovich convention or an Itô convention with the required connection/chart data, together with common unit/metering data. Any entropy-per-reset cost also requires a reset frequency, and physical power requires an energy conversion. POP and PCE alone do not construct this dynamics, prove existence or attainment of a minimizer, or prove convergence. Effective prediction additionally requires the independent protected-computation certificates below; when those and the dynamical branch data are accepted, the declared potential compares operational cost $V_{\text{op}}$, propagation cost $V_{\text{prop}}$, and predictive benefit $V_{\text{benefit}}$.

**Definition A.0.1 (Effective Operational Property R)**
Effective Operational Property R is the capability of an MPU network to execute the finite representation, simulation/reasoning, predicate-evaluation, logical-memory, Boolean-processing, and diagonal-wrapper tasks required by the declared SPAP or RUD protocol with its registered finite error bound. When this capability is physically realized through Theorem A.0.2, let $p_{\mathrm{err}}^*$ be a selected minimizer of
$$
V_{\mathrm{tot}}(p_{\mathrm{err}})
=
V_{\mathrm{rel}}(p_{\mathrm{err}})
+
V_{\mathrm{err}}(p_{\mathrm{err}}).
$$
The minimizer is unique only under Dominant Cost Convexity. Operational applicability at logical depth $T$ additionally requires the QEC/bootstrap, working-memory, and execution records to certify the error tolerance of that finite protocol.

**Proposition A.0.2c (Golay Code-Capacity Sufficient Threshold Certificate).** Consider the binary Golay block $[M,k,d_{\mathrm{code}}]=[24,12,8]$ with hard-decision block decoding, which corrects every error pattern of weight at most $t=\lfloor(d_{\mathrm{code}}-1)/2\rfloor=3=K_0$, under independent identically distributed link errors of rate $p$ per block position. Then the logical block error probability obeys
$$
P_L(p)\le\binom{24}{4}p^4=10626\,p^4,
$$
and under level-wise concatenation with $p_{\ell+1}\le\binom{24}{4}p_\ell^{\,4}$ the rescaled error $\binom{24}{4}^{1/3}p_\ell$ is fourth-power contracting, so $p_\ell\to0$ doubly exponentially whenever
$$
p_0<p_{\mathrm{suf}}:=\binom{24}{4}^{-1/3}=0.045486=4.55\%.
$$
For the exact iid disjoint-concatenation model only, one may conservatively register $p_{\mathrm{th}}:=p_{\mathrm{suf}}$ to fill the numerical threshold-inequality slot of Definition A.0.1q whenever $0<p_{\mathrm{err},0}<p_{\mathrm{suf}}$. This does not discharge the rest of the QEC certificate. The equality $t=3=K_0$ is numerical and supplies no bridge between code correction and the horizon constant. The union-bound value is not the exact decoder threshold or a universal physical fault-tolerance threshold. Correlated or adversarial noise is outside this certificate and requires its own noise-model record, as stated in Definition A.0.1q.

*Proof.* Since the decoder corrects all patterns of weight at most $3$, a logical error requires at least $4$ position errors, hence the error set contains some $4$-element subset of the $24$ positions on which all entries are flipped. For any fixed $4$-subset that event has probability $p^4$ under the iid law, and the union bound over the $\binom{24}{4}$ subsets gives $P_L\le\binom{24}{4}p^4$. Writing $A=\binom{24}{4}$ and $q_\ell=A^{1/3}p_\ell$, the recursion $p_{\ell+1}\le Ap_\ell^4$ gives $q_{\ell+1}\le q_\ell^{\,4}$, so $q_\ell\le q_0^{\,4^\ell}$ and $q_0<1$, equivalently $p_0<A^{-1/3}$, forces $p_\ell\to0$ doubly exponentially. Evaluating $A=10626$ gives $A^{-1/3}=0.045486$. ∎

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
+
\text{robustness, working-memory, protected-gate, and circuit-execution certificates}
\Longrightarrow
\text{Effective Operational Property R on covered windows}.
\tag{A.0.2a.1}
$$
This is not a primitive-axiom derivation of QEC compatibility and does not assert a universal numerical threshold. It says that, once the downstream Golay branch and the finite physical recovery/threshold records are accepted, the former QEC assumption is discharged for those windows by an internally generated code witness plus the recorded physical implementation data.

*Proof.* Proposition Z.13b.7 supplies a dual-containing Golay CSS code witness. The local-noise, syndrome, recovery, gate, overhead, threshold, and PCE-benefit entries of $\mathfrak C_{\mathrm{GQEC}}$ are exactly the entries required by Definition A.0.1q. Mapping them into the slots of $\mathfrak C_{\mathrm{QEC}}$ gives the certificate. The fixed-point display records dependency order: the Golay witness is derived downstream of the finite MPU/Golay branch, while the reliability claim is promoted only after the physical recovery and threshold records are added. ∎

**Corollary A.0.2b (Transversal-Gate Guardrail).** On any finite-dimensional quantum error-correcting code realization used by $\mathfrak C_{\mathrm{GQEC}}$ that corrects a nontrivial set of local errors, transversal product-form encoded gates do not constitute a universal logical gate set by themselves. A universal protected-computation ledger must include a non-transversal, injected, distilled, adaptive, or otherwise certified completion inside $\mathcal I_{\mathrm{FT}}$. The corresponding overhead is compatible with the strict optimizer floor $p_{\mathrm{err}}^*>0$ of Theorem A.0.5.

*Proof.* The Eastin–Knill theorem (Eastin & Knill 2009) applies because the registered code is finite-dimensional, encodes a nontrivial logical subsystem, corrects a nontrivial local-error set, and the gates under consideration act transversally as products across physical subsystems. The theorem excludes universality of that transversal logical-gate family. Therefore a ledger claiming universal protected computation must record a gate resource outside that family. Theorem A.0.5 places every admitted optimizer in $(0,p_{\mathrm{err},0}]$, so $p_{\mathrm{err}}^*>0$; recording a positive implementation overhead does not contradict that conclusion. ∎

**Theorem A.0.2 (Conditional Effective Property R at a Certified PCE Optimum)**
Assume the refresh-branch implementation condition of Lemma A.0.1, an accepted QEC compatibility certificate $\mathfrak C_{\mathrm{QEC}}$ supplied directly or through an accepted Golay-QEC bootstrap record $\mathfrak C_{\mathrm{GQEC}}$, the hypotheses of Theorem A.0.5, and Dominant Cost Convexity. Let $p_{\mathrm{err}}^*$ be a minimizer supplied by Theorem A.0.5. Assume further that a robustness certificate proves $p_{\mathrm{err}}^*<1/2$ on the declared protected-computation window and that the network supplies the working-memory, QEC-overhead, protected-gate, and circuit-execution resources required by Theorem A.0.6. Then:
1.  $p_{\mathrm{err}}^*>0$ exists and is unique.
2.  The network possesses Effective Operational Property R for the finite tasks covered by the certificates and resource ledger.
3.  The noise-robust SPAP and RUD conclusions apply only on the windows satisfying their respective hypotheses.

*Proof.* Theorem A.0.5 gives a minimizer in $(0,p_{\mathrm{err},0}]$; hence it is strictly positive. Dominant Cost Convexity makes $V_{\mathrm{tot}}$ strictly convex, so two distinct minimizers are impossible: if $p_1\ne p_2$ were minimizers, strict convexity would give
$$
V_{\mathrm{tot}}\!\left(\frac{p_1+p_2}{2}\right)
<\frac{V_{\mathrm{tot}}(p_1)+V_{\mathrm{tot}}(p_2)}2,
$$
contradicting minimality. This proves item 1. The separate robustness certificate supplies $p_{\mathrm{err}}^*<1/2$ on the declared window. Under the accepted QEC certificate and the stated resource ledger, Theorem A.0.6 supplies representation, bounded simulation, predicate evaluation, logical memory, finite composition, and Boolean post-processing for the covered tasks, proving item 2. Applying Theorems A.1.2 and A.1.4, or Theorems A.2.3 and A.2.4, is legitimate only when their additional window hypotheses hold, which is item 3. ∎

The component estimates supporting the hypotheses are recorded in the four stages below.

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

**Proposition A.0.4 (Reliability-Cost Lower Bound on a Converse-Certified Branch).** In addition to QEC Compatibility, suppose the retained protected-computation branch carries a constant $A>0$ such that every admissible implementation of overhead $C$ has logical error bounded below by
$$
p_{\mathrm{impl}}(C)
\ge
p_{\mathrm{err},0}e^{-C/A}.
\tag{A.0.3c}
$$
Then every admissible implementation achieving $p_{\mathrm{impl}}(C)\le p_{\mathrm{err}}\le p_{\mathrm{err},0}$ satisfies
$$
C_{\mathrm{err}}(p_{\mathrm{err}})
\ge
A\ln\!\left(\frac{p_{\mathrm{err},0}}{p_{\mathrm{err}}}\right).
\quad \text{(A.0.3)}
$$

*Proof.* Combining the converse certificate with the target guarantee gives
$$
p_{\mathrm{err},0}e^{-C/A}
\le
p_{\mathrm{impl}}(C)
\le
p_{\mathrm{err}}.
$$
Taking logarithms and rearranging yields
$$
C\ge A\ln\!\left(\frac{p_{\mathrm{err},0}}{p_{\mathrm{err}}}\right).
$$
Taking the infimum over all admissible implementations that achieve the target proves (A.0.3). ∎

The lower-envelope certificate (A.0.3c) is an additional resource hypothesis; it does not follow from the threshold theorem or from the achievable majority-vote construction below. Lemma A.0.4a supplies an explicit logarithmic-overhead construction, while Proposition A.0.4 supplies the conditional lower bound used in the PCE divergence analysis.

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
$$
\{S_N\ge N/2\}=\{S_N-\mu\ge N(\tfrac12-p_{\text{err},0})\}.
$$
Hoeffding's inequality for independent $X_i\in[0,1]$ gives, for $t>0$,
$$
\mathbb P(S_N-\mu\ge t)\le \exp\!\left(-\frac{2t^2}{N}\right) \quad\text{[Hoeffding 1963]}.
$$
Setting $t=N(\tfrac12-p_{\text{err},0})$ yields (A.0.3a). Solving $\exp(-2(\tfrac12-p_{\text{err},0})^{2}N)\le p_{\text{err}}$ gives (A.0.3b). ∎

**Remark A.0.4b (Achievable Redundancy Overhead).**
Assume each majority-vote attempt costs at most $c_1$ units and choose the least odd integer $N$ satisfying (A.0.3b). Then this explicit construction has
$$
C_{\text{err}}^{\mathrm{maj}}(p_{\text{err}})
\le
c_1\left[
\frac{1}{2(\tfrac12-p_{\text{err},0})^{2}}
\ln\!\frac{1}{p_{\text{err}}}
+2
\right].
$$
Thus majority voting exhibits an achievable $O(\!\ln(1/p_{\text{err}}))$ overhead. It supplies no lower bound for arbitrary codes or decoders; Proposition A.0.4 requires the separate lower-envelope certificate (A.0.3c).

**Definition A.0.3 (Reliability Cost Contribution):** The cost of added complexity contributes to PCE potential via physical operational cost function $R(C)$ (Definition 3):
$$
V_{\text{rel}}(p_{\text{err}}) := \lambda R(C_{\text{err}}(p_{\text{err}})) \approx \lambda r_p(T_{\text{eff}})\, \left[ A \ln\left(\frac{p_{\text{err},0}}{p_{\text{err}}}\right) \right]^{\gamma_p} \quad \text{(A.0.4)}
$$
where $\gamma_p>1$ and $r_p(T_{\text{eff}})>0$ (Definition 3a), with $T_{\text{eff}}$ treated as fixed in this appendix.

**Lemma A.0.2 (Divergence of Reliability Cost in the Exact Power-Law Model):** Assume
$$
p_{\mathrm{err},0}>0,
\qquad
A>0,
\qquad
\lambda>0,
\qquad
r_p(T_{\mathrm{eff}})>0,
\qquad
\gamma_p>1,
$$
and, for $0<p<p_{\mathrm{err},0}$,
$$
C_{\mathrm{err}}(p)=A\ln\!\left(\frac{p_{\mathrm{err},0}}p\right),
\qquad
R(C)=r_p(T_{\mathrm{eff}})C^{\gamma_p}.
$$
Then, for every $0<p<p_{\mathrm{err},0}$,
$$
V_{\mathrm{rel}}'(p)
=
-\lambda r_p(T_{\mathrm{eff}})\gamma_pA^{\gamma_p}
\frac{[\ln(p_{\mathrm{err},0}/p)]^{\gamma_p-1}}p
<0
\tag{A.0.5}
$$
and $\lim_{p\to0^+}V_{\mathrm{rel}}'(p)=-\infty$.

*Proof.* Put $L(p):=\ln(p_{\mathrm{err},0}/p)$. On the declared domain, $L(p)>0$ and $L'(p)=-1/p$. Substitution gives
$$
V_{\mathrm{rel}}(p)
=
\lambda r_p(T_{\mathrm{eff}})A^{\gamma_p}L(p)^{\gamma_p}.
$$
Therefore
$$
V_{\mathrm{rel}}'(p)
=
\lambda r_p(T_{\mathrm{eff}})A^{\gamma_p}\gamma_p
L(p)^{\gamma_p-1}\left(-\frac1p\right),
$$
which is Equation (A.0.5). Every factor preceding the minus sign is strictly positive, proving $V_{\mathrm{rel}}'(p)<0$. As $p\downarrow0$, both $p^{-1}$ and $L(p)^{\gamma_p-1}$ tend to $+\infty$, so the derivative tends to $-\infty$. ∎

**Stage 3: Penalty for Allowing Errors**
Errors degrade predictive performance, reducing benefit term $V_{\text{benefit}}$, equivalent to adding error penalty $V_{\text{err}}$.

**Theorem A.0.4 (Performance Degradation):** For computation involving $T$ logical gate applications, if each gate has failure probability at most $p_{\text{err}}$, then
$$
P_{\text{succ}}\ge1-Tp_{\text{err}}
$$
without assuming independence. If the failures are independent, then
$$
P_{\text{succ}}
=
\prod_{t=1}^T\bigl(1-\mathbb P(F_t)\bigr)
\ge
(1-p_{\text{err}})^T.
\tag{A.0.6}
$$
If $0\le p_{\mathrm{err}}<1$, equality in the final inequality holds exactly when every $\mathbb P(F_t)=p_{\mathrm{err}}$. At the excluded endpoint $p_{\mathrm{err}}=1$, equality with the zero lower bound requires only that at least one gate fail almost surely.

*Proof.* Let $F_t$ be the event that gate $t$ fails. Then
$$
P_{\mathrm{succ}}
=1-\mathbb P\!\left(\bigcup_{t=1}^TF_t\right)
\ge1-\sum_{t=1}^T\mathbb P(F_t)
\ge1-Tp_{\mathrm{err}}
$$
by the union bound. If the $F_t$ are independent, their complements are independent, so
$$
P_{\mathrm{succ}}=\prod_{t=1}^T(1-\mathbb P(F_t))\ge(1-p_{\mathrm{err}})^T.
$$
For $p_{\mathrm{err}}<1$, every factor is at least the positive number $1-p_{\mathrm{err}}$, and equality of the product holds exactly when every factor equals it. The endpoint statement follows because a finite product of nonnegative factors is zero exactly when one factor is zero. ∎

**Lemma A.0.4c (Success Probability Lower Bound Without Independence).**
Let $F_t$ be the event that the $t$-th logical gate fails, with $\mathbb P(F_t)\le p_{\text{err}}$ for each $t=1,\dots,T$. Then
$$
P_{\text{succ}}
=
1-\mathbb P\!\Bigl(\bigcup_{t=1}^T F_t\Bigr)
\ge
1-\sum_{t=1}^T\mathbb P(F_t)
\ge
1-Tp_{\text{err}}.
\tag{A.0.6a}
$$
If the failures are independent, then
$$
P_{\text{succ}}
=
\prod_{t=1}^T\bigl(1-\mathbb P(F_t)\bigr)
\ge
(1-p_{\text{err}})^T.
\tag{A.0.6b}
$$

*Proof.* The first bound is the union bound. Under independence, the complement events are independent, so their intersection probability is the displayed product. Each factor is at least $1-p_{\text{err}}$, proving the second bound. ∎

**Definition A.0.4 (Effective Complexity on the Independent Equal-Error Branch):** Assume the $T$ logical-gate failure events are mutually independent and each has probability exactly $p_{\text{err}}$. Define
$$
C_{\text{eff}}(p_{\text{err}})
:=
C_{\text{alloc}}P_{\text{succ}}(T,p_{\text{err}})
=
C_{\text{alloc}}(1-p_{\text{err}})^T
\quad \text{(A.0.7)}
$$
On branches without independence or equal failure probabilities, $P_{\text{succ}}$ is the actual joint success probability and Theorem A.0.4 supplies only the corresponding lower bounds.

**Proposition A.0.5 (Error-Induced Benefit Loss):** On the independent equal-error branch of Definition A.0.4, let $T\ge1$, $\Gamma_0>0$, $C_{\mathrm{alloc}}>0$, and assume $PP$ is differentiable with $PP'(c)>0$ on $0<c\le C_{\mathrm{alloc}}$. Define
$$
V_{\text{err}}(p_{\text{err}})
:=\Gamma_0[PP(C_{\text{alloc}})-PP(C_{\text{eff}}(p_{\text{err}}))].
\tag{A.0.8}
$$
Then, for $p_{\text{err}}\in[0,1)$,
$$
V_{\text{err}}'(p_{\text{err}})
=\Gamma_0TC_{\text{alloc}}PP'(C_{\text{eff}})(1-p_{\text{err}})^{T-1}>0.
\tag{A.0.9}
$$

*Proof.* Equation (A.0.7) gives
$$
C_{\text{eff}}'(p)
=-TC_{\text{alloc}}(1-p)^{T-1}.
$$
The chain rule therefore yields
$$
V_{\text{err}}'(p)
=-\Gamma_0PP'(C_{\text{eff}}(p))C_{\text{eff}}'(p)
=\Gamma_0TC_{\text{alloc}}PP'(C_{\text{eff}}(p))(1-p)^{T-1}.
$$
Every factor in the last expression is positive for $0\le p<1$, proving the claim. ∎

**Stage 4: Optimal Error Rate**
PCE drives the system to minimize total error-related potential, balancing reliability costs and error penalties.

**Definition A.0.5 (Total Error Potential):**
$$
V_{\text{tot}}(p_{\text{err}}) := V_{\text{rel}}(p_{\text{err}}) + V_{\text{err}}(p_{\text{err}}) \quad \text{(A.0.10)}
$$
defined on $(0, p_{\text{err},0}]$.

**Theorem A.0.5 (Existence of an Optimal Error Rate; Uniqueness under Dominant Cost Convexity)**
Assume $p_{\mathrm{err},0}>0$, $A>0$, and $\lambda>0$. Assume the actual overhead function $C_{\mathrm{err}}:(0,p_{\mathrm{err},0}]\to[0,\infty)$ is finite and continuous and satisfies the converse bound
$$
C_{\mathrm{err}}(p)
\ge
A\ln\!\left(\frac{p_{\mathrm{err},0}}p\right).
$$
Assume $R:[0,\infty)\to[0,\infty)$ is continuous and coercive, $R(c)\to\infty$ as $c\to\infty$, and assume the performance contribution $V_{\mathrm{err}}$ is finite, bounded, and continuous on $(0,p_{\mathrm{err},0}]$. Then
$$
V_{\mathrm{tot}}(p)
:=
\lambda R(C_{\mathrm{err}}(p))+V_{\mathrm{err}}(p)
$$
has a minimizer $p_{\mathrm{err}}^*\in(0,p_{\mathrm{err},0}]$. If $V_{\mathrm{tot}}$ is strictly convex on this interval under Dominant Cost Convexity, the minimizer is unique. If it lies in the interior and $V_{\mathrm{tot}}$ is differentiable there, it satisfies $V_{\mathrm{tot}}'(p_{\mathrm{err}}^*)=0$.

*Proof.* The converse bound has a right-hand side tending to infinity as $p\downarrow0$; therefore $C_{\mathrm{err}}(p)\to\infty$. Coercivity of $R$ then gives
$$
V_{\mathrm{rel}}(p)=\lambda R(C_{\mathrm{err}}(p))\longrightarrow\infty.
$$
Since $V_{\mathrm{err}}$ is bounded, $V_{\mathrm{tot}}(p)\to\infty$ as $p\downarrow0$. Continuity of $C_{\mathrm{err}}$, $R$, and $V_{\mathrm{err}}$ makes $V_{\mathrm{tot}}$ continuous.

Choose $\epsilon\in(0,p_{\mathrm{err},0})$ so that
$$
V_{\mathrm{tot}}(p)>V_{\mathrm{tot}}(p_{\mathrm{err},0})
\quad\text{for }0<p\le\epsilon.
$$
Continuity makes $V_{\mathrm{tot}}$ continuous on the compact interval $[\epsilon,p_{\mathrm{err},0}]$. The extreme-value theorem as stated by Berge (1963) applies because the domain is nonempty and compact and the function is real-valued and continuous; it supplies a minimizer on that interval. The displayed strict inequality excludes every point in $(0,\epsilon]$ from being a global minimizer, so this is a minimizer on $(0,p_{\mathrm{err},0}]$.

If two distinct minimizers $p_1,p_2$ existed under strict convexity, then
$$
V_{\mathrm{tot}}\!\left(\frac{p_1+p_2}{2}\right)
<\frac{V_{\mathrm{tot}}(p_1)+V_{\mathrm{tot}}(p_2)}2,
$$
contradicting minimality. Thus the minimizer is unique. At an interior differentiability point, Fermat's elementary difference-quotient argument gives $V_{\mathrm{tot}}'(p_{\mathrm{err}}^*)=0$. ∎

**Corollary A.0.2 (Scaling of the Reduced Stationarity Model)**
Let $a:=\gamma_p-1>0$ and let $K,p_0>0$. Suppose that, for all sufficiently large $T$, a reduced stationarity model has a solution $p_T\in(0,p_0)$ satisfying
$$
p_T=\frac KT\left[\ln\left(\frac{p_0}{p_T}\right)\right]^a,
\qquad p_T\longrightarrow0.
\tag{A.0.11}
$$
Then
$$
p_T\sim \frac K T(\ln T)^a,
$$
and consequently $p_T<1/2$ for all sufficiently large $T$.

*Proof.* Put $L_T:=\ln(p_0/p_T)$. Taking logarithms of (A.0.11) gives
$$
L_T=\ln T+\ln\left(\frac{p_0}{K}\right)-a\ln L_T.
\tag{A.0.11a}
$$
Because $p_T\to0$, one has $L_T\to\infty$. For large $T$, $L_T>1$, so (A.0.11a) yields
$$
L_T\le \ln T+\max\!\left\{\ln\left(\frac{p_0}{K}\right),0\right\}.
$$
Hence $\ln L_T=O(\ln\ln T)$. Dividing (A.0.11a) by $\ln T$ therefore gives $L_T/\ln T\to1$. Substitution in (A.0.11) yields
$$
\frac{p_T}{K(\ln T)^a/T}=\left(\frac{L_T}{\ln T}\right)^a\longrightarrow1.
$$
The right-hand side tends to zero because $(\ln T)^a/T\to0$, proving the final assertion. This corollary applies to the reduced equation (A.0.11); deriving that equation from the full $V_{\mathrm{tot}}'(p)=0$ condition requires a separate uniform approximation bound for $(1-p)^T$ and $PP'(C_{\mathrm{eff}}(p))$. ∎

**Epistemic Status:** The derivation relies on:
1.  **QEC Compatibility Certificate $\mathfrak C_{\mathrm{QEC}}$ or Golay-QEC Bootstrap Record $\mathfrak C_{\mathrm{GQEC}}$:** The former QEC-compatibility assumption is a finite certificate gate. It must record the retained noise model, locality window, implementable code and recovery instruments, threshold inequality, and PCE benefit gap before the SPAP/RUD reliability claim is promoted. The Golay witness of Proposition Z.13b.7 supplies the code-theoretic part only when embedded in the physical syndrome/recovery/threshold record of Definition A.0.1q.1. It is not supplied by the existence of finite ND-RID links or by the abstract Golay code alone.
2.  **Dominant Cost Convexity:** Reasonable given Definition 3's superlinear resource costs for high reliability, but requires explicit verification for specific cost functions.

Alternative substrates or branches that fail the direct QEC certificate, the Golay-QEC bootstrap record, or Dominant Cost Convexity do not support the protected-computation version of Property R used by the noise-robust SPAP and RUD arguments.

### A.0.5 Network Composition and Full Property R

On the registered SPAP realization satisfying (O1)–(O3), (FC), Hilbert distinguishability, and the complexity-capacity bridge, an MPU can carry the three-bit context register of Proposition A.0.3. Full Property R still requires the independent network composition, memory, coding, and protected-execution certificates of §A.0.5.

**Proposition A.0.6 (Compositional Enhancement)**
For a network of $n$ MPUs with individual Hilbert spaces $\mathcal{H}_0 \cong \mathbb{C}^8$, the composite Hilbert space is $\mathcal{H}_{\text{composite}} = \mathcal{H}_0^{\otimes n} \cong \mathbb{C}^{8^n}$. The composite system's state space dimension grows exponentially: $\dim(\mathcal{H}_{\text{composite}}) = 8^n$.

*Proof.* Let $e_1,\ldots,e_8$ be an orthonormal basis of $\mathcal H_0$. The elementary tensors
$$
e_{i_1}\otimes\cdots\otimes e_{i_n},
\qquad 1\le i_1,\ldots,i_n\le8,
$$
are orthonormal because their pairwise inner products are products of Kronecker deltas. By the definition of the Hilbert tensor product they span $\mathcal H_0^{\otimes n}$. There are $8^n$ such tensors, so they form an orthonormal basis and
$$
\dim(\mathcal H_0^{\otimes n})=8^n.
$$
Mapping this basis bijectively to the standard basis of $\mathbb C^{8^n}$ gives the asserted Hilbert-space isomorphism. ∎

This exponential growth provides finite representation capacity. A fixed network of $n$ MPUs has only $8^n$ mutually distinguishable basis configurations and therefore cannot encode arbitrarily large Gödel numbers or execute arbitrarily deep circuits by dimension counting alone. Arbitrarily large finite encodings require a scalable family with unbounded $n$; storage of intermediate results and deep-circuit execution additionally require the working-memory, gate, protection, and runtime hypotheses stated below.

**Assumptions for Theorem A.0.6:** The following assumes either an accepted QEC compatibility certificate $\mathfrak C_{\mathrm{QEC}}$ for the protected network family (Definition A.0.1q) or an accepted Golay-QEC bootstrap record $\mathfrak C_{\mathrm{GQEC}}$ that discharges the same certificate entries (Definition A.0.1q.1; Theorem A.0.2a). It also assumes a universal protected gate ledger implementable via ND-RID channels and fault-tolerance threshold conditions for the recorded noise model and code family. The direct certificate or bootstrap record must supply the locality window, implementable syndrome/recovery instruments, baseline error $p_{\text{err},0}$, threshold $p_{\text{th}}$, and code-overhead ledger used in the theorem statement.


**Theorem A.0.6 (Conditional Network Universality with Explicit Overhead Scope)**
A network of $n$ MPUs, operating with error rate $p_{\text{err}}^*$ satisfying robustness conditions and with sufficient additional resources for working memory, error-correction overhead, and circuit execution, can realize full Property R. More precisely:
1.  **Representation:** For a deterministic Turing machine with $k\ge2$ states and $m\ge2$ tape symbols, a direct uniform-length encoding of its $km$ transition entries uses
    $$
    L_{TM}
    =
    km\bigl(\lceil\log_2k\rceil+\lceil\log_2m\rceil+1\bigr)
    =
    \Theta(km\log(km))
    $$
    bits, up to a constant-size format header. The number of 3-bit MPU carriers required by this encoding is
    $$
    n_{\mathrm{desc}}
    =
    \left\lceil\frac{L_{TM}}3\right\rceil
    =
    \Theta(km\log(km)).
    $$
    This count concerns description storage only; it is neither the total simulation resource nor a lower bound against all compressed descriptions.
2.  **Simulation/Reason:** By the Solovay–Kitaev theorem [Kitaev 1997; Dawson & Nielsen 2006] and the accepted $\mathfrak C_{\mathrm{QEC}}$ for the retained noise model and code family, or an accepted $\mathfrak C_{\mathrm{GQEC}}$ discharging it on the protected window, the network can implement the protected finite gate approximations required by the target computation with the certified overhead. Since quantum computers efficiently simulate classical computation, the network can simulate any Turing machine once the required working-memory, code-overhead, and execution resources are available.
3.  **Evaluate Predicates:** Fault-tolerance ($p_{\text{err},0} < p_{\text{th}}$ inside $\mathfrak C_{\mathrm{QEC}}$, or inside $\mathfrak C_{\mathrm{GQEC}}$ when it discharges that certificate) ensures logical error rates can be suppressed to the certified target values with the recorded overhead, enabling reliable execution of the finite-depth predicate-evaluation circuits used in the noise-robust SPAP/RUD windows.

*Proof.* Item 1 gives the direct transition-table length
$$
L_{TM}=km\bigl(\lceil\log_2k\rceil+\lceil\log_2m\rceil+1\bigr)
$$
and hence the description-carrier count $n_{\mathrm{desc}}=\lceil L_{TM}/3\rceil$. The theorem separately assumes sufficient working memory and execution resources, so this description count is not used as a bound on the total network size.

For item 2, the accepted protected-gate ledger supplies a finite gate set $G\subset SU(d)$ that generates a dense subgroup, is closed under inverses, and is implementable on the protected code space. Let $U\in SU(d)$ be any target gate appearing in the finite simulation circuit and let $0<\epsilon<1$ be its recorded approximation tolerance. The Solovay–Kitaev theorem (Kitaev, 1997; Dawson and Nielsen, 2006) applies to $(G,U,\epsilon)$ and gives a word in $G$ whose operator-norm error is at most $\epsilon$, with polylogarithmic word length in $1/\epsilon$. Applying this construction to each gate of the finite reversible classical simulation circuit gives the protected finite gate approximation asserted in item 2. The working-memory hypothesis supplies the tape segment used during that finite computation.

For item 3, the accepted certificate $\mathfrak C_{\mathrm{QEC}}$, or the accepted bootstrap record $\mathfrak C_{\mathrm{GQEC}}$ discharging the same entries, records $p_{\mathrm{err},0}<p_{\mathrm{th}}$, an implementable syndrome/recovery instrument, and a logical-error suppression and overhead bound for the nominated finite circuit. Thus reliability is an explicit certificate consequence for that noise model, code family, and circuit window; no uncited threshold theorem is used to extend it to a different model. The representation, protected simulation, and reliable predicate-evaluation clauses are therefore established under exactly the theorem's declared resource and certificate hypotheses. ∎

**Corollary A.0.3 (Resource Requirements for SPAP/RUD)**
The SPAP diagonalization (Theorems A.1.1, A.1.3) requires:
*   Representing a direct transition-table description: $\Theta(k \cdot m \cdot \log(k \cdot m))$ bits for a predictor with $k$ states and $m$ symbols
*   Simulating the nominated prediction: the registered finite runtime and working-memory budget of that predictor; no depth bound in $k$ alone follows
*   Implementing the binary diagonal complement: one logical NOT on the retained decision bit
*   Verification: the finite comparison circuit declared by the nominated protocol

Thus this direct transition-table encoding has the sufficient description-carrier count
$$
n_{\mathrm{desc}}=\Theta(k \cdot m \cdot \log(k \cdot m))
$$
for description storage alone. This is not a lower bound against compressed encodings. The total MPU requirement additionally depends on working memory, error-correction overhead, and the required circuit depth. No universal numeric MPU count follows from the present derivation without a separate model for those overhead terms.

**Definition A.0.6 (Effective Operational Property R - Refined)**
The MPU network possesses Effective Operational Property R when:
1.  Network size $n$ provides sufficient representation capacity for relevant Gödel encodings
2.  QEC Compatibility ensures baseline error below threshold ($p_{\text{err},0} < p_{\text{th}}$)
3.  PCE optimization drives system to optimal error rate $p_{\text{err}}^* < 1/2$ for relevant computational depths
4.  Resulting reliability enables protected execution of the finite SPAP diagonal circuits and the registered-clock RID simulations used by the fixed-$\mathsf{TERM}$ reduction on the certified windows

This refined definition makes explicit the network-level realization of computational richness required by the framework's core theorems.


### A.0.6 Synthesis: Complete Foundation for Property R

**Summary of Foundations:**

One route establishes the needed logical abilities from closure, memory, and scalable computation. The other shows how a protected physical network could realize those abilities. The first answers what is sufficient in a formal model; the second answers how that model could be implemented.

**Technical ledger.**

**Foundation I (Conditional Logical Construction, §A.0.2):**
*   **Source:** Declared predictive closure, memory, uniformity, scalability, and arithmetic-coding hypotheses
*   **Derivation:** Binary retained decisions + Boolean composition + logical memory + uniform scalable resources + arithmetic coding → Property R
*   **Status:** Conditional theorem, independent of any particular physical implementation
*   **Significance:** Establishes Property R for exactly the predictive model classes satisfying the stated hypotheses

**Foundation II (Physical Instantiation, §A.0.3-A.0.5):**
*   **Source:** MPU framework under POP/PCE dynamics with ND-RID interactions
*   **Derivation:** Registered (O1)–(O3), (FC) three-bit context carrier plus the Hilbert and complexity-capacity bridges → independently certified POP/PCE reliability dynamics → network composition with the stated memory, coding, gate, and execution resources → Effective Operational Property R on the covered tasks and windows
*   **Status:** Physical realization under an accepted $\mathfrak C_{\mathrm{QEC}}$ or a covered $\mathfrak C_{\mathrm{GQEC}}$ discharge route, together with Dominant Cost Convexity
*   **Significance:** Gives a certificate-gated route by which the conditional formal construction may be represented in finite resource systems

**Complementarity:** The foundations answer different questions:
*   Logical foundation: *Which formal closure and scalability conditions suffice for Property R?*
*   Physical foundation: *How can those conditions be represented under resource constraints?*

Together, they provide a non-circular, branch-resolved account of Property R when all listed hypotheses and physical certificates are satisfied.

**Application to Core Theorems:**
On a model class carrying the conditional logical construction, and on a physical branch carrying the separate realization certificates, the framework's core theorems apply:

*   **SPAP (Theorems A.1.1-A.1.4):** On a coded model class carrying the registered self-representation/evaluator, predicate-decision, Boolean post-processing, and uniform diagonal-closure hypotheses of Theorems A.1.1 and A.1.3, the corresponding diagonal systems are constructible. Diagonalization then excludes one predictor that is perfectly correct throughout that declared class, establishing Logical Indeterminacy (Definition 12). Property R without those class-closure data does not by itself construct the diagonal member. A numerical boundary $\alpha_{\mathrm{SPAP}}$ exists only for a separately registered task, score, admissible class, and quantitative certificate; the diagonal theorem alone supplies no system-independent scalar.
*   **RUD (Theorems A.2.3-A.2.4):** A fixed terminal-reachability property is undecidable on every effectively coded pointed RID class containing the registered-clock simulations $\mathbf S_{e,w}$. The probabilistic extension assumes a computable finite runtime bound and computable complete finite support lists with rational probabilities; exact tree enumeration then gives the same halting reduction.

**Physical Applicability:** On a branch carrying the optimizer, robustness, QEC, protected-gate, memory, and execution certificates of Theorems A.0.2 and A.0.6, a physical MPU network possesses Effective Operational Property R for the covered finite tasks and windows. SPAP additionally requires its diagonal-closure and nominated-predictor hypotheses, while RUD requires its computable RID and interaction-model hypotheses. The resulting conclusions constrain prediction and computation only on windows satisfying all of those conditions. These theorems do not establish dynamical convergence of an arbitrary MPU network to such a certified configuration.


**Falsifiability:** The physical instantiation makes testable predictions. If the fundamental substrate is intrinsically non-QEC-compatible, meaning that its retained noise is fundamentally nonlocal for every protected branch, or its baseline error rates remain irreducibly above threshold for every accessible direct certificate $\mathfrak C_{\mathrm{QEC}}$ and every Golay-bootstrap certificate $\mathfrak C_{\mathrm{GQEC}}$, this would falsify the PU framework's claim that physical law emerges from predictive optimization in SPAP/RUD-capable networks. On the Golay-bootstrap subbranch, additional falsifiers are failure of the retained Golay syndrome statistics, failure of the finite syndrome/recovery maps to implement the recorded $[[23,1,7]]$ witness, or failure of the protected-window threshold inequality after the branch records are forward-locked. The framework requires that Nature's substrate supports at least one finite, below-threshold, operationally implementable protected-computation branch.

### A.0.7 Transition to Formal Proofs

For an MPU network satisfying the optimizer, robustness, QEC, protected-execution, diagonal-closure, and resource certificates stated in Theorems A.0.2 and A.0.6, the formal self-reference machinery applies to the covered physical tasks and windows. Sections A.1 and A.2 derive the Self-Referential Paradox of Accurate Prediction (SPAP) and Reflexive Undecidability (RUD) under their stated class and window hypotheses. The physical applicability is conditional on those certificates and does not assert network convergence.

### A.0.8 Conceptual Non-Redundancy of the Core Constraints

The framework's four core constraints — finite channel capacity (Theorem E.2), irreversible thermodynamic cost ($\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$, Theorem 31), self-referential limitation (SPAP, Theorems 10–11), and operational accessibility (Definition K.10.1) — address distinct obstructions to physical prediction. None is derivable from the others without additional physical assumptions. To establish this, we exhibit for each constraint a conceptual scenario satisfying the remaining three while violating the targeted one:

(i) *Finite capacity violated, others satisfied.* Consider a hypothetical physics in which channels have unbounded capacity per use, but every use includes a stipulated unbiased binary reset incurring $\Delta S\ge k_B\ln2$ (irreversible cost holds), self-referential prediction remains limited by diagonalization (SPAP holds), and physical content still requires operational distinguishability (accessibility holds). Such a scenario permits infinite information density while preserving irreversibility, self-referential limitation, and operationality. Finite capacity is not entailed by the other three.

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

Let $\mathcal M$ be a class of predictive models with Effective Operational Property R (Definition A.0.1) relative to a consistent formal system $\mathcal F$. Assume the following diagonal-closure property: for every nominated deterministic predictor $P_f$ in the class, $\mathcal M$ contains a system $S_{\mathrm{diag}}^{P_f}$ with a writable nominated bit $\phi$ and a registered protocol that (i) supplies $P_f$'s announced next-bit value $\hat\phi_{P_f,t}$ to $S_{\mathrm{diag}}^{P_f}$ before that system commits $\phi_{t+1}$ and (ii) permits the system to commit
$$
\phi_{t+1}=\operatorname{NOT}(\hat\phi_{P_f,t}).
\tag{A.1}
$$
Then no single $P_f$ can predict $\phi(s_{t+1})$ perfectly for every system in $\mathcal M$ on that protocol.

*Proof.* Suppose that $P_f$ is perfect on every system in $\mathcal M$. Apply it to the diagonal system supplied by the closure hypothesis. Perfection requires
$$
\hat\phi_{P_f,t}=\phi_{t+1}.
$$
The registered update rule gives
$$
\phi_{t+1}=\operatorname{NOT}(\hat\phi_{P_f,t}),
$$
and hence $\hat\phi_{P_f,t}=\operatorname{NOT}(\hat\phi_{P_f,t})$, impossible for a Boolean value. Therefore no such universal perfect predictor exists. The theorem uses the explicit read-before-commit protocol above; it makes no unstated claim about a universal MPU cycle duration or about classes that are not closed under this diagonal construction. ∎

### A.1.3 Theorem A.1.2 (Noise Robustness - Deterministic SPAP)

Let the conditions of Theorem A.1.1 hold and fix a deterministic predictor $P_f$. Construct $S_{noisy}^{P_f}$ so that in cycle $t$ it reads $P_f$'s prediction $\hat\phi_{P_f,t}$ and outputs $\operatorname{NOT}(\hat\phi_{P_f,t})$ with conditional probability $1-p_{err}$ and $\hat\phi_{P_f,t}$ with conditional probability $p_{err}$, where $0<p_{err}<1/2$. Assume the fresh-noise condition
$$
\mathbb P\!\left(
\phi_{t+1}=\hat\phi_{P_f,t}\mid h_{t-1},\hat\phi_{P_f,t}
\right)=p_{err}
$$
for every admissible history $h_{t-1}$. Then
$$
\mathbb P(P_f\text{ is correct for cycles }t,\ldots,t+k-1)
\le p_{err}^{k}\longrightarrow0.
\tag{A.2}
$$

*Proof.* For each cycle $r$, define
$$
C_r:=\{\phi_{r+1}=\hat\phi_{P_f,r}\},
$$
and let $\mathcal G_r$ be the $\sigma$-algebra generated by the admissible history through cycle $r-1$ together with the announced prediction $\hat\phi_{P_f,r}$. The fresh-noise hypothesis is
$$
\mathbb P(C_r\mid\mathcal G_r)=p_{err}
$$
almost surely. Put $E_0:=\Omega$ and, for $j\ge1$,
$$
E_j:=\bigcap_{i=0}^{j-1}C_{t+i}.
$$
Since $E_j\in\mathcal G_{t+j}$, the tower property gives
$$
\begin{aligned}
\mathbb P(E_{j+1})
&=
\mathbb E\!\left[
\mathbf 1_{E_j}\mathbb P(C_{t+j}\mid\mathcal G_{t+j})
\right] \\
&=
p_{err}\mathbb P(E_j).
\end{aligned}
$$
Induction from $\mathbb P(E_0)=1$ yields
$$
\mathbb P(E_k)=p_{err}^{k}.
$$
Thus the probability of remaining correct for $k$ consecutive diagonal cycles is $p_{err}^{k}$, which tends to zero because $0<p_{err}<1/2$. ∎

### A.1.4 Theorem A.1.3 (Probabilistic SPAP = Theorem 11)

Let $\mathcal M$ be a coded class of predictive models possessing Effective Operational Property R on the registered finite task. Assume uniform diagonal closure for every nominated binary probabilistic predictor $P_f\in\mathcal M$: the reported marginal
$$
p=P_f(\phi_{t+1}=1\mid S,t)
$$
has a finite representation for which the predicate $p>1/2$ versus $p\le1/2$ is decidable inside $\mathcal M$, and $\mathcal M$ contains a system $S_{\mathrm{diag}}^{P_f}$ that reads that report before commitment and realizes the Bernoulli law
$$
P_{\mathrm{actual}}(\phi_{t+1}=1)
=
\begin{cases}
0,&p>1/2,\\
1,&p\le1/2.
\end{cases}
\tag{A.3}
$$
Then no single predictor $P_f\in\mathcal M$ can assign a binary marginal that exactly matches the true marginal for every system in this declared diagonal class.

*Proof.* Suppose that one predictor is exact throughout the class. Uniform diagonal closure supplies $S_{\mathrm{diag}}^{P_f}\in\mathcal M$ and the finite threshold decision defining (A.3). Exactness on this member requires
$$
p=P_{\mathrm{actual}}(\phi_{t+1}=1).
$$
If $p>1/2$, Equation (A.3) makes the right-hand side $0$, contradicting $p>1/2$. If $p\le1/2$, it makes the right-hand side $1$, contradicting $p\le1/2$. The two decidable cases exhaust the registered marginal representation. Hence no such universally exact predictor exists. Effective Operational Property R supplies the registered finite computation; uniform diagonal closure is the separate hypothesis that places the counter-predictive member in $\mathcal M$. ∎

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

### A.2.2 Lemma A.2.1 (Behaviors Permitted by RID = Lemma 2)

RID systems as defined in Definitions A.2.1 and A.2.2 permit, but do not universally exhibit:
1.  **Irrecoverability of Prior State:** For specified $(y,o)$, the map $x\mapsto T(x,y,o)$ may be noninjective; the analogous stochastic kernels may also fail to identify the prior state.
2.  **Information Context Shift:** The law of the next outcome is evaluated from the current state and current interaction, and the transition produces the state used at the following step.
3.  **Predictive Instability:** An RID transition may be chosen to negate a prediction encoded in the interaction.

*Proof.* For item 1, take $X=\{0,1\}$ and singleton sets $Y=O=\{0\}$, with $V(x,0)=0$ and $T(x,0,0)=0$. Then
$$
T(0,0,0)=T(1,0,0),
$$
so the prior state cannot be recovered. Degenerate probability measures concentrated on these deterministic values give the same example for ND-RID.

For item 2, a deterministic trajectory satisfies
$$
o_n=V(x_n,y_n),\qquad x_{n+1}=T(x_n,y_n,o_n),\qquad
o_{n+1}=V(x_{n+1},y_{n+1}).
$$
Thus the next outcome depends on the context produced by the preceding transition. In the nondeterministic case the same assertion is the composition of the conditional kernels $V_{\mathrm{prob}}(\cdot\mid x_n,y_n)$ and $T_{\mathrm{prob}}(\cdot\mid x_n,y_n,o_n)$.

For item 3, let $X=Y=\{0,1\}$, let an interaction $q\in Y$ encode a prediction of the next state, take $O=\{0\}$, and define
$$
V(x,q)=0,\qquad T(x,q,0)=1-q.
$$
For either prediction $q$, the realized next state is its negation. Hence the RID definitions admit counter-predictive instability. These examples prove possibility only; injective, context-independent, or stable RID models are also allowed by the definitions. ∎

### A.2.3 Reflexive Undecidability (RUD)

For a coded pointed deterministic RID instance $(S,x_0)$ whose state space carries a designated terminal-bit projection $\pi_b:X\to\{0,1\}$, define its registered repeated-tick trajectory by
$$
x_{n+1}
:=
T\!\left(x_n,\mathsf{tick},V(x_n,\mathsf{tick})\right),
\qquad
b_n:=\pi_b(x_n),
$$
and fix the terminal-reachability property
$$
\mathsf{TERM}(S,x_0)
\quad\Longleftrightarrow\quad
\exists n<\infty\text{ such that }b_n=1.
$$
This property, including the registered trajectory, is fixed before any decider is quantified.

For each Turing-machine code $e$ and input $w$, let
$$
S_{e,w}
=
\bigl(X_{e,w},Y,O,V,T\bigr)
$$
be the deterministic RID system of Definition A.2.1, and let $\mathbf S_{e,w}:=(S_{e,w},x_0)$ be its pointed instance, where
$$
X_{e,w}:=\operatorname{Conf}_e\times\{0,1\},
\qquad
Y:=\{\mathsf{tick}\},
\qquad
O:=\{0,1\}.
$$
Here $\operatorname{Conf}_e$ is the computable configuration space of $e$, $\operatorname{Step}_e$ is its total one-step transition map with halting configurations absorbing, and $\operatorname{Halt}_e(c)\in\{0,1\}$ is the decidable predicate that $c$ is halting. Set
$$
x_0
:=
\bigl(c_0(e,w),\operatorname{Halt}_e(c_0(e,w))\bigr),
\qquad
V((c,b),\mathsf{tick}):=b,
$$
and
$$
T((c,b),\mathsf{tick},o)
:=
\begin{cases}
(c,1),&b=1,\\
\bigl(c',\operatorname{Halt}_e(c')\bigr),
&b=0,\ c'=\operatorname{Step}_e(c).
\end{cases}
$$
The transition is independent of $o$, and $\pi_b(c,b):=b$. Thus one registered tick performs one simulated step, and the terminal bit is absorbing.

**Theorem A.2.3 (Fixed-Property Deterministic Reflexive Undecidability = Part of Theorem 12)**

Let $\mathcal C_{DRID}^{\bullet}$ be any effectively coded class of pointed RID instances containing every $\mathbf S_{e,w}$, with effective codes for the designated initial state, terminal-bit projection, verifier, and transition. No total interactive algorithm, given the code and registered interaction access, halts and correctly decides $\mathsf{TERM}(S,x_0)$ for every $(S,x_0)\in\mathcal C_{DRID}^{\bullet}$.

*Proof.* The construction $(e,w)\mapsto\ulcorner\mathbf S_{e,w}\urcorner$ is effective. By induction on the tick count, the first component of the state after $n$ ticks is the configuration of $e(w)$ after $n$ steps, while $b_n=1$ exactly when a halting configuration has been reached by that time. Hence
$$
\mathsf{TERM}(S_{e,w},x_0)
\quad\Longleftrightarrow\quad
e(w)\text{ halts}.
$$
If a total correct interactive decider $D$ existed, compute the effective code of $\mathbf S_{e,w}$, simulate its registered interaction with $D$, and return $D$'s answer. Every requested verifier or transition response is computable from the displayed data, so this procedure would decide the halting problem. ∎

**Theorem A.2.4 (Fixed-Property Uniformly Bounded Probabilistic Reflexive Undecidability = Part of Theorem 12)**

Let $\mathcal C_{NDRID}^{\bullet}$ contain the pointed deterministic instances $\mathbf S_{e,w}$ as point-mass kernels. Fix a rational $0<\epsilon<1/2$. There is no probabilistic interactive algorithm $D_\epsilon$ satisfying all of the following conditions:

1. at every internal or interaction node, a complete finite support list of successors and their probabilities is computable;
2. every listed transition probability is rational;
3. a total computable function $B(\ulcorner S,x_0\urcorner)$ bounds the total number of internal and interaction transitions before $D_\epsilon$ halts on $(S,x_0)$;
4. for every $\mathbf S_{e,w}$, it decides $\mathsf{TERM}(S_{e,w},x_0)$ with probability at least $1/2+\epsilon$.

*Proof.* Suppose $D_\epsilon$ existed. For fixed $\ulcorner\mathbf S_{e,w}\urcorner$, compute $B(\ulcorner\mathbf S_{e,w}\urcorner)$. The complete finite support lists and the total transition bound make the joint computation-and-interaction tree finite and effectively enumerable. Exact rational summation over its leaves computes
$$
q_{e,w}
:=
\mathbb P\!\left(D_\epsilon(\mathbf S_{e,w})=\mathsf{Yes}\right).
$$
The success guarantee implies
$$
\mathsf{TERM}(S_{e,w},x_0)
\Longrightarrow
q_{e,w}\ge\frac12+\epsilon,
$$
and
$$
\neg\mathsf{TERM}(S_{e,w},x_0)
\Longrightarrow
q_{e,w}\le\frac12-\epsilon.
$$
Comparing the exactly computed $q_{e,w}$ with $1/2$ decides whether $e(w)$ halts, contradicting Theorem A.2.3. ∎

**Scope.** A fixed protected window of $N$ registered ticks decides only the bounded property
$$
\mathsf{TERM}_{N}(S,x_0)
\quad\Longleftrightarrow\quad
\exists n\le N\text{ such that }b_n=1.
$$
Physical use of Theorems A.2.3–A.2.4 therefore requires a scalable coded RID family that realizes every finite prefix requested during the computation of a purported total decider; no single fixed finite window realizes the unbounded reduction.

## A.3 Significance and Relation to Logical Indeterminacy

* **Logical Indeterminacy:** SPAP excludes a single universally exact predictor on its stated diagonal-closed class. RUD excludes a total uniform $\mathsf{TERM}$ decider on the stated coded terminal-simulation class, with the separately qualified bounded probabilistic extension of Theorem A.2.4.
* **Physical Stochastic Closure:** Principle 11b requires the PPI-complete convex invariant response ledger when the registered finite reflexive map has no pure fixed point. For binary negation, Theorem 11b proves $q(\phi\mid R)=1/2$ and $H_{\mathrm{Sh}}(\Phi\mid R)=\ln2$. Principle 8.0c identifies that ledger with the registered single-run outcome probabilities; a frequency law additionally requires an i.i.d., exchangeable, or stationary-ergodic repeated-trial certificate.
* **Quantum Reconstruction:** Principle 8.0b supplies the sharp homogeneous carrier certificate and Theorem 8.0d fixes $\mathcal H_0\cong\mathbb C^8$. Theorem 8.2 removes response-null labels, and Lemma 8.2a supplies retained-refinement additivity. Definition 8.2b's independently accepted $\mathfrak C_{\mathrm{Born}}$ then supplies full projection/effect coverage or a finite informationally complete positive reconstruction; Theorem 8.3 proves the Born trace rule only on that certified domain.
* **Complexity Costs of Prediction:** On a task class carrying the certificate $\mathfrak C_{B.2}$, Theorem 14 supplies the log-enhanced quadratic lower bound $C_{\mathrm{uni}}(\delta_{\mathrm{SPAP}})=\Omega\!\left(\log(1/\delta_{\mathrm{SPAP}})/\delta_{\mathrm{SPAP}}^{2}\right)$, so verification and update complexity on that class diverges as the gap $\delta_{\mathrm{SPAP}}$ to $\alpha_{SPAP}$ closes (Appendix B.3; Theorem B.2). Transfer of that bound to $C_P$ uses its declared domination bridge.
*   **Limits on Interaction:** RUD theorems A.2.3-A.2.4 exclude a total uniform decider for $\mathsf{TERM}$ on the stated effectively coded pointed RID class. The probabilistic result additionally requires a computable finite runtime bound, computable complete finite support lists with rational probabilities, and a specified positive advantage. This complements two independent Appendix E capacity branches: a completed tensor-factor reset-support certificate gives $C_{\max}\le\ln d_0-\ln r$, while an input-independent refresh/minorization component gives $C_{\max}<\ln d_0$. Theorem 31 separately gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ on its registered cyclic-reset branch, with a positive floor only when $H_q(P\mid R)\ge h_{\min}>0$. None of these physical branch conditions follows from the definition of ND-RID alone.

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
$$
g(a,n):=\Psi(φ_a(a),n).
$$
Universality of the accepted effective numbering makes $(a,n)\mapsto φ_a(a)$ partial computable, and composition with the partial computable $\Psi$ makes $g$ partial computable uniformly in $(a,n)$. The parameter theorem, also called the $s$-$m$-$n$ theorem (Kleene, 1952), therefore applies to this accepted numbering: there exists a total computable function $s:\mathbb N\to\mathbb N$ such that for all $a,n$,
$$
φ_{s(a)}(n)=g(a,n)=\Psi(φ_a(a),n).
$$
Let $\hat s$ be an index for $s$, so $φ_{\hat s}=s$, and set $\beta:=s(\hat s)=φ_{\hat s}(\hat s)$. Then, for every $n$,
$$
φ_\beta(n)
=φ_{s(\hat s)}(n)
=\Psi(φ_{\hat s}(\hat s),n)
=\Psi(\beta,n).
$$
Thus $\beta$ is the required self-referential index. ∎

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

The construction shows that ordinary arithmetic can represent a total procedure that examines bounded statements about itself and changes its output in response. It therefore supplies a concrete logical example of adaptive self-reference. The appendix treats realization of the same abilities in a physical network as a separate implementation problem.

**Technical ledger.**

The LITE construction robustly demonstrates that standard Peano Arithmetic, a foundational system of mathematics, possesses sufficient richness to define total computable functions exhibiting dynamic, adaptive self-reference based on bounded internal "proof discovery." It formally shows that capabilities analogous to self-representation, bounded self-simulation/reasoning, and adaptive predicate evaluation—the core components of Property R—are not reliant on exotic computational models but can be realized within a well-understood arithmetical framework.

MPUs are physical entities rather than abstract arithmetical functions. The LITE construction proves that a standard arithmetical framework can realize total computable functions with bounded adaptive self-reference. It therefore supplies an existence example for the logical form used in the later diagonal arguments. Physical realization by an MPU network is the separate conditional result of Theorem A.0.2 (Conditional Effective Property R at a Certified PCE Optimum), whose optimizer, robustness, QEC, protected-gate, memory, and execution certificates are not supplied by LITE. The PU resource quantities $C_P$, $R$, and $R_I$ may be compared with LITE's bounded proof-search function $g(n)$ only at this structural level.

## A.5 Trace-Certified Diagonal Transcripts and Live-Challenge Scope

The LITE construction (§A.4) establishes that Peano Arithmetic can host total computable functions whose definitions use bounded self-reference. This section separates two further objects.

1. $G_S$ is a closed PA formula recording completed finite computation traces. Its truth and finite PA proof object are retrospective trace facts.
2. $E^*$ in Theorem M.10.4 is a live joint diagonal challenge whose retained outputs are selected against the predictor's current nominated outputs.

A record of a completed challenge is not the challenge itself. Consequently, Theorem M.10.4 does not assign $\mu_S(G_S)=\infty$, and Theorem M.10.6 does not assign a pointwise infinite processing cost to $G_S$. The PA-side trace theorem uses standard arithmetization, finite trace checking, and fixed-point machinery. The live diagonal conclusion separately requires Theorem M.10.4's contemporaneous register construction and implementation hypotheses. The certified cost limit separately requires Theorem M.10.6's pattern-specific reduction certificate. The valid conclusions below are retrospective trace certification, conditional external processing, a typed separation from the live diagonal branch, and the cycle-indexed obstruction of §A.5.6a.

### A.5.1 PA Trace Objects and Predictor Reachability


We first separate three notions that must not be conflated:

1. existence of a PA sentence;
2. existence of a PA proof-object for that sentence;
3. reachability of that proof-object by a particular predictor as a content-integrating act.

Gödelian incompleteness concerns the second notion: for suitable recursively axiomatized theories extending enough arithmetic, there are sentences not provable in the theory, and under the corresponding soundness assumptions those sentences are true in the intended model [Gödel 1931]. The third notion is processing-event-relative: the proof object may exist in PA while reachability or unreachability for a specified predictor remains undecided until a concrete model-change map and finite-cost or cost-divergence certificate are supplied. Gödel's original 1931 paper is the reference point for the formal-system-relative result, while the representability and fixed-point tools used below are standard arithmetical machinery [Kleene 1952; Mendelson 2015].

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

This definition is intentionally stronger than ordinary proof checking. A predictor may manipulate a proof string as an uninterpreted external symbol pattern without integrating its content into the specified self-model; that operation is not reachability under this definition. Reachability and unreachability are properties of the declared processing event and its finite-cost or cost-divergence certificate. Predictor indexing of a completed transcript establishes neither conclusion. In particular, no theorem below claims that $S$ cannot reach $G_S$ unless a separate certificate proves that claim.
### A.5.2 Retrospective and Live Diagonal Objects

Gödelian incompleteness concerns absence of a proof from a fixed formal system under its usual hypotheses. The object $G_S$ below is different: it is a finite conjunction of true closed trace facts and therefore has a finite PA proof object.

The live diagonal limitation is also different. Theorem M.10.4 applies to a contemporaneous joint challenge whose output on each retained register is defined against the current prediction on that register. Once those outputs have occurred and are encoded by fixed numerals in $G_S$, later verification of the transcript cannot change them. Therefore neither PA proofhood nor predictor indexing identifies $G_S$ with the live pattern $E^*$.

Any processing conclusion for $G_S$ requires its own model-change map and finite-cost certificate. Any cost-divergence conclusion for a live pattern requires the implementation and pattern-specific reduction certificates stated in Theorem M.10.6.

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
Definition A.5.3 uses the same arithmetical infrastructure as §A.4: Gödel coding, primitive-recursive substitution, finite proof/trace checking, and fixed-point machinery. LITE applies this machinery to construct a total computable function $f$. Definition A.5.3 applies it to construct, for each predictor $S$, a PA object whose content is wired to $S$'s own self-model prediction registers. LITE demonstrates tractable self-reference. The index $S$ in $G_S$ records which completed computations are encoded; it does not convert their later verification into a live diagonal challenge.

**Lemma A.5.1 (Existence, Truth, and PA Proof-Object).**
Let $S$ be a predictive system with Effective Operational Property R satisfying $n_S\ge N^*(S)$. Then $G_S$ exists as a closed PA formula, is true in the standard model $\mathbb N$, and has a finite PA proof-object.


*Proof.* For each $j\le N^*(S)$, Theorem A.1.1 constructs the diagonal component $S_{\mathrm{diag}}^{(j)}$, and Theorem M.10.4 supplies the independent-register amplification. The hypothesis $n_S\ge N^*(S)$ supplies the required addressable Fisher-orthogonal registers.

The coding, substitution, and bounded transition-checking operations of §A.4 are primitive recursive. A candidate trace has finite length, so $\mathrm{Trace}(e,x,\tau,y)$ is the finite conjunction asserting the initial configuration, each legal successor configuration, and the terminal output. It is therefore a primitive-recursive relation. Kleene's representability theorem (Kleene 1952) applies because PA represents primitive-recursive relations and all four arguments below are numerals. Each specified computation has a finite standard trace $\tau_j(S)$ with output $y_j(S)$; hence the true closed instance
$$
\mathrm{Trace}\left(\overline{e_j(S)},\overline{x_j(S)},\overline{\tau_j(S)},\overline{y_j(S)}\right)
$$
has a finite PA derivation. The index set $1\le j\le N^*(S)$ is finite, and repeated conjunction introduction combines those derivations into a PA derivation of $G_S$. Thus $G_S$ is closed, true in $\mathbb N$, and has a finite PA proof-object. ∎

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
Let $S$ satisfy Lemma A.5.1, and let $A$ be above-threshold for $S$. Processing $G_S$ under the externally insulated branch of Definition A.5.4 gives
$$
\Delta M_A^{(\mathrm{self})}(G_S)=0
$$
and
$$
\sigma_A(G_S)=0.
$$
If $A$ also satisfies the baseline-invariance hypothesis
$$
\Pi_A^{(0)}(\theta_A)=\theta_A,
$$
then
$$
PP_A^{(G_S)}=0,
\qquad
\delta_A(G_S)=\alpha_{SPAP},
\qquad
\mu_A(G_S)=\frac{1}{\alpha_{SPAP}}.
\tag{A.5.7}
$$
These identities concern the reflexive profile. Reachability additionally requires a finite certificate for the external proof-checking and model-update event.

*Proof.* Definition A.5.4 places the represented registers of $S$ in $A$'s external-model subspace and requires the represented transcript to induce no retained update of $A$'s self-model coordinates. Hence $\Delta M_A^{(\mathrm{self})}(G_S)=0$, and Definition M.10.4 gives $\sigma_A(G_S)=0$. Under the additional baseline-invariance hypothesis, Corollary M.10.3.1 gives the displayed values of $PP_A^{(G_S)}$, $\delta_A(G_S)$, and $\mu_A(G_S)$. No statement about the remaining external processing cost follows from those quantities. ∎

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
n_{S_0}\ge N^*(S_0).
\tag{A.5.9}
$$

Theorem 15 supplies the minimal per-register SPAP logic; Theorem A.0.6 supplies the network-level route to Effective Operational Property R; Theorem M.10.4 supplies the required independent-register branch. No claim is made that the total aggregate $S_0$ has exact complexity $K_0$. The exact claim is that each SPAP register core is $K_0$-minimal, while the full witness is the finite Property-R aggregate required to host the diagonal amplification.

### A.5.5 Retrospective Trace Certification and Live-Challenge Separation

For every predictor $S$ satisfying the implementation hypotheses of Theorem M.10.4, let $E_S^*$ denote the live joint diagonal pattern constructed there. When an attempted integration of $E_S^*$ induces a candidate updated self-model parameter, denote that parameter by $\theta_S'$.

**Theorem A.5.1 (Retrospective Trace Certification and Live-Challenge Separation).**
Fix Peano Arithmetic as the object-language proof system. Let $S$ have Effective Operational Property R, satisfy $n_S\ge N^*(S)$, and let $G_S$ be the predictor-indexed diagonal transcript object of Definition A.5.3. Then:

**(i) PA proof object.** $G_S$ is true in $\mathbb N$ and has a finite PA proof object.

**(ii) Typed separation.** The objects used by the trace theorem and the live diagonal theorem have different operational types:
$$
G_S\text{ is a completed-trace sentence},
\qquad
E_S^*\text{ is a live challenge}.
\tag{A.5.10}
$$
Consequently, Theorem M.10.4 does not by itself imply $\mu_S(G_S)=\infty$, and Theorem M.10.6 does not by itself imply any pointwise equality $C_{\mathrm{process}}(S,G_S)=\infty$.

**(iii) Conditional external reachability.** Let $A$ be above-threshold for $S$. Suppose either a PA proof object for $G_S$ is supplied, or the complete finite transcript witnesses are supplied together with a certified finite construction of such a proof. If $A$ satisfies baseline invariance and one finite external-processing certificate covers every invoked operation—syntactic proof verification, any claimed proof construction, and the external-model update—then $G_S$ is reachable for $A$. On that branch,
$$
\sigma_A(G_S)=0,
\qquad
PP_A^{(G_S)}=0,
\qquad
\delta_A(G_S)=\alpha_{SPAP},
\qquad
\mu_A(G_S)=\frac{1}{\alpha_{SPAP}}.
\tag{A.5.11}
$$

**(iv) Live diagonal boundary.** Let $S_0$ be a horizon-core aggregate witness, and suppose an independent implementation certificate realizes the live joint challenge $E_{S_0}^*$ of Theorem M.10.4 with its declared register responses and Fisher geometry. Let $\theta_{S_0}'$ be the candidate updated self-model parameter induced by the attempted integration of that live pattern. For every $PP\in[0,\alpha_{SPAP})$,
$$
\left\|\Pi_{S_0}^{(PP)}(\theta_{S_0}')-\theta_{S_0}'\right\|_{\mathcal F_{S_0}}
\ge
\sqrt{N^*(S_0)}D_1(S_0),
\tag{A.5.12}
$$
and
$$
\sqrt{N^*(S_0)}D_1(S_0)>g(\alpha_{SPAP}).
\tag{A.5.13}
$$
Because $g$ is nondecreasing, for every $PP<\alpha_{SPAP}$,
$$
\sqrt{N^*(S_0)}D_1(S_0)
>
g(\alpha_{SPAP})
\ge
g(\alpha_{SPAP}-PP),
$$
so the finite-$\mu$ criterion fails. At $PP=\alpha_{SPAP}$, $g(0)=0$, while the live NOT construction excludes the required fixed point. Hence $\mu_{S_0}(E_{S_0}^*)=\infty$. If the pattern-specific reduction certificate of Theorem M.10.6 is also supplied, then
$$
\liminf_{\delta\downarrow0}
C_{\mathrm{integrate}}(S_0,E_{S_0}^*;\delta)=\infty.
$$
This is a certificate-relative absence of a finite uniform upper bound in the accuracy limit, not a pointwise infinite cost for the retrospective sentence $G_{S_0}$.

*Proof.* Part (i) is Lemma A.5.1. For part (ii), every numeral $\bar\tau_j(S)$ in $G_S$ denotes a trace that has already terminated. Verifying the resulting closed sentence occurs after those outputs are fixed and therefore cannot determine them. Theorem M.10.4 instead constructs each component of $E_S^*$ so that its current output negates the nominated current prediction on the corresponding register. No map identifying later verification of $G_S$ with that live response event is supplied. Thus the hypotheses of Theorem M.10.4 do not apply to $G_S$, and Theorem M.10.6 cannot be invoked for $G_S$ without a separate pattern and reduction certificate.

For part (iii), Lemma A.5.2 gives the reflexive-profile identities under external insulation and baseline invariance. The supplied finite external-processing certificate bounds proof verification, any invoked proof construction, and the external-model update, so Definition A.5.2 gives reachability.

For part (iv), Equations A.5.12 and A.5.13 are the independent-register estimate and strict amplification inequality of Theorem M.10.4 applied to the realized live pattern. That theorem gives $\mu_{S_0}(E_{S_0}^*)=\infty$. The final limit is exactly Theorem M.10.6 under its additional pattern-specific reduction certificate. ∎

**Corollary A.5.1 (No Retrospective-Horizon Inference).**
For every $S$ satisfying Theorem A.5.1, the PA proofhood of $G_S$ establishes neither its reachability nor its unreachability for $S$. Either conclusion requires a separately specified processing event and cost certificate. The live diagonal obstruction remains the one in Theorem M.10.4 and §A.5.6a.

*Proof.* This is Theorem A.5.1(i)-(ii) together with Definition A.5.2. ∎

**Corollary A.5.2 (Certificate-Relative Live Cost Boundary).**
On the branch of Theorem A.5.1(iv), no $PP<\alpha_{SPAP}$ satisfies the live integration criterion. With the additional reduction certificate of Theorem M.10.6, the certified integration cost has no finite uniform upper bound as $\delta\downarrow0$. No conclusion about the cost of checking a fixed finite transcript, and no claim that a completed individual run dissipates infinite energy, follows.

*Proof.* Apply Theorem M.10.6 to $E_{S_0}^*$ and retain all of its hypotheses and scope qualifications. ∎

### A.5.6 Interpretation and Scope

**Remark A.5.3 (Contrast with Gödel).**
Theorem A.5.1 is not an incompleteness theorem for PA. The sentence $G_S$ has a PA proof. The theorem establishes a type distinction between retrospective proof verification and a live diagonal challenge.

**Remark A.5.4 (Syntactic Proof Checking).**
A supplied proof of $G_S$ is finite and syntactically checkable. Whether a physical predictor can complete the associated content update is a separate finite-processing question; no divergence follows from predictor indexing alone.

**Remark A.5.5 (Live Scope).**
Theorem M.10.4 applies only to its realized live joint challenge with the stated register and Fisher-separation data. A historical record of that challenge may later be processed without recreating the prediction-contingent event.

**Remark A.5.6 (Consistency with LITE).**
There is no tension with §A.4. LITE is total and computable, $G_S$ is a finite trace-certified PA object, and §A.5.6a supplies the distinct time-indexed active diagonal limitation.

**Remark A.5.7 (Conditional Status Within PU).**
The trace-certification result uses standard arithmetization. The live boundary uses Theorem M.10.4's independent-register and implementation hypotheses. A computational divergence additionally uses Theorem M.10.6's pattern-specific reduction certificate. A thermodynamic statement additionally requires Theorem M.10.7's implementation ledger.

**Remark A.5.8 (Terminology).**
The phrase *complexity-bounded incompleteness* is not used for $G_S$. The established statements are retrospective trace certification, phase-indexed active diagonal failure, conditional historical or external accessibility, and certificate-relative live integration bounds.

### A.5.6a Phase-Indexed Access, Historical Recovery, and Model-Indexed LITE

Theorem A.5.1 separates retrospective PA trace certification from a live diagonal challenge. This subsection gives the cycle-indexed form directly: truth and proofhood remain fixed while active access is predictor-indexed, time-indexed, and verification-gated, and the same object may become historically accessible after the targeted register is recorded. For the semantic steps in Theorem A.5.6a.2 and Appendix A.6, require the fixed-point biconditional to be proved in a base whose axioms are true in $\mathbb N$—for example PA—or assume its displayed standard-model equivalence directly. Mere consistency of an arithmetically adequate theory is not used to infer truth in $\mathbb N$.

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

*Proof.* The trace-certified predicate $\operatorname{Pred}_B(\bar t,x)$ is an arithmetic formula with the single free code variable $x$, and the arithmetic $\mathcal F$ represents the primitive-recursive coding and substitution operations of §A.4. The diagonal lemma of Gödel (1931) therefore applies to
$$
\varphi(x):=\neg\operatorname{Pred}_B(\bar t,x)
$$
and supplies a sentence $E_{B,t}$ with code $e_{B,t}$ such that
$$
\mathcal F\vdash E_{B,t}\leftrightarrow
\neg\operatorname{Pred}_B(\bar t,\overline{e_{B,t}}),
$$
which is Equation A.5.6a.2. Trace certification makes $\operatorname{Pred}_B(\bar t,\bar e)$ true in $\mathbb N$ exactly when $P_B(t,e)=1$. Interpreting the displayed equivalence in $\mathbb N$ therefore gives
$$
\mathbb N\models E_{B,t}\Longleftrightarrow P_B(t,e_{B,t})\ne1,
$$
which is Equation A.5.6a.3. ∎

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

**Lemma A.5.6a.5 (Chance-Null Registers Are Update-Null under a No-Op Dominance Certificate).** Let $M_t$ be the retained model of a predictor $S_t$, let $R_T$ be a finite verification register, and let $\mathcal U_S$ be the admissible update family. For $U\in\mathcal U_S$, define
$$
\Delta Q_U(M_t,R_T)
=
Q(U(M_t,R_T))-Q(M_t).
$$
Assume that the no-op $U_0(M_t,R_T)=M_t$ is admissible and that a registered no-op dominance certificate establishes both:
(i) every $U$ with $\mathbb E[\Delta Q_U\mid M_t]=0$ is predictively equivalent to $U_0$ or has strictly larger PCE potential; and
(ii) every $U$ with $\mathbb E[\Delta Q_U\mid M_t]<0$ has strictly larger PCE potential than $U_0$.
If
$$
\sup_{U\in\mathcal U_S}
\mathbb E[\Delta Q_U(M_t,R_T)\mid M_t]\le0,
\tag{A.5.6a.10}
$$
then
$$
[\mathcal U_{\mathrm{PCE}}(M_t,R_T)]_Q=[M_t]_Q.
\tag{A.5.6a.11}
$$

*Proof.* The admissible no-op has expected gain zero, so the supremum in (A.5.6a.10) equals zero. By clause (ii), no negative-gain update minimizes the PCE potential. By clause (i), every zero-gain minimizer is either in the no-op predictive equivalence class or is strictly cost-dominated. Hence every retained PCE minimizer lies in $[M_t]_Q$, proving (A.5.6a.11). ∎

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

This section records a conservative consequence of the phase-indexed diagonal theorem in §A.5.6a. It introduces no physical primitive and no additional axiom. The precise obstruction is same-cycle and domain-specific: a trace-certified predictor cannot implement a total standard-sound Boolean closure on a represented domain containing the live diagonal sentence targeted at that cycle. The same sentence may be processed externally or historically after the targeted register is fixed. Stable finite partial closures are asserted only for prediction-update cycles satisfying the hypotheses stated below.

### A.6.1 Internal closure maps

**Definition A.6.1 (Live-diagonal internal closure domain).** Let $S$ be a trace-certified predictor in the sense of Definition A.5.6a.1, and fix a cycle $t$. Let $\mathsf{TC}_{S,t}$ be the represented class of closed arithmetical sentences whose codes can be placed in $S$'s active prediction register at $t$. Let
$$
E_{S,t}\in\mathsf{TC}_{S,t}
$$
be the time-indexed diagonal sentence of Theorem A.5.6a.2. A represented domain
$$
D_{S,t}\subseteq\mathsf{TC}_{S,t}
$$
is **live-diagonal complete for $(S,t)$** when $E_{S,t}\in D_{S,t}$. Historical processing of $E_{S,t}$ at a later cycle is not same-cycle closure on $D_{S,t}$.

**Definition A.6.2 (Internal finite-cycle closure map).** Let $D_{S,t}\subseteq\mathsf{TC}_{S,t}$. An $S$-internal map
$$
\operatorname{Cl}_{S,t}:D_{S,t}\to\{0,1,\bot\}
$$
is an **internal finite-cycle closure map** when
$$
\operatorname{Cl}_{S,t}(H)=P_S(t,\ulcorner H\urcorner)
$$
for every $H\in D_{S,t}$ and the output is delivered by the cycle-$t$ boundary. The values $1$ and $0$ are retained Boolean judgments that $H$ is true and false, respectively; $\bot$ is explicit abstention. The map is **total** when it never returns $\bot$. It is **standard-sound** when, for every $H\in D_{S,t}$,
$$
\operatorname{Cl}_{S,t}(H)=1
\Longrightarrow
\mathbb N\models H
$$
and
$$
\operatorname{Cl}_{S,t}(H)=0
\Longrightarrow
\mathbb N\models\neg H.
$$

**Theorem A.6.2 (No total standard-sound live-diagonal self-closure).** Let $S$ be trace-certified, fix $t$, and let $D_{S,t}$ be live-diagonal complete for $(S,t)$. No $S$-internal finite-cycle closure map on $D_{S,t}$ is both total and standard-sound.

*Proof.* Since $E_{S,t}\in D_{S,t}$, totality gives
$$
\operatorname{Cl}_{S,t}(E_{S,t})\in\{0,1\}.
$$
If this value is $1$, then $P_S(t,\ulcorner E_{S,t}\urcorner)=1$, so Equation A.5.6a.3 makes $E_{S,t}$ false in $\mathbb N$, contradicting standard soundness. If the value is $0$, then $P_S(t,\ulcorner E_{S,t}\urcorner)=0$, so Equation A.5.6a.3 makes $E_{S,t}$ true in $\mathbb N$, again contradicting standard soundness. The remaining value $\bot$ violates totality. ∎

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
4. $V_{S,B}:D_{S,B}\to\{0,1\}$ is the finite protocol-verification predicate, and for every active cycle $t$ represented in $D_{S,B}$ no retained same-cycle subdomain containing $E_{S,t}$ is assigned total standard-sound Boolean judgments.
5. $q_{S,B}$ is the response quotient identifying judgments with the same retained finite protocol-response role.

The tuple is stable when it satisfies:

1. **finite response:** every retained judgment in $D_{S,B}$ has finite protocol response and processing cost bounded by $B$;
2. **local soundness:** derivability under $\vdash_{S,B}$ preserves $V_{S,B}$ after quotienting by $q_{S,B}$;
3. **composition closure:** finite compositions of admitted prediction-update steps remain in $D_{S,B}$ whenever their protocol responses are retained by $q_{S,B}$;
4. **live-diagonal guard:** for each represented active cycle $t$, the sentence $E_{S,t}$ is omitted from the same-cycle retained domain, assigned $\bot$ in a ternary extension, or deferred to a later cycle;
5. **PCE minimality:** when the relevant response-equivalence class has an attained PCE minimum under Definition 15 and Definition 15a, $\mathfrak A_{S,B}$ is represented by a least-cost member of that class.

**Theorem A.6.4 (Axiom-stabilizer necessity for nontrivial verified prediction).** Every nontrivial finite prediction-update cycle satisfying the Fundamental Predictive Loop, binary verification, finite-budget retention, the live-diagonal guard, and composition, logical-memory, and uniform-specification rules that preserve the declared verification predicate modulo the retained response quotient induces a stable axiom-stabilizer on its retained finite response domain. Conversely, every stable axiom-stabilizer supplies the data of an axiom-like local formal system for the corresponding retained prediction-update domain.

*Proof.* Let such a cycle be given. It contains a finite prediction object, a finite response protocol, a returned response $r$ in a finite response set $R$, and an acceptance set $A\subseteq R$. Remark A.0.1.1 therefore gives
$$
V_A(r)=\mathbf 1_A(r).
$$
Let $D_{S,B}$ be the finite or finitely generated domain of claims actually queried, verified, remembered, composed, or updated within the retained finite budget $B$. Let $J_{S,B}$ be its accepted seed claims, let $\vdash_{S,B}$ be the retained composition, memory, and uniform-specification relation, and let $q_{S,B}$ identify claims with the same retained protocol-response role.

Finite response holds by finite-budget retention. Local soundness holds by the verification-preservation hypothesis. Composition closure follows from the retained-rule hypothesis. The live-diagonal guard is a theorem hypothesis; Theorem A.6.2 shows that a standard-sound domain containing $E_{S,t}$ cannot instead carry a total same-cycle Boolean closure. If the relevant response-equivalence class has an attained PCE minimum, replacing the stabilizer by a least-cost representative preserves every retained response and gives PCE minimality. Hence the cycle induces a stable axiom-stabilizer.

Conversely, a stable axiom-stabilizer supplies accepted seeds, a retained inference/update relation, a verification predicate, and a response quotient on its retained domain. These data are an axiom-like local formal system, with omission, abstention, or historical deferral at the live boundary rather than a total same-cycle truth predicate. ∎

**Corollary A.6.5 (Generative non-closure chain).** For every trace-certified predictor $S$ and targeted cycle $t$, every standard-sound same-cycle closure on a represented domain must omit $E_{S,t}$, return $\bot$ on it, or defer it to a later cycle. Equivalently, any total same-cycle Boolean closure on a domain containing $E_{S,t}$ relinquishes standard soundness at that live diagonal sentence.

Independently, every nontrivial finite verified prediction-update cycle satisfying all hypotheses of Theorem A.6.4 induces a stable axiom-stabilizer. When a PCE minimizer exists in the relevant response-equivalence class, the retained stabilizer may be represented by a least-cost member of that class. Live-diagonal non-closure alone neither constructs nor uniquely selects an axiom-stabilizer.

*Proof.* The first assertion is the contrapositive form of Theorem A.6.2 with the three permitted boundary treatments made explicit; a total Boolean alternative remains possible only by loss of standard soundness. The stabilizer conclusion is Theorem A.6.4, and the PCE statement is clause 5 of Definition A.6.3. The hypotheses of Theorem A.6.4 are independent additional premises, so the final qualification follows. ∎

**Theorem A.6.6 (Conservativity of the generative non-closure vocabulary).** Assume Definitions A.6.1–A.6.3 are explicit, nonrecursive definitions in the preceding PU language. Adding the vocabulary of generative non-closure, stable partial closure, and axiom-stabilizer is then a definitional and status-conservative extension of the preceding PU formal apparatus. It changes no theorem in the earlier language, branch condition, numerical backbone value, or certificate status unless a later theorem changes the underlying response domain, cost functional, PPI quotient, or branch certificate.


*Proof.* Let $L$ be the preceding PU language and $L^+$ its expansion by the symbols introduced in Definitions A.6.1–A.6.3. Define a translation $\tau$ from $L^+$-formulas to $L$-formulas by replacing every new atomic expression by its explicit definiens and then commuting $\tau$ with Boolean connectives and quantifiers. Because the definitions are explicit and nonrecursive, this process terminates and $\tau(\phi)=\phi$ for every $L$-formula $\phi$.

Consider an $L^+$-derivation and induct on its length. An old axiom translates to itself. A defining axiom translates to an identity between an $L$-formula and itself. If a line follows by modus ponens or generalization, its translation follows by the same inference rule from the translations of the preceding lines. Thus every $L^+$-theorem $\phi$ has an $L$-proof of $\tau(\phi)$. In particular, if $\phi$ belongs to $L$, then $\tau(\phi)=\phi$, so the expansion proves no new theorem in the earlier language.

Branch conditions, numerical values, and certificate statuses are expressions in the earlier ledger unless a later theorem explicitly changes their defining data. Their translations are therefore identical to themselves, establishing status conservativity under the stated qualification. ∎

**Cosmology typing guardrail.** Generative non-closure implies neither a vacuum instanton, positive cosmological constant, nor a low-entropy macrostate. Any bridge must independently fix a vacuum response map, reachability, exponent, prefactor interval, coarse-graining map, entropy residual, and forward lock before Appendix U is evaluated.

**Instance verification versus total generation.** A particular external response $r$ is finitely verifiable only when $V_A(r)$ is represented by an executable procedure with certified finite cost. Theorem A.6.2 separately excludes a total standard-sound same-cycle closure on a domain containing the targeted live diagonal sentence. Historical verification, fixed finite instances, and uniform same-cycle generation have different domains and quantifier order; no P-versus-NP or finite-instance hardness statement follows.

**Definition A.6.7 (Finite Stabilizer-Comparison Certificate).** For a declared finite exhaustive comparison class $\mathfrak S_{\mathrm{stab}}$, a stabilizer-comparison certificate records for every $S\in\mathfrak S_{\mathrm{stab}}$: its response envelope, stabilization verdict, response-equivalence class, PCE cost interval, and either a finite failure witness or a strict cost-separation witness. The unresolved set is required to be
$$

\mathcal R_{\mathrm{stab}}=\varnothing.
\tag{A.6.7.1}
$$

**Proposition A.6.8 (Finite-Class PCE-Minimal Stabilizer Uniqueness).** If the PU class stabilizes the declared response envelope and every competing class either fails stabilization or has cost lower bound strictly above the PU class's cost upper bound, then the PU class is the unique PCE-minimal stabilizing class inside $\mathfrak S_{\mathrm{stab}}$, up to response-equivalent representatives. The conclusion is relative to the declared exhaustive finite class and does not rule out unlisted mechanisms.

*Proof.* Let $[S]$ be a response-equivalence class in $\mathfrak S_{\mathrm{stab}}$ distinct from the PU class. The exhaustive certificate contains exactly one of the two relevant verdicts. If $[S]$ fails stabilization, it is not an admissible stabilizing competitor. Otherwise its certified cost lower bound $L_S$ and the PU cost upper bound $U_{PU}$ satisfy
$$
L_S>U_{PU}.
$$
Every representative of $[S]$ has cost at least $L_S$, while the certificate supplies a PU representative of cost at most $U_{PU}$. Hence every stabilizing class distinct from the PU class has strictly greater cost. The PU class is therefore the unique minimal stabilizing response-equivalence class in the declared finite comparison set. Because the certificate is exhaustive only for $\mathfrak S_{\mathrm{stab}}$, no conclusion follows for mechanisms outside that set. ∎