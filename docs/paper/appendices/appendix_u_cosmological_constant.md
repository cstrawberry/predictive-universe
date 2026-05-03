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

This appendix derives the Grassmannian base count and the primordial complexity $\kappa_Q = 11$ from the stated geometric inputs. The vacuum value $\kappa_{\mathrm{ref}} = 141.5$ is the Appendix U reference exponent under the leading-order five-mode counting convention introduced in Theorems U.15-U.16. Theorem U.8c below shows that the pure-coordinate dilatation tangent is a strict negative mode of the current Definition U.4 continuum action, so the five-mode branch remains a reference convention rather than a theorem-level vacuum closure inside the present continuum setup. Theorem U.13 proves, under its sampled-sector exactness hypothesis, that the sampled translation+dilatation restriction of the discrete Hessian has no fifth zero mode. Proposition U.13a and Corollary U.13a.1 then identify the exact sampled angular spectrum, and Theorem U.13b closes the corrected full discrete problem under the explicit false-vacuum spectral hypotheses stated there. Within those hypotheses the corresponding four-mode branch value is $\kappa = 142$.

---

## U.2 Framework Constants

The following constants are derived elsewhere in the framework:

| Symbol | Value | Definition | Source |
|--------|-------|------------|--------|
| $\varepsilon_0$ | $\ln 2$ | Structural SPAP/Landauer quotient | Theorem 31 |
| $\varepsilon_{\mathrm{phys}}$ | $\ge\varepsilon_0$ | Physical implementation cost including overhead | Theorem 31 |
| $K_0$ | 3 | Minimal self-referential bits | Theorem 15 |
| $d_0$ | $2^{K_0} = 8$ | MPU Hilbert space dimension | Theorem 23 |
| $a$ | minimal integer with $\ln a\ge\varepsilon_0$, hence $2$ | Active kernel dimension | Theorem Z.1 |
| $b$ | $d_0 - a = 6$ | Inactive subspace dimension | Definition |
| $M$ | $2ab = 24$ | Interface modes | Theorem Z.5 |
| $D$ | 4 | Emergent spacetime dimension | Theorem Z.11 |
| $C_{\max}/\varepsilon_0$ | 2 | PCE capacity ratio | Appendix Q |

---

## U.3 The Golay Code and Steiner System

### U.3.1 Code Parameters

The Extended Binary Golay Code $\mathcal{G}_{24}$ is the unique $[n, k, d]$ binary linear code with:

- Length $n = M = 24$
- Dimension $k = 12$
- Minimum distance $d_{\min} = 8 = d_0$

**Theorem U.1 (Golay Uniqueness).** The extended binary Golay code is the unique binary linear code achieving the parameters $[24, 12, 8]$.

*Proof.* This is a classical uniqueness theorem in coding theory; see Pless (1968) and Delsarte & Goethals (1975). Saturation of the Griesmer bound alone does not prove uniqueness, so the classification result must be imported from the coding-theory literature. Within the PU framework, Theorem Z.13 then uses that external uniqueness theorem to single out the Golay structure once the $[24,12,8]$ parameters are fixed. QED

### U.3.2 Octad Structure

The weight-8 codewords of $\mathcal{G}_{24}$ are called **octads**. Each octad is a subset $O \subset \{1, \ldots, 24\}$ with $|O| = 8$.

**Theorem U.2 (Steiner System).** The 759 octads of the Golay code form the Steiner system $S(5, 8, 24)$: any 5 elements of $\{1, \ldots, 24\}$ are contained in exactly one octad.

*Proof.* Classical result; see Cameron & Van Lint (1991). $\square$

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

**Theorem U.3 (Configuration Dimension on the Predictive-Recovery MacWilliams Golay Branch).** On the predictive-recovery MacWilliams Golay branch (Definition Z.13b.0; Theorem Z.13b.0a; Theorem Z.13b; Theorem P.13.12; Theorem R.4.4; Proposition T.1c), the base instanton complexity equals the complex dimension of the Grassmannian:

$$\kappa_0 = \dim_{\mathbb{C}}(\text{Gr}_{\mathbb{C}}(12, 24)) = k(M - k) = 12 \times 12 = 144$$

where:
- $M = 24$ is the QFI mode count (Theorem Z.5)
- $k = 12$ is the Golay code dimension fixed by the predictive-recovery MacWilliams gate (Definition Z.13b.0 and Theorem Z.13b.0a). Off this branch, $\kappa_0 = k(M-k)$ would shift: $k = 11$ gives $\kappa_0 = 143$, $k = 10$ gives $\kappa_0 = 140$, with corresponding shifts in the cosmological constant exponent $e^{-2\kappa_\Lambda}$.
- $M = 24$ is the number of interface modes (Theorem Z.5)
- $\text{Gr}_{\mathbb{C}}(12, 24)$ is the Grassmannian of 12-dimensional complex subspaces of $\mathbb{C}^{24}$, the $M$-mode Hilbert space

*Proof.* Standard differential geometry. The complex Grassmannian $\text{Gr}_{\mathbb{C}}(k, n)$ is a complex manifold of complex dimension $k(n-k)$. $\square$

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
Equivalently, if $Q(u)=u^T A_{oct} u$, then
$$
A_{oct}=(r-\lambda)\left(I-\frac1{24}\mathbf1\mathbf1^T\right).
$$
Hence:
- the Hessian has eigenvalue $0$ on $\text{span}\{\mathbf1\}$ and eigenvalue $2(r-\lambda)=352$ on $\mathbf1^\perp$;
- the quadratic-form operator $A_{oct}$ has eigenvalue $0$ on $\text{span}\{\mathbf1\}$ and eigenvalue $r-\lambda=176$ on $\mathbf1^\perp$.

*Proof.* For each octad $O$, let $b_O\in\mathbb R^{24}$ be its incidence vector and set
$$
c_O:=b_O-\frac{k_{\text{block}}}{24}\mathbf1.
$$
Then
$$
\sum_{i\in O}(u_i-\bar u)=c_O^T u,
$$
so
$$
Q(u)=\sum_{O\in\mathcal O}(c_O^T u)^2
=u^T\left(\sum_{O\in\mathcal O} c_O c_O^T\right)u.
$$
Therefore
$$
A_{oct}=\sum_{O\in\mathcal O} c_O c_O^T,
\qquad
\nabla^2Q(0)=2A_{oct}.
$$
Writing $B$ for the $759\times24$ incidence matrix, the 2-design identity gives
$$
B^T B=(r-\lambda)I+\lambda \mathbf1\mathbf1^T.
$$
Since each point lies in exactly $r$ octads and $bk_{\text{block}}=24r$,
$$
A_{oct}
=
B^T B-\frac{2k_{\text{block}}r}{24}\mathbf1\mathbf1^T+\frac{bk_{\text{block}}^2}{24^2}\mathbf1\mathbf1^T
=
(r-\lambda)\left(I-\frac1{24}\mathbf1\mathbf1^T\right).
$$
The operator $P_{\mathbf1^\perp}=I-\frac1{24}\mathbf1\mathbf1^T$ is the orthogonal projector onto $\mathbf1^\perp$, so it has eigenvalue $0$ on $\text{span}\{\mathbf1\}$ and eigenvalue $1$ on $\mathbf1^\perp$. The two eigenvalue statements follow immediately. $\square$

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
r=\frac{\lambda(v-1)}{k_{\text{block}}-1},
\qquad
r-\lambda=\frac{\lambda(v-k_{\text{block}})}{k_{\text{block}}-1}.
$$
Using the Steiner parameters of $S(5,8,24)$ gives
$$
r-\lambda=\frac{253(24-8)}{23}=\frac{253\cdot16}{23}=176.
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

**Step 1 (Interface mode count).** From Theorem Z.5, the QFI-active interface modes number $M = 2ab = 24$, where $a = 2$ (Theorem Z.1) and $b = d_0 - a = 6$.

**Step 2 (Equilibrium saturation).** At PCE equal-cap equilibrium, Theorem Z.9 establishes that the channel configuration maximizes entropy subject to distinguishability constraints, yielding $M_{\text{phys}} = K(D)$.

**Step 3 (Mode-channel correspondence).** Theorem Z.10 requires $M_{\text{int}} = M_{\text{phys}}$ at PCE-optimal equilibrium. This matching is the unique global minimum of the PCE potential (Lemma Z.5).

**Step 4 (Dimensional selection).** Theorem Z.11 establishes that $K(D) = 24$ uniquely selects $D = 4$, since $K(4) = 24$ is the only integer solution.

**Step 5 (Geometric realization).** By Definition Z.8, fix the standard 24-point configuration on $S^3$ given by the unit Hurwitz integers. This configuration realizes the optimal kissing count $K(4)=24$ and provides a concrete 24-point geometric model for the mode-channel correspondence.

**Step 6 (Spherical design property).** The same 24 points form a spherical 5-design on $S^3$ (Theorem U.7; verified explicitly in Theorem U.30). The correspondence established here is structural rather than a proved literal bijection of geometric objects: both sides contribute the same cardinality $24$, the same four-dimensional channel-counting data, and the spherical-design exactness needed for the zero-mode argument of Theorem U.13. These are the only 24-cell facts used later; no stronger uniqueness or rigidity statement at the level of 24-point spherical 5-designs is invoked. $\square$

