# 8. Emergence of Quantum Mechanical Formalism

<a id="formal-closure-boundary"></a>**Formal closure boundary.** The results in this section are effective-formalism results on the MPU Hilbert branch. The SPAP-to-Born route has four separate layers: response-null context labels quotient away by PPI/PCE; finite-response payoff refinement gives additivity on the retained quotient; Definition 8.2b supplies either full projection/effect coverage or a finite informationally complete positive reconstruction; and Theorem 8.3 then fixes the trace representation on that certified domain. Later physical sectors retain their separate realization certificates and status labels.

This section constructs a consistent effective quantum description on a declared finite-response branch. It assumes a complex operational $C^*$-algebra with a positive normalized state, response-null quotienting, retained-effect additivity and noncontextuality, an accepted Born-domain completeness certificate, the carrier-selection package, the tensor-product/local-CPTP package, and continuous transition-probability-preserving ray dynamics. Under that conjunction, the results recover the Hilbert representation, certified-domain Born weights, superposition interpretation, Robertson inequality, entanglement formalism, and Schrödinger dynamics.

<a id="principle-80b-fundamental-predictive-carrier-closure"></a>**Principle 8.0b (Fundamental Predictive Carrier Closure).** Every fundamental MPU on this physical closure branch, after finite-response quotienting, carries the Sharp Homogeneous Carrier Certificate $\mathfrak C_{\mathrm{car}}$ of Definition G.1.8a. Its retained finite-dimensional ordered state space has: (i) a closed, pointed, generating state cone and a separating effect cone; (ii) a symmetric positive-definite predictive pairing with respect to which the cone is self-dual; (iii) a cost-bounded reversible group acting transitively on the cone interior; (iv) locally tomographic composition within one scalar/Jordan family, with multiplicative sizes $mn$ for all nontrivial factors $m,n\ge2$; (v) full retained scalar phase redundancy whose connected group is exactly one-dimensional $U(1)$; and (vi) a finite Jordan-exclusion record that certifies simplicity and irreducibility and excludes simplex, real, quaternionic, spin-factor, exceptional, and every additional response-active central summand. Principle 5b supplies eight response triples; the present certificate separately makes them one sharp jointly perfectly distinguishable context. A faithful $M_8(\mathbb C)$ representative realizes the complete retained response presheaf, and after response-null quotienting every higher-dimensional representative of that same presheaf has strictly larger total PCE potential.

This is a falsifiable physical closure principle.

<a id="principle-80c-response-complete-actualization-on-the-selected-matrix-carrier"></a>**Principle 8.0c (Response-Complete Actualization on the Selected Matrix Carrier).** On the complex matrix carrier supplied by Principle 8.0b, every registered finite verification with outcome set $\mathcal K$ has an operational map
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

<a id="theorem-80d-closed-mpu-quantum-representation"></a>**Theorem 8.0d (Closed MPU Quantum Representation).** Principles 5b, 8.0b, and 8.0c, together with Theorem 8.2, Lemma 8.2a, and an accepted Born-domain completeness certificate $\mathfrak C_{\mathrm{Born}}$ of Definition 8.2b, imply:

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

PCE/PPI supplies the response quotient and the branch-selection grammar. The complex scalar field, stochastic law, additive probability ledger, tensor-product composition, and continuous ray symmetry enter through Principles 8.0b–8.0c and the stated hypotheses of the theorems below, each selecting its part of the effective quantum formalism.

<a id="lemma-80a-finite-response-c-envelope-of-the-predictive-observable-algebra"></a>**Lemma 8.0a (Finite-Response $C^*$-Envelope of the Predictive Observable Algebra).**
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

<a id="theorem-81-pu-gns-representation"></a>**Theorem 8.1 (PU–GNS Representation).**
Let $\mathfrak A_{\mathrm{alg}}$ be the finite-response predictive observable *-algebra generated by operational outcomes under ND‑RID and Evolve updates, and let $\mathfrak A$ be its finite-response $C^*$-envelope from Lemma 8.0a. Let $\omega:\mathfrak A\to\mathbb C$ be a *predictive state*, defined as a linear, positive, normalized, and continuous functional. Then, by the Gelfand–Naimark–Segal (GNS) construction, there exist a Hilbert space $\mathcal H_\omega$, a *‑representation $\pi_\omega:\mathfrak A\to\mathcal B(\mathcal H_\omega)$, and a cyclic vector $\psi_\omega\in\mathcal H_\omega$ such that $\omega(a)=\langle \psi_\omega,\ \pi_\omega(a)\ \psi_\omega\rangle$ for all $a\in\mathfrak A$.

*Proof.* This is the GNS construction specialized to the predictive algebra; the positive-functional quotient/representation mechanism is supported by Gelfand and Naimark (1943), and the construction needed here is proved below. Define
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

<a id="theorem-82-idle-context-quotient-for-predictive-weights-at-the-pce-attractor"></a>**Theorem 8.2 (Idle-Context Quotient for Predictive Weights at the PCE-Attractor).**
Let $\mathsf P_{\mathrm{PU}}$ be the finite-resolution protocol category of Appendix P.6.1b. Assume the PPI branch is separating and protocol-complete in the sense of Definitions P.6.1b.1–P.6.1b.2. For an effect $E$ appearing in a context $\Pi$, let $\mathcal R_{E,\Pi}$ be its operational response presheaf. A predictive weight assignment is a function
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

<a id="lemma-82a-finite-response-additivity-on-the-quotient"></a>**Lemma 8.2a (Finite-Response Additivity on the Quotient).**
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

<a id="definition-82b-born-domain-completeness-certificate"></a>**Definition 8.2b (Born-Domain Completeness Certificate).** Let $\mathcal H$ be a finite-dimensional complex Hilbert space and let $\mathsf E_{\mathrm{ret}}\subseteq[0,I]$ be the retained quotient effects. A Born-domain completeness certificate $\mathfrak C_{\mathrm{Born}}$ uses one of the following independently checkable routes.

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

<a id="theorem-83-born-selector-theorem-on-the-quotient-hilbert-ledger"></a>**Theorem 8.3 (Born Selector Theorem on the Quotient Hilbert Ledger).** Let $\mathcal H_\omega$ be the selected complex Hilbert carrier, let $\omega$ be a normalized positive quotient ledger satisfying Theorem 8.2 and Lemma 8.2a on its retained domain, and assume an accepted $\mathfrak C_{\mathrm{Born}}$.

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

The uniqueness conclusion is domain-qualified. In particular, quotienting and additivity on one retained basis do not exclude other density matrices or arbitrary assignments on unregistered contexts. On a certified full-domain branch, Gleason--Busch excludes non-trace assignments globally. On a certified informationally complete branch, finite linear algebra excludes alternatives on the retained operator system and fixes its unique positive extension. The power family $p_i^{(\gamma)}\propto|c_i|^\gamma$ agrees with the Born weights at $\gamma=2$. On a finite certified ledger, special preparations can also give agreement for other positive exponents, so this example does not establish either domain completeness or identification of $\gamma$. ∎

<a id="definition-83a-preparation-equivalence-and-spectator-stability"></a>**Definition 8.3a (Preparation Equivalence and Spectator Stability).** For finite-dimensional complex Hilbert spaces $\mathcal H_A$ and $\mathcal H_B$, an operational update $F:\mathcal D(\mathcal H_A)\to\mathcal D(\mathcal H_B)$ respects preparation equivalence when
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

<a id="theorem-83b-operational-mixtures-and-spectator-stability-force-cptp-dynamics"></a>**Theorem 8.3b (Operational Mixtures and Spectator Stability Force CPTP Dynamics).** Every preparation-equivalent, spectator-stable normalized update $F$ has a unique completely positive trace-preserving linear extension
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

Spectator stability is positivity of $\Phi\otimes\operatorname{id}_R$ for every finite spectator $R$, which is complete positivity. In finite input dimension, Choi's theorem (Choi 1975) applies to the linear map just constructed: with $|\Omega\rangle=\sum_i|i\rangle\otimes|i\rangle$,
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

<a id="corollary-83c-reversible-and-forbidden-update-boundaries"></a>**Corollary 8.3c (Reversible and Forbidden Update Boundaries).** If $\Phi$ in Theorem 8.3b has a two-sided CPTP inverse on the full output state space, then the input and output matrix algebras are completely order-isomorphic and
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
as follows by diagonalizing their difference on $\operatorname{span}\{\psi,\phi\}$. Thus the induced bijection of rays preserves transition probabilities. Wigner's theorem in Bargmann's formulation (Bargmann 1964) applies because the ray map is bijective and transition-probability preserving, and supplies either a unitary or an antiunitary implementation.

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

<a id="theorem-84-complex-hilbert-space-uniqueness-under-local-tomography-and-minimal-phase-redundancy"></a>**Theorem 8.4 (Complex Hilbert-Space Uniqueness under Local Tomography and Minimal Phase Redundancy).**
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

<a id="corollary-84a-complex-carrier-rank-bound"></a>**Corollary 8.4a (Complex-Carrier Rank Bound).** Assume the full-context realization hypotheses of Theorem 15 and a finite-dimensional complex Hilbert representation in which the eight retained response classes form one sharp, jointly perfectly distinguishable context. Then
$$
\dim_{\mathbb C}\mathcal H_0=d_0\ge8.
$$
If an admissible faithful eight-dimensional representative realizes the same complete retained response presheaf and every larger representative of that presheaf has strictly greater total PCE potential, then every PCE-minimal carrier in that comparison class satisfies $\mathcal H_0\cong\mathbb C^8$.

*Proof.* Theorem 15 supplies the eight operational response classes. The joint sharp-context hypothesis represents them by eight nonzero mutually orthogonal projections $P_1,\ldots,P_8$ with $\sum_jP_j\le I$. Therefore
$$
d_0=\operatorname{tr}I
\ge\sum_{j=1}^8\operatorname{tr}P_j
\ge8.
$$
The admissible faithful eight-dimensional representative attains this rank bound. The strict same-presheaf cost comparison excludes every larger representative from the PCE minimizer set, so every selected carrier in that class has rank eight. ∎

<a id="theorem-85-schrödinger-form-from-continuous-reversible-transition-probability-preserving-time-translations"></a>**Theorem 8.5 (Schrödinger Form from Continuous Reversible Transition-Probability-Preserving Time Translations).**
Let $\{\mathcal T_t\}_{t\in\mathbb R}$ denote the Internal Prediction dynamics on rays of $\mathcal H_0$. Assume:
1. each $\mathcal T_t$ is reversible and preserves transition probabilities;
2. the family is time-translation symmetric, so $\mathcal T_{t+s}=\mathcal T_t\circ\mathcal T_s$ and $\mathcal T_0=\mathrm{id}$;

3. the induced family of implementers is weakly measurable.

Then there exists a one-parameter family of unitary operators $\{U(t)\}_{t\in\mathbb R}$ on $\mathcal H_0$ such that
$$
\mathcal T_t([\psi])=[U(t)\psi].
$$
Because the minimal Appendix Z branch gives $d_0=8$ (Theorem Z.2, with Theorem 23 supplying the lower bound), $\mathcal H_0$ is finite dimensional. The proof below uses weak measurability of the projective action and its group law to obtain continuity, then lifts that action to a strongly continuous one-parameter unitary group. By Stone's theorem (Stone 1932), there is a self-adjoint operator $H$ with
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

Let $d=\dim\mathcal H_0=8$ and choose weakly measurable unitary representatives $V_t$ of the ray maps. Their projective classes define a Borel homomorphism
$$
f:\mathbb R\longrightarrow PU(d)=U(d)/U(1),
\qquad f(t)=[V_t].
$$
A measurable homomorphism between these finite-dimensional locally compact groups is continuous. The quotient
$$
q:SU(d)\longrightarrow PU(d)
$$
is a covering homomorphism with discrete kernel
$$
\ker q=\{e^{2\pi i k/d}I: k=0,\ldots,d-1\}.
$$
Since $\mathbb R$ is simply connected, the path $f$ has a continuous lift $U:\mathbb R\to SU(d)$ with $U(0)=I$. For every $s,t$, the projective group law puts
$$
D(s,t)=U(s)U(t)U(s+t)^{-1}
$$
in $\ker q$. The map $D$ is continuous on connected $\mathbb R^2$ and $D(0,0)=I$, so $D(s,t)=I$ everywhere. Therefore
$$
U(t+s)=U(t)U(s).
$$
Each $U(t)$ differs from $V_t$ only by a scalar phase and implements the same ray map. Continuity of this finite-dimensional matrix-valued lift is strong continuity.

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

<a id="proposition-6-interpretation-of-pure-state-superposition"></a>**Proposition 6 (Interpretation of Pure-State Superposition)**

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

<a id="proposition-7-emergence-of-the-born-rule"></a>**Proposition 7 (Emergence of the Born Rule)**

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

<a id="theorem-86-spap-to-quantum-dependency-separation-and-born-uniqueness"></a>**Theorem 8.6 (SPAP-to-Quantum Dependency Separation and Born Uniqueness).** The complete PU route has five logically distinct steps:

1. Theorems 10–11 exclude a universally exact predictor on their diagonal-closed classes.
2. Principle 11b selects the invariant convex response completion, and Theorem 11b proves the unique binary law $(1/2,1/2)$.
3. Principle 8.0b supplies the carrier certificate, and Theorems G.1.8 and 8.0d select $\mathcal H_0\cong\mathbb C^8$.
4. Theorem 8.2 supplies the response quotient, and Lemma 8.2a supplies finite additivity under its payoff-refinement hypotheses. Normalization and nonnegativity are supplied by the declared positive normalized state branch. Definition 8.2b then requires either full projection/effect coverage or a finite informationally complete operator-system certificate with positive density reconstruction. Theorem 8.3 uniquely gives $\omega(E)=\operatorname{tr}(\rho E)$ on that certified domain; global projection or effect statements require the corresponding full-domain route.
5. Principle 8.0c identifies the instrument block weights with registered single-run outcome probabilities. Frequency convergence requires the repeated-trial certificate stated in Principle 8.0c.

For a pure state and a rank-one sharp outcome,
$$
\Pr(i\mid\psi)=|\langle i|\psi\rangle|^2.
$$
No normalized positive alternative exists on the same accepted full-domain or informationally complete ledger. Sparse retained subledgers may admit multiple density extensions. Steps 1--2 do not logically imply Steps 3--5: the carrier, Born-domain, and actualization certificates are independent, falsifiable closure data.

*Proof.* Steps 1–3 are the cited theorems and principles. Step 4 applies Theorem 8.3 using the accepted Born-domain certificate: the full projection route in dimension $8\ge3$ uses Gleason's representation, while the finite informationally complete route uses the trace-dual reconstruction and its positivity and normalization tests. Each route supplies uniqueness on its stated domain. Step 5 is Principle 8.0c and the instrument conclusion of Theorem 8.0d. ∎

**8.4 Derivation of Uncertainty Relations**

<a id="proposition-8-robertson-uncertainty-relation-on-the-hilbert-branch"></a>**Proposition 8 (Robertson Uncertainty Relation on the Hilbert Branch)**

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

Section 14.2.6 compares two separately registered finite-response branches: a Hilbert/complementarity branch for simultaneous-variable uncertainty and a fixed-ready-state reset branch for sequential support and heat ledgers.

The finite MPU carrier $\mathcal H_0\cong\mathbb C^8$ cannot itself support an exact canonical pair, because $\operatorname{tr}[\hat x,\hat p]=0$ for finite matrices whereas $\operatorname{tr}(i\hbar I)=i\hbar\dim\mathcal H_0\ne0$. An exact position-momentum pair therefore belongs, if present, to a separately constructed infinite-dimensional effective carrier. Assume on that carrier a strongly continuous irreducible unitary representation of the one-degree Weyl relations with a fixed nonzero central character $\hbar$. After rescaling the canonical coordinates, this is a continuous unitary representation of the real Heisenberg group on which the center acts by its standard character. Prasad (2011, §4.1, Stone--von Neumann--Mackey theorem) proves that every such representation is an orthogonal sum of Schrödinger representations on $L^2(\mathbb R)$; irreducibility leaves one copy up to unitary equivalence. This classifies the assumed Weyl representation and does not supply the Weyl relations. On a common invariant domain containing a normalized state $|\psi\rangle$ and lying in $D(\hat x\hat p)\cap D(\hat p\hat x)$, the assumed canonical commutation relation is
$$
[\hat{x},\hat{p}] = i\hbar I \quad \text{(52)}.
$$
Applying Equation (51) on that domain gives
$$
\Delta x \cdot \Delta p \geq \frac{1}{2}\left|\langle\psi|[\hat x,\hat p]|\psi\rangle\right| = \frac{1}{2}|i\hbar| = \frac{\hbar}{2} \quad \text{(53)}.
$$

**8.5 Registered Measurement Instruments and Conditional State Updates**

On Principles 8.0b--8.0c and Theorem 8.0d, a registered verification is represented by a normalized quantum instrument, and conditioning on its unique registered outcome gives the corresponding state update. Theorem 8.3 supplies the Born ledger on the certified domain, and Principle 8.0c supplies the single registered outcome.

<a id="851-proposition-9-ideal-measurement-as-a-registered-evolve-instrument"></a>**8.5.1 Proposition 9 (Ideal Measurement as a Registered `Evolve` Instrument)**

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

*   **Conditional perspective-indexed record:** On the accepted instrument and single-outcome branch, the registered result $0$ is stored relative to $s'_{Z,0}$. Re-expansion of $|0\rangle$ in the incompatible $X$ basis is a mathematical basis change, not a second outcome record. The proposition establishes the conditioned record and update within this calculus.

<a id="853-corollary-4-operational-measurement-closure"></a>**8.5.3 Corollary 4 (Operational Measurement Closure)**

On Principles 8.0b–8.0c, a finite verification is a registered quantum instrument by Theorem 8.0d. For an ideal nondegenerate sharp repeatable verification, Proposition 9 derives the Lüders update and Born single-run probabilities. Frequency convergence requires a separate repeated-trial certificate. The unconditioned channel is
$$
\rho\longmapsto\sum_kP_k\rho P_k,
$$
while the conditioned state is $P_k$ for the unique registered label $k$. Internal unitary prediction and registered verification/update are successive stages of one cycle.

The logical status is explicit: Principle 8.0b and Theorem 8.0d give the carrier, Theorems 8.2–8.3 give trace weights, and Principle 8.0c gives irreducible single-outcome registration. Thermodynamic irreversibility enters only when the architecture contains a registered reset, through Theorem 31 or Theorem 31a.

**8.6 Interpretation of Entanglement (Proposition 10)**

Quantum entanglement finds a natural interpretation within the MPU framework as a representation of strong predictive coupling between interacting units.

<a id="proposition-10-interpretation-of-entanglement-as-predictive-coupling"></a>**Proposition 10 (Interpretation of Entanglement as Predictive Coupling)**

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

<a id="corollary-5-bell-violations-without-ftl-signaling"></a>**Corollary 5 (Bell Violations without FTL Signaling)**

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

<a id="proposition-11-autonomous-schrödinger-equation-for-internal-evolution"></a>**Proposition 11 (Autonomous Schrödinger Equation for Internal Evolution)**

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

<a id="theorem-87-time-translation-symmetry-unitary-group-schrödinger-dynamics"></a>**Theorem 8.7 (Time-translation symmetry ⇒ unitary group ⇒ Schrödinger dynamics).**
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
for every $t$. Hence every $\mathcal T_t$ has a unitary implementer. On the finite carrier $\mathcal H_0$ used here, apply the phase-lift construction in the proof of Theorem 8.5 to the continuous projective homomorphism $t\mapsto[V_t]$. The covering $SU(d_0)\to PU(d_0)$ gives a continuous lift with $U(0)=I$; its multiplication defect is continuous with values in the discrete central kernel and equals $I$ at $(0,0)$. Thus
$$
U(t+s)=U(t)U(s),
$$
and $t\mapsto U(t)\psi$ is continuous for every $\psi\in\mathcal H_0$. Hence $\{U(t)\}_{t\in\mathbb R}$ is a strongly continuous one-parameter unitary group.

Stone's theorem therefore applies and gives a unique self-adjoint generator $\hat H$ with
$$
U(t)=e^{-i\hat H t/\hbar}
$$
(Stone 1932). For density operators,
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

<a id="theorem-88a-associative-scalar-family-ablation-and-tomographic-defects"></a>**Theorem 8.8a (Associative Scalar-Family Ablation and Tomographic Defects).** For $\mathbb D\in\{\mathbb R,\mathbb C,\mathbb H\}$, the cone of positive Hermitian $n\times n$ matrices over $\mathbb D$ is self-dual and homogeneous and has sharp rank-one contexts. Its real unnormalized dimension is
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
The connected unit-scalar groups are respectively trivial, $U(1)$, and $Sp(1)$. Hence self-duality, homogeneity, and sharpness do not select the complex family; the product-effect isomorphism clause of Theorem 8.4 selects $\mathbb C$ among these three associative scalar families. The exact one-dimensional connected scalar-phase clause of Principle 8.0b supplies a separate selector on this three-family class. Spin-factor, exceptional, reducible, and physical-carrier exclusions still require Principle 8.0b's separate finite record.

*Proof.* The real trace pairing $\operatorname{Re}\operatorname{tr}(AB)$ gives self-duality, and congruence by an invertible matrix acts transitively on the positive-definite cone. Counting real diagonal and off-diagonal coordinates gives (8.8a.1). Direct subtraction gives (8.8a.2)--(8.8a.3). The unit-scalar groups then give the phase classification. ∎

<a id="corollary-88a1-independent-scalar-gate-ablation-on-the-associative-families"></a>**Corollary 8.8a.1 (Independent Scalar-Gate Ablation on the Associative Families).** Fix nontrivial scalar dimensions $m,n\ge2$ and restrict the comparison to $\mathbb D\in\{\mathbb R,\mathbb C,\mathbb H\}$. Then each of the following packages selects $\mathbb C$ without the other:

1. multiplicative compositional closure together with the product-effect isomorphism of Theorem 8.4(ii);
2. the requirement that the identity component of the scalar-unit group be exactly a nontrivial one-dimensional connected group.

If both gates are removed while self-duality, homogeneity, and sharp rank-one contexts are retained, all three scalar families survive. If the exact one-dimensional phase gate is weakened to the existence of some nontrivial connected scalar phase, both $\mathbb C$ and $\mathbb H$ survive; PCE removes the quaternionic surplus generators only after equality of the retained response presheaves has been certified. Thus, on the associative three-family census, the two exact gates are alternative sufficient selectors rather than jointly necessary axioms.

*Proof.* Under the first package, Equations (8.8a.2)--(8.8a.3) show that the canonical product-effect map cannot be an isomorphism for $\mathbb R$ or $\mathbb H$, whereas $D_{\mathbb C}(mn)=D_{\mathbb C}(m)D_{\mathbb C}(n)$. Hence only $\mathbb C$ survives. Under the second package, the identity components of the scalar-unit groups are, respectively, the trivial group, $U(1)$, and $Sp(1)$. Their real dimensions are $0$, $1$, and $3$, so exactly the complex family satisfies the stated phase condition. Removing both conditions leaves the three cones exhibited in Theorem 8.8a. Under the weakened connected-phase condition, $U(1)$ and $Sp(1)$ both qualify. Definition D.8.9a defines response equivalence by equality of all retained finite protocol responses and compares the PCE potential on the resulting quotient classes. Removing phase generators as response-null requires that response-equivalence test; dimension of the phase group alone cannot perform the final quotient. ∎

<a id="theorem-88b-minimal-explicit-informationally-complete-effect-frame-on-mathbb-c8"></a>**Theorem 8.8b (Minimal Explicit Informationally Complete Effect Frame on $\mathbb C^8$).** Fix an orthonormal basis $e_1,\ldots,e_8$. Define the 64 rank-one effects
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

Equations (8.8b.1)--(8.8b.2) provide the rank-complete effect frame and its exact linear reconstruction. For any submitted weight table, acceptance under Definition 8.2b additionally requires the reconstructed matrix to be positive semidefinite with trace one, consistency with every retained linear relation, and the recorded expansions of all retained effects. Physical preparation, implementation, and calibration of all 64 effects remain separate realization records.

<a id="theorem-88c-repeated-trial-frequency-hierarchy"></a>**Theorem 8.8c (Repeated-Trial Frequency Hierarchy).** Let $K_n\in\{0,1\}$ have one-trial probability $P(K_n=1)=p$.

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

<a id="theorem-88d-one-finite-choi-test-is-a-complete-spectator-witness"></a>**Theorem 8.8d (One Finite Choi Test Is a Complete Spectator Witness).** Let $\Phi:M_8(\mathbb C)\to M_d(\mathbb C)$ be the complex-linear extension of a preparation-equivalent normalized update, and let $|\Omega_8\rangle=\sum_{j=1}^8e_j\otimes e_j$. Then
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

<a id="theorem-88d1-finite-preparation-descent-and-k-positivity-normal-form"></a>**Theorem 8.8d.1 (Finite Preparation Descent and $k$-Positivity Normal Form).** Let $\rho_1,\ldots,\rho_N\in\mathcal D(\mathbb C^d)$ be a finite preparation ledger and let $\sigma_1,\ldots,\sigma_N\in\mathcal D(\mathbb C^{d'})$ be its proposed outputs. Define linear maps
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

For the positivity statement, write $\psi=\sum_{\alpha=1}^k x_\alpha\otimes e_\alpha$ and $\phi=\sum_{\alpha=1}^k y_\alpha\otimes e_\alpha$, with $x_\alpha\in\mathbb C^d$ and $y_\alpha\in\mathbb C^{d'}$, and put $v=\sum_{\alpha=1}^k y_\alpha\otimes\overline{x_\alpha}$. The output-input Choi convention gives
$$
\langle\phi,(\Phi\otimes\operatorname{id}_k)(|\psi\rangle\langle\psi|)\phi\rangle
=\sum_{\alpha,\beta=1}^k
\langle y_\alpha,\Phi(|x_\alpha\rangle\langle x_\beta|)y_\beta\rangle
=\langle v,J(\Phi)v\rangle.
$$
The vector $v$ has Schmidt rank at most $k$, and every vector of Schmidt rank at most $k$ has such a representation. Thus (8.8d.1.2) is equivalent to nonnegativity of every quadratic form of $(\Phi\otimes\operatorname{id}_k)(|\psi\rangle\langle\psi|)$. Spectral decomposition of an arbitrary positive input then proves equivalence with $k$-positivity. At $k=d$, every vector in $\mathbb C^{d'}\otimes\mathbb C^d$ has Schmidt rank at most $d$, so block positivity is ordinary positivity of $J(\Phi)$, and the Kraus argument of Theorem 8.8d gives complete positivity. The partial-trace identity is Equation (8.8d.2). ∎

<a id="theorem-88e-measurable-transition-isometry-semigroups-lift-to-unitary-groups"></a>**Theorem 8.8e (Measurable Transition-Isometry Semigroups Lift to Unitary Groups).** Let $2\le d<\infty$ and let $\{\mathcal T_t\}_{t\ge0}$ be a semigroup of maps on the rays of $\mathbb C^d$ with $\mathcal T_0=\mathrm{id}$. Assume every $\mathcal T_t$ preserves all transition probabilities and $t\mapsto\mathcal T_t([\psi])$ is Borel measurable for every ray. Then every $\mathcal T_t$ is onto, the semigroup extends uniquely to a measurable group on $\mathbb R$, and it has a strongly continuous unitary lift
$$
U(t)=e^{-iHt/\hbar}.
\tag{8.8e.1}
$$

*Proof.* Transition-probability preservation makes each $\mathcal T_t$ an isometry of compact projective space. An isometric self-embedding of a compact metric space is onto: otherwise, if $x$ has positive distance from the image, the iterates of $x$ form an infinite uniformly separated set, contradicting compactness. Define $\mathcal T_{-t}=\mathcal T_t^{-1}$. The semigroup law gives a measurable one-parameter group of projective isometries. Wigner's theorem in Bargmann's formulation (Bargmann 1964) supplies unitary or antiunitary implementers. Divisibility gives zero antiunitary parity because the parity at $t$ is twice the parity at $t/2$. A measurable homomorphism into the finite-dimensional projective unitary group is continuous; the finite-dimensional phase-lift construction in the proof of Theorem 8.5 supplies a strongly continuous unitary group. Stone's theorem (Stone 1932) gives (8.8e.1). ∎

This resolves the finite-dimensional measurable-semigroup lift. Identifying the group parameter with a physical clock and $H$ with calibrated energy still requires Theorem 7.6c and Theorem 29.

<a id="theorem-88e1-channel-level-transition-realization-and-purity-preserving-semigroup-census"></a>**Theorem 8.8e.1 (Channel-Level Transition Realization and Purity-Preserving Semigroup Census).** Let $2\le d<\infty$ and let $(\mathcal E_t)_{t\ge0}$ be CPTP maps on $M_d(\mathbb C)$ such that
$$
\mathcal E_0=\operatorname{id},
\qquad
\mathcal E_{t+s}=\mathcal E_t\circ\mathcal E_s,
\qquad
t\longmapsto\operatorname{tr}\bigl(A\,\mathcal E_t(\rho)\bigr)\ \text{is Borel measurable}
\tag{8.8e.1.1}
$$
for all $s,t\ge0$, $A\in M_d(\mathbb C)$ and density operators $\rho$, and assume that every $\mathcal E_t$ maps pure states to pure states. For unit vectors $\psi,\phi$ register the constant preparation $\mathcal P_\psi(\tau)=\tau|\psi\rangle\!\langle\psi|$, the binary verification instrument $\mathcal I_{\phi,1}(Y)=P_\phi YP_\phi$, $\mathcal I_{\phi,0}(Y)=(I-P_\phi)Y(I-P_\phi)$ with $P_\phi=|\phi\rangle\!\langle\phi|$, and the transition response
$$
p_t(\phi\mid\psi)
:=\operatorname{tr}\mathcal I_{\phi,1}\bigl(\mathcal E_t(\mathcal P_\psi(1))\bigr)
=\langle\phi,\mathcal E_t(|\psi\rangle\!\langle\psi|)\phi\rangle .
\tag{8.8e.1.2}
$$
Then exactly one of the following holds.

1. **Reset branch.** There is a unit vector $w$ with $\mathcal E_t(\rho)=|w\rangle\!\langle w|$ for every $t>0$ and every density operator $\rho$, so $p_t(\phi\mid\psi)=|\langle\phi,w\rangle|^2$ for $t>0$ independently of $\psi$.
2. **Unitary branch.** There is a strongly continuous unitary group $U(t)=e^{-iHt/\hbar}$ with $\mathcal E_t(\rho)=U(t)\rho U(t)^\dagger$ for every $t\ge0$. The ray maps $\mathcal T_t[\psi]=[U(t)\psi]$ satisfy every premise of Theorem 8.8e, $[U(t)\psi]$ is the unique ray $[\phi]$ with $p_t(\phi\mid\psi)=1$, and
$$
p_t(\phi\mid\psi)=|\langle\phi,U(t)\psi\rangle|^2 .
\tag{8.8e.1.3}
$$

The unitary branch holds exactly when some $\mathcal E_t$ with $t>0$ is injective, equivalently when $\operatorname{tr}(A\,\mathcal E_t(\rho))\to\operatorname{tr}(A\rho)$ as $t\downarrow0$ for all $A$ and $\rho$. Every self-adjoint $H$ on $\mathbb C^d$ populates the unitary branch through $\mathcal E_t=U(t)(\cdot)U(t)^\dagger$, and every unit vector $w$ populates the reset branch. The depolarizing semigroup $\mathcal E_t(X)=e^{-\gamma t}X+(1-e^{-\gamma t})\operatorname{tr}(X)I_d/d$ with $\gamma>0$ satisfies (8.8e.1.1) and is continuous, while every output at $t>0$ has full rank. Hence purity preservation is independent of the semigroup, complete-positivity and continuity clauses, and the reset branch shows that the non-reset clause is independent of the remaining ones. On the selected carrier $\mathcal H_0\cong\mathbb C^8$, Theorem 8.8e.1 is the formal transition-law realization: channel-level complete positivity, measurability, purity preservation and non-reset imply the premises of Theorem 8.8e, and the prepare--evolve--verify protocol (8.8e.1.2) realizes the transition law (8.8e.1.3).

*Proof.* Let $\mathcal E(X)=\sum_{i=1}^rK_iXK_i^\dagger$ be CPTP on $M_d(\mathbb C)$ with linearly independent Kraus operators, and suppose $\mathcal E$ maps pure states to pure states. For every unit $\psi$, $\sum_i|K_i\psi\rangle\!\langle K_i\psi|$ has rank at most one, so the vectors $K_i\psi$ are collinear. Let $K,K'$ be linear maps with $K\psi$ and $K'\psi$ collinear for every $\psi$ and $\operatorname{rank}K\ge2$. On $\{\psi:K\psi\ne0\}$ write $K'\psi=\lambda(\psi)K\psi$. If $K\psi$ and $K\phi$ are independent, expanding $K'(\psi+\phi)$ gives $\lambda(\psi)=\lambda(\psi+\phi)=\lambda(\phi)$; if they are dependent and nonzero, a vector $\chi$ with $K\chi$ independent of $K\psi$ gives $\lambda(\psi)=\lambda(\chi)=\lambda(\phi)$. Thus $\lambda$ is a constant, and for $\psi\in\ker K$ and $K\phi\ne0$, $K'\psi=K'(\psi+\phi)-K'\phi=\lambda K\psi=0$. Hence $K'=\lambda K$. If some $K_i$ has rank at least two, this and linear independence give $r=1$, and trace preservation makes $K_1$ unitary. Otherwise every $K_i=|w_i\rangle\!\langle z_i|$ has rank one; collinearity at a vector with $\langle z_i,\psi\rangle\langle z_j,\psi\rangle\ne0$ gives a common range $\mathbb Cw$, and trace preservation gives $\mathcal E(X)=\operatorname{tr}(X)|w\rangle\!\langle w|$. For $d\ge2$ a unitary channel is injective and a replacement channel is not, so the two cases are exclusive.

Let $R=\{t>0:\mathcal E_t\text{ is a replacement channel}\}$. If $t\in R$, then $\mathcal E_{t+s}=\mathcal E_t\circ\mathcal E_s$ is a replacement channel for every $s\ge0$, and $t/2\in R$ because two unitary channels compose to a unitary channel. Hence $R\ne\varnothing$ implies $R=(0,\infty)$. Then $\mathcal E_{t+s}=\mathcal E_s\circ\mathcal E_t$ shows that the output ray at time $t+s$ equals the output ray at time $s$, so it is constant; this is the reset branch. If $R=\varnothing$, each $\mathcal E_t$ with $t>0$ is $V_t(\cdot)V_t^\dagger$ for a unitary $V_t$ unique up to phase. The ray maps $[\psi]\mapsto[V_t\psi]$ preserve transition probabilities and form a semigroup. The map $[\psi]\mapsto|\psi\rangle\!\langle\psi|$ is a homeomorphism of projective space onto the rank-one projections, and the matrix entries of $\mathcal E_t(|\psi\rangle\!\langle\psi|)$ are measurable in $t$ by (8.8e.1.1); hence the ray maps are Borel measurable. Theorem 8.8e supplies the strongly continuous unitary lift $U(t)=e^{-iHt/\hbar}$, and because pure states span $M_d(\mathbb C)$, $\mathcal E_t=U(t)(\cdot)U(t)^\dagger$. Substitution in (8.8e.1.2) gives (8.8e.1.3), and $p_t(\phi\mid\psi)=1$ exactly when $\phi\in\mathbb C\,U(t)\psi$.

A replacement channel is not injective, and for a unit vector $w^\perp\perp w$ it gives $\operatorname{tr}(P_{w^\perp}\mathcal E_t(P_{w^\perp}))=0$ for every $t>0$, whereas a strongly continuous unitary group is injective and weakly continuous at zero. The populating semigroups are direct, and the depolarizing output $e^{-\gamma t}P_\psi+(1-e^{-\gamma t})I_d/d$ has smallest eigenvalue $(1-e^{-\gamma t})/d>0$. ∎

<a id="theorem-88f-dimension-uniform-finite-matrix-ccr-obstruction"></a>**Theorem 8.8f (Dimension-Uniform Finite-Matrix CCR Obstruction).** For every pair of $d\times d$ matrices $X_d,P_d$ and every $\hbar>0$,
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

<a id="theorem-88f1-strongly-continuous-weyl-successor-on-the-schrödinger-carrier"></a>**Theorem 8.8f.1 (Strongly Continuous Weyl Successor on the Schrödinger Carrier).** On $\mathcal H_\infty=L^2(\mathbb R)$ define
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
which is (8.8f.1.2). Dominated convergence on $C_c^\infty(\mathbb R)$ proves strong continuity of translations; density and unitarity extend it to $L^2(\mathbb R)$. For the multipliers, $|e^{ibx/\hbar}-1|\le2$ and dominated convergence prove strong continuity directly on $L^2$.

The generators from Stone's theorem (Stone 1932) satisfy
$$
U(a)=e^{-iaP/\hbar},\qquad V(b)=e^{ibX/\hbar},
\qquad
D(P)=\{\psi\in L^2:\psi'\in L^2\},\qquad
D(X)=\{\psi\in L^2:x\psi\in L^2\},
$$
where $\psi'$ is the distributional derivative. To identify $D(P)$, testing a translation difference quotient against compactly supported smooth functions shows that an $L^2$ derivative of $U(a)\psi$ at zero must be $-\psi'$. Conversely, if $\psi'\in L^2$, distributional integration gives the $L^2$ identity
$$
U(a)\psi-\psi=-\int_0^a U(s)\psi'\,ds.
$$
Strong continuity of $U$ makes the difference quotient tend to $-\psi'$. For $V$, the pointwise difference quotient tends to $ix\psi/\hbar$; dominated convergence applies when $x\psi\in L^2$. Conversely, an $L^2$ limit has a pointwise convergent subsequence, forcing that same value and hence $x\psi\in L^2$. Thus $P\psi=-i\hbar\psi'$ and $X\psi=x\psi$ on the displayed domains.

For either graph norm, multiply a domain vector by smooth cutoffs $\chi_R$ that equal one on $[-R,R]$, have compact support, and satisfy $\|\chi_R'\|_\infty=O(R^{-1})$. Dominated convergence gives graph-norm convergence for $X$; for $P$, use $(\chi_R\psi)'=\chi_R\psi'+\chi_R'\psi$ and $\|\chi_R'\psi\|_2\le\|\chi_R'\|_\infty\|\psi\|_2$. Mollifying each compactly supported cutoff approximation gives convergence of both the function and its weak derivative for $P$, and gives graph convergence for $X$ because the supports remain bounded. Hence $C_c^\infty\subset\mathcal S$ is a core for each generator, so the restrictions to $\mathcal S$ have the stated self-adjoint closures. Translation, phase multiplication, $X$ and $P$ preserve $\mathcal S$. On this common invariant core,
$$
(XP-PX)\psi
=-i\hbar x\psi'+i\hbar(x\psi)'
=i\hbar\psi.
$$
Finally, the spectral theorem and $|e^{it}-1|\le|t|$ give both bounds in (8.8f.1.4). ∎

This construction supplies an exact infinite-dimensional canonical pair and its domain and within-carrier strong-continuity controls. A strong-limit claim from finite PU carriers requires a separate directed carrier family, finite-to-infinite intertwiner, and quantitative response-convergence certificate. Admission of $\mathcal H_\infty$ as an effective PU response carrier additionally requires a certificate identifying the group parameters with physical translations and calibrated response observables.

<a id="theorem-88f2-directed-hermite-carriers-and-quantitative-weyl-response-convergence"></a>**Theorem 8.8f.2 (Directed Hermite Carriers and Quantitative Weyl-Response Convergence).** Fix $\ell>0$ and let
$$
h_k(x)=\bigl(2^kk!\sqrt\pi\,\ell\bigr)^{-1/2}H_k(x/\ell)\,e^{-x^2/(2\ell^2)}
\qquad(k\ge0)
$$
be the Hermite orthonormal basis of $L^2(\mathbb R)$, with $H_k$ the Hermite polynomials. On $\mathcal S(\mathbb R)$ put $a=(X/\ell+i\ell P/\hbar)/\sqrt2$ and $N_{\mathrm{op}}=a^\dagger a$, so that $ah_k=\sqrt k\,h_{k-1}$ and $a^\dagger h_k=\sqrt{k+1}\,h_{k+1}$. For $N\ge1$ let $\mathcal H_N=\mathbb C^N$ have basis $e_0,\ldots,e_{N-1}$, and define
$$
J_Ne_k=h_k,
\qquad
\iota_{N,M}e_k=e_k\quad(N\le M),
\qquad
\Pi_N=J_NJ_N^*,
\tag{8.8f.2.1}
$$
$$
a_N=\sum_{k=1}^{N-1}\sqrt k\,|e_{k-1}\rangle\!\langle e_k|,
\qquad
X_N=\frac{\ell}{\sqrt2}\bigl(a_N+a_N^\dagger\bigr),
\qquad
P_N=\frac{i\hbar}{\sqrt2\,\ell}\bigl(a_N^\dagger-a_N\bigr),
\tag{8.8f.2.2}
$$
and $W_N(u,v)=e^{i(vX_N-uP_N)/\hbar}$. On the Schrödinger carrier of Theorem 8.8f.1 let
$$
(W(u,v)\psi)(x)=e^{-iuv/(2\hbar)}e^{ivx/\hbar}\psi(x-u),
$$
so that $W(u,0)=U(u)$, $W(0,v)=V(v)$, and $s\mapsto W(su,sv)$ is the strongly continuous unitary group generated by the closure of $vX-uP$ on $\mathcal S(\mathbb R)$. Then:

1. **Directed carrier and intertwiners.** Each $J_N$ is an isometry, $J_M\iota_{N,M}=J_N$, $X_N=J_N^*XJ_N$, $P_N=J_N^*PJ_N$, $\iota_{N,M}^*X_M\iota_{N,M}=X_N$, $\iota_{N,M}^*P_M\iota_{N,M}=P_N$, and $\bigcup_NJ_N\mathcal H_N$ is dense. Indexing $\mathbb C^8$ by $e_0,\ldots,e_7$, the identification $e_{j_1}\otimes\cdots\otimes e_{j_k}\mapsto e_{\sum_rj_r8^{r-1}}$ of $(\mathbb C^8)^{\otimes k}$ with $\mathcal H_{8^k}$ turns $\iota_{8^k,8^{k+1}}$ into $\xi\mapsto\xi\otimes e_0$.
2. **Finite commutator.**
$$
[X_N,P_N]=i\hbar\bigl(I_N-N|e_{N-1}\rangle\!\langle e_{N-1}|\bigr).
\tag{8.8f.2.3}
$$
Its trace vanishes, and its defect $-i\hbar N|e_{N-1}\rangle\!\langle e_{N-1}|$ has operator norm $\hbar N$, in agreement with the lower bound of Theorem 8.8f. For every $\psi\in\mathcal S(\mathbb R)$,
$$
\bigl\|J_N[X_N,P_N]J_N^*\psi-i\hbar\psi\bigr\|
\le\frac{2\hbar}{N}\bigl\|(N_{\mathrm{op}}+1)^2\psi\bigr\|.
\tag{8.8f.2.4}
$$
3. **Quantitative Weyl-response convergence.** For $\psi\in\mathcal S(\mathbb R)$, $u,v\in\mathbb R$ and $\kappa=\bigl(u^2/(2\ell^2)+v^2\ell^2/(2\hbar^2)\bigr)^{1/2}$,
$$
\bigl\|J_NW_N(u,v)J_N^*\psi-W(u,v)\psi\bigr\|
\le(1+\kappa)^3N^{-1/2}\bigl\|(N_{\mathrm{op}}+1)\psi\bigr\|.
\tag{8.8f.2.5}
$$
Consequently $J_NW_N(u,v)J_N^*\to W(u,v)$ strongly, uniformly for $(u,v)$ in compact sets; $J_NX_NJ_N^*\to X$ and $J_NP_NJ_N^*\to P$ in the strong resolvent sense; the Weyl response $\langle J_N^*\psi,W_N(u,v)J_N^*\psi\rangle$ converges to $\langle\psi,W(u,v)\psi\rangle$ with error at most $\|\psi\|$ times the right side of (8.8f.2.5); and for a unit vector $\psi$ the laws of $X_N$ and $P_N$ in $J_N^*\psi/\|J_N^*\psi\|$, defined once $J_N^*\psi\ne0$, converge weakly to the Schrödinger position and momentum laws of $\psi$.

*Proof.* The recursions $Xh_k=\ell(\sqrt k\,h_{k-1}+\sqrt{k+1}\,h_{k+1})/\sqrt2$ and $Ph_k=i\hbar(\sqrt{k+1}\,h_{k+1}-\sqrt k\,h_{k-1})/(\sqrt2\,\ell)$ make $X$ and $P$ tridiagonal in the Hermite basis, so their compressions to $\operatorname{span}\{h_0,\ldots,h_{N-1}\}$ are (8.8f.2.2) and are compatible along $\iota_{N,M}$. Orthonormality and completeness of the Hermite functions give the isometry and density statements, and the base-eight index of $\xi\otimes e_0$ equals that of $\xi$.

For item 2, $a_Na_N^\dagger=\operatorname{diag}(1,\ldots,N-1,0)$ and $a_N^\dagger a_N=\operatorname{diag}(0,1,\ldots,N-1)$, while $[X_N,P_N]=i\hbar[a_N,a_N^\dagger]$; this is (8.8f.2.3). With $c_m=\langle h_m,\psi\rangle$,
$$
J_N[X_N,P_N]J_N^*\psi-i\hbar\psi=-i\hbar(I-\Pi_N)\psi-i\hbar Nc_{N-1}h_{N-1}.
$$
Since $(m+1)^2\ge N^2$ for $m\ge N-1$, both $\|(I-\Pi_N)\psi\|$ and $N|c_{N-1}|$ are at most $N^{-1}\|(N_{\mathrm{op}}+1)^2\psi\|$, which gives (8.8f.2.4).

For item 3, put $G=vX-uP=\gamma a+\bar\gamma a^\dagger$ with $\gamma=(v\ell+iu\hbar/\ell)/\sqrt2$, so $|\gamma|=\hbar\kappa$, and put $A_N=J_N(vX_N-uP_N)J_N^*=\Pi_NG\Pi_N$. Then $e^{iA_N/\hbar}=J_NW_N(u,v)J_N^*+(I-\Pi_N)$. For $\xi\in\mathcal S(\mathbb R)$, with $\Pi_0=0$,
$$
(G-A_N)\xi=(I-\Pi_N)G(I-\Pi_{N-1})\xi+\gamma\sqrt N\,\langle h_N,\xi\rangle h_{N-1}.
$$
Because $\|a\eta\|,\|a^\dagger\eta\|\le\|(N_{\mathrm{op}}+1)^{1/2}\eta\|$ and $m+1\ge N$ on the range of $I-\Pi_{N-1}$, this gives $\|(G-A_N)\xi\|\le3|\gamma|N^{-1/2}\|(N_{\mathrm{op}}+1)\xi\|$. The operators $\mathcal W_s:=W(su,sv)$ preserve $\mathcal S(\mathbb R)$, are strongly differentiable there with derivative $iG\mathcal W_s/\hbar$, and satisfy $\mathcal W_s^*X\mathcal W_s=X+su$ and $\mathcal W_s^*P\mathcal W_s=P+sv$; invariance of this dense domain identifies their generator with the closure of $G$ (Reed and Simon 1980, §VIII.4). Hence $\mathcal W_s^*a\mathcal W_s=a+s\beta$ with $\beta=(u/\ell+i\ell v/\hbar)/\sqrt2$ and $|\beta|=\kappa$, so
$$
\mathcal W_s^*(N_{\mathrm{op}}+1)\mathcal W_s=N_{\mathrm{op}}+1+s\beta a^\dagger+s\bar\beta a+s^2\kappa^2,
\qquad
\|(N_{\mathrm{op}}+1)\mathcal W_s\psi\|\le(1+s\kappa)^2\|(N_{\mathrm{op}}+1)\psi\|.
$$
Differentiating $s\mapsto e^{i(1-s)A_N/\hbar}\mathcal W_s\psi$ gives Duhamel's identity
$$
W(u,v)\psi-e^{iA_N/\hbar}\psi
=\frac i\hbar\int_0^1e^{i(1-s)A_N/\hbar}(G-A_N)\mathcal W_s\psi\,ds,
$$
so $\|W(u,v)\psi-e^{iA_N/\hbar}\psi\|\le3\kappa N^{-1/2}\int_0^1(1+s\kappa)^2ds\,\|(N_{\mathrm{op}}+1)\psi\|=\bigl((1+\kappa)^3-1\bigr)N^{-1/2}\|(N_{\mathrm{op}}+1)\psi\|$. Adding $\|(I-\Pi_N)\psi\|\le(N+1)^{-1}\|(N_{\mathrm{op}}+1)\psi\|$ proves (8.8f.2.5). Uniform boundedness and density of $\mathcal S(\mathbb R)$ give strong convergence on $L^2(\mathbb R)$, uniformly on compact parameter sets. At $u=0$ and at $v=0$, $e^{iA_N/\hbar}$ equals $e^{ivJ_NX_NJ_N^*/\hbar}$ and $e^{-iuJ_NP_NJ_N^*/\hbar}$, and the Duhamel bound makes these groups converge strongly to $V(v)$ and $U(u)$ for every parameter; this is strong resolvent convergence (Reed and Simon 1980, Theorem VIII.21). The response bound follows from the Cauchy--Schwarz inequality, and Lévy's continuity theorem converts pointwise convergence of the characteristic functions $v\mapsto\langle\psi,V(v)\psi\rangle$ and $u\mapsto\langle\psi,U(u)\psi\rangle$ into weak convergence of the laws. ∎

<a id="theorem-88f3-mechanical-weyl-translations-and-finite-rail-observables"></a>**Theorem 8.8f.3 (Mechanical Weyl Translations and Finite Rail Observables).** Register the following ideal nonrelativistic harmonic-particle, oscillator-rail and clocked-control source class. Its mechanical input data are a mass $m>0$, angular frequency $\Omega>0$, action unit $\hbar>0$, distance and time standards, and the calibrated moving-trap law below. Its rail inputs are positive mode frequencies, quadratic mode-mixing controls, cross-Kerr pointer controls and occupation instruments. A prescribed-time service supplies each finite control word and its independently calibrated coefficients. Ready states, detectors, records and the clock/drive service have their own finite resource records. These source equations and services are physical-theory inputs; the theorem derives their translation and response maps.

Put
$$
\ell=\sqrt{\frac{\hbar}{m\Omega}},\qquad
\tau=\frac{2\pi}{\Omega},\qquad
H_0=\frac{P^2}{2m}+\frac{m\Omega^2X^2}{2}
=\hbar\Omega(N_{\mathrm{op}}+1/2).
\tag{8.8f.3.1}
$$
Here $X$ is the particle's position, $P$ its momentum and $\tau$ a physical time interval. The Schrödinger realization has exactly the Hermite functions of Theorem 8.8f.2 at this $\ell$. Fix any finite requested displacement $u$ and momentum change $v$. The same source family covers all real $u,v$, every finite $N\ge1$, and all supplied Schwartz inputs. Finite preparations, control resources and approximation bounds are specified below.

1. **Finite mechanical translation with its central phase.** Let a degenerate two-level probe have $Q=|1\rangle\langle1|$. Its controlled moving-trap Hamiltonian is
$$
H(t)=H_0\otimes I-X\otimes Q\,f(t)
+I\otimes Q\,\frac{f(t)^2}{2m\Omega^2}.
\tag{8.8f.3.2}
$$
The driven arm has the positive potential $m\Omega^2[X-q_c(t)]^2/2$ with $q_c=f/(m\Omega^2)$; the other arm has $q_c=0$. The declared actuator owns the force and the work of moving this center. On $0\le t\le\tau$ set
$$
\begin{aligned}
f(t)&=(1-\cos\Omega t)(A\sin\Omega t+B\cos\Omega t),\\
A&=-\frac{m\Omega^2u}{\pi},\qquad B=\frac{\Omega v}{\pi}.
\end{aligned}
\tag{8.8f.3.3}
$$
The center and its velocity vanish at both endpoints. The induced displacement trajectory and momentum trajectory are
$$
q(t)=\frac1{m\Omega}\int_0^t f(s)\sin\Omega(t-s)\,ds,\qquad
p(t)=\int_0^t f(s)\cos\Omega(t-s)\,ds,
\qquad (q(\tau),p(\tau))=(u,v).
\tag{8.8f.3.4}
$$
Thus $u$ is an actual endpoint translation and $v$ an actual net momentum boost, with boost velocity $v/m$. The momentum change includes the restoring force. For this waveform $\int_0^\tau f(t)dt=-v$, so the external force integral alone is a different quantity.

On the Schwartz core, the linear interaction-picture commutator is scalar. The exact full-period propagator is
$$
U_{\mathrm{trap}}(\tau)
=-\left[I\otimes(I-Q)+e^{i\chi}W(u,v)\otimes Q\right],\qquad
\chi=-\frac{\pi(15A^2+11B^2)}{24m\hbar\Omega^3}.
\tag{8.8f.3.5}
$$
The common minus sign is the harmonic free propagator on both arms. A positive-duration probe phase $e^{-i\chi Q}$ removes the relative scalar; a principal representative of $\chi$ has norm action at most $\pi\hbar$. Its setting, winding convention and source work are retained. Consequently the source realizes the precise complex Weyl operator of Theorem 8.8f.2, including its central phase, and
$$
W(u,v)^*XW(u,v)=X+uI,\qquad
W(u,v)^*PW(u,v)=P+vI.
\tag{8.8f.3.6}
$$
The special settings $(u,0)$ and $(0,v)$ realize Theorem 8.8f.1's physical translation and momentum-boost groups. Their commutator loop retains $e^{-iuv/\hbar}$ in an interferometric response.

2. **Energy-matched finite rails.** Fix one common $\nu>0$ for the directed family and put $\nu_N=\nu$ for every $N$. Supply $N$ bosonic rails $c_0,\ldots,c_{N-1}$ with the normal-ordered free Hamiltonian
$$
H_N^0=\hbar\sum_{n=0}^{N-1}(\nu_N+n\Omega)c_n^\dagger c_n,
\qquad \nu_N>0,\qquad
S_Ne_n=c_n^\dagger|\mathrm{vac}\rangle.
\tag{8.8f.3.7}
$$
The admitted code has one total excitation. Its exact observable and energy restrictions are
$$
\begin{aligned}
S_N^*c_j^\dagger c_kS_N&=|e_j\rangle\langle e_k|,\\
S_N^*H_N^0S_N&=\hbar\nu_N I+\hbar\Omega N_N,\quad
N_N=\operatorname{diag}(0,\ldots,N-1),\\
J_N^*H_0J_N&=S_N^*H_N^0S_N-\hbar(\nu_N-\Omega/2)I.
\end{aligned}
\tag{8.8f.3.8}
$$
The last equality is an explicit energy-reference map. The positive stored rail baseline remains a physical resource. Quadratic pair couplings and number phases restrict to their finite matrix units, so the physical nearest-neighbor operator $\sum_{n=1}^{N-1}\sqrt n\,c_{n-1}^\dagger c_n$ restricts exactly to $a_N$. Its two Hermitian quadratures give the calibrated $X_N$ and $P_N$ of (8.8f.2.2).

For $G_N=vX_N-uP_N$, define $R_N(t)=\exp[-it(\nu_NI+\Omega N_N)]$. If $T$ is a positive integer multiple of $\tau$, let $s_T(t)=3(t/T)^2-2(t/T)^3$ on $[0,T]$ and use the physical quadratic coupling matrix
$$
C_N(t)=-\dot s_T(t)R_N(t)G_NR_N(t)^*.
\tag{8.8f.3.9}
$$
The physical control is $\sum_{j,k}(C_N(t))_{jk}c_j^\dagger c_k$; its matrix elements are the prescribed real and imaginary beam-splitter couplings. The pulse is zero at both endpoints. In the exact free interaction picture its Hamiltonian is $-\dot s_TG_N$, so the code endpoint is $e^{-i\nu_NT}W_N(u,v)$. No rotating-wave approximation enters this equality. With $\kappa$ as in Theorem 8.8f.2,
$$
\|G_N\|\le2\hbar\kappa\sqrt{N-1},\qquad
\int_0^T\|C_N(t)\|dt=\|G_N\|,
\qquad
\max_t\|C_N(t)\|\le\frac{3\hbar\kappa\sqrt{N-1}}T.
\tag{8.8f.3.10}
$$
These norms refer to the one-excitation code. Choose
$$
T_N=\tau\left[1+\left\lceil\frac{3\kappa\sqrt{N-1}}{\nu_N\tau}\right\rceil\right].
\tag{8.8f.3.11}
$$
Then the full one-particle coefficient matrix of $H_N^0+C_N(t)$ is positive, and its second-quantized Hamiltonian is nonnegative on every occupation sector. Each source member has finite coefficients and positive duration. Larger cutoffs retain their actual rail count, duration and baseline energy.

3. **Complete finite observable meters.** Write $Q_N=X_N/\ell$. Its characteristic polynomial is $2^{-N}H_N(z)$, so its real simple eigenvalues $\lambda_j$ provide the finite length labels $x_j=\ell\lambda_j$. If $O_N^*Q_NO_N=\operatorname{diag}(\lambda_j)$, mode mixing by $O_N^*$ followed by occupation readout measures $X_N$. With $D_N=\operatorname{diag}(i^n)$,
$$
P_N=\frac{\hbar}{\ell^2}D_NX_ND_N^*,
\tag{8.8f.3.12}
$$
so mixing by $O_N^*D_N^*$ and reading occupations measures $P_N$ with labels $p_j=\hbar\lambda_j/\ell$. The zero- and multiple-excitation sectors retain a separate code-failure leaf. If a Lüders endpoint is retained, apply the inverse mixing after the occupation instrument; a destructive or measure-and-transform endpoint retains its actual different operation label.

Every finite unitary mode matrix is synthesized by at most $N(N-1)/2$ adjacent two-mode Givens rotations and $N$ number phases. An elementary Hermitian logarithm can have norm at most $\pi$, and its exact co-rotating pulse runs for an integer number of oscillator periods. This implements every finite pure-state preparation and every finite basis rotation. Recorded classical mixtures give mixed preparations, with their preparation records assigned to the declared source cut. The basis projectors and the projectors onto $(e_j+e_k)/\sqrt2$ and $(e_j+ie_k)/\sqrt2$ form a separating response family. The finite code therefore carries its full matrix algebra, including spectator-entangled states.

The physical meter of $X_N$ is its finite spectral meter. It differs at finite $N$ from a mechanical sharp-position POVM compressed by $J_N$. Their relation is the weak convergence already proved in Theorem 8.8f.2, with the source unit map (8.8f.3.1). The same distinction applies to momentum.

4. **Common characteristic instrument and retained clock.** The continuum probe is prepared in $|+\rangle$. After (8.8f.3.5) and its phase correction, its $X$ or $Y$ readout gives the complete oscillator leaves
$$
K_{X,\pm}=\frac{I\pm W(u,v)}2,\qquad
K_{Y,\pm}=\frac{I\mp iW(u,v)}2,
\qquad \sum_{\pm}K_{r,\pm}^*K_{r,\pm}=I.
\tag{8.8f.3.13}
$$
Their binary means are the real and imaginary parts of $\operatorname{tr}(\rho W)$, respectively. Their output states and every outcome are retained.

For the finite source use $2N$ rails $c_{a,n}$, $a\in\{0,1\}$, with exactly one total excitation and equal frequency $\nu_N+n\Omega$ in both arms. Pairwise arm mixing realizes $|+\rangle\otimes\psi$. Apply (8.8f.3.9) in arm $1$ and leave arm $0$ free. At $T_N$ their common free scalar cancels, giving the controlled $W_N$ exactly by quadratic couplings. Arm $X/Y$ rotations supply the same leaves (8.8f.3.13) with $W$ replaced by $W_N$.

A fresh dual-rail pointer $B$ has one excitation, equal rail frequency $\mu>0$ and ready value $0$. On the finite code let $Q_{\mathrm{arm}}=\sum_n c_{1,n}^\dagger c_{1,n}$; its values are $0,1$. The positive cross-Kerr pulse with integrated generator $\pi\hbar Q_{\mathrm{arm}}n_{B1}$, between pointer Hadamards, copies the arm value without resolving $n$. For the continuum use the probe projector $Q$ in that same pointer interaction. Reading both pointer occupations preserves all mode coherences inside each outcome leaf. Conditional arm/probe exchange restores its ready value while the pointer outcome remains isolated and retained. That restoration transfers no information out of the complete record.

Every auxiliary control uses a positive common slot $T_g$ that is an integer multiple of $\tau$, large enough to keep the applicable rail one-particle matrices positive. One sufficient choice for generators of norm at most $\pi$ is
$$
T_g=\tau\left[1+\left\lceil\frac{3\pi}{2\min(\nu_N,\mu)\tau}\right\rceil\right],\qquad
L_N=T_N+9T_g.
\tag{8.8f.3.14}
$$
The nine auxiliary slots are probe/arm preparation, scalar phase correction, $S^\dagger$ or identity, Hadamard, pointer Hadamard, cross-Kerr copy, pointer Hadamard, the declared detector service and conditional exchange or identity. Empty controls keep their reserved slot. All coefficients are installed before the input-state boundary; any earlier command/installation latency is a separate recorded preparation interval. The continuum force runs for $\tau$ and is padded to $T_N$ by whole free periods. Every other slot is also a whole free period, so mechanical free drift at retained boundaries is scalar. Both implementations release their binary record at the same $L_N$ for the compared $N$ and setting. Intermediate clock and drive records have the specified private cut; an additional mid-pulse observation is a different protocol.

At a finite word of such queries, each completed pointer is isolated and fresh pointers are supplied for later queries. All operation leaves, their outcome marginalization and all spectator extensions follow the same physical/logical isometries. The record labels, positive latencies and resource owners are included in those maps.

5. **Realization and approximation record.** The code map $S_N$ exactly intertwines the finite physical generators, meter leaves and state/effect pairings with their finite logical versions. The separate Hermite map $J_N$ identifies $X_N$ and $P_N$ with mechanical compressions and supplies the established response convergence; its finite gates and meters retain that comparison relation to the uncompressed mechanical operations. Equation (8.8f.3.8) supplies the exact energy-reference map. Appending vacuum rails realizes $\iota_{N,M}$, and $J_M\iota_{N,M}=J_N$. At $N=8^k$ the accepted base-eight identification of Theorem 8.8f.2 preserves the full response algebra of $(\mathbb C^8)^{\otimes k}$, including entanglement and the embedding $\xi\mapsto\xi\otimes e_0$. This is the physical realization of that accepted response carrier; substrate selection and minimality remain with their own owners.

For a unit Schwartz vector put $M_s=\|(N_{\mathrm{op}}+1)^s\psi\|$, $\delta_N=\|(I-\Pi_N)\psi\|$ and $r_N=\|\Pi_N\psi\|$. When $r_N>0$, prepare the finite state with coefficients $J_N^*\psi/r_N$. Then
$$
\delta_N\le\frac{M_s}{(N+1)^s},\qquad
\frac12\bigl\||\psi\rangle\langle\psi|-|\psi_N\rangle\langle\psi_N|\bigr\|_1=\delta_N,
\quad \psi_N=\Pi_N\psi/r_N,
\tag{8.8f.3.15}
$$
and the normalized physical characteristic response obeys
$$
\left|\left\langle\frac{J_N^*\psi}{r_N},W_N(u,v)\frac{J_N^*\psi}{r_N}\right\rangle
-\langle\psi,W(u,v)\psi\rangle\right|
\le\frac{(1+\kappa)^3M_1}{\sqrt N}+\delta_N^2.
\tag{8.8f.3.16}
$$
Each binary characteristic probability differs by at most half this bound. The original strong commutator estimate and its rank-one defect $-i\hbar N|e_{N-1}\rangle\langle e_{N-1}|$ remain exact. The spectral laws have the inherited weak limit. These convergence statements apply to the extracted observables; rail inventory, controller cost and cutoff-dependent clock records keep their own values. $J_N$ is the formal comparison isometry, without an asserted executed rail-to-mechanical converter. Supplied Schwartz states have finite moments used by these bounds. A finite circuit prepares each specified finite truncation; the theorem makes no finite-compiler claim for an arbitrary infinite state description.

6. **Finite energy, work and service ownership.** For the mechanical stroke put $F_1=\int_0^\tau|f(t)|dt$ and $n_0=\operatorname{tr}(\rho N_{\mathrm{op}})<\infty$. The displacement satisfies $|q(t)|\le F_1/(m\Omega)$, $|p(t)|\le F_1$, and the mechanical free energy obeys
$$
\operatorname{tr}(\rho_tH_0)
\le E_{\max}:=\hbar\Omega\left[\left(\sqrt{n_0}+\frac{F_1}{\sqrt{m\Omega\hbar}}\right)^2+\frac12\right].
\tag{8.8f.3.17}
$$
For a pure input the force and scalar-trap contributions have the finite state-constrained action bound
$$
\int_0^\tau\|[ -f(t)X+f(t)^2/(2m\Omega^2)]\psi_t\|dt
\le F_1\sqrt{\frac{2E_{\max}}{m\Omega^2}}+
\frac{\pi(5A^2+7B^2)}{8m\Omega^3}.
\tag{8.8f.3.18}
$$
A force proportional to $X$ has infinite global operator norm; the displayed bound uses the supplied input energy. The maximum trap displacement is at most $2(|A|+|B|)/(m\Omega^2)$ and its speed at most $3(|A|+|B|)/(m\Omega)$. They vanish at the stroke endpoints. The exact actuator work in the driven branch is
$$
\begin{aligned}
W_{\mathrm{trap}}&=\int_0^\tau m\Omega^2
\operatorname{tr}[\rho_t(q_c(t)-X)]\dot q_c(t)dt\\
&=\operatorname{tr}[\rho(W^*H_0W-H_0)]\\
&=m\Omega^2u\langle X\rangle_\rho+\frac vm\langle P\rangle_\rho
+\frac{m\Omega^2u^2}{2}+\frac{v^2}{2m}.
\end{aligned}
\tag{8.8f.3.19}
$$
This signed work includes trap reaction and the scalar potential term. In the controlled protocol its unconditional value uses the driven-arm weight and conditional input; the work of probe and pointer gates is separately owned. A negative value is recovered work, not negative dissipation.

For each finite rail code, stored free energy lies in $[\hbar\nu_N,\hbar(\nu_N+\Omega(N-1))]$. The doubled-arm code has the same one-excitation interval. Its drive begins and ends at zero coupling, so its exact net work is $\operatorname{tr}(\rho[W_N^*H_N^0W_N-H_N^0])$, of magnitude at most $\hbar\Omega(N-1)$. Transient coupling energy is bounded by (8.8f.3.10). The probe/arm, basis and pointer gates contribute at most $15\pi\hbar/2$ of code norm action in the common nine-slot protocol, plus the declared detector service. Each pointer initially stores $\hbar\mu$ and keeps that baseline after its value is copied. The final conditional exchange restores the probe/path while its outcome remains in the pointer archive. A reset-heat equality is not inferred from this transfer.

The source ledger contains the mechanical/rail input state, the retained positive baselines, moving-trap actuator work and storage, rail-coupler work and storage, probe phases, pointer preparation, detector/record service, clock, command installation and every isolated archive. All local service energies, power bounds and source response laws are explicitly supplied finite inputs for each finite word. These remain typed entries in the full registered cost record. Actuator and coupler work are transfers between their source stores and the mechanical/rail stores; delivered work and the resulting stored-energy increase are not added as two independent energy holdings. Any scalar cost certificate specifies its unit conversion and which disjoint inventories, flows or service charges it uses. The source class supplies an ideal controlled mechanical trap and quadratic/cross-Kerr rail services; it does not infer their microscopic construction or cost from the response equations. Increased cutoff, precision, duration or record count retains its corresponding resource entry.

7. **Physical coefficient errors.** Compare two implementations at the same public input/output times and with the same output-label functions. In mechanical coordinates write their Hamiltonian difference on the driven arm as
$$
\Delta H(t)=\delta a(t)P^2+\delta b(t)X^2+\delta c(t)X+\delta d(t)I.
$$
For example, $a=1/(2m)$, $b=m\Omega^2/2$, $c=-f$ and $d=f^2/(2m\Omega^2)$. A private clock reparameterization is included by pulling its Hamiltonian back to the common time coordinate. Let $\kappa_t=[q(t)^2/(2\ell^2)+\ell^2p(t)^2/(2\hbar^2)]^{1/2}$ for the ideal trajectory. For a unit Schwartz input, the common-core Duhamel estimate gives
$$
\begin{aligned}
\|(U'-U)\psi\|
\le\frac1\hbar\int_0^{L}
\biggl[&\frac{3\hbar^2}{\ell^2}|\delta a(t)|(1+\kappa_t)^2M_1
+3\ell^2|\delta b(t)|(1+\kappa_t)^2M_1\\
&+\sqrt2\ell|\delta c(t)|(1+\kappa_t)M_1
+|\delta d(t)|\biggr]dt.
\end{aligned}
\tag{8.8f.3.20}
$$
Here $L$ is the compared finite service interval, with its actual ideal displacement trajectory and free rotations; the same moment bound covers free padding. Require piecewise smooth real coefficients on the compared finite interval, with both quadratic coefficients bounded above and bounded away from zero. Their self-adjoint oscillator domain is $D(P^2)\cap D(X^2)$, with common invariant Schwartz core. Probe-phase, mode-coupling, preparation and complete pointer-instrument errors retain separate bounds and add under finite composition. On a finite rail code a Hamiltonian error $E_N(t)$ contributes at most $\hbar^{-1}\int\|E_N(t)\|dt$ to its unitary error. Thus a declared phase/control error $\eta$ adds at most $\eta$ to a binary event probability, in addition to (8.8f.3.16)'s approximation error. A changed public timestamp is a different marked output; it is not bounded by a quantum-state estimate.

8. **Populated member.** Take $u=\ell$, $v=\hbar/\ell$ and the mechanical ground state. Then $\kappa=1$, $B=-A$, the relative trap phase is $\chi=-13/(12\pi)$, and its driven work is $\hbar\Omega$. The corrected characteristic is $e^{-1/2}$, so the two binary means are $e^{-1/2}$ and $0$. Choose $N=8$, $\nu_8=\mu=\Omega$ and finite declared service budgets. Then
$$
T_8=3\tau,\qquad T_g=2\tau,\qquad L_8=21\tau.
\tag{8.8f.3.21}
$$
This uses sixteen main arm rails and two pointer rails, with one excitation in each main/pointer code. For the larger member $N=8^4=4096$, the same source units give $T_N=32\tau$ and $L_N=50\tau$; the ground-state tail is zero, and the inherited normalized characteristic error is at most $1/8$, hence the binary probability error at most $1/16$. These are formal response values from the independently registered source parameters. Actual measured calibration and frequency records are separate campaign data.

*Proof.* The mechanical source first fixes the unit and observable identification. With $a=(X/\ell+i\ell P/\hbar)/\sqrt2$, direct substitution gives $H_0=\hbar\Omega(a^\dagger a+1/2)$ precisely when $\ell^2=\hbar/(m\Omega)$. The Hermite recursion and differential equation therefore identify its normalized eigenfunctions with Theorem 8.8f.2's $h_n$, and its free period is $e^{-i\tau H_0/\hbar}=-I$ on their complete span and hence on the full Hilbert space. The self-adjoint $H_0$ is the diagonal Hermite operator on $D(N_{\mathrm{op}})=\{\sum_nc_nh_n:\sum_n(n+1)^2|c_n|^2<\infty\}$, equal to $D(P^2)\cap D(X^2)$. The position term is $H_0$-bounded with arbitrarily small relative bound, so every translated trap uses this same domain. Position is measured in the supplied length unit and momentum in its nonrelativistic mechanical mass-length/time unit. This establishes the calibration before any response or fitted probability is used.

Write $\theta=\Omega t$. Expanding the force gives
$$
f=A\sin\theta-\tfrac A2\sin2\theta+B\cos\theta-\tfrac B2-\tfrac B2\cos2\theta.
$$
Orthogonality over $[0,2\pi]$ gives $\int f\sin\theta\,d\theta=\pi A$, $\int f\cos\theta\,d\theta=\pi B$ and $\int f\,d\theta=-\pi B$. Solving the classical forced oscillator by its retarded sine kernel yields (8.8f.3.4), whose final values are $-\pi A/(m\Omega^2)=u$ and $\pi B/\Omega=v$. The Heisenberg equations have the same inhomogeneous linear system, so their final affine shifts are exact operator identities. Differentiation of the waveform gives the stated finite stroke and speed bounds, with zero endpoint force and derivative.

For its scalar phase, set $X_I(t)=X\cos\Omega t+P\sin\Omega t/(m\Omega)$. The interaction generator for the linear force is $if(t)X_I(t)/\hbar$, and
$$
[X_I(t),X_I(s)]=-\frac{i\hbar}{m\Omega}\sin\Omega(t-s)I.
$$
All nested commutators after this one vanish. The first Magnus term is $i(vX-uP)/\hbar$ and the second is $i\int_0^\tau dt\int_0^t ds\,f(t)f(s)\sin\Omega(t-s)/(2m\Omega\hbar)$. The scalar trap term supplies the additional phase $-\int f^2/(2m\Omega^2\hbar)dt$. To verify the unbounded-generator statement directly, put
$$
U_1(t)=e^{i\chi(t)}W(q(t),p(t))e^{-itH_0/\hbar},\qquad
\chi(t)=\frac1{2\hbar}\int_0^t\left[f(s)q(s)-\frac{f(s)^2}{m\Omega^2}\right]ds.
$$
Every factor is unitary and preserves the Schwartz core. Its strong derivative there, together with $\dot q=p/m$ and $\dot p=f-m\Omega^2q$, gives
$$
i\hbar\dot U_1U_1^*=H_0-fX+\frac{f^2}{2m\Omega^2}I.
$$
For clarity, the scalar part of this differentiation is $-\hbar\dot\chi+qf/2=f^2/(2m\Omega^2)$. Thus this explicit propagator solves the actual driven Schrödinger equation on the common core and extends by unitarity to the full carrier. The undriven arm is $e^{-itH_0/\hbar}$, and their orthogonal direct sum is the controlled source. Uniqueness on the core follows by differentiating the inner product of two strong solutions, and density gives the same unique unitary evolution on the carrier. The phase integral equals the terminating scalar-commutator expression above because $q$ is its retarded sine integral. The core argument, rather than a formal series for unbounded operators, establishes the propagator. To evaluate both, the dimensionless retarded integral is
$$
\begin{aligned}
\int_0^\theta f(\eta)\sin(\theta-\eta)d\eta
={}&-\tfrac A2\theta\cos\theta+\tfrac A6\sin\theta+\tfrac A6\sin2\theta\\
&+\tfrac B2\theta\sin\theta+\tfrac B3\cos\theta+\tfrac B6\cos2\theta-\tfrac B2.
\end{aligned}
$$
Multiply this expression by $f(\theta)$ and integrate from $0$ to $2\pi$ to obtain $5\pi B^2/6$. Squaring the Fourier expansion and integrating gives $\pi(5A^2+7B^2)/4$. Restoring the two time factors in the double integral and the single factor in the square integral yields
$$
\chi=\frac{5\pi B^2}{12m\hbar\Omega^3}
-\frac{\pi(5A^2+7B^2)}{8m\hbar\Omega^3}
=-\frac{\pi(15A^2+11B^2)}{24m\hbar\Omega^3}.
$$
The free full-period factor is common to both arms. Applying the registered probe phase proves (8.8f.3.5)'s calibrated controlled Weyl operation, and the translation/boost identities follow either from (8.8f.3.4) or the explicitly realized Schrödinger formula. The loop phase is then Theorem 8.8f.1's Weyl relation on this physical unit map. Keeping the probe makes that relative phase an observable record.

On the rails, the canonical mode relations give $c_j^\dagger c_k c_n^\dagger|\mathrm{vac}\rangle=\delta_{kn}c_j^\dagger|\mathrm{vac}\rangle$. Thus $S_N$ is an isometry, each quadratic monomial restricts to its displayed matrix unit, and every such term commutes with the total occupation. The free energy and its mechanical reference difference are (8.8f.3.8). The coefficients $\sqrt n$ therefore give the exact Hermite lowering matrix and both finite physical quadratures. This derives the finite source map from its individual couplings.

For a physical control matrix $C_N(t)$, the free interaction picture conjugates it to $R_N(t)^*C_N(t)R_N(t)$. Equation (8.8f.3.9) makes this $-\dot s_TG_N$. Its values commute at all times and integrate to $-G_N$, so the endpoint is $R_N(T)e^{iG_N/\hbar}=e^{-i\nu_NT}W_N$ at an integer period. Real and imaginary matrix entries are independent quadratures of the admitted pair coupling, making this an exact source specification. Since $\|a_N\|=\sqrt{N-1}$ and the coefficient of $a_N$ in $G_N$ has modulus $\hbar\kappa$, the triangle inequality gives (8.8f.3.10). The nonnegative derivative $\dot s_T$ has integral one and maximum $3/(2T)$. Equation (8.8f.3.11) is strictly larger than $3\kappa\sqrt{N-1}/\nu_N$, so the minimum eigenvalue of the one-particle Hamiltonian is positive. Its bosonic second quantization is the sum of those positive one-particle energies on each particle sector. This supplies a self-adjoint nonnegative full source and exact invariance of the one-particle code. No cutoff projection is performed during its unitary operation.

The tridiagonal determinant for $Q_N$ obeys $d_{n+1}(z)=z d_n(z)-(n/2)d_{n-1}(z)$ with $d_0=1,d_1=z$. The Hermite recursion gives $d_n=2^{-n}H_n$. Its off-diagonal entries are positive, so an eigenvector is fixed by its first entry through the three-term recursion, and a zero first entry would force the vector to vanish. Every eigenspace is therefore one-dimensional; the real symmetric matrix has real simple eigenvalues. The finite diagonalizer and measured labels in item 3 follow. Conjugation by $D_N$ multiplies $a_N$ by $-i$ and $a_N^\dagger$ by $i$, proving (8.8f.3.12) and the momentum meter.

For completeness of the mode control, eliminate entries of a unitary matrix below its diagonal, column by column, using adjacent row rotations from the bottom upward. A complex two-vector can be rotated to $(r,0)$ by one two-mode unitary; its phase is retained in that unitary or a number phase. This requires at most $N(N-1)/2$ rotations. The remaining upper-triangular unitary is diagonal, as orthogonality of its columns shows successively, and its $N$ phases finish the decomposition. Every elementary block has a Hermitian logarithm with eigenphases in $[-\pi,\pi]$. Applying its co-rotating quadratic pulse for a sufficiently long integer period realizes it exactly with the stated action. Preparing a mode vector is the corresponding first-column instance. Finite probability mixtures are prepared with their ready classical/quantum sampling record and retain that record under the specified cut. Each finite diagonalizer, inverse and occupation projector therefore has an actual finite source implementation. The separating projectors recover every diagonal entry and the real and imaginary parts of every off-diagonal density entry, proving the full finite response claim.

The common binary instrument follows by explicit dilation. After controlled $W$, a target vector $\psi$ and the probe are $(\psi|0\rangle+W\psi|1\rangle)/\sqrt2$. Its overlaps with $(|0\rangle\pm|1\rangle)/\sqrt2$ are $(I\pm W)\psi/2$, and with $(|0\rangle\pm i|1\rangle)/\sqrt2$ are $(I\mp iW)\psi/2$. Their squares sum to the identity, including the sign in the imaginary mean. On the doubled rails, $c_{a,n}^\dagger|\mathrm{vac}\rangle$ identifies the one-particle code with $\mathbb C^2\otimes\mathbb C^N$. Arm mixing restricts to the same probe unitary, and the source coupling confined to arm $1$ restricts to the controlled $G_N$. The equal rail frequencies make the full-period free phase identical on both arms. Thus this is the same dilation with $W_N$ in place of $W$.

For the record, on the one-particle arm code $Q_{\mathrm{arm}}$ is a projector with eigenvalues zero and one. The pulse $e^{-i\pi Q_{\mathrm{arm}}n_{B1}}$, between the two pointer Hadamards, is a controlled pointer flip. Each term $\pi Q_{\mathrm{arm}}n_{B1}=\pi\sum_n n_{1,n}n_{B1}$ is an admitted nonnegative cross-Kerr interaction. It commutes with each free rail occupation and with the degenerate pointer baseline. It therefore copies the arm value while preserving every coherence between internal modes of that arm. Reading the pointer gives exactly the preceding complete Kraus leaf. In the continuum, replacing $Q_{\mathrm{arm}}$ by the two-level projector gives the same calculation. Conditional exchange sends the selected probe/path back to its ready value while leaving the pointer record unchanged. This is an injective operation on the retained outcome branches, and its logical reduced target state is $K\rho K^*$.

All auxiliary intervals and the padded force interval are integer periods. Mechanical free drift on those intervals is a scalar, and rail free drift is the scalar $e^{-i\nu_NT}$; both remain common to the interferometer arms. The pointer's equal-frequency baseline is also scalar on its code. Thus the total-arm readout does not leave an unrecorded mode-dependent phase. The positive detector slot and fixed identity padding give the common deadline (8.8f.3.14). Intermediate record isolation and later fresh ready pointers extend the construction to every finite word. The physical isometries intertwine each generator and each projector, so composition, tensoring an arbitrary spectator and summing outcome leaves preserve the identities. These are algebraic equalities on every input operator, not statements based on selected input statistics.

Rail padding preserves $S_Ne_n$ as the same occupied mode in the larger source. The common $\nu_N=\nu$ makes the old mode frequencies identical under that inclusion, so padding requires no unrecorded baseline switch. The mathematical maps $J_N$ then supply precisely the directed diagram already proved in Theorem 8.8f.2. The energy-reference equality was derived independently above. That theorem's base-eight identification transports every matrix entry, state, effect and operation; the rail implementation preserves all of them and supplies their physical units. It does not replace the separate source-selection predicates by a dimension count.

For the tail estimate, write $\psi=\sum_nc_nh_n$. On $n\ge N$ one has $(n+1)^s\ge(N+1)^s$, which proves (8.8f.3.15)'s first inequality by summing squares. The normalized projection has overlap $r_N$ with $\psi$, so the pure-state trace distance is $\sqrt{1-r_N^2}=\delta_N$. The unnormalized finite characteristic equals $r_N^2$ times the normalized one, whose modulus is at most one. Their difference is therefore at most $1-r_N^2=\delta_N^2$. Adding the already proved bound (8.8f.2.5) gives (8.8f.3.16), and the binary probabilities are one half plus or minus one half of its real or imaginary part. The original commutator and weak spectral-law statements now concern the realized observables, with their original domains and topologies unchanged. The finite meter spectra and compressed continuum POVM are distinct before this limit.

For the energy estimates, the forced motion is a displacement with complex amplitude $\beta(t)=[q(t)/\ell+i\ell p(t)/\hbar]/\sqrt2$, after a free rotation. The retarded integrals give $|\beta(t)|\le F_1/\sqrt{m\Omega\hbar}$. Under displacement the annihilator changes by $\beta$, so the Hilbert-space triangle inequality gives $\sqrt{\langle N\rangle_t}\le\sqrt{n_0}+|\beta|$, proving (8.8f.3.17), also for mixtures by the Hilbert–Schmidt version of that inequality. Positivity of the kinetic term gives $\|X\psi_t\|\le\sqrt{2E_{\max}/(m\Omega^2)}$. Integration and the force-square integral above prove (8.8f.3.18). The differentiated Hamiltonian is $m\Omega^2(q_c-X)\dot q_c$ on the driven arm. Schrödinger evolution gives $d\langle H(t)\rangle/dt=\langle\partial_tH(t)\rangle$ on this common core, and the endpoints have $q_c=0$. Substituting the exact endpoint shifts of $X$ and $P$ yields (8.8f.3.19). The same identity on the finite code gives its drive work; any two expectations in its free-energy interval differ by at most $\hbar\Omega(N-1)$. The positive-duration ancillary gates have the separately listed bounded generators. Four Hadamards, one principal phase, one $S^\dagger$, one cross-Kerr copy and one conditional exchange contribute at most $4\pi+\pi+\pi/2+\pi+\pi=15\pi/2$ in units of $\hbar$, leaving the detector service as its declared additional owner. The resource claims follow on each finite source and finite word.

For the error estimate, Duhamel's identity on the invariant Schwartz core reads $(U'-U)\psi=-i\hbar^{-1}\int U'(L,t)\Delta H(t)U(t,0)\psi\,dt$. The stated positive quadratic coefficients give the common self-adjoint domain $D(P^2)\cap D(X^2)$: the positive $aP^2+bX^2$ oscillator has that domain, and the linear term is relatively bounded with arbitrarily small relative bound. A direct propagator construction supplies the needed core invariance. Solve the finite classical affine system $\dot x=2a(t)p$, $\dot p=-2b(t)x-c(t)$; its homogeneous fundamental matrix is symplectic and exists on the whole finite interval. Subdivide that continuous path so each increment has positive first entry $A$. If its other first-column and first-row entries are $C$ and $B$, its exact factorization is
$$
\begin{pmatrix}A&B\\C&D\end{pmatrix}
=\begin{pmatrix}1&0\\C/A&1\end{pmatrix}
\begin{pmatrix}A&0\\0&A^{-1}\end{pmatrix}
\begin{pmatrix}1&B/A\\0&1\end{pmatrix}.
$$
The three factors are implemented by multiplication by a quadratic phase, the unitary dilation $\psi(x)\mapsto A^{-1/2}\psi(x/A)$, and the Fourier-conjugate quadratic phase. Each preserves Schwartz space. Add the affine Weyl displacement from the same classical system. Differentiating this local product gives a real quadratic Hamiltonian with exactly the prescribed commutators with $X$ and $P$; the difference from $aP^2+bX^2+cX+dI$ is therefore a scalar, canceled by integrating its scalar phase. Concatenating the finite subdivisions supplies the unitary propagator with the prescribed initial value and a Schwartz-preserving derivative. This construction also covers the primed coefficients. The integrable bounds below justify Duhamel on the common core and its extension to the stated moment class. The ladder estimates give
$$
\|X^2\xi\|\le3\ell^2\|(N_{\mathrm{op}}+1)\xi\|,\quad
\|P^2\xi\|\le\frac{3\hbar^2}{\ell^2}\|(N_{\mathrm{op}}+1)\xi\|,\quad
\|X\xi\|\le\sqrt2\ell\|(N_{\mathrm{op}}+1)^{1/2}\xi\|.
$$
Indeed the two square expressions consist of $a^2$, $(a^\dagger)^2$ and $2N+1$; their respective bounds are $1$, $\sqrt2$ and $2$ times the number graph norm, giving the sharper coefficient $(3+\sqrt2)/2<3$. The displacement estimate in Theorem 8.8f.2 gives $\|(N+1)\psi_t\|\le(1+\kappa_t)^2M_1$. Its first-moment counterpart is $\|(N+1)^{1/2}\psi_t\|\le(1+\kappa_t)\|(N+1)^{1/2}\psi\|\le(1+\kappa_t)M_1$; the free rotation preserves both norms. The triangle inequality in Duhamel's integral proves (8.8f.3.20). The finite matrix version needs only the operator-norm perturbation. A vector-norm error bounds the corresponding pure-state trace distance and hence every event difference; convexity handles mixtures, and normalized complete maps contract those differences in later composition. Independently certified instrument errors and finite word errors therefore add with their actual clock/record labels.

For the populated member, $\ell^2=\hbar/(m\Omega)$ gives $\kappa=1$, $A=-B$ and $\chi=-13/(12\pi)$. The Gaussian integral for the mechanical ground state gives $\langle h_0,W(\ell,\hbar/\ell)h_0\rangle=e^{-1/2}$; its initial first moments vanish, so (8.8f.3.19) is $\hbar\Omega$. Substituting $N=8$ or $4096$ and $\nu_N=\mu=\Omega$ into the integer clock formulas gives the stated durations. The ground state lies in every nonempty Hermite truncation, so $\delta_N=0$ and $M_1=1$. At $N=4096$ the response bound is $8/64=1/8$. Thus the class has explicit nonempty finite members, full physical unit maps and the required continuum response. $\square$

The exact source domain of Theorem 8.8f.3 is the registered controlled harmonic particle, positive-frequency rails, finite mode/pointer controls, supplied input states and finite clock/service records above. Its formal map is the physical occupancy encoding followed by the Hermite comparison isometry, with the independent mechanical unit and energy-reference maps. It preserves every admitted state/effect pairing, finite operation leaf, spectator, outcome and marked clock/record map. Equations (8.8f.3.1)--(8.8f.3.21) and the complete proof verify it; an incorrect physical shift, scalar phase, finite meter, support condition, work owner, timing leaf or approximation bound would falsify it. Its formal realization is proved; its physical certification is a separate empirical requirement.

<a id="theorem-88g-complete-finite-jordan-carrier-classification-under-predictive-correspondence"></a>**Theorem 8.8g (Complete Finite Jordan-Carrier Classification under Predictive Correspondence).** Let the retained finite ordered carrier be homogeneous and self-dual, and accept the Koecher--Vinberg reconstruction used in Theorem G.1.8. Suppose its Euclidean Jordan algebra $A$ has a predictive dynamical correspondence in the sense of Definition G.1.8b and that every simple ideal carries the induced blockwise correspondence of Corollary G.1.8e. Then
$$
A\cong H_n(\mathbb C)
$$
for one $n\ge1$. This conclusion excludes real, quaternionic and spin-factor carriers not Jordan-isomorphic to an allowed $H_n(\mathbb C)$, as well as exceptional and nontrivially reducible Euclidean-Jordan carriers, on the stated correspondence branch. Low-dimensional coincidences such as $H_1(\mathbb R)\cong H_1(\mathbb C)$ and $V_3\cong H_2(\mathbb C)$ are retained as the corresponding complex isomorphism classes. If the carrier also has one sharp context of eight outcomes, a faithful eight-dimensional complex representative, and no response-active surplus direction, then $n=8$ and the retained carrier is $H_8(\mathbb C)$.

*Proof.* Koecher--Vinberg identifies the cone with the cone of squares of a finite-dimensional Euclidean Jordan algebra. Theorem G.1.8d classifies every simple ideal admitting the correspondence as complex Hermitian. Corollary G.1.8e then forces a single ideal, which proves the first statement and exhausts the finite simple and reducible families. A sharp context in $H_n(\mathbb C)$ has at most $n$ mutually orthogonal primitive outcomes, so eight outcomes give $n\ge8$. The admitted faithful eight-dimensional representative gives $n\le8$; hence $n=8$. ∎

Construction G.1.8f and Theorem G.1.8g supply a nonempty common complex witness with finite separating effects, positive filters, locally tomographic composites and exact $U(1)$ phase kernel. The mathematical carrier census is therefore complete on the predictive-correspondence branch. Populating the PU-to-correspondence, local-composite, phase and response records in $\mathfrak C_{\mathrm{car}}$ and realizing them physically remain the `C+R` components.

<a id="theorem-88g1-correspondence-clause-census-and-automatic-simplicity-on-euclidean-jordan-carriers"></a>**Theorem 8.8g.1 (Correspondence-Clause Census and Automatic Simplicity on Euclidean Jordan Carriers).** Let $\mathfrak J$ be the class of finite-dimensional Euclidean Jordan algebras, and write $A\in\mathfrak J$ as $A=\bigoplus_{k=1}^mA_k$ with simple ideals $A_k$, units $c_k$ and $1=\sum_kc_k$. By the simple list of Barnum and Hilgert (2020, §3, Table 1), the simple members are $\mathbb R\cong H_1(\mathbb C)$, the spin factors $V_s=\mathbb R1\oplus\mathbb R^s$ with $(\alpha1+x)\circ(\beta1+y)=(\alpha\beta+\langle x,y\rangle)1+\alpha y+\beta x$ $(s\ge2)$, $H_n(\mathbb R)$, $H_n(\mathbb C)$ and $H_n(\mathbb H)$ $(n\ge3)$, and $H_3(\mathbb O)$, with $V_2\cong H_2(\mathbb R)$, $V_3\cong H_2(\mathbb C)$, $V_5\cong H_2(\mathbb H)$ and $V_9\cong H_2(\mathbb O)$. For an idempotent $e$ write $A_\lambda(e)=\{x:e\circ x=\lambda x\}$ for its Peirce spaces. For a linear map $\psi:A\to\operatorname{Der}(A)$ name the three clauses of (G.1.8b.1):
$$
\mathrm{(S)}\ \psi_a(a)=0\ (a\in A),
\qquad
\mathrm{(G)}\ \operatorname{im}\psi=\operatorname{Der}(A),
\qquad
\mathrm{(N)}\ \ker\psi=\mathbb R1.
\tag{8.8g.1.1}
$$
Put $\delta(A):=\dim A-\dim\operatorname{Der}(A)$. The table in Theorem G.1.8d gives
$$
\delta(H_n(\mathbb R))=n,\quad
\delta(H_n(\mathbb C))=1,\quad
\delta(H_n(\mathbb H))=-2n,\quad
\delta(V_s)=s+1-\frac{s(s-1)}2,\quad
\delta(H_3(\mathbb O))=-25.
\tag{8.8g.1.2}
$$
Then:

1. **Stationarity is blockwise.** Every $\psi$ satisfying (S) has the form $\psi_a=\bigoplus_k\psi^{(k)}_{a_k}$ for $a=\sum_ka_k$, where each $\psi^{(k)}:A_k\to\operatorname{Der}(A_k)$ satisfies (S).
2. **Stationary maps on simple carriers.** On $\mathbb R$, $\psi=0$. On $V_s$, the maps satisfying (S) are exactly
$$
\psi_{\alpha1+x}(\beta1+y)=T^\sharp(x,y),
\qquad
\langle T^\sharp(x,y),z\rangle=T(x,y,z),
\tag{8.8g.1.3}
$$
for alternating trilinear forms $T$ on $\mathbb R^s$. On $H_n(\mathbb C)$, $\psi_a=i[a,\cdot]$ satisfies (S), (G) and (N). On $H_n(\mathbb R)$ with $n\ge2$, on $H_n(\mathbb H)$ with $n\ge3$ and on $H_3(\mathbb O)$, the only map satisfying (S) is $\psi=0$.
3. **Complete clause census.**
$$
\begin{array}{c|l}
\text{clauses}&\text{carriers in }\mathfrak J\text{ admitting such }\psi\\ \hline
\mathrm{(S)+(G)+(N)}&H_n(\mathbb C),\ n\ge1\\
\mathrm{(S)+(G)}&\bigoplus_{k=1}^mH_{n_k}(\mathbb C)\\
\mathrm{(S)+(N)}&H_n(\mathbb C),\ n\ge1;\ \ V_s,\ s\ge5\\
\mathrm{(G)+(N)}&\bigoplus_kA_k\ \text{with}\ \sum_k\delta(A_k)=1
\end{array}
\tag{8.8g.1.4}
$$
On the (S)+(G) row, $\ker\psi=\operatorname{span}\{c_1,\ldots,c_m\}$, and for $m\ge2$ every $c_k$ is a response-active central sharp effect: a state supported in $A_k$ gives it value one and a state supported in another ideal gives it value zero. The simple members of the (G)+(N) row are exactly the $H_n(\mathbb C)$, while its reducible members include $V_4\oplus\mathbb R\oplus\mathbb R$, $H_n(\mathbb H)\oplus\mathbb R^{2n+1}$ and $H_3(\mathbb O)\oplus\mathbb R^{26}$.

Consequently Definition G.1.8b forces simplicity, and the blockwise hypothesis of Corollary G.1.8e and Theorem 8.8g holds automatically. The three clauses are mutually independent on $\mathfrak J$: dropping (N) admits the complex superselection sums with response-active central projections, dropping (S) admits defect-one sums with spin, quaternionic or exceptional summands, and dropping (G) admits every spin factor $V_s$ with $s\ge5$, including $V_5\cong H_2(\mathbb H)$ and $V_9\cong H_2(\mathbb O)$. On simple carriers, (G) together with either (S) or (N) selects $H_n(\mathbb C)$.

*Proof.* (1) A derivation $D$ satisfies $D(e)=D(e\circ e)=2e\circ D(e)$, so $D(e)\in A_{1/2}(e)$ for every idempotent $e$. For a central idempotent $A_{1/2}(c_k)=0$, hence $D(c_k)=0$ and $D(a_k)=D(c_k\circ a_k)=c_k\circ D(a_k)\in A_k$; thus $\operatorname{Der}(A)=\bigoplus_k\operatorname{Der}(A_k)$. Write $\psi_a=\bigoplus_k\sum_jL_{kj}(a_j)$ with linear $L_{kj}:A_j\to\operatorname{Der}(A_k)$. The $A_k$-component of $\psi_a(a)$ is $\sum_jL_{kj}(a_j)a_k$. Taking $a=a_k$ gives $L_{kk}(a_k)a_k=0$; taking $a=a_j+a_k$ with $j\ne k$ then gives $L_{kj}(a_j)a_k=0$ for every $a_k$, so $L_{kj}=0$ and $\psi^{(k)}=L_{kk}$.

(2) $\operatorname{Der}(\mathbb R)=0$. On $V_s$, every $K\in\mathfrak{so}(s)$ acting on $\mathbb R^s$ and annihilating $1$ is a derivation, and the dimension $s(s-1)/2$ in Theorem G.1.8d's table shows that these are all derivations. Write $\psi_{\alpha1+x}=\alpha N+L(x)$ with $N\in\mathfrak{so}(s)$ and linear $L:\mathbb R^s\to\mathfrak{so}(s)$. Condition (S) reads $\alpha Nx+L(x)x=0$ for all $\alpha,x$, so $N=0$ and $L(x)x=0$. Then $\langle L(x)y,z\rangle$ is alternating in $(x,y)$ and in $(y,z)$, hence an alternating trilinear form; conversely every alternating $T$ gives $L(x)=T^\sharp(x,\cdot)\in\mathfrak{so}(s)$ with $L(x)x=0$. On $H_n(\mathbb C)$, $i[a,\cdot]$ is a derivation annihilating $a$, every derivation has this form, and $i[a,\cdot]=0$ exactly for scalar $a$ (Theorem G.1.8d).

For $H_n(\mathbb R)$, $H_n(\mathbb H)$ and $H_3(\mathbb O)$ fix the diagonal frame $e_1,\ldots,e_n$ and the off-diagonal Peirce spaces $A_{ij}=\{[a]_{ij}\}$, where $[a]_{ij}$ has entry $a$ at $(i,j)$ and $\bar a$ at $(j,i)$, so that $[a]_{ji}=[\bar a]_{ij}$ and $[a]_{ij}\circ[b]_{jk}=\tfrac12[ab]_{ik}$ for distinct $i,j,k$. Let $\psi$ satisfy (S). Polarization gives $\psi_a(b)=-\psi_b(a)$. For orthogonal idempotents $e,f$, the derivation $\psi_e$ annihilates $e$, hence commutes with $L_e$ and preserves the Peirce spaces of $e$, so $\psi_e(f)\in A_0(e)$; also $\psi_e(f)=-\psi_f(e)\in A_{1/2}(e)$. Hence $\psi_e(f)=0$, and each $D_i:=\psi_{e_i}$ annihilates the frame and preserves every $A_{jk}$. If $x\in A_{jk}$ and $i\notin\{j,k\}$, then $\psi_x(e_i)\in A_{1/2}(e_i)$, while $\psi_x(e_i)=-D_i(x)\in A_{jk}\subseteq A_0(e_i)$; hence $D_i(x)=0$. For $x\in A_{ij}$, $0=\psi_x(1)=-\sum_kD_k(x)$ gives $(D_i+D_j)(x)=0$.

For $\mathbb D\in\{\mathbb R,\mathbb H\}$, the dimension count in Theorem G.1.8d's table shows that every derivation of $H_n(\mathbb D)$ is $\operatorname{ad}_K$ for a unique antihermitian $K$; a derivation annihilating the frame is $\operatorname{ad}$ of $\operatorname{diag}(u_1,\ldots,u_n)$ with $u_l\in\operatorname{Im}\mathbb D$, acting by $[a]_{jk}\mapsto[u_ja-au_k]_{jk}$. If it vanishes on $A_{jk}$, then $u_jb=bu_k$ for all $b$, so $u_j=u_k$ is central and imaginary, hence zero. For $\mathbb D=\mathbb R$, $\operatorname{Im}\mathbb R=0$, so every frame-annihilating derivation vanishes and $D_i=0$. For $\mathbb D=\mathbb H$ and $n\ge3$, every $j\ne i$ has some $k\notin\{i,j\}$, so $D_i$ is $\operatorname{ad}$ of $u^{(i)}$ placed at the $i$-th diagonal entry; then $(D_i+D_j)|_{A_{ij}}=0$ gives $u^{(i)}a=au^{(j)}$ for all $a$, so $u^{(i)}=u^{(j)}$ is central and imaginary, hence zero. For $H_3(\mathbb O)$ write a frame-annihilating derivation as $D[a]_{ij}=[D_{ij}(a)]_{ij}$, so $D_{ji}(a)=\overline{D_{ij}(\bar a)}$. The product rule gives
$$
D_{ik}(ab)=D_{ij}(a)b+aD_{jk}(b)
\qquad(\{i,j,k\}=\{1,2,3\}).
\tag{8.8g.1.5}
$$
If $D_{jk}=0$, then $b=1$ gives $D_{ik}=D_{ij}$, and $a=1$ gives $D_{ij}(b)=cb$ with $c:=D_{ij}(1)$, so $c(ab)=(ca)b$ for all $a,b$. The nucleus of $\mathbb O$ is $\mathbb R$, hence $c\in\mathbb R$. Applying (8.8g.1.5) to the ordered triple $(k,i,j)$ gives $0=D_{kj}(ba)=(cb)a+b(ca)=2cba$, so $c=0$ and $D=0$. Hence $D_i=0$ on all three carriers. For $x\in A_{ij}$ the derivation $\psi_x$ now annihilates the frame. For $y$ in another Peirce space $A_{kl}$, $\psi_x(y)\in A_{kl}$ and $\psi_y(x)\in A_{ij}$, so $\psi_x(y)=-\psi_y(x)=0$. Every index lies in some pair $\{k,l\}\ne\{i,j\}$ when $n\ge3$, and on $H_n(\mathbb R)$ every frame-annihilating derivation vanishes, so the vanishing criteria above give $\psi_x=0$. Since the frame and the Peirce spaces span $A$, $\psi=0$.

(3) By item 1, (S) reduces the first three rows to the simple summands. With (G), each $\psi^{(k)}$ is surjective. On $V_s$, $\dim\operatorname{im}\psi\le s<s(s-1)/2$ for $s\ge4$; for $s=2$, $\psi=0$ while $\operatorname{Der}(V_2)\ne0$; and $V_3\cong H_2(\mathbb C)$. The remaining zero maps of item 2 are not surjective because the corresponding derivation algebras are nonzero. Hence every summand is complex, and $\bigoplus_ki[a_k,\cdot]$ realizes the (S)+(G) row with kernel $\operatorname{span}\{c_k\}$. With (N), $1\in\ker\psi$ forces $c_k\in\ker\psi^{(k)}$ for every $k$, so $\dim\ker\psi\ge m$ and $m=1$. On $V_s$, $\ker\psi=\mathbb R1\oplus\{x:T(x,\cdot,\cdot)=0\}$. For $s=2$, $T=0$. For $s=4$, every alternating trilinear form is $T(x,y,z)=\det(v,x,y,z)$ for some $v\in\mathbb R^4$, and $T(v,\cdot,\cdot)=0$, so $\ker\psi\ne\mathbb R1$. For $s\ge5$, the form
$$
T_s=\sum_{r=1}^{\lfloor(s-1)/2\rfloor}e^{2r-1}\wedge e^{2r}\wedge e^s
+[s\ \text{even}]\,e^1\wedge e^3\wedge e^{s-1}
\tag{8.8g.1.6}
$$
has index triples covering $\{1,\ldots,s\}$ and pairwise sharing at most one index, so the coefficients of $T_s(x,\cdot,\cdot)$ on distinct basis two-forms are the separate coordinates $\pm x_l$, and $T_s(x,\cdot,\cdot)=0$ forces $x=0$. With item 2 this gives the (S)+(N) row, and (S)+(G)+(N) combines $m=1$ with the complex summands of the (S)+(G) row. For (G)+(N), rank-nullity makes a surjection with kernel $\mathbb R1$ exist exactly when $\dim\operatorname{Der}(A)=\dim A-1$, and $\operatorname{Der}(A)=\bigoplus_k\operatorname{Der}(A_k)$ turns this into $\sum_k\delta(A_k)=1$. By (8.8g.1.2), $\delta=1$ on a simple carrier exactly for $\mathbb R$, $V_3$ and $H_n(\mathbb C)$, and the displayed sums have defects $-1+1+1$, $-2n+(2n+1)$ and $-25+26$. The central projections $c_k$ are idempotent effects with values one and zero on states supported in $A_k$ and in another ideal. ∎

<a id="theorem-88g2-self-composite-product-effect-rigidity-on-euclidean-jordan-carriers"></a>**Theorem 8.8g.2 (Self-Composite Product-Effect Rigidity on Euclidean Jordan Carriers).** For $r\ge1$ let $\mathcal N(r)$ be the set of dimensions of simple members of $\mathfrak J$ of rank $r$:
$$
\mathcal N(1)=\{1\},\quad
\mathcal N(2)=\{s+1:s\ge2\},\quad
\mathcal N(3)=\{6,9,15,27\},\quad
\mathcal N(r)=\Bigl\{\tfrac{r(r+1)}2,\ r^2,\ r(2r-1)\Bigr\}\ \ (r\ge4).
\tag{8.8g.2.1}
$$
Within each rank, the dimension determines the simple carrier. Let $A,C\in\mathfrak J$ be simple with
$$
\operatorname{rank}A=n\ge2,
\qquad
\operatorname{rank}C=n^2,
\qquad
\dim C=(\dim A)^2 .
\tag{8.8g.2.2}
$$
The dimension identity is the dimension content of a product-effect isomorphism $A^*\otimes_{\mathbb R}A^*\to C^*$, and the rank identity is the multiplicative-size clause of Principle 8.0b(iv) for the self-composite. Then
$$
A\cong H_n(\mathbb C),
\qquad
C\cong H_{n^2}(\mathbb C).
\tag{8.8g.2.3}
$$
Hence:

1. Every spin factor $V_s$ with $s\ne3$, every $H_n(\mathbb R)$ and $H_n(\mathbb H)$ with $n\ge2$, and $H_3(\mathbb O)$ fails (8.8g.2.2) at its own square. A size-indexed family of simple carriers of rank equal to size, on a multiplicatively closed set of sizes, that satisfies the product-effect dimension identity for all pairs of sizes at least two is complex at every size.
2. Let $A=\bigoplus_{k=1}^mA_k$ with simple $A_k$ of rank $r_k$, and let its self-composite be block-distributive: $C=\bigoplus_{k,l}C_{kl}$ with simple $C_{kl}$, $\operatorname{rank}C_{kl}=r_kr_l$ and $\dim C_{kl}=\dim A_k\dim A_l$. Then $A\cong\bigoplus_kH_{r_k}(\mathbb C)$. Conversely, Kronecker products realize the composite $\bigoplus_{k,l}H_{r_kr_l}(\mathbb C)$ with a product-effect isomorphism on every block. For $m\ge2$ the central projections of these survivors are response-active, as in Theorem 8.8g.1.
3. Each retained gate is independent. Without simplicity of $A$ and $C$, the classical carriers $\mathbb R^m$ with $\mathbb R^m\otimes\mathbb R^m\cong\mathbb R^{m^2}$ and the complex superselection sums of item 2 survive with genuine Kronecker composites. Without the dimension identity, every simple member of $\mathfrak J$ survives. Without simplicity of $A$ alone, the pair $(\mathbb R\oplus V_7,H_9(\mathbb C))$ meets both identities in (8.8g.2.2), since $\operatorname{rank}(\mathbb R\oplus V_7)=3$ and $(1+8)^2=81=\dim H_9(\mathbb C)$. Without simplicity of $C$ alone, the pair $(V_2,V_2\oplus V_5)$ meets both identities in (8.8g.2.2), since $\operatorname{rank}(V_2\oplus V_5)=4$ and $3+6=3^2$. If the size clause is weakened to $\operatorname{rank}C\ge n^2$, the pair $(V_4,H_5(\mathbb C))$ meets the dimension identity with $5^2=25$ and $5\ge4$. If the self-composite is replaced by one unequal pair, then for every $m\ge2$
$$
\dim H_{2m-1}(\mathbb R)\cdot\dim H_m(\mathbb H)
=\bigl(m(2m-1)\bigr)^2
=\dim H_{m(2m-1)}(\mathbb C),
\tag{8.8g.2.4}
$$
with ranks $2m-1$, $m$ and $m(2m-1)$; at $m=2$ the triple is $H_3(\mathbb R)$, $V_5\cong H_2(\mathbb H)$ and $H_6(\mathbb C)$.

Theorem 8.8g.2 selects the complex carrier from the Jordan--von Neumann--Wigner list and (8.8g.2.2) alone. For associative carriers it replaces the same-scalar-type premise of Theorem 8.4(i) by the self-composite of size $n^2$.

*Proof.* In the simple list of Barnum and Hilgert (2020, §3, Table 1), $\mathbb R$ has rank $1$, $V_s$ has rank $2$, $H_n(\mathbb D)$ has rank $n$ and $H_3(\mathbb O)$ has rank $3$. The dimensions in Theorem G.1.8d's table then give (8.8g.2.1), and they separate the simple carriers of each rank. For $n=2$, $\dim A=s+1\ge3$ and $(s+1)^2\in\{10,16,28\}$ force $s=3$, so $A\cong V_3\cong H_2(\mathbb C)$ and $\dim C=16$ gives $C\cong H_4(\mathbb C)$. For $n\ge3$ write $\dim A=nf$ with $f\in\{(n+1)/2,\,n,\,2n-1\}$, or $\dim A=27$ at $n=3$, and $\dim C=n^2g$ with $g\in\{(n^2+1)/2,\,n^2,\,2n^2-1\}$. Then (8.8g.2.2) reads $f^2=g$, and
$$
\begin{array}{c|ccc}
f^2-g&g=\frac{n^2+1}2&g=n^2&g=2n^2-1\\ \hline
f=\frac{n+1}2&-\frac{(n-1)^2}4&-\frac{(n-1)(3n+1)}4&-\frac{(n-1)(7n+5)}4\\
f=n&\frac{(n-1)(n+1)}2&0&-(n-1)(n+1)\\
f=2n-1&\frac{(n-1)(7n-1)}2&(n-1)(3n-1)&2(n-1)^2
\end{array}
\tag{8.8g.2.5}
$$
vanishes for $n\ge2$ only at $f=n$, $g=n^2$. At $n=3$, $27^2=729\notin\{45,81,153\}$. This proves (8.8g.2.3). A multiplicatively closed size set containing $n\ge2$ contains $n^2$, which gives item 1. In item 2, each diagonal block $(k,k)$ with $r_k\ge2$ satisfies (8.8g.2.2), and $A_k\cong\mathbb R\cong H_1(\mathbb C)$ when $r_k=1$. Kronecker products of real bases of $H_p(\mathbb C)$ and $H_q(\mathbb C)$ form a real basis of $H_{pq}(\mathbb C)$; they send units to units and positive pairs to positive operators, and products of sharp contexts are sharp contexts, which proves the converse. The boundary pairs in item 3 follow from (8.8g.2.1), additivity of rank over direct sums and $\dim H_{2m-1}(\mathbb R)=\dim H_m(\mathbb H)=m(2m-1)$. ∎

<a id="proposition-88g2a-conditional-minimum-for-a-phase-reference-preserving-divisible-flip"></a>**Proposition 8.8g.2a (Conditional Minimum for a Phase-Reference-Preserving Divisible Flip).** Let the normalized carrier be the full Euclidean ball $B^s$, $s\ge2$, and consider its affine automorphisms as candidate reversible updates. Register orthogonal unit vectors $e_x,e_z$: the record alternatives are $\pm e_z$, while $e_x$ is a separately retained phase-reference preparation. Require a flip $N$ satisfying
$$
Ne_x=e_x,\qquad Ne_z=-e_z,
\tag{8.8g.2a.1}
$$
and a continuous one-parameter group $U:\mathbb R\to\operatorname{Aut}(B^s)$ on this same carrier, with $U(1)=N$. Within this candidate class such a pair exists exactly when $s\ge3$. In particular, $s=3$ is the least feasible ball dimension. The impossibility at $s=2$ already follows from the weaker requirement of a real-linear square root of $N$.

*Proof.* An affine automorphism preserves the ball's center and is therefore linear; preservation of the ball makes it orthogonal. At $s=2$, the registered vectors form a basis and (8.8g.2a.1) forces $N=\operatorname{diag}(1,-1)$. If a real matrix $G$ satisfied $G^2=N$, then
$$
-1=\det N=\det(G^2)=(\det G)^2\ge0,
$$
a contradiction. A one-parameter realization would supply $G=U(1/2)$.

For every $s\ge3$, choose a unit vector $e_y\perp e_x,e_z$. Let $U(t)$ rotate $\operatorname{span}\{e_y,e_z\}$ through angle $\pi t$ and fix its orthogonal complement pointwise. Then $U(t+u)=U(t)U(u)$, $U(1)e_z=-e_z$, and every $U(t)$ fixes $e_x$. Thus $N=U(1)$ has the same-carrier roots $U(1/k)$ for every positive integer $k$. ∎

**Scope and provenance.** The determinant obstruction is the square-root argument of Aaronson (2004, §4). Its application here depends on the extra reference condition. A rebit can continuously swap the two record projectors by the real amplitude rotation
$$
R(\theta)=\begin{pmatrix}\cos\theta&-\sin\theta\\\sin\theta&\cos\theta\end{pmatrix},
\qquad R(\pi/4)^2=R(\pi/2).
$$
The resulting endpoint conjugation reverses both Bloch-disc axes, so it fails reference preservation. Boolean negation alone does not specify that reference behavior. Elapsed time alone also does not establish identical half-steps; the one-parameter dynamics is an additional hypothesis.

Rank-two simple Euclidean Jordan carriers include every spin factor $V_s$, $s\ge2$, with normalized state ball $B^s$; the division-algebra cases do not exhaust them (Barnum and Hilgert 2020, Table 1). The proposition supplies an existence construction, not roots for every higher-dimensional flip. Physical admission requires the reference and rotation protocol to be certified. Selecting $V_3\cong H_2(\mathbb C)$ further requires a declared candidate census and a cost order strictly favoring the least feasible dimension. The composite-carrier and Born-domain certificates remain those of Theorem 8.8g.2 and Definition 8.2b; neither is supplied by this proposition.

<a id="proposition-88g3-complete-response-quotient-of-the-controlled-wave-source"></a>**Proposition 8.8g.3 (Complete Response Quotient of the Controlled-Wave Source).** Register the following finite-instance controlled-wave source. An $n$-mode bank has real quadratures $(q_j,p_j)$, fixed rotation $J(q,p)=(-p,q)$ and signal energy $E_0\sum_j(q_j^2+p_j^2)$; write $z=q+ip\ne0$. Known-setting finite mixtures prepare any specified nonzero vector with $\|z\|\le1$, with the remaining supplied energy sealed in the source. Lossless real orthogonal couplers commute with $J$, and a finite partition of their outputs gives blocks $A_b$ with $\sum_bA_b^*A_b=I$.

A fresh independent uniform rotor $U\in[0,1)$ selects the unique branch satisfying

$$
\sum_{c<b}\|A_cz\|^2\le U\|z\|^2
<\sum_{c\le b}\|A_cz\|^2.
\tag{8.8g.3a}
$$

It routes $A_bz$ unchanged; zero-energy intervals contribute no outcome. Internal branch labels may be grouped into a visible label, and the unreported source/rotor stock remains sealed and consumed. Product-preparation circuitry consumes two inputs and has the independently specified real multiplier transfer $z,w\mapsto z\otimes w$, with its work/absorber stock owned. Known joint-mode preparation is also supplied. Each finite protocol has its finite control, clock and retained-record services. The receiver has these typed operations and visible labels, with no direct power, quadrature, recipe, rotor, discarded-path or live-copy port and no additive coherent reference input. These are ideal source/interface premises.

For a finite raw preparation $\mu=\{p_l,z_l\}$ put

$$
R(\mu)=\sum_l p_l\frac{z_lz_l^*}{\|z_l\|^2}.
\tag{8.8g.3b}
$$

Then:

1. $R$ has range exactly the density operators on $\mathbb C^n$ and identifies exactly preparations with equal complete retained finite-protocol responses. A visible outcome $a$ acts by
   $$
   T_a(R)=\sum_{b:\,label(b)=a}A_bRA_b^*,\qquad
   \Pr(a\mid\mu)=\operatorname{Tr}T_a(R(\mu)).
   \tag{8.8g.3c}
   $$
   These rules compose through every admitted adaptive finite history, including independent spectator products and actual correlated joint preparations.
2. Every finite rectangular block family with $\sum_bA_b^*A_b=I$ has a source realization. The retained cone and pairing are $H_n(\mathbb C)_+$ and $\operatorname{Tr}(AB)$, with the full dual effect cone, all effects $0\le E\le I$ and a sharp coordinate context. Contractive congruence filters realize conditional transitivity on faithful normalized states, with finite resources for each specified filter.
3. The product-preparation and local-operation maps give the full locally tomographic composite $H_{nm}(\mathbb C)$ and the product-effect vector-space isomorphism. The self-composite has rank $n^2$ and dimension $n^4$, and $H_n(\mathbb C)$ is simple.
4. The actual reversible source law $\dot z=-iaz$ induces $\dot R=-i[a,R]$ and adjoint Jordan derivation $\psi_a(b)=i[a,b]$, with $\psi_a(a)=0$ and scalar kernel. The exact response-null unitary group is $\{e^{i\theta}I\}=U(1)$. Irreversible selector instruments retain their separate meaning in (8.8g.3c).

*Proof.* Interval length in (8.8g.3a) gives $\Pr(b\mid z)=\|A_bz\|^2/\|z\|^2$. Multiplying this by the normalized second moment of the selected field cancels $\|A_bz\|^2$, giving $A_bzz^*A_b^*/\|z\|^2$. Averaging and grouping gives (8.8g.3c). Induction on a finite protocol tree proves every retained history law; the normalization and numerator also give its conditional future state. Independent product preparation gives the tensor product of the two moments, while a correlated joint source uses its joint moment. Every density operator is prepared by its finite spectral mixture. Binary splitters testing $v^*Rv$ separate Hermitian matrices by polarization; coordinate and real/imaginary two-coordinate projectors provide $n^2$ separating effects. This proves both directions of the quotient statement.

Stack a normalized block family to obtain an isometry and complete its columns to a unitary. A lossless coupler with zero modes appended, partition and rotor selection then implements that family. The blocks $\sqrt E,\sqrt{I-E}$ give every effect. Rank-one tests prove self-duality of the positive cone under the trace pairing. For faithful $\rho,\sigma$, $g=\sigma^{1/2}\rho^{-1/2}$ obeys $g\rho g^* =\sigma$; scaling by any finite $c\ge\|g\|$ and completing the failure block realizes its successful conditional state. This is pointwise finite conditional steering.

The product transfer gives the tensor-preparation identity. Known joint settings give the full joint density cone, and tensor products of real Hermitian bases span $H_{nm}(\mathbb C)$, proving local tomography and the product-effect isomorphism. Its rank and dimension give the self-composite identities. A nonzero Jordan ideal in $H_n(\mathbb C)$ contains a nonzero spectral projection, then a rank-one subprojection by multiplication with that subprojection. Incident off-diagonal matrix units, their squares and further Peirce products generate every matrix unit, so the ideal is the whole algebra.

Differentiating the source moment gives the stated commutator evolution. Direct expansion proves the Jordan derivation identity and stationarity. A Hermitian matrix commuting with all Hermitian matrices is scalar. A unitary preserving every ray projector is diagonal on coordinate rays, and two-coordinate superpositions equate all its phases. Conversely a common phase cancels in every source response and tensor construction at the declared interface. This proves item 4. ∎

The source's interface premises are testable mathematical boundaries. The equal-moment ensembles $\{e_0,e_1\}/2$ and $\{(e_0+e_1)/\sqrt2,(e_0-e_1)/\sqrt2\}/2$ are distinguished by an exposed first-coordinate power event, and live copying followed by a two-copy $Z\otimes Z$ test also distinguishes them. Those expanded interfaces have a different quotient.

<a id="construction-88g31-complete-controlled-wave-source-and-powered-pu-task"></a>**Construction 8.8g.3.1 (Complete Controlled-Wave Source and Powered PU Task).** Proposition 8.8g.3 derives the response quotient, instrument compiler, conditional filters, composites and phase kernel from the following controlled-source laws. The source has exact real controls, fresh classical rotors, fixed slots, consume-once modules and a sealed response interface. The complete source and its presentation-relative adaptive task are as follows.

#### 8.8g.3.1.1 Microscopic source and retained ports

For each positive integer $n$, a wave bank has $2n$ real quadratures $(q_j,p_j)$, a fixed calibrated ninety-degree rotation $J(q,p)=(-p,q)$, and positive energy unit $E_0$. Write $z_j=q_j+ip_j$ as notation. Its stored signal energy is $E_0\sum_j(q_j^{2}+p_j^{2})$. Live signal amplitudes satisfy $0<\lVert z\rVert^{2}\le1$. A known setting can prepare any specified finite real quadrature vector in this ball. A preparation program may sample among finitely many known settings with a separately specified classical distribution. The stored classical choice is sealed after preparing the signal. Every such preparation uses the same precharged signal module $E_0$: it routes $E_0\lVert z\rVert^{2}$ into the live waveform and the remaining $E_0(1-\lVert z\rVert^{2})$ into a sealed source store/absorber. Thus different raw radial settings do not silently change the public initial inventory. A reading of that residual energy is an explicitly excluded extra port, not an assumed null measurement.

These are ideal exact real-parameter controlled sources. A finite device instance has finitely many modes, coefficients, gates, fresh noise modules, clock slots and output labels. The union over finite supplied instances is the admitted family; no single finite source performs an infinite menu or indefinite service.

##### Elementary hardware laws

A. A lossless coupler is a real orthogonal linear map commuting with $J$. Its independently calibrated quadrature transfer is $x_{\mathrm{out}}=Ox_{\mathrm{in}}$. Zero signal modes can be appended. There is no additive coherent local-oscillator input on an open receiver port. Since $OJ=JO$, these maps are precisely the complex unitary matrices in the $z$ notation: this is a real-linear algebra conclusion, not an assumed quantum dynamics law.

B. A splitter is a lossless coupler followed by a fixed partition of its output modes into finitely many banks b. It conserves total signal energy. Every discarded or unused path remains behind the sealed source boundary. A live input can be consumed only once; no unselected path is an output port. Static known-source fanout in state preparation is allowed. Live unknown-signal fanout into two retained receivers is not supported by the interlocked switch topology.

C. Each selector has one fresh classical rotor with angle $\theta$ uniformly distributed on $[0,2\pi)$, independent of the input and all earlier rotors. Uniformity is a stipulated classical equilibrium preparation of a rotor with angle-independent Hamiltonian, not a response calibration. Put $U=\theta/(2\pi)$. Classical square-law meters internal to the box read the branch energies $e_{b}\ge 0$. A sealed energy multiplier/comparator sends the one output bank $b$ for which

$$
\sum_{c<b} e_c \le U \sum_c e_c < \sum_{c\le b} e_c.
$$

The energies enter this deterministic comparator law; no branch probability is stipulated. Zero-energy intervals are empty. Ties have classical measure zero. The input energy is positive, so exactly one interval is selected almost surely. The selected field is routed unchanged, without division or amplitude normalization. A write-once visible label may group several internal b labels; the unreported b and rotor never interact with a later receiver. Its entire source module is consumed, not reset for reuse.

D. A product-preparation mixer consumes two live banks $z\in\mathbb{C}^n$ and $w\in\mathbb{C}^m$ and outputs a fresh $nm$-bank with coordinates

$$
q'_{jk}=q_j r_k-p_j s_k,\quad p'_{jk}=q_j s_k+p_j r_k.
$$

This is a specified finite real multiplier/addition circuit, with its actual nonlinear transfer law independently fixed. The two original ports terminate in sealed absorbers. Its output is $z\otimes w$, with energy $E_0\lVert z\rVert^{2}\lVert w\rVert^{2}\le E_0$. Its source-owned work supply and absorbers are included; this is not passive composition and is not derived from optical linearity. A same-port duplicate connection is rejected by the consume-once wiring. Independently prepared random inputs yield the independent product preparation. Correlated input preparations are registered by their joint classical law, never silently replaced by a product law.

E. A known coherent joint preparation is built by a supplied reference sinusoid, calibrated phase shifts, attenuators and known-setting fanout into finitely many specified joint-mode amplitudes. For example, exactly n equal-phase diagonal ports (j,j), each of amplitude 1/sqrt(n), and zero other ports prepare the normalized diagonal-correlated wave. No unknown amplitude is copied by this operation.

F. An occurrence has a fixed externally supplied slot length $\tau>0$. Ideal lossless quadrature transfer and ideal selector transfer occur within that slot. All visible outputs are latched at its end. No decision-time measurement or access inside the slot is an admitted port. All ready modules and fixed-clock controls are supplied and charged in advance. Fixed-clock ideal transfer is a source assumption, not an assertion that a noisy finite-bandwidth comparator realizes it exactly. Each finite experiment has a finite declared schedule. Later controller settings may depend on visible earlier labels and an exogenous setting register, but not on sealed energies, rotors, hidden internal labels, or unused fields.

##### Physical cut and complete retained interface

The externally accessible outputs are the one selected live bank through this typed interface, the specified write-once labels, the common post-preparation experiment control settings, occurrence identities, registered slot times, and a fixed padded initial resource inventory. Preparation-recipe commands, raw energy settings, random-mixture switch settings and its realized index are source-owned and unreadable downstream. Comparisons of preparation states use the same future experiment and same padded inventory; they do not compare a public log naming the two different preparation recipes. A source token specifies which slots belong to a run; a controller cannot reopen a consumed module. Accessible signal interventions are exactly fresh instances of A–D and visible classical control/forgetting; there is no direct quadrature, absolute-power, rotor, discarded-path, or source-bath port. The receiver interface is a hardware enclosure with these typed ports, not a declaration that existing exposed meters are ignored. An expanded cut exposing any of those signals is a different source and must be analyzed separately.

Energy is not omitted: initial signal $\le E_0$; each lossless splitter conserves it across selected and sealed banks; each selector only routes; product mixers have their specified work/absorber stock. The selected signal's absolute energy and discarded-energy partition are internal variables. Total bank-plus-absorber energy balance and ready-module inventory are source accounting records, not extra public readings of the input. No heat, minimum work, cyclic reset or arbitrary-source energy optimum is claimed. If calorimetry is made a response port, Theorem 1's quotient can fail.

Public program identities and known control commands index the experiment; their spellings are not an extra preparation-response observable. Response equality is conditional on the chosen common future test, retaining every actual emitted classical record. If an experiment explicitly emits a program or preparation tag, that tag is a new output and must be included in the quotient.

The source grammar is the finite acyclic composition of these occurrences, with direct sums of classical labels, known preparation, product preparation, spectator identities, conditional choice, forgetting and a single selected output for each input. It includes every finite choice of calibrated real coefficients admitted by the source laws. Extra physical operations are not inferred from having described a mathematical matrix.

#### 8.8g.3.1.2 1. Independent physical readiness circuit

Augment each of the $n$ complex wave channels by two classical bias branches, one for each quadrature controller. Each branch has an independently specified ideal voltage source $V_{b}>0$ and a resistor $R_{b}>0$; the operational amplifier used for that channel's quadrature routing/energy comparison requires this branch to be energized. A hardware interlock declares a live channel only while both branch currents are $V_b/R_b$. Unbiased channels are disconnected and cannot act as carrier modes. At the beginning of the registered two-cycle task window the live-channel set is latched and held for its entire duration $T>0$. Each bias resistor's dissipated power is $V_b^{2}/R_b$ by its actual circuit equations. It does not depend on a terminal response, the signal amplitude, a Born table, or a desired dimension.

All implementations admitted by this source technology use the same quadrature-controller module. They may have any finite n and any calibrated coupler realization supported by CSW. They cannot remove or short a bias resistor while continuing to call its controller live. This is an exhaustive technology rule embodied by a specific module, not an assertion about arbitrary other hardware. Extra disabled channels are removed before n is counted. Ready signal/rotor/switch/control modules are freshly supplied; no cyclic reset claim is needed.

For the registered same-task two-cycle window, all devices have the same initial normalized signal energy E0, eight fixed slots (four per cycle) and the same number and type of fresh external classical input and rotor modules. Its other components are the ideal lossless controlled couplers, switches, exact comparator and multiplier transfer laws already explicitly nominated in CSW. In this ideal technology their supplies exchange no unaccounted dissipative work; the only continuous dissipators are the specified bias resistors. Each run's fixed common ready-module cost $C_{\mathrm{ready}}$ and input-energy stock E0 are listed separately. They are not inferred from entropy. Signal energy is partitioned between surviving signal and sealed absorbers with total E0. This partition is a separate complete stock/transfer ledger, not added again to resistive heat.

Thus the **actual mandatory readiness heat** is exactly

$$
Q_{\mathrm{ready}}(n)=2n V_b^{2} T/R_b.
\tag{8.8g.3.1.1}
$$

Other common ledger entries cancel in a comparison of matched cycle realizations. Any extra hardware or dissipation admitted as an optional addition is nonnegative. The canonical $n=8$ realization uses no such addition. Therefore for every $n>8$ realization of the same response presheaf in this technology,

$$
C_{\mathrm{total}}(n)-C_{\mathrm{total}}(8) \ge 2(n-8)V_b^{2}T/R_b >0.
\tag{8.8g.3.1.2}
$$

Units are $V_{b}$ in volts, $R_{b}$ in ohms, $T$ in seconds, so (8.8g.3.1.1) is joules. Example: $V_{b}=1$ V, $R_{b}=1$ ohm, $T=4$ s gives $Q_{\mathrm{ready}}(8)=64$ J and the next-bank gap at $n=9$ is 8 J. This deliberately inefficient formal hardware is not presented as optimal electronics. The positive gap comes from actual resistor current, not an imposed per-mode tariff. If a lower-power controller is admitted into the comparison technology, (8.8g.3.1.2) must be rechecked; that is a change of comparison class.

The energy source has a battery with initial stock $C_{\mathrm{ready}}+E_0+2nV_b^{2}T/R_b+E_{\mathrm{res}}$, $E_{\mathrm{res}}\ge0$. At $T$ the resistors have received the displayed heat, source preparation/control modules their registered common ready costs, and signal plus absorbers contain total $E_0$. No heat conversion factor is applied to program length, random bits or draw entropy. The battery/resistor module is source-owned and sealed from receiver response ports, while its construction and energy transfers remain in the cost ledger. It is never claimed response-null after its cost is forgotten in a cost comparison.

#### 8.8g.3.1.3 2. Actual environment, adaptive loop and response law

Let the observed environment be a classical binary Markov source. At cycle $t$, $B_{t+1}=B_t\oplus F_{t+1}$, where $B_{0}$ is a fair classical bit and the fresh independent $F$ bits have $\Pr(F=1)=1/4$. This is supplied by a classical rotor interval $[0,1/4)$, independently of the predictive source. The forecast must be committed before $F_{t+1}$ is drawn. Accuracy is probability of a correct forecast, averaged over the registered two-cycle window. Each of its eight slots lasts $T/8$, so the readiness duration $T$ covers the whole task. The model update after the first verification is actually used by the second forecast. The matched random forecast is an independent fair bit with accuracy 1/2. Fix margin $\epsilon_{\mathrm{acc}}=1/8$; qualification requires $\text{accuracy}>5/8$ and an actual adaptive prediction/verification/update loop.

Use an eight-mode CSW bank with coordinate vectors $e_{m,p,i}$, $m,p,i\in\{0,1\}$. $M$ is model memory, $P$ the committed prediction register and $I$ the incoming verification register. The acquisition of $B_{0}$ prepares $e_{B_0,0,0}$, with its preparation switch sealed. Each of the two cycles has four fixed slots:

1. Prediction: the calibrated permutation $e_{m,p,i}\to e_{m,p\oplus m,i}$, starting with $p=i=0$, commits $P=M$. This is the actual CNOT permutation coupler, not a stipulated quantum gate.
2. Observation: after commitment, draw the external $F$ and let $B'=B\oplus F$. The classical verification input $B'$ controls the permutation $X_I^{B'}$, writing $I=B'$. This external input is a common experimental setting at that time; it is not a leaked future bit at forecast time.
3. Verification: the coordinate splitter retains the distinct label $(M,P,I)$, and the ordinary classical comparator writes $S=1\{P=I\}$. Distinct triples are not merged in the verification record.
4. Update: route the signal to $e_{I,0,0}$, consuming the old packet and storing its unused coordinates only in the sealed module. This many-to-one operation is physically compiled from the eight blocks $A_{m,p,i}=|i,0,0\rangle\langle m,p,i|$, whose sum $A^*A=I$. All eight microscopic labels are grouped into one public completion flag; the earlier verification record remains write-once. No free erasure or reset heat is asserted: each cycle uses fresh modules.

The new model memory is the actual observed $B'$, so it changes whenever the environment flips. Conditional on every past visible history, the next forecast is correct with probability 3/4. Thus the same finite-window accuracy is $3/4>5/8$. The full joint per-cycle law from initialized memory $m=B$ is

$$
\begin{aligned}
&(\text{forecast } P=m,\ \text{verification } I=m,\ \text{score } 1,\ \text{next } M=m): 3/4, \\
&(\text{forecast } P=m,\ \text{verification } I=1-m,\ \text{score } 0,\ \text{next } M=1-m): 1/4.
\end{aligned}
\tag{8.8g.3.1.3}
$$

The update is used in the next prediction. A null intervention replacing M by an independent fair bit before prediction gives accuracy 1/2, proving the model is response-active. Disabling verification/update destroys the stipulated adaptive loop. No inference of SPAP or self-reference is made from this small task; those accepted global constraints can be retained on an independent original sort without being used to select this carrier.

#### 8.8g.3.1.4 3. Exhaustive bounded presentation, with no universal-complexity claim

Fix a prefix-machine presentation whose short source programs are:

- 00: fair-coin forecast with no model update
- 01: frozen initial-bit forecast, with no later model update
- 100: the four-slot adaptive source above, except predict the complement of M
- 101: the four-slot adaptive source of section 2

Make the program presentation exact as follows. Fix once a binary prefix-universal machine $V$ and put $U_0(1p)=V(p)$, with every other input undefined; $U_0$ is prefix-universal and has no empty valid program. Define $U$ on the four displayed exact words by outputting the corresponding **complete initial source-state codes** $\mu_{00}$, $\mu_{01}$, $\mu_{100}$ and $\mu_{101}$. Define $U(110p)=U_0(p)$. Define $U(111a)=\mathrm{Dec}_{\mathrm{arch}}(a)$, where $a$ is a nonempty prefix-free self-delimiting architecture word, and $\mathrm{Dec}_{\mathrm{arch}}$ outputs its complete larger-source state or is undefined on malformed words. No other $U$ input halts. These branches are disjoint and prefix-free, and $U$ is universal through the 110 escape. Every non-short halting program has length at least four. The $B=3$ decoder exhausts all fifteen binary words of length at most three and returns exactly the four displayed templates or rejection; neither 110 nor 111 alone is a valid escape program.

The exact initial internal state code $\mu_{a}$ contains: $n=8$, the initialized quadrature vector $e_{0,0,0}$, the latched four-slot controller ROM template $a$, the task phase at acquisition, zero output/score latches, the bias-circuit parameters and initialized battery stock, the complete sealed wiring, blank consumed-module log, and ready empty sockets for the independently supplied future environment/rotor inputs. These are complete internal source data. The fair initial environmental bit and future flip/rotor variables are independently registered external source inputs, not unknown device variables falsely given finite codes. Acquisition then loads $B_0$ through the source-controlled coordinate permutation. The law of these external inputs is part of the experiment specification and is identical for all candidate programs.

The physical validator $D$ is fixed from the circuit grammar, component laws, initialized fields and allowed source templates above, before the forecasting response is calculated. It accepts a finite state code exactly when it describes one of these typed source assemblies (including a finitely encoded larger live-channel architecture); it does not inspect a desired accuracy or a terminal Born table. Use the constant source-admissibility hierarchy $L_k=\{p:\text{ if }U(p)\text{ halts with output }m\text{, then }D(m)=\text{true}\}$, for every $k$. This is a formally defined nested hierarchy; effective decidability of arbitrary halting is not asserted or needed. For an accepted target state $\mu$, $D(\mu)=\text{true}$ and every halting program for $\mu$ belongs to every $L_{k}$, so $C_P(\mu)=\min\{|p|:U(p)=\mu\}$. The finite lower-bound proof uses only the fully known outputs at lengths $\le3$, never an undecidable search through long programs. The universally interpreted longer programs are allowed when they output a $D$-valid source; they are not artificially excluded merely for using the universal route.

The minimum concerns the complete source state, including its physical controller, **not its bare bank density**. Different templates may initially have the same $e_{0,0,0}$ density but have different ROM/control states and predictive responses. Those complete states are not identified by the program-length argument. The carrier projection for a fixed registered controller/protocol is the same raw-wave quotient $R$ from Proposition 8.8g.3. The ROM, ready apparatus and external task controls are fixed context of that carrier experiment, and actual score/history labels are retained classical outputs. If a controller mode is left unknown, the response object is a classical direct sum indexed by that mode, not silently collapsed into one simple matrix carrier.

The two first templates fail the adaptive-loop requirement regardless of any temporary forecasting success. The null template has mean accuracy 1/2; the frozen-initial-bit template has success 3/4 then 5/8, giving two-cycle mean 11/16, but is excluded because it does not update its model. Code 100 is adaptive but has conditional accuracy 1/4. Code 101 is adaptive and has accuracy 3/4. No code of length below 3 qualifies. Every source program outside the bounded census has length at least 4. Consequently the code-101 initial microstate is a qualifying state of least presentation-relative program length 3. There may be longer descriptions of the same state; they do not lower its minimum. This establishes Definition-23 attainment **for this declared presentation and physical source class**, using explicit source preparation, performance and decoder exhaustion. This calculation uses the declared presentation. A separate reference hierarchy requires its own structural-independence and membership proofs under Definition 2.4.1d.

The fixed source description encodes the exact rational preparation settings, Markov probabilities, permutations and eight update blocks used in the adaptive task; it does not require an arbitrary real number to have a finite binary code. The larger continuous family of experimentally supplied CSW controls is a physical protocol input family for the same carrier, not an assertion that every real-valued microstate has a finite program description.

#### 8.8g.3.1.5 4. Eight responses, phase/correspondence and same-presheaf cost

All eight coordinate preparations and their retained verification labels are physically available source settings. Thus one sharp context perfectly distinguishes eight states. After the CSW response quotient, any faithful full matrix representative of this same context requires $n\ge 8$: eight nonzero mutually orthogonal supports fit only in that dimension. The $n=8$ source realizes the entire finite-protocol presheaf by Proposition 8.8g.3, not just the displayed coordinate task.

For every larger same-presheaf realization admitted by the technology, use the translated original eight-mode finite-protocol interface, count its actual live channels after removing disabled/nonexistent ones, retain its cost ledger, and apply (8.8g.3.1.2). Extra live channels are response-null only relative to that translated interface; they still have actual mandatory bias dissipation. If arbitrary extra-mode preparation or readout is newly exposed as a visible control, the response presheaf has been enlarged and that device is outside this same-presheaf comparison. The larger representation may use any translation preserving every original retained response, not only a nominated padding embedding; the heat bound depends only on its actual live-channel count and therefore covers all such translations in this technology. Null response decorations do not remove actual resistor dissipation. The source includes the $n=8$ comparator, so the strict positive physical cost difference excludes every $n>8$ same-presheaf member of this technology. No enumeration of all compact groups, all hardware, or all physical prediction tasks is invoked.

The full dual cone, homogeneous filters, product/multiplier composite, exact phase kernel and complete response quotient are the source maps proved in Proposition 8.8g.3. For the original carrier alternative we choose **self-composite and simplicity**: $A=H_n(\mathbb{C})$ and $C=H_{n^{2}}(\mathbb{C})$, with actual source product preparation, product-effect vector-space isomorphism, $\dim C=(\dim A)^{2}=n^{4}$, and $\operatorname{rank}C=(\operatorname{rank}A)^{2}=n^{2}$. Both are simple because every nonzero Jordan ideal of Hermitian matrices contains a nonzero spectral projection, its matrix-unit Peirce products generate all entries, and hence contains the unit and all of $A$. Equivalently one may consume the accepted simple-Jordan classification of 8.8g.2. The full conditional-filter group is transitive on faithful states; self-duality is the actual source trace pairing. Thus no assumption that every irreversible interaction update is a derivation is made. The present qualifying predictive loop is implemented by particular members of that same independently calibrated source grammar. Its internal lossless evolution and registered interaction/selector updates therefore supply the actual PU-to-source-to-self-composite/simplicity and PU-to-process maps for this declared branch. As in the manuscript, the irreversible interaction update is not mislabeled a Jordan derivation: the correspondence describes the reversible prediction/control generator family, while the normalized retained-flag interactions have the separately proved instrument realization.

<a id="corollary-88g32-populated-controlled-wave-carrier-certificate"></a>**Corollary 8.8g.3.2 (Populated Controlled-Wave Carrier Certificate).** Construction 8.8g.3.1 and Proposition 8.8g.3 populate the carrier certificate of Definition G.1.8a on this formal source. The selected route is self-composite and simplicity: the source carrier is $H_n(\mathbb C)$, its actual self-composite is $H_{n^2}(\mathbb C)$, and the product-effect isomorphism, simplicity, local tomography and exact scalar $U(1)$ kernel have the proved source maps. Every specified faithful-state steering has its finite compiled conditional filter. Forward calibration fixes quadratures, transfer coefficients, source noise, wiring, task, prefix presentation and resistor laws before deriving the response tables. The construction also supplies the sharp eight-outcome source and the strict same-presheaf readiness comparison within its specified technology.

*Proof.* Proposition 8.8g.3 gives the two-way complete-response quotient, full state/effect cones, pointwise finite filters, actual product preparation and local wiring, product-effect basis, simplicity and scalar phase kernel. Construction 8.8g.3.1 supplies the same-source adaptive prediction/verification/update loop, complete prefix census and the physical readiness comparison. The chosen self-composite route uses the reversible source correspondence only for reversible controls; the retained-flag model update keeps its instrument meaning. These are the required certificate fields on the specified source and protocol class. ∎

<a id="theorem-88g4-intrinsic-homogeneous-two-qubit-composite-rigidity"></a>**Theorem 8.8g.4 (Intrinsic Homogeneous Two-Qubit Composite Rigidity).** Put $Q=H_2(\mathbb C)_+$ and $V=H_2(\mathbb C)$. If a proper homogeneous cone $K$ on the complete real tensor carrier $V\otimes_{\mathbb R}V$ satisfies
$$
Q\otimes_{\min}Q\subseteq K\subseteq Q\otimes_{\max}Q,
\tag{8.8g.4.1}
$$
then $K$ is real-linearly order-isomorphic to $H_4(\mathbb C)_+$. Its intrinsic rank and full-effect capacity are four for every strictly positive normalization. The tensor sandwich uses all positive local dual effects and includes response factorization and local tomography. No joint-rank, pure-state-transitivity or local-dynamics premise is added.

*Proof.* We first state the homogeneous-cone structure used below. A rank-$r$ Vinberg $T$-algebra has real diagonal blocks and off-diagonal real spaces $A_{ij}$, $i<j$, with $n_{ij}=\dim A_{ij}$. Its Hermitian cone has dimension
$$
r+\sum_{i<j}n_{ij}.
\tag{8.8g.4.3}
$$
Writing $t$ for an upper triangular element, its positive elements are the products $tt^*$, including the boundary by nonnegative-diagonal factorization. The product decomposes as the sum of its positive column squares. Its dual has the reversed grading. Every face is carried to a principal face by a triangular automorphism; proper face inclusion strictly increases rank, and the longest face chain has $r+1$ members. A rank-two principal face has Lorentz dimension $n_{ij}+2$, with the orthant when $n_{ij}=0$. The terminal diagonal functional $\delta_r$ is scaled by the same triangular group. These statements are the $T$-algebra representation, principal-face, duality and chain results of Gouveia, Ito and Lourenço, Section 2.1, Proposition 2.5, Proposition 3.2, Theorems 3.6 and 3.11, Corollaries 3.8--3.9, and Proposition 3.12 of version 3 of their paper. Only the restricted triangular associativity and trace-adjoint identities of that algebra are used in the products below.

**Capacity and product faces.** Full-effect capacity equals homogeneous rank. If $x_1,\ldots,x_m$ are distinguished by positive effects $f_i$ summing to the normalization, the minimal faces generated by $x_1+\cdots+x_j$ form a strict chain: $f_{j+1}$ vanishes on the preceding face and is positive on $x_{j+1}$. Hence $m\le r$. The diagonal rays and diagonal coordinate effects attain $r$ for the trace normalization. Dual homogeneity transports any strictly positive normalization to that one, proving equality. The four computational product states are distinguishable, so $K$ has rank $r\ge4$; tomography gives dimension sixteen.

A product of two pure local rays is extreme in every cone in (8.8g.4.1). In a decomposition of $p\otimes q$, every positive conditional local vector is bounded above by a multiple of the pure ray $p$; therefore each summand has the form $p\otimes y$. Positivity forces $y\in Q$, and extremality of $q$ makes the summand proportional to $p\otimes q$. The same conditional argument proves that $p\otimes Q$ and $Q\otimes p$ are exposed qubit faces: expose the pure marginal $p$ and condition against all full-dual effects. These conclusions also hold in $K^*$, since $Q$ is trace-self-dual.

**Spanning terminal columns.** The final triangular column spans the full Hermitian space, in both $K$ and $K^*$. To see this without aligning any operational context, note that every extreme ray is proportional to one column square in a positive column decomposition. If the span of every column-square family were proper, choose a nonzero linear functional vanishing on each span. Their product vanishes on every pure product
$p(s)\otimes p(t)$, where $p(s)=(1,s)(1,s)^*$ and $s,t\in\mathbb C$. This is a polynomial identity in four real variables. Polynomial-ring integrality would make one of those linear functionals vanish on the entire product family, whose span is all sixteen dimensions, a contradiction. A column before the last has a missing final diagonal coordinate; a zero $A_{ir}$ similarly leaves its $i$th diagonal zero. Therefore
$$
n_{ir}>0\ (i<r),\qquad n_{1j}>0\ (j>1),
\tag{8.8g.4.4}
$$
where the second statement follows by duality.

**The real-corner obstruction.** Project positively onto the last two principal indices. The projection is surjective onto a Lorentz cone of dimension $n_{r-1,r}+2$. It sends every extreme ray to a pure ray or zero. For a column before index $r-1$ the projection vanishes; column $r-1$ gives a diagonal ray; column $r$ gives
$$
(a,c,z)=(\|v\|^2,s^2,sv),\qquad ac=\|z\|^2.
\tag{8.8g.4.5}
$$
Suppose $n_{r-1,r}\le1$. A positive map from the complex qubit to this Lorentz cone, of dimension at most three, that preserves pure rays or zero has one-dimensional image. The target Lorentz quadratic pulled back by the map vanishes on the qubit null cone, hence is a multiple of the rank-four qubit determinant form. Its rank is at most three, so the multiple is zero. Two distinct positive image rays would have a strictly interior sum, which is impossible.

Apply this fact to the projected product map with one pure factor fixed. If two choices of that factor used different nonzero output rays, choose a pure state of the other factor on which both nonzero positive scalar functionals are positive. Such a choice exists because each nonzero positive qubit functional has at most one pure zero. Reverse conditioning would then have two distinct output rays, contradicting the same one-dimensional-image result. The whole projected tensor map would have rank at most one, contrary to the projection's surjectivity. Applying the argument to the dual as well gives
$$
n_{r-1,r}\ge2,\qquad n_{12}\ge2.
\tag{8.8g.4.6}
$$

**Rank is automatic.** Suppose $r\ge5$ and inspect the four indices $1,2,r-1,r$. The five off-blocks joining their first or last index are positive, and the two end blocks have dimension at least two. If their middle block $A_{2,r-1}$ vanishes, the two path-product spaces into $A_{1r}$ are orthogonal, so that block has dimension at least four; the five blocks contribute at least ten dimensions. If the middle block is nonzero, norm multiplication makes all five boundary blocks at least two-dimensional, in addition to the positive middle block. Each of the other $r-4$ indices contributes two further positive first-row and last-column blocks. Therefore
$$
\dim K\ge r+10+2(r-4)=3r+2\ge17,
\tag{8.8g.4.7}
$$
contrary to dimension sixteen. Thus $r=4$, with capacity four derived rather than assumed.

**Terminal faces.** Fix a rank-four $T$-presentation. On every qubit face, $\delta_4$ restricts either to zero or to a rank-one qubit effect. Indeed, triangularly principalize that face. The functional is scaled under this operation; on a principal rank-two face it is zero if index four is absent and is a diagonal extreme Lorentz effect otherwise.

Write $\delta_4(x\otimes y)=\operatorname{tr}(x\Phi(y))$. The positive map $\Phi:V\to V$ sends every positive rank-one matrix to rank at most one, and the same is true with the two factors exchanged. The quadratic $\det\Phi(X)$ vanishes on the positive rank-one patch of the irreducible qubit determinant quadric, so
$$
\det\Phi(X)=\lambda\det X.
\tag{8.8g.4.8}
$$
If $\lambda>0$, this is a Lorentz-cone order isomorphism. A negative value contradicts positivity on the interior. If $\lambda=0$, any two nonproportional positive image rays would have a positive-definite sum; hence the image is a ray. Reverse conditioning then makes its scalar positive functional rank one as well. The zero map is excluded by product spanning. Thus $\delta_4$ is either a product of two pure effects or the bilinear form of a qubit order isomorphism.

In the product case its zero pure-product states span a seven-dimensional space: the two four-dimensional qubit spaces have a common ray. In the order-isomorphism case a local order change reduces the zero products to $p(n)\otimes p(-n)$, $|n|=1$. Their span has dimension nine, from the constant, three linear and five traceless symmetric quadratic Bloch components. The principal terminal kernel face and its dual counterpart consequently satisfy
$$
\dim(K\cap\ker\delta_4)\ge7,
\qquad
\dim(K^*\cap\ker\delta'_4)\ge7.
\tag{8.8g.4.9}
$$

**The seven-dimensional kernel is impossible.** Suppose the first face in (8.8g.4.9) has dimension seven. Its terminal effect is a pure product. Local order changes put its zero-product span on the three product coordinates other than $00$, with only the off-diagonal pairs $01\!\leftrightarrow\!11$ and $10\!\leftrightarrow\!11$. It is the complex arrow subspace. Positivity on all product vectors is exactly PSD positivity there: arbitrary retained amplitudes $(r,s,t)$ with $t\ne0$ are the retained components of $(r/t,1)\otimes(s,t)$. The missing component is ignored, and density covers $t=0$. The two local qubit faces already generate the arrow PSD cone. Thus the kernel is exactly that arrow cone in the stated product coordinates.

Here the operational frame can be aligned, for a proved reason specific to this face. Its two qubit branches meet at the unique central pure ray $P_{11}$. In a rank-three $T$-presentation of the arrow, the terminal extreme-column orbit has dimension at most two, as does the pure sphere of any principal rank-two face. The total off-dimension is four. Consequently, after exchanging the leaves,
$$
n_{12}=n_{13}=2,\qquad n_{23}=0.
\tag{8.8g.4.10}
$$
A split into one-dimensional off-blocks would supply a three-dimensional Lorentz face, which the arrow does not have; the alternative directed path contradicts norm multiplication. The triangular arrow group sends the two noncentral product rays to the leaf diagonal rays while preserving the central ray. Its transformations extend inside the principal face of $K$. A terminal-column shear then sends $P_{00}$ to $e_4$ while fixing that face. Positive diagonal scalings give the actual product context $(P_{11},P_{01},P_{10},P_{00})=(e_1,e_2,e_3,e_4)$. This does not assert that an arbitrary maximal context is a $T$-frame.

The remaining two local qubit pair-faces force $n_{24}=n_{34}=2$, and dimension sixteen gives $n_{14}=4$. The product diagonal effects are the $T$ diagonal effects: positivity on every principal Lorentz pair makes all off-diagonal coefficients of an effect with values $\delta_{ij}$ on the diagonal rays vanish. The product map on each of the four adjacent qubit pair-spaces is an order isomorphism fixing both diagonal rays, hence acts orthogonally on its two real off-coordinates. No correlation term can enter such an adjacent off-space. For example, write the local matrices as $X=\left(\begin{smallmatrix}a&x\\\bar x&b\end{smallmatrix}\right)$ and $Y=\left(\begin{smallmatrix}c&y\\\bar y&d\end{smallmatrix}\right)$. In the displayed $T$ ordering, the $24$ component has the form $aR(y)+L_{24}(x\otimes y)$ and obeys $\|aR(y)+L_{24}(x\otimes y)\|^2\le a^2cd$, where $R$ is real orthogonal. Put $x=\sqrt{ab}e^{i\theta}$ and $y=\sqrt{cd}e^{i\phi}$. Fixing $a,c,d,\theta,\phi$ and sending $b$ to infinity forces $L_{24}(e^{i\theta}\otimes e^{i\phi})=0$. These tensors span, so $L_{24}=0$. The other three adjacent components follow by varying their unused local diagonal.

Take both local pure inputs with both diagonals and their off-diagonal equal to one. All four output diagonals and all four adjacent off-block norms are one. In a triangular factor put $z_i=t_{i4}$ and $t_{44}=1$. Saturation gives $\|z_2\|=\|z_3\|=1$ and $t_{22}=t_{33}=0$. Since $A_{23}=0$,
$$
X_{12}=z_1z_2^*,\qquad X_{13}=z_1z_3^*,
\qquad \|X_{12}\|=\|X_{13}\|=1.
\tag{8.8g.4.11}
$$
The maps $a\mapsto az_2$ from $A_{12}$ and $b\mapsto bz_3$ from $A_{13}$ are isometries into $A_{14}$. Their images are orthogonal: the trace-adjoint and triangular identities reduce their inner product to the missing block $A_{23}$. Their adjoints give the two components in (8.8g.4.11). Therefore $\|z_1\|^2\ge2$, although the first diagonal is one and is a sum of nonnegative column norms including $\|z_1\|^2$. This contradiction excludes a seven-dimensional terminal kernel, in $K$ or in $K^*$.

**Exhaustion of the dimensions.** Set
$$
(a,b,c;p,q,r)=(n_{12},n_{13},n_{23};n_{14},n_{24},n_{34}),
\quad a+b+c+p+q+r=12.
\tag{8.8g.4.12}
$$
Norm multiplication along a triangular path gives $\|xy\|=\|x\|\|y\|$. Together with (8.8g.4.4)--(8.8g.4.6), it implies
$$
p\ge\max(a,q,b,r),\qquad
c>0\Longrightarrow b\ge\max(a,c),\ q\ge\max(c,r).
\tag{8.8g.4.13}
$$
If $c>0$, five terms are at least two, so $c\le2$. For $c=2$ every term equals two. For $c=1$ the only possible tuple is $(2,2,1;3,2,2)$: any location for the sole extra unit other than $p$ would force another extra unit by (8.8g.4.13). This tuple is impossible. Choose unit $x\in A_{12}$ and unit $z\in A_{13}$ perpendicular to the one-dimensional space $xA_{23}$. The trace-adjoint identities give $x^*z=0$. The two isometric images $xA_{24}$ and $zA_{34}$ are then orthogonal two-dimensional subspaces of the three-dimensional $A_{14}$, a contradiction.

If $c=0$, (8.8g.4.9) gives $a+b\ge4$ and $q+r\ge4$, hence $p\le4$. The missing block makes the two path-product spaces $A_{12}A_{24}$ and $A_{13}A_{34}$ orthogonal, so
$$
4\ge p\ge\max(a,q)+\max(b,r)\ge a+r\ge4.
\tag{8.8g.4.14}
$$
Equality forces $(a,b,c;p,q,r)=(2,2,0;4,2,2)$, whose terminal kernel has the excluded dimension seven. Thus every off-diagonal dimension equals two. This exhausts the nonnegative integer possibilities; no list of special nonsymmetric cones is assumed.

**Identification of the intrinsic cone.** The all-two algebra is the complex matrix $T$-algebra. A direct identification chooses unit $u_{12},u_{23},u_{34}$ and sets $u_{13}=u_{12}u_{23}$, $u_{24}=u_{23}u_{34}$ and $u_{14}=u_{12}u_{24}=u_{13}u_{34}$. Choose $v_{12}\perp u_{12}$ unit. Define $v_{23}$ and $v_{34}$ uniquely by $u_{12}v_{23}=v_{12}u_{23}$ and $u_{23}v_{34}=v_{23}u_{34}$; multiplication by a unit is an onto isometry between the relevant two-dimensional spaces. Set $v_{13}=v_{12}u_{23}$, $v_{24}=v_{23}u_{34}$ and $v_{14}=v_{12}u_{24}$. Associativity gives, on every upper triangle,
$$
u_{ij}u_{jk}=u_{ik},\quad
u_{ij}v_{jk}=v_{ij}u_{jk}=v_{ik},\quad
v_{ij}v_{jk}=-u_{ik}.
\tag{8.8g.4.15}
$$
For the last sign, orthogonality leaves only $\pm u_{ik}$; the plus sign would make $(u_{ij}+v_{ij})(u_{jk}+v_{jk})$ have squared norm eight instead of four. Trace adjointness fixes the reverse products. Thus $tt^*$ is ordinary complex Cholesky multiplication, proving $K\cong\operatorname{Herm}_4(\mathbb C)_+$. ∎

<a id="theorem-88g5-intrinsic-arrow-self-composite-obstruction"></a>**Theorem 8.8g.5 (Intrinsic Arrow Self-Composite Obstruction).** Let $A=\{X\in H_3(\mathbb C)_+:X_{12}=X_{21}=0\}$ on its seven-dimensional real span. There is no proper homogeneous cone $C$ with positive, response-factorizing, locally tomographic product-state and full-dual product-effect maps for two copies of $A$. The obstruction applies in every finite representation order.

*Proof.* Product response factorization and tomography identify the carrier with $V\otimes V$ and give
$$
A\otimes_{\min}A\subseteq C\subseteq A\otimes_{\max}A,
\qquad \dim C=49.
\tag{8.8g.5.1}
$$
No joint-capacity premise is used. We use the $T$-algebra face and triangular-group facts stated in Theorem 8.8g.4.

**The four intrinsic rectangles.** Put $S_1=\{1,3\}$, $S_2=\{2,3\}$, and let $V_s=\operatorname{Herm}(\mathbb C^{S_s})\subset V$. The local face $A_s=A\cap V_s$ is a complex qubit. The composite face exposed by
$$
f_{S_s^c}\otimes u+u\otimes f_{S_t^c}
$$
is exactly $F_{st}=C\cap(V_s\otimes V_t)$. Indeed, a zero excluded marginal forces every positive conditional local vector into the corresponding local face; local full-dual effects span the dual space. Conversely the displayed functional vanishes on that tensor subspace. Positive products span it, so $\dim F_{st}=16$.

This is the minimal face containing $P_{S_s}\otimes P_{S_t}$. For $x\in A_s$, $y\in A_t$, choose $x\le\alpha P_{S_s}$ and $y\le\beta P_{S_t}$. Then
$$
\alpha\beta P_{S_s}\otimes P_{S_t}-x\otimes y
=(\alpha P_{S_s}-x)\otimes\beta P_{S_t}
 +x\otimes(\beta P_{S_t}-y)\in C.
\tag{8.8g.5.2}
$$
These products span the exposed face. Every positive qubit effect extends to an $A$-positive effect by its supported PSD3 matrix. Thus its induced tensor cone has the full qubit min/max contract, and it is homogeneous because it is a face of $C$. Theorem 8.8g.4 therefore makes it a complex PSD4 cone and derives its rank and capacity four.

The four rectangle spans sum to all 49 dimensions. Adjacent rectangles have intersection $P_3\otimes A_t$ or $A_s\otimes P_3$, a qubit of rank two and dimension four. Opposite rectangles intersect in the ray of $P_3\otimes P_3$. Three rectangle spans have dimension forty. Their intersection with the fourth span is the seven-dimensional space
$$
(\mathbb RP_3\otimes V_t)+(V_s\otimes\mathbb RP_3).
\tag{8.8g.5.3}
$$
These are tensor-subspace identities; no matrix representation of $C$ has been chosen.

**Sink effects factor.** In a fixed $T$-grading of $C$, call $j$ a sink when $A_{jk}=0$ for every $k>j$. Its positive diagonal effect $\delta_j$ is extreme in the dual cone and is scaled by every triangular automorphism: the $j$th row has only its diagonal block. On a principal face containing $j$, its restriction is again a sink coordinate; on a face omitting $j$ it vanishes.

In every rank-three $T$-presentation of the primal arrow, the off-dimensions are $(n_{12},n_{13},n_{23})=(2,2,0)$, with its two leaves interchangeable. Here is the intrinsic check needed for this statement. The arrow pure-ray space is two two-spheres meeting at one point. The terminal pure-column orbit has dimension $n_{13}+n_{23}\le2$, and a principal rank-two pure sphere has dimension $n_{12}\le2$. Their sum is four. Thus $n_{12}=2$ and $n_{13}+n_{23}=2$. A one-plus-one split would give a three-dimensional Lorentz face, whereas a proper arrow face is either one complete qubit branch or is generated by at most one zero ray from each branch. The latter has dimension at most two. The split $(0,2)$ violates norm multiplication on the path $1\to2\to3$. This proves the stated pattern. Its sink effects are exactly the two leaf rays $f_1,f_2$; intrinsically these are the positive effects whose zero face is an entire qubit branch.

For any local pure state $p$, the fixed-factor face $p\otimes A$ is order-isomorphic to $A$, by pure-marginal conditioning. Triangularly principalize it. Since $\delta_j$ scales under that operation, its nonzero restriction is a leaf effect of this arrow face. Therefore
$$
\delta_j(p,\cdot)\in\mathbb R_+f_1\ \cup\ \mathbb R_+f_2
\quad\text{for every pure }p.
\tag{8.8g.5.4}
$$
Pure states span $V$, so $\delta_j=a\otimes f_1+b\otimes f_2$. Conditioning instead on $P_1$ and $P_2$ makes $a,b$ zero or positive leaf multiples. Thus $\delta_j$ is a nonnegative sum of the four positive products $f_i\otimes f_k$, $i,k\in\{1,2\}$. Its extremality leaves exactly one nonzero term. Every sink effect is consequently a positive multiple of one leaf-product effect.

**The kernel dimension fixes the sink face.** Let $F_{st}$ be the selected rectangle on which that leaf product is nonzero. The other three rectangles lie in $\ker\delta_j$, and their spans have dimension forty. Inside $F_{st}$ the restricted effect is a pure product qubit effect. Under its PSD4 identification it is rank one, so its zero face is a PSD3 face of dimension nine. Its span contains the zero-product space (8.8g.5.3), which is exactly its intersection with the other three rectangle spans. Hence
$$
\dim(C\cap\ker\delta_j)\ge40+9-7=42.
\tag{8.8g.5.5}
$$
For a sink, the kernel is the principal face deleting index $j$. Thus its incoming block dimension satisfies
$$
N_j=\sum_{i<j}n_{ij}
=49-1-\dim(C\cap\ker\delta_j)\le6.
\tag{8.8g.5.6}
$$

Principalize the selected rectangle by a triangular automorphism. Its index set contains $j$, because $\delta_j$ is nonzero there and is scaled. It is a complex PSD4 face, so its six off-blocks have dimension two. Since $j$ is a sink, its other three indices precede it, giving $N_j\ge6$. Equality holds. The full column-support set
$$
T_j=\{j\}\cup\{i<j:n_{ij}>0\}
\tag{8.8g.5.7}
$$
is exactly that four-element principal rectangle set.

The span of column-$j$ squares is the whole sixteen-dimensional principal rectangle space: within this PSD4 algebra, $j$ is the last index and its column squares are the usual spanning rank-one family. This column span is invariant under every triangular automorphism, since multiplication of an upper triangular element by a column-$j$ element is still column-$j$; the inverse has the same property. Therefore the original rectangle, before principalization, is already the principal cone on $T_j$. This is a derived identification for a sink face, not an assumption about arbitrary operational frames.

**Generation and incompatible intersections.** The directed nonzero-block relation is transitive: if $A_{ik}$ and $A_{kj}$ are nonzero, norm multiplication makes $A_{ij}$ nonzero. Every vertex reaches a sink. Consequently the support of every column is contained in the support $T_j$ of some sink. Every positive element is a sum of positive column squares, so $C$ is generated by its sink rectangles. Any three of the four rectangle spaces span only forty dimensions; tomography therefore forces all four rectangles to occur as sink faces.

Each $T_j$ is a four-element clique and an ancestor set in the directed relation. It is thus a totally ordered chain, and its intersections with other ancestor sets are initial segments. Choose the rectangles $F_{11},F_{12},F_{22}$. Their intersections with $F_{12}$ both have rank two. In the principal sink chain for $F_{12}$, the corresponding two initial segments are nested. Their smaller member has two indices and lies in the intersection of the sink sets for $F_{11}$ and $F_{22}$. That intersection must have rank at least two. The intrinsic opposite-rectangle intersection has rank one, a contradiction. ∎

<a id="theorem-88g6-homogeneous-composite-rank-multiplication"></a>**Theorem 8.8g.6 (Homogeneous Composite Rank Multiplication).** Let $A\subset V$ and $B\subset W$ be nonzero finite-dimensional proper homogeneous cones. If a proper homogeneous cone $K$ on the complete real tensor carrier $V\otimes W$ satisfies
$$
A\otimes_{\min}B\subseteq K\subseteq A\otimes_{\max}B,
\tag{8.8g.6.1}
$$
then its intrinsic homogeneous-cone rank obeys
$$
\operatorname{rank}K=(\operatorname{rank}A)(\operatorname{rank}B).
\tag{8.8g.6.2}
$$
In particular, every such composite of two nonclassical Lorentz cones has rank four, including unequal local dimensions. The rank in (8.8g.6.2) is the intrinsic $T$-algebra rank; its multiplication is a conclusion of the positive tensor contract.

*Proof.* We use Gouveia et al. (2025): Theorem 3.6 for homogeneous faces and their intrinsic ranks, Theorem 3.11 for the dual structure, and Proposition 3.12 for complementary ranks of conjugate faces. Homogeneous cones and their duals are facially exposed. A cone and its dual have the same rank.

**Conditional images and inherited composites.** For proper cones $C\subset U$ and $D\subset W$, identify $z\in U\otimes W$ with the linear map $T_z:W^*\to U$ defined by
$$
a(T_z(g))=(a\otimes g)(z).
\tag{8.8g.6.3}
$$
The maximum tensor cone is exactly the set of maps with $T_z(D^*)\subseteq C$. Let $f\in C^*$, $u\in\operatorname{int}D^*$ and $F=C\cap\ker f$. If $z\in C\otimes_{\max}D$ and $(f\otimes u)(z)=0$, then $T_z(u)\in F$. Every $g\in D^*$ satisfies $0\le g\le\lambda u$ for some $\lambda>0$, and hence
$$
0\le T_z(g)\le\lambda T_z(u).
\tag{8.8g.6.4}
$$
The face property puts $T_z(g)$ in $F$. Since $D^*$ spans $W^*$, the tensor belongs to $\operatorname{span}(F)\otimes W$. The positive-map characterization, now on this intrinsic carrier, gives
$$
(C\otimes_{\max}D)\cap\ker(f\otimes u)=F\otimes_{\max}D.
\tag{8.8g.6.5}
$$
Here the right side uses the full intrinsic dual $F^*$. Its reverse inclusion follows directly from (8.8g.6.3). In particular, when $F=\mathbb R_+p$, this zero face equals $p\otimes D$.

Apply (8.8g.6.5) to (8.8g.6.1). For an exposed face $F=A\cap\ker f$, the face $H=K\cap\ker(f\otimes u)$ satisfies
$$
F\otimes_{\min}B\subseteq H\subseteq F\otimes_{\max}B.
\tag{8.8g.6.6}
$$
The left inclusion follows from the product states in $K$; the right follows from the conditional-image argument. The minimum tensor cone spans $\operatorname{span}(F)\otimes W$, so $H$ is proper on that exact carrier. It is homogeneous by the cited face theorem. Applying the construction successively to both factors gives a homogeneous self-composite of every exposed local face, with its full intrinsic positive dual retained.

**A fixed pure factor in the dual.** Let $f$ generate an extreme ray of $A^*$, and choose $x\in A$ exposing it:
$$
A^*\cap\ker x=\mathbb R_+f.
$$
Such an $x$ exists by facial exposedness. For $b\in\operatorname{int}B$, dualizing (8.8g.6.1) and applying (8.8g.6.5) gives
$$
K^*\cap\ker(x\otimes b)=f\otimes B^*.
\tag{8.8g.6.7}
$$
The maximum tensor cone has exactly this zero face, and the minimum tensor cone contains all of it. Thus $f\otimes B^*$ is an exposed face of $K^*$ of rank $\operatorname{rank}B$. For $u\in\operatorname{int}B^*$, the tensor $f\otimes u$ is in its relative interior.

**Induction on local rank.** Put $a=\operatorname{rank}A$ and $b=\operatorname{rank}B$. If $a=1$, then $A$ is a ray and the minimum and maximum tensor cones coincide with a copy of $B$, proving (8.8g.6.2). Suppose $a\ge2$ and choose an extreme ray $\mathbb R_+f$ of $A^*$. Complementary ranks give
$$
\operatorname{rank}(A\cap\ker f)=a-1.
$$
For $u\in\operatorname{int}B^*$, the minimal face of $K^*$ containing $f\otimes u$ is the rank-$b$ face (8.8g.6.7). Its conjugate is $H=K\cap\ker(f\otimes u)$. By (8.8g.6.6), $H$ is a homogeneous composite of $A\cap\ker f$ and $B$. The induction hypothesis gives $\operatorname{rank}H=(a-1)b$. Complementary ranks in $K$ and $K^*$ now yield
$$
\operatorname{rank}K=b+(a-1)b=ab.
\tag{8.8g.6.8}
$$
All faces used in the induction belong to the given one-level composite $K$. ∎

<a id="theorem-88g7-universal-lorentz-self-composite-obstruction"></a>**Theorem 8.8g.7 (Universal Lorentz Self-Composite Obstruction).** For $m\ge3$, let $L_m$ be the proper $m$-dimensional Lorentz cone. A proper homogeneous cone $K$ on $\mathbb R^m\otimes\mathbb R^m$ can satisfy
$$
L_m\otimes_{\min}L_m\subseteq K\subseteq L_m\otimes_{\max}L_m
\tag{8.8g.7.1}
$$
only when $m=4$. That case is attained by the ordinary complex-qubit composite. Thus the Lorentz self-composition obstruction holds in every local dimension, with no joint-capacity, pure-transitivity, local reversible-dynamics or repeated-composition premise.

*Proof.* Theorem 8.8g.6 makes the joint rank four. We use the $T$-algebra axioms in Section 2.1 of the cited Gouveia–Ito–Lourenço v3, triangular column transformation (2.15), principal triangular-extension Proposition 2.5, Cholesky Proposition 3.2, face principalization Theorem 3.6, and dual representation (2.8) with Theorem 3.11. For $x\in A_{ij}$ and $y\in A_{jk}$, the trace and triangular axioms give $\|xy\|^2=\|x\|^2\|y\|^2$; trace adjointness identifies the adjoint multiplication maps. Write $n_{ij}=\dim A_{ij}$ in a rank-four presentation.

**A nonnegative quartic difference lemma.** Let $E$ be a finite-dimensional real vector space, let $Z\subset E$ affinely span $E$, and let $F:E\to\mathbb R$ be a nonnegative homogeneous polynomial of degree four. If $F(z-w)=0$ for all $z,w\in Z$, then $F=0$ on $E$.

To prove this, translate $Z$ so that $0\in Z$ and choose a basis $z_1,\ldots,z_N$ from $Z$. Each restriction
$$
q(s,t)=F(sz_i+tz_j),\qquad i\ne j,
$$
is nonnegative and vanishes at $(1,0)$, $(0,1)$ and $(1,-1)$. The pure fourth-power coefficients vanish. Nonnegativity near either axis forces the cubic-linear coefficients to vanish, leaving $q(s,t)=c s^2t^2$; its third zero gives $c=0$. Thus $F$ vanishes on every basis coordinate two-plane. In dimension one, $F(z_1)=0$ already proves the conclusion. In all dimensions, average
$$
F\left(\sum_i\epsilon_i t_i z_i\right)
$$
over independent signs $\epsilon_i\in\{-1,1\}$. Every surviving monomial has even exponent in every index and therefore is supported on at most two indices. Its coefficient is zero by the preceding restriction. The average is zero, and all its summands are nonnegative. The all-plus summand is consequently zero for every $(t_i)$, proving the lemma.

**Pure products have rank-two joins.** We first allow two possibly unequal nonclassical Lorentz factors. Pure products are extreme in both $K$ and $K^*$. Indeed, if $p\otimes q=x+y$ in the maximum tensor cone, conditioning on an interior effect makes each first marginal proportional to $p$. The conditional-image argument of Theorem 8.8g.6 then gives $x=p\otimes q_x$ and $y=p\otimes q_y$. Purity of $q$ makes both summands proportional to $p\otimes q$.

Any two distinct pure products have a rank-two join face. If they share a local ray, their join is the fixed-pure-factor Lorentz face, since two distinct rays in a Lorentz cone generate its whole rank-two face. Otherwise write the products as $p\otimes q$ and $p'\otimes q'$, with both local pairs distinct. Choose pure local effects $f,f'$ annihilating $p,p'$ respectively, and $g,g'$ annihilating $q,q'$ respectively. The distinct product rays $f\otimes g'$ and $f'\otimes g$ annihilate both states. The conjugate of the join therefore has rank at least two. Complementary ranks and joint rank four give join rank at most two, while two distinct rays give rank at least two. The same argument applies to dual product rays.

**Last-column products affinely span their coordinates.** Every pure product $P$ with positive last diagonal can be normalized by $P_{44}=1$. Extremality and Cholesky decomposition make it one last-column square,
$$
P(z)=zz^*,\qquad z=(z_1,z_2,z_3,1),\qquad
(z_1,z_2,z_3)\in E=A_{14}\oplus A_{24}\oplus A_{34}.
\tag{8.8g.7.2}
$$
Let $Z$ be the set of these last-column coordinate vectors. An affine relation $\sum_i\ell_i(z_i)=c$ on $Z$ becomes
$$
\sum_i\ell_i(P_{i4})=cP_{44}
\tag{8.8g.7.3}
$$
on unnormalized products. In Lorentz coordinates, the pure chart $(\|x\|^2,1,x)$ spans the local carrier; the product of two such charts is a full-spanning polynomial family. The nonzero positive functional $P\mapsto P_{44}$ is positive on a nonempty open subset of that parameter space. Equation (8.8g.7.3), being polynomial there, holds on the entire product chart and hence on the whole tensor carrier. Independence of the last-column and last-diagonal coordinate functionals gives $\ell_i=0$ and $c=0$. Thus $Z$ affinely spans $E$.

Every block $A_{i4}$ is nonzero: otherwise (8.8g.7.2) would make $P_{ii}=0$ on the same full-spanning product family. The reversed-dual argument makes every first-row block nonzero. In particular,
$$
a=n_{12}>0,\qquad s=n_{34}>0.
\tag{8.8g.7.4}
$$

**Pair residuals have rank at most one.** Let $H$ be the principal face on indices $1,2,3$, and for $v\in E$ put
$$
B(v)_{ij}=v_i v_j^*,\qquad 1\le i,j\le3.
\tag{8.8g.7.5}
$$
For $z,w\in Z$, the last Cholesky column of $P(z)+P(w)$ is
$$
\left((z_1+w_1)/\sqrt2,(z_2+w_2)/\sqrt2,(z_3+w_3)/\sqrt2,\sqrt2\right).
$$
Subtracting its square leaves $\tfrac12B(z-w)$ with zero last row and column. The Cholesky theorem puts this residual in $H$. Equivalently, the triangular shear with last-column entries $-(z_i+w_i)/2$ sends the sum to
$$
2e_4+\tfrac12B(z-w).
\tag{8.8g.7.6}
$$
Principalize $B(z-w)$ inside $H$ and extend that triangular automorphism block-diagonally by Proposition 2.5. The extension fixes $e_4$. The resulting diagonal support is the principal support of the residual together with index four, so the minimal-face rank of the sum is
$$
1+\operatorname{rank}_H B(z-w).
\tag{8.8g.7.7}
$$
The rank-two join result makes $B(z-w)$ an extreme ray of $H$ or zero. For equal $z,w$ the residual is zero directly.

**Two norm defects vanish identically.** An extreme ray of $H$ is one column square. Its projection onto either pair $\{1,3\}$ or $\{2,3\}$ is a Lorentz boundary ray or zero. For column three this follows from $\|t_{i3}t_{33}\|^2=\|t_{i3}\|^2t_{33}^2$; for columns one and two the third diagonal and corresponding off-blocks vanish. Hence, for $i=1,2$,
$$
F_{i3}(v)=\|v_i\|^2\|v_3\|^2-\|v_i v_3^*\|^2
\tag{8.8g.7.8}
$$
vanishes on every difference $z-w$ from $Z$.

These quartics are nonnegative on all of $E$. For $s_0\in A_{34}$, the map $p\mapsto ps_0^*$ is the trace adjoint of the normed multiplication $u\mapsto us_0$ from $A_{i3}$ to $A_{i4}$. Its operator norm is at most $\|s_0\|$. The quartic difference lemma therefore gives $F_{i3}=0$ on $E$. For fixed nonzero $s_0$, multiplication by $s_0$ and its adjoint are both scaled isometric injections. The two dimension inequalities imply
$$
n_{13}=n_{14},\qquad n_{23}=n_{24}.
\tag{8.8g.7.9}
$$
Apply the same argument to $K^*$ with reversed grading. It gives $n_{24}=n_{14}$ and $n_{13}=n_{23}$. Thus every homogeneous intermediate cone for two nonclassical Lorentz factors has the balanced-middle table
$$
(n_{12},n_{13},n_{14},n_{23},n_{24},n_{34})=(a,t,t,t,t,s).
\tag{8.8g.7.10}
$$
This conclusion includes unequal factors and is compatible with their unequal endpoint and middle dimensions.

**Equal local factors fix the endpoints.** Now write the two factors as $L_{d+2}$, with $d\ge1$. A fixed-pure-factor face is $L_{d+2}$. Its conjugate dual face is another copy of $L_{d+2}$ by the conditional-image lemma. Triangularly principalizing the first face makes it a principal two-index face; its conjugate is the complementary two-index dual face. Both off-block dimensions are $d$. At least one of the three complementary partitions therefore has both blocks of dimension $d$. In (8.8g.7.10), this gives either $a=s=d$ or $t=d$. Norm multiplication on paths $1,2,3$ and $2,3,4$ gives $t\ge a,s$.

For $d=1$, the first possibility would require $9=4+2+4t$, impossible for integer $t$. The second would require $a+s=1$, impossible for positive integers $a,s$. For $d>2$, the possibility $t=d$ gives $a+s=d^2$ by tomography, whereas $a,s\le d$ give $a+s\le2d<d^2$. For $d=2$, that same possibility gives $a+s=4$ with $a,s\le2$, hence $a=s=d$. Every remaining case consequently has
$$
a=s=d,\qquad (d+2)^2=4+2d+4t,\qquad 4t=d(d+2).
\tag{8.8g.7.11}
$$
Odd $d$ are impossible. The following terminal-face argument excludes every $d>2$.

**Terminal effects and their zero-product spans.** The terminal-effect dichotomy is dimension-independent; its argument is as follows. The last diagonal effect restricts to zero or a pure effect on each fixed-factor Lorentz face. Triangular principalization scales that diagonal effect, and its restriction to a principal rank-two face is zero or a pure diagonal effect. The conditional positive map $\Phi$ between equal-dimensional Lorentz spaces therefore takes boundary rays to boundary rays or zero. Its pullback of the Lorentz quadratic form vanishes on the local null cone, so
$$
\Phi^{\mathsf T}J\Phi=\lambda J.
\tag{8.8g.7.12}
$$
For the last implication, write an arbitrary quadratic form on $(1,v)$ with $\|v\|=1$. Comparing $v$ with $-v$ kills the mixed linear term, and a quadratic form constant on the sphere is a scalar multiple of the Euclidean squared norm. This proves proportionality to $J$.

If $\lambda\ne0$, inertia and positivity give $\lambda>0$ and $\Phi$ is an order isomorphism. If $\lambda=0$, its image is totally isotropic and has dimension at most one. It is then a positive multiple of one pure ray; reverse conditioning makes the scalar functional pure as well. The terminal effect is therefore a product of pure local effects.

In the order-isomorphism case, local order changes put the zero products into the form
$$
(1,v)\otimes(1,-v),\qquad v\in S^d\subset\mathbb R^{d+1}.
\tag{8.8g.7.13}
$$
Their linear span has constant, linear and traceless-quadratic dimensions $1$, $d+1$ and $(d+1)(d+2)/2-1$, respectively. These are independent on the sphere: the odd linear part vanishes separately, and the only constant quadratic form there is a multiple of the squared norm. Thus the zero-product span has dimension
$$
D=\frac{(d+1)(d+4)}2.
\tag{8.8g.7.14}
$$
Both terminal kernels in (8.8g.7.10)--(8.8g.7.11) have dimension
$$
h=h^*=3+d+2t,\qquad D-h=\frac{d-2}{2}.
\tag{8.8g.7.15}
$$
For $d>2$ the order-isomorphism zero products would exceed the dimension of their containing kernel. Both terminal effects must consequently be products.

A product terminal effect gives two distinct fixed-zero-factor copies of $L_{d+2}$ inside its rank-three zero face. That kernel has block dimensions $(d,t,t)$. If $t>d$, the pair $12$ is its unique principal pair with off-block dimension $d$. Its face is invariant under every triangular automorphism of the kernel: the first two columns have support confined to indices $1,2$. Every rank-two face is triangularly equivalent to a principal pair face. Hence the kernel would have exactly one face order-isomorphic to $L_{d+2}$, contradicting the two fixed-zero-factor faces. Thus $t=d$, and (8.8g.7.11) gives $d=2$. The remaining value is $m=d+2=4$, attained by complex-qubit composition. ∎

<a id="theorem-88g8-universal-homogeneous-self-composite-classification"></a>**Theorem 8.8g.8 (Universal Homogeneous Self-Composite Classification).** A nonzero finite-dimensional proper homogeneous cone $A\subset V$ admits a proper homogeneous cone $K$ on the complete real tensor carrier $V\otimes V$ satisfying
$$
A\otimes_{\min}A\subseteq K\subseteq A\otimes_{\max}A
\tag{8.8g.8.1}
$$
if and only if, up to real linear order isomorphism,
$$
A\cong\bigoplus_{j=1}^{s}H_{n_j}(\mathbb C)_+,
\qquad s\ge1,\quad n_j\ge1.
\tag{8.8g.8.2}
$$
Here $H_n(\mathbb C)_+$ is the cone of complex Hermitian positive-semidefinite matrices. If $A$ is irreducible, it is one such cone, including the ray at $n=1$. In particular, every local cone in (8.8g.8.1) is intrinsically self-dual.

The tensor sandwich specifies positive product states, products of every positive local dual effect, response factorization and local tomography on the complete real tensor space. The theorem assumes one homogeneous self-composite. Joint-capacity multiplication, local dynamics, pure-state transitivity, joint self-duality, a factorizing self-dualizing inner product and further composition of $K$ are not additional premises.

*Proof.* Every proper homogeneous cone has a Vinberg $T$-algebra presentation; principal subalgebras give exposed homogeneous faces. These are the structural facts specified in Theorem 8.8g.6 and Proposition 2.5 of the cited source. Normed multiplication on an upper path gives
$$
n_{ij},n_{jk}>0\quad\Longrightarrow\quad n_{ik}>0.
\tag{8.8g.8.3}
$$
Theorem 8.8g.6 passes the given full-dual homogeneous self-composite to each exposed local face. Theorem 8.8g.7 excludes every nonclassical Lorentz face except $L_4$, and Theorem 8.8g.5 excludes the complex arrow and its dual under the same one-level composition predicate.

First suppose $A$ is irreducible and choose a $T$-presentation of rank $r$. Rank one gives a ray. For $r\ge2$, every positive block $A_{ij}$ defines a principal rank-two face $L_{n_{ij}+2}$. Face inheritance and Theorem 8.8g.7 imply
$$
n_{ij}\in\{0,2\}\qquad(i<j).
\tag{8.8g.8.4}
$$
Make a graph on the indices with an edge $ij$ exactly when $n_{ij}=2$. The graph is connected, since disconnected components would split the carrier and its triangular-square cone into a direct sum. If it were not complete, a shortest path between nonadjacent vertices would supply three consecutive vertices inducing exactly two edges. In the $T$-order those edges cannot form a directed two-step path, by (8.8g.8.3). They form an outgoing fork or its reversal. Each retained block has real dimension two, and no product of two different nonzero upper off-blocks remains to specify. The principal face is therefore the complex rank-three arrow or its dual, up to real linear order isomorphism. Its inherited homogeneous self-composite contradicts Theorem 8.8g.5. The graph is complete, and every off-block has dimension two.

**Identification of the all-two $T$-algebra.** For $r=2$, the cone is $L_4\cong H_2(\mathbb C)_+$. For $r\ge3$, choose units $u_{i,i+1}$ in successive upper blocks and define $u_{ij}$ by their successive product. Upper-triangular associativity makes its parenthesization irrelevant, and norm multiplication makes it a unit. Choose a perpendicular unit $v_{12}$. Inductively choose the perpendicular unit $v_{i+1,i+2}$ so that
$$
u_{i,i+1}v_{i+1,i+2}=v_{i,i+1}u_{i+1,i+2}.
\tag{8.8g.8.5}
$$
Multiplication by a unit is an isometry between two-dimensional spaces and hence is onto; this proves existence and uniqueness, and the common product is perpendicular to $u_{i,i+2}$. Define $v_{ij}$ by a chain product with one $v$ replacing one $u$. Equation (8.8g.8.5) and associativity make the position of that $v$ irrelevant. For every $i<j<k$,
$$
u_{ij}u_{jk}=u_{ik},\qquad
u_{ij}v_{jk}=v_{ik},\qquad
v_{ij}u_{jk}=v_{ik}.
\tag{8.8g.8.6}
$$
Norm multiplication and polarization make $v_{ij}v_{jk}$ a unit perpendicular to $v_{ik}$, so it equals $u_{ik}$ or $-u_{ik}$. The plus sign would make
$$
\|(u_{ij}+v_{ij})(u_{jk}+v_{jk})\|^2=8,
$$
whereas norm multiplication gives $2\cdot2=4$. Therefore
$$
v_{ij}v_{jk}=-u_{ik}.
\tag{8.8g.8.7}
$$
Identify $u_{ij}$ with $1$ and $v_{ij}$ with $i$ in every upper block. All upper products become ordinary complex multiplication. Involution determines the lower blocks; trace adjointness uniquely determines the mixed products needed for $tt^*$, and diagonal products are the squared norms. The Hermitian carrier and its cone of triangular squares are consequently $H_r(\mathbb C)$ and $H_r(\mathbb C)_+$. This proves necessity for irreducible $A$.

A proper homogeneous cone is a finite direct sum of irreducible proper homogeneous factors; see Chua (2026, Proposition 5.1). Each factor is an exposed face: choose a functional zero on that summand and strictly positive on every nonzero vector in the other summands. It therefore inherits (8.8g.8.1). Applying the irreducible conclusion to every factor gives (8.8g.8.2).

**Sufficiency.** Suppose (8.8g.8.2) holds. The real tensor carrier decomposes as
$$
V\otimes V\cong\bigoplus_{i,j}
\left(H_{n_i}(\mathbb C)\otimes_{\mathbb R}H_{n_j}(\mathbb C)\right)
\cong\bigoplus_{i,j}H_{n_i n_j}(\mathbb C).
\tag{8.8g.8.8}
$$
The last identification is the Kronecker map: tensor products of Hermitian basis elements form a real Hermitian basis of the required dimension. Set
$$
K=\bigoplus_{i,j}H_{n_i n_j}(\mathbb C)_+.
\tag{8.8g.8.9}
$$
Each factor is proper and homogeneous, so the finite direct sum is proper and homogeneous. Positive local products are positive-semidefinite Kronecker products. Every positive local effect is a positive-semidefinite trace functional in each local block; its product is such a functional on every corresponding joint block. Hence $K$ satisfies both inclusions in (8.8g.8.1), with exact response factorization and tomography. ∎

<a id="theorem-88g9-explicit-nonhomogeneous-all-pure-binary-sharp-cone"></a>**Theorem 8.8g.9 (Explicit Nonhomogeneous All-Pure Binary-Sharp Cone).** Equip $V=H_4(\mathbb C)$ with $\langle X,Y\rangle=\operatorname{tr}(XY)$, normalization $I_4$ and the full positive dual as effects. On $\mathbb C^2\otimes\mathbb C^2$ let $s=(|01\rangle-|10\rangle)/\sqrt2$, $S=|s\rangle\langle s|$, and let $F$ interchange the two qubits. Set
$$
q=I_4/2-S=F/2,\qquad Q=\operatorname{PSD}_4,\qquad
K=Q\cap q^+,\qquad A=K+\mathbb R_+q,
\tag{8.8g.9.1}
$$
where $q^+=\{X:\langle q,X\rangle\ge0\}$. Then $A$ is a proper irreducible trace-self-dual, intrinsically nonhomogeneous cone of real dimension $16$ and full-effect capacity $4$. Its trace-one pure states are exactly
$$
T_A=\{P_\psi:\|\psi\|=1,\ \langle\psi,S\psi\rangle\le1/2\}\ \cup\ \{q\},
\qquad P_\psi=|\psi\rangle\langle\psi|.
\tag{8.8g.9.2}
$$
Every member $\rho$ has $\|\rho\|_{\rm HS}=1$ and uniquely verifies itself by the valid binary measurement $(\rho,I_4-\rho)$. The cone retains every two-qubit product projector, the Bell projector $P=(|00\rangle+|11\rangle)(\langle00|+\langle11|)/2$, and its one-factor partial transpose $\Gamma P=q$. In particular, it is an explicit nonstandard all-pure-sharp, trace-self-dual, full-dual locally tomographic composite of two ordinary complex qubits.

*Proof.* The spectrum of $q$ is $(-1/2,1/2,1/2,1/2)$, so $\operatorname{tr}q=\langle q,q\rangle=1$.

**Rank-one generation and a fixed-expectation section.** The trace-one base of $K$ is compact. At a matrix $Y$ of rank $r\ge2$, Hermitian perturbations supported on $\operatorname{ran}Y$ have real dimension $r^2\ge4$. On the boundary $\langle q,Y\rangle=0$, impose $\operatorname{tr}H=\langle q,H\rangle=0$; a nonzero $H$ remains. Small $Y\pm\varepsilon H$ remain positive semidefinite with both equalities. In the strict halfspace only $\operatorname{tr}H=0$ is needed, and small perturbations preserve the strict inequality. Thus every extreme point is rank one. A rank-one projector is extreme in every convex subset of the quantum state space that contains it. Hence $K$ is generated by the rank-one projectors in (8.8g.9.2). The same two-constraint perturbation argument proves that, for every fixed $c$ in the spectral interval of $q$, every positive-semidefinite trace-one $Y$ with $\langle q,Y\rangle=c$ is a convex combination of rank-one projectors with that same expectation.

**Positive projection on the cut side.** We claim
$$
Y\ge0,\quad a=\langle q,Y\rangle<0
\quad\Longrightarrow\quad Y-aq\ge0.
\tag{8.8g.9.3}
$$
Normalize $\operatorname{tr}Y=1$ and use the fixed-expectation decomposition. For a rank-one $Y=P_\psi$ put $p=\langle\psi,S\psi\rangle>1/2$ and $\alpha=p-1/2=-a$. In the span of its symmetric and singlet components the matrix $P_\psi+\alpha q$ is
$$
\begin{pmatrix}
1-p+\alpha/2&\sqrt{p(1-p)}\\
\sqrt{p(1-p)}&p-\alpha/2
\end{pmatrix}.
\tag{8.8g.9.4}
$$
Its diagonal entries are positive, its trace is $1$, and its determinant is $\alpha(2p-1)/2-\alpha^2/4=3\alpha^2/4\ge0$. On the two unused symmetric directions it is $\alpha/2$ times the identity. It is therefore positive semidefinite. Taking the convex combination with the common expectation $a$ proves (8.8g.9.3).

**Exact self-duality and properness.** The sum $Q+\mathbb R_+q$ is closed. If $Y_n+t_nq$ converged with $Y_n\ge0$ and $t_n\ge0$ unbounded, division by a diverging subsequence of $t_n$ would give $Y_n/t_n\to-q$, impossible because $-q\notin Q$. A bounded sequence $t_n$ supplies a limit representation. Finite-dimensional duality gives
$$
K^*=Q+\mathbb R_+q,\qquad
A^*=(Q+\mathbb R_+q)\cap q^+.
\tag{8.8g.9.5}
$$
The generators of $A$ pair nonnegatively: two elements of $K$ are positive semidefinite, they pair nonnegatively with $q$, and $\langle q,q\rangle=1$. Thus $A\subseteq A^*$. If $X=Y+tq\in A^*$ with $Y\ge0,t\ge0$, write $a=\langle q,Y\rangle$. For $a\ge0$ this is a representation in $A$. For $a<0$, (8.8g.9.3) gives $Y'=Y-aq\ge0$ with $\langle q,Y'\rangle=0$, and
$$
X=Y'+(t+a)q\in A,\qquad t+a=\langle q,X\rangle\ge0.
$$
Hence $A=A^*$. More explicitly, its trace-one base is the compact convex hull $\Omega_A=\operatorname{conv}T_A$. Trace is strictly positive on every nonzero element, and the cone over that base is closed. Acuteness makes it pointed. All product projectors belong to it, since for unit vectors $a,b\in\mathbb C^2$,
$$
\langle q,P_a\otimes P_b\rangle=|\langle a,b\rangle|^2/2\ge0.
\tag{8.8g.9.6}
$$
These projectors span $H_4(\mathbb C)$, proving full dimension and properness. The compact base also puts $I_4$ in the interior of the positive dual, and thus in $\operatorname{int}A$.

**Every pure state verifies itself.** All members of $T_A$ have trace and Hilbert--Schmidt norm one; all of $\Omega_A$ has norm at most one. For $\rho\in T_A$ and $\sigma\in\Omega_A$, acuteness and Cauchy--Schwarz give $0\le\langle\rho,\sigma\rangle\le1$, with equality at $1$ only when $\sigma=\rho$. Thus every element of $T_A$ is exposed. Conversely the convex hull of a compact set has no extreme points outside that set, so (8.8g.9.2) is the full pure-state set. The response bound implies $I_4-\rho\in A^*=A$, proving the binary verification assertion.

**Irreducibility, seed and capacity.** The product-projector family is connected, being parametrized by $\mathbb{CP}^1\times\mathbb{CP}^1$, and consists of extreme points spanning $V$. In a nontrivial direct-sum decomposition of a proper cone, every extreme ray belongs to a summand. Choose strictly positive normalizations on both summands. The ratio of one summand's normalization to their sum is continuous on rays and takes only the values $0,1$ on extreme rays. A connected spanning extreme family must therefore lie in a single summand, contradicting nontriviality. Hence $A$ is irreducible. The Bell projector has $\langle q,P\rangle=1/2$, and direct partial transposition gives $\Gamma P=F/2=q$.

The four computational product projectors are orthogonal unit vectors summing to $I_4$, hence are a distinguishing measurement for four states. For any nonzero positive effect $E\in A=A^*$, write $E=\operatorname{tr}(E)\sigma$ with $\sigma\in\Omega_A$. Then $\langle E,\rho\rangle\le\operatorname{tr}E$ for every normalized state $\rho$. A measurement distinguishing $k$ states has each corresponding response equal to $1$, so
$$
k\le\sum_i\operatorname{tr}E_i=\operatorname{tr}I_4=4.
\tag{8.8g.9.7}
$$
The capacity is exactly $4$.

**Intrinsic nonhomogeneity and the qubit composite.** The pure-ray space is disconnected: $q$ is indefinite and is isolated from the nonempty compact positive-semidefinite cap. If $A$ were homogeneous, the Koecher--Vinberg reconstruction already used in Theorem G.1.8 would make it an irreducible symmetric cone. Projective extreme rays of a simple Euclidean Jordan cone form a connected space. One primary formulation of this connectedness is Gowda and Jeong (2018, Theorem 3.1(b) and the following primitive-idempotent application on p. 6). It contradicts the disconnected pure-ray space here. Thus $A$ is intrinsically nonhomogeneous.

Let $\mathrm{SEP}=H_2(\mathbb C)_+\otimes_{\min}H_2(\mathbb C)_+$. Equation (8.8g.9.6) gives $\mathrm{SEP}\subseteq A$; self-duality then gives $A\subseteq\mathrm{SEP}^*$. On the complete real tensor carrier, trace pairing and product unit factorize. This is the positive full-dual tomographic two-qubit contract. The indefinite $q$ makes the cone nonstandard, and its intrinsic nonhomogeneity also excludes a mere order-isomorphic copy of the standard cone. Therefore replacing joint homogeneity in Theorem 8.8g.4 by same-vector binary verification of every pure state does not preserve that theorem's conclusion. ∎

The construction has the exact semidefinite membership test
$$
X\in A\quad\Longleftrightarrow\quad
\text{there exists }0\le t\le\langle q,X\rangle\text{ with }X-tq\ge0.
\tag{8.8g.9.8}
$$
Theorem 8.8g.14 below excludes its all-pure-unit trace-self-dual self-composite on the full product carrier. Binary verification also does not imply that every pure state extends to a complete capacity-four pure context. Any pure state orthogonal to $q$ is a quantum projector with singlet weight $1/2$. At most two such projectors can be mutually orthogonal, because their singlet weights sum to at most $1$. A four-element same-vector sharp context containing $q$ would require three of them. Thus $q$ has the proved binary verifier but cannot belong to such a complete context.

<a id="proposition-88g10-finite-seed-spherical-completion-criterion"></a>**Proposition 8.8g.10 (Finite-Seed Spherical Completion Criterion).** Let $V$ be a real Euclidean space of dimension $n\ge2$, fix $u\in V$ with $m=\|u\|^2\ge2$, and put
$$
H_u=\{x:\langle u,x\rangle=1\},\qquad
\Sigma=\{x\in H_u:\|x\|=1\}.
\tag{8.8g.10.1}
$$
A spherical self-dual completion of $S\subseteq\Sigma$ means a proper cone $L=L^*$ containing $S$, with $u\in\operatorname{int}L^*$ and compact normalized base $\Omega=L\cap H_u$ satisfying
$$
\Omega=\operatorname{conv}(\Omega\cap\Sigma).
\tag{8.8g.10.2}
$$
Equivalently, every normalized extreme point has norm one. The family $\mathcal F$ of all such bases for the fixed $V,u$, before imposing $S$, is Hausdorff compact, possibly empty. The set $S$ has a spherical self-dual completion if and only if every finite subset of $S$ has one on that same carrier and normalization. A fixed finite orthonormal context summing to $u$ may be required in every finite seed. If $\mathcal F\ne\varnothing$ and $S$ has no completion, then a finite subset $\{s_1,\ldots,s_k\}$ and $\delta>0$ satisfy
$$
\max_i\operatorname{dist}(s_i,\Omega)\ge\delta
\quad\text{for every }\Omega\in\mathcal F.
\tag{8.8g.10.3}
$$

*Proof.* Strict positivity of $u$ on every nonzero candidate cone element makes $\Omega$ a genuine compact base, so normalization and positive rescaling recover the cone. Equation (8.8g.10.2) puts the base in the unit ball. Conversely, a compact base all of whose extreme points have norm one satisfies (8.8g.10.2) by extreme-point generation. If (8.8g.10.2) holds, its compact sphere-generating set contains all extreme points, and each sphere point exposes itself in the unit ball; hence the equivalence.

Put $c=u/m$ and $D=\{x:\langle u,x\rangle\ge\|x\|\}$. On $H_u$, the base of $D$ is the ball centered at $c$ of radius $R=\sqrt{(m-1)/m}$. Writing $x=\alpha u/\sqrt m+z$, $z\perp u$, shows $D=\{\alpha\ge\|z\|/\sqrt{m-1}\}$; its Euclidean dual has base radius $r=1/\sqrt{m(m-1)}$. Every candidate satisfies $L\subseteq D$; self-duality gives $D^*\subseteq L$. Consequently
$$
B_{H_u}(c,r)\subseteq\Omega\subseteq B_{H_u}(c,R).
\tag{8.8g.10.4}
$$
The family of closed convex bodies between these fixed balls is Hausdorff compact. For completeness, their support functions on the unit sphere of $u^\perp$ are uniformly bounded and uniformly Lipschitz. A finite-net diagonal argument gives a uniformly convergent subsequence; the limit support function defines a convex body between the same balls. Uniform support-function convergence is equivalent to Hausdorff convergence.

It remains to show that self-duality and spherical generation are closed properties within this family. Write $\Omega=c+B$ with $B\subseteq u^\perp$. For $x=c+b$ and $y=c+z$, their inner product is $1/m+\langle b,z\rangle$. Therefore self-duality is equivalent to
$$
B=-\frac1m B^\circ,
\qquad B^\circ=\{z:\langle z,b\rangle\le1\text{ for all }b\in B\}.
\tag{8.8g.10.5}
$$
Polarity is Hausdorff continuous for bodies containing a fixed positive-radius ball and contained in a fixed bounded ball. In detail, uniform convergence of support functions, all bounded below by $r>0$, gives uniform convergence of the polar radial functions $\rho_{B^\circ}(v)=1/h_B(v)$. Their common finite bound turns radial convergence into Hausdorff convergence. Equation (8.8g.10.5) is therefore closed.

If $\Omega_j\to\Omega$ and each satisfies (8.8g.10.2), choose $x_j\in\Omega_j$ with $x_j\to x\in\Omega$. Carathéodory expresses each $x_j$ using at most $n+1$ sphere points and coefficients in a compact simplex. The sphere is compact, so a subsequence makes all points and coefficients converge. The limiting points belong to $\Omega\cap\Sigma$, yielding $x\in\operatorname{conv}(\Omega\cap\Sigma)$. The reverse inclusion is automatic. Thus spherical generation is closed as well. The cone over every limiting body in (8.8g.10.4) is proper, has $u$ strictly positive on nonzero elements, and has that body as its compact base. This proves compactness of $\mathcal F$.

For each $s\in S$, the subset $\mathcal F_s=\{\Omega\in\mathcal F:s\in\Omega\}$ is closed under Hausdorff convergence. Completion of every finite subset says these closed sets have the finite intersection property. Compactness gives a common member, a completion of the full seed. The converse follows by retaining the same completion. The finite-subset statement includes the empty subset; it therefore also covers $\mathcal F=\varnothing$. Adding a prescribed finite context to every finite seed leaves both implications intact.

If $\mathcal F\ne\varnothing$ and there is no completion, the finite intersection property fails for a finite subset. On compact $\mathcal F$, the function $\Omega\mapsto\max_i\operatorname{dist}(s_i,\Omega)$ is continuous and positive everywhere, so it attains a positive minimum $\delta$. This proves (8.8g.10.3). Perturbing each $s_i$ by less than $\delta/2$ preserves noncompletability, provided the perturbed points satisfy the stipulated legal-input conditions. ∎

<a id="lemma-88g11-zero-allowing-hermitian-rank-one-preservers"></a>**Lemma 8.8g.11 (Zero-Allowing Hermitian Rank-One Preservers).** Let $L:H_m(\mathbb C)\to H_n(\mathbb C)$ be real-linear. Suppose $\operatorname{rank}L(zz^*)\le1$ for $z$ in a nonempty open subset of $\mathbb C^m$. Then either $L=0$, or $L$ has one of the forms
$$
L(X)=f(X)P,\qquad
L(X)=cVXV^*,\qquad
L(X)=cVX^{\mathsf T}V^*,
\tag{8.8g.11.1}
$$
where $f$ is a real-linear functional, $P$ is a fixed rank-one positive-semidefinite projector, $c$ is nonzero and real, and $V$ may be singular. The second and third forms outside the first case have $\operatorname{rank}V\ge2$. If $L(zz^*)$ is positive semidefinite on a nonempty open set of vectors $z$ in either such nondegenerate form, then $c>0$. Zero images on rank-one inputs are allowed throughout.

*Proof.* Every two-by-two minor of $L(zz^*)$ is a complex-valued polynomial in the real and imaginary coordinates of $z$. Its real and imaginary parts vanish on an open set, hence identically. Extend $L$ uniquely to the complex-linear map $T:M_m(\mathbb C)\to M_n(\mathbb C)$ by $T(X+iY)=L(X)+iL(Y)$ for Hermitian $X,Y$. Each minor of $T(zw^{\mathsf T})$ is a polynomial $F(z,w)$ that vanishes when $w=\overline z$. Substitute $z=x+iy$, $w=x-iy$. The resulting polynomial vanishes for every real $(x,y)$, hence is the zero polynomial. This is an invertible complex-linear change of variables, so
$$
\operatorname{rank}T(zw^{\mathsf T})\le1
\quad\text{for every }z,w\in\mathbb C^m.
\tag{8.8g.11.2}
$$

**Polynomial factorization.** If $T\ne0$, consider the nonzero polynomial matrix $B(z,w)=T(zw^{\mathsf T})$ over the unique-factorization domain
$$
\mathcal R=\mathbb C[z_1,\ldots,z_m,w_1,\ldots,w_m].
$$
Every entry is bihomogeneous of bidegree $(1,1)$, and all two-by-two minors vanish. Choose a nonzero column $c$, divide its entries by their greatest common divisor $g$, and write $c=ga$ with no common nonunit factor among the entries of $a$. Over the fraction field, $B$ has rank one, so each column is $\lambda_j a$. Every $\lambda_j$ belongs to $\mathcal R$: for each irreducible prime $\pi$, some entry of $a$ has $\pi$-valuation zero; the polynomial entries of $\lambda_j a$ then force $v_\pi(\lambda_j)\ge0$. A rational function without a denominator prime is a polynomial. Consequently $B=ab^{\mathsf T}$ for polynomial columns $a,b$.

If a nonzero polynomial product is homogeneous in the $z$ variables, each factor is homogeneous in them: compare the least and greatest $z$ degrees in the integral-domain grading. The same argument applies to $w$. Fixing a nonzero entry of $b$ shows that all nonzero entries of $a$ have one common bidegree $\alpha$; fixing a nonzero entry of $a$ gives a common bidegree $\beta$ for $b$. Since $\alpha+\beta=(1,1)$ with nonnegative integer coordinates, the exhaustive possibilities are:

1. $\alpha=(0,0)$, $\beta=(1,1)$: every output has column space in a fixed line
2. $\alpha=(1,1)$, $\beta=(0,0)$: every output has row space in a fixed line
3. $\alpha=(1,0)$, $\beta=(0,1)$: $a=Az$, $b=Cw$, and $T(X)=AXC^{\mathsf T}$
4. $\alpha=(0,1)$, $\beta=(1,0)$: $a=Aw$, $b=Cz$, and $T(X)=AX^{\mathsf T}C^{\mathsf T}$

The matrix formulas hold for all $X$ because elementary rank-one matrices span $M_m(\mathbb C)$. No factor is inverted. Zeros of $a$, $b$ or $T$ on rank-one inputs are included. The fixed-line alternatives allow arbitrary linear functionals and remain part of the classification.

**Hermiticity.** Complexification gives $T(X^*)=T(X)^*$. In the fixed-column-line case, every Hermitian output is a real multiple of $aa^*$ for a fixed nonzero vector $a$, giving $L(X)=f(X)P$ after trace normalization of $aa^*$. Taking adjoints gives the same conclusion for the fixed-row-line case.

Consider $T(X)=AXB$ outside those cases. Both $A$ and $B$ have rank at least two. For every $z$, the matrix $(Az)(B^*z)^*$ is Hermitian. Whenever both vectors are nonzero, they are collinear. If $Az=0$, choose $x,y$ with $Ax,Ay$ independent. At $z+tx$, the first vector is $tAx$. If $B^*(z+tx)$ vanishes identically in $t$, then $B^*z=0$ already. Otherwise use generic nonzero $t$ for collinearity and let $t\to0$, obtaining $B^*z\in\mathbb CAx$. Repeating with $y$ gives $B^*z\in\mathbb CAy$, hence $B^*z=0$. Thus $\ker A\subseteq\ker B^*$.

There is therefore a linear map $D$ on $\operatorname{ran}A$ defined by $D(Az)=B^*z$. Every $Dv$ is collinear with $v$, including zero. On a space of dimension at least two, comparison of two independent vectors and their sum forces $D=cI$. Hence $B^*=cA$. Hermiticity of $\overline c\,Azz^*A^*$ for a nonzero $Az$ makes $c$ real. Renaming the real scalar gives $L(X)=cAXA^*$. For $T(X)=AX^{\mathsf T}B$, compose on the input with ordinary transpose and repeat the same argument to obtain $L(X)=cAX^{\mathsf T}A^*$.

Finally a nonzero linear $A$ has no open subset in its kernel. In either nondegenerate form a nonempty open set of positive-semidefinite outputs therefore includes a nonzero output. A negative multiple of a nonzero positive-semidefinite matrix is not positive semidefinite, so $c>0$. This proves every alternative, including all zero-image and singular-factor cases. ∎

This is the complex Hermitian zero-allowing classification in Lim (2012), Remark 2.5(b), printed page 361. The polynomial proof above supplies every singular-factor and fixed-line case used here.

<a id="lemma-88g12-exact-rational-ppt-null-certificate"></a>**Lemma 8.8g.12 (Exact Rational PPT Null Certificate).** In the real eigenbasis $q=\operatorname{diag}(-1/2,1/2,1/2,1/2)$ of Theorem 8.8g.9, the rational matrix $W$ below is positive definite, has positive-definite first partial transpose, and has both contractions with $Q=\operatorname{diag}(-1,1,1)$ zero. Its displayed block-positive witness $H_0$ has strictly negative pairing. The embedded $X$ on the full $4$-by-$4$ Hilbert carrier is consequently PPT-entangled with both $q$ contractions zero.

*Proof.* Use a real orthonormal eigenbasis $(s,t_1,t_2,t_3)$ of $q$. Let $J:\mathbb C^3\to\mathbb C^4$ send the standard basis to $(s,t_1,t_2)$, and set $Q=\operatorname{diag}(-1,1,1)$, so $J^*qJ=Q/2$. Order the tensor indices lexicographically as $(0,0),(0,1),(0,2),(1,0),\ldots,(2,2)$. Define
$$
W=\frac{N}{9000000},\qquad X=(J\otimes J)W(J\otimes J)^*,
\tag{8.8g.12.1}
$$
where the complete integer matrix is
$$
N=\begin{pmatrix}
2272501&301482&-71991&-87351&790353&708714&-580989&181386&542196\\
301482&903809&288657&-380025&78963&-263223&-458469&-250890&273069\\
-71991&288657&1368692&599031&161865&-166314&-829458&-180018&-330099\\
-87351&-380025&599031&1273715&-71100&45675&-7983&79650&-385740\\
790353&78963&161865&-71100&416761&316665&-250758&199332&88857\\
708714&-263223&-166314&45675&316665&856954&43407&134280&-207315\\
-580989&-458469&-829458&-7983&-250758&43407&998786&372582&-117666\\
181386&-250890&-180018&79650&199332&134280&372582&487048&-28008\\
542196&273069&-330099&-385740&88857&-207315&-117666&-28008&511738
\end{pmatrix}.
\tag{8.8g.12.2}
$$
Its trace is $\operatorname{tr}W=2272501/2250000>0$. Trace normalization of $X$ preserves all the conditions below.

**Positivity and the exact joint kernel.** Let $\Gamma_3$ transpose the first $3$-dimensional factor. The following are all the leading principal determinants of the two integer matrices. In the table, $N[1:k,1:k]$ denotes the leading $k\times k$ submatrix.

| $k$ | $\det N[1:k,1:k]$ | $\det(\Gamma_3N)[1:k,1:k]$ |
|---|---|---|
| 1 | 2272501 | 2272501 |
| 2 | 1963015459985 | 1963015459985 |
| 3 | 2480198072734787074 | 2480198072734787074 |
| 4 | 1733561442950837635688537 | 942785088717335783635586 |
| 5 | 125369733808032832403773204370 | 214941129031437240355836409733 |
| 6 | 56545809232927450607991076543986983 | 10435791713449538321214104707504961 |
| 7 | 3670744669844557992385187349324719777314 | 981159545952001435329192903599380799638 |
| 8 | 76171684226724542378879969069094805633536940 | 10817148655886518069568513316670024889783266 |
| 9 | 974390651692498667103054327415975376143470310984 | 184805247645942881138084489768536086828160417900 |

Every displayed determinant is positive. Sylvester's criterion gives $W>0$ and $\Gamma_3W>0$ on their $9$-dimensional carrier. The real isometry $J$ commutes with the stated partial transposes, so $X\ge0$ and $\Gamma X\ge0$ on the full $16$-dimensional carrier, with zero outside the embedded subspace.

For completeness, these integer determinants can be reproduced by fraction-free elimination. Start from the relevant leading integer submatrix with previous pivot $p=1$. At pivot $k$, replace each trailing entry $b_{ij}$ by $(b_{kk}b_{ij}-b_{ik}b_{kj})/p$, then set the previous pivot to the old $b_{kk}$. The listed smaller determinants are nonzero, so no row exchange is required; all divisions are exact, and the last pivot gives the displayed determinant.

In $3\times3$ block notation the displayed entries also give the exact identities
$$
-N_{00}+N_{11}+N_{22}=0,\qquad
\sum_{a=0}^2Q_{aa}N_{(i,a),(j,a)}=0\quad(0\le i,j\le2).
\tag{8.8g.12.3}
$$
Equivalently,
$$
\operatorname{Tr}_1[(Q\otimes I_3)W]=0,\qquad
\operatorname{Tr}_2[(I_3\otimes Q)W]=0.
\tag{8.8g.12.4}
$$
Embedding with $J^*qJ=Q/2$ gives $\Phi_1(X)=\Phi_2(X)=0$. Consequently $X$ pairs as zero with every element of $(q\otimes A)+(A\otimes q)$, and its matrix and partial transpose are positive semidefinite.

**The complete rational separation witness.** Define
$$
A_0=\begin{pmatrix}-770&-593&236\\639&-713&291\\-4&375&927\end{pmatrix},\qquad
B_0=\begin{pmatrix}-800&-163&-578\\-12&-958&287\\-600&236&764\end{pmatrix},
\qquad U=\frac{A_0}{1000},\quad V=\frac{B_0}{1000}.
\tag{8.8g.12.5}
$$
On complex $3\times3$ matrices use the complex-linear Choi map (Ha 2013, Section 1); its positivity is proved below:
$$
\Psi(Z)=\begin{pmatrix}
z_{00}+z_{22}&-z_{01}&-z_{02}\\
-z_{10}&z_{11}+z_{00}&-z_{12}\\
-z_{20}&-z_{21}&z_{22}+z_{11}
\end{pmatrix},\qquad
C_\Psi=\sum_{i,j=0}^2E_{ij}\otimes\Psi(E_{ij}),
\tag{8.8g.12.6}
$$
and set
$$
H_0=(U\otimes V)C_\Psi(U\otimes V)^*,\qquad
H=(J\otimes J)H_0(J\otimes J)^*.
\tag{8.8g.12.7}
$$
The displayed map, matrix units and filters specify every entry of $H_0$ and $H$ exactly. Their block positivity follows from complex positivity of $\Psi$, as follows.

For $z\in\mathbb C^3$, write $a=|z_0|^2$, $b=|z_1|^2$, $c=|z_2|^2$. Direct substitution gives
$$
\Psi(zz^*)=\operatorname{diag}(2a+c,2b+a,2c+b)-zz^*.
\tag{8.8g.12.8}
$$
When $a,b,c>0$, conjugation by the inverse square root of the positive diagonal matrix shows that this is positive semidefinite exactly when
$$
\frac{a}{2a+c}+\frac{b}{2b+a}+\frac{c}{2c+b}\le1.
\tag{8.8g.12.9}
$$
After multiplication by the three positive denominators, the difference between the right and left sides has numerator
$$
a^2b+b^2c+c^2a-3abc\ge0,
\tag{8.8g.12.10}
$$
by the arithmetic-geometric mean inequality. Boundary cases follow by continuity. Spectral decomposition therefore makes $\Psi$ positive on every complex positive-semidefinite matrix.

For arbitrary complex $x,y$ the matrix-unit definition gives
$$
\langle x\otimes y,C_\Psi(x\otimes y)\rangle
=\langle y,\Psi(\overline x\,\overline x^*)y\rangle\ge0.
\tag{8.8g.12.11}
$$
Local congruence by $U,V$ preserves this inequality by replacing $x,y$ with $U^*x,V^*y$; their unitarity is unnecessary. The isometric extension by $J\otimes J$ preserves it for all product vectors on the full $4$-by-$4$ carrier. Hence $H$ pairs nonnegatively with every ordinary quantum-separable positive-semidefinite matrix there. Direct rational multiplication of (8.8g.12.1)–(8.8g.12.7) yields
$$
\operatorname{tr}(HX)=\operatorname{tr}(H_0W)
=-\frac{91322891516741947}{4500000000000000000}<0.
\tag{8.8g.12.12}
$$
Thus $X$ is quantum-entangled.

The same negative pairing proves entanglement of $W$ and of its isometric embedding $X$. ∎

<a id="lemma-88g13-single-ray-repair-geometry-and-cap-design"></a>**Lemma 8.8g.13 (Single-Ray Repair Geometry and Cap Design).** Let $R\in H_d(\mathbb C)$ be indefinite with $\operatorname{tr}R=\|R\|_{\mathrm{HS}}=1$, and suppose the cone
$$
K_R=\operatorname{PSD}_d\cap\{X:\operatorname{tr}(RX)\ge0\},\qquad
B_R=K_R+\mathbb R_+R
\tag{8.8g.13.1}
$$
is trace-self-dual. Then $d\in\{3,4\}$, $R$ has exactly one negative eigenvalue $-c$ and all positive eigenvalues $a_i$ satisfy $a_i\ge c>0$. In dimension $4$ its spectrum is $(-1/2,1/2,1/2,1/2)$; in dimension $3$ each positive eigenvalue is strictly greater than $c$. The normalized unit and extreme sets of $B_R$ are both
$$
T_R=\{P_z=zz^*:\|z\|=1,\ z^*Rz\ge0\}\cup\{R\}.
\tag{8.8g.13.2}
$$
In an eigenbasis of $R$, the quantum cap contains a rotational subcap supporting a continuous complex projective two-design with full support on that subcap:
$$
\mathbb E(P\otimes P)=\frac{I+F_d}{d(d+1)}.
\tag{8.8g.13.3}
$$

*Proof.* Finite-dimensional cone duality gives
$$
B_R^*=(\operatorname{PSD}_d+\mathbb R_+R)\cap\{X:\operatorname{tr}(RX)\ge0\}.
\tag{8.8g.13.4}
$$
The sum is closed. If nonnegative coefficients of $R$ in a convergent sequence were unbounded, division by those coefficients would force $-R$ to be positive semidefinite, contradicting indefiniteness. Bounded coefficients instead have a convergent subsequence and a positive-semidefinite remainder. Self-duality is equivalent to the projection property
$$
Y\ge0,\quad\operatorname{tr}(RY)<0
\quad\Longrightarrow\quad Y-\operatorname{tr}(RY)R\ge0.
\tag{8.8g.13.5}
$$
For necessity, the right-hand matrix belongs to $B_R^*$ by (8.8g.13.4) and is orthogonal to $R$. Its representation $Z+tR$ in $B_R$, with $Z\in K_R$ and $t\ge0$, then forces $t=0$, since $\operatorname{tr}(RZ)+t\operatorname{tr}(R^2)=0$. Thus it is positive semidefinite. For sufficiency, $B_R$ is acute: two elements of $K_R$ pair nonnegatively, their pairings with $R$ are nonnegative, and $\operatorname{tr}(R^2)=1$. Hence $B_R\subseteq B_R^*$. For $Y+tR\in B_R^*$, with $Y\ge0,t\ge0$, nonnegative $\operatorname{tr}(RY)$ already puts it in $B_R$. If $\operatorname{tr}(RY)<0$, (8.8g.13.5) rewrites it as the member $Y-\operatorname{tr}(RY)R$ of $K_R$ plus the nonnegative multiple $(t+\operatorname{tr}(RY))R$, proving the other inclusion.

**Spectral reduction.** Two negative eigenvalues violate (8.8g.13.5): choose $Y$ as the projector onto one negative eigenvector and evaluate the projected matrix on the other. Thus there is exactly one negative eigenvalue $-c$, with $c>0$. If another eigenvalue is $a\ge0$, take a rank-one projector in that eigenplane with weights $p,1-p$ and $\alpha=cp-a(1-p)>0$. The determinant of its projected two-by-two compression is
$$
\alpha[ap-c(1-p)]-\alpha^2ac.
\tag{8.8g.13.6}
$$
For $0<a<c$, the bracket tends to $a-c<0$ as $p$ decreases to $a/(a+c)$ from above; hence this determinant is negative for sufficiently small positive $\alpha$. For $a=0$ it is negative whenever $0<p<1$. These cases are impossible. Every remaining eigenvalue is therefore at least $c$, and no zero eigenvalue occurs.

Write those eigenvalues as $a_1,\ldots,a_k$, where $k=d-1$. The trace and squared norm give
$$
\sum_i a_i-c=1,\qquad \sum_i a_i^2+c^2=1,\qquad
\sum_{i<j}a_ia_j=c\sum_i a_i.
\tag{8.8g.13.7}
$$
The last equality follows by squaring the first and subtracting the second. Since $a_i\ge c$,
$$
\sum_{i<j}a_ia_j
=\frac12\sum_i a_i\sum_{j\ne i}a_j
\ge\frac{(k-1)c}{2}\sum_i a_i.
\tag{8.8g.13.8}
$$
Thus $k\le3$. Indefiniteness excludes $d=1$, and $k=1$ contradicts the last equality in (8.8g.13.7), so $d=3$ or $4$. If $d=4$, equality in (8.8g.13.8) forces all $a_i=c$; trace then gives $c=1/2$. If $d=3$, the equality $a_1=c$ would force $a_2=1$ by trace and then squared norm $1+2c^2>1$, a contradiction. The same holds with the indices interchanged.

**Local unit set.** The trace-one section of $K_R$ is compact. A point of rank $r\ge2$ has a real space of Hermitian support perturbations of dimension $r^2\ge4$. Preserving trace and, when active, $R$ expectation imposes at most two real linear constraints. A nonzero perturbation remains, and both its signs preserve positive semidefiniteness and the halfspace for sufficiently small magnitude. Hence such a point is not extreme. Rank-one cap projectors are extreme because they are already extreme among quantum states. The base of $K_R$ is therefore generated by these projectors. Since $\operatorname{tr}R=1$, the trace-one base of $B_R$ is exactly the compact convex hull of (8.8g.13.2).

Every member of $T_R$ has norm one. Strict convexity of the Hilbert–Schmidt norm makes the norm-one points of that base exactly $T_R$: equality in the norm bound for a convex combination requires all its positive-weight unit vectors to coincide. Those unit points are also extreme, and any extreme point of the convex hull of a compact set belongs to that set. This proves both assertions about $T_R$ and gives $\|x\|\le\operatorname{tr}x$ on $B_R$. The compact trace-one base gives a closed pointed cone; $K_R$ contains a neighborhood of $I_d$ within the positive-definite cone because $\operatorname{tr}R=1$, so the cone is full-dimensional. The indefinite $R$ is isolated from the compact positive-semidefinite part of $T_R$.

**The cap measure.** In the chosen eigenbasis, $R=\operatorname{diag}(-c,a_1,\ldots,a_{d-1})$ is real. Put $b=\min_i a_i$ and $h=b/(b+c)$. The spectral conclusions imply
$$
h>\frac{2}{d+1};\qquad
h>\frac12\text{ if }d=3,\quad h=\frac12>\frac25\text{ if }d=4.
\tag{8.8g.13.9}
$$
For a unit vector whose negative-eigendirection weight is $p\le h$, one has $z^*Rz\ge-cp+b(1-p)\ge0$. Thus the cap contains the whole rotational subcap $p\le h$.

Set $m=1/d$ and $v=2/[d(d+1)]$. Choose sufficiently small $\varepsilon>0$ so that
$$
\begin{gathered}
m'=m-\varepsilon h/2>0,\qquad v'=v-\varepsilon h^2/3>0,\\
t=v'/m'\in(0,h),\qquad w=(m')^2/v'>0,\qquad 1-\varepsilon-w>0.
\end{gathered}
\tag{8.8g.13.10}
$$
Such a choice exists by continuity: at $\varepsilon=0$, $t=v/m=2/(d+1)<h$ and $w=m^2/v=(d+1)/(2d)<1$. Give $p$ the distribution
$$
\mu=\varepsilon\operatorname{Uniform}[0,h]+w\delta_t+(1-\varepsilon-w)\delta_0.
\tag{8.8g.13.11}
$$
Its mean is $m$, its second moment is $v$, and its support is all of $[0,h]$. Independently choose a uniform unit vector $u$ in the $(d-1)$-dimensional positive eigenspace and a uniform phase $\theta\in[0,2\pi)$. Put
$$
z=\sqrt p\,e^{i\theta}e_0+\sqrt{1-p}\,u,\qquad P=zz^*.
\tag{8.8g.13.12}
$$
This gives full support on the rotational subcap. The uniform-sphere identities are
$$
\mathbb E[u_i\overline{u_j}]=\frac{\delta_{ij}}{d-1},\qquad
\mathbb E[u_i\overline{u_j}u_k\overline{u_l}]
=\frac{\delta_{ij}\delta_{kl}+\delta_{il}\delta_{kj}}{(d-1)d}.
\tag{8.8g.13.13}
$$
To derive the fourth moment directly, independent coordinate phases kill unbalanced monomials. Permutation invariance gives constants $A=\mathbb E|u_i|^4$ and $B=\mathbb E|u_i|^2|u_j|^2$ for $i\ne j$. A $45$-degree rotation in two coordinates gives $A=(2A+4B)/4$, hence $A=2B$. Expanding $(\sum_i|u_i|^2)^2=1$ gives $(d-1)A+(d-1)(d-2)B=1$, so $B=1/[(d-1)d]$. The same phase symmetry and normalization give the second moment.

The scalar moments are
$$
\mathbb Ep^2=\frac{2}{d(d+1)},\qquad
\mathbb E[p(1-p)]=\frac{d-1}{d(d+1)},\qquad
\mathbb E(1-p)^2=\frac{d-1}{d+1}.
\tag{8.8g.13.14}
$$
The independent phase average, (8.8g.13.13) and these moments make the all-negative-coordinate term $2/[d(d+1)]$ and each allowed paired contraction in the mixed and all-positive terms $1/[d(d+1)]$; every unbalanced term vanishes. Consequently
$$
\mathbb E[z_i\overline{z_j}z_k\overline{z_l}]
=\frac{\delta_{ij}\delta_{kl}+\delta_{il}\delta_{kj}}{d(d+1)},
\tag{8.8g.13.15}
$$
which is (8.8g.13.3). ∎

<a id="theorem-88g14-all-pure-obstruction-for-every-indefinite-single-ray-repair"></a>**Theorem 8.8g.14 (All-Pure Obstruction for Every Indefinite Single-Ray Repair).** For every indefinite $R\in H_d(\mathbb C)$ with $\operatorname{tr}R=\|R\|_{\mathrm{HS}}=1$ such that $B_R$ in (8.8g.13.1) is trace-self-dual, there is no trace-self-dual cone $C$ on the full fixed product carrier $H_{d^2}(\mathbb C)$ satisfying
$$
B_R\otimes_{\min}B_R\subseteq C\subseteq B_R\otimes_{\max}B_R
\tag{8.8g.14.1}
$$
and having Hilbert–Schmidt norm one on every normalized extreme ray.

*Proof.* Work in the real diagonal eigenbasis of $R$ from Lemma 8.8g.13. Set $M_R=B_R\otimes_{\max}B_R$. The map $L_W(X)=\operatorname{Tr}_1[(X\otimes I_d)W]$ is $B_R$-positive exactly when $W\in M_R$, and its Hilbert–Schmidt adjoint is then also positive because $B_R=B_R^*$. Expansion in a real orthonormal Hermitian basis gives $\|L_W\|_F=\|W\|_{\mathrm{HS}}$ and $\operatorname{tr}L_W(I_d)=\operatorname{tr}W$.

**Norm and exact unit locus.** Contracting (8.8g.13.3) gives $\mathbb E[\operatorname{tr}(XP)\operatorname{tr}(YP)]=[\operatorname{tr}(XY)+\operatorname{tr}(X)\operatorname{tr}(Y)]/[d(d+1)]$ for Hermitian $X,Y$. Apply it separately to the output coordinates and trace of a real-linear map $L$. Writing $t=\operatorname{tr}L(I_d)$ gives
$$
\mathbb E\|L(P)\|^2=\frac{\|L\|_F^2+\|L(I_d)\|^2}{d(d+1)},\qquad
\mathbb E[(\operatorname{tr}L(P))^2]
=\frac{\|L^*(I_d)\|^2+t^2}{d(d+1)}.
\tag{8.8g.14.2}
$$
For a positive map put $d_L(P)=[\operatorname{tr}L(P)]^2-\|L(P)\|^2\ge0$ on the subcap. Adding this identity for $L$ and $L^*$ cancels the two image-norm terms:
$$
\mathbb E d_L(P)+\mathbb E d_{L^*}(P)
=\frac{2(t^2-\|L\|_F^2)}{d(d+1)}.
\tag{8.8g.14.3}
$$
Since $I_d\in B_R$ and the trace is nonnegative there, $t\ge0$. Therefore $\|W\|\le\operatorname{tr}W$ for every $W\in M_R$, with strict trace positivity when $W\ne0$ and a compact trace-one base. At equality, continuity and full support make every subcap output of $L$ and $L^*$ zero or a positive multiple of $T_R$.

Suppose an interior subcap projector has a nonzero $R$ output under $L$. The isolation of $R$ from the positive-semidefinite part of $T_R$ and continuity make its normalized output constantly $R$ on a neighborhood. Each real-linear functional annihilating $R$, composed with $L(zz^*)$, is a real quadratic polynomial vanishing on a nonempty open subset of $\mathbb C^d$. It therefore vanishes identically. Since pure projectors span $H_d(\mathbb C)$, the range of $L$ is in $\mathbb RR$. Write $L(X)=\operatorname{tr}(aX)R$. Positivity and self-duality give $a\in B_R$, and equality gives $a/\operatorname{tr}a\in T_R$. The normalized tensor is a product involving $R$.

Otherwise all outputs on the open subcap are positive semidefinite of rank at most one, with zero allowed. Lemma 8.8g.11 applies in its full arbitrary-dimensional form. Its complete polynomial-continuation, complexification, unique-factorization and Hermiticity proof includes fixed rank-one range, congruence $VXV^*$, and transposed congruence $VX^{\mathsf T}V^*$ with singular factors allowed. In the fixed-range case, some interior output is nonzero; otherwise all coordinate polynomials vanish identically, forcing $L=0$. Write $L(X)=\operatorname{tr}(aX)P$ with $P$ a trace-one rank-one positive-semidefinite projector. That nonzero output gives $P\in B_R$; positivity gives $a\in B_R$; and norm equality puts $a/\operatorname{tr}a\in T_R$. This is either a product of cap projectors or a product involving $R$. In the other two preserver forms a nonzero positive-semidefinite output on the open subcap forces the scalar sign to be positive, and it is absorbed into $V$. Writing $\operatorname{vec}(V)=\sum_i e_i\otimes Ve_i$, direct matrix-unit expansion gives $L_{|\operatorname{vec}(V)\rangle\langle\operatorname{vec}(V)|}(X)=VX^{\mathsf T}V^*$ and $L_{\Gamma(|\operatorname{vec}(V)\rangle\langle\operatorname{vec}(V)|)}(X)=VXV^*$. These formulas include singular $V$.

Define the $R$ contractions and admissible projectors by
$$
\begin{gathered}
\Phi_{R,1}(W)=\operatorname{Tr}_1[(R\otimes I_d)W],\qquad
\Phi_{R,2}(W)=\operatorname{Tr}_2[(I_d\otimes R)W],\\
\mathcal P_R=\{P_z=zz^*:\|z\|=1,\ \Phi_{R,1}(P_z),\Phi_{R,2}(P_z)\in B_R\}.
\end{gathered}
\tag{8.8g.14.4}
$$
A rank-one positive-semidefinite projector belongs to $M_R$ exactly when these two contractions belong to $B_R$. Necessity follows by testing $R\otimes b$ and $a\otimes R$ and using self-duality. For sufficiency, expand local inputs as $k+\lambda R$ with $k\in K_R$, $\lambda\ge0$. The $K_R\otimes K_R$ term is nonnegative by ordinary positive semidefiniteness; each remaining term is covered by a contraction test, including $R\otimes R$. Ordinary transpose preserves $B_R$ because $R$ is real, so first partial transpose preserves $M_R$. All listed shapes are thus admissible precisely as follows:
$$
\begin{split}
U(M_R)&=\{W\in M_R:\operatorname{tr}W=\|W\|=1\}\\
&=\mathcal P_R\cup\Gamma(\mathcal P_R)
\cup\{R\otimes a,\ a\otimes R:a\in T_R\}.
\end{split}
\tag{8.8g.14.5}
$$
Conversely each listed element has trace and norm one, so the equality is exact.

**The mandatory core.** Let
$$
J_R=\operatorname{cone}U(M_R),\qquad
\mathcal R_R=(R\otimes B_R)+(B_R\otimes R),\qquad
D_R=\operatorname{PSD}_{d^2}\cap\Gamma(\operatorname{PSD}_{d^2})\cap\mathcal R_R^*.
\tag{8.8g.14.6}
$$
If $C$ as in the statement existed, its compact trace-one base would be generated by extreme points in $U(M_R)$, giving $C\subseteq J_R$. Self-duality then gives $J_R^*\subseteq C$. Each member of $D_R$ pairs nonnegatively with the three classes in (8.8g.14.5), using its positive semidefiniteness, positive partial transpose and $\mathcal R_R$ inequalities respectively. Thus
$$
D_R\subseteq J_R^*\subseteq C\subseteq J_R.
\tag{8.8g.14.7}
$$

**Transfer of the rational certificate.** Lemma 8.8g.13 gives $d=3$ or $4$ and $R=\operatorname{diag}(-c,a_1,\ldots,a_{d-1})$ with $c,a_i>0$. Define the real injective local filter $F:\mathbb C^3\to\mathbb C^d$ by
$$
Fe_0=\frac{e_0}{\sqrt c},\qquad
Fe_1=\frac{e_1}{\sqrt{a_1}},\qquad
Fe_2=\frac{e_2}{\sqrt{a_2}}.
\tag{8.8g.14.8}
$$
Then $F^*RF=Q$. Using the complete rational matrix $W$ and witness $H_0$ of Lemma 8.8g.12, put
$$
X_R=(F\otimes F)W(F\otimes F)^*,\qquad
G=(F^*F)^{-1}F^*,\qquad GF=I_3.
\tag{8.8g.14.9}
$$
The positivity and positive partial transpose of $W$ pass through the real filter, so $X_R\ge0$ and $\Gamma X_R\ge0$. Its contractions are
$$
\begin{split}
\Phi_{R,1}(X_R)&=F\operatorname{Tr}_1[(Q\otimes I_3)W]F^*=0,\\
\Phi_{R,2}(X_R)&=F\operatorname{Tr}_2[(I_3\otimes Q)W]F^*=0.
\end{split}
\tag{8.8g.14.10}
$$
Hence $X_R\in D_R$, so it is mandatory in $C$. It remains entangled on the full carrier: local congruence with $G\otimes G$ would take any separable decomposition of $X_R$ to a separable decomposition of $W$. Equivalently the explicitly determined block-positive witness
$$
H_R=(G^*\otimes G^*)H_0(G\otimes G)
\quad\text{satisfies}\quad
\operatorname{tr}(H_RX_R)
=-\frac{91322891516741947}{4500000000000000000}<0.
\tag{8.8g.14.11}
$$

**The null-face contradiction.** Each $\Phi_{R,i}(W')$ lies in $B_R$ when $W'\in M_R$. For a unit $W'$ from (8.8g.14.5) with both contractions zero, an exceptional $R$-product is impossible because $\operatorname{tr}(R^2)=1$ makes one contraction its nonzero other factor. For a pure projector with vector $\operatorname{vec}(V)$, the first zero contraction gives $VRV^*=0$. Its range $\operatorname{ran}V^*$ is totally isotropic for $R$. Projection onto the one-dimensional negative eigenspace is injective on that range: a vector with zero negative coordinate has strictly positive $R$ expectation unless it is zero. Thus $\operatorname{rank}V\le1$, giving an ordinary product projector with $R$-null local factors. For real $R$, direct partial trace gives $\Phi_{R,1}(\Gamma W)=\Phi_{R,1}(W)$ and $\Phi_{R,2}(\Gamma W)=\Phi_{R,2}(W)^{\mathsf T}$. The same rank conclusion therefore holds in the partial-transposed case.

Finally decompose $X_R/\operatorname{tr}X_R$ into normalized extreme points of the compact base of $C$. They all belong to $U(M_R)$. Their contractions lie in the pointed cone $B_R$, and the positive-weight sums of both sets of contractions vanish by (8.8g.14.10). Every summand therefore has both contractions zero. Each is an ordinary product projector by the preceding paragraph, making $X_R$ quantum-separable. Equation (8.8g.14.11) contradicts this. ∎

<a id="proposition-88g15-an-attained-three-dimensional-hilbert-space-repair"></a>**Proposition 8.8g.15 (An Attained Three-Dimensional Hilbert-Space Repair).** The indefinite trace-one unit matrix
$$
R_3=\operatorname{diag}(-1/3,2/3,2/3)
\tag{8.8g.15.1}
$$
defines a trace-self-dual local cone $B_{R_3}$ with unit norm on every normalized extreme ray. Its all-pure trace-self-dual self-composite on the full product carrier is excluded by Theorem 8.8g.14.

*Proof.* Direct calculation gives $\operatorname{tr}R_3=\operatorname{tr}(R_3^2)=1$. To verify the projection criterion (8.8g.13.5), first take a rank-one projector $P$ with negative $R_3$ expectation. If $p$ is its negative-eigendirection weight, then $p>2/3$ and $\alpha=-\operatorname{tr}(R_3P)=p-2/3>0$. A unitary within the positive eigenspace and a phase choice put its nontrivial two-by-two compression in the form
$$
\begin{pmatrix}
p-\alpha/3&\sqrt{p(1-p)}\\
\sqrt{p(1-p)}&1-p+2\alpha/3
\end{pmatrix}.
\tag{8.8g.15.2}
$$
Its diagonal entries are positive, and its determinant is
$$
\frac{\alpha}{3}+\frac{7\alpha^2}{9}>0.
\tag{8.8g.15.3}
$$
The remaining positive direction has entry $2\alpha/3>0$, so $P+\alpha R_3\ge0$.

For a general nonzero $Y\ge0$ with negative expectation, divide by its trace and fix that negative expectation. The compact section of positive-semidefinite trace-one matrices with that fixed expectation is generated by rank-one points: a rank-$r\ge2$ point admits a nonzero support perturbation satisfying both trace and expectation constraints, because its Hermitian support space has dimension $r^2\ge4$; sufficiently small perturbations in both signs remain feasible. Every extreme point thus has rank one. For all those rank-one points the projection uses the same $\alpha$, so their convex combination and rescaling give $Y-\operatorname{tr}(R_3Y)R_3\ge0$. This proves (8.8g.13.5), hence self-duality. Lemma 8.8g.13 gives the full unit/extreme set. Theorem 8.8g.14 supplies the asserted self-composition obstruction. ∎

<a id="theorem-88g16-real-quantum-maximal-unit-locus-and-composition-obstruction"></a>**Theorem 8.8g.16 (Real-Quantum Maximal Unit Locus and Composition Obstruction).** Let $V_n=\operatorname{Sym}_n(\mathbb R)$ and $V_m=\operatorname{Sym}_m(\mathbb R)$ have their trace inner products, order units $I_n,I_m$ and positive-semidefinite cones $P_n,P_m$. On the real tensor carrier $V_n\otimes V_m$, embedded by Kronecker products in $\operatorname{Sym}_{nm}(\mathbb R)$, put $M_{n,m}=P_n\otimes_{\max}P_m$. Every $W\in M_{n,m}$ satisfies $\|W\|_{\mathrm{HS}}\le\operatorname{tr}W$, and its exact normalized unit locus is
$$
\{W\in M_{n,m}:\operatorname{tr}W=\|W\|_{\mathrm{HS}}=1\}
=\{xx^{\mathsf T}\otimes yy^{\mathsf T}:x\in\mathbb R^n,\ y\in\mathbb R^m,\ \|x\|=\|y\|=1\}.
\tag{8.8g.16.1}
$$
For $n,m\ge2$, no trace-self-dual intermediate cone $P_n\otimes_{\min}P_m\subseteq C\subseteq M_{n,m}$ has norm one on every normalized extreme ray. The conclusion applies to every nontrivial real-quantum self-composite with this product carrier and trace pairing.

*Proof.* For a uniformly distributed real unit vector $x\in\mathbb R^n$ and $P=xx^{\mathsf T}$, the real projective moment identity is
$$
\mathbb E[\operatorname{tr}(XP)\operatorname{tr}(YP)]
=\frac{2\operatorname{tr}(XY)+\operatorname{tr}X\operatorname{tr}Y}{n(n+2)}
\quad(X,Y\in V_n).
\tag{8.8g.16.2}
$$
To derive it when $n\ge2$, coordinate sign changes kill every fourth monomial with an odd coordinate power. Permutation invariance gives constants $a=\mathbb Ex_i^4$ and $b=\mathbb Ex_i^2x_j^2$ for $i\ne j$. A $45$-degree rotation gives $a=(2a+6b)/4$, hence $a=3b$. Squaring $\sum_i x_i^2=1$ gives $na+n(n-1)b=1$, so $b=1/[n(n+2)]$ and $a=3/[n(n+2)]$. Expansion of the two quadratic forms proves (8.8g.16.2). For $n=1$ that identity holds directly. The same formula with $m$ holds on the output space.

Associate to $W$ the real-linear map $L:V_n\to V_m$ given by $L(X)=\operatorname{Tr}_1[(X\otimes I_m)W]$. Real orthonormal symmetric-matrix bases give
$$
\|L\|_F=\|W\|_{\mathrm{HS}},\qquad
t=\operatorname{tr}L(I_n)=\operatorname{tr}L^*(I_m)=\operatorname{tr}W.
\tag{8.8g.16.3}
$$
The tensor product in the statement is exactly the carrier spanned by these bases, so this correspondence is injective. Membership in $M_{n,m}$ is equivalent to positivity of $L$ from $P_n$ to $P_m$. Self-duality of the real PSD cones gives positivity of $L^*$ as well. Write
$$
N=\|L\|_F^2,\qquad A=\|L(I_n)\|_{\mathrm{HS}}^2,\qquad
B=\|L^*(I_m)\|_{\mathrm{HS}}^2.
\tag{8.8g.16.4}
$$
Both image matrices are positive semidefinite with trace $t$, so $t\ge0$ and $A,B\le t^2$. Applying (8.8g.16.2) to each output coordinate and to the trace functional yields
$$
\mathbb E\|L(P)\|^2=\frac{2N+A}{n(n+2)},\qquad
\mathbb E[(\operatorname{tr}L(P))^2]=\frac{2B+t^2}{n(n+2)}.
\tag{8.8g.16.5}
$$
Since each $L(P)$ is positive semidefinite, its squared norm is no greater than its squared trace. Repeat the calculation for $L^*$ on the real sphere in dimension $m$; the positive denominators cancel separately in each inequality. One obtains
$$
2N+A\le2B+t^2,\qquad 2N+B\le2A+t^2,
\tag{8.8g.16.6}
$$
and therefore
$$
4N\le A+B+2t^2\le4t^2.
\tag{8.8g.16.7}
$$
This proves $\|W\|\le\operatorname{tr}W$ and forces $W=0$ when $t=0$.

If $W$ has trace and norm one, equality holds throughout (8.8g.16.7), so $A=B=t^2=1$. A nonzero positive-semidefinite matrix has squared norm equal to its squared trace exactly when it has rank one: for its nonnegative eigenvalues, their difference is $2\sum_{i<j}\lambda_i\lambda_j$. Thus $L(I_n)=tP_y$ for a real rank-one projector $P_y=yy^{\mathsf T}$ with $\|y\|=1$.

For $X\ge0$, choose $\lambda\ge0$ with $0\le X\le\lambda I_n$. Positivity gives $0\le L(X)\le\lambda tP_y$. A positive-semidefinite matrix dominated by a multiple of a rank-one projector has range in that line. Indeed its quadratic form vanishes on every vector orthogonal to $y$, and the two-by-two principal-minor inequality then makes all the corresponding rows and columns zero. Hence $L(X)=f(X)P_y$ on $P_n$. The PSD cone spans $V_n$, so the formula extends to all of $V_n$ with a real-linear positive functional $f$. Trace self-duality gives $f(X)=\operatorname{tr}(aX)$ for $a\in P_n$. Equation (8.8g.16.3) and norm equality give $\|a\|=\operatorname{tr}a$, so $a/\operatorname{tr}a$ is a real rank-one projector $P_x$. The corresponding tensor is $a\otimes P_y$, and trace normalization makes it $P_x\otimes P_y$. Conversely every such product belongs to the minimum cone and has trace and norm one. This proves (8.8g.16.1), including unequal local dimensions, singular maps, zero images and nonunital maps.

**Strict minimum/maximum separation.** In $\mathbb R^2\otimes\mathbb R^2$, put $\Omega=e_0\otimes e_0+e_1\otimes e_1$ and let $F_2$ swap the two factors. For the real orthonormal basis $E_{00},E_{11},(E_{01}+E_{10})/\sqrt2$ of $V_2$, direct expansion gives
$$
Z=\sum_\alpha E_\alpha\otimes E_\alpha
=\frac{|\Omega\rangle\langle\Omega|+F_2}{2}.
\tag{8.8g.16.8}
$$
In particular $Z$ lies in the prescribed tensor carrier. For $a,b\in P_2$,
$$
\operatorname{tr}[Z(a\otimes b)]=\operatorname{tr}(ab)\ge0,
\tag{8.8g.16.9}
$$
so $Z\in M_{2,2}$. The unit vector $\eta=(e_0\otimes e_1-e_1\otimes e_0)/\sqrt2$ is orthogonal to $\Omega$ and satisfies $F_2\eta=-\eta$, hence $Z\eta=-\eta/2$. Thus $Z$ is not positive semidefinite and cannot lie in the minimum cone, whose generators are positive-semidefinite matrices on the $4$-dimensional real Hilbert space.

For any $n,m\ge2$, choose real isometries $J_n:\mathbb R^2\to\mathbb R^n$ and $J_m:\mathbb R^2\to\mathbb R^m$. Local congruence embeds $Z$ in $V_n\otimes V_m$. Its product pairing is (8.8g.16.9) applied to the compressed positive-semidefinite matrices $J_n^{\mathsf T}aJ_n$ and $J_m^{\mathsf T}bJ_m$, so it remains in the maximal cone. It remains negative on the embedded $\eta$, and is therefore outside the minimum cone. This proves strict minimum/maximum inclusion and failure of self-duality of the minimum cone.

An intermediate $C$ with the stated all-pure property would have compact trace-one base by (8.8g.16.7). Every extreme point of that base would belong to (8.8g.16.1). Finite-dimensional convexity would give $C\subseteq P_n\otimes_{\min}P_m$, while the reverse inclusion is a premise. The resulting equality with the minimum cone contradicts its strict duality just proved. If one local dimension is $1$, the obstruction correctly leaves the usual single-system PSD cone as a trace-self-dual all-pure composite with that one-dimensional factor. ∎

<a id="theorem-88g17-exact-maximal-radius-from-a-pure-state-moment"></a>**Theorem 8.8g.17 (Exact Maximal Radius from a Pure-State Moment).** Let $V$ be a real Hilbert space of finite dimension $n\ge2$, let $K\subset V$ be a proper self-dual cone for this fixed inner product, and fix $u\in\operatorname{int}K$. Here proper means closed, convex, pointed and generating. Put $e(x)=\langle u,x\rangle$, $B=\{x\in K:e(x)=1\}$, $T=\operatorname{ext}B$ and $r=\|u\|^2$. Assume that every member of $T$ has norm one and that a probability measure $\mu$ on $T$ has the exact second moment
$$
M=\int_T |p\rangle\langle p|\,d\mu(p)
=\alpha I+\beta|u\rangle\langle u|.
\tag{8.8g.17.1}
$$
The rank-one operator in this formula sends $x$ to $p\langle p,x\rangle$. All tensor norms and duals below use the fixed product Hilbert inner product. For arbitrary proper cones $K_i\subset V_i$, the ordinary full-dual conventions are
$$
K_1\otimes_{\min}K_2
=\operatorname{cone}\{a\otimes b:a\in K_1,\ b\in K_2\},\qquad
K_1\otimes_{\max}K_2
=(K_1^*\otimes_{\min}K_2^*)^*.
\tag{8.8g.17.2}
$$
In the self-composite write $K_{\min},K_{\max}$ for these cones and $e_2(W)=\langle u\otimes u,W\rangle$. Then
$$
r>1,\quad
\alpha=\frac{r-1}{r(n-1)}>0,\quad
\beta=\frac{n-r}{r^2(n-1)},\quad
\kappa=\frac\beta\alpha=\frac{n-r}{r(r-1)},
\tag{8.8g.17.3}
$$
and the exact maximal norm of the normalized maximal base is
$$
\max_{W\in K_{\max},\ e_2(W)=1}\|W\|
=\max\left\{1,\frac{\sqrt n}{r}\right\}.
\tag{8.8g.17.4}
$$
If $n<r^2$, its maximizing states are exactly $p\otimes q$ with $p,q\in T$. If $n>r^2$, identify a tensor with the real-linear map $L_{a\otimes b}(x)=a\langle b,x\rangle$. The maximizing maps are exactly $L=S/r$, where $S$ is an orthogonal automorphism of $K$ satisfying $Su=u$. If $n=r^2$, the radius is one; equality is equivalent to the vanishing of both integrated local norm deficits in (8.8g.17.8) below. No general classification of the equality locus at that boundary is asserted.

*Proof.* Since $u$ is interior to the dual cone, $B$ is compact. Finite-dimensional compact convexity expresses each point of $B$ as a finite convex combination of its extreme points. Consequently
$$
\|x\|\le e(x)\quad(x\in K),\qquad
T=B\cap\{p:\|p\|=1\}.
\tag{8.8g.17.5}
$$
For the reverse implication in the second identity, a nontrivial convex decomposition of a unit vector into two different vectors of the closed unit ball contradicts strict convexity of the Hilbert norm. This also proves that $T$ is compact. Cauchy--Schwarz applied to $\langle u,p\rangle=\|p\|=1$ gives $r\ge1$. Equality would force every pure $p$ to equal $u$, so that $K$ would be a ray, contrary to $n\ge2$.

The trace and the quadratic form at $u$ of (8.8g.17.1) give $n\alpha+r\beta=1$ and $r\alpha+r^2\beta=1$, respectively. Solving gives (8.8g.17.3), and
$$
\alpha-\beta=\frac{r^2-n}{r^2(n-1)},\qquad
M u=\int_Tp\,d\mu(p)=\frac ur.
\tag{8.8g.17.6}
$$
Thus $M$ is positive definite: its eigenvalues are $\alpha$ on $u^\perp$ and $1/r$ on the line through $u$. No assumption that $\mu$ has full support on $T$ is made. The proof below does not require a separate sign assumption on $\beta$.

The tensor-to-map identification is an isometry from the real Hilbert tensor product to the space of real-linear maps with its Hilbert--Schmidt norm; this follows by expanding in real orthonormal bases. Full-dual product tests and $K=K^*$ say exactly that $W\in K_{\max}$ if and only if $L(K)\subseteq K$. Its adjoint is then positive as well. Put
$$
N=\|L\|_{\mathrm{HS}}^2,\quad A=\|Lu\|^2,\quad
D=\|L^*u\|^2,\quad t=\langle u,Lu\rangle=e_2(W).
\tag{8.8g.17.7}
$$
For nonzero positive $L$, $t>0$. Indeed, $t=0$ would give $Lu=0$ by strict positivity of $u$ on $K\setminus\{0\}$. For each $x\in K$, interiority gives $0\le x\le\lambda u$ for some $\lambda$; hence $0\le Lx\le0$, so pointedness and generation give $L=0$. The local inequality (8.8g.17.5) gives $A,D\le t^2$.

Apply that inequality to $Lp$ and integrate, and then apply it to $L^*p$. Expansion using the exact moment gives the two nonnegative deficits
$$
\begin{aligned}
\Delta_L&=\int_T\big(e(Lp)^2-\|Lp\|^2\big)\,d\mu(p)
=\alpha D+\beta t^2-\alpha N-\beta A\ge0,\\
\Delta_{L^*}&=\int_T\big(e(L^*p)^2-\|L^*p\|^2\big)\,d\mu(p)
=\alpha A+\beta t^2-\alpha N-\beta D\ge0.
\end{aligned}
\tag{8.8g.17.8}
$$
Their sum gives
$$
N\le\frac{1-\kappa}{2}(A+D)+\kappa t^2.
\tag{8.8g.17.9}
$$
If $\kappa\le1$, equivalently $n\le r^2$, the upper bounds $A,D\le t^2$ prove $N\le t^2$. Every pure product attains this bound. In the strict case, equality forces $A=D=t^2$, so $a=Lu/t$ is a normalized pure vector. For $0\le x\le\lambda u$, positivity gives $0\le Lx\le\lambda t a$. An extreme ray is a face, so $Lx$ lies on the ray of $a$. Generation of $V$ now gives $Lx=a\langle f,x\rangle$ for a linear functional represented by $f\in K^*=K$. Since $e(a)=\|a\|=1$, one has $t=e(f)$ and $\|L\|_{\mathrm{HS}}=\|f\|$. Equality implies $f/t\in T$. Thus $W/t=a\otimes(f/t)$, proving the exact product locus, including singular and nonunital maps. At $\kappa=1$, adding (8.8g.17.8) gives $\Delta_L+\Delta_{L^*}=2\alpha(t^2-N)$; since each deficit is nonnegative, their simultaneous vanishing is exactly norm equality.

If $\kappa>1$, Cauchy--Schwarz instead gives $A,D\ge t^2/r$. The coefficient $1-\kappa$ in (8.8g.17.9) is negative, and hence
$$
N\le\left(\kappa-\frac{\kappa-1}{r}\right)t^2
=\frac n{r^2}t^2.
\tag{8.8g.17.10}
$$
The identity map is positive, and $L=I/r$ has $t=1$ and $N=n/r^2$, so this bound is attained. For any nonzero equality case, equality in Cauchy--Schwarz gives $Lu=L^*u=(t/r)u$, and both deficits in (8.8g.17.8) vanish. Put $S=(r/t)L$. Then $Su=S^*u=u$, both $S,S^*$ are positive, and for $\mu$-almost every $p\in T$ one has $e(Sp)=\|Sp\|=1$.

For each such $p$, $S^*Sp\in K$ has $e(S^*Sp)=\langle Su,Sp\rangle=1$, so its norm is at most one. But $\langle p,S^*Sp\rangle=\|Sp\|^2=1$ and $\|p\|=1$. Equality in Cauchy--Schwarz therefore gives $S^*Sp=p$. This full-measure set spans $V$: a vector orthogonal to it would have zero quadratic form against the positive definite $M$. Thus $S^*S=I$. In equal finite dimension $S$ is orthogonal, and its positive inverse $S^*$ shows $SK=K$. Conversely an orthogonal automorphism fixing $u$ has Hilbert--Schmidt norm $\sqrt n$ and $\langle u,Su\rangle=r$, so $S/r$ attains (8.8g.17.10).

Finally, the normalized maximal base is closed and bounded by the proved estimate and is therefore compact. For the minimum cone, the normalized base is the convex hull of the compact set $\{p\otimes q:p,q\in B\}$, so it too is compact. The conic hull is closed because normalization controls the scalar coefficient in every convergent sequence. Thus (8.8g.17.2) involves finite conic decompositions and no unproved closure step. The zero tensor satisfies every homogeneous inequality separately. ∎

<a id="corollary-88g18-exact-centered-minimum-cone-ball"></a>**Corollary 8.8g.18 (Exact Centered Minimum-Cone Ball).** Under the hypotheses of Theorem 8.8g.17, the largest closed ambient Hilbert ball centered at $u\otimes u$ contained in $K_{\min}$ has radius
$$
\rho_{\min}=\min\left\{1,\frac r{\sqrt n}\right\}.
\tag{8.8g.18.1}
$$
This is a ball in the full real product carrier, not a section by the normalization hyperplane.

*Proof.* Self-duality of $K$ and (8.8g.17.2) give $K_{\min}^*=K_{\max}$. For a proposed radius $\rho\ge0$, minimizing the pairing of $W\in K_{\max}$ with $u\otimes u+H$ over $\|H\|\le\rho$ gives $e_2(W)-\rho\|W\|$. Thus the ball is contained in $K_{\min}$ exactly when this is nonnegative for every such $W$. Every nonzero $W$ has positive normalization, so the optimal radius is the reciprocal of (8.8g.17.4). Attainment there makes this exact: if $W$ is a normalized maximizer and $\rho>1/\|W\|$, then $u\otimes u-\rho W/\|W\|$ has negative pairing with $W$ and lies outside $K_{\min}$. ∎

<a id="theorem-88g19-strict-moment-obstruction-and-classical-equivalence"></a>**Theorem 8.8g.19 (Strict Moment Obstruction and Classical Equivalence).** Under the hypotheses of Theorem 8.8g.17 with $n<r^2$, a self-dual intermediate cone
$$
K_{\min}\subseteq C=C^*\subseteq K_{\max}
\tag{8.8g.19.1}
$$
whose every $e_2$-normalized extreme state has norm one exists if and only if $K$ is simplicial. In that case the normalized pure generators of $K$ form an orthonormal basis, $u$ is their sum, and $C=K_{\min}=K_{\max}$. For a nonsimplicial $K$ in this strict moment class, every self-dual intermediate completion has a normalized extreme state of norm strictly below one.

*Proof.* The base of $C$ is compact by Theorem 8.8g.17. Every one of its extreme points is a pure product by the exact strict unit locus. Finite-dimensional extreme-point generation yields $C\subseteq K_{\min}$; (8.8g.19.1) gives equality. Dualizing gives $K_{\min}=K_{\max}$.

Here is a complete elementary proof that this equality forces simpliciality in the self-dual case. For an orthonormal basis $(v_i)$, the tensor $\Omega=\sum_i v_i\otimes v_i$ represents the identity map and therefore belongs to $K_{\max}$. Its membership in the minimum cone gives a finite decomposition
$$
I=\sum_j |a_j\rangle\langle b_j|,\qquad a_j,b_j\in K.
\tag{8.8g.19.2}
$$
Remove zero terms. For each $x\in K$, the identity expresses $x$ as a nonnegative combination of the finite list $a_j$, so $K$ is polyhedral. Let $q_1,\ldots,q_m$ represent its distinct extreme rays. In the identity applied to $q_k$, every positive summand must lie on that ray. At least one coefficient is positive; choose one index $j_k$. Then $a_{j_k}$ is proportional to $q_k$. If $\langle b_{j_k},q_l\rangle>0$ for $l\ne k$, the identity applied to $q_l$ would make the same nonzero $a_{j_k}$ proportional to $q_l$, a contradiction. Hence $b_{j_k}$ vanishes on the other rays and is strictly positive on $q_k$. Applying these functionals to any linear relation among the $q_k$ proves independence. The rays generate $V$, so $m=n$ and $K$ is simplicial.

Conversely, for a simplicial cone the dual extreme functional corresponding to a primal ray vanishes on every other ray. Self-duality identifies this dual ray with a primal extreme ray. It cannot be a different primal ray, since it would then vanish on itself, contradicting its positive self-inner-product. Thus the primal extreme rays are pairwise orthogonal. Their normalized unit generators form an orthonormal basis $(p_i)$ and satisfy $\langle u,p_i\rangle=1$, whence $u=\sum_i p_i$. The product generators form an orthonormal basis of $V\otimes V$, so their orthant is self-dual, equals both tensor cones and has unit normalized extreme states. Finally, the maximal norm bound excludes norm greater than one on every intermediate base. Failure of the all-pure property therefore means a strictly shorter extreme state in each completion; it need not be a state shared by all completions. ∎

The minimum/maximum equality criterion is the self-dual self-pair special case of Aubrun, Lami, Palazuelos and Plávala, Entangleability of cones (2021), Theorem A. The finite identity-map argument above proves that special case directly.

<a id="theorem-88g20-unequal-factors-and-orthogonal-block-decomposition"></a>**Theorem 8.8g.20 (Unequal Factors and Orthogonal Block Decomposition).** For $i=1,2$, let $(V_i,K_i,u_i)$ satisfy the local hypotheses of Theorem 8.8g.17, with $n_i\ge2$, $r_i=\|u_i\|^2$ and $\kappa_i=(n_i-r_i)/[r_i(r_i-1)]$. The criterion
$$
\kappa_1\kappa_2\le1
\tag{8.8g.20.1}
$$
is sufficient for $\|W\|\le(e_1\otimes e_2)(W)$ on $K_1\otimes_{\max}K_2$. With strict inequality, the normalized norm-one locus consists exactly of pure products. This criterion is not asserted to be necessary; equality in (8.8g.20.1) is not a general classification of unit states or of all-pure intermediate cones.

Let, separately, $V=\bigoplus_i V_i$ be a finite orthogonal sum, $K=\bigoplus_iK_i$ and $u=\sum_i u_i$. Each summand is either a unit-normalized ray or satisfies Theorem 8.8g.17 with $n_i\le r_i^2$. Every all-pure self-dual intermediate self-composite of this $K$ decomposes as
$$
C=\bigoplus_{i,j} C_{ij},\qquad
K_i\otimes_{\min}K_j\subseteq C_{ij}=C_{ij}^*
\subseteq K_i\otimes_{\max}K_j,
\tag{8.8g.20.2}
$$
where each dual is inside $V_i\otimes V_j$ and every $C_{ij}$ is all-pure in its product normalization. Every summand with $n_i<r_i^2$ must be simplicial. Conversely, whenever such pair cones $C_{ij}$ exist for all ordered pairs, their orthogonal direct sum is an all-pure self-dual intermediate self-composite of $K$. No global moment of the form (8.8g.17.1) is required on this direct sum.

*Proof.* Identify $W$ with a positive real-linear $L:V_2\to V_1$, whose adjoint is positive. Put $N=\|L\|_{\mathrm{HS}}^2$, $A=\|Lu_2\|^2$, $D=\|L^*u_1\|^2$ and $t=\langle u_1,Lu_2\rangle$. As before, $A,D\le t^2$, and $t>0$ for nonzero $L$ by order-unit domination. Integrating the local output inequality against the input moment, then doing the same for $L^*$, gives
$$
N\le D+\kappa_2(t^2-A),\qquad
N\le A+\kappa_1(t^2-D).
\tag{8.8g.20.3}
$$
Set $x=t^2-A\ge0$ and $y=t^2-D\ge0$. Since
$$
1+\kappa_i=\frac{(r_i-1)^2+n_i-1}{r_i(r_i-1)}>0,
\tag{8.8g.20.4}
$$
we may multiply the first inequality for $N-t^2$ by $1+\kappa_1$ and the second by $1+\kappa_2$. Adding gives exactly
$$
(2+\kappa_1+\kappa_2)(N-t^2)
\le(\kappa_1\kappa_2-1)(x+y).
\tag{8.8g.20.5}
$$
The coefficient on the left is positive. This proves the norm bound under (8.8g.20.1). In the strict case, $N=t^2$ forces $x=y=0$, so $Lu_2/t$ is pure. The same domination and extreme-ray argument as in Theorem 8.8g.17 gives $Lz=a\langle f,z\rangle$ with $a\in K_1$ pure normalized and $f\in K_2$. Its norm and normalization are $\|f\|$ and $e_2(f)$, so equality makes the normalized $f$ pure. This proves the exact unit locus, and pure products prove the converse.

For clarity, the simpler pairwise hypothesis $n_i\le r_i^2$ for both factors also suffices without any sign premise on $\beta_i$: adding (8.8g.20.3) directly gives
$$
2N\le(1-\kappa_2)A+(1-\kappa_1)D
+(\kappa_1+\kappa_2)t^2\le2t^2.
\tag{8.8g.20.6}
$$
If either inequality $n_i\le r_i^2$ is strict, equality makes the corresponding $A$ or $D$ equal $t^2$, and the rank-one argument applies to $L$ or $L^*$. A unit-normalized ray factor needs no formula with denominator $n_i-1$: its product carrier and cone are isometric to the other system, so its normalized norm-one states are precisely pure products by (8.8g.17.5).

For the sum statement, the product carrier splits orthogonally into $V_i\otimes V_j$. Its maximum cone splits into the corresponding maximum pair cones: tests supported in a pair of summands prove necessity, and adding the nonnegative block evaluations proves sufficiency. Its minimum cone splits in the same manner by distributing a positive product over the finitely many summands. Write $W_{ij}$ for a maximal-positive tensor's component and $t_{ij}=\langle u_i\otimes u_j,W_{ij}\rangle\ge0$. The pair bounds just proved give
$$
\|W\|^2=\sum_{i,j}\|W_{ij}\|^2
\le\sum_{i,j}t_{ij}^2
\le\left(\sum_{i,j}t_{ij}\right)^2=e_2(W)^2.
\tag{8.8g.20.7}
$$
If $e_2(W)=\|W\|=1$, equality in the last inequality forces at most one nonzero $t_{ij}$. Every zero $t_{ij}$ has zero block by its norm bound. Thus every normalized extreme state of an all-pure $C$ is supported on one block. Its base is compact by (8.8g.20.7); finite extreme-point generation gives $C=\bigoplus_{i,j}(C\cap(V_i\otimes V_j))$. Orthogonality makes duality componentwise, giving (8.8g.20.2). The min/max inclusions restrict blockwise, and a block extreme ray is also an extreme ray of $C$. Each block therefore inherits unit normalized purity. Apply Theorem 8.8g.19 to a strict diagonal block $C_{ii}$ to obtain simpliciality of $K_i$.

Conversely, the minimum and maximum decompositions, componentwise self-duality and the fact that extreme rays of a direct sum occupy a single block prove the converse directly. The proof derives the block decomposition of $C$ from purity; it does not posit physical summand projections or self-duality of arbitrary faces. ∎

<a id="theorem-88g21-centered-planar-classification-and-polygon-moments"></a>**Theorem 8.8g.21 (Centered Planar Classification and Polygon Moments).** Let $K$ be a proper self-dual cone in a real Hilbert space of dimension three, with $u\in\operatorname{int}K$ and all extreme points of $B=\{x\in K:\langle u,x\rangle=1\}$ of norm one. With $r=\|u\|^2$, define in the Euclidean plane $u^\perp$
$$
D=\sqrt r\,(B-u/r),\qquad R=\sqrt{r-1}.
\tag{8.8g.21.1}
$$
Then either $D$ is the unit disk and $r=2$, or $D$ is a regular odd $m$-gon centered at the polarity origin, with
$$
R^2=\sec(\pi/m),\qquad r=1+\sec(\pi/m),\qquad m\ge3\text{ odd}.
\tag{8.8g.21.2}
$$
Every one of these local cones admits the moment in Theorem 8.8g.17 with $n=3<r^2$. The only one admitting an all-pure self-dual intermediate self-composite in the fixed product metric is the triangle, whose cone is an orthogonal three-dimensional orthant.

*Proof.* The local argument (8.8g.17.5), which uses no moment premise, gives $r>1$. The origin belongs to the interior of $D$ since $u/r$ is interior to the normalized base. For $v,w\in u^\perp$,
$$
\left\langle\frac ur+\frac v{\sqrt r},\frac ur+\frac w{\sqrt r}\right\rangle
=\frac{1+\langle v,w\rangle}{r}.
\tag{8.8g.21.3}
$$
Local self-duality is therefore exactly negative polarity in this plane:
$$
D=-D^\circ,\qquad D^\circ=\{z:\langle z,x\rangle\le1\text{ for every }x\in D\}.
\tag{8.8g.21.4}
$$
The affine transformation preserves extremes, and every extreme of $D$ lies on the circle $S_R$ of radius $R$ centered at the polarity origin. Finite extreme-point generation and strict convexity of the disk give
$$
D\subseteq R\mathbb B_2,\qquad E:=\operatorname{ext}D=D\cap S_R,
\qquad (1/R)\mathbb B_2\subseteq D\subseteq R\mathbb B_2.
\tag{8.8g.21.5}
$$
In particular $E$ is closed, $R\ge1$, and $R=1$ forces the unit disk.

Suppose $R>1$. For any $p\in E$ put $w=-p/R^2$. The outer disk bound gives $\langle w,x\rangle\ge-1$ for all $x\in D$, so negative polarity puts $w\in D$. It lies in the proper exposed face
$$
F_p=D\cap\{x:\langle p,x\rangle=-1\}.
\tag{8.8g.21.6}
$$
Its norm is $1/R<R$, so $w$ is not extreme. The face is thus a nondegenerate segment, not a singleton. Its endpoints are extreme points of $D$ and consequently are exactly the two intersections of its supporting line with $S_R$. Set $\delta=\arccos(1/R^2)\in(0,\pi/2)$. The open minor circular arc between the endpoints, centered opposite $p$, has angular length $2\delta$ and satisfies $\langle p,x\rangle<-1$. It contains no point of $D$.

This arc is a connected component of $S_R\setminus E$: its interior avoids the closed set $E$ and both endpoints lie in $E$. Distinct extreme $p$ give distinct arcs because their midpoint directions are $-p/R$. Components are disjoint. For any finite list of $N$ distinct extreme points their arcs have total length $2N\delta\le2\pi$. An infinite $E$ would permit an integer $N>\pi/\delta$, a contradiction. Thus $E$ is finite, covering all possible nonpolyhedral extreme sets without assuming polyhedrality.

Now $D$ is a polygon with $m\ge3$ vertices. Distinct $p$ give distinct supporting lines in (8.8g.21.6), hence distinct edges. The injection from its $m$ vertices to its $m$ edges is a bijection. Every edge has consecutive angular gap $2\delta$, so all gaps are equal, $\delta=\pi/m$ and $D$ is regular. If its vertex angles are $\theta_0+2j\pi/m$, the polar vertex directions are the edge midpoints $\theta_0+(2j+1)\pi/m$; negation adds $\pi$. They coincide with vertex directions exactly when $m+1$ is even, namely when $m$ is odd. The polar circumradius is $1/[R\cos(\pi/m)]$, and equality of radii proves (8.8g.21.2). The finite strongly self-dual polygon conclusion is established in Lovász (1983, Section 1, p. 318). The finiteness argument above supplies the step needed before invoking any polytope classification.

For a direct check of the local models and their moments, put $c=\cos(\pi/m)$, $a=\sqrt{c/(1+c)}$, $b=1/\sqrt{1+c}$ and, in an orthonormal basis with first axis along $u$,
$$
p_j=(a,b\cos(2\pi j/m),b\sin(2\pi j/m)),\qquad
u=(1/a,0,0),\qquad K_m=\operatorname{cone}\{p_j:0\le j<m\}.
\tag{8.8g.21.7}
$$
These vectors have norm and normalization one. Their pairings are $[c+\cos(2\pi(i-j)/m)]/(1+c)$. For odd $m$ they are nonnegative and vanish exactly when the index difference is $(m-1)/2$ or $(m+1)/2$ modulo $m$. The corresponding two rays are adjacent, so the $p_i$ are the complete inward facet normals of the cone, proving $K_m=K_m^*$ in the fixed Euclidean metric.

The finite geometric sums $\sum_{j=0}^{m-1}\exp(2\pi i k j/m)=0$ for $k=1,2$ and $m\ge3$ give the uniform second moment
$$
M=\operatorname{diag}(a^2,b^2/2,b^2/2)
=\alpha I+\beta|u\rangle\langle u|,\qquad
\alpha=\frac1{2(1+c)},\quad
\beta=\frac{c(2c-1)}{2(1+c)^2},\quad r=\frac{1+c}{c}.
\tag{8.8g.21.8}
$$
For the circle take $p(\theta)=2^{-1/2}(1,\cos\theta,\sin\theta)$ and $u=(\sqrt2,0,0)$. Uniform angle gives $M=\operatorname{diag}(1/2,1/4,1/4)$, hence $\alpha=1/4$, $\beta=1/8$ and $r=2$. In every case $3<r^2$. For odd $m\ge5$ there are more than three extreme rays, and the circle has infinitely many, so these cones are nonsimplicial and Theorem 8.8g.19 excludes the stated composites. At $m=3$ the three unit rays are orthogonal and their orthant composite exists. ∎

<a id="theorem-88g22-all-pure-classicality-through-real-dimension-three"></a>**Theorem 8.8g.22 (All-Pure Classicality through Real Dimension Three).** Let $V$ be a nonzero finite-dimensional real Hilbert space, $K\subset V$ any proper cone and $u\in\operatorname{int}K^*$. Define the full-dual tensor cones by (8.8g.17.2), before imposing any local self-duality assumption. Suppose
$$
K\otimes_{\min}K\subseteq C=C^*
\subseteq (K^*\otimes_{\min}K^*)^*
\tag{8.8g.22.1}
$$
and every extreme point of the $\langle u\otimes u,\cdot\rangle$-normalized base of $C$ has norm one. Then $K=K^*$ and every local normalized extreme point has norm one. If $\dim_{\mathbb R}V\le3$, $K$ is an orthogonal simplicial cone with unit normalized generators, and the unique intermediate cone is its product orthant. Conversely these classical cones satisfy the premises. A nonclassical example exists in local real dimension four: the complex qubit with its ordinary complex two-qubit composite. Thus four is the smallest local real dimension for nonclassicality in precisely this all-pure, full-dual, product-metric setting; no classification in dimension four or above is asserted.

*Proof.* First the normalized maximal base in (8.8g.22.1) is compact even before any local norm result. If a maximal-positive $W$ has $\langle u\otimes u,W\rangle=0$, contraction in one slot with $u$ is an element of $K$ with zero $u$-evaluation, hence zero. For every $f\in K^*$, order-unit domination in $K^*$ gives $0\le f\le\lambda u$. Its contraction is therefore dominated by a multiple of that zero marginal and is zero. Since $K^*$ spans the dual space, all contractions vanish and $W=0$. Thus $u\otimes u$ is strictly positive on every nonzero maximal tensor. The cone is closed and pointed by the full product tests, and contains the generating minimum cone. An unbounded sequence in its normalization-one base, divided by its norms and followed by a convergent subsequence of unit vectors, would yield a nonzero maximal tensor of zero normalization. This contradiction proves compactness; every intermediate closed base is compact as well.

Self-duality makes $C$ acute. For $x,y,z\in K$ with $z\ne0$, its product inclusion gives $\langle x,y\rangle\|z\|^2=\langle x\otimes z,y\otimes z\rangle\ge0$. Hence $K\subseteq K^*$. Dualizing the upper inclusion in (8.8g.22.1) gives $K^*\otimes_{\min}K^*\subseteq C$. Applying the same acuteness argument to $K^*$ gives $K^*\subseteq K^{**}=K$. Thus $K=K^*$ and $u\in\operatorname{int}K$.

Pure products are extreme even in the maximal cone. To prove this without an exposed-ray assumption, let normalized extreme $p,q\in K$ and write $p\otimes q=W_1+W_2$ with $W_i$ maximal-positive. The first marginals obtained by contracting the second slot with $u$ are positive and sum to $p$, so each is a nonnegative multiple of $p$. For each positive effect $f\in K^*$, domination $0\le f\le\lambda u$ makes its contraction of $W_i$ positive and dominated by a multiple of that marginal. Extremality forces it into the line of $p$. Positive effects span the whole dual, so $W_i=p\otimes b_i$ for a vector $b_i$; its nonnegative pairings with all positive effects give $b_i\in K$. A zero marginal gives $W_i=0$ by the same domination argument. Now $b_1+b_2=q$, so extremality of $q$ makes each $W_i$ a nonnegative multiple of $p\otimes q$. The product ray is therefore extreme in every intermediate $C$. Taking $q=p$, its normalized norm is $\|p\otimes p\|=\|p\|^2=1$, proving local unit purity.

For real dimension three, Theorem 8.8g.21 now applies and leaves only the orthant. In real dimension two a proper cone has exactly two extreme rays. Its simpliciality and self-duality make them orthogonal by the dual-ray argument in Theorem 8.8g.19. Their normalized generators have norm one by the preceding paragraph. Dimension one is a single unit-normalized ray, and no moment formula with denominator $n-1$ is needed. In each case the normalized extreme generators form an orthonormal basis and $u$ is their sum, so the minimum and maximum cones coincide with the product orthant. This proves necessity, uniqueness and converse in dimensions at most three.

For the existence boundary take $V=\operatorname{Herm}_2(\mathbb C)$ as a real Hilbert space with $\langle A,B\rangle=\operatorname{tr}(AB)$, $K=\operatorname{PSD}_2(\mathbb C)$ and $u=I_2$. Its real dimension is four, its cone is self-dual, and its normalized pure states are rank-one trace-one projectors of Hilbert--Schmidt norm one. The Kronecker map
$$
\operatorname{Herm}_2(\mathbb C)\otimes_{\mathbb R}\operatorname{Herm}_2(\mathbb C)
\longrightarrow\operatorname{Herm}_4(\mathbb C),\qquad A\otimes B\longmapsto A\otimes B
\tag{8.8g.22.2}
$$
is an isometric isomorphism: products of a Hilbert--Schmidt orthonormal Hermitian basis are orthonormal, both real dimensions are sixteen, and $\operatorname{tr}[(A\otimes B)(A'\otimes B')]=\operatorname{tr}(AA')\operatorname{tr}(BB')$. Choose $C=\operatorname{PSD}_4(\mathbb C)$. It is self-dual for exactly that product pairing, contains all positive products and pairs nonnegatively with them, so it lies in the required tensor interval. Its normalization is trace with $I_2\otimes I_2=I_4$, and all normalized extreme states are rank-one projectors of norm one. The local cone has infinitely many extreme rays and is nonclassical. This supplies an actual example, not uniqueness of the complex qubit among dimension-four cones. ∎

The real ordered-space dimension in Theorem 8.8g.22 is distinct from the matrix size in Proposition 8.8g.15. That earlier proposition's matrix size $d=3$ means $\operatorname{Herm}_3(\mathbb C)$ has real dimension nine; its attained local premise is unaffected. The complex qubit has matrix size two and real ordered-space dimension four.

**Premise checks and exact boundaries.** The moment hypothesis cannot be inferred from local self-duality and unit purity, even when $n<r^2$. Take $K=\mathbb R_+\oplus\operatorname{PSD}_2(\mathbb C)$ with its orthogonal trace pairing and $u=1\oplus I_2$. Then $n=5$, $r=3$ and every normalized local pure state has norm one. Every pure-state second moment has zero entries between the two summands, because a pure state occupies a single summand. But (8.8g.17.3) would require $\alpha=1/6$, $\beta=1/18$, whose term $\beta|u\rangle\langle u|$ has nonzero cross entries. No such global moment exists. Its actual all-pure self-dual composite is the orthogonal sum
$$
\operatorname{PSD}_1(\mathbb C)\oplus\operatorname{PSD}_2(\mathbb C)
\oplus\operatorname{PSD}_2(\mathbb C)\oplus\operatorname{PSD}_4(\mathbb C).
\tag{8.8g.22.3}
$$
The real dimensions sum to $1+4+4+16=25=5^2$. Blockwise Hermitian Kronecker isometries give the exact product pairing, and each normalized extreme is a unit rank-one projector in one block. Theorem 8.8g.20 covers this construction without supplying a nonexistent global measure. The same construction works for finite direct sums of complex matrix cones, including unequal matrix sizes.

The circle in Theorem 8.8g.21 must be centered at the polarity origin. For an exact counterexample if this condition is dropped, put
$$
D_0=\operatorname{conv}\{(1,0),(-1,\sqrt2),(-1,-\sqrt2)\}.
\tag{8.8g.22.4}
$$
Its negative polar is given by $x\ge-1$, $x-\sqrt2y\le1$ and $x+\sqrt2y\le1$, whose three vertices are exactly those displayed. Thus $D_0=-D_0^\circ$. The vertices lie on the circle centered at $(-1/2,0)$ of radius $3/2$, but the side lengths are $\sqrt6,\sqrt6,2\sqrt2$, so the triangle is irregular. Their distances from the polarity origin are $1,\sqrt3,\sqrt3$, violating the actual hypothesis.

The strict coefficient boundary is also essential. In the Lorentz cone $K=\{(x_0,x'):x_0\ge\|x'\|\}$ on $\mathbb R^n$ with $u=\sqrt2 e_0$, pure states are $p=(1,v)/\sqrt2$ with $\|v\|=1$. Cauchy--Schwarz proves self-duality, $r=2$, and the uniform sphere has $\alpha=1/[2(n-1)]$, $\beta=(n-2)/[4(n-1)]$. For $n=4$, the positive map $I/2$ is a normalized norm-one tensor of rank four, so it is not a product. For $n=5$ it has squared norm $5/4>1$. The critical locus cannot generally be replaced by products, and the supercritical maximal bound cannot be replaced by one. A maximal-radius tensor need not belong to a chosen intermediate $C$, so a radius greater than one does not itself exclude all-pure intermediate composition.

The unequal-factor sufficient criterion is genuinely not necessary. Write $\mathcal L_d$ for the preceding Lorentz cone in dimension $d$. Its coefficient is $\kappa_d=(d-2)/2$. For a positive map $L:\mathcal L_3\to\mathcal L_7$, write
$$
L(s,x)=(a s+b^{\mathsf T}x,\ c s+D x),\qquad x\in\mathbb R^2.
\tag{8.8g.22.5}
$$
The spatial output lies in $F=\operatorname{span}\{c,De_1,De_2\}$ of dimension $k\le3$. An isometric embedding $J:\mathbb R\oplus\mathbb R^k\to\mathbb R\oplus\mathbb R^6$ that fixes the time axis and has spatial image $F$ gives $L=J\widetilde L$ with $\widetilde L:\mathcal L_3\to\mathcal L_{k+1}$ positive. Norm and product normalization are unchanged since $J^*u_7=\sqrt2 e_0$. If $k\ge1$, the reduced target dimension is two, three or four, so its coefficient is $0$, $1/2$ or $1$. Its product with the input coefficient $1/2$ is strictly below one. Theorem 8.8g.20 proves the bound and product-only equality for the reduced map; $J$ takes every reduced normalized Lorentz pure state to a normalized pure state in the original output. If $k=0$, then $L=e_0f^*$ with $f\in\mathcal L_3$, and $\|L\|=\|f\|\le\langle u_3,f\rangle=t/\sqrt2<t$ for a nonzero map. Thus the original pair has radius one and only pure-product maximizers, although $\kappa_3\kappa_7=(1/2)(5/2)=5/4>1$. Pure products supply attainment. This also checks the ray-image case without treating its nonunit output generator as a unit-normalized ray factor.

<a id="theorem-88g23-forced-lorentz-marginal-faces-and-global-cone-rigidity"></a>**Theorem 8.8g.23 (Forced Lorentz Marginal Faces and Global Cone Rigidity).** Fix
$$
V=\mathbb R\oplus\mathbb R^4,\quad
L=\{(x_0,x):x_0\ge\|x\|\},\quad
u=\sqrt2e_0,\quad p_a=(1,a)/\sqrt2\ (a\in S^3),\quad
W=\operatorname{Mat}_5(\mathbb R),\quad U=2E_{00},\quad e(X)=2X_{00}.
\tag{8.8g.23.1}
$$
Identify $a\otimes b$ with $ab^{\mathsf T}$ and use the Frobenius inner product $\langle X,Y\rangle=\operatorname{tr}(X^{\mathsf T}Y)$. Write $K_{\min}=L\otimes_{\min}L$ and $K_{\max}=K_{\min}^*$, using the full dual conventions of (8.8g.17.2). Let $C$ be any closed convex intermediate cone, $K_{\min}\subseteq C\subseteq K_{\max}$. For each $a\in S^3$ its local-pure exposed face and two associated orthogonal projections satisfy
$$
\begin{aligned}
F_a&=C\cap(p_{-a}u^{\mathsf T})^\perp
=\{p_a y^{\mathsf T}:y\in L\},\\
P_aX&=p_ap_a^{\mathsf T}X,\qquad P_aC=F_a\subseteq C,\\
D_a&=P_a+P_{-a},\qquad D_aU=U,\\
C\cap\big(\operatorname{span}\{e_0,(0,a)\}\otimes V\big)
&=D_aC=F_a\oplus F_{-a}.
\end{aligned}
\tag{8.8g.23.2}
$$
The last sum is orthogonal. The corresponding statements hold with the tensor factors exchanged. Every pure product $p_ap_b^{\mathsf T}$ spans an extreme ray of $C$. Every such $C$ is irreducible and nonpolyhedral. Every such $C$ is nonhomogeneous.

*Proof.* The dual product tests identify $K_{\max}$ with the Lorentz-positive maps: $X\in K_{\max}$ exactly when $XL\subseteq L$, and then $X^{\mathsf T}L\subseteq L$ as well. Write $X=\begin{pmatrix}s&h^{\mathsf T}\\v&A\end{pmatrix}$. Positivity and its transpose give $s\ge\|h\|$, $s\ge\|v\|$. Applying $X$ to $(1,\pm x)$ for $\|x\|=1$ and adding the two norm bounds gives $\|Ax\|\le s$. Thus $s=0$ implies $X=0$, and the closed maximal slice $s=1/2$ is bounded and therefore compact. It follows that $e$ is strictly positive on every nonzero intermediate vector and every intermediate cone has a compact normalized base. Pure local vectors span $V$, so their products span $W$; the intermediate cones are proper.

For $X\in F_a$, the positive functional $p_{-a}^{\mathsf T}X$ on $L$ vanishes at the interior point $u$. A positive functional with that property vanishes identically, since every direction admits small positive and negative perturbations of $u$ inside $L$. Therefore $p_{-a}^{\mathsf T}X=0$. For every $y\in L$, the vector $Xy$ lies in $L\cap p_{-a}^\perp=\mathbb R_+p_a$. Since $L$ spans $V$, the range of $X$ is contained in the line of $p_a$; write $X=p_az^{\mathsf T}$. Positivity implies $\langle z,y\rangle\ge0$ on $L$, hence $z\in L$. The converse follows from the minimum-cone inclusion. The map $y\mapsto p_ay^{\mathsf T}$ is an isometry, so $F_a$ is a five-dimensional exposed Lorentz face, self-dual in its own span. Its extreme rays are the pure products with first factor $p_a$; an extreme ray of a face is extreme in $C$.

For arbitrary $X\in C$, maximal positivity gives $X^{\mathsf T}p_a\in L$. Consequently $P_aX=p_a(X^{\mathsf T}p_a)^{\mathsf T}\in F_a$. The projection fixes $F_a$, proving the second line of (8.8g.23.2). Since $p_a,p_{-a}$ are orthonormal and span the indicated local two-plane, $D_a$ is the stated orthogonal projection. It fixes $U$, and a vector of $C$ in its range splits into its two positive projected parts. Conversely both faces lie in that range. This proves the remaining identities. In particular, the positivity used here is derived for the displayed projections.

Suppose $C=C_1\oplus C_2$ were a nontrivial direct sum, with the two spans complementary; orthogonality is unnecessary. Each extreme ray belongs to exactly one summand. The normalized product set
$$
\mathcal P=\{p_ap_b^{\mathsf T}:a,b\in S^3\}
\tag{8.8g.23.3}
$$
is connected. Its intersections with the two closed summands are disjoint closed sets covering it, so connectedness puts all of $\mathcal P$ in one summand. Since $\mathcal P$ spans $W$, the other summand is zero, a contradiction. The continuum of distinct extreme product rays also proves nonpolyhedrality.

If $C$ were homogeneous, it would contradict Theorem 8.8g.7 applied to the homogeneous local Lorentz cone of dimension five. This proves nonhomogeneity without an additional joint-self-duality assumption. ∎

Define the compact normalized unit-positive set
$$
\mathcal Q=\{q\in K_{\max}:e(q)=\|q\|_F=1\}.
\tag{8.8g.23.4}
$$
Every $q=\tfrac12\begin{pmatrix}1&b^{\mathsf T}\\a&T\end{pmatrix}\in\mathcal Q$ has $\|a\|,\|b\|\le1$, $\|T\|_{\rm op}\le1$ and $\|T\|_F^2=3-\|a\|^2-\|b\|^2$. The marginal bounds follow from positivity of the map and its transpose. Applying $2q$ to $(1,\pm x)$ and adding the two spatial norm inequalities gives $\|Tx\|\le1$ for unit $x$, proving the contraction bound. The remaining identity is the Frobenius norm equation. If $C=C^*$ is all-pure, its actual normalized pure set is the compact set $C\cap\mathcal Q$ and generates its compact normalized base; every pure product belongs to it.

<a id="theorem-88g24-exact-finite-polynomial-hierarchy-for-all-pure-completion"></a>**Theorem 8.8g.24 (Exact Finite Polynomial Hierarchy for All-Pure Completion).** Retain $W,U,e,\mathcal P$ and $\mathcal Q$ from Theorem 8.8g.23 and its following unit-positive definition. For any finite list of rational matrices $X_1,\ldots,X_k$ with $\|X_i\|_F\le1$, define the following finite polynomial system $\mathfrak F(X_1,\ldots,X_k)$. For each index $\alpha=(i,\sigma,j)$, with $1\le i\le k$, $\sigma\in\{+,-\}$ and $1\le j\le25$, introduce
$$
Z_\alpha=\begin{pmatrix}1/2&h_\alpha^{\mathsf T}\\v_\alpha&A_\alpha\end{pmatrix},\qquad
\lambda_\alpha\in\mathbb R,\quad w_\alpha\in\mathbb R,\qquad
J=\operatorname{diag}(1,-I_4),\quad
H_\alpha=Z_\alpha^{\mathsf T}JZ_\alpha-\lambda_\alpha J.
\tag{8.8g.24.1}
$$
Impose, for every $\alpha$,
$$
\begin{gathered}
\|h_\alpha\|^2\le\frac14,\qquad 0\le\lambda_\alpha\le\frac14,\qquad
\|h_\alpha\|^2+\|v_\alpha\|^2+\|A_\alpha\|_F^2=\frac34,\qquad w_\alpha\ge0,\\
\det H_\alpha[I,I]\ge0\quad
(\varnothing\ne I\subseteq\{0,1,2,3,4\}).
\end{gathered}
\tag{8.8g.24.2}
$$
There are all $31$ nonempty principal minors in the last condition. Define the positive and negative parts and impose
$$
\begin{aligned}
P_i&=\sum_{j=1}^{25}w_{i,+,j}Z_{i,+,j},&
N_i&=\sum_{j=1}^{25}w_{i,-,j}Z_{i,-,j},\\
X_i&=P_i-N_i,&\langle P_i,N_i\rangle&=0,\\
\sum_{j=1}^{25}w_{i,\sigma,j}&\le2\quad(\sigma=+,-),&
\langle Z_\alpha,Z_\beta\rangle&\ge0\quad(\alpha\ne\beta).
\end{aligned}
\tag{8.8g.24.3}
$$
The final inequalities include all cross-test and cross-sign pairs. Then the following are equivalent:

1. There exists $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ whose every normalized extreme point has norm one
2. Every finite rational unit-ball list has feasible $\mathfrak F$
3. For one fixed countable dense rational sequence $(X_i)$ in the unit ball, every prefix system $\mathfrak F(X_1,\ldots,X_k)$ is feasible

Each finite feasible set is compact; its defining system has rational coefficients, $1300k$ scalar variables, $76k$ scalar equations and $1752k+\binom{50k}{2}$ weak inequalities in the displayed encoding. Its maximum polynomial degree is ten. Consequently failure of all-pure completion is equivalent to exact infeasibility of at least one such finite rational system.

*Proof.* First we verify the lifted description of $\mathcal Q$. For $Z=\begin{pmatrix}1/2&h^{\mathsf T}\\v&A\end{pmatrix}$, Lorentz positivity is equivalent to
$$
\|h\|^2\le\frac14,\qquad
Z^{\mathsf T}JZ-\lambda J\succeq0\quad\text{for some }0\le\lambda\le\frac14.
\tag{8.8g.24.4}
$$
Indeed, positivity gives the first-row inequality. The quadratic $q(x)=x^{\mathsf T}Jx$ obeys $q(x)\ge0\Rightarrow q(Zx)\ge0$: the set $\{q\ge0\}$ is the union of the future and past Lorentz cones, and the quadratic is even. The real S-lemma applies because $q(e_0)=1>0$, and gives a nonnegative $\lambda$ with $Z^{\mathsf T}JZ-\lambda J\succeq0$. Its time-time entry is $1/4-\|v\|^2-\lambda$, so every such witness satisfies $\lambda\le1/4$. Conversely the positive-semidefinite inequality gives $q(Zx)\ge\lambda q(x)\ge0$ on the future cone, and the separate row inequality gives a nonnegative output time coordinate. Together they put $Zx$ on the future sheet. This is the standard Lorentz S-lemma formulation also given by Hildebrand (2005, Section 2, Lemma 1), with the displayed sign convention for $J$.

The full matrix tested in (8.8g.24.4) is
$$
H(Z,\lambda)=
\begin{pmatrix}
1/4-v^{\mathsf T}v-\lambda&(1/2)h^{\mathsf T}-v^{\mathsf T}A\\
(1/2)h-A^{\mathsf T}v&hh^{\mathsf T}-A^{\mathsf T}A+\lambda I_4
\end{pmatrix}.
\tag{8.8g.24.5}
$$
A real symmetric matrix is positive semidefinite exactly when all its principal minors are nonnegative. Thus (8.8g.24.2) says precisely $Z_\alpha\in\mathcal Q$ together with a bounded auxiliary witness and a nonnegative weight. A minor of order $m$ has degree at most $2m$, so the maximum is ten. Each generator has twenty-four free matrix coordinates, one $\lambda$ and one weight; there are $50k$ generators. The norm equations contribute $50k$, reconstruction contributes $25k$ and orthogonality contributes $k$ equations. Each generator has one row inequality, two multiplier bounds, thirty-one minor inequalities and one weight inequality, giving $1750k$ inequalities; the $2k$ budgets and the unordered pair inequalities give the stated total. Reconstruction has degree at most two, orthogonality at most four and generator pairings at most two. The norm equation bounds every generator coordinate, and each weight belongs to $[0,2]$ by its budget. All constraints are closed, proving compactness of the full finite feasible set. For a pure product $Z=p_ap_b^{\mathsf T}$, $Z^{\mathsf T}JZ=0$, so $\lambda=0$ supplies its admissible witness.

We record the exact sphere-generation fact used in both directions. For compact $T\subseteq\mathcal Q$, every $t\in T$ exposes itself in $\operatorname{conv}T$, since $\langle t,x\rangle\le1$ throughout that convex hull with equality only at $x=t$. Conversely every extreme point of $\operatorname{conv}T$ belongs to $T$: a finite convex representation by members of $T$ and extremality force every positive-weight member to equal the point. Therefore
$$
\operatorname{ext}(\operatorname{conv}T)=T,\qquad
\operatorname{cone}T=\{rb:r\ge0,\ b\in\operatorname{conv}T\}
\text{ is closed}.
\tag{8.8g.24.6}
$$
For closedness, the normalizations of a convergent sequence $r_nb_n$ give convergence of $r_n$, and compactness of the convex hull gives a convergent subsequence of $b_n$. Conversely, an all-pure intermediate has compact pure set $B_C\cap\{\|X\|=1\}$, generates its base by that set, and contains $\mathcal P$ among those pure points.

Suppose now that $C$ in assertion 1 exists. Let $P_i$ be the Euclidean nearest point to $X_i$ in the closed convex cone $C$. Existence follows from compactness of a sufficiently large bounded sublevel set of the squared distance, and uniqueness from its strict convexity. Projection optimality gives $\langle X_i-P_i,c-P_i\rangle\le0$ for $c\in C$. Taking $c=0,2P_i$ and then arbitrary $c$ yields
$$
\langle X_i-P_i,P_i\rangle=0,\qquad
N_i=P_i-X_i\in C^*=C,\qquad
\|P_i\|^2+\|N_i\|^2=\|X_i\|^2\le1.
\tag{8.8g.24.7}
$$
This is the orthogonal cone decomposition of Moreau (1965, Section 1.a and Proposition 4.a). Since $\|U\|=2$, both $e(P_i)$ and $e(N_i)$ lie in $[0,2]$. Each nonzero part, divided by its normalization, belongs to the twenty-four-dimensional affine base. Carathéodory's theorem expresses it as a convex combination of at most twenty-five pure points. Multiplying the convex coefficients by its normalization gives the weights in (8.8g.24.3), with the required budget. Every chosen generator lies in $\mathcal Q$ and all generators pair nonnegatively by self-duality, including those used for different tests. Zero parts have all weights zero; fill unused slots with any fixed pure product, preserving all pairings. Thus 1 implies 2, and 2 implies 3.

Assume 3. Choose a solution at every prefix level. Each finite block of coordinates attached to a fixed test index belongs to a common compact space. Extract convergent subsequences successively for indices $1,2,\ldots$, and take a diagonal subsequence. Every block then has a limit. All constraints involving finitely many indices are present eventually and pass to the limit, including every cross-test pairing. Let $T$ be the closure of $\mathcal P$ together with all limiting generators. The set $\mathcal Q$ is compact, so $T\subseteq\mathcal Q$ is compact. The limiting generators are mutually acute; each pairs nonnegatively with every product because it lies in $K_{\max}$; and products are mutually acute by local self-duality. Continuity makes $T$ acute.

Set $C=\operatorname{cone}T$. Equation (8.8g.24.6) makes it closed and all-pure, product inclusion makes it generating, and $C\subseteq K_{\max}$ makes it pointed. Acuteness gives $C\subseteq C^*$. For each $X_i$ the limiting identities retain $X_i=P_i-N_i$, $P_i,N_i\in C$ and $\langle P_i,N_i\rangle=0$, so both parts have norm at most one. For any $X$ in the unit ball, choose $X_{i_\ell}\to X$; boundedness of the parts gives a common convergent subsequence and then
$$
X=P-N,\qquad P,N\in C,\qquad\langle P,N\rangle=0.
\tag{8.8g.24.8}
$$
If also $X\in C^*$, then $0\le\langle X,N\rangle=-\|N\|^2$, so $N=0$ and $X=P\in C$. Positive rescaling handles every vector of $C^*$, proving $C=C^*$ and hence 1.

Each finite system is an existential formula over the real numbers with rational coefficients, so exact real quantifier elimination can decide its feasibility. Negating assertion 3 yields a finite infeasible prefix whenever the desired cone does not exist. This supplies an exact finite-certificate route; the equivalence specifies neither a required prefix length nor a certificate-degree or computation bound. Finite numerical feasibility and solver failure have no role in either implication. ∎

<a id="lemma-88g25-exact-product-null-light-coordinates"></a>**Lemma 8.8g.25 (Exact Product-Null Light Coordinates).** Choose orthonormal local light vectors $\ell_\pm=(e_0\pm e_1)/\sqrt2$, retaining the three transverse axes. For $p=E_{++}$ and any $q\in\mathcal Q\cap p^\perp$, its matrix in these light coordinates has the form
$$
q=\begin{pmatrix}0&\lambda&0\\ \mu&\nu&v^{\mathsf T}\\0&w&B_q\end{pmatrix},
\qquad \lambda,\mu,\nu\ge0,\quad \lambda+\mu+\nu=1.
\tag{8.8g.25.1}
$$
In the original time/spatial representation write $x=a_1$ and $y=b_1$. Then
$$
\lambda=\frac{1+x}{2},\quad \mu=\frac{1+y}{2},\quad
\nu=-\frac{x+y}{2},\quad
v=\frac{b_\perp}{\sqrt2},\quad w=\frac{a_\perp}{\sqrt2},\quad
B_q=\frac{T_{\perp,\perp}}2,
\tag{8.8g.25.2}
$$
and
$$
\|B_q\|_F^2=\frac12+\nu-\frac{\|a\|^2+\|b\|^2}{2}-\frac{xy}{2}.
\tag{8.8g.25.3}
$$

*Proof.* Product positivity gives $q\ell_+,(q^{\mathsf T})\ell_+\in L$. Their zero pairing with $\ell_+$ puts both vectors on its opposite Lorentz ray. This gives the two zero transverse strips and zero corner in (8.8g.25.1). Testing the remaining axial entries with $\ell_\pm$ gives their nonnegativity. In light coordinates $U$ has all four entries of its axial two-by-two block equal to one, so normalization gives their displayed sum. Direct orthogonal change of basis gives (8.8g.25.2): the zero corner says $T_{11}=-1-x-y$, while the zero strips give $T_{1,\perp}=-b_\perp^{\mathsf T}$ and $T_{\perp,1}=-a_\perp$. Finally substitute those identities into
$$
\lambda^2+\mu^2+\nu^2+\|v\|^2+\|w\|^2+\|B_q\|_F^2=1.
$$
This proves (8.8g.25.3). The proof applies after exchanging one factor's light directions as well. ∎

<a id="lemma-88g26-asymmetric-marginal-bound-for-unit-positive-states"></a>**Lemma 8.8g.26 (Asymmetric Marginal Bound for Unit-Positive States).** In the fixed Lorentz-five carrier let
$$
q=\frac12\begin{pmatrix}1&b^{\mathsf T}\\a&T\end{pmatrix}\in\mathcal Q,
\qquad A=\|a\|,\quad B=\|b\|.
\tag{8.8g.26.1}
$$
If $0\le A\le1/3$, then
$$
B\le1-\sqrt{\frac{(1-A)(1-3A)}2}.
\tag{8.8g.26.2}
$$
The transposed assertion exchanges the two marginals. In particular, if either marginal norm is at most $1/100$, the other is strictly less than $31/100$.

*Proof.* Lorentz positivity gives $A,B\le1$ and $\|T\|_{\mathrm{op}}\le1$, while unit norm gives $\|T\|_F^2=3-A^2-B^2$. Apply the Lorentz S-lemma (8.8g.24.4) to $N=2q$, rescaling its multiplier by four. Some $\lambda\ge0$ satisfies
$$
\begin{pmatrix}
s&b^{\mathsf T}-a^{\mathsf T}T\\
b-T^{\mathsf T}a&bb^{\mathsf T}-T^{\mathsf T}T+\lambda I_4
\end{pmatrix}\succeq0,
\qquad s=1-A^2-\lambda\ge0.
\tag{8.8g.26.3}
$$
If $s=0$, positive semidefiniteness forces the off-diagonal block to vanish. Thus $b=T^{\mathsf T}a$ and $B\le A$. The right side of (8.8g.26.2) is at least $A$ on $[0,1/3]$, because
$$
(1-A)^2\ge\frac{(1-A)(1-3A)}2.
$$
This also handles $B\le A$ when $s>0$.

Suppose $s>0$ and $B>A$. The Schur complement, trace, and reverse triangle inequality give
$$
\begin{aligned}
3-A^2-B^2
&\le B^2+4\lambda-\frac{\|b-T^{\mathsf T}a\|^2}{s}\\
&\le B^2+4\lambda-\frac{(B-A)^2}{s},
\end{aligned}
\qquad
4s+\frac{(B-A)^2}{s}\le1-3A^2+2B^2.
\tag{8.8g.26.4}
$$
The second line uses $\|T^{\mathsf T}a\|\le A$. The arithmetic-geometric mean inequality bounds the left side of the last inequality below by $4(B-A)$. Rearranging yields
$$
(1-B)^2\ge\frac{(1-A)(1-3A)}2.
$$
Both $1-B$ and the square root are nonnegative, so (8.8g.26.2) follows. Transposition preserves $\mathcal Q$ and exchanges the marginals. Finally, $(1-A)(1-3A)/2$ decreases on $[0,1/100]$, and
$$
\frac{(1-1/100)(1-3/100)}2-(1-31/100)^2
=\frac{81}{20000}>0.
\tag{8.8g.26.5}
$$
Taking square roots proves the strict rational cap. ∎

<a id="lemma-88g27-controlled-transverse-annihilator-ball"></a>**Lemma 8.8g.27 (Controlled Transverse Annihilator Ball).** Let $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ be an all-pure intermediate on the fixed Lorentz-five carrier, with actual entangled normalized pure set $E$; write $E_p=E\cap p^\perp$. Suppose
$$
\|a_q\|+\|b_q\|\le d\quad(q\in E),\qquad0\le d<2.
\tag{8.8g.27.1}
$$
For any pure product $p$, choose orthonormal light coordinates with $p=E_{++}$. Every matrix $Z$ supported only on the transverse three-by-three block satisfies
$$
\|Z\|_F\le k_d:=\frac{2-d}{2\sqrt2}
\quad\Longrightarrow\quad
U-p+Z\in C\cap p^\perp.
\tag{8.8g.27.2}
$$
This is a nine-dimensional transverse ball, including its boundary; no eighteen-dimensional ball or positivity of a face projection is asserted.

*Proof.* Let $\rho$ select the transverse block. For $q\in E$ put $s=(a_q)_1+(b_q)_1$ and $c=(T_q)_{11}$ in the original time/spatial coordinates adapted to $p$. Then $s\le d$, $|c|\le1$, and
$$
\langle p,q\rangle=\frac{1+s+c}{4},\qquad
\|\rho(q)\|_F\le\frac{\sqrt{3-c^2}}2.
\tag{8.8g.27.3}
$$
Indeed $\rho(q)=(T_q)_{\perp,\perp}/2$ and $\|T_q\|_F^2\le3$. The denominator below is positive, and
$$
\frac{\|\rho(q)\|_F}{1-\langle p,q\rangle}
\le\frac{2\sqrt{3-c^2}}{3-d-c}
\le\frac{2\sqrt2}{2-d}=k_d^{-1}.
\tag{8.8g.27.4}
$$
For the last inequality, differentiation gives
$$
\frac{d}{dc}\left(\frac{2\sqrt{3-c^2}}{3-d-c}\right)
=\frac{2[3-(3-d)c]}{\sqrt{3-c^2}(3-d-c)^2}\ge0
\qquad(-1\le c\le1),
$$
so the maximum occurs at $c=1$.

For a pure product $q$, let $A,B\in[0,1]$ denote its local plus coefficients in these light bases. Then
$$
\langle p,q\rangle=AB,\qquad
\|\rho(q)\|_F=2\sqrt{AB(1-A)(1-B)}\le1-AB.
\tag{8.8g.27.5}
$$
To prove the inequality put $x=\sqrt{AB}$. The arithmetic-geometric mean inequality gives $(1-A)(1-B)\le(1-x)^2$, and $2x(1-x)\le(1+x)(1-x)$. Because $k_d\le1/\sqrt2<1$, this product bound is compatible with the constant in (8.8g.27.4).

Every actual normalized pure state $q$ satisfies $\langle U-p,q\rangle=1-\langle p,q\rangle$. If $Z$ is transverse with norm at most $k_d$, equations (8.8g.27.4)–(8.8g.27.5) and Cauchy--Schwarz imply
$$
\langle U-p+Z,q\rangle
\ge1-\langle p,q\rangle-\|Z\|_F\,\|\rho(q)\|_F\ge0.
\tag{8.8g.27.6}
$$
The actual pure set generates $C$, so self-duality puts $U-p+Z$ in $C$. It annihilates $p$, proving the claim. ∎

<a id="theorem-88g28-one-entangled-pure-state-with-two-nonzero-marginal-bounds"></a>**Theorem 8.8g.28 (One Entangled Pure State with Two Nonzero Marginal Bounds).** Every all-pure self-dual intermediate on the fixed Lorentz-five carrier has an actual entangled normalized pure state $q$ for which both inequalities hold simultaneously:
$$
\|a_q\|>\frac1{100},\qquad\|b_q\|>\frac1{100}.
\tag{8.8g.28.1}
$$
Thus the entangled pure set cannot be covered by the two families in which one or the other marginal norm is at most $1/100$. No size or regularity restriction on those families is assumed.

*Proof.* Suppose instead that every actual entangled pure state has at least one marginal norm at most $a=1/100$. Lemma 8.8g.26 bounds the other marginal strictly below $b=31/100$; weak inequalities suffice below. Put
$$
a=\frac1{100},\qquad b=\frac{31}{100},\qquad
 d=a+b=\frac8{25},\qquad h=\frac d2=\frac4{25}.
\tag{8.8g.28.2}
$$
Every entangled pure state has marginal-norm sum at most $d$, maximum at most $b$, and sum of squared marginal norms at most $a^2+b^2$. Lemma 8.8g.27 supplies its nonzero transverse ball in $F_p$ at every product. At any product $p'$, choose a nonzero transverse perturbation in that ball and decompose the resulting point of $F_{p'}$ into actual normalized pure states. Every summand annihilates $p'$, because their pairings with $p'$ are nonnegative. A product annihilating $p'$ has zero transverse block: one local factor is on the opposite Lorentz ray. Hence at least one actual entangled summand $z$ has $B_z\ne0$. This supplies the state needed below directly from the ball, without a separate fiber-spanning premise.

Choose a product $p'$ and an actual $z\in E_{p'}$ with nonzero transverse block $B_z$. One of $z$'s marginals is at most $a$. If its output marginal is small, choose the output-adjacent product $p$; if its input marginal is small, exchange the two factor labels in the following proof. This chooses the argument's direction from the actual state and assumes no exchange symmetry of $C$.

In the output-small case use common light coordinates with $p=E_{++}$ and $p'=E_{-+}$. States $q\in E_p$ and the chosen $z$ have the patterns
$$
q=\begin{pmatrix}0&\lambda&0\\\mu&\nu&v^{\mathsf T}\\0&w&B_q\end{pmatrix},\qquad
z=\begin{pmatrix}\mu'&\nu'&v'^{\mathsf T}\\0&\lambda'&0\\0&w'&B_z\end{pmatrix}.
\tag{8.8g.28.3}
$$
The exact marginal formulas (8.8g.25.2), with the output light directions exchanged for $z$, give
$$
\begin{gathered}
0\le\nu,\nu'\le h,\qquad\lambda+\mu=1-\nu\ge1-h,\\
\|w\|\le b/\sqrt2,\qquad\|w'\|\le a/\sqrt2,\qquad
\lambda'\le(1+a)/2,\\
\|B_z\|_F^2\ge\frac{1-a^2-b^2}{2}.
\end{gathered}
\tag{8.8g.28.4}
$$
For the last bound use the exact transverse identity (8.8g.25.3). If $x+y=-2\nu'$ are $z$'s axial marginal components, then $xy\le\nu'^2$ and $0\le\nu'\le h<1$, so $\nu'-xy/2\ge0$. Its two marginal squared norms sum to at most $a^2+b^2$.

The common-coordinate pairing retains all noncentral terms:
$$
\langle q,z\rangle
=\lambda\nu'+\nu\lambda'+w\cdot w'+\langle B_q,B_z\rangle_F\ge0.
\tag{8.8g.28.5}
$$
Set $X=U-p+Z$, where $Z$ is transverse with block $-k_dB_z/\|B_z\|_F$. Lemma 8.8g.27 puts $X$ in $F_p$. Decompose it into finitely many actual normalized pure states and let $\beta_j$ be the coefficients of the entangled summands $q_j$. Every summand annihilates $p$, and product summands have zero transverse block. With $M=\sum_j\beta_j$, the transverse and axial coordinates imply
$$
\sum_j\beta_jB_{q_j}=-k_d\frac{B_z}{\|B_z\|_F},\qquad
\sum_j\beta_j\lambda_j\le1,\qquad M\le\frac2{1-h}.
\tag{8.8g.28.6}
$$
The second inequality uses $X_{+-}=1$ and nonnegative product axial entries. Summing the two adjacent axial entries, which both equal one, and using $\lambda_j+\mu_j\ge1-h$ proves the last budget.

Sum (8.8g.28.5) with coefficients $\beta_j$. Equations (8.8g.28.4)–(8.8g.28.6) yield
$$
\begin{aligned}
k_d\|B_z\|_F
&\le\nu'\sum_j\beta_j\lambda_j
+\lambda'\sum_j\beta_j\nu_j
+\left(\sum_j\beta_jw_j\right)\cdot w'\\
&\le h+\frac M2[(1+a)h+ab]
\le h+\frac{(1+a)h+ab}{1-h}
=\frac{997}{2800}.
\end{aligned}
\tag{8.8g.28.7}
$$
On the other hand, the transverse norm bound gives the exact lower squared value
$$
k_d^2\|B_z\|_F^2\ge
\frac{(2-a-b)^2(1-a^2-b^2)}{16}
=\frac{1992879}{12500000},\qquad
\frac{1992879}{12500000}-\left(\frac{997}{2800}\right)^2
=\frac{159952943}{4900000000}>0.
\tag{8.8g.28.8}
$$
This contradicts (8.8g.28.7). Hence some actual entangled pure state has neither marginal at most $1/100$, proving the simultaneous strict inequalities. ∎

<a id="definition-88g29-ordered-cone-carrier-tests"></a>**Definition 8.8g.29 (Ordered-Cone Carrier Tests).** For the following results, a proper cone $K\subset V$ is a closed, pointed, generating convex cone in a finite-dimensional real vector space. A normalized state has value one under a specified strictly positive normalization functional; effects range over the full dual interval. The operational capacity is the largest cardinality of a perfectly distinguishable normalized state family. Irreducibility means absence of a nontrivial direct-sum decomposition of ordered cones. These notions extend Jordan rank and simplicity in Theorem 8.8g.2. For an interior order unit $u\in K$, the ordered correspondence is a real-linear map
$$
\psi:V\longrightarrow\mathfrak g_u,
\qquad
\mathfrak g_u:=\operatorname{Lie}\bigl(\operatorname{Aut}(K)_u\bigr),
$$
with stationarity $\psi_a(a)=0$, coverage $\operatorname{im}\psi=\mathfrak g_u$ and nondegeneracy $\ker\psi=\mathbb Ru$. The codomain is the full unit-stabilizer Lie algebra. On a reconstructed Euclidean Jordan carrier this is Definition G.1.8b. Intrinsic self-duality means existence of a positive-definite self-dualizing pairing; intrinsic homogeneity means transitivity of the full cone-automorphism group. A specified predictive pairing and admitted steering group retain their separate predicates in Definition G.1.8a.

<a id="theorem-88g30-nonagon-carrier-with-sharp-self-duality-and-full-correspondence"></a>**Theorem 8.8g.30 (Nonagon Carrier with Sharp Self-Duality and Full Correspondence).** There is an irreducible nine-dimensional proper cone with sharp verification of every pure state, a full stationary, covering, nondegenerate ordered correspondence and an exact central $U(1)$ lift, whose cone is intrinsically nonhomogeneous. It also has an irreducible locally tomographic minimal self-composite with multiplicative capacity and dimension.

*Proof.* In $\mathbb R^3$ take the orthonormal vectors
$$
e=\frac{(1,1,1)}{\sqrt3},\qquad v=\frac{(2,-1,-1)}{\sqrt6},\qquad w=\frac{(0,1,-1)}{\sqrt2},
$$
and define
$$
r=\frac1{\sqrt{\cos(\pi/9)}},\qquad
q_j=e+r\left(\cos\frac{2\pi j}{9}\,v+\sin\frac{2\pi j}{9}\,w\right),
\quad 0\le j<9,
$$
$$
Q=\operatorname{cone}\{q_0,\ldots,q_8\},\qquad
K=\{X\in\operatorname{Herm}_3(\mathbb C):\lambda(X)\in Q\}.
$$
The section $e\cdot q=1$ is a regular nonagon, and
$$
q_j\cdot q_k=1+\frac{\cos(2\pi(j-k)/9)}{\cos(\pi/9)}\ge0,
$$
with equality exactly for $j-k\equiv4,5\pmod9$. The facet through $q_j,q_{j+1}$ has inward normal $q_{j+5}$, so $Q=Q^*$. Coordinate transposition reverses the angular coordinate and cyclic coordinate permutation rotates it by $2\pi/3$ up to orientation. Thus $Q$ is permutation-invariant and the eigenvalue definition is unambiguous.

If $X,Y\in K$, diagonalization writes $\operatorname{tr}(XY)=\lambda(X)^{\mathsf T}M\lambda(Y)$ for a doubly stochastic matrix $M$ of squared unitary entries. A convex decomposition of $M$ into permutation matrices makes every summand nonnegative. Conversely, testing a matrix $X\in K^*$ against matrices with every eigenvalue vector in $Q$ in the eigenbasis of $X$ gives $\lambda(X)\in Q^*=Q$. Hence $K=K^*$ under the trace pairing. This proves closedness and convexity; $I$ is interior by continuity of eigenvalues, and $X,-X\in K$ would give $-\operatorname{tr}(X^2)\ge0$, proving pointedness.

Put
$$
\Omega=\{X\in K:\operatorname{tr}X=1\},\qquad
c=\frac{1+\sec(\pi/9)}3.
$$
The trace-one eigenvalue section is the convex hull of $q_j/\sqrt3$. Each vertex has squared norm $c$, so $\operatorname{tr}(\rho^2)\le c$ on $\Omega$, with equality exactly at a vertex spectrum. Such a matrix $\rho$ is uniquely exposed by $X\mapsto\operatorname{tr}(\rho X)$: Cauchy--Schwarz bounds its value by $c$, and equality forces $X=\rho$. A nonvertex spectrum decomposes in its eigenbasis. The complete pure-state set is therefore
$$
\{U\operatorname{diag}(q_j/\sqrt3)U^*:U\in U(3),\ 0\le j<9\}.
$$
The vertex permutation orbits are $\{0,3,6\}$ and $\{1,2,4,5,7,8\}$. The first has a repeated eigenvalue and yields $\mathbb{CP}^2$ of real dimension four; the second has distinct eigenvalues and yields $U(3)/U(1)^3$ of dimension six. These disjoint compact sets are exactly the two connected components.

The first component consists of
$$
\rho_P=aI+bP,\qquad a=\frac13-\frac r{\sqrt{18}},\qquad b=\frac r{\sqrt2}>0,
$$
where $P$ is rank one. Its average is $I/3$, and differences of rank-one projections span the traceless matrices, so this connected component spans the entire carrier. In a direct-sum cone, every extreme ray lies in one summand; a positive summand-normalization ratio takes the values zero and one and is continuous on normalized rays. A connected spanning family cannot be contained in a proper summand, proving irreducibility. If $K$ were homogeneous, Koecher--Vinberg would make it an irreducible symmetric cone. The simple Jordan cones have connected projective extreme-ray spaces, contradicting the two components above. Thus $K$ is intrinsically nonhomogeneous.

Register
$$
B(X,Y)=\frac{\operatorname{tr}(XY)}c,\qquad u=cI.
$$
Then $B(u,\rho)=\operatorname{tr}\rho$. For pure $\rho$ and every $\sigma\in\Omega$, self-duality and the norm bound give $0\le B(\rho,\sigma)\le1$, with equality at one exactly when $\sigma=\rho$. Consequently $u-\rho\in K$ and the state vector itself is its sharp verification effect.

To identify the full group $G=\operatorname{Aut}(K)_u$, use the order-unit norm. Every member of $G$ is an isometry, so $G$ is compact. Haar-averaging trace over $G$ gives a $G$-invariant functional. It is invariant under all unitary conjugations, hence proportional to trace; evaluation at the fixed matrix $I$ fixes the proportionality to one. Thus $G$ preserves trace. Average the trace inner product over $G$ as well. On the traceless subspace, this invariant form is a scalar multiple of the trace form: multiplication by $i$ identifies the conjugation representation with the adjoint representation of the simple real Lie algebra $\mathfrak{su}(3)$, and eigenspaces of the positive operator comparing the forms are invariant ideals. The scalar line and the traceless subspace are orthogonal by unitary invariance. Since $G$ fixes $I$ and preserves trace, every element preserves the trace inner product.

A member of $G$ preserves the four-dimensional pure-state component, as its dimension differs from the other component. The formula for $\rho_P$ therefore makes it preserve rank-one projections and their transition probabilities. Wigner's theorem gives exactly
$$
T(X)=UXU^*\quad\hbox{or}\quad T(X)=UX^{\mathsf T}U^*.
$$
Both preserve $K$, so $G^\circ\cong PU(3)$ and
$$
\mathfrak g_u=\{X\mapsto i[a,X]:a\in\operatorname{Herm}_3(\mathbb C)\}.
$$
The map $\psi_a(X)=i[a,X]$ has $\psi_a(a)=0$, covers this entire Lie algebra and has kernel $\mathbb RI=\mathbb Ru$. The lift $U(3)\to PU(3)$ has precisely the central scalar kernel $U(1)$. This lift describes the reversible action on the spectral cone. The auxiliary Jordan product $X\diamond Y=(XY+YX)/(2c)$ has unit $u=cI$ and the same derivation algebra. Its squares cone is $\operatorname{PSD}_3$, whereas the state cone is the nonagon spectral cone $K$; the ordered-correspondence extension keeps those two structures distinct.

For composition take $K\otimes_{\min}K$, the cone generated by positive product states, with all dual effects and normalization $\operatorname{tr}\otimes\operatorname{tr}$. Its compact normalized base makes it closed; tensor products of spanning local states make it generating, and its trace norm bound makes it pointed. Positive product effects span its dual vector space, so the canonical product-effect map is an isomorphism. The local order inequality $cI-\rho\in K$ gives, for a perfectly distinguishing measurement $(f_i)$,
$$
m=\sum_i f_i(\rho_i)\le\sum_i f_i(cI)=3c<3.
$$
Two states from the rays $q_j,q_{j+4}$ are distinguished by the sharp binary effect because their pairing vanishes. The capacity is two. Similarly,
$$
c^2I\otimes I-\rho\otimes\sigma
=(cI-\rho)\otimes cI+\rho\otimes(cI-\sigma)
\in K\otimes_{\min}K.
$$
Convexity extends this to every normalized composite state. Thus its capacity is at most $(3c)^2<5$, while four product states attain four. The strict inequality follows from $\cos(\pi/9)>\cos(\pi/6)=\sqrt3/2$ and $(1+2/\sqrt3)^2<5$. The dimension is $81=9^2$. Products of states in the $\mathbb{CP}^2$ component are exposed by products of their sharp effects: a response of one forces both factors to equal the nominated states in each term of a separable mixture. They form a connected spanning extreme family, proving composite irreducibility. ∎

The local nonagon carrier separates homogeneity from sharp self-duality and the full ordered correspondence. Its minimal composite proves the stated capacity and tomography extension; self-duality and a full correspondence on that composite are additional properties of a composite rule.

<a id="theorem-88g31-homogeneous-ordered-correspondence-selects-the-complex-cone"></a>**Theorem 8.8g.31 (Homogeneous Ordered Correspondence Selects the Complex Cone).** Let $K\subset V$ be a nonzero proper finite-dimensional cone, let $u\in\operatorname{int}K$, and put
$$
G=\operatorname{Aut}(K)^\circ,\quad H=G_u,\quad
\mathfrak g=\operatorname{Lie}G,\quad\mathfrak h=\operatorname{Lie}H.
$$
Suppose $G$ is transitive on $\operatorname{int}K$ and a real-linear $\psi:V\to\mathfrak h$ satisfies
$$
\psi_a(a)=0,\qquad\operatorname{im}\psi=\mathfrak h,\qquad\ker\psi=\mathbb Ru.
$$
Then $\operatorname{rad}\mathfrak g=\mathbb RI_V$, the cone is self-dual under a positive-definite inner product, and its reconstructed Jordan algebra with unit $u$ is $H_n(\mathbb C)$ for some $n\ge1$.

*Proof.* The order-unit norm makes $H$ compact. Average an inner product over $H$, and put $W=u^\perp$. The representation of $\mathfrak h$ on $W$ is faithful and skew-symmetric, and $\psi|_W:W\to\mathfrak h$ is a vector-space isomorphism. Polarizing stationarity gives $\psi_x(y)=-\psi_y(x)$. Thus
$$
T(x,y,z)=\langle\psi_x(y),z\rangle\qquad(x,y,z\in W)
$$
is an alternating three-form whose contractions belong to $\mathfrak h$.

Decompose $W=\bigoplus_iW_i$ orthogonally into irreducible $\mathfrak h$-modules. For $x\in W_i,y\in W_j$ with $i\ne j$, $\psi_x(y)$ lies in $W_j$ and equals $-\psi_y(x)\in W_i$, so both vanish. Hence $\mathfrak h_i:=\psi(W_i)$ acts only on $W_i$, and
$$
\mathfrak h=\bigoplus_i\mathfrak h_i,\qquad\dim\mathfrak h_i=\dim W_i.
$$
Each summand is an ideal: commutators on distinct blocks vanish, and those on one block remain in $\mathfrak h$ on that block. Each representation is faithful and irreducible. A trivial $W_i$ would make $\psi(W_i)$ vanish on all of $V$, contradicting injectivity. The restricted three-form is nonzero. Nagy's skew-prolongation theorem (2013, Theorem 1.1) states that a proper irreducible faithful orthogonal subalgebra with such a nonzero contraction form is the adjoint representation of a compact simple Lie algebra. In the remaining full-orthogonal case, $\mathfrak h_i=\mathfrak{so}(W_i)$ and the dimension identity gives $d_i(d_i-1)/2=d_i$, hence $d_i=3$; this is the adjoint representation of $\mathfrak{so}(3)$ as well. Therefore
$$
V\cong\mathbb Ru\oplus\bigoplus_i\operatorname{ad}(\mathfrak h_i),
\qquad V^{\mathfrak h}=\mathbb Ru.
$$
The summands are pairwise inequivalent as representations of the full direct-sum algebra, even when their simple ideals are abstractly isomorphic, because their kernels differ. The case $W=0$ is the one-dimensional ray, for which all conclusions hold directly.

Homogeneity makes evaluation $\mathfrak g\to V$, $X\mapsto Xu$, surjective with kernel $\mathfrak h$. Let $\mathfrak r=\operatorname{rad}\mathfrak g$. Its intersection with the semisimple algebra $\mathfrak h$ is a solvable ideal and therefore zero. Evaluation embeds $\mathfrak r$ as an $\mathfrak h$-module into $V$. Positive scalar dilations give $I_V\in\mathfrak r$, so multiplicity-freeness yields
$$
\mathfrak r=\mathbb RI_V\oplus\bigoplus_{j\in J}R_j,
\qquad R_j\cong\operatorname{ad}(\mathfrak h_j),
$$
with evaluation mapping $R_j$ isomorphically onto $W_j$. Trace vanishes on the nontrivial modules and is nonzero on $I_V$. Since commutators have trace zero and $[\mathfrak h,R_j]=R_j$,
$$
\mathfrak n:=[\mathfrak g,\mathfrak r]
=[\mathfrak h,\mathfrak r]=\bigoplus_{j\in J}R_j.
$$

Lie's theorem triangularizes the representation of $\mathfrak r_{\mathbb C}$ on $V_{\mathbb C}$. Its finite multiset of diagonal characters is intrinsic, being the characters of its composition factors. Conjugation by $\exp(tX)$, $X\in\mathfrak g$, normalizes $\mathfrak r$ and preserves this multiset. A continuous curve in a finite set is constant; differentiation gives $\lambda([X,R])=0$ for every diagonal character. Hence every element of $\mathfrak n$ is strictly upper triangular in the same basis. The real filtration
$$
F_0=0,\qquad F_{p+1}=\{v:Nv\in F_p\text{ for all }N\in\mathfrak n\}
$$
therefore exhausts $V$. Each $F_p$ is $\mathfrak h$-invariant because $\mathfrak h$ normalizes $\mathfrak n$, and so is a sum of entire distinct irreducible modules. Each summand has a definite first filtration level.

Assume $j\in J$. Equivariance of the action $R_j\otimes V\to V$ gives
$$
R_jW_i=0\ (i\ne j),\qquad R_ju\subseteq W_j,
\qquad R_jW_j\subseteq\mathbb Ru\oplus W_j.
$$
Indeed $R_j\otimes W_i$ is nontrivial on two distinct simple ideals, while every nontrivial summand of $V$ is supported on one; $R_j\otimes W_j$ can map only to the trivial summand or $W_j$. Evaluation maps $R_ju$ onto $W_j$, so strict filtration lowering places $W_j$ below $\mathbb Ru$. An action from $W_j$ to itself cannot lower its unique level, and an action from $W_j$ to $\mathbb Ru$ would raise it. Thus $R_jW_j=0$. For nonzero $N\in R_j$, evaluation gives $Nu\ne0$ and $N^2u=0$. Consequently
$$
\exp(tN)u=u+tNu\in\operatorname{int}K\qquad(t\in\mathbb R).
$$
Taking $t\to\pm\infty$ after division by $|t|$ puts both $Nu$ and $-Nu$ in $K$, contradicting pointedness. Hence $J$ is empty and $\mathfrak r=\mathbb RI_V$.

The derived matrix algebra $[\mathfrak g,\mathfrak g]$ is semisimple and algebraic; the standard algebraicity theorem for finite-dimensional semisimple matrix Lie algebras supplies its real algebraic group. Adding the algebraic scalar multiplicative group gives a connected real reductive algebraic image with Lie algebra $\mathfrak g$. Its real identity component equals $G$, by uniqueness of the connected analytic matrix subgroup with this Lie algebra. The scalar center acts semisimply, as required here.

The stabilizer $H$ is maximal compact. If a compact subgroup $L\subseteq G$ contains $H$, average $u$ over $L$. The resulting vector $w$ is interior, since a compact orbit in the open convex cone has a uniform positive interior margin. It is fixed by $L$ and therefore by $\mathfrak h$, so $w=tu$ with $t>0$. Thus $L$ fixes $u$ and equals $H$. The real reductive open-orbit criterion of Ash, Mumford, Rapoport and Tai (2010, Chapter II, Proposition 1.10) now applies to $Gu=\operatorname{int}K$ with maximal-compact stabilizer $H$ and supplies a positive-definite self-dualizing inner product. Koecher--Vinberg reconstructs a Euclidean Jordan algebra with squares cone $K$ and unit $u$. Its unit-preserving cone automorphisms are the Jordan automorphisms, so its derivation algebra is $\mathfrak h$. The correspondence therefore satisfies Definition G.1.8b on the reconstructed algebra, and Theorem 8.8g.1 gives the single complex matrix algebra. ∎

Intrinsic homogeneity together with stationarity, coverage and nondegeneracy is an irredundant selecting package on the class allowing reducible proper cones. The nonagon carrier proves the homogeneity boundary. Theorem 8.8g.1 supplies the other three witnesses: $V_4\oplus\mathbb R\oplus\mathbb R$ admits a surjection with kernel the unit line after stationarity is removed; $V_5$ with the alternating form (8.8g.1.6) retains stationarity and nondegeneracy after coverage is removed; and $H_2(\mathbb C)\oplus H_2(\mathbb C)$ with block commutators retains stationarity and coverage after nondegeneracy is removed. Proposition 8.8g.31a derives intrinsic self-duality from homogeneity, stationarity and nondegeneracy; coverage then selects the complex algebra. The choice of a registered predictive pairing and physical admission of the full generators remain entries of $\mathfrak C_{\mathrm{car}}$.

<a id="proposition-88g31a-homogeneity-stationarity-and-nondegeneracy-give-intrinsic-self-duality"></a>**Proposition 8.8g.31a (Homogeneity, Stationarity and Nondegeneracy Give Intrinsic Self-Duality).** Retain $K\subset V$, $u\in\operatorname{int}K$, $G$, $H$, $\mathfrak g$ and $\mathfrak h$ of Theorem 8.8g.31, with $G$ transitive on $\operatorname{int}K$, and let a real-linear $\psi:V\to\mathfrak h$ satisfy
$$
\psi_a(a)=0,\qquad\ker\psi=\mathbb Ru,
$$
with no condition on $\operatorname{im}\psi$. Then:

1. $V^{\mathfrak h}=\mathbb Ru$.
2. $G$ is transitive on $\operatorname{int}K^*$, $V$ is an irreducible representation of $G$, and $\operatorname{rad}\mathfrak g=\mathbb RI_V$.
3. $K$ is self-dual under a positive-definite inner product. Its Koecher--Vinberg Jordan algebra with unit $u$ is simple and has derivation algebra $\mathfrak h$, and $K$ is irreducible.

If coverage $\operatorname{im}\psi=\mathfrak h$ is added, Theorem 8.8g.31 identifies this algebra as $H_n(\mathbb C)$.

*Proof.* Item 1. The group $H$ fixes $u$, so $\mathbb Ru\subseteq V^{\mathfrak h}$. Let $w\in V^{\mathfrak h}$. For every $a\in V$, stationarity at $a$, $w$ and $a+w$ gives
$$
0=\psi_{a+w}(a+w)-\psi_a(a)-\psi_w(w)=\psi_a(w)+\psi_w(a)=\psi_w(a),
$$
because $\psi_a\in\mathfrak h$ annihilates $w$. Hence $\psi_w=0$ and $w\in\ker\psi=\mathbb Ru$.

Item 2. Let $G$ act on $V^*$ by $g\cdot\xi=\xi\circ g^{-1}$. For $\xi\in\operatorname{int}K^*$ the stabilizer $G^\xi$ preserves the compact base $\{x\in K:\xi(x)=1\}$, which spans $V$, so $G^\xi$ is compact and fixes the barycenter $x_\xi\in\operatorname{int}K$ of that base. Transitivity on $\operatorname{int}K$ gives $\dim G_{x_\xi}=\dim G-\dim V$, hence $\dim(G\cdot\xi)\ge\dim V$. Every $G$-orbit in the connected open set $\operatorname{int}K^*$ is therefore open, and there is only one.

The order-unit norm makes $H$ compact, as in Theorem 8.8g.31. An $H$-invariant inner product identifies $V$ and $V^*$ as $\mathfrak h$-modules, so $\dim(V^*)^{\mathfrak h}=1$ by item 1. The $H$-average $\xi_u$ of any functional in $\operatorname{int}K^*$ is $H$-fixed and strictly positive on $K\setminus\{0\}$; hence $(V^*)^{\mathfrak h}=\mathbb R\xi_u$ with $\xi_u\in\operatorname{int}K^*$.

Let $F\ne V$ be a $G$-invariant subspace. It does not meet $\operatorname{int}K$, since the orbit $G\cdot x=\operatorname{int}K$ of an interior point spans $V$. Separation of $F$ from the open convex cone $\operatorname{int}K$ gives $\ell\in V^*\setminus\{0\}$ with $\ell|_F=0$ and $\ell\ge0$ on $K$. Its $H$-average $\bar\ell$ vanishes on $F$, is $H$-fixed and satisfies $\bar\ell(u)=\ell(u)>0$. Thus $\bar\ell=\mu\xi_u$ with $\mu>0$, so $\xi_u$ vanishes on $F$, and so does $g\cdot\xi_u$ for every $g\in G$. These functionals fill $\operatorname{int}K^*$, which spans $V^*$; therefore $F=0$, and $V$ is irreducible.

A Lie algebra with a faithful irreducible finite-dimensional representation is reductive, so $\operatorname{rad}\mathfrak g$ is the center $\mathfrak z$ of $\mathfrak g$. By Schur's lemma $\mathfrak z$ lies in the commutant $D$ of $G$ in $\operatorname{End}(V)$, a real division algebra isomorphic to $\mathbb R$, $\mathbb C$ or $\mathbb H$; dilations are automorphisms of $K$, so $\mathbb RI_V\subseteq\mathfrak z$. Write $Z\in\mathfrak z$ as $Z=sI_V+Y$ with $Y$ in the imaginary part of $D$. Then $Y\in\mathfrak z$ and $Y^2=-c^2I_V$ with $c\ge0$, so $\exp(\mathbb RY)$ is a compact central subgroup of $G$ and $L=H\exp(\mathbb RY)$ is a compact subgroup containing $H$. The $L$-average of $u$ lies in the convex hull of the compact orbit $Lu\subset\operatorname{int}K$, is fixed by $L$ and hence by $\mathfrak h$, and so equals $tu$ with $t>0$ by item 1. Hence $L$ fixes $u$, $L=H$ and $Yu=0$. If $c>0$, $Y$ is invertible; so $c=0$, $Y=0$ and $\mathfrak z=\mathbb RI_V$.

Item 3. In the proof of Theorem 8.8g.31, the argument from the algebraicity of $[\mathfrak g,\mathfrak g]$ through the identification of the derivation algebra uses only $\operatorname{rad}\mathfrak g=\mathbb RI_V$, the transitivity of $G$ on $\operatorname{int}K$, the compactness of $H$ and $V^{\mathfrak h}=\mathbb Ru$. With items 1 and 2 it gives the connected real reductive algebraic group with identity component $G$, the maximal compactness of $H$, the positive-definite self-dualizing inner product of Ash, Mumford, Rapoport and Tai (2010, Chapter II, Proposition 1.10), and the Koecher--Vinberg Jordan algebra with squares cone $K$, unit $u$ and derivation algebra $\mathfrak h$. If that algebra were the direct sum of two nonzero ideals with units $e_1,e_2$, then for every derivation $\delta$ the identity $\delta(e_i)=2e_i\circ\delta(e_i)$ would force $\delta(e_i)=0$, so $e_1,e_2$ would be linearly independent vectors in $V^{\mathfrak h}$, against item 1. The algebra is therefore simple, and its squares cone $K$ is irreducible. ∎

<a id="proposition-88g32-separable-carriers-with-multiplicative-capacity"></a>**Proposition 8.8g.32 (Separable Carriers with Multiplicative Capacity).** For $k\ge1$, define
$$
V_k=\operatorname{Herm}_{2^k}(\mathbb C),\qquad
K_k=\operatorname{cone}\{P_1\otimes\cdots\otimes P_k:P_j\text{ is a rank-one qubit projection}\}.
$$
With trace normalization and the full dual effects, these are proper irreducible carriers of dimension $4^k$ and operational capacity $2^k$. Their canonical products give positive locally tomographic composition $V_k\otimes_{\mathbb R}V_l\cong V_{k+l}$. The cone $K_2$ is intrinsically non-self-dual. Thus irreducibility, product tomography and the squared capacity and dimension identities of the ordered-cone self-composite test admit a non-self-dual family.

*Proof.* The normalized base is the convex hull of the compact set of product projectors, so it is compact. Four qubit projectors span $\operatorname{Herm}_2(\mathbb C)$; their products span $V_k$. Since $K_k$ is contained in the positive semidefinite cone, it is pointed. Every product projector $P$ is exposed by the allowed effect $X\mapsto\operatorname{tr}(PX)$, whose value on a positive trace-one matrix is one exactly at $P$. Conversely an extreme point of the convex hull of a compact set belongs to that set. Hence the pure-state space is exactly $(\mathbb{CP}^1)^k$, a connected spanning set. The direct-sum argument used for the nonagon carrier proves irreducibility.

For $E\in K_k^*$ and a pure product projector $P$, complete $P$ to a product orthonormal basis. Every expectation of $E$ on this basis is nonnegative, so $\operatorname{tr}(EP)\le\operatorname{tr}E$. Convexity gives the same bound on every normalized state. A perfectly distinguishing measurement $(E_i)$ with $\sum_iE_i=I$ therefore obeys
$$
m=\sum_i\operatorname{tr}(E_i\rho_i)\le\sum_i\operatorname{tr}E_i=2^k.
$$
The product basis attains this value. Kronecker products identify $V_k\otimes V_l$ with $V_{k+l}$. A product of positive local effects is nonnegative on each elementary product state and hence on the whole composite cone. Full effect intervals span the local dual spaces, so their products span the composite dual and the product-effect map is an isomorphism. In particular $A=K_2$ and $C=K_4$ have capacities $4,16$ and dimensions $16,256$.

The swap operator $F$ gives an explicit trace-dual witness: $\langle a\otimes b,F(a\otimes b)\rangle=|\langle a,b\rangle|^2\ge0$, so $F\in K_2^*$, while its eigenvalue $-1$ on the antisymmetric vector excludes it from $K_2\subset\operatorname{PSD}_4$. To exclude every self-dualizing pairing for $K_2$, use the Choi identification of $K_2^*$ with positive Hermiticity-preserving maps on $M_2(\mathbb C)$:
$$
\langle a\otimes b,J(\Phi)(a\otimes b)\rangle
=\langle b,\Phi(|\bar a\rangle\langle\bar a|)b\rangle.
$$
The identity map is an extreme ray. Indeed, $\operatorname{Id}=\Phi+\Psi$ with both maps positive implies $0\le\Phi(P)\le P$ for every rank-one $P$, so $\Phi(P)=\lambda(P)P$. For an orthonormal pair $e_i,e_j$, apply this to the rank-one operators $P_i+P_j\pm S$, where $S=|e_i\rangle\langle e_j|+|e_j\rangle\langle e_i|$. Adding the two identities forces both scalar coefficients to equal $\lambda(P_i)=\lambda(P_j)$; subtracting gives $\Phi(S)=\lambda S$. The vectors $e_i\pm i e_j$ give the same identity on the imaginary off-diagonal basis element. These matrices span the Hermitian space, so $\Phi=\lambda\operatorname{Id}$.

Every invertible congruence $X\mapsto AXA^*$ is therefore an extreme positive map, by composition with its positive inverse. Its Choi ray is the rank-one ray on $\operatorname{vec}(A)$. The invertible matrices give the open subset $\det A\ne0$ of $\mathbb{CP}^3$, of real dimension six, inside the dual extreme-ray space. The primal extreme-ray space is exactly $\mathbb{CP}^1\times\mathbb{CP}^1$, of dimension four. A linear cone isomorphism induces a projective diffeomorphism, and the image of a four-dimensional embedded manifold cannot contain that six-dimensional embedded family. Thus $K_2\not\cong K_2^*$. A positive-definite self-dualizing pairing would have a metric operator mapping $K_2$ onto $K_2^*$, which is impossible. ∎

<a id="proposition-88g33-registered-pairing-and-steering-predicates"></a>**Proposition 8.8g.33 (Registered Pairing and Steering Predicates).** On the ordinary cone $K=\operatorname{PSD}_n$, $n\ge2$, let
$$
B_\varepsilon(X,Y)=\operatorname{tr}(XY)+\varepsilon\operatorname{tr}X\operatorname{tr}Y,
\qquad L_\varepsilon X=X+\varepsilon\operatorname{tr}(X)I,
\quad\varepsilon>0.
$$
This pairing is positive definite, but its dual cone contains
$$
L_\varepsilon^{-1}(P)=P-\frac{\varepsilon}{1+n\varepsilon}I
$$
for each rank-one projection $P$, which has negative eigenvalues on $P^\perp$. Hence the specified pairing fails self-duality although the quantum cone remains intrinsically self-dual and homogeneous. Representing the usual effect $E$ by $L_\varepsilon^{-1}(E)$ leaves every probability unchanged. Across dimensions the effect product is
$$
(e,f)\longmapsto L_{mn}^{-1}\bigl(L_m(e)\otimes L_n(f)\bigr),
$$
so positivity and the product-effect isomorphism are preserved in these coordinates. The commutator correspondence is unchanged.

Conversely, keep the trace pairing, full effects, commutator correspondence and Kronecker composites, and register only the steering group $X\mapsto UXU^*$, $U\in U(n)$. Trace and spectrum are invariants, so this admitted group fails interior transitivity. These two examples separate the specified data predicates in Definition G.1.8a from intrinsic geometric existence.

<a id="theorem-88g34-self-dual-self-composites-with-retained-sharp-contexts"></a>**Theorem 8.8g.34 (Self-Dual Self-Composites with Retained Sharp Contexts).** There exist proper irreducible cones $A\subset\operatorname{Herm}_4(\mathbb C)$ and $C\subset\operatorname{Herm}_{16}(\mathbb C)$, both self-dual under trace, such that $C$ is a positive locally tomographic self-composite of $A$, their full-effect capacities are $4$ and $16$, and their dimensions are $16$ and $256$, while $A$ is intrinsically nonhomogeneous. The registered sharp states are the trace-one states of Hilbert--Schmidt norm one. Each is uniquely verified by its own vector, products of registered sharp states remain sharp, and both carriers contain a complete sharp context. This extends the retained-sharp-state clause of Definition G.1.8a; the sharpness assertion quantifies over this registered set.

*Proof.* For $d\ge2$ define the round cone
$$
D_d=\{X\in\operatorname{Herm}_d(\mathbb C):\operatorname{tr}X\ge0,\quad
\operatorname{tr}(X^2)\le(\operatorname{tr}X)^2\}.
$$
In coordinates $X=tI/\sqrt d+Z$, $\operatorname{tr}Z=0$, this is $t\ge0$, $\|Z\|\le\sqrt{d-1}\,t$; its trace-dual has radius $1/\sqrt{d-1}$ and is acute. Here acuteness means nonnegative trace pairing between any two cone elements.

We first prove bounded self-dual completion. Let $M\subset D_d$ be a nonzero acute cone. The closure $S$ of the cone generated by $M$ and $D_d^*$ is acute, since the cross pairings are nonnegative. Every acute cone containing $S$ is contained in $S^*\subset D_d$. Consider closed convex trace-one bases between the base of $S$ and the compact ball base of $D_d$, with every pair having nonnegative trace product. This nonempty family is compact in the Hausdorff metric: support functions are uniformly bounded and equicontinuous, and containment and the pairing inequalities are closed. Each member contains the fixed interior ball supplied by $D_d^*$. Volume is continuous on this family and attains its maximum at a base $\Omega$.

Put $L=\operatorname{cone}\Omega$. If $x\in L^*\setminus L$, then $x\in S^*\subset D_d$ and $\operatorname{tr}x>0$. After normalization, adjoining $x$ preserves acuteness and the round bound, while $\operatorname{conv}(\Omega\cup\{x\})$ strictly increases volume because $\Omega$ has interior. This contradicts maximality. Hence
$$
M\subset L=L^*\subset D_d,\qquad I\in\operatorname{int}L.
$$
The bounded base makes $L$ closed and pointed, and the included ball makes it generating. For normalized $\rho,\sigma\in L$, acuteness and Cauchy--Schwarz give $0\le\operatorname{tr}(\rho\sigma)\le1$, whence $I-\rho\in L$. A state of norm one is exposed by itself, with equality at one only at that state. Any full-effect measurement distinguishing $m$ states consequently satisfies
$$
m=\sum_i\operatorname{tr}(E_i\rho_i)\le\sum_i\operatorname{tr}E_i=d.
$$

On two qubits let $P=|\Omega\rangle\langle\Omega|$, $|\Omega\rangle=(|00\rangle+|11\rangle)/\sqrt2$, and let $\Gamma$ transpose the second factor. Take
$$
M=\operatorname{cone}\bigl(\{p\otimes q:p,q\text{ rank-one qubit projectors}\}\cup\{P,\Gamma P\}\bigr).
$$
This cone is acute: product-projector pairings are nonnegative, pairings with $P$ are positive expectations, and pairings with $\Gamma P$ are such expectations after conjugating the second vector. Also $\Gamma P=F/2$ for swap $F$ and $\operatorname{tr}(P\Gamma P)=1/2$. All generators have trace and norm one; the norm triangle inequality puts their cone in $D_4$. Choose a bounded self-dual completion $A$. These generators remain exposed sharp states, and the computational basis attains capacity four. The connected spanning family $\mathbb{CP}^1\times\mathbb{CP}^1$ of product-projector rays proves irreducibility. Since $\Gamma P$ has a negative eigenvalue while $P\in A$,
$$
A\ne\operatorname{PSD}_4,\qquad A\ne\Gamma(\operatorname{PSD}_4).
$$

We need the following preserver fact. If a real-linear trace-inner-product isometry $F$ fixes $I$ and sends every pure two-qubit product projector to a positive rank-one projector, then
$$
F=\operatorname{Ad}_U\circ(\tau_1\otimes\tau_2),
$$
where $U$ is unitary and each $\tau_i$ is identity or transpose. To prove it, put $A_i=F(\sigma_i\otimes I)$ and $B_j=F(I\otimes\sigma_j)$ for the Pauli matrices. For unit Bloch vectors $a,b$, the images of the four orthogonal projectors $p_{\pm a}\otimes p_{\pm b}$ form an orthonormal rank-one basis. Their row and column sums
$$
R_a=\tfrac12(I+\sum_i a_iA_i),\qquad
S_b=\tfrac12(I+\sum_j b_jB_j)
$$
are commuting rank-two projections and $R_aS_b=F(p_a\otimes p_b)$. Varying $a,b$ and polarizing gives
$$
A_iA_j+A_jA_i=2\delta_{ij}I,\quad
B_iB_j+B_jB_i=2\delta_{ij}I,\quad
[A_i,B_j]=0,\quad F(\sigma_i\otimes\sigma_j)=A_iB_j.
$$
The sixteen matrices $I,A_i,B_j,A_iB_j$ span $M_4(\mathbb C)$ because $F$ is invertible. Thus the central self-adjoint involution $-iA_1A_2A_3$, which commutes with both triples, equals $I$ or $-I$; the same holds for the $B$ triple. Changing the sign of its second generator when needed turns each triple into a unital representation of $M_2(\mathbb C)$. The two commuting matrix algebras generate $M_4(\mathbb C)$, so a common unitary identifies them with its two tensor factors. Restoring the second-generator sign changes is precisely local transposition. This proves the preserver fact on a complete matrix basis.

Suppose $A$ were homogeneous. Self-duality and irreducibility permit Koecher--Vinberg reconstruction. Full-effect capacity is the Jordan rank after transport of the interior normalization. Rank four and dimension sixteen select $\operatorname{PSD}_4$ from the simple rank-four dimensions $10,16,28$. Let $L:\operatorname{PSD}_4\to A$ be an order isomorphism. Self-duality gives $H=L^{\mathsf T}L\in\operatorname{Aut}(\operatorname{PSD}_4)$. The full-group polar decomposition for symmetric cones writes $H=P_xJ$, where $x$ is interior, $P_x$ is positive definite and self-adjoint, and $J$ is an orthogonal Jordan automorphism (Orlitzky, Proposition 2). Uniqueness of ordinary polar decomposition gives $J=I$; $H^{1/2}=P_{\sqrt x}$ is a cone automorphism. Therefore $U=L H^{-1/2}$ is an orthogonal cone isomorphism.

The inverse images under $U$ of the four computational projectors in $A$ are nonzero pairwise orthogonal positive matrices of norm one. Their supports are orthogonal, so all have rank one in dimension four, and they sum to $I$. Hence $U^{-1}(I)=I$. Every product projector has trace and norm one; its positive inverse image has the same values and therefore rank one. Apply the preserver fact to $U^{-1}$. It forces $A=(\tau_1\otimes\tau_2)(\operatorname{PSD}_4)$, which is either $\operatorname{PSD}_4$ or $\Gamma(\operatorname{PSD}_4)$, contradicting both displayed inequalities. Thus $A$ is intrinsically nonhomogeneous.

Finally, $A\otimes_{\min}A$ is acute, and its normalized product states have norm at most one. Convexity gives $A\otimes_{\min}A\subset D_{16}$. Apply bounded completion again to obtain
$$
A\otimes_{\min}A\subset C=C^*\subset(A\otimes_{\min}A)^*.
$$
This sandwich gives positive conditional local states: contracting $X\in C$ against a local positive effect pairs nonnegatively with every positive local effect, hence lies in $A=A^*$. Product states and product effects are positive. For $0\le E,F\le I$,
$$
I\otimes I-E\otimes F=(I-E)\otimes I+E\otimes(I-F)\in C,
$$
so the effect intervals and normalization are respected. Effects span the local dual spaces, making the canonical product-effect map a tomography isomorphism. The sixteen computational products attain the upper capacity bound sixteen. The connected spanning exposed family $(\mathbb{CP}^1)^4$ proves irreducibility of $C$. Norm-one product states retain their sharp state/effect identification. ∎

The construction supplies cones by an attained compact optimization problem. Its static product maps preserve all full-effect responses, which separate the additional states. A finite membership representation, closure under every specified local reversible transformation, an indefinitely associative family, and sharp verification of every additional extreme state are distinct stronger requirements. Theorem 8.8g.8 settles the complementary homogeneous-local composition class and derives intrinsic self-duality from its full-dual positive tensor contract.

<a id="proposition-88g35-homogeneous-sharp-cone-with-an-exact-scalar-phase-lift"></a>**Proposition 8.8g.35 (Homogeneous Sharp Cone with an Exact Scalar Phase Lift).** The complex arrow cone
$$
V=\left\{\begin{pmatrix}a&0&x\\0&b&y\\\bar x&\bar y&c\end{pmatrix}:a,b,c\in\mathbb R,\ x,y\in\mathbb C\right\},
\qquad A=V\cap\operatorname{PSD}_3
$$
is proper, irreducible and homogeneous, has sharp verification of every pure state and full-effect capacity three, and admits an amplitude action with exact central kernel $U(1)$. It is intrinsically non-self-dual.

*Proof.* The identity is interior and $\dim V=7$. Congruences by
$$
T=\begin{pmatrix}\alpha&0&0\\0&\beta&0\\s&t&\gamma\end{pmatrix},
\qquad\alpha,\beta,\gamma>0,\quad s,t\in\mathbb C,
$$
and their inverses preserve $V$ and positivity. Every positive-definite arrow matrix is $TT^*$, by choosing the first two diagonal entries as square roots, matching its two off-diagonal entries and taking the square root of the positive final Schur complement. This proves homogeneity.

For $a,b>0$ a positive arrow matrix has the decomposition
$$
X=vv^*+ww^*+d e_3e_3^*,\quad
v=(\sqrt a,0,\bar x/\sqrt a),\quad
w=(0,\sqrt b,\bar y/\sqrt b),\quad
d=c-|x|^2/a-|y|^2/b\ge0.
$$
When a diagonal entry vanishes, positivity forces its off-diagonal entry to vanish and its term is omitted. Thus the extreme rays are precisely rank-one projectors supported in $\operatorname{span}\{e_1,e_3\}$ or $\operatorname{span}\{e_2,e_3\}$. Their normalized space is two copies of $\mathbb{CP}^1$ meeting at $e_3e_3^*$. It is connected and spans $V$, proving irreducibility. Each projector $P$ is sharply verified by $\operatorname{tr}(P\cdot)$, with positive complement, as in the ambient positive semidefinite cone. Complete its vector to an orthonormal basis of its coordinate plane and add the remaining coordinate vector. All three projectors belong to $A$, so every full-dual positive effect satisfies $\operatorname{tr}(EP)\le\operatorname{tr}E$. The measurement trace bound gives capacity at most three, attained by the diagonal context.

The trace-dual consists exactly of matrices
$$
Y=\begin{pmatrix}A_0&0&X_0\\0&B_0&Y_0\\\bar X_0&\bar Y_0&C_0\end{pmatrix}
$$
whose principal $\{1,3\}$ and $\{2,3\}$ blocks are positive semidefinite. For every $s,t\in\mathbb C$,
$$
Y(s,t)=\begin{pmatrix}|s|^2&0&s\\0&|t|^2&t\\\bar s&\bar t&1\end{pmatrix}
$$
is an extreme dual ray. In any positive decomposition, the $C_0$ coordinates are nonnegative and add to one. Normalize positive-$C_0$ summands by that coordinate. Saturation of both Schur inequalities and strict convexity of $|s|^2,|t|^2$ force the same $s,t$ in every such summand. A zero-$C_0$ summand has zero off-diagonal entries, and saturation forces its remaining entries to vanish. This proves extremality. These rays form a smooth four-dimensional projective family, whereas the entire primal extreme set is a union of two two-dimensional projective manifolds. A projective linear diffeomorphism cannot identify them, so $A\not\cong A^*$ and no positive-definite self-dualizing pairing exists. For example $Y(1,1)$ has eigenvalues $1,1+\sqrt2,1-\sqrt2$.

Allow arbitrary nonzero complex diagonal entries in $T$. The resulting amplitude group preserves $\{z\in\mathbb C^3:z_1z_2=0\}$, whose projectors are the pure rays. A congruence fixing the three diagonal projectors must be diagonal with unit-modulus entries. Fixing every pure projector in both coordinate planes forces all three phases to agree. Thus the kernel is exactly $\{zI:|z|=1\}\cong U(1)$. ∎

This construction proves the scalar-lift boundary with homogeneity retained. The homogeneous ordered-correspondence theorem excludes a full stationary, covering, nondegenerate correspondence on this cone. Theorem 8.8g.5 excludes a positive homogeneous self-composite under the full-dual tensor contract in every finite representation order.

<a id="theorem-88g36-countable-entanglement-forces-accumulation-at-every-product"></a>**Theorem 8.8g.36 (Countable Entanglement Forces Accumulation at Every Product).** Retain the fixed Lorentz-five carrier of Theorem 8.8g.23:
$$
L=\{(x_0,x)\in\mathbb R\oplus\mathbb R^4:x_0\ge\|x\|\},\quad
u=\sqrt2e_0,\quad W=\operatorname{Mat}_5(\mathbb R),\quad
U=2E_{00},\quad e(X)=2X_{00},
\tag{8.8g.36.1}
$$
with Frobenius pairing and $K_{\min}=L\otimes_{\min}L$, $K_{\max}=K_{\min}^*$. Let $K_{\min}\subseteq C=C^*\subseteq K_{\max}$, and suppose every normalized extreme state of $C$ has norm one. Write
$$
\mathcal T=\{q\in C:e(q)=\|q\|_F=1\},\qquad
\mathcal P=\{p_ap_b^{\mathsf T}:a,b\in S^3\},\qquad
p_a=(1,a)/\sqrt2,\qquad E=\mathcal T\setminus\mathcal P.
\tag{8.8g.36.2}
$$
Then $\mathcal T$ is the compact actual pure-state set and contains $\mathcal P$. If $E$ is countable, every product belongs to its Frobenius closure:
$$
\mathcal P\subseteq\overline E.
\tag{8.8g.36.3}
$$
Consequently no such cone has finitely many entangled normalized pure states.

For the local quantitative statement, let $p\in\mathcal P$ and $\operatorname{dist}(p,E)\ge\varepsilon>0$, with $\operatorname{dist}(p,\varnothing)=+\infty$. Choose orthonormal light coordinates in both factors so that $p=E_{++}$, and let $\rho_p$ extract the transverse three-by-three block. Every matrix $Z$ supported in that block satisfies
$$
\|Z\|_F\le k_\varepsilon:=\min\{1,\varepsilon^2/2\}
\quad\Longrightarrow\quad U-p+Z\in C\cap p^\perp.
\tag{8.8g.36.4}
$$
Moreover,
$$
\operatorname{cone}\{\rho_p(q):q\in E,\ \langle p,q\rangle=0\}
=\operatorname{Mat}_3(\mathbb R).
\tag{8.8g.36.5}
$$

*Proof.* The compact normalized base and pure-product extremality follow from Theorem 8.8g.23. The all-pure assumption and finite-dimensional extreme-point generation put that base in the closed unit ball. Every unit vector in it exposes itself by its own inner product, since equality in Cauchy--Schwarz forces equality of the two unit vectors. Thus its complete pure set is exactly the closed unit-norm section $\mathcal T$, which is compact.

Fix $p$ and $\varepsilon$ as in the quantitative statement. For $q\in E$, the unit norms give
$$
1-\langle p,q\rangle=\frac12\|p-q\|_F^2\ge\frac{\varepsilon^2}{2},
\qquad \|\rho_p(q)\|_F\le1.
\tag{8.8g.36.6}
$$
For a product $q$, let $A,B\in[0,1]$ be its two local plus coefficients in the adapted light bases. A local pure vector has minus coefficient $1-A$ and transverse squared norm $2A(1-A)$, and likewise for $B$. Therefore
$$
\langle p,q\rangle=AB,\qquad
\|\rho_p(q)\|_F=2\sqrt{AB(1-A)(1-B)}\le1-AB.
\tag{8.8g.36.7}
$$
To verify the inequality, put $x=\sqrt{AB}$. Then $A+B\ge2x$ gives $(1-A)(1-B)\le(1-x)^2$, and $2x(1-x)\le(1+x)(1-x)$ for $0\le x\le1$.

For every actual pure state $q$, equations (8.8g.36.6)--(8.8g.36.7) give
$$
\langle U-p+Z,q\rangle
\ge1-\langle p,q\rangle-k_\varepsilon\|\rho_p(q)\|_F\ge0.
\tag{8.8g.36.8}
$$
The pure states generate $C$, so self-duality puts $U-p+Z$ in $C$. Its pairing with $p$ is zero, proving (8.8g.36.4).

In the adapted coordinates $U$ has four axial entries equal to one and no transverse entry. Hence $e(U-p+Z)=3$. A finite pure-state decomposition of its normalized version gives
$$
U-p+Z=\sum_j\beta_jq_j,\qquad
\beta_j\ge0,\quad q_j\in\mathcal T.
\tag{8.8g.36.9}
$$
All pairings $\langle p,q_j\rangle$ are nonnegative because $C=C^*$. Their weighted sum is zero, so each positive-weight summand annihilates $p$. A product summand then has $AB=0$ and zero transverse block by (8.8g.36.7). Extracting that block gives
$$
\rho_p(Z)=\sum_{q_j\in E}\beta_j\rho_p(q_j),\qquad q_j\perp p.
\tag{8.8g.36.10}
$$
Thus the conic hull in (8.8g.36.5) contains a positive-radius ball about zero. Positive rescaling gives the entire transverse space. In particular $E\cap p^\perp$ is nonempty.

For every fixed $q\in E$, define the closed subset
$$
Z_q=\{(a,b)\in S^3\times S^3:p_a^{\mathsf T}q p_b=0\}.
\tag{8.8g.36.11}
$$
It has empty interior. If its interior contained a nonempty open rectangle $A_0\times B_0$, then for fixed $b\in B_0$ the affine function $a\mapsto p_a^{\mathsf T}q p_b$ would vanish on $A_0$. An affine function $c+v\cdot a$ vanishing on an open subset of $S^3$ has $c=v=0$: for $v\ne0$ a level set of $v\cdot a$ contains no open sphere subset, while $v=0$ forces $c=0$. Hence $q p_b=0$ for every $b\in B_0$. The vectors $p_b$ over a nonempty open sphere subset span $\mathbb R^5$, by the same affine-function argument applied to an annihilating functional. This would give $q=0$, contradicting $e(q)=1$. Thus $Z_q$ is nowhere dense.

The continuous map $(a,b)\mapsto p_ap_b^{\mathsf T}$ is a homeomorphism from $S^3\times S^3$ onto $\mathcal P$: its compact domain maps injectively into the Frobenius carrier, with the time row and column recovering $a,b$. If (8.8g.36.3) failed, the set
$$
O=\{(a,b):p_ap_b^{\mathsf T}\notin\overline E\}
\tag{8.8g.36.12}
$$
would be nonempty and open. Every corresponding product has positive distance from $E$, so (8.8g.36.5) supplies some $q\in E$ annihilating it. Hence $O\subseteq\bigcup_{q\in E}Z_q$. This is impossible when $E$ is countable. Explicitly, enumerate the $Z_q$, repeating entries if the family is finite. Start with a closed positive-radius metric ball inside $O$. Recursively choose a closed smaller ball in the preceding ball's interior, disjoint from the next $Z_q$, with radii tending to zero. Such a choice is possible because $Z_q$ is closed and nowhere dense. Compactness gives a point in all the balls, hence in $O$ and in none of the $Z_q$, a contradiction. For $E=\varnothing$, the nonempty fiber conclusion of (8.8g.36.5) already gives the contradiction. This proves (8.8g.36.3). A finite $E$ is closed and disjoint from the nonempty $\mathcal P$, so cannot satisfy that containment. ∎

<a id="corollary-88g37-necessary-breaking-of-local-antipodal-rotations"></a>**Corollary 8.8g.37 (Necessary Breaking of Local Antipodal Rotations).** Under the hypotheses of Theorem 8.8g.36, let $R=\operatorname{diag}(1,-I_4)$. For every actual entangled normalized pure state
$$
q=\frac12\begin{pmatrix}1&b^{\mathsf T}\\a&T\end{pmatrix}\in E,
$$
one has
$$
\langle q,Rq\rangle=\frac{\|b\|^2-1}{2}<0,
\qquad
\langle q,qR\rangle=\frac{\|a\|^2-1}{2}<0.
\tag{8.8g.37.1}
$$
Consequently $Rq,qR\notin C$. Neither local antipodal map extends to a positive map on $C$, and $C$ is invariant under neither factor's full connected spatial rotation group $SO(4)$.

*Proof.* Theorem 8.8g.23 gives $\|a\|,\|b\|\le1$ and
$$
\|a\|^2+\|b\|^2+\|T\|_F^2=3.
\tag{8.8g.37.2}
$$
If $\|b\|=1$, the right marginal is the pure local vector $p_b$. The local-pure marginal face in (8.8g.23.2), with factors exchanged, writes $q=y p_b^{\mathsf T}$ for a normalized $y\in L$. Its unit Frobenius norm gives $\|y\|=1$, so $y$ is locally pure and $q$ is a product. The same argument applies to $\|a\|=1$. Thus both marginal norms are strictly below one for $q\in E$.

Left multiplication by $R$ reverses the spatial rows, so
$$
\langle q,Rq\rangle
=\frac{1+\|b\|^2-\|a\|^2-\|T\|_F^2}{4}
=\frac{\|b\|^2-1}{2}.
\tag{8.8g.37.3}
$$
Reversing the spatial columns gives the other identity. Since $q\in C=C^*$, its negative pairing with either transformed vector excludes that vector from $C$. Theorem 8.8g.36 excludes $E=\varnothing$, so each local antipodal map actually fails positivity. Finally $-I_4\in SO(4)$ lies on the path $\operatorname{diag}(R_2(t),R_2(t))$, $0\le t\le\pi$, where $R_2(t)$ is the planar rotation through $t$. Thus invariance under either full connected local rotation group would include the corresponding antipodal map and contradict the proved exclusion. ∎

<a id="theorem-88g38-exact-lorentz-five-marginal-region"></a>**Theorem 8.8g.38 (Exact Lorentz-Five Marginal Region).** Retain the carrier, normalization and unit-positive set $\mathcal Q$ of Theorem 8.8g.23. For $A,B\in[0,1]$, consider all Lorentz-positive maps
$$
N=\begin{pmatrix}1&b^{\mathsf T}\\a&T\end{pmatrix},\qquad
\|a\|=A,\quad\|b\|=B.
\tag{8.8g.38.1}
$$
For $0\le\lambda\le1-\max\{A^2,B^2\}$ define
$$
c_{A,B}(\lambda)=
\frac{AB+\sqrt{\lambda(1-A^2-\lambda)(1-B^2-\lambda)}}{1-\lambda}
\quad(\lambda<1),
\qquad c_{0,0}(1)=1.
\tag{8.8g.38.2}
$$
The largest spatial Frobenius norm is exactly
$$
\max_N\|T\|_F^2
=\max_{0\le\lambda\le1-\max\{A^2,B^2\}}
\bigl(3\lambda+c_{A,B}(\lambda)^2\bigr).
\tag{8.8g.38.3}
$$
For each parameter in this maximum, its displayed value is attained by
$$
a=Ae_1,\qquad b=Be_1,\qquad
T=\operatorname{diag}\bigl(c_{A,B}(\lambda),\sqrt\lambda,
\sqrt\lambda,\sqrt\lambda\bigr).
\tag{8.8g.38.4}
$$
Consequently a pair $(A,B)\in[0,1]^2$ occurs as the marginal norms of a member of $\mathcal Q$ if and only if there exist two real numbers $\lambda,c$ satisfying
$$
\begin{gathered}
0\le\lambda\le1-A^2,\qquad\lambda\le1-B^2,\qquad0\le c\le1,\\
(1-\lambda)c-AB\ge0,\\
\bigl((1-\lambda)c-AB\bigr)^2
=\lambda(1-A^2-\lambda)(1-B^2-\lambda),\\
3\lambda+c^2\ge3-A^2-B^2.
\end{gathered}
\tag{8.8g.38.5}
$$
This is an exact polynomial description with two auxiliary variables and maximum degree five. It includes the boundary pairs: if one marginal norm equals one, the other equals one as well.

*Proof.* Independent orthogonal changes of the spatial coordinates put $a=Ae_1$ and $b=Be_1$, preserving Lorentz positivity and Frobenius norms. These are coordinate changes for the set $\mathcal Q$; they impose no symmetry on a chosen intermediate cone.

First suppose $A,B<1$. The S-lemma in (8.8g.24.4), applied to $N$, supplies $\lambda\ge0$ with
$$
H=
\begin{pmatrix}
s&b^{\mathsf T}-a^{\mathsf T}T\\
b-T^{\mathsf T}a&bb^{\mathsf T}+\lambda I_4-T^{\mathsf T}T
\end{pmatrix}\succeq0,
\qquad s=1-A^2-\lambda\ge0.
\tag{8.8g.38.6}
$$
If $s>0$, put $t=1-\lambda$ and $M=I_4+aa^{\mathsf T}/s$. Completing the Schur-complement square gives
$$
\left(T-\frac{ab^{\mathsf T}}t\right)^{\mathsf T}
M\left(T-\frac{ab^{\mathsf T}}t\right)
\preceq\lambda\left(I_4-\frac{bb^{\mathsf T}}t\right).
\tag{8.8g.38.7}
$$
For $\lambda>0$ its right side is positive semidefinite only if $t\ge B^2$; for $\lambda=0$ this inequality already follows from $B<1$. Thus $\lambda\le1-\max\{A^2,B^2\}$. The square inequality is equivalent to
$$
T=\frac{AB}tE_{11}+D_AKD_B,
\qquad\|K\|_{\rm op}\le1,
\quad
D_A=\operatorname{diag}\left(\sqrt{1-A^2/t},1,1,1\right),
\quad
D_B=\sqrt\lambda\operatorname{diag}\left(\sqrt{1-B^2/t},1,1,1\right).
\tag{8.8g.38.8}
$$
For completeness, the factorization follows by defining $K$ on the range of the right square root in (8.8g.38.7); the inequality makes this a contraction and makes the left side vanish on the square root's kernel. Extend $K$ by zero on that kernel.

Every square real contraction is a convex combination of orthogonal matrices. Indeed, apply a singular-value decomposition and express the diagonal singular-value matrix as a convex combination of diagonal sign matrices, choosing each sign with expectation equal to the corresponding singular value. The squared Frobenius norm in (8.8g.38.8) is convex in $K$, so its maximum occurs at an orthogonal $O$. Set $u=A^2/t$, $v=B^2/t$ and $k=O_{11}$. Direct multiplication gives
$$
\left\|\frac{AB}tE_{11}+D_AOD_B\right\|_F^2
=\left(\frac{AB}t\right)^2+
\lambda(4-u-v+uvk^2)
+2\frac{AB}t\sqrt\lambda\sqrt{(1-u)(1-v)}\,k.
\tag{8.8g.38.9}
$$
Both coefficients depending on $k$ are nonnegative. Since $-1\le k\le1$, the maximum is attained at $k=1$, in particular at $O=I_4$. Its value is $3\lambda+c_{A,B}(\lambda)^2$.

If $s=0$, positive semidefiniteness in (8.8g.38.6) gives $b=T^{\mathsf T}a$. If $A=0$, this forces $B=0$, $\lambda=1$ and $T^{\mathsf T}T\preceq I_4$, giving the bound four and its attainment at $T=I_4$. If $A>0$, then $\lambda=1-A^2>0$ and
$$
T^{\mathsf T}(I_4-aa^{\mathsf T})T\preceq\lambda I_4.
\tag{8.8g.38.10}
$$
Hence $K=\lambda^{-1/2}(I_4-aa^{\mathsf T})^{1/2}T$ is a contraction. The first row of $T$ is $(B/A)e_1^{\mathsf T}$, and so is the first row of $K$. Therefore $B\le A$ and $\lambda\le1-B^2$. Each remaining row of $K$ has squared norm at most one. It follows that $\|T\|_F^2\le B^2/A^2+3\lambda$, exactly the value in (8.8g.38.3) at this endpoint. The diagonal choice (8.8g.38.4) attains it.

To verify attainment at every parameter directly, use (8.8g.38.4) in (8.8g.38.6). Three rows and columns of $H$ vanish. The remaining two-by-two matrix has entries
$$
\begin{pmatrix}
1-A^2-\lambda&B-Ac\\
B-Ac&B^2+\lambda-c^2
\end{pmatrix},\qquad c=c_{A,B}(\lambda).
\tag{8.8g.38.11}
$$
Its determinant is zero. When its first diagonal entry is positive, the determinant identity makes the second diagonal entry nonnegative. When that entry is zero and $\lambda<1$, one has $c=B/A$, the off-diagonal entry is zero and the second diagonal entry is $\lambda(1-B^2/A^2)\ge0$. The case $\lambda=1$ is $A=B=0$, $c=1$, and the whole matrix vanishes. Thus $H\succeq0$ in every case, and the nonnegative time row completes the positivity test.

If $A=1$ or $B=1$, the corresponding marginal lies on a local pure ray. The conditional-image proof of (8.8g.23.2), applied in $K_{\max}$, forces $T=ab^{\mathsf T}$. Its squared Frobenius norm is $A^2B^2$, which agrees with (8.8g.38.3), since the parameter interval then consists of $\lambda=0$. This proves the norm maximum on the whole square $[0,1]^2$. The maximum exists: the parameter interval is compact, and at the sole apparent singularity $A=B=0$ the function $c_{0,0}(\lambda)=\sqrt\lambda$ has the declared continuous extension.

A member $q=N/2$ belongs to $\mathcal Q$ exactly when $N$ is positive and
$$
\|T\|_F^2=3-A^2-B^2.
\tag{8.8g.38.12}
$$
The maximum just proved therefore gives the necessity of (8.8g.38.5), with $c=c_{A,B}(\lambda)$. Positivity of its diagonal witness implies $c\le1$ by the contraction bound in Theorem 8.8g.23.

Conversely, a solution of (8.8g.38.5) with $\lambda<1$ has $c=c_{A,B}(\lambda)$, and hence gives a positive diagonal witness whose squared spatial norm is at least the right side of (8.8g.38.12). If $\lambda=1$, the inequalities force $A=B=0$; the map with spatial block $\operatorname{diag}(c,1,1,1)$ is positive because $0\le c\le1$, and has the same required norm inequality. The positive rank-one map with the same marginals and spatial block $ab^{\mathsf T}$ has
$$
\left\|\frac12
\begin{pmatrix}1&b^{\mathsf T}\\a&ab^{\mathsf T}\end{pmatrix}
\right\|_F^2=\frac{(1+A^2)(1+B^2)}4\le1.
\tag{8.8g.38.13}
$$
Interpolate the spatial block between this map and the diagonal witness, leaving the marginals fixed. Positivity is preserved by convexity, and continuity of the Frobenius norm gives a member of $\mathcal Q$ on the segment. If either marginal equals one, (8.8g.38.12) with $T=ab^{\mathsf T}$ forces the other to equal one. Finally, the polynomial of largest total degree in (8.8g.38.5) is $\lambda(1-A^2-\lambda)(1-B^2-\lambda)$, of degree five. ∎

<a id="corollary-88g39-sharp-balance-of-lorentz-marginal-deficits"></a>**Corollary 8.8g.39 (Sharp Balance of Lorentz Marginal Deficits).** Every nonproduct $q\in\mathcal Q$ has marginal norms $A,B<1$ and satisfies
$$
3A^2-2B^2<1,\qquad3B^2-2A^2<1,
\qquad
\frac23<\frac{1-A^2}{1-B^2}<\frac32.
\tag{8.8g.39.1}
$$
Both ratio constants are optimal over the nonproduct part of $\mathcal Q$. In particular, every actual entangled pure state of an all-pure self-dual intermediate obeys these strict inequalities. Along any such states approaching a product, the two marginal deficits vanish at comparable rates within the displayed constants.

*Proof.* The local-pure marginal argument in Theorem 8.8g.38 shows that a unit-positive state with either marginal norm one is a pure product. For a nonproduct, take the trace of the lower principal block in (8.8g.38.6) and use (8.8g.38.12):
$$
3-A^2-B^2\le B^2+4\lambda\le B^2+4(1-A^2).
\tag{8.8g.39.2}
$$
This gives $3A^2-2B^2\le1$. If equality held, both inequalities in (8.8g.39.2) would be equalities. Hence $\lambda=1-A^2>0$, the positive-semidefinite lower block would have trace zero and would vanish, and the zero time-time entry would force the off-diagonal block to vanish. Thus
$$
T^{\mathsf T}T=bb^{\mathsf T}+\lambda I_4,
\qquad b=T^{\mathsf T}a.
\tag{8.8g.39.3}
$$
The first matrix is positive definite, so $T$ is invertible and
$$
A^2=b^{\mathsf T}(T^{\mathsf T}T)^{-1}b
=\frac{B^2}{B^2+\lambda}.
\tag{8.8g.39.4}
$$
Substituting $\lambda=1-A^2$ gives $(1-A^2)(A^2-B^2)=0$. Since $A<1$, one obtains $A=B$, and the supposed equality then gives $A=1$, a contradiction. Transposition gives the other strict inequality. Rearranging the two proves the ratio bounds.

For sharpness, use the orthonormal light coordinates of Lemma 8.8g.25. For $0<t\le1/20$ put
$$
w=\frac{1-t-\sqrt{(1-t)(1-9t)}}2,
\qquad x=1-t-w,\qquad s=\sqrt{xw},\qquad
q_t=\begin{pmatrix}x&0&0\\t&w&0\\0&0&sI_3\end{pmatrix}.
\tag{8.8g.39.5}
$$
Here $x,w,s>0$, $x+w=1-t$ and $xw=2t(1-t)$. An input light vector $(\alpha,\beta,z)$ belongs to the Lorentz cone exactly when $\alpha,\beta\ge0$ and $2\alpha\beta\ge\|z\|^2$. Its image under $q_t$ has nonnegative light coordinates and
$$
2x\alpha(t\alpha+w\beta)-s^2\|z\|^2
=2xt\alpha^2+xw(2\alpha\beta-\|z\|^2)\ge0.
\tag{8.8g.39.6}
$$
Thus $q_t$ is Lorentz-positive. Its normalization is $x+t+w=1$, and
$$
\|q_t\|_F^2=x^2+t^2+w^2+3xw
=1-2t(1-t)+xw=1.
\tag{8.8g.39.7}
$$
It has rank five and therefore is not a product. Its marginal norms are
$$
A_t=1-2(t+w),\qquad B_t=1-2w.
\tag{8.8g.39.8}
$$
They are positive on the stated interval: $x$ is the larger root, so $x\ge(1-t)/2$ and $w=2t(1-t)/x\le4t$, whence $A_t\ge1-10t\ge1/2$. Rationalizing the expression for $w$ gives $w/t\to2$ as $t\downarrow0$. Therefore $q_t\to E_{++}$ and
$$
\frac{1-A_t^2}{1-B_t^2}
=\frac{(t+w)(1-t-w)}{w(1-w)}\longrightarrow\frac32.
\tag{8.8g.39.9}
$$
Transposition supplies the limit $2/3$. This proves optimality over $\mathcal Q$. The fixed all-pure contract puts every actual entangled pure state in its nonproduct part, so the necessary inequalities apply to every candidate. ∎

<a id="corollary-88g40-exact-compact-quadratic-completion-hierarchy"></a>**Corollary 8.8g.40 (Exact Compact Quadratic Completion Hierarchy).** For each finite rational unit-ball list $X_1,\ldots,X_k$ in Theorem 8.8g.24, form $\widehat{\mathfrak F}(X_1,\ldots,X_k)$ as follows. Retain its variables $Z_\alpha,\lambda_\alpha,w_\alpha$, where there are $50k$ indices $\alpha$. For each index introduce a symmetric real five-by-five matrix $G_\alpha$, using its fifteen upper-triangular entries as independent variables. Replace the thirty-one principal-minor inequalities for $H_\alpha$ by the fifteen upper-triangular equations
$$
Z_\alpha^{\mathsf T}JZ_\alpha-\lambda_\alpha J=G_\alpha^2.
\tag{8.8g.40.1}
$$
Introduce two unrestricted real five-by-five matrix variables $P_i,N_i$ for each test index $i$. Impose every equality and inequality in (8.8g.24.3), now reading its definitions of $P_i,N_i$ as coordinate equations in those independent variables. Retain all the remaining constraints in (8.8g.24.2), including the unit-norm equation, both multiplier bounds and the nonnegative weights. In particular, retain every unordered generator-pair inequality, including cross-test, cross-sign and zero-weight-slot pairs.

The new system has rational coefficients and consists of
$$
2100k\ \text{scalar variables},\qquad
876k\ \text{scalar equations},\qquad
202k+\binom{50k}{2}\ \text{weak inequalities}.
\tag{8.8g.40.2}
$$
Every polynomial has total degree at most two. The quadratic formulation retains nonconvex equality constraints, including the unit-norm and orthogonality equations. Its feasible set is compact, and its coordinate projection onto all the original $Z_\alpha,\lambda_\alpha,w_\alpha$ variables is exactly the feasible set of $\mathfrak F(X_1,\ldots,X_k)$.

Consequently the all-pure self-dual completion predicate in assertion 1 of Theorem 8.8g.24 is equivalent both to feasibility of $\widehat{\mathfrak F}$ for every finite rational unit-ball list and to feasibility for every prefix of the fixed dense rational sequence in assertion 3. Failure of completion is equivalent to exact infeasibility of at least one finite prefix of this quadratic hierarchy.

*Proof.* A real symmetric matrix $H$ is positive semidefinite exactly when $H=G^2$ for some real symmetric $G$. One implication follows from $x^{\mathsf T}G^2x=\|Gx\|^2\ge0$. For the other, orthogonally diagonalize $H$ and replace each nonnegative eigenvalue by its nonnegative square root. Because both sides of (8.8g.40.1) are symmetric, their fifteen upper-triangular equations impose their full equality.

Thus every solution of the new system projects to a solution of the old one: (8.8g.40.1) makes $H_\alpha$ positive semidefinite, hence all its principal minors nonnegative, and the equations for $P_i,N_i$ give exactly their old defining sums. All other constraints, including every cross-test pairing and every weight budget, are unchanged. Conversely, each old solution has positive-semidefinite $H_\alpha$; choose the symmetric square roots just described and assign $P_i,N_i$ their defining sums. This gives a new solution over the same old coordinates. This proves equality of the projected feasible sets.

The old $1300k$ scalar variables acquire $15(50k)=750k$ square-root coordinates and $25(2k)=50k$ Moreau-part coordinates, giving $2100k$. The unit-norm and matrix-square equations contribute $(1+15)(50k)=800k$ scalar equations. The two defining sums contribute $50k$, reconstruction contributes $25k$, and the orthogonality equations contribute $k$, for a total of $876k$. Each generator has one row-norm inequality, two multiplier bounds and one weight inequality, giving $200k$. The $2k$ weight budgets and all unordered generator pairs give the remaining count in (8.8g.40.2). Matrix squares, all norm and pairing expressions, and each product $w_\alpha Z_\alpha$ are quadratic. In particular, $\langle P_i,N_i\rangle=0$ is quadratic in the new independent variables, rather than quartic after their defining sums are substituted.

Every new constraint is closed. The retained norm equation bounds $\|Z_\alpha\|_F=1$, the retained multiplier bounds give $0\le\lambda_\alpha\le1/4$, and the nonnegative weight budgets give $0\le w_\alpha\le2$. Write $Z_\alpha=\left(\begin{smallmatrix}1/2&h^{\mathsf T}\\v&A\end{smallmatrix}\right)$. Equation (8.8g.40.1) and the original norm equation give
$$
\begin{aligned}
\|G_\alpha\|_F^2
&=\operatorname{tr}(G_\alpha^2)
=\operatorname{tr}(H_\alpha)\\
&=\frac14+\|h\|^2-\|v\|^2-\|A\|_F^2+3\lambda_\alpha
=-\frac12+2\|h\|^2+3\lambda_\alpha
\le\frac34.
\end{aligned}
\tag{8.8g.40.3}
$$
The defining sums and weight budgets also give $\|P_i\|_F,\|N_i\|_F\le2$. All new coordinates are therefore bounded, proving compactness. Empty feasible sets are included.

Apply the established finite-system equivalence separately to every finite list and every prefix. The three-way equivalence and the finite-infeasible-prefix conclusion of Theorem 8.8g.24 transfer without changing their quantifiers. The quadratic encoding replaces degree-ten minors by additional bounded variables and equations; it asserts no bound on the required prefix length or on the cost of exact feasibility decisions. ∎

<a id="lemma-88g41-sharp-dimension-of-product-annihilators"></a>**Lemma 8.8g.41 (Sharp Dimension of Product Annihilators).** Retain $L,W,U,e,\mathcal P$ and $\mathcal Q$ from Theorem 8.8g.23 and put $J=\operatorname{diag}(1,-I_4)$. For every $q\in\mathcal Q\setminus\mathcal P$, every Lorentz S-lemma witness
$$
H=q^{\mathsf T}Jq-\lambda J\succeq0,\qquad\lambda\ge0
\tag{8.8g.41.1}
$$
has $H\ne0$. Its product-annihilator set
$$
Z_q=\{(a,b)\in S^3\times S^3:p_a^{\mathsf T}q p_b=0\}
\tag{8.8g.41.2}
$$
is semialgebraic and has dimension at most two. The bound is attained by a rational rank-four state. Semialgebraic dimension means cell dimension, with the empty set assigned dimension $-\infty$.

*Proof.* First suppose $H=0$. If $\lambda=0$, then the range of $q$ is a totally isotropic subspace for the Lorentz form: every pair of its vectors has Lorentz pairing zero. Such a subspace has dimension at most one. Explicitly, a nonzero null vector can be written as $c(1,v)$ with $\|v\|=1$; another null vector orthogonal to it must have spatial direction $v$ or the corresponding reversed scaling, by equality in Euclidean Cauchy--Schwarz. Thus $q$ has rank one. Lorentz positivity writes $q=xy^{\mathsf T}$ with nonzero $x,y\in L$, after choosing a positive generator of its range. Since $e(q)=e_1(x)e_1(y)=1$, where $e_1(z)=\sqrt2z_0$, and $\|z\|\le e_1(z)$ on $L$, the equation $\|q\|=1$ forces equality in both local norm bounds. Hence both local normalized factors are pure, and $q\in\mathcal P$, a contradiction.

If $\lambda>0$, put

$$
N=2q=\begin{pmatrix}1&b^{\mathsf T}\\a&T\end{pmatrix},\qquad\mu=4\lambda>0.
$$

Then $N^{\mathsf T}JN=\mu J$. Invertibility gives $NJN^{\mathsf T}=\mu J$ as well. The two time-time entries give

$$
\|a\|^2=\|b\|^2=1-\mu.
$$

The spatial trace of the first identity gives

$$
\|T\|_F^2=\|b\|^2+4\mu=1+3\mu.
$$

Consequently

$$
\|N\|_F^2=1+(1-\mu)+(1-\mu)+(1+3\mu)=4+\mu>4,
$$

contradicting $\|q\|_F=1$. This covers both possible multiplier regimes.

The local-pure marginal argument of Theorem 8.8g.23, valid throughout $K_{\max}$, shows that the marginals of a nonproduct member of $\mathcal Q$ have spatial norms strictly below one. Write $2q=\left(\begin{smallmatrix}1&b_q^{\mathsf T}\\a_q&T_q\end{smallmatrix}\right)$. For each input direction $b\in S^3$, the time coordinate of $q p_b$ is $(1+b_q\cdot b)/(2\sqrt2)>0$. Thus $q p_b$ is a nonzero member of $L$.

A nonzero future Lorentz vector $y=(y_0,y')$ has a zero pairing with $p_a$ precisely when it is null and $a=-y'/y_0$; in that case the direction $a$ is unique. Therefore projection onto the second factor identifies $Z_q$ with

$$
D_q=\{b\in S^3:(q p_b)^{\mathsf T}J(q p_b)=0\}.
\tag{8.8g.41.3}
$$

The inverse graph map is semialgebraic and continuous, indeed rational with nonzero denominator on $S^3$.

Choose any S-lemma witness (8.8g.41.1), whose existence is Theorem 8.8g.24. Since $p_b^{\mathsf T}Jp_b=0$, the null condition (8.8g.41.3) is

$$
p_b^{\mathsf T}Hp_b=0\quad\Longleftrightarrow\quad Hp_b=0,
\tag{8.8g.41.4}
$$

where the equivalence uses $H\succeq0$. By the first part, $H\ne0$, so $\ker H$ has dimension at most four. The slice

$$
A_H=\{b\in\mathbb R^4:(1,b)\in\ker H\}
$$

is empty or an affine subspace of dimension at most three: a nonempty time-one slice reduces the dimension of the linear subspace by exactly one. Its intersection with $S^3$ is empty, a point, or a Euclidean sphere of dimension at most two. In particular, a positive-dimensional affine subspace cannot be contained in a bounded sphere. The two displayed conditions prove the dimension bound.

The rational state

$$
q_0=\tfrac12\operatorname{diag}(1,1,1,1,0)
\tag{8.8g.41.5}
$$

is Lorentz-positive, normalized and Frobenius-unit, and has rank four. With $\lambda=1/4$, its defect is $H=\operatorname{diag}(0,0,0,0,1/4)$. Its null input directions are exactly $\{b\in S^3:b_4=0\}\cong S^2$, and its annihilator is the graph $a=-b$ on that equator. Thus the upper bound two is attained inside $\mathcal Q$. ∎

<a id="theorem-88g42-semialgebraic-entangled-pure-dimension-bound"></a>**Theorem 8.8g.42 (Semialgebraic Entangled-Pure Dimension Bound).** Let

$$
K_{\min}\subseteq C=C^*\subseteq K_{\max}
$$

be a closed convex all-pure intermediate with the exact normalization above. Let

$$
\mathcal T=C\cap\mathcal Q,\qquad E=\mathcal T\setminus\mathcal P.
$$

Assume that $E$ is semialgebraic. Then

$$
\dim E\ge4.
\tag{8.8g.42.1}
$$

It suffices that $C$ be semialgebraic, since the formula defining $E$ then is semialgebraic. No semialgebraic assumption on $C$ is needed beyond the stated assumption on its actual entangled pure locus.

*Proof.* Theorems 8.8g.23 and 8.8g.36 identify $\mathcal T$ as the compact actual normalized pure set and establish

$$
p\in\mathcal P\setminus\overline E\quad\Longrightarrow\quad
E\cap p^\perp\ne\varnothing.
\tag{8.8g.42.2}
$$

For completeness, the mechanism is the positive-radius transverse ball about $U-p$ in $C\cap p^\perp$. Its nonzero transverse directions require entangled pure summands annihilating $p$, because every product annihilating $p$ has zero transverse block. Equation (8.8g.42.2) therefore uses all-purity and self-duality.

If $\mathcal P\subseteq\overline E$, closure preserves semialgebraic dimension and $\dim\mathcal P=6$, so $\dim E\ge6$, which implies (8.8g.42.1).

Otherwise $O=\mathcal P\setminus\overline E$ is a nonempty relatively open semialgebraic subset of the six-dimensional product manifold, hence $\dim O=6$. Form the semialgebraic incidence set

$$
I=\{(q,a,b):q\in E,\ a,b\in S^3,\ p_a^{\mathsf T}q p_b=0\}.
$$

Projection onto $E$ has fibers $Z_q$, of dimension at most two by Lemma 8.8g.41. The semialgebraic fiber-dimension theorem gives

$$
\dim I\le\dim E+2.
$$

Projection onto the product variables covers $O$, by (8.8g.42.2), so $\dim I\ge6$. Thus $\dim E\ge4$. ∎

The dimension facts used here are closure invariance, nonincrease under projection and the fiber-dimension inequality. They follow from semialgebraic cell decomposition; see Coste (2002, Sections 3.3 and 4.1).

<a id="corollary-88g43-four-dimensional-boundary-fibers"></a>**Corollary 8.8g.43 (Four-Dimensional Boundary Fibers).** Under the hypotheses of Theorem 8.8g.42, suppose $\dim E=4$. There is a relatively open dense semialgebraic subset $O'\subseteq\mathcal P$ such that for each $p\in O'$:

1. $p\notin\overline E$.
2. $E_p=E\cap p^\perp$ is finite and has at least ten members.
3. Every $q\in E_p$ has $\dim Z_q=2$; every S-lemma defect matrix $q^{\mathsf T}Jq-\lambda J\succeq0$ has rank exactly one.
4. In the light coordinates adapted to $p$, the transverse three-by-three blocks of the members of $E_p$ positively span all of $\operatorname{Mat}_3(\mathbb R)$.

*Proof.* Since $\dim\overline E=4<6$, the product subset $\mathcal P\cap\overline E$ has dimension at most four. Remove it. The incidence set $I$ in the theorem has dimension at most six. The semialgebraic fiber-dimension theorem applied to its projection onto the six-dimensional product manifold makes the set of product parameters with positive-dimensional fiber have dimension at most five. Remove its closure as well. Remaining fibers are zero-dimensional semialgebraic sets and therefore finite. They are nonempty by (8.8g.42.2).

The set $E_{\le1}=\{q\in E:\dim Z_q\le1\}$ is semialgebraic by the same fiber theorem. Its incidence set has dimension at most five. Remove the closure of its product projection. All removed sets have dimension strictly below six, so the remaining set $O'$ is relatively open and dense. Each surviving annihilator has $\dim Z_q=2$. The argument of Lemma 8.8g.41 then forces $\dim\ker H\ge4$, whereas the same lemma gives $H\ne0$. Thus $\operatorname{rank}H=1$, for every admissible witness.

The positive transverse spanning assertion is exactly (8.8g.36.5), since $p\notin\overline E$. A finite set positively spanning a nine-dimensional vector space has at least ten members: fewer than nine cannot linearly span it; exactly nine either fail to span or form a basis, whose positive cone does not contain the negative of a basis vector. Zero transverse blocks cannot decrease the required number. This proves all four assertions. ∎

<a id="proposition-88g44-correspondence-census-through-dimension-six-and-centrally-symmetric-sharp-carriers"></a>**Proposition 8.8g.44 (Correspondence Census through Dimension Six and Centrally Symmetric Sharp Carriers).** Use the tests of Definition 8.8g.29.

1. Let $K\subset V$ be a proper cone with interior order unit $u$ and $\dim\mathfrak g_u=\dim V-1$, the dimension that coverage and nondegeneracy of an ordered correspondence require. If $\dim V\le6$, then $\dim V\in\{1,4\}$, and for $\dim V=4$ the cone $K$ is the cone over a Euclidean three-ball with $u$ on its axis, that is, the Lorentz cone of $H_2(\mathbb C)$. Every such carrier is intrinsically self-dual and homogeneous. Stationarity and Jordan structure are not used.
2. Let $K\subset V$ be a proper cone that is self-dual under an inner product in which every normalized pure state has norm one, with normalization functional $\langle u^\sharp,\cdot\rangle$. If its normalized state space $\Omega$ is centrally symmetric about one of its points, then $\Omega$ is a Euclidean ball and $K$ is a Lorentz cone.

*Proof.* 1. The stabilizer $G=\operatorname{Aut}(K)_u$ preserves the order interval $K\cap(u-K)$, a compact convex body with nonempty interior, and is therefore compact. Averaging a strictly positive functional over $G$ gives a $G$-invariant $\tau\in\operatorname{int}K^*$ with $\tau(u)=1$. Then $V=\mathbb Ru\oplus\ker\tau$ as $G$-modules, the base $\{x\in K:\tau(x)=1\}$ equals $u+B$ for a $G$-invariant compact convex body $B\subset\ker\tau$ with $0$ in its interior, and $\mathfrak g_u$ acts faithfully on $\ker\tau$ by skew operators for a $G$-invariant inner product. Put $d=\dim V-1$. Thus $\mathfrak g_u$ is a compact Lie algebra of dimension $d$ inside $\mathfrak{so}(d)$.

For $d=1,2$ this is impossible because $\dim\mathfrak{so}(d)<d$. For $d=3$ one has $\mathfrak g_u=\mathfrak{so}(3)$, so $B$ is invariant under $SO(3)$ and is a ball about $0$. For $d=4$, a four-dimensional compact Lie algebra is $\mathfrak{su}(2)\oplus\mathbb R$ or $\mathbb R^4$, and $\mathfrak{so}(4)=\mathfrak{su}(2)_+\oplus\mathfrak{su}(2)_-$ has rank two, which excludes $\mathbb R^4$. A subalgebra isomorphic to $\mathfrak{su}(2)$ is $\mathfrak{su}(2)_+$, $\mathfrak{su}(2)_-$ or the graph of an isomorphism $\mathfrak{su}(2)_+\to\mathfrak{su}(2)_-$, and such a graph has zero centralizer. Hence $\mathfrak g_u=\mathfrak{su}(2)_\pm\oplus\mathfrak u(1)_\mp\cong\mathfrak u(2)$ acting on $\mathbb C^2$. The group $U(2)$ is transitive on spheres, so $B$ is a four-ball; then $\mathfrak g_u=\mathfrak{so}(4)$ has dimension six, a contradiction. For $d=5$ the compact Lie algebras of dimension five are $\mathfrak{su}(2)\oplus\mathbb R^2$ and $\mathbb R^5$, of rank at least three, while $\mathfrak{so}(5)$ has rank two. The cone over a three-ball is the Lorentz cone of $H_2(\mathbb C)$, which is self-dual and homogeneous.

2. Put $\kappa=1/\langle u^\sharp,u^\sharp\rangle$, $c=\kappa u^\sharp$ and $B=\Omega-c\subset(u^\sharp)^\perp$. For $x=c+b$ and $y=c+b'$ one has $\langle x,y\rangle=\kappa+\langle b,b'\rangle$, so self-duality gives $B=-\kappa B^\circ$, and every extreme point of $B$ has $\|b\|^2=1-\kappa=:R^2$. The extreme points lie on the sphere of radius $R$ about $0$ and affinely span $(u^\sharp)^\perp$. A centre of symmetry of $B$ maps this set onto itself; two distinct spheres of equal radius meet inside a hyperplane, so the centre is $0$ and $B=-B$. Then $B=\kappa B^\circ$. An extreme point $b$ gives $R^2=\langle b,b\rangle\le\kappa$, and every $y$ with $\|y\|\le\kappa/R$ satisfies $\langle y,b\rangle\le\kappa$ on $B$, so the ball of radius $\kappa/R\ge R$ lies in $B$, which lies in the ball of radius $R$. ∎

<a id="proposition-88g45-seven-dimensional-correspondence-carrier-outside-the-self-dual-and-homogeneous-classes"></a>**Proposition 8.8g.45 (Seven-Dimensional Correspondence Carrier outside the Self-Dual and Homogeneous Classes).** On $V=\mathbb R\oplus\mathbb R^3\oplus\mathbb R^3$ put
$$
K_\times=\{(t,a,b):\|a\|\le t,\ \|b\|\le t\},\qquad u=(1,0,0),
\tag{8.8g.45.1}
$$
with normalization functional $(t,a,b)\mapsto t$. The normalized states form $B^3\times B^3$, the pure states are $r(m,n)=(1,m,n)$ with $\|m\|=\|n\|=1$, and a functional $(\alpha,f,g)$, acting by $\alpha t+f\cdot a+g\cdot b$, belongs to $K_\times^*$ exactly when $\|f\|+\|g\|\le\alpha$.

1. $\operatorname{Aut}(K_\times)=\mathbb R_{>0}\times\bigl((O(3)\times O(3))\rtimes\mathbb Z_2\bigr)$, acting on $(a,b)$, so $\mathfrak g_u=\mathfrak{so}(3)\oplus\mathfrak{so}(3)$. The map
$$
\psi_{(t,a,b)}(t',a',b')=(0,\ a\times a',\ b\times b')
\tag{8.8g.45.2}
$$
is a stationary, covering, nondegenerate ordered correspondence. The same map is such a correspondence on the dual cone $K_\times^*$ with the same order unit.
2. $K_\times$ is irreducible and has operational capacity two. For every $k\ge1$ its $k$-fold minimal tensor power, with the product normalization functional, is irreducible and has capacity $2^k$ and dimension $7^k$.
3. No linear isomorphism carries $K_\times$ onto $K_\times^*$, so $K_\times$ is not intrinsically self-dual. The orbits of $\operatorname{Aut}(K_\times)$ in the seven-dimensional interior have dimension at most five, so $K_\times$ is not homogeneous.
4. On $\mathbb C^2\otimes\mathbb C^2$ the group $\{e^{i\theta}U_1\otimes U_2:U_1,U_2\in SU(2)\}$ acts irreducibly and maps onto the identity component $SO(3)\times SO(3)$ of $\operatorname{Aut}(K_\times)_u$ with kernel exactly the scalar circle.

By Proposition 8.8g.44, seven is the least dimension of a proper cone carrying a covering nondegenerate correspondence other than the half-line and the four-dimensional Lorentz cone. The chosen data are the cone, its order unit, the minimal tensor product as composition rule and the displayed lift; the correspondence test is applied to $K_\times$ and $K_\times^*$, and the automorphism algebra of the minimal tensor square is not computed.

*Proof.* 1. The faces of $B^3\times B^3$ are products of faces, so its maximal proper faces are $\{m\}\times B^3$ and $B^3\times\{n\}$; two of one family are disjoint and two of different families meet in one point. An automorphism $g$ of $K_\times$ therefore maps extreme rays by $g\,r(m,n)=\lambda(m,n)\,r(\varphi m,\chi n)$, possibly after exchanging the two factors. Applying $g$ to $r(m,n)+r(m',n')=r(m,n')+r(m',n)$ gives $\lambda(m,n)=\alpha(m)+\beta(n)$ from the first component and $(\beta(n)-\beta(n'))(\varphi m-\varphi m')=0$ from the second, so $\beta$, and likewise $\alpha$, is constant. Write $\lambda$ for the constant value of $\lambda(m,n)$. By linearity $\varphi$ and $\chi$ are restrictions of affine maps of $\mathbb R^3$ carrying the unit sphere onto itself, hence of orthogonal maps, and then $g\,u=\lambda u$. Thus $g/\lambda$ fixes $u$ and acts on $(a,b)$ through $(O(3)\times O(3))\rtimes\mathbb Z_2$. For $x=(t,a,b)$ one has $\psi_x(x)=(0,a\times a,b\times b)=0$; the map $a\mapsto a\times(\cdot)$ is a linear bijection $\mathbb R^3\to\mathfrak{so}(3)$, which gives coverage and $\ker\psi=\mathbb Ru$. The automorphisms of $K_\times^*$ are the inverse transposes of those of $K_\times$; on the orthogonal group $(O(3)\times O(3))\rtimes\mathbb Z_2$ this is the same action, so the stabilizer of $u$ and the correspondence are unchanged.

2. The extreme rays form a connected set spanning $V$, and in a direct sum every extreme ray lies in one summand; this gives irreducibility, and the products of pure states give it for the minimal tensor powers. A positive functional $h=(\alpha,f,g)$ has supremum $\alpha+\|f\|+\|g\|\le2\alpha=2h(\omega_0)$ over the normalized states, where $\omega_0=(1,0,0)$. An effect attaining the value one therefore has value at least $1/2$ at $\omega_0$; the values at $\omega_0$ of the effects of a measurement sum to one, so the capacity is at most two, and $\tfrac12(1,\pm m,0)$ distinguishes $r(m,n)$ from $r(-m,n)$. Let $E$ be an effect of the $k$-fold minimal tensor power attaining the value one. Its maximum over the normalized states is attained at a product $x_1\otimes\cdots\otimes x_k$ of pure states. Replace the tensor factors by $\omega_0$ one at a time: each partial evaluation is a positive functional of one factor, so each replacement loses at most a factor $1/2$ and $E(\omega_0^{\otimes k})\ge2^{-k}$. Hence the capacity is at most $2^k$, and products of the two-outcome measurement attain it.

3. A linear isomorphism of cones maps extreme rays homeomorphically onto extreme rays. Those of $K_\times$ form $S^2\times S^2$, which is connected. The base of $K_\times^*$ is the convex hull of two three-balls in complementary subspaces, whose extreme points form two disjoint two-spheres. By item 1 the automorphism group has dimension seven and fixes the ray of $u$; its orbits in the interior have dimension at most $1+2+2$.

4. The image of $e^{i\theta}U_1\otimes U_2$ is the pair of rotations of $U_1,U_2$, and an element acts trivially on both factors exactly when $U_1$ and $U_2$ are scalars. ∎

<a id="lemma-88g46-product-pairing-of-a-sharp-self-dual-composite"></a>**Lemma 8.8g.46 (Product Pairing of a Sharp Self-Dual Composite).** For $i=1,2$ let $K_i\subset V_i$ be a proper cone that is self-dual under an inner product $\langle\cdot,\cdot\rangle_i$ in which every normalized pure state has norm one, with normalization functional $u_i$. Let $K_{\min}$ be generated by the products of elements of $K_1,K_2$, let $K_{\max}$ consist of the vectors on which every product of functionals from $K_1^*,K_2^*$ is nonnegative, and let $K_{\min}\subseteq C\subseteq K_{\max}$ be a cone with normalization $u_1\otimes u_2$ that is self-dual under some inner product $\langle\cdot,\cdot\rangle'$ on $V_1\otimes V_2$ in which every normalized pure state of $C$ has norm one. Then products of pure states are pure states of $C$, and
$$
\langle\cdot,\cdot\rangle'=\langle\cdot,\cdot\rangle_1\otimes\langle\cdot,\cdot\rangle_2 .
\tag{8.8g.46.1}
$$
In particular an all-pure self-dual composite of two Lorentz cones with their standard pairings is self-dual under the Frobenius pairing of Theorem 8.8g.23, whatever self-dualizing inner product is admitted at the outset.

*Proof.* Let $x_i$ be pure states of $K_i$ and $y=x_1\otimes x_2$. First, $y$ spans an extreme ray of $K_{\max}$, hence of $C$. Let $y=y'+y''$ with $y',y''\in K_{\max}$. For $e_2\in K_2^*$ the partial evaluations $(1\otimes e_2)y'$ and $(1\otimes e_2)y''$ are nonnegative on $K_1^*$, so they lie in $K_1$, and they sum to $e_2(x_2)x_1$; hence both are multiples of $x_1$. Since $K_2^*$ spans $V_2^*$, $y'=x_1\otimes y_2'$, and evaluating with an $e_1\in K_1^*$ that is positive at $x_1$ shows $y_2'\in K_2$. Likewise $y''=x_1\otimes y_2''$ with $y_2''\in K_2$ and $y_2'+y_2''=x_2$, so both are multiples of $x_2$. Thus $y$ is a pure state of $C$ and $\langle y,y\rangle'=1$.

Second, local self-duality makes the extreme rays of $K_i^*$ the rays of the functionals $\langle x_i,\cdot\rangle_i$ with $x_i$ pure. The first step, applied to the dual cones, shows that $g=\langle x_1,\cdot\rangle_1\otimes\langle x_2,\cdot\rangle_2$ spans an extreme ray of $K_{\min}^*$, hence of $C^*$, which contains it. Each $e_i=\langle x_i,\cdot\rangle_i$ satisfies $u_i-e_i\in K_i^*$ by the Cauchy–Schwarz inequality on the normalized states, and $u_1\otimes u_2-e_1\otimes e_2=(u_1-e_1)\otimes u_2+e_1\otimes(u_2-e_2)$, so $g$ is an effect of $C$.

Third, self-duality of $C$ gives $g=\langle z,\cdot\rangle'$ with $z$ on an extreme ray of $C$, so $z=t\hat z$ with $t>0$ and $\hat z$ a pure state of norm one. Then $t=g(\hat z)\le1$, while $1=g(y)=t\langle\hat z,y\rangle'\le t$. So $t=1$, $\langle\hat z,y\rangle'=1$ and $\hat z=y$; that is, $\langle x_1\otimes x_2,w\rangle'=\bigl(\langle x_1,\cdot\rangle_1\otimes\langle x_2,\cdot\rangle_2\bigr)(w)$ for every $w$. Products of pure states span $V_1\otimes V_2$, so the two inner products agree. ∎

<a id="proposition-88g47-composites-of-two-lorentz-cones-under-local-covariance-and-local-antipodes"></a>**Proposition 8.8g.47 (Composites of Two Lorentz Cones under Local Covariance and Local Antipodes).** For $s\ge2$ let $L_s=\{(x_0,x)\in\mathbb R\oplus\mathbb R^s:x_0\ge\|x\|\}$, with $u=\sqrt2e_0$ and pure states $p_m=(1,m)/\sqrt2$, $\|m\|=1$. On $\operatorname{Mat}_{s+1}(\mathbb R)$ with the Frobenius pairing and $e(X)=2X_{00}$ put $K_{\min}=L_s\otimes_{\min}L_s$ and $K_{\max}=K_{\min}^*$, and write a normalized element as
$$
x=\frac12\begin{pmatrix}1&r^{\mathsf T}\\c&T\end{pmatrix},\qquad
\langle x,p_mp_n^{\mathsf T}\rangle=\tfrac14\bigl(1+r\cdot n+c\cdot m+m^{\mathsf T}Tn\bigr).
\tag{8.8g.47.1}
$$
A cone $C$ is *locally covariant* when $\operatorname{diag}(1,g_1)\,C\,\operatorname{diag}(1,g_2)^{\mathsf T}=C$ for all $g_1,g_2\in SO(s)$. For $s=3$ identify $L_3$ with the positive cone of $H_2(\mathbb C)$, let $Q$ be the positive-semidefinite cone of $\mathbb C^2\otimes\mathbb C^2$ and $Q^\Gamma$ its partial transpose.

1. Every normalized $x\in K_{\max}$ satisfies $\|r\|,\|c\|\le1$ and
$$
\Bigl(1-\frac1s\Bigr)\bigl(\|r\|^2+\|c\|^2\bigr)+\frac2s\|T\|_F^2\le2 .
\tag{8.8g.47.2}
$$
2. For $s=3$ every normalized $x\in K_{\max}$ has $\|x\|_F\le1$, with equality exactly on the rank-one projectors and their partial transposes. A locally covariant self-dual cone $K_{\min}\subseteq C\subseteq K_{\max}$ whose normalized extreme points all have norm one is $Q$ or $Q^\Gamma$. The cone of Theorem 8.8g.9 is an all-pure self-dual intermediate cone different from both, so local covariance cannot be dropped.
3. Let $K_1,K_2$ be four-dimensional proper cones with order units and unit-stabilizer algebras of dimension three; by Proposition 8.8g.44 both are $L_3$ with the order unit on the axis. Let $K_{\min}\subseteq C\subseteq K_{\max}$ be a locally covariant cone whose stabilizer algebra of $u\otimes u$ has dimension fifteen. These are the dimensions that coverage and nondegeneracy of ordered correspondences on the factors and on the composite require. Then $C$ is $Q$ or $Q^\Gamma$. In particular $C$ is self-dual and homogeneous; neither property is assumed.
4. Let $J=\operatorname{diag}(1,-I_s)$. If a closed cone $K_{\min}\subseteq C\subseteq C^*$ has normalized extreme points of norm one and $JC=C$ or $CJ=C$, then $C=K_{\min}$, which is not self-dual. For even $s$ one has $-I_s\in SO(s)$, so no locally covariant all-pure self-dual intermediate cone exists; for $s=4$ this recovers the rotation statement of Corollary 8.8g.37 without self-duality of $C$. For $s\ge4$ inequality (8.8g.47.2) does not bound the norm: $\tfrac12\operatorname{diag}(1,R)$, $R\in O(s)$, lies in $K_{\max}$ and has squared norm $(1+s)/4>1$.

*Proof.* 1. For fixed $m$, nonnegativity of (8.8g.47.1) for all unit $n$ gives $\|r+T^{\mathsf T}m\|\le1+c\cdot m$. Squaring and averaging over the sphere, with mean $0$ for $m$ and $I/s$ for $mm^{\mathsf T}$, gives $\|r\|^2+\|T\|_F^2/s\le1+\|c\|^2/s$. The same with the factors exchanged gives $\|c\|^2+\|T\|_F^2/s\le1+\|r\|^2/s$, and the sum is (8.8g.47.2). Adding the inequalities for $m$ and $-m$ gives $\|r\|\le1$, and likewise $\|c\|\le1$.

2. For $s=3$, (8.8g.47.2) reads $\|r\|^2+\|c\|^2+\|T\|_F^2\le3$, that is $\|x\|_F\le1$. Equality holds exactly when $\|r+T^{\mathsf T}m\|=1+c\cdot m$ and $\|c+Tn\|=1+r\cdot n$ identically. Comparing the parts of degree one and two on the sphere gives $Tr=c$, $T^{\mathsf T}c=r$, $TT^{\mathsf T}=(1-\|r\|^2)I+cc^{\mathsf T}$ and $T^{\mathsf T}T=(1-\|c\|^2)I+rr^{\mathsf T}$. Then $\|c\|^2=(1-\|c\|^2)\|r\|^2+\|r\|^4$ and its mirror image give $(\|c\|^2-\|r\|^2)(2+\|r\|^2+\|c\|^2)=0$, so $\|r\|=\|c\|=:a$. After local rotations $r=c=ae_3$ and $T=\operatorname{diag}(\sqrt{1-a^2},\pm\sqrt{1-a^2},1)$. The lower sign is the projector of $\cos\theta|00\rangle+\sin\theta|11\rangle$ with $a=\cos2\theta$; the upper sign is its partial transpose. Conversely projectors and their partial transposes are normalized elements of $K_{\max}$ of norm one.

Let $C$ be as in the second assertion. Each normalized extreme point is a projector or a partial transpose of one. If $C$ contained the projector of an entangled vector with Schmidt coefficients $a,b>0$ and the partial transpose $\phi^\Gamma$ of the projector of an entangled $\phi=c|00\rangle+s|11\rangle$, local covariance would put the projector of $\psi'=a|01\rangle-b|10\rangle$ in $C$, and $\langle\psi'|\phi^\Gamma|\psi'\rangle=-2abcs<0$ contradicts $C\subseteq C^*$. So the extreme points all lie in $Q$ or all in $Q^\Gamma$, and a self-dual cone contained in a self-dual cone equals it. The cone of Theorem 8.8g.9 contains the qubit-exchange operator, which is not positive semidefinite, and a Bell projector, which is not in $Q^\Gamma$.

3. Identify the carrier with $H_2(\mathbb C)\otimes H_2(\mathbb C)$, with $u\otimes u$ proportional to the identity, and let $\mathfrak h=\mathfrak{so}(3)\oplus\mathfrak{so}(3)$ be the local algebra. As an $\mathfrak h$-module the carrier is $\mathbf 1\oplus W$ with $W=(\mathbf 3,\mathbf 1)\oplus(\mathbf 1,\mathbf 3)\oplus(\mathbf 3,\mathbf 3)$ the traceless part. Let $\mathfrak g$ be the stabilizer algebra of the order unit. Its compact group fixes a strictly positive functional, which is $\mathfrak h$-invariant and hence a multiple of the trace; so $\mathfrak g$ is a compact Lie algebra of dimension $15$ acting faithfully on $W$ and containing $\mathfrak h$. The commutant of $\mathfrak h$ on $W$ consists of the operators that are real scalars on the three summands. These are symmetric for every invariant inner product, while the centre of $\mathfrak g$ is skew, so $\mathfrak g$ is semisimple, hence $\mathfrak{su}(4)$ or $\mathfrak{su}(2)^{\oplus5}$. Each $\mathfrak g$-irreducible summand of $W$ is a sum of $\mathfrak h$-summands, so the summands have dimensions $15$, or $12+3$, or $9+6$, or $9+3+3$. The algebra $\mathfrak{su}(2)^{\oplus5}$ has no real irreducible representation of dimension six. Real irreducible representations of $\mathfrak{su}(2)^{\oplus5}$ of dimensions $3,9,12,15$ involve at most $1,2,3,2$ of the five ideals, so at most four ideals act on $W$, contradicting faithfulness. Thus $\mathfrak g\cong\mathfrak{su}(4)$, whose real irreducible representations of dimension at most fifteen have dimensions $1,6,8,15$. The block dimensions $3$, $9$ and $12$ do not occur among them, so $W$ is irreducible and is the adjoint representation.

Hence there is a linear isomorphism $\Phi$ of the carrier onto $H_4(\mathbb C)$ carrying $\mathfrak g$ to $\operatorname{ad}\mathfrak{su}(4)$. The image of $\mathfrak h$ is a subalgebra $\mathfrak{su}(2)\oplus\mathfrak{su}(2)$ on which the adjoint representation restricts to $(\mathbf 3,\mathbf 1)\oplus(\mathbf 1,\mathbf 3)\oplus(\mathbf 3,\mathbf 3)$; among the four-dimensional representations only $(\mathbf 2,\mathbf 2)$ has this property. After composing $\Phi$ with a unitary conjugation it intertwines the local actions on $H_2\otimes H_2$ with themselves, and is therefore a scalar $a_0,a_1,a_2,a_3$ on each of $\mathbb R1$, $H_2^0\otimes1$, $1\otimes H_2^0$, $H_2^0\otimes H_2^0$. Normalize $a_0=1$. The cone $C'=\Phi(C)$ is invariant under conjugation by $SU(4)$ and contains $X=\tfrac14(1+a_1\sigma_m\otimes1+a_2\,1\otimes\sigma_n+a_3\sigma_m\otimes\sigma_n)$, the image of a product of pure states; its dual contains $Y=\tfrac14(1+a_1^{-1}\sigma_m\otimes1+a_2^{-1}1\otimes\sigma_n+a_3^{-1}\sigma_m\otimes\sigma_n)$, the image of a product effect. Their spectra are indexed by $\epsilon\in\{\pm1\}^2$:
$$
\lambda_\epsilon=\tfrac14(1+\epsilon_1a_1+\epsilon_2a_2+\epsilon_1\epsilon_2a_3),\qquad
\mu_\epsilon=\tfrac14(1+\epsilon_1a_1^{-1}+\epsilon_2a_2^{-1}+\epsilon_1\epsilon_2a_3^{-1}).
\tag{8.8g.47.3}
$$
Invariance gives $\operatorname{tr}(UXU^\dagger Y)\ge0$ for all $U$, so the oppositely ordered pairing $\sum_i\lambda_i^{\downarrow}\mu_i^{\uparrow}$ is nonnegative. By orthogonality of the characters of $\mathbb Z_2^2$,
$$
\sum_\epsilon\lambda_\epsilon\mu_{\epsilon\eta}=\delta_{\eta,(1,1)},
\tag{8.8g.47.4}
$$
so the three nontrivial translations pair to zero and must each be oppositely ordered. For the pair $\{(+,+),(-,+)\}$ the translations by $(+,-)$ and $(-,-)$ give $(a_1+a_3)(a_1^{-1}-a_3^{-1})\le0$ and $\ge0$, hence $a_1^2=a_3^2$, and similarly $a_2^2=a_3^2$. So $(a_1,a_2,a_3)=\alpha(\varepsilon_1,\varepsilon_2,\varepsilon_3)$ with signs $\varepsilon_i$, and after replacing $\alpha$ by $-\alpha$ if necessary $\varepsilon_3=\varepsilon_1\varepsilon_2$. Let $D_\alpha(Z)=\alpha Z+(1-\alpha)\operatorname{tr}(Z)\tfrac14$, which commutes with conjugation and has inverse $D_{1/\alpha}$. Then $X=D_\alpha(p\otimes p')$ and $Y=D_\alpha^{-1}(p''\otimes p''')$ for product projectors, so the $SU(4)$-invariant cone $D_\alpha^{-1}C'$ and its dual both contain a product projector, hence all rank-one projectors, hence the positive-semidefinite cone; so $D_\alpha^{-1}C'$ is that cone. Therefore $C=\Phi^{-1}D_\alpha(Q)$ is the image of $Q$ under the local antipodal map on the factors with $\varepsilon_i=-1$. The local antipode is $\rho\mapsto\sigma_y\rho^{\mathsf T}\sigma_y$, so applying it on both factors preserves $Q$ and applying it on one factor gives $Q^\Gamma$.

4. Let $x$ be a normalized extreme point and $JC=C$. Then $\langle x,Jx\rangle=\tfrac14(1+\|r\|^2-\|c\|^2-\|T\|_F^2)\ge0$, and norm one gives $1+\|r\|^2\ge3-\|r\|^2$, so $\|r\|=1$. Taking $n=-r$ in (8.8g.47.1) gives $m\cdot(c-Tr)\ge0$ for all $m$, so $c=Tr$. For a unit vector $w\perp r$ and $n=-\cos\phi\,r+\sin\phi\,w$, the inequality $\|c+Tn\|\le1+r\cdot n$ reads $\|(1-\cos\phi)c+\sin\phi\,Tw\|\le1-\cos\phi$; dividing by $\phi$ and letting $\phi\to0$ gives $Tw=0$. Hence $T=cr^{\mathsf T}$ and $\|T\|_F=\|c\|$, and $\|c\|^2+\|T\|_F^2=2$ gives $\|c\|=1$: $x$ is a product of pure states. So $C=K_{\min}$. The case $CJ=C$ is the transpose. The element $\tfrac12\operatorname{diag}(1,R)$ pairs with $p_mp_n^{\mathsf T}$ to $\tfrac14(1+m^{\mathsf T}Rn)\ge0$, while every normalized element of $K_{\min}$ has $T$ in the convex hull of the matrices $mn^{\mathsf T}$ and therefore $|\operatorname{tr}(R^{\mathsf T}T)|\le1<s$; thus $K_{\min}\ne K_{\max}$. ∎

Composites of balls under transitivity on pure states or continuous reversible interaction are treated by Dakić and Brukner (2011), de la Torre, Masanes, Short and Müller (2012) and Masanes, Müller, Augusiak and Pérez-García (2013). The hypotheses of Proposition 8.8g.47 are local covariance together with the stated stabilizer dimension or antipode invariance.

<a id="proposition-88g48-depth-and-width-conditions-on-a-lorentz-five-completion"></a>**Proposition 8.8g.48 (Depth and Width Conditions on a Lorentz-Five Completion).** Retain the carrier of Theorem 8.8g.23 and the notation of Theorem 8.8g.36: $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ is all-pure, $\mathcal T=C\cap\mathcal Q$ is its pure set, and members of $\mathcal Q$ are written $q=\tfrac12\left(\begin{smallmatrix}1&b^{\mathsf T}\\a&T_q\end{smallmatrix}\right)$.

1. For every $Y\in W$ with $0\le t=e(Y)<\|Y\|_F$, and $f=\|Y\|_F^2$, some $q\in\mathcal T$ satisfies
$$
\langle Y,q\rangle\le-\frac{\sqrt{12f-3t^2}-3t}{12}.
\tag{8.8g.48.1}
$$
2. For $O\in O(4)$ put $w(O)=-\min_{q\in\mathcal T}\tfrac12\operatorname{tr}(T_q^{\mathsf T}O)$. Then
$$
\frac1{\sqrt3}\le w(O)\le\sqrt3,\qquad
4w(O)w(R)+\operatorname{tr}(O^{\mathsf T}R)\ge0\quad(O,R\in O(4)),\qquad
w(O)\,w(-O)\ge1.
\tag{8.8g.48.2}
$$
If $w(O)=1/\sqrt3$, then $\tfrac12\operatorname{diag}(1,\tfrac{\sqrt3}2O)\in\mathcal T$ and $w(-O)=\sqrt3$.
3. $|w(O)-w(R)|\le\tfrac{\sqrt3}2\|O-R\|_F$, and each of the two components of $O(4)$ contains some $O$ with $w(O)=w(-O)\ge1$.
4. The product bound in (8.8g.48.2) is attained on an acute family. Identify $\mathbb R^4$ with the quaternions, let $L(s)$ be left multiplication by $s$, choose any $O\in O(4)$ and the four quaternions
$$
s_1=1+i+j,\quad s_2=1-i-j,\quad s_3=-1+i-j,\quad s_4=-1-i+j,
\qquad q_i=\tfrac12\operatorname{diag}\bigl(1,\tfrac12L(s_i)O\bigr).
\tag{8.8g.48.3}
$$
The $q_i$ are strictly Lorentz-positive members of $\mathcal Q$, mutually orthogonal, with $\sum_iq_i=U$; the family $\mathcal P\cup\{q_1,\ldots,q_4\}$ is acute, and the minimum of $\tfrac12\operatorname{tr}(T^{\mathsf T}(\pm O))$ over it equals $-1$ for both signs. The orientation $O$ and the four quaternions are chosen; the family is an example of acute unit states, and Proposition 8.8g.53 gives its bounded self-dual completions.

*Proof.* All-purity gives $\{x\in C:e(x)=1\}=\operatorname{conv}\mathcal T$, so $\|x\|_F\le e(x)$ on $C$, and $\mathcal T$ is compact.

1. Put $\beta=\max\{0,-\min_{\mathcal T}\langle Y,q\rangle\}$. Since $\langle U,q\rangle=1$ on $\mathcal T$, the matrix $Y+\beta U$ pairs nonnegatively with $\mathcal T$ and belongs to $C^*=C$. With $\langle Y,U\rangle=t$ and $\|U\|_F^2=e(U)=4$, the norm bound reads $f+2t\beta+4\beta^2\le(t+4\beta)^2$, that is $12\beta^2+6t\beta+t^2-f\ge0$. Because $f>t^2$, this forces $\beta\ge(\sqrt{12f-3t^2}-3t)/12>0$.

2. The matrix $H(O)=\operatorname{diag}(2w(O),O)$ satisfies $\langle H(O),q\rangle=w(O)+\tfrac12\operatorname{tr}(T_q^{\mathsf T}O)\ge0$ on $\mathcal T$, so $H(O)\in C$. It is nonzero, so $e(H(O))=4w(O)>0$, and $\|H(O)\|_F^2\le e(H(O))^2$ reads $4w(O)^2+4\le16w(O)^2$. The upper bound follows from $\|T_q\|_F\le\sqrt3$, a consequence of (8.8g.37.2), and $\|O\|_F=2$. Acuteness of $C$ gives $\langle H(O),H(R)\rangle=4w(O)w(R)+\operatorname{tr}(O^{\mathsf T}R)\ge0$, and $R=-O$ gives the product bound. If $w(O)=1/\sqrt3$, the normalized matrix $H(O)/e(H(O))=\tfrac12\operatorname{diag}(1,\tfrac{\sqrt3}2O)$ has norm one and therefore belongs to $\mathcal T$; its pairing gives $w(-O)\ge\sqrt3$.

3. The function $w$ is a maximum of linear functions of $O$ with coefficient norm $\tfrac12\|T_q\|_F\le\tfrac{\sqrt3}2$. With $R_\theta$ the planar rotation, the path $O_\theta=O\operatorname{diag}(R_\theta,R_\theta)$, $0\le\theta\le\pi$, joins $O$ to $-O$ inside one component, and $w(O_\theta)-w(-O_\theta)$ changes sign along it. At a zero, the product bound gives both values at least one.

4. One has $\|s_i\|^2=3$, $\langle s_i,s_j\rangle=-1$ for $i\ne j$ and $\sum_is_i=0$, while $L(s)^{\mathsf T}L(s)=\|s\|^2I_4$ and $\operatorname{tr}(L(s)^{\mathsf T}L(t))=4\langle s,t\rangle$. Hence $\|q_i\|_F^2=\tfrac14(1+3)=1$, $\langle q_i,q_j\rangle=\tfrac14(1-1)=0$ and $\sum_iq_i=2E_{00}$. The spatial block $\tfrac12L(s_i)O$ has operator norm $\sqrt3/2<1$, so $q_i$ maps $L\setminus\{0\}$ into the interior of $L$ and pairs positively with every product. Finally $\tfrac12\operatorname{tr}\bigl((\tfrac12L(s_i)O)^{\mathsf T}O\bigr)=\operatorname{Re}s_i\in\{1,-1\}$, while a product has $T=ab^{\mathsf T}$ with unit $a,b$ and $|\tfrac12\operatorname{tr}(T^{\mathsf T}O)|\le\tfrac12$. ∎

<a id="proposition-88g49-single-orientation-conformal-exclusion"></a>**Proposition 8.8g.49 (Single-Orientation Conformal Exclusion).** Fix $\varepsilon\in\{+1,-1\}$. No all-pure self-dual cone $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ on the Lorentz-five carrier has every entangled pure state of the form
$$
T_q=c_qR_q,\qquad c_q\ge0,\quad R_q\in O(4),\quad\det R_q=\varepsilon .
\tag{8.8g.49.1}
$$
The marginal vectors $a,b$ of the entangled pure states are unrestricted, and $c_q=0$ is allowed.

*Proof.* Equation (8.8g.37.2) gives $4c_q^2=\|T_q\|_F^2\le3$. Choose $R\in O(4)$ with $\det R=-\varepsilon$. The orthogonal matrix $R_q^{\mathsf T}R$ has determinant $-1$ in dimension four, so its spectrum contains $+1$ and $-1$, and the remaining two eigenvalues have sum in $[-2,2]$. Hence $|\operatorname{tr}(R_q^{\mathsf T}R)|\le2$ and $|\tfrac12\operatorname{tr}(T_q^{\mathsf T}R)|\le\sqrt3/2$; a product contributes at most $\tfrac12$. The same holds for $-R$, whose determinant is also $-\varepsilon$. Thus $w(R)\le\sqrt3/2$ and $w(-R)\le\sqrt3/2$, and $w(R)w(-R)\le3/4$ contradicts (8.8g.48.2). ∎

<a id="proposition-88g50-boost-mixtures-and-vanishing-product-pairing"></a>**Proposition 8.8g.50 (Boost Mixtures and Vanishing Product Pairing).** On the Lorentz-five carrier put $J=\operatorname{diag}(1,-I_4)$, and for $0<s<1$ put $r=\sqrt{1-s^2}$, $\alpha=\sqrt{3/(3+s^2)}$ and, in block sizes $1,1,3$,
$$
A_s^{\pm}=\frac12\begin{pmatrix}1&\pm r&0\\\pm r&1&0\\0&0&\pm sI_3\end{pmatrix},
\qquad
Q_s^{\pm}=(1-\alpha)\frac U4+\alpha A_s^{\pm}.
\tag{8.8g.50.1}
$$

1. $(A_s^{\pm})^{\mathsf T}JA_s^{\pm}=\tfrac{s^2}4J$, $e(A_s^{\pm})=1$ and $\|A_s^{\pm}\|_F^2=1+\tfrac{s^2}4$, so $A_s^{\pm}\in K_{\max}$. The matrices $Q_s^{\pm}$ are strictly Lorentz-positive members of $\mathcal Q$ of rank five, and
$$
\langle Q_s^+,Q_s^-\rangle=-\frac{s^2}{2(3+s^2)},\qquad
\bigl\|Q_s^{\pm}-p_{\pm e_1}p_{\pm e_1}^{\mathsf T}\bigr\|_F^2
=\frac{(1-\alpha r)^2}2+\frac{(1-\alpha)^2}4+\frac{3\alpha^2s^2}4\le\frac{23}{16}s^2 .
\tag{8.8g.50.2}
$$
2. Let $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ be all-pure with entangled pure set $E$. For every $p\in\mathcal P$,
$$
\inf_{q\in E}\langle p,q\rangle=0 .
\tag{8.8g.50.3}
$$
No countability or distance hypothesis is used. Consequently $E$ lies in no compact subset of the interior of $K_{\max}$. When $\operatorname{dist}(p,E)>0$ the infimum is attained, because (8.8g.36.5) then gives a member of $E$ orthogonal to $p$.
3. Let $F\subset\mathcal Q$ be finite and $C_F=\operatorname{cone}(\mathcal P\cup F)$. Every product is a limit of strictly Lorentz-positive members of $\mathcal Q$ lying in $C_F^*\setminus C_F$; these are spatially rotated copies of $Q_s^+$. This exhibits the missing dual states in the finite case of Theorem 8.8g.36.

*Proof.* 1. Direct multiplication gives the three identities for $A_s^{\pm}$. Each $A_s^{\pm}$ is $s/2$ times a Lorentz transformation with future-directed first column, so it maps $L$ onto $L$, and $U/4=E_{00}/2$ maps $L\setminus\{0\}$ into the interior of $L$; since $0<\alpha<1$, so does $Q_s^{\pm}$. Its time entry is $1/2$ and $\|Q_s^{\pm}\|_F^2=\tfrac14+\tfrac{\alpha^2}4(3+s^2)=1$. The upper two-by-two block has determinant $\tfrac14\alpha(1-\alpha r^2)>0$ and the transverse block is $\pm\tfrac12\alpha sI_3$, which gives rank five. The entries give $\langle Q_s^+,Q_s^-\rangle=\tfrac14+\tfrac{\alpha^2}4(1-2r^2-3s^2)$ and the displayed displacement. For the bound use $1-\alpha\le s^2/6\le s/6$ and $1-r\le s^2\le s$, whence $1-\alpha r\le7s/6$ and the right side is at most $(\tfrac{49}{72}+\tfrac1{144}+\tfrac34)s^2$.

2. Let $p=p_ap_b^{\mathsf T}$ and choose $g_a,g_b\in SO(4)$ with $g_ae_1=a$, $g_be_1=b$. The matrix $A=\operatorname{diag}(1,g_a)A_s^+\operatorname{diag}(1,g_b)^{\mathsf T}$ lies in $K_{\max}$ and has norm above one, while the normalized base of $C$ lies in the unit ball; so $A\notin C=C^*$ and some $q_s\in\mathcal T$ has $\langle A,q_s\rangle<0$. This $q_s$ is not a product, because $A\in K_{\max}$. Acuteness gives
$$
0\le\langle p,q_s\rangle=\langle p-A,q_s\rangle+\langle A,q_s\rangle<\|p-A\|_F,
$$
and $\|p-A\|_F\to0$ as $s\to0$. A compact subset of the interior of $K_{\max}$ has a positive minimum pairing with the nonzero $p\in K_{\min}$.

3. For $g\in F$ the function $(a,b)\mapsto p_a^{\mathsf T}gp_b$ is nonnegative, and its zero set is closed and nowhere dense by the argument given for $Z_q$ in Theorem 8.8g.36, which uses only $g\ne0$. Hence the set of $(a,b)$ at which every $g\in F$ pairs positively with $p=p_ap_b^{\mathsf T}$ is open and dense. At such a point let $\delta>0$ be the least pairing and let $q_s$ be the rotated copy of $Q_s^+$ as in item 2. By (8.8g.50.2), $\langle q_s,g\rangle\ge\delta-\|q_s-p\|_F>0$ for small $s$, and $q_s$ pairs positively with every product; so $q_s\in C_F^*$. The normalized base of $C_F$ is $\operatorname{conv}(\mathcal P\cup F)$, whose unit vectors are the members of $\mathcal P\cup F$ by strict convexity of the norm. The unit vector $q_s$ has rank five, so it is not a product, and it differs from the finitely many members of $F$ for all but finitely many $s$. Hence $q_s\notin C_F$. Density of the admissible $(a,b)$ gives every product as a limit. ∎

<a id="proposition-88g51-one-sided-boost-shortening"></a>**Proposition 8.8g.51 (One-Sided Boost Shortening).** For $q=\tfrac12\left(\begin{smallmatrix}1&b^{\mathsf T}\\a&T\end{smallmatrix}\right)\in\mathcal Q$ on the Lorentz-five carrier put
$$
\delta_L(q)=1+2\|a\|^2-3\|b\|^2,\qquad\delta_R(q)=1+2\|b\|^2-3\|a\|^2 .
\tag{8.8g.51.1}
$$
By Corollary 8.8g.39 both are positive on $\mathcal Q\setminus\mathcal P$, and both vanish on $\mathcal P$. For $i=1,\ldots,4$ let $G_i^{\pm}$ be the Lorentz boost equal to the identity except for the entries $(G_i^{\pm})_{00}=(G_i^{\pm})_{ii}=5/4$ and $(G_i^{\pm})_{0i}=(G_i^{\pm})_{i0}=\pm3/4$, and put $\Phi(X)=\|X\|_F^2-e(X)^2$. Then
$$
\sum_{i=1}^4\sum_{\pm}\Phi(G_i^{\pm}q)=-\frac9{16}\delta_L(q),\qquad
\sum_{i=1}^4\sum_{\pm}\Phi(qG_i^{\pm})=-\frac9{16}\delta_R(q).
\tag{8.8g.51.2}
$$
Consequently one of the eight left images $X=G_i^{\pm}q$, and one of the eight right images $X=qG_i^{\pm}$, satisfies respectively
$$
\Bigl\|\frac X{e(X)}\Bigr\|_F^2\le1-\frac{9\,\delta_L(q)}{512},\qquad
\Bigl\|\frac X{e(X)}\Bigr\|_F^2\le1-\frac{9\,\delta_R(q)}{512}.
\tag{8.8g.51.3}
$$
A closed cone $K_{\min}\subseteq C\subseteq K_{\max}$ whose normalized extreme points all have norm one, with $G_i^{\pm}C\subseteq C$ for all eight left boosts or with $CG_i^{\pm}\subseteq C$ for all eight right boosts, equals $K_{\min}$. In particular every all-pure self-dual intermediate cone fails this invariance on each side; self-duality of $C$ is not used in the exclusion.

*Proof.* The square $(G_i^{\pm})^2$ has time-$i$ block $\left(\begin{smallmatrix}17/8&\pm15/8\\\pm15/8&17/8\end{smallmatrix}\right)$, so $\sum_{i,\pm}(G_i^{\pm})^2=8I_5+9E_{00}+\tfrac94\sum_{i\ge1}E_{ii}$. The time row of $q$ has squared norm $(1+\|b\|^2)/4$ and $\|q\|_F=1$, hence
$$
\sum_{i,\pm}\|G_i^{\pm}q\|_F^2=8+\frac94\bigl(1+\|b\|^2\bigr)+\frac94\Bigl(1-\frac{1+\|b\|^2}4\Bigr).
$$
Also $e(G_i^{\pm}q)=\tfrac54\pm\tfrac34a_i$, so $\sum_{i,\pm}e(G_i^{\pm}q)^2=\tfrac{25}2+\tfrac98\|a\|^2$. Subtracting gives the left identity in (8.8g.51.2); the right one is its transpose. One of the eight left values of $\Phi$ is therefore at most $-\tfrac9{128}\delta_L(q)$. Since $|a_i|\le1$, its normalization lies in $[\tfrac12,2]$, and $\|X/e(X)\|_F^2=1+\Phi(X)/e(X)^2$ gives (8.8g.51.3).

Each $G_i^{\pm}$ preserves $L$, and $G_i^-=(G_i^+)^{-1}$. If the eight left boosts map $C$ into itself they are automorphisms of $C$ and map extreme rays to extreme rays. An entangled pure state $q$ has $\delta_L(q)>0$, so one image ray has a normalized generator of norm below one, contrary to all-purity. Thus every normalized extreme point is a product and $C=K_{\min}$, which differs from its dual $K_{\max}$: the matrix $I_5/2\in K_{\max}$ has norm $\sqrt5/2>1$. ∎

<a id="proposition-88g52-pure-patch-dimension-bound"></a>**Proposition 8.8g.52 (Pure-Patch Dimension Bound).** Let $C$ be a proper self-dual cone in a Euclidean space of dimension $N$, let $u\in\operatorname{int}C$, $B=\{x\in C:\langle u,x\rangle=1\}$ and $\rho=\|u\|^2$, and assume that every extreme point of $B$ has norm one. For every extreme point $p$ of $B$ the exposed face $F_p=C\cap p^\perp$ contains $u-p$ and
$$
\dim\operatorname{span}F_p\ge\lceil\rho\rceil-1 .
\tag{8.8g.52.1}
$$
Every $C^1$ embedded submanifold $M$ of the affine hyperplane $\langle u,x\rangle=1$ that consists of extreme points of $B$ satisfies
$$
\dim M\le N-\lceil\rho\rceil .
\tag{8.8g.52.2}
$$
On the Lorentz-five carrier $N=25$ and $\rho=\|U\|_F^2=4$: every $C^1$ manifold of pure states of an all-pure self-dual intermediate cone has dimension at most $21$, and with Theorem 8.8g.42 a semialgebraic entangled pure locus satisfies $4\le\dim E\le21$. The bound (8.8g.52.2) is attained by every Lorentz cone, where $N=d+1$, $\rho=2$ and the pure states form a sphere of dimension $d-1$.

*Proof.* The Cauchy–Schwarz inequality gives $1=\langle u,p\rangle\le\sqrt\rho$. For normalized $z\in C$ one has $\|z\|\le1$ and $\langle u-p,z\rangle=1-\langle p,z\rangle\ge0$, so $u-p\in C^*=C$, and $\langle u-p,p\rangle=0$. If $\rho=1$ the bound (8.8g.52.1) is empty. Let $\rho>1$ and $k=\dim\operatorname{span}F_p$. The nonzero vector $u-p$ is a positive combination of at most $k$ normalized extreme points $t_i$ of the face $F_p$, which are extreme points of $B$ and hence unit vectors:
$$
u-p=\sum_{i=1}^m\lambda_it_i,\qquad m\le k,\quad\lambda_i>0,\quad\langle p,t_i\rangle=0 .
$$
Pairing with $t_i$ and using acuteness gives $1=\lambda_i+\sum_{j\ne i}\lambda_j\langle t_j,t_i\rangle\ge\lambda_i$. Pairing with $u$ gives $\sum_i\lambda_i=\rho-1$. Hence $k\ge m\ge\rho-1$.

Let $p\in M$. For every $y\in F_p$ the function $x\mapsto\langle y,x\rangle$ is nonnegative on $M$ and vanishes at $p$, so its derivative vanishes and $T_pM\perp\operatorname{span}F_p$. Also $p\perp F_p$, and $p\notin T_pM$ because $\langle u,p\rangle=1$ while $u$ annihilates $T_pM$. Therefore $\dim M+1\le N-k\le N-\lceil\rho\rceil+1$. A semialgebraic set of dimension $d$ contains a $C^1$ embedded submanifold of dimension $d$, which gives the semialgebraic statement. ∎

<a id="proposition-88g53-bounded-self-dual-completions-with-prescribed-unit-states"></a>**Proposition 8.8g.53 (Bounded Self-Dual Completions with Prescribed Unit States).** Retain the Lorentz-five carrier of Theorem 8.8g.23 and put $D=\{x\in W:\|x\|_F\le e(x)\}$.

1. Let $S\subseteq\mathcal Q$ be any family, finite or infinite, with $\langle s,t\rangle\ge0$ for all $s,t\in S$. There is a closed cone $C$ with
$$
K_{\min}\subseteq C=C^*\subseteq K_{\max}\cap D,\qquad S\subset C .
\tag{8.8g.53.1}
$$
Its normalized base lies in the Frobenius unit ball, every member of $S$ and every pure product is an exposed extreme point of that base, and its operational capacity is four. Such a cone is a *bounded* self-dual completion: its normalized extreme points have norm at most one, and norm one is proved only for the unit vectors it contains.
2. With $D_0=\operatorname{diag}(1,1,1,0)$, $D_1=\operatorname{diag}(1,-1,-1,0)$, $D_2=\operatorname{diag}(-1,1,-1,0)$, $D_3=\operatorname{diag}(-1,-1,1,0)$ and the orthogonal matrix
$$
R=\begin{pmatrix}-3/4&-\sqrt7/4&0&0\\\sqrt7/4&-3/4&0&0\\0&0&1/2&-\sqrt3/2\\0&0&\sqrt3/2&1/2\end{pmatrix},
\qquad x_i=\tfrac12\operatorname{diag}(1,D_i),\quad y_i=\tfrac12\operatorname{diag}(1,RD_i),
\tag{8.8g.53.2}
$$
the families $\{x_i\}$ and $\{y_i\}$ are orthonormal subsets of $\mathcal Q$ with $\sum_ix_i=\sum_iy_i=U$, and
$$
\bigl(\langle x_i,y_j\rangle\bigr)_{i,j=0}^3=
\begin{pmatrix}0&1/8&1/8&3/4\\1/8&0&3/4&1/8\\1/8&3/4&0&1/8\\3/4&1/8&1/8&0\end{pmatrix}.
\tag{8.8g.53.3}
$$
A cone as in item 1 containing both frames is not invariant under the local rotation group generated by $\widehat A=\operatorname{diag}(0,A)$, where $A_{12}=-1$, $A_{21}=1$ and the other entries of $A\in\mathfrak{so}(4)$ vanish: $\langle y_0,x_0\rangle=0$ and $\langle y_0,\widehat Ax_0\rangle=\sqrt7/8$.
3. Put $\mathsf J=\operatorname{diag}\left(\left(\begin{smallmatrix}0&-1\\1&0\end{smallmatrix}\right),\left(\begin{smallmatrix}0&-1\\1&0\end{smallmatrix}\right)\right)$ and
$$
v=\tfrac12\operatorname{diag}\bigl(1,-\tfrac13I_4\bigr),\qquad
z_0=\tfrac12\operatorname{diag}\bigl(1,\tfrac34I_4+\tfrac{\sqrt3}4\mathsf J\bigr).
\tag{8.8g.53.4}
$$
There is a cone as in item 1 that contains $\mathcal P$, both frames of item 2 and $v$, and in which the ray of $v$ is an exposed extreme ray; its normalized generator has $\|v\|_F=\sqrt{13}/6<1$. Hence boundedness, self-duality, unit products, two complete unit frames and capacity four do not entail all-purity. The state $v$ and the supporting unit states in the proof are chosen to force this outcome.
4. The set $\Sigma=\{x\in W:e(x)=1,\ \langle v,x\rangle=0,\ \|x\|_F=1,\ \|x-z_0\|_F<1/50\}$ is a $22$-dimensional sphere patch inside $\mathcal Q$, and $\mathcal P\cup\Sigma$ is acute. Item 1 gives bounded self-dual completions containing it, and Proposition 8.8g.52 shows that none of them, and no other self-dual intermediate cone containing $\Sigma$, is all-pure. An acute family of unit states therefore need not extend to an all-pure self-dual cone.

*Proof.* 1. Write $z=\theta\,U/2+z'$ with $z'\perp U$. Then $D=\{\theta\ge0,\ \|z'\|_F\le\sqrt3\,\theta\}$ and $D^*=\{\theta\ge0,\ \|z'\|_F\le\theta/\sqrt3\}$, so $D^*\subseteq D$ and $D^*$ is acute. The products and the members of $S$ are unit vectors with $e=1$, so $K_{\min}\cup S\subseteq D$ and both pair nonnegatively with $D^*$; products pair nonnegatively with $S\subseteq K_{\max}$ and with one another. Hence $D_S=\overline{\operatorname{cone}}(K_{\min}\cup S\cup D^*)$ is acute. Order the closed acute convex cones containing $D_S$ by inclusion. The closure of the union of a chain is again one, so Zorn's lemma gives a maximal member $C$. Acuteness is $C\subseteq C^*$. If $y\in C^*\setminus C$, the closed cone generated by $C$ and $y$ is acute and strictly larger. Thus $C=C^*$, and $C\supseteq K_{\min}\cup D^*$ gives $C\subseteq K_{\max}\cap D$. For a unit vector $s$ of the base and any normalized $z\in C$, the Cauchy–Schwarz inequality gives $\langle s,z\rangle\le1$ with equality only for $z=s$; so $U-s\in C^*=C$ exposes the ray of $s$. The four products $p_{\pm a}p_{\pm b}^{\mathsf T}$ are orthonormal and sum to $U$, so they are distinguished by their own effects. If effects $f_1,\ldots,f_m\in C$ with $\sum_if_i=U$ distinguish normalized states $\omega_i$, then $1=\langle f_i,\omega_i\rangle\le\|f_i\|_F\le e(f_i)$, and summation gives $m\le e(U)=4$.

2. For $T=D_i$ or $T=RD_i$ one has $\|T\|_{\rm op}=1$ and $\|T\|_F^2=3$, so $\tfrac12\operatorname{diag}(1,T)$ is normalized, has norm one, and pairs with $p_ap_b^{\mathsf T}$ to $\tfrac14(1+a^{\mathsf T}Tb)\ge0$. Since $\operatorname{tr}(D_iD_j)=-1$ for $i\ne j$ and $\sum_iD_i=0$, both families are orthonormal and sum to $U$. The diagonal entries $R_{11}=R_{22}=-3/4$, $R_{33}=1/2$ give $\langle x_i,y_j\rangle=\tfrac14(1+\operatorname{tr}(D_iRD_j))$ as displayed. If $\exp(\theta\widehat A)C=C$ for all real $\theta$, the function $\theta\mapsto\langle y_0,\exp(\theta\widehat A)x_0\rangle$ is nonnegative and vanishes at $0$, so its derivative $\langle y_0,\widehat Ax_0\rangle=\tfrac14\operatorname{tr}\bigl((RD_0)^{\mathsf T}AD_0\bigr)=\sqrt7/8$ would vanish.

3. One has $e(v)=e(z_0)=1$, $\|v\|_F^2=13/36$, $\|z_0\|_F=1$ and $\langle v,z_0\rangle=0$; the spatial block $T_0$ of $2z_0$ satisfies $T_0^{\mathsf T}T_0=\tfrac34I_4$, so $z_0$ pairs with every product by at least $(2-\sqrt3)/8>1/32$, and $v$ by at least $1/6$. The pairings with the frames are
$$
\langle z_0,x_i\rangle=\bigl(\tfrac{13}{16},\tfrac1{16},\tfrac1{16},\tfrac1{16}\bigr),\quad
\langle z_0,y_i\rangle=\bigl(\tfrac{5+\sqrt{21}}{32},\tfrac1{16},\tfrac1{16},\tfrac{23-\sqrt{21}}{32}\bigr),\quad
\langle v,x_i\rangle=\bigl(0,\tfrac13,\tfrac13,\tfrac13\bigr),\quad
\langle v,y_i\rangle=\bigl(\tfrac13,\tfrac7{24},\tfrac7{24},\tfrac1{12}\bigr).
$$
The affine space $\mathsf A=\{z:e(z)=1,\langle v,z\rangle=0\}$ has dimension $23$; its point nearest the origin is $q_\circ=\tfrac12\operatorname{diag}(1,\tfrac34I_4)$ with $\|q_\circ\|_F^2=13/16$, so its unit vectors form the sphere of radius $\varrho=\sqrt3/4$ about $q_\circ$, which contains $z_0$. Put $\hat h=(z_0-q_\circ)/\varrho$, let $w_1,\ldots,w_{22}$ be an orthonormal basis of the directions of $\mathsf A$ orthogonal to $\hat h$, and with $\epsilon=1/100$, $\gamma=\sqrt{\varrho^2-\epsilon^2}$ define the $24$ unit states
$$
z_i=q_\circ+\gamma\hat h+\epsilon w_i\ (1\le i\le22),\qquad z_{23}=q_\circ+\gamma\hat h-\epsilon w_1 ,
$$
together with $z_0$. Each satisfies $\|z_i-z_0\|_F\le\sqrt2\,\epsilon<1/50$. Their differences from $z_0$ span the direction space of $\mathsf A$, so the $24$ states span the hyperplane $v^\perp$. They pair with every product above $1/32-1/50$, with every frame state above $1/16-1/50$, with one another above $1-1/1250$, and with $v$ to zero. All these generators lie in $D$, so the Zorn argument of item 1, applied to $K_{\min}$, the frames, the $z_i$, $v$ and $D^*$, gives a cone $C$ as in (8.8g.53.1) containing them. Let $\omega=\sum_{i=0}^{23}z_i\in C$. If $x\in C$ and $\langle\omega,x\rangle=0$, every summand $\langle z_i,x\rangle$ vanishes, so $x\in(v^\perp)^\perp=\mathbb Rv$, and $e(x)\ge0$ gives $C\cap\omega^\perp=\mathbb R_+v$.

4. By item 3 the unit vectors of $\mathsf A$ form a $22$-sphere about $q_\circ$, and $\Sigma$ is its open patch around $z_0$. Its members pair with every product above $1/32-1/50$, hence lie in $\mathcal Q$, and with one another above $1-1/1250$. If a self-dual intermediate cone with unit pure states contained $\Sigma$, every point of $\Sigma$ would be a unit vector of its base and hence an extreme point, and $\Sigma$ would be a $C^1$ manifold of pure states of dimension $22>21$, contrary to (8.8g.52.2). ∎

<a id="theorem-88g54-saturation-and-generation-criterion-for-all-pure-completion"></a>**Theorem 8.8g.54 (Saturation and Generation Criterion for All-Pure Completion).** On the Lorentz-five carrier call a finite set $S\subset\mathcal Q$ a *pool* when $\langle s,t\rangle\ge0$ for all $s,t\in S$; the empty set is a pool. With $D$ as in Proposition 8.8g.53 define
$$
\begin{gathered}
\mathcal B(S)=\{x\in K_{\max}:e(x)=1,\ \|x\|_F\le1,\ \langle s,x\rangle\ge0\ (s\in S)\},\qquad
\mathcal Q(S)=\mathcal B(S)\cap\mathcal Q,\\
\operatorname{sat}(S)=\max\Bigl\{0,-\min_{q,r\in\mathcal Q(S)}\langle q,r\rangle\Bigr\},\qquad
\operatorname{gen}(S)=\max_{x\in\mathcal B(S)}\operatorname{dist}\bigl(x,\operatorname{conv}\mathcal Q(S)\bigr).
\end{gathered}
\tag{8.8g.54.1}
$$
The saturation error measures failure of mutual acuteness of the unit states compatible with $S$; the generation error measures failure of those unit states to generate the clipped dual body. For a pool $S_0$ the following are equivalent.

1. There is an all-pure self-dual cone $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ containing $S_0$.
2. There are pools $S_n\supseteq S_0$ with $\operatorname{sat}(S_n)\to0$ and $\operatorname{gen}(S_n)\to0$.
3. For every integer $n\ge1$ there is a pool $S_n\supseteq S_0$ with
$$
|S_n|\le|S_0|+(1+6n)^{24},\qquad\operatorname{sat}(S_n)\le\frac1n,\qquad\operatorname{gen}(S_n)\le\frac1n .
\tag{8.8g.54.2}
$$

The pools need not be nested. If $C$ is as in assertion 1 with pure set $\mathcal T$ and $S\subseteq\mathcal T$ is a finite $\delta$-net of $\mathcal T$, then
$$
\operatorname{gen}(S)\le\frac{2\sqrt3\,\delta}{1+4\delta},\qquad\operatorname{sat}(S)\le2\delta+4\delta^2 .
\tag{8.8g.54.3}
$$
The level $n=1$ of assertion 3 holds for the empty pool: $\operatorname{sat}(\varnothing)\le1/2$ and $\operatorname{gen}(\varnothing)\le\sqrt3/2$. With $S_0=\varnothing$ the theorem characterizes the unrestricted completion predicate of Theorem 8.8g.24; for fixed $n$ the condition (8.8g.54.2) is a first-order sentence over the real field with rational coefficients and alternating quantifiers, while each system of Theorem 8.8g.24 is existential.

*Proof.* Every unit normalized state lies on the sphere of radius $\sqrt3/2$ about $U/4$ in the $24$-dimensional affine hyperplane $e=1$, because $\|q-U/4\|_F^2=1-\tfrac12+\tfrac14$. Assertion 3 implies assertion 2.

*From 2 to 1.* Put $\mathcal B_n=\mathcal B(S_n)$ and $\mathcal Q_n=\mathcal Q(S_n)$, nonempty compact subsets of the compact set $\mathcal Q$ and of the unit ball. Pass to a subsequence along which $\mathcal Q_n\to\mathcal T$ in Hausdorff distance. The limit $\mathcal T\subseteq\mathcal Q$ is compact, contains $\mathcal P\cup S_0$, and is acute, since $q,r\in\mathcal T$ are limits of $q_n,r_n\in\mathcal Q_n$ with $\langle q_n,r_n\rangle\ge-\operatorname{sat}(S_n)$. Convex hulls are Hausdorff-continuous, so $\operatorname{conv}\mathcal Q_n\to\mathcal B:=\operatorname{conv}\mathcal T$, and $\operatorname{gen}(S_n)\to0$ gives $\mathcal B_n\to\mathcal B$. Let $C=\operatorname{cone}(\mathcal B)$. It is closed and acute, lies in $K_{\max}\cap D$, contains $K_{\min}$ and $S_0$, and its normalized extreme points lie in $\mathcal T$ and have norm one.

It remains to prove $C^*\subseteq C$. As in Proposition 8.8g.53, $D^*\subseteq D\cap K_{\max}$ and $D^*$ pairs nonnegatively with $S_n\subseteq D$; so the normalized base of $D^*$ lies in every $\mathcal B_n$, hence in $\mathcal B$, and $D^*\subseteq C$. Let $0\ne y\in C^*$. Then $y\in K_{\max}$ because $\mathcal P\subseteq C$, and $y\in D$ because $D^*\subseteq C$; in particular $e(y)>0$. Put $\eta_n=d_H(\mathcal B_n,\mathcal B)$. Every $s\in S_n$ belongs to $\mathcal B_n$, so some $b\in\mathcal B$ has $\|s-b\|_F\le\eta_n$ and $\langle y,s\rangle\ge-\|y\|_F\eta_n=:-\delta_n$. The matrix $y_n=y+\delta_nU$ pairs nonnegatively with $S_n$, lies in $K_{\max}$, and satisfies $\|y_n\|_F\le\|y\|_F+2\delta_n\le e(y)+4\delta_n=e(y_n)$. Hence $y_n/e(y_n)\in\mathcal B_n$, and letting $n\to\infty$ gives $y/e(y)\in\mathcal B$.

*From 1 to 3.* Let $\mathcal T=C\cap\mathcal Q$, so that $\{x\in C:e(x)=1\}=\operatorname{conv}\mathcal T$, and let $S\subseteq\mathcal T$ be a finite $\delta$-net of $\mathcal T$. It is a pool and $\mathcal T\subseteq\mathcal Q(S)$. For $x\in\mathcal B(S)$ and $t\in\mathcal T$ choose $s\in S$ with $\|t-s\|_F\le\delta$; then $\langle t,x\rangle\ge\langle s,x\rangle-\delta\ge-\delta$, so $x+\delta U$ pairs nonnegatively with $\mathcal T$ and belongs to $C^*=C$. Its normalization is $1+4\delta$, and $y=(x+\delta U)/(1+4\delta)$ satisfies
$$
\|x-y\|_F=\frac{\delta\|4x-U\|_F}{1+4\delta}\le\frac{2\sqrt3\,\delta}{1+4\delta},
$$
because $\|4x-U\|_F^2=16\|x\|_F^2-4\le12$. Since $y\in\operatorname{conv}\mathcal T\subseteq\operatorname{conv}\mathcal Q(S)$, this is the first bound in (8.8g.54.3). For $q,r\in\mathcal Q(S)$ the same argument puts $q+\delta U$ and $r+\delta U$ in $C$, and acuteness gives $\langle q,r\rangle+2\delta+4\delta^2\ge0$. A maximal $\delta$-separated subset of $\mathcal T$ is a $\delta$-net, and disjoint balls of radius $\delta/2$ about its points lie in the ball of radius $(\sqrt3+\delta)/2$ about $U/4$ in the hyperplane $e=1$; so it has at most $(1+\sqrt3/\delta)^{24}$ points. Adjoining $S_0\subseteq\mathcal T$ keeps a $\delta$-net inside $\mathcal T$. For $0<\varepsilon\le1$ take $\delta=\varepsilon/(2\sqrt3)$: the cardinality bound is $(1+6/\varepsilon)^{24}$, $\operatorname{gen}(S)\le\varepsilon/(1+2\varepsilon/\sqrt3)<\varepsilon$ and $\operatorname{sat}(S)\le\varepsilon/\sqrt3+\varepsilon^2/3<\varepsilon$. Setting $\varepsilon=1/n$ gives (8.8g.54.2).

*The empty pool.* Two members of $\mathcal Q$ satisfy $\langle q,r\rangle=\tfrac14+\langle q-U/4,r-U/4\rangle\ge\tfrac14-\tfrac34$. The point $U/4$ is the mean of the four products $p_{\pm a}p_{\pm b}^{\mathsf T}$, and every $x\in\mathcal B(\varnothing)$ has $\|x-U/4\|_F^2=\|x\|_F^2-\tfrac14\le\tfrac34$. Membership of $K_{\max}$ is the condition $(1,a)\,x\,(1,b)^{\mathsf T}\ge0$ for all $\|a\|,\|b\|\le1$, and by Carathéodory's theorem $\operatorname{gen}(S)\le1/n$ states that every $x\in\mathcal B(S)$ lies within $1/n$ of a convex combination of $25$ members of $\mathcal Q(S)$; this gives the first-order form. ∎

<a id="proposition-88g55-finite-pools-saturation-floor-finite-saturation-and-maximal-acute-families"></a>**Proposition 8.8g.55 (Finite Pools: Saturation Floor, Finite Saturation and Maximal Acute Families).** Retain the notation of Theorem 8.8g.54.

1. For every pool $S$ there are strictly Lorentz-positive $q^+,q^-\in\mathcal Q(S)$, pairing positively with every member of $S$, with $\langle q^+,q^-\rangle<0$. If $N=|S|\ge1$, then
$$
\operatorname{sat}(S)>\frac1{39200\,N^2}.
\tag{8.8g.55.1}
$$
Consequently $K_{\max}\cap D\cap S^*$ is not acute for any pool $S$: no self-dual cone is cut out of $K_{\max}\cap D$ by finitely many half-spaces $\langle s,\cdot\rangle\ge0$ with $s\in\mathcal Q$.
2. For every pool $S_0$ and every $\varepsilon>0$ there is a pool $S\supseteq S_0$ with
$$
\operatorname{sat}(S)\le\varepsilon,\qquad|S\setminus S_0|\le\Bigl(1+\frac{\sqrt3}\varepsilon\Bigr)^{24}.
\tag{8.8g.55.2}
$$
3. Every pool $S_0$ lies in a compact acute set $\mathcal T$ with $\mathcal P\subseteq\mathcal T\subseteq\mathcal Q$ that is maximal among acute subsets of $\mathcal Q$. For every compact acute $\mathcal T$ with $\mathcal P\subseteq\mathcal T\subseteq\mathcal Q$ the cone $\operatorname{cone}(\mathcal T)$ is all-pure, and it is self-dual exactly when
$$
\operatorname{conv}\mathcal T=\{x\in K_{\max}:e(x)=1,\ \|x\|_F\le1,\ \langle t,x\rangle\ge0\ (t\in\mathcal T)\}.
\tag{8.8g.55.3}
$$
The pure set of an all-pure self-dual intermediate cone is such a maximal family.

Thus the saturation error can be made arbitrarily small by finitely many additions and never vanishes at a finite stage, while the generation identity (8.8g.55.3) is the remaining requirement.

*Proof.* 1. For $g\in\mathcal Q$ and independent uniform $a,b\in S^3$ write $g(1,b)^{\mathsf T}=(\kappa(b),\beta(b))$ with $\kappa(b)=\tfrac12+h\cdot b$, where $(\tfrac12,h)$ is the time row of $g$. Lorentz positivity gives $\|h\|\le\tfrac12$ and $\|\beta(b)\|\le\kappa(b)$, and $\phi:=\langle p_ap_b^{\mathsf T},g\rangle=\tfrac12(\kappa(b)+a\cdot\beta(b))$. A coordinate $\zeta$ of a uniform point of $S^3$ has density $\tfrac2\pi\sqrt{1-\zeta^2}\le1$. Conditionally on $b$ with $\kappa(b)>0$, the event $\phi\le\delta$ with $\delta<\kappa/2$ requires the coordinate $\zeta$ of $a$ along $\beta(b)$ to satisfy $\kappa(1+\zeta)/2\le\delta$; hence $\Pr(\phi\le\delta\mid b)\le2\delta/\kappa(b)$, which also holds when $\delta\ge\kappa/2$. The symmetrized function $\tfrac12\bigl((\tfrac12+\theta\zeta)^{-1}+(\tfrac12-\theta\zeta)^{-1}\bigr)=\tfrac12(\tfrac14-\theta^2\zeta^2)^{-1}$ increases with $\theta\in[0,\tfrac12]$, so
$$
\mathbb E\bigl[\kappa(b)^{-1}\bigr]\le\frac4\pi\int_{-1}^1\sqrt{\frac{1-\zeta}{1+\zeta}}\,d\zeta=4,
\qquad\Pr(\phi\le\delta)\le8\delta .
$$
The pairing with $p_{-a}p_{-b}^{\mathsf T}$ has the same distribution. With $\delta=1/(20N)$ the union bound over the $2N$ pairings of the members of $S$ with $p^{\pm}=p_{\pm a}p_{\pm b}^{\mathsf T}$ is $16N\delta=4/5<1$, so some $(a,b)$ has all $2N$ pairings above $\delta$. Let $q^{\pm}=\operatorname{diag}(1,g_a)Q_s^{\pm}\operatorname{diag}(1,g_b)^{\mathsf T}$ with $g_ae_1=a$, $g_be_1=b$ and $s=\delta/4$, in the notation of Proposition 8.8g.50. By (8.8g.50.2), $\|q^{\pm}-p^{\pm}\|_F<2s=\delta/2$, so $q^{\pm}$ pairs with every member of $S$ above $\delta/2$, and $q^{\pm}\in\mathcal Q(S)$. Their mutual pairing is $-s^2/(2(3+s^2))=-\delta^2/(96+2\delta^2)<-\delta^2/98$, which is (8.8g.55.1). For the empty pool take any $s$. Both $q^{\pm}$ lie in $K_{\max}\cap D\cap S^*$, which is therefore not acute; a self-dual cone is acute.

2. Start with $S=S_0$. While $\operatorname{sat}(S)>\varepsilon$, choose $q,r\in\mathcal Q(S)$ with $\langle q,r\rangle<-\varepsilon$ and adjoin $q$; the result is a pool. For every earlier member $g$ one has $\langle g,r\rangle\ge0$, so $\|q-g\|_F\ge\langle g-q,r\rangle>\varepsilon$. The added states are therefore pairwise $\varepsilon$-separated points of the sphere of radius $\sqrt3/2$ about $U/4$ in the hyperplane $e=1$, and the volume comparison used for (8.8g.54.2) bounds their number by $(1+\sqrt3/\varepsilon)^{24}$. The procedure stops, and at its end $\operatorname{sat}(S)\le\varepsilon$.

3. The union of a chain of acute subsets of $\mathcal Q$ is acute, so Zorn's lemma gives a maximal acute $\mathcal T\supseteq\mathcal P\cup S_0$; its closure is acute and lies in the closed set $\mathcal Q$, so $\mathcal T$ is compact. Let $\mathcal T$ be compact and acute with $\mathcal P\subseteq\mathcal T\subseteq\mathcal Q$. The cone $\operatorname{cone}(\mathcal T)$ is closed, acute, contains $K_{\min}$ and lies in $K_{\max}\cap D$; its normalized extreme points lie in $\mathcal T$. If it is self-dual, its base is the right side of (8.8g.55.3). Conversely assume (8.8g.55.3). The normalized base of $D^*$ lies in the right side, so $D^*\subseteq\operatorname{cone}(\mathcal T)$. A nonzero $y\in\operatorname{cone}(\mathcal T)^*$ pairs nonnegatively with $\mathcal P$, $D^*$ and $\mathcal T$; so $y\in K_{\max}\cap D$ and $y/e(y)$ lies in the right side of (8.8g.55.3), hence in $\operatorname{conv}\mathcal T$. Finally, if $C$ is all-pure and self-dual and $q\in\mathcal Q$ pairs nonnegatively with its pure set, then $q\in C^*=C$ is a unit vector of the base and hence pure. ∎

<a id="theorem-88g56-every-pool-has-an-extension-without-all-pure-completion"></a>**Theorem 8.8g.56 (Every Pool Has an Extension without All-Pure Completion).** For every pool $S_0$ there are $\tau\in(0,1/100]$, a strictly Lorentz-positive $q\in\mathcal Q$ and a pool $\mathcal E\supseteq S_0$, obtained by adjoining $q$ and $46$ further strictly Lorentz-positive members of $\mathcal Q$, with the following properties.

1. Every $r\in W$ with $e(r)=\|r\|_F=1$ that pairs nonnegatively with the $47$ adjoined states satisfies $\langle q,r\rangle>\tau/10$.
2. No all-pure self-dual cone $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ contains $\mathcal E$.
3. Every pool $S\supseteq\mathcal E$ has $\operatorname{gen}(S)>\tau/10$.

The centre $q$, the parameter $\tau$ and the $46$ patch states are chosen in the proof and depend on $S_0$. The existence asserted in Theorem 8.8g.54 therefore concerns suitably chosen pools: unrestricted extension of a given pool can reach a pool with no all-pure completion, whose saturation error can still be reduced by Proposition 8.8g.55(2).

*Proof.* Proposition 8.8g.55(1) gives a strictly Lorentz-positive $q\in\mathcal Q$ with $\langle q,s\rangle>0$ for every $s\in S_0$. Put $m=U/4$, $\varrho=\sqrt3/2$, and let $z_1,\ldots,z_{23}$ be an orthonormal basis of $\{U,q\}^\perp$; $U$ and $q$ are independent because $\|U\|_F^2=4$ and $e(q)=\|q\|_F=1$. For $0<\tau\le1/100$ put $c=(1-\tau^2)/(1+\tau^2)$, $\sigma=2\tau/(1+\tau^2)$ and
$$
p_{k,\pm}=c\,q+(1-c)\,m\pm\sigma\varrho\,z_k,\qquad1\le k\le23 .
\tag{8.8g.56.1}
$$
Since $q-m$ has norm $\varrho$ and is orthogonal to $m$ and to every $z_k$, each $p_{k,\pm}$ has $e=1$ and norm one, and $\|p_{k,\pm}-q\|_F=2\varrho\tau/\sqrt{1+\tau^2}<2\tau$. The pairings of $q$ with the compact set $\mathcal P$ and with the finite set $S_0$ have positive minima; choose $\tau$ with $2\tau$ below half of each. Then every $p_{k,\pm}$ is strictly Lorentz-positive and pairs positively with $S_0$, any two of the $47$ states $q,p_{k,\pm}$ are within $4\tau$ and pair above $1-8\tau^2$, and $\mathcal E=S_0\cup\{q\}\cup\{p_{k,\pm}\}$ is a pool.

1. Let $r$ be as stated and $\beta=\langle q,r\rangle\in[0,1]$. Solving $\langle U,r\rangle=1$ and $\langle q,r\rangle=\beta$ gives
$$
r=\frac{1-\beta}3U+\frac{4\beta-1}3q+h,\qquad h\perp U,q,\qquad\|h\|_F^2=\frac{2+2\beta-4\beta^2}3 .
$$
Nonnegativity of $\langle p_{k,\pm},r\rangle=c\beta+\tfrac{1-c}4\pm\sigma\varrho\langle h,z_k\rangle$ for both signs, with $(1-c)/\sigma=\tau$, gives $|\langle h,z_k\rangle|\le\bigl((c/\sigma)\beta+\tau/4\bigr)/\varrho$. If $\beta\le\tau/10$, then $\|h\|_F^2\ge2/3$, while $c/\sigma\le1/(2\tau)$ gives
$$
\|h\|_F^2\le\frac{23}{\varrho^2}\Bigl(\frac1{20}+\frac1{400}\Bigr)^2=\frac{3381}{40000}<\frac23,
$$
a contradiction.

2. If such a $C$ contained $\mathcal E$, its normalized extreme points $r$ would be unit vectors pairing nonnegatively with $\mathcal E$, and $\langle U-q,r\rangle=1-\langle q,r\rangle\ge0$ would put $U-q$ in $C^*=C$. This nonzero vector is orthogonal to $q\in C$, so every extreme point in a positive decomposition of it is orthogonal to $q$, contrary to item 1.

3. Put $\kappa=\tau/10$, $\Psi=q-\kappa U$ and $\omega=(U-q)/3$. Then $e(\omega)=1$, $\|\omega\|_F^2=1/3$, and $\omega$ pairs nonnegatively with every unit normalized vector; so $\omega\in\mathcal B(S)$ for every pool $S$. For $S\supseteq\mathcal E$, item 1 gives $\langle\Psi,r\rangle>0$ on $\mathcal Q(S)$, hence $\langle\Psi,x\rangle\ge0$ on $\operatorname{conv}\mathcal Q(S)$, while $\langle\Psi,\omega\rangle=-\kappa$ and $\|\Psi\|_F^2=1-2\kappa+4\kappa^2<1$. Therefore $\operatorname{gen}(S)\ge\operatorname{dist}(\omega,\operatorname{conv}\mathcal Q(S))\ge\kappa/\|\Psi\|_F>\kappa$. ∎

<a id="theorem-88g57"></a>

<a id="theorem-88g57-finite-classification-of-norm-bounded-polyhedral-self-composites"></a>**Theorem 8.8g.57 (Finite Classification of Norm-Bounded Polyhedral Self-Composites).** Let $K$ be a proper polyhedral cone that is self-dual for its registered real Hilbert pairing, let $u\in\operatorname{int}K$, and suppose all extreme points of $\{x\in K:\langle u,x\rangle=1\}$ have norm one. Write $p_1,\ldots,p_m$ for these local pure states. On the full tensor carrier define $K_{\min}$ and $K_{\max}$ by (8.8g.17.2), and put $U=u\otimes u$ and $e_2(X)=\langle U,X\rangle$. Form the polytope
$$
\mathcal B_{\max}=\{X:e_2(X)=1,\ \langle X,p_i\otimes p_j\rangle\ge0\ (1\le i,j\le m)\}.
\tag{8.8g.57.1}
$$
Suppose every vertex of $\mathcal B_{\max}$ has norm at most one. Let $\mathcal V_1$ be its list of norm-one vertices. Then every all-pure self-dual intermediate is obtained by the following finite classification:

1. Enumerate the subsets $S\subseteq\mathcal V_1$ containing every $p_i\otimes p_j$. Retain the subsets with nonnegative pairings between all their elements.
2. For each retained $S$ enumerate the vertices of
   $$
   \mathcal B_S^*=\{X:e_2(X)=1,\ \langle X,s\rangle\ge0\ (s\in S)\}.
   \tag{8.8g.57.2}
   $$
   Keep $S$ exactly when every such vertex is a convex combination of $S$. The resulting cones are $\operatorname{cone}S$, each with normalized pure set exactly $S$.

The norm premise and every list and test can be evaluated exactly for algebraic local data. The premise holds for every polyhedral critical moment carrier of Theorem 8.8g.17 with $n=r^2$. It can also hold when no moment of the form (8.8g.17.1) exists.

*Proof.* The products in (8.8g.57.1) generate $K_{\min}$, so $\mathcal B_{\max}$ is the normalized slice of $K_{\max}$. To see boundedness, identify a tensor with its linear map $L$ as in Theorem 8.8g.17. Positivity gives $L(K)\subseteq K$. If $e_2(L)=\langle u,Lu\rangle=0$, then $Lu=0$ because $u$ is interior to $K^*=K$. Every $x\in K$ satisfies $0\le_K x\le_K t u$ for some $t\ge0$, and hence $0\le_K Lx\le_K tLu=0$. Since $K$ spans the local carrier, $L=0$. Thus $e_2$ has a strictly positive minimum on the compact intersection of $K_{\max}$ with the unit sphere, which bounds the slice. The finite inequalities in (8.8g.57.1) make it a compact polytope. Standard active-constraint enumeration gives its vertices by finite linear algebra, and the vertex norm check bounds the entire polytope by convexity. In a convex hull of vectors of norm at most one, equality of the norm with one forces every positive-weight vector to equal the resulting vector, by strict convexity of the Hilbert ball. Thus $\mathcal V_1$ is the entire unit locus of $\mathcal B_{\max}$. Each pure product is a unit vector in that polytope, so it belongs to $\mathcal V_1$ and is extreme there.

Let $C$ be an all-pure self-dual intermediate. Its compact normalized base is the convex hull of its extreme points, all in $\mathcal V_1$, and each pure product is in its base and remains extreme. The pure set therefore appears in step 1, since self-duality gives acuteness. Its cone is $C$, and the constraints of step 2 are exactly the normalized slice of $C^*=C$. Conversely let $S$ pass both tests. The finitely generated cone $C_S=\operatorname{cone}S$ is closed since its normalized slice is compact, and $K_{\min}\subseteq C_S\subseteq K_{\max}$. Its acuteness gives $C_S\subseteq C_S^*$, and the product inclusion gives $C_S^*\subseteq K_{\max}$. The dual slice in step 2 is therefore compact and every nonzero dual vector has positive normalization. The vertex test proves $C_S^*\subseteq C_S$. Each $s\in S$ is extreme in $\operatorname{conv}S$ by strict convexity of the Hilbert ball, and there are no other extreme points. This proves both directions and gives an exact decision for the declared subclass. The vertex norm condition at $n=r^2$ follows from (8.8g.17.4).

For a local carrier without the moment, use the regular pentagon cone of Theorem 8.8g.21 in an orthogonal sum with a unit ray. The pentagon has local dimension $3$, order-unit squared norm $r_5=1+\sec(\pi/5)$ and the strict moment $3<r_5^2$. On the four-dimensional sum the squared order-unit norm is $r=r_5+1=2+\sec(\pi/5)<4$. Every local pure state is supported in one summand. Hence its second moment, for any probability measure on the pure set, has zero off-diagonal blocks between the summands. An exact moment $\alpha I+\beta|u\rangle\langle u|$ would then require $\beta=0$, since both order-unit components are nonzero. Its trace and its value at $u$ would give $4\alpha=1$ and $\alpha r=1$, contrary to $r<4$. The block norm bound (8.8g.20.7) places this example in the classified polyhedral domain. The diagonal pentagon block would need an all-pure self-dual composite, which Theorems 8.8g.19–8.8g.20 exclude. For a positive instance, the ordinary orthant has the product orthant as its sole completion by (8.8g.19.2) and its converse. ∎

<a id="theorem-88g58"></a>

<a id="theorem-88g58-lorentz-composite-hausdorff-and-marginal-constraints"></a>**Theorem 8.8g.58 (Lorentz Composite Hausdorff and Marginal Constraints).** Let $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ be an all-pure intermediate for two copies of the Lorentz cone $L_s\subset\mathbb R^{s+1}$ of Proposition 8.8g.47, with $s\ge4$. Use the Frobenius pairing, $e(X)=2X_{00}$, $U=2E_{00}$ and $\mathcal Q=\{q\in K_{\max}:e(q)=\|q\|_F=1\}$. Write $\mathcal P=\{p_ap_b^{\mathsf T}:a,b\in S^{s-1}\}$ and $E=(C\cap\mathcal Q)\setminus\mathcal P$. Then:

1. Either $\mathcal P\subseteq\overline E$ or $\dim_{\rm H}E\ge s$. In every case $\dim_{\rm H}\overline E\ge s$. Here $\dim_{\rm H}$ denotes Hausdorff dimension in the Frobenius metric.
2. For $s=4$ there is an orthogonal $O\in O(4)$ and there are two distinct entangled pure states $q_\pm\in E$ with $\pm\operatorname{tr}(T_{q_\pm}^{\mathsf T}O)\ge2$. Each of these states, with marginal norms $A=\|a_q\|$ and $B=\|b_q\|$, satisfies
   $$
   A+B\le S_0,\qquad
   \max\{A,B\}<\sqrt{6S_0^2+1}-2S_0,\qquad
   S_0=\frac{12+\sqrt{78}}{11}.
   \tag{8.8g.58.1}
   $$

*Proof of 1.* The argument of Theorem 8.8g.23 for compactness and the local-pure marginal face applies in spatial dimension $s$. The normalized base of $K_{\max}$ is bounded by the marginal bounds and $\|T\|_{\rm op}\le1$. Conditioning a positive map on an interior local effect and obtaining a pure local marginal forces its range into that local ray. It follows that every pure product is extreme in $C$. All-purity and compact extreme-point generation give a normalized base in the unit ball, so strict convexity identifies the actual pure set as $C\cap\mathcal Q$.

For $q\in\mathcal Q\setminus\mathcal P$, put $N=2q$ and $J=\operatorname{diag}(1,-I_s)$. The Lorentz S-lemma used in Theorem 8.8g.24 gives $H=N^{\mathsf T}JN-\lambda J\succeq0$ for some $\lambda\ge0$, as $x^{\mathsf T}Jx\ge0$ implies $(Nx)^{\mathsf T}J(Nx)\ge0$. For $\lambda=0$, the condition $H=0$ would make the range of $N$ a totally isotropic Lorentz subspace of dimension at most one. A positive rank-one map has two positive local factors, and equality of the normalized product norm makes both factors pure. For $\lambda>0$, the condition $H=0$ would give both $N^{\mathsf T}JN=\lambda J$ and $NJN^{\mathsf T}=\lambda J$. In the time/spatial blocks of $N$, this yields
$$
\|a_q\|^2=\|b_q\|^2=1-\lambda,\qquad
\|T_q\|_F^2=1+(s-1)\lambda,\qquad
\|N\|_F^2=4+(s-3)\lambda>4,
$$
contrary to the unit norm of $q$. Thus $H\ne0$ for every witness.

Each nonproduct $q$ has marginal norms strictly below one by the same local-pure face argument. Consequently $q p_b$ has a strictly positive time coordinate for every $b\in S^{s-1}$. A nonzero future Lorentz vector admits an annihilating $p_a$ exactly when it is null, in which case the spatial direction $a$ is uniquely the negative of the spatial part divided by the time part. For fixed $q$, the annihilator locus is therefore the graph over the directions $b$ for which $H(1,b)^{\mathsf T}=0$. The time-one affine section of $\ker H$ has dimension at most $s-1$. Its intersection with $S^{s-1}$ has dimension at most $s-2$, giving the asserted bound on product-annihilator dimension.

In the ambient unit-positive locus form the semialgebraic incidence set
$$
I=\{(q,a,b):q\in\mathcal Q\setminus\mathcal P,\ a,b\in S^{s-1},\
       p_a^{\mathsf T}qp_b=0\}.
\tag{8.8g.58.2}
$$
Semialgebraicity follows by real quantifier elimination on the polynomial Lorentz-positivity test. The projection $\pi:I\to\mathcal Q\setminus\mathcal P$ onto $q$ has fibers of semialgebraic dimension at most $s-2$. Apply smooth semialgebraic stratification to $\pi$ (Hardt et al., 2011, Proposition 2.3). On each stratum the projection to its image stratum has constant rank, and the constant-rank theorem gives local coordinates in which it is projection onto the first coordinates. The number $d$ of remaining coordinates is at most $s-2$, since a local coordinate fiber is a smooth $d$-dimensional submanifold of the semialgebraic fiber. Each stratum admits a countable cover by such charts, shrunk so the coordinate maps and their inverses are locally bi-Lipschitz for the embedded Euclidean metrics and the remaining coordinates range over bounded boxes. This follows by using embedded manifold coordinates and bounding derivatives on smaller coordinate neighborhoods.

The part of $\pi^{-1}(E)$ in each chart maps to a subset of $F\times[-M,M]^d$, where $F$ is a locally Lipschitz coordinate image of a subset of $E$. For any bounded box and any subset $F$ of Euclidean space, $\dim_{\rm H}(F\times[-M,M]^d)\le\dim_{\rm H} F+d$. Indeed, for $s>\dim_{\rm H}F$, cover $F$ by balls of radii $r_i$ tending uniformly to zero with arbitrarily small $\sum_i r_i^s$. For the $i$th ball cover the bounded box by $O(r_i^{-d})$ cubes of side $r_i$, giving a cover of the product by sets of diameter $O(r_i)$ and arbitrarily small sum of $(s+d)$th powers. Taking $s$ down to $\dim_{\rm H}F$ proves the bound. Lipschitz maps do not increase Hausdorff dimension, so countable stability gives
$$
\dim_{\rm H}\pi^{-1}(E)\le\dim_{\rm H}E+s-2 .
\tag{8.8g.58.3}
$$
Suppose $p\in\mathcal P\setminus\overline E$. Choose local light coordinates with $p=E_{++}$ and write $\rho$ for the transverse $(s-1)$-by-$(s-1)$ block. For any pure product $q$ the inequality $\|\rho(q)\|_F\le1-\langle p,q\rangle$ follows from (8.8g.36.7), whose proof uses only the two local plus coefficients. For any $q\in E$, the unit norms give $1-\langle p,q\rangle=\|p-q\|_F^2/2\ge\delta^2/2$ for some $\delta>0$ independent of $q$. Since $\|\rho(q)\|_F\le1$, any purely transverse $Z$ with $\|Z\|_F\le\min\{1,\delta^2/2\}$ gives $\langle U-p+Z,q\rangle\ge0$ for all pure states. Self-duality puts $U-p+Z$ in $C\cap p^\perp$. For nonzero $Z$ a pure decomposition must contain an entangled summand annihilating $p$, because all summands annihilate $p$ by acuteness, and a product annihilating $p$ has zero transverse block. Thus the product-coordinate projection of $\pi^{-1}(E)$ contains the parametrization of $\mathcal P\setminus\overline E$.

If this set is nonempty, it is relatively open in $S^{s-1}\times S^{s-1}$ and has Hausdorff dimension $2s-2$. The product-coordinate projection is Lipschitz. Equation (8.8g.58.3) gives $\dim_{\rm H}E\ge s$. In the other case $\overline E$ contains $\mathcal P$, a smooth $(2s-2)$-dimensional submanifold. This proves the closure bound in both cases.

*Proof of 2.* Choose a balanced $O$ of Proposition 8.8g.48, so $w(O)=w(-O)\ge1$. The minima defining the widths are attained on the compact pure set and give the two states of the displayed traces, with opposite signs. A product has spatial block $ab^{\mathsf T}$ for unit $a,b$ and gives $|\operatorname{tr}(T^{\mathsf T}O)|\le1$. Hence the two states are distinct and entangled. For either state the spatial singular values obey
$$
2\le \|T\|_*,\qquad
\|T\|_F^2=3-A^2-B^2\le 3-(A+B)^2/2.
\tag{8.8g.58.4}
$$
For the first inequality write a singular-value decomposition and bound each diagonal entry of the resulting orthogonal factor in the trace by one in magnitude.

Put $S=A+B$ and let $s_1$ be the largest singular value of $T$. If $S>S_0$ then $A,B>0$, since each is at most one. Testing positivity of $2q$ at the Lorentz vector $(1,-b/B)$ gives $\|a-T(b/B)\|\le1-B$. Thus $s_1\ge\|T(b/B)\|\ge S-1$. With $H=3-S^2/2$, Cauchy–Schwarz on the other three singular values gives
$$
\|T\|_*\le s_1+\sqrt{3(H-s_1^2)}
\le S-1+\sqrt{6+6S-\tfrac92 S^2}.
\tag{8.8g.58.5}
$$
For the second inequality, the function $s+\sqrt{3(H-s^2)}$ decreases for $2s>\sqrt H$. On $S\ge S_0>9/5$ one has $4(S-1)^2>H$, as follows from $\tfrac92 S^2-8S+1>0$. Feasibility of $s_1$ ensures the square roots in (8.8g.58.5) are real. Since $S\le2$, the condition $S>S_0$ gives $6+6S-\tfrac92 S^2<(3-S)^2$, equivalently $11S^2-24S+6>0$. The final expression in (8.8g.58.5) would then be strictly less than two, contradicting (8.8g.58.4). Thus $S\le S_0$. Finally set $M=\max\{A,B\}$ and $m=\min\{A,B\}$. By (8.8g.39.1), $3M^2<1+2m^2\le1+2(S_0-M)^2$. Solving this quadratic inequality for $M$ gives the strict bound in (8.8g.58.1). ∎

<a id="theorem-88g59"></a>

<a id="theorem-88g59-exact-transverse-tangent-directions-at-lorentz-product-states"></a>**Theorem 8.8g.59 (Exact Transverse Tangent Directions at Lorentz Product States).** Let $s\ge4$ and use the fixed Frobenius carrier, normalization $e$ and unit-positive locus $\mathcal Q$ of Theorem 8.8g.58. At a product state $p=p_ap_b^{\mathsf T}$, use orthonormal local light coordinates with $p=E_{++}$. For a nonproduct $q\in\mathcal Q$ near $p$, first align its two marginal directions with the light axes, with orthogonal changes tending to the identity as $q\to p$. Write the resulting matrix as
$$
q=\begin{pmatrix}
x&u&h^{\mathsf T}\\
v&w&-h^{\mathsf T}\\
k&-k&B
\end{pmatrix},
\qquad d=1-x.
\tag{8.8g.59.1}
$$
Here $B$ is the transverse $(s-1)$-by-$(s-1)$ block. For every sequence of such states approaching $p$, the accumulation points of $(q-p)/\|q-p\|_F$ after this alignment are purely transverse. The set of all resulting transverse blocks is exactly
$$
\{D\in\operatorname{Mat}_{s-1}(\mathbb R):
 \|D\|_F=1,\quad 2\|D\|_{\rm op}^2\le1\}.
\tag{8.8g.59.2}
$$
More precisely, the joint accumulation pairs consisting of the transverse block $D$ and the ratio $w/d$ are exactly
$$
\{(D,\vartheta):\|D\|_F=1,\quad 2\|D\|_{\rm op}^2\le\vartheta\le1\}.
\tag{8.8g.59.3}
$$
These are statements about the full unit-positive locus. In any all-pure self-dual intermediate, every actual entangled pure sequence has the same necessary constraints on its aligned limits.

*Proof.* The spatial marginal directions converge to the two directions of the product. For all sufficiently near states they are nonzero, and can be aligned by rotations tending to the identity. The absence of a transverse component in either marginal gives the opposite strips in (8.8g.59.1). Testing light-axis inputs and outputs gives $x,u,v,w\ge0$, and the normalization gives $x+u+v+w=1$. The image of the minus light vector is Lorentz-positive for both $q$ and $q^{\mathsf T}$. Thus
$$
\|k\|^2\le 2uw,\qquad \|h\|^2\le 2vw .
\tag{8.8g.59.4}
$$
In particular both strips are $O(d)$.

Conjugating by the transverse sign change on both factors negates the strips and leaves $B$ and the four axial entries fixed. Averaging preserves Lorentz positivity. For the resulting strip-free map, an input $(\alpha,\beta,z)$ is Lorentz-positive when $\alpha,\beta\ge0$ and $\|z\|^2\le2\alpha\beta$. For positive $\alpha,\beta$, positivity of the output for every such $z$ is equivalent to
$$
\|B\|_{\rm op}^2\le
\inf_{\alpha,\beta>0}
\frac{(x\alpha+u\beta)(v\alpha+w\beta)}{\alpha\beta}
=(\sqrt{xw}+\sqrt{uv})^2.
\tag{8.8g.59.5}
$$
For the equality expand the quotient as $xw+uv+xv(\alpha/\beta)+uw(\beta/\alpha)$ and minimize over the positive ratio. The formula extends to zero coefficients by taking the one-sided infimum. Boundary inputs with $\alpha\beta=0$ have $z=0$ and their images have nonnegative axial coordinates. Thus (8.8g.59.5) is necessary for (8.8g.59.1), and sufficient when the strips vanish.

Since $\|q\|_F=1$, the contributions of $u,v,w,h,k$ are $O(d^2)$, so
$$
\|B\|_F^2=2d+O(d^2),\qquad
\|q-p\|_F^2=2d .
\tag{8.8g.59.6}
$$
The second equality uses $\langle p,q\rangle=x$. Therefore every normalized tangent limit is transverse and has unit Frobenius norm. Dividing (8.8g.59.5) by $2d$ and using $\sqrt{uv}\le d/2$ yields $2\|D\|_{\rm op}^2\le\lim w/d$ along any convergent joint subsequence. The other inequality follows from $w\le d$.

For the converse fix $(D,\vartheta)$ in (8.8g.59.3). First suppose $\vartheta>2\|D\|_{\rm op}^2$. For sufficiently small $d>0$, set $x=1-d$, $u=(1-\vartheta)d$, $v=0$, $w=\vartheta d$, and set the strips to zero. Take
$$
B=\sqrt{1-x^2-u^2-w^2}\,D.
$$
The square root is positive for small $d$, and the Frobenius norm and normalization are exactly one. The ratio $\|B\|_{\rm op}^2/(xw)$ tends to $2\|D\|_{\rm op}^2/\vartheta<1$. Positivity then follows from (8.8g.59.5). The margins of this construction lie on the selected axes. If $\vartheta=2\|D\|_{\rm op}^2<1$, take a sequence of strictly larger $\vartheta$ tending to it and choose $d$ sufficiently small along that sequence. If $\vartheta=2\|D\|_{\rm op}^2=1$, set $u=v=0$, $x=1-d$, $w=d$ and $B=\sqrt{2xw}\,D$ exactly. This realizes the limiting equality at every small $d$. In all cases a nonzero transverse block with the aligned axes gives a nonproduct state, and (8.8g.59.6) gives the nominated limit. ∎

For example, a leading entanglement block of rank one is impossible. A rank-two leading block must have its two nonzero singular values equal to $1/\sqrt2$, and its opposite-corner ratio must tend to one. In the Lorentz-five case all remaining leading directions are three-by-three matrices satisfying (8.8g.59.2).

<a id="theorem-88g60"></a>

<a id="theorem-88g60-a-finite-matrix-gram-obstruction-for-lorentz-five"></a>**Theorem 8.8g.60 (A Finite Matrix-Gram Obstruction for Lorentz Five).** Use the fixed Frobenius carrier and normalization of Theorem 8.8g.23. Choose the spatial orthonormal basis $e_1,\ldots,e_4$. Form a finite set $\mathcal F$ of pure products from all ordered pairs of local directions in
$$
\mathcal V=\{\pm e_i:1\le i\le4\}
\cup\{\pm(e_i+e_j)/\sqrt2:1\le i<j\le4\}.
\tag{8.8g.60.1}
$$
For every closed self-dual intermediate $C$, there exists a normalized extreme point $q$ of $C$ such that the Gram matrix of $\mathcal F\cup\{q\}$ has no positive semidefinite factorization of the form $G_{xy}=\operatorname{Tr}(M_xM_y)$ by positive semidefinite complex Hermitian matrices of any common finite size. At least one of the two fixed linear tests (8.8g.60.4) is violated by $q$ with margin at least $(\sqrt2-1)/2$. In particular there is no Frobenius-isometric positive embedding of $C$ into a finite-dimensional matrix cone. The obstruction also applies when the matrices are allowed to represent only this finite list of states. If $C$ is all-pure, the additional extreme point has norm one.

*The finite product tests.* The products in $\mathcal F$ span the full tensor carrier. A Gram factorization of these products defines a real linear isometry $\Phi$ to the Hermitian matrices by mapping each product to its assigned matrix. To see well-definedness, any linear relation among the products has the same squared norm as the corresponding combination of assigned matrices. Any additional vector in a Gram factorization is also mapped by this same $\Phi$, since its difference from the linear image has zero norm.

Let $\Omega=\Phi(U)$, where $U=2E_{00}$. Each product frame $\{p_{\pm a}p_{\pm b}^{\mathsf T}\}$ for $a,b\in\mathcal V$ sums to $U$. Its four images are positive and pairwise trace-orthogonal, hence have pairwise orthogonal supports. Thus $\Omega\ge0$, every frame member is $\Omega$ times its support projection, and every support projection commutes with $\Omega$. Restrict to the support of $\Omega$, on which $\Omega$ is invertible. All product images are supported there. For each $a$, the sum of the two images with left factor $p_a$ is $\Phi(p_a u^{\mathsf T})$, independently of $b$. It follows that the sum of their two support projections is one fixed projection $P_a$. The analogous projection for the right factor $p_b$ is $Q_b$. For each pair $a,b$, the four joint frame projections resolve the identity and are orthogonal. Consequently $P_a,Q_b$ commute, and their joint projection $P_aQ_b$ is the support projection of $\Phi(p_ap_b^{\mathsf T})$.

Write $G_a=2P_a-I$, $H_b=2Q_b-I$ on this support. These are commuting across the two factors and each squares to the identity. The identities $p_a u^{\mathsf T}=(e_0+a)e_0^{\mathsf T}$ and $U=2E_{00}$ show that $G_a=2\Omega^{-1}\Phi(ae_0^{\mathsf T})$ is linear in $a$ on the tested list. The same relation holds for $H_b$. Put $G_i=G_{e_i}$ and $H_i=H_{e_i}$. Testing the sum directions in (8.8g.60.1) gives
$$
G_iG_j+G_jG_i=0,\qquad H_iH_j+H_jH_i=0\qquad(i\ne j),
\tag{8.8g.60.2}
$$
by expanding the squares of $(G_i+G_j)/\sqrt2$ and $(H_i+H_j)/\sqrt2$. The joint product formula is $\Phi(p_ap_b^{\mathsf T})=\Omega(I+G_a)(I+H_b)/4$. It determines $\Phi$ on every vector.

*The forced positive section.* Four anticommuting Hermitian symmetries generate a complex matrix algebra isomorphic to $M_4(\mathbb C)$. For completeness, their sixteen ordered monomials span an algebra by anticommutation. Each nonidentity monomial has zero trace because conjugation by one generator changes its sign, and different monomials are trace-orthogonal by applying this fact to their product. The same relations on the concrete matrices $\Gamma_1=X\otimes I$, $\Gamma_2=Y\otimes I$, $\Gamma_3=Z\otimes X$, $\Gamma_4=Z\otimes Y$, with $X,Y,Z$ the Pauli matrices, therefore identify that algebra with $M_4(\mathbb C)$. Two commuting unital representations give a unital representation of $M_{16}(\mathbb C)$ and it is faithful by simplicity. Thus the spectrum of each Hermitian polynomial in the two commuting families agrees with its spectrum in the concrete tensor representation. Set $\Gamma_0=I_4$ and use the Hilbert–Schmidt isometry
$$
\Psi(x)=\frac14\sum_{\mu,\nu=0}^4x_{\mu\nu}\Gamma_\mu\otimes\Gamma_\nu .
\tag{8.8g.60.3}
$$
The joint product formula and spanning show that $\Phi(x)=2\Omega\,\pi(\Psi(x))$, where $\pi$ is the faithful representation just constructed. As $\Omega$ is positive definite and commutes with the image algebra, positivity of $\Phi(x)$ is equivalent to positivity of $\Psi(x)$. Every positive semidefinite Gram factorization of the finite product list together with an extra vector therefore places that vector in the single cone $D=\{x:\Psi(x)\succeq0\}$.

*Two witnesses.* Let $A=\Gamma_1\otimes\Gamma_1$, $B=\Gamma_2\otimes\Gamma_2$. The two Hermitian symmetries commute. Their joint same-sign spectral projections are $Y_\pm=(I\pm A)(I\pm B)/4$. The product $AB$ is orthogonal to the entire image of $\Psi$ by the monomial trace calculation. Hence, for $x\in D$,
$$
0\le\operatorname{Tr}(Y_\pm\Psi(x))=\langle z_\pm,x\rangle,\qquad
z_\pm=E_{00}\pm E_{11}\pm E_{22}.
\tag{8.8g.60.4}
$$
The signs in each expression are both the same. Let $\beta$ be the maximum of zero and the negatives of the two minima of $\langle z_\pm,\cdot\rangle$ on the compact normalized base of $C$. Then $z_\pm+\beta U$ pair nonnegatively with the base, so both belong to $C$ by self-duality. Their pairing is $-1+4\beta+4\beta^2$. Acuteness therefore gives $\beta\ge(\sqrt2-1)/2$. A minimizing extreme point exists by taking an extreme point of the minimizing face for the functional achieving $-\beta$. This $q$ is outside $D$ and the finite Gram factorization is impossible. The argument uses fixed products and the full-dual tensor order. It needs no trace normalization, product factorization, or unital condition on the proposed ambient matrices. ∎

<a id="corollary-88g60a"></a>

<a id="corollary-88g60a-stability-under-approximate-matrix-factoring"></a>**Corollary 8.8g.60a (Stability under Approximate Matrix Factoring).** In Theorem 8.8g.60, the Gram matrix of the product list together with the violating extreme state lies outside the closure of all finite positive semidefinite Gram factorizations. There is a single positive Gram-error lower bound for these witnesses over all self-dual intermediate cones and all matrix sizes.

*Proof.* Suppose a sequence of positive matrix factorizations has Gram entries converging to those of the finite list. The matrices may have varying sizes. Use the unnormalized Hilbert–Schmidt norm $\|\cdot\|_2$ in each size. Extend the assigned matrices of a fixed spanning subset of the products linearly to maps $\Phi_n$ on the full carrier. Any other assigned matrix differs from $\Phi_n$ of its vector by $o(1)$ in this norm, because the squared norm of the discrepancy is a fixed quadratic expression in Gram entries and has limit zero. The Gram matrices of the $\Phi_n$ converge to the Frobenius pairing.

Let $\Omega_n$ be the sum of the four actual positive matrices in one fixed product frame. It differs from $\Phi_n(U)$ by $o(1)$, and $\|\Omega_n\|_2\to2$. For any tested product frame, its sum differs from $\Omega_n$ by $o(1)$ and its distinct positive pieces have pairwise trace products tending to zero.

For positive matrices $A,B$, let $D_\pm=(A-B)_\pm$ and $E=A-D_+=B-D_-$. Since $D_+D_-=0$,
$$
\|E\|_2^2=\operatorname{Tr}(AB)-\operatorname{Tr}(AD_-)-\operatorname{Tr}(D_+B)
\le\operatorname{Tr}(AB).
\tag{8.8g.60a.1}
$$
Let $P$ be the support projection of $D_+$. Because $A+B=D_++D_-+2E$, both $P(A+B)$ and $(A+B)P$ differ from $A$ by at most $3\|E\|_2$. Apply this to any piece $A$ of a tested frame and the sum $B$ of its other pieces. The resulting projection sequence satisfies $P_n\Omega_n-A_n\to0$ and $\Omega_nP_n-A_n\to0$ in Hilbert–Schmidt norm.

Let $\mathcal M$ be the unital $C^*$-algebra of uniformly operator-norm-bounded matrix sequences $X=(X_n)$ with $\|[X_n,\Omega_n]\|_2\to0$. The condition is preserved under adjoint, multiplication and uniform operator-norm limits, using the uniform bound on $\|\Omega_n\|_2$. In this algebra let
$$
\mathcal I=\{X\in\mathcal M:\|X_n\Omega_n\|_2\to0\}.
$$
This is a closed two-sided $*$-ideal. For example, the right ideal estimate follows by moving a bounded multiplier across $\Omega_n$ with $o(1)$ Hilbert–Schmidt error. Write $[X]$ for a class in $\mathcal M/\mathcal I$. The approximation just proved assigns a projection class to each product in each frame. Equalities between their linear combinations can be checked after multiplying representatives on the right by $\Omega_n$, since such equalities are exactly the defining test for $\mathcal I$.

In a product frame the four projection classes sum to the identity. Four projections that sum to the identity in a $C^*$-algebra are mutually orthogonal: multiply the sum on both sides by any one projection, and use positivity of the resulting three summands. The two frame sums with a common left factor give the same class $P_a$ independently of the right axis, by the linear relation on the carrier. Likewise the right sums give $Q_b$. The orthogonal joint frame then gives $P_aQ_b=Q_bP_a$ equal to its indicated product projection. The classes $G_a=2P_a-I$ and $H_b=2Q_b-I$ obey the sum-direction identities of Theorem 8.8g.60, again because multiplying those identities by $\Omega_n$ gives exactly the corresponding carrier linear relations up to $o(1)$. Squaring the sum-direction identities yields the anticommutation relations (8.8g.60.2). Thus the quotient contains the same faithful unital representation $\pi$ of $M_{16}(\mathbb C)$. For any $x$ in the carrier choose any bounded representative $X$ of $2\pi(\Psi(x))$. The product formula and spanning give
$$
\|\Phi_n(x)-X_n\Omega_n\|_2\longrightarrow0 .
\tag{8.8g.60a.2}
$$
The representative can be chosen Hermitian when $x$ is real.

Choose a free ultrafilter on the sequence indices and define
$$
\tau([X])=\tfrac14\lim_{\mathcal U}\operatorname{Tr}(\Omega_n^2 X_n).
$$
This is a tracial state. It vanishes on the ideal by Hilbert–Schmidt Cauchy–Schwarz. For trace cyclicity, expand $[\Omega_n^2,X_n]=\Omega_n[\Omega_n,X_n]+[\Omega_n,X_n]\Omega_n$, and bound the trace against a bounded multiplier by $2\|\Omega_n\|_2\|[\Omega_n,X_n]\|_2$ times its operator norm. The normalized trace of $\pi(M)$ under $\tau$ is $\operatorname{Tr}_{16}(M)/16$ by uniqueness of normalized trace on $M_{16}(\mathbb C)$.

Let $q$ be the added vector whose assigned positive factor is $F_n$. By (8.8g.60a.2), $\|F_n-X_n\Omega_n\|_2\to0$ for a representative of $2\pi(\Psi(q))$. Let $Y_n\ge0$ be a uniformly bounded positive representative of $\pi(Y_\pm)$, where $Y_\pm$ are the witness projections in Theorem 8.8g.60. Such a lift is obtained by taking a bounded Hermitian lift and applying the positive-part function. The matrices $\Omega_n^{1/2}Y_n\Omega_n^{1/2}$ are positive and have bounded Hilbert–Schmidt norm. In an eigenbasis of $\Omega_n$, the entrywise estimate $\left|\sqrt{a b}-b\right|\le |a-b|$ for $a,b\ge0$ gives
$$
\|\Omega_n^{1/2}Y_n\Omega_n^{1/2}-Y_n\Omega_n\|_2
\le\|[Y_n,\Omega_n]\|_2\longrightarrow0.
\tag{8.8g.60a.3}
$$
The trace product of the two positive matrices $F_n$ and $\Omega_n^{1/2}Y_n\Omega_n^{1/2}$ is nonnegative. Equations (8.8g.60a.2)–(8.8g.60a.3), Hilbert–Schmidt Cauchy–Schwarz and $\|[Y_n,\Omega_n]\|_2\to0$ show that its ultralimit is $4\tau(2\pi(\Psi(q))\pi(Y_\pm))=\operatorname{Tr}_{16}(\Psi(q)Y_\pm)/2$. Hence both linear tests (8.8g.60.4) are nonnegative on $q$. This contradicts the choice of the violating state.

For uniformity take the compact set of normalized Lorentz-positive vectors $x$ for which $\min\{\langle z_+,x\rangle,\langle z_-,x\rangle\}\le-(\sqrt2-1)/2$. Its image under the Gram map with the fixed product list is compact and disjoint from the closed cone of limits just considered. Its Euclidean distance to that cone is positive. Theorem 8.8g.60 supplies a witness in this set for every self-dual intermediate. ∎

<a id="theorem-88g61"></a>

<a id="theorem-88g61-exact-product-null-test-and-rank-four-classification"></a>**Theorem 8.8g.61 (Exact Product-Null Test and Rank-Four Classification).** Use the fixed Lorentz-five carrier, Frobenius pairing and unit-positive locus of Theorem 8.8g.23. Fix a normalized product $p$ and use the light coordinates of Lemma 8.8g.25, so $p=E_{++}$. For a normalized map in the product-null form
$$
q=\begin{pmatrix}0&\lambda&0\\ \mu&\nu&v^{\mathsf T}\\0&w&B\end{pmatrix},
\qquad \lambda,\mu,\nu\ge0,\quad \lambda+\mu+\nu=1,
\tag{8.8g.61.1}
$$
with $\lambda,\mu>0$, Lorentz positivity holds exactly when
$$
\begin{pmatrix}
\lambda\mu I_3-B^{\mathsf T}B&\lambda v-B^{\mathsf T}w\\
(\lambda v-B^{\mathsf T}w)^{\mathsf T}&2\lambda\nu-\|w\|^2
\end{pmatrix}\succeq0.
\tag{8.8g.61.2}
$$
Every nonproduct $q\in\mathcal Q\cap p^\perp$ has rank at least four. It has rank four exactly when it is a positive scaled Lorentz isometry between two embedded four-dimensional Lorentz carriers, extended by zero in their respective orthogonal spatial directions. The four-dimensional carriers contain the time axis and the spatial direction of the corresponding factor of $p$. Conversely the normalized zero extension of such a Lorentz isometry is unit-positive. It annihilates $p$ exactly when the input light ray of $p$ is sent to the opposite output light ray. These rank assertions concern all unit-positive product annihilators, hence apply to the actual pure states of any all-pure self-dual intermediate.

*Proof.* An input in light coordinates $(\alpha,\beta,z)$ lies in the Lorentz cone exactly when $\alpha,\beta\ge0$ and $\|z\|^2\le2\alpha\beta$. Its output has plus coordinate $\lambda\beta$, minus coordinate $\mu\alpha+\nu\beta+v^{\mathsf T}z$ and transverse coordinate $w\beta+Bz$. For $\beta>0$ and fixed $z$, the smallest allowed $\alpha$ is $\|z\|^2/(2\beta)$. Since $\mu>0$, checking the output quadratic at this value suffices for all larger $\alpha$. After division by $\beta^2$, the inequality becomes
$$
\lambda\mu\|z/\beta\|^2+2\lambda v^{\mathsf T}(z/\beta)
+2\lambda\nu-\|w+B(z/\beta)\|^2\ge0.
$$
The positive plus coordinate also gives nonnegative minus coordinate whenever this inequality holds. All $z/\beta\in\mathbb R^3$ occur. Nonnegativity of this affine quadratic is equivalent to (8.8g.61.2), by homogenizing in the last variable and using continuity at zero. If $\beta=0$ then $z=0$ and the output is already a nonnegative multiple of the minus light ray. This proves the criterion.

If $\lambda=0$, every output has zero plus coordinate, and Lorentz positivity on a spanning cone then makes the range a line. If $\mu=0$, apply the same argument to $q^{\mathsf T}$. A normalized rank-one Lorentz-positive map is a product of positive local normalized factors. Norm one forces each factor to have norm one, so the map is a pure product. Hence a nonproduct member of $\mathcal Q\cap p^\perp$ has both positive pivots. Equation (8.8g.61.2) and its transposed test give
$$
\|B\|_{\rm op}^2\le\lambda\mu,\qquad
\|w\|^2\le2\lambda\nu,\qquad
\|v\|^2\le2\mu\nu.
$$
Normalization and unit Frobenius norm then yield
$$
\|B\|_F^2
=2\lambda\mu+2\lambda\nu+2\mu\nu-\|w\|^2-\|v\|^2
\ge2\lambda\mu.
\tag{8.8g.61.3}
$$
Thus $B$ has rank at least two. The axial block in (8.8g.61.1) is invertible and its Schur complement in the ordinary matrix rank calculation is $B$, since the lower-right entry of the inverse axial block is zero. Consequently $\operatorname{rank}q=2+\operatorname{rank}B\ge4$.

At rank four, the two nonzero singular values of $B$ are both $\sqrt{\lambda\mu}$ by (8.8g.61.3). Both marginal strip bounds are saturated. The zero bottom-right entry of (8.8g.61.2) now forces $B^{\mathsf T}w=\lambda v$, and the transpose condition gives $Bv=\mu w$. Let $E_{\rm in}=\operatorname{ran}B^{\mathsf T}$ and $E_{\rm out}=\operatorname{ran}B$. These two-dimensional transverse spaces contain $v$ and $w$ respectively. The map vanishes on the omitted input direction and has no output on the omitted output direction. On the retained carriers, for every input, direct substitution gives
$$
2(\lambda\beta)(\mu\alpha+\nu\beta+v^{\mathsf T}z)-\|w\beta+Bz\|^2
=\lambda\mu(2\alpha\beta-\|z\|^2).
\tag{8.8g.61.4}
$$
The map on these carriers is invertible and future-cone preserving, so after division by $\sqrt{\lambda\mu}$ it is a Lorentz isometry.

Conversely, a scaled future Lorentz isometry of the embedded four-dimensional carriers is positive after projection to the input carrier and inclusion from the output carrier. Normalize its time-time entry to $1/2$ and write its restriction as $N/2$ with $N_{00}=1$. In dimension four, $N^{\mathsf T}JN=\kappa J$ gives both squared marginal norms $1-\kappa$ and spatial Frobenius norm squared $1+2\kappa$, by taking the time entry and spatial trace of this relation and its transposed relation. Thus $\|N\|_F^2=4$ and the zero extension has norm one. Its pairing with $p$ is zero precisely when the image of the input light vector lies on the output light ray annihilated by $p$'s output factor. ∎

<a id="corollary-88g61a"></a>

<a id="corollary-88g61a-global-rank-classification-of-singular-lorentz-five-unit-states"></a>**Corollary 8.8g.61a (Global Rank Classification of Singular Lorentz-Five Unit States).** On the fixed carrier of Theorem 8.8g.23, every singular member of $\mathcal Q$ is either a pure product of rank one or a rank-four state. The rank-four states are exactly the normalized extensions of positive scaled Lorentz isometries between two four-dimensional Lorentz subspaces obtained by deleting one spatial axis on each side. They are therefore also exactly the normalized zero extensions of two-qubit rank-one projectors and their partial transposes, using the identifications of Proposition 8.8g.47 on the two four-dimensional subspaces. Every rank-four member annihilates some pure product.

*Proof.* Put $N=2q$, $J=\operatorname{diag}(1,-I_4)$ and $N_{00}=1$. We first obtain a pair of invariant inequalities by a Lorentz reduction. For $\epsilon>0$ let $N_\epsilon=N+\epsilon E_{00}$. The quantity
$$
\min_{u,v\in\mathscr H}u^{\mathsf T}N_\epsilon v,\qquad
\mathscr H=\{u:u^{\mathsf T}Ju=1,\ u_0>0\},
$$
has a positive attained value $s_\epsilon$. Indeed the first term $u^{\mathsf T}Nv$ is nonnegative and the added term is $\epsilon u_0v_0$, so each sublevel set is compact in $\mathscr H\times\mathscr H$. For minimizing $u,v$, use future Lorentz isometries $R,S$ sending $e_0$ to $u,v$. The first variation in the spatial tangent directions of both hyperboloids makes the two off-diagonal strips of $R^{\mathsf T}N_\epsilon S$ vanish. Its remaining form is $s_\epsilon\operatorname{diag}(1,D_\epsilon)$ with $\|D_\epsilon\|_{\rm op}\le1$, by Lorentz positivity. This derives the needed strictly positive Lorentz normal form directly.

Write $\lambda_\epsilon=s_\epsilon^2$ and let $d_{1,\epsilon},\ldots,d_{4,\epsilon}$ be the spatial singular values of $D_\epsilon$, in decreasing order. The diagonal form gives $N_\epsilon^{\mathsf T}JN_\epsilon-\lambda_\epsilon J\succeq0$ and $N_\epsilon JN_\epsilon^{\mathsf T}-\lambda_\epsilon J\succeq0$ by Lorentz congruence. The eigenvalues of $JN_\epsilon^{\mathsf T}JN_\epsilon$ are $\lambda_\epsilon$ and $\lambda_\epsilon d_{i,\epsilon}^2$, by Lorentz similarity. Since $s_\epsilon\le1+\epsilon$, pass to a subsequence where all these parameters converge, writing $\lambda,d_i$ for their limits. Both positivity inequalities hold for $N$, and the characteristic polynomial of $JN^{\mathsf T}JN$ has the same displayed limiting roots.

Let $\alpha=(N^{\mathsf T}JN)_{00}$ and $\beta=(NJN^{\mathsf T})_{00}$. By the inequalities $\alpha,\beta\ge\lambda$. Direct block expansion gives
$$
\|N\|_F^2-4
=\operatorname{Tr}(JN^{\mathsf T}JN)-2(\alpha+\beta).
\tag{8.8g.61a.1}
$$
The left side is zero. If $\lambda=0$, all five limiting eigenvalues vanish, so $\alpha=\beta=0$. Both normalized local marginals are then pure. The pure-marginal argument of Theorem 8.8g.23 forces $q$ to be a pure product.

Otherwise $\lambda>0$. Singularity of $N$ gives at least one $d_i=0$, and the identity yields
$$
4\lambda\le2(\alpha+\beta)
=\lambda(1+\textstyle\sum_i d_i^2)\le4\lambda.
$$
Every inequality is equality. Hence the spatial singular values in the limiting Lorentz form are $1,1,1,0$, and $\alpha=\beta=\lambda$. The positive semidefinite matrices $N^{\mathsf T}JN-\lambda J$ and $NJN^{\mathsf T}-\lambda J$ have zero time-time entry, so their time-space strips vanish. On the spatial subspace the first matrix has eigenvalues $0,0,0,\lambda$: subtract $\lambda I$ from $JN^{\mathsf T}JN$ and use the displayed characteristic roots. The second has the same property, since $JNJN^{\mathsf T}$ has the same characteristic polynomial by the product identity for square matrices. Thus the two defects are $\lambda kk^{\mathsf T}$ and $\lambda \ell\ell^{\mathsf T}$ for unit spatial vectors $k,\ell$.

The restriction of the Lorentz form of the image to $k^\perp$ is nondegenerate, since $N^{\mathsf T}JN$ there is $\lambda J$. Therefore $N$ has rank at least four and by singularity exactly four. Its one-dimensional kernel is $\mathbb Rk$: inclusion in the nullspace of $N^{\mathsf T}JN$ is automatic, and this nullspace is exactly that line. The transposed argument gives $\ker N^{\mathsf T}=\mathbb R\ell$. Thus $N/\sqrt\lambda$ is a future Lorentz isometry from $k^\perp$ onto $\ell^\perp$, with zero extension. The converse and norm computation are as in Theorem 8.8g.61. In particular choose any unit input null direction in $k^\perp$. Its nonzero null image in $\ell^\perp$ has an opposite output direction giving the required zero product pairing. The two-qubit formulation follows from the equality characterization in Proposition 8.8g.47(2). ∎

The strict Lorentz normal form is a special case of the Lorentz-positive map orbit analysis of Hildebrand (2007). The proof above derives the required case and its singular-limit equality separately.

<a id="theorem-88g62"></a>

<a id="theorem-88g62-full-product-null-faces-and-their-failure-of-intrinsic-self-duality"></a>**Theorem 8.8g.62 (Full Product-Null Faces and Their Failure of Intrinsic Self-Duality).** Use the fixed Lorentz-five carrier and all-pure self-dual completion of Theorem 8.8g.23. Let $\mathcal T=C\cap\mathcal Q$ be its normalized pure set and let $E=\mathcal T\setminus\mathcal P$. If a pure product $p$ has $\operatorname{dist}(p,E)>0$, then the exposed face $F_p=C\cap p^\perp$ spans the full eighteen-dimensional product-null subspace and is not self-dual in this span. The orthogonal projection onto that span is not positive on $C$. In particular, an all-pure completion with self-dual product-null faces, or with positive orthogonal projections onto their spans, must have every pure product in the closure of its entangled pure set. That closure then has Hausdorff dimension at least six, the dimension of $S^3\times S^3$. If $E$ is semialgebraic, its semialgebraic dimension is also at least six.

*Proof.* Work in the light coordinates of Lemma 8.8g.25 with $p=E_{++}$. The subspace in question is
$$
\mathscr L_p=\left\{
\begin{pmatrix}0&\lambda&0\\\mu&\nu&v^{\mathsf T}\\0&w&B\end{pmatrix}
:\lambda,\mu,\nu\in\mathbb R,\ v,w\in\mathbb R^3,\ B\in\operatorname{Mat}_3(\mathbb R)\right\}.
$$
Every Lorentz-positive map annihilating $p$ lies in this subspace by the opposite-ray argument of Lemma 8.8g.25. Let $\Pi$ be the Frobenius orthogonal projection onto $\mathscr L_p$, and put $a(q)=1-\langle p,q\rangle$ for normalized pure states.

For a pure product $q$, let $s,t\in[0,1]$ be its two local minus light coefficients. Its local plus coefficients are $1-s,1-t$, and its transverse vectors have squared norms $2s(1-s),2t(1-t)$. Thus $a=s+t-st\ge\max(s,t)$. The three retained axial entries are nonnegative and sum to $a$, so their squared sum is at most $a^2$. The two retained strips have squared norms $2s^2t(1-t)$ and $2t^2s(1-s)$, with sum at most $4a^2$. The transverse block has squared norm $4st(1-s)(1-t)\le a^2$ by (8.8g.36.7). Hence $\|\Pi q\|_F\le\sqrt6\,a(q)$. For $q\in E$ the unit norms give $a(q)=\tfrac12\|p-q\|_F^2\ge\delta^2/2$ where $\delta=\operatorname{dist}(p,E)>0$, and $\|\Pi q\|_F\le1$. If $E=\varnothing$ take $\delta=+\infty$.

For every $Z\in\mathscr L_p$ with $\|Z\|_F\le\min\{1/\sqrt6,\delta^2/2\}$, these bounds give
$$
\langle U-p+Z,q\rangle
\ge a(q)-\|Z\|_F\|\Pi q\|_F\ge0\qquad(q\in\mathcal T).
\tag{8.8g.62.1}
$$
The pure states generate the normalized base. By self-duality, $U-p+Z\in C$, and it is orthogonal to $p$. This proves the full relative ball and therefore $\operatorname{span}F_p=\mathscr L_p$.

For any $X\in F_p$ with its displayed block coordinates, Lorentz positivity gives $\lambda,\mu\ge0$ and $\|B\|_{\rm op}\le\sqrt{\lambda\mu}$. When both pivots are positive this is the principal block condition in (8.8g.61.2), which is homogeneous and does not require normalization. If either pivot is zero, the corresponding zero-plus argument in Theorem 8.8g.61 forces $B=0$. For any fixed transverse unit vectors $x,y$ define
$$
W=\tfrac12(E_{+,-}+E_{-,+})+xy^{\mathsf T},
$$
where the last summand occupies the transverse block. Then $\langle W,X\rangle\ge(\lambda+\mu)/2-\sqrt{\lambda\mu}\ge0$ for every $X\in F_p$. But $W\notin K_{\max}$, since its transverse operator norm is one while its two pivots are $1/2$. Thus $W$ belongs to the intrinsic dual of $F_p$ in $\mathscr L_p$ and is outside $F_p$. If $\Pi C\subseteq C$, then $\Pi C\subseteq F_p$ and $\langle W,c\rangle=\langle W,\Pi c\rangle\ge0$ for every $c\in C$. Self-duality of $C$ would put $W$ in $C$, contrary to its Lorentz-positivity failure. This proves the projection assertion. ∎

<a id="theorem-88g63"></a>

<a id="theorem-88g63-orientation-and-lorentz-defects-of-unit-positive-maps"></a>**Theorem 8.8g.63 (Orientation and Lorentz Defects of Unit-Positive Maps).** Use the fixed Lorentz-five unit-positive locus $\mathcal Q$ of Theorem 8.8g.23. Write
$$
N=2q=\begin{pmatrix}1&b^{\mathsf T}\\a&T\end{pmatrix},\qquad
J=\operatorname{diag}(1,-I_4).
$$
For an invertible $N$, let $\lambda$ be the largest eigenvalue of $JN^{\mathsf T}JN$ and write its eigenvalues as $\lambda,\lambda d_1^2,\ldots,\lambda d_4^2$ with $1\ge d_1\ge\cdots\ge d_4>0$. Then $\lambda>0$ and
$$
\left|\lambda(N^{-1})_{00}-1\right|
\le\frac{\sqrt\lambda\,d_4}{4}\le\frac14 .
\tag{8.8g.63.1}
$$
Consequently $T$ is invertible and $\det T$ has the same sign as $\det N$. For a singular nonproduct member of $\mathcal Q$, the spatial block has rank three. Thus every nonproduct member satisfies $\operatorname{rank}T=\operatorname{rank}N-1$.

For any invertible $N$ and any positive $\xi$, the right and left Lorentz defect tests
$$
N^{\mathsf T}JN-\xi J\succeq0,\qquad NJN^{\mathsf T}-\xi J\succeq0
\tag{8.8g.63.2}
$$
are equivalent. Whenever they hold, their defect matrices have equal ranks. If an invertible $q\in\mathcal Q$ annihilates a pure product, its two Lorentz multiplier sets are the same singleton. In the light coordinates (8.8g.61.1), writing its two positive axial pivots as $l,m$, the multiplier of the map $q$ itself is $lm$. The defect on the right is a zero row and column in the plus direction, together with the four-by-four matrix (8.8g.61.2). The left defect is the corresponding matrix for $q^{\mathsf T}$ and has the same rank. In these coordinates
$$
\operatorname{sgn}\det N=-\operatorname{sgn}\det B
\tag{8.8g.63.3}
$$
when the light bases use the same orientation as the original bases.

*Proof of the orientation bound.* Let $N_\epsilon=N+\epsilon E_{00}$. The hyperboloid construction in Corollary 8.8g.61a gives future Lorentz isometries $R,S$ with $R^{\mathsf T}N_\epsilon S=\sqrt{\lambda_\epsilon}\operatorname{diag}(1,D_\epsilon)$ and $\|D_\epsilon\|_{\rm op}\le1$. Write
$$
R^{-1}e_0=(\gamma_u,u),\qquad S^{-1}e_0=(\gamma_v,v).
$$
Both are future unit Lorentz vectors, so $\gamma_u^2=1+\|u\|^2$ and $\gamma_v^2=1+\|v\|^2$. All these parameters may depend on $\epsilon$. Define the two time-coordinate defects
$$
\alpha_\epsilon=(N_\epsilon^{\mathsf T}JN_\epsilon)_{00},\qquad
\beta_\epsilon=(N_\epsilon JN_\epsilon^{\mathsf T})_{00}.
$$
The canonical form gives the exact identities
$$
\frac{\beta_\epsilon-\lambda_\epsilon}{\lambda_\epsilon}
=u^{\mathsf T}(I-D_\epsilon D_\epsilon^{\mathsf T})u,\qquad
\frac{\alpha_\epsilon-\lambda_\epsilon}{\lambda_\epsilon}
=v^{\mathsf T}(I-D_\epsilon^{\mathsf T}D_\epsilon)v.
\tag{8.8g.63.4}
$$
Since $N$ is invertible, $N_\epsilon$ and $D_\epsilon$ are invertible for all sufficiently small $\epsilon$. The Lorentz identity $R^{\mathsf T}e_0=JR^{-1}e_0$, and its counterpart for $S$, give
$$
\begin{aligned}
(N_\epsilon)_{00}
 &=\sqrt{\lambda_\epsilon}(\gamma_u\gamma_v+u^{\mathsf T}D_\epsilon v),\\
\lambda_\epsilon(N_\epsilon^{-1})_{00}
 &=\sqrt{\lambda_\epsilon}(\gamma_u\gamma_v+u^{\mathsf T}D_\epsilon^{-\mathsf T}v).
\end{aligned}
$$
Use a singular-value decomposition of $D_\epsilon$, with singular values $d_{i,\epsilon}$. In the corresponding coordinates the difference of the two spatial terms has coefficients $(1-d_{i,\epsilon}^2)/d_{i,\epsilon}$. Cauchy–Schwarz and (8.8g.63.4) imply
$$
\left|\lambda_\epsilon(N_\epsilon^{-1})_{00}-(N_\epsilon)_{00}\right|
\le \frac{\sqrt{\lambda_\epsilon}}{2d_{4,\epsilon}}\,
\frac{\alpha_\epsilon+\beta_\epsilon-2\lambda_\epsilon}{\lambda_\epsilon}.
\tag{8.8g.63.5}
$$
The canonical eigenvalue $\lambda_\epsilon$ is the largest eigenvalue of $JN_\epsilon^{\mathsf T}JN_\epsilon$. It is bounded above by $(1+\epsilon)^2$ from the minimizing hyperboloid formula. Continuity of the characteristic polynomial and the real nonnegative eigenvalues established by the canonical form give the stated limiting $\lambda,d_i$. Invertibility of $N$ forces $\lambda>0$ and $d_4>0$. The normalized identity (8.8g.61a.1) gives
$$
\frac{\alpha+\beta-2\lambda}{\lambda}
=\frac{\sum_{i=1}^4d_i^2-3}{2}
\le \frac{d_4^2}{2},
$$
because $d_1,d_2,d_3\le1$. Passing to the limit in (8.8g.63.5) proves (8.8g.63.1). The cofactor identity $\det T=\det N\,(N^{-1})_{00}$ proves the invertible orientation statement.

For a singular nonproduct member use Corollary 8.8g.61a. The map is a scaled Lorentz isometry between two four-dimensional time-plus-spatial subspaces, with zero extension on omitted spatial lines. Its retained spatial block is invertible: for the retained matrix $M$ the inverse is a positive scalar multiple of $JM^{\mathsf T}J$, whose time-time entry is positive, and the same cofactor identity applies in dimension four. The full spatial block therefore has rank three.

*Right and left defects.* Suppose the first matrix in (8.8g.63.2) is positive semidefinite. Congruence by $N^{-1}$ gives $J\succeq\xi N^{-\mathsf T}JN^{-1}$. Both sides are real symmetric invertible with the same inertia. For two comparable such matrices, inversion reverses order. Indeed along their affine interpolation all ordered eigenvalues are monotone by the min–max principle, and their signs agree at the two endpoints. The interpolation stays invertible. Its inverse derivative is the negative congruence of the positive semidefinite derivative of the original interpolation. Integrating proves the order reversal. Thus $NJN^{\mathsf T}\succeq\xi J$. Transposition proves the converse. Congruence preserves rank, and the difference of two inverse matrices has the same rank as the original difference by multiplying on both sides by invertible factors. This proves the rank equality.

For the final assertion work directly with $q$ in the light form (8.8g.61.1). The Lorentz form on its two axial coordinates has off-diagonal entries one and zero diagonal entries. The plus basis vector is sent to $m$ times the minus basis vector. Its defect quadratic value is zero for any multiplier. Positive semidefiniteness therefore forces its entire row and column in the defect to vanish. The plus-minus entry of that row is $lm-\xi$, so the multiplier must be $lm$. Direct multiplication gives the remaining block in (8.8g.61.2) in the order transverse, then minus, and that block is positive semidefinite by the exact product-null criterion. The transpose gives the left statement. The ordinary determinant of the axial block is $-lm$, and its ordinary Schur complement is $B$, which gives (8.8g.63.3). ∎

<a id="theorem-88g64"></a>

<a id="theorem-88g64-unconditional-failure-of-product-null-face-projections"></a>**Theorem 8.8g.64 (Unconditional Failure of Product-Null Face Projections).** On the fixed Lorentz-five carrier, let $C$ be any convex intermediate cone satisfying $K_{\min}\subseteq C\subseteq K_{\max}$. Fix any normalized pure product $p$, let $F_p=C\cap p^\perp$, and let $P$ be the Frobenius orthogonal projection onto $\operatorname{span}F_p$. Among the nine explicit normalized pure products described below, at least one has image under $P$ at Frobenius distance at least $1/6480$ from $K_{\max}$. In particular no such projection is positive on $C$. If $C$ is acute, $F_p$ is not intrinsically self-dual in its span. No all-purity, regularity of the pure set, or separation from entangled pure states is required.

The same assertion holds for the product of two copies of a Lorentz cone with even spatial dimension $s\ge2$, with $(s-1)^2$ product witnesses. For odd spatial dimension the proof gives an exact necessary transverse projection condition.

*Proof.* Use the light coordinates of Lemma 8.8g.25 with $p=E_{++}$. Write $d=s-1$ for the transverse dimension, so $d=3$ on the fixed carrier. The argument giving the zero plus-plus entry and zero plus-transverse strips for every positive map in $p^\perp$ is independent of dimension. Thus every element of $F_p$ has the form
$$
\begin{pmatrix}0&\lambda&0\\\mu&\nu&v^{\mathsf T}\\0&w&B\end{pmatrix}.
\tag{8.8g.64.1}
$$
Let $\mathscr L_0$ be the subspace of this form with $B=0$. The products in which either factor is the minus light ray already span $\mathscr L_0$: a fixed minus left factor spans the entire minus row, and a fixed minus right factor spans the entire minus column, since the other local cone spans its carrier. They belong to $F_p$ by the minimum-cone inclusion. Therefore $\operatorname{span}F_p$ splits orthogonally as $\mathscr L_0\oplus V$, where $V$ is a subspace of the $d$-by-$d$ transverse block. In these coordinates $P$ keeps the three axial entries and two minus-transverse strips in (8.8g.64.1), applies the Frobenius projection $P_V$ to $B$, and removes the remaining entries.

For unit transverse vectors $x,y$, take the normalized pure product of the two light-coordinate vectors
$$
\left(\frac12,\frac12,\frac{x}{\sqrt2}\right),\qquad
\left(\frac12,\frac12,\frac{y}{\sqrt2}\right).
$$
They are future null and have local normalization one, so these products belong to $K_{\min}$. The projected product has $\lambda=\mu=\nu=1/4$, $v=y/(2\sqrt2)$, $w=x/(2\sqrt2)$ and $B=P_V(xy^{\mathsf T})/2$. In particular $2\lambda\nu-\|w\|^2=0$. The product-null positivity test of Theorem 8.8g.61 applies in every transverse dimension by the same quadratic proof, which checks all transverse input vectors. If this projected map belongs to $K_{\max}$, the zero last diagonal entry in the positive semidefinite test forces its corresponding off-diagonal vector to vanish. Hence $B^{\mathsf T}w=\lambda v$, or
$$
\bigl[P_V(xy^{\mathsf T})\bigr]^{\mathsf T}x=\frac y2.
\tag{8.8g.64.2}
$$
Taking its inner product with $y$ and using the defining identity of an orthogonal projection gives
$$
\|P_V(xy^{\mathsf T})\|_F^2
=\langle xy^{\mathsf T},P_V(xy^{\mathsf T})\rangle=\frac12 .
\tag{8.8g.64.3}
$$
This is necessary for positivity at each tested product. Use only the $d^2$ pairs $x=e_i$, $y=e_j$ of transverse basis vectors. The sum of the left sides of (8.8g.64.3) is $\operatorname{Tr}P_V=\dim V$, since the matrices $e_ie_j^{\mathsf T}$ form an orthonormal basis. The sum of the right sides is $d^2/2$. For even $s$, $d$ is odd, so these cannot agree. At least one projected product is therefore outside $K_{\max}$.

For the quantitative bound take $d=3$ and denote the selected projected product by $M$. Some basis pair satisfies $|\langle xy^{\mathsf T},P_V(xy^{\mathsf T})\rangle-1/2|\ge1/18$, by the integer trace. Let
$$
u=y^{\mathsf T}(\lambda v-B^{\mathsf T}w)
=\frac{1/2-\langle xy^{\mathsf T},P_V(xy^{\mathsf T})\rangle}{4\sqrt2}.
$$
Then $1/(72\sqrt2)\le|u|\le1/(8\sqrt2)$, using $0\le\langle xy^{\mathsf T},P_V(xy^{\mathsf T})\rangle\le1$. Put $\tau=16|u|\le\sqrt2$. Use the future null input $r=(\tau^2/2,1,-\operatorname{sgn}(u)\tau y)$. Its output $Mr=(\lambda,\eta,z)$ satisfies
$$
2\lambda\eta-\|z\|^2
\le \frac{\tau^2}{16}-2|u|\tau=-16u^2,
$$
by the affine quadratic from Theorem 8.8g.61 and the vanishing constant term. The future null output test $\ell=(1,\|z\|^2/(2\lambda^2),-z/\lambda)$ therefore gives $\langle\ell,Mr\rangle\le-32u^2$, since $\lambda=1/4$. Both are nonzero and future, and their local normalization in light coordinates is the sum of the two axial coordinates. For $r$ that sum is at most two. For $\ell$, use $\|B\|_{\rm op}\le\|B\|_F\le1/2$ for the projected block and hence $\|z\|\le\|w\|+\|B\|_{\rm op}\tau\le3/(2\sqrt2)$. Its local normalization is at most ten. The product of the two normalized null tests has norm one and pairs with $M$ to at most $-32u^2/20\le-1/6480$. Since it pairs nonnegatively with every element of $K_{\max}$, Cauchy–Schwarz gives the asserted distance bound.

Finally suppose $C$ is acute. For every $c\in C$ and $f\in F_p$, $\langle Pc,f\rangle=\langle c,f\rangle\ge0$. Hence $Pc$ lies in the intrinsic dual of $F_p$ on its span. Intrinsic self-duality would put all such images in $F_p\subseteq K_{\max}$, contradicting the finite witness. This proves the assertions. ∎

<a id="theorem-88g65"></a>

<a id="theorem-88g65-exact-local-product-null-projection-criterion"></a>**Theorem 8.8g.65 (Exact Local Product-Null Projection Criterion).** Use two Lorentz cones of the same spatial dimension $s\ge2$, with the Frobenius pairing and normalization of Proposition 8.8g.47. At a fixed pure product $p=E_{++}$ use light coordinates, and put $d=s-1$. Let $\mathscr L_0$ be the span of the minus row and minus column, and let $V\subseteq\operatorname{Mat}_d(\mathbb R)$ be any subspace in the transverse block. Let $\Pi$ be the Frobenius orthogonal projection onto $\mathscr L_0\oplus V$. The following conditions are equivalent.

1. $\Pi(K_{\min})\subseteq K_{\max}$.
2. The projected normalized products with local light vectors $(1/2,1/2,x/\sqrt2)$ and $(1/2,1/2,y/\sqrt2)$ belong to $K_{\max}$ for all unit transverse $x,y$.
3. The reflection $S=2P_V-I$ on the transverse tensor product is alternating in each pair of input and output indices. Explicitly,
$$
\langle u\otimes v,S(x\otimes y)\rangle
=-\langle x\otimes v,S(u\otimes y)\rangle
=-\langle u\otimes y,S(x\otimes v)\rangle
\tag{8.8g.65.1}
$$
for all transverse $u,v,x,y$.

The condition has a solution exactly when $s$ is odd. For even $s$, Theorem 8.8g.64 gives the finite projection obstruction. For odd $s$, any two orthogonal complex structures $J_1,J_2$ on the two real transverse spaces give a solution $S=J_1\otimes J_2$, with $V$ its positive eigenspace. This is a local projection statement. It does not assert that these subspaces are product-null face spans of an all-pure self-dual intermediate. For any actual intrinsically self-dual product-null face of an acute intermediate, condition 3 is necessary.

*Proof.* Condition 1 immediately implies condition 2. For condition 2, write $A=P_V(xy^{\mathsf T})$. As in Theorem 8.8g.64, the projected product has $\lambda=\mu=\nu=1/4$, $w=x/(2\sqrt2)$, $v=y/(2\sqrt2)$ and $B=A/2$. The bottom-right scalar of the Schur test (8.8g.61.2) is zero. Positivity therefore forces $A^{\mathsf T}x=y/2$. The same calculation for the transposed positive map gives $Ay=x/2$. It follows that $S(xy^{\mathsf T})^{\mathsf T}x=0$ and $S(xy^{\mathsf T})y=0$. By homogeneity these identities hold without unit normalization. Polarizing the first identity in $x$ and the second in $y$ gives (8.8g.65.1).

Conversely assume condition 3. Taking $u=x$ or $v=y$ gives the same zero contractions. Since $S$ is the reflection of an orthogonal projection, it is an orthogonal involution. For unit $x,y$, $S(xy^{\mathsf T})$ has Frobenius norm one and has both row and column spaces orthogonal to the corresponding directions of $xy^{\mathsf T}$. Thus the operator norm of their sum is the maximum of the two block norms, namely one. In particular
$$
A=\tfrac12\bigl(xy^{\mathsf T}+S(xy^{\mathsf T})\bigr)
\quad\Longrightarrow\quad
\|A\|_{\rm op}=\tfrac12,\qquad A^{\mathsf T}x=y/2,\qquad Ay=x/2 .
\tag{8.8g.65.2}
$$

Consider an arbitrary normalized pure product with local light vectors
$$
(1-a,a,\sqrt{2a(1-a)}\,x),\qquad
(1-b,b,\sqrt{2b(1-b)}\,y),
$$
where $a,b\in(0,1)$. Its image has axial and transverse entries
$$
\begin{gathered}
\lambda=(1-a)b,\qquad \mu=a(1-b),\qquad \nu=ab,\\
w=b\sqrt{2a(1-a)}\,x,\qquad
v=a\sqrt{2b(1-b)}\,y,\qquad
B=2\sqrt{\lambda\mu}\,A .
\end{gathered}
$$
The identity $\|w\|^2=2\lambda\nu$ is exact. Equation (8.8g.65.2) gives $B^{\mathsf T}w=\lambda v$ by substitution, and $\|B\|_{\rm op}=\sqrt{\lambda\mu}$. The Schur test (8.8g.61.2) is therefore a positive semidefinite upper block with zero last row and column. The proof of that test applies with $I_d$ in place of $I_3$. This proves Lorentz positivity for the projected product. Boundary values $a,b\in\{0,1\}$ follow by continuity and closedness of $K_{\max}$. The pure products generate $K_{\min}$, proving condition 1.

Every diagonal entry of a separately alternating $S$ in a product orthonormal basis is zero, so $\operatorname{Tr}S=0$ and $\dim V=d^2/2$. Thus $d$ must be even. When $d$ is even, let $J_1,J_2$ be orthogonal real skew-symmetric maps squaring to $-I$ on their respective transverse spaces. Then $J_1\otimes J_2$ is symmetric, orthogonal, squares to $I$, and is alternating in each pair of indices. Its positive eigenspace gives the stated $V$. Finally the span of every actual product-null face has the form $\mathscr L_0\oplus V$ by the minimum-cone inclusion, as in Theorem 8.8g.64. If an acute intermediate's face is self-dual in that span, orthogonal projection of every product lies in the face. Hence the necessary condition follows. ∎

<a id="theorem-88g66"></a>

<a id="theorem-88g66-exact-product-face-support-test-from-entangled-pure-accumulations"></a>**Theorem 8.8g.66 (Exact Product-Face Support Test from Entangled Pure Accumulations).** Let $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ be an all-pure self-dual intermediate on the Lorentz-five carrier. Fix a normalized pure product $p=E_{++}$ in light coordinates, write $\mathcal T$ for the normalized pure set, $E=\mathcal T\setminus\mathcal P$ for its entangled part, and put $u_p=U-p$. Write $\mathscr L_p$ for the eighteen-dimensional product-null subspace of Theorem 8.8g.62. Let $V_p$ be the span of the transverse blocks of $F_p=C\cap p^\perp$. For $q\in\mathcal T$ put $a_p(q)=1-\langle p,q\rangle$. The following are necessary and sufficient tests for the stated local support properties. The supremum of an empty set of nonnegative ratios is taken to be zero.

1. For a transverse block $Z$ viewed as an element of $\mathscr L_p$, there exists a $t>0$ with $u_p+tZ\in F_p$ if and only if
$$
\sup_{\substack{q\in E\\q\ne p}}
\frac{(-\langle Z,q\rangle)_+}{a_p(q)}<\infty.
$$
The supremum may be taken only over $E$ in any fixed neighborhood of $p$.
2. If $Z$ is a nonzero transverse block in $V_p^\perp$, the ratios in item 1 are infinite for both $Z$ and $-Z$. For each such direction there are sequences of entangled pure states $q_n^\pm\to p$ with
$$
\frac{\pm\langle Z,q_n^\pm\rangle}{\|q_n^\pm-p\|_F^2}\longrightarrow+\infty .
$$
In particular a product-null face of less than full span requires two-sided transverse accumulation at its product in every missing transverse direction.
3. Put $W_p=\operatorname{span}F_p$ and let $P_{W_p}$ be its orthogonal projection. The element $u_p$ is in the relative interior of $F_p$ exactly when
$$
\sup_{\substack{q\in E\\q\ne p}}\frac{\|P_{W_p}q\|_F}{a_p(q)}<\infty .
$$
If an entangled sequence approaches $p$ with a first-order normalized tangent whose transverse component is not orthogonal to $V_p$, then $u_p$ lies on the relative boundary of $F_p$. If the full projected quadratic-ratio bound holds with $\mathscr L_p$ in place of $W_p$, the face spans $\mathscr L_p$ and $u_p$ is relatively interior there.

*Proof.* The all-pure norm condition makes every normalized state have norm at most one, so self-duality puts $u_p=U-p$ in $C$. The pairing with $p$ is zero. By the light-ray argument of Lemma 8.8g.25, $F_p\subseteq\mathscr L_p$. It contains all products with the minus ray in either factor. Their linear span $\mathscr L_0$ is the complete minus row and column in the allowed coordinates. Thus $W_p=\mathscr L_0\oplus V_p$ orthogonally, after placing $V_p$ in the transverse block.

For every normalized pure $q$, the unit norms give $a_p(q)=\|q-p\|_F^2/2$, which is positive for $q\ne p$. Also $a_p(q)=q_{+,-}+q_{-,+}+q_{-,-}$ in light coordinates. These three entries are nonnegative by Lorentz positivity. The future-light conditions on $q e_-$ and $q^{\mathsf T}e_-$ bound the squares of the two minus strips by $2q_{+,-}q_{-,-}$ and $2q_{-,+}q_{-,-}$, respectively. If $b=q_{-,-}$, the sum of the three squared axial entries is at most $(a_p(q)-b)^2+b^2$, and the sum of the two squared strip norms is at most $2b(a_p(q)-b)$. Thus $\|P_{\mathscr L_0}q\|_F\leq a_p(q)$. In item 3 all possible divergence comes from the transverse projection onto $V_p$.

For the product pure states, Theorem 8.8g.62 proves $\|P_{\mathscr L_p}q\|_F\leq\sqrt6\,a_p(q)$, using only the product formula. Consequently all the displayed quotients for products are bounded by the appropriate multiples of $\sqrt6$. At $p$ every test direction in $\mathscr L_p$ pairs to zero. For $q$ outside any fixed ball about $p$, the denominator is bounded away from zero while the numerator is bounded by the norm of the chosen direction or projection. Thus every divergence concerns entangled pure states tending to $p$.

Since the normalized pure states generate the base and $C=C^*$, for any $Z\in\mathscr L_p$ one has
$$
u_p+tZ\in F_p
\quad\Longleftrightarrow\quad
a_p(q)+t\langle Z,q\rangle\geq0
\quad\hbox{for every }q\in\mathcal T .
$$
This proves item 1, including its use on a nontransverse direction if desired. If $Z$ is a nonzero missing transverse direction, neither $u_p+tZ$ nor $u_p-tZ$ for $t>0$ can belong to $F_p$, since they do not lie in its span. The two infinite ratios and the asserted sequences now follow from item 1 and the squared-distance identity.

Finally, a relative ball of radius $t$ about $u_p$ in $W_p$ is contained in $F_p$ exactly when $a_p(q)\geq t\|P_{W_p}q\|_F$ for all $q\in\mathcal T$. This proves item 3. If $(q_n-p)/\|q_n-p\|_F$ tends to a vector with nonzero projection on $V_p$, its projected numerator is of order $\|q_n-p\|_F$, while its denominator is of order $\|q_n-p\|_F^2$. The relative-interior criterion then fails. Repeating the ball argument in $\mathscr L_p$ proves the last assertion. $\square$

<a id="theorem-88g67"></a>

<a id="theorem-88g67-opposite-product-faces-and-the-double-null-projection-test"></a>**Theorem 8.8g.67 (Opposite Product Faces and the Double-Null Projection Test).** Use the two Lorentz-five carriers, the Frobenius pairing and normalization of Theorem 8.8g.23. Choose a product frame and use the orthonormal light coordinates of Lemma 8.8g.25, so that two opposite corners are \(p=E_{++}\) and \(p'=E_{--}\). For any intermediate cone \(C\), let \(F=C\cap p^\perp\cap(p')^\perp\). Its span has the form \(\mathscr L_V=\operatorname{span}\{E_{+-},E_{-+}\}\oplus V\), where \(V\subseteq\operatorname{Mat}_3(\mathbb R)\) is in the transverse block. The orthogonal projection \(\Pi_V\) to this span satisfies
\[
\Pi_V(K_{\min})\subseteq K_{\max}
\quad\Longleftrightarrow\quad
\|B\|_{\rm op}\le \frac{\|B\|_F}{\sqrt2}\quad(B\in V).
\tag{8.8g.67.1}
\]
Any such \(V\) has dimension at most four. The dimension bound is attained locally by \(V=\mathbb RI_3\oplus\mathfrak{so}(3)\).

If \(C\) is also all-pure and \(F\) is self-dual in its own span, then (8.8g.67.1) holds, \(\dim\operatorname{span}F\le6\), and
\[
F=\left\{
\begin{pmatrix}
0&\lambda&0\\
\mu&0&0\\
0&0&B
\end{pmatrix}:
\lambda,\mu\ge0,\ B\in V,\ \|B\|_F^2\le2\lambda\mu
\right\}.
\tag{8.8g.67.2}
\]
Conversely, for every \(V\) satisfying (8.8g.67.1), the cone on the right of (8.8g.67.2) is intrinsically self-dual, has unit normalized extreme points, lies in \(K_{\max}\), and contains the whole opposite-product face of \(K_{\min}\). This constructs a cone on the double-null subspace.

*Proof.* In the light coordinates, \(L=\{(\alpha,\beta,x):\alpha,\beta\ge0,\ \|x\|^2\le2\alpha\beta\}\), and the local normalizer is \(\alpha+\beta\). A positive map annihilating \(p\) has zero plus-plus entry and zero plus-transverse strips by the argument of Theorem 8.8g.61. Applying the same argument with plus and minus exchanged to \(p'\) removes the minus-minus entry and minus-transverse strips. Thus every double-null positive map has the form
\[
M(\lambda,\mu,B)=
\begin{pmatrix}0&\lambda&0\\ \mu&0&0\\0&0&B\end{pmatrix}.
\]
It is positive precisely when \(\lambda,\mu\ge0\) and \(\|B\|_{\rm op}^2\le\lambda\mu\). Indeed it maps \((\alpha,\beta,x)\) to \((\lambda\beta,\mu\alpha,Bx)\), and every transverse direction occurs on the input null boundary. In particular \(E_{+-},E_{-+}\) are the two remaining pure products in the frame and belong to \(F\). Subtracting the axial parts in the linear span then gives \(\mathscr L_V\) as stated.

To check positivity of \(\Pi_V\) on \(K_{\min}\), it suffices to check the generating pure products \((\alpha,\beta,x)(\gamma,\delta,y)^{\mathsf T}\). Their projections have \(\lambda=\alpha\delta\), \(\mu=\beta\gamma\) and \(B=P_V(xy^{\mathsf T})\), with \(P_V\) the transverse Frobenius projection. For pure factors with nonzero transverse vectors, \(\|x\|\|y\|=2\sqrt{\lambda\mu}\). If either transverse vector is zero, the projected transverse block is zero. Every pair of unit transverse directions occurs with positive axial coordinates. Consequently the left side of (8.8g.67.1) is equivalent to
\[
\sup_{\|u\|=\|v\|=1}\|P_V(uv^{\mathsf T})\|_{\rm op}\le\frac12.
\tag{8.8g.67.3}
\]
For unit rank-one matrices \(R,S\), orthogonal projection gives \(\langle S,P_V R\rangle=\langle P_V S,P_V R\rangle\). Its supremum in absolute value over \(R,S\) equals \(\sup_R\|P_V R\|_F^2\): Cauchy–Schwarz gives the upper bound, and \(S=R\) gives equality at a maximizer. Taking the supremum over \(S\) at fixed \(R\) gives the operator norm in (8.8g.67.3). Also \(\sup_R\|P_V R\|_F=\sup_{B\in V,\ \|B\|_F=1}\|B\|_{\rm op}\) by exchanging the suprema in \(|\langle B,R\rangle|\), with the zero space immediate. These identities prove (8.8g.67.1).

For independent uniform unit vectors \(u,v\in\mathbb R^3\), the mean square pairing \(\mathbb E|\langle B,uv^{\mathsf T}\rangle|^2\) is \(\|B\|_F^2/9\) by their two second moments. Summing over an orthonormal basis of \(V\) gives \(\mathbb E\|P_V(uv^{\mathsf T})\|_F^2=\dim V/9\). Condition (8.8g.67.3) therefore gives \(\dim V\le4\). To see sharpness, write \(B=tI_3+S\) with \(S\) real skew-symmetric. If \(S\) has singular values \(s,s,0\), then \(B^{\mathsf T}B=t^2I-S^2\) gives \(\|B\|_{\rm op}^2=t^2+s^2\) and \(\|B\|_F^2=3t^2+2s^2\). Thus this four-dimensional space satisfies (8.8g.67.1).

Suppose \(C\) is all-pure. Each normalized extreme point of \(F\) is an extreme point of the normalized base of \(C\), since \(F\) is a face, so it has norm one. The normalization on \(M(\lambda,\mu,B)\) is \(e(M)=\lambda+\mu\). Therefore for such a point \(\|B\|_F^2=1-\lambda^2-\mu^2=2\lambda\mu\). The cone \(D_V\) on the right of (8.8g.67.2) is closed, convex and self-dual in \(\mathscr L_V\). The isometric coordinates \(((\lambda+\mu)/\sqrt2,(\lambda-\mu)/\sqrt2,B)\) turn it into the usual Euclidean Lorentz cone. Since the normalized face is compact and generated by its extreme points, \(F\subseteq D_V\). If \(F\) is intrinsically self-dual, dualizing within its span gives \(D_V\subseteq F\), so equality holds. The resulting inclusion \(D_V\subseteq K_{\max}\) applied at \(\lambda=\mu=\|B\|_F/\sqrt2\) proves the right side of (8.8g.67.1) for all \(B\in V\).

Finally if (8.8g.67.1) holds then \(\|B\|_F^2\le2\lambda\mu\) implies \(\|B\|_{\rm op}^2\le\lambda\mu\), so \(D_V\subseteq K_{\max}\). Its normalized extreme points satisfy the norm-one boundary identity just computed, including its two axial endpoints. A pure product orthogonal to both \(p\) and \(p'\) must be one of \(E_{+-}\) and \(E_{-+}\), because its plus-plus and minus-minus entries vanish while each local factor is future and nonzero. The corresponding face of \(K_{\min}\) is generated by those two rays. Hence \(D_V\) contains the entire double-null minimal face. No compatibility of these local cones with the pure generators of an all-pure global intermediate is inferred. \(\square\)

<a id="theorem-88g68"></a>

<a id="theorem-88g68-exact-tangent-locus-at-a-lorentz-five-pure-product"></a>**Theorem 8.8g.68 (Exact Tangent Locus at a Lorentz-Five Pure Product).** Let \(\mathcal Q\) be the normalized Frobenius-unit Lorentz-positive set of Theorem 8.8g.23, and let \(p\) be any normalized pure product. In the orthonormal light coordinates with \(p=E_{++}\), the contingent tangent cone of \(\mathcal Q\) at \(p\) is precisely
\[
\left\{\begin{pmatrix}
0&0&v^{\mathsf T}\\
0&0&0\\
w&0&B
\end{pmatrix}:
v,w\in\mathbb R^3,\quad
B\in\operatorname{Mat}_3(\mathbb R),\quad
\|B\|_{\rm op}\le\frac{\|B\|_F}{\sqrt2}
\right\}.
\tag{8.8g.68.1}
\]
The \(v,w\) directions are the product-manifold tangent space. Every tangent limit of the actual pure states of any candidate all-pure intermediate lies in (8.8g.68.1). Every vector in (8.8g.68.1) has a curve in the full locus \(\mathcal Q\) with that first derivative. The assertion does not require the chosen intermediate to contain those curves.

*Proof.* In light coordinates use
\[
L=\{(x_+,x_-,z):x_\pm\ge0,\ \|z\|^2\le2x_+x_-\}.
\]
The normalization \(e(q)=1\) is the sum of the four axial matrix entries. For \(q\in\mathcal Q\) write
\[
q=\begin{pmatrix}
1-h&\lambda&v_q^{\mathsf T}\\
\mu&\nu&b_q^{\mathsf T}\\
w_q&a_q&B_q
\end{pmatrix},\qquad
\lambda,\mu,\nu\ge0,\quad \lambda+\mu+\nu=h.
\tag{8.8g.68.2}
\]
Since \(p\) and \(q\) are both unit vectors, \(h=1-\langle p,q\rangle=\|q-p\|_F^2/2\). Positivity of \(q\) and its transpose applied to the two light rays gives
\[
\begin{aligned}
\|v_q\|^2&\le2(1-h)\lambda,&
\|w_q\|^2&\le2(1-h)\mu,\\
\|b_q\|^2&\le2\mu\nu,&
\|a_q\|^2&\le2\lambda\nu .
\end{aligned}
\tag{8.8g.68.3}
\]
All axial entries are nonnegative by the same tests. Consider any sequence \(q_j\ne p\) tending to \(p\). The four axial variations and the two minus-transverse strips in \(q_j-p\) are \(O(h_j)\). The remaining entries, including \(B_{q_j}\), are \(O(\sqrt{h_j})\). After a subsequence take \(\nu_j/h_j\to\zeta\) and \(B_{q_j}/\sqrt{h_j}\to B_*\). By the unit identity and (8.8g.68.3),
\[
\begin{aligned}
\|B_{q_j}\|_F^2
&=2h_j-h_j^2-\lambda_j^2-\mu_j^2-\nu_j^2
-\|v_{q_j}\|^2-\|w_{q_j}\|^2-\|a_{q_j}\|^2-\|b_{q_j}\|^2\\
&\ge 2h_j-2(1-h_j)(\lambda_j+\mu_j)-O(h_j^2)
=2\nu_j-O(h_j^2).
\end{aligned}
\tag{8.8g.68.4}
\]
It follows that \(\|B_*\|_F^2\ge2\zeta\).

Put \(D_j=\operatorname{diag}(h_j^{1/4},h_j^{-1/4},I_3)\). This map and its inverse preserve \(L\), since both axial coordinates remain nonnegative and their product is unchanged. Thus \(D_jq_jD_j/\sqrt{h_j}\) is Lorentz-positive. The plus-plus entry tends to one and the minus-minus entry is \(\nu_j/h_j\). The two axial cross entries tend to zero because their original size is \(O(h_j)\) and the two diagonal factors multiply to one. The plus-transverse entries after multiplication and division are \(O(h_j^{1/4})\), and the minus-transverse ones are also \(O(h_j^{1/4})\) by their \(O(h_j)\) original bounds. Therefore
\[
\frac{D_jq_jD_j}{\sqrt{h_j}}\longrightarrow
\operatorname{diag}(1,\zeta,B_*).
\]
The limit is Lorentz-positive by closure. Its action on null inputs \((x_+,x_-,z)\) with \(\|z\|^2=2x_+x_-\) gives \(\|B_*\|_{\rm op}^2\le\zeta\). Combining with (8.8g.68.4) gives \(\|B_*\|_{\rm op}^2\le\|B_*\|_F^2/2\).

A nonzero contingent tangent is a limit of \((q_j-p)/t_j\) with \(t_j>0\), \(t_j\to0\); then \(\sqrt{h_j}/t_j\) tends to the tangent's norm divided by \(\sqrt2\). The preceding argument therefore imposes the same norm inequality on its transverse block and removes exactly the displayed axial and minus-transverse directions. The zero tangent is immediate. This proves necessity.

For sufficiency, fix \(B\) satisfying the norm inequality. For small real \(t\), choose
\[
\alpha_t=\frac{1+\sqrt{1-2t^2\|B\|_F^2}}2,\qquad
\beta_t=1-\alpha_t,\qquad
q_t=\operatorname{diag}(\alpha_t,\beta_t,tB).
\]
Its normalization is one and its squared Frobenius norm is one because \(2\alpha_t\beta_t=t^2\|B\|_F^2\). It is Lorentz-positive by \(\|tB\|_{\rm op}^2\le\alpha_t\beta_t\), the same direct diagonal positivity test. Thus \(q_t=p+t\operatorname{diag}(0,0,B)+O(t^2)\) is an actual curve in \(\mathcal Q\). Independently applying two differentiable local spatial rotations to its left and right preserves its normalization, Frobenius norm and Lorentz positivity. At \(p\), differentiating the pure product under these rotations gives arbitrary first-order plus-transverse strips \(v,w\), since the local pure vectors lie on a spatial unit sphere with full three-dimensional tangent at either chosen direction. The rotations act on the \(tB\) term only at order \(t^2\). This produces every direction in (8.8g.68.1). \(\square\)

<a id="theorem-88g69"></a>

<a id="theorem-88g69-constraints-on-transverse-accumulation-at-a-product"></a>**Theorem 8.8g.69 (Constraints on Transverse Accumulation at a Product).** Let \(K_{\min}\subseteq C=C^*\subseteq K_{\max}\) be all-pure on the Lorentz-five carrier of Theorem 8.8g.23. At a pure product \(p=E_{++}\), use the light coordinates of Theorem 8.8g.68 and write \(F_p=C\cap p^\perp\), \(V_p\) for the span of its transverse blocks, and \(u_p=U-p\). For a normalized pure state \(q\), let \(B(q)\) be its transverse block and \(h(q)=1-\langle p,q\rangle\). Suppose \(q_j\ne p\) tends to \(p\) with
\[
\frac{\|B(q_j)\|_F}{h(q_j)}\longrightarrow+\infty,\qquad
\frac{B(q_j)}{\|B(q_j)\|_F}\longrightarrow B_\infty .
\tag{8.8g.69.1}
\]
Then
\[
\|B_\infty\|_F=1,\qquad
\|B_\infty\|_{\rm op}\le\frac1{\sqrt2},\qquad
\langle B_\infty,B(f)\rangle_F\ge0\quad(f\in F_p).
\tag{8.8g.69.2}
\]
If \(u_p\in\operatorname{relint}F_p\), then also \(B_\infty\in V_p^\perp\). In particular, if \(u_p\in\operatorname{relint}F_p\) and \(V_p\ne\operatorname{Mat}_3(\mathbb R)\), the missing subspace \(V_p^\perp\) contains a unit matrix of operator norm at most \(1/\sqrt2\). A nonzero missing subspace consisting entirely of matrices of rank at most one is therefore incompatible with \(u_p\in\operatorname{relint}F_p\). This includes any missing subspace with one common column direction or one common row direction.

*Proof.* Write \(h_j=h(q_j)\). By unit normalization, \(\|q_j-p\|_F=\sqrt{2h_j}\). In ordinary time-space coordinates the two spatial marginals of \(2q_j\) are both within \(O(\sqrt{h_j})\) of the unit spatial vectors of the two factors of \(p\). For all large \(j\) they are nonzero. Rotate each of their directions to the corresponding vector of \(p\), by two local spatial orthogonal maps differing from the identity by \(O(\sqrt{h_j})\) in operator norm. Extend them by the identity on the respective time axes. Left and right multiplication with the corresponding maps, with the right map transposed, gives \(q'_j\in\mathcal Q\), since these rotations preserve the local Lorentz cones, the product normalizer and the Frobenius norm. The maps are used to analyze \(\mathcal Q\). No invariance of \(C\) under them is assumed.

The two rotations change the transverse block of \(q_j-p\) by \(O(h_j)\), by multiplying its \(O(\sqrt{h_j})\) Frobenius bound by the \(O(\sqrt{h_j})\) rotation changes. For the rotated \(p\), each local factor has transverse norm \(O(\sqrt{h_j})\), so the new product transverse block is also \(O(h_j)\). Thus
\[
B(q'_j)=B(q_j)+O(h_j),\qquad
h'_j:=1-\langle p,q'_j\rangle=\tfrac12\|q'_j-p\|_F^2=O(h_j).
\]
The first limit in (8.8g.69.1) implies that \(B(q'_j)\ne0\) eventually and that its unit direction still tends to \(B_\infty\).

Both ordinary spatial marginals of \(2q'_j\) have zero transverse components. In light coordinates the time vector is proportional to the sum of the two axial light vectors. Thus the two plus-transverse strips are the negatives of their corresponding minus-transverse strips. The latter have size \(O(h'_j)\) by (8.8g.68.3), as do all axial entries of \(q'_j-p\). Applying the unit norm identity gives
\[
\|B(q'_j)\|_F^2=2h'_j+O((h'_j)^2).
\]
Consequently \((q'_j-p)/\|B(q'_j)\|_F\) tends to the tangent with transverse block \(B_\infty\) and all other entries zero. Theorem 8.8g.68 gives its asserted operator norm bound.

For the pairing statement return to the unrotated states \(q_j\in C\). Every \(f\in F_p\) has zero plus-plus entry and zero plus-transverse strips. Its remaining axial and strip pairings with \(q_j\) are \(O_f(h_j)\), by (8.8g.68.2)–(8.8g.68.3). Since \(C\) is acute,
\[
0\le \langle f,q_j\rangle_F=\langle B(f),B(q_j)\rangle_F+O_f(h_j).
\]
Divide by \(\|B(q_j)\|_F\) and take the limit to get (8.8g.69.2). If \(u_p\) is relatively interior, Theorem 8.8g.66 bounds \(\|P_{V_p}B(q_j)\|_F/h_j\). The same division therefore gives \(P_{V_p}B_\infty=0\). For proper \(V_p\), take a nonzero missing direction \(Z\) and use the divergence in Theorem 8.8g.66. Its sequences have \(\|B(q_j)\|_F/h_j\to+\infty\), and a subsequence gives a limit as in (8.8g.69.1). This proves the existence assertion on the missing subspace.

Quantitatively, if \(W\) is any subspace consisting of rank-at-most-one matrices, its Frobenius orthogonal projection satisfies
\[
\|P_WB_\infty\|_F
=\sup_{\substack{Z\in W\\\|Z\|_F=1}}|\langle Z,B_\infty\rangle_F|
\le\|B_\infty\|_{\rm op}\le1/\sqrt2
\]
when \(W\ne\{0\}\), with the zero space immediate. Thus every such limit has distance at least \(1/\sqrt2\) from \(W\). The bound is sharp on the ambient allowed unit directions, for \(W=\mathbb R E_{11}\) and \(B_\infty=(E_{11}+E_{22})/\sqrt2\). In particular the limit cannot lie in a nonzero rank-one-only missing subspace. The result concerns the actual face and the stated relative-interior condition. It supplies no global acute-pool completion or obstruction. \(\square\)

<a id="theorem-88g70"></a>

<a id="theorem-88g70-adjacent-product-tangent-separation"></a>**Theorem 8.8g.70 (Adjacent-Product Tangent Separation).** Let \(K_{\min}\subseteq C\subseteq K_{\max}\) be an acute intermediate on the Lorentz-five carrier, and write \(\mathcal T=C\cap\mathcal Q\). Choose a pure product frame and two adjacent corners \(p=E_{++}\), \(p'=E_{+-}\) in its orthonormal light coordinates. The same conclusions hold for \(p'=E_{-+}\). Suppose two-sided curves of actual unit states in \(\mathcal T\) have first derivatives at \(p,p'\) which are purely transverse, with transverse blocks \(B,B'\), respectively. Use the same \(3\times3\) transverse coordinates at the two corners. Define
\[
d(B)=\frac{\|B\|_F^2}{2}-\|B\|_{\rm op}^2.
\]
Then
\[
\big|\langle B,B'\rangle_F\big|
\le2\sqrt{d(B)d(B')}
\le\frac13\|B\|_F\|B'\|_F .
\tag{8.8g.70.1}
\]
If either derivative has rank two, the pairing is zero. In particular, if there are embedded \(C^1\) pure manifolds through the two products, the purely transverse parts of their tangent spaces have trivial intersection and their orthogonal cross-projection has norm at most \(1/3\).

If the entire actual normalized pure set of an all-pure self-dual \(C\) is a \(C^{1,1}\) embedded manifold near a product \(p\), its tangent is the direct sum of the six product tangent directions and a transverse subspace \(W_p\), with
\[
\dim W_p\le4,\qquad V_p=W_p^\perp,\qquad U-p\in\operatorname{relint}(C\cap p^\perp).
\tag{8.8g.70.2}
\]
Here \(V_p\) is the actual transverse span of Theorem 8.8g.66. In particular the local pure-manifold dimension is \(15-\dim V_p\), between six and ten. In dimension six the product \(p\) is separated from all entangled pure states.

*Proof.* Write the curve at \(p\) as \(q(t)=p+tB+o(t)\), with \(B\) inserted in the transverse block. First take \(B\ne0\). In the notation of (8.8g.68.2), the unit identity gives
\[
h(t)/t^2\longrightarrow\|B\|_F^2/2 .
\]
Take a sequence attaining the lower limit of \(\nu(t)/t^2\), and if necessary pass to a subsequence of fixed sign of \(t\). The two-sided light boost in Theorem 8.8g.68 shows that the corresponding limit of \(\nu(t)/h(t)\) is at least the squared operator norm of the limit of \(B(q(t))/\sqrt{h(t)}\). This last matrix is \(\pm \sqrt2\,B/\|B\|_F\). Thus
\[
\liminf_{t\to0}\frac{\nu(t)}{t^2}\ge \|B\|_{\rm op}^2.
\]
Both adjacent-corner entries are nonnegative and each is at most \(h(t)-\nu(t)\), since \(\lambda+\mu+\nu=h\). Consequently
\[
\limsup_{t\to0}\frac{\langle q(t),p'\rangle}{t^2}\le d(B).
\tag{8.8g.70.3}
\]
If \(B=0\), then \(h(t)=o(t^2)\), which proves the same inequality directly. Exchanging the plus and minus axes of the appropriate factor proves the reverse estimate for the curve \(q'(s)=p'+sB'+o(s)\). These exchanges keep the transverse coordinates unchanged.

For each fixed real \(c\ne0\), take \(s=ct\). Orthogonality of \(p,p'\) gives the exact expansion
\[
\langle q(t),q'(ct)\rangle
=\langle q(t),p'\rangle+\langle p,q'(ct)\rangle+
c t^2\langle B,B'\rangle_F+o(t^2).
\]
It is nonnegative by acuteness. Divide by \(t^2\) and use the two upper limits (8.8g.70.3), obtaining \(d(B)+c\langle B,B'\rangle_F+c^2d(B')\ge0\) for every real \(c\), with \(c=0\) following by continuity. By Theorem 8.8g.68, \(d(B),d(B')\ge0\). The discriminant condition gives the first inequality in (8.8g.70.1), including the zero-coefficient cases. Since every \(3\times3\) matrix has \(\|B\|_{\rm op}^2\ge\|B\|_F^2/3\), the second inequality follows. If \(B\) has rank two, its two nonzero squared singular values must coincide by Theorem 8.8g.68. Then \(d(B)=0\). On a \(C^1\) embedded manifold each tangent has a two-sided differentiable realizing curve, so the bound holds for each pair of vectors in the purely transverse tangent subspaces. The subspace statements follow from the resulting pairing bound.

Now assume the regularity of the entire actual pure set near \(p\) in (8.8g.70.2). Its tangent contains the six directions of the product submanifold and lies in the tangent locus of Theorem 8.8g.68. It is linear, so it is the direct sum of those six directions and a transverse space \(W_p\) with \(\|B\|_{\rm op}\le\|B\|_F/\sqrt2\) on \(W_p\). The averaging argument in Theorem 8.8g.67 gives \(\dim W_p\le4\). For each \(f\in F_p\), nonnegativity of its pairing with the actual pure states has a minimum of zero at \(p\), so its derivative in every tangent direction vanishes. In particular \(W_p\subseteq V_p^\perp\).

A \(C^{1,1}\) embedded manifold is locally a graph over its tangent with normal remainder bounded by a constant times squared displacement from the base point. Indeed use the local tangent projection as a coordinate chart and apply the integral first-order remainder estimate for the graph function with Lipschitz derivative. Every transverse \(Z\in W_p^\perp\) is perpendicular to the entire tangent, including the six product directions. It follows for every actual pure \(q\) sufficiently close to \(p\) that \(|\langle Z,q\rangle|\le C\|Z\|_F\|q-p\|_F^2\) with a uniform constant on those \(Z\). Since \(\|q-p\|_F^2=2h(q)\), the two-sided support test of Theorem 8.8g.66 puts \(Z\) in \(V_p\). Thus \(V_p=W_p^\perp\). The same bound gives \(\|P_{V_p}B(q)\|_F=O(h(q))\), and the nontransverse projection has that bound by the strip estimate in the proof of Theorem 8.8g.66. Its relative-interior test then gives \(U-p\in\operatorname{relint}F_p\).

If the manifold dimension is six, its product submanifold has the same dimension and is locally open in it, by the inverse function theorem for the inclusion in local coordinates. The entire actual pure locus near \(p\) therefore consists of products. This proves separation from the entangled pure states and completes the proof. \(\square\)

<a id="theorem-88g71"></a>

<a id="theorem-88g71-adjacent-tangents-to-a-skew-symmetric-transverse-space"></a>**Theorem 8.8g.71 (Adjacent Tangents to a Skew-Symmetric Transverse Space).** Use the acute Lorentz-five intermediate and adjacent product corners of Theorem 8.8g.70. Let \(W,W'\) be linear spaces of purely transverse directions at the two corners, each direction realized by a two-sided differentiable curve of actual unit states at its corner. Suppose that \(W\) contains \(R\mathfrak{so}(3)S^{\mathsf T}\) for orthogonal \(3\times3\) matrices \(R,S\). Then \(\dim W'\le3\). In particular, if the actual normalized pure set is a \(C^1\) embedded manifold near both corners, and its transverse tangent at one corner is \(R(\mathbb RI_3\oplus\mathfrak{so}(3))S^{\mathsf T}\), the pure manifold at the adjacent corner has dimension at most nine.

*Proof.* Left and right multiplication by fixed orthogonal matrices preserves both transverse matrix norms and their Frobenius pairing. Apply \(B\mapsto R^{\mathsf T}BS\) to both spaces. Each nonzero member of \(\mathfrak{so}(3)\) has rank two and equal nonzero singular values. The zero-pairing clause of Theorem 8.8g.70 therefore puts \(W'\) in \(\mathfrak{so}(3)^\perp=\operatorname{Sym}(3,\mathbb R)\).

Write \(W'_0=\{A\in W':\operatorname{Tr}A=0\}\). A nonzero traceless real symmetric \(3\times3\) matrix \(A\) with \(\|A\|_{\rm op}^2\le \|A\|_F^2/2\) has eigenvalues \(\lambda,-\lambda,0\). Indeed, change its sign if necessary so that an eigenvalue of maximum absolute value is \(\lambda>0\). The other two eigenvalues are nonpositive. If one were positive, the negative eigenvalue would have larger magnitude than \(\lambda\), by the zero trace. Thus they can be written \(-a,-b\) with \(a,b\ge0\) and \(a+b=\lambda\). The norm bound gives \(\lambda^2\le a^2+b^2=\lambda^2-2ab\), so \(ab=0\).

It follows from Theorem 8.8g.68 that all matrices of \(W'_0\) are singular. If \(W'_0\) is nonzero, scale one of its nonzero elements and use an orthogonal change of basis to take it to \(D=\operatorname{diag}(1,-1,0)\). For \(A\in W'_0\), the polynomial \(\det(D+tA)\) is identically zero. Its coefficient of \(t\) is \(-A_{33}\), and, after setting \(A_{33}=0\), its coefficient of \(t^2\) is \(A_{13}^2-A_{23}^2\). Thus \(A_{33}=0\), \(A_{22}=-A_{11}\), and \((A_{13}-A_{23})(A_{13}+A_{23})=0\) for every \(A\in W'_0\). The two factors are linear on \(W'_0\). One of them must vanish identically, since a real vector space cannot be the union of two proper linear hyperplanes. Choose the corresponding common sign \(\varsigma\in\{1,-1\}\) so that \(A_{23}=\varsigma A_{13}\) on \(W'_0\). Now
\[
\det A=2\varsigma A_{12}A_{13}^2=0\qquad(A\in W'_0).
\]
The same linear-factor argument gives either \(A_{12}=0\) throughout \(W'_0\) or \(A_{13}=0\) throughout \(W'_0\). In either case at most two independent matrix entries remain. Therefore \(\dim W'_0\le2\), including the zero case. The trace contributes at most one more dimension, proving \(\dim W'\le3\).

For the final assertion the tangent of the pure manifold contains the six product tangent directions. Theorem 8.8g.68 puts all other directions in the transverse block after subtracting those six directions. Every vector in that block is realized by a two-sided curve in the manifold, so the bound just proved gives total dimension at most nine. The skew-symmetric subspace hypothesis concerns the actual transverse tangent space at one corner. This proof makes no classification assertion for arbitrary four-dimensional transverse subspaces. \(\square\)

<a id="theorem-88g72"></a>

<a id="theorem-88g72-classification-of-the-four-dimensional-transverse-spaces"></a>**Theorem 8.8g.72 (Classification of the Four-Dimensional Transverse Spaces).** Let \(W\subseteq\operatorname{Mat}_3(\mathbb R)\) be a four-dimensional real linear space such that
\[
\|A\|_{\rm op}^2\le\frac12\|A\|_F^2\qquad(A\in W).
\tag{8.8g.72.1}
\]
Then \(W=R(\mathbb RI_3\oplus\mathfrak{so}(3))S^{\mathsf T}\) for some orthogonal \(R,S\). These spaces all satisfy (8.8g.72.1).

Consequently two adjacent product corners of an acute Lorentz-five intermediate cannot both have four-dimensional purely transverse linear tangent spaces realized by two-sided curves of actual unit states. In particular an all-pure candidate cannot have a ten-dimensional \(C^1\) embedded pure locus at every product.

*Proof.* The determinant is odd on the connected unit sphere of \(W\), so some nonzero \(D\in W\) is singular. By (8.8g.72.1) its rank is two and its two nonzero singular values coincide. Orthogonal changes of row and column bases and a scalar normalization of \(D\) put it at \(\operatorname{diag}(1,1,0)\).

We use two consequences of the norm inequality near such a \(D\). Write the singular values of \(D+tA\) in decreasing order as \(\sigma_1,\sigma_2,\sigma_3\). Equation (8.8g.72.1) is equivalent to \(\sigma_1^2-\sigma_2^2\le\sigma_3^2\). The last singular value is \(O(|t|)\), by testing the third coordinate vector. In the top two-dimensional singular cluster, the first derivatives of the two eigenvalues of \((D+tA)^{\mathsf T}(D+tA)\) are the eigenvalues of \(A_{[2],[2]}+A_{[2],[2]}^{\mathsf T}\). Indeed, eliminating the bottom coordinate in the eigenvector equation for eigenvalues near one contributes only \(O(t^2)\) to the top block. A nonscalar first-order block would split the top eigenvalues at order \(|t|\). Therefore each \(A\in W\) has the form
\[
A=\begin{pmatrix}aI_2+bJ&u\\x^{\mathsf T}&c\end{pmatrix},
\qquad J=\begin{pmatrix}0&-1\\1&0\end{pmatrix}.
\tag{8.8g.72.2}
\]

Put \(W_0=\{A\in W:c=0\}\). For \(A\in W_0\), the vector with top part \(-t(I_2+t(aI_2+bJ))^{-1}u\) and bottom part one has image under \(D+tA\) with zero top part and bottom part \(O(t^2)\). Its norm is at least one, so \(\sigma_3=O(t^2)\). Now \((D+tA)^{\mathsf T}(D+tA)\) has top block
\[
I_2+2taI_2+t^2[(a^2+b^2)I_2+xx^{\mathsf T}],
\]
off-diagonal top column \(tu+O(t^2)\), and bottom entry \(O(t^2)\). For an eigenvalue near one, eliminating the bottom coordinate adds
\[
\frac{(tu+O(t^2))(tu+O(t^2))^{\mathsf T}}{1+O(t)}
=t^2uu^{\mathsf T}+O(t^3)
\]
to the effective top block. Thus the second-order splitting is the difference of the eigenvalues of \(xx^{\mathsf T}+uu^{\mathsf T}\). More explicitly, subtract \(1+2ta+t^2(a^2+b^2)\) from the two cluster eigenvalues and divide by \(t^2\). The two resulting limits are the eigenvalues of that symmetric \(2\times2\) matrix, by the top equation and the vanishing bottom components of an orthonormal cluster eigenbasis. As the actual splitting is at most \(\sigma_3^2=O(t^4)\), this matrix is scalar. The two-column matrix with columns \(x,u\) therefore has orthogonal columns of equal length, with both zero allowed. Hence \(x=Ju\) or \(x=-Ju\) for each \(A\in W_0\). The two alternatives are linear subspaces of \(W_0\). A real vector space cannot be covered by two proper linear subspaces, so there is one common sign \(\varsigma\) with \(x=\varsigma Ju\) throughout \(W_0\).

Suppose a member of \(W_0\) with \(u=0\) has \(b\ne0\). Subtract \(aD\) and rescale to see that \(D_J=\operatorname{diag}(J,0)\) lies in \(W_0\). Apply the preceding second-order argument about \(D_J\), first multiplying the top output rows by \(J^{\mathsf T}\) to make it \(D\). For every \(A\in W_0\) the top block after this transformation is still scalar plus skew, the lower-right entry is zero, and the two side vectors are \(J^{\mathsf T}u\) and \(x\). They must be orthogonal and of equal length. The already proved relation \(x=\varsigma Ju\) makes them parallel, so they must both vanish. This would put all of \(W_0\) in \(\operatorname{span}\{D,D_J\}\), contrary to \(\dim W_0\ge3\). It follows that the kernel of \(A\mapsto u\) on \(W_0\) is exactly the line spanned by \(D\). Thus \(\dim W_0=3\), this map is onto \(\mathbb R^2\), and \(b\) is a linear function of \(u\).

Rotate both top row and top column coordinates by the same orientation-preserving two-dimensional rotation. This keeps \(D,J\) and the sign relation unchanged. If \(b\) is nonzero, choose the rotation so \(b=\ell u_2\) with \(\ell\ne0\). Subtracting multiples of \(D\), the element \(A_0\in W_0\) with \(u=e_1\) and \(a=0\) has \(b=0\) and \(x=\varsigma e_2\). Its active row directions, ordered as \((e_1,\varsigma e_3)\), and active column directions, ordered as \((e_3,e_2)\), give its active block \(I_2\). The element \(A_1\in W_0\) with \(u=e_2\) and \(a=0\) has \(b=\ell\), \(x=-\varsigma e_1\). Its restriction to those same ordered rows and columns is
\[
\begin{pmatrix}0&-\ell\\0&0\end{pmatrix}.
\]
Its symmetric part is nonscalar, contradicting the first-order argument about \(A_0\) in these active coordinates. Hence \(b=0\) throughout \(W_0\). Multiplying the top output rows by \(J\) and the bottom output row by \(-\varsigma\) takes
\[
\begin{pmatrix}aI_2&u\\(\varsigma Ju)^{\mathsf T}&0\end{pmatrix}
\quad\hbox{to}\quad
\begin{pmatrix}aJ&Ju\\-(Ju)^{\mathsf T}&0\end{pmatrix}.
\]
Thus \(W_0\) becomes the entire space \(\mathfrak{so}(3)\).

In those orthogonal coordinates, \(W\) contains \(\mathfrak{so}(3)\). Subtracting the skew part of a fourth independent member yields a nonzero symmetric \(A\in W\). Take a coordinate plane and the skew matrix \(D_*\in\mathfrak{so}(3)\) which acts by \(J\) on this plane and vanishes on its orthogonal line. The first-order argument about \(D_*\) says that \(J^{\mathsf T}A_{\rm plane}\) has scalar symmetric part. That symmetric part has trace zero because \(A_{\rm plane}\) is symmetric. Writing its entries as \(\left(\begin{smallmatrix}a_1&a_2\\a_2&a_3\end{smallmatrix}\right)\), the zero symmetric-part condition gives \(a_2=0\), \(a_1=a_3\). Apply this to all three coordinate planes to obtain \(A=a_1I_3\). This proves the classification. Conversely if a skew matrix has singular values \(s,s,0\), then \(aI_3+S\) has squared operator norm \(a^2+s^2\) and squared Frobenius norm \(3a^2+2s^2\), proving (8.8g.72.1).

For actual transverse tangent spaces the norm condition follows from Theorem 8.8g.68. If one such space has dimension four, the classification gives the skew copy required by Theorem 8.8g.71, which bounds the adjacent space by three. The final assertion follows by subtracting the six product directions from the tangent of each ten-dimensional manifold patch. The result concerns the regularity-specific tangent obstruction. It does not impose such a manifold structure on general acute pools. \(\square\)

<a id="theorem-88g73"></a>

<a id="theorem-88g73-classification-of-a-maximal-adjacent-tangent-pair"></a>**Theorem 8.8g.73 (Classification of a Maximal Adjacent Tangent Pair).** Use the acute Lorentz-five intermediate and adjacent product corners of Theorem 8.8g.70. Suppose their purely transverse linear tangent spaces \(W,W'\) have dimensions four and three, respectively, and every direction in each space is realized by a two-sided differentiable curve of actual unit states at its corner. Then after a common left-right orthogonal change of the transverse coordinates and a common orthogonal conjugation the two spaces are
\[
W=\mathbb RI_3\oplus\mathfrak{so}(3),\qquad
W'=\left\{
\begin{pmatrix}-t&v^{\mathsf T}\\v&tI_2\end{pmatrix}:
t\in\mathbb R,\ v\in\mathbb R^2
\right\}.
\tag{8.8g.73.1}
\]
The displayed pair meets all the individual transverse norm tests and the joint discriminant inequality (8.8g.70.1).

*Proof.* Theorem 8.8g.72 puts \(W\) in its displayed form by a left-right orthogonal change. Theorem 8.8g.70 makes every \(B'\in W'\) orthogonal to \(\mathfrak{so}(3)\), whose nonzero elements have rank two. Thus \(B'\) is symmetric. Testing (8.8g.70.1) against \(I_3\), whose \(d(I_3)=1/2\), gives
\[
(\operatorname{Tr}B')^2\le \|B'\|_F^2-2\|B'\|_{\rm op}^2.
\tag{8.8g.73.2}
\]
After changing the sign of \(B'\) if necessary, one eigenvalue of maximum absolute value is \(\lambda=\|B'\|_{\rm op}\ge0\). If the other eigenvalues are \(b,c\), the left side of (8.8g.73.2) minus its right side is
\[
(\lambda+b+c)^2-(b^2+c^2-\lambda^2)=2(\lambda+b)(\lambda+c)\ge0.
\]
Equality is therefore forced and either \(b\) or \(c\) equals \(-\lambda\). In particular every \(B'\in W'\) has spectrum \(\{\lambda,-\lambda,t\}\) for some \(|t|\le\lambda\), with \(t=\operatorname{Tr}B'\), and satisfies \(\det(B'-tI_3)=0\).

Let \(W'_0=\ker(\operatorname{Tr}|_{W'})\). The proof of Theorem 8.8g.71 gives \(\dim W'_0\le2\), so it has dimension two and the trace on \(W'\) is nonzero. We recall the two precise possibilities from that determinant proof. Choose a nonzero \(D\in W'_0\) and orthogonally conjugate and rescale it to \(\operatorname{diag}(1,-1,0)\). The conditions on every \(A\in W'_0\) are \(A_{33}=0\), \(A_{22}=-A_{11}\), \(A_{23}=\varsigma A_{13}\) for a common sign \(\varsigma\), and either \(A_{13}=0\) throughout the space or \(A_{12}=0\) throughout. Since the space has dimension two, the first case is exactly the traceless symmetric \(2\times2\) block on a fixed two-plane, with zero on its orthogonal line. The second is orthogonally conjugate to the matrices
\[
D(v)=\begin{pmatrix}0&v^{\mathsf T}\\v&0_{2\times2}\end{pmatrix},\qquad v\in\mathbb R^2.
\tag{8.8g.73.3}
\]
Indeed, in the second case use the distinguished line \((e_1+\varsigma e_2)/\sqrt2\). Both independent generators map this line into its orthogonal plane and have zero compression to that plane. The fixed-plane case has a common null line, whereas the intersection of the kernels of (8.8g.73.3) is zero. Thus the two full two-dimensional cases are distinct.

Choose \(C\in W'\) with \(t=\operatorname{Tr}C\ne0\). In the fixed-plane case write \(C=\left(\begin{smallmatrix}H&u\\u^{\mathsf T}&c\end{smallmatrix}\right)\). For every traceless symmetric \(2\times2\) matrix \(D\), the identity \(\det(C+\left(\begin{smallmatrix}D&0\\0&0\end{smallmatrix}\right)-tI_3)=0\) gives
\[
(c-t)\det(H+D-tI_2)-u^{\mathsf T}\operatorname{adj}(H+D-tI_2)u=0.
\tag{8.8g.73.4}
\]
The homogeneous quadratic term in \(D\) comes only from \((c-t)\det D\), since the \(2\times2\) adjugate is linear. As \(\det D\) is nonzero for some \(D\), we obtain \(c=t\). The linear term then gives \(u^{\mathsf T}\operatorname{adj}(D)u=0\) for all such \(D\). On traceless \(2\times2\) matrices \(\operatorname{adj}(D)=-D\), so \(u=0\), by taking \(D=uu^{\mathsf T}-\|u\|^2I_2/2\). Now \(\operatorname{Tr}H=0\). Subtracting the \(H\) block using \(W'_0\) yields a nonzero rank-one member of \(W'\), contrary to Theorem 8.8g.68.

We are therefore in the case (8.8g.73.3). Write \(C=\left(\begin{smallmatrix}c&u^{\mathsf T}\\u&H\end{smallmatrix}\right)\). Subtract \(D(u)\) to make \(u=0\), preserving \(t\). As \(\det(C+D(v)-tI_3)=0\) for every \(v\), the block determinant identity gives
\[
(c-t)\det(H-tI_2)-v^{\mathsf T}\operatorname{adj}(H-tI_2)v=0.
\]
Taking \(v=0\) makes the constant term zero. The quadratic identity for all \(v\) now forces \(\operatorname{adj}(H-tI_2)=0\), because the adjugate is symmetric. For \(2\times2\) matrices its linear map is invertible, so \(H=tI_2\). The trace equation \(c+\operatorname{Tr}H=t\) gives \(c=-t\). Since \(t\ne0\) and the trace-zero slice is (8.8g.73.3), this proves (8.8g.73.1).

Finally, \(B'\) in the displayed space has eigenvalues \(\{\sqrt{t^2+\|v\|^2},-\sqrt{t^2+\|v\|^2},t\}\), so \(d(B')=t^2/2\) and \(\operatorname{Tr}B'=t\). For \(B=aI_3+S\) with \(S\) skew, \(d(B)=a^2/2\), by Theorem 8.8g.72, and \(\langle B,B'\rangle_F=at\). Hence equality holds in the first discriminant inequality for all displayed pairs. This verifies algebraic sharpness on the tangent constraint. It does not construct an acute intermediate realizing the pair. \(\square\)

<a id="theorem-88g74"></a>

<a id="theorem-88g74-hausdorff-bounds-for-lorentz-five-product-incidences"></a>**Theorem 8.8g.74 (Hausdorff Bounds for Lorentz-Five Product Incidences).** Let \(K_{\min}\subseteq C=C^*\subseteq K_{\max}\) be all-pure on the Lorentz-five carrier of Theorem 8.8g.23. Write \(\mathcal T=C\cap\mathcal Q\), \(E=\mathcal T\setminus\mathcal P\), and \(J=\operatorname{diag}(1,-I_4)\). For \(q\in E\) that annihilates a product, let
\[
H(q)=q^{\mathsf T}Jq-\lambda(q)J\succeq0,\qquad
\lambda(q)=\max\operatorname{spec}(Jq^{\mathsf T}Jq).
\]
This is the unique admissible Lorentz multiplier for such a \(q\). For \(1\le r\le4\), let \(E_r\) consist of these states with \(\operatorname{rank}H(q)=r\), and set \(k_r=\max(0,3-r)\). The product incidence image
\[
\mathcal I_r=\{p\in\mathcal P:\langle q,p\rangle_F=0\text{ for some }q\in E_r\}
\]
satisfies
\[
\dim_{\rm H}\mathcal I_r\le\dim_{\rm H}E_r+k_r,
\qquad
\mathcal H^{6-k_r}(E_r)=0\ \Longrightarrow\ \mathcal H^6(\mathcal I_r)=0.
\tag{8.8g.74.1}
\]
In particular, either \(E\) accumulates at every product or at least one of the four measures
\[
\mathcal H^4(E_1),\qquad
\mathcal H^5(E_2),\qquad
\mathcal H^6(E_3),\qquad
\mathcal H^6(E_4)
\tag{8.8g.74.2}
\]
is positive. In the latter case \(\dim_{\rm H}E\ge4\). In the former case \(\dim_{\rm H}\overline E\ge6\). No definability of the actual pure set is required.

*Proof.* The regularized Lorentz reduction in the proof of Corollary 8.8g.61a gives a nonnegative largest eigenvalue of \(Jq^{\mathsf T}Jq\), with the associated \(H(q)\) positive semidefinite. The conclusion applies to arbitrary \(q\in\mathcal Q\) before the rank-specific step of that proof. For any product zero with second factor \(p_b\), the positive vector \(q p_b\) is null and nonzero by the strict marginal norms in Corollary 8.8g.39. Thus every positive semidefinite defect at any admissible multiplier has zero quadratic form on \(p_b\), hence annihilates \(p_b\). Two distinct multipliers would give a nonzero scalar multiple of \(Jp_b\) as the difference of those zero vectors, which is impossible. Lemma 8.8g.41 gives \(H(q)\ne0\), and a nonzero null input in its kernel gives \(\operatorname{rank}H(q)\le4\).

We establish a countable local Lipschitz parametrization of \(\mathcal I_r\) by subsets of \(E_r\) times spheres of dimension at most \(k_r\). First split \(E_r\) according to the algebraic multiplicity \(m\in\{1,\ldots,5\}\) of its largest eigenvalue. The largest eigenvalue is continuous on this domain, since it is the spectral radius of a matrix whose eigenvalues are all real and nonnegative by the Lorentz reduction. Let \(\chi(q,z)\) be the characteristic polynomial of \(Jq^{\mathsf T}Jq\) at \(z\). At any point of a multiplicity-\(m\) piece, the function \(\partial_z^{m-1}\chi(q,z)\) vanishes at \(\lambda(q)\) and has nonzero \(z\)-derivative there. The implicit function theorem extends \(\lambda\) locally to a smooth function on an ambient open neighborhood: on the multiplicity-\(m\) piece it agrees with that branch by the continuity and local uniqueness of the root. These local branches need only agree with \(\lambda\) on their respective pieces. Shrinking and taking countably many neighborhoods gives local Lipschitz charts for \(\lambda\) and \(H\) on each piece.

On a fixed-rank neighborhood in such a piece, select \(r\) independent rows of \(H(q)\). Their common kernel is \(\ker H(q)\). The orthogonal projection \(P(q)\) onto this kernel is a smooth function of the selected rows by the inverse of their Gram matrix, and restricts to a locally Lipschitz function of \(q\) on the piece. Put \(e_0=(1,0,0,0,0)\). The time-one slice of \(\ker H(q)\) is nonempty, so \(P(q)e_0\ne0\). Its point nearest the origin is
\[
(1,b_c(q))=\frac{P(q)e_0}{\langle e_0,P(q)e_0\rangle}.
\]
Its spatial part is the center of the affine spatial slice \(b_c(q)+T(q)\), where \(T(q)\) consists of the spatial components of \(\ker H(q)\cap e_0^\perp\) and has dimension \(4-r\). The slice center is perpendicular to \(T(q)\). Local smooth orthonormal frames of \(T(q)\) are obtained by selecting independent projections of coordinate vectors and applying Gram–Schmidt. To see the underlying projection explicitly, subtract the orthogonal rank-one projection onto \(P(q)e_0\) from \(P(q)\), and restrict to the spatial subspace.

The allowed input vectors \(b\in S^3\) satisfy \((1,b)\in\ker H(q)\), by Lemma 8.8g.41. When \(\|b_c(q)\|=1\), the only possible vector is \(b=b_c(q)\). If \(\|b_c(q)\|<1\) and \(4-r\ge1\), the vectors are
\[
b=b_c(q)+\sqrt{1-\|b_c(q)\|^2}\,F(q)\omega,\qquad
\omega\in S^{3-r},
\]
where \(F(q)\) is the local orthonormal frame map. The square root is locally Lipschitz on the strictly positive radius branch. When \(4-r=0\), the only possible vector is again \(b_c(q)\). These constructions give Lipschitz charts after further countable restrictions to bounded constants, including a separate zero-radius piece. For each such \(b\), the output factor is uniquely determined by
\[
a=-\frac{(q p_b)_{\rm space}}{(q p_b)_0}.
\]
The denominator is positive by the strict marginal norms. The formula is locally Lipschitz after restricting to charts with the denominator bounded below. Mapping \((a,b)\) to \(p_a p_b^{\mathsf T}\) is Lipschitz on their compact spheres. The described chart domains lie in subsets of \(E_r\) times a point or a compact sphere of dimension at most \(k_r\), as asserted. Countability follows from the countable Euclidean base and the finite multiplicity and pivot choices, or by exhausting the nonzero pivot, radius and denominator margins by positive rational lower bounds.

For completeness, if \(A\) is any subset of Euclidean space and a compact \(k\)-sphere is given, cover \(A\) by sets of diameters \(\delta_i\). At scale \(\delta_i\) the sphere has a cover by at most \(O(\delta_i^{-k})\) sets of diameter at most \(O(\delta_i)\). The resulting product cover shows that \(\mathcal H^s(A)=0\) implies \(\mathcal H^{s+k}(A\times S^k)=0\). The same argument with arbitrary \(s>\dim_{\rm H}A\) bounds the dimension, and a point is the \(k=0\) case. Lipschitz maps preserve such null statements. Applying these facts to the countable charts, and using \(k\le k_r\), proves (8.8g.74.1).

If \(E\) fails to accumulate at some product, the complement of \(\overline E\) in \(\mathcal P\) is a nonempty relatively open set. It has positive six-dimensional Hausdorff measure because \(\mathcal P\) is the smoothly embedded product manifold of Theorem 8.8g.23. Each product in this open set has an entangled pure annihilator by (8.8g.42.2). That implication uses the full-dimensional product-null support under separation and does not require semialgebraicity. Hence the open set is covered by \(\bigcup_r\mathcal I_r\). Equation (8.8g.74.1) now makes at least one measure in (8.8g.74.2) positive. If \(E\) accumulates at every product, its closure contains the six-dimensional product manifold. This proves the dichotomy. It gives no bound on the Hausdorff dimension of \(E\) itself in the dense-accumulation alternative. \(\square\)

<a id="theorem-88g75"></a>

<a id="theorem-88g75-product-small-ball-estimate-and-improved-finite-pool-floor"></a>**Theorem 8.8g.75 (Product Small-Ball Estimate and Improved Finite-Pool Floor).** Use the fixed Lorentz-five carrier, pure products \(\mathcal P\), and normalized unit-positive set \(\mathcal Q\) of Theorem 8.8g.23. Let \(a,b\) be independent uniform directions on \(S^3\) and write \(p(a,b)=p_a p_b^{\mathsf T}\). Uniformly over \(q\in\mathcal Q\) and \(0<\delta\le1/4\),
\[
\Pr\{\langle q,p(a,b)\rangle_F\le\delta\}
\le 128\,\delta^{3/2}\bigl(1+\log(1/\delta)\bigr).
\tag{8.8g.75.1}
\]
For a fixed pure product \(q\), this probability is bounded above and below by positive constants times \(\delta^{3/2}\log(1/\delta)\) as \(\delta\downarrow0\).

For any finite acute pool \(S\subset\mathcal Q\), let \(N=|S\setminus\mathcal P|\), and set \(N_0=\max(1,N)\). Then its saturation error of Theorem 8.8g.54 obeys
\[
\operatorname{sat}(S)>
\frac1{98}\left[\frac1{4096N_0\log(2N_0)}\right]^{4/3}.
\tag{8.8g.75.2}
\]
If each nonproduct pool member has at least one marginal norm at most \(1-\eta\), with \(0<\eta\le1\) and the side allowed to vary by member, then the log-free bound
\[
\operatorname{sat}(S)>
\frac{\eta^2}{1568(16N_0)^{4/3}}
\tag{8.8g.75.3}
\]
also holds. These are finite-pool saturation obstructions. The optimal saturation rate and the unrestricted joint saturation and generation test remain open.

*Proof.* The coordinate \(\zeta\) of a uniform point of \(S^3\) along any fixed unit direction has density \((2/\pi)\sqrt{1-\zeta^2}\) on \([-1,1]\). In particular
\[
\Pr\{1+\zeta\le t\}\le t^{3/2}\qquad(t\ge0).
\tag{8.8g.75.4}
\]
For \(0\le t\le2\), integrate \((2\sqrt2/\pi)\sqrt y\) on \(0\le y\le t\), whose coefficient after integration is \(4\sqrt2/(3\pi)<1\). Larger \(t\) is immediate. The lower bound \(\Pr\{1+\zeta\le t\}\ge (4/(3\pi))t^{3/2}\) also holds for \(0\le t\le1\), by \(\sqrt{2y-y^2}\ge\sqrt y\) there.

Fix \(q\in\mathcal Q\). Write \(q(1,b)^{\mathsf T}=(\kappa,\beta)\), with \(\kappa=1/2+h\cdot b\), \(\|h\|\le1/2\), and \(\|\beta\|\le\kappa\) by Lorentz positivity. The pairing with \(p(a,b)\) equals \((\kappa+a\cdot\beta)/2\). If \(\kappa>2\delta\) and \(\beta\ne0\), the event that this pairing is at most \(\delta\) forces \(\zeta=a\cdot\beta/\|\beta\|<0\). On this event \(\kappa+\|\beta\|\zeta\ge\kappa(1+\zeta)\), so (8.8g.75.4) bounds its conditional probability by \((2\delta/\kappa)^{3/2}\). When \(\beta=0\) and \(\kappa>2\delta\) the event is empty. When \(\kappa\le2\delta\) the bound by one suffices. Thus for positive \(\kappa\) the conditional bound is \(\min(1,(2\delta/\kappa)^{3/2})\).

Put \(\theta=\|h\|\). If \(\theta\le1/4\), the event \(\kappa\le t<1/4\) is empty. If \(\theta>1/4\), then \(\kappa=1/2-\theta+\theta(1+\zeta)\), with \(1/2-\theta\ge0\), so
\[
\Pr\{\kappa\le t\}\le 8t^{3/2}\qquad(0<t\le1/4)
\tag{8.8g.75.5}
\]
by (8.8g.75.4) and \(1/\theta<4\). The endpoint cases and \(\kappa=0\) have no atoms there, since the nonconstant spherical coordinate has a density. For \(0<\delta\le1/8\), put \(t_0=2\delta\). In the conditional integral, \(\kappa\le t_0\) contributes at most \(8t_0^{3/2}\). On \(t_0<\kappa\le1/4\) use
\[
\kappa^{-3/2}=8+\frac32\int_{\kappa}^{1/4} t^{-5/2}\,dt .
\]
Combining the constant term with \(\kappa>1/4\) gives at most \(8t_0^{3/2}\) over \(\kappa>t_0\). The integral term, by (8.8g.75.5), is at most \(12t_0^{3/2}\log(1/(4t_0))\). Hence the total is at most \((2\delta)^{3/2}[16+12\log(1/(8\delta))]\), which is bounded by (8.8g.75.1). For \(1/8<\delta\le1/4\), its right side exceeds one, so the estimate also holds there.

For a pure product \(q=p_{a_0}p_{b_0}^{\mathsf T}\) the pairing is \(XY\), where \(X=(1+a_0\cdot a)/2\), \(Y=(1+b_0\cdot b)/2\) are independent. Both have density \((8/\pi)\sqrt{x(1-x)}\) on \([0,1]\). For \(0<\delta<1/4\), integrate over \(2\delta\le x\le1/2\). The density is bounded below by a positive constant times \(x^{1/2}\) there, and \(\Pr(Y\le\delta/x)\) is bounded below by a positive constant times \((\delta/x)^{3/2}\) using (8.8g.75.4)'s lower bound. The resulting integral is bounded below by a positive constant times \(\delta^{3/2}\log(1/(4\delta))\). Together with (8.8g.75.1) this gives the asserted small-ball order.

For the pool application its product members can be removed from the tests, since every \(q\in\mathcal Q\) pairs nonnegatively with all products. Take
\[
\delta=[4096N_0\log(2N_0)]^{-2/3}\le1/4.
\]
The probability that any nonproduct pool member pairs at most \(\delta\) with either \(p(a,b)\) or \(p(-a,-b)\) is at most
\[
\frac{1+\tfrac23\log(4096N_0\log(2N_0))}
     {16\log(2N_0)}<1.
\]
For the last inequality put \(L=\log(2N_0)\ge\log2\), use \(\log N_0\le L\) and \(\log L\le L\), and note \(1+8\log2+(4/3)L<16L\). Thus a pair of opposite products has all these pairings strictly above \(\delta\). The two perturbed unit states of Proposition 8.8g.55, using \(s=\delta/4\) in its construction, remain in \(\mathcal Q(S)\) and have negative mutual pairing of magnitude \(\delta^2/(96+2\delta^2)>\delta^2/98\). The construction applies also when \(N=0\), with the nonproduct tests vacuous. This proves (8.8g.75.2).

If a pool member has one marginal norm at most \(1-\eta\), apply the conditional cap argument in the order that uses that marginal for the time row. Transposing exchanges the two independent sphere variables and their laws. Then \(\kappa\ge\eta/2\) for every conditioned input, giving probability at most \((4\delta/\eta)^{3/2}\). Take \(\delta=\eta/[4(16N_0)^{2/3}]\). The union probability over both opposite products and all nonproduct pool members is at most \(2N_0/(16N_0)=1/8\). The same perturbation now gives (8.8g.75.3). All estimates use normalized unit states and the original Frobenius pairing. \(\square\)

<a id="theorem-88g76"></a>

<a id="theorem-88g76-a-three-corner-obstruction-for-maximal-transverse-tangents"></a>**Theorem 8.8g.76 (A Three-Corner Obstruction for Maximal Transverse Tangents).** Use an acute intermediate on the fixed Lorentz-five carrier and the product-frame coordinates of Theorem 8.8g.70. At \(p=E_{++}\) and its two adjacent products \(p_1=E_{+-}\), \(p_2=E_{-+}\), let \(W,W_1,W_2\) be linear spaces of purely transverse directions realized by two-sided differentiable curves of actual unit states at their respective products. If \(\dim W=4\), then
\[
\min(\dim W_1,\dim W_2)\le2.
\tag{8.8g.76.1}
\]
In particular, in an all-pure candidate whose actual pure locus is a \(C^1\) embedded manifold near these three products, a ten-dimensional locus at \(p\) forces dimension at most eight at one of its two adjacent products.

If opposite products in the same frame both have four-dimensional transverse spaces, and at least one of their common adjacent products has a three-dimensional transverse space, the two four-dimensional spaces coincide in the common transverse coordinates. Both conclusions use actual tangent spaces. They do not require global regularity of the pure set.

*Proof of (8.8g.76.1).* By Theorem 8.8g.72, both \(\dim W_i\) are at most three. Suppose that they both equal three. Apply one common orthogonal left-right change of transverse coordinates to put \(W=\mathbb RI_3\oplus\mathfrak{so}(3)\). Theorem 8.8g.73 says that each \(W_i\) is an orthogonal conjugate of the three-dimensional space in (8.8g.73.1). It therefore contains a symmetric orthogonal matrix \(D_i\) with eigenvalues \((-1,1,1)\). The conjugations for the two neighboring spaces need not be the same. They both preserve \(I_3\), and hence, with \(d(B)=\|B\|_F^2/2-\|B\|_{\rm op}^2\),
\[
\langle I_3,D_i\rangle_F=1,\qquad d(I_3)=d(D_i)=1/2.
\tag{8.8g.76.2}
\]

Fix a single two-sided curve \(q(t)=p+tI_3+o(t)\) of actual unit states, where its derivative is inserted in the transverse block. For each \(i\) choose a two-sided curve \(r_i(s)=p_i+sD_i+o(s)\) of actual unit states. Set \(a_i(t)=\langle q(t),p_i\rangle_F\) and \(b_i(s)=\langle p,r_i(s)\rangle_F\). The adjacent axial estimate (8.8g.70.3) gives \(\limsup_{t\to0}a_i(t)/t^2\le1/2\) and \(\limsup_{s\to0}b_i(s)/s^2\le1/2\). By acuteness and (8.8g.76.2), with \(s=-t\),
\[
0\le\langle q(t),r_i(-t)\rangle_F
=a_i(t)+b_i(-t)-t^2+o(t^2).
\]
It follows that \(\liminf_{t\to0}a_i(t)/t^2\ge1-\limsup_{t\to0}b_i(-t)/t^2\ge1/2\). Thus \(a_1(t)/t^2\) and \(a_2(t)/t^2\) each converge to \(1/2\), along the same fixed curve \(q(t)\).

In the light coordinates of (8.8g.68.2) its axial deficit \(h(t)\) equals \(a_1(t)+a_2(t)+\nu(t)\), where \(\nu(t)=\langle q(t),E_{--}\rangle_F\). Unit norm gives \(h(t)/t^2\to\|I_3\|_F^2/2=3/2\). The two-sided boost estimate used in Theorem 8.8g.70 gives \(\liminf_{t\to0}\nu(t)/t^2\ge\|I_3\|_{\rm op}^2=1\). These limits would give \(3/2\ge 1/2+1/2+1=2\), a contradiction. This proves (8.8g.76.1). For a \(C^1\) actual pure manifold at a product, its tangent contains the six product directions and, by Theorem 8.8g.68, splits as those directions plus its purely transverse part. The dimension consequence follows.

*Proof of the opposite-space assertion.* Choose a common adjacent three-dimensional space and use Theorem 8.8g.73 to put the first four-dimensional space and that neighbor in the displayed coordinates of (8.8g.73.1). Write the other four-dimensional space as \(R(\mathbb RI_3\oplus\mathfrak{so}(3))S^{\mathsf T}\), with \(R,S\) orthogonal, by Theorem 8.8g.72. The neighboring three-dimensional space is orthogonal to \(R\mathfrak{so}(3)S^{\mathsf T}\) by the rank-two zero-pairing clause of Theorem 8.8g.70. For its symmetric matrices \(B\), this says \(R^{\mathsf T}BS\) is symmetric, equivalently \(BM\) is symmetric with \(M=SR^{\mathsf T}\).

Test this last property on \(B=E_{12}+E_{21}\) and \(B=E_{13}+E_{31}\). The first symmetry condition gives \(M_{11}=M_{22}\), \(M_{13}=M_{23}=0\). The second gives \(M_{11}=M_{33}\), \(M_{12}=M_{32}=0\). Test \(B=\operatorname{diag}(-1,1,1)\) to get \(M_{21}=-M_{12}=0\) and \(M_{31}=-M_{13}=0\). Hence \(M\) is scalar, and orthogonality gives \(M=\pm I_3\). The other four-dimensional space is therefore an orthogonal conjugate of \(\mathbb RI_3\oplus\mathfrak{so}(3)\), which equals that same space. Undoing the common coordinates proves the claimed equality. The result constrains tangent configurations and leaves unrestricted acute-pool existence open. \(\square\)

<a id="theorem-88g77"></a>

<a id="theorem-88g77-forced-correlations-in-every-spatial-two-plane-pair"></a>**Theorem 8.8g.77 (Forced Correlations in Every Spatial Two-Plane Pair).** Let \(K_{\min}\subseteq C=C^*\subseteq K_{\max}\) be an all-pure intermediate on the fixed Lorentz-five carrier. Write \(\mathcal T=C\cap\mathcal Q\) and use the blocks \(q=\frac12\left(\begin{smallmatrix}1&b_q^{\mathsf T}\\a_q&T_q\end{smallmatrix}\right)\) for \(q\in\mathcal T\). Then for every nonzero \(R\in\operatorname{Mat}_4(\mathbb R)\),
\[
m_+(R)m_-(R)\ge\|R\|_F^2,\qquad
m_\pm(R)=\max_{q\in\mathcal T}\bigl(\pm\langle R,T_q\rangle_F\bigr).
\tag{8.8g.77.1}
\]
For every two-dimensional spatial input plane \(V\) and output plane \(W\), there is a partial isometry \(R:V\to W\), extended by zero on \(V^\perp\), and two distinct entangled normalized pure states \(q_\pm\) of \(C\) such that
\[
\pm\langle R,T_{q_\pm}\rangle_F\ge\sqrt2,\qquad
\|P_W T_{q_\pm}P_V\|_*\ge\sqrt2.
\tag{8.8g.77.2}
\]
Here \(\|\cdot\|_*\) is the sum of singular values. Each of these two compressed maps has least singular value on \(V\to W\) at least \(\sqrt2-1\).

In particular for every unit input vector \(v\) and every unit output vector \(u\) there is an entangled normalized pure \(q\) with
\[
\|T_qv\|\ge\sqrt2-1,\qquad \|T_q^{\mathsf T}u\|\ge\sqrt2-1.
\tag{8.8g.77.3}
\]
The same \(q\) satisfies both inequalities for these nominated \(u,v\). Thus the entangled pure spatial blocks have neither a common nonzero kernel vector nor a common nonzero cokernel vector. In particular a completion with only rank-four entangled pure states cannot use a common omitted input or output spatial line in their Lorentz isometries.

*Proof.* Compactness of \(\mathcal T\) gives the maxima in (8.8g.77.1). Every normalized pure product belongs to \(\mathcal T\) and has spatial block \(ab^{\mathsf T}\), with \(a,b\) independently unit. Thus \(m_\pm(R)\ge\|R\|_{\rm op}>0\). By definition the matrices
\[
H_-=\operatorname{diag}(m_-(R),R),\qquad
H_+=\operatorname{diag}(m_+(R),-R)
\]
pair nonnegatively with every member of \(\mathcal T\). This set generates \(C\) by all-purity, so \(H_\pm\in C^*=C\). Their mutual Frobenius pairing is \(m_-m_+-\|R\|_F^2\), which is nonnegative by acuteness. This proves (8.8g.77.1).

Fix \(V,W\) and any isometry \(R_0:V\to W\) with zero extension. Precomposing on \(V\) with a planar rotation through angles from zero to \(\pi\) connects \(R_0\) to \(-R_0\) through such isometries, preserving both planes. The functions \(m_\pm\) are continuous, as support functions of a compact set. Along this path \(m_+-m_-\) changes sign, so at some \(R\) the two values coincide. Since \(\|R\|_F^2=2\), (8.8g.77.1) gives \(m_\pm(R)\ge\sqrt2\). A product \(ab^{\mathsf T}\) pairs with \(\pm R\) by at most \(\|R\|_{\rm op}=1\). Hence both maximizers are entangled, and their opposite signs at positive threshold make them distinct. Because \(R\) has these two plane supports, \(\langle R,T_q\rangle=\langle R,P_WT_qP_V\rangle\). The absolute value is at most the nuclear norm of the compression: expand in its singular vectors and bound each rank-one pairing by \(\|R\|_{\rm op}=1\). This proves (8.8g.77.2). The compression is a contraction by Theorem 8.8g.23. Its two singular values therefore each lie in \([0,1]\), and their sum at least \(\sqrt2\) makes the lesser at least \(\sqrt2-1\).

For (8.8g.77.3) choose \(V\) containing \(v\) and \(W\) containing \(u\), and use either one of the entangled states in (8.8g.77.2). The lower singular value bounds the norm of the compression applied to \(v\), and of its transpose applied to \(u\). These compressed norms cannot exceed the corresponding full norms in (8.8g.77.3). The last assertion uses the exact rank-four description of Corollary 8.8g.61a, in which each omitted spatial line is in the kernel or cokernel of \(T_q\). The result does not assume those lines vary continuously or impose any rotational covariance on \(C\). \(\square\)

<a id="theorem-88g78"></a>

<a id="theorem-88g78-obstruction-to-continuous-antipodally-compatible-rank-two-tangents"></a>**Theorem 8.8g.78 (Obstruction to Continuous Antipodally Compatible Rank-Two Tangents).** Use the acute Lorentz-five intermediate of Theorem 8.8g.70. For every pure product \(p_a p_b^{\mathsf T}\), \(a,b\in S^3\), suppose its actual unit-positive set admits a two-dimensional purely transverse linear tangent space \(W_{a,b}\subseteq\operatorname{Hom}(b^\perp,a^\perp)\) realized by two-sided differentiable curves. Suppose these spaces vary continuously. Assume that there are continuous omitted spatial lines \(k_L(a,b)\subset a^\perp\), \(k_R(a,b)\subset b^\perp\), such that every member of \(W_{a,b}\) vanishes on \(k_R(a,b)\) and has image perpendicular to \(k_L(a,b)\). Finally assume that **both** unoriented omitted lines are unchanged under **each** of the two separate replacements \(a\mapsto-a\) and \(b\mapsto-b\). Then this tangent assignment is impossible.

The conclusion applies in particular when the omitted lines depend only on their respective marginal directions, are invariant as lines under the corresponding antipode, and the resulting actual two-dimensional tangents vary continuously. It does not require local antipode invariance of the ambient cone itself.

*Proof.* The parameter space \(S^3\times S^3\) is connected and simply connected. The two continuous line fields therefore admit continuous unit lifts \(\ell_L(a,b)\) and \(\ell_R(a,b)\), by lifting their maps to the unit-sphere double cover of the space of lines in \(\mathbb R^4\). Under each antipodal replacement, invariance of each unoriented line makes its unit lift equal to its previous value times a sign. Each such sign is continuous in \((a,b)\), and hence constant.

For fixed \(b\), the map \(a\mapsto \ell_L(a,b)\) from \(S^3\) to \(S^3\) has degree one. Indeed \(\ell_L(a,b)\perp a\), so
\[
(a,t)\longmapsto \cos t\,a+\sin t\,\ell_L(a,b),\qquad 0\le t\le\pi/2,
\]
is a homotopy from the identity to this map, with unit norm throughout. If this lift were even under \(a\mapsto-a\), it would factor through \(\mathbb{RP}^3\), and its degree would be even: the covering \(S^3\to\mathbb{RP}^3\) has degree two with compatible orientations on the two orientable three-manifolds. This contradicts degree one. Thus the own-side sign of the left lift is odd. The same argument shows that the own-side sign of the right lift under \(b\mapsto-b\) is odd.

For fixed \(a\), the lift \(b\mapsto\ell_L(a,b)\) lies in the unit sphere of the three-dimensional fixed space \(a^\perp\). If it were odd under \(b\mapsto-b\), regarding it as a map \(S^3\to a^\perp\simeq\mathbb R^3\) would contradict the Borsuk–Ulam theorem (Borsuk 1933): some antipodal inputs have equal values, whereas opposite unit vectors are unequal. Hence its cross-side sign is even. The same applies to the right lift when \(b\) is fixed and \(a\) changes sign. Equivalently the two lifts have the sign rules
\[
\begin{aligned}
\ell_L(-a,b)&=-\ell_L(a,b),&
\ell_L(a,-b)&=\ell_L(a,b),\\
\ell_R(-a,b)&=\ell_R(a,b),&
\ell_R(a,-b)&=-\ell_R(a,b).
\end{aligned}
\tag{8.8g.78.1}
\]

The retained output and input planes are
\[
P_L=\operatorname{span}(a,\ell_L(a,b))^\perp,\qquad
P_R=\operatorname{span}(b,\ell_R(a,b))^\perp .
\]
Orient \(P_L\) by the fixed orientation of \(\mathbb R^4\) preceded by the ordered orthonormal pair \((a,\ell_L)\). Orient \(P_R\) in the same way using \((b,\ell_R)\). These are continuous orientations. Under either antipodal replacement the two retained planes remain the same, by hypothesis, and their orientations also remain the same by (8.8g.78.1): on the flipped side the two preceding vectors both change sign, and on the other side neither changes sign.

Now regard \(W_{a,b}\) as a two-dimensional real linear subspace of maps \(P_R\to P_L\). Theorem 8.8g.68 gives \(\|B\|_{\rm op}^2\le\|B\|_F^2/2\) for each \(B\) in that space. Since the two planes have dimension two, every nonzero such map has two equal positive singular values, so is a scalar multiple of an orthogonal map. In oriented orthonormal plane coordinates the entire locus of those maps, together with zero, is the union of the two linear planes
\[
\left\{\begin{pmatrix}x&-y\\y&x\end{pmatrix}:x,y\in\mathbb R\right\},
\qquad
\left\{\begin{pmatrix}x&y\\y&-x\end{pmatrix}:x,y\in\mathbb R\right\}.
\tag{8.8g.78.2}
\]
They are the orientation-preserving and orientation-reversing alternatives on nonzero maps. A real linear space contained in their union is contained in one of them: otherwise it would be the union of two proper linear subspaces. As \(W_{a,b}\) has dimension two, it equals one of the displayed planes. Its choice is locally constant by continuous oriented orthonormal frames and continuity of \(W_{a,b}\) in the Grassmannian, since the two alternatives are distinct. Connectedness makes the choice constant over all \((a,b)\).

Thus at two adjacent products the two retained oriented planes are identical and the choice in (8.8g.78.2) is identical. Their actual transverse tangent spaces coincide in the common spatial coordinates. This contradicts the trivial-intersection consequence of Theorem 8.8g.70. The assumptions concern the actual tangent assignment and its two support lines. No such assignment has been derived for an arbitrary Lorentz-five completion. \(\square\)

<a id="theorem-88g79"></a>

<a id="theorem-88g79-opposite-product-incidences-and-forced-accumulation"></a>**Theorem 8.8g.79 (Opposite-Product Incidences and Forced Accumulation).** Use the fixed Lorentz-five carrier and any all-pure self-dual intermediate \(K_{\min}\subseteq C=C^*\subseteq K_{\max}\) of Theorem 8.8g.23. Write \(\mathcal T=C\cap\mathcal Q\), \(E=\mathcal T\setminus\mathcal P\), and let \(E_0\) consist of the entangled pure states with both spatial marginals zero. Let \(E_*=E\setminus E_0\). For a product \(p=p_a p_b^{\mathsf T}\) write \(\bar p=p_{-a}p_{-b}^{\mathsf T}\) for its opposite. The incidence images
\[
\mathcal J_i=\{p\in\mathcal P:\text{some }q\in E_i\text{ annihilates both }p,\bar p\},
\qquad i\in\{0,*\},
\]
obey
\[
\dim_{\rm H}\mathcal J_*\le\dim_{\rm H}E_*,
\quad
\dim_{\rm H}\mathcal J_0\le\dim_{\rm H}E_0+2,
\quad
\mathcal H^6(E_*)=\mathcal H^4(E_0)=0
\ \Longrightarrow\ 
\mathcal H^6(\mathcal J_*\cup\mathcal J_0)=0 .
\tag{8.8g.79.1}
\]

Under the two null-measure conditions in (8.8g.79.1), every opposite pair \(\{p,\bar p\}\) contains a point of \(\overline E\). In particular the product manifold's open separation set \(\mathcal P\setminus\overline E\) has at most half its normalized product measure. Consequently an all-pure completion cannot have \(E\) separated from \(\mathcal P\) and simultaneously satisfy these two measure conditions. This excludes, for example, every compact entangled pure locus of Hausdorff dimension below six whose zero-marginal part has Hausdorff dimension below four. It does not assume definability or regularity of \(E\).

*Double-null incidence.* In the frame of \(p,\bar p\), use the orthonormal light coordinates of Theorem 8.8g.67. A normalized \(q\) annihilating both has the form
\[
q=\begin{pmatrix}0&\lambda&0\\\mu&0&0\\0&0&B\end{pmatrix},
\qquad \lambda,\mu\ge0,\qquad \lambda+\mu=1 .
\]
In ordinary time-space coordinates write \(2q=\left(\begin{smallmatrix}1&b_q^{\mathsf T}\\ a_q&T_q\end{smallmatrix}\right)\). The sum and difference of the two light axes give
\[
a_q=(\lambda-\mu)a,\qquad b_q=(\mu-\lambda)b,\qquad
T_qb=-a,\qquad T_q^{\mathsf T}a=-b .
\tag{8.8g.79.2}
\]
Thus for \(q\in E_*\) in the incidence domain, both marginals are nonzero and \((a,b)\) is one of
\[
\left(\frac{a_q}{\|a_q\|},-\frac{b_q}{\|b_q\|}\right),\qquad
\left(-\frac{a_q}{\|a_q\|},\frac{b_q}{\|b_q\|}\right).
\]
The two maps are Lipschitz after restricting the nonzero marginal norms to be at least \(1/n\), for each positive integer \(n\). Passing to product tensors is also Lipschitz, proving the dimension and measure assertions for \(\mathcal J_*\).

For \(q\in E_0\), (8.8g.79.2) puts \(b\) in the eigenspace of \(T_q^{\mathsf T}T_q\) at eigenvalue one and sets \(a=-T_qb\). This eigenspace has dimension at most three, because \(\|T_q\|_F^2=3\) by unit normalization. Its unit sphere has dimension at most two. On each constant-rank stratum of \(I-T_q^{\mathsf T}T_q\), the kernel has locally Lipschitz orthonormal frames. Explicitly select independent rows of that matrix and use the inverse of their Gram matrix to project onto the orthogonal complement of their span. Project an appropriate set of coordinate vectors into the kernel and apply Gram–Schmidt. Around every point the chosen pivots stay nonzero, and the resulting formulas are smooth on an ambient open neighborhood and restrict to the required frames on the stratum. This gives countably many Lipschitz charts after shrinking each to bounded derivative, as in Theorem 8.8g.74. The possible \((a,b)\) are then covered by Lipschitz maps of subsets of \(E_0\) times spheres of dimension at most two. Over a base covering set of diameter \(r\) the sphere takes at most \(O(r^{-2})\) sets of diameter at most \(r\). Thus a base cover with arbitrarily small sum of \(s\)-th powers of diameters gives a product cover with arbitrarily small sum of \((s+2)\)-th powers. This proves the remaining assertions in (8.8g.79.1).

*Complementary support.* Consider any product frame with opposite pairs \(\{p,\bar p\}\), \(\{p_1,p_2\}\). Define the double-null faces
\[
F=C\cap(p_1+p_2)^\perp,\qquad F'=C\cap(p+\bar p)^\perp .
\]
Thus \(F\) contains \(p,\bar p\), and \(F'\) contains \(p_1,p_2\). Suppose the only normalized pure states in \(F\) are \(p,\bar p\) and these two products are separated from \(E\). Put \(u=p_1+p_2\) and \(D(q)=\langle u,q\rangle_F\). The continuous function \(D\) is nonnegative on \(\mathcal T\). On its compact subset \(\overline E\) it has a strictly positive minimum: otherwise a unit pure limit in \(F\) would be one of the two separated products. If \(E\) is empty the resulting positive lower bound is vacuous.

Let \(B(q)\) denote the transverse block in the common light coordinates. For any normalized pure product \(q=(\alpha,\beta,x)(\gamma,\delta,y)^{\mathsf T}\) of those coordinates, \(\|x\|^2=2\alpha\beta\) and \(\|y\|^2=2\gamma\delta\). The sum \(D(q)\) is one of the two opposing axial sums \(\alpha\gamma+\beta\delta\) or \(\alpha\delta+\beta\gamma\). Both satisfy
\[
\|B(q)\|_F=\|x\|\|y\|=2\sqrt{\alpha\beta\gamma\delta}\le D(q).
\]
For entangled pure \(q\), unit norm gives \(\|B(q)\|_F\le1\). Choose \(\epsilon>0\) at most one and at most the positive minimum of \(D\) on \(\overline E\) when that set is nonempty. For every purely transverse matrix \(Z\) with \(\|Z\|_F\le\epsilon\), these estimates give
\[
\langle u+Z,q\rangle_F=D(q)+\langle Z,B(q)\rangle_F\ge0
\qquad(q\in\mathcal T).
\]
Self-duality and pure generation therefore put \(u+Z\) in \(C\). It is orthogonal to \(p+\bar p\), so the entire transverse ball lies in \(F'\). In particular \(F'\) has entangled pure generators, since products in this double-null face have transverse block zero. It also has all nine transverse dimensions. This local implication uses neither intrinsic self-duality of either face nor smoothness of the pure set.

*Global consequence.* Under the measure assumptions, (8.8g.79.1) implies that for almost every product parameter \((a,b)\), neither opposite pair in its frame has an entangled pure annihilator. Indeed the bad parameter sets for the two pairs are preimages of \(\mathcal J_0\cup\mathcal J_*\) under a product parametrization and under a single local antipodal flip of that parametrization. The parametrization \((a,b)\mapsto p_a p_b^{\mathsf T}\) and its inverse are Lipschitz on the compact product manifold, the inverse obtained by extracting the marginals. Its normalized product measure has the same null sets as its six-dimensional Hausdorff measure. The flips preserve that product measure. Thus both bad sets are null. On the good frames, \(F\) and \(F'\) have only their respective two axial pure products, by the double-null product classification of Theorem 8.8g.67.

Let \(O=\mathcal P\setminus\overline E\), a relatively open subset. If \(O\) contained \(p,\bar p\), the intersection of \(O\) with its opposite image would be a nonempty relatively open subset of the six-dimensional product manifold, and hence have positive product measure. It would contain a good frame with both \(p,\bar p\) separated. The complementary support argument then produces an entangled pure point in \(F'\), contradicting goodness. Thus \(O\) and its opposite image are disjoint, and they have equal product measure. This proves the half-measure bound and the opposite-pair conclusion. A compact \(E\) is disjoint from the compact product set and hence separated, so the stated example follows by the Hausdorff dimension conditions. \(\square\)

<a id="theorem-88g80"></a>

<a id="theorem-88g80-rank-four-coverage-forced-by-small-opposite-product-incidences"></a>**Theorem 8.8g.80 (Rank-Four Coverage Forced by Small Opposite-Product Incidences).** Use the fixed Lorentz-five carrier and any all-pure self-dual intermediate \(K_{\min}\subseteq C=C^*\subseteq K_{\max}\) of Theorem 8.8g.23. Write \(\mathcal T=C\cap\mathcal Q\), \(E=\mathcal T\setminus\mathcal P\), and let \(E_*\) be the entangled pure states with at least one nonzero marginal. For \(1\le k\le3\) write
\[
E_{0,k}=\{q\in E:\ a_q=b_q=0,\ \dim\ker(I_4-T_q^{\mathsf T}T_q)=k\},
\qquad
q=\tfrac12\begin{pmatrix}1&b_q^{\mathsf T}\\a_q&T_q\end{pmatrix}.
\]
For any \(E_{0,k}\), its opposite-product incidence image \(\mathcal J_{0,k}\), defined as in Theorem 8.8g.79, satisfies
\[
\dim_{\rm H}\mathcal J_{0,k}\le\dim_{\rm H}E_{0,k}+k-1,\qquad
\mathcal H^{7-k}(E_{0,k})=0\ \Longrightarrow\ 
\mathcal H^6(\mathcal J_{0,k})=0 .
\tag{8.8g.80.1}
\]

Assume the four explicit null-measure conditions
\[
\mathcal H^6(\overline E\cap\mathcal P)=0,\qquad
\mathcal H^6(E_*)=0,\qquad
\mathcal H^6(E_{0,1})=0,\qquad
\mathcal H^5(E_{0,2})=0.
\tag{8.8g.80.2}
\]
Then for every \(a,b\in S^3\) there is an actual central rank-four pure state \(q\) for which \(T_q\) is a rank-three partial isometry and
\[
T_q b=a\quad\hbox{or}\quad T_q b=-a .
\tag{8.8g.80.3}
\]
The same sign gives \(T_q^{\mathsf T}a=\pm b\). Thus the central rank-four pure set must cover every pair of spatial directions up to the indicated sign, and \(\mathcal H^4(E_{0,3})>0\). These conclusions apply in particular if the actual entangled pure locus is semialgebraic of dimension at most four, whether or not it is separated from the products. In that case its central rank-four locus must itself have dimension four.

*Proof.* At a central state \(q\), equation (8.8g.79.2) says that the opposite-product incidence has \(b\) in the unit sphere of \(\ker(I_4-T_q^{\mathsf T}T_q)\) and \(a=-T_q b\). Conversely these conditions imply both product pairings vanish by direct substitution with zero marginals, so the entire fiber is exactly that unit sphere. In particular \(k=0\) gives no opposite-product incidence. Since \(\|T_q\|_F^2=3\) and \(\|T_q\|_{\rm op}\le1\), one has \(k\le3\). The same constant-rank projection and Gram–Schmidt charts as in Theorem 8.8g.79 now parametrize this fiber by \(S^{k-1}\) on each \(E_{0,k}\). The countable Lipschitz product covers there give (8.8g.80.1).

For each product frame parametrized by \((a,b)\), write its two opposite pairs as \((p,\bar p)\) and \((p_1,p_2)\). Remove frames with any of their four corners in \(\overline E\cap\mathcal P\). The first null condition in (8.8g.80.2) makes this removal a null set, by the Lipschitz product parametrization and measure-preserving antipodal flips. Remove also frames in which either opposite pair has an entangled annihilator from \(E_*,E_{0,1},E_{0,2}\). This is another null set, by Theorem 8.8g.79 for \(E_*\), by (8.8g.80.1) for the two central classes, and by the same flips for the complementary pair. The remaining frames form a dense subset, since the product measure is positive on every nonempty open subset of \(S^3\times S^3\).

In any remaining frame, at least one opposite pair has an entangled pure annihilator. Otherwise the two complementary double-null faces have only their two surviving axial pure products, as in Theorem 8.8g.67. All four products are separated from \(E\). The complementary transverse-ball argument of Theorem 8.8g.79 applied to either face then puts a nonzero transverse block in the other face and requires an entangled pure generator there, a contradiction. Consequently some opposite pair has an entangled annihilator \(q\in E_{0,3}\), since all the other classes with nonempty opposite-product fibers were removed. The singular values of its spatial block are \(1,1,1,0\), again by \(\|T_q\|_F^2=3\) and the definition of \(k\). With both marginals zero, this gives matrix rank four and a rank-three partial isometry on the spatial carrier. For \((p,\bar p)\), equation (8.8g.79.2) gives \(T_qb=-a\). For the other opposite pair it gives \(T_qb=a\). The adjoint statement follows from the same equation, or from \(T_q^{\mathsf T}T_q b=b\).

The set \(E_{0,3}\) is compact. Indeed \(\mathcal T=C\cap\mathcal Q\) is compact, the zero-marginal equations are closed, and \(\dim\ker(I_4-T_q^{\mathsf T}T_q)\ge3\) is closed by the corresponding rank condition. On this slice the dimension is exactly three by the norm identity, and zero marginals exclude products. Therefore the \((a,b)\) satisfying (8.8g.80.3) for some \(q\in E_{0,3}\) form a closed set, by compactness and the closed signed equations. It contains the dense set of remaining frames and hence is the whole product parameter space. If \(\mathcal H^4(E_{0,3})=0\), (8.8g.80.1) and the two opposite-pair parametrizations make that whole set have zero six-dimensional measure, a contradiction. Thus \(\mathcal H^4(E_{0,3})>0\).

For a semialgebraic \(E\) of dimension at most four, its closure has dimension at most four, as do all the subsets appearing in (8.8g.80.2). Hence all the indicated higher-dimensional Hausdorff measures vanish. The central rank-four slice is semialgebraic by its defining zero-marginal and rank conditions, so its dimension is four by its positive fourth-dimensional Hausdorff measure and the dimension bound on \(E\). The conclusion describes necessary coverage of the central rank-four pure generators. No pairwise acute covering family or all-pure intermediate is inferred. \(\square\)

<a id="theorem-88g81"></a>

<a id="theorem-88g81-multiplicity-required-when-central-coverage-has-only-one-sign"></a>**Theorem 8.8g.81 (Multiplicity Required When Central Coverage Has Only One Sign).** Assume the all-pure Lorentz-five hypotheses and the four Hausdorff-null conditions (8.8g.80.2). Let \(M\) be the actual central rank-four pure set \(E_{0,3}\) of Theorem 8.8g.80. For \(a,b\in S^3\) define the two fibers
\[
M_\pm(a,b)=\{q\in M:T_qb=\pm a\}.
\]
For almost every \((a,b)\), either both fibers are nonempty, or the sole nonempty fiber has at least ten members. In the second case the transverse blocks of its members positively span the full nine-dimensional transverse space in the frame of \(p_ap_b^{\mathsf T}\). They are rank-two partial isometries times the factor \(1/2\) in the normalized state matrix.

If each oriented fiber has at most nine members for almost every product parameter, both fibers are nonempty for **every** \((a,b)\). More generally, if either signed incidence fails to cover the product parameter space, there is a nonempty open set on which one sign is absent and the other has at least ten members for almost every parameter. In all cases at least one frame realizes both signs.

*Proof.* Use the full-measure set of frames in the proof of Theorem 8.8g.80. On these frames all four product corners are separated from \(E\), and every entangled pure state annihilating an opposite corner pair belongs to \(M\). For a fixed such frame the two complementary double-null faces correspond to \(M_-\) and \(M_+\), respectively, by (8.8g.79.2). Each has exactly two product generators, at the two surviving axial corners. Theorem 8.8g.80 gives at least one nonempty fiber. Suppose only one sign is present. The double-null face for the missing sign is then product-only. Its two surviving products are separated from \(E\), so the complementary transverse-ball argument in Theorem 8.8g.79 puts a full transverse ball about the sum of the two other corners in the populated face.

Every vector in that face is a positive combination of its normalized pure generators, by compactness of its normalized base. Its product generators have zero transverse blocks. Projecting the transverse ball therefore shows that the transverse blocks of the entangled generators positively span all of \(\operatorname{Mat}_3(\mathbb R)\), with the chosen coordinates. They cannot number at most nine: fewer than nine do not linearly span the space, and nine linearly independent vectors have a positive hull that omits the negative of each basis vector. Each such entangled generator belongs to the present signed fiber in \(M\). Its unit spatial singular values are \(1,1,1\), with a fourth zero. One of the unit directions is the mapped input axis \(b\), with output \(\pm a\); the transverse restriction thus has singular values \(1,1,0\). Returning from \(T_q\) to the block of \(q\) gives the factor \(1/2\).

For either sign the incidence \(J_\pm=\{(a,b):M_\pm(a,b)\ne\varnothing\}\) is closed, by compactness of \(M\) and the defining signed equation. The two sets cover \(S^3\times S^3\) by Theorem 8.8g.80 and are exchanged by one local antipodal flip. If both fibers have size at most nine almost everywhere, the preceding full-measure conclusion implies that both sets contain a dense set, so both are the whole parameter space. If \(J_+\) is proper, its nonempty open complement lies in \(J_-\). Almost every parameter in that complement belongs to the above full-measure set, so its \(M_-\) fiber positively spans and has at least ten members. The other sign case is identical. Finally the two nonempty closed sets cannot be disjoint: that would partition the connected parameter space into disjoint nonempty closed sets. Their intersection is a frame realizing both signs.

These conclusions concern the actual pure generators under (8.8g.80.2). They do not imply that the required many-to-one direction coverage is compatible with global acuteness and generation. \(\square\)

<a id="theorem-88g82"></a>

<a id="theorem-88g82-a-single-independent-odd-order-rotation-can-obstruct-a-lorentz-five-completion"></a>**Theorem 8.8g.82 (A Single Independent Odd-Order Rotation Can Obstruct a Lorentz-Five Completion).** Retain the all-pure Lorentz-five hypotheses and Frobenius normalization of Proposition 8.8g.48. Let \(S\in O(4)\), write \(D_S=\operatorname{diag}(1,S)\), and suppose \((S+S^{\mathsf T})/2\preceq-c I_4\) for \(c>17/19\). There is an actual entangled pure state \(q\in C\) for which
\[
\operatorname{dist}_F(D_Sq,C)\ge\frac{19c-17}{36},
\qquad
\operatorname{dist}_F(qD_S^{\mathsf T},C)\ge\frac{19c-17}{36}.
\tag{8.8g.82.1}
\]
In particular, an independent isoclinic rotation of order seven on either factor cannot preserve \(C\). The order-seven cyclic group contains no spatial antipode.

*Proof.* Write \(q=\tfrac12\left(\begin{smallmatrix}1&b^{\mathsf T}\\a&T\end{smallmatrix}\right)\) and put \(A=\|a\|\), \(B=\|b\|\). The opposite-width witnesses of Theorem 8.8g.58 give actual entangled pure states with \(\|T\|_*\ge2\). Either witness suffices. Lorentz positivity applied to \((1,x)\) and \((1,-x)\) for a unit spatial vector \(x\) gives \(\|a\pm Tx\|\le1\pm b^{\mathsf T}x\). The triangle inequality yields \(\|T\|_{\rm op}\le1\).

Apply the principal-block inequality of (8.8g.38.6) to the transpose of \(2q\). The resulting multiplier is bounded above by \(1-B^2\) by its time-time entry. Therefore
\[
TT^{\mathsf T}\preceq aa^{\mathsf T}+(1-B^2)I_4.
\tag{8.8g.82.2}
\]
On the subspace perpendicular to \(a\) the upper bound is \(1-B^2\). The min-max principle bounds the three smaller singular values of \(T\) by \(\sqrt{1-B^2}\). Thus \(2\le1+3\sqrt{1-B^2}\), so \(B^2\le8/9\). Applying the same argument to \(q^{\mathsf T}\) gives \(A^2\le8/9\) for the same witness.

The unit norm of \(q\) gives \(A^2+B^2+\|T\|_F^2=3\). The rotation acts on the left spatial rows, giving
\[
\begin{aligned}
4\langle q,D_Sq\rangle
&=1+B^2+a^{\mathsf T}Sa+\operatorname{tr}(T^{\mathsf T}ST)\\
&\le1+B^2-c(3-B^2)\le (17-19c)/9.
\end{aligned}
\tag{8.8g.82.3}
\]
Transposition gives the same bound for the right spatial action with \(A\) in place of \(B\). For any \(y\in C\), self-duality gives \(\langle q,y\rangle\ge0\). Since \(\|q\|_F=1\), Cauchy–Schwarz gives \(\|D_Sq-y\|_F\ge(19c-17)/36\), and the right-action bound follows in the same way.

For the order-seven example let \(S_0=\cos(2\pi/7)I_4+\sin(2\pi/7)J\), with an orthogonal \(J\) satisfying \(J^2=-I_4\). The symmetric part of \(S_0^3\) is \(-\cos(\pi/7)I_4\), and \(\cos(\pi/7)>1-\pi^2/98>44/49>17/19\). Invariance under the independent action of \(S_0\) would imply invariance under its third power, contrary to (8.8g.82.1). The group has odd order. ∎

<a id="theorem-88g83"></a>

<a id="theorem-88g83-marginal-erasure-obstructs-a-symmetric-correlation-body"></a>**Theorem 8.8g.83 (Marginal Erasure Obstructs a Symmetric Correlation Body).** Let $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ be an all-pure intermediate on the fixed Lorentz-five carrier of Theorem 8.8g.23. Write
\[
M=\left\{T\in\operatorname{Mat}_4(\mathbb R):
\tfrac12\begin{pmatrix}1&b^{\mathsf T}\\a&T\end{pmatrix}\in C
\text{ for some }a,b\in\mathbb R^4\right\}.
\]
Suppose the orthogonal projection that erases both spatial marginal blocks and retains the time entry and the spatial correlation block maps $C$ into itself. Then $M$ cannot be centrally symmetric about zero. In the Frobenius metric its Hausdorff distance from $-M$ is at least $2/(3\sqrt{11})$. In particular, invariance under the simultaneous two-sided spatial antipode and central symmetry of $M$ are incompatible.

*Proof.* The normalized base of $C$ is compact by Theorem 8.8g.23, so $M$ is a compact convex linear image of that base. The pure products give all rank-one matrices $ab^{\mathsf T}$ with $a,b\in S^3$ in $M$. Their convex hull contains a neighborhood of zero because it is symmetric and spans $\operatorname{Mat}_4(\mathbb R)$. Denote the time-correlation subspace by $H=\{\operatorname{diag}(s,R):s\in\mathbb R,\ R\in\operatorname{Mat}_4(\mathbb R)\}$ and its orthogonal projection by $\Pi$. By the hypothesis $\Pi C=C\cap H$. If $y\in H$ pairs nonnegatively with $C\cap H$, then for every $x\in C$ one has $\langle y,x\rangle_F=\langle y,\Pi x\rangle_F\ge0$. Thus $y\in C^*=C$, proving that $C\cap H$ is self-dual in $H$.

The normalized slice of $C\cap H$ consists exactly of $\tfrac12\operatorname{diag}(1,T)$ for $T\in M$. Such a slice element with $T=R$ pairs nonnegatively with the whole slice precisely when $1+\langle R,T\rangle_F\ge0$ for every $T\in M$. Every nonzero cone vector has positive normalizer. Self-duality in $H$ therefore gives
\[
M=-M^\circ,\qquad M^\circ=\{R:\langle R,T\rangle_F\le1\text{ for every }T\in M\}.
\tag{8.8g.83.1}
\]
If $M=-M$, equation (8.8g.83.1) gives $M=M^\circ$. For $R\in M$, pairing with itself then yields $\|R\|_F^2\le1$, so $M$ is contained in the Frobenius unit ball. Every matrix of Frobenius norm at most one therefore belongs to $M^\circ=M$. Hence $M$ would be that ball.

Every extreme point $T$ of $M$ has a normalized pure lift. Indeed, pick a normalized lift $x$ in $C$. The compact normalized base is the convex hull of its extreme points, so $x$ is a finite convex combination of normalized pure states. Their spatial correlation blocks combine to $T$, and extremality makes every positive-weight block equal to $T$. For any such pure lift $q=\tfrac12\left(\begin{smallmatrix}1&b^{\mathsf T}\\a&T\end{smallmatrix}\right)$, the unit norm and marginal bounds give
\[
\|T\|_F^2=3-\|a\|^2-\|b\|^2\ge1.
\tag{8.8g.83.2}
\]
Equality forces both marginal norms to be one. The local-pure marginal face identity in Theorem 8.8g.23 then gives a pure product, with a rank-one spatial correlation block. But the Frobenius unit ball has rank-four extreme points, for example $I_4/2$. This contradicts the asserted shape of $M$.

For the quantitative bound, take the nuclear-norm witness used in the proof of Theorem 8.8g.82. Both of its marginal squares are at most $8/9$. Its spatial block $T$ belongs to $M$, and (8.8g.83.2) gives $t=\|T\|_F\ge\sqrt{11}/3$. For $R=T/t$ the support function of $M$ satisfies $h_M(R)\ge t$. Equation (8.8g.83.1) gives $h_M(-R)\le1/t$ by pairing $T$ against every point of $M$. Consequently the two bodies have support-function difference at least $t-1/t\ge2/(3\sqrt{11})$ in this unit direction. A Hausdorff displacement bounds any such difference from above, since moving a point by distance $\delta$ changes its pairing with $R$ by at most $\delta$.

Finally, let $D=\operatorname{diag}(1,-I_4)$. The orthogonal projection $\Pi$ is $X\mapsto(X+DXD)/2$. Simultaneous antipodal invariance puts both summands in $C$ for each $X\in C$, so it implies the projection hypothesis. $\square$

*A test without marginal erasure.* For any intermediate acute cone, suppose $T,-T\in M$ with $\|T\|_{\rm op}=1$. Choose a unit vector $b$ with $a=Tb$ of unit length. Then $T^{\mathsf T}a=b$. A normalized lift with block $T$ annihilates the two products with marginals $(a,-b)$ and $(-a,b)$. Indeed the two corresponding nonnegative pairings, multiplied by four, have constant and correlation terms $1-1=0$, with opposite remaining marginal terms. Applying the light-coordinate equations (8.8g.79.2) in that frame makes its two marginals $(da,db)$ for some real $d$. A lift of $-T$ instead annihilates the products with marginals $(a,b)$ and $(-a,-b)$ and has marginals $(ha,-hb)$ for some real $h$. Their marginal pairings cancel in the Frobenius product. Acuteness gives $0\le1-\|T\|_F^2$ after multiplying by four. Since $\|T\|_{\rm op}=1$, every other singular value is zero. Thus a centrally symmetric correlation body can contain no nonproduct unit-pure lift whose spatial block has operator norm one. In particular the central rank-four states forced by Theorem 8.8g.80 exclude that symmetry even without assuming positive marginal erasure.

<a id="theorem-88g84"></a>

<a id="theorem-88g84-central-symmetry-of-the-lorentz-five-correlation-body-is-impossible"></a>**Theorem 8.8g.84 (Central Symmetry of the Lorentz-Five Correlation Body Is Impossible).** Retain the all-pure Lorentz-five hypotheses and the spatial correlation body $M$ of Theorem 8.8g.83. Then $M\ne -M$. More precisely, let $q=\frac12\left(\begin{smallmatrix}1&b^{\mathsf T}\\a&T\end{smallmatrix}\right)$ be an actual entangled normalized pure state with $-T\in M$. Choose any top spatial singular pair of unit vectors $u,v$ with $Tv=\sigma u$ and $T^{\mathsf T}u=\sigma v$, where $\sigma=\|T\|_{\rm op}$. Then
\[
1-\langle q,p_up_v^{\mathsf T}\rangle_F>1/64.
\tag{8.8g.84.1}
\]
If $\sigma=1$, every pair of normalized lifts in $C$ of $T$ and $-T$ requires $\|T\|_F\le1$, whether the lifts are pure or mixed.

*Opposite correlations.* Write $r=\frac12\left(\begin{smallmatrix}1&(b')^{\mathsf T}\\a'&-T\end{smallmatrix}\right)\in C$ for any normalized lift of $-T$, and set
\[
x=a\cdot u,\quad y=b\cdot v,\quad x'=a'\cdot u,\quad y'=b'\cdot v,\quad
s=1-\sigma,\quad \nu=\frac{1+\sigma-x-y}{4}.
\]
Use $\perp$ to denote the spatial projection perpendicular to $u$ for the left marginal and to $v$ for the right marginal. The Lorentz inequalities on $(1,\pm v)$ for $2q$ give $\|a\pm\sigma u\|\le1\pm y$. Projecting these two inequalities onto $u$ gives $|x-y|\le s$. For $2r$ the same tests give $\|a'\mp\sigma u\|\le1\pm y'$ and $|x'+y'|\le s$. Since the axial marginal components have absolute value at most one, the axial cross term satisfies
\[
xx'+yy'=(x-y)x'+y(x'+y')\le2s.
\]
For $2q$ the negative-input test and the corresponding transpose test give
\[
\|a_\perp\|^2\le(s+x-y)(1+\sigma-x-y),\qquad
\|b_\perp\|^2\le(s+y-x)(1+\sigma-x-y).
\]
These follow by subtracting $(x-\sigma)^2$ from $(1-y)^2$, and $(y-\sigma)^2$ from $(1-x)^2$, respectively. Their sum is at most $8s\nu$. For $2r$, adding the squares of its two input inequalities gives $\|a'_\perp\|^2\le1-\sigma^2+(y')^2-(x')^2$. Adding the corresponding transpose estimate gives $\|a'_\perp\|^2+\|b'_\perp\|^2\le2(1-\sigma^2)$. By Cauchy–Schwarz and acuteness,
\[
\|T\|_F^2-1
\le a\cdot a'+b\cdot b'
\le 2s+4s\sqrt{(1+\sigma)\nu}.
\tag{8.8g.84.2}
\]
This argument uses only normalized Lorentz positivity and acuteness. In particular $\sigma=1$ implies $\|T\|_F\le1$.

*Pure states near products.* In the orthonormal light coordinates of the pair $u,v$, let $p=p_up_v^{\mathsf T}=E_{++}$. Put $h=1-\langle q,p\rangle_F$ and use the entries $\lambda,\mu,\nu$ and block $B$ of (8.8g.68.2). The singular frame gives $\nu=(1+\sigma-x-y)/4$, $\lambda+\mu=s/2$, $\lambda+\mu+\nu=h$, and $T=\operatorname{diag}(\sigma,2B)$ in the spatial coordinates. Since there are no spatial axial–transverse cross blocks, the plus-transverse strips in light coordinates equal the matching minus-transverse strips. The latter squared norms sum to at most $2\nu(\lambda+\mu)$ by (8.8g.68.3). The unit norm identity then yields
\[
\|B\|_F^2\ge 2h-h^2-(\lambda^2+\mu^2+\nu^2)-4\nu(\lambda+\mu)\ge2h-3h^2 .
\tag{8.8g.84.3}
\]
All three axial entries are nonnegative and sum to $h$. In the first bound the four strip squares sum to at most $4\nu(\lambda+\mu)$. Combining (8.8g.84.2) with $\|T\|_F^2=\sigma^2+4\|B\|_F^2$ gives
\[
\|B\|_F^2\le s+s\sqrt{(1+\sigma)\nu}\le 2(h-\nu)+2h\sqrt{2h}.
\tag{8.8g.84.4}
\]

A second positivity test bounds $\|B\|_{\rm op}$. Average the light matrix of $q$ with its simultaneous conjugation by $\operatorname{diag}(1,1,-I_3)$. This preserves Lorentz positivity and removes all strips while retaining the axial entries and $B$. Testing this averaged map on $(t,1,z)$ with $t>0$ and $\|z\|^2=2t$ gives, with $\alpha=1-h$,
\[
\|B\|_{\rm op}^2\le\frac{(\alpha t+\lambda)(\mu t+\nu)}{t}.
\]
Taking the infimum over $t>0$ gives $\|B\|_{\rm op}\le\sqrt{(1-h)\nu}+\sqrt{\lambda\mu}$. The infimum formula holds for zero coefficients by the limits at $0$ or $+\infty$. Since $\sqrt{\lambda\mu}\le(\lambda+\mu)/2=s/4\le h/2$, this is at most $\sqrt{\nu}+h/2$.

If $0<h\le1/64$, (8.8g.84.3)–(8.8g.84.4) imply $\nu/h\le3h/2+\sqrt{2h}<1/3$. The operator bound then gives $\|B\|_{\rm op}<(3/5+1/16)\sqrt h<2\sqrt h/3$. But $B$ has size $3\times3$, and (8.8g.84.3) gives $\|B\|_{\rm op}^2\ge\|B\|_F^2/3\ge(2-3h)h/3>h/2$, a contradiction. The case $h=0$ forces $q=p$ by the unit norms and is excluded for entangled $q$. This proves (8.8g.84.1).

*Consequences of central symmetry.* Suppose $M=-M$. Every actual entangled pure state satisfies the hypothesis of (8.8g.84.1). An entangled pure sequence tending to a pure product with spatial directions $u_0,v_0$ would have $T\to u_0v_0^{\mathsf T}$. For the top singular pairs, choose the joint sign so that $v\cdot v_0\ge0$. Compactness and the unique top singular line of $u_0v_0^{\mathsf T}$ give $v\to v_0$ and then $u=Tv/\sigma\to u_0$. The left side of (8.8g.84.1) tends to zero. Thus every pure product is separated from the actual entangled pure set.

For any opposite pair of a product frame, an entangled normalized pure state annihilating both products has $\sigma=1$ by (8.8g.79.2). But (8.8g.84.2) gives $\|T\|_F^2\le1$ because $-T\in M$. By (8.8g.83.2), a pure lift with such correlation norm is a pure product. Hence in each frame both complementary double-null faces have only their two axial product generators. The complementary-support argument of Theorem 8.8g.79, applied to either face since its two products are separated, forces an entangled pure generator in the other face. This contradiction proves $M\ne-M$. $\square$

<a id="corollary-88g84a"></a>

<a id="corollary-88g84a-an-explicit-spatial-correlation-asymmetry-gap"></a>**Corollary 8.8g.84a (An Explicit Spatial Correlation Asymmetry Gap).** Every all-pure self-dual Lorentz-five intermediate in Theorem 8.8g.84 satisfies
\[
d_{\rm H}(M,-M)>10^{-18}
\tag{8.8g.84a.1}
\]
for the Frobenius Hausdorff distance between its two spatial correlation bodies.

*Proof.* Suppose $\delta=d_{\rm H}(M,-M)\le10^{-18}$ and fix $d_0=10^{-6}$. For each normalized pure $q$ choose a normalized $r\in C$ whose spatial block is $-T+E$, where $\|E\|_F\le\delta$. The choice exists by compactness of $M$. Use the singular pair, marginal coordinates, $s,\nu$, and light variables of Theorem 8.8g.84 for $q$. The two tests for $2r$ now imply $\|a'\mp\sigma u\|\le1\pm y'+\delta$ after removing the error $\pm Ev$. Their axial projections give $|x'+y'|\le s+\delta$, and the axial cross term is at most $2s+\delta$. Adding the squares of these tests and their transpose counterparts gives
\[
\|a'_\perp\|^2+\|b'_\perp\|^2
\le 2(1-\sigma^2)+4\delta+2\delta^2
\le 2(1-\sigma^2)+8\delta .
\]
For $q$, the corresponding bound remains $8s\nu$. Acuteness also includes the spatial error $\langle T,E\rangle_F$, whose absolute value is at most $\sqrt3\,\delta$ by the unit norm of $q$. Hence
\[
\|T\|_F^2-1\le 2s+3\delta+4\sqrt{s\nu(2s+4\delta)}.
\tag{8.8g.84a.2}
\]
In particular $\|T\|_F^2-1\le10s+7\delta$, since $\nu\le1$ and $\sqrt{s(2s+4\delta)}\le2s+\delta$.

Fix any product frame and let $D(q)$ be the pairing with the sum of either of its opposite pairs. If the spatial directions are $\tilde u,\tilde v$, then $D(q)=(1\pm\tilde u^{\mathsf T}T\tilde v)/2$. Thus $s\le2D(q)$. Consider first $D(q)\le d_0$. The unit norm implies that at least one marginal, say $a$, has squared norm at least $1-5s-7\delta/2$. Its transverse squared norm is at most $8s$ by the exact tests for $q$. Choose the joint sign of the singular pair so $x=a\cdot u\ge0$. Then $1-x\le1-x^2\le13s+7\delta/2$. Since $|x-y|\le s$ and $4h=s+2-x-y$, one has $h\le7s+2\delta<1/64$. The same estimate holds if the chosen marginal is $b$, by interchanging the two roles.

Combining (8.8g.84a.2) with $\|T\|_F^2=(1-s)^2+4\|B\|_F^2$, and using $s\le2h$ and $\nu\le h$, gives
\[
\begin{aligned}
\|B\|_F^2&\le 2(h-\nu)+2h\sqrt{2h}+h^2+\tfrac{11}{4}\delta .
\end{aligned}
\tag{8.8g.84a.3}
\]
Here $\sqrt{s\nu(2s+4\delta)}\le s\sqrt{2\nu}+2\sqrt{s\nu\delta}\le2h\sqrt{2h}+h^2+2\delta$. For $0<h\le1/64$ and $h\ge64\delta$, the lower bound (8.8g.84.3) together with (8.8g.84a.3) gives
\[
\nu/h\le2h+\sqrt{2h}+\tfrac{11}{8}\delta/h<1/3.
\]
The operator-norm comparison in Theorem 8.8g.84 then again gives both $\|B\|_{\rm op}^2<4h/9$ and $\|B\|_{\rm op}^2>h/2$. Consequently either $h=0$ or $h<64\delta$. The pure state $q$ is within $\sqrt{128\delta}$ in Frobenius distance of the product built from its top singular pair.

In the original fixed product frame, let $B_{\rm fr}(q)$ be the transverse block. For every pure product $p$ one has $\|B_{\rm fr}(p)\|_F\le D(p)$ by the product estimate of Theorem 8.8g.79. The map to the transverse block is an orthogonal projection and $D$ has Lipschitz constant $\sqrt2$, the norm of the sum of two orthogonal unit products. For $D(q)\le d_0$ the preceding proximity to a product therefore yields
\[
\|B_{\rm fr}(q)\|_F\le D(q)+(1+\sqrt2)\sqrt{128\delta}.
\]
For $D(q)>d_0$, the unit norm gives $\|B_{\rm fr}(q)\|_F\le1$.

Write $u_0,v_0$ for the sums of the two complementary opposite pairs in the fixed product frame, and take any purely transverse $Z$ of Frobenius norm $d_0$. Put $\epsilon=d_0(1+\sqrt2)\sqrt{128\delta}$. The last two bounds, applied with $D(q)=\langle u_0,q\rangle_F$, give
\[
\langle u_0+Z+\epsilon U,q\rangle_F\ge0
\]
for every normalized pure $q$. For $D(q)\le d_0$ the lower bound is $(1-d_0)D(q)$, and for $D(q)>d_0$ the term $D(q)$ covers the possible transverse loss. The same reasoning applies to $v_0-Z+\epsilon U$. By pure generation and self-duality, both vectors belong to $C$. Their pairing is $-d_0^2+4\epsilon+4\epsilon^2$, because $u_0,v_0,Z$ are pairwise orthogonal, $e(u_0)=e(v_0)=2$, $e(Z)=0$, and $\|U\|_F^2=4$. But $\epsilon<3\cdot10^{-14}$ when $\delta\le10^{-18}$, so this pairing is negative. This contradicts acuteness and proves (8.8g.84a.1). $\square$

<a id="theorem-88g85"></a>

<a id="theorem-88g85-directional-correlation-asymmetry-in-every-lorentz-product-frame"></a>**Theorem 8.8g.85 (Directional Correlation Asymmetry in Every Lorentz Product Frame).** Let $L_s,L_t$ be Lorentz cones with respective spatial dimensions $s,t\ge2$ and use the Frobenius pairing and normalizer $e(X)=2X_{00}$ on $\operatorname{Mat}_{s+1,t+1}(\mathbb R)$. Suppose $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ is all-pure. Define $M$ as the spatial correlation body in Theorem 8.8g.83, now with $s$-by-$t$ spatial blocks. Set
\[
d=\min(s-1,t-1),\qquad H=\frac1{4096d^2},\qquad
d_0=\frac H{32},\qquad \delta_0=\frac{d_0^2}{65536d},\qquad
\epsilon_0=d_0(1+\sqrt2)\sqrt{128d\delta_0}.
\]
For $s=t=4$ one may instead use $d_0=10^{-6}$, $\delta_0=10^{-18}$, and $\epsilon_0=d_0(1+\sqrt2)\sqrt{128\delta_0}$.

Choose any product frame, with complementary opposite pairs whose sums are $u_0,v_0$. Let $B_{\rm fr}(q)$ be the $(s-1)$-by-$(t-1)$ transverse block of $q$ in its light coordinates, and let $D_w(q)=\langle w,q\rangle_F$ for $w=u_0,v_0$. For every unit transverse matrix $Z$, at least one of the following holds for an actual normalized pure state $q$ with $\operatorname{dist}_F(-T_q,M)>\delta_0$:
\[
\begin{array}{ll}
D_{u_0}(q)<d_0,\qquad
-d_0\langle Z,B_{\rm fr}(q)\rangle_F>D_{u_0}(q)+\epsilon_0,\\[2mm]
D_{v_0}(q)<d_0,\qquad
 d_0\langle Z,B_{\rm fr}(q)\rangle_F>D_{v_0}(q)+\epsilon_0.
\end{array}
\tag{8.8g.85.1}
\]
In particular, with $A_w$ the actual normalized pure states satisfying $D_w(q)<d_0$ and $\operatorname{dist}_F(-T_q,M)>\delta_0$, the convex hull of
\[
\{-B_{\rm fr}(q):q\in A_{u_0}\}\ \cup\ \{B_{\rm fr}(q):q\in A_{v_0}\}
\tag{8.8g.85.2}
\]
contains the open transverse ball of radius $\epsilon_0/d_0$, and its closed convex hull contains the closed ball of that radius. Each witness in (8.8g.85.1) has spatial correlation of magnitude greater than $1-2d_0$ in the nominated frame.

*Proof.* Positivity of a map and its transpose gives the marginal bounds and $\|T_q\|_{\rm op}\le1$ exactly as in Theorem 8.8g.23. The same proof with rectangular matrices makes the normalized maximal base compact and gives the local pure marginal faces and pure products. In particular the normalized base of $C$ is compact and generated by its normalized pure states, and $M$ is compact.

Fix a normalized pure $q$, and suppose $r\in C$ is a normalized lift with $T_r=-T_q+E$, $\|E\|_F\le\delta_0$. Use a top spatial singular pair of $T_q$ and the variables $\sigma,s_*=1-\sigma,h,\lambda,\mu,\nu,B$ of Theorem 8.8g.84, where $s_*$ denotes the singular-value deficit. The two Lorentz tests and their transposes in Corollary 8.8g.84a involve only the two axial components and the Euclidean norms of their perpendicular components. The tests apply in these unequal dimensions, with the same bounds
\[
\begin{aligned}
\|T_q\|_F^2-1&\le 2s_*+3\delta_0+4\sqrt{s_*\nu(2s_*+4\delta_0)}
                    \le10s_*+7\delta_0,\\
\|B\|_F^2&\ge2h-3h^2,\qquad
\|B\|_{\rm op}\le\sqrt{\nu}+h/2 .
\end{aligned}
\tag{8.8g.85.3}
\]
For the first line the cross estimate is Euclidean Cauchy–Schwarz on the two perpendicular marginal components, and the term from $E$ is bounded by $\sqrt3\,\delta_0$ because $\|q\|_F=1$. For the second line, the top singular frame again gives $\lambda+\mu=s_*/2$, and its four strip squares sum to at most $4\nu(\lambda+\mu)$. Averaging simultaneous transverse sign flips preserves Lorentz positivity. Testing the averaged map on the axial null inputs with transverse norm $\sqrt{2r_*}$ for axial coordinates $(r_*,1)$, $r_*>0$, gives $\|B\|_{\rm op}\le\sqrt{(1-h)\nu}+\sqrt{\lambda\mu}\le\sqrt\nu+h/2$. This test applies to every unit input transverse direction.

If $D_w(q)\le d_0$ for either nominated sum, then $D_w(q)=(1\pm \tilde u^{\mathsf T}T_q\tilde v)/2$ in the fixed frame, so $s_*\le2d_0$. The first line of (8.8g.85.3) gives at least one marginal of squared norm at least $1-5s_*-7\delta_0/2$. The corresponding top-singular transverse marginal has squared norm at most $8s_*\nu\le8s_*$. Choose the joint sign of the singular pair to make the associated axial component $x$ nonnegative. Then $1-x\le1-x^2\le13s_*+7\delta_0/2$. The other axial component $y$ has $|x-y|\le s_*$ by the exact Lorentz tests. Hence $4h=s_*+2-x-y\le28s_*+7\delta_0$, and $h\le14d_0+2\delta_0<H$.

The argument of (8.8g.84a.3), with $s_*\le2h$ and $\nu\le h$, gives
\[
\|B\|_F^2\le2(h-\nu)+2h\sqrt{2h}+h^2+\tfrac{11}{4}\delta_0.
\]
If $64d\delta_0\le h\le H$ and $h>0$, comparing to (8.8g.85.3) gives
\[
\nu/h\le2h+\sqrt{2h}+\frac{11\delta_0}{8h}
\le \frac{1}{2048d^2}+\frac{\sqrt2}{64d}+\frac{11}{512d}
<\frac1{16d}.
\]
Then $\|B\|_{\rm op}\le\sqrt\nu+h/2<\sqrt h/(2\sqrt d)$. On the other hand $B$ has at most $d$ singular values, so $\|B\|_{\rm op}^2\ge\|B\|_F^2/d>(h/d)$, a contradiction. Therefore $q$ lies within $\sqrt{128d\delta_0}$ of its singular-frame product. For the alternative constants on $s=t=4$, the same proximity estimate with $d$ omitted follows from the pointwise argument of Corollary 8.8g.84a, which uses an opposite lift only for the chosen $q$ with $D_w(q)\le d_0$.

For a product $p$ in the fixed frame, $\|B_{\rm fr}(p)\|_F\le D_w(p)$ for either sum by the two axial product formulas in Theorem 8.8g.79. The transverse block projection has norm one and $D_w$ has Lipschitz constant $\sqrt2$. Thus every pure $q$ with $D_w(q)\le d_0$ and $\operatorname{dist}_F(-T_q,M)\le\delta_0$ satisfies
\[
\|B_{\rm fr}(q)\|_F\le D_w(q)+\epsilon_0/d_0.
\tag{8.8g.85.4}
\]
Existence of the approximate opposite lift here follows from compactness of $M$.

The vectors $u_0+d_0Z+\epsilon_0 U$ and $v_0-d_0Z+\epsilon_0 U$ have pairing $-d_0^2+4\epsilon_0+4\epsilon_0^2<0$. Indeed $(1+\sqrt2)\sqrt{128}<28$ gives $\epsilon_0<28d_0^2/256$ for the dimension-dependent constants. For the alternative constants the estimate is the one in Corollary 8.8g.84a. Acuteness puts at least one vector outside $C$. Self-duality and pure generation give a normalized pure $q$ pairing strictly negatively with that vector. Because $\|B_{\rm fr}(q)\|_F\le1$, necessarily $D_w(q)<d_0$. Equation (8.8g.85.4) would make this pairing at least $(1-d_0)D_w(q)\ge0$, so the opposite correlation has distance greater than $\delta_0$. The negative pairing gives the respective signed inequality in (8.8g.85.1). The bound on the nominated correlation follows from the formula for $D_w$.

For each unit $Z$ the support supremum of (8.8g.85.2) in direction $Z$ is at least $\epsilon_0/d_0$. Separation therefore puts the closed ball of that radius in the closed convex hull. A finite-dimensional convex set and its closure have the same relative interior, and here that interior is full-dimensional. Hence the open ball is in the convex hull itself. $\square$

<a id="theorem-88g86"></a>

<a id="theorem-88g86-compact-quadratic-lorentz-completion-tests-with-directional-correlation-witnesses"></a>**Theorem 8.8g.86 (Compact Quadratic Lorentz Completion Tests with Directional Correlation Witnesses).** Retain the fixed Lorentz-five carrier of Theorem 8.8g.23. Fix a dense sequence $(X_i)$ of rational matrices in the unit ball as in Theorem 8.8g.24. Independently fix a dense sequence $(a_i,b_i,Z_i)$ in the compact set
\[
\mathcal D=\{(a,b,Z):a,b\in S^3,\ Z\in\operatorname{Mat}_4(\mathbb R),\
a^{\mathsf T}Z=0,\ Zb=0,\ \|Z\|_F=1\}
\]
with all coordinates rational. Also fix a dense sequence $(c_j,d_j)$ of rational unit spatial direction pairs. At level $k$, retain all constraints of the compact quadratic test $\widehat{\mathfrak F}(X_1,\ldots,X_k)$ of Corollary 8.8g.40. Add the following constraints for the first $k$ directions and the first $k$ product pairs. Then every level is feasible if and only if the original all-pure self-dual Lorentz-five completion exists. The same cone realizes a closed directional certificate on all of $\mathcal D$ in the limiting construction below.

Set $d_0=10^{-6}$, $\delta_0=10^{-18}$, and $\epsilon_*=10^{-14}$. Add one $q_i\in\mathcal Q$ for each $i\le k$, using the unit-norm, row and multiplier bounds and the symmetric-square positivity equations of Corollary 8.8g.40, without a weight. Add $R_i\in\operatorname{Mat}_4(\mathbb R)$, $0\le\beta_i\le2$ and a sign $\chi_i$ with $\chi_i^2=1$. Write $\mathcal L_k$ for the list of all $50k$ original generators and the $k$ new pure slots. For any $q\in\mathcal Q$, $T_q$ denotes the spatial block of $2q$. Impose all new unordered acute-pair constraints on $\mathcal L_k$. For each $i\le k$ impose
\[
\begin{aligned}
&\|R_i\|_F^2\le1,\qquad -\langle R_i,T_{q_i}\rangle_F-\beta_i\ge\delta_0,\\
&\beta_i\ge\langle R_i,T_q\rangle_F &&(q\in\mathcal L_k),\\
&\beta_i\ge c_j^{\mathsf T}R_i d_j &&(1\le j\le k),\\
&\frac{1+\chi_i a_i^{\mathsf T}T_{q_i}b_i}{2}\le d_0,\\
&-\frac{\chi_i d_0}{2}\langle Z_i,T_{q_i}\rangle_F
  \ge\frac{1+\chi_i a_i^{\mathsf T}T_{q_i}b_i}{2}+\epsilon_* .
\end{aligned}
\tag{8.8g.86.1}
\]
Each level is a compact existential system over the rationals of degree at most two. Relative to Corollary 8.8g.40 it adds $58k$ scalar variables, $17k$ scalar equations and
\[
9k+102k^2+\binom{k}{2}
\tag{8.8g.86.2}
\]
weak inequalities.

*Proof.* Rational data can be made dense as stated. For unit vectors, the stereographic parametrization has rational coordinates on rational parameters and dense image after taking their closure. Rational matrices in $SO(4)$ are dense by writing a real rotation as a product of plane rotations, and approximating each pair of sine and cosine values on the unit circle by rational values. For any $(a,b,Z)\in\mathcal D$ complete $a,b$ to first axes of oriented orthogonal frames. In those frames the only block of $Z$ is a transverse three-by-three matrix of Frobenius norm one. Approximate the two frames and the unit transverse matrix by the preceding rational parametrizations, then transform back. The resulting rational data satisfy all defining equations of $\mathcal D$.

Suppose a completion $C$ exists. Choose the original slots by Corollary 8.8g.40. For each new direction choose an actual pure $q_i$ and one of the two complementary sums in Theorem 8.8g.85. Write $\chi_i=1$ for the sum with positive spatial axial sign and $\chi_i=-1$ for the sum with negative spatial axial sign. Pairing with that sum gives $(1+\chi_i a_i^{\mathsf T}T_{q_i}b_i)/2$, and the transverse pairing with $Z_i$ is $\langle Z_i,T_{q_i}\rangle_F/2$. The theorem gives the last two constraints of (8.8g.86.1) because $\epsilon_*=10^{-14}$ is less than $\epsilon_0=d_0(1+\sqrt2)\sqrt{128\delta_0}$. All the generators are acute in $C$.

The compact convex correlation body $M$ has $\operatorname{dist}_F(-T_{q_i},M)>\delta_0$. Let $Y_i$ be its nearest point to $-T_{q_i}$, and choose $R_i=(-T_{q_i}-Y_i)/\|-T_{q_i}-Y_i\|_F$. The projection inequality shows that the support maximum $h_M(R_i)$ equals $\langle R_i,Y_i\rangle_F$. Taking $\beta_i=h_M(R_i)$ yields the first three lines of (8.8g.86.1). The inclusion of all products gives $0\in M$, and unit pure generation gives $\|T\|_F\le\sqrt3$ on $M$, so $0\le\beta_i\le\sqrt3<2$.

Conversely, choose a solution at every level. All variables associated to any fixed index lie in a common compact set independent of the level. For the original variables this follows from Corollary 8.8g.40, and the same trace bound in (8.8g.40.3) applies to each new pure slot's symmetric-square witness. The norms of $R_i$, the bounds on $\beta_i$ and the sign equations bound the remaining variables. Extract a diagonal subsequence so every fixed-index block converges. All constraints involving any fixed finite set of indices hold at every sufficiently large level and pass to the limit.

Let $\mathcal T$ be the closure in $\mathcal Q$ of all limiting pure generators, including the new slots, together with all products. The limit pairings and product positivity make $\mathcal T$ acute. The cone $C=\operatorname{cone}(\mathcal T)$ is closed and all-pure by (8.8g.24.6). The limiting decompositions for each $X_i$ hold inside $C$; by density and the norm bounds they extend to the whole unit ball as in (8.8g.24.8). For $X\in C^*$ in that ball, its decomposition $X=P-N$ with orthogonal $P,N\in C$ gives $0\le\langle X,N\rangle_F=-\|N\|_F^2$. Hence $X\in C$, and positive scaling gives self-duality. Product inclusion and $\mathcal T\subseteq\mathcal Q$ establish the required tensor bounds.

For each limiting separator the second and third lines of (8.8g.86.1) hold on all limit slots and on a dense sequence of products. Continuity gives the inequality for every member of $\mathcal T$. Convex generation of the normalized base then gives $h_M(R_i)\le\beta_i$ for the actual limiting correlation body. The first line implies
\[
\operatorname{dist}_F(-T_{q_i},M)\ge
-\langle R_i,T_{q_i}\rangle_F-\beta_i\ge\delta_0 .
\]
Each $q_i$ is an actual pure state of this same cone by (8.8g.24.6). The last two lines provide the directional certificate on the dense menu. To extend it to an arbitrary direction, take a converging sequence of menu directions and a subsequence along which their $q_i,R_i,\beta_i,\chi_i$ converge, using compactness and the fixed cone $C$. The closed directional and separator constraints pass to the limit. This proves the claimed coverage of $\mathcal D$.

For the count, each unweighted pure slot has $24+1+15=40$ variables, $16$ equations and three inequalities. Its separator and sign add $16+1+1=18$ variables and one equation. The two bounds on $\beta_i$, the separator norm and gap, and the two directional bounds give six further inequalities per index. The new acute pairs contribute $50k^2+\binom{k}{2}$, and the separator pairings contribute $51k^2+k^2$ if applied to all original and new slots and the $k$ product pairs. Thus the new cross inequalities total $102k^2+\binom{k}{2}$, and the new single-index inequalities total $9k$. All products of variables have degree at most two, including the sign times the two linear correlation expressions. $\square$

<a id="theorem-88g87"></a>

<a id="theorem-88g87-locally-covariant-all-pure-lorentz-self-composites-beyond-the-qubit-dimension-are-impossible"></a>**Theorem 8.8g.87 (Locally Covariant All-Pure Lorentz Self-Composites beyond the Qubit Dimension Are Impossible).** Let $s\ge4$. On $\operatorname{Mat}_{s+1}(\mathbb R)$ use the Lorentz cones, Frobenius pairing and normalization of Proposition 8.8g.47. There is no all-pure self-dual intermediate $K_{\min}\subseteq C=C^*\subseteq K_{\max}$ that is invariant under the independent left and right spatial rotations from $SO(s)$. For odd $s$, it suffices that the independent left and right axial half-turns $S_u=2uu^{\mathsf T}-I_s$ preserve $C$ for every $u\in S^{s-1}$.

*Proof.* For even $s$, the spatial antipode belongs to $SO(s)$, so Proposition 8.8g.47(4) applies. Suppose $s$ is odd, and let $q=\frac12\left(\begin{smallmatrix}1&b^{\mathsf T}\\a&T\end{smallmatrix}\right)$ be any normalized pure state of a candidate. Set $A=\|a\|$, $B=\|b\|$ and $\Delta=1-B^2$. The unit norm gives $A^2+B^2+\|T\|_F^2=3$. If $B=1$, the local-pure marginal argument of Proposition 8.8g.47(4) already gives a pure product. Suppose $B<1$.

For each unit $u$, acuteness with the independently rotated left state gives
\[
0\le4\langle q,\operatorname{diag}(1,S_u)q\rangle_F
= 2\bigl(u^{\mathsf T}(aa^{\mathsf T}+TT^{\mathsf T})u-\Delta\bigr).
\tag{8.8g.87.1}
\]
Apply the Lorentz S-lemma of Theorem 8.8g.24 to $(2q)^{\mathsf T}$, with $J=\operatorname{diag}(1,-I_s)$. The proof there uses the strict Lorentz interior vector and applies in this dimension. It gives $\lambda\ge0$ with
\[
\begin{pmatrix}
\Delta-\lambda & a^{\mathsf T}-b^{\mathsf T}T^{\mathsf T}\\
a-Tb & aa^{\mathsf T}+\lambda I_s-TT^{\mathsf T}
\end{pmatrix}\succeq0 .
\tag{8.8g.87.2}
\]
In particular $\lambda\le\Delta$. For any unit $u\perp a$, (8.8g.87.1) gives $u^{\mathsf T}TT^{\mathsf T}u\ge\Delta$, and the lower block of (8.8g.87.2) gives the reverse bound by $\lambda$. Thus $\lambda=\Delta$ and equality holds for every such $u$. Since a zero quadratic form of a positive semidefinite matrix lies in its kernel, the lower block gives $TT^{\mathsf T}u=\Delta u$ on $a^\perp$. The zero time-time entry of (8.8g.87.2) also forces $a=Tb$.

Apply the same argument to the transposed matrices and the independent rotations on the right. This gives $b=T^{\mathsf T}a$. In particular $A^2=\langle a,Tb\rangle=\langle T^{\mathsf T}a,b\rangle=B^2$. If $a\ne0$, the two marginal identities give $TT^{\mathsf T}a=a$. Its eigenvalues are therefore $1$ along $a$ and $\Delta$ on $a^\perp$. If $a=0$, then $b=0$, $\Delta=1$, and the equality on $a^\perp$ gives $TT^{\mathsf T}=I_s$. Both cases give
\[
3=A^2+B^2+\|T\|_F^2
  =2B^2+1+(s-1)\Delta
  =3+(s-3)\Delta .
\tag{8.8g.87.3}
\]
Since $s\ge5$ and $\Delta>0$, this is impossible. Hence every pure state is a product. The compact normalized base is generated by its pure states, so $C=K_{\min}$. Proposition 8.8g.47(4) gives $K_{\min}\ne K_{\max}$, contradicting self-duality. Each $S_u$ belongs to $SO(s)$ for odd $s$, proving the covariance assertion. $\square$

<a id="theorem-88g88"></a>

<a id="theorem-88g88-opposite-product-faces-require-two-sided-transverse-accumulation"></a>**Theorem 8.8g.88 (Opposite Product Faces Require Two-Sided Transverse Accumulation).** Retain the all-pure self-dual Lorentz-five hypotheses of Theorem 8.8g.23. Fix a product frame and let $u,v$ be the sums of its complementary opposite pairs. Let $\mathcal B$ denote the transverse $3$-by-$3$ matrix space in this frame. For a state $q$, let $B(q)\in\mathcal B$ be its transverse block and $D(q)=\langle u,q\rangle_F$. Write $F_v=C\cap v^\perp$, whose axial coordinates are the two products summing to $u$, and let $P_v$ be the image of $F_v$ under the transverse block projection. For the normalized pure set $\mathcal T$, define
\[
\begin{aligned}
G_u&=\overline{\operatorname{conv}\bigl(\{0\}\cup
    \{B(q)/D(q):q\in\mathcal T,\ D(q)>0\}\bigr)
    +\operatorname{cone}\{B(q):q\in\mathcal T,\ D(q)=0\}},\\
K_u&=\overline{\operatorname{cone}\Lambda_u},\\
\Lambda_u&=\left\{z:\ 
\begin{array}{l}
B(q_j)\ne0,\quad q_j\in\mathcal T,\quad D(q_j)/\|B(q_j)\|_F\to0,\\
B(q_j)/\|B(q_j)\|_F\to z\quad\text{for some sequence }(q_j)
\end{array}\right\}.
\end{aligned}
\tag{8.8g.88.1}
\]
The cone of an empty set is $\{0\}$. Use the nonnegative sign convention for dual cones. Then, with $h_G$ the support function of $G$, one has
\[
P_v=\{Z\in\mathcal B:h_{G_u}(-Z)<+\infty\},
\qquad
\overline{P_v}=(\operatorname{rec}G_u)^*,
\qquad
\operatorname{int}(K_u^*)\subseteq P_v\subseteq K_u^* .
\tag{8.8g.88.2}
\]
If $K_u$ is pointed, $P_v$ is full-dimensional and $\overline{P_v}=K_u^*$. Thus if $F_v$ is generated by the two products summing to $u$, $K_u$ is not pointed. In particular, if neither opposite face has an entangled pure generator, then each complementary pair must admit fast transverse limits in (8.8g.88.1) whose closed conic hull contains a line. A family of such directions contained in an open hemisphere with positive angular margin cannot support that configuration.

*Proof.* Each member of $F_v$ has its two nonnegative axial coordinates on the products summing to $u$, together with a transverse block, by the double-null form of Theorem 8.8g.67. Suppose $f\in F_v$ has transverse block $Z$. Let $t$ be the maximum of its two axial entries. All product pairings are nonnegative on $C$, so $-\langle Z,B(q)\rangle_F\le tD(q)$ for every $q\in\mathcal T$, by acuteness with $f$. In particular $\langle Z,B(q)\rangle_F\ge0$ when $D(q)=0$, and the ratio support is bounded above by $t$ for $D(q)>0$. This gives $h_{G_u}(-Z)<+\infty$. Conversely, suppose this support is finite. It is nonnegative since $0\in G_u$. Choose $t\ge h_{G_u}(-Z)$. Then $tu+Z$ pairs nonnegatively with every pure state, including the pure states with $D=0$ by the conic summand in $G_u$. Pure generation and self-duality put $tu+Z$ in $C$, and it is orthogonal to $v$, so $Z\in P_v$.

For completeness, define the barrier cone of a nonempty closed convex $G$ as $H=\{Y:h_G(Y)<+\infty\}$. Then $\operatorname{rec}G=\{B:\langle Y,B\rangle_F\le0\text{ for all }Y\in H\}$. For a recession vector this follows by testing $g+tB\in G$. Conversely if the inequalities hold, $g+tB$ satisfies every finite support bound of $G$; separation of points from closed convex sets then puts it in $G$. Taking dual cones and using the bipolar identity for the convex cone $H$ gives $\overline{-H}=(\operatorname{rec}G)^*$. Apply this to $G_u$ and the first identity in (8.8g.88.2).

If $Z\in P_v$, the bound $-\langle Z,B(q)\rangle_F\le tD(q)$ above implies $\langle Z,z\rangle_F\ge0$ for each $z\in\Lambda_u$, by division by the block norm and passage to the limit. This proves $P_v\subseteq K_u^*$. For the reverse interior inclusion, take $Z\in\operatorname{int}(K_u^*)$. Then $\langle Z,z\rangle_F>0$ for every unit $z\in K_u$, since a sufficiently small perturbation of $Z$ along $-z$ is still in the dual. In particular any exact $D=0$ nonzero block has positive pairing, as its normalized direction belongs to $\Lambda_u$ by the constant sequence. If the negative ratio support from $D>0$ were infinite, there would be a sequence with
\[
-\langle Z,B(q_j)\rangle_F/D(q_j)\longrightarrow+\infty.
\]
Then $D(q_j)/\|B(q_j)\|_F\to0$, and a subsequential unit block limit $z$ would lie in $\Lambda_u$ with $\langle Z,z\rangle_F\le0$, a contradiction. This reasoning also handles $K_u=\{0\}$, when there are no unit directions in $\Lambda_u$. Therefore $h_{G_u}(-Z)<+\infty$, giving the left inclusion of (8.8g.88.2).

A closed pointed cone in finite dimension has a dual with nonempty interior. Indeed, if its dual did not span the whole space, an orthogonal nonzero line would lie in the double dual, which is the cone itself. Its full-dimensional dual is the closure of its interior. Thus the sandwich yields full dimension and equality of the two closures when $K_u$ is pointed. A product-only $F_v$ has $P_v=\{0\}$, so this forces nonpointedness. The recession identity also gives $\operatorname{rec}G_u=\mathcal B$ in this case. Since $0\in G_u$, the whole space $\mathcal B$ then equals $G_u$. If both faces are product-only, apply the conclusion twice, with the two opposite pair sums exchanged. In this case no sequence in (8.8g.88.1) can contain a nonzero block with $D=0$. Since the blocks are bounded and $D/\|B\|_F\to0$, each such sequence has $D\to0$. Its pure accumulation points must be the two products in $C\cap u^\perp$. Hence the angular requirement concerns entangled pure states near those two products. If all angular limits lay in an open hemisphere with positive margin, their closed positive hull would be pointed, contrary to the preceding result. $\square$

<a id="theorem-88g89"></a>

<a id="theorem-88g89-superquadratic-opposite-face-approach-forces-adjacent-tangent-orthogonality"></a>**Theorem 8.8g.89 (Superquadratic Opposite-Face Approach Forces Adjacent Tangent Orthogonality).** Retain the acute Lorentz-five carrier and product-frame coordinates of Theorem 8.8g.70. Let $p,\bar p$ be opposite pure products of a fixed frame and $p_1,p_2$ its other two products. For an actual normalized pure state $q$ write
\[
h_p(q)=1-\langle p,q\rangle_F,\qquad D(q)=\langle p_1+p_2,q\rangle_F.
\]
Suppose $q_j\ne p$ are actual normalized pure states with $q_j\to p$ and $D(q_j)/h_p(q_j)\to0$. Every subsequential limit $B$ of their transverse blocks divided by $\sqrt{2h_p(q_j)}$ has Frobenius norm one and is orthogonal to each purely transverse derivative of a two-sided differentiable arc of actual normalized pure states at either adjacent product.

In addition, suppose $C$ is all-pure and self-dual, and its entire actual normalized pure locus is a $C^{1,1}$ embedded manifold near all four products. Let $W_r$ be its purely transverse tangent space at a product $r$ in the frame. If both complementary double-null faces are product-only, then for each opposite pair $\{p,\bar p\}$ at least one of the two intersections
\[
W_p\cap(W_{p_1}+W_{p_2})^\perp,\qquad
W_{\bar p}\cap(W_{p_1}+W_{p_2})^\perp
\tag{8.8g.89.1}
\]
is nonzero. In particular, if both intersections are zero for one opposite pair, some double-null face in that frame has an entangled normalized pure generator.

*Proof of the adjacent orthogonality.* Put $h_j=h_p(q_j)$, $D_j=D(q_j)$ and $t_j=\sqrt{2h_j}=\|q_j-p\|_F$. In (8.8g.68.2), with $p=E_{++}$, the two adjacent entries sum to $D_j=\lambda_j+\mu_j=o(h_j)$, and the opposite entry is $\nu_j=h_j-D_j$. By (8.8g.68.3) the plus-transverse strip squares are $O(D_j)=o(t_j^2)$. The minus-transverse strip squares are $O(D_jh_j)=o(t_j^2)$. All axial differences from $p$ are $O(h_j)=o(t_j)$. Thus along any subsequence with transverse block limit $B$ at scale $t_j$ one has
\[
q_j=p+t_jB+o(t_j),\qquad \|B\|_F=1,
\tag{8.8g.89.2}
\]
where $B$ is inserted only into the transverse block. The norm follows since all the other entries are $o(t_j)$.

At either adjacent product $p_i$, let $r(\tau)=p_i+\tau B'+o(|\tau|)$ be a two-sided arc with purely transverse derivative $B'$. The arc has unit norm. Hence
\[
1-\langle p_i,r(\tau)\rangle_F=\|r(\tau)-p_i\|_F^2/2=O(\tau^2).
\]
All four frame product pairings are nonnegative and sum to one. Consequently $\langle p,r(\tau)\rangle_F=O(\tau^2)$. Put
\[
u_j=t_j\left(\sqrt{D_j/t_j^2}+t_j\right)>0.
\]
Then $u_j/t_j\to0$ and $D_j/(t_ju_j)\to0$, including indices with $D_j=0$. For both signs $\varepsilon=\pm1$, use the exact identity
\[
\langle q_j,r(\varepsilon u_j)\rangle_F
=\langle q_j,p_i\rangle_F+\langle p,r(\varepsilon u_j)\rangle_F
 +\langle q_j-p,r(\varepsilon u_j)-p_i\rangle_F.
\]
The first term is at most $D_j$, the second is $O(u_j^2)$, and (8.8g.89.2) and differentiability make the last term equal to $\varepsilon t_ju_j\langle B,B'\rangle_F+o(t_ju_j)$. In particular the cross terms involving all four strips are included in this remainder: their contribution from the difference $q_j-p-t_jB$ is $o(t_j)O(u_j)$ by Cauchy–Schwarz. Divide by $t_ju_j$ and use acuteness for both signs. This gives $\langle B,B'\rangle_F=0$.

*Proof of the frame consequence.* Fix an opposite pair $\{p,\bar p\}$ and suppose both intersections in (8.8g.89.1) are zero. Theorem 8.8g.70 identifies the tangent at each corner as the direct sum of the product tangent and $W_r$, with $\dim W_r\le4$. Every tangent vector is the derivative of a signed differentiable arc of the manifold. A normalized secant limit at a point of a differentiable embedded manifold lies in its tangent space, by a local graph representation. Thus if $D(q)/h_p(q)\to0$ along actual pure $q\to p$, (8.8g.89.2) and the adjacent orthogonality produce a unit element of the first intersection. This is impossible. Therefore in some neighborhood of $p$ there is $c_p>0$ with $D(q)\ge c_p h_p(q)$ on the actual pure locus. The same argument gives such a bound near $\bar p$, using $h_{\bar p}$ and the same $D$. Failure of either bound would produce a sequence of nonzero displacements tending to zero with the corresponding ratio tending to zero.

Since $\dim(W_p+W_{\bar p})\le8$, choose a nonzero transverse $Z\perp W_p+W_{\bar p}$ in the nine-dimensional transverse space. Its embedded matrix is also perpendicular to the product tangents at both corners. The $C^{1,1}$ graph bound used in Theorem 8.8g.70 then gives, locally at each corner,
\[
|\langle Z,B(q)\rangle_F|\le C_r\|q-r\|_F^2=2C_r h_r(q),\qquad r=p,\bar p.
\]
The local deficit bounds give $|\langle Z,B(q)\rangle_F|\le L D(q)$ in the union of the two neighborhoods for some finite $L$. If the double-null face annihilating $p_1,p_2$ is product-only, these two corners are the only normalized pure points with $D=0$. Compactness of the actual pure set gives a positive lower bound on $D$ outside the two neighborhoods. After enlarging $L$, the displayed ratio bound holds on the whole pure set. The exact support test (8.8g.88.2), with $u=p_1+p_2$, puts $Z$ in the transverse image of the complementary double-null face annihilating $p,\bar p$. That face is also product-only by assumption and has transverse image zero, contradicting $Z\ne0$. This proves the result. $\square$

<a id="theorem-88g90"></a>

<a id="theorem-88g90-antipodal-separation-of-central-rank-four-orientation-completions"></a>**Theorem 8.8g.90 (Antipodal Separation of Central Rank-Four Orientation Completions).** Let $\mathcal M$ be a nonempty compact family of rank-three partial isometries $T$ on the spatial carrier $\mathbb R^4$ of Theorem 8.8g.23. Suppose the central normalized pure states $q_T=\tfrac12\operatorname{diag}(1,T)$ form an acute family. Use the fixed orientation of $\mathbb R^4$ to define the rotation
\[
V_T=T+\operatorname{cof}(T)\in SO(4),
\]
where $\operatorname{cof}(T)$ is the matrix of signed minors in the same row and column positions as the entries of $T$. Then
\[
\|V_T+V_{T'}\|_F\ge1/\sqrt3\qquad(T,T'\in\mathcal M).
\tag{8.8g.90.1}
\]

Suppose also that $\mathcal M$ covers every pair of spatial directions up to sign, as in (8.8g.80.3). For every unit input $b$, there is a unit output $a$ and there are two members $T,T'$ with $Tb=a$ and $T'b=-a$. Their transverse restrictions $B,B':b^\perp\to a^\perp$ are rank-two partial isometries and satisfy $\langle B,B'\rangle_F\ge0$. These opposite-image witnesses exist without choosing omitted lines continuously.

Identify $\mathbb R^4$ with the quaternions and let $\mathcal I$ be the group of left unit quaternion multiplications, or the group of right unit quaternion multiplications. For every fixed left or right coset $\mathcal L$ of $\mathcal I$ in $SO(4)$, one has
\[
\max_{T\in\mathcal M}\operatorname{dist}_F(V_T,\mathcal L)
\ge \frac1{6\sqrt3}.
\tag{8.8g.90.2}
\]
In particular no such acute covering family has all its oriented completions in one such coset. Under the four Hausdorff-null hypotheses of Theorem 8.8g.80, these conclusions apply to the actual central rank-four family of an all-pure Lorentz-five completion. This includes the semialgebraic entangled pure dimension-at-most-four case.

*Proof.* Write $T=O\,\operatorname{diag}(1,1,1,0)\,P^{\mathsf T}$ for orthogonal matrices $O,P$. The cofactor transforms as
$\operatorname{cof}(T)=\det(O)\det(P)\,O E_{44}P^{\mathsf T}$.
This follows from the inverse-transpose formula on invertible matrices and continuity of signed minors, and can also be checked on the displayed singular value decomposition. Thus $V_T\in SO(4)$ and $T=V_T P_v$, where $P_v=I-vv^{\mathsf T}$ and $v$ is any unit vector on the omitted input line. The choice of sign of $v$ does not enter the projection. The cofactor formula also shows that $V_T$ is continuous on $\mathcal M$.

For $T'=V_{T'}P_w$, acute normalized states give $\langle T,T'\rangle_F\ge-1$. Compare this pairing to the one obtained with completed rotation $-V_T$ and the same omitted projection $P_w$. One has
\[
\begin{aligned}
\langle T,T'\rangle_F
&=-\operatorname{Tr}(P_v P_w)+\langle T,(V_T+V_{T'})P_w\rangle_F\\
&\le-2-(v\cdot w)^2+\sqrt3\,\|V_T+V_{T'}\|_F.
\end{aligned}
\]
Here $\|T\|_F=\sqrt3$, the projection $P_w$ cannot increase Frobenius norm, and $\operatorname{Tr}(P_vP_w)=2+(v\cdot w)^2$. Comparing with the lower bound $-1$ proves (8.8g.90.1).

Fix a unit $b$ and consider the compact set $A_b=\{Tb:T\in\mathcal M,\ \|Tb\|=1\}$ on $S^3$. Coverage says $A_b\cup(-A_b)=S^3$. Both sets are nonempty and closed, and connectedness of $S^3$ implies that they intersect. The intersection gives the two required matrices $T,T'$. Since each has operator norm one, $T^{\mathsf T}a=b$ and $(T')^{\mathsf T}a=-b$. In the input and output axial decompositions the two matrices have blocks $(1,B)$ and $(-1,B')$ with no cross terms. Their rank-three partial-isometry condition gives rank two on the transverse space. The acute bound $\langle T,T'\rangle_F=-1+\langle B,B'\rangle_F\ge-1$ proves the transverse assertion.

Now fix a coset $\mathcal L$ and put $\eta=\max_{T\in\mathcal M}\operatorname{dist}_F(V_T,\mathcal L)$. Form the compact set $\mathcal L_0$ of all closest coset rotations to any $V_T$ in this family. Compactness follows by projecting the closed minimizing relation in $\mathcal M\times\mathcal L$. For any fixed unit $b$, the map $W\mapsto Wb$ from $\mathcal L$ to $S^3$ is bijective, and for any $W,W'\in\mathcal L$ satisfies
\[
\|W+W'\|_F=2\|Wb+W'b\|.
\]
For left multiplications this follows from $|ab|=|a||b|$ and the real dimension four of the quaternion space. Right multiplications have the same identity. A fixed factor on either side is an isometry and preserves the identity and bijectivity.

Let $A=\{Wb:W\in\mathcal L_0\}$. For every output direction the coverage condition supplies $T$ with $Tb$ equal to that output up to sign. On this input $V_Tb=Tb$, since $\|Tb\|=1$ puts $b$ in the retained hyperplane. A closest $W\in\mathcal L_0$ then satisfies $\|Wb-Tb\|\le\|W-V_T\|_F\le\eta$. Hence the closed $\eta$-neighborhoods of $A$ and $-A$ in $S^3$ cover $S^3$. They intersect by connectedness. Therefore there are $W,W'\in\mathcal L_0$ with $\|Wb+W'b\|\le2\eta$. Take associated $T,T'$ whose completed rotations are within $\eta$ of $W,W'$. The coset identity gives
\[
\|V_T+V_{T'}\|_F
\le2\eta+\|W+W'\|_F
\le6\eta .
\]
Equation (8.8g.90.1) proves (8.8g.90.2). The final application uses exactly the compact central rank-four family and unsigned coverage of Theorem 8.8g.80, with acuteness from self-duality. $\square$

<a id="theorem-88g91"></a>

<a id="theorem-88g91-directional-marginal-width-of-entangled-pure-states"></a>**Theorem 8.8g.91 (Directional Marginal Width of Entangled Pure States).** Use the fixed Lorentz-five carrier and any all-pure self-dual intermediate \(K_{\min}\subseteq C=C^*\subseteq K_{\max}\) of Theorem 8.8g.23. Write \(E\) for the actual entangled normalized pure set and \(a_q,b_q\) for the two spatial marginals in \(2q=\left(\begin{smallmatrix}1&b_q^{\mathsf T}\\a_q&T_q\end{smallmatrix}\right)\). For every pair of unit spatial axes \(a,b\), some \(q\in E\) satisfies
\[
              \max\{|a^{\mathsf T}a_q|,\ |b^{\mathsf T}b_q|\} >\frac1{4096}.
\tag{8.8g.91.1}
\]
Consequently at least one of the two marginal families \(\{a_q:q\in E\}\) and \(\{b_q:q\in E\}\) spans its full four-dimensional spatial carrier. In particular both families cannot be confined to proper fixed subspaces, even if their marginal norms are large and their pure locus has no regularity.

*Proof.* Fix \(a,b\) and suppose that both absolute components are at most \(\eta=1/4096\) for every \(q\in E\). In the corresponding product frame let \(p=p_a p_b^{\mathsf T}\) and \(p'=p_{-a}p_b^{\mathsf T}\). Either of these two products is separated from the entangled locus by Frobenius distance at least \((1-\eta)/\sqrt2\). In fact the two marginal strips of \(2q\) differ from those of the product by at least \(1-\eta\) in their respective axial components. The contributions of the two strips to the squared distance of the normalized matrices add. Theorem 8.8g.62 therefore puts a Frobenius transverse ball of radius \(1/8\) about \(U-p\) in \(C\cap p^\perp\) and the corresponding ball about \(U-p'\) in \(C\cap(p')^\perp\). Its stated radius is at least \(1/8\), since \(1/\sqrt6>1/8\) and \((1-\eta)^2/4>1/8\). These balls use the same transverse \(3\)-by-\(3\) coordinates.

Choose a unit transverse matrix \(Z\). Pure generation in the face of \(p'\) decomposes \(U-p'+Z/8\) into actual normalized pure points with nonnegative weights summing to three. Every pure point in this decomposition annihilates \(p'\), by nonnegative pairing with \(p'\). A product annihilating \(p'\) has transverse block zero, since one of its local factors is the opposite light ray. The block \(Z/8\) then forces an actual entangled summand \(z\) with \(\|B_z\|_F\ge1/24\). Decompose \(U-p-B_z/(8\|B_z\|_F)\) in the face of \(p\) in the same way. Its pairing with the transverse matrix \(B_z\) is \(-\|B_z\|_F/8\). The weights again sum to three, and every product summand has zero transverse block. Some actual entangled summand \(q\) therefore satisfies
\[
                \langle B_q,B_z\rangle_F
                          \le-\|B_z\|_F/24\le-1/576 .
\tag{8.8g.91.2}
\]

Use the common light coordinates of Lemma 8.8g.25, with the output light directions exchanged for \(z\) when applying that lemma. In the common order the matrices are
\[
 q=\begin{pmatrix}0&\lambda&0\\ \mu&\nu&v^{\mathsf T}\\0&w&B_q\end{pmatrix},
 \qquad
 z=\begin{pmatrix}\mu'&\nu'&(v')^{\mathsf T}\\0&\lambda'&0\\0&w'&B_z\end{pmatrix}.
\tag{8.8g.91.3}
\]
The light-coordinate marginal formulas give \(0\le\nu,\nu'\le\eta\), since each of their two signed axial marginal components has magnitude at most \(\eta\). Lorentz positivity tested on the minus input light ray gives \(\|w\|^2\le2\lambda\nu\) and \(\|w'\|^2\le2\lambda'\nu'\). Each axial entry lies in \([0,1]\) by the normalized light form. In the Frobenius pairing the only axial contributions are \(\lambda\nu'+\nu\lambda'\le2\eta\). The only shared strip contributes \(\langle w,w'\rangle\le2\eta\). Equation (8.8g.91.2) thus gives
\[
                    \langle q,z\rangle_F
                             \le 4\eta-1/576<0 .
\]
This violates acuteness of \(C\). Hence (8.8g.91.1) holds. If both marginal spans were proper, choosing \(a,b\) in their respective orthogonal complements would contradict it. \(\square\)

<a id="theorem-88g92"></a>

<a id="theorem-88g92-strict-product-positivity-forces-full-joint-marginal-width"></a>**Theorem 8.8g.92 (Strict Product Positivity Forces Full Joint Marginal Width).** Use the fixed Lorentz-five carrier and any all-pure self-dual intermediate \(K_{\min}\subseteq C=C^*\subseteq K_{\max}\) of Theorem 8.8g.23. For an actual entangled normalized pure state \(q\), write
\[
 q=\tfrac12\begin{pmatrix}1&b_q^{\mathsf T}\\a_q&T_q\end{pmatrix}.
\]
Let \(E\) be the actual entangled normalized pure set, and \(M_{\rm marg}=\overline{\operatorname{conv}}\{(a_q,b_q):q\in E\}\) in the Euclidean space \(\mathbb R^4\oplus\mathbb R^4\).

If some \(q_0\in E\) has strictly positive product margin \(m=\min_{p\in\mathcal P}\langle q_0,p\rangle_F>0\), then
\[
                         M_{\rm marg}\supseteq
                \{w:\|w\|_2\le m/(2\sqrt2)\}.
\tag{8.8g.92.1}
\]
In particular a joint marginal body with empty interior at the origin forces every actual entangled pure state to annihilate a product. More precisely, if \(Y\ne0\) has only marginal strips and \(\langle Y,r\rangle_F\ge0\) for every \(r\in E\), then for every \(q\in E\) there is a product \(p\) with
\[
                 \langle q,p\rangle_F=0,\qquad
                 \langle Y,p\rangle_F\le0 .
\tag{8.8g.92.2}
\]
The conclusions use no regularity of the entangled locus.

*Proof of the ball bound.* Let \(Y\) be any marginal-only matrix of Frobenius norm one, written \(Y=\left(\begin{smallmatrix}0&v^{\mathsf T}\\u&0\end{smallmatrix}\right)\). Then \(\|u\|^2+\|v\|^2=1\), \(Y\perp U\), and
\[
 P_Y:=\max_{p\in\mathcal P}|\langle Y,p\rangle_F|
             =(\|u\|+\|v\|)/2\in[1/2,1/\sqrt2].
\]
The product average is \(U/4\), so \(0<m\le1/4\). Put \(t=m/P_Y\le1/2\) and \(\epsilon=\max\{0,\sup_{r\in E}(-\langle Y,r\rangle_F)\}\). Suppose \(\epsilon<t/8\), set \(\beta=t\epsilon\), and form
\[
                    X=(1-4\beta)q_0+tY+\beta U.
\]
Its normalization is one because \(e(U)=4\) and \(e(Y)=0\), and \(1-4\beta>0\). Pairing with a pure product gives at least
\((1-4\beta)m-tP_Y+\beta=\beta(1-4m)\ge0\).
Pairing with any actual entangled pure generator gives at least \(-t\epsilon+\beta=0\) by acuteness with \(q_0\). Pure generation and self-duality imply \(X\in C\).

Write \(y_0=\langle Y,q_0\rangle_F\ge-\epsilon\). Using \(\|q_0\|_F^2=1\), \(\langle q_0,U\rangle_F=1\), \(\|U\|_F^2=4\), and \(Y\perp U\), one finds
\[
\begin{aligned}
 \|X\|_F^2-1
     &=2t(1-4\beta)y_0+t^2-6\beta+12\beta^2\\
     &\ge t^2-8t\epsilon+20t^2\epsilon^2>0 .
\end{aligned}
\]
This contradicts the unit bound on the normalized base of an all-pure cone. Thus \(\epsilon\ge t/8\ge m/(4\sqrt2)>0\). In marginal coordinates \(2\langle Y,r\rangle_F=u^{\mathsf T}a_r+v^{\mathsf T}b_r\). Applying the support bound to every signed unit \(Y\) puts the closed ball of radius \(m/(2\sqrt2)\) in \(M_{\rm marg}\), by separation of convex sets.

*Proof of the annihilator statement.* Suppose for some \(q\in E\) that every product annihilator \(p\) has \(\langle Y,p\rangle_F>0\). If the annihilator set is empty, the minimum product pairing of \(q\) is positive. Otherwise the annihilator set is compact, and \(\langle Y,p\rangle_F>0\) on a neighborhood of it in \(\mathcal P\). On the compact complement the product pairing of \(q\) is bounded below by a positive constant. In both cases \(q+tY\) pairs nonnegatively with all products for all sufficiently small positive \(t\). Its pairing with every \(r\in E\) is nonnegative by the premise and acuteness. Thus \(q+tY\in C\) by self-duality. Its normalization is one, yet
\(\|q+tY\|_F^2=1+2t\langle Y,q\rangle_F+t^2\|Y\|_F^2>1\).
This proves (8.8g.92.2). If zero is outside the interior of the closed convex marginal body, separation gives a nonzero marginal-only \(Y\) with the required nonnegative pairings. Alternatively (8.8g.92.1) already excludes strictly product-positive states in that case. \(\square\)

<a id="corollary-88g92a"></a>

<a id="corollary-88g92a-a-joint-marginal-relation-forces-central-unit-direction-coverage"></a>**Corollary 8.8g.92a (A Joint Marginal Relation Forces Central Unit-Direction Coverage).** Suppose a nonzero marginal-only matrix \(Y=\left(\begin{smallmatrix}0&v^{\mathsf T}\\u&0\end{smallmatrix}\right)\) satisfies \(\langle Y,q\rangle_F=0\) for every actual entangled normalized pure \(q\) of the same candidate. Then for every \(a,b\in S^3\) there is an actual central entangled pure \(q\) with \(T_qb=a\) or \(T_qb=-a\). On every frame where \(u^{\mathsf T}a+v^{\mathsf T}b\) and \(u^{\mathsf T}a-v^{\mathsf T}b\) are both nonzero, if just one sign occurs its central entangled blocks positively span the nine-dimensional transverse space and there are at least ten members in that fiber. If every central pure with a unit spatial singular value has rank four, this coverage and fiber conclusion use only rank-four states.

*Proof.* The frames on which both quantities are nonzero form an open dense subset of \(S^3\times S^3\). Indeed a nonzero linear function on either sphere is constant on no relatively open subset. If one of \(u,v\) is zero, the other suffices for the same conclusion. At any such frame all four products have nonzero \(Y\) pairing. Each is separated from \(E\), since \(Y\) vanishes on its closure. If both opposite double-null faces were generated only by their two axial products, the separated-corner transverse-ball argument of Theorem 8.8g.79 would place a nonzero transverse block in one of them, a contradiction. That local argument uses separation of the corners, without the theorem's incidence measure hypotheses. Thus at least one face has an entangled pure generator.

Every such entangled generator has marginal pair \(d(a,b)\) or \(d(a,-b)\) for some real \(d\), by the double-null light-coordinate identity (8.8g.79.2), with a single light-axis flip if needed. The nonzero linear relation on each signed axis pair forces \(d=0\). In the double-null form the two surviving axial entries are therefore both \(1/2\), and the transverse block satisfies \(\|B\|_F^2=1/2\). Lorentz positivity gives \(\|B\|_{\rm op}\le1/2\). The zero-marginal equations define a closed subset of the compact pure locus. No product has both marginals zero, so this central subset is compact and entangled. Its signed incidence projects to a closed set of frames. It contains the open dense set just proved and hence all frames. Under the additional rank hypothesis all of these witnesses have rank four. If only one sign occurs on a frame in the open dense set, the other face is product-only and the same transverse-ball argument puts a full transverse ball in the populated face. Its entangled blocks positively span the whole transverse space. At least ten blocks are necessary, since nine or fewer cannot positively span a nine-dimensional real vector space. \(\square\)

<a id="theorem-88g93"></a>

<a id="theorem-88g93-entangled-witnesses-in-invertible-pure-orthogonal-faces"></a>**Theorem 8.8g.93 (Entangled Witnesses in Invertible Pure Orthogonal Faces).** Use the fixed Lorentz-five carrier and any all-pure self-dual intermediate \(K_{\min}\subseteq C=C^*\subseteq K_{\max}\) of Theorem 8.8g.23. For an actual normalized entangled pure state \(q\), let \(F_q=C\cap q^\perp\). If \(q\) is invertible, \(F_q\) has an actual normalized entangled pure generator.

More precisely, suppose \(q\) is invertible and annihilates a product. In the normalization of the map \(q\) itself, let \(H_R=q^{\mathsf T}Jq-\ell J\) and \(H_L=qJq^{\mathsf T}-\ell J\) be its unique positive semidefinite Lorentz defects, where \(J=\operatorname{diag}(1,-I_4)\) and \(\ell\) is the common multiplier. Let \(P_R,P_L\) be the Euclidean orthogonal projections onto their ranges, and put \(s=\sigma_{\min}(2q)>0\). There are actual normalized entangled pure states \(r_R,r_L\in F_q\) satisfying
\[
 \|r_R P_R\|_F\ge\frac{s^2\sqrt{\operatorname{rank} H_R}}{6(s+2)},
 \qquad
 \|P_L r_L\|_F\ge\frac{s^2\sqrt{\operatorname{rank} H_L}}{6(s+2)}.
 \tag{8.8g.93.1}
\]
The two witnesses may be different. Consequently an entangled pure state with a product-generated orthogonal face must have rank four. In that case the products in the face lie in the two embedded four-dimensional Lorentz carriers of \(q\) in Corollary 8.8g.61a.

*Proof.* Since \(q\) is normalized and unit, \(U-q\) pairs nonnegatively with the whole normalized base, whose norm is at most one. Self-duality gives \(U-q\in F_q\), and \(e(U-q)=3\). Decompose it into a positive combination of actual normalized pure generators of the face. Such a finite decomposition exists by compactness and finite-dimensional pure generation. Its weights sum to three. If \(q\) pairs strictly positively with all products, none of these generators is a product. This proves the assertion in that case.

If \(q\) annihilates a product, the right and left defects are nonzero by Lemma 8.8g.41 and have the same rank by Theorem 8.8g.63. For a product \(p=p_a p_b^{\mathsf T}\) in \(F_q\), the Lorentz-positive vector \(q p_b\) is null, because its pairing with \(p_a\) is zero. As \(p_b\) is also null, \(p_b^{\mathsf T}H_Rp_b=0\). Positive semidefiniteness gives \(H_Rp_b=0\), and hence \(pP_R=0\). The transposed argument gives \(P_Lp=0\).

Put \(N=2q\) and \(M=4E_{00}-N\), so \(U-q=M/2\). In the normalization of \(N\), let \(\lambda\) denote the largest eigenvalue of \(JN^{\mathsf T}JN\). The proof of Theorem 8.8g.63 gives \(0<\lambda\le1\), and (8.8g.63.1) gives \(h=(N^{-1})_{00}\ge3/(4\lambda)\ge3/4\). The rank-one determinant identity shows that \(M\) is invertible because \(1-4h\ne0\). Its inverse by the rank-one inverse formula satisfies
\[
 \|M^{-1}\|_{\rm op}\le\|N^{-1}\|_{\rm op}
             +\frac{4\|N^{-1}e_0\|\,\|N^{-\mathsf T}e_0\|}{4h-1}
          \le\frac1s+\frac2{s^2}.
 \tag{8.8g.93.2}
\]
It follows that \(\sigma_{\min}(U-q)\ge s^2/[2(s+2)]\). Applying the right projection to the pure decomposition kills its product summands. The triangle inequality and the total weight three show that some entangled summand \(r_R\) satisfies
\[
 \|r_RP_R\|_F\ge\tfrac13\|(U-q)P_R\|_F
               \ge\tfrac13\sigma_{\min}(U-q)\sqrt{\operatorname{rank}H_R}.
\]
Apply the same estimate on the left to obtain (8.8g.93.1).

The only remaining rank of an entangled pure with a product-generated orthogonal face is four, by Corollary 8.8g.61a. For rank four the right Lorentz defect has kernel precisely the retained time-plus-spatial subspace, since \(q\) acts as a scaled Lorentz isometry there and vanishes on the omitted spatial line. The left defect has the analogous kernel. The preceding null-product argument puts the two product factors in those respective kernels. This proves the final statement. \(\square\)

<a id="theorem-88g94"></a>

<a id="theorem-88g94-product-generated-orthogonal-faces-at-rank-four"></a>**Theorem 8.8g.94 (Product-Generated Orthogonal Faces at Rank Four).** Use the fixed Lorentz-five carrier and any all-pure self-dual intermediate \(K_{\min}\subseteq C=C^*\subseteq K_{\max}\) of Theorem 8.8g.23. Let \(q\) be an actual entangled normalized pure state whose orthogonal face \(F_q=C\cap q^\perp\) is generated by products. Then \(q\) has rank four and the face has the following exact description.

In the two embedded time-plus-spatial carriers of \(q\), choose the Pauli Hilbert–Schmidt identification with the two-qubit carrier, composing with partial transpose if necessary. In these coordinates \(q=P_\psi=|\psi\rangle\langle\psi|\), where \(\psi=c|00\rangle+s|11\rangle\) with \(c,s>0\) and \(c^2+s^2=1\). Let \(R=I-P_\psi\). Then
\[
 F_q=\{X\in{\rm SEP}_{2,2}:X=RXR\},\qquad
 \operatorname{span}F_q=\{X=X^*:X=RXR\},\qquad
 U-q\in\operatorname{relint}F_q.
 \tag{8.8g.94.1}
\]
The span has real dimension nine. The orthogonal projection \(\Pi\) onto this span in the full Lorentz-five carrier fails positivity on a normalized product state \(p\). Quantitatively one can take \(p\) from \(|00\rangle\) and \(|11\rangle\) in the above identification, with
\[
              \operatorname{dist}_F(\Pi p,F_q)
                     \ge cs\max\{c^2,s^2\}\ge cs/2.
 \tag{8.8g.94.2}
\]
In particular this face is not intrinsically self-dual. Combined with Theorem 8.8g.93, if the orthogonal projection onto the span of an entangled pure state's orthogonal face is positive on \(C\), that face has an actual entangled pure generator.

*The face and its span.* Theorem 8.8g.93 puts \(q\) in rank four and puts each product annihilator in the two retained local carriers. Corollary 8.8g.61a identifies \(q\) there as a two-qubit rank-one projector or its partial transpose. The real orthonormal local basis \(I_2/\sqrt2,\sigma_1/\sqrt2,\sigma_2/\sqrt2,\sigma_3/\sqrt2\) maps a normalized local pure vector \((1,a)/\sqrt2\) to the rank-one projector \((I_2+a\cdot\sigma)/2\). Its product identification is a Hilbert–Schmidt isometry, takes \(U=2E_{00}\) to \(I_4\), and keeps the normalization \(e=\operatorname{Tr}\). Partial transpose is an orthogonal involution fixing \(I_4\) and mapping product projectors to product projectors. Its use here is a change of coordinates on the retained carrier. It needs no positivity assumption on the full cone. The same is true of the two local unitary changes used for Schmidt form.

In these coordinates the normalized product annihilators of \(q\) are exactly the product projectors supported on \(\psi^\perp\). Each belongs to \(F_q\) by the minimum-cone inclusion. Every separable positive matrix supported there is a sum of positive product projectors supported there: the expectation on \(\psi\) is a sum of nonnegative expectations and is zero. The product-generation premise now gives the first equality of (8.8g.94.1).

For the span, use the following unnormalized \(\psi\)-orthogonal product vectors indexed by \(z\in\mathbb C\):
\[
 (|0\rangle+z|1\rangle)\otimes(-s z|0\rangle+c|1\rangle)
       =c|01\rangle+z(-s|00\rangle+c|11\rangle)-s z^2|10\rangle .
\]
The three coefficient vectors of \(1,z,z^2\) are independent and belong to \(\psi^\perp\). If a Hermitian operator on \(\psi^\perp\) pairs to zero with all these product projectors, its quadratic value on the displayed vector is a polynomial in \(z,\bar z\) that vanishes for all \(z\). The nine monomials \(z^i\bar z^j\), \(0\le i,j\le2\), are independent, as follows from the invertible linear change from \((\operatorname{Re}z,\operatorname{Im}z)\) to \((z,\bar z)\). Thus all matrix coefficients in the three-vector basis vanish. This proves the span formula.

The two-qubit positive-partial-transpose criterion (Horodecki et al. 1996) identifies the separable cone with the simultaneous positivity constraints \(X\succeq0\), \(X^\Gamma\succeq0\), where \(\Gamma\) is partial transpose. The matrix \(R=I-P_\psi\) is strictly positive on \(\psi^\perp\). Its partial transpose is strictly positive on the full two-qubit space: the eigenvalues of \(P_\psi^\Gamma\) are \(c^2,s^2,cs,-cs\), all strictly below one. These two strict inequalities survive sufficiently small perturbations in the span \(X=RXR\), proving the relative interior assertion.

*Projection obstruction.* The Frobenius orthogonal projection on Hermitian operators supported on \(\psi^\perp\) is \(X\mapsto RXR\) on the embedded carrier. Thus the projection of the embedded product projector \(|00\rangle\langle00|\) is \(|\chi\rangle\langle\chi|\), where
\[
                      \chi=R|00\rangle=s^2|00\rangle-cs|11\rangle .
\]
Its partial transpose has a negative eigenvalue \(-cs^3\). The analogous projection of \(|11\rangle\langle11|\) has a partial-transpose eigenvalue \(-sc^3\). For any \(Y\in F_q\), \(Y^\Gamma\) is positive semidefinite in these coordinates. Let \(\eta\) be a normalized eigenvector for the chosen negative eigenvalue of \((\Pi p)^\Gamma\). Pairing \((\Pi p-Y)^\Gamma\) with its unit Frobenius projector shows
\(\|(\Pi p-Y)^\Gamma\|_F\ge cs\max\{c^2,s^2\}\).
Partial transpose preserves the Frobenius norm, so taking the infimum over \(Y\) gives (8.8g.94.2). All identifications preserve the orthogonal projection and distance because they are isometries on the retained carrier. The projected vector lies in \(q^\perp\) and cannot lie in \(C\) because it is outside \(F_q\).

If an exposed face of an acute cone were self-dual in its span, the orthogonal projection of every cone element would lie in the face. In fact the projection has the original nonnegative pairing with every face element. Thus the witness also excludes intrinsic self-duality of the stated face. The final implication follows by contraposition and Theorem 8.8g.93. \(\square\)

<a id="theorem-88g95"></a>

<a id="theorem-88g95-one-sided-carrier-tilt-obstruction"></a>**Theorem 8.8g.95 (One-Sided Carrier Tilt Obstruction).** Use the Lorentz-five carrier of Theorem 8.8g.23. For a spatial three-plane \(E\subset\mathbb R^4\) write \(V_E=\mathbb Re_0\oplus E\), and use the Frobenius orthogonal compression onto \(V_E\otimes V_F\) for two such planes \(E,F\). Let \(q\) be any rank-four entangled member of the normalized unit-positive locus. By Corollary 8.8g.61a it is supported on \(V_E\otimes V_F\) for its retained planes \(E,F\). In the Pauli Hilbert–Schmidt coordinates of that carrier it is an entangled two-qubit rank-one projector or its partial transpose. Let \(\alpha,\beta>0\), \(\alpha^2+\beta^2=1\), be the Schmidt coefficients of the corresponding vector.

For any \(E'\ne E\) keep \(F\) fixed and put
\[
       \kappa=|\langle n,n'\rangle|<1 ,
\]
where \(n,n'\) are unit spatial normals of \(E,E'\). The compression of \(q\) onto \(V_{E'}\otimes V_F\) is in neither the two-qubit positive-semidefinite cone nor its partial transpose. More precisely, for each of those two orientations there is a normalized rank-four entangled test state \(r\) in that orientation of the target carrier with
\[
             \langle q,r\rangle_F
                 \le -\frac{1-\kappa}{2}\min(\alpha^2,\beta^2).
 \tag{8.8g.95.1}
\]
The same assertion holds after exchanging the two tensor factors.

Consequently an acute intermediate cone containing \(q\) cannot contain the full two-qubit positive-semidefinite cone or its partial transpose on a different embedded carrier sharing exactly the other local three-plane. In particular two complete embedded two-qubit sectors of either orientation cannot coexist in an acute intermediate if they share one local three-plane and differ on the other.

*Proof.* The linear map \(P_{E'}|_E\) between the spatial three-planes has singular values \(1,1,\kappa\). The two fixed directions are their two-dimensional intersection. In the orthogonal complement of that intersection in \(\mathbb R^4\), the remaining domain and range lines have absolute pairing \(\kappa\), since their perpendicular normal lines do. On time-plus-spatial coordinates the time axis is fixed. In Pauli coordinates this is a unital trace-preserving real-linear qubit map whose spatial part is \(U\operatorname{diag}(1,1,\kappa)V\) with \(U,V\in O(3)\). A proper rotation is implemented by unitary conjugation, and every improper rotation is a proper rotation followed by transposition in a Pauli basis. The input unitary changes the Schmidt vector without changing its Schmidt coefficients. Input transposition can be absorbed into the two possible partial-transpose orientations of \(q\). Output transposition exchanges the two target positivity tests. Output unitaries preserve their spectra. Thus it suffices to work with the diagonal Bloch map \(\Lambda_\kappa\) sending \(I_2,\sigma_1,\sigma_2,\sigma_3\) to \(I_2,\sigma_1,\sigma_2,\kappa\sigma_3\), and to test both partial-transpose orientations of the result for a projector input.

Let \(\Omega=(|00\rangle+|11\rangle)/\sqrt2\). Write the normalized input vector as \(\psi=(I_2\otimes G)\Omega\), where \(G\) is an invertible two-by-two matrix with singular values \(\sqrt2\alpha,\sqrt2\beta\). The compressed projector is
\[
(\Lambda_\kappa\otimes{\rm id})(P_\psi)
 = (I_2\otimes G) H_\kappa (I_2\otimes G)^*,
\qquad
 H_\kappa=\tfrac14(I_4+\sigma_1\otimes\sigma_1
                     -\sigma_2\otimes\sigma_2
                     +\kappa\,\sigma_3\otimes\sigma_3).
 \tag{8.8g.95.2}
\]
Use partial transpose \(\Gamma\) on the first factor. It commutes with the congruence on the second factor in (8.8g.95.2), and with the diagonal map on the first factor. The Bell basis diagonalizes \(H_\kappa\). The vector \((|00\rangle-|11\rangle)/\sqrt2\) has eigenvalue \(-(1-\kappa)/4\). For \(H_\kappa^\Gamma\), the vector \((|01\rangle-|10\rangle)/\sqrt2\) has eigenvalue \(-(1+\kappa)/4\). Both eigenvectors are entangled.

If \(w\) is either one of these unit eigenvectors with eigenvalue \(-\delta\), the normalized vector proportional to \((I_2\otimes G^{-*})w\) tests the corresponding congruence with expectation
\[
-\delta\big/\|(I_2\otimes G^{-*})w\|^2
              \le -2\delta\min(\alpha^2,\beta^2).
\]
It remains entangled because the local filter is invertible. The resulting rank-one projector, or its partial transpose for the second test, gives \(r\) on the retained target carrier. Under the product Pauli Hilbert–Schmidt identification it is normalized by \(e\), has unit Frobenius norm, and is Lorentz-positive by Proposition 8.8g.47. Corollary 8.8g.61a gives rank four for its Lorentz-five matrix. Pairing with the projection of \(q\) gives the original pairing because \(r\) lies in the target carrier. Taking the weaker of the two negative bounds yields (8.8g.95.1), also when the reductions exchange the orientations. Acuteness forbids adjoining either such negative witness to a cone already containing \(q\). A complete embedded sector on \(V_E\otimes V_F\) contains such rank-four entangled states, so two sectors in the stated overlap configuration are impossible. \(\square\)

<a id="theorem-88g96"></a>

<a id="theorem-88g96-two-sided-carrier-compatibility-for-embedded-qubit-sectors"></a>**Theorem 8.8g.96 (Two-Sided Carrier Compatibility for Embedded Qubit Sectors).** Use the Lorentz-five carrier and Frobenius pairing of Theorem 8.8g.23. An embedded two-qubit sector means either of the two cones \({\rm PSD}_4\) and \({\rm PSD}_4^\Gamma\) in the Pauli Hilbert–Schmidt identification on \(V_E\otimes V_F\), where \(E,F\) are spatial three-planes and \(V_E=\mathbb Re_0\oplus E\). The sector is complete when all states of that cone are included.

For two carrier pairs \((E,F)\), \((E',F')\), let
\[
 c=|\langle n_E,n_{E'}\rangle|,\qquad
 d=|\langle n_F,n_{F'}\rangle|,
 \tag{8.8g.96.1}
\]
using unit spatial normals. If the carrier pairs differ, then for either choice of orientation on each carrier there are normalized rank-four entangled states \(q,r\) in the respective sectors with
\[
                         \langle q,r\rangle_F\le -(1-cd)/4<0 .
 \tag{8.8g.96.2}
\]
For the same carrier pair, equal orientations are mutually acute, whereas opposite orientations have a normalized rank-four entangled pair with pairing \(-1/2\). Thus an acute intermediate can contain at most one complete embedded two-qubit sector, even when both local three-planes vary.

There is also an exact individual test. Let \(q\) on the first carrier have zero marginals and be a rank-four normalized entangled pure state. Choose input Pauli coordinates in which it is a maximally entangled projector, so its spatial block in \(2q\) is an orthogonal \(3\times3\) matrix \(R\) with \(\det R=-1\). Let \(u,v\) be the source spatial axes attenuated by the left and right compressions, respectively, and set \(\tau=|u^{\mathsf T}Rv|\). If a compression is the identity on the spatial plane, the associated axis may be chosen arbitrarily. The compressed spatial block has singular values \(1,s,t\), with \(s\ge t\ge0\) and
\[
  st=cd,\qquad
  (s-t)^2=(c-d)^2+(1-c^2)(1-d^2)\tau^2 .
 \tag{8.8g.96.3}
\]
For \(cd>0\) the orientation with negative determinant of the compressed block has minimum eigenvalue \(-(s-t)/4\). The other orientation has minimum eigenvalue \(-(s+t)/4\). Thus compatibility with a full target sector requires the negative-determinant orientation and the equality conditions in (8.8g.96.3). If \(c=d<1\) are positive, these are exactly \(\tau=0\). If \(cd=0\), both orientations have minimum eigenvalue \(-s/4\), and compatibility requires \(c=d=0\) and \(\tau=0\).

*Singular-value computation.* As in Theorem 8.8g.95 each local spatial compression has two unit singular values and one attenuated value. Up to output orthogonal basis changes, the new spatial block is \(A R B\), where
\[
           A=I_3-(1-c)uu^{\mathsf T},\qquad
           B=I_3-(1-d)vv^{\mathsf T}.
\]
A unit vector orthogonal to \(v\) and \(R^{\mathsf T}u\) exists. The product \(ARB\) preserves its norm, and \(ARB\) is a contraction, so a largest singular value is one. The absolute determinant gives \(st=cd\), including at zero. Computing the trace of \(B R^{\mathsf T} A^2 R B\) gives
\[
 \|ARB\|_F^2=1+c^2+d^2+(1-c^2)(1-d^2)\tau^2.
\]
Subtract the unit singular square and \(2st\) to obtain (8.8g.96.3).

*Orientation and spectral test.* The compression keeps the time component and the zero marginals. Proper spatial rotations on the target act by local unitary conjugation in its Pauli coordinates. Partial transpose on either factor reverses the determinant sign. A real singular-value decomposition therefore brings the nonzero-determinant block to diagonal form \((1,-s,t)\) when its determinant is negative, or \((1,s,t)\) when positive. For zero determinant use \((1,s,0)\), with the other sign giving the same spectrum. The corresponding normalized operator is
\[
       \tfrac14(I_4+\sigma_1\otimes\sigma_1
                        \mp s\,\sigma_2\otimes\sigma_2
                        +t\,\sigma_3\otimes\sigma_3),
\]
where the minus sign denotes negative determinant. In the Bell basis, the four eigenvalues for negative determinant are \((2+s+t)/4,(t-s)/4,(2-s-t)/4,(s-t)/4\). For positive determinant they are \((2-s+t)/4,(s+t)/4,(2+s-t)/4,-(s+t)/4\). Here \(1\ge s\ge t\ge0\). This proves the minimum eigenvalues in the statement and the exact compatibility conditions. A negative minimum is tested by the corresponding Bell projector in the declared target orientation. If the orientation is transposed, transpose the test projector as well. Proposition 8.8g.47 and Corollary 8.8g.61a make each such test a normalized unit-positive rank-four state on the full Lorentz-five carrier. Pairing the compression with a target state is the same as pairing the original state with it. The minimum-eigenvalue criterion is equivalent to nonnegative pairing with the entire target sector by the self-duality of its positive-semidefinite cone, transported by the isometry if transposed.

*Complete-sector consequence.* In either source orientation one may choose a maximally entangled projector whose spatial orthogonal block sends \(v\) to \(u\), so \(\tau=1\). Indeed an orthogonal map of either determinant with the stated image exists, and proper local rotations of a maximally entangled projector realize every spatial orthogonal block of the corresponding orientation. Then \(s=1\) and \(t=cd\), from (8.8g.96.3) or directly by choosing the attenuation axes as matching last basis vectors. The minimum in either target orientation is at most \(-(1-cd)/4\), proving (8.8g.96.2). If the carrier pair is unchanged, orthogonal compression is the identity. Equal orientations are acute by trace positivity. Opposite orientations pair a maximally entangled projector with the partial transpose of the negative Bell eigenprojector, giving \(-1/2\). Thus acuteness forbids all distinct complete sector pairs. \(\square\)

<a id="theorem-88g97"></a>

<a id="theorem-88g97-exterior-correlation-forced-by-a-complete-embedded-sector"></a>**Theorem 8.8g.97 (Exterior Correlation Forced by a Complete Embedded Sector).** Use the fixed Lorentz-five carrier and any all-pure self-dual intermediate \(K_{\min}\subseteq C=C^*\subseteq K_{\max}\) of Theorem 8.8g.23. Suppose \(C\) contains a complete two-qubit sector of either orientation on \(V_E\otimes V_F\), in the notation of Theorem 8.8g.96. Let \(n,m\) be unit spatial normals to \(E,F\), respectively. For any normalized pure \(r\) write
\[
       r=\tfrac12\begin{pmatrix}1&b_r^{\mathsf T}\\a_r&T_r\end{pmatrix},
       \qquad D(r)=n^{\mathsf T}T_r m.
\]
There are actual entangled normalized pure states \(r_+,r_-\) such that
\[
       D(r_+)\ge d_* ,\qquad D(r_-)\le-d_*,
       \qquad d_*=(2\sqrt3-3)/3.
\tag{8.8g.97.1}
\]
For any rank-four normalized entangled pure \(r\) of \(C\), put \(a=\|a_r\|=\|b_r\|\), which is the common marginal norm of Corollary 8.8g.61a. Then
\[
                          |D(r)|\le 3(1-\sqrt{1-a^2}).
\tag{8.8g.97.2}
\]
In particular central rank-four pure states have \(D=0\). Each witness in (8.8g.97.1) either has rank five or is rank four with \(a\ge\sqrt{1-(1-d_*/3)^2}\). Thus a complete sector cannot occur in an all-pure self-dual completion whose entangled pure states are all rank four with marginal norm below that threshold.

*Proof of the opposite exterior responses.* Choose a normalized maximally entangled state \(q_0\) of the included sector, using the sector's own orientation. Its marginals vanish and its retained spatial block is orthogonal on the three-plane pair. Add the missing spatial correlation with either sign to form \(X_\pm=q_0\pm\tfrac12 nm^{\mathsf T}\), where the added term is inserted in the spatial block of the normalized matrix. The spatial block of \(2X_\pm\) is orthogonal on the full four-dimensional spatial carrier. Hence \(X_\pm\in K_{\max}\), because its zero-marginal Lorentz map is spatially contractive. Its normalizer is one and \(\|X_\pm\|_F^2=5/4\). Proposition 8.8g.48, item 1, therefore supplies actual normalized pure witnesses \(s_\pm\) with
\[
       \langle X_\pm,s_\pm\rangle_F
                      \le -(2\sqrt3-3)/12.
\]
The witnesses are entangled because \(X_\pm\) are product-positive. Since \(q_0\in C\), acuteness gives \(\langle q_0,s_\pm\rangle_F\ge0\). The exterior part pairs with \(s_\pm\) to \(\pm D(s_\pm)/4\), since \(T_{s_\pm}\) is the spatial block of \(2s_\pm\). Taking \(r_+=s_-\) and \(r_-=s_+\) proves (8.8g.97.1).

*Proof of the rank-four bound.* In its own retained carriers a rank-four \(r\) is an entangled two-qubit pure state or its partial transpose, by Corollary 8.8g.61a. In Schmidt axes its spatial block is diagonal with absolute values \(1,\sqrt{1-a^2},\sqrt{1-a^2}\). Replace the latter two values by one with the same signs and set the marginals to zero. The result \(r_0\) is a central normalized maximally entangled state in the same retained carriers and orientation. Let \(k=1-\sqrt{1-a^2}\). The spatial difference \(T_r-T_{r_0}\) has operator norm \(k\) and nuclear norm \(2k\), also as a zero extension to the full carrier. In particular \(|D(r)-D(r_0)|\le k\).

Use Theorem 8.8g.96 to compress \(r_0\) to the complete sector, writing \(c,d\) for the absolute overlaps of the two normal pairs. When a retained plane tilts, the projection of the target normal onto the source plane has length \(\sqrt{1-c^2}\) on the left or \(\sqrt{1-d^2}\) on the right. Its direction is the respective attenuated source axis in that theorem. This follows by resolving the normal in the two-plane perpendicular to the shared intersection. For an unchanged plane this projection is zero. Thus for the parameter \(\tau\) of that theorem,
\[
            |D(r_0)|=\sqrt{(1-c^2)(1-d^2)}\,\tau\le s-t
\]
by (8.8g.96.3), where \(1,s,t\) are the singular values of the compressed block. In the declared complete sector orientation its smallest eigenvalue is at most \(-(s-t)/4\), including the case of zero determinant. A maximally entangled Bell test in that sector, with its actual declared orientation, therefore gives a normalized central \(p\in C\) with
\(\langle r_0,p\rangle_F\le-|D(r_0)|/4\).
Because \(p\) has zero marginals and \(\|T_p\|_{\rm op}=1\), the nuclear norm bound gives
\[
  \big|\langle r-r_0,p\rangle_F\big|
          \le\tfrac14\|T_r-T_{r_0}\|_*\|T_p\|_{\rm op}=k/2 .
\]
Acuteness of \(r,p\in C\) now gives \(|D(r_0)|\le2k\), and the operator norm bound gives \(|D(r)|\le3k\). This proves (8.8g.97.2). The marginal threshold follows by combining it with (8.8g.97.1) and solving the resulting scalar inequality. \(\square\)

<a id="theorem-88g98"></a>

<a id="theorem-88g98-exterior-correlations-in-opposite-product-faces-of-an-embedded-sector"></a>**Theorem 8.8g.98 (Exterior Correlations in Opposite Product Faces of an Embedded Sector).** Use the fixed Lorentz-five carrier and the all-pure self-dual intermediate $C$ of Theorem 8.8g.23. Suppose $C$ contains a complete embedded two-qubit sector on $V_E\otimes V_F$ of either orientation, as in Theorem 8.8g.96. Let $n,m$ be unit spatial normals to $E,F$. For a normalized state $q$ write its spatial block as $T_q/2$ and put $D(q)=n^{\mathsf T}T_qm$. Choose any unit frame axes $a\in E$ and $b\in F$. For the two sums $u,v$ of opposite pure products in this frame, let $F_u=C\cap u^\perp$ and $F_v=C\cap v^\perp$.

Every rank-four normalized pure state in either $F_u$ or $F_v$ has $D(q)=0$. More precisely, for any entangled normalized pure state of either face put $B$ for its transverse block in the common orthonormal light coordinates and let $\lambda,\mu>0$ be its two surviving axial entries. Then $A=B/\sqrt{\lambda\mu}$ is a three-by-three contraction with $\|A\|_F^2=2$. In orthonormal transverse axes with the first two directions retained in the sector, it has the form
\[
A=\begin{pmatrix}sO&h\\ k^{\mathsf T}&d\end{pmatrix},\qquad
O\in O(2),\quad 0\le s\le1,\qquad |D(q)|=2\sqrt{\lambda\mu}|d|.
\tag{8.8g.98.1}
\]
In particular any actual normalized pure state in these faces with nonzero $D$ is rank five.

For each of the two signs $\sigma=\pm1$ and every $0<t\le1$, at least one of the following inequalities holds for an actual normalized pure state $q$ of $C$:
\[
\begin{array}{ll}
-\sigma D(q)>2\langle u,q\rangle_F/t+t/8,&\text{or}\qquad
\sigma D(q)>2\langle v,q\rangle_F/t+t/8 .
\end{array}
\tag{8.8g.98.2}
\]
If both faces have only rank-four entangled pure generators, then for each sign there is a sequence of actual entangled pure states with nonzero exterior correlation of the sign in one of the two inequalities, converging to a normalized pure state in the corresponding face. Along that sequence the exterior correlation tends to zero, and its magnitude divided by the corresponding positive axial deficit diverges. A completion with a full embedded sector and no such sequences at the chosen frame must have an actual rank-five pure state in at least one of the two faces.

*Proof.* The orthogonal compression of $C$ to the sector's carrier has nonnegative pairing with the entire embedded sector, hence belongs to its positive-semidefinite cone in its declared orientation by self-duality there. Use Pauli Hilbert–Schmidt coordinates, transposing one factor if needed to make that cone the ordinary positive-semidefinite cone. Choose local qubit bases so the retained frame axes are computational axes. The four frame products are the four computational basis projectors. If the compression annihilates two opposite projectors, positivity kills the corresponding two rows and columns. It is then a positive-semidefinite two-by-two matrix on the complementary two-dimensional span. Its two diagonal values are the surviving light coefficients $\lambda,\mu$. Its off-diagonal entry $z$ contributes to the retained transverse two-by-two correlation block as the real matrix of complex multiplication by $z$ or its composition with a reflection. Explicitly, on the span of $|00\rangle,|11\rangle$, in the Hilbert–Schmidt bases $\sigma_x/\sqrt2,\sigma_y/\sqrt2$ it contributes the block $\left(\begin{smallmatrix}\operatorname{Re}z&-\operatorname{Im}z\\-\operatorname{Im}z&-\operatorname{Re}z\end{smallmatrix}\right)$, up to changing the sign convention for $\sigma_y$. For the other complementary span one can interchange $|0\rangle,|1\rangle$ on one side, which acts orthogonally. Thus both retained transverse singular values equal $|z|\le\sqrt{\lambda\mu}$.

By the double-null calculation of Theorem 8.8g.67, the full $B$ has operator norm at most $\sqrt{\lambda\mu}$. Unit norm gives $\|B\|_F^2=2\lambda\mu$. At an entangled state the two pivots are positive since a vanishing pivot forces $B=0$ and gives an axial product. This proves the norm properties of $A$ and its conformal leading block.

At rank four, $A$ has rank two by the double-null block form. Its nonzero singular values are both one by the norm properties. Let $c,d_0$ be the absolute overlaps of its left and right omitted normals with the two exterior directions. Compressing each retained two-plane of $A$ to the respective sector transverse two-plane gives one unit singular value and a second singular value $c$ or $d_0$. Write $R\in O(2)$ for the orthogonal part of $A$ on its two retained planes. Write $w,z$ for the unit axes on those planes attenuated by the two compressions, and put $\tau=|w^{\mathsf T}Rz|$. When an attenuated axis is arbitrary, its associated factor $1-c^2$ or $1-d_0^2$ vanishes. The compressed block has determinant magnitude $cd_0$. Its squared Frobenius norm follows by expanding the trace of the product of the two squared compression factors, whose matrices on the source planes are $I_2-(1-c^2)ww^{\mathsf T}$ and $I_2-(1-d_0^2)zz^{\mathsf T}$, with one conjugated by $R$. It is $c^2+d_0^2+(1-c^2)(1-d_0^2)\tau^2$. Therefore the squared singular-value difference is
\[
 (c-d_0)^2+(1-c^2)(1-d_0^2)\tau^2.
\tag{8.8g.98.3}
\]
The second term equals the square of the exterior entry of $A$, since the projections of the exterior directions onto the two planes of $A$ have respective lengths $\sqrt{1-c^2},\sqrt{1-d_0^2}$ and directions $w,z$. The compression is conformal, so the squared difference is zero and the exterior entry vanishes. This proves the asserted rank-four obstruction.

Finally let $Z=nm^{\mathsf T}$ placed in the spatial block, with all other entries zero. It is Frobenius-unit and orthogonal to $u,v,U$. The two vectors $u+\sigma tZ+t^2U/16$ and $v-\sigma tZ+t^2U/16$ have negative pairing for $0<t\le1$. Indeed $u,v$ are orthogonal, each pairs to two with $U$, and the pairing is $-t^2+4t^2/16+4t^4/256<0$ on that interval. Acuteness puts at least one vector outside $C$. Self-duality and pure generation provide an actual normalized pure state that pairs negatively with it. Since $\langle Z,q\rangle_F=D(q)/2$, the negative pairing gives (8.8g.98.2). If all pure states in both faces have zero exterior correlation, take $t\downarrow0$ and choose a subsequence of witnesses for one fixed inequality. The exterior correlations have modulus at most one by maximal positivity. The chosen deficits tend to zero and are positive because the correlations are nonzero. Compactness of the actual pure set from Theorem 8.8g.36 gives a limit in the specified face. At that limit the exterior correlation vanishes. The strict inequality gives the ratio bound and entanglement: for a normalized pure product, the transverse block norm is at most either deficit as in Theorem 8.8g.79, so $|D(q)|\le2\langle u,q\rangle_F$ and similarly for $v$. This is incompatible with (8.8g.98.2) for $t\le1$. The conclusions hold for both signs separately. $\square$

<a id="theorem-88g99"></a>

<a id="theorem-88g99-finite-rank-five-witnesses-for-an-embedded-qubit-sector"></a>**Theorem 8.8g.99 (Finite Rank-Five Witnesses for an Embedded Qubit Sector).** Use the fixed Lorentz-five carrier, the all-pure self-dual intermediate $C$, and its complete embedded two-qubit sector of Theorem 8.8g.98. For any product frame inside the sector let $u,v$ be the two opposite-product sums. Use $D(q)$ for the exterior correlation in that theorem. Every rank-four normalized pure state $q$ satisfies
\[
 |D(q)|\le 29\min\{\langle u,q\rangle_F,\langle v,q\rangle_F\}.
\tag{8.8g.99.1}
\]
For each $\sigma=\pm1$ and each $0<t\le1/16$, at least one of the two witnesses in (8.8g.98.2) exists at rank five. In particular there is an actual rank-five normalized pure state in $C$ with $|D|>1/128$. Thus an all-pure self-dual completion containing a complete embedded sector cannot have only rank-four entangled pure states. A sequence satisfying (8.8g.98.2) at $t\downarrow0$ must eventually consist of rank-five states.

*Proof.* Fix one opposite-product sum. Exchange the two light axes on one side if necessary so the deficit is the sum of the two off-diagonal axial entries $\gamma,\delta$. The axial block and its entries then have the form
\[
 M=\begin{pmatrix}\lambda&\gamma\\\delta&\mu\end{pmatrix},
 \qquad \lambda,\gamma,\delta,\mu\ge0,
 \qquad \lambda+\mu+\gamma+\delta=1.
\]
Write $q=\left(\begin{smallmatrix}M&V\\ W&B\end{smallmatrix}\right)$ in this axial-transverse order and put $x=\sqrt{\lambda\mu}$, $y=\sqrt{\gamma\delta}$. The normalized state is rank four and unit. The norms of the two rows of $V$ are bounded by $\sqrt{2\lambda\gamma}$ and $\sqrt{2\delta\mu}$. The norms of the columns of $W$ are bounded by $\sqrt{2\lambda\delta}$ and $\sqrt{2\gamma\mu}$. These are the Lorentz inequalities for the two light rays, on the map and its transpose. The four squared strip bounds sum to $2(\lambda+\mu)(\gamma+\delta)$. Subtracting them and the axial squared norm from the unit squared norm gives
\[
 \|B\|_F^2\ge2(x^2+y^2).
\tag{8.8g.99.2}
\]
Simultaneously flip the transverse signs on input and output and average that Lorentz-positive map with $q$. Its strips vanish. Test the averaged map on the null input $(r,1,z)$ with $r>0$ and $\|z\|^2=2r$. Lorentz positivity gives
\[
 \|B\|_{\mathrm{op}}^2\le \inf_{r>0}\frac{(\lambda r+\gamma)(\delta r+\mu)}r=(x+y)^2.
\tag{8.8g.99.3}
\]
The infimum equality follows by minimizing the sum of the terms linear in $r$ and $1/r$, with zero coefficients handled by taking an endpoint limit.

If $x\le2y$, (8.8g.99.3) gives $|B_{33}|\le3y$. Suppose $x>2y$. The block $M$ is invertible. Expand $WM^{-1}V$ as four outer products and apply the corresponding strip bounds above. The two diagonal terms in the inverse numerator each have norm at most $2x^2y$, and the two off-diagonal terms at most $2xy^2$ each. As $\det M=x^2-y^2$, this gives
\[
 \|WM^{-1}V\|_{\mathrm{op}}\le \frac{4x^2y+4xy^2}{x^2-y^2}
 =\frac{4xy}{x-y}\le8y.
\]
The Schur complement $B-WM^{-1}V$ has rank two since $q$ has rank four. Therefore $\sigma_3(B)\le8y$, where singular values are indexed in decreasing order. Equations (8.8g.99.2)–(8.8g.99.3) give
\[
 \sigma_2(B)^2\ge 2(x^2+y^2)-(x+y)^2-64y^2=x^2-2xy-63y^2.
\]
When $x\ge9y$, the right side is at least $(x-9y)^2$, since their difference is $16xy-144y^2\ge0$. For $x<9y$ the bound $\sigma_2(B)\ge x-9y$ is immediate. Let $B_0$ have the same singular axes as $B$ and singular values $x,x,0$. The upper bound (8.8g.99.3), the lower bound on $\sigma_2(B)$ and $\sigma_3(B)\le8y$ give $\|B-B_0\|_{\mathrm{op}}\le9y$.

In the sector's Pauli coordinates from Theorem 8.8g.98, the leading two-by-two compression of $B$ is the sum of the blocks contributed by the two opposite computational coherences. Indeed the products of the two transverse Pauli matrices flip both bits, so their Hilbert–Schmidt coefficients depend only on these two coherences. Each block is a complex multiplication or its composition with a reflection and has both singular values equal to the modulus of its coherence. The coherence joining the deficit corners has modulus at most $y$ by positivity of the sector compression on those two computational basis vectors. Thus the leading two-by-two block of $B$ is within operator norm $y$ of a conformal block. The leading block of $B_0$ is within operator norm $10y$ of that same conformal block. Its singular-value difference is at most $20y$ by the variational singular-value bounds. Equation (8.8g.98.3), scaled by $x$ for the rank-two partial isometry $B_0/x$, implies $|(B_0)_{33}|$ is at most that difference. We obtain $|B_{33}|\le29y$. This includes the case $x\le2y$ already proved. Since $|D(q)|=2|B_{33}|$ and $2y\le\gamma+\delta$, we obtain (8.8g.99.1) for the chosen sum. The other sum has the same proof after the light-axis exchange.

For $0<t\le1/16$, the ratio demanded in (8.8g.98.2) exceeds the right side of (8.8g.99.1), since $2/t\ge32>29$ and the term $t/8$ is positive. Products are also excluded by the product inequality $|D(q)|\le2\min\{\langle u,q\rangle_F,\langle v,q\rangle_F\}$ proved in Theorem 8.8g.98. By Corollary 8.8g.61a the remaining actual pure witness must be rank five. Take $t=1/16$ for the stated exterior lower bound. $\square$

<a id="theorem-88g100"></a>

<a id="theorem-88g100-rank-five-incidence-and-quantitative-conditioning-in-a-complete-embedded-sector"></a>**Theorem 8.8g.100 (Rank-Five Incidence and Quantitative Conditioning in a Complete Embedded Sector).** Use the all-pure self-dual Lorentz-five intermediate and its complete embedded sector from Theorem 8.8g.99. Write $E,F$ for its retained spatial three-planes and $G$ for the actual normalized pure states of rank five. In each embedded product frame $(a,b)\in S(E)\times S(F)$ let $u,v$ be the sums of its opposite products. Then
\[
 \overline G\cap(C\cap u^\perp)\ne\varnothing
 \quad\text{or}\quad
 \overline G\cap(C\cap v^\perp)\ne\varnothing.
\tag{8.8g.100.1}
\]
In particular $G$ is infinite. More strongly, if $G$ is closed, then at least one of the following holds:
\[
 \mathcal H^4(G_*)>0\quad\text{or}\quad \mathcal H^3(G_0)>0,
\tag{8.8g.100.2}
\]
where $G_0$ is its zero-marginal part, $G_*=G\setminus G_0$, and Hausdorff measures use the Frobenius metric. If $G$ is nonclosed, either (8.8g.100.2) holds or almost every embedded frame has a rank-four pure state or pure product in the closure of $G$ in one of its two opposite faces. The frame measure is the product of spherical area measures.

For every embedded frame and each sign in (8.8g.98.2), at $t=1/16$ there is an actual witness $q$ with
\[
 |D(q)|>1/128,\qquad
 \min\{\langle u,q\rangle_F,\langle v,q\rangle_F\}<1/32,
 \qquad \sigma_{\min}(q)>2^{-55}.
\tag{8.8g.100.3}
\]
The singular value is for the full normalized five-by-five Lorentz matrix. These witnesses are quantitatively separated from every singular matrix, uniformly in the frame and the candidate cone.

*Frame incidence.* For either sign fix witnesses of Theorem 8.8g.99 with $t\downarrow0$. They are all rank five, and the corresponding axial deficit tends to zero since $|D|\le1$. Compactness of the pure locus and a subsequence with a fixed choice of inequality in (8.8g.98.2) give (8.8g.100.1).

For a noncentral state of $G$ to annihilate an opposite pair, the two marginals must point along its two axes, with equal nonzero norm, by the light-coordinate identity (8.8g.79.2). Therefore the incident frames are images of its two normalized marginals under finitely many sign choices. On the part where both marginal norms are at least $1/j$, for positive integers $j$, these maps are Lipschitz. Thus $\mathcal H^4(G_*)=0$ implies a null set of such frame incidences.

For a central state $q\in G_0$ let $T$ be its spatial block in the matrix $2q$. It is an invertible contraction with $\|T\|_F^2=3$. Its unit singular space has dimension at most two, since three unit singular values and a positive fourth would give squared norm greater than three. Every opposite-face incidence has $Tb=\pm a$ and $\|b\|=1$. The possible $b$ therefore lie in a sphere of dimension at most one. On each constant-rank stratum of $I-T^{\mathsf T}T$, choose local smooth orthonormal kernel frames by the independent-row projection and Gram–Schmidt construction of Theorem 8.8g.79. Countably many chart restrictions have bounded derivative. They express the incidence images as Lipschitz images of subsets of $G_0$ times spheres of dimension at most one, by the map $(q,b)\mapsto(\pm Tb,b)$. If a base set of diameter $r$ is used in a Hausdorff cover, at most $O(r^{-1})$ sets of diameter at most $r$ cover the sphere factor. Thus $\mathcal H^3(G_0)=0$ implies $\mathcal H^4$-null frame incidences. This also covers restrictions of the images to the embedded frame manifold, which has spherical area measure proportional to $\mathcal H^4$ in its metric.

If both measures vanish, almost no frame has an actual rank-five pure state in its two opposite faces. Equation (8.8g.100.1) then requires a singular point of $\overline G$ there for almost every frame. It remains an actual pure state by compactness of the pure locus, and Corollary 8.8g.61a classifies it as rank four or a pure product. For closed $G$ this contradicts (8.8g.100.1), which proves (8.8g.100.2). In particular finite $G$ is impossible.

*Conditioning.* Use a witness at $t=1/16$ from (8.8g.98.2), and let $a_0$ denote the corresponding axial deficit. In the light frame of Theorem 8.8g.99 exchange two axes if necessary so $a_0=\gamma+\delta$ for the axial block $M=\left(\begin{smallmatrix}\lambda&\gamma\\\delta&\mu\end{smallmatrix}\right)$, and write $q=\left(\begin{smallmatrix}M&V\\ W&B\end{smallmatrix}\right)$. Put $x=\sqrt{\lambda\mu}$, $y=\sqrt{\gamma\delta}$, and $s=\sigma_{\min}(q)$. The witness inequality gives $|D(q)|>32a_0+1/128$. In particular $a_0<1/32$, $y\le a_0/2$, and $|B_{33}|=|D(q)|/2>32y+1/256$. By (8.8g.99.3), $x+y\ge|B_{33}|$, so $x>31y+1/256$. In particular $x>2y$ and
\[
 \det M=x^2-y^2>\tfrac34,2^{-16}>2^{-17},\qquad
 \|M^{-1}\|_{\mathrm{op}}<2^{17}.
\tag{8.8g.100.4}
\]
For the norm bound use that the operator norm of a two-by-two matrix equals that of its adjugate and $\|M\|_{\mathrm{op}}\le\|q\|_F=1$.

The Schur complement $S=B-WM^{-1}V$ satisfies $\|S-B\|_{\mathrm{op}}\le8y$ by the strip calculation of Theorem 8.8g.99, which does not use the rank in that calculation. The exact block eliminations are
\[
 \begin{pmatrix}I&0\\-WM^{-1}&I\end{pmatrix}
 q\begin{pmatrix}I&-M^{-1}V\\0&I\end{pmatrix}
 =\operatorname{diag}(M,S).
\]
Each multiplier has norm less than $2^{18}$ by (8.8g.100.4) and $\|V\|_{\mathrm{op}},\|W\|_{\mathrm{op}}\le1$. For invertible multipliers $P,Q$, the smallest singular value satisfies $\sigma_{\min}(PqQ)\le\|P\|_{\mathrm{op}}\|Q\|_{\mathrm{op}}\sigma_{\min}(q)$, by choosing a minimizing unit vector for $q$ and its normalized $Q^{-1}$ preimage. If $s\le2^{-55}$, the diagonal minimum is less than $2^{-19}<\sigma_{\min}(M)$ by (8.8g.100.4). Thus $\sigma_{\min}(S)<2^{-19}$.

Set $\eta=2^{-19}$. We then have $\sigma_3(B)\le8y+\eta$. Equations (8.8g.99.2)–(8.8g.99.3) imply
\[
 \sigma_2(B)^2\ge x^2-2xy-63y^2-16y\eta-\eta^2.
\]
This gives $\sigma_2(B)\ge x-9y-\eta$: if the right side is positive, then $x>9y+\eta$, and subtraction of its square from the lower bound gives
\[
 16xy-144y^2+2x\eta-34y\eta-2\eta^2
 =2(8y+\eta)(x-9y-\eta)\ge0.
\]
Thus the rank-two approximation $B_0$ of Theorem 8.8g.99 obeys $\|B-B_0\|_{\mathrm{op}}\le9y+\eta$. Its retained two-by-two compression is within $10y+\eta$ of a conformal block by the same positive-semidefinite sector coherence test. Its singular gap is at most $20y+2\eta$. Applying (8.8g.98.3) to $B_0/x$ gives $|(B_0)_{33}|\le20y+2\eta$, and therefore $|B_{33}|\le29y+3\eta$. Since $3\eta<1/256$, this contradicts $|B_{33}|>32y+1/256$. This yields the uniform lower bound $s>2^{-55}$. $\square$

<a id="theorem-88g101"></a>

<a id="theorem-88g101-tangent-rigidity-and-rank-five-witnesses-at-embedded-sector-products"></a>**Theorem 8.8g.101 (Tangent Rigidity and Rank-Five Witnesses at Embedded-Sector Products).** Use the complete embedded two-qubit sector and the Lorentz-five carrier of Theorem 8.8g.100. At any normalized pure product $p$ in the sector, take light coordinates as in Theorem 8.8g.68. In the transverse three-by-three block let $K_p$ be the two-dimensional space with all entries zero outside the retained two-by-two block, and with that block representing complex multiplication, up to a fixed orthogonal change of coordinates on one side.

Every rank-four pure state in the single product-null face $F_p=C\cap p^\perp$ has zero exterior correlation $D$. Consequently either $F_p$ contains actual normalized rank-five pure states of both exterior signs, or actual normalized entangled pure states of at least one exterior sign approach $p$ with $|D(q)|/(1-\langle p,q\rangle_F)$ unbounded. More precisely, whenever $F_p$ lacks one sign of exterior correlation, there are such sequences with the **opposite** sign, tending to $p$. These assertions do not require regularity.

The space $K_p$ is maximal among real linear subspaces $W$ of the transverse block satisfying $\|B\|_{\mathrm{op}}^2\le\|B\|_F^2/2$ for every $B\in W$. It is the exact purely transverse tangent space if the whole normalized pure locus is a $C^1$ embedded manifold near $p$. In that case the manifold has dimension eight. If the locus is $C^{1,1}$ near $p$, the product-null face $F_p=C\cap p^\perp$ has dimension sixteen, its transverse span is the seven-dimensional orthogonal complement $K_p^\perp$, and $U-p$ is relatively interior in $F_p$. In the latter case, for a finite constant $c_p$ and every actual normalized pure state $q$,
\[
 \|P_{K_p^\perp}B(q)\|_F\le c_p\bigl(1-\langle p,q\rangle_F\bigr),
\tag{8.8g.101.1}
\]
where $B(q)$ is its transverse block in the frame at $p$. In particular its exterior correlation obeys $|D(q)|\le2c_p(1-\langle p,q\rangle_F)$. At each such $C^{1,1}$ product there are actual normalized rank-five pure states in $F_p$ with both signs of exterior correlation.

*Single-null faces and exterior signs.* Compress to the complete sector in its positive-semidefinite orientation, as in Theorem 8.8g.98. Let $p$ be the projector on $|00\rangle$. For every $q\in F_p$ positivity of its compression makes the $|00\rangle$ row and column vanish, including its coherence with $|11\rangle$. The retained transverse two-by-two correlation block therefore comes entirely from the $|01\rangle$ to $|10\rangle$ coherence. Its two singular values agree by the Pauli calculation of Theorem 8.8g.98. For a rank-four $q$, Theorem 8.8g.61 gives its transverse block as $\sqrt{\lambda\mu}$ times a rank-two partial isometry. The compression-gap identity (8.8g.98.3) then makes its exterior entry zero, proving $D(q)=0$. The products in $F_p$ also have transverse block zero, since one of their factors is the opposite light ray.

Let $Z$ be the unit matrix in the exterior transverse position, so that $2\langle Z,q\rangle_F=D(q)$. Fix $\sigma\in\{-1,1\}$. If $F_p$ has no point with $\sigma D>0$, then $U-p+t\sigma Z$ is outside $F_p$ for every $t>0$, as $D(U-p)=0$. It pairs to zero with $p$, so it is outside $C$. By self-duality there is an actual normalized pure $q_t$ with
\[
 -\sigma D(q_t)>\frac{2}{t}\bigl(1-\langle p,q_t\rangle_F\bigr).
\tag{8.8g.101.2}
\]
This follows by separating with a positive vector and decomposing it into actual pure generators. Since $|D|\le1$, $q_t\to p$ as $t\downarrow0$ by the squared-distance identity of Theorem 8.8g.68. The witnesses are entangled for $0<t\le1$, since Theorem 8.8g.36 bounds the transverse block norm of a pure product by $1-\langle p,q\rangle_F$. Their ratio in (8.8g.101.2) diverges. If $F_p$ has points of both signs, conic pure generation in the face gives a pure generator for each sign. The zero result for products and rank-four states then forces rank five by Corollary 8.8g.61a.

*Transverse linear algebra.* Apply fixed orthogonal changes to put $K_p$ in the form $\operatorname{span}\{\operatorname{diag}(I_2,0),\operatorname{diag}(J,0)\}$ with $J=\left(\begin{smallmatrix}0&-1\\1&0\end{smallmatrix}\right)$. Let $W$ satisfy the norm inequality and contain this space. For $A\in W$, its leading two-by-two block must be scalar plus skew. Indeed write $A_{00}$ for that block and perturb $D_0=\operatorname{diag}(I_2,0)$ by $tA$. Its two largest squared singular values have first-order splitting given by the eigenvalue gap of $A_{00}+A_{00}^{\mathsf T}$. This follows by eliminating the last coordinate from the eigenvector equation of $(D_0+tA)^{\mathsf T}(D_0+tA)$ at the two eigenvalues near one. The last singular value is $O(|t|)$, by testing the third coordinate. The norm inequality requires the squared gap of the two large singular values to be at most the square of the third, so the first-order splitting vanishes. In dimension two this gives the asserted scalar-plus-skew form.

Subtract the resulting member of $K_p$ and write the remainder $A$ as
\[
 A=\begin{pmatrix}0&h\\ k^{\mathsf T}&d\end{pmatrix},\qquad h,k\in\mathbb R^2,quad d\in\mathbb R.
\]
The norms of its last column and row give
\[
 \|h\|^2+d^2\le(\|h\|^2+\|k\|^2+d^2)/2,
 \qquad
 \|k\|^2+d^2\le(\|h\|^2+\|k\|^2+d^2)/2.
\]
Adding yields $d=0$, and either inequality then gives $\|h\|=\|k\|$. Choose a planar rotation $O$ such that $O^{\mathsf T}h$ and $k$ are parallel, with any rotation if both vanish. The matrix $\operatorname{diag}(O,0)$ belongs to $K_p$. Multiply the top output rows of $\operatorname{diag}(O,0)+tA$ by $O^{\mathsf T}$, an orthogonal operation preserving all its singular values. The new top block is $I_2$ and the two side vectors are $tO^{\mathsf T}h$ and $tk$. The lowest singular value is $O(t^2)$ by evaluating this matrix at the vector with top part $-tO^{\mathsf T}h$ and bottom part one. Eliminating the last coordinate in the two top singular equations as above gives the effective upper block
\[
 I_2+t^2\bigl[kk^{\mathsf T}+(O^{\mathsf T}h)(O^{\mathsf T}h)^{\mathsf T}\bigr]+O(t^4).
\]
The bracket matrix must be scalar, since otherwise the top two squared singular values split at order $t^2$ and the third has square $O(t^4)$. Its two vectors are parallel, so it has rank at most one. A scalar two-by-two positive matrix of rank at most one is zero. Hence $h=k=0$ and $A=0$. This proves maximality.

*Actual sector tangents.* Choose local Pauli Hilbert–Schmidt coordinates so $p$ is the projector on $|00\rangle$, and if required transpose one factor to use the positive-semidefinite orientation. The normalized vector proportional to $|00\rangle+t z|11\rangle$ for each $z\in\mathbb C$ gives a two-sided differentiable curve of rank-one projectors in the complete sector. Each projector has unit Frobenius norm and hence is an actual pure state of $C$ by the unit-ball property of Theorem 8.8g.36. The derivatives at $p$ are purely transverse in the sector, with their two-by-two blocks exactly the complex multiplications up to the fixed reflection described above. This is the same Pauli off-diagonal calculation as in Theorem 8.8g.98. Their linear span is $K_p$.

The tangent to a $C^1$ embedded pure manifold includes the six-dimensional tangent to the full product manifold. Theorem 8.8g.68 puts its remaining tangent in the transverse block with the displayed norm inequality. Subtract the product components inside the linear tangent space. Its purely transverse space is linear and contains $K_p$, so maximality makes it exactly $K_p$. This proves the dimension eight assertion. Under $C^{1,1}$ regularity Theorem 8.8g.70 identifies the transverse span of $F_p$ with $K_p^\perp$ and puts $U-p$ in its relative interior. The full product-null face span adds the nine-dimensional minus row and column subspace of Theorem 8.8g.66 to these seven transverse dimensions. The latter theorem's relative ball criterion yields (8.8g.101.1) with a finite constant on all actual pure states. The exterior matrix lies in $K_p^\perp$ with Frobenius norm one, and its pairing with $q$ is $D(q)/2$. Thus (8.8g.101.1) precludes either missing-sign alternative of (8.8g.101.2) and forces actual rank-five pure witnesses in $F_p$ of both signs. $\square$

<a id="theorem-88g102"></a>

<a id="theorem-88g102-rank-five-accumulation-or-two-single-null-witnesses-at-every-embedded-product"></a>**Theorem 8.8g.102 (Rank-Five Accumulation or Two Single-Null Witnesses at Every Embedded Product).** Use the fixed Lorentz-five carrier and the complete embedded two-qubit sector of Theorem 8.8g.101. Let $p=p_ap_b^{\mathsf T}$ be any normalized pure product of that sector and let $D(q)=n^{\mathsf T}T_qm$ be its exterior correlation, in the notation of Theorem 8.8g.98. Every rank-four actual normalized pure state $q$ satisfies the uniform estimate
\[
 |D(q)|\le100\bigl(1-\langle p,q\rangle_F\bigr).
\tag{8.8g.102.1}
\]
Consequently each embedded product belongs to the closure of the actual rank-five pure locus or its single product-null face contains actual normalized rank-five pure states of both exterior signs. If a sign is absent from that face, the opposite sign occurs along actual rank-five pure states approaching the product with an unbounded exterior-to-product-deficit ratio. These conclusions impose no regularity on the pure locus.

Let $G$ be the actual rank-five pure locus. For each exterior sign $\sigma$, let $G_{j,\sigma}$ be the set of actual rank-five pure states that annihilate a product, have exterior sign $\sigma D>0$, and whose right Lorentz defect of Theorem 8.8g.74 has rank $j$, where $1\le j\le4$. If some embedded product is outside $\overline G$, then for **each** sign $\sigma$ at least one of the following measures is positive:
\[
 \mathcal H^2(G_{1,\sigma}),\qquad \mathcal H^3(G_{2,\sigma}),\qquad
 \mathcal H^4(G_{3,\sigma}),\qquad \mathcal H^4(G_{4,\sigma}).
\tag{8.8g.102.5}
\]
If these four measures vanish for either sign, $\overline G$ contains the whole embedded product manifold. In particular, for closed $G$ both signs must meet (8.8g.102.5), and for semialgebraic $G$ its dimension is at least two. The latter statement permits arbitrary dimension for the rest of the pure locus.

*Rank-four Schmidt form and alignment.* Write $h=1-\langle p,q\rangle_F$. If $h\ge1/100$, the Lorentz-positive contraction bound $|D(q)|\le1$ suffices. Otherwise use Corollary 8.8g.61a to express $q$ as an embedded two-qubit rank-one projector, up to partial transpose. Its equal marginal norms are $r\in[0,1)$, and its spatial block has the Schmidt form
\[
 T_q=uv^{\mathsf T}+sR,\qquad s=\sqrt{1-r^2},
\tag{8.8g.102.2}
\]
where its marginals are $ru,rv$ with unit axes $u,v$. Here $R$ is a rank-two partial isometry from $v^\perp$ to $u^\perp$, in the full four-dimensional spatial spaces. This form follows by taking the two local Schmidt bases and computing their Pauli correlations $(s,-s,1)$, with a sign change on a transverse Pauli axis if the orientation is transposed. Since $\|T_q\|_{\mathrm{op}}\le1$, the product pairing formula gives
\[
 4h=3-r(a^{\mathsf T}u+b^{\mathsf T}v)-a^{\mathsf T}T_qb
 \ge2(1-r)+r[(1-a^{\mathsf T}u)+(1-b^{\mathsf T}v)] .
\tag{8.8g.102.3}
\]
The small-$h$ regime therefore has $r\ge1-2h>3/4$, $s^2\le4h$, and, on putting $\eta=1-a^{\mathsf T}u$, $\xi=1-b^{\mathsf T}v$, it has $\eta+\xi\le(16/3)h$.

Use orthogonal plane rotations taking $u$ to $a$ and $v$ to $b$, respectively, and the identity on the corresponding plane orthogonal complements. When two axes agree take the identity. Write $R_0$ for $R$ after those rotations, viewed as a rank-two partial isometry from $b^\perp$ to $a^\perp$. The compression to $a^\perp$ of the inverse left rotation restricted to $a^\perp$ is $I-\eta ee^{\mathsf T}$, where $e$ is the transverse unit direction in the rotation plane. The analogous right compression is $I-\xi ff^{\mathsf T}$. These formulas follow by writing the rotation in its two-dimensional plane. Thus the transverse compression of $sR$ differs in operator norm from $sR_0$ by at most $s(\eta+\xi)$, by a telescoping difference of the two contraction factors. The compressed rank-one part $uv^{\mathsf T}$ has norm
\[
 \sqrt{(1-(a^{\mathsf T}u)^2)(1-(b^{\mathsf T}v)^2)}\le2\sqrt{\eta\xi}\le\eta+\xi .
\]
Let $B$ be the transverse block of $q$, which is the same block of $T_q/2$ under the light-coordinate changes. It follows that
\[
 \|B-sR_0/2\|_{\mathrm{op}}\le(1+s)(\eta+\xi)/2\le(16/3)h.
\tag{8.8g.102.4}
\]

*Sector compression and exterior control.* In the computational coordinates of the complete sector adapted to $p=|00\rangle\langle00|$, the compression of $q$ is positive semidefinite in the sector orientation by Theorem 8.8g.98. Its three diagonal entries off the $|00\rangle$ corner sum to $h$. The $|01\rangle$ to $|10\rangle$ coherence has modulus at most $h/2$, from the two-by-two principal minor and the arithmetic-geometric mean bound. The retained two-by-two transverse block of $B$ is the sum of the two contributions from the opposite coherences, with each contribution conformal and its operator norm equal to the modulus of the corresponding coherence. This is the Pauli calculation in Theorems 8.8g.98 and 8.8g.99. Thus the retained block is within $h/2$ of the conformal block from the $|00\rangle$ to $|11\rangle$ coherence. Equation (8.8g.102.4) puts the retained block of $sR_0/2$ within $(16/3+1/2)h$ of the same conformal block. The difference of its two singular values is at most twice that distance by the variational singular-value inequalities. The compression-gap identity (8.8g.98.3) bounds the exterior entry of $sR_0/2$ by that difference. Adding the error from (8.8g.102.4) gives $|B_{33}|\le17h$. Since $D(q)=2B_{33}$, this yields (8.8g.102.1) in the small-$h$ regime and completes the uniform estimate.

If the single product-null face lacks one exterior sign, apply (8.8g.101.2) as $t\downarrow0$. For $0<t\le1/50$ its strict lower bound on the ratio is incompatible with (8.8g.102.1). The witnesses are already entangled by Theorem 8.8g.101, so Corollary 8.8g.61a forces rank five. The same theorem gives convergence to $p$ with the indicated sign and ratio. If neither sign is absent, pure generation of the face and rank-four exterior vanishing in Theorem 8.8g.101 give the two actual rank-five witnesses.

*Signed incidences.* Suppose the embedded product manifold has a point outside $\overline G$. Its complement in that manifold then has a relatively open nonempty set, of positive $\mathcal H^4$ measure since the embedded product manifold is smoothly parametrized by $S^2\times S^2$. For each fixed sign all those products are incident to at least one state of the corresponding $G_{j,\sigma}$ by the preceding alternative. The proof of Theorem 8.8g.74 uses a countable union of Lipschitz images of subsets of $G_{j,\sigma}$ times spheres of dimension at most $k_j=\max(0,3-j)$. Its same Hausdorff cover argument with exponent $4-k_j$ gives a null set of embedded incidences if $\mathcal H^{4-k_j}(G_{j,\sigma})=0$. If all four measures for that sign vanished, their union could not cover the relatively open set. This proves (8.8g.102.5) and its contrapositive. Closed $G$ is disjoint from products, so the relatively open set is then the whole embedded product manifold. For semialgebraic $G$, closure preserves its dimension. If $\overline G$ contains the four-dimensional embedded product manifold this gives dimension at least four. Otherwise (8.8g.102.5) gives Hausdorff dimension at least two, which agrees with semialgebraic dimension. $\square$

<a id="theorem-88h-exact-binary-instrument-realization-of-the-born-frame"></a>**Theorem 8.8h (Exact Binary-Instrument Realization of the Born Frame).** Let $\mathcal F_{64}$ be the 64 projections in (8.8b.1). For every $E\in\mathcal F_{64}$, register the binary instrument
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

<a id="theorem-88i-full-effect-born-descent-spappce-boundary-and-product-trial-response-quotient"></a>**Theorem 8.8i (Full-Effect Born Descent, SPAP/PCE Boundary, and Product-Trial Response Quotient).** Let $d\ge2$, let $\mathcal H=\mathbb C^d$, let $\mathsf S$ be a nonempty convex set of registered preparation labels, and let $\mathsf C_d$ contain every finite-outcome POVM $C=(E_i)_{i\in K_C}$ on $\mathcal H$. In particular, $\mathsf C_d$ contains $(I)$, every binary context $(E,I-E)$, and every ternary context $(E,F,I-E-F)$ with $E,F\ge0$ and $E+F\le I$. Assume a one-run table
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
Thus $\rho_x$ is the output state of an explicit formal preparation channel, $E_i$ is the effect of an explicit outcome instrument, and their response equals the selected table. In a projective context $E_i=P_i$. PU-carrier population of the required replacement states, square-root operations, and classical registers is a separate requirement.

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

<a id="theorem-88j-binary-first-instrument-factorization-and-causal-same-effect-descent"></a>**Theorem 8.8j (Binary-First Instrument Factorization and Causal Same-Effect Descent).** Let $\mathcal H$ and $\mathcal K$ be finite-dimensional complex Hilbert spaces and let $\Phi=(\Phi_k)_{k\in K}$ be a finite instrument
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

<a id="theorem-88j1-complete-controlled-wave-causal-process-certificate"></a>**Theorem 8.8j.1 (Complete Controlled-Wave Causal Process Certificate).** On the complete formal source of Proposition 8.8g.3 and Construction 8.8g.3.1, the following source-derived records form a complete causal-process certificate for every admitted finite occurrence. Quadrature/energy calibration and transfer coefficients precede the response table; the source interface, timing, resources and retained labels are part of the domain.

#### 8.8j.1.1 1. Occurrence-indexed certificate, populated by a compiler

Every finite experiment is a rooted acyclic tree. An occurrence address is its finite visible-history word plus its fixed local slot index. Its record is the actual tuple

$$
\begin{aligned}
&(\text{address, input mode count, output mode count, calibrated splitter blocks,} \\
&\quad \text{block-to-visible-label map, zero-mode inventory, fresh rotor token,} \\
&\quad \text{write-once output-register addresses, memory route, opening/closing slot,} \\
&\quad \text{source energy unit, initial module inventory, allowed controller reads}).
\end{aligned}
$$

These are values in the finite source circuit description, not booleans asserting compliance. The compiler constructs the coupler by orthonormal completion of its stacked blocks; the path routing and label map identify physical wires. The rotor token is fresh and absent from all controller read sets. The live input port is consumed once; only the selected output port enters the next occurrence. All other fields terminate in that occurrence's sealed source module. A typed compiler rejects a dangling exposed path, reused rotor, overwritten earlier latch, or later-setting wire entering an earlier selector. Source calibration is the deterministic quadrature transfer and energy law. It does not use any terminal outcome table.

The invariant proved at each occurrence is the interval-cancellation identity in Proposition 8.8g.3: the unnormalized response moment of a branch is $A_{b}RA_b^*$. Grouping internal blocks and inducting gives, for every visible leaf $h$, the **labeled** map $\Phi_{h}$ and its independently computed Choi matrix

$$
\begin{aligned}
J_h&=\sum_{b\text{-paths yielding } h} \operatorname{vec}(K_b)\operatorname{vec}(K_b)^{*}, \\
K_b&=A_{\mathrm{last}} \cdots A_{\mathrm{first}}.
\end{aligned}
$$

This definition comes from source transfer coefficients, never from fitting Born probabilities. Outcome labels are keys in a direct sum: permutation, duplication, merging or forgetting labels is represented explicitly. Choi equality is equality of every such block, with the declared public side ledger fixed.

#### 8.8j.1.2 2. Literal common prefix and actual branch memory

Let a source-realized instrument have blocks $A_{k\alpha}$, $\sum A^*A=I$, and point to visible outcome $i$. Compute $E=\sum_\alpha A_{i\alpha}^*A_{i\alpha}$, $D=I-E$ from the independent transfer calibration. Construct one actual two-output splitter with transfer blocks $\sqrt{E}$, $\sqrt{D}$. It is the **same hardware program, same mode wiring, same phase convention, same slot and fresh-rotor law** whenever the same $E$ is reused. The prefix flag $b$ is written to its own latch at the end of the prefix slot, before any later choice is admitted. The surviving unnormalized waveform $\sqrt{E}z$ or $\sqrt{D}z$ is routed to a shielded delay/memory bank. Its norm is not read by the receiver; no normalization amplifier is inserted.

The later setting c is placed into an exogenous controller register only after that latch has closed. No wire connects c backward into the prefix program, rotor or source initial setting. The conditional controller addresses only the appropriate branch memory and its later fresh modules. This supplies branch memory and a literal prefix, not two independently named operations with equal effects.

#### 8.8j.1.3 3. Continuations and controlled kernel completions

Let $P_{E}$ and $P_{D}$ be supports. Use pseudoinverse square roots only to **compile fixed device coefficients**, not as an operation on a tiny live waveform. Set

$$
\begin{aligned}
C_{i\alpha}&=A_{i\alpha} E^{-1/2}\ \text{on } \operatorname{support}(E), \\
C_{k\alpha}&=A_{k\alpha} D^{-1/2}\ \text{on } \operatorname{support}(D),\quad k\ne i,
\end{aligned}
$$

and zero on the complementary kernels. Their sums $C^*C$ are $P_{E}$ and $P_{D}$. Therefore each $C$ has norm $\le 1$. Choose a fixed unit vector $f$ in the output and an orthonormal basis $u_j$ of each unused kernel. Add filler blocks $|f\rangle\langle u_j|$, with a dedicated internal label grouped into a designated visible continuation label on that branch. Their $C^*C$ sum is the kernel projection. The resulting continuation families have full sum $I$ and are source-compilable. Fillers cannot be reached after the matching prefix because $|f\rangle\langle u_j|\sqrt{E}=0$ or $|f\rangle\langle u_j|\sqrt{D}=0$. They introduce no observed branch on a reachable input. If $E=0$ or $I$, the zero-probability prefix branch remains an explicit zero leaf and no conditional state is assigned to it.

Positivity of $E$ proves $A_{i\alpha}=A_{i\alpha}P_E$: its zero quadratic form is a sum of squared norms. Consequently

$$
\begin{aligned}
C_{i\alpha}\sqrt{E}&=A_{i\alpha}, \\
C_{k\alpha}\sqrt{D}&=A_{k\alpha}.
\end{aligned}
\tag{8.8j.1.1}
$$

This is an identity of actual composed source transfers. It implies equality of each flattened labeled CP/Choi map after every spectator extension, including zero/duplicate-effect edges and arbitrary allowed kernel fillers. No flag is forgotten during this check.

#### 8.8j.1.4 4. Exact response extensionality and history pushforward

For every finite tree, The interval-cancellation identity of Proposition 8.8g.3 telescopes along each microscopic path, even though the surviving physical signal has successively smaller energy. Its path probability times its normalized-ray projector is $K_{b}RK_b^*$. Summing all internal microscopic paths with one visible leaf $h$ yields $\Phi_h(R)$; the source selector law gives leaf mass $\operatorname{Tr}\Phi_h(R)$. Hence two trees with equal **outcome-labeled** Choi maps have identical terminal laws and identical conditional future response quotients. Choi matrices determine linear maps by matrix-unit reconstruction, independently of their terminal laws. This is a proved bridge, not a response-defined Choi shadow.

For a current branch block $R_{h}$ and later normalized maps $\Lambda_{c}$, the later blocks are $R_{hc}=\Lambda_c(R_h)$, their sum is $\Lambda(R_h)$ with $\Lambda=\sum_c\Lambda_c$, and $\sum_c\operatorname{Tr}R_{hc}=\operatorname{Tr}R_h$ because $\sum C^*C=I$. The evolved matrix $\Lambda(R_h)$ need not equal $R_{h}$, and its output carrier may differ. Iterating the trace identity proves that the classical retained-history law pushes forward exactly under forgetting later records (Theorem 8.8m.4a). In the $i$-pointed factorization, the terminal event $i$ is precisely the prefix-one cylinder; all other leaves occur on prefix zero. The latch and label maps establish this equality of events.

The earlier flag is a deterministic function of the input waveform, fixed prefix coefficients and its fresh rotor. The exogenous later setting is absent from that function and independent of the rotor/input. Thus its marginal is invariant under every normalized later continuation admitted by the finite compiler. No backwards influence is inferred from statistical conditioning on a later outcome: this is intervention invariance under the exogenous setting.

These statements prove conditions 1–3 of 8.8j on the entire source grammar. Applying them to any two pointed occurrences with equal E gives same-effect consistency. The full effect cover and affine preparation law are source-proved, so 8.8i's Born descent is available; the independent energy-interval source calculation already gives its same normalized trace table.

#### 8.8j.1.5 5. Timing, energy and intervention scope

Each finite tree has a finite public schedule. When comparing its terminal instrument with a flat implementation, use a common padded schedule and common initial ready-module inventory: reserve the union of their finite slots/modules, latch public outputs only at the common endpoint, and leave unused modules sealed. A tree's prefix latch may be inspected only at its declared slot; a flat endpoint-only implementation is compared **after forgetting that additional history**, not claimed equal as an experiment exposing a nonexistent intermediate flag. Equal-effect comparisons use the same actual prefix slot and memory, then later exogenous programs. No infinite uniform time bound or unlimited reusable source is claimed.

Experiment input/control settings and program names index the compared conditional response laws; their mere names are not additional emitted output. Fields retained in process equality are: mode type, output labels, requested observation times, the common slot schedule and initial module inventory, and any explicitly emitted extra classical output. If a controller emits its setting as an output tag, that tag must be held fixed or compared too. A tag or timing field changes the equality class unless its law is proved equal. Intermediate timing remains exactly fixed by the source's ideal slot law. All source noise is independent and fresh.

Actual source energy partitions are accounted at every occurrence: splitter energy is conserved; selected energy continues in memory; unselected paths terminate in sealed absorbers; multiplier work and its output-energy law are source-defined; each run consumes its ready modules. Raw energy, absorber heat and comparator records are not accessible through any admitted operation. This is enforced by the port graph: edges out of those nodes end only in sealed sinks, with no later controller read or receiver return edge. The visible energy data are the fixed supplied unit and initial inventory. Exposing per-branch calorimetry adds a response-active side port and invalidates this quotient; it is explicitly a rejection condition, not an omitted ledger. No heat/reset theorem is claimed.

The no-access proof is structural induction on the grammar: a newly composed module receives only the previous selected packet and visible labels; its coefficients can depend only on these labels and current public settings. A sealed-node value therefore has no directed path to a later accessible node except through the already analyzed selected packet/flag. Its effect on every future law is exactly the quotient transformation already proved. Mere administrative promises of privacy would not suffice; the consumed-module wiring is part of the nominated source.

#### 8.8j.1.6 6. Explicit rejection witnesses

1. **Different leaves with the same unflagged map.** Two half-identity branches carry distinct labels 0 and 1. Swapping them is invisible only if their complete labeled maps and retained side labels agree; grouping arbitrary unequal branches before checking can hide failure. The fresh checker uses a $Z$ measurement with a changed label map to expose this.
2. **Kernel filler error.** For $E=\operatorname{diag}(1,0)$, an incorrect continuation with nonzero action on the reachable coordinate changes the composite; arbitrary action only on the unreachable coordinate does not. The checker multiplies actual blocks in both cases.
3. **Future-setting leak.** Let the legitimate prefix probability be 1/2. Replacing its rotor by a setting-dependent variable that is certainly below 1/2 for $c=0$ and above for $c=1$ makes the earlier flag probabilities 1 and 0. It violates the causal wiring/fresh-noise gate, even though later terminal maps can be assigned the same formal Choi label.
4. **Omitted physical energy side port.** Implement identity with two internal blocks $\sqrt{p}I$ and $\sqrt{1-p}I$ grouped into one visible label. The quotient channel is identity for every $p$. For a unit-energy input the surviving energy is $p$ or $1-p$ with those probabilities. At $p=1$ the energy is 1 certainly; at $p=1/2$ it is 1/2 certainly. An exposed final power meter distinguishes Choi-identical endpoints. CSW's ratio-only interface is therefore essential. This witness is a direct source-level realization of the shadow obstruction, rather than adding an arbitrary symbolic side tag.
5. **Born-defined calibration.** A checker using $q$ to choose its own calibrated blocks would pass an incorrect $q$ by construction. Here the blocks are fixed independently by real transfer; changing only a supplied expected terminal table produces a mismatch with interval lengths. The replay tests such a mutation explicitly.
6. **Wrong history marginal.** For the explicit 3-leaf diagonal instrument in the checker, the pointed leaf's probability must equal the prefix-one mass. Swapping its prefix route with a different leaf changes this finite polynomial identity.

<a id="theorem-88j1a-continuation-complete-memory-quotient"></a>**Theorem 8.8j.1a (Continuation-Complete Memory Quotient).** On an independently calibrated finite CP-process branch, let $S\otimes M$ be the entire state carrier immediately after a retained history $h$. It includes the controller, branch memory, accessible archive and every degree allowed to influence a later retained response. Fix the admitted continuation grammar before comparing prefixes. For every continuation and every retained event, let $E$ be its Heisenberg effect on $S\otimes M$, so that its independently calibrated probability on input $\rho$ is $\operatorname{tr}(E\rho)$. Write $\mathcal E_h$ for this family; it includes the identity event. These effect/trace identifications are source inputs on the accepted CP branch, not definitions of the Born table sought in Theorem 8.8j.

1. On the full joint-state domain, forgetting $M$ preserves all admitted continuation laws exactly if and only if
$$
\mathcal E_h\subseteq\{F\otimes I_M:F\in M_{\dim S}(\mathbb C)^{\mathrm{sa}}\}.
\tag{8.8j.1a.1}
$$
For a general admitted reachable set $\mathcal R_h$, replace the right-hand criterion by
$$
E\perp K_h\quad(E\in\mathcal E_h),\qquad
K_h:=\operatorname{span}_{\mathbb R}\{\rho-\sigma:\rho,\sigma\in\mathcal R_h,
\ \operatorname{tr}_M\rho=\operatorname{tr}_M\sigma\}.
\tag{8.8j.1a.2}
$$
Orthogonality uses $\operatorname{tr}(EX)$. This criterion covers the whole grammar, all selective events and all reachable states.

2. If the grammar contains all joint unitaries followed by one fixed nonzero proper system projection, then (8.8j.1a.1) fails whenever $\dim S,\dim M\ge2$. If it contains every joint effect, the response-equivalence classes are single joint states. For two source prefix maps with a common full input carrier, equality of their complete joint outcome-labeled maps is sufficient for equality after every common CP continuation and every spectator. Equality of the maps obtained after tracing out $M$ is sufficient exactly when their differences are annihilated by the admitted continuation effects, with the same statement on every spectator extension.

3. A literal common prefix with a write-once classical flag has a continuation-independent flag marginal whenever every subsequent conditioned continuation is trace preserving on the entire reachable branch carrier, including $M$, and the later setting is exogenous to that prefix. If a later record is retained, summing its branch probabilities recovers the earlier history probability. These two identities establish the history/prefix parts of Theorem 8.8j on this supplied full-carrier branch.

*Proof.* The kernel of $T=\operatorname{tr}_M$ on Hermitian matrices consists of trace-zero matrices. Every such $X$ is a scalar multiple of a difference of two density matrices with the same system marginal: choose $\rho_0=I_{SM}/(\dim S\dim M)$ and $\epsilon>0$ small enough that $\rho_0\pm\epsilon X\succeq0$. Therefore equal-marginal states have equal $E$-response exactly when $E$ annihilates $\ker T$. In finite-dimensional inner-product spaces, $(\ker T)^\perp=\operatorname{ran}T^*$, and direct calculation gives $T^*(F)=F\otimes I_M$. For completeness, the range equality follows by decomposing any vector into its component in $\ker T$ and its orthogonal complement; $T$ is injective on the complement, and the dimensions of the complement and $\operatorname{ran}T^*$ both equal $\operatorname{rank}T$. This proves (8.8j.1a.1). On a restricted reachable set, equality for each of its same-marginal pairs is exactly annihilation of their real span, proving (8.8j.1a.2).

The real span of all unitary conjugates of a nonzero proper projection on a $D$-dimensional space is the entire Hermitian algebra. To verify this, diagonalize the projection, of rank $r$ with $0<r<D$. Differences of rank-$r$ coordinate projections that differ in one entry give $|i\rangle\langle i|-|j\rangle\langle j|$. Conjugating these differences by two-dimensional real rotations and phase rotations gives the real and imaginary off-diagonal Hermitian matrix units. Summing all coordinate rank-$r$ projections gives a nonzero scalar multiple of $I$. Thus the span is full. A nonzero proper system projection tensored with $I_M$ has rank strictly between $0$ and $D$; its joint-unitary orbit cannot lie in the strictly smaller space in (8.8j.1a.1). If all effects are available, they separate every two Hermitian states by the same spanning argument.

A continuation is linear on an unnormalized prefix output. Thus equal full branch maps stay equal after composition, partial trace and any spectator identity. Conversely, applying every admitted event to their difference is the exact response-equality test. This proves the map and spectator statements without presuming that reduced Choi equality determines a hidden-memory response. Finally, if $\rho_{h,a}$ is the unnormalized positive state for prefix flag $a$ and the selected continuation has branches $\Lambda_{b|a}$, then
$$
\sum_b\operatorname{tr}\Lambda_{b|a}(\rho_{h,a})
=\operatorname{tr}\rho_{h,a}.
$$
The flagged channel $\rho_{h,a}\mapsto\bigoplus_b\Lambda_{b|a}(\rho_{h,a})$ is normalized; forgetting $b$ gives the original flag weight. Its value is the same for every normalized later continuation. Repeating this identity at successive nodes proves all finite-history marginal identities. A spectator identity preserves normalization, so the proof also covers arbitrary retained references. ∎

An exact side-memory witness uses $S=M=\mathbb C^2$ and prefix maps $\Psi_j(X)=X\otimes|j\rangle\langle j|$, $j=0,1$. Their reduced system maps and hence their reduced Choi matrices are both the identity. A later SWAP followed by the effect $|0\rangle\langle0|$ on $S$ has response $1$ for $j=0$ and $0$ for $j=1$, for every normalized input. Including the memory in the Choi output distinguishes the maps at once. This witness uses a fresh prepared memory and a later accessible coupling; an isolated archive with no feedback port in Definition C.6c.4a does not admit that continuation. Adding such a port requires a newly admitted access and resource entry.

<a id="theorem-88k-born-table-independent-retained-flag-choi-descent-and-exact-positive-map-boundary"></a>**Theorem 8.8k (Born-Table-Independent Retained-Flag Choi Descent and Exact Positive-Map Boundary).** Let
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

<a id="theorem-88l-finite-response-cone-envelope-and-exact-spapppipce-carrier-boundary"></a>**Theorem 8.8l (Finite Response-Cone Envelope and Exact SPAP/PPI/PCE Carrier Boundary).** Let the pre-carrier signature $\mathcal L_0$ contain exactly the admitted SPAP original-sort queries and responses, finite response maps and their invariant one-run laws, finite PPI dressings $X^\Theta=(X,\Pi_X,R_X,V_X,C_X,\tau_X)$ for their registered operational aspects, together with a nonempty finite PCE implementation census, its retained response tables, source-exhausted cost ledgers, response/cost quotient, exact potential and registered update. The signature $\mathcal L_0$ has no ordered-carrier, composite, spectator, branch-transformation or Choi predicate.

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

<a id="theorem-88m-physical-purification-and-hereditary-locality-descent-to-retained-cp"></a>**Theorem 8.8m (Physical-Purification and Hereditary-Locality Descent to Retained CP).** Work on the branch where the complex ordered-carrier and standard positive-semidefinite composite portion of condition 1 in Theorem 8.8k holds, excluding its $\omega_d$ preparation clause. Let a registered finite procedure have positive affine preparation-extensional branch rules $t_a:\mathcal D_d\to M_{d'}(\mathbb C)^+$, and let $\Phi_a$ be their unique linear extensions (8.8k.4). Assume separately the retained trace/record link
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
The two CP branches, the normalized flagged matrix shadow and the purification/locality identities all hold, while $q_a\ne\operatorname{tr}t_a(\rho)=1/2$. Here the matrix-shadow label and the terminal operational record are separate registered sorts; identifying their weights is exactly the missing premise (8.8m.1). Finally, the complete-local-effect restricted CP subtheory (8.8l.11) supplies the current-cut CP, affine spectator, purification and trace/record certificates while omitting nonidentity unitary channels and, for $d\ge 3$, proper coherent filters of rank at least two. Its complete-local-effect versus process-fullness boundary is the one proved in Theorems 8.8k--8.8l. It contains the reset instrument, so it does not satisfy the temporal block-recovery clause of condition 2. Theorem 8.8m.4a proves that obstruction. These examples establish their specified current-cut boundaries.

For $d=1$, the input matrix algebra is scalar, every positive linear branch is CP, and (8.8m.6) reduces to the scalar branch weight. The antisymmetric and nonfaithful-reference countermodels require $d\ge2$.

*Proof.* The product density operators affinely span the trace-one hyperplane of $M_d(\mathbb C)^{\mathrm{sa}}\otimes M_d(\mathbb C)^{\mathrm{sa}}$. Perturbing $I_d/d$ in each factor by sufficiently small multiples of bases of traceless Hermitian matrices and taking affine differences spans the directions $A\otimes I$, $I\otimes B$ and $A\otimes B$. Hence the single affine map in (8.8m.4) is uniquely determined on $\mathfrak D_{AR}^{\psi}$ by its values on all product states. Equation (8.8m.5) forces
$$
H_a(\zeta)=(\Phi_a\otimes\operatorname{id}_d)(\zeta)
\quad(\zeta\in\mathfrak D_{AR}^{\psi}).
$$
The pure-state marginal identity (8.8m.2) gives equal Schmidt coefficients $1/\sqrt d$, so a unitary $U$ on the reference has the orientation displayed in (8.8m.6). Substitution and the Choi convention (8.8k.6) prove (8.8m.6). Positivity of the retained $H_a(\psi)$ blocks and unitary conjugation prove $J(\Phi_a)\succeq0$. Equation (8.8m.1) makes $\sum_a\Phi_a$ trace preserving, and duality gives the POVM and branch-weight formula. The separable, product-reference, side-tag, hidden-flag, trace-link and complete-local-effect restricted-process models establish the stated current-cut boundaries. ∎

<a id="proposition-88m3-full-domain-coupled-preparation-rigidity"></a>**Proposition 8.8m.3 (Full-Domain Coupled-Preparation Rigidity).** Work on the independently supplied complex matrix carriers of Theorem 8.8m. Let $S\cong\mathbb C^d$ and $E\cong\mathbb C^e$ include, respectively, the proposed retained input and all source memory that is omitted from it. Suppose a single preparation-extensional affine source assignment
$$
\mathcal A:\mathcal D_d\longrightarrow\mathcal D_{de},\qquad
\operatorname{tr}_E\mathcal A(\rho)=\rho
\quad(\rho\in\mathcal D_d)
\tag{8.8m.3.1}
$$
is positive on the entire displayed domain. Then there is one $\tau_E\in\mathcal D_e$ such that
$$
\mathcal A(\rho)=\rho\otimes\tau_E\quad(\rho\in\mathcal D_d).
\tag{8.8m.3.2}
$$
Conversely, every assignment (8.8m.3.2) satisfies (8.8m.3.1), is completely positive after linear extension, and admits every spectator extension. Thus an actual coupled preparation containing a correlation, or an input-dependent omitted-memory state, cannot satisfy all the full-domain, affine, positive and consistent assignment requirements simultaneously. This conclusion concerns the source assignment, not the possible complete positivity of a particular subsequent reduced channel.

*Proof.* The positive-cone extension used in (8.8k.4) extends $\mathcal A$ uniquely to a positive real-linear map on Hermitian matrices, then complex-linearly to the full matrix algebra. Consistency extends by spanning. For $0\preceq F\preceq I_E$, define
$$
L_F(X):=\operatorname{tr}_E[(I_S\otimes F)\mathcal A(X)].
$$
This is positive: for $X\succeq0$ and $v\in S$, its quadratic form is $\operatorname{tr}[(|v\rangle\langle v|\otimes F)\mathcal A(X)]\ge0$. The same argument with $I-F$ and consistency give $0\preceq L_F(X)\preceq X$. If $P$ is a rank-one projector, this implies $L_F(P)=c_F(P)P$ with $0\le c_F(P)\le1$. For every orthonormal basis $(P_i)$, linearity gives $L_F(I)=\sum_i c_F(P_i)P_i$. Consequently $L_F(I)$ is diagonal in every orthonormal basis. A Hermitian matrix with this property is scalar: an eigenbasis with two unequal eigenvalues would acquire a nonzero off-diagonal entry after a $45$-degree rotation of their two-dimensional eigenspace. Write $L_F(I)=c_F I$. A basis containing any specified rank-one $P$ now gives $c_F(P)=c_F$. Spectral decomposition and linearity show $L_F(X)=c_F X$ for every $X$.

Set $\tau_E=\operatorname{tr}_S\mathcal A(I/d)$. It is positive of trace one and $c_F=\operatorname{tr}(F\tau_E)$. Hence, for every Hermitian $X$, every Hermitian $B$ on $S$, and every effect $F$ on $E$,
$$
\operatorname{tr}[(B\otimes F)\mathcal A(X)]
=\operatorname{tr}(BX)\operatorname{tr}(F\tau_E).
$$
Effects span the Hermitian algebra on $E$, and product Hermitian matrices span the Hermitian algebra on $S\otimes E$. These equalities therefore identify $\mathcal A(X)=X\otimes\tau_E$. For $d=1$ the statement is immediate and the same proof applies. The converse follows by diagonalizing $\tau_E=\sum_jt_j|j\rangle\langle j|$: the Kraus operators $\sqrt{t_j}(I_S\otimes|j\rangle)$ implement the product assignment. ∎

This is the assignment-map boundary associated with Pechukas's reduced-dynamics analysis (Pechukas 1994); the proof above establishes the finite-dimensional statement used here. In a proposed use of Theorem 8.8m, $E$ must include every preparation-side controller, model, archive and environmental degree that can later interact. The source can meet (8.8m.3.1) by independently preparing a fixed $\tau_E$, or it can retain the correlated memory in the input carrier, or specify a smaller compatibility domain. The second and third choices require their own purification, mixture, reference-setting and hereditary-domain records. Proposition 8.8m.3 supplies none of the independent trace/record calibration (8.8m.1), original-program minimality or physical preparation costs.

<a id="theorem-88m1-reference-steering-classification-of-nonaffine-branch-rules"></a>**Theorem 8.8m.1 (Reference-Steering Classification of Nonaffine Branch Rules).** Let $d,d'\ge1$, let $\psi=|\Psi\rangle\!\langle\Psi|$ be a pure input--reference preparation on $\mathbb C^d\otimes\mathbb C^d_R$ with $\operatorname{tr}_R\psi=I_d/d$, as in (8.8m.2), and let $F:\mathcal D_d\to M_{d'}(\mathbb C)^+$ be one retained output block of a procedure acting on the input wing. A reference setting is a finite POVM $M=(M_i)_{i\in I}$ on $\mathbb C^d_R$ executed before the procedure, with its record $i$ retained separately. It has
$$
p_i^M=\operatorname{tr}\bigl[(I\otimes M_i)\psi\bigr],
\qquad
\rho_i^M=\frac{\operatorname{tr}_R[(I\otimes M_i)\psi]}{p_i^M}\quad(p_i^M>0),
\qquad
\overline F(M)=\sum_{p_i^M>0}p_i^MF(\rho_i^M),
\tag{8.8m.1.1}
$$
where $\overline F(M)$ is the retained block after the reference record is forgotten. Register the following conditions.

- **(SI)** Setting independence: $\overline F(M)=\overline F(M')$ for all finite POVMs $M,M'$ on the reference.
- **(SI$_1$)** Rank-one setting independence: the same identity for all POVMs with rank-one elements.
- **(PF)** Record pushforward: whenever $M'$ refines $M$, with $M_i=\sum_{j\in J_i}M'_j$ for disjoint $J_i$, $p_i^MF(\rho_i^M)=\sum_{j\in J_i}p_j^{M'}F(\rho_j^{M'})$, zero-probability terms omitted.

Then:

1. **Exact steering.** With a Schmidt form $\Psi=d^{-1/2}\sum_re_r\otimes f_r$ and the antiunitary $\theta:\mathbb C^d\to\mathbb C^d_R$, $\theta\sum_rc_re_r=\sum_r\bar c_rf_r$,
$$
\operatorname{tr}_R\bigl[(I\otimes N)\psi\bigr]=\frac1d\,\theta^{-1}N\theta
\qquad(N\in M_d(\mathbb C)^{\mathrm{sa}}).
\tag{8.8m.1.2}
$$
Hence every finite decomposition $I_d/d=\sum_iA_i$ with $A_i\succeq0$ is the unnormalized conditional family $(p_i^M\rho_i^M)_i$ of exactly one POVM, namely $M_i=d\,\theta A_i\theta^{-1}$.
2. **Affine classification.** (SI), (PF) and affinity of $F$ on $\mathcal D_d$ are equivalent. When they hold, $F$ is the restriction of the unique linear map $\Phi$ of (8.8k.4), and $\overline F(M)=\Phi(I_d/d)$ for every setting $M$.
3. **Pure-input classification.** (SI$_1$) holds exactly when the average $\sum_kp_kF(P_k)$ over finite pure ensembles depends only on the barycenter $\sum_kp_kP_k$, equivalently when $F$ agrees on pure states with a unique linear map.
4. **Exact residual classes.** Every nonaffine $F$ violates (SI) and (PF). Either it violates (SI$_1$) and is preparation-sensitive on pure ensembles, or it satisfies (SI$_1$) and is detected by a setting with a mixed conditional state. Both classes are nonempty. For $d=d'=2$, $\Psi=(|00\rangle+|11\rangle)/\sqrt2$ and $z(\rho)=\operatorname{tr}(\rho\sigma_z)$, the normalized positive rule
$$
F_z(\rho)=z(\rho)^2|0\rangle\!\langle0|+\bigl(1-z(\rho)^2\bigr)|1\rangle\!\langle1|
\tag{8.8m.1.3}
$$
has $\overline{F_z}(M_Z)=|0\rangle\!\langle0|$ for $M_Z=(|0\rangle\!\langle0|,|1\rangle\!\langle1|)$ and $\overline{F_z}(M_X)=|1\rangle\!\langle1|$ for $M_X=(|+\rangle\!\langle+|,|-\rangle\!\langle-|)$, at trace distance one. The rule $n$ of (8.8k.10) is the identity on pure states and satisfies (SI$_1$), while the setting $M_{\mathrm{mix}}=(\operatorname{diag}(1,\tfrac13),\operatorname{diag}(0,\tfrac23))$ steers $\operatorname{diag}(\tfrac34,\tfrac14)$ and $|1\rangle\!\langle1|$ with probabilities $\tfrac23$ and $\tfrac13$ and gives
$$
\overline n(M_{\mathrm{mix}})=\operatorname{diag}\!\left(\tfrac35,\tfrac25\right)\ne\tfrac12I_2=\overline n\bigl((I_2)\bigr).
\tag{8.8m.1.4}
$$
5. **Faithfulness is necessary.** If the reference preparation is replaced by a pure state whose input marginal has rank $r<d$, every conditional state lies in the face of density operators supported in that marginal's support, and every rule affine on that face satisfies (SI) and (PF) whatever its values elsewhere. A product reference, with $r=1$, constrains no rule.

Applied blockwise to the retained branches $t_a$ of Theorem 8.8m on its purification $\psi$, (SI) or (PF) supplies the positive affine preparation-extensional branch rules assumed there, when a preparation procedure is a finite ensemble whose output is the average of its members' outputs. The residual preparation-sensitive and mixture-nonaffine branches are therefore classified on the faithful steering branch: they are exactly the rules whose retained output block depends on the reference setting, and (8.8m.1.3) and (8.8m.1.4) populate the two classes.

*Proof.* For $N=|g\rangle\!\langle g|$, $(I\otimes\langle g|)\Psi=d^{-1/2}\sum_r\langle g,f_r\rangle e_r=d^{-1/2}\theta^{-1}g$ and $\theta^{-1}|g\rangle\!\langle g|\theta=|\theta^{-1}g\rangle\!\langle\theta^{-1}g|$; real linearity over rank-one projections gives (8.8m.1.2). The map $N\mapsto d^{-1}\theta^{-1}N\theta$ is an order isomorphism sending $I$ to $I_d/d$, which proves item 1.

If $F$ is affine with linear extension $\Phi$, then $p_i^MF(\rho_i^M)=\Phi(p_i^M\rho_i^M)$, and additivity of $N\mapsto\operatorname{tr}_R[(I\otimes N)\psi]$ gives (PF). Every setting refines the one-outcome setting $(I)$, so (PF) implies (SI). Assume (SI), let $\rho=\mu\sigma_1+(1-\mu)\sigma_2$ with $\sigma_1,\sigma_2\in\mathcal D_d$ and $0<\mu<1$, and put $\lambda=(d\|\rho\|_{\mathrm{op}})^{-1}\in(0,1]$. If $\lambda<1$, set $\tau=(I_d/d-\lambda\rho)/(1-\lambda)\in\mathcal D_d$. Item 1 realizes settings with conditional families $(\lambda\rho,(1-\lambda)\tau)$ and $(\lambda\mu\sigma_1,\lambda(1-\mu)\sigma_2,(1-\lambda)\tau)$, the $\tau$ outcome omitted when $\lambda=1$. (SI) equates their responses; cancelling $(1-\lambda)F(\tau)$ and dividing by $\lambda$ gives $F(\rho)=\mu F(\sigma_1)+(1-\mu)F(\sigma_2)$. The positive-cone construction (8.8k.4) then supplies $\Phi$, and $\overline F(M)=\Phi(\sum_ip_i^M\rho_i^M)=\Phi(I_d/d)$.

For item 3, item 1 realizes every finite pure ensemble of $I_d/d$ by a rank-one setting. The same mixing construction, concatenating pure ensembles of $\rho$ with one pure ensemble of $\tau$, shows that (SI$_1$) makes pure-ensemble averages depend only on the barycenter. The barycentric average is then affine on $\mathcal D_d$ and agrees with $F$ on pure states, (8.8k.4) extends it uniquely, and pure states span $M_d(\mathbb C)$. The converse follows from linearity. For item 4, a nonaffine $F$ violates (SI) and (PF) by item 2; if it satisfies (SI$_1$), a violating pair of settings contains one with an element of rank at least two, whose conditional state is mixed by (8.8m.1.2). With $\theta$ equal to complex conjugation, the settings $M_Z$ and $M_X$ steer $\{|0\rangle,|1\rangle\}$ and $\{|+\rangle,|-\rangle\}$ with equal weights, on which $z^2=1$ and $z^2=0$. For (8.8m.1.4), $\tfrac23\operatorname{diag}(\tfrac34,\tfrac14)+\tfrac13\operatorname{diag}(0,1)=\tfrac12I_2$ and $n(\operatorname{diag}(\tfrac34,\tfrac14))=\operatorname{diag}(\tfrac9{10},\tfrac1{10})$. For item 5, $\operatorname{tr}_R[(I\otimes N)\psi]$ is supported in the support of the input marginal for every $N\succeq0$. ∎

<a id="theorem-88m2-source-derived-current-cut-cp-and-purification-realization"></a>**Theorem 8.8m.2 (Source-Derived Current-Cut CP and Purification Realization).** On the complete formal source of Proposition 8.8g.3 and Construction 8.8g.3.1, the following source-derived current-cut records supply the CP, purification, reference-setting, trace/record and complete finite-compiler outputs. Their complete positive certificate is Theorem 8.8m.4a, by the direct route of Theorem 8.8k. The temporal block-recovery clause of condition 2 of Theorem 8.8m is not among these outputs: Theorem 8.8m.4a proves that no source with complete finite CP coverage populates it. Quadrature/energy calibration and transfer coefficients precede the response table; the source interface, timing, resources and retained labels are part of the domain.

#### 8.8m.2.1 1. Input source and calibration independence

Raw states are nonzero real quadrature vectors $z=q+ip$ in a finite wave bank. Energy is $E_0\lVert z\rVert^{2}$. A calibrated lossless real coupler commutes with the ninety-degree rotation, so its transfer is complex-unitary; a partition of its outputs has blocks $A_{b}$ with $\sum A_b^*A_b=I$. A fresh independent classical uniform rotor $U$ selects exactly one energy interval. The only emitted field is $A_{b}z$, unnormalized; an assigned visible label $a$ groups some internal $b$. Unselected fields, rotor, absolute-energy meters and internal $b$ are sealed and cannot be reopened by any admitted controller. The source permits known finite ensembles, finite real parameter control, all finite such couplers, product mixers with explicit quadrature multiplication, and all finite adaptive grammar trees. Slot times and initial module inventory are fixed public settings. The full physical and energy contract, including idealizations, is in the linked source specification.

Order coordinates are constructed from the normalized-ray moment $R(\mu)=\mathbb{E}[zz^*/\lVert z\rVert^{2}]$. They are fixed by calibrated real quadratures and energy, not by terminal probabilities. Source laws imply $\Pr(b\mid z)=\lVert A_b z\rVert^{2}/\lVert z\rVert^{2}$ by classical interval length. Cancellation of the same norm in the output ray gives the unnormalized branch moment

$$
t_a(R)=\sum_{b:\operatorname{label}(b)=a} A_b R A_b^{*}.
$$

Both the trace/record equality $q_a=\operatorname{Tr}t_a$ and affinity are then proved, not supplied by fitting $q$. A block of zero trace is the zero output; it has no conditional state and no live packet. Duplicate effects retain distinct visible flag registers. Every nonzero packet remains unnormalized, so no singular normalization actuator is required.

Calibration dependency order is therefore:

1. real quadrature and fixed-J convention; energy unit and square-law transfer;
2. deterministic coupler, partition, routing and product-mixer coefficients;
3. independent classical rotor law and sealed port topology;
4. normalized-ray moment, ordered cone, tensor and reference map;
5. derived branch moment and trace/flag identity;
6. derived CP and effect/Born representation.

The arrows never run backward from a terminal table. No Born or quantum pointer law is imported from Definition 27 or the accepted X03 source.

#### 8.8m.2.2 2. Purification and reference settings are populated

For $d$ input modes and $d$ reference modes, prepare one $d^{2}$-bank using the actual known-wave preparation circuit: phase-lock $d$ outputs to the same reference, attenuate each to amplitude $1/\sqrt{d}$, route those outputs to the diagonal ports $(j,j)$, and leave all off-diagonal ports zero. Its normalized raw vector is

$$
v=(1/\sqrt{d}) \sum_j e_j\otimes e_j.
$$

The source quotient is the rank-one matrix $\psi=vv^*$. Partial trace over the reference gives $I_d/d$ by direct coordinate summation. Purity is rank one from a single raw wave, not inferred from a response table. The reference index is isolated during a local procedure: the actual compiled transfer is $A_{b}\otimes I_{d}$, and no command addresses the reference index. These are finite logical tensor wings of the controlled wave bank, not an unclaimed spatially separated experiment.

Every reference POVM $M_{i}$ is source-realized: stack $\sqrt{M_i}$ to make a reference-wing isometry, complete to a lossless unitary, and use the selector on that wing with record $i$ retained. All finite $M_{i}\ge 0$ summing to $I$ are covered by the same compilation theorem. The actual joint raw output is $(I\otimes\sqrt{M_i})v$. Coordinate multiplication gives the input-wing unnormalized moment $M_i^T/d$ and mass $\operatorname{Tr}(M_i)/d$. More generally a different calibrated reference basis produces the antiunitary $\theta$ of 8.8m.1. Here $\theta$ is ordinary complex conjugation in the independently fixed quadrature bases.

For any finite decomposition $I_d/d=\sum_i B_i$ with $B_{i}\ge 0$, the settings $M_i=dB_i^T$ form a POVM and realize precisely that conditional family. Thus the reference is faithful and the setting family is complete; only rank-one settings are not substituted for the full family.

#### 8.8m.2.3 3. One affine current-cut rule on the full joint domain

The source supports every raw joint preparation with moment $X\ge 0$, $\operatorname{Tr}X=1$ on the $d^{2}$-bank, including every product preparation, $\psi$, and their convex hull. Define $H_{a}$ by **execution of the same source occurrence** on that bank: replace every deterministic transfer block $A_{b}$ by $A_{b}\otimes I_{d}$, retain the same visible label $a$, and use one fresh rotor. The same energy-interval calculation gives

$$
H_a(X)=\sum_{b:\operatorname{label}(b)=a}(A_b\otimes I)X(A_b^{*}\otimes I).
\tag{8.8m.2.1}
$$

Equation (8.8m.2.1) is a single formula derived on the whole joint state domain. It is affine, positive block by block, and obeys $H_a(R\otimes S)=t_a(R)\otimes S$. There are no different source tags or different rules for product and purified preparations. Zero-probability branches remain explicit zero blocks. Because the visible flags are latches, no later controller overwrites a previous label. A normalized later instrument gives $\sum_c\Lambda_c(R_h)=\Lambda(R_h)$ and $\sum_c\operatorname{Tr}\Lambda_c(R_h)=\operatorname{Tr}R_h$. Thus classical history weights push forward, but the earlier quantum matrix is not in general recovered. Same-output refinement and the reference-setting sums below are matrix pushforwards at a fixed output; they do not establish the temporal clause of condition 2 of Theorem 8.8m. Theorem 8.8m.4a gives the complete typed proof and the universal reset obstruction.

Applying (8.8m.2.1) to the constructed $\psi$ gives

$$
H_a(\psi)=J(t_a)/d\ge 0.
$$

Every visible Choi block is positive before coarse-graining. The same proof works for every finite spectator dimension, because product-wiring is $A_{b}\otimes I_{r}$. Hence the procedure is CP, including all retained branches. The effect sum is $\sum_a t_a^*(I)=I$ by energy conservation; the independent trace/record calculation gives $q_a(R)=\operatorname{Tr}[R\,t_a^*(I)]$. Complete positivity did not use $q$ to define the Choi map.

#### 8.8m.2.4 4. Setting independence and pushforward

For the implemented reference setting $M$, its retained conditional family is $B_i=M_i^T/d$. The local procedure is affine by the source calculation. Forgetting the reference record gives $\sum_i t_a(B_i)=t_a(I/d)$, independent of $M$. If $M'$ refines $M$, $B_i=\sum_{j\in J_i}B'_j$, and $t_a(B_i)=\sum_{j\in J_i}t_a(B'_j)$. This proves both SI and PF, including mixed conditional states. The finite steering classification 8.8m.1 is reused as a consistency check; it is not assumed to populate the source.

#### 8.8m.2.5 5. Coverage theorem

Induct on the finite source grammar, whose leaves are known preparations, live input ports and fresh rotor modules. Each splitter is an actual calibrated isometry; each mixed preparation is a source random switch; each tensor preparation is the explicit consume-once multiplier circuit; each local spectator extension is replicated coupler wiring; each sequence multiplies transfer blocks; each visible merge sums the corresponding unnormalized moments. Conditional control chooses among independently compiled next occurrences using only already-visible labels. All earlier latches survive. Therefore every admitted finite PU occurrence has one positive affine flagged transformation, one product-compatible spectator rule and the independent trace/record identity. No finite sample of procedures is substituted for this induction.

Conversely any finite CP instrument can be source-compiled by stacking a finite Kraus family and completing its isometry. Thus the grammar is not the identity-plus-entanglement-breaking subtheory or a finite menu lacking coherent filters. For example the coherent rank-two filter diag(1,1,0) is a splitter block, and every nonidentity unitary is a coupler. Reference purity, all settings and branch identities are part of that same source, not an unrelated mathematical expansion.

This proves coverage of every admitted finite procedure of the controlled-wave branch in Construction 8.8g.3.1. Other physical technologies retain their own compiler and response-preservation obligations.

#### 8.8m.2.6 6. Explicit finite negative control: source-side tagged purity repair fails

Let $\tau=I_4/4$; let $P_X^\pm$, $P_Y^\pm$, $P_Z^\pm$ be Pauli eigenprojections. Put

$$
\begin{aligned}
C_X&=(P_X^{+}\otimes P_X^{+} + P_X^{-}\otimes P_X^{-})/2, \\
C_Y&=(P_Y^{+}\otimes P_Y^{-} + P_Y^{-}\otimes P_Y^{+})/2, \\
C_Z&=(P_Z^{+}\otimes P_Z^{+} + P_Z^{-}\otimes P_Z^{-})/2.
\end{aligned}
$$

The Bell projector $\psi=(|00\rangle+|11\rangle)(\langle00|+\langle11|)/2$ satisfies the exact **positive preparation relation**

$$
(\psi+2\tau)/3=(C_X+C_Y+C_Z)/3.
\tag{8.8m.2.2}
$$

It follows by expanding the Pauli products: $\psi=(I\otimes I+X\otimes X-Y\otimes Y+Z\otimes Z)/4$. Each right-hand $C$ is a physical mixture of two product preparations. Take the locally positive branch $t_0=\text{transpose}/2$. On product inputs use $t_{0}\otimes\mathrm{id}$, but attempt to hide the non-CP defect by assigning $H_0(\psi)=\psi/2$. On $\tau$ it must give $\tau/2$. The two sides of (8.8m.2.2) then produce

$$
L=\psi/6+\tau/3,\quad R=F/12+\tau/3,
$$

where $F$ is swap. On the antisymmetric Bell projection $P_-$, $\operatorname{Tr}(P_-L)=1/12$ while $\operatorname{Tr}(P_-R)=0$. The branch weights themselves are both 1/2. Thus an explicit finite same-input preparation relation rejects the tagged repair even when every separately tagged output is positive and normalized. This strengthens the accepted abstract affine-span obstruction with a concrete, all-positive mixing relation.

Separate negative controls retained in the replay are: hiding the non-CP transpose block behind a depolarizing total; replacing the faithful reference by $|00\rangle$; using only rank-one reference settings for the nonlinear rule $\rho^{2}/\operatorname{Tr}\rho^{2}$; and changing a trace-calibrated flag coin to $(3/4,1/4)$ without changing two half-identity branch maps. Each fails a precise gate and is not a whole-owner no-go.

<a id="quantum-current-cut-closure"></a>

<a id="theorem-88m4a-same-source-current-cut-certificate-and-exact-temporal-recovery-obstruction"></a>**Theorem 8.8m.4a (Same-Source Current-Cut Certificate and Exact Temporal-Recovery Obstruction).** Keep the controlled-wave source of Proposition 8.8g.3 and Construction 8.8g.3.1, including the CSW-P task, presentation, retained physical cut, finite services and initial inventories, unchanged. The complete current-cut CP, purification, reference-setting and classical-history certificate is positive. The additional requirement that every normalized later continuation recover the earlier quantum matrix is incompatible with the same full CP-process coverage. Accordingly the strict conjunction of full CP-process coverage with temporal recovery is refuted, while the current-cut source outputs and the causal-process certificate of Theorem 8.8j.1 hold, as proved below. The conditional implication of Theorem 8.8m is unaffected.

Here is the source and scope needed for both assertions. A finite bank has real calibrated quadratures, written as a nonzero vector $z=q+ip$, square-law signal energy $E_0\|z\|^2$, and normalized-ray moment $P(z)=zz^*/\|z\|^2$. A finite raw mixture $\mu=\{p_l,z_l\}$ represents $R(\mu)=\sum_l p_lP(z_l)$. All finite known preparations are admitted. Each splitter has independently calibrated rectangular blocks $A_b$ with $\sum_b A_b^*A_b=I$; a fresh independent classical uniform rotor selects the interval of length $\|A_bz\|^2/\|z\|^2$ and routes only $A_bz$, unchanged. Visible labels may group internal branches. Lossless couplers, consume-once product mixers with transfer $z,w\mapsto z\otimes w$, known joint preparations, spectator identities, sequence, visible merging and visible-history-controlled choices generate the finite acyclic grammar. When several input banks are present their joint carrier is used; no live unknown input is copied.

The actual retained outputs are the selected bank, write-once classical labels and declared common post-preparation experiment controls, occurrence identities, slots and inventory. Construction 8.8g.3.1 already makes preparation-recipe commands, raw-energy settings and the mixture-switch setting/index source-owned and unreadable downstream; rotors, discarded fields and source stores have the original sealed consume-once routing. This does not seal public experiment parameters: program identities and known control commands index the chosen conditional response law, and every actually emitted program or preparation tag is retained and must be compared. Every specified finite experiment pays its own finite controls, slots, fresh modules and stock. No uniform finite budget for an infinite menu, readable environment, quantum history archive or new operation is added. These are the existing ideal source laws, not an empirical assertion of manufactured hardware.

For a visible history $h$, let $\mathcal H_h$ be its current selected-bank carrier, let $K_\beta$ be the product of calibrated transfer blocks along microscopic path $\beta$, and retain every accessible memory in the current carrier. Sums of states below are taken in a common output algebra; distinct output types remain in their declared direct sum.

1. **Current-cut source and retained-Choi certificate.** For every admitted finite procedure and visible history,
   $$
   \Phi_h(R)=\sum_{\beta\mapsto h}K_\beta R K_\beta^*,
   \qquad q(h\mid R)=\operatorname{tr}\Phi_h(R).
   \tag{8.8m.4a.1}
   $$
   The rule is preparation-extensional and affine on the full independently calibrated density domain. Its extension to every finite spectator is the same occurrence with $K_\beta\otimes I_r$, positive on the entire joint PSD cone. Every complete terminal family is a normalized outcome-labeled CP instrument. The source prepares
   $$
   v_d=\frac1{\sqrt d}\sum_{j=0}^{d-1}e_j\otimes e_j,
   \quad\psi_d=v_dv_d^*,\quad\operatorname{tr}_R\psi_d=I_d/d,
   \quad(\Phi_h\otimes\operatorname{id}_d)(\psi_d)=J(\Phi_h)/d\succeq0.
   \tag{8.8m.4a.2}
   $$
   Thus all four gates of the direct retained-Choi route of Theorem 8.8k are physically populated on this source before an effect table is derived. Each label is separately retained through the positivity check. Its effect is $E_h=\Phi_h^*(I)$, with $q(h\mid R)=\operatorname{tr}(RE_h)$ and $\sum_hE_h=I$ for complete terminal labels. Zero-effect labels have zero maps; every zero-mass branch has no conditional state. Distinct labels with equal effects remain distinct.

2. **Reference setting and same-output refinement.** Every finite reference POVM $M=(M_i)_i$ is realized on the actual preparation $\psi_d$ and steers the input-wing unnormalized family $B_i=M_i^{\mathsf T}/d$. Conversely every finite PSD decomposition $\sum_iB_i=I_d/d$ occurs, including mixed conditional states. For a fixed local branch $\Phi$,
   $$
   \sum_i\Phi(B_i)=\Phi(I_d/d),\qquad
   B_i=\sum_{j\in J_i}B'_j\Longrightarrow
   \Phi(B_i)=\sum_{j\in J_i}\Phi(B'_j).
   \tag{8.8m.4a.3}
   $$
   Independently, refinement of one fixed instrument into same-output labeled maps has $\Phi_a=\sum_b\Phi_{ab}$, hence $\Phi_a(R)=\sum_b\Phi_{ab}(R)$, also after every spectator. These are matrix-valued pushforwards at a fixed output type, not temporal recovery.

3. **Temporal law and the complete causal-process certificate.** At a current history with block $R_h\succeq0$, a normalized later instrument $\{\Lambda_{c\mid h}:M(\mathcal H_h)\to M(\mathcal K_h)\}_c$ gives
   $$
   R_{hc}=\Lambda_{c\mid h}(R_h),\qquad
   \sum_cR_{hc}=\Lambda_h(R_h),\quad
   \Lambda_h=\sum_c\Lambda_{c\mid h},\qquad
   \sum_c\operatorname{tr}R_{hc}=\operatorname{tr}R_h.
   \tag{8.8m.4a.4}
   $$
   Only the trace equality follows from normalization; $\Lambda_h(R_h)=R_h$ does not. Iterating the trace equality proves every finite classical-history marginal. A literal write-once prefix has the same flag marginal under every exogenous normalized later choice in the admitted grammar. Equal complete outcome-labeled maps, with common side ledgers, give equal terminal laws and conditional future response quotients. Every binary-first factorization of Theorem 8.8j is source-compiled with its actual common prefix and controlled kernel fillers. These facts prove that theorem's leafwise extensionality, classical history pushforward and retained-prefix causality on the entire source, and therefore give the complete causal-process certificate of Theorem 8.8j.1. An isolated spectator is retained in the current joint carrier throughout; only its marginal, not the full earlier joint block, is necessarily unchanged by a normalized local continuation.

4. **Complete coverage on the same source.** The statements above cover every finite grammar tree, not a sample of protocols. Conversely every finite CP instrument is realized by the existing lossless-block compiler. The qualifying code-101 eight-mode CSW-P task, its exact presentation and bounded prefix census, original schedules, consume-once wiring and readiness/resource records are the same ones in Construction 8.8g.3.1. The negative result below uses this task with its own outputs, services and slots.

5. **Strict conjunction with temporal recovery.** Let $\mathcal B$ be the class with the original independently calibrated full complex density carriers and PSD composites, original retained cut and source/task fields, and exact outcome-labeled realization of every finite CP instrument on that domain. Include the positive preparation, purification, reference and trace/record outputs above; do **not** include temporal recovery in the background. Let $H$ be the additional literal requirement in Theorem 8.8m condition 2: every registered refinement or later continuation preserves each earlier positive labeled block and pushes forward to it when later records are forgotten. For this temporal part, even allowing an arbitrary single-valued recovery function of the complete later flagged retained state cannot repair the requirement. Then
   $$
   \mathcal B\ne\varnothing,\qquad
   \forall S\in\mathcal B\ (d\ge2\Longrightarrow\neg H(S)).
   \tag{8.8m.4a.5}
   $$
   The original eight-mode member is included directly. Population of the whole-domain hereditary rule of condition 2, including $H$, together with full process coverage is the strict existential conjunction $\exists S\in\mathcal B:H(S)$, which is therefore refuted. The positive CP/source outputs follow by the direct route of Theorem 8.8k, which does not use $H$.

*Proof.* We give the positive certificate and the coverage-complete obstruction separately.

**Source calibration and complete current-state quotient.** For every nonzero selected output, the rotor interval law gives
$$
\Pr(b\mid z)P(A_bz)
=\frac{\|A_bz\|^2}{\|z\|^2}
  \frac{A_bzz^*A_b^*}{\|A_bz\|^2}
=A_bP(z)A_b^*.
\tag{8.8m.4a.6}
$$
A zero-energy branch has probability zero and contributes the zero block, so no conditional projector is assigned there. Averaging over any raw preparation and grouping visible labels yields the same linear congruence sum for every representative of $R$. Its trace is the actual latch probability, derived from interval length rather than a Born-table fit. Every density matrix occurs by a spectral finite mixture of normalized known waves. The binary splitter $\sqrt E,\sqrt{I-E}$ realizes every $0\preceq E\preceq I$. Rank-one tests separate Hermitian matrices: coordinate tests give diagonal entries, and projectors on $(e_i+e_j)/\sqrt2$ and $(e_i+ie_j)/\sqrt2$ give real and imaginary off-diagonal entries. Equal moments therefore have equal responses to every admitted continuation, and unequal moments are separated by an admitted test. Positive scaling gives the full PSD cone, trace gives its normalization, and rank-one quadratic forms identify the dual cone. These are independently calibrated ordered carriers, not response-defined Choi shadows.

Known joint settings give every density matrix on the joint bank. The consume-once product transfer gives $P(z\otimes w)=P(z)\otimes P(w)$, and averaging independent preparations gives $R\otimes S$; correlated preparations use their actual joint moment instead. Product Hermitian bases span the joint Hermitian algebra, so the composite is locally tomographic with the full PSD order. Local physical wiring uses $A_b\otimes I_r$ for every finite $r$, not just on product inputs. Each retained joint output is consequently a sum of PSD congruences on every $X\succeq0$. This proves full spectator positivity and a single preparation-extensional affine current-cut rule, including the entire product-plus-purification domain of Theorem 8.8m.

**Induction, normalization and Choi population.** Equation (8.8m.4a.6) iterates along every microscopic path: multiplication of conditional interval probabilities cancels successive norms and gives $K_\beta P(z)K_\beta^*$. Sequence multiplies transfer matrices, visible merging sums their current blocks, and conditional control selects a fixed calibrated next family from the already visible history. Known preparation and mixture introduce their specified moments; independent ancilla preparation adjoins its fixed moment, and tensor wiring uses the joint input carrier. These facts prove (8.8m.4a.1) by induction over all generators of every finite tree. They do not identify evolved matrices at distinct cuts. At each node, cyclicity and $\sum_bA_b^*A_b=I$ imply $\sum_b\operatorname{tr}(A_bRA_b^*)=\operatorname{tr}R$. Repeating that identity to the finite leaves proves terminal normalization and $\sum_h\Phi_h^*(I)=I$. The independent latch calculation supplies the trace/record link.

The known joint-wave circuit phase-locks $d$ diagonal ports, each of amplitude $1/\sqrt d$, leaving the others zero. This physically prepares $v_d$; its projector has rank one, and coordinate partial trace gives $I_d/d$. Execution of the same local procedure has transfers $K_\beta\otimes I_d$. Its retained output is exactly $J(\Phi_h)/d$ by expansion of $v_dv_d^*$. Each such block is positive before forgetting any label. This establishes all four independent gates of 8.8k: calibrated ordered carriers and prepared Choi input; branch affinity/extensionality; retained classical trace normalization; and the physically identified positive retained-flag Choi state. Equivalently, the displayed Kraus congruences directly prove complete positivity. No temporal clause of 8.8m has been used. Duality yields the stated effect formula, including zero and duplicate-effect cases.

**Reference settings.** Stack the blocks $\sqrt{M_i}$ of any finite POVM into an isometry, complete its columns to a unitary, and apply the source partition and selector on the reference wing. Its actual branch vector is $(I\otimes\sqrt{M_i})v_d$. Taking the input-wing unnormalized moment gives $M_i^{\mathsf T}/d$, by summing the reference coordinates. Conversely $M_i=dB_i^{\mathsf T}$ are positive and sum to $I$ for every decomposition of $I_d/d$. Thus all settings, not only rank-one settings, are present. Linearity gives both identities in (8.8m.4a.3). Same-output instrument refinement is the sum of its actual fine labeled maps in one algebra. Neither operation evolves the retained local output to a new time and identifies it with its predecessor.

**Temporal histories and binary-first processes.** Composition gives the first two equations of (8.8m.4a.4). If the continuation has Kraus blocks $C_{c\gamma}$, its normalization is $\sum_{c,\gamma}C_{c\gamma}^*C_{c\gamma}=I$, and hence
$$
\sum_{c,\gamma}\operatorname{tr}(C_{c\gamma}R_hC_{c\gamma}^*)
=\operatorname{tr}\!\left(R_h\sum_{c,\gamma}C_{c\gamma}^*C_{c\gamma}\right)
=\operatorname{tr}R_h.
$$
This proves classical history pushforward by finite induction. It remains true on the full reachable branch carrier, with any accessible memory included, and after an idle spectator extension. For an isolated reference, testing every reference observable in the same calculation proves $\operatorname{tr}_{\mathcal K_h}\sum_c(\Lambda_{c\mid h}\otimes\operatorname{id})(X)=\operatorname{tr}_{\mathcal H_h}X$. This is preservation of the reference marginal, not of $X$.

A prefix flag depends only on the original input, fixed prefix coefficients and its own fresh rotor. A later exogenous setting has no wire into those inputs and does not change their law. Thus the flag's marginal is independent of that choice; conditioning on a subsequent outcome is a different operation. Outcome-labeled Choi equality determines every linear branch map by expansion in matrix units. Equal current branch maps therefore give equal label laws and equal responses under every common future composition. The comparison retains accessible memory and common public timing, control and inventory coordinates, so no omitted side channel is used to infer extensionality.

For completeness, for an arbitrary pointed instrument with blocks $A_{k\alpha}$ set $E=\sum_\alpha A_{i\alpha}^*A_{i\alpha}$ and $D=I-E$. Its literal common prefix has blocks $\sqrt E,\sqrt D$. On their support projections $P_E,P_D$ put $C_{i\alpha}=A_{i\alpha}E^{\ominus1/2}$ and $C_{k\alpha}=A_{k\alpha}D^{\ominus1/2}$ for $k\ne i$. The zero quadratic form on a kernel implies $A_{i\alpha}=A_{i\alpha}P_E$ and $A_{k\alpha}=A_{k\alpha}P_D$. Hence the two continuation sums are $P_E,P_D$ and
$$
C_{i\alpha}\sqrt E=A_{i\alpha},\qquad
C_{k\alpha}\sqrt D=A_{k\alpha}.
$$
Add $|f\rangle\langle u_j|$ blocks for an orthonormal basis of each complementary kernel and fixed output unit vector $f$. Their squares sum to the kernel projection and they vanish after the corresponding prefix. Thus both continuation families are normalized and physically compiled, with exactly the original flattened labeled maps on all reachable states. A zero prefix remains a zero leaf with no conditional state. Equal effects use the same prefix program, slot, wiring and fresh-rotor law. The terminal event $i$ is its prefix-one cylinder, so classical history pushforward and prefix causality give the same effect weight for any pointed occurrence with that effect. This proves all process outputs of Theorem 8.8j.1 without quantum matrix recovery.

**Full compiler and original task.** For any finite normalized Kraus family, the column stack of all its blocks is an isometry because its adjoint times itself is $I$. Complete those columns to a unitary on a finite enlarged bank; append the existing zero modes, use the lossless coupler, and partition/select its output blocks, grouping their given visible labels. This compiles the entire finite CP-instrument family, including reset, coherent filters and nonidentity unitaries. Every such circuit and every finite adaptive composition uses the original grammar and finite paid resources. The full grammar induction above supplies the reverse inclusion. Calibration always runs from quadratures, energy, transfer and rotor law to moments, branch weights and finally effects, never backward from a desired terminal table.

The CSW-P task is the eight-mode four-slot prediction/verification/update circuit of Construction 8.8g.3.1 in its two-cycle window. Its initialized program 101 updates the model to the observed bit and has conditional next-forecast accuracy $3/4$; the null intervention has accuracy $1/2$. The declared short-program census is $00,01,100,101$: the first two lack the adaptive update, 100 has conditional accuracy $1/4$, and all other halting source programs have length at least four, so the presentation-relative minimum is three. The eight sharp responses, the bias-resistor law $Q_{\rm ready}(n)=2nV_b^2T/R_b$ and the strict larger-bank gap are those of Construction 8.8g.3.1. These source and task conclusions use neither temporal matrix preservation nor a historical lift. The counterexample below is a separate admitted finite test of the very same eight-mode carrier and full compiler, not a modification of the task's slots, services or outputs. This also supplies a nonempty background $\mathcal B$ independently of $H$.

**Universal obstruction on the nonempty background.** Fix any $d\ge2$ and use the normalized instrument
$$
C_j=|0\rangle\langle j|\quad(0\le j<d),\qquad
\sum_jC_j^*C_j=I_d,\qquad
\sum_j C_jXC_j^*=\operatorname{tr}(X)P_0,
\quad P_0=|0\rangle\langle0|.
\tag{8.8m.4a.7}
$$
Every member of $\mathcal B$ realizes these exact outcome-labeled maps, by its full finite CP coverage. Choose an identity prefix, the same earlier flag, controller, subsequent settings, clock and padded initial inventory. On $R=I_d/d$, forgetting later labels while retaining the later bank gives $P_0\ne I_d/d$. The traces agree, but the original temporal block identity fails on a domain element required in every candidate. Tensoring any fixed idle spectator state $S$ gives $P_0\otimes S\ne (I_d/d)\otimes S$, within the product part of the original joint domain.

Nor can the complete later flagged state recover the input. Put
$$
|\pm\rangle=(|0\rangle\pm|1\rangle)/\sqrt2,\qquad
P_\pm=|\pm\rangle\langle\pm|,
$$
so $P_+\ne P_-$. Direct multiplication gives
$$
C_jP_+C_j^*=C_jP_-C_j^*
=\begin{cases}P_0/2,&j=0,1,\\0,&2\le j<d.\end{cases}
\tag{8.8m.4a.8}
$$
Consequently the two complete later retained direct-sum states are identical, with the same earlier flags and all common public coordinates. This is a comparison of the one fixed continuation output map $\mathcal F(X)=\bigoplus_j C_jXC_j^*$ on two inputs, with its process controls, spectator and public side ledger held fixed. It does not omit an actually emitted distinguishing tag. The input argument $X$ specifies which state is supplied; it is not an additional emitted recovery output. The equality still holds after tensoring the same spectator. No function of these output data, linear, nonlinear, CP or otherwise, can return both distinct earlier matrices. For the original $d_0=8$ carrier, take all eight blocks of (8.8m.4a.7); (8.8m.4a.8) has exactly two nonzero and six zero blocks. This is an eight-mode witness, not an appeal to an unavailable stand-alone qubit. The existing cut supplies no downstream recipe label encoding which input was prepared. Adding such an output, a readable discarded environment or a copy of the earlier state changes the retained map; giving the recovery function $X$ itself would change its input rather than recover $X$ from $\mathcal F(X)$. None of these changes repairs the stipulated process, and the literal matrix-identity failure above does not rely on any attempted recovery construction.

An alternative raw-path definition does not repair the quotient. In the two-dimensional sector, the admitted ensembles $\mu_Z=\{e_0,e_1\}/2$ and $\mu_X=\{+, -\}/2$ both have moment $I_2/2$. After a later $Z$ selector, define a proposed historical block by weighting the **earlier** projectors with the future event 0. For $\mu_Z$ it is $P_0/2$; for $\mu_X$ it is $(P_++P_-)/4=I_2/4$. Their traces agree and summing over future events recovers the earlier moment, but the eventwise historical blocks differ for two preparations identified by the original quotient. Thus this lift is not one preparation-extensional affine map of $R$. The same ensembles embed in the first two coordinates of the eight-mode bank. A formal restriction of a tree to its earlier prefix is likewise a restriction of a process description, not recovery from the actual later output. Rectangular continuations make the typing issue even sharper: $C_0=\langle0|,C_1=\langle1|$ send $I_2/2$ to scalar 1 when summed, not to a matrix on the earlier two-dimensional carrier.

The proof is universal over $\mathcal B$: each candidate must contain the finite reset witness, and the same full-domain contradiction applies to it. It is not a failed search or failure of only one proposed construction. Since the positive source proof supplies $\mathcal B\ne\varnothing$ without assuming $H$, the contradiction is in the requested additional output, not in an invalid or empty background packet. The satisfying set for the strict conjunction is empty; that fact concerns exactly the conjunction, not arbitrary physical theories, scalar carriers or restricted continuation families. This proves (8.8m.4a.5) and the claimed original-scope negative polarity. ∎

**Scope of the history law.** Equation (8.8m.4a.4) is the history law used in Theorem 8.8j.1 and in Theorem 8.8m.2: it preserves classical masses, not quantum matrices. Theorem 8.8m holds as a conditional theorem with its temporal premise; its CP proof uses the single-domain affine rule and positive Choi blocks, not temporal recovery. Theorem 8.8m.1 concerns reference settings at a fixed local output, and Proposition 8.8m.3 concerns a present-carrier assignment. The conditional statement of Theorem 8.8m does not show that a full-process source populates $H$.

The identity-plus-entanglement-breaking subtheory (8.8l.11) contains the reset instrument, so it does not populate the temporal premise of Theorem 8.8m. It supplies the stated current-cut CP, affinity, purification and trace records, and its complete-local-effect versus proper-process-menu boundary holds by Theorems 8.8k--8.8l. The separable, nonfaithful-reference, side-tag, hidden-flag and trace-link witnesses establish their stated single-time defects; they are not models of the full temporal conjunction.
