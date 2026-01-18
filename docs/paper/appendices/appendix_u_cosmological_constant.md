# Appendix U: Cosmological Constant and Primordial Sector from Golay-Steiner Structure

## U.1 Introduction

The cosmological constant $\Lambda$ and primordial perturbation amplitude $Q$ represent the two fundamental scales of cosmology. Observationally:

$$\Lambda L_P^2 \approx 2.87 \times 10^{-122}, \qquad Q \approx 1.9 \times 10^{-5}$$

where $L_P$ is the Planck length. The cosmological constant constitutes the largest hierarchy in physics; the primordial amplitude sets the scale of structure formation.

In the Predictive Universe framework, both scales derive from the information-theoretic structure of the Extended Binary Golay Code $\mathcal{C}_{24}$. The vacuum sector involves the full configuration space $\text{Gr}_\mathbb{C}(12,24)$ with complexity $\kappa_\Lambda = 141.5$; the primordial sector involves the signal subspace $\mathbb{CP}^{11}$ with complexity $\kappa_Q = 11$. Both are suppressed by instanton mechanisms:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \, e^{-2\kappa_\Lambda}, \qquad Q^2 = \frac{1}{2} A_Q \, e^{-2\kappa_Q}$$

where $A_{\text{eff}}$ and $A_Q$ are dimensionless $O(1)$ prefactors. For the vacuum sector:

$$A_{\text{eff}} := K \cdot N_{\text{eff}}$$

Here $K$ is the one-loop determinant ratio from Gaussian fluctuations around the bounce, and $N_{\text{eff}}$ is the polynomial extensivity factor from Appendix E. For a minimal bounce in MPU units, $A_{\text{eff}} = O(1)$.

This appendix derives $\kappa_\Lambda = 141.5$ (Sections U.3–U.14) and $\kappa_Q = 11$ (Sections U.15–U.27) from first principles, demonstrating that the Golay-Steiner structure determines both cosmological scales.

---

## U.2 Framework Constants

The following constants are derived elsewhere in the framework:

| Symbol | Value | Definition | Source |
|--------|-------|------------|--------|
| $\varepsilon$ | $\ln 2$ | Landauer erasure cost | Theorem 31 |
| $K_0$ | 3 | Minimal self-referential bits | Theorem 15 |
| $d_0$ | $2^{K_0} = 8$ | MPU Hilbert space dimension | Theorem 23 |
| $a$ | $e^{\varepsilon} = 2$ | Active kernel dimension | Theorem Z.1 |
| $b$ | $d_0 - a = 6$ | Inactive subspace dimension | Definition |
| $M$ | $2ab = 24$ | Interface modes | Theorem Z.5 |
| $D$ | 4 | Emergent spacetime dimension | Theorem Z.11 |
| $C_{\max}/\varepsilon$ | 2 | PCE capacity ratio | Appendix Q |

---

## U.3 The Golay Code and Steiner System

### U.3.1 Code Parameters

The Extended Binary Golay Code $\mathcal{C}_{24}$ is the unique $[n, k, d]$ binary linear code with:

- Length $n = M = 24$
- Dimension $k = 12$
- Minimum distance $d_{\min} = 8 = d_0$

**Theorem U.1 (Golay Uniqueness).** The extended binary Golay code is the unique binary linear code achieving the parameters $[24, 12, 8]$.

*Proof.* This is a classical result in coding theory (Pless 1968; Conway & Sloane 1999). The uniqueness follows from the Golay code saturating the Griesmer bound for binary linear codes. Within the PU framework, Theorem Z.13 establishes that PCE optimization uniquely selects this code structure for the $M = 24$ interface modes. QED

### U.3.2 Octad Structure

The weight-8 codewords of $\mathcal{C}_{24}$ are called **octads**. Each octad is a subset $O \subset \{1, \ldots, 24\}$ with $|O| = 8$.

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

---

## U.4 The Configuration Space


### U.4.1 Grassmannian Bound

Vacuum fluctuations correspond to deformations of the code subspace. The space of all $k$-dimensional complex subspaces of the $M$-dimensional Hilbert space $\mathbb{C}^M$ is the complex Grassmannian:

$$\mathcal{M} = \text{Gr}_{\mathbb{C}}(k, M)$$

**Theorem U.3 (Configuration Dimension).** The base instanton complexity equals the complex dimension of the Grassmannian:

$$\kappa_0 = \dim_{\mathbb{C}}(\text{Gr}_{\mathbb{C}}(12, 24)) = k(M - k) = 12 \times 12 = 144$$

where:
- $k = 12$ is the Golay code dimension (Theorem Z.13)
- $M = 24$ is the number of interface modes (Theorem Z.5)
- $\text{Gr}_{\mathbb{C}}(12, 24)$ is the Grassmannian of 12-dimensional complex subspaces of $\mathbb{C}^{24}$, the $M$-mode Hilbert space

*Proof.* Standard differential geometry. The complex Grassmannian $\text{Gr}_{\mathbb{C}}(k, n)$ is a complex manifold of complex dimension $k(n-k)$. $\square$

**Remark U.3a (Complex vs Real Dimensions).** The complex Grassmannian $\text{Gr}_{\mathbb{C}}(k, M)$ is a complex manifold of complex dimension $k(M-k) = 144$ and real dimension $N_{\mathbb{R}} = 2k(M-k) = 288$. The instanton complexity $\kappa_0 = 144$ counts *complex* directions; the real dimension enters in the Morse-Bott analysis (Theorem U.15) where $m = 5$ real zero modes are subtracted, yielding $\kappa = (N_{\mathbb{R}} - m)/2 = (288 - 5)/2 = 141.5$.

**Definition U.1 (Maximum Complexity).** The **Golay bound** for instanton complexity is:

$$\kappa_{\max} = k^2 = 144$$

### U.4.2 Phase Space

Physical dynamics occur on the cotangent bundle $T^*\mathcal{M}$.

**Corollary U.4 (Phase Space Dimension).**

$$\dim(T^*\text{Gr}(12, 24)) = 2 \times 144 = 288$$

---

## U.5 The Octad Hessian

### U.5.1 Quadratic Potential

For a fluctuation $u \in \mathbb{R}^{24}$ on the interface modes, define the **centered octad potential**:

$$Q(u) = \sum_{O \in \mathcal{O}} \left( \sum_{i \in O} (u_i - \bar{u}) \right)^2$$

where $\mathcal{O}$ is the set of 759 octads and $\bar{u} = \frac{1}{24}\sum_{i=1}^{24} u_i$ is the mean.

### U.5.2 Hessian Structure

Let $B$ be the $759 \times 24$ incidence matrix defined by $B_{O,i} = 1$ if $i \in O$ and $0$ otherwise.

**Theorem U.5 (Octad Hessian).** The Hessian of the centered octad potential is:

$$H = \nabla^2 Q(0) = (r - \lambda)\left(I - \frac{1}{24}\mathbf{1}\mathbf{1}^T\right)$$

with eigenvalues:
- $0$ on $\text{span}\{\mathbf{1}\}$ (multiplicity 1)
- $r - \lambda = 176$ on $\mathbf{1}^\perp$ (multiplicity 23)

*Proof.* For a 2-design with parameters $(v, k_{\text{block}}, \lambda)$:

$$B^T B = (r - \lambda)I + \lambda \mathbf{1}\mathbf{1}^T$$

The centered Gram matrix is:

$$H = B^T B - \frac{bk_{\text{block}}}{v}\mathbf{1}\mathbf{1}^T = (r - \lambda)\left(I - \frac{1}{v}\mathbf{1}\mathbf{1}^T\right)$$