**Remark U.2: Nature of the Correspondence.** The mode-vertex correspondence established in Theorem U.7b is structural rather than literal: the 24 QFI-active interface modes span the real tangent space $T_{x_0}\text{Gr}(2,8) \cong \text{Hom}(\mathbb{C}^2, \mathbb{C}^6)_{\mathbb{R}}$, a 24-dimensional real vector space (complex dimension 12), while the 24-cell vertices span $\mathbb{R}^4$. The correspondence identifies the combinatorial and symmetry structures of these two 24-element sets, enabling the transfer of spherical design properties to the discretized action. This is analogous to how the Golay code organizes the same 24 modes for error correction (Theorem Z.13) without the modes literally being binary codewords.

**Theorem U.7a (Golay-Grassmannian Correspondence).** The PCE-Attractor orbit $\text{Gr}(2,8)$ encodes the Golay code parameters through dimensional correspondence:
- Real dimension: $\dim_{\mathbb{R}}(\text{Gr}(2,8)) = 2ab = 24 = n$ (code length)
- Complex dimension: $\dim_{\mathbb{C}}(\text{Gr}(2,8)) = ab = 12 = k$ (code dimension)
- Hilbert space dimension: $d_0 = a + b = 8 = d$ (minimum distance)

The Golay parameters $[n, k, d] = [24, 12, 8]$ are thus geometrically determined by the attractor structure. The equality $d_0 = d$ is a consequence of the specific partition $(a,b) = (2,6)$ selected by Landauer constraints (Theorem Z.1), representing a structural consistency rather than a general property of Grassmannian-code correspondences.


---

## U.7 Instanton Zero Modes

### U.7.1 Continuum Instanton Structure

Consider a Euclidean O(4)-invariant action functional $S_{\text{cont}}[\phi]$ on fields $\phi: \mathbb{R}^4 \to \mathbb{R}$.

**Definition U.3 (Bounce Solution).** An **O(4)-symmetric bounce** $\phi^*$ is a non-trivial finite-action solution depending only on $|x|$.

**Theorem U.8 (Translation Zero Modes).** By translation invariance of $S_{\text{cont}}$, the functional is constant along the 4-parameter family:

$$\phi^*_a(x) = \phi^*(x - a), \quad a \in \mathbb{R}^4$$

The second variation $D^2 S_{\text{cont}}(\phi^*)$ annihilates the tangent vectors:

$$\frac{\partial \phi^*_a}{\partial a_\mu}\bigg|_{a=0} = -\partial_\mu \phi^*$$

*Proof.* Standard Noether argument. Translation invariance implies $S_{\text{cont}}[\phi^*_a] = S_{\text{cont}}[\phi^*]$ for all $a$. Differentiating twice at $a = 0$ gives the null condition. $\square$

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

**Theorem U.8d (Persistence of a Negative Pure-Dilatation Direction).** Let $\eta\mapsto S_\eta$ be a $C^1$ family of local Euclidean actions on a common Hessian form domain, with corresponding non-trivial finite-action critical points $\phi^*_\eta$ depending continuously on $\eta$. Let
$$
s_\eta(x) \;:=\; x^\mu\,\partial_\mu\phi^*_\eta(x)
$$
denote the pure-coordinate dilatation tangent and $H_\eta:=D^2 S_\eta(\phi^*_\eta)$ the Hessian. Suppose that at $\eta=0$ one has
$$
\langle s_0,\,H_0\,s_0\rangle \;<\; 0.
$$
Then there exists $\delta>0$ such that for all $|\eta|<\delta$,
$$
\langle s_\eta,\,H_\eta\,s_\eta\rangle \;<\; 0.\tag{U.8d}
$$

*Proof.* Continuity of $\eta\mapsto S_\eta$ and $\eta\mapsto\phi^*_\eta$ on the common Hessian form domain gives continuity of
$$
Q(\eta):=\langle s_\eta,H_\eta s_\eta\rangle.
$$
Since $Q(0)<0$, continuity implies the existence of $\delta>0$ such that $Q(\eta)<0$ for all $|\eta|<\delta$. ∎

**Corollary U.8d.1 (Generic Small Deformations Do Not Create a Fifth Zero Mode at the Reference Action).** Under the hypotheses of Theorem U.8d, generic sufficiently small deformations of the reference action do not turn the pure-coordinate dilatation tangent into a zero mode.

*Proof.* Immediate from Theorem U.8d, which keeps the corresponding quadratic form strictly negative throughout a neighborhood of the reference action. ∎

---

## U.8 Design-Preserving Discretization

### U.8.1 Continuum Action Specification

The continuum Euclidean information action for vacuum fluctuations is constructed from the framework's fundamental structures.

**Definition U.4 (Continuum Information Action).** The continuum action $S_{\text{cont}}[\phi]$ for a scalar fluctuation field $\phi:\mathbb{R}^4\to\mathbb{R}$ is

$$
S_{\text{cont}}[\phi] = \frac{1}{\varepsilon_0}\int_{\mathbb{R}^4} d^4x \left[\frac{1}{2}|\nabla \phi|^2 + V_{\text{eff}}(\phi) - V_{\text{eff}}(0)\right]
$$

where $\varepsilon_0 = \ln 2$ is the structural SPAP/Landauer cost (Theorem 31). For an $O(4)$-symmetric profile $\phi(x)=\varphi(r)$ with $r=|x|$, this is equivalently

$$
S_{\text{cont}}[\varphi] = \frac{1}{\varepsilon_0}\int_0^\infty r^3 dr \int_{S^3} d\sigma_3 \left[\frac{1}{2}(\partial_r \varphi)^2 + \frac{1}{2r^2}|\nabla_{S^3}\varphi|^2 + V_{\text{eff}}(\varphi) - V_{\text{eff}}(0)\right]
$$

where $d\sigma_3$ is the normalized round measure on $S^3$. The subtraction $V_{\text{eff}}(0)$ ensures finite action for vacuum-to-vacuum trajectories.

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

**Lemma U.12 (Hessian Polynomial Degree).** The second variation $D^2 S_{\text{cont}}(\phi^*)$ involves integrands that are polynomials of degree at most 4 in the angular variables.

*Proof.* The second variation is built from:
- First derivatives $\partial_\mu \phi^*$ (degree 1 in angular coordinates)
- Products of two first derivatives (degree 2)
- Second derivatives $\partial_\mu \partial_\nu \phi^*$ (degree 2)
- Potential terms $V''(\phi^*)$ (degree 0)

The maximum total degree is $2 + 2 = 4$. $\square$

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

*Proof.* The weights depend only on the 24-cell inner-product classes, so $L_W$ is real and self-adjoint. An exact rational computation of the resulting $24\times24$ matrix gives the factorized characteristic polynomial above. Because the constant vector is annihilated by every difference operator $f_i-f_j$, it is a zero mode. The factorization then shows that no other zero mode occurs and that every remaining eigenvalue is positive. ∎

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
Thus the full discrete Hessian is the orthogonal direct sum of the radial operators $\mathcal L_\lambda$ attached to the sampled eigenvalues $\lambda\in\{0,3,8,15,24\}$.

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

**Theorem U.14 (Morse-Bott Formula).** Let $f: \mathbb{R}^N \to \mathbb{R}$ be $C^2$ in a neighborhood of a compact critical manifold $\mathcal{C}$ of dimension $m$, assume $f|_{\mathcal{C}} = f^*$ is constant, and assume the Hessian of $f$ restricted to the normal bundle of $\mathcal{C}$ is non-degenerate and positive definite. Then, as $\lambda\to+\infty$,
$$\int_{\mathbb{R}^N} e^{-\lambda f(x)} dx = C \cdot \lambda^{-(N-m)/2} \cdot e^{-\lambda f^*} \cdot (1 + O(\lambda^{-1}))$$
where $C$ depends on the determinant of the normal Hessian and the induced volume of $\mathcal{C}$.

*Proof.* Under the stated smoothness and non-degeneracy hypotheses, this is the standard Morse-Bott Laplace asymptotic obtained by choosing local coordinates $(u,v)$ near $\mathcal C$ with $u$ tangent to $\mathcal C$ and $v$ normal to it, expanding
$$
f(u,v)=f^*+\frac12\langle H_u v,v\rangle + O(\|v\|^3),
$$
and then integrating first in the normal Gaussian directions and then along $\mathcal C$. The compactness of $\mathcal C$ controls the tangential integral, and the positive-definite normal Hessian gives the factor $\lambda^{-(N-m)/2}$ together with the determinant contribution absorbed into $C$. This is the Morse-Bott version of Laplace's method cited from Nicolaescu (2011), and the present statement records exactly the hypotheses needed for that theorem to apply. ∎

### U.9.3 Application to the Vacuum Instanton

