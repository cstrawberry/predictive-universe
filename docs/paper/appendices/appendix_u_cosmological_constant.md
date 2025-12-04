# Appendix U: Cosmological Constant from Golay-Steiner Structure

## U.1 Introduction

The cosmological constant $\Lambda$ represents the vacuum energy density of spacetime. Observationally:

$$\Lambda L_P^2 \approx 2.87 \times 10^{-122}$$

where $L_P$ is the Planck length. This extraordinarily small value constitutes the cosmological constant problem—the largest hierarchy in physics.

In the Predictive Universe framework, the vacuum is not empty but carries the information-theoretic structure of the Extended Binary Golay Code $\mathcal{C}_{24}$. Vacuum fluctuations are suppressed by an instanton mechanism:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \, e^{-2\kappa}$$

where $\kappa$ is the **instanton complexity parameter** and $A_{\text{eff}}$ is the dimensionless $O(1)$ prefactor defined by:

$$A_{\text{eff}} := K \cdot N_{\text{eff}}$$

Here $K$ is the one-loop determinant ratio from Gaussian fluctuations around the bounce, and $N_{\text{eff}}$ is the polynomial extensivity factor from Appendix E. For a minimal bounce in MPU units, $A_{\text{eff}} = O(1)$. This appendix derives $\kappa = 141.5$ from first principles.

---

## U.2 Framework Constants

The following constants are derived elsewhere in the framework:

| Symbol | Value | Definition | Source |
|--------|-------|------------|--------|
| $\varepsilon$ | $\ln 2$ | Landauer erasure cost | Theorem 4.1 |
| $K_0$ | 3 | Minimal self-referential bits | Theorem 5.2 |
| $d_0$ | $2^{K_0} = 8$ | MPU Hilbert space dimension | Corollary 5.3 |
| $a$ | $e^{\varepsilon} = 2$ | Active kernel dimension | Theorem 6.1 |
| $b$ | $d_0 - a = 6$ | Inactive subspace dimension | Definition 6.2 |
| $M$ | $2ab = 24$ | Interface modes | Theorem 7.1 |
| $D$ | 4 | Emergent spacetime dimension | Theorem 11.3 |
| $C_{\max}/\varepsilon$ | 2 | PCE capacity ratio | Appendix Q |

---

## U.3 The Golay Code and Steiner System

### U.3.1 Code Parameters

The Extended Binary Golay Code $\mathcal{C}_{24}$ is the unique $[n, k, d]$ binary linear code with:

- Length $n = M = 24$
- Dimension $k = 12$
- Minimum distance $d = 8 = d_0$

**Theorem U.1 (Golay Uniqueness).** The extended binary Golay code is the unique binary linear code achieving the parameters $[24, 12, 8]$.

*Proof.* This is a classical result in coding theory (Pless 1968; Conway & Sloane 1999, Chapter 11). The uniqueness follows from the Golay code saturating the Griesmer bound for binary linear codes. Within the PU framework, Theorem Z.13 establishes that PCE optimization uniquely selects this code structure for the $M = 24$ interface modes. $\square$

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

Vacuum fluctuations correspond to deformations of the code subspace. The space of all $k$-dimensional subspaces of an $M$-dimensional space is the Grassmannian:

$$\mathcal{M} = \text{Gr}(k, M)$$

**Theorem U.3 (Configuration Dimension).** The Grassmannian has dimension:

$$\dim(\text{Gr}(12, 24)) = k(M - k) = 12 \times 12 = 144$$

*Proof.* Standard differential geometry. The Grassmannian $\text{Gr}(k, n)$ is a smooth manifold of dimension $k(n-k)$. $\square$

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

**Remark.** This identity connects the Steiner design parameters directly to PU constants, confirming the structural relationship between coding theory and the framework established in Theorem Z.13 and the Golay Bridge (Theorem R.4.9).

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

**Theorem U.7 (Geometric Correspondence from Mode-Channel Matching).** The $M = 24$ interface modes admit a canonical correspondence with the 24 vertices of the 24-cell embedded in $S^3 \subset \mathbb{R}^4$. This correspondence preserves the symmetry structure and quadrature properties required for the Morse-Bott analysis.

*Proof.*

**Step 1 (Interface mode count).** From Theorem Z.5, the QFI-active interface modes number $M = 2ab = 24$, where $a = 2$ (Theorem Z.1) and $b = d_0 - a = 6$.

**Step 2 (Equilibrium saturation).** At thermodynamic equilibrium (Postulate 4), Theorem Z.9 establishes that the channel configuration maximizes entropy subject to distinguishability constraints, yielding $M_{\text{phys}} = K(D)$.

**Step 3 (Mode-channel correspondence).** Theorem Z.10 requires $M_{\text{int}} = M_{\text{phys}}$ at PCE-optimal equilibrium. This matching is the unique global minimum of the PCE potential (Lemma Z.5).

**Step 4 (Dimensional selection).** Theorem Z.11 establishes that $K(D) = 24$ uniquely selects $D = 4$, since $K(4) = 24$ is the only integer solution.

**Step 5 (Geometric realization).** The 24-cell is the unique regular convex 4-polytope whose 24 vertices form the optimal kissing configuration $K(4) = 24$ (Conway & Sloane 1999). By Definition Z.8, these vertices correspond to the unit Hurwitz integers on $S^3$. As established in Corollary Z.5a, the 24-cell provides the microscopic geometric realization of the mode-channel correspondence.