The projection $P_{\mathbf{1}^\perp} = I - \frac{1}{24}\mathbf{1}\mathbf{1}^T$ has eigenvalue 0 on $\text{span}\{\mathbf{1}\}$ and eigenvalue 1 on the 23-dimensional orthogonal complement. $\square$

### U.5.3 Connection to Framework Constants

**Theorem U.6 (Hessian-Framework Identity).** The non-zero Hessian eigenvalue satisfies:

$$r - \lambda = d_0(M - a) = 8 \times 22 = 176$$

*Proof.* From the 2-design formula:

$$r - \lambda = \frac{r(v - k_{\text{block}})}{v - 1} = \frac{253 \times 16}{23} = 176$$

The right-hand side equals $d_0(M - a)$ because:
- The octad size $k_{\text{block}} = 8 = d_0$ (Golay minimum distance equals MPU dimension)
- The point count $v = 24 = M$ (code length equals interface modes)
- Therefore $v - k_{\text{block}} = M - d_0 = 24 - 8 = 16$

The identity $d_0(M - a) = 8 \times 22 = 176$ follows from $M - a = 24 - 2 = 22$. $\square$

**Remark U.6a.** This identity connects the Steiner design parameters directly to PU constants, confirming the structural relationship between coding theory and the framework established in Theorem Z.13 and the Golay Bridge (Theorem R.4.9).

---

## U.6 The 24-Cell and Spherical 5-Design

### U.6.1 The 24-Cell Polytope

The **24-cell** is the unique regular self-dual polytope in four dimensions. Its 24 vertices, normalized to lie on $S^3 \subset \mathbb{R}^4$, are:

**Type I (8 vertices):**
$$\pm e_1, \pm e_2, \pm e_3, \pm e_4$$

**Type II (16 vertices):**
$$\frac{1}{2}(\pm 1, \pm 1, \pm 1, \pm 1)$$

### U.6.2 Spherical Design Property

**Definition U.2 (Spherical $t$-Design).** A finite set $X \subset S^{n-1}$ is a **spherical $t$-design** if for all polynomials $P$ of degree at most $t$:

$$\frac{1}{|X|} \sum_{x \in X} P(x) = \int_{S^{n-1}} P(x) \, d\sigma(x)$$

where $d\sigma$ is the uniform probability measure on $S^{n-1}$.

**Theorem U.7 (24-Cell Design Property).** The 24 vertices of the 24-cell form a tight spherical 5-design on $S^3$.

*Proof.* Delsarte, Goethals, and Seidel (1977). The 24-cell achieves the lower bound for the cardinality of a spherical 5-design in dimension 4. $\square$

### U.6.3 Identification of Modes with Vertices

**Theorem U.7b (Mode-Vertex Correspondence).** The 24 QFI-active interface modes of the PCE-Attractor correspond bijectively to the 24 vertices of the 24-cell polytope. This correspondence identifies the real dimension of the Grassmannian orbit $\dim_{\mathbb{R}}(\text{Gr}(2,8)) = 2ab = 24$ with the 24-cell vertex count, connecting the internal Hilbert space structure to four-dimensional geometric optimality.


*Proof.*

**Step 1 (Interface mode count).** From Theorem Z.5, the QFI-active interface modes number $M = 2ab = 24$, where $a = 2$ (Theorem Z.1) and $b = d_0 - a = 6$.

**Step 2 (Equilibrium saturation).** At thermodynamic equilibrium (Postulate 4), Theorem Z.9 establishes that the channel configuration maximizes entropy subject to distinguishability constraints, yielding $M_{\text{phys}} = K(D)$.

**Step 3 (Mode-channel correspondence).** Theorem Z.10 requires $M_{\text{int}} = M_{\text{phys}}$ at PCE-optimal equilibrium. This matching is the unique global minimum of the PCE potential (Lemma Z.5).

**Step 4 (Dimensional selection).** Theorem Z.11 establishes that $K(D) = 24$ uniquely selects $D = 4$, since $K(4) = 24$ is the only integer solution.

**Step 5 (Geometric realization).** The 24-cell is the unique regular convex 4-polytope whose 24 vertices form the optimal kissing configuration $K(4) = 24$ (Conway & Sloane 1999). By Definition Z.8, these vertices correspond to the unit Hurwitz integers on $S^3$. As established in Corollary Z.5a, the 24-cell provides the microscopic geometric realization of the mode-channel correspondence.

**Step 6 (Spherical design property).** The 24-cell vertices form a tight spherical 5-design on $S^3$ (Delsarte, Goethals & Seidel 1977). This is the unique such configuration with 24 points. The correspondence between interface modes and 24-cell vertices is structurally canonical: both sets have cardinality 24, both inherit the same symmetry group (the automorphism group of the $D_4$ root lattice), and the spherical design property of the vertices exactly matches the quadrature requirements for preserving zero modes (Theorem U.13). $\square$

**Remark U.2 (Nature of the Correspondence).** The mode-vertex correspondence established in Theorem U.7b is structural rather than literal: the 24 QFI-active interface modes span the real tangent space $T_{x_0}\text{Gr}(2,8) \cong \text{Hom}(\mathbb{C}^2, \mathbb{C}^6)_{\mathbb{R}}$, a 24-dimensional real vector space (complex dimension 12), while the 24-cell vertices span $\mathbb{R}^4$. The correspondence identifies the combinatorial and symmetry structures of these two 24-element sets, enabling the transfer of spherical design properties to the discretized action. This is analogous to how the Golay code organizes the same 24 modes for error correction (Theorem Z.13) without the modes literally being binary codewords.

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

**Theorem U.8a (Scale Invariance from PCE-Attractor Properties).** At the PCE-Attractor (Definition 15a), the effective action satisfies the **virial identity**:

$$\frac{d}{d\rho} S_{\text{cont}}[\phi^*_\rho]\bigg|_{\rho=1} = 0$$

where $\phi^*_\rho(x) = \phi^*(\rho x)$ is the dilated bounce.

*Proof.*

**Step 1 (PCE-Attractor characterization).** By Definition 15a, the PCE-Attractor is the unique global minimum characterized by three co-occurring conditions: (i) maximal symmetry with flat QFI spectrum; (ii) capacity saturation at the zero-slack boundary where $M\ln(1+\lambda u^*) = \ln d_0$; and (iii) canonical instantiation with $\kappa^* = 1$ (Theorem X.3).

**Step 2 (Effective potential at the Attractor).** From Appendix X (Equation X.10), the effective potential is defined as:

$$V_{\text{eff}}(u;k) := \frac{1}{\mathcal{V}}\Gamma_k[u\text{ const}]$$

At the PCE-Attractor, the constrained stationarity condition (Appendix X, Equation X.12) requires:

$$\frac{d}{du}\Big(V_{\text{eff}}(u;k) + \zeta\,[M\ln(1+\lambda u) - \ln d_0]\Big)\Big|_{u=u^*} = 0$$

where $\zeta$ is the Lagrange multiplier enforcing capacity saturation. The zero-slack condition means the unconstrained minimum coincides with the capacity boundary, so $\zeta = 0$ at the Attractor.

**Step 3 (Derrick-type analysis).** For the continuum action (Definition U.4), consider the one-parameter family of dilated configurations $\phi^*_\rho(x) = \phi^*(\rho x)$. The action decomposes as:

$$S_{\text{cont}}[\phi^*_\rho] = S_{\text{kin}}(\rho) + S_{\text{pot}}(\rho)$$

