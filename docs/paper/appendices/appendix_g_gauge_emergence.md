# Appendix G: Emergence of Quantum Weights and Gauge Structure

**G.0 Introduction**

This appendix demonstrates how the Predictive Universe (PU) framework's core principles—specifically the Prediction Optimization Problem (POP, Axiom 1) and the Principle of Compression Efficiency (PCE, Definition 15)—lead to the emergence of crucial structures underpinning modern physics. We first derive the Born probability rule governing quantum outcomes from the principle of optimal resource allocation in predictive processes (Section G.1), simultaneously rigorously justifying the necessity of a complex Hilbert space representation (Theorem G.1.8). We then show how the need for efficient predictive coherence across the network necessitates the emergence of a U(1) gauge connection (electromagnetism) as the minimal PCE-optimal solution (Sections G.2–G.7). Finally, we present a comprehensive argument (Section G.8) for how the Standard Model (SM) gauge group $SU(3)\times SU(2)\times U(1)$ with its chiral fermion content, and the D=4 dimensionality of spacetime, can emerge as a unified, co-selected PCE-optimal structure.

The analysis takes place on the emergent Lorentzian manifold $(M,g_{\mu\nu})$ whose existence is justified conditionally in Section 11 and Appendix D. Natural units $\hbar=c=k_B=1$ are used unless stated otherwise.

**G.1 Born Weights from Cost Optimisation**

The probabilistic structure of quantum mechanics, encapsulated by the Born rule, is derived here as a necessary consequence of efficient resource allocation (PCE) applied to the representation and processing of predictive information within the emergent Hilbert space structure of the MPU network.

**G.1.1 Predictive Partitions and Cost Frame Functions**

Let $\mathcal{H}$ be the complex Hilbert space emerging as the necessary structure for MPU state amplitudes (Proposition 4, justified by Theorem G.1.8 below). Physical interactions ('Evolve', Definition 27) allow the system to gain information regarding potential outcomes, represented mathematically by effects—positive semi-definite operators $E$ on $\mathcal{H}$ satisfying $0 \le E \le \mathbf{1}$. A complete set of mutually exclusive outcomes corresponds to a predictive partition, a set of effects $\mathcal{E}=\{E_i\}$ such that $\sum_i E_i = \mathbf{1}$. A special case is a partition by orthogonal projectors $\mathcal{P}=\{P_i\}$, where $P_i^2 = P_i$, $P_i P_j = \delta_{ij} P_i$, and $\sum_i P_i = \mathbf{1}$. Each projector $P_i$ corresponds to a distinct, potential outcome branch into which the system state might resolve.

The Principle of Compression Efficiency (PCE, Definition 15) mandates minimizing the overall PCE Potential $V(x)$ (Definition D.1), which represents the net rate of resource consumption minus predictive benefit. This potential provides a basis for assigning a cost to considering or resolving different predictive possibilities.

**Definition G.1.1 (Cost Frame Function $f$).** Consider a predictive partition $\Pi$ of the MPU state space induced by a finite family of mutually orthogonal projectors $\{P_i\}$ on the Hilbert space $\mathcal{H}$ with $\sum_i P_i=\mathbf{1}$. This partition represents mutually exclusive events "the realized branch lies in $\mathrm{Ran}(P_i)$". We define the associated Cost Frame Function $f(\Pi)$ as the POP-consistent predictive weights assigned to these events, normalized by $f(\mathbf{1})=1$:
$$
f(\Pi)=\sum_i f(P_i)
\quad \text{(G.1.1)}
$$
with $f(0)=0$ and hence $0\le f(P)\le 1$ for every projector $P$. Operationally, $f(P)$ is the unique weight that enters POP-optimal expected-value evaluations for decision problems whose payoffs depend only on whether the event $P$ occurs. PCE eliminates bookkeeping overhead that would make these weights depend on arbitrary refinement or context, yielding the refinement invariance and non-contextuality below.

**G.1.2 Non-contextuality Enforced by POP / PCE**

**Lemma G.1.1b (Non-contextuality under refinement invariance).** Assume the POP/PCE cost functional is refinement-invariant in the following sense: if two measurement contexts $\Pi_1,\Pi_2$ realize the same projector $P$ and induce the same payoff problem on the active sector, then replacing one context by the other cannot change the admissible cost assigned to $P$. Then the cost frame function depends only on $P$:
$$
f(P\mid \Pi_1)=f(P\mid \Pi_2)=:f(P).
$$

*Proof.* Suppose $f(P\mid \Pi_1)\neq f(P\mid \Pi_2)$ for some projector $P$ realized in two contexts with the same induced payoff problem. Then the value assigned to $P$ depends on contextual data that, by refinement invariance, has no operational effect on the POP/PCE objective. Replacing the larger of the two values by the smaller preserves the payoff problem and strictly decreases cost, contradicting optimality of the original assignment. Hence the assignment is context-independent. QED

**Lemma G.1.1ba (Additivity under payoff-refinement consistency).** Assume, in addition to Lemma G.1.1b, that POP/PCE assignments are consistent under orthogonal refinements of the same payoff problem: whenever $P,Q$ are orthogonal projectors, the expected value assigned to the coarse event $P+Q$ equals the sum of the expected values assigned to the refined mutually exclusive events $P$ and $Q$. Then
$$
f(P+Q)=f(P)+f(Q)\qquad (PQ=0).
$$

*Proof.* Let $u$ be any payoff functional that assigns unit reward to the event $P+Q$ and zero elsewhere. The same physical decision problem can be represented either coarsely, by the single event $P+Q$, or finely, by the orthogonal refinement into the mutually exclusive events $P$ and $Q$. By payoff-refinement consistency, both representations must yield the same expected value. The coarse representation gives $f(P+Q)$; the refined representation gives $f(P)+f(Q)$. Hence $f(P+Q)=f(P)+f(Q)$. QED

**G.1.3 Gleason-type Result for the Cost Functional**


The cost frame function $f(P)$ defined on projectors $P$ on the MPU Hilbert space $\mathcal{H}$ (where $\dim(\mathcal{H}) = d_0 \ge 8$, Theorem 23) satisfies the hypotheses of Gleason's theorem:
1.  **Domain:** Defined on the set of orthogonal projectors $P$ on $\mathcal{H}$.
2.  **Non-negativity and normalization:** $f(P)\ge 0$ for all projectors $P$, and $f(\mathbf{1})=1$ (Definition G.1.1).
3.  **Additivity:** $f(\sum_j Q_j)=\sum_j f(Q_j)$ for any finite set of mutually orthogonal projectors $\{Q_j\}$ (Lemma G.1.1ba).
4.  **Non-contextuality:** $f(P)$ depends only on $P$ (Lemma G.1.1b).
5.  **Boundedness:** For any projector $P$, $f(P)+f(\mathbf{1}-P)=f(\mathbf{1})=1$ with $f(\mathbf{1}-P)\ge 0$, hence $0\le f(P)\le 1$.

These match the conditions required by Gleason's theorem for projectors on a Hilbert space of dimension $\ge 3$.

**Theorem G.1.3 (Quadratic Form from Cost Function).**
Let $\mathcal{H}$ be a complex Hilbert space with $\dim(\mathcal{H}) \ge 3$. Any non-contextual finitely additive frame function $f$ on orthogonal projectors with $f(\mathbf{1})=1$ must be of the form:
$$
f(P)=\mathrm{tr}(\rho P)
\quad \text{(G.1.3)}
$$
for a unique positive semi-definite trace-class operator $\rho$ with $\mathrm{tr}(\rho)=1$.

*Proof.* This is Gleason's Theorem [Gleason 1957]. Normalization $f(\mathbf{1})=1$ forces $\mathrm{tr}(\rho)=1$. For the POVM extension, see [Busch 2003]. ∎

The operator $\rho$ is therefore the density operator representing the MPU's predictive state; the trace rule fixes all projective-event weights $f(P)$.

**G.1.4 Emergence of the Born Weights**

The "Evolve" process yields discrete realized outcomes for any projective predictive partition $\{P_i\}$, and POP evaluates predictive decisions by their expected value with respect to the event weights $f(P_i)$ (Definition G.1.1). By Theorem G.1.3 there exists a unique density operator $\rho_{phys}$ such that $f(P)=\mathrm{tr}(\rho_{phys}P)$ for every projector $P$. Hence the realized outcome probabilities are fixed by the trace rule.

**Theorem G.1.4 (Born Weights from Cost Minimization).** For a projective measurement (predictive partition) $\{P_i\}$ on state $\rho_{phys}$, the probability of outcome $i$ is:
$$
p_i = f(P_i) = \mathrm{tr}(\rho_{phys}P_i)
\quad \text{(G.1.4)}
$$
If $\rho_{phys}=|\psi\rangle\langle\psi|$ is pure, and $P_i = |\psi_i\rangle\langle\psi_i|$ is rank-1, then:
$$
p_i = \langle \psi|P_i|\psi\rangle = |\langle \psi_i|\psi\rangle|^2
\quad \text{(G.1.5)}
$$

**Proof.** The first formula is immediate from $p_i=f(P_i)$ and Theorem G.1.3. The second follows by evaluating the trace for rank-one projectors. ∎

This recovers the standard form of the Born rule (Proposition 7, Equation 50).

**G.1.5 Dimensional Subtleties and the $d=2$ Case**

Gleason's original proof required the Hilbert space dimension to be $\dim(\mathcal H)\ge3$. Since the MPU Hilbert space $\mathcal H_0$ has $d_0\ge8$ (Theorem 23), the theorem applies directly to the fundamental MPU outcome space. Effective two-dimensional sectors do not create a separate qubit loophole, because their event weights descend from the global $d_0\ge8$ Born ledger.

**Lemma G.1.6a (Born Descent to Active Two-Dimensional Sectors).**
Let $\mathcal H_0=\mathcal H_a\oplus\mathcal H_b$ with $\dim\mathcal H_a=2$ and $\dim\mathcal H_0=d_0\ge8$. Suppose the global MPU ledger has the Born form
$$
\omega(X)=\operatorname{tr}(\rho X)
$$
for all global effects $0\le X\le I_{\mathcal H_0}$. Let $P_a$ be the projector onto $\mathcal H_a$ and assume $\omega(P_a)>0$. Then the conditional active-sector ledger has the Born form
$$
\omega_a(E)=\operatorname{tr}(\rho_aE)
$$
for every active-sector effect $0\le E\le I_{\mathcal H_a}$, where
$$
\rho_a=\frac{P_a\rho P_a}{\operatorname{tr}(P_a\rho)}.
$$

*Proof.* Embed an active-sector effect $E$ into the global MPU space by
$$
\widetilde E=E\oplus0_b.
$$
The conditional active-sector probability is
$$
\omega_a(E)
=
\frac{\omega(\widetilde E)}{\omega(P_a)}
=
\frac{\operatorname{tr}(\rho(E\oplus0_b))}{\operatorname{tr}(\rho P_a)}.
$$
Since $E\oplus0_b=P_a(E\oplus0_b)P_a$, cyclicity of trace gives
$$
\operatorname{tr}(\rho(E\oplus0_b))
=
\operatorname{tr}(P_a\rho P_aE).
$$
Therefore
$$
\omega_a(E)
=
\operatorname{tr}\!\left(\frac{P_a\rho P_a}{\operatorname{tr}(P_a\rho)}E\right)
=
\operatorname{tr}(\rho_aE).
$$
Thus the active qubit inherits Born weights as a conditional restriction of the global $d_0\ge8$ Born representation. ∎

The framework also has two compatible descriptions of effective qubit measurements.

1.  **Higher-Dimensional Embedding:** From a physical perspective, no effective qubit is a truly isolated system. It is embedded within the MPU's native $d_0\ge8$ space and coupled to the rest of the retained finite-response ledger. Lemma G.1.6a proves that the Born rule for the qubit subsystem follows by conditional restriction from the larger system's description.

2.  **POVM Generalization:** Gleason's theorem can be generalized to Positive Operator-Valued Measures (POVMs), which apply in dimension 2 under natural assumptions [Busch 2003; Caves et al. 2004]. Since PU's 'Evolve' interactions are naturally described by POVMs in the presence of finite resolution and environmental coupling, the generalized theorem also yields Born weights for effective qubit measurements.

**G.1.6 Physical Interpretation**

The derivation shows that the Born rule is not an ad-hoc postulate but emerges as the unique, self-consistent way to assign predictive weights (probabilities) that align with the optimal resource allocation determined by the fundamental PCE optimization principle operating within the Hilbert space structure. The quadratic dependence on amplitudes ($|\langle i|\psi\rangle|^2$) arises naturally from the trace functional applied to projectors, reflecting the underlying structure of the PCE potential landscape. The density operator $\rho_{phys}$ serves simultaneously as the descriptor of the physical state and the generator of the POP/PCE-selected probability weight.

**G.1.7 Summary Theorem**

**Theorem G.1.7 (Born Rule from Cost Optimisation).** In the PU framework, POP assigns to each sharp event projector $P$ a predictive weight $f(P)$ that is normalized, non-negative, additive under orthogonal refinement, and non-contextual (Definition G.1.1; Lemmas G.1.1ba–G.1.1b). By Gleason's theorem (Theorem G.1.3), $f$ must take the trace form $f(P)=\mathrm{Tr}(\rho_{phys}P)$. Therefore the realized outcome probabilities of "Evolve" are given by the Born rule (G.1.4).

### G.1.7a Contextual Holonomy as PCE Magic Cost

**Definition G.1.7a.1 (Protocol-Cover Contextual Cost).** Let $\mathcal M$ be a finite cover of a protocol by compatible measurement contexts. For each context $C\in\mathcal M$, let $\Omega_C$ be its outcome set, and let
$$
p_C\in\Delta(\Omega_C)
$$
be the Born-response distribution assigned by Theorem G.1.7. Let $\Omega$ be the finite set of global assignments to all measurements appearing in the cover. The marginal map is
$$
\partial:\mathbb R^\Omega\to\prod_{C\in\mathcal M}\mathbb R^{\Omega_C}.
\tag{G.1.7a.1}
$$
The empirical model is
$$
p=(p_C)_{C\in\mathcal M}.
$$
It is noncontextual on the protocol cover when there exists a probability vector $q\in\Delta(\Omega)$ such that
$$
\partial q=p.
\tag{G.1.7a.2}
$$
The PPI quasiprobability class is
$$
\mathsf Q_{\mathrm{PPI}}(p)
:=
\{q\in\mathbb R^\Omega:\partial q=p,\ \sum_{\omega\in\Omega}q(\omega)=1\},
\tag{G.1.7a.3}
$$
with elements identified when they induce the same protocol-response natural transformation. The contextual holonomy or PCE magic cost is
$$
\mathcal M_{\mathrm{PCE}}(p)
:=
\inf_{q\in\mathsf Q_{\mathrm{PPI}}(p)}
\log\lVert q\rVert_1,
\qquad
\lVert q\rVert_1=\sum_{\omega\in\Omega}|q(\omega)|.
\tag{G.1.7a.4}
$$
If $\mathsf Q_{\mathrm{PPI}}(p)=\varnothing$, set $\mathcal M_{\mathrm{PCE}}(p)=+\infty$.

**Theorem G.1.7a.2 (Contextual Holonomy-Magic Equivalence).** For every finite no-disturbance protocol cover with nonempty $\mathsf Q_{\mathrm{PPI}}(p)$:

1. $\mathcal M_{\mathrm{PCE}}(p)\ge0$.

2. $\mathcal M_{\mathrm{PCE}}(p)=0$ if and only if $p$ is noncontextual on the protocol cover.

3. If $T$ is a free protocol processing whose action on global assignments is a stochastic linear map and whose contextual marginals obey
$$
\partial_T Tq=T_C\partial q,
\tag{G.1.7a.5}
$$
then
$$
\mathcal M_{\mathrm{PCE}}(T_Cp)
\le
\mathcal M_{\mathrm{PCE}}(p).
\tag{G.1.7a.6}
$$

4. The noncontextuality used in Theorem G.1.7 is a statement about single sharp-event weights being independent of the containing measurement partition. The cost (G.1.7a.4) is a different object: it measures whether the full finite family of incompatible contexts has a positive global section. Hence positive protocol-level contextual holonomy does not contradict Born-rule noncontextuality.

*Proof.* For every $q\in\mathsf Q_{\mathrm{PPI}}(p)$,
$$
1
=
\left|\sum_{\omega\in\Omega}q(\omega)\right|
\le
\sum_{\omega\in\Omega}|q(\omega)|
=
\lVert q\rVert_1.
$$
Thus $\log\lVert q\rVert_1\ge0$, and taking the infimum proves item 1.

If $p$ is noncontextual, there exists $q\in\Delta(\Omega)$ with $\partial q=p$. For this $q$,
$$
\lVert q\rVert_1=\sum_\omega q(\omega)=1,
$$
so $\mathcal M_{\mathrm{PCE}}(p)=0$.

Conversely suppose $\mathcal M_{\mathrm{PCE}}(p)=0$. Then there is a sequence $q_n\in\mathsf Q_{\mathrm{PPI}}(p)$ with $\lVert q_n\rVert_1\to1$. Since $\sum_\omega q_n(\omega)=1$, the sequence is bounded in the finite-dimensional vector space $\mathbb R^\Omega$. Passing to a subsequence gives $q_n\to q$. The constraints defining $\mathsf Q_{\mathrm{PPI}}(p)$ are closed, so $q\in\mathsf Q_{\mathrm{PPI}}(p)$. Lower semicontinuity and the limit of the norms give $\lVert q\rVert_1=1$. A real vector with total sum $1$ and $\ell^1$ norm $1$ has no negative component; otherwise the $\ell^1$ norm would exceed the total sum. Hence $q\in\Delta(\Omega)$ and $\partial q=p$. Thus $p$ is noncontextual.

For item 3, let $q\in\mathsf Q_{\mathrm{PPI}}(p)$. By (G.1.7a.5), $Tq\in\mathsf Q_{\mathrm{PPI}}(T_Cp)$. Since $T$ is stochastic,
$$
\lVert Tq\rVert_1\le\lVert q\rVert_1.
$$
Taking logarithms and then the infimum over $q$ gives (G.1.7a.6).

Item 4 follows from the definitions. Theorem G.1.7 assigns weights to sharp events and requires that $f(P)$ not depend on which orthogonal partition contains $P$. Definition G.1.7a.1 instead asks whether a finite family of mutually incompatible contexts admits one positive global assignment whose marginals reproduce all context distributions. These are different consistency levels. Therefore positive $\mathcal M_{\mathrm{PCE}}$ is a protocol-cover obstruction, not a failure of the Born frame functional. ∎

**Corollary G.1.7a.3 (Stabilizer Baseline and Paid Non-Clifford Resource).** Any protocol family whose PPI quasiprobability class contains a nonnegative global representative has zero PCE magic cost and is compressible to a noncontextual response ledger. Any protocol requiring $\mathcal M_{\mathrm{PCE}}>0$ has irreducible signed/quasiprobability overhead. PCE selects the representative attaining the infimum in (G.1.7a.4) whenever the finite class is compact.

*Proof.* The zero-cost claim is Theorem G.1.7a.2. If $\mathcal M_{\mathrm{PCE}}>0$, no nonnegative global representative exists, so every PPI-equivalent quasiprobability representation has $\lVert q\rVert_1>1$ and therefore carries signed overhead. In finite dimension, a closed PPI class with bounded $\ell^1$ norm is compact, and the continuous function $q\mapsto\log\lVert q\rVert_1$ attains its minimum. Since all representatives have the same operational responses, PCE removes all higher-cost representatives and retains the minimum-cost ledger. ∎

**G.1.8 Hilbert-Space Uniqueness under POP + PCE**

The existence of a well-behaved cost functional satisfying the premises of Theorem G.1.3 not only leads to the Born rule but also provides a justification for the emergence of the Hilbert space structure itself as the unique optimal framework for predictive processing under POP/PCE.

**Theorem G.1.8 (Complex Hilbert-Space Uniqueness under POP/PCE).** Under POP/PCE, the predictive state space carries a Hilbert-space representation. Among the real, complex, and quaternionic Hilbert-space branches, the complex branch is uniquely selected by compositional closure, local tomography, connected phase transport, and PCE removal of surplus phase redundancy.

*Proof.* The reconstruction results established in Sections G.1.1–G.1.7 and the standard GNS/Wigner analysis provide a Hilbert-space representation of predictive states and symmetries. The remaining scalar alternatives are $\mathbb R$, $\mathbb C$, and $\mathbb H$.

For a finite $n$-dimensional Hilbert space, the real parameter counts of normalized density data are
$$
N_{\mathbb R}(n)=\frac{n(n+1)}2-1,\qquad
N_{\mathbb C}(n)=n^2-1,\qquad
N_{\mathbb H}(n)=n(2n-1)-1.
$$
Local tomography of a composite requires
$$
N_{\mathbb D}(mn)+1=(N_{\mathbb D}(m)+1)(N_{\mathbb D}(n)+1).
$$
For $\mathbb C$ this gives $(mn)^2=m^2n^2$, so the identity holds. For $\mathbb R$ it gives
$$
\frac{mn(mn+1)}2
=
\frac{m(m+1)}2\frac{n(n+1)}2.
$$
Multiplying by $4$ and dividing by $mn>0$ gives
$$
2(mn+1)=(m+1)(n+1),
$$
so
$$
(m-1)(n-1)=0.
$$
For $\mathbb H$ it gives
$$
mn(2mn-1)=m(2m-1)n(2n-1).
$$
Dividing by $mn>0$ gives
$$
2mn-1=(2m-1)(2n-1),
$$
so again
$$
(m-1)(n-1)=0.
$$
Thus the real and quaternionic tomography identities hold only for trivial composites with $m=1$ or $n=1$, and fail for every nontrivial composite with $m,n\ge2$. Hence genuine real and quaternionic state-space branches fail local tomography under compositional closure.

The phase-redundancy condition gives the same selection independently. The real branch has only the disconnected scalar phase group $\{\pm1\}$ and cannot supply the connected phase transport used in Sections G.2-G.7. The quaternionic branch has scalar phase group $Sp(1)\cong SU(2)$, a three-dimensional nonabelian redundancy. If the extra quaternionic generators change finite protocol responses, they introduce additional gauge content beyond the minimal MPU branch. If they do not change finite protocol responses, Corollary P.6.1b.8 removes them as response-null surplus. The complex branch supplies exactly $U(1)$, the minimal connected abelian scalar phase group compatible with the active kernel.

Therefore the complex Hilbert-space branch is the unique POP/PCE-stable Hilbert branch. ∎

**Corollary G.1.9 (PCE Instability of Alternative Predictive Algebras).**
Any proposed alternative algebraic structure for prediction (e.g., classical probability on phase space, real or quaternionic Hilbert spaces, Jordan algebras, $L^p$ spaces with $p \neq 2$) would be unstable under PCE optimization compared to the complex Hilbert space structure.
*Proof.* Let $\mathfrak{A}$ denote a proposed predictive algebra (states, sharp outcomes, and composition rules) used by an MPU. For $\mathfrak{A}$ to be PCE-stable, the POP/PCE accounting of outcome branches must admit a nonnegative, normalized, finitely additive, non-contextual frame functional $f(P)$ on sharp outcomes (Definition G.1.1), because any contextual dependence introduces avoidable bookkeeping and is penalized by the PCE potential $V(x)$ (Lemma G.1.1b and Appendix D, Definition D.1). Under these premises and $\dim(\mathcal{H}_0)\ge 3$ (Theorem 23), Theorem G.1.7 enforces the trace-form rule for probabilities,
$$
f(P)=\operatorname{Tr}(\rho_{phys}P),
\qquad
p(P)=\operatorname{Tr}(\rho_{phys}P),
$$
for all projectors $P$ in the operational theory.

Now take any alternative proposal $\mathfrak{A}_{alt}$:

- If $\mathfrak{A}_{alt}$ supports such a globally non-contextual additive frame functional and also supports efficient composition/local tomography as required by POP, then Theorem G.1.8 applies: the operational theory admits a Hilbert representation and is, up to isomorphism of finite protocol responses and composition, the complex Hilbert-space theory. In this case there is no genuinely distinct alternative—PCE-stable realizations of $\mathfrak{A}_{alt}$ reproduce complex Hilbert behavior.

- If $\mathfrak{A}_{alt}$ fails to supply this structure naturally, then an MPU using it must either (i) accept reduced predictive performance $PP$ (lowering $V_{benefit}$), or (ii) impose extra constraints/hidden degrees/contextual correction rules to recover PU consistency. Case (ii) contributes a strictly positive excess cost, which appears as an effective structural penalty in the PCE potential:
$$
V(x)_{alt}=V(x)_{complex_H}+V_{penalty,struc},
$$
with $V_{penalty,struc}>0$ whenever $\mathfrak{A}_{alt}$ is genuinely inequivalent. Under the PCE adaptation dynamics (Appendix D, Equation D.8), higher-potential configurations are dynamically disfavored; and in the low-noise detailed-balance stationary regimes covered by Theorem D.5, stationary mass concentrates near the lower-potential sector, so inequivalent alternatives with $V_{penalty,struc}>0$ are outcompeted by implementations of the complex Hilbert-space structure.

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

**Remark G.1.10a (Logical Foundation).** This result derives from the Logical Necessity foundation of Property R (§A.0.2), which establishes computational richness from the structure of prediction itself, independent of physical implementation. The exclusion of simplex state spaces therefore follows from the logical structure of self-reference without invoking PCE optimization dynamics. The derivation chain is:
$$\text{SPAP} \xrightarrow{\text{Def 12}} \text{Logical Indeterminacy} \xrightarrow{\text{Cor 1, Prop 8}} \text{Complementarity} \xrightarrow{\text{Step 2}} \text{Non-simplex}$$
This establishes that non-classical state space structure is logically necessary for self-referential predictive systems. The PCE-based arguments (Theorems G.1.7, G.1.8) then determine the specific form (complex Hilbert space with Born rule) among non-classical alternatives.

**Remark G.1.10b (Connection to Hilbert Space Formalism).** Within the MPU Hilbert space $\mathcal{H}_0$ established by Theorem G.1.8, complementary observables necessarily satisfy $[\hat{A}, \hat{B}] \neq 0$ (Lemma 14.2a). The present result provides a logically prior exclusion of classical alternatives, while the efficiency-based derivations of Section G.1 determine the specific quantum structure among non-classical candidates.

### G.1.11 Born Rule as Perspective Descent

**Definition G.1.11a (Perspective-Descent Probability Assignment).** Let $\mathcal P(\mathcal H_0)$ be the projection lattice of the MPU Hilbert branch with $\dim\mathcal H_0=d_0\ge8$. Let $\Sigma$ be the perspective space of Appendix M. A perspective-local probability assignment is a family
$$
p_s:\mathcal P(\mathcal H_0)\to[0,1],
\qquad s\in\Sigma,
$$
such that for every perspective $s$:

1. $p_s(I)=1$ and $p_s(0)=0$;
2. if $P_iP_j=0$ for $i\ne j$ and $\sum_iP_i=P$, then
$$
p_s(P)=\sum_i p_s(P_i);
$$
3. if $U_{s\to t}$ is the unitary transition map between overlapping perspective charts, then the descent condition holds:
$$
p_t(U_{s\to t}PU_{s\to t}^{-1})=p_s(P)
\tag{G.1.11}
$$
for every sharp event projector $P$ visible on the overlap.

**Theorem G.1.11b (Born Rule as Perspective Descent).** Every perspective-descent probability assignment on the MPU Hilbert branch has the Born form
$$
p_s(P)=\operatorname{Tr}(\rho_sP),
\tag{G.1.12}
$$
where $\rho_s\ge0$ and $\operatorname{Tr}\rho_s=1$. On overlaps the density operators transform by
$$
\rho_t=U_{s\to t}\rho_sU_{s\to t}^{-1}.
\tag{G.1.13}
$$
Conversely, every family of density operators satisfying (G.1.13) defines a perspective-descent probability assignment by (G.1.12).

