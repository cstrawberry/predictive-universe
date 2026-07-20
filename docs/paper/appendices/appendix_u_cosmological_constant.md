# Appendix U: Cosmological Constant and Primordial Sector from Golay-Steiner Structure

## U.1 Introduction

The cosmological constant $\Lambda$ and primordial perturbation amplitude $Q$ represent the two fundamental scales of cosmology. Observationally:

$$\Lambda L_P^2 = (2.86599 \pm 0.04849)\times 10^{-122}, \qquad Q \sim 10^{-5}$$

where $L_P$ is the Planck length. The cosmological constant constitutes the largest hierarchy in physics; the primordial amplitude sets the scale of structure formation.

In the Predictive Universe framework, both scales are organized by the information-theoretic structure of the Extended Binary Golay Code $\mathcal{G}_{24}$. The vacuum sector is modeled by the configuration space $\text{Gr}_\mathbb{C}(12,24)$ and the primordial sector by the signal subspace $\mathbb{CP}^{11}$. The Appendix U vacuum discussion is a **reference semiclassical scheme**: it introduces a reference exponent $\kappa_{\mathrm{ref}}$ and a convention-dependent prefactor $A_{\text{eff}}$ for the vacuum weight,
$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \, e^{-2\kappa_{\mathrm{ref}}}, \qquad Q^2 = \frac{1}{2} A_Q \, e^{-2\kappa_Q}$$
with $A_{\text{eff}}$ and $A_Q$ dimensionless $O(1)$ prefactors. For the vacuum sector:
$$A_{\text{eff}} := K \cdot N_{\text{eff}}$$
Here $K$ is the one-loop determinant ratio from Gaussian fluctuations around the bounce, and $N_{\text{eff}}$ is the polynomial extensivity factor from Appendix E. Corollary U.15b supplies two distinct statements: an algebraic observational inversion giving $A_{\text{eff}}^{(\text{obs})}$, and the Appendix U working value $A_{\text{eff}} = 0.923 \pm 0.011$ obtained only after adopting the transferred determinant convention from Appendix T.

This appendix derives the Grassmannian base count and the primordial complexity $\kappa_Q = 11$ from the stated geometric inputs. The vacuum value $\kappa_{\mathrm{ref}} = 141.5$ is the Appendix U reference exponent under the leading-order five-mode counting convention introduced in Theorems U.15-U.16. Theorem U.8c below shows that the pure-coordinate dilatation tangent has strictly negative Hessian quadratic form and is not in the Hessian kernel for the current Definition U.4 continuum action; it does not establish that the tangent is an eigenvector. The five-mode branch therefore remains a reference convention rather than a theorem-level vacuum closure inside the present continuum setup. Theorem U.13 proves, under its sampled-sector exactness hypothesis, that the sampled translation+dilatation restriction of the discrete Hessian has no fifth zero mode. Proposition U.13a and Corollary U.13a.1 then identify the exact sampled angular spectrum, and Theorem U.13b closes the corrected full discrete problem under the explicit false-vacuum spectral hypotheses stated there. Within those hypotheses the corresponding four-mode branch value is $\kappa = 142$. The arithmetic of the four-mode exponent is exact once the Hessian nullity is fixed, but the nullity is not fixed by finite automorphism groups or dimension counting alone. Promotion of the four-mode exponent row must retain the U.13b false-vacuum spectral hypotheses or replace them with an accepted no-extra-zero-mode certificate entered before comparison. Promotion of the corresponding numerical $\Lambda$ row further requires the Fredholm and prefactor certificates of U.15d, U.15e, and U.15m before comparison.

---

## U.2 Framework Constants

The following results and branch data are imported from elsewhere in the framework:

| Symbol | Value | Definition | Source |
|--------|-------|------------|--------|
| $\varepsilon_0$ | $\ln 2$ | Structural log-cardinality of the registered binary verification quotient | Definition 28; Lemma J.1 |
| $\varepsilon_{\mathrm{phys}}$ | $\ge H_q(P\mid R)$ on a registered reset branch | Physical reset cost including overhead; a positive floor needs an ensemble bound | Theorem 31 |
| $K_0$ | 3 | Minimal self-referential bits | Theorem 15 |
| $N_{\mathrm{vis}}^{\min}$ | $2^{K_0} = 8$ | Minimal faithful visited-context count | Theorem 15 |
| $d_0$ | $8$ | Minimal MPU Hilbert-carrier dimension after saturation | Theorem 23; Theorem Z.2 |
| $a$ | sharp match/mismatch active record plus minimal integer with $\ln a\ge\varepsilon_0$, hence $2$ | Active kernel dimension | Theorem Z.1 |
| $b$ | $d_0 - a = 6$ | Inactive subspace dimension | Definition |
| $M$ | $2ab = 24$ | Interface modes | Theorem Z.5 |
| $D$ | 4 | Emergent spacetime dimension | Theorem Z.11 |
| $C_{\max}/\varepsilon_0$ | 2 | PCE capacity ratio | Appendix Q |

**Proposition U.2b (Reflexive Vacuum-Weight Accounting).**
Let
$$
w_\Lambda:=\frac{\Lambda L_P^2}{8\pi}.
\tag{U.2b.1}
$$
On an accepted Appendix U vacuum certificate using the Appendix U prefactor convention, write
$$
w_\Lambda=A_{\text{eff}}e^{-I_{\mathrm{vac}}},
\tag{U.2b.2}
$$
where $I_{\mathrm{vac}}=2\kappa_{\mathrm{ref}}$ on the reference five-mode convention and $I_{\mathrm{vac}}$ denotes the corresponding accepted branch exponent on any other Appendix U vacuum branch. If the same finite certificate decomposes the Euclidean vacuum-transition action into a reduced non-reflexive contribution and the finite reflexive exhaust ledger of Theorem J.4a,
$$
I_{\mathrm{vac}}
=
I_{\mathrm{red}}
+
\mathcal X_{\mathrm{ref}},
\qquad
\mathcal X_{\mathrm{ref}}
=
N_{\mathrm{ref}}\ln2+\mathcal X_{\mathrm{diss}},
\qquad
\mathcal X_{\mathrm{diss}}\ge0,
\tag{U.2b.3}
$$
then
$$
w_\Lambda
=
A_{\text{eff}}e^{-I_{\mathrm{red}}}
2^{-N_{\mathrm{ref}}}
e^{-\mathcal X_{\mathrm{diss}}}.
\tag{U.2b.4}
$$
Thus the reflexive contribution enters the vacuum weight only as a finite action-budget factor already counted inside the accepted instanton/Fredholm certificate. It is not an independent zero-point-energy sum and it cannot introduce an additional unconstrained positive vacuum density outside the Appendix U prefactor-and-exponent ledger.

*Proof.* Substitute (U.2b.3) into (U.2b.2):
$$
w_\Lambda
=
A_{\text{eff}}
\exp[-I_{\mathrm{red}}-N_{\mathrm{ref}}\ln2-\mathcal X_{\mathrm{diss}}].
$$
Since $\exp[-N_{\mathrm{ref}}\ln2]=2^{-N_{\mathrm{ref}}}$, this is (U.2b.4). The nonnegative dissipative part can only multiply the vacuum weight by $e^{-\mathcal X_{\mathrm{diss}}}\le1$. Every factor in (U.2b.4) is part of the finite accepted certificate: $I_{\mathrm{red}}$, $N_{\mathrm{ref}}$, $\mathcal X_{\mathrm{diss}}$, and $A_{\text{eff}}$. Therefore the reflexive exhaust ledger supplies finite vacuum-weight accounting, not a second independent cosmological-constant source. ∎

---

## U.3 The Golay Code and Steiner System

### U.3.1 Code Parameters

The Extended Binary Golay Code $\mathcal{G}_{24}$ is a binary linear code with:

- Length $n = M = 24$
- Dimension $k = 12$
- Minimum distance $d_{\min} = 8 = d_0$
- Type-II properties: doubly-even self-duality $\mathcal G_{24}=\mathcal G_{24}^{\perp}$

**Theorem U.1 (Binary $[24,12,8]$ Golay Uniqueness).** Every binary linear $[24,12,8]$ code is equivalent to the extended binary Golay code under a permutation of the $24$ coordinates. Consequently every code in this parameter class is Type II; doubly-even self-duality is a property of the classified equivalence class, not an additional premise of the classification.

*Proof.* Apply the classification theorem of Pless (1968), together with the stronger classification of Delsarte and Goethals (1975), to a binary linear code $C\subseteq\mathbb F_2^{24}$ of dimension $12$ and minimum distance $8$. The classification conclusion is that there is one coordinate-permutation equivalence class with these parameters, represented by $\mathcal G_{24}$. Because coordinate permutations preserve the inner product and Hamming weights, the self-dual and doubly-even properties of $\mathcal G_{24}$ hold for every representative of the class. The conclusion is coordinate equivalence; it does not identify distinct coordinate-permuted generator matrices as literally equal subsets of a labeled ambient space. ∎

### U.3.2 Octad Structure

The weight-$8$ codewords of $\mathcal G_{24}$ are called **octads**. Each octad is the support $O\subset\{1,\ldots,24\}$ of a weight-$8$ codeword.

**Theorem U.2 (Steiner System).** The $759$ octads of the extended binary Golay code form the Steiner system $S(5,8,24)$: every $5$-element subset of $\{1,\ldots,24\}$ is contained in exactly one octad.

*Proof.* The Type-II weight enumerator of the extended Golay code, recorded by MacWilliams and Sloane (1977), is
$$
W_{\mathcal G_{24}}(x,y)
=x^{24}+759x^{16}y^8+2576x^{12}y^{12}
+759x^8y^{16}+y^{24}.
$$
Thus there are $b=759$ weight-$8$ supports. The code is self-dual with minimum distance $d=8$, and its nonzero dual weights not exceeding $24-5=19$ are $8,12,16$. Their number is $s=3=d-5$. Therefore the Assmus–Mattson design theorem (Assmus and Mattson, 1969) applies with $t=5$ and implies that the supports of the weight-$8$ codewords form a $5$-design.

If $\lambda$ is the number of octads through a given $5$-subset, double-count the pairs $(S,O)$ with $|S|=5$, $|O|=8$, and $S\subset O$. Counting first by octads and then by $5$-subsets gives
$$
b\binom85
=\lambda\binom{24}{5}.
$$
Since
$$
759\binom85
=759\cdot56
=42504
=\binom{24}{5},
$$
one has $\lambda=1$. Hence every $5$-subset lies in exactly one octad, which is precisely $S(5,8,24)$. ∎

The Steiner system parameters are:

| Parameter | Formula | Value |
|-----------|---------|-------|
| $v$ (points) | $M$ | 24 |
| $k_{\text{block}}$ (block size) | $d_0$ | 8 |
| $t$ (design strength) | — | 5 |
| $b$ (blocks) | $\binom{v}{t}/\binom{k_{\text{block}}}{t}$ | 759 |
| $r$ (blocks per point) | $bk_{\text{block}}/v$ | 253 |
| $\lambda$ (pairs per block) | $r(k_{\text{block}}-1)/(v-1)$ | 77 |

**Corollary U.2a (Pair Multiplicity).** For the Steiner system $S(5,8,24)$, every pair of points lies in exactly
$$
\lambda = \frac{\binom{24-2}{5-2}}{\binom{8-2}{5-2}} = \frac{\binom{22}{3}}{\binom{6}{3}} = 77
$$
octads.

*Proof.* Since Theorem U.2 identifies the octads with the Steiner system $S(5,8,24)$, every 5-subset lies in exactly one block. For a Steiner system $S(t,k,v)$, the number of blocks through a fixed $s$-subset is
$$
\lambda_s = \frac{\binom{v-s}{t-s}}{\binom{k-s}{t-s}}
$$
for $0 \le s \le t$. Setting $(t,k,v,s)=(5,8,24,2)$ gives
$$
\lambda = \lambda_2 = \frac{\binom{22}{3}}{\binom{6}{3}} = \frac{1540}{20} = 77.
$$
This agrees with the parameter table above. ∎

---

## U.4 The Configuration Space


### U.4.1 Grassmannian Bound

Vacuum fluctuations correspond to deformations of the code subspace. The space of all $k$-dimensional complex subspaces of the $M$-dimensional Hilbert space $\mathbb{C}^M$ is the complex Grassmannian:

$$\mathcal{M} = \text{Gr}_{\mathbb{C}}(k, M)$$

**Theorem U.3 (Configuration Dimension on the Predictive-Recovery MacWilliams Golay Branch).** On the predictive-recovery MacWilliams Golay branch (Definition Z.13b.0; Theorem Z.13b.0a; Theorem Z.13b; Theorem P.13.12; Theorem R.4.4; Proposition T.1c),
$$
\dim_{\mathbb C}\operatorname{Gr}_{\mathbb C}(12,24)
=k(M-k)
=12\cdot12
=144.
$$
Under the exponent-counting convention of Convention U.14a, which identifies the base instanton complexity with this complex normal-direction count, one consequently has $\kappa_0=144$.

Here $M=24$ is the QFI interface-mode count of Theorem Z.5 and $k=12$ is the code dimension supplied by Definition Z.13b.0 and Theorem Z.13b.0a. For a branch with another value of $k$, the geometric dimension is $k(M-k)$; assigning that number to $\kappa_0$ still requires Convention U.14a.

*Proof.* Let $V_0\subset\mathbb C^M$ be a $k$-dimensional subspace and choose a complement $W_0$ with $\mathbb C^M=V_0\oplus W_0$. Every $k$-plane $V$ transverse to $W_0$ is the graph of a unique complex-linear map
$$
T:V_0\longrightarrow W_0,
\qquad
V=\{v+T(v):v\in V_0\}.
$$
Conversely, every $T\in\operatorname{Hom}_{\mathbb C}(V_0,W_0)$ defines such a transverse $k$-plane. These graph maps give a complex coordinate chart around $V_0$ with model space
$$
\operatorname{Hom}_{\mathbb C}(V_0,W_0)
\cong\mathbb C^{(M-k)\times k}.
$$
Hence every chart has complex dimension $k(M-k)$. Substitution of $M=24$ and $k=12$ gives $12(24-12)=144$. Convention U.14a then assigns this count to $\kappa_0$ on its declared exponent-counting branch. ∎

**Remark U.3a: Complex vs Real Dimensions.** The complex Grassmannian $\text{Gr}_{\mathbb{C}}(k, M)$ is a complex manifold of complex dimension $k(M-k) = 144$ and real dimension $N_{\mathbb{R}} = 2k(M-k) = 288$. The instanton complexity $\kappa_0 = 144$ counts *complex* directions; the real dimension enters in the Morse-Bott analysis. Appendix U uses a five-mode reference count $m = 5$ in Theorem U.15, yielding the reference exponent $\kappa_{\mathrm{ref}} = (N_{\mathbb{R}} - m)/2 = (288 - 5)/2 = 141.5$. Theorem U.8c below shows that the pure-coordinate dilatation tangent is not an exact zero mode of the current Definition U.4 continuum action, so this five-mode value is a reference branch rather than theorem-level closure.

**Definition U.1 (Maximum Complexity).** The **Golay bound** for instanton complexity is:

$$\kappa_{\max} = k^2 = 144$$

### U.4.2 Phase Space

Physical dynamics occur on the cotangent bundle $T^*\mathcal{M}$.

**Corollary U.4 (Phase Space Dimension).**

For $\mathcal{M}=\text{Gr}_{\mathbb{C}}(12,24)$, the underlying real manifold has dimension
$$
\dim_{\mathbb{R}}(\mathcal{M}) = 2 \cdot 144 = 288.
$$
Hence the real cotangent bundle has dimension
$$
\dim_{\mathbb{R}}(T^*\mathcal{M}) = 2\,\dim_{\mathbb{R}}(\mathcal{M}) = 576.
$$
Equivalently, regarded as a holomorphic vector bundle, $T^*\mathcal{M}$ has complex dimension
$$
\dim_{\mathbb{C}}(T^*\mathcal{M}) = 2\,\dim_{\mathbb{C}}(\mathcal{M}) = 288.
$$

---

## U.5 The Octad Hessian

### U.5.1 Quadratic Potential

For a fluctuation $u \in \mathbb{R}^{24}$ on the interface modes, define the **centered octad potential**:

$$Q(u) = \sum_{O \in \mathcal{O}} \left( \sum_{i \in O} (u_i - \bar{u}) \right)^2$$

where $\mathcal{O}$ is the set of 759 octads and $\bar{u} = \frac{1}{24}\sum_{i=1}^{24} u_i$ is the mean.

### U.5.2 Hessian Structure

Let $B$ be the $759 \times 24$ incidence matrix defined by $B_{O,i} = 1$ if $i \in O$ and $0$ otherwise.

**Theorem U.5 (Octad Hessian).** Let
$$
Q(u)=\sum_{O\in\mathcal O}\left(\sum_{i\in O}(u_i-\bar u)\right)^2,
\qquad
\bar u=\frac1{24}\sum_{i=1}^{24}u_i.
$$
Then the Hessian of the centered octad potential is
$$
\nabla^2 Q(0)=2(r-\lambda)\left(I-\frac1{24}\mathbf1\mathbf1^T\right).
$$
Equivalently, if $Q(u)=u^T A_{\mathrm{oct}}u$, then
$$
A_{\mathrm{oct}}=(r-\lambda)\left(I-\frac1{24}\mathbf1\mathbf1^T\right).
$$
Hence:
- the Hessian has eigenvalue $0$ on $\operatorname{span}\{\mathbf1\}$ and eigenvalue $2(r-\lambda)=352$ on $\mathbf1^\perp$;
- the quadratic-form operator $A_{\mathrm{oct}}$ has eigenvalue $0$ on $\operatorname{span}\{\mathbf1\}$ and eigenvalue $r-\lambda=176$ on $\mathbf1^\perp$.

*Proof.* For each octad $O$, let $b_O\in\mathbb R^{24}$ be its incidence vector and set
$$
c_O:=b_O-\frac{k_{\mathrm{block}}}{24}\mathbf1.
$$
Then
$$
\sum_{i\in O}(u_i-\bar u)=c_O^T u,
$$
so
$$
Q(u)=\sum_{O\in\mathcal O}(c_O^T u)^2
=u^T\left(\sum_{O\in\mathcal O}c_Oc_O^T\right)u.
$$
Therefore
$$
A_{\mathrm{oct}}=\sum_{O\in\mathcal O}c_Oc_O^T,
\qquad
\nabla^2Q(0)=2A_{\mathrm{oct}}.
$$
Writing $B$ for the $759\times24$ incidence matrix, the 2-design identity gives
$$
B^T B=(r-\lambda)I+\lambda\mathbf1\mathbf1^T.
$$
Since each point lies in exactly $r$ octads and $bk_{\text{block}}=24r$,
$$
A_{\mathrm{oct}}
=
B^T B-\frac{2k_{\text{block}}r}{24}\mathbf1\mathbf1^T+\frac{bk_{\text{block}}^2}{24^2}\mathbf1\mathbf1^T
=
(r-\lambda)\left(I-\frac1{24}\mathbf1\mathbf1^T\right).
$$
The operator $P_{\mathbf1^\perp}=I-\frac1{24}\mathbf1\mathbf1^T$ is the orthogonal projector onto $\mathbf1^\perp$, so it has eigenvalue $0$ on $\operatorname{span}\{\mathbf1\}$ and eigenvalue $1$ on $\mathbf1^\perp$. The two eigenvalue statements follow immediately. $\square$

### U.5.3 Connection to Framework Constants

**Theorem U.6 (Octad Regularity Parameter-Framework Identity).** The octad regularity parameter satisfies
$$
r-\lambda=d_0(M-a)=8\times22=176.
$$
Consequently, by Theorem U.5, the non-zero eigenvalue of the quadratic-form operator $A_{oct}$ is $176$, while the non-zero eigenvalue of the Hessian $\nabla^2Q(0)$ is
$$
2(r-\lambda)=352.
$$

*Proof.* For a $2$-$(v,k_{\text{block}},\lambda)$ design,
$$
r(k_{\text{block}}-1)=\lambda(v-1).
$$
Hence
$$
r-\lambda
=\frac{\lambda(v-k_{\text{block}})}{k_{\text{block}}-1}
=\frac{r(v-k_{\text{block}})}{v-1}.
$$
Using $(v,k_{\text{block}},r,\lambda)=(24,8,253,77)$ gives, equivalently,
$$
r-\lambda=\frac{77(24-8)}{8-1}=176
=\frac{253(24-8)}{24-1}.
$$
Since $k_{\text{block}}=8=d_0$, $v=24=M$, and $a=2$, we have
$$
d_0(M-a)=8(24-2)=8\cdot22=176.
$$
Thus $r-\lambda=d_0(M-a)=176$. The final statement follows immediately from Theorem U.5, which identifies $\nabla^2Q(0)=2A_{oct}$. $\square$

**Remark U.6a.** This identity connects the Steiner design parameters directly to PU constants, confirming the structural relationship between coding theory and the framework established in Theorem Z.13 and the Golay Bridge (Theorem R.4.9).

---

## U.6 The 24-Cell and Spherical 5-Design

### U.6.1 The 24-Cell Polytope

The standard 24-point configuration used in Appendix U is the set of unit Hurwitz integers on $S^3 \subset \mathbb{R}^4$. It realizes the optimal kissing count $K(4)=24$, spans $\mathbb{R}^4$, and is the configuration whose spherical 5-design exactness is verified later in Theorem U.30. Its coordinates are:

**Type I (8 vertices):**
$$\pm e_1, \pm e_2, \pm e_3, \pm e_4$$

**Type II (16 vertices):**
$$\frac{1}{2}(\pm 1, \pm 1, \pm 1, \pm 1)$$

### U.6.2 Spherical Design Property

**Definition U.2 (Spherical $t$-Design).** A finite set $X \subset S^{n-1}$ is a **spherical $t$-design** if for all polynomials $P$ of degree at most $t$:

$$\frac{1}{|X|} \sum_{x \in X} P(x) = \int_{S^{n-1}} P(x) \, d\sigma(x)$$

where $d\sigma$ is the uniform probability measure on $S^{n-1}$.

**Theorem U.7 (24-Cell Design Property).** The 24 vertices of the 24-cell form a spherical 5-design on $S^3$.

*Proof.* The explicit verification is given later in Theorem U.30: the Gegenbauer moments vanish for degrees $\ell=1,\dots,5$ and fail at degree $\ell=6$. This is exactly the spherical 5-design statement used in Appendix U. No tightness or uniqueness claim is needed here. $\square$

### U.6.3 Identification of Modes with Vertices

**Theorem U.7b (Mode-Vertex Structural Correspondence).** The 24 QFI-active interface modes of the PCE-Attractor admit a 24-element structural correspondence with the 24 vertices of the 24-cell polytope. This correspondence identifies the real dimension of the Grassmannian orbit $\dim_{\mathbb{R}}(\text{Gr}(2,8)) = 2ab = 24$ with the 24-cell vertex count, connecting the internal Hilbert space structure to four-dimensional geometric optimality at the level of counting, symmetry data, and design structure.

*Proof.*

**Step 1 (Interface mode count).** From Theorem Z.5, the QFI-active interface modes number $M = 2ab = 24$, where $a = 2$ (Theorem Z.1, from the sharp match/mismatch record plus entropy-capacity/no-surplus gate) and $b = d_0 - a = 6$.

**Step 2 (Equilibrium saturation).** Inside the channel-complete Bures tangent-cell contract of Definition Z.9a, Theorem Z.9 establishes that the completed first-shell channel count saturates the equal-radius tangent packing bound, yielding $M_{\text{phys}} = K(D)$.

**Step 3 (Mode-channel correspondence).** Theorem Z.10 requires $M_{\text{int}} = M_{\text{phys}}$ at PCE-optimal zero-mismatch equilibrium. This matching is the unique zero of the finite-response mismatch ledger (Lemma Z.5).

**Step 4 (Dimensional selection).** Theorem Z.11 establishes that $K(D) = 24$ uniquely selects $D = 4$ inside the contract, since $K(4) = 24$ is the isolated positive-integer solution on the checked Euclidean tangent-cell branch.

**Step 5 (Geometric realization).** By Definition Z.8, fix the standard 24-point configuration on $S^3$ given by the unit Hurwitz integers. This configuration realizes the optimal kissing count $K(4)=24$ and provides a concrete 24-point geometric model for the mode-channel correspondence.

**Step 6 (Spherical design property).** The same 24 points form a spherical 5-design on $S^3$ (Theorem U.7; verified explicitly in Theorem U.30). The correspondence established here is structural rather than a proved literal bijection of geometric objects: both sides contribute the same cardinality $24$, the same four-dimensional channel-counting data, and the spherical-design exactness needed for the zero-mode argument of Theorem U.13. These are the only 24-cell facts used later; no stronger uniqueness or rigidity statement at the level of 24-point spherical 5-designs is invoked. $\square$

**Remark U.2: Nature of the Correspondence.** The mode-vertex correspondence established in Theorem U.7b is structural rather than literal: the 24 QFI-active interface modes span the real tangent space $T_{x_0}\text{Gr}(2,8) \cong \text{Hom}(\mathbb{C}^2, \mathbb{C}^6)_{\mathbb{R}}$, a 24-dimensional real vector space (complex dimension 12), while the 24-cell vertices span $\mathbb{R}^4$. The correspondence identifies the combinatorial and symmetry structures of these two 24-element sets, enabling the transfer of spherical design properties to the discretized action. This is analogous to how the Golay code organizes the same 24 modes for error correction (Theorem Z.13) without the modes literally being binary codewords.

**Theorem U.7a (Golay-Grassmannian Correspondence).** The PCE-Attractor orbit $\text{Gr}(2,8)$ encodes the Golay code parameters through dimensional correspondence:
- Real dimension: $\dim_{\mathbb{R}}(\text{Gr}(2,8)) = 2ab = 24 = n$ (code length)
- Complex dimension: $\dim_{\mathbb{C}}(\text{Gr}(2,8)) = ab = 12 = k$ (code dimension)
- Hilbert space dimension: $d_0 = a + b = 8 = d$ (minimum distance)

The dimensional tuple $[n, k, d] = [24, 12, 8]$ is thus matched by the attractor structure. The existence and distance-optimality of the extended Golay code remain the coding-theoretic result of Theorem Z.13 on the predictive-recovery MacWilliams branch; the Grassmannian correspondence supplies dimensional compatibility rather than a standalone code-construction theorem. The equality $d_0 = d$ is a consequence of the specific partition $(a,b) = (2,6)$ selected by Landauer constraints (Theorem Z.1), representing a structural consistency rather than a general property of Grassmannian-code correspondences.


---

## U.7 Instanton Zero Modes

### U.7.1 Continuum Instanton Structure

Consider a Euclidean O(4)-invariant action functional $S_{\text{cont}}[\phi]$ on fields $\phi: \mathbb{R}^4 \to \mathbb{R}$.

**Definition U.3 (Bounce Solution).** An **O(4)-symmetric bounce** $\phi^*$ is a non-trivial finite-action solution depending only on $|x|$.

**Theorem U.8 (Translation Zero Modes).** Let $S_{\text{cont}}$ be translation invariant on a translation-stable field domain, and let $\phi^*$ be a critical point. Then the translated fields
$$
\phi^*_a(x)=\phi^*(x-a),\qquad a\in\mathbb R^4,
$$
are critical points, and each tangent $t_\mu=-\partial_\mu\phi^*$ lies in the Hessian kernel:
$$
D^2S_{\text{cont}}(\phi^*)[t_\mu,\eta]=0
\qquad\text{for every admissible test direction }\eta.
$$

*Proof.* Let $E(\phi)=\delta S_{\text{cont}}/\delta\phi$ be the Euler-Lagrange map. Translation invariance implies equivariance, $E(T_a\phi)=T_aE(\phi)$, where $(T_a\phi)(x)=\phi(x-a)$. Since $E(\phi^*)=0$, one has $E(\phi_a^*)=0$ for every $a$. Differentiating this vector equation with respect to $a_\mu$ at $a=0$ gives
$$
DE(\phi^*)[-\partial_\mu\phi^*]=0.
$$
The linearized Euler-Lagrange map $DE(\phi^*)$ is the Hessian operator. Pairing the last identity with an arbitrary admissible $\eta$ yields the displayed bilinear kernel identity. ∎

### U.7.2 Scale Invariance at the PCE Attractor

**Theorem U.8a (Virial Stationarity under Dilations).** Let $S_{\text{cont}}$ be the flat Euclidean action of Definition U.4 and let $\phi^*$ be an $O(4)$-symmetric critical point. For the rescaled family $\phi^*_\rho(x) = \phi^*(\rho x)$,
$$\frac{d}{d\rho} S_{\text{cont}}[\phi^*_\rho]\bigg|_{\rho=1} = 0.$$

*Proof.*

**Step 1 (Scaling of the kinetic and potential pieces).** In $D$ Euclidean dimensions,
$$S_{\text{cont}}[\phi^*_\rho] = \rho^{2-D} S_{\text{kin}}(1) + \rho^{-D} S_{\text{pot}}(1),$$
where $S_{\text{kin}}(1)$ and $S_{\text{pot}}(1)$ are the kinetic and potential contributions of $\phi^*$.

**Step 2 (Differentiate at $\rho=1$).** Differentiating gives
$$\frac{d}{d\rho} S_{\text{cont}}[\phi^*_\rho]\bigg|_{\rho=1} = (2-D)S_{\text{kin}}(1) - D S_{\text{pot}}(1).$$

**Step 3 (Criticality of the bounce).** Because $\phi^*$ is a critical point of $S_{\text{cont}}$, the derivative of the restricted one-parameter family must vanish at $\rho=1$. Hence
$$\frac{d}{d\rho} S_{\text{cont}}[\phi^*_\rho]\bigg|_{\rho=1}=0.$$
For $D=4$ this yields the virial identity $S_{\text{kin}}(1)=-2S_{\text{pot}}(1)$. $\square$

**Remark U.8b (What the virial identity does and does not prove).** The conclusion of Theorem U.8a is a first-variation statement. By itself it does **not** imply that the Hessian has a null vector along dilations. A dilatation zero mode requires a stronger hypothesis: a genuine smooth family of exact critical points generated by scaling.

**Theorem U.8c (Pure-Dilatation Kernel Obstruction).** Let $S_{\text{cont}}$ be the continuum action of Definition U.4 and let $\phi^*$ be a non-trivial finite-action critical point. Then the pure-coordinate dilatation tangent
$$s(x):=x^\mu \partial_\mu \phi^*(x)$$
satisfies
$$D^2 S_{\text{cont}}(\phi^*)[s,s] = -4S_{\text{kin}}(1) < 0,$$
where $S_{\text{kin}}(1)$ is the kinetic contribution appearing in Theorem U.8a. In particular, $s \notin \ker D^2 S_{\text{cont}}(\phi^*)$.

*Proof.* Define $F(\tau):=S_{\text{cont}}[\phi^*_{e^\tau}]$. By the scaling formulas used in Theorem U.8a at $D=4$,
$$F(\tau)=e^{-2\tau}S_{\text{kin}}(1)+e^{-4\tau}S_{\text{pot}}(1),$$
so
$$F'(0)=-2S_{\text{kin}}(1)-4S_{\text{pot}}(1)=0$$
and therefore
$$S_{\text{pot}}(1)=-\frac12 S_{\text{kin}}(1).$$
Differentiating again gives
$$F''(0)=4S_{\text{kin}}(1)+16S_{\text{pot}}(1)=-4S_{\text{kin}}(1).$$
The tangent to the curve $\tau \mapsto \phi^*_{e^\tau}$ at $\tau=0$ is exactly $s=x^\mu \partial_\mu \phi^*$. Since $\phi^*$ is critical, the second derivative of $F$ at $0$ equals the Hessian on this tangent, so
$$D^2 S_{\text{cont}}(\phi^*)[s,s]=F''(0)=-4S_{\text{kin}}(1).$$
For a non-trivial finite-action bounce, $S_{\text{kin}}(1)>0$; otherwise $\nabla \phi^*=0$ almost everywhere and $\phi^*$ is constant. Hence
$$D^2 S_{\text{cont}}(\phi^*)[s,s]<0,$$
so $s$ cannot lie in the Hessian kernel. $\square$

**Theorem U.9 (Conditional Dilatation Zero Mode).** Assume, in addition, that there exists a smooth one-parameter family $\rho \mapsto \phi_\rho$ of exact critical points of $S_{\text{cont}}$ with $\phi_1=\phi^*$ and tangent
$$\frac{\partial \phi_\rho}{\partial (\ln \rho)}\bigg|_{\rho=1} = x^\mu \partial_\mu \phi^*.$$
Then the Hessian annihilates the dilatation tangent vector:
$$D^2 S_{\text{cont}}(\phi^*)\!\left[x^\mu \partial_\mu \phi^*, \eta\right] = 0 \qquad \text{for all test directions }\eta.$$

*Proof.* Let $E(\phi):=\delta S_{\text{cont}}/\delta\phi$. Since each $\phi_\rho$ is a critical point, $E(\phi_\rho)=0$ for all $\rho$. Differentiating at $\rho=1$ gives
$$DE(\phi^*)\!\left[\frac{\partial \phi_\rho}{\partial (\ln \rho)}\bigg|_{\rho=1}\right]=0.$$
The linearization $DE(\phi^*)$ is the Hessian operator, so the displayed tangent vector lies in the Hessian kernel. $\square$

**Corollary U.9.1 (Virial Stationarity Is Not Enough).** The first-variation virial identity
$$
\left.\frac{d}{d\rho}S_{\mathrm{cont}}[\phi_\rho^*]\right|_{\rho=1} \;=\; 0
$$
does not imply $H\eta_D=0$. At a critical point $\phi^*$,
$$
\left.\frac{d^2}{d\rho^2}S_{\mathrm{cont}}[\phi_\rho^*]\right|_{\rho=1} \;=\; \langle\eta_D,\,H\,\eta_D\rangle,
$$
and even vanishing of this quadratic form is strictly weaker than kernel membership $H\eta_D=0$. Theorem U.8a alone therefore cannot justify an exact fifth zero mode.

*Proof.* The first derivative vanishes because $\phi^*$ is stationary along any trial family passing through it (virial stationarity). The second derivative is the Hessian quadratic form along the chosen tangent, which is a single pairing $\langle\eta_D,H\eta_D\rangle$. Vanishing of one quadratic pairing does not imply that $H\eta_D=0$ as a vector: for instance, with $H=\mathrm{diag}(1,-1)$ and $\eta_D=(1,1)$, one has $\langle\eta_D,H\eta_D\rangle=0$ while $H\eta_D=(1,-1)\ne 0$. ∎