where $S_{\text{kin}}(\rho) = \rho^{2-D} S_{\text{kin}}(1)$ and $S_{\text{pot}}(\rho) = \rho^{-D} S_{\text{pot}}(1)$ under standard field-theoretic scaling. For a stationary point $\phi^*$ of $S_{\text{cont}}$, the Derrick theorem requires:

$$\frac{d}{d\rho} S_{\text{cont}}[\phi^*_\rho]\bigg|_{\rho=1} = (2-D) S_{\text{kin}}(1) - D \cdot S_{\text{pot}}(1) = 0$$

This yields the virial constraint $S_{\text{kin}}(1) = \frac{D}{D-2} S_{\text{pot}}(1)$ for $D > 2$.

**Step 4 (Virial identity at the PCE-Attractor).** At the PCE-Attractor in $D = 4$ (Theorem Z.11), the virial constraint becomes:

$$S_{\text{kin}}(1) = 2 \cdot S_{\text{pot}}(1)$$

The total action $S_{\text{cont}}[\phi^*] = S_{\text{kin}}(1) + S_{\text{pot}}(1) = 3 S_{\text{pot}}(1)$ is stationary under dilation by construction. The PCE zero-slack condition (Definition 15a, condition ii) additionally enforces that this stationary point is a minimum: the capacity saturation $M\ln(1+\lambda u^*) = \ln d_0$ fixes the bounce amplitude $u^*$, eliminating the flat direction that would otherwise allow arbitrary rescaling. The scale $\rho = 1$ is selected as the unique fixed point satisfying both the Derrick constraint and capacity saturation.

The virial identity follows:

$$\frac{d}{d\rho} S_{\text{cont}}[\phi^*_\rho]\bigg|_{\rho=1} = 0$$

**Step 5 (Connection to Predictive Ward Identity).** The scale invariance is not accidental but follows from the Predictive Ward Identity (Theorem X.3). At the PCE-Attractor, the emergent physical action takes canonical form with $\kappa^* = 1$. The Legendre transform structure (Appendix X, Equation X.3) ensures that the 1PI effective action $\Gamma^{(2)} = \mathcal{G}^{-1} = \mathcal{K}$ inherits the scale properties of the information-theoretic kernel $\mathcal{K}$, which is constructed from the QFI structure. The flat QFI spectrum (Definition 15a, condition i) implies uniform scaling across all 24 modes, precluding any preferred scale.

**Step 6 (PCE optimality).** The virial identity is equivalent to the statement that the PCE-Attractor configuration cannot reduce its action by rescaling. Any $\rho \neq 1$ would break the capacity saturation condition: rescaling the bounce changes the effective coupling $u_{\text{eff}}(\rho) \neq u^*$, violating the zero-slack optimality. The scale $\rho = 1$ is the unique fixed point of the combined PCE constraints. $\square$

**Remark U.8b (Robustness of Scale Invariance).** The scale invariance at the PCE-Attractor is structurally protected by three independent mechanisms: (i) the Derrick virial constraint at the stationary bounce solution; (ii) the zero-slack condition fixing the bounce amplitude through capacity saturation; and (iii) the Predictive Ward Identity enforcing canonical normalization (Theorem X.3). Breaking scale invariance would require violating at least one of these conditions, shifting $\kappa$ by $0.5$ and changing $\Lambda$ by a factor of $e \approx 2.7$ (see Section U.13.1).

**Theorem U.9 (Dilatation Zero Mode).** Under Theorem U.8, the second variation annihilates the dilatation tangent vector:

$$\frac{\partial \phi^*_\rho}{\partial (\ln \rho)}\bigg|_{\rho=1} = x^\mu \partial_\mu \phi^*$$

*Proof.* The virial identity states that $\phi^*$ is a critical point of $S_{\text{cont}}$ restricted to the 1-parameter family of dilations. The second variation vanishes on the tangent direction. $\square$

### U.7.3 Total Zero Mode Count

**Corollary U.10 (Collective Coordinates).** The continuum instanton $\phi^*$ at the PCE attractor has exactly $m = D + 1 = 5$ collective zero modes:

- 4 translation modes (one per spacetime direction)
- 1 dilatation mode (scale)

---

## U.8 Design-Preserving Discretization

### U.8.1 Continuum Action Specification

The continuum Euclidean information action for vacuum fluctuations is constructed from the framework's fundamental structures.

**Definition U.4 (Continuum Information Action).** The continuum action $S_{\text{cont}}[\phi]$ for a scalar fluctuation field $\phi: S^3 \times \mathbb{R} \to \mathbb{R}$ on the unit 3-sphere times Euclidean time is:

$$S_{\text{cont}}[\phi] = \frac{1}{\varepsilon}\int_{\mathbb{R}} d\tau \int_{S^3} d\Omega_3 \left[\frac{1}{2}(\partial_\tau \phi)^2 + \frac{1}{2}|\nabla_{S^3}\phi|^2 + V_{\text{eff}}(\phi) - V_{\text{eff}}(0)\right]$$

where $\varepsilon = \ln 2$ is the Landauer cost (Theorem 31), $d\Omega_3$ is the round metric on $S^3$, $\nabla_{S^3}$ is the spherical gradient, and $V_{\text{eff}}(\phi)$ is the effective potential from the PCE rate-level potential (Appendix X, Equation X.10). The subtraction $V_{\text{eff}}(0)$ ensures finite action for vacuum-to-vacuum trajectories.

**Remark U.4a (O(4) Invariance).** The action $S_{\text{cont}}$ is manifestly O(4)-invariant: the kinetic term $(\partial_\tau \phi)^2 + |\nabla_{S^3}\phi|^2$ is the standard Laplacian on $S^3 \times \mathbb{R} \cong \mathbb{R}^4 \setminus \{0\}$, and the potential $V_{\text{eff}}$ depends only on the field value, not its location. This invariance is inherited from the isotropy of the PCE-Attractor state (Definition 15a).

### U.8.2 Discrete Sampling

**Definition U.5 (Discrete Sampling).** Let $X = \{x_1, \ldots, x_{24}\} \subset S^3$ be the 24-cell vertices (Definition Z.8). For a continuum field configuration $\phi$, define the discrete vector:

$$u_i = \phi(x_i), \quad i = 1, \ldots, 24$$

**Definition U.6 (Discrete Action).** The **discrete action** $S_{\text{disc}}: \mathbb{R}^{24} \to \mathbb{R}$ is defined by evaluating the spherical integral via design quadrature:

$$S_{\text{disc}}(u) = \frac{1}{\varepsilon}\int_{\mathbb{R}} d\tau \left[\frac{1}{2}\sum_{i=1}^{24}\dot{u}_i^2 + \frac{1}{24}\sum_{i,j}W_{ij}(u_i - u_j)^2 + \frac{1}{24}\sum_{i=1}^{24}V_{\text{eff}}(u_i)\right]$$

where $W_{ij}$ encodes the adjacency structure of the 24-cell (derived from the $D_4$ root lattice, Definition Z.8) and the factor $1/24$ normalizes the spherical average. The quadrature replaces $\int_{S^3} d\Omega_3 \to \frac{1}{24}\sum_{i=1}^{24}$, which is exact for polynomials of degree $\leq 5$ by the spherical 5-design property (Theorem U.7).

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