Within the Appendix U five-mode reference branch, model the discretized bounce $u^*$ as lying on a critical manifold of dimension $m = 5$ (the collective coordinates). Theorem U.14 then identifies the corresponding leading Morse-Bott zero-mode counting pattern
$$
Z = A_{\mathrm{MB}}(\lambda)\,\lambda^{-(N-5)/2} e^{-\lambda S^*}(1+O(\lambda^{-1})),
$$
where $A_{\mathrm{MB}}(\lambda)$ collects determinant and Jacobian factors, $N$ is the total number of Gaussian directions, and $S^* = S_{\text{disc}}(u^*)$ is the instanton action. In the PU application $\lambda = C_{\max}/\varepsilon_0 = 2$ is fixed rather than taken to $+\infty$, so this formula is used only to identify the zero-mode power $(N-5)/2$ entering the exponent-counting convention below; the omitted $O(\lambda^{-1})$ term is not discarded as a controlled small correction. Theorem U.8c shows that this five-mode count is not realized by the pure-coordinate dilatation direction of the current continuum action.

---

## U.10 Complexity Deficit

### U.10.1 Complexity-Action Correspondence

**Proposition U.14 (Complexity-Action Relation on the Residual-Budget Branch).** On the residual-budget branch of Appendix E (Equation E.14, where the structural SPAP cost $\varepsilon_0$ is subtracted from the total information potential $\ln d_0$ to give the available boundary channel capacity) and Appendix Q (§Q.2.1, Equation Q.10), the instanton action $S_{\text{inst}}$ and complexity $\kappa$ are related by:

$$S_{\text{inst}} = 2\kappa$$

This follows from the residual-budget identity $C_{\max}^*/\varepsilon_0 = 2$, which is itself a consequence of the residual-budget allocation $C_{\max}^* = \ln(d_0) - \varepsilon_0 = 3\ln 2 - \ln 2 = 2\ln 2$. With a general structural capacity ratio $\rho := C_{\max}/\varepsilon_0$, the instanton action is $S_{\text{inst}} = \rho\kappa$ and the cosmological constant prediction $\Lambda \sim e^{-\rho\kappa_\Lambda}$ would shift by $e^{-(\rho-2)\kappa_\Lambda}$ off the residual-budget branch.

**Remark U.14.1: One-Loop Correction via Zeta Regularization.** The one-loop correction to the instanton action is formally computed via the zeta-regularized functional determinant on the attractor orbit $\text{Gr}(2,8)$:

$$\log\det'(-\Delta_{g_B} + \lambda) = -\zeta'_{\mathcal{O}}(0)$$

where $\zeta_{\mathcal{O}}(s) = \sum_{(m_1,m_2) \neq (0,0)} \text{mult}(m_1, m_2) \cdot (\lambda_B(m_1, m_2) + \lambda)^{-s}$ uses the Laplacian eigenvalues on $\text{Gr}(2,8)$ (Helgason 1984). The multiplicities follow from spherical representation theory for the symmetric pair $(U(8), U(2) \times U(6))$. Under $K$-invariance, the mass parameter equals the hierarchy coefficient:

$$\alpha = \frac{1}{16\sigma_B^2} = \frac{1}{16 \cdot (1/24)} = \frac{24}{16} = \frac{3}{2}$$

where $\sigma_B^2 = 1/M = 1/24$ uses the interface-mode count $M=24$ from Theorem Z.5 together with the canonical unit-radius normalization convention of Lemma T.41.2.

*Derivation.* The instanton action scales with complexity as $S_{\text{inst}} = (C_{\max}/\varepsilon_0)\kappa$ (Section U.4). Substituting $C_{\max}/\varepsilon_0 = 2$ yields $S_{\text{inst}} = 2\kappa$.

*Consistency check.* The cosmological constant formula:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-S_{\text{inst}}} = 8\pi A_{\text{eff}} \cdot e^{-2\kappa}$$

Using $\varepsilon_0 = \ln 2$, this can equivalently be written as:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot 2^{-2\kappa/\ln 2} = 8\pi A_{\text{eff}} \cdot 2^{-2\kappa \cdot \log_2 e}$$

The Morse-Bott correction factor $\lambda^{-m/2} = 2^{-m/2}$ (with $\lambda = C_{\max}/\varepsilon_0 = 2$) modifies the effective complexity by reducing the number of contributing Gaussian directions from $\kappa_0$ to $\kappa_0 - m/2$.

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

**Proposition U.15a (One-Loop Determinant).** Let $O = -\Delta_{g_B} + \alpha$ denote the quadratic fluctuation operator on the attractor orbit $\text{Gr}(2,8) \cong U(8)/(U(2) \times U(6))$ (Remark U.14.1). The determinant contribution to the prefactor $K$ appearing in $A_{\text{eff}} := K \cdot N_{\text{eff}}$ (Section U.1) is defined by zeta regularization as:

$$\det{}' O := \exp(-\zeta_\alpha'(0)),$$

so that the Gaussian prefactor is:

$$K := (\det{}' O)^{-1/2} = \exp\left(\frac{1}{2}\zeta_\alpha'(0)\right).$$

Here the spectral zeta function is

$$\zeta_\alpha(s) = \sum_{m_1 \ge m_2 \ge 0}' \text{mult}(m_1,m_2)\,(\lambda_B(m_1,m_2) + \alpha)^{-s},$$

where $\lambda_B(m_1,m_2)$ and $\text{mult}(m_1,m_2)$ are the Laplacian eigenvalues and their multiplicities on $\text{Gr}(2,8)$ (Helgason 1984), the prime excludes $(m_1,m_2) = (0,0)$, and

$$\alpha = \frac{1}{16\sigma_B^2} = \frac{3}{2}$$

as in Remark U.14.1. Since $\dim_{\mathbb{R}}\text{Gr}(2,8) = 24$, $\zeta_\alpha(s)$ converges for $\Re(s) > 12$ and admits meromorphic continuation to $s=0$ via the heat kernel (e.g. Vassilevich 2003).

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

This gives the corresponding reference evaluation

$$
\boxed{\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-2\kappa_{\mathrm{ref}}} = (2.88 \pm 0.03)\times 10^{-122}.}
$$

The agreement between $A_{\text{eff}}^{(\text{obs})}$ and the Appendix U working value is an internal consistency check on the adopted prefactor convention within the five-mode reference branch. By Theorem U.8c, that branch is not a theorem-level consequence of the current Definition U.4 continuum action. ∎

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

**Theorem U.15e (Fredholm Audit of the Dilatation Direction and Vacuum Prefactor).** Let $s_D=x^\mu\partial_\mu\phi^*$ be the pure-coordinate dilatation tangent of Theorem U.8c on a false-vacuum branch admitting a certificate $\mathfrak F_U$. Exactly one of the following holds:

1. $s_D\in\ker\mathcal H_{\mathrm{bounce}}$, so $s_D$ is an exact additional collective coordinate, increasing $m_0$ and contributing to $\Pi_0$ and $\mathcal J_{\mathrm{coll}}$;

2. $s_D\notin\ker\mathcal H_{\mathrm{bounce}}$, so its component in $\ker\mathcal H_{\mathrm{bounce}}^\perp$ is acted on by a nonzero spectral part of $\mathcal H_{\mathrm{bounce}}$ and contributes to $\det{}''_\zeta\mathcal H_{\mathrm{bounce}}$ (with the negative-mode component, if any, captured by $\Pi_-$ and $\mathcal A_{\mathrm{neg}}$);

3. the determinant line, orientation, finite-part convention, or quotient Hessian fails one of conditions (1)–(4) of Definition U.15d, in which case the branch is rejected as a theorem-level vacuum-prefactor branch.

Under the current Definition U.4 continuum action and the false-vacuum hypotheses of Theorem U.13b, item 1 is excluded by Theorem U.8c (the pure-coordinate dilatation tangent is a strict negative mode) and Theorem U.13b (the four-mode discrete branch admits no fifth null direction). Hence the theorem-level four-mode branch acquires a theorem-level forward prefactor only via formula (U.15d.3) on an accepted certificate; the certificate gates this audit but is not itself the audit, which requires evaluation of all factors on the same vacuum branch.

*Proof.* By Definition U.15d condition (1), $\mathcal H_{\mathrm{bounce}}$ is self-adjoint Fredholm with compact resolvent on the PCE-admissible fluctuation space after gauge quotienting; its spectrum is therefore discrete with finite-dimensional kernel and finite-rank negative spectral subspace. Any vector $s_D$ in that space lies either in the kernel or in its orthogonal complement, exhausting the Hilbert-space decomposition. If $s_D\in\ker\mathcal H_{\mathrm{bounce}}$, it is represented in $\Pi_0$ and contributes a collective-coordinate factor to $\mathcal J_{\mathrm{coll}}$ rather than to a determinant ratio (item 1). If $s_D$ has a nonzero component in $\ker\mathcal H_{\mathrm{bounce}}^\perp$, then the spectral part of $\mathcal H_{\mathrm{bounce}}$ on that complement is nonzero and either positive or negative; its contribution is captured by $\det{}''_\zeta\mathcal H_{\mathrm{bounce}}$ and, on the negative spectral subspace, by $\Pi_-$ and $\mathcal A_{\mathrm{neg}}$ (item 2). If conditions (1)–(4) of Definition U.15d fail — orientation undefined, anomaly class nonvanishing, finite-part convention not fixed, or quotient Hessian not Fredholm — formula (U.15d.3) is not a scalar branch output and the branch is rejected (item 3).

