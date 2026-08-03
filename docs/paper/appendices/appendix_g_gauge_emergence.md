# Appendix G: Emergence of Quantum Weights and Gauge Structure

**G.0 Introduction**

This appendix explains how the framework connects quantum outcome weights, gauge structure, matter, and spacetime dimension. Each connection depends on its own stated assumptions.

**Technical ledger.**

This appendix assembles typed closure results. An accepted sharp homogeneous carrier certificate $\mathfrak C_{\mathrm{car}}$ supplies the hypotheses under which Theorem G.1.8 selects complex matrix quantum theory from the finite Jordan alternatives. On that carrier, normalized nonnegative additive projector or effect probabilities give the trace/Born form by the Gleason--Busch selector. Registered local-frame, horizontal-transport, and response maps give a principal gauge connection, with $U(1)$ the single-phase-fiber case. The Standard Model gauge algebra is selected within the positive-marginal capacity-saturating block-frame class, while its matter/EWSB realization uses the anomaly and matter certificates stated in Section G.8; the $D=4$ conclusion comes independently from the channel-complete Bures tangent-cell contract. Sections G.1.9 and G.9 record the modular-representation and rate-level ledgers, and Section G.10 records the conditional projective-lift and spinor branch. POP/PCE supplies the explicit quotient, no-surplus, and optimization steps within these declared classes, so every conclusion retains the finite premises that make it a theorem.

The analysis takes place on the emergent Lorentzian manifold $(M,g_{\mu\nu})$ whose existence is justified conditionally in Section 11 and Appendix D. The metric signature is $(-,+,\ldots,+)$, $g:=\det(g_{\mu\nu})$, and natural units $\hbar=c=k_B=1$ are used unless stated otherwise.

**G.1 Born Weights from Cost Optimisation**

The probabilistic structure of quantum mechanics, encapsulated by the Born rule, is reconstructed here through three separate steps: PPI/PCE removes response-null context labels, finite-response payoff refinement gives additivity on the quotient ledger, and the Gleason-Busch selector fixes the unique trace-form measure on the emergent Hilbert space structure of the MPU network.

**G.1.1 Predictive Partitions and Cost Frame Functions**

Let $\mathcal H$ be the complex Hilbert carrier selected by Theorem G.1.8 on an accepted certificate $\mathfrak C_{\mathrm{car}}$. Physical interactions ('Evolve', Definition 27) allow the system to gain information regarding potential outcomes, represented mathematically by effects—positive semi-definite operators $E$ on $\mathcal{H}$ satisfying $0 \le E \le \mathbf{1}$. A complete set of mutually exclusive outcomes corresponds to a predictive partition, a set of effects $\mathcal{E}=\{E_i\}$ such that $\sum_i E_i = \mathbf{1}$. A special case is a partition by orthogonal projectors $\mathcal{P}=\{P_i\}$, where $P_i^2 = P_i$, $P_i P_j = \delta_{ij} P_i$, and $\sum_i P_i = \mathbf{1}$. Each projector $P_i$ corresponds to a distinct, potential outcome branch into which the system state might resolve.

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

*Proof.* Let $P$ be realized in contexts $\Pi_1$ and $\Pi_2$ with the same induced payoff problem. By the stated refinement-invariance hypothesis, replacing $\Pi_1$ by $\Pi_2$ cannot change the admissible value assigned to $P$. Therefore
$$
f(P\mid\Pi_1)=f(P\mid\Pi_2).
$$
Since the pair of contexts was arbitrary, the assignment depends only on $P$. ∎

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

**Theorem G.1.3 (Born Selector for Finite-Dimensional Cost Frame Functions).**
Let $\mathcal H$ be a finite-dimensional complex Hilbert space with $3\le\dim\mathcal H<\infty$. Any normalized, nonnegative, non-contextual, finitely additive frame function $f$ on orthogonal projectors has the form
$$
f(P)=\mathrm{tr}(\rho P)
\quad \text{(G.1.3)}
$$
for a unique positive semidefinite operator $\rho$ with $\mathrm{tr}(\rho)=1$. If the predictive state is a pure ray $[\psi]$ with $f(P_\psi)=1$, then $\rho=P_\psi=|\psi\rangle\langle\psi|$ and, for every rank-one outcome $P_i=|\psi_i\rangle\langle\psi_i|$,
$$
f(P_i)=|\langle\psi_i|\psi\rangle|^2.
$$

*Proof.* In finite dimension, finite orthogonal additivity is the frame-function hypothesis of Gleason's theorem [Gleason 1957], which gives a positive trace-one operator $\rho$ with $f(P)=\operatorname{tr}(\rho P)$. If another operator $\sigma$ gives the same values, then $\langle\phi,(\rho-\sigma)\phi\rangle=0$ for every unit vector $\phi$. The complex polarization identity gives every matrix element of $\rho-\sigma$ as a linear combination of these quadratic forms, so $\rho=\sigma$. If $f(P_\psi)=1$, additivity gives $f(I-P_\psi)=0$. Hence
$$
0=\operatorname{tr}(\rho(I-P_\psi))
=\operatorname{tr}(\rho^{1/2}(I-P_\psi)\rho^{1/2}),
$$
and the positive operator under the trace is zero. Thus $\operatorname{supp}\rho\subseteq\operatorname{Ran}P_\psi$. This range is one-dimensional and $\operatorname{tr}\rho=1$, so $\rho=P_\psi$. The rank-one formula follows by taking the trace. ∎

The operator $\rho$ is therefore the density operator representing the MPU's predictive state; the trace rule fixes all projective-event weights $f(P)$, and the pure-ray case fixes the squared-amplitude measure uniquely.

**G.1.4 Emergence of the Born Weights**

The "Evolve" process yields discrete realized outcomes for every projective predictive partition $\{P_i\}$. Assume the probability-calibration bridge that the physical outcome law used to score POP decisions is the normalized event-weight ledger of Definition G.1.1:
$$
p_i:=f(P_i).
$$
This bridge is an operational hypothesis relating decision weights to realized outcome probabilities. Theorem G.1.3 then supplies a unique density operator $\rho_{phys}$ such that $f(P)=\mathrm{tr}(\rho_{phys}P)$ for every projector $P$.

**Theorem G.1.4 (Born Form under Probability-Weight Calibration).** Let $\{P_i\}$ be a projective predictive partition, and assume the probability-calibration bridge $p_i=f(P_i)$. Then
$$
p_i = f(P_i) = \mathrm{tr}(\rho_{phys}P_i)
\quad \text{(G.1.4)}
$$
for the unique density operator supplied by Theorem G.1.3. If $\rho_{phys}=|\psi\rangle\langle\psi|$ and $P_i=|\psi_i\rangle\langle\psi_i|$ has rank one, then
$$
p_i = \langle \psi|P_i|\psi\rangle = |\langle \psi_i|\psi\rangle|^2
\quad \text{(G.1.5)}.
$$

**Proof.** The calibration hypothesis gives $p_i=f(P_i)$. Theorem G.1.3 gives $f(P_i)=\operatorname{tr}(\rho_{phys}P_i)$, proving (G.1.4). In the pure rank-one case,
$$
\operatorname{tr}(|\psi\rangle\langle\psi|\,|\psi_i\rangle\langle\psi_i|)
=
\langle\psi_i|\psi\rangle\langle\psi|\psi_i\rangle
=
|\langle\psi_i|\psi\rangle|^2,
$$
which proves (G.1.5). ∎

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

The derivation shows that the Born rule is not an ad-hoc postulate. It is the unique probability ledger left after three independent filters are imposed on the Hilbert branch: response-null context labels are quotient labels, payoff-refinement consistency gives finite additivity, and Theorem G.1.3 selects the trace-form frame function. The quadratic dependence on amplitudes ($|\langle i|\psi\rangle|^2$) is not inserted as a separate rule; it is the pure-ray specialization of $f(P)=\operatorname{tr}(\rho P)$. SPAP supplies only the diagonal obstruction on its stated class; it neither makes a probabilistic ledger necessary nor supplies the selector conditions, which come from the PPI/PCE quotient and the carrier certificate $\mathfrak C_{\mathrm{car}}$.

**G.1.7 Summary Theorem**

The usual quantum outcome weights follow when event weights are additive, independent of measurement context, and calibrated as probabilities.

**Technical ledger.**

**Theorem G.1.7 (Born Rule from Quotient Additivity and the Born Selector).** In the PU framework, POP assigns to each sharp event projector $P$ a predictive weight $f(P)$ that is normalized, non-negative, additive under orthogonal refinement, and non-contextual on the PPI/PCE quotient (Definition G.1.1; Lemma G.1.1b; Lemma G.1.1ba; Section 8, Theorem 8.2 and Lemma 8.2a). By the Born selector theorem (Theorem G.1.3; Section 8, Theorem 8.3), $f$ has the unique trace form $f(P)=\operatorname{Tr}(\rho_{phys}P)$. On the separate probability-calibration branch of Theorem G.1.4, equivalently the registered actualization/instrument branch of Principle 8.0c and Theorem 8.0d, these trace weights are the single-run outcome probabilities of "Evolve"; the pure-state rank-one probability is $p_i=|\langle\psi_i|\psi\rangle|^2$. Frequency convergence is an additional repeated-trial statement and requires an i.i.d., exchangeable, or stationary-ergodic certificate.

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

The existence of a well-behaved cost functional satisfying the premises of Theorem G.1.3 leads to the Born rule after the carrier/effect structure is fixed. The carrier itself is a separate finite-response gate: PPI response equivalence and PCE no-surplus selection exclude some alternatives, but they do not by themselves prove cone self-duality, homogeneous reversible steering, or the full Jordan-to-complex-Hilbert reduction.

**Definition G.1.8a (Sharp Homogeneous Carrier Certificate $\mathfrak C_{\mathrm{car}}$).** A carrier-reconstruction certificate is a finite record
$$
\mathfrak C_{\mathrm{car}}
=
(\Omega_+,E_+,\langle\cdot,\cdot\rangle_{\mathrm{PP}},\mathcal G_{\mathrm{rev}},\mathcal T_{\mathrm{loc}},\mathcal P_{U(1)},\mathcal J_{\mathrm{excl}},\text{forward lock})
$$
where $\Omega_+$ is the retained state cone after the PPI quotient, $E_+$ is the retained effect cone, $\langle\cdot,\cdot\rangle_{\mathrm{PP}}$ is the predictive-performance pairing, and the following entries are certified before comparison:

1. **Sharp self-duality.** The map from a retained sharp state to its response-maximal verification effect extends to an order isomorphism $\Omega_+\simeq E_+$ under $\langle\cdot,\cdot\rangle_{\mathrm{PP}}$.
2. **Homogeneous reversible viability.** The reversible, cost-bounded steering group $\mathcal G_{\mathrm{rev}}$ acts transitively on the interior of $\Omega_+$.
3. **Compositional tomography.** $\mathcal T_{\mathrm{loc}}$ records local tomography for nontrivial composites in the retained protocol family.
4. **Connected phase transport.** $\mathcal P_{U(1)}$ records the minimal connected abelian phase transport used by the gauge sector.
5. **Jordan exclusion.** $\mathcal J_{\mathrm{excl}}$ records finite response failures or surplus-cost gaps excluding non-complex Euclidean-Jordan branches not removed by items 3 and 4, including spin-factor and exceptional branches when they are otherwise admissible.

SPAP supplies a diagonal obstruction on its stated class. A non-simplex conclusion requires the separately registered incompatible sharp-observable pair of Corollary G.1.10, and complex-Hilbert selection additionally requires Definition G.1.8a and Theorem G.1.8.

**Theorem G.1.8 (Complex Hilbert-Space Uniqueness on the Carrier-Certified Branch).** On a retained finite-response branch carrying $\mathfrak C_{\mathrm{car}}$, the predictive state cone is the cone of squares of a finite-dimensional Euclidean Jordan algebra. If the same certificate includes the local-tomography, connected-phase, and Jordan-exclusion records of Definition G.1.8a, the retained carrier is operationally equivalent to the complex Hilbert branch. Among the real, complex, and quaternionic Hilbert-space branches, the complex branch is uniquely selected by compositional closure, local tomography, connected phase transport, and PCE removal of surplus phase redundancy.

*Proof.* The sharp self-duality and homogeneous reversible-viability entries of $\mathfrak C_{\mathrm{car}}$ give a finite-dimensional homogeneous self-dual ordered cone. By the Koecher–Vinberg reconstruction theorem, such a cone is the cone of squares of a Euclidean Jordan algebra. The certificate therefore supplies the missing carrier step rather than deriving it from PPI/PCE alone.

The remaining scalar Hilbert alternatives are $\mathbb R$, $\mathbb C$, and $\mathbb H$. For a finite $n$-dimensional Hilbert space, the real parameter counts of normalized density data are
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
Thus the real and quaternionic tomography identities hold only for trivial composites with $m=1$ or $n=1$, and fail for every nontrivial composite with $m,n\ge2$.

The phase-redundancy condition gives the same selection independently. The real branch has only the disconnected scalar phase group $\{\pm1\}$ and cannot supply the connected phase transport used in Sections G.2-G.7. The quaternionic branch has scalar phase group $Sp(1)\cong SU(2)$, a three-dimensional nonabelian redundancy. If the extra quaternionic generators change finite protocol responses, they introduce additional gauge content beyond the minimal MPU branch. If they do not change finite protocol responses, Corollary P.6.1b.8 removes them as response-null surplus. Spin-factor, exceptional, or other Euclidean-Jordan branches are excluded only by the explicit $\mathcal J_{\mathrm{excl}}$ record; they are not eliminated by the field-counting calculation alone. The complex branch supplies exactly $U(1)$, the minimal connected abelian scalar phase group compatible with the active kernel. ∎

**Corollary G.1.9 (Alternative-Carrier Exclusion on the Fundamental Branch).** Under Principle 8.0b, the retained fundamental MPU carrier is operationally equivalent to a complex matrix-algebra state space. The alternative classes are excluded as follows:

1. finite simplices fail the retained incompatible-sharp-effect witness by Corollary G.1.10;
2. cones that are not homogeneous and self-dual fail the first two entries of $\mathfrak C_{\mathrm{car}}$;
3. real and quaternionic matrix branches fail the nontrivial-composite local-tomography identity, and the real branch also lacks nontrivial connected scalar phase transport;
4. spin-factor, exceptional, and remaining Euclidean-Jordan branches fail the finite response or strict-surplus records in $\mathcal J_{\mathrm{excl}}$.

*Proof.* Item 1 is Corollary G.1.10. Sharp self-duality and homogeneous reversible viability are explicit requirements of Principle 8.0b and Definition G.1.8a, proving item 2. The parameter-count calculation in Theorem G.1.8 proves item 3 for every composite with scalar dimensions $m,n\ge2$. The Jordan-exclusion entry of the same accepted certificate is precisely the finite forward record required in item 4. After these exclusions, Theorem G.1.8 leaves the complex matrix branch. ∎

**Corollary G.1.10 (Non-Simplex State Space on the Fundamental Carrier Branch).** The retained state space of a fundamental MPU satisfying Principle 8.0b is not a simplex.

*Proof.* Let a finite simplex have vertices $v_1,\ldots,v_n$. Binary effects $e,f$ are determined by $e_i=e(v_i)$ and $f_i=f(v_i)$ in $[0,1]$. Define
$$
g_{ab}(v_i)
=
[e_i]^a[1-e_i]^{1-a}[f_i]^b[1-f_i]^{1-b},
\qquad a,b\in\{0,1\},
$$
with the convention $t^0=1$, and extend affinely. These effects are nonnegative and satisfy
$$
\sum_{a,b}g_{ab}=1,
\qquad
\sum_b g_{1b}=e,
\qquad
\sum_a g_{a1}=f.
$$
Thus every pair of binary effects on a simplex is jointly measurable, so no simplex carries a retained incompatible pair of sharp verification effects. Independently, the cone of a finite simplex is the cone of squares of the Jordan algebra $\mathbb R^n$, which for $n\ge2$ is a direct sum of $n$ proper ideals; item (vi) of Principle 8.0b certifies simplicity and irreducibility of the retained carrier and therefore excludes it. ∎

**Remark G.1.10a (Logical and Physical Steps).** SPAP alone does not exclude a classical simplex. The non-simplex conclusion uses Principle 8.0b's simplicity and irreducibility record, equivalently any retained pair of sharp verification effects that is not jointly measurable; Theorem G.1.8 then uses the remaining carrier certificate to select the complex branch.

**Remark G.1.10b (Connection to the Hilbert Formalism).** On the selected complex carrier, projective sharp observables are jointly measurable exactly when they commute. A certified incompatible pair therefore has noncommuting representatives.

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

**Theorem G.1.11d (Minimal Purification Gauge and Bures Descent).** Let $\mathcal H$ be finite-dimensional and let
$$
\mathcal D_r(\mathcal H)
=
\{\rho\succeq0:\operatorname{tr}\rho=1,\ \operatorname{rank}\rho=r\}.
$$
Define the minimal amplitude space
$$
\mathcal P_r(\mathcal H)
=
\{w:\mathbb C^r\to\mathcal H:\operatorname{rank}w=r,\ \operatorname{tr}(ww^\dagger)=1\},
\qquad
\pi(w)=ww^\dagger.
\tag{G.1.11d.1}
$$
Then:

1. $\pi:\mathcal P_r(\mathcal H)\to\mathcal D_r(\mathcal H)$ is a principal $U(r)$ bundle under the free right action $w\mapsto wU$. In particular,
$$
ww^\dagger=w'w'^\dagger
\quad\Longleftrightarrow\quad
w'=wU
\text{ for a unique }U\in U(r).
\tag{G.1.11d.2}
$$
2. Every purification of $\rho\in\mathcal D_r(\mathcal H)$ has ancillary Schmidt rank at least $r$. The amplitudes in $\pi^{-1}(\rho)$ are exactly the purifications with minimal ancillary dimension, up to the $U(r)$ action.
3. With the real Hilbert--Schmidt metric $\langle X,Y\rangle_{\mathrm{HS}}=\operatorname{Re}\operatorname{tr}(X^\dagger Y)$, the vertical tangent vectors are $w\xi$ with $\xi^\dagger=-\xi$. The unique minimum-norm lift of a base tangent $\dot\rho$ is horizontal and satisfies
$$
w^\dagger\dot w=\dot w^\dagger w,
\qquad
\dot\rho=\dot w w^\dagger+w\dot w^\dagger.
\tag{G.1.11d.3}
$$
The quotient metric is the Bures metric, with the convention
$$
g_{\mathrm B,\rho}(\dot\rho,\dot\rho)
=
\min_{\dot w:\,D\pi_w(\dot w)=\dot\rho}
\operatorname{tr}(\dot w^\dagger\dot w)
=
\frac12\sum_{i,j:\lambda_i+\lambda_j>0}
\frac{|\dot\rho_{ij}|^2}{\lambda_i+\lambda_j},
\tag{G.1.11d.4}
$$
where $\rho=\sum_i\lambda_i|i\rangle\!\langle i|$.
4. If a PCE ancillary cost $C_{\mathrm{anc}}(m)$ is strictly increasing in ancillary dimension $m$, then every $m>r$ purification that has only system-effect responses is response-null surplus. The PPI quotient followed by PCE therefore selects the rank-$r$ bundle (G.1.11d.1).

*Proof.* For $w\in\pi^{-1}(\rho)$, polar decomposition gives $w=\sqrt\rho\,V_w$, where $V_w:\mathbb C^r\to\operatorname{supp}\rho$ is unitary onto the support. If $w'$ has the same image density, then $w'=\sqrt\rho\,V_{w'}=w(V_w^\dagger V_{w'})$, proving (G.1.11d.2), freeness, and transitivity on each fiber. Properness follows from compactness of $U(r)$, so the fixed-rank stratum carries the stated principal bundle.

The reduced density of a bipartite pure state has rank equal to its Schmidt rank. Hence an ancilla purifying rank-$r$ $\rho$ has dimension at least $r$, and equality is represented by an amplitude $w$ after choosing an ancillary basis.

The tangent to $wU(r)$ is $w\xi$ with $\xi$ anti-Hermitian. Orthogonality of $\dot w$ to every $w\xi$ is equivalent to $w^\dagger\dot w$ being Hermitian, which is (G.1.11d.3). Subtracting the vertical projection from any lift preserves $D\pi_w(\dot w)$ and strictly decreases its norm unless the lift is horizontal. In an eigenbasis of $\rho$, solving the resulting Sylvester equation gives (G.1.11d.4). Finally, every system effect $E$ has expectation $\operatorname{tr}(Eww^\dagger)$, so ancillary directions beyond Schmidt support change no accepted system response. PPI identifies them and strict PCE cost removes them. ∎

**Corollary G.1.11d.1 (Gauge-Scope Boundary).** The group $U(r)$ in Theorem G.1.11d is purification gauge: it acts inside one system-state fiber. It is not an internal particle gauge group, spacetime gauge group, or new carrier unless an independent finite protocol makes its ancillary reference response-active. Uhlmann holonomy is likewise PPI-null for system-only protocols and becomes observable only relative to an accepted coherent reference that survives the response quotient.

**Corollary G.1.11d.2 (Rank-Stratum Boundary).** Equations (G.1.11d.1)--(G.1.11d.4) hold on each fixed-rank stratum. Rank-changing paths meet a stratified boundary; they are treated by support restriction or a continuous limiting prescription and are not licensed as one smooth principal bundle through the rank change.

**Relation to Corollary X.8a.2c.** Corollary X.8a.2c supplies the prior PCE selection of the Bures/SLD metric. Theorem G.1.11d does not duplicate that selector: it proves the minimal-purification principal bundle, its horizontal realization of the selected metric, and the response-null status of surplus ancillary dimensions.

**Quantum-reconstruction certificate boundary.** A reconstruction assembly must keep its hypotheses typed separately. A finite-dimensional homogeneous self-dual cone yields a Euclidean Jordan algebra only after homogeneity and self-duality are accepted. Selecting complex matrix quantum theory additionally requires a composition rule, local tomography, and explicit exclusion of the real, quaternionic, spin-factor, and exceptional alternatives. The Born rule requires the effect or projection hypotheses of the applicable Gleason--Busch result. Wigner implementation requires preservation of transition probabilities, not merely a continuous transitive action. The value $d_0=8$, logical indeterminacy, and SPAP do not by themselves discharge these entries. Consequently the existing Hilbert/Born branch may consume an accepted reconstruction certificate, but the certificate assumptions must not be relabeled as consequences of $d_0=8$ alone.

**G.2 Local Phase Freedom and Emergence of Gauge Structure**

On an accepted $\mathfrak C_{\mathrm{car}}$, Theorem G.1.8 supplies the complex Hilbert carrier; on the normalized additive probability ledger, Theorems G.1.3 and G.1.11b supply the Born representation. We now construct gauge structure from the separate registered local-frame and transport data.

**Proposition G.M1 (Conditional Gauge Bundle from Registered Local Frame Data).** Let $\mathcal P\to M$ be a smooth, locally trivial bundle of admissible local predictive frames. Assume:

1. a compact Lie group $G$ acts smoothly, freely, and transitively on every fiber of $\mathcal P$;
2. the registered PCE transport functional supplies a smooth $G$-equivariant horizontal complement to the vertical tangent bundle;
3. the inactive-sector certificate of Theorem G.8.4b supplies the ordered decomposition
$$
\mathcal H_x^{(int)}\cong\mathbb C^3\oplus\mathbb C^2\oplus\mathbb C^1;
$$
4. an injective gauge-response map identifies the retained gauge generators with an isotropic interface subspace of Theorem G.8.2e, and the retained algebra contains the full blockwise $\mathfrak{su}(3)\oplus\mathfrak{su}(2)$ action together with one specified determinant-compatible abelian character.

Then $\mathcal P$ is a principal $G$-bundle. The registered horizontal distribution is a principal connection $A$, and its curvature is
$$
F=dA+A\wedge A.
$$
On the block-frame branch of hypotheses 3 and 4, the retained gauge algebra is
$$
\mathfrak g
=
\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
\qquad
\dim\mathfrak g=8+3+1=12.
$$

*Proof.* Smooth local triviality together with the free and transitive fiber action is the defining torsor condition for a principal $G$-bundle. A smooth $G$-equivariant horizontal complement is an Ehresmann principal connection, whose curvature in a local trivialization is $F=dA+A\wedge A$. The blockwise special-unitary factors contribute $8+3=11$ generators. Hypothesis 4 supplies one retained abelian character and an injective isotropic image; Theorem G.8.2e bounds that image by $12$, so the displayed twelve-dimensional direct sum is the retained algebra on this certificate. ∎

For a one-dimensional complex predictive fiber, normalized local Born weights are unchanged by a constant phase. The local statement used below requires the independently registered rank-one phase-frame certificate: each point $x$ carries a Hermitian complex line $L_x$, admissible frame changes act freely by $U(1)$, and all accepted point-local effects descend to the ray. On that certificate, choose a compact phase coordinate $\theta(x)\in\mathbb R/2\pi\mathbb Z$ and a nonzero character weight $q\in\mathbb Z\setminus\{0\}$. Independent local frame choices act as
$$
|\Psi(x)\rangle \longrightarrow |\Psi'(x)\rangle=e^{\,iq\theta(x)}|\Psi(x)\rangle
\quad \text{(G.2.1)}
$$
and define the rank-one $U(1)$ gauge branch. Here $q$ is the dimensionless integer character; the physical coupling scale is carried by the normalization of the connection and its kinetic action. The admitted character lattice and its comparison with measured charges require the global bundle or representation-lattice certificate stated in Section G.4. Point-local ray invariance alone does not create independent local frames, a connection, or a physical charge normalization.