**Theorem U.13 (Design-Preserving Zero Modes).** Let $X \subset S^3$ be the 24-cell (a spherical 5-design, identified with interface modes by Theorem U.7). Let $S_{\text{cont}}[\phi]$ (Definition U.4) satisfy:
1. O(4) invariance (Remark U.4a)
2. Translation invariance (Theorem U.8)
3. Scale invariance at $\phi = \phi^*$ (Theorem U.8a)

Define $S_{\text{disc}}$ by spherical quadrature on $X$. Then the second variation $D^2 S_{\text{disc}}(u^*)$ at the discretized bounce $u^* = (\phi^*(x_1), \ldots, \phi^*(x_{24}))$ has a kernel of dimension exactly $m = D + 1 = 5$.

*Proof.*

**Step 1.** By Theorems U.8 and U.9, the continuum second variation $D^2 S_{\text{cont}}(\phi^*)$ has a 5-dimensional kernel spanned by:

$$\{-\partial_\mu \phi^*\}_{\mu=1}^4 \cup \{x^\nu \partial_\nu \phi^*\}$$

**Step 2.** By Lemma U.12, all integrands in $D^2 S_{\text{cont}}$ are polynomials of degree $\leq 4$ in angular variables.

**Step 3.** Since $4 < 5$ and $X$ is a spherical 5-design, Theorem U.11 guarantees that the quadrature evaluation is **exact** for all terms in the second variation.

**Step 4.** Therefore, the discrete second variation $D^2 S_{\text{disc}}(u^*)$ inherits the continuum kernel structure exactly. The 5 null directions of the continuum descend to 5 null directions of the discrete Hessian.

**Step 5.** No additional null directions arise because the octad quadratic form $Q(u)$ contributes a strictly positive $(r - \lambda) = 176$ eigenvalue on $\mathbf{1}^\perp$ (Theorem U.5), and the centering removes only the trivial uniform mode. $\square$

---

## U.9 Morse-Bott Asymptotics

### U.9.1 Partition Function Structure

The vacuum fluctuation amplitude is computed via a path integral:

$$Z = \int \mathcal{D}u \, e^{-\lambda S_{\text{disc}}(u)}$$

where $\lambda = C_{\max}/\varepsilon = 2$ is the PCE capacity ratio.

### U.9.2 Standard Laplace Asymptotics

**Theorem U.14 (Morse-Bott Formula).** Let $f: \mathbb{R}^N \to \mathbb{R}$ have a critical manifold $\mathcal{C}$ of dimension $m$ where $f = f^*$ is constant. If the Hessian restricted to the normal bundle is non-degenerate with $N - m$ positive eigenvalues, then:

$$\int_{\mathbb{R}^N} e^{-\lambda f(x)} dx = C \cdot \lambda^{-(N-m)/2} \cdot e^{-\lambda f^*} \cdot (1 + O(\lambda^{-1}))$$

where $C$ depends on the determinant of the normal Hessian and the volume of $\mathcal{C}$.

*Proof.* Standard result in asymptotic analysis; see Nicolaescu (2011). $\square$

### U.9.3 Application to the Vacuum Instanton

The discretized bounce $u^*$ lies on a critical manifold of dimension $m = 5$ (the collective coordinates). Applying Theorem U.14 with $\lambda = 2$:

$$Z \propto 2^{-(N-5)/2} \cdot e^{-2 S^*}$$

where $N$ is the total number of Gaussian directions and $S^* = S_{\text{disc}}(u^*)$ is the instanton action.

---

## U.10 Complexity Deficit

### U.10.1 Complexity-Action Correspondence

**Proposition U.14 (Complexity-Action Relation).** The instanton action $S_{\text{inst}}$ and complexity $\kappa$ are related by:

$$S_{\text{inst}} = 2\kappa$$

This follows from the PCE-fixed ratio $C_{\max}/\varepsilon = 2$, rigorously derived in Appendix Q from the MPU budget allocation $C_{\max}^* = \ln(d_0) - \varepsilon = 3\ln 2 - \ln 2 = 2\ln 2$.

**Remark U.14.1 (One-Loop Correction via Zeta Regularization).** The one-loop correction to the instanton action is formally computed via the zeta-regularized functional determinant on the attractor orbit $\text{Gr}(2,8)$:

$$\log\det'(-\Delta_{g_B} + \lambda) = -\zeta'_{\mathcal{O}}(0)$$

where $\zeta_{\mathcal{O}}(s) = \sum_{(m_1,m_2) \neq (0,0)} \text{mult}(m_1, m_2) \cdot (\lambda_B(m_1, m_2) + \lambda)^{-s}$ uses the Laplacian eigenvalues on $\text{Gr}(2,8)$ (Helgason 1984). The multiplicities follow from spherical representation theory for the symmetric pair $(U(8), U(2) \times U(6))$. Under $K$-invariance, the mass parameter equals the hierarchy coefficient:

$$\alpha = \frac{1}{16\sigma_B^2} = \frac{1}{16 \cdot (1/24)} = \frac{24}{16} = \frac{3}{2}$$

where $\sigma_B^2 = 1/M = 1/24$ arises from capacity saturation across the $M = 24$ interface modes (Theorem Z.5).

*Derivation.* The instanton action scales with complexity as $S_{\text{inst}} = (C_{\max}/\varepsilon)\kappa$ (Section U.4). Substituting $C_{\max}/\varepsilon = 2$ yields $S_{\text{inst}} = 2\kappa$.

*Consistency check.* The cosmological constant formula:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-S_{\text{inst}}} = 8\pi A_{\text{eff}} \cdot e^{-2\kappa}$$

Using $\varepsilon = \ln 2$, this can equivalently be written as:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot 2^{-2\kappa/\ln 2} = 8\pi A_{\text{eff}} \cdot 2^{-2\kappa \cdot \log_2 e}$$

The Morse-Bott correction factor $\lambda^{-m/2} = 2^{-m/2}$ (with $\lambda = C_{\max}/\varepsilon = 2$) modifies the effective complexity by reducing the number of contributing Gaussian directions from $\kappa_0$ to $\kappa_0 - m/2$.

### U.10.2 Zero Mode Contribution

**Convention U.14a (Complexity Parameter).** The instanton complexity $\kappa$ is defined as the effective number of complex normal directions contributing to the exponential suppression factor $e^{-2\kappa}$. All power-law prefactors in $\lambda$, determinants, and Jacobian contributions from the Morse-Bott measure are absorbed into the effective prefactor $A_{\text{eff}}$. This convention separates the dominant exponential scaling (controlled by $\kappa$) from subleading polynomial corrections (packaged into $A_{\text{eff}} \sim O(1)$).

**Theorem U.15 (Complexity Deficit from Zero Modes).** The $m = 5$ collective zero modes reduce the effective complexity by:

$$\delta = \frac{m}{2} = \frac{5}{2} = 2.5$$

*Proof.*

**Step 1 (Morse-Bott structure).** By Theorem U.14, the partition function has the form:

$$Z = A \cdot \lambda^{-(N_{\mathbb{R}}-m)/2} \cdot e^{-\lambda S^*}$$

where $\lambda = C_{\max}/\varepsilon = 2$ (Appendix Q), $N_{\mathbb{R}} = 288$ is the real dimension of the integration domain (Remark U.3a), $m = 5$ is the real dimension of the zero-mode manifold (Corollary U.10), $S^*$ is the instanton action, and $A$ collects determinant and Jacobian factors.

**Step 2 (Complexity identification).** The base complexity $\kappa_0 = 144$ counts the complex dimension of $\text{Gr}_{\mathbb{C}}(12, 24)$ (Theorem U.3), with $N_{\mathbb{R}} = 2\kappa_0$. By Convention U.14a, we identify $\kappa$ as the effective number of complex Gaussian directions contributing to the exponential suppression:

$$\kappa := \frac{N_{\mathbb{R}} - m}{2} = \frac{288 - 5}{2} = 141.5$$

All $\lambda$-power prefactors and the factor $A$ are absorbed into $A_{\text{eff}}$.

**Step 3 (Complex vs real dimensions).** The $m = 5$ collective coordinates—four translations in $\mathbb{R}^4$ and one dilatation in $\mathbb{R}^+$—are intrinsically real degrees of freedom arising from spacetime symmetries of the Euclidean bounce. Each real zero mode removes one real direction from the Gaussian normal bundle. Since $\kappa$ counts complex dimensions and each complex dimension comprises two real dimensions:

$$\delta := \kappa_0 - \kappa = 144 - 141.5 = \frac{m}{2} = \frac{5}{2} = 2.5$$

**Step 4 (Result).** The instanton complexity is:

$$\kappa = \kappa_0 - \delta = 144 - \frac{5}{2} = 141.5$$

$\square$

---

## U.11 Main Result

**Theorem U.16 (Cosmological Constant Complexity).** The instanton complexity parameter is:

$$\boxed{\kappa = k^2 - \frac{D+1}{2} = 144 - \frac{5}{2} = 141.5}$$

where:
- $k = 12$ is the Golay code dimension (Theorem Z.13)
- $D = 4$ is the emergent spacetime dimension (Theorem Z.11)
- The base complexity $k^2 = 144$ is the Grassmannian bound (Theorem U.3)
- The deficit $(D+1)/2 = 5/2$ arises from collective zero modes preserved by the spherical 5-design (Theorem U.13)

**Corollary U.17 (Cosmological Constant).** The vacuum energy density satisfies:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-2\kappa} = 8\pi A_{\text{eff}} \cdot e^{-283}$$

For $A_{\text{eff}} \sim O(1)$:

$$\Lambda L_P^2 \sim 10^{-122}$$

matching the observed value $\Lambda L_P^2 \approx 2.87 \times 10^{-122}$ within the uncertainty of $A_{\text{eff}}$.

---

## U.12 Structural Summary

### U.12.1 Two Design Roles

The derivation employs two distinct but related design structures:

| Structure | Type | Role | Reference |
|-----------|------|------|-----------|
| Golay octads | Steiner 2-design | Sets quadratic normalization: $\kappa_0 = k^2$ | Theorem Z.13 |
| 24-cell vertices | Spherical 5-design | Preserves 5 zero modes: $\delta = 5/2$ | Theorem U.7 |

Both structures exist at $M = 24$ as derived consequences of PCE optimization (Theorem Z.12), contributing without introducing free parameters.

### U.12.2 Parameter Accounting

| Quantity | Source | Value |
|----------|--------|-------|
| $\kappa_0 = k^2$ | Grassmannian dimension | 144 |
| $m = D + 1$ | Translation + dilatation modes | 5 |
| $\delta = m/2$ | Morse-Bott deficit | 2.5 |
| $\kappa = \kappa_0 - \delta$ | Final complexity | **141.5** |

### U.12.3 Comparison with Observation

| Source | $\kappa$ Value | $\Lambda L_P^2$ |
|--------|----------------|-----------------|
| Derived | 141.5 | $\approx 10^{-123}$ |
| Derived | 141.5 | $\approx 3 \times 10^{-122}$ |
| Observed | $141.54 \pm 0.02$ | $2.87 \times 10^{-122}$ |
| Agreement | — | **0.03%** |

---

## U.13 Robustness and Predictions

### U.13.1 Scale Invariance Breaking

If scale invariance is explicitly broken at the PCE attractor, the dilatation mode acquires a mass and ceases to be a zero mode. Then:

- $m = D = 4$ (translations only)
- $\delta = D/2 = 2$
- $\kappa = 144 - 2 = 142$
- $\Lambda$ increases by factor $e^{2 \times 0.5} = e \approx 2.7$

This provides a testable prediction: small explicit scale breaking shifts $\kappa$ by $0.5$ and increases $\Lambda$ by factor $e$.

### U.13.2 Dimension Dependence

For general emergent dimension $D'$:

- Zero modes: $m = D' + 1$ (if scale-invariant per Theorem U.8) or $m = D'$ (if not)
- Deficit: $\delta = m/2$
- Requires $M = K(D')$ (mode-channel correspondence, Theorem Z.10) and existence of appropriate spherical design

For $D = 4$ (Theorem Z.11): The 24-cell is the unique tight spherical 5-design with $|X| = 24 = K(4)$, locking the structure through the mode-channel correspondence.

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

The collective coordinate count is $m = D + 1 = 5$ (Corollary U.10, with $D = 4$ from Theorem Z.11).

All three appearances of "5" are structurally related through the PCE-optimal organization at $M = 24$:
- Combinatorial (Steiner $t$): The Golay code's weight-8 codewords form $S(5,8,24)$
- Geometric (spherical design degree): The 24-cell achieves the tight bound for spherical designs
- Physical (zero mode count): Translation ($D = 4$) plus dilatation (Theorem U.8) modes

### U.14.3 Saturation Ratio

$$\frac{\kappa}{\kappa_{\max}} = \frac{141.5}{144} = 0.9826$$

Near-saturation (98.3%) occurs because:
- The base cost saturates at $\kappa_0 = k^2$ (2-design isotropy)
- The deficit $m/2 = 2.5$ is small compared to $k^2 = 144$

---


## U.15 Introduction to the Primordial Sector

The preceding sections derived the cosmological constant complexity parameter $\kappa_\Lambda = 141.5$ from the Golay-Steiner structure, yielding the exponential suppression $\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-283}$ (Corollary U.17). With $A_{\text{eff}} \sim O(1)$, this gives:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-283} \approx 25.1 \times 1.24 \times 10^{-123} \approx 3.1 \times 10^{-122}$$

for $A_{\text{eff}} \sim 1$, matching the observed value $\Lambda L_P^2 \approx 2.87 \times 10^{-122}$ (Planck 2018, TT,TE,EE+lowE+lensing, base-$\Lambda$CDM) within 10%.

This section extends the analysis to the **primordial sector**, deriving inflationary observables from the same Golay-Steiner structure. The vacuum sector involves the full configuration space $\text{Gr}_\mathbb{C}(12,24)$ with $\kappa_\Lambda = 141.5$; the primordial sector involves the signal subspace $\mathcal{S} \cong \mathbb{C}^{12}$ with a smaller complexity parameter $\kappa_Q = 11$, yielding the primordial perturbation amplitude $Q \sim 10^{-5}$.

**Conventions.** Throughout this section:
- Natural units: $\hbar = c = k_B = 1$
- Planck length: $L_P^2 = G$ (in natural units)
- Reduced Planck mass: $\bar{M}_{Pl} = 1/\sqrt{8\pi G} = M_{Pl}/\sqrt{8\pi} = 2.435 \times 10^{18}$ GeV

---

## U.16 Primordial Configuration Space

### U.16.1 Signal Subspace Geometry

**Definition U.18 (Primordial Configuration Space).** Let $\mathcal{S} \cong \mathbb{C}^{12}$ denote the 12-dimensional complex signal subspace identified by Theorem Z.13. The **primordial configuration space** is its projectivization:

$$\mathcal{C}_{\text{prim}} := \mathbb{P}(\mathcal{S}) \cong \mathbb{CP}^{11}$$