Theorem U.8c proves that the pure-coordinate dilatation tangent is a strict negative eigenvector of the current Definition U.4 continuum Hessian, hence $s_D\notin\ker\mathcal H_{\mathrm{bounce}}$. Theorem U.13b supplies the corresponding full-discrete four-mode false-vacuum closure under its stated spectral hypotheses with no fifth null direction; thus item 1 is excluded on the current theorem-level branch, and the certificate routes every contribution of $s_D$ through $\Pi_-$, $\mathcal A_{\mathrm{neg}}$, and $\det{}''_\zeta\mathcal H_{\mathrm{bounce}}$ as in item 2. ∎

**Corollary U.15f (No Prefactor Promotion without a Fredholm Audit).** The observational inversions $A_{\mathrm{eff}}^{(\mathrm{obs})}$ and $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$ remain observational inversions, and the Appendix U working value $A_{\mathrm{eff}}=0.923\pm0.011$ remains a forward-evaluation convention (Corollary U.15b, Proposition U.15c), unless an accepted certificate $\mathfrak F_U$ supplies a forward $A_{\mathrm{eff}}^{\mathrm{Fred}}$ via (U.15d.3) with all of $\mathcal J_{\mathrm{coll}}$, $|\mathcal A_{\mathrm{neg}}|$, $\mathcal A_{\mathrm{ghost}}$, $\mathcal A_{\mathrm{fv}}$, $\mathcal A_{\mathrm{meas}}$, $\det{}'_\zeta\mathcal H_{\mathrm{false}}$, and $|\det{}''_\zeta\mathcal H_{\mathrm{bounce}}|$ evaluated on the same vacuum branch and finite-part convention. The certificate machinery defines what would constitute a theorem-level forward prefactor; performing the audit is a separate calculation whose result may agree with, refute, or replace the working value.

*Proof.* Combine Theorem U.15e (which gates the audit on an accepted certificate) with Proposition U.15c (which records that the working value and observational inversions are not theorem-level prefactors). Without the seven explicit factors evaluated on a common branch, formula (U.15d.3) is not instantiated and no scalar prefactor is determined by PU vacuum dynamics. ∎

**Definition U.15f.1 (Four-Mode Fredholm Interval Audit).** A four-mode Fredholm interval audit for the corrected Appendix U branch is a finite record
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

**Theorem U.15f.2 (Four-Mode Fredholm Prefactor Interval).** An accepted $\mathfrak I_U^{(4)}$ determines a forward four-mode prefactor interval
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

**Corollary U.15f.3 (No Four-Mode $\Lambda$ Refit).** Once $\mathfrak I_U^{(4)}$ is accepted, the four-mode $\Lambda$ interval is fixed by (U.15f.5). Changing any determinant endpoint, ghost factor, collective-coordinate Jacobian, volume/extensivity factor, measure normalization, or finite-part scale after comparison defines a new Fredholm branch and cannot confirm the original four-mode interval.

*Proof.* Each listed item is an entry of $\mathfrak I_U^{(4)}$. The forward-lock condition $\chi_U$ forbids choosing it from $\Lambda_{\mathrm{obs}}$. A post-comparison change changes the finite record and therefore changes the branch. ∎

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
The Appendix U working convention $A_{\mathrm{eff}}=0.923\pm0.011$ corresponds to
$$
\Xi_{\perp}^{(\mathrm{work})}
=A_{EW}A_{\mathrm{eff}}
=1.0005\pm0.0128.
\tag{U.15j.6}
$$
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

**Remark U.15d.0 (Anchor to the Global Ledger).** Definition U.15d together with Theorem U.15e supplies the local strict PPI/PCE certificate of the cosmological constant prefactor row in Convention P.14.1k. Corollary U.15f forbids promotion without the audit, and Theorem U.15l blocks four-mode prefactor promotion without the Fredholm record. The combination of an accepted $\mathfrak F_U$ filling each item of Definition U.15d, or an accepted four-mode interval audit $\mathfrak I_U^{(4)}$ in the sense of Definition U.15f.1, closes the row by Theorem D.8.9b.

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

**Theorem U.15m.1 (No Cosmological-Prefactor Promotion without the Fredholm Gate).** The four-mode cosmological-constant prefactor row is closed if Definition U.15m is satisfied. Without the full gate, the exponent row may retain its stated status, but the prefactor row remains certificate-pending.

*Proof.* Equation (U.15m.1) is exactly the four-mode specialization of the Fredholm prefactor formula (U.15d.3). If the entries are accepted on one branch and finite-part convention, the prefactor is fixed and Theorem D.8.9b applies. If any input entry is missing, two completions can agree on the exponent and all parent rows while differing in the determinant ratio, collective-coordinate Jacobian, zero-mode quotient, negative-mode prescription, ghost factor, finite-volume/extensivity factor, measure normalization, or finite-part scale. Theorem P.14.1f gives non-identifiability of $A_{\mathrm{eff}}^{(4)}$, and Convention P.14.1l forbids promotion. ∎

**PPI mapping chain (vacuum weight).** The identification
$$
\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-2\kappa_{\mathrm{ref}}}
$$
uses the following explicit instantiation steps:

1. **Grassmannian identification.** The Appendix U vacuum model uses $\text{Gr}_\mathbb{C}(12,24)$ as the relevant reference configuration space (Theorem U.3), so the base count is $k^2=144$ with $k=12$.

2. **Action mapping.** The instanton action is identified as $S_{\text{inst}}=(C_{\max}^*/\varepsilon_0)\kappa$ with the operating-point value $C_{\max}^*/\varepsilon_0=2$ (Appendix Q). Within the Appendix U reference scheme this gives $S_{\text{inst}}=2\kappa_{\mathrm{ref}}$. The mapping is structural on the residual-budget branch but inherits the certificate status of the zero-mode, determinant, and finite-record ledgers named in Convention P.14.1h.

3. **Einstein-normalization factor.** The PPI mapping identifies the vacuum amplitude with the coefficient of $g_{\mu\nu}$ in the Einstein-equation convention $G_{\mu\nu}+\Lambda g_{\mu\nu}=8\pi G T_{\mu\nu}$. Accordingly, when the result is written as the dimensionless quantity $\Lambda L_P^2$, a pure numerical factor $8\pi$ appears (Appendix V, normalization note following Equation (V.2)).

4. **Prefactor definition and scope.** $A_{\text{eff}}:=K\cdot N_{\text{eff}}$ absorbs all power-law factors from determinants, Jacobians, gauge-volume normalizations, and extensivity counting (Proposition U.15a and Convention U.14a). Different regularization choices reshuffle finite terms inside $A_{\text{eff}}$ but do not change the exponential factor.

5. **Competing saddles are suppressed.** Any additional bounce with complexity $\kappa'=\kappa_{\mathrm{ref}}+\Delta\kappa$ contributes at relative weight $e^{-2\Delta\kappa}$ compared to the dominant reference saddle. Because the Appendix U reference count is half-integer spaced, the nearest competitor has $\Delta\kappa\ge 0.5$ and changes only the $O(1)$ prefactor scale.

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
- The base complexity $k^2 = 144$ is the Grassmannian bound (Theorem U.3)
- The deficit $(D+1)/2 = 5/2$ is the leading-order zero-mode deficit supplied by Theorem U.15

This theorem records the Appendix U reference exponent only within the stated leading-order counting convention; it does not assert that the five-mode count has already been established as an unconditional property of the continuum Hessian.

**Theorem U.16a (Exact Complexity Dichotomy with a Zero-Mode Indicator).** Assume the Morse–Bott hypotheses hold with critical-manifold dimension $m=4+\nu$, $\nu\in\{0,1\}$, where $\nu=1$ only if the exact-scale-family hypothesis of Theorem U.9 holds. Then the instanton complexity is
$$
\kappa \;=\; \frac{N_{\mathbb R}-(4+\nu)}{2} \;=\; 142 - \frac{\nu}{2}, \qquad N_{\mathbb R}=288.
$$
Hence the two exact branches are
$$
\nu=0:\;\kappa=142,\quad e^{-2\kappa}=e^{-284};\qquad \nu=1:\;\kappa=141.5,\quad e^{-2\kappa}=e^{-283}.
$$
The current reference value $\kappa_{\mathrm{ref}}=141.5$ of Theorem U.16 is therefore exact on the $\nu=1$ branch and a leading-order reference-counting convention on the $\nu=0$ branch.

