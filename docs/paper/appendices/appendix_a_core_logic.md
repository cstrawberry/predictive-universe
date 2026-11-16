# Appendix A: Core Logic, Computation Limits, and Property R

## A.0 Foundations of Computational Richness

### A.0.1 Overview: Two Complementary Foundations

Two routes provide the abilities needed for self-reference. One builds them in a logical model; the other asks when a protected physical network can carry them. Each route applies only when its stated construction and reliability conditions hold.

**Technical ledger.**

The **Self-Referential Paradox of Accurate Prediction (SPAP, Theorems A.1.1, A.1.3)** and **Reflexive Undecidability (RUD, Theorems A.2.3, A.2.4)** apply to predictive systems possessing the computational subcapacities collected under **Property R** (Definition 10). This appendix gives two conditional routes:

*   **Foundation I: Logical construction (§A.0.2)** — Composition closure, logical memory, uniform specification, arbitrarily large finite memory and composition depth, and a formal arithmetic representing bounded computations yield Property R for the resulting uniform predictive model class. Theorem A.0.1 supplies the uniform circuit/Turing-simulation route. Corollary 2a states the source-trace interface under which the companion pure-$\mathbf S$ construction realizes Proposition 2(ii)'s interpreter clause, while Appendix A.4 supplies bounded self-referential verifier presentations.
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
3.  **Evaluate Predicates:** Represent formulas within $\mathcal F$ concerning the behavior, output, or predictive accuracy of models in $\mathcal M$, including self-referential formulas, and evaluate decidable predicates of registered finite computations. Bounded proof search additionally requires a computable finite bound and decidable proof verification. Representability alone supplies no total decision procedure for unrestricted theoremhood or semantic truth.

**Summary of Definition 23 (MPU):** A Minimal Predictive Unit is the least costly system that completes the full cycle of prediction, checking, and update within the chosen class. Stronger claims about its memory and state capacity require the additional implementation conditions listed below.

**Technical ledger.**

An MPU is a qualifying full-loop implementation that attains $C_P=C_{op}$ on the declared nonempty implementation class. It has the dual Internal Prediction and 'Evolve'/ND-RID dynamics of Definitions 26–27. The inequalities $C_{op}\ge K_0=3$ and $d_0\ge8$ apply only when the MPU additionally satisfies Theorem 15's (O1)–(O3), (FC) SPAP-register conditions, represents the eight contexts as mutually perfectly distinguishable Hilbert alternatives, and obeys Corollary 3's complexity-capacity bridge.

**Recall of Definition A.2.2 (ND-RID):** Non-Deterministic Reflexive Interaction Dynamics govern the MPU 'Evolve' process, characterized by probabilistic outcomes $P(o|x,y)$ and state transitions $P(x'|x,y,o)$. On a registered cyclic-reset branch satisfying Definition 28, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$, with a positive uniform floor only when $H_q(P\mid R)\ge h_{\min}>0$. Independently, when the ND-RID update contains a nonzero input-independent refresh component, Lemma E.1 gives $f_{\text{RID}}<1$. Neither physical branch follows from the definition of ND-RID alone.

### A.0.2 Foundation I: Conditional Property R from Predictive Closure Structure

> **Methodological Note:** This section proves a sufficient formal construction: Property R follows for predictive model classes satisfying the declared composition, memory, uniformity, scalability, and arithmetic-coding hypotheses. Physical realization under resource constraints is addressed subsequently in §A.0.3-A.0.5.

For a predictive model class satisfying composition closure, logical memory, uniform specification, and arbitrarily large finite memory and composition depth, the finite computational subcapacity of Property R follows without choosing a physical implementation. The construction below is logically prior to the MPU realization but conditional on those explicit structural hypotheses.

<a id="proposition-a01-binary-necessity-for-retained-verification-decisions"></a>**Proposition A.0.1 (Binary Necessity for Retained Verification Decisions)**
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

<a id="proposition-a02-boolean-operations-under-acceptance-set-closure"></a>**Proposition A.0.2 (Boolean Operations under Acceptance-Set Closure)**
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

These hypotheses characterize the computationally rich predictive class used by Theorem A.0.1. They are sufficient for that theorem.

<a id="theorem-a01-functional-completeness-and-explicit-turing-simulation"></a>**Theorem A.0.1 (Functional Completeness and Explicit Turing Simulation)**

The set $\{\mathrm{NOT},\mathrm{AND},\mathrm{OR}\}$ is functionally complete. Given the Logical-Structural Assumptions of composition closure, logical memory, and uniform specification, the resulting predictive model class can simulate every finite-time computation of a Turing machine by an explicitly constructed Boolean circuit family. For the one-hot cell encoding and the explicitly chosen total extension in the proof, a machine with nonempty state set $Q$ and tape alphabet $\Gamma$ has a $T$-step simulation circuit using at most $6T(2T+1)|Q||\Gamma|$ NOT, AND and OR gates of fan-in at most two, with wires and fan-out uncharged and the initial configuration already cell-encoded. Here $T$ is a nonnegative integer; for $T=0$ the circuit is the identity. For $T\ge1$, its gate list is generated from the transition table and $T$ in time polynomial in $T$, $|Q|$ and $|\Gamma|$. Thus the theorem uses a direct simulation construction, not the Church-Turing thesis as a proof step.

*Proof.* For each integer $n\ge1$, every Boolean function
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
The constant functions zero and one are implemented by $x_1\wedge\neg x_1$ and $x_1\vee\neg x_1$, respectively, so the empty-disjunction case also has a circuit in the named basis. Thus every positive-arity Boolean function is implemented using only NOT, AND, and OR. A computation with no data input can be represented using one ignored dummy input; a literal zero-input circuit additionally requires a declared constant wire. The finite configuration map below has positive input length and needs no such nullary primitive.

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
for every encoded configuration reachable at a time $0\le t<T$ from the declared initial configuration, using the tape interval of radius $T$ about its initial head position. A reachable pre-$T$ transition stays inside the interval. The disjunctive normal form gives a finite circuit for any total extension, but the polynomial bound uses the following specific one-hot encoding and total extension. Index the interval by $i\in\{-T,\ldots,T\}$ and let $c_t$ consist of the indicator bits $s^t_a(i)$, equal to one exactly when cell $i$ holds $a\in\Gamma$, and $h^t_q(i)$, equal to one exactly when the head is at $i$ in state $q\in Q$, so that $L(T,M)=(2T+1)(|\Gamma|+|Q|)$. Write $\delta(q,a)=(\delta_Q(q,a),\delta_\Gamma(q,a),\delta_{\leftrightarrow}(q,a))$. One step is computed cellwise by
$$
\begin{aligned}
A^t_{q,a}(i)&=h^t_q(i)\wedge s^t_a(i),
\qquad
\nu^t(i)=\neg\textstyle\bigvee_{q\in Q}h^t_q(i),\\
s^{t+1}_b(i)&=\bigl(\nu^t(i)\wedge s^t_b(i)\bigr)\vee\textstyle\bigvee_{\delta_\Gamma(q,a)=b}A^t_{q,a}(i),\\
h^{t+1}_{q'}(i)&=\textstyle\bigvee_{\delta_Q(q,a)=q',\ \delta_{\leftrightarrow}(q,a)=+1}A^t_{q,a}(i-1)\ \vee\ \bigvee_{\delta_Q(q,a)=q',\ \delta_{\leftrightarrow}(q,a)=-1}A^t_{q,a}(i+1),
\end{aligned}
$$
where terms with an index outside $\{-T,\ldots,T\}$ are omitted and an empty disjunction is the constant $x\wedge\neg x$, formed once per step from one input wire $x$. These formulas define $F_{M,T}$ on every bit string, including invalid encodings; no zero-default or other independently prescribed extension is imposed. By induction on $t<T$, a reachable encoded configuration has exactly one symbol bit equal to one in every cell and exactly one head bit equal to one, at a cell $j$ with $|j|\le t$. Hence exactly one term $A^t_{q,a}(j)$ equals one. The displayed formulas rewrite cell $j$ to $\delta_\Gamma(q,a)$, keep every other symbol, and place the single head bit for state $\delta_Q(q,a)$ at $j+\delta_{\leftrightarrow}(q,a)$, which lies in the interval because $|j+\delta_{\leftrightarrow}(q,a)|\le t+1\le T$. An omitted term would require a head outside the interval at time $t$, so the omission changes no reachable value. Let $C_{M,T}$ be this one-layer circuit. For the exact gate accounting, put $N=2T+1$, $q=|Q|$ and $g=|\Gamma|$. Form the zero wire once per layer using two gates. There are exactly $Nqg$ conjunction gates for $A$, $Nq$ gates for the head disjunctions and their negations, $Ng$ retained-symbol conjunctions, and $Nqg$ symbol-output OR gates when each output is formed by folding its incoming $A$ terms into its retained-symbol term. If $k_{i,q'}$ is the number of non-omitted incoming terms for head output $(i,q')$, its disjunction uses $\max\{k_{i,q'}-1,0\}$ gates, with an empty disjunction wired to the shared zero. Thus the layer uses exactly
$$
2Nqg+Nq+Ng+\sum_{i,q'}\max\{k_{i,q'}-1,0\}+2
\le N(3qg+q+g)+2
\le5Nqg+2
\le6Nqg,
$$
where $\sum_{i,q'}k_{i,q'}\le Nqg$, $q+g\le2qg$, and the final inequality uses $T\ge1$ and $q,g\ge1$. Unrolling $T$ layers therefore gives at most $6T(2T+1)|Q||\Gamma|$ gates. At $T=0$ the circuit is the identity and uses no gates. A generator looping over the layer, cell, state and symbol indices writes the gate list in time polynomial in $T$, $|Q|$ and $|\Gamma|$.

Composition closure permits iteration of the same uniformly specified next-step circuit. Logical memory stores $c_t$ and the intermediate gate outputs. Uniform specification supplies the finite rule by which $C_{M,T}$ is generated from the transition table of $M$ and the time bound $T$. Therefore the predictive model class contains, for every $M$ and $T$, a finite circuit computing the first $T$ steps of $M$. Allowing the resource parameter $T$ to vary gives a uniform finite-time simulation family.

This proves the required computational richness directly: every bounded computation of every Turing machine is represented by a finite prediction-verification circuit in the model class, and the unbounded model family is obtained by increasing the retained memory and composition depth. ∎

<a id="corollary-a01-property-r-from-the-uniform-predictive-model-class"></a>**Corollary A.0.1 (Property R from the Uniform Predictive Model Class)**
Any uniform predictive model class satisfying the Logical-Structural Assumptions and allowing arbitrarily large finite memory and composition depth possesses Property R relative to any formal arithmetic $\mathcal F$ capable of coding finite bit strings, circuits, and bounded computations.

*Proof.* Choose a finite description alphabet of size $b\ge2$. A word $a_0\cdots a_{\ell-1}$ with digits $0\le a_i<b$ can be encoded injectively by
$$
\operatorname{code}(a_0\cdots a_{\ell-1})
=b^\ell+\sum_{i=0}^{\ell-1}a_i b^i.
$$
The leading power records the length, so decoding is effective. Iterating any primitive-recursive pairing map encodes finite tuples of words. Hence states, circuit descriptions, machine descriptions, predictions, and bounded execution histories have finite arithmetic codes, and the hypothesis on $\mathcal F$ makes these coding and decoding operations representable.

By Theorem A.0.1, for every Turing machine $M$ and bound $T$, the model class contains a uniformly specified Boolean circuit simulating the first $T$ steps of $M$. A bounded history has finitely many configurations; checking its initial configuration, each transition-table relation, and its final output is therefore a finite conjunction of Boolean conditions. Functional completeness and finite composition produce a circuit for that conjunction. Composing it with the simulation circuit evaluates bounded predicates about outputs, failures, and prediction accuracy.

For an unbounded partial computation, each finite search stage is represented by its time bound $T$ and the corresponding bounded circuit; no claim of terminating an undecidable infinite search is required. Thus all representation, bounded-simulation, and finite predicate-evaluation clauses of Definition 10 hold. ∎

**Arithmetic-envelope scope.** Corollary A.0.1 is representational: it assumes that $\mathcal F$ can code finite strings, circuits, and bounded computations, and it does not identify the functions whose totality $\mathcal F$ proves with physically affordable updates. Any later inference from proof-theoretic totality to PPI implementability requires a declared update and certificate-verification envelope together with a response-faithful realization bridge. Choosing a bounded arithmetic matched to a nominated feasible class is an additional branch convention; Foundation I selects no unique theory–envelope pair. Selecting among such pairs requires a nonempty comparison class, a complete commensurate cost, attainment, and the strictness claimed for the selection. A bounded object theory also does not replace the stronger arithmetic $\mathcal F$ used by Definition A.5.6a.1 unless it separately discharges that definition's primitive-recursive representation, finite-trace, and Gödel-coding requirements.

<a id="theorem-a01a-ablation-and-irredundant-core-of-the-property-r-circuit-route"></a>**Theorem A.0.1a (Ablation and Irredundant Core of the Property-R Circuit Route).** The hypotheses used by Theorem A.0.1 have the following exact roles.

1. Effective arithmetic coding and an unbounded family of finite description capacities are necessary for that theorem's uniform representation of arbitrarily long machine, input, and history records.
2. Scalable depth is necessary on every fixed finite-fan-in gate route: if the maximum fan-in is $k$ and all circuits have depth at most $d$, one output depends on at most $k^d$ input coordinates, so parity on more than $k^d$ inputs is excluded.
3. The named $\{\mathrm{NOT},\mathrm{AND},\mathrm{OR}\}$ basis is not necessary: the single NAND operation is functionally complete and gives the same circuit construction under composition.
4. Composition closure is necessary for this gate route: a class containing primitive NAND gates but forbidding every output-to-input composition computes only projections and one-gate NAND functions, so it cannot compute the three-input parity transition function.
5. Cross-cycle logical memory is not necessary for an abstract finite simulation: for each fixed $(M,T)$, unrolling the $T$ transition layers gives one acyclic combinational circuit. It is necessary only for the sequential implementation used in Theorem A.0.1 and for a physical executor that reuses bounded hardware across layers.
6. Uniform specification is not an independent hypothesis on this bounded machine-simulation route. Given effective coding and a fixed functionally complete finite basis closed under unrestricted finite composition, exhaustive synthesis derives a uniform compiler $(\ulcorner M\urcorner,T)\mapsto\ulcorner C_{M,T}\urcorner$.
7. Effective coding/decoding and a fixed functionally complete finite gate basis with unrestricted finite composition form an irredundant sufficient package for the uniform bounded-simulation route. Unrestricted finite composition is the single scalable condition: it permits arbitrarily large finite circuits and has no uniform depth bound. Working memory is an additional implementation requirement exactly when the circuit is executed sequentially rather than supplied as an unrolled acyclic object.

*Proof.* A class with at most $N$ distinguishable description states cannot inject the words of every length over an alphabet of size at least two. A coding map without an effective decoder fails the representation clause of Definition 10 because the represented machine, input, and history cannot be uniformly recovered inside $\mathcal F$. Moreover, if a finite basis has maximum fan-in $k$ and circuit size is bounded by $s$, an output can depend on at most $\max\{1,ks\}$ input coordinates; a zero-gate projection uses one coordinate, while a circuit with at least one gate has at most $ks$ gate-input occurrences. Parity on more than $\max\{1,ks\}$ inputs therefore cannot be represented. This proves item 1. At depth zero an output depends on one input, and a fan-in-$k$ gate applied to depth-$(d-1)$ outputs can depend on at most $k^d$ inputs. Induction therefore proves item 2 and gives the required bounded-depth counterfamily. NAND realizes $\neg x=x\mathbin{\mathrm{NAND}}x$ and
$$
x\wedge y=\neg(x\mathbin{\mathrm{NAND}}y),
$$
so it realizes the basis of Proposition A.0.2 and proves item 3. Without composition, a primitive two-input gate has no path of length two and hence cannot depend essentially on three inputs; three-input parity supplies the claimed explicit missing transition function and proves item 4. For item 5, take $T$ disjoint copies of the next-configuration circuit and wire the output of layer $t$ to the input of layer $t+1$; the resulting finite directed acyclic circuit has no state retained across execution cycles. A sequential evaluator of the same graph must retain the current configuration and intermediate gates, giving the stated boundary.

For item 6, compute from $(\ulcorner M\urcorner,T)$ the finite truth table of the bounded transition simulation, enumerate composed circuits over the declared basis by increasing size and lexicographic code, and compare their finite truth tables. Functional completeness guarantees a match, so the search halts and returns a uniform compiler. Conversely, effective coding/decoding, a universal finite gate basis, and unrestricted finite composition reproduce every step of Theorem A.0.1 and Corollary A.0.1. Removing coding destroys representation; replacing unrestricted composition by a uniform size or depth cap excludes the parity family by the $\max\{1,ks\}$ or $k^d$ bound, and removing composition altogether already excludes three-input parity; removing gate universality excludes at least one finite Boolean transition function. Each of the three package members is therefore indispensable, proving item 7 and the asserted irredundancy for this route. ∎

<a id="remark-a01b-selected-rewrite-route-to-the-interpreter-component"></a>**Remark A.0.1b (Selected-Rewrite Route to the Interpreter Component).** Corollaries 2a--2b realize Proposition 2(ii) using the fixed root-restarted controller and exact source-output interfaces of the Pure-S universality theorem. Corollary 2a uses an intermediate source-trace map; Corollary 2b constructs bounded trace answers through terminating output queries. The selected-computation and persistent-history constructions are developed below, with their separate observation and resource bounds. Coding, finite composition, Boolean closure, arithmetic representation, logical memory and diagonal closure supply the remaining Property-R capabilities on their declared model class. A physical predictive-cycle realization supplies the response, resource and reliability maps for those operations.

#### Conditional Pure-$\mathbf S$ Weak-Path Interpreter Realization

Corollary 2a combines Theorem 1R and the supporting Theorems 1--2 of Cinematic Strawberry (2026) with the model class's source-trace interface
$$
\mathcal O_{\mathbf S}
=
\left(
\operatorname{Enc}_{\mathrm{TM}},
\mathsf{Term}_{\mathbf S},
\to_{\mathbf S},
\sigma,
\operatorname{Dec}_{R}
\right),
\qquad
\mathcal B_{\mathrm{src}}=(a,d).
$$
The effective encoder maps a source machine and input through the Rogozhin--Cook 912-phase deletion-one cyclic-tag endpoint to a closed pure-$\mathbf S$ term. Here $\sigma$ is the fixed root-restarted finite controller of Theorem 1R: each invocation begins at the root in the same control state, uses one temporary arbitrary-depth cursor, and returns after one contextual contraction or a report of normality. Only the current term is carried between invocations. On the encoded trajectory its contractions agree with those of the supporting persistent scheduler. The total bare-term decoder returns the fixed Rogozhin-machine trajectory through its first halt, or indefinitely when nonhalting; after a first halt, it rejects every later selected contraction. Its inner cyclic-tag decoder accepts the initial encoding at horizon zero and validates the positive-horizon checkpoints. For every finite source bound, $a$ identifies a finite decoded Rogozhin prefix and $d$ reconstructs the corresponding finite source trace, or the complete source prefix through an earlier halt. The controller is fixed after specialization to the endpoint and remains independent of the source machine and input. Each invocation on $T$ terminates within $K_U(|T|+1)$ microticks. Its finite control and temporary cursor representation have separate storage costs. The pair $(\mathcal O_{\mathbf S},\mathcal B_{\mathrm{src}})$ supplies Proposition 2(ii); Proposition 2(i), (iii), and (iv), logical memory, uniform diagonal closure, and physical realization retain their separate hypotheses.

The source calculus also has exact syntactic ledgers. If $\ell(T)$ counts $\mathbf S$ leaves and $\nu_a(T)$ counts occurrences of an inert label or open variable $a$, one contraction with third argument $Z$ satisfies
$$
\ell(\text{contractum})-\ell(\text{redex})=\ell(Z)-1,
\qquad
\nu_a(\text{contractum})-\nu_a(\text{redex})=\nu_a(Z)\ge0.
$$
The leaf-count difference is nonnegative for ground pure-$\mathbf S$ $Z$, where $\ell(Z)\ge1$; the displayed equality remains the applicable open-term bookkeeping identity when inert labels are present.
At the root of a displayed contractum, the abstract-syntax-tree map
$$
(X,Y,Z)\longmapsto(XZ)(YZ)
$$
is injective. Direct counting proves the two displayed identities; parsing the contractum's root and its two application children recovers $X$ and $Y$ as the left children and $Z$ as their common right child, proving injectivity. The bound
$$
|G_w|\le18|w|+6{,}103{,}901
$$
measures the already compiled binary cyclic-tag word $w$. Outer stage $n$ launches $n$ independent bound-$n$ jobs from the same seed. Lean derives from the exact recurrence a finite program-and-dispatcher coefficient $C_{A,\mathcal D}$ with $\tau_w(n)\le C_{A,\mathcal D}(n+1)^3$. For a contraction whose duplicated third argument is $Z$, Lean proves the exact balance $|T'|+1=|T|+|Z|$, so the node-count change is $|Z|-1$ and can be zero for $Z=\mathbf S$. It also proves the strict upper bound $|T'|<2|T|$ and composes the bounds to obtain
$$
|T_{\tau_w(n)}|
\le 2^{C_{A,\mathcal D}(n+1)^3}|G_w|.
$$
Thus stage $n$ uses $O(n^2)$ contractions, the cumulative count is $O(n^3)$, and the term-size bound is $|G_w|2^{O(n^3)}$. The bare-term checkpoint decoder is a total structural algorithm on every finite occurrence tree. Lean proves that it equals the public literal readback and that each decoded snapshot satisfies the literal certificate. The current source's Theorems 1R and 3 give linear per-invocation controller bounds, quadratic measured checkpoint and detector bounds, and quartic complete source-output reading bounds. For a fixed cyclic-tag program $P$ with initial encoding $E_P(w)$ and $j$ selected contractions, the cumulative root-restarted invocation cost is at most $jK_P(2^j|E_P(w)|+1)$; the coefficient belongs to that controller. Shared-store representation, indexed access, allocation and physical elapsed time have the distinct ledgers developed in Section 7.4.4a.

A response-preserving realization map into Theorem 15's $(\mathrm{O1})$--$(\mathrm{O3})$, $(\mathrm{FC})$ class is required before the visited operational roles can enter the $K_0$ ledger. The one-symbol syntax alphabet, tree size, scheduler state, reduction count, and retained inactive syntax do not by themselves determine $K_0$, $C_P$, $\langle\hat C_v\rangle$, $C_{op}$, physical work, heat, or entropy. On Theorem 31's registered-reset branch,
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
\ge H_q(P\mid R).
$$
If $R$ includes the retained term and every unchanged side record needed to reconstruct Definition 28's registered binary record $P$ deterministically, then $H_q(P\mid R)=0$; $P$ may be a declared binary quotient of navigation, history, or controller data. A positive uniform floor inferred from this entropy bound requires an independent bound $H_q(P\mid R)\ge h_{\min}>0$; Landauer saturation at $k_BT\ln2$ requires $P$ to be conditionally uniform binary given the complete retained side record $R$ and requires zero excess dissipation.

#### Selected Computation and Persistent Certificate Enumeration

Theorem 1R of Cinematic Strawberry (2026) fixes the encoder, finite controller, literal readers and regular halting language before the source instance is supplied. Every invocation begins at the root of the current term and either reports normality or performs exactly one contextual $\mathbf S$-contraction. Its temporary control and cursor are reset between invocations. The persistent scheduler of Theorem 1 is the proof device whose contraction sequence the fresh-root controller reproduces. The complete source encoder is primitive recursive; literal source rows, terminal rows and returned bits have the source correspondences stated in Theorem 1R.

Appendix F.1 of the companion gives the autonomous-component obstruction. If $D$ is a fixed finite term admitting an infinite reduction and $x\mapsto A_x$ is computable, no fixed regular tree language $L$ can satisfy
$$
\forall x\;\forall\rho\in\operatorname{MaxRuns}(DA_x),\qquad
x\in\mathcal H\ \Longleftrightarrow\ \exists j\ge0\;[\rho_j\in L]
$$
for an undecidable source-halting set $\mathcal H$. Here a maximal path is infinite or ends in a normal form. A path may reduce only $D$, leaving the payload untouched. Along that path, eventual acceptance depends only on the payload's state in the finite observer and a fixed finite acceptance table, which would make $\mathcal H$ decidable. The literal outer-clock encoder $(C_0C_0)A_x$ has such an autonomous component, so the obstruction applies to its exact every-path halting requirement. The fixed controller of Theorem 1R supplies the selected path. The obstructing path can be unfair; the result makes no impossibility claim for all pure-$\mathbf S$ encodings or for every residual-fair policy.

Theorem 5 supplies a complementary construction on the unrestricted reduction graph. For an explicit source instance $I$ with at most two ordered transition occurrences per configuration, write
$$
E_I:=\operatorname{strongEncoder}(I),\qquad
\Pi_I(T):=\operatorname{strongProjection}(T),\qquad
\Lambda_I(T):=\operatorname{runWholeLabelledObserver}(T).\mathsf{value}.
$$
The source is fixed in the encoder's frozen header. $\Pi_I(T)$ is a finite prefix-closed ideal of valid occurrence histories whenever $E_I\to_{\mathbf S}^*T$.

The aggregate `protectedPersistentCertificateEnumeration` has eight fields: all-reduct permanence, decoded-range soundness, exact finite range, cofinal recovery, an embedded history tree, the observer boundary, source-transition agreement, and an address-complete adjacent-step path. In particular:
$$
E_I\to_{\mathbf S}^*T\to_{\mathbf S}^*U
\quad\Longrightarrow\quad
\Pi_I(T)\subseteq\Pi_I(U).
$$
Every finite valid history ideal has an exact reachable representative. From every finite reduct, every such ideal can be included in a further reduct while preserving the histories already present. Each valid history has a distinct checkpoint for its ancestor ideal; one-bit history extensions have nonempty simple target paths with disjoint interiors. The wrappers `allEdgeProtectedPathPersistence`, `protectedExactFiniteRange`, `protectedCofinalExtension` and `protectedDirectedSubdivision` expose these clauses separately.

The declaration `addressCompleteAdjacentStepPath` gives one native-step path that eventually opens every protected address. Along this path, `termAt_eventually_labelledProjection` exposes every valid history as a labelled record. More generally, `ProtectedTrieFairness.StructurallyFair` is the explicit opening-obligation condition under which every valid history is eventually projected and labelled. The complete-prefix macro sequence satisfies it, and `finite_fairness_obligations_extendible` extends any finite list of those obligations from every reduct. Thus permanence applies to every reduction, while complete exposure uses a registered fairness condition or the constructed path.

Across one target contraction, the new projected histories form an ancestor-ready finite batch: every proper prefix of a newly exposed history was already present or is a shorter member of the batch. The declarations `RankOrderedBatch` and `exists_rankOrderedBatch` make this order explicit. The state-merged configuration quotient, terminal-observation equivalences, and finite-branch source adapters retain their separate declarations; the occurrence history records which enabled slot was taken even when distinct histories end in the same source state.

The total current-term observer parses literal records and checks adjacent tableau rows against the frozen source transition relation. The pure-$\mathbf S$ opening dynamics is source-independent. Its contribution is persistent candidate generation; the observer supplies transition validity. The theorem `wholeObserver_resource_certificate` bounds the observer on an unfolded term of size $N$ by $512(N+1)^5$ structural ticks, $512(N+1)^2$ peak structural units and $10(N+1)^2$ materialized output cells.

The observer-boundary results explain the required access. A cone-wide sound and canonically complete observer decides each supplied canonical candidate by the source verifier, and a literal initial-source-step query reduces to that observation. Canonical completeness together with cone-wide literal provenance excludes every fixed-depth prefix observer: the accepted record can occur below the chosen depth. The frozen source can be recovered from every reduct, so encoded cones with different source instances are disjoint. These statements specify the source information and access consumed by the observer.

**Confluence and Accumulating History Records.** Theorem 4 of the Pure-S companion gives the representation principle needed for branching. Suppose a source state $i$ reaches $\ell$ and $r$ with no common source continuation. A total single-valued decoder $d$ from a confluent target cone cannot simultaneously decode its seed as $i$, realize every source descendant, and carry target reachability into source reachability. Completeness would give representatives of $\ell$ and $r$; confluence would join them at a target $W$; soundness would make $d(W)$ a common source continuation. This proves the obstruction.

Theorem 5 implements branching by retaining verified occurrence histories. For a fixed source $I$, let $\mathcal V_I$ be its set of valid finite histories and define
$$
\mathcal D_I
=\{J\subseteq\mathcal V_I:
       h\in J,\ g\preceq h\ \Longrightarrow\ g\in J\},
\qquad J\le J'\ \Longleftrightarrow\ J\subseteq J'.
$$
Here a history ideal is prefix-closed; it may contain incompatible branch histories. Its interpretation is a record of verified alternatives.

**Proposition (Finite Approximations and Compatible Accumulation).** Every directed family in $\mathcal D_I$ has its union as its least upper bound. Each finite history ideal is compact: if it is contained in the union of a directed family, it is already contained in one family member. Every $J\in\mathcal D_I$ is the directed union of its finite prefix-closed subsets. Thus the finite histories give an algebraic domain of accumulated records.

The Pure-S projection realizes every finite member exactly. If $T$ and $U$ are reducts of the same $E_I$, a common reduct $W$ exists and satisfies
$$
\Pi_I(T)\cup\Pi_I(U)\subseteq\Pi_I(W).
$$
Along a structurally fair native path $(T_j)$,
$$
\bigcup_{j\ge0}\Pi_I(T_j)=\mathcal V_I.
$$

*Proof.* Unions preserve prefix closure and are least upper bounds under inclusion. For a finite ideal, choose one family member containing each of its finitely many histories; directedness supplies a member containing all of them. Finite prefix closures of finite subsets of $J$ form a directed family with union $J$. Theorem 5 supplies exact finite representatives. Confluence joins $T$ and $U$, and all-reduct permanence includes both projections in the join's projection. Soundness gives the inclusion of every projected history in $\mathcal V_I$; the companion's structural-fairness liveness theorem gives the reverse inclusion in the path union. ∎

This construction supplies PU with a precise model of retained verification: finite current records accumulate compatible evidence about source alternatives, and a declared fair schedule eventually exposes every valid finite history. A branch probability is supplied by the policy and observation law of Section 7.4.4a. Predictive knowledge in Definition 2 additionally requires that an admissible procedure use the records to improve its registered task score; record inclusion by itself measures retained evidence.

Corollary 2a imports the selected execution and source-trace interface for Proposition 2(ii); Corollary 2b constructs a further finite-trace interpreter by compiling terminating output queries. The unrestricted construction supplies persistent verification records. Section 7.4.4a develops stochastic observation and shared-store costs for these records; Section 14.5.6 develops a typed categorical interpretation of contextual rewriting.

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

The two rows are independent. Transfer of the second row to an MPU's $C_P$ additionally requires Definition 23, Hilbert distinguishability, and Corollary 3's complexity-capacity bridge. Property R does not depend on the later MPU structures it helps analyze.
### A.0.3 Foundation II: Minimal Physical Capacity

Having established Property R on the stated uniform computationally rich model class, we now address how that conditional abstract structure may be represented in physical systems with finite resources.

<a id="proposition-a03-conditional-self-referential-carrier-capacity-of-an-mpu"></a>**Proposition A.0.3 (Conditional Self-Referential Carrier Capacity of an MPU)**
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

**Role in Physical Instantiation:** On the registered SPAP realization, full-context, Hilbert-distinguishability, and complexity-capacity branch of Proposition A.0.3, $K_0=3$ is the attained lower bound for the SPAP context encoding; Property R retains its independent logical and physical certificates.

### A.0.4 Emergence of Reliable Computation from POP/PCE Optimization

While $K_0$ supplies structural carrier capacity on its realization branch, reliable execution of the finite computations required for SPAP and RUD is a separate physical problem. The analysis below uses the refresh-branch premise that each relevant ND-RID implementation contains a nonzero input-independent refresh component, for which Lemma E.1 gives $f_{\mathrm{RID}}<1$, together with the protected-computation certificates stated below.

POP (Axiom 1) and PCE (Definition 15) nominate the comparison objective. Definition D.1 and Equation D.8 represent that objective by a stochastic gradient model only on a branch fixing a smooth state manifold $X$, metric defining $\operatorname{grad}_gV$, tangent mobility $\eta_x:T_xX\to T_xX$, coefficient domains and regularity, filtered $m$-dimensional Brownian motion, diffusion factor $\sigma_x:\mathbb R^m\to T_xX$ with $\sigma_x\sigma_x^*=2D_x$, boundary behavior, and either a Stratonovich convention or an Itô convention with the required connection/chart data, together with common unit/metering data. Any entropy-per-reset cost also requires a reset frequency, and physical power requires an energy conversion. Theorem A.0.5 below proves existence of the error-rate minimizer from its explicit converse-cost, coercivity, continuity, and boundedness hypotheses, and convergence of the stochastic dynamics carries the separate hypotheses of Appendix D. Effective prediction additionally requires the independent protected-computation certificates below; when those and the dynamical branch data are accepted, the declared potential compares operational cost $V_{\text{op}}$, propagation cost $V_{\text{prop}}$, and predictive benefit $V_{\text{benefit}}$.

<a id="definition-a01-effective-operational-property-r"></a>**Definition A.0.1 (Effective Operational Property R)**
Effective Operational Property R is the capability of an MPU network to execute the finite representation, simulation/reasoning, predicate-evaluation, logical-memory, Boolean-processing, and diagonal-wrapper tasks required by the declared SPAP or RUD protocol with its registered finite error bound. When this capability is physically realized through Theorem A.0.2, let $p_{\mathrm{err}}^*$ be a selected minimizer of
$$
V_{\mathrm{tot}}(p_{\mathrm{err}})
=
V_{\mathrm{rel}}(p_{\mathrm{err}})
+
V_{\mathrm{err}}(p_{\mathrm{err}}).
$$
The minimizer is unique only under Dominant Cost Convexity. Operational applicability at logical depth $T$ additionally requires the QEC/bootstrap, working-memory, and execution records to certify the error tolerance of that finite protocol.

<a id="proposition-a02c-golay-code-capacity-sufficient-threshold-certificate"></a>**Proposition A.0.2c (Golay Code-Capacity Sufficient Threshold Certificate).** Consider the binary Golay block $[M,k,d_{\mathrm{code}}]=[24,12,8]$ with hard-decision block decoding, which corrects every error pattern of weight at most $t=\lfloor(d_{\mathrm{code}}-1)/2\rfloor=3=K_0$, under independent identically distributed link errors of rate $p$ per block position. Then the logical block error probability obeys
$$
P_L(p)\le\binom{24}{4}p^4=10626\,p^4,
$$
and under level-wise concatenation with $p_{\ell+1}\le\binom{24}{4}p_\ell^{\,4}$ the rescaled error $\binom{24}{4}^{1/3}p_\ell$ is fourth-power contracting, so $p_\ell\to0$ doubly exponentially whenever
$$
p_0<p_{\mathrm{suf}}:=\binom{24}{4}^{-1/3}=0.045486=4.55\%.
$$
For the exact iid disjoint-concatenation model only, one may conservatively register $p_{\mathrm{th}}:=p_{\mathrm{suf}}$ to fill the numerical threshold-inequality slot of Definition A.0.1q whenever $0<p_{\mathrm{err},0}<p_{\mathrm{suf}}$. This does not discharge the rest of the QEC certificate. The equality $t=3=K_0$ is numerical and supplies no bridge between code correction and the horizon constant. The union-bound value is not the exact decoder threshold or a universal physical fault-tolerance threshold. Correlated or adversarial noise is outside this certificate and requires its own noise-model record, as stated in Definition A.0.1q.

*Proof.* Since the decoder corrects all patterns of weight at most $3$, a logical error requires at least $4$ position errors, hence the error set contains some $4$-element subset of the $24$ positions on which all entries are flipped. For any fixed $4$-subset that event has probability $p^4$ under the iid law, and the union bound over the $\binom{24}{4}$ subsets gives $P_L\le\binom{24}{4}p^4$. Writing $A=\binom{24}{4}$ and $q_\ell=A^{1/3}p_\ell$, the recursion $p_{\ell+1}\le Ap_\ell^4$ gives $q_{\ell+1}\le q_\ell^{\,4}$, so $q_\ell\le q_0^{\,4^\ell}$ and $q_0<1$, equivalently $p_0<A^{-1/3}$, forces $p_\ell\to0$ doubly exponentially. Evaluating $A=10626$ gives $A^{-1/3}=0.045486$. ∎

**Definition A.0.1q (QEC Compatibility Certificate $\mathfrak C_{\mathrm{QEC}}$).** A QEC compatibility certificate is a finite record with a structural-independence witness
$$
\mathfrak C_{\mathrm{QEC}}
=
(\mathcal N_{\mathrm{phys}},\;\mathcal C_{\mathrm{code}},\;\mathcal I_{\mathrm{FT}},\;p_{\mathrm{err},0},\;p_{\mathrm{th}},\;\Delta V_{\mathrm{QEC}},\;\text{locality window},\;\text{structural independence})
$$
where $\mathcal N_{\mathrm{phys}}$ is the retained physical noise model on the MPU links in the protected window, $\mathcal C_{\mathrm{code}}$ is an implementable finite code family, $\mathcal I_{\mathrm{FT}}$ is the fault-tolerant instrument/overhead ledger for the required gates and syndrome processing, and
$$
0<p_{\mathrm{err},0}<p_{\mathrm{th}}
$$
is certified for that noise model and code family. The PCE-selection entry $\Delta V_{\mathrm{QEC}}<0$ records that the predictive-performance gain from correction dominates the coding, syndrome, and recovery overhead on the protected computation window. The Appendix Z/Golay structure may serve as a code witness only when the finite syndrome maps, recovery maps, and threshold comparison are included in $\mathfrak C_{\mathrm{QEC}}$. Finite ND-RID range supports the locality entry on strict finite-range branches, but arbitrary correlated or adversarial noise is not covered without its own noise-model record.

**Definition A.0.1q.1 (Golay-QEC Bootstrap Record $\mathfrak C_{\mathrm{GQEC}}$).** A Golay-QEC bootstrap record is a finite record with a structural-independence witness
$$
\mathfrak C_{\mathrm{GQEC}}
=
(\mathfrak G_{24},\mathfrak P_{23},\mathcal N_{\mathrm{loc}},\mathcal S_{\mathrm{syn}},\mathcal R_{\mathrm{rec}},\mathcal I_{\mathrm{FT}},p_{\mathrm{err},0},p_{\mathrm{th}},\Delta V_{\mathrm{GQEC}},\mathfrak O_{\mathrm{GQEC}},\text{structural independence})
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
Once the downstream Golay branch and the finite physical recovery/threshold records are accepted, the former QEC assumption is discharged for those windows by an internally generated code witness plus the recorded physical implementation data.

*Proof.* Proposition Z.13b.7 supplies a dual-containing Golay CSS code witness. The local-noise, syndrome, recovery, gate, overhead, threshold, and PCE-benefit entries of $\mathfrak C_{\mathrm{GQEC}}$ are exactly the entries required by Definition A.0.1q. Mapping them into the slots of $\mathfrak C_{\mathrm{QEC}}$ gives the certificate. The fixed-point display records dependency order: the Golay witness is derived downstream of the finite MPU/Golay branch, while the reliability claim is promoted only after the physical recovery and threshold records are added. ∎

**Corollary A.0.2b (Transversal-Gate Guardrail).** On any realization used by $\mathfrak C_{\mathrm{GQEC}}$ whose finite-dimensional code encodes a logical space of dimension greater than one and detects every error acting on any single physical subsystem, unitary encoded gates transversal with respect to one specified partition do not constitute a universal logical gate set by themselves. A universal protected-computation ledger must include a non-transversal, injected, distilled, adaptive, or otherwise certified completion inside $\mathcal I_{\mathrm{FT}}$. The corresponding overhead is compatible with the strict optimizer floor $p_{\mathrm{err}}^*>0$ of Theorem A.0.5.

*Proof.* The Eastin–Knill theorem and its transversal corollary (Eastin and Knill 2009, Theorem 1 and Corollary 1) apply on the stated arbitrary-single-subsystem-error-detection branch, with finite physical factors, a nontrivial logical space, unitary encoded gates and a specified transversal partition. They exclude universality of that transversal logical-gate family. Correction of merely a restricted nontrivial local-error set does not supply these hypotheses. Therefore a ledger claiming universal protected computation on this branch must record a gate resource outside that family. Theorem A.0.5 places every admitted optimizer in $(0,p_{\mathrm{err},0}]$, so $p_{\mathrm{err}}^*>0$; recording a positive implementation overhead does not contradict that conclusion. ∎

<a id="proposition-a02d-exact-golay-code-capacity-recovery-failure-polynomials-and-concatenation-thresholds"></a>**Proposition A.0.2d (Exact Golay Code-Capacity Recovery, Failure Polynomials and Concatenation Thresholds).** Let $\mathcal G_{24}$ be the extended Golay code with the generator matrix $G=[I_{12}\mid P]$ of Theorem Z.13c, fix a retained puncture point $j$, and let $C_{23}:=P_j(\mathcal G_{24})$ and $C_{23}^\perp=S_j(\mathcal G_{24})$ be the codes of Proposition Z.13b.7. Errors are independent bit flips of rate $p$ on classical positions, or independent $X$ and $Z$ flips of rate $q$ on qubits with ideal syndrome measurement.

1. **Classical block and optimal decoding.** The $4096$ cosets of $\mathcal G_{24}$ have minimum-weight leaders of weights $0,1,2,3,4$ with multiplicities $(\alpha_0,\ldots,\alpha_4)=(1,24,276,2024,1771)$. For $0\le p\le1/2$ the coset-leader decoder has block error
$$
f_{24}(p)=1-\sum_{w=0}^{4}\alpha_wp^w(1-p)^{24-w}
\tag{A.0.2d.1}
$$
for every transmitted word, and no decoder has smaller message-averaged block error. Moreover $f_{24}(p)=8855p^4+O(p^5)$, $f_{24}(p)<8855p^4$ on $(0,1/2]$, and $f_{24}$ is strictly increasing on $[0,1]$.
2. **Exact concatenation thresholds.** The equation $f_{24}(p)=p$ has exactly one solution $p^*_{24}\in(0,1/2)$, and $0.06847305<p^*_{24}<0.06847306$. For the disjoint-concatenation recursion $p_{\ell+1}=f_{24}(p_\ell)$ of Proposition A.0.2c, $p_\ell\to0$ exactly when $p_0<p^*_{24}$, eventually doubly exponentially, while $p_0\ge p^*_{24}$ gives $p_\ell\ge p^*_{24}$ for every $\ell$. Bounded-distance decoding, which declares failure on every pattern of weight at least $4$, has block error $f_{\mathrm{bd}}(p)=\Pr(\operatorname{Bin}(24,p)\ge4)$, and the same statements hold with $10626$ in place of $8855$ and threshold $0.06406708<p^*_{\mathrm{bd}}<0.06406709$. Both thresholds exceed $p_{\mathrm{suf}}=0.045486$.
3. **Quantum witness.** Measuring $X$- and $Z$-type generators built from a basis of $C_{23}^\perp$ extracts two $11$-bit syndromes. Since $C_{23}$ is perfect, each syndrome $s$ has a unique leader $l_s$ of weight at most $3$, with $1,23,253,1771$ leaders of weights $0,1,2,3$, and the recovery $X(l_s)$, respectively $Z(l_s)$, corrects every $X$-error and every $Z$-error of weight at most $3$. The logical $X$ failure probability is
$$
f_{23}(q)=\sum_{i\in\{7,11,15,23\}}A_i\sum_{w=0}^{3}\sum_{m=0}^{w}\binom im\binom{23-i}{w-m}q^{i+w-2m}(1-q)^{23-i-w+2m},
\tag{A.0.2d.2}
$$
with $(A_7,A_{11},A_{15},A_{23})=(253,1288,506,1)$, and the logical $Z$ failure probability is the same polynomial. Moreover $f_{23}(q)=8855q^4+O(q^5)$, $f_{23}(q)<8855q^4$ on $(0,1/2]$, $f_{23}$ is strictly increasing on $[0,1/2]$ with $f_{23}(1/2)=1/2$, and $f_{23}(q)=q$ has exactly one solution $q^*_{23}\in(0,1/2)$, with $0.07747579<q^*_{23}<0.07747580$. For $0<q\le1/2$, the total failure probability $1-(1-f_{23}(q))^2$ lies below the unencoded value $1-(1-q)^2$ exactly when $q<q^*_{23}$, and the concatenated recursion $q_{\ell+1}=f_{23}(q_\ell)$ on $[0,1/2]$ has threshold $q^*_{23}$ in the sense of item 2.
4. **Transversal Clifford set.** Every even-weight word of $C_{23}$ has weight divisible by $4$, and every odd-weight word has weight congruent to $3$ modulo $4$. Consequently $H^{\otimes23}$, $S^{\otimes23}$ and blockwise $\mathrm{CNOT}$ preserve the stabilizer group and implement logical $H$, $S^\dagger$ and $\mathrm{CNOT}$, so the Clifford group is transversal on the witness. By Corollary A.0.2b, a universal protected ledger adds a non-Clifford logical resource outside this family.

*Proof.* For item 1, minimum distance $8$ places the $1+24+276+2024=2325$ vectors of weight at most $3$ in distinct cosets, so each is the unique leader of its coset. With the parity-check matrix $H_{24}=[P^{T}\mid I_{12}]$, which satisfies $H_{24}G^{T}=P^{T}+P^{T}=0$, the syndromes of the $10626$ weight-$4$ vectors reach the remaining $4096-2325=1771$ syndromes. Hence the covering radius is $4$ and the multiplicities are as stated. The coset of the error does not depend on the transmitted word, and the coset-leader decoder succeeds exactly when the error is the chosen leader, which gives (A.0.2d.1) for every transmitted word. For uniformly distributed messages and any decoder $D$,
$$
\Pr(\text{correct})
=\frac1{|\mathcal G_{24}|}\sum_r\Pr\bigl(r\mid D(r)\bigr)
\le\frac1{|\mathcal G_{24}|}\sum_r\max_{c\in\mathcal G_{24}}p^{d(r,c)}(1-p)^{24-d(r,c)}
=\sum_{\text{cosets}}p^{w_L}(1-p)^{24-w_L},
$$
because $p\le1/2$ makes $p^w(1-p)^{24-w}$ nonincreasing in $w$, and each coset consists of $|\mathcal G_{24}|$ received words at distance $w_L$, its leader weight, from the code. The right side is $1-f_{24}(p)$. Exactly $\binom{24}4-1771=8855$ weight-$4$ patterns are not leaders, which gives the leading coefficient. The remaining assertions concern the displayed integer polynomial: Sturm counts show that $8855-f_{24}(p)/p^4$, which vanishes at $0$ and is positive at $1/2$, has no root in $(0,1/2]$, that $f'_{24}$ has no root in $(0,1)$, and that $(f_{24}(p)-p)/p$ has exactly one root in $(0,1/2)$; exact rational evaluation gives $f_{24}(p)<p$ at $p=0.06847305$ and $f_{24}(p)>p$ at $p=0.06847306$.

For item 2, if $p_0<p^*_{24}$, then $f_{24}(p)<p$ on $(0,p^*_{24})$, so $p_\ell$ decreases to a fixed point in $[0,p_0]$, which is $0$; the bound $f_{24}(p)<8855p^4$ gives $r_{\ell+1}\le r_\ell^4$ for $r_\ell:=8855^{1/3}p_\ell$, which is doubly exponential once $r_\ell<1$. If $p_0\ge p^*_{24}$, monotonicity gives $p_{\ell+1}=f_{24}(p_\ell)\ge f_{24}(p^*_{24})=p^*_{24}$ by induction. The bounded-distance polynomial satisfies the corresponding Sturm and rational-evaluation facts, and $0.06406708>0.045486$.

For item 3, Proposition Z.13b.7 gives $C_{23}^\perp\subset C_{23}$, so the $X$- and $Z$-type generators commute and their joint eigenspaces are labeled by the two syndromes. An error $X(e)$ has syndrome $H_{23}e$, where the rows of $H_{23}$ span $C_{23}^\perp$. Minimum distance $7$ places the $1+23+253+1771=2048$ vectors of weight at most $3$ in distinct cosets, and $2048=2^{11}$ is the number of syndromes, so every syndrome has a unique leader of weight at most $3$. After recovery the residual $X(e+l_s)$ has $e+l_s\in C_{23}$. The subcode $C_{23}^\perp$ has dimension $11$ and only even weights, while $C_{23}$ contains the odd word $\mathbf 1$; hence $C_{23}^\perp$ is the even-weight subcode, the residual is a stabilizer when $e+l_s$ has even weight, and it is the logical $X$ class otherwise. Writing $e=c+l$ uniquely with $c\in C_{23}$ and $\operatorname{wt}(l)\le3$ gives $e+l_s=c$, so failure occurs exactly when $\operatorname{wt}(c)$ is odd. For $c$ of weight $i$ and $l$ of weight $w$ meeting $\operatorname{supp}c$ in $m$ positions, $\operatorname{wt}(e)=i+w-2m$, and there are $\binom im\binom{23-i}{w-m}$ such $l$; summing over the odd-weight codewords, whose multiplicities are $(A_7,A_{11},A_{15},A_{23})$, gives (A.0.2d.2). The $Z$ sector is identical because both CSS components use $C_{23}$. Every weight-$4$ error lies at distance $3$ from a unique weight-$7$ codeword, so the leading coefficient is $253\binom74=\binom{23}4=8855$. At $q=1/2$ all $2^{23}$ patterns are equally likely and $2^{11}\cdot2^{11}$ of them fail, so $f_{23}(1/2)=1/2$. The remaining polynomial assertions follow from Sturm counts on $(0,1/2)$ and exact rational evaluation. The $X$ and $Z$ components are independent, which gives the total failure probability, and $x\mapsto1-(1-x)^2$ is increasing, so the comparison holds exactly when $f_{23}(q)<q$. Since $f_{23}$ is increasing and maps $[0,1/2]$ into itself, the argument of item 2 applies to the recursion.

For item 4, the weights of $C_{23}$ are $0,7,8,11,12,15,16,23$ with multiplicities $1,253,506,1288,1288,506,253,1$, which gives the congruences. Conjugation by $H^{\otimes23}$ exchanges $X(c)$ and $Z(c)$; it therefore preserves the generator set built from $C_{23}^\perp$ and exchanges $\bar X=X(\mathbf 1)$ and $\bar Z=Z(\mathbf 1)$, where $\mathbf 1\in C_{23}\setminus C_{23}^\perp$. Conjugation by $S^{\otimes23}$ fixes every $Z(c)$ and maps $X(c)$ to $i^{\operatorname{wt}(c)}X(c)Z(c)$. For $c\in C_{23}^\perp$ the image is the stabilizer $X(c)Z(c)$ because $\operatorname{wt}(c)\equiv0\pmod4$; for $\bar X$ it is $i^{23}\bar X\bar Z=-i\bar X\bar Z$, the image of $X$ under conjugation by $S^\dagger$. Blockwise CNOT maps $X(c)\otimes\mathbb 1$ to $X(c)\otimes X(c)$ and $\mathbb 1\otimes Z(c)$ to $Z(c)\otimes Z(c)$, preserving the product stabilizer group, and acts as logical CNOT on $(\bar X,\bar Z)$. The gates $H$, $S^\dagger$ and CNOT generate the Clifford group up to phases. ∎

<a id="proposition-a02e-verified-cat-golay-extraction-with-a-finite-fault-and-clock-ledger"></a>**Proposition A.0.2e (Verified-Cat Golay Extraction with a Finite Fault and Clock Ledger).** Fix the first coordinate of the systematic representative in Theorem Z.13c as a comparison puncture. The last eleven generator rows have zero in that coordinate; deleting it gives an $11\times23$ matrix $H$ whose rows have weight eight and span $C_{23}^{\perp}$. Use the twenty-two stabilizers $X(H_j),Z(H_j)$, in that order, and the two minimum-weight syndrome tables of Proposition A.0.2d. An elementary quantum location is a preparation/reset to $|0\rangle$, a one-qubit Clifford, CNOT, controlled-$Z$, an $X$- or $Z$-measurement, or a one-qubit idle. Each takes one clock tick $\tau>0$. Parallel disjoint operations are permitted. A faulty location applies an arbitrary Pauli on its participating quantum outputs; a preparation may have a Pauli after preparation and a measurement may have a Pauli before measurement or a flipped recorded bit. Choices may be correlated. The finite random fault support $F$ obeys
$$
\Pr(S\subseteq F)\le p^{|S|},\qquad 0\le p\le1,
$$
for every set of potential location labels $S$, including adaptively enabled labels. Classical Boolean operations and their stored bits are exact on this comparison branch; their elapsed time, storage and reset operations are charged below.

For each weight-eight stabilizer $P_1\cdots P_8$, where the nonidentity factors $P_i$ are all $X$ or all $Z$, use this circuit.

1. Prepare eight cat qubits in $|0\rangle$, apply $H$ to the first, and apply CNOT from the first to each other cat qubit. For each $j=2,\ldots,8$, measure $Z_1Z_j$ with a fresh verifier $|0\rangle$, two CNOTs from cat qubits $1,j$ to the verifier, and verifier $Z$-measurement. Perform four complete sweeps of these seven checks. Accept the cat exactly when all twenty-eight recorded checks are $+1$. Otherwise reset it and try again, with a cap of four attempts. An exhausted cap returns a retained abort flag.
2. Couple each accepted cat qubit once to its respective data qubit by controlled-$P_i$, in parallel. Measure every cat qubit in the $X$ basis and report the product of the eight signs. Reset the cat and verifier qubits. All waiting data and ancilla qubits have charged idle locations.
3. A full round measures all twenty-two stabilizers. Retain successive full syndrome strings. Stop upon four consecutive equal strings, or return abort after sixteen rounds. On stopping, use the two syndrome tables to update an exact classical Pauli frame. For a physical terminal logical $Z$ readout, measure all twenty-three data qubits in $Z$, apply the frame's $X$ mask to the bits, decode the resulting word to $C_{23}$ and return its parity. Logical $X$ readout uses $X$ measurements and the frame's $Z$ mask. Reset the quantum hardware after terminal readout.

The following bounds hold.

(a) If the input is an encoded state, possibly entangled with an untouched reference, with a Pauli error on at most $r$ positions, then every fault path with $r+s\le3$, where $s=|F|$, avoids abort. Its quantum output, after the declared Pauli frame, differs from the input encoded state by a Pauli supported on at most $s$ positions. An ideal decoding channel therefore gives the exact input logical state on every such path. The physical terminal readout has its ideal logical distribution whenever input errors plus quantum faults, including readout faults, total at most three.

(b) There is a fixed finite implementation with at most
$$
K_q=16\cdot22\cdot(4(17\cdot8-15)+3)+2=171426
$$
quantum-operation layers, at most $C=2^{30}$ serial exact Boolean-operation ticks, at most forty simultaneously reserved qubits, and therefore at most
$$
N=40(K_q+C)=42956530000
$$
potential quantum locations. Its duration is at most $(K_q+C)\tau$. The syndrome lookup ROM uses $2\cdot2048\cdot23=94208$ bits; $4096$ writable classical bits suffice, including frame, counters and readout. The recorded worst-case ledger includes $352\cdot4\cdot(8+28)=50688$ ancilla preparation/reset locations inside the factories, at most $352\cdot9$ final ancilla resets, twenty-three terminal data resets and every idle during quantum and classical processing. Every measured bit and every writable working bit is subsequently reset or kept as a declared output; classical reset gates are included in $C$. These are operation, bit and clock counts; physical energy prices are additional source data.

For an error-free encoded input, let bad mean either abort or a logical error after decoding, or an incorrect terminal readout in the coupling to its ideal distribution. Then
$$
\Pr(\mathrm{bad})\le\delta(p):=\min\left\{1,\binom N4p^4\right\}.
$$
Every malignant fault set contains a four-element subset, so the displayed $\binom N4$ is a complete upper count of malignant-set witnesses. In particular, $\delta(p)<p$ for $0<p<\binom N4^{-1/3}$. This is a bounded extraction/readout comparison; the input preparation and a universal gate circuit have separate fault locations. On an acceptance event of probability at least $1-\delta(p)>0$, the conditional logical-error probability is at most $\delta(p)/(1-\delta(p))$. The proof uses the original, unconditioned local-stochastic law.

(c) Syndrome verification alone leaves a first-order fault in a raw non-Clifford injection resource. Let an exact encoding isometry send one input qubit to the Golay code with its input $Z$ mapped to $\overline Z$. Prepare the raw state $|A\rangle=(|0\rangle+e^{i\pi/4}|1\rangle)/\sqrt2$, encode it, and accept according to any sequence of ideal code-stabilizer measurements with no logical-state test. A $Z$ fault of probability $p$ before encoding passes exactly the same stabilizer tests as the ideal resource. Logical CNOT from data to this resource, logical $Z$ measurement of the resource and a logical $S$ correction on outcome one implement the channel
$$
\rho\longmapsto(1-p)T\rho T^*+p\,ZT\rho T^*Z,
\qquad T=\operatorname{diag}(1,e^{i\pi/4}),\quad Z=\operatorname{diag}(1,-1),
$$
on the decoded data. Its distance from the ideal $T$ channel, with channel distance defined as half the diamond norm, is exactly $p$.

*Proof.* The systematic first coordinate is the first row's identity coordinate. The other eleven rows are independent, have weight eight, and constitute the shortened code by dimension; Proposition Z.13b.7 identifies its dual and distance. Thus all syndrome and readout tables used above are the retained Golay tables.

A fault-free cat is $(|0^8\rangle+|1^8\rangle)/\sqrt2$. All of its preparation and verification gates are Clifford. On each Pauli fault path the surviving cat is a Pauli transform of this state, with its bit-error vector defined modulo the all-one vector. A fault-free full verification sweep reports the true seven relative bits. An accepted cat with at most three faults has a fault-free sweep among the four sweeps; every check in that sweep was recorded $+1$, so at its end the bit-error vector is uniform. Subsequent verification faults can change at most one cat bit each. In a parity check, a verifier-target $X$ never propagates to a control, while a verifier $Z$ propagates only cat phase errors. A faulty two-qubit check gate can itself change the bit of its one cat participant. Preparation fanout occurs before the clean sweep. Idle faults after that sweep change one cat bit. Cat phase faults can change the reported stabilizer sign but do not spread to the data through controlled-$P$.

Each nonuniform cat bit therefore creates an error on at most one data position. The uniform cat bit vector applies the measured stabilizer to the data. On a Pauli transform of an encoded input this contributes a scalar sign. Faults at the one-to-one data couplings affect at most their one data position, and each data idle fault also affects one position. Consequently an accepted extraction with $f$ faults adds, modulo a stabilizer and phase, errors on at most $f$ positions. This statement charges the faults in rejected attempts too: their cats never touch the data, while their data idles remain counted. A fault-free attempt is accepted, so exhausting four attempts requires four distinct faulty attempts and at least four faults.

A round containing no quantum faults produces the actual complete syndrome and changes no data error. With at most three faults, at most three full rounds are faulty. A string of sixteen rounds without four consecutive fault-free rounds would have at most three faulty separators and four fault-free runs of lengths at most three, hence length at most $3+4\cdot3=15$. Thus the protocol stops. Among four equal consecutive reports there is a fault-free round. At that round, the input error together with all earlier errors has support at most $r+s\le3$. Both minimum-weight Golay recoveries therefore remove it without a logical action. Moving this correction to the final classical frame changes later Paulis only by phases. The remaining data errors are supported on at most the number of subsequent faulty locations, which is at most $s$. This proves the quantum statement for every encoded vector, and tensoring the argument with the identity proves it for a reference system.

For terminal $Z$ readout, ideal basis samples lie in $C_{23}$, and their codeword parity is the logical $Z$ result, since the even subcode is $C_{23}^{\perp}$. After frame processing, late data $X$ components and faulty physical measurements alter at most one sample position per remaining fault. Up to three alterations are decoded exactly. The $X$ argument exchanges the CSS sectors. This gives an explicit coupling to the ideal measurement distribution, rather than requiring a noiseless quantum decoder in the physical readout circuit.

For the quantum layer count, one cat attempt uses one parallel preparation layer, one Hadamard layer, seven fanout layers, and four sweeps of seven four-layer checks: $17\cdot8-15=121$ layers. Four attempts, data coupling, cat measurement and final ancilla reset take at most $487$ layers. There are at most $16\cdot22=352$ extractions, followed by terminal data measurement and reset. Forty qubits bound the twenty-three data, eight cats and one verifier with room to spare. Layer counts exclude exact classical processing, during which every reserved quantum position receives an idle location. Counters for round, generator, attempt, sweep, check and data position each require at most five bits. A controller step consists of updating these counters, comparing fixed limits, updating acceptance/parity bits and copying or comparing a twenty-two-bit syndrome; ripple carry, bitwise comparison and multiplexing use fewer than $1024$ two-input Boolean gates per quantum layer. A lookup compares each eleven-bit syndrome with $2048$ constants, masks twenty-three output bits and combines them; fewer than $2^{20}$ gates suffice for both tables and terminal decoding. Resetting the $4096$ writable bits uses $4096$ further gates. Thus $1024K_q+2^{20}+4096<2^{30}$ bounds classical ticks, including resets, and the quoted storage bounds contain every register. The same bound applies to all abort branches. Potential locations are labeled by elapsed tick and reserved hardware position, with two-qubit gates counted once; at most forty occur at each tick. Unused potential labels are harmless overcounting. Multiplication gives the displayed $N$.

Every bad event has at least four actual faults by (a). It is contained in the union of events $S\subseteq F$ over the $\binom N4$ potential four-subsets. The union bound and the stated local-stochastic law prove (b), without conditioning on factory success. Since abort is bad, acceptance has probability at least $1-\delta(p)$; dividing the unconditional joint error-and-acceptance bound by this lower bound proves the conditional estimate. No independence of accepted cats is used.

For (c), write $\omega=e^{i\pi/4}$. With an ideal resource, the two unnormalized data maps before feed-forward are $T/\sqrt2$ and $\omega T^*/\sqrt2$; multiplication of the latter by $S=T^2$ gives $\omega T/\sqrt2$. A resource $Z$ changes the first map to $ZT/\sqrt2$ and the second to its negative after the same correction, so it gives $ZT$ in both branches. Encoding sends this error to a logical $Z$, which commutes with every stabilizer. All stabilizer outcomes and their acceptance probabilities are consequently unchanged. The stated one-location fault law satisfies the local-stochastic bound, and direct averaging gives the channel. Convexity gives channel distance at most $p$; the input $|+\rangle$ gives the orthogonal output states $T|+\rangle$ and $ZT|+\rangle$, attaining $p$. ∎

<a id="proposition-a02f-two-level-non-clifford-factory-on-the-golay-circuit-branch"></a>**Proposition A.0.2f (Two-Level Non-Clifford Factory on the Golay Circuit Branch).** Extend the finite Pauli local-stochastic circuit branch of Proposition A.0.2e by a one-qubit preparation of $|A\rangle=T|+\rangle$, with $T=\operatorname{diag}(1,e^{i\pi/4})$. The preparation is a noisy location under the same law; no encoded magic-state preparation is assumed. Classical control is exact, with every operation, stored bit and reset charged. Keep one fixed coordinate labeling of every Golay block. There is a bounded factory, specified below, with the following property: every complete fault path containing at most three faulty locations returns, without abort, an encoded $|A\rangle$ up to a correctable physical error. Its decoded output is exactly $|A\rangle$. This includes faults in raw preparation, encoding, Clifford gates, syndrome extraction, measurements and every idle, with arbitrary correlations satisfying the unconditioned local-stochastic law. It requires no independence or conditional noise law for accepted states.

Here and in the construction, the extraction instrument means the entire verified-cat, four-equal-syndrome instrument of Proposition A.0.2e, including all capped cat retries. Each protected computational macro, including its entire routed transversal gate but excluding extraction-internal correction layers, ends with extraction of all live blocks. Every extraction realizes its Pauli correction physically, in at most two transversal Pauli layers, before the next interblock gate or resource use; those layers, their spectator idles, faults and controller ticks are included. Thus no untracked data-frame propagation convention is used. Logical $H,S,S^{-1},X,Z$ and CNOT use the transversal Golay realizations of Proposition A.0.2d. Measurement of a logical $X$ or $Z$ uses its physical decoded readout.

The following initialization and encoder rules make the construction total.

1. To prepare $|0_L\rangle$, reset all 23 positions to zero, run one complete stabilizer round without a stopping decision, then run the extraction instrument. To prepare $|+_L\rangle$, follow this preparation by transversal $H$ and extraction. The first round allows the initially random $X$-stabilizer signs to be projected. All resets, that first round and subsequent measurements are noisy locations.
2. For a raw resource, form a binary invertible $23\times23$ matrix whose first column is $\mathbf1$, whose next eleven columns are the shortened Golay generator rows, and whose remaining columns are the lexicographically first standard basis vectors that extend these columns to a basis. Prepare $|A\rangle$ on the first input, $|+\rangle$ on the next eleven, and $|0\rangle$ on the remainder; implement that binary linear map with CNOTs, and run extraction. A binary matrix is implemented by Gaussian elimination with the first available pivot; reverse the row operations reducing the matrix to identity. A row swap is three CNOTs. The encoder has at most $23(22+3)=575$ CNOTs. This is an unverified encoder, confined to its single raw block; any fault inside its preparation or encoding declares that raw resource defective for the proof, regardless of the resulting logical error.
3. Inject $T$ on a data block using CNOT from data to resource, decoded logical $Z$ measurement of the resource, and logical $S$ on the data if that measurement is one. Finish by extraction. Destructive measurement resets the resource hardware.

For a distillation node, label its fifteen coordinates by the nonzero vectors $x\in\mathbb F_2^4$ in binary integer order. Set $g_0(x)=1$ and $g_i(x)=x_i$ for $1\le i\le4$. Form an invertible binary matrix $M$ whose first five columns are $g_0,g_1,\ldots,g_4$ and complete it by the same standard-basis rule. On fifteen Golay blocks initialize the first five logical inputs to $|+\rangle$ and the remaining ten to $|0\rangle$. Apply the CNOT encoder $U_M$, inject $T$ independently into each coordinate using fifteen supplied resources, and apply $U_M^{-1}$. Measure logical $X$ on input positions 1 through 4. Accept exactly when all four signs are positive, keep position 0 and apply logical $S$ to it; reset the other fourteen positions. Otherwise reset all fifteen positions and return a rejection. The encoder and decoder each have at most $15(14+3)=255$ CNOTs.

A first-level factory repeats this node at most four times, using fresh raw resources and freshly reset node blocks on each attempt. It returns the first accepted output, or aborts if all attempts reject. A second-level factory repeats an outer node at most four times; each of its fifteen resources is supplied by a new first-level factory. All rejected branches are retained in the audit transcript and all preparation, waiting and reset locations are charged.

*Proof.* First establish the physical error invariant used to lift the distillation calculation. A fault-free verified cat measures its designated stabilizer. With at most three faults, four verification sweeps contain a fault-free sweep; the argument of Proposition A.0.2e then assigns every nonuniform cat bit remaining after that sweep to a later fault acting on its one cat position. A uniform cat flip is the identity on the GHZ state, up to the scalar phase contributed by cat phase errors, so this conclusion also holds before the data has entered a code eigenspace. Each subsequent data coupling associates at most one data coordinate with each fault. Incorrect reported signs change the record, whereas a fault-free complete round reports the actual stabilizer sector.

For zero initialization, the ideal product $|0^{23}\rangle$ has logical $Z$ eigenvalue positive and all $Z$-stabilizers positive. The commuting $X$-stabilizer projections leave that logical eigenvalue unchanged. Move Pauli faults through these projectors, flipping projector signs when they anticommute. The $X$ component on the data before a clean round is supported on at most the number of faults so far, hence on at most three coordinates. The clean round's $Z$ syndrome has that unique weight-at-most-three leader. Its $X$ correction removes this component without a logical $X$. The $Z$ correction setting the random $X$-stabilizer signs positive commutes with logical $Z$. Consequently the corrected code state is $|0_L\rangle$. Faults after the clean round remain physical errors on at most one coordinate per fault. Four equal reported syndromes include a clean round, and sixteen rounds contain four successive clean rounds in the presence of at most three faulty rounds. This proves initialization and absence of its abort. Transversal $H$ gives the plus preparation with the same invariant.

The raw encoder is an exact isometry because its columns are an invertible binary basis. Its first twelve columns map its input to
$$
\alpha|0_L\rangle+\beta|1_L\rangle
=2^{-11/2}\sum_{c\in C_{23}^{\perp}}(\alpha|c\rangle+\beta|\mathbf1+c\rangle).
$$
A Pauli fault anywhere in this Clifford encoder propagates to a Pauli on that block. For an arbitrary Pauli-corrupted encoded state, a clean syndrome round followed by the syndrome-table correction removes its syndrome. The remaining Pauli is in the normalizer and is therefore a stabilizer times a logical Pauli. Faults after that round leave a small physical residual. This argument does not assume the incoming error is correctable; the logical Pauli is charged to that defective raw resource. A fault-free raw preparation and encoder give exactly $|A_L\rangle$, apart from later correctable residuals.

Outside these isolated raw encoders, every two-block gate couples matching coordinates. A Pauli fault at coordinate $j$ can spread among blocks but stays at coordinate $j$. Within extraction, each harmful cat or data fault contributes at most one coordinate after the clean-sweep reduction. Recovery replaces earlier small physical errors by errors caused after its clean round. Thus, on a path with $s\le3$ faults, each live non-raw block has a representative physical error supported on at most $s$ coordinates, in addition to the explicitly tracked logical defects originating in raw resources. This statement holds for a tensor product with an arbitrary untouched reference. It also holds when those logical defects are expanded linearly rather than sampled: all intermediate physical gates are Clifford and all measurements are Pauli. The decoded readout corrects the propagated physical errors, so its control bit equals the corresponding logical measurement result. No logical error is introduced by a fault in this Clifford, extraction, measurement or idle layer on such a path.

For clarity, the coordinate invariant permits bounded-degree routing. Arrange one rail through the block slots for each coordinate. Move a whole block along the rails with adjacent transversal SWAPs, perform the neighboring CNOT, and reverse the routing. A SWAP is three CNOTs between the same coordinate in neighboring slots. Its faults retain that coordinate. Give each block the fixed finite cat and encoder wiring needed within its 23-qubit slot. The graph degree is bounded independently of the number of block slots. A routed logical CNOT requires at most $6B+1$ physical gate layers for $B$ slots; the return path and all spectator idles are included.

It remains to prove the logical factory, including arbitrary defective resources. Write $\omega=e^{i\pi/4}$. The injection Kraus maps for an ideal resource are $T/\sqrt2$ and $\omega T/\sqrt2$ after the prescribed feed-forward. Replacing the resource by $Z|A\rangle$ gives $ZT/\sqrt2$ and $-\omega ZT/\sqrt2$. Since $|A\rangle,Z|A\rangle$ are an orthonormal basis, an arbitrary defective resource, including one entangled with other defective resources or an environment, expands as a linear combination of these two possibilities with environment-vector coefficients. On each retained injection-measurement branch it therefore supplies an expansion in $Z$-error subsets confined to defective resource positions. This step needs no twirling assumption and no independence. The coherent expansion concerns the state of defective resources on a fixed stochastic-Pauli fault path. It does not extend the noise hypothesis to coherent sums of distinct fault supports or to an amplitude-based local-noise model.

Let $D=\operatorname{span}(g_1,\ldots,g_4)$. Every nonzero vector in $D$ has weight eight, because a nonzero linear functional takes value one on eight of the sixteen four-bit vectors and takes value zero on the excluded zero vector. The other coset $g_0+D$ has weights fifteen and seven. Hence $T^{\otimes15}$ has phase one on $D$ and phase $\omega^{-1}$ on $g_0+D$. The state prepared by $U_M$ is the uniform superposition over these two cosets. After transversal injection and ideal decoding, position 0 is $T^{-1}|+\rangle$, positions 1 through 4 are $|+\rangle$, and the rest are $|0\rangle$.

For a $Z$-error subset $e\subseteq\{1,\ldots,15\}$, decoding maps $Z(e)$ to a $Z$ vector whose first five bits are
$$
\left(|e|\bmod2,\ \sum_{x\in e}x_1,\ldots,\sum_{x\in e}x_4\right).
$$
Thus acceptance is exactly $\bigoplus_{x\in e}x=0$, and the output after $S$ is $Z^{|e|}|A\rangle$. No singleton has zero xor. Two distinct nonzero coordinates have nonzero xor. Consequently a node with at most two defective supplied resources returns either rejection or the exact ideal resource; this remains true for the complete coherent expansion because every accepted term is the same output ray. A faulty accepted output requires at least three defective resources. The weight-three accepted subsets are exactly $\{x,y,x+y\}$ with $x,y$ distinct and nonzero. There are $15\cdot14/6=35$ such subsets, all of odd weight.

For two levels, an accepted erroneous outer output requires at least three erroneous accepted first-level resources. Each requires at least three defective raw resources in its own disjoint preparation subtree. Thus it requires at least nine defective raw resources when the logical Clifford layer is correct. The conclusion includes coherent and correlated resource errors by the same linear expansion. On a physical path with at most three faults, at most three raw resources can be defective, so an accepted outer output is exact after ideal decoding. A rejected first-level attempt contains a fault in its own fresh subtree; an outer rejected attempt likewise contains a fault in its fresh subtree. Different attempts use disjoint preparation subtrees. Four rejections therefore require at least four faults. Extraction abort also requires at least four faults by the verified-cat and repeated-round arguments. Hence the bounded second-level factory never aborts on a path with at most three faults and its output has the asserted correctable residual. ∎

<a id="proposition-a02g-finite-clifford-plus-t-execution-and-a-complete-counted-fault-cover"></a>**Proposition A.0.2g (Finite Clifford-plus-T Execution and a Complete Counted Fault Cover).** On the circuit branch of Proposition A.0.2f, let a finite logical circuit have $W$ simultaneously retained computational qubits and $G$ operations from $\{H,S,S^{-1},X,Z,\mathrm{CNOT},T,T^{-1},\text{basis preparation},\text{Pauli measurement},\text{reset}\}$. Count every input preparation, output readout and final reset in $G$. Its compiled Golay implementation may reserve
$$
B=W+40,\qquad E=2^{31},\qquad U=150010,
$$
block slots, extraction-clock bound and elementary macro factor respectively. A valid conservative ledger is
$$
L=(4B+4)EUG,\qquad Q=40B,\qquad N=QL.
$$
Here $L$ is the maximum number of elementary ticks, $Q$ bounds reserved qubits, $N$ bounds potential quantum fault locations, and the duration is at most $L\tau$ in the same elementary clock as extraction. Every reserved spectator receives an idle location on every tick not occupied by another operation. The maximum numbers of raw magic preparations and distillation-node attempts are respectively $3600G$ and $244G$. The implementation resets every discarded quantum slot and every writable controller bit or retains it in the specified audit/output record. A serial controller with at most $2^{20}B+2^{20}(G+1)$ writable bits plus the finite read-only program suffices; charge at most one bit reset per writable bit and one elementary tick per executed Boolean operation. These reset ticks are contained in the stated conservative clock bound after the controller program is unrolled into the macro schedule described in the proof.

Every complete fault path with at most three faults produces the correct decoded logical circuit response and no abort. In particular, with bad denoting abort or an incorrect logical output, the unconditioned failure bound is
$$
\Pr(\mathrm{bad})\le\min\left\{1,\binom N4p^4\right\}=:\delta_G(p).
$$
On acceptance of positive probability the conditional error is at most $\delta_G(p)/(1-\delta_G(p))$ when $\delta_G(p)<1$. For each fixed finite circuit and tolerance $\epsilon>0$, $p\le(\epsilon/\binom N4)^{1/4}$ suffices. This is a finite-window bound; its $N$ grows with the circuit and does not assert a uniform concatenated threshold for fixed physical $p$.

*Proof.* A Golay extraction, including the exact controller and the two added transversal correction layers with their controller work and spectator idles, takes fewer than $2^{31}$ ticks using Proposition A.0.2e's bound and the available slack. The extra preparation round takes at most one sixteenth of its quantum-layer envelope and corresponding controller work, so the same bound $E$ covers a basis preparation. The raw encoder needs at most 575 CNOTs, eleven Hadamards, a raw magic preparation, twenty-two other preparations and extraction; enlarging an extraction-only estimate to $E$ leaves more than $10^9$ spare ticks and covers these operations. Its controller performs a fixed finite list of fewer than 1024 additional Boolean operations per quantum gate. The finite program is unrolled, so there is no uncharged instruction-decoding algorithm or unbounded loop.

The fifteen-qubit node uses fifteen zero preparations, five Hadamards, at most 510 encoder/decoder CNOTs, 45 injection operations, four $X$ readouts, fourteen discarded-block resets, one output $S$, and at most one additional rejected-output reset. The total is 595, bounded by 600 protected elementary macros, excluding the supplied resources. Four outer attempts and their fifteen capped four-attempt inner factories give at most $4+4\cdot15\cdot4=244$ node attempts and $4\cdot15\cdot4\cdot15=3600$ raw resources. Thus at most $244\cdot600+3600=150000$ macros construct one output resource. Its use requires a CNOT, a readout and conditional $S$; $T^{-1}=S^{-1}T$ costs one further macro. The common factor $U$ exceeds these counts and also bounds every Clifford and preparation operation.

Sequentially obtaining inner resources while retaining the outer fifteen blocks uses at most thirty-one additional blocks: fifteen outer positions, fifteen inner positions and one raw resource. The forty extra slots cover these and all short-lived staging needs. A protected elementary macro first extracts all live blocks, performs its indicated operation or routed Clifford, and then extracts all live blocks. Its duration is bounded by $2BE+(6B+1)+E$ for the raw-preparation or basis-preparation case as well, and this is at most $(4B+4)E$. Resetting the discarded resource and the macro's temporary classical memory is included in its local extraction/controller envelope. The finite classical record may instead be copied to fresh audit memory; charging one write and one eventual reset per stored bit adds less than the spare factor in $U$ and $(4B+4)E$. In detail, assign $2^{20}$ fresh controller bits to each block and to each top-level operation, and clear each at allocation and final release. This adds at most $2^{21}(B+G+1)$ Boolean ticks, which is less than the unused $6(4B+4)EG$ ticks in the difference between $U$ and the 150004 maximal logical-macro count, for $B\ge40,G\ge1$. When $G=0$, use the empty circuit with no allocation or ticks. Reset/renewal charges are therefore finite on every success and abort branch, and the displayed bound includes them.

The coordinate invariant and factory proof apply successively across this entire finite schedule. Faults can be correlated across blocks, nodes, rejected attempts and idle intervals. Each complete path with at most three faults still obeys the deterministic invariant; logical magic defects are removed by the two-level factory, while physical residuals remain correctable and the decoded terminal measurements are correct. There are at most $Q$ quantum locations per tick, so $N=QL$ labels cover every adaptive branch by using reserved tick/slot labels. Every bad path contains four distinct faulty labels. Union-bounding their $\binom N4$ possible four-subsets under the original local-stochastic inequality gives the displayed bound. Since abort is included in bad, acceptance has probability at least $1-\delta_G(p)$, proving the conditional inequality without a postselection independence assumption. ∎

<a id="proposition-a02h-same-ledger-pce-sign-and-the-remaining-source-predicate"></a>**Proposition A.0.2h (Same-Ledger PCE Sign and the Remaining Source Predicate).** Let the complete ledger of Proposition A.0.2g and an unprotected implementation be evaluated on the same task, input law, observation window, elementary source, clock and cost units. Write $C_F,C_0$ for their total charged costs and $r_F,r_0$ for their actual task-error probabilities, including the declared loss for abort. On a linear error-loss branch with fixed conversion $b>0$,
$$
\Delta V=(C_F-C_0)-b(r_0-r_F).
$$
If certified intervals are $C_F-C_0\in[c_-,c_+]$, $r_0\in[a_-,a_+]$ and $r_F\in[d_-,d_+]$, then
$$
\Delta V\in[c_- -b(a_+-d_-),\ c_+-b(a_--d_+)].
$$
A negative upper endpoint proves the required strict benefit gap; a nonnegative lower endpoint excludes that gap on this ledger. For an unrestricted joint feasible set of these records, the exact sign question is whether its maximum of the displayed affine functional is negative; interval endpoints give the corresponding conservative outer relaxation.

The local-stochastic upper bound and the finite compiled ledger alone do not determine a negative PCE gap even after a positive unprotected baseline error is stipulated. In particular, any strictly positive overhead $c=C_F-C_0$ and finite $b$ admit a same-source positive-baseline circuit instance with $\Delta V>0$ under the same local-stochastic upper envelope. Hence the missing strict gap in Definition A.0.1q.1 is a substantive source/objective predicate.

*Proof.* Subtraction of the two potentials gives the identity. Maximizing and minimizing each term over its certified interval gives the enclosing interval, with no independence assumption. Maximization over the actual joint feasible set incorporates all further common-source constraints.

For the final statement, use the fully specified task that prepares $|0\rangle$, applies $H$, measures $X$, retains its positive ideal response and resets the hardware. In each finite execution window, let the first non-preparation unitary gate be followed, with probability $q>0$, by complete depolarization on one designated participant, with all later locations fault-free. This is the same gate-position rule for the protected and unprotected circuits; it makes no claim about refresh at every later tick. Implement depolarization as the uniform mixture of $I,X,Y,Z$; this is a Pauli fault law with at most one faulty location and it satisfies the local-stochastic bound for every $q\le p$. The unprotected channel is $(1-q)\mathcal U+q\mathcal D$, which has strict trace-distance contraction factor $1-q$ and the positive state-distance baseline $q/2$. Apply the same first-gate noise rule to the compiled protected implementation. Its one physical faulty location is corrected by the preceding propositions, so $r_F=0$ on the same basis-prepared pure-output discrimination task, whereas $r_0=q/2$. The unprotected $H$ gate has the strict refresh contraction on this finite window; arbitrary unknown-state encoding is not used. For any fixed finite $b$ and positive $c$, choose $0<q<\min\{p,2c/b\}$. Then $\Delta V=c-bq/2>0$. Thus even the refresh premise and a common location-level noise rule leave admissible sources on which that positive overhead is not repaid. This example refutes a universal implication from the supplied upper envelope; it does not select $q$, $b$ or a comparator for the retained MPU source. That source must determine its actual $r_0$, complete costs and benefit functional. ∎

<a id="theorem-a41d-exact-protected-nand-compilation-for-each-finite-lite-circuit"></a>**Theorem A.4.1d (Exact Protected NAND Compilation for Each Finite LITE Circuit).** Fix any concrete finite circuit produced by Theorem A.4.1c, including its preparation arithmetic, substituted formula codes, proof verifier and prioritized branch. Express it as a fan-in-two NAND circuit with $d$ binary inputs, $s$ NAND gates and $w$ output bits. Repeated use of $\neg a=\operatorname{NAND}(a,a)$, $a\wedge b=\neg\operatorname{NAND}(a,b)$ and $a\vee b=\operatorname{NAND}(\neg a,\neg b)$ constructs this expression effectively; count every introduced gate in $s$.

There is an exact Clifford+$T$ reversible compiler, using
$$
W=d+s+w+4,
\qquad
G\le56s+2w+2W,
$$
logical qubits and primitive operations, including basis input preparation, output readout, discarded-work reset and output-hardware reset after its classical response is retained. Substituting these $W,G$ into Proposition A.0.2g gives a protected implementation of that exact LITE circuit with error at most $\delta_G(p)$ on the same circuit source and clock. It has no gate-approximation error. Input labels, self-index, numeric proof cutoff, preparation computations and the full output bit string are unchanged by compilation.

*Proof.* Allocate one clean target $z$ for every NAND gate with inputs $a,b$. Apply Toffoli with controls $a,b$ and target $z$, then apply $X_z$. Starting from $z=0$, the result is $z=1-ab$, while the inputs are unchanged. If $a=b$, replace this operation by CNOT from $a$ to $z$ followed by $X_z$; the same bound remains valid. Work in topological order and retain every intermediate target. The resulting reversible circuit computes the entire NAND circuit without overwriting any source bit.

An explicit Toffoli uses two Hadamards on its target around a controlled-controlled-$Z$. For bits $a,b,c$, the integer identity
$$
4abc=a+b+c-(a\oplus b)-(a\oplus c)-(b\oplus c)+(a\oplus b\oplus c)
$$
implements the latter as a phase circuit. Compute the three pair parities and the triple parity in four clean temporary qubits using respectively two, two, two and three CNOTs. Apply $T$ on $a,b,c$ and the triple-parity qubit, and $T^{-1}$ on the three pair-parity qubits. Undo the nine parity CNOTs. The resulting phase is $\exp(i\pi abc)=(-1)^{abc}$, and all four temporary qubits return to zero. Thus Toffoli costs eighteen CNOTs, seven $T^{\pm1}$ gates and two Hadamards, or 27 primitive operations; NAND costs at most 28. This equality is exact on every basis vector and hence on arbitrary superpositions by linearity.

Copy the selected $w$ output bits by CNOT into $w$ clean output slots, then reverse the entire computation. This uses at most $56s+w$ unitary gates and restores all $s$ work targets and four temporary parity qubits to zero. The source input remains available until reset. Prepare all $W$ logical slots, read the $w$ outputs, retain their classical responses and reset the $W$ slots. These operations add $2W+w$, giving the stated $G$. Resetting known-zero work is explicitly charged; no thermodynamic price is inferred from that count. The compiler is uniform: the list of NAND gates determines the forward gate list, its reverse and the output-copy list by finite syntactic operations. It does not inspect the truth of the circuit's output.

Theorem A.4.1c establishes that the input circuit computes the complete numeric-cutoff LITE function with the first branch prioritized. Reversible computation and output copying preserve every output bit, including the case where both proof-search bits are one. Proposition A.0.2g applies to the compiled gate list with its actual input preparation and output readout included, giving the protected finite-window bound. No consistency assumption is needed for this finite computation, and the compiler introduces no gate approximation. ∎

For a source-level execution record, the finite tuple $(\beta,n,g,H_1,H_2,\operatorname{Prf},\text{formula coding})$ determines the concrete circuit and thus the counts above. This construction supplies the compilation and execution map on the declared noisy circuit branch. The MPU-to-circuit intertwiner, the same-source cost/benefit inequality of Definition A.0.1q.1 and the optimizer hypotheses of Theorem A.0.2 remain separate requirements for a physical realization.

<a id="theorem-a41e-concrete-same-window-two-input-lite-instance"></a>**Theorem A.4.1e (Concrete Same-Window Two-Input LITE Instance).**

##### 1. A fully specified finite original LITE instance

Use the first-order PA language with equality, zero and successor, classical natural deduction, equality reflexivity and conjunction introduction, and the usual PA axioms/induction schema. Proof objects are finite strings representing finite derivation trees. The verifier parses the tree, checks each local inference and each axiom/schema instance, and compares its conclusion to the target. This is the ordinary decidable finite proof relation; consistency is not assumed.

Fix a finite ASCII alphabet sufficient to encode this syntax. Enumerate all its strings in length-lexicographic order. Define proof code zero to be the empty invalid proof; code one to be the specific proof $P$ with lines $0=0$ by reflexivity, $S0=S0$ by reflexivity, and $(0=0\mathbin{\mathrm{AND}}S0=S0)$ by conjunction introduction. Codes two onward enumerate the remaining strings in length-lexicographic order, excluding the empty string and $P$. This is a computable bijection with computable inverse, not a replacement of PA provability by arbitrary truth bits. Formula coding can use the ordinary length-lexicographic string numbering. Restricting the genuine proof verifier to numeric codes zero and one gives precisely the finite proof-verifier algorithm in Construction A.0.2p.6.

Take $\mathrm{FormTemplate}(u,v)$ to be $(u=u\mathbin{\mathrm{AND}}v=v)$. Both variables occur freely in the actual syntax. Simultaneously substitute unary numerals for both. Set $H_1(n)=2$, $H_2(n)=3$ and $g(0)=0$, $g(n)=1$ for $n>0$. The cutoff is a numerical proof-code cutoff, not a length cutoff. For arbitrary $\alpha,n$ let $\Psi(\alpha,n)$ perform exactly the two bounded proof searches and prioritized original LITE branch. This algorithm is total, since it checks at most two codes.

An explicit acceptable enumeration can reserve the desired index without circularity. Start with any fixed standard acceptable enumeration $\theta$. Let $F(n)$ be the already total algorithm $\Psi(0,n)$, whose syntactic parameter is the literal integer zero. Define $\phi_0=F$ and $\phi_{e+1}=\theta_e$. This is an effective universal numbering. Translation $\theta\to\phi$ is $e\to e+1$. Translation $\phi\to\theta$ maps zero to a fixed ordinary $\theta$ program implementing $F$ and $e+1$ to $e$. Its parameter theorem follows by compiling the universal $\phi$ evaluation/parameter routine into $\theta$ and translating its output by $+1$. Hence the new numbering is acceptable. Now $\beta=0$ satisfies $\phi_\beta(n)=\Psi(\beta,n)$ by the actual definition of program zero, not by merely labeling an unspecified self-referential program. The syntax involves its own genuine index, although the selected property is a tautological equality property, not a claim about the semantic behavior of that program.

For $n=0$, only invalid proof code zero is searched, so the third branch returns 1. For $n=1$, code one proves the exact substituted formula $(0=0\mathbin{\mathrm{AND}}S0=S0)$, so the first branch returns 3. For $n>1$ code one has a different conclusion, neither search succeeds, and the third branch returns $n+1$. The negated formula never equals $P$'s conclusion. Thus the program really performs the original bounded proof searches, and two branches are exercised on the finite window $n\in\{0,1\}$. This is a finite LITE instance; no diagonal impossibility or semantic self-behavior is claimed.

On that window the complete two-bit response is `(n,1)`, most significant bit first. The fully specialized proof verifier compares only zero and one with the exact substituted formula; after substituting the fixed syntax its positive bit is n and its negative bit zero. All candidate sums and the prioritized selector specialize to this output. The supplied nine-NAND straight-line net realizes these comparisons/selector, with explicit owned constants ONE and ZERO. Constants and all work are prepared by the protected compiler; they are not oracle inputs. This is exact partial evaluation of the specified finite proof-checking program, not omission of a variable proof input. No formula or proof beyond the nominated cutoff is assumed true.

Resource substitution into Theorem A.4.1d gives $d=3$ (one variable input plus two owned fixed input slots), $s=9$, $w=2$, $W=18$, base $G\le 544$, enlarged $G\le 548$. A.0.2g then gives $B=58$, $Q=2320$, with the exact original core $L,N$ and both finite input words printed in Construction A.0.2p.6. The full tree source uses its separately printed complete stock ledger. The enlarged bound adds two $X$/idle positions to set the owned ONE and variable basis input $n$ from zero, plus two marked $X$ gates on the varying high output before readout. The $X,X$ handshake is the identity ideally. The common noise service depolarizes the named participant of the second $X$ (the marked handoff) with probability $q$; in the protected transversal macro it affects coordinate zero only and is followed by ordinary extraction. Thus this same operation rule gives actual unprotected high-bit error $q/2$ and corrected protected core error zero, rather than putting the fault on an irrelevant scratch gate. These are conservative quantum circuit bounds, not a physical MPU-source certificate. A physical MPU-source certificate attaches this exact logical word to the same carrier, noise and cost records.

<a id="construction-a02p1-computation-bearing-rooted-mpu-cells-and-physical-tick-source"></a>**Construction A.0.2p.1 (Computation-Bearing Rooted MPU Cells and Physical Tick Source).**

##### 1. Exact branch and owned cell

A cell is a new ready OPEN apparatus $B_{h}$, $h$ a nonnegative integer. Its predictive factors and paired source ports are the complete finite rooted apparatus in the unchanged rooted-source registration §§1–6 reproduced inside Theorem P.2.6.1b, with all of its private innovation, forecast, receipt, timing and validity rules. Its additional computation factors are forty degenerate qubits, a fixed finite classical instruction/handshake buffer, and five computation-neighbor ports, as specified by the tree geometry below. These are owned working-memory factors of $B_{h}$, not an external ideal quantum computer. The computation alphabet is preparation0, preparationA, $H,S,S^{-1},X,Z,\mathrm{CNOT},\mathrm{CZ}$, measurementX/Z, reset, idle; finite exact classical NOT/AND/COPY and adjacent classical-symbol transport are additional explicit services. Three of the forty qubits can hold a descriptor's three-bit block. The full forty support one Golay block plus its seventeen local ancillary slots.

Every cell has two independent port types: (a) the original paired predictive request/payload port, (b) the computation/controller port. Computation gates and arbitrary nominal inputs act only on (b). There is no wire from a private innovation/source record, or the predictor's uncommitted model, to (b). The original full quantum effect audits may inspect the entire carrier but TERMINATE and do not feed a delivered prediction. This is physical port separation, not a rule deleting an unfavorable forecast after observing it. The fixed qualifying experiment has independent computation inputs and original predictive task; it never supplies future innovations as advice.

The computation begins at the fixed capacity14 predictive horizon, independently of candidate h. Larger-h predictive factors may continue on disjoint factors without delaying the fixed computation environment. Each circuit gives one fixed $E_{R}$ with all other cells and peers at capacity14; that environment is identical across compared root capacities.

A circuit's finite supplier boundary explicitly owns all fresh reset blanks, consumed previous states, physical noise registers, preparation and measurement apparatus, instruction tape, isolation, drives and finite energy accounts. It is not omitted from physical resource accounting because it lies outside the local root target. The complete joint source includes it. A local $C_{P}$ target remains the open ready cell in its declared environment, exactly as Definition 13 and the rooted example permit. Every supplied service has a finite-use instance in the joint manifest. This is not an indefinitely powered finite battery.

##### 2. Sequential physical tick realization

Fix $\tau>0$. At each elementary tick the exact controller enables one finite set of disjoint quantum locations, or one exact Boolean/control transition. Every reserved quantum position not in an enabled gate has the declared idle location. Classical ticks also carry spectator quantum idles. Capped adaptive branches are finite; unused reserved labels are disabled rather than secretly resampled.

An ideal finite instrument $\{K_a\}$ on at most two data qubits is implemented with a finite pointer and environment: $V\psi=\sum_a K_a\psi\otimes|a\rangle$, extended to a unitary by deterministic Gram–Schmidt completion in the lexicographic basis. Pointer projectors at the END of the tick define the retained outcome. For unitary gates use their named exact matrices. Preparation/reset is SWAP with a supplied $|0\rangle$ (or $|A\rangle$ for raw preparation), with the old state moved to the supplier's retained inaccessible record; this is a physical state replacement, not overwriting an arbitrary state. Any claimed discarded-bath entropy is separately conditional and is not needed here.

For any finite full-space unitary $U$ choose its spectral logarithm $L$ with signed logarithm phases $\theta$ in $(-\pi,\pi]$, defined by $U=\exp(-iL)$ (thus $\theta$ is minus the ordinary phase of $U$ modulo $2\pi$), $L=\sum\theta P_\theta$. The bounded positive Hamiltonian $H_U=\hbar(L+\pi I)/\tau$ implements $U$ up to a state-independent phase over one tick; $\lVert H_U\rVert\le 2\pi\hbar/\tau$. All data/pointer free Hamiltonians in this interface are degenerate. Endpoint instruments are explicitly permitted finite measurement services, with their apparatus, supply and record counted. No equivalence is asserted between the partially executed tick and an ideal completed gate. At EVERY tick endpoint, including arbitrary registered interventions there, the complete CP instrument equals the intended sequential instrument, with untouched-reference identity. Induction gives the exact adaptive comb, not merely one terminal channel. Intermediate-time probes see the named Hamiltonian and are separate terminating mathematical tests.

Fault law: assign a private classical register to every potential quantum location label. Its values specify good or a Pauli on the participating outputs; preparation faults follow preparation; measurement faults precede measurement or flip its retained bit. A mixed diagonal preparation on these finitely many labels realizes any explicitly given finite local-stochastic distribution. Conditional Pauli coupling and retained fault environment supply the full dilation. The law is independent of quantum input; correlated support is allowed only when its finite weights obey $\Pr(S\subset F)\le p^{|S|}$. An iid finite law is a direct nonempty example. The one-fault service specialization used for the benefit example is specified separately. No omitted gate is reclassified as a Pauli fault.

The implementation unitary includes the ideal operation and controlled Pauli in the same tick via their product's logarithm. Thus positive-duration implementation does not add an uncounted second fault location. The source's registered noise is exactly this endpoint instrument. Calibration and classical-controller exactness are explicit finite-model premises already present in A.0.2e; no claim of robustness to additional arbitrary Hamiltonian noise follows.

##### 3. Geometry and controller

The exact finite tree controller, five-neighbor geometry, complete stock and physical timing are specified in Part II below. No polynomial physical memory or constituent-qubit supplier-degree claim is made.

##### 4. Whole-source response and fresh minimum obligation

A primitive-by-primitive fixed tensor-factor identification maps the circuit source's data, records, labels and supplier factors to the physical ones. The logarithmic pulse supplies the ideal/noisy endpoint instrument; the exact local tree transition supplies the adaptive controller; the same label law supplies local-stochastic noise; and the same clock counts idle and control ticks. Product/composition and outcome-conditioning prove every finite endpoint protocol's full retained response equality. There is one owner per shared edge/provider factor. This proves the operation/noise/clock transport on the enlarged schedule.

Canonical syntax is exactly the cell descriptor family(h), serialized by its explicit sorted-key unbounded-decimal emitter. Decoding accepts only byte-for-byte constructor equality; every finite $h$ is supported by the mathematical algorithm, with no host decimal-digit cap. The literal prefix interpreter in Construction A.0.2p.6 has constructor $0\,\gamma(h+1)$, and the disjoint universal prefix 11111111111111110 followed by the complete binary-table machine index and prefix-filtered program. Its explicitly copied table semantics and dovetailing preserve optimal prefix universality. Constructor bytes contain the entire predictive primitive description AND the new computation instrument/ownership/menu, not an old target alias. The same target $B_{h}$ is used in every nominated finite environment $E_{R}$; different circuits are inputs/services of that environment, not free unmentioned data already stored in $B_{h}$.

Define $L_{n}$ as programs not yet halted at virtual step n, together with halted programs whose emitted bit strings decode to exactly one $B_{h}$. Stages are uniformly decidable and decreasing. A nonhalting survivor realizes no target. For every h and each fixed finite $E_{R}$, the fixed factor map and sequential instrument proof above establish all admitted finite response constraints, including setup, pauses, retained environments, supplier failures, private records, intermediate-time terminating probes and all operation-endpoint histories. This all-h theorem is the new hierarchy's physical soundness proof; finite replay is only diagnostic. A funded valid nominal run has the stated law. Invalid/empty supplies return a retained rejection tag and deliver no promised gate; the complete grammar contains no alternative unfunded gate port.

Because the added ports have no path to predictive private data and the fixed input law is independent, tracing the new factors out gives EXACTLY the predictive process of the rooted source, for each $h$ and each computation input/command. The quantum identity is $\operatorname{Tr}_{\mathrm{work}}[(\mathrm{id}_{\mathrm{pred}}\otimes E_{\mathrm{work}})(\rho_{\mathrm{pred}}\otimes\rho_{\mathrm{work}})]=\rho_{\mathrm{pred}}$ for every TP work service; for $h\le 14$ the work stage occurs after the predictive score/receipt is committed; for larger $h$ the tensor-factor noninteraction preserves the ongoing predictive marginal. Public launch timing may reveal past completion history, so no false claim of independence after arbitrary work-history postselection is made. Qualification uses the original unconditioned fixed task, not a selected post-run subensemble. The original $h\le 13$ failure and h14 qualification bounds therefore apply literally, including the outcome-dependent update test. Define $s=8796764642080188960911649137/16925843151360000000000000000-3264/10^{6}$, $u=227392/531441$, $\epsilon=1/400$. Then $A_{14}\ge 1/2+s(1/4-\epsilon)>5/8$, $A_{\mathrm{short}}\le 1/2+u(1/4+\epsilon)<5/8$; $L_{14}\le 1/4-s(1/16-\epsilon/2-3\epsilon^{2})<7/32$, $L_{\mathrm{short}}\ge 1/4-u(1/16+\epsilon/2+3\epsilon^{2})>7/32$. These are exact rational inequalities in the displayed fixed constants.

The complete 511 words of length $\le 8$ contain exactly constructors h0,...,14. No universal word occurs below 17 bits. All $h\le 13$ fail the fixed qualifying task; 00001111 emits $B_{14}$ and qualifies. It survives every stage by the all-$h$ physical theorem and literal validity. No shorter program outputs this new target. Hence $C_P(B_{14})=C_{\mathrm{op}}=8$, attained in this new class, for every separately fixed admissible $E_{R}$. This is a whole-open-apparatus minimum with computation-bearing factors; the argument uses no equality between these constructor bytes and those of the rooted source of Theorem P.2.6.1b.

The declared qualifying task is the original full-loop task with the computation port as an owned additional capability. Its actual outcome-dependent model update remains necessary and strictly beneficial. The computation port has nontrivial response-active gates and stores actual code/data. The source does not assert that every individual qubit is independently MPU-minimal, or that program complexity equals the number of storage bits.

##### 4. Fixed environment and cell admission

The computation starts at the FIXED capacity14 predictive horizon, independently of the candidate root's h. Every instantiated h14 cell has completed its qualifying predictive loop by then. In all-h source proofs, a larger-h loop may continue on disjoint factors while computation proceeds; it is not allowed to delay or alter the fixed environment law. Computation inputs and control coins are independent of predictive innovations, and all computation ports are physically separated from those private factors. Thus the original predictive marginal and short-code exclusion remain exact. A different h never selects a different supplier/circuit/noise law.

For a chosen root, every other cell and its matched peer is the fixed capacity14 primitive. The complete finite tree/program/supplier network is the one fixed $E_{R}$. Identifying that root's owned factors and ports gives $B_{h}$ in $E_{R}$; at h14 the same factor identification works at every vertex. All shared edge and local supplier factors are identified once, not cloned per root. The literal interpreter in Construction A.0.2p.6, the whole-cell hierarchy and the fresh511-word census establish the attained minimum. The node's program code does not pretend to contain the supplier's entire ROM; the full joint physical inventory and expenditure DO contain it.

<a id="theorem-a02p2-bounded-degree-all-branch-controller-and-transported-fault-cover"></a>**Theorem A.0.2p.2 (Bounded-Degree All-Branch Controller and Transported Fault Cover).**

##### 1. Total offline compilation, no hidden runtime interpreter

The Golay module in Construction A.0.2p.6 is a lazy generator for the finite circuit of Propositions A.0.2e–A.0.2g: all cat attempts are capped at 4, syndrome rounds at 16, and factory levels at 2 with 4 attempts each. It contains the exact systematic Golay matrix, all 2048 syndrome leaders, the 341-CNOT raw encoder, and the 137-CNOT fifteen-coordinate encoder. The allowed protected logical input alphabet and arities are explicitly validated. CZ occurs only as a physical extraction gate. Measurement results are supplied by the actual CP instrument; the generator never computes a quantum outcome.

The generator is an OFFLINE specification, not an alleged free runtime Python computer. `tree_controller.command_at(n,path)` replays it on an arbitrary prescribed finite outcome history and emits the next command. It branches on both possible actual measurement bits. Every counted $C(k)$ is expanded into $k$ DELAY commands; no opaque $C(k)$ performs a syndrome lookup at runtime. All comparisons, table searches, allocation and branch management have been compiled into the finite ROM's choice of next command. Every outcome prefix, including ones impossible on the nominated input, is compiled; bad/capped branches produce their actual cleanup/reset sequence and retained ABORT, not a favorable forecast. RETURN is the actual record computed from those supplied outcomes. These facts follow by induction on the generator's `send` interface and the explicit `is_measurement` test.

For each fixed circuit the generator has a finite all-branch bound. A cat has fewer than 1024 quantum/control ticks: each of four attempts has one parallel preparation layer, one $H$, seven CNOTs, 28 groups of reset/twoCNOT/measurement, at most 29 small controller blocks, and one reset; an accepted coupling, eight sequential readouts, parity and reset fit the remaining slack. One 22-stabilizer round is below $22\cdot 1024$ ticks. Sixteen rounds, comparisons, the full two-table lookup allocation $2^{20}$ and the physical corrections fit below $2^{21}$ ticks. Basis preparation with its preliminary round and a plus preparation fits below $2^{23}$. Pre/post extraction of all $B$ live blocks, neighboring block routing, destructive readout and housekeeping therefore fit the conservative macro bound $(4B+4)E$ of Proposition A.0.2g, $E=2^{31}$. The raw encoder is 341 CNOTs, below 575. Our fixed node uses 15 preparations, 274 encoder/decoder CNOTs, at most 60 injection/reset/conditional macros, 4 checks, 14 discarded resets and 1 final $S$/reset, hence at most 368 protected macros; raw-resource costs add 15 at level 1. Four attempts and two factory levels fit strictly below 150010 such macros. This explicit smaller count covers the generator's separate resource resets, each counted explicitly. The small fixed controller blocks at allocation, dispatch and abort fit the reserved slack. Thus the original core virtual bound $L_0=(4B+4)2^{31}\cdot 150010\cdot G$ is conservative for this actual fixed implementation. Additional final physical correction/decoder, all abort cleanup, selector and readout slack are reserved in

$$
H=L_0+2^{31}+2^{22}(B+G+1)+4096.
$$

Every path has at most H elementary commands after C-block expansion. `all_vertices` constructs every node of a complete binary tree through depth H, labeling unreachable nodes HALT. This is a terminating finite algorithm on the mathematical unbounded-integer machine. The full tree is far too large to materialize in a diagnostic run; Construction A.0.2p.6 supplies its exact finite generating program and integer expression, and no truncated replay is identified with the full ROM. Host memory exhaustion is not a rejection of a valid source. The original task requests finite execution, not a practical fabrication claim.

##### 2. Spatial controller and exact tick word

Let $M=B$ when $B$ is even and $M=B+1$ otherwise. Each tree vertex contains a line of $M$ complete capacity 14 MPU cells. The first $B$ cells hold the virtual block registers; the possible last cell is a counted spare. Corresponding cells in parent/child vertices are connected. Thus the MPU graph is the Cartesian product of a binary tree (degree $\le 3$) and a finite line (degree $\le 2$), with degree $\le 5$. Pair adjacent line cells for their original predictive interfaces, reusing those edges. Every cell has a DISTINCT local supplier attached by one port, giving degree $\le 6$ if supplier vertices are included. There is no global supplier star. The literal descriptor, with its five computation-neighbor ports, is the one counted in the census.

Each cell stores only its own constant-size command for this vertex, its local endpoint/neighbor-role flags, and the fixed finite-state head machine. A quantum layer contains at most 40 local factors; the owner of a cross-cell gate is its lower endpoint, while its neighbor stores SKIP. Each vertex stores FOUR local command entries, one for each $(n,\text{technology})\in\{0,1\}\times\{U,F\}$, selected by immutable head bits. `four_entry_rom` and `local_command` are the actual finite constructors. Each entry has at most 40 gate records of at most 32 bits plus a bounded header/return tag. The fixed finite-state head controller can be encoded with at most 256 states, 64 local input cases and 48 bits per transition, below $2^{20}$ bits including all four command entries. A new explicit $2^{20}$-bit local ROM allocation and 4096 writable bits cover this. The descriptor and fresh census include that ROM allocation. Neither a global tree address nor an unbounded runtime counter is stored in the head. A cell's location and its prewired parent/child ports ARE its ROM address. The complete ROM size is at most $2^{20}\cdot M\cdot(2^{H+1}-1)$ bits. All bits, including unused branches, are physically owned and priced.

The runtime word is exactly `tree_controller.microtrace`:

1. A forward sweep latches visit, executes the preloaded local instrument, retains its endpoint record, and moves the head to the next cell. A cross-cell gate is executed once by its owner. All participating gates are constant-support operations from the source alphabet; remaining factors idle.
2. A return sweep carries the actual tagged measurement bit to cell 0, or carries zero for a nonmeasurement command. Each generator layer has at most one independently read binary outcome; the parity and comparison branches were compiled into later vertices. No outcome is guessed.
3. A forward sweep copies that actual choice into a fresh local flag and moves all 40 payload factors to the corresponding cell of child0 or child1 by three coordinatewise CNOT layers, then seals the retired-parent record.
4. The head returns to cell 0 and moves to the selected child's cell 0. Twenty endpoint-to-endpoint idle sweeps and 35 local idle phases leave it there ready for the next command.

At entry one charged SWAP puts a fresh local zero into the outcome accumulator, retaining its previous bit. Thus a nonmeasurement vertex always selects child0. The passes before padding use $13M-2$ ticks including that SWAP. Twenty sweeps use $20M$ and the local padding uses 35, so each nonterminal virtual command takes EXACTLY $K=33M+33$ ticks. A sweep means 'move until the locally preloaded endpoint flag', requiring no arithmetic in the head. Its phase counters count only 20 and 35, fixed constants. Movement, copying, CNOTs, measurement pointers and every idle are actual charged source operations. The quantum registers can be entangled across cells; successive SWAP relocation preserves their full joint state. No later virtual gate starts before the entire relocation word is complete. Terminal RETURN/ABORT may stop early; the delivered record is sealed until the fixed outer window. Padding and every resulting idle stay in the global fault cover.

Every local gate has a specified full-space unitary/CP extension. Head flags control the local generator; finite sums of these bounded local generators define the evolution even on invalid multi-head states. The one-head ready sector is invariant under the actual source word. No global 'validate one head' gate is imported. Only that ready sector is used for qualification/execution; terminating full-carrier audits have the actual complete Hamiltonian/instrument law.

##### 3. Fault transport, exact class and clocks

A SWAP's three CNOTs preserve the coordinate label. Propagating any Pauli fault through its remaining Clifford gates yields a Pauli on the active child wire times a Pauli on the retired parent wire. The latter wire never reenters the active computation. Thus one transport fault contributes at most one active virtual-wire error. All 40 factors, including cat, verifier and work factors, are transferred. Faults during added waits are ordinary active-wire idle errors; inactive/future payload faults are transported into retired factors on an ideal SWAP, not copied into the active data. Hence the deterministic Golay invariant of Proposition A.0.2f extends with the additional transport/idle faults counted. Parent and unused-sibling factors remain in the complete source, never erased from its full audit algebra.

The original virtual clock is not identified with elapsed time. At settled command boundaries the active-register map, controlled by the retained path, identifies the virtual circuit with the current vertex's payload. Between these boundaries the source has its actual finite local pulse evolution. Full-source semantics includes the path, supplier and retired factors; there is no assertion that the old unextended circuit has the same intermediate microtime observations.

Set $V=2^{H+1}-1$, $Q'=40MV$ and $L'=K(H+1)$. Then $N'=Q'L'$ is a complete conservative potential-location cover, including all reserved inactive payload idles. The threshold

$$
p_{\mathrm{th}}=1/(2N'^2)
$$

satisfies $\binom{N'}{4}\,p_{\mathrm{th}}^{3}\le 1/(192N'^{2})<1$, so the fourth-fault bound strictly improves the physical parameter below it. Choose $q=1/(16N'^{2})=p_{\mathrm{th}}/8$. The actual nominated benefit source is a smaller allowed local-stochastic law: independently prepare a private $\mathrm{Bernoulli}(q)$ flag and two fair Pauli-selection bits at EVERY potential marked vertex; all other location flags are good. Only a visited marked gate applies its private flag. Each actual path visits exactly one marked gate, hence has at most ONE actual faulty location. The input-independent preassigned law satisfies $\Pr(S\subset\text{bad flags})\le q^{|S|}$, and the applied support is a subset, so the same bound holds despite adaptive path selection. Unvisited bad flags remain latent owned environment records, not applied quantum faults. There is no shared flag copied to many potential locations or input-dependent choice of a preassigned fault label. Every other quantum location, including the final decoder, is fault-free in this actual source. The 4096 local provider-stock bound covers this compact sparse law and one-use local apparatus. It does NOT realize every possible generic local-stochastic bath; such an extension must add its finite label-register/distribution-dilation stock, potentially proportional to $N'$. Exact classical controllers are the original admitted source premise.

The full protected core therefore has error 0 on the actual law. Under a more general local-stochastic law only the core fourth-fault guarantee is imported. The final physical decoder and private output link are separately metered adapters: their errors must be added, never claimed to be corrected by that core theorem. The concrete decoder is a final extraction plus the reversed 341-CNOT raw encoder and eleven inverse-$H$ preparations, returning the unknown logical state to coordinate 0 and the other 22 factors to zero on its ideal branch. Its operations are explicitly in $H$'s additional allocation. The private link contributes $p_0\exp(-t)$, with $p_0=q/4$, on the actual law. Generic full-delivery error is bounded by core error + adapter error + private-link error. The actual adapter error is zero because its locations are fault-free by the stated, unchanged rule.

###### Universal finite-word output extension

The executable four-entry ROM is the nominated two-input LITE/PCE task. For generic universal execution, `generic_expanded_stream(W,gates)` substitutes any validated finite logical word into the SAME protected generator and local tree construction. At its terminal RETURN it emits each resulting logical bit as one RETAIN_BIT command at a separate visited vertex and then a constant HALT tag. The bit value is fixed by that actual outcome prefix in the offline ROM; runtime merely copies the preloaded bit into a fresh retained local output register. RETAIN_BIT has constant size and a charged copy/readout instrument. Ordered visited-path records recover the output list; no arbitrary output tuple is stored in one fixed-size local ROM entry. `generic_command_at` is the explicit total offline replay constructor for this mode. There are at most $G$ such output commands, already below the reserved $2^{22}(B+G+1)$ slack in $H$. The input word/compiler description is owned by the full preloaded finite ROM. This separate generic task does not authorize operations before/after the locked service's private port or enlarge its PCE comparison class.

<a id="construction-a02p3-private-terminal-funded-demand-meter-and-common-rate"></a>**Construction A.0.2p.3 (Private Terminal, Funded Demand Meter and Common Rate).**

##### 5. Actual private one-slot terminal instrument

A finite two-qubit dilation suffices; no uncounted Markov bath or exact continuous jump timestamp is needed. The private flag $E$ starts $\mathrm{Bernoulli}(p_0)$, with private $R=0$. On $\operatorname{span}\{|10\rangle,|01\rangle\}$ use the rotation with $\cos(\theta)=\exp(-t/2)$, $\sin(\theta)=\sqrt{1-\exp(-t)}$; fix $|00\rangle,|11\rangle$. This is a complete unitary $U_{t}$. It gives $\Pr(E=1)=p_0\exp(-t)$. Compose it with controlled-$X$ from $E$ to the actual decoded output and, for the LITE task, the fixed $Z$-readout dilation. The positive spectral-log recipe implements this finite composite in one calibrated slot. All $E,R$/pointer factors remain owned and private. Its actual intermediate evolution is explicitly this pulse, not an asserted semigroup.

The PCE mode is LOCKED: one unknown-input logical $X$ handoff, fixed computational frame, exactly one output use, no post-link gates, no basis reinterpretation, no private-flag/side output, no requery, no output-conditioned retry and no success-only selection. The generic quantum programming capability belongs to a separate declared task/mode on the same carrier; it does not enlarge this handoff's comparison interface. Two supplied reservation slots describe $U(t)$ or $F(s)$; one input-independent choice bit samples their exact declared weight. At most two settings are admitted physically. This contains every point attaining the proved convex envelope; the proof's lower bound for all finite mixtures remains applicable to this smaller explicitly declared source class. There is no omitted variable-length lottery-description stock.

The unmarked X preflip is followed by the marked nominated X. The ideal X,X leaves the LITE output unchanged. On that nominated single-qubit algebra the unprotected channel is private-X-noise composed with (1-q)X+qD. Its contraction is at most 1-q and its actual supremum error is q/2+(1-q)p. Spectators are fixed/outside this local algebra; no global spectator-inclusive contraction is asserted. Protected correction and decoding give the ideal X followed by the same private noise, error p. Both suprema have the same Z-basis maximizers. In the LITE test the high output is n, the low output is 1, and the initial uniform n gives precisely the same error coordinate.

##### 6. Supplied-boundary expense and optimizer integration

This is a declared physical supplied-service expenditure boundary, not a claim that net Hamiltonian work equals a tariff. Every run is one member of a family of FINITE funded apparatus/reservations; no fixed finite wallet purports to support $t\to\infty$. The common initial stock owns every MPU, all exponential ROM/payload branches, local provider pointer/blank/retired-state factors, local clocks, the two-slot reservation/choice apparatus, all refresh coins, whole-source coding/proof ROM, isolation through the common window, and all control/readout/refund guards. Its explicitly declared common baseline $C_{\mathrm{base}}$ is charged to BOTH technologies and every two-slot setting. No exponentially large stock is assigned zero cost merely because it is idle.

A protected core package reserves the COMPLETE finite F program, quantum/controller/transport/reset/readout and final decoder services on that stock. Its incremental SERVICE-DEMAND scale is set to 4. This is an explicit positive calibrated package unit; it is not deduced from a dimension count or net work. Independently the tunable terminal service is engineered/metered with demand t for setting t; this is a separate supplier calibration, not a second consequence of one units rescaling. Precision/calibration, private flag preparation, choice realization, record holding and controller activation are included in these two declared packages and the common baseline. There is no unpaid auxiliary service access.

For a two-slot lottery with branch demands $c_j+t_j$ ($c_j=0$ for $U$, 4 for $F$), its declared mean demand is $C$. BEFORE any branch activates, a wallet excitation of gap $R(C)=C+C^{2}$ is actually swapped into an inaccessible provider receipt of the same gap. A successful debit latches all one-use local activation vouchers; an unfunded or malformed reservation returns the retained rejection and supplies no data service. Voucher distribution/initialization is an owned finite preparation on the tree, charged in the common contract. A running latch is not removed during a transfer. The sole allowed refund route is NONE: supplier receipts, recovery/dump stores and private controls have no root spendable or output bypass port. Every branch then executes the exact sampled reservation. The bill is deterministic $R(C)$, not $\mathbb{E}[R(c_j+t_j)]$. This is a genuine nonlinear reservation contract. Supplier initial energy/purity stocks, imported energy, retained recovered energy and final balances are listed separately; paying for a supplied energy/service is not counted again as a second expenditure. No supplier-inclusive intrinsic-dissipation theorem is asserted.

Finally the performance conversion has an actual fixed input energy $B$ in a reward bank. An owned retained comparator compares the delivered high bit with the source's initially copied target $n$, and routes that excitation either to useful output or to an inaccessible dump. Its CP control/readout is included in the common contract, with no backward wire from that verdict to the delivered response. Gross input $B$ is common, useful mean output is $B(1-r)$, and energy is conserved by the same disjoint-transposition router as the paid-source construction. Thus subtracting common terms gives EXACTLY $R(C)+Br$. It does not count the error loss twice.

The exact tangent certificate fixes $q$, $p_0=q/4$, $c=4$, $D=4-\log(1-q)$, $m=q/(2D)$, $C_F=4+\log(p_0/m)$, and $B=2(1+2C_F)/m$. The complete admitted two-slot class has the same attained convex envelope as the all-finite-mixture proof. Its logarithmic converse uses the actual unprotected baseline $r_B=q/2+(1-q)p_0$. The unique positive optimizer lies on the pure $F$ branch and has a strict gap greater than $27/16$ over all $U$ settings/mixtures. The selected scalar setting is computable from an explicit strictly monotone equation. The continuous control family is a declared finite-dimensional calibrated interface; every finite setting has finite apparatus and price, while the unbounded family is not represented by a single finite battery.

##### 7. Positive operational demand meter and physical rate units

Fix a positive energy unit $e_0$ and the elementary duration $\tau$. A reservation has a separate owned two-level demand meter with spectral projections $P_0,P_1$ and Hamiltonian $H_{\mathrm{dem}}=e_0CP_1$. The ready reservation prepares $P_1$ and retains it until the final audit. Its measured positive held-energy coordinate $\operatorname{Tr}(H_{\mathrm{dem}}\rho)/e_0$ is exactly $C$. For $C=0$ the meter is degenerate and reads zero. The admitted two-slot contract calibrates this gap BEFORE sampling to $C=\sum_j w_j(c_j+t_j)$, with $c_{j}=0$ or 4. This is a deterministic reservation-capacity meter, not a random realized-branch meter. Independent reservations compose by the tensor sum of their meter Hamiltonians, so their demand coordinates add exactly. The operational units and core/terminal calibrations are independent source data. This explicitly realizes the resource-overhead coordinate used by A.0.4. It asserts neither a B.1 depth observable nor intrinsic $C_{P}$ growth.

The funded activation guard checks both the prepared demand-meter excitation and the independent spendable debit wallet of gap $e_0(C+C^{2})$. The demand energy is held and retained, not spent a second time: initial and final meter energies are both $e_0C$. The debit excitation leaves the root spendable account and arrives in its inaccessible provider receipt. Thus its exact source-boundary expense is $e_0(C+C^{2})$. Preparation, calibration and retention of this finite meter and its instrument are covered by the explicit reservation service. Each finite setting is a finite calibrated physical model. The selected optimum and all coefficients needed there are computable from the displayed monotone equation; no program is claimed to print every arbitrary real setting exactly.

Let $T_{\mathrm{common}}$ be the fixed capacity14 predictive horizon plus K(H+1)tau plus a fixed finite setup/terminal allowance for the funded reservation, meter preparation, selector and reward router. Preloaded parallel local setup uses its declared finite duration independent of technology and t; the terminal composite and router occupy fixed additional slots. For example add8tau, with all delivered data sealed until this common endpoint. The same stock and window are used for U,F and both mixture branches. This constant allowance is outside the protected core fault count; its actual instruments are exact under the registered sparse law and are fully owned. There is no claim that the generic core bound covers these adapters.

After subtracting the explicitly common baseline and reward-input terms, the physical PCE rate is $(e_0/T_{\mathrm{common}})[C+C^{2}+Br]$. Both benefit and expense use the same positive conversion. Therefore the exact optimizer, convexity and strict ordering survive, and the integrated gap greater than $27/16$ becomes a rate gap greater than $27e_0/(16T_{\mathrm{common}})$. The actual overhead function $C_{\mathrm{err}}$ is the attained minimum of this calibrated demand-meter value over precisely the locked two-slot service menu. The logarithmic converse and convex envelope are consequently claims about that actual operational coordinate, not about a merely named control parameter.

<a id="theorem-a02p4-attained-same-source-overhead-envelope-and-strict-protected-optimum"></a>**Theorem A.0.2p.4 (Attained Same-Source Overhead Envelope and Strict Protected Optimum).**

##### 1. Complete comparison contract

Let $0<q<1/2$, set $a=q/2$, $p_0=q/4$, and $b_0=(1-q)p_0$. Both implementations perform the same declared task and use the same final private-flag output service for one fixed time slot. The variable service rate $t$ is finite at every finite setting and has measured incremental resource $t$. Append a marked $X,X$ identity handshake to the varying logical output before its final readout. The common service rule depolarizes the named participant of the second $X$ (the marked handoff) with probability $q$; in the protected transversal macro only coordinate zero is exposed and ordinary extraction follows. Every other quantum location is fault-free on this specific law. This gives unprotected high-bit error $q/2$ and exactly corrected protected core. The refresh/gate-error statement is on that named one-qubit output algebra, not a claim of global multiqubit trace-distance contraction. The protected core has complete additional metered resource $c=4$, after a declared common resource normalization. A claim that $c=4$ must include every noncommon service/controller/retention/reset cost; it is not inferred from net work or from an omitted category. One rescaling of units does not independently normalize both $c$ and the terminal rate-cost coefficient. The source must additionally choose and realize its terminal-service tariff so that rate $t$ costs $t$ in those same units; this is an explicit fixed metering contract, not an algebraic consequence of $c=4$.

The deterministic menu is

$$
\begin{aligned}
U(t)&:\ (C,r)=(t,a+b_0 \exp(-t)),\quad t\ge 0; \\
F(s)&:\ (C,r)=(4+s,p_0 \exp(-s)),\quad s\ge 0.
\end{aligned}
$$

Here r is the SAME total original logical-error coordinate on both branches. For an ideal logical unitary followed by depolarization and an X-flip, its original supremum trace-distance error is a+(1-q)p; the protected channel has error p. The maximizer can be chosen as a Y or Z eigenstate for every setting, so the total error of a randomized mixture equals the mixture of the displayed r values. On the finite LITE bit task, these are also the exact high-bit error probabilities under uniform input; the full two-bit output remains retained.

Admit all finite classical randomized mixtures of these settings, with input-independent mixture labels. They use at most two settings on the efficient boundary as proved below. $C$ is mean incremental resource. The actual source bills the fixed strictly convex reservation tariff $R(C)=C+C^{2}$ on the declared mean-resource contract, funding its branchwise services. Preparation of mixture probabilities, selecting the branch, control, bookkeeping and final private-port access must be included in this contract; they cannot be uncharged hidden costs. This is an explicit mean-reservation billing premise, not a false interchange of $R$ and expectation. The same rule applies to both technologies and every mixture. Output records exposing the private final error flag, bypass ports, and new post-output coding are not admitted operations of this source task. A realization must enforce this declared access class.

##### 2. Tangent and feasibility

Define

$$
\begin{aligned}
D&=4-\log(1-q),\quad m=a/D, \\
t_U&=\log(b_0/m),\quad s_F=\log(p_0/m),\quad C_F=4+s_F.
\end{aligned}
$$

Then $D>4$ and $2/(1-q)<4$ for $q<1/2$, hence $D>2/(1-q)$. Thus $m=q/(2D)<(1-q)q/4=b_0$. All contacts are interior: $t_U>0$, $s_{F}>0$, and $C_F-t_U=4+\log(p_0/b_0)=D$. At the contacts the errors are $a+m$ and $m$, and both exponential curves have derivative $-m$ with respect to resource. Their secant has slope $-(a/D)=-m$ as well.

Let $h(C)$ equal the $U$ curve for $0\le C\le t_U$, the common tangent $a+m-m(C-t_U)$ for $t_U\le C\le C_F$, and the $F$ curve $p_0\exp(-(C-4))$ for $C\ge C_F$. This is continuous with continuous first derivative, positive, strictly decreasing and convex. Each exponential piece has positive second derivative; the middle is affine. Its endpoints are $h(0)=r_B=a+b_0<1/2$ and $h(C)\to 0$ as $C\to\infty$.

It is the exact minimal error for each mean resource $C$. The common tangent lies below both convex exponential curves wherever each exists. For $C\le t_U$ the $F$ curve, when defined, is above the $U$ piece: the difference $F-U$ has derivative of constant sign and cannot cross below $U$ before the left tangent contact; more explicitly $F(C)-U(C)=(p_0\exp(4)-b_0)\exp(-C)-a$ is strictly decreasing and is positive at $C=t_U$ because $\exp(D)>1+D$. For $C\ge C_F$ the analogous difference is negative at $C_{F}$ because $\exp(-D)>1-D$, and stays negative thereafter. Therefore $h$ lies below every deterministic menu point. Jensen gives $\mathbb{E}[r]\ge\mathbb{E}[h(C)]\ge h(\mathbb{E}[C])$ for every finite mixture. Conversely the first and last portions are attained by the single corresponding deterministic setting, and the middle is attained by mixing precisely $U(t_U)$ and $F(s_F)$. The mixture weight is $(C-t_U)/D$. This proves both exhaustiveness and finite attainment; no closure of an unbounded infinite-mixture class is needed.

For $C>C_F$, strict convexity of the $F$ segment and the supporting-line equality conditions show that attaining $h(C)$ requires only that same $F$ setting (up to duplicate response-equivalent representations). In particular a genuine mixture containing $U$ cannot attain the efficient boundary at $C>C_F$.

##### 3. Actual reliability-overhead function and converse

Invert $h$. For $0<r\le r_B$ the exact minimal mean resource is

$$
\begin{aligned}
C_{\mathrm{err}}(r)&=\log(b_0/(r-a)),\qquad a+m\le r\le r_B; \\
C_{\mathrm{err}}(r)&=t_U+(a+m-r)/m,\qquad m\le r\le a+m; \\
C_{\mathrm{err}}(r)&=4+\log(p_0/r),\qquad 0<r\le m.
\end{aligned}
$$

The formulas and their derivatives agree at both seams. This is a continuous, convex, strictly decreasing, finite function, zero at rB and divergent at zero. It is an attained minimum over the entire declared comparison class.

The exact original baseline is $r_B$, not $p_0$. Each $U$ setting satisfies $r\ge r_B\exp(-C)$. Each $F$ setting does too since
$r_B/p_0=a/p_0+(1-q)=3-q<3<\exp(4)$.
Thus $c=4$ exceeds $\log(r_B/p_0)$. Jensen preserves this inequality for mixtures, so

$$
C_{\mathrm{err}}(r)\ge\log(r_B/r).
$$

This is the original logarithmic converse with $A=1$ in the chosen resource units, for the full registered class and the actual uncorrected baseline. It does not arise from a fitting penalty or from redefining the total error.

##### 4. Fixed benefit price and unique protected optimum

Set $k=1+2C_F$ and fix the price $B=2k/m$. The complete incremental potential is

$$
V(r)=R(C_{\mathrm{err}}(r))+B\cdot r,\quad R(C)=C+C^{2}.
$$

$R$ is continuous, increasing, strictly convex and coercive. Since $C_{\mathrm{err}}$ is convex and strictly decreasing, $R$ composed with $C_{\mathrm{err}}$ is strictly convex. $V$ is therefore strictly convex on the original interval $(0,r_B]$, continuous, and tends to infinity at zero. It has a unique attained positive optimizer $r^*$. Every admitted value $r\le r_B$ is below $1/2$, so the required robustness bound holds.

At the right end of the pure protected range $r=m$,
$V'(m)=B-(1+2C_F)/m=k/m>0$.
As $r$ tends to zero inside that range, $V'(r)=B-[1+2(4+\log(p_0/r))]/r$ tends to minus infinity. Strict convexity gives a unique zero inside $(0,m)$. Therefore the global optimizer is a pure protected setting with

$$
\begin{aligned}
B\cdot r^*&=1+2(4+\log(p_0/r^*)), \\
C^*&=4+\log(p_0/r^*)>C_F.
\end{aligned}
$$

The optimizer has a finite computable-real description: writing $x=r^*/m$, it is the unique root of $2kx-k+2\log(x)=0$ in $(1/2,1)$. The derivative $2k+2/x$ is positive, the endpoint signs are opposite, and bisection gives arbitrary certified precision. Equivalently $x=W(k\exp(k/2))/k$ for the positive real Lambert $W$ branch. No oracle for optimizing an infinite mixture class is required. No $U$ or genuine mixed setting attains its value, by the exact lower-envelope and strictness arguments. This is stronger than a protected candidate beating one hand-picked unprotected setting.

There is also an explicit strictly positive gap against every unprotected configuration. Such a configuration has error at least $a>m$, since $D>1$. At $r=m/2$, the pure protected resource is $C_F+\log(2)$. Thus

$$
V(m)-V(m/2)=k\cdot(1-\log(2))-(\log(2))^{2} =: \gamma.
$$

Here $C_{F}>4$, so $k>9$; $\log(2)<3/4$ and $(\log(2))^{2}<9/16$ give $\gamma>9/4-9/16=27/16>0$. Since $V$ is increasing for $r\ge m$, every unprotected configuration has potential at least $V(m)$, whereas $V(r^*)\le V(m/2)$. Hence the optimized protected advantage is at least $\gamma>27/16$ in the fixed tariff units. Abort/failure cost, full response loss and baseline common charges must already be included in the source definitions; no such costs are erased by subtracting common terms.

The order is transparent: construct and fix $q$ and the common source, normalize its fully counted core resource to $c=4$ and terminal service resource to $t$, then define $p_0,D,m,C_F$ and $B$ as above and hold this objective fixed over the entire optimization. Definition 15 declares its objective on a specified admissible comparison class and so admits this mathematical construction. The benefit statement is asserted at this fixed price $B$.

<a id="theorem-a02p5-common-mpu-link-golay-execution-optimizer-and-lite-certificate"></a>**Theorem A.0.2p.5 (Common MPU-Link, Golay Execution, Optimizer and LITE Certificate).**

Construction A.0.2p.6 defines the complete cell source words, prefix machine, Golay service, command tree, LITE word and finite stock. Its unbounded-integer recurrences specify every finite instance and every source byte.

The PCE calculus is Theorem A.0.2p.4. The concrete proof-checking specialization is Theorem A.4.1e, with its explicit acceptable numbering, genuine proof code1 and all three original branches. Its exact132-operation words for both inputs are printed in Construction A.0.2p.6. The two inputs produce (n,1), with all work/parity factors restored. Conservative resource input is W18,G548. The complete syntax/proof/compiler description is retained in the supplied baseline ROM, although the finite terminal task permits constant folding.

For the original A.0.1q.1 conjunction: (i) the new cell census and hierarchy give actual MPU vertices; (ii) Part II gives bounded degree, exact endpoint operation/noise transport, actual controller clock and complete finite resources; (iii) the original Golay lemmas supply the protected core and the changed finite threshold uses the expanded N'; (iv) the locked nominated handoff is actually appended to the concrete LITE word, so the selected pure-F optimizer, strict positive rate gap, code/noise/decoder and service expense are projections of this same run/window; (v) the same source alphabet and parameterized finite compiler provide universal protected execution with sufficient finite resources as A.0.6 requests. The classical controller is exact by the original stated premise. This is not a claim of a uniform fixed-p scalable threshold, arbitrary extra Hamiltonian-noise protection, or optimization over every algorithm executable in the separately declared generic mode.

<a id="construction-a02p6-literal-cell-protected-controller-and-finite-lite-algorithms"></a>**Construction A.0.2p.6 (Literal Cell, Protected Controller and Finite LITE Algorithms).**

The algorithms and finite data below define the constructor and compiler used in Construction A.0.2p.1 and Theorems A.0.2p.2/5 and A.4.1e. Their integer and finite-generator semantics are mathematical. The finite source maps, serialization, encoder words, adaptive protocol and stock recurrences below define every constructor input and output.

The constructor, raw table grammar, prefix filtering, finite outcome-branch compiler and complete inventory are specified literally. The protected generator's measurement values come from the actual endpoint instrument; they are never predicted. The Boolean and phase identities below prove the ideal finite LITE word. The physical instruments, source supply, fault law, locked handoff, tariffs and all-history response proof remain those in Constructions A.0.2p.1/3 and Theorems A.0.2p.2/4/5.

The LITE integer record gives the original conservative logical core bound, with $Q=2320$ and its displayed core L,N. The separate complete source ledger and its symbolic integer expressions give the full tree, provider, controller, transport and idle stock. The core bound is not substituted for that full-source stock or fault census.

#### 1. Source descriptor words

**Cell source words and their serialization.** Let $h\in\mathbb N$. The following table defines the predictive source map $D_h^{\mathrm{pred}}$. A pair $[a,b]$ is an ordered two-integer array, not a reduced fraction: its two entries are serialized separately. String values are the literal ASCII text displayed between single code delimiters; those delimiters are not part of the string.

| Key | Value in $D_h^{\mathrm{pred}}$ |
|---|---|
| `audit_grammar` | `completed retained records; rational-time waits; terminating algebraic quantum effect; no audit feedback` |
| `capacity` | $h$ |
| `clock_frequency_over_kappa` | $[1, 1500]$ |
| `clock_recipe` | `always ticking after bounded enable ramp; smooth fresh-flag pulse in interaction picture` |
| `command_input` | `both commands latched before jitter; fixed eight-value menu; qualified task uniform over all menu pairs` |
| `command_menu_kappa` | $\begin{bmatrix}0 & 1 \\ 1500 & 1 \\ 3000 & 1 \\ 4500 & 1 \\ 6000 & 1 \\ 7500 & 1 \\ 9000 & 1 \\ 10500 & 1\end{bmatrix}$ |
| `deadline_kappa` | $[h, 1]$ |
| `environment_boundary` | `peer predictor terminates on own deadline; outgoing source clocks remain until both consumers finish` |
| `fixed_environment` | `E_star: primitive peer capacity 14, same fixed omega/menu/jitter and shared K setup; no recursive descriptor` |
| `initial_depth` | $h + 1$ |
| `innovation_epsilon` | $[1, 400]$ |
| `jitter_cutoff_kappa` | $[1, 1]$ |
| `jitter_rate_over_kappa` | $[1, 1]$ |
| `jump_budget` | $h$ |
| `kind` | `O01-RootedClockLink-DrivenFinite-v1` |
| `local_target` | `ready open apparatus with finite command input; not a conditioned microstate or reduced density matrix` |
| `local_workspace_bits` | $8192 + 256 \, h$ |
| `macro_slots` | $64$ |
| `motor_depth` | $2 \, h + 2$ |
| `motor_rates_over_kappa` | $[1, 1, 1]$ |
| `observer_macros` | $3$ |
| `outer_window_kappa` | $[21002000000 + 1000000 \, \max(h,14) + 64 \, (\max(h,14) + 3) + 6, 1000000]$ |
| `payload_lane` | `two one-use peer-to-root binary source cells per incoming acquisition relation` |
| `phase_labels` | $4$ |
| `predictor_recipe` | `fixed target Y2; report (m,q) with Ber(q)(m xor Y2); reversible two-cycle memory update; matched iid tokens; fair failure` |
| `pulse_duration_kappa` | $[1, 1000000]$ |
| `request_lane` | `two one-use root-to-peer request cells per incoming acquisition relation; disjoint from payload` |
| `root_owns` | `motor,predictor,4 forecast clocks,4 tokens,2 outgoing source clocks/source cells,local readout/controller/records` |
| `semantics_version` | `ROOTED-REGISTRATION-v1; joint-link64-request-v1; smooth-flag-mean-v1` |
| `shared_owns` | `K preparation, initialization correlations,request/payload edge lanes and their separate flags/drives` |
| `slot_recipe` | `1 request swap;2 producer generation;3 payload swap;4 receiver gate OR simultaneous joint forecast captures;5..64 local padding` |
| `source_recipe` | `one-use E1=I/4+epsilon Z; generated Yn immutable; source outcomes private until payload endpoint` |
| `terminal_recipe` | `four slots per missing innovation in n order;at most six meter/router/replay slots;pad to64` |
| `warmup_kappa` | $[10501000001, 1000000]$ |
| `workspace_partition` | `disjoint predictor and outgoing producer blocks; local-only shadows; predictor snapshots never probe producer mutable records` |

To define the common cell descriptor $D_h$, replace its `kind` value by the exact ASCII string `ALOG02-DrivenGolayMPUCell-v1`, rename `outer_window_kappa` to `predictive_window_kappa` without changing its value, append the following computation map, and replace `semantics_version` by the exact string `ALOG02-CELL-v1; ROOTED predictive primitive laws unchanged; new sequential quantum-service interface`.

| Key | Value in the computation map |
|---|---|
| `alphabet` | [`PREP0`, `PREPA`, `H`, `S`, `SDG`, `X`, `Z`, `CNOT`, `CZ`, `MX`, `MZ`, `RESET`, `IDLE`] |
| `command_auth` | `immutable preloaded local ROM selected by fixed input/technology bits; no external override or post-link command port` |
| `controller_alphabet` | [`NOT`, `AND`, `COPY`, `MOVE_SYMBOL`, `ENABLE`, `ACK`] |
| `environment` | `fixed finite program/provider/network law for each nominated task, identical across h; generic neighbor response interface` |
| `inventory` | `all supplies, pointer environments, program storage, control ticks, idle faults, reset records and charged drives have finite joint-source owners` |
| `neighbor_ports` | $5$ |
| `noise_port` | `private finite potential-label Pauli registers; declared local-stochastic joint law; no missed-U substitution` |
| `owned_degenerate_qubits` | $40$ |
| `owned_exact_controller_bits` | $4096$ |
| `owned_readonly_ROM_bits` | $1048576$ |
| `private_boundary` | `computation ports cannot read innovation or private service flags; full-factor mathematical audits terminate` |
| `program_port` | `finite exact controller program and input, independent of predictive innovations` |
| `reset_port` | `fresh supplied state swap; previous state returned to inaccessible retained supplier record` |
| `tick_drive` | `positive spectral-log Hamiltonian with eigenphases in (-pi,pi]; full endpoint CP instrument` |
| `tick_instrument` | `ideal finite dilation followed by registered controlled output Pauli; measurement Pauli before pointer read` |
| `timing` | `fixed capacity14 predictive horizon precedes computation; longer-h predictive factors may continue independently; computation never touches them` |

Serialize finite maps and arrays by the canonical ASCII convention of Construction B.3m.1a: map keys in increasing ASCII order, double-quoted strings, colon between a key and its value, comma between adjacent fields or array entries, and no whitespace except characters inside a string. Append exactly one line-feed byte. Integers use their complete signed decimal expansion without leading zeros, with zero written `0`. Repeated division by $10^9$, printing the leading nonzero block followed by nine digits for each lower block, defines that expansion for every finite integer. This convention imposes no host-size cutoff. The family decoder returns $h$ exactly when the whole input byte word is this canonical serialization of $D_h$, and is undefined otherwise. Duplicate keys, alternate whitespace, a noninteger capacity or a negative capacity cannot pass whole-word equality.

#### 2. Exact prefix presentation

Use the exact $\gamma$ headers, binary transducer-table grammar, length/lexicographic prefix filter and virtual-tick convention of Construction B.3m.1a. In this presentation the constructor $0\gamma(h+1)$ returns the binary expansion of the canonical bytes of $D_h$ just defined. The universal namespace remains $1^{16}0\gamma(e+1)p$, with the same raw input $\gamma(|z|+1)zp$, transition ordering, output convention and invalid-program divergence. The physical decoder groups bits into eight-bit ASCII bytes and applies the whole-word family decoder above. Thus
$$
 \mathcal H_n=\{p:\operatorname{sim}_n(p,\varnothing)\text{ is undefined or decodes to some }h\in\mathbb N\}.
$$
The source family, rather than the mathematical interpretation of arbitrary machine output, supplies its physical meaning. The prefix-free and optimality proof in Construction B.3m.1a applies with this constructor output family; its exact two-tick/third-observation constructor convention is retained. No recursive import of another source file occurs in this definition.

#### 3. Golay instrument and adaptive finite protocol

**Fixed Golay coordinates and exact encoders.** Let $P$ be the binary matrix below and put $G=[I_{12}\mid P]$. Delete row zero and column zero to obtain the $11\times23$ matrix $H$. Its row supports $S_j$ retain their increasing coordinate order.

| $i$ | Row $p_i$ of the binary $12\times12$ matrix |
|---:|---|
| $0$ | $(0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)$ |
| $1$ | $(1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0)$ |
| $2$ | $(1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1)$ |
| $3$ | $(1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1)$ |
| $4$ | $(1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0)$ |
| $5$ | $(1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1)$ |
| $6$ | $(1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1)$ |
| $7$ | $(1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1)$ |
| $8$ | $(1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0)$ |
| $9$ | $(1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0)$ |
| $10$ | $(1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0)$ |
| $11$ | $(1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1)$ |

For a mask $x\in\mathbb F_2^{23}$ let $s_j(x)=\sum_{i\in S_j}x_i\pmod2$ and encode $s(x)=\sum_{j=0}^{10}2^js_j(x)$. Enumerate supports first by weight $0,1,2,3$ and then lexicographically. The Golay syndrome lemmas give a unique mask $L(s)$ in this list for every $s\in\{0,\ldots,2047\}$. This is the complete $2048$-entry correction table, defined by the displayed binary matrix and finite enumeration.

The following deterministic binary encoder fixes the control words. To complete a linearly independent ordered column list in $\mathbb F_2^n$, append $e_0,e_1,\ldots,e_{n-1}$ in that order whenever the rank increases, stopping at $n$ columns. Binary rank elimination uses the highest nonzero coordinate as pivot. For the resulting matrix, process columns $j=0,\ldots,n-1$: choose the first pivot row $k\ge j$; swap rows $j,k$ by the three row additions $j\to k,k\to j,j\to k$ if they differ; then add row $j$ to every other row with a one in that column, in increasing row order. The final matrix is the identity. Reversing this ordered list of row additions gives a CNOT encoder for the original columns.

The raw $23$-coordinate encoder uses the all-one column followed by the eleven rows of $H$, read as columns, completed by this rule. The $15$-coordinate distillation encoder starts with the all-one column followed by the four columns $((x\!\mathbin{\mathrm{div}}2^j)\bmod2)_{x=1}^{15}$, $j=0,1,2,3$, and applies the same completion. These definitions fix all routing coordinates and inverse words.

**Syndrome service and its finite stopping rules.** One quantum layer is a displayed simultaneous finite gate list; a Boolean control block of size $c$ costs exactly $c$ controller ticks. A measurement supplies its actual instrument bit, never a forecast of that bit.

A cat attempt in block $b$ prepares coordinates $23,\ldots,30$ and verifier $31$ in zero, applies $H$ at $23$, then CNOT from $23$ to each of $24,\ldots,30$ in increasing order. Perform four sweeps over those seven coordinates. At each sweep position reset $31$, apply CNOT from $23$ to $31$ and from that position to $31$, measure $Z_{31}$, and use two control ticks. Add $32$ control ticks after the four sweeps. Accept the first attempt whose $28$ recorded bits all vanish. A rejected attempt resets all nine cat/verifier coordinates in one layer. Four rejected attempts give a retained abort.

For an accepted cat, couple its first eight coordinates in order to the support $S_j$ by CNOT for an $X$ check and CZ for a $Z$ check, in one layer. Measure all eight cat coordinates in the $X$ basis sequentially, use eight control ticks, reset all cat/verifier coordinates in one layer, and return the parity of those actual eight bits. A syndrome round performs all eleven $X$ checks and then all eleven $Z$ checks in row order.

Extraction performs at most sixteen such rounds, with $64$ control ticks after each. It stops at four consecutive identical complete syndromes. Failure to reach that condition is a retained abort. If the final syndrome is $(s_0,\ldots,s_{21})$, set
$$
 s_X=\sum_{j=0}^{10}2^js_{j+11},\qquad s_Z=\sum_{j=0}^{10}2^js_j.
$$
Use $2^{20}$ control ticks for the two complete leader-table scans and bookkeeping. Apply $X$ on the support of $L(s_X)$ in one layer and $Z$ on the support of $L(s_Z)$ in one layer; replace an empty layer by one idle at coordinate zero. This preserves the CSS convention that the $X$ stabilizers detect $Z$ errors.

Raw magic preparation places the supplied $A$ state at coordinate zero, zeroes coordinates $1,\ldots,22$, applies $H$ to $1,\ldots,11$ in one layer, performs the raw encoder CNOT word and extracts. Zero preparation zeroes all $23$ coordinates, performs one syndrome round and then extraction. Plus preparation additionally applies transversal $H$ and extracts again. A destructive logical $X$ or $Z$ read measures the corresponding basis at all $23$ coordinates, uses $2^{20}$ control ticks, replaces the measured mask $x$ by $x\oplus L(s(x))$, and returns its parity.

To decode for the private terminal link, extract, perform the inverse raw-encoder CNOT word, then apply $H$ at coordinates $1,\ldots,11$ in one layer. Coordinate zero contains the decoded output, the other $22$ coordinates return to zero up to the common phase. This paid decoder is a separate adapter from the protected-core fault guarantee; its actual locations are fault-free under the stated one-marked-location law.

**Routing and protected execution.** A neighboring block swap is three transversal CNOT layers in directions $a\to b,b\to a,a\to b$. To route CNOT from $a$ to fixed target $b$, swap the control along successive nearest neighbors until adjacent to $b$, apply the transversal CNOT, then undo all swaps in reverse order. Thus block coordinates are restored after every routed operation.

For $W$ data blocks let $B=W+40$. Initially reserve blocks $0,\ldots,W-1$ and mark none live. Factory allocation takes the lowest available blocks in $W,\ldots,B-1$. Discard resets all $40$ physical coordinates in one layer, uses $4096$ control ticks, removes the live mark and releases a factory block. Before and after every basic operation extract every live block in increasing order. Basic zero/plus preparation uses the preceding service and marks the block live. A destructive read removes its live mark and extracts all remaining live blocks afterward. Reset uses discard. CNOT uses the fixed routing. Idle is transversal on all $23$ code coordinates. The transversal physical representative of logical $S$ is $S^\dagger$, and that of logical $S^\dagger$ is $S$; other one-qubit Clifford operations act transversally. The marked logical $X$ uses the distinguished marked-$X$ primitive at coordinate zero and ordinary $X$ at the other $22$ coordinates.

Raw factory allocation uses one block and $4096$ control ticks, with extraction of the current live blocks before and after its raw-magic preparation. Magic injection performs basic CNOT from data to resource, destructive basic $Z$ read of the resource, basic reset of that resource, and two control ticks; on bit one perform basic $S$ on the data and on bit zero perform a basic idle.

A level-$\ell$ distillation node allocates fifteen blocks and uses $4096$ control ticks. Prepare its first five blocks plus and the other ten zero, perform the $15$-coordinate encoder through basic routed CNOTs, and inject a resource into each block in order. For $\ell=1$ each resource is raw; for $\ell=2$ each is from a level-one factory. Undo the encoder, destructively read $X$ on blocks $1,2,3,4$, use eight control ticks and reset blocks $1,\ldots,14$. Any nonzero check bit also resets block zero and returns failure. Otherwise basic $S$ on block zero completes the returned resource. A factory tries at most four nodes, with eight control ticks after each; four failures give a retained abort. Only levels one and two occur.

The logical alphabet is
$$
 \{\mathrm{PREP0},\mathrm{PREPPLUS},H,S,S^\dagger,X,Z,M_X,M_Z,
 \mathrm{RESET},\mathrm{IDLE},T,T^\dagger,\mathrm{FIRST\_MARKED\_X},\mathrm{CNOT}\}.
$$
All operations have one valid data address except CNOT, which has two distinct addresses in $\{0,\ldots,W-1\}$. Invalid words are outside the grammar. Each valid logical operation first uses $4096$ control ticks. A $T$ or $T^\dagger$ uses a level-two resource and injection; $T^\dagger$ additionally applies basic $S^\dagger$. Other operations use the basic service, except the nominated terminal $Z$ read: after its physical correction/decoder, remove its live mark and obtain the actual coordinate-zero bit from the private terminal link. Retain destructive measurement results in their event order. An abort resets all reserved blocks in increasing order and uses $4096(B+1)$ control ticks before returning its retained abort record. All allocated factors remain owned on every branch.

The unprotected comparison uses the same logical word on cell zero, all eighteen nominated wires in its forty coordinates, and resource coordinate $39$. Its $T$ service prepares a raw $A$ state there, uses CNOT from the data wire, measures $Z_{39}$, uses two control ticks, performs $S$ or idle on the actual bit, and resets $39$; $T^\dagger$ adds $S^\dagger$. Its nominated terminal read uses the same private-link service. It retains all other measurement outputs and returns them in order. Thus neither branch acquires an unowned ideal native $T$ gate.

#### 4. Clifford–T LITE word

**The exact finite LITE word.** Take input wires $(n,1,0)$ with $n\in\{0,1\}$ and the ordered NAND pairs
$$
 (0,0),(3,3),(2,2),(5,5),(6,6),(4,7),(8,8),(1,1),(10,10).
$$
Append one output wire per pair, beginning at wire $3$. The resulting wires $9,11$ have values $n,1$. There are $d=3$ input wires, $s=9$ NANDs, $w=2$ outputs and $W=d+s+w+4=18$ total wires. Output wires are $12,13$ and parity workspace is $14,15,16,17$.

The exact Toffoli word on distinct controls $a,b$, target $c$ and zero parity wires $x,y,z,v$ is $H_c$, followed by the parity word
$$
 C_{a,x}C_{b,x}C_{a,y}C_{c,y}C_{b,z}C_{c,z}C_{a,v}C_{b,v}C_{c,v},
$$
then $T_aT_bT_cT_vT_x^\dagger T_y^\dagger T_z^\dagger$, the inverse parity word, and $H_c$. Products here are listed in execution order. Coincident controls give the single CNOT $C_{a,c}$. The phase identity
$$
 4abc\equiv a+b+c+(a\oplus b\oplus c)
 -(a\oplus b)-(a\oplus c)-(b\oplus c)\pmod8
$$
proves controlled-controlled $Z$ before the two Hadamards and therefore proves this Toffoli word, with every parity wire restored.

Prepare all eighteen wires zero, apply $X_0$ when $n=1$ and an idle there when $n=0$, then apply $X_1$. For NAND pair $(a,b)$ at position $j$, append $X_{3+j}$ and the stated Toffoli with that target. Let $F$ be this complete forward word. The remainder is
$$
 F\,C_{9,12}C_{11,13}\,F^{-1}\,X_{12}\mathrm{FIRST\_MARKED\_X}_{12},
$$
followed by $Z$ reads of wires $12,13$ and resets of all eighteen wires in increasing order. Inverse words reverse gate order and interchange $T,T^\dagger$ and $S,S^\dagger$; the remaining gates in $F$ are self-adjoint. There are exactly $132$ operations for each input, with conservative bound $G=548$. The nominal marked-$X$ handshake is the identity, so the exact output is $(n,1)$. This finite word, rather than a numerical state simulation, supplies the complete two-case record.

#### 5. Finite command tree and runtime traversal

**Finite command tree and local control word.** Expand each control block of $c$ ticks into $c$ separate delay events. Expand the protected or unprotected execution just defined, responding to every measurement by its actual bit. The input $n$ and technology $U$ or $F$ are immutable source bits. A binary path labels a command-tree vertex. At a measurement vertex its next edge is the actual bit; at a nonmeasurement vertex only edge zero is allowed. After a return, abort, halt, or invalid/unreachable continuation, the command is halt. This recursion defines every vertex by its finite path, without predicting a future instrument result. Heap index $i\ge1$ denotes the path given by the binary expansion of $i$ after its leading one. All indices $1\le i<2^{H+1}$ are included in the finite source tree.

For an even line of $M\ge2$ cells, one visited vertex has the following complete microcycle. Each item below costs one calibrated tick; sweeps use the indicated increasing or decreasing cell order.

1. Swap the accumulator with a fresh zero at cell zero, retaining its former state.
2. Sweep $j=0,\ldots,M-1$. At each cell latch the visit, execute its preloaded local instrument and copy the endpoint result into a local record. Between successive cells swap the head to $j+1$.
3. Sweep $j=M-1,\ldots,0$, copying the actual bit only at its tagged measurement cell, and swapping the head toward zero between successive cells. The default bit at a nonmeasurement vertex is zero.
4. Sweep $j=0,\ldots,M-1$, copying that choice into a fresh local flag. Relocate the forty active factors by three parallel-CNOT layers in the directions parent-to-child, child-to-parent, parent-to-child. Seal the retired parent record and move the head forward between successive cells.
5. Return the head from $M-1$ to zero, then move it to the child selected by the actual bit.
6. Perform twenty full endpoint-to-endpoint sweeps of $M$ ticks, alternating direction, then thirty-five local idle ticks at zero.

The counts are $1$, $4M-1$, $2M-1$, $6M-1$, $M-1$, $1$, $20M$ and $35$, whose sum is exactly $33M+33$. This count includes both the return sweep and the final child transition. Fresh visit, branch and head targets are never reset or reused; private service flags occupy a separate lane with no readable controller port.

For each quantum layer, its local command retains its one-cell gates and those neighboring CNOT/CZ gates owned by the smaller endpoint. The other endpoint has no duplicate gate command. Addresses of a cross-cell gate are relative to that owner; a nonneighboring gate is invalid. Each local command contains at most forty gates. An empty command is an idle. The private terminal-link read occurs at its nominated cell; a return, abort, retained output bit or halt record is handled at cell zero and is idle elsewhere. Each cell stores the four commands selected by $(n,U),(n,F)$ for $n=0,1$. All are fixed before execution.

For a generic finite logical word, the same protected expansion omits the special private-link adapter. Its returned bits are emitted one at a time into distributed retained one-bit records and followed by halt. It uses the same measurement-branch tree rule. This generic mode supplies protected finite-word execution without enlarging the nominated private handoff or PCE comparison ports.

#### 6. Full stock and clock recurrence

**Complete source stock and clock.** For arbitrary finite $W,G\ge1$, define
$$
 B=W+40,\quad M=B+(B\bmod2),\quad E=2^{31},\quad U=150010,
$$
$$
 L_{\mathrm{core}}=(4B+4)EUG,\qquad
 H=L_{\mathrm{core}}+E+2^{22}(B+G+1)+4096,
$$
$$
 V=2^{H+1}-1,\quad C=MV,\quad Q=40C,\quad
 K=33M+33,\quad L=K(H+1),\quad N=QL.
$$
These are finite integers defined by addition, multiplication and integer exponentiation, with no materialization cutoff in the source definition. The full tree and all idle/control/transport ticks are retained. The maximum MPU degree is five and becomes six on including each cell's private local provider. Each cell owns at most $1048576$ readonly-ROM bits and $4096$ one-use local stock qubits, including operation pointers, blanks, retained old states and the private transport lane. This is an exponential full-source stock, not a polynomial-memory estimate.

Set
$$
 p_{\mathrm{th}}=\frac1{2N^2},\qquad q=\frac1{16N^2}=p_{\mathrm{th}}/8.
$$
Then $\binom N4p_{\mathrm{th}}^3\le1/(192N^2)<1$. Every potential marked vertex has its own independent private Bernoulli-$q$ flag; all other flags are good. A realized path visits one marker and therefore has at most one actual fault. The outer window is the fixed predictive capacity-fourteen horizon plus $L\tau$. Delivery remains sealed until that endpoint. This start time is independent of $h$; disjoint longer-$h$ predictive factors may continue afterward. All resources are finite for each nominated instance.

For the concrete word $W=18,G=548$, these formulas give
$$
 B=M=58,\quad L_{\mathrm{core}}=41662242081933885440,
 \quad H=41662242086627315712,
$$
$$
 K=1947,\qquad L=81116385342663383693211,
 \qquad V=2^{41662242086627315713}-1,
$$
$$
 C=58V,\quad Q=40\cdot58V,\quad N=40\cdot58V\cdot81116385342663383693211.
$$
The logical-core-only comparison instead has $Q_{\mathrm{core}}=2320$ and
$N_{\mathrm{core}}=96656401630086614220800$. It is not substituted for the full $Q,N$ in the source threshold.

#### 7. Finite PA proof instance

**The specified finite arithmetic proof instance.** Let $\overline0=0$ and $\overline{n+1}=S\overline n$. The target formula is
$$
 \tau(\beta,n)=(\overline\beta=\overline\beta)\land(\overline n=\overline n).
$$
Proof code one denotes exactly three natural-deduction lines: reflexivity of $\overline0$, reflexivity of $\overline1$, then conjunction introduction from those two preceding lines. Code zero is not a proof. Hence, on this finite proof-code interval, code one proves precisely $\tau(0,1)$ and neither code proves a negation of any target. Other proof codes retain the original full PA checker of Theorem A.4.1e; the finite instance does not replace it by a truth oracle.

For $\beta=0$, use cutoff zero at $n=0$ and cutoff one at $n\ge1$. The prioritized three-branch value is $n+2$ when an allowed proof of $\tau(0,n)$ exists, $n+3$ when an allowed proof of its negation exists, and $n+1$ otherwise. This gives:

| $n$ | $\beta$ | Cutoff | Positive proof | Negative proof | Branch | Output |
|---:|---:|---:|---|---|---:|---:|
| $0$ | $0$ | $0$ | no | no | $3$ | $1$ |
| $1$ | $0$ | $1$ | yes | no | $1$ | $3$ |
| $2$ | $0$ | $1$ | no | no | $3$ | $3$ |
| $3$ | $0$ | $1$ | no | no | $3$ | $4$ |
| $4$ | $0$ | $1$ | no | no | $3$ | $5$ |
| $5$ | $0$ | $1$ | no | no | $3$ | $6$ |
| $6$ | $0$ | $1$ | no | no | $3$ | $7$ |
| $7$ | $0$ | $1$ | no | no | $3$ | $8$ |

The physical input domain is $\{0,1\}$. The nine ordered NANDs in the LITE construction above compute its exact two-bit outputs, using one variable and two owned fixed input bits. The base compiler bound is $544$, with two extra input-$X$/idle slots and two marked-handshake slots, giving $G=548$ and $W=18$ as stated.

#### 8. Internal finite data record `LITE-LOGICAL-WORD.json`

The preceding gate composition specifies both complete $132$-operation words, with $W=18$, $G\le548$ and respective outputs $(0,1)$ and $(1,1)$. Preparation order, the shared parity workspace, inverse-word order, marked handshake and terminal resets are all included.

#### 9. Internal finite data record `LITE-INSTANCE-CHECK.json`

The arithmetic table, NAND word and core/full-source stock formulas above give every value of the finite instance; the logical-only and full-source censuses have their distinct meanings.

#### 10. Internal finite data record `SOURCE-LEDGER.json`

The arithmetic table, NAND word and core/full-source stock formulas above give every value of the finite instance; the logical-only and full-source censuses have their distinct meanings.

<a id="theorem-a02-conditional-effective-property-r-at-a-certified-pce-optimum"></a>**Theorem A.0.2 (Conditional Effective Property R at a Certified PCE Optimum)**
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

<a id="lemma-a01-contractivity-of-composite-refresh-branch-channel"></a>**Lemma A.0.1 (Contractivity of Composite Refresh-Branch Channel):** Suppose the uncorrected physical implementation of a nontrivial logical gate contains elementary ND-RID channels
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

<a id="definition-a02-baseline-logical-gate-error"></a>**Definition A.0.2 (Baseline Logical Gate Error):** The inherent error probability of uncorrected implementation relative to the ideal gate is
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

<a id="theorem-a03-strictly-positive-baseline-error-on-the-refresh-branch-implementation"></a>**Theorem A.0.3 (Strictly Positive Baseline Error on the Refresh-Branch Implementation):** If the uncorrected implementation satisfies Lemma A.0.1, then
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

<a id="proposition-a04-reliability-cost-lower-bound-on-a-converse-certified-branch"></a>**Proposition A.0.4 (Reliability-Cost Lower Bound on a Converse-Certified Branch).** In addition to QEC Compatibility, suppose the retained protected-computation branch carries a constant $A>0$ such that every admissible implementation of overhead $C$ has logical error bounded below by
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

<a id="lemma-a04a-logarithmic-redundancy-for-majority-vote-decoding"></a>**Lemma A.0.4a (Logarithmic Redundancy for Majority-Vote Decoding).**
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

<a id="remark-a04b-achievable-redundancy-overhead"></a>**Remark A.0.4b (Achievable Redundancy Overhead).**
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

<a id="definition-a03-reliability-cost-contribution"></a>**Definition A.0.3 (Reliability Cost Contribution):** The cost of added complexity contributes to PCE potential via physical operational cost function $R(C)$ (Definition 3):
$$
V_{\text{rel}}(p_{\text{err}}) := \lambda R(C_{\text{err}}(p_{\text{err}})) \approx \lambda r_p(T_{\text{eff}})\, \left[ A \ln\left(\frac{p_{\text{err},0}}{p_{\text{err}}}\right) \right]^{\gamma_p} \quad \text{(A.0.4)}
$$
where $\gamma_p>1$ and $r_p(T_{\text{eff}})>0$ (Definition 3a), with $T_{\text{eff}}$ treated as fixed in this appendix.

<a id="lemma-a02-divergence-of-reliability-cost-in-the-exact-power-law-model"></a>**Lemma A.0.2 (Divergence of Reliability Cost in the Exact Power-Law Model):** Assume
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

<a id="theorem-a04-performance-degradation"></a>**Theorem A.0.4 (Performance Degradation):** For computation involving $T$ logical gate applications, if each gate has failure probability at most $p_{\text{err}}$, then
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

<a id="lemma-a04c-success-probability-lower-bound-without-independence"></a>**Lemma A.0.4c (Success Probability Lower Bound Without Independence).**
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

<a id="definition-a04-effective-complexity-on-the-independent-equal-error-branch"></a>**Definition A.0.4 (Effective Complexity on the Independent Equal-Error Branch):** Assume the $T$ logical-gate failure events are mutually independent and each has probability exactly $p_{\text{err}}$. Define
$$
C_{\text{eff}}(p_{\text{err}})
:=
C_{\text{alloc}}P_{\text{succ}}(T,p_{\text{err}})
=
C_{\text{alloc}}(1-p_{\text{err}})^T
\quad \text{(A.0.7)}
$$
On branches without independence or equal failure probabilities, $P_{\text{succ}}$ is the actual joint success probability and Theorem A.0.4 supplies only the corresponding lower bounds.

<a id="proposition-a05-error-induced-benefit-loss"></a>**Proposition A.0.5 (Error-Induced Benefit Loss):** On the independent equal-error branch of Definition A.0.4, let $T\ge1$, $\Gamma_0>0$, $C_{\mathrm{alloc}}>0$, and assume $PP$ is differentiable with $PP'(c)>0$ on $0<c\le C_{\mathrm{alloc}}$. Define
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

<a id="definition-a05-total-error-potential"></a>**Definition A.0.5 (Total Error Potential):**
$$
V_{\text{tot}}(p_{\text{err}}) := V_{\text{rel}}(p_{\text{err}}) + V_{\text{err}}(p_{\text{err}}) \quad \text{(A.0.10)}
$$
defined on $(0, p_{\text{err},0}]$.

<a id="theorem-a05-existence-of-an-optimal-error-rate-uniqueness-under-dominant-cost-convexity"></a>**Theorem A.0.5 (Existence of an Optimal Error Rate; Uniqueness under Dominant Cost Convexity)**
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
Continuity makes $V_{\mathrm{tot}}$ continuous on the compact interval $[\epsilon,p_{\mathrm{err},0}]$. To see that it attains a minimum there, choose a minimizing sequence; compactness gives a convergent subsequence and continuity makes its limit attain the infimum. The displayed strict inequality excludes every point in $(0,\epsilon]$ from being a global minimizer, so this is a minimizer on $(0,p_{\mathrm{err},0}]$.

If two distinct minimizers $p_1,p_2$ existed under strict convexity, then
$$
V_{\mathrm{tot}}\!\left(\frac{p_1+p_2}{2}\right)
<\frac{V_{\mathrm{tot}}(p_1)+V_{\mathrm{tot}}(p_2)}2,
$$
contradicting minimality. Thus the minimizer is unique. At an interior differentiability point, Fermat's elementary difference-quotient argument gives $V_{\mathrm{tot}}'(p_{\mathrm{err}}^*)=0$. ∎

<a id="theorem-a05a-exact-three-bit-reliability-converse-and-unique-nonzero-optimum"></a>**Theorem A.0.5a (Exact Three-Bit Reliability Converse and Unique Nonzero Optimum).** Encode a uniform source bit as $b\mapsto(b,b,b)$, transmit the three coordinates through independent binary symmetric channels of crossover probability $p\in(0,p_0]$, where $p_0<1/2$, and decode by majority. Then the exact logical error probability is
$$
P_3(p)=3p^2(1-p)+p^3=3p^2-2p^3.
\tag{A.0.10a.1}
$$
Among all decoders from the received word to one bit, majority is the unique Bayes-optimal decoder and every decoder has error at least $P_3(p)$.

Let $A,B>0$ have common cost-rate units and define the registered reliability objective
$$
V_{A,B}(p)
=A\log\!\frac{p_0}{p}+B P_3(p).
\tag{A.0.10a.2}
$$
If
$$
0<A<6Bp_0^2(1-p_0),
\tag{A.0.10a.3}
$$
then $V_{A,B}$ has a unique minimizer $p^*\in(0,p_0)$, characterized exactly by
$$
A=6B(p^*)^2(1-p^*).
\tag{A.0.10a.4}
$$
It is strictly nonzero and obeys
$$
\sqrt{\frac{A}{6B}}
<p^*
<\sqrt{\frac{A}{6B(1-p_0)}},
\tag{A.0.10a.5}
$$
so, because $P_3$ is strictly increasing on $(0,1/2)$, substitution of the two endpoints in (A.0.10a.1) gives explicit strict lower and upper residual-error bounds.

*Proof.* Conditional on a received word of Hamming weight $j$, the likelihood ratio of source bit $1$ to source bit $0$ is $((1-p)/p)^{2j-3}$. Since $p<1/2$ and $3$ is odd, this ratio is never one: the unique Bayes decision is $1$ exactly for $j\ge2$, which is majority. Under source bit $0$, an error is therefore exactly the event of two or three flips, giving (A.0.10a.1); symmetry gives the same error under source bit $1$. Pointwise Bayes optimality proves the converse for every decoder and its uniqueness.

Differentiation gives
$$
V_{A,B}'(p)=-\frac Ap+6Bp(1-p),
\qquad
V_{A,B}''(p)=\frac A{p^2}+6B(1-2p)>0
$$
on $(0,p_0]$. Thus the objective is strictly convex. Its derivative tends to $-\infty$ as $p\downarrow0$, while (A.0.10a.3) makes $V_{A,B}'(p_0)>0$. The intermediate-value theorem and strict convexity give one interior critical point and make it the unique global minimizer. Rearranging its stationarity equation gives (A.0.10a.4). Since $1-p^*<1$ and $1-p^*>1-p_0$, that identity gives (A.0.10a.5). Finally $P_3'(p)=6p(1-p)>0$, so the stated residual bounds follow. ∎

The encoder, iid physical bit-flip kernel, majority recovery map, exact converse, cost units, optimizer, and residual interval are all part of this fixed comparison class.

<a id="corollary-a02-scaling-of-the-reduced-stationarity-model"></a>**Corollary A.0.2 (Scaling of the Reduced Stationarity Model)**
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
The ratio in the preceding display tends to one, while its denominator $K(\ln T)^a/T$ tends to zero. Therefore $p_T\to0$ and, in particular, $p_T<1/2$ for all sufficiently large $T$, proving the final assertion. This corollary applies to the reduced equation (A.0.11); deriving that equation from the full $V_{\mathrm{tot}}'(p)=0$ condition requires a separate uniform approximation bound for $(1-p)^T$ and $PP'(C_{\mathrm{eff}}(p))$. ∎

**Epistemic Status:** The derivation relies on:
1.  **QEC Compatibility Certificate $\mathfrak C_{\mathrm{QEC}}$ or Golay-QEC Bootstrap Record $\mathfrak C_{\mathrm{GQEC}}$:** The former QEC-compatibility assumption is a finite certificate gate. It must record the retained noise model, locality window, implementable code and recovery instruments, threshold inequality, and PCE benefit gap before the SPAP/RUD reliability claim is promoted. The Golay witness of Proposition Z.13b.7 supplies the code-theoretic part only when embedded in the physical syndrome/recovery/threshold record of Definition A.0.1q.1. It is not supplied by the existence of finite ND-RID links or by the abstract Golay code alone.
2.  **Dominant Cost Convexity:** Reasonable given Definition 3's superlinear resource costs for high reliability, but requires explicit verification for specific cost functions.

Alternative substrates or branches that fail the direct QEC certificate, the Golay-QEC bootstrap record, or Dominant Cost Convexity do not support the protected-computation version of Property R used by the noise-robust SPAP and RUD arguments.

### A.0.5 Network Composition and Full Property R

On the registered SPAP realization satisfying (O1)–(O3), (FC), Hilbert distinguishability, and the complexity-capacity bridge, an MPU can carry the three-bit context register of Proposition A.0.3. Theorem A.0.6 supplies full Property R through network composition under its independent memory, coding, and protected-execution certificates.

<a id="proposition-a06-compositional-enhancement"></a>**Proposition A.0.6 (Compositional Enhancement)**
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

<a id="theorem-a06-conditional-network-universality-with-explicit-overhead-scope"></a>**Theorem A.0.6 (Conditional Network Universality with Explicit Overhead Scope)**
A network of $n$ MPUs, operating with error rate $p_{\text{err}}^*$ satisfying robustness conditions and with sufficient additional resources for working memory, error-correction overhead, and circuit execution, can realize full Property R. More precisely:
1.  **Representation:** Use a declared machine format with $k\ge2$ ordered states, $m\ge2$ ordered tape symbols, and specified start, halting, blank-symbol, and movement conventions. Encode each positive integer $r\in\{k,m\}$ by $\lfloor\log_2r\rfloor$ zero bits followed by its ordinary binary numeral. These two self-delimiting dimension headers precede the $km$ uniformly sized transition entries. The resulting description length is
    $$
    L_{TM}
    =
    2\lfloor\log_2k\rfloor+2\lfloor\log_2m\rfloor+2
    +km\bigl(\lceil\log_2k\rceil+\lceil\log_2m\rceil+1\bigr)
    =
    \Theta(km\log(km)).
    $$
    The number of 3-bit MPU carriers required by this encoding is
    $$
    n_{\mathrm{desc}}=\left\lceil\frac{L_{TM}}3\right\rceil
    =\Theta(km\log(km)).
    $$
    This count concerns description storage only; it is neither the total simulation resource nor a lower bound against all compressed descriptions.
2.  **Simulation/Reason:** By the Solovay–Kitaev theorem (Kitaev 1997; Dawson and Nielsen 2006) and the accepted $\mathfrak C_{\mathrm{QEC}}$ for the retained noise model and code family, or an accepted $\mathfrak C_{\mathrm{GQEC}}$ discharging it on the protected window, the network can implement the protected finite gate approximations required by the target computation with the certified overhead. Since quantum computers efficiently simulate classical computation, the network can simulate any Turing machine once the required working-memory, code-overhead, and execution resources are available.
3.  **Evaluate Predicates:** Fault-tolerance ($p_{\text{err},0} < p_{\text{th}}$ inside $\mathfrak C_{\mathrm{QEC}}$, or inside $\mathfrak C_{\mathrm{GQEC}}$ when it discharges that certificate) ensures logical error rates can be suppressed to the certified target values with the recorded overhead, enabling reliable execution of the finite-depth predicate-evaluation circuits used in the noise-robust SPAP/RUD windows.

*Proof.* In a dimension header, count the initial zero bits until the leading binary one and then read that many further bits. This recovers $r$, so the consecutive headers determine $k,m$ and all transition-entry widths. Their lengths are $2\lfloor\log_2k\rfloor+1$ and $2\lfloor\log_2m\rfloor+1$. Each of the $km$ entries then uses $\lceil\log_2k\rceil$ next-state bits, $\lceil\log_2m\rceil$ written-symbol bits, and one movement bit, giving the displayed $L_{TM}$. The header is $O(\log k+\log m)$ and the payload is $\Theta(km\log(km))$, so the total has the stated asymptotic order. Packing the description into three-bit carriers gives $n_{\mathrm{desc}}=\lceil L_{TM}/3\rceil$. The theorem separately assumes sufficient working memory and execution resources, so this description count is not used as a bound on the total network size.

For item 2, the accepted protected-gate ledger supplies a finite gate set $G\subset SU(d)$ that generates a dense subgroup, is closed under inverses, and is implementable on the protected code space. Let $U\in SU(d)$ be any target gate appearing in the finite simulation circuit and let $0<\epsilon<1$ be its recorded approximation tolerance. The Solovay–Kitaev theorem (Kitaev, 1997; Dawson and Nielsen, 2006) applies to $(G,U,\epsilon)$ and gives a word in $G$ whose operator-norm error is at most $\epsilon$, with polylogarithmic word length in $1/\epsilon$. Applying this construction to each gate of the finite reversible classical simulation circuit gives the protected finite gate approximation asserted in item 2. The working-memory hypothesis supplies the tape segment used during that finite computation.

For item 3, the accepted certificate $\mathfrak C_{\mathrm{QEC}}$, or the accepted bootstrap record $\mathfrak C_{\mathrm{GQEC}}$ discharging the same entries, records $p_{\mathrm{err},0}<p_{\mathrm{th}}$, an implementable syndrome/recovery instrument, and a logical-error suppression and overhead bound for the nominated finite circuit. Thus reliability is an explicit certificate consequence for that noise model, code family, and circuit window; no uncited threshold theorem is used to extend it to a different model. The representation, protected simulation, and reliable predicate-evaluation clauses are therefore established under exactly the theorem's declared resource and certificate hypotheses. ∎

<a id="corollary-a03-resource-requirements-for-spaprud"></a>**Corollary A.0.3 (Resource Requirements for SPAP/RUD)**
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

<a id="definition-a06-effective-operational-property-r-refined"></a>**Definition A.0.6 (Effective Operational Property R - Refined)**
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
*   **Concrete witnesses:** The companion pure-$\mathbf S$ operational object supplies exact fixed-universal-machine execution, and Corollary 2a supplies Proposition 2(ii)'s universal-interpreter entry when the stated effective source-trace interface is present; Appendix A.4's LITE construction supplies bounded self-referential verifier presentations. Full Property R and physical realization retain their additional owning hypotheses.

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

For an MPU network satisfying the optimizer, robustness, QEC, protected-execution, diagonal-closure, and resource certificates stated in Theorems A.0.2 and A.0.6, the formal self-reference machinery applies to the covered physical tasks and windows. Sections A.1 and A.2 derive the Self-Referential Paradox of Accurate Prediction (SPAP) and Reflexive Undecidability (RUD) under their stated class and window hypotheses.

### A.0.8 Conceptual Non-Redundancy of the Core Constraints

The framework's four core constraints — finite channel capacity (Theorem E.2), irreversible thermodynamic cost ($\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive uniform floor inferred from this entropy bound requires }H_q(P\mid R)\ge h_{\min}>0)$, Theorem 31), self-referential limitation (SPAP, Theorems 10–11), and operational accessibility (Definition K.10.1) — address distinct obstructions to physical prediction. The following thought experiments describe their intended roles:

(i) *Capacity role.* A thought experiment can stipulate unbounded channel capacity per use while also stipulating an unbiased binary reset with $\Delta S\ge k_B\ln2$, the diagonal-closure hypotheses of SPAP, and operational distinguishability. This describes the intended capacity distinction.

(ii) *Reset-cost role.* A thought experiment can stipulate finite capacity, self-referential limitation, and operational accessibility while denying a thermodynamic cost for logically irreversible operations. This describes the intended reset-cost distinction.

(iii) *Diagonal-closure role.* A hypothetical system that makes complete exact predictions without encountering the SPAP contradiction must fall outside at least one hypothesis of the applicable diagonal theorem. The missing ingredient can be retained self-coding, simulation of the nominated predictor on the retained input, decidable evaluation of the binary or threshold predicate, or admitted composition with the counter-predictive update. Omitting an antecedent describes the theorem's application boundary; it does not refute its conditional conclusion.

(iv) *Accessibility role.* A thought experiment can assign physical status to structures with no finite distinguishing protocol while retaining stipulated capacity, reset-cost, and self-reference conditions. This contrasts interpretations of physical content.

These examples illustrate distinct intended roles for the four constraints. A proof of logical independence requires a common formal background and consistent models satisfying the retained constraints while failing the targeted one; those models remain an open construction.

## A.1 Self-Referential Paradox of Accurate Prediction (SPAP)

### A.1.1 Formal Setup

*   **Formal system $\mathcal{F}$:** A consistent formal logical system (e.g., Peano Arithmetic) capable of representing computation.
*   **Predictive Models $\mathcal{M}$:** A class of models implementable within the PU framework (by MPU aggregates) possessing **Effective Operational Property R (Definition A.0.1)**.
*   <a id="prediction-function-p_f"></a>**Prediction Function $P_f$:** A function, implementable within $\mathcal{M}$, attempting to predict future states or properties.
*   **Contradiction Assumption:** Assume a predictor $P_f$ exists with perfect accuracy (deterministic case) or perfect probability matching (probabilistic case).

### <a id="a12-theorem-a11-deterministic-spap-theorem-10"></a>A.1.2 Theorem A.1.1 (Deterministic SPAP = Theorem 10)

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

### <a id="a13-theorem-a12-noise-robustness-deterministic-spap"></a>A.1.3 Theorem A.1.2 (Noise Robustness - Deterministic SPAP)

Let the conditions of Theorem A.1.1 hold and fix a deterministic predictor $P_f$. Construct $S_{\mathrm{noisy}}^{P_f}$ so that in cycle $t$ it reads $P_f$'s prediction $\hat\phi_{P_f,t}$ and outputs $\operatorname{NOT}(\hat\phi_{P_f,t})$ with conditional probability $1-p_{\mathrm{err}}$ and $\hat\phi_{P_f,t}$ with conditional probability $p_{\mathrm{err}}$, where $0<p_{\mathrm{err}}<1/2$. Assume the fresh-noise condition
$$
\mathbb P\!\left(
\phi_{t+1}=\hat\phi_{P_f,t}\mid h_{t-1},\hat\phi_{P_f,t}
\right)=p_{\mathrm{err}}
$$
for every admissible history $h_{t-1}$. Then
$$
\mathbb P(P_f\text{ is correct for cycles }t,\ldots,t+k-1)
\le p_{\mathrm{err}}^{k}\longrightarrow0.
\tag{A.2}
$$

*Proof.* For each cycle $r$, define
$$
C_r:=\{\phi_{r+1}=\hat\phi_{P_f,r}\},
$$
and let $\mathcal G_r$ be the $\sigma$-algebra generated by the admissible history through cycle $r-1$ together with the announced prediction $\hat\phi_{P_f,r}$. The fresh-noise hypothesis is
$$
\mathbb P(C_r\mid\mathcal G_r)=p_{\mathrm{err}}
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
p_{\mathrm{err}}\mathbb P(E_j).
\end{aligned}
$$
Induction from $\mathbb P(E_0)=1$ yields
$$
\mathbb P(E_k)=p_{\mathrm{err}}^{k}.
$$
Thus the probability of remaining correct for $k$ consecutive diagonal cycles is $p_{\mathrm{err}}^{k}$, which tends to zero because $0<p_{\mathrm{err}}<1/2$. ∎

### <a id="a14-theorem-a13-probabilistic-spap-theorem-11"></a>A.1.4 Theorem A.1.3 (Probabilistic SPAP = Theorem 11)

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

### <a id="a15-theorem-a14-noise-robustness-probabilistic-spap"></a>A.1.5 Theorem A.1.4 (Noise Robustness - Probabilistic SPAP)

Let the conditions of Theorem A.1.3 hold. Consider a system $S'_{\mathrm{noisy}}$ implementable within $\mathcal{M}$ that sets its intended outcome probability $P_{actual}(p_t)$ by Equation A.3 from the nominated predictor's output $p_t=P_f(\phi=1\mid\text{state}_t)$. Assume the implemented noise is a binary symmetric channel with constant flip probability $0\le p_{\mathrm{noise}}<1/2$, so its true conditional output probability is
$$
P_{\mathrm{true}}(p_t)=(1-p_{\mathrm{noise}})P_{actual}(p_t)+p_{\mathrm{noise}}(1-P_{actual}(p_t)).
$$
On this noise branch, no probabilistic predictor $P_f$ can make $p_t=P_{\mathrm{true}}(p_t)$ in any cycle.

*Proof:* Perfect matching requires the condition $p_t = P_{\mathrm{true}}(p_t)$ to hold. Substituting the noise model gives:
$$
p_t = (1-p_{\mathrm{noise}})P_{actual}(p_t) + p_{\mathrm{noise}}(1-P_{actual}(p_t)) \quad (\text{A.4})
$$
Now consider the rule (Equation A.3) for $P_{actual}(p_t)$:
*   Case 1: Assume the predictor outputs $p_t > 0.5$. The system rule sets $P_{actual}(p_t) = 0$. Substituting into Equation A.4 yields $p_t = (1-p_{\mathrm{noise}})(0) + p_{\mathrm{noise}}(1-0) = p_{\mathrm{noise}}$. For perfect matching, we would need $p_t = p_{\mathrm{noise}}$. However, this contradicts the initial assumption $p_t > 0.5$ because $p_{\mathrm{noise}}$ is assumed to be less than $1/2$.
*   Case 2: Assume the predictor outputs $p_t \le 0.5$. The system rule sets $P_{actual}(p_t) = 1$. Substituting into Equation A.4 yields $p_t = (1-p_{\mathrm{noise}})(1) + p_{\mathrm{noise}}(1-1) = 1-p_{\mathrm{noise}}$. For perfect matching, we would need $p_t = 1-p_{\mathrm{noise}}$. However, this contradicts the initial assumption $p_t \le 0.5$ because $p_{\mathrm{noise}} < 1/2$ implies $1-p_{\mathrm{noise}} > 0.5$.

Since neither case allows the condition $p_t = P_{\mathrm{true}}(p_t)$ to be satisfied for any $p_t \in [0, 1]$ when $0 \le p_{\mathrm{noise}} < 1/2$, perfect matching between the predicted probability and the true probability is impossible in any single cycle. Consequently, the probability of perfect matching over $k$ cycles is zero for $k \ge 1$. No probabilistic predictor can reliably match the true outcome distribution generated by such a noisy, self-referentially defined system. QED

### <a id="a16-theorem-a15-existence-of-dynamic-self-reference-operators-dsro-definition-11-justified"></a>A.1.6 Theorem A.1.5 (Existence of Dynamic Self-Reference Operators - DSRO = Definition 11 Justified)

Let $\mathcal F$ represent finite computation and use an effective formula coding with computable substitution and decidable proof verification. Choose a finite family indexed by $i=1,\ldots,r$, total computable bounds $g_i:\mathbb N\to\mathbb N$, and formula templates $\phi_i$ with computable substitution of an input and a program index. Let $\text{ProofSearch}_{\le g_i(n)}$ test proof codes $p\le g_i(n)$ in this declared coding, and let $G:\mathbb N^{r+1}\to\mathbb N$ be total computable. In the acceptable program numbering of Theorem A.4.1a, there exists a total computable function $f=\varphi_e$ satisfying the self-index equation
$$
f(n)=G\bigl(n,\text{ProofSearch}_{\le g_1(n)}[\phi_1(\ldots,e,\ldots)],\ldots,\text{ProofSearch}_{\le g_r(n)}[\phi_r(\ldots,e,\ldots)]\bigr)
\quad(\text{Appendix A.1.6, Theorem A.1.5; cf. main-text Equation (9)}).
$$

*Proof:* Define
$$
\Psi(\alpha,n)=G\bigl(n,\text{ProofSearch}_{\le g_1(n)}[\phi_1(\ldots,\alpha,\ldots)],\ldots,\text{ProofSearch}_{\le g_r(n)}[\phi_r(\ldots,\alpha,\ldots)]\bigr).
$$
Each bound $g_i(n)$ is computable. Testing the finitely many codes $0\le p\le g_i(n)$ terminates by decidable proof verification, and substitution of $(\alpha,n)$ into each template is computable. The finite family and total computability of $G$ therefore make $\Psi$ total computable.

By Kleene's Second Recursion Theorem (Theorem A.4.1a; Kleene 1938, §2, p. 153), there exists an index $\beta$ such that
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

<a id="definition-a21-d-rid-definition-6-deterministic"></a>**Definition A.2.1 (D-RID = Definition 6 - Deterministic).** A Deterministic Reflexive Interaction Dynamic system is a tuple $S=(X,Y,O,V,T)$, where $X$ is the set of states, $Y$ is the set of interactions (inputs), $O$ is the set of outcomes, $V: X \times Y \to O$ is the deterministic outcome function ($o=V(x,y)$), and $T: X \times Y \times O \to X$ is the deterministic state transformation function ($x' = T(x,y,o)$).

<a id="definition-a22-nd-rid-definition-6-non-deterministic"></a>**Definition A.2.2 (ND-RID = Definition 6 - Non-Deterministic).** A Non-Deterministic Reflexive Interaction Dynamic system is a tuple $S=(X,Y,O,V_{\text{prob}},T_{\text{prob}})$, where $X, Y, O$ are as above, $V_{\text{prob}}: X \times Y \to \Delta(O)$ is the probabilistic outcome function yielding a distribution over outcomes ($P(o | x, y) = (V_{\text{prob}}(x, y))(o)$), and $T_{\text{prob}}: X \times Y \times O \to \Delta(X)$ is the probabilistic state transformation function yielding a distribution over next states ($P(x' | x, y, o) = (T_{\text{prob}}(x, y, o))(x')$). The MPU 'Evolve' process (Definition 27) is an instance of ND-RID.

### <a id="a22-lemma-a21-behaviors-permitted-by-rid-lemma-2"></a>A.2.2 Lemma A.2.1 (Behaviors Permitted by RID = Lemma 2)

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

<a id="theorem-a23-fixed-property-deterministic-reflexive-undecidability-part-of-theorem-12"></a>**Theorem A.2.3 (Fixed-Property Deterministic Reflexive Undecidability = Part of Theorem 12)**

Let $\mathcal C_{\mathrm{DRID}}^{\bullet}$ be any effectively coded class of pointed RID instances containing every $\mathbf S_{e,w}$, with effective codes for the designated initial state, terminal-bit projection, verifier, and transition. No total interactive algorithm, given the code and registered interaction access, halts and correctly decides $\mathsf{TERM}(S,x_0)$ for every $(S,x_0)\in\mathcal C_{\mathrm{DRID}}^{\bullet}$.

*Proof.* The construction $(e,w)\mapsto\ulcorner\mathbf S_{e,w}\urcorner$ is effective. By induction on the tick count, the first component of the state after $n$ ticks is the configuration of $e(w)$ after $n$ steps, while $b_n=1$ exactly when a halting configuration has been reached by that time. Hence
$$
\mathsf{TERM}(S_{e,w},x_0)
\quad\Longleftrightarrow\quad
e(w)\text{ halts}.
$$
If a total correct interactive decider $D$ existed, compute the effective code of $\mathbf S_{e,w}$, simulate its registered interaction with $D$, and return $D$'s answer. Every requested verifier or transition response is computable from the displayed data, so this procedure would decide the halting problem. ∎

<a id="theorem-a24-fixed-property-uniformly-bounded-probabilistic-reflexive-undecidability-part-of-theorem-12"></a>**Theorem A.2.4 (Fixed-Property Uniformly Bounded Probabilistic Reflexive Undecidability = Part of Theorem 12)**

Let $\mathcal C_{\mathrm{NDRID}}^{\bullet}$ contain the pointed deterministic instances $\mathbf S_{e,w}$ as point-mass kernels. Fix a rational $0<\epsilon<1/2$. There is no probabilistic interactive algorithm $D_\epsilon$ satisfying all of the following conditions:

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

<a id="theorem-a25-rud-decision-boundary-classification"></a>**Theorem A.2.5 (RUD Decision-Boundary Classification).** For the registered terminal-reachability property, the following branches are exact.

1. If a computable horizon $B(\ulcorner S,x_0\urcorner)$ is promised to bound the first possible terminal visit, deterministic reachability is decidable by simulation through $B$.
2. If the deterministic state space $X$ is finite and explicitly listed, reachability is decidable after at most $|X|$ transitions: either a terminal state appears or a state repeats.
3. For an explicitly listed finite Markov chain with rational transition probabilities, positive-probability reachability is decidable from the directed support graph. Its exact reachability probability and comparison with a rational threshold are decidable by rational linear algebra after the nonterminal closed classes are assigned value zero.
4. Without a finite-state or computable-horizon restriction, every effectively coded class containing the instances $\mathbf S_{e,w}$ remains undecidable by Theorem A.2.3, even though each transition and each finite support list is computable.
5. Replacing rational probabilities by uniformly computable real probabilities preserves approximation with a supplied computable error modulus, but exact equality with a threshold is undecidable in general. Uniformly in a machine code $e$, define
   $$
   r_e=
   \begin{cases}
   2^{-t},&e\text{ first halts at step }t,\\
   0,&e\text{ never halts}.
   \end{cases}
   \tag{A.2.5.1}
   $$
   Then $r_e$ is a uniformly computable real, while deciding $r_e=0$ decides nonhalting.
6. If a computable approximation to a reachability probability $p$ is accompanied by a rational threshold $\theta$ and a promised gap $|p-\theta|\ge\delta>0$, the threshold comparison is decidable by approximating $p$ within $\delta/3$.

*Proof.* Items 1 and 2 are the stated finite searches. For item 3, support-graph reachability decides whether a terminal state is reachable with positive probability. Delete states that cannot reach the terminal set, set their reachability value to zero, set terminal values to one, and solve the remaining finite linear system
$$
p_x=\sum_yP(x,y)p_y.
$$
After removal of closed nonterminal classes, the solution is unique; rational coefficients give exact rational values and exact threshold comparison. Item 4 is Theorem A.2.3.

For item 5, to approximate $r_e$ within $2^{-n}$, simulate $e$ for $n$ steps. If it first halts at $t\le n$, output $2^{-t}$; otherwise output zero. A later first halt has $t>n$ and changes the value by less than $2^{-n}$, proving uniform computability. Equality with zero is equivalent to nonhalting and is therefore undecidable. For item 6, an approximation error below $\delta/3$ cannot cross a threshold separated from $p$ by at least $\delta$. ∎

The theorem classifies the finite-state, computable-horizon, rational finite-support, uniformly computable-real approximation, and Turing-complete branches of the registered reachability problem. Countably infinite support without an effective tail modulus and noncomputable transition data remain outside these decision classes. Theorems A.2.5a–A.2.5c place them exactly in the arithmetical hierarchy relative to the transition data and classify the probabilistic deciders.

<a id="theorem-a25a-countable-support-tail-moduli-and-approximation-of-rud-reachability"></a>**Theorem A.2.5a (Countable-Support Tail Moduli and Approximation of RUD Reachability).** Fix an oracle $A\subseteq\mathbb N$ and write $A':=\{k:\varphi^A_k(k)\text{ halts}\}$ for its jump. A real is left-c.e. in $A$ when it is the limit of an $A$-computable nondecreasing sequence of rationals. Write $\mathbf S^A_{e,w}$ for the construction of §A.2.3 applied to the oracle machine $\varphi^A_e$ on input $w$. Let $\mathcal C^{\omega}_A$ be the class of coded pointed ND-RID instances $(S,x_0)$ with $Y=\{\mathsf{tick}\}$, an $A$-decidable state set $X\subseteq\mathbb N$, an $A$-decidable terminal-bit projection $\pi_b$, and one-tick kernel
$$
P(x,x')
=
\sum_{o\in O}V_{\mathrm{prob}}(x,\mathsf{tick})(o)\,T_{\mathrm{prob}}(x,\mathsf{tick},o)(x')
$$
whose values are uniformly left-c.e. in $A$: one $A$-oracle program lists, for every pair $(x,x')$, a nondecreasing sequence of nonnegative rationals $P_s(x,x')$ converging to $P(x,x')$. Supports may be countably infinite, no tail modulus is supplied, and a row may satisfy $\sum_{x'}P(x,x')<1$, its deficit being sent to an absorbing state with terminal bit $0$. Write
$$
p_t:=\mathbb P_{x_0}\bigl(\exists n\le t:\ b_n=1\bigr),
\qquad
p:=\mathbb P_{x_0}\bigl(\exists n<\infty:\ b_n=1\bigr)=\lim_{t\to\infty}p_t.
\tag{A.2.5a.1}
$$
Then the following hold.

1. **Coverage.** Every kernel on a countable state space, with any terminal projection, belongs to $\mathcal C^{\omega}_A$ for an oracle $A$ coding its state set, its terminal projection and the binary expansions of its values.
2. **Normalized rows.** If $\sum_{x'}P(x,x')=1$, then every value $P(x,x')$ and a finite set $F_{x,n}$ with $\sum_{x'\notin F_{x,n}}P(x,x')<2^{-n}$ are computable from $A$ uniformly in the code, $x$ and $n$. On normalized rows the branch without a supplied tail modulus therefore coincides with the supplied-modulus branch, and when every nonterminal row is normalized, every $p_t$ is computable from $A$ uniformly in the code and $t$. The same conclusion for $p_t$ holds for rows with $A$-computable finite support lists and $A$-computable values, and for rows with $A$-computable values and an $A$-computable tail modulus.
3. **Subnormalized rows.** Computable values do not replace the tail modulus. Let $x_0$ be nonterminal with terminal absorbing successors $y_{k,s}$ and
$$
P(x_0,y_{k,s})
=
\begin{cases}
2^{-k-1},&\varphi^A_k(k)\text{ first halts at step }s,\\
0,&\text{otherwise}.
\end{cases}
\tag{A.2.5a.2}
$$
Every value is computable from $A$, while $p_1=p=\sum_{k\in A'}2^{-k-1}$ is not computable from $A$.
4. **Left-c.e. reachability.** $p$ is left-c.e. in $A$ and computable from $A'$, uniformly in the code.
5. **Temporal modulus and gap promise.** If every $p_t$ is computable from $A$ uniformly in $t$, then $p$ is computable from $A$ exactly when an $A$-computable function $\mu$ satisfies $p-p_{\mu(n)}<2^{-n}$ for every $n$. The finitely branching instance whose states $z_j$ move with probability $1/2$ to the tick simulation of $\varphi^A_j(j)$ and with probability $1/2$ to $z_{j+1}$ has $A$-computable values $p_t$ and $p=\sum_{j\in A'}2^{-j-1}$, which is not computable from $A$. On deterministic instances $p\in\{0,1\}$, so the gap-promise comparison of Theorem A.2.5(6) with $\theta=\delta=1/2$ is not decidable from $A$. The computable approximation supplied in that item is therefore a necessary premise, and when every $p_t$ is computable from $A$ it exists exactly under the displayed modulus condition.

*Proof.* The oracle named in item 1 computes every datum of the instance, so each value is computable from $A$ and in particular left-c.e. in $A$.

For item 2, the sum $\sum_{x''\ne x'}P(x,x'')$ is left-c.e. in $A$, so $P(x,x')=1-\sum_{x''\ne x'}P(x,x'')$ is also the limit of an $A$-computable nonincreasing rational sequence. A real approximable from both sides by $A$-computable monotone rational sequences is computable from $A$. Because the lower partial sums converge to one, a search over finite sets $F$ and stages $s$ halts at a pair with $\sum_{x'\in F}P_s(x,x')>1-2^{-n}$, and that $F$ satisfies $\sum_{x'\notin F}P(x,x')<2^{-n}$. Next, $p_t$ is the sum of the weights $w(\gamma)=\prod_iP(x_i,x_{i+1})$ of the first-hitting paths $\gamma=(x_0,\ldots,x_n)$ with $n\le t$, namely the paths whose last state is their first terminal state. When every nonterminal row is normalized, $1-p_t$ is the sum of the weights of the length-$t$ paths that avoid the terminal set. Both sums are left-c.e. in $A$, so $p_t$ is computable from $A$. With $A$-computable finite support lists, the first-hitting paths of length at most $t$ through listed successors form a finite $A$-computable list, and the remaining first-hitting paths have weight zero, so $p_t$ is a finite sum of products of $A$-computable values. With an $A$-computable tail modulus, truncate every row visited before tick $t$ to $F_{x,m}$; the probability of leaving the truncation within $t$ ticks is at most $t2^{-m}$, and the truncated tree is finite, so $p_t$ is approximated from $A$ to every precision.

For item 3, each value is decided from $A$ by running $\varphi^A_k(k)$ for $s$ steps. All successors are terminal, so $p=p_1=\sum_{k\in A'}2^{-k-1}$. Since $A'$ is infinite and coinfinite, this real is not a dyadic rational, and its binary expansion is the characteristic sequence of $A'$. Sufficiently fine approximations therefore determine every binary digit, so an $A$-computable approximation would decide $A'$ from $A$, which is impossible.

For item 4, distinct first-hitting paths define disjoint events, and their union is the reachability event because a trajectory that reaches the terminal set has a unique first-hitting prefix. Paths through the absorbing deficit state never reach the terminal set. Countable additivity gives
$$
p=\sum_{\gamma}w(\gamma).
\tag{A.2.5a.3}
$$
The set of first-hitting paths is $A$-decidable. List it as $\gamma^{(0)},\gamma^{(1)},\ldots$ and set $p^{\mathrm{lo}}_s:=\sum_{i<s}\prod_jP_s(x^{(i)}_j,x^{(i)}_{j+1})$. These $A$-computable rationals are nondecreasing and converge to $p$, so $p$ is left-c.e. in $A$. For each dyadic $j2^{-n}$, the assertion $p>j2^{-n}$ is $\exists s\,(p^{\mathrm{lo}}_s>j2^{-n})$ and is decided by $A'$; the largest such $j$ locates $p$ within $2^{-n}$.

For item 5, a modulus $\mu$ gives $p$ within $2^{-n}$ from an approximation of $p_{\mu(n+1)}$ within $2^{-n-1}$. Conversely, if $p$ is computable from $A$, compute a rational $r$ with $|r-p|<2^{-n-3}$, and for $t=0,1,\ldots$ compute rationals $r_t$ with $|r_t-p_t|<2^{-n-3}$ until $r_t>r-3\cdot2^{-n-3}$. The search halts because $p_t\uparrow p$, and at the halting value $p-p_t<5\cdot2^{-n-3}<2^{-n}$; monotonicity of $p_t$ makes this $t$ an admissible value $\mu(n)$. In the displayed instance, $z_j$ is reached at tick $j$, so $p_t$ is a finite dyadic sum decided by simulating the machines $\varphi^A_j(j)$, $j<t$, for at most $t$ steps, while $p=\sum_{j\in A'}2^{-j-1}$ is not computable from $A$ by the argument of item 3. Finally, $\mathbf S^A_{e,w}$ has $p=1$ when $\varphi^A_e(w)$ halts and $p=0$ otherwise, so a decision of $p>1/2$ under the promise $|p-1/2|\ge1/2$ decides $A'$ from $A$. ∎

<a id="theorem-a25b-arithmetical-classification-of-rud-threshold-problems"></a>**Theorem A.2.5b (Arithmetical Classification of RUD Threshold Problems).** On the class $\mathcal C^{\omega}_A$ of Theorem A.2.5a, let $\theta$ be rational, let $p$ be the reachability probability (A.2.5a.1) of a code, and write $\Sigma^0_n(A)$ and $\Pi^0_n(A)$ for the arithmetical classes relative to $A$.

1. **Upper bounds.** Uniformly in the code, $\{p>\theta\}\in\Sigma^0_1(A)$, $\{p\le\theta\}\in\Pi^0_1(A)$, $\{p\ge\theta\}\in\Pi^0_2(A)$, $\{p=\theta\}\in\Pi^0_2(A)$ and $\{p<\theta\}\in\Sigma^0_2(A)$.
2. **First level.** For $0\le\theta<1$, $\{p>\theta\}$ is $\Sigma^0_1(A)$-complete and $\{p\le\theta\}$ is $\Pi^0_1(A)$-complete. In particular positive-probability reachability is $\Sigma^0_1(A)$-complete and $\{p=0\}$ is $\Pi^0_1(A)$-complete.
3. **Second level.** For $0<\theta\le1$, $\{p\ge\theta\}$ and $\{p=\theta\}$ are $\Pi^0_2(A)$-complete, and $\{p<\theta\}$ is $\Sigma^0_2(A)$-complete; $\theta=1$ is almost-sure reachability. For every other rational threshold, $\{p=0\}$ excepted, each of the five sets is empty or the whole class.
4. **Reductions and jumps.** Every hardness reduction is a computable many-one reduction to finitely branching instances with transition probabilities in $\{0,\tfrac12,1,\theta,1-\theta\}$ and $A$-computable transition maps. For $A=\varnothing^{(m)}$ the four levels are $\Sigma^0_{m+1}$, $\Pi^0_{m+1}$, $\Pi^0_{m+2}$ and $\Sigma^0_{m+2}$. Deterministic $\mathsf{TERM}$ with $A$-computable transitions is $\Sigma^0_1(A)$-complete and therefore Turing-equivalent to $A'$; $A=\varnothing$ gives the $\Sigma^0_1$-completeness behind Theorem A.2.3.

*Proof.* Theorem A.2.5a(4) supplies $A$-computable nondecreasing rationals $p^{\mathrm{lo}}_s\uparrow p$. Therefore
$$
p>\theta\iff\exists s\,\bigl(p^{\mathrm{lo}}_s>\theta\bigr),
\qquad
p\ge\theta\iff\forall k\,\exists s\,\bigl(p^{\mathrm{lo}}_s>\theta-2^{-k}\bigr).
$$
The sets $\{p\le\theta\}$ and $\{p<\theta\}$ are the complements, and $p=\theta$ is the conjunction of $p\le\theta$ and $p\ge\theta$. This proves item 1.

For item 2, map $k$ to $\mathbf S^A_{k,k}$, whose reachability probability is $1$ when $\varphi^A_k(k)$ halts and $0$ otherwise. For $0\le\theta<1$ this reduces $A'$ to $\{p>\theta\}$ and its complement to $\{p\le\theta\}$. Since $A'$ is $\Sigma^0_1(A)$-complete, item 1 gives completeness.

For item 3, reduce the $\Pi^0_2(A)$-complete set $\mathrm{Inf}^A:=\{e:W^A_e\text{ is infinite}\}$, where $W^A_e$ is the domain of $\varphi^A_e$. The instance $G_e$ runs rounds $k=1,2,\ldots$. In round $k$ it advances the $A$-computable enumeration of $W^A_e$ by one stage per tick until at least $k$ elements have appeared; it then moves to a terminal absorbing state with probability $1/2$ and to round $k+1$ with probability $1/2$. If $|W^A_e|=m<\infty$, round $m+1$ never ends, so
$$
p(G_e)=\sum_{k=1}^{m}2^{-k}=1-2^{-m}<1;
\tag{A.2.5b.1}
$$
if $W^A_e$ is infinite, every round ends and $p(G_e)=\sum_{k\ge1}2^{-k}=1$. Let $H_{e,\theta}$ move from its initial state to $G_e$ with probability $\theta$ and to an absorbing nonterminal state with probability $1-\theta$. Then
$$
p(H_{e,\theta})=\theta\,p(G_e)\le\theta,
$$
with equality exactly when $e\in\mathrm{Inf}^A$. Hence $\{p\ge\theta\}$ and $\{p=\theta\}$ are $\Pi^0_2(A)$-hard and $\{p<\theta\}$ is $\Sigma^0_2(A)$-hard, and item 1 gives membership. The remaining thresholds follow from $0\le p\le1$.

For item 4, the displayed instances use only the listed probabilities and $A$-computable simulation or enumeration steps. The relativized Post theorem gives $\Sigma^0_n(\varnothing^{(m)})=\Sigma^0_{n+m}$ and $\Pi^0_n(\varnothing^{(m)})=\Pi^0_{n+m}$. On deterministic instances $\mathsf{TERM}$ coincides with $p>0$, so item 1 and the reduction of item 2 make it $\Sigma^0_1(A)$-complete, and every $\Sigma^0_1(A)$-complete set is many-one equivalent to $A'$. ∎

<a id="theorem-a25c-runtime-free-probabilistic-rud-and-necessity-of-computable-branching"></a>**Theorem A.2.5c (Runtime-Free Probabilistic RUD and Necessity of Computable Branching).**

1. Let $D$ be a probabilistic interactive algorithm whose internal and interaction nodes have uniformly enumerable countable successor lists with uniformly left-c.e. branching probabilities. No runtime bound, halting guarantee or uniform advantage is assumed. Then $D$ does not, on every instance $\mathbf S_{e,w}$, halt with the correct value of $\mathsf{TERM}(S_{e,w},x_0)$ with probability strictly greater than $1/2$. At a node whose branching probabilities sum to one, the hypothesis is uniform computability of those probabilities, by the argument of Theorem A.2.5a(2). The statement relativizes to every oracle $A$ and the instances $\mathbf S^A_{e,w}$.
2. Computability of the branching law cannot be dropped. Let $\mathcal K:=\{\langle e,w\rangle:e(w)\text{ halts}\}$ and
$$
\kappa_{\mathcal K}:=\sum_{j\in\mathcal K}2\cdot4^{-(j+1)}.
\tag{A.2.5c.1}
$$
Then $\kappa_{\mathcal K}$ is left-c.e. and not computable, so the complementary probability $1-\kappa_{\mathcal K}$ is not left-c.e. On input $j=\langle e,w\rangle$, flip a coin of bias $\kappa_{\mathcal K}$ exactly
$$
n_j:=\left\lceil\tfrac92\,16^{j+1}\ln6\right\rceil
\tag{A.2.5c.2}
$$
times, form the sample mean $\widehat\kappa$, and output $\mathsf{Yes}$ exactly when the residue of $4^{j+1}\widehat\kappa$ modulo $4$ lies in $[4/3,10/3)$. This algorithm has a computable runtime bound and decides $\mathsf{TERM}(S_{e,w},x_0)$ with probability at least $2/3$ on every instance.

Theorem A.2.4 therefore holds without its runtime bound, finite support lists and uniform advantage, with rational probabilities weakened to uniformly left-c.e. branching probabilities, and item 2 shows that this computability condition cannot be removed.

*Proof.* For item 1, fix $(e,w)$. The responses of $\mathbf S_{e,w}$ to the registered interaction are computable from its code, as in the proof of Theorem A.2.3. The finite halting paths of the joint computation–interaction tree are therefore uniformly enumerable, and distinct halting paths are disjoint events. The probability of each path is a finite product of nonnegative left-c.e. reals and is left-c.e., so
$$
q_{\mathsf{Yes}}:=\mathbb P(D\text{ halts with }\mathsf{Yes}),
\qquad
q_{\mathsf{No}}:=\mathbb P(D\text{ halts with }\mathsf{No})
$$
are left-c.e. uniformly in $(e,w)$, and $q_{\mathsf{Yes}}+q_{\mathsf{No}}\le1$. If $\mathsf{TERM}$ holds, correctness gives $q_{\mathsf{Yes}}>1/2>q_{\mathsf{No}}$; otherwise $q_{\mathsf{No}}>1/2>q_{\mathsf{Yes}}$. Run the lower approximations of both probabilities in parallel until one exceeds $1/2$ and output its label. The search halts, and it never selects the smaller probability because that probability's approximations stay below $1/2$. This decides the halting problem, contradicting Theorem A.2.3. Replacing computability by computability from $A$ gives the relativized statement.

For item 2, the construction of Theorem A.2.3 gives $\mathsf{TERM}(S_{e,w},x_0)\iff\langle e,w\rangle\in\mathcal K$. Write $\kappa_{\mathcal K}=\sum_jc_j4^{-(j+1)}$ with $c_j=2\cdot\mathbf 1_{\mathcal K}(j)$. For every $j$,
$$
4^{j+1}\kappa_{\mathcal K}=4N_j+c_j+r_j,
\qquad
N_j\in\mathbb Z,
\qquad
0\le r_j\le\sum_{m\ge1}2\cdot4^{-m}=\frac23.
$$
Put $\varepsilon_j:=4^{-(j+1)}/3$. Hoeffding's inequality and (A.2.5c.2) give
$$
\mathbb P\bigl(|\widehat\kappa-\kappa_{\mathcal K}|\ge\varepsilon_j\bigr)
\le2e^{-2n_j\varepsilon_j^2}\le\frac13.
$$
On the complementary event, $4^{j+1}\widehat\kappa$ lies within $1/3$ of $4^{j+1}\kappa_{\mathcal K}$, so its residue modulo $4$ lies in $[0,1)\cup(11/3,4)$ when $j\notin\mathcal K$ and in $(5/3,3)$ when $j\in\mathcal K$. The output is therefore correct with probability at least $2/3$, and the runtime is bounded by a computable function of $j$. Enumerating $\mathcal K$ shows that $\kappa_{\mathcal K}$ is left-c.e. If $\kappa_{\mathcal K}$ were computable, the same residue test applied to an approximation within $\varepsilon_j$ would decide $\mathcal K$. If $1-\kappa_{\mathcal K}$ were left-c.e., $\kappa_{\mathcal K}$ would be approximable from both sides and hence computable. ∎

### A.2.6 Input Representation and Continuous-Flow Reachability

Fix Newton's equations with three specified positive masses, one specified collision convention, and a specified representation of initial data. Fix a target $U$ independently of the source machine and input.

<a id="theorem-a26-representation-typed-terminal-event-transfer"></a>**Theorem A.2.6 (Representation-Typed Terminal-Event Transfer).** Suppose there is a total computable compiler $C$ such that:

1. $C(e,w)$ is a valid initial-data description in that representation.
2. The resulting autonomous three-body trajectory is defined on the interval used by the event predicate.
3. The equivalence
   $$
   \varphi_e(w)\downarrow
   \iff
   \exists t\ge0:\ \Phi_t(C(e,w))\in U
   $$
   holds for every $e,w$.

Then no total algorithm correctly decides that target-reachability question on every compiled instance.

**Proof.** Apply the alleged gravitational decider to $C(e,w)$. Totality and the displayed equivalence would decide the halting problem. $\square$

This theorem needs neither a full step-by-step simulator nor a physical implementation of the predictor's diagonal response. It needs the stated many-one reduction. A step-preserving realization of PU's registered RID family would be one sufficient way to obtain it.

The input representation is load-bearing. The next theorem supplies all three conditions under one representation, and shows why the representation must be stated before judging the significance of a proof.

#### Explicit collision-free equal-mass source

##### Input convention

A **computable-name description** of an initial condition is a finite program which, on request $n$, returns rational coordinates with error at most $2^{-n}$. The domain is promised to contain only valid total approximation programs. The proposed decider must terminate and answer correctly on every input in the declared domain, including the compiled family below.

The compiler outputs such a program. It does not output the exact algebraic minimal polynomial and isolating interval of every coordinate.

Set $G=1$ and $m_1=m_2=m_3=1$. All masses and the gravitational law are fixed. Work in the plane and fix the center of mass at the origin.

Let

$$
b_1=(1/\sqrt3,0),\quad
b_2=(-1/(2\sqrt3),1/2),\quad
b_3=(-1/(2\sqrt3),-1/2).
$$

These vectors have pairwise distances one, sum zero, and satisfy $|b_i|^2=1/3$ and $\sum_i|b_i|^2=1$.

Write $J(x,y)=(-y,x)$, and let $Q(\theta)$ denote planar rotation.

##### Uniformly computable parameter

Let $s\ge0$ be the first halting step of $\varphi_e(w)$, when it exists. Define

$$
a_{e,w}=\begin{cases}
2^{-(s+3)},&\text{if the computation first halts at step }s,\\
0,&\text{if it never halts}.
\end{cases}
\tag{A.2.7.1}
$$

This is uniformly computable as a real number. To approximate it within $2^{-n}$, simulate through step $n$. If a halt was found, return the corresponding dyadic value. Otherwise return zero. Any as-yet unseen halt has $s>n$, hence its value is at most $2^{-(n+4)}$. Every requested approximation terminates. No halting oracle is used.

Define

$$
\omega_{e,w}=\sqrt6\,(1-a_{e,w}),\qquad
q_i(0)=b_i,\qquad v_i(0)=\omega_{e,w}Jb_i.
\tag{A.2.7.2}
$$

Standard rational square-root approximation and interval arithmetic convert (A.2.7.1) into rational approximations of (A.2.7.2) with any required error. The compiler is uniform and total.

##### Exact reduction of Newton's equations

Seek a solution

$$
q_i(t)=R(t)Q(\theta(t))b_i.
\tag{A.2.7.3}
$$

Every pairwise distance is $R$. Since $\sum_iq_i=0$,

$$
\ddot q_i
=\sum_{j\ne i}\frac{q_j-q_i}{|q_j-q_i|^3}
=-\frac{3q_i}{R^3}.
\tag{A.2.7.4}
$$

Substituting (A.2.7.3) into (A.2.7.4) separates radial and angular components:

$$
\ddot R-R\dot\theta^2=-\frac3{R^2},\qquad
2\dot R\dot\theta+R\ddot\theta=0.
$$

Thus

$$
R^2\dot\theta=\ell=\omega_{e,w},\qquad
\ddot R=\frac{\ell^2}{R^3}-\frac3{R^2},
\quad R(0)=1,\quad\dot R(0)=0.
\tag{A.2.7.5}
$$

The conserved energy is

$$
E=\frac12\dot R^2+\frac{\ell^2}{2R^2}-\frac3R
=\frac{\omega_{e,w}^2}{2}-3.
\tag{A.2.7.6}
$$

It is also the total three-body energy on this normalization. This is the classical equilateral homographic reduction, derived here directly.

##### A fixed open target

Use the same simple semialgebraic target for every source program:

$$
U=\{(q_1,q_2,q_3,v_1,v_2,v_3):q_1\cdot v_1<0\}.
\tag{A.2.7.7}
$$

In the declared center-of-mass frame, this means that the first body is moving inward. On (A.2.7.3),

$$
q_1\cdot v_1=\frac13R\dot R.
\tag{A.2.7.8}
$$

<a id="theorem-a27-computable-name-three-body-reachability"></a>**Theorem A.2.7 (Computable-Name Three-Body Reachability).** There is no total algorithm which, given the compiled initial-data program (A.2.7.2), decides whether its trajectory ever enters (A.2.7.7). Every compiled trajectory has three positive equal masses, is autonomous, is collision-free for all real time, and has pairwise distance at least one.

**Proof.** There are two cases.

**No halt.** Then $a=0$, $\ell^2=6$, and $E=0$. Equation (A.2.7.6) gives

$$
\dot R^2=\frac{6(R-1)}{R^2}.
\tag{A.2.7.9}
$$

At $t=0$, $\ddot R=3>0$. The forward orbit therefore leaves $R=1$ outward. For $R>1$ the right side of (A.2.7.9) is positive and cannot vanish, so the radial velocity remains positive at every finite $t>0$. The radius tends to infinity only as $t\to\infty$; indeed $\dot R\le\sqrt6$ for $R\ge1$. This is the outgoing half of a parabolic Kepler orbit. The target is never reached.

**Halt.** Then $0<a\le1/8$, giving

$$
3<\frac{147}{32}\le\ell^2=6(1-a)^2<6,
\qquad E<0.
$$

The effective-potential equation has two radial turning points:

$$
R_{\min}=1,\qquad
R_{\max}=\frac{\ell^2}{6-\ell^2}>1.
\tag{A.2.7.10}
$$

The initial radial acceleration $\ell^2-3$ is positive. Between the two roots $\dot R^2>0$. The upper root is simple, so the travel-time integral to it is finite. At $R_{\max}$,

$$
\ddot R
=\frac{\ell^2-3R_{\max}}{R_{\max}^3}<0,
$$

because $\ell^2>3$. The motion turns inward, and (A.2.7.8) becomes strictly negative. It is an elliptic Kepler orbit with $R\ge1$ for all time.

Both cases avoid collisions. In fact, $\sum_i|v_i|^2=\dot R^2+\ell^2/R^2=2(E+3/R)\le6$ once $R\ge1$. The equations and solutions extend globally, including backward time, since separation is bounded below and velocity is bounded. We have proved

$$
\exists t>0:\Phi_t(C(e,w))\in U
\iff a_{e,w}>0
\iff\varphi_e(w)\downarrow.
\tag{A.2.7.11}
$$

Theorem A.2.6 now applies. $\square$

##### Quantitative check

For a halting instance, the semimajor axis and turnaround time are

$$
A=-\frac3{2E}=\frac1{4a-2a^2},\qquad
 t_{\mathrm{turn}}=\frac{\pi A^{3/2}}{\sqrt3}.
\tag{A.2.7.12}
$$

For first halts at steps $0,1,2$, the turnaround times are approximately $5.651677$, $15.218143$, and $42.022643$ in the chosen units. These are consistency checks on the exact derivation; finite numerical runs cannot prove undecidability.

#### Exact description, precision and duration

##### No uncomputable real is required

Every $a_{e,w}$ is either zero or a dyadic rational. Every coordinate in (A.2.7.2) is therefore algebraic as a mathematical value. Nevertheless, the compiler supplies a program computing that value, not a finite exact algebraic expression whose branch has already been selected.

There is no uniform conversion of these programs into ordinary exact algebraic-number descriptions. Such a conversion would let us compare $\omega^2$ with six and decide halting.

Consequently the phrase “the coordinates are algebraic” does not remove the representation issue. One must specify **how those coordinates are given**.

<a id="corollary-a28-exact-algebraic-input-decision-on-the-same-orbit-family"></a>**Corollary A.2.8 (Exact Algebraic-Input Decision on the Same Orbit Family).** If the initial angular speed in this family is supplied by an explicit exact algebraic-number description, target reachability is decidable: compare $\omega^2$ with six using effective algebraic-number arithmetic. A strict inequality below six gives the elliptic yes-case; equality gives the parabolic no-case. Thus changing the representation changes the decision problem even though the allowed physical trajectories are unchanged.

##### The source of the obstruction

The gravitational motion in Theorem A.2.7 is integrable. Its future distinction is already determined by the sign of the initial energy. The hard operation is exact zero-testing of the parameter supplied by an approximation program.

The same device works in the Kepler two-body problem. Thus Theorem A.2.7 cannot support an argument that adding a third body creates this particular undecidability, nor does it supply PU's read-before-commit SPAP implementation.

##### Precision and duration

A late halt produces a correspondingly tiny negative energy. As $a\downarrow0$,

$$
E=-6a+3a^2,\qquad
 t_{\mathrm{turn}}\sim\frac{\pi}{8\sqrt3}\,a^{-3/2}.
$$

The nonhalting branch lies exactly on the parabolic boundary. Arbitrarily small changes toward the elliptic side reverse the eventual answer. There is no nonzero robustness radius for that no-instance, even within the equilateral family.

If an input promise supplies a known positive separation from the energy boundary, interval refinement decides the sign after finitely many steps. That promise removes this reduction's obstruction.

The theorem uses the promised approximation-program input representation and unbounded future-event query specified above.

<a id="proposition-a28a-finite-input-coding-diagnostics"></a>**Proposition A.2.8a (Finite-Input Coding Diagnostics).** The following three statements distinguish a state-selected transition from a future-itinerary description and state the domain and precision used by an exact analytic counter code.

1. Let $B$ be a finite alphabet, let $T_b:Z\to Z$ be branch maps and let $b:Z\to B$. Set $S(z)=T_{b(z)}z$ and $F(\omega,z)=(\sigma\omega,T_{\omega_0}z)$, where $\sigma$ is the left shift. If $H:Z\to B^{\mathbb N}$ obeys
   $$
   H(z)_0=b(z),\qquad F(H(z),z)=(H(Sz),Sz),
   $$
   then $H(z)_n=b(S^nz)$ for every $n\ge0$. Conversely this itinerary formula defines an invariant graph.

2. Let $I,J$ be open intervals, with $C\subset I,D\subset J$ each having an accumulation point inside its interval. A real-analytic $f:I\times J\to\mathbb R$ that vanishes on $C\times D$ vanishes identically. Hence, on a connected analytic two-dimensional carrier chart, agreement with one affine update on such a product cylinder fixes the map throughout that chart and excludes a second incompatible affine update there.

3. For $0<\varepsilon<1/3$, the dyadic decoding intervals
   $$
   I_c=[(1-\varepsilon)2^{-c},(1+\varepsilon)2^{-c}],\qquad c\in\mathbb N,
   $$
   are pairwise disjoint. For an approximate increment at the exact code point, $q'=2^{-c-1}+e$, the additive certificate $|e|\le\delta$ guarantees $q'\in I_{c+1}$ for every admitted error exactly when
   $$
   \delta\le\varepsilon2^{-(c+1)}. \tag{A.2.8a.1}
   $$

*Proof.* In part1, graph invariance is $\sigma H(z)=H(Sz)$. Iterating and reading coordinate zero proves the formula, and direct substitution proves its converse. In part2 fix $d\in D$ and apply the one-variable identity theorem to $x\mapsto f(x,d)$ on $I$. It vanishes on all of $I$. For each $x\in I$ apply that theorem to $y\mapsto f(x,y)$ on $J$. This proves $f=0$; apply it componentwise to the difference between the map and the affine update, followed by analytic continuation on the connected chart. Equality only on a lower-dimensional subset of an unrelated higher-dimensional chart does not supply this hypothesis. In part3 adjacent intervals are disjoint because $(1+\varepsilon)/2<1-\varepsilon$. Their distance from the center $2^{-(c+1)}$ to either endpoint is $\varepsilon2^{-(c+1)}$, proving the exact certificate condition. $\square$

The graph in part1 contains the entire future branch itinerary; a program that computes it by successively simulating $S$ is that representation, rather than a finite exact geometric initializer. Similarly $\forall N\,\exists x_N$ shadowing the first $N$ steps supplies neither an effectively compiled single all-time orbit nor its finite exact coordinates. Part3 concerns the guarantee furnished by an additive bound: an exact conjugacy or a scale-dependent invariant error theorem can supply another guarantee. A relative one-step estimate still requires a composition argument. For example $\varepsilon=1/4$, $\delta=10^{-6}$ certify the displayed increments only through $c=16$.

<a id="theorem-a28b-an-exact-analytic-conditional-counter-gate"></a>**Theorem A.2.8b (An Exact Analytic Conditional Counter Gate).** On $q_1,q_2>0$ with canonical form $dq_1\wedge dp_1+dq_2\wedge dp_2$, define the real-analytic function

$$
 h(q)=\begin{cases}
 \dfrac{\sin(\pi\log_2q)}{\pi\log_2q},&q\ne1,\\
 1,&q=1.
 \end{cases} \tag{A.2.8b.1}
$$

The autonomous Hamiltonian $\mathcal H(q,p)=-(\ln2)h(q_1)q_2p_2$ has time-one map

$$
 \begin{aligned}
 q'_1&=q_1,&q'_2&=2^{-h(q_1)}q_2,\\
 p'_1&=p_1+(\ln2)h'(q_1)q_2p_2,&p'_2&=2^{h(q_1)}p_2.
 \end{aligned} \tag{A.2.8b.2}
$$

It is a real-analytic symplectic diffeomorphism. On the exact rational counter code

$$
 q_i=2^{-c_i},\qquad p_i=0,\qquad c_i\in\mathbb N, \tag{A.2.8b.3}
$$

its action is $(c_1,c_2)\mapsto(c_1,c_2+1)$ when $c_1=0$ and $(c_1,c_2)\mapsto(c_1,c_2)$ when $c_1>0$.

*Proof.* The singularity of (A.2.8b.1) at one is removable, and composition with $\log_2q$ is real analytic on $q>0$. At the code points, $h(2^{-c})=1$ for $c=0$ and $0$ for every positive integer $c$. Hamilton's equations give

$$
 \dot q_1=0,\qquad \dot q_2=-(\ln2)h(q_1)q_2,\qquad
 \dot p_2=(\ln2)h(q_1)p_2,\qquad
 \dot p_1=(\ln2)h'(q_1)q_2p_2. \tag{A.2.8b.4}
$$

Both $q_1$ and $q_2p_2$ are constant. Integrating these equations for time one gives (A.2.8b.2), and integrating for negative time gives its inverse, throughout the positive-$q$ chart. As a Hamiltonian flow it is symplectic; equivalently it is the cotangent lift of $(q_1,q_2)\mapsto(q_1,2^{-h(q_1)}q_2)$. The zero-momentum set is invariant. Substitution of the code values therefore proves the stated conditional increment. For a positive first counter this identity is on the code; the $p'_1$ correction remains present at general nonzero momenta. $\square$

Unconditional increment and positive-counter decrement of counter $i$ are the symplectic scalings $(q_i,p_i)\mapsto(q_i/2,2p_i)$ and $(q_i,p_i)\mapsto(2q_i,p_i/2)$. The code separates a zero counter $q_i=1$ from every positive counter $q_i\le1/2$. Its accumulation is at $q_i=0$, outside the analytic chart. Indeed $h$ has no analytic continuation through zero: its zeros would accumulate there and force that continuation to vanish, contradicting $h(1)=1$. This places the gate outside the connected-interior accumulation premise of Proposition A.2.8a.

The theorem supplies an abstract analytic Hamiltonian gate on two full canonical pairs. Its canonical momenta are coordinates of this gate, not an instruction to set three bodies' physical momenta to zero. A Newtonian application of Theorem A.2.6 uses an actual invariant physical carrier, present-state branch selection, finite exact initialization, the specified machine instructions, and the fixed event/time correspondence. The Hamiltonian above is a specified analytic model; an identification with the unmodified gravitational return map is a separate realization. A two-dimensional scattering fiber alone supplies only one canonical pair. The computable-name orbit family of Theorem A.2.7 retains its own initial-data representation. 

## A.3 Significance and Relation to Logical Indeterminacy

* **Logical Indeterminacy:** SPAP excludes a single universally exact predictor on its stated diagonal-closed class. RUD excludes a total uniform $\mathsf{TERM}$ decider on the stated coded terminal-simulation class, with the separately qualified bounded probabilistic extension of Theorem A.2.4.
* **Physical Stochastic Closure:** Principle 11b requires the PPI-complete convex invariant response ledger when the registered finite reflexive map has no pure fixed point. For binary negation, Theorem 11b proves $q(\phi\mid R)=1/2$ and $H_{\mathrm{Sh}}(\Phi\mid R)=\ln2$. Principle 8.0c identifies that ledger with the registered single-run outcome probabilities; a frequency law additionally requires an i.i.d., exchangeable, or stationary-ergodic repeated-trial certificate.
* **Quantum Reconstruction:** Principle 8.0b supplies the sharp homogeneous carrier certificate and Theorem 8.0d fixes $\mathcal H_0\cong\mathbb C^8$. Theorem 8.2 removes response-null labels, and Lemma 8.2a supplies retained-refinement additivity. Definition 8.2b's independently accepted $\mathfrak C_{\mathrm{Born}}$ then supplies full projection/effect coverage or a finite informationally complete positive reconstruction; Theorem 8.3 proves the Born trace rule only on that certified domain.
* **Complexity Costs of Prediction:** On a task class carrying the certificate $\mathfrak C_{B.2}$, Theorem 14 supplies the log-enhanced quadratic lower bound $C_{\mathrm{uni}}(\delta_{\mathrm{SPAP}})=\Omega\!\left(\log(1/\delta_{\mathrm{SPAP}})/\delta_{\mathrm{SPAP}}^{2}\right)$, so verification and update complexity on that class diverges as the gap $\delta_{\mathrm{SPAP}}$ to $\alpha_{\mathrm{SPAP}}$ closes (Appendix B.3; Theorem B.2). Transfer of that bound to $C_P$ uses its declared domination bridge.
*   **Limits on Interaction:** RUD theorems A.2.3-A.2.4 exclude a total uniform decider for $\mathsf{TERM}$ on the stated effectively coded pointed RID class. The probabilistic result additionally requires a computable finite runtime bound, computable complete finite support lists with rational probabilities, and a specified positive advantage. This complements two independent Appendix E capacity branches: a completed tensor-factor reset-support certificate gives $C_{\max}\le\ln d_0-\ln r$, while an input-independent refresh/minorization component gives $C_{\max}<\ln d_0$. Theorem 31 separately gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ on its registered cyclic-reset branch, with a positive floor only when $H_q(P\mid R)\ge h_{\min}>0$. None of these physical branch conditions follows from the definition of ND-RID alone.

These core logical and computational limitations, derived rigorously under the assumption of Effective Operational Property R (motivated by POP/PCE dynamics), are foundational constraints shaping the emergent quantum mechanics, thermodynamics, information processing limits, and gravitational dynamics within the Predictive Universe framework.

## A.4 Formal Realizability of Property R: The LITE Construction in Peano Arithmetic

The Predictive Universe (PU) framework posits that systems capable of sophisticated prediction, such as Minimal Predictive Units (MPUs) or their aggregates, possess Property R (Definition 10). This property entails the computational richness necessary for self-representation, self-simulation/reasoning, and the evaluation of predicates concerning their own behavior, forming the bedrock for phenomena like the Self-Referential Paradox of Accurate Prediction (SPAP, Theorems A.1.1, A.1.3) and Reflexive Undecidability (RUD, Theorems A.2.3, A.2.4). This section demonstrates that such computational capabilities are not exclusive to the PU's specific hypotheses but can be formally realized even within standard Peano Arithmetic (PA), assuming $\mathrm{Con}(\mathrm{PA})$. The LITE construction, detailed below, provides an explicit example of a total computable function in PA that dynamically adapts its behavior based on bounded proof searches about its own properties, thereby instantiating key aspects of Property R.

### A.4.1 Preliminaries for LITE in PA

The LITE construction leverages standard tools from mathematical logic:

*   **Gödel Coding:** A bijection $⟨·⟩: \Sigma^* \to \mathbb{N}$ assigns unique natural number codes to syntactic expressions in PA, denoted $⌈\psi⌉$ for a formula $\psi$.
*   **Provability Predicate:** The primitive recursive relation $Prf(p, c)$ asserts that $p$ is the Gödel code of a PA proof for the formula with Gödel code $c$ [Gödel 1931, definitions 44–45; fixed PA coding specified below].
*   **Bounded Proof Search Predicate:** For a total computable function $g: \mathbb{N} \to \mathbb{N}$ and a formula $\psi$, $Prf_{\le g(n)}(⌈\psi⌉) \equiv \exists p \le g(n) \, Prf(p, ⌈\psi⌉)$ asserts a proof of $\psi$ exists with code $p \le g(n)$. This predicate is decidable for fixed $n, ⌈\psi⌉$.
*   **Kleene's Second Recursion Theorem:** For any total computable operator $\Psi: \mathbb{N} \times \mathbb{N} \to \mathbb{N}$, there exists an index $\beta \in \mathbb{N}$ such that the partial computable function $\varphi_\beta$ satisfies $\varphi_\beta(n) = \Psi(\beta, n)$ for all $n \in \mathbb{N}$ (Kleene 1938, §2, p. 153). This allows a function to consistently refer to its own Gödel code. A full proof appears as Theorem A.4.1a below.

### A.4.2 The LITE Function Construction

Let $g, H_1, H_2$ be predefined total computable functions. Let $Sub(x, y, z)$ be the standard substitution function yielding the Gödel code of the formula obtained by substituting the numeral for $y$ into the formula with Gödel code $x$ at occurrences of the variable with code $z$. Let $u$ be the code of a variable 'u' and let $v$ be the code of a variable 'x'. Let $FormTemplate(u,v)$ be a PA formula template with two free variables $u,v$.
Define $\phi_{\alpha}(n)$ as the formula whose Gödel code is

$$
c_{\alpha, n} = Sub(Sub(⌈FormTemplate(u,v)⌉, \alpha, u), n, v).
$$

This $\phi_{\alpha}(n)$ asserts a property related to the function with index $\alpha$ evaluated at input $n$.

<a id="theorem-a41a-kleenes-second-recursion-theorem"></a>**Theorem A.4.1a (Kleene's Second Recursion Theorem).**
Let $\{\varphi_e\}_{e\in\mathbb{N}}$ be a standard acceptable enumeration of partial computable functions $\mathbb{N}\to\mathbb{N}$. For any total computable operator $\Psi:\mathbb{N}\times\mathbb{N}\to\mathbb{N}$, there exists $\beta\in\mathbb{N}$ such that
$$
\varphi_\beta(n)=\Psi(\beta,n)\quad\text{for all }n\in\mathbb{N}. \qquad \text{(A.4.1a)}
$$

*Proof.* Define the partial computable function
$$
g(a,n):=\Psi(\varphi_a(a),n).
$$
Universality of the accepted effective numbering makes $(a,n)\mapsto \varphi_a(a)$ partial computable, and composition with the partial computable $\Psi$ makes $g$ partial computable uniformly in $(a,n)$. The parameter theorem, also called the $s$-$m$-$n$ theorem (Kleene 1938, §2, p. 153), therefore applies to this accepted numbering: there exists a total computable function $s:\mathbb N\to\mathbb N$ such that for all $a,n$,
$$
\varphi_{s(a)}(n)=g(a,n)=\Psi(\varphi_a(a),n).
$$
Let $\hat s$ be an index for $s$, so $\varphi_{\hat s}=s$, and set $\beta:=s(\hat s)=\varphi_{\hat s}(\hat s)$. Then, for every $n$,
$$
\varphi_\beta(n)
=\varphi_{s(\hat s)}(n)
=\Psi(\varphi_{\hat s}(\hat s),n)
=\Psi(\beta,n).
$$
Thus $\beta$ is the required self-referential index. ∎

The LITE function $f: \mathbb{N} \to \mathbb{N}$ is defined as $f = \varphi_{\beta}$, where $\beta$ is the fixed point guaranteed by the Recursion Theorem for the operator $\Psi(\alpha, n)$ that implements the following logic:
$$
f(n) = \begin{cases} n + H_1(n), & \text{if } Prf_{\le g(n)}(⌈\phi_{\beta}(n)⌉) \\ n + H_2(n), & \text{if } \neg Prf_{\le g(n)}(⌈\phi_{\beta}(n)⌉) \land Prf_{\le g(n)}(⌈¬\phi_{\beta}(n)⌉) \\ n + 1, & \text{otherwise} \end{cases} \quad \text{(A.4.1)}
$$
Here, $\beta$ is the Gödel code of $f$ itself. The first case is prioritized. If $\mathrm{Con}(\mathrm{PA})$ holds, the predicates $Prf_{\le g(n)}(⌈\phi_{\beta}(n)⌉)$ and $Prf_{\le g(n)}(⌈¬\phi_{\beta}(n)⌉)$ cannot both hold, so the first two cases are mutually exclusive; regardless, the third branch ensures the definition returns a unique output for every $n$.

<a id="theorem-a41-totality-and-computability-of-the-lite-function"></a>**Theorem A.4.1 (Totality and Computability of the LITE Function).**
Assume that $g, H_1, H_2$ are total computable functions. Then the LITE function $f$ defined by Equation (A.4.1) via the Recursion Theorem exists, is total, and is computable.

*Proof:* Define the operator $\Psi:\mathbb{N}\times\mathbb{N}\to\mathbb{N}$ by
$$
\Psi(\alpha,n)=
\begin{cases}
n + H_1(n), & \text{if } Prf_{\le g(n)}(⌈\phi_{\alpha}(n)⌉), \\
n + H_2(n), & \text{if } \neg Prf_{\le g(n)}(⌈\phi_{\alpha}(n)⌉) \land Prf_{\le g(n)}(⌈¬\phi_{\alpha}(n)⌉), \\
n + 1, & \text{otherwise}.
\end{cases}
$$
Because $g,H_1,H_2$ are total computable, the values $g(n),H_1(n),H_2(n)$ are computable for every $n$. The maps $\alpha\mapsto⌈\phi_{\alpha}(n)⌉$ and $\alpha\mapsto⌈¬\phi_{\alpha}(n)⌉$ are computable by the usual primitive-recursive substitution operations on Gödel codes. Each bounded proof predicate $Prf_{\le g(n)}(\cdot)$ is decidable by finite search, because only finitely many candidate proofs of size at most $g(n)$ must be tested and proof verification is computable. Hence $\Psi$ is a total computable operator.

By Theorem A.4.1a (Kleene's Second Recursion Theorem; Kleene 1938, §2, p. 153), there exists an index $\beta$ such that
$$
\phi_\beta(n)=\Psi(\beta,n)\qquad\text{for all }n\in\mathbb{N}.
$$
Set $f:=\phi_\beta$. Then $f$ satisfies Equation (A.4.1), so the LITE function exists. Since $\Psi$ is total, $f(n)=\Psi(\beta,n)$ is defined for every $n$, proving totality. Because $f=\phi_\beta$, it is computable. If $\mathrm{Con}(\mathrm{PA})$ holds, the first two branches are mutually exclusive, but that consistency assumption is not needed for the three conclusions stated here. ∎

<a id="corollary-a41b-self-referential-pu-verifier-fixed-points"></a>**Corollary A.4.1b (Self-Referential PU Verifier Fixed Points).** Let $\mathsf V(e,n)$ be any total computable verifier transformer whose first input is a finite code for a verifier presentation and whose second input is a finite protocol input. Then there exists an index $\beta$ such that
$$
\phi_\beta(n)=\mathsf V(\beta,n)
\qquad\text{for every }n.
\tag{A.4.1b}
$$
If $\mathsf V$ encodes an admissible PU finite-response verifier transformer, the resulting $\phi_\beta$ is a self-referential verifier presentation for that transformer.

This is an existence theorem for fixed-point presentations. It does not prove minimality of the verifier, does not remove the machine-dependent constants in ordinary Kolmogorov or Levin complexity, does not identify $c_{\min}$ with $K_0$, does not replace the hierarchy defining $C_P$, and does not replace the Appendix D or Theorem 2 alignment conditions for $\hat C_v$.

*Proof.* Apply Theorem A.4.1a to the total computable operator $\mathsf V$. The fixed-point index $\beta$ gives (A.4.1b). The remaining statements are scope restrictions: the recursion theorem supplies self-reference of a presentation, not an optimality theorem, an invariance theorem, or a physical branch certificate. ∎

<a id="theorem-a41c-finite-lite-verifier-circuit-and-explicit-resource-envelope"></a>**Theorem A.4.1c (Finite LITE Verifier Circuit and Explicit Resource Envelope).** Use canonical binary numerals for the nonnegative integer proof codes in (A.4.1), with zero represented by one zero bit. Assume a uniform circuit of size $q(G,L)$ and workspace $s(G,L)$ verifies a proof numeral of length at most $G$ against a target code of length at most $L$; $q,s$ are explicit polynomial upper bounds for this encoding. Put $B_n=g(n)$ and
$$
G=\max\{1,\lceil\log_2(B_n+1)\rceil\}.
$$
Let $L_n$ be the maximum length of the two substituted formula codes, and let $W_n\ge1$ be the maximum binary length of $n+H_1(n)$, $n+H_2(n)$, and $n+1$. Let $q_{\mathrm{prep}}(n)$ and $s_{\mathrm{prep}}(n)$ record the circuit size and workspace of the declared preparation, including $B_n,G$, both formula codes, all three candidate sums, and their arithmetic intermediate values. Then the two bounded proof predicates and the prioritized branch in (A.4.1) have a uniform finite circuit with
$$
\operatorname{size}\le q_{\mathrm{prep}}(n)+2(2^{G+1}-1)q(G,L_n)+O(2^GG+L_n+W_n),
\tag{A.4.1c.1}
$$
and a sequential implementation with workspace
$$
O\bigl(s_{\mathrm{prep}}(n)+G+L_n+s(G,L_n)+W_n\bigr).
\tag{A.4.1c.2}
$$
The circuit returns exactly one of the three candidate sums; the self-index $\beta$ is the specified constant supplied by Theorem A.4.1a.

*Proof.* Every code $0\le p\le B_n$ has a canonical numeral of length at most $G$. Enumerate the $2^{G+1}-1$ binary words of length at most $G$, rejecting the empty word, noncanonical numerals, and every decoded value $p>B_n$. For each target formula, verify the remaining candidates and OR their acceptance bits. This computes exactly the numeric-cutoff proof predicate of (A.4.1). The two sets of verifier circuits cost at most $2(2^{G+1}-1)q(G,L_n)$; canonicality and cutoff tests, enumeration, and OR trees cost $O(2^GG+L_n)$. Preparation includes the arithmetic for the candidate sums, and their prioritized multiplexer costs $O(W_n)$, giving (A.4.1c.1). Sequential enumeration reuses the verifier workspace and retains only counters, formula codes, candidate sums, and acceptance bits, giving (A.4.1c.2). The first branch is selected when its search bit is one, the second when only the negated-formula search bit is one, and the third when both are zero. This establishes the stated total computation without a consistency assumption. ∎

On a branch already carrying the protected universal-gate, memory, execution, and QEC certificate of Theorem A.0.6, standard reversible compilation maps each such finite Boolean circuit into the protected response system with the certificate's recorded overhead. Equations (A.4.1c.1)--(A.4.1c.2) do not themselves populate that physical certificate.

### A.4.3 LITE's Instantiation of Property R Capabilities

The LITE function $f$, constructed entirely within PA, explicitly demonstrates three bounded logical capabilities associated with Property R (Definition 10):

1.  **Representation:**
    *   PA's Gödel numbering allows $f$ (via its index $\beta$) and statements *about* $f$ (the formula $\phi_{\beta}(n)$) to be represented as natural numbers, manipulable arithmetically. This directly corresponds to Property R's requirement to encode system states (here, the function's definition via $\beta$) and models/predictions (the assertion $\phi_{\beta}(n)$) as formal objects.

2.  **Simulate/Reason (Self-Referentially and Bounded):**
    *   The predicate $Prf(p, c)$ itself is a formal representation within PA of the proof-checking process. The bounded proof search $Prf_{\le g(n)}(c)$ is a *computation* performed by $f$ (as part of $\Psi(\beta, n)$) to *reason* about the bounded provability of $\phi_{\beta}(n)$.
    *   If $FormTemplate(u,v)$ is chosen to be a statement like "$\varphi_u(v)$ halts and has property X", then $\phi_{\beta}(n)$ is effectively making an assertion about the *simulated execution and output* of $f$ itself.
    *   The Recursion Theorem ensures this self-referential simulation/reasoning is consistent: $f$ can incorporate reasoning about its own (potential) behavior into its definition.

3.  **Evaluate Predicates (Concerning Own Behavior):**
    *   The LITE function's definition (Equation A.4.1) is a conditional branching structure based on the truth values of the predicates $B_1 \equiv Prf_{\le g(n)}(⌈\phi_{\beta}(n)⌉)$ and $B_2 \equiv Prf_{\le g(n)}(⌈¬\phi_{\beta}(n)⌉)$.
    *   These predicates concern properties (specifically, bounded provability) of the formula $\phi_{\beta}(n)$, which itself is a statement about $f$'s behavior.
    *   The function $f$ *evaluates* these predicates and *adapts* its output ($n+H_1(n)$, $n+H_2(n)$, or $n+1$) based on the evaluation. This directly matches Property R's requirement for evaluating predicates about model behavior to guide subsequent processing.

### A.4.4 Dynamic Self-Reference and DSRO Analogy

The LITE function's structure (Equation A.4.1) provides a concrete arithmetical realization of a Dynamic Self-Reference Operator (DSRO, Definition 11). The output $f(n)$ depends on the outcome of a bounded proof search (a computable process) for formulas $\phi_{\beta}(n)$ that refer to the function's own index $\beta$. This iterative process, where $f(n)$'s value is determined at step $n$ based on provability checks and can influence future checks, embodies the dynamic, adaptive self-reference that DSROs formalize.

### A.4.5 Conclusion: LITE and the Plausibility of Property R for MPUs

The construction shows that ordinary arithmetic can represent a total procedure that examines bounded statements about itself and changes its output in response. It therefore supplies a concrete logical example of adaptive self-reference. The appendix treats realization of the same abilities in a physical network as a separate implementation problem.

**Technical ledger.**

The LITE construction robustly demonstrates that standard Peano Arithmetic, a foundational system of mathematics, possesses sufficient richness to define total computable functions exhibiting dynamic, adaptive self-reference based on bounded internal "proof discovery." It formally shows that capabilities analogous to self-representation, bounded self-simulation/reasoning, and adaptive predicate evaluation—the core components of Property R—are not reliant on exotic computational models but can be realized within a well-understood arithmetical framework.

MPUs are physical entities rather than abstract arithmetical functions. The LITE construction proves that a standard arithmetical framework can realize total computable functions with bounded adaptive self-reference. It therefore supplies an existence example for the logical form used in the later diagonal arguments. Physical realization by an MPU network is the separate conditional result of Theorem A.0.2 (Conditional Effective Property R at a Certified PCE Optimum), whose optimizer, robustness, QEC, protected-gate, memory, and execution certificates are not supplied by LITE. The PU resource quantities $C_P$, $R$, and $R_I$ may be compared with LITE's bounded proof-search function $g(n)$ only at this structural level.

Cinematic Strawberry (2026), Theorem 1R and Theorems 1--3, supplies exact selected computation, literal source-output readback and a fixed regular halting endpoint. Corollary 2a gives the intermediate-trace route to Proposition 2(ii), while Corollary 2b constructs a finite-trace interpreter through terminating output queries and the implementing class's finite orchestration and scalable storage. Theorem A.4.1's LITE construction supplies bounded arithmetical self-reference and proof-conditioned branching. Theorem 5 in the same Pure-S paper proves that verified histories persist along every reduction and that one address-complete path eventually exposes every valid history. *Proof-Life*, Theorem PL.5, supplies typed finite verification for nominated bounded pure-$\mathbf S$ reachability targets. Proposition 2(i), (iii), and (iv), logical memory, uniform diagonal closure, and physical realization remain governed by their owning declarations.

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

Gödelian incompleteness concerns the second notion: for suitable recursively axiomatized theories extending enough arithmetic, there are sentences not provable in the theory, and under the corresponding soundness assumptions those sentences are true in the intended model (Gödel 1931). The third notion is processing-event-relative: the proof object may exist in PA while reachability or unreachability for a specified predictor remains undecided until a concrete model-change map and finite-cost or cost-divergence certificate are supplied. Gödel's original 1931 paper is the reference point for the formal-system-relative result, while the representability and fixed-point tools used below are standard arithmetical machinery (Gödel 1931, definitions 44–45 and Theorem V; Kleene 1938, §2; Marks 2024, Theorem 11.7).

Fix once and for all a primitive-recursive Gödel coding of finite strings, formulas, proofs, machines, machine inputs, and finite computation traces, with primitive-recursive parsing, substitution, PA proof checking, and finite transition checking. For a machine/program code $e$, input code $x$, finite trace code $\tau$, and output $y\in\{0,1\}$, let

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

<a id="definition-a51-trace-certified-pa-object"></a>**Definition A.5.1 (Trace-Certified PA Object).**
A closed PA formula $H$ is **trace-certified** if it is a finite conjunction of represented finite-trace facts:

$$
H\equiv\bigwedge_{i=1}^{m}\mathrm{Trace}(\bar e_i,\bar x_i,\bar\tau_i,\bar y_i),
$$

or equivalently a finite conjunction of output statements $\mathrm{Out}(\bar e_i,\bar x_i,\bar y_i)$ together with explicit witness numerals $\bar\tau_i$. Every true trace-certified object is true in the standard model $\mathbb N$ and has a finite PA proof-object.

<a id="definition-a52-predictor-reachability-of-a-proof-object"></a>**Definition A.5.2 (Predictor Reachability of a Proof-Object).**
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

This definition is intentionally stronger than ordinary proof checking. A predictor may manipulate a proof string as an uninterpreted external symbol pattern without integrating its content into the specified self-model; that operation is not reachability under this definition. Reachability and unreachability are properties of the declared processing event and its finite-cost or cost-divergence certificate.
### A.5.2 Retrospective and Live Diagonal Objects

Gödelian incompleteness concerns absence of a proof from a fixed formal system under its usual hypotheses. The object $G_S$ below is different: it is a finite conjunction of true closed trace facts and therefore has a finite PA proof object.

The live diagonal limitation is also different. Theorem M.10.4 applies to a contemporaneous joint challenge whose output on each retained register is defined against the current prediction on that register. Once those outputs have occurred and are encoded by fixed numerals in $G_S$, later verification of the transcript cannot change them. Therefore neither PA proofhood nor predictor indexing identifies $G_S$ with the live pattern $E^*$.

Any processing conclusion for $G_S$ requires its own model-change map and finite-cost certificate. Any cost-divergence conclusion for a live pattern requires the implementation and pattern-specific reduction certificates stated in Theorem M.10.6.

### A.5.3 The Predictor-Indexed Diagonal Transcript Family

We work with predictive systems possessing Effective Operational Property R (Definition A.0.1; Definition A.0.6), each carrying an operational self-model $\mathcal M_S$ (Definition M.10.1). By Property R (Definition 10), such a system's relevant model class can represent coded descriptions, simulate nominated predictors on those descriptions, and evaluate the relevant predicates about predicted outputs. This is the subcapacity required by SPAP (Theorems 10–11).

Let $S$ be such a system. Let $n_S$ be the number of Fisher-orthogonal addressable deterministic SPAP registers retained in $S$'s self-model. Assume that each retained register's two operationally distinguishable binary code states are represented by distinct parameter values at positive Fisher distance. Register the parameter chart and metric-evaluation points used by the discrepancy in Equation M.18. For each retained register $j$, let $\eta_{S,j}>0$ be a certified lower bound on the Fisher tangent norm of either nonzero binary code-state displacement at every metric-evaluation point used in the individual and joint boundary diagonal challenges, as required by Theorem M.10.4, and define

$$
D_1(S):=\min_{1\le j\le n_S}\eta_{S,j}>0.
$$

Let $g$ be the tolerance profile appearing in Equation M.18. Define

$$
N^*(S):=\left\lceil\left(\frac{g(\alpha_{\mathrm{SPAP}})}{D_1(S)}\right)^2\right\rceil+1.
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

<a id="definition-a53-predictor-indexed-diagonal-transcript-object"></a>**Definition A.5.3 (Predictor-Indexed Diagonal Transcript Object).**
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
Definition A.5.3 uses the same arithmetical infrastructure as §A.4: Gödel coding, primitive-recursive substitution, finite proof/trace checking, and fixed-point machinery. LITE applies this machinery to construct a total computable function $f$. Definition A.5.3 applies it to construct, for each predictor $S$, a PA object whose content is wired to $S$'s own self-model prediction registers. LITE demonstrates tractable self-reference. The index $S$ in $G_S$ records which completed computations are encoded.

<a id="lemma-a51-existence-truth-and-pa-proof-object"></a>**Lemma A.5.1 (Existence, Truth, and PA Proof-Object).**
Let $S$ be a predictive system with Effective Operational Property R satisfying $n_S\ge N^*(S)$. Then $G_S$ exists as a closed PA formula, is true in the standard model $\mathbb N$, and has a finite PA proof-object.

*Proof.* For each $j\le N^*(S)$, Theorem A.1.1 constructs the diagonal component $S_{\mathrm{diag}}^{(j)}$, and Theorem M.10.4 supplies the independent-register amplification. The hypothesis $n_S\ge N^*(S)$ supplies the required addressable Fisher-orthogonal registers.

The coding, substitution, and bounded transition-checking operations of §A.4 are primitive recursive. A candidate trace has finite length, so $\mathrm{Trace}(e,x,\tau,y)$ is the finite conjunction asserting the initial configuration, each legal successor configuration, and the terminal output. It is therefore a primitive-recursive relation. Define the PA formula $\mathrm{Trace}(e,x,\tau,y)$ as the represented equation $\chi_{\mathrm{Trace}}(e,x,\tau,y)=1$ for its total primitive-recursive characteristic function. Marks (2024, Theorem 11.7) supplies numeralwise representation of every computable function already in $\mathrm{PA}^{-}$; PA extends that arithmetic and all four arguments below are numerals. Each specified computation has a finite standard trace $\tau_j(S)$ with output $y_j(S)$; hence the true closed instance
$$
\mathrm{Trace}\left(\overline{e_j(S)},\overline{x_j(S)},\overline{\tau_j(S)},\overline{y_j(S)}\right)
$$
has a finite PA derivation. The index set $1\le j\le N^*(S)$ is finite, and repeated conjunction introduction combines those derivations into a PA derivation of $G_S$. Thus $G_S$ is closed, true in $\mathbb N$, and has a finite PA proof-object. ∎

### A.5.4 Above-Threshold Predictors, External-Model Safety, and the Lower Witness

Theorem M.10.4 requires independent self-model register capacity. Therefore the explicit lower witness cannot be the bare $K_0=3$ bit core alone. Theorem 15 supplies the minimal **per-register SPAP core**; Effective Operational Property R and independent multi-register capacity arise at the network/aggregate level (Theorem A.0.6; Definition A.0.6).

The reachability direction also requires a second distinction. It is not enough that $A$ be more complex than $S$. $A$ must host $S$'s self-model as an external object, with $S$'s represented registers kept typed and disjoint from $A$'s own self-model registers. Otherwise, reasoning about $S$'s diagonal family could secretly engage $A$'s own self-model. The definition below builds the required external separation directly into the model-access branch.

<a id="definition-a54-externally-insulated-model-access"></a>**Definition A.5.4 (Externally Insulated Model Access).**
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

Condition 4 is the external-hosting branch of item 3 of Theorem M.10.5 stated explicitly as part of externally insulated model access. If $A$ additionally chooses to process a different statement such as “$A$ has now verified $G_S$,” that is a separate self-referential content item about $A$. It is not required for the object-level verification of $G_S$.

<a id="definition-a55-above-threshold-predictor"></a>**Definition A.5.5 (Above-Threshold Predictor).**
For a target predictor $S$, a predictor $A$ is **above-threshold for $S$** if

$$
C_{\mathrm{agg}}(A)>C_{\mathrm{agg}}(S),
\tag{A.5.6}
$$

$A$ has Effective Operational Property R, and $A$ has externally insulated model access to $S$ in the sense of Definition A.5.4.

Complexity alone is not sufficient. Model access and external register separation are part of the definition; discovery of the proof-object is not assumed unless the finite witness or a sufficient ordinary external proof-search budget is supplied for the processing event.

<a id="lemma-a52-external-model-safety-for-represented-diagonal-families"></a>**Lemma A.5.2 (External-Model Safety for Represented Diagonal Families).**
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
\delta_A(G_S)=\alpha_{\mathrm{SPAP}},
\qquad
\mu_A(G_S)=\frac{1}{\alpha_{\mathrm{SPAP}}}.
\tag{A.5.7}
$$
These identities concern the reflexive profile. Reachability additionally requires a finite certificate for the external proof-checking and model-update event.

*Proof.* Definition A.5.4 places the represented registers of $S$ in $A$'s external-model subspace and requires the represented transcript to induce no retained update of $A$'s self-model coordinates. Hence $\Delta M_A^{(\mathrm{self})}(G_S)=0$, and Definition M.10.4 gives $\sigma_A(G_S)=0$. Under the additional baseline-invariance hypothesis, Corollary M.10.3.1 gives the displayed values of $PP_A^{(G_S)}$, $\delta_A(G_S)$, and $\mu_A(G_S)$. No statement about the remaining external processing cost follows from those quantities. ∎

<a id="definition-a56-horizon-core-aggregate-witness"></a>**Definition A.5.6 (Horizon-Core Aggregate Witness).**
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

Theorem 15 supplies the minimal per-register SPAP logic; Theorem A.0.6 supplies the network-level route to Effective Operational Property R; Theorem M.10.4 supplies the required independent-register branch. Each SPAP register core is $K_0$-minimal, while the full witness is the finite Property-R aggregate required to host the diagonal amplification.

### A.5.5 Retrospective Trace Certification and Live-Challenge Separation

For every predictor $S$ satisfying the implementation hypotheses of Theorem M.10.4, let $E_S^*$ denote the live joint diagonal pattern constructed there. When an attempted integration of $E_S^*$ induces a candidate updated self-model parameter, denote that parameter by $\theta_S'$.

<a id="theorem-a51-retrospective-trace-certification-and-live-challenge-separation"></a>**Theorem A.5.1 (Retrospective Trace Certification and Live-Challenge Separation).**
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
\delta_A(G_S)=\alpha_{\mathrm{SPAP}},
\qquad
\mu_A(G_S)=\frac{1}{\alpha_{\mathrm{SPAP}}}.
\tag{A.5.11}
$$

**(iv) Live diagonal boundary.** Let $S_0$ be a horizon-core aggregate witness, and suppose an independent implementation certificate realizes the live joint challenge $E_{S_0}^*$ of Theorem M.10.4 with its declared register responses and Fisher geometry. Let $\theta_{S_0}'$ be the candidate updated self-model parameter induced by the attempted integration of that live pattern. For every $PP\in[0,\alpha_{\mathrm{SPAP}})$,
$$
\left\|\Pi_{S_0}^{(PP)}(\theta_{S_0}')-\theta_{S_0}'\right\|_{\mathcal F_{S_0}}
\ge
\sqrt{N^*(S_0)}D_1(S_0),
\tag{A.5.12}
$$
and
$$
\sqrt{N^*(S_0)}D_1(S_0)>g(\alpha_{\mathrm{SPAP}}).
\tag{A.5.13}
$$
Because $g$ is nondecreasing, for every $PP<\alpha_{\mathrm{SPAP}}$,
$$
\sqrt{N^*(S_0)}D_1(S_0)
>
g(\alpha_{\mathrm{SPAP}})
\ge
g(\alpha_{\mathrm{SPAP}}-PP),
$$
so the finite-$\mu$ criterion fails. At $PP=\alpha_{\mathrm{SPAP}}$, $g(0)=0$, while the live NOT construction excludes the required fixed point. Hence $\mu_{S_0}(E_{S_0}^*)=\infty$. If the pattern-specific reduction certificate of Theorem M.10.6 is also supplied, then
$$
\liminf_{\delta\downarrow0}
C_{\mathrm{integrate}}(S_0,E_{S_0}^*;\delta)=\infty.
$$
This is a certificate-relative absence of a finite uniform upper bound in the accuracy limit, not a pointwise infinite cost for the retrospective sentence $G_{S_0}$.

*Proof.* Part (i) is Lemma A.5.1. For part (ii), every numeral $\bar\tau_j(S)$ in $G_S$ denotes a trace that has already terminated. Verifying the resulting closed sentence occurs after those outputs are fixed and therefore cannot determine them. Theorem M.10.4 instead constructs each component of $E_S^*$ so that its current output negates the nominated current prediction on the corresponding register. No map identifying later verification of $G_S$ with that live response event is supplied. Thus the hypotheses of Theorem M.10.4 do not apply to $G_S$, and Theorem M.10.6 cannot be invoked for $G_S$ without a separate pattern and reduction certificate.

For part (iii), Lemma A.5.2 gives the reflexive-profile identities under external insulation and baseline invariance. The supplied finite external-processing certificate bounds proof verification, any invoked proof construction, and the external-model update, so Definition A.5.2 gives reachability.

For part (iv), Equations A.5.12 and A.5.13 are the independent-register estimate and strict amplification inequality of Theorem M.10.4 applied to the realized live pattern. That theorem gives $\mu_{S_0}(E_{S_0}^*)=\infty$. The final limit is exactly Theorem M.10.6 under its additional pattern-specific reduction certificate. ∎

<a id="corollary-a51-no-retrospective-horizon-inference"></a>**Corollary A.5.1 (No Retrospective-Horizon Inference).**
For every $S$ satisfying Theorem A.5.1, the PA proofhood of $G_S$ establishes neither its reachability nor its unreachability for $S$. Either conclusion requires a separately specified processing event and cost certificate. The live diagonal obstruction remains the one in Theorem M.10.4 and §A.5.6a.

*Proof.* This is Theorem A.5.1(i)-(ii) together with Definition A.5.2. ∎

<a id="corollary-a52-certificate-relative-live-cost-boundary"></a>**Corollary A.5.2 (Certificate-Relative Live Cost Boundary).**
On the branch of Theorem A.5.1(iv), no $PP<\alpha_{\mathrm{SPAP}}$ satisfies the live integration criterion. With the additional reduction certificate of Theorem M.10.6, the certified integration cost has no finite uniform upper bound as $\delta\downarrow0$. No conclusion about the cost of checking a fixed finite transcript, and no claim that a completed individual run dissipates infinite energy, follows.

*Proof.* Apply Theorem M.10.6 to $E_{S_0}^*$ and retain all of its hypotheses and scope qualifications. ∎

### A.5.6 Interpretation and Scope

**Remark A.5.3 (Contrast with Gödel).**
Theorem A.5.1 establishes a type distinction between retrospective proof verification and a live diagonal challenge. Unlike a Gödel sentence, $G_S$ has a PA proof.

**Remark A.5.4 (Syntactic Proof Checking).**
A supplied proof of $G_S$ is finite and syntactically checkable. Whether a physical predictor can complete the associated content update is a separate finite-processing question, decided by a separately specified processing event and cost certificate (Corollary A.5.1).

**Remark A.5.5 (Live Scope).**
Theorem M.10.4 applies only to its realized live joint challenge with the stated register and Fisher-separation data. A historical record of that challenge may later be processed without recreating the prediction-contingent event.

**Remark A.5.6 (Consistency with LITE).**
There is no tension with §A.4. LITE is total and computable, $G_S$ is a finite trace-certified PA object, and §A.5.6a supplies the distinct time-indexed active diagonal limitation.

**Remark A.5.7 (Conditional Status Within PU).**
The trace-certification result uses standard arithmetization. The live boundary uses Theorem M.10.4's independent-register and implementation hypotheses. A computational divergence additionally uses Theorem M.10.6's pattern-specific reduction certificate. A thermodynamic statement additionally requires Theorem M.10.7's implementation ledger.

**Remark A.5.8 (Terminology).**
The established statements are retrospective trace certification, phase-indexed active diagonal failure, conditional historical or external accessibility, and certificate-relative live integration bounds.

### A.5.6a Phase-Indexed Access, Historical Recovery, and Model-Indexed LITE

Theorem A.5.1 separates retrospective PA trace certification from a live diagonal challenge. This subsection gives the cycle-indexed form directly: truth and proofhood remain fixed while active access is predictor-indexed, time-indexed, and verification-gated, and the same object may become historically accessible after the targeted register is recorded. For the semantic steps in Theorem A.5.6a.2 and Appendix A.6, require the fixed-point biconditional to be proved in a base whose axioms are true in $\mathbb N$—for example PA—or assume its displayed standard-model equivalence directly. Mere consistency of an arithmetically adequate theory is not used to infer truth in $\mathbb N$.

<a id="definition-a56a1-time-indexed-prediction-register"></a>**Definition A.5.6a.1 (Time-Indexed Prediction Register).** Let $\mathcal F$ be a consistent arithmetically adequate formal theory capable of representing primitive-recursive functions, finite computations, execution traces, and Gödel coding. A trace-certified predictor $B$ has a total prediction-register map
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

<a id="theorem-a56a2-time-indexed-diagonal-object"></a>**Theorem A.5.6a.2 (Time-Indexed Diagonal Object).** For every trace-certified predictor $B$ and every time $t$, there exists a sentence $E_{B,t}$ with Gödel code $e_{B,t}$ such that
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

*Proof.* Set $\varphi(x):=\neg\operatorname{Pred}_B(\bar t,x)$. Let $d(n)$ be the primitive-recursive function that substitutes the numeral $\bar n$ for the free variable in the formula coded by $n$. By the coding hypothesis of Definition A.5.6a.1 and §A.4, its graph has an arithmetical representation $D(u,v)$ with the needed numeral-instance correctness and functionality in $\mathcal F$. Define $\vartheta(u):=\exists v\,[D(u,v)\wedge\varphi(v)]$, let $n=\ulcorner\vartheta\urcorner$, and put $E_{B,t}:=\vartheta(\bar n)$ and $e_{B,t}:=d(n)=\ulcorner E_{B,t}\urcorner$. The represented substitution calculation at the concrete numeral $\bar n$ gives $\mathcal F\vdash D(\bar n,\overline{e_{B,t}})$ and $\mathcal F\vdash D(\bar n,v)\rightarrow v=\overline{e_{B,t}}$. Hence
$$
\mathcal F\vdash E_{B,t}\leftrightarrow
\neg\operatorname{Pred}_B(\bar t,\overline{e_{B,t}}),
$$
which is Equation A.5.6a.2. Trace certification makes $\operatorname{Pred}_B(\bar t,\bar e)$ true in $\mathbb N$ exactly when $P_B(t,e)=1$. Interpreting the displayed equivalence in $\mathbb N$ therefore gives
$$
\mathbb N\models E_{B,t}\Longleftrightarrow P_B(t,e_{B,t})\ne1,
$$
which is Equation A.5.6a.3. ∎

<a id="theorem-a56a3-no-stable-self-processing-at-the-targeted-time"></a>**Theorem A.5.6a.3 (No Stable Self-Processing at the Targeted Time).** For the time-indexed diagonal object $E_{B,t}$,
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

<a id="theorem-a56a4-external-and-historical-accessibility"></a>**Theorem A.5.6a.4 (External and Historical Accessibility).** Let $A$ have external model access to $B$'s time-$t$ register, meaning that $A$ can determine $P_B(t,e)$ without making that value part of $A$'s own active prediction register. Define
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

<a id="lemma-a56a5-chance-null-registers-are-update-null-under-a-no-op-dominance-certificate"></a>**Lemma A.5.6a.5 (Chance-Null Registers Are Update-Null under a No-Op Dominance Certificate).** Let $M_t$ be the retained model of a predictor $S_t$, let $R_T$ be a finite verification register, and let $\mathcal U_S$ be the admissible update family. For $U\in\mathcal U_S$, define
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

<a id="theorem-a56a6-verification-gated-reachability"></a>**Theorem A.5.6a.6 (Verification-Gated Reachability).** Assume the admissible no-op and both no-op dominance conditions of Lemma A.5.6a.5. Let
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

<a id="definition-a56a7-labeled-model-indexed-lite-search"></a>**Definition A.5.6a.7 (Labeled Model-Indexed LITE Search).** Let $\operatorname{Proof}_{\mathcal F}(p,e)$ be the primitive-recursive proof predicate for $\mathcal F$, and let $\operatorname{Neg}(e)$ be the primitive-recursive function sending the Gödel code of a sentence to the Gödel code of its negation.

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

<a id="theorem-a56a8-register-coherent-active-miss-and-historical-labeled-recovery"></a>**Theorem A.5.6a.8 (Register-Coherent Active Miss and Historical Labeled Recovery).** Let $B$ be trace-certified over a consistent $\mathcal F$. Let $E_{B,t}$ be the diagonal object from Theorem A.5.6a.2 and let $e=e_{B,t}$. If $\operatorname{Adm}^{\mathrm{act}}_B$ is register-coherent at $t$, then for every $N$,
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

<a id="corollary-a56a9-fixed-proofhood-and-local-proof-access-gain"></a>**Corollary A.5.6a.9 (Fixed Proofhood and Local Proof-Access Gain).** For the diagonal object $E_{B,t}$, formal proofhood of the correct label and active access to that proof are distinct:
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

<a id="theorem-a56a10-time-locked-two-register-diagonal-implementation-and-reset-ledger"></a>**Theorem A.5.6a.10 (Time-Locked Two-Register Diagonal Implementation and Reset Ledger).** Let $P$ and $O$ be two physical binary registers with basis states $|p,o\rangle$. Before a registered commit time $t_c$, a nominated predictor writes $p\in\{0,1\}$ into $P$ and a one-way clock gate locks $P$ against subsequent writes by that predictor. Initialize $O=0$. At $t_c$, apply
$$
U_{\mathrm{diag}}:=X_O\operatorname{CNOT}_{P\to O}.
\tag{A.5.6a.10.1}
$$
Then
$$
U_{\mathrm{diag}}|p,0\rangle=|p,1-p\rangle,
\tag{A.5.6a.10.2}
$$
so the committed outcome is never the locked prediction. The implementation is insulated: $U_{\mathrm{diag}}$ leaves $P$ unchanged, acts only after its write gate closes, and uses no post-commit value to alter the earlier register.

The map on the admitted subspace is injective and is implemented by a unitary, so the diagonal operation has no Landauer lower bound merely from its logical form. For a cyclic reuse:

1. if $P$ is retained, applying $U_{\mathrm{diag}}^{-1}$ restores $O=0$ reversibly;
2. if $O$ is reset while all side information correlated with it is discarded, the registered reset obeys
   $$
   Q_{\mathrm{bath}}\ge k_BT H(O\mid R),
   \tag{A.5.6a.10.3}
   $$
   and gives $k_BT\ln2$ only for a conditionally uniform output with $H(O\mid R)=\ln2$.

*Proof.* The CNOT sends $|p,0\rangle$ to $|p,p\rangle$ and $X_O$ sends this to $|p,1-p\rangle$, proving (A.5.6a.10.2). If a predictor were correct on this registered challenge, its locked bit would obey $p=1-p$, which has no Boolean solution. Neither gate targets $P$, and the clock ordering excludes a later write to it, proving insulation and the same-cycle reduction. A unitary is bijective and preserves the input information, so logical irreversibility is absent. The inverse recovers the ready state when $P$ remains available. When that correlation is discarded, Theorem 31 applied to the separately registered cyclic reset gives (A.5.6a.10.3) and its equality conditions. ∎

This construction is an exact two-qubit, or reversible two-bit, live-register realization. Protected operation on an MPU substrate inherits the finite gate from a branch carrying Theorem A.0.6's gate/QEC execution certificate.

---

## A.6 Generative Non-Closure and Axiom Stabilization

This section derives generative non-closure from the phase-indexed diagonal theorem in §A.5.6a: a trace-certified predictor cannot implement a total standard-sound Boolean closure on a represented domain containing the live diagonal sentence targeted at that cycle. The same sentence may be processed externally or historically after the targeted register is fixed. Theorem A.6.4 gives stable finite partial closures for prediction-update cycles satisfying its hypotheses, and Theorem A.6.6 shows that the added vocabulary introduces no physical primitive and no additional axiom.

### A.6.1 Internal closure maps

<a id="definition-a61-live-diagonal-internal-closure-domain"></a>**Definition A.6.1 (Live-diagonal internal closure domain).** Let $S$ be a trace-certified predictor in the sense of Definition A.5.6a.1, and fix a cycle $t$. Let $\mathsf{TC}_{S,t}$ be the represented class of closed arithmetical sentences whose codes can be placed in $S$'s active prediction register at $t$. Let
$$
E_{S,t}\in\mathsf{TC}_{S,t}
$$
be the time-indexed diagonal sentence of Theorem A.5.6a.2. A represented domain
$$
D_{S,t}\subseteq\mathsf{TC}_{S,t}
$$
is **live-diagonal complete for $(S,t)$** when $E_{S,t}\in D_{S,t}$. Historical processing of $E_{S,t}$ at a later cycle is not same-cycle closure on $D_{S,t}$.

<a id="definition-a62-internal-finite-cycle-closure-map"></a>**Definition A.6.2 (Internal finite-cycle closure map).** Let $D_{S,t}\subseteq\mathsf{TC}_{S,t}$. An $S$-internal map
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

<a id="theorem-a62-no-total-standard-sound-live-diagonal-self-closure"></a>**Theorem A.6.2 (No total standard-sound live-diagonal self-closure).** Let $S$ be trace-certified, fix $t$, and let $D_{S,t}$ be live-diagonal complete for $(S,t)$. No $S$-internal finite-cycle closure map on $D_{S,t}$ is both total and standard-sound.

*Proof.* Since $E_{S,t}\in D_{S,t}$, totality gives
$$
\operatorname{Cl}_{S,t}(E_{S,t})\in\{0,1\}.
$$
If this value is $1$, then $P_S(t,\ulcorner E_{S,t}\urcorner)=1$, so Equation A.5.6a.3 makes $E_{S,t}$ false in $\mathbb N$, contradicting standard soundness. If the value is $0$, then $P_S(t,\ulcorner E_{S,t}\urcorner)=0$, so Equation A.5.6a.3 makes $E_{S,t}$ true in $\mathbb N$, again contradicting standard soundness. The remaining value $\bot$ violates totality. ∎

### A.6.2 Stable partial closures

<a id="definition-a63-stable-axiom-stabilizer"></a>**Definition A.6.3 (Stable axiom-stabilizer).** A **stable axiom-stabilizer** for a predictor $S$ under finite budget $B$ is a tuple
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

<a id="theorem-a64-axiom-stabilizer-necessity-for-nontrivial-verified-prediction"></a>**Theorem A.6.4 (Axiom-stabilizer necessity for nontrivial verified prediction).** Every nontrivial finite prediction-update cycle satisfying the Fundamental Predictive Loop, binary verification, finite-budget retention, the live-diagonal guard, and composition, logical-memory, and uniform-specification rules that preserve the declared verification predicate modulo the retained response quotient induces a stable axiom-stabilizer on its retained finite response domain. Conversely, every stable axiom-stabilizer supplies the data of an axiom-like local formal system for the corresponding retained prediction-update domain.

*Proof.* Let such a cycle be given. It contains a finite prediction object, a finite response protocol, a returned response $r$ in a finite response set $R$, and an acceptance set $A\subseteq R$. Remark A.0.1.1 therefore gives
$$
V_A(r)=\mathbf 1_A(r).
$$
Let $D_{S,B}$ be the finite or finitely generated domain of claims actually queried, verified, remembered, composed, or updated within the retained finite budget $B$. Let $J_{S,B}$ be its accepted seed claims, let $\vdash_{S,B}$ be the retained composition, memory, and uniform-specification relation, and let $q_{S,B}$ identify claims with the same retained protocol-response role.

Finite response holds by finite-budget retention. Local soundness holds by the verification-preservation hypothesis. Composition closure follows from the retained-rule hypothesis. The live-diagonal guard is a theorem hypothesis; Theorem A.6.2 shows that a standard-sound domain containing $E_{S,t}$ cannot instead carry a total same-cycle Boolean closure. If the relevant response-equivalence class has an attained PCE minimum, replacing the stabilizer by a least-cost representative preserves every retained response and gives PCE minimality. Hence the cycle induces a stable axiom-stabilizer.

Conversely, a stable axiom-stabilizer supplies accepted seeds, a retained inference/update relation, a verification predicate, and a response quotient on its retained domain. These data are an axiom-like local formal system, with omission, abstention, or historical deferral at the live boundary rather than a total same-cycle truth predicate. ∎

<a id="corollary-a65-generative-non-closure-chain"></a>**Corollary A.6.5 (Generative non-closure chain).** For every trace-certified predictor $S$ and targeted cycle $t$, every standard-sound same-cycle closure on a represented domain must omit $E_{S,t}$, return $\bot$ on it, or defer it to a later cycle. Equivalently, any total same-cycle Boolean closure on a domain containing $E_{S,t}$ relinquishes standard soundness at that live diagonal sentence.

Independently, every nontrivial finite verified prediction-update cycle satisfying all hypotheses of Theorem A.6.4 induces a stable axiom-stabilizer. When a PCE minimizer exists in the relevant response-equivalence class, the retained stabilizer may be represented by a least-cost member of that class. Live-diagonal non-closure alone neither constructs nor uniquely selects an axiom-stabilizer.

*Proof.* The first assertion is the contrapositive form of Theorem A.6.2 with the three permitted boundary treatments made explicit; a total Boolean alternative remains possible only by loss of standard soundness. The stabilizer conclusion is Theorem A.6.4, and the PCE statement is clause 5 of Definition A.6.3. The hypotheses of Theorem A.6.4 are independent additional premises, so the final qualification follows. ∎

<a id="theorem-a66-conservativity-of-the-generative-non-closure-vocabulary"></a>**Theorem A.6.6 (Conservativity of the generative non-closure vocabulary).** Assume Definitions A.6.1–A.6.3 are explicit, nonrecursive definitions in the preceding PU language. Adding the vocabulary of generative non-closure, stable partial closure, and axiom-stabilizer is then a definitional and status-conservative extension of the preceding PU formal apparatus. It changes no theorem in the earlier language, branch condition, numerical backbone value, or certificate status unless a later theorem changes the underlying response domain, cost functional, PPI quotient, or branch certificate.

*Proof.* Let $L$ be the preceding PU language and $L^+$ its expansion by the symbols introduced in Definitions A.6.1–A.6.3. Define a translation $\tau$ from $L^+$-formulas to $L$-formulas by replacing every new atomic expression by its explicit definiens and then commuting $\tau$ with Boolean connectives and quantifiers. Because the definitions are explicit and nonrecursive, this process terminates and $\tau(\phi)=\phi$ for every $L$-formula $\phi$.

Consider an $L^+$-derivation and induct on its length. An old axiom translates to itself. A defining axiom translates to an identity between an $L$-formula and itself. If a line follows by modus ponens or generalization, its translation follows by the same inference rule from the translations of the preceding lines. Thus every $L^+$-theorem $\phi$ has an $L$-proof of $\tau(\phi)$. In particular, if $\phi$ belongs to $L$, then $\tau(\phi)=\phi$, so the expansion proves no new theorem in the earlier language.

Branch conditions, numerical values, and certificate statuses are expressions in the earlier ledger unless a later theorem explicitly changes their defining data. Their translations are therefore identical to themselves, establishing status conservativity under the stated qualification. ∎

**Cosmology typing guardrail.** Generative non-closure implies neither a vacuum instanton, positive cosmological constant, nor a low-entropy macrostate. Any bridge must independently fix a vacuum response map, reachability, exponent, prefactor interval, coarse-graining map, entropy residual, and structural dependencies under Definition 2.4.1d.

**Instance verification versus total generation.** A particular external response $r$ is finitely verifiable only when $V_A(r)$ is represented by an executable procedure with certified finite cost. Theorem A.6.2 separately excludes a total standard-sound same-cycle closure on a domain containing the targeted live diagonal sentence. Historical verification, fixed finite instances, and uniform same-cycle generation have different domains and quantifier order; no P-versus-NP or finite-instance hardness statement follows.

<a id="definition-a67-finite-stabilizer-comparison-certificate"></a>**Definition A.6.7 (Finite Stabilizer-Comparison Certificate).** For a declared finite exhaustive comparison class $\mathfrak S_{\mathrm{stab}}$, a stabilizer-comparison certificate records for every $S\in\mathfrak S_{\mathrm{stab}}$: its response envelope, stabilization verdict, response-equivalence class and PCE cost interval. It supplies a finite failure witness for every unstable entry, a strict cost-separation witness for every stable class above the attained minimum, and an exact equality witness for every member of the complete minimizing class set. A uniqueness claim additionally requires that this set contain exactly one response-equivalence class. The unresolved set is required to be
$$
\mathcal R_{\mathrm{stab}}=\varnothing.
\tag{A.6.7.1}
$$

<a id="proposition-a68-finite-class-pce-minimal-stabilizer-uniqueness"></a>**Proposition A.6.8 (Finite-Class PCE-Minimal Stabilizer Uniqueness).** If the PU class stabilizes the declared response envelope and every competing class either fails stabilization or has cost lower bound strictly above the PU class's cost upper bound, then the PU class is the unique PCE-minimal stabilizing class inside $\mathfrak S_{\mathrm{stab}}$, up to response-equivalent representatives. The conclusion is relative to the declared exhaustive finite class and does not rule out unlisted mechanisms.

*Proof.* Let $[S]$ be a response-equivalence class in $\mathfrak S_{\mathrm{stab}}$ distinct from the PU class. The exhaustive certificate contains exactly one of the two relevant verdicts. If $[S]$ fails stabilization, it is not an admissible stabilizing competitor. Otherwise its certified cost lower bound $L_S$ and the PU cost upper bound $U_{PU}$ satisfy
$$
L_S>U_{PU}.
$$
Every representative of $[S]$ has cost at least $L_S$, while the certificate supplies a PU representative of cost at most $U_{PU}$. Hence every stabilizing class distinct from the PU class has strictly greater cost. The PU class is therefore the unique minimal stabilizing response-equivalence class in the declared finite comparison set. Because the certificate is exhaustive only for $\mathfrak S_{\mathrm{stab}}$, no conclusion follows for mechanisms outside that set. ∎

<a id="theorem-a68a-budget-indexed-exhaustion-and-the-no-finite-global-manifest-boundary"></a>**Theorem A.6.8a (Budget-Indexed Exhaustion and the No-Finite-Global-Manifest Boundary).** Assume the retained specification language is scalable: for infinitely many budgets $B_1<B_2<\cdots$ it admits stable finite response roles that are pairwise inequivalent under the retained response quotient. Then no single finite manifest of response-equivalence classes is exhaustive over all budgets. For a fixed budget $B$, however, if the program alphabet is finite, code length is bounded by $B$, and stabilization, response equivalence, and cost comparison are decidable on each code, the complete normal-form quotient is finite and effectively enumerable; Proposition A.6.8 then gives uniqueness exactly when its strict cost-separation hypotheses hold.

*Proof.* A finite manifest contains finitely many response-equivalence classes, while the scalability hypothesis supplies infinitely many pairwise inequivalent stable roles. At least one class is therefore absent, so the manifest is not exhaustive.

At fixed $B$, only finitely many words over a finite alphabet have length at most the code-length bound. Enumerate them and discard ill-formed words. For every well-formed code, the assumed stabilization decider supplies its verdict and a terminating trace; retain that trace as the finite failure witness for each unstable code. Compute response equivalence and exact costs on the stable codes, retain a least-cost normal form for each response class, and list every class attaining the overall minimum. These computations terminate because the admitted code set is finite. Definition A.6.7 records the resulting exhaustive table with failure, strict-separation or exact-equality witnesses, and Proposition A.6.8 proves uniqueness on its stated strict-gap branch. ∎

Thus no single finite manifest is an exhaustive all-budget comparison on every language satisfying the scalability hypothesis of Theorem A.6.8a. This does not refute existence or uniqueness of a global least-cost class: infinitely many distinct classes can have costs $0,1,2,\ldots$ and a unique minimum. Definition A.6.7 supplies the budget-indexed finite comparison certificate; mechanisms outside that budget belong to a different comparison domain. Any global uniqueness conclusion requires additional information comparing the unlisted classes.

### A.6.3 Response-free domain exclusion

<a id="theorem-a68b-scalable-language-budget-eight-census-and-all-price-minima"></a>**Theorem A.6.8b (Scalable-Language Budget-Eight Census and All-Price Minima).**

#### 2. Specified comparison data

Fix the following budget-indexed mathematical comparison problem, its deliberately small budget-eight slice and its explicit scalable extension.

1. **Base and cycle.** The arithmetic base is PA with its usual standard-natural-number interpretation. The active cycle is $t=0$.
2. **Retained queries.** The two ordered query labels are the distinct sentences $H_0$: $(0=0)$ and $H_1$: $(1=1)$. Their truth and finite reflexivity verification are fixed.
3. **Task.** A response must make at least one correct Boolean acceptance, and every Boolean judgment must be standard-sound. The value 1 asserts truth, 0 asserts falsity, and bottom is explicit abstention.
4. **Complete scalable grammar.** Use the 14-symbol alphabet consisting of nine distinct tokens $\mathrm{Tab}(a,b)$, for $a,b\in\{\text{bottom},0,1\}$, and five distinct tokens $N,E,P,U,Z$. The well-formed words are exactly $\mathrm{Tab}(a,b)$, $\mathrm{Tab}(a,b)N$, and $W_n=EP^{8}U^{n}Z$ for integers $n\ge 2$. No other word is well formed. The two table families are exactly the original 18-word grammar. The new family and its complete ledger are defined in section 6.
5. **Semantics.** A table word outputs $a$ on $H_0$, $b$ on $H_1$, and bottom on every other sentence code; $N$ is a response-null no-op. For $n\ge 2$ let $H_{n}$ be the atomic reflexivity sentence $(n=n)$, with $n$ written as the corresponding standard numeral. $W_{n}$ outputs 1 on $H_0$ and $H_{n}$ and bottom everywhere else, including $H_1$. Every lookup is independent of $t$; $t=0$ is the active cycle. Its retained domain is $\{H_0,H_1\}$ for table words and $\{H_0,H_1,H_n\}$ for $W_{n}$. The common task requires at least one correct acceptance on $H_0$ or $H_1$ and soundness of every Boolean output.
6. **Response quotient.** Two programs are equivalent exactly when their total, finitely supported ternary response maps on sentence codes agree. At $B=8$ every admitted program is a table word, so this quotient is exactly equality of its entire ordered pair $(a,b)$, with default bottom elsewhere. Query order is not forgotten and the two one-acceptance classes remain distinct.
7. **Budget.** At budget $B$ a word is admitted exactly when it is well formed, its code length $L$ is at most $B$, and its raw processing count is at most $B$. The target slice is $B=8$. Section 6 proves this slice consists exactly of the original 18 words, whose lengths are at most two. There is one sweep over each word’s explicitly retained queries and one maintenance interval. Prices weight the objective and never replace the raw transaction budget.
8. **Cost convention.** The one-use transaction/cell/cell-tick ledger in section 3 is the comparison cost. All category prices are one, the reward per correct acceptance is one, and the penalty per false Boolean judgment is one. No register reset is performed or priced. These are stipulated transaction units, not joules, measured device costs or an indefinitely reusable cycle.
9. **Comparison boundary.** Every budget-admitted word of the complete scalable grammar is compared. The requested minimum is over its $B=8$ slice. No arbitrary physical implementation class is identified with this formal language, and no finite manifest is claimed exhaustive over its unbounded budgets.

Definition 15 declares an objective on a specified admissible comparison class; it does not require these prices to be uniquely dictated by a physical law. The language, comparison and prices are specified data, with no unique or independent upstream selection theorem asserted.

#### 3. Complete one-use ledger

For a word of length $L\in\{1,2\}$, let $k$ count its 1 outputs, $e$ count its 0 outputs and $u=k+e$ count its Boolean outputs. Use the exact six-vector

\[
(c_{\rm acq},c_{\rm repr},c_{\rm proc},c_{\rm upd},c_{\rm maint},c_{\rm adapt})
=(2+L,\ 2+L,\ 4+L+u,\ u,\ 2+u,\ u).
\tag{A.6.8b.1}
\]

Its owners are explicit:

- Acquisition loads two claim-source labels and L code tokens.
- Representation stores those 2+L cells.
- Processing performs two label comparisons, two response emissions, L code decodes and u reflexivity checks.
- Update writes u Boolean judgments.
- Maintenance retains two label cells and u judgment cells for one interval.
- Adaptation evaluates u guarded retention steps.

The comparison does not discard a cost category merely because it is common to several candidates. The complete unit-price objective is

\[
V=\sum c_\bullet-k+e
=10+3L+4u-k+e
=10+3L+3k+5e.
\tag{A.6.8b.2}
\]

Acquisition and representation are different declared resources: a loading transaction and a stored cell. A held cell-tick is distinct from both. No physical energy is counted twice because no assertion identifies these separate transaction types with one energy transfer. Likewise no unperformed cyclic reset is included. This is the declared one-use convention.

The processing budget holds for every admitted word, including failed candidates:

\[
c_{\rm proc}=4+L+u\le4+2+2=8.
\tag{A.6.8b.3}
\]

#### 4. Stabilization and exhaustive coverage

#### 4.1 Syntax and quotient

There are $3^{2}=9$ table tokens and exactly two table words per token. Section 6 proves all new $W_{n}$ words exceed $B=8$. Therefore the budget-eight slice admits precisely 18 words. Every possible ternary output pair on the retained two-query domain occurs, so the response table is not a selected subset of available output behaviors. The $N$ suffix changes no response, and two different table tokens differ on at least one retained query. Hence there are exactly nine response-equivalence classes, each containing its length-one and length-two representative.

Every other word either fails the explicit syntax rule or is a $W_{n}$ whose certified processing count exceeds eight. These are terminating syntax and arithmetic tests, not an assumed solution to an arbitrary program's halting or stabilization problem.

#### 4.2 Finite trace, soundness, and live-diagonal guard

The register map is a total primitive-recursive finite lookup. For each concrete time and sentence code, PA proves the actual output value and the negation of the two alternative values by evaluating the finite comparisons. It therefore has the trace-certification property of Definition A.5.6a.1.

For the selected predictor, use the explicit fixed-point construction in Theorem A.5.6a.2. Its sentence has the outer form

\[
E_{S,0}=\exists v\,[D(\bar n,v)\wedge\neg\operatorname{Pred}_S(\bar0,v)].
\]

As a syntactic formula this is distinct from either atomic reflexivity sentence H0 or H1. The lookup therefore returns bottom on its code. The retained domain is {H0,H1}; the live-diagonal sentence is omitted and receives bottom under the total lookup extension. Thus the original same-cycle guard remains intact. The guard does not yield a total same-cycle truth predicate.

For each response pair without a 0, take its seeds to be exactly the claims assigned 1; take identity and idempotent memory of accepted claims as the retained inference/update rules. Reflexivity verifies every seed, repeated admitted updates preserve verified truth, and no new judgment outside the domain is introduced. The retained query labels and their lookup outcomes define the response roles. These choices satisfy finite response, local soundness, composition closure and the live-diagonal guard of Definition A.6.3.

Any pair containing 0 gives a false Boolean judgment on an actually true sentence and fails standard soundness. The pair (bottom,bottom) makes no correct Boolean acceptance and fails the explicitly adopted task. Consequently the response-feasible classes are exactly

\[
(1,\bot),\quad(\bot,1),\quad(1,1).
\tag{A.6.8b.4}
\]

PCE minimality within each response class is addressed next; it must not be conflated with response feasibility.

#### 4.3 Full nine-class and 18-word certificate

Both representatives of every response class appear in the table. Each listed objective is exact, rather than an uncertainty interval.

| Response pair | $L=1$ objective | $L=2$ objective | Response verdict / explicit witness |
|---|---:|---:|---|
| (bottom,bottom) | 13 | 16 | Fails: no accepted claim |
| (bottom,0) | 18 | 21 | Fails: H1 is true |
| (bottom,1) | 16 | 19 | Response-feasible |
| (0,bottom) | 18 | 21 | Fails: H0 is true |
| (0,0) | 23 | 26 | Fails: both claims are true |
| (0,1) | 21 | 24 | Fails: H0 is true |
| (1,bottom) | 16 | 19 | Response-feasible |
| (1,0) | 21 | 24 | Fails: H1 is true |
| (1,1) | 19 | 22 | Response-feasible |

Within every response class, N adds one acquisition, one representation and one processing transaction and changes no other charge or response. Therefore

\[
V(\operatorname{Tab}(a,b)N)-V(\operatorname{Tab}(a,b))=3.
\tag{A.6.8b.5}
\]

For the three response-feasible classes, the length-one word is the unique least-cost representative. The length-two words remain response-feasible but fail the within-class least-cost requirement in Definition A.6.3. They are not incorrectly called stable representatives merely because their response class is feasible.

The exact normal-form intervals are [16,16], [16,16] and [19,19]. The intervals [16,19] would instead conflate different representatives; they are not used in a strict-gap comparison.

#### 5. Complete minimum and exact witnesses

There are three stabilizing normal forms, and their costs are exactly 16,16,19. Thus the two one-acceptance classes attain the minimum. They are response-distinct because their ordered vectors differ. Their exact equality is the required co-minimizer witness. The sole remaining stabilizing class has strict gap

\[
19-16=3.
\tag{A.6.8b.6}
\]

All other response classes have the finite failure witnesses in the table. All no-op representatives have the within-class domination witness (A.6.8b.5). Ill-formed words are rejected by the complete grammar, and every well-formed extension word has the explicit over-budget witness in section 6. Hence every admitted competitor is covered and the unresolved comparison set is empty.

This is the complete co-minimizer alternative. Proposition A.6.8's stronger uniqueness conclusion is not invoked: its strict gap against every distinct class is false for either one-acceptance winner, because the other winner ties it.

Finite attainment here follows from the nonempty finite comparison class, not from a dynamical convergence assertion. No adaptation trajectory or global PCE attractor is claimed; Definition 15a's additional dynamical requirements are therefore not silently presumed.

#### 6. Genuine scalable extension with exactly the same budget slice

#### 6.2 One fixed finite alphabet, grammar, quotient and budget rule

Use the 14-symbol alphabet and complete grammar of section 2. For $n\ge 2$ the new code is

\[
W_n=E\,P^8\,U^n\,Z,\qquad L_n=n+10.
\tag{A.6.8b.S1}
\]

The fixed eight P symbols are explicitly disclosed padding and are decoded and charged; they have no response effect. The padding is part of the specified language. No other extension words, optional suffixes, alternate encodings or unlisted implementations are admitted.

The sentence $H_{n}$ is the syntactically distinct atomic formula “standard numeral $n$ equals standard numeral $n$.” The new code returns 1 on $H_0$ and $H_{n}$ and bottom elsewhere. Its retained ordered query list is $(H_0,H_1,H_n)$. Thus every $W_{n}$ meets the same mandatory acceptance requirement on the original two queries, by accepting $H_0$; it does not substitute an unrelated task that only accepts the new query.

The global response quotient is equality of the complete total response map. It is decidable by comparing the finite non-bottom dictionaries, with all unspecified codes assigned bottom. Its restriction to the old words is precisely equality of $(a,b)$: it neither merges the two old winners nor splits any old class. For $n\ne m$, $W_n$ and $W_{m}$ differ on $H_{n}$. Every $W_{n}$ also differs from every old word on $H_{n}$. Therefore each new class has exactly one representative in the entire language.

The global admissibility rule is the same at every $B$: well-formed syntax, $L\le B$, and raw processing count at most $B$. It is not a separate, outcome-dependent filter applied to the new family.

#### 6.3 Uniform six-category ledger

For a word with $d$ retained query labels, length $L$, $k$ accepted true queries, $e$ false judgments and $u=k+e$ Boolean outputs, extend the same declared one-use counting convention by

\[
(c_{\rm acq},c_{\rm repr},c_{\rm proc},c_{\rm upd},c_{\rm maint},c_{\rm adapt})
=(d+L,\ d+L,\ 2d+L+u,\ u,\ d+u,\ u).
\tag{A.6.8b.S2}
\]

The owners remain exactly the old ones: acquire and store d query labels and L code tokens; perform d label comparisons, d emissions, L decodes and u reflexivity verifications; write u judgments; hold d label cells and u judgment cells for one interval; and perform u guarded retention steps. For the old words $d=2$, so (A.6.8b.S2) is componentwise identical to (A.6.8b.1), not merely equal after summation. No old response, transaction, price, reward or penalty changes.

These are stipulated symbolic transaction/cell/cell-tick units. A label comparison or reflexivity verification is one declared symbolic transaction, not a claim that arbitrary-length numeral arithmetic takes one bit operation or one fixed-duration physical step. The input and output labels and their literal comparisons are finitely encoded, executable operations for every finite n. Reading the unary extension code is charged L decodes. No hardware-energy, bit-complexity or uniform physical latency conclusion is inferred from this ledger.

For $W_n$, $d=3$, $k=u=2$ and $e=0$, whence

\[
(c_{\rm acq},c_{\rm repr},c_{\rm proc},c_{\rm upd},c_{\rm maint},c_{\rm adapt})
=(n+13,\ n+13,\ n+18,\ 2,\ 5,\ 2).
\tag{A.6.8b.S3}
\]

Its complete unit-price objective is finite, specifically 3n+51 after the two correct-acceptance rewards. This value is not used to exclude it from the $B=8$ comparison: the exclusion follows from its raw processing count, independently of prices. All six charges remain explicit, including the common and padding charges.

#### 6.4 Infinite stable roles and exact attained representatives

Each $W_{n}$ is a total primitive-recursive finite lookup. PA proves each concrete output and excludes the two alternative values by evaluating the finitely encoded equality tests. The same-cycle diagonal sentence from the explicit fixed-point construction has outer existential form and therefore is distinct from every atomic $H_{j}$; it receives bottom, including for the predictor defined by $W_{n}$.

For $W_{n}$ take retained domain $\{H_0,H_1,H_n\}$, seeds $\{H_0,H_n\}$, the reflexivity verifier, and identity/idempotent memory as its inference and update rules. Every asserted Boolean value is true. The seeds are nonempty and contain an accepted original query. The finite rules preserve the verifier and remain inside the retained domain under composition. The diagonal is excluded and assigned bottom by the total extension. Thus the finite-response, local-soundness, composition and live-diagonal clauses of Definition A.6.3 hold.

Set

\[
B_n=n+18\qquad(n=2,3,\ldots).
\tag{A.6.8b.S4}
\]

Then $L_n=n+10\le B_n$, and (A.6.8b.S3) has processing count exactly $B_{n}$. Hence $W_{n}$ is admitted at $B_{n}$. Its response class contains no other well-formed word at any budget, so its objective minimum within that class is attained by $W_{n}$ itself. This also supplies the within-class PCE-minimality clause; it does not rely on a conjectured convergence trajectory or on a strict positive price. Consequently $W_{n}$ is a stable finite response role at $B_{n}$. The budgets 20,21,22,… are strictly increasing, and the corresponding response classes are pairwise inequivalent. This proves the full scalability hypothesis of A.6.8a for this one fixed language and quotient.

The logical guard remains necessary. Neither the scalable extension nor the scalable extension allows a total same-cycle truth predicate.

#### 6.5 Exact unchanged B=8 slice

Every old table word has $L\le 2\le 8$ and processing $4+L+u\le 8$, so all 18 are admitted. Every $W_{n}$ has

\[
L_n\ge12>8,\qquad c_{\rm proc}(W_n)=n+18\ge20>8.
\tag{A.6.8b.S5}
\]

It is therefore excluded by both explicit budget tests, with an integer certificate. Every other word is ill formed. These three disjoint cases exhaust all words over the fixed alphabet. Thus the $B=8$ admitted set is exactly the old 18 words.

The response maps, restricted quotient, retained domain, six category charges, unit-price objectives, feasibility witnesses, least-cost representatives and complete minimizing set are all identical to those proved in sections 3–5. No global length-two constraint is imposed: the length-two maximum is a proved property of this particular budget slice. No new response-equivalent implementation can change an old class minimum at any larger budget, because each $W_{n}$ differs from every old response map.

#### 6.6 All finite-budget deciders are explicit

The grammar test first checks a one-token table or two-token table-$N$ word, then checks the exact extension form $EP^{8}U^{n}Z$ with $n\ge 2$, and rejects everything else. Every branch terminates. Decoding supplies $L$, $d$, $k$, $e$ and the exact ledger. Admissibility is an integer comparison with $B$.

At any fixed $B$ there are finitely many candidate words because the alphabet is finite and $L\le B$. More directly, the new admitted parameters are exactly the integers $2\le n\le B-18$, and each old word has its explicit individual processing test. Empty parameter intervals admit no extension words. These formulas give a complete terminating enumeration.

Response equivalence is finite-dictionary equality. At the fixed unit prices, every old response class has its length-one representative whenever either old representative is admitted; a no-op is strictly dominated by 3. Old soundness and nontriviality are decided by the nine-row table. Each admitted $W_{n}$ satisfies the explicit stabilizer construction and is the sole member of its class. Thus stabilization and least-cost normal-form selection are decidable for every code. All costs are integers, so exact cost comparison terminates. These facts discharge every stated fixed-budget hypothesis in A.6.8a, rather than assuming undecidable semantic equivalence or arbitrary-program stabilization is available.

For the price-parametric $B=8$ theorem of section 7, the supplied prices must have decidable exact comparisons as already stated. The raw-budget exclusion (A.6.8b.S5) is unaffected even if every price is zero.

#### 6.7 Consequence and scope

The finite census is embedded in one scalable language with exactly the same budget slice.

The result remains the full co-minimizer alternative at $B=8$. It does not select one of the tied winners or claim that a finite manifest exhausts all budgets. Indeed, the infinitely many $W_{n}$ classes directly show why no finite manifest can exhaust this language globally. The adopted language and transaction units are disclosed formal choices, not uniquely selected physical laws.

#### 7. Independently derived classifier for all nonnegative prices

The following price classification uses the same ledger; the unit-price census and scalable-language embedding do not depend on it.

Keep the complete scalable grammar, its $B=8$ raw processing-transaction budget, semantic soundness test and response quotient fixed. By (A.6.8b.S5), the admitted slice remains the same 18 words at every price assignment. Let the six nonnegative prices be

\[
a,r,p,u,m,d\ge0
\]

for acquisition, representation, processing, update, maintenance and adaptation. Here the letter r is a representation price, not a reward. Prices weight the objective; they do not alter the hard budget of eight processing transactions. Allow nonnegative rewards rho0,rho1 for correct acceptances of H0,H1, and nonnegative penalties eta0,eta1 for false Boolean judgments. Exact comparisons of the declared numbers are assumed available, as in the original finite-comparison theorem.

For a response $z=(z_0,z_1)$, put

\[
C=2a+2r+4p+2m,\qquad S=a+r+p,\qquad T=p+u+m+d.
\tag{A.6.8b.7}
\]

Direct expansion of the same ledger gives

\[
V_L(z)=C+LS
+\sum_{i:z_i=1}(T-\rho_i)
+\sum_{i:z_i=0}(T+\eta_i).
\tag{A.6.8b.8}
\]

False-judgment classes remain infeasible even when penalties vanish: standard soundness is a hard task constraint, not a preference bought off by a low price. The all-abstention pair still violates nontrivial acceptance. Thus exactly the same three response classes in (A.6.8b.4) remain feasible.

Because $S\ge 0$, the length-one representative always attains each class minimum. If $S>0$, it is the unique least-cost representative. If $S=0$, both word lengths tie; both must be retained as within-class minimum representatives. This resolves all normal-form/no-op equality boundaries rather than silently retaining the positive-price domination claim.

Define

\[
\delta_0=T-\rho_0,\qquad\delta_1=T-\rho_1.
\]

After subtracting the common C+S, the three class costs are exactly

\[
q_0=\delta_0,\qquad q_1=\delta_1,\qquad
q_{01}=\delta_0+\delta_1.
\tag{A.6.8b.9}
\]

The full minimizing response-class set is determined by the following nonexclusive tests:

\[
\begin{aligned}
[(1,\bot)]\text{ minimizes}
&\iff \delta_0\le\delta_1\ \text{and}\ \delta_1\ge0,\\
[(\bot,1)]\text{ minimizes}
&\iff \delta_1\le\delta_0\ \text{and}\ \delta_0\ge0,\\
[(1,1)]\text{ minimizes}
&\iff \delta_0\le0\ \text{and}\ \delta_1\le0.
\end{aligned}
\tag{A.6.8b.10}
\]

**Proof.** The first class minimizes precisely when $q_0\le q_1$ and $q_0\le q_{01}$. These are $\delta_0\le\delta_1$ and $\delta_1\ge 0$. The second line follows identically. The third class minimizes precisely when $q_{01}\le q_0$ and $q_{01}\le q_1$, which are $\delta_1\le 0$ and $\delta_0\le 0$. A minimum exists because there are three finite exact values, so at least one test holds. The tests intentionally overlap exactly on ties. Together with the $S=0$ rule, they enumerate every minimizing word and response class. ∎

For the useful common-reward specialization $\rho_0=\rho_1=\rho$, let $\delta=T-\rho$. Then:

- $\delta>0$: the two one-acceptance classes tie and are the complete minimum; the other stable class has gap $\delta$.
- $\delta=0$: all three response classes tie.
- $\delta<0$: the two-acceptance class is uniquely minimal among response classes; each one-acceptance class has gap −delta.

At unit prices and unit rewards, $C=10$, $S=3$, $T=4$ and $\delta=3$, recovering exactly the minimum 16 and gap 3.

For unequal rewards, all equality boundaries are already contained in (A.6.8b.10). For an exact general gap rule put $q_{\min}=\min(q_0,q_1,q_{01})$. Every excluded feasible class has gap $q_i-q_{\min}>0$. If any excluded feasible class exists, the finite minimum of those positive differences is the exact next-class gap; if all three tie, there is no excluded stable class and no positive next-class gap to report. No-op gaps are separately $S$ and vanish exactly when $S=0$.

The classification covers nonnegative prices with zero coordinates and every exactly comparable nonnegative reward/penalty assignment on this same task. It does not prove that these prices are empirically realized or that one price assignment is uniquely selected.

<a id="theorem-a68c-complete-all-budget-minima-of-the-scalable-stabilizer-language"></a>**Theorem A.6.8c (Complete All-Budget Minima of the Scalable Stabilizer Language).** Retain the entire alphabet, grammar, response quotient, task, six-category transaction ledger and raw budget rule of Theorem A.6.8b. Let $B$ be a nonnegative integer; a nonintegral budget has the same admitted words as its integer part. Give the six cost categories nonnegative prices $a,r,p,u,m,d$. For every $j\ge0$, give a correct acceptance of $H_j$ a nonnegative reward $\rho_j$ and a false Boolean judgment a nonnegative penalty $\eta_j$. At each finite budget all numbers used are supplied with decidable exact comparisons. These prices change the objective, not the grammar, soundness condition or raw processing budget. Put
$$
C=2a+2r+4p+2m,\qquad S=a+r+p,\qquad T=p+u+m+d,
\qquad \delta_i=T-\rho_i\quad(i=0,1).
$$
Then the following statements give the complete census and every minimum.

1. A table word of length $L\in\{1,2\}$ with $v$ Boolean outputs is admitted exactly when $4+L+v\le B$. Every extension word admitted at $B$ is exactly one of
$$
W_n=EP^8U^nZ,\qquad 2\le n\le B-18.
$$
All other words fail the grammar or a raw budget test. A table word has the complete priced objective
$$
V_L(z)=C+LS+\sum_{i:z_i=1}(T-\rho_i)
                 +\sum_{i:z_i=0}(T+\eta_i).
$$
Its six resource counts remain $(2+L,2+L,4+L+v,v,2+v,v)$, including for an infeasible response. An extension has the six counts $(n+13,n+13,n+18,2,5,2)$ and objective
$$
V(W_n)=C+S+q_n,\qquad
q_n=(n+10)S+p+m+2T-\rho_0-\rho_n.
$$
2. There is no stabilizing response class for $B\le5$. At $B=6$ there are exactly the two one-acceptance classes. For $B\ge7$, the complete stabilizing normal-form class set is
$$
\mathcal I_B=\{0,1,01\}\ \cup\ \{n\in\mathbb Z:2\le n\le B-18\},
$$
where $0,1,01$ denote the distinct responses $(1,\bot),(\bot,1),(1,1)$, respectively; the integer indices denote the distinct $W_n$ responses. At $B=6$ use $\mathcal I_6=\{0,1\}$. The old class excesses above $C+S$ are
$$
q_0=\delta_0,\qquad q_1=\delta_1,\qquad q_{01}=\delta_0+\delta_1.
$$
The length-one table attains its class minimum. A length-two representative also attains it exactly when $S=0$ and it is admitted: $B\ge7$ for a one-acceptance class and $B\ge8$ for the two-acceptance class. Each $W_n$ is the sole word in its response class.
3. For every $B\ge6$, the attained minimum and the full minimizing response-class set are
$$
V_B^{\min}=C+S+\min_{i\in\mathcal I_B}q_i,
\qquad
\mathcal M_B=\{i\in\mathcal I_B:q_i=\min_{j\in\mathcal I_B}q_j\}.
$$
For an explicit extension-only evaluation when $B\ge20$, put
$$
h_B=\min_{2\le n\le B-18}(nS-\rho_n),\qquad
K_B=\{n:2\le n\le B-18,\ nS-\rho_n=h_B\}.
$$
The lowest extension excess is $10S+p+m+2T-\rho_0+h_B$, attained by exactly $K_B$. Compare this one value with every admitted old excess; retain all equalities. If $\mathcal I_B\setminus\mathcal M_B$ is nonempty, the exact next-class gap is
$$
\Delta_B=\min_{i\in\mathcal I_B\setminus\mathcal M_B}
       \bigl(q_i-\min_{j\in\mathcal I_B}q_j\bigr)>0.
$$
If the complement is empty, every stabilizing class minimizes and there is no excluded class to which a positive gap can be assigned. The length-two within-class increment is separately $S$.
4. If every correct-acceptance reward is the same $\rho$, set $\delta=T-\rho$. At $B=6$ both one-acceptance classes minimize. At $B\ge7$, the old minimizing classes are exactly the two one-acceptance classes when $\delta>0$, all three old classes when $\delta=0$, and the two-acceptance class when $\delta<0$. An admitted $W_n$ joins the minimum exactly when
$$
a=r=p=m=0\quad\text{and}\quad\delta\le0.
$$
This is also the complete classification over the union of all budgets: retain the indicated old classes and, precisely under this equality condition, every $W_n$ for $n\ge2$. Thus a global minimum exists for every such common-reward price assignment, even though the full response-class census is infinite.
5. At the unit prices and unit rewards of Theorem A.6.8b, the global minimum is $16$, attained by exactly the two one-acceptance response classes. The two-acceptance class costs $19$, and $W_n$ costs $3n+51$. The next-class gap is $3$ for every $B\ge7$ and over the union of all budgets. At $B=6$ both admitted stabilizing classes minimize. Each no-op representative costs $3$ more than its length-one representative.

*Proof.* A table word has length at most its processing count, and its count is $4+L+v$. The two raw budget tests therefore reduce to the displayed inequality. For $W_n$, the processing count $n+18$ exceeds its length $n+10$, so its exact admission condition is $2\le n\le B-18$. These families are the entire grammar of Theorem A.6.8b. Expanding all six priced charges gives the two objective formulas in item 1; each reward or penalty is then added once for its own judgment.

A sound table has no $0$ entry, and the task excludes the all-abstention table. The two one-acceptance tables have minimum processing count $6$ and the two-acceptance table has minimum count $7$. Every extension is sound, accepts the original query $H_0$, and has the stable finite inference, verification and live-diagonal guard construction of Theorem A.6.8b. Distinct extension parameters differ on their respective $H_n$; each differs from every table response on $H_n$. Thus the displayed class list is both sound and exhaustive. Appending $N$ adds one acquisition, representation and processing unit and changes no other entry. Its cost increment is $S\ge0$, proving the complete representative and zero-price tie statements.

For each $B\ge6$ the class list is finite and nonempty. Its exact costs attain a minimum, and exact comparisons retain precisely the minimizing indices. Factoring the $n$-independent terms from $q_n$ yields $h_B$ and $K_B$. Every excluded index has strictly positive excess, so their finite minimum is the displayed positive gap. This proves item 3 without treating a tied representative as a distinct response class.

For common reward, an admitted extension and the old two-acceptance class obey the exact identity
$$
V(W_n)-V\bigl(\operatorname{Tab}(1,1)\bigr)
=(n+10)S+p+m\ge0.
$$
The old two-acceptance class is already admitted whenever an extension is admitted. Since $n+10>0$ and all prices are nonnegative, equality holds precisely when $a=r=p=m=0$. Comparing the old excesses $\delta,\delta,2\delta$ proves item 4. The same domination holds for every $n\ge2$ without a budget bound, proving the all-budget union statement. Finally $C=10$, $S=3$, $T=4$ and $\delta=3$ at unit prices and rewards. Substitution gives all values and gaps in item 5. $\square$

<a id="proposition-a68d-a-complete-cost-census-does-not-determine-independence-of-registration-choices"></a>**Proposition A.6.8d (A Complete Cost Census Does Not Determine Independence of Registration Choices).** Even an exact exhaustive census with a unique attained minimizer does not determine whether the process choosing its rewards was independent of a preferred response class. This remains true with the budget, language, quotient, all six category prices and every cost count fixed as in Theorem A.6.8b.

*Proof.* Set $B=8$ and all six category prices to one. Let $R_0$ assign $(\rho_0,\rho_1)=(5,0)$ and $R_1$ assign $(\rho_0,\rho_1)=(0,5)$; use the same fixed nonnegative penalties in both. The old class excesses $(q_0,q_1,q_{01})$ are $(-1,4,3)$ under $R_0$ and $(4,-1,3)$ under $R_1$. Thus the first has the unique minimizing response $(1,\bot)$, the second has the unique minimizing response $(\bot,1)$, and both have minimum $12$ and next-class gap $4$.

Let a preferred-class index $z$ range over $\{0,1\}$. The constructor $F(z)=R_0$ has constant output and can use a constant control trace. The constructor $G(z)=R_z$ depends on $z$. At $z=0$ they produce identical registration bytes and therefore identical complete cost censuses and minimizer certificates. Nevertheless $F$ is functionally independent of $z$ and $G$ is not. Consequently no predicate of those common final bytes can correctly decide registration independence for both constructors. A construction or noninterference certificate distinguishes them because it retains the rule and its dependencies as well as the result. $\square$

<a id="theorem-a68e-constructively-independent-registration-and-the-complete-budget-eight-stabilizer-minimum"></a>**Theorem A.6.8e (Constructively Independent Registration and the Complete Budget-Eight Stabilizer Minimum).** There is an explicitly supplied formal registration source whose budget, scalable language, response domain and quotient, comparison class, cost units and all objective weights are independent of every preferred-stabilizer input in its complete declared causal model. On this source the budget-eight slice of Theorem A.6.8b has all eighteen words and nine response classes, and its minimizing classes are exactly the two one-acceptance classes. All six registration-service costs are included: with the registration cost $C_{\mathrm{reg}}=101259$ of the proof, the full minimum is $C_{\mathrm{reg}}+16=101275$ and the next-class gap is 3.

*Proof and supplied source.*

**1. Complete registration, fixed before any preferred-class or candidate input.** The following fields are the entire variable registration tuple R. They are literal constants of the source, not outputs of a minimizer computation.

- Base: PA with the standard natural-number interpretation; cycle zero. $H_{j}$ is the atomic standard-numeral reflexivity sentence $j=j$. Original query roles are the ordered pair $(H_0,H_1)$.
- Task: at least one acceptance on those original queries; every Boolean judgment must be standard-sound; all unspecified outputs are abstention, denoted bottom.
- Alphabet: the nine tokens $\mathrm{Tab}(a,b)$, for $a,b\in\{\text{bottom},0,1\}$, together with $N,E,P,U,Z$. The entire grammar consists of $\mathrm{Tab}(a,b)$, $\mathrm{Tab}(a,b)N$, and $EP^{8}U^{n}Z$ for integers $n\ge 2$. No other implementation primitive or encoding is admitted by this supplied formal source.
- A table returns $a$ on $H_{0}$ and $b$ on $H_{1}$. Its $N$ suffix has no response effect. An extension $W_n=EP^{8}U^{n}Z$ accepts $H_{0}$ and $H_{n}$. All other outputs are bottom. The retained ordered domain is $(H_0,H_1)$ for tables and $(H_0,H_1,H_n)$ for extensions.
- Equivalence is equality of the entire finitely supported ternary response map on sentence codes, with the default bottom extension and ordered query roles retained. Comparison includes every admitted word of the entire grammar, not a selected candidate list.
- Raw candidate budget $B=8$. Admission requires both $L\le 8$ and $2d+L+u\le 8$, where $L$ is candidate code length, $d$ the retained label count and $u=k+e$ the number of Boolean judgments, with $k$ true acceptances and $e$ false judgments.
- The six candidate-resource counts in acquisition, representation, processing, update, maintenance and adaptation order are $(d+L,d+L,2d+L+u,u,d+u,u)$. They mean: load $d$ labels and $L$ code tokens; store those $d+L$ cells; execute $d$ label comparisons, $d$ emissions, $L$ decodes and $u$ reflexivity checks; write $u$ judgments; hold $d$ label and $u$ judgment cells for one retained interval; execute $u$ guarded retention steps.
- All six prices equal one; each correct acceptance has reward one and each false Boolean judgment has penalty one. Resource units are the stated symbolic transactions, cells and cell-intervals. A symbolic cell can hold a finitely encoded label or fixed-length tuple, as in Theorem A.6.8b. No bit-operation, physical-joule or fixed-latency interpretation is asserted. There is one use, one retained maintenance interval and no cyclic reset.

These are exactly the grammar, response roles, six candidate counts, prices, rewards, penalties and two raw admission tests of Theorem A.6.8b. In particular, the extension family and its disclosed padding remain part of the language even though the extensions fail the budget-eight tests.

The literal serialization of R is the single line of ASCII bytes in the following block, without a trailing newline. The object keys are in displayed order; punctuation, spaces inside strings and the order of array entries are literal. The block is a source descriptor.

```text
{"acceptance_rewards":"1 for each correct acceptance","admission":"All and only well-formed words with code length L<=8 and raw processing 2*d+L+u<=8","alphabet":["Tab(bottom,bottom)","Tab(bottom,0)","Tab(bottom,1)","Tab(0,bottom)","Tab(0,0)","Tab(0,1)","Tab(1,bottom)","Tab(1,0)","Tab(1,1)","N","E","P","U","Z"],"base":"PA with standard natural numbers","category_prices":[1,1,1,1,1,1],"comparison":"Every admitted word of this entire grammar; no other implementation primitive in this formal source","cycle":0,"false_judgment_penalties":"1 for each false Boolean judgment","grammar":"Exactly Tab(a,b), Tab(a,b)N for a,b in {bottom,0,1}, and E P^8 U^n Z for integer n>=2","ledger":["d+L","d+L","2*d+L+u","u","d+u","u"],"ledger_owners":["load d labels and L code tokens","store d+L cells","d label comparisons,d emissions,L decodes,u reflexivity checks","write u Boolean judgments","hold d label cells and u judgment cells for one interval","u guarded retention steps"],"ledger_variables":"d retained query labels; L code tokens; k true acceptances; e false judgments; u=k+e; one use and one maintenance interval; no cyclic reset","queries":"H_j is the atomic standard-numeral reflexivity sentence j=j; original ordered queries are H_0,H_1","quotient":"Equality of complete finitely supported ternary response maps on all sentence codes; ordered query roles retained","raw_budget":8,"retained_domain":"(H_0,H_1) for table words; (H_0,H_1,H_n) for extension words","semantics":"Tab(a,b) gives a on H_0,b on H_1; N has no response; E P^8 U^n Z accepts H_0,H_n; every other output is bottom","task":"At least one acceptance on H_0 or H_1; every Boolean output is standard-sound; default abstention elsewhere","units":"Declared symbolic transaction,cell,cell-interval units; not joules or bit-operation counts"}
```

The byte count is $M=1807$. Its SHA-256 is 091795d5eccfd3d1f2e0dc4bd0c1b21931fa060ac4fe88b105e8c7137d287513; the checksum identifies the descriptor, and the full bytes define it. The eight-token constructor and its transition rule below are fixed literal source data too. There is no code/ROM selector, reward tuner, input-dependent compiler, seed or optimization oracle upstream of this data.

**2. Complete causal source and universal noninterference.** The full declared registration-source roots are the displayed ROM R, the fixed program C below, the all-blank output/trace arrays, the fixed eight-control-cell initial state, and the fixed one-use schedule and tariff. Every one is a constant root. None has an incoming preferred-class edge. The only preferred-class variable is an external diagnostic input z, supplied at the post-seal boundary. It is not consulted or stored by the registration source. Likewise the candidate word w is supplied only at the post-seal service boundary and cannot write the sealed registration. Retaining z separately is a distinct fixed boundary task, charged outside this certificate.

The preference input is not restricted to a particular winner. It may name any response class, any ordering of classes, or any finite desired-outcome description. Universal intervention on all such z values is allowed; the source uses none of their bits. Independence is noninterference in this causal model. Any model with a preference-dependent upstream code, ROM, seed, schedule or tariff selector is a different source and is expressly excluded from this theorem.

The program has eight fixed symbolic instruction tokens: READ, COPY, TEST, LOG, ADVANCE, SEAL, SERVE and HALT. Its bounded transition rule is as follows. Initially $i=0$, $\mathrm{seal}=0$ and output/trace arrays are blank. For $i=0,\dots,M-1$, READ loads $R_{i}$ into a control register; COPY writes that byte into output cell $i$; TEST compares the output byte with the ROM byte; LOG writes the tuple $(i,R_i,\mathrm{output}_i,\mathrm{test},i+1)$ into trace cell $i$; ADVANCE writes $i+1$ into the counter. If the test fails, execution halts in a retained failure state and no candidate is admitted. In the supplied noiseless formal source the test is identically true. At $i=M$, SEAL sets the seal bit to one. SERVE is enabled only when that bit is one and executes the candidate semantics of Theorem A.6.8b with the two declared raw budget checks; HALT ends the one-use service. Registration arrays remain read-only during service. No branch reads $z$ or any candidate word before sealing.

The eight control cells hold the counter, bound, seal flag, read register, comparison flag, program state, failure flag and ready flag. The fixed program occupies its own eight cells. The complete registration state therefore includes M ROM cells, M output cells, M trace cells, eight program cells and eight control cells. The formula above determines the complete trace, including every intermediate state.

Proof of noninterference is by induction on transitions. For any two interventions z and z' (and any two future candidate words), the initial registration states are identical because all their parents are the same constants. At each of the five loop operations the next state is a deterministic function of that state and $R_{i}$ only. Thus the states, read/write addresses, data, comparisons, emitted trace, resource operations and next program state agree. Induction gives equality of the entire M-step loop trace and of the seal transition. There is no preference-bearing upstream selector omitted from this graph: C, R, ready state, schedule and tariff are its explicit roots, and all are constant. Hence the output R, every registration field, every prefix trace and the exact registration-prefix invoice are invariant under every z intervention. This is the construction/noninterference certificate that, by Proposition A.6.8d, final census bytes cannot supply.

The source is frozen before any z or w input exists at its boundary and before the mathematical census below is evaluated. The supplied source has no feedback edge from that census into its constants. The census below is a proof about the frozen source; no candidate executes it.

**3. Owned registration service and exact budget join.** The source's one-use ledger uses the symbolic transaction, cell and cell-interval units of Theorem A.6.8b. Acquisition commissions all $3M+16$ listed cells/tokens and their literal contents or blank states. Representation reserves the same $3M+16$ cells. Processing executes five symbolic transactions per byte (READ, COPY, TEST, LOG, ADVANCE), one SEAL transaction and one fixed final HALT transaction after candidate service: $5M+2$. At every one of these $5M+2$ transactions the source actually rewrites all eight control cells, including cells whose value stays unchanged. COPY additionally writes its one output cell and LOG additionally writes its one trace cell. No other registration data write occurs. Update therefore counts exactly $8(5M+2)+2M=42M+16$ writes. This pays the READ register, TEST flag, counter, program state, ready, failure and seal fields, rather than dropping their transient writes. SEAL writes the ready state as part of its eight writes; HALT writes the final stopped state likewise. During SERVE the wrapper control/ROM/output/trace cells are fixed and read-only; the candidate service of Theorem A.6.8b owns its internal transactions. The final HALT is the separately paid wrapper stop. Maintenance holds all $3M+16$ cells for one fixed full-use symbolic interval covering the entire registration prefix, candidate service and final output-custody boundary. This is the declared one-use cell-interval unit of Theorem A.6.8b. Adaptation performs the one guarded seal-to-service authorization: one. The cost convention assigns initialization to acquisition and counts every subsequent wrapper write as update, so initialization is charged once. Complete program/control ownership is included.

Thus the common registration resource vector is

$$
c_{\mathrm{reg}}=(3M+16,\ 3M+16,\ 5M+2,\ 42M+16,\ 3M+16,\ 1),\qquad
C_{\mathrm{reg}}=\textstyle\sum c_{\mathrm{reg}}=56M+67=101259.
$$

These are six different resource kinds, with the same unit prices fixed in advance. Representation/custody and processing/update are separately declared charges. No unperformed reset or recycling cycle is presumed. All trace and failure records remain in the listed cells through the owned interval. Beyond that finite boundary, further storage is a different task.

For any candidate $w$ the one complete source ledger is $c_{\mathrm{total}}(w)=c_{\mathrm{reg}}+c_{\mathrm{candidate}}(w)$, and its total objective is

$$
V_{\mathrm{total}}(w)=C_{\mathrm{reg}}+\textstyle\sum c_{\mathrm{candidate}}(w)-k(w)+e(w).
$$

The hard processing bound is $B_{\mathrm{total}}=(5M+2)+8=9045$. The constant debit includes the terminal HALT as well as the prefix; the identical prefix-only registration run has $5M+1$ transactions. The HALT time is the fixed full-use boundary and does not depend on the response. The independent candidate length bound remains $L\le 8$. If a total program-length convention is desired, the common eight-token constructor prefix gives $8+L\le 16$, with its ROM data separately represented and charged as above. Both admission tests are retained. Subtracting the identical fixed wrapper-processing debit proves

$$
c_{\mathrm{total,proc}}(w)\le9045\ \text{and}\ L\le8
\iff
c_{\mathrm{candidate,proc}}(w)\le8\ \text{and}\ L\le8.
$$

The set admitted by the total source is therefore exactly the budget-eight set of Theorem A.6.8b. Setup is charged in the objective and in the total processing bound, outside the candidate budget of eight. The one-use SERVE processing, updates, maintenance and adaptation are exactly the candidate entries of (A.6.8b.1).

**4. Exhaustive census, stable representatives and complete minimum.** There are exactly nine table tokens and two words per token. For these $d=2$, $L=1$ or 2 and $u\le 2$, so $L\le 8$ and $4+L+u\le 8$. For every extension $n\ge 2$, $L=n+10\ge 12$ and $\text{processing}=n+18\ge 20$. It fails both raw budget tests regardless of objective. All other words are ill formed. These three cases partition every word over the fixed alphabet, giving exactly eighteen admitted words and nine response classes, each represented by a table and its no-op suffix.

The candidate objectives of Theorem A.6.8b, to each of which the same $C_{\mathrm{reg}}$ is added, are:

| Response | $L=1$ | $L=2$ | Response feasibility |
|---|---:|---:|---|
| (bottom,bottom) | 13 | 16 | No original-query acceptance |
| (bottom,0) | 18 | 21 | False judgment on $H_1$ |
| (bottom,1) | 16 | 19 | Feasible |
| (0,bottom) | 18 | 21 | False judgment on $H_0$ |
| (0,0) | 23 | 26 | Two false judgments |
| (0,1) | 21 | 24 | False judgment on $H_0$ |
| (1,bottom) | 16 | 19 | Feasible |
| (1,0) | 21 | 24 | False judgment on $H_1$ |
| (1,1) | 19 | 22 | Feasible |

Indeed the exact sum of the six candidate counts minus rewards plus penalties is 10+3L+3k+5e. Every Boolean zero is false because the supplied query sentences are reflexivities. The all-abstaining response fails the task. Conversely the three remaining response classes have the original reflexivity seeds, finite lookup, identity/idempotent retained update and same-cycle diagonal guard. The live diagonal has the outer existential form of A.5.6a, is not an atomic $H_{j}$, and receives bottom under the total extension. These are the stable response roles of A.6.8b; registration has not changed their semantic domain or inference rules.

Within every response class the $N$ suffix adds one acquisition, representation and processing unit and no response. Its full-source excess is exactly 3. Thus the unique least-cost representative in each feasible class is the length-one table. The three stable normal-form costs are $C_{\mathrm{reg}}+16$, $C_{\mathrm{reg}}+16$ and $C_{\mathrm{reg}}+19$. The complete minimum is 101275, attained by exactly [(1,bottom)] and [(bottom,1)]. They remain response-distinct. The other stable class has cost 101278 and gap 3. Every non-minimizing representative, false class, nontriviality failure, over-budget extension and ill-formed code has its explicit witness above. No candidate is omitted and no unexplained comparison set remains.

The answer is the complete co-minimizer alternative of Definition A.6.7: no strict gap is asserted between the two tied classes. The registration is independent of either winner by Section 2; equality and the two-class answer are conclusions of the complete census. At a larger raw budget registered by the same construction, every candidate objective is shifted by the same registration cost, so Theorem A.6.8c gives the census and the complete minimizing set.

**5. Conclusion.** Sections 1–2 fix the budget, language, response domain and quotient, comparison class, cost units and weights as constant roots and prove noninterference under every preferred-class input. Section 3 charges the registration service on the same six-category ledger and preserves both admission tests. Section 4 gives the exhaustive census and the complete minimizing class set. ∎

<a id="corollary-a69-domain-exclusion-for-response-free-candidate-judgments"></a>**Corollary A.6.9 (Domain Exclusion for Response-Free Candidate Judgments).** Let
$$
\mathfrak A_{S,B}=(D_{S,B},J_{S,B},\vdash_{S,B},V_{S,B},q_{S,B})
$$
be a stable axiom-stabilizer. If a represented candidate judgment $\jmath$ has no finite protocol response with processing cost bounded by $B$, then
$$
\jmath\notin D_{S,B}.
\tag{A.6.9.1}
$$
Consequently the local-soundness, retained-composition, verification, and response-quotient clauses of Definition A.6.3 apply to $\jmath$ only after an enlarged stabilizer admits it and all stability clauses are checked again. If PCE minimality is asserted for the enlarged stabilizer, clause 5 must also be checked on its enlarged response-equivalence class.

*Proof.* Stability clause 1 of Definition A.6.3 requires every member of $D_{S,B}$ to have a finite protocol response and processing cost bounded by $B$. The hypothesis on $\jmath$ is the negation of that necessary membership condition, so $\jmath\notin D_{S,B}$. The remaining assertions follow because $V_{S,B}$, $q_{S,B}$, and the retained relation $\vdash_{S,B}$ are components of the stabilizer on $D_{S,B}$, while clauses 2--5 are conditions on that declared tuple. ∎

<a id="remark-a691-finite-admission-certificate-for-a-pending-judgment"></a>**Remark A.6.9.1 (Finite Admission Certificate for a Pending Judgment).** Absence of a numerical interval or a falsification rule does not by itself prove that a candidate judgment is response-free. Admission of $\jmath$ to an enlarged retained domain is independently checkable from a finite record
$$
\mathfrak C_{\mathrm{adm}}(\jmath;S,B)
=
(\mathfrak A'_{S,B},R,A,\pi,r,c,\Pi_{\mathrm{stab}},\Pi_{\mathrm{PCE}}),
\tag{A.6.9.2}
$$
where
$$
\mathfrak A'_{S,B}=(D'_{S,B},J'_{S,B},\vdash'_{S,B},V'_{S,B},q'_{S,B})
$$
is the proposed enlarged tuple, $\jmath\in D'_{S,B}$, $R$ is a finite response set, $A\subseteq R$ is the acceptance set, $\pi$ is an executable protocol returning $r\in R$, $c\le B$ is a verified processing-cost bound, and $V'_{S,B}(\jmath)=\mathbf 1_A(r)$. The finite proof object $\Pi_{\mathrm{stab}}$ verifies finite response for every member of $D'_{S,B}$, local soundness, retained composition, the declared response quotient, and the live-diagonal guard on the enlarged tuple. When PCE minimality is claimed, $\Pi_{\mathrm{PCE}}$ additionally verifies clause 5 on the enlarged response-equivalence class; otherwise that field carries the explicit status $\textsf{not-claimed}$. Until this record or an equivalent checked derivation supplies the listed fields, the admission claim remains certificate-pending; a proof that no finite protocol response of processing cost at most $B$ exists invokes Corollary A.6.9.