*Proof.* Fix a perspective $s$. By Definition G.1.11a, $p_s$ is normalized, nonnegative, and finitely additive on mutually orthogonal projectors. Since $\dim\mathcal H_0=d_0\ge8\ge3$, Gleason's theorem applies and gives a unique positive trace-one operator $\rho_s$ such that
$$
p_s(P)=\operatorname{Tr}(\rho_sP)
$$
for every projector $P$. Now let $s,t$ be overlapping perspectives. Using descent and cyclicity of trace,
$$
\operatorname{Tr}(\rho_tU_{s\to t}PU_{s\to t}^{-1})
=
p_t(U_{s\to t}PU_{s\to t}^{-1})
=
p_s(P)
=
\operatorname{Tr}(\rho_sP).
$$
Equivalently,
$$
\operatorname{Tr}(U_{s\to t}^{-1}\rho_tU_{s\to t}P)
=
\operatorname{Tr}(\rho_sP)
$$
for all projectors $P$. Projectors span the self-adjoint operator space, so
$$
U_{s\to t}^{-1}\rho_tU_{s\to t}=\rho_s,
$$
which is (G.1.13). Conversely, if (G.1.13) holds, then (G.1.12) is normalized, nonnegative, orthogonally additive, and satisfies
$$
p_t(U_{s\to t}PU_{s\to t}^{-1})
=
\operatorname{Tr}(U_{s\to t}\rho_sU_{s\to t}^{-1}U_{s\to t}PU_{s\to t}^{-1})
=
\operatorname{Tr}(\rho_sP)
=
p_s(P).
$$
Thus it descends. ∎

**Corollary G.1.11c (Noncontextuality as Descent, Not an Additional Physical Postulate).** On the MPU Hilbert branch, the noncontextual frame functional used in Theorem G.1.7 is represented by the descent condition (G.1.11) for perspective-local probability assignments. Conversely, when admissible perspective transitions generate the relevant measurement-frame identifications, descent implies the noncontextual frame functional.

*Proof.* A noncontextual frame functional assigns the same value to a projector independently of the measurement context in which it appears. Perspective descent says that the value assigned to the same sharp event is unchanged under admissible chart transition. When the admissible chart transitions cover the measurement-frame changes, both conditions identify local representatives of one global section of the probability presheaf. Theorem G.1.11b then supplies the trace-form representative. ∎

**G.2 Local Phase Freedom and Emergence of Gauge Structure**

Having established the necessity of a complex Hilbert space $\mathcal{H}$ and the Born rule from PCE principles, we now derive the origin of gauge symmetries.

**Proposition G.M1 (SM gauge group from PCE-preserving local frame symmetry).** Let $\mathcal{P} \to M$ be the bundle of local predictive frames over spacetime $M$, where a frame at $x \in M$ is an orthonormal basis of the local Hilbert space $\mathcal{H}_x$ that diagonalizes the local PCE potential (minimizes redundant encoding of predictive state information). Then:

1. The group $G$ of PCE-preserving local frame transformations acts freely and transitively on each fibre, so $\mathcal{P}$ is a principal $G$-bundle.
2. Parallel transport of predictive frames under PCE least-action defines a connection $A$ on $\mathcal{P}$, whose curvature $F = dA + A\wedge A$ encodes the obstruction to globally consistent minimal-cost framing — i.e., emergent gauge field strength.
3. For the PCE-selected inactive-sector module decomposition (Theorem G.8.4b),
$$
\mathcal{H}_x^{(int)} \cong \mathbb{C}^1 \oplus \mathbb{C}^2 \oplus \mathbb{C}^3,
$$
the maximal unitary symmetry preserving the direct-sum structure is
$$
G_{int}=U(1)\times U(2)\times U(3),
$$
with Lie algebra $\mathfrak{u}(1)\oplus\mathfrak{u}(2)\oplus\mathfrak{u}(3)=\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak{u}(1)^3$. The PU capacity bound on independently estimable gauge generators (Theorem G.8.2e; Eq. G.8.0) gives $n_G\le 12$. Since $\dim\mathfrak{su}(3)+\dim\mathfrak{su}(2)=8+3=11$, at most one additional abelian generator can be gauged. Therefore the PCE-minimal faithful gauged algebra is
$$
\mathfrak{g}_{SM}=\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak{u}(1).
$$

*Note:* Competing simple groups (e.g. $SU(5)$) act irreducibly on $\mathbb{C}^5$ and require additional generators or break the module decomposition, increasing predictive overhead under PCE and violating the capacity bound. ∎

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

### G.3.1 Connection–Compression Theorem

The super-extensive comparison above can be sharpened into a structural statement about exact local coherence transport. Under locality, exactness, and the quadratic-cost premises already present in the PCE potential construction (Definition D.1; Definition H.0; Theorem G.1.7), a gauge connection is the unique edge-local exact representation of distributed predictive coherence, and the covariant derivative is its continuum limit. PCE further favors this edge-local representation over nonlocal pairwise coherence tables because the former updates with edge complexity while the latter updates with pair complexity.

Let $\mathcal G=(V,E)$ be a finite connected interaction graph of MPUs with bounded maximum degree $d_{\max}$, supplied by the locality postulate of Section 11.3 together with the finite MPU spacing $\delta$ (Appendix Q). Each vertex $v\in V$ carries a one-dimensional complex predictive fiber $L_v$ equipped with a Hermitian inner product and a coarse-grained predictive amplitude $\psi_v\in L_v$. The restriction to rank-one fibers corresponds to the abelian $U(1)$ sector; the non-abelian extension is stated in Corollary G.6b.1 below.

**Assumption G.3.1** (Local phase freedom). Local predictive observables are invariant under independent rephasings
$$
\psi_v \;\mapsto\; e^{iq\theta_v}\psi_v,\qquad \theta_v\in\mathbb R,
$$
where $q$ is the abelian charge. This is Equation (G.2.1) specialized to site values.

**Assumption G.3.2** (Edge-locality of propagation cost). The propagation component of the PCE potential decomposes as
$$
V_{\mathrm{prop}} \;=\; \sum_{(u,v)\in E} Q_{uv},
$$
where each $Q_{uv}$ depends only on $\psi_u,\psi_v$ and auxiliary data supported on the edge $(u,v)$ (Definition D.1).

**Assumption G.3.3** (Quadraticity near coherence). In a neighborhood of coherent configurations, $Q_{uv}$ is a Hermitian quadratic form on $(\psi_u,\psi_v)$ after transport. This is a consequence of two prior inputs: the Born-rule derivation (Theorem G.1.7), which establishes that predictive weights are Hermitian bilinear functionals, and Fisher-information linear response (Definition H.0), which fixes the leading-order cost as quadratic in small coherence deviations.

**Assumption G.3.4** (Exactness on coherent configurations).
$$
Q_{uv}\;=\;0 \quad\Longleftrightarrow\quad \psi_u\text{ and }\psi_v\text{ are perfectly coherent.}
$$

**Assumption G.3.5** (Comparison class). Implementations are compared by exactness of local coherence evaluation, number of stored auxiliary degrees of freedom, and update work under a sweep of independent local rephasings. In particular, we distinguish edge-local transporter representations from nonlocal pairwise coherence tables.

**Theorem G.3a (Connection–Compression).** Under Assumptions G.3.1–G.3.5:

(a) *Existence forcing.* Exact edge-local coherence evaluation exists if and only if for every edge $(u,v)$ one specifies a unitary transporter $U_{uv}\in U(1)$ satisfying the lattice gauge covariance law
$$
U_{uv} \;\mapsto\; e^{iq\theta_u}\,U_{uv}\,e^{-iq\theta_v}\tag{G.3.4}
$$
under the local rephasings of Assumption G.3.1.

(b) *Uniqueness of the cost form.* Given such transporters, the unique Hermitian positive-semidefinite quadratic edge cost on $L_u\oplus L_v$ whose zero set coincides exactly with the coherent subspace (Assumption G.3.4) is
$$
Q_{uv} \;=\; \lambda_{uv}\,\bigl|\psi_u - U_{uv}\psi_v\bigr|^2,\qquad \lambda_{uv}>0,\tag{G.3.5}
$$
up to overall scale absorbed into the positive edge weight $\lambda_{uv}$.

(c) *Edge-local versus pairwise bookkeeping.* The transporter representation of part (a) updates one edge variable per edge under a global rephasing sweep, hence requires $O(|E|)=O(|V|)$ update work on bounded-degree graphs. By contrast, any scheme that explicitly stores coherence data for all unordered vertex pairs must update every pair touching a rephased vertex and therefore incurs $\Omega(|V|^2)$ work per global sweep. In this asymptotic sense, PCE favors the edge-local transporter representation over nonlocal pairwise coherence tables.

Hence a gauge connection is the unique exact edge-local representation of distributed predictive coherence, and it is asymptotically preferred to nonlocal pairwise coherence tables for exact local bookkeeping. ∎

*Proof.* Part (a). The states $\psi_u\in L_u$ and $\psi_v\in L_v$ inhabit distinct fibers. Any edge-local cost $Q_{uv}$ that depends on both endpoints requires an identification $U_{uv}:L_v\to L_u$; without such a map the symbol "$\psi_u$ compared with $\psi_v$" carries no coordinate-free meaning. The identification must preserve Born weights, since these are invariants of predictive observables (Theorem G.1.7). For any $\psi_v$, the Born weight $|\psi_v|^2$ must equal the Born weight $|U_{uv}\psi_v|^2$; hence $U_{uv}$ is an isometry of one-dimensional Hermitian complex lines, i.e. multiplication by a unit-modulus complex number in chosen local frames, so $U_{uv}\in U(1)$. Under the rephasings $\psi_u\mapsto e^{iq\theta_u}\psi_u$ and $\psi_v\mapsto e^{iq\theta_v}\psi_v$, the transported state $U_{uv}\psi_v$ must land in the rephased fiber $e^{iq\theta_u}L_u$, forcing (G.3.4). Conversely, any such transporters render $|\psi_u - U_{uv}\psi_v|^2$ invariant under local rephasings and define an exact edge-local comparison.

Part (b). Transport $\psi_v$ into $L_u$ via $U_{uv}$ and set $z_1:=\psi_u$, $z_2:=U_{uv}\psi_v\in L_u\cong\mathbb C$. By Assumption G.3.3, $Q_{uv}$ is a Hermitian quadratic form in $(z_1,z_2)$:
$$
Q_{uv}(z_1,z_2) \;=\; \begin{pmatrix}\bar z_1 & \bar z_2\end{pmatrix} M \begin{pmatrix}z_1\\ z_2\end{pmatrix},\qquad M=\begin{pmatrix}a & b\\ \bar b & c\end{pmatrix},\quad a,c\in\mathbb R,\quad M\succeq 0.
$$
By Assumption G.3.4, $Q_{uv}(z,z)=0$ for every $z\in\mathbb C$, which means $M(1,1)^\top=0$, so $a+b=0$ and $\bar b+c=0$. Positive semidefiniteness forces $a=c=\lambda_{uv}\ge 0$, and the biconditional in G.3.4 forbids $Q_{uv}$ from vanishing on any larger subspace, so $\lambda_{uv}>0$. Therefore
$$
M \;=\; \lambda_{uv}\begin{pmatrix} 1 & -1\\ -1 & 1\end{pmatrix},
$$
whose kernel is exactly $\{(z,z):z\in\mathbb C\}$, and $Q_{uv}=\lambda_{uv}|z_1-z_2|^2=\lambda_{uv}|\psi_u-U_{uv}\psi_v|^2$.

Part (c). In the transporter representation, one stores one unitary transporter per edge, so a global sweep of independent local rephasings updates $O(|E|)$ edge data. On bounded-degree graphs, $|E|=O(|V|)$. By contrast, a pairwise coherence table stores one datum for each unordered pair $\{u,v\}$, so a rephasing sweep over all vertices touches on the order of $\binom{|V|}{2}$ entries. This is $\Omega(|V|^2)$. Therefore exact edge-local bookkeeping is asymptotically cheaper than exact pairwise bookkeeping on large bounded-degree graphs. ∎

**Corollary G.3a.1 (Covariant First-Order Comparison).** Let $(x^\mu)$ be a local chart, let $\delta$ be the coarse-graining scale, and suppose the transporter admits the asymptotic expansion
$$
U_{x,\mu} \;=\; \exp\!\bigl(i\,q\,\delta\,A_\mu(x)\bigr) + O(\delta^2)
$$
for a smooth field $A_\mu$. Then for any smooth $\psi$,
$$
\lim_{\delta\downarrow 0}\frac{\psi(x) - U_{x,\mu}\,\psi(x+\delta\hat e_\mu)}{\delta} \;=\; -\bigl(\partial_\mu + iqA_\mu(x)\bigr)\psi(x),
$$
so the unique first-order local comparison operator is the covariant derivative
$$
D_\mu \;:=\; \partial_\mu + iqA_\mu.\tag{G.3.6}
$$

*Proof.* Taylor-expand:
$$
\psi(x+\delta\hat e_\mu) \;=\; \psi(x) + \delta\,\partial_\mu\psi(x) + O(\delta^2),\qquad U_{x,\mu} \;=\; 1 + iq\delta A_\mu(x) + O(\delta^2).
$$
Retaining terms through order $\delta$:
$$
U_{x,\mu}\,\psi(x+\delta\hat e_\mu) \;=\; \psi(x) + \delta\bigl(\partial_\mu + iqA_\mu(x)\bigr)\psi(x) + O(\delta^2),
$$
so $\psi(x)-U_{x,\mu}\psi(x+\delta\hat e_\mu) = -\delta(\partial_\mu+iqA_\mu)\psi(x)+O(\delta^2)$. Dividing by $\delta$ and taking $\delta\downarrow 0$ yields the stated limit. Uniqueness at first order follows from the uniqueness of the edge cost (Theorem G.3a(b)): any other smooth local comparison operator would correspond to a different edge-cost kernel and violate Assumption G.3.4. ∎

Definition G.4.1 therefore emerges as a theorem rather than an ansatz.

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

**G.4.1 Loop Holonomy and the Holonomy–Flatness Theorem**

**Definition G.4.2 (Loop Holonomy).** For a closed loop $\gamma=(v_0,v_1,\dots,v_n=v_0)$ on $\mathcal G$, the holonomy along $\gamma$ is
$$
H_\gamma \;:=\; U_{v_0 v_1}\,U_{v_1 v_2}\cdots U_{v_{n-1}v_n} \;\in\; U(1).\tag{G.4.3}
$$
$H_\gamma$ is gauge-invariant: under local rephasings obeying (G.3.4), consecutive phase factors $e^{-iq\theta_{v_k}}$ and $e^{iq\theta_{v_k}}$ cancel, leaving only the endpoint phases, which cancel for a closed loop.

**Theorem G.4a (Holonomy–Flatness).** Let $\{U_{uv}\}$ be a $U(1)$ transporter field on a connected region, and let $A_\mu$ be a smooth continuum field with $U_{x,\mu}=\exp(iq\delta A_\mu(x))+O(\delta^2)$.

(a) *Discrete flatness equivalence.* On any connected region the following are equivalent: (i) there exists a gauge in which every edge transporter is trivial ($U_{uv}=1$); (ii) $H_\gamma=1$ for every closed loop $\gamma$.

(b) *Plaquette holonomy density.* For the elementary plaquette $\square_{\mu\nu}(c)$ centred at $c$ in the $(\mu,\nu)$-plane,
$$
H_{\square_{\mu\nu}}(c) \;=\; \exp\!\Bigl(iq\,\delta^2\,F_{\mu\nu}(c) + O(\delta^4)\Bigr),\tag{G.4.4}
$$
where
$$
F_{\mu\nu} \;:=\; \partial_\mu A_\nu - \partial_\nu A_\mu.\tag{G.4.5}
$$
Hence $F_{\mu\nu}$ is the infinitesimal density of loop holonomy: curvature is exactly the local obstruction to globally trivial predictive transport. ∎

*Proof of (a).* The forward implication is immediate. For the converse, assume $H_\gamma=1$ for every closed loop. Fix a root vertex $r$ and a unit vector $e_r\in L_r$. For any vertex $v$, choose a path $v_0=r,v_1,\dots,v_n=v$ and define $e_v:=U_{v_n v_{n-1}}\cdots U_{v_1 v_0}\,e_r$. If two paths $\gamma_1,\gamma_2$ from $r$ to $v$ are chosen, their composition $\gamma_1\gamma_2^{-1}$ is a closed loop with holonomy $1$, so the definition is path-independent. In the transported frame $\{e_v\}$, every edge transporter sends $e_v$ to $e_w$, so $U_{uv}=1$ on every edge.

*Proof of (b).* Since $U(1)$ is abelian,
$$
H_{\square_{\mu\nu}}(c) \;=\; \exp\!\left(iq\oint_{\partial\square_{\mu\nu}(c)} A_\alpha\,dx^\alpha\right),
$$
and Stokes' theorem gives
$$
\oint_{\partial\square_{\mu\nu}(c)} A_\alpha\,dx^\alpha \;=\; \int_{\square_{\mu\nu}(c)} F_{\mu\nu}\,dS^{\mu\nu} \;=\; \delta^2\,F_{\mu\nu}(c) + O(\delta^4),
$$
where the $O(\delta^4)$ correction arises from the second-order Taylor expansion of $A_\alpha$ combined with the $\delta^2$ plaquette area. Substituting yields (G.4.4). ∎

**Corollary G.4a.1 (Flatness Equals Pure Gauge on Simply Connected Regions).** Let $\Omega$ be simply connected and $A$ a smooth $U(1)$ connection. Then
$$
F \;=\; dA \;=\; 0 \quad\Longleftrightarrow\quad A \;=\; d\chi
$$
for some smooth scalar $\chi$.

*Proof.* The forward implication is the Poincaré lemma on the closed 1-form $A$. The reverse follows from $d^2\chi=0$. ∎

The introduction of the connection $A_\mu$ and covariant derivative $D_\mu$ is the minimal structural modification required to allow local, phase-invariant comparison of field values. This represents the most resource-efficient solution, strongly favored by PCE, to overcome the predictive coherence problem arising from local phase freedom. If the $U(1)$ symmetry group is compact (which is physically expected for charge conservation), consistency of the gauge theory (e.g., topological considerations for magnetic monopoles, if they exist) generally requires that the charge $q$ be quantized in units of some fundamental charge $e_0$.

**Remark G.4a.2 (Existence, Dynamics, and Holonomy Detection Are Distinct).** The local phase-response argument forces a connection and covariant derivative before any field-action normalization is chosen. The Maxwell equations follow only after the minimal local quadratic gauge-action branch is added. Thus
$$
D_\mu=\partial_\mu+iqA_\mu
$$
is forced by local phase-comparison consistency, while
$$
\nabla_\mu F^{\mu\nu}=\kappa_FJ^\nu
$$
requires the additional local, gauge-invariant, positive-energy quadratic action with linear matter-current coupling.

For any closed loop $\gamma$, the finite response observable is the Wilson holonomy
$$
W(\gamma)=\exp\left(iq\oint_\gamma A\right).
$$
On a flat-holonomy interferometer branch, two configurations with the same local field strength on the detection arms but different $W(\gamma)$ are operationally distinguishable by their interference phase. Arbitrary noninteger Aharonov-type holonomy is allowed on punctured-region branches; flux quantization is asserted only on the additional nontrivial compact $U(1)$ bundle or Chern-class branch. Nontrivial holonomy may also carry phase-defect overhead on the strict Q.0.7g branch, but that overhead statement is separate from the existence of detectable holonomy.

**G.4.2 Joint Spin-Internal Covariant Derivative**

**Theorem G.4b (Joint Covariant Derivative).** Let $S\to M_{\mathrm{reg}}$ be the spinor bundle associated to $P_{\mathrm{spin}}$, and let $E\to M_{\mathrm{reg}}$ be the internal Hermitian bundle associated to $P_{\mathrm{int}}$ (Theorem 48b). Let $\nabla^{\mathrm{spin}}$ and $\nabla^{\mathrm{int}}$ be connections on $S$ and $E$, with local connection one-forms $\Omega_\mu$ and $A_\mu^{\mathrm{int}}$. Then the tensor-product bundle
$$
\mathcal W \;:=\; S\otimes E
$$
carries a unique product connection
$$
D \;:=\; \nabla^{\mathrm{spin}}\otimes 1 + 1\otimes\nabla^{\mathrm{int}}.
$$
In any local trivialization,
$$
D_\mu\Psi \;=\; \partial_\mu\Psi + \Omega_\mu\Psi + A_\mu^{\mathrm{int}}\Psi.
$$
If the internal bundle is reduced to a $U(1)$ charge-$q$ line subbundle, then $A_\mu^{\mathrm{int}}=iqA_\mu$, and the formula reduces exactly to $D_\mu=\partial_\mu+\Omega_\mu+iqA_\mu$. Definition G.4.1 is therefore the local expression of the unique product connection on the globally glued bundle.

*Proof.* Connections on associated bundles correspond to equivariant horizontal distributions on the principal bundles. On the product principal bundle $P_{\mathrm{spin}}\times_M P_{\mathrm{int}}$, the direct sum of the two horizontal distributions is again equivariant and complementary to the vertical distribution; this gives the unique product connection. The local formula is the standard tensor-product connection formula. The $U(1)$ reduction is immediate by restricting to the rank-one subbundle. ∎

**Corollary G.4b.1 (Holonomy and Curvature Factorization).** On the joint spin-internal predictive bundle $\mathcal W=S\otimes E$, define
$$
D^{\mathrm{pred}}
:=
\nabla^{\mathrm{spin}}\otimes 1+1\otimes\nabla^{\mathrm{int}} .
$$
For every loop $\gamma\subset M_{\mathrm{reg}}$,
$$
\mathrm{Hol}_{D^{\mathrm{pred}}}(\gamma)
=
\mathrm{Hol}_{\mathrm{spin}}(\gamma)\otimes\mathrm{Hol}_{\mathrm{int}}(\gamma).
$$
Infinitesimally, the curvature of predictive transport is
$$
\mathcal F^{\mathrm{pred}}
=
(D^{\mathrm{pred}})^2
=
R(\Omega)\otimes 1 + 1\otimes F(A^{\mathrm{int}}).
$$
This is the bundle-level form of the Predictive Curvature Principle: gauge field strength and spin/Riemann curvature are the internal and geometric projections of one predictive-frame curvature. The gravitational and gauge sectors commute as a direct-product connection, and the mixed covariant derivative of Definition G.4.1 is globally consistent.

*Proof.* Let $U_S(t)$ and $U_E(t)$ be the parallel transports generated by $\nabla^{\mathrm{spin}}$ and $\nabla^{\mathrm{int}}$ along a curve $\gamma(t)$. The tensor product $U_S(t)\otimes U_E(t)$ satisfies the parallel-transport equation for $D^{\mathrm{pred}}$ and the same initial condition, hence uniqueness of solutions gives the holonomy factorization for closed $\gamma$. For curvature,
$$
(D^{\mathrm{pred}})^2
=
(\nabla^{\mathrm{spin}}\otimes 1)^2
+
(\nabla^{\mathrm{spin}}\otimes 1)(1\otimes\nabla^{\mathrm{int}})
+
(1\otimes\nabla^{\mathrm{int}})(\nabla^{\mathrm{spin}}\otimes 1)
+
(1\otimes\nabla^{\mathrm{int}})^2 .
$$
With the graded sign from exterior-form composition, the two mixed terms cancel because the two connections act on different tensor factors, leaving
$$
(D^{\mathrm{pred}})^2
=
(\nabla^{\mathrm{spin}})^2\otimes 1+1\otimes(\nabla^{\mathrm{int}})^2
=
R(\Omega)\otimes 1+1\otimes F(A^{\mathrm{int}}).
$$
Thus the curvature factorization and commutation of the two sectors follow directly from the product-connection construction. ∎

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
The unique quadratic Lorentz invariant constructed from $F_{\mu\nu}$ is $F_{\mu\nu}F^{\mu\nu}$. The contribution to the PCE potential density associated with field strength is positive in the Euclidean cost functional and quadratic at leading order in the local derivative expansion. On the regular effective-action branch, Theorem X.8c identifies the coefficient of this active field-strength coherence constraint with its PCE shadow price. Writing that stiffness price as $\lambda_F>0$ and using the interaction-strength convention $\kappa_F:=\lambda_F^{-1}$ gives
$$
\mathcal{V}_{field}
=
\frac{\lambda_F}{4}F_{\mu\nu}F^{\mu\nu}
=
\frac{1}{4\kappa_F}F_{\mu\nu}F^{\mu\nu}.
$$
The corresponding Lorentzian action term is
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

**G.5.1 Plaquette–Maxwell Limit Theorem**

**Theorem G.5a (Plaquette–Maxwell Limit).** Let $\Omega\subset\mathbb R^D$ be a local chart and $\{c\in\delta\mathbb Z^D\}$ a regular lattice refinement. Define the gauge-invariant loop-frustration cost
$$
C_{\square_{\mu\nu}}(c) \;:=\; 1 - \Re\,H_{\square_{\mu\nu}}(c).\tag{G.5.4}
$$
Then:

(a) *Local expansion.*
$$
C_{\square_{\mu\nu}}(c) \;=\; \tfrac{1}{2}\,q^2\,\delta^4\,F_{\mu\nu}(c)^2 + O(\delta^6).
$$

(b) *Euclidean continuum limit.*
$$
\frac{\delta^{D-4}}{q^2}\,\sum_c\,\sum_{\mu<\nu} C_{\square_{\mu\nu}}(c) \;\xrightarrow[\delta\downarrow 0]{}\; \frac14\int_\Omega d^D x\,F_{\mu\nu}F^{\mu\nu}.
$$

(c) *Lorentzian covariant action.* The covariant Lorentzian action corresponding to the Euclidean limit in (b), obtained via the signature continuation of Appendix X, is
$$
S_{\mathrm{field}}[A] \;=\; -\tfrac14\int d^Dx\,\sqrt{-g}\,F_{\mu\nu}F^{\mu\nu},
$$
recovering (G.5.3). ∎

*Proof of (a).* By Theorem G.4a(b), $H_{\square_{\mu\nu}}(c)=\exp(iq\delta^2 F_{\mu\nu}(c)+O(\delta^4))$. Write $\phi_{\mu\nu}(c):=q\delta^2 F_{\mu\nu}(c)$. Then $C_{\square_{\mu\nu}}(c)=1-\cos\phi_{\mu\nu}(c)=\tfrac12\phi_{\mu\nu}(c)^2+O(\phi_{\mu\nu}^4)=\tfrac12 q^2\delta^4 F_{\mu\nu}(c)^2+O(\delta^6)$.

*Proof of (b).* Multiply (a) by $\delta^{D-4}/q^2$ and sum. Using $F_{\mu\mu}=0$ and $F_{\nu\mu}=-F_{\mu\nu}$, so $F_{\mu\nu}^2=F_{\nu\mu}^2$, one has $\sum_{\mu,\nu}F_{\mu\nu}^2=2\sum_{\mu<\nu}F_{\mu\nu}^2$. Therefore
$$
\frac{\delta^{D-4}}{q^2}\sum_c\sum_{\mu<\nu}\frac{q^2\delta^4}{2}F_{\mu\nu}(c)^2 \;=\; \tfrac12\sum_{\mu<\nu}\sum_c\delta^D\,F_{\mu\nu}(c)^2 \;=\; \tfrac14\sum_{\mu,\nu}\sum_c\delta^D\,F_{\mu\nu}(c)^2.
$$
The inner sum is a Riemann sum for $\int_\Omega F_{\mu\nu}F^{\mu\nu}\,d^Dx$, completing (b).

*Proof of (c).* The Euclidean-to-Lorentzian continuation is Appendix X (Equation X.7 with Proposition X.1, Corollary X.2, and Theorem X.3). ∎

**Corollary G.5a.1 (Universality of the Quadratic Gauge Limit).** Let $f:U(1)\to\mathbb R$ be $C^2$ near the identity $1\in U(1)$, with $f(1)=0$ and $1$ a strict local minimum. Then for any such loop penalty,
$$
f\bigl(H_{\square_{\mu\nu}}(c)\bigr) \;=\; \kappa_f\,\delta^4\,F_{\mu\nu}(c)^2 + o(\delta^4),
$$
with $\kappa_f=\tfrac12\,q^2\,f''(1)>0$. Every smooth gauge-invariant local loop penalty satisfying the stated conditions therefore flows to the same Maxwell action up to an overall positive scale.

*Proof.* Write $f(e^{i\phi})=\kappa_f\phi^2/q^2+o(\phi^2)$ by Taylor expansion around $\phi=0$, with $\kappa_f=\tfrac{q^2}{2}\,f''(1)>0$ by the strict-minimum hypothesis. Substituting the plaquette expansion $\phi=q\delta^2 F_{\mu\nu}(c)+O(\delta^4)$ yields the claim. ∎