*Proof.* Apply the Morse–Bott deficit formula $\kappa=(N_{\mathbb R}-m)/2$ with $N_{\mathbb R}=288$ and $m=4+\nu$. For $\nu=0$, $\kappa=(288-4)/2=142$ and $2\kappa=284$. For $\nu=1$, $\kappa=(288-5)/2=141.5$ and $2\kappa=283$. ∎ Theorem U.8c strengthens this status statement: within the current Definition U.4 continuum action class, the pure-coordinate dilatation tangent is a strict negative mode rather than a zero mode.

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
- Holding the same prefactor fixed on the translational branch $m=4$ gives
  $$
  \Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-284} = (1.06 \pm 0.01)\times 10^{-122}.
  $$

The observed value $\Lambda L_P^2 = (2.86599 \pm 0.04849) \times 10^{-122}$ (Appendix V, Equation (V.5)) implies $A_{\text{eff}}^{(\text{obs})} = 0.917 \pm 0.016$ on the five-mode reference branch, while the translational branch would require
$$A_{\text{eff}}^{(\text{obs},4)} := \frac{\Lambda L_P^2}{8\pi e^{-284}} = 2.49 \pm 0.04.$$

**Corollary U.17a (Conditional Four-Mode Forward-Evaluation Branch).** If the full false-vacuum spectral problem has no zero modes beyond the four translational modes of Theorem U.8, then
$$
m_{\mathrm{vac}} \;=\; 4,\qquad \kappa_{\mathrm{vac}} \;=\; 142,
$$
and therefore
$$
\Lambda L_P^2 \;=\; 8\pi\,A_{\mathrm{eff}}\,e^{-284}.\tag{U.17a}
$$
With the Appendix U working prefactor $A_{\mathrm{eff}}=0.923\pm 0.011$, this forward evaluation gives
$$
\Lambda L_P^2 \;=\; (1.06\pm 0.01)\times 10^{-122},
$$
and the corresponding observational inversion is $A_{\mathrm{eff}}^{(\mathrm{obs},4)}=\Lambda L_P^2/(8\pi e^{-284})=2.49\pm 0.04$.

*Proof.* Under the stated spectral hypothesis one has $\nu=0$ in Theorem U.16a, hence $\kappa_{\mathrm{vac}}=142$. Substituting this exponent into the Appendix U vacuum formula gives (U.17a). The numerical value and inversion formula are algebraic consequences of that substitution. ∎

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
| $\Lambda L_P^2 = 8\pi A_{\mathrm{eff}}e^{-284}$ | four-mode forward evaluation | Branch theorem / Convention | ReferenceConvention | T1+T2 at fixed branch; no theorem-level numerical value until $A_{\mathrm{eff}}^{(4)}$ is certified |
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

If scale invariance is explicitly broken at the PCE attractor, the dilatation mode acquires a mass and ceases to be a zero mode. Then:

- $m = D = 4$ (translations only)
- $\delta = D/2 = 2$
- $\kappa = 144 - 2 = 142$
- $\Lambda$ decreases by factor $e^{2\times 0.5}=e\approx 2.72$

This provides a testable prediction: small explicit scale breaking shifts $\kappa$ by $0.5$ and decreases $\Lambda$ by factor $e$.

### U.13.2 Dimension Dependence

For general emergent dimension $D'$:

- Translational branch count: $m_{\mathrm{trans}} = D'$; for $D=4$ the corrected full discrete closure is Theorem U.13b under the explicit false-vacuum spectral hypotheses stated there, while other dimensions would require the corresponding discrete spectral proof
- A further dilatation mode would require an additional exact-scale-family hypothesis of the type isolated in Theorem U.9
- Deficit: $\delta = m/2$
- Requires $M = K(D')$ (mode-channel correspondence, Theorem Z.10) and existence of appropriate spherical design

For $D = 4$ (Theorem Z.11): the 24-cell realizes the optimal kissing configuration $K(4)=24$ and furnishes the spherical 5-design exactness used in Appendix U. This locks the mode-channel correspondence at the level of cardinality, dimension, and quadrature input. Theorem U.8c shows that this design-exactness does not by itself create a fifth pure-coordinate dilatation zero mode in the current continuum action.

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
$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-284} = (1.06 \pm 0.01)\times 10^{-122},$$
so matching the observed $\Lambda L_P^2 = (2.86599 \pm 0.04849)\times 10^{-122}$ (Appendix V, Eq. (V.5)) on that branch would require $A_{\text{eff}}^{(\text{obs},4)} = 2.49 \pm 0.04$.

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

*Proof.* Standard: $\dim_\mathbb{C}(\mathbb{CP}^n) = n$ for the complex projective space of dimension $n$. $\square$

**Remark U.19a: Dimension Comparison.** The vacuum Grassmannian has:

$$\dim_\mathbb{C}(\text{Gr}_\mathbb{C}(12,24)) = 12 \times (24-12) = 144$$

The ratio of configuration space dimensions is:

$$\frac{\dim_\mathbb{C}(\text{Gr}_\mathbb{C}(12,24))}{\dim_\mathbb{C}(\mathbb{CP}^{11})} = \frac{144}{11} \approx 13.1$$

### U.16.2 Complexity Exponent

**Identification U.20 (Primordial Complexity on the Predictive-Recovery MacWilliams Golay Branch).** Following Convention U.14a and the structural correspondence between configuration space dimension and instanton complexity, on the predictive-recovery MacWilliams Golay branch (Definition U.18) the primordial complexity parameter is identified with the complex dimension of the configuration space:

$$\boxed{\kappa_Q = \dim_\mathbb{C}(\mathbb{CP}^{11}) = 11 \quad \text{(on the predictive-recovery MacWilliams Golay branch)}}$$

A unit shift $k \to k - 1$ off the balanced branch would give $\kappa_Q = k - 1 \to k - 2$, rescaling $Q \sim e^{-\kappa_Q}$ by a factor of $e \approx 2.7$.

*Justification.* By Convention U.14a, the instanton complexity parameter counts the effective number of complex normal directions contributing to the exponential suppression. For the primordial sector on $\mathbb{CP}^{11}$, we identify $\kappa_Q$ with the complex dimension $11$. We assume no additional continuous zero modes beyond gauge redundancies; if collective modes analogous to translations or dilatations were present, they would reduce $\kappa_Q$ as in the vacuum sector ($\kappa_\Lambda = 144 - 2.5$). This identification is consistent with the framework but constitutes an assumption requiring future verification. $\square$

**Corollary U.20a (Complexity Ratio).**

$$\frac{\kappa_{\Lambda,\mathrm{ref}}}{\kappa_Q} = \frac{141.5}{11} \approx 12.86, \qquad \frac{\kappa_{\Lambda,\mathrm{trans}}}{\kappa_Q} = \frac{142}{11} \approx 12.91$$

Under the Appendix U reference-exponent conventions of Theorem U.16 and Identification U.20, the first ratio summarizes the five-mode reference hierarchy between the vacuum branch and primordial perturbations. The second ratio is the corresponding four-mode branch value under the corrected Definition U.6 normalization and the explicit false-vacuum spectral hypotheses of Theorem U.13b. Theorem U.8c excludes the pure-coordinate dilatation zero mode in the current continuum action, and Theorem U.13 shows under its sampled-sector exactness hypothesis that the sampled translation+dilatation restriction of the discrete Hessian has no fifth zero mode.

### U.16.3 Bundle Structure

**Proposition U.21 (Hopf Fibration).** The primordial configuration space $\mathbb{CP}^{11}$ admits the Hopf fibration:

$$S^1 \hookrightarrow S^{23} \xrightarrow{\pi} \mathbb{CP}^{11}$$

where $S^{23} \subset \mathbb{C}^{12}$ is the unit sphere and $\pi$ is the quotient by phase rotations. The Fubini-Study metric $g_{FS}$ on $\mathbb{CP}^{11}$ is induced from the round metric on $S^{23}$ via the Riemannian submersion $\pi$.

*Proof.* Standard differential geometry; see Kobayashi & Nomizu (1969), Vol. II, Chapter IX. $\square$

---

## U.17 Primordial Perturbation Amplitude

### U.17.1 Semiclassical Suppression

**Corollary U.22 (Exponential Suppression).** By Proposition U.14 (complexity-action correspondence) with $S_{\text{inst}} = 2\kappa$:

$$Q^2 \propto e^{-2\kappa_Q} = e^{-22}$$

*Derivation.* The instanton action for primordial fluctuations is $S_{\text{inst}} = 2\kappa_Q = 22$ (Proposition U.14). The semiclassical probability amplitude scales as $e^{-S_{\text{inst}}/2}$, giving $Q \propto e^{-\kappa_Q}$. $\square$

### U.17.2 Reality Projection

**Lemma U.23 (Complex Gaussian Real-Part Variance).** Let $Z = X + iY$ be a circularly symmetric complex Gaussian variable with $\mathbb{E}[|Z|^2] = \sigma^2$. Then:

$$\text{Var}(X) = \text{Var}(Y) = \frac{\sigma^2}{2}$$

*Proof.* Circular symmetry implies $X$ and $Y$ are independent with equal variance. From $\mathbb{E}[|Z|^2] = \text{Var}(X) + \text{Var}(Y) = 2\text{Var}(X) = \sigma^2$, we obtain $\text{Var}(X) = \sigma^2/2$. $\square$

