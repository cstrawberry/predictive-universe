# Appendix R: Three-Generation Structure and Fermion Mass Hierarchy

## R.0 Introduction

This appendix separates generation topology, $D_4$ triality, binary coding, and lattice gluing. The anomaly+CP route carries the family-count result. Triality and the factorization $24=3\cdot8$ are compatibility records. The Golay code is selected only on the predictive-recovery branch, and a Leech lattice follows only from the registered discriminant-form/coset-minimum datum of Lemma R.4.5. None of these finite structures alone supplies masses, vacuum dynamics, or spacetime.



This appendix studies a conditional family-count branch and separate flavor-response models on the MPU perspective geometry. On the minimal Hilbert-carrier branch, $H_0\cong\mathbb C^8$ and the labeled rank-one perspective space is the complete flag manifold
$$
\Sigma_8\cong U(8)/U(1)^8.
\tag{R.1}
$$
Theorem 23 supplies the dimension lower bound under its Hilbert-carrier hypotheses, while equality $d_0=8$ uses the additional minimality branch. The family count further requires the anomaly, CP-capability, and additive-selection premises below. Fermion masses and mixings require the independent localization, label, response, scale, and remainder certificates of the flavor layer.

**Connection to Gauge Structure:** The perspective space $\Sigma_8$ and its associated topology emerge from the same fundamental structure as the Standard Model gauge group. As established in **Appendix G** (Proposition G.M1 together with the capacity-saturating, SM-type anomaly analysis of Theorem G.8.4b and Corollary G.8.4c; Section G.8.5), the MPU Hilbert space $H_0 \cong \mathbb{C}^8$ admits a thermodynamically optimal partition:
$$
H_0 \cong H_{\mathrm{active}} \oplus H_{\mathrm{inert}} \cong \mathbb{C}^2 \oplus \mathbb{C}^6
$$
using the conditional registered-reset bound $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ together with the separate structural reference $\varepsilon_0=\ln2$; no physical saturation is inferred from the attractor label alone. This partition is rigorously derived in **Appendix Z (Theorem Z.1)** via the Principle of Physical Instantiation (PPI), which fixes the active kernel dimension to $a = 2$ on the attractor-saturating branch. The partition determines both:
1. The **gauge structure:** $G_{\mathrm{SM}} = SU(3)_C \times SU(2)_L \times U(1)_Y$ in the conditional sense of Theorem G.8.4b
2. The **perspective space:** $\Sigma_8 = U(8)/U(1)^8$ (complete flag manifold)

The gauge and family sectors use related MPU branch data but have different proof obligations. Gauge selection does not imply the family count, and the family-count theorem does not imply flavor observables.

**Generation Count and Structural Compatibility:**

1. **Minimal admissible family count:** On the connected regular anomaly-descent branch, within the uniform $U(1)_F$ charge class and with nontrivial CP capability required, Theorem R.3.4 gives the smallest admissible count $N=3$. Proposition R.3.5.1a selects it only under its additive-monotone family objective. Response-null labels are removed independently by Corollary P.6.1b.8.
2. **Triality compatibility:** A marked real 8-carrier with compact $\mathfrak{so}(8)$ structure has the three-element triality orbit $\{V,S^+,S^-\}$. This does not identify $H_0\cong\mathbb C^8$ with a real vector carrier or generate $U(1)_F$.
3. **Lattice compatibility:** A registered $E_8$ root system supplies candidate squared distances $\{0,2,4,6,8\}$, and a registered Leech construction contains the scaled three-fold $E_8$ scaffold. These are compatibility and realizability data, not independent selections of family labels or flavor responses.

**Conditional mass-ratio diagnostic:** If three physical root labels are selected and the same Gaussian coefficient applies to both logarithmic ratios with controlled remainders, the leading model gives
$$
\mathcal R
:=\frac{\ln(m_3/m_1)}{\ln(m_3/m_2)}
=\frac{d_{31}^2}{d_{32}^2}
\in\left\{\frac43,\frac32,2,3,4\right\}.
$$
The charged-lepton proximity to $3$ is a retrospective model comparison. A forward prediction requires preregistered labels, response law, scale scheme, and remainder interval.

**Reading Guide:**
- **For topology only:** Sections R.1-R.3 (standard flag manifold results)
- **For generation counting:** Sections R.1-R.4.1 (topological derivation), together with Section R.4.2 for $D_4$ triality and $E_8$/Leech compatibility checks
- **For mass hierarchy:** Sections R.5-R.7 ($E_8$ geometry, Yukawa derivation)
- **For phenomenology:** Section R.6 (experimental comparison)
- **For complete derivation:** Read sequentially R.0-R.9

Three pillars drive the derivation:

1. **Topology:** The second homotopy group of the Perspective Space, $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$, provides seven independent integer topological charges.
2. **Gauge–Topology Correspondence:** A representation-theoretic map from the cohomology group $H^2(\Sigma_8; \mathbb{Z})$ to the weight lattice of the emergent gauge group is established.
3. **PCE-based Selection:** Physical viability is enforced by constraints of non-Abelian charge neutrality and Abelian anomaly cancellation across topological sectors, together with energetic and complexity minimization dictated by the Principle of Compression Efficiency (PCE).

A precise "gauge–topology correspondence" is proved: any embedding of the SM gauge group $G_{\rm SM}$ acting on $H_0$ induces a homomorphism from $\pi_2(\Sigma_8)$ to the Cartan weight lattice of $G_{\rm SM}$. This consequently yields a center character map, e.g., to $Z(SU(3)) \cong \mathbb{Z}_3$. Non-Abelian neutrality then selects a "light sublattice" $L_{\rm light}\subset\mathbb{Z}^7$. To achieve a nontrivial multi-sector structure while preserving SM gauge invariance of Yukawa couplings, we introduce a family $U(1)_F$ whose charges are induced by topology; anomaly cancellation for this Abelian factor across sectors, combined with the requirement of CP violation for baryogenesis, forces a minimal three-sector solution with offsets $\{a,-a,0\}$. A worked instance, based on a physically motivated, PCE-compatible ansatz for embedding the first-generation fermions, provides explicit Cartan charge vectors, a primitive basis of $L_{\rm light}$, the minimal family-charge unit $a$, and three minimal-norm sector vectors. A PCE-compatible potential on $\Sigma_8$ selects sector minima; Gaussian semiclassics on this Kähler target yields Yukawa matrices from overlap integrals, producing exponentially hierarchical masses and small mixings determined by geodesic separations and local Hessians.

## R.0.1 Notation and Conventions

To aid clarity, we summarize the key mathematical objects and their notation:

| Symbol | Meaning | Defined In |
|--------|---------|------------|
| $H_0$ | MPU Hilbert space, $\mathbb{C}^8$ | Theorem 23 |
| $\Sigma_8$ | Perspective Space on the ordered rank-one context branch, $U(8)/U(1)^8$ | Corollary 26 |
| $\pi_2(\Sigma_8)$ | Second homotopy group, $\mathbb{Z}^7$ | Theorem R.1.1 |
| $\omega_i$ | Generators of $H^2(\Sigma_8;\mathbb{Z})$ | Eq. R.4 |
| $q = (q_1,\ldots,q_7)$ | Topological charge vector | Eq. R.6 |
| $G_{\mathrm{SM}}$ | SM gauge group, $SU(3)_C \times SU(2)_L \times U(1)_Y$ | Appendix G.8 |
| $L_{\mathrm{light}}$ | Light sublattice (non-Abelian neutral) | Definition R.3.2 |
| $U(1)_F$ | Emergent family symmetry | Section R.4 |
| $F(q)$ | Family charge of sector $q$ | Theorem R.3.4 |
| $\mathrm{Rep}$ | Predictive block (fermion representation) | Definition R.3.3 |
| $E[q]$ | Energy in a fixed topological sector (infimum over maps) | Theorem R.3.0 |
| $p_g$ | Vacuum minimum for generation $g$ | Section R.5.2 |
| $Y_{gg'}$ | Yukawa coupling matrix element | Eq. R.15 |
| $M$ | Interface mode count, 24 | Appendix Z, Theorem Z.5 |
| $E_8$ | Exceptional Lie group / root system | Section R.2.1 |
| $D_4$ | Root system of $\mathfrak{so}(8)$; triality compatibility scaffold | Proposition R.4.2 |
| $\Lambda_{24}$ | Leech lattice in 24 dimensions | Section R.4.2 |
| $\mathcal{R}$ | Mass hierarchy invariant | Eq. R.17 |

**Conventions:**
- Generators of $SU(N)$ are anti-Hermitian in the Lie algebra
- Chern classes $c_1(L)$ take values in $H^2(M; \mathbb{Z})$
- Geodesic distance $d_\Sigma(p, p')$ uses the natural Kähler metric on $\Sigma_8$
- PCE costs are measured in nats (natural logarithm units)

## R.1 The MPU's Perspective Space and Its Topology

Let $\Sigma_8 := U(8)/U(1)^8$ be the complete flag manifold of $\mathbb{C}^8$. It is a compact, simply connected Kähler manifold of complex dimension $28$ and real dimension $56$.

### R.1.1 Theorem R.1.1 (Homotopy of $\Sigma_8$).

The Perspective Space $\Sigma_8$ is simply connected and its second homotopy group is $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$.

*Proof.* The quotient map $U(8)\to U(8)/T^8=\Sigma_8$ is a principal $T^8$-bundle. The long exact homotopy sequence of a fibration (Hatcher 2002) contains
$$
\pi_2(U(8))\longrightarrow\pi_2(\Sigma_8)
\longrightarrow\pi_1(T^8)\xrightarrow{i_*}\pi_1(U(8))
\longrightarrow\pi_1(\Sigma_8)\longrightarrow\pi_0(T^8).
\tag{R.2}
$$
The torus is connected, so $\pi_0(T^8)=0$, and
$$
\pi_1(T^8)=\pi_1(U(1))^8\cong\mathbb Z^8.
$$
Bott periodicity (Bott 1959) gives $\pi_2(U(8))=0$. The determinant fibration
$$
SU(8)\longrightarrow U(8)\xrightarrow{\det}U(1)
$$
and simple connectedness of $SU(8)$ give $\pi_1(U(8))\cong\pi_1(U(1))\cong\mathbb Z$. For a diagonal torus loop with winding vector $(k_1,\ldots,k_8)$, its determinant is the product of the eight diagonal loops, whose winding number is
$$
i_*(k_1,\ldots,k_8)=\sum_{r=1}^8k_r.
$$
This map is surjective because $i_*(1,0,\ldots,0)=1$. Exactness therefore gives
$$
\pi_1(\Sigma_8)\cong\operatorname{coker}i_*=0
$$
and
$$
\pi_2(\Sigma_8)
\cong\ker i_*
=\{(k_1,\ldots,k_8)\in\mathbb Z^8:\sum_rk_r=0\}
\cong\mathbb Z^7.
\tag{R.3}
$$
∎

### R.1.2 Topological generators and cohomology in degree two

Let $0 \subset S_1 \subset S_2 \subset \dots \subset S_8$ be the universal flag of tautological subbundles over $\Sigma_8$, where $S_8$ is the trivial bundle $\mathbb{C}^8 \times \Sigma_8$, and $\operatorname{rank}(S_k) = k$. Define the tautological quotient line bundles $Q_k := S_k/S_{k-1}$ and their first Chern classes $x_k := c_1(Q_k) \in H^2(\Sigma_8; \mathbb{Z})$ (Milnor & Stasheff 1974; Griffiths & Harris 1978). The total Chern class of the ambient rank-8 bundle $S_8$ is trivial, which implies $\sum_k x_k = 0$ in $H^2(\Sigma_8; \mathbb{Z})$.

An integral basis for $H^2(\Sigma_8; \mathbb{Z})$ is given by differences of these Chern classes (Brion 2005; Fulton 1997):

$$
\omega_i := x_i - x_{i+1}, \quad i = 1, \dots, 7.
\tag{R.4}
$$

Since $\Sigma_8$ is simply connected, the Hurewicz map gives $\pi_2(\Sigma_8)\cong H_2(\Sigma_8;\mathbb{Z})$. The classes $\omega_i$ form an integral basis of $H^2(\Sigma_8;\mathbb{Z})$, and for any $f:S^2\to\Sigma_8$ the integers $q_i=\langle \omega_i, f_*[S^2]\rangle$ determine the corresponding element of $\pi_2(\Sigma_8)$ via this identification. Concretely, for a smooth map $f:S^2\to \Sigma_8$, define the Chern integers

$$
k_i := \int_{S^2} f^*(x_i)\in \mathbb{Z}.\tag{R.5}
$$
These integers must satisfy the constraint $\sum_{i=1}^8 k_i=0$, inherited from $\sum_i x_i = 0$.
The topological charges are defined as:

$$
q_i := \int_{S^2} f^*(\omega_i) = k_i-k_{i+1},\qquad i=1,\dots,7.\tag{R.6}
$$

A topological sector is specified by a charge vector $q = (q_1,\dots,q_7)\in\mathbb{Z}^7$. The configuration space of the theory decomposes into disconnected sectors labeled by these charges.

## R.2 $E_8$ as Information-Optimal Geometry in Eight Dimensions

### R.2.1 Motivation and Optimality

The relevant state-space for a single MPU includes pure states ($\mathbb{CP}^7$) and the perspective space $\Sigma_8 = U(8)/U(1)^8$ governing measurements and transitions. Finite physical resources and PCE optimization favor discrete coordinatizations that maximize packing density, minimize distortion, and maximize symmetry for uniform local neighborhoods.

In eight dimensions, the **$E_8$ root system** emerges as the natural coordinatization of the 8-dimensional real subspace (weight space / Cartan subalgebra) for several converging reasons:

1. **Packing optimality:** The $E_8$ lattice achieves the optimal sphere packing density in 8 dimensions (Viazovska 2017). This supplies a canonical discrete scaffold on the 8D real subspace that can organize internal "positions" efficiently.

2. **Division algebra structure:** The framework's $d_0 = 8$ is related to octonionic structure via the Radon-Hurwitz theorem (**Appendix Z, Theorem Z.3**), which constrains division algebras to dimensions $\{1, 2, 4, 8\}$. **Appendix Z (Corollary Z.2)** establishes the octonionic connection: the existence of octonions (dimension 8) is tied to the maximal value $\rho(8) = 8$ in the Radon-Hurwitz function, providing a secondary coherence check on the 8-dimensional branch rather than the proof of necessity for $d_0 = 8$. The $E_8$ root system naturally encodes this octonionic structure.

3. **Maximal symmetry:** The 240 roots of $E_8$ provide maximal symmetry for uniform local neighborhoods, consistent with PCE's preference for high-symmetry configurations that minimize descriptive complexity.

**Conclusion:** $E_8$ provides a privileged, symmetry-rich, discrete internal geometry consistent with PCE motivations. We adopt $E_8$ as the canonical internal coordinate system on the effective 8D real subspace.

**Remark R.2.0: $E_8$ Uniqueness from Information-Theoretic Optimality.**

Several factors single out $E_8$ as the natural geometric structure for the 8-dimensional MPU state space, all deriving from information-theoretic optimality principles consistent with PCE:

1. **Rank Matching:** $E_8$ has rank 8, matching the 8-dimensional Cartan subalgebra (weight space) relevant to $U(8)$.

2. **Sphere Packing Optimality:** The $E_8$ lattice achieves the optimal sphere packing density in 8 dimensions (Viazovska 2017), minimizing wasted volume. This aligns with PCE's drive for maximal information density per unit volume, as optimal packing maximizes the number of distinguishable states in a bounded region.

3. **Kissing Number Maximization:** $E_8$ has kissing number 240, the maximum for any lattice in 8 dimensions. This maximizes local distinguishability—each lattice point contacts exactly 240 nearest neighbors, providing the densest local error-correction structure. Higher kissing numbers correspond to more robust error correction under PCE.

4. **Radon-Hurwitz Connection and Cayley Integers:** The same $d_0 = 8$ branch already fixed by SPAP and PCE is also the octonionic Radon-Hurwitz dimension (**Theorem Z.3**, Appendix Z). This does not prove $d_0 = 8$ inside PU; it provides a secondary algebraic coherence check. The $E_8$ lattice is isomorphic to the ring of Cayley integers (integral octonions), defined as the $\mathbb{Z}$-span of $\{1, e_1, \ldots, e_7, \omega\}$ where $\omega = \tfrac{1}{2}(1 + e_1 + \cdots + e_7)$ and $\{e_i\}$ are the standard octonion units (Conway & Sloane 1999). The norm form $N(x) = x\bar{x}$ on the Cayley integers is positive-definite with minimum value 1 on non-zero elements, and the set of unit-norm elements $\{x : N(x) = 1\}$ has cardinality exactly 240, matching the $E_8$ root count. This supplies a secondary algebraic bridge between the $d_0 = 8$ branch and the geometric optimality of $E_8$.

5. **Self-Duality:** $E_8$ is self-dual, meaning $E_8^* = E_8$. This symmetry simplifies the geometric structure, eliminates arbitrary orientation choices, and ensures that the dual lattice (relevant for Fourier transforms in quantum mechanics) coincides with the original. Self-duality is a natural PCE attractor as it minimizes representational redundancy.

6. **Leech Lattice Connection:** The 24-dimensional Leech lattice $\Lambda_{24}$, which achieves the optimal sphere packing density in 24 dimensions (Cohn, Kumar, Miller, Radchenko & Viazovska 2017), contains a sublattice isometric to $\sqrt{2}E_8 \oplus \sqrt{2}E_8 \oplus \sqrt{2}E_8$; by contrast, the direct sum $E_8 \oplus E_8 \oplus E_8$ is a distinct Niemeier lattice (minimum norm 2). This provides A registered occurrence of this sublattice is compatible with the three-block rank count in Section R.4.2. It neither supplies the required Leech gluing datum nor derives a physical three-family map from $M=24$.



7. **Root-Kissing Correspondence:** The $E$-series exceptional lattices exhibit a remarkable algebraic-geometric correspondence: for $n \in \{6, 7, 8\}$, the root count $|\Phi(E_n)|$ equals the kissing number achieved by the corresponding lattice:

| $n$ | Root count $\lvert\Phi(E_n)\rvert$ | Kissing number | Optimality status |
|-----|--------------------------|----------------|-------------------|
| 6   | 72                       | 72             | Best known; optimality unproven |
| 7   | 126                      | 126            | Best known; optimality unproven |
| 8   | 240                      | 240            | Proven optimal (Odlyzko & Sloane 1979) |

Among the $E$-series, only for $n = 8$ has the kissing number been proven optimal (Odlyzko & Sloane 1979). Additionally, Viazovska (2017) proved that $E_8$ achieves the optimal sphere packing density in dimension 8. This singles out $E_8$ as the unique member of the $E$-series with certified geometric optimality in both kissing number and packing density.

**Summary of $E_8$ Structural Properties:**

| Property | $E_8$ value | PCE relevance |
|----------|-------------|---------------|
| Self-dual | $E_8^* = E_8$ | Eliminates dual-lattice representational overhead |
| Simply-laced | All roots equal length | Single scale parameter minimizes complexity |
| Unimodular | $\det(\text{Gram matrix}) = 1$ | Minimal volume distortion under embedding |
| Kissing number | 240 (proven maximal) | Maximum local distinguishability |

The even unimodular lattices in dimension 8 are classified: $E_8$ is the unique such lattice (Conway & Sloane 1999).

**Comparison with Other Exceptional Root Systems:**
- **$E_6, E_7$:** Ranks 6 and 7 respectively, not matching the MPU dimension 8.
- **$F_4$:** Rank 4; kissing number 24 $\ll$ 240 of $E_8$.
- **$G_2$:** Rank 2; kissing number 6 $\ll$ 240 of $E_8$.

**Comparison with Other Rank-8 Simple Lie Algebras:**

| Algebra | Root count | Simply-laced | Self-dual lattice | Packing optimal |
|---------|------------|--------------|-------------------|-----------------|
| $A_8$   | 72         | ✓            | ✓                 | ✗               |
| $B_8$   | 128        | ✗            | ✗                 | ✗               |
| $C_8$   | 128        | ✗            | ✗                 | ✗               |
| $D_8$   | 112        | ✓            | ✓                 | ✗               |
| $E_8$   | 240        | ✓            | ✓                 | ✓               |

Among all simple Lie algebras of rank 8, only $E_8$ satisfies the full set of PCE optimality criteria: the simply-laced property ensures a single scale parameter, self-duality eliminates dual-lattice representational overhead, and packing optimality maximizes information density per unit volume.

Thus $E_8$ is singled out by the conjunction of (i) uniqueness as the even unimodular lattice in dimension 8 and (ii) provably optimal packing density in dimension 8. We therefore adopt $E_8$ as the canonical discrete scaffold on the effective 8D real subspace.

### R.2.2 $E_8$ Root System Structure

The $E_8$ root system in $\mathbb{R}^8$ consists of 240 vectors of squared length 2:

- **Type I (112 roots):** All permutations of $(\pm 1, \pm 1, 0, 0, 0, 0, 0, 0)$ with all possible sign combinations. There are $\binom{8}{2} = 28$ ways to choose two positions, and 4 sign patterns $\{(+,+), (+,-), (-,+), (-,-)\}$ for each choice, giving $28 \times 4 = 112$ roots.

- **Type II (128 roots):** All sign patterns of $(\pm 1/2, \pm 1/2, \ldots, \pm 1/2)$ with an even number of minus signs. There are $2^8 = 256$ total sign patterns; requiring even parity gives $256/2 = 128$ roots.

**Inner products and distances:** For distinct $E_8$ roots $r, s$ with $|r|^2 = |s|^2 = 2$:
- Inner products: $r \cdot s \in \{-1, 0, 1\}$ for $r \neq \pm s$
- Squared distances: $|r - s|^2 = 4 - 2r \cdot s \in \{2, 4, 6\}$
- For antipodal roots $s = -r$: $|r - s|^2 = 8$

**Discrete distance set:** The allowed squared distances between $E_8$ roots are:
$$
d^2 \in \{2, 4, 6, 8\}
\tag{R.7}
$$

**Existence of neighbors:** For any chosen "heaviest" root $r_3$, there exist roots $r_2, r_0, r_1$ such that:
- $r_3 \cdot r_2 = +1$ (distance² = 2)
- $r_3 \cdot r_0 = 0$ (distance² = 4)
- $r_3 \cdot r_1 = -1$ (distance² = 6)

This follows from the simply-laced structure and the combinatorics of Type II roots: given any Type II root, flipping 2 signs gives a root with dot product +1, flipping 4 signs gives dot product 0, and flipping 6 signs gives dot product -1 (preserving even parity of minus signs).

### R.2.3 Pedagogical Example: $E_8$ Root Distances and Mass Ratios

To make the $E_8$ geometry concrete, we provide an explicit example of root distances and their implications for mass ratios.

**Example R.2.1 (Squared Distances Between $E_8$ Roots).**
Consider three roots in the $E_8$ root system expressed in the standard orthonormal basis of $\mathbb{R}^8$:
$$
\begin{align}
\alpha_1 &= (1, -1, 0, 0, 0, 0, 0, 0), \\
\alpha_2 &= (0, 1, -1, 0, 0, 0, 0, 0), \\
\alpha_3 &= \left(\tfrac{1}{2}, \tfrac{1}{2}, \tfrac{1}{2}, \tfrac{1}{2}, \tfrac{1}{2}, \tfrac{1}{2}, \tfrac{1}{2}, \tfrac{1}{2}\right).
\end{align}
$$

The squared Euclidean distances are:
$$
\begin{align}
d^2(\alpha_1, \alpha_2) &= |\alpha_1 - \alpha_2|^2 = |(1, -2, 1, 0, 0, 0, 0, 0)|^2 = 1 + 4 + 1 = 6, \\
d^2(\alpha_1, \alpha_3) &= \left|\left(\tfrac{1}{2}, -\tfrac{3}{2}, -\tfrac{1}{2}, -\tfrac{1}{2}, -\tfrac{1}{2}, -\tfrac{1}{2}, -\tfrac{1}{2}, -\tfrac{1}{2}\right)\right|^2 = \tfrac{1}{4} + \tfrac{9}{4} + 6 \cdot \tfrac{1}{4} = 4, \\
d^2(\alpha_2, \alpha_3) &= \left|\left(-\tfrac{1}{2}, \tfrac{1}{2}, -\tfrac{3}{2}, -\tfrac{1}{2}, -\tfrac{1}{2}, -\tfrac{1}{2}, -\tfrac{1}{2}, -\tfrac{1}{2}\right)\right|^2 = \tfrac{1}{4} + \tfrac{1}{4} + \tfrac{9}{4} + 5 \cdot \tfrac{1}{4} = 4.
\end{align}
$$

All values lie in the allowed set $\{2, 4, 6, 8\}$. These are the **only** possible squared distances between $E_8$ roots—a discrete geometric constraint arising from the root system structure with no continuous parameters.

**Mass Ratio Implication:**
If three generation vacua $v_1, v_2, v_3$ in the Perspective Space project onto $E_8$ roots with these relative separations, the mass ratio invariant becomes:
$$
\mathcal{R} = \frac{d^2(v_3, v_1)}{d^2(v_3, v_2)} = \frac{6}{4} = \frac{3}{2}.
$$

On the Appendix T hierarchy-model branch, the charged-lepton triad $(d^2_{32},d^2_{31},d^2_{21})=(2,6,4)$ is a forward-locked distance assignment. Neither $D_4$, active/inactive dimension counts, Golay data, nor Leech gluing uniquely fixes those physical pair labels. The algebraic ratio of the assigned distances is $\mathcal R_\ell=3$; comparison with $\mathcal R_\ell^{obs}\approx2.889$ and the fourth-order adjustment are conditional model tests under Theorems T.42.2, T.42.5, and T.42.6.



## R.3 Gauge–Topology Correspondence

### R.3.1 Theorem R.3.0 (Global topological neutrality).

For any finite-energy configuration on $\mathbb{R}^3$ that approaches a fixed vacuum at spatial infinity and contains finitely many localized sector defects whose charges are $\{q^{(g)}\}\subset \pi_2(\Sigma_8)$ (measured on small linking $2$-spheres), the net charge must vanish:
$$
\sum_g q^{(g)} = 0.
\tag{R.8}
$$

*Proof.* Let $\phi:\mathbb{R}^3\setminus\{x_1,\dots,x_N\}\to\Sigma_8$ be smooth with $\phi(x)\to p_\ast$ as $|x|\to\infty$. Choose disjoint small spheres $S^2_g$ enclosing each defect point $x_g$ and a large sphere $S^2_\infty$ enclosing all defects. Then $\mathbb{R}^3\setminus\{x_g\}$ deformation retracts onto a manifold whose boundary is $\partial W = S^2_\infty \sqcup \bigsqcup_g (-S^2_g)$. Pushing forward the fundamental classes by $\phi$ and using that $\partial W$ bounds $W$ gives, in $H_2(\Sigma_8;\mathbb{Z})$,
$$
\phi_\ast[S^2_\infty] - \sum_g \phi_\ast[S^2_g] = 0.
$$
Because $\phi$ is constant on $S^2_\infty$ (vacuum boundary condition), $\phi_\ast[S^2_\infty]=0$. Hence $\sum_g \phi_\ast[S^2_g]=0$ in $H_2(\Sigma_8;\mathbb{Z})$. Using $\pi_2(\Sigma_8)\cong H_2(\Sigma_8;\mathbb{Z})$ (Theorem R.1.1), this is exactly $\sum_g q^{(g)}=0$.

(For later use, one may define $E[q]:=\inf\{E[\psi]:\psi:S^2\to\Sigma_8,\ [\psi]=q\}\ge 0$, with $E[0]=0$ realized by constant maps.) ∎

### R.3.2 Embedding and the charge map

**Definition R.3.1 (SM gauge embedding).** An embedding of the SM gauge group (Slansky 1981) is a Lie group homomorphism
$$
\iota: G_{\mathrm{SM}} = SU(3)_C \times SU(2)_L \times U(1)_Y \hookrightarrow U(8)
$$
that factors through the stabilizer of some reference flag, thereby descending to an action of $G_{\mathrm{SM}}$ on $\Sigma_8$.

**Theorem R.3.1 (Gauge–topology correspondence).** Any embedding $\iota: G_{\mathrm{SM}} \hookrightarrow U(8)$ induces a homomorphism
$$
\Phi: \pi_2(\Sigma_8) \to \Lambda_{\mathrm{Cartan}}(G_{\mathrm{SM}}),
$$
from the topological charge group to the Cartan weight lattice of the SM gauge group.

*Proof.* Fix a maximal torus $T_{\mathrm{SM}}\subset G_{\mathrm{SM}}$ and conjugate inside $U(8)$ so that $\iota(T_{\mathrm{SM}})$ lies in the diagonal torus $T^8\subset U(8)$. The induced action of $T_{\mathrm{SM}}$ on $\mathbb{C}^8$ is therefore diagonal, giving eight characters (weights) $\lambda_1,\dots,\lambda_8\in\Lambda_{\mathrm{Cartan}}(G_{\mathrm{SM}})$.

For any map $f:S^2\to\Sigma_8$, let $x_k=c_1(Q_k)\in H^2(\Sigma_8;\mathbb{Z})$ be the tautological classes (Section R.1.2) and set
$$
k_k := \langle x_k, f_*[S^2]\rangle \in \mathbb{Z}.
$$
Define
$$
\Phi([f]) := \sum_{k=1}^8 k_k\,\lambda_k \ \in\ \Lambda_{\mathrm{Cartan}}(G_{\mathrm{SM}}).
$$
This is well-defined on $\pi_2(\Sigma_8)$ because each $k_k$ depends only on the homotopy class of $f$, and it is a group homomorphism because the Kronecker pairing is additive under the $\pi_2$ group law and the $\lambda_k$ are fixed. Finally, $\Phi([f])$ lies in the Cartan lattice by construction: it is an integral linear combination of weights of the $T_{\mathrm{SM}}$-representation on $\mathbb{C}^8$. ∎

### R.3.3 Light sublattice and non-Abelian neutrality

**Definition R.3.2 (Light sublattice).** Let $v_{c_1}, v_{c_2}, v_t$ be the charge-map vectors for the $SU(3) \times SU(2)$ Cartan generators. Stack these as rows of $C \in \mathrm{Mat}_{3\times 7}(\mathbb{Z})$. The **light sublattice** is the integer kernel:
$$
L_{\rm light} := \ker_{\mathbb{Z}} C = \{ q \in \mathbb{Z}^7 : C q = 0 \}.
\tag{R.9}
$$

These are topological charges neutral under $SU(3)\times SU(2)$. Sectors $q \notin L_{\rm light}$ carry non-Abelian charges and are penalized by PCE.

**Proposition R.3.3 (Center neutrality in the light sublattice).** For any $q \in L_{\rm light}$, its $SU(3)$ center charge is trivial: $\tau(q) = 0 \in \mathbb{Z}_3$.

*Proof.* If $q \in L_{\rm light}$, then $v_{c_1} \cdot q = v_{c_2} \cdot q = 0$ by Definition R.3.2. Hence $\tau(q)\equiv (v_{c_1}\cdot q + 2\,v_{c_2}\cdot q)\pmod 3 = 0$. ∎

### R.3.4 Index theory and anomaly constraints

**Definition R.3.3 (Predictive block).** A predictive block $\mathrm{Rep}$ is a representation of $G_{\mathrm{SM}}$ on a finite-dimensional Hilbert space, corresponding to a collection of chiral fermions with specified gauge quantum numbers. For the Standard Model, a single generation forms one predictive block.

**Lemma R.IDX1 (Atiyah--Singer Index Formula for a Twisted Chiral Dirac Operator).**
Let $M$ be a smooth closed even-dimensional Riemannian spin manifold, let $S^\pm\to M$ be its chiral spinor bundles, and let $E_{\mathrm{Rep}}\to M$ be a smooth Hermitian vector bundle with a compatible connection $A$. The coupled chiral Dirac operator
$$
\not D_A^+:\Gamma(S^+\otimes E_{\mathrm{Rep}})
\longrightarrow
\Gamma(S^-\otimes E_{\mathrm{Rep}})
$$
is Fredholm and satisfies
$$
\operatorname{Ind}(\not D_A^+)
=\int_M\left[\widehat A(TM)\,\operatorname{ch}(E_{\mathrm{Rep}})\right]_{\dim M}.
\tag{R.10}
$$

*Proof.* The principal symbol of $\not D_A^+$ is Clifford multiplication by a nonzero cotangent vector and is invertible away from the zero section, so the operator is elliptic. Because $M$ is closed, elliptic regularity makes its kernel and cokernel finite-dimensional and its image closed; hence it is Fredholm. The Atiyah--Singer index theorem for twisted Dirac operators (Atiyah and Singer 1968a) applies to the closed spin manifold and the smooth complex twisting bundle and gives
$$
\operatorname{Ind}(\not D_A^+)
=\left\langle\widehat A(TM)\operatorname{ch}(E_{\mathrm{Rep}}),[M]\right\rangle,
$$
which is the displayed integral of the top-degree component. The formal adjoint is $\not D_A^-$, so
$$
\operatorname{Ind}(\not D_A^+)
=\dim\ker\not D_A^+-\dim\ker\not D_A^-.
$$
In four dimensions this is the left-minus-right zero-mode count for the declared chirality convention. ∎

**Corollary R.IDX1.1 (Degree-4 characteristic-class form).**
In 4D, only the degree-4 part contributes:
$$
\operatorname{Ind}(\not D_A)
\ =\ \int_M \left[\ -\tfrac{1}{24}\,p_1(TM)\ \mathrm{rk}(E_{\mathrm{Rep}})\ +\ \tfrac12\,c_1(E_{\mathrm{Rep}})^2\ -\ c_2(E_{\mathrm{Rep}})\ \right],
$$
with the usual identifications $c_i,\,p_1$ built from the $U(1),SU(2),SU(3)$ curvatures (and their hypercharge embedding inside $c_1$).

**Lemma R.IDX2 (Anomaly additivity and block replication).**
Let $I_6(\mathrm{Rep})$ be the perturbative gauge-anomaly polynomial (the 6-form) of the chiral content in one predictive block $\mathrm{Rep}$; additivity of the Chern character over direct sums implies
$$
I_6(\mathrm{Rep}_1\oplus \mathrm{Rep}_2) = I_6(\mathrm{Rep}_1) + I_6(\mathrm{Rep}_2).
$$
Hence, for $k$ identical blocks, $I_6(\mathrm{Rep}^{\oplus k}) = k\,I_6(\mathrm{Rep})$.

In particular, if a single predictive block is anomaly-free (all cubic/mixed gauge anomalies and mixed gauge-gravitational anomalies vanish, including the global SU(2) parity constraint), then any number $k$ of replicated blocks remains anomaly-free.

*Proof.* The perturbative anomaly polynomial in 4D is $\mathrm{ch}_3(E_{\mathrm{Rep}})$ plus mixed terms involving $c_1(E_{\mathrm{Rep}})$ and $p_1(TM)$; all are linear in $\mathrm{ch}(E_{\mathrm{Rep}})$, which is additive under direct sums. The global SU(2) anomaly (Witten 1982) depends on the parity of the number of SU(2) doublets; replication multiplies that number by $k$, so if one block has an even count, every replicated theory does as well. ∎

**Remark: Predictive block and SM-like content.**
The block structure $H_x\cong\mathbb C\oplus\mathbb C^2\oplus\mathbb C^3$ from Appendix G naturally yields associated bundles whose Chern classes reproduce the usual $U(1)$, $SU(2)$, $SU(3)$ contributions. In that setting, Lemma R.IDX1 pins the net chirality per block to the topological pairing $\langle \widehat A\,\mathrm{ch},[M]\rangle$, while Lemma R.IDX2 guarantees that once a single predictive block satisfies the anomaly constraints, any number of generations (blocks) preserves them automatically.

**Proposition R.IDX2a (Flag-Lift Index Representation of the Minimal Family Branch).** Let
$$
\widetilde X=\mathrm{Flag}_{1,2,3}(Q)
$$
be the minimal flag lift of Theorem G.8.4e.1. On the minimal anomaly-and-CP family branch of Theorem R.3.4, the selected family-charge set is
$$
\{a,-a,0\},
$$
so the generation vector space is
$$
V_{\mathrm{gen}}\cong\mathbb C^3.
$$
Define the generation bundle
$$
E_{\mathrm{gen}}:=\mathcal O_{\widetilde X}\otimes V_{\mathrm{gen}}.
$$
Then the Dolbeault index is
$$
\operatorname{Ind}_{\widetilde X}(\overline\partial_{E_{\mathrm{gen}}})
:=
\sum_{q\ge0}(-1)^q
\dim H^q(\widetilde X,E_{\mathrm{gen}})
=
3.
$$

*Proof.* The flag lift is the compact rational homogeneous space
$$
\widetilde X\cong SU(8)/S(U(2)\times U(1)\times U(2)\times U(3))
$$
by Proposition G.8.4e.1a. For a compact rational homogeneous flag manifold, Borel-Weil-Bott applied to the trivial weight gives
$$
H^0(\widetilde X,\mathcal O_{\widetilde X})\cong\mathbb C,
\qquad
H^q(\widetilde X,\mathcal O_{\widetilde X})=0
\quad(q>0).
$$
Since
$$
E_{\mathrm{gen}}=\mathcal O_{\widetilde X}\otimes\mathbb C^3,
$$
cohomology commutes with tensoring by the finite-dimensional vector space $\mathbb C^3$:
$$
H^q(\widetilde X,E_{\mathrm{gen}})
\cong
H^q(\widetilde X,\mathcal O_{\widetilde X})\otimes\mathbb C^3.
$$
Therefore
$$
H^0(\widetilde X,E_{\mathrm{gen}})\cong\mathbb C^3,
\qquad
H^q(\widetilde X,E_{\mathrm{gen}})=0
\quad(q>0).
$$
Thus
$$
\operatorname{Ind}_{\widetilde X}(\overline\partial_{E_{\mathrm{gen}}})
=
\dim\mathbb C^3
=
3.
$$
The index therefore represents the minimal family count selected by Theorem R.3.4 on the flag lift. It does not replace Theorem R.3.4; it globalizes its selected three-family branch as an index statement. ∎

**Theorem R.3.4 (Family-Charge Anomaly Constraints on the Regular Descent Branch).**

Let $\{q^{(g)}\}\subset L_{\rm light}$ be the set of realized light sectors. Assume that each sector is a full Standard Model generation with identical $G_{\rm SM}$ charges and uniform family charge $F_g:=f\cdot q^{(g)}$, where $f$ is a specified dual-lattice vector. Assume also the connected regular source domain of Theorem X.8d, with $Z_x[J]\ne0$ for every admitted object and source, and treat $U(1)_F$ as a predictive-frame redundancy. Finally, assume that the admitted global/torsion anomaly ledger contains no additional class, or supply a cancellation certificate for every such class. Then predictive descent requires
$$
\sum_gF_g=0,
\qquad
\sum_gF_g^3=0.
\tag{R.11}
$$
Within this uniform-charge class, the pattern $\{a,-a,0\}$ with $a\ne0$ is the smallest family count satisfying these equations and admitting a physical CKM phase. The anomaly equations admit larger solutions. If $U(1)_F$ is treated as a physical global update channel, Theorem X.8d does not require quotient descent.

*Proof.* Assume $U(1)_F$ is an emergent family symmetry for which every chiral fermion in generation $g$ carries the same family charge $F_g$ (i.e., the $g$-th predictive block is replicated with a uniform $U(1)_F$ charge).

Because each generation carries identical Standard Model representations, every mixed anomaly with a single $U(1)_F$ insertion is a fixed nonzero coefficient per generation multiplied by $F_g$. Therefore the mixed anomalies $SU(3)^2U(1)_F$, $SU(2)^2U(1)_F$, $U(1)_Y^2U(1)_F$, and the mixed gravitational anomaly are all proportional to $\sum_g F_g$, giving the first condition in (R.11). The purely cubic anomaly $U(1)_F^3$ is proportional to $\sum_g F_g^3$, giving the second condition in (R.11). (The mixed anomaly $U(1)_Y U(1)_F^2$ vanishes because $\sum Y=0$ within each Standard Model generation.)

Now consider solutions:

- **$N=1$.** Then $\sum_g F_g=0$ forces $F_1=0$.

- **$N=2$.** Then $\sum_g F_g=0$ forces $\{F_1,F_2\}=\{a,-a\}$, and $\sum_g F_g^3=0$ holds automatically. However, with two generations the CKM matrix has no physical complex phase after field rephasings, so $J_{\mathrm{CP}}=0$ and there is no CP violation.

- **$N=3$.** If $F_1+F_2+F_3=0$, then the identity
$$
x^3+y^3+z^3-3xyz=(x+y+z)(x^2+y^2+z^2-xy-yz-zx)
$$
gives $F_1^3+F_2^3+F_3^3 = 3F_1F_2F_3$. Imposing also $\sum_g F_g^3=0$ yields $F_1F_2F_3=0$, so (up to permutation) one charge is zero and the other two are opposite: $\{F_1,F_2,F_3\}=\{a,-a,0\}$. This satisfies anomaly cancellation and is the minimal $N$ that can support a physical CKM phase.

- **$N\ge 4$.** There exist many further solutions of (R.11) (e.g., $\{a,-a,b,-b\}$) that add generations without reducing the minimal $N$ required for a physical CKM phase.

Therefore the minimal anomaly-free solution that permits CP violation is $N=3$ with family charges $\{a,-a,0\}$. ∎

**Proposition R.3.5 (Minimal three-generation solution within the MDL surrogate).**

(a) The three-sector solution $\{a, -a, 0\}$ is the unique minimal solution to the anomaly constraints (R.11) that admits CP violation.

(b) CP violation requires at least three generations with complex mixing. The pattern $\{a, -a, 0\}$ is the simplest charge configuration that permits this structure.

(c) Suppose the realized family-count objective is taken to equal the surrogate expression
$$
L_{\mathrm{fam}}(N) \;=\; L_0 + N\,L_{\mathrm{block}} + L_{\mathrm{mix}}(N),
$$
with $L_{\mathrm{block}} > 0$ and $L_{\mathrm{mix}}(N)$ nondecreasing on the admissible set $\{N \in \mathbb{N} : N \ge 3\}$. Then $L_{\mathrm{fam}}$ is strictly increasing in $N$ and is uniquely minimized at the smallest admissible value $N=3$.

(d) Consequently, when the admissible class is restricted to anomaly-free family-charge assignments that permit a physical CKM phase, and when the realized family count is selected by the surrogate objective of part (c), the MDL surrogate selects $N=3$ as the minimal admissible choice.

*Proof.*

(a) From Theorem R.3.4, $N=2$ satisfies anomaly cancellation but cannot support a physical CKM phase. The pattern $\{a,-a,0\}$ with $N=3$ is therefore the minimal anomaly-free charge assignment that permits CP violation.

(b) With $N=2$, the quark mixing matrix is $2\times 2$ and any complex phases can be removed by rephasing, so the rephasing-invariant Jarlskog quantity vanishes. With $N=3$, a physical rephasing-invariant phase exists, and CP violation is possible.

(c) For every $N \ge 3$,
$$
L_{\mathrm{fam}}(N+1) - L_{\mathrm{fam}}(N)
\;=\;
L_{\mathrm{block}} + \bigl(L_{\mathrm{mix}}(N+1) - L_{\mathrm{mix}}(N)\bigr).
$$
Since $L_{\mathrm{block}} > 0$ and $L_{\mathrm{mix}}(N+1) - L_{\mathrm{mix}}(N) \ge 0$, the right-hand side is strictly positive. Hence $L_{\mathrm{fam}}$ is strictly increasing on $\{3,4,5,\ldots\}$, and its unique minimum is attained at $N=3$.

(d) Therefore, among anomaly-free models in this surrogate class that can realize a physical CKM phase, the smallest admissible value of $N$ is preferred, namely $N=3$. This is the conclusion established by the argument. ∎

**Remark R.3.5.1 (Surrogate-Equality versus Lower-Bound Formulation).** The selection statement in Proposition R.3.5 relies on the surrogate expression $L_0 + N\,L_{\mathrm{block}} + L_{\mathrm{mix}}(N)$ being taken as the realized family-count objective, not merely as a lower bound on it. A non-monotone objective satisfying only
$$
L_{\mathrm{model}}(N) \;\ge\; L_0 + N\,L_{\mathrm{block}} + L_{\mathrm{mix}}(N)
$$
can in principle attain its minimum at an interior value $N > 3$, because a strictly increasing lower bound does not force the bounded quantity to be monotone. For example, the assignment $L(3)=100$, $L(4)=5$, $L(N)=N$ for $N \ge 5$ respects the lower bound $B(N)=N$ for every $N \ge 3$ yet is minimized at $N=4$. Proposition R.3.5 therefore establishes the selection result strictly within the surrogate class in which $L_{\mathrm{fam}}$ equals the displayed additive-monotone expression; it establishes minimal admissibility, while exact realized multiplicity is confined to the surrogate-objective selection branch. This is consistent with the theorem-model boundary recorded in Proposition R.3.5f: the theorem-level structural content of the generation sector is minimal admissibility within the anomaly+CP class of Theorem R.3.4; exact realized $N_g = 3$ is on the surrogate-objective selection branch defined in part (c) above.

**Proposition R.3.5.1a (Family Count on the Additive-Monotone Selection Branch).** Assume the family-redundancy and anomaly-plus-CP admissibility conditions of Theorem R.3.4 and assume that the realized family-count objective is
$$
L_{\mathrm{fam}}(N)=L_0+NL_{\mathrm{block}}+L_{\mathrm{mix}}(N),
$$
where $L_{\mathrm{block}}>0$ and $L_{\mathrm{mix}}$ is nondecreasing for $N\ge3$. Then
$$
N_g=3.
$$

*Proof.* Theorem R.3.4 shows that $N=3$ is admissible and that $N<3$ cannot support a physical CKM phase. For every $N\ge3$,
$$
L_{\mathrm{fam}}(N+1)-L_{\mathrm{fam}}(N)
=
L_{\mathrm{block}}+
L_{\mathrm{mix}}(N+1)-L_{\mathrm{mix}}(N)>0.
$$
Thus the objective is strictly increasing on the admissible counts and has its unique minimum at $N=3$. ∎

**Corollary R.3.5a (Golay Radius and Selected Family Count).** Assume both the predictive-recovery branch on which Theorem Z.13 selects the $[24,12,8]$ Golay code and the additive-monotone family-selection branch of Proposition R.3.5.1a. Then
$$
t=\left\lfloor\frac{d_{\min}-1}{2}\right\rfloor=3=N_g.
$$

*Proof.* Theorem Z.13 gives $d_{\min}=8$, hence $t=\lfloor(8-1)/2\rfloor=3$. Proposition R.3.5.1a gives $N_g=3$ under its additive-monotone objective. Therefore $t=N_g=3$ on the intersection of the two branches. ∎

**Corollary R.3.5a.1 (Conditional Code-Radius Family Ledger).** Under the hypotheses of Corollary R.3.5a,
$$
N_g
=t_{\mathrm{Golay}}
=\left\lfloor\frac{d_{\min}(\mathcal G_{24})-1}{2}\right\rfloor
=3.
\tag{R.3.5a.1}
$$
This equality does not classify family labels outside the additive-monotone selection model. A label with no distinct finite-protocol response is removed independently by Corollary P.6.1b.8. A response-active extra family requires an enlarged flavor objective and is outside Proposition R.3.5.1a unless its additional cost and benefit are included explicitly.

*Proof.* Corollary R.3.5a establishes every equality in (R.3.5a.1). The final scope statements follow from the response-null quotient of Corollary P.6.1b.8 and from the declared domain of Proposition R.3.5.1a. ∎

**Corollary R.3.5b (Conditional Topological Rank Identity).** Assume the minimal Appendix-Z Hilbert and dimension branches, the anomaly/CP class of Theorem R.3.4, and the additive-monotone selection branch of Proposition R.3.5.1a. Then
$$
\operatorname{rank}\pi_2(\Sigma_8)=d_0-1=N_g+D=7.
$$

*Proof.* The cited branches give $\operatorname{rank}\pi_2(\Sigma_8)=7$, $d_0=8$, $N_g=3$, and $D=4$. Hence $d_0-1=N_g+D=7$. ∎

**Corollary R.3.5c (Conditional Structural Identity).** Under the hypotheses of Corollary R.3.5b and the Theorem-15 branch $K_0=3$,
$$
2^{K_0}=N_g+D+1,
\qquad
K_0=\log_2(N_g+D+1).
$$

*Proof.* Both sides of the first equality are $8$; taking $\log_2$ gives the second. ∎

**Corollary R.3.5d (Three Branch-Selected Threes).** Assume, in addition, the predictive-recovery Golay branch of Corollary R.3.5a. Then
$$
K_0=N_g=t_{\mathrm{Golay}}=3,
\qquad
t_{\mathrm{Golay}}=\left\lfloor\frac{d_{\min}-1}{2}\right\rfloor.
$$

*Proof.* Theorem 15 gives $K_0=3$, the effective R.3.5.1a gives $N_g=3$ on its additive branch, and $d_{\min}=8$ gives $t_{\mathrm{Golay}}=3$. ∎

**Proposition R.3.5e (Conditional Integer Ledger).** On the intersection of the source branches named in the last column,

| Integer | Identity | Source branches |
|:--:|:--|:--|
| $3$ | $K_0=N_g=t_{\mathrm{Golay}}$ | Theorem 15; anomaly/CP class; additive family selection; predictive-recovery Golay branch |
| $4$ | $D=4$ | Theorem Z.11 dimension branch |
| $7$ | $\operatorname{rank}\pi_2(\Sigma_8)=d_0-1=N_g+D$ | R.1.1; minimal Hilbert branch; additive family selection; dimension branch |
| $8$ | $N_{\mathrm{vis}}^{\min}=2^{K_0}=d_0=8$ | Theorem 15; Theorem 23; Theorem Z.2 minimal branch |
| $12$ | $12=M/2=ab=k=n_G=\dim_{\mathbb C}\mathrm{Gr}(2,8)$ | The cited interface, code, Grassmannian, and gauge branches |
| $24$ | $24=M=K(4)$ | Theorem Z.5 and Theorem Z.11 branches |

*Proof.* Each row follows by substituting the values supplied by its listed source branches. The ledger records cross-branch numerical identities; it does not derive one source branch from another. ∎

**Remark R.3.5e.1.** Proposition R.3.5e records a compact ledger of exact equalities on the intersection of the source branches named in its final column. It is not, by itself, a single-parent derivation of all entries. The closure supplied by the following results is a current-graph non-collapse decomposition: the present proof graph decomposes the recurrent ledger into structural subchains with named source invariants, separates these from downstream equality and rigidity invariants, and proves that no current source invariant subsumes the others. Whether a future common parent invariant underlies all source roles remains open.

**Proposition R.3.5e.2 (Three-Chain Decomposition of the Recurrent Integer Subledger).** On the intersection of the capacity-saturation, Peirce--Grassmannian, predictive-recovery, family-selection, topology, and dimension branches cited by Proposition R.3.5e, the subledger
$$
(\varepsilon_0,a,d_0,b,k,M,D)
$$
admits the following dependency decomposition:
$$
\mathcal C_{\mathrm{cap}}:\quad \varepsilon_0=\ln2\to a=2\to d_0=8,
\tag{R.3.5e.2.1}
$$
$$
\mathcal C_{\mathrm{tan}}:\quad (a,d_0)=(2,8)\to b=6\to k=12\to M=24,
\tag{R.3.5e.2.2}
$$
and
$$
\mathcal C_{\mathrm{kis}}:\quad M=24=K(4)\to D=4.
\tag{R.3.5e.2.3}
$$
Here $\mathcal C_{\mathrm{cap}}$ is the capacity-saturation chain using Theorem 31, Theorem Z.1, and Theorem Z.2; $\mathcal C_{\mathrm{tan}}$ is the Peirce-Grassmannian tangent chain using Theorem Z.2.5b; and $\mathcal C_{\mathrm{kis}}$ is the mode-channel/kissing-number chain using Theorem Z.11 and Corollary Z.11.1. The remaining $3$ and $7$ rows of Proposition R.3.5e remain governed by the family-anomaly and topology ledgers cited in that proposition.

*Proof.* The first chain follows from the Landauer-SPAP lower bound and the structural reference $\varepsilon_0=\ln2$, the sharp match/mismatch active-verification record $a\ge2$, the integer capacity condition $\ln a\ge\varepsilon_0$, and PPI/PCE no-surplus selection giving $a=2$; the minimal SPAP tensor realization then gives $d_0=8=2a^2$. The second chain follows from the rank-$a$ projector on $\mathbb C^{d_0}$: $b=d_0-a=6$, $k=\dim_\mathbb C\operatorname{Hom}(pE,(1-p)E)=ab=12$, and $M=2k=24$. Here $k$ is the complex tangent half-mode count; on the predictive-recovery MacWilliams branch, Definition Z.13b.0 and Theorem Z.13b.0a identify the interface-code dimension with the same value $M/2=12$. The third chain is the channel-complete Bures tangent-cell condition $M=K(D)$, whose accepted minimal solution is $K(4)=24$ on the checked branch of Corollary Z.11.1. The $3$ and $7$ rows are not part of this subledger decomposition because their cited proofs use Theorem 15, Theorem R.3.4, Proposition R.3.5.1a, Corollary R.3.5a, Theorem R.1.1, and Corollary R.3.5b. ∎

**Theorem R.3.5e.3 (Non-Collapse of the Source Roles in the Present Dependency Graph).** On the intersection of the source branches stated in Propositions R.3.5e and R.3.5e.2, let $G$ be the finite directed proof-role graph of the recurrent conditional ledger as cited in Appendices R and Z. Its source roles are the four chains
$$
\mathcal C_3,
\quad
\mathcal C_{\mathrm{cap}},
\quad
\mathcal C_{\mathrm{tan}},
\quad
\mathcal C_{\mathrm{kis}}.
$$
Their source invariants are
$$
I_3=(K_0,N_g,t_{\mathrm{Golay}})=(3,3,3),
$$
$$
I_{\mathrm{cap}}=(\varepsilon_0,a,d_0)=(\ln2,2,8),
$$
$$
I_{\mathrm{tan}}=(b,k_{\mathrm{tan}},M)=(6,12,24),
\qquad
k_{\mathrm{tan}}=\dim_{\mathbb C}\operatorname{Hom}(pE,(1-p)E),
$$
$$
I_{\mathrm{kis}}=(D,K(D))=(4,24).
$$
On the predictive-recovery MacWilliams branch, the interface-code dimension $k$ equals $k_{\mathrm{tan}}=M/2=12$.
The graph carries three additional invariants which are downstream equality or rigidity invariants rather than independent source roles:
$$
J_{\mathrm{top}}=
\left(
\operatorname{rank}\pi_2(\Sigma_8),
d_0-1,
N_g+D
\right)
=(7,7,7),
$$
$$
J_{\mathrm{Cl}}=
\left(
M_8(\mathbb C)\cong\mathrm{Cl}_{\mathbb C}(6),
\quad
M_8(\mathbb R)\cong\mathrm{Cl}_{\mathbb R}(0,6)\text{ after a compatible real-carrier marking}
\right),
$$
and
$$
J_{\mathrm{ar}}=
\left(
\Sigma_8\xrightarrow{q(F_\bullet)=F_2}\mathrm{Gr}(2,8)
\xleftarrow{\ \pi\ }
\mathrm{Flag}_{1,2,3}(Q),
\quad
\mathrm{Gr}_{\mathbb C}(12,24)
\right).
$$
The value-input arrows among the source roles are
$$
I_3\to I_{\mathrm{cap}}
\quad\text{through}\quad K_0=3\text{ and the SPAP lower-bound/minimal-branch selection of }d_0,
$$
$$
I_{\mathrm{cap}}\to I_{\mathrm{tan}}
\quad\text{through}\quad (a,d_0),
\qquad
I_{\mathrm{tan}}\to I_{\mathrm{kis}}
\quad\text{through}\quad M.
$$
These arrows record required upstream values; they do not mean that the upstream role alone supplies the missing structural gate of the downstream role. A current-source compression is a source role already present in $G$ whose own data and outgoing dependency paths determine every source invariant in
$$
(I_3, I_{\mathrm{cap}}, I_{\mathrm{tan}}, I_{\mathrm{kis}})
$$
without adding a new parent invariant, functor, certificate, or bridge condition. **No current-source compression exists in $G$.** Equivalently, the recurrent ledger
$$
(K_0,d_0,\varepsilon_0,a,b,M,k,D)=(3,8,\ln2,2,6,24,12,4)
$$
closes as a current-graph non-collapse decomposition of the source roles, with downstream coherence given by $(J_{\mathrm{top}}, J_{\mathrm{Cl}}, J_{\mathrm{ar}})$.

*Proof.* Proposition R.3.5e and Proposition R.3.5e.2 give the exact ledger values for the recurrent integer rows. The invariant $I_3$ follows from Theorem 15, Theorem R.3.4, Proposition R.3.5.1a, and Corollary R.3.5a. The invariant $I_{\mathrm{cap}}$ follows from the Landauer--SPAP lower bound, structural reference $\varepsilon_0=\ln2$, the retained match/mismatch active-record gate

 The invariant $I_{\mathrm{tan}}$ follows from the rank-$a$ projector tangent calculation
$$
T_p\mathrm{Gr}(a,d_0)\cong\operatorname{Hom}(pE,(1-p)E),
$$
so that
$$
b=d_0-a=6,
\qquad
k_{\mathrm{tan}}=\dim_{\mathbb C}\operatorname{Hom}(pE,(1-p)E)=ab=12,
\qquad
M=2k_{\mathrm{tan}}=24.
$$
On the predictive-recovery MacWilliams branch, Definition Z.13b.0 and Theorem Z.13b.0a select the interface-code dimension $k=M/2=12$, and Theorem Z.13 realizes the corresponding $[24,12,8]$ Golay code. Thus the manuscript's shared value $k=12$ is consistent with the tangent half-mode count, but the coding-theoretic selection uses the named MacWilliams gate. The invariant $I_{\mathrm{kis}}$ follows from Definition Z.9a and Theorem Z.11: the channel-complete finite-response tangent-cell contract gives $M=K(D)$, and the admissible kissing-number gap gives the unique exact solution $D=4$ when $M=24$. The downstream invariants are $J_{\mathrm{top}}=$ Corollary R.3.5b, $J_{\mathrm{Cl}}=$ Corollary 23a.1 with the real form selected only after the compatible real-carrier marking is included, and $J_{\mathrm{ar}}=$ Definition Z.35d together with Theorem Z.35e.

It remains to check that no source role replaces all the others inside $G$. The role $\mathcal C_{\mathrm{cap}}$ supplies $I_{\mathrm{cap}}$ and feeds $\mathcal C_{\mathrm{tan}}$ through $(a,d_0)$, but it contains no family-anomaly proof of $N_g=3$, no Golay correction-radius argument, and no kissing-number bridge. Thus it does not determine $I_3$ or $I_{\mathrm{kis}}$.

The role $\mathcal C_{\mathrm{tan}}$ computes $b$, $k_{\mathrm{tan}}$, and $M$ from a rank-$a$ projector after $(a,d_0)$ is already fixed. It does not supply the capacity/Landauer source of $(\varepsilon_0,a,d_0)$, it does not supply the predictive-recovery MacWilliams gate for the interface-code interpretation of $k$, and it does not define the ambient packing dimension $D$ without the separate channel-complete mode-channel equation $M=K(D)$. Hence it cannot replace $\mathcal C_{\mathrm{cap}}$ or $\mathcal C_{\mathrm{kis}}$.

The role $\mathcal C_{\mathrm{kis}}$ selects $D=4$ only after $M=24$ has already been supplied by the Peirce-Grassmann tangent count. It cannot compute $a$, $d_0$, $b$, $k_{\mathrm{tan}}$, or $M$ by itself, and it carries no family-anomaly data.

The role $\mathcal C_3$ supplies $K_0=N_g=t_{\mathrm{Golay}}=3$ through the horizon, anomaly+CP family, pre-flavor family-redundancy, and Golay-radius results. It provides the value $K_0=3$ used by the SPAP lower-bound leg for $d_0$, but it does not by itself supply the Landauer/PPI capacity gate, the Peirce tangent dimension, the predictive-recovery MacWilliams rate-selection gate, or the kissing-number bridge. Hence it is not a current-source compression.

For the downstream invariants: $J_{\mathrm{top}}$ is the rank identity $\operatorname{rank}\pi_2(\Sigma_8)=d_0-1=N_g+D=7$ checked after $d_0$, $N_g$, and $D$ are already known by the source roles; it is an equality ledger consistent with the source roles, not an independent computation of any source value. $J_{\mathrm{Cl}}$ identifies the complex Clifford algebra and the marked real form of the already selected carrier; it does not derive the carrier dimension. $J_{\mathrm{ar}}$ is the marked-arena rigidity theorem of Definition Z.35d and Theorem Z.35e; it proves uniqueness of the canonical hierarchy preserving the marks $(d_0,a,\mathcal F_Q,\omega,(k,M))$ rather than deriving them from a new parent source. The downstream roles thus enter $G$ as coherence checks and rigidity statements, not as candidates for a current-source compression.

Finally, the Hurwitz count cannot supply the missing source. By Theorem 23a.1c, the minimal SPAP configuration groupoid has one isomorphism class, whereas the groupoid of non-real normed real division algebras has three non-isomorphic objects $\mathbb C$, $\mathbb H$, and $\mathbb O$. A functor sends isomorphic source objects to isomorphic target objects, so no functor from the minimal SPAP groupoid can have essential image consisting of all three Hurwitz objects. Hence the equality
$$
K_0=3=\#\{\mathbb C,\mathbb H,\mathbb O\}
$$
remains a numerical coherence check and not a categorical source. The finite list above exhausts the current source roles of $G$, so no current-source compression exists. ∎

**Corollary R.3.5e.4 (No Single-Source Reduction from the Current Inputs Alone).** Assume the intersection of the source branches of Proposition R.3.5e, the marked-arena hypotheses of Definition Z.35d and Theorem Z.35e, and the branch hypotheses of Corollary T.59a and Corollary 23a.1. On this common branch, the present proof graph does not reduce
$$
(K_0,d_0,\varepsilon_0,a,b,M,k,D)
$$
to one already supplied parent source. The downstream coherence package
$$
\Sigma_8\to\mathrm{Gr}(2,8)\leftarrow\mathrm{Flag}_{1,2,3}(Q),
\qquad
\mathrm{Gr}_{\mathbb C}(12,24),
\qquad
M_8(\mathbb C)\cong\mathrm{Cl}_{\mathbb C}(6),
\qquad
M_8(\mathbb R)\cong\mathrm{Cl}_{\mathbb R}(0,6)\text{ (marked)}
$$
is unique under the registered marks but does not collapse the four source roles into one parent.

*Proof.* Proposition R.3.5e and Corollary T.59a give the tuple on the declared common branch. Theorem Z.35e gives uniqueness of the marked arena hierarchy, Corollary 23a.1 gives the Clifford coherence, and Theorem R.3.5e.3 gives nonexistence of a current-source compression in the resulting graph. ∎

**Remark R.3.5e.5 (Status of a Possible Bott-Theoretic Source).** Corollary R.3.5e.4 is a relative statement about the present dependency graph, not a global impossibility theorem. A future Bott-periodicity theorem or other proposed parent source would be additional structure, not a replacement already contained in the current ledger. To be admissible it must supply a parent invariant $P$ together with structure-preserving projections to every source invariant,
$$
P\to I_3,
\qquad
P\to I_{\mathrm{cap}},
\qquad
P\to I_{\mathrm{tan}},
\qquad
P\to I_{\mathrm{kis}},
$$
and must respect every downstream coherence invariant,
$$
P\twoheadrightarrow J_{\mathrm{top}},
\qquad
P\twoheadrightarrow J_{\mathrm{Cl}},
\qquad
P\twoheadrightarrow J_{\mathrm{ar}},
$$
where $\twoheadrightarrow$ denotes compatibility with the corresponding equality or rigidity statement. In particular, $P$ must preserve the marked arena package
$$
(E,p,\omega,\mathcal F_Q,\eta)
$$
of Definition Z.35d and reproduce
$$
(\varepsilon_0,a,d_0)=(\ln2,2,8),
\qquad
(b,k,M)=(6,12,24),
\qquad
(D,K(D))=(4,24),
$$
together with the canonical hierarchy of Theorem Z.35e, without replacing any source-role chain by a numerical coincidence.

**Remark R.3.5e.5a (Parent-Datum Schema Gate).** A candidate parent-source record for Remark R.3.5e.5 may be organized as a finite capacity-arena datum

$$
\mathfrak P_{ar}
=
(\mathcal H,p,\omega,\mathcal C_{\mathrm{resp}},\mathcal R,\mathcal Q,\lambda,
\pi_3,\pi_{\mathrm{cap}},\pi_{\mathrm{tan}},\pi_{\mathrm{kis}},
\rho_{\mathrm{top}},\rho_{\mathrm{Cl}},\rho_{\mathrm{ar}}),
$$

where $\mathcal H\cong\mathbb C^8$ is the minimal faithful SPAP carrier on the minimal branch, $p$ is the active rank-two projector, $\omega$ is the finite PCE state realizing $\varepsilon_0=\ln2$, $\mathcal C_{\mathrm{resp}}$ is the finite active-inactive interface response category, $\mathcal R$ is the marked Golay/Peirce recovery functor, $\mathcal Q$ is the response-null quotient, and $\lambda$ is a branch-fixed scalarization of retained predictive benefit minus PCE cost. The maps $\pi_3,\pi_{\mathrm{cap}},\pi_{\mathrm{tan}},\pi_{\mathrm{kis}}$ are proposed source-invariant readouts, and $\rho_{\mathrm{top}},\rho_{\mathrm{Cl}},\rho_{\mathrm{ar}}$ are proposed coherence readouts.

The associated bookkeeping index is

$$
\mathfrak I_{\mathrm{par}}(\mathfrak P_{ar})
:=
(K_{log},A_{min},T_{int},\Pi_{shell}),
$$

with

$$
K_{log}=3,
\qquad
A_{min}=2,
\qquad
T_{int}=2\dim_{\mathbb C}\operatorname{Hom}(p\mathcal H,(1-p)\mathcal H)=2a(d_0-a)=24,
\qquad
\Pi_{shell}=4.
$$

The equalities use the already-established minimal-branch data $d_0=8$, $a=2$, and the kissing-number identity $K(4)=24$. This record is a bookkeeping gate, not a current-source compression theorem. Promotion to a parent invariant requires an autonomous derivation of $\mathfrak I_{\mathrm{par}}=(3,2,24,4)$ and of the listed readout maps without using the four source chains $\mathcal C_3,\mathcal C_{\mathrm{cap}},\mathcal C_{\mathrm{tan}},\mathcal C_{\mathrm{kis}}$ as proof inputs.

**Remark R.3.5e.6 (Dependency Separation, Not Pairwise-Disjoint Inputs).** Proposition R.3.5e.2 separates the recurrent integer ledger by proof role, not by pairwise-disjoint leaf inputs. The capacity chain fixes $\varepsilon_0$, $a$, and $d_0$; the Peirce tangent chain uses the already fixed $(a,d_0)$ to compute $b$, $k$, and $M$; and the kissing-number chain uses the already fixed $M$ to select $D=4$. The invariant proved by Theorem R.3.5e.3 is therefore non-replacement of source roles inside the current dependency graph, not pairwise-disjointness of every premise.

*Proof.* This is a direct reading of (R.3.5e.2.1)--(R.3.5e.2.3) and of the graph definition in Theorem R.3.5e.3. The symbol $M$ appears as the output of the Peirce tangent chain and as the input of the kissing-number chain; likewise $(a,d_0)$ are fixed upstream before the Peirce calculation. Therefore pairwise-disjoint input sets are not the invariant being proved. The invariant actually proved is that no current source role replaces all the others without adding a new parent source. ∎

**Proposition R.3.5f (Theorem–Model Boundary for the Generation Sector).** The theorem-level structural content of the generation sector is exactly this: within the family-charge class of Theorem R.3.4, anomaly cancellation together with the requirement of physical CP violation forces the minimal admissible generation number
$$
N_g \;=\; 3.
$$
This statement has role class ExactThreshold / DiscreteMultiplicity in the sense of Convention P.14.1a. The following do **not** enter that theorem and belong to later conditional or model layers:
1. the identification of generations with specific $E_8$ roots, triads, or wavepackets;
2. the Yukawa-compression and absolute-mass constructions of Appendix T;
3. the Berry-holonomy CKM/PMNS phase assignments;
4. seesaw, Majorana, or low-energy oscillation matching assumptions;
5. the baryogenesis numerics built from those phase constructions.

Consequently, falsifying a texture model, an $E_8$ placement rule, a CKM/PMNS ansatz, a neutrino normalization convention, or a baryogenesis realization does not by itself refute the theorem-level statement $N_g=3$ unless it also invalidates the anomaly+CP premises of Theorem R.3.4. Quantitative flavor outputs are therefore reported with the paper-wide T1/T2/T3 protocol: T1 for finite-order and geometric truncations, T2 for vacuum/regularization/threshold and branch dependence, and T3 for scheme, empirical mapping, and discrete identification ambiguity.

*Proof.* Theorem R.3.4 uses only the family-charge anomaly equations together with the requirement that a physical rephasing-invariant CP phase exist. It does not use any $E_8$ placement, Yukawa overlap, Berry-holonomy, seesaw, PMNS construction, baryogenesis machinery, or low-energy extraction convention. Those ingredients first enter later sections of Appendix R and in Appendix T / Appendix Y. Since the premise set of Theorem R.3.4 is disjoint from those later model premises, the structural generation-count statement and the later flavor-model constructions have distinct dependency records. The T1/T2/T3 assignment is then the direct specialization of Convention P.14.1c to the flavor variables: omitted hierarchy orders and geodesic approximations are T1, vacuum/threshold/regularization choices are T2, and scheme, empirical extraction, and generation-label identification are T3. ∎

**Corollary R.3.5g (Matter Generations as Minimal Anomaly-Code Completion).** In the family-charge class of Theorem R.3.4, the generation count is the minimal code-completion number for simultaneous predictive anomaly descent and CP-active holonomy:
$$
N_g
=
\min\{N:\ [\mathcal A_N]=0\ \text{and}\ J_{\mathrm{CP}}(N)\ne0\}
=
3.
$$
Here $[\mathcal A_N]=0$ denotes the family-charge descent equations
$$
\sum_{g=1}^N F_g=0,
\qquad
\sum_{g=1}^N F_g^3=0,
$$
and $J_{\mathrm{CP}}(N)\ne0$ denotes the existence of a rephasing-invariant CP phase. The realized three-sector pattern is
$$
\{F_g\}=\{a,-a,0\}.
$$
Thus the three generations are not redundant copies on this branch; they are the smallest anomaly-completing predictive code that still carries CP-active orientation holonomy.

*Proof.* Theorem R.3.4 proves that $N=1$ fails anomaly cancellation unless the family charge is trivial, and $N=2$ supports only opposite charges and cannot carry a physical CKM-type CP phase after rephasing. For $N=3$, the anomaly equations imply one zero charge and two opposite charges, giving $\{a,-a,0\}$, and the three-sector system admits a physical rephasing-invariant CP phase. Hence $3$ is the minimum $N$ satisfying both conditions. ∎

**Corollary R.3.5h (Persistent-Cohomology Representative of the Generation Class).** Let
$$
0=C_{\le -1}^{\bullet}\subset C_{\le0}^{\bullet}\subset\cdots\subset C_{\le M}^{\bullet}=C_{\mathrm{fam}}^{\bullet}
$$
be a finite filtered defect complex whose total degree-one cohomology represents the family-charge obstruction class of Theorem R.3.4. Suppose:

1. the associated spectral sequence
$$
E_r^{p,q}\Rightarrow H^{p+q}(C_{\mathrm{fam}}^{\bullet})
$$
converges to the anomaly and CP-active family-charge quotient;

2. filtration-exact classes are PCE-null;

3. every stable degree-one class acts on an anomaly or CP protocol, so no stable invisible family label remains.

Then
$$
\sum_p \dim E_\infty^{p,1-p}
=
\dim H^1(C_{\mathrm{fam}}^{\bullet})
=
N_g
=
3.
\tag{R.3.5h.1}
$$
On the canonical three-sector filtration, where the stable degree-one representatives occur in one filtration degree, this reduces to
$$
\dim E_\infty^{1,0}=3.
\tag{R.3.5h.2}
$$

*Proof.* Finite filtered complexes have convergent spectral sequences whose $E_\infty$ page is the associated graded object of the total cohomology. Therefore
$$
\sum_p \dim E_\infty^{p,1-p}
=
\dim H^1(C_{\mathrm{fam}}^{\bullet}).
$$
By hypothesis, this total degree-one cohomology is exactly the anomaly and CP-active family-charge quotient of Theorem R.3.4. Corollary R.3.5g proves that the minimal admissible family-charge quotient has $N_g=3$ represented by $\{a,-a,0\}$. Filtration-exact classes are removed by PCE, and invisible stable labels are excluded by item 3. Hence the stable persistent degree-one dimension is exactly three. If the stable representatives are concentrated in one filtration degree, the sum is the single dimension in (R.3.5h.2). ∎

## R.4 Three-Fold Structure: Topological Derivation and Structural Compatibility

This section compares the theorem-level generation-count derivation with the structural three-fold compatibility checks that appear on the same minimal branch. The topological route of Sections R.1–R.4.1 carries the actual derivation of $N=3$ from anomaly cancellation together with the CP-violation requirement. Section R.4.2 records two compatibility layers: the $D_4$ triality orbit on a marked real 8-carrier, and the Leech/$E_8$ three-fold scaffold at $M=24$. These compatibilities sharpen the framework's internal coherence, but they do not replace the anomaly+CP route or the pre-flavor PPI realization theorem.

### R.4.1 Topological Pathway: Anomaly Cancellation

**Summary of Topological Derivation:**

1. **Starting point:** $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$ provides seven topological charges (Section R.1).

2. **Gauge embedding:** $G_{\mathrm{SM}} \hookrightarrow U(8)$ induces charge map $\Phi: \pi_2(\Sigma_8) \to \Lambda_{\mathrm{Cartan}}$ (Theorem R.3.1).

3. **Light sublattice:** Non-Abelian neutrality selects $L_{\mathrm{light}} = \ker(C) \subset \mathbb{Z}^7$ (Definition R.3.2).

4. **Family symmetry:** Introduce $U(1)_F$ with charges $F_g = f \cdot q^{(g)}$ for sectors in $L_{\mathrm{light}}$.

5. **Anomaly constraints:** Require $\sum_g F_g = 0$ and $\sum_g F_g^3 = 0$ (Theorem R.3.4).

6. **CP violation requirement:** Demand $N \geq 3$ for non-vanishing Jarlskog invariant (Theorem R.3.4).

7. **Minimal solution:** Combined constraints yield $N=3$ with pattern $\{a, -a, 0\}$ as the smallest admissible solution in the modeled class.

The anomaly and CP-capability argument gives the smallest admissible three-family ledger within its declared uniform-charge class. Proposition R.3.5 gives the MDL-surrogate statement, and Proposition R.3.5.1a selects $N_g=3$ on its additional additive-monotone family objective. The compatibility checks in Section R.4.2 are downstream of this branch boundary.

### R.4.2 Structural Compatibility

**Remark R.4.1: Modular Forms and the Number 24.**
The appearance of $M = 24$ in the interface mode count (**Appendix Z**) and the Leech lattice dimension is not coincidental. The number 24 has a unique status in mathematics due to modular forms: the Dedekind eta function $\eta(\tau)^{24} = \Delta(\tau)$ achieves weight 12, the natural weight for modular forms determined by the first Chern class of the canonical bundle over modular curves. This connects:

- **Topology:** Ramification index gives weight 12
- **Analysis:** Modular invariance under $SL(2,\mathbb{Z})$ 
- **Geometry:** Optimal sphere packing in 24 dimensions (Leech lattice)
- **Algebra:** Three copies of $E_8$ (from division algebras: $3 \times 8 = 24$)
- **Information theory:** Interface modes $2 \times 2 \times 6 = 24$ (this appendix)

The convergence of these independent mathematical structures at 24 suggests deep underlying unity between optimization (PCE), consistency (anomaly cancellation), and symmetry (exceptional groups).

**Proposition R.4.2 (Three-Fold Compatibility of Topology, Triality, Geometry, and Mode Count).**

The number $3$ occurs in four distinct branch records:

1. **Family count:** Theorem R.3.4 gives the smallest anomaly-descending CP-capable uniform-charge pattern $\{a,-a,0\}$; Proposition R.3.5.1a selects it on the additive-monotone objective branch.
2. **Triality:** a marked real 8-carrier with compact $\mathfrak{so}(8)$ structure has the triality orbit $\{V,S^+,S^-\}$.
3. **Lattice scaffold:** the registered Leech construction contains $\sqrt2E_8^{\oplus3}$.
4. **Mode factorization:** the interface branch has $M=24=3\times8$.

Items 2–4 are compatibility records. They do not derive the family count without independent carrier, label, and anomaly-descent identifications.

*Proof.* Item 1 follows from R.3.4 plus the additive-monotone branch of the effective R.3.5.1a. A supernumerary response-null label is removed independently by Corollary P.6.1b.8. Items 2–4 are the representation, lattice, and arithmetic facts proved in the remainder of this proposition. No implication among those three facts and the family-charge selection is used. 

For item 2, let $W$ be a marked Euclidean real vector space of dimension 8 and let $\mathfrak g=\mathfrak{so}(W)\cong\mathfrak{so}(8)$ be its compact rotation algebra. Its complexification $\mathfrak g_{\mathbb C}$ has Dynkin type $D_4$. The classification of complex simple Lie algebras identifies the outer automorphism group with the automorphism group of the Dynkin diagram (Humphreys 1972; Fulton & Harris 1991). The $D_4$ diagram has one central node and three indistinguishable outer nodes, so its diagram automorphism group is $S_3$. Therefore
$$
\mathrm{Out}(\mathfrak{so}(8))\cong S_3.
$$
The fundamental modules attached to the three outer nodes have highest weights $\omega_1,\omega_3,\omega_4$. They are respectively the vector module $V$ and the two half-spin modules $S^+,S^-$. Their dimensions are
$$
\dim_{\mathbb C}V=8,\qquad
\dim_{\mathbb C}S^+=\dim_{\mathbb C}S^-=2^{4-1}=8.
$$
A diagram automorphism sends a highest-weight module to the module whose highest weight is the corresponding permuted fundamental weight. Hence the three modules form one canonical $S_3$ orbit:
$$
\{V,S^+,S^-\}.
$$

This threefold equality is unique to the $D_4$ case among the orthogonal series. For $D_n=\mathfrak{so}(2n)$, the vector module has dimension $2n$ and the half-spin modules have dimension $2^{n-1}$. The equality
$$
2n=2^{n-1}
$$
holds only for $n=4$: for $n=2,3$ the right-hand side is smaller than $2n$; for $n=4$ both sides equal 8; and for $n\ge5$, the ratio $2^{n-1}/(2n)$ is already $8/5>1$ at $n=5$ and increases by the factor $2n/(n+1)>1$ from $n$ to $n+1$. Also, among simple Dynkin diagrams, only $D_4$ has an automorphism group containing an element of order 3: $A_n$ has at most $\mathbb Z_2$, $D_n$ for $n\ge5$ has $\mathbb Z_2$, $E_6$ has $\mathbb Z_2$, and the remaining simple diagrams have trivial diagram automorphism group. Thus the triality orbit is a genuine dimension-8 compatibility, not a generic spinorial accident.

The same triality orbit also reproduces the algebraic charge pattern of Theorem R.3.4 when the anomaly equations are imposed on a three-element orbit. Let $F_V,F_+,F_-$ be rational charge values assigned to $V,S^+,S^-$ and suppose
$$
F_V+F_++F_-=0,
\qquad
F_V^3+F_+^3+F_-^3=0.
$$
Using
$$
x^3+y^3+z^3-3xyz
=
(x+y+z)(x^2+y^2+z^2-xy-yz-zx),
$$
the two displayed equations imply
$$
3F_VF_+F_-=0.
$$
Thus one charge is zero. The linear equation then forces the remaining two charges to be opposite. Hence, up to permutation by the $S_3$ orbit,
$$
\{F_V,F_+,F_-\}=\{a,-a,0\}.
$$
On the nontrivial family-charge branch $a\ne0$; the all-zero solution is the trivial charge assignment. This is exactly the family-charge pattern selected in Theorem R.3.4.

Item 3 is the lattice-theoretic statement proved in this section: $\Lambda_{24}$ contains a sublattice isometric to $\sqrt{2}E_8^3$, so the 24-dimensional geometric construction carries a natural three-fold block structure. Item 4 is the factorization $M=24=3\times8$, which is compatible with grouping the interface into three 8-dimensional blocks.

It remains to record the boundary of the claim. The MPU Hilbert space is $H_0\cong\mathbb C^8$, whereas the triality statement is a theorem about a marked real Euclidean 8-carrier with $\mathfrak{so}(8)$ structure. The QFI interface count is
$$
M=2a(d_0-a)=24,
$$
the real dimension of $T_{\rho_0}\mathrm{Gr}(2,8)$, not an 8-dimensional Hilbert-space carrier. Therefore item 2 is not a canonical identification of $H_0$ or the QFI tangent space with one fixed $\mathrm{Spin}(8)$ representation. Moreover, $S_3$ is finite and has trivial identity component, so triality does not generate the connected family symmetry $U(1)_F$ used in Theorem R.3.4. If a future branch declares the finite triality label itself to be a predictive redundancy in a 4-dimensional effective-action sector, Definition X.8d.2 requires the corresponding $(d+1)$-dimensional bordism character, hence a 5-dimensional anomaly audit for a 4-dimensional branch, not an $\Omega_4$ audit. Since the present proposition uses triality only as a compatibility layer, no new redundancy or bordism gate is added here.

Thus the topological, triality, geometric, and information-theoretic structures are compatible with one another, while the proof of the generation count remains the anomaly+CP derivation together with the pre-flavor PPI realization theorem. ∎

### R.4.2.1 The Conditional Golay Bridge

The coding and lattice classification statements below are independent until a finite-quadratic-module marking, maximal isotropic subgroup, glue representatives, and coset-minimum ledger are supplied. The section records the conditional bridge and does not infer it from the shared integer $24$.



The preceding discussion notes that the Leech lattice can be obtained from the scaled triple $\sqrt{2}E_8^3$ by a gluing construction involving cosets and the extended binary Golay code. The predictive-recovery theorem selecting $\mathcal G_{24}$ does not itself construct that gluing. The lattice conclusion is available only after the finite-quadratic-module marking, maximal isotropic subgroup, glue representatives, and coset-minimum ledger of Lemma R.4.5 are independently registered. The occurrence of $\mathcal G_{24}$ in both ledgers is a compatibility observation, not a necessary implication from PCE optimization.

---

#### R.4.2.1.1 $E_8$ as PCE-Optimal Lattice Structure in Eight Dimensions

**Theorem R.4.3 ($E_8$ as the Unique Positive-Definite Even Unimodular Rank-Eight Lattice).**

On the minimal Hilbert-carrier branch, Theorem 23 gives $d_0\ge8$ and Theorem Z.2 supplies the saturating value $d_0=8$. Independently assume a positive-definite real Euclidean lattice carrier of rank $d_0$ that is even and unimodular. Then that lattice is isometric to $E_8$.

*Proof.*

**Step 1 (Even unimodular lattice requirements).** A lattice $\Lambda \subset \mathbb{R}^n$ is *even* if $|v|^2 \in 2\mathbb{Z}$ for all $v \in \Lambda$, and *unimodular* if $\det(\Lambda) = 1$ (equivalently, $\Lambda^* = \Lambda$, i.e., self-dual). Even unimodular positive definite lattices exist only in dimensions $n \equiv 0 \pmod{8}$ (Serre 1973; Milnor & Husemoller 1973).

**Step 2 (Classification in dimension 8).** By the classification theorem for even unimodular lattices (Mordell 1938; Witt 1941), there exists exactly one even unimodular lattice in dimension 8, up to isometry. This unique lattice is $E_8$.

**Step 3 (Information-theoretic optimality).** The $E_8$ lattice uniquely achieves multiple optimality properties relevant to PCE:

| Property | Value | PCE Interpretation |
|----------|-------|-------------------|
| Sphere packing density | $\Delta_8 = \pi^4/384 \approx 0.2537$ | Maximizes distinguishable states per volume (maximizes $V_{\text{benefit}}$) |
| Kissing number | 240 (maximum in 8D) | Maximizes local connectivity for error correction |
| Self-duality | $E_8^* = E_8$ | Eliminates representational redundancy (minimizes $V_{\text{op}}$) |

The optimality of $E_8$ for sphere packing in 8 dimensions was proved by Viazovska (2017).

**Step 4 (Root system structure).** The 240 minimal vectors of $E_8$ (those with $|v|^2 = 2$) form the $E_8$ root system:

- 112 vectors of Type I: permutations of $(\pm 1, \pm 1, 0, 0, 0, 0, 0, 0)$
- 128 vectors of Type II: $(\pm\tfrac{1}{2}, \ldots, \pm\tfrac{1}{2})$ with an even number of minus signs

These 240 roots provide maximal symmetric discrete structure, ensuring uniform local neighborhoods. ∎

---

#### R.4.2.1.2 Golay Code from PCE Error Optimization

**Theorem R.4.4 (Golay Code from PCE Error Optimization on the Predictive-Recovery MacWilliams Branch).**

On the predictive-recovery MacWilliams branch — under which the $M=24$ interface modes at the PCE-Attractor (Definition 15a) split into $k=12$ information-carrying modes and $n-k=12$ redundancy modes by Theorem Z.13b.0a (the same branch supplied by Theorem P.13.12 in Appendix P) — coding theory uniquely selects the extended binary Golay code $\mathcal{G}_{24}$ with parameters $[24,12,8]$ as the PCE-optimal error-correcting structure.

*Proof.*

**Step 1 (Block length constraint).** The block length is $n = M = 24$, determined by the QFI mode count (Theorem Z.5): $M = 2ab = 2 \times 2 \times 6 = 24$.

**Step 2 (Rate selection on the predictive-recovery MacWilliams branch).** Under interface isotropy (Appendix Z, Theorem Z.5), Appendix Z (Definition Z.13b.0 and Theorem Z.13b.0a) identifies prediction payload and recovery syndrome as MacWilliams-dual PCE roles. The strict dual-asymmetry penalty is minimized only when $k=n-k$, giving $k=12$ and rate $R=1/2$ for $n=24$. The proof proceeds on this predictive-recovery branch.

**Step 3 (Distance maximization).** With constraints $(n, k) = (24, 12)$ and symmetric noise, minimizing $L[C]$ reduces to maximizing the minimum distance $d$.

Among binary linear $[24, 12]$ codes:

- The Singleton bound gives
  $$
  d \leq n - k + 1 = 24 - 12 + 1 = 13.
  $$

- The Griesmer bound for binary linear codes (Griesmer 1960),
  $$
  n \geq \sum_{i=0}^{k-1} \left\lceil \frac{d}{2^i} \right\rceil,
  $$
  rules out $d \geq 9$ when $n = 24$, $k = 12$. For $d = 9$:
  $$
  \sum_{i=0}^{11} \left\lceil \frac{9}{2^i} \right\rceil = 9 + 5 + 3 + 2 + \underbrace{1 + \cdots + 1}_{8} = 27 > 24,
  $$
  so no binary linear $[24, 12, 9]$ code exists, establishing $d \leq 8$.

- The Hamming (sphere-packing) bound (MacWilliams & Sloane 1977) independently confirms this. For $d = 9$ the correction radius is $t = 4$, and the Hamming bound requires
  $$
  \sum_{i=0}^{4} \binom{24}{i} \leq 2^{24-12} = 4096.
  $$
  But
  $$
  \sum_{i=0}^{4} \binom{24}{i} = 1 + 24 + 276 + 2024 + 10626 = 12951 > 4096,
  $$
  so the inequality is violated and no binary linear $[24, 12, 9]$ code can exist. Again we conclude $d \leq 8$.

The extended binary Golay code attains this bound exactly, achieving $d = 8$.

**Step 4 (Uniqueness at the bound).** The extended binary Golay code is the unique binary linear code achieving parameters $[24, 12, 8]$ (Pless 1968). No other code matches this performance.

**Step 5 (PCE selection).** PCE coordinate-label neutrality requires the selection rule to be invariant under relabeling of candidate coordinates; it does not require the selected code to be fixed by all of $S_{24}$. The extended Golay code is unique up to permutation equivalence, while its actual permutation automorphism group is $M_{24}$. Thus the fixed $(n,k,d)$ comparison selects its equivalence class, not an $S_{24}$-invariant code.

 Among codes achieving the distance bound, the Golay code is unique up to equivalence. Therefore, PCE optimization uniquely selects the Golay $[24, 12, 8]$ structure. ∎

**Remark: Error Correction Properties.** The minimum distance $d = 8$ implies the Golay code can:

- Detect up to $d - 1 = 7$ errors without misidentification
- Correct up to $\lfloor(d-1)/2\rfloor = 3$ errors with certainty

This is the maximum possible for any binary linear code of length 24 with rate 1/2.

---

#### R.4.2.1.3 Leech Lattice Construction via Golay Gluing

**Lemma R.4.5 (Conditional Leech Identification from a Registered Discriminant-Form Gluing Datum).** Let
$$
L_0=(\sqrt2E_8)^3,
\qquad
A_{L_0}=L_0^*/L_0,
$$
with discriminant quadratic form $q_{L_0}$. A registered Golay gluing datum consists of:

1. an explicit isometry of finite quadratic modules
$$
\phi:(A_{L_0},q_{L_0})\longrightarrow(B,q_B),
$$
not merely a vector-space identification with $\mathbb F_2^{24}$;
2. a specified embedded copy $C\subset B$ of the extended binary Golay code such that $H:=\phi^{-1}(C)$ is maximal totally isotropic;
3. a certified coset-minimum ledger
$$
m(h):=\min\{|x|^2:x\in L_0^*,\ [x]=h\},
$$
with the zero class evaluated on nonzero vectors, proving $\min_{h\in H}m(h)=4$.

Then
$$
L_H:=\bigcup_{h\in H}(g_h+L_0)
$$
is even, unimodular, and rootless of rank $24$, and hence is isometric to the Leech lattice $\Lambda_{24}$.

*Proof.* The even-lattice gluing theorem [Conway & Sloane 1999] sends the maximal totally isotropic subgroup $H$ to an even overlattice. Since $|H|=2^{12}$ and $\det L_0=2^{24}$, the overlattice is unimodular. The coset-minimum certificate gives minimum nonzero squared norm $4$, so the lattice is rootless. Niemeier classification [Niemeier 1973] then identifies it with $\Lambda_{24}$. An abstract isomorphism $A_{L_0}\cong\mathbb F_2^{24}$ without $\phi$, $q_B$, and the coset-minimum ledger is insufficient for this conclusion. ∎

#### R.4.2.1.4 Leech Lattice from PCE Constraints

**Theorem R.4.6 (Leech Lattice under the 24D admissibility criteria).**

Assume the admissible 24-dimensional vacuum lattice is required to be:

1. even,
2. unimodular, and
3. rootless, i.e. to have no vectors of squared norm $2$,

with rootlessness independently included in the admissibility ledger. QFI isotropy fixes an inner product but does not exclude norm-$2$ vectors. Under these stated criteria, the unique compatible lattice is the Leech lattice $\Lambda_{24}$.



*Proof.*

**Step 1 (Classification input).** By the Niemeier classification (Niemeier 1973), every even unimodular lattice in 24 dimensions is isometric to one of exactly 24 lattices, the Niemeier lattices.

**Step 2 (Root-system characterization).** Each Niemeier lattice is characterized by its root system, namely the set of vectors of squared norm $2$. Twenty-three of the Niemeier lattices have nonempty root system. Exactly one has empty root system.

**Step 3 (Rootless branch).** The unique Niemeier lattice with empty root system is the Leech lattice $\Lambda_{24}$ (Leech 1967; Conway 1969).

**Step 4 (Application of the admissibility criteria).** Under the stated criteria, the admissible lattice must lie in the 24-dimensional even unimodular class and must be rootless. By Steps 1–3, there is exactly one such lattice, namely $\Lambda_{24}$.

Therefore the admissibility criteria select the Leech lattice uniquely. ∎

---

#### R.4.2.1.5 Compatibility with M = 24 Factorization

**Proposition R.4.7 (Compatibility of $E_8$ Triple Structure with M = 24).**

On a registered gluing datum satisfying Lemma R.4.5, the resulting overlattice $L_H\cong\Lambda_{24}$ contains its declared base lattice
$$
L_0=(\sqrt2E_8)^3
$$
with index $[L_H:L_0]=2^{12}$. Its three rank-$8$ summands are dimensionally compatible with $24=3d_0$ on the $d_0=8$ branch.

*Proof.* Containment is part of the overlattice construction $L_0\subset L_H$, and the registered maximal isotropic subgroup has order $2^{12}$, giving the stated index. Rank additivity gives $24=3\cdot8$. These facts establish compatibility only. They do not show that the three blocks are Golay octads, identify them with generations, or construct the required discriminant-form marking; each stronger interpretation needs its own registered map. ∎

#### R.4.2.1.6 Automorphism Group Structure

**Proposition R.4.8 (Automorphism Group and Symmetry Structure).**

The automorphism group of the Leech lattice is:

$$
\operatorname{Aut}(\Lambda_{24}) = \mathrm{Co}_0
$$

where $\mathrm{Co}_0$ is the Conway group with order:

$$
|\mathrm{Co}_0| = 2^{22} \cdot 3^9 \cdot 5^4 \cdot 7^2 \cdot 11 \cdot 13 \cdot 23 = 8{,}315{,}553{,}613{,}086{,}720{,}000
$$

*Proof.*

**Step 1 (Automorphism group).** $\operatorname{Aut}(\Lambda_{24})$ consists of all orthogonal transformations $O \in O(24)$ such that $O(\Lambda_{24}) = \Lambda_{24}$.

**Step 2 (Conway's theorem).** By Conway (1969b), this group is denoted $\mathrm{Co}_0$ and has the stated order. The center contains $\{-I_{24}\}$.

**Step 3 (Sporadic simple group).** The quotient $\mathrm{Co}_1 = \mathrm{Co}_0/\{\pm I\}$ is a simple group, one of the 26 sporadic simple groups.

**Step 4 (Subgroup structure).** The stabilizer of various sublattice structures yields other sporadic groups:

- Stabilizer of a norm-4 vector: $\mathrm{Co}_2$
- Stabilizer of a norm-6 vector: $\mathrm{Co}_3$
- Stabilizer of a coordinate frame: $2^{12}:M_{24}$

The appearance of $M_{24} = \operatorname{Aut}(\mathcal{G}_{24})$ reflects the Golay code's role in the construction. ∎

---

#### R.4.2.1.7 The Conditional Golay Bridge

**Theorem R.4.9 (The Conditional Golay Bridge).**

Two statements are distinct:

1. the extended binary Golay code is, up to permutation equivalence, the unique binary linear $[24,12,8]$ code and attains the maximal distance in the binary linear $[24,12]$ class;
2. on a separately registered finite-quadratic-module gluing datum satisfying Lemma R.4.5 and Equation (R.4.2a.1), the embedded Golay copy indexes an even unimodular rootless overlattice $L_H\cong\Lambda_{24}$.

Thus the code class and the Leech construction form a valid bridge only through the explicit marking and coset-minimum certificate. The code parameters do not determine $\phi$, $q_B$, the glue representatives, or the ledger $m(h)$, and the theorem does not assert uniqueness of those markings.

*Proof.* For a binary linear $[24,12,d]$ code, the Griesmer bound (Griesmer 1960) requires
$$
24\ge\sum_{i=0}^{11}\left\lceil\frac d{2^i}\right\rceil.
$$
If $d\ge9$, the right-hand side is at least
$$
9+5+3+2+\underbrace{1+\cdots+1}_{8\text{ terms}}=27,
$$
a contradiction. Hence $d\le8$. The extended binary Golay code has parameters $[24,12,8]$, so it attains the maximum. The classification theorem for binary linear $[24,12,8]$ codes (Pless 1968; MacWilliams and Sloane 1977) states that every such code is permutation-equivalent to the extended binary Golay code; its hypotheses are exactly binary linearity and the three displayed parameters. This proves statement 1.

For statement 2, assume the separately registered finite-quadratic-module datum. Lemma R.4.5 applies to its isotropic embedded Golay subgroup and proves that the associated overlattice $L_H$ is even and unimodular. Equation (R.4.2a.1) asserts that every nonzero glue coset has minimum norm greater than $2$, while the base-lattice part of the certificate excludes norm-$2$ vectors there; hence $L_H$ is rootless. Theorem R.4.10 then identifies every positive-definite even unimodular rootless rank-$24$ lattice with $\Lambda_{24}$, so $L_H\cong\Lambda_{24}$.

Statement 1 uses only code parameters and code classification. Statement 2 additionally uses the marked discriminant-form embedding, glue representatives, and coset-minimum ledger. Therefore neither statement supplies the hypotheses of the other. ∎

#### R.4.2.1.8 Dual Optimality Summary

**Remark R.4.2: Conditional Code--Lattice Cross-Ledger.**

| Domain | Closed statement | Additional bridge datum |
|--------|------------------|--------------------------|
| Binary coding | The extended Golay code is the unique $[24,12,8]$ binary linear code up to equivalence | None for the coding theorem |
| Rank-$24$ lattices | The Leech lattice is the unique even unimodular rootless rank-$24$ lattice | None after evenness, unimodularity, rank, and rootlessness are assumed |
| Code-to-lattice transfer | The embedded code labels the Leech overlattice | The finite-quadratic-module isometry, maximal isotropic subgroup, glue representatives, and coset-minimum ledger of Lemma R.4.5; Equation (R.4.2a.1) for a Hamming-to-norm equivalence |

Common length/rank $24$ and separate extremality do not make the coding and lattice objectives identical. Their intersection is a certified correspondence only on the registered bridge datum; it is not forced by PCE coordinate neutrality or by the integer $24$ alone.



| Domain | Optimization Problem | Result | Role of $\mathcal{G}_{24}$ | Reference |
|--------|---------------------|--------|---------------------------|-----------|
| Information theory | Maximize $d$ for $[24, 12, d]$ codes | $d_{\max} = 8$ | Unique optimal code | Theorem R.4.4 |
| Lattice geometry | Find rootless even unimodular $\Lambda \subset \mathbb{R}^{24}$ | $\Lambda_{24}$ | Gluing code for $\sqrt{2}E_8^3 \to \Lambda_{24}$ | Lemma R.4.5 |

**Why the same structure appears in both domains:**

1. **Common constraint:** Both problems are constrained to dimension/length 24, arising from $M = 2ab = 24$ (Theorem Z.5).

2. **Common symmetry:** Both problems require isotropy—the code must be invariant under the symmetric group action (no preferred bit positions), and the lattice must be rootless (no preferred directions).

3. **Common optimality criterion:** Both problems maximize a "distance" measure—Hamming distance for codes, minimum norm for lattices—subject to structural constraints.

4. **Unique solution:** The intersection of these constraints has exactly one solution: the Golay code/Leech lattice pair.

This is the "Golay Bridge": the unique mathematical structure that optimally connects information-theoretic error correction to geometric sphere packing, with both ends anchored in PCE optimization at $M = 24$.

---

#### R.4.2.1.9 Connection to Spacetime Emergence

The Golay-Leech structure connects to emergent spacetime through the mode-channel correspondence:

**Step 1:** $M = 24$ QFI-active modes require spatial actualization channels.

**Step 2:** At equilibrium, channel count saturates at the kissing number: $M_{\text{phys}} = K(D)$.

**Step 3:** PCE mode-channel matching: $M_{\text{int}} = M_{\text{phys}}$ (Theorem Z.10).

**Step 4:** Unique solution: $K(D) = 24 \Rightarrow D = 4$.

**Step 5:** Local geometric realization: The 24-cell achieves $K(4) = 24$ and admits a regular honeycomb tiling of 4D Euclidean space.

The chain is complete:

$$
\text{Golay code} \xrightarrow{\text{gluing}} \Lambda_{24} \xrightarrow{K(D)=24} D=4 \xrightarrow{\text{local}} \text{24-cell} \xrightarrow{\text{network}} \text{4D spacetime}
$$

The code, lattice, and spacetime-dimension records share the integer $24$ but obey different implication chains. The predictive-recovery branch selects the code. A registered datum of Lemma R.4.5 may then construct $\Lambda_{24}$. Independently, the channel-complete mode-channel branch uses $M=K(D)=24$ to select $D=4$ and may use the $24$-cell as its local kissing configuration. Neither $\Lambda_{24}$ nor Golay gluing is a premise of the kissing-number implication.

Consequently the licensed diagram is
$$
M=24\longrightarrow
\begin{cases}
\mathcal G_{24},&\text{predictive-recovery code branch},\\
\Lambda_{24},&\text{only with the registered gluing datum},\\
D=4,&\text{independent channel-complete }M=K(D)\text{ branch}.
\end{cases}
$$
Code distance transfers to minimum lattice norm only when Equation (R.4.2a.1) is part of the marked construction. No code-to-spacetime, code-to-dynamics, or physical-vacuum-stability implication follows from the shared count.

PCE selection of the predictive-recovery code on the $M=24$ interface does not by itself enforce a lattice minimum norm. Minimum norm $4$ follows only on a registered gluing branch carrying the finite coset-minimum ledger of Lemma R.4.5, and that dimensionless norm statement does not establish physical vacuum stability without a separate dynamical realization certificate.

### R.4.2.3 Code Distance and the Registered Gluing Datum

**Proposition R.4.2a (Code Distance Does Not Replace the Gluing Certificate).** Binary Hamming distance is not invariant under an arbitrary vector-space identification
$$
A_{L_0}\cong\mathbb F_2^{24}
$$
and therefore does not by itself determine minimum norms of glue cosets. On the registered datum of Lemma R.4.5, rootlessness follows from the finite coset-minimum ledger $m(h)\ge4$. If a particular marked construction additionally proves
$$
\min_{h\in\phi^{-1}(C)}m(h)\ge4
\quad\Longleftrightarrow\quad
d(C)\ge8,
\tag{R.4.2a.1}
$$
then, and only then, code distance $8$ is equivalent to rootlessness within that marked construction.

*Proof.* The left side depends on the discriminant quadratic form, its marking, and minimum norms in the marked cosets; the right side depends on the chosen binary coordinate Hamming metric. Equation (R.4.2a.1) is precisely the missing compatibility theorem. Lemma R.4.5 proves the lattice conclusion once that finite compatibility ledger is supplied. ∎

**Corollary R.4.2b (Conditional Code-to-Rootlessness Transfer).** Assume the registered discriminant-form, marking, and coset-minimum datum of Lemma R.4.5 and assume that the marked construction satisfies Equation (R.4.2a.1). If the selected binary code is the extended Golay code $\mathcal G_{24}$ with $d=8$, then the resulting even unimodular rank-$24$ lattice is rootless and hence isometric to the Leech lattice.

*Proof.* The Golay parameter gives $d=8$. Equation (R.4.2a.1) transfers this Hamming-distance statement to the finite coset-minimum bound
$$
\min_{h\in\phi^{-1}(\mathcal G_{24})}m(h)\ge4.
$$
Lemma R.4.5 then proves rootlessness of the registered glued lattice. The lattice is even, unimodular, and rank $24$ by the same registered datum, so Niemeier's classification identifies it as $\Lambda_{24}$. A Euclidean packing-optimality statement requires its own prescribed-dimension energy or density theorem. Physical vacuum stability and a dynamical mass gap require separate certificates. ∎

**Corollary R.4.2b.1 (Conditional Universal-Optimality Support for Fixed-Dimension Lattice Subledgers).** Let a PU lattice subledger already be fixed to a Euclidean dimension $n\in\{8,24\}$ and to an admissible periodic-configuration class $\mathcal A_n$ with the density, covolume, and regularization conventions required by the corresponding universal-optimality theorem. Suppose the descended PCE pair cost on that subledger has the form
$$
V_f(X)=\sum_{x,y\in X}^{'} f(|x-y|^2)
\tag{R.4.2b.1}
$$
where $f$ is completely monotone on squared distance after the branch regularization, and suppose the accepted finite-response ledger proves that no non-pairwise, anomaly, quotient, calibration, or capacity term remains outside this cost. Then the $n=8$ subledger is minimized by the $E_8$ lattice and the $n=24$ subledger is minimized by the Leech lattice $\Lambda_{24}$ among the admissible configurations.

This support is fixed-dimension support only. It does not derive $d_0=8$, $M=24$, $D=4$, $K_0=3$, or the three-generation count, and it does not promote the $D_4$/24-cell leg to universal optimality. The $D_4$ and 24-cell statements remain the kissing-number, triality, and design-optimality statements already used elsewhere in the manuscript.

*Proof.* Under the stated hypotheses, the PCE cost is exactly an admissible completely monotone pair energy in a dimension where universal optimality is a theorem. Therefore $E_8$ in dimension $8$ and $\Lambda_{24}$ in dimension $24$ minimize the entire accepted pair-energy family, independently of the particular $f$. The conclusion is conditional on the dimension and admissible cost form already being fixed; the universal-optimality theorem is not a selector of those dimensions and supplies no theorem-level parent invariant for source roles outside the fixed-dimensional lattice subledgers. ∎

---

**Proposition R.4.2c (Golay--Leech Propagation Across Gauge, Lattice, and Generation Sectors).** Once the minimal branch fixes $M=24$, the registered code--lattice backbone has the following conditional propagation:

1. the predictive-recovery branch selects the extended binary Golay code $[24,12,8]$;
2. the retained count satisfies $M/2=ab=k=n_G=\dim_{\mathbb C}\mathrm{Gr}(2,8)=12$ on the cited branch;
3. on a registered discriminant-form/coset-minimum datum satisfying (R.4.2a.1), $d=8$ is equivalent to rootlessness of the resulting $24$-dimensional lattice;
4. the unique even unimodular rootless lattice in dimension $24$ is $\Lambda_{24}$;
5. the scaled $\sqrt2E_8^3$ scaffold is compatible with, but does not derive, the three-generation theorem.

Thus the common backbone propagates code distance and dimensionless norm isolation. It does not by itself establish physical vacuum stability, a decoder for physical noise, or an energy gap. ∎



### R.4.2.4 Niemeier Classification and Conditional Selection

**Theorem R.4.10 (Unique Rootless Positive-Definite Niemeier Lattice; Conditional PCE Selection).** Among positive-definite even unimodular lattices of rank $24$, exactly one has no norm-$2$ vectors: the Leech lattice $\Lambda_{24}$. Therefore any already-registered PCE branch whose admissibility conditions independently require a positive-definite even unimodular rootless rank-$24$ lattice selects $\Lambda_{24}$ uniquely. PCE alone does not supply positive definiteness, rootlessness, or physical-vacuum stability.

*Proof.* The Niemeier classification theorem (Niemeier 1973; Conway and Sloane 1999) applies to positive-definite even unimodular lattices of rank $24$. It gives exactly 24 isometry classes. Twenty-three classes have a nonempty root system consisting of their norm-$2$ vectors, and the remaining class has no norm-$2$ vectors. The classification identifies that remaining class as the Leech lattice $\Lambda_{24}$. Restricting any independently certified admissible class to the stated positive-definite, even, unimodular, rank-$24$, rootless conditions therefore leaves exactly the isometry class of $\Lambda_{24}$. ∎

**Remark R.4.2a: Nested Uniqueness.** Three finite statements meet at the number $24$: the registered mode-channel branch selects $D=4$ from $K(D)=24$; Niemeier classification contains $24$ even unimodular rank-$24$ lattices; and exactly one of them is rootless. Their conjunction identifies one rootless lattice label, not a unique physical vacuum without a dynamical realization certificate.


1. Among all dimensions $D$, only $D$ with $K(D) = 24$ works → unique $D = 4$
2. Among all dimensions $M$, only $M = 24$ has exactly 24 even unimodular lattices
3. Among those 24 lattices, only 1 (Leech) is rootless → unique vacuum

Each level selects a unique object from a finite set, with the selections interlocking via the number 24.

---

### R.4.2.5 Automorphism Group and Symmetry Structure

**Proposition R.4.4 (Automorphism Group).** The stabilizer in $\operatorname{Aut}(\Lambda_{24})$ of a coordinate frame has the form $2^{12}:M_{24}$, where $M_{24}=\operatorname{Aut}(\mathcal{G}_{24})$. This follows from Proposition R.4.8 (Step 4). ∎

**Remark R.4.2b: Physical Status of Sporadic Symmetries.** The emergence of sporadic simple groups ($\text{Co}_0$, $\text{Co}_1$, $M_{24}$) as automorphism groups of the framework's fundamental structures is mathematically necessary but physically subtle. These groups act on the 24-dimensional mode space, not directly on the 4-dimensional emergent spacetime. Physical observables in emergent spacetime reflect only those symmetries compatible with the dimensional reduction $24 \to 4$ via the mode-channel correspondence.

Whether sporadic group structure produces observable signatures—such as specific degeneracy patterns in quantum systems engineered to probe the full 24-mode space, or constraints on allowed transitions—remains an open question. The experimental predictions in **Section Z.29–Z.31** provide protocols for testing the $M = 24$ mode structure and Golay code organization; confirmation of these predictions would indirectly validate the mathematical structures whose automorphism groups are sporadic. Direct physical manifestations of sporadic symmetries represent an avenue for future theoretical and experimental investigation.

---

### R.4.2.6 Over-Determination and Structural Consistency

**Independence verification:** 
- Mechanism 1 (Topological derivation): relies on $\pi_2(\Sigma_8)$ structure, family-charge anomaly constraints, and the CP-violation requirement (Sections R.3–R.4.1).
- Mechanism 2 (Triality compatibility): relies on the marked real 8-carrier $\mathfrak{so}(8)$ structure and the $D_4$ diagram automorphism group $S_3$ (Proposition R.4.2).
- Mechanism 3 (Geometric compatibility): relies on sphere packing optimality and $E_8$/Leech lattice constructions (Section R.4.2).
- Mechanism 4 (Mode-count compatibility): relies on the QFI interface count $M=24$ from Theorem Z.5.

These four strands are logically distinct, though they share foundational constants ($d_0 = 8$, $\varepsilon_0=\ln2$) at the axiomatic level. Only Mechanism 1 derives the minimal family-count theorem. Mechanism 2 shows that a marked real 8-carrier has a canonical three-element triality orbit; Mechanism 3 shows that the geometric sector carries a compatible three-fold lattice scaffold; Mechanism 4 shows that the interface-mode count is compatible with three 8-dimensional blocks.

**Structural compatibility from QFI mode count:** The interface mode count $M = 24$ (**Appendix Z**, Theorem Z.5) admits the factorization:
$$
M = 24 = 8 \times 3 = d_0 \times N_{\text{gen}}.
$$
This factorization does not independently derive $N_{\text{gen}} = 3$; rather, it shows that the topological count is compatible with organizing the interface modes into three 8-dimensional blocks. The QFI structure is therefore a consistency check, not an additional derivation pathway.

**Qualitative assessment:** The convergence of one derivation with three nontrivial compatibility checks supports the internal coherence of the framework. The manuscript does not select $N = 3$ by parameter choice, but the proved result is the anomaly+CP minimality claim together with the pre-flavor PPI realization theorem.

**Remark: Methodological Note.** The strength of the consistency argument rests on the agreement between the topological derivation, the $D_4$ triality orbit, the $E_8$/Leech scaffold, and the QFI factorization. The latter three do not provide independent proofs of $N = 3$; they supply supporting structural checks. ∎

---

### R.4.2.7 Independent Mode-Channel Cross-Check

On the channel-complete branch, $M=24=K(D)$ selects $D=4$, and the $24$-cell realizes a local four-dimensional kissing configuration. This route depends on the mode-channel certificate, not on the Golay code or Leech lattice. The predictive-recovery, registered gluing, and mode-channel records may coexist, but they do not form an unconditional causal chain.

The correlation and stability protocols in Sections Z.29--Z.31 therefore test their own declared branches. A Golay correlation pattern would support the predictive-recovery encoding record; it would not by itself confirm the gluing datum, a physical decoder, dimensional reduction, or emergent spacetime.



The Golay-Leech structure connects to emergent spacetime through the mode-channel correspondence:

**Step 1:** $M = 24$ QFI-active modes require spatial actualization channels.

**Step 2:** At equilibrium, channel count saturates at the kissing number: $M_{\text{phys}} = K(D)$.

**Step 3:** PCE mode-channel matching: $M_{\text{int}} = M_{\text{phys}}$ (Theorem Z.10).

**Step 4:** Unique solution: $K(D) = 24 \Rightarrow D = 4$.

**Step 5:** Local geometric realization: The 24-cell achieves $K(4) = 24$ and admits a regular honeycomb tiling of 4D Euclidean space.

The chain is complete:
$$\text{Golay code} \xrightarrow{\text{gluing}} \Lambda_{24} \xrightarrow{K(D)=24} D=4 \xrightarrow{\text{local}} \text{24-cell} \xrightarrow{\text{network}} \text{4D spacetime}$$

The Golay code's error-correction properties (Theorem Z.13) suggest a robustness mechanism: the same rate-$\frac{1}{2}$ 12+12 organization that optimizes information protection may also constrain local geometric realizations toward noise-tolerant configurations. This is a heuristic stability argument; quantitative stability against explicit fluctuation/noise models would require specifying the dynamical perturbation model and showing that the induced geometry remains within the relevant regularity class.

**Experimental Signatures.** The Golay-Leech structure generates specific testable predictions detailed in **Section Z.29–Z.31**:

1. **Coordination number scaling (Prediction Z.2):** Effective neighbor count in $d_0 = 8$ quantum systems should scale as $K(D_{\text{eff}})$ with effective dimension.

2. **Dimensional stability (Prediction Z.3):** Systems with $M_{\text{int}} = 24$ modes embedded in $D \neq 4$ effective dimensions should exhibit instability or spontaneous dimensional reduction.

3. **Error correction correlations (Prediction Z.4):** The 24×24 mode correlation matrix should reveal the rate-$\frac{1}{2}$ 12+12 organization characteristic of the Golay code.

Confirmation of these predictions would provide direct empirical support for the Golay-Leech foundation of emergent spacetime geometry.


### R.4.2.8 Syndrome-Charge Homology

**Definition R.4.2.8a (Predictive Syndrome Complex).** Let $A$ be a finite abelian group of syndrome labels on a marked Golay-Leech carrier. A predictive syndrome complex is a finite chain complex
$$
C_2\xrightarrow{\partial_2}C_1\xrightarrow{\partial_1}C_0
$$
together with a local neutrality map
$$
\nu:C_0\to N
$$
to a finite abelian group $N$, satisfying
$$
\nu\circ\partial_1=0.
$$
A defect syndrome is an element $s\in\ker\nu$. Locally creatable neutral syndrome changes are elements of $\operatorname{im}\partial_1$. The syndrome-charge group is
$$
H_{\mathrm{synd}}
=
\ker\nu/\operatorname{im}\partial_1.
\tag{R.30}
$$

**Theorem R.4.2.8b (Charge as Stable Error-Correction Syndrome).** In a predictive syndrome complex:

1. local neutral updates preserve the class $[s]\in H_{\mathrm{synd}}$;
2. fusion of defects is addition in $H_{\mathrm{synd}}$;
3. two defect configurations are operationally charge-equivalent if and only if they represent the same class in $H_{\mathrm{synd}}$;
4. if all local observables commute with locally creatable neutral syndrome changes, then distinct classes in $H_{\mathrm{synd}}$ are superselection sectors.

*Proof.* A local neutral update changes a syndrome by
$$
s\mapsto s+\partial_1 c
$$
for some $c\in C_1$. Since the quotient defining $H_{\mathrm{synd}}$ identifies syndromes that differ by an element of $\operatorname{im}\partial_1$, the class $[s]$ is unchanged. This proves (1).

If two defects have syndromes $s_1,s_2\in\ker\nu$, their combined syndrome is $s_1+s_2$. Because $\nu$ is a homomorphism,
$$
\nu(s_1+s_2)=\nu(s_1)+\nu(s_2)=0,
$$
so the fused defect is again admissible, and its class is
$$
[s_1+s_2]=[s_1]+[s_2].
$$
This proves (2).

For (3), if two syndromes differ by $\partial_1c$, a local neutral update carries one to the other, so they are operationally equivalent. Conversely, any finite sequence of local neutral updates adds a finite sum of elements of $\operatorname{im}\partial_1$, hence changes the syndrome only within the same quotient class.

For (4), local observables cannot distinguish representatives inside one class because those representatives are related by local neutral updates. If two classes were connected by any local observable process, that process would implement a local neutral update changing one class into the other, contradicting quotient distinctness. Therefore distinct classes label superselection sectors. ∎

**Corollary R.4.2.8c (Golay Distance Protects Nontrivial Syndrome Charge).** On a marked Golay-stabilized branch where the minimum support of a nontrivial logical syndrome class is the Golay distance
$$
d_{\min}=8,
$$
no nontrivial syndrome-charge sector can be created, erased, or confused by an operator supported on fewer than eight marked carrier coordinates.

*Proof.* By definition of $d_{\min}$ on this branch, every representative of a nonzero class in $H_{\mathrm{synd}}$ has support at least $8$. An operator supported on fewer than eight coordinates can therefore change only representatives of the zero class or locally trivial representatives. By Theorem R.4.2.8b, nonzero syndrome-charge classes are preserved under such local neutral changes. ∎

### R.4.2.9 Golay Matroid Locality

**Definition R.4.2.9a (Golay Dependency Matroid).** Let $\mathcal G_{24}\subset\mathbb F_2^{24}$ be the marked extended binary Golay code, and let $G$ be a $12\times24$ generator matrix. The Golay dependency matroid $\mathcal M_G$ is the binary matroid represented by the columns of $G$. A circuit is a minimal linearly dependent set of columns. A cocircuit is a circuit of the dual matroid $\mathcal M_G^*$.

**Theorem R.4.2.9b (Self-Dual Golay Matroid Cuts and Dependencies).** Since
$$
\mathcal G_{24}=\mathcal G_{24}^{\perp},
$$
the matroid $\mathcal M_G$ is self-dual. Its circuits are exactly the minimal supports of nonzero Golay codewords, and its cocircuits are exactly the minimal supports of nonzero dual codewords. Therefore the circuit girth and cocircuit girth are both
$$
8.
\tag{R.31}
$$

*Proof.* For a binary matrix $G$, a set of columns $S$ is dependent exactly when there is a nonzero vector $c\in\mathbb F_2^{24}$ supported on $S$ such that
$$
Gc^T=0.
$$
Thus circuits are the minimal supports of nonzero vectors in the nullspace of $G$. Since $G$ generates $\mathcal G_{24}$ and the code is self-dual,
$$
\ker G=\mathcal G_{24}^{\perp}=\mathcal G_{24}.
$$
Therefore circuits are minimal supports of nonzero Golay codewords. The dual matroid is represented by a parity-check matrix for $\mathcal G_{24}$, but for a self-dual code a parity-check matrix may be chosen as a generator matrix. Hence cocircuits are minimal supports of nonzero codewords in $\mathcal G_{24}^{\perp}=\mathcal G_{24}$. The extended binary Golay code has minimum Hamming weight $8$, so both the smallest circuit and the smallest cocircuit have size $8$. ∎

**Corollary R.4.2.9c (Dependency-Cut Equivalence at the Golay Carrier).** On the marked 24-mode carrier, minimal predictive dependencies and minimal predictive cuts are dual presentations of the same Golay matroid structure. No nontrivial dependency or cut syndrome exists below weight $8$.

*Proof.* Theorem R.4.2.9b identifies circuits with minimal dependencies and cocircuits with minimal cuts. Self-duality identifies the two classes, and the common girth is $8$. ∎

### R.4.3 Synthesis: Why Three is Necessary

The family-count and flavor layers have distinct premise packages:

**Minimal admissible count:** Sections R.3–R.4.1 show that anomaly cancellation together with nontrivial CP capability selects $N=3$ as the smallest count in the declared uniform family-charge class. Proposition R.3.5.1a selects that count on its additional additive-monotone objective branch.

**Triality compatibility:** Section R.4.2 shows that a marked real 8-carrier with $\mathfrak{so}(8)$ structure has the canonical $D_4$ triality orbit $\{V,S^+,S^-\}$ and that the anomaly equations on this orbit reproduce $\{a,-a,0\}$. This is a representation-theoretic compatibility check, not a derivation of the family-charge symmetry or its physical realization.

**Geometric compatibility:** The Leech/$E_8$ construction and $M=24=8\times3$ carry a compatible three-fold scaffold. They do not independently select the family count.

**Phenomenological comparison:** The observed Standard Model count agrees with the selected value on the combined anomaly, CP-capability, and additive-monotone branch. Triality and lattice records test internal compatibility only.

## R.5 Conditional Mass-Hierarchy Model from $E_8$ Geometry

The following flavor model localizes wavepackets at selected $E_8$-related vacua and assigns Yukawa responses through overlap kernels. Hierarchical masses follow only after the localization, label, kernel, normalization, scale, and remainder certificates stated here and in Appendix T are imposed.

### R.5.1 Kähler Geometry and PCE-Compatible Potential

The flag manifold $\Sigma_8$ is a coadjoint orbit of $U(8)$. As a Kähler manifold, it admits a natural symplectic form and complex structure (Kobayashi & Nomizu 1969). The Kähler potential can be written on a dense coordinate chart as:
$$
K(Z, Z^\dagger) = \sum_{k=1}^7 \log\det(I_k + Z_k Z_k^\dagger),
$$
with metric $g = i\partial\bar\partial K$, where $Z_k$ are the coordinate matrices parametrizing the flag.

The $U(8)$ moment map evaluated at a point $x \in \Sigma_8$ is $\mu_{U(8)}(x) = U(x)\Lambda U(x)^\dagger$ where $\Lambda = \operatorname{diag}(\lambda_1,\dots,\lambda_8)$ with $\lambda_i - \lambda_{i+1} = \delta_i > 0$. A PCE-symmetric choice is $\delta_i = 1$ for all $i$.

Projecting to $\mathfrak{g}_{\rm SM}$ gives $\mu_{G_{\rm SM}} = \mathrm{pr}_{\mathfrak{g}_{\rm SM}} \mu_{U(8)}$. A PCE-compatible potential on $\Sigma_8$ is:
$$
V = (\kappa_\Sigma/2)\, \| \mu_{G_{\rm SM}} \|^2 + \Lambda_I\, V_S,
\tag{R.12}
$$
where the first term penalizes non-Abelian charges (selecting points in $L_{\mathrm{light}}$), and $V_S$ is a small Morse-Schubert term that breaks degeneracy and ensures non-degenerate minima at torus-fixed points $p_\sigma$.

For a diagonal matrix $B$ encoding the topological sector, define the moment-map component
$$
V_S(x):=-\langle B,\mu_{U(8)}(x)\rangle.
$$
If the restriction of this function to the relevant compact critical manifold is Morse with a unique minimizing torus-invariant point, it supplies the pinning term used below. The uniqueness property is a branch hypothesis and is not implied solely by summing values over invariant-point labels.

### R.5.2 Generation Vacua and $E_8$ Root Distances

Each topological sector $q \in L_{\mathrm{light}}$ is coupled to a linear pinning term
$$
\eta V_B = -\eta \langle\mu_{U(8)}, B(q)\rangle,
$$
where $\eta > 0$ is small and $B(q)$ is a diagonal matrix encoding the topological charge $q$.

**Theorem R.5.1 (Conditional Three-Sector Vacuum Persistence).** For each $q\in\{q_+,q_-,q_0\}$, assume:

1. the sector is a compact smooth manifold;
2. the minimum set $\mathcal C_q$ of $V_0$ is a compact Morse–Bott critical manifold with positive-definite normal Hessian;
3. $h_q=-\langle\mu_{U(8)},B(q)\rangle$ restricts to a Morse function on $\mathcal C_q$ with exactly one local minimum $p_q$;
4. a declared low-energy window contains a neighborhood of $\mathcal C_q$ and is separated from every other local minimum of $V_0$ by a positive $C^2$-stable gap.

Then, for all sufficiently small $\eta>0$, $V_q=V_0+\eta h_q$ has exactly one nondegenerate local minimum in that window. The three minima are distinct when the three sectors are disjoint.

*Proof.* The Morse–Bott perturbation theorem [Banyaga–Hurtubise 2004] applies by assumptions 2 and 3. It gives, near $\mathcal C_q$, one critical point of $V_q$ for each critical point of $h_q|_{\mathcal C_q}$, with index equal to the sum of the normal and tangential indices. The unique restricted minimum $p_q$ has tangential index zero, and the positive normal Hessian has normal index zero; hence the corresponding critical point is a nondegenerate local minimum. Assumption 3 excludes any second minimum near $\mathcal C_q$, and assumption 4 excludes additional minima in the declared low-energy window for sufficiently small $C^2$ perturbation. Disjointness of sectors makes the three resulting minima distinct. ∎

The three vacua are:
- $p_1$: vacuum for generation 1 (family charge $+a$)
- $p_2$: vacuum for generation 2 (family charge $-a$)
- $p_3$: vacuum for generation 3 (family charge $0$)

**Connection to $E_8$ Root System:**

The effective 8D real subspace (Cartan subalgebra) admits an $E_8$ coordinatization (Section R.2). Each vacuum $p_g$ corresponds to a point in this $E_8$ root space. For PCE-optimal configurations, these points lie at or near $E_8$ roots.

The charge pattern $\{a, -a, 0\}$ exhibits $\mathbb{Z}_2$ symmetry under $p_1 \leftrightarrow p_2$ exchange. In the absence of symmetry-breaking effects, this would enforce $d_\Sigma(p_1, p_3) = d_\Sigma(p_2, p_3)$. However, topological sector selection via the pinning term $V_B(q)$ and the discrete $E_8$ geometry can break this degeneracy, allowing distinct distances:
$$
d^2_{31} \neq d^2_{32}
\tag{R.13}
$$

This symmetry breaking is essential for generating the non-trivial mass ratio invariant $\mathcal{R} = d^2_{31}/d^2_{32}$ that distinguishes between the first two generations. The discrete values of $\mathcal{R}$ are determined by which pairs of $E_8$ roots are selected for $r_1$ and $r_2$ relative to $r_3$.

**$E_8$ Root Distances:**

If we identify the vacuum positions with $E_8$ roots $r_1, r_2, r_3$, then the squared geodesic distances correspond to squared $E_8$ root separations:
$$
d^2_{\Sigma}(p_g, p_{g'}) \propto |r_g - r_{g'}|^2
$$

From Section R.2.2, the allowed values are:
$$
d^2_{gg'} \in \{2, 4, 6, 8\}
\tag{R.14}
$$

For a natural PCE-favored configuration:
- $r_3$ at neutral sector (family charge 0)
- $r_1, r_2$ at positions with opposite family charges $\pm a$
- Typical pattern: $d^2_{13}, d^2_{23} \in \{2, 4, 6, 8\}$ with potentially different values

### R.5.3 Yukawa Couplings from Gaussian Overlaps

**Gaussian Localization:**

Near each generation vacuum, the effective internal potential admits a quadratic expansion $V(r) \approx V(p_g) + (r - r_g)^T K (r - r_g)$ where $K$ is the Hessian matrix. For a rotationally symmetric quadratic potential with curvature scale $\kappa$, the ground-state profile in each well is Gaussian:
$$
\psi_g(r) \propto \exp\left(-\frac{\kappa |r - r_g|^2}{2}\right) = \exp\left(-\frac{|r - r_g|^2}{2\xi^2}\right),
$$
where $\xi^2 = 1/\kappa$ encodes the localization width. Among distributions with fixed second moment, the Gaussian maximizes entropy by the maximum entropy principle (Bengtsson & Życzkowski 2006), aligning with PCE.

**Higgs Alignment:**

The largest Yukawa coupling arises when the Higgs vacuum lies nearest to a generation vacuum. Empirically, the top Yukawa $y_t \approx 1$ suggests the Higgs aligns with the heaviest generation: $r_H \approx r_3$. This defines $Y_3$ as the overall scale ($Y_3 = Y_{\max}$). We adopt the convention that generation 3 (the heaviest) has its vacuum at the origin of the Cartan subalgebra, or equivalently, at the point where the Higgs field is localized.

**Overlap Integrals:**

The Yukawa coupling between generations $g, g'$ and the Higgs field is modeled by the overlap integral of three Gaussian wavepackets:
$$
Y_{gg'} \propto \int d^8r \, \psi_g(r) \phi_H(r) \psi_{g'}(r)
$$

With Higgs localized near $r_3$ with width $\xi_H$ and generation wavefunctions with width $\xi$, the integral evaluates to:
$$
Y_{gg'} \propto \exp\left[ -\frac{1}{2\xi_{\mathrm{eff}}^2}\left(d^2_{\Sigma}(p_g, p_3) + d^2_{\Sigma}(p_{g'}, p_3) + \beta d^2_{\Sigma}(p_g, p_{g'})\right)\right],
\tag{R.15}
$$
where $\xi_{\mathrm{eff}}$ is an effective width combining $\xi$ and $\xi_H$, and $\beta$ is a geometrical factor depending on the relative Hessian curvatures. The squared Bures distance $d_B^2$ on $\text{Gr}(2,8)$ relates to the $E_8$ root distance $d_{E_8}^2$ via the interface mode geometry: for small SU(2) rotations of angle $u$ in a single AB block, $d_B^2 = u^2/4$ while $d_{E_8}^2 = 2u^2$, giving $d_B^2 = (1/8) d_{E_8}^2$. This factor of $1/8$ arises from the Bures metric normalization $g_B = F_Q/4$, which gives $d_B^2 = u^2/4$, combined with the $E_8$ root normalization $\|r\|^2 = 2$, which gives $d_{E_8}^2 = 2u^2$ (Lemma T.41.4).

For simplicity, we parametrize this as:
$$
Y_{gg'} \propto \exp\left[ -\alpha_1 d^2_{\Sigma}(p_g, p_3) - \alpha_1 d^2_{\Sigma}(p_{g'}, p_3) - \alpha_2 d^2_{\Sigma}(p_g, p_{g'})\right],
$$
where $\alpha_1, \alpha_2 > 0$ are effective coupling constants encoding the Gaussian widths and potential curvatures.

**Mass Hierarchy:**

This geometry naturally produces hierarchical masses:
- $Y_{33} \sim 1$ is maximal (both factors at $p_3$ where Higgs is localized)
- $Y_{11}$ and $Y_{22}$ suppressed by $\exp(-2\alpha_1 d^2_{3g})$ for $g=1,2$
- Off-diagonal couplings $Y_{12}, Y_{13}, Y_{23}$ suppressed by combinations of distances
- Diagonal dominance leads to mass eigenstates approximately aligned with generation basis

With typical $E_8$ distances $d^2 \in \{2, 4, 6, 8\}$ and $\alpha_1, \alpha_2 \sim O(1)$ in natural units, this produces the observed hierarchy $m_3 : m_2 : m_1 \sim 1 : 10^{-2} : 10^{-4}$ for charged leptons or quarks.

### R.5.4 The ξ-Free Mass Invariant

**Definition R.5.1 (Mass Hierarchy Invariant in the diagonal-alignment approximation).** Assume:

1. the Higgs is localized near the heaviest generation vacuum $p_3$ as in Section R.5.3;
2. the mass eigenstates are approximately aligned with the generation minima, so diagonal entries dominate; and
3. the same diagonal suppression coefficient $\alpha_1$ governs generations 1 and 2 in the Gaussian overlap model.

Define the ratio
$$
\mathcal{R} := \frac{\ln(m_3/m_1)}{\ln(m_3/m_2)} = \frac{\ln(Y_3/Y_1)}{\ln(Y_3/Y_2)}.
\tag{R.16}
$$

Under these hypotheses, the Gaussian overlap formula (R.15) gives
$$
Y_g := Y_{gg} = Y_{33}\exp\left(-2\alpha_1 d^2_{3g}\right)\qquad (g\in\{1,2,3\}),
$$
because $d_\Sigma^2(p_g,p_g)=0$ eliminates the $\alpha_2$ term on the diagonal.

Taking logarithms and using the diagonal-alignment identification $m_g\propto Y_g$ yields
$$
\ln(Y_3/Y_g) = \ln(m_3/m_g) = 2\alpha_1 d^2_{3g}\qquad (g=1,2).
$$
Therefore
$$
\mathcal{R} = \frac{\ln(m_3/m_1)}{\ln(m_3/m_2)} = \frac{2\alpha_1 d^2_{31}}{2\alpha_1 d^2_{32}} = \frac{d^2_{31}}{d^2_{32}}.
\tag{R.17}
$$

**Scope.** Equation (R.17) is the path-additive diagonal-alignment reading used for Dirac-type sectors. In the Majorana neutrino sector, the selected triad $T_\nu=(2,6,6)$ is not path-additive under a fully pairwise mass-ratio law; it is read in the anchored form $\mathcal R_\nu=\Delta_1/\Delta_2=3$ (Theorem T.24.11), with the $1\leftrightarrow2$ $A_2$ edge entering the PMNS mixing geometry rather than an independent third mass-ratio equation.

Within this approximation, the ratio is independent of the width parameter $\xi$, the common diagonal scale $\alpha_1$, the diagonal normalization, and the Higgs vacuum expectation value.

**Discrete Prediction within the approximation.**

Since $d^2 \in \{2,4,6,8\}$ from $E_8$ geometry (Eq. R.14), the ratio $\mathcal{R}$ must lie in the discrete set formed by the allowed squared-distance ratios. Imposing $m_3>m_2>m_1$ gives
$$
\boxed{\mathcal{R} \in \left\{\frac{4}{3}, \frac{3}{2}, 2, 3, 4\right\}}.
\tag{R.18}
$$

This is a sharp, falsifiable prediction of the diagonal-alignment Gaussian model, with no continuously adjustable parameter remaining once the discrete distance data are fixed.

## R.6 Phenomenological Comparison with Observed Fermion Masses

### R.6.0 Framework Evolution: Theorem--Model Boundary

The generation-number theorem and the flavor-response models are separate layers. $E_8$ supplies admissible discrete geometry, while physical label selection, continuous response coefficients, scale maps, and remainders remain model or certificate data. The flavor layer is not presently a zero-continuous-parameter prediction engine.



Before the observational comparison, the theorem and model layers are:

| **Aspect** | **Result in this appendix** | **Required branch data** |
|------------|-----------------------------|--------------------------|
| **Family count** | Smallest anomaly-descending CP-capable count is $3$ | Uniform family charges, regular anomaly descent, CP capability, additive-monotone selection |
| **Compatibility** | $D_4$ triality and $E_8$/Leech three-fold records | Marked real carrier and registered lattice construction |
| **Mass diagnostic** | Candidate set $\{4/3,3/2,2,3,4\}$ | Physical root triad and common leading response law |
| **Mixing mechanism** | Exponential overlap can suppress selected transitions | Packet kernel, distances, normalization, and response map |
| **Numerical status** | Retrospective comparisons | Scale, scheme, effective dimension, and remainder certificates remain open |

The $E_8$ geometry supplies a discrete candidate space for flavor models. It does not by itself select sector labels or close the Appendix-T flavor certificate, so the resulting comparisons are not zero-parameter predictions.

### R.6.1 Observational Data and Conditional Model Comparisons

The discrete distance-ratio set is a mathematical candidate set. Assigning one element to charged leptons or quarks is a model-selection step, and the fourth-order flavor equations retain the open coefficient, effective-dimension, scheme, and remainder entries of Appendix T. Numerical proximity after retrospective selection is calibration evidence, not a first-principles or zero-parameter prediction.



This section evaluates the framework's predictions against experimental data from the Particle Data Group (Navas et al. 2024). We compute the mass ratio invariant $\mathcal{R}$ for each fermion sector and compare with the discrete values predicted by $E_8$ root geometry.

**Charged Lepton Sector:**

Charged leptons are free from color confinement and provide a clean test. Using Particle Data Group 2024 values:
- $m_e = 0.51099895$ MeV
- $m_\mu = 105.6583745$ MeV  
- $m_\tau = 1776.86$ MeV

Computing the invariant:
$$
\ln(m_\tau/m_e) = \ln(1776.86/0.51099895) = \ln(3477.15) \approx 8.154
$$
$$
\ln(m_\tau/m_\mu) = \ln(1776.86/105.6583745) = \ln(16.816) \approx 2.823
$$
$$
\mathcal{R}_\ell = \frac{8.154}{2.823} \approx 2.889
\tag{R.19}
$$

**Comparison with the $E_8$ discrete candidate set:**
- Closest candidate value: $\mathcal R=3$
- Fractional difference: $|2.8890355-3|/3\approx3.70\%$

An explicit $E_8$ triad realizes $(d_{31}^2,d_{32}^2)=(6,2)$: choosing a half-integral root $r_3$, flipping six signs gives inner product $-1$ and distance $6$, while flipping two signs gives inner product $+1$ and distance $2$. Thus the candidate ratio $6/2=3$ is geometrically realizable.

**Assessment:** The observed value is close to one member of a five-value candidate set. Because the member, triad assignment, response law, and higher-order flavor entries are not selected independently of the comparison in this section, the result is calibration evidence rather than a zero-parameter first-principles prediction.

**Quark Sector Predictions:**

For up-type quarks: $\mathcal{R}_u = \ln(y_t/y_u)/\ln(y_t/y_c)$ should match a discrete value from the set $\{4/3, 3/2, 2, 3, 4\}$.

For down-type quarks: $\mathcal{R}_d = \ln(y_b/y_d)/\ln(y_b/y_s)$ should match a discrete value from the same set.

The quark sector analysis is complicated by QCD running effects and the difficulty of extracting Yukawa couplings from physical masses. Preliminary estimates suggest:
- Up quarks: $\mathcal{R}_u \approx 2-3$ (between discrete values 2 and 3)
- Down quarks: $\mathcal{R}_d \approx 1.5-2$ (near discrete value 3/2 or 2)

Further precision requires detailed analysis of renormalization group evolution and threshold corrections, which is beyond the scope of this appendix but represents an important direction for future work.

### R.6.2 Mixing Angles and CKM Matrix

The off-diagonal Yukawa couplings determine mixing angles. From the Gaussian overlap formula (R.15):
$$
Y_{12} \propto \exp\left[-\alpha_1(d^2_{13} + d^2_{23}) - \alpha_2 d^2_{12}\right]
$$

If the diagonal texture gives the displayed ratio, define
$$
E_{12}:=\alpha_1(d^2_{13}-d^2_{23})+\alpha_2d^2_{12},
\qquad
\theta_{12}\sim\frac{Y_{12}}{Y_{22}}\sim e^{-E_{12}}.
$$
Small $\theta_{12}$ requires $E_{12}>0$. The numerical band $0.01\le\theta_{12}\le0.1$ would require
$$
\ln 10\le E_{12}\le\ln100,
$$
whereas $E_8$ distances $d^2=O(1)$ and coefficients $\alpha_i=O(1)$ alone determine neither the sign nor this interval. Among the illustrative CKM magnitudes $0.22$, $0.004$, and $0.04$, only $0.04$ belongs to $[0.01,0.1]$.

For three mixing entries, a hierarchy follows only if their complete suppression exponents satisfy the corresponding strict ordering, for example $E_{13}>E_{23}>E_{12}>0$ when $\theta_{ij}\sim e^{-E_{ij}}$. Ordering selected pairwise distances does not establish that exponent ordering when each $E_{ij}$ contains several distances and coefficients. A numerical CKM prediction therefore requires the complete diagonal and off-diagonal texture, its normalization, and independently specified labels and coefficients.

**PMNS vs. CKM:**

The same mechanism explains why lepton mixing (PMNS) is large while quark mixing (CKM) is small: if lepton generation vacua have smaller separations $d^2_{\ell} < d^2_q$ or different Hessian ratios $\kappa_\ell < \kappa_q$, then lepton mixing angles can be $O(1)$ even with the same geometric structure.

### R.6.3 Status of Phenomenological Comparisons

The generation-number theorem is distinct from the later flavor-texture models. Mass ratios and mixing observables become forward predictions only after their discrete labels, continuous coefficients, response maps, scheme, and error intervals are fixed independently of the comparison data.



| Sector | Registered candidate set | Comparison value | Status |
|--------|--------------------------|------------------|--------|
| Charged leptons | $3$ selected from the root-triad catalog | 2.889 | Retrospective calibration residual $3.8\%$ |
| Up quarks | $\{3/2,2,3\}$ | $\sim2.4$ | Unselected candidate set |
| Down quarks | $\{3/2,2\}$ | $\sim1.9$ | Unselected candidate set |

These rows are model comparisons. Forward predictions require independently selected sector labels and response/error certificates.

## R.7 CP Violation and Jarlskog Invariant

For the standard three-family parametrization,
$$
J_{CP}
=c_{12}c_{23}c_{13}^2s_{12}s_{23}s_{13}\sin\delta_{CP}.
$$
Thus three nondegenerate families permit a physical phase, but $J_{CP}\ne0$ additionally requires every displayed mixing factor and $\sin\delta_{CP}$ to be nonzero. The anomaly/CP theorem imposes CP capability; it does not select $\delta_{CP}$ or prove exponential mixing suppression. Those are separate flavor-model inputs.

## R.8 Discussion and Limitations

### R.8.1 What the Framework Establishes and What It Models

The anomaly/CP argument establishes the minimal admissible three-generation pattern within its declared family-charge class, and Proposition R.3.5.1a supplies the exact pre-flavor PPI realization on its stated branch. The $D_4$, $E_8$, and Leech records are compatibility structures, not additional independent derivations of the generation count.

The flavor layer is conditional. Root distances provide candidate discrete diagnostics only after physical labels are selected. Exponential hierarchy, CKM/PMNS separation, CP phases, and the coefficient $\alpha=3/2$ require the particular overlap, potential, Schur, holonomy, scale, and remainder certificates stated in Appendix T. They are mechanisms or calibrated model outputs, not first-principles consequences of the generation theorem or of the Grassmannian orbit alone.

The model-independent statement about CP is limited: within the ordinary three-family mixing formalism, a nonzero Jarlskog invariant requires at least three generations. Its magnitude and phase are not fixed by that necessity result.



The theorem/model status is:

1. **Family count:** Theorem R.3.4 proves minimal admissibility in its uniform anomaly/CP class; effective R.3.5.1a adds the additive-monotone selection branch.
2. **Triality and lattice records:** $D_4$, $E_8$, and Leech structures are compatibility or realizability statements.
3. **Mass hierarchy and ratio catalog:** These follow within a selected localization and Gaussian-response model.
4. **Mixing angles and CKM/PMNS contrast:** These require sector labels, mass matrices, response maps, and normalization certificates.
5. **CP:** Three families permit a physical Jarlskog phase; nonzero magnitude requires nonzero phase and mixing factors.
6. **Coefficient $\alpha=3/2$:** This is conditional on the packet-width and Schur-normalization branch of Corollary T.41.3.

### R.8.2 What Requires Additional Input

The framework does not yet fully determine:

1. **Absolute Yukawa values:** Under $K$-invariance, the single Hessian eigenvalue $\alpha = 3/2$ is fixed (Corollary T.41.3); absolute values require the overall normalization scale and potential $K$-breaking effects
2. **Specific vacuum locations:** Requires minimizing $V_q$ with explicit $E_8$ embedding
3. **CP phase $\delta_{CP}$:** Obtained conditionally in Section T.22 as $\delta = 66.7^\circ$ from the Berry-holonomy model
4. **Running to low energies:** Requires RG evolution (standard QFT)

Item 3 is resolved within that Berry-holonomy model. Items 1-2 require explicit construction of the PCE potential $V_{PCE}$ on the attractor orbit.

**Baryogenesis Complexity (Conditional Appendix Y Reduction).** Holonomy supplies CP-odd data; a net yield additionally requires the driven transport, freeze-out, and residual certificates of Theorems Y.6.1i--Y.6.1k. The baryon asymmetry $\eta_B \approx 6 \times 10^{-10}$ is derived from the anomaly-holonomy coupling mechanism where Berry holonomy on $\text{Gr}(2,8)$ provides an effective CP-odd $\theta$ datum whose production effect is conditional on certified driven transport for electroweak sphalerons. The baryogenesis complexity is:

$$\kappa_B = \frac{\kappa_{EW}}{2} + \frac{\varepsilon_0}{N_g} = \frac{38.5}{2} + \frac{\ln 2}{3} = 19.25 + 0.2310\dots = 19.4810\dots$$

On the Appendix R/Y branch, additive PCE accounting assigns the CP half-step the exponent $\kappa_{CP}=\kappa_{EW}/2$, and the CP response remains an output of an accepted non-equilibrium transport certificate. These are a branch weight and a bounded CP response, respectively. A numerical $\eta_B$ follows only from an accepted Appendix Y source, transport, freeze-out, washout, normalization, and uncertainty certificate; neither static quantity generates the yield by itself. Since PCE costs add under sequential composition, the associated large-deviation exponent halves, giving $\kappa_{CP}=\kappa_{EW}/2$ (part (e) of Lemma Y.8.1). The CP asymmetry saturates ($\mathcal{F}_{CP} = \tanh(\mathcal{S}\sin\delta) \to 1$) due to the large sphaleron action $\mathcal{S} \cdot \sin\delta \approx 4.4 \gg 1$, yielding $\eta_B = (6.2 \pm 0.5) \times 10^{-10}$ in agreement with observation.

**Theorem R.8.2a (Covariant Quadratic-Curvature Response Kernel).** Let the regular metric branch carry the local quadratic-curvature truncation
$$
\Gamma_{\mathrm{grav}}[g]
=
\frac{1}{16\pi}
\int d^4x\sqrt{-g}
\left(\frac{R}{G_N}+\beta R^2\right)
$$
with matter defined by the PPI stress-energy variation and with no independent non-conserved gravitational source. The metric equation is
$$
\left(\frac1{G_N}+2\beta R\right)R_{\mu\nu}
-\frac12\left(\frac{R}{G_N}+\beta R^2\right)g_{\mu\nu}
-2\beta(\nabla_\mu\nabla_\nu-g_{\mu\nu}\Box)R
=
8\pi T_{\mu\nu}.
\tag{R.8.2a.1}
$$
It is covariantly conserved by diffeomorphism invariance. Its trace is
$$
-\frac{R}{G_N}+6\beta\Box R=8\pi T,
\qquad
T=-\rho+3p.
\tag{R.8.2a.2}
$$
Equivalently, on the scalar trace channel,
$$
R
=
-8\pi G_N(1-6\beta G_N\Box)^{-1}T.
\tag{R.8.2a.3}
$$
Thus the quadratic-curvature branch determines a covariant response operator
$$
G_{\mathrm{eff}}(\Box)
=
G_N(1-6\beta G_N\Box)^{-1},
\qquad
G_{\mathrm{eff}}(\Box)^{-1}
=
G_N^{-1}-6\beta\Box,
\tag{R.8.2a.4}
$$
rather than an algebraic local law whose first correction is proportional to $T$. In the strict slowly varying limit $\Box T=0$ the linear trace-channel coupling is $G_N$; any algebraic coefficient multiplying $T$ in $G_{\mathrm{eff}}(\rho,p)^{-1}$ requires a separate non-linear response-kernel certificate beyond the local $R^2$ trace truncation.

*Proof.* Varying $f(R)=R/G_N+\beta R^2$ gives the metric $f(R)$ equation
$$
f'(R)R_{\mu\nu}-\frac12f(R)g_{\mu\nu}-(\nabla_\mu\nabla_\nu-g_{\mu\nu}\Box)f'(R)=8\pi T_{\mu\nu}.
$$
Since $f'(R)=G_N^{-1}+2\beta R$, this is (R.8.2a.1). The left side is the Euler-Lagrange tensor of a diffeomorphism-invariant metric action; the Noether identity gives its covariant divergence zero, so the matter equation is compatible with $\nabla^\mu T_{\mu\nu}=0$. Taking the trace in four dimensions gives
$$
\left(G_N^{-1}+2\beta R\right)R
-2\left(G_N^{-1}R+\beta R^2\right)
+6\beta\Box R
=
8\pi T,
$$
and the $R^2$ terms cancel, yielding (R.8.2a.2). Rearranging gives $(1-6\beta G_N\Box)R=-8\pi G_NT$, hence (R.8.2a.3) and (R.8.2a.4) wherever the retained scalar response operator is invertible on the chosen branch domain. Setting $\Box T=0$ gives $R=-8\pi G_NT$ at linear trace level. ∎

### R.8.3 Epistemological Status

This appendix separates one conditional family-count result from later flavor models:

- The anomaly equations plus ordinary CKM CP capability give the smallest admissible count $N=3$ in the declared uniform family-charge class.
- The additive-monotone objective selects that smallest count on the effective R.3.5.1a branch.
- $D_4$ triality, $E_8$/Leech scaffolds, and QFI mode counts are compatibility records.
- Root-distance hierarchies, mixings, and phases require the independent flavor certificates described above.

### R.8.4 Conditional Connection to Baryogenesis

Within the Standard Model three-family mixing formalism, a physical CKM phase requires at least three families. A baryon yield additionally requires baryon-number violation, a CP-odd source, nonequilibrium transport, freeze-out, washout, normalization, and uncertainty certificates. The Berry-holonomy and sphaleron entries of Appendix Y are therefore conditional source-model data; they do not by themselves derive the observed $\eta_B$ or make exactly three generations cosmologically necessary.

The family-count theorem and baryogenesis model are compatible on their common branch. Baryogenesis is not an independent proof of the generation count, because alternative CP sources or enlarged family sectors are outside the theorem's declared class.

### R.8.5 Minimal Family-Charge Selection Audit

**Definition R.8.5a (Admissible Minimal Family-Charge Selection Problem).** In the $U(1)_F$ family-charge class of Theorem R.3.4, an admissible charge multiset is a finite multiset

$$
\mathcal Q=\{q_1,\ldots,q_N\}\subset\mathbb Z
$$

of family charges satisfying:

1. **(P1) Linear anomaly cancellation:** $\sum_i q_i=0$.
2. **(P2) Cubic anomaly cancellation:** $\sum_i q_i^3=0$.
3. **(P3) Non-triviality:** not all $q_i$ vanish.
4. **(P4) CP-active distinctness:** at least three distinct charge values occur.
5. **(P5) PCE cost monotonicity:** among multisets satisfying (P1)--(P4), the realized pre-flavor family-redundancy branch minimizes

$$
L(\mathcal Q)=L_0+N L_{\mathrm{block}}+L_{\mathrm{mix}}(N),
$$

where $L_{\mathrm{block}}>0$ and $L_{\mathrm{mix}}$ is nondecreasing in $N$, as in Proposition R.3.5.

Two nonzero integer rescalings $\mathcal Q$ and $\lambda\mathcal Q$ with $\lambda\in\mathbb Z\setminus\{0\}$ are identified as the same $U(1)_F$ charge orbit.

**Theorem R.8.5b (PCE Selection of $N_g=3$ in the Family-Charge Class).** Under Definition R.8.5a, the unique minimal-cost realized orbit in the $U(1)_F$ family-charge class is

$$
\mathcal Q=\{a,-a,0\},
\qquad a\in\mathbb Z\setminus\{0\},
$$

and the selected generation count is $N_g=3$.

*Proof.* For $N=1$, (P1) gives $q_1=0$, contradicting (P3). For $N=2$, (P1) gives $\{q,-q\}$, which has at most two distinct charge values and therefore violates (P4).

For $N=3$, write $q_3=-q_1-q_2$. Then

$$
q_1^3+q_2^3+(-q_1-q_2)^3=-3q_1q_2(q_1+q_2).
$$

Thus (P2) forces $q_1=0$, $q_2=0$, or $q_1+q_2=0$. With (P3), every case gives the orbit $\{a,-a,0\}$ with $a\ne0$. This orbit has exactly three distinct charge values and satisfies (P1)--(P4).

Now let $N>3$ and suppose some multiset satisfies (P1)--(P4). Since the $N=3$ orbit already satisfies (P1)--(P4), monotonicity gives

$$
L_0+N L_{\mathrm{block}}+L_{\mathrm{mix}}(N)
>
L_0+3 L_{\mathrm{block}}+L_{\mathrm{mix}}(3),
$$

because $(N-3)L_{\mathrm{block}}>0$ and $L_{\mathrm{mix}}(N)\ge L_{\mathrm{mix}}(3)$. Hence no $N>3$ multiset can minimize the PCE cost in Definition R.8.5a. Therefore the realized pre-flavor family-redundancy branch has $N_g=3$ and charge orbit $\{a,-a,0\}$. ∎

**Remark R.8.5c (No Exhaustive Classification of All Larger Charge Multisets).** Theorem R.8.5b is a minimal-selection theorem, not an exhaustive classification of all integer multisets satisfying (P1)--(P4). For example,

$$
\{-20,-14,-1,17,18\}
$$

has sum $0$, cube-sum $0$, five distinct nonzero charges, and no vectorlike pair. Such larger anomaly-free multisets are PCE-demoted by (P5) unless additional response-relevant flavor data are appended as a different branch.

**Corollary R.8.5d (Scope of the $U(1)_F$ Selection).** Theorem R.8.5b is internal to the integer $U(1)_F$ family-charge class. Non-Abelian family symmetries, flavor-potential branches, response-active extra generations, sterile-neutrino sectors, and defect-completed family labels are different candidate classes with their own anomaly, embedding, threshold, flavor, and PCE ledgers.

*Proof.* Definition R.8.5a fixes the candidate object as an integer charge multiset for a $U(1)_F$ family symmetry. Non-Abelian representations and later flavor-potential data are not such multisets; they therefore belong to different ledgers. Sterile sectors and defect completions may be gauge-null or anomaly-inflow data while still changing neutrino, threshold, or flavor response maps, so they also require separate ledgers. ∎

**Theorem R.8.5e (Generation-Branch Catalog under Premise Relaxation).** The current generation-count theorem has the following finite premise-sensitive status.

1. If $U(1)_F$ is treated as a predictive-frame redundancy, the uniform family-charge class of Definition R.8.5a is imposed, CP-active mixing is required, and the PCE monotone minimal-selection rule is retained, then Theorem R.8.5b selects the unique response-active orbit
$$
\{a,-a,0\}
\tag{R.8.5e.1}
$$
and $N_g=3$.

2. If $U(1)_F$ is treated as a physical global update channel rather than a redundancy, the anomaly equations in Theorem R.3.4 are no longer quotient-descent constraints. The generation count is then not fixed by the current $U(1)_F$ theorem and must be entered as a separate branch with its own anomaly/current ledger.

3. If CP-active mixing is not required by the downstream flavor or baryogenesis branch, $N=1$ and $N=2$ family multisets are not excluded by the family-anomaly equations alone. They survive only as branches with no physical CKM phase and with baryogenesis/flavor consequences recorded separately.

4. If the PCE minimal-selection rule is relaxed, larger anomaly-free charge multisets such as $\{a,-a,b,-b\}$ or finite sums of opposite pairs survive as response-active branches exactly when their threshold, flavor, neutrino, or CP maps are retained. Pure duplicate labels with no retained response are removed by the PPI/PCE response quotient.

5. Non-Abelian family symmetries, sterile-neutrino sectors, Majorana/seesaw branches, boundary/interface completions, and defect-fusion family labels are outside the integer $U(1)_F$ catalog. They are admissible only through their own finite anomaly-bordism, determinant-orientation, flavor, and threshold ledgers.

Thus failure of a later flavor texture, neutrino row, CKM/PMNS profile, or baryogenesis certificate does not refute the structural $N_g=3$ branch; it identifies a downstream branch failure. Conversely, failure of the $U(1)_F$ redundancy, CP-active, or PCE minimal premises demotes the generation count to the bounded catalog above.

*Proof.* Item 1 is Theorem R.8.5b. Item 2 is Theorem X.8d applied to the distinction between redundancies and physical update channels. Item 3 follows from the proof of Theorem R.3.4: $N=1$ cannot realize a nonzero charge under $\sum F_g=0$, and $N=2$ has no physical CKM phase, but the anomaly equations alone do not exclude it when CP is not demanded. Item 4 follows from Remark R.8.5c and the response quotient: larger anomaly-free multisets are not minimal but can become response-active if extra maps are retained, while response-null copies are removed. Item 5 is Corollary R.8.5d. ∎

## R.9 Summary

*   **Topology:** On the $d_0=8$ flag-manifold branch, $\pi_2(\Sigma_8)\cong\mathbb Z^7$.
*   **$E_8$ Geometry:** A registered $E_8$ root model supplies candidate squared distances $\{2,4,6,8\}$; its physical embedding and labels are branch data.
*   **Gauge–Topology Map:** The declared gauge embedding induces the stated homomorphism to the Cartan weight lattice.
*   **Family Minimality:** On the regular uniform-$U(1)_F$ anomaly-descent branch with CP capability required, the smallest admissible pattern is $\{a,-a,0\}$. Larger anomaly-free patterns exist.
*   **Family Selection:** Effective Proposition R.3.5.1a selects $N_g=3$ under its additive-monotone objective. Response-null removal is supplied separately by Corollary P.6.1b.8.
*   **Compatibility Records:** Triality, the scaled $E_8^{\oplus3}$ scaffold, interface mode count, and Golay code are cross-branch compatibility facts, not further proofs of $N_g=3$.
*   **Flavor Diagnostics:** A registered triad and common leading response give candidate ratios. Physical labels, coefficients, effective dimensions, scales, phases, schemes, and remainders remain Appendix-T certificate data.
*   **Phenomenological Status:** Charged-lepton and quark comparisons are calibration evidence until the flavor certificate is specified independently and evaluated on held-out data.
*   **Gauge/Family Relation:** Gauge and family constructions share some MPU scaffolding but follow different conditional inference chains; neither theorem derives the other.