**G.3 The Predictive-Coherence Problem**

Effective prediction across the MPU network (required by POP, Axiom 1) necessitates comparing predictive states (amplitudes) at different spacetime points, say $x$ and $x+dx$. This comparison is essential for calculating gradients, predicting propagation, and maintaining coherent superposition across the network. However, the local gauge freedom (Equation G.2.1) obstructs simple comparison using the standard partial derivative $\partial_\mu$. If we transform $|\Psi(x)\rangle \to e^{iq\theta(x)}|\Psi(x)\rangle$, the derivative transforms as:
$$
\partial_{\mu}|\Psi(x)\rangle \longrightarrow \partial_{\mu}(e^{iq\theta(x)}|\Psi(x)\rangle) = e^{iq\theta(x)} \left( \partial_{\mu}|\Psi(x)\rangle + iq(\partial_{\mu}\theta(x))|\Psi(x)\rangle \right)
\quad \text{(G.2.2)}
$$
The derivative transforms inhomogeneously (acquiring the extra $iq(\partial_{\mu}\theta)|\Psi\rangle$ term), making the difference $\partial_{\mu}|\Psi(x)\rangle dx^\mu$ depend on the arbitrary local phase choices $\theta(x)$.

An implementation that explicitly stores relative-phase data for every unordered pair of $N$ MPUs uses $\binom N2=\Theta(N^2)$ entries. On a bounded-degree interaction graph, an edge-local transporter representation uses one datum per edge and therefore $O(|E|)=O(N)$ entries. This comparison shows that PCE favors the edge-local representation over the specified all-pairs table for sufficiently large $N$. It does not exclude every other $O(N)$ local representation; the structural uniqueness claim is addressed under the explicit hypotheses of Theorem G.3a.

### G.3.1 Connection–Compression Theorem

The super-extensive comparison above can be sharpened into a structural statement about exact local coherence transport. Under the following additional locality, complex-linearity, exactness, smoothness, and quadratic comparison premises, a gauge connection is the unique edge-local exact representation within the declared comparison class, and the covariant derivative is its continuum limit. PCE further favors this edge-local representation over nonlocal pairwise coherence tables because the former updates with edge complexity while the latter updates with pair complexity.

Let $\mathcal G=(V,E)$ be a finite connected interaction graph of MPUs with bounded maximum degree $d_{\max}$, supplied by the locality postulate of Section 11.3 together with the finite MPU spacing $\delta$ (Appendix Q). Each vertex $v\in V$ carries a one-dimensional complex predictive fiber $L_v$ equipped with a Hermitian inner product and a coarse-grained predictive amplitude $\psi_v\in L_v$. The restriction to rank-one fibers corresponds to the abelian $U(1)$ sector; the non-abelian extension is stated in Corollary G.6b.1 below.

**Assumption G.3.1** (Registered compact local frames). Each vertex carries an independently chosen compact phase frame $\theta_v\in\mathbb R/2\pi\mathbb Z$, and the retained line transforms through a fixed nonzero character $q\in\mathbb Z\setminus\{0\}$:
$$
\psi_v\mapsto e^{iq\theta_v}\psi_v.
$$
Point-local effects descend to rays, while the independent frame bundle and its edge comparison are registered data. This is Equation (G.2.1) specialized to site values.

**Assumption G.3.2** (Edge-locality of propagation cost). The propagation component of the PCE potential decomposes as
$$
V_{\mathrm{prop}} \;=\; \sum_{(u,v)\in E} Q_{uv},
$$
where each $Q_{uv}$ depends only on $\psi_u,\psi_v$ and auxiliary data supported on the edge $(u,v)$ (Definition D.1).

**Assumption G.3.3** (Quadratic leading-order coherence cost). In a neighborhood of coherent configurations, the retained leading term of $Q_{uv}$ is a Hermitian quadratic form on $(\psi_u,\psi_v)$ after transport, and higher-order terms are neglected in Theorem G.3a. The Born-rule and Fisher-information inputs motivate this leading quadratic term but do not eliminate higher-order gauge-invariant corrections.

**Assumption G.3.4** (Complex-linear exact comparison). Every edge identification used by the comparison is a complex-linear Hermitian-line isomorphism. Its cost obeys
$$
Q_{uv}=0\quad\Longleftrightarrow\quad\psi_u\text{ and }\psi_v\text{ are perfectly coherent.}
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

*Proof.* Part (a). The states $\psi_u\in L_u$ and $\psi_v\in L_v$ inhabit distinct fibers. Any edge-local cost $Q_{uv}$ that depends on both endpoints requires an identification $U_{uv}:L_v\to L_u$; without such a map the symbol "$\psi_u$ compared with $\psi_v$" carries no coordinate-free meaning. By Assumption G.3.4 the identification is complex-linear and Hermitian-norm preserving. It is therefore unitary; between one-dimensional Hermitian complex lines it is multiplication by a unit-modulus complex number in chosen local frames, so $U_{uv}\in U(1)$. Norm preservation without complex-linearity would not exclude antiunitary maps. Under the rephasings $\psi_u\mapsto e^{iq\theta_u}\psi_u$ and $\psi_v\mapsto e^{iq\theta_v}\psi_v$, the transported state $U_{uv}\psi_v$ must land in the rephased fiber $e^{iq\theta_u}L_u$, forcing (G.3.4). Conversely, any such transporters render $|\psi_u - U_{uv}\psi_v|^2$ invariant under local rephasings and define an exact edge-local comparison.

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

On the rank-one $U(1)$ branch satisfying Assumptions G.3.1–G.3.5 and the smooth transporter expansion of Corollary G.3a.1, the scalar part of Definition G.4.1 is the unique first-order comparison operator furnished by that corollary. The non-abelian and spin-connection terms require their separately stated continuum and representation branches.

**G.4 Emergent Connection and Covariant Derivative**

Reliable comparison of predictive states across spacetime points despite the local phase freedom requires a transport mechanism. Introducing a connection $A$ with curvature $F=dA+A\wedge A$, on a regular Lorentzian, parity-even/CP-even, single-$U(1)$, two-derivative branch with no kinetic mixing and a fixed topological sector, the local quadratic gauge kinetic term is unique up to normalization and total derivatives [Yang & Mills 1954; Utiyama 1956]; on nontrivial bundles $F\wedge F$ is a separate, globally relevant topological term. The retained representative is
$$
\mathcal L_{\mathrm{YM}}=\tfrac12\,\kappa\,\mathrm{Tr}(F_{\mu\nu}F^{\mu\nu}).
$$
Introducing a dynamical connection field $A_\mu(x)$ that transforms appropriately under the gauge transformation provides such a mechanism.