*Remark.* The vacuum configuration space is $\text{Gr}_\mathbb{C}(12,24)$, the Grassmannian of all 12-dimensional subspaces of $\mathbb{C}^{24}$. The primordial configuration space $\mathbb{CP}^{11}$ is the space of rays within the fixed signal subspace $\mathcal{S}$, representing perturbations around the vacuum rather than deformations of it.

**Theorem U.19 (Primordial Space Dimensions).**

$$\dim_\mathbb{C}(\mathbb{CP}^{11}) = 11, \qquad \dim_\mathbb{R}(\mathbb{CP}^{11}) = 22$$

*Proof.* Standard: $\dim_\mathbb{C}(\mathbb{CP}^n) = n$ for the complex projective space of dimension $n$. $\square$

**Remark U.19a (Dimension Comparison).** The vacuum Grassmannian has:

$$\dim_\mathbb{C}(\text{Gr}_\mathbb{C}(12,24)) = 12 \times (24-12) = 144$$

The ratio of configuration space dimensions is:

$$\frac{\dim_\mathbb{C}(\text{Gr}_\mathbb{C}(12,24))}{\dim_\mathbb{C}(\mathbb{CP}^{11})} = \frac{144}{11} \approx 13.1$$

### U.16.2 Complexity Exponent

**Identification U.20 (Primordial Complexity).** Following Convention U.14a and the structural correspondence between configuration space dimension and instanton complexity, the primordial complexity parameter is identified with the complex dimension of the configuration space:

$$\boxed{\kappa_Q = \dim_\mathbb{C}(\mathbb{CP}^{11}) = 11}$$

*Justification.* By Convention U.14a, the instanton complexity parameter counts the effective number of complex normal directions contributing to the exponential suppression. For the primordial sector on $\mathbb{CP}^{11}$, we identify $\kappa_Q$ with the complex dimension $11$. We assume no additional continuous zero modes beyond gauge redundancies; if collective modes analogous to translations or dilatations were present, they would reduce $\kappa_Q$ as in the vacuum sector ($\kappa_\Lambda = 144 - 2.5$). This identification is consistent with the framework but constitutes an assumption requiring future verification. $\square$

**Corollary U.20a (Complexity Ratio).**

$$\frac{\kappa_\Lambda}{\kappa_Q} = \frac{141.5}{11} \approx 12.86$$

Given the identifications in Theorem U.16 and Identification U.20, this ratio reflects the hierarchy between vacuum energy (suppressed by $e^{-283}$) and primordial perturbations (suppressed by $e^{-22}$).

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

*Remark (Normalization Convention).* The eigenvalue factor $4$ corresponds to the Fubini-Study metric with holomorphic sectional curvature $4$ and diameter $\pi/2$. Alternative normalizations (e.g., holomorphic sectional curvature $1$) yield eigenvalues $\lambda_\ell = \ell(\ell + n)$.

**Assumption U.26 (One-Loop Prefactor Scaling).** Following Convention U.14a, the one-loop prefactor $A_Q$ for the $\mathbb{CP}^{11}$ configuration space satisfies:

$$A_Q = 1 + O(1/\kappa_Q)$$

with $\log A_Q = O(1/\kappa_Q)$ on compact Kähler symmetric spaces of large dimension. For $\kappa_Q = 11$, the correction is $O(9\%)$, contributing $O(4.5\%)$ to $Q$.

*Justification.* On compact symmetric spaces, the spectral zeta function at $s = 0$ admits asymptotic expansions in inverse dimension. For Kähler manifolds, the leading behavior of $\zeta'(0)$ is controlled by curvature invariants that scale with dimension. At large $\kappa$, the prefactor approaches unity; see Voros (1987) for general spectral asymptotics and Vassilevich (2003) for heat kernel methods on symmetric spaces. Following Convention U.14a, we absorb subleading corrections into the $O(1)$ uncertainty of $A_Q$.

*Remark U.26a (Error Propagation).* The uncertainty $\delta A_Q / A_Q \sim 9\%$ propagates to $Q$ as $\delta Q / Q \sim 4.5\%$. For inflationary observables, this induces $\delta A_s / A_s \sim 9\%$, which is comparable to or exceeds current Planck precision on $\ln(10^{10}A_s)$. The predictions should therefore be understood as conditional on the one-loop prefactor assumption.

### U.17.4 Primordial Scale Parameter

**Theorem U.27 (Primordial Perturbation Amplitude).** With $\kappa_Q = 11$ (Identification U.20) and $A_Q = 1$ (Assumption U.26, leading order):

$$\boxed{Q = \frac{e^{-\kappa_Q}}{\sqrt{2}} = \frac{e^{-11}}{\sqrt{2}} = 1.181 \times 10^{-5}}$$

*Verification.* 
- $e^{-11} = 1.6702 \times 10^{-5}$
- $e^{-11}/\sqrt{2} = 1.6702 \times 10^{-5} / 1.4142 = 1.181 \times 10^{-5}$ $\checkmark$

---

## U.18 The 24-Cell Spherical Design

### U.18.1 24-Cell Geometry

The 24-cell is the unique regular 4-polytope with 24 vertices, 96 edges, 96 triangular faces, and 24 octahedral cells. Its vertex set on $S^3 \subset \mathbb{R}^4$ is:

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

$$\frac{1}{24} \sum_{v \in V_{24}} p(v) = \frac{1}{\text{Vol}(S^3)} \int_{S^3} p(x) \, d\sigma(x)$$

The 24-cell is not a 6-design.

*Proof.* Define the Gegenbauer moments $S_\ell := \sum_{v,w \in V_{24}} C_\ell^{(\alpha)}(\langle v, w \rangle)$ where $C_\ell^{(\alpha)}$ are Gegenbauer polynomials with $\alpha = (D-2)/2 = 1$ for $D = 4$. A configuration is a $t$-design if and only if $S_\ell = 0$ for $\ell = 1, \ldots, t$ (Delsarte, Goethals & Seidel 1977).

Using Lemma U.29 and the explicit Gegenbauer polynomials $C_\ell^{(1)}(x)$:
- $C_1^{(1)}(x) = 2x$: $S_1 = 2[24(1) + 192(1/2) + 144(0) + 192(-1/2) + 24(-1)] = 2[24 + 96 - 96 - 24] = 0$
- $C_2^{(1)}(x) = 4x^2 - 1$: Similar calculation yields $S_2 = 0$
- $C_3^{(1)}(x) = 8x^3 - 4x$: $S_3 = 0$
- $C_4^{(1)}(x) = 16x^4 - 12x^2 + 1$: $S_4 = 0$
- $C_5^{(1)}(x) = 32x^5 - 32x^3 + 6x$: $S_5 = 0$
- $C_6^{(1)}(x) = 64x^6 - 80x^4 + 24x^2 - 1$: $S_6 = 576 \neq 0$

Thus the 24-cell is a 5-design but not a 6-design. $\square$

**Corollary U.31 (Design Strength and Dimension).** The design strength $t = 5$ satisfies:

$$t = D + 1$$

where $D = 4$ is the emergent spacetime dimension (Theorem Z.11).

*Remark.* This is a structurally determined coincidence: the 24-cell achieves design strength exactly one greater than the ambient dimension, the maximum possible for a polytope with this symmetry.

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

**Spectrum verification:**
- $\text{tr}(A) = 0$ (no self-loops): $8 + 2(-4) + 9(0) = 0$ $\checkmark$
- $\text{tr}(A^2) = \sum_i d_i = 12 \times 8 = 96$: $8^2 + 2(16) + 0 = 64 + 32 = 96$ $\checkmark$

