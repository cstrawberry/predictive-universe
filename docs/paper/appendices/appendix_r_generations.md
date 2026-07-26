# Appendix R: Three-Generation Structure and Fermion Mass Hierarchy

## R.0 Introduction

This appendix separates generation topology, $D_4$ triality, binary coding, and lattice gluing. On SM15, linear and cubic anomaly cancellation plus a registered CP-active realization supplies the smallest admissible three-charge orbit; on SM16, the linear anomaly equation must be supplemented by primitive charge-norm minimization. The additive-monotone family objective separately selects the realized count. Triality and the factorization $24=3\cdot8$ are compatibility records. The Golay code is selected only on the predictive-recovery branch. From a marked Golay copy, the explicit coordinate construction following Lemma R.4.5 produces a mathematical Leech lattice; the separate $(\sqrt2E_8)^3$ realization still requires the registered discriminant-form and norm-certificate routes of Lemma R.4.5 and Corollary R.4.2b. None of these finite structures alone supplies masses, vacuum dynamics, or spacetime.



This appendix studies a conditional family-count branch and separate flavor-response models on the MPU perspective geometry. On the minimal Hilbert-carrier branch, $H_0\cong\mathbb C^8$ and the labeled rank-one perspective space is the complete flag manifold
$$
\Sigma_8\cong U(8)/U(1)^8.
\tag{R.1}
$$
Theorem 23 supplies the dimension lower bound under its Hilbert-carrier hypotheses, while equality $d_0=8$ uses the additional minimality branch. The family count further requires the branch-specific anomaly and charge-norm premises, a registered CP-active realization, and the additive family-count objective below. Fermion masses and mixings require the independent localization, label, response, scale, and remainder certificates of the flavor layer.

**Connection to Gauge Structure:** The perspective space $\Sigma_8$ and its associated topology emerge from the same fundamental structure as the Standard Model gauge group. As established in **Appendix G** (Proposition G.M1 together with the capacity-saturating, SM-type anomaly analysis of Theorem G.8.4b and Corollary G.8.4c; Section G.8.5), the MPU Hilbert space $H_0 \cong \mathbb{C}^8$ admits a thermodynamically optimal partition:
$$
H_0 \cong H_{\mathrm{active}} \oplus H_{\mathrm{inert}} \cong \mathbb{C}^2 \oplus \mathbb{C}^6
$$
using the conditional registered-reset bound $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ together with the separate structural reference $\varepsilon_0=\ln2$; no physical saturation is inferred from the attractor label alone. This partition is rigorously derived in **Appendix Z (Theorem Z.1)** via the Principle of Physical Instantiation (PPI), which fixes the active kernel dimension to $a = 2$ on the attractor-saturating branch. The partition determines both:
1. The **gauge structure:** $G_{\mathrm{SM}} = SU(3)_C \times SU(2)_L \times U(1)_Y$ in the conditional sense of Theorem G.8.4b
2. The **perspective space:** $\Sigma_8 = U(8)/U(1)^8$ (complete flag manifold)

The gauge and family sectors use related MPU branch data but have different proof obligations. Gauge selection does not imply the family count, and the family-count theorem does not imply flavor observables.

**Generation Count and Structural Compatibility:**

1. **Minimal admissible family count:** Within the registered uniform $U(1)_F$ class, Theorem R.3.4 gives the smallest CP-capable primitive orbit at $N=3$ from the linear and cubic anomaly equations on SM15, and from the linear anomaly equation plus primitive charge-norm minimization on SM16. Proposition R.3.5.1a selects the realized count only under its additive-monotone family objective. Response-null labels are removed independently by Corollary P.6.1b.8.
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

Three registered layers drive the construction:

1. **Topology:** $\pi_2(\Sigma_8)\cong\mathbb Z^7$ supplies the integral sector group.
2. **Marked gauge–topology map:** Definition R.3.1 and Theorem R.3.1 construct
   $$
   \Phi:\pi_2(\Sigma_8)\longrightarrow X^*(T_{\mathrm{SM}})
   $$
   only after the gauge representation and ordered torus characters are fixed.
3. **Family selection:** Semisimple Cartan neutrality defines the candidate lattice $\ker_{\mathbb Z}C$; full $SU(3)\times SU(2)$ singletness requires the trivial-isotypic certificate. On SM15, the linear and cubic anomaly equations select $\{a,-a,0\}$ at the smallest CP-capable count. On SM16, the linear anomaly equation alone does not select that orbit; primitive normalization and the strict charge-norm objective do. The additive-monotone family objective then selects the realized count.

The resulting division of labor is exact. The marked character map classifies candidate gauge charges, the root-action certificate decides full nonabelian neutrality, Theorem R.3.4 supplies the branch-resolved charge constraints and smallest CP-capable orbit, Lemma R.3.4a supplies a CP-active realization, and Proposition R.3.5.1a supplies realized-family minimality. The flavor layer then uses separately registered localization, labels, response kernels, scales, and remainder bounds.

## R.0.1 Notation and Conventions

To aid clarity, we summarize the key mathematical objects and their notation:

| Symbol | Meaning | Defined In |
|--------|---------|------------|
| $H_0$ | MPU Hilbert space, $\mathbb{C}^8$ | Theorem 23 |
| $\Sigma_8$ | Perspective Space on the ordered rank-one context branch, $U(8)/U(1)^8$ | Corollary 26 |
| $\pi_2(\Sigma_8)$ | Second homotopy group, $\mathbb{Z}^7$ | Theorem R.1.1 |
| $\eta_i=x_i$, $1\le i\le7$ | Integral basis of $H^2(\Sigma_8;\mathbb Z)$ | Eq. R.4 |
| $q=(q_1,\ldots,q_7)$ | Unrestricted integral topological-sector coordinate vector | Eq. R.5 |
| $G_{\mathrm{SM}}$ | SM gauge group, $SU(3)_C \times SU(2)_L \times U(1)_Y$ | Appendix G.8 |
| $L_{\mathrm{light}}$ | Cartan-neutral candidate sublattice; full singletness separately certified | Definition R.3.2 |
| $U(1)_F$ | Registered family redundancy or physical-symmetry branch | Theorem R.3.4; Theorem R.8.5e |
| $F_g=\ell_F(q^{(g)})$ | Family charge after the primitive homomorphism $\ell_F$ is registered | Theorem R.3.4 |
| $\mathrm{Rep}$ | Predictive block (fermion representation) | Definition R.3.3 |
| $E[q]$ | Energy in a fixed topological sector (infimum over maps) | Theorem R.3.0 |
| $p_g=\ell_{q_g}(m_{q_g}(\eta))$ | Localization center of the reduced-sector minimum | Section R.5.2 |
| $Y_{gg'}$ | Yukawa coupling matrix element | Eq. R.15 |
| $M$ | Interface mode count, 24 | Appendix Z, Theorem Z.5 |
| $E_8$ | Exceptional Lie group / root system | Section R.2.1 |
| $D_4$ | Root system of $\mathfrak{so}(8)$; triality compatibility scaffold | Proposition R.4.2 |
| $\Lambda_{24}$ | Leech lattice in 24 dimensions | Section R.4.2 |
| $\mathcal{R}$ | Mass hierarchy invariant | Eq. R.17 |

**Conventions:**
- Generators of $SU(N)$ are anti-Hermitian in the Lie algebra
- Chern classes $c_1(L)$ take values in $H^2(M; \mathbb{Z})$
- Geodesic distance $d_\Sigma(p,p')$ uses the registered equal-simple-root invariant Kähler metric $g_\delta$ on $\Sigma_8$
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

The degree-two cohomology has the integral presentation
$$
H^2(\Sigma_8;\mathbb Z)
\cong
\left(\bigoplus_{i=1}^8\mathbb Zx_i\right)
\big/
\left\langle\sum_{i=1}^8x_i\right\rangle.
$$
Because the relation vector $(1,\ldots,1)$ is primitive, the seven classes
$$
\eta_i:=x_i,\qquad i=1,\ldots,7,
\qquad
x_8=-\sum_{i=1}^7\eta_i
\tag{R.4}
$$
form an integral basis of $H^2(\Sigma_8;\mathbb Z)$ (Brion 2005; Fulton 1997).

Since $\Sigma_8$ is simply connected, the Hurewicz map gives $\pi_2(\Sigma_8)\cong H_2(\Sigma_8;\mathbb Z)$. For a smooth map $f:S^2\to\Sigma_8$, define
$$
q_i
:=
\left\langle\eta_i,f_*[S^2]\right\rangle
=
\int_{S^2}f^*(x_i)
\in\mathbb Z,
\qquad i=1,\ldots,7.
\tag{R.5}
$$
The remaining Chern integer is
$$
k(q)
:=
\left(q_1,\ldots,q_7,-\sum_{i=1}^7q_i\right)
\in
\left\{k\in\mathbb Z^8:\sum_{i=1}^8k_i=0\right\}.
\tag{R.6}
$$
The map $q\mapsto k(q)$ is an isomorphism from $\mathbb Z^7$ onto the displayed kernel. The simple-root classes $x_i-x_{i+1}$ are not an integral basis: their pairings $d_i=k_i-k_{i+1}$ satisfy
$$
\sum_{i=1}^7i\,d_i\equiv0\pmod8,
$$
and span an index-$8$ sublattice. A topological sector is therefore specified exactly once by the unrestricted vector $q\in\mathbb Z^7$.

## R.2 $E_8$ as Information-Optimal Geometry in Eight Dimensions

### R.2.1 Motivation and Optimality

The relevant state-space for a single MPU includes pure states ($\mathbb{CP}^7$) and the perspective space $\Sigma_8 = U(8)/U(1)^8$ governing measurements and transitions. Finite physical resources and PCE optimization favor discrete coordinatizations that maximize packing density, minimize distortion, and maximize symmetry for uniform local neighborhoods.

In eight dimensions, the **$E_8$ root system** emerges as the natural coordinatization of the 8-dimensional real subspace (weight space / Cartan subalgebra) for several converging reasons:

1. **Packing optimality:** The $E_8$ lattice achieves the optimal sphere packing density in 8 dimensions (Viazovska 2017). This supplies a canonical discrete scaffold on the 8D real subspace that can organize internal "positions" efficiently.

2. **Division algebra structure:** The framework's $d_0 = 8$ is related to octonionic structure via the Radon-Hurwitz theorem (**Appendix Z, Theorem Z.3**), which constrains division algebras to dimensions $\{1, 2, 4, 8\}$. **Appendix Z (Corollary Z.2)** establishes the octonionic connection: the existence of octonions (dimension 8) is tied to the maximal value $\rho(8) = 8$ in the Radon-Hurwitz function, providing a secondary coherence check on the 8-dimensional branch rather than the proof of necessity for $d_0 = 8$. The $E_8$ root system naturally encodes this octonionic structure.

3. **Maximal symmetry:** The 240 roots of $E_8$ provide maximal symmetry for uniform local neighborhoods, consistent with PCE's preference for high-symmetry configurations that minimize descriptive complexity.

**Conclusion:** $E_8$ provides a privileged, symmetry-rich, discrete internal geometry consistent with PCE motivations. We adopt $E_8$ as the canonical internal coordinate system on the effective 8D real subspace.

**Remark R.2.0: $E_8$ Uniqueness from Information-Theoretic Optimality.**

The following mathematical properties make $E_8$ an admissible distinguished scaffold in eight dimensions. Their translation into a PCE cost is a registered modeling choice, not a consequence of the lattice theorems:

1. **Rank Matching:** $E_8$ has rank 8, matching the 8-dimensional Cartan subalgebra (weight space) relevant to $U(8)$.

2. **Sphere Packing Optimality:** The $E_8$ lattice achieves the optimal sphere packing density in 8 dimensions (Viazovska 2017), minimizing wasted volume. This aligns with PCE's drive for maximal information density per unit volume, as optimal packing maximizes the number of distinguishable states in a bounded region.

3. **Kissing Number Maximization:** $E_8$ has kissing number 240, the maximum for any lattice in 8 dimensions. Each lattice point has $240$ nearest neighbors. Interpreting that coordination number as distinguishability or error-correction benefit requires a separately specified code, metric, and noise model.

4. **Octavian compatibility:** After a conventional rescaling, the additive lattice underlying a chosen maximal order of integral octonions (the octavians) is isometric to $E_8$. This statement depends on the chosen octonion multiplication table and maximal order. The displayed $\mathbb Z$-span of $\{1,e_1,\ldots,e_7,\tfrac12(1+e_1+\cdots+e_7)\}$ is not the $E_8$ lattice: it contains $\mathbb Z^8$ and hence norm-one coordinate vectors. In the paper's root normalization, $E_8$ has minimum squared norm $2$ and exactly $240$ minimal vectors. The octavian realization is a compatibility model, not a consequence of the Radon--Hurwitz dimension count.

5. **Self-Duality:** $E_8$ is self-dual, meaning $E_8^* = E_8$. This means that the Euclidean dual lattice coincides with the original lattice. It does not eliminate orientation choices or prove a PCE cost minimum; either interpretation requires an explicit registered objective.

6. **Leech Lattice Connection:** The 24-dimensional Leech lattice $\Lambda_{24}$, which achieves the optimal sphere packing density in 24 dimensions (Cohn, Kumar, Miller, Radchenko & Viazovska 2017), contains a sublattice isometric to $\sqrt{2}E_8 \oplus \sqrt{2}E_8 \oplus \sqrt{2}E_8$; by contrast, the direct sum $E_8 \oplus E_8 \oplus E_8$ is a distinct Niemeier lattice (minimum norm 2). A registered occurrence of this sublattice is compatible with the three-block rank count in Section R.4.2. It neither supplies the required Leech gluing datum nor derives a physical three-family map from $M=24$.



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

| Algebra | Root count | Simply-laced | Root lattice unimodular/self-dual | Packing optimal |
|---------|------------|--------------|-------------------|-----------------|
| $A_8$   | 72         | ✓            | ✗ ($\det=9$)       | ✗               |
| $B_8$   | 128        | ✗            | ✓ (odd; $\det=1$) | ✗               |
| $C_8$   | 128        | ✗            | ✗ ($\det=4$)       | ✗               |
| $D_8$   | 112        | ✓            | ✗ ($\det=4$)       | ✗               |
| $E_8$   | 240        | ✓            | ✓ (even; $\det=1$)| ✓               |

Within the displayed rank-$8$ root-lattice comparison, $E_8$ is the only entry that is simultaneously simply laced, even unimodular, and packing-optimal. Treating those properties as a PCE cost minimum is a registered modeling choice; the lattice theorems establish the properties, not that physical selection rule.

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

The Weyl group of $E_8$ acts transitively on the roots, so it suffices to choose a Type-II representative. Flipping $2$, $4$, or $6$ signs preserves the even-parity condition and gives inner product $+1$, $0$, or $-1$, respectively; Weyl transport gives the result for every chosen root. In particular, flipping 2 signs gives a root with dot product +1, flipping 4 signs gives dot product 0, and flipping 6 signs gives dot product -1 (preserving even parity of minus signs).

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

**Definition R.3.1 (Marked SM Gauge Embedding).** A registered gauge embedding is a faithful unitary representation
$$
\iota:G_{\mathrm{SM}}\longrightarrow U(8)
$$
of the chosen global form of the gauge group. It acts on
$$
\Sigma_8=U(8)/T^8
$$
by
$$
g\cdot(uT^8)=\iota(g)uT^8.
$$
Choose a maximal torus $T_{\mathrm{SM}}$ and a marking that conjugates $\iota(T_{\mathrm{SM}})$ into $T^8$. The resulting ordered characters $\lambda_1,\ldots,\lambda_8$ are part of the charge-map certificate. No nonabelian factor is required to lie in the abelian stabilizer $T^8$.

**Theorem R.3.1 (Marked Torus-Character Map).** The marked embedding of Definition R.3.1 induces a homomorphism
$$
\Phi:\pi_2(\Sigma_8)\longrightarrow X^*(T_{\mathrm{SM}}),
$$
from the topological charge group to the character lattice of the marked maximal torus. The map depends on the registered representation and ordering of its torus characters; topology alone does not select it.

*Proof.* Fix a maximal torus $T_{\mathrm{SM}}\subset G_{\mathrm{SM}}$ and conjugate inside $U(8)$ so that $\iota(T_{\mathrm{SM}})$ lies in the diagonal torus $T^8\subset U(8)$. The induced action of $T_{\mathrm{SM}}$ on $\mathbb{C}^8$ is therefore diagonal, giving eight characters $\lambda_1,\dots,\lambda_8\in X^*(T_{\mathrm{SM}})$.

For any map $f:S^2\to\Sigma_8$, let $q=(q_1,\ldots,q_7)$ be its integral coordinate vector from (R.5). Equation (R.6) gives
$$
k_i=q_i\quad(1\le i\le7),
\qquad
k_8=-\sum_{i=1}^7q_i.
$$
For the marked embedding of Definition R.3.1, define
$$
\Phi([f])
:=
\sum_{i=1}^8k_i\lambda_i
=
\sum_{i=1}^7q_i(\lambda_i-\lambda_8)
\in X^*(T_{\mathrm{SM}}).
$$
The coordinates $q_i$ depend only on $[f]$, and the expression is additive under the group law on $\pi_2(\Sigma_8)$. Each $\lambda_i-\lambda_8$ is an integral weight, so $\Phi$ is a well-defined homomorphism. ∎

### R.3.3 Cartan-neutral candidate sublattice

**Definition R.3.2 (Cartan-Neutral Candidate Sublattice).** Using the unrestricted integral vector $q$ of (R.5), choose simple-coroot coordinates for the $SU(3)\times SU(2)$ character lattice. Let $v_{c_1},v_{c_2},v_t\in\mathbb Z^7$ be the three coordinate rows of the marked map $\Phi$, and put
$$
C=
\begin{pmatrix}
v_{c_1}\\
v_{c_2}\\
v_t
\end{pmatrix}.
$$
Define
$$
L_{\rm light}
:=\ker_{\mathbb Z}C
=\{q\in\mathbb Z^7:Cq=0\}.
\tag{R.9}
$$
For $q\in L_{\rm light}$ only the semisimple Cartan projection vanishes:
$$
\operatorname{pr}_{\mathrm{ss}}\Phi(q)=0
\quad\text{in}\quad
X^*(T_{SU(3)\times SU(2)}).
$$
Its induced $SU(3)$ and $SU(2)$ center characters are therefore trivial. This is a statement about the sector label, not a proof that an associated state is a full nonabelian singlet: zero weight occurs in nontrivial representations. Full $SU(3)\times SU(2)$ singletness of a retained label state requires a registered representation in which the Cartan and every root generator act trivially, equivalently membership in the trivial isotypic component. For $q\notin L_{\rm light}$ the semisimple Cartan projection is nonzero.

**Proposition R.3.3 (Center Neutrality on the Cartan-Neutral Candidate Sublattice).** For any $q \in L_{\rm light}$, its $SU(3)$ center charge is trivial: $\tau(q) = 0 \in \mathbb{Z}_3$.

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

**Theorem R.3.4 (Family-Charge Anomaly Constraints on the SM15 and SM16 Descent Branches).**

Let $q^{(g)}\in L_{\rm light}$ be distinct retained topological sector labels that have passed the separate full-label-singlet certificate of Definition R.3.2. Fix a primitive homomorphism
$$
\ell_F\in\operatorname{Hom}(L_{\rm light},\mathbb Z)
$$
and define $F_g:=\ell_F(q^{(g)})$. The symbol $F_g$ below is therefore a topological-label charge; the Standard Model predictive block in sector $g$ retains its usual nonabelian representations.

Let the family symmetry be vectorlike in four-component notation:
$$
F(Q_L^g)=F(L_L^g)=F(u_R^g)=F(d_R^g)=F(e_R^g)=F_g,
$$
and, on the SM16 branch, also $F(\nu_R^g)=F_g$. In the all-left-handed anomaly ledger, conjugates of right-handed fields carry charge $-F_g$. Use the standard hypercharge generator $y=Q-T_3$, so $y(Q_L)=1/6$. Assume the connected regular source domain of Theorem X.8d, $Z_x[J]\ne0$ on that domain, and a complete local/global anomaly certificate for treating $U(1)_F$ as a predictive-frame redundancy.

For one SM15 family, the anomaly coefficients proportional to its family charge are
$$
\begin{array}{c|ccccc}
&SU(3)^2F&SU(2)^2F&y^2F&\mathrm{grav}^2F&F^3\\
\hline
\mathrm{SM15}&0&2F_g&-2F_g&F_g&F_g^3 .
\end{array}
\tag{R.11a}
$$
The coefficient of $yF^2$ vanishes within each family. Hence the SM15 descent conditions are
$$
\sum_gF_g=0,
\qquad
\sum_gF_g^3=0.
\tag{R.11b}
$$
Adding $\nu_R^g$ contributes $-F_g$ and $-F_g^3$ to the gravitational and cubic rows and nothing to the other displayed rows. Thus on the SM16 branch the local anomaly conditions reduce to
$$
\sum_gF_g=0.
\tag{R.11c}
$$

A physical CKM-type rephasing invariant requires at least three generations. At $N=3$, the nontrivial SM15 solutions of (R.11b) are, up to permutation,
$$
(F_1,F_2,F_3)=(a,-a,0).
\tag{R.11d}
$$
On the SM16 branch, impose the registered primitive-integer normalization
$$
F_g=af_g,
\qquad
f\in\mathbb Z^3,
\qquad
\gcd(|f_1|,|f_2|,|f_3|)=1,
$$
and the strict PCE charge-norm objective $\sum_gf_g^2$. Among nonzero triples satisfying $\sum_gf_g=0$, its unique minimum, up to sign and permutation, is
$$
f=(1,-1,0).
\tag{R.11e}
$$
Consequently both the SM15 anomaly branch and the primitive minimal-norm SM16 branch have the same minimal CP-capable charge pattern (R.11d). The anomaly equations admit larger-family solutions; exact realized family count still uses the additive-monotone selection branch of Proposition R.3.5.1a.

*Proof.* In the left-handed ledger, the $SU(3)^2F$ coefficient is
$$
2T(\mathbf3)F_g-T(\mathbf3)F_g-T(\mathbf3)F_g=0.
$$
The $SU(2)^2F$ coefficient is
$$
3T(\mathbf2)F_g+T(\mathbf2)F_g=2F_g.
$$
Direct summation of $y^2F$ over $Q_L,u_R^c,d_R^c,L_L,e_R^c$ gives
$$
\left(\frac16-\frac43-\frac13+\frac12-1\right)F_g=-2F_g,
$$
while the multiplicity sums for the gravitational and cubic coefficients are
$$
(6-3-3+2-1)F_g=F_g,
\qquad
(6-3-3+2-1)F_g^3=F_g^3.
$$
The $yF^2$ coefficient is $1-2+1-1+1=0$. This proves (R.11a)--(R.11c). For three variables with zero sum,
$$
F_1^3+F_2^3+F_3^3=3F_1F_2F_3;
$$
the SM15 cubic condition therefore makes one charge zero and the other two opposite. On the SM16 branch, a nonzero integral zero-sum vector has squared norm at least $2$, with equality exactly for the signed permutations of $(1,-1,0)$. Two generations have no rephasing-invariant CKM phase, whereas three can carry one. ∎

**Lemma R.3.4a (Broken-$U(1)_F$ CKM and Seesaw Realization).** Normalize the selected charges to $(a,-a,0)$ and register one complex spurion $X$ with $F(X)=a$ and $\langle X\rangle\ne0$. Every charge difference $(F_g-F_h)/a$ and sum $(F_g+F_h)/a$ is an integer. Finite powers of $X$ or $X^\dagger$ therefore generate every quark and charged-lepton Yukawa entry, every neutrino Dirac entry, and every right-handed-neutrino Majorana entry through invariant effective operators.

In particular, for nondegenerate positive $u_i,d_i$, the allowed coefficient space contains
$$
Y_u=\operatorname{diag}(u_1,u_2,u_3),
\qquad
Y_d=F_3\operatorname{diag}(d_1,d_2,d_3),
$$
where
$$
F_3=\frac1{\sqrt3}
\begin{pmatrix}
1&1&1\\
1&\omega&\omega^2\\
1&\omega^2&\omega
\end{pmatrix},
\qquad
\omega=e^{2\pi i/3}.
$$
Then $V_{\mathrm{CKM}}=F_3$ and
$$
\operatorname{Im}
\left(V_{11}V_{22}V_{12}^*V_{21}^*\right)
=\frac{\sqrt3}{18}\ne0.
$$
Thus the registered broken branch realizes a physical CKM phase and remains compatible with a type-I seesaw. This is an existence certificate; it selects neither observed textures nor measured masses and angles.

*Proof.* A quark, charged-lepton, or neutrino Dirac entry has family charge $-F_g+F_h$; a right-handed Majorana entry has charge $F_g+F_h$. A suitable finite power of $X$ or $X^\dagger$ cancels either integer multiple of $a$. The displayed matrices are full rank. Their left diagonalizers are $I_3$ and $F_3$, and direct substitution gives the displayed nonzero Jarlskog invariant. ∎

**Proposition R.3.5 (Minimal three-generation solution within the MDL surrogate).**

(a) On the SM15 branch, the nontrivial $N=3$ solutions of (R.11b) form the single primitive charge orbit represented by $(1,-1,0)$. On the SM16 branch, (R.11c) alone does not fix the three charges; after primitive normalization, the strict charge-norm objective
$$
C_F(f):=\sum_{g=1}^N f_g^2
$$
selects the same orbit at $N=3$.

(b) A physical CKM-type rephasing invariant requires at least three generations. Lemma R.3.4a supplies an explicit nonzero invariant on the selected three-charge orbit.

(c) Suppose the realized family-count objective is
$$
L_{\mathrm{fam}}(N)=L_0+N L_{\mathrm{block}}+L_{\mathrm{mix}}(N),
$$
where $L_{\mathrm{block}}>0$ and $L_{\mathrm{mix}}$ is nondecreasing for $N\ge3$. Then $L_{\mathrm{fam}}$ is strictly increasing on the CP-capable counts and is uniquely minimized at $N=3$.

(d) Consequently, the SM15 anomaly branch and the primitive minimal-charge-norm SM16 branch have the same smallest CP-capable orbit $\{a,-a,0\}$. The additive-monotone objective of part (c) selects its family count $N_g=3$ within the declared surrogate class.

*Proof.* For the SM15 branch, (R.11b) and
$$
F_1^3+F_2^3+F_3^3=3F_1F_2F_3
\quad\text{when}\quad F_1+F_2+F_3=0
$$
force one charge to vanish and the other two to be opposite. Dividing by the gcd gives $(1,-1,0)$ up to sign and permutation. For the SM16 branch, every nonzero integral zero-sum vector has $C_F\ge2$; equality holds exactly when one entry is $1$, one is $-1$, and all others vanish. At $N=3$ this is again the orbit of $(1,-1,0)$. Two generations have no rephasing-invariant CKM phase, while Lemma R.3.4a realizes one for three. Finally,
$$
L_{\mathrm{fam}}(N+1)-L_{\mathrm{fam}}(N)
=L_{\mathrm{block}}+L_{\mathrm{mix}}(N+1)-L_{\mathrm{mix}}(N)>0,
$$
which proves the family-count selection. ∎

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

**Corollary R.3.5b (Conditional Topological Rank Identity).** Assume the minimal Appendix-Z Hilbert and dimension branches, either the SM15 or primitive-minimal-norm SM16 class of Theorem R.3.4 with a CP-active realization, and the additive-monotone selection branch of Proposition R.3.5.1a. Then
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
| $3$ | $K_0=N_g=t_{\mathrm{Golay}}$ | Theorem 15; branch-resolved SM15/SM16 family class; CP-active realization; additive family selection; predictive-recovery Golay branch |
| $4$ | $D=4$ | Theorem Z.11 dimension branch |
| $7$ | $\operatorname{rank}\pi_2(\Sigma_8)=d_0-1=N_g+D$ | R.1.1; minimal Hilbert branch; additive family selection; dimension branch |
| $8$ | $N_{\mathrm{vis}}^{\min}=2^{K_0}=d_0=8$ | Theorem 15; Theorem 23; Theorem Z.2 minimal branch |
| $12$ | $12=M/2=ab=k=n_G=\dim_{\mathbb C}\mathrm{Gr}(2,8)$ | The cited interface, code, Grassmannian, and gauge branches |
| $24$ | $24=M=K(4)$ | Theorem Z.5 and Theorem Z.11 branches |

*Proof.* Each row follows by substituting the values supplied by its listed source branches. The ledger records cross-branch numerical identities; it does not derive one source branch from another. ∎

**Remark R.3.5e.1.** Proposition R.3.5e records a compact ledger of exact equalities on the intersection of the source branches named in its final column. It is not, by itself, a single-parent derivation of all entries. The closure supplied by the following results is a current-graph non-collapse decomposition: the present proof graph decomposes the recurrent ledger into structural subchains with named source invariants, separates these from downstream equality and rigidity invariants, and proves that no current source invariant subsumes the others. Whether a future common parent invariant underlies all source roles remains open.

**Proposition R.3.5e.2 (Independent-Source Assembly of the Recurrent Integer Subledger).** On the intersection of the separately declared structural-binary, active-kernel, carrier, tangent-mode, predictive-recovery, and mode-channel branches cited by Proposition R.3.5e, the subledger
$$
(\varepsilon_0,a,d_0,b,k,M,D)
$$
has the following joint-source assembly:
$$
\mathcal C_{\mathrm{cap}}:\quad
\left.
\begin{aligned}
&\{\varepsilon_0=\ln2;\ \text{Theorem Z.1 sharp-record, capacity, quotient, and no-surplus gates}\}\to a=2,\\
&\{\text{Theorem 15 full-context branch; Theorem 23 Hilbert bound; Theorem Z.2 same-class comparator}\}\to d_0=8
\end{aligned}
\right\}
\Longrightarrow
(a,d_0)=(2,8).
\tag{R.3.5e.2.1}
$$
The downstream tangent branch is
$$
\mathcal C_{\mathrm{tan}}:\quad (a,d_0)=(2,8)\to b=6\to k=12\to M=24,
\tag{R.3.5e.2.2}
$$
and the mode--channel branch is
$$
\mathcal C_{\mathrm{kis}}:\quad M=24,\quad D_{\min}=\min\{D:K(D)\ge24\}=4.
\tag{R.3.5e.2.3}
$$
Thus $\mathcal C_{\mathrm{cap}}$ is an independent-source conjunction, not a chain from $\varepsilon_0$ through $a$ to $d_0$. The tangent branch uses Theorem Z.2.5b, and the mode--channel branch uses Theorem Z.11 and Corollary Z.11.1. The remaining $3$ and $7$ rows of Proposition R.3.5e retain the family-anomaly and topology ledgers cited there. Theorem 31 is not an antecedent of this structural subledger.

*Proof.* The first chain uses the registered structural value $\varepsilon_0=\ln2$, Theorem Z.1's sharp match/mismatch, entropy-capacity, and no-surplus gates to obtain $a=2$, and Theorem Z.2's independent (O1)–(O3), (FC), Hilbert-distinguishability, and same-class-comparator gates to obtain $d_0=8$. The equality $d_0=2a^2$ is a consistency identity on that conjunction. The second chain follows from the rank-$a$ projector on $\mathbb C^{d_0}$: $b=6$, $k=12$, and $M=24$. On the predictive-recovery MacWilliams branch, the interface-code dimension is $M/2=12$. The third chain uses Definition Z.9a: Theorem Z.10 gives $24\le K(D)$, $K(3)=12$ excludes lower dimensions, the regular $24$-cell proves feasibility in $D=4$, and strict surplus-dimension cost selects the least feasible $D=4$. The $3$ and $7$ rows retain the independent sources cited in Proposition R.3.5e. ∎

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

*Proof.* Proposition R.3.5e and Proposition R.3.5e.2 give the registered ledger values. The invariant $I_3$ follows from Theorem 15, Theorem R.3.4, Proposition R.3.5.1a, and Corollary R.3.5a. The invariant $I_{\mathrm{cap}}$ uses the structural binary reference, Theorem Z.1's active-record/capacity/no-surplus gates, and Theorem Z.2's Hilbert-distinguishability and same-class-comparator gates, yielding $(a,d_0)=(2,8)$. The invariant $I_{\mathrm{tan}}$ follows from the rank-$a$ projector tangent calculation
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
On the predictive-recovery MacWilliams branch, Definition Z.13b.0 and Theorem Z.13b.0a select the interface-code dimension $k=M/2=12$, and Theorem Z.13 realizes the corresponding $[24,12,8]$ Golay code. Thus the shared value $k=12$ is consistent with the tangent half-mode count, but the coding-theoretic selection uses the named MacWilliams gate. The invariant $I_{\mathrm{kis}}$ follows from Definition Z.9a and Theorems Z.10--Z.11: $M=24\le K(D)$, $K(3)=12$, and the explicit regular-$24$-cell realization make four the least feasible dimension under the registered support cost. The downstream invariants retain their separately cited sources.

It remains to check that no source role replaces all the others inside $G$. The role $\mathcal C_{\mathrm{cap}}$ supplies $I_{\mathrm{cap}}$ and feeds $\mathcal C_{\mathrm{tan}}$ through $(a,d_0)$, but it contains no family-anomaly proof of $N_g=3$, no Golay correction-radius argument, and no kissing-number bridge. Thus it does not determine $I_3$ or $I_{\mathrm{kis}}$.

The role $\mathcal C_{\mathrm{tan}}$ computes $b$, $k_{\mathrm{tan}}$, and $M$ from a rank-$a$ projector after $(a,d_0)$ is fixed. It supplies neither the structural-source certificate for $(\varepsilon_0,a,d_0)$ nor the predictive-recovery MacWilliams gate for the code interpretation of $k$. The ambient dimension additionally requires Definition Z.9a's mode-to-cell injection, Theorem Z.10's bound, an explicit feasible shell, and the least-feasible support cost. Hence $\mathcal C_{\mathrm{tan}}$ cannot replace $\mathcal C_{\mathrm{cap}}$ or $\mathcal C_{\mathrm{kis}}$.

The role $\mathcal C_{\mathrm{kis}}$ selects $D=4$ only after $M=24$ has already been supplied by the Peirce-Grassmann tangent count. It cannot compute $a$, $d_0$, $b$, $k_{\mathrm{tan}}$, or $M$ by itself, and it carries no family-anomaly data.

The role $\mathcal C_3$ supplies $K_0=N_g=t_{\mathrm{Golay}}=3$ through the horizon, branch-resolved SM15/SM16 family selection, pre-flavor family objective, and Golay-radius results. It provides the value $K_0=3$ used by the SPAP lower-bound leg for $d_0$, but it does not by itself supply the Landauer/PPI capacity gate, the Peirce tangent dimension, the predictive-recovery MacWilliams rate-selection gate, or the kissing-number bridge. Hence it is not a current-source compression.

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

**Proposition R.3.5f (Theorem–Model Boundary for the Generation Sector).** The structural family-count statement has two spectrum-resolved routes. On the SM15 branch, the linear and cubic anomaly equations, nontriviality, and a registered CP-active realization make $N=3$ the smallest admissible count and select the primitive orbit $(1,-1,0)$. On the SM16 branch, the linear anomaly equation, primitive charge-norm objective, and the same CP gate select that orbit at $N=3$. On either route, the additive-monotone family objective of Proposition R.3.5.1a selects the realized pre-flavor count
$$
N_g=3.
$$
This statement has role class ExactThreshold / DiscreteMultiplicity in the sense of Convention P.14.1a. The following remain later conditional or model layers:

1. identification of generations with particular $E_8$ roots, triads, or wavepackets;
2. Yukawa-compression and absolute-mass constructions;
3. Berry-holonomy CKM/PMNS phase assignments beyond the existence certificate of Lemma R.3.4a;
4. quantitative seesaw, Majorana, or oscillation matching; and
5. baryogenesis numerics.

Consequently, failure of a particular texture, root placement, phase ansatz, neutrino normalization, or baryogenesis realization does not refute $N_g=3$ unless it also invalidates the spectrum, anomaly, primitive-normalization, CP-existence, or family-objective premises just listed. Quantitative flavor outputs are reported with the paper-wide T1/T2/T3 protocol: T1 for finite-order and geometric truncations, T2 for vacuum/regularization/threshold and branch dependence, and T3 for scheme, empirical mapping, and discrete identification ambiguity.

*Proof.* The SM15 and SM16 anomaly ledgers are computed separately in Theorem R.3.4. The primitive norm argument selects $(1,-1,0)$ only on the SM16 branch; it is not an anomaly equation. Lemma R.3.4a proves existence of a CP-active Yukawa record on the selected orbit without fixing observed textures. Proposition R.3.5.1a then selects the smallest CP-capable family count under its declared additive-monotone objective. None of the quantitative flavor, mass, phase-response, or baryogenesis models enters those arithmetic and selection steps. The T1/T2/T3 assignment is the direct specialization of Convention P.14.1c to the flavor variables: omitted hierarchy orders and geodesic approximations are T1, vacuum/threshold/regularization choices are T2, and scheme, empirical extraction, and generation-label identification are T3. ∎

**Corollary R.3.5g (Matter Generations as Minimal Anomaly-Code Completion).** Let $b\in\{15,16\}$ denote the SM15 or SM16 descent branch of Theorem R.3.4. Define
$$
[\mathcal A_N^{(15)}]=0
\iff
\sum_{g=1}^N F_g=0
\ \text{and}\ 
\sum_{g=1}^N F_g^3=0,
$$
and
$$
[\mathcal A_N^{(16)}]=0
\iff
\sum_{g=1}^N F_g=0.
$$
On the SM16 branch, primitive normalization and minimization of $C_F=\sum_g f_g^2$ are additional PCE selection data, not anomaly equations. On either the SM15 branch or the primitive minimal-charge-norm SM16 branch,
$$
N_g
=
\min\left\{N:\ [\mathcal A_N^{(b)}]=0,\ \mathcal Q\ne0,\ \text{and a registered }J_{\mathrm{CP}}\ne0\text{ realization exists}\right\}
=
3,
$$
and the selected primitive charge orbit is represented by
$$
(1,-1,0),
$$
equivalently $\{F_g\}=\{a,-a,0\}$ before dividing out the common charge unit.

*Proof.* A nonzero one-family assignment violates the linear condition. A two-family zero-sum assignment is proportional to $(1,-1)$ but cannot carry a rephasing-invariant CKM phase. For three families, the SM15 cubic equation forces one charge to vanish and the other two to be opposite. On the SM16 branch, the linear equation alone allows more triples, but the primitive norm satisfies $C_F\ge2$, with equality exactly for signed permutations of $(1,-1,0)$. Lemma R.3.4a realizes a nonzero Jarlskog invariant on that orbit. Therefore the smallest CP-capable count is three on both declared branches, with the stated difference between anomaly and PCE inputs. ∎

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

This section compares the branch-resolved family-count derivation with structural three-fold compatibility checks. On SM15, the linear and cubic anomaly equations plus a registered CP-active realization select the smallest admissible orbit at $N=3$. On SM16, the linear anomaly equation must be supplemented by primitive normalization and the strict charge-norm objective. Proposition R.3.5.1a supplies the separate additive-monotone realized-count selection. Section R.4.2 records the $D_4$ triality orbit and the Leech/$E_8$ three-fold scaffold at $M=24$ as compatibility layers; neither replaces those branch-specific inputs.

### R.4.1 Topological Pathway: Anomaly Cancellation

**Summary of Topological Derivation:**

1. **Integral topology:** $\pi_2(\Sigma_8)\cong\mathbb Z^7$ has the unrestricted integral coordinates of (R.5)–(R.6).

2. **Marked gauge map:** A registered unitary representation and maximal-torus marking define
   $$
   \Phi:\pi_2(\Sigma_8)\to X^*(T_{\mathrm{SM}})
   $$
   as in Theorem R.3.1.

3. **Cartan-neutral candidate labels:** The kernel $L_{\mathrm{light}}=\ker_{\mathbb Z}C$ kills only the $SU(3)\times SU(2)$ Cartan projection. A retained label must separately pass the full-label-singlet certificate of Definition R.3.2.

4. **Topological family charge:** A primitive homomorphism $\ell_F\in\operatorname{Hom}(L_{\mathrm{light}},\mathbb Z)$ assigns
   $$
   F_g=\ell_F(q^{(g)}).
   $$

5. **Branch-resolved anomaly equations:** The SM15 branch requires
   $$
   \sum_gF_g=0,
   \qquad
   \sum_gF_g^3=0,
   $$
   whereas the SM16 branch with one uniformly charged $\nu_R^g$ per family requires only $\sum_gF_g=0$.

6. **CP realization:** A CKM-type rephasing invariant needs $N\ge3$; Lemma R.3.4a gives an explicit nonzero realization for the selected orbit.

7. **Minimal orbit and count:** The SM15 equations select $(1,-1,0)$ at $N=3$. On the SM16 branch, primitive charge-norm minimization selects the same orbit. Proposition R.3.5.1a then selects $N_g=3$ on its separate additive-monotone family-count objective.

Thus topology supplies the sector lattice and the map producing family charges; the anomaly, CP-realization, primitive-normalization, charge-norm, and family-count objectives retain their distinct proof roles. The $D_4$, Golay, $E_8$, and Leech records in Section R.4.2 remain compatibility checks.

### R.4.2 Structural Compatibility

**Remark R.4.1: Modular and Lattice Facts at Rank 24.**
The identity
$$
\eta(\tau)^{24}=\Delta(\tau)
$$
places the modular discriminant in weight $12$. Independently, positive-definite even unimodular lattices exist only in dimensions divisible by $8$, and rank $24$ contains the Niemeier classification, including the $E_8^{\oplus3}$ root lattice and the rootless Leech lattice. The interface identity $M=24$ is established by Theorem Z.5. These are exact compatibility facts at the same integer; none is an implication from the others. The explicit coordinate construction gives one code-to-Leech realization, while the separate $E_8^{\oplus3}$ realization still requires the registered gluing datum and norm certificate of Lemma R.4.5.

**Proposition R.4.2 (Three-Fold Compatibility of Topology, Triality, Geometry, and Mode Count).**

The number $3$ occurs in four distinct branch records:

1. **Family count:** On SM15, the linear and cubic anomaly equations select the primitive $N=3$ orbit; on SM16, the linear equation plus primitive charge-norm minimization selects the same orbit. The CP-active realization excludes smaller nontrivial mixing branches, and Proposition R.3.5.1a selects the realized count on the additive-monotone objective branch.
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

On the SM15 branch only, the same triality orbit reproduces the algebraic charge pattern of Theorem R.3.4 when both SM15 anomaly equations are imposed on a three-element orbit. Let $F_V,F_+,F_-$ be rational charge values assigned to $V,S^+,S^-$ and suppose
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
On the nontrivial SM15 family-charge branch $a\ne0$; the all-zero solution is the trivial charge assignment. This matches the SM15 pattern in Theorem R.3.4. On the SM16 branch the cubic equation is absent, so triality plus the linear anomaly equation does not force this orbit; the primitive charge-norm objective supplies that separate selection.

Item 3 is the lattice-theoretic statement proved in this section: $\Lambda_{24}$ contains a sublattice isometric to $\sqrt{2}E_8^3$, so the 24-dimensional geometric construction carries a natural three-fold block structure. Item 4 is the factorization $M=24=3\times8$, which is compatible with grouping the interface into three 8-dimensional blocks.

It remains to record the boundary of the claim. The MPU Hilbert space is $H_0\cong\mathbb C^8$, whereas the triality statement is a theorem about a marked real Euclidean 8-carrier with $\mathfrak{so}(8)$ structure. The QFI interface count is
$$
M=2a(d_0-a)=24,
$$
the real dimension of $T_{\rho_0}\mathrm{Gr}(2,8)$, not an 8-dimensional Hilbert-space carrier. Therefore item 2 is not a canonical identification of $H_0$ or the QFI tangent space with one fixed $\mathrm{Spin}(8)$ representation. Moreover, $S_3$ is finite and has trivial identity component, so triality does not generate the connected family symmetry $U(1)_F$ used in Theorem R.3.4. If a future branch declares the finite triality label itself to be a predictive redundancy in a 4-dimensional effective-action sector, Definition X.8d.2 requires the corresponding $(d+1)$-dimensional bordism character, hence a 5-dimensional anomaly audit for a 4-dimensional branch, not an $\Omega_4$ audit. Since the present proposition uses triality only as a compatibility layer, no new redundancy or bordism gate is added here.

Thus the topological, triality, geometric, and information-theoretic structures are compatible with one another, while the family-count proof remains the branch-resolved SM15 or SM16 selection of Theorem R.3.4 together with the additive-monotone pre-flavor realization theorem. ∎

### R.4.2.1 The Conditional Golay Bridge

The shared integer $24$ alone does not identify a code with a lattice. The section closes one code-to-Leech map by an explicit coordinate construction and keeps the separate $(\sqrt2E_8)^3$ realization conditional on its finite-quadratic-module marking and norm certificate.



The predictive-recovery theorem selects $\mathcal G_{24}$ but does not identify code coordinates with interface modes or a physical vacuum. The explicit coordinate construction below does, however, functorially construct a mathematical Leech lattice from a marked Golay copy. The separate scaled-triple realization $L_0=(\sqrt2E_8)^3\subset\Lambda_{24}$ still requires the finite-quadratic-module marking, maximal isotropic subgroup, glue representatives, and one of the norm certificates stated in Lemma R.4.5 and Corollary R.4.2b.

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
3. a certified nonzero-vector minimum ledger
$$
m_0^{\times}:=\min\{|x|^2:x\in L_0\setminus\{0\}\}=4,
$$
and, for every nonzero $h\in A_{L_0}$,
$$
m(h):=\min\{|x|^2:x\in L_0^*,\ [x]=h\},
$$
proving
$$
m_H^{\times}
:=
\min\left(\{m_0^{\times}\}\cup\{m(h):0\ne h\in H\}\right)
=4.
$$

Then
$$
L_H:=\bigcup_{h\in H}(g_h+L_0)
$$
is even, unimodular, and rootless of rank $24$, and hence is isometric to the Leech lattice $\Lambda_{24}$.

*Proof.* The even-lattice gluing theorem [Conway & Sloane 1999] sends the maximal totally isotropic subgroup $H$ to an even overlattice. Since $|H|=2^{12}$ and $\det L_0=2^{24}$, the overlattice is unimodular. Every nonzero vector of $L_H$ lies either in $L_0\setminus\{0\}$ or in a nonzero glue coset, so the identity $m_H^{\times}=4$ gives minimum nonzero squared norm $4$ and hence rootlessness. Niemeier classification [Niemeier 1973] then identifies it with $\Lambda_{24}$. An abstract isomorphism $A_{L_0}\cong\mathbb F_2^{24}$ without $\phi$, $q_B$, and the coset-minimum ledger is insufficient for this conclusion. ∎

**Explicit coordinate closure of the marked Golay branch.** Let $C=\mathcal G_{24}\subset\mathbb F_2^{24}$ be the doubly even self-dual extended binary $[24,12,8]$ Golay code and define
$$
K_C
:=
\left\{
x\in\mathbb Z^{24}:
x\bmod2\in C,\ 
\sum_{i=1}^{24}x_i\equiv0\pmod4
\right\},
\qquad
L_B(C):=\frac1{\sqrt2}K_C.
$$
Let
$$
v=(-3,1,\ldots,1),
\qquad
\nu=\frac v{\sqrt8},
\qquad
\Lambda_C:=L_B(C)\cup\bigl(\nu+L_B(C)\bigr).
$$
Then $\Lambda_C$ is an even unimodular positive-definite rank-$24$ lattice of minimum squared norm $4$, and therefore $\Lambda_C\cong\Lambda_{24}$.

*Coordinate proof.* Since $\dim C=12$, the parity condition $x\bmod2\in C$ has index $2^{12}$ in $\mathbb Z^{24}$. On that preimage, $x\mapsto\frac12\sum_i x_i\bmod2$ is a surjective homomorphism because $C$ is even and $2e_1$ maps to $1$. Hence
$$
[\mathbb Z^{24}:K_C]=2^{13},
\qquad
\operatorname{covol}L_B(C)=2^{13}2^{-12}=2.
$$
The code $C$ is doubly even, so for $x\in K_C$,
$$
x\cdot x\equiv\operatorname{wt}(x\bmod2)\equiv0\pmod4.
$$
Thus every vector $x/\sqrt2\in L_B(C)$ has even squared norm. If $x\bmod2=0$, then $x=2z$ with $\sum_i z_i$ even, and every nonzero such vector has $x\cdot x\ge8$. If $x\bmod2\ne0$, then the minimum distance $d(C)=8$ gives $x\cdot x\ge8$. The vector $2(e_1-e_2)/\sqrt2\in L_B(C)$ has squared norm $4$, so equality is attained. Therefore
$$
\min\{|y|^2:0\ne y\in L_B(C)\}=4.
$$

Because $C$ is even and self-dual, the all-one word belongs to $C$: it is orthogonal to every even-weight codeword and hence lies in $C^\perp=C$. Therefore $v\bmod2=\mathbf1\in C$ and $\sum_i v_i=20\equiv0\pmod4$, so $2\nu=v/\sqrt2\in L_B(C)$. For $x/\sqrt2\in L_B(C)$,
$$
\left\langle\nu,\frac{x}{\sqrt2}\right\rangle
=\frac{v\cdot x}{4}
=\frac{\sum_i x_i-4x_1}{4}
\in\mathbb Z.
$$
Hence $\nu\in L_B(C)^*$, while $\nu\notin L_B(C)$, and $\nu+L_B(C)$ is an order-two glue coset. For every $\ell\in L_B(C)$,
$$
|\nu+\ell|^2
=|\nu|^2+|\ell|^2+2\langle\nu,\ell\rangle
\in2\mathbb Z,
$$
so adjoining the coset preserves evenness. The index-two extension has covolume $2/2=1$, so $\Lambda_C$ is unimodular.

Finally, every vector in $\nu+L_B(C)$ has the form $(v+2x)/\sqrt8$ with all $24$ numerator coordinates odd. Its squared norm is at least $24/8=3$; because $\Lambda_C$ is even, that norm is an even integer and is therefore at least $4$. The vector $\nu$ attains $4$. Thus $\Lambda_C$ has minimum squared norm $4$, so it is rootless. The Niemeier classification identifies the resulting lattice with the Leech lattice. Coordinate permutations carry equivalent copies of $C$ to isometric lattices. ∎

#### R.4.2.1.4 Leech Lattice from PCE Constraints

**Theorem R.4.6 (Leech Lattice under the 24D admissibility criteria).**

Assume the admissible 24-dimensional vacuum lattice is required to be:

1. positive-definite,
2. even,
3. unimodular, and
4. rootless, i.e. to have no vectors of squared norm $2$,

with rootlessness independently included in the admissibility ledger. QFI isotropy fixes an inner product but does not exclude norm-$2$ vectors. Under these stated criteria, the unique compatible lattice is the Leech lattice $\Lambda_{24}$.



*Proof.*

**Step 1 (Classification input).** By the Niemeier classification (Niemeier 1973), every positive-definite even unimodular lattice of rank $24$ is isometric to one of exactly $24$ Niemeier lattices.

**Step 2 (Root-system characterization).** Each Niemeier lattice is characterized by its root system, namely the set of vectors of squared norm $2$. Twenty-three of the Niemeier lattices have nonempty root system. Exactly one has empty root system.

**Step 3 (Rootless branch).** The unique Niemeier lattice with empty root system is the Leech lattice $\Lambda_{24}$ (Leech 1967; Conway 1969).

**Step 4 (Application of the admissibility criteria).** Under the stated criteria, the admissible lattice must lie in the positive-definite rank-$24$ even unimodular class and must be rootless. By Steps 1–3, there is exactly one such lattice, namely $\Lambda_{24}$.

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

Three statements are distinct:

1. the extended binary Golay code is, up to permutation equivalence, the unique binary linear $[24,12,8]$ code and attains the maximal distance in the binary linear $[24,12]$ class;
2. the explicit Construction-B coordinates following Lemma R.4.5 turn any marked copy $C=\mathcal G_{24}\subset\mathbb F_2^{24}$ directly into an even unimodular rootless rank-$24$ lattice $\Lambda_C\cong\Lambda_{24}$;
3. the separate $\sqrt2E_8^{\oplus3}$ scaffold yields the same isometry class only after a finite-quadratic-module marking satisfying items 1–2 of Lemma R.4.5 and either the complete minimum ledger in item 3 or the base-coset identity, Equation (R.4.2a.1), and $d(\mathcal G_{24})=8$.

Thus the code-to-Leech bridge is closed constructively by the displayed coordinate construction. The abstract $E_8^{\oplus3}$ scaffold remains a distinct realization and still requires its stated marking and norm certificate; the code parameters alone do not determine $\phi$, $q_B$, or its glue representatives.

*Proof.* For a binary linear $[24,12,d]$ code, the Griesmer bound (Griesmer 1960) requires
$$
24\ge\sum_{i=0}^{11}\left\lceil\frac d{2^i}\right\rceil.
$$
If $d\ge9$, the right-hand side is at least
$$
9+5+3+2+\underbrace{1+\cdots+1}_{8\text{ terms}}=27,
$$
a contradiction. Hence $d\le8$. The extended binary Golay code has parameters $[24,12,8]$, so it attains the maximum. The classification theorem for binary linear $[24,12,8]$ codes (Pless 1968; MacWilliams and Sloane 1977) states that every such code is permutation-equivalent to the extended binary Golay code; its hypotheses are exactly binary linearity and the three displayed parameters. This proves statement 1.

Statement 2 is the explicit coordinate calculation following Lemma R.4.5: index and covolume give unimodularity, double evenness gives evenness, and the zero- and odd-coset estimates give minimum squared norm $4$. For statement 3, items 1–2 of Lemma R.4.5 and the even-lattice gluing theorem make $L_H$ even and unimodular of rank $24$. Item 3 gives minimum squared norm $4$ directly; alternatively, $d(\mathcal G_{24})=8$ and (R.4.2a.1) control every nonzero glue coset while $m_0^{\times}=4$ controls the zero coset. Either abstract-scaffold route makes $L_H$ rootless, and Theorem R.4.10 gives $L_H\cong\Lambda_{24}$.

Statement 1 supplies the classified code up to coordinate permutation. Statement 2 then closes a concrete coordinate lattice functorially under those permutations. Statement 3 is a different carrier realization whose extra marking data are not supplied by statement 1. ∎

#### R.4.2.1.8 Dual Optimality Summary

**Remark R.4.2: Conditional Code--Lattice Cross-Ledger.**

| Domain | Closed statement | Additional bridge datum |
|--------|------------------|--------------------------|
| Binary coding | The extended Golay code is the unique $[24,12,8]$ binary linear code up to equivalence | None for the coding theorem |
| Rank-$24$ lattices | The Leech lattice is the unique positive-definite even unimodular rootless rank-$24$ lattice up to isometry | None after positive definiteness, evenness, unimodularity, rank, and rootlessness are assumed |
| Code-to-lattice transfer | The explicit coordinate construction following Lemma R.4.5 sends $\mathcal G_{24}$ to $\Lambda_C\cong\Lambda_{24}$; the separate $(\sqrt2E_8)^3$ scaffold reaches the same isometry class only on its abstract gluing branch | No extra bridge datum for the displayed coordinate construction; for the abstract scaffold, items 1–2 of Lemma R.4.5 plus either its complete minimum ledger or $m_0^{\times}=4$ together with Equation (R.4.2a.1) |

Common length/rank $24$ and separate extremality do not make the coding and lattice objectives identical. Their intersection is a certified correspondence only on the registered bridge datum; it is not forced by PCE coordinate neutrality or by the integer $24$ alone.



| Domain | Optimization Problem | Result | Role of $\mathcal{G}_{24}$ | Reference |
|--------|---------------------|--------|---------------------------|-----------|
| Information theory | Maximize $d$ for $[24, 12, d]$ codes | $d_{\max} = 8$ | Unique optimal code | Theorem R.4.4 |
| Lattice geometry | Find rootless even unimodular $\Lambda \subset \mathbb{R}^{24}$ | $\Lambda_{24}$ | Gluing code for $\sqrt{2}E_8^3 \to \Lambda_{24}$ | Lemma R.4.5 |

**Why the two ledgers can be compared but do not coincide automatically:**

1. **Separate occurrences of $24$:** The code has block length $24$, the lattice has rank $24$, and the interface branch has mode count $M=24$. Equality of these integers does not identify the underlying objects.

2. **Different symmetry statements:** PCE coordinate-label neutrality requires the code selection rule to be equivariant under coordinate relabeling; it does not make the selected code invariant under all of $S_{24}$. The permutation automorphism group of the extended Golay code is $M_{24}$. Rootlessness of a lattice is a metric minimum-norm condition, not the analogous assertion of full permutation invariance.

3. **Different metrics:** Hamming weight and Euclidean squared norm are distinct functions. In the explicit coordinate construction their relation is proved by the displayed parity and minimum calculation; on an arbitrary finite-quadratic-module marking it requires the separate metric-compatibility theorem (R.4.2a.1).

4. **Certified intersection:** The explicit coordinate construction produces an even unimodular rootless lattice directly. On the separate $(\sqrt2E_8)^3$ scaffold, items 1–2 of Lemma R.4.5 construct the even unimodular overlattice and rootlessness follows from either its complete minimum ledger or the noncircular distance-transfer route of Corollary R.4.2b.

Thus the Golay bridge is the registered construction and its norm certificate, not a consequence of shared dimension, full $S_{24}$ invariance, or two unrelated extremality statements.

---

#### R.4.2.1.9 Connection to Spacetime Emergence

The integer $M=24$ enters the predictive-recovery, registered-gluing, and mode-channel branches as a shared input; it does not define a causal chain from the Golay code through the Leech lattice to spacetime. The licensed branchwise implications are the following.

The predictive-recovery branch selects the code. The explicit coordinate construction following Lemma R.4.5 then constructs $\Lambda_C\cong\Lambda_{24}$; the abstract $(\sqrt2E_8)^3$ scaffold reaches the same class only with its registered marking and norm certificate. Independently, the faithful tangent-shell branch uses $M=24\le K(D)$, the $K(3)=12$ obstruction, the regular $24$-cell, and least-feasible support cost to select $D=4$. Neither lattice construction is a premise of that dimensional proof.

Consequently the licensed diagram is
$$
M=24\longrightarrow
\begin{cases}
\mathcal G_{24},&\text{predictive-recovery code branch},\\
\Lambda_{24},&\text{explicit Golay coordinate construction or certified abstract-gluing branch},\\
D=4,&\text{independent faithful-shell least-feasible branch}.
\end{cases}
$$
On an arbitrary finite-quadratic-module marking, code distance transfers to nonzero glue-coset minima only when Equation (R.4.2a.1) is proved. The explicit coordinate construction instead proves its Euclidean minimum directly. Neither route supplies a code-to-spacetime, code-to-dynamics, or physical-vacuum-stability implication.

The selected code determines a mathematical Leech lattice of minimum squared norm $4$ through the explicit coordinate construction. On the separate $(\sqrt2E_8)^3$ scaffold, the same minimum follows only from the registered abstract gluing and one of its two norm-certification routes. Neither mathematical construction identifies a physical vacuum or proves dynamical stability without a separate realization certificate.

### R.4.2.3 Code Distance and the Registered Gluing Datum

**Proposition R.4.2a (Code Distance Does Not Replace the Gluing Certificate).** Binary Hamming distance is not invariant under an arbitrary vector-space identification
$$
A_{L_0}\cong\mathbb F_2^{24}
$$
and therefore does not by itself determine minimum norms of glue cosets. For the marked datum of items 1–2 in Lemma R.4.5, rootlessness has two independent metric obligations:
$$
m_0^{\times}=4,
\qquad
\min_{0\ne h\in\phi^{-1}(C)}m(h)\ge4.
$$
If a particular marked construction additionally proves
$$
\min_{0\ne h\in\phi^{-1}(C)}m(h)\ge4
\quad\Longleftrightarrow\quad
d(C):=\min_{0\ne c\in C}\operatorname{wt}(c)\ge8,
\tag{R.4.2a.1}
$$
then code distance $8$ discharges the nonzero-glue-coset obligation. The independent base-lattice identity $m_0^{\times}=4$, the finite-quadratic-module marking, and maximal isotropy remain required.

*Proof.* The left side of (R.4.2a.1) depends on the discriminant quadratic form, its marking, and Euclidean minima in the nonzero marked cosets; the right side depends on the chosen binary Hamming metric. Thus (R.4.2a.1) is exactly the required metric-compatibility theorem. When it holds and $d(C)\ge8$, every nonzero glue coset has minimum squared norm at least $4$; combining this with $m_0^{\times}=4$ proves that every nonzero vector of the glued lattice has squared norm at least $4$. ∎

**Corollary R.4.2b (Conditional Code-to-Rootlessness Transfer).** Assume items 1–2 of Lemma R.4.5, the base-lattice identity $m_0^{\times}=4$, and Equation (R.4.2a.1), but do not assume the nonzero-coset bound in item 3. If $C=\mathcal G_{24}$, then $d(C)=8$ supplies that missing bound, and the resulting overlattice is rootless and hence isometric to the Leech lattice.

*Proof.* Since $d(\mathcal G_{24})=8$, Equation (R.4.2a.1) gives
$$
\min_{0\ne h\in\phi^{-1}(\mathcal G_{24})}m(h)\ge4.
$$
Together with $m_0^{\times}=4$, this excludes norm-$2$ vectors in both the zero and nonzero glue cosets. Items 1–2 of Lemma R.4.5 make the overlattice positive-definite, even, unimodular, and rank $24$; Niemeier classification therefore identifies it with $\Lambda_{24}$. A packing-energy statement or physical stability claim requires its own stated theorem or dynamical certificate. ∎

**Corollary R.4.2b.1 (Conditional Universal-Optimality Support for Fixed-Dimension Lattice Subledgers).** Let a PU lattice subledger already be fixed to a Euclidean dimension $n\in\{8,24\}$ and to an admissible periodic-configuration class $\mathcal A_n$ with the density, covolume, and regularization conventions required by the corresponding universal-optimality theorem. Suppose the descended PCE pair cost on that subledger has the form
$$
V_f(X)=\sum_{x,y\in X}^{'} f(|x-y|^2)
\tag{R.4.2b.1}
$$
where $f$ is completely monotone on squared distance after the branch regularization, and suppose the accepted finite-response ledger proves that no non-pairwise, anomaly, quotient, calibration, or capacity term remains outside this cost. Then the $n=8$ subledger is minimized by the $E_8$ lattice and the $n=24$ subledger is minimized by the Leech lattice $\Lambda_{24}$ among the admissible configurations.

This support is fixed-dimension support only. It does not derive $d_0=8$, $M=24$, $D=4$, $K_0=3$, or the three-generation count, and it does not promote the $D_4$/24-cell leg to universal optimality. The $D_4$ and 24-cell statements remain the kissing-number, triality, and design-optimality statements already used elsewhere in the manuscript.

*Proof.* Under the stated hypotheses, the PCE cost is exactly an admissible completely monotone pair energy in a dimension where universal optimality is a theorem. Therefore $E_8$ in dimension $8$ and $\Lambda_{24}$ in dimension $24$ minimize the entire accepted pair-energy family, independently of the particular $f$. The conclusion is conditional on the dimension and admissible cost form already being fixed; the universal-optimality theorem is not a selector of those dimensions and supplies no theorem-level parent invariant for source roles outside the fixed-dimensional lattice subledgers. ∎

---

**Proposition R.4.2c (Branchwise $M=24$ Compatibility Ledger for Code, Lattice, Gauge, and Generation Records).** On the conjunction of the separately registered branches:

1. the predictive-recovery branch selects the extended binary Golay code $[24,12,8]$;
2. the retained arithmetic identities give $M/2=ab=k=n_G=\dim_{\mathbb C}\mathrm{Gr}(2,8)=12$ on their cited branches;
3. the explicit coordinate construction following Lemma R.4.5 sends the selected Golay copy to an even unimodular rootless rank-$24$ lattice $\Lambda_C\cong\Lambda_{24}$;
4. independently, the $(\sqrt2E_8)^3$ scaffold yields the same isometry class only after items 1–2 of Lemma R.4.5 and either its complete minimum ledger or $m_0^{\times}=4$ together with Equation (R.4.2a.1); and
5. the scaled three-block scaffold is compatible with, but does not derive, the three-generation theorem.

These statements share branch-selected integers and a compatible lattice isometry class; no one of the gauge, generation, code, or mode-count records is thereby derived from another. The coordinate construction closes the mathematical code-to-Leech map, but neither route establishes a physical vacuum, decoder for physical noise, dynamical stability, or an energy gap. ∎



### R.4.2.4 Niemeier Classification and Conditional Selection

**Theorem R.4.10 (Unique Rootless Positive-Definite Niemeier Lattice; Conditional PCE Selection).** Among positive-definite even unimodular lattices of rank $24$, exactly one has no norm-$2$ vectors: the Leech lattice $\Lambda_{24}$. Therefore any already-registered PCE branch whose admissibility conditions independently require a positive-definite even unimodular rootless rank-$24$ lattice selects $\Lambda_{24}$ uniquely. PCE alone does not supply positive definiteness, rootlessness, or physical-vacuum stability.

*Proof.* The Niemeier classification theorem (Niemeier 1973; Conway and Sloane 1999) applies to positive-definite even unimodular lattices of rank $24$. It gives exactly 24 isometry classes. Twenty-three classes have a nonempty root system consisting of their norm-$2$ vectors, and the remaining class has no norm-$2$ vectors. The classification identifies that remaining class as the Leech lattice $\Lambda_{24}$. Restricting any independently certified admissible class to the stated positive-definite, even, unimodular, rank-$24$, rootless conditions therefore leaves exactly the isometry class of $\Lambda_{24}$. ∎

**Remark R.4.2a: Nested Uniqueness.** Three finite statements meet at the number $24$: the faithful-shell branch selects the least feasible $D=4$ from $24\le K(D)$, $K(3)=12$, and the regular $24$-cell; Niemeier classification contains exactly $24$ positive-definite even unimodular rank-$24$ isometry classes; and exactly one of them is rootless. Their conjunction identifies one rootless rank-$24$ isometry class together with compatible finite branch data; physical vacuum realization retains its registered certificate.


1. On the registered faithful-shell branch, $M=24\le K(D)$ and least-feasible selection give $D=4$ using $K(3)=12$ and the regular $24$-cell.
2. At the independently fixed positive-definite rank $24$, the Niemeier theorem classifies exactly $24$ even unimodular lattice isometry classes.
3. Within that fixed-rank class, rootlessness selects the unique Leech isometry class.

The class count does not select rank $24$, and a lattice isometry class is not a physical vacuum. Physical vacuum uniqueness or stability requires a separate dynamical realization certificate.

---

### R.4.2.5 Automorphism Group and Symmetry Structure

**Proposition R.4.4 (Automorphism Group).** The stabilizer in $\operatorname{Aut}(\Lambda_{24})$ of a coordinate frame has the form $2^{12}:M_{24}$, where $M_{24}=\operatorname{Aut}(\mathcal{G}_{24})$. This follows from Proposition R.4.8 (Step 4). ∎

**Remark R.4.2b: Physical Status of Sporadic Symmetries.** Once the marked Golay and Leech structures are selected, their automorphism groups are determined: $\operatorname{Aut}(\mathcal G_{24})=M_{24}$ and $\operatorname{Aut}(\Lambda_{24})=\mathrm{Co}_0=2.\mathrm{Co}_1$, whose central quotient is $\mathrm{Co}_1$. A physical action of those groups is not thereby established. These groups act on the 24-dimensional mode space, not directly on the 4-dimensional emergent spacetime. Physical observables in emergent spacetime reflect only those symmetries compatible with the dimensional reduction $24 \to 4$ via the mode-channel correspondence.

Whether sporadic group structure produces observable signatures—such as specific degeneracy patterns in quantum systems engineered to probe the full 24-mode space, or constraints on allowed transitions—remains an open question. The experimental predictions in **Section Z.29–Z.31** provide protocols for testing the $M = 24$ mode structure and Golay code organization; confirmation of these predictions would indirectly validate the mathematical structures whose automorphism groups are sporadic. Direct physical manifestations of sporadic symmetries represent an avenue for future theoretical and experimental investigation.

---

### R.4.2.6 Over-Determination and Structural Consistency

**Independence verification:** 
- Mechanism 1 (Family selection): relies on the $\pi_2(\Sigma_8)$ sector lattice, the marked family-charge map, the SM15 anomaly equations or the SM16 linear-anomaly-plus-charge-norm route, a registered CP-active realization, and the additive-monotone realized-count objective (Sections R.3–R.4.1).
- Mechanism 2 (Triality compatibility): relies on the marked real 8-carrier $\mathfrak{so}(8)$ structure and the $D_4$ diagram automorphism group $S_3$ (Proposition R.4.2).
- Mechanism 3 (Geometric compatibility): relies on sphere packing optimality and $E_8$/Leech lattice constructions (Section R.4.2).
- Mechanism 4 (Mode-count compatibility): relies on the QFI interface count $M=24$ from Theorem Z.5.

These four strands are logically distinct, though they share foundational constants ($d_0 = 8$, $\varepsilon_0=\ln2$) at the axiomatic level. Only Mechanism 1 derives the minimal family-count theorem. Mechanism 2 shows that a marked real 8-carrier has a canonical three-element triality orbit; Mechanism 3 shows that the geometric sector carries a compatible three-fold lattice scaffold; Mechanism 4 shows that the interface-mode count is compatible with three 8-dimensional blocks.

**Structural compatibility from QFI mode count:** The interface mode count $M = 24$ (**Appendix Z**, Theorem Z.5) admits the factorization:
$$
M = 24 = 8 \times 3 = d_0 \times N_{\text{gen}}.
$$
This factorization does not independently derive $N_{\text{gen}} = 3$; rather, it shows that the topological count is compatible with organizing the interface modes into three 8-dimensional blocks. The QFI structure is therefore a consistency check, not an additional derivation pathway.

**Qualitative assessment:** The convergence of one branch-resolved derivation with three compatibility checks supports internal coherence. The proved result is the SM15 anomaly-plus-CP minimum or the SM16 linear-anomaly-plus-primitive-norm-plus-CP minimum, followed by the additive-monotone pre-flavor realization theorem.

**Remark: Methodological Note.** The strength of the consistency argument rests on the agreement between the topological derivation, the $D_4$ triality orbit, the $E_8$/Leech scaffold, and the QFI factorization. The latter three do not provide independent proofs of $N = 3$; they supply supporting structural checks. ∎

---

### R.4.2.7 Independent Mode-Channel Cross-Check

The shared input $M=24$ enters separately gated records; the selected Golay code has the explicit mathematical map to a Leech lattice below, whereas the dimension branch remains independent:
$$
M=24\longrightarrow
\begin{cases}
\mathcal G_{24},&\text{predictive-recovery code branch},\\
\Lambda_{24},&\text{explicit Golay coordinate construction or certified abstract-gluing branch},\\
D=4,&\text{faithful-shell least-feasible branch}.
\end{cases}
$$
The $24$-cell realizes the local kissing configuration on the third branch. Neither the Golay code nor the Leech lattice is an antecedent of the dimension implication, and no network dynamics follows from the $24$-cell without a separate realization theorem. Golay error correction supports physical robustness only after an encoding, noise channel, syndrome map, decoder, and dynamical stability estimate are registered.

The correlation and stability protocols in Sections Z.29--Z.31 test distinct records: a Golay correlation pattern tests the predictive-recovery encoding; a mathematical lattice check can test either the explicit coordinates or the abstract marked-gluing ledger; and a physical lattice or stability claim additionally requires its realization dynamics. A dimensional test requires the independent mode-channel certificate.

**Branch-Specific Experimental Protocols.** Sections Z.29–Z.31 state tests for the separately registered mode-count, code, lattice, and mode-channel branches:

1. **Coordination number scaling (Prediction Z.2):** Effective neighbor count in $d_0 = 8$ quantum systems should scale as $K(D_{\text{eff}})$ with effective dimension.

2. **Dimensional stability (Prediction Z.3):** Systems with $M_{\text{int}} = 24$ modes embedded in $D \neq 4$ effective dimensions should exhibit instability or spontaneous dimensional reduction.

3. **Error-correction correlations (Prediction Z.4):** A $24\times24$ correlation matrix can test the registered $12+12$ mode partition. Identifying the extended Golay code additionally requires the preregistered parity checks, weight enumerator, syndrome map, and decoder-success statistics; a $12+12$ split alone is not code-specific.

Each protocol tests only its declared branch. A code-level confirmation does not by itself confirm Leech gluing, a physical vacuum, dimensional reduction, or emergent-spacetime dynamics.


### R.4.2.8 Syndrome-Charge Homology

**Definition R.4.2.8a (Predictive Syndrome Complex).** Let $C_0$ be the finite abelian group of syndrome labels on a marked Golay--Leech carrier. A predictive syndrome complex is a finite chain complex
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
4. if every allowed local process changes a syndrome only by an element of $\operatorname{im}\partial_1$, then distinct classes in $H_{\mathrm{synd}}$ are superselection sectors relative to the allowed local-process algebra.

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

For (4), the additional locality hypothesis says that every allowed local process sends $s$ only to $s+u$ with $u\in\operatorname{im}\partial_1$. Hence every such process preserves $[s]\in H_{\mathrm{synd}}$ and the allowed local-process algebra is block diagonal with respect to the quotient-class decomposition. Distinct quotient classes are therefore superselection sectors relative to that algebra. ∎

**Corollary R.4.2.8c (Golay Distance Protects Nontrivial Syndrome Charge).** On a marked Golay-stabilized branch, assume that every operator supported on a carrier set $S$ induces a syndrome-change representative supported in $S$, and that the minimum support of a representative of any nontrivial logical syndrome class is the Golay distance
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

**Minimal admissible count:** On SM15, the linear and cubic anomaly equations plus a registered CP-active realization make $N=3$ the smallest nontrivial admissible count and select $(1,-1,0)$ up to sign and permutation. On SM16, the linear anomaly equation alone does not select that orbit; primitive normalization and the strict charge-norm objective select it at the smallest CP-capable count. Proposition R.3.5.1a then selects the realized count on its additional additive-monotone objective branch.

**Triality compatibility:** A marked real 8-carrier with $\mathfrak{so}(8)$ structure has the canonical $D_4$ triality orbit $\{V,S^+,S^-\}$. Imposing both SM15 equations on charges assigned to that orbit reproduces $\{a,-a,0\}$. On SM16 the cubic equation is absent, so triality is only a three-slot compatibility record and does not replace the primitive charge-norm selection.

**Geometric compatibility:** The registered Leech/$E_8$ construction and $M=24=8\times3$ carry a compatible three-fold scaffold. They do not independently select the family count.

**Phenomenological comparison:** The observed Standard Model count agrees with the value selected on the branch-resolved SM15 or SM16 premise package together with a registered CP-active realization and the additive-monotone family-count objective. Triality and lattice records test internal compatibility only.

## R.5 Conditional Mass-Hierarchy Model from $E_8$ Geometry

The following flavor model localizes wavepackets at selected $E_8$-related vacua and assigns Yukawa responses through overlap kernels. Hierarchical masses follow only after the localization, label, kernel, normalization, scale, and remainder certificates stated here and in Appendix T are imposed.

### R.5.1 Kähler Geometry and PCE-Compatible Potential

The complete flag manifold $\Sigma_8$ is a coadjoint orbit of $U(8)$, but its invariant Kähler metric is not unique: the invariant Kähler cone has one positive parameter for each simple root. Fix the registered equal-simple-root branch
$$
\delta_i:=\lambda_i-\lambda_{i+1}=1,
\qquad i=1,\ldots,7.
$$
On a dense flag chart its Kähler potential is
$$
K_\delta(Z,Z^\dagger)
=
\sum_{k=1}^7\delta_k\log\det(I_k+Z_kZ_k^\dagger),
\qquad
g_\delta=i\partial\bar\partial K_\delta.
$$
Thus the equal-coefficient formula is a declared metric branch, not a canonical metric on the full flag.

Let
$$
\mu_{U(8)}(x)=U(x)\Lambda U(x)^\dagger
$$
be the moment map on that branch, and let $\operatorname{pr}_{\mathrm{ss}}$ denote orthogonal projection to the embedded $\mathfrak{su}(3)\oplus\mathfrak{su}(2)$ algebra. A topological charge $q\in\pi_2(\Sigma_8)$ labels a connected component $\mathscr F_q$ of a map or field-configuration space; it does not label a subset of points of $\Sigma_8$. For each retained $q$, register:

1. a compact finite-dimensional smooth collective-coordinate reduction $\mathcal M_q$ of $\mathscr F_q$;
2. a smooth localization-center map $\ell_q:\mathcal M_q\to\Sigma_8$;
3. a trace-zero diagonal Hermitian pinning matrix $B_q$, fixed before minimizing the potential; and
4. a smooth common pinning-independent term $W:\Sigma_8\to\mathbb R$.

With $C$ from Definition R.3.2, define on $\mathcal M_q$
$$
V_{0,q}(m)
=
\frac{\kappa_\mu}{2}
\left\|\operatorname{pr}_{\mathrm{ss}}\mu_{U(8)}(\ell_q(m))\right\|^2
+
\Lambda_I W(\ell_q(m))
+
\frac{\kappa_C}{2}\|Cq\|^2,
\tag{R.12}
$$
and
$$
h_q(m):=-\left\langle B_q,\mu_{U(8)}(\ell_q(m))\right\rangle,
\qquad
V_q:=V_{0,q}+\eta h_q.
$$
The moment-map term is pointwise and controls the localization center. The sector term $\|Cq\|^2$ is constant on $\mathcal M_q$ and vanishes exactly on the Cartan-neutral candidate lattice. Neither term proves full nonabelian singletness; retained labels must separately pass Definition R.3.2's full-label-singlet certificate.

### R.5.2 Generation Vacua and $E_8$ Root Distances

Choose distinct sector labels $q_+,q_-,q_0\in L_{\rm light}$ with
$$
\ell_F(q_+)=a,
\qquad
\ell_F(q_-)=-a,
\qquad
\ell_F(q_0)=0.
$$
The subscript $0$ denotes zero family charge and need not denote the zero element of $\pi_2(\Sigma_8)$.

**Theorem R.5.1 (Conditional Three-Sector Vacuum Persistence).** For each $q\in\{q_+,q_-,q_0\}$, assume:

1. $\mathcal M_q$ is the registered compact finite-dimensional smooth reduction above;
2. the minimum set $\mathscr C_q$ of $V_{0,q}$ in the declared low-energy window is a compact Morse–Bott critical submanifold with positive-definite normal Hessian;
3. $h_q|_{\mathscr C_q}$ is Morse and has exactly one local minimum $m_q$; and
4. there are a neighborhood $U_q$ of $\mathscr C_q$ inside the compact low-energy window and a constant $\gamma_q>0$ such that
   $$
   \|dV_{0,q}(m)\|\ge\gamma_q
   \qquad
   \text{for every }m\text{ in the window outside }U_q.
   $$

Then, for all sufficiently small $\eta>0$, $V_q$ has exactly one nondegenerate local minimum $m_q(\eta)$ in that window. Define its localization center by
$$
p_q:=\ell_q(m_q(\eta))\in\Sigma_8.
$$
The three minima are distinct as elements of the disjoint union $\bigsqcup_q\mathcal M_q$. Their centers $p_q$ are pairwise distinct precisely when the registered localization maps satisfy that separation condition.

*Proof.* The finite-dimensional Morse–Bott perturbation theorem applies to $V_{0,q}$ and $h_q$ on $\mathcal M_q$. Near $\mathscr C_q$, its critical points correspond to those of $h_q|_{\mathscr C_q}$, with total index equal to the sum of normal and tangential indices. The unique restricted minimum has tangential index zero, and the positive normal Hessian has normal index zero, so it yields one nondegenerate local minimum. Compactness bounds $\|dh_q\|$ on the window. For $\eta\sup\|dh_q\|<\gamma_q$, the displayed gradient bound excludes every critical point outside $U_q$, while Morse–Bott index additivity leaves exactly the one local minimum arising from the unique minimum of $h_q|_{\mathscr C_q}$. Distinct sector components distinguish the configurations; distinctness of their images in $\Sigma_8$ is exactly the additional separation condition just stated. ∎

The three vacua are:
- $p_1$: vacuum for generation 1 (family charge $+a$)
- $p_2$: vacuum for generation 2 (family charge $-a$)
- $p_3$: vacuum for generation 3 (family charge $0$)

**Registered $E_8$ Triad Certificate:**

An $8$-dimensional coordinate count does not canonically embed the selected flag-manifold centers into the $E_8$ lattice, and a local tangent-metric identity does not fix finite geodesic distances. For the three-center flavor branch, register an ordered certificate
$$
\mathfrak C_{E_8}
=
(p_1,p_2,p_3;r_1,r_2,r_3;c_\Sigma),
$$
where $r_1,r_2,r_3$ are distinct $E_8$ roots, $c_\Sigma>0$, and all three pairwise distances satisfy
$$
d_\Sigma^2(p_g,p_{g'})
=
c_\Sigma\|r_g-r_{g'}\|^2.
$$
Define the normalized selected distances
$$
D_{gg'}:=c_\Sigma^{-1}d_\Sigma^2(p_g,p_{g'}).
$$
The common scale then cancels from every distance ratio. A nontrivial hierarchy requires the separately selected inequality
$$
D_{31}\ne D_{32}.
\tag{R.13}
$$
The family-charge values $\{a,-a,0\}$ do not by themselves select the ordered root labels or imply this inequality.

For distinct $E_8$ roots, Section R.2.2 gives
$$
D_{gg'}=\|r_g-r_{g'}\|^2\in\{2,4,6,8\}.
\tag{R.14}
$$
Thus discreteness is a theorem after $\mathfrak C_{E_8}$ is fixed; the physical triad, its ordering, and the common metric scale are certificate data fixed before phenomenological comparison.

### R.5.3 Yukawa Couplings from Gaussian Overlaps

**Gaussian Localization:**

Near each generation vacuum, the reduced potential has a quadratic Hessian. The overlap model below separately registers Gaussian profiles. On an isotropic local branch write
$$
\psi_g(r)\propto\exp\!\left(-\frac{\kappa}{2}\|r-r_g\|^2\right)
=\exp\!\left(-\frac{\|r-r_g\|^2}{2\xi^2}\right),
\qquad
\xi^2=\kappa^{-1}.
$$
Here $\kappa$ is an inverse-width parameter. It is not determined by the potential Hessian without a kinetic normalization, mass scale, and $\hbar$ convention. The Gaussian maximum-entropy property is compatible motivation for this ansatz, not a derivation of its quantum ground-state width.

**Higgs Alignment:**

The largest Yukawa coupling arises when the Higgs vacuum lies nearest to a generation vacuum. Empirically, the top Yukawa $y_t \approx 1$ suggests the Higgs aligns with the heaviest generation: $r_H \approx r_3$. This defines $Y_3$ as the overall scale ($Y_3 = Y_{\max}$). We adopt the convention that generation 3 (the heaviest) has its vacuum at the origin of the Cartan subalgebra, or equivalently, at the point where the Higgs field is localized.

**Overlap Integrals:**

On the registered flat eight-dimensional flavor-coordinate branch, take equally normalized generation profiles and a Higgs profile
$$
\psi_g(r)=N_a\exp\left(-\frac a2\|r-r_g\|^2\right),
\qquad
\phi_H(r)=N_b\exp\left(-\frac b2\|r-r_3\|^2\right),
$$
with $a,b>0$. Completing the square in
$$
Y_{gg'}
=
y_0\int_{\mathbb R^8}d^8r\,\psi_g(r)\phi_H(r)\psi_{g'}(r)
$$
gives the exact overlap
$$
Y_{gg'}
=
Y_0
\exp\left[
-\frac{ab}{2(2a+b)}\bigl(D_{g3}+D_{g'3}\bigr)
-\frac{a^2}{2(2a+b)}D_{gg'}
\right].
\tag{R.15}
$$
Hence the two coefficients are not independent:
$$
\alpha_1=\frac{ab}{2(2a+b)},
\qquad
\alpha_2=\frac{a^2}{2(2a+b)},
\qquad
\frac{\alpha_2}{\alpha_1}=\frac ab.
$$
For wavepackets transplanted to the curved flag target, write the certified result as the right-hand side of (R.15) multiplied by $(1+\rho_{gg'})$, with a forward-locked bound $|\rho_{gg'}|\le\epsilon_G<1$. The local small-angle Bures identity of Lemma T.41.4 controls only its tangent expansion; the finite-triad comparison is supplied by $\mathfrak C_{E_8}$ and the residual bound, not by extrapolating that local identity globally.

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

Put
$$
A:=\frac{ab}{2a+b}>0.
$$
The diagonal specialization of (R.15), including the certified curved-target remainder, is
$$
Y_{gg}=Y_0e^{-A D_{g3}}(1+\rho_{gg}),
\qquad
Y_{33}=Y_0(1+\rho_{33}).
$$
Under the diagonal-alignment identification $m_g\propto Y_{gg}$, define
$$
\varepsilon_g
:=
\log\frac{1+\rho_{33}}{1+\rho_{gg}}.
$$
Then
$$
\log\frac{m_3}{m_g}
=
A D_{3g}+\varepsilon_g,
\qquad g=1,2,
$$
and therefore the exact certified relation is
$$
\mathcal R
=
\frac{A D_{31}+\varepsilon_1}{A D_{32}+\varepsilon_2}.
\tag{R.17}
$$
On the flat Gaussian branch, or whenever the two logarithmic residuals vanish, (R.17) reduces to
$$
\mathcal R
=
\frac{D_{31}}{D_{32}}
=
\frac{d_\Sigma^2(p_3,p_1)}{d_\Sigma^2(p_3,p_2)}.
$$
If $|\rho_{gg}|\le\epsilon_G<1$ for $g=1,2,3$, then
$$
|\varepsilon_g|
\le
2\log\frac1{1-\epsilon_G},
$$
so the same certificate gives an explicit interval around the zero-residual ratio rather than an unquantified approximation.

**Scope.** The equality to a distance ratio is the common-response, diagonal-alignment, zero/common-residual reading for Dirac-type sectors. In the Majorana neutrino sector, the selected triad $T_\nu=(2,6,6)$ is instead read in the anchored form $\mathcal R_\nu=\Delta_1/\Delta_2=3$ of Theorem T.24.11; the $1\leftrightarrow2$ $A_2$ edge belongs to the PMNS mixing geometry.

**Discrete prediction on the exact triad branch.** If $\mathfrak C_{E_8}$ is fixed, $\varepsilon_1=\varepsilon_2=0$, and $m_3>m_2>m_1$, then $D_{31}>D_{32}$ with both values in $\{2,4,6,8\}$, so
$$
\boxed{\mathcal R\in\left\{\frac43,\frac32,2,3,4\right\}}.
\tag{R.18}
$$
The common metric scale, Gaussian normalization, and coefficient $A$ cancel exactly on this branch. With nonzero certified residuals, the interval derived above replaces the exact finite set.

## R.6 Phenomenological Comparison with Observed Fermion Masses

### R.6.0 Framework Evolution: Theorem--Model Boundary

The generation-number theorem and the flavor-response models are separate layers. $E_8$ supplies admissible discrete geometry, while physical label selection, continuous response coefficients, scale maps, and remainders remain model or certificate data. The flavor layer is not presently a zero-continuous-parameter prediction engine.



Before the observational comparison, the theorem and model layers are:

| **Aspect** | **Result in this appendix** | **Required branch data** |
|------------|-----------------------------|--------------------------|
| **Family count** | Smallest CP-capable primitive orbit occurs at $N=3$ | Uniform family charges; SM15 linear and cubic anomalies or SM16 linear anomaly plus primitive charge-norm minimization; CP-active realization; additive-monotone realized-count selection |
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
| Charged leptons | $3$ selected from the root-triad catalog | 2.889 | Retrospective calibration residual $3.70\%$ |
| Up quarks | $\{3/2,2,3\}$ | $\sim2.4$ | Unselected candidate set |
| Down quarks | $\{3/2,2\}$ | $\sim1.9$ | Unselected candidate set |

These rows are model comparisons. Forward predictions require independently selected sector labels and response/error certificates.

## R.7 CP Violation and Jarlskog Invariant

For the standard three-family parametrization,
$$
J_{CP}
=c_{12}c_{23}c_{13}^2s_{12}s_{23}s_{13}\sin\delta_{CP}.
$$
Thus three nondegenerate families permit a physical phase, but $J_{CP}\ne0$ additionally requires every displayed mixing factor and $\sin\delta_{CP}$ to be nonzero. The branch-resolved family theorem requires a registered CP-active realization; it does not select $\delta_{CP}$ or prove exponential mixing suppression. Those are separate flavor-model inputs.

## R.8 Discussion and Limitations

### R.8.1 What the Framework Establishes and What It Models

Theorem R.3.4 establishes the minimal admissible three-generation pattern on its branch-resolved SM15 and primitive-minimal-norm SM16 classes, and Proposition R.3.5.1a supplies the exact pre-flavor realization on its stated additive-monotone branch. The $D_4$, $E_8$, and Leech records are compatibility structures, not additional independent derivations of the generation count.

The flavor layer is conditional. Root distances provide candidate discrete diagnostics only after physical labels are selected. Exponential hierarchy, CKM/PMNS separation, CP phases, and the coefficient $\alpha=3/2$ require the particular overlap, potential, Schur, holonomy, scale, and remainder certificates stated in Appendix T. They are mechanisms or calibrated model outputs, not first-principles consequences of the generation theorem or of the Grassmannian orbit alone.

The model-independent statement about CP is limited: within the ordinary three-family mixing formalism, a nonzero Jarlskog invariant requires at least three generations. Its magnitude and phase are not fixed by that necessity result.



The theorem/model status is:

1. **Family count:** Theorem R.3.4 proves minimal admissibility on the SM15 anomaly branch and the primitive-minimal-norm SM16 branch, both with a CP-active realization; Proposition R.3.5.1a adds the additive-monotone realized-count branch.
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
On the explicit complement-equivariant active-pair path of Theorem Y.8 and the symmetric three-family sharing branch,
$$
\kappa_B
=\frac{\kappa_{\mathrm{EW}}}{2}+\frac{\varepsilon_0}{N_g}
=\frac{77}{4}+\frac{\ln2}{3}
=19.481049060186648\ldots.
$$
On an accepted nonstationary transport certificate satisfying Theorems Y.6.1i–Y.6.1j and reducing to Theorem Y.9, the baryon yield is
$$
\eta_B
=\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B}.
$$
The current numerical factors $\mathcal C_{\mathrm{eff}}=0.282$, $\mathcal F_{CP}=0.9997$, and $f_{\mathrm{wash}}=0.63$ remain illustrative until that single transport certificate and its covariance ledger are supplied. Their substitution gives
$$
\eta_B^{\mathrm{illustr}}
=0.282(0.9997)(0.63)e^{-19.481049060186648\ldots}
\approx6.15\times10^{-10}.
$$
No theory interval or agreement pull is defined before certificate acceptance.
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

- On SM15, the linear and cubic anomaly equations plus a CP-active realization give the smallest admissible count $N=3$; on SM16, the linear equation additionally requires primitive charge-norm minimization.
- The additive-monotone objective selects that smallest count on the effective R.3.5.1a branch.
- $D_4$ triality, $E_8$/Leech scaffolds, and QFI mode counts are compatibility records.
- Root-distance hierarchies, mixings, and phases require the independent flavor certificates described above.

### R.8.4 Conditional Connection to Baryogenesis

Within the Standard Model three-family mixing formalism, a physical CKM phase requires at least three families. A baryon yield additionally requires baryon-number violation, a CP-odd source, nonequilibrium transport, freeze-out, washout, normalization, and uncertainty certificates. The Berry-holonomy and sphaleron entries of Appendix Y are therefore conditional source-model data; they do not by themselves derive the observed $\eta_B$ or make exactly three generations cosmologically necessary.

The family-count theorem and baryogenesis model are compatible on their common branch. Baryogenesis is not an independent proof of the generation count, because alternative CP sources or enlarged family sectors are outside the theorem's declared class.

### R.8.5 Minimal Family-Charge Selection Audit

**Definition R.8.5a (Admissible Minimal Family-Charge Selection Problem).** Let $b\in\{15,16\}$ denote the SM15 or SM16 spectrum branch of Theorem R.3.4. A candidate is a finite nonzero integer charge multiset
$$
\mathcal Q=\{F_1,\ldots,F_N\}\subset\mathbb Z.
$$
Set
$$
g(\mathcal Q):=\gcd(|F_1|,\ldots,|F_N|),
\qquad
f_i:=\frac{F_i}{g(\mathcal Q)}.
$$
Its primitive representative is $f=(f_1,\ldots,f_N)$. Two candidates are in the same $U(1)_F$ charge orbit exactly when, after a permutation, their primitive representatives differ by one common sign. Equivalently, their integer vectors differ by a nonzero rational scalar and a permutation. This is an equivalence relation; every nonzero orbit has one primitive representative up to sign and permutation.

An admissible branch record satisfies:

1. **(P1) Linear anomaly cancellation:**
   $$
   \sum_{i=1}^N f_i=0.
   $$

2. **(P2) Spectrum-resolved anomaly condition:** on the SM15 branch,
   $$
   \sum_{i=1}^N f_i^3=0;
   $$
   on the SM16 branch, one uniformly charged $\nu_R^i$ per family is included and cancels the gravitational and cubic rows, so no cubic equation is imposed.

3. **(P3) Nontrivial primitive normalization:** $f\ne0$ and $\gcd(|f_1|,\ldots,|f_N|)=1$.

4. **(P4) CP-active realization:** a registered Yukawa/spurion record on these $N$ families has a nonzero rephasing invariant. This condition implies $N\ge3$ but is not equivalent to requiring three distinct numerical charge values. Lemma R.3.4a supplies an existence certificate for the selected orbit.

5. **(P5) PCE objective:** among records satisfying (P1)–(P4), minimize
   $$
   L_b(\mathcal Q)
   =
   L_0+N L_{\mathrm{block}}+L_{\mathrm{mix}}(N)
   +\lambda_F C_F(f),
   \qquad
   C_F(f):=\sum_{i=1}^N f_i^2,
   $$
   where $L_{\mathrm{block}}>0$, $L_{\mathrm{mix}}$ is nondecreasing, and $\lambda_F>0$.

**Theorem R.8.5b (PCE Selection of $N_g=3$ in the Family-Charge Class).** On either spectrum branch of Definition R.8.5a, the unique minimal-cost charge orbit is represented by
$$
f=(1,-1,0),
$$
equivalently
$$
\mathcal Q=\{a,-a,0\},
\qquad a\in\mathbb Z\setminus\{0\},
$$
and the selected generation count is $N_g=3$.

*Proof.* For $N=1$, (P1) forces the zero assignment, contradicting (P3). For $N=2$, (P1) gives a vector proportional to $(1,-1)$, but no two-family mixing matrix has a nonzero rephasing-invariant CKM phase, so (P4) fails.

Let $N=3$. On the SM15 branch, write $f_3=-f_1-f_2$. Then
$$
f_1^3+f_2^3+f_3^3=-3f_1f_2(f_1+f_2).
$$
Condition (P2) therefore forces one entry to vanish and the other two to be opposite. Primitive normalization gives $(1,-1,0)$ up to sign and permutation. On the SM16 branch, every nonzero integral vector satisfying (P1) obeys
$$
C_F(f)\ge2,
$$
because at least one positive and one negative integer occur. Equality holds exactly when one entry is $1$, one is $-1$, and all remaining entries vanish. Thus at $N=3$ the unique charge-norm minimizer is again the orbit of $(1,-1,0)$. Lemma R.3.4a supplies the required CP-active realization on this orbit.

For any admissible $N>3$, the same sign argument gives $C_F(f)\ge2$. Hence, relative to the selected three-family representative $f_*=(1,-1,0)$,
$$
L_b(\mathcal Q)-L_b(f_*)
=
(N-3)L_{\mathrm{block}}
+
L_{\mathrm{mix}}(N)-L_{\mathrm{mix}}(3)
+
\lambda_F\bigl(C_F(f)-2\bigr)
>0.
$$
Therefore no larger admissible multiset has equal or lower cost, proving both uniqueness of the selected orbit and $N_g=3$. ∎

**Remark R.8.5c (No Exhaustive Classification of All Larger Charge Multisets).** Theorem R.8.5b is a minimal-selection theorem, not an exhaustive classification. For example,
$$
\{-20,-14,-1,17,18\}
$$
has sum $0$ and cube-sum $0$, so it satisfies the arithmetic SM15 equations; it also satisfies the SM16 linear equation. A CP-active Yukawa realization remains a separate (P4) record. If such a record is supplied, this primitive five-family candidate is still PCE-demoted because $N=5$ and $C_F=1210$ exceed the selected values $N=3$ and $C_F=2$.

**Corollary R.8.5d (Scope of the $U(1)_F$ Selection).** Theorem R.8.5b is internal to the two integer $U(1)_F$ spectrum branches of Definition R.8.5a. The SM16 branch already includes one uniformly charged right-handed neutrino per family and is compatible with the broken-$U(1)_F$ type-I-seesaw operators of Lemma R.3.4a. Non-Abelian family symmetries, additional sterile states, response-active extra generations, boundary/interface completions, and defect-fusion labels are different candidate classes with their own anomaly, embedding, threshold, flavor, and PCE ledgers.

*Proof.* Definition R.8.5a fixes the candidate object, its SM15/SM16 spectrum flag, its primitive orbit, and its objective. The listed extensions change at least one of those data and therefore belong to separate comparison classes. ∎

**Theorem R.8.5e (Generation-Branch Catalog under Premise Relaxation).** The generation-count result has the following premise-sensitive status.

1. If $U(1)_F$ is a predictive-frame redundancy, either the SM15 or registered SM16 spectrum branch is fixed, a CP-active realization is required, and the PCE objective of Definition R.8.5a is retained, then Theorem R.8.5b selects
   $$
   \{a,-a,0\},
   \qquad
   N_g=3.
   \tag{R.8.5e.1}
   $$

2. If $U(1)_F$ is instead a physical global update channel, Theorem X.8d does not impose quotient descent. Its anomaly/current consistency conditions and its family count must then be recorded on a separate physical-symmetry branch.

3. If CP-active mixing is not required, the anomaly equations alone do not select three families. The only one-family solution of the linear equation is the trivial charge, while the two-family orbit $(1,-1)$ is anomaly-admissible but has no physical CKM phase.

4. If the PCE objective is relaxed, larger arithmetic solutions survive whenever their additional threshold, flavor, neutrino, or CP responses are retained. Response-null duplicates are removed only by the separate PPI/PCE response quotient.

5. A registered SM16 right-handed-neutrino and broken-spurion seesaw is already inside item 1. Non-Abelian family groups, extra sterile states, boundary/interface anomaly inflow, and defect-fusion labels lie outside this integer-$U(1)_F$ catalog and require their own finite anomaly-bordism, determinant-orientation, flavor, and threshold ledgers.

Thus failure of a later flavor texture, CKM/PMNS fit, neutrino mass model, or baryogenesis certificate identifies a downstream branch failure; it refutes the structural family-count result only if it also invalidates one of the premises used in item 1.

*Proof.* Item 1 is Theorem R.8.5b. Item 2 is the redundancy/physical-channel distinction of Theorem X.8d. Item 3 follows from (P1) and the two-family rephasing theorem. Item 4 follows from the explicit objective comparison in Theorem R.8.5b and the independent response quotient. Item 5 is Corollary R.8.5d together with Lemma R.3.4a. ∎

## R.9 Summary

*   **Topology:** On the $d_0=8$ flag-manifold branch, $\pi_2(\Sigma_8)\cong\mathbb Z^7$.
*   **$E_8$ Geometry:** A registered $E_8$ root model supplies candidate squared distances $\{2,4,6,8\}$; its physical embedding and labels are branch data.
*   **Gauge–Topology Map:** The marked embedding induces the stated homomorphism to $X^*(T_{\mathrm{SM}})$; Cartan neutrality gives a candidate sector and full singletness requires the root-action certificate.
*   **Family Minimality:** On SM15, the linear and cubic anomaly equations plus CP capability give the smallest primitive pattern $\{a,-a,0\}$; on SM16, the linear anomaly equation plus primitive charge-norm minimization and CP capability gives the same pattern. Larger admissible patterns exist.
*   **Family Selection:** Effective Proposition R.3.5.1a selects $N_g=3$ under its additive-monotone objective. Response-null removal is supplied separately by Corollary P.6.1b.8.
*   **Compatibility Records:** Triality, the scaled $E_8^{\oplus3}$ scaffold, interface mode count, and Golay code are cross-branch compatibility facts, not further proofs of $N_g=3$.
*   **Flavor Diagnostics:** A registered triad and common leading response give candidate ratios. Physical labels, coefficients, effective dimensions, scales, phases, schemes, and remainders remain Appendix-T certificate data.
*   **Phenomenological Status:** Charged-lepton and quark comparisons are calibration evidence until the flavor certificate is specified independently and evaluated on held-out data.
*   **Gauge/Family Relation:** Gauge and family constructions share some MPU scaffolding but follow different conditional inference chains; neither theorem derives the other.