The Wilson action ($1-\cos\phi$), the Villain action (Gaussian in $\phi$), and the Manton action (squared geodesic distance on $U(1)$) all satisfy the hypotheses of Corollary G.5a.1 and therefore share the same Maxwell continuum limit. The framework does not depend on the microscopic link penalty, only on its leading quadratic behavior near the coherent configuration.

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

**G.6.1 Minimal-Coupling Continuum Limit and Variational Closure**

**Theorem G.6a (Minimal-Coupling Continuum Limit).** Let $\phi$ be a complex scalar field on a local chart $\Omega\subset\mathbb R^D$, let $\phi(x+\delta\hat e_\mu)$ denote its value at the neighbor vertex, and define the discrete matter coherence action
$$
S^{\mathrm{mat}}_\delta[\phi,A] \;:=\; \delta^{D-2}\sum_x\sum_\mu\bigl|\phi(x) - U_{x,\mu}\,\phi(x+\delta\hat e_\mu)\bigr|^2 \;+\; \delta^D\sum_x m^2|\phi(x)|^2.\tag{G.6.4}
$$
Then:

(a) *Flat-space continuum limit.*
$$
S^{\mathrm{mat}}_\delta[\phi,A] \;\xrightarrow[\delta\downarrow 0]{}\; \int_\Omega d^D x\Bigl[\sum_\mu |(\partial_\mu + iqA_\mu)\phi|^2 + m^2|\phi|^2\Bigr].
$$