**Definition G.4.1 (Covariant Derivative $D_\mu$).**
A covariant derivative $D_\mu$ is defined to incorporate the connection $A_\mu$ such that $D_\mu \Psi$ transforms homogeneously (like $\Psi$) under the gauge transformation (Equation G.2.1). On the accepted regular Lorentzian continuum branch of Section 11 (Corollary 46a and Appendix O), fields with spin also require the geometric spin connection $\Omega_\mu$ from Theorem 48, subject to its stated spin/tangential-structure gate. For scalar fields (the simplest case for illustration), $\Omega_\mu$ acts trivially. The covariant derivative is:
$$
D_{\mu}\Psi(x) = (\partial_{\mu} + \Omega_{\mu} + iqA_{\mu}(x))\Psi(x)
\quad \text{(G.4.1)}
$$
To ensure $D_\mu \Psi$ transforms as $D_\mu \Psi \mapsto e^{iq\theta(x)} D_\mu \Psi$ when $\Psi \mapsto e^{iq\theta(x)}\Psi$ and the connection field transforms $A_\mu \mapsto A'_\mu$, we must satisfy:
$$
(\partial_\mu + \Omega_\mu + iqA'_\mu)(e^{iq\theta(x)}\Psi(x)) = e^{iq\theta(x)}(\partial_\mu + \Omega_\mu + iqA_\mu(x))\Psi(x)
$$
Expanding by the Leibniz rule and cancelling the common derivative and spin-connection terms gives, for every local test section $\Psi$,
$$
iq\bigl(\partial_\mu\theta+A'_\mu-A_\mu\bigr)\Psi=0.
$$
For $q\ne0$, equality of these multiplication operators implies
$$
A'_\mu=A_\mu-\partial_\mu\theta.
\quad \text{(G.4.2)}
$$
The identity is an operator relation and therefore also holds at points where a particular field configuration vanishes.
(Note: Standard convention uses charge $e$ and defines $D_\mu = \partial_\mu - ieA_\mu$, leading to $A'_\mu = A_\mu + (1/e)\partial_\mu\theta$. The physics is identical, differing only by conventions for charge sign and coupling constant placement in the covariant derivative. For this derivation, $iqA_\mu$ is used directly).

**G.4.1 Loop Holonomy and the Holonomy–Flatness Theorem**

**Definition G.4.2 (Loop Holonomy).** For a closed loop $\gamma=(v_0,v_1,\dots,v_n=v_0)$ on $\mathcal G$, the holonomy along $\gamma$ is
$$
H_\gamma \;:=\; U_{v_0 v_1}\,U_{v_1 v_2}\cdots U_{v_{n-1}v_n} \;\in\; U(1).\tag{G.4.3}
$$
$H_\gamma$ is gauge-invariant: under local rephasings obeying (G.3.4), consecutive phase factors $e^{-iq\theta_{v_k}}$ and $e^{iq\theta_{v_k}}$ cancel, leaving only the endpoint phases, which cancel for a closed loop.

**Theorem G.4a (Holonomy–Flatness).** Let $\{U_{uv}\}$ be a $U(1)$ transporter field on a connected region. For part (b), let $A\in C^3$ and assume that every positively oriented lattice edge is the exact abelian Wilson transporter
$$
U_{x,\mu}
=
\exp\!\left(iq\int_0^\delta A_\mu(x+s\hat e_\mu)\,ds\right),
$$
with the reverse edge assigned its inverse.

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

On Assumption G.3.1's registered compact local-frame bundle and Theorem G.3a's locality, exact-composition, smoothness, and cost hypotheses, the connection $A_\mu$ and covariant derivative $D_\mu$ are the minimal edge-local exact representation of phase-covariant comparison. Pointwise probabilities alone do not imply those local frames. The connection theorem fixes the transporter and covariant derivative inside its comparison class, but it does not by itself fix a physical charge scale. Charge quantization is theorem-level only on a branch that supplies integral bundle data, a topological defect such as a monopole sector, or an equivalent representation-lattice certificate fixing the allowed $U(1)$ characters. On such compact topological sectors consistency quantizes $q$ in units of a fundamental charge $e_0$; without that extra certificate the framework has forced local $U(1)$ transport and the associated current, not a SPAP-derived charge-quantization theorem.

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

*Proof.* For a vector field $X$ and decomposable section $s\otimes e$, define
$$
D_X(s\otimes e)
:=(\nabla_X^{\mathrm{spin}}s)\otimes e
+s\otimes(\nabla_X^{\mathrm{int}}e),
$$
and extend by additivity. This descends to the balanced tensor product because
$$
\begin{aligned}
D_X((fs)\otimes e)
&=X(f)s\otimes e+f(\nabla_X^{\mathrm{spin}}s)\otimes e
+fs\otimes\nabla_X^{\mathrm{int}}e\\
&=D_X(s\otimes(fe)).
\end{aligned}
$$
For $h\in C^\infty(M_{\mathrm{reg}})$,
$$
D_X(h(s\otimes e))
=X(h)(s\otimes e)+hD_X(s\otimes e),
$$
so $D$ is a connection. A product connection is required to obey the displayed rule on decomposable sections; since such sections locally span $S\otimes E$, that rule also proves uniqueness within the product-connection class.

Choose local frames in which
$$
\nabla_\mu^{\mathrm{spin}}=\partial_\mu+\Omega_\mu,
\qquad
\nabla_\mu^{\mathrm{int}}=\partial_\mu+A_\mu^{\mathrm{int}}.
$$
Applying the defining rule to the coefficient expansion of $\Psi$ gives
$$
D_\mu\Psi=\partial_\mu\Psi+\Omega_\mu\Psi+A_\mu^{\mathrm{int}}\Psi.
$$
On a $U(1)$ line carrying the representation $e^{i\vartheta}\mapsto e^{iq\vartheta}$, the derived Lie-algebra representation sends $iA_\mu$ to $iqA_\mu$. Hence $A_\mu^{\mathrm{int}}=iqA_\mu$ and
$$
D_\mu=\partial_\mu+\Omega_\mu+iqA_\mu.
$$
∎

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

**Corollary G.4b.2 (Internal Connections Are Sector-Selective Response Channels).** Internal gauge connections are not equivalence-principle-bearing on the full retained matter class unless an additional branch certificate makes the relevant charge/response ratio universal. In a $U(1)$ line sector the retained response to a fixed connection contains the factor $q$ through
$$
D_\mu=\partial_\mu+\Omega_\mu+iqA_\mu,
$$
and the Wilson response contains
$$
W_q(\gamma)=\exp\left(iq\oint_\gamma A\right).
$$
For a nonabelian internal bundle, the corresponding retained label is the representation of $P_{\mathrm{int}}$ and the associated character of internal holonomy. Distinct retained charges or representations are therefore distinct finite response ledgers, not a universal metric ledger.

*Proof.* Corollary G.4b.1 factors predictive holonomy into spin/geometric and internal parts. The internal part acts on the internal bundle factor and is weighted by the sector charge or representation. If two charges or representations give the same Wilson and local transport responses on all retained protocols, the difference is response-null and is removed by PPI. If they give different Wilson or local transport responses, the label is retained and the response ratio of Definition N.11.0a depends on sector data. By Theorem N.11a this is a sector-selective channel rather than a full-probe equivalence-principle channel. ∎

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
The unique parity-even quadratic Lorentz scalar constructed from $F_{\mu\nu}$ is $F_{\mu\nu}F^{\mu\nu}$, up to the independent topological density $F_{\mu\nu}\widetilde F^{\mu\nu}$. The contribution to the PCE potential density associated with field strength is positive in the Euclidean cost functional and quadratic at leading order in the local derivative expansion. On the regular effective-action branch, Theorem X.8c identifies the coefficient of this active field-strength coherence constraint with its PCE shadow price. Writing that stiffness price as $\lambda_F>0$ and using the interaction-strength convention $\kappa_F:=\lambda_F^{-1}$ gives
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
(specializing to the separately certified $3+1$ spacetime-promotion branch). Define $A_{\mu,\mathrm{can}}:=A_\mu/\sqrt{\kappa_F}$ and $q_{\mathrm{can}}:=q\sqrt{\kappa_F}$. Then $qA_\mu=q_{\mathrm{can}}A_{\mu,\mathrm{can}}$ and the kinetic term becomes the standard dimensionless form for the Maxwell action:
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

**Corollary G.5a.1 (Universality for Nondegenerate Quadratic Loop Penalties).** Let $q\ne0$ and let $f:U(1)\to\mathbb R$ be $C^2$ near $1$. Define $\widetilde f(\phi):=f(e^{i\phi})$ and assume
$$
\widetilde f(0)=0,
\qquad
\widetilde f'(0)=0,
\qquad
\widetilde f''(0)>0.
$$
Then
$$
f\bigl(H_{\square_{\mu\nu}}(c)\bigr)
=
\kappa_f\delta^4F_{\mu\nu}(c)^2+o(\delta^4),
\qquad
\kappa_f=\frac{q^2}{2}\widetilde f''(0)>0.
$$
Thus every local loop penalty with a nondegenerate quadratic minimum has the Maxwell continuum term up to a positive scale.

*Proof.* Taylor's theorem gives
$$
\widetilde f(\phi)
=
\frac12\widetilde f''(0)\phi^2+o(\phi^2).
$$
The plaquette phase is $\phi=q\delta^2F_{\mu\nu}(c)+O(\delta^4)$, hence $\phi^2=q^2\delta^4F_{\mu\nu}(c)^2+o(\delta^4)$. Substitution gives the displayed coefficient. ∎

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
For a complex scalar field $\phi$ with charge $q$, the $(-,+,\ldots,+)$ convention gives
$$
\mathcal{L}_{\text{scalar, free}}
=-g^{\mu\nu}(\partial_\mu\phi)^*(\partial_\nu\phi)-m^2|\phi|^2.
$$
Minimal coupling, with $D_\mu=\partial_\mu+iqA_\mu$, gives
$$
\mathcal{L}_{\text{scalar}}
=-g^{\mu\nu}(D_\mu\phi)^*(D_\nu\phi)-m^2|\phi|^2
=-g^{\mu\nu}(\partial_\mu\phi^*-iqA_\mu\phi^*)(\partial_\nu\phi+iqA_\nu\phi)-m^2\phi^*\phi.
\quad \text{(G.6.1)}
$$
For a Dirac field $\Psi$ with charge $q$ and Clifford convention $\{\gamma^\mu,\gamma^\nu\}=2g^{\mu\nu}I$,
$$
\mathcal{L}_{\text{Dirac, free}}=\bar\Psi\bigl(i\gamma^\mu(\partial_\mu+\Omega_\mu)-m\bigr)\Psi,
$$
and minimal coupling gives
$$
\mathcal{L}_{\text{Dirac}}
=\bar\Psi(i\gamma^\mu D_\mu-m)\Psi
=\bar\Psi\bigl(i\gamma^\mu(\partial_\mu+\Omega_\mu+iqA_\mu)-m\bigr)\Psi.
\quad \text{(G.6.2)}
$$
Varying $S=S_{\mathrm{field}}+S_{\mathrm{matter}}$ with respect to $A_\mu$ gives
$$
\nabla_\mu F^{\mu\nu}=J^\nu.
\quad \text{(G.6.3)}
$$
For the scalar convention above,
$$
J^\nu=-iq\bigl(\phi^*D^\nu\phi-(D^\nu\phi)^*\phi\bigr),
$$
whereas the Dirac current is $J^\nu=q\bar\Psi\gamma^\nu\Psi$. The corresponding matter equations imply $\nabla_\nu J^\nu=0$.

**G.6.1 Minimal-Coupling Continuum Limit and Variational Closure**

**Theorem G.6a (Minimal-Coupling Continuum Limit).** Let $\Omega\subset\mathbb R^D$ be bounded, and impose periodic boundary conditions or compact support away from $\partial\Omega$. Let $\phi\in C^2(\overline\Omega)$ and $A\in C^1(\overline\Omega)$ have bounded indicated derivatives, and assume the link expansion of Corollary G.3a.1 holds uniformly. Define
$$
S^{\mathrm{mat}}_\delta[\phi,A]
:=
\delta^{D-2}\sum_x\sum_\mu
\bigl|\phi(x)-U_{x,\mu}\phi(x+\delta\hat e_\mu)\bigr|^2
+
\delta^D\sum_xm^2|\phi(x)|^2.
\tag{G.6.4}
$$
Then
$$
S^{\mathrm{mat}}_\delta[\phi,A]
\xrightarrow[\delta\downarrow0]{}
\int_\Omega d^Dx
\left[
\sum_\mu|D_\mu\phi|^2+m^2|\phi|^2
\right],
\qquad
D_\mu=\partial_\mu+iqA_\mu.
$$
On the separately accepted signature-continuation branch of Appendix X, the corresponding leading Lorentzian action with signature $(-,+,\ldots,+)$ is
$$
S^{\mathrm{mat}}[\phi,A]
=
\int d^Dx\,\sqrt{|g|}
\left[-g^{\mu\nu}(D_\mu\phi)^*(D_\nu\phi)-m^2|\phi|^2\right].
\tag{G.6.1'}
$$

*Proof.* Uniform Taylor expansion gives
$$
\phi(x)-U_{x,\mu}\phi(x+\delta\hat e_\mu)
=
-\delta D_\mu\phi(x)+R_{x,\mu}(\delta),
\qquad
|R_{x,\mu}(\delta)|\le C\delta^2.
$$
Because $D_\mu\phi$ is bounded,
$$
\bigl|\phi-U\phi_{+\mu}\bigr|^2
=
\delta^2|D_\mu\phi|^2+O(\delta^3)
$$
uniformly. There are $O(\delta^{-D})$ lattice sites, so multiplication by $\delta^{D-2}$ makes the total remainder $O(\delta)$. The leading term and the mass term are Riemann sums, proving the Euclidean limit. Equation (G.6.1') follows only after the stated Euclidean-to-Lorentzian signature continuation, with signs determined by the adopted $(-,+,\ldots,+)$ convention. ∎

**Theorem G.6b (Variational Closure and Noether Current).** Adopt signature $(-,+,\ldots,+)$ and consider the total continuum action
$$
S[\phi,A]
=\int d^Dx\,\sqrt{|g|}\left[-g^{\mu\nu}(D_\mu\phi)^*(D_\nu\phi)-m^2|\phi|^2-\frac14F_{\mu\nu}F^{\mu\nu}\right].
\tag{G.6.5}
$$
Then:

(a) *Matter equation of motion.* $\delta S/\delta\phi^*=0$ gives
$$
D_\mu D^\mu\phi-m^2\phi=0.
\tag{G.6.6}
$$

(b) *Sourced gauge equation.* $\delta S/\delta A_\mu=0$ gives
$$
\nabla_\nu F^{\nu\mu}=J^\mu,
\qquad
J^\mu=-iq\bigl(\phi^*D^\mu\phi-(D^\mu\phi)^*\phi\bigr).
\tag{G.6.7}
$$

(c) *On-shell current conservation.* $\nabla_\mu J^\mu=0$ on the matter-equation solution manifold.

*Proof.* Take all variations to be smooth and compactly supported. Varying $\phi^*$ while leaving $\phi$ and $A$ unchanged gives
$$
\delta_{\phi^*}S
=
-\int\sqrt{|g|}\left[(D_\mu\delta\phi)^*D^\mu\phi+m^2\delta\phi^*\phi\right]d^Dx.
$$
Gauge-covariant integration by parts gives
$$
\delta_{\phi^*}S
=
\int\sqrt{|g|}\,\delta\phi^*(D_\mu D^\mu\phi-m^2\phi)\,d^Dx,
$$
which proves (G.6.6).

For the gauge variation,
$$
\delta(D_\mu\phi)=iq\phi\,\delta A_\mu,
\qquad
\delta(D_\mu\phi)^*=-iq\phi^*\,\delta A_\mu.
$$
Therefore
$$
\delta_AS_{\mathrm{mat}}
=
-\int\sqrt{|g|}\,J^\mu\delta A_\mu\,d^Dx,
$$
where $J^\mu=-iq(\phi^*D^\mu\phi-(D^\mu\phi)^*\phi)$. Since
$$
\delta F_{\mu\nu}=\nabla_\mu\delta A_\nu-\nabla_\nu\delta A_\mu,
$$
antisymmetry and integration by parts give
$$
\delta_AS_{\mathrm{field}}
=
\int\sqrt{|g|}\,(\nabla_\nu F^{\nu\mu})\delta A_\mu\,d^Dx.
$$
Arbitrariness of $\delta A_\mu$ proves $\nabla_\nu F^{\nu\mu}=J^\mu$.

Finally,
$$
\nabla_\mu J^\mu
=
-iq\left(\phi^*D_\mu D^\mu\phi-(D_\mu D^\mu\phi)^*\phi\right).
$$
Using $D_\mu D^\mu\phi=m^2\phi$ and its conjugate makes the right-hand side zero. ∎

**Corollary G.6b.1 (Non-Abelian Lift).** Let each vertex $v$ carry a rank-$m$ Hermitian predictive fiber $L_v\cong\mathbb C^m$ with a compact Lie subgroup $G\subseteq U(m)$ acting unitarily, local frame freedom $\psi_v\mapsto g_v\psi_v$ with $g_v\in G$, and edge transporters $U_{uv}\in G$ transforming as $U_{uv}\mapsto g_u U_{uv} g_v^{-1}$. Then:

(a) *Quadratic edge-cost form.* Under the rank-$m$ analogs of Assumptions G.3.1–G.3.5, any Hermitian positive-semidefinite quadratic edge cost on $L_u\oplus L_v$ whose zero set is exactly the coherent subspace $\{(z,z):z\in\mathbb C^m\}$ has the form
$$
Q_{uv} \;=\; \bigl\langle \psi_u-U_{uv}\psi_v,\;A_{uv}\,(\psi_u-U_{uv}\psi_v)\bigr\rangle,
$$
for some positive-definite Hermitian endomorphism $A_{uv}$ on $L_u$. If the relevant $G$-representation is irreducible, Schur's lemma reduces this to the scalar specialization
$$
Q_{uv} \;=\; \lambda_{uv}\,\lVert\psi_u-U_{uv}\psi_v\rVert^2,\qquad \lambda_{uv}>0.
$$

(b) *Covariant derivative.* Assume $A\in C^2$ and take each link to be the path-ordered Wilson transporter
$$
U_{x,\mu}
=
\mathcal P\exp\!\left(ig\int_0^\delta A_\mu(x+s\hat e_\mu)\,ds\right).
$$
Then the first-order continuum comparison is
$$
D_\mu=\partial_\mu+igA_\mu^aT^a,
$$
and $D_\mu\psi$ transforms covariantly.

(c) *Non-abelian field strength.* For these Wilson links, the plaquette holonomy satisfies
$$
H_{\square_{\mu\nu}}(c)=I+ig\delta^2F_{\mu\nu}(c)+O(\delta^3),
$$
equivalently $H_{\square_{\mu\nu}}(c)=\exp(ig\delta^2F_{\mu\nu}(c)+O(\delta^3))$, with
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

(e) *Minimally coupled matter and conserved current.* The edge-cost continuum limit yields $|D_\mu\Psi|^2=(D_\mu\Psi)^\dagger(D^\mu\Psi)$, and the nonabelian Noether current
$$
J^{a\mu}=ig\bigl(\Psi^\dagger T^aD^\mu\Psi-(D^\mu\Psi)^\dagger T^a\Psi\bigr)
$$
is covariantly conserved on shell:
$$
(D_\mu J^\mu)^a
=
\partial_\mu J^{a\mu}+gf^{abc}A_\mu^bJ^{c\mu}
=0.
$$
∎

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

Local phase coherence can be represented by a gauge field when the framework supplies a local phase action, a connection, field dynamics, and matter coupling.

**Technical ledger.**

The conditional $U(1)$ realization uses the following branch ledger:

1. **Quantum weights.** A complex Hilbert carrier together with normalized positive finite-effect additivity and noncontextuality yields the Born trace rule on Theorems G.1.7--G.1.8. PCE does not supply those hypotheses.
2. **Local phase action.** A continuous local $U(1)$ action is independently admitted. Theorem Q.0.7d2 extends invariance from an already registered dense subgroup to its closure; it does not derive the group action or a gauge origin.
3. **Coherence comparison.** The local-versus-all-pairs comparison is made only for the registered response family and cost functional.
4. **Connection representation.** An edge-local covariant connection is an admitted representation of that local action, with the transformation law stated in Equation G.4.2.
5. **Leading field dynamics.** On the Lorentz- and gauge-invariant differentiable two-derivative effective-action branch, the quadratic curvature term gives the leading Maxwell action and source-free equations. PCE ranks candidates only inside that declared class.
6. **Matter coupling.** A registered matter representation and minimal-coupling convention give the sourced equations. They are additional physical data, not consequences of the dense-subgroup theorem.

On the registered phase-character branch of Appendix Q, invariance under integer phase updates together with finite-resolution continuity gives an effective $U(1)$ closure. An edge-local $U(1)$ transporter is an admissible extensive representation of local phase coherence and is cheaper than the specified all-pairs phase table. The leading Maxwell and minimal-coupling description additionally assumes the local Lorentz-covariant, differentiable, two-derivative effective-action branch and the quadratic leading-order cost of Assumption G.3.3. This construction establishes a conditional $U(1)$ gauge realization; it does not exclude every other extensive local representation or every higher-derivative gauge-invariant action.

## G.8 Conditional Gauge, Matter, and Four-Dimensional Spacetime Compatibility

### G.8.1 Introduction and Objective: Conditional Co-selection Problem

This section compares compatible choices of gauge structure, matter content, and spacetime dimension within three explicitly limited candidate classes.

**Technical ledger.**


This section studies three branch-qualified selection problems. The gauge-algebra result is relative to the determinant-compatible finite-response block-frame/interface family declared in Section G.8.4. The chiral-matter result is relative to the finite representation, response, Higgs-slot, and anomaly-descent records declared in Sections G.8.4c–G.8.5. The dimensional result imports the independent channel-complete Bures tangent-cell mode-matching contract of Appendix Z.

The functional $V_{global}(G,{\psi},D,\dots)$ is a modeled comparison functional on those admitted classes. Its coefficients, admissible competitors, response benefits, anomaly data, and stability penalties are branch inputs. Minimization can establish existence or uniqueness only within the specified class and only when the relevant attainment or strict-gap hypotheses hold.

Under these hypotheses, the appendix compares the $D=4$ Standard Model branch with the enumerated alternatives. It does not prove that POP, PCE, or Equation G.8.5 alone excludes gauge groups, matter representations, dimensions, or response mechanisms outside those declared classes.

### G.8.2 Foundational Principles for Co-selection

The selection of a stable gauge structure and its operational dimensionality is governed by the minimization of the global PCE potential $V(x)$ (Definition D.1), incorporating $D$ as a variable, subject to fundamental constraints.

#### G.8.2.1 The PCE Potential as the Master Functional

The MPU network evolves to minimize $V(x)$, representing the net resource cost rate. For the gauge sector and dimensionality, this potential accounts for:

*   **Predictive Benefit ($V_{benefit}$):** A gauge structure in an appropriate dimension provides benefits by enabling efficient management of predictive coherence and supporting the formation of complex MPU aggregates necessary for advanced prediction.
*   **Operational & Propagation Costs ($V_{op}, V_{prop}$):** Maintaining a gauge structure and specific network dimensionality incurs costs (gauge field energy, information load for coherence, network propagation costs, structural stability costs).
*   **Consistency Penalties ($V_{penalty}$):** Mathematically or physically inconsistent structures (e.g., anomalous gauge theories in a given $D$, unstable orbital dynamics in another $D$) incur effectively infinite penalties.

#### G.8.2.2 Information Capacity Constraint (D-Independent MPU Property)

A $d_0$-dimensional carrier has finite classical capacity $C_{\max}\leq\ln d_0$. Theorem E.2 gives $C_{\max}<\ln d_0$ on the refresh/minorization branch, while Proposition E.2a gives $C_{\max}\leq\ln d_0-\ln2$ on the completed binary reset-support branch. Let $\alpha_{load}>0$ be a separately registered per-link rate required to track one retained gauge-generator response. A protected tracking implementation must additionally carry the minimizer of Theorem A.0.5 and the robustness, QEC, protected-gate, memory, and execution certificates of Theorem A.0.2. If $C_{\max}$, $\alpha_{load}$, and the certified error-control ledger depend only on the local MPU substrate and not on the emergent dimension $D$, then the branch has the dimension-independent capacity bound
$$
n_G\leq\left\lfloor\frac{C_{\max}}{\alpha_{load}}\right\rfloor.
$$
Neither the value of $\alpha_{load}$ nor convergence to the certified error rate follows from Theorem A.0.2.

*   **Capacity Limit on $n_G$:** The total number of generators must satisfy:

    $$
    n_G \le n_{\max} := \left\lfloor \frac{C_{\max}}{\alpha_{load}} \right\rfloor
    \tag{G.8.0}
    $$

For an explicitly chosen illustrative budget $C_{\max}\in[1.5,2.0]$ nats and load $\alpha_{\mathrm{load}}\in[0.1,0.2]$ nats, the ratio lies in $[7.5,20]$ before flooring. Neither interval follows from Theorem 31, Proposition E.2a, or Theorem E.2; a gauge-rank exclusion follows only after both are registered for the same channel branch. The quoted budget is moreover admissible only under Theorem E.2's ceiling $C_{\max}<\ln d_0=\ln8$; the completed binary reset-support branch of Proposition E.2a caps $C_{\max}$ at $\ln d_0-\ln2=\ln4$ and requires a correspondingly smaller illustrative range.

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
T_{\rho_0} = \bigoplus_{(\alpha,\beta) \in A \times B} \operatorname{span}(X_{\alpha\beta}, Y_{\alpha\beta})
$$

*Proof.* The commutator is $[X_{\alpha\beta}, Y_{\alpha\beta}] = 2i(|\alpha\rangle\langle\alpha| - |\beta\rangle\langle\beta|)$. Evaluating: $\omega(X_{\alpha\beta}, Y_{\alpha\beta}) = -i \cdot \mathrm{Tr}[\rho_0 \cdot 2i(|\alpha\rangle\langle\alpha| - |\beta\rangle\langle\beta|)] = 2(p_\alpha - p_\beta) = 2(\tfrac{1}{2} - 0) = 1$. For distinct pairs, the commutator lies in the AA $\oplus$ BB block where $\mathrm{Tr}[\rho_0[\cdots]] = 0$. ∎

**Definition G.8.2d ($\omega$-Isotropic Subspace).** A subspace $L \subseteq T_{\rho_0}$ is $\omega$-isotropic if $\omega(v, w) = 0$ for all $v, w \in L$. A maximal $\omega$-isotropic subspace (Lagrangian) has $\dim(L) = \dim(T_{\rho_0})/2 = 12$.

**Theorem G.8.2e (Geometric Bound on Isotropic Generator Families).** In the $24$-dimensional symplectic space $(T_{\rho_0},\omega)$, every $\omega$-isotropic subspace $L$ satisfies
$$
\dim L\le12.
$$
The bound is attained by the span of one vector from each of the twelve canonical symplectic pairs, so the maximal isotropic dimension is $12$.

*Proof.* Nondegeneracy gives $\dim L+\dim L^\omega=24$. Isotropy is exactly the inclusion $L\subseteq L^\omega$, hence $2\dim L\le24$. The displayed twelve-vector span is isotropic and attains equality. ∎

Under $\mathfrak C_{\mathrm{Cas}}$ the homogeneous spectral contribution has the recorded finite-part form
$$
\Delta_{\mathrm{hom}}(\mu_G)=\operatorname{FP}_{\mathrm{MS2}_{\mu_G}}\sum_{s,n}(-1)^{F_s}m_{s,n}\log\frac{\lambda_{s,n}+q_s}{\mu_G^2}+R_{\mathrm{tail}},
$$
where $m_{s,n}$, $q_s$, and $R_{\mathrm{tail}}$ are part of the same pre-registered record. The formula is a certificate format, not an inserted numerical prediction until the tables and tail bound are supplied.

**Corollary G.8.2f (Conditional Gauge-Generator Bound).** Let $\mathfrak g_{mathrm{ret}}$ be a retained gauge algebra. If a registered interface certificate supplies an injective linear map
$$
\iota:\mathfrak g_{mathrm{ret}}\longrightarrow T_{\rho_0}
$$
whose image is $\omega$-isotropic, then
$$
n_G:=\dim\mathfrak g_{mathrm{ret}}
=
\dim\iota(\mathfrak g_{mathrm{ret}})
\le12.
$$
The abstract Standard Model algebra has dimension $8+3+1=12$ and saturates this bound whenever such an injective isotropic certificate is supplied. Equation (G.8.0) remains a separate heuristic channel-capacity estimate.

*Proof.* Injectivity gives $\dim\mathfrak g_{mathrm{ret}}=\dim\iota(\mathfrak g_{mathrm{ret}})$. Theorem G.8.2e gives $\dim L\le12$ for every $\omega$-isotropic subspace $L\subseteq T_{\rho_0}$. Apply it to $L=\iota(\mathfrak g_{mathrm{ret}})$. ∎

**Remark G.8.2g (Numerical Symplectic--Golay Correspondence).** The Lagrangian tangent-rank bound gives $12$, while the independently certified predictive-recovery Golay branch has code dimension $k=12$. Equality of dimensions does not identify the two subspaces, provide a gauge-response injection, or establish a common physical carrier. Any such identification requires a separate intertwining certificate.

**Proposition G.8.2h (Eisenstein Complex-Structure Candidate).** Let $\omega=e^{2\pi i/K_0}$ with $K_0=3$. Then
$$
\frac{2\omega+1}{\sqrt3}=i
$$
exactly. More generally, let $\sigma$ be any real orthogonal operator on a real inner-product space satisfying $\sigma^2+\sigma+1=0$, equivalently a $\mathbb Z[\omega]$-module structure with $\omega$ acting isometrically. Then
$$
J:=\frac{2\sigma+\mathbb 1}{\sqrt3}
$$
satisfies $J^2=-\mathbb 1$ and $J^{\mathsf T}J=\mathbb 1$, so every isometric rank-$12$ $\mathbb Z[\omega]$-module structure on the rank-$24$ interface lattice induces an orthogonal complex structure with multiplication by the generation phase $\omega$ realized as $\tfrac12(-\mathbb 1+\sqrt3\,J)$. The Leech lattice admits such a structure, the complex Leech lattice [Conway and Sloane 1999]. The pair $(\sigma,J)$ is therefore a candidate for the complex-structure component of the intertwining record requested above. It does not supply an isometry $F$ from the real Leech carrier to the QFI-active carrier satisfying $F\sigma=J_{\mathrm{QFI}}F$, and it does not identify the Lagrangian tangent subspace with the Golay code subspace; both remain separate certificate entries.

*Proof.* The scalar identity is $2\omega+1=2(-\tfrac12+i\tfrac{\sqrt3}2)+1=i\sqrt3$, and division by $\sqrt3$ gives $i$. For the operator statement, $\sigma^2+\sigma+1=0$ gives
$$
(2\sigma+\mathbb 1)^2=4\sigma^2+4\sigma+\mathbb 1=4(\sigma^2+\sigma)+\mathbb 1=-4\,\mathbb 1+\mathbb 1=-3\,\mathbb 1,
$$
so $J^2=-\mathbb 1$. The relation also gives $\sigma^3=\sigma\cdot\sigma^2=\sigma(-\sigma-\mathbb 1)=-\sigma^2-\sigma=\mathbb 1$, so orthogonality of $\sigma$ gives $\sigma^{\mathsf T}=\sigma^{-1}=\sigma^2=-\sigma-\mathbb 1$ and hence $\sigma+\sigma^{\mathsf T}=-\mathbb 1$. Therefore
$$
J^{\mathsf T}J=\frac{(2\sigma^{\mathsf T}+\mathbb 1)(2\sigma+\mathbb 1)}3
=\frac{4\sigma^{\mathsf T}\sigma+2(\sigma+\sigma^{\mathsf T})+\mathbb 1}3
=\frac{4\,\mathbb 1-2\,\mathbb 1+\mathbb 1}3=\mathbb 1 .
$$
Finally $\tfrac12(-\mathbb 1+\sqrt3\,J)=\tfrac12(-\mathbb 1+2\sigma+\mathbb 1)=\sigma$, so the induced complex scalar $\omega$ acts as $\sigma$. Existence of the rank-$12$ isometric $\mathbb Z[\omega]$-structure on $\Lambda_{24}$ is the complex Leech lattice construction [Conway and Sloane 1999]. The final scope sentence records that the algebraic candidate is not a common-carrier intertwining certificate. ∎

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

*   For an assumed unscreened massless-force law in $D$-dimensional spacetime, the classical potential scales as $1/r^{D-3}$ for $D>3$ and as $\ln r$ for $D=3$. The inverse-square case occurs for three spatial dimensions and is compatible with the closed-orbit criterion of Bertrand's theorem. This is a viability comparison inside the modeled spacetime class, not a derivation of $D=4$ or a substitute for the Appendix Z carrier theorem and the separate spacetime-promotion certificates [Bertrand, 1873].
*   For the assumed central potential, the effective radial potential has no strict stable circular minimum when $D_{\text{space}}\ge4$ (the four-spatial-dimensional case is marginal and higher dimensions are unstable). This is a classical obstruction within the declared unscreened central-force model. No converse exclusion is proved for $D_{\text{space}}\le2$; any claim that lower dimensions lack sufficient topology or degrees of freedom is an additional viability premise that must be encoded and tested in $\eta_{\rm ben}(D)$ or the registered penalty.
*   A universe unable to form stable complex structures incurs a catastrophic loss of $V_{benefit}$ (as these structures are the primary engines of advanced prediction) and is thus strongly disfavored by PCE. It is a core hypothesis of this co‑selection argument that PCE robustly translates these D‑sensitive stability issues into highly unfavorable D‑dependent coefficients within the PCE potential model (Equation G.8.5), for instance, by yielding a significantly lower benefit coefficient $\eta_{ben}(D)$ or imposing high effective penalty terms for dimensions $D\neq 4$ that fail to support such stable complexity.


#### G.8.2.5 Information‑Theoretic and Network Efficiency (D‑Sensitive)

The MPU network’s efficiency under PCE depends on D‑sensitive information‑theoretic properties.

*   **Holographic Efficiency:** On a separately certified $3+1$ spacetime and horizon-thermodynamic branch, the entropy-area law gives a bulk-boundary scaling comparison. No theorem in this section proves that this efficiency is optimized uniquely at $D=4$ or promotes the Euclidean response carrier to physical spacetime.
*   **Network Propagation and Coherence ($V_{prop}$):** Recurrence and transience of random walks change with spatial dimension, so a declared propagation-cost model may compare dimensions. Any claimed optimum depends on explicitly supplied coefficients and admissible competitors in Equation G.8.5; it is a modeled viability test, not an independent theorem selecting $D=4$.

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

    *   **(a) Communication Cost for Coherence ($V_{comm}$):** Maintaining coherence for a gauge symmetry across the MPU network requires the reliable transmission of phase information (or its equivalent) for each of the $n_G$ generators. Each generator’s state must be tracked across MPU–MPU links. As established in Section G.8.2.2, this incurs a D‑independent information load of $\alpha_{load}$ (nats per link per cycle) per generator to achieve the necessary fidelity (low $p_{err}^*$). The cost of transmitting this total load $n_G\alpha_{load}$ is inversely proportional to the positive finite MPU channel capacity $C_{\max}$, with Theorem E.2 supplying the strict upper bound on the refresh/minorization branch. Thus, the communication cost per MPU scales as:

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
2.  **Capacity Constraint:** Equation (G.8.0) supplies the heuristic range $n_{\max}\approx7.5$–$20$. Theorem G.8.2e independently gives the maximal isotropic tangent dimension $ab=12$. On a branch carrying the injective isotropic gauge-response certificate of Corollary G.8.2f, this becomes the gauge bound $n_G\le12$. The equalities
$$
ab=\dim_{\mathbb C}\mathrm{Gr}(2,8)=12,
\qquad
k=12
$$
are numerical consistency relations. They do not identify the gauge algebra, the QFI tangent Lagrangian, and the Golay carrier without separate intertwining data.
    
    The bound $n_G\le12$ uses the joint branch ledger
    $$
    \text{Theorem-15/Theorem-Z.2 minimal carrier}\Rightarrow d_0=8,
    \qquad
    \text{Theorem-Z.1 sharp-record/capacity/no-surplus branch}\Rightarrow a=2,\ b=6,\ ab=12.
    $$
    The registered-reset inequality is independent and does not fix $a$, $b$, or $ab$.



3.  **Structural Stability:** $D$ must allow for the formation and persistence of stable, complex MPU aggregates capable of advanced prediction (Section G.8.2.4). This criterion strongly favors $D=4$.
4.  **Information Efficiency:** $D$ should optimize information‑theoretic and network efficiencies related to holography, propagation, and coherence (Section G.8.2.5). This criterion is hypothesized to further favor $D=4$.
5.  **Potential Minimization:** Among all triplets $(G,{\psi},D)$ satisfying (1)–(4), the optimal solution minimizes $V_{net}$ given by Equation G.8.5.

### G.8.4a Gauge Algebra via Exhaustive Partition Analysis

This section derives the Standard Model gauge algebra via exhaustive classification of module decompositions, supplying the module-decomposition input used in Proposition G.M1. The inactive subspace $\mathcal{B} = \mathbb{C}^b$ with $b = d_0 - a = 8 - 2 = 6$ (where $a = 2$ follows from Theorem Z.1) carries the gauge representation. The derivation proceeds through three stages: exclusion of simple groups, enumeration of viable partitions, and unique selection by physical constraints.

**Theorem G.8.4a (No Simple 12-Dimensional Gauge Algebra).**
No complex simple Lie algebra has dimension $12$. Consequently, a twelve-dimensional gauge algebra cannot itself be simple. This dimension statement alone does not determine the number of simple factors or abelian summands in a reductive decomposition.

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

**Step 3 (Implication on a Certified Gauge-Capacity Branch).** Suppose the injective isotropic gauge-response certificate of Corollary G.8.2f is present and a retained gauge algebra saturates its bound, so $\dim\mathfrak g=12$. Step 2 proves that $\mathfrak g$ is not simple. No conclusion about the number of simple or abelian factors follows from dimension alone. Under the same certified bound, a simple candidate of dimension greater than $12$, such as $SU(5)$, $SO(10)$, or $E_6$, cannot be retained as the gauge algebra. ∎

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
\mathcal B\cong\bigoplus_i\mathbb C^{n_i},
\qquad
\sum_i n_i=6.
$$
Assume that exact response-null global phases are quotiented, that the branch carries the injective isotropic gauge-response certificate of Corollary G.8.2f, and that the positive-marginal regime of Equation (G.8.5) retains a capacity-saturating algebra inside the following full-block frame family: for every block with $n_i\ge2$, the retained nonabelian algebra is exactly $\mathfrak{su}(n_i)$; no such full-block factor may be discarded or replaced by a proper connected subgroup; and only response-active block-center directions may be omitted to obey the capacity bound. Then the unique capacity-saturating block-frame inactive-sector module decomposition within this explicitly declared family is
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
be an unordered block decomposition. By the full-block frame-family hypothesis, the retained nonabelian algebra is
$$
\bigoplus_{i:n_i\ge2}\mathfrak{su}(n_i).
$$
Accordingly define
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

All rows with $s(\lambda)>12$ violate the certified capacity bound. Rows with $N(\lambda)<12$ do not satisfy the theorem's explicit capacity-saturation hypothesis. No comparison of PCE values across different block partitions is required for this exclusion.

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
The connected simply connected cover of the semisimple part, together with a one-dimensional abelian factor, is written
$$
SU(3)\times SU(2)\times U(1)
$$
at the Lie-algebra level. The finite central quotient and the embedding of the retained $U(1)$ into the block-center torus are not determined by Theorem G.8.4b. If a primitive determinant-character certificate selects the standard embedding, the resulting global group is
$$
S(U(3)\times U(2))
\cong
\frac{SU(3)\times SU(2)\times U(1)}{\mathbb Z_6}.
$$
Without that certificate, only the Lie algebra and its dimension are determined on this branch.

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
whenever $s(\lambda)\le12$. On the injective isotropic gauge-response branch of Corollary G.8.2f, rows with $s(\lambda)>12$ violate the certified bound. Rows with $N(\lambda)<12$ fail the capacity-saturation hypothesis of Theorem G.8.4b. The enumeration contains exactly one saturating row, $3+2+1$, and the retained abelian direction follows from $12-(8+3)=1$. Therefore no other row has the same capacity-saturation and finite-response quotient data. ∎

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
or the determinant interface contract used in Definition G.8.4h.1. Adding a ledger operator whose eigenspaces are already $C$, $W$, and $Y$ is a way of restating the block-frame admissibility condition, not a proof that all compact connected subgroups of $U(6)$ are conjugate to the reducible block-frame action. Thus the PU result is block-frame/interface-category uniqueness, not uniqueness among all compact connected subgroups of $U(6)$.

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
Then the weak rank-2 block and active Pauli algebra share the same registered active-rank datum only on the joint structural branch:
$$
\left.
\begin{aligned}
\text{registered binary quotient}+\text{Theorem-Z.1 gates}&\to a=2,\\
\text{Theorem-Z.2 comparator branch}&\to d_0=8
\end{aligned}
\right\}
\to(b,ab)=(6,12)\to3+2+1.
$$
The reachable reset and its physical heat ledger are not antecedents of this rank identity.
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

*Proof.* On the minimal active-rank branch of Theorem Z.1, $a=2$. The minimal carrier branch gives $d_0=8$ and hence $b=6$, while the block-frame capacity bound gives $ab=12$. The unordered block-partition count
$$
n_G(\lambda)=1+\sum_{i:n_i\geq2}(n_i^2-1)
$$
has the unique saturating row $3+2+1$ at $b=6$, so the weak block has rank $2$.

Choose a unitary basis in each rank-two Hermitian fiber. Its traceless Hermitian endomorphisms have real basis $\{\sigma_1,\sigma_2,\sigma_3\}$, and its traceless anti-Hermitian endomorphisms have basis $\{i\sigma_1,i\sigma_2,i\sigma_3\}$. For every local unitary fiber isometry $\Phi_{\tilde x}$ stated in the theorem, conjugation preserves tracelessness, anti-Hermiticity, and brackets and is bijective. Therefore
$$
\operatorname{Ad}_{\Phi_{\tilde x}}
\bigl(\mathfrak{su}(S_{\pi(\tilde x)})\bigr)
=
\mathfrak{su}((\widetilde Q_W)_{\tilde x}).
$$
Corollary G.8.4c identifies the nonabelian algebra of the rank-two inactive block with the weak algebra. The physical symmetry interpretations of Theorems G.10.2 and G.10.3 require their separate implementation certificates and are not needed for this fiberwise matrix-algebra identity. ∎

**Remark G.8.4c.0d (Counterfactual Active-Rank Audit and No Color-Block Ambiguity).** For $d_0=8$, the active rank $a=2$ is the admissible value whose certified capacity-saturating row contains exactly one inactive 2-block. The counterfactual ledger is:

| $a$ | $b=8-a$ | $ab$ | Saturating partition(s) | 2-block outcome |
|:--:|:--:|:--:|:--|:--|
| $1$ | $7$ | $7$ | $2+2+1+1+1$ | two 2-blocks; also violates $\ln a\ge\ln2$ |
| $2$ | $6$ | $12$ | $3+2+1$ | exactly one 2-block |
| $3$ | $5$ | $15$ | $4+1$ with zero retained abelian directions | no 2-block |
| $4$ | $4$ | $16$ | none; $4$ supplies $15$ generators | no saturation |
| $5$ | $3$ | $15$ | none | no saturation |
| $6$ | $2$ | $12$ | none | no saturation |
| $7$ | $1$ | $7$ | none | no saturation |

Although $\mathfrak{su}(3)$ contains embedded $\mathfrak{su}(2)$ subalgebras, those embedded subalgebras do not replace the weak block. The $3$-block contributes the full $\mathfrak{su}(3)$ with $8$ retained generators on the capacity branch; replacing it by a proper embedded $\mathfrak{su}(2)$ would discard response-changing generators and fail the saturation certificate. The weak algebra is $\mathfrak{su}(\widetilde Q_W)$, placed left-chirally by the existing chiral determinant-line and weak-left projection branch. An accepted low-energy independent $SU(2)_R$ or any non-$\mathfrak{su}(2)$ weak carrier at the same capacity level would require changing the $n_G=12$ ledger rather than silently coexisting with it.

The downstream paragraphs at the end of Appendix G.10 (the causal-chain paragraph extending SPAP $\mathbb Z_2$ through the active-rank/weak-block identification) and in Proposition Z.14a (the weak-block caveat) cross-reference this theorem and should be read as the same local frame statement under different headings, not as independent transport claims.

**Theorem G.8.4c.0e (Bordism-Anomaly Spectrum Closure Gate).** Let $\mathcal G_{\mathrm{pred}}$ be the determinant-compatible finite-response gauge object selected on the $3+2+1$ block-frame branch of Theorem G.8.4b and Corollary G.8.4c. Let $\mathcal M$ be the finite retained candidate class of chiral, vectorlike, sterile, boundary, interface, and defect-completed matter packages with fixed response maps, fixed defect-inflow channels, and fixed Higgs-response slots. Suppose the branch supplies an additive finite anomaly-bordism character
$$
\mathfrak A_{\mathrm{tot}}(M)
=
\mathfrak A_{\mathrm{bulk}}+\mathfrak A_M+\partial\mathfrak A_{\mathrm{defect}}
\in
\operatorname{Hom}(\Omega^{\mathrm{Spin}}_5(B\mathcal G_{\mathrm{pred}}),\mathbb R/\mathbb Z)
\tag{G.8.4c.0e.1}
$$
or its finite retained anomaly-group image, including torsion, global $SU(2)$, mixed gravitational, determinant-line, boundary, interface, and defect-inflow terms. A package is anomaly-admissible exactly when
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
be the response quotient, where $\sim_{\mathrm{resp}}$ removes vectorlike response-null pairs, sterile response-null singlets, pure boundary relabelings, and defect presentations with the same finite response. If $\mathcal K$ is nonempty, the PCE cost $\mathcal C_{\mathrm{desc}}$ is finite on $\mathcal K$, and a selected class $M_*$ has a strict gap
$$
\mathcal C_{\mathrm{desc}}(M)-\mathcal C_{\mathrm{desc}}(M_*)\ge\Delta_{\mathrm{matter}}>0
\tag{G.8.4c.0e.4}
$$
for every response-distinct $M\ne M_*$, then $M_*$ is unique up to response-null conjugation and defect-gauge equivalence. If the one-generation Standard Model chiral package satisfies (G.8.4c.0e.2) and (G.8.4c.0e.4) against every admissible exotic, vectorlike, sterile, boundary, interface, and defect-completed package, then it is the selected matter package on that branch. Without the finite anomaly-bordism record and strict PCE gap, Corollary G.8.4c selects the gauge algebra only and not the full matter spectrum, charge lattice, Higgs branch, or electroweak-breaking operator.

**Definition G.8.4c.0f (Matter, Charge, and Electroweak-Breaking Certificate).** A matter/EWSB completion certificate is a finite record
$$
\mathfrak C_{\mathrm{matEW}}
=
\left(
\Lambda_Y,
\mathcal G_{\mathrm{glob}},
\mathcal A_{\mathrm{loc}},
\mathcal A_{\mathrm{glob}},
\mathcal M,
\mathcal Q_{\mathrm{resp}},
\Delta_{\mathrm{PCE}},
H_{\mathrm{EW}},
\mathcal V_{\mathrm{EW}},
\mathcal Q_{G/H},
\mathcal M_{\mathrm{mass}},
\mathcal R_{\mathrm{matEW}},
\chi_{\mathrm{matEW}}
\right)
\tag{G.8.4c.0f.1}
$$
where:

1. $\Lambda_Y$ is the determinant-compatible primitive hypercharge lattice, including the simultaneous sign convention and primitive charge unit $a=1/6$.
2. $\mathcal G_{\mathrm{glob}}$ is the global gauge form compatible with the determinant line, the primitive hypercharge lattice, and the quotient of response-null central phases.
3. $\mathcal A_{\mathrm{loc}}$ and $\mathcal A_{\mathrm{glob}}$ are the local and global anomaly characters, including perturbative cubic, mixed, gravitational, torsion, Witten, boundary, interface, and defect-inflow terms.
4. $\mathcal M$ is the finite candidate class of chiral, vectorlike, sterile, boundary, interface, and defect-filled packages considered on the branch.
5. $\mathcal Q_{\mathrm{resp}}$ is the response-equivalence quotient.
6. $\Delta_{\mathrm{PCE}}$ is either a strict positive PCE gap selecting one response-active class or a finite degeneracy ledger listing all PCE-tied surviving classes.
7. $H_{\mathrm{EW}}$ is the Higgs representation and determinant-character record.
8. $\mathcal V_{\mathrm{EW}}$ is the electroweak vacuum branch, including the vacuum orbit, stability condition, Goldstone count, and custodial or noncustodial response labels.
9. $\mathcal Q_{G/H}$ is the Goldstone/gauge quotient used to remove gauge-equivalent vacuum directions.
10. $\mathcal M_{\mathrm{mass}}$ is the mass-generation map from the vacuum branch to gauge-boson and fermion mass terms, including the Yukawa-normalization dependency on the flavor certificate of Definition T.79.4.
11. $\mathcal R_{\mathrm{matEW}}$ is the finite residual ledger passed downstream to threshold, flavor, baryogenesis, and primordial determinant rows.
12. $\chi_{\mathrm{matEW}}=1$ records that no package, charge normalization, Higgs branch, vacuum branch, or mass map is chosen from low-energy validation data.

**Theorem G.8.4c.0g (Matter/EWSB Classification at Fixed Gauge Algebra and Generation Count).** At fixed gauge algebra $\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)$ and fixed generation count $N_g=3$, the Standard Model response-active matter package and electroweak-breaking branch are unique exactly on branches carrying an accepted $\mathfrak C_{\mathrm{matEW}}$ with a strict positive gap $\Delta_{\mathrm{PCE}}>0$ for the Standard Model class. If the strict gap is not certified, the theorem-level output is the bounded catalog
$$
\mathcal K_{\mathrm{surv}}
=
\{M\in\mathcal M:[\mathfrak A_{\mathrm{tot}}(M)]=0\}/\sim_{\mathrm{resp}}
\tag{G.8.4c.0g.1}
$$
together with its charge-lattice, global-form, Higgs-branch, defect-inflow, and downstream-threshold ledger. In particular, gauge algebra plus $N_g=3$ fixes the skeleton but not the response-active chiral matter package, charge normalization, Higgs vacuum branch, electroweak-breaking operator, or threshold consequences.

*Proof.* Theorem G.8.4b and Corollary G.8.4c determine the finite-response block-frame gauge algebra. The generation-count results determine the number of family copies. Neither datum contains the anomaly character, finite candidate list, response quotient, PCE gap, hypercharge lattice, global gauge form, Higgs vacuum branch, Goldstone quotient, or mass-generation map. Definition G.8.4c.0f lists exactly those missing finite entries. If the accepted certificate contains a strict gap, all other response-distinct admissible packages have larger PCE cost and are excluded. If not, the response quotient (G.8.4c.0g.1) is the maximal theorem-level classification permitted by the finite data. ∎

**Corollary G.8.4c.0h (Charge Quantization Status).** The primitive hypercharge vector
$$
(y_q,y_{u^c},y_{d^c},y_\ell,y_{e^c},y_H)=\frac16(1,-4,2,-3,6,3)
\tag{G.8.4c.0h.1}
$$
is theorem-level charge normalization only on branches where $\Lambda_Y$ and $\mathcal G_{\mathrm{glob}}$ are entries of an accepted $\mathfrak C_{\mathrm{matEW}}$ or of the determinant-line hypercharge theorem cited by that certificate. Otherwise hypercharge normalization remains branch data, and all threshold and flavor finite parts depending on Dynkin indices inherit that branch status.

**Definition G.8.4c.0i (Relaxed Gauge-Matter-Generation Catalog Record).** A relaxed gauge/matter/generation catalog record is a finite record
$$
\mathfrak C_{\mathrm{GMR}}
=
\left(
\mathcal L_{\mathrm{mod}},
\mathcal S_{\mathrm{sat}},
\mathcal A_{\mathrm{prem}},
\mathcal Y_{\mathrm{det}},
\mathcal G_{\mathrm{glob}},
\mathcal G_{\mathrm{Golay}},
\mathcal L_{\mathrm{alt}},
\mathcal M_{\mathrm{cand}},
\mathcal N_{\mathrm{fam}},
\mathsf{Def}_{\mathrm{cand}},
\sim_{\mathrm{resp}},
\mathcal C_{\mathrm{desc}},
\Delta_{\mathrm{GMR}},
\Pi_{\mathrm{thr}},
\Pi_{\mathrm{fl}},
\Pi_B,
\chi_{\mathrm{GMR}}
\right)
\tag{G.8.4c.0i.1}
$$
where:

1. $\mathcal L_{\mathrm{mod}}$ records whether the finite-response syndrome locality and direct-sum inactive-module normal form of Lemma G.8.4a.1 is imposed, weakened, or replaced by a tensor-product, nonlocal, boundary, or interface module.

2. $\mathcal S_{\mathrm{sat}}$ records whether the positive-marginal capacity-saturation premise of Theorem G.8.4b is imposed. If it is not imposed, underfilled block-frame partitions remain candidate gauge branches rather than being silently discarded.

3. $\mathcal A_{\mathrm{prem}}$ records which transformations are predictive-frame redundancies and therefore subject to the local and global anomaly-descent gates of Theorem X.8d and Theorem X.8d.3, and which transformations are physical global update channels.

4. $\mathcal Y_{\mathrm{det}}$ records the determinant-compatible abelian lattice, the hypercharge normalization, the simultaneous sign convention, and the charge-quantization certificate. If this entry is absent, charge normalization remains branch data.

5. $\mathcal G_{\mathrm{glob}}$ records the global gauge form, including center quotient, spin or $\mathrm{Spin}^c$ lift, torsion character, and determinant-line orientation.

6. $\mathcal G_{\mathrm{Golay}}$ records nonhomogeneous Golay, residual-symmetry, marked-octad, or stabilizer data when those data are used as finite stabilizers rather than as connected gauge selectors.

7. $\mathcal L_{\mathrm{alt}}$ is the finite list of alternative lifts, tensor-product embeddings, vectorlike extensions, sterile sectors, boundary sectors, interface sectors, and defect-fusion completions admitted for comparison.

8. $\mathcal M_{\mathrm{cand}}$ is the finite or compact candidate class of chiral, vectorlike, sterile, exotic, boundary, interface, and defect-completed matter packages, with their local anomaly polynomial, torsion anomaly character, defect-inflow term, Dynkin-index map, and response maps.

9. $\mathcal N_{\mathrm{fam}}$ is the finite candidate class of generation-count and family-charge branches. It records whether the $U(1)_F$ family label is a predictive-frame redundancy, a physical global update channel, a response-null label, or a later flavor-potential datum.

10. $\mathsf{Def}_{\mathrm{cand}}$ is the finite defect-fusion category or candidate subcategory used to cancel boundary or interface anomaly classes.

11. $\sim_{\mathrm{resp}}$ is the response equivalence quotient on gauge, matter, generation, sterile, vectorlike, and defect labels.

12. $\mathcal C_{\mathrm{desc}}$ is the PCE description-cost functional on the response quotient, and $\Delta_{\mathrm{GMR}}$ is either a strict positive gap for a selected branch or a finite degeneracy interval.

13. $\Pi_{\mathrm{thr}}$, $\Pi_{\mathrm{fl}}$, and $\Pi_B$ are the downstream maps to electroweak thresholds, flavor, and baryogenesis. They include changes to Dynkin indices, threshold finite parts, Yukawa/flavor operator content, neutrino sectors, CKM/PMNS structure, and CP sources.

14. $\chi_{\mathrm{GMR}}$ is the forward-lock entry: the catalog, anomaly ledger, hypercharge lattice, global gauge form, defect-inflow choices, PCE gap, and downstream maps are fixed before comparison with threshold, flavor, neutrino, baryogenesis, or matter-spectrum data.

**Theorem G.8.4c.0j (Finite Classification under Relaxed Gauge, Matter, and Generation Premises).** On any branch carrying an accepted catalog record $\mathfrak C_{\mathrm{GMR}}$, the surviving response-active gauge/matter/generation branches are exactly the following finite classes, modulo $\sim_{\mathrm{resp}}$.

1. **Gauge-branch failure classes.** If the finite syndrome locality or direct-sum inactive-module normal form is not imposed, Theorem G.8.4b does not apply. Tensor-product embeddings such as a nonlocal $\mathbb C^2\otimes\mathbb C^3$ action, arbitrary compact connected subgroups of $U(6)$, nonhomogeneous Golay stabilizers, and boundary/interface lifts are then separate gauge branches. They survive only if $\mathcal L_{\mathrm{alt}}$ supplies finite response maps, anomaly descent, a global gauge form, and a PCE ledger. They are not counterexamples to Corollary G.8.4c, because Corollary G.8.4c is internal to the block-frame branch.

2. **Capacity-overrun exclusions.** Inside the block-frame family and under the sharp capacity bound $n_G\le12$, the partitions
$$
6,
\quad
5+1,
\quad
4+2,
\quad
4+1+1,
\quad
3+3
\tag{G.8.4c.0j.1}
$$
are excluded before matter selection, because their nonabelian generator counts are $35,24,18,15,16$, respectively. If the capacity bound itself is relaxed, the gauge-algebra branch has failed rather than the matter or generation branch.

3. **Standard block-frame skeleton.** If Lemma G.8.4a.1, positive-marginal capacity saturation, determinant-compatible abelian descent, and response-null phase quotienting are imposed, the unique gauge skeleton is
$$
\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)
\tag{G.8.4c.0j.2}
$$
with the determinant-compatible interface group recorded by $\mathcal G_{\mathrm{glob}}$. This is the closed gauge-algebra branch of Theorem G.8.4b and Corollary G.8.4c.

4. **Underfilled block-frame branches.** If the positive-marginal saturation premise is relaxed while the block-frame family and $n_G\le12$ remain, the surviving underfilled gauge skeletons are exactly

| inactive partition | retained connected algebra before matter selection | generator count |
|:--|:--|:--:|
| $3+1+1+1$ | $\mathfrak{su}(3)\oplus\mathfrak u(1)^3$ | $11$ |
| $2+2+2$ | $\mathfrak{su}(2)^3\oplus\mathfrak u(1)^2$ | $11$ |
| $2+2+1+1$ | $\mathfrak{su}(2)^2\oplus\mathfrak u(1)^3$ | $9$ |
| $2+1+1+1+1$ | $\mathfrak{su}(2)\oplus\mathfrak u(1)^4$ | $7$ |
| $1+1+1+1+1+1$ | $\mathfrak u(1)^5$ | $5$ |

These branches have different threshold and matter ledgers and do not inherit the Standard Model downstream rows.

5. **Matter-spectrum classes at fixed Standard Model skeleton.** At fixed skeleton (G.8.4c.0j.2), the one-family Standard Model chiral package is unique only if the determinant-compatible hypercharge lattice, global gauge form, anomaly-bordism character, Witten $SU(2)$ torsion audit, defect-inflow ledger, one-Higgs Yukawa map, and strict PCE gap of Theorem G.8.4c.0e are supplied. Without that record, the surviving matter classes are: anomaly-free exotic chiral packages in $\mathcal M_{\mathrm{cand}}$; vectorlike pairs, which are anomaly-null but PCE-surplus unless response-active threshold or flavor data are appended; sterile $(1,1)_0$ sectors, which are gauge-response-null unless retained by a neutrino, Majorana, or seesaw operator; and boundary/interface/defect-completed packages whose inflow cancels the total anomaly and whose defect action is response-active.

6. **Charge and global-form classes.** If $\mathcal Y_{\mathrm{det}}$ and $\mathcal G_{\mathrm{glob}}$ are absent, the connected algebra fixes only a real abelian generator direction. Hypercharge normalization, charge quantization, center quotient, torsion anomaly class, and determinant-line orientation remain branch data. A later threshold, fine-structure, or flavor row may use only a lattice and global form transported through an accepted overlap map.

7. **Generation-count classes.** The exact $N_g=3$ row survives precisely on the pre-flavor family-redundancy PPI branch of Theorem R.3.4, Proposition R.3.5.1a, and Theorem R.8.5b. If $U(1)_F$ is not a predictive-frame redundancy, the family anomaly equations are not descent constraints and the generation-count branch fails. If the CP-active requirement is removed, $N=1$ and $N=2$ branches may survive structurally but have no physical CKM phase. If the PCE minimal-selection rule is relaxed, larger anomaly-free multisets such as $\{a,-a,b,-b\}$ are separate response-active branches when their flavor or threshold maps are retained, and response-null family copies are quotiented.

8. **Later-sector failure classes.** Failure of a flavor texture, neutrino, CKM/PMNS, threshold, or baryogenesis certificate is not failure of the gauge-algebra branch or of the $N_g=3$ structural branch. It is a downstream certificate failure. The maps $\Pi_{\mathrm{thr}}$, $\Pi_{\mathrm{fl}}$, and $\Pi_B$ record the changed Dynkin indices, thresholds, Yukawa operators, CP sources, neutrino operators, and washout consequences of every surviving response-active branch.

Therefore the Standard Model gauge algebra and $N_g=3$ are unique only under their stated minimal premises. When those premises are relaxed, the bounded catalog is the finite response quotient of the eight classes above, with anomaly ledgers and downstream consequences supplied by $\mathfrak C_{\mathrm{GMR}}$.

*Proof.* The partition analysis in Theorem G.8.4b is exhaustive inside the finite direct-sum block-frame family. Items 2--4 are exactly that finite table, separated by whether the capacity and positive-marginal saturation premises are retained. If the module-locality premise is dropped, Lemma G.8.4a.1 no longer supplies the table, so any alternative lift is a different branch requiring its own finite response maps and anomaly ledger, proving item 1. The determinant-compatible abelian and global-form data are not fixed by a real connected algebra alone, giving item 6.

For matter packages, Theorem X.8d and Theorem X.8d.3 require vanishing of every local and torsion anomaly for transformations declared as redundancies, while Definition X.9.5e allows response-active defect fillings only when their descent obstruction is filled. Theorem G.8.4c.0e gives uniqueness exactly when the anomaly-zero class has a strict PCE gap. If the gap is absent, vectorlike, sterile, exotic, or defect-completed packages that pass the anomaly and response tests remain distinct branches, proving item 5. The generation alternatives are the cases separated in Theorem R.3.4, Proposition R.3.5.1a, Theorem R.8.5b, and Corollary R.8.5d, proving item 7. Finally, thresholds, flavor, neutrino, and baryogenesis depend on additional certificates; changing them while preserving the structural skeleton changes only the downstream branch, proving item 8. Since every candidate list in $\mathfrak C_{\mathrm{GMR}}$ is finite or compact with a finite response quotient and finite downstream maps, the catalog is bounded. ∎

**Corollary G.8.4c.1 (Exclusion of Simple Unification Groups).**
*Grand unified theories based on simple gauge groups are excluded by the capacity bound:*

| Group | $\dim(\mathfrak{g})$ | Status |
|:------|:-------------------:|:-------|
| $SU(5)$ | 24 | Excluded ($> 12$) |
| $SO(10)$ | 45 | Excluded ($> 12$) |
| $E_6$ | 78 | Excluded ($> 12$) |

*Proof.* The standard dimensions $\dim(SU(5)) = 24$, $\dim(SO(10)) = 45$, and $\dim(E_6) = 78$ are tabulated in [Slansky 1981]. By Theorem G.8.4a, the capacity bound $n_G \leq 12$ excludes all simple Lie algebras of dimension greater than 12. ∎


**Corollary G.8.4c.2 (Absence of GUT-Generator-Mediated Proton Decay on the Saturated Branch).** On the branch carrying the injective isotropic gauge-capacity certificate and the saturated Standard Model block-frame algebra, there are no additional gauge generators in $\mathfrak g_{\mathrm{GUT}}/\mathfrak g_{\mathrm{SM}}$. Hence proton-decay amplitudes mediated specifically by $X,Y$ gauge bosons of a larger unified gauge algebra vanish on this branch.

*Proof.* Such $X,Y$ bosons correspond to additional generators beyond the twelve generators of $\mathfrak g_{\mathrm{SM}}$ [Georgi & Glashow 1974; Langacker 1981]. The certified bound $n_G\le12$ and saturation by $\mathfrak g_{\mathrm{SM}}$ exclude those additional generators. This argument does not classify massive vector matter, higher-dimensional baryon-violating operators, or other non-GUT mechanisms. ∎


**Remark G.8.4c.3: Experimental Status.** Current experimental lower limits on partial lifetimes are $\tau/B(p \to e^+ \pi^0) > 2.4 \times 10^{34}$ years and $\tau/B(p \to \mu^+ \pi^0) > 1.6 \times 10^{34}$ years [Super-Kamiokande Collaboration 2020]. Minimal $SU(5)$ scenarios typically predict $\tau/B(p \to e^+ \pi^0)$ in the $10^{31}$–$10^{32}$ year range (model-dependent), which is excluded by more than two orders of magnitude [Nath & Fileviez Pérez 2007; Langacker 1981]. On the saturated certified branch, PU predicts continued null results only for proton-decay modes mediated by the excluded $X,Y$ generators of a larger unified gauge algebra; Corollary G.8.4c.2 does not exclude other baryon-violating mechanisms.


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

**Corollary G.8.4e.1c (Hypercharge Ratios and Primitive Character Convention).** On the minimal flag-lift branch of Theorem G.8.4e.1b, the anomaly and Yukawa equations fix the nontrivial hypercharge ray
$$
(y_q,y_{u^c},y_{d^c},y_\ell,y_{e^c},y_H)
=
a(1,-4,2,-3,6,3),
\qquad a\ne0.
$$
If the global $U(1)$ period and primitive character lattice are registered, the primitive integer vector is unique up to sign. Choosing the convention $y_{e^c}=1$ gives $a=1/6$.

*Proof.* Theorem G.8.4e.1b solves the equations and gives the displayed one-dimensional solution space. The integer vector $(1,-4,2,-3,6,3)$ has greatest common divisor one, so it is primitive and unique up to sign within the chosen character lattice. The normalization $y_{e^c}=1$ is $6a=1$, hence $a=1/6$. Before the global period and coupling convention are registered, the transformation $y_i\mapsto\lambda y_i$, $g_1\mapsto g_1/\lambda$ leaves every covariant derivative unchanged. ∎

**Remark G.8.4e.2 (Scope of the Lift).** Theorem G.8.4b and Corollary G.8.4c remain statements about the abstract inactive fiber $\mathcal B\cong \mathbb C^6$. Theorems G.8.4e and G.8.4e.1 show that this fiberwise $(3,2,1)$ decomposition does not globalize on the bare universal quotient bundle $Q\to \mathrm{Gr}(2,8)$ and that $\widetilde X$ is, up to unique isomorphism over $\mathrm{Gr}(2,8)$, the corresponding universal global lift on which the ordered decomposition is realized as smooth bundle data. The derivations of $d_0=8$, $a=2$, $M=24$, $D=4$, and the first-order fine-structure constant remain on bare $\mathrm{Gr}(2,8)$. The flag lift is required exactly when the ordered $Y/W/C$ sector splitting must be treated as global bundle data: the Chern-character anomaly bookkeeping of Theorem G.8.4e.1b, the generation-index globalization of Proposition R.IDX2a, and the quantitative gauge-threshold sector of Appendix T.

**Remark G.8.4e.3 (Four-Level Obstruction and Resolution Chain — Motivation for the Flag Lift).** Four independent mathematical results collectively forced the reformulation of the gauge-threshold sector from bare $\mathrm{Gr}(2,8)$ to the minimal flag lift:

1. **Pointwise Bures bound.** For any traceless generator $X$ with $\mathrm{Tr}(X^2) = 1/2$ and any rank-2 projector $P$ on $\mathbb{C}^8$, the Bures norm satisfies $\|X^\#\|_B^2(P) = \frac{1}{2}\mathrm{Tr}(BB^\dagger) \leq 1/8$. This bound is pointwise and measure-independent, so any orbit-averaged Bures-norm $Z_i$ satisfies $Z_i \leq 1/8 = 0.125$. The required gauge-matching values $Z_i \approx 1.7$ exceed this bound by a factor of $\sim 14$.

2. **$\mathrm{Ad}(U(8))$-invariance of spectral quadratic forms.** For any $U(8)$-equivariant Laplace-type operator on a $U(8)$-equivariant bundle over $\mathrm{Gr}(2,8)$, the renormalized quadratic form on generators is $\mathrm{Ad}(U(8))$-invariant, hence proportional to $\mathrm{Tr}(Y^2)$ for traceless generators. This forces equal thresholds $\Delta_1 = \Delta_2 = \Delta_3$ for any one-loop computation on the bare homogeneous geometry.

3. **Topological no-go (Theorem G.8.4e).** The universal quotient bundle $Q \to \mathrm{Gr}(2,8)$ admits no complex line subbundle, and therefore no global smooth $(1,2,3)$ splitting. This is a topological obstruction: the top Chern class $c_6(i^*Q \otimes \mathcal{O}(-m)) = f(m) \cdot h^6$ is nonzero for every integer $m$, where $f(m) = 1 - m + m^2 - m^3 + m^4 - m^5 + m^6 > 0$ for all $m \in \mathbb{Z}$.

4. **Nonzero singlet hypercharge from the SU(5) embedding and trace constraint (Remark T.17a.1).** The SU(5)-normalized hypercharge generator $\hat Y$ (Theorem T.9) has eigenvalues $(-2,-2,-2,3,3,0,0,0)/(2\sqrt{15})$ on $\mathbb{C}^8$. The unique $G_{\mathrm{SM}}$-module decomposition $\mathcal{B} = \mathbb{C}^3_C \oplus \mathbb{C}^2_W \oplus \mathbb{C}^1_Y$ (Theorem G.8.4b) identifies the per-component sector charges $y_C = -1/\sqrt{15}$ and $y_W = 3/(2\sqrt{15})$ from the eigenvalue assignment. Tracelessness of $\hat Y$ on $\mathbb{C}^8$ then forces the singlet charge: $3y_C + 2y_W + y_Y = \mathrm{Tr}(\hat Y|_{\mathcal{B}}) = -\mathrm{Tr}(\hat Y|_{\mathcal{A}}) = 2/\sqrt{15}$, and since $3y_C + 2y_W = 0$, this gives $y_Y = 2/\sqrt{15}$. The resulting $U(1)$ Dynkin index $T_1(Y) = 2y_Y^2 = 8/15$ makes the $3 \times 3$ Dynkin matrix $T$ invertible ($\det T = -8/15$). Without this charge, $\Delta_1$ would be rigidly constrained to $\approx 19.93$, incompatible with the target $15.14$.

Obstruction (1) blocks the original Bures-norm-based Definition T.17a. Obstruction (2) blocks the effective-action replacement on bare $\mathrm{Gr}(2,8)$. Obstruction (3) proves that no construction — from the PU axioms or otherwise — can produce the required gauge-sector splitting as subbundles of the bare quotient bundle $Q$. Finding (4) demonstrates that the lifted spectral structure possesses the correct Dynkin index anatomy to accommodate the target threshold tuple, with all charges determined by the embedding rather than by free parameters.

The minimal flag lift $\widetilde X = \mathrm{Flag}_{1,2,3}(Q)$ resolves all three obstructions and supplies the structural prediction (4) simultaneously: on $\widetilde X$, the pulled-back bundle $\pi^*Q$ tautologically splits as $(1,2,3)$, the operator $D^{\mathrm{PCE}}_{\widetilde X}$ is $G_{\mathrm{SM}}$-equivariant but not $U(8)$-equivariant, the spectral threshold shifts $\Delta_i$ are gauge-factor-dependent by construction, and the Dynkin index matrix that governs the decomposition is invertible with all entries determined by the representation theory of the $SU(5)$ embedding. Proposition T.17a.3a gives only a conditional base-to-lift pullback identity for the local threshold contribution. Convention T.69a fixes the $\mathrm{MS2}_{\mu_G}$ finite part, Theorem T.69 isolates the global spectral remainder, Corollary T.69.1 supplies finite-block tail certification, and Theorem T.70 gives the sector/parity spectrum. Any completed flag-lift spectral problem then determines a definite threshold triplet and the minimal residual ledger by Theorem T.78. Remark T.17a.4 and Proposition T.17a.5 show that every sector-independent affine local truncation gives $F_Y>0$ and therefore cannot replace the global sector-resolving block functional used for the Appendix T validation comparison.

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

**Theorem G.8.4g (Classical Golay and QFI Lagrangians in a Marked Coordinate Carrier).** After choosing the marked integral symplectic basis specified below, the classical Golay code and the real QFI subspace $L_X$ define maximal-isotropic subspaces of the corresponding binary and real 24-dimensional symplectic carriers. Identifying $L_X$ with a retained gauge algebra additionally requires the injective gauge-response intertwiner of Corollary G.8.2f.

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

2. The real QFI subspace
$$
L_X:=\operatorname{span}_{\mathbb R}\{X_1,\ldots,X_{12}\}
$$
is a Lagrangian subspace of $(V_{\mathbb R},\omega)$.

3. The binary shear
$$
R_P(x,y)=(x,y+Px)
$$
is symplectic and maps the mod-two reduction of this chosen QFI Lagrangian onto the Golay Lagrangian:
$$
R_P(\overline L_X)=\mathcal G_{24},
\qquad
\overline L_X=\mathbb F_2^{12}\oplus0.
$$

Consequently, after fixing the integral symplectic basis and systematic Golay frame, the mod-two reduction of the chosen real QFI Lagrangian is carried to the Golay Lagrangian by the binary symplectic shear $R_P$. This is a coordinate-level relation between a real symplectic lattice reduction and a binary code. It does not identify the Lie bracket of $\mathfrak g_{\mathrm{SM}}$ with binary addition or supply a gauge-response map.

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
The Standard Model algebra on the certified branch and the QFI Lagrangian $L_X$ both have dimension $12$, while the coding branch supplies a marked $[24,12,8]$ Golay code. Identifying the Lie algebra with $L_X$ requires the separate injective intertwiner of Corollary G.8.2f. ∎

**Remark G.8.4g.1: Clarification on CSS Quantum Codes.**

The self-dual CSS construction defines a $[[24,0]]$ stabilizer state with zero logical qubits; the additional label $8$ may be used only under an explicitly stated minimum-stabilizer-weight state convention, not as a protected logical-code distance,



**Remark G.8.4g.1a: Mathematical Golay CSS State and Physical Boundary.** The self-dual CSS construction has $k_{quantum}=0$ and therefore specifies a unique stabilizer state rather than a logical code space. The code's classical minimum weight and the state's stabilizer weights are mathematical invariants, but they do not establish a protected physical vacuum, a hardware-noise floor, or a residual syndrome spectrum.

A physical-vacuum claim requires a registered Hamiltonian or dynamics together with an encoder, channel, measurement, recovery operation, and response map. Mathieu invariance of the marked state is a symmetry fact and does not supply those data.


$$|\Omega_{\text{Golay}}\rangle = \frac{1}{64} \sum_{c \in \mathcal{G}_{24}} |c\rangle$$
This state is stabilized by 24 independent generators: 12 X-type generators $S_i^X = X^{g_i}$ (where $g_i$ is the $i$-th row of a generator matrix) and 12 Z-type generators $S_j^Z = Z^{h_j}$ (where $h_j$ is the $j$-th row of a parity-check matrix). The "12 + 12" structure thus manifests as stabilizer generators rather than signal versus parity qubits. The Golay minimum distance 8 implies that the smallest-weight non-identity stabilizer elements have weight 8; equivalently, any Pauli error of weight less than 8 produces a nontrivial syndrome under stabilizer measurement. The state is invariant under the Mathieu group $M_{24} = \operatorname{Aut}(\mathcal{G}_{24})$, with $|M_{24}| = 244,823,040$.

On the residual-syndrome branch of Appendix Z, this stabilizer/vacuum interpretation becomes experimentally diagnostic rather than merely structural. Ordinary hardware noise may still generate low-weight errors, but after those device-local channels are modeled and separated, the exact substrate component has no native nonzero shell below weight 8 and its leading correlated shell is the 759-octad shell. Thus the test is not whether all physical errors have high weight; it is whether the irreducible residual correlated component, in a marked 24-mode interface frame, carries the $M_{24}$-symmetric Golay shell fingerprint.

**Remark G.8.4g.2: Functional and Carrier-Level Readings.** Within PU, gauge redundancy can be interpreted as the operational redundancy of an error-correcting vacuum organization. Gauge transformations identify descriptions with the same physical content, just as parity constraints identify codewords belonging to the protected code structure. The carrier-level statement is exact by Theorem G.8.4g: both sides are Lagrangian structures on the same 24-mode interface after the marked frame is fixed. The functional statement is more limited: the Lie bracket of $\mathfrak g_{\mathrm{SM}}$ is not binary code addition, and individual gauge transformations are not individual Golay codewords.

**Corollary G.8.4g.3 (Mathieu Compatibility Does Not Replace Capacity Selection).** On the marked Golay-Leech branch, $M_{24}$ acts as the permutation automorphism group of the marked Golay carrier and preserves the carrier-level code structure used in Theorem G.8.4g. This action does not by itself determine a canonical ordered decomposition
$$
\mathcal B\cong\mathbb C^3\oplus\mathbb C^2\oplus\mathbb C^1
$$
of the inactive fiber, nor does it determine hypercharge assignments or a chiral matter package. The Standard Model gauge algebra remains selected by the finite-response capacity and determinant-compatible block-frame analysis of Theorem G.8.4b and Corollary G.8.4c; matter-package selection remains governed by the anomaly-bordism strict-gap gate of Theorem G.8.4c.0e.

*Proof.* The group $M_{24}$ preserves the marked $24$-coordinate Golay carrier. A permutation action on that carrier is not the same datum as an ordered complex block decomposition of the inactive fiber $\mathcal B\cong\mathbb C^6$. The ordered $3+2+1$ split is supplied in Appendix G by the finite-response partition enumeration and the generator-capacity saturation calculation, which leave one abelian response direction after the $8+3$ nonabelian generators. Hypercharge and chiral matter require the separate anomaly and Yukawa-compatibility data recorded in Theorem G.8.4c.0e. Hence Mathieu symmetry is a compatibility and carrier-stabilizer datum, not a replacement selector for the gauge algebra or matter spectrum. ∎

### G.8.4h Predictive Interface Tensor Category and Global-Symmetry Exclusion

**Definition G.8.4h.1 (Predictive Interface Tensor Category).** Let the PCE-selected inactive-sector decomposition of Theorem G.8.4b be written
$$
\mathcal B=C\oplus W\oplus Y,
\qquad
\dim C=3,\quad\dim W=2,\quad\dim Y=1.
$$
The predictive interface tensor category $\mathsf C_{\mathrm{int}}$ is the idempotent-complete rigid symmetric monoidal $C^*$-category generated by $C$, $W$, and their duals. Its generating morphisms are identities, symmetry maps, evaluation and coevaluation maps, the Hermitian forms and their adjoints, and a chosen unit vector and covector in
$$
\Lambda^3C\otimes\Lambda^2W.
$$
All other morphisms are obtained from these by composition, tensor product, finite direct sum, adjoint, and idempotent splitting; no additional generator-changing morphisms are included. The one-dimensional sector $Y$ records the determinant marker and is not an independent phase generator. Let
$$
F_{\mathrm{int}}:\mathsf C_{\mathrm{int}}\to\mathrm{Hilb}_{\mathrm{fd}}
$$
be the faithful forgetful fiber functor.

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

**Corollary G.8.4h.3 (Operationally Null Labels and Fiberwise Symmetry Scope).** Let $\eta$ be an exact symmetry label on the selected interface branch.

1. If $\eta$ acts trivially on every object, morphism, and admissible local interface response, then it is operationally trivial and is removed by the PPI/PCE quotient.
2. If $\eta$ is implemented by a unitary tensor natural automorphism of $F_{\mathrm{int}}$, then Theorem G.8.4h.2 places its connected fiberwise action in $S(U(3)\times U(2))$.
3. Tensor autoequivalences that permute objects, outer automorphisms, invertible defects, and higher symmetries are not classified by Theorem G.8.4h.2. Excluding or identifying them requires a separate operational-symmetry certificate.

*Proof.* In case 1, every admitted protocol has the same response before and after applying $\eta$, so Definition X.9.1 identifies the descriptions and Proposition X.9.3 makes the surplus label PCE-degenerate. In case 2, the implementation is an element of $\operatorname{Aut}^{\otimes}_u(F_{\mathrm{int}})$ by hypothesis, and Theorem G.8.4h.2 identifies that group with $S(U(3)\times U(2))$. Case 3 follows because an autoequivalence may change objects and therefore is not, in general, a natural automorphism of a given fiber functor. ∎

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

2. Every invertible defect class acts by a tensor autoequivalence on the finite interface response category. The subclass whose restriction is implemented by a connected unitary tensor natural automorphism of $F_{\mathrm{int}}$ has fiberwise action
$$
S(U(3)\times U(2)).
\tag{G.8.4i.1}
$$
Invertible classes acting by object permutations, outer autoequivalences, or other discrete defect data remain elements of $\operatorname{Pic}(\mathsf{Def}_{\mathrm{PU}})$ and require separate response and stabilizer tests.

3. A non-invertible defect is physically retained only when it induces a non-identity natural transformation of the protocol-response presheaf. Response-null defects are PCE-degenerate and are identified with the transparent interface.

4. Assume that the local module actions on a finite protocol cover have overlap comparisons valued in a specified abelian sheaf $\mathcal Z$ of central unitary natural automorphisms, and that their triple-overlap associator mismatches define a Cech $2$-cocycle $\omega_{\mathsf{Def}}\in Z^2(\mathcal U,\mathcal Z)$. Then
$$
[\omega_{\mathsf{Def}}]=0
\tag{G.8.4i.2}
$$
if and only if those local actions can be modified by a $1$-cochain to glue to a global module-category action. Without the central abelian coefficient hypothesis, descent is a nonabelian or higher-categorical problem not classified by (G.8.4i.2).

*Proof.* By Definition G.8.4i.1, $\mathsf{Def}_{\mathrm{PU}}$ is finite semisimple, idempotent-complete, $C^*$-linear, rigid, and monoidal, with simple transparent tensor unit after quotienting response-null refinements. This is precisely the finite unitary fusion-category condition, proving item 1.

Let $D\in\operatorname{Pic}(\mathsf{Def}_{\mathrm{PU}})$. Then there exists $D^{-1}$ with
$$
D\otimes D^{-1}\cong 1\cong D^{-1}\otimes D,
$$
so $D$ acts by a tensor autoequivalence on the finite interface response category. If the branch certificate further supplies a monoidal natural identification of $F_{\mathrm{int}}\circ D$ with $F_{\mathrm{int}}$ whose fiber action lies in the identity component, that identification defines an element of $\operatorname{Aut}^{\otimes}_u(F_{\mathrm{int}})$. Theorem G.8.4h.2 then identifies this connected fiberwise subgroup with $S(U(3)\times U(2))$. Without the natural identification, $D$ remains an invertible defect autoequivalence and is not classified by Theorem G.8.4h.2. This proves the scoped item 2.

If a defect is response-null, then every admissible local protocol has the same outcome law before and after inserting the defect. The operational Yoneda reconstruction theorem identifies physical structure by the natural family of all protocol responses; therefore a response-null defect is PPI-identical to the transparent interface. Since retaining it adds interface description cost with zero predictive benefit, PCE removes it. Conversely, if the induced natural transformation is not the identity, at least one protocol response differs, so the defect is not operationally null. This proves item 3.

For item 4, impose the stated coefficient hypothesis: overlap comparisons take values in the abelian sheaf $\mathcal Z$ of central unitary natural automorphisms. On triple overlaps, the failure of the comparisons to satisfy the module associativity relation is a $2$-cochain $\omega_{\mathsf{Def}}$. The pentagon identity gives the Cech cocycle condition $\delta\omega_{\mathsf{Def}}=1$. Replacing the overlap comparisons by a $1$-cochain $b$ changes the mismatch to $\omega_{\mathsf{Def}}\delta b$. Hence a choice with zero mismatch exists exactly when $\omega_{\mathsf{Def}}$ is a coboundary, equivalently when $[\omega_{\mathsf{Def}}]=0$. This proves the conditional module-descent statement. ∎

### G.8.5 Conditional Common-Branch Gauge, Matter, and Family Selection

The PU framework provides a dependency-locked co-selection theorem on the intersection of its registered branches. The channel-complete Bures tangent-cell contract selects $D_{\rm car}=4$; the positive-marginal capacity-saturating block-frame branch selects the Standard Model gauge algebra; and the anomaly, matter/EWSB, and family certificates below select their stated packages. The combined conclusion follows when these records are accepted on one overlap-audited branch, rather than from an unspecified global PCE potential.

1.  **Euclidean response-carrier input and physical-promotion gate:**
    The equalities $M=2ab=24=\dim_{\mathbb R}\operatorname{Gr}(2,8)$ and $K(4)=24$ provide the internal/geometric compatibility check. The selection theorem is the separate Appendix Z faithful Bures tangent-shell contract: Theorem Z.10 gives $24\le K(D)$, $K(3)=12$ excludes lower dimensions, the regular $24$-cell proves feasibility in four, and Definition Z.9a's strict surplus-dimension cost makes $D=4$ the unique least-feasible choice.

2.  **Conditional selection of $G_{SM}$, hypercharge, and family count on the common certified branch:**
    On one common branch carrying (i) the $D_{\rm car}=4$ carrier certificate, (ii) an accepted Lorentzian promotion to $D_{\rm st}=4$ with the chiral matter complex and anomaly operator defined on that same base, and (iii) the positive-marginal capacity, full-block response, anomaly-cancellation, and matter certificates, the following finite comparisons select the retained gauge and matter data.
    *   **Gauge algebra $\mathfrak g_{SM}$.** By the finite syndrome normal form and exhaustive partition analysis (Lemma G.8.4a.1, Theorem G.8.4b, Corollary G.8.4c), the decomposition $\mathcal{B}=\mathbb{C}^3\oplus\mathbb{C}^2\oplus\mathbb{C}^1$ is uniquely selected in the positive-marginal capacity-saturating block-frame branch. The non-abelian part contributes $\mathfrak{su}(3)\oplus\mathfrak{su}(2)$ with dimension $8+3=11$. The PU Lagrangian capacity bound on jointly estimable generators (Theorem G.8.2e; Eq. G.8.0) leaves exactly one retained abelian response direction, since $12-11=1$. Thus the retained gauge algebra is $\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak{u}(1)$ (Proposition G.M1; Corollary G.8.4c). Simple unification groups are excluded by the same capacity bounds (Theorem G.8.4a, Corollary G.8.4c.1). The total generator count $n_G=12$ saturates the Lagrangian capacity bound (Theorem G.8.2e), lies within the channel capacity range (Equation G.8.0), and equals the Golay code dimension $k=12$ only after the predictive-recovery self-dual-rate gate (Theorem Z.13). The tree-level Weinberg angle $\sin^2\theta_W^{(0)}=3/8$ emerges from PCE isotropy at the PU fixed point without requiring grand unified gauge symmetry; the value $3/8$ coincides with the standard tree-level $SU(5)$ unification prediction [de Boer 1994] (Appendix T, Theorem T.14).
    *   **Minimal chiral anomaly package and hypercharge uniqueness.** Gauge redundancy is a finite-response quotient; therefore a quantum anomaly in the declared gauge redundancy is not admissible, because it would make two gauge-identified histories assign different finite response phases.


       **Theorem G.8.5a (Minimal-Support One-Family Chiral Anomaly Package).** In the $D=4$ chiral-continuum branch with gauge algebra
       $$
       \mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
       $$
       restrict the candidate class to left-chiral sums built from $(3,2)$, $(\bar3,1)$, $(1,2)$, and $(1,1)$ atoms, with exactly one retained abelian seed $Q=(3,2)_{y_q}$ satisfying $y_q\ne0$, no vectorlike pair, and no gauge-null sterile singlet. Order candidates lexicographically by total representation dimension and then by the number of irreducible summands. Among nontrivial anomaly-free candidates in this class, the unique minimal-support package, up to exchange of the two anti-triplet singlets, is
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
       The primitive compact-$U(1)$ character is $(1,-4,2,-3,6)$ up to overall sign. Under the separate Standard Model convention $y_{e^c}=1$, equivalently $y_q=1/6$, this gives
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
       The charge ratio is therefore $1:-4:2:-3:6$. Compact-character primitivity fixes the integer vector only up to sign; the separately declared convention $y_{e^c}=1$ divides it by $6$ and gives the displayed Standard Model normalization. Higher representations, vectorlike mirror pairs, or sterile gauge-null singlets add representation cost or response-null content and are not part of the minimal package. ∎

       **Corollary G.8.5a.1 (Primitive Minimal-Support One-Family Package).** In the candidate class and lexicographic minimality order of Theorem G.8.5a, the anomaly-closed package containing one retained cross-interface seed $Q$ is
       $$
       Q_{1/6}\oplus U_{-2/3}\oplus D_{1/3}\oplus L_{-1/2}\oplus E_1.
       \tag{G.8.5a.1}
       $$
       It is primitive within that specified minimal support. The theorem does not classify the Hilbert basis of the unrestricted anomaly-free matter semigroup; such a classification would require a complete enumeration of all allowed multiplicity and charge solutions. Vectorlike pairs are anomaly-null but PCE-surplus on the minimal chiral branch, and sterile singlets are gauge-response-null unless a later neutrino or seesaw branch retains them.

       *Proof.* The color cubic anomaly of $Q$ is $+2$ in fundamental units because $Q$ contains two color triplets. Anomaly cancellation in the non-vectorlike fundamental semigroup therefore requires two anti-triplet weak singlets. Thus the primitive color-canceling seed is $Q\oplus U\oplus D$ up to relabeling of the two anti-triplets. The seed contains three weak doublets, one per color, so Witten's global $SU(2)$ condition requires an odd number of additional colorless weak doublets; the primitive choice is one $L$. The mixed anomalies are then
       $$
       2y_q+y_U+y_D=0,
       \qquad
       3y_q+y_L=0.
       \tag{G.8.5a.2}
       $$
       Hence $y_U+y_D=-2y_q$ and $y_L=-3y_q$. Without a charged singlet the mixed gravitational anomaly is
       $$
       6y_q+3y_U+3y_D+2y_L
       =6y_q+3(-2y_q)+2(-3y_q)
       =-6y_q.
       $$
       The retained abelian branch has $y_q\ne0$, so primitive cancellation requires one singlet $E$ with
       $$
       y_E=6y_q.
       \tag{G.8.5a.3}
       $$
       The cubic abelian anomaly becomes
       $$
       6y_q^3+3y_U^3+3y_D^3+2(-3y_q)^3+(6y_q)^3=0.
       \tag{G.8.5a.4}
       $$
       Let $s=y_U+y_D=-2y_q$ and $p=y_Uy_D$. Since $y_U^3+y_D^3=s^3-3ps$, equation (G.8.5a.4) is
       $$
       6y_q^3+3((-2y_q)^3-3p(-2y_q))-54y_q^3+216y_q^3=0,
       $$
       equivalently
       $$
       18y_q(p+8y_q^2)=0.
       $$
       Since $y_q\ne0$, $p=-8y_q^2$. Thus $y_U$ and $y_D$ are the roots of
       $$
       t^2-(y_U+y_D)t+y_Uy_D
       =t^2+2y_qt-8y_q^2=0,
       $$
       so
       $$
       \{y_U,y_D\}=\{-4y_q,2y_q\}.
       $$
       The primitive character has $y_q=1$ up to sign. Applying the separate Standard Model convention $y_{e^c}=1$ rescales it by $1/6$ and gives (G.8.5a.1). Reducing any nonzero multiplicity in the stated five-atom support leaves either the color cubic anomaly, the $SU(2)$ global anomaly, the mixed gravitational anomaly, or the cubic abelian anomaly uncancelled. Adding the conjugate of a retained representation produces a vectorlike anomaly-null pair, and adding $(1,1)_0$ changes no gauge response. Therefore the displayed package is the unique primitive anomaly-free element on the specified minimal support. No Hilbert-basis claim for unrestricted supports follows from this calculation. ∎

    *   **Hypercharge Uniqueness with one Higgs doublet.** Let the left‑chiral hypercharges be $y_q,y_{u^c},y_{d^c},y_\ell,y_{e^c}$. Imposing cancellation of all local and mixed gauge and gravitational anomalies in $D=4$ yields the constraints:
        $$
        \begin{alignedat}{2}
        &[SU(3)]^2 U(1): &\quad &2y_q+y_{u^c}+y_{d^c}=0,\\
        &[SU(2)]^2 U(1): &\quad &N_c y_q+y_\ell=0,\\
        &[\text{grav}]^2 U(1): &\quad &2N_c y_q+N_c y_{u^c}+N_c y_{d^c}+2y_\ell+y_{e^c}=0,\\
        &[U(1)]^3: &\quad &N_c(2y_q^3+y_{u^c}^3+y_{d^c}^3)+2y_\ell^3+y_{e^c}^3=0.
        \end{alignedat}
        $$
        Treating $N_c$ as a variable, the anomaly constraints admit the family $y_\ell=-N_cy_q$, $y_{e^c}=2N_cy_q$, $y_{d^c}=(N_c-1)y_q$, and $y_{u^c}=-(N_c+1)y_q$. Witten's global $SU(2)$ anomaly requires $N_c$ to be odd. On the certified gauge-capacity branch, $n_G=(N_c^2-1)+3+1=N_c^2+3\le12$, so $N_c\le3$. If the color factor is required to be nontrivial, then $N_c\ge2$; oddness and the upper bound yield $N_c=3$. The resulting charge ratios are the Standard Model ratios, up to overall normalization and sign:
        $$
        y_q=\tfrac{1}{6},\quad y_{u^c}=-\tfrac{2}{3},\quad y_{d^c}=\tfrac{1}{3},\quad y_\ell=-\tfrac{1}{2},\quad y_{e^c}=1.
        $$
        This solution is also consistent with the global $SU(2)$ anomaly (4 doublets/family). Furthermore, requiring gauge invariance of the renormalizable Yukawa interactions with a single Higgs doublet $H$,
        $$
         y_q+y_H+y_{u^c}=0,\qquad y_q-y_H+y_{d^c}=0,\qquad y_\ell-y_H+y_{e^c}=0,
          $$

       **Theorem G.8.1a (Hypercharges Determined up to Overall Scale).** With one Higgs doublet $H$, impose Yukawa gauge invariance
       $$
       y_q+y_H+y_{u^c}=0,\qquad y_q-y_H+y_{d^c}=0,\qquad y_\ell-y_H+y_{e^c}=0,
       $$
       and the linear anomaly cancellations
       $$
       2y_q+y_{u^c}+y_{d^c}=0,\quad 3y_q+y_\ell=0,\quad 6y_q+3y_{u^c}+3y_{d^c}+2y_\ell+y_{e^c}=0.
       $$
       Then the unique solution up to an overall real scale $a$ is
       $$
       y_H=3a,\quad y_q=a,\quad y_{u^c}=-4a,\quad y_{d^c}=2a,\quad y_\ell=-3a,\quad y_{e^c}=6a,
       $$
       and the cubic $U(1)^3$ anomaly vanishes identically.

       *Proof.* The Yukawa equations give
       $$
       y_{u^c}=-y_q-y_H,
       \qquad
       y_{d^c}=-y_q+y_H,
       \qquad
       y_{e^c}=-y_\ell+y_H.
       $$
       The $SU(2)^2U(1)$ equation gives $y_\ell=-3y_q$. Substitution into the gravitational equation gives
       $$
       6y_q+3(-y_q-y_H)+3(-y_q+y_H)-6y_q+(3y_q+y_H)=0,
       $$
       hence $y_H=3y_q$. Setting $a=y_q$ yields the displayed vector; the $SU(3)^2U(1)$ equation becomes $2a-4a+2a=0$. Finally,
       $$
       6a^3+3(-4a)^3+3(2a)^3+2(-3a)^3+(6a)^3
       =(6-192+24-54+216)a^3=0.
       $$
       Thus all stated equations hold, and every solution is on this one-dimensional ray. ∎

       **Corollary G.8.2 (Primitive Hypercharge Convention).** The anomaly and Yukawa equations fix only the ray
       $$
       (y_q,y_H,y_{u^c},y_{d^c},y_\ell,y_{e^c})
       =a(1,3,-4,2,-3,6).
       $$
       If a compact $U(1)$ character lattice is registered and its primitive integer vector is chosen to be $(1,3,-4,2,-3,6)$, the convention $y_{e^c}=1$ gives $a=1/6$. A simultaneous positive rescaling of all charges and inverse rescaling of the gauge coupling is physically equivalent until that character normalization is registered.

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
       for a single real scale $a$.

       If the branch also carries the compact primitive character-lattice convention of Corollary G.8.2 and sets $y_{e^c}=1$, then
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

**Homogeneous Casimir spectral certificate.** Electroweak or homogeneous spectral entries are promoted only under the finite certificate $\mathfrak C_{\mathrm{Cas}}$. The certificate fixes the homogeneous space and metric, the isotropy bundles and sector operators, the branching tables and multiplicities up to cutoff, the Casimir shifts, the parity or Golay marking used to label sectors, the $\mathrm{MS2}_{\mu_G}$ finite-part convention, the residual tail estimate, and a forward-lock stating that these choices are fixed before comparison with measured masses or couplings.

    *   **Minimal-branch singlet scope.** In Theorems G.8.5a and G.8.1b, an added sterile field is gauge-null by the declared candidate class. Giving it nonzero hypercharge changes the abelian anomaly equations and requires compensating charged content or a separately registered response channel; that is a different branch. Thus neutrality follows for the sterile slot in this minimal anomaly/Yukawa class, not from a universal claim that every charged singlet lacks predictive response.
    *   **Conditional Family-Count Minimizer in the Declared Class.** Appendix R shows that, in the modeled family-charge sector, the smallest nontrivial anomaly-consistent family structure compatible with CP violation is $N=3$ with offsets $\{a,-a,0\}$ (Theorem R.3.4), and Proposition R.3.5.1a realizes this count exactly on the pre-flavor family-redundancy PPI branch. Proposition R.4.2 adds that the $D_4$ triality orbit, $E_8$/Leech scaffold, and $M=24=8\times 3$ structure are compatible with this count, but they do not provide an independent derivation.

3.  **Confluence and Co-selection:**
    On the channel-complete mode-matching branch, $D=4$ supplies the dimensional arena. Within the determinant-compatible finite-response block-frame family, the capacity-saturating algebra is $\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)$. The Standard Model chiral package is selected only in the one-seed fundamental-representation and anomaly/response class stated in Sections G.8.4c–G.8.5, and $N=3$ is the smallest CP-capable solution in the modeled family-charge class. The bound $n_G\le12$ excludes the enumerated simple gauge-mediated unification branches; it implies no proton decay through those excluded gauge bosons but does not exclude every baryon-number-violating mechanism.

    
### G.8.6 Emergent Couplings and Masses

The specific numerical values of gauge couplings ($g_s,g_2,g_Y$) and fermion Yukawas are determined by the location and depth of the PCE minimum. Computing these from first principles requires evaluating the D-dependent coefficients in the PCE potential (Equation G.8.5) from MPU microdynamics. The ratios between these couplings are further constrained by the PCE optimization, a topic explored in Appendix W, and a concrete, attractor-matched estimate for the fine-structure constant is provided in Appendix Z (with order‑unity matching fixed at the PCE capacity point).


## G.9 Rate-Level PCE Potential and the Pathway to $\alpha_{\mathrm{em}}$

This section develops a rate-level comparison formalism balancing the **power cost** of maintaining gauge coherence against a registered **predictive information rate**. Constraint-Coupling Duality (Theorem X.8c) identifies an active constraint multiplier with a coupling only after its KKT regularity and normalization map are specified, and Appendix W contributes additional branch identities. Appendix Z supplies a closed-form Thomson core and a separate residual ledger on its active-kernel, QFI/Bures, mode-channel, interaction-normalization, holonomy, Ward, and operator-realization branches. Once those records are supplied, the core expression has no continuously varied fit parameter; the physical Thomson value requires the applicable residual certificate and is not a consequence of symmetric-space curvature alone.

The rate-level PCE potential for a $U(1)$ gauge coupling $u=g_e^2$ is given by:
$$
\phi(u) = P_{\mathrm{cost}}(u) - \Gamma_0 V_{\mathrm{benefit}}(u)
$$
where $P_{\mathrm{cost}}(u) \approx A_{\mathrm{PCE}} u^{\gamma_{\mathrm{eff}}}$ is the power cost of maintaining coherence and $V_{\mathrm{benefit}}(u) = \sum_i \ln(1+\lambda_i u)$ is the per-event predictive information gain, derived from the Local Asymptotic Normality (LAN) of the MPU's predictive channel. The system seeks the value $u^*$ that minimizes this potential, subject to the alphabet capacity constraint $V_{\mathrm{benefit}}(u) \le \ln d_0$.

On the strict Legendre/LAN, locality, Ward, KKT, and normalization branch of Appendix X, a registered rate-level potential can be represented in the corresponding effective-action coordinates. The physical coupling is $\alpha_{\mathrm{em}}(\mu^*)=u^*/(4\pi\kappa)$ only after the normalization $\kappa$ and the matching scheme are specified. Appendix Z treats the QFI spectrum, interaction normalization, holonomy map, operator realization, and residual classes as entries of a completed finite certificate. Its output is unique relative to that completed record; the foundational constants alone do not determine all of those entries.


## G.1.9 Modular Representation and Certified Physical Equilibrium

The Born rule remains the independent result of Sections G.1.1--G.1.4 and Theorem G.1.7. Section G.1.9 supplies a common modular constraint-geometry representation for faithful probability states; it does not derive all probability measures from PCE-driven equilibration to Gibbs fixed points.

A modular representation $\rho\propto e^{-K_\rho}$ is available for every faithful state. Its promotion to physical thermal or horizon equilibrium requires the separate QDB/physical-time or complete-passivity certificate of Theorems G.1.9.3 and G.1.9.3c, together with the relevant constraint bridge. This is a structural unification of representations and certified equilibrium branches, not one universal dynamical origin for Born probabilities.

This section compares modular representations used in quantum, thermal, and horizon contexts. Every faithful finite-dimensional state can be written as $\rho=Z^{-1}e^{-K}$, but this algebraic form does not imply a common equilibration dynamics. ND-RID supplies physical equilibrium only on branches carrying the stationarity, detailed-balance, complete-passivity, or physical-time certificates stated below.

The resulting unification is representational: entropy and expectation values can be expressed through the same modular operator on their respective certified branches. Born probabilities remain determined by the independent frame-function and probability-calibration argument of Sections G.1.1--G.1.4.

### G.1.9.1 The Derivation Chain from SPAP to the Reference State

The logical foundation for probability measures in the PU framework traces through the following branch-qualified derivation chain:

$$
\text{declared binary reset support} \xrightarrow{\text{Prop 5; Def 28}} \varepsilon_0=\ln2 \xrightarrow{\text{Thm Z.1}} a = 2 \xrightarrow{\text{Def 15a}} \tau^* = \frac{I_a}{a} \oplus 0_b.
$$

**Stage 1: Structural Register and Conditional Reset Cost.** Proposition 5 and Definition 28 assign the declared binary reset support the structural log-cardinality
$$
\varepsilon_0=\ln2.
\tag{G.1.9.1}
$$
On the separately declared prescribed-ready binary-ancilla architecture, Lemma J.1 proves noninjectivity only when its reachable-domain hypothesis is satisfied. If that architecture executes a registered cyclic reset satisfying Definition 28, Theorem 31 and Appendix J, Theorem J.1 give
$$
\varepsilon_{\mathrm{reset}}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}
\ge H_q(P\mid R),
\qquad \varepsilon_{\mathrm{diss}}\ge0.
$$
A positive physical floor requires $H_q(P\mid R)\ge h_{\min}>0$; equality at $\ln2$ requires conditional binary uniformity and zero dissipative overhead. The PCE-Attractor uses the structural value $\varepsilon_0=\ln2$ for the discrete backbone (Definition 15a). The retained match/mismatch verification record gives $a\ge2$, and the entropy-capacity gate gives $\ln a\ge\varepsilon_0$; together with no-surplus selection they fix $a=2$ on that branch.

