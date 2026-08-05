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
In each registered run exactly one mutually exclusive label $k$ is written, and its registered outcome probability is the weight of the corresponding block. A frequency-convergence statement additionally requires an i.i.d., exchangeable, or stationary-ergodic repeated-trial certificate.

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