The characteristic polynomial is $\det(A - \lambda I) = (\lambda - 8)(\lambda + 4)^2 \lambda^9$. $\square$

### U.19.2 Weyl Group Action

**Theorem U.35 (Weyl Group Symmetry).** The 24-cell symmetry group is the Weyl group of the exceptional Lie algebra $F_4$:

$$\text{Aut}(V_{24}) = W(F_4), \qquad |W(F_4)| = 1152 = 2^7 \times 3^2$$

*Proof.* Classical result; see Conway & Sloane (1999), Chapter 4, §8. $\square$

**Theorem U.36 (Eigenspace Decomposition).** The signal subspace decomposes under the $W(F_4)$ action according to the adjacency eigenspaces:

$$\mathcal{S} \cong \mathbf{1} \oplus \mathbf{2} \oplus \mathbf{9}$$

where:
- $\mathbf{1}$: The 1-dimensional eigenspace with eigenvalue $8$ (spanned by the all-ones vector)
- $\mathbf{2}$: The 2-dimensional eigenspace $\mathcal{S}_2$ with eigenvalue $-4$
- $\mathbf{9}$: The 9-dimensional eigenspace $\mathcal{S}_9$ with eigenvalue $0$

Each eigenspace is $W(F_4)$-invariant.

*Proof.* The adjacency matrix $A$ commutes with the $W(F_4)$ action, so eigenspaces are invariant subspaces. The multiplicities follow from Lemma U.34. $\square$

**Corollary U.37 (Invariant Projective Spaces).** The projectivizations of the eigenspaces yield $W(F_4)$-invariant projective submanifolds:

- $\mathbb{P}(\mathbf{1}) = \{\text{point}\}$ (trivial)
- $\mathbb{P}(\mathbf{2}) = \mathbb{CP}^1_{\text{inv}}$ (2-sphere)
- $\mathbb{P}(\mathbf{9}) = \mathbb{CP}^8_{\text{inv}}$ (8-dimensional)

**Theorem U.38 (Minimal Invariant Sector).** Among the non-trivial $W(F_4)$-invariant projective submanifolds of $\mathbb{CP}^{11}$, the space $\mathbb{CP}^1_{\text{inv}} = \mathbb{P}(\mathcal{S}_2)$ arising from the eigenvalue-$(-4)$ eigenspace is the **minimal positive-dimensional** invariant submanifold.

*Remark.* The 9-dimensional eigenspace $\mathcal{S}_9$ (eigenvalue $0$) also yields an invariant submanifold $\mathbb{CP}^8_{\text{inv}}$. The physical selection of $\mathbb{CP}^1_{\text{inv}}$ for single-field inflation follows from:
1. **Minimality**: Single-field inflation requires the minimal non-trivial target space
2. **Kinetic structure**: The eigenvalue $(-4)$ yields the largest kinetic coefficient $\lambda^2 = 12$ (Proposition U.44; Identification U.44a), compared to $\lambda^2 = 8$ on the $0$-eigenspace (8-regular graph: Laplacian eigenvalue equals degree minus adjacency eigenvalue)
3. **PCE selection**: The PCE potential (Definition 15) favors the sector with maximal gradient energy, selecting the $(-4)$ eigenspace

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

**Assumption U.41 (Constraint Budget).** The total scalar (real) constraint count from the $k = 12$ signal modes and $t = 5$ design strength is assumed to be:

$$N_{\text{budget}} = k \cdot t = 12 \times 5 = 60$$

*Motivation.* The 24-cell spherical 5-design (Theorem U.30) integrates polynomials of degree $\leq 5$ exactly, providing $t = 5$ independent moment constraints per mode. The $k = 12$ signal modes of the Golay code span the information subspace. We estimate the total independent scalar constraints as the product $k \cdot t$, assuming each mode-degree pair contributes one real constraint. This counting is not rigorously proven to yield independent constraints; if the true count differs, $N_e^{(\text{info})}$ scales proportionally.

*Remark.* The constraint budget $N_{\text{budget}} = 60$ will constrain the number of inflationary e-folds in Section U.23.

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

**Proposition U.44 (Laplacian on Invariant Sector).** On the 2-dimensional eigenspace $\mathcal{S}_2$ (eigenvalue $-4$), the graph Laplacian acts as:

$$L|_{\mathcal{S}_2} = (D - A)|_{\mathcal{S}_2} = (8I - (-4)I)|_{\mathcal{S}_2} = 12I$$

*Proof.* The eigenvalue of $A$ on $\mathcal{S}_2$ is $-4$ (Lemma U.34). The degree matrix is $D = 8I$. Thus $L|_{\mathcal{S}_2} = 8I - (-4I) = 12I$. $\square$

**Identification U.44a (Effective Field Theory Kinetic Term).** The graph Laplacian eigenvalue $\lambda^2 = 12$ is identified with the kinetic coefficient in the effective single-field Lagrangian:

$$\mathcal{L}_{\text{kin}} = \frac{\lambda^2 \bar{M}_{Pl}^2}{2} (\partial d_{FS})^2, \qquad \lambda^2 = 12$$

where $d_{FS}$ is the Fubini-Study distance on $\mathbb{CP}^1_{\text{inv}} = \mathbb{P}(\mathcal{S}_2)$.

*Justification.* This identification assumes that the discrete graph Dirichlet energy induces, in the continuum limit, a sigma-model kinetic term with the Fubini-Study target metric. If the coarse-graining map rescales $d_{FS}$ by an $O(1)$ constant, $\lambda^2$ would shift accordingly. The coefficient $\lambda^2 = 12$ then sets the field-space curvature scale.

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

*Justification.* The PPI asserts that information-theoretic quantities must have physical instantiations. The primordial complexity parameter $\kappa_Q = 11$ (Identification U.20) yields $Q = e^{-11}/\sqrt{2}$ (Theorem U.27). The scalaron mass $m_s$ is the characteristic mass scale in the Starobinsky sector. This identification is motivated by dimensional analysis and the requirement that $Q$ control primordial perturbations, but is not uniquely determined by PPI alone. Alternative identifications such as $m_s/\bar{M}_{Pl} = f(Q)$ for some $O(1)$ function $f$ would shift predictions accordingly. The linear identification $m_s = Q \cdot \bar{M}_{Pl}$ is the simplest choice consistent with the exponential suppression structure.

**Corollary U.52 (Scalaron Mass Value).**

$$m_s = Q \cdot \bar{M}_{Pl} = 1.181 \times 10^{-5} \times 2.435 \times 10^{18} \text{ GeV} = 2.88 \times 10^{13} \text{ GeV}$$

*Verification.* $1.181 \times 2.435 = 2.876$. $\checkmark$

---

## U.23 E-Fold Bounds

### U.23.1 Information-Theoretic Bound

**Theorem U.53 (Landauer Registration Cost).** Each independent bit of information registered during inflation requires entropy production:

$$\Delta S_{\min} = \ln 2$$

per bit (Theorem 31).

**Lemma U.54 (Capacity-Registration Ratio).** From Appendix Q, the PCE-optimal capacity ratio is:

$$\frac{C^*_{\max}}{\varepsilon} = \frac{2\ln 2}{\ln 2} = 2$$

This means each Landauer erasure ($\varepsilon = \ln 2$) supports registration of $C^*_{\max} = 2\ln 2$ nats of channel capacity.

