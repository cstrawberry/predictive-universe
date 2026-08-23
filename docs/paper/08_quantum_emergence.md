# 8. Emergence of Quantum Mechanical Formalism

**Formal closure boundary.** The results in this section are effective-formalism results on the MPU Hilbert branch. The SPAP-to-Born route has four separate layers: response-null context labels quotient away by PPI/PCE; finite-response payoff refinement gives additivity on the retained quotient; Definition 8.2b supplies either full projection/effect coverage or a finite informationally complete positive reconstruction; and Theorem 8.3 then fixes the trace representation on that certified domain. Quotienting and retained-context additivity alone do not imply global Born uniqueness. Later physical sectors retain their separate realization certificates and status labels.

This section constructs a consistent effective quantum description on a declared finite-response branch. It assumes a complex operational $C^*$-algebra with a positive normalized state, response-null quotienting, retained-effect additivity and noncontextuality, an accepted Born-domain completeness certificate, the carrier-selection package, the tensor-product/local-CPTP package, and continuous transition-probability-preserving ray dynamics. Under that conjunction, the results recover the Hilbert representation, certified-domain Born weights, superposition interpretation, Robertson inequality, entanglement formalism, and Schrödinger dynamics.

**Principle 8.0b (Fundamental Predictive Carrier Closure).** Every fundamental MPU on this physical closure branch, after finite-response quotienting, carries the Sharp Homogeneous Carrier Certificate $\mathfrak C_{\mathrm{car}}$ of Definition G.1.8a. Its retained finite-dimensional ordered state space has: (i) a closed, pointed, generating state cone and a separating effect cone; (ii) a symmetric positive-definite predictive pairing with respect to which the cone is self-dual; (iii) a cost-bounded reversible group acting transitively on the cone interior; (iv) locally tomographic composition within one scalar/Jordan family, with multiplicative sizes $mn$ for all nontrivial factors $m,n\ge2$; (v) full retained scalar phase redundancy whose connected group is exactly one-dimensional $U(1)$; and (vi) a finite Jordan-exclusion record that certifies simplicity and irreducibility and excludes simplex, real, quaternionic, spin-factor, exceptional, and every additional response-active central summand. Principle 5b supplies eight response triples; the present certificate separately makes them one sharp jointly perfectly distinguishable context. A faithful $M_8(\mathbb C)$ representative realizes the complete retained response presheaf, and after response-null quotienting every higher-dimensional representative of that same presheaf has strictly larger total PCE potential.

This is a falsifiable physical closure principle, not a consequence of the diagonal theorem.