**Corollary U.24 (Primordial Amplitude Formula).** Physical observables (curvature perturbations) correspond to real scalar fields, obtained by projecting circularly symmetric complex amplitudes onto their real parts. Combining with Corollary U.22:

$$Q^2 = \frac{1}{2} e^{-2\kappa_Q} \cdot A_Q$$

where $A_Q$ is the one-loop prefactor from Gaussian fluctuations.

*Remark.* The factor $1/2$ arises from the reality projection (Lemma U.23). The identification of observable perturbations with real projections follows from the requirement that physical curvature perturbations be real-valued scalar fields.

### U.17.3 One-Loop Prefactor

**Definition U.25 (Spectral Zeta Function).** For a positive elliptic operator $\Delta$ on a compact Riemannian manifold, the spectral zeta function is:

$$\zeta_\Delta(s) = \sum_{\lambda_j > 0} \lambda_j^{-s}, \qquad \text{Re}(s) > \dim(M)/2$$

The zeta-regularized determinant is $\det'(\Delta) := e^{-\zeta'_\Delta(0)}$.

**Theorem U.25a (Laplacian Spectrum on $\mathbb{CP}^n$).** For the scalar Laplacian on $\mathbb{CP}^n$ with the Fubini-Study metric normalized so that the holomorphic sectional curvature equals $4$, the eigenvalues are:

$$\lambda_\ell = 4\ell(\ell + n), \qquad \ell = 0, 1, 2, \ldots$$

with multiplicities:

$$m_\ell = \binom{n+\ell}{n}^2 - \binom{n+\ell-1}{n}^2$$

*Proof.* See Berger, Gauduchon & Mazet (1971), §III; also Ikeda & Taniguchi (1978) with normalization adjusted to holomorphic sectional curvature $4$. $\square$

*Remark: Normalization Convention.* The eigenvalue factor $4$ corresponds to the Fubini-Study metric with holomorphic sectional curvature $4$ and diameter $\pi/2$. Alternative normalizations (e.g., holomorphic sectional curvature $1$) yield eigenvalues $\lambda_\ell = \ell(\ell + n)$.

**Assumption U.26 (One-Loop Prefactor Scaling).** Following Convention U.14a, the leading one-loop prefactor branch for the $\mathbb{CP}^{11}$ configuration space is

$$A_Q = 1 + O(1/\kappa_Q)$$

with $\log A_Q = O(1/\kappa_Q)$ on compact Kähler symmetric spaces of large dimension. For $\kappa_Q = 11$, the correction is $O(9\%)$, contributing $O(4.5\%)$ to $Q$.

*Justification.* On compact symmetric spaces, the spectral zeta function at $s = 0$ admits asymptotic expansions in inverse dimension. For Kähler manifolds, the leading behavior of $\zeta'(0)$ is controlled by curvature invariants that scale with dimension. At large $\kappa$, the prefactor approaches unity; see Voros (1987) for general spectral asymptotics and Vassilevich (2003) for heat kernel methods on symmetric spaces. Following Convention U.14a, we absorb subleading corrections into the $O(1)$ uncertainty of $A_Q$ unless the determinant certificate below is supplied.

**Definition U.26b (Primordial $\mathbb{CP}^{11}$ Determinant Certificate).** A primordial determinant certificate is a finite record
$$
\mathfrak D_Q
=
\left(
\mathcal O_Q,
m_Q^2,
\zeta_Q,
\mathcal J_Q,
\mu_Q
\right)
\tag{U.26b.1}
$$
where:

1. the retained one-loop fluctuation operator is
$$
\mathcal O_Q=-\Delta_{FS}+m_Q^2
\tag{U.26b.2}
$$
on $\mathbb{CP}^{11}$ with the Fubini-Study normalization of Theorem U.25a;

2. $m_Q^2$ is the branch-fixed second-variation mass term of the primordial scalar fluctuation operator;

3. the nonconstant zeta function is
$$
\zeta_Q(s)
=
\sum_{\ell=1}^{\infty}
m_\ell
\left(4\ell(\ell+11)+m_Q^2\right)^{-s},
\tag{U.26b.3}
$$
with
$$
m_\ell=
\binom{11+\ell}{11}^2
-
\binom{10+\ell}{11}^2;
\tag{U.26b.4}
$$

4. $\mathcal J_Q$ is the finite product of the branch-fixed gauge-zero-mode, measure, and quotient Jacobians;

5. the real-part projection factor of Lemma U.23 remains the explicit prefactor $1/2$ in Corollary U.24 and is not absorbed into $A_Q$;

6. the finite-part convention $\mu_Q$ is fixed before comparison with $A_s$, $r$, or $A_s r$.

The determinant prefactor associated with the certificate is
$$
A_Q^{\mathrm{det}}
=
\mathcal J_Q\,
\left(\det{}'_\zeta\mathcal O_Q\right)^{-1/2}
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
\frac{1}{24} \sum_{v \in V_{24}} p(v) = \frac{1}{\text{Vol}(S^3)} \int_{S^3} p(x) \, d\sigma(x)
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

### U.19.2 Weyl Group Action

**Theorem U.35 (Weyl Group Symmetry).** The 24-cell symmetry group is the Weyl group of the exceptional Lie algebra $F_4$:

$$\text{Aut}(V_{24}) = W(F_4), \qquad |W(F_4)| = 1152 = 2^7 \times 3^2$$

*Proof.* Classical result; see Conway & Sloane (1999), Chapter 4, §8. $\square$

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

**Lemma U.43 (Uniqueness of Laplacian Form).** Among quadratic forms on $\mathcal{S}$ that are:
1. $W(F_4)$-invariant
2. Local (depending only on adjacent pairs)
3. Vanishing on constant configurations

the Dirichlet energy $E[\psi] = \frac{1}{2}\psi^\dagger L \psi$ is unique up to overall scale.

*Proof.* Conditions (2) and (3) require the form $\psi^\dagger M \psi$ where $M_{ij} = 0$ for non-adjacent pairs and $\sum_j M_{ij} = 0$. Condition (1) requires $M$ to commute with $W(F_4)$. The graph Laplacian $L = D - A$ is the unique such matrix up to scale. $\square$

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

**Proposition U.45 (Fubini-Study Metric on $\mathbb{CP}^1$).** The Fubini-Study metric on $\mathbb{CP}^1 \cong S^2$ with the standard normalization is:

$$ds^2_{FS} = \frac{1}{4}(d\theta^2 + \sin^2\theta \, d\varphi^2)$$

This describes a 2-sphere of radius $\frac{1}{2}$ and diameter $d_{\max} = \pi/2$.

*Proof.* Standard; see Kobayashi & Nomizu (1969). $\square$

**Definition U.46 (Canonical Inflaton Field).** The canonically normalized inflaton field is:

$$\phi := \sqrt{\lambda^2} \, \bar{M}_{Pl} \cdot d_{FS} = \sqrt{12} \, \bar{M}_{Pl} \cdot d_{FS}$$

**Corollary U.47 (Field Range).** The maximum inflaton field excursion is:

$$\Delta\phi_{\max} = \sqrt{12} \, \bar{M}_{Pl} \cdot \frac{\pi}{2} = \sqrt{3}\pi \, \bar{M}_{Pl} \approx 5.44 \, \bar{M}_{Pl}$$

*Verification.* $\sqrt{3}\pi = 1.732 \times 3.1416 = 5.441$. $\checkmark$

---

## U.22 Einstein-Frame Scalar Dynamics

### U.22.1 Gravitational Sector

**Assumption U.48 (Local Equilibrium Truncation).** At the PCE-Attractor (Definition 15a), the emergent gravitational effective action (Proposition W.20) truncates to:

$$S_{\text{grav}} = \int d^4x \sqrt{-g} \left[ \frac{\bar{M}_{Pl}^2}{2}(R - 2\Lambda) + c_1 R^2 \right]$$

with $c_2 = 0$ (the $R_{\mu\nu}R^{\mu\nu}$ coefficient is assumed suppressed at the attractor).

*Justification.* By Theorem W.19, Einstein dynamics emerge under local thermodynamic equilibrium near causal horizons. By Proposition W.20, deviations from equilibrium induce curvature-squared corrections with coefficients controlled by entropy deficit and non-equilibrium terms. In four dimensions, the independent quadratic invariants are $R^2$, $R_{\mu\nu}R^{\mu\nu}$, and the Gauss-Bonnet combination $R^2 - 4R_{\mu\nu}R^{\mu\nu} + R_{\mu\nu\rho\sigma}R^{\mu\nu\rho\sigma}$ (topological). We assume that at the PCE-Attractor during inflation, viscous (shear) contributions are suppressed, setting $c_2 = 0$ to leading order. The $R^2$ term is assumed to persist. This truncation to the Starobinsky form is motivated by the attractor structure but not rigorously derived; alternative truncations including Weyl-squared terms would modify predictions.

*Remark.* The $c_2 = 0$ condition may also be understood from the Gauss-Bonnet identity in 4D: the combination $R^2 - 4R_{\mu\nu}R^{\mu\nu} + R_{\mu\nu\rho\sigma}R^{\mu\nu\rho\sigma}$ is topological. After suppressing the $R_{\mu\nu}R^{\mu\nu}$ contribution in the local-equilibrium truncation and restricting to the scalar-sector ansatz in Assumption U.48, the remaining curvature-squared term retained here is $R^2$.


**Corollary U.49 (Starobinsky Form).** The gravitational action takes the Starobinsky form:

$$S = \int d^4x \sqrt{-g} \left[ \frac{\bar{M}_{Pl}^2}{2}R + \frac{\bar{M}_{Pl}^2}{12 m_s^2}R^2 \right]$$

where $c_1 = \bar{M}_{Pl}^2/(12 m_s^2)$ defines the scalaron mass $m_s$.

### U.22.2 Einstein Frame Potential

**Theorem U.50 (Starobinsky Potential).** In the Einstein frame, the Starobinsky $R + R^2$ action is equivalent to Einstein gravity coupled to a scalar field $\chi$ with potential:

$$V(\chi) = \frac{3m_s^2 \bar{M}_{Pl}^2}{4}\left(1 - e^{-\sqrt{2/3}\,\chi/\bar{M}_{Pl}}\right)^2$$

*Proof.* Standard Weyl transformation; see Starobinsky (1980), Mukhanov (2005) Chapter 8. $\square$

We identify the canonically normalized Einstein-frame scalar $\chi$ with the canonical field $\phi$ defined in Definition U.46, i.e. $\chi = \phi$. If $\chi = \alpha \phi$ with $\alpha = O(1)$, then $x$ and the geometric e-fold bound rescale accordingly.

### U.22.3 Mass Scale Identification


**Identification U.51 (Scalaron Mass from PPI).** The Principle of Physical Instantiation (Definition P.6.2) requires that the abstract complexity scale $Q$ manifest as a physical mass scale. We identify:

$$\frac{m_s}{\bar{M}_{Pl}} = Q$$

*Justification.* The PPI asserts that information-theoretic quantities must have physical instantiations. The primordial complexity parameter $\kappa_Q = 11$ (Identification U.20) yields $Q = e^{-11}/\sqrt{2}$ (Theorem U.27). The scalaron mass $m_s$ is the characteristic mass scale in the Starobinsky sector. This identification is motivated by dimensional analysis and the requirement that $Q$ control primordial perturbations, but is not uniquely determined by PPI alone. Alternative identifications such as $m_s/\bar{M}_{Pl} = f(Q)$ for some $O(1)$ function $f$ would shift predictions accordingly. The linear identification $m_s = Q \cdot \bar{M}_{Pl}$ is the simplest choice consistent with the exponential suppression structure. By Theorem P.14.1f and Corollary P.14.1g, this identification cannot be promoted to theorem-level by status relabeling or prose alone; theorem-level promotion would require a finite spectral or variational certificate fixing the linear map before comparison with inflationary observables.

**Corollary U.52 (Scalaron Mass Value).**

$$m_s = Q \cdot \bar{M}_{Pl} = 1.181 \times 10^{-5} \times 2.435 \times 10^{18} \text{ GeV} = 2.88 \times 10^{13} \text{ GeV}$$

*Verification.* $1.181 \times 2.435 = 2.876$. $\checkmark$

---

## U.23 E-Fold Bounds

### U.23.1 Information-Theoretic Bound

**Theorem U.53 (Landauer Registration Cost).** Each independent bit of information registered during inflation requires entropy production:

$$\Delta S_{\min} = \ln 2$$

per bit (Theorem 31).

**Lemma U.54 (Capacity-Registration Ratio on the Residual-Budget Branch).** On the residual-budget, throughput-saturated, ideal-packing branch of Appendix Q (§§Q.2.1–Q.5, on which $C_{\max}^* = 2\ln 2$, $\chi^* = 1$, $\eta^* = 1$), the PCE-optimal structural capacity ratio is:

$$\frac{C^*_{\max}}{\varepsilon_0} = \frac{2\ln 2}{\ln 2} = 2$$

This means each structural SPAP registration ($\varepsilon_0 = \ln 2$) supports registration of $C^*_{\max} = 2\ln 2$ nats of channel capacity.

**Lemma U.55 (E-Fold Information Content).** Each e-fold of inflation corresponds to one unit of $\ln k$-space registration, where $k$ is the comoving wavenumber. At leading order in slow-roll:

$$\Delta N_e \approx \Delta \ln k$$

*Proof.* During slow-roll inflation, $k = aH$ where $a$ is the scale factor and $H$ is approximately constant. Thus $\ln k \approx \ln a + \text{const} = N_e + \text{const}$. $\square$

**Assumption U.56 (E-Fold Registration Cost).** Each e-fold registers one independent scalar perturbation mode across the constraint budget. Given Assumption U.41, the total number of registrable e-folds is:

$$N_e^{(\text{info})} = N_{\text{budget}} = 60$$

This is a model-layer registration rule rather than a theorem of the discrete backbone. By Convention P.14.1h, changing this rule defines a different cosmological registration branch and propagates to the inflationary prediction ledger.

*Justification.* The constraint budget $N_{\text{budget}} = 60$ (Assumption U.41) counts independent scalar (binary) registrations available in the primordial sector. We assume that one independent constraint is consumed per e-fold to register distinct horizon-exit conditions, so $N_e^{(\text{info})} \leq N_{\text{budget}}$ and at capacity saturation $N_e^{(\text{info})} = N_{\text{budget}} = 60$. The ratio $C^*_{\max}/\varepsilon_0 = 2$ fixes the structural information content per registration at the PCE optimum but does not increase the number of independent constraints available for mode counting. If the true constraint count differs from 60, $N_e^{(\text{info})}$ scales proportionally.

### U.23.2 Geometric Bound

**Theorem U.58 (Starobinsky E-Fold Formula).** For the Starobinsky potential, the number of e-folds from field value $\chi$ to end of inflation is:

$$N_e(\chi) = \frac{3}{4}\left(e^{\sqrt{2/3}\,\chi/\bar{M}_{Pl}} - \frac{\sqrt{2/3}\,\chi}{\bar{M}_{Pl}}\right) - \frac{3}{4}\left(e^{x_{\text{end}}} - x_{\text{end}}\right)$$

where $x := \sqrt{2/3}\,\chi/\bar{M}_{Pl}$ and inflation ends when $\epsilon = 1$:

$$x_{\text{end}} = \ln\left(1 + \frac{2}{\sqrt{3}}\right) \approx 0.7676$$

*Proof.* Standard slow-roll calculation; see Mukhanov (2005). $\square$

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

### U.24.1 Slow-Roll Parameters

**Theorem U.61 (Slow-Roll Parameters).** For the Starobinsky potential at $N_e$ e-folds before the end of inflation:

$$\epsilon \simeq \frac{3}{4N_e^2}, \qquad \eta \simeq -\frac{1}{N_e}$$

*Proof.* Standard calculation for $V(\chi) \propto (1 - e^{-\sqrt{2/3}\chi/\bar{M}_{Pl}})^2$; see Mukhanov (2005). $\square$

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

**Lemma U.64 (Starobinsky Amplitude Formula).** The scalar power spectrum amplitude is:

$$A_s = \frac{N_e^2}{24\pi^2}\left(\frac{m_s}{\bar{M}_{Pl}}\right)^2 = \frac{N_e^2 Q^2}{24\pi^2}$$

*Proof.* Standard; see Mukhanov (2005), eq. (8.50). $\square$

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

**Theorem U.66 (Local Non-Gaussianity).** For single-field slow-roll inflation:

$$f_{NL}^{\text{local}} = \frac{5}{12}(1 - n_s) = \frac{5}{12} \times \frac{2}{N_e} = \frac{5}{6N_e}$$

With $N_e = 59.4$:

$$\boxed{f_{NL}^{\text{local}} = \frac{5}{6 \times 59.4} = 0.014}$$

*Proof.* Single-field consistency relation; see Maldacena (2003). $\square$

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

The predictions are compared against Planck 2018 results (Planck Collaboration 2020a,b) at pivot scale $k_* = 0.05 \text{ Mpc}^{-1}$:

| Observable | Prediction | Observed | Tension |
|---|---|---|---|
| $n_s$ | $0.9663 \pm 0.0011$ | $0.9649 \pm 0.0042$ | 0.3σ (diagnostic; includes $\Delta N_e$) |
| $r$ | $0.0034 \pm 0.00023$ | <0.032 | consistent |
| $A_s$ | $(2.08 \pm 0.14)\times10^{-9}\, f_{\text{amp}}^2$ | $(2.10 \pm 0.03)\times10^{-9}$ | consistent for $f_{\text{amp}}\approx1$ |
| $A_s r$ | $(7.07 \pm 0.64)\times10^{-12}$ on the $A_Q=1\pm0.09$ branch | tensor measurement pending | product-lock target |
| $f_{NL}$ | $0.0140 \pm 0.0005$ | -0.9 ±5.1 | consistent |
| $dn_s/d\ln k$ | $-(5.7 \pm 0.4)\times10^{-4}$ | -0.0045 ±0.0067 | consistent |

**Sources:**
- $n_s$, $A_s$, $dn_s/d\ln k$: Planck Collaboration (2020a), Table 2
- $r$: BICEP/Keck Collaboration (2021), combined with Planck
- $f_{NL}^{\text{local}}$: Planck Collaboration (2020b), Table 7

### U.25.2 Falsification Criteria

**Theorem U.69 (Falsification Conditions).** Conditional on Assumptions U.26, U.41, U.48, U.56; Identifications U.20, U.44a, U.51; the predictive-recovery MacWilliams Golay branch (used in Identification U.20 via Definition U.18); the residual-budget branch (used in Proposition U.14 via Lemma U.54); and the fiducial choice $\phi_0 = \phi_{\max}$ so that $N_e = 59.4$ (Result U.60), the primordial-sector predictions would be falsified by any statistically significant measurement lying outside the Appendix U $3\sigma$ theory windows:

1. **Tensor ratio**: $r \notin [0.00271,\,0.00409]$ at $>3\sigma$ (prediction: $r = 0.0034 \pm 0.00023$)
2. **Spectral index**: $n_s \notin [0.9630,\,0.9696]$ at $>3\sigma$ (prediction: $n_s = 0.9663 \pm 0.0011$)
3. **Local non-Gaussianity**: $f_{NL}^{\text{local}} \notin [0.0125,\,0.0155]$ at $>3\sigma$ (prediction: $0.0140 \pm 0.0005$)
4. **Running**: $dn_s/d\ln k \notin [-(6.9\times10^{-4}),\,-(4.5\times10^{-4})]$ at $>3\sigma$ (prediction: $-(5.7 \pm 0.4)\times10^{-4}$)
5. **Primordial product lock**: after applying the stated $A_Q$ branch window, the measured product $A_s r$ lies outside
$$
A_s r
=
\frac{A_Qe^{-22}}{4\pi^2}.
$$
On the leading $A_Q=1$ branch, the central value is $7.0658\times10^{-12}$.

If $N_e$ differs from 59.4, replace the central values using $n_s \simeq 1 - 2/N_e$, $r \simeq 12/N_e^2$, $dn_s/d\ln k \simeq -2/N_e^2$, $f_{NL}^{\text{local}} \simeq 5/(6N_e)$, and $n_t \simeq -3/(2N_e^2)$, and propagate the corresponding theory windows. The product-lock identity $A_s r=A_Qe^{-22}/(4\pi^2)$ is unchanged by this replacement because $N_e$ cancels between $A_s$ and $r$.

These criteria are testable by CMB-S4, LiteBIRD, and future 21-cm observations.


---

## U.26 Structural Summary

### U.26.1 Dual Complexity Hierarchy

**Summary U.70 (Complexity Parameters).**

| Sector | Configuration Space | $\kappa$ | Physical Scale |
|:-------|:-------------------:|:--------:|:--------------:|
| Vacuum | $\text{Gr}_\mathbb{C}(12,24)$ | $\kappa_{\mathrm{ref}} = 141.5$ on the Appendix U five-mode reference branch; $\kappa_{\mathrm{trans}} = 142$ on the corrected four-mode branch of Theorem U.13b | Reference value $\Lambda L_P^2 \approx 2.88 \times 10^{-122}$ on the five-mode branch; $(1.06 \pm 0.01) \times 10^{-122}$ on the same-prefactor four-mode branch of Theorem U.13b |
| Primordial | $\mathbb{CP}^{11}$ | $11$ | $Q \approx 1.18 \times 10^{-5}$ |

The hierarchy $\kappa_{\Lambda,\mathrm{ref}} / \kappa_Q = 12.86$ summarizes the Appendix U five-mode reference separation between the vacuum branch and the primordial perturbation scale. Under the hypotheses of Theorem U.13b, the corresponding four-mode branch value gives $\kappa_{\Lambda,\mathrm{trans}} / \kappa_Q = 12.91$.

### U.26.2 Golay-Steiner Unification

**Summary U.71 (Structural Unity).** Both sectors connect to the Golay code $[24, 12, 8]$ (Theorem Z.13):

- **Vacuum**: Full code structure $\to$ Grassmannian $\text{Gr}_\mathbb{C}(12,24)$ $\to$ Appendix U five-mode reference exponent $\kappa_{\Lambda,\mathrm{ref}} = 141.5$ (Theorem U.16), with Theorem U.8c obstructing the pure-coordinate dilatation realization inside the current continuum action, while Theorem U.13b closes the corrected full-discrete four-mode branch under the explicit false-vacuum spectral hypotheses stated there
- **Primordial**: Signal subspace $\mathbb{C}^{12}$ $\to$ Projective space $\mathbb{CP}^{11}$ $\to$ $\kappa_Q = 11$ (Identification U.20)
- **Inflation dynamics**: 24-cell 5-design $\to$ 12-line graph $\to$ $\mathbb{CP}^1_{\text{inv}}$ $\to$ Starobinsky (Assumption U.48, Identification U.44a)
- **Observable predictions**: conditional on Assumption U.26, Assumption U.41, Identification U.51

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

*Proof.* Theorem T.5 gives the electroweak base count $\kappa_0^{EW}=39$ and zero-mode count $m_{EW}=1$, hence $\kappa_{EW}=39-\frac12=38.5$. Theorem U.3 gives the vacuum base count
$$
\kappa_0^\Lambda=\dim_{\mathbb C}\mathrm{Gr}_{\mathbb C}(12,24)=12(24-12)=144.
$$
Under the Appendix U five-mode reference counting convention of Theorems U.15-U.16, one subtracts $m=5$, obtaining $\kappa_{\Lambda,\mathrm{ref}}=144-\frac52=141.5$. Theorem U.8c simultaneously shows that this is a reference-counting branch rather than theorem-level continuum closure. Under the corrected Definition U.6 normalization and the explicit false-vacuum spectral hypotheses of Theorem U.13b, the full discrete problem has exactly four translational zero modes and no additional nullity, hence $\kappa_{\Lambda,\mathrm{trans}}=144-\frac42=142$. ∎

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

For (c), the translation zero modes are $t_\mu=-\partial_\mu\phi^*$. Because $\phi^*$ is $O(4)$-symmetric, each $t_\mu$ transforms in the vector representation, while $s_{\mathrm{conf}}=-\varphi(r)-r\varphi'(r)$ is an $O(4)$ scalar. Under any $O(4)$-invariant inner product, scalar and vector isotypic components are orthogonal. If $s_{\mathrm{conf}}=0$, then $r\varphi'(r)=-\varphi(r)$, so $\varphi(r)=c/r$; finite action then forces $c=0$, contradicting non-triviality. Hence $s_{\mathrm{conf}}\neq 0$ and cannot lie in the translation span. Theorem U.3 gives the base complex count $\dim_{\mathbb C}\mathrm{Gr}_{\mathbb C}(12,24)=144$, and subtracting one half of the five real collective coordinates gives $\kappa_\Lambda=144-\frac52=141.5$. The distinction from Theorem U.8c is immediate because $s_{\mathrm{conf}}=-\phi^*-s_{\mathrm{coord}}$ is not the pure-coordinate tangent. ∎

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

## U.27 Conclusion

This appendix derives the cosmological constant reference scale and the primordial observables from the Golay-Steiner structure at $M = 24$, but with different logical status in the two sectors.

**Vacuum Sector.** Under the Appendix U leading-order five-mode counting convention, the reference exponent $\kappa_{\Lambda,\mathrm{ref}} = 141.5$ yields the baseline scale
$$
\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-283}.
$$
With the Appendix U working prefactor $A_{\text{eff}} = 0.923 \pm 0.011$, this gives the branch-dependent reference value $(2.88 \pm 0.03)\times10^{-122}$ (Corollary U.17). Theorem U.8c shows that the pure-coordinate dilatation mode used in that five-mode branch is obstructed in the current Definition U.4 continuum action, and Theorem U.13 shows under its sampled-sector exactness hypothesis that the sampled translation+dilatation restriction of the discrete Hessian has no fifth zero mode. Under the corrected Definition U.6 normalization and the explicit false-vacuum spectral hypotheses of Theorem U.13b, the corresponding four-mode branch gives $(1.06 \pm 0.01)\times10^{-122}$ at the same prefactor and would require $A_{\text{eff}}^{(\text{obs},4)} = 2.49 \pm 0.04$ to match observation.

**Primordial Sector.** Conditional on Identifications U.20, U.44a, U.51 and Assumptions U.26, U.41, U.48, the complexity $\kappa_Q = 11$ and geometric e-fold count $N_e = 59.4$ yield:

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

**Falsifiability.** The primordial predictions are testable by CMB-S4 and LiteBIRD through the quantitative windows stated in Theorem U.69.

The primordial predictions are conditional on Identifications U.20, U.44a, U.51 and Assumptions U.26, U.41, U.48. The vacuum sector fixes a leading-order reference exponent from the Grassmannian structure and spherical 5-design, while the overall normalization remains encoded in the stated Appendix U prefactor convention for $A_{\text{eff}}$.

---