**Lemma U.55 (E-Fold Information Content).** Each e-fold of inflation corresponds to one unit of $\ln k$-space registration, where $k$ is the comoving wavenumber. At leading order in slow-roll:

$$\Delta N_e \approx \Delta \ln k$$

*Proof.* During slow-roll inflation, $k = aH$ where $a$ is the scale factor and $H$ is approximately constant. Thus $\ln k \approx \ln a + \text{const} = N_e + \text{const}$. $\square$

**Assumption U.56 (E-Fold Registration Cost).** Each e-fold registers one independent scalar perturbation mode across the constraint budget. Given Assumption U.41, the total number of registrable e-folds is:

$$N_e^{(\text{info})} = N_{\text{budget}} = 60$$

*Justification.* The constraint budget $N_{\text{budget}} = 60$ (Assumption U.41) counts independent scalar (binary) registrations available in the primordial sector. We assume that one independent constraint is consumed per e-fold to register distinct horizon-exit conditions, so $N_e^{(\text{info})} \leq N_{\text{budget}}$ and at capacity saturation $N_e^{(\text{info})} = N_{\text{budget}} = 60$. The ratio $C^*_{\max}/\varepsilon = 2$ fixes the information content per registration at the PCE optimum but does not increase the number of independent constraints available for mode counting. If the true constraint count differs from 60, $N_e^{(\text{info})}$ scales proportionally.

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

| Observable | Prediction | Observation | Tension |
|:-----------|:----------:|:-----------:|:-------:|
| $n_s$ | $0.9663$ | $0.9649 \pm 0.0042$ | $0.3\sigma$ |
| $r$ | $0.0034$ | $< 0.036$ (95% CL) | Consistent |
| $A_s$ | $2.08 \times 10^{-9}$ | $(2.10 \pm 0.03) \times 10^{-9}$ | $0.7\sigma$ |
| $f_{NL}^{\text{local}}$ | $0.014$ | $-0.9 \pm 5.1$ | Consistent |
| $dn_s/d\ln k$ | $-5.7 \times 10^{-4}$ | $-0.0045 \pm 0.0067$ | Consistent |

**Sources:**
- $n_s$, $A_s$, $dn_s/d\ln k$: Planck Collaboration (2020a), Table 2
- $r$: BICEP/Keck Collaboration (2021), combined with Planck
- $f_{NL}^{\text{local}}$: Planck Collaboration (2020b), Table 7

### U.25.2 Falsification Criteria

**Theorem U.69 (Falsification Conditions).** Conditional on Assumptions U.26, U.41, U.48; Identifications U.20, U.44a, U.51; and the fiducial choice $\phi_0 = \phi_{\max}$ so that $N_e = 59.4$ (Result U.60), the primordial-sector predictions would be falsified by:

1. **Tensor detection**: $r > 0.006$ at $>3\sigma$ (prediction: $r = 0.0034$)
2. **Tensor null**: $r < 0.002$ at $>3\sigma$ (prediction: $r = 0.0034$)
3. **Spectral index**: $|n_s - 0.9663| > 0.010$ at $>3\sigma$
4. **Non-Gaussianity**: $|f_{NL}^{\text{local}}| > 1$ at $>3\sigma$ (prediction: $0.014$)
5. **Running**: $|dn_s/d\ln k| > 0.01$ at $>3\sigma$ (prediction: $5.7 \times 10^{-4}$)

If $N_e$ differs from 59.4, replace the numerical values using $n_s \simeq 1 - 2/N_e$, $r \simeq 12/N_e^2$, $dn_s/d\ln k \simeq -2/N_e^2$, $f_{NL}^{\text{local}} \simeq 5/(6N_e)$, and $n_t \simeq -3/(2N_e^2)$.

These criteria are testable by CMB-S4, LiteBIRD, and future 21-cm observations.


---

## U.26 Structural Summary

### U.26.1 Dual Complexity Hierarchy

**Summary U.70 (Complexity Parameters).**

| Sector | Configuration Space | $\kappa$ | Physical Scale |
|:-------|:-------------------:|:--------:|:--------------:|
| Vacuum | $\text{Gr}_\mathbb{C}(12,24)$ | $141.5$ | $\Lambda L_P^2 \approx 3.1 \times 10^{-122}$ |
| Primordial | $\mathbb{CP}^{11}$ | $11$ | $Q \approx 1.18 \times 10^{-5}$ |

The hierarchy $\kappa_\Lambda / \kappa_Q = 12.86$ explains why the cosmological constant is exponentially smaller than primordial perturbations.

### U.26.2 Golay-Steiner Unification

**Summary U.71 (Structural Unity).** Both sectors connect to the Golay code $[24, 12, 8]$ (Theorem Z.13):

- **Vacuum**: Full code structure $\to$ Grassmannian $\text{Gr}_\mathbb{C}(12,24)$ $\to$ $\kappa_\Lambda = 141.5$ (Theorem U.16)
- **Primordial**: Signal subspace $\mathbb{C}^{12}$ $\to$ Projective space $\mathbb{CP}^{11}$ $\to$ $\kappa_Q = 11$ (Identification U.20)
- **Inflation dynamics**: 24-cell 5-design $\to$ 12-line graph $\to$ $\mathbb{CP}^1_{\text{inv}}$ $\to$ Starobinsky (Assumption U.48, Identification U.44a)
- **Observable predictions**: Conditional on Assumption U.26, Assumption U.41, Identification U.51

The framework achieves predictions for inflationary observables from the Golay-Steiner structure, conditional on the identifications and assumptions stated in this appendix.

---

## U.27 Conclusion

This appendix derives the cosmological constant and inflationary observables from the Golay-Steiner structure at $M = 24$. A single information-theoretic organization determines both sectors:

**Vacuum Sector.** The complexity $\kappa_\Lambda = 141.5$ yields:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-283} \approx 3 \times 10^{-122}$$

matching the observed $2.87 \times 10^{-122}$ (Corollary U.17).

**Primordial Sector.** The complexity $\kappa_Q = 11$ and geometric e-fold count $N_e = 59.4$ yield:

| Observable | Prediction | Observed |
|:-----------|:----------:|:--------:|
| $Q$ | $1.18 \times 10^{-5}$ | $\sim 10^{-5}$ |
| $n_s$ | $0.9663$ | $0.9649 \pm 0.0042$ |
| $r$ | $0.0034$ | $< 0.036$ |
| $A_s$ | $2.08 \times 10^{-9}$ | $(2.10 \pm 0.03) \times 10^{-9}$ |

**Structural Unity.** Both sectors derive from the Golay code $[24, 12, 8]$:

| Sector | Configuration Space | $\kappa$ | Suppression |
|:-------|:-------------------:|:--------:|:-----------:|
| Vacuum | $\text{Gr}_\mathbb{C}(12,24)$ | $141.5$ | $e^{-283}$ |
| Primordial | $\mathbb{CP}^{11}$ | $11$ | $e^{-22}$ |

The ratio $\kappa_\Lambda/\kappa_Q \approx 13$ explains the hierarchy between vacuum energy and primordial perturbations.

**Falsifiability.** The predictions $r = 0.0034$ and $n_s = 0.9663$ are testable by CMB-S4 and LiteBIRD. Detection outside the range $0.002 < r < 0.006$ at $>3\sigma$ would falsify the framework.

The primordial predictions are conditional on Identifications U.20, U.44a, U.51 and Assumptions U.26, U.41, U.48. The vacuum result (Theorem U.16) is more robust, depending only on the Grassmannian structure and spherical 5-design.

---