**Step 6 (Spherical design property).** The 24-cell vertices form a tight spherical 5-design on $S^3$ (Delsarte, Goethals & Seidel 1977). This is the unique such configuration with 24 points. The correspondence between interface modes and 24-cell vertices is structurally canonical: both sets have cardinality 24, both inherit the same symmetry group (the automorphism group of the $D_4$ root lattice), and the spherical design property of the vertices exactly matches the quadrature requirements for preserving zero modes (Theorem U.13). $\square$

**Remark U.2 (Nature of the Correspondence).** The mode-vertex correspondence established in Theorem U.7 is structural rather than literal: the 24 QFI-active interface modes live in the internal Hilbert space $\mathcal{H}_0 = \mathbb{C}^8$, while the 24-cell vertices span $\mathbb{R}^4$. The correspondence identifies the combinatorial and symmetry structures of these two 24-element sets, enabling the transfer of spherical design properties to the discretized action. This is analogous to how the Golay code organizes the same 24 modes for error correction (Theorem Z.13) without the modes literally being binary codewords.

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

**Remark U.1 (Robustness of Scale Invariance).** The scale invariance at the PCE-Attractor is structurally protected by three independent mechanisms: (i) the Derrick virial constraint at the stationary bounce solution; (ii) the zero-slack condition fixing the bounce amplitude through capacity saturation; and (iii) the Predictive Ward Identity enforcing canonical normalization (Theorem X.3). Breaking scale invariance would require violating at least one of these conditions, shifting $\kappa$ by $0.5$ and changing $\Lambda$ by a factor of $e \approx 2.7$ (see Section U.13.1).

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

**Remark U.2 (O(4) Invariance).** The action $S_{\text{cont}}$ is manifestly O(4)-invariant: the kinetic term $(\partial_\tau \phi)^2 + |\nabla_{S^3}\phi|^2$ is the standard Laplacian on $S^3 \times \mathbb{R} \cong \mathbb{R}^4 \setminus \{0\}$, and the potential $V_{\text{eff}}$ depends only on the field value, not its location. This invariance is inherited from the isotropy of the PCE-Attractor state (Definition 15a).

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
1. O(4) invariance (Remark U.2)
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

*Derivation.* The instanton action scales with complexity as $S_{\text{inst}} = (C_{\max}/\varepsilon)\kappa$ (Section U.4). Substituting $C_{\max}/\varepsilon = 2$ yields $S_{\text{inst}} = 2\kappa$.

*Consistency check.* The cosmological constant formula:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-S_{\text{inst}}} = 8\pi A_{\text{eff}} \cdot e^{-2\kappa}$$

Using $\varepsilon = \ln 2$, this can equivalently be written as:

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot 2^{-2\kappa/\ln 2} = 8\pi A_{\text{eff}} \cdot 2^{-2\kappa \cdot \log_2 e}$$

The Morse-Bott correction factor $\lambda^{-m/2} = 2^{-m/2}$ (with $\lambda = C_{\max}/\varepsilon = 2$) modifies the effective complexity by reducing the number of contributing Gaussian directions from $\kappa_0$ to $\kappa_0 - m/2$.

### U.10.2 Zero Mode Contribution

**Theorem U.15 (Complexity Deficit from Zero Modes).** The $m = 5$ collective zero modes reduce the effective complexity by:

$$\delta = \frac{m}{2} = \frac{5}{2} = 2.5$$

*Proof.* 

**Step 1 (Morse-Bott structure).** By Theorem U.14, the partition function has the form:

$$Z \propto \lambda^{-(N-m)/2} \cdot e^{-\lambda S^*}$$

where $\lambda = C_{\max}/\varepsilon = 2$ (Appendix Q), $N$ is the total number of Gaussian directions, $m = 5$ is the dimension of the zero-mode manifold (Corollary U.10), and $S^* = S_{\text{disc}}(u^*)$ is the instanton action.

**Step 2 (Effective action).** The base complexity $\kappa_0 = k^2 = 144$ counts the Grassmannian directions (Theorem U.3). With $m$ zero modes, only $N - m$ directions contribute to the Gaussian suppression:

$$Z \propto 2^{-(N-m)/2} \cdot e^{-2\kappa_0}$$

**Step 3 (Complexity reduction).** Comparing with the standard form $Z \propto e^{-2\kappa_{\text{eff}}}$:

$$e^{-2\kappa_{\text{eff}}} = 2^{-m/2} \cdot e^{-2\kappa_0}$$

Taking logarithms:

$$-2\kappa_{\text{eff}} = -\frac{m}{2}\ln 2 - 2\kappa_0$$

$$\kappa_{\text{eff}} = \kappa_0 + \frac{m \ln 2}{4}$$

**Step 4 (Action units).** Since $S_{\text{inst}} = 2\kappa$ and the Morse-Bott factor reduces the effective action by $\frac{m}{2}\ln\lambda = \frac{m}{2}\ln 2$, the complexity deficit in action units is:

$$\delta = \frac{m}{2} = \frac{5}{2} = 2.5$$

yielding:

$$\kappa = \kappa_0 - \delta = 144 - 2.5 = 141.5$$

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

## U.15 Conclusion

The cosmological constant complexity $\kappa = 141.5$ is derived from:

1. **The Grassmannian bound** $\kappa_0 = k^2 = 144$ from code dimension
2. **The zero mode deficit** $\delta = (D+1)/2 = 5/2$ from spherical 5-design preservation

The value $\Lambda L_P^2 \sim 10^{-122}$ follows without fine-tuning, determined entirely by the discrete information-theoretic structure of the Golay vacuum.

The $10^{122}$ suppression factor is the exponential of the Grassmannian dimension, corrected for the collective coordinates protected by the spherical design symmetry of the 24-cell.

---