**Remark U.9.2 (Exact-Scale-Family Dichotomy).** Theorem U.9, Corollary U.9.1, and Theorem U.8d together isolate the logical alternatives for a fifth zero mode:

1. *Exact-scale-family branch.* If a smooth one-parameter family of exact critical points exists with dilatation tangent $\eta_D=x^\mu\partial_\mu\phi^*$, then Theorem U.9 gives $H\eta_D=0$ and one is on the $\nu=1$ side of Theorem U.16a.
2. *Negative-direction branch near a reference action.* If the pure-dilatation quadratic form is strictly negative at a chosen reference action, then Theorem U.8d shows that this negativity persists under sufficiently small $C^1$ perturbations of that action.
3. *Virial non-implication.* Corollary U.9.1 shows that first-variation virial stationarity does not by itself imply a zero mode.

Thus $\nu=1$ requires an exact-scale-family construction of the type stated in Theorem U.9; it is not obtained merely from virial stationarity.

### U.7.3 Total Zero Mode Count

**Corollary U.10 (Collective Coordinates).** The continuum bounce $\phi^*$ has four translational zero modes by Theorem U.8. It has a fifth dilatation zero mode only under the additional exact-scale-family hypothesis of Theorem U.9; Theorem U.8c shows that this hypothesis is not realized by the pure-coordinate scaling direction of the current Definition U.4 continuum action. If, in addition, the pure-dilatation quadratic form is negative at a chosen reference action, Theorem U.8d shows that this negativity persists under sufficiently small $C^1$ perturbations of that action. In the remainder of Appendix U, the value $m=5$ is therefore used only as the Appendix U leading-order reference-counting convention for the vacuum sector.

**Theorem U.8d (Persistence of a negative pure-dilatation direction).** Let $\eta\mapsto S_\eta$ be a family of twice Fréchet-differentiable Euclidean actions on a common Hessian form domain $\mathcal Q$. Let $\phi_\eta^*$ be critical points such that
$$
s_\eta(x):=x^\mu\partial_\mu\phi_\eta^*
$$
depends continuously on $\eta$ in the form norm of $\mathcal Q$. Assume that the Hessian forms $H_\eta=D^2S_\eta(\phi_\eta^*)$ are continuous in form norm at $\eta=0$, namely
$$
\|H_\eta-H_0\|_{\mathcal Q\to\mathcal Q^*}\longrightarrow0,
$$
and that $\langle s_0,H_0s_0\rangle<0$. Then there is $\delta>0$ such that
$$
\langle s_\eta,H_\eta s_\eta\rangle<0
\qquad(|\eta|<\delta).
\tag{U.8d}
$$

*Proof.* Form-norm continuity of $s_\eta$ and $H_\eta$ implies continuity of
$$
Q(\eta)=\langle s_\eta,H_\eta s_\eta\rangle
$$
at $0$. Choose $\delta$ so that $|Q(\eta)-Q(0)|<-Q(0)/2$ for $|\eta|<\delta$. Then $Q(\eta)<Q(0)/2<0$. ∎

**Corollary U.8d.1 (Generic Small Deformations Do Not Create a Fifth Zero Mode at the Reference Action).** Under the hypotheses of Theorem U.8d, generic sufficiently small deformations of the reference action do not turn the pure-coordinate dilatation tangent into a zero mode.

*Proof.* Theorem U.8d supplies $\delta>0$ such that
$$
\langle s_\eta,H_\eta s_\eta\rangle<0
$$
whenever $|\eta|<\delta$. If $s_\eta$ were a Hessian zero mode, then $H_\eta s_\eta=0$ and therefore
$$
\langle s_\eta,H_\eta s_\eta\rangle=0,
$$
contradicting strict negativity. Thus no deformation in this neighborhood turns $s_\eta$ into a zero mode; the stated generic conclusion follows. ∎

---

## U.8 Design-Preserving Discretization

### U.8.1 Continuum Action Specification

The continuum Euclidean information action for vacuum fluctuations is constructed from the framework's fundamental structures.

**Definition U.4 (Continuum Information Action).** The continuum action $S_{\text{cont}}[\phi]$ for a scalar fluctuation field $\phi:\mathbb{R}^4\to\mathbb{R}$ is defined with normalized angular volume by

$$
S_{\text{cont}}[\phi] = \frac{1}{2\pi^2\varepsilon_0}\int_{\mathbb{R}^4} d^4x \left[\frac{1}{2}|\nabla \phi|^2 + V_{\text{eff}}(\phi) - V_{\text{eff}}(0)\right].
$$

Here $\varepsilon_0=\ln2$ is the structural binary-quotient normalization of Definition 28 and Lemma J.1. Its use as the overall normalization of $S_{\mathrm{cont}}$ is part of Definition U.4 and is not a physical reset-cost conclusion of Theorem 31. In polar coordinates $x=r\omega$, $\omega\in S^3$, this is

$$
S_{\text{cont}}[\phi] = \frac{1}{\varepsilon_0}\int_0^\infty r^3 dr \int_{S^3} d\sigma_3 \left[\frac{1}{2}(\partial_r \phi)^2 + \frac{1}{2r^2}|\nabla_{S^3}\phi|^2 + V_{\text{eff}}(\phi) - V_{\text{eff}}(0)\right],
$$

where $d\sigma_3=d\Omega_3/(2\pi^2)$ is the normalized round measure. For an $O(4)$-symmetric profile $\phi(x)=\varphi(r)$, the angular-gradient term vanishes. The subtraction makes the potential density vanish at the false vacuum; finite action additionally requires the kinetic and subtracted-potential densities to be integrable.

**Remark U.4a (O(4) Invariance).** The action above is the flat Euclidean action written in polar coordinates. The factors $r^3$ and $r^{-2}$ are required for the identification with $\mathbb{R}^4$. The radial form is used only to expose the angular quadrature on each sphere $r=\text{const}$.

### U.8.2 Discrete Sampling

**Definition U.5 (Discrete Sampling).** Let $X = \{x_1, \ldots, x_{24}\} \subset S^3$ be the 24-cell vertices (Definition Z.8). For a continuum field configuration $\phi$, define the sampled functions

$$u_i(r) = \phi(r x_i), \quad i = 1, \ldots, 24.$$

**Definition U.6 (Discrete Action).** The **discrete action** $S_{\text{disc}}$ is obtained by replacing the normalized angular average on each sphere by the 24-cell quadrature:
$$
S_{\text{disc}}(u) = \frac{1}{\varepsilon_0}\int_0^\infty r^3 dr \left[\frac{1}{24}\sum_{i=1}^{24}\frac{1}{2}(\partial_r u_i)^2 + \frac{1}{48r^2}\sum_{i,j}W_{ij}(u_i-u_j)^2 + \frac{1}{24}\sum_{i=1}^{24}\big(V_{\text{eff}}(u_i)-V_{\text{eff}}(0)\big)\right]
$$
where $W_{ij}$ encodes a chosen real self-adjoint discrete angular quadratic form on the 24-cell sample, with constants in its kernel, and the factor $1/24$ normalizes the spherical average. The quadrature $\int_{S^3} d\sigma_3 \to \frac{1}{24}\sum_{i=1}^{24}$ is exact for polynomials of degree $\leq 5$ by the spherical 5-design property (Theorem U.7).

### U.8.3 Quadrature Exactness

**Theorem U.11 (Design Quadrature).** For a spherical $t$-design $X \subset S^{n-1}$ and any polynomial $P$ of degree at most $t$:

$$\frac{1}{|X|} \sum_{x \in X} P(x) = \int_{S^{n-1}} P(x) \, d\sigma(x)$$

The quadrature is **exact** for all such polynomials.

*Proof.* This is the definition of spherical $t$-design. $\square$

### U.8.4 Second Variation Degree

**Lemma U.12 (Angular degree on the collective-coordinate subspace).** Let $\phi^*(x)=\varphi(r)$ be radial, and restrict both arguments of $D^2S_{\text{cont}}(\phi^*)$ to
$$
\mathcal C=\operatorname{span}\{-\partial_1\phi^*,\ldots,-\partial_4\phi^*,x^\mu\partial_\mu\phi^*\}.
$$
For each prescribed $r$, every angular integrand in a Hessian matrix element on $\mathcal C$ is the restriction to $S^3$ of a polynomial of degree at most $2$. No finite angular-degree bound is asserted for arbitrary perturbations.

*Proof.* The translation directions are $-\varphi'(r)\omega_\mu$, so their angular factors have degree one in $\omega\in S^3$; the pure-coordinate dilatation direction $r\varphi'(r)$ has degree zero. Radial derivatives preserve these angular degrees. Products in the radial and potential Hessian terms therefore have degree at most two. For the angular kinetic term,
$$
\nabla_{S^3}\omega_\mu\cdot\nabla_{S^3}\omega_\nu
=\delta_{\mu\nu}-\omega_\mu\omega_\nu,
$$
which has degree at most two, while the angular gradient of the constant factor is zero. Hence every restricted angular matrix element has degree at most two. ∎

### U.8.5 Zero Mode Preservation

**Theorem U.13 (Design-Exact Evaluation on the Collective-Coordinate Subspace).** Let $X \subset S^3$ be the 24-cell (a spherical 5-design, identified with interface modes by Theorem U.7). Let $\phi^*(x)=\varphi(|x|)$ be a non-trivial finite-action $O(4)$-symmetric critical point of $S_{\text{cont}}$ (Definition U.4), let $u^*$ be its sample on $X$, and define the sampled directions
$$
t_\mu(r,i):=-\partial_\mu \phi^*(r x_i) = -\varphi'(r)(x_i)_\mu, \qquad
d(r,i):=(r x_i)^\nu \partial_\nu \phi^*(r x_i)=r\varphi'(r).
$$
Let
$$
\mathcal C_{\mathrm{samp}}:=\mathrm{span}\{t_1,t_2,t_3,t_4,d\}.
$$
Let $S_{\text{disc}}$ be the discrete action of Definition U.6, and assume the chosen self-adjoint discrete angular quadratic form has the same Hessian matrix elements as the continuum angular term on $\mathcal C_{\mathrm{samp}}$. Then the restriction of $D^2 S_{\text{disc}}(u^*)$ to $\mathcal C_{\mathrm{samp}}$ agrees exactly with the corresponding restriction of $D^2 S_{\text{cont}}(\phi^*)$ to the continuum span of $\{-\partial_\mu \phi^*\}_{\mu=1}^4$ and $x^\nu \partial_\nu \phi^*$. Consequently:
1. the four sampled translation directions are null directions of the restricted quadratic form $D^2 S_{\text{disc}}(u^*)|_{\mathcal C_{\mathrm{samp}}}$;
2. the sampled pure-coordinate dilatation direction satisfies
$$
D^2 S_{\text{disc}}(u^*)[d,d] = -4S_{\text{kin}}(1) < 0;
$$
3. the kernel of $D^2 S_{\text{disc}}(u^*)|_{\mathcal C_{\mathrm{samp}}}$ is exactly $\mathrm{span}\{t_1,t_2,t_3,t_4\}$.

In particular, under the stated sampled-sector exactness hypothesis, the 24-cell discretization does not create a fifth zero mode on the sampled five-dimensional collective-coordinate sector. The later full-discrete closure is supplied by Theorem U.13b after three further inputs are fixed: the corrected Definition U.6 angular coefficient, the explicit signed sampled operator of Proposition U.13a, and the radial spectral hypotheses isolated in Lemmas U.13a.2-U.13a.3.

*Proof.*

**Step 1.** For an $O(4)$-symmetric profile $\phi^*(x)=\varphi(r)$ with $r=|x|$, the continuum translation and pure-coordinate dilatation directions are
$$
-\partial_\mu \phi^*(x) = -\varphi'(r)\frac{x_\mu}{r},
\qquad
x^\nu \partial_\nu \phi^*(x) = r\varphi'(r).
$$
Restricting to the sample points $x=r x_i$ gives the displayed formulas for $t_\mu$ and $d$. Their angular dependence is linear and constant, respectively.

**Step 2.** By Lemma U.12, all angular integrands coming from the radial and potential pieces of the relevant matrix elements of $D^2 S_{\text{cont}}(\phi^*)$ are polynomials of degree at most $4$. Since $X$ is a spherical $5$-design, Theorem U.11 makes the quadrature exact for those terms. By the stated sampled-sector exactness hypothesis, the angular contribution in Definition U.6 also agrees with the continuum angular contribution on $\mathcal C_{\mathrm{samp}}$. Therefore the full restricted Hessians agree exactly on $\mathcal C_{\mathrm{samp}}$.

**Step 3.** By Theorem U.8, each continuum translation direction $-\partial_\mu \phi^*$ lies in the kernel of the continuum Hessian. Using Step 2, the sampled directions $t_\mu$ therefore satisfy
$$
D^2 S_{\text{disc}}(u^*)[t_\mu,\eta]=0
\qquad
\text{for all }\eta\in \mathcal C_{\mathrm{samp}},\ \mu=1,\dots,4.
$$
Thus the four sampled translation directions are null directions of the restricted quadratic form.

**Step 4.** By Theorem U.8c,
$$
D^2 S_{\text{cont}}(\phi^*)[x^\nu \partial_\nu \phi^*,x^\nu \partial_\nu \phi^*]
= -4S_{\text{kin}}(1)<0.
$$
Applying Step 2 to the sampled direction $d$ gives
$$
D^2 S_{\text{disc}}(u^*)[d,d]=-4S_{\text{kin}}(1)<0.
$$

**Step 5.** Let
$$
v=\sum_{\mu=1}^4 a_\mu t_\mu + b\,d \in \mathcal C_{\mathrm{samp}}
$$
and suppose $v$ lies in the kernel of the restricted quadratic form. Taking $\eta=d$ and using Step 3 yields
$$
0=D^2 S_{\text{disc}}(u^*)[v,d]
=b\,D^2 S_{\text{disc}}(u^*)[d,d].
$$
Step 4 forces $b=0$. Hence every restricted-kernel vector lies in $\mathrm{span}\{t_1,t_2,t_3,t_4\}$.

It remains to prove that the four sampled translation directions are linearly independent. If
$$
\sum_{\mu=1}^4 a_\mu t_\mu = 0,
$$
then for every $r>0$ and every vertex $x_i\in X$,
$$
0=-\varphi'(r)\sum_{\mu=1}^4 a_\mu (x_i)_\mu.
$$
Because $\phi^*$ is non-trivial, $\varphi'$ is not identically zero, so there exists $r_0$ with $\varphi'(r_0)\neq 0$. Therefore
$$
\sum_{\mu=1}^4 a_\mu (x_i)_\mu = 0
\qquad
\text{for all }i=1,\dots,24.
$$
The 24-cell vertices span $\mathbb{R}^4$ because they include $\pm e_1,\pm e_2,\pm e_3,\pm e_4$. Hence $a_\mu=0$ for all $\mu$, so $\mathrm{span}\{t_1,t_2,t_3,t_4\}$ is four-dimensional. Combining this with the previous paragraph proves
$$
\ker\!\left(D^2 S_{\text{disc}}(u^*)|_{\mathcal C_{\mathrm{samp}}}\right)
=
\mathrm{span}\{t_1,t_2,t_3,t_4\}.
$$
$\square$

**Proposition U.13a (Explicit Signed Sampled Angular Operator).** Let $X=\{x_1,\dots,x_{24}\}\subset S^3$ be the 24-cell vertices, and define a symmetric weight matrix by
$$
W_{ij}=
\begin{cases}
1, & x_i\cdot x_j=\frac12,\\[2mm]
-\frac12, & x_i\cdot x_j=0,\\[2mm]
0, & x_i\cdot x_j=-\frac12,\\[2mm]
\frac14, & x_i\cdot x_j=-1,\\[2mm]
0, & i=j.
\end{cases}
$$
Let
$$
(L_W f)_i := 2\sum_{j=1}^{24} W_{ij}(f_i-f_j),
$$
so that
$$
\frac1{24}\sum_{i,j}W_{ij}(f_i-f_j)^2
=
\frac1{24}\sum_i f_i(L_W f)_i
$$
for every vertex function $f:X\to\mathbb R$. Then $L_W$ is a real self-adjoint sampled angular operator with exact characteristic polynomial
$$
\chi_{L_W}(x)=x(x-3)^4(x-8)^9(x-15)^8(x-24)^2.
$$
In particular, the constant mode is the unique zero mode, the operator is positive semidefinite on the orthogonal complement of constants, and the nonzero sampled angular eigenvalues are exactly $3,8,15,24$.

*Proof.* Let $A=A_{1/2}$ be the adjacency matrix of the 24-cell skeleton, let $A_0$ be the relation matrix for inner product $0$, and let $P=A_{-1}$ be the antipodal permutation. Then
$$
W=A-\tfrac12A_0+\tfrac14P,
\qquad
L_W=2\left(\tfrac{21}{4}I-W\right),
$$
because every row of $W$ has eight entries $1$, six entries $-1/2$, and one entry $1/4$.

It remains to diagonalize the commuting matrices $A,A_0,P$. Split the vertices into the eight signed coordinate vertices $C=\{\pm e_i\}$ and the sixteen half-vectors $H=\{(t_1,t_2,t_3,t_4)/2:t_i=\pm1\}$. In this order,
$$
A=\begin{pmatrix}0&B\\B^T&A_{Q_4}\end{pmatrix},
\qquad
B_{(i,s),t}=\mathbf1_{\{t_i=s\}},
$$
where $A_{Q_4}$ is the four-cube adjacency matrix. For the Walsh character $\chi_S(t)=\prod_{j\in S}t_j$,
$$
A_{Q_4}\chi_S=(4-2|S|)\chi_S.
$$
The normalized constant character couples only to the normalized constant vector on $C$, with coupling $4\sqrt2$, so their block is
$$
\begin{pmatrix}0&4\sqrt2\\4\sqrt2&4\end{pmatrix},
$$
whose eigenvalues are $8$ and $-4$. For each $i$, the normalized singleton character $\chi_{\{i\}}$ couples only to the normalized signed coordinate vector supported on $\{e_i,-e_i\}$, with coupling $2\sqrt2$; each of the four blocks is
$$
\begin{pmatrix}0&2\sqrt2\\2\sqrt2&2\end{pmatrix},
$$
with eigenvalues $4$ and $-2$. The three coordinate vectors orthogonal to the constant coordinate vector are uncoupled with eigenvalue $0$. The remaining Walsh characters are uncoupled: the six degree-two characters have eigenvalue $0$, the four degree-three characters have eigenvalue $-2$, and the degree-four character has eigenvalue $-4$. Hence
$$
\operatorname{Spec}(A)=\{8,4^{(4)},0^{(9)},(-2)^{(8)},(-4)^{(2)}\}.
$$
Antipodal parity is even on the $8$, $0^{(9)}$, and $(-4)^{(2)}$ eigenspaces and odd on the $4^{(4)}$ and $(-2)^{(8)}$ eigenspaces.

The five relation matrices partition all ordered vertex pairs, and $A_{-1/2}=PA$. Thus, on a nonconstant joint eigenvector with $Av=av$ and $Pv=pv$, $p\in\{\pm1\}$,
$$
A_0v=-(I+P+A+PA)v=-\bigl(1+p+(1+p)a\bigr)v.
$$
Consequently the corresponding $W$-eigenvalue is
$$
w=a+\tfrac12\bigl(1+p+(1+p)a\bigr)+\tfrac14p.
$$
For the even sectors $(a,p)=(0,1),(-4,1)$ this gives $w=5/4,-27/4$; for the odd sectors $(4,-1),(-2,-1)$ it gives $w=15/4,-9/4$. On the constant vector, direct row summation gives $w=21/4$. Therefore $L_W=2(21I/4-W)$ has spectrum
$$
0^{(1)},\quad3^{(4)},\quad8^{(9)},\quad15^{(8)},\quad24^{(2)},
$$
and hence
$$
\chi_{L_W}(x)=x(x-3)^4(x-8)^9(x-15)^8(x-24)^2.
$$
All eigenvalues are nonnegative and only the constant sector has eigenvalue zero. ∎

**Corollary U.13a.1 (Coordinate Module at Eigenvalue $3$).** For each coordinate function $x^{(\mu)}_i=(x_i)_\mu$ one has
$$
L_W x^{(\mu)} = 3x^{(\mu)}
\qquad
(\mu=1,\dots,4).
$$
Since the eigenvalue $3$ has multiplicity $4$, its eigenspace is exactly
$$
\mathrm{span}\{x^{(1)},x^{(2)},x^{(3)},x^{(4)}\}.
$$
Thus the signed sampled operator realizes the translation-sector angular eigenvalue exactly at the sampled level. Together with the corrected Definition U.6 angular coefficient, this identifies the exact $\lambda=3$ angular input used in Theorem U.13b. The remaining radial spectral inputs are isolated in Lemmas U.13a.2 and U.13a.3.

*Proof.* Exact matrix multiplication with the weight choice of Proposition U.13a gives $L_W x^{(\mu)}=3x^{(\mu)}$ for each $\mu$. The characteristic polynomial from Proposition U.13a shows that the eigenvalue $3$ has multiplicity $4$, so these four coordinate functions span the full eigenspace. ∎

**Remark U.13a.1a (Exact Rational Verification Contract for $L_W$).** Proposition U.13a is reproducible without floating point. Construct the 24 vertices in the unit-Hurwitz realization of Definition Z.8 and Section U.6.1, build $W$ from the inner-product classes, and compute $L_W=2(\mathrm{diag}(W\mathbf 1)-W)$ over $\mathbb Q$. The inner-product multiplicities are
$$
N(1)=24,
\quad
N(1/2)=192,
\quad
N(0)=144,
\quad
N(-1/2)=192,
\quad
N(-1)=24,
$$
the row sum of $W$ is $21/4$, and the exact characteristic polynomial is
$$
\chi_{L_W}(x)=x(x-3)^4(x-8)^9(x-15)^8(x-24)^2.
$$
The coordinate functions satisfy $L_Wx^{(\mu)}=3x^{(\mu)}$ by exact matrix multiplication. The same rational enumeration gives the design-moment checks
$$
\mathbb E[x_1]=0,
\quad
\mathbb E[x_1^2]=\frac14,
\quad
\mathbb E[x_1^3]=0,
\quad
\mathbb E[x_1^4]=\frac18,
\quad
\mathbb E[x_1^2x_2^2]=\frac1{24},
\quad
\mathbb E[x_1^5]=0,
\quad
\mathbb E[x_1^3x_2^2]=0.
$$
The normalized $D_4$ root realization $(\pm1,\pm1,0,0)/\sqrt2$ is orthogonally equivalent to the unit-Hurwitz realization, but Appendix U keeps the unit-Hurwitz coordinate convention.

**D4 continuum-witness audit.** The D4 or 24-cell shell data may be used as a continuum witness only through the finite record $\mathfrak W_{D_4}$. The record contains the shell-moment comparison
$$
\left|\frac{1}{|S_r|}\sum_{v\in S_r}v_{i_1}\cdots v_{i_k}-\int_{S^3}\theta_{i_1}\cdots\theta_{i_k}\,d\theta\right|\le \epsilon_k(r),\qquad k\le 4,
$$
with the normalization used by the discrete operator, the radius-two Bochner or curvature-transfer check, a noncollapse bound, and compatibility with the recovery/Mosco limit used by the continuum theorem. Shell isotropy alone is not promoted to full continuum convergence.

**Lemma U.13a.1b (Design-Exactness of the Low-Harmonic Sector).** Because the 24-cell vertex measure is a spherical 5-design by Theorem U.30, the discrete vertex average integrates every polynomial of degree $\le5$ on $S^3$ exactly. Consequently, for spherical harmonic levels $m,n$ with $m+n\le5$, all Gram and overlap integrals computed in the sampled inner product equal their continuum values. In particular, the restriction map from continuum harmonics of levels $n\le2$ to functions on $V_{24}$ is an isometry onto its image after the common normalization, and the level multiplicities $1,4,9$ for $n=0,1,2$ are preserved without aliasing.

*Proof.* A product of harmonics of levels $m$ and $n$ is a polynomial of degree at most $m+n$. Theorem U.30 integrates every polynomial of degree $\le5$ exactly, so all Gram entries in the stated range agree with the continuum Gram entries. For $n\le2$, the relevant products have degree $\le4$, hence the sampled Gram matrix is the continuum nondegenerate Gram matrix on $\mathcal H_0\oplus\mathcal H_1\oplus\mathcal H_2$. Therefore restriction is injective and isometric onto its image, with dimensions $1,4,9$. ∎

**Proposition U.13a.1c (Continuum Angular Grid Identification for the Sampled Channels).** The sampled angular values of Proposition U.13a are continuum $S^3$ Laplacian eigenvalue values:
$$
\{0,3,8,15,24\}=\{n(n+2):n=0,1,2,3,4\}.
$$
The sampled multiplicities are
$$
(1,4,9,8,2),
$$
whereas the continuum multiplicities for $n=0,1,2,3,4$ are
$$
(1,4,9,16,25).
$$
Thus levels $0,1,2$ are represented with their full continuum multiplicities, while the sampled entries at $15$ and $24$ are aliased finite subspaces carrying the same eigenvalue values but not the full continuum multiplicities.

*Proof.* The continuum scalar Laplacian spectrum on $S^3$ is $\lambda_n=n(n+2)$ with multiplicity $(n+1)^2$. Proposition U.13a supplies the exact sampled characteristic polynomial, so the sampled values and multiplicities are exactly $0^1,3^4,8^9,15^8,24^2$. Lemma U.13a.1b explains the full multiplicity agreement through level $2$. For levels $3$ and $4$, the equality asserted here is only equality of the eigenvalue values in the sampled finite angular list; no claim is made that the sampled subspaces exhaust the continuum eigenspaces. Consequently, Theorem U.13b has no angular eigenvalue displacement in its retained sampled channels, while all remaining closure load stays in the radial spectral data and Fredholm prefactor certificates. ∎

**Lemma U.13a.2 (Explicit $s$-Wave Spectral Input).** Work in $D=4$. Assume $V_{\mathrm{eff}}\in C^3(\mathbb R)$ satisfies
$$
V_{\mathrm{eff}}(0)=V_{\mathrm{eff}}'(0)=0,
\qquad
V_{\mathrm{eff}}''(0)>0,
$$
and has a lower true vacuum separated from $\phi=0$ by a single barrier. Let $\phi^*(x)=\varphi(|x|)$ be a non-trivial finite-action $O(4)$-symmetric one-bounce saddle of Definition U.4 with
$$
\varphi'(0)=0,
\qquad
\lim_{r\to\infty}\varphi(r)=0,
\qquad
\varphi'(r)<0\ \text{for }r>0.
$$
Define the radial $s$-wave operator on regular finite-action radial fluctuations by
$$
\mathcal L_0 f := -f''-\frac3r f' + V_{\mathrm{eff}}''(\varphi(r))f.
$$
Assume, as the explicit external spectral input imported from the single-field false-vacuum fluctuation analysis of Coleman, *The Fate of the False Vacuum: Semiclassical Theory* (1977), together with Callan-Coleman, *The Fate of the False Vacuum II: First Quantum Corrections* (1977), that for a single scalar field in flat $D=4$ Euclidean space with a finite-action monotone one-bounce profile approaching the false vacuum at infinity, the radial $s$-wave operator $\mathcal L_0$ has exactly one negative eigenvalue and no zero eigenvalue. Then the $s$-wave sector has Morse index one and trivial kernel.

*Proof.* The present hypotheses are exactly the single-field, flat-space, $O(4)$-symmetric one-bounce hypotheses under which the Coleman / Callan-Coleman fluctuation analysis is invoked: $D=4$, finite action, approach to the false vacuum at infinity, and a monotone radial profile with no interior zero of $-\varphi'$. The imported statement is isolated here as a named hypothesis so that Theorem U.13b does not rely on any unstated external theorem. Theorem U.8c supplies the manuscript-side compatibility check that the natural pure-coordinate dilatation variation is strictly negative rather than null. ∎