**Stage 2: Physical Instantiation of the Active Record.** PPI (Appendix P, Definition P.6.2) requires the retained sharp verification quotient to have a physical carrier. Its response alphabet contains the two distinct alternatives match and mismatch, so $a\ge2$ on the Hilbert-carrier branch. For an $a$-dimensional carrier, $S(\rho)\le\ln a$, with equality exactly at $I_a/a$. The structural binary value $\varepsilon_0=\ln2$ therefore satisfies the capacity gate $\ln a\ge\varepsilon_0$. Theorem Z.1's response-equivalence quotient, attained-rank premise, and strict no-surplus carrier cost select the least admissible integer:

$$
a = 2.
\tag{G.1.9.2}
$$

This two-dimensional active verification pointer physically carries the sharp match/mismatch record. If an implementation cyclically erases a conditionally uniform copy of that record with no retained side copy, Theorem 31 additionally gives a physical reset-heat floor $\ln2$ in the quasistatic zero-excess limit. The carrier dimension itself neither asserts that an erasure occurs nor turns the structural log-cardinality into heat.

**Stage 3: The PCE-Attractor State.** With $d_0 = 8$ on the minimal Appendix Z branch (Theorem Z.2; Theorem 23 gives $d_0\ge 8$) and $a = 2$, the inactive subspace has dimension $b = d_0 - a = 6$. The PCE-Attractor (Definition 15a) is the selected PCE reference configuration, maximally mixed on the active subspace and zero on the inactive complement; physical Gibbs equilibrium requires the independent selector below:



$$
\tau^* = \rho_0 = \frac{I_2}{2} \oplus 0_6
\tag{G.1.9.3}
$$

For the registered state $\tau^*|_{\mathcal A}=I_2/2$,
$$
S(\tau^*|_{\mathcal A})
=
-\operatorname{tr}\!\left(\frac{I_2}{2}\ln\frac{I_2}{2}\right)
=
\ln2
=
\varepsilon_0.
\tag{G.1.9.4}
$$
This is a numerical equality between the von Neumann entropy of the specified maximally mixed active state and the registered binary log-cardinality. It does not identify conditional reset entropy, bath heat, or entropy production, and it supplies no common-origin theorem.

### G.1.9.2 ND-RID Channel Structure and Fixed Points

**Definition G.1.9.1a (Active-Support Refresh Branch).** Let $\mathcal H_a\cong\mathbb C^2$ be the registered active support. On this optional branch the averaged active-support 'Evolve' channel is
$$
\mathcal E_{N,a}=(1-p)\Psi_a+pT_{\sigma_a},
\qquad
T_{\sigma_a}(\rho)=\operatorname{tr}(\rho)\sigma_a,
\tag{G.1.9.5}
$$
where $\Psi_a$ is CPTP on $\mathcal B(\mathcal H_a)$, $p\in(0,1]$ is a separately registered refresh weight, and $\sigma_a\succ0$ on $\mathcal H_a$. The conditional reset ledger $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ does not imply this decomposition or $p>0$; those are model data of the refresh branch. No full-space primitivity claim is made for $\mathcal H_a\oplus\mathcal H_b$.