(b) *Covariant form.* The diffeomorphism-covariant extension of (a) to the emergent curved manifold is
$$
S^{\mathrm{mat}}[\phi,A] \;=\; \int d^D x\,\sqrt{|g|}\,\Bigl[g^{\mu\nu}(D_\mu\phi)^*(D_\nu\phi) - m^2|\phi|^2\Bigr],\tag{G.6.1'}
$$
with $D_\mu\phi=(\partial_\mu+iqA_\mu)\phi$. Higher-derivative and higher-curvature couplings belong to subleading terms in the derivative expansion and are not part of the leading continuum limit displayed here. ∎

*Proof.* By Corollary G.3a.1,
$$
\phi(x) - U_{x,\mu}\,\phi(x+\delta\hat e_\mu) \;=\; -\delta\,(\partial_\mu+iqA_\mu)\phi(x) + O(\delta^2).
$$
Taking the modulus squared gives $\delta^2|D_\mu\phi|^2+O(\delta^3)$, and summing $\delta^{D-2}\sum_x\sum_\mu$ produces a Riemann sum for $\int d^D x\sum_\mu|D_\mu\phi|^2$. The mass term is already a Riemann sum for $\int m^2|\phi|^2\,d^Dx$. Taking $\delta\downarrow 0$ gives (a). For (b), the flat-space contraction $\delta^{\mu\nu}$ lifts to $g^{\mu\nu}$ on the emergent Lorentzian manifold, with invariant volume $\sqrt{|g|}\,d^Dx$ (Appendix X, Equation X.7 together with Proposition X.1 and Corollary X.2). The Lorentzian signature is obtained by the same continuation as in Theorem G.5a(c). ∎

**Theorem G.6b (Variational Closure and Noether Current).** Consider the total continuum action
$$
S[\phi,A] \;=\; \int d^D x\,\sqrt{|g|}\,\Bigl[g^{\mu\nu}(D_\mu\phi)^*(D_\nu\phi) - m^2|\phi|^2 - \tfrac14 F_{\mu\nu}F^{\mu\nu}\Bigr].\tag{G.6.5}
$$
Then:

(a) *Matter equation of motion.* $\delta S/\delta\phi^*=0$ gives
$$
D_\mu D^\mu\phi + m^2\phi \;=\; 0.\tag{G.6.6}
$$

(b) *Sourced gauge equation.* $\delta S/\delta A_\mu=0$ gives
$$
\nabla_\nu F^{\nu\mu} \;=\; J^\mu,\qquad J^\mu \;=\; iq\bigl(\phi^*D^\mu\phi - (D^\mu\phi)^*\phi\bigr).\tag{G.6.7}
$$

(c) *On-shell current conservation.* $\nabla_\mu J^\mu=0$ on the matter-equation solution manifold.

*Proof.* (a) Standard variation with integration by parts, using that the gauge connection does not affect the Leibniz rule on scalar densities.

(b) The variation $\delta A_\mu$ affects the matter action through $D_\mu\phi=\partial_\mu\phi+iqA_\mu\phi$, giving $\delta S_{\mathrm{mat}}=\int\sqrt{|g|}\,J^\mu\,\delta A_\mu\,d^Dx$ with the current as stated. The gauge-field variation gives $\delta S_{\mathrm{field}}=-\int\sqrt{|g|}\,(\nabla_\nu F^{\nu\mu})\,\delta A_\mu\,d^Dx$ after integration by parts and the antisymmetry of $F$. Setting $\delta S=0$ for arbitrary $\delta A_\mu$ yields (b).

(c) Under the infinitesimal gauge transformation $\delta\phi=iq\alpha\phi$, $\delta A_\mu=-\partial_\mu\alpha$ with smooth parameter $\alpha$, gauge invariance of $S$ gives $\delta S=0$. On the matter-equation solution manifold the matter part vanishes identically, so only the gauge-field variation survives: $0=-\int\sqrt{|g|}\,J^\mu\partial_\mu\alpha\,d^Dx=\int\sqrt{|g|}\,(\nabla_\mu J^\mu)\alpha\,d^Dx$, using $\partial_\mu(\sqrt{|g|}V^\mu)=\sqrt{|g|}\nabla_\mu V^\mu$ for any vector $V^\mu$. Since $\alpha$ is arbitrary, $\nabla_\mu J^\mu=0$. ∎

**Corollary G.6b.1 (Non-Abelian Lift).** Let each vertex $v$ carry a rank-$m$ Hermitian predictive fiber $L_v\cong\mathbb C^m$ with a compact Lie subgroup $G\subseteq U(m)$ acting unitarily, local frame freedom $\psi_v\mapsto g_v\psi_v$ with $g_v\in G$, and edge transporters $U_{uv}\in G$ transforming as $U_{uv}\mapsto g_u U_{uv} g_v^{-1}$. Then:

(a) *Quadratic edge-cost form.* Under the rank-$m$ analogs of Assumptions G.3.1–G.3.5, any Hermitian positive-semidefinite quadratic edge cost on $L_u\oplus L_v$ whose zero set is exactly the coherent subspace $\{(z,z):z\in\mathbb C^m\}$ has the form
$$
Q_{uv} \;=\; \bigl\langle \psi_u-U_{uv}\psi_v,\;A_{uv}\,(\psi_u-U_{uv}\psi_v)\bigr\rangle,
$$
for some positive-definite Hermitian endomorphism $A_{uv}$ on $L_u$. If the relevant $G$-representation is irreducible, Schur's lemma reduces this to the scalar specialization
$$
Q_{uv} \;=\; \lambda_{uv}\,\lVert\psi_u-U_{uv}\psi_v\rVert^2,\qquad \lambda_{uv}>0.
$$

(b) *Covariant derivative.* In the continuum limit with $U_{x,\mu}=\exp(ig\delta A_\mu^a T^a)+O(\delta^2)$ for generators $T^a$ of the Lie algebra $\mathfrak g$,
$$
D_\mu \;=\; \partial_\mu + ig A_\mu^a T^a,
$$
and $D_\mu\psi$ transforms covariantly: $D_\mu\psi\mapsto g\,D_\mu\psi$ under $\psi\mapsto g\psi$.

(c) *Non-abelian field strength.* The plaquette holonomy satisfies
$$
H_{\square_{\mu\nu}}(c)=I + ig\delta^2 F_{\mu\nu}(c)+O(\delta^3),
$$
equivalently $H_{\square_{\mu\nu}}(c)=\exp(ig\delta^2 F_{\mu\nu}(c)+O(\delta^3))$, with
$$
F_{\mu\nu} \;=\; \partial_\mu A_\nu - \partial_\nu A_\mu + ig[A_\mu,A_\nu].
$$

(d) *Yang–Mills action.* The class-function loop-frustration cost satisfies
$$
1-\tfrac{1}{m}\Re\,\mathrm{Tr}\,H_{\square_{\mu\nu}}(c)
\;=\;
\tfrac{g^2\delta^4}{2m}\,\mathrm{Tr}(F_{\mu\nu}(c)^2)+O(\delta^5),
$$
and therefore yields the continuum Yang–Mills action
$$
S_{\mathrm{YM}}[A] \;=\; -\tfrac12\int d^D x\,\sqrt{|g|}\,\mathrm{Tr}(F_{\mu\nu}F^{\mu\nu}).
$$

(e) *Minimally coupled matter and conserved current.* The edge-cost continuum limit yields $|D_\mu\Psi|^2=(D_\mu\Psi)^\dagger(D^\mu\Psi)$, and the non-abelian Noether current $J^{a\mu}=ig\bigl(\Psi^\dagger T^a D^\mu\Psi - (D^\mu\Psi)^\dagger T^a\Psi\bigr)$ is covariantly conserved on shell: $D_\mu J^{a\mu}=0$. ∎

*Proof.* (a) Transport $\psi_v\mapsto U_{uv}\psi_v$, write $z_1=\psi_u$, $z_2=U_{uv}\psi_v\in\mathbb C^m$, and expand $Q_{uv}$ as a $2m\times 2m$ Hermitian quadratic form. Exactness on the coherent subspace $z_1=z_2$ forces the block structure
$$
M=\begin{pmatrix}A&-A\\ -A&A\end{pmatrix}
$$
with $A$ Hermitian $m\times m$, whose kernel is exactly $\{(z,z)\}$ iff $A\succ 0$. This yields the displayed form. If the $G$-representation is irreducible, Schur's lemma implies that every $G$-equivariant positive Hermitian endomorphism is a positive scalar multiple of the identity.

(b) Component-wise application of Corollary G.3a.1.

(c) Expanding each transporter $U_{c,\mu}=I+ig\delta A_\mu+\tfrac12(ig\delta)^2 A_\mu^2+O(\delta^3)$ around the four edges of the plaquette and collecting terms through $\delta^2$ yields
$$
H_{\square_{\mu\nu}}(c) \;=\; I + ig\delta^2\bigl(\partial_\mu A_\nu - \partial_\nu A_\mu + ig[A_\mu,A_\nu]\bigr)(c) + O(\delta^3).
$$

(d) For the class function $f(U)=1-\tfrac{1}{m}\Re\,\mathrm{Tr}\,U$ and $U=I+ig\delta^2F+O(\delta^3)$, the linear term has vanishing real trace and the first nontrivial contribution is quadratic, giving the displayed $O(\delta^4)$ leading term with an $O(\delta^5)$ remainder. Summing plaquettes as in Theorem G.5a(b) yields the Yang–Mills action.

(e) Component-wise Taylor expansion with the covariant derivative $D_\mu=\partial_\mu+igA_\mu^a T^a$ replacing $\partial_\mu+iqA_\mu$, together with the variational argument of Theorem G.6b(c) applied to the non-abelian gauge transformation $\delta\Psi=igT^a\alpha^a\Psi$, $\delta A_\mu^a=-D_\mu\alpha^a$ (adjoint covariant derivative). ∎

**G.7 Summary of $U(1)$ Emergence**

The emergence of $U(1)$ gauge theory can be summarized in the following steps, driven by POP/PCE principles:

1.  **G.1: Quantum Weights**
    *   **Content:** Derive $p_i = \mathrm{tr}(\rho_{phys} P_i)$
    *   **POP / PCE Justification Principle Applied:** Optimal resource allocation implies consistent, PCE-derived cost structure for outcomes (non-contextual, additive).
    *   **Result:** Born rule and complex Hilbert space (Thm G.1.7, G.1.8).

2.  **G.2: Local Phase Redundancy**
    *   **Content:** $|\Psi(x)\rangle \sim e^{iq\theta(x)}|\Psi(x)\rangle$
    *   **POP / PCE Justification Principle Applied:** Inherent symmetry of complex Hilbert space description, with the continuous phase redundancy on the Landauer-saturating finite-resolution branch supplied as the closure of the dense SPAP/Landauer subgroup by Theorem Q.0.7d2.
    *   **Result:** Local $U(1)$ gauge freedom and its Noether current as the effective Landauer-closed phase redundancy (Corollary Q.0.7d3).

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

The $U(1)$ gauge theory of electromagnetism emerges as the unique, most resource-efficient (PCE-optimal) structure necessitated by the requirement to maintain predictive coherence across the network in the face of the inherent local phase freedom of the emergent complex Hilbert space description. Appendix Q identifies the effective continuous phase group used here as the operational closure of the discrete SPAP/Landauer phase subgroup: invariance under integer Landauer phase updates plus finite-resolution continuity yields the full $U(1)$ symmetry, and differentiability of the effective action yields the Noether current.

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

    Using plausible estimates from the PU framework ($C_{\max} \approx 1.5-2.0$ nats, derived from $f_{RID}<1$ which follows from $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$; $\alpha_{load} \approx 0.1-0.2$ nats, related to achieving sufficient signal‑to‑noise for coherence), we get a target range for the maximum viable total gauge group dimension:

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

**Remark G.8.2g: Connection to Golay Structure.** The Lagrangian dimension $ab=12$ equals the Golay code dimension $k=12$ on the predictive-recovery MacWilliams branch (Definition Z.13b.0; Theorem Z.13b.0a; Theorem Z.13b). The equality $M=24$ supplies the block length; the self-dual-rate gate supplies the further conclusion $k=M/2=12$. This correspondence reflects structural unity: both the symplectic geometry (joint estimability) and the error-correction structure (optimal redundancy after the rate gate) select the same 12-dimensional subspace of the 24-dimensional interface. Gauge generators failing joint estimability incur additional PCE costs from incompatibility-induced measurement trade-offs, manifesting as increased operational cost $V_{\mathrm{op}}$ due to the necessity of sequential rather than simultaneous optimal estimation.

#### G.8.2.3 Anomaly Cancellation as a PCE Imperative (D‑Sensitive)

Quantum gauge theories with chiral fermions can suffer from quantum anomalies, which are acutely sensitive to spacetime dimension $D$. In PU, gauge transformations are predictive-frame redundancies. Theorem X.8d therefore applies: the predictive functional descends to the physical gauge quotient if and only if the total gauge anomaly class vanishes. An anomalous gauge structure is not merely dynamically disfavored; it fails predictive descent and is assigned an infinite PCE admissibility penalty:

$$
V_{\text{anom}}(G,\{\psi\},D)=
\begin{cases}
0, & \text{if }[\mathcal A_{\mathrm{gauge}}^{\mathrm{tot}}]=0\text{ in dimension }D\\[2pt]
+\infty, & \text{if }[\mathcal A_{\mathrm{gauge}}^{\mathrm{tot}}]\ne0\text{ in dimension }D
\end{cases}
$$

PCE co‑selects $G$, $\{\psi\}$, and $D$ to ensure $V_{\text{anom}}=0$. Global-current anomalies not declared as gauge/frame redundancies are not penalized by this term; they are admissible only as physical update channels, as formalized in Theorem X.8d and used in Appendix Y.

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

The search space used in the theorem-level selection is the determinant-compatible finite-response block-frame/interface family acting faithfully on a direct-sum inactive-sector certificate
$$
\mathcal B\cong\bigoplus_i\mathbb C^{n_i},
\qquad
\sum_i n_i=6.
$$
It is not the set of all compact connected Lie subgroups of $U(6)$.

A triplet $(G,{\psi},D)$ is a stable, PCE‑optimal solution if it satisfies:

1.  **Anomaly Freedom:** $V_{\text{anom}}(G,{\psi},D)=0$.
2.  **Capacity Constraint:** $n_G \leq n_{\max}$. The channel capacity estimate (Equation G.8.0) yields the range $n_{\max} \approx 7.5$–$20$. The geometric bound from the Lagrangian dimension of the QFI symplectic structure (Theorem G.8.2e) yields $n_G \leq ab = 12$. This bound equals the complex dimension of the attractor orbit: $\dim_{\mathbb{C}}(\text{Gr}(2,8)) = ab = 12$, providing a geometric interpretation of the gauge dimension constraint. Since $12$ lies within the channel capacity range, the geometric bound provides the sharp constraint $n_G \leq 12$. This value equals both the Golay code dimension $k = 12$ (Theorem Z.13) and the complex dimension of the attractor orbit $\dim_{\mathbb{C}}(\text{Gr}(2,8)) = ab = 12$ (Theorem Z.6.3a). The triple coincidence—channel capacity bound, code dimension, and orbit dimension—provides strong evidence for the structural uniqueness of the gauge sector. The convergence of channel capacity, symplectic geometry, and error-correction theory at the value 12 constitutes a non-trivial consistency check on the framework.
    
    The bound $n_G \leq 12$ traces to two foundational parameters through the derivation chain:
    $$\text{SPAP} \xrightarrow{\text{Thm 31}} \varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2 \xrightarrow[\text{at attractor}]{\text{Def. 15a, Thm Z.1}} a = 2 \xrightarrow[\text{minimal branch}]{\text{Thm Z.2}} b = d_0 - a = 6 \xrightarrow{} ab = 12$$
    where $d_0 = 8$ is the minimal Hilbert space dimension for on-cycle injectivity of self-referential logic on the Appendix Z branch (Theorem Z.2; Theorem 23 gives the lower bound) and $\varepsilon_0=\ln2$ is the attractor-saturating SPAP entropy cost (Definition 15a; Theorem 31 gives the lower bound).

3.  **Structural Stability:** $D$ must allow for the formation and persistence of stable, complex MPU aggregates capable of advanced prediction (Section G.8.2.4). This criterion strongly favors $D=4$.
4.  **Information Efficiency:** $D$ should optimize information‑theoretic and network efficiencies related to holography, propagation, and coherence (Section G.8.2.5). This criterion is hypothesized to further favor $D=4$.
5.  **Potential Minimization:** Among all triplets $(G,{\psi},D)$ satisfying (1)–(4), the optimal solution minimizes $V_{net}$ given by Equation G.8.5.

### G.8.4a Gauge Algebra via Exhaustive Partition Analysis

This section derives the Standard Model gauge algebra via exhaustive classification of module decompositions, supplying the module-decomposition input used in Proposition G.M1. The inactive subspace $\mathcal{B} = \mathbb{C}^b$ with $b = d_0 - a = 8 - 2 = 6$ (where $a = 2$ follows from Theorem Z.1) carries the gauge representation. The derivation proceeds through three stages: exclusion of simple groups, enumeration of viable partitions, and unique selection by physical constraints.

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

**Lemma G.8.4a.1 (Finite Syndrome Normal Form for the Inactive Sector).** Let $\mathcal B\cong\mathbb C^6$ be the inactive complement of the minimal MPU carrier. Suppose a retained internal frame symmetry preserves a stable finite-response syndrome algebra on $\mathcal B$. Then the connected syndrome-preserving frame group is block diagonal:
$$
\mathcal B=\bigoplus_{i=1}^m\mathbb C^{n_i},
\qquad
\sum_i n_i=6,
$$
and its connected unitary frame group is a subgroup of
$$
\prod_i U(n_i).
$$

*Proof.* A stable finite syndrome is represented on the Hilbert carrier by sharp repeatable effects. Sharp repeatable effects are projectors. Let $\mathcal Z_B$ be the finite-dimensional commutative algebra generated by the central stable syndrome projectors. Its minimal central projectors $P_1,\ldots,P_m$ satisfy
$$
P_iP_j=\delta_{ij}P_i,
\qquad
\sum_iP_i=I_B.
$$
Thus
$$
\mathcal B=\bigoplus_iP_i\mathcal B
=\bigoplus_i\mathbb C^{n_i},
\qquad
n_i=\operatorname{rank}P_i,
\qquad
\sum_i n_i=6.
$$
A connected finite-response-preserving frame transformation cannot permute the discrete minimal central projectors, because such permutations lie in disconnected components of the syndrome automorphism group. Hence it satisfies
$$
UP_iU^\dagger=P_i
$$
for every $i$, and therefore decomposes as
$$
U=\bigoplus_iU_i,
\qquad
U_i\in U(n_i).
$$
∎

**Theorem G.8.4b (Unique Capacity-Saturating Block-Frame Inactive-Sector Module Decomposition).** Work on the finite-response syndrome branch of Lemma G.8.4a.1 in which compact connected local frame symmetries act faithfully on a direct-sum inactive-sector certificate
$$
\mathcal B\cong\bigoplus_i \mathbb C^{n_i},
\qquad
\sum_i n_i=6,
$$
exact response-null global phases are quotiented, and the positive-marginal regime of Equation (G.8.5) retains every admissible non-null generator inside this block-frame family until the Lagrangian capacity bound of Theorem G.8.2e is saturated. Then the unique capacity-saturating block-frame inactive-sector module decomposition is
$$
\mathcal B\cong\mathbb C^3\oplus\mathbb C^2\oplus\mathbb C^1.
$$
Moreover, the retained abelian rank is exactly one.

*Proof.* Let
$$
\mathcal B\cong\bigoplus_{i=1}^m\mathbb C^{n_i},
\qquad
\sum_{i=1}^m n_i=6,
$$
be an unordered block decomposition. A connected compact unitary symmetry preserving the block structure has non-abelian part
$$
\bigoplus_{i:n_i\ge2}\mathfrak{su}(n_i),
$$
so define
$$
s(\lambda)=\sum_{i:n_i\ge2}(n_i^2-1).
$$
The raw block-frame group has one phase direction per block. The common total phase is response-null under the PPI quotient, so the maximum response-active abelian rank is
$$
r_{\max}(\lambda)=m-1.
$$
Theorem G.8.2e gives the sharp jointly estimable capacity
$$
n_G\le ab=12.
$$
Therefore, if $s(\lambda)\le12$, the number of abelian directions that can be retained without exceeding capacity is
$$
r(\lambda)=\min\{r_{\max}(\lambda),\,12-s(\lambda)\},
$$
and the total retained generator count is
$$
N(\lambda)=s(\lambda)+r(\lambda).
$$
If $s(\lambda)>12$, the partition is over capacity before any abelian direction is retained.

The unordered partitions of $6$ give:

| Partition $\lambda$ | $s(\lambda)$ | $r_{\max}(\lambda)$ | $N(\lambda)$ | Status |
|:--------------------|-------------:|--------------------:|--------------:|:-------|
| $6$ | $35$ | $0$ | over capacity | excluded |
| $5+1$ | $24$ | $1$ | over capacity | excluded |
| $4+2$ | $18$ | $1$ | over capacity | excluded |
| $4+1+1$ | $15$ | $2$ | over capacity | excluded |
| $3+3$ | $16$ | $1$ | over capacity | excluded |
| $3+2+1$ | $8+3=11$ | $2$ | $12$ | saturates |
| $3+1+1+1$ | $8$ | $3$ | $11$ | underfills |
| $2+2+2$ | $3+3+3=9$ | $2$ | $11$ | underfills |
| $2+2+1+1$ | $3+3=6$ | $3$ | $9$ | underfills |
| $2+1+1+1+1$ | $3$ | $4$ | $7$ | underfills |
| $1+1+1+1+1+1$ | $0$ | $5$ | $5$ | underfills |

All rows with $s(\lambda)>12$ violate the capacity bound. In the positive-marginal regime, a response-active generator with positive Fisher distinguishability that fits inside the remaining capacity cannot be omitted by a PCE minimizer: omitting it leaves a finite-protocol comparison untracked and strictly increases the regret term relative to a competitor that retains it. Therefore every underfilled row is PCE-dominated by an admissible capacity-saturating row if such a row exists.

The table contains exactly one capacity-saturating row:
$$
\lambda=3+2+1.
$$
For this row,
$$
s(3+2+1)=8+3=11,
$$
and one capacity slot remains:
$$
12-s(3+2+1)=1.
$$
Although $r_{\max}(3+2+1)=2$, only one abelian response direction can be retained without exceeding the Lagrangian capacity. Hence
$$
r(3+2+1)=1,
$$
and the retained count is
$$
N(3+2+1)=8+3+1=12.
$$
Thus the inactive-sector decomposition is uniquely
$$
\mathcal B\cong\mathbb C^3\oplus\mathbb C^2\oplus\mathbb C^1,
$$
with exactly one retained abelian direction. The later chirality and anomaly-descent ledger identifies the $3$-block as the color block, the $2$-block as the weak block, and the single retained abelian generator as the hypercharge direction; it does not introduce another capacity-saturating partition. ∎

**Corollary G.8.4c (Gauge-Algebra Selection on the Finite-Response Block-Frame Capacity Branch).** Under the hypotheses of Theorem G.8.4b, the unique capacity-saturating determinant-compatible block-frame gauge algebra acting faithfully on the inactive-sector certificate is
$$
\mathfrak g_{\mathrm{SM}}
=
\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
\qquad
\dim\mathfrak g_{\mathrm{SM}}=8+3+1=12.
$$
At the connected-cover notation level, the Lie algebra above is represented by
$$
SU(3)\times SU(2)\times U(1).
$$
The determinant-compatible block-frame global form on the ordered $3+2+1$ inactive-sector split is
$$
S(U(3)\times U(2))
\cong
\frac{SU(3)\times SU(2)\times U(1)}{\mathbb Z_6},
$$
up to the hypercharge normalization and simultaneous sign convention fixed later by Theorem G.8.4e.1b and Corollary G.8.4e.1c. Thus Theorem G.8.4b fixes the algebra and determinant-compatible interface group; it does not by itself add an independent arbitrary global-form classification. This algebra saturates the geometric bound of Theorem G.8.2e.

*Proof.* Theorem G.8.4b gives the unique block split $3+2+1$. The non-abelian block-preserving part is
$$
\mathfrak{su}(3)\oplus\mathfrak{su}(2).
$$
Corollary G.8.4h.3 quotients exact response-null global phases. Theorem G.8.4b shows that the non-abelian part contributes $8+3=11$ generators and that the Lagrangian capacity leaves exactly one retained abelian response direction. Hence the full connected algebra is exactly
$$
\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
$$
with dimension $12$. ∎

**Corollary G.8.4c.0a (No Free Gauge-Branch Selection at Fixed Inactive Sector).** Inside the finite-response syndrome/block-frame positive-marginal branch of Lemma G.8.4a.1 and Theorem G.8.4b, the gauge algebra of Corollary G.8.4c is forced by the inactive-sector certificate and is not a post-hoc Standard Model insertion.

*Proof.* Lemma G.8.4a.1 first shows that any connected frame symmetry preserving stable finite-response syndrome data on $\mathcal B$ has block-frame normal form. Theorem G.8.4b then enumerates every unordered partition of $\dim\mathcal B=6$ and evaluates
$$
s(\lambda)=\sum_{i:n_i\ge2}(n_i^2-1),
\qquad
r_{\max}(\lambda)=m-1,
\qquad
N(\lambda)=s(\lambda)+\min\{r_{\max}(\lambda),12-s(\lambda)\}
$$
whenever $s(\lambda)\le12$. Rows with $s(\lambda)>12$ violate the Lagrangian capacity bound of Theorem G.8.2e. Rows with $N(\lambda)<12$ are PCE-dominated in the positive-marginal regime because the partition $3+2+1$ is admissible and saturates $N=12$. The enumeration contains exactly one saturating row, namely $3+2+1$, and the one retained abelian direction follows from the remaining capacity slot $12-(8+3)=1$. Therefore no other compact connected faithful finite-response block-frame algebra on $\mathcal B$ has the same admissibility, capacity saturation, and finite-response quotient data. ∎

**Corollary G.8.4c.0a.1 (Block-Frame Stabilizer-Code Form of the Gauge Algebra).**
Let
$$
\mathcal B
=
\mathcal B_C\oplus\mathcal B_W\oplus\mathcal B_Y
\cong
\mathbb C^3\oplus\mathbb C^2\oplus\mathbb C^1
\tag{G.8.4c.0a.1}
$$
be the finite-response inactive-sector block frame selected on the positive-marginal branch of Theorem G.8.4b, with block projectors $P_C,P_W,P_Y$. Regard the finite block label measured by $(P_C,P_W,P_Y)$ as the syndrome of the retained block-frame code: transformations are retained precisely when they preserve the syndrome partition and act faithfully on the response-active degrees of freedom after quotienting response-null phases.

The connected capacity-saturating determinant-compatible retained stabilizer algebra of this block-frame code is
$$
\mathfrak g_{\mathrm{stab}}
=
\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
\tag{G.8.4c.0a.2}
$$
with
$$
\dim\mathfrak g_{\mathrm{stab}}=8+3+1=12.
\tag{G.8.4c.0a.3}
$$
Equivalently, the gauge fields of Corollary G.8.4c are the continuous stabilizer connections of the PCE-selected finite-response block code.

*Proof.* The syndrome projectors $P_C,P_W,P_Y$ force every syndrome-preserving continuous transformation to preserve the ordered decomposition (G.8.4c.0a.1). The nonabelian faithful parts on the rank-$3$ and rank-$2$ blocks are
$$
\mathfrak{su}(3)\oplus\mathfrak{su}(2),
$$
contributing $8+3=11$ generators. The PPI quotient removes response-null common phases. Theorem G.8.2e bounds the total retained gauge generator count by $12$, and Theorem G.8.4b shows that the $3+2+1$ block frame is the unique admissible positive-marginal partition saturating that bound, with exactly one remaining abelian response direction because $12-(8+3)=1$. Therefore the retained connected stabilizer algebra is exactly (G.8.4c.0a.2). This is the same algebra selected in Corollary G.8.4c, now written as the stabilizer algebra of the finite-response block-code syndrome. ∎

**Remark G.8.4c.0b (Scope Guard: No Arbitrary $U(6)$-Subgroup Classification).** Theorem G.8.4b and Corollary G.8.4c classify the finite-response block-frame/interface-category branch. They do not classify all compact connected Lie subgroups of $U(6)$.

In particular, the tensor-product image
$$
G_\otimes
=
(U(1)\times SU(2)\times SU(3))/\Gamma
\hookrightarrow U(6)
$$
acting irreducibly on
$$
\mathbb C^6\cong\mathbb C^2\otimes\mathbb C^3
$$
has Lie algebra
$$
\mathfrak u(1)\oplus\mathfrak{su}(2)\oplus\mathfrak{su}(3)
$$
and dimension
$$
1+3+8=12.
$$
It is not $U(6)$-conjugate to the reducible block-frame action on
$$
\mathbb C^3\oplus\mathbb C^2\oplus\mathbb C^1,
$$
because irreducibility is invariant under unitary conjugacy.

This tensor-product image is therefore not excluded by an arbitrary-subgroup classification theorem. It is outside the admissible family of Theorem G.8.4b because it does not preserve the finite-response direct-sum certificate
$$
\mathcal B=C\oplus W\oplus Y
$$
or the determinant interface contract used in Definition G.8.4h.1. Thus the PU result is block-frame/interface-category uniqueness, not uniqueness among all compact connected subgroups of $U(6)$.

Equivalently, PU does not assume or derive a full-centralizer maximality rule
$$
G=Z_{U(\mathcal B)}(V|_{\mathcal B})
$$
modulo phase. At capacity, an omitted response-changing centralizer direction may be unaffordable rather than response-null. The valid PCE statement is saturation inside the accepted finite-response admissible family, not equality with the full centralizer.

The rank-2 weak block is not an independent rank coincidence at the block-frame level. It is the unique capacity-saturating rank-2 summand selected when the Landauer-selected active rank $a=2$, the minimal carrier dimension $d_0=8$, and the capacity equation
$$
ab=2(8-2)=12
$$
are imposed. Fiberwise, any local unitary identification between the active rank-2 carrier and the weak rank-2 summand transports the Pauli $\mathfrak{su}(2)$ algebra to the weak block. This is a local frame identification, not a canonical global bundle isomorphism.

**Theorem G.8.4c.0c (Pauli Reflection of the Capacity-Selected Weak Block).** On the minimal finite-response flag-lift branch, let
$$
X=\mathrm{Gr}(2,8),
$$
with tautological active bundle $S\to X$ and inactive quotient bundle $Q\to X$. On the ordered flag lift
$$
\pi:\widetilde X=\mathrm{Flag}_{1,2,3}(Q)\to X,
$$
write
$$
\pi^*Q\cong\widetilde Q_Y\oplus\widetilde Q_W\oplus\widetilde Q_C,
\qquad
\operatorname{rk}_{\mathbb C}(\widetilde Q_Y,\widetilde Q_W,\widetilde Q_C)=(1,2,3).
$$
Then the weak rank-2 block is forced by the same active-rank source as the active Pauli algebra:
$$
\text{SPAP merge}
\to
\varepsilon_0=\ln2
\to
a=2
\to
(b,ab)=(6,12)
\to
3+2+1.
$$
For every $\tilde x\in\widetilde X$ and every local unitary fiber isometry
$$
\Phi_{\tilde x}:S_{\pi(\tilde x)}\to(\widetilde Q_W)_{\tilde x},
$$
one has
$$
\operatorname{Ad}_{\Phi_{\tilde x}}
\bigl(\mathfrak{su}(S_{\pi(\tilde x)})\bigr)
=
\mathfrak{su}((\widetilde Q_W)_{\tilde x}).
$$
Equivalently, the weak algebra is the inactive Pauli reflection of the active-kernel Pauli algebra, fiberwise and up to local unitary frame choice:
$$
\mathfrak{su}(2)_L
=
\Phi\,\mathfrak{su}(2)_{\mathrm{act}}\,\Phi^\dagger.
$$
This does not assert a canonical global bundle isomorphism $S\cong\widetilde Q_W$.

*Proof.* The SPAP/Landauer/PPI chain (Theorems 10, 31, Z.1, G.10.2, G.10.3) gives $a=2$. The minimal carrier dimension gives $d_0=8$ and hence $b=6$. The block-frame capacity bound gives $ab=12$. The unordered block-partition count
$$
n_G(\lambda)=1+\sum_{i:n_i\ge2}(n_i^2-1)
$$
has a unique saturating row at $b=6$, namely $3+2+1$, so the weak block has rank $2$. Every complex Hermitian rank-2 fiber carries a Pauli algebra by the active-kernel identification of Theorems G.10.2--G.10.3: choosing a unitary basis gives the traceless Hermitian Pauli span $\operatorname{span}_{\mathbb R}\{\sigma_i\}$, equivalently $i\operatorname{span}_{\mathbb R}\{\sigma_i\}$ in the anti-Hermitian Lie-algebra convention, and a change of unitary basis acts by the adjoint $PU(2)\cong SO(3)$ on traceless generators. Conjugation by any unitary $\Phi_{\tilde x}$ preserves brackets and sends traceless anti-Hermitian endomorphisms of the active fiber bijectively to those of the weak fiber. Corollary G.8.4c identifies the nonabelian algebra of that rank-2 block with the weak algebra. ∎

**Remark G.8.4c.0d (Counterfactual Active-Rank Audit and No Color-Block Ambiguity).** At fixed $d_0=8$, the active rank $a=2$ is the only admissible value that uniquely forces exactly one inactive 2-block by capacity saturation. The counterfactual ledger is:

| $a$ | $b=8-a$ | $ab$ | Saturating partition(s) | 2-block outcome |
|:--:|:--:|:--:|:--|:--|
| $1$ | $7$ | $7$ | $2+2+1+1+1$ | two 2-blocks; also violates $\ln a\ge\ln2$ |
| $2$ | $6$ | $12$ | $3+2+1$ | exactly one 2-block |
| $3$ | $5$ | $15$ | none | no saturation |
| $4$ | $4$ | $16$ | $4$ | no 2-block |
| $5$ | $3$ | $15$ | none | no saturation |
| $6$ | $2$ | $12$ | none | no saturation |
| $7$ | $1$ | $7$ | none | no saturation |

Although $\mathfrak{su}(3)$ contains embedded $\mathfrak{su}(2)$ subalgebras, those embedded subalgebras do not replace the weak block. The $3$-block contributes the full $\mathfrak{su}(3)$ with $8$ retained generators on the capacity branch; replacing it by a proper embedded $\mathfrak{su}(2)$ would discard response-changing generators and fail the saturation certificate. The weak algebra is $\mathfrak{su}(\widetilde Q_W)$, placed left-chirally by the existing chiral determinant-line and weak-left projection branch. An accepted low-energy independent $SU(2)_R$ or any non-$\mathfrak{su}(2)$ weak carrier at the same capacity level would require changing the $n_G=12$ ledger rather than silently coexisting with it.

The downstream paragraphs at the end of Appendix G.10 (the causal-chain paragraph extending SPAP $\mathbb Z_2$ through the active-rank/weak-block identification) and in Section Z.14a (the weak-block caveat) cross-reference this theorem and should be read as the same local frame statement under different headings, not as independent transport claims.

**Theorem G.8.4c.0e (Bordism-Anomaly Spectrum Closure Gate).** Let $\mathcal G_{\mathrm{pred}}$ be the determinant-compatible finite-response gauge object selected on the $3+2+1$ block-frame branch of Theorem G.8.4b and Corollary G.8.4c. Let $\mathcal M$ be a finite or compact admissible family of chiral matter/defect packages with fixed response maps and fixed defect-inflow channels. Suppose the branch supplies an additive finite anomaly-bordism character
$$
\mathfrak A_{\mathrm{tot}}(M)
=
\mathfrak A_{\mathrm{bulk}}+\mathfrak A_M+\partial\mathfrak A_{\mathrm{defect}}
\in
\operatorname{Hom}(\Omega^{\mathrm{Spin}}_5(B\mathcal G_{\mathrm{pred}}),\mathbb R/\mathbb Z)
\tag{G.8.4c.0e.1}
$$
or its finite retained anomaly-group image. A package is anomaly-admissible exactly when
$$
[\mathfrak A_{\mathrm{tot}}(M)]=0.
\tag{G.8.4c.0e.2}
$$
Let
$$
\mathcal K
:=
\{M\in\mathcal M:[\mathfrak A_{\mathrm{tot}}(M)]=0\}/\sim_{\mathrm{resp}}
\tag{G.8.4c.0e.3}
$$
be the response quotient of admissible packages, read as a finite quotient when $\mathcal M$ is finite and as the induced compact quotient on compact branches. If $\mathcal K$ is nonempty and the description-cost functional $\mathcal C_{\mathrm{desc}}$ is lower semicontinuous on $\mathcal K$, then a PCE-minimal anomaly-closed matter package exists. If, moreover, the selected class $M_*$ has a strict gap
$$
\mathcal C_{\mathrm{desc}}(M)-\mathcal C_{\mathrm{desc}}(M_*)\ge\Delta_{\mathrm{matter}}>0
\tag{G.8.4c.0e.4}
$$
for every response-distinct $M\ne M_*$, then $M_*$ is unique up to response-null conjugation and defect-gauge equivalence. In particular, if the one-generation Standard Model chiral package satisfies (G.8.4c.0e.2) and the strict-gap condition (G.8.4c.0e.4) against every admissible exotic package, then it is the selected matter package on that branch. Without the anomaly-bordism record and strict PCE gap, Corollary G.8.4c selects the gauge algebra only; it does not by itself select the full matter spectrum.

*Proof.* Additivity of the anomaly character makes defect filling equivalent to vanishing of the total additive class (G.8.4c.0e.2). Packages whose finite protocol responses are naturally isomorphic are identified by the response quotient, so only $\mathcal K$ carries physical matter-package distinctions. On a finite response quotient, existence of a minimum is immediate; on a compact response quotient it follows from lower semicontinuity. The strict gap (G.8.4c.0e.4) excludes any second response-distinct minimizer, giving uniqueness up to the quotient equivalences. The final statement is the specialization of this selection criterion to the Standard Model one-generation package. If the required anomaly class or gap is absent, the minimization problem is not a closed finite certificate, so the spectrum claim cannot be promoted beyond branch or target status. ∎

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


**Remark G.8.4d: Complementary Derivation Structure.** Proposition G.M1 identifies the emergent gauged algebra as the decomposition-preserving local unitary symmetry once the internal block-frame module split is fixed. Theorem G.8.4b derives the unique PCE-selected block-frame decomposition
$$
\mathcal{B}=\mathbb{C}^3\oplus\mathbb{C}^2\oplus\mathbb{C}^1
$$
inside the finite-response block-frame positive-marginal capacity branch. Together they yield
$$
\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak{u}(1)
$$
as the unique determinant-compatible block-frame algebra on that branch. This is not an arbitrary compact-subgroup classification in $U(6)$ and does not use a full-centralizer maximality assumption. The remaining abelian normalization is fixed only after determinant-character and anomaly descent, supplied by Theorem G.8.4e.1b and Corollary G.8.4e.1c.

**Theorem G.8.4e (Topological No-Go for a $(1,2,3)$ Reduction of the Universal Quotient Bundle).** Let
$$
X=\mathrm{Gr}(2,8),
\qquad
0\to S\to \underline{\mathbb C}^8\to Q\to 0
$$
be the tautological exact sequence, with $Q$ the universal rank-$6$ quotient bundle. Then $Q$ admits no smooth complex line subbundle. Consequently there is no smooth splitting
$$
Q=Q_Y\oplus Q_W\oplus Q_C,
\qquad
\operatorname{rk}_{\mathbb C}(Q_Y,Q_W,Q_C)=(1,2,3),
$$
and no global section
$$
\sigma\in \Gamma\!\left(\mathrm{Fr}(Q)/(U(1)\times U(2)\times U(3))\right).
$$

*Proof.* A $(1,2,3)$ reduction would in particular give a complex line subbundle $L\subset Q$. We show that no such $L$ exists.

Fix a line $\ell\subset \mathbb C^8$ and consider the closed submanifold
$$
Y:=\{\,W\in \mathrm{Gr}(2,8):\ell\subset W\,\}\cong \mathbb{CP}^6.
$$
Let $i:Y\hookrightarrow X$ denote the inclusion. On $Y$, the tautological bundle splits as
$$
i^*S\cong \underline{\ell}\oplus \mathcal O_{\mathbb{CP}^6}(-1),
$$
so
$$
i^*Q\cong \underline{\mathbb C}^7/\mathcal O_{\mathbb{CP}^6}(-1),
$$
the universal quotient bundle on $\mathbb{CP}^6$. Writing $h:=c_1(\mathcal O_{\mathbb{CP}^6}(1))$, its total Chern class is
$$
c(i^*Q)=\frac{1}{1-h}=1+h+h^2+h^3+h^4+h^5+h^6,
$$
hence
$$
c_k(i^*Q)=h^k,\qquad k=0,\dots,6.
$$

Now suppose $L\subset Q$ is a line subbundle. Since $\operatorname{Pic}(X)\cong \mathbb Z$ for the Grassmannian, there is an integer $m$ with
$$
L\cong \mathcal O_X(m).
$$
Restricting to $Y$ gives
$$
i^*L\cong \mathcal O_{\mathbb{CP}^6}(m).
$$
The inclusion $i^*L\hookrightarrow i^*Q$ is equivalent to a nowhere-zero section of
$$
i^*Q\otimes \mathcal O_{\mathbb{CP}^6}(-m).
$$
Therefore its top Chern class must vanish:
$$
c_6\!\left(i^*Q\otimes \mathcal O_{\mathbb{CP}^6}(-m)\right)=0.
$$

For a rank-$6$ bundle $E$ and line bundle $M$ with $c_1(M)=\lambda$, one has
$$
c_6(E\otimes M)=\sum_{j=0}^6 c_{6-j}(E)\lambda^j.
$$
Here $\lambda=-mh$, so
$$
c_6\!\left(i^*Q\otimes \mathcal O_{\mathbb{CP}^6}(-m)\right)
=
\sum_{j=0}^6 h^{6-j}(-mh)^j
=
\bigl(1-m+m^2-m^3+m^4-m^5+m^6\bigr)h^6.
$$
The polynomial
$$
f(m):=1-m+m^2-m^3+m^4-m^5+m^6
$$
has no integer zero: if $m\neq -1$, then
$$
f(m)=\frac{m^7+1}{m+1},
$$
so $f(m)=0$ would imply $m^7+1=0$, hence $m=-1$, but $f(-1)=7\neq 0$. Therefore
$$
c_6\!\left(i^*Q\otimes \mathcal O_{\mathbb{CP}^6}(-m)\right)\neq 0
$$
for every $m\in \mathbb Z$, contradiction. Thus $Q$ has no line subbundle, hence no $(1,2,3)$ splitting. ∎

**Theorem G.8.4e.1 (Universal Property of the Minimal Flag Lift for the Quantitative Gauge Sector).** Let
$$
\pi:\widetilde X:=\mathrm{Flag}_{1,2,3}(Q)\to X=\mathrm{Gr}(2,8)
$$
be the flag bundle of the quotient bundle $Q$, so a point of the fiber $\widetilde X_x$ is a pair of subspaces
$$
L_Y\subset L_{YW}\subset Q_x,
\qquad
\dim_{\mathbb C}L_Y=1,
\qquad
\dim_{\mathbb C}L_{YW}=3.
$$
The quotient bundle $Q$ carries the canonical Hermitian quotient metric induced from $\underline{\mathbb C}^8$, and $\pi^*Q$ carries its pullback. For each such flag define
$$
L_W:=L_{YW}\cap L_Y^\perp,
\qquad
L_C:=L_{YW}^\perp.
$$
Then $\widetilde X$ carries canonical smooth complex subbundles
$$
0\subset \widetilde Q_Y \subset \widetilde Q_Y\oplus \widetilde Q_W \subset \pi^*Q
$$
with
$$
\operatorname{rk}_{\mathbb C}(\widetilde Q_Y,\widetilde Q_W,\widetilde Q_C)=(1,2,3),
\qquad
\pi^*Q\cong \widetilde Q_Y\oplus \widetilde Q_W\oplus \widetilde Q_C
$$
as an orthogonal direct sum.

Moreover, for every smooth map $q:Y\to X$, smooth lifts $\widetilde q:Y\to \widetilde X$ satisfying $\pi\circ \widetilde q=q$ are in natural bijection with orthogonal ordered splittings
$$
q^*Q\cong E_Y\oplus E_W\oplus E_C,
\qquad
\operatorname{rk}_{\mathbb C}(E_Y,E_W,E_C)=(1,2,3),
$$
with respect to the pulled-back Hermitian metric, via
$$
E_s\cong \widetilde q^*\widetilde Q_s,
\qquad
s\in\{Y,W,C\}.
$$
Equivalently, if $p:Z\to X$ is a smooth manifold and
$$
p^*Q\cong E_Y\oplus E_W\oplus E_C
$$
is an orthogonal ordered rank-$(1,2,3)$ splitting, then there exists a unique smooth map
$$
F:Z\to \widetilde X
$$
over $X$ such that
$$
E_s\cong F^*\widetilde Q_s,
\qquad
s\in\{Y,W,C\}.
$$
Hence $\widetilde X$ is, up to unique isomorphism over $X$, the universal global lift carrying the ordered inactive-sector decomposition. By Theorem G.8.4e, no such splitting exists on $X$ itself. Therefore every quantitative gauge-threshold construction whose global smooth data require the ordered $Y/W/C$ decomposition must be formulated on $\widetilde X$, or on a space mapping uniquely to it over $X$.

*Proof.* Let
$$
0\subset S_1\subset S_3\subset \pi^*Q
$$
be the tautological rank-$1$ and rank-$3$ subbundles on the flag bundle. Define
$$
\widetilde Q_Y:=S_1,
\qquad
\widetilde Q_W:=S_3\cap S_1^\perp,
\qquad
\widetilde Q_C:=S_3^\perp,
$$
where orthogonal complements are taken with respect to the pulled-back Hermitian metric on $\pi^*Q$. These are smooth subbundles: locally one may choose a smooth unitary frame of $\pi^*Q$ adapted to $S_1\subset S_3$, and in such a frame $S_1^\perp$, $S_3^\perp$, and $S_3\cap S_1^\perp$ are represented by coordinate subspaces of constant rank. Fiberwise one has
$$
(\widetilde Q_Y)_\xi=L_Y,
\qquad
(\widetilde Q_Y\oplus \widetilde Q_W)_\xi=L_{YW},
\qquad
(\widetilde Q_C)_\xi=L_{YW}^\perp,
$$
so
$$
\pi^*Q\cong \widetilde Q_Y\oplus \widetilde Q_W\oplus \widetilde Q_C
$$
orthogonally.

Now let $q:Y\to X$ and suppose
$$
q^*Q\cong E_Y\oplus E_W\oplus E_C
$$
is an orthogonal ordered splitting. For each $y\in Y$, the pair
$$
(E_Y)_y\subset (E_Y\oplus E_W)_y\subset Q_{q(y)}
$$
defines a point of the fiber $\widetilde X_{q(y)}$. This gives a map
$$
\widetilde q:Y\to \widetilde X,
\qquad
\widetilde q(y)=\bigl(q(y);(E_Y)_y\subset (E_Y\oplus E_W)_y\bigr).
$$
In a local unitary trivialization of $q^*Q$ adapted to the splitting, the corresponding flag coordinates vary smoothly, so $\widetilde q$ is smooth. By construction $\pi\circ \widetilde q=q$ and the pulled-back tautological subbundles recover the original splitting:
$$
\widetilde q^*\widetilde Q_s\cong E_s,
\qquad
s\in\{Y,W,C\}.
$$

Conversely, given a smooth lift $\widetilde q:Y\to \widetilde X$ with $\pi\circ \widetilde q=q$, pull back the orthogonal decomposition of $\pi^*Q$:
$$
q^*Q\cong \widetilde q^*\widetilde Q_Y\oplus \widetilde q^*\widetilde Q_W\oplus \widetilde q^*\widetilde Q_C.
$$
This is an orthogonal rank-$(1,2,3)$ splitting. The two constructions are inverse by fiberwise inspection, and uniqueness of the lift follows because a point of $\widetilde X_{q(y)}$ is exactly a rank-$1$ subspace together with a containing rank-$3$ subspace of $Q_{q(y)}$.

Now let $p:Z\to X$ be a smooth manifold equipped with such a splitting of $p^*Q$. Applying the preceding bijection to $q=p$ gives a unique smooth map $F:Z\to \widetilde X$ over $X$ with
$$
E_s\cong F^*\widetilde Q_s,
\qquad
s\in\{Y,W,C\}.
$$
If $Z'$ is another smooth manifold over $X$ equipped with a tautological orthogonal ordered rank-$(1,2,3)$ splitting of the pullback of $Q$ and satisfying the same property, then the tautological splitting on $\widetilde X$ gives a unique map $G:\widetilde X\to Z'$ over $X$, while the tautological splitting on $Z'$ gives a unique map $H:Z'\to \widetilde X$ over $X$. The composites $H\circ G$ and $G\circ H$ preserve the respective tautological splittings, and the identity maps do as well; by uniqueness one has
$$
H\circ G=\mathrm{id}_{\widetilde X},
\qquad
G\circ H=\mathrm{id}_{Z'},
$$
so $Z'\cong \widetilde X$ uniquely over $X$.

Finally, if $X$ itself carried a global orthogonal ordered $(1,2,3)$ splitting of $Q$, the bijection above with $q=\mathrm{id}_X$ would produce a lift $X\to \widetilde X$. Pulling back $\widetilde Q_Y$ along that lift would give a line subbundle of $Q$, contradicting Theorem G.8.4e. Hence no such splitting exists on the bare Grassmannian, and every global construction whose smooth data require that ordered decomposition must pass through the universal lift $\widetilde X$. ∎

**Proposition G.8.4e.1a (Identification with a Standard Partial Flag Manifold).** *The flag lift $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$ is isomorphic to the partial flag manifold*
$$
\widetilde X\cong \mathrm{Flag}(2,3,5;\mathbb C^8)=SU(8)/S(U(2)\times U(1)\times U(2)\times U(3)).
$$

*Proof.* A point of $\widetilde X$ is a pair $(W,L_1\subset L_2\subset \mathbb C^8/W)$ with $\dim W=2$, $\dim L_1=1$, and $\dim L_2=3$. Let $p:\mathbb C^8\to \mathbb C^8/W$ be the quotient map and set
$$
V_1:=W,\qquad V_2:=p^{-1}(L_1),\qquad V_3:=p^{-1}(L_2).
$$
Since $\ker p=W$ has dimension $2$, the preimage of a $k$-dimensional subspace of $\mathbb C^8/W$ has dimension $k+2$. Hence
$$
0\subset V_1\subset V_2\subset V_3\subset \mathbb C^8
$$
with
$$
\dim V_1=2,\qquad \dim V_2=3,\qquad \dim V_3=5.
$$
Conversely, a flag $0\subset V_1\subset V_2\subset V_3\subset \mathbb C^8$ of dimensions $(2,3,5)$ recovers
$$
W=V_1,\qquad L_1=V_2/V_1,\qquad L_2=V_3/V_1.
$$
The two constructions are inverse to each other, so $\widetilde X\cong \mathrm{Flag}(2,3,5;\mathbb C^8)$. The stabilizer of a reference flag with block sizes $(2,1,2,3)$ is $S(U(2)\times U(1)\times U(2)\times U(3))$. The complex dimension is
$$
\dim_{\mathbb C}(\widetilde X)=12+11=23,
$$
since $\dim_{\mathbb C}\mathrm{Gr}(2,8)=2\cdot 6=12$ and the fiber $\mathrm{Flag}(1,3;\mathbb C^6)$ has complex dimension $11$. Therefore $\dim_{\mathbb R}(\widetilde X)=46$. $\square$

The block decomposition $\mathbb C^8=A\oplus B\oplus C\oplus D$ with
$$
\dim A=2,\qquad \dim B=1,\qquad \dim C=2,\qquad \dim D=3
$$
identifies the four blocks with the active subspace and the lifted $Y$, $W$, and $C$ sectors at the reference point.

**Theorem G.8.4e.1b (Flag-Chern Hypercharge Descent).** On the minimal flag lift
$$
\pi:\widetilde X=\mathrm{Flag}_{1,2,3}(Q)\to\mathrm{Gr}(2,8),
$$
write the tautological sector splitting as
$$
\pi^*Q\cong\widetilde Q_Y\oplus\widetilde Q_W\oplus\widetilde Q_C,
\qquad
\operatorname{rk}_{\mathbb C}(\widetilde Q_Y,\widetilde Q_W,\widetilde Q_C)=(1,2,3).
$$
Assume one SM-type left-chiral predictive block with fields
$$
q,\quad u^c,\quad d^c,\quad \ell,\quad e^c,
$$
and one Higgs doublet $H$. Let their hypercharges be
$$
y_q,\quad y_{u^c},\quad y_{d^c},\quad y_\ell,\quad y_{e^c},
\qquad
y_H.
$$
The Chern-character anomaly descent equations on the flag-resolved $C/W/Y$ bundles are
$$
2y_q+y_{u^c}+y_{d^c}=0,
$$
$$
3y_q+y_\ell=0,
$$
$$
6y_q+3y_{u^c}+3y_{d^c}+2y_\ell+y_{e^c}=0,
$$
$$
6y_q^3+3y_{u^c}^3+3y_{d^c}^3+2y_\ell^3+y_{e^c}^3=0.
$$
Yukawa descent for one Higgs doublet is
$$
y_q+y_H+y_{u^c}=0,
\qquad
y_q-y_H+y_{d^c}=0,
\qquad
y_\ell-y_H+y_{e^c}=0.
$$
The unique nontrivial solution up to overall abelian scale is
$$
y_H=3a,\quad
y_q=a,\quad
y_{u^c}=-4a,\quad
y_{d^c}=2a,\quad
y_\ell=-3a,\quad
y_{e^c}=6a.
$$
With primitive Standard Model normalization $a=1/6$,
$$
y_q=\frac16,\quad
y_{u^c}=-\frac{2}{3},\quad
y_{d^c}=\frac13,\quad
y_\ell=-\frac12,\quad
y_{e^c}=1,\quad
y_H=\frac12.
$$
The global $SU(2)$ anomaly condition is also satisfied because the number of weak doublets in one family is $3+1=4$, which is even.

*Proof.* The flag lift supplies globally defined sector bundles $\widetilde Q_C$, $\widetilde Q_W$, and $\widetilde Q_Y$. Therefore the Chern-character anomaly polynomial can be written globally in terms of the sector Chern roots. In four dimensions, the perturbative gauge anomaly is the degree-six part of
$$
\widehat A(TM)\operatorname{ch}(E_{\mathrm{block}}).
$$
The coefficient of $SU(3)^2U(1)$ is the trace of $Y$ over color fundamentals, counted with weak multiplicity. The quark doublet contributes $2y_q$, and the fields $u^c,d^c$ contribute $y_{u^c},y_{d^c}$. Removing the common nonzero quadratic index gives
$$
2y_q+y_{u^c}+y_{d^c}=0.
$$
The coefficient of $SU(2)^2U(1)$ is the trace of $Y$ over weak doublets, counted with color multiplicity. The quark doublet contributes $3y_q$ and the lepton doublet contributes $y_\ell$, so
$$
3y_q+y_\ell=0.
$$
The mixed gravitational anomaly coefficient is the trace of $Y$ over all left-chiral states:
$$
6y_q+3y_{u^c}+3y_{d^c}+2y_\ell+y_{e^c}=0.
$$
The cubic abelian anomaly coefficient is the trace of $Y^3$:
$$
6y_q^3+3y_{u^c}^3+3y_{d^c}^3+2y_\ell^3+y_{e^c}^3=0.
$$

The Yukawa monomials are required to be sections of the trivial hypercharge line. Hence
$$
y_q+y_H+y_{u^c}=0,
\qquad
y_q-y_H+y_{d^c}=0,
\qquad
y_\ell-y_H+y_{e^c}=0.
$$
Solving these gives
$$
y_{u^c}=-y_q-y_H,
\qquad
y_{d^c}=-y_q+y_H,
\qquad
y_{e^c}=-y_\ell+y_H.
$$
The $SU(2)^2U(1)$ equation gives
$$
y_\ell=-3y_q.
$$
Substituting these four relations into the mixed gravitational equation gives
$$
6y_q+3(-y_q-y_H)+3(-y_q+y_H)+2(-3y_q)+(3y_q+y_H)=0.
$$
The left-hand side reduces to
$$
-y_q-y_q-y_q+y_H=-3y_q+y_H,
$$
so
$$
y_H=3y_q.
$$
Writing $a:=y_q$ gives
$$
y_H=3a,\quad
y_{u^c}=-4a,\quad
y_{d^c}=2a,\quad
y_\ell=-3a,\quad
y_{e^c}=6a.
$$
Substitution into the cubic anomaly gives
$$
6a^3+3(-4a)^3+3(2a)^3+2(-3a)^3+(6a)^3
=
6a^3-192a^3+24a^3-54a^3+216a^3
=
0.
$$
Thus the cubic anomaly is automatically cancelled by the Chern-character/Yukawa solution. If $a=0$, every hypercharge is zero, contradicting the nontrivial abelian-coupling branch. Hence the nontrivial solution is unique up to scale. The primitive normalization $a=1/6$ is the minimal-denominator normalization in which $e^c$ has charge $+1$ and $H$ has charge $1/2$. The number of weak doublets is four, so Witten's global $SU(2)$ parity condition is satisfied. ∎

**Corollary G.8.4e.1c (No Hypercharge Refit Freedom).** On the minimal flag-lift branch of Theorem G.8.4e.1b, the Standard Model hypercharge lattice has no continuous refit freedom. The only remaining transformations are simultaneous reversal of the abelian generator and coupling,
$$
Y\mapsto -Y,
\qquad
g_1\mapsto -g_1,
$$
and the already fixed primitive charge-unit normalization
$$
a=\frac16.
$$

*Proof.* Theorem G.8.4e.1b solves the full linear Yukawa system, the mixed gravitational anomaly, the $SU(3)^2U(1)$ anomaly, the $SU(2)^2U(1)$ anomaly, and the cubic $U(1)^3$ anomaly. The nontrivial solution space is one-dimensional:
$$
(y_q,y_{u^c},y_{d^c},y_\ell,y_{e^c},y_H)
=
a(1,-4,2,-3,6,3).
$$
The zero vector $a=0$ is excluded by the retained nontrivial abelian-coupling branch. Multiplying all charges by $-1$ is the same physical convention as reversing the sign of the abelian generator and coupling. Multiplying by any positive real number other than the primitive charge-unit normalization changes the charge lattice and the determinant-character line by a nonprimitive cover. The minimal integral character has vector
$$
(1,-4,2,-3,6,3),
$$
whose greatest common divisor is $1$. Requiring $e^c$ to generate the unit charged singlet gives $6a=1$, hence $a=1/6$. Therefore no continuous hypercharge refit remains. ∎

**Remark G.8.4e.2 (Scope of the Lift).** Theorem G.8.4b and Corollary G.8.4c remain statements about the abstract inactive fiber $\mathcal B\cong \mathbb C^6$. Theorems G.8.4e and G.8.4e.1 show that this fiberwise $(3,2,1)$ decomposition does not globalize on the bare universal quotient bundle $Q\to \mathrm{Gr}(2,8)$ and that $\widetilde X$ is, up to unique isomorphism over $\mathrm{Gr}(2,8)$, the corresponding universal global lift on which the ordered decomposition is realized as smooth bundle data. The derivations of $d_0=8$, $a=2$, $M=24$, $D=4$, and the first-order fine-structure constant remain on bare $\mathrm{Gr}(2,8)$. The flag lift is required exactly when the ordered $Y/W/C$ sector splitting must be treated as global bundle data: the Chern-character anomaly bookkeeping of Theorem G.8.4e.1b, the generation-index globalization of Proposition R.IDX2a, and the quantitative gauge-threshold sector of Appendix T.

**Remark G.8.4e.3 (Four-Level Obstruction and Resolution Chain — Motivation for the Flag Lift).** Four independent mathematical results collectively forced the reformulation of the gauge-threshold sector from bare $\mathrm{Gr}(2,8)$ to the minimal flag lift:

1. **Pointwise Bures bound.** For any traceless generator $X$ with $\mathrm{Tr}(X^2) = 1/2$ and any rank-2 projector $P$ on $\mathbb{C}^8$, the Bures norm satisfies $\|X^\#\|_B^2(P) = \frac{1}{2}\mathrm{Tr}(BB^\dagger) \leq 1/8$. This bound is pointwise and measure-independent, so any orbit-averaged Bures-norm $Z_i$ satisfies $Z_i \leq 1/8 = 0.125$. The required gauge-matching values $Z_i \approx 1.7$ exceed this bound by a factor of $\sim 14$.

2. **$\mathrm{Ad}(U(8))$-invariance of spectral quadratic forms.** For any $U(8)$-equivariant Laplace-type operator on a $U(8)$-equivariant bundle over $\mathrm{Gr}(2,8)$, the renormalized quadratic form on generators is $\mathrm{Ad}(U(8))$-invariant, hence proportional to $\mathrm{Tr}(Y^2)$ for traceless generators. This forces equal thresholds $\Delta_1 = \Delta_2 = \Delta_3$ for any one-loop computation on the bare homogeneous geometry.

3. **Topological no-go (Theorem G.8.4e).** The universal quotient bundle $Q \to \mathrm{Gr}(2,8)$ admits no complex line subbundle, and therefore no global smooth $(1,2,3)$ splitting. This is a topological obstruction: the top Chern class $c_6(i^*Q \otimes \mathcal{O}(-m)) = f(m) \cdot h^6$ is nonzero for every integer $m$, where $f(m) = 1 - m + m^2 - m^3 + m^4 - m^5 + m^6 > 0$ for all $m \in \mathbb{Z}$.

4. **Nonzero singlet hypercharge from the SU(5) embedding and trace constraint (Remark T.17a.1).** The SU(5)-normalized hypercharge generator $\hat Y$ (Theorem T.9) has eigenvalues $(-2,-2,-2,3,3,0,0,0)/(2\sqrt{15})$ on $\mathbb{C}^8$. The unique $G_{\mathrm{SM}}$-module decomposition $\mathcal{B} = \mathbb{C}^3_C \oplus \mathbb{C}^2_W \oplus \mathbb{C}^1_Y$ (Theorem G.8.4b) identifies the per-component sector charges $y_C = -1/\sqrt{15}$ and $y_W = 3/(2\sqrt{15})$ from the eigenvalue assignment. Tracelessness of $\hat Y$ on $\mathbb{C}^8$ then forces the singlet charge: $3y_C + 2y_W + y_Y = \mathrm{Tr}(\hat Y|_{\mathcal{B}}) = -\mathrm{Tr}(\hat Y|_{\mathcal{A}}) = 2/\sqrt{15}$, and since $3y_C + 2y_W = 0$, this gives $y_Y = 2/\sqrt{15}$. The resulting $U(1)$ Dynkin index $T_1(Y) = 2y_Y^2 = 8/15$ makes the $3 \times 3$ Dynkin matrix $T$ invertible ($\det T = -8/15$). Without this charge, $\Delta_1$ would be rigidly constrained to $\approx 19.93$, incompatible with the target $15.14$.

Obstruction (1) blocks the original Bures-norm-based Definition T.17a. Obstruction (2) blocks the effective-action replacement on bare $\mathrm{Gr}(2,8)$. Obstruction (3) proves that no construction — from the PU axioms or otherwise — can produce the required gauge-sector splitting as subbundles of the bare quotient bundle $Q$. Finding (4) demonstrates that the lifted spectral structure possesses the correct Dynkin index anatomy to accommodate the target threshold tuple, with all charges determined by the embedding rather than by free parameters.

The minimal flag lift $\widetilde X = \mathrm{Flag}_{1,2,3}(Q)$ resolves all three obstructions and supplies the structural prediction (4) simultaneously: on $\widetilde X$, the pulled-back bundle $\pi^*Q$ tautologically splits as $(1,2,3)$, the operator $D^{\mathrm{PCE}}_{\widetilde X}$ is $G_{\mathrm{SM}}$-equivariant but not $U(8)$-equivariant, the spectral threshold shifts $\Delta_i$ are gauge-factor-dependent by construction, and the Dynkin index matrix that governs the decomposition is invertible with all entries determined by the representation theory of the $SU(5)$ embedding. Proposition T.17a.3a identifies the canonical base-to-lift map for the local threshold contribution. Convention T.69a fixes the $\mathrm{MS2}_{\mu_G}$ finite part, Theorem T.69 isolates the global spectral remainder, Corollary T.69.1 supplies finite-block tail certification, and Theorem T.70 gives the sector/parity spectrum. Any completed flag-lift spectral problem then determines a definite threshold triplet and the minimal residual ledger by Theorem T.78. Remark T.17a.4 and Proposition T.17a.5 show that every sector-independent affine local truncation gives $F_Y>0$ and therefore cannot replace the global sector-resolving block functional used for the Appendix T validation comparison.

**Theorem G.8.4f (12-Fold Structural Correspondence).** *The number 12 appears as a structural constant across multiple framework domains:*

| Quantity | Value | Origin |
|:---------|:-----:|:-------|
| Golay signal dimension | $k = 12$ | Predictive-recovery MacWilliams branch on $n = 24$ (Definition Z.13b.0; Theorem Z.13b.0a; Theorem Z.13) |
| Gauge generators | $n_G = 12$ | Capacity bound saturation (Theorem G.8.4b) |
| Grassmannian complex dimension | $\dim_{\mathbb{C}}(\text{Gr}(2,8)) = ab = 12$ | QFI tangent structure (Theorem Z.6.3a) |
| Interface mode pairs | $M/2=12$ | Half-mode count from $M=24$; the code split uses Def Z.13b.0 and Thm Z.13b.0a, not Theorem Z.5 alone |
| Golay parity constraints | $n - k = 12$ | Parity check matrix rows |
| Stabilizer generators (each type) | 12 | CSS construction from self-dual $\mathcal{G}_{24}$ (Remark G.8.4g.1a) |

*These appearances reflect a single structural identity:*
$$
12 = \frac{M}{2} = ab = k = n_G = \dim_{\mathbb{C}}(\text{Gr}(2,8))
$$

*Proof.* From Theorem Z.5, the interface mode count is $M = 2ab = 24$. On the predictive-recovery MacWilliams branch, Definition Z.13b.0 and Theorem Z.13b.0a select the rate-$\frac{1}{2}$ split $k=M/2=12$, and Theorem Z.13 realizes the Golay code $[24,12,8]$ at that split. From Theorem G.8.2e, the Lagrangian capacity bound is $n_G^{max} = k = 12$. The Standard Model gauge algebra saturates this bound: $\dim(\mathfrak{g}_{SM}) = 8 + 3 + 1 = 12$ (Theorem G.8.4b). The complex Grassmannian dimension is $\dim_{\mathbb{C}}(\text{Gr}(a, d_0)) = a(d_0 - a) = 2 \times 6 = 12$ (Theorem Z.6.3a). ∎

**Corollary G.8.4f.1 (Gauge-Code Correspondence).** *The rate-$\frac{1}{2}$ Golay code structure fixes the same 12+12 organizational split that reappears in the gauge sector: the Standard Model algebra saturates the 12-generator capacity bound, while the complementary 12-dimensional half of the rate-$\frac{1}{2}$ partition carries the constrained dynamical content. The correspondence is structural; it does not require a unique identification of “signal” versus “parity” with gauge versus matter.*

**Remark G.8.4f.2 (Root-System Reading of the 12-Generator Step).** By Corollary Z.11.2, the shared value
$$
12 = k = n_G = \dim_{\mathbb{C}}(\text{Gr}(2,8))
$$
is the root count $|\Phi(A_3)|$. Thus the capacity-saturating gauge budget appearing here is the $A_3$ rung of the canonical chain
$$
A_1 \subset A_2 \subset A_3 \subset D_4 \subset E_8.
$$
The Appendix G 12-fold correspondence therefore sits on the same low-rank root scaffold whose $D_4$ step gives the 24-mode spacetime closure in Appendix Z and whose terminal inclusion into $E_8$ matches the internal geometry used in Appendices R and T.

**Definition G.8.4f.3 (Marked Golay-Leech Interface Frame and Canonical Half-Swap).** Fix the systematic Golay generator matrix
$$
G=[I_{12}\mid P]
$$
of Theorem Z.13c, with coordinate set
$$
\Omega=\{1,\ldots,24\}
=\Omega_S\sqcup\Omega_P,
\qquad
\Omega_S=\{1,\ldots,12\},
\qquad
\Omega_P=\{13,\ldots,24\}.
$$
A **marked Golay-Leech interface frame** is the choice of this systematic coordinate frame, the ordered signal/parity split above, and the octad trio
$$
\begin{aligned}
O_1&=\{1,2,4,5,13,14,16,17\},\\
O_2&=\{3,8,10,11,15,20,22,23\},\\
O_3&=\{6,7,9,12,18,19,21,24\}.
\end{aligned}
$$
The three octads partition $\Omega$. Relative to this marked frame define
$$
J_0=(1\,13)(2\,14)\cdots(12\,24).
$$
This is the canonical marked Golay half-swap. It is canonical relative to the marked systematic frame. The unmarked Golay-Leech structure selects the code and the Leech gluing data, but it does not by itself select a unique element of $M_{24}$.

**Proposition G.8.4f.4 (Marked Half-Swap is Golay-Leech Admissible).** The involution $J_0$ lies in
$$
M_{24}=\operatorname{Aut}(\mathcal G_{24}),
$$
preserves the octad trio of Definition G.8.4f.3, and lifts through the Golay gluing construction to the coordinate-frame stabilizer of the Leech lattice. Consequently, after the marked 24-mode interface frame is transported to the lifted real interface bundle $\widetilde E_{\mathbb R}$ of Definition T.17a, $J_0$ defines a self-adjoint orthogonal involution on the lifted gauge sector.

*Proof.* The parity matrix displayed in Theorem Z.13c is symmetric and satisfies
$$
PP^T=I_{12}\pmod 2.
$$
Hence
$$
P=P^T,
\qquad
P^2=I_{12}\pmod 2.
$$
Every codeword of the systematic Golay code has the form
$$
(s,sP),
\qquad
s\in\mathbb F_2^{12}.
$$
The half-swap sends
$$
(s,sP)\longmapsto (sP,s).
$$
Set $t=sP$. Since $P^2=I_{12}$ over $\mathbb F_2$,
$$
tP=sP^2=s,
$$
and therefore
$$
(sP,s)=(t,tP)\in\mathcal G_{24}.
$$
Thus $J_0$ preserves $\mathcal G_{24}$ and lies in $M_{24}$.

For the octad trio, write
$$
\begin{aligned}
s_1&=(1,1,0,1,1,0,0,0,0,0,0,0),\\
s_2&=(0,0,1,0,0,0,0,1,0,1,1,0),\\
s_3&=(0,0,0,0,0,1,1,0,1,0,0,1).
\end{aligned}
$$
Multiplication by the displayed matrix gives
$$
s_iP=s_i,
\qquad
i=1,2,3.
$$
Hence the characteristic vector of $O_i$ is $(s_i,s_i)$, so each $O_i$ is a weight-$8$ Golay codeword. The supports of the three $s_i$ are disjoint and cover $\{1,\ldots,12\}$; therefore $O_1,O_2,O_3$ are disjoint and cover $\Omega$. Since $J_0$ exchanges the two identical halves of each vector $(s_i,s_i)$, it fixes each $O_i$ setwise.

The Golay-Leech construction used in Appendix R and Appendix Z realizes the permutation automorphism group $M_{24}$ as the permutation part of the coordinate-frame stabilizer of the Leech lattice. Therefore the coordinate permutation $J_0\in M_{24}$ lifts to a Leech lattice automorphism. Transporting this marked 24-mode real action to $\widetilde E_{\mathbb R}$ gives a permutation-orthogonal involution. A real orthogonal involution is self-adjoint for the induced Hermitian metric. ∎

**Proposition G.8.4f.5 (Non-Uniqueness Without the Marking).** PCE and PPI force the Golay code and the Golay-Leech backbone on the $M=24$ interface branch, but they do not force a unique nontrivial element
$$
\mathcal J_G\in M_{24}.
$$
Even after requiring rate-$\frac12$ signal/parity exchange and compatibility with an octad-adapted $24=3\times 8$ decomposition, more than one admissible involution remains.

*Proof.* Let
$$
r=(3\,11)(6\,7)(8\,10)(9\,12)
$$
on $\{1,\ldots,12\}$, and let
$$
g=(3\,11)(6\,7)(8\,10)(9\,12)(15\,23)(18\,19)(20\,22)(21\,24)
$$
act by the same permutation $r$ on the signal and parity halves. If $A_r$ is the $12\times12$ permutation matrix of $r$, then the displayed parity matrix of Theorem Z.13c satisfies
$$
A_rPA_r^{-1}=P.
$$
Equivalently, simultaneous application of $r$ to the signal and parity coordinates preserves the systematic code set
$$
\{(s,sP):s\in\mathbb F_2^{12}\}.
$$
Hence $g\in M_{24}$. Also $g^2=1$ and $gJ_0=J_0g$, since $g$ acts by the same involution on both halves. Therefore
$$
J_1:=gJ_0
$$
is an involution in $M_{24}$. Explicitly,
$$
J_1=(1\,13)(2\,14)(3\,23)(4\,16)(5\,17)(6\,19)(7\,18)(8\,22)(9\,24)(10\,20)(11\,15)(12\,21).
$$
Both $J_0$ and $J_1$ exchange $\Omega_S$ with $\Omega_P$. Moreover, the transpositions of $J_1$ lie inside the same octad trio:
$$
\begin{aligned}
O_1&:\ (1\,13),(2\,14),(4\,16),(5\,17),\\
O_2&:\ (3\,23),(8\,22),(10\,20),(11\,15),\\
O_3&:\ (6\,19),(7\,18),(9\,24),(12\,21).
\end{aligned}
$$
Thus $J_1(O_i)=O_i$ for $i=1,2,3$. Since $J_1\ne J_0$, the stated compatibility requirements do not select a unique element of $M_{24}$. A unique working $\mathcal J_G$ is obtained only after the marked half-swap convention of Definition G.8.4f.3 is imposed; otherwise $\mathcal J_G$ remains part of the spectral branch data in Appendix T. ∎

**Theorem G.8.4g (Classical Golay-Gauge Lagrangian Carrier Duality).** In the marked Golay-Leech frame, the classical Golay carrier and the jointly estimable gauge carrier are exact maximal-isotropic realizations of the same 24-mode interface carrier.

Let
$$
V_{\mathbb R}
=
\operatorname{span}_{\mathbb R}\{X_1,\ldots,X_{12},Y_1,\ldots,Y_{12}\}
$$
be the QFI-active interface tangent carrier in the basis of Definition G.8.2a, ordered so that
$$
\omega(X_i,Y_j)=\delta_{ij},
\qquad
\omega(X_i,X_j)=0,
\qquad
\omega(Y_i,Y_j)=0.
$$
Let
$$
\Lambda_{\mathbb Z}
=
\bigoplus_{i=1}^{12}\mathbb Z X_i
\oplus
\bigoplus_{i=1}^{12}\mathbb ZY_i,
\qquad
\overline V:=\Lambda_{\mathbb Z}/2\Lambda_{\mathbb Z}
\cong\mathbb F_2^{12}\oplus\mathbb F_2^{12}.
$$
For column vectors $s,t\in\mathbb F_2^{12}$, the reduced alternating form is
$$
\overline\omega((s,t),(s',t'))
=
s^Tt'+t^Ts'.
$$
In the marked systematic Golay frame of Theorem Z.13c,
$$
\mathcal G_{24}=\{(s,Ps):s\in\mathbb F_2^{12}\},
$$
where the displayed matrix satisfies
$$
P=P^T,
\qquad
PP^T=I_{12}\pmod2.
$$
Then:

1. $\mathcal G_{24}$ is a Lagrangian subspace of $(\overline V,\overline\omega)$.

2. The real gauge-capacity carrier
$$
L_X:=\operatorname{span}_{\mathbb R}\{X_1,\ldots,X_{12}\}
$$
is a Lagrangian subspace of $(V_{\mathbb R},\omega)$.

3. The binary shear
$$
R_P(x,y)=(x,y+Px)
$$
is symplectic and maps the reduced gauge-capacity Lagrangian onto the Golay Lagrangian:
$$
R_P(\overline L_X)=\mathcal G_{24},
\qquad
\overline L_X=\mathbb F_2^{12}\oplus0.
$$

Consequently, after fixing the marked Golay-Leech frame, the Golay $12+12$ split and the gauge $12$-generator capacity budget are not merely numerically analogous. They are two maximal-isotropic presentations of the same 24-mode carrier. This is a carrier-level duality: the Lie bracket of $\mathfrak g_{\mathrm{SM}}$ is not binary code addition, and individual gauge transformations are not individual Golay codewords.

*Proof.* For two Golay vectors $(s,Ps)$ and $(s',Ps')$,
$$
\overline\omega((s,Ps),(s',Ps'))
=
s^TPs'+(Ps)^Ts'.
$$
Using $P=P^T$, this becomes
$$
s^TPs'+s^TP^Ts'
=
s^TPs'+s^TPs'
=
0
\pmod2.
$$
Thus $\mathcal G_{24}$ is isotropic. Since
$$
\dim_{\mathbb F_2}\mathcal G_{24}=12
=
\frac12\dim_{\mathbb F_2}\overline V,
$$
it is Lagrangian.

For the real carrier, $L_X$ is isotropic because $\omega(X_i,X_j)=0$ for all $i,j$. Since
$$
\dim_{\mathbb R}L_X=12
=
\frac12\dim_{\mathbb R}V_{\mathbb R},
$$
$L_X$ is Lagrangian. This is the geometric form of the jointly estimable generator bound of Theorem G.8.2e.

It remains to prove that $R_P$ is symplectic. For $u=(x,y)$ and $v=(x',y')$,
$$
\overline\omega(R_Pu,R_Pv)
=
\overline\omega((x,y+Px),(x',y'+Px')).
$$
Expanding gives
$$
x^T(y'+Px')+(y+Px)^Tx'
=
x^Ty'+y^Tx'+x^TPx'+x^TP^Tx'.
$$
Since $P=P^T$, the last two terms are equal and cancel in characteristic two. Therefore
$$
\overline\omega(R_Pu,R_Pv)=\overline\omega(u,v),
$$
so $R_P$ is symplectic. Finally,
$$
R_P(s,0)=(s,Ps),
$$
so
$$
R_P(\overline L_X)=\mathcal G_{24}.
$$
The Standard Model algebra selected by Theorem G.8.4b has dimension $12$ and saturates this carrier dimension, while the Golay code is the unique balanced $[24,12,8]$ code on the same marked 24-mode carrier. ∎

**Remark G.8.4g.1: Clarification on CSS Quantum Codes.** A CSS quantum code constructed from the self-dual Golay code using $C_1 = C_2 = \mathcal{G}_{24}$ has parameters $[[24, 0, 8]]$ with zero logical qubits, since $k_{\text{quantum}} = k_1 + k_2 - n = 12 + 12 - 24 = 0$ for self-dual codes [Calderbank & Shor 1996; Steane 1996]. The quantum Singleton bound $n - k \geq 2(d-1)$ requires $k \leq 10$ for $[[24, k, 8]]$, confirming that $[[24, 12, 8]]$ is impossible. The duality in Theorem G.8.4g concerns the classical binary Lagrangian carrier and the real jointly estimable gauge carrier, not CSS quantum-code logical parameters. The structural correspondence is between the classical rate-$\frac{1}{2}$ Lagrangian partition and the 12-dimensional gauge-capacity carrier.

**Remark G.8.4g.1a: Vacuum Stabilizer Interpretation.** The $[[24, 0, 8]]$ CSS construction yields a unique stabilizer state $|\Omega_{\text{Golay}}\rangle$, the uniform superposition over all 4096 Golay codewords:
$$|\Omega_{\text{Golay}}\rangle = \frac{1}{64} \sum_{c \in \mathcal{G}_{24}} |c\rangle$$
This state is stabilized by 24 independent generators: 12 X-type generators $S_i^X = X^{g_i}$ (where $g_i$ is the $i$-th row of a generator matrix) and 12 Z-type generators $S_j^Z = Z^{h_j}$ (where $h_j$ is the $j$-th row of a parity-check matrix). The "12 + 12" structure thus manifests as stabilizer generators rather than signal versus parity qubits. The Golay minimum distance 8 implies that the smallest-weight non-identity stabilizer elements have weight 8; equivalently, any Pauli error of weight less than 8 produces a nontrivial syndrome under stabilizer measurement. The state is invariant under the Mathieu group $M_{24} = \text{Aut}(\mathcal{G}_{24})$, with $|M_{24}| = 244,823,040$.

On the residual-syndrome branch of Appendix Z, this stabilizer/vacuum interpretation becomes experimentally diagnostic rather than merely structural. Ordinary hardware noise may still generate low-weight errors, but after those device-local channels are modeled and separated, the exact substrate component has no native nonzero shell below weight 8 and its leading correlated shell is the 759-octad shell. Thus the test is not whether all physical errors have high weight; it is whether the irreducible residual correlated component, in a marked 24-mode interface frame, carries the $M_{24}$-symmetric Golay shell fingerprint.

**Remark G.8.4g.2: Functional and Carrier-Level Readings.** Within PU, gauge redundancy can be interpreted as the operational redundancy of an error-correcting vacuum organization. Gauge transformations identify descriptions with the same physical content, just as parity constraints identify codewords belonging to the protected code structure. The carrier-level statement is exact by Theorem G.8.4g: both sides are Lagrangian structures on the same 24-mode interface after the marked frame is fixed. The functional statement is more limited: the Lie bracket of $\mathfrak g_{\mathrm{SM}}$ is not binary code addition, and individual gauge transformations are not individual Golay codewords.

### G.8.4h Predictive Interface Tensor Category and Global-Symmetry Exclusion

**Definition G.8.4h.1 (Predictive Interface Tensor Category).** Let the PCE-selected inactive-sector decomposition of Theorem G.8.4b be written
$$
\mathcal B=C\oplus W\oplus Y,
\qquad
\dim C=3,\quad \dim W=2,\quad \dim Y=1.
$$
The predictive interface tensor category $\mathsf C_{\mathrm{int}}$ is the rigid tensor category generated by $C$, $W$, their duals, finite direct sums, subquotients, and tensor products, with the following PPI contracts imposed:

1. Hermitian inner products on $C$ and $W$ are preserved.
2. The one-dimensional sector $Y$ is not an independent phase generator; it is the determinant marker fixing the unimodular interface relation.
3. The determinant line
$$
\Lambda^3C\otimes\Lambda^2W
$$
is preserved as a physically fixed PPI normalization line.

Let
$$
F_{\mathrm{int}}:\mathsf C_{\mathrm{int}}\to\mathrm{Hilb}_{\mathrm{fd}}
$$
be the forgetful fiber functor.

**Theorem G.8.4h.2 (Tannakian Reconstruction of the Standard Model Gauge Group on the Selected Interface Branch).** The unitary tensor automorphism group of $F_{\mathrm{int}}$ is
$$
\operatorname{Aut}^{\otimes}_{u}(F_{\mathrm{int}})
\cong
S(U(3)\times U(2))
=
\{(g_C,g_W)\in U(3)\times U(2):\det g_C\det g_W=1\}.
\tag{G.8.4h}
$$
Its Lie algebra is
$$
\mathfrak{aut}^{\otimes}_{u}(F_{\mathrm{int}})
\cong
\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
$$
with dimension $8+3+1=12$.

*Proof.* A tensor natural automorphism of the forgetful functor is determined by its action on the tensor generators $C$ and $W$, because every object of $\mathsf C_{\mathrm{int}}$ is obtained from these by tensor operations, duals, direct sums, and subquotients. Preservation of the Hermitian contracts gives
$$
g_C\in U(C)\cong U(3),
\qquad
g_W\in U(W)\cong U(2).
$$
Naturality on duals forces the dual actions to be $g_C^{-T}$ and $g_W^{-T}$. Naturality on tensor products forces the action on any tensor word to be the corresponding tensor product of $g_C$, $g_W$, and their dual actions. The determinant PPI contract requires the action on $\Lambda^3C\otimes\Lambda^2W$ to be the identity, hence
$$
\det g_C\det g_W=1.
$$
Therefore the automorphism group is precisely $S(U(3)\times U(2))$.

For the Lie algebra, write
$$
\mathfrak u(3)\oplus\mathfrak u(2)
=
\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus i\mathbb R\oplus i\mathbb R.
$$
The infinitesimal determinant condition is
$$
\operatorname{tr}X_C+\operatorname{tr}X_W=0,
$$
which removes one central real direction and leaves one central real direction. Thus
$$
\mathfrak{aut}^{\otimes}_{u}(F_{\mathrm{int}})
=
\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
$$
and its dimension is
$$
(3^2-1)+(2^2-1)+1=8+3+1=12.
$$
This equals the Lagrangian gauge-capacity bound of Theorem G.8.2e and the gauge algebra selected in Corollary G.8.4c. ∎

**Corollary G.8.4h.3 (No Exact Operational Global Symmetry).** Let $\eta$ be an exact symmetry label on the selected interface branch. If $\eta$ has no nontrivial action on any object of $\mathsf C_{\mathrm{int}}$ and no nontrivial action on any admissible local interface channel, then $\eta$ is operationally trivial and is quotiented out by PCE. If $\eta$ acts nontrivially on an admissible local interface channel, then it is represented by a tensor automorphism of $F_{\mathrm{int}}$ and hence lies in the reconstructed gauge group or in a finite stabilizer already present in the marked Golay-Leech data.

*Proof.* Because $F_{\mathrm{int}}$ is faithful, two tensor natural transformations that agree on all objects and all morphisms of $\mathsf C_{\mathrm{int}}$ are equal. If $\eta$ acts trivially on every object and every admissible local interface channel, then it produces identical operational probabilities for every MPU-accessible protocol. By Definition X.9.1 such descriptions are MPU-equivalent, and by Proposition X.9.3 they are PCE-degenerate; the surplus label has positive description cost and zero predictive benefit, so PCE removes it. If $\eta$ acts nontrivially on a local interface channel, faithfulness represents that action as a nontrivial tensor automorphism of the functor, so by Theorem G.8.4h.2 it belongs to $S(U(3)\times U(2))$ on the connected gauge branch. If the action is discrete and preserves the marked Golay-Leech carrier rather than the connected interface functor, it is a stabilizer of the marked finite code/lattice data and is not an exact continuous global symmetry. ∎

### G.8.4i Predictive Defect Fusion Category

**Definition G.8.4i.1 (PCE-Admissible Predictive Defect).** Let $\mathsf R_{\mathrm{PU}}$ be the finite PPI quotient category whose objects are admissible local interface protocol sectors and whose morphisms are response-preserving finite CPTP interface maps, with two morphisms identified when they induce the same natural transformation of the protocol-response presheaf. A predictive defect is an exact finite endofunctor
$$
D:\mathsf R_{\mathrm{PU}}\to\mathsf R_{\mathrm{PU}}
$$
equipped with coherent tensor-composition maps for stacked protocols and preserving PCE-zero equivalence classes.

A finite set of predictive defects is PCE-admissible when it is closed under stacking, finite direct sums, dual defects, subobjects, and idempotent splitting after PPI quotient. The resulting idempotent-complete finite semisimple $C^*$-tensor category is denoted
$$
\mathsf{Def}_{\mathrm{PU}}.
$$
Its tensor product is physical stacking of interfaces. Its tensor unit is the transparent interface. Its invertible objects form
$$
\operatorname{Pic}(\mathsf{Def}_{\mathrm{PU}}).
$$

A defect is response-null when its action on every object of $\mathsf R_{\mathrm{PU}}$ induces the identity natural transformation of the protocol-response presheaf.

**Theorem G.8.4i.2 (Fusion-Category Completion and Operational Symmetry Boundary).** On the selected finite interface branch:

1. $\mathsf{Def}_{\mathrm{PU}}$ is a unitary fusion category.

2. The ordinary exact operational symmetries are precisely the invertible defect classes that act nontrivially on local interface responses. Their connected unitary fiber action is the group reconstructed in Theorem G.8.4h.2:
$$
S(U(3)\times U(2)).
\tag{G.8.4i.1}
$$
Any additional invertible discrete action must preserve the marked Golay-Leech carrier and is a finite stabilizer datum, not an independent continuous global symmetry.

3. A non-invertible defect is physically retained only when it induces a non-identity natural transformation of the protocol-response presheaf. Response-null defects are PCE-degenerate and are identified with the transparent interface.

4. Let $\omega_{\mathsf{Def}}$ be the Cech cocycle formed by the local associator and module-action mismatches of the defect action on a finite protocol cover. Then
$$
[\omega_{\mathsf{Def}}]=0
\tag{G.8.4i.2}
$$
if and only if the protocol-response presheaf is a module category over $\mathsf{Def}_{\mathrm{PU}}$ after PPI descent. A nonzero class is exactly a finite predictive obstruction in the sense of Theorem X.9.5b.

*Proof.* By Definition G.8.4i.1, $\mathsf{Def}_{\mathrm{PU}}$ is finite semisimple, idempotent-complete, $C^*$-linear, rigid, and monoidal, with simple transparent tensor unit after quotienting response-null refinements. This is precisely the finite unitary fusion-category condition, proving item 1.

Let $D\in\operatorname{Pic}(\mathsf{Def}_{\mathrm{PU}})$. Then there exists $D^{-1}$ with
$$
D\otimes D^{-1}\cong 1\cong D^{-1}\otimes D.
$$
Thus $D$ acts by a tensor autoequivalence on the finite interface response category. Restricting to the connected interface tensor category $\mathsf C_{\mathrm{int}}$ and to the forgetful fiber functor $F_{\mathrm{int}}$, the nontrivial unitary fiber part is a tensor natural automorphism of $F_{\mathrm{int}}$. Theorem G.8.4h.2 identifies this connected group with $S(U(3)\times U(2))$. If the invertible action does not lie in that connected fiber group but preserves the marked finite Golay-Leech carrier, Corollary G.8.4h.3 classifies it as a finite stabilizer datum rather than an exact continuous global symmetry. This proves item 2.

If a defect is response-null, then every admissible local protocol has the same outcome law before and after inserting the defect. The operational Yoneda reconstruction theorem identifies physical structure by the natural family of all protocol responses; therefore a response-null defect is PPI-identical to the transparent interface. Since retaining it adds interface description cost with zero predictive benefit, PCE removes it. Conversely, if the induced natural transformation is not the identity, at least one protocol response differs, so the defect is not operationally null. This proves item 3.

For item 4, choose local defect actions on a finite protocol cover. On double and triple overlaps the comparison maps are central unitaries in the finite response category. The pentagon identity for the associator implies that the product of these overlap mismatches on every quadruple overlap is trivial, so the mismatches form a Cech cocycle $\omega_{\mathsf{Def}}$. If this cocycle is a coboundary, local rephasings of the defect action remove the mismatch and produce a globally coherent module-category action. If a global module-category action exists, its local restrictions have associators satisfying the pentagon exactly, so the mismatch cocycle is a coboundary. Thus (G.8.4i.2) is equivalent to module descent. Theorem X.9.5b identifies precisely such finite-cover gluing failures with the PU predictive obstruction class, so a nonzero $[\omega_{\mathsf{Def}}]$ is the defect-fusion representative of that obstruction. ∎

### G.8.5 The Standard Model, Hypercharge, and Three Generations as a Unified PCE Optimum

The PU framework provides a robust, multi-layered argument for the co-selection of $D=4$ spacetime and the Standard Model gauge group with its specific fermion content and three-generation structure. This selection is a derived consequence of minimizing the global PCE potential under the standing principles of compression efficiency and predictive invariance.

1.  **Primacy of $D=4$ for Structural Stability and Information Efficiency:**
    As argued in Sections G.8.2.4 and G.8.2.5, $D=4$ is strongly and uniquely favored by the Appendix G stability analysis. The mode count $M = 2ab = 24$ equals both the real dimension of the attractor orbit $\dim_{\mathbb{R}}(\text{Gr}(2,8)) = 24$ and the kissing number $K(4) = 24$ in four dimensions, establishing a geometric bridge between internal Hilbert space structure and emergent spacetime dimensionality. This stability-based selection is independently reinforced by the mode-channel correspondence derived in Appendix Z (Theorems Z.10–Z.11): the $M=24$ interface modes of the PCE-Attractor match the kissing number $K(D)$, and $K(D)=24$ has the unique solution $D=4$.

2.  **Selection of $G_{SM}$, Hypercharge, and Three Generations within D=4:**
    Within the stable D=4 arena, PCE selects the optimal gauge group and matter content subject to capacity and consistency constraints.
    *   **Gauge group $G_{SM}$.** By the finite syndrome normal form and exhaustive partition analysis (Lemma G.8.4a.1, Theorem G.8.4b, Corollary G.8.4c), the decomposition $\mathcal{B}=\mathbb{C}^3\oplus\mathbb{C}^2\oplus\mathbb{C}^1$ is uniquely selected in the positive-marginal capacity-saturating block-frame branch. The non-abelian part contributes $\mathfrak{su}(3)\oplus\mathfrak{su}(2)$ with dimension $8+3=11$. The PU Lagrangian capacity bound on jointly estimable generators (Theorem G.8.2e; Eq. G.8.0) leaves exactly one retained abelian response direction, since $12-11=1$. Thus the retained gauge algebra is $\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak{u}(1)$ (Proposition G.M1; Corollary G.8.4c). Simple unification groups are excluded by the same capacity bounds (Theorem G.8.4a, Corollary G.8.4c.1). The total generator count $n_G=12$ saturates the Lagrangian capacity bound (Theorem G.8.2e), lies within the channel capacity range (Equation G.8.0), and equals the Golay code dimension $k=12$ only after the predictive-recovery self-dual-rate gate (Theorem Z.13). The tree-level Weinberg angle $\sin^2\theta_W^{(0)}=3/8$ emerges from PCE isotropy at the PU fixed point without requiring grand unified gauge symmetry; the value $3/8$ coincides with the standard tree-level $SU(5)$ unification prediction [de Boer 1994] (Appendix T, Theorem T.14).
    *   **Minimal chiral anomaly package and hypercharge uniqueness.** Gauge redundancy is a finite-response quotient; therefore a quantum anomaly in the declared gauge redundancy is not admissible, because it would make two gauge-identified histories assign different finite response phases.

       **Theorem G.8.5a (Minimal One-Family Chiral Anomaly Package).** In the $D=4$ chiral-continuum branch with gauge algebra
       $$
       \mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
       $$
       suppose the matter sector is minimal, gauge-active, chiral, non-vectorlike unless forced by anomaly cancellation, built from the fundamental nontrivial representations $3,\bar3,2$, and stripped of gauge-null sterile singlets. If the sector contains one minimal cross-interface seed
       $$
       Q=(3,2)_{y_q},
       $$
       then anomaly cancellation forces the one-family representation package
       $$
       R_1=(3,2)_{y_q}
       \oplus(\bar3,1)_{y_{u^c}}
       \oplus(\bar3,1)_{y_{d^c}}
       \oplus(1,2)_{y_\ell}
       \oplus(1,1)_{y_{e^c}},
       $$
       with charge ratios
       $$
       y_q:y_{u^c}:y_{d^c}:y_\ell:y_{e^c}
       =
       1:-4:2:-3:6.
       $$
       With minimal-denominator normalization $y_q=1/6$, this gives
       $$
       (3,2)_{1/6}
       \oplus(\bar3,1)_{-2/3}
       \oplus(\bar3,1)_{1/3}
       \oplus(1,2)_{-1/2}
       \oplus(1,1)_1.
       $$

       *Proof.* The seed $Q=(3,2)_{y_q}$ contains two $SU(3)$ triplets, so its $[SU(3)]^3$ anomaly contribution is $+2$ in fundamental units. The minimal non-mirror cancellation is supplied by two weak-singlet anti-triplets
       $$
       u^c=(\bar3,1)_{y_{u^c}},
       \qquad
       d^c=(\bar3,1)_{y_{d^c}},
       $$
       whose color anomaly contributions are $-1$ and $-1$. Hence the cubic color anomaly cancels:
       $$
       2-1-1=0.
       $$

       The seed $Q$ contains three weak doublets, one for each color. The global $SU(2)$ anomaly requires an even number of left-handed weak doublets, so the minimal additional doublet is colorless:
       $$
       L=(1,2)_{y_\ell}.
       $$
       The weak-doublet count is then
       $$
       3+1=4,
       $$
       which is even.

       The mixed anomalies now impose
       $$
       [SU(3)]^2U(1):\qquad
       2y_q+y_{u^c}+y_{d^c}=0,
       $$
       $$
       [SU(2)]^2U(1):\qquad
       3y_q+y_\ell=0.
       $$
       Thus
       $$
       y_{u^c}+y_{d^c}=-2y_q,
       \qquad
       y_\ell=-3y_q.
       $$
       Without an abelian charged singlet, the mixed gravitational anomaly equals
       $$
       6y_q+3y_{u^c}+3y_{d^c}+2y_\ell
       =
       6y_q+3(-2y_q)+2(-3y_q)
       =
       -6y_q.
       $$
       For a nontrivial retained $U(1)$, $y_q\ne0$, so the anomaly is nonzero. The minimal cancellation is one gauge singlet
       $$
       e^c=(1,1)_{y_{e^c}},
       $$
       and the gravitational anomaly condition gives
       $$
       6y_q+3y_{u^c}+3y_{d^c}+2y_\ell+y_{e^c}=0,
       $$
       hence
       $$
       y_{e^c}=6y_q.
       $$

       It remains to impose the cubic abelian anomaly:
       $$
       6y_q^3+3y_{u^c}^3+3y_{d^c}^3+2y_\ell^3+y_{e^c}^3=0.
       $$
       Let
       $$
       s=y_{u^c}+y_{d^c}=-2y_q,
       \qquad
       p=y_{u^c}y_{d^c}.
       $$
       Since
       $$
       y_{u^c}^3+y_{d^c}^3=s^3-3ps,
       $$
       the cubic anomaly becomes
       $$
       6y_q^3+3((-2y_q)^3-3p(-2y_q))+2(-3y_q)^3+(6y_q)^3=0.
       $$
       Therefore
       $$
       6y_q^3-24y_q^3+18py_q-54y_q^3+216y_q^3=0,
       $$
       so
       $$
       144y_q^3+18py_q=0.
       $$
       Because $y_q\ne0$,
       $$
       p=-8y_q^2.
       $$
       Hence $y_{u^c}$ and $y_{d^c}$ are the roots of
       $$
       t^2-st+p=0,
       $$
       namely
       $$
       t^2+2y_qt-8y_q^2=0.
       $$
       Thus
       $$
       \{y_{u^c},y_{d^c}\}=\{-4y_q,2y_q\}.
       $$
       Relabeling the two anti-triplet singlets gives
       $$
       y_{u^c}=-4y_q,
       \qquad
       y_{d^c}=2y_q,
       \qquad
       y_\ell=-3y_q,
       \qquad
       y_{e^c}=6y_q.
       $$
       The charge ratio is therefore $1:-4:2:-3:6$. Setting $y_q=1/6$ gives the displayed Standard Model one-family normalization. Higher representations, vectorlike mirror pairs, or sterile gauge-null singlets add representation cost or response-null content and are not part of the minimal package. ∎

    *   **Hypercharge Uniqueness with one Higgs doublet.** Let the left‑chiral hypercharges be $y_q,y_{u^c},y_{d^c},y_\ell,y_{e^c}$. Imposing cancellation of all local and mixed gauge and gravitational anomalies in $D=4$ yields the constraints:
        $$
        \begin{alignedat}{2}
        &[SU(3)]^2 U(1): &\quad &2y_q+y_{u^c}+y_{d^c}=0,\\
        &[SU(2)]^2 U(1): &\quad &N_c y_q+y_\ell=0,\\
        &[\text{grav}]^2 U(1): &\quad &2N_c y_q+N_c y_{u^c}+N_c y_{d^c}+2y_\ell+y_{e^c}=0,\\
        &[U(1)]^3: &\quad &N_c(2y_q^3+y_{u^c}^3+y_{d^c}^3)+2y_\ell^3+y_{e^c}^3=0.
        \end{alignedat}
        $$
        Treating $N_c$ as a variable, the anomaly constraints admit the family $y_\ell = -N_c y_q,\; y_{e^c}=2N_c y_q,\; y_{d^c}=(N_c-1)y_q,\; y_{u^c}=-(N_c+1)y_q$. Witten’s global $SU(2)$ anomaly enforces $N_c+1$ even $\Rightarrow N_c$ odd. SM gauge group dimension is $n_G=(N_c^2-1)+(2^2-1)+1=N_c^2+3$. PU capacity bound $n_G\le n_{\max}$ (Equation G.8.0) with central estimate $n_{\max}\approx 12$ implies $N_c^2+3\le 12$, hence $N_c\le 3$. Taking $N_c=3$ yields, up to overall normalization and overall sign (absorbed into the $U(1)$ generator and coupling), the unique Standard Model hypercharge assignments:
        $$
        y_q=\tfrac{1}{6},\quad y_{u^c}=-\tfrac{2}{3},\quad y_{d^c}=\tfrac{1}{3},\quad y_\ell=-\tfrac{1}{2},\quad y_{e^c}=1.
        $$
        This solution is also consistent with the global $SU(2)$ anomaly (4 doublets/family). Furthermore, requiring gauge invariance of the renormalizable Yukawa interactions with a single Higgs doublet $H$,
        $$
         y_q+y_H+y_{u^c}=0,\qquad y_q-y_H+y_{d^c}=0,\qquad y_\ell-y_H+y_{e^c}=0,
          $$

       **Theorem G.8.1a (Hypercharges fixed up to overall scale).** With one Higgs doublet $H$, impose Yukawa gauge invariance
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

       **Theorem G.8.1b (Determinant-Line Descent Form of Hypercharge).** On the finite chiral branch with gauge algebra
       $$
       \mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
       $$
       one Higgs doublet $H=(1,2)_{y_H}$, and one left-chiral response module of the Standard Model representation shape
       $$
       R_1=(3,2)_{y_q}
       \oplus(\bar 3,1)_{y_{u^c}}
       \oplus(\bar 3,1)_{y_{d^c}}
       \oplus(1,2)_{y_\ell}
       \oplus(1,1)_{y_{e^c}},
       \tag{G.8.1b.1}
       $$
       the following are equivalent:

       1. the chiral determinant line $\det D_{R_1}$ descends to the operational gauge quotient with zero local curvature anomaly, and the retained Yukawa maps
       $$
       qHu^c,\qquad qH^\dagger d^c,\qquad \ell H^\dagger e^c
       \tag{G.8.1b.2}
       $$
       are gauge-invariant;

       2. the hypercharges satisfy
       $$
       y_H=3a,\quad y_q=a,\quad y_{u^c}=-4a,\quad y_{d^c}=2a,\quad y_\ell=-3a,\quad y_{e^c}=6a
       \tag{G.8.1b.3}
       $$
       for a single rational scale $a$.

       With the canonical minimal-denominator normalization of Corollary G.8.2,
       $$
       a=\frac16,
       \qquad
       (y_q,y_H,y_{u^c},y_{d^c},y_\ell,y_{e^c})
       =
       \left(\frac16,\frac12,-\frac{2}{3},\frac13,-\frac12,1\right).
       \tag{G.8.1b.4}
       $$
       The global $SU(2)$ determinant holonomy is also trivial on this branch, since the number of left-handed $SU(2)$ doublets per family is $N_c+1=4$. A single sterile singlet may be appended only as $(1,1)_0$ on this branch: a nonzero abelian charge would either add uncancelled abelian determinant-line terms or require an additional response channel and compensating content not included in (G.8.1b.1).

       *Proof.* For the representation (G.8.1b.1), descent of the chiral determinant line through the gauge quotient requires vanishing of the local anomaly polynomial for every gauged redundancy. The mixed and linear anomaly components are exactly
       $$
       2y_q+y_{u^c}+y_{d^c}=0,
       \tag{G.8.1b.5}
       $$
       $$
       3y_q+y_\ell=0,
       \tag{G.8.1b.6}
       $$
       $$
       6y_q+3y_{u^c}+3y_{d^c}+2y_\ell+y_{e^c}=0.
       \tag{G.8.1b.7}
       $$
       Gauge invariance of (G.8.1b.2) gives
       $$
       y_q+y_H+y_{u^c}=0,\qquad
       y_q-y_H+y_{d^c}=0,\qquad
       y_\ell-y_H+y_{e^c}=0.
       \tag{G.8.1b.8}
       $$
       Solving (G.8.1b.8) gives
       $$
       y_{u^c}=-y_q-y_H,\qquad
       y_{d^c}=-y_q+y_H,\qquad
       y_{e^c}=-y_\ell+y_H.
       \tag{G.8.1b.9}
       $$
       Equation (G.8.1b.6) gives $y_\ell=-3y_q$. Substituting this and (G.8.1b.9) into (G.8.1b.7) gives
       $$
       6y_q+3(-y_q-y_H)+3(-y_q+y_H)+2(-3y_q)+(3y_q+y_H)=0,
       $$
       hence
       $$
       -3y_q+y_H=0,
       \qquad
       y_H=3y_q.
       \tag{G.8.1b.10}
       $$
       Setting $a:=y_q$ gives (G.8.1b.3). Equation (G.8.1b.5) is then automatically satisfied:
       $$
       2a-4a+2a=0.
       $$
       The cubic anomaly also vanishes (with the quark doublet contributing $3\cdot 2=6$ chiral states):
       $$
       6a^3+3(-4a)^3+3(2a)^3+2(-3a)^3+(6a)^3
       =
       (6-192+24-54+216)a^3=0.
       $$
       Therefore the local determinant-line curvature anomaly vanishes exactly for (G.8.1b.3). Conversely, any solution of the determinant descent plus Yukawa invariance equations must pass through the same linear system, hence is of the form (G.8.1b.3).

       Witten's global $SU(2)$ anomaly is the residual $\mathbb Z_2$ determinant holonomy. The number of left-handed $SU(2)$ doublets in one family is three color copies of $q$ plus one $\ell$, namely $4$, so the mod-two holonomy is trivial. Finally, a single non-abelian singlet with nonzero hypercharge contributes to the abelian gravitational and cubic anomaly equations while changing no required Yukawa map. With no additional compensating content or response channel in the branch, determinant descent forces the singlet charge to zero; if a separate channel is supplied, it is a different branch. ∎
       
       Quantitative constraints on electroweak coupling ratios at the PCE-attractor—including a branch-specific prediction for $\sin^2\theta_W(\mu^*)$ under the cap-active alignment (Assumption W.3.A)—are derived in Appendix W (Theorem W.11; Eqs. W.3.1–W.3.3).

    *   **PCE Corollary – Singlet Neutrality.** Assigning non‑zero hypercharge to a pure non‑abelian singlet increases PCE cost without predictive gain; the minimum sets the hypercharge of any potential sterile right-handed neutrino to zero.
    *   **Three Generations (Unique Minimizer).** Appendix R shows that, in the modeled family-charge sector, the smallest nontrivial anomaly-consistent family structure compatible with CP violation is $N=3$ with offsets $\{a,-a,0\}$ (Theorem R.3.4), and Proposition R.3.5.1a realizes this count exactly on the pre-flavor family-redundancy PPI branch. Proposition R.4.2 adds that the $D_4$ triality orbit, $E_8$/Leech scaffold, and $M=24=8\times 3$ structure are compatible with this count, but they do not provide an independent derivation.

3.  **Confluence and Co-selection:**
    D=4 provides the stable arena; within it, the SM gauge group with its uniquely determined chiral fermion content is PCE-efficient, and the minimal anomaly-consistent family replication compatible with CP violation is $N=3$. The capacity bound $n_G \leq 12$ excludes simple unification groups (Corollary G.8.4c.1), predicting proton stability against gauge-mediated decay (Corollary G.8.4c.2).
    
### G.8.6 Emergent Couplings and Masses

The specific numerical values of gauge couplings ($g_s,g_2,g_Y$) and fermion Yukawas are determined by the location and depth of the PCE minimum. Computing these from first principles requires evaluating the D-dependent coefficients in the PCE potential (Equation G.8.5) from MPU microdynamics. The ratios between these couplings are further constrained by the PCE optimization, a topic explored in Appendix W, and a concrete, attractor-matched estimate for the fine-structure constant is provided in Appendix Z (with order‑unity matching fixed at the PCE capacity point).


## G.9 Rate-Level PCE Potential and the Pathway to $\alpha_{\mathrm{em}}$

This section develops the general formalism for deriving gauge couplings from a rate-level PCE potential, which balances the **power cost** of maintaining gauge coherence against the **predictive information rate** benefit it provides. In the effective-action formulation this balance is an instance of Constraint-Coupling Duality (Theorem X.8c): the coefficient of an active coherence or capacity constraint is a PCE shadow price, while the displayed coupling is its canonical stiffness or inverse-stiffness image. This general framework is further constrained by the alphabet identities derived in Appendix W. The complete derivation of the fine-structure constant at the Thomson limit is presented in Appendix Z: no continuous fit parameter enters the final formula, and the value $\alpha^{-1} \approx 137.036$ follows from the symmetric-space curvature and minimal holonomy of the attractor Grassmannian (Theorems Z.24–Z.26; Lemmas Z.12, Z.14) at the PCE-Attractor (Definition 15a).

The rate-level PCE potential for a $U(1)$ gauge coupling $u=g_e^2$ is given by:
$$
\phi(u) = P_{\mathrm{cost}}(u) - \Gamma_0 V_{\mathrm{benefit}}(u)
$$
where $P_{\mathrm{cost}}(u) \approx A_{\mathrm{PCE}} u^{\gamma_{\mathrm{eff}}}$ is the power cost of maintaining coherence and $V_{\mathrm{benefit}}(u) = \sum_i \ln(1+\lambda_i u)$ is the per-event predictive information gain, derived from the Local Asymptotic Normality (LAN) of the MPU's predictive channel. The system seeks the value $u^*$ that minimizes this potential, subject to the alphabet capacity constraint $V_{\mathrm{benefit}}(u) \le \ln d_0$.

As rigorously established in Appendix X, this rate-level potential and its minimization are equivalent to finding the stationary point of the full QFT effective potential. The physical coupling is then $\alpha_{\mathrm{em}}(\mu^*) = u^*/(4\pi\kappa)$, where the normalization $\kappa$ is determined by the emergent field theory (Appendix X.3). The inputs to this calculation—specifically the QFI spectrum $\{\lambda_i\}$—are operational functionals of the baseline PCE-optimal MPU cycle. Appendix Z demonstrates that at the PCE-Attractor these spectral inputs are uniquely determined by the framework's foundational constants, leading to a complete calculation of $\alpha_{\mathrm{em}}$ from the Appendix Z derivation chain.


## G.1.9 Unified Origin of Probability Measures from ND-RID Equilibration

The Born rule derivation (Sections G.1.1–G.1.4) established that PCE-enforced non-contextuality, combined with additivity over orthogonal projectors, uniquely determines quantum probability via Gleason's theorem. This section demonstrates that the same ND-RID dynamics, operating under PCE optimization, provide a unified mechanism for the emergence of probability measures across quantum, thermal, and gravitational contexts. The unification arises not from formal analogy but from the common dynamical process of equilibration to Gibbs fixed points, with the constraint geometry determining the specific modular Hamiltonian.

This probability unification is the dynamical complement to the entropy unification established in Appendix P (Thesis P.6.1, Section P.6.5). Where Section P.6.5 establishes that all entropies—SPAP, Shannon, thermodynamic, von Neumann, and Bekenstein-Hawking—are manifestations of a single foundational structure, this section establishes that all probability measures arise from a single dynamical mechanism. The two unifications are related through the Gibbs structure: entropy characterizes the equilibrium state, while probability describes how systems reach that state.

### G.1.9.1 The Derivation Chain from SPAP to the Reference State

The logical foundation for probability measures in the PU framework traces through a rigorous derivation chain:

$$
\text{SPAP} \xrightarrow{\text{Thm 31}} \varepsilon_0=\ln2 \xrightarrow{\text{Thm Z.1}} a = 2 \xrightarrow{\text{Def 15a}} \tau^* = \frac{I_a}{a} \oplus 0_b
$$

**Stage 1: Irreducible Entropy Cost.** The Self-Referential Paradox of Accurate Prediction (Theorems 10–11) requires a logically irreversible 2-to-1 state merge in each predictive cycle (Lemma Z.2). By Landauer's principle [Landauer 1961], this merge has an irreducible thermodynamic cost (Theorem 31, Appendix J):

$$
\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2 \text{ nats}
\tag{G.1.9.1}
$$

The structural floor $\varepsilon_0=\ln2$ is exact. The physical bound $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0$ is saturated only on the overhead-free quasi-static implementation branch [Bennett 1982]. This cost split is fixed by Theorem 31, while the PCE-Attractor uses the structural value $\varepsilon_0=\ln2$ for the discrete backbone (Definition 15a). It appears both as a thermodynamic constraint in the MPU internal cycle and as a structural constraint on the dimension of the active kernel (forcing $a=2$ on that branch). It thus ties the emergence of the quantum state space, the arrow of time, and the scaling of spacetime coupling together through one irreducible information-theoretic constant.

**Stage 2: Physical Instantiation of the Cost.** The Principle of Physical Instantiation (PPI, Appendix P, Definition P.6.2) requires abstract logical costs to manifest as actual physical subsystems. The von Neumann entropy of a maximally mixed state on an $a$-dimensional Hilbert space satisfies $S(\rho) \le \ln a$ nats, with equality only for the maximally mixed state [von Neumann 1932]. Admissibility requires $\ln a \ge \varepsilon_0$; since $a \in \mathbb{N}$, PPI-optimality selects the minimal admissible $a$ on the attractor-saturating branch (Theorem Z.1):

$$
a = 2
\tag{G.1.9.2}
$$

This 2-dimensional "Landauer Pointer" is the minimal physical realization of the irreducible cost.

**Stage 3: The PCE-Attractor State.** With $d_0 = 8$ on the minimal Appendix Z branch (Theorem Z.2; Theorem 23 gives $d_0\ge 8$) and $a = 2$, the inactive subspace has dimension $b = d_0 - a = 6$. The PCE-Attractor (Definition 15a) is the unique equilibrium state maximally mixed on the active subspace and zero on the inactive complement:

$$
\tau^* = \rho_0 = \frac{I_2}{2} \oplus 0_6
\tag{G.1.9.3}
$$

with eigenvalues $(1/2, 1/2, 0, 0, 0, 0, 0, 0)$. The von Neumann entropy restricted to the active subspace is:

$$
S(\tau^*|_{\mathcal{A}}) = -\mathrm{tr}\left(\frac{I_2}{2} \ln \frac{I_2}{2}\right) = -2 \cdot \frac{1}{2} \ln\frac{1}{2} = \ln 2 = \varepsilon
\tag{G.1.9.4}
$$

At the PCE-Attractor, quantum entropy and SPAP entropy coincide exactly for the maximally mixed active subspace. This identity confirms the entropy unification thesis: the von Neumann entropy $S(\tau^*|_{\mathcal{A}})$ and the SPAP entropy $\varepsilon$ realize the same counting structure in the same units on the $a=2$ attractor branch.

### G.1.9.2 ND-RID Channel Structure and Fixed Points

The average 'Evolve' channel $\mathcal{E}_N$ is modeled as a convex combination (Appendix E, Lemma E.1):

$$
\mathcal{E}_N = (1-p)\Psi + p \cdot T_\sigma, \quad 0 < p \leq 1
\tag{G.1.9.5}
$$

where $\Psi$ is an arbitrary CPTP map representing the reversible/update phase and $T_\sigma(\rho) = \mathrm{tr}(\rho)\sigma$ is the full-rank reset channel to state $\sigma \succ 0$. 

**Lemma G.1.9.1 (Nonzero Refresh Weight).** In the PU coarse-grained ND-RID description, the averaged 'Evolve' channel includes a nonzero input-independent refresh component (Equation (G.1.9.5)), i.e. it admits a decomposition
$$
\mathcal{E}_N = (1-p)\Psi + p\,T_\sigma
\quad\text{with}\quad
p\in(0,1].
\tag{G.1.9.6}
$$
The irreducible cost $\varepsilon_0=\ln2$ (Theorem 31) is the thermodynamic signature of logically irreversible refresh/reset in the SPAP cycle, but $\varepsilon$ alone does not determine a universal quantitative lower bound on $p$ without additional microscopic assumptions about how entropy production is partitioned between $\Psi$ and the refresh component.

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

**Definition G.1.9.2a (Entropy Production Decomposition).** For a quantum dynamical semigroup generator $\mathcal{L}$ with faithful stationary state $\sigma$ (i.e., $\mathcal{L}^*(\sigma) = 0$ with $\sigma \succ 0$), the entropy production for the induced CPTP map $\Phi_t = e^{t\mathcal{L}}$ acting on state $\rho$ decomposes as [Spohn 1978]:

$$
\Delta S_{tot}[\rho; \Phi_t] = -\Delta D(\rho \| \sigma) + \sigma_{irr}[\rho; \Phi_t]
\tag{G.1.9.7}
$$

where:
- $D(\rho \| \sigma) = \mathrm{tr}(\rho \ln \rho - \rho \ln \sigma)$ is the Umegaki relative entropy
- $\Delta D = D(\Phi_t(\rho) \| \sigma) - D(\rho \| \sigma) \leq 0$ represents contraction toward the stationary state
- $\sigma_{irr} \geq 0$ is the irreversible entropy production

This decomposition is fundamental to the entropy unification program: the total entropy production $\Delta S_{tot}$ is the thermodynamic entropy (measurable as heat divided by temperature), while the relative entropy $D_{KL}$ is the information-theoretic entropy. The Spohn decomposition makes explicit that these are components of a single quantity.

**Proposition G.1.9.2 (PCE preference for detailed-balance channels).** Suppose the ND-RID admissible class contains two channels with the same stationary state and the same predictive utility, and suppose the POP/PCE cost functional is monotone in the irreversible entropy production term $\sigma_{irr}$. Then PCE prefers the channel with smaller $\sigma_{irr}$; in particular, if a channel with $\sigma_{irr}=0$ is admissible, it is preferred over all channels with the same utility and larger irreversible entropy production.

*Proof.* Under the stated monotonicity hypothesis, two channels with identical predictive utility and stationary state are ordered entirely by their contribution to the irreversible cost term. Therefore the channel with smaller $\sigma_{irr}$ has lower POP/PCE cost. If an admissible channel with $\sigma_{irr}=0$ exists, it minimizes this contribution among that comparison class. QED

**Theorem G.1.9.3 (Detailed Balance Characterization).** For a quantum dynamical semigroup with faithful stationary state $\sigma$, write the GKLS generator in its canonical Hamiltonian–dissipative decomposition
$$
\mathcal{L}=\mathcal{L}_H+\mathcal{L}_D,
\qquad
\mathcal{L}_H(\rho):=-i[H,\rho],
$$
where $H=H^\dagger$ commutes with $\sigma$ (so $\mathcal{L}_H$ preserves $\sigma$ without entropy production) and $\mathcal{L}_D$ is the purely dissipative (Lindblad) part. Then $\sigma_{irr}[\rho; e^{t\mathcal{L}}] = 0$ for all states $\rho$ and all $t>0$ if and only if the dissipative part satisfies quantum detailed balance with respect to $\sigma$:
$$
\mathcal{L}_D=\mathcal{L}_D^{\dagger_\sigma},
\qquad\text{equivalently}\qquad
\langle A,\mathcal{L}_D(B)\rangle_\sigma=\langle \mathcal{L}_D(A),B\rangle_\sigma
\tag{G.1.9.8}
$$
for all observables $A,B$, where $\langle A,B\rangle_\sigma:=\mathrm{tr}(A^\dagger B\,\sigma)$ and $\mathcal{L}_D^{\dagger_\sigma}$ is the adjoint of the dissipative part with respect to this inner product [Spohn 1978; Fagnola & Umanità 2007].

*Proof.* The semigroup acts on the finite-dimensional operator algebra of the MPU active sector and the stationary state $\sigma$ is faithful by hypothesis, so the detailed-balance characterization theorems of Spohn [1978] and Fagnola & Umanità [2007] apply. The Hamiltonian part $\mathcal{L}_H$ is $\sigma$-skew-adjoint ($\mathcal{L}_H^{\dagger_\sigma}=-\mathcal{L}_H$) and generates unitary evolution that preserves relative entropy; it therefore contributes zero irreversible entropy production regardless of the detailed-balance condition. The irreversible entropy production is governed entirely by the dissipative part $\mathcal{L}_D$. For such semigroups, vanishing irreversible entropy production for all initial states and times is equivalent to the dissipative part being self-adjoint with respect to the $\sigma$-weighted inner product, i.e. $\mathcal{L}_D=\mathcal{L}_D^{\dagger_\sigma}$. This is exactly the stated detailed-balance condition. ∎

**Corollary G.1.9.3a (PCE-Optimal ND-RID Satisfies Detailed Balance).** The PCE-optimal ND-RID channel $\mathcal{E}_N^*$ satisfies quantum detailed balance with respect to the PCE-Attractor state $\tau^*$.

### G.1.9.4 The Gibbs Structure of PCE-Optimal Fixed Points

**Definition G.1.9.4a (Modular Hamiltonian).** For any faithful density operator $\rho$ on a finite-dimensional Hilbert space $\mathcal{H}$, the modular Hamiltonian $K_\rho$ is the unique self-adjoint operator satisfying [Haag 1996]:

$$
\rho = \frac{e^{-K_\rho}}{Z}, \quad Z = \mathrm{tr}(e^{-K_\rho})
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

*Proof.* Direct computation from Definition G.1.9.4a. On the active subspace $\mathcal{A}$:

$$
e^{-K^*|_{\mathcal{A}}} = e^{-(\ln 2) I_2} = \frac{1}{2} I_2
$$

Normalizing: $Z^* = \mathrm{tr}(e^{-K^*}) = \mathrm{tr}(I_2/2) = 1$, yielding $\tau^*|_{\mathcal{A}} = I_2/2$. On the inactive subspace $\mathcal{B}$, $K^*|_{\mathcal{B}} = +\infty$ ensures $e^{-K^*|_{\mathcal{B}}} = 0$. QED

**Theorem G.1.9.5 (KMS Characterization of PCE-Optimal States).** States satisfying detailed balance with respect to a quantum dynamical semigroup are characterized by the Kubo-Martin-Schwinger (KMS) condition [Kubo 1957; Martin & Schwinger 1959]. Restricted to the active subspace $\mathcal{A} = \text{supp}(\tau^*)$, where $\tau^*|_{\mathcal{A}}$ is faithful, the PCE-Attractor state satisfies the KMS condition at inverse temperature $\beta = 1$ with respect to the modular flow $\sigma_t(A) = e^{iK^*|_{\mathcal{A}} t} A e^{-iK^*|_{\mathcal{A}} t}$:

$$
\omega^*(A \sigma_t(B)) = \omega^*(\sigma_{t+i}(B) A)
\tag{G.1.9.11}
$$

where $\omega^*(\cdot) = \mathrm{tr}(\tau^*|_{\mathcal{A}} \cdot)$ is the state functional on $\mathcal{B}(\mathcal{A})$.

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
| Quantum measurement | Perspective $s$ determines basis | $-\ln \rho_{phys} - K^*_{PCE}$ | Born: $p_i = \mathrm{tr}(\rho_{phys} P_i)$ |
| Thermal equilibrium | $\langle H \rangle = U$ | $\beta H$ | Boltzmann: $p_n = Z^{-1}e^{-\beta E_n}$ |
| Horizon crossing | Boost invariance | $(2\pi/\kappa) K_{boost}$ | Unruh: $T_U = \hbar\kappa/(2\pi k_B c)$ |

*Remark.* The additivity in Equation (G.1.9.12) holds when the constraints are mutually commuting or when the constraint acts on degrees of freedom independent of the baseline PCE structure. For strongly interacting constraints, cross-terms may arise, though the Gibbs form $\rho^* = Z^{-1}e^{-K^*_{total}}$ is preserved.

*Proof.*

**Part A (Quantum Measurement—Reference Case):** The quantum measurement case serves as the reference point of the unification. The Born rule derivation (Sections G.1.1–G.1.4) establishes that PCE-enforced non-contextuality and additivity yield $p_i = \mathrm{tr}(\rho_{phys} P_i)$ via Gleason's theorem [Gleason 1957]. 

By Definition G.1.9.4a, any faithful density matrix $\rho_{phys}$ admits the Gibbs representation $\rho_{phys} = Z^{-1}e^{-K}$ with $K = -\ln \rho_{phys}$. This is the identity case of the Gibbs structure—not an additional constraint but the baseline from which constraint modifications are measured. The measurement context (perspective $s \in \Sigma$) determines the basis $\{P_i\}$ in which probabilities are evaluated:

$$
p_i = \mathrm{tr}\left(\frac{e^{-K^*}}{Z} P_i\right) = \mathrm{tr}(\rho_{phys} P_i)
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

where $\kappa$ is the surface gravity. This yields the Unruh temperature $T_U = \hbar\kappa/(2\pi k_B c)$ for accelerated observers [Unruh 1976], which is the kinematic result underlying the entanglement first law (Equation G.1.9.16) and the thermodynamic derivation of gravity (Section 12). The constraint here arises from the geometric structure of the horizon itself—boost invariance of the vacuum state restricts the form of $K^*$ to be proportional to $K_{boost}$. QED

### G.1.9.6 Connection to the Entanglement First Law

The modular Hamiltonian structure connects directly to the entanglement first law, which is central to the derivation of Einstein's equations (Section 12, Theorem 50).

**Theorem G.1.9.7 (Entanglement First Law from Modular Structure).** For small perturbations $\delta\rho$ to the vacuum state across a causal horizon $\mathcal{H}$, the first law of entanglement entropy relates entropy change to the modular Hamiltonian expectation value (Equation G.1.9.16):

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

*Proof.* This follows from the Tomita-Takesaki theory of modular operators [Takesaki 1970; Haag 1996]. The modular Hamiltonian $K$ generates the modular automorphism group $\sigma_t$, and the entanglement first law is the linearization of the relative entropy formula $S(\rho \| \sigma) = \mathrm{tr}(\rho \ln \rho - \rho \ln \sigma)$ around the reference state [Blanco et al. 2013]. The specific form (G.1.9.17) uses the Bisognano-Wichmann identification of $K$ with the boost generator. This result is kinematic—it follows from quantum field theory on curved spacetime and does not assume the Einstein equations [Jacobson 2016; Casini, Huerta & Myers 2011]. QED

**Corollary G.1.9.7a (Thermodynamic Consistency Fixes $\eta_{ent}$).** Requiring the local Clausius relation $\delta S = \delta Q/T$ to hold for all Rindler horizons uniquely determines the entanglement entropy coefficient (Theorem E.5):

$$
\eta_{ent} = \frac{1}{4G}
\tag{G.1.9.18}
$$

This identifies the gravitational constant $G$ as an emergent quantity determined by the MPU network's entanglement structure, consistent with the Bekenstein-Hawking entropy formula [Bekenstein 1973; Hawking 1975].

The result $\eta_{ent} = 1/(4G)$ connects directly to the gravitational entropy in the unified entropy framework (Section P.6.5). The Bekenstein-Hawking entropy $S_{BH} = \mathcal{A}/4G$ arises from the channel capacity of ND-RID interactions crossing the horizon (Theorems E.3 and E.5). This is not an analogy but an identity: horizon entropy counts the Shannon entropy of channel capacity across the boundary, measured in Planck units. The derivation chain from SPAP to horizon entropy (Section P.6.5.2) makes this explicit:

$$
\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2 \xrightarrow{\text{E.2a}} C_{\max}\le\ln d_0-\ln2 \xrightarrow{\text{E.3}} N_{eff} \propto \mathcal{A} \xrightarrow{\text{E.5}} S_{BH} = \frac{\mathcal{A}}{4G}
$$

### G.1.9.7 The Unified Mechanism

**Theorem G.1.9.8 (Unified Gibbs-form template for physical probability).** Within the finite-dimensional active sector, the probability assignments that appear in the Born-rule, thermal, and modular-equilibrium applications all take the Gibbs-form template
$$
\rho = Z^{-1}e^{-K},
$$
with the modular Hamiltonian $K$ determined by the relevant constraint geometry.

*Proof.* Sections G.1.1–G.1.8 identify measurement probabilities with expectation values computed from density operators. Theorems G.1.9.4 and G.1.9.5 show that the PCE-attractor state and its support-restricted equilibrium description are of Gibbs/KMS form. Theorem G.1.9.6 then records how additional physical constraints modify the modular Hamiltonian additively while preserving the same Gibbs-form template. Therefore the probability structures considered in these sections share a common Gibbs-form representation, with differences encoded in the constraint term entering $K$. QED

### G.1.9.8 The Conversion Factor: $\varepsilon_0=\ln2$

The irreducible entropy cost $\varepsilon_0=\ln2$ plays the role of a fundamental conversion factor, analogous to $c^2$ in mass-energy equivalence.

**Theorem G.1.9.9 (Landauer Conversion).** The SPAP entropy cost $\varepsilon_0=\ln2$ establishes the conversion between:

| Domain | Quantity | Conversion |
|--------|----------|------------|
| Logical | SPAP cycle cost | $\varepsilon_0=\ln2$ nats |
| Thermodynamic | Minimum heat dissipation | $Q_{min} = k_B T \ln 2$ |
| Information | Active subspace dimension | $a = 2$ |
| Geometric | Interface mode count | $M = 2ab = 24$ |

These conversions realize the entropy domain correspondences of Thesis P.6.1 (Section P.6.5.1). The constants $k_B$, $\hbar$, $c$, and $G$ serve as exchange rates between operational domains, while $\varepsilon_0=\ln2$ is the fundamental quantum of entropy from which all domain-specific expressions derive.

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
| SPAP entropy $\varepsilon_0=\ln2$ | Irreducible cycle cost |
| Shannon entropy $H$ | State distinguishability |
| Thermodynamic entropy $dS = \delta Q/T$ | Boltzmann distribution |
| von Neumann entropy $S(\rho)$ | Born rule |
| Bekenstein-Hawking entropy $S_{BH}$ | Unruh-Hawking distribution |

The complete derivation chain from foundational principles to physical probability is:

$$
\boxed{
\text{SPAP} \xrightarrow{\text{Thm 31}} \varepsilon_0=\ln2 \xrightarrow{\text{Thm Z.1}} a = 2 \xrightarrow{\text{Def 15a}} \tau^* \xrightarrow{\text{PCE}} \text{Detailed Balance} \xrightarrow{\mathcal{C}} \rho^*_{\mathcal{C}} = Z^{-1}e^{-K^*(\mathcal{C})}
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

*Proof.* From the Action-Entropy Identity (Corollary Q.0.1), action in units of $\hbar$ equals total SPAP entropy: $\mathcal{S}/\hbar = \sum_i \varepsilon_i$. At the SPAP minimum, each cycle contributes $\varepsilon_0=\ln2$ nats (Theorem 31). For one Bohr-Sommerfeld quantum $\mathcal{S} = h = 2\pi\hbar$:
$$N_{\text{cycles}} = \frac{2\pi\hbar/\hbar}{\ln 2} = \frac{2\pi}{\ln 2} \approx 9.065$$
QED

**Remark G.1.9.10c: Complementary Roles of $\varepsilon$ and $2\pi$.** The quantities $\varepsilon_0=\ln2$ and $2\pi$ operate in complementary domains:

| Quantity | Domain | Origin | Role in Framework |
|:---------|:-------|:-------|:------------------|
| $\varepsilon_0=\ln2$ | Measure-theoretic | SPAP logical merge (Theorem 31) | Irreducible information cost |
| $2\pi$ | Topological | $\pi_1(U(1)) = \mathbb{Z}$ | Phase quantization period |

Neither is derivable from the other. The measure-theoretic entropy $\varepsilon$ counts distinguishable states; the topological factor $2\pi$ enforces consistency under cyclic evolution. Their ratio $2\pi/\ln 2$ characterizes the computational depth of one action quantum.

**Remark G.1.9.10d: Connection to Modular Flow.** The KMS condition (Theorem G.1.9.5) characterizes equilibrium states with respect to modular flow $\sigma_t(A) = e^{iK^* t} A e^{-iK^* t}$ at inverse temperature $\beta = 1$. On the active subspace, $K^*|_{\mathcal{A}} = (\ln 2)\cdot I_2$ (Theorem G.1.9.4), so the modular Hamiltonian eigenvalue is $\ln 2$. The ratio $2\pi/\ln 2 \approx 9.065$ appearing in Corollary G.1.9.10b characterizes the action-entropy conversion: one topological quantum of phase ($2\pi$) corresponds to $2\pi/\ln 2$ units of SPAP entropy.

**Remark G.1.9.10e: Derived Mass-Time Identity.** On the attractor-saturating branch, Definition Z.8f and Theorem Q.6.1 give
$$
\mu_0 c^2 \tau_{min} = \frac{\hbar}{2}.
$$
Indeed,
$$
\mu_0 c^2 \tau_{min}
=
\frac{m_P}{2\sqrt{8\ln 2}}\,c^2 \cdot \sqrt{8\ln 2}\,t_P
=
\frac{m_P c^2 t_P}{2}
=
\frac{\hbar}{2}.
$$
This is an exact algebraic identity between the derived mass scale and the derived minimum cycle time. It does not by itself establish Margolus-Levitin saturation or a self-generated Unruh bath for the MPU.

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

*Proof.* From Theorem Z.1, PPI-optimality on the attractor-saturating branch $\varepsilon_0=\ln2$ selects active dimension $a = 2$. From Theorem Z.11, the mode-channel correspondence $M = K(D)$ with $M = 24$ uniquely selects $D = 4$ from the mode-channel correspondence. Therefore $D - 2 = 4 - 2 = 2 = a$.

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

*Proof.* The equality $k=12$ is not inferred from $M=24$ alone. The required rate statement is supplied by the predictive-recovery self-dual-rate gate of Definition Z.13b.0 and Theorem Z.13b.0a. For any binary linear interface code $C\subset\mathbb F_2^{24}$,
$$
\dim C+\dim C^\perp=24.
$$
On an exact self-dual carrier $C=C^\perp$, this gives $2\dim C=24$ and hence $\dim C=12$. On the more general MacWilliams branch, Theorem Z.13b.0a gives the same conclusion by minimizing the strict dual-asymmetry coordinate, so $k=M/2=12$. The 12 signal modes span a subspace requiring joint estimability ($\omega=0$ on all pairs), which is exactly the isotropic condition (Definition G.8.2d). The selected Golay carrier is Type II self-dual, $\mathcal G_{24}=\mathcal G_{24}^\perp$, matching the symmetric relationship between complementary Lagrangian subspaces. ∎

**Theorem G.8.7f (Canonicity).** The bijection $\Phi$ is canonical—it involves no arbitrary choices.

*Proof.* The partition $(a, b) = (2, 6)$ is uniquely determined by $\varepsilon_0=\ln2$ (Theorem Z.1). The Grassmannian $\mathrm{Gr}(2, 8)$ has a unique compatible complex structure (Appendix P). The Golay code selects a unique (up to equivalence) Lagrangian subspace (Theorem Z.13). The SM gauge algebra is the unique determinant-compatible capacity-saturating block-frame algebra in the admissible finite-response family (Theorem G.8.4b; Corollary G.8.4c). The little group $SO(2)$ in $D = 4$ acts on the 2-dimensional transverse polarization plane via its defining representation. All ingredients are uniquely determined by framework constraints. ∎

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

**Lemma G.10.1a (Irreducibility of $\mathbb{Z}_2$).** The $\mathbb{Z}_2$ structure of the SPAP involution cannot be reduced to the trivial group.

*Proof.* Suppose the SPAP update could be implemented with $\iota = \text{id}$. Then $\phi_{t+1} = \hat{\phi}_t$, and the system would achieve perfect self-prediction, contradicting Theorem 10 (Deterministic SPAP). The diagonalization argument (Appendix A.1, Theorem A.1.1) establishes that any predictor $P_f$ applied to the diagonal system $S_{diag}$ with rule $\phi_{t+1} = \text{NOT}(\hat{\phi}_{P_f})$ yields a contradiction: $\hat{\phi} = \text{NOT}(\hat{\phi})$. Therefore, the non-trivial involution $\iota \neq \text{id}$ is logically necessary for any system possessing Property R (Definition 10). ∎

### G.10.1.2 Connection to Landauer Cost

The $\mathbb{Z}_2$ structure directly generates the irreducible entropy cost $\varepsilon_0=\ln2$ (Theorem 31). By Lemma Z.2 (Appendix Z), the physical instantiation of the SPAP cycle implements a 2-to-1 logical state merge: the input space $\{0,1\} \times \{0,1\}$ (state and prediction registers) maps to output space $\{0,1\} \times \{p_{\text{ready}}\}$, compressing 4 states to 2. This state-space structure follows from the operational requirement that the prediction register must reset to a determinate ready state before each new cycle can commence. Specifically, the cycle map $G_{\text{cycle}}: (\phi_t, p_t) \mapsto (\phi_{t+1}, p_{t+1})$ satisfies:
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

This establishes the chain: $\text{SPAP} \xrightarrow{\mathbb{Z}_2} \varepsilon_0=\ln2$.

---

## G.10.2 Physical Instantiation of the Involution

### G.10.2.1 The Active Kernel Dimension

**Theorem G.10.2 (Projective Realization of the SPAP Involution and SU(2) Lift).** The Principle of Physical Instantiation (PPI, Definition P.6.2) requires the logical involution $\iota$ to be realized as a nontrivial projective unitary involution on the active kernel $\mathcal H_a\cong\mathbb C^2$ with $a=2$ (Theorem Z.1). Equivalently, an amplitude representative $\widetilde U_\iota$ satisfies
$$
[\widetilde U_\iota]^2=[I],
\qquad
[\widetilde U_\iota]\ne[I],
$$
where brackets denote equality modulo global phase. In a basis where the projective involution exchanges the two active basis states, one may choose the determinant-one lift
$$
U_\iota=i\sigma_x\in SU(2),
\qquad
U_\iota^2=-I.
$$
Thus the SPAP involution is exact on rays and has the standard $SU(2)$ double-cover lift on amplitudes.

*Proof.* Physical outcome probabilities and density matrices are invariant under multiplication of a state vector or implementing unitary by an overall phase. Hence PPI represents the active-kernel action on rays by the projective unitary class $[\widetilde U_\iota]$ rather than by a phase-fixed operator.

The logical condition $\iota^2=\mathrm{id}$ requires
$$
[\widetilde U_\iota]^2=[I],
$$
so for any unitary representative,
$$
\widetilde U_\iota^2=e^{i\theta}I
$$
for some real $\theta$. Multiplying by the response-null phase $e^{-i\theta/2}$ gives a representative $V$ with
$$
V^2=I.
$$
Nontriviality excludes $V=\pm I$. Since $V$ is a nontrivial unitary involution on $\mathbb C^2$, its eigenvalues are $+1$ and $-1$, so it is unitarily equivalent to $\mathrm{diag}(1,-1)$. In the basis obtained by conjugating with the Hadamard matrix, this representative is $\sigma_x$.

The operator $\sigma_x$ has determinant $-1$, so it is not itself an element of $SU(2)$. Multiplying by the response-null phase $i$ gives
$$
U_\iota=i\sigma_x,
\qquad
\det(i\sigma_x)=i^2\det(\sigma_x)=(-1)(-1)=1,
$$
so $U_\iota\in SU(2)$. Moreover
$$
U_\iota^2=(i\sigma_x)^2=-I,
$$
which acts trivially on rays. Therefore $U_\iota$ is the determinant-one amplitude lift of the same projective involution. ∎

---

## G.10.3 Emergence of SU(2) as Active Kernel Symmetry

**Theorem G.10.3 (SU(2) Active-Kernel Lift of the Projective Symmetry).** The physical ray symmetry of the active kernel $\mathcal H_a\cong\mathbb C^2$, after PPI quotienting of global phase, is
$$
PU(2)=U(2)/U(1)\cong SO(3).
$$
The minimal connected determinant-one unitary amplitude lift of this projective symmetry is $SU(2)$. Thus the active-kernel symmetry is $SO(3)$ on rays and $SU(2)$ on amplitudes, with $SU(2)$ supplying the spinor double-cover structure used below.

*Proof.*

**Step 1 (PPI quotient by global phase).** On density matrices $\rho$, the action of $U\in U(2)$ is
$$
\rho\mapsto U\rho U^\dagger.
$$
For any phase $e^{i\phi}$,
$$
(e^{i\phi}U)\rho(e^{i\phi}U)^\dagger=U\rho U^\dagger.
$$
The global $U(1)$ factor changes no finite protocol response and is therefore response-null. PPI quotients it, so the physical ray symmetry is
$$
PU(2)=U(2)/U(1).
$$

**Step 2 (Identification with $SO(3)$).** Every density matrix on $\mathbb C^2$ has the Bloch form
$$
\rho=\frac12(I+\vec r\cdot\vec\sigma),
\qquad
\vec r\in\mathbb R^3,\quad |\vec r|\le1.
$$
Conjugation by a unitary preserves trace, positivity, and spectrum, so it maps the Bloch vector by an orthogonal transformation preserving orientation. Thus there is a homomorphism
$$
PU(2)\to SO(3).
$$
The standard Pauli commutator relation
$$
[\sigma_i,\sigma_j]=2i\epsilon_{ijk}\sigma_k
$$
identifies the induced infinitesimal action of traceless anti-Hermitian $2\times2$ matrices with $\mathfrak{so}(3)$, so the homomorphism has matching Lie-algebra dimension and is onto the connected group $SO(3)$. By Schur's lemma applied to the irreducible Bloch-vector action, a unitary that conjugates every $\rho$ to itself must be a scalar in $U(2)$; scalars are exactly the elements quotiented in $PU(2)=U(2)/U(1)$, so the induced kernel in $PU(2)$ is trivial. Hence
$$
PU(2)\cong SO(3).
$$

**Step 3 (The SPAP involution inside the lift).** By Theorem G.10.2 the SPAP involution is represented on rays by a projective order-two class and on amplitudes by the determinant-one lift
$$
U_\iota=i\sigma_x\in SU(2),
\qquad
U_\iota^2=-I.
$$
Since $-I$ acts trivially on rays, this is exactly the required logical involution in the PPI quotient.

**Step 4 (Transitivity and minimality).** The pure active states form
$$
\mathbb CP^1\cong S^2.
$$
The projective group $PU(2)\cong SO(3)$ acts transitively on $S^2$. A PCE-admissible connected projective symmetry group that supports arbitrary active-kernel predictions must act transitively on this sphere; otherwise some pure predictive states would be unreachable and the retained state space would contain unsupported surplus labels.

Let $G$ be a connected Lie subgroup of $SO(3)$ acting transitively on $S^2$. Its Lie algebra $\mathfrak g$ is a subalgebra of $\mathfrak{so}(3)$. Since $\mathfrak{so}(3)$ has rank one, every proper subalgebra is at most one-dimensional: the cross-product bracket of two linearly independent elements is independent of both, and any two linearly independent elements therefore generate the full three-dimensional $\mathfrak{so}(3)$. If $\mathfrak g$ is one-dimensional, the corresponding subgroup is conjugate to rotations about a fixed axis and has fixed poles on $S^2$, so it is not transitive. Thus transitivity forces
$$
G=SO(3).
$$
Therefore the minimal connected ray symmetry is $PU(2)\cong SO(3)$.

The simply connected determinant-one unitary lift of $SO(3)$ is $SU(2)$, with kernel $\{\pm I\}$. The larger group $U(2)$ contains the response-null global phase already removed by PPI, so PCE retains $SU(2)$ as the minimal amplitude lift. ∎

---

## G.10.4 The Double Cover and Spinor Representation

### G.10.4.1 SU(2) as Double Cover of SO(3)

**Theorem G.10.4 (Double Cover Structure).** The group SU(2) is the universal double cover of SO(3):
$$
1 \to \mathbb{Z}_2 \to \text{SU}(2) \xrightarrow{\pi} \text{SO}(3) \to 1 \tag{G.10.6}
$$
with $\ker(\pi) = \{I, -I\}$.

*Proof.* Identify $\mathbb{R}^3$ with the real vector space of traceless Hermitian $2\times2$ matrices by
$$
\vec v=(v_1,v_2,v_3) \longleftrightarrow V:=v_1\sigma_1+v_2\sigma_2+v_3\sigma_3.
$$
For $U\in \mathrm{SU}(2)$ define $\pi(U)$ by
$$
U V U^\dagger = (\pi(U)\vec v)\cdot \vec\sigma .
$$
Conjugation preserves Hermiticity, trace, and determinant, so $\pi(U)$ preserves the Euclidean norm $|\vec v|^2 = \det(V)$ and orientation. Hence $\pi(U)\in \mathrm{SO}(3)$. The assignment $U\mapsto \pi(U)$ is a continuous homomorphism because
$$
(U_1U_2)V(U_1U_2)^\dagger
=
U_1\bigl(U_2VU_2^\dagger\bigr)U_1^\dagger.
$$

To compute the kernel, suppose $\pi(U)=I$. Then $UVU^\dagger=V$ for every traceless Hermitian $V$, so $U$ commutes with every Pauli matrix and therefore with all of $M_2(\mathbb C)$. Hence $U=\lambda I$ for some scalar $\lambda$. Since $U\in \mathrm{SU}(2)$, $\det U=\lambda^2=1$, so $\lambda=\pm1$. Thus
$$
\ker(\pi)=\{I,-I\}\cong \mathbb Z_2.
$$

It remains to show surjectivity. The differential at the identity sends $X\in \mathfrak{su}(2)$ to the infinitesimal action $V\mapsto [X,V]$. In the Pauli basis this identifies $\mathfrak{su}(2)$ with $\mathfrak{so}(3)$, so $d\pi_e$ is an isomorphism of Lie algebras. Therefore the image $\pi(\mathrm{SU}(2))$ is a connected Lie subgroup of $\mathrm{SO}(3)$ with Lie algebra all of $\mathfrak{so}(3)$, hence it is an open subgroup. Because $\mathrm{SU}(2)$ is compact, its image is compact and therefore closed in $\mathrm{SO}(3)$. Since $\mathrm{SO}(3)$ is connected, the only nonempty subset that is both open and closed is the whole group, so $\pi$ is surjective.

Thus $\pi$ is a surjective homomorphism with kernel $\{\pm I\}$, hence a two-sheeted covering map. Finally, $\mathrm{SU}(2)\cong S^3$ is simply connected, so this covering is universal. ∎

### G.10.4.2 Spinor Sign Flip Under 2π Rotation

**Corollary G.10.4.1 (Spinor Structure from the SU(2) Lift).** Fields transforming under the fundamental amplitude representation of the active-kernel lift $SU(2)\to SO(3)$ are spinors: the lift of a $2\pi$ spatial rotation acts as $-I$ on the amplitude.

*Proof.* Let a spatial rotation by angle $\theta$ about axis $\hat n$ be represented in $SO(3)$. Its continuous $SU(2)$ lift from the identity is
$$
U(\theta,\hat n)=\exp\left(-\frac{i\theta}{2}\hat n\cdot\vec\sigma\right).
\tag{G.10.7}
$$
The Pauli identity
$$
(\hat n\cdot\vec\sigma)^2=I
$$
gives
$$
U(\theta,\hat n)
=
\cos(\theta/2)I-i\sin(\theta/2)\hat n\cdot\vec\sigma.
$$
For $\theta=2\pi$,
$$
U(2\pi,\hat n)
=
\cos(\pi)I-i\sin(\pi)\hat n\cdot\vec\sigma
=
-I.
\tag{G.10.8}
$$
The element $-I$ lies in the kernel of $SU(2)\to SO(3)$, so it represents the identity rotation on rays but a sign flip on amplitudes. This is the spinor transformation law. ∎

**Remark G.10.1: Causal Chain from SPAP $\mathbb{Z}_2$ to Spinor $\mathbb{Z}_2$.** The $\mathbb{Z}_2$ structure appears at two distinct points in the derivation chain: first as the logical involution of SPAP ($\iota:\phi\mapsto\mathrm{NOT}(\phi)$), and second as the kernel $\{I,-I\}$ of the double cover $\pi:SU(2)\to SO(3)$. These are mathematically distinct objects. The SPAP $\mathbb{Z}_2$ acts on logical states, while the double-cover $\mathbb{Z}_2$ acts on active-kernel amplitudes by scalar multiplication.

The precise connection is through the projective realization of the logical involution:

1. The SPAP logical involution (Definition G.10.1) determines the two-branch merge structure (Lemma Z.2).
2. This merge structure determines $\varepsilon_0=\ln2$ via the Landauer/SPAP entropy theorem (Theorem 31).
3. PPI-optimality selects the minimal active subsystem dimension $a=2$ (Theorem Z.1).
4. On $\mathcal H_a\cong\mathbb C^2$, the SPAP involution is a nontrivial projective unitary involution. Its determinant-one lift is $U_\iota=i\sigma_x\in SU(2)$ with $U_\iota^2=-I$ (Theorem G.10.2).
5. PPI/PCE quotienting of global phase gives the ray symmetry $PU(2)\cong SO(3)$, while the minimal amplitude lift is $SU(2)$ (Theorem G.10.3).
6. The lift $SU(2)\to SO(3)$ has kernel $\{I,-I\}\cong\mathbb Z_2$ (Theorem G.10.4).

Together with the minimal carrier dimension $d_0=8$ and the finite-response block-frame capacity-saturation theorem, the same active rank $a=2$ selects the rank-2 weak inactive summand inside the unique $3+2+1$ decomposition. On the minimal flag lift, Theorem G.8.4c.0c states that any local unitary fiber isometry from the active rank-2 carrier to the weak rank-2 summand transports the Pauli $\mathfrak{su}(2)$ algebra to the weak block. This is a local finite-response frame identification and does not assert a canonical global bundle isomorphism.

The complete causal chain is therefore:
$$
\text{SPAP } \mathbb Z_2
\xrightarrow{\text{Landauer}}
\varepsilon_0=\ln2
\xrightarrow{\text{PPI}}
a=2
\xrightarrow{\text{projective lift}}
U_\iota=i\sigma_x,\ U_\iota^2=-I
\xrightarrow{\text{PCE/PPI}}
SU(2)\to SO(3)
\xrightarrow{\text{Lie theory}}
\ker(\pi)=\{I,-I\}.
$$

Thus the spinor sign flip is traceable to the logical structure of self-referential prediction through the active-kernel projective-lift chain, without identifying the SPAP logical $\mathbb Z_2$ itself with the double-cover kernel.

---

## G.10.5 Lorentzian Extension to Spin(1,3)

**Theorem G.10.5 (Compatibility of the spinor sector with $Spin(1,3)$).** Once the emergent spacetime sector is identified with a Lorentzian $3+1$-dimensional geometry and the internal two-state spin sector is represented by $SU(2)$, the standard relativistic spinor completion is the double cover
$$
Spin(1,3)\cong SL(2,\mathbb{C}).
$$

*Proof.* Theorem G.10.4 establishes the compact spin representation $SU(2)\to SO(3)$ for the spatial sector. For a Lorentzian spacetime in $3+1$ dimensions, the connected Lorentz group is $SO^+(1,3)$, whose universal double cover is the Lie group $SL(2,\mathbb{C})\cong Spin(1,3)$. The compact subgroup of this cover is precisely $SU(2)$, so the two-state spin sector embeds in the standard relativistic spinor representation. Thus, under the Lorentzian spacetime identification, the spinor sector is compatible with the usual $Spin(1,3)$ structure. QED

**Corollary G.10.5.1 (Active Spinor Source of the Lorentz Six-Generator Count).** On the Lorentzian spinor branch, the active rank-2 carrier supplies the standard Hermitian determinant model of Minkowski space:
$$
x^\mu\longmapsto X=x^0I+x^i\sigma_i,
\qquad
\det X=(x^0)^2-\lVert\vec x\rVert^2.
$$
The action
$$
X\longmapsto AXA^\dagger,
\qquad A\in SL(2,\mathbb C),
$$
preserves $\det X$ and has kernel $\{\pm I\}$, hence descends to
$$
SL(2,\mathbb C)/\{\pm I\}\cong SO^+(1,3).
$$
Therefore
$$
6_{\mathrm{Lorentz}}=\dim_{\mathbb R}\mathfrak{so}(1,3),
$$
with three rotation and three boost generators. This is a real Lie-algebra generator count sourced by the active rank-2 spinor kernel. It is not the same statement as
$$
\dim_{\mathbb C}\mathcal B=6,
$$
which is the inactive complex rank used by the gauge-capacity ledger.

**Definition G.10.5a (Weyl Spinors).** A left-handed Weyl spinor is a field $\psi_L$ transforming under the $(\frac{1}{2}, 0)$ representation of SL(2,$\mathbb{C}$), corresponding to the fundamental representation of the first $\mathfrak{sl}(2,\mathbb{C})$ factor with the second acting trivially. A right-handed Weyl spinor $\psi_R$ transforms under $(0, \frac{1}{2})$. A Dirac spinor combines both: $\Psi = (\psi_L, \psi_R)^T$.

---

## G.10.6 The Spinor-Mass Correspondence

### G.10.6.1 Mass from Active Kernel Processing

**Theorem G.10.6 (Fundamental Fermion Mass from Active Kernel Processing).** Fundamental fermionic fields carrying non-zero rest mass necessarily transform as spinors under the emergent Lorentz group.

*Proof.*

**Step 1 (Mass from relational information).** By Theorem N.5 (Mass-Information Equivalence, Appendix N), rest mass for fundamental matter is determined by relational information content:
$$
m = \frac{\mathcal{I}_{\text{rel}}}{2\sqrt{8\varepsilon_0}} \cdot m_P \approx 0.212 \cdot \mathcal{I}_{\text{rel}} \cdot m_P \tag{G.10.12}
$$
where $\varepsilon_0=\ln2$ (Theorem 31), $m_P = \sqrt{\hbar c/G}$ is the Planck mass, and $\mathcal{I}_{\text{rel}}$ quantifies the system's predictive correlations with the network.

**Step 2 (Relational information requires active kernel processing).** The relational information $\mathcal{I}_{\text{rel}}$ for fundamental matter fields is maintained through the SPAP cycle, which necessarily involves processing on the active kernel $\mathcal{H}_a \cong \mathbb{C}^2$. The irreversible entropy cost $\varepsilon_0=\ln2$ per cycle (Theorem 31, Appendix J) is incurred on this 2-dimensional subsystem. By Corollary N.4.1 (Appendix N), the entropy flow rate maintaining $\mathcal{I}_{\text{rel}}$ is:
$$
\frac{d\mathcal{S}}{d\tau} = \frac{\mathcal{I}_{\text{rel}}}{2\tau_{\text{min}}} \tag{G.10.13}
$$
where $\tau_{\text{min}} = \sqrt{8\varepsilon_0} \cdot t_P$ is the temporal discretization scale (Theorem Q.6.1).

**Step 3 (Active kernel fields transform under SU(2)).** Fields encoding information on the active kernel $\mathcal{H}_a$ transform under the symmetry group SU(2) $\subset$ Spin(1,3) (Theorems G.10.3, G.10.5). By Corollary G.10.4.1, such fields are spinors.

**Step 4 (Conclusion for fundamental fermions).** Fundamental fermionic matter fields—those whose mass arises from direct participation in the SPAP-processed relational information—necessarily transform as spinors. ∎

**Remark G.10.3: Scope of Theorem G.10.6.** This theorem applies to *fundamental fermions* whose mass originates from the relational information mechanism of Theorem N.5. It does not apply to:
- **Composite particles** (e.g., protons, neutrons) whose mass arises predominantly from QCD binding energy
- **Scalar bosons** (e.g., the Higgs) whose mass arises from the scalar potential
- **Gauge bosons** which acquire mass through symmetry breaking mechanisms

The Higgs boson, for instance, is massive and spin-0; its mass arises from the Higgs potential $V(\phi) = -\mu^2|\phi|^2 + \lambda|\phi|^4$, not from direct active kernel processing in the sense of Theorem N.5.

### G.10.6.2 Gauge Boson Masslessness

**Corollary G.10.6.1 (Gauge Boson Masslessness for Unbroken Gauge Redundancy).** On an unbroken gauge-redundancy branch, a local mass term for a gauge connection is not PPI-admissible because it changes under response-equivalent gauge-frame relabelings. Therefore the gauge bosons of an unbroken gauge symmetry are massless before symmetry breaking.

*Proof.* Let $A_\mu$ be a gauge connection. For a nonabelian gauge group with local frame transformation $u(x)$, the connection transforms as
$$
A_\mu\mapsto A_\mu^u
=
uA_\mu u^{-1}
-\frac{i}{g_c}(\partial_\mu u)u^{-1}.
$$
A Proca-type local mass term has the schematic form
$$
\mathcal L_m=\frac12m^2\operatorname{tr}(A_\mu A^\mu).
$$
Under the transformation above,
$$
\operatorname{tr}(A_\mu^uA^{u\mu})
$$
contains derivative terms involving $(\partial_\mu u)u^{-1}$ and cross terms between $A_\mu$ and $(\partial_\mu u)u^{-1}$. These terms do not cancel for arbitrary local $u(x)$. Hence $\mathcal L_m$ is not invariant under the gauge redundancy unless $m=0$ or the gauge redundancy is no longer unbroken.

For an abelian gauge field, $A_\mu\mapsto A_\mu+\partial_\mu\theta/g_c$. Then
$$
A_\mu A^\mu
\mapsto
A_\mu A^\mu
+\frac{2}{g_c}A^\mu\partial_\mu\theta
+\frac{1}{g_c^2}\partial_\mu\theta\,\partial^\mu\theta,
$$
which is again not invariant for arbitrary local $\theta$ unless $m=0$ or an additional symmetry-breaking/Stueckelberg/Higgs structure is supplied.

PPI treats gauge transformations as response-equivalent frame relabelings (Theorem X.8d, established in Appendix G and used in Appendix P §C1; gauge transformations are predictive-frame redundancies, so the predictive functional descends to the gauge quotient). A term that changes under such a relabeling is not a well-defined physical response on the quotient. Therefore an unbroken gauge redundancy forbids a local gauge-boson mass term. Mass acquisition for $W^\pm$ and $Z$ occurs only after the electroweak symmetry-breaking branch supplies the Higgs vacuum structure; the photon remains massless on the unbroken electromagnetic branch. ∎

---

## G.10.7 The Spin-Statistics Connection

### G.10.7.1 Fermi-Dirac Statistics on the AQFT/Modular Spin-Statistics Branch

**Proposition G.10.7 (Fermionic Exchange Sign on the AQFT Spin-Statistics Branch).** Conditional on the Appendix F AQFT/modular spin-statistics branch, active-kernel spinor fields obey the fermionic exchange sign. For two identical one-particle spinor states,
$$
\psi(x_1,x_2)=-\psi(x_2,x_1),
$$
which is the finite-dimensional precursor of Fermi-Dirac statistics.

*Proof.* Corollary G.10.4.1 gives the spinor amplitude representation: a $2\pi$ spatial rotation lifts to $-I$ on the one-particle spinor amplitude. This spinor sign alone is not, by itself, a complete spin-statistics theorem. The exchange sign is fixed on the AQFT/modular branch of Appendix F, where locality, positive-energy structure, and the modular/DHR transport hypotheses identify the statistics operator of a transported sector with the geometric $2\pi$ rotation in the emergent Lorentz cover. The Appendix F spin-statistics result therefore gives the sign representation of the permutation group for half-integer spin sectors.

Equivalently, for a finite one-particle spinor space $V$, the fermionic two-particle sector is the exterior square
$$
\wedge^2V
=
\operatorname{span}\{v\wedge w:v,w\in V\},
$$
with
$$
v\wedge w=-w\wedge v.
$$
Thus exchanging the two identical spinor entries acts by the sign representation:
$$
\psi(x_1,x_2)=-\psi(x_2,x_1).
$$
The Pauli exclusion rule follows immediately because
$$
v\wedge v=0.
$$
Therefore the exchange sign is theorem-level on the Appendix F AQFT/modular spin-statistics branch and is compatible with the active-kernel spinor lift derived in this appendix. ∎

This result is the finite-dimensional active-kernel reading of the spin-statistics theorem recovered in the emergent AQFT framework (Theorem F.2 and the modular descent results of Appendix F).

**Remark G.10.2: PCE Interpretation of Spin-Statistics.** Proposition G.10.7 does not derive exchange antisymmetry from the $2\pi$ spinor sign alone. The sign is fixed by the AQFT/modular spin-statistics branch. PCE supplies the compression interpretation: once identical half-integer spin sectors are on the fermionic branch, the antisymmetric exterior algebra removes redundant same-state over-occupation and gives the Pauli-exclusion counting rule. The tangent-cell packing result of Theorem Z.10 is compatible with this logic but is not a substitute for the AQFT spin-statistics branch unless an additional finite-response map identifies identical-fermion occupation cells with QFI/Bures tangent cells.

**Remark G.10.2a (Configuration-Space Topology Does Not Replace Spin-Statistics).** For two unordered distinct points in $\mathbb R^3$,
$$
C_2(\mathbb R^3)
=
\frac{(\mathbb R^3\times\mathbb R^3)\setminus\Delta}{S_2}
\simeq
(\mathbb R^3\setminus\{0\})/\{\pm1\}
\simeq
\mathbb{RP}^2.
$$
Hence
$$
\pi_1(C_2(\mathbb R^3))\cong\mathbb Z_2.
$$
This topology permits two one-dimensional exchange characters,
$$
\chi_+(\tau)=+1,
\qquad
\chi_-(\tau)=-1.
$$
It does not by itself select the fermionic sign. The missing selection is precisely the spin-statistics bridge supplied on the Appendix F AQFT/modular branch, where locality, positive-energy/modular transport, and the statistics operator identify half-integer spin with the sign representation. Thus PPI single-valuedness and the $2\pi$ active-kernel spinor sign are compatible with fermionic statistics but do not replace the AQFT/modular gate.

---

## G.10.8 Summary: The Complete Derivation Chain

**Table G.10.1: Derivation Chain from SPAP to Spinor Structure**

| Step | Result | Origin | Status | Reference |
|:----:|:-------|:-------|:------:|:----------|
| 1 | $\iota^2 = \text{id}$, $\iota \neq \text{id}$ | SPAP logical structure | Derived | Theorem 10, Definition G.10.1, Lemma G.10.1a |
| 2 | $\varepsilon_0=\ln2$ on the attractor branch | Landauer + 2-to-1 merge | Derived | Theorem 31, Definition 15a, Lemma Z.2 |
| 3 | $a = 2$ | PPI-optimality on the attractor-saturating branch | Derived | Theorem Z.1 |
| 4 | $[U_\iota]^2=[I]$, with determinant-one lift $U_\iota=i\sigma_x\in SU(2)$ | Projective realization and amplitude lift | Derived | Theorem G.10.2 |
| 5 | $PU(2)\cong SO(3)$ on rays; $SU(2)$ as minimal amplitude lift | PPI phase quotient + PCE transitivity | Derived | Theorem G.10.3 |
| 6 | Double cover $SU(2)\to SO(3)$ | Lie theory | Recovered | Theorem G.10.4 |
| 7 | Spinor representation | Lift of $2\pi$ rotation acts as $-I$ | Recovered | Corollary G.10.4.1 |
| 8 | $Spin(1,3)\cong SL(2,\mathbb C)$ | Lorentzian extension | Conditional on Lorentzian branch | Theorem G.10.5 |
| 9 | Fundamental active-kernel matter spinorial | $\mathcal I_{\text{rel}}$ on active kernel | Branch-derived | Theorem G.10.6 |
| 10 | Unbroken gauge bosons massless | Gauge-redundancy quotient forbids Proca mass | Derived | Corollary G.10.6.1 |
| 11 | Fermi-Dirac exchange sign | AQFT/modular spin-statistics branch | Conditional theorem | Proposition G.10.7; Appendix F |

**Status Legend:**
- **Derived:** Novel result following from framework axioms
- **Recovered:** Known mathematical result reproduced within the framework

The complete derivation chain is:

$$
\boxed{
\text{SPAP} \xrightarrow{\mathbb{Z}_2} \varepsilon_0=\ln2 \xrightarrow{\text{PPI}} a = 2 \xrightarrow{\text{PCE}} \text{SU}(2) \xrightarrow{\text{time}} \text{Spin}(1,3) \xrightarrow{} \textbf{Spinors} \xrightarrow{\mathcal{I}_{\text{rel}}} \textbf{Mass}
} \tag{G.10.16}
$$

**Corollary G.10.8.1 (Unified Origin of Fermionic Matter).** The existence of massive fermionic matter is not a contingent feature of our universe but a direct consequence of self-referential predictive logic operating under finite resource constraints. The $\mathbb{Z}_2$ structure of SPAP, when physically instantiated via PPI and optimized under PCE, generates both the spinor representation (determining transformation properties) and the mass-information correspondence (determining dynamical properties for fundamental fermions).


**Note:** The spinor derivation (Section G.10) depends on Theorem N.5 from Appendix N for the mass-information correspondence. The logical chain from SPAP to spinors (Sections G.10.1–G.10.5) is self-contained within this appendix.

## G.11 Conclusion

This appendix has demonstrated how the Predictive Universe framework derives fundamental structures of modern physics from the Prediction Optimization Problem (POP, Axiom 1) and the Principle of Compression Efficiency (PCE, Definition 15):

1. **Quantum Probability:** The Born rule (Theorem G.1.7) and complex Hilbert space structure (Theorem G.1.8) emerge from PCE-enforced non-contextuality and Gleason's theorem, grounding quantum measurement in optimal predictive resource allocation.

2. **Gauge Structure:** U(1) electromagnetism arises as the minimal PCE-optimal mechanism for maintaining predictive coherence across local phase freedom (Section G.7). The full Standard Model gauge group $SU(3) \times SU(2) \times U(1)$ emerges from the thermodynamically optimal $\mathbb{C}^2 \oplus \mathbb{C}^6$ partition of the MPU Hilbert space (Section G.8).

3. **Spacetime Dimension:** $D = 4$ is uniquely selected from the mode-channel correspondence (Appendix Z) $M = K(D)$, where the 24 QFI interface modes match the kissing number $K(4) = 24$ (Theorems Z.10–Z.11).

4. **Three Generations:** Appendix R derives the minimal admissible value $N_g = 3$ from anomaly cancellation together with the CP-violation requirement in the modeled family-charge sector, and Proposition R.3.5.1a gives exact realization on the pre-flavor family-redundancy PPI branch. The $D_4$ triality orbit and $E_8$/Leech construction supply compatible three-fold scaffolds rather than independent proofs (Appendix R, Theorem R.3.4; Proposition R.3.5.1a; Proposition R.4.2).

5. **Fine-Structure Constant:** The Appendix Z U(1) sector gives the closed-form Thomson core $\alpha_{em,0}^{-1}=137.03609205522863\ldots$ and the certificate row $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$ (Theorems Z.24-Z.26; Definition Z.27.11a; Theorem Z.27.11j.1), with no continuous fit parameter in the core expression. The hypercharge-recoil operator-realization gate is conditional on the accepted finite Ward residual certificate of Definition Z.27.11k.12 and gives $\alpha^{-1}_{YR\perp}=137.03599917753023\ldots$ only on that accepted branch.

6. **Unified Probability Measures:** Quantum (Born), thermal (Boltzmann), and gravitational (Unruh-Hawking) probability distributions arise from a common mechanism—ND-RID equilibration to Gibbs fixed points under PCE optimization (Section G.1.9).

These results ground the quantum measurement framework, gauge interactions, spacetime dimensionality, and fundamental constants in the unified logic and resource economics of prediction. Quantitative predictions are further constrained by the alphabet identities of Appendix W.

---

*Note:* For $d = 2$, the Born rule follows either from embedding within the MPU's $d_0 \geq 8$ space or from decision-theoretic arguments [Deutsch 1999]; we rely primarily on the Gleason route given $d_0 \geq 8$ (Theorem 23).