**Lemma U.13a.3 (Translation-Channel Ground State and Higher-Channel Positivity).** Under the bounce hypotheses of Lemma U.13a.2, for each sampled angular eigenvalue $\lambda$ define
$$
\mathcal L_\lambda f := -f''-\frac3r f' + \frac{\lambda}{r^2}f + V_{\mathrm{eff}}''(\varphi(r))f
$$
on regular finite-action radial fluctuations, and let
$$
g(r):=-\varphi'(r).
$$
Then $g(r)>0$ for $r>0$ and
$$
\mathcal L_3 g = 0.
$$
Moreover, the quadratic form of the translation channel satisfies
$$
Q_3[f]:=\int_0^\infty r^3\left(f'(r)^2+\left(\frac3{r^2}+V_{\mathrm{eff}}''(\varphi(r))\right)f(r)^2\right)dr
=
\int_0^\infty r^3 g(r)^2\left(\frac{f}{g}\right)'^{\!2}dr \ge 0,
$$
so
$$
\ker \mathcal L_3 = \mathrm{span}\{g\}.
$$
Consequently, for every $\lambda>3$,
$$
Q_\lambda[f]=Q_3[f]+(\lambda-3)\int_0^\infty r\,f(r)^2\,dr,
$$
hence $\mathcal L_\lambda$ is bounded below and has trivial kernel.

*Proof.* The bounce equation is
$$
-\varphi''-\frac3r\varphi'+V_{\mathrm{eff}}'(\varphi)=0.
$$
Differentiating gives
$$
-\varphi'''-\frac3r\varphi''+\frac3{r^2}\varphi'+V_{\mathrm{eff}}''(\varphi)\varphi'=0,
$$
which is exactly $\mathcal L_3\varphi'=0$, hence $\mathcal L_3 g=0$. Monotonicity gives $g>0$ on $(0,\infty)$.

Write $f=gh$. Then
$$
Q_3[f]
=
\int_0^\infty r^3\left(g^2 h'^2 + 2gg'hh' + \left(g'^2 + \left(\frac3{r^2}+V_{\mathrm{eff}}''(\varphi)\right)g^2\right)h^2\right)dr.
$$
Since $\mathcal L_3 g=0$, one has
$$
(r^3 g')' = r^3\left(\frac3{r^2}+V_{\mathrm{eff}}''(\varphi)\right)g.
$$
Integrating the cross term by parts, and using the regularity at $r=0$ together with the exponential decay at $r\to\infty$ to eliminate the boundary contribution, yields
$$
Q_3[f]=\int_0^\infty r^3 g^2 h'^2\,dr\ge0.
$$
Equality forces $h'=0$, so $f=Cg$. This proves $\ker\mathcal L_3=\mathrm{span}\{g\}$.

For $\lambda>3$,
$$
Q_\lambda[f]=Q_3[f]+(\lambda-3)\int_0^\infty r\,f(r)^2\,dr \ge 0.
$$
If $Q_\lambda[f]=0$, then the second term gives $f=0$ almost everywhere. Thus $\mathcal L_\lambda$ has trivial kernel. In particular, every sampled angular sector with $\lambda>3$ is strictly positive on nonzero fluctuations. ∎

**Theorem U.13b (Full-Discrete Four-Mode Closure under the Stated False-Vacuum Spectral Hypotheses).** Work in $D=4$. Let $W_{ij}$ be the explicit signed weight matrix of Proposition U.13a, let $L_W$ be the associated sampled angular operator, and let Definition U.6 use the corrected angular coefficient $\frac{1}{48r^2}$. Assume $V_{\mathrm{eff}}\in C^3(\mathbb R)$ has a false vacuum at $\phi=0$ with
$$
V_{\mathrm{eff}}(0)=V_{\mathrm{eff}}'(0)=0,
\qquad
V_{\mathrm{eff}}''(0)>0,
$$
and a lower true vacuum separated from $\phi=0$ by a single barrier. Assume the continuum action of Definition U.4 admits a non-trivial finite-action $O(4)$-symmetric one-bounce saddle
$$
\phi^*(x)=\varphi(|x|)
$$
with
$$
\varphi'(0)=0,
\qquad
\lim_{r\to\infty}\varphi(r)=0,
\qquad
\varphi'(r)<0\ \text{for }r>0,
$$
and assume the $s$-wave spectral input of Lemma U.13a.2. Let
$$
u^*(r,i)=\varphi(r)
$$
be the 24-cell sample of the bounce. Then the full discrete Hessian $D^2 S_{\mathrm{disc}}(u^*)$ has exactly four zero modes,
$$
\ker D^2 S_{\mathrm{disc}}(u^*) = \mathrm{span}\{t_1,t_2,t_3,t_4\},
$$
where
$$
t_\mu(r,i):=-\varphi'(r)(x_i)_\mu,
\qquad
\mu=1,\dots,4.
$$
Equivalently, the full discrete Hessian has nullity $4$, and its restriction to the orthogonal complement of the translation space is non-degenerate.

*Proof.* By Proposition U.13a,
$$
\chi_{L_W}(x)=x(x-3)^4(x-8)^9(x-15)^8(x-24)^2,
$$
so the sampled angular spectrum is
$$
\{0,3^4,8^9,15^8,24^2\}.
$$
By Corollary U.13a.1, the $\lambda=3$ eigenspace is exactly the coordinate module
$$
E_3 = \mathrm{span}\{x^{(1)},x^{(2)},x^{(3)},x^{(4)}\}.
$$

Let $Y\in \mathbb R^{24}$ satisfy $L_W Y=\lambda Y$, and set
$$
\eta_i(r)=f(r)Y_i.
$$
Because $L_W$ is self-adjoint for the sampled inner product
$$
\langle Y,Z\rangle_{24}:=\frac1{24}\sum_{i=1}^{24}Y_i Z_i,
$$
different angular eigenspaces are orthogonal. Because $u^*(r,i)=\varphi(r)$ is independent of $i$, the potential term $V_{\mathrm{eff}}''(u^*_i)=V_{\mathrm{eff}}''(\varphi(r))$ is also $i$-independent, so it commutes with the angular projection and the Hessian decomposes as an orthogonal direct sum over the sampled angular eigenspaces. Using the corrected Definition U.6 coefficient, the Hessian quadratic form separates by angular eigenspaces as
$$
D^2 S_{\mathrm{disc}}(u^*)[\eta,\eta]
=
\frac{\|Y\|_{24}^2}{\varepsilon}\int_0^\infty r^3\left(f'(r)^2+\left(\frac{\lambda}{r^2}+V_{\mathrm{eff}}''(\varphi(r))\right)f(r)^2\right)dr,
$$
where
$$
\|Y\|_{24}^2:=\frac1{24}\sum_{i=1}^{24}Y_i^2.
$$
Thus the full discrete Hessian is the orthogonal direct sum of the radial operators $\mathcal L_\lambda$ attached to the sampled eigenvalues $\lambda\in\{0,3,8,15,24\}$. By Proposition U.13a.1c these values are the continuum $S^3$ angular eigenvalue values $n(n+2)$ for $n=0,1,2,3,4$; only the sampled multiplicities in the $n=3,4$ values are aliased, and no additional continuum multiplicity is imported into the finite Hessian.

For $\lambda=3$, Lemma U.13a.3 gives
$$
\ker \mathcal L_3 = \mathrm{span}\{-\varphi'\}.
$$
Since $\dim E_3=4$, the full discrete kernel in the $\lambda=3$ sector is exactly
$$
E_3\otimes \mathrm{span}\{-\varphi'\}
=
\mathrm{span}\{t_1,t_2,t_3,t_4\},
$$
where $t_\mu(r,i)=-\varphi'(r)(x_i)_\mu$. These are precisely the sampled translation modes.

For the constant angular sector $\lambda=0$, Lemma U.13a.2 gives Morse index one and trivial kernel. Hence the $s$-wave sector contributes no zero modes.

For the remaining sampled eigenvalues $\lambda=8,15,24$, Lemma U.13a.3 gives trivial kernel and bounded-below quadratic form. Hence those higher angular sectors contribute no zero modes.

Therefore the full discrete Hessian has no kernel outside the translation sector. Since the translation sector contributes exactly four linearly independent zero modes, one for each coordinate function on the 24-cell,
$$
\ker D^2 S_{\mathrm{disc}}(u^*)=\mathrm{span}\{t_1,t_2,t_3,t_4\}.
$$
The orthogonal complement of this four-dimensional space has no kernel, so the normal Hessian is non-degenerate. ∎

---

## U.9 Morse-Bott Asymptotics

### U.9.1 Partition Function Structure

The vacuum fluctuation amplitude is computed via a path integral:

$$Z = \int \mathcal{D}u \, e^{-\lambda S_{\text{disc}}(u)}$$

where $\lambda = C_{\max}/\varepsilon_0 = 2$ is the structural PCE capacity ratio.

### U.9.2 Standard Laplace Asymptotics

**Theorem U.14 (Morse-Bott Laplace formula).** Let $f:\mathbb R^N\to\mathbb R$ be $C^6$ on a tubular neighborhood of a compact embedded $m$-manifold $\mathcal C$. Assume that $\mathcal C=\{x:f(x)=f^*\}$ is the complete global minimum set, that $df|_{\mathcal C}=0$, and that the normal Hessian $H_u$ is uniformly positive definite. Assume also that $e^{-\lambda_0f}$ is integrable for some $\lambda_0>0$ and that for every sufficiently small tubular neighborhood $U$ there is $c_U>0$ with $f\ge f^*+c_U$ on $\mathbb R^N\setminus U$. Then, as $\lambda\to+\infty$,
$$
\int_{\mathbb R^N}e^{-\lambda f(x)}dx
=C\lambda^{-(N-m)/2}e^{-\lambda f^*}\bigl(1+O(\lambda^{-1})\bigr),
$$
where
$$
C=(2\pi)^{(N-m)/2}\int_{\mathcal C}\det(H_u|_{N_u\mathcal C})^{-1/2}\,d\operatorname{vol}_{\mathcal C}(u).
$$

*Proof.* A finite tubular atlas and partition of unity reduce the integral near $\mathcal C$ to coordinates $(u,v)$ with $v\in N_u\mathcal C$. Taylor's theorem and $df|_{\mathcal C}=0$ give
$$
f(u,v)=f^*+\tfrac12\langle H_uv,v\rangle+R_u(v),
\qquad |R_u(v)|\le C_3\|v\|^3,
$$
with uniform derivative bounds by compactness. Uniform positive definiteness supplies a Gaussian majorant after shrinking the tube. Rescaling $v=\lambda^{-1/2}z$ produces the factor $\lambda^{-(N-m)/2}$; the leading Gaussian integral is $(2\pi)^{(N-m)/2}\det H_u^{-1/2}$. The odd order-$\lambda^{-1/2}$ term integrates to zero on each normal fiber, and the $C^6$ Taylor and Jacobian expansions give a uniform relative $O(\lambda^{-1})$ remainder. Integrating the leading coefficient over compact $\mathcal C$ gives $C$. On the complement of the tube, the gap and integrability hypotheses bound the contribution by $O(e^{-\lambda(f^*+c_U)})$, which is exponentially smaller than the displayed leading term. ∎

### U.9.3 Application to the Vacuum Instanton

Within the Appendix U five-mode reference branch, model the discretized bounce $u^*$ as lying on a critical manifold of dimension $m = 5$ (the collective coordinates). Theorem U.14 then identifies the corresponding leading Morse-Bott zero-mode counting pattern
$$
Z = A_{\mathrm{MB}}(\lambda)\,\lambda^{-(N-5)/2} e^{-\lambda S^*}(1+O(\lambda^{-1})),
$$
where $A_{\mathrm{MB}}(\lambda)$ collects determinant and Jacobian factors, $N$ is the total number of Gaussian directions, and $S^* = S_{\text{disc}}(u^*)$ is the instanton action. In the PU application $\lambda = C_{\max}/\varepsilon_0 = 2$ is fixed rather than taken to $+\infty$, so this formula is used only to identify the zero-mode power $(N-5)/2$ entering the exponent-counting convention below; the omitted $O(\lambda^{-1})$ term is not discarded as a controlled small correction. Theorem U.8c shows that this five-mode count is not realized by the pure-coordinate dilatation direction of the current continuum action.

---

## U.10 Complexity Deficit

### U.10.1 Complexity-Action Correspondence

**Proposition U.14 (Conditional complexity-action relation on the residual-budget branch).** Assume, in addition to the residual-budget identity of Appendix E and Equation Q.10, that the dimensionless Euclidean action assigns the same contribution $C_{\max}/\varepsilon_0$ to each unit of the Appendix U complexity parameter $\kappa$. Then
$$
S_{\text{inst}}=\rho\kappa,
\qquad
\rho:=\frac{C_{\max}}{\varepsilon_0}.
$$
On the residual-budget branch, $C_{\max}^*=\ln d_0-\varepsilon_0=2\ln2$ and $\varepsilon_0=\ln2$, so $\rho=2$ and
$$
S_{\text{inst}}=2\kappa.
$$
The equal-contribution action map is a branch hypothesis; Equation Q.10 supplies the value of $\rho$ but does not derive that map. Relative to the $\rho=2$ branch, a branch with the same $\kappa_\Lambda$ and ratio $\rho$ changes the exponential weight by $e^{-(\rho-2)\kappa_\Lambda}$.

*Proof.* The first displayed identity is the stated equal-contribution hypothesis summed over $\kappa$ action units. Substitution of $C_{\max}^*=2\ln2$ and $\varepsilon_0=\ln2$ gives $\rho=2$. Taking the ratio $e^{-\rho\kappa_\Lambda}/e^{-2\kappa_\Lambda}$ gives the final factor. ∎

**Remark U.14.1: One-Loop Correction via Zeta Regularization.** The one-loop correction to the instanton action is formally computed via the zeta-regularized functional determinant on the attractor orbit $\operatorname{Gr}(2,8)$:

$$\log\det'(-\Delta_{g_B} + \alpha) = -\zeta'_{\mathcal{O}}(0)$$

where $\zeta_{\mathcal{O}}(s) = \sum_{(m_1,m_2) \neq (0,0)} \operatorname{mult}(m_1, m_2) \cdot (\lambda_B(m_1, m_2) + \alpha)^{-s}$ uses the Laplacian eigenvalues on $\operatorname{Gr}(2,8)$ (Helgason 1984). The multiplicities follow from spherical representation theory for the symmetric pair $(U(8), U(2) \times U(6))$. Under $K$-invariance, the mass parameter equals the hierarchy coefficient:

$$\alpha = \frac{1}{16\sigma_B^2} = \frac{1}{16 \cdot (1/24)} = \frac{24}{16} = \frac{3}{2}$$

where $\sigma_B^2 = 1/M = 1/24$ uses the interface-mode count $M=24$ from Theorem Z.5 together with the canonical unit-radius normalization convention of Lemma T.41.2.

*Derivation.* On the residual-budget branch stated in Proposition U.14, Equation E.14 and Equation Q.10 supply $C_{\max}/\varepsilon_0=2$, while the branch definition of the complexity-action map is $S_{\text{inst}}=(C_{\max}/\varepsilon_0)\kappa$. Substitution yields $S_{\text{inst}}=2\kappa$.

*Consistency check.* The cosmological constant formula:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-S_{\text{inst}}} = 8\pi A_{\text{eff}} \cdot e^{-2\kappa}$$

Using $\varepsilon_0 = \ln 2$, this can equivalently be written as:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot 2^{-2\kappa/\ln 2} = 8\pi A_{\text{eff}} \cdot 2^{-2\kappa \cdot \log_2 e}$$

Relative to an isolated $N$-dimensional Gaussian saddle, the Morse-Bott removal of $m$ normal Gaussian directions changes $\lambda^{-N/2}$ to $\lambda^{-(N-m)/2}=\lambda^{-N/2}\lambda^{m/2}$. Thus the relative zero-mode factor is $\lambda^{m/2}=2^{m/2}$ at $\lambda=2$, while the exponent-counting convention reduces the number of contributing real Gaussian directions from $N$ to $N-m$ and the associated complex count from $\kappa_0$ to $\kappa_0-m/2$.

### U.10.2 Zero Mode Contribution

**Convention U.14a (Complexity Parameter).** The instanton complexity $\kappa$ is defined as the effective number of complex normal directions contributing to the exponential suppression factor $e^{-2\kappa}$. All power-law prefactors in $\lambda$, determinants, and Jacobian contributions from the Morse-Bott measure are absorbed into the effective prefactor $A_{\text{eff}}$. This convention separates the dominant exponential scaling (controlled by $\kappa$) from subleading polynomial corrections (packaged into $A_{\text{eff}} \sim O(1)$).

**Theorem U.15 (Leading-Order Complexity Deficit from Zero Modes).** Assume the Appendix U leading-order reference-counting convention of Corollary U.10, namely that the relevant collective-coordinate manifold has real dimension $m = 5$ (four translations and one dilatation mode). Under the leading-order Morse-Bott counting pattern of Section U.9.3 and Convention U.14a, these collective coordinates contribute the deficit
$$
\delta = \frac{m}{2} = \frac{5}{2} = 2.5
$$
to the exponent-counting parameter used in the vacuum weight.

*Proof.*

**Step 1 (Leading-order zero-mode count).** Section U.9.3 identifies the Morse-Bott power
$$
\lambda^{-(N_{\mathbb{R}}-m)/2}
$$
with $\lambda = C_{\max}/\varepsilon_0 = 2$ (Appendix Q), $N_{\mathbb{R}} = 288$ the real dimension of the integration domain (Remark U.3a), and $m = 5$ the assumed real dimension of the collective-coordinate manifold. At the manuscript's fixed $\lambda$, this is used as a leading-order counting pattern rather than as a controlled exact asymptotic evaluation.

**Step 2 (Convention-based exponent parameter).** The base complexity $\kappa_0 = 144$ counts the complex dimension of $\text{Gr}_{\mathbb{C}}(12,24)$ (Theorem U.3), with $N_{\mathbb{R}} = 2\kappa_0$. By Convention U.14a, the leading-order exponent-counting parameter is
$$
\kappa_{\mathrm{ref}} := \frac{N_{\mathbb{R}} - m}{2} = \frac{288 - 5}{2} = 141.5,
$$
with the remaining determinant, Jacobian, and finite-$\lambda$ factors absorbed into $A_{\text{eff}}$.

**Step 3 (Complex vs real dimensions).** The collective coordinates are intrinsically real degrees of freedom arising from spacetime symmetries of the Euclidean bounce. Each real zero mode removes one real direction from the Gaussian normal bundle. Since the reference exponent parameter counts complex directions, the corresponding deficit is
$$
\delta := \kappa_0 - \kappa_{\mathrm{ref}} = 144 - 141.5 = \frac{m}{2} = \frac{5}{2} = 2.5.
$$

Thus the assumed five real collective coordinates contribute the stated leading-order deficit in the Appendix U reference-counting parameter. By Theorem U.8c, the current Definition U.4 continuum action does not realize the pure-coordinate dilatation direction as a zero mode. Under the sampled-sector exactness hypothesis of Theorem U.13, the sampled translation+dilatation restriction of the discrete Hessian also has no fifth zero mode. Under the corrected Definition U.6 normalization and the explicit false-vacuum spectral hypotheses of Theorem U.13b, the four-mode branch has exactly four translational zero modes and no additional nullity; in that branch the corresponding leading-order deficit is $2$ instead of $2.5$. $\square$

---

## U.10.3 One-Loop Determinant Structure

**Proposition U.15a (One-loop determinant of the shifted Grassmannian Laplacian).** Let
$$
O=-\Delta_{g_B}+\alpha,
\qquad
\alpha=\frac{1}{16\sigma_B^2}=\frac32,
$$
on $\operatorname{Gr}(2,8)\cong U(8)/(U(2)\times U(6))$. Since $-\Delta_{g_B}\ge0$ and $\alpha>0$, $O$ is strictly positive and has no zero mode. Define
$$
\zeta_\alpha(s)=\sum_{m_1\ge m_2\ge0}\operatorname{mult}(m_1,m_2)
\bigl(\lambda_B(m_1,m_2)+\alpha\bigr)^{-s},
$$
including the constant representation $(m_1,m_2)=(0,0)$. Its zeta determinant and Gaussian factor are
$$
\det_\zeta O=\exp[-\zeta_\alpha'(0)],
\qquad
K=(\det_\zeta O)^{-1/2}=\exp\!\left[\frac12\zeta_\alpha'(0)\right].
$$
Because $\dim_{\mathbb R}\operatorname{Gr}(2,8)=24$, the defining series converges for $\operatorname{Re}s>12$ and has the usual heat-kernel meromorphic continuation to $s=0$. If a specified finite-dimensional collective-coordinate or gauge subspace is to be removed, its projection must be included in the branch certificate and the prime must refer to that projection; positivity of $O$ alone removes no mode.

**Corollary U.15b (Observed Prefactor and Adopted Forward-Evaluation Convention).** Using the observed value $\Lambda L_P^2 = (2.86599 \pm 0.04849)\times 10^{-122}$ (Appendix V, Equation (V.5)), the prefactor inferred from the Appendix U reference formula is

$$
A_{\text{eff}}^{(\text{obs})} := \frac{\Lambda L_P^2}{8\pi e^{-2\kappa_{\mathrm{ref}}}} = \frac{\Lambda L_P^2}{8\pi e^{-283}} = 0.917 \pm 0.016.
$$

This observational inversion is an algebraic consequence of Corollary U.17 once $\kappa_{\mathrm{ref}}$ is fixed.

For the forward evaluation used in Appendix U before determinant-transfer certification, adopt the transferred determinant convention
$$
K_{\text{transfer}} := A_{EW}^{-1},
$$
where $A_{EW}=1.084 \pm 0.005$ is the electroweak determinant-model value of Theorem T.29. This transfer is a modeling convention unless the Bismut-Lebeau determinant-transfer datum of Definition U.15g is accepted, in which case Theorem U.15h promotes the transfer to a determinant-gluing identity. Including the conservative systematic allowance $\sigma_{T2}=0.010$ for (i) ghost/zero-mode normalization and (ii) minimal-bounce extensivity conventions in $N_{\text{eff}}$, the Appendix U working value is

$$
\boxed{A_{\text{eff}} = 0.923 \pm 0.011 \qquad (\text{Appendix U working convention},\ 1\sigma).}
$$

Because this working value inherits the determinant-model factor $A_{EW}^{-1}$, $A_{\text{eff}}$ and $A_{EW}$ are not independent inputs when they occur in the same product. On the transfer branch, uncertainty propagation must use the primitive $A_{EW}$ contribution together with the separately registered bounce, extensivity, and transfer allowances, retaining their covariance rather than reusing the marginal $\sigma(A_{\text{eff}})$ as an independent error.

This gives the corresponding reference evaluation

$$
\boxed{\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-2\kappa_{\mathrm{ref}}} = (2.88 \pm 0.03)\times 10^{-122}.}
$$

The agreement between $A_{\text{eff}}^{(\text{obs})}$ and the Appendix U working value is an internal consistency check on the adopted prefactor convention within the five-mode reference branch. By Theorem U.8c, that branch is not a theorem-level consequence of the current Definition U.4 continuum action. ∎

**Remark U.15b.1 (Cosmological-Input Scaling of the Observational Inversions).** The inversions $A_{\mathrm{eff}}^{(\mathrm{obs})}$ and $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$ scale as $\Lambda\propto H_0^2\Omega_\Lambda$ through Equations (V.4)–(V.5). Their baseline values use the Appendix V hybrid diagonal-input convention formed from the rounded Planck 2018 marginals
$$
H_0=67.4\pm0.5\,\mathrm{km\,s^{-1}\,Mpc^{-1}},
\qquad
\Omega_\Lambda=0.6889\pm0.0056
$$
(Remark H.1a.2). As a one-parameter sensitivity calculation, replacing the Planck value of $H_0$ by $73.04\pm1.04\,\mathrm{km\,s^{-1}\,Mpc^{-1}}$ [Riess et al. 2022], retaining the Planck value and uncertainty for $\Omega_\Lambda$, and treating the quoted uncertainties as independent gives
$$
A_{\mathrm{eff}}^{(\mathrm{obs})}=1.077\pm0.032,
\qquad
A_{\mathrm{eff}}^{(\mathrm{obs},4)}=2.93\pm0.09,
$$
where the displayed bands use diagonal propagation of the stated marginal inputs. This hybrid substitution is not an independent joint cosmological fit. The numerical inversions in this appendix inherit these cosmological inputs unless an alternative input set is stated explicitly. The common $\Lambda$ factor cancels in the diagnostic combination of Corollary U.72d, but that algebraic cancellation does not promote $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$ to a forward vacuum prefactor (Proposition U.15c; Corollary U.15f).

**Proposition U.15c (Vacuum Prefactor Status Boundary).** In the current Appendix U vacuum sector, $A_{\mathrm{eff}}$ has exactly two admissible uses:

1. $A_{\mathrm{eff}}^{(\mathrm{obs})}$ or $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$ is an observational inversion after a branch exponent has been fixed;
2. the Appendix U working value $A_{\mathrm{eff}}=0.923\pm0.011$ is a forward-evaluation convention obtained by transferring the Appendix T determinant-model convention and appending the stated bounce-prefactor allowance.

Neither use is a theorem-level derivation of the vacuum prefactor. A theorem-level value of $A_{\mathrm{eff}}$ requires a fixed ghost, Jacobian, determinant, zero-mode, finite-volume, extensivity, and measure-normalization calculation on the same vacuum branch.

*Proof.* For any fixed exponent $\kappa$ in the vacuum formula
$$
\Lambda L_P^2=8\pi A_{\mathrm{eff}}e^{-2\kappa},
$$
the observational inversion is algebraically
$$
A_{\mathrm{eff}}^{(\mathrm{obs},\kappa)}
=
\frac{\Lambda L_P^2}{8\pi e^{-2\kappa}}.
$$
This computes the prefactor required to match the observed value after $\kappa$ is chosen; it does not determine $A_{\mathrm{eff}}$ from PU vacuum dynamics. Conversely, the Appendix U working value is obtained by the convention $K_{\mathrm{transfer}}=A_{EW}^{-1}$ together with an explicit systematic allowance for ghost/zero-mode and extensivity conventions. Since Theorem T.29.2 makes $A_{EW}$ model-conditional, the transferred factor cannot have stronger status in Appendix U than the determinant model from which it is transferred. Finally, Proposition U.15a defines the determinant object but does not evaluate all finite determinant, Jacobian, ghost, zero-mode, finite-volume, extensivity, and measure factors on the four-mode false-vacuum branch. Hence the current manuscript has a forward convention and an observational inversion, but not a theorem-level vacuum prefactor. ∎

**Remark U.15c.1 (Vacuum Weight Interpretation of $\Lambda$).** Within Appendix U, the cosmological constant is the gravitational-unit expression of a residual vacuum-sector finite-action weight:
$$
\Lambda L_P^2=8\pi A_{\mathrm{eff}}e^{-2\kappa}.
$$
The exponent $\kappa$ is determined by the vacuum configuration-space count and zero-mode ledger of the chosen branch. The current theorem-level false-vacuum branch gives
$$
\kappa=142
$$
under Theorem U.13b, while the five-mode value
$$
\kappa_{\Lambda,\mathrm{ref}}=141.5
$$
remains a reference convention rather than a theorem-level zero-mode count for the current Definition U.4 continuum action.

This is not an unsuppressed Planck zero-point estimate. The exponential weight $e^{-2\kappa}$ is the compressed vacuum-sector contribution, while the forward numerical value still requires the Fredholm prefactor certificate of Definition U.15d.

**Definition U.15d (False-Vacuum Fredholm Prefactor Certificate).** A false-vacuum Fredholm prefactor certificate for the Appendix U bounce branch is a finite record
$$
\mathfrak F_U=\left(\mathcal H_{\mathrm{false}},\mathcal H_{\mathrm{bounce}},\Pi_0,\Pi_-,\mathcal J_{\mathrm{coll}},\mathcal A_{\mathrm{neg}},\mathcal A_{\mathrm{ghost}},\mathcal A_{\mathrm{fv}},\mathcal A_{\mathrm{meas}},\mu_U\right)
\tag{U.15d.1}
$$
with the following data fixed before comparison with observation:

1. $\mathcal H_{\mathrm{false}}$ and $\mathcal H_{\mathrm{bounce}}$ are self-adjoint Fredholm fluctuation operators with compact resolvent on the same PCE-admissible fluctuation Hilbert space after gauge quotienting;

2. $\Pi_0$ is the orthogonal projection onto the exact zero-mode space $\ker\mathcal H_{\mathrm{bounce}}$, of finite dimension $m_0$, and $\Pi_-$ is the finite-rank projection onto the negative eigenspace, of finite dimension $m_-$;

3. the determinant line
$$
\operatorname{Det}_U=\det\ker\mathcal H_{\mathrm{bounce}}\otimes\det(\operatorname{coker}\mathcal H_{\mathrm{bounce}})^*
$$
is oriented and its predictive anomaly class vanishes on the branch in the sense of Theorem X.9.5b;

4. the zeta-regularized determinants
$$
\det{}'_\zeta\mathcal H_{\mathrm{false}},\qquad\det{}''_\zeta\mathcal H_{\mathrm{bounce}}
\tag{U.15d.2}
$$
are evaluated with the same finite-part convention $\mu_U$, where $\det'$ omits the false-vacuum null directions removed by collective coordinates and $\det''$ omits both $\Pi_0$ and $\Pi_-$ from the spectral product;

5. $\mathcal J_{\mathrm{coll}}$ is the collective-coordinate Jacobian for the $m_0$ exact zero modes; $\mathcal A_{\mathrm{neg}}$ is the negative-mode contribution implementing the standard Callan–Coleman half-imaginary prescription on the $m_-$ negative directions; $\mathcal A_{\mathrm{ghost}}$ is the ghost/gauge-volume factor; $\mathcal A_{\mathrm{fv}}$ is the finite-volume/extensivity factor identifying $N_{\mathrm{eff}}$; and $\mathcal A_{\mathrm{meas}}$ is the measure-normalization factor.

The certified forward prefactor is
$$
A_{\mathrm{eff}}^{\mathrm{Fred}}=\mathcal J_{\mathrm{coll}}\,|\mathcal A_{\mathrm{neg}}|\,\mathcal A_{\mathrm{ghost}}\,\mathcal A_{\mathrm{fv}}\,\mathcal A_{\mathrm{meas}}\left(\frac{\det{}'_\zeta\mathcal H_{\mathrm{false}}}{|\det{}''_\zeta\mathcal H_{\mathrm{bounce}}|}\right)^{1/2},
\tag{U.15d.3}
$$
where $|\mathcal A_{\mathrm{neg}}|$ and $|\det{}''_\zeta\mathcal H_{\mathrm{bounce}}|$ retain the modulus on the negative spectral subspace; the imaginary part required for false-vacuum decay is carried by $\mathcal A_{\mathrm{neg}}$ and is not part of the magnitude prefactor used in the static $\Lambda$ formula.

**Theorem U.15e (Fredholm gate and dilatation spectral audit).** Let $s_D=x^\mu\partial_\mu\phi^*$ belong to the quotient Hilbert space of a candidate false-vacuum record $\mathfrak F_U$. First apply the certificate gate: if the quotient Hessian is not self-adjoint Fredholm with the recorded spectral projections, or if the determinant line, orientation, anomaly condition, or common finite-part convention required by Definition U.15d fails, the branch is rejected as a theorem-level prefactor branch. If the gate is satisfied, exactly one of the following spectral alternatives holds:

1. $s_D\in\ker\mathcal H_{\mathrm{bounce}}$, in which case it is an exact collective coordinate represented in $\Pi_0$ and $\mathcal J_{\mathrm{coll}}$;
2. $s_D\notin\ker\mathcal H_{\mathrm{bounce}}$, in which case its nonzero component in $\ker\mathcal H_{\mathrm{bounce}}^\perp$ is handled by the recorded spectral determinant, with its negative spectral projection handled by $\Pi_-$ and $\mathcal A_{\mathrm{neg}}$.

For the Definition U.4 continuum action, Theorem U.8c gives
$$
\langle s_D,\mathcal H_{\mathrm{bounce}}s_D\rangle<0.
$$
Hence $s_D\notin\ker\mathcal H_{\mathrm{bounce}}$ and its negative spectral projection is nonzero. This is a negative direction statement, not an eigenvector statement. Under the additional hypotheses of Theorem U.13b, the full discrete kernel contains only the four translations. A theorem-level four-mode prefactor is consequently obtained only by evaluating every factor of (U.15d.3) on the same accepted branch.

*Proof.* After the certificate gate, self-adjointness gives the orthogonal decomposition
$$
s_D=\Pi_0s_D+\Pi_-s_D+\Pi_+s_D,
$$
where $\Pi_+$ denotes the remaining nonzero spectral subspace. Either $(I-\Pi_0)s_D=0$, which is alternative 1, or it is nonzero, which is alternative 2; the alternatives are mutually exclusive and exhaustive. On the Definition U.4 branch, the negative quadratic form excludes alternative 1. Moreover, if $\Pi_-s_D=0$, then the spectral theorem would give
$$
\langle s_D,\mathcal H_{\mathrm{bounce}}s_D\rangle
=\langle\Pi_+s_D,\mathcal H_{\mathrm{bounce}}\Pi_+s_D\rangle\ge0,
$$
contradicting Theorem U.8c. Thus $\Pi_-s_D\ne0$. Theorem U.13b independently identifies the four-dimensional discrete kernel. The determinant, negative-mode, and collective-coordinate factors then enter exactly as prescribed by (U.15d.3). ∎

**Definition U.15e.1 (Dilatation Negative-Mode Audit Entry).** On a four-mode Appendix U false-vacuum branch carrying $\mathfrak F_U$, a dilatation negative-mode audit entry is a finite record
$$
\mathfrak D_U^-=(\lambda_D,\nu_D,\mathcal N_D,\rho_D,\chi_D)
\tag{U.15e.1}
$$
fixed on the same PCE-admissible fluctuation Hilbert space, quotient, orientation, and finite-part convention as Definition U.15d, with the following entries:

1. $\Pi_-s_D$ is nonzero and spans a one-dimensional invariant retained dilatation channel for $\mathcal H_{\mathrm{bounce}}$; on that channel $\mathcal H_{\mathrm{bounce}}=\lambda_D I$ with $\lambda_D<0$.
2. $\nu_D=1$ records simplicity of this retained negative channel. If the retained dilatation projection is not simple, the audit entry is not accepted.
3. $\mathcal N_D$ records the branch normalization of $s_D$ and the comparison normalization used for the one-dimensional negative-mode determinant.
4. $\rho_D$ is the positive magnitude factor contributed by this one-dimensional channel to $|\mathcal A_{\mathrm{neg}}|\,|\det{}''_\zeta\mathcal H_{\mathrm{bounce}}|^{-1/2}$ after the decay phase has been separated into $\mathcal A_{\mathrm{neg}}$.
5. $\chi_D=1$ records that $\lambda_D$, $\mathcal N_D$, and $\rho_D$ were computed without using $\Lambda_{\mathrm{obs}}$, $A_{\mathrm{eff}}^{(\mathrm{obs})}$, $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$, or a transferred electroweak prefactor.

If the same normalization isolates only this one-dimensional factor and compares it to a reference negative eigenvalue $\lambda_{\mathrm{ref}}<0$, then
$$
\frac{\rho_D(\lambda_D)}{\rho_D(\lambda_{\mathrm{ref}})}
=
\left(\frac{|\lambda_{\mathrm{ref}}|}{|\lambda_D|}\right)^{1/2}.
\tag{U.15e.2}
$$
Consequently, a requested one-dimensional magnitude ratio $e$ is equivalent to
$$
|\lambda_D|=|\lambda_{\mathrm{ref}}|e^{-2}.
\tag{U.15e.3}
$$
Under the dimensionless comparison normalization $|\lambda_{\mathrm{ref}}|=2$, the diagnostic target is $|\lambda_D|=2e^{-2}$.

**Theorem U.15e.2 (Soft-Dilatation Diagnostic is Certificate-Bound).** The audit entry $\mathfrak D_U^-$ can modify the four-mode vacuum prefactor only as one explicitly evaluated factor inside (U.15d.3). It cannot convert the strict negative dilatation direction into a fifth zero mode, cannot change $\kappa=142$ on the Theorem U.13b branch, and cannot close the numerical $\Lambda$ row unless the remaining entries of Definition U.15d or Definition U.15m are accepted on the same branch.

*Proof.* Equation (U.15e.2) is the one-dimensional determinant identity for a nonzero spectral entry in the negative subspace after the decay phase prescription has been separated into $\mathcal A_{\mathrm{neg}}$. Theorem U.8c and Theorem U.13b exclude $s_D$ from the zero-mode projection $\Pi_0$ on the current branch, so no collective-coordinate Jacobian may be added for it. Therefore the soft-dilatation calculation, if performed, supplies only one factor in the Fredholm product (U.15d.3). All determinant, Jacobian, ghost, finite-volume, measure, finite-part, Hessian, and orientation entries required by Corollary U.15f and Theorem U.15m.1 remain necessary. ∎

**Corollary U.15f (No Prefactor Promotion without a Fredholm Audit).** The observational inversions $A_{\mathrm{eff}}^{(\mathrm{obs})}$ and $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$ remain observational inversions, and the Appendix U working value $A_{\mathrm{eff}}=0.923\pm0.011$ remains a forward-evaluation convention (Corollary U.15b, Proposition U.15c), unless an accepted certificate $\mathfrak F_U$ supplies a forward $A_{\mathrm{eff}}^{\mathrm{Fred}}$ via (U.15d.3) with all of $\mathcal J_{\mathrm{coll}}$, $|\mathcal A_{\mathrm{neg}}|$, $\mathcal A_{\mathrm{ghost}}$, $\mathcal A_{\mathrm{fv}}$, $\mathcal A_{\mathrm{meas}}$, $\det{}'_\zeta\mathcal H_{\mathrm{false}}$, and $|\det{}''_\zeta\mathcal H_{\mathrm{bounce}}|$ evaluated on the same vacuum branch and finite-part convention. The certificate machinery defines what would constitute a theorem-level forward prefactor; performing the audit is a separate calculation whose result may agree with, refute, or replace the working value.

*Proof.* Combine Theorem U.15e (which gates the audit on an accepted certificate) with Proposition U.15c (which records that the working value and observational inversions are not theorem-level prefactors). Without the seven explicit factors evaluated on a common branch, formula (U.15d.3) is not instantiated and no scalar prefactor is determined by PU vacuum dynamics. ∎

**Definition U.15f.1 (Four-Mode Fredholm Interval Audit).** On a corrected four-mode branch already carrying an accepted Fredholm certificate $\mathfrak F_U$ of Definition U.15d, a four-mode Fredholm interval audit is a finite record
$$
\mathfrak I_U^{(4)}
=
\left(
I_{\mathrm F},
I_{\mathrm B},
I_{\mathrm{coll}},
I_{\mathrm{neg}},
I_{\mathrm{ghost}},
I_{\mathrm{fv}},
I_{\mathrm{meas}},
\kappa_U,
\chi_U
\right)
\tag{U.15f.1}
$$
where:

1. $\kappa_U=142$ is the corrected four-mode exponent of Theorem U.13b.

2. $I_{\mathrm F}=[\ell_{\mathrm F}^-,\ell_{\mathrm F}^+]$ is a certified interval for
$$
\log\det{}'_\zeta\mathcal H_{\mathrm{false}}.
$$

3. $I_{\mathrm B}=[\ell_{\mathrm B}^-,\ell_{\mathrm B}^+]$ is a certified interval for
$$
\log|\det{}''_\zeta\mathcal H_{\mathrm{bounce}}|.
$$

4. $I_{\mathrm{coll}},I_{\mathrm{neg}},I_{\mathrm{ghost}},I_{\mathrm{fv}},I_{\mathrm{meas}}$ are certified intervals for the logarithms of
$$
\mathcal J_{\mathrm{coll}},
\qquad
|\mathcal A_{\mathrm{neg}}|,
\qquad
\mathcal A_{\mathrm{ghost}},
\qquad
\mathcal A_{\mathrm{fv}},
\qquad
\mathcal A_{\mathrm{meas}},
$$
using the same quotient Hessian, zero-mode convention, finite-volume convention, and finite-part scale $\mu_U$ as Definition U.15d. Write these intervals as
$$
I_x=[\ell_x^-,\ell_x^+],
\qquad
x\in\{\mathrm{coll},\mathrm{neg},\mathrm{ghost},\mathrm{fv},\mathrm{meas}\}.
$$

5. $\chi_U$ records that no interval endpoint is selected using the observed value of $\Lambda L_P^2$.

**Theorem U.15f.2 (Four-Mode Fredholm Prefactor Interval).** The combined accepted records $\mathfrak F_U$ and $\mathfrak I_U^{(4)}$ determine a forward four-mode prefactor interval
$$
A_{\mathrm{eff}}^{\mathrm{Fred},4}
\in
\left[
e^{L_U^-},
e^{L_U^+}
\right],
\tag{U.15f.2}
$$
where
$$
L_U^-
=
\ell_{\mathrm{coll}}^-
+
\ell_{\mathrm{neg}}^-
+
\ell_{\mathrm{ghost}}^-
+
\ell_{\mathrm{fv}}^-
+
\ell_{\mathrm{meas}}^-
+
\frac12(\ell_{\mathrm F}^- - \ell_{\mathrm B}^+),
\tag{U.15f.3}
$$
and
$$
L_U^+
=
\ell_{\mathrm{coll}}^+
+
\ell_{\mathrm{neg}}^+
+
\ell_{\mathrm{ghost}}^+
+
\ell_{\mathrm{fv}}^+
+
\ell_{\mathrm{meas}}^+
+
\frac12(\ell_{\mathrm F}^+ - \ell_{\mathrm B}^-).
\tag{U.15f.4}
$$
It therefore determines the theorem-level four-mode interval
$$
\Lambda_4 L_P^2
\in
8\pi e^{-284}
\left[
e^{L_U^-},
e^{L_U^+}
\right].
\tag{U.15f.5}
$$

*Proof.* Taking the logarithm of (U.15d.3) gives
$$
\log A_{\mathrm{eff}}^{\mathrm{Fred}}
=
\log\mathcal J_{\mathrm{coll}}
+
\log|\mathcal A_{\mathrm{neg}}|
+
\log\mathcal A_{\mathrm{ghost}}
+
\log\mathcal A_{\mathrm{fv}}
+
\log\mathcal A_{\mathrm{meas}}
+
\frac12
\left(
\log\det{}'_\zeta\mathcal H_{\mathrm{false}}
-
\log|\det{}''_\zeta\mathcal H_{\mathrm{bounce}}|
\right).
$$
For interval arithmetic, lower endpoints add to lower endpoints except for the subtracted bounce determinant interval, where the lower bound uses $-\ell_{\mathrm B}^+$; upper endpoints add to upper endpoints and use $-\ell_{\mathrm B}^-$. This gives (U.15f.3) and (U.15f.4). Exponentiation is monotone, giving (U.15f.2). On the corrected four-mode branch, Theorem U.13b gives $2\kappa_U=284$, so
$$
\Lambda L_P^2=8\pi A_{\mathrm{eff}}e^{-284},
$$
which gives (U.15f.5). ∎

**Corollary U.15f.3 (No Four-Mode $\Lambda$ Refit).** Once the combined legacy records $\mathfrak F_U$ and $\mathfrak I_U^{(4)}$ are accepted on one four-mode branch, the resulting legacy four-mode $\Lambda$ interval is fixed by (U.15f.5). Changing any determinant endpoint, ghost factor, collective-coordinate Jacobian, volume/extensivity factor, measure normalization, or finite-part scale after comparison defines a new Fredholm branch and cannot confirm the original interval.

*Proof.* The operator, quotient, orientation, and common finite-part data belong to $\mathfrak F_U$, while the listed interval endpoints and $\chi_U$ belong to $\mathfrak I_U^{(4)}$. The forward-lock condition forbids choosing them from $\Lambda_{\mathrm{obs}}$. A post-comparison change changes the combined finite record and therefore changes the branch. ∎

**Corollary U.15f.3a (Bare Grassmannian Volume is Not a Vacuum Prefactor Certificate).** Let
$$
X=\mathrm{Gr}_{\mathbb C}(12,24).
$$
Then
$$
\dim_{\mathbb C}X=12(24-12)=144,
\qquad
\dim_{\mathbb R}X=288.
\tag{U.15f.6}
$$
Consequently any homogeneous Fubini-Study symplectic volume contribution for $X$ is a degree-$144$ volume term, up to the chosen metric normalization. A bare scalar assignment of the form $A_{\mathrm{eff}}^{(4)}=\operatorname{Vol}(X)^{-1}$ cannot instantiate the Fredholm prefactor formula (U.15d.3) unless the same branch also supplies the collective-coordinate Jacobian, negative-mode phase and magnitude, ghost factor, finite-volume/extensivity factor, measure normalization, false-vacuum determinant, and bounce determinant required by Definition U.15d. Therefore an inverse Grassmannian volume by itself is not an admissible PU prefactor certificate for $A_{\mathrm{eff}}^{\mathrm{Fred},4}$.

*Proof.* The dimension formula for a complex Grassmannian is $k(n-k)$, giving (U.15f.6). Symplectic volume is obtained by integrating the top exterior power of the Kähler form, so the power degree is the complex dimension $144$ in any fixed homogeneous normalization. Independently of the normalization scale, Definition U.15d and equation (U.15d.3) define the vacuum prefactor as a product of the determinant, ghost, measure, finite-volume, negative-mode, and collective-coordinate factors on one branch. A single inverse volume supplies at most one factor and leaves the rest of the certificate undefined. Corollary U.15f then blocks promotion of such a scalar to the accepted four-mode prefactor. ∎

**Definition U.15g (Bismut-Lebeau Determinant-Transfer Datum).** A Bismut-Lebeau determinant-transfer datum is a finite record
$$
\mathfrak B_{\mathrm{BL}}
=
(\mathcal C_T,\mathcal C_U,\mathcal C_\perp,\delta,\|\cdot\|_Q,\mathcal B_{\mathrm{BL}},\mathfrak o_{\det})
\tag{U.15g.1}
$$
where:

1. $\mathcal C_T$ is the electroweak-threshold elliptic complex whose determinant norm gives $A_{EW}$ on the accepted Appendix T branch;

2. $\mathcal C_U$ is the vacuum-bounce Fredholm complex of Definition U.15d;

3. $\mathcal C_\perp$ is the residual transverse elliptic complex completing the determinant comparison;

4. the three complexes form an exact determinant triangle
$$
\mathcal C_T\longrightarrow\mathcal C_U\longrightarrow\mathcal C_\perp\longrightarrow\mathcal C_T[1];
\tag{U.15g.2}
$$

5. $\|\cdot\|_Q$ is the Quillen norm on the three determinant lines with the same finite-part convention used in Appendix T and Definition U.15d;

6. $\mathcal B_{\mathrm{BL}}$ is the Bismut-Lebeau Bott-Chern anomaly term of the triangle;

7. $\mathfrak o_{\det}$ orients the three determinant lines compatibly with the PU anomaly-inflow orientation of Theorem X.8d.

The datum is accepted when the anomaly-inflow condition gives
$$
\mathcal B_{\mathrm{BL}}=0
\tag{U.15g.3}
$$
and all three determinant norms are fixed before comparison with $\Lambda L_P^2$.

**Theorem U.15h (Bismut-Lebeau Determinant-Transfer Identity).** On an accepted Bismut-Lebeau determinant-transfer branch,
$$
\|\det\mathcal C_U\|_Q
=
\|\det\mathcal C_T\|_Q\,
\|\det\mathcal C_\perp\|_Q.
\tag{U.15h.1}
$$
Equivalently, the vacuum prefactor factorizes as
$$
A_{\mathrm{eff}}^{\mathrm{BL}}
=
A_{EW}^{-1}\,A_\perp,
\tag{U.15h.2}
$$
where $A_\perp$ is the residual transverse determinant contribution fixed by $\mathcal C_\perp$. The transferred factor $A_{EW}^{-1}$ is then a determinant-gluing identity rather than a modeling convention.

*Proof.* Exactness of the determinant triangle gives the canonical determinant-line isomorphism
$$
\det\mathcal C_U
\cong
\det\mathcal C_T\otimes\det\mathcal C_\perp.
$$
For Quillen norms, the Bismut-Lebeau comparison formula multiplies the right-hand side by the Bott-Chern anomaly factor $e^{\mathcal B_{\mathrm{BL}}}$. The accepted datum imposes $\mathcal B_{\mathrm{BL}}=0$ by PU anomaly inflow, so the Quillen norm is multiplicative, proving (U.15h.1). Appendix T defines the electroweak determinant contribution so that its inverse appears in the vacuum transfer convention, while $\mathcal C_\perp$ supplies the missing transverse determinant. This gives (U.15h.2). ∎

**Corollary U.15i (Vacuum Prefactor Status after Determinant Transfer).** On a branch carrying both the Fredholm prefactor certificate of Definition U.15d and the Bismut-Lebeau transfer datum of Definition U.15g,
$$
A_{\mathrm{eff}}=A_{\mathrm{eff}}^{\mathrm{BL}}=A_{\mathrm{eff}}^{\mathrm{Fred}}
\tag{U.15i.1}
$$
is a forward determinant output. If the computed value differs from the observational inversion required by the chosen exponent branch, that exponent branch is rejected rather than adjusted by prefactor convention.

*Proof.* Definition U.15d fixes the vacuum prefactor by direct Fredholm evaluation. Definition U.15g and Theorem U.15h fix the same determinant line by gluing it to the Appendix T determinant and the transverse residual complex. When both certificates are accepted, they refer to the same oriented Quillen determinant line with the same finite-part convention, hence give the same scalar. Since no observational datum enters either certificate, disagreement with observation cannot be repaired by redefining $A_{\mathrm{eff}}$ within the theorem-level branch. ∎

**Theorem U.15i.2 (Relative Quillen-Fredholm Prefactor Identity).** On a branch carrying the Fredholm certificate $\mathfrak F_U$ of Definition U.15d, define the relative determinant line
$$
\operatorname{Det}_{\mathrm{rel},U}
:=
\det{}' \mathcal H_{\mathrm{false}}
\otimes
\left(\det{}'' \mathcal H_{\mathrm{bounce}}\right)^{-1},
\tag{U.15i.2.1}
$$
where the primes encode exactly the omissions specified in Definition U.15d: false-vacuum null directions are removed from $\det{}'\mathcal H_{\mathrm{false}}$, and both $\Pi_0$ and $\Pi_-$ are removed from $\det{}''\mathcal H_{\mathrm{bounce}}$. Let $s_{\mathrm{rel},U}$ be the canonical nonzero section induced by the accepted orientation and finite-part convention. Its relative Quillen norm is
$$
\left\|s_{\mathrm{rel},U}\right\|_Q
=
\left(
\frac{\det{}'_\zeta\mathcal H_{\mathrm{false}}}
{|\det{}''_\zeta\mathcal H_{\mathrm{bounce}}|}
\right)^{1/2}.
\tag{U.15i.2.2}
$$
Then the certified vacuum prefactor is exactly
$$
A_{\mathrm{eff}}^{\mathrm{Fred}}
=
\mathcal J_{\mathrm{coll}}
|\mathcal A_{\mathrm{neg}}|
\mathcal A_{\mathrm{ghost}}
\mathcal A_{\mathrm{fv}}
\mathcal A_{\mathrm{meas}}
\left\|s_{\mathrm{rel},U}\right\|_Q.
\tag{U.15i.2.3}
$$
Thus the cosmological prefactor is a relative Quillen-Fredholm norm multiplied only by the explicitly listed collective-coordinate, negative-mode, ghost, finite-volume/extensivity, and measure factors. No separate determinant, Jacobian, ghost, or finite-volume constant may be appended outside this product without defining a new prefactor branch.

*Proof.* This is a reformulation of (U.15d.3) in canonical determinant-line language. Definition U.15d fixes the two zeta determinants with one common finite-part convention $\mu_U$, fixes the omitted zero and negative spectral subspaces by $\Pi_0$ and $\Pi_-$, and fixes the orientation of the determinant line. Therefore the determinant ratio in (U.15d.3) is precisely the Quillen norm of the relative determinant section (U.15i.2.1), giving (U.15i.2.2). Substituting (U.15i.2.2) into (U.15d.3) gives (U.15i.2.3). Since every remaining multiplicative factor in (U.15d.3) appears explicitly in (U.15i.2.3), adding any further determinant, Jacobian, ghost, finite-volume, or measure factor changes the finite record and hence defines a different branch. ∎

**Definition U.15i.3 (Common Relative Quillen Convention Ledger).** For every listed sector $s$, the ledger fixes an oriented relative determinant section $s_{\mathrm{rel},s}$, omitted-mode rule, finite-part scheme and scale, unit map, transport $T_s$ into one comparison convention, and the sector factors $\mathcal J_s$, $\mathcal A_{\mathrm{neg},s}$, $\mathcal A_{\mathrm{ghost},s}$, $\mathcal A_{\mathrm{fv},s}$, and $\mathcal A_{\mathrm{meas},s}$.

**Proposition U.15i.4 (Sector Restriction of One Convention Ledger).** On an accepted ledger,
$$
A_s=
\mathcal J_s|\mathcal A_{\mathrm{neg},s}|
\mathcal A_{\mathrm{ghost},s}
\mathcal A_{\mathrm{fv},s}
\mathcal A_{\mathrm{meas},s}
\|T_s(s_{\mathrm{rel},s})\|_Q.
\tag{U.15i.4.1}
$$
This proves convention compatibility, not equality of prefactors across sectors. A sector missing any typed factor or transport map lies outside the result.

**Corollary U.15j (Determinant-Transfer Branch-Decision Ledger).** Let
$$
\Xi_{\perp}:=A_{\perp}e^{\mathcal B_{\mathrm{BL}}}
\tag{U.15j.1}
$$
denote the residual transverse Bismut-Lebeau determinant together with its Bott-Chern anomaly factor. On a determinant-transfer branch the vacuum prefactor has the form
$$
A_{\mathrm{eff}}^{\mathrm{BL}}=A_{EW}^{-1}\Xi_{\perp}.
\tag{U.15j.2}
$$
Consequently,
$$
A_{\mathrm{eff}}^{\mathrm{BL}}A_{EW}^2
=
\Xi_{\perp}A_{EW}.
\tag{U.15j.2a}
$$
Any vacuum–electroweak product-lock uncertainty on this transfer branch must therefore be propagated in the primitive variables $(\Xi_{\perp},A_{EW})$ with their accepted covariance ledger. Treating the derived pair $(A_{\mathrm{eff}}^{\mathrm{BL}},A_{EW})$ as statistically independent would double-count the electroweak determinant uncertainty.

For a fixed exponent $\kappa$, the observed cosmological constant determines only the required prefactor
$$
A_{\mathrm{eff}}^{(\mathrm{obs},\kappa)}
=
\frac{\Lambda L_P^2}{8\pi e^{-2\kappa}},
\tag{U.15j.3}
$$
and therefore the required residual determinant
$$
\Xi_{\perp}^{(\mathrm{obs},\kappa)}
=
A_{EW}A_{\mathrm{eff}}^{(\mathrm{obs},\kappa)}.
\tag{U.15j.4}
$$
Using Appendix V, Equation (V.5),
$$
\Lambda L_P^2=(2.86599\pm0.04849)\times10^{-122}
$$
and the Appendix T determinant-model value
$$
A_{EW}=1.084\pm0.005,
$$
the branch-required values are

| Branch | $\kappa$ | $A_{\mathrm{eff}}^{(\mathrm{obs},\kappa)}$ | required $\Xi_{\perp}^{(\mathrm{obs},\kappa)}$ |
|---|---:|---:|---:|
| five-mode reference branch | $141.5$ | $0.9170\pm0.0155$ | $0.994\pm0.017$ |
| four-mode false-vacuum branch | $142$ | $2.4927\pm0.0422$ | $2.702\pm0.047$ |

The two residual-determinant requirements differ by exactly
$$
\frac{\Xi_{\perp}^{(\mathrm{obs},142)}}{\Xi_{\perp}^{(\mathrm{obs},141.5)}}
=
\frac{A_{\mathrm{eff}}^{(\mathrm{obs},142)}}{A_{\mathrm{eff}}^{(\mathrm{obs},141.5)}}
=e.
\tag{U.15j.5}
$$
The Appendix U working convention has the central bookkeeping product
$$
\Xi_{\perp}^{(\mathrm{work})}
:=A_{EW}A_{\mathrm{eff}}
=1.0005.
\tag{U.15j.6}
$$
Its uncertainty cannot be obtained by diagonal propagation of the marginal errors of $A_{EW}$ and $A_{\mathrm{eff}}$, because the transferred working $A_{\mathrm{eff}}$ already contains $A_{EW}^{-1}$. Until the primitive transfer, bounce/extensivity, and allowance covariance ledger is supplied, $\sigma(\Xi_{\perp}^{(\mathrm{work})})$ remains uncertified; the former $0.0128$ diagonal value is not an accepted transfer-branch uncertainty.
Thus, if $\Xi_{\perp}^{(\mathrm{work})}$ were promoted to a forward determinant output, it would agree with the five-mode reference requirement and miss the four-mode requirement by the factor $e$. But that promotion is not licensed by the current Appendix U data: no residual transverse complex $\mathcal C_{\perp}$, exact determinant triangle, Bott-Chern anomaly evaluation, or residual determinant computation is supplied. Therefore the current determinant-transfer ledger supplies no theorem-level preference for either $\kappa=141.5$ or $\kappa=142$.

The branch-decision rule is consequently sharp: an accepted determinant-transfer certificate with $\Xi_{\perp}$ in the first interval matches the five-mode reference exponent, an accepted certificate with $\Xi_{\perp}$ in the second interval matches the four-mode false-vacuum exponent, and a value outside both intervals rejects observational matching for both exponent branches under the same transfer convention. Until $\Xi_{\perp}$ is computed on the same finite-part convention, the five-mode agreement remains a working-convention consistency check and the four-mode mismatch remains a same-prefactor comparison, not a Bismut-Lebeau theorem-level branch decision.

*Proof.* Equation (U.15j.3) is the algebraic inversion of the vacuum formula at fixed $\kappa$. Multiplying by $A_{EW}$ gives (U.15j.4) from the determinant-transfer form (U.15j.2). The numerical values follow by direct substitution. Since $142=141.5+0.5$, one has
$$
\frac{e^{-2\cdot141.5}}{e^{-2\cdot142}}=e,
$$
which proves (U.15j.5). Equation (U.15j.6) is the same multiplication applied to the Appendix U working convention. Proposition U.15c states that the working value is not a theorem-level vacuum determinant; without a computed $\mathcal C_{\perp}$, anomaly term, and residual determinant, (U.15j.2) has no instantiated value. Therefore no determinant-transfer preference follows in the current manuscript. ∎

**Corollary U.15k (No Transfer of the Five-Mode or Electroweak Prefactor).** On the certified four-mode false-vacuum branch, neither the five-mode reference prefactor nor the electroweak determinant prefactor may be used as $A_{\mathrm{eff}}^{(4)}$ unless the Fredholm certificate of Definition U.15d and the audit of Theorem U.15e independently reproduce it from the four-mode Hessian, quotient, collective-coordinate, and finite-measure data. If determinant transfer is used, the Bismut-Lebeau datum of Definition U.15g must also compute the residual transverse determinant on the same finite-part convention.

*Proof.* Theorem U.13b and Theorem U.8c fix the current false-vacuum branch to four translational zero modes under the stated spectral hypotheses; the pure-coordinate dilatation direction is not a fifth zero mode. A five-mode prefactor uses a collective-coordinate ledger that is not present on this branch. An electroweak prefactor uses a different determinant problem. Corollary U.15f states that no prefactor is promoted without a direct Fredholm audit, while Corollary U.15j states that determinant transfer has no theorem-level value until the residual transverse determinant is computed. Therefore transfer is allowed only when the four-mode audit or the accepted transfer datum derives the same value from the four-mode determinant line. ∎

**Theorem U.15l (Four-Mode Prefactor Non-Identifiability Without Hessian Data).** The four-mode exponent $\kappa=142$ determines the exponential factor $e^{-284}$ but does not determine the multiplicative prefactor. Without the finite Hessian spectra, zero-mode quotient, negative-mode prescription, ghost/gauge-volume factor, collective-coordinate Jacobian, finite-volume/extensivity convention, measure normalization, and finite-part scale required by Definition U.15d, there exist admissible prefactor completions with the same exponent and different values of $A_{\mathrm{eff}}^{(4)}$. Consequently a numerical four-mode value of $\Lambda L_P^2$ is not theorem-level until the prefactor certificate is evaluated.

*Proof.* In the vacuum formula
$$
\Lambda L_P^2=8\pi A_{\mathrm{eff}}^{(4)}e^{-2\kappa},
\tag{U.15l.1}
$$
fixing $\kappa=142$ fixes only the exponential. The scalar $A_{\mathrm{eff}}^{(4)}$ is a product of determinant, Jacobian, quotient, negative-mode, ghost, finite-volume, and measure factors. If any one of these finite entries is unspecified, it can be varied within the admissible Fredholm and finite-measure class while preserving the same exponent. Such variations change (U.15l.1). Theorem P.14.1f therefore blocks theorem-level numerical promotion from the exponent alone. Corollary U.15f gives the corresponding audit rule. ∎

**Remark U.15d.0 (Anchor to the Global Ledger).** Definition U.15d together with Theorem U.15e supplies the local strict PPI/PCE certificate of the cosmological constant prefactor row in Convention P.14.1k. Corollary U.15f forbids promotion without the audit, and Theorem U.15l blocks four-mode prefactor promotion without the Fredholm record. An evaluated $\mathfrak F_U$ filling every item of Definition U.15d closes an exact scalar row; a certified interval row additionally uses $\mathfrak I_U^{(4)}$ of Definition U.15f.1. Definition U.73e packages those requirements together with the certified finite sampled Hessian $H_4$ and cutoff/partial-product/spectral-tail record $\mathcal T_4$ into the canonical four-mode record $\mathfrak F_U^{(4)}$. The earlier $\mathfrak F_U+\mathfrak I_U^{(4)}$ representation is equivalent only when it is supplemented by accepted $H_4$, $\mathcal T_4$, and every other entry of Definition U.73e on the same branch; an interval tuple without those underlying records does not close the row.

**Definition U.15m (Fredholm Prefactor Gate).** The cosmological-constant prefactor row is theorem-closed only when the finite Fredholm record supplies the entries required by Definition U.15d on one common vacuum branch and finite-part convention:

1. the false-vacuum fluctuation operator $\mathcal H_{\mathrm{false}}$,
2. the bounce fluctuation operator $\mathcal H_{\mathrm{bounce}}$,
3. the exact zero-mode projector $\Pi_0$,
4. the negative-mode projector $\Pi_-$ and negative-mode prescription $\mathcal A_{\mathrm{neg}}$,
5. the ghost or gauge-volume factor $\mathcal A_{\mathrm{ghost}}$ when a redundancy is present,
6. the determinant regularization rule and finite-part scale $\mu_U$,
7. the collective-coordinate Jacobian $\mathcal J_{\mathrm{coll}}$,
8. the finite-volume/extensivity and measure factors $\mathcal A_{\mathrm{fv}}$ and $\mathcal A_{\mathrm{meas}}$,
9. the evaluated prefactor
$$
A_{\mathrm{eff}}^{(4)}
=
\mathcal J_{\mathrm{coll}}
|\mathcal A_{\mathrm{neg}}|
\mathcal A_{\mathrm{ghost}}
\mathcal A_{\mathrm{fv}}
\mathcal A_{\mathrm{meas}}
\left(
\frac{\det{}'_\zeta\mathcal H_{\mathrm{false}}}{|\det{}''_\zeta\mathcal H_{\mathrm{bounce}}|}
\right)^{1/2}
\tag{U.15m.1}
$$
with every entry fixed before comparison. An interval-valued version is theorem-closed only when the interval audit supplies the endpoint data of Definition U.15f.1 before comparison.

Real K-theory, Bott periodicity, Steiner/Golay/Leech data, anomaly inflow, or determinant-transfer language may construct entries of this gate only when they supply the corresponding finite Fredholm data. They do not replace the Fredholm calculation. The zero-mode count is the dimension of the kernel of $\mathcal H_{\mathrm{bounce}}$ after quotienting the exact symmetries of the selected action, and the prefactor is fixed by the determinant ratio and residual interval in $\mathfrak F_U$ and $\mathfrak I_U^{(4)}$. A KO-class label, octad count, or Leech incidence identity does not by itself determine $A_{\mathrm{eff}}^{(4)}$.

**Theorem U.15m.1 (No Cosmological-Prefactor Promotion without the Fredholm Gate).** The four-mode cosmological-constant prefactor row is closed if Definition U.15m is satisfied. Without the full gate, the exponent row may retain its stated status, but the prefactor row remains certificate-pending.

*Proof.* Equation (U.15m.1) is exactly the four-mode specialization of the Fredholm prefactor formula (U.15d.3). If the entries are accepted on one branch and finite-part convention, the prefactor is fixed and Theorem D.8.9b applies. If any input entry is missing, two completions can agree on the exponent and all parent rows while differing in the determinant ratio, collective-coordinate Jacobian, zero-mode quotient, negative-mode prescription, ghost factor, finite-volume/extensivity factor, measure normalization, or finite-part scale. Theorem P.14.1f gives non-identifiability of $A_{\mathrm{eff}}^{(4)}$, and Convention P.14.1l forbids promotion. ∎

**PPI mapping chain (vacuum weight).** The identification
$$
\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-2\kappa_{\mathrm{ref}}}
$$
uses the following explicit instantiation steps:

1. **Grassmannian identification.** Section U.4 registers $\operatorname{Gr}_{\mathbb C}(12,24)$ as the Appendix U reference configuration model. Theorem U.3 proves its complex dimension $k(M-k)=12^2=144$, and Convention U.14a assigns that complex normal-direction count to the base exponent parameter.

2. **Action mapping.** The instanton action is identified as $S_{\text{inst}}=(C_{\max}^*/\varepsilon_0)\kappa$ with the operating-point value $C_{\max}^*/\varepsilon_0=2$ (Appendix Q). Within the Appendix U reference scheme this gives $S_{\text{inst}}=2\kappa_{\mathrm{ref}}$. The mapping is structural on the residual-budget branch but inherits the certificate status of the zero-mode, determinant, and finite-record ledgers named in Convention P.14.1h.

3. **Einstein-normalization factor.** The PPI mapping identifies the vacuum amplitude with the coefficient of $g_{\mu\nu}$ in the Einstein-equation convention $G_{\mu\nu}+\Lambda g_{\mu\nu}=8\pi G T_{\mu\nu}$. Accordingly, when the result is written as the dimensionless quantity $\Lambda L_P^2$, a pure numerical factor $8\pi$ appears (Appendix V, normalization note following Equation (V.2)).

4. **Prefactor definition and scope.** $A_{\text{eff}}:=K\cdot N_{\text{eff}}$ absorbs all power-law factors from determinants, Jacobians, gauge-volume normalizations, and extensivity counting (Proposition U.15a and Convention U.14a). Different regularization choices reshuffle finite terms inside $A_{\text{eff}}$ but do not change the exponential factor.

5. **Competing saddles require a separate saddle ledger.** A second saddle with the same action-complexity map and complexity $\kappa'=\kappa_{\mathrm{ref}}+\Delta\kappa$ has relative exponential weight $e^{-2\Delta\kappa}$. Half-integer spacing follows only for branches with the same base count whose sole difference is an integer change in the real zero-mode count. No lower bound on $\Delta\kappa$ follows for a saddle with a different action, configuration space, determinant branch, or action-complexity map; such saddles must be enumerated and compared explicitly.

**Uncertainty budget for $\Lambda L_P^2$.** Write
$$
\ln(\Lambda L_P^2)=\ln(8\pi)+\ln A_{\text{eff}}-2\kappa_{\mathrm{ref}}.
$$
Within the Appendix U conventions, the reference value $\kappa_{\mathrm{ref}}=141.5$ is the Appendix U five-mode reference exponent of Theorem U.16, using the leading-order zero-mode deficit of Theorem U.15. The explicit budget written below quantifies the prefactor sector at fixed reference exponent; any correction to the exponent count is a separate T2 branch/status change. The prefactor-sector contributions that can be stated explicitly are:

* **(T1) determinant evaluation:** $\sigma_{\ln K}$ from truncating the heat-kernel/zeta evaluation of $\zeta'_\alpha(0)$ on $\text{Gr}(2,8)$;
* **(T2) extensivity and zero-mode normalization:** $\sigma_{\ln N_{\text{eff}}}$ from the finite-volume/channel-count convention, ghost normalization, and zero-mode normalization;
* **(T1) higher-loop corrections:** $\sigma_{\ge 2\text{-loop}}$, expected to scale as $O(1/\kappa_{\mathrm{ref}})$ on compact symmetric spaces under Convention U.14a.

Once $(K,N_{\text{eff}})$ are evaluated to relative precision $\sigma_K/K$ and $\sigma_N/N_{\text{eff}}$, the propagated theory uncertainty is:
$$
\sigma^2_{\ln(\Lambda L_P^2)} \simeq \left(\frac{\sigma_K}{K}\right)^2 + \left(\frac{\sigma_N}{N_{\text{eff}}}\right)^2 + \sigma^2_{\ge 2\text{-loop}}.
$$
For observational comparison, Appendix V.1 provides the observational contribution from $(H_0,\Omega_\Lambda,L_P)$; the inference of $A_{\text{eff}}^{(\text{obs})}$ in Corollary U.15b combines theory and observational uncertainties in quadrature.

---

## U.11 Main Result

**Theorem U.16 (Reference Cosmological Constant Complexity).** Under Theorem U.15 and the Appendix U leading-order five-mode reference-counting convention, the reference exponent parameter is

$$\boxed{\kappa_{\mathrm{ref}} = k^2 - \frac{D+1}{2} = 144 - \frac{5}{2} = 141.5}$$

where:
- $k = 12$ is the Golay code dimension (Theorem Z.13)
- $D = 4$ is the emergent spacetime dimension (Theorem Z.11)
- The complex dimension $k^2=144$ is proved by Theorem U.3 and is assigned to the base complexity under Convention U.14a
- The deficit $(D+1)/2 = 5/2$ is the leading-order zero-mode deficit supplied by Theorem U.15

This theorem records the Appendix U reference exponent only within the stated leading-order counting convention; it does not assert that the five-mode count has already been established as an unconditional property of the continuum Hessian.

**Theorem U.16a (Exact Complexity Dichotomy with a Zero-Mode Indicator).** Assume the Morse-Bott hypotheses hold with $m=4+\nu$, $\nu\in\{0,1\}$. The value $\nu=1$ is licensed only by the exact-scale-family hypothesis of Theorem U.9 or by an accepted Definition U.16b certificate establishing one additional exact compact-orbit kernel direction. Then the instanton complexity is
$$
\kappa \;=\; \frac{N_{\mathbb R}-(4+\nu)}{2} \;=\; 142 - \frac{\nu}{2}, \qquad N_{\mathbb R}=288.
$$
Hence the two exact branches are
$$
\nu=0:\;\kappa=142,\quad e^{-2\kappa}=e^{-284};\qquad \nu=1:\;\kappa=141.5,\quad e^{-2\kappa}=e^{-283}.
$$
The current reference value $\kappa_{\mathrm{ref}}=141.5$ of Theorem U.16 is therefore exact on the $\nu=1$ branch and a leading-order reference-counting convention on the $\nu=0$ branch.

*Proof.* Apply the Morse–Bott deficit formula $\kappa=(N_{\mathbb R}-m)/2$ with $N_{\mathbb R}=288$ and $m=4+\nu$. For $\nu=0$, $\kappa=(288-4)/2=142$ and $2\kappa=284$. For $\nu=1$, $\kappa=(288-5)/2=141.5$ and $2\kappa=283$. ∎ Theorem U.8c strengthens this status statement: within the current Definition U.4 continuum action class, the pure-coordinate dilatation tangent has strictly negative Hessian quadratic form and is not a zero mode; the theorem does not assert that this tangent is a Hessian eigenvector.

**Definition U.16b (Alternative Compact Fifth-Mode Certificate).** A forward-locked Morse-Bott record fixes an action branch, critical point $\phi^*$, Hessian $\mathcal H_U$, four translational tangents, a fifth tangent $\eta_5$, kernel and negative-mode projectors, collective-coordinate measure, and overlap audit. It requires:

1. a local critical-manifold model $\mathbb R^4\times\mathcal O_5$, where only the one-parameter orbit $\mathcal O_5$ is compact;
2. the exact identity
   $$
   \ker\mathcal H_U=
   \operatorname{span}\{\eta_{\mathrm{trans},1},\ldots,
   \eta_{\mathrm{trans},4},\eta_5\};
   \tag{U.16b.1}
   $$
3. $\Pi_0$ equal to the projector onto that span, with $\eta_5$ nonzero, non-gauge, and non-null in the PPI quotient;
4. Fredholm nondegeneracy on the normal quotient after the recorded negative mode is handled; and
5. separate translation-volume and compact-orbit measures with no double counting.

**Proposition U.16c (Alternative Fifth-Mode Status).** An accepted certificate gives $m=5$, hence $\nu=1$, $\kappa=141.5$, and $e^{-2\kappa}=e^{-283}$ on that action branch. It does not convert the negative dilatation direction of Theorem U.8c into a zero mode or alter the current-action-class obstruction.

*Proof.* The exact kernel has dimension five and Theorem U.16a supplies the arithmetic. The action-branch and overlap entries enforce the scope statement. ∎

**Corollary U.17 (Reference Cosmological Constant Scale).** With this reference exponent, the vacuum weight is parameterized as

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-2\kappa_{\mathrm{ref}}} = 8\pi A_{\text{eff}} \cdot e^{-283}$$

With $A_{\text{eff}} := K \cdot N_{\text{eff}}$ (Section U.1), the baseline reference exponential factor is

$$8\pi e^{-283} = 3.13 \times 10^{-122}$$

Thus:

- Baseline reference scale on the five-mode branch: $8\pi e^{-283} = 3.13 \times 10^{-122}$.
- Appendix U working prefactor on that branch: for $A_{\text{eff}} = 0.923 \pm 0.011$,
  $$
  \Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-283} = (2.88 \pm 0.03)\times 10^{-122}.
  $$
- For the purely algebraic same-prefactor diagnostic, holding the five-mode working value fixed while changing only the exponent to the translational value $m=4$ gives
  $$
  \Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-284} = (1.06 \pm 0.01)\times 10^{-122}.
  $$
  This number is not a four-mode forward evaluation: the four-mode branch uses $A_{\mathrm{eff}}^{\mathrm{Fred},4}$ and remains certificate-pending.

The observed value $\Lambda L_P^2 = (2.86599 \pm 0.04849) \times 10^{-122}$ (Appendix V, Equation (V.5)) implies $A_{\text{eff}}^{(\text{obs})} = 0.917 \pm 0.016$ on the five-mode reference branch, while the translational branch would require
$$A_{\text{eff}}^{(\text{obs},4)} := \frac{\Lambda L_P^2}{8\pi e^{-284}} = 2.49 \pm 0.04.$$

**Corollary U.17a (Four-Mode Exponent Branch and Same-Prefactor Diagnostic).** If the full false-vacuum spectral problem has no zero modes beyond the four translational modes of Theorem U.8, then
$$
m_{\mathrm{vac}} \;=\; 4,\qquad \kappa_{\mathrm{vac}} \;=\; 142,
$$
and the four-mode forward formula is
$$
\Lambda_4 L_P^2 \;=\; 8\pi\,A_{\mathrm{eff}}^{\mathrm{Fred},4}\,e^{-284}.\tag{U.17a}
$$
The current manuscript has no accepted four-mode Fredholm prefactor record, so $A_{\mathrm{eff}}^{\mathrm{Fred},4}=\varnothing_{\mathrm{cert}}$ and no numerical four-mode forward value is asserted. Deliberately reusing the five-mode working value $A_{\mathrm{eff}}=0.923\pm0.011$ while changing only the exponent gives $(1.06\pm0.01)\times10^{-122}$ solely as a same-prefactor diagnostic. Independently, the observational inversion is
$$
A_{\mathrm{eff}}^{(\mathrm{obs},4)}
:=
\frac{\Lambda L_P^2}{8\pi e^{-284}}
=2.49\pm0.04,
$$
which is not a Fredholm evaluation.

*Proof.* Under the stated spectral hypothesis one has $\nu=0$ in Theorem U.16a, hence $\kappa_{\mathrm{vac}}=142$. Substitution fixes the exponential factor in (U.17a) but does not identify the four-mode determinant prefactor with the five-mode working convention. The same-prefactor number and the observational inversion are algebraic diagnostics with the statuses stated above; the forward numerical row remains governed by Definition U.73e and Theorem U.73f. ∎

---

## U.12 Structural Summary

### U.12.1 Two Design Roles

The derivation employs two distinct but related design structures:

| Structure | Type | Role | Reference |
|-----------|------|------|-----------|
| Golay octads | Steiner 2-design | Sets quadratic normalization: $\kappa_0 = k^2$ | Theorem Z.13 |
| 24-cell vertices | Spherical 5-design | Supplies exact sampled-sector quadrature input; under Theorem U.13, the sampled translation+dilatation restriction has exactly four translational null directions and a negative pure-coordinate dilatation direction | Theorem U.7, Theorem U.13, Theorem U.8c |

Both structures exist at $M = 24$ as derived consequences of PCE optimization (Theorem Z.12), contributing without introducing free parameters.

### U.12.2 Parameter Accounting

| Quantity | Source | Value |
|----------|--------|-------|
| $\kappa_0 = k^2$ | Grassmannian dimension | 144 |
| $m_{\mathrm{ref}}$ | Appendix U five-mode reference count | 5 |
| $\delta_{\mathrm{ref}} = m_{\mathrm{ref}}/2$ | Reference Morse-Bott deficit | 2.5 |
| $\kappa_{\mathrm{ref}} = \kappa_0 - \delta_{\mathrm{ref}}$ | Five-mode reference exponent | **141.5** |
| $m_{\mathrm{trans}}$ | Translational branch count under the hypotheses of Theorem U.13b | 4 |
| $\delta_{\mathrm{trans}} = m_{\mathrm{trans}}/2$ | Translational deficit | 2 |
| $\kappa_{\mathrm{trans}} = \kappa_0 - \delta_{\mathrm{trans}}$ | Translational branch exponent | **142** |
| $A_{\text{eff}} := K \cdot N_{\text{eff}}$ | One-loop prefactor definition (Section U.1) | $O(1)$ |

### U.12.3 Comparison with Observation

### U.12.4 Branch-Status Registry

**Proposition U.12.4a (Appendix U Branch-Status Registry).** The branch-sensitive quantities of Appendix U carry the following status and parameter-role labels.

| Quantity | Value / formula | Status | Parameter role | T1/T2/T3 placement |
|:---------|:----------------|:-------|:---------------|:-------------------|
| $m_{\mathrm{ref}}$ | $5$ | Convention | ReferenceConvention / DiscreteMultiplicity | T2 branch convention |
| translational zero modes | $4$ | Theorem | DiscreteMultiplicity | exact in Theorem U.8; corrected discrete closure in Theorem U.13b |
| fifth zero mode from exact scale family | conditional | Conditional theorem | DiscreteMultiplicity | T2 branch condition |
| persistence of a negative pure-dilatation quadratic form | local neighborhood statement | Conditional theorem | ThresholdData | T2 branch obstruction |
| $\kappa_{\mathrm{ref}}$ | $141.5$ | Convention | ReferenceConvention | T2 branch convention |
| $\kappa_{\mathrm{trans}}$ | $142$ | Branch theorem | ReferenceConvention | exact on the four-mode branch of Theorem U.13b |
| $\kappa = 142-\nu/2$ | $\nu\in\{0,1\}$ | Branch theorem | ThresholdData | T2 if branch unresolved |
| $A_{\mathrm{eff}}^{(\mathrm{obs})}$ | $0.917\pm 0.016$ | Empirical input | EmpiricalInput / ReferenceConvention | T3 observational inversion |
| $A_{\mathrm{eff}}$ | $0.923\pm 0.011$ | Convention | ReferenceConvention | T1 determinant-transfer truncation plus T2 prefactor convention |
| $A_{\mathrm{eff}}^{(4)}$ | undetermined until $\mathfrak F_U$ is evaluated | Open target / negative theorem gate | ThresholdData | blocked by Theorem U.15l without the Fredholm prefactor certificate of Definition U.15d |
| $\Lambda L_P^2 = 8\pi A_{\mathrm{eff}}e^{-283}$ | five-mode branch value | Convention | ReferenceConvention | T1+T2 at fixed branch |
| $\Lambda_4 L_P^2 = 8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284}$ | four-mode forward formula; numerical interval currently $\varnothing_{\mathrm{cert}}$ | Exponent branch theorem / prefactor certificate pending | ThresholdData | exponent exact on the stated branch; no numerical forward value until the four-mode Fredholm gate is accepted |
| $\kappa_Q$ | $11$ | Identification | ExactThreshold | exact inside Identification U.20 |

The observation-facing inversion table is therefore:

| Quantity | Branch Value | From Observation | Notes |
|----------|--------------|------------------|-------|
| $\kappa_{\mathrm{ref}}$ | 141.5 | — | Appendix U five-mode reference count (Theorem U.16) |
| $\kappa_{\mathrm{trans}}$ | 142 | — | Four-mode branch value under the corrected Definition U.6 normalization and the explicit false-vacuum spectral hypotheses of Theorem U.13b |
| $A_{\text{eff}}^{(\text{obs})}$ on $m=5$ branch | $O(1)$ | $0.917 \pm 0.016$ | Corollary U.15b; T3 observational inversion on the five-mode branch |
| $A_{\text{eff}}^{(\text{obs},4)}$ on $m=4$ branch | $O(1)$ | $2.49 \pm 0.04$ | same observed $\Lambda L_P^2$ with exponent $142$; T3 observational inversion on the four-mode branch |

*Proof.* The status column restates the cited theorem, corollary, identification, convention, or negative theorem gate. The parameter-role column is obtained by applying Convention P.14.1a to each occurrence: a zero-mode count is a DiscreteMultiplicity, a branch exponent is a ReferenceConvention or Branch theorem depending on whether the branch is proved, and an observationally inverted prefactor is an EmpiricalInput on the named branch. The T1/T2/T3 column follows Convention P.14.1c. Determinant-transfer truncation is T1, branch and prefactor conventions are T2, and observational inversion is T3. The four-mode row for $A_{\mathrm{eff}}^{(4)}$ is forced by Theorem U.15l: the exponent $\kappa=142$ fixes $e^{-284}$ but does not determine the determinant, zero-mode quotient, negative-mode, ghost, measure, and finite-part prefactor. No row changes the numerical formulas; the table only fixes their dependency records. ∎

---

## U.13 Robustness and Predictions

### U.13.1 Scale Invariance Breaking

Suppose a branch initially has exactly four translational zero modes and one exact dilatation zero mode, and suppose a deformation preserves the base count and all four translations while lifting only the dilatation mode. Then the zero-mode count changes from $m=5$ to $m=4$, so the Appendix U counting convention changes
$$
\kappa:141.5\longmapsto142.
$$
If the prefactor is deliberately held constant, the vacuum weight changes by
$$
\frac{e^{-284}}{e^{-283}}=e^{-1},
$$
so it is smaller by a factor $e$. This is a conditional same-prefactor diagnostic. It does not apply to the current Definition U.4 branch, where Theorem U.8c already excludes the pure-coordinate dilatation tangent from the kernel, and a physical prediction requires recomputing the deformed Fredholm prefactor.

### U.13.2 Dimension Dependence

For general emergent dimension $D'$:

- Translational branch count: $m_{\mathrm{trans}} = D'$; for $D=4$ the corrected full discrete closure is Theorem U.13b under the explicit false-vacuum spectral hypotheses stated there, while other dimensions would require the corresponding discrete spectral proof
- A further dilatation mode would require an additional exact-scale-family hypothesis of the type isolated in Theorem U.9
- Deficit: $\delta = m/2$
- Requires the channel-complete Bures tangent-cell condition $M = K(D')$ (Definition Z.9a; Theorem Z.10) and existence of appropriate spherical design

For $D = 4$ (Theorem Z.11): the 24-cell realizes the optimal kissing configuration $K(4)=24$ and furnishes the spherical 5-design exactness used in Appendix U. This locks the channel-complete mode-channel correspondence at the level of cardinality, dimension, and quadrature input. Theorem U.8c shows that this design-exactness does not by itself create a fifth pure-coordinate dilatation zero mode in the current continuum action.

---

## U.14 Consistency Relations

### U.14.1 Golay-Steiner-Framework Identity

From Theorem U.6:

$$r - \lambda = d_0(M - a) = 176$$

Expanded:

$$253 - 77 = 8 \times (24 - 2)$$

This connects:
- Steiner parameters $(r, \lambda)$ from $S(5,8,24)$
- PU constants $(d_0, M, a)$

### U.14.2 Design Strength Matching

The Steiner design $S(5,8,24)$ has strength $t = 5$ (Theorem U.2).

The spherical 5-design (24-cell) integrates polynomials of degree $\leq 5$ exactly (Theorem U.7).

Appendix U uses a five-mode reference count $m_{\mathrm{ref}} = 5$ in Theorems U.15-U.16, but Corollary U.10 and Theorem U.8c make clear that this is not a theorem-level zero-mode count for the current Definition U.4 continuum action. By contrast, Theorem U.13b gives a corrected full-discrete four-mode closure under the explicit false-vacuum spectral hypotheses stated there.

Thus the repeated appearance of "5" has the following logical status:
- Combinatorial (Steiner $t$): exact theorem-level statement
- Geometric (spherical design degree): exact theorem-level statement
- Vacuum five-mode count: Appendix U reference convention only
- Vacuum four-mode count: full-discrete theorem under the explicit hypotheses of Theorem U.13b

### U.14.3 Saturation Ratio

On the Appendix U five-mode reference branch,
$$\frac{\kappa_{\mathrm{ref}}}{\kappa_{\max}} = \frac{141.5}{144} = 0.9826.$$

On the translational branch,
$$\frac{\kappa_{\mathrm{trans}}}{\kappa_{\max}} = \frac{142}{144} = 0.9861.$$

Near-saturation occurs in either branch because:
- The base cost saturates at $\kappa_0 = k^2$ (2-design isotropy)
- The zero-mode deficit remains small compared to $k^2 = 144$

---


## U.15 Introduction to the Primordial Sector

The preceding sections derived the Appendix U five-mode reference exponent $\kappa_{\Lambda,\mathrm{ref}} = 141.5$ from the Golay-Steiner counting convention, yielding the reference suppression $\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-283}$ (Corollary U.17). With the Appendix U working prefactor $A_{\text{eff}} = 0.923 \pm 0.011$ (Corollary U.15b), this gives the branch-dependent reference value

$$\Lambda L_P^2 = (2.88 \pm 0.03)\times 10^{-122}.$$

Theorem U.8c shows that the pure-coordinate dilatation mode used in that five-mode branch is obstructed in the current Definition U.4 continuum action, and Theorem U.13 shows under its sampled-sector exactness hypothesis that the sampled translation+dilatation restriction of the discrete Hessian has no fifth zero mode. Under the corrected Definition U.6 normalization and the explicit false-vacuum spectral hypotheses of Theorem U.13b, the corresponding four-mode branch instead gives
$$
\Lambda_4 L_P^2
=
8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284},
$$
whose numerical forward interval remains empty until the four-mode Fredholm gate is accepted. Reusing the five-mode working prefactor would give $(1.06\pm0.01)\times10^{-122}$ only as a same-prefactor diagnostic, while matching the observed $\Lambda L_P^2=(2.86599\pm0.04849)\times10^{-122}$ (Appendix V, Eq. (V.5)) would require the observational inversion $A_{\mathrm{eff}}^{(\mathrm{obs},4)}=2.49\pm0.04$; neither number is a four-mode Fredholm evaluation.

This section extends the analysis to the **primordial sector**, deriving inflationary observables from the same Golay-Steiner structure. The vacuum sector involves the full configuration space $\text{Gr}_\mathbb{C}(12,24)$ with a branch-dependent reference exponent, while the primordial sector involves the signal subspace $\mathcal{S} \cong \mathbb{C}^{12}$ with the smaller complexity parameter $\kappa_Q = 11$, yielding the primordial perturbation amplitude $Q \sim 10^{-5}$.

**Conventions.** Throughout this section:
- Natural units: $\hbar = c = k_B = 1$
- Planck length: $L_P^2 = G$ (in natural units)
- Reduced Planck mass: $\bar{M}_{Pl} = 1/\sqrt{8\pi G} = M_{Pl}/\sqrt{8\pi} = 2.435 \times 10^{18}$ GeV

---

## U.16 Primordial Configuration Space

### U.16.1 Signal Subspace Geometry

**Definition U.18 (Primordial Configuration Space on the Predictive-Recovery MacWilliams Golay Branch).** On the predictive-recovery MacWilliams Golay branch, let $\mathcal{S}\cong\mathbb{C}^{12}$ denote the 12-dimensional complex signal subspace (Definition Z.13b.0 and Theorem Z.13b.0a). The **primordial configuration space** is its projectivization:

$$\mathcal{C}_{\text{prim}} := \mathbb{P}(\mathcal{S}) \cong \mathbb{CP}^{11}$$

Off the predictive-recovery MacWilliams Golay branch, $\dim_\mathbb{C}(\mathcal{S}) = k$ would not equal 12, and $\mathcal{C}_{\text{prim}} \cong \mathbb{CP}^{k-1}$ would have a different complex dimension; the downstream value $\kappa_Q = 11$ in Identification U.20 inherits this branch.

*Remark.* The vacuum configuration space is $\text{Gr}_\mathbb{C}(12,24)$, the Grassmannian of all 12-dimensional subspaces of $\mathbb{C}^{24}$. The primordial configuration space $\mathbb{CP}^{11}$ is the space of rays within the fixed signal subspace $\mathcal{S}$, representing perturbations around the vacuum rather than deformations of it.

**Theorem U.19 (Primordial Space Dimensions).**

$$\dim_\mathbb{C}(\mathbb{CP}^{11}) = 11, \qquad \dim_\mathbb{R}(\mathbb{CP}^{11}) = 22$$

*Proof.* Write homogeneous coordinates on $\mathbb{CP}^n$ as $[z_0:\cdots:z_n]$. For each $j$, the set
$$
U_j:=\{[z_0:\cdots:z_n]:z_j\ne0\}
$$
has the coordinate map
$$
[z_0:\cdots:z_n]
\longmapsto
\left(\frac{z_0}{z_j},\ldots,\widehat{\frac{z_j}{z_j}},\ldots,\frac{z_n}{z_j}\right)
\in\mathbb C^n,
$$
where the hatted coordinate is omitted. The sets $U_j$ cover $\mathbb{CP}^n$, and their transition maps are holomorphic wherever defined. Hence $\mathbb{CP}^n$ is a complex manifold of complex dimension $n$. Each complex coordinate supplies two real coordinates, so its real dimension is $2n$. Taking $n=11$ gives complex dimension $11$ and real dimension $22$. ∎

**Remark U.19a: Dimension Comparison.** The vacuum Grassmannian has:

$$\dim_\mathbb{C}(\text{Gr}_\mathbb{C}(12,24)) = 12 \times (24-12) = 144$$

The ratio of configuration space dimensions is:

$$\frac{\dim_\mathbb{C}(\text{Gr}_\mathbb{C}(12,24))}{\dim_\mathbb{C}(\mathbb{CP}^{11})} = \frac{144}{11} \approx 13.1$$

### U.16.2 Complexity Exponent

**Identification U.20 (Primordial Complexity on the Predictive-Recovery MacWilliams Golay Branch).** Following Convention U.14a and the structural correspondence between configuration space dimension and instanton complexity, on the predictive-recovery MacWilliams Golay branch (Definition U.18) the primordial complexity parameter is identified with the complex dimension of the configuration space:

$$\boxed{\kappa_Q = \dim_\mathbb{C}(\mathbb{CP}^{11}) = 11 \quad \text{(on the predictive-recovery MacWilliams Golay branch)}}$$

A unit shift $k \to k - 1$ off the balanced branch would give $\kappa_Q = k - 1 \to k - 2$, rescaling $Q \sim e^{-\kappa_Q}$ by a factor of $e \approx 2.7$.

*Justification.* By Convention U.14a, the instanton complexity parameter counts the effective number of complex normal directions contributing to the exponential suppression. For the primordial sector on $\mathbb{CP}^{11}$, we identify $\kappa_Q$ with the complex dimension $11$. We assume no additional continuous zero modes beyond gauge redundancies; if collective modes analogous to translations or dilatations were present, they would reduce $\kappa_Q$ as in the five-mode vacuum reference sector ($\kappa_{\Lambda,\mathrm{ref}} = 144 - 2.5$). This identification is consistent with the framework but constitutes an assumption requiring future verification. It is not a consequence of the vacuum four-mode count and cannot be promoted by analogy with $\mathrm{Gr}_{\mathbb C}(12,24)$ without a separate primordial determinant and zero-mode certificate. $\square$

**Corollary U.20a (Complexity Ratio).**

$$\frac{\kappa_{\Lambda,\mathrm{ref}}}{\kappa_Q} = \frac{141.5}{11} \approx 12.86, \qquad \frac{\kappa_{\Lambda,\mathrm{trans}}}{\kappa_Q} = \frac{142}{11} \approx 12.91$$

Under the Appendix U reference-exponent conventions of Theorem U.16 and Identification U.20, the first ratio summarizes the five-mode reference hierarchy between the vacuum branch and primordial perturbations. The second ratio is the corresponding four-mode branch value under the corrected Definition U.6 normalization and the explicit false-vacuum spectral hypotheses of Theorem U.13b. Theorem U.8c excludes the pure-coordinate dilatation zero mode in the current continuum action, and Theorem U.13 shows under its sampled-sector exactness hypothesis that the sampled translation+dilatation restriction of the discrete Hessian has no fifth zero mode.

### U.16.3 Bundle Structure

**Proposition U.21 (Hopf Fibration).** The primordial configuration space $\mathbb{CP}^{11}$ admits the Hopf fibration
$$
S^1\hookrightarrow S^{23}\xrightarrow{\pi}\mathbb{CP}^{11},
$$
where $S^{23}\subset\mathbb C^{12}$ is the unit sphere and $\pi(z)=[z]$. With the curvature-$4$ normalization, the Fubini–Study metric $g_{FS}$ is the quotient metric induced from the round metric by the Riemannian submersion $\pi$.

*Proof.* The circle acts on $S^{23}$ by
$$
e^{i\theta}\cdot z=e^{i\theta}z.
$$
If $e^{i\theta}z=z$ for a unit vector $z$, then some coordinate of $z$ is nonzero and therefore $e^{i\theta}=1$; the action is free. Two unit vectors determine the same complex line exactly when they differ by a unit complex scalar, so the orbit space is
$$
S^{23}/S^1\cong\mathbb{CP}^{11},
$$
and $\pi$ is the quotient map. The vertical tangent at $z$ is $\operatorname{span}_{\mathbb R}\{iz\}$. Let
$$
\mathcal H_z:=\{v\in T_zS^{23}:\langle v,iz\rangle_{\mathbb R}=0\}
$$
be its round-metric orthogonal complement. The differential $d\pi_z$ has kernel $\operatorname{span}_{\mathbb R}\{iz\}$ and restricts to an isomorphism from $\mathcal H_z$ onto $T_{[z]}\mathbb{CP}^{11}$.

Define the quotient metric by
$$
g_{FS}(d\pi_zv,d\pi_zw)
:=\langle v,w\rangle_{S^{23}},
\qquad v,w\in\mathcal H_z.
$$
The $S^1$ action is isometric, so this definition is independent of the unit representative $z$. By construction $d\pi_z$ is an isometry on horizontal tangent spaces, which is exactly the Riemannian-submersion property. This quotient normalization is the Fubini–Study metric of holomorphic sectional curvature $4$. ∎

---

## U.17 Primordial Perturbation Amplitude

### U.17.1 Semiclassical Suppression

**Corollary U.22 (Exponential Suppression).** By Proposition U.14 (complexity-action correspondence) with $S_{\text{inst}} = 2\kappa$:

$$Q^2 \propto e^{-2\kappa_Q} = e^{-22}$$

*Derivation.* The instanton action for primordial fluctuations is $S_{\text{inst}} = 2\kappa_Q = 22$ (Proposition U.14). The semiclassical probability amplitude scales as $e^{-S_{\text{inst}}/2}$, giving $Q \propto e^{-\kappa_Q}$. $\square$

### U.17.2 Reality Projection

**Lemma U.23 (Complex Gaussian Real-Part Variance).** Let $Z=X+iY$ be a circularly symmetric complex Gaussian variable, meaning that $(X,Y)$ is jointly real Gaussian and $e^{i\phi}Z$ has the same law as $Z$ for every $\phi\in\mathbb R$. If $\mathbb E[|Z|^2]=\sigma^2$, then:

$$\operatorname{Var}(X)=\operatorname{Var}(Y)=\frac{\sigma^2}{2}$$

*Proof.* Rotation invariance gives $\mathbb E[Z]=e^{i\phi}\mathbb E[Z]$ for every $\phi$, hence $\mathbb E[X]=\mathbb E[Y]=0$. The covariance matrix $C$ of $(X,Y)$ satisfies
$$
C=R_\phi C R_\phi^T
$$
for every planar rotation $R_\phi$. Taking $\phi=\pi/2$ shows that the diagonal entries of $C$ are equal and its off-diagonal entries vanish. Thus
$$
\operatorname{Var}(X)=\operatorname{Var}(Y),
\qquad
\operatorname{Cov}(X,Y)=0.
$$
Because $(X,Y)$ is jointly Gaussian, zero covariance implies independence. Finally,
$$
\sigma^2
=\mathbb E[|Z|^2]
=\mathbb E[X^2+Y^2]
=\operatorname{Var}(X)+\operatorname{Var}(Y)
=2\operatorname{Var}(X),
$$
so $\operatorname{Var}(X)=\operatorname{Var}(Y)=\sigma^2/2$. ∎

**Corollary U.24 (Primordial amplitude on the real-part projection branch).** Assume that the retained primordial fluctuation is a zero-mean circular complex Gaussian $Z=X+iY$ normalized by
$$
\mathbb E|Z|^2=A_Qe^{-2\kappa_Q},
$$
and that the physical curvature perturbation is identified with $\mathcal R=X=\operatorname{Re}Z$ with no additional field rescaling. Then
$$
Q^2:=\operatorname{Var}(\mathcal R)
=\frac12A_Qe^{-2\kappa_Q}.
$$

*Proof.* Lemma U.23 gives $\operatorname{Var}(X)=\frac12\mathbb E|Z|^2$ for the stated circular Gaussian. Substituting the specified precursor variance proves the formula. The real-part map and its normalization are branch hypotheses; real-valuedness alone does not impose the factor $1/2$. ∎

**Curvature-transfer limit for the $D_4$ branch.** On a covered refinement sequence the $D_4$ witness supplies a defect function $\epsilon_{D_4}(r)$ such that every curvature or Bochner identity imported into the continuum proof is used only modulo that defect:
$$
\|\mathcal B_{D_4,r}f-\mathcal B_{\mathrm{cont}}f\|_{L^2(U)}\le \epsilon_{D_4}(r)\|f\|_{H^2(U)},
\qquad
\epsilon_{D_4}(r)\to0.
$$
If the limit or noncollapse condition is not part of the finite record, the $D_4$ construction remains a candidate discretization rather than a discharged continuum witness.

### U.17.3 One-Loop Prefactor

**Definition U.25 (Spectral Zeta Function).** For a positive elliptic operator $\Delta$ on a compact Riemannian manifold, the spectral zeta function is:

$$\zeta_\Delta(s) = \sum_{\lambda_j > 0} \lambda_j^{-s}, \qquad \operatorname{Re}(s) > \dim(M)/2$$

The zeta-regularized determinant is $\det'(\Delta) := e^{-\zeta'_\Delta(0)}$.

**Theorem U.25a (Laplacian Spectrum on $\mathbb{CP}^n$).** Let $\mathbb{CP}^n$ carry the Fubini–Study metric for which the Hopf map from the unit sphere $S^{2n+1}\subset\mathbb C^{n+1}$ is a Riemannian submersion and the holomorphic sectional curvature is $4$. The nonnegative scalar Laplacian has eigenvalues
$$
\lambda_\ell=4\ell(\ell+n),
\qquad
\ell=0,1,2,\ldots,
$$
with multiplicities
$$
m_\ell
=\binom{n+\ell}{n}^2-
\binom{n+\ell-1}{n}^2,
$$
where $\binom{n-1}{n}=0$ for $\ell=0$.

*Proof.* The scalar-spectrum theorem for compact rank-one symmetric spaces in Ikeda and Taniguchi (1978) applies because $\mathbb{CP}^n$ with this metric is compact and the operator is the scalar Laplace–Beltrami operator. Its normalization can also be checked directly through the Hopf quotient. Pullback identifies functions on $\mathbb{CP}^n$ with $S^1$-invariant functions on $S^{2n+1}$. Because Hopf fibers are totally geodesic and an invariant function has zero vertical derivative, its spherical Laplacian equals the pullback of the base Laplacian.

Spherical harmonics obtained from homogeneous polynomials of total degree $q$ on $\mathbb R^{2n+2}$ have eigenvalue
$$
q(q+2n)
$$
on the unit sphere. Under the phase action $z\mapsto e^{i\theta}z$, a polynomial of bidegree $(r,s)$ acquires phase $e^{i(r-s)\theta}$, so invariance requires $r=s=\ell$ and $q=2\ell$. The descended eigenvalue is therefore
$$
(2\ell)(2\ell+2n)=4\ell(\ell+n).
$$

Let $\mathcal P_{\ell,\ell}$ be the bihomogeneous polynomials of bidegree $(\ell,\ell)$. Its dimension is
$$
\dim_{\mathbb C}\mathcal P_{\ell,\ell}
=\binom{n+\ell}{n}^2.
$$
The Fischer decomposition gives
$$
\mathcal P_{\ell,\ell}
=\mathcal H_{\ell,\ell}
\oplus |z|^2\mathcal P_{\ell-1,\ell-1},
$$
where $\mathcal H_{\ell,\ell}$ is the harmonic subspace. Consequently,
$$
\dim\mathcal H_{\ell,\ell}
=\binom{n+\ell}{n}^2-
\binom{n+\ell-1}{n}^2,
$$
which is the multiplicity of the descended eigenspace. The harmonic decomposition is exhaustive on the sphere, so these are all scalar eigenvalues and multiplicities. ∎

*Remark: Normalization Convention.* The eigenvalue factor $4$ corresponds to the Fubini-Study metric with holomorphic sectional curvature $4$ and diameter $\pi/2$. Alternative normalizations (e.g., holomorphic sectional curvature $1$) yield eigenvalues $\lambda_\ell = \ell(\ell + n)$.

**Assumption U.26 (One-Loop Prefactor Scaling).** Choose a specified family of normalized compact Kähler symmetric spaces and positive fluctuation operators indexed by $\kappa\to\infty$, together with one zeta finite-part convention. Assume that there are branch constants $C>0$ and $\kappa_*>0$ such that for every $\kappa\ge\kappa_*$,
$$
|A_Q(\kappa)-1|\le\frac{C}{\kappa},
\qquad
|\log A_Q(\kappa)|\le\frac{C}{\kappa}.
$$
This is an independent prefactor hypothesis, not a consequence of compactness or Kähler symmetry alone. At $\kappa_Q=11$ it gives the bound $C/11$; the numerical statements “9% for $A_Q$” and “4.5% for $Q$” additionally require $C\le1$ and the declared square-root propagation from $A_Q$ to $Q$. The primordial determinant certificate of Definition U.26b is required to replace these assumed bounds by a computed interval.

**Definition U.26b (Primordial $\mathbb{CP}^{11}$ determinant certificate).** A primordial determinant certificate is a finite record
$$
\mathfrak D_Q
=
\left(
\mathcal O_Q,
m_Q^2,
P_Q,
\zeta_Q,
\mathcal J_Q,
\mu_Q
\right),
\tag{U.26b.1}
$$
where:

1. the retained one-loop fluctuation operator is
$$
\mathcal O_Q=-\Delta_{FS}+m_Q^2
\tag{U.26b.2}
$$
on $\mathbb{CP}^{11}$ with the Fubini-Study normalization of Theorem U.25a, and $m_Q^2$ is its branch-specified second-variation mass;

2. $P_Q$ is a branch-specified finite-rank orthogonal projection, commuting with $\mathcal O_Q$, onto precisely the gauge, collective-coordinate, or zero-mode directions removed from the Gaussian determinant. If no direction is removed, $P_Q=0$. Write $q_\ell=\operatorname{rank}(P_Q|_{E_\ell})$, where $E_\ell$ is the Laplacian eigenspace of multiplicity $m_\ell$;

3. the projected spectral zeta function is
$$
\zeta_Q(s)
=
\sum_{\ell=0}^{\infty}
(m_\ell-q_\ell)
\left(4\ell(\ell+11)+m_Q^2\right)^{-s},
\tag{U.26b.3}
$$
with
$$
m_\ell=
\binom{11+\ell}{11}^2
-
\binom{10+\ell}{11}^2.
\tag{U.26b.4}
$$
The constant mode has $m_0=1$ and eigenvalue $m_Q^2$: it is included when $m_Q^2>0$ unless $q_0=1$, and when $m_Q^2=0$ the certificate must set $q_0=1$ and record its treatment in $\mathcal J_Q$;

4. $\mathcal J_Q$ is the finite product of the branch-specified collective-coordinate, gauge-volume, measure, and quotient Jacobians associated with $P_Q$;

5. the real-part projection factor of Corollary U.24 remains explicit and is not absorbed into $A_Q$;

6. the finite-part convention $\mu_Q$ is registered before comparison with $A_s$, $r$, or $A_s r$.

The determinant prefactor associated with the certificate is
$$
A_Q^{\mathrm{det}}
=
\mathcal J_Q\,
\left(\det_{\zeta}\mathcal O_Q|_{(I-P_Q)\mathcal H}\right)^{-1/2}
=
\mathcal J_Q\,
\exp\!\left[\frac12\zeta_Q'(0)\right].
\tag{U.26b.5}
$$

**Theorem U.26c (Determinant Closure of the Primordial Prefactor).** If a branch carries an accepted primordial determinant certificate $\mathfrak D_Q$, then
$$
A_Q=A_Q^{\mathrm{det}}
\tag{U.26c.1}
$$
and the primordial amplitude formula becomes
$$
Q^2
=
\frac12 A_Q^{\mathrm{det}}e^{-2\kappa_Q}.
\tag{U.26c.2}
$$
The leading branch $A_Q=1$ is theorem-level only if the certified determinant satisfies $A_Q^{\mathrm{det}}=1$ within the stated branch tolerance.

*Proof.* By Definition U.25, the zeta-regularized determinant of the positive nonconstant fluctuation operator is
$$
\det{}'_\zeta(\mathcal O_Q)=e^{-\zeta_Q'(0)}.
$$
A Gaussian one-loop integration over real retained fluctuations contributes the inverse square-root determinant factor
$$
\left(\det{}'_\zeta(\mathcal O_Q)\right)^{-1/2}
=
\exp\!\left[\frac12\zeta_Q'(0)\right],
$$
while the finite quotient, gauge-zero-mode, and measure factors contribute $\mathcal J_Q$. This gives (U.26b.5). Corollary U.24 already isolates the real-projection factor as the explicit $1/2$ multiplying $A_Qe^{-2\kappa_Q}$, so no additional real-projection factor is included in $A_Q^{\mathrm{det}}$. Substitution gives (U.26c.2). ∎

**Remark U.26a (Error Propagation).** On the leading branch, the uncertainty $\delta A_Q / A_Q \sim 9\%$ propagates to $Q$ as $\delta Q / Q \sim 4.5\%$. For inflationary observables, this induces $\delta A_s / A_s \sim 9\%$, which is comparable to or exceeds current Planck precision on $\ln(10^{10}A_s)$. On a determinant-certified branch, this uncertainty is replaced by the uncertainty of $\mathfrak D_Q$ and the finite-part convention $\mu_Q$.

### U.17.4 Primordial Scale Parameter

**Theorem U.27 (Primordial Perturbation Amplitude).** With $\kappa_Q = 11$ (Identification U.20), the primordial perturbation amplitude is
$$
Q
=
\sqrt{\frac{A_Q}{2}}\,e^{-11}.
\tag{U.27.1}
$$
On the leading branch $A_Q=1$ (Assumption U.26),
$$
\boxed{Q = \frac{e^{-\kappa_Q}}{\sqrt{2}} = \frac{e^{-11}}{\sqrt{2}} = 1.181 \times 10^{-5}}.
$$
On a determinant-certified branch, replace $A_Q$ by $A_Q^{\mathrm{det}}$ from Theorem U.26c.

*Verification.* 
- $e^{-11} = 1.6702 \times 10^{-5}$
- $e^{-11}/\sqrt{2} = 1.6702 \times 10^{-5} / 1.4142 = 1.181 \times 10^{-5}$ $\checkmark$

**Definition U.27a (Thermal-Handoff Certificate).** A forward-locked record fixes intervals for $c_m>0$, $N_{\mathrm{dec}}>0$, $g_*>0$, branching fractions, efficiencies, and residuals, together with the maps
$$
m_\varphi=c_m\bar M_{\mathrm{Pl}}e^{-\kappa_Q},
\qquad
\Gamma_\varphi=
\frac{N_{\mathrm{dec}}}{48\pi}
\frac{m_\varphi^3}{\bar M_{\mathrm{Pl}}^2},
\tag{U.27a.1}
$$
$$
T_{\mathrm{reh}}=
\left(\frac{90}{\pi^2g_*}\right)^{1/4}
\sqrt{\Gamma_\varphi\bar M_{\mathrm{Pl}}}.
\tag{U.27a.2}
$$
The output intervals for $m_\varphi$, $\Gamma_\varphi$, $T_{\mathrm{reh}}$, and $T_{\max}$ are interval images of the inputs; they are not independent inputs. Separate entries bound direct, preheating, nonthermal, and off-shell production.

**Proposition U.27b (Residual-Aware Reheating Output).** On the zero-residual representative,
$$
T_{\mathrm{reh}}
=c_R\bar M_{\mathrm{Pl}}e^{-3\kappa_Q/2},
\quad
c_R=c_m^{3/2}
\sqrt{\frac{N_{\mathrm{dec}}}{48\pi}}
\left(\frac{90}{\pi^2g_*}\right)^{1/4}.
\tag{U.27b.1}
$$
For interval inputs, use the full interval image of (U.27a.1)--(U.27a.2).

**Corollary U.27c (Heavy-Sector Handoff Gate).** Thermal exclusion of a mass $M_R$ requires $T_{\mathrm{reh}}\le T_{\max}<M_R$ and certified absence of all recorded nonthermal routes. A no-double-counting conclusion additionally needs the Appendix Y source-exhaustion audit.

---

## U.18 The 24-Cell Spherical Design

### U.18.1 24-Cell Geometry

For the explicit design computation we use the same standard 24-point configuration on $S^3 \subset \mathbb{R}^4$. Its vertex set is:

**Definition U.28 (24-Cell Vertices).**

$$V_{24} = \{\pm e_i : i = 1,2,3,4\} \cup \left\{\frac{1}{2}(\pm 1, \pm 1, \pm 1, \pm 1)\right\}$$

where $e_i$ are the standard basis vectors. Thus $|V_{24}| = 8 + 16 = 24$.

**Lemma U.29 (Inner Product Distribution).** For ordered pairs $(v,w) \in V_{24}^2$, the inner products $\langle v, w \rangle$ take values in $\{-1, -\frac{1}{2}, 0, \frac{1}{2}, 1\}$ with ordered-pair multiplicities:

| $\langle v, w \rangle$ | Multiplicity $N(x)$ |
|:----------------------:|:-------------------:|
| $1$ | $24$ |
| $\frac{1}{2}$ | $192$ |
| $0$ | $144$ |
| $-\frac{1}{2}$ | $192$ |
| $-1$ | $24$ |

*Verification.* Total: $24 + 192 + 144 + 192 + 24 = 576 = 24^2$. $\checkmark$

*Proof.* Direct enumeration by vertex type. Let $C = \{\pm e_i\}$ denote the 8 coordinate vertices and $H = \{\frac{1}{2}(\pm 1, \pm 1, \pm 1, \pm 1)\}$ the 16 half-vertices.

**Self-pairs** ($\langle v, v \rangle = 1$): 24 pairs (diagonal).

**Antipodal pairs** ($\langle v, -v \rangle = -1$): 24 pairs.

**$C$-$C$ pairs** (distinct, non-antipodal): For $e_i \neq \pm e_j$, $\langle e_i, e_j \rangle = 0$. Count: $8 \times 6 = 48$ ordered pairs at inner product $0$.

**$C$-$H$ pairs**: $\langle e_i, \frac{1}{2}(s_1, s_2, s_3, s_4) \rangle = s_i/2 = \pm 1/2$. Each of 8 coordinate vertices pairs with all 16 half-vertices: $8 \times 16 = 128$ pairs. By symmetry, 64 have $+1/2$ and 64 have $-1/2$. Including $H$-$C$ pairs: $2 \times 128 = 256$ total, split as 128 at $+1/2$ and 128 at $-1/2$.

**$H$-$H$ pairs** (distinct, $h \neq h'$): $\langle h, h' \rangle = \frac{1}{4}\sum_{i=1}^4 s_i s'_i$. The sum $\sum s_i s'_i$ equals (agreements) $-$ (disagreements). Per half-vertex $h$, excluding self and antipode:
- 4 vertices at $+1/2$ (3 sign agreements): $\binom{4}{1} = 4$
- 6 vertices at $0$ (2 sign agreements): $\binom{4}{2} = 6$  
- 4 vertices at $-1/2$ (1 sign agreement): $\binom{4}{1} = 4$

Total $H$-$H$ (distinct, non-antipodal): $16 \times 4 = 64$ at $+1/2$; $16 \times 6 = 96$ at $0$; $16 \times 4 = 64$ at $-1/2$.

**Combined totals**: 
- $+1$: $24$; $-1$: $24$
- $+1/2$: $128 + 64 = 192$; $-1/2$: $128 + 64 = 192$  
- $0$: $48 + 96 = 144$

Verification: $24 + 192 + 144 + 192 + 24 = 576 = 24^2$. $\square$

### U.18.2 Spherical Design Property

**Theorem U.30 (24-Cell as Spherical 5-Design).** The 24-cell vertices form a spherical 5-design on $S^3$: for any polynomial $p : \mathbb{R}^4 \to \mathbb{R}$ of degree at most $5$,
$$
\frac{1}{24} \sum_{v \in V_{24}} p(v) = \frac{1}{\operatorname{Vol}(S^3)} \int_{S^3} p(x) \, d\sigma(x)
$$
The 24-cell is not a 6-design.

*Proof.* Define the Gegenbauer moments
$$
S_\ell := \sum_{v,w \in V_{24}} C_\ell^{(\alpha)}(\langle v, w \rangle),
\qquad
\alpha = (D-2)/2 = 1
$$
for $D=4$. By the Delsarte–Goethals–Seidel criterion [Delsarte, Goethals & Seidel 1977], the configuration is a spherical $t$-design iff $S_\ell=0$ for $\ell=1,\dots,t$.

Lemma U.29 gives the inner-product multiplicities
$$
N(1)=24,
\quad
N(1/2)=192,
\quad
N(0)=144,
\quad
N(-1/2)=192,
\quad
N(-1)=24.
$$
Therefore
$$
S_\ell
=
24\,C_\ell^{(1)}(1)
+
192\,C_\ell^{(1)}(1/2)
+
144\,C_\ell^{(1)}(0)
+
192\,C_\ell^{(1)}(-1/2)
+
24\,C_\ell^{(1)}(-1).
$$

Using the explicit Gegenbauer polynomials:
- $C_1^{(1)}(x)=2x$, so
  $$
  S_1
  =
  24(2)+192(1)+144(0)+192(-1)+24(-2)
  =
  48+192-192-48
  =
  0.
  $$
- $C_2^{(1)}(x)=4x^2-1$, so
  $$
  S_2
  =
  24(3)+192(0)+144(-1)+192(0)+24(3)
  =
  72-144+72
  =
  0.
  $$
- $C_3^{(1)}(x)=8x^3-4x$, so
  $$
  S_3
  =
  24(4)+192(-1)+144(0)+192(1)+24(-4)
  =
  96-192+192-96
  =
  0.
  $$
- $C_4^{(1)}(x)=16x^4-12x^2+1$, so
  $$
  S_4
  =
  24(5)+192(-1)+144(1)+192(-1)+24(5)
  =
  120-192+144-192+120
  =
  0.
  $$
- $C_5^{(1)}(x)=32x^5-32x^3+6x$, so
  $$
  S_5
  =
  24(6)+192(0)+144(0)+192(0)+24(-6)
  =
  144-144
  =
  0.
  $$
- $C_6^{(1)}(x)=64x^6-80x^4+24x^2-1$, so
  $$
  S_6
  =
  24(7)+192(1)+144(-1)+192(1)+24(7)
  =
  168+192-144+192+168
  =
  576 \neq 0.
  $$

Thus $S_\ell=0$ for $\ell=1,\dots,5$, while $S_6\neq 0$. Hence the 24-cell is a spherical 5-design but not a 6-design. $\square$

**Corollary U.31 (Design Strength and Dimension).** The design strength $t = 5$ satisfies:

$$t = D + 1$$

where $D = 4$ is the emergent spacetime dimension (Theorem Z.11).

*Remark.* The identity $t=D+1=5$ records the arithmetic relation between the explicit design strength of Theorem U.30 and the dimensional value $D=4$ from Theorem Z.11. No stronger rigidity statement about 24-point spherical 5-designs is used in Appendix U.

---

## U.19 Twelve-Line Adjacency Structure

### U.19.1 Antipodal Lines

**Definition U.32 (Twelve Antipodal Lines).** Each vertex $v \in V_{24}$ pairs with its antipode $-v$ to form an **antipodal line** $\ell_v = \{v, -v\}$. The 24 vertices yield $k = 12$ distinct lines:

$$\mathcal{L}_{12} = \{V_{24}\}/\{\pm 1\}$$

**Definition U.33 (Line Adjacency).** Two lines $\ell_v, \ell_w \in \mathcal{L}_{12}$ are **adjacent** if $|\langle v, w \rangle| = \frac{1}{2}$:

$$\ell_v \sim \ell_w \iff |\langle v, w \rangle| = \frac{1}{2}$$

**Lemma U.34 (Adjacency Matrix Spectrum).** The line adjacency graph has:
- **Degree**: Each line is adjacent to exactly 8 other lines
- **Adjacency spectrum**: $\text{Spec}(A) = \{8^{(1)}, (-4)^{(2)}, 0^{(9)}\}$

*Proof.*

**Degree calculation:** From Lemma U.29, each vertex has inner product $+1/2$ with $192/24 = 8$ vertices and inner product $-1/2$ with $192/24 = 8$ vertices, hence $16$ vertices total with $|\langle v,w\rangle| = 1/2$. These form $8$ antipodal pairs, so each line is adjacent to $8$ lines.

**Strongly regular graph parameters:** Direct enumeration of common neighbors gives: any two adjacent lines have $\lambda = 4$ common neighbors, and any two non-adjacent lines have $\mu = 8$ common neighbors. The line graph is therefore strongly regular with parameters $(v, k, \lambda, \mu) = (12, 8, 4, 8)$.

**Strongly regular identity:** A strongly regular graph satisfies the matrix identity
$$A^2 = kI + \lambda A + \mu(J - I - A) = 8I + 4A + 8(J - I - A) = 8J - 4A,$$
where $J$ is the all-ones matrix.

**Eigenvalue determination:** On the all-ones vector $\mathbf{1}$, $A\mathbf{1} = 8\mathbf{1}$ (the regular degree), so $8$ is an eigenvalue with multiplicity $\geq 1$. On the orthogonal complement $\mathbf{1}^\perp$, $J = 0$, so the strongly regular identity reduces to $A^2 = -4A$, giving eigenvalues in $\{0, -4\}$ on $\mathbf{1}^\perp$. Let $m_8$, $m_{-4}$, $m_0$ denote the multiplicities of $8$, $-4$, $0$. Then $m_8 = 1$ (the all-ones eigenvalue is non-degenerate for a connected regular graph; or by direct verification of the trace identities).

**Trace constraints:** $\operatorname{tr}(A) = 0$ (no self-loops) gives $8 \cdot 1 + (-4) m_{-4} + 0 \cdot m_0 = 0$, so $m_{-4} = 2$. Then $m_0 = 12 - 1 - 2 = 9$. Verification: $\operatorname{tr}(A^2) = 8^2 + 2(-4)^2 + 9(0)^2 = 64 + 32 = 96 = \sum_i d_i = 12 \cdot 8$. ✓

The characteristic polynomial is therefore $\det(A - \lambda I) = (\lambda - 8)(\lambda + 4)^2 \lambda^9$. $\square$

**Proposition U.34a (Complete Tripartite Identification).** The twelve-line graph of Definitions U.32–U.33 is $K_{4,4,4}$. Its three parts are the four coordinate-axis lines, the four half-vector lines of even sign parity, and the four half-vector lines of odd sign parity.

*Proof.* Distinct coordinate axes have inner product $0$. Every coordinate line has absolute inner product $1/2$ with every half-vector line. Two half-vector sign patterns have absolute inner product $1/2$ exactly when their Hamming distance is odd, equivalently when their sign parities differ. Thus adjacency occurs exactly between distinct four-vertex parts. ∎

**Theorem U.34b (Ihara Zeta and Ramanujan Certificate for the Twelve-Line Graph).** For a connected $d$-regular graph with $n$ vertices, $m$ edges, and adjacency matrix $A$, the Bass identity [Bass 1992] is
$$
\zeta_X(u)^{-1}
=(1-u^2)^{m-n}
\det\left(I-uA+(d-1)u^2I\right).
$$
For $K_{4,4,4}$,
$$
\zeta_{G_{12}}(u)^{-1}
=(1-u^2)^{36}
\times(1-8u+7u^2)
\times(1+4u+7u^2)^2
\times(1+7u^2)^9.
$$
Since every nontrivial adjacency eigenvalue satisfies
$$
|\lambda|\le4<2\sqrt7,
$$
the fixed graph is Ramanujan and its nontrivial zeta poles have modulus $7^{-1/2}$.

*Proof.* Insert $n=12$, $m=48$, $d=8$, and $\operatorname{Spec}(A)=\{8,(-4)^{(2)},0^{(9)}\}$ into the Bass identity. For $1-\lambda u+7u^2$, $\lambda^2<28$ makes the two roots conjugate with product $1/7$. ∎

**Theorem U.34c (24-Cell Skeleton and Antipodal Cover).** Let $X_{24}$ be the graph on the $24$ vertices $V_{24}$ with $v\sim w$ iff $\langle v,w\rangle=1/2$. Then $X_{24}$ is $8$-regular, has $96$ edges and $96$ triangles, and
$$
\operatorname{Spec}(X_{24})
=
\{8,4^{(4)},0^{(9)},(-2)^{(8)},(-4)^{(2)}\}.
$$
Consequently,
$$
\begin{aligned}
\zeta_{X_{24}}(u)^{-1}
={}&(1-u^2)^{72}(1-8u+7u^2)(1-4u+7u^2)^4\\
&\times(1+7u^2)^9(1+2u+7u^2)^8(1+4u+7u^2)^2.
\end{aligned}
$$
The graph is Ramanujan. The antipodal involution $v\mapsto-v$ makes $X_{24}$ a double cover of $G_{12}$; the even sector has spectrum $\{8,0^{(9)},(-4)^{(2)}\}$ and the odd sector has spectrum $\{4^{(4)},(-2)^{(8)}\}$. Hence
$$
\zeta_{X_{24}}(u)=\zeta_{G_{12}}(u)L_\chi(u),
$$
with
$$
L_\chi(u)^{-1}
=(1-u^2)^{36}(1-4u+7u^2)^4(1+2u+7u^2)^8.
$$

*Proof.* Split $V_{24}$ into the eight coordinate vertices and sixteen half vectors. The half-vector block is the four-cube $Q_4$; the coordinate-to-half-vector block couples the constant and singleton Walsh characters. The resulting invariant blocks have eigenvalues $\{8,-4\}$, four copies of $\{4,-2\}$, three additional zeros, and the uncoupled $Q_4$ character eigenvalues $0^{(6)},(-2)^{(4)},-4$. This gives the displayed spectrum. Then
$$
|E|=\frac{24\cdot8}{2}=96,
\qquad
\#\triangle=\frac{\operatorname{tr}(A^3)}6=96.
$$
The zeta and Ramanujan statements follow as in Theorem U.34b. Antipodal parity gives the two spectral sectors and the factorization. ∎

**Remark U.34d (Certificate Status and Firewall).** For the lazy walk $P=(I+A/8)/2$ on $G_{12}$, let $\pi$ be the uniform distribution and define the worst-case total-variation distance
$$
d_{\mathrm{TV}}(t)
:=
\max_{x\in V(G_{12})}
\left\|P^t(x,\cdot)-\pi\right\|_{\mathrm{TV}}.
$$
Then
$$
d_{\mathrm{TV}}(t)
\le
\frac12\sqrt{11}\,2^{-t}.
$$
The Ramanujan inequalities are exact certificates for two fixed finite graphs, not asymptotic optimality theorems. The Ihara parameter $d-1=7$ is graph-walk bookkeeping, and the primitive cycles called graph primes are not rational primes. No transfer to arithmetic zeta functions, random-matrix spacing laws, or the Appendix Z value of $\alpha$ is licensed.

**Theorem U.34e (Expansion–Graph-Metric Locality Separation).** Let $\{X_i\}$ be connected unweighted $d$-regular graphs with $|V_i|\to\infty$ and uniform gap
$$
d-\lambda_2(X_i)\ge\gamma>0.
$$
Then
$$
h(X_i)\ge\frac\gamma2,
$$
and, while $|B_{d_X}(x,r)|\le|V_i|/2$,
$$
|B_{d_X}(x,r+1)|
\ge
\left(1+\frac{\gamma}{2d}\right)|B_{d_X}(x,r)|.
$$
Therefore no such family has a uniform polynomial upper bound
$$
|B_{d_X}(x,r)|\le Cr^D
$$
for fixed $C,D$. Conversely, a bounded-degree family with such a graph-metric bound cannot have a gap bounded uniformly away from zero.

*Proof.* The Rayleigh quotient of $\mathbf1_S-(|S|/|V|)\mathbf1$ gives $|\partial S|\ge\gamma|S|/2$ for $|S|\le|V|/2$. Each new vertex absorbs at most $d$ boundary edges, giving the ball-growth inequality. Iteration reaches order $|V|$ within $O(\log|V|)$ graph-distance steps, contradicting a fixed polynomial upper bound. ∎

**Remark U.34f (Weighted-Metric Comparability Gate).** Theorem U.34e uses the unweighted shortest-path metric $d_X$. Definition 36 uses the metric $d_N$ together with its effective length scale $\delta_{\mathrm{eff}}$. For each member of a family, define the dimensionless normalized metric
$$
\widehat d_N(x,y)
:=
\frac{d_N(x,y)}{\delta_{\mathrm{eff}}}.
$$
The polynomial-growth condition of Definition 36 is comparable to Theorem U.34e only when there are uniform constants $0<c\le C<\infty$ such that
$$
c\,d_X(x,y)
\le
\widehat d_N(x,y)
\le
C\,d_X(x,y)
$$
for all vertices, together with a uniform degree bound. Under this gate, polynomial growth transfers between the two dimensionless metrics after rescaling radii. Without it, the fixed finite Ramanujan certificates imply no expansion obstruction for the emergent-space metric of Definition 36.

### U.19.2 Weyl Group Action

**Theorem U.35 (Weyl Group Symmetry).** For the Euclidean vertex set $V_{24}$ of Definition U.28,
$$
\operatorname{Aut}(V_{24})=W(F_4),
\qquad
|W(F_4)|=1152=2^7\cdot3^2,
$$
where $\operatorname{Aut}(V_{24})$ denotes the orthogonal transformations preserving the vertex set.

*Proof.* In an orthonormal basis of $\mathbb R^4$, the $F_4$ root system is
$$
\Phi(F_4)
=\{\pm e_i\}
\cup\{\pm e_i\pm e_j:i<j\}
\cup\left\{\frac12(\pm e_1\pm e_2\pm e_3\pm e_4)\right\}.
$$
Its $24$ short roots are
$$
\Phi_{\mathrm{short}}
=\{\pm e_i\}
\cup\left\{\frac12(\pm e_1\pm e_2\pm e_3\pm e_4)\right\},
$$
which is exactly $V_{24}$. Reflections in $F_4$ roots preserve root length, so $W(F_4)$ preserves $V_{24}$ and acts faithfully on it. The root-polytope symmetry theorem of Coxeter (1973), applied to the irreducible $F_4$ short-root polytope, states that its full orthogonal symmetry group is the Weyl group because the $F_4$ Dynkin diagram has no nontrivial diagram automorphism. Thus $\operatorname{Aut}(V_{24})=W(F_4)$.

The exponents of $F_4$ are $1,5,7,11$. The Weyl-group order formula of Coxeter (1973) gives
$$
|W(F_4)|
=\prod_{m\in\{1,5,7,11\}}(m+1)
=2\cdot6\cdot8\cdot12
=1152
=2^7\cdot3^2.
$$
∎

**Theorem U.36 (Invariant Eigenspace Decomposition).** The signal subspace decomposes into the adjacency eigenspaces
$$\mathcal{S} = \mathcal{S}_{8} \oplus \mathcal{S}_{-4} \oplus \mathcal{S}_{0}$$
where:
- $\mathcal{S}_{8}$ is the 1-dimensional eigenspace with eigenvalue $8$ (spanned by the all-ones vector)
- $\mathcal{S}_{-4}$ is the 2-dimensional eigenspace with eigenvalue $-4$
- $\mathcal{S}_{0}$ is the 9-dimensional eigenspace with eigenvalue $0$

Each eigenspace is $W(F_4)$-invariant.

*Proof.* The adjacency matrix $A$ commutes with the $W(F_4)$ action. Therefore each spectral projector of $A$ commutes with the group action, and its image is a $W(F_4)$-invariant subspace. Lemma U.34 gives the multiplicities of the eigenvalues $8$, $-4$, and $0$ as $1$, $2$, and $9$, respectively. Hence $\mathcal{S}$ decomposes as the direct sum of the three invariant eigenspaces displayed above. No irreducibility claim is used here. $\square$

**Corollary U.37 (Invariant Projective Spaces).** The projectivizations of the eigenspaces yield $W(F_4)$-invariant projective submanifolds:

- $\mathbb{P}(\mathbf{1}) = \{\text{point}\}$ (trivial)
- $\mathbb{P}(\mathbf{2}) = \mathbb{CP}^1_{\text{inv}}$ (2-sphere)
- $\mathbb{P}(\mathbf{9}) = \mathbb{CP}^8_{\text{inv}}$ (8-dimensional)

**Theorem U.38 (Minimal Adjacency-Eigenspace Sector).** Among the non-trivial projectivizations of the $W(F_4)$-invariant adjacency eigenspaces inside $\mathbb{CP}^{11}$, the space $\mathbb{CP}^1_{\text{inv}} = \mathbb{P}(\mathcal{S}_{-4})$ arising from the eigenvalue-$(-4)$ eigenspace is the minimal positive-dimensional invariant sector.

*Proof.* By Theorem U.36, the adjacency representation decomposes as
$$
\mathcal S \cong \mathbf 1 \oplus \mathbf 2 \oplus \mathbf 9,
$$
and each summand is $W(F_4)$-invariant. Corollary U.37 identifies their projectivizations as
- $\mathbb P(\mathbf 1)=\{\text{point}\}$,
- $\mathbb P(\mathbf 2)=\mathbb{CP}^1_{\text{inv}}$,
- $\mathbb P(\mathbf 9)=\mathbb{CP}^8_{\text{inv}}$.

The only non-trivial positive-dimensional members of this list are $\mathbb{CP}^1_{\text{inv}}$ and $\mathbb{CP}^8_{\text{inv}}$, and
$$
1<8.
$$
Hence $\mathbb{CP}^1_{\text{inv}}$ is the minimal positive-dimensional projectivized adjacency-eigenspace sector. $\square$

*Remark.* The stronger physical claim that this sector is selected for single-field inflation uses the kinetic and PCE arguments listed below. Those arguments do not prove that $\mathbb{CP}^1_{\text{inv}}$ is minimal among all possible $W(F_4)$-invariant projective submanifolds of $\mathbb{CP}^{11}$; they prove only the adjacency-eigenspace comparison stated above.

---

## U.20 Constraint Budget

### U.20.1 Spherical Harmonic Constraints

**Definition U.39 (Harmonic Moment Vector).** For the 24-cell vertices $V_{24}$ and spherical harmonic degree $\ell$, define the moment vector:

$$\mu_\ell := \frac{1}{24} \sum_{v \in V_{24}} Y_\ell(v) \in \mathbb{R}^{N(\ell)}$$

where $Y_\ell : S^3 \to \mathbb{R}^{N(\ell)}$ collects the $N(\ell) = (\ell+1)^2$ spherical harmonics of degree $\ell$.

**Lemma U.40 (Rotational Constraint).** For each degree $\ell \leq t = 5$, the $SO(4)$-invariance of the design implies:

$$\|\mu_\ell\|^2 = 0 \quad \text{for } \ell = 1, \ldots, 5$$

This yields one scalar constraint per degree $\ell$, as the only $SO(4)$-invariant function of $\mu_\ell$ is its squared norm.

*Proof.* By definition of a $t$-design (Theorem U.30), $\mu_\ell = 0$ for $\ell \leq t$. The squared norm $\|\mu_\ell\|^2$ is the unique $SO(4)$-invariant Hermitian form on $\mathbb{R}^{N(\ell)}$. $\square$

**Assumption U.41 (Constraint Budget).** The leading scalar constraint count from the $k = 12$ signal modes and $t = 5$ design strength is

$$N_{\text{budget}} = k \cdot t = 12 \times 5 = 60.$$

*Motivation.* The 24-cell spherical 5-design (Theorem U.30) integrates polynomials of degree $\leq 5$ exactly, providing $t = 5$ moment degrees. The $k = 12$ signal modes of the Golay code span the information subspace. The exact independence condition is the harmonic-rank gate below.

**Definition U.41a (24-Cell Harmonic-Moment Rank Certificate).** Let $\{s_a\}_{a=1}^{12}$ be a fixed orthonormal basis of the Golay signal space evaluated on the 12 antipodal lines of the 24-cell. For each $\ell=1,\ldots,5$, let $h_\ell$ be a retained real spherical harmonic test function of degree $\ell$ whose restriction to the 24-cell vertices is fixed before using the e-fold count. Define the block matrix
$$
\mathcal M_{\ell}(v,a)=s_a(v)h_\ell(v),
\qquad
v\in V_{24},\ a=1,\ldots,12,
\tag{U.41a.1}
$$
and the direct-sum harmonic moment matrix
$$
\mathcal M_{\mathrm{HM}}
=
\bigoplus_{\ell=1}^{5}\mathcal M_\ell.
\tag{U.41a.2}
$$
The harmonic-moment rank certificate is accepted when
$$
\operatorname{rank}\mathcal M_{\mathrm{HM}}=60.
\tag{U.41a.3}
$$

**Theorem U.41b (Constraint Budget from Harmonic-Moment Rank).** On a branch carrying an accepted 24-cell harmonic-moment rank certificate,
$$
N_{\mathrm{budget}}=60
\tag{U.41b.1}
$$
is an exact finite-rank result rather than a product-count assumption.

*Proof.* The matrix $\mathcal M_{\mathrm{HM}}$ has one column for each mode-degree pair $(a,\ell)$ with $a=1,\ldots,12$ and $\ell=1,\ldots,5$, hence it has $12\cdot5=60$ columns. The accepted certificate states that these columns have rank $60$. Therefore all mode-degree constraints are linearly independent, and the number of independent scalar constraints is exactly
$$
N_{\mathrm{budget}}=\operatorname{rank}\mathcal M_{\mathrm{HM}}=60.
$$
∎

*Remark.* The constraint budget $N_{\text{budget}} = 60$ will constrain the number of inflationary e-folds in Section U.23. Without the rank certificate, Assumption U.41 remains a leading branch count.

---

## U.21 Effective Single-Field Dynamics

### U.21.1 Graph Laplacian Energy

**Definition U.42 (Dirichlet Energy on Line Graph).** For a configuration $\psi \in \mathcal{S} \cong \mathbb{C}^{12}$ assigning complex amplitudes to the 12 lines, the graph Dirichlet energy is:

$$E[\psi] = \frac{1}{2} \sum_{\ell \sim \ell'} |\psi_\ell - \psi_{\ell'}|^2 = \frac{1}{2} \psi^\dagger L \psi$$

where $L = D - A$ is the graph Laplacian, $D = 8I$ is the degree matrix, and $A$ is the adjacency matrix.

**Lemma U.43 (Uniqueness of the invariant nearest-neighbor Laplacian form).** Let $M$ be a Hermitian matrix on the twelve-line representation. Assume that $M_{ij}=0$ for distinct nonadjacent vertices, $M\mathbf1=0$, and $M$ is invariant under the $W(F_4)$ action. Then $M$ is a real scalar multiple of the graph Laplacian $L=8I-A$.

*Proof.* The $W(F_4)$ action on the 24-cell roots is transitive on roots and on ordered root pairs having any prescribed inner product. Passing to antipodal lines makes it transitive on the twelve vertices and on adjacent unordered line pairs, which are exactly the pairs with absolute inner product $1/2$. Invariance therefore gives a common off-diagonal value $c$ on every adjacent pair. Locality gives zero on every distinct nonadjacent pair. Vertex transitivity gives a common diagonal value $d$. Since every vertex has degree eight and $M\mathbf1=0$, each row sum is
$$
d+8c=0,
$$
so $d=-8c$. Hence
$$
M=cA-8cI=-c(8I-A)=-cL.
$$
Thus the quadratic form is unique up to the real scale $-c$. ∎

### U.21.2 Kinetic Coefficient

**Proposition U.44 (Laplacian on Invariant Sector).** On the 2-dimensional eigenspace $\mathcal{S}_{-4}$ (eigenvalue $-4$), the graph Laplacian acts as:

$$L|_{\mathcal{S}_{-4}} = (D - A)|_{\mathcal{S}_{-4}} = (8I - (-4)I)|_{\mathcal{S}_{-4}} = 12I$$

*Proof.* The eigenvalue of $A$ on $\mathcal{S}_{-4}$ is $-4$ (Lemma U.34). The degree matrix is $D = 8I$. Thus $L|_{\mathcal{S}_{-4}} = 8I - (-4I) = 12I$. $\square$

**Identification U.44a (Effective Field Theory Kinetic Term).** The graph Laplacian eigenvalue $\lambda^2 = 12$ is identified with the kinetic coefficient in the effective single-field Lagrangian:

$$\mathcal{L}_{\text{kin}} = \frac{\lambda^2 \bar{M}_{Pl}^2}{2} (\partial d_{FS})^2, \qquad \lambda^2 = 12$$

where $d_{FS}$ is the Fubini-Study distance on $\mathbb{CP}^1_{\text{inv}} = \mathbb{P}(\mathcal{S}_{-4})$.

*Justification.* This identification assumes that the discrete graph Dirichlet energy induces, in the continuum limit, a sigma-model kinetic term with the Fubini-Study target metric. The Hopf-Rayleigh gate below supplies the exact no-rescaling condition.

**Definition U.44b (Hopf-Rayleigh Kinetic Datum).** A Hopf-Rayleigh kinetic datum consists of:

1. the invariant eigenspace $\mathcal S_{-4}\cong\mathbb C^2$ with graph Laplacian
$$
L|_{\mathcal S_{-4}}=12I;
\tag{U.44b.1}
$$

2. the projectivization map
$$
\pi:S^3\subset\mathcal S_{-4}\to\mathbb{CP}^1_{\mathrm{inv}};
\tag{U.44b.2}
$$

3. the Fubini-Study metric on $\mathbb{CP}^1_{\mathrm{inv}}$ normalized as in Proposition U.45;

4. the horizontal-lift condition that every retained field path $\bar\psi(x)$ in $\mathbb{CP}^1_{\mathrm{inv}}$ is represented by a lift $\psi(x)\in S^3$ satisfying
$$
\psi(x)^\dagger\partial_\mu\psi(x)=0.
\tag{U.44b.3}
$$

**Theorem U.44c (Hopf-Rayleigh Kinetic Normalization).** On a branch carrying the Hopf-Rayleigh kinetic datum,
$$
\lambda^2=12
\tag{U.44c.1}
$$
is fixed by the graph Rayleigh quotient and the Hopf Riemannian submersion. No additional $O(1)$ rescaling of $d_{FS}$ is compatible with the datum.

*Proof.* For a retained horizontal lift $\psi(x)$ of a projective path $\bar\psi(x)$, the graph Dirichlet kinetic energy is
$$
\frac12\langle\partial_\mu\psi,L\partial^\mu\psi\rangle.
$$
Using $L|_{\mathcal S_{-4}}=12I$ gives
$$
\frac12\langle\partial_\mu\psi,L\partial^\mu\psi\rangle
=
\frac{12}{2}\|\partial_\mu\psi\|^2.
$$
By the horizontal-lift condition, $\partial_\mu\psi$ is orthogonal to the $U(1)$ Hopf fiber. The Hopf projection is a Riemannian submersion for the normalized Fubini-Study metric, so horizontal lengths are preserved:
$$
\|\partial_\mu\psi\|^2
=
\|\partial_\mu\bar\psi\|_{FS}^2.
$$
Along the geodesic coordinate used in the single-field reduction,
$$
\|\partial_\mu\bar\psi\|_{FS}^2=(\partial_\mu d_{FS})^2.
$$
Therefore the induced kinetic term is
$$
\frac{12}{2}(\partial d_{FS})^2.
$$
Restoring $\bar M_{Pl}^2$ gives the Lagrangian in Identification U.44a with $\lambda^2=12$. Any extra rescaling $d_{FS}\mapsto c\,d_{FS}$ would multiply horizontal lengths by $c$ and contradict the Riemannian-submersion normalization, unless $c=1$. ∎

### U.21.3 Target Space Metric

**Proposition U.45 (Fubini–Study Metric on $\mathbb{CP}^1$).** For the curvature-$4$ normalization induced by the unit-sphere Hopf quotient,
$$
ds^2_{FS}
=\frac14\left(d\theta^2+\sin^2\theta\,d\varphi^2\right).
$$
Thus $\mathbb{CP}^1$ is isometric to the round $2$-sphere of radius $1/2$ and has diameter $\pi/2$.

*Proof.* On the affine chart $[1:z]$, the Fubini–Study metric induced by the Hopf quotient is
$$
ds^2_{FS}=\frac{|dz|^2}{(1+|z|^2)^2}.
$$
Use the spherical coordinate
$$
z=\tan\left(\frac\theta2\right)e^{i\varphi},
\qquad
0\le\theta<\pi.
$$
Then
$$
|dz|^2
=\frac14\sec^4\left(\frac\theta2\right)d\theta^2
+\tan^2\left(\frac\theta2\right)d\varphi^2
$$
and
$$
(1+|z|^2)^2=\sec^4\left(\frac\theta2\right).
$$
Division gives
$$
ds^2_{FS}
=\frac14d\theta^2
+\sin^2\left(\frac\theta2\right)
\cos^2\left(\frac\theta2\right)d\varphi^2
=\frac14\left(d\theta^2+\sin^2\theta\,d\varphi^2\right).
$$
The round metric of radius $R$ is $R^2(d\theta^2+\sin^2\theta\,d\varphi^2)$, so $R=1/2$. Antipodal points are separated by $\pi R=\pi/2$, which is the diameter. ∎

**Definition U.46 (Canonical Inflaton Field).** The canonically normalized inflaton field is:

$$\phi := \sqrt{\lambda^2} \, \bar{M}_{Pl} \cdot d_{FS} = \sqrt{12} \, \bar{M}_{Pl} \cdot d_{FS}$$

**Corollary U.47 (Field Range).** The maximum inflaton field excursion is:

$$\Delta\phi_{\max} = \sqrt{12} \, \bar{M}_{Pl} \cdot \frac{\pi}{2} = \sqrt{3}\pi \, \bar{M}_{Pl} \approx 5.44 \, \bar{M}_{Pl}$$

*Verification.* $\sqrt{3}\pi = 1.732 \times 3.1416 = 5.441$. $\checkmark$

---

## U.22 Einstein-Frame Scalar Dynamics

### U.22.1 Gravitational Sector

**Assumption U.48 (Local Equilibrium Truncation).** At the PCE-Attractor (Definition 15a), the emergent gravitational effective action (Proposition W.20) is restricted on the retained scalar branch to the finite curvature ledger

$$
S_{\text{grav}}
=
\int d^4x\sqrt{-g}
\left[
\frac{\bar M_{Pl}^2}{2}(R-2\Lambda)+c_1R^2+c_2R_{\mu\nu}R^{\mu\nu}+c_W C_{\mu\nu\rho\sigma}C^{\mu\nu\rho\sigma}
\right],
\tag{U.48.1}
$$

with the Starobinsky subbranch defined by

$$
c_2=0,
\qquad
c_W=0,
\qquad
c_1>0.
\tag{U.48.2}
$$

The symbols $c_2=0$ and $c_W=0$ are not theorem-level consequences of local equilibrium alone. They are branch entries unless discharged by the finite truncation ledger below.

**Definition U.48a (Local-Equilibrium Truncation Ledger).** A local-equilibrium truncation ledger for the primordial scalar branch is a finite record
$$
\mathfrak L_{\mathrm{LE}}
=
\left(
\mathcal E_{\mathrm{loc}},
\Pi_{\mathrm{sc}},
\mathcal K_2,
\mathcal K_W,
\mathcal B_{GB},
I_{c_2},
I_{c_W},
I_{c_1},
\chi_{\mathrm{LE}}
\right),
\tag{U.48a.1}
$$
where:

1. $\mathcal E_{\mathrm{loc}}$ is the finite local-equilibrium effective-action calculation descending from the same PCE state used for the primordial branch.
2. $\Pi_{\mathrm{sc}}$ is the scalar-sector projection used before comparison with $n_s$, $r$, $A_s$, $n_t$, running, or non-Gaussianity.
3. $\mathcal K_2$ and $\mathcal K_W$ are the finite response kernels multiplying $R_{\mu\nu}R^{\mu\nu}$ and $C_{\mu\nu\rho\sigma}C^{\mu\nu\rho\sigma}$ after applying $\Pi_{\mathrm{sc}}$.
4. $\mathcal B_{GB}$ is the Gauss-Bonnet bookkeeping map, recording which curvature-squared combination is topological and which retained scalar-sector combinations remain dynamical.
5. $I_{c_2}$, $I_{c_W}$, and $I_{c_1}$ are certified finite intervals for the three retained curvature coefficients in the chosen normalization.
6. $\chi_{\mathrm{LE}}=1$ records that no endpoint or truncation choice is selected from the observed scalar spectral data.

**Theorem U.48b (Status of $c_2=0$ on the Current Primordial Branch).** The Starobinsky truncation is theorem-level exactly on branches with an accepted $\mathfrak L_{\mathrm{LE}}$ satisfying
$$
I_{c_2}=\{0\},
\qquad
I_{c_W}=\{0\},
\qquad
0\notin I_{c_1}.
\tag{U.48b.1}
$$
Absent such a ledger, $c_2=0$ and $c_W=0$ are irreducible truncation-branch data. The Gauss-Bonnet identity alone cannot set $c_2$ to zero because it removes only one topological linear combination of curvature-squared terms and does not eliminate the independent scalar-sector response kernel recorded by $\mathcal K_2$.

*Proof.* In four dimensions the Gauss-Bonnet density changes the basis of curvature-squared invariants but leaves two non-topological quadratic curvature directions. The record $\mathfrak L_{\mathrm{LE}}$ is exactly the finite projection and coefficient ledger needed to show that the retained scalar branch has no $R_{\mu\nu}R^{\mu\nu}$ or Weyl-squared response. If (U.48b.1) holds, the action reduces to the Starobinsky branch with fixed $c_1$. If either zero interval is absent, a different scalar/tensor quadratic-curvature branch remains admissible and changes the downstream slow-roll and trans-horizon map. ∎


**Definition U.48c (Finite Equal-Capability Entropy-Minimum Certificate).** Fix a finite exhaustive candidate family $\mathcal X$, an equal-capability relation, a typed entropy $S_{\mathrm{cosmo}}$, and $x_*\in\mathcal X$. The record certifies
$$
S_{\mathrm{cosmo}}(x)-S_{\mathrm{cosmo}}(x_*)\ge\Delta_*>0
\quad(x\ne x_*)
\tag{U.48c.1}
$$
inside the declared capability class. Cost and entropy remain separate ledgers absent an explicit bridge.

**Proposition U.48d (Certificate-Relative Entropy Minimum).** The record makes $x_*$ the unique entropy minimizer in its finite registered class. It proves no physical exit, reachability, or transition dynamics. A dynamical exit theorem additionally requires a precursor state, exhaustive reachable-exit relation, transition law, and independent selection rule.

**Corollary U.49 (Conditional Starobinsky form).** On the Starobinsky subbranch (U.48.2), or on a branch with an accepted local-equilibrium truncation ledger satisfying (U.48b.1), and after omitting the cosmological term during the inflationary calculation, the retained action is
$$
S=\int d^4x\sqrt{-g}\left[\frac{\bar M_{Pl}^2}{2}R+\frac{\bar M_{Pl}^2}{12m_s^2}R^2\right],
$$
where $m_s>0$ is defined by $c_1=\bar M_{Pl}^2/(12m_s^2)$.

### U.22.2 Einstein Frame Potential

**Theorem U.50 (Starobinsky Potential).** Consider the classical action of Corollary U.49 on the branch where the auxiliary conformal factor is positive. Up to the boundary term generated by the Weyl transformation, it is equivalent to Einstein gravity coupled to a canonical scalar field $\chi$ with potential
$$
V(\chi)=\frac{3m_s^2\bar M_{Pl}^2}{4}
\left(1-e^{-\sqrt{2/3}\,\chi/\bar M_{Pl}}\right)^2.
$$

*Proof.* Introduce an auxiliary scalar $A$ and write
$$
S
=\frac{\bar M_{Pl}^2}{2}
\int d^4x\sqrt{-g}
\left[
\left(1+\frac{A}{3m_s^2}\right)R
-\frac{A^2}{6m_s^2}
\right].
$$
Variation with respect to $A$ gives
$$
\frac{R}{3m_s^2}-\frac{A}{3m_s^2}=0,
$$
so $A=R$ and substitution recovers
$$
\frac{\bar M_{Pl}^2}{2}R
+\frac{\bar M_{Pl}^2}{12m_s^2}R^2.
$$
Set
$$
\Phi:=1+\frac{A}{3m_s^2}>0,
\qquad
g^E_{\mu\nu}:=\Phi g_{\mu\nu}.
$$
The four-dimensional Weyl-curvature identity used by Starobinsky (1980) and Mukhanov (2005) gives, after integrating its total divergence,
$$
\sqrt{-g}\,\Phi R
=\sqrt{-g_E}
\left[
R_E-\frac32g_E^{\mu\nu}
\partial_\mu(\log\Phi)\partial_\nu(\log\Phi)
\right].
$$
The auxiliary potential transforms as
$$
\sqrt{-g}\,\frac{\bar M_{Pl}^2A^2}{12m_s^2}
=\sqrt{-g_E}\,
\frac{3m_s^2\bar M_{Pl}^2}{4}
\frac{(\Phi-1)^2}{\Phi^2}.
$$
Define
$$
\chi:=\sqrt{\frac32}\,\bar M_{Pl}\log\Phi.
$$
Then the kinetic term is $-\frac12(\partial\chi)^2$ and
$$
\Phi^{-1}=e^{-\sqrt{2/3}\,\chi/\bar M_{Pl}}.
$$
Consequently,
$$
\frac{(\Phi-1)^2}{\Phi^2}
=(1-\Phi^{-1})^2
=\left(1-e^{-\sqrt{2/3}\,\chi/\bar M_{Pl}}\right)^2,
$$
which proves the stated potential on the $\Phi>0$ branch. ∎

We identify the canonically normalized Einstein-frame scalar $\chi$ with the canonical field $\phi$ defined in Definition U.46, i.e. $\chi = \phi$. If $\chi = \alpha \phi$ with $\alpha = O(1)$, then $x$ and the geometric e-fold bound rescale accordingly.

### U.22.3 Mass Scale Identification


**Identification U.51 (Scalaron Mass from PPI).** The Principle of Physical Instantiation (Definition P.6.2) requires a branch map from the primordial finite determinant scale to the scalaron mass. The linear scalaron branch is

$$
\frac{m_s}{\bar M_{Pl}}=Q.
\tag{U.51.1}
$$

This is a branch identification unless fixed by the scalaron-mass map record below.

**Definition U.51a (Scalaron-Mass Map Record).** A scalaron-mass map record is a finite tuple
$$
\mathfrak M_s
=
\left(
\mathfrak D_Q,
\mathcal O_s,
\Phi_s,
\mathcal N_s,
I_s,
\chi_s
\right),
\tag{U.51a.1}
$$
where $\mathfrak D_Q$ is the accepted primordial determinant certificate of Definition U.26b, $\mathcal O_s$ is the finite scalaron fluctuation operator on the same branch, $\Phi_s$ is the branch-fixed dimensional map from the determinant amplitude to $m_s/\bar M_{Pl}$, $\mathcal N_s$ fixes the Planck-mass and Einstein-frame normalizations, $I_s$ is the certified interval for $m_s/\bar M_{Pl}$, and $\chi_s=1$ records that $\Phi_s$ and $I_s$ are fixed before comparison with $A_s$, $n_s$, $r$, or the scalar amplitude.

The linear identification (U.51.1) is theorem-level exactly when an accepted $\mathfrak M_s$ has
$$
\Phi_s(Q)=Q,
\qquad
I_s=I_Q,
\tag{U.51a.2}
$$
where $I_Q$ is the determinant-certified interval for $Q$ propagated from $\mathfrak D_Q$. Otherwise the scalaron mass is irreducible branch data of the form
$$
\frac{m_s}{\bar M_{Pl}}=f_s(Q),
\tag{U.51a.3}
$$
with $f_s$ fixed by the branch record before trans-horizon observables are evaluated.

**Corollary U.52 (Scalaron mass on the linear-map, leading-determinant branch).** If the scalaron-mass map record satisfies (U.51a.2) and the primordial determinant branch has $A_Q=1$, then
$$
m_s=Q\bar M_{Pl}
=\frac{e^{-11}}{\sqrt2}(2.435\times10^{18}\,\mathrm{GeV})
=2.8757\times10^{13}\,\mathrm{GeV}.
$$
For a determinant-certified interval $I_Q$, the scalaron mass interval is $\bar M_{Pl}I_Q$ on the same linear-map branch.

---

## U.23 E-Fold Bounds

### U.23.1 Information-Theoretic Bound

**Theorem U.53 (Conditional Landauer reset ledger).** Let $B$ be a finite logical record erased in contact with a bath at temperature $T$, and let $R$ contain every record retained unchanged through the reset. Under the cyclic, isothermal, degenerate-register, and Hamiltonian-return hypotheses of Theorem 31,
$$
\frac{\langle Q_{\rm bath}\rangle}{k_BT}
\ge H(B\mid R),
$$
with equality for a thermodynamically reversible implementation. For one unbiased bit independent of $R$, $H(B\mid R)=\ln2$. This is an erasure-heat bound; it is not a universal entropy-production cost of registration. Any use of one $\ln2$ unit per inflationary registration therefore remains an additional branch rule of Assumption U.56.

**Lemma U.54 (Capacity-Registration Ratio on the Residual-Budget Branch).** On the residual-budget, throughput-saturated, ideal-packing branch of Appendix Q (§§Q.2.1–Q.5, on which $C_{\max}^* = 2\ln 2$, $\chi^* = 1$, $\eta^* = 1$), the PCE-optimal structural capacity ratio is:

$$\frac{C^*_{\max}}{\varepsilon_0} = \frac{2\ln 2}{\ln 2} = 2$$

This means each structural SPAP registration ($\varepsilon_0 = \ln 2$) supports registration of $C^*_{\max} = 2\ln 2$ nats of channel capacity.

**Lemma U.55 (Horizon-exit wavenumber and e-fold coordinate).** At horizon exit $k=aH$. If $N=\ln a$ is the elapsed e-fold coordinate and $\epsilon_H:=-d\ln H/dN$, then
$$
d\ln k=(1-\epsilon_H)dN.
$$
If $N_e:=\ln(a_{\rm end}/a)$ denotes e-folds remaining until the end of inflation, then
$$
d\ln k=-(1-\epsilon_H)dN_e.
$$
At leading slow-roll order, $|\Delta\ln k|\simeq|\Delta N_e|$.

*Proof.* Differentiating $\ln k=\ln a+\ln H$ gives $d\ln k=dN+d\ln H=(1-\epsilon_H)dN$. Since $dN_e=-dN$, the second identity follows. ∎

**Assumption U.56 (E-Fold Registration Cost).** The leading registration branch assigns one independent scalar horizon-exit registration to each e-fold, giving

$$
N_e^{(\mathrm{info})}=N_{\mathrm{budget}}=60.
\tag{U.56.1}
$$

This is a branch rule unless it is supplied by the finite e-fold ledger below.

**Definition U.56a (E-Fold Registration Ledger).** An e-fold registration ledger is a finite record
$$
\mathfrak E_N
=
\left(
\mathcal M_{\mathrm{HM}},
\rho_N,
\mathcal Q_{\mathrm{tr}},
\phi_0,
\phi_{\mathrm{end}},
I_N,
\chi_N
\right),
\tag{U.56a.1}
$$
where $\mathcal M_{\mathrm{HM}}$ is the harmonic-moment matrix of Definition U.41a, $\rho_N$ is the fixed rule converting independent harmonic-moment registrations to e-folds, $\mathcal Q_{\mathrm{tr}}$ is the trans-horizon quotient and pivot-registration convention, $\phi_0$ and $\phi_{\mathrm{end}}$ are the finite initial-field and end-of-inflation branch entries, $I_N$ is the certified interval for $N_e$, and $\chi_N=1$ records that none of these entries is selected from the observed values of $n_s$, $r$, $A_s$, $n_t$, running, or local non-Gaussianity.

The rule (U.56.1) is theorem-level exactly when an accepted ledger satisfies
$$
\operatorname{rank}\mathcal M_{\mathrm{HM}}=60,
\qquad
\rho_N(j)=j,
\qquad
I_N=\{60\}
\tag{U.56a.2}
$$
before the fiducial field value and trans-horizon quotient are used. Otherwise $N_e$ is branch data and the observables derived in Theorems U.62-U.63, Lemma U.64, Theorem U.65, Corollaries U.65a-U.65b, and Theorems U.66-U.68 are functions of the interval $I_N$ rather than closed scalar predictions.

### U.23.2 Geometric Bound

**Theorem U.58 (Starobinsky E-Fold Formula).** In the potential slow-roll approximation for the canonical scalar of Theorem U.50, the number of e-folds from $\chi$ to the end point defined by $\epsilon_V=1$ is
$$
N_e(\chi)
=\frac34\left(e^x-x\right)
-\frac34\left(e^{x_{\mathrm{end}}}-x_{\mathrm{end}}\right),
\qquad
x:=\sqrt{\frac23}\frac{\chi}{\bar M_{Pl}},
$$
where
$$
x_{\mathrm{end}}
=\log\left(1+\frac2{\sqrt3}\right)
\approx0.7676.
$$

*Proof.* Let $a:=\sqrt{2/3}/\bar M_{Pl}$, so $x=a\chi$ and
$$
V(\chi)=V_0(1-e^{-x})^2.
$$
Differentiation gives
$$
\frac{V'}{V}
=\frac{2a}{e^x-1}.
$$
Therefore
$$
\epsilon_V
:=\frac{\bar M_{Pl}^2}{2}\left(\frac{V'}V\right)^2
=\frac4{3(e^x-1)^2}.
$$
The equation $\epsilon_V(x_{\mathrm{end}})=1$ is equivalent to
$$
e^{x_{\mathrm{end}}}-1=\frac2{\sqrt3},
$$
which gives the stated end point. The potential slow-roll e-fold integral of Mukhanov (2005) is
$$
N_e(\chi)
=\frac1{\bar M_{Pl}^2}
\int_{\chi_{\mathrm{end}}}^{\chi}
\frac{V}{V'}\,d\chi.
$$
Using $V/V'=(e^x-1)/(2a)$ and $d\chi=dx/a$ yields
$$
N_e
=\frac1{2a^2\bar M_{Pl}^2}
\int_{x_{\mathrm{end}}}^{x}(e^u-1)\,du.
$$
Since $a^2\bar M_{Pl}^2=2/3$,
$$
N_e
=\frac34[e^u-u]_{x_{\mathrm{end}}}^{x},
$$
which is the displayed expression. ∎

**Corollary U.59 (Geometric E-Fold Count).** The maximum field excursion $\Delta\phi_{\max} = \sqrt{3}\pi \bar{M}_{Pl}$ (Corollary U.47) corresponds to:

$$x_{\max} = \sqrt{\frac{2}{3}} \cdot \sqrt{3}\pi = \sqrt{2}\pi \approx 4.443$$

The geometric e-fold count is:

$$N_{\text{geo}} = \frac{3}{4}\left[(e^{x_{\max}} - x_{\max}) - (e^{x_{\text{end}}} - x_{\text{end}})\right]$$

*Evaluation:*
- $e^{4.443} \approx 85.02$
- $e^{0.7676} \approx 2.155$
- $N_{\text{geo}} = \frac{3}{4}[(85.02 - 4.443) - (2.155 - 0.768)]$
- $N_{\text{geo}} = \frac{3}{4}[80.58 - 1.387] = \frac{3}{4} \times 79.19 = 59.4$

$$\boxed{N_{\text{geo}} = 59.4}$$

**Result U.60 (E-Fold Determination).** Given the preceding assumptions and identifications, and assuming inflation begins at maximum field excursion $\phi_{\max}$, the realized e-fold count is:

$$N_e = \min(N_e^{(\text{info})}, N_{\text{geo}}) = \min(60, 59.4) = 59.4$$

The geometric bound is tighter and determines the e-fold count. If inflation begins at $\phi_0 < \phi_{\max}$, then $N_e$ becomes a function of the initial condition $\phi_0 \in (0, \phi_{\max}]$, and derived observables ($n_s$, $r$, $A_s$) shift accordingly via the standard Starobinsky relations.

---

## U.24 Inflationary Observables

Every symbolic relation in this section is conditional on the single-field Starobinsky slow-roll branch. Every displayed numerical specialization using $N_e=59.4$, $Q=e^{-11}/\sqrt2$, or $m_s/\bar M_{Pl}=Q$ is further conditional on the leading primordial branch consisting of the $A_Q=1$ determinant choice of Assumption U.26, the constraint and e-fold registrations of Assumptions U.41 and U.56 (or accepted certificates $\mathfrak H_{24}$ and $\mathfrak E_N$ with the same singleton outputs), the Starobinsky truncation of Assumption U.48 (or an accepted $\mathfrak L_{\mathrm{LE}}$), the linear scalaron map of Identification U.51 (or an accepted $\mathfrak M_s$), the initial condition $\phi_0=\phi_{\max}$, and the trans-horizon quotient used in Result U.60. Absent that branch package, Theorems U.61--U.68 remain formulas in the corresponding certified input intervals rather than closed numerical predictions.

### U.24.1 Slow-Roll Parameters

**Theorem U.61 (Slow-Roll Parameters).** For the canonical Starobinsky potential of Theorem U.50, define the potential slow-roll parameters
$$
\epsilon_V:=\frac{\bar M_{Pl}^2}{2}\left(\frac{V'}V\right)^2,
\qquad
\eta_V:=\bar M_{Pl}^2\frac{V''}V.
$$
As $N_e\to\infty$ along the slow-roll branch of Theorem U.58,
$$
\epsilon_V
=\frac{3}{4N_e^2}
+O\left(\frac{\log N_e}{N_e^3}\right),
\qquad
\eta_V
=-\frac1{N_e}
+O\left(\frac{\log N_e}{N_e^2}\right).
$$

*Proof.* With $x=\sqrt{2/3}\,\chi/\bar M_{Pl}$, direct differentiation gives
$$
\epsilon_V=\frac4{3(e^x-1)^2},
\qquad
\eta_V=\frac43\frac{2-e^x}{(e^x-1)^2}.
$$
Theorem U.58 gives
$$
N_e
=\frac34(e^x-x-C_{\mathrm{end}}),
\qquad
C_{\mathrm{end}}:=e^{x_{\mathrm{end}}}-x_{\mathrm{end}}.
$$
Because $x=\log(e^x)$, this identity implies
$$
e^x=\frac{4N_e}{3}+O(\log N_e).
$$
Hence
$$
\frac1{e^x-1}
=\frac3{4N_e}
+O\left(\frac{\log N_e}{N_e^2}\right).
$$
Substitution into the exact expression for $\epsilon_V$ yields
$$
\epsilon_V
=\frac43\left[
\frac9{16N_e^2}
+O\left(\frac{\log N_e}{N_e^3}\right)
\right]
=\frac3{4N_e^2}
+O\left(\frac{\log N_e}{N_e^3}\right).
$$
Also,
$$
\frac{2-e^x}{(e^x-1)^2}
=-\frac1{e^x-1}+\frac1{(e^x-1)^2},
$$
so
$$
\eta_V
=-\frac43\frac1{e^x-1}
+\frac43\frac1{(e^x-1)^2}
=-\frac1{N_e}
+O\left(\frac{\log N_e}{N_e^2}\right).
$$
∎

### U.24.2 Spectral Index

**Theorem U.62 (Scalar Spectral Index).**

$$n_s = 1 - 6\epsilon + 2\eta = 1 - \frac{2}{N_e} + O(1/N_e^2)$$

With $N_e = 59.4$:

$$\boxed{n_s = 1 - \frac{2}{59.4} = 0.9663}$$

### U.24.3 Tensor-to-Scalar Ratio

**Theorem U.63 (Tensor-to-Scalar Ratio).**

$$r = 16\epsilon = \frac{12}{N_e^2}$$

With $N_e = 59.4$:

$$\boxed{r = \frac{12}{59.4^2} = \frac{12}{3528} = 0.0034}$$

### U.24.4 Scalar Amplitude

**Lemma U.64 (Starobinsky Amplitude Formula).** Assume a canonical single scalar, an adiabatic Bunch–Davies initial state, potential slow roll, and evaluation at first Hubble crossing. For the Starobinsky potential,
$$
A_s
=\frac{N_e^2}{24\pi^2}
\left(\frac{m_s}{\bar M_{Pl}}\right)^2
\left[1+O\left(\frac{\log N_e}{N_e}\right)\right].
$$
On the additional linear scalaron branch of Identification U.51, $m_s/\bar M_{Pl}=Q$, so
$$
A_s
=\frac{N_e^2Q^2}{24\pi^2}
\left[1+O\left(\frac{\log N_e}{N_e}\right)\right].
$$

*Proof.* The leading scalar-spectrum formula for a canonical slow-roll field in the Bunch–Davies state is, as derived in Mukhanov (2005),
$$
A_s
=\frac{V}{24\pi^2\bar M_{Pl}^4\epsilon_V}
$$
at first Hubble crossing. The hypotheses in the lemma are exactly the hypotheses of that result. For the Starobinsky potential,
$$
V=\frac34m_s^2\bar M_{Pl}^2(1-e^{-x})^2,
\qquad
\epsilon_V=\frac4{3(e^x-1)^2}.
$$
Therefore
$$
A_s
=\frac{3m_s^2}{128\pi^2\bar M_{Pl}^2}
(1-e^{-x})^2(e^x-1)^2.
$$
Theorem U.58 implies
$$
e^x=\frac{4N_e}{3}+O(\log N_e),
$$
and hence
$$
(1-e^{-x})^2(e^x-1)^2
=\frac{16N_e^2}{9}
\left[1+O\left(\frac{\log N_e}{N_e}\right)\right].
$$
Multiplication gives
$$
A_s
=\frac{N_e^2}{24\pi^2}
\left(\frac{m_s}{\bar M_{Pl}}\right)^2
\left[1+O\left(\frac{\log N_e}{N_e}\right)\right].
$$
The second formula follows only after applying Identification U.51. ∎

**Theorem U.65 (Scalar Amplitude Value).** With $N_e = 59.4$ and $Q = e^{-11}/\sqrt{2}$:

$$A_s = \frac{59.4^2}{24\pi^2} \times \frac{e^{-22}}{2} = \frac{3528}{24 \times 9.870} \times \frac{e^{-22}}{2}$$

$$A_s = \frac{3528}{236.9} \times \frac{2.790 \times 10^{-10}}{2} = 14.89 \times 1.395 \times 10^{-10}$$

$$\boxed{A_s = 2.08 \times 10^{-9}}$$

*Verification.* $e^{-22} = 2.790 \times 10^{-10}$; $3528/236.9 = 14.89$; $14.89 \times 1.395 = 20.8$. $\checkmark$

**Corollary U.65a (Primordial Complexity Product Lock).** On the predictive-recovery MacWilliams Golay primordial branch of Definition U.18, Identification U.20, Corollary U.24, Identification U.51, Lemma U.64, and Theorem U.63, the scalar amplitude and tensor-to-scalar ratio satisfy
$$
\boxed{
A_s r
=
\frac{A_Qe^{-22}}{4\pi^2}
}.
\tag{U.65a}
$$
In the leading one-loop branch $A_Q=1$,
$$
A_s r
=
\frac{e^{-22}}{4\pi^2}
=
7.0658\times10^{-12}.
$$
Equivalently, using a measured scalar amplitude as an external normalization input,
$$
r
=
\frac{A_Qe^{-22}}{4\pi^2 A_s}.
\tag{U.65b}
$$
With $A_Q=1$ and $A_s=2.10\times10^{-9}$, this gives
$$
r=3.36\times10^{-3}.
$$
The product is independent of the e-fold count $N_e$; its exponential factor is fixed by
$$
22=2\kappa_Q=\dim_{\mathbb R}(\mathbb{CP}^{11}).
$$

*Proof.* Lemma U.64 gives
$$
A_s=\frac{N_e^2Q^2}{24\pi^2}.
$$
Theorem U.63 gives
$$
r=\frac{12}{N_e^2}.
$$
Multiplying these two identities cancels $N_e$:
$$
A_s r
=
\frac{N_e^2Q^2}{24\pi^2}\frac{12}{N_e^2}
=
\frac{Q^2}{2\pi^2}.
$$
Corollary U.24 gives
$$
Q^2=\frac12A_Qe^{-2\kappa_Q}.
$$
Identification U.20 gives $\kappa_Q=11$, hence
$$
Q^2=\frac12A_Qe^{-22}.
$$
Substitution yields
$$
A_s r
=
\frac{1}{2\pi^2}\frac12A_Qe^{-22}
=
\frac{A_Qe^{-22}}{4\pi^2}.
$$
The numerical value follows by inserting $A_Q=1$. Solving the same identity for $r$ gives Equation U.65b. ∎

**Corollary U.65b (Three-Observable Primordial Lock).** At the displayed leading Starobinsky order of Theorems U.62, U.63, and U.67, the observables obey
$$
r
=
3(1-n_s)^2
+
O(N_e^{-3}),
\tag{U.65c}
$$
$$
A_s(1-n_s)^2
=
\frac{A_Qe^{-22}}{12\pi^2}
+
O\!\left(\frac{A_Qe^{-22}}{N_e}\right),
\tag{U.65d}
$$
and
$$
\frac{dn_s}{d\ln k}
=
-\frac{r}{6}
+
O(N_e^{-3}).
\tag{U.65e}
$$
Thus the leading primordial branch locks the scalar amplitude, tensor amplitude, spectral tilt, and running to the same Golay signal-space complexity exponent $22$.

*Proof.* Theorem U.62 gives
$$
1-n_s=\frac{2}{N_e}+O(N_e^{-2}).
$$
Squaring gives
$$
(1-n_s)^2=\frac{4}{N_e^2}+O(N_e^{-3}).
$$
Theorem U.63 gives $r=12/N_e^2$, so
$$
r=3(1-n_s)^2+O(N_e^{-3}).
$$
Multiplying the product-lock identity of Corollary U.65a by $(1-n_s)^2/r$ and using the previous relation gives
$$
A_s(1-n_s)^2
=
\frac{A_s r}{3}
+
O\!\left(\frac{A_s}{N_e^3}\right)
=
\frac{A_Qe^{-22}}{12\pi^2}
+
O\!\left(\frac{A_Qe^{-22}}{N_e}\right),
$$
where Lemma U.64 supplies $A_s=O(N_e^2e^{-22})$. Finally, Theorem U.67 gives
$$
\frac{dn_s}{d\ln k}=-\frac{2}{N_e^2}+O(N_e^{-3}),
$$
while Theorem U.63 gives $r=12/N_e^2$, hence
$$
-\frac{2}{N_e^2}=-\frac{r}{6}.
$$
This proves Equation U.65e. ∎

### U.24.5 Non-Gaussianity

**Theorem U.66 (Squeezed-Limit Local Non-Gaussianity).** Assume canonical single-clock inflation on an attractor background, an adiabatic Bunch–Davies initial state, and evaluation of the bispectrum in the squeezed local limit. Then, at leading slow-roll order,
$$
f_{NL}^{\mathrm{local}}
=\frac5{12}(1-n_s)
=\frac5{6N_e}+O(N_e^{-2}).
$$
With $N_e=59.4$, the leading term is
$$
\boxed{f_{NL}^{\mathrm{local}}=\frac5{6\cdot59.4}=0.0140}.
$$

*Proof.* The single-clock squeezed-limit consistency theorem of Maldacena (2003) states that, under the hypotheses listed above, a long adiabatic curvature mode acts on the short-mode two-point function as a spatial dilation. Its dilation response is the scalar tilt, giving
$$
\lim_{k_L/k_S\to0}
B_\zeta(k_L,k_S,k_S)
=-(n_s-1)P_\zeta(k_L)P_\zeta(k_S).
$$
In the local convention
$$
B_\zeta(k_L,k_S,k_S)
=\frac{12}{5}f_{NL}^{\mathrm{local}}
P_\zeta(k_L)P_\zeta(k_S)
$$
in the squeezed limit. Equating coefficients yields
$$
f_{NL}^{\mathrm{local}}=\frac5{12}(1-n_s).
$$
Theorem U.62 gives $1-n_s=2/N_e+O(N_e^{-2})$, so
$$
f_{NL}^{\mathrm{local}}
=\frac5{6N_e}+O(N_e^{-2}).
$$
Substitution of $N_e=59.4$ gives $5/(356.4)=0.0140$. ∎

### U.24.6 Running and Tensor Tilt

**Theorem U.67 (Spectral Running).**

$$\frac{dn_s}{d\ln k} = -\frac{2}{N_e^2} + O(1/N_e^3)$$

With $N_e = 59.4$:

$$\boxed{\frac{dn_s}{d\ln k} = -\frac{2}{3528} = -5.7 \times 10^{-4}}$$

**Theorem U.68 (Tensor Spectral Index).** The inflationary consistency relation:

$$n_t = -\frac{r}{8} = -\frac{12}{8N_e^2} = -\frac{3}{2N_e^2}$$

With $N_e = 59.4$:

$$\boxed{n_t = -\frac{3}{2 \times 3528} = -4.3 \times 10^{-4}}$$

---

## U.25 Observational Comparison

### U.25.1 CMB Constraints

For this diagnostic table, take $N_e=59.4$ with an illustrative independent Gaussian width $\sigma_{N_e}=2$ and propagate it to first order while holding all other inputs constant. Define $f_{\mathrm{amp}}^2:=A_Q$. The $A_s$ row propagates only $\sigma_{N_e}$ with $A_Q$ held constant; the $A_sr$ row propagates only the separately stated $A_Q=1\pm0.09$ allowance. These are diagonal sensitivity intervals, not a covariance-aware primordial-theory posterior. The comparison uses Planck Collaboration (2020a,b) at pivot scale $k_*=0.05\,\mathrm{Mpc}^{-1}$.

| Observable | Prediction | Observed | Tension |
|---|---|---|---|
| $n_s$ | $0.9663 \pm 0.0011$ | $0.9649 \pm 0.0042$ | 0.3σ diagnostic |
| $r$ | $0.0034 \pm 0.00023$ | $<0.036$ (95% CL) | consistent |
| $A_s$ | $(2.08 \pm 0.14)\times10^{-9}\, f_{\mathrm{amp}}^2$ | $(2.10 \pm 0.03)\times10^{-9}$ | consistent for $f_{\mathrm{amp}}\approx1$ |
| $A_s r$ | $(7.07 \pm 0.64)\times10^{-12}$ on the $A_Q=1\pm0.09$ branch | tensor measurement pending | product-lock target |
| $f_{NL}$ | $0.0140 \pm 0.0005$ | -0.9 ±5.1 | consistent |
| $dn_s/d\ln k$ | $-(5.7 \pm 0.4)\times10^{-4}$ | -0.0045 ±0.0067 | consistent |

**Sources:**
- $n_s$, $A_s$, $dn_s/d\ln k$: Planck Collaboration (2020a), Table 2
- $r$: BICEP/Keck Collaboration (2021), combined with Planck
- $f_{NL}^{\text{local}}$: Planck Collaboration (2020b), Table 7

### U.25.2 Falsification Criteria

**Theorem U.69 (Conditional Falsification Conditions).** Conditional on an accepted primordial branch certificate $\mathfrak P_{\mathrm{prim}}$ of Definition U.69a below, the primordial-sector predictions are falsified by any statistically significant measurement lying outside the certified branch intervals for
$$
Q,
\quad
A_s,
\quad
n_s,
\quad
r,
\quad
n_t,
\quad
\frac{dn_s}{d\ln k},
\quad
f_{NL}^{\mathrm{local}}.
\tag{U.69.1}
$$
On the special leading branch with $A_Q=1$, $N_e=59.4$, linear scalaron map $m_s/\bar M_{Pl}=Q$, Starobinsky truncation, $\phi_0=\phi_{\max}$, and the trans-horizon quotient used in Corollary U.65a, the diagnostic central values remain
$$
r=0.0034,
\qquad
n_s=0.9663,
\qquad
\frac{dn_s}{d\ln k}=-5.7\times10^{-4},
\qquad
f_{NL}^{\mathrm{local}}=0.0140,
\tag{U.69.2}
$$
and
$$
A_s r=\frac{A_Qe^{-22}}{4\pi^2}.
\tag{U.69.3}
$$
These numbers are comparison data for that branch only; they are not transferable to another determinant, scalaron-map, truncation, e-fold, initial-field, or trans-horizon branch.

**Definition U.69a (Primordial Branch Certificate).** A primordial branch certificate is a finite record
$$
\mathfrak P_{\mathrm{prim}}
=
\left(
\mathfrak D_Q,
\mathfrak H_{24},
\mathfrak K_{\mathrm{HR}},
\mathfrak M_s,
\mathfrak L_{\mathrm{LE}},
\mathfrak E_N,
\phi_0,
\mathcal Q_{\mathrm{tr}},
\mathcal R_{\mathrm{prim}},
\chi_{\mathrm{prim}}
\right),
\tag{U.69a.1}
$$
where:

1. $\mathfrak D_Q$ is the $\mathbb{CP}^{11}$ determinant certificate of Definition U.26b, including the retained fluctuation operator, mass term, zeta finite-part convention, measure quotient, real-projection treatment, tail interval, and finite-part scale.
2. $\mathfrak H_{24}$ is the 24-cell harmonic-moment rank certificate of Definition U.41a with the rank value used for the constraint budget.
3. $\mathfrak K_{\mathrm{HR}}$ is the Hopf-Rayleigh kinetic datum of Definition U.44b, including the scalar geodesic normalization and the no-rescaling condition of Theorem U.44c.
4. $\mathfrak M_s$ is the scalaron-mass map record of Definition U.51a.
5. $\mathfrak L_{\mathrm{LE}}$ is the local-equilibrium truncation ledger of Definition U.48a, including the status of $c_2=0$ and $c_W=0$.
6. $\mathfrak E_N$ is the e-fold registration ledger of Definition U.56a.
7. $\phi_0$ is the initial-field branch entry and $\mathcal Q_{\mathrm{tr}}$ is the trans-horizon quotient, pivot, and matching convention.
8. $\mathcal R_{\mathrm{prim}}$ is the certified interval vector for $Q$, $A_s$, $n_s$, $r$, $n_t$, running, and $f_{NL}^{\mathrm{local}}$ after propagating determinant, kinetic, scalaron-map, truncation, registration, initial-field, and trans-horizon uncertainties.
9. $\chi_{\mathrm{prim}}=1$ records that every entry is fixed before comparison with cosmological data.

**Theorem U.69b (Finite Classification of Current Primordial Branch Content).** In the present Appendix U record, the admissible primordial outputs are classified by the finite branch coordinates
$$
(\mu_Q,m_Q^2,\mathcal J_Q,\operatorname{rank}\mathcal M_{\mathrm{HM}},\lambda^2,\Phi_s,I_{c_2},I_{c_W},\rho_N,\phi_0,\mathcal Q_{\mathrm{tr}}).
\tag{U.69b.1}
$$
The determinant prefactor, scalaron-mass map, local-equilibrium truncation, e-fold registration, initial field, and trans-horizon quotient are not all instantiated as accepted forward-locked finite records in the current file. Therefore the theorem-level registry value for the full primordial interval vector is
$$
\mathcal R_{\mathrm{prim}}=\varnothing_{\mathrm{cert}}
\tag{U.69b.2}
$$
until an accepted $\mathfrak P_{\mathrm{prim}}$ is entered. The displayed values in (U.69.2) remain the leading-branch comparison tuple and may be tested, but they are not closed PU outputs independent of the branch coordinates (U.69b.1).

*Proof.* Definition U.26b supplies the determinant certificate schema but does not by itself force a unique $m_Q^2$, $\mathcal J_Q$, or finite part. Definition U.41a can close the constraint budget only when the rank certificate is accepted. Definition U.44b closes the kinetic normalization only on the Hopf-Rayleigh branch. Definition U.51a shows that $m_s/\bar M_{Pl}=Q$ is a scalaron-map branch, and Definition U.48a shows that $c_2=0$ and $c_W=0$ are truncation entries. Definition U.56a isolates the e-fold registration rule, initial field, and trans-horizon quotient. These entries change the functions that compute $Q$, $A_s$, $n_s$, $r$, $n_t$, running, and local non-Gaussianity. Theorem P.14.1f forbids promoting the numerical tuple by relabeling after comparison. Thus the finite classification is exactly (U.69b.1), and the certified closed interval vector is empty until the record (U.69a.1) is accepted. ∎


---

## U.26 Structural Summary

### U.26.1 Dual Complexity Hierarchy

**Summary U.70 (Complexity Parameters).**

| Sector | Configuration Space | $\kappa$ | Physical Scale |
|:-------|:-------------------:|:--------:|:--------------:|
| Vacuum | $k^2=144$ shell | five-mode reference exponent $\kappa_{\mathrm{ref}}=141.5$ under the reference-counting convention; Definition U.6 four-mode exponent $\kappa=142$ under Theorem U.13b | five-mode working-prefactor value $(2.88\pm0.03)\times10^{-122}$ is reference-only; four-mode forward row $\Lambda_4L_P^2=8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284}$ is prefactor-certificate-pending |
| Primordial | $\mathbb{CP}^{11}$ | $11$ | $Q \approx 1.18 \times 10^{-5}$ |

The hierarchy $\kappa_{\Lambda,\mathrm{ref}} / \kappa_Q = 12.86$ summarizes the Appendix U five-mode reference separation between the vacuum branch and the primordial perturbation scale. Under the hypotheses of Theorem U.13b, the corresponding four-mode branch value gives $\kappa_{\Lambda,\mathrm{trans}} / \kappa_Q = 12.91$.

### U.26.2 Golay-Steiner Unification

**Summary U.71 (Structural Unity).** Both sectors connect to the Golay code $[24, 12, 8]$ (Theorem Z.13):

- **Vacuum**: Full code structure $\to$ Grassmannian $\text{Gr}_\mathbb{C}(12,24)$ $\to$ Appendix U five-mode reference exponent $\kappa_{\Lambda,\mathrm{ref}} = 141.5$ (Theorem U.16), with Theorem U.8c obstructing the pure-coordinate dilatation realization inside the current continuum action, while Theorem U.13b closes the corrected full-discrete four-mode branch under the explicit false-vacuum spectral hypotheses stated there
- **Primordial**: Signal subspace $\mathbb{C}^{12}$ $\to$ Projective space $\mathbb{CP}^{11}$ $\to$ $\kappa_Q = 11$ (Identification U.20)
- **Inflation dynamics**: 24-cell 5-design $\to$ 12-line graph $\to$ $\mathbb{CP}^1_{\text{inv}}$ $\to$ Starobinsky, conditional on Identification U.44a and Assumption U.48 or their accepted kinetic/truncation certificates
- **Observable predictions**: conditional on Assumptions U.26, U.41, U.48, and U.56 (or accepted certificates with the same outputs), Identification U.51 or an accepted scalaron-mass map, the initial condition $\phi_0=\phi_{\max}$, and the trans-horizon quotient used in Result U.60

The framework achieves inflationary predictions from the Golay-Steiner structure, conditional on the identifications and assumptions stated in this appendix. The vacuum sector now carries two logically distinct statements: a five-mode reference exponent within the stated counting convention, and a corrected full-discrete four-mode closure under the explicit false-vacuum spectral hypotheses of Theorem U.13b.

---

**Proposition U.72 (Shared Zero-Mode Counting Law for the Present Electroweak and Vacuum Hierarchies).** The currently derived electroweak and vacuum hierarchy exponents all take the form
$$
\kappa=\kappa_0-\frac{m}{2},
$$
where $\kappa_0$ is the base complex Gaussian count and $m$ is the real collective-coordinate count on the relevant branch. More precisely:

1. Electroweak sector:
$$
\kappa_{EW}=39-\frac12=38.5.
$$
2. Appendix U five-mode reference branch:
$$
\kappa_{\Lambda,\mathrm{ref}}=144-\frac52=141.5.
$$
3. Corrected four-mode vacuum branch under Theorem U.13b:
$$
\kappa_{\Lambda,\mathrm{trans}}=144-2=142.
$$

*Proof.* Theorem T.5 gives the electroweak base count $\kappa_0^{EW}=39$ and zero-mode count $m_{EW}=1$, hence $\kappa_{EW}=39-\frac12=38.5$. Theorem U.3 gives
$$
\dim_{\mathbb C}\operatorname{Gr}_{\mathbb C}(12,24)=12(24-12)=144,
$$
and Convention U.14a identifies this complex normal-direction count with the vacuum base exponent $\kappa_0^\Lambda=144$. Under the Appendix U five-mode reference counting convention of Theorems U.15-U.16, one subtracts $m=5$, obtaining $\kappa_{\Lambda,\mathrm{ref}}=144-\frac52=141.5$. Theorem U.8c simultaneously shows that this is a reference-counting branch rather than theorem-level continuum closure. Under the Definition U.6 normalization and the explicit false-vacuum spectral hypotheses of Theorem U.13b, the full discrete problem has exactly four translational zero modes and no additional nullity, hence $\kappa_{\Lambda,\mathrm{trans}}=144-\frac42=142$. ∎

**Corollary U.72a (Reference-Branch Vacuum–Electroweak Sum Rule).** On the Appendix U five-mode reference branch,
$$
2\kappa_{\Lambda,\mathrm{ref}}+2\kappa_{EW}=360=\binom{D+2}{2}M.
$$

*Proof.* Corollary T.62a proves the identity. Using Theorem Z.11 and Theorem Z.5 gives
$$
\binom{D+2}{2}M=\binom{6}{2}\cdot 24=360.
$$
∎

**Proposition U.72b (No Moonshine-Coefficient Shortcut for $\kappa_{\Lambda}$).** In Appendix U, the cosmological exponent is fixed only by the Grassmannian dimension and the zero-mode branch:
$$
\kappa_{\Lambda}=\frac{N_{\mathbb R}-m}{2},
\qquad
N_{\mathbb R}=288,
\qquad
m=4+\nu.
$$
The Moonshine character coefficient $196884$ and the Monster representation dimension $196883$ are not inputs to this formula and do not determine $\kappa_{\Lambda}$, $A_{\mathrm{eff}}$, or the four-mode/five-mode branch choice.

*Proof.* Theorem U.16a gives $\kappa=142-\nu/2$ with $\nu\in\{0,1\}$, so the branch data needed for the vacuum exponent are the real dimension $N_{\mathbb R}=288$ and the zero-mode indicator $\nu$. Theorem U.8c, Theorem U.13, and Theorem U.13b decide the status of the fifth mode by continuum and discrete Hessian information. None of those statements contains a VOA weight-space dimension or Monster representation dimension. Conversely, Theorem P.13.17 supplies the character coefficient $196884$ only after the Leech/Moonshine branch has been selected; it does not supply a Hessian null vector, a finite determinant, a zero-mode volume, a Jacobian, or a measure normalization. Therefore replacing the Morse-Bott zero-mode ledger by Moonshine coefficient data would change the definition of the Appendix U exponent rather than deriving it. ∎

**Corollary U.72c (Zero-Mode Ledger Identity).** With
$$
\kappa_\Lambda=144-\frac{m_\Lambda}{2},
\qquad
\kappa_{EW}=39-\frac{m_{EW}}{2},
$$
one has
$$
2\kappa_\Lambda+2\kappa_{EW}
=366-(m_\Lambda+m_{EW}).
$$
Consequently, the five-mode reference convention $(m_\Lambda,m_{EW})=(5,1)$ gives $360$, whereas the corrected four-mode branch of Theorem U.13b together with the electroweak branch of Theorem T.5, $(m_\Lambda,m_{EW})=(4,1)$, gives $361$. The value $360$ is therefore a property of the five-mode reference-counting convention, not a branch-independent constant.

*Proof.* Substitute the two zero-mode budgets into the displayed identity. No prefactor evaluation enters this arithmetic. ∎

**Corollary U.72d (Cosmological-Anchor-Free Electroweak Diagnostic from the Four-Mode Observational Inversion).** Define from observed inputs
$$
A_{\mathrm{eff}}^{(\mathrm{obs},4)}
:=
\frac{\Lambda L_P^2e^{284}}{8\pi},
\qquad
J
:=
\frac{(\Lambda L_P^2)(v_{\mathrm{obs}}/M_{Pl})^2e^{360}}{8\pi}.
$$
Then
$$
\frac{A_{\mathrm{eff}}^{(\mathrm{obs},4)}A_{EW}^2}{Je}
=
\left(\frac{A_{EW}e^{-\kappa_{EW}}M_{Pl}}{v_{\mathrm{obs}}}\right)^2
=
\left(\frac{v_{\mathrm{pred}}}{v_{\mathrm{obs}}}\right)^2,
\qquad
\kappa_{EW}=38.5.
$$
The same observed $\Lambda$ occurs in both $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$ and $J$, so its cancellation, including all $H_0$ dependence, is exact. This ratio is therefore a cosmological-anchor-free electroweak diagnostic, not an input-free prediction and not an independent test of the four-mode vacuum prefactor or zero-mode count. A numerical four-mode product-lock prediction still requires an independently evaluated $A_{\mathrm{eff}}^{(\mathrm{Fred},4)}$ interval (Proposition U.15c; Corollary U.15f). On the determinant-model branch of Theorem T.29, the ratio is
$$
\left(\frac{v_{\mathrm{pred}}}{v_{\mathrm{obs}}}\right)^2
\approx1.048.
$$

*Proof.* Substitution gives
$$
\frac{A_{\mathrm{eff}}^{(\mathrm{obs},4)}A_{EW}^2}{Je}
=
\frac{e^{284}A_{EW}^2}{(v_{\mathrm{obs}}/M_{Pl})^2e^{361}}
=
A_{EW}^2e^{-77}\left(\frac{M_{Pl}}{v_{\mathrm{obs}}}\right)^2,
$$
using $361-284=77=2\kappa_{EW}$. This is the displayed electroweak ratio, and the cancellation of $\Lambda$ is explicit. ∎

**Proposition U.73 (Conditional Weighted-Conformal Zero Mode on the Definition U.4 Branch).** Work in $D=4$ with the continuum action of Definition U.4. Assume:

1. $\phi^*(x)=\varphi(|x|)$ is a non-trivial finite-action $O(4)$-symmetric critical point of $S_{\mathrm{cont}}$;
2. the effective potential is quartic-homogeneous on the relevant branch,
$$
V_{\mathrm{eff}}(\lambda\phi)=\lambda^4V_{\mathrm{eff}}(\phi)
\qquad (\lambda>0),
$$
so that the weighted dilations
$$
(T_\rho\phi)(x):=\rho^{-1}\phi(x/\rho)
$$
preserve the Definition U.4 action.

Then:

(a) $T_\rho\phi^*$ is again an exact critical point of $S_{\mathrm{cont}}$ for every $\rho>0$;

(b) the weighted conformal tangent
$$
s_{\mathrm{conf}}(x):=\frac{d}{d\ln\rho}\Big[\rho^{-1}\phi^*(x/\rho)\Big]_{\rho=1}
=-\phi^*(x)-x^\mu\partial_\mu\phi^*(x)
$$
lies in the Hessian kernel;

(c) $s_{\mathrm{conf}}$ is nonzero and linearly independent of the four translational zero modes of Theorem U.8.

Consequently the translation plus weighted-conformal orbit is a five-dimensional exact collective-coordinate branch through $\phi^*$, and on that branch the Appendix U exponent is
$$
\kappa_\Lambda=144-\frac52=141.5.
$$
This does not contradict Theorem U.8c, which concerns the distinct pure-coordinate tangent $s_{\mathrm{coord}}(x)=x^\mu\partial_\mu\phi^*(x)$.

*Proof.* Let $y=x/\rho$. Then
$$
(T_\rho\phi)(x)=\rho^{-1}\phi(y),
\qquad
\partial_\mu(T_\rho\phi)(x)=\rho^{-2}(\partial_\mu\phi)(y).
$$
Because $D=4$, the kinetic term is invariant:
$$
\int_{\mathbb R^4}\frac12|\nabla T_\rho\phi|^2\,d^4x
=
\int_{\mathbb R^4}\frac12|\nabla\phi|^2\,d^4y.
$$
By quartic homogeneity,
$$
V_{\mathrm{eff}}(T_\rho\phi(x))
=
V_{\mathrm{eff}}(\rho^{-1}\phi(y))
=
\rho^{-4}V_{\mathrm{eff}}(\phi(y)),
$$
so after the change of variables $d^4x=\rho^4\,d^4y$, the potential term is also invariant. Hence
$$
S_{\mathrm{cont}}[T_\rho\phi]=S_{\mathrm{cont}}[\phi]
\qquad
\text{for all }\phi,\rho>0.
$$
Since $T_\rho$ is an invertible smooth action on field space, critical points are carried to critical points, proving (a).

Differentiate the exact critical family $\rho\mapsto T_\rho\phi^*$ at $\rho=1$. The derivative is $s_{\mathrm{conf}}$, so differentiating the Euler-Lagrange equation along that family yields
$$
D^2S_{\mathrm{cont}}(\phi^*)[s_{\mathrm{conf}},\eta]=0
\qquad
\text{for all test directions }\eta,
$$
proving (b).

For (c), the translation zero modes are $t_\mu=-\partial_\mu\phi^*$. Because $\phi^*$ is $O(4)$-symmetric, each $t_\mu$ transforms in the vector representation, while $s_{\mathrm{conf}}=-\varphi(r)-r\varphi'(r)$ is an $O(4)$ scalar. Under any $O(4)$-invariant inner product, scalar and vector isotypic components are orthogonal. If $s_{\mathrm{conf}}=0$, then $r\varphi'(r)=-\varphi(r)$, so $\varphi(r)=c/r$; finite action then forces $c=0$, contradicting non-triviality. Hence $s_{\mathrm{conf}}\neq0$ and cannot lie in the translation span. Theorem U.3 gives $\dim_{\mathbb C}\operatorname{Gr}_{\mathbb C}(12,24)=144$, and Convention U.14a identifies this complex normal-direction count with the base exponent. Subtracting one half of the five real collective coordinates then gives $\kappa_\Lambda=144-\frac52=141.5$. The distinction from Theorem U.8c follows because $s_{\mathrm{conf}}=-\phi^*-s_{\mathrm{coord}}$ is not the pure-coordinate tangent. ∎

**Theorem U.73a (Quartic Homogeneity Refuted on the Theorem-Level False-Vacuum Branch).** Work under the hypotheses of Theorem U.13b, and let
$$
\phi^*(x)=\varphi(|x|)
$$
be the associated non-trivial finite-action $O(4)$-symmetric one-bounce saddle. Then there is no interval $I\subset\mathbb R$ containing $0$ and the nonzero values attained by $\varphi$ on which
$$
V_{\mathrm{eff}}(\lambda\phi)=\lambda^4V_{\mathrm{eff}}(\phi)
$$
holds for all $\phi\in I$ and all $\lambda>0$ with $\lambda\phi\in I$. In particular, the quartic-homogeneity hypothesis of Proposition U.73 does not hold on the theorem-level false-vacuum bounce branch.

*Proof.* Theorem U.13b gives
$$
V_{\mathrm{eff}}\in C^3(\mathbb R),
\qquad
V_{\mathrm{eff}}(0)=V_{\mathrm{eff}}'(0)=0,
\qquad
V_{\mathrm{eff}}''(0)>0,
$$
and provides a non-trivial one-bounce saddle $\phi^*(x)=\varphi(|x|)$ with
$$
\lim_{r\to\infty}\varphi(r)=0,
\qquad
\varphi'(r)<0\ \,(r>0).
$$
Because the bounce is non-trivial, there exists a nonzero value $a$ attained by $\varphi$. Assume, for contradiction, that quartic homogeneity holds on an interval containing $0$ and $a$. Then for all sufficiently small $t>0$,
$$
V_{\mathrm{eff}}(ta)=t^4V_{\mathrm{eff}}(a).
$$
But Taylor expansion at $0$ gives
$$
V_{\mathrm{eff}}(ta)=\frac12V_{\mathrm{eff}}''(0)a^2t^2+o(t^2)
\qquad (t\to0^+).
$$
Dividing by $t^2$ and letting $t\to0^+$ yields
$$
\frac12V_{\mathrm{eff}}''(0)a^2=0,
$$
contradicting $a\neq0$ and $V_{\mathrm{eff}}''(0)>0$. Therefore quartic homogeneity is impossible on this branch. ∎

**Corollary U.73b (The Four-Mode Branch Is the Sole Current Theorem-Level Vacuum Closure).** On the theorem-level false-vacuum branch of Appendix U, Proposition U.73 cannot be upgraded to an unconditional five-mode closure. The only current theorem-level vacuum closure is the four-mode branch of Theorem U.13b, with
$$
\kappa_\Lambda=142.
$$

*Proof.* Proposition U.73 requires quartic homogeneity. Theorem U.73a refutes that hypothesis on the theorem-level false-vacuum branch. Theorem U.13b supplies the four-mode closure. ∎

**Remark U.73b.1 (24-Cell Orthogonality Boundary for the Dilatation Gate).** Let $X=V_{24}\subset S^3$ be the 24-cell vertex set and let $d(r,i)=r\varphi'(r)$ be the sampled pure-coordinate dilatation tangent of Theorem U.13. For fixed $r$, $d(r,i)$ is constant in the vertex label $i$. By the explicit coordinate enumeration of Definition U.28 and Lemma U.29 — equivalently the degree-$1$ case of the spherical-design identity of Theorem U.30 — each coordinate sum
$$
\sum_{i=1}^{24}(x_i)_\mu=0
$$
vanishes because $\{\pm e_j\}$ contributes zero on every axis and $\{\frac12(\pm1,\pm1,\pm1,\pm1)\}$ contributes zero on every axis by sign symmetry. Hence the sampled inner product of $d$ with each coordinate function is
$$
\langle d,x^{(\mu)}\rangle_{24}
=
\frac{r\varphi'(r)}{24}\sum_{i=1}^{24}(x_i)_\mu
=0.
$$
This proves orthogonality of the sampled dilatation tangent to the coordinate module $E_3=\mathrm{span}\{x^{(1)},x^{(2)},x^{(3)},x^{(4)}\}$ identified by Corollary U.13a.1 and named in Theorem U.13b.

This orthogonality is not a fifth-mode closure theorem. Proposition U.13a gives $L_W1=0$, so the sampled angular kernel of $L_W$ is exactly the constant mode; Corollary U.13a.1 places the four coordinate functions at $\lambda=3$, not in $\ker L_W$. The four translation zero modes of the full discrete Hessian therefore arise from the separated radial operator in the $\lambda=3$ sector via Lemma U.13a.3, not from any angular kernel mechanism. The exclusion of a zero mode in the constant angular sector uses Lemma U.13a.2. Therefore Theorem U.13b remains the theorem-level four-mode closure only under its stated false-vacuum spectral hypotheses; the 24-cell coordinate sum identity supplies an orthogonality audit, not a promotion of those spectral hypotheses.

**Remark U.73c (Logical Boundary).** Theorem U.73a closes the issue negatively for the bounce branch actually used to obtain theorem-level vacuum closure. It does not exclude the possibility that a different, explicitly massless continuum action could have an asymptotically quartic UV regime; it shows only that such a regime is not the current Appendix U closure branch. Theorem K.10.7 supplies RG/fixed-point language but not an exact scale-invariant fixed-point theorem at the bounce scale; Theorem U.3 fixes the Gaussian base count $144$ but does not determine the homogeneity degree of $V_{\mathrm{eff}}$; and Proposition R.4.2a constrains the lattice sector rather than the local false-vacuum mass term.

**Remark U.73d.** Corollary U.15b gives
$$
A_{\mathrm{eff}}^{(\mathrm{obs})}=0.917\pm0.016
$$
on the five-mode reference branch and
$$
A_{\mathrm{eff}}^{(\mathrm{obs},4)}=2.49\pm0.04
$$
on the four-mode branch. This keeps the phenomenological comparison explicit while preserving the theorem-level conclusion that only the four-mode branch is presently closed.

**Definition U.73e (Four-Mode Fredholm Prefactor Closure Record).** A four-mode Fredholm prefactor closure record is the finite tuple
$$
\mathfrak F_U^{(4)}
=
\left(
H_4,
H_{\mathrm{false}},
H_{\mathrm{bounce}},
\Pi_0^{(4)},
\Pi_-,
J_4,
\mathcal D_4,
A_{\mathrm{neg}},
A_{\mathrm{ghost}},
A_{\mathrm{meas}},
\mu_U,
\mathcal T_4,
\chi_U
\right)
\tag{U.73e.1}
$$
with all entries fixed on the same $\kappa=142$ false-vacuum branch of Theorem U.13b.

1. $H_4$ is the certified finite Hessian matrix of the sampled four-mode branch. Its kernel is exactly the four-dimensional translation span and contains no dilatation vector.
2. $H_{\mathrm{false}}$ and $H_{\mathrm{bounce}}$ are the false-vacuum and bounce Fredholm Hessians on the same quotient Hilbert space $\mathcal H_U^{(4)}$ after gauge quotienting and boundary-condition matching.
3. $\Pi_0^{(4)}$ is the projection onto the four translation zero modes, and $\Pi_-$ is the finite-rank projection onto all negative directions, including the pure-coordinate dilatation direction when it survives the continuum-to-finite transfer as a negative mode.
4. The determinant line
$$
\operatorname{Det}_U^{(4)}
=
\det\ker H_{\mathrm{bounce}}\otimes\det(\operatorname{coker}H_{\mathrm{bounce}})^*
\tag{U.73e.2}
$$
is oriented before evaluating determinants, and its predictive anomaly class is zero or is filled by an accepted finite defect-filling datum of Definition X.9.5e.
5. $J_4$ is the collective-coordinate Jacobian for the four translations together with the finite-volume/extensivity quotient, written internally as
$$
J_4=J_{\mathrm{coll},4}A_{\mathrm{fv},4}.
\tag{U.73e.3}
$$
6. $\mathcal D_4$ is the same-convention zeta/Fredholm determinant finite part
$$
\mathcal D_4
=
\left(
\frac{\det{}'_{\zeta,\mu_U}H_{\mathrm{false}}}{|\det{}''_{\zeta,\mu_U}H_{\mathrm{bounce}}|}
\right)^{1/2},
\tag{U.73e.4}
$$
where $\det'$ removes the false-vacuum collective null directions and $\det''$ removes both $\Pi_0^{(4)}$ and $\Pi_-$. If determinant transfer is used, $\mathcal D_4$ contains the Bismut-Lebeau datum $\mathfrak B_{\mathrm{BL}}$ of Definition U.15g and the transfer error interval.
7. $A_{\mathrm{neg}}$ is the negative-mode magnitude after the false-vacuum decay phase prescription has been separated from the static magnitude prefactor.
8. $A_{\mathrm{ghost}}$ is the ghost and gauge-volume factor on the same quotient Hilbert space.
9. $A_{\mathrm{meas}}$ is the measure-normalization factor, including the finite normalization of the fluctuation coordinates and the determinant-line orientation convention.
10. $\mu_U$ is the single zeta finite-part scale and finite-part prescription used for both $H_{\mathrm{false}}$ and $H_{\mathrm{bounce}}$.
11. $\mathcal T_4$ is the spectral-tail certificate, consisting of a cutoff $N$, a computable finite partial product, and an interval bounding the omitted heat/zeta tail in the same finite-part convention.
12. $\chi_U=1$ records that no entry of $\mathfrak F_U^{(4)}$ is chosen by comparison with $\Lambda L_P^2$, the five-mode working prefactor, or an observational inversion.

The certified four-mode prefactor interval is
$$
A_{\mathrm{eff}}^{\mathrm{Fred},4}
\in
J_4A_{\mathrm{neg}}A_{\mathrm{ghost}}A_{\mathrm{meas}}\mathcal D_4\cdot\mathcal T_4.
\tag{U.73e.5}
$$
Here interval multiplication is understood in the ordered positive interval sense after the negative-mode phase has been removed from the magnitude.

**Theorem U.73f (Four-Mode Fredholm Branch Classification and Forward Formula).** The four-mode exponent is closed as
$$
\kappa=142
\tag{U.73f.1}
$$
under the false-vacuum spectral hypotheses of Theorem U.13b. The numerical prefactor row is closed exactly on branches carrying an accepted $\mathfrak F_U^{(4)}$. On such a branch,
$$
\Lambda_4L_P^2
=
8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284}
\tag{U.73f.2}
$$
and equivalently
$$
\Lambda_4L_P^2
\in
\left(1.1497594801473928\times10^{-122}\right)
\,I_A,
\tag{U.73f.3}
$$
where $I_A$ is the accepted interval for $A_{\mathrm{eff}}^{\mathrm{Fred},4}$ from (U.73e.5). In the current file no accepted tuple supplies all entries of Definition U.73e; therefore the registry value for the four-mode forward prefactor is
$$
A_{\mathrm{eff}}^{\mathrm{Fred},4}=\varnothing_{\mathrm{cert}},
\qquad
\Lambda_4L_P^2=\varnothing_{\mathrm{cert}}
\tag{U.73f.4}
$$
with the closed exponential coefficient (U.73f.3) retained for any future accepted branch. The five-mode working prefactor is reference-convention data and cannot be substituted into (U.73f.2).

*Proof.* Theorem U.13b fixes exactly four translation zero modes and excludes an additional null mode under its stated false-vacuum spectral hypotheses; Theorem U.8c prevents transfer of the pure-coordinate dilatation tangent to a zero-mode slot. Definition U.73e lists every factor entering the Fredholm magnitude on the four-mode quotient Hilbert space: false-vacuum Hessian, bounce Hessian, zero-mode projection, negative-mode audit, determinant-line orientation, collective-coordinate and finite-volume Jacobian, ghost factor, measure normalization, common zeta finite part, optional Bismut-Lebeau transfer, and spectral tail. Formula (U.73e.5) is exactly the Callan-Coleman/Fredholm determinant magnitude with the negative phase separated. Multiplying by $8\pi e^{-284}$ gives (U.73f.2), and direct evaluation gives $8\pi e^{-284}=1.1497594801473928\times10^{-122}$. Because the current manuscript supplies schemas and branch audits but not all numerical determinant, ghost, Jacobian, measure, and tail entries on the same four-mode branch, (U.73f.4) is the certified status. Reusing the five-mode prefactor would change $\Pi_0$, $J_4$, and the determinant complement, hence would be a different branch rather than a four-mode evaluation. ∎

## U.27 Conclusion

This appendix derives the cosmological constant reference scale and the primordial observables from the Golay-Steiner structure at $M = 24$, but with different logical status in the two sectors.

**Vacuum Sector.** Under the Appendix U leading-order five-mode counting convention, the reference exponent $\kappa_{\Lambda,\mathrm{ref}} = 141.5$ yields the baseline scale
$$
\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-283}.
$$
With the working value $A_{\mathrm{eff}}=0.923\pm0.011$, the five-mode reference convention gives $\Lambda L_P^2=(2.88\pm0.03)\times10^{-122}$. This is reference-convention data because Theorem U.8c obstructs the pure-coordinate five-mode tangent in the current Definition U.4 action. Under the Definition U.6 four-mode false-vacuum branch, Theorem U.13b fixes $\kappa=142$ and the forward expression is $\Lambda_4L_P^2=8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284}$. The exact closed multiplier is $8\pi e^{-284}=1.1497594801473928\times10^{-122}$, so an accepted interval $I_A$ for $A_{\mathrm{eff}}^{\mathrm{Fred},4}$ gives the interval $(1.1497594801473928\times10^{-122})I_A$. Substituting the five-mode working prefactor is only a same-number reference check and has no theorem-level four-mode status. Theorem U.73f records the current forward value as $\varnothing_{\mathrm{cert}}$ until all entries of $\mathfrak F_U^{(4)}$ are accepted on the same four-mode branch. Inverting the observed value gives $A_{\mathrm{eff}}^{(\mathrm{obs})}=0.917\pm0.016$ on the five-mode reference convention and $A_{\mathrm{eff}}^{(\mathrm{obs},4)}=2.49\pm0.04$ on the four-mode exponent branch; both are observational inversions rather than Fredholm evaluations.

**Primordial Sector.** On the complete special leading comparison branch enumerated in Theorem U.69, with $A_Q=1$, $N_e=59.4$, the displayed branch values for the harmonic-rank and Hopf-Rayleigh records, the linear scalaron map, the Starobinsky truncation, $\phi_0=\phi_{\max}$, and the stated trans-horizon quotient, the complexity $\kappa_Q=11$ yields the following branch-comparison values:

| Observable | Prediction | Observed |
|:-----------|:----------:|:--------:|
| $Q$ | $1.18 \times 10^{-5}$ | $\sim 10^{-5}$ |
| $n_s$ | $0.9663$ | $0.9649 \pm 0.0042$ |
| $r$ | $0.0034$ | $< 0.036$ |
| $A_s$ | $2.08 \times 10^{-9}$ | $(2.10 \pm 0.03) \times 10^{-9}$ |
| $A_s r$ | $7.07\times10^{-12}$ on the leading $A_Q=1$ branch | tensor measurement pending |

**Structural Unity.** Both sectors derive from the Golay code $[24, 12, 8]$:

| Sector | Configuration Space | $\kappa$ | Suppression |
|:-------|:-------------------:|:--------:|:-----------:|
| Vacuum | $\text{Gr}_\mathbb{C}(12,24)$ | $\kappa_{\Lambda,\mathrm{ref}} = 141.5$ on the five-mode reference branch; $\kappa_{\Lambda,\mathrm{trans}} = 142$ on the four-mode branch of Theorem U.13b | $e^{-283}$ on the five-mode reference branch; $e^{-284}$ on the four-mode branch of Theorem U.13b |
| Primordial | $\mathbb{CP}^{11}$ | $11$ | $e^{-22}$ |

The ratio $\kappa_{\Lambda,\mathrm{ref}}/\kappa_Q \approx 13$ summarizes the hierarchy between vacuum energy and primordial perturbations in the Appendix U reference scheme, while under the hypotheses of Theorem U.13b the corresponding four-mode branch ratio is $\kappa_{\Lambda,\mathrm{trans}}/\kappa_Q \approx 13$.

**Falsifiability.** The special-leading-branch comparison tuple is testable by CMB-S4 and LiteBIRD through the quantitative windows stated in Theorem U.69.

The displayed primordial values are conditional on the full determinant, harmonic-rank, kinetic-normalization, scalaron-map, local-equilibrium truncation, e-fold registration, initial-field, and trans-horizon branch data of Definition U.69a. Theorem U.69b assigns $\mathcal R_{\mathrm{prim}}=\varnothing_{\mathrm{cert}}$ until an accepted $\mathfrak P_{\mathrm{prim}}$ is entered. The vacuum sector fixes a leading-order reference exponent from the Grassmannian structure and spherical 5-design, while the overall normalization remains encoded in the stated Appendix U prefactor convention for $A_{\text{eff}}$.

---