**Theorem G.1.9.1 (Active-Support Contractivity and Conditional Primitivity of ND-RID).** On the branch of Definition G.1.9.1a, for all active-support states $\rho_1,\rho_2$,
$$
D_{tr}\!\bigl(\mathcal E_{N,a}(\rho_1),\mathcal E_{N,a}(\rho_2)\bigr)
\le(1-p)D_{tr}(\rho_1,\rho_2),
\qquad
f_{RID}\le1-p<1.
\tag{G.1.9.6}
$$
The channel is strictly positive on $\mathcal H_a$ and therefore has a unique faithful active-support fixed point $\rho_{\infty,a}$.

*Proof.* For $\Delta=\rho_1-\rho_2$, $\operatorname{tr}\Delta=0$ and $T_{\sigma_a}(\Delta)=0$. Hence
$$
\mathcal E_{N,a}(\Delta)=(1-p)\Psi_a(\Delta).
$$
Trace-distance contractivity of $\Psi_a$ proves (G.1.9.6). Moreover,
$$
\mathcal E_{N,a}(\rho)=(1-p)\Psi_a(\rho)+p\sigma_a\succ0
$$
for every active-support state $\rho$, so finite-dimensional strict positivity gives primitivity and a unique faithful fixed point on $\mathcal H_a$. ∎

**Remark G.1.9.1a (Attractor Compatibility Is a Separate Gate).** Primitivity fixes convergence to $\rho_{\infty,a}$, not its identity. It yields the PCE reference state $\tau_a^*=I_2/2$ only when the independent stationarity certificate
$$
\mathcal E_{N,a}(\tau_a^*)=\tau_a^*
\tag{G.1.9.6a}
$$
is registered. Extending $\tau_a^*$ by zero on $\mathcal H_b$ gives $\tau^*=(I_2/2)\oplus0_6$, which is rank deficient on the full carrier and is not the fixed point of a primitive full-space channel. PCE selection alone establishes neither this channel compatibility nor physical Gibbs/KMS equilibrium.

### G.1.9.3 PCE Optimization and Detailed Balance

The connection between PCE optimization and the thermal structure of the fixed point requires analysis of entropy production.

**Definition G.1.9.2a (Spohn Entropy-Production Ledger).** Let $\mathcal L_*$ generate a finite-dimensional CPTP semigroup $\Phi_t=e^{t\mathcal L_*}$ with faithful stationary state $\sigma$. For every state $\rho$, define the integrated production by
$$
\Sigma_\sigma[\rho;t]
:=D(\rho\Vert\sigma)-D(\Phi_t(\rho)\Vert\sigma)\ge0.
\tag{G.1.9.7b}
$$
The inequality follows from data processing and $\Phi_t(\sigma)=\sigma$. If $\Phi_s(\rho)\succ0$ for every $s$ in the retained interval, define
$$
\dot\Sigma_\sigma(\Phi_s(\rho))
:=-\operatorname{tr}\!\left[\mathcal L_*(\Phi_s(\rho))
\bigl(\log\Phi_s(\rho)-\log\sigma\bigr)\right]\ge0,
\tag{G.1.9.7a}
$$
and then
$$
\Sigma_\sigma[\rho;t]
=\int_0^t\dot\Sigma_\sigma(\Phi_s(\rho))\,ds.
$$
For a rank-deficient trajectory, (G.1.9.7b) remains the theorem-level definition; a pointwise rate formula is used only after a stated faithful regularization or an extended right-derivative convention is supplied. On a separately registered thermal weak-coupling branch this becomes the entropy balance $\dot\Sigma=dS/dt-\beta\dot Q$. Detailed balance does not set the production to zero for every nonequilibrium state; relaxation toward $\sigma$ can have positive production.

**Proposition G.1.9.2 (Conditional PCE Preference for Lower Production).** Suppose two admissible ND-RID semigroups have the same stationary state and predictive utility, and the POP/PCE functional is strictly increasing in a fixed registered integrated-production functional. Then PCE prefers the member with smaller registered production.

*Proof.* Under the hypotheses, the compared utility and stationary-state terms agree, so strict monotonicity in the remaining production term orders the two candidates. This comparison does not prove that a detailed-balance generator is admissible, unique, or selected; each of those claims needs its own finite certificate. ∎

**Theorem G.1.9.3 (Detailed-Balance Reversibility and Relaxation Production).** Let $\mathcal L_*$ be a finite-dimensional Schrödinger-picture GKLS generator with faithful stationary state $\sigma$ and decomposition
$$
\mathcal L_* = \mathcal L_{*,H}+\mathcal L_{*,D},
\qquad
\mathcal L_{*,H}(\rho)=-i[H,\rho],
\qquad
[H,\sigma]=0.
$$
Let $\mathcal L=\mathcal L_*^\dagger$ be the unital Heisenberg-picture generator and $\mathcal L_D=\mathcal L_{*,D}^\dagger$ its dissipative part. On the registered $\sigma$-GNS convention, quantum detailed balance is
$$
\langle A,\mathcal L_D(B)\rangle_\sigma
=
\langle\mathcal L_D(A),B\rangle_\sigma,
\qquad
\langle A,B\rangle_\sigma:=\operatorname{tr}(\sigma A^\dagger B).
\tag{G.1.9.8}
$$
This is an equilibrium-reversibility condition for the Heisenberg semigroup. It does not imply vanishing production for every initial state. Instead, the integrated production of Definition G.1.9.2a is nonnegative, it vanishes at $\sigma$, and its pointwise rate is nonnegative whenever that rate is defined under the faithful-state or regularized convention.

*Proof.* Equation (G.1.9.8) is the self-adjointness characterization of the registered GNS detailed-balance convention for the Heisenberg generator. The condition $[H,\sigma]=0$ makes the Heisenberg Hamiltonian part $i[H,\cdot]$ GNS-skew-adjoint. Stationarity and CPTP data processing give the integrated-production statements, while $\Phi_t(\sigma)=\sigma$ gives zero production at $\sigma$. A reversible classical Markov chain started away from stationarity already shows that detailed balance does not make relaxation production vanish for every state. ∎

**Corollary G.1.9.3a (Detailed Balance Requires an Independent Reversibility Certificate).** Proposition G.1.9.2 does not imply that a PCE-optimal ND-RID channel satisfies quantum detailed balance. The conclusion
$$
\mathcal E_N^*\text{ satisfies quantum detailed balance with respect to }\tau^*
$$
holds only on a branch that separately certifies stationarity of $\tau^*$, admissibility of a GNS-detailed-balance generator, and selection of that generator within the registered comparison class.

*Proof.* Proposition G.1.9.2 orders two already admissible channels only through a registered production functional and expressly supplies no reversibility condition. Theorem G.1.9.3 defines detailed balance by GNS self-adjointness, which is an additional operator identity. Therefore the displayed conclusion follows only when the three listed certificate entries are supplied. ∎

**Definition G.1.9.3b (Complete Passivity on the Physical-Hamiltonian Branch).** Let $H$ be a finite physical Hamiltonian with nontrivial simple spectrum, registered independently of $\rho$ by the physical-time evolution and battery/work convention. The physical certificate also records that the admitted cyclic controls are operationally complete for the unitary class quantified below; with a restricted control set, passivity is only relative to that set. A faithful state $\rho$ is passive when
$$
\operatorname{tr}(H\,U\rho U^\dagger)
\ge
\operatorname{tr}(H\rho)
\tag{G.1.9.3b.1}
$$
for every cyclic unitary $U$. It is completely passive when $\rho^{\otimes n}$ is passive for
$$
H^{(n)}=\sum_{j=1}^n
I^{\otimes(j-1)}\otimes H\otimes I^{\otimes(n-j)}
\tag{G.1.9.3b.2}
$$
for every $n\ge1$.

**Theorem G.1.9.3c (Complete Passivity Selects the Physical Gibbs/KMS State).** On the branch of Definition G.1.9.3b,
$$
\rho\text{ is completely passive}
\quad\Longleftrightarrow\quad
\rho=Z^{-1}e^{-\beta H}
\text{ for some }\beta\ge0.
\tag{G.1.9.3c.1}
$$
Equivalently, its modular Hamiltonian is affine in the physical generator,
$$
K_\rho=-\log\rho=\beta H+(\log Z)I.
\tag{G.1.9.3c.2}
$$
Thus KMS thermality with respect to physical time is not obtained merely by naming $-\log\rho$ a Hamiltonian; it is selected by the absence of hidden cyclic work at every copy number.

*Proof.* One-copy passivity forces $[\rho,H]=0$ and orders the populations oppositely to the energies. Write $H|i\rangle=E_i|i\rangle$ and $\rho|i\rangle=p_i|i\rangle$. The finite-dimensional complete-passivity theorem [Pusz & Woronowicz 1978; Lenard 1978] gives the forward implication; its finite-copy inversion step can be seen directly as follows. If the nonnegative transition slopes $\log(p_i/p_j)/(E_j-E_i)$ are not all equal, choose two with slopes $\beta_1<\beta_2$. Density of the rationals supplies positive integers $m,n$ for which the corresponding tensor-product energy difference and log-population difference have opposite signs. The two product eigenstates are then population-inverted, and their swap extracts work, contradicting complete passivity. Hence $\log p_i=-\beta E_i-\log Z$ with $\beta\ge0$. Conversely, for $\rho_\beta=Z^{-1}e^{-\beta H}$ and any unitary $U$,
$$
D(U\rho_\beta U^\dagger\Vert\rho_\beta)
=\beta\bigl(\operatorname{tr}(HU\rho_\beta U^\dagger)-\operatorname{tr}(H\rho_\beta)\bigr)\ge0,
$$
because unitary conjugation preserves entropy. The same identity holds for every tensor power, proving complete passivity. ∎

**Corollary G.1.9.3d (Passivity Scope and Falsification Boundary).** One-copy passivity is insufficient: it orders populations but need not impose one common inverse temperature. One finite work-extraction protocol falsifies complete passivity, but finitely many null protocols cannot certify the all-$n$, all-$U$ quantifier without the registered controllability/completeness theorem. Nonfaithful states supported entirely in a ground-energy eigenspace form the zero-temperature boundary case; degeneracies require the corresponding block version and are not covered by the simple-spectrum statement above. The special state $I_2/2$ realizes $\beta=0$ for every registered two-level $H$ but does not identify $H$.

### G.1.9.4 The Gibbs Structure of PCE-Optimal Fixed Points

**Definition G.1.9.4a (Modular Hamiltonian).** For a faithful finite-dimensional state $\rho$, the Gibbs representative is defined only modulo additive scalars: $K\sim K+cI$ because normalization removes $cI$. The gauge-fixed representative $K_\rho^{(0)}=-\log\rho$ is unique under the convention $Z=\operatorname{tr}(e^{-K_\rho^{(0)}})=1$; an arbitrary representative satisfies:



$$
\rho = \frac{e^{-K_\rho}}{Z}, \quad Z = \mathrm{tr}(e^{-K_\rho})
\tag{G.1.9.9}
$$

Explicitly, if $\rho=\sum_i p_i|i\rangle\langle i|$ with $p_i>0$, then $K_\rho^{(0)}=-\sum_i(\ln p_i)|i\rangle\langle i|$; every other representative is $K_\rho^{(0)}+cI$.



The modular Hamiltonian provides a representation bridge between probability and entropy: for $\rho=Z^{-1}e^{-K}$, $S(\rho)=\langle K\rangle+\ln Z$. This identity is invariant under $K\mapsto K+cI$ and holds for every faithful state. Its interpretation as physical Gibbs/KMS equilibrium requires the complete-passivity selector of Theorem G.1.9.3c or an equivalent physical-time certificate.



**Theorem G.1.9.4 (Gibbs Structure of PCE-Attractor).** The PCE-Attractor state $\tau^*$ (Equation G.1.9.3) has the Gibbs form when restricted to its support. On the active subspace $\mathcal{A} = \operatorname{supp}(\tau^*)$, the modular Hamiltonian is:

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

**Theorem G.1.9.5 (Modular KMS Identity and Physical-Time Boundary).** Let $\rho$ be faithful on a finite-dimensional algebra and let $K_\rho=-\log\rho$ up to an additive scalar. Then $\rho$ is a KMS state at modular inverse temperature $1$ for
$$
\sigma_t^\rho(A)=e^{-iK_\rho t}Ae^{iK_\rho t}=\rho^{it}A\rho^{-it},
$$
namely
$$
\omega_\rho(A\sigma_{t-i}^\rho(B))
=
\omega_\rho(\sigma_t^\rho(B)A).
\tag{G.1.9.11}
$$
This is the same modular-parameter convention as Definition F.10.4b.1. For a physical Gibbs state $\rho\propto e^{-\beta H}$ and Appendix F's convention $\alpha_\tau(A)=e^{-i\tau H}Ae^{i\tau H}$, one has $\sigma_t^\rho=\alpha_{\beta t}$ and the analytic boundary is $t-i$.

This is a representation identity for every faithful state; it neither follows from PCE selection nor identifies the modular parameter with physical time. A physical Gibbs/KMS interpretation relative to a registered Hamiltonian $H$ requires $K_\rho=\beta H+(\log Z)I$, as selected by Theorem G.1.9.3c or an equivalent independent certificate. For $\tau^*|_{\mathcal A}=I_2/2$, the modular flow is trivial and corresponds to $\beta=0$ for any registered two-level $H$; it does not determine $H$.

*Proof.* In finite dimension the identity follows by substituting $\rho\propto e^{-K_\rho}$ and using cyclicity of trace after analytic continuation by $-i$. The physical-time boundary is exactly Equation (G.1.9.3c.2). ∎

### G.1.9.5 Constraint Geometry and the Modular Hamiltonian

The unified framework emerges from recognizing that different physical contexts modify the modular Hamiltonian $K^*$ while preserving the Gibbs structure.

**Theorem G.1.9.6 (Conditional Modular-Hamiltonian Representations).** Let $K^*_{PCE}=(\ln2)I_a$ on the faithful active support.

1. For every faithful active-support state $\rho$, define $K_\rho=-\log\rho$ and
$$
K_{constraint}:=K_\rho-K^*_{PCE}.
$$
Then the identity
$$
K_\rho=K^*_{PCE}+K_{constraint}
\tag{G.1.9.12}
$$
holds, but it is a representation and not a dynamical derivation.
2. If $\rho$ is selected by maximizing von Neumann entropy subject to normalization and a prescribed mean energy $\operatorname{tr}(\rho H)=U$, then $K_\rho=\beta H+(\log Z)I$.
3. If a relativistic QFT satisfies the Bisognano-Wichmann hypotheses for the vacuum and a Rindler wedge algebra, then its wedge modular generator is the appropriately normalized Lorentz-boost generator, yielding the Unruh KMS temperature.

No statement that ND-RID dynamics select cases 2 or 3 follows without the respective maximum-entropy/complete-passivity or QFT modular certificate.

*Proof.*

**Part A (Quantum Measurement—Reference Case):** The quantum measurement case serves as the reference point of the unification. The Born rule derivation (Sections G.1.1–G.1.4) establishes that PCE-enforced non-contextuality and additivity yield $p_i = \mathrm{tr}(\rho_{phys} P_i)$ via Gleason's theorem [Gleason 1957]. 

By Definition G.1.9.4a, any faithful density matrix $\rho_{phys}$ admits the Gibbs representation $\rho_{phys} = Z^{-1}e^{-K}$ with $K = -\ln \rho_{phys}$. This is the identity case of the Gibbs structure—not an additional constraint but the baseline from which constraint modifications are measured. The measurement context (perspective $s \in \Sigma$) determines the basis $\{P_i\}$ in which probabilities are evaluated:

$$
p_i = \mathrm{tr}\left(\frac{e^{-K^*}}{Z} P_i\right) = \mathrm{tr}(\rho_{phys} P_i)
\tag{G.1.9.13}
$$

The substantive content of the unification lies in Parts B and C, where physical constraints impose structure on the modular Hamiltonian beyond this identity.

**Part B (Thermal Equilibrium under a Maximum-Entropy Selector):** Assume that the physical branch selects the state maximizing
$$
S(\rho)=-\operatorname{tr}(\rho\log\rho)
$$
subject to $\operatorname{tr}\rho=1$ and $\operatorname{tr}(\rho H)=U$. For faithful $\rho$, variation with multipliers $\lambda,\beta$ gives
$$
0=\delta\!\left[-\operatorname{tr}(\rho\log\rho)-\lambda(\operatorname{tr}\rho-1)-\beta(\operatorname{tr}(\rho H)-U)\right]
=
-\operatorname{tr}\!\left[\delta\rho(\log\rho+(1+\lambda)I+\beta H)\right].
$$
Arbitrariness of traceless Hermitian variations gives $\rho=Z^{-1}e^{-\beta H}$. Since $K^*_{PCE}=(\ln2)I_a$ on the active support,
$$
\rho^*_{thermal}
=
\frac{e^{-(K^*_{PCE}+\beta H)}}{Z}
\propto e^{-\beta H}.
\tag{G.1.9.14}
$$

**Part C (Rindler-Wedge Modular Generator):** Assume a Poincare-covariant vacuum representation satisfying the spectrum condition and the standard wedge-algebra hypotheses of the Bisognano-Wichmann theorem [Bisognano and Wichmann 1975, 1976]. Let $B$ be the dimensionless Lorentz-boost generator and let $H_\chi=\hbar\kappa B$ be the correspondingly normalized physical Killing-energy generator. Then
$$
K^*_{horizon}=2\pi B=\frac{2\pi}{\hbar\kappa}H_\chi.
\tag{G.1.9.15}
$$
Comparison with $e^{-H_\chi/(k_BT)}$ gives $k_BT_U=\hbar\kappa/(2\pi)$ in units $c=1$, or $T_U=\hbar\kappa/(2\pi k_Bc)$ when $\kappa$ is expressed as an acceleration. ∎

### G.1.9.6 Connection to the Entanglement First Law

The modular Hamiltonian structure connects directly to the entanglement first law, which is central to the derivation of Einstein's equations (Section 12, Theorem 50).

**Theorem G.1.9.7 (Entanglement First Law on a Certified Rindler-Wedge Branch).** Let $\rho(\lambda)$ be a differentiable normalized family with faithful reference state $\rho_0=\rho(0)$, and let $K_0=-\log\rho_0$. Then
$$
\left.\frac{d}{d\lambda}S(\rho(\lambda))\right|_{0}
=
\left.\frac{d}{d\lambda}\operatorname{tr}(\rho(\lambda)K_0)\right|_{0}.
\tag{G.1.9.16}
$$
If the reference is the Minkowski vacuum restricted to a Rindler wedge and the relativistic QFT satisfies the Bisognano-Wichmann hypotheses, the modular generator is the normalized boost generator. With the manuscript's horizon normalization,
$$
\delta S_{ent}
=
\frac{2\pi}{\hbar\kappa}
\int_{\mathcal H}
\delta\langle T_{\mu\nu}\rangle\chi^\mu d\Sigma^\nu
=
\frac{\delta Q}{k_BT_U}.
\tag{G.1.9.17}
$$
Here $S_{ent}$ is measured in nats and $\delta Q$ denotes the integrated flux. For a generic curved causal horizon, this formula requires a separate local-Rindler approximation and error estimate.

*Proof.* Write $\dot\rho=(d\rho/d\lambda)|_0$. Differentiability of the matrix logarithm on faithful states gives
$$
\left.\frac{d}{d\lambda}S(\rho(\lambda))\right|_0
=
-\operatorname{tr}(\dot\rho\log\rho_0)-\operatorname{tr}(\dot\rho).
$$
Normalization gives $\operatorname{tr}(\dot\rho)=0$, so the right-hand side is $\operatorname{tr}(\dot\rho K_0)=\delta\langle K_0\rangle$, proving (G.1.9.16). Equivalently, it is the vanishing first variation of relative entropy at its minimum [Blanco et al. 2013]. On the stated vacuum-wedge branch, the Bisognano-Wichmann theorem identifies $K_0$ with the normalized boost-energy integral [Bisognano and Wichmann 1975, 1976]. Substitution gives the integral in (G.1.9.17), and $k_BT_U=\hbar\kappa/(2\pi)$ in units $c=1$ gives the last equality. ∎

**Corollary G.1.9.7a (Operational Entropy-Density Normalization).** Theorem E.5 defines the effective Newton coupling by identifying the operational boundary-channel entropy density with
$$
\frac{1}{4G}
=\frac{\chi C_{\max}}{\eta\delta^2}.
\tag{G.1.9.18}
$$
On a branch that separately identifies the entanglement entropy density $\eta_{ent}$ with this operational channel-counting density and satisfies the local KMS/Clausius hypotheses of Section 12, one has $\eta_{ent}=1/(4G)$. The Clausius relation then consumes this normalization in the gravitational field-equation derivation; it does not independently prove uniqueness of an arbitrary entanglement coefficient.

The result $\eta_{ent} = 1/(4G)$ connects directly to the gravitational entropy in the unified entropy framework (Section P.6.5). The Bekenstein-Hawking entropy $S_{BH} = \mathcal{A}/4G$ arises from the channel capacity of ND-RID interactions crossing the horizon (Theorems E.3 and E.5). This is not an analogy but an identity: horizon entropy counts the Shannon entropy of channel capacity across the boundary, measured in Planck units. The derivation chain from SPAP to horizon entropy (Section P.6.5.2) makes this explicit:

$$
\text{completed binary reset-support certificate}\xrightarrow{\text{E.2a}} C_{\max}\le\ln d_0-\ln2 \xrightarrow{\text{E.3}} N_{eff} \propto \mathcal{A} \xrightarrow{\text{E.5}} S_{BH} = \frac{\mathcal{A}}{4G}
$$

### G.1.9.7 The Unified Mechanism

**Theorem G.1.9.8 (Unified Gibbs-form template for physical probability).** Within the finite-dimensional active sector, the probability assignments that appear in the Born-rule, thermal, and modular-equilibrium applications all take the Gibbs-form template
$$
\rho = Z^{-1}e^{-K},
$$
with the modular Hamiltonian $K$ determined by the relevant constraint geometry.

*Proof.* Sections G.1.1–G.1.8 identify measurement probabilities with expectation values computed from density operators. Theorems G.1.9.4 and G.1.9.5 give the PCE-attractor's modular representation and modular KMS identity; they do not establish physical equilibrium without Theorem G.1.9.3c.

 Theorem G.1.9.6 then records how additional physical constraints modify the modular Hamiltonian additively while preserving the same Gibbs-form template. Therefore the probability structures considered in these sections share a common Gibbs-form representation, with differences encoded in the constraint term entering $K$. QED

### G.1.9.8 Separated Structural and Physical Ledgers at $\ln2$

The value $\varepsilon_0=\ln2$ is a structural log-cardinality, not a universal entropy cost or conversion constant.

**Theorem G.1.9.9 (Conditional Landauer and Carrier Ledger).** On the row-specific branches listed below, the four identities and inequalities hold. They hold simultaneously on the intersection of those branches, and no row implies another.

| Domain | Quantity | Required branch |
|--------|----------|-----------------|
| Structural | $\varepsilon_0=\ln2$ | Registered reachable binary quotient |
| Thermodynamic | $Q_{\mathrm{bath}}\ge k_BT\ln2$ | Conditionally uniform binary reset with no retained copy |
| Information | $a=2$ | Theorem Z.1 sharp-record, capacity, and no-surplus branch |
| Geometric | $M=2ab=24$ | Theorem Z.5 with $d_0=8$, $a=2$, and $b=6$ |

*Proof.* Definition 28, Definition J.1, and Theorem J.1 give the structural row on the registered binary quotient; Lemma J.1 separately supplies reset noninjectivity on its fixed-ready-state branch. Theorem 31 gives only the thermodynamic row, and equality additionally requires its saturation hypotheses. Theorem Z.1 supplies $a=2$ through its independent verification and no-surplus gates. Theorem Z.2's minimal carrier gives $d_0=8$, hence $b=6$, and Theorem Z.5 then gives $M=24$. ∎

### G.1.9.9 Summary

The reference state, equilibrium dynamics, thermal interpretation, and gravity connection are separate results. They coincide only when their assumptions are jointly satisfied.

**Technical ledger.**

This section has established:

1. **Conditional Reference State:** On Theorem Z.2's comparator/minimality branch, Theorem Z.1's sharp-record/capacity/no-surplus branch, and Definition 15a's reference-state convention, $\tau^*=(I_2/2)\oplus0_6$. It is not derived from SPAP or Landauer reset heat alone.

2. **Detailed-Balance Gate:** PCE conditionally prefers lower registered production by Proposition G.1.9.2, but detailed balance requires the separate reversibility certificate of Theorem G.1.9.3 and physical Gibbs identification requires Theorem G.1.9.3c.



3. **Modular Representation and Physical Selector:** Theorem G.1.9.4 gives the attractor's modular representation, while Theorems G.1.9.3c and G.1.9.5 require an independent physical-time selector before it is called a physical Gibbs/KMS state.



4. **Certified Modular Structure:** Constraint geometry organizes modular representatives. Born probabilities remain independently derived; Boltzmann and horizon thermal readings require their physical-equilibrium and boost/temperature certificates.



5. **Foundation for Gravity:** The modular Hamiltonian framework connects to the entanglement first law, providing the thermodynamic foundation for deriving Einstein's equations (Section G.1.9.6).

Together with the entropy ledger of Section P.6.5, this gives a shared modular bookkeeping language. It does not establish one PCE dynamical origin for all probability laws or all physical equilibrium states.

 The two unifications are summarized in the following correspondence:

| Entropy Unification (P.6.5) | Probability Unification (G.1.9) |
|-----------------------------|--------------------------------|
| Registered binary structural log-cardinality $\varepsilon_0=\ln2$ | Binary register log-cardinality; physical reset cost is ensemble-dependent |
| Shannon entropy $H$ | State distinguishability |
| Thermodynamic entropy $dS = \delta Q/T$ | Boltzmann distribution |
| von Neumann entropy $S(\rho)$ | Born rule |
| Bekenstein-Hawking entropy $S_{BH}$ | Unruh-Hawking distribution |

The complete branch-qualified assembly to the physical equilibrium representative is:
$$
\boxed{
\left.
\begin{aligned}
\text{Theorem-15/Z.2 minimal-carrier branch}&\Rightarrow d_0=8,\\
\text{registered binary quotient + Theorem-Z.1 gates}&\Rightarrow a=2
\end{aligned}
\right\}
\Rightarrow
\tau^*
\xrightarrow{\text{QDB/complete-passivity certificate}}
\text{physical equilibrium}
\xrightarrow{\mathcal C}
\rho^*_{\mathcal C}=Z^{-1}e^{-K^*(\mathcal C)}
}
$$
Theorem 31's physical reset ledger is not an antecedent of $\varepsilon_0$, $a$, or $\tau^*$.



### G.1.9.10 Topological Origin of the Factor $2\pi$

The factor $2\pi$ appears in several independently certified branches: circle-valued action phase and holonomy, Euclidean Rindler regularity, Bohr--Sommerfeld phase closure, and local phase transport. Once the relevant circle action is registered, each occurrence follows from the standard period of $S^1\cong U(1)$. The common topology explains the repeated normalization; PCE selects particular finite representatives only within the declared comparison classes and does not derive every circle structure from one optimization.

**Proposition G.1.9.10a (Common Circle-Period Normalization of $2\pi$).** *The factor $2\pi$ appearing in the framework's quantization conditions arises from the topology of the circle $S^1 \cong U(1)$, whose fundamental group $\pi_1(S^1) = \mathbb{Z}$ enforces single-valuedness constraints on quantum amplitudes.*

*Proof.*

**Part A (Holonomy Quantization).** Theorem Q.0.4 establishes that for closed paths $\gamma$ in configuration space:
$$\oint_\gamma \sum_i \varepsilon_i = 2\pi k, \quad k \in \mathbb{Z}$$

This follows from single-valuedness of the amplitude $e^{i\mathcal{S}/\hbar}$. For any closed loop $\gamma$, single-valuedness requires $e^{i\oint_\gamma d\mathcal{S}/\hbar} = 1$, hence $\oint_\gamma d\mathcal{S}/\hbar \in 2\pi\mathbb{Z}$. The factor $2\pi$ is the circumference of $S^1$ in the standard parametrization.

**Part B (Unruh Temperature).** Theorem G.1.9.6 identifies the horizon modular Hamiltonian as $K^*_{\text{horizon}} = (2\pi/\kappa) K_{\text{boost}}$, following from the Bisognano-Wichmann theorem. In Rindler coordinates covering the right wedge $x > |t|$, the boost Killing vector generates orbits that become periodic with period $2\pi/\kappa$ under analytic continuation to imaginary time $t \to -i\tau$. This periodicity is topological: Euclidean Rindler space has polar geometry with angular period $2\pi$.

**Part C (Bohr-Sommerfeld).** Proposition Q.0.9 derives $\oint p\,dq = nh$ with $h = 2\pi\hbar$ from interference conditions on closed orbits. The quantization in units of $2\pi\hbar$ rather than $\hbar$ reflects winding number interpretation: classical orbits wind once around phase space, accumulating $2\pi$ radians of phase. QED

**Corollary G.1.9.10b (Conditional Action-to-Ledger Ratio).** Suppose the action-ledger calibration $\kappa_A=\hbar$ of Corollary Q.0.1 is registered and every counted structural event contributes exactly $\ln2$ to the additive ledger. Then one Bohr-Sommerfeld action quantum has the formal ledger-unit ratio
$$
\frac{h}{\hbar\ln2}
=
\frac{2\pi}{\ln2}
\approx9.064720284.
$$
Because this value is not an integer, it is not the number of identical discrete events in an exact realization; it is a dimensionless conversion ratio between the two calibrated units.

*Proof.* Corollary Q.0.1 gives $\mathcal S=\kappa_A\mathcal L$. Under $\kappa_A=\hbar$ and a ledger increment $\ln2$ per counted event, the action unit per event is $\hbar\ln2$. Dividing $h=2\pi\hbar$ by this unit gives the displayed ratio. ∎

**Remark G.1.9.10c: Complementary Roles of $\varepsilon_0$ and $2\pi$.** The quantities $\varepsilon_0=\ln2$ and $2\pi$ operate in complementary domains:

| Quantity | Domain | Origin | Role in Framework |
|:---------|:-------|:-------|:------------------|
| $\varepsilon_0=\ln2$ | Measure-theoretic | Declared binary reset support (Proposition 5; Definition 28) | Structural log-cardinality |
| $2\pi$ | Topological | $\pi_1(U(1)) = \mathbb{Z}$ | Phase quantization period |

Neither is derivable from the other. The structural value $\varepsilon_0$ counts the log-cardinality of the declared binary support; the topological factor $2\pi$ enforces consistency under cyclic evolution. Their ratio $2\pi/\ln 2$ characterizes the number of registered structural units in one action quantum on the calibrated branch.

**Remark G.1.9.10d: Connection to Modular Flow.** Theorem G.1.9.5 gives a modular KMS identity at parameter value $1$ for every faithful state; identifying that parameter with physical inverse temperature requires the independent physical-time equilibrium selector.



**Remark G.1.9.10e: Algebraic Normalization-Time Identity.** On the joint Eq. Q.18 and saturated Proposition Q.6.1 calibration branch, with $\mu_0^{alg}:=m_P/(2\sqrt{8\varepsilon_0})$ and $\tau_{\min}=\sqrt{8\varepsilon_0}\,t_P$, the algebraic coefficients obey


$$
\mu_0^{alg}c^2\tau_{min}=\frac{\hbar}{2}.
$$
Indeed,
$$
\mu_0^{alg}c^2\tau_{min}
=
\frac{m_P}{2\sqrt{8\ln 2}}\,c^2 \cdot \sqrt{8\ln 2}\,t_P
=
\frac{m_P c^2 t_P}{2}
=
\frac{\hbar}{2}.
$$
This is an exact algebraic identity between an algebraic mass-dimension normalization and the minimum cycle-time coefficient; it becomes a physical mass relation only on $\mathfrak B_{mass}$. It does not by itself establish Margolus-Levitin saturation or a self-generated Unruh bath for the MPU.

### G.8.7 Mode-Polarization Correspondence

**Definition G.8.7a (Gauge Polarization Space).** On the separately certified $3+1$ Lorentzian spacetime-promotion branch, each massless gauge boson has $n_{\mathrm{pol}}=D-2=2$ transverse polarizations. The total gauge polarization space has dimension:

$$\dim(\mathcal{P}_{24}) = \dim(\mathfrak{g}_{\mathrm{SM}}) \times n_{\mathrm{pol}} = 12 \times 2 = 24$$


**Theorem G.8.7b (Mode-Polarization Isometries after Registered Frame Choices).** Let $\mathcal M_{24}$ be the 24-dimensional QFI-active interface-mode space and let $\mathcal P_{24}=\mathfrak g_{\mathrm{SM}}\otimes\mathbb R^2$ be the 24-dimensional gauge-polarization space. After choosing

1. an orthonormal basis $\{X_{\alpha\beta},Y_{\alpha\beta}\}$ of $\mathcal M_{24}$;
2. an orthonormal basis $\{T_{\alpha\beta}\}$ of $\mathfrak g_{\mathrm{SM}}$ indexed by $A\times B$; and
3. an orthonormal polarization frame $\{e_1,e_2\}$,

the linear map
$$
\Phi(X_{\alpha\beta})=T_{\alpha\beta}\otimes e_1,
\qquad
\Phi(Y_{\alpha\beta})=T_{\alpha\beta}\otimes e_2
$$
is a metric-preserving bijection
$$
\Phi:\mathcal M_{24}\xrightarrow{\sim}\mathcal P_{24}.
$$
No canonical bijection follows from dimension equality alone.

*Proof.* The listed vectors form orthonormal bases of two real inner-product spaces of dimension $24$. The unique linear map carrying the first chosen basis to the second is bijective and preserves inner products on basis vectors; bilinearity then gives inner-product preservation for all vectors. Changing either basis composes $\Phi$ with a nontrivial orthogonal transformation, proving the non-canonicity statement. ∎

**Theorem G.8.7c (Branch-Specific Rank-Polarization Identity).** On the intersection of Theorem Z.1's same-response strict-support-cost branch and Theorem Z.11's faithful least-feasible tangent-shell branch,
$$
a=D-2.
$$

*Proof.* Theorem Z.1 gives $a=2$ only with its fixed-response/performance comparator and strict active-support cost. Definition Z.9a and Theorems Z.10--Z.11 give $D=4$ from a faithful $24$-label injection, $K(3)=12$, an explicit regular-$24$-cell realization, and strict surplus-dimension cost. Thus $D-2=2=a$. This is a compatibility identity on the branch intersection, not an implication from either ledger to the other. ∎

**Remark G.8.7d (Interpretation).** The equality $a=D-2=2$ compares the rank of the active two-label carrier on Theorem Z.1's branch with the number of transverse polarizations on the separate Lorentz/gauge branch. It is a conditional numerical compatibility, not a derivation of gauge polarization from thermodynamic irreversibility or proof that no other branch is consistent.

**Table G.8.7 (Factor Correspondence).**

| Factor | Source ($\mathcal{M}_{24}$) | Target ($\mathcal{P}_{24}$) | Value |
|:-------|:----------------------------|:----------------------------|:-----:|
| Complex pairs | $ab$ | Gauge generators $n_G$ | 12 |
| Real components | 2 | Polarizations $n_{\mathrm{pol}}$ | 2 |
| Total | $2ab$ | $n_G \times n_{\mathrm{pol}}$ | 24 |

**Proposition G.8.7e (Golay and Lagrangian Dimension Equality).** On the predictive-recovery self-dual-rate branch,
$$
k=12=ab,
$$
where $k$ is the binary Golay-code dimension and $ab$ is the real Lagrangian dimension of the QFI interface space. A correspondence between signal/parity coordinates and complementary QFI Lagrangians exists only after a registered symplectic intertwiner is chosen.