**Principle 8.0c (Response-Complete Actualization on the Selected Matrix Carrier).** On the complex matrix carrier supplied by Principle 8.0b, every registered finite verification with outcome set $\mathcal K$ has an operational map
$$
\Gamma:\mathcal D(\mathcal H)\longrightarrow
\mathcal D(\mathbb C^{|\mathcal K|}\otimes\mathcal H')
$$
that is normalized, preparation-equivalent, spectator-stable, and classical in the outcome register:
$$
\Gamma(\rho)
=
\sum_{k\in\mathcal K}|k\rangle\langle k|\otimes\mathcal I_k(\rho).
\tag{8.0c.1}
$$
In each registered run exactly one mutually exclusive label $k$ is written, and its registered outcome probability is the weight of the corresponding block. A frequency-convergence statement additionally requires an i.i.d. repeated-trial certificate, a stationary-ergodic certificate, or an exchangeable certificate whose mixing measure is concentrated on the registered one-trial law. General exchangeability alone permits a random limiting law, as Theorem 8.8c records.

For every PPI-retained pre-event record $R$ that leaves the complete preparation $\rho$ and registered verification $\Gamma$ unchanged, the operational stochastic postulate is
$$
\Pr(k\mid\rho,\Gamma,R)=\Pr(k\mid\rho,\Gamma)
$$
almost surely. In particular, when two block weights are positive, no such retained record is a deterministic selector. This excludes accessible retained selectors on the PPI quotient; it does not exclude mathematically equivalent latent-variable completions whose extra variables are inaccessible to every admitted response.

**Theorem 8.0d (Closed MPU Quantum Representation).** Principles 5b, 8.0b, and 8.0c, together with Theorem 8.2, Lemma 8.2a, and an accepted Born-domain completeness certificate $\mathfrak C_{\mathrm{Born}}$ of Definition 8.2b, imply:

1. $\mathcal H_0\cong\mathbb C^8$;
2. the certified probability ledger has a unique density operator $\rho$ such that
   $$
   \omega(E)=\operatorname{tr}(\rho E)
   \tag{8.0d.1}
   $$
   for every retained effect $E$ on the informationally complete route, and for every projection or effect on the corresponding full-domain route;
3. every registered verification is an instrument with completely positive trace-nonincreasing maps $\mathcal I_k$ and trace-preserving sum;
4. for $E_k:=\mathcal I_k^*(I)$,
   $$
   \Pr(k\mid\rho)
   =
   \operatorname{tr}\mathcal I_k(\rho)
   =
   \operatorname{tr}(\rho E_k),
   \qquad
   \sum_kE_k=I.
   \tag{8.0d.2}
   $$
   For $\rho=|\psi\rangle\langle\psi|$ and $E_k=|k\rangle\langle k|$,
   $$
   \Pr(k\mid\psi)=|\langle k|\psi\rangle|^2.
   \tag{8.0d.3}
   $$

*Proof.* Principle 8.0b supplies the symmetric self-dual homogeneous cone, same-family local tomography, exact $U(1)$ scalar-phase, simplicity, and finite exclusion data used by Theorem G.1.8 to select the single complex matrix branch. Principle 5b supplies eight response triples, while Principle 8.0b makes them sharply jointly distinguishable, so $d_0\ge8$. The faithful $M_8(\mathbb C)$ representative realizes the complete response presheaf, and the strict same-presheaf total-cost comparison excludes every larger representative; hence $d_0=8$.

Theorem 8.2 descends $\omega$ to quotient events, and Lemma 8.2a supplies additivity only on retained orthogonal refinements. Definition 8.2b adds the missing domain gate. Theorem 8.3 then gives (8.0d.1) globally on the full-domain route or on the retained informationally complete operator system on the finite route.

Principle 8.0c makes $\Gamma$ preparation-equivalent, spectator-stable, and normalized. Theorem 8.3b gives its CPTP linear extension. Define
$$
\mathcal I_k(X):=(\langle k|\otimes I)\Gamma(X)(|k\rangle\otimes I).
$$
Compression of a completely positive map is completely positive, so each $\mathcal I_k$ is CP and trace-nonincreasing; normalization makes $\sum_k\mathcal I_k$ trace-preserving. Duality gives $E_k\succeq0$, $\sum_kE_k=I$, and
$$
\operatorname{tr}\mathcal I_k(\rho)
=
\operatorname{tr}\bigl(\rho\mathcal I_k^*(I)\bigr).
$$
The rank-one formula follows by substitution. Principle 8.0c identifies each block weight with the registered single-run outcome probability; frequency convergence requires a separate repeated-trial law-of-large-numbers hypothesis. ∎

**8.1 QM Formalism as Effective Description**

PCE/PPI supplies the response quotient and the branch-selection grammar. It does not by itself derive the complex scalar field, stochastic law, additive probability ledger, tensor-product composition, or continuous ray symmetry. Each theorem below therefore retains the hypotheses that select its part of the effective quantum formalism.

**Lemma 8.0a (Finite-Response $C^*$-Envelope of the Predictive Observable Algebra).**
Let $\mathfrak A_{\mathrm{alg}}$ be the unital *-algebra generated by finite-resolution operational outcome effects, their adjoints, finite sums, products, and scalar multiples on the complex scalar branch selected in Theorem 8.4. Let $\Pi_{\mathrm{adm}}$ be the class of admissible finite-response *-representations of these operational effects as bounded operators, with each primitive effect represented by an operator $E$ satisfying $0\le E\le I$. Assume $\Pi_{\mathrm{adm}}\ne\varnothing$, witnessed independently by an explicitly retained bounded Hilbert representation that preserves the stated operational relations. The GNS construction is invoked only after the present $C^*$-seminorm and completion have been established. No scalar ultrafilter over all primitive effects is required: only *-representations preserving the retained finite-response relations enter $\Pi_{\mathrm{adm}}$. Define
$$
\|a\|_u:=\sup_{\pi\in\Pi_{\mathrm{adm}}}\|\pi(a)\|.
$$
Then $\|\cdot\|_u$ is a finite $C^*$-seminorm on $\mathfrak A_{\mathrm{alg}}$. The quotient by the null ideal
$$
\mathcal N_u:=\{a\in\mathfrak A_{\mathrm{alg}}:\|a\|_u=0\}
$$
and completion in $\|\cdot\|_u$ gives a unital $C^*$-algebra
$$
\mathfrak A:=\overline{\mathfrak A_{\mathrm{alg}}/\mathcal N_u}^{\|\cdot\|_u}.
$$

*Proof.* Every element $a\in\mathfrak A_{\mathrm{alg}}$ is a finite linear combination of finite words in primitive effects and adjoints. In every admissible representation, each primitive effect has operator norm at most $1$, and the identity has norm $1$. Therefore the norm of each represented word is bounded by $1$, and the norm of $\pi(a)$ is bounded by the finite sum of the absolute values of the coefficients appearing in the chosen expression for $a$. Hence $\|a\|_u<\infty$.

The supremum of operator seminorms over *-representations is a *-seminorm and satisfies
$$
\|ab\|_u\le \|a\|_u\|b\|_u,\qquad \|a^*\|_u=\|a\|_u.
$$
Moreover,
$$
\|a^*a\|_u
=
\sup_{\pi\in\Pi_{\mathrm{adm}}}\|\pi(a)^*\pi(a)\|
=
\sup_{\pi\in\Pi_{\mathrm{adm}}}\|\pi(a)\|^2
=
\|a\|_u^2,
$$
so the $C^*$ identity holds. The null space $\mathcal N_u$ is a two-sided *-ideal because $\|\cdot\|_u$ is submultiplicative and *-invariant. Passing to the quotient makes $\|\cdot\|_u$ a norm, and completing the normed *-algebra gives a unital $C^*$-algebra. ∎

**Theorem 8.1 (PU–GNS Representation).**
Let $\mathfrak A_{\mathrm{alg}}$ be the finite-response predictive observable *-algebra generated by operational outcomes under ND‑RID and Evolve updates, and let $\mathfrak A$ be its finite-response $C^*$-envelope from Lemma 8.0a. Let $\omega:\mathfrak A\to\mathbb C$ be a *predictive state*, defined as a linear, positive, normalized, and continuous functional. Then, by the Gelfand–Naimark–Segal (GNS) construction, there exist a Hilbert space $\mathcal H_\omega$, a *‑representation $\pi_\omega:\mathfrak A\to\mathcal B(\mathcal H_\omega)$, and a cyclic vector $\psi_\omega\in\mathcal H_\omega$ such that $\omega(a)=\langle \psi_\omega,\ \pi_\omega(a)\ \psi_\omega\rangle$ for all $a\in\mathfrak A$.

*Proof.* This is the standard GNS construction [Gelfand & Naimark 1943; Segal 1947], specialized to the predictive algebra. Define
$$
\mathcal N_\omega := \{a\in\mathfrak A : \omega(a^*a)=0\}.
$$
Positivity of $\omega$ implies the Cauchy–Schwarz inequality
$$
|\omega(a^*b)|^2 \le \omega(a^*a)\,\omega(b^*b)
$$
for all $a,b\in\mathfrak A$. If $n\in\mathcal N_\omega$ and $c\in\mathfrak A$, then
$$
\omega\big((cn)^*(cn)\big)=\omega(n^*c^*cn)\le \|c\|^2\omega(n^*n)=0,
$$
so $cn\in\mathcal N_\omega$; hence $\mathcal N_\omega$ is a left ideal.

On the quotient vector space $\mathfrak A/\mathcal N_\omega$, define
$$
\langle [a],[b]\rangle := \omega(a^*b),
$$
where $[a]$ denotes the class of $a$ modulo $\mathcal N_\omega$. This is well defined: if $a-a'\in\mathcal N_\omega$, then by Cauchy–Schwarz,
$$
|\omega((a-a')^*b)|^2 \le \omega((a-a')^*(a-a'))\,\omega(b^*b)=0,
$$
so $\omega((a-a')^*b)=0$, and similarly in the second variable. Positivity of $\omega$ gives
$$
\langle [a],[a]\rangle = \omega(a^*a)\ge 0,
$$
and $\langle [a],[a]\rangle=0$ iff $a\in\mathcal N_\omega$. Hence this is an inner product. Let $\mathcal H_\omega$ be the Hilbert-space completion of $\mathfrak A/\mathcal N_\omega$.

For each $c\in\mathfrak A$, define
$$
\pi_\omega(c)[a]:=[ca].
$$
Because $\mathcal N_\omega$ is a left ideal, this is well defined on equivalence classes. Moreover,
$$
\|\pi_\omega(c)[a]\|^2
=
\omega(a^*c^*ca)
\le
\|c\|^2\omega(a^*a)
=
\|c\|^2\|[a]\|^2,
$$
so $\pi_\omega(c)$ is bounded and extends continuously to $\mathcal H_\omega$. The map $c\mapsto\pi_\omega(c)$ is linear, satisfies $\pi_\omega(cd)=\pi_\omega(c)\pi_\omega(d)$, and obeys
$$
\langle \pi_\omega(c)[a],[b]\rangle
=
\omega(a^*c^*b)
=
\langle [a],\pi_\omega(c^*)[b]\rangle,
$$
hence $\pi_\omega(c)^*=\pi_\omega(c^*)$.

Finally, let $\psi_\omega:=[\mathbf 1]$. Then
$$
\omega(a)=\omega(\mathbf 1^*a)=\langle [\mathbf 1],[a]\rangle
=
\langle \psi_\omega,\pi_\omega(a)\psi_\omega\rangle.
$$
The vector $\psi_\omega$ is cyclic because classes of the form $\pi_\omega(a)\psi_\omega=[a]$ span the dense subspace $\mathfrak A/\mathcal N_\omega\subset\mathcal H_\omega$. ∎

**Theorem 8.2 (Idle-Context Quotient for Predictive Weights at the PCE-Attractor).**
Let $\mathsf P_{\mathrm{PU}}$ be the finite-resolution protocol category of Appendix P.6.1b. For an effect $E$ appearing in a context $\Pi$, let $\mathcal R_{E,\Pi}$ be its operational response presheaf. A predictive weight assignment is a function
$$
\omega:E,\Pi\mapsto\omega(E\mid\Pi)
$$
on admissible effect-context pairs. Assume the POP risk term is response-complete: if $\mathcal R_{E,\Pi}\simeq\mathcal R_{F,\Pi'}$, then every MPU-admissible payoff protocol assigns the same payoff profile to $(E,\Pi)$ and $(F,\Pi')$. Let the PCE objective be
$$
\mathcal J[\omega]
=
\mathcal R[\omega]+\lambda \mathcal C_{\mathrm{ctx}}[\omega],
\qquad
\lambda>0,
$$
where $\mathcal R$ is the response-presheaf risk and $\mathcal C_{\mathrm{ctx}}$ is the description cost of retaining context labels not distinguished by response presheaves. Then every PPI-admissible global minimizer of $\mathcal J$ descends to a non-contextual quotient assignment
$$
\omega(E\mid\Pi)=\omega([E]),
$$
where $[E]$ is the operational response class of $E$. This proves only the idle-label quotient step; additivity and Born uniqueness are separate claims below.

*Proof.* Define an equivalence relation on admissible effect-context pairs by
$$
(E,\Pi)\sim(F,\Pi')
\quad\Longleftrightarrow\quad
\mathcal R_{E,\Pi}\simeq\mathcal R_{F,\Pi'}.
$$
By response-completeness, two equivalent pairs have identical payoff profiles in every MPU-admissible protocol. Hence any difference between their assigned weights is not a difference in the represented operational event. There are two exhaustive cases.

First suppose $\omega(E\mid\Pi)\ne\omega(F\mid\Pi')$ for some equivalent pairs. Then the assignment gives different predictive values to the same operational response class. This violates PPI operational identity: by Theorem P.6.1b.3 and Corollary P.6.1b.4, naturally isomorphic response presheaves represent the same physical invariant. Therefore such an assignment is not PPI-admissible as a physical probability ledger.

Second suppose all equivalent pairs have the same numerical value, but the ledger still retains the response-null label $\Pi$. Quotient the ledger by replacing every $(E,\Pi)$ with its equivalence class $[E]$ and define
$$
\bar\omega([E])=\omega(E\mid\Pi).
$$
This is well defined by the present case assumption. Since $\mathcal R$ depends only on response presheaves, the quotient assignment has the same risk:
$$
\mathcal R[\bar\omega]=\mathcal R[\omega].
$$
The quotient ledger has no response-null context labels. Therefore
$$
\mathcal C_{\mathrm{ctx}}[\bar\omega]\le\mathcal C_{\mathrm{ctx}}[\omega],
$$
with strict inequality whenever $\omega$ retained at least one unused context label. If strict, then $\mathcal J[\bar\omega]<\mathcal J[\omega]$, so $\omega$ cannot be a global minimizer. If equality, $\omega$ and $\bar\omega$ are the same PPI quotient object.

Thus every PPI-admissible global minimizer is represented by the quotient assignment $\bar\omega([E])$, which depends only on the effect's operational response class and not on the context in which it appears. ∎

**Lemma 8.2a (Finite-Response Additivity on the Quotient).**
Work on the quotient event ledger supplied by Theorem 8.2. Assume finite-response payoff-refinement consistency and an affine branchwise payoff representation: for an indicator payoff that rewards a retained event $E$ by one and its complement by zero, the POP value is $\omega(E)$; when $E$ is represented by a finite orthogonal refinement
$$
E=\sum_{j=1}^n F_j,
\qquad
F_iF_j=0\quad(i\ne j),
$$
the value of the refined indicator payoff is $\sum_{j=1}^n\omega(F_j)$. Assume that the coarse and refined descriptions induce the same response-complete payoff problem and receive the same POP value. Then the quotient ledger is finitely additive:
$$
\omega(E)=\sum_{j=1}^n\omega(F_j).
$$
In particular, if $\omega(I)=1$ and $\omega$ is nonnegative, then every complete orthogonal resolution $I=\sum_iP_i$ satisfies
$$
\sum_i\omega(P_i)=1,
\qquad
0\le\omega(P_i)\le1.
$$

*Proof.* Give the coarse event $E$ unit payoff and its complement zero payoff. By the affine branchwise payoff hypothesis, its coarse POP value is $\omega(E)$. The orthogonal events $F_1,\ldots,F_n$ are mutually exclusive and refine the same indicator event, so the refined POP value is $\sum_j\omega(F_j)$. Payoff-refinement consistency equates these two values and yields
$$
\omega(E)=\sum_{j=1}^n\omega(F_j).
$$
Setting $E=I$ and using $\omega(I)=1$ gives normalization on every complete finite resolution. Nonnegativity gives $\omega(P_i)\ge0$, and finite additivity gives $\omega(P_i)\le\sum_j\omega(P_j)=1$. On the finite-dimensional MPU branch, only finite additivity is required below. An infinite-dimensional extension additionally requires countable additivity, or a stated continuity hypothesis from which it follows. ∎

**Definition 8.2b (Born-Domain Completeness Certificate).** Let $\mathcal H$ be a finite-dimensional complex Hilbert space and let $\mathsf E_{\mathrm{ret}}\subseteq[0,I]$ be the retained quotient effects. A Born-domain completeness certificate $\mathfrak C_{\mathrm{Born}}$ uses one of the following independently checkable routes.

1. **Full-domain route.** If $\dim\mathcal H\ge3$, $\mathsf E_{\mathrm{ret}}$ contains every orthogonal projection and every finite orthogonal resolution of $I$, and the quotient ledger is normalized, nonnegative, and finitely additive on all such resolutions. If $\dim\mathcal H=2$, the retained domain instead contains every effect and the ledger is normalized and affine-additive on all finite POVMs.

2. **Finite informationally complete route.** The retained effects contain a real basis $F_1,\ldots,F_{d^2}$ of $\operatorname{Herm}(\mathcal H)$, where $d=\dim\mathcal H$. Every real linear relation among retained effects and $I$ is respected by the weights, so the assignment defines a well-defined real-linear functional $\ell$ on their span. The certificate supplies the trace-dual basis $D_1,\ldots,D_{d^2}$, verifies
$$
\operatorname{tr}(D_aF_b)=\delta_{ab},
\qquad
\rho_{\mathfrak C}:=\sum_{a=1}^{d^2}\omega(F_a)D_a\succeq0,
\qquad
\operatorname{tr}\rho_{\mathfrak C}=1,
\tag{8.2b.1}
$$
and records the expansion coefficients of every retained effect. Equivalently, the $d^2\times d^2$ coordinate matrix has full rank and the reconstructed Hermitian matrix in (8.2b.1) is positive semidefinite and trace one.

The full-domain route is falsified by a missing projection, resolution, or additivity relation. The finite route is falsified by rank deficiency, relation inconsistency, a negative eigenvalue of $\rho_{\mathfrak C}$, or failure on any retained effect. A single projective basis is not informationally complete: density matrices with the same diagonal and different admissible off-diagonal entries give an explicit uniqueness counterexample.

**Theorem 8.3 (Born Selector Theorem on the Quotient Hilbert Ledger).** Let $\mathcal H_\omega$ be the selected complex Hilbert carrier, let $\omega$ be a normalized positive quotient ledger satisfying Theorem 8.2 and Lemma 8.2a on its retained domain, and assume an accepted $\mathfrak C_{\mathrm{Born}}$.

1. On the full-domain route with $\dim\mathcal H_\omega\ge3$, there is a unique density operator $\rho$ such that
$$
\omega(P)=\operatorname{tr}(\rho P)
$$
for every projection $P$.

2. On the full-effect route in dimension $2$, there is a unique density operator $\rho$ such that $\omega(E)=\operatorname{tr}(\rho E)$ for every effect $E$.

3. On the finite informationally complete route in any finite dimension, $\rho_{\mathfrak C}$ of (8.2b.1) is the unique density operator satisfying
$$
\omega(E)=\operatorname{tr}(\rho_{\mathfrak C}E)
\tag{8.3.1}
$$
for every retained effect $E$. The trace formula defines the unique positive linear extension of that informationally complete ledger, but it does not assert that every unretained context was operationally available.

4. If the certified domain contains a pure predictive ray event $P_\psi=|\psi\rangle\langle\psi|$ with $\omega(P_\psi)=1$, then $\rho=P_\psi$. Hence every retained rank-one outcome $P_i=|i\rangle_s\langle i|_s$ has weight
$$
\omega(P_i)=|\langle i|\psi\rangle_s|^2.
$$

On an infinite-dimensional protocol envelope, the full-domain route additionally requires countable additivity or a stated continuity hypothesis; the finite informationally complete route asserted here is finite-dimensional.

*Proof.* On the full-domain route with $\dim\mathcal H_\omega\ge3$, the certificate—not Theorem 8.2 alone—supplies a normalized nonnegative frame function on the entire projection lattice and every orthogonal resolution. Gleason's theorem therefore gives a positive trace-class operator $\rho$ with $\omega(P)=\operatorname{tr}(\rho P)$ for all projections. Evaluation at $I$ gives $\operatorname{tr}\rho=1$. In dimension $2$, the certificate supplies the full effect algebra and affine POVM additivity, so Busch's theorem gives the same conclusion on all effects.

For the finite informationally complete route, relation consistency makes
$$
\ell\!\left(\sum_ax_aF_a\right):=\sum_ax_a\omega(F_a)
$$
well defined. Nondegeneracy of the trace pairing and the dual-basis identities give
$$
\ell(X)=\operatorname{tr}(\rho_{\mathfrak C}X)
$$
for every $X\in\operatorname{Herm}(\mathcal H_\omega)$. The certificate's matrix test gives $\rho_{\mathfrak C}\succeq0$ and trace one. Every retained effect has a recorded expansion in the basis, so (8.3.1) follows. If another density operator $\sigma$ agrees on the retained basis, then $\operatorname{tr}[(\rho_{\mathfrak C}-\sigma)F_a]=0$ for every $a$; spanning and the nondegenerate trace pairing imply $\sigma=\rho_{\mathfrak C}$.

On either route, if $\omega(P_\psi)=1$, then
$$
\operatorname{tr}[\rho(I-P_\psi)]=0.
$$
Positivity forces the support of $\rho$ into $\operatorname{Ran}P_\psi$, and trace one gives $\rho=P_\psi$. Substitution for a retained rank-one $P_i$ yields $|\langle i|\psi\rangle_s|^2$.

The uniqueness conclusion is domain-qualified. In particular, quotienting and additivity on one retained basis do not exclude other density matrices or arbitrary assignments on unregistered contexts. On a certified full-domain branch, Gleason--Busch excludes non-trace assignments globally. On a certified informationally complete branch, finite linear algebra excludes alternatives on the retained operator system and fixes its unique positive extension. The familiar power family $p_i^{(\gamma)}\propto|c_i|^\gamma$ fails the certified coarse/refined relations unless $\gamma=2$, but that example is not a substitute for domain completeness. ∎

**Definition 8.3a (Preparation Equivalence and Spectator Stability).** For finite-dimensional complex Hilbert spaces $\mathcal H_A$ and $\mathcal H_B$, an operational update $F:\mathcal D(\mathcal H_A)\to\mathcal D(\mathcal H_B)$ respects preparation equivalence when
$$
F\!\left(\sum_i p_i\rho_i\right)=\sum_i p_iF(\rho_i)
\tag{8.3a.1}
$$
for every finite probability distribution $(p_i)$ and states $(\rho_i)$. Equation (8.3a.1) determines the positive-cone map $\Phi(0)=0$ and
$$
\Phi(A)=\operatorname{tr}(A)F\!\left(\frac{A}{\operatorname{tr}A}\right)
\qquad(A\succeq0,\ A\ne0).
$$
Preparation equivalence makes this map additive and positively homogeneous on the positive cone. Its group completion therefore defines a unique real-linear map on Hermitian operators and hence a unique complex-linear extension $\Phi:\mathcal B(\mathcal H_A)\to\mathcal B(\mathcal H_B)$. The update is spectator-stable when this complex-linear extension satisfies
$$
(\Phi\otimes\operatorname{id}_R)(X)\succeq0
\tag{8.3a.2}
$$
for every finite spectator $R$ and every $X\succeq0$ on $\mathcal H_A\otimes\mathcal H_R$.

**Theorem 8.3b (Operational Mixtures and Spectator Stability Force CPTP Dynamics).** Every preparation-equivalent, spectator-stable normalized update $F$ has a unique completely positive trace-preserving linear extension
$$
\Phi:\mathcal B(\mathcal H_A)\to\mathcal B(\mathcal H_B),
\qquad
\Phi(\rho)=F(\rho),
\tag{8.3b.1}
$$
and therefore admits a Kraus representation
$$
\Phi(X)=\sum_a K_aXK_a^\dagger,
\qquad
\sum_aK_a^\dagger K_a=\mathbf1_A.
\tag{8.3b.2}
$$
Conversely, every map of the form (8.3b.2) satisfies Definition 8.3a.

*Proof.* Define $\Phi(0)=0$ and, for $A\succeq0$ with $\operatorname{tr}A>0$,
$$
\Phi(A)=\operatorname{tr}(A)F\!\left(\frac{A}{\operatorname{tr}A}\right).
$$
For positive $A,B$ of nonzero total trace, Equation (8.3a.1) with weights $\operatorname{tr}A/\operatorname{tr}(A+B)$ and $\operatorname{tr}B/\operatorname{tr}(A+B)$ gives
$$
\Phi(A+B)=\Phi(A)+\Phi(B),
$$
and the definition gives $\Phi(sA)=s\Phi(A)$ for $s\ge0$. If $A-B=C-D$ with $A,B,C,D\succeq0$, then $A+D=B+C$, so additivity gives $\Phi(A)-\Phi(B)=\Phi(C)-\Phi(D)$. Hence group completion is well defined and gives a unique real-linear positive map on the Hermitian operators. Writing $X=H+iK$ with $H,K$ Hermitian gives the unique complex-linear extension $\Phi(X)=\Phi(H)+i\Phi(K)$. For $A\succeq0$, normalization of $F$ gives
$$
\operatorname{tr}\Phi(A)
=\operatorname{tr}(A)\operatorname{tr}F\!\left(\frac{A}{\operatorname{tr}A}\right)
=\operatorname{tr}A,
$$
and linearity extends trace preservation to every $X$.

Spectator stability is positivity of $\Phi\otimes\operatorname{id}_R$ for every finite spectator $R$, which is complete positivity. In finite input dimension, Choi's theorem [Choi 1975] applies to the linear map just constructed: with $|\Omega\rangle=\sum_i|i\rangle\otimes|i\rangle$,
$$
J(\Phi)
=(\Phi\otimes\operatorname{id})(|\Omega\rangle\!\langle\Omega|)
=\sum_{i,j}\Phi(|i\rangle\!\langle j|)\otimes|i\rangle\!\langle j|,
$$
and complete positivity is equivalent to $J(\Phi)\succeq0$. Diagonalize
$$
J(\Phi)=\sum_a\lambda_a|v_a\rangle\!\langle v_a|,
\qquad \lambda_a\ge0,
$$
and define $K_a$ by $|K_a\rangle\!\rangle:=\sqrt{\lambda_a}|v_a\rangle$, using output-input vectorization. Then
$$
\Phi(X)
=\operatorname{tr}_{A}\!\left[J(\Phi)(I_B\otimes X^T)\right]
=\sum_aK_aXK_a^\dagger.
$$
Trace preservation gives, for every $X$,
$$
\operatorname{tr}X
=\operatorname{tr}\Phi(X)
=\operatorname{tr}\!\left(X\sum_aK_a^\dagger K_a\right).
$$
Nondegeneracy of the trace pairing implies $\sum_aK_a^\dagger K_a=I_A$, which is (8.3b.2).

Conversely, a map of the form (8.3b.2) is affine on state mixtures and trace preserving by the completeness relation. For every spectator $R$ and every $X\succeq0$,
$$
(\Phi\otimes\operatorname{id}_R)(X)
=\sum_a(K_a\otimes I_R)X(K_a^\dagger\otimes I_R)\succeq0.
$$
Thus it satisfies spectator stability and every clause of Definition 8.3a. ∎

**Corollary 8.3c (Reversible and Forbidden Update Boundaries).** If $\Phi$ in Theorem 8.3b has a two-sided CPTP inverse on the full output state space, then the input and output matrix algebras are completely order-isomorphic and
$$
\Phi(\rho)=U\rho U^\dagger
\tag{8.3c.1}
$$
for a unitary $U$. Thus reset-free reversible internal prediction is unitary, while irreversible Evolve updates may be general CPTP maps. A nonlinear rule on density matrices must either retain the preparation label and become PPI-contextual or violate (8.3a.1). Transposition, and hence a bare antiunitary state update, is positive but is not spectator-stable for dimension at least two because applying it to one half of a maximally entangled state produces an operator with a negative eigenvalue.

*Proof.* Let $\Psi$ be a CPTP inverse of $\Phi$ on the full output state space. Then $\Phi$ is an affine bijection of state spaces. An affine bijection maps extreme points to extreme points: if $\Phi(\rho)=t\sigma_1+(1-t)\sigma_2$ with $0<t<1$, applying $\Psi$ expresses $\rho$ as the same convex combination of $\Psi(\sigma_1)$ and $\Psi(\sigma_2)$. Hence $\rho$ is pure if and only if $\Phi(\rho)$ is pure.

For every CPTP map $\Lambda$ and every Hermitian trace-zero $X$, Lemma 9.1 and the unital positive adjoint $\Lambda^*$ give
$$
\frac12\|\Lambda(X)\|_1
=
\sup_{0\le E\le I}|\operatorname{tr}(E\Lambda(X))|
=
\sup_{0\le E\le I}|\operatorname{tr}(\Lambda^*(E)X)|
\le
\frac12\|X\|_1,
$$
because $0\le E\le I$ implies $0\le\Lambda^*(E)\le I$. Applying this inequality first to $\Phi$ and then to $\Psi$ gives
$$
D_{\mathrm{tr}}(\Phi(\rho),\Phi(\sigma))
=D_{\mathrm{tr}}(\rho,\sigma).
$$
For pure states,
$$
D_{\mathrm{tr}}(|\psi\rangle\!\langle\psi|,|\phi\rangle\!\langle\phi|)^2
=1-|\langle\psi,\phi\rangle|^2,
$$
as follows by diagonalizing their difference on $\operatorname{span}\{\psi,\phi\}$. Thus the induced bijection of rays preserves transition probabilities. Wigner's theorem in Bargmann's formulation [Bargmann 1964] applies because the ray map is bijective and transition-probability preserving, and supplies either a unitary or an antiunitary implementation.

In a chosen basis an antiunitary implementation acts on density matrices as $\rho\mapsto U\rho^TU^\dagger$. For $d\ge2$, let $|\Omega\rangle=\sum_{j=1}^d|j\rangle\otimes|j\rangle$. Partial transposition gives
$$
(T\otimes\operatorname{id})(|\Omega\rangle\!\langle\Omega|)
=
\sum_{i,j}|j\rangle\!\langle i|\otimes|i\rangle\!\langle j|
=F,
$$
where $F$ is the swap operator. Every nonzero antisymmetric vector is an eigenvector of $F$ with eigenvalue $-1$, so transposition is not completely positive. The antiunitary alternative is therefore incompatible with the CPTP hypothesis; for $d=1$ it coincides with the unitary case. Surjectivity onto the full output state space makes the implementing isometry onto, hence unitary, and proves (8.3c.1).

Equation (8.3a.1) is affine in preparation mixtures, so a nonlinear state rule either distinguishes two preparation ledgers for the same density operator or violates that equation. The displayed partial-transpose calculation also proves the final spectator-instability claim. ∎

**Relation to Theorem M.6.14e.** Appendix M treats response-natural affine completely positive instruments and their minimal dilations. Theorem 8.3b supplies the logically earlier core bridge: preparation equivalence constructs the linear extension, and idle-spectator positivity forces complete positivity.

**Theorem 8.4 (Complex Hilbert-Space Uniqueness under Local Tomography and Minimal Phase Redundancy).**
Let the predictive state space be a complete finite-dimensional inner-product space over $\mathbb D\in\{\mathbb R,\mathbb C,\mathbb H\}$. Assume:

(i) **Multiplicative compositional closure:** there exist two admissible systems of scalar dimensions $m,n\ge2$, and their composite is an admissible system of the same scalar type with scalar dimension $mn$;

(ii) **Product-effect isomorphism certificate:** writing $V_{\mathbb D}(k)$ for the real unnormalized span of the $k$-level state space, the canonical product-effect map
$$
T_{m,n}:V_{\mathbb D}(m)^*\otimes_{\mathbb R}V_{\mathbb D}(n)^*
\longrightarrow
V_{\mathbb D}(mn)^*,
\qquad
e\otimes f\longmapsto e\boxtimes f,
$$
is an isomorphism. Equivalently, a registered matrix of product effects has full rank on both sides. Hence
$$
N_{\mathbb D}(mn)+1
=
\bigl(N_{\mathbb D}(m)+1\bigr)
\bigl(N_{\mathbb D}(n)+1\bigr);
$$

(iii) **Connected phase transport:** the active predictive kernel supports a nontrivial connected scalar phase transport compatible with the gauge-coherence construction of Appendix G.2;

(iv) **PCE minimal phase redundancy:** among scalar branches with the same finite protocol-response presheaves, PCE removes surplus phase generators.

Then the unique admissible scalar field is $\mathbb D=\mathbb C$.

*Proof.* For an $n$-dimensional Hilbert space over $\mathbb D$, the real dimension of normalized density data is:

$$
N_{\mathbb R}(n)=\frac{n(n+1)}2-1
\quad(\mathbb D=\mathbb R),
$$

$$
N_{\mathbb C}(n)=n^2-1
\quad(\mathbb D=\mathbb C),
$$

$$
N_{\mathbb H}(n)=n(2n-1)-1
\quad(\mathbb D=\mathbb H).
$$

Local tomography for systems of dimensions $m,n$ requires
$$
N_{\mathbb D}(mn)+1=(N_{\mathbb D}(m)+1)(N_{\mathbb D}(n)+1).
$$
For $\mathbb C$ this identity is exact:
$$
(mn)^2=(m^2)(n^2).
$$
For $\mathbb R$ it would require
$$
\frac{mn(mn+1)}2
=
\frac{m(m+1)}2\frac{n(n+1)}2.
$$
Multiplying by $4$ and dividing by $mn>0$ gives
$$
2(mn+1)=(m+1)(n+1),
$$
hence
$$
mn-m-n+1=0,
\qquad
(m-1)(n-1)=0.
$$
Thus the real branch satisfies local tomography only when at least one factor is one-dimensional; it fails for every nontrivial composite with $m,n\ge2$.

For $\mathbb H$ it would require
$$
mn(2mn-1)=m(2m-1)n(2n-1).
$$
Dividing by $mn>0$ gives
$$
2mn-1=(2m-1)(2n-1)
=
4mn-2m-2n+1.
$$
Equivalently,
$$
2(mn-m-n+1)=0,
\qquad
(m-1)(n-1)=0.
$$
Thus the quaternionic branch also satisfies local tomography only when at least one factor is one-dimensional; it fails for every nontrivial composite with $m,n\ge2$. Hence local tomography plus compositional closure excludes the genuine real and quaternionic branches as closed predictive state-space types.

Independently, connected scalar phase transport excludes the real branch because the unit scalars in $\mathbb R$ are $\{\pm1\}$, which has no nontrivial connected component. The quaternionic branch has unit scalars $Sp(1)\cong SU(2)$, a three-dimensional nonabelian phase redundancy. The complex branch has unit scalars $U(1)$, the unique one-dimensional connected abelian scalar phase group among the three branches. If a quaternionic implementation reproduces the same operational response presheaves as its complex subbranch, the two additional phase generators are response-null surplus and are removed by PCE minimal phase redundancy. If they change responses, they introduce extra gauge content and are not the same minimal MPU formalism.

Therefore the only scalar branch satisfying compositional closure, local tomography, connected phase transport, and PCE minimality is $\mathbb C$. ∎

**Corollary 8.4a (Complex-Carrier Rank Bound).** On the finite-response Hilbert branch, the MPU carrier satisfies
$$
\dim_{\mathbb C}\mathcal H_0=d_0\ge8.
$$
If a faithful eight-dimensional carrier exists for all retained finite-response protocols and every additional carrier direction is response-null, then the PCE-minimal carrier satisfies $\mathcal H_0\cong\mathbb C^8$.

*Proof.* Theorem 15 gives the operational role-readout floor
$$
N_{\mathrm{vis}}^{\min}=8.
$$
A sharp finite context with $N$ perfectly distinguishable rank-one alternatives consists of $N$ mutually orthogonal nonzero vectors. A complex Hilbert space of dimension $d$ contains at most $d$ such vectors. Therefore
$$
d_0\ge N_{\mathrm{vis}}^{\min}=8.
$$
Under the additional existence hypothesis, rank eight attains this lower bound. Under the additional response-null hypothesis, every direction beyond that carrier changes no retained protocol response and is removed by PCE. These two hypotheses give $d_0=8$ and hence $\mathcal H_0\cong\mathbb C^8$. ∎

**Theorem 8.5 (Schrödinger Form from Continuous Reversible Transition-Probability-Preserving Time Translations).**
Let $\{\mathcal T_t\}_{t\in\mathbb R}$ denote the Internal Prediction dynamics on rays of $\mathcal H_0$. Assume:
1. each $\mathcal T_t$ is reversible and preserves transition probabilities;
2. the family is time-translation symmetric, so $\mathcal T_{t+s}=\mathcal T_t\circ\mathcal T_s$ and $\mathcal T_0=\mathrm{id}$;

3. the induced family of implementers is weakly measurable.

Then there exists a one-parameter family of unitary operators $\{U(t)\}_{t\in\mathbb R}$ on $\mathcal H_0$ such that
$$
\mathcal T_t([\psi])=[U(t)\psi].
$$
Because the minimal Appendix Z branch gives $d_0=8$ (Theorem Z.2, with Theorem 23 supplying the lower bound), $\mathcal H_0$ is finite dimensional; hence weak measurability implies continuity, so $\{U(t)\}$ is a strongly continuous one-parameter unitary group. By Stone's theorem (Stone 1932), there is a self-adjoint operator $H$ with
$$
U(t)=e^{-iHt/\hbar},
$$
and for every $|\psi(t)\rangle=U(t)|\psi(0)\rangle$,
$$
i\hbar\frac{d}{dt}|\psi(t)\rangle=H|\psi(t)\rangle.
$$

*Proof.* By Wigner's theorem (Wigner 1931), each transition-probability-preserving bijection $\mathcal T_t$ on rays is implemented by either a unitary or an anti-unitary operator, unique up to phase. The unitary/anti-unitary alternative is eliminated algebraically. For each $t$, let
$$
\epsilon(t)=
\begin{cases}
0,&\mathcal T_t\text{ has a unitary implementer},\\
1,&\mathcal T_t\text{ has an anti-unitary implementer}.
\end{cases}
$$
This is well defined because multiplying an implementer by a phase does not change its unitary or anti-unitary type. The composition law $\mathcal T_{t+s}=\mathcal T_t\circ\mathcal T_s$ implies
$$
\epsilon(t+s)=\epsilon(t)+\epsilon(s)\pmod2.
$$
For every $t\in\mathbb R$,
$$
\epsilon(t)=\epsilon(t/2+t/2)=2\epsilon(t/2)=0\pmod2.
$$
Thus every $\mathcal T_t$ is implemented by a unitary operator. The weak measurability hypothesis is then used only to choose phases so that the unitary implementers form a strongly continuous one-parameter group.

The implementers are unique only up to phase. By Bargmann's theorem on continuous projective representations (Bargmann 1964), the phases can be chosen so that the implementers satisfy
$$
U(0)=I,
\qquad
U(t+s)=U(t)U(s).
$$
Since $\dim\mathcal H_0=d_0=8<\infty$, weak measurability of the matrix elements of $U(t)$ implies continuity of the matrix entries; hence $t\mapsto U(t)$ is strongly continuous.

Stone's theorem now applies to the strongly continuous one-parameter unitary group $\{U(t)\}_{t\in\mathbb R}$ and yields a unique self-adjoint generator $H$ such that
$$
U(t)=e^{-iHt/\hbar}.
$$
Differentiating $|\psi(t)\rangle=U(t)|\psi(0)\rangle$ gives
$$
\frac{d}{dt}|\psi(t)\rangle
=
-\frac{i}{\hbar}H|\psi(t)\rangle,
$$
which is equivalent to the Schrödinger equation. ∎

The complex Hilbert space structure (Proposition 4) thus provides the necessary mathematical framework for MPU dynamics. Theorem 8.4 and Appendix G.1.8 show that the complex field $\mathbb C$ is the unique branch compatible with compositional closure, local tomography, connected phase transport, and PCE removal of surplus phase redundancy. Alternative formalisms either fail the composition/tomography identity, lack the required connected scalar phase, or add response-null phase generators removed by PCE. The Dual Dynamics (Section 7.3.3) dictate the evolution upon this stage, naturally mapping onto the core elements of QM formalism.

**8.2 Interpretation of Superposition**

**Proposition 6 (Interpretation of Pure-State Superposition)**

Let $|\psi\rangle\in\mathcal H_0$ be a normalized pure predictive state, and let $\{|i\rangle_s\}$ be an orthonormal basis associated with perspective $s\in\Sigma$. Then
$$
|\psi\rangle=\sum_i c_i|i\rangle_s,
\qquad
c_i=\langle i|\psi\rangle_s,
$$
and Proposition 7 assigns outcome probability $|c_i|^2$ to the rank-one outcome $|i\rangle_s\langle i|_s$. The coefficient support and phases depend on the selected basis. This is a conditional interpretation of a pure Hilbert state; SPAP alone does not exclude mixed predictive states or force more than one nonzero coefficient in every basis.

*Proof.* Completeness of the orthonormal basis gives
$$
I=\sum_i|i\rangle_s\langle i|_s.
$$
Applying this identity to $|\psi\rangle$ yields
$$
|\psi\rangle=\sum_i|i\rangle_s\langle i|\psi\rangle_s
=\sum_i c_i|i\rangle_s.
$$
Normalization gives $\sum_i|c_i|^2=1$. Proposition 7 gives the probability of the $i$th rank-one outcome as
$$
\langle\psi|i\rangle_s\langle i|\psi\rangle_s=|c_i|^2.
$$
A change of orthonormal basis changes the coefficients by the corresponding unitary basis transformation, so their support and relative phases are perspective-dependent. ∎

**Remark 8.2a (Operational Branch Support).** The support of a superposition is a perspective-, basis-, apparatus-, and resolution-indexed operational branch support. It counts the mutually distinguishable outcomes retained by the admissible protocol at the chosen resolution, not an additional commitment that each displayed basis component is a separate primitive ontology. Under a change of perspective $s\mapsto s'$, the same vector $|\psi\rangle$ may have a different coefficient support; PPI identifies descriptions that induce the same finite protocol-response distributions, and PCE removes response-null surplus labels. Thus Proposition 6 is an operational branch-enumeration statement inside the Hilbert representation, while Proposition 7 supplies the unique consistent probability measure on the retained branch support.

**8.3 Emergence of the Born Rule**

**Proposition 7 (Emergence of the Born Rule)**

By Principle 8.0b and Theorem 8.0d, the fundamental MPU has carrier $\mathcal H_0\cong\mathbb C^8$. Theorem 8.2 and Lemma 8.2a supply quotienting and retained-refinement additivity; an accepted $\mathfrak C_{\mathrm{Born}}$ supplies the missing full-domain or informational-completeness gate; and Theorem 8.3 gives the trace representation on that certified domain. Principle 8.0c separately identifies those weights with registered single-run probabilities. For a retained rank-one projective context $P_i^{(s)}=|i\rangle_s\langle i|_s$,
$$
\sum_iP_i^{(s)}=I,
\qquad
P(i|\rho,s)=\operatorname{tr}(\rho P_i^{(s)}).
\tag{49--50}
$$
On the pure-state shorthand $\rho=|\psi\rangle\langle\psi|$, this reduces to $P(i|\rho,s)=|\langle i|\psi\rangle_s|^2$. General mixed and reduced states retain the trace form.

*Proof.* The accepted $\mathfrak C_{\mathrm{Born}}$, not the inequality $d_0\ge3$ by itself, activates Theorem 8.3. It supplies a unique density operator $\rho$ representing every retained effect on the informationally complete route and every projection or effect on the full-domain route. For a certified pure predictive state $\rho(t)=|\psi\rangle\langle\psi|$, the ray-calibration clause fixes the same density operator independently of unit-vector phase. Let
$$
P_i:=|i\rangle_s\langle i|_s.
$$
The first identity in Equation (49--50) is a complete orthogonal resolution of the identity, so the probability assigned to outcome $i$ is
$$
P(i|\rho(t),s)=\omega(P_i)=\operatorname{tr}(\rho(t)P_i)
=\operatorname{tr}\big(|\psi\rangle\langle\psi|\,|i\rangle_s\langle i|_s\big)
=\langle\psi|i\rangle_s\langle i|\psi\rangle_s
=|\langle i|\psi\rangle_s|^2.
$$
This is the second identity in Equation (49--50). Theorem 8.3 excludes non-Born alternatives only on the accepted full-domain or informationally complete certificate route; quotienting and one retained context alone do not suffice. ∎

**Theorem 8.6 (SPAP-to-Quantum Dependency Separation and Born Uniqueness).** The complete PU route has five logically distinct steps:

1. Theorems 10–11 exclude a universally exact predictor on their diagonal-closed classes.
2. Principle 11b selects the invariant convex response completion, and Theorem 11b proves the unique binary law $(1/2,1/2)$.
3. Principle 8.0b supplies the carrier certificate, and Theorems G.1.8 and 8.0d select $\mathcal H_0\cong\mathbb C^8$.
4. Theorem 8.2 and Lemma 8.2a make the retained predictive ledger response-quotiented, normalized, positive, and finitely additive. Definition 8.2b then requires either full projection/effect coverage or a finite informationally complete operator-system certificate with positive density reconstruction. Theorem 8.3 uniquely gives $\omega(E)=\operatorname{tr}(\rho E)$ on that certified domain; global projection or effect statements require the corresponding full-domain route.
5. Principle 8.0c identifies the instrument block weights with registered single-run outcome probabilities. Frequency convergence requires the repeated-trial certificate stated in Principle 8.0c.

For a pure state and a rank-one sharp outcome,
$$
\Pr(i\mid\psi)=|\langle i|\psi\rangle|^2.
$$
No normalized positive alternative exists on the same accepted full-domain or informationally complete ledger. Sparse retained subledgers may admit multiple density extensions. Steps 1--2 do not logically imply Steps 3--5: the carrier, Born-domain, and actualization certificates are independent, falsifiable closure data.

*Proof.* Steps 1–3 are the cited theorems and principles. Step 4 is Theorems 8.2–8.3; in dimension $8\ge3$, the Gleason representation on projections is unique, and the normalized power alternatives $p_i^{(\gamma)}\propto|c_i|^\gamma$ fail coarse/refined additivity unless $\gamma=2$. Step 5 is Principle 8.0c and the instrument conclusion of Theorem 8.0d. ∎


**8.4 Derivation of Uncertainty Relations**

**Proposition 8 (Robertson Uncertainty Relation on the Hilbert Branch)**

Let $\hat A$ and $\hat B$ be Hermitian operators on the finite-dimensional MPU Hilbert space $\mathcal H_0$, and let $|\psi\rangle$ be normalized. Then
$$
\Delta A \cdot \Delta B \geq \frac{1}{2} |\langle [\hat{A}, \hat{B}] \rangle| \quad \text{(51)},
$$
where $\Delta A=\sqrt{\langle(\hat A-\langle\hat A\rangle I)^2\rangle}$ and similarly for $\Delta B$. This inequality is a consequence of the Hilbert-space representation and the supplied commutator. Identifying a particular pair of noncommuting observables requires a separate structural argument.

*Proof.* Set $\hat{A}_0=\hat{A}-\langle\hat{A}\rangle I$ and $\hat{B}_0=\hat{B}-\langle\hat{B}\rangle I$, and define
$$
|u\rangle=\hat{A}_0|\psi\rangle,\qquad |v\rangle=\hat{B}_0|\psi\rangle.
$$
By Cauchy–Schwarz,
$$
\langle u|u\rangle\,\langle v|v\rangle \ge |\langle u|v\rangle|^2.
$$
The left-hand side is
$$
\langle u|u\rangle\,\langle v|v\rangle
=\langle \psi|\hat A_0^2|\psi\rangle\,\langle \psi|\hat B_0^2|\psi\rangle
=(\Delta A)^2(\Delta B)^2.
$$
For the right-hand side, write
$$
\hat A_0\hat B_0
=\frac12\{\hat A_0,\hat B_0\}+\frac12[\hat A_0,\hat B_0].
$$
Because $\hat A_0$ and $\hat B_0$ are self-adjoint, $\{\hat A_0,\hat B_0\}$ is self-adjoint and $[\hat A_0,\hat B_0]$ is anti-self-adjoint. Hence
$$
\langle \psi|\hat A_0\hat B_0|\psi\rangle
=\frac12\langle \{\hat A_0,\hat B_0\}\rangle+\frac12\langle [\hat A_0,\hat B_0]\rangle
$$
has real part $\frac12\langle \{\hat A_0,\hat B_0\}\rangle$ and imaginary part $\frac{1}{2i}\langle [\hat A_0,\hat B_0]\rangle$. Therefore
$$
|\langle \psi|\hat A_0\hat B_0|\psi\rangle|^2
=\frac14|\langle \{\hat A_0,\hat B_0\}\rangle|^2+\frac14|\langle [\hat A_0,\hat B_0]\rangle|^2
\ge \frac14|\langle [\hat A_0,\hat B_0]\rangle|^2.
$$
Since $[\hat A_0,\hat B_0]=[\hat A,\hat B]$, we obtain
$$
(\Delta A)^2(\Delta B)^2\ge \frac14|\langle [\hat A,\hat B]\rangle|^2.
$$
Taking square roots gives
$$
\Delta A\,\Delta B \ge \frac12 |\langle [\hat A,\hat B]\rangle|.
$$
∎

Section 14.2.6 compares two separately registered finite-response branches: a Hilbert/complementarity branch for simultaneous-variable uncertainty and a fixed-ready-state reset branch for sequential support and heat ledgers. SPAP supplies only the diagonal limitation relevant to the discussion; it does not imply the reset architecture, conditional Landauer hypotheses, or channel contractivity.

The finite MPU carrier $\mathcal H_0\cong\mathbb C^8$ cannot itself support an exact canonical pair, because $\operatorname{tr}[\hat x,\hat p]=0$ for finite matrices whereas $\operatorname{tr}(i\hbar I)=i\hbar\dim\mathcal H_0\ne0$. An exact position-momentum pair therefore belongs, if present, to a separately constructed infinite-dimensional effective carrier. Assume on that carrier that the Weyl relations have a regular irreducible representation. The Stone–von Neumann theorem (von Neumann 1932) then classifies that representation up to unitary equivalence; it does not supply the Weyl relations. On a common invariant domain containing a normalized state $|\psi\rangle$ and lying in $D(\hat x\hat p)\cap D(\hat p\hat x)$, the assumed canonical commutation relation is
$$
[\hat{x},\hat{p}] = i\hbar I \quad \text{(52)}.
$$
Applying Equation (51) on that domain gives
$$
\Delta x \cdot \Delta p \geq \frac{1}{2}\left|\langle\psi|[\hat x,\hat p]|\psi\rangle\right| = \frac{1}{2}|i\hbar| = \frac{\hbar}{2} \quad \text{(53)}.
$$
Thus Equation (53) is conditional on an infinite-dimensional effective representation of the canonical commutation relations and the stated common-domain hypothesis.


**8.5 Registered Measurement Instruments and Conditional State Updates**

On Principles 8.0b--8.0c and Theorem 8.0d, a registered verification is represented by a normalized quantum instrument, and conditioning on its unique registered outcome gives the corresponding state update. This is a branch-qualified operational account of measurement. Definition 27 alone does not make every interaction a measurement, derive the Born ledger, select a single outcome, or exclude alternative response-equivalent outcome ontologies.

**8.5.1 Proposition 9 (Ideal Measurement as a Registered `Evolve` Instrument)**

Let $\hat A=\sum_k a_kP_k$ be nondegenerate with $P_k=|k\rangle\langle k|$. On Principles 8.0b–8.0c, suppose the registered verification is sharp and repeatable: its effect is $P_k$, and conditional on $k$ a second immediate verification returns $k$ with probability one. Then
$$
\mathcal I_k(\rho)=P_k\rho P_k,
\tag{8.5.1}
$$
so
$$
\Pr(k\mid\rho)=\operatorname{tr}(\rho P_k).
\tag{8.5.2}
$$
For a normalized conditional perspective kernel $G_{\mathrm{persp}}$,
$$
\frac{d\mathbb P(k,s'\mid\rho,s,N_{\mathrm{app}},\Delta t)}{d\mu(s')}
=
\operatorname{tr}(\rho P_k)
G_{\mathrm{persp}}(s'\mid s,k,N_{\mathrm{app}},\Delta t).
\tag{8.5.3}
$$

*Proof.* Theorem 8.0d makes the update an instrument. For Kraus operators $A_{k\alpha}$,
$$
\sum_\alpha A_{k\alpha}^\dagger A_{k\alpha}=P_k.
$$
If $|x\rangle\perp|k\rangle$, the nonnegative sum $\sum_\alpha\|A_{k\alpha}|x\rangle\|^2$ vanishes, so $A_{k\alpha}=|v_{k\alpha}\rangle\langle k|$. Repeatability puts every $v_{k\alpha}$ in $\operatorname{Ran}P_k$, hence $A_{k\alpha}=c_{k\alpha}P_k$. The effect identity gives $\sum_\alpha|c_{k\alpha}|^2=1$ and therefore $\mathcal I_k(\rho)=P_k\rho P_k$. The probability and normalized perspective law follow. ∎

**8.5.2 Example 8.1 (Qubit Measurement Illustration)**

Consider an MPU qubit in perspectival state $S_{(s_{initial})}(t) = (|\psi\rangle, s_{initial})$, with $|\psi\rangle = c_0|0\rangle + c_1|1\rangle$ (Z-basis).

*   **Z-Basis Measurement:** Apparatus selects perspective $s_Z$ (Z-basis $\{|0\rangle, |1\rangle\}$). 'Evolve' triggers:
    *   *Actualization:* Outcome is $|0\rangle$ with $P(0)=|c_0|^2$ or $|1\rangle$ with $P(1)=|c_1|^2$. Assume outcome $|0\rangle$.
    *   *Shift:* Perspective shifts $s_{initial} \to s'_{Z,0}$.
    *   *Post-Measurement State:* $S'_{Z,0} = (|0\rangle, s'_{Z,0})$. System described by $|0\rangle$ relative to $s'_{Z,0}$.

*   **X-Basis Measurement:** Apparatus selects perspective $s_X$ (X-basis $\{|+\rangle, |-\rangle\}$). 'Evolve' triggers:
    *   *Actualization:* Outcome is $|+\rangle$ with $P(+)=|\langle +|\psi\rangle|^2 = |(c_0+c_1)/\sqrt{2}|^2$ or $|-\rangle$ with $P(-)=|\langle -|\psi\rangle|^2 = |(c_0-c_1)/\sqrt{2}|^2$. Assume outcome $|+\rangle$.
    *   *Shift:* Perspective shifts $s_{initial} \to s'_{X,+}$.
    *   *Post-Measurement State:* $S'_{X,+} = (|+\rangle, s'_{X,+})$. System described by $|+\rangle$ relative to $s'_{X,+}$.

*   **Conditional perspective-indexed record:** On the accepted instrument and single-outcome branch, the registered result $0$ is stored relative to $s'_{Z,0}$. Re-expansion of $|0\rangle$ in the incompatible $X$ basis is a mathematical basis change, not a second outcome record. The proposition establishes the conditioned record and update within this calculus; it does not by itself prove that no absolute or latent response-equivalent completion exists.

**8.5.3 Corollary 4 (Operational Measurement Closure)**

On Principles 8.0b–8.0c, a finite verification is a registered quantum instrument by Theorem 8.0d. For an ideal nondegenerate sharp repeatable verification, Proposition 9 derives the Lüders update and Born single-run probabilities. Frequency convergence requires a separate repeated-trial certificate. The unconditioned channel is
$$
\rho\longmapsto\sum_kP_k\rho P_k,
$$
while the conditioned state is $P_k$ for the unique registered label $k$. Internal unitary prediction and registered verification/update are successive stages of one cycle.

The logical status is explicit: Principle 8.0b and Theorem 8.0d give the carrier, Theorems 8.2–8.3 give trace weights, and Principle 8.0c gives irreducible single-outcome registration. Thermodynamic irreversibility is not used to manufacture definiteness; it enters only when the architecture contains a registered reset, through Theorem 31 or Theorem 31a.

**8.6 Interpretation of Entanglement (Proposition 10)**

Quantum entanglement finds a natural interpretation within the MPU framework as a representation of strong predictive coupling between interacting units.

**Proposition 10 (Interpretation of Entanglement as Predictive Coupling)**

For a bipartite MPU state $\rho_{AB}$ on $\mathcal H_A\otimes\mathcal H_B$, entanglement is the Hilbert-space representation of nonclassical predictive coupling between the subsystems. Separable states produce joint outcome statistics that are convex mixtures of product statistics. Entangled states can produce stronger correlations than any single product state, and for pure states of fixed local dimension the maximally entangled states maximize the mutual information $I(A;B)$.

*Proof:*
1.  **Separable states.** If
    $$
    \rho_{AB}=\sum_r p_r\,\rho_A^{(r)}\otimes \rho_B^{(r)},
    $$
    then for local POVMs $\{E_a\}$ and $\{F_b\}$ the joint statistics are
    $$
    P(a,b)=\sum_r p_r\,\operatorname{tr}(\rho_A^{(r)}E_a)\,\operatorname{tr}(\rho_B^{(r)}F_b),
    $$
    so all correlations arise from classical mixing of product distributions.

2.  **Entangled pure states.** Let
    $$
    |\Psi\rangle=\sum_{j=1}^{d}\sqrt{\lambda_j}\,|j\rangle_A\otimes |j\rangle_B
    $$
    be a Schmidt decomposition, where $d=\min(\dim\mathcal H_A,\dim\mathcal H_B)$ and $\lambda_j\ge0$, $\sum_j\lambda_j=1$. The state is entangled iff at least two $\lambda_j$ are nonzero. For a pure bipartite state,
    $$
    S(\rho_{AB})=0,\qquad S(\rho_A)=S(\rho_B)=H(\lambda),
    $$
    so
    $$
    I(A;B)=S(\rho_A)+S(\rho_B)-S(\rho_{AB})=2H(\lambda)\le 2\log d,
    $$
    with equality iff $\lambda_j=1/d$ for all $j$. Thus the maximally entangled pure states maximize mutual information at fixed local dimension.

3.  **Nonclassical correlations.** Suitable local measurements on entangled states can yield correlations unattainable from any single product state, and for appropriate states and settings they can violate Bell inequalities. This is an existential statement about suitable entangled configurations, not a claim about every entangled state.

4.  **Causality.** The local marginals remain $\rho_A=\operatorname{tr}_B\rho_{AB}$ and $\rho_B=\operatorname{tr}_A\rho_{AB}$, so entanglement does not by itself create a signaling channel. This exact marginal invariance satisfies Theorem 39c directly; no bounded-bias or regular-window CC premise is needed.

Hence entanglement is the mathematical representation of nonclassical predictive coupling, while maximal predictive coupling in the mutual-information sense is realized by maximally entangled pure states. ∎

**Corollary 5 (Bell Violations without FTL Signaling)**

For entangled states and local measurement settings that violate a Bell inequality, the resulting correlations are nonclassical but do not enable deterministic superluminal signaling.

*Proof.* Let $\{E_a^x\}$ and $\{F_b^y\}$ be local POVMs chosen by Alice and Bob, and let
$$
P(a,b\mid x,y)=\operatorname{tr}\!\big((E_a^x\otimes F_b^y)\rho_{AB}\big).
$$
If the chosen state $\rho_{AB}$ and settings $(x,y)$ violate a Bell inequality, then the correlations are not reproducible by any local hidden-variable model satisfying Bell-local factorization together with measurement independence, $\rho(\lambda\mid x,y)=\rho(\lambda)$. This is the formal Bell conclusion; it does not by itself decide which assumption a nonstandard completion rejects. However, Bob's marginal distribution is
$$
P(b\mid y)=\sum_a P(a,b\mid x,y)
=\operatorname{tr}\!\big((I\otimes F_b^y)\rho_{AB}\big),
$$
which is independent of Alice's setting $x$. The same calculation shows that Alice's marginal is independent of Bob's setting $y$. Therefore Bell-nonclassical correlations do not by themselves define a superluminal signaling channel. In the PU framework, an independently declared bounded-bias ceiling together with Theorem 39 excludes endpoint-complete forcing of both outcomes of a binary coarse-graining, and Theorem 42 excludes finite-window zero-error contradiction protocols only on its regular branch. Exact causal compliance separately requires Theorem 39c. ∎

**8.7 Derivation of Schrödinger Equation (Proposition 11)**

Under the symmetry and continuity hypotheses formalized in Theorem 8.7, the deterministic evolution of the MPU state $|\psi(t)\rangle$ between 'Evolve' interactions, representing internal prediction ($b_p$, Definition 26), is described by the Schrödinger equation.

**Lemma 8.6a (Fubini–Study Isometry under Transition-Probability Preservation).**
Let $\mathcal T$ be a deterministic map on the rays of a complex Hilbert space. Assume that for every pair of unit vectors $\psi,\phi$,
$$
|\langle\psi|\phi\rangle|^2
=
|\langle\psi'|\phi'\rangle|^2,
\qquad
[\psi']=\mathcal T([\psi]),\quad [\phi']=\mathcal T([\phi]).
$$
Then $\mathcal T$ is an isometry of ray space with respect to the Fubini–Study distance.

*Proof.* The Fubini–Study distance between rays represented by unit vectors is
$$
d_{FS}([\psi],[\phi])=\arccos|\langle\psi|\phi\rangle|.
$$
The hypothesis implies $|\langle\psi'|\phi'\rangle|=|\langle\psi|\phi\rangle|$, because both sides are nonnegative. Applying $\arccos$ gives
$$
d_{FS}(\mathcal T([\psi]),\mathcal T([\phi]))=d_{FS}([\psi],[\phi]).
$$
Thus $\mathcal T$ is a Fubini–Study isometry. ∎

**Proposition 11 (Autonomous Schrödinger Equation for Internal Evolution)**

On the transition-probability-preserving internal branch of Lemma 8.6a, assume the Internal Prediction phase defines a continuous time-translation-symmetric ray dynamics on $\mathcal H_0$. Then its unitary lift is generated by a time-independent self-adjoint operator $\hat H$.

*Proof.* Theorem 8.7 yields a strongly continuous unitary group $U(t)=e^{-i\hat Ht/\hbar}$ implementing the Internal Prediction dynamics on $\mathcal H_0$. For every initial vector $|\psi_0\rangle\in D(\hat H)$,
$$
|\psi(t)\rangle=U(t)|\psi_0\rangle
$$
has the strong derivative
$$
i\hbar\frac{d}{dt}|\psi(t)\rangle=\hat H|\psi(t)\rangle.
$$
Thus the internal evolution satisfies the autonomous Schrödinger equation on $D(\hat H)$. ∎

**Theorem 8.7 (Time-translation symmetry ⇒ unitary group ⇒ Schrödinger dynamics).**
On the PPI/PCE-isometric internal branch of Lemma 8.6a, assume the internal ray dynamics is time-translation symmetric: there exists a family $\{\mathcal T_t\}_{t\in\mathbb R}$ with $\mathcal T_{t+s}=\mathcal T_t\circ\mathcal T_s$, $\mathcal T_0=\mathrm{id}$, and $t\mapsto \mathcal T_t$ continuous. Then each $\mathcal T_t$ acts bijectively on rays and preserves all Born transition probabilities, and there exists a strongly continuous unitary group $U(t)$ on $\mathcal H_0$ with
$$
\mathcal T_t(\rho)=U(t)\rho U(t)^\dagger.
$$
By Stone's theorem, there is a densely defined self-adjoint operator $\hat H$ such that
$$
U(t)=e^{-i\hat H t/\hbar}.
$$
Hence, for every density operator $\rho(t)=U(t)\rho(0)U(t)^\dagger$,
$$
\frac{d}{dt}\rho(t)=-\frac{i}{\hbar}[\hat H,\rho(t)]
$$
on the natural commutator domain, and for every $\psi_0\in D(\hat H)$ the vector $\psi(t)=U(t)\psi_0$ satisfies
$$
i\hbar\,\frac{d}{dt}|\psi(t)\rangle=\hat H|\psi(t)\rangle.
$$

*Proof.* Fix $t\in\mathbb R$. Because $\mathcal T_t$ is a bijection of rays preserving transition probabilities, Wigner's theorem yields an implementing operator $V_t$ that is either unitary or anti-unitary and is unique up to a phase. The unitary/anti-unitary type defines a homomorphism from the additive group $\mathbb R$ to $\mathbb Z_2$. Indeed, set
$$
\epsilon(t)=
\begin{cases}
0,&\mathcal T_t\text{ is implemented by a unitary},\\
1,&\mathcal T_t\text{ is implemented by an anti-unitary}.
\end{cases}
$$
The parity is independent of the phase of the Wigner implementer, and the group law gives
$$
\epsilon(t+s)=\epsilon(t)+\epsilon(s)\pmod2.
$$
Since $\mathbb R$ is divisible,
$$
\epsilon(t)=\epsilon(t/2+t/2)=2\epsilon(t/2)=0\pmod2
$$
for every $t$. Hence every $\mathcal T_t$ has a unitary implementer. By Bargmann's continuity theorem for one-parameter ray representations, the phases can be chosen so that the implementers satisfy
$$
U(0)=I,\qquad U(t+s)=U(t)U(s),
$$
and $t\mapsto U(t)\psi$ is continuous for every $\psi\in\mathcal H_0$ [Bargmann 1964]. Thus $\{U(t)\}_{t\in\mathbb R}$ is a strongly continuous one-parameter unitary group.

Stone's theorem therefore applies and gives a unique self-adjoint generator $\hat H$ with
$$
U(t)=e^{-i\hat H t/\hbar}
$$
[Stone 1932]. For density operators,
$$
\rho(t)=U(t)\rho(0)U(t)^\dagger.
$$
Let $\rho(0)$ be such that both $\hat H\rho(0)$ and $\rho(0)\hat H$ are trace class. Then
$$
\frac{U(h)-I}{h}\rho(t)\to -\frac{i}{\hbar}\hat H\rho(t),\qquad
\rho(t)\frac{U(h)^\dagger-I}{h}\to \frac{i}{\hbar}\rho(t)\hat H
$$
in trace norm as $h\to0$, so
$$
\frac{\rho(t+h)-\rho(t)}{h}
=
\frac{U(h)-I}{h}\rho(t)U(h)^\dagger
+
\rho(t)\frac{U(h)^\dagger-I}{h}
\to
-\frac{i}{\hbar}[\hat H,\rho(t)].
$$
This proves the von Neumann equation. If $\psi_0\in D(\hat H)$ and $\psi(t)=U(t)\psi_0$, then Stone's theorem also gives the strong derivative
$$
\frac{d}{dt}\psi(t)=-\frac{i}{\hbar}\hat H\psi(t),
$$
which is equivalent to
$$
i\hbar\,\frac{d}{dt}|\psi(t)\rangle=\hat H|\psi(t)\rangle.
$$
The identification of $\hat H$ with the operational-energy generator discussed in Theorem 29 is an additional physical interpretation and is not needed for the mathematical derivation of unitary Schrödinger dynamics. ∎

## 8.8 Finite Quantum-Carrier Resolution Records

**Theorem 8.8a (Associative Scalar-Family Ablation and Tomographic Defects).** For $\mathbb D\in\{\mathbb R,\mathbb C,\mathbb H\}$, the cone of positive Hermitian $n\times n$ matrices over $\mathbb D$ is self-dual and homogeneous and has sharp rank-one contexts. Its real unnormalized dimension is
$$
D_{\mathbb R}(n)=\frac{n(n+1)}2,
\qquad
D_{\mathbb C}(n)=n^2,
\qquad
D_{\mathbb H}(n)=n(2n-1).
\tag{8.8a.1}
$$
For nontrivial $m,n\ge2$, the real family has the tomographic deficit
$$
D_{\mathbb R}(mn)-D_{\mathbb R}(m)D_{\mathbb R}(n)
=\frac{mn(m-1)(n-1)}4>0,
\tag{8.8a.2}
$$
whereas the quaternionic family has the product-effect excess
$$
D_{\mathbb H}(m)D_{\mathbb H}(n)-D_{\mathbb H}(mn)
=2mn(m-1)(n-1)>0.
\tag{8.8a.3}
$$
The connected unit-scalar groups are respectively trivial, $U(1)$, and $Sp(1)$. Hence self-duality, homogeneity, and sharpness do not select the complex family; the product-effect isomorphism and one-dimensional connected phase clauses of Theorem 8.4 select $\mathbb C$ among these three associative scalar families. Spin-factor, exceptional, reducible, and physical-carrier exclusions still require Principle 8.0b's separate finite record.

*Proof.* The real trace pairing $\operatorname{Re}\operatorname{tr}(AB)$ gives self-duality, and congruence by an invertible matrix acts transitively on the positive-definite cone. Counting real diagonal and off-diagonal coordinates gives (8.8a.1). Direct subtraction gives (8.8a.2)--(8.8a.3). The unit-scalar groups then give the phase classification. ∎

**Corollary 8.8a.1 (Independent Scalar-Gate Ablation on the Associative Families).** Fix nontrivial scalar dimensions $m,n\ge2$ and restrict the comparison to $\mathbb D\in\{\mathbb R,\mathbb C,\mathbb H\}$. Then each of the following packages selects $\mathbb C$ without the other:

1. multiplicative compositional closure together with the product-effect isomorphism of Theorem 8.4(ii);
2. the requirement that the identity component of the scalar-unit group be exactly a nontrivial one-dimensional connected group.

If both gates are removed while self-duality, homogeneity, and sharp rank-one contexts are retained, all three scalar families survive. If the exact one-dimensional phase gate is weakened to the existence of some nontrivial connected scalar phase, both $\mathbb C$ and $\mathbb H$ survive; PCE removes the quaternionic surplus generators only after equality of the retained response presheaves has been certified. Thus, on the associative three-family census, the two exact gates are alternative sufficient selectors rather than jointly necessary axioms.

*Proof.* Under the first package, Equations (8.8a.2)--(8.8a.3) show that the canonical product-effect map cannot be an isomorphism for $\mathbb R$ or $\mathbb H$, whereas $D_{\mathbb C}(mn)=D_{\mathbb C}(m)D_{\mathbb C}(n)$. Hence only $\mathbb C$ survives. Under the second package, the identity components of the scalar-unit groups are, respectively, the trivial group, $U(1)$, and $Sp(1)$. Their real dimensions are $0$, $1$, and $3$, so exactly the complex family satisfies the stated phase condition. Removing both conditions leaves the three cones exhibited in Theorem 8.8a. Under the weakened connected-phase condition, $U(1)$ and $Sp(1)$ both qualify. Definition D.8.9a permits a PCE comparison only after equality of all retained finite protocol responses has defined one response-equivalence class, so dimension of the phase group alone cannot perform the final quotient. ∎

**Theorem 8.8b (Minimal Explicit Informationally Complete Effect Frame on $\mathbb C^8$).** Fix an orthonormal basis $e_1,\ldots,e_8$. Define the 64 rank-one effects
$$
P_j=|e_j\rangle\!\langle e_j|,
$$
$$
Q_{jk}=\frac12|e_j+e_k\rangle\!\langle e_j+e_k|,
\qquad
R_{jk}=\frac12|e_j-i e_k\rangle\!\langle e_j-i e_k|
\quad(1\le j<k\le8).
\tag{8.8b.1}
$$
They form a real basis of $\operatorname{Herm}(\mathbb C^8)$. If
$$
p_j=\omega(P_j),\qquad q_{jk}=\omega(Q_{jk}),\qquad r_{jk}=\omega(R_{jk}),
$$
the unique reconstructed Hermitian matrix has
$$
\rho_{jj}=p_j,
\qquad
\rho_{jk}
=q_{jk}-\frac{p_j+p_k}{2}
+i\left(r_{jk}-\frac{p_j+p_k}{2}\right)
\quad(j<k),
\tag{8.8b.2}
$$
and $\rho_{kj}=\overline{\rho_{jk}}$. It is a density operator exactly when $\rho\succeq0$ and $\sum_jp_j=1$. Because Definition 8.2b requires a real effect basis of $\operatorname{Herm}(\mathbb C^8)$ on its finite route, no certificate on that route can use fewer than 64 basis effects.

*Proof.* The diagonal effects give the diagonal matrix units. Subtracting $(P_j+P_k)/2$ from $Q_{jk}$ and $R_{jk}$ gives the real and imaginary Hermitian off-diagonal matrix units, respectively, proving spanning and linear independence. Equation (8.8b.2) follows by taking traces. The real dimension of $\operatorname{Herm}(\mathbb C^8)$ is $8^2=64$, so a real basis on Definition 8.2b's finite route has at least 64 members. ∎

Thus (8.8b.1)--(8.8b.2) populate the mathematical rank, dual reconstruction, positivity, trace, and retained-effect expansion slots of Definition 8.2b. Physical preparation, implementation, and calibration of all 64 effects remain separate realization records.

**Theorem 8.8c (Repeated-Trial Frequency Hierarchy).** Let $K_n\in\{0,1\}$ have one-trial probability $P(K_n=1)=p$.

1. If the trials are i.i.d., then for every $\epsilon>0$,
   $$
   P\!\left(\left|\frac1N\sum_{n=1}^NK_n-p\right|\ge\epsilon\right)
   \le2e^{-2N\epsilon^2}.
   \tag{8.8c.1}
   $$
2. If the process is stationary and ergodic, the empirical frequency converges almost surely to $p$.
3. Exchangeability and the one-trial marginal alone do not force convergence to $p$: if $Z\sim\operatorname{Bernoulli}(p)$ and $K_n=Z$ for all $n$, the process is exchangeable and every one-trial marginal equals $p$, while the empirical frequency converges to $Z\in\{0,1\}$.

*Proof.* The first statement is Hoeffding's finite Bernoulli bound (Hoeffding 1963), and the second is Birkhoff's ergodic theorem (Birkhoff 1931) applied to the coordinate observable. The displayed common-$Z$ construction proves the third statement directly. ∎

Principle 8.0c supplies a single registered outcome law. A quantitative frequency claim therefore requires the i.i.d. certificate of (8.8c.1), a stationary-ergodic certificate, or an exchangeable mixing record concentrated at the Born parameter.

**Theorem 8.8d (One Finite Choi Test Is a Complete Spectator Witness).** Let $\Phi:M_8(\mathbb C)\to M_d(\mathbb C)$ be the complex-linear extension of a preparation-equivalent normalized update, and let $|\Omega_8\rangle=\sum_{j=1}^8e_j\otimes e_j$. Then
$$
J(\Phi)
=(\Phi\otimes\operatorname{id}_8)
(|\Omega_8\rangle\!\langle\Omega_8|)\succeq0
\tag{8.8d.1}
$$
if and only if $\Phi$ is completely positive. Together with
$$
\operatorname{tr}_{\mathrm{out}}J(\Phi)=I_8,
\tag{8.8d.2}
$$
this single finite matrix test is equivalent to CPTP dynamics.

*Proof.* Positivity under every spectator implies (8.8d.1). Conversely, a spectral decomposition of the positive Choi matrix yields Kraus operators, and their Kraus form is positive after tensoring with every finite identity. Equation (8.8d.2) is equivalent to trace preservation. ∎

Preparation equivalence supplies the linear extension on which this test is complete. Preparation-sensitive nonlinear alternatives remain a separate classification class.

**Theorem 8.8d.1 (Finite Preparation Descent and $k$-Positivity Normal Form).** Let $\rho_1,\ldots,\rho_N\in\mathcal D(\mathbb C^d)$ be a finite preparation ledger and let $\sigma_1,\ldots,\sigma_N\in\mathcal D(\mathbb C^{d'})$ be its proposed outputs. Define linear maps
$$
L:\mathbb R^N\to\operatorname{Herm}(\mathbb C^d),
\quad Le_i=\rho_i,
\qquad
G:\mathbb R^N\to\operatorname{Herm}(\mathbb C^{d'}),
\quad Ge_i=\sigma_i.
$$
The output rule descends to a well-defined affine map on $\operatorname{conv}\{\rho_i\}$ exactly when
$$
\ker L\cap\left\{z:\sum_i z_i=0\right\}
\subseteq\ker G.
\tag{8.8d.1.1}
$$
Failure of (8.8d.1.1) supplies two probability vectors $p,q$ with $Lp=Lq$ and $Gp\ne Gq$, which is a finite preparation-contextuality witness. When the input ledger affinely spans the full state space and (8.8d.1.1) holds, group completion gives the unique complex-linear extension $\Phi:M_d(\mathbb C)\to M_{d'}(\mathbb C)$. For $1\le k\le d$, this extension is $k$-positive exactly when its Choi matrix is $k$-block-positive:
$$
\langle v,J(\Phi)v\rangle\ge0
\quad\text{for every }v\text{ of Schmidt rank at most }k.
\tag{8.8d.1.2}
$$
In particular, $d$-positivity, complete positivity, and $J(\Phi)\succeq0$ are equivalent, while trace preservation is equivalent to $\operatorname{tr}_{\mathrm{out}}J(\Phi)=I_d$.

*Proof.* Two preparation mixtures represent the same input exactly when $Lp=Lq$. Their difference belongs to the subspace in (8.8d.1.1), so the inclusion is sufficient for equal outputs. Conversely, if a nonzero $z$ violates the inclusion, then $\sum_i z_i=0$. For the uniform interior point $u=(1/N,\ldots,1/N)$ and sufficiently small $t>0$, both $p=u+tz$ and $q=u$ are probability vectors. They satisfy $Lp=Lq$ and $Gp\ne Gq$, proving necessity and the finite witness claim. Affine spanning and the same positive-cone group-completion argument as Theorem 8.3b give the unique extension.

For the positivity statement, vectorization identifies a Schmidt-rank-at-most-$k$ vector with a matrix having rank at most $k$. Testing $\Phi\otimes\operatorname{id}_k$ on rank-one positive inputs and using the Schmidt decomposition gives exactly (8.8d.1.2); spectral decomposition then extends the test to every positive input. At $k=d$, every vector has Schmidt rank at most $d$, so block positivity is ordinary positivity of $J(\Phi)$, and Theorem 8.8d gives complete positivity. The partial-trace identity is Equation (8.8d.2). ∎

**Theorem 8.8e (Measurable Transition-Isometry Semigroups Lift to Unitary Groups).** Let $2\le d<\infty$ and let $\{\mathcal T_t\}_{t\ge0}$ be a semigroup of maps on the rays of $\mathbb C^d$ with $\mathcal T_0=\mathrm{id}$. Assume every $\mathcal T_t$ preserves all transition probabilities and $t\mapsto\mathcal T_t([\psi])$ is Borel measurable for every ray. Then every $\mathcal T_t$ is onto, the semigroup extends uniquely to a measurable group on $\mathbb R$, and it has a strongly continuous unitary lift
$$
U(t)=e^{-iHt/\hbar}.
\tag{8.8e.1}
$$

*Proof.* Transition-probability preservation makes each $\mathcal T_t$ an isometry of compact projective space. An isometric self-embedding of a compact metric space is onto: otherwise, if $x$ has positive distance from the image, the iterates of $x$ form an infinite uniformly separated set, contradicting compactness. Define $\mathcal T_{-t}=\mathcal T_t^{-1}$. The semigroup law gives a measurable one-parameter group of projective isometries. Wigner's theorem in Bargmann's formulation [Bargmann 1964] supplies unitary or antiunitary implementers. Divisibility gives zero antiunitary parity because the parity at $t$ is twice the parity at $t/2$. A measurable homomorphism into the finite-dimensional projective unitary group is continuous; Bargmann's lifting theorem chooses phases giving a strongly continuous unitary group. Stone's theorem (Stone 1932) gives (8.8e.1). ∎

This resolves the finite-dimensional measurable-semigroup lift. Identifying the group parameter with a physical clock and $H$ with calibrated energy still requires Theorem 7.6c and Theorem 29.

**Theorem 8.8f (Dimension-Uniform Finite-Matrix CCR Obstruction).** For every pair of $d\times d$ matrices $X_d,P_d$ and every $\hbar>0$,
$$
A_d:=[X_d,P_d]-i\hbar I_d
$$
satisfies
$$
\|A_d\|_{\mathrm{op}}\ge\hbar,
\qquad
\frac{\|A_d\|_{\mathrm{HS}}}{\sqrt d}\ge\hbar.
\tag{8.8f.1}
$$

*Proof.* Cyclicity gives $\operatorname{tr}[X_d,P_d]=0$, hence $\operatorname{tr}A_d=-i\hbar d$. The inequalities
$$
|\operatorname{tr}A_d|\le d\|A_d\|_{\mathrm{op}},
\qquad
|\operatorname{tr}A_d|\le\sqrt d\|A_d\|_{\mathrm{HS}}
$$
give (8.8f.1). ∎

Therefore no inductive sequence of finite carriers can converge to $[X,P]=i\hbar I$ in operator norm or normalized Hilbert--Schmidt norm through bounded finite-matrix commutators. The theorem does not obstruct a separately constructed strong-limit Weyl representation with unbounded generators and controlled domains.

**Theorem 8.8f.1 (Strongly Continuous Weyl Successor on the Schrödinger Carrier).** On $\mathcal H_\infty=L^2(\mathbb R)$ define
$$
(U(a)\psi)(x)=\psi(x-a),
\qquad
(V(b)\psi)(x)=e^{ibx/\hbar}\psi(x)
\qquad(a,b\in\mathbb R).
\tag{8.8f.1.1}
$$
Then $U$ and $V$ are strongly continuous unitary groups and satisfy the exact Weyl relation
$$
U(a)V(b)=e^{-iab/\hbar}V(b)U(a).
\tag{8.8f.1.2}
$$
Their self-adjoint generators are the closures of
$$
P=-i\hbar\frac{d}{dx},
\qquad
X\psi=x\psi,
$$
and the Schwartz space $\mathcal S(\mathbb R)$ is a common invariant core on which
$$
[X,P]\psi=i\hbar\psi.
\tag{8.8f.1.3}
$$
The strong response convergence is quantitative: for $\psi\in D(P)$ and $\phi\in D(X)$,
$$
\|(U(a)-I)\psi\|\le\frac{|a|}{\hbar}\|P\psi\|,
\qquad
\|(V(b)-I)\phi\|\le\frac{|b|}{\hbar}\|X\phi\|.
\tag{8.8f.1.4}
$$

*Proof.* Translation invariance of Lebesgue measure and unit modulus of the multiplier prove unitarity. Direct substitution gives
$$
(U(a)V(b)\psi)(x)
=e^{ib(x-a)/\hbar}\psi(x-a)
=e^{-iab/\hbar}(V(b)U(a)\psi)(x),
$$
which is (8.8f.1.2). Dominated convergence first on $C_c^\infty(\mathbb R)$ and then density prove strong continuity. Stone's theorem gives the generators, and differentiation on $\mathcal S(\mathbb R)$ gives (8.8f.1.3). Finally, the spectral theorem and $|e^{it}-1|\le|t|$ give both inequalities in (8.8f.1.4). ∎

This construction supplies an exact infinite-dimensional canonical pair and its domain and within-carrier strong-continuity controls. A strong-limit claim from finite PU carriers requires a separate directed carrier family, finite-to-infinite intertwiner, and quantitative response-convergence certificate. Admission of $\mathcal H_\infty$ as an effective PU response carrier additionally requires a certificate identifying the group parameters with physical translations and calibrated response observables.

**Theorem 8.8g (Complete Finite Jordan-Carrier Classification under Predictive Correspondence).** Let the retained finite ordered carrier be homogeneous and self-dual, and accept the Koecher--Vinberg reconstruction used in Theorem G.1.8. Suppose its Euclidean Jordan algebra $A$ has a predictive dynamical correspondence in the sense of Definition G.1.8b and that every simple ideal carries the induced blockwise correspondence of Corollary G.1.8e. Then
$$
A\cong H_n(\mathbb C)
$$
for one $n\ge1$. This conclusion excludes real, quaternionic and spin-factor carriers not Jordan-isomorphic to an allowed $H_n(\mathbb C)$, as well as exceptional and nontrivially reducible Euclidean-Jordan carriers, on the stated correspondence branch. Low-dimensional coincidences such as $H_1(\mathbb R)\cong H_1(\mathbb C)$ and $V_3\cong H_2(\mathbb C)$ are retained as the corresponding complex isomorphism classes. If the carrier also has one sharp context of eight outcomes, a faithful eight-dimensional complex representative, and no response-active surplus direction, then $n=8$ and the retained carrier is $H_8(\mathbb C)$.

*Proof.* Koecher--Vinberg identifies the cone with the cone of squares of a finite-dimensional Euclidean Jordan algebra. Theorem G.1.8d classifies every simple ideal admitting the correspondence as complex Hermitian. Corollary G.1.8e then forces a single ideal, which proves the first statement and exhausts the finite simple and reducible families. A sharp context in $H_n(\mathbb C)$ has at most $n$ mutually orthogonal primitive outcomes, so eight outcomes give $n\ge8$. The admitted faithful eight-dimensional representative gives $n\le8$; hence $n=8$. ∎

Construction G.1.8f and Theorem G.1.8g supply a nonempty common complex witness with finite separating effects, positive filters, locally tomographic composites and exact $U(1)$ phase kernel. The mathematical carrier census is therefore complete on the predictive-correspondence branch. Populating the PU-to-correspondence, local-composite, phase and response records in $\mathfrak C_{\mathrm{car}}$ and realizing them physically remain the `C+R` components.

**Theorem 8.8h (Exact Binary-Instrument Realization of the Born Frame).** Let $\mathcal F_{64}$ be the 64 projections in (8.8b.1). For every $E\in\mathcal F_{64}$, register the binary instrument
$$
\mathcal I_{E,1}(X)=EXE,
\qquad
\mathcal I_{E,0}(X)=(I-E)X(I-E).
\tag{8.8h.1}
$$
Its retained response is
$$
b_E(\rho)=\operatorname{tr}\mathcal I_{E,1}(\rho)=\operatorname{tr}(\rho E).
\tag{8.8h.2}
$$
The finite response vector $b(\rho)=(b_E(\rho))_{E\in\mathcal F_{64}}$, followed by the reconstruction map (8.8b.2), is injective on density operators. Each instrument has an exact carrier calibration: choose a unitary $U_E$ with $U_Ee_1$ equal to the unit vector spanning $E$, apply $U_E^*$, measure the computational pair $(P_1,I-P_1)$, and conjugate the postmeasurement branch back by $U_E$. The resulting outcome-one effect is $U_EP_1U_E^*=E$, and the two branch maps are exactly (8.8h.1).

*Proof.* Every member of $\mathcal F_{64}$ is a rank-one orthogonal projection. The two maps in (8.8h.1) are completely positive, and their sum is trace preserving because $E+(I-E)=I$ and the two projectors are orthogonal. Cyclicity gives (8.8h.2). Theorem 8.8b proves that the 64 effects form a real basis and that (8.8b.2) reconstructs the unique Hermitian matrix from these responses; hence $b$ is injective. A unitary taking $e_1$ to the range of $E$ exists in finite dimension, and conjugation proves the calibration identity. The carrier, the 64 binary settings, the two outcomes per setting, and every calibration matrix are finite records with exact matrix verifiers. ∎

**Resolution TV-QM-02-R2 (Metadata).** Exact domain: the finite $H_8(\mathbb C)$ carrier and the 64 separately selectable binary protocols (8.8h.1). Premises: the rank-one frame $\mathcal F_{64}$ and reconstruction theorem 8.8b on the accepted finite complex-carrier branch. Equivalence: unitary relabeling preserving the complete response vector. Budget: 64 settings and 128 CP branches. Verifier: positivity, trace-preserving branch sums, the calibration identities, rank 64 and reconstruction (8.8b.2). Falsifier: failure of any CP sum, calibration identity, response injectivity or retained-effect coverage entry. Provenance class: source-internal finite instrument realization. Downstream consumers: Definition 8.2b, Theorem 8.8b and `TV-QM-02`. Theorem 8.8h populates every effect, retention, response-coverage and formal carrier-calibration field and gives `positive-discharge` of `TV-QM-02`.

**Theorem 8.8i (Full-Effect Born Descent, SPAP/PCE Boundary, and Product-Trial Response Quotient).** Let $d\ge2$, let $\mathcal H=\mathbb C^d$, let $\mathsf S$ be a nonempty convex set of registered preparation labels, and let $\mathsf C_d$ contain every finite-outcome POVM $C=(E_i)_{i\in K_C}$ on $\mathcal H$. In particular, $\mathsf C_d$ contains $(I)$, every binary context $(E,I-E)$, and every ternary context $(E,F,I-E-F)$ with $E,F\ge0$ and $E+F\le I$. Assume a one-run table
$$
q_s^C:K_C\longrightarrow[0,1]
\qquad(s\in\mathsf S,\ C\in\mathsf C_d)
\tag{8.8i.1}
$$
has been registered. An independently registered invariant-completion rule on a SPAP-compatible branch, followed when needed by a frozen exact PCE comparison, may furnish or select such a table. Register these additional operational descent conditions:

1. **Effect typing and cover.** Outcome $i$ in $C$ carries the effect label $E_i$, with the full binary/ternary cover above admitted.
2. **Same-effect transition consistency.** Any two outcome occurrences carrying the same effect $E$, whether in the same or different contexts, have the same selected weight.
3. **Context normalization.** For every $s,C$, $\sum_iq_s^C(i)=1$; relabeling only relabels occurrences and their effect labels. No additivity or coarse-graining identity is assumed.
4. **Preparation affinity.** For every admitted mixture $u=\lambda s+(1-\lambda)t$,
$$
q_u^C(i)=\lambda q_s^C(i)+(1-\lambda)q_t^C(i)
\qquad(0\le\lambda\le1).
\tag{8.8i.2}
$$

Then the following statements hold.

**(a) Exact Born descent.** For every $s\in\mathsf S$ there is a unique density matrix $\rho_s$ such that
$$
q_s^C(i)=\operatorname{tr}(\rho_sE_i)
\quad\text{for every }C\in\mathsf C_d\text{ and }i\in K_C,
\qquad
\rho_{\lambda s+(1-\lambda)t}
=\lambda\rho_s+(1-\lambda)\rho_t.
\tag{8.8i.3}
$$
Conversely, on the independently registered cover of condition 1, every affine density-matrix assignment induces through (8.8i.3) tables satisfying conditions 2--4. Hence, on that cover, conditions 2--3 are necessary and sufficient for descent to normalized additive effect functionals, and condition 4 is necessary and sufficient for affine preparation descent. Coarse-graining additivity is derived rather than assumed.

**(b) SPAP/PCE does not entail same-effect transition consistency or Born form.** On a qubit write $E=aI+\mathbf b\cdot\boldsymbol\sigma$ and set
$$
h(E):=a+4b_z^3.
\tag{8.8i.4}
$$
Effect positivity gives $|b_z|\le\min\{a,1-a\}\le1/2$, so $0\le h(E)\le1$ and $h(I-E)=1-h(E)$. Define two rules on the full finite-POVM cover by
$$
Q_*^C(i):=
\begin{cases}
h(E_i),&|K_C|=2,\\[1mm]
\tfrac12\operatorname{tr}(E_i),&|K_C|\ne2,
\end{cases}
\qquad
Q_0^C(i):=\tfrac12\operatorname{tr}(E_i).
\tag{8.8i.5}
$$
Every context is normalized. Put $P_z=(I+\sigma_z)/2$ and $A=P_z/2$. The occurrence of $A$ in $(A,I-A)$ has weight
$$
Q_*^{(A,I-A)}(A)=h(A)=\frac5{16},
\tag{8.8i.6}
$$
whereas either occurrence of $A$ in $(A,A,I-P_z)$ has weight
$$
Q_*^{(A,A,I-P_z)}(A)=\frac12\operatorname{tr}(A)=\frac14.
\tag{8.8i.7}
$$
Thus $Q_*$ has the full context cover and local normalization but fails condition 2. It also cannot have Born form: $Q_*^{(P_z,I-P_z)}(P_z)=1$ would force $\rho=P_z$, while for $\mathbf n=(\sqrt3/2,0,1/2)$,
$$
Q_*^{(P_{\mathbf n},I-P_{\mathbf n})}(P_{\mathbf n})
=\frac9{16}
\ne\frac34=\operatorname{tr}(P_zP_{\mathbf n}).
\tag{8.8i.8}
$$

For every context $C$ and either rule $Q\in\{Q_*,Q_0\}$, take
$$
\mathcal X_{C,Q}=K_C\times\mathbb Z_2,
\qquad
\tau_{C,Q}(i,b)=(i,b\oplus1),
\qquad
\mu_{C,Q}(i,b)=\frac{Q^C(i)}2.
\tag{8.8i.9}
$$
The map $\tau_{C,Q}$ is fixed-point-free and $\mu_{C,Q}$ is invariant; reading only $i$ gives the one-run law $Q^C$. Theorem 11d therefore realizes every displayed context law as a normalized finite invariant-completion response. For each fixed $Q\in\{Q_*,Q_0\}$, add this response sort conservatively to any admitted diagonal SPAP class, with computable embedding $\iota_Q(m)=(m,Q)$ and unchanged original-sort queries and responses. Any universal predictor on the expansion, restricted to inputs $\iota_Q(m)$ and original-sort queries, would be a universal predictor on the original class, so the original SPAP obstruction is preserved.

Let $\mathcal X=\{x_*,x_0\}$ be the entire frozen formal PCE census, with retained rules $Q_*,Q_0$. Register its complete one-coordinate source ledgers
$$
c(x_*)=0,
\qquad
c(x_0)=1,
\qquad
V=c,
\tag{8.8i.10}
$$
and no other source entries. Equality of the complete response rule and ledger defines the quotient. The two classes are decidably distinct, and Theorem 22b selects $[x_*]$ uniquely with gap one. This is a formal SPAP-compatible/PCE countermodel to the implication from those structures to condition 2 or Born form. It establishes `nonentailment`; Born physics and the physical origin of a PCE ledger remain separately assessed.

**(c) Formal preparation-channel and instrument construction.** Let $X\subset\mathsf S$ be a nonempty finite registered preparation family and let $\{|x\rangle:x\in X\}$ be a classical input register. Define
$$
\mathcal P_X(\tau)
:=\sum_{x\in X}\langle x|\tau|x\rangle\rho_x,
\qquad
\mathcal I_i^C(Y):=E_i^{1/2}YE_i^{1/2},
\qquad
\Gamma_C(Y):=\sum_{i\in K_C}|i\rangle\!\langle i|\otimes\mathcal I_i^C(Y).
\tag{8.8i.11}
$$
Both $\mathcal P_X$ and $\Gamma_C$ are CPTP; every $\mathcal I_i^C$ is CP and $\sum_i\mathcal I_i^C$ is TP. Moreover
$$
(\mathcal I_i^C)^*(I)=E_i,
\qquad
\operatorname{tr}\!\left[\mathcal I_i^C\!\left(\mathcal P_X(|x\rangle\!\langle x|)\right)\right]
=\operatorname{tr}(\rho_xE_i)=q_x^C(i).
\tag{8.8i.12}
$$
Thus $\rho_x$ is the output state of an explicit formal preparation channel, $E_i$ is the effect of an explicit outcome instrument, and their response equals the selected table. In a projective context $E_i=P_i$. PU-carrier population and admission of the required replacement states, square-root operations, and classical registers remain owned by `TV-QM-01` and `TV-QM-05`.

**(d) A populated exact product-trial branch and its frequency law.** Specialize to the accepted formal carrier $\mathcal H_*\cong\mathbb C^8$, let
$$
\rho_*:=\frac{I_8}{8},
\qquad
P_1:=|e_1\rangle\!\langle e_1|\in\mathcal F_{64},
\qquad
C_*:=(P_1,I-P_1),
\tag{8.8i.13}
$$
and define
$$
\mathcal P_*(T):=\operatorname{tr}(T)\rho_*,
\qquad
\mathcal M_*(Y)
:=\operatorname{tr}(P_1Y)|1\rangle\!\langle1|
+\operatorname{tr}((I-P_1)Y)|0\rangle\!\langle0|.
\tag{8.8i.14}
$$
These maps are CPTP. The first is a constant preparation; the second is the classical record obtained from Theorem 8.8h's binary instrument after discarding the quantum output. Its exact one-run law is
$$
p_*=(p_*(1),p_*(0))=\left(\frac18,\frac78\right).
\tag{8.8i.15}
$$
For every $N\ge1$, register fresh tensor factors and the formal product map $(\mathcal M_*\circ\mathcal P_*)^{\otimes N}$. The retained algebra is only the classical binary record algebra; postmeasurement quantum outputs and interventions are outside this fixed protocol. Its response is
$$
\Pr(K_1=k_1,\ldots,K_N=k_N)=\prod_{n=1}^Np_*(k_n).
\tag{8.8i.16}
$$
The family $\{p_*^{\otimes N}\}_{N\ge1}$ is projectively consistent and defines the product path law $p_*^{\otimes\mathbb N}$ on $\{0,1\}^{\mathbb N}$. Under Principle 8.0c's one-label retained-record semantics, each path has exactly one classical label in every coordinate; this is the registered operational record statement. With $\widehat p_N(k)=N^{-1}\sum_{n=1}^N\mathbf1_{\{K_n=k\}}$, for every $\varepsilon>0$,
$$
\Pr\!\left(\max_{k\in\{0,1\}}|\widehat p_N(k)-p_*(k)|\ge\varepsilon\right)
\le4e^{-2N\varepsilon^2},
\qquad
\widehat p_N(k)\longrightarrow p_*(k)\quad\text{a.s.}
\tag{8.8i.17}
$$
The finite bound is Hoeffding plus a union bound, and the limit is the strong law on the displayed product path space. Fresh tensor factors define this formal i.i.d. branch. Apparatus reuse, reset, environmental memory, and experimental sampling belong to their separate realization and empirical records.

**(e) Exhaustive response-equivalent presentation quotient for the fixed branch.** Let $K=\{0,1\}$ and let a process presentation be a standard-Borel probability space $(\Lambda,\Sigma,\mu)$ together with a measurable readout
$$
r_\infty:\Lambda\longrightarrow K^{\mathbb N}.
\tag{8.8i.18}
$$
Only the fixed protocol's classical cylinder events are retained responses. Declare
$$
(\Lambda,\Sigma,\mu,r_\infty)\sim
(\Lambda',\Sigma',\mu',r'_\infty)
\quad\Longleftrightarrow\quad
(r_\infty)_*\mu=(r'_\infty)_*\mu'.
\tag{8.8i.19}
$$
Equality in (8.8i.19) is equivalent to equality on every finite-prefix cylinder. The map
$$
[\Lambda,\Sigma,\mu,r_\infty]_{\sim}
\longmapsto(r_\infty)_*\mu
\tag{8.8i.20}
$$
is a bijection from response-equivalence classes to probability laws on $K^{\mathbb N}$: with $\mathcal B$ the product Borel $\sigma$-algebra, surjectivity is witnessed by $(K^{\mathbb N},\mathcal B,\nu,\operatorname{id})$, and injectivity is (8.8i.19). The branch (8.8i.16) has the canonical representative $(K^{\mathbb N},\mathcal B,p_*^{\otimes\mathbb N},\operatorname{id})$. A hidden seed, deterministic refinement, or alternative presentation with the same path law is the same retained-response class. Any admitted postmeasurement, adaptive, timing, or seed intervention enlarges the response table and is classified under that larger protocol rather than (8.8i.19). This gives the complete outcome-presentation quotient for the registered product protocol and makes no intrinsic-ontology selection.

*Proof.* Condition 2 lets the binary occurrence of an effect define one function $f_s(E)$. Comparing the normalized contexts $(0,F,I-F)$ and $(F,I-F)$ gives $f_s(0)=0$; normalizing $(I)$ gives $f_s(I)=1$. Comparing $(E,F,I-E-F)$ with $(E+F,I-E-F)$ and identifying the common complementary effect gives $f_s(E+F)=f_s(E)+f_s(F)$ whenever $E+F\le I$. The response range gives positivity. Theorem G.1.11e supplies the unique $\rho_s$ in (8.8i.3). Condition 4 and separation by all effects give affine preparation descent. Trace laws give the converse on the fixed cover.

The effect bound, direct evaluations, invariant two-cycles, conservative SPAP expansion, and exhaustive two-class PCE census prove part (b). Equation (8.8i.11) is measure-and-prepare followed by square-root Kraus branches, proving (8.8i.12). Direct trace evaluation proves (8.8i.15); tensor multiplication proves (8.8i.16), and the standard finite-alphabet product law gives (8.8i.17). Finally, cylinder probabilities determine a law on $K^{\mathbb N}$, and the canonical presentation proves both directions of (8.8i.20). ∎

**Theorem 8.8j (Binary-First Instrument Factorization and Causal Same-Effect Descent).** Let $\mathcal H$ and $\mathcal K$ be finite-dimensional complex Hilbert spaces and let $\Phi=(\Phi_k)_{k\in K}$ be a finite instrument
$$
\Phi_k(X)=\sum_\alpha A_{k\alpha}XA_{k\alpha}^\dagger,
\qquad
\sum_{k,\alpha}A_{k\alpha}^\dagger A_{k\alpha}=I_{\mathcal H}.
\tag{8.8j.1}
$$
For a pointed outcome $i\in K$, put
$$
E:=\Phi_i^*(I_{\mathcal K})
=\sum_\alpha A_{i\alpha}^\dagger A_{i\alpha},
\qquad
D:=I_{\mathcal H}-E,
\tag{8.8j.2}
$$
and let $P_E$ and $P_D$ be the support projections of $E$ and $D$. Write $E^{\ominus1/2}$ and $D^{\ominus1/2}$ for the Moore--Penrose inverse square roots, zero on the corresponding kernels. Define the support-canonical binary prefix
$$
\mathcal B_E^1(X):=E^{1/2}XE^{1/2},
\qquad
\mathcal B_E^0(X):=D^{1/2}XD^{1/2},
\tag{8.8j.3}
$$
and the continuation Kraus operators
$$
C_{i\alpha}:=A_{i\alpha}E^{\ominus1/2},
\qquad
C_{k\alpha}:=A_{k\alpha}D^{\ominus1/2}\quad(k\ne i).
\tag{8.8j.4}
$$
Then
$$
\sum_\alpha C_{i\alpha}^\dagger C_{i\alpha}=P_E,
\qquad
\sum_{k\ne i,\alpha}C_{k\alpha}^\dagger C_{k\alpha}=P_D,
\tag{8.8j.5}
$$
and the CP continuations
$$
\Lambda_i(Y):=\sum_\alpha C_{i\alpha}YC_{i\alpha}^\dagger,
\qquad
\Lambda_k(Y):=\sum_\alpha C_{k\alpha}YC_{k\alpha}^\dagger
\quad(k\ne i)
\tag{8.8j.6}
$$
satisfy the outcome-wise identities
$$
\Phi_i=\Lambda_i\circ\mathcal B_E^1,
\qquad
\Phi_k=\Lambda_k\circ\mathcal B_E^0\quad(k\ne i).
\tag{8.8j.7}
$$
The first continuation is trace preserving on the reachable corner $P_E\mathcal H$, and the other continuations form a normalized instrument on $P_D\mathcal H$. Arbitrary trace-preserving fillers on the orthogonal kernels extend them to the whole input algebra and vanish after (8.8j.3). Thus every pointed finite instrument has an exact binary-first tree whose first operation depends only on its effect $E$ and whose flattened labeled leaves are the original instrument. The same statement covers repeated equal effects by factoring the same leaf-labeled instrument separately at each pointed occurrence. The cases $E=0$ and $E=I$ use the corresponding zero-support corner, with a null branch omitted or retained as a zero leaf. Equations (8.8j.2)--(8.8j.7) use finite operator order and exact CP composition; response laws enter through the conditions below.

Now let $W_s(T)$ be the normalized retained-record law assigned to every admitted finite instrument tree $T$ for preparation label $s$, and write $q_s^\Phi(k)$ for the terminal-label probability of outcome $k$ in instrument $\Phi$. Assume the following operational process conditions on a registered class $\mathfrak T$ containing the factorizations above.

1. **Leafwise exact-process extensionality.** If flattening a labeled tree gives the same outcome-wise CP maps as a registered instrument, including after every finite spectator identity extension and with the declared side ledgers held fixed, its terminal-label law equals the instrument law. Equality here is equality of the labeled CP/Choi maps, fixed before evaluating $W_s$.
2. **Classical history pushforward.** Forgetting later records pushes the joint retained-history law to the earlier-record marginal. In the $i$-pointed factorization, the event carrying terminal label $i$ is exactly the cylinder in which the prefix flag equals one.
3. **Retained-prefix causality.** For the same registered prefix $\mathcal B_E=(\mathcal B_E^1,\mathcal B_E^0)$, the marginal law of its write-once flag is invariant under an exogenous choice among normalized conditional continuations made outside the flag's causal past.

For any registered instruments $\Phi,\Psi$, outcomes $i,j$, and preparation $s$ satisfying
$$
\Phi_i^*(I)=E=\Psi_j^*(I),
\tag{8.8j.8}
$$
conditions 1--3 imply
$$
q_s^\Phi(i)
=W_s(\mathcal B_E\text{ flag}=1)
=q_s^\Psi(j).
\tag{8.8j.9}
$$
Hence same-effect transition consistency follows on every covered finite CP-process branch. If the covered effects contain the normalized full POVM cover and the preparation law is affine, Theorem 8.8i applies and yields the unique density assignment and Born table (8.8i.3).

The $Q_*$ boundary is sharp at the process gate. For every $Q_*$ context $C=(E_k)$, the square-root instrument $\Phi_k^C(X)=E_k^{1/2}XE_k^{1/2}$ is a normalized CP instrument and therefore has the algebraic factorization (8.8j.2)--(8.8j.7). If the $Q_*$ terminal tables extended to response laws satisfying conditions 1--3, equation (8.8j.9) would give the same weight to the two occurrences of $A=P_z/2$ in (8.8i.6)--(8.8i.7), contradicting $5/16\ne1/4$. Thus the CP algebra and its universal factorization, even with the SPAP/PCE construction of Theorem 8.8i, do not supply leafwise response extensionality, history pushforward and retained-prefix causality.

*Proof.* If $v\in\ker E$, then
$$
0=\langle v,Ev\rangle=\sum_\alpha\|A_{i\alpha}v\|^2,
$$
so $A_{i\alpha}=A_{i\alpha}P_E$ for every $\alpha$. Similarly, $D=\sum_{k\ne i,\alpha}A_{k\alpha}^\dagger A_{k\alpha}$ gives $A_{k\alpha}=A_{k\alpha}P_D$ for $k\ne i$. The Moore--Penrose support identities now give
$$
\sum_\alpha C_{i\alpha}^\dagger C_{i\alpha}
=E^{\ominus1/2}EE^{\ominus1/2}=P_E,
\qquad
\sum_{k\ne i,\alpha}C_{k\alpha}^\dagger C_{k\alpha}
=D^{\ominus1/2}DD^{\ominus1/2}=P_D,
$$
and
$$
C_{i\alpha}E^{1/2}=A_{i\alpha}P_E=A_{i\alpha},
\qquad
C_{k\alpha}D^{1/2}=A_{k\alpha}P_D=A_{k\alpha}.
$$
These are (8.8j.5)--(8.8j.7). Each prefix output lies in its support corner, so every kernel filler vanishes in the composite.

Factor $\Phi$ at $i$. Condition 1 identifies its terminal-label law with the exact tree's leaf law. Condition 2 identifies the probability of leaf $i$ with the marginal probability of the prefix-one cylinder. Factor $\Psi$ at $j$. Its first registered operation is the same $\mathcal B_E$, and condition 3 makes that earlier marginal independent of the later continuation. This proves (8.8j.9), including distinct equal-effect occurrences inside one instrument. The final statement follows from Theorem 8.8i. ∎

**Resolution TV-QM-08-R1 (Metadata).** Exact domain: all finite-dimensional complex CP instruments, all pointed outcome occurrences, every finite spectator extension, and every registered response tree satisfying conditions 1--3. Premises: the accepted finite complex CP-process branch, normalized terminal response tables, outcome-labeled CP-map equality, leafwise flattening congruence, projectively consistent classical history pushforward, a write-once prefix flag, and interventional no-future-signalling for exogenous later continuations. Equivalence relation: equality of every flattened outcome-labeled CP/Choi map and declared side ledger; the prefix is forgotten only after its retained-history marginal has been checked. Budget: every outcome, Kraus operator, support corner, kernel completion, finite spectator, labeled leaf, history-forgetting map and admitted later continuation. Verifier: (8.8j.2)--(8.8j.7), conditional trace preservation on both corners, equality of every flattened leaf, terminal-law extensionality, flag-to-leaf pushforward and prefix-marginal invariance. Falsifier: a finite instrument without the displayed factorization; a leafwise CP mismatch; Choi-equal flattened instruments with unequal terminal laws; a prefix marginal unequal to its leaf pushforward; dependence of the earlier flag on the exogenous later setting; a CP/Choi calibration defined through the Born table under derivation; or a response-active timing, energy, intervention or side-channel variable omitted from a claimed equivalence class. Provenance class: source-internal finite operator factorization and conditional process theorem. Downstream consumers: Theorems 8.8i, G.1.11e and 8.0d, the Born-rule ledger and `TV-QM-08`. Nonvacuity: every finite instrument supplies the algebraic factorization, and Theorem 8.8i's $Q_*$ table supplies `nonentailment` from SPAP/PCE, full-cover typing and context normalization prior to the process conditions. Result: `positive-discharge` of universal finite CP-instrument binary-first factorization and of the conditional causal implication to same-effect transition consistency. Complete PU-process coverage, response-extensionality certification, retained-prefix realization and causal side-ledger closure remain the `C+R` components of `TV-QM-08`.

**Theorem 8.8k (Born-Table-Independent Retained-Flag Choi Descent and Exact Positive-Map Boundary).** Let
$$
\mathcal D_d:=\{\rho\in M_d(\mathbb C)^+:\operatorname{tr}\rho=1\},
\qquad d,d'\ge1,
\tag{8.8k.1}
$$
and let $A$ be a nonempty finite outcome-occurrence alphabet. A registered procedure assigns to each $a\in A$ an unnormalized branch-state rule
$$
t_a:\mathcal D_d\longrightarrow M_{d'}(\mathbb C)^+.
$$
Assume the following operational gates.

1. **Independent ordered-carrier calibration.** The input, output and $d$-dimensional reference carriers are fixed, before the procedure's outcome table is evaluated, by order-and-normalization-preserving identifications with $M_d(\mathbb C)^{\mathrm{sa}}$, $M_{d'}(\mathbb C)^{\mathrm{sa}}$ and $M_d(\mathbb C)^{\mathrm{sa}}$. Their positive cones are the positive-semidefinite cones and their normalization functional is the matrix trace. The registered input--reference and output--reference composites are locally tomographic with the standard positive-semidefinite orders on $M_d(\mathbb C)\otimes M_d(\mathbb C)$ and $M_{d'}(\mathbb C)\otimes M_d(\mathbb C)$, respectively, and the former contains the independently prepared state
   $$
   \omega_d:=\frac1d|\Omega_d\rangle\!\langle\Omega_d|,
   \qquad
   |\Omega_d\rangle:=\sum_{r=1}^d e_r\otimes e_r.
   \tag{8.8k.2}
   $$
2. **Branch affinity and preparation extensionality.** Every $t_a$ is affine, and two preparation procedures representing the same element of $\mathcal D_d$ have the same branch outputs.
3. **Retained classical normalization.** The label $a$ is stored in a classical direct-sum flag, its branch weight is the independently calibrated order-unit value $\operatorname{tr}t_a(\rho)$, and
   $$
   \sum_{a\in A}\operatorname{tr}t_a(\rho)=1
   \quad(\rho\in\mathcal D_d).
   \tag{8.8k.3}
   $$
   Forgetting or coarse-graining flags is the corresponding sum of branch states. Distinct labels remain distinct blocks even when their effects later coincide.

For $X\in M_d(\mathbb C)^+$ define
$$
\Phi_a(0):=0,
\qquad
\Phi_a(X):=\operatorname{tr}(X)\,
t_a\!\left(\frac{X}{\operatorname{tr}X}\right)
\quad(X\ne0).
\tag{8.8k.4}
$$
Branch affinity makes (8.8k.4) additive and positively homogeneous on the positive cone, hence it has a unique real-linear extension to the Hermitian part and a unique complex-linear extension $\Phi_a:M_d(\mathbb C)\to M_{d'}(\mathbb C)$. Assume one further gate.

4. **Retained-flag Choi-state stability.** Extending the same registered procedure by the identity on the reference at the single preparation $\omega_d$, while retaining the classical flag, gives the locally tomographic output
   $$
   \Xi
   :=\sum_{a\in A}|a\rangle\!\langle a|
   \otimes(\Phi_a\otimes\operatorname{id}_d)(\omega_d)
   \succeq0.
   \tag{8.8k.5}
   $$
   The tensor identification and the equality in (8.8k.5) are calibrated from the ordered carriers and outcome-labeled branch transformations, independently of any Born table under derivation. Local tomography alone supplies neither this equality nor the composite positive cone. The flag is retained through this positivity check; positivity only after summing or hiding the flag is a weaker condition.

Then $(\Phi_a)_{a\in A}$ is a finite CP instrument:
$$
J(\Phi_a)
:=(\Phi_a\otimes\operatorname{id}_d)
(|\Omega_d\rangle\!\langle\Omega_d|)
\succeq0,
\qquad
\sum_{a\in A}\Phi_a^*(I_{d'})=I_d.
\tag{8.8k.6}
$$
Consequently the derived effects $E_a:=\Phi_a^*(I_{d'})$ form a POVM and the registered branch weights have the normalized additive effect form
$$
\operatorname{tr}t_a(\rho)
=\operatorname{tr}(\rho E_a),
\qquad
E_a\succeq0,
\qquad
\sum_{a\in A}E_a=I_d.
\tag{8.8k.7}
$$
Across any covered procedure class sharing the same input-carrier and preparation calibration, equality of two derived effects therefore gives equality of their branch weights for every registered preparation. This conclusion includes duplicate effects as separately retained flags. If $E_a=0$, then $\Phi_a=0$; if $E_a=I_d$, every other branch is zero and $\Phi_a$ is trace preserving. Conversely, the standard retained-flag spectator extension of every finite CP instrument satisfies conditions 2--4 on the independently calibrated matrix carriers. Thus, on this declared carrier/composite branch, branch affinity, classical normalization and the one retained-flag Choi-state gate are necessary and sufficient for the finite CP-instrument representation. A finite affinely spanning preparation ledger may replace the full-state statement in condition 2 when its branch outputs satisfy the branchwise kernel descent criterion (8.8d.1.1) and (8.8k.5) is independently registered for the resulting unique linear extensions.

The retained-flag gate is exact. For $d\ge2$ let
$$
\Theta(X):=X^{\mathsf T},
\qquad
\Delta(X):=\operatorname{tr}(X)\frac{I_d}{d},
\qquad
\Phi_0:=\varepsilon\Theta,
\qquad
\Phi_1:=\Delta-\varepsilon\Theta,
\quad 0<\varepsilon\le\frac1d.
\tag{8.8k.8}
$$
Both branches are positive and trace nonincreasing, their sum $\Delta$ is CPTP, and their retained weights are $\varepsilon$ and $1-\varepsilon$. Indeed, for $X\succeq0$,
$$
\Phi_1(X)
=\frac{\operatorname{tr}X}{d}I_d-\varepsilon X^{\mathsf T}
\succeq0.
$$
Nevertheless, with $F$ the swap on $\mathbb C^d\otimes\mathbb C^d$,
$$
J(\Phi_0)=\varepsilon F
\tag{8.8k.9}
$$
has eigenvalue $-\varepsilon$ on the antisymmetric subspace. The other branch is CP because $J(\Phi_1)=I_{d^2}/d-\varepsilon F\succeq0$, and forgetting the flag gives the positive Choi matrix of $\Delta$; retaining the flag exposes the negative $J(\Phi_0)$ block. At $d=2$ and $\varepsilon=1/2$, the two effects are the duplicate pair $I_2/2,I_2/2$, so even equal-effect weights and a CPTP unflagged channel do not force branch complete positivity. On the admitted local positive-map domain, define terminal laws by the branch traces and later records by fixed conditional classical kernels. Equality of labeled local maps then gives equal terminal laws, retained histories push forward, and a write-once flag is invariant under exogenous later choices. These local analogues of process extensionality, history pushforward and prefix causality leave (8.8k.9) unchanged. The model does not satisfy Theorem 8.8j's finite-spectator CP/Choi-process premise: the negative retained Choi block is its exact failure. Hence affinity, local positivity, classical records, local causal-prefix conditions, local tomography as a kinematic tensor identification, or spectator stability only after the flag is forgotten do not entail CP branches; the accepted CP-process branch of Theorem 8.8j is outside this countermodel's domain.

Affinity is an independent gate. On $\mathcal D_2$ the normalized positive one-outcome rule
$$
n(\rho):=\frac{\rho^2}{\operatorname{tr}(\rho^2)}
\tag{8.8k.10}
$$
has no linear channel extension: for $\rho_0=|0\rangle\!\langle0|$, $\tau=I_2/2$ and $m=(\rho_0+\tau)/2$,
$$
n(m)=\operatorname{diag}\!\left(\frac9{10},\frac1{10}\right)
\ne
\frac{n(\rho_0)+n(\tau)}2
=\operatorname{diag}\!\left(\frac34,\frac14\right).
\tag{8.8k.11}
$$
Finally, a theory admitting only the identity channel or any fixed proper subfamily of CP instruments satisfies the theorem on its admitted class but does not populate all physical preparations, effects or procedures. Theorem 8.8i's $Q_*$ construction supplies the complementary response-link boundary: every context has a formal square-root CP instrument, yet its selected terminal table cannot equal the branch traces of one process family satisfying (8.8k.7), because the two occurrences of $A=P_z/2$ have weights $5/16$ and $1/4$. Full physical coverage and the process-to-response link therefore remain independent realization obligations.

*Proof.* For $X,Y\succeq0$, branch affinity applied with weights $\operatorname{tr}X/(\operatorname{tr}X+\operatorname{tr}Y)$ and $\operatorname{tr}Y/(\operatorname{tr}X+\operatorname{tr}Y)$ gives $\Phi_a(X+Y)=\Phi_a(X)+\Phi_a(Y)$; positive homogeneity is immediate from (8.8k.4). If $X-Y=X'-Y'$ with all four operators positive, then $X+Y'=X'+Y$, so additivity makes the Hermitian extension independent of the chosen difference. Complexification is therefore unique, and positivity of $t_a$ makes $\Phi_a$ positive. Equation (8.8k.3) extends by homogeneity to
$$
\sum_a\operatorname{tr}\Phi_a(X)=\operatorname{tr}X
\quad(X\succeq0),
$$
and hence by linearity to every matrix.

Compression of (8.8k.5) by the $a$-flag projection gives
$$
(\Phi_a\otimes\operatorname{id}_d)(\omega_d)
=\frac1dJ(\Phi_a)\succeq0.
$$
The finite Choi theorem therefore makes every $\Phi_a$ completely positive. Trace preservation of $\sum_a\Phi_a$ is equivalent to the dual identity in (8.8k.6), and duality gives (8.8k.7). A positive output of trace zero vanishes, proving the $E_a=0$ edge; the effect sum proves the $E_a=I_d$ edge. A CP instrument gives affine positive branch rules, the normalization identity, and a positive block-diagonal Choi state, proving the converse. The finite-ledger variant uses Theorem 8.8d.1's kernel argument before the same Choi compression.

For (8.8k.8), $\lambda_{\max}(X^{\mathsf T})\le\operatorname{tr}X$ proves positivity of $\Phi_1$, direct traces prove branch normalization, and the Choi identities $J(\Theta)=F$ and $J(\Delta)=I_{d^2}/d$ prove (8.8k.9) and positivity of $J(\Phi_1)$ for $\varepsilon\le1/d$. Equation (8.8k.11) proves the nonlinear boundary. The proper-subfamily model and the $Q_*$ mismatch prove the two coverage boundaries. ∎

**Theorem 8.8l (Finite Response-Cone Envelope and Exact SPAP/PPI/PCE Carrier Boundary).** Let the pre-carrier signature $\mathcal L_0$ contain exactly the admitted SPAP original-sort queries and responses, finite response maps and their invariant one-run laws, finite PPI dressings $X^\Theta=(X,\Pi_X,R_X,V_X,C_X,\tau_X)$ for their registered operational aspects, together with a nonempty finite PCE implementation census, its retained response tables, source-exhausted cost ledgers, response/cost quotient, exact potential and registered update. The signature $\mathcal L_0$ has no ordered-carrier, composite, spectator, branch-transformation or Choi predicate.

First fix nonempty finite sets $S$ of preparation labels and $\Omega$ of retained outcome occurrences, a family $\mathfrak C$ of registered contexts $C\subseteq\Omega$, and a table
$$
r:S\times\Omega\longrightarrow[0,1],
\qquad
\sum_{\omega\in C}r(s,\omega)=1
\quad(s\in S,\ C\in\mathfrak C).
\tag{8.8l.1}
$$
Repeated occurrences remain distinct elements of $\Omega$ unless the retained table itself identifies them. Define
$$
v_s:=\bigl(1,(r(s,\omega))_{\omega\in\Omega}\bigr),
\qquad
V_r:=\operatorname{span}_{\mathbb R}\{v_s:s\in S\},
\qquad
K_r:=\operatorname{cone}\{v_s:s\in S\},
\tag{8.8l.2}
$$
and let $u:V_r\to\mathbb R$ and $e_\omega:V_r\to\mathbb R$ be the restrictions of the first and $\omega$-coordinate projections. Then $K_r$ is a pointed generating cone,
$$
\{x\in K_r:u(x)=1\}=\operatorname{conv}\{v_s:s\in S\},
\qquad
0\le e_\omega\le u,
\qquad
\sum_{\omega\in C}e_\omega=u.
\tag{8.8l.3}
$$
The map $s\mapsto v_s$ identifies exactly equal complete retained-response rows. When registered preparation mixtures are present and $r$ is affine on them, this map preserves those mixtures. The convex hull in (8.8l.3) is the formal response-cone completion; its physical mixture interpretation requires a populated mixture operation. For a finite classical alphabet $A$, the direct-sum construction
$$
V_r^{A}:=\bigoplus_{a\in A}V_r,
\qquad
K_r^{A}:=\bigoplus_{a\in A}K_r,
\qquad
u_A((x_a)_a):=\sum_a u(x_a),
\qquad
\pi_A((x_a)_a):=\sum_a x_a
\tag{8.8l.4}
$$
gives the finite flagged response carrier and its flag-forgetting positive map. Equations (8.8l.2)--(8.8l.4) are the canonical response-quotient carrier and flag kinematics fixed by the finite table: physical mixture availability, branch transformations, composites and spectator extensions require their separately populated records.

The carrier boundary is exact. Call an expansion $\widehat M$ of an $\mathcal L_0$-model $M$ **response/cost conservative** when its $\mathcal L_0$-reduct is literally $M$; the admissible original-sort predictor objects, coding, query access and diagonal closure are exactly those of $M$, equivalently the restriction of every expanded original-sort predictor is simulated by an admitted predictor of $M$; and every added carrier object is absent from the retained response and source-ledger coordinates unless an additional coordinate is expressly registered. Such an expansion preserves the SPAP obstruction, every copied finite PPI dressing and the PCE conclusions. Indeed, an expanded original-sort universal predictor would restrict and, by the simulation clause, give an admitted universal predictor on $M$. Copying $(\Pi_X,R_X,V_X,C_X,\tau_X)$ verbatim preserves finite recordability, verification, cost and update-use for the dressed operational aspect. The PCE equivalence relation, quotient classes, potential values and update are unchanged because their defining response and ledger coordinates are unchanged. A carrier-sensitive PPI dressing adds new protocol, record, verifier or cost data and therefore belongs to the registered-coordinate branch of the PCE dichotomy below.

For a nonempty witness, adjoin to any admitted diagonal-SPAP model the flip response
$$
X:=\{0,1\},
\qquad
\tau(0)=1,
\qquad
\tau(1)=0,
\qquad
q=\left(\frac12,\frac12\right),
\tag{8.8l.5}
$$
and the singleton PCE census
$$
\mathcal X:=\{z\},
\qquad
R_z=q,
\qquad
c_z=0,
\qquad
V([z])=0,
\qquad
U([z])=[z].
\tag{8.8l.6}
$$
Theorem 11c gives the unique invariant law in (8.8l.5), and Theorem 22b applies to (8.8l.6). The same $\mathcal L_0$-model has the following response/cost-conservative expansions:
$$
\begin{array}{c|c|c|c}
&\text{ordered carrier}&\text{registered state/effects}&\text{flip}\ \\ \hline
\widehat M_{\mathrm C}
& (\mathbb R^2,\mathbb R_+^2,(1,1))
& q;\ e_0,e_1
& (x_0,x_1)\mapsto(x_1,x_0)\\
\widehat M_{\mathrm Q}
& (M_2(\mathbb C)^{\mathrm{sa}},M_2(\mathbb C)^+,\operatorname{tr})
& I_2/2;\ P_0,P_1
& \rho\mapsto\sigma_x\rho\sigma_x.
\end{array}
\tag{8.8l.7}
$$
The quantum expansion may carry the standard positive-semidefinite composite and $\omega_2$; the designated classical carrier has real dimension two, whereas $M_2(\mathbb C)^{\mathrm{sa}}$ has real dimension four. Thus the two designated carriers are not order-isomorphic although every $\mathcal L_0$ datum is identical. Theorem 11d's diagonal Hilbert construction supplies one mathematical realization of a finite invariant law; the paired expansions prove that the retained law does not select that realization as the physical carrier or determine its composite.

The obstruction persists after local complex carriers and all separable spectators are admitted. For $d\ge2$, equip
$$
M_d(\mathbb C)^{\mathrm{sa}}\otimes M_d(\mathbb C)^{\mathrm{sa}}
$$
with the separable state cone
$$
K_{\mathrm{sep}}
:=\operatorname{cone}\{X\otimes Y:X,Y\succeq0\}.
\tag{8.8l.8}
$$
Product effects separate this tensor space, so this composite is locally tomographic. With the maps of (8.8k.8),
$$
\Phi_0=\varepsilon\Theta,
\qquad
\Phi_1=\Delta-\varepsilon\Theta,
\qquad
0<\varepsilon\le\frac1d,
\tag{8.8l.9}
$$
both $\Phi_a\otimes\operatorname{id}$ preserve $K_{\mathrm{sep}}$: each product generator is sent to the product of two positive operators, and conic extension gives the claim. Retaining the branch label in a direct-sum flag therefore gives positive subnormalized outputs for every admitted separable spectator preparation. The sum $\Phi_0+\Phi_1=\Delta$ is CPTP. Nevertheless,
$$
J(\Phi_0)=\varepsilon F\nsucceq0.
\tag{8.8l.10}
$$
At $d=2$ and $\varepsilon=1/2$ the two branch effects are both $I_2/2$. Hence local tomography, affinity, local positivity, normalized retained flags, locality on every admitted separable spectator and a CPTP flag-forgotten channel leave branch CP undetermined. The missing separating preparation is an admitted faithful entangled reference state. A product reference $|0,0\rangle\!\langle0,0|$, which purifies the nonfaithful state $|0\rangle\!\langle0|$, also gives a positive output under $\Theta\otimes\operatorname{id}$ and therefore cannot certify CP. The negative antisymmetric eigenvector in (8.8l.10) is the exact falsifier.

Process fullness is independent even when every effect on the designated local carrier and the local identity channel are realized. Fix $d\ge2$ and a density operator $\tau$ on that carrier. Let the admitted local branch maps be the trace-nonincreasing members of
$$
\mathfrak P_{\mathrm{res}}
:=\{c\,\operatorname{id}+\mathcal E:c\ge0,\ \mathcal E\ \text{is entanglement-breaking CP}\},
\tag{8.8l.11}
$$
and admit the instruments whose branches lie in $\mathfrak P_{\mathrm{res}}$ and whose sum is trace preserving. $\mathfrak P_{\mathrm{res}}$ contains the identity, is a convex cone and is closed under composition; its trace-nonincreasing part is closed under convex mixing and composition. It realizes every finite POVM $(E_a)_{a\in A}$ through the measure-and-prepare instrument
$$
\mathcal R_a^E(X):=\operatorname{tr}(E_aX)\tau,
\qquad
\sum_a\mathcal R_a^E\ \text{is trace preserving}.
\tag{8.8l.12}
$$
Use the standard positive-semidefinite state composites, including a maximally entangled input--reference preparation, while admitting only identity spectator extensions of the designated local branches and their conic, convex-instrument and sequential closure; retain every branch flag. Entangled composite effects/instruments and compact-closed feedback are outside this typed process class. It omits every nonidentity local unitary channel. For $d\ge3$ it also omits every proper coherent local filter $X\mapsto PXP$ with $2\le\operatorname{rank}P<d$. Indeed, each omitted map has a rank-one entangled Choi matrix. If such a matrix were $cJ(\operatorname{id})+J(\mathcal E)$ with both summands positive, rank-one support would force either the identity Choi ray or a separable rank-one Choi ray, contradicting respectively nonidentity/properness or entanglement. Thus complete local-effect coverage, the local identity process and correct retained-flag CP behavior on the admitted typed class leave universal physical process and filter fullness open.

Choi-shadow faithfulness is independent of Choi positivity. For one fixed finite CP instrument $\Phi=(\Phi_a)_a$, define two implementations with a retained binary side tag $z$ by
$$
\Xi_{\Phi,z}
:=\sum_a|a\rangle\!\langle a|\otimes\frac1dJ(\Phi_a)
\otimes|z\rangle\!\langle z|,
\qquad z\in\{0,1\}.
\tag{8.8l.13}
$$
Forgetting $z$ gives the same positive flagged Choi shadow for both implementations, while the complete retained response presheaf distinguishes the certain records $z=0$ and $z=1$. Hence equality of a forgetful Choi shadow is not a faithful complete-process quotient unless every omitted side coordinate is independently certified response-null. The complete response quotient itself keeps the two implementations distinct, so this countermodel does not weaken that quotient.

PCE has a corresponding exact dichotomy. If two carrier completions have the same retained response table and source-exhausted ledger, Theorem 22b places them in one quotient class. If a carrier label or carrier-dependent cost is added as a retained coordinate, the completions become distinct classes; the two exact supplied potentials
$$
V_{\mathrm C}([\widehat M_{\mathrm C}])=0,
\quad
V_{\mathrm C}([\widehat M_{\mathrm Q}])=1,
\qquad
V_{\mathrm Q}([\widehat M_{\mathrm C}])=1,
\quad
V_{\mathrm Q}([\widehat M_{\mathrm Q}])=0
\tag{8.8l.14}
$$
both satisfy Theorem 22b's exact finite hypotheses and select opposite minimizers. An independently proved exhaustive carrier census and source-complete commensurate potential are therefore necessary for PCE carrier selection. Together with Theorem 8.8i's $Q_*$ response table, which has full context normalization but unequal weights $5/16$ and $1/4$ for the two occurrences of $P_z/2$, these constructions give `nonentailment` of a complex physical carrier, a retained-spectator certificate, same-effect consistency and universal process fullness from SPAP/PCE response/cost structure.

*Proof.* If $x=\sum_s\lambda_sv_s\in K_r$ is nonzero, with $\lambda_s\ge0$, then $u(x)=\sum_s\lambda_s>0$. Hence $K_r\cap(-K_r)=\{0\}$, and generation holds by the definition of $V_r$. Dividing a nonzero conic combination by its $u$-value proves the base identity in (8.8l.3). The inequalities extend from the generators to all of $K_r$ by conic linearity, while the context sums extend to all of $V_r$ by linearity. Equation (8.8l.4) is a direct-sum ordered space, and $\pi_A$ is positive.

The reduct and predictor-restriction argument proves conservative preservation. Equations (8.8l.5)--(8.8l.7) give identical response and PCE data and carriers of unequal dimension. For (8.8l.8)--(8.8l.10), positivity of $\Phi_0$ is immediate and $\lambda_{\max}(X^{\mathsf T})\le\operatorname{tr}X$ gives $\Phi_1(X)\succeq0$ for $X\succeq0$ and $\varepsilon\le1/d$. Positivity on every separable generator follows, whereas the swap has eigenvalue $-1$ on the antisymmetric subspace. Entanglement-breaking maps form a convex cone and a two-sided ideal under CP composition, proving the closure claims for (8.8l.11); (8.8l.12) supplies every effect. The rank-one Choi support argument proves both stated omissions. Partial trace over the $z$ register proves the equal shadows in (8.8l.13), and direct reading of that register proves the response-presheaf distinction. That subtheory and the two potentials in (8.8l.14) establish the fullness and PCE boundaries. ∎

**Resolution TV-QM-01-R2 (Metadata).** Exact domain: every finite retained preparation--occurrence response table and every response/cost-conservative expansion of an admitted SPAP/PPI/PCE model; the separable-composite, Choi-shadow and restricted-process obstructions additionally use finite complex local carriers. Premises: finite normalized context tables for the positive envelope, finite PPI dressing data, and exactly the original-sort SPAP data plus Theorem 22b's supplied finite quotient data for the nonentailment result. Equivalence relation: equality of the complete $\mathcal L_0$ reduct; within PCE, equality of retained response tables and source-exhausted ledgers. Budget: every preparation row, occurrence coordinate, registered context, PPI dressing coordinate, PCE class and potential value, both carrier expansions, every separable product generator, both retained branches, the antisymmetric Choi witness, the nonfaithful product reference, every POVM in the identity-plus-entanglement-breaking subtheory, both Choi side tags and both exact PCE orderings. Verifier: (8.8l.1)--(8.8l.14), literal reduct and PPI-dressing equality, predictor restriction, carrier-dimension mismatch, positivity on $K_{\mathrm{sep}}$, the negative swap eigenvalue, closure and rank-one Choi exclusions for $\mathfrak P_{\mathrm{res}}$, side-tag shadow equality with complete-response inequality, and opposite exact PCE minimizers. Falsifier: a response coordinate not represented by (8.8l.2); a nonzero vector in $K_r\cap(-K_r)$; a changed original response, PPI dressing or source ledger in a claimed conservative expansion; an order isomorphism between the two designated carriers; positivity of $\varepsilon F$ on the antisymmetric subspace; an admitted nonidentity unitary or proper rank-at-least-two coherent filter in $\mathfrak P_{\mathrm{res}}$; collapse of the two retained $z$ records in the complete response presheaf; or a carrier-selection theorem invariant under the paired expansions and potentials. Provenance class: source-internal finite ordered-cone construction and explicit model-theoretic nonentailment. Downstream consumers: Principle 8.0b, Definition P.6.2, Theorems 8.8g--8.8k, Theorems 11c, 11d and 22b, and `TV-QM-01`, `TV-QM-05` and `TV-QM-08`. Nonvacuity: (8.8l.5)--(8.8l.7) populate both carrier completions; (8.8l.8)--(8.8l.10) populate the spectator boundary; (8.8l.11)--(8.8l.12) populate every effect and the identity while retaining a proper process subtheory; (8.8l.13) populates the shadow-faithfulness boundary. Result: `positive-discharge` of the finite formal response-cone and classical-flag envelope and `nonentailment` of physical complex-carrier selection, retained-spectator CP, forgetful-Choi faithfulness and universal process fullness from the exact SPAP/PPI/PCE package. Population of the predictive-correspondence carrier record remains `C+R` under `TV-QM-01`; retained-branch realization remains `M+R` under `TV-QM-05`; complete process/response coverage remains `C+R` under `TV-QM-08`.

**Theorem 8.8m (Physical-Purification and Hereditary-Locality Descent to Retained CP).** Work on the independently accepted complex ordered-carrier and standard positive-semidefinite composite portion of condition 1 in Theorem 8.8k, excluding its $\omega_d$ preparation clause. Let a registered finite procedure have positive affine preparation-extensional branch rules $t_a:\mathcal D_d\to M_{d'}(\mathbb C)^+$, and let $\Phi_a$ be their unique linear extensions (8.8k.4). Assume separately the retained trace/record link
$$
q_a(\rho)=\operatorname{tr}t_a(\rho),
\qquad
\sum_{a\in A}q_a(\rho)=1
\quad(\rho\in\mathcal D_d),
\tag{8.8m.1}
$$
where the trace normalization and the equality to the write-once flag weight are calibrated from the ordered carrier and record process independently of an effect or Born table under derivation. Replace the direct retained-Choi gate (8.8k.5) by the following physical records.

1. **Physical maximally mixed purification.** An independently source-derived pure input--reference preparation $\psi=|\Psi\rangle\!\langle\Psi|$ satisfies
   $$
   \operatorname{tr}_{R}\psi=\frac{I_d}{d}.
   \tag{8.8m.2}
   $$
   The reference is isolated during the procedure, and the carrier coordinates, purity, marginal and preparation identity are certified without using the terminal table $q$. The admitted convex preparation domain contains
   $$
   \mathfrak D_{AR}^{\psi}
   :=\operatorname{conv}\!\left(
   \{\rho\otimes\xi:\rho,\xi\in\mathcal D_d\}
   \cup\{\psi\}\right).
   \tag{8.8m.3}
   $$
2. **One affine hereditary local rule.** A single affine retained-flag rule
   $$
   H:\mathfrak D_{AR}^{\psi}\longrightarrow
   \bigoplus_{a\in A}
   \left(M_{d'}(\mathbb C)^{\mathrm{sa}}\otimes
   M_d(\mathbb C)^{\mathrm{sa}}\right),
   \qquad
   H(\zeta)=\bigoplus_{a\in A}H_a(\zeta),
   \tag{8.8m.4}
   $$
   represents execution of that same procedure on the input wing. Each $H_a(\zeta)$ is an admitted positive subnormalized output--reference state, and occurrence-level locality holds on every product preparation:
   $$
   H_a(\rho\otimes\xi)=t_a(\rho)\otimes\xi
   \quad(\rho,\xi\in\mathcal D_d).
   \tag{8.8m.5}
   $$
   Every registered refinement or later continuation preserves each earlier positive labeled block and pushes forward to it when later records are forgotten. A flag-forgotten positivity check does not meet this retained-block condition. This refinement/pushforward clause is a downstream process-coverage condition; the CP implication below uses the single-domain affine rule and positivity of its retained blocks.

Then there is a reference unitary $U$ such that
$$
|\Psi\rangle=(I_d\otimes U)\frac{|\Omega_d\rangle}{\sqrt d},
\qquad
H_a(\psi)
=\frac1d(I_{d'}\otimes U)J(\Phi_a)(I_{d'}\otimes U^\dagger)
\succeq0.
\tag{8.8m.6}
$$
Unitary conjugation therefore gives $J(\Phi_a)\succeq0$ for every $a$. The branches form a finite CP instrument; with the independently assumed trace/record link (8.8m.1), their effects form a POVM and the registered weights have the normalized additive form (8.8k.7), including zero and duplicate effects. Purification plus hereditary locality proves branch CP; the equality between physical flag weights and trace weights remains supplied by (8.8m.1).

The carrier, faithful-purification, single-affine-rule, retained-block, trace-link and process-fullness gates have the following sharp boundaries. The separable-composite construction (8.8l.8)--(8.8l.10) has one positive local extension on every admitted separable state but omits $\psi$. A rank-one product purification is nonfaithful and leaves the transpose branch positive on that test. Physical preparation of $\psi$ without one affine joint rule also leaves a side-tag loophole: for the transpose/depolarizing pair (8.8l.9), use
$$
H_a^{\mathrm{prod}}(\rho\otimes\xi):=\Phi_a(\rho)\otimes\xi,
\qquad
H_0^{\psi}(\psi):=\varepsilon\psi,
\qquad
H_1^{\psi}(\psi):=(1-\varepsilon)\psi.
\tag{8.8m.7}
$$
Every separately tagged output in (8.8m.7) is positive and has the correct constant branch trace, but these assignments cannot be restrictions of one affine $H$ on (8.8m.3): affine spanning would force the negative Choi shadow (8.8l.10). This exact source-side tag is the failure of preparation extensionality across the product and purification records. Hiding the branch flag gives the further coarse-graining loophole already exhibited by (8.8k.8)--(8.8k.9).

The trace/record link is independent even when the carrier, faithful purification, one affine hereditary rule and every retained matrix block are present. For $d\ge2$, take
$$
\Phi_0=\Phi_1=\frac12\operatorname{id},
\qquad
H_a(\zeta)=\frac12\zeta,
\qquad
(q_0,q_1)=\left(\frac13,\frac23\right).
\tag{8.8m.8}
$$
The two CP branches, the normalized flagged matrix shadow and the purification/locality identities all hold, while $q_a\ne\operatorname{tr}t_a(\rho)=1/2$. Here the matrix-shadow label and the terminal operational record are separate registered sorts; identifying their weights is exactly the missing premise (8.8m.1). Finally, the complete-local-effect restricted CP subtheory (8.8l.11) satisfies the theorem for every admitted procedure while omitting coherent local filters and unitary channels. Thus faithful purification, one affine hereditary branch rule, retained flagging, the trace/record link and process fullness are independent gates.

For $d=1$, the input matrix algebra is scalar, every positive linear branch is CP, and (8.8m.6) reduces to the scalar branch weight. The antisymmetric and nonfaithful-reference countermodels require $d\ge2$.

*Proof.* The product density operators affinely span the trace-one hyperplane of $M_d(\mathbb C)^{\mathrm{sa}}\otimes M_d(\mathbb C)^{\mathrm{sa}}$. Perturbing $I_d/d$ in each factor by sufficiently small multiples of bases of traceless Hermitian matrices and taking affine differences spans the directions $A\otimes I$, $I\otimes B$ and $A\otimes B$. Hence the single affine map in (8.8m.4) is uniquely determined on $\mathfrak D_{AR}^{\psi}$ by its values on all product states. Equation (8.8m.5) forces
$$
H_a(\zeta)=(\Phi_a\otimes\operatorname{id}_d)(\zeta)
\quad(\zeta\in\mathfrak D_{AR}^{\psi}).
$$
The pure-state marginal identity (8.8m.2) gives equal Schmidt coefficients $1/\sqrt d$, so a unitary $U$ on the reference has the orientation displayed in (8.8m.6). Substitution and the Choi convention (8.8k.6) prove (8.8m.6). Positivity of the retained $H_a(\psi)$ blocks and unitary conjugation prove $J(\Phi_a)\succeq0$. Equation (8.8m.1) makes $\sum_a\Phi_a$ trace preserving, and duality gives the POVM and branch-weight formula. The separable, product-reference, side-tag, hidden-flag, trace-link and complete-local-effect restricted-process models establish the six stated boundaries. ∎

**Resolution TV-QM-05-R3 (Metadata).** Exact domain: every finite procedure on independently accepted finite-dimensional complex input, output and reference carriers with standard positive-semidefinite composites, positive affine preparation-extensional branch rules, a separately calibrated trace/record link, one source-derived pure preparation with marginal $I_d/d$, and one affine flagged spectator rule on (8.8m.3). Premises: the carrier/composite portion of Theorem 8.8k condition 1 excluding its $\omega_d$ preparation clause; branch affinity and preparation extensionality; (8.8m.1)--(8.8m.5); and positivity of every retained labeled block before coarse-graining. Equivalence relation: equality of the independently source-derived carrier, preparation and process certificates, the outcome-labeled affine branch maps and the one affine flagged rule on its complete convex domain; later records are compared by their projectively consistent pushforwards. Budget: every product preparation, the certified pure state $\psi$, every admitted branch, flag block and later refinement, every spanning preparation relation, all zero/duplicate-effect edges and the six boundary models. Verifier: source-derived ordered-carrier/composite coordinates, an independent purity and partial-trace certificate for (8.8m.2), affine-domain closure, every product identity (8.8m.5), the affine-span and unitary-orientation arguments, blockwise positivity, (8.8m.6), Choi positivity, the trace/record equality, the mismatch (8.8m.8) and dual normalization. Any carrier, preparation, process or trace calibration inferred from $q$, a Born rule or the effect representation being derived is rejected. Falsifier: two affine values for the same convex-domain preparation; a nonpositive retained branch from $\psi$; failure of a product local-action identity; a source side tag splitting product and purification preparations; a nonfaithful reference presented as satisfying (8.8m.2); positivity checked after hiding the flag; a normalized terminal table unequal to the branch traces but presented as satisfying (8.8m.1); or a non-CP branch satisfying every declared premise. Provenance class: source-internal physical preparation/process descent followed by finite affine spanning, Schmidt decomposition and the Choi theorem. Downstream consumers: Theorems 8.8k, 8.8j and 8.8i, the finite instrument protocols, `TV-QM-05` and `TV-QM-08`. Nonvacuity: every physically realized finite CP instrument equipped with the theorem's source-derived purification, affine retained-flag spectator rule and independently calibrated trace/record link populates the positive branch; (8.8l.8)--(8.8l.11), the rank-one product reference, (8.8m.7)--(8.8m.8) and the hidden-flag pair populate the independent boundaries. Result: `positive-discharge` of the conditional implication from an independently physical maximally mixed purification and one affine hereditary local branch rule to the retained-flag certificate and finite CP instrument; the normalized effect-functional conclusion additionally uses the independently supplied trace/record link. Physical population of the carrier, preparation, affine-process and trace/record certificates remains `M+R` under `TV-QM-05`, and complete PU-process and response-link coverage remains `C+R` under `TV-QM-08`.

**Resolution ledger 8.8-R1.** These analytic artifacts use finite ordered cones, the displayed 64-effect frame, finite trial laws, one finite Choi matrix, finite-dimensional projective space, and finite matrices. Equivalence is ordered-state-space isomorphism, equality of registered finite laws, or unitary/projective equivalence as appropriate.

| Target | Exact scoped proposition and polarity | Verifier and falsifier | Downstream consumers |
|:--|:--|:--|:--|
| `TV-QM-01` | Theorem 8.8l gives `positive-discharge` of the canonical finite response-quotient cone and classical-flag envelope, and its paired classical/quantum conservative expansions give `nonentailment` of physical complex-carrier selection from the exact SPAP/PPI/PCE reduct. Theorem 8.8g retains `positive-discharge` of the complete finite Jordan census and selects $H_8(\mathbb C)$ on the independently populated predictive-correspondence, eight-outcome and no-surplus branch. | Check the real/quaternionic weak-branch countermodels, the strong-branch Koecher--Vinberg and dimension steps, and (8.8l.1)--(8.8l.14), including literal reduct/PPI-dressing preservation, the carrier-dimension mismatch, separable transpose witness, restricted-process Choi exclusions, retained side tag and opposite PCE minimizers; a surviving strong-branch noncomplex carrier or a pre-carrier selector invariant under the paired expansions falsifies the applicable result. | Principle 8.0b, Definition P.6.2, Theorem G.1.8, Theorems 8.8g and 8.8l and the finite carrier certificate. |
| `TV-QM-02` | The 64-effect frame is a cardinality-minimal basis certificate on Definition 8.2b's finite route: `positive-discharge`; physical coverage is open. | Rank the 64 Hermitian coordinates and check (8.8b.2), positivity, and trace; rank loss or two reconstructed states falsifies it. | Definition 8.2b and Theorems 8.3, 8.0d. |
| `TV-QM-03` | Theorem 8.8i gives `positive-discharge` of the conditional full-effect Born descent, the exact $d=8$ preparation/instrument product-trial law, its frequency bound and its complete fixed-protocol path-presentation quotient; its $Q_*$ construction gives `nonentailment` of same-effect transition consistency or Born form from SPAP/PCE alone. | Verify (8.8i.3)--(8.8i.20), including the $Q_*$ context mismatch, the exact $(1/8,7/8)$ product law and both directions of the path-law quotient; a same-effect-consistent counterexample to (8.8i.3), a failed CP/product identity or a quotient collision is a falsifier. | Principle 8.0c, Theorem 8.0d, Proposition 7 and the finite measurement/frequency protocols. |
| `TV-QM-04` | The associative real/complex/quaternionic census is `positive-discharge`: Corollary 8.8a.1 proves that either the product-effect isomorphism or the exact one-dimensional connected scalar-phase gate independently selects $\mathbb C$, while removing both gives `nonentailment`; a merely nontrivial connected phase retains $\mathbb H$ until response equivalence licenses PCE quotienting. | Recompute (8.8a.2)--(8.8a.3), the three identity-component dimensions, and the response-equivalence gate; a real or quaternionic member satisfying either exact selector falsifies the classification. | Theorem 8.4 and scalar/Jordan carrier selection. |
| `TV-QM-05` | Theorems 8.8d and 8.8d.1 give `positive-discharge` of the finite Choi and preparation-descent classifications. Theorem 8.8k derives finite CP instruments on its independently retained-Choi-certified branch. Theorem 8.8l gives `nonentailment` from separable spectator locality, a nonfaithful reference, a forgetful Choi shadow and complete local-effect coverage in a typed proper local process subtheory. Theorem 8.8m derives retained branch CP from an independently source-derived pure preparation with marginal $I_d/d$ and one affine hereditary local rule on the complete product-plus-purification domain; its normalized effect response additionally uses the separately calibrated trace/record link. Physical population and coverage of these records remain open. | Check (8.8d.1.1)--(8.8d.1.2), (8.8k.3)--(8.8k.11), (8.8l.8)--(8.8l.13) and (8.8m.1)--(8.8m.8), including affine spanning, unitary orientation, every retained Choi block, the side-tag incompatibility, the trace-link mismatch and the trace/record equality; a non-CP branch satisfying every 8.8m premise falsifies the positive theorem, while a hidden flag, source side tag, nonfaithful reference or response-defined carrier/preparation/process calibration rejects physical closure. | Theorem 8.3b, Theorems 8.8i--8.8m and instrument realization. |
| `TV-QM-06` | Finite measurable transition-isometry semigroup classification and Wigner/Stone lift are `positive-discharge`; physical clock calibration is open. | Check compact isometry, group law, measurability, and the unitary lift; a nonsurjective isometry or discontinuous measurable homomorphism falsifies it. | Theorems 8.5, 8.7, 7.6c and 29. |
| `TV-QM-07` | Operator-norm and normalized-Hilbert--Schmidt finite-commutator convergence receive `negative-refutation`; Theorem 8.8f.1 gives `positive-discharge` of exact infinite-carrier Weyl existence, a common unbounded-generator core, and within-carrier strong-continuity bounds. Finite-to-infinite convergence, PU carrier intertwining, and physical-parameter records remain open. | Evaluate the finite trace bounds and verify (8.8f.1.1)--(8.8f.1.4); failure of the Weyl phase, domain invariance, or either graph-norm bound falsifies the positive construction. | Canonical-pair and continuum-carrier routes. |
| `TV-QM-08` | Theorem 8.8j gives `positive-discharge` of universal finite outcome-wise CP-instrument binary-first factorization and of same-effect transition consistency on its leafwise-extensional, history-pushforward, retained-prefix-causal branch. Theorems 8.8k and 8.8m give conditional retained-flag routes to CP and normalized trace-effect response, while Theorem 8.8l proves that SPAP/PPI/PCE, separable spectator locality, a forgetful Choi shadow and even all local effects plus the local identity in a typed proper CP-process subtheory do not supply complete process coverage. Full PU-process and response-link coverage and realization remain `C+R`-open, and $Q_*$ retains `nonentailment` from context normalization alone. | Verify (8.8j.2)--(8.8j.9), (8.8k.3)--(8.8k.9), (8.8l.8)--(8.8l.14) and (8.8m.1)--(8.8m.8), every outcome-labeled branch/Choi block, tree-flattening law, product-domain affine extension, flag-to-leaf marginal, exogenous-continuation invariance and calibration independence; a failed identity or a covered equal-effect pair with unequal weights falsifies the applicable positive theorem, while a hidden flag, side tag, response-defined bridge, omitted process or response-active side ledger rejects closure. | Theorems 8.8i--8.8m, G.1.11e and 8.0d and the finite measurement protocols. |