*Proof.* For a binary linear code $C\subset\mathbb F_2^{24}$,
$$
\dim C+\dim C^\perp=24.
$$
If $C=C^\perp$, then $2\dim C=24$ and $k=12$. Independently, Theorem G.8.2e gives maximal real isotropic dimension $24/2=12=ab$. These calculations prove equality of dimensions. They do not construct a map between the binary code and the real QFI tangent space. ∎

**Theorem G.8.7f (Non-Canonicity of the Mode-Polarization Isometry).** The data listed in Theorem G.8.7b determine the dimensions and metric types of $\mathcal M_{24}$ and $\mathcal P_{24}$ but do not determine a canonical isometry between them. A specific isometry requires the registered frame choices listed in that theorem.

*Proof.* Let $\Phi:\mathcal M_{24}\to\mathcal P_{24}$ be one metric-preserving bijection. For every nonidentity orthogonal map $R\in O(\mathcal P_{24})$, the composite $R\circ\Phi$ is another metric-preserving bijection. The structural data do not select a preferred gauge-generator basis or polarization frame and therefore do not select one element of this family. Uniqueness of an object up to equivalence cannot remove its automorphism group. ∎

## G.10 Conditional Active-Kernel Spinor-Lift Structure

The preceding sections construct the Standard Model gauge algebra on their stated finite-response block-frame branch. This section constructs a projective $SU(2)$ amplitude lift of the SPAP involution on the minimal active kernel. Compatibility with relativistic spinors additionally consumes the complete Corollary 46a/Appendix O Lorentzian branch and the applicable spin or tangential-structure gate of Theorem 48. The mass correspondence further requires direct active-kernel provenance and $\mathfrak B_{mass}$. Thus SPAP and PPI alone do not establish that all matter fields are spinors or determine a mass ledger.

## G.10.1 The SPAP $\mathbb{Z}_2$ Structure

### G.10.1.1 The Logical Involution

**Definition G.10.1 (SPAP Involution).** The core logical operation of the Self-Referential Paradox of Accurate Prediction (SPAP, Theorem 10) is the reflexive update:
$$
\phi_{t+1} = \text{NOT}(\hat{\phi}_t) \tag{G.10.1}
$$
where $\hat{\phi}_t$ is the stored prediction. The NOT operation defines a $\mathbb{Z}_2$ involution $\iota: \{0,1\} \to \{0,1\}$ satisfying $\iota^2 = \text{id}$.

This involution is the logical foundation of the entire framework. The SPAP update rule $\phi_{t+1} = \text{NOT}(\hat{\phi}_t)$ operates on binary states $\phi \in \{0,1\}$, and NOT is the unique non-trivial involution on this set, generating the cyclic group $\mathbb{Z}_2 = \{e, \iota\}$ with $\iota \circ \iota = e$.

**Lemma G.10.1a (Irreducibility of $\mathbb{Z}_2$).** The $\mathbb{Z}_2$ structure of the SPAP involution cannot be reduced to the trivial group.

*Proof.* The SPAP diagonal update requires a fixed-point-free response map on the retained binary prediction value. On $\{0,1\}$, the identity map has fixed points $0$ and $1$, so replacing the SPAP involution by $\iota=\text{id}$ gives $\phi_{t+1}=\hat\phi_t$ and no diagonal contradiction. The diagonalization argument (Appendix A.1, Theorem A.1.1) instead uses the non-trivial Boolean involution with rule $\phi_{t+1}=\text{NOT}(\hat{\phi}_{P_f})$, which yields $\hat{\phi}=\text{NOT}(\hat{\phi})$ under exactness. Since NOT is the unique fixed-point-free involution on a two-element set, the non-trivial involution $\iota\ne\text{id}$ is logically necessary for the retained SPAP diagonal construction in any system possessing Property R (Definition 10). ∎

### G.10.1.2 Connection to the Structural and Registered Reset Ledgers

Proposition 5 and Definition 28 assign a declared binary prediction register the structural log-cardinality $\varepsilon_0=\ln2$. On the separate prescribed-ready binary-ancilla architecture of Appendix J, the accessible cycle map is
$$
G_{\mathrm{cycle}}:A\longrightarrow\{0,1\}_{\phi'}\times\{p_{\mathrm{ready}}\}.
$$
Lemma J.1 proves that this map is noninjective when $|A|>2$ and that, when all four input pairs are reachable, some output has at least two preimages. It gives no noninjectivity conclusion from cardinality alone when $|A|\le2$.

If the prediction register is then physically reset under Definition 28, Theorem 31 gives
$$
\varepsilon_{\mathrm{reset}}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}
\ge H_q(P\mid R).
\tag{G.10.2}
$$
On the conditionally uniform binary, zero-overhead branch this becomes $\varepsilon_{\mathrm{reset}}=\ln2$. Thus the structural chain is
$$
\text{declared binary reset support}\longrightarrow\varepsilon_0=\ln2,
$$
whereas the physical heat statement additionally requires the registered reset ensemble and its conditional distribution.

---

## G.10.2 Physical Instantiation of the Involution

### G.10.2.1 The Active Kernel Dimension

**Theorem G.10.2 (Conditional Projective Realization of the SPAP Involution and $SU(2)$ Lift).** Let $\mathcal H_a\cong\mathbb C^2$ on the $a=2$ branch of Theorem Z.1. Assume that the physical implementation of the logical involution is a reversible bijection of rays preserving all transition probabilities and that it belongs to a continuous implementation branch containing the identity. Then Wigner's theorem gives a nontrivial projective unitary involution $[\widetilde U_\iota]$ satisfying
$$
[\widetilde U_\iota]^2=[I],
\qquad
[\widetilde U_\iota]\ne[I].
$$
In a basis in which this involution exchanges the two active basis rays, one may choose the determinant-one lift
$$
U_\iota=i\sigma_x\in SU(2),
\qquad
U_\iota^2=-I.
$$

*Proof.* By Wigner's theorem, a bijection of rays preserving transition probabilities is implemented by a unitary or antiunitary operator. A continuous path from the identity cannot enter the antiunitary component, so the implementation is unitary. Overall scalar phases act trivially on rays, hence the implementation is represented by a projective unitary class $[\widetilde U_\iota]$.

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
Nontriviality excludes $V=\pm I$. Since $V$ is a nontrivial unitary involution on $\mathbb C^2$, its eigenvalues are $+1$ and $-1$, so it is unitarily equivalent to $\operatorname{diag}(1,-1)$. In the basis obtained by conjugating with the Hadamard matrix, this representative is $\sigma_x$.

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

**Theorem G.10.3 (Conditional $SU(2)$ Active-Kernel Lift).** The full group of complex-linear unitary ray automorphisms of $\mathcal H_a\cong\mathbb C^2$ is
$$
PU(2)=U(2)/U(1)\cong SO(3).
$$
Let $G$ be a registered connected physical projective-symmetry subgroup that preserves transition probabilities and acts transitively on all pure active-kernel rays. Then $G=PU(2)\cong SO(3)$, and its simply connected determinant-one amplitude lift is $SU(2)$.

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

**Step 3 (Conditional SPAP involution inside the lift).** Assume that the physical implementation of the logical involution is a reversible bijection of rays preserving transition probabilities and belongs to a continuous implementation branch containing the identity. Theorem G.10.2 then gives a projective order-two unitary class. In a basis exchanging the two active basis rays, it has the determinant-one representative
$$
U_\iota=i\sigma_x\in SU(2),
\qquad
U_\iota^2=-I.
$$
Because $-I$ acts trivially on rays, this representative realizes the logical involution in the PPI quotient on the declared branch.

**Step 4 (Certified Transitivity and Minimality).** The pure active states form
$$
\mathbb CP^1\cong S^2.
$$
By the theorem's registered transitivity hypothesis, the connected physical projective-symmetry group $G\subseteq PU(2)\cong SO(3)$ acts transitively on $S^2$.

Its Lie algebra $\mathfrak g$ is a subalgebra of $\mathfrak{so}(3)$. Every proper Lie subalgebra of $\mathfrak{so}(3)$ is at most one-dimensional: under the cross-product model, two linearly independent elements generate a third independent element and hence all of $\mathfrak{so}(3)$. A connected one-dimensional subgroup is conjugate to rotations about an invariant axis and has invariant poles, so it is not transitive. Therefore $\mathfrak g=\mathfrak{so}(3)$ and connectedness gives
$$
G=SO(3).
$$

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
Conjugation preserves Hermiticity, trace, and determinant. Since
$$
\det(\vec v\cdot\vec\sigma)=-|\vec v|^2,
$$
$\pi(U)$ preserves the Euclidean norm. Continuity and $\pi(I)=I$ place its image in the identity component $SO(3)$ of $O(3)$. The assignment $U\mapsto\pi(U)$ is a continuous homomorphism because
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

The connection is conditional at each physical bridge:

1. The SPAP logical involution (Definition G.10.1) supplies two logical alternatives. A noninjective prescribed-ready merge follows only on the declared binary-ancilla architecture under the reachable-domain hypothesis of Lemma J.1.
2. Proposition 5 and Definition 28 assign the declared binary reset support the structural value $\varepsilon_0=\ln2$. Theorem 31 separately supplies the physical ledger only if a registered reset is performed.
3. The retained match/mismatch record gives $a\geq2$, entropy-capacity gives $\ln a\geq\varepsilon_0$, and PPI/PCE no-surplus selection chooses the minimal active subsystem dimension $a=2$ on the branch of Theorem Z.1.
4. If the physical implementation of the logical involution is a reversible transition-probability-preserving ray bijection in a continuous implementation branch containing the identity, Theorem G.10.2 gives its projective unitary class and the representative $U_\iota=i\sigma_x\in SU(2)$ with $U_\iota^2=-I$.
5. If the registered connected physical projective-symmetry subgroup preserves transition probabilities and acts transitively on the pure active-kernel rays, Theorem G.10.3 identifies it with $PU(2)\cong SO(3)$ and gives the simply connected amplitude lift $SU(2)$.
6. The covering homomorphism $SU(2)\to SO(3)$ has kernel $\{I,-I\}\cong\mathbb Z_2$ (Theorem G.10.4).

Together with the minimal carrier dimension $d_0=8$ and the finite-response block-frame capacity-saturation theorem, the same active rank $a=2$ selects the rank-2 weak inactive summand inside the unique $3+2+1$ decomposition. On the minimal flag lift, Theorem G.8.4c.0c states that any local unitary fiber isometry from the active rank-2 carrier to the weak rank-2 summand transports the Pauli $\mathfrak{su}(2)$ algebra to the weak block. This is a local finite-response frame identification and does not assert a canonical global bundle isomorphism.

**Joint Branch Assembly.** On the branch carrying the registered Boolean involution together with Wigner/projective-ray hypotheses, the logical involution is represented by
$$
U_\iota=i\sigma_x
$$
up to the declared phase convention. Independently, Theorem Z.1's sharp-record, entropy-capacity, and no-surplus hypotheses give $a=2$. If the projective symmetry acts transitively and continuously on the active rays, the standard lift gives
$$
SU(2)\to SO(3).
$$
The Lorentzian spinor and spin-statistics conclusions then require their separately stated determinant-form, time-orientation, locality, positivity, covariance, and spectrum hypotheses. Landauer reset heat is not an antecedent in this assembly.

Thus the spinor sign flip is traceable to the logical structure of self-referential prediction through the active-kernel projective-lift chain, without identifying the SPAP logical $\mathbb Z_2$ itself with the double-cover kernel.

---

## G.10.5 Lorentzian Extension to Spin(1,3)

**Theorem G.10.5 (Compatibility of the Spinor Sector with $Spin(1,3)$).** Once the emergent spacetime sector is identified with a Lorentzian $3+1$-dimensional geometry and the internal two-state spin sector is represented by $SU(2)$, the standard relativistic spinor completion is
$$
Spin^+(1,3)\cong SL(2,\mathbb C),
$$
with covering homomorphism $SL(2,\mathbb C)\to SO^+(1,3)$ and kernel $\{\pm I\}$.

*Proof.* Identify $x=(x^0,\vec x)\in\mathbb R^{1,3}$ with the Hermitian matrix
$$
X=x^0I+x^i\sigma_i.
$$
The Pauli determinant identity gives
$$
\det X=(x^0)^2-|\vec x|^2.
$$
For $A\in SL(2,\mathbb C)$, define $X\mapsto AXA^\dagger$. This map preserves Hermiticity and determinant, hence defines a continuous homomorphism
$$
\Pi:SL(2,\mathbb C)\longrightarrow SO^+(1,3).
$$
If $A$ is in the kernel, it commutes with every Hermitian $2\times2$ matrix and hence with all of $M_2(\mathbb C)$, so $A=\lambda I$. The determinant condition gives $\lambda^2=1$, and therefore $\ker\Pi=\{\pm I\}$.

The differential $d\Pi_e$ maps the six-real-dimensional Lie algebra $\mathfrak{sl}(2,\mathbb C)$ injectively into $\mathfrak{so}(1,3)$; injectivity follows from the same commutant argument. Both Lie algebras have real dimension six, so $d\Pi_e$ is an isomorphism. Hence the image is an open subgroup of the connected group $SO^+(1,3)$ and must be the whole group. Polar decomposition gives
$$
SL(2,\mathbb C)\cong SU(2)\times\exp(\mathfrak p)
$$
as a manifold, where $\mathfrak p$ is the three-dimensional vector space of traceless Hermitian matrices. Thus $SL(2,\mathbb C)$ deformation-retracts to $SU(2)\cong S^3$ and is simply connected. The two-sheeted cover is therefore universal. Its maximal compact subgroup is the polar factor $SU(2)$, which restricts to the spatial double cover of Theorem G.10.4. ∎

**Corollary G.10.5.1 (Active Spinor Source of the Lorentz Six-Generator Count).** On the Lorentzian spinor branch, the active rank-2 carrier supplies the Hermitian determinant model
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
induces
$$
SL(2,\mathbb C)/\{\pm I\}\cong SO^+(1,3).
$$
Consequently,
$$
6_{\mathrm{Lorentz}}=\dim_{\mathbb R}\mathfrak{so}(1,3),
$$
with three rotation and three boost generators. This real Lie-algebra dimension is distinct from the inactive complex rank $\dim_{\mathbb C}\mathcal B=6$.

*Proof.* The Pauli identity $(\vec x\cdot\vec\sigma)^2=|\vec x|^2I$ gives eigenvalues $x^0\pm|\vec x|$ and hence the determinant formula. Theorem G.10.5 proves that $AXA^\dagger$ preserves this determinant, is onto $SO^+(1,3)$, and has kernel $\{\pm I\}$. Finally, an antisymmetric $4\times4$ Lorentz-algebra matrix has $4\cdot3/2=6$ independent real entries, split into three spatial rotation components and three time-space boost components. ∎

**Definition G.10.5a (Weyl Spinors).** A left-handed Weyl spinor is a field $\psi_L$ transforming under the $(\frac{1}{2}, 0)$ representation of SL(2,$\mathbb{C}$), corresponding to the fundamental representation of the first $\mathfrak{sl}(2,\mathbb{C})$ factor with the second acting trivially. A right-handed Weyl spinor $\psi_R$ transforms under $(0, \frac{1}{2})$. A Dirac spinor combines both: $\Psi = (\psi_L, \psi_R)^T$.

---

## G.10.6 The Spinor-Mass Correspondence

### G.10.6.1 Mass from Active Kernel Processing

**Theorem G.10.6 (Conditional Active-Kernel Spinor--Mass Correspondence).** On $\mathfrak B_{mass}$, suppose a fundamental field's nonzero rest-mass ledger is carried by relational information maintained through direct processing on the active kernel $\mathcal H_a\cong\mathbb C^2$, and suppose the registered Lorentz bridge of Theorem G.10.5 applies. Then that field transforms in a spinor representation. The theorem does not infer the existence or mass of a fermion from $\mathfrak B_{mass}$ alone.



*Proof.*

**Step 1 (Conditional mass ledger).** On $\mathfrak B_{mass}$, Theorem N.5 assigns the registered rest-mass coefficient from relational information:


$$
m = \frac{\mathcal{I}_{\text{rel}}}{2\sqrt{8\varepsilon_0}} \cdot m_P \approx 0.212 \cdot \mathcal{I}_{\text{rel}} \cdot m_P \tag{G.10.12}
$$
where $\varepsilon_0=\ln2$ is the structural binary reset-support value of Proposition 5 and Definition 28, $m_P = \sqrt{\hbar c/G}$ is the Planck mass, and $\mathcal{I}_{\text{rel}}$ quantifies the system's predictive correlations with the network.

**Step 2 (Registered active-kernel provenance).** By the theorem's explicit hypothesis, the field's relational-information ledger is maintained through direct processing on the active kernel $\mathcal H_a\cong\mathbb C^2$. This provenance is branch data; it is not implied for every fundamental matter field by SPAP or $\mathfrak B_{mass}$ alone. The structural binary ledger assigns $\varepsilon_0=\ln2$ per registered unit; a physical entropy-flow formula additionally requires the completed-reset ensemble and its $H_q(P\mid R)$ values. On $\mathfrak B_{mass}$, including its completed-reset and accepted action--entropy gates, the entropy-flow ledger is:
$$
\frac{d\mathcal{S}}{d\tau} = \frac{\mathcal{I}_{\text{rel}}}{2\tau_{\text{min}}} \tag{G.10.13}
$$
where $\tau_{\min}=\sqrt{8\varepsilon_0}\,t_P$ is the temporal calibration on the joint Eq. Q.18 and saturated Proposition Q.6.1 branch.

**Step 3 (Conditional spinor lift).** On the separately registered Lorentzian and spin/tangential-structure branch, Theorems G.10.3 and G.10.5 embed the active-kernel $SU(2)$ amplitude lift in the relativistic spin cover. Corollary G.10.4.1 then gives the spinor transformation law for the covered field.

**Step 4 (Conclusion for the stated field).** The field satisfying both the direct active-kernel provenance hypothesis and the registered Lorentz bridge therefore transforms in a spinor representation. No conclusion follows here for fields outside either branch. ∎

**Remark G.10.3: Scope of Theorem G.10.6.** This theorem applies only on $\mathfrak B_{mass}$ to fundamental fields whose registered mass originates from relational information and whose carrier provenance is direct active-kernel processing.


- **Composite particles** (e.g., protons, neutrons) whose mass arises predominantly from QCD binding energy
- **Scalar bosons** (e.g., the Higgs) whose mass arises from the scalar potential
- **Gauge bosons** which acquire mass through symmetry breaking mechanisms

The Higgs boson, for instance, is massive and spin-0; its mass arises from the Higgs potential $V(\phi) = -\mu^2|\phi|^2 + \lambda|\phi|^4$, not from direct active kernel processing in the sense of Theorem N.5.

### G.10.6.2 Gauge Boson Masslessness

**Corollary G.10.6.1 (Bare Proca Terms Are Forbidden by Unbroken Gauge Redundancy).** On an unbroken gauge-redundancy branch, an uncompensated local Proca term for a gauge connection is not PPI-admissible because it changes under response-equivalent gauge-frame relabelings. A zero gauge-boson mass follows only on a branch that also excludes Higgs, Stückelberg, topological, or other gauge-invariant mass-generating structures.

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

PPI treats gauge transformations as response-equivalent frame relabelings (Theorem X.8d of Appendix X, applied in Appendix G and in constraint C1 of Appendix P, §P.2.5.2; gauge transformations are predictive-frame redundancies, so the predictive functional descends to the gauge quotient). A term that changes under such a relabeling is not a well-defined physical response on the quotient. Therefore an unbroken gauge redundancy forbids a local gauge-boson mass term. Mass acquisition for $W^\pm$ and $Z$ occurs only after the electroweak symmetry-breaking branch supplies the Higgs vacuum structure; the photon remains massless on the unbroken electromagnetic branch. ∎

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

## G.10.8 Summary: Branch-Qualified Construction

A binary self-reference structure can support spinor behavior only after separate geometric and spacetime constructions are supplied. Physical mass interpretation belongs to an additional bridge.

**Technical ledger.**

**Table G.10.1: Branch-Qualified Construction from the SPAP Involution to Spinor Compatibility**

| Step | Result | Origin | Status | Reference |
|:----:|:-------|:-------|:------:|:----------|
| 1 | $\iota^2 = \text{id}$, $\iota \neq \text{id}$ | SPAP logical structure | Derived | Theorem 10, Definition G.10.1, Lemma G.10.1a |
| 2 | $\varepsilon_0=\ln2$ on the declared binary reset-support branch | Structural log-cardinality | Branch-derived | Proposition 5, Definition 28, Definition 15a |
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
- **Derived:** Result following on the explicitly stated PU branch
- **Recovered:** Standard mathematical result used on that branch
- **Branch-derived:** Result requiring the additional branch hypotheses named in its theorem
- **Conditional theorem:** Result available only after the listed external continuum/AQFT hypotheses are accepted

The branch-qualified construction is:

$$
\boxed{
\text{SPAP }\mathbb Z_2
\xrightarrow{\text{active-kernel projective lift}}
SU(2)
\xrightarrow[\text{Corollary 46a/Appendix O + tangential gate}]{\text{separate Lorentz branch}}
\text{Spin}(1,3)\text{-compatible spinors}
\xrightarrow[\text{direct active-kernel provenance}+\mathfrak B_{mass}]{\text{separate mass branch}}
\text{registered mass ledger}
} \tag{G.10.16}
$$

The last two arrows are conditional branch junctions, not consequences of the SPAP involution alone.

**Corollary G.10.8.1 (Conditional Spinor--Mass Compatibility).** On the intersection of the registered spinor/Lorentz branch, the direct active-kernel provenance hypothesis, and $\mathfrak B_{mass}$, the spinor transformation law and relational mass ledger are compatible parts of one branch package. SPAP and PCE alone do not prove the existence of massive fermions or the absolute mass coefficient.




**Note:** Sections G.10.1–G.10.5 provide the spinor branch independently of N.5. The absolute mass assignment enters only through $\mathfrak B_{mass}$ and is not a consequence of the spinor derivation.



## G.11 Conclusion

The appendix builds conditional links from predictive structure to quantum probabilities, gauge fields, matter, spacetime dimension, and selected numerical relations. Each link keeps its own assumptions and evidential status.

**Technical ledger.**

This appendix establishes the following branch-qualified constructions within the Predictive Universe framework:

1. **Quantum Probability:** On the finite-dimensional normalized frame-function branch with registered refinement invariance/noncontextuality, Gleason's theorem gives the Born form (Theorems G.1.3 and G.1.7). The complex Hilbert carrier additionally retains the amplitude, composition, and continuity hypotheses of Theorem G.1.8. POP/PCE supplies the comparison interpretation but does not prove those mathematical representation premises by itself.

2. **Gauge Structure:** The registered phase-character and local-effective-action branches give a conditional $U(1)$ connection with leading Maxwell/minimal-coupling terms (Section G.7). The Standard Model algebra is unique only in the determinant-compatible finite-response block-frame capacity class of Theorem G.8.4b and Corollary G.8.4c; matter content retains its anomaly, response, and finite-catalog certificates.

3. **Spacetime Dimension:** On Definition Z.9a's faithful-shell branch, Theorem Z.10 gives $24\le K(D)$, $K(3)=12$ excludes $D\le3$, the response-labeled regular $24$-cell proves feasibility in $D=4$, and strict surplus-dimension cost selects the least feasible carrier. Lorentzian interpretation requires the separate continuum and signature certificates.

4. **Three Generations:** Appendix R derives the minimal admissible value $N_g = 3$ from anomaly cancellation together with the CP-violation requirement in the modeled family-charge sector, and Proposition R.3.5.1a gives exact realization on the pre-flavor family-redundancy PPI branch. The $D_4$ triality orbit and $E_8$/Leech construction supply compatible three-fold scaffolds rather than independent proofs (Appendix R, Theorem R.3.4; Proposition R.3.5.1a; Proposition R.4.2).

5. **Fine-Structure Constant:** Appendix Z gives the scheme-specified core arithmetic $\alpha_{em,0}^{-1}=137.03609205522863\ldots$ on its declared response and normalization branch. Definition Z.27.11k.12 then stipulates a finite hypercharge-recoil candidate menu whose internal evaluation is $R_{\alpha}^{YR\perp}=-0.00009287769839723537\ldots$ and $\alpha^{-1}_{\mathrm{cand}}=137.03599917753023\ldots$. It does not close the physical branch: current/operator realization, source exhaustion, overlap, regularization, tail control, and provenance remain Definition Z.27.11j-pending, and the passive-complement range is diagnostic rather than certified.

6. **Unified Probability Measures:** Modular representations organize quantum, thermal, and horizon probability records, while their interpretation as physical Gibbs/KMS equilibrium requires the independent detailed-balance or complete-passivity certificate of Section G.1.9.



These results ground the quantum measurement framework, gauge interactions, spacetime dimensionality, and fundamental constants in the unified logic and resource economics of prediction. Quantitative predictions are further constrained by the alphabet identities of Appendix W.

---

*Note:* For $d = 2$, the Born rule follows either from embedding within the MPU's $d_0 \geq 8$ space or from decision-theoretic arguments [Deutsch 1999]; we rely primarily on the Gleason route given $d_0 \geq 8$ (Theorem 23).
