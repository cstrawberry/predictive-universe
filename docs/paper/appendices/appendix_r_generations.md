# Appendix R: A Proposed Topological Origin for the Three-Fermion Generations

## R.0 Introduction

This appendix develops a first-principles pathway by which the threefold generation structure of the Standard Model (SM) fermion sector emerges from the topology of a fundamental internal Perspective Space associated with a Minimal Predictive Unit (MPU). The Perspective Space is the complete flag manifold

$$
\Sigma_8 \cong U(8)/U(1)^8,
\tag{R.1}
$$

naturally attached to an MPU with Hilbert space $H_0 \cong \mathbb{C}^8$, the minimal dimension required for self-referential logic (Theorem 23).

Three pillars drive the derivation:

1.  **Topology:** The second homotopy group of the Perspective Space, $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$, provides seven independent integer topological charges.
2.  **Gauge–Topology Correspondence:** A representation-theoretic map from the cohomology group $H^2(\Sigma_8; \mathbb{Z})$ to the weight lattice of the emergent gauge group is established.
3.  **PCE-based Selection:** Physical viability is enforced by constraints of non-Abelian charge neutrality and Abelian anomaly cancellation across topological sectors, together with energetic and complexity minimization dictated by the Principle of Compression Efficiency (PCE).

A precise “gauge–topology correspondence” is proved: any $G_{\rm SM}$-embedding on $H_0$ induces a homomorphism from $\pi_2(\Sigma_8)$ to the Cartan weight lattice of $G_{\rm SM}$, and hence a center character map to $Z(SU(3)) \cong \mathbb{Z}_3$. Non-Abelian neutrality then selects a “light sublattice” $L_{\rm light}\subset\mathbb{Z}^7$. To achieve a nontrivial multi-sector structure while preserving SM gauge invariance of Yukawa couplings, we introduce a family $U(1)_F$ whose charges are induced by topology; anomaly cancellation for this Abelian factor across sectors forces a minimal nontrivial three-sector solution with offsets $\{a,-a,0\}$. A worked instance, based on a physically motivated, PCE-compatible ansatz for embedding the first-generation fermions, provides explicit Cartan charge vectors, a primitive basis of $L_{\rm light}$, the minimal family-charge unit $a$, and three minimal-norm sector vectors. A PCE-compatible potential on $\Sigma_8$ selects sector minima; Gaussian semiclassics on this Kähler target yields Yukawa matrices from overlap integrals, producing exponentially hierarchical masses and small mixings determined by geodesic separations and local Hessians.

## R.1 The MPU’s Perspective Space and Its Topology

Let $\Sigma_8 := U(8)/U(1)^8$ be the complete flag manifold of $\mathbb{C}^8$. It is a compact, simply connected Kähler manifold of complex dimension $28$ and real dimension $56$.

### R.1.1 Theorem (Homotopy of $\Sigma_8$).

The Perspective Space $\Sigma_8$ is simply connected and its second homotopy group is $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$.

*Proof.* Consider the principal bundle $T^8 \to U(8) \to \Sigma_8$ where $T^8 \cong U(1)^8$ is the maximal torus. The long exact sequence in homotopy for this fibration yields [Bott & Tu 1982]:

$$
\dots \to \pi_2(U(8)) \to \pi_2(\Sigma_8) \to \pi_1(T^8) \to \pi_1(U(8)) \to \pi_1(\Sigma_8) \to 0.
\tag{R.2}
$$

Using the standard results $\pi_2(U(n)) = 0$, $\pi_1(T^n) \cong \mathbb{Z}^n$, and $\pi_1(U(n)) \cong \mathbb{Z}$, the relevant segment reduces to:

$$
0 \to \pi_2(\Sigma_8) \to \mathbb{Z}^8 \to \mathbb{Z} \to \pi_1(\Sigma_8) \to 0.
\tag{R.3}
$$

The homomorphism $\mathbb{Z}^8 \to \mathbb{Z}$ is induced by the inclusion $T^8 \hookrightarrow U(8)$ and is given by the summation map $(k_1, \dots, k_8) \mapsto \sum_i k_i$, which is surjective. By exactness of the sequence, $\pi_1(\Sigma_8) = 0$ and $\pi_2(\Sigma_8) \cong \ker(\sum: \mathbb{Z}^8 \to \mathbb{Z}) \cong \mathbb{Z}^7$. ∎

### R.1.2 Topological generators and cohomology in degree two

Let $0 \subset S_1 \subset S_2 \subset \dots \subset S_8 = \mathbb{C}^8 \times \Sigma_8$ be the universal flag of subbundles over $\Sigma_8$, where $\mathrm{rank}(S_k) = k$. Define the tautological quotient line bundles $Q_k := S_k/S_{k-1}$ and their first Chern classes $x_k := c_1(Q_k) \in H^2(\Sigma_8; \mathbb{Z})$. The triviality of the ambient rank-8 bundle implies $\sum_k x_k = 0$.

An integral basis for $H^2(\Sigma_8; \mathbb{Z})$ is given by differences of these Chern classes [Fulton 1997; Brion 2005]:

$$
\omega_i := x_i - x_{i+1}, \quad i = 1, \dots, 7.
\tag{R.4}
$$

By the Hurewicz theorem, the $\omega_i$ represent the generators of $\pi_2(\Sigma_8)$. Concretely, for a smooth map $f:S^2\to \Sigma_8$, define the Chern integers

$$
k_i := \int_{S^2} f^*(x_i)\in \mathbb{Z},\qquad \sum_{i=1}^8 k_i=0,
$$

and the topological charges

$$
q_i := \int_{S^2} f^*(\omega_i) = k_i-k_{i+1},\qquad i=1,\dots,7.
$$

Thus $\pi_2(\Sigma_8)\cong \ker\left(\sum_i : \mathbb{Z}^8\to\mathbb{Z}\right)\cong \mathbb{Z}^7$ with integral coordinates $q=(q_1,\dots,q_7)$ in the $\{\omega_i\}$-basis.

## R.2 Gauge–Topology Correspondence

Let $\rho: G_{\rm SM} \to U(8)$ be a fixed embedding of the Standard Model gauge group into $U(8)$, providing an eigenspace decomposition of $H_0 \cong \mathbb{C}^8$ into eight one-dimensional weight lines with weights $w_i \in \mathfrak{t}^\ast(G_{\rm SM})$ for $i=1,\dots,8$. We write each weight in components for $G_{\rm SM} = SU(3) \times SU(2) \times U(1)_Y$:

$$
w_i = (r_i; s_i; y_i),
\tag{R.5}
$$

where $r_i \in \mathfrak{t}^\ast(SU(3))$ (two Cartan coordinates, e.g., Dynkin basis), $s_i \in \mathfrak{t}^\ast(SU(2))$ (the $T_3$ eigenvalue), and $y_i \in \mathbb{R}$ (hypercharge, in a chosen normalization).

### R.2.1 Theorem (Charge map and center character).

There exists a homomorphism from topological to gauge charges:

$$
\mu_{\rm top}: H^2(\Sigma_8; \mathbb{Z}) \to P_{G_{\rm SM}},
\tag{R.6}
$$

where $P_{G_{\rm SM}}$ is the integral weight lattice. In the $\omega$-basis,

$$
\mu_{\rm top}(\omega_i) = w_i - w_{i+1}, \quad i = 1, \dots, 7.
\tag{R.7}
$$

This assignment is canonical given an ordered flag; PCE selects the ordering minimizing the total complexity of the charge vectors, e.g., $\sum_A \|v_A\|_1$. For any Cartan generator $H_A$, the corresponding integer charge of a topological state $q \in \mathbb{Z}^7$ is $A(q) = v_A \cdot q$, with components $v_A[i] := \langle w_i - w_{i+1}, H_A\rangle \in \mathbb{Z}$.

Composing the $SU(3)$ projection with the natural map $P_{SU(3)} \to Z(SU(3)) \cong \mathbb{Z}_3$ (modding out the root lattice) gives the **center character map** [Fulton & Harris 1991; Georgi 1999]:

$$
\tau: \pi_2(\Sigma_8) \cong H^2(\Sigma_8; \mathbb{Z}) \to \mathbb{Z}_3,
\tag{R.8}
$$

given by

$$
\tau(q) \equiv (c_1 \cdot q + 2 c_2 \cdot q) \pmod 3,
\tag{R.9}
$$

where $c_1$ and $c_2$ are the two $SU(3)$ Cartan charge vectors.

*Proof.* The universal splitting $E = \bigoplus_k Q_k$ over $\Sigma_8$ yields an equivariant class $\sum_k x_k \otimes w_k \in H^2(\Sigma_8; \mathbb{Z}) \otimes P_{G_{\rm SM}}$. With $\sum_k x_k=0$, passing to the $\omega$-basis maps $x_k-x_{k+1}\mapsto w_k-w_{k+1}$, defining $\mu_{\rm top}$. Linearity gives $A(q)=v_A\cdot q$. For $SU(3)$, the center character of highest weight $(\lambda_1,\lambda_2)$ is $\exp(2\pi i(\lambda_1+2\lambda_2)/3)$; the integer $c_1\cdot q+2c_2\cdot q$ recovers this exponent modulo $3$, defining $\tau$. ∎

### R.2.2 Proposition (Surjectivity of $\tau$ for the PCE-optimal embedding).

For the PCE-favored embedding $\rho$ on $H_0 \cong \mathbb{C}^8$ specified in R.4 below, the center character map $\tau$ is surjective.

*Proof.* For the embedding of R.4.1, $c_1 = (2, -1, -1, 2, -1, 0, 0)$ and $c_2 = (-1, 2, -1, -1, 2, -1, 0)$. For the basis vector $e_6 \in \mathbb{Z}^7$,

$$
\tau(e_6) \equiv (c_1 \cdot e_6 + 2 c_2 \cdot e_6) \pmod 3 = (0 + 2(-1)) \pmod 3 = 1 \pmod 3,
\tag{R.10}
$$

so the image contains a generator of $\mathbb{Z}_3$. ∎

*Remark (family $U(1)_F$):* Beyond $G_{\rm SM}$, one may include an Abelian factor $U(1)_F$ inside $U(8)$ that commutes with $G_{\rm SM}$. Its charge-map vector $f\in\mathbb{Z}^7$ is defined by the same adjacent-difference rule (R.7) for the corresponding generator.

## R.3 PCE Selection Principles

Two selection mechanisms, derived from the Principle of Compression Efficiency, enforce physical viability and minimality: global topological neutrality and non-Abelian neutrality (lightness).

### R.3.1 Theorem (Global topological neutrality).

For any physically realized collection of long-lived, low-energy sectors labeled by topological charges $\{q^{(g)}\} \subset \pi_2(\Sigma_8)$, the net charge must vanish:

$$
\sum_g q^{(g)} = 0.
\tag{R.11}
$$

*Proof.* On a compact Kähler target, a nonzero $q \in \pi_2$ represents a nontrivial homology class whose energy is bounded below by a positive value proportional to its area (see R.6). A nonzero net topological charge at spatial infinity would produce an unavoidable gradient energy density in the vacuum. PCE selects the globally trivial vacuum sector, enforcing $\sum_g q^{(g)} = 0$. ∎

### R.3.2 Definition (Light sublattice).

Let $v_{c_1}, v_{c_2}, v_t$ be the charge-map vectors for the $SU(3) \times SU(2)$ Cartan generators. Stack these as rows of $C \in \mathrm{Mat}_{3\times 7}(\mathbb{Z})$. The **light sublattice** is the integer kernel:

$$
L_{\rm light} := \ker_{\mathbb{Z}} C = \{ q \in \mathbb{Z}^7 : C q = 0 \}.
\tag{R.12}
$$

These are topological charges neutral under $SU(3)\times SU(2)$. Sectors $q \notin L_{\rm light}$ carry non-Abelian charges and are penalized by PCE.

### R.3.3 Lemma (Center neutrality in the light sublattice).

For any $q \in L_{\rm light}$, its $SU(3)$ center charge is trivial: $\tau(q) = 0 \in \mathbb{Z}_3$.

*Proof.* If $q \in L_{\rm light}$, then $c_1 \cdot q = c_2 \cdot q = 0$, hence $\tau(q)\equiv (c_1\cdot q + 2 c_2\cdot q)\pmod 3 = 0$. ∎

### R.3.4 Theorem (Family-charge anomaly constraints and minimal sector count).

Let $\{q^{(g)}\}\subset L_{\rm light}$ be the set of realized light sectors. Each sector corresponds to a full SM generation (including right-handed singlets) with **identical** $G_{\rm SM}$ charges across sectors; in addition, the sector carries a **family** charge offset

$$
F_g := f \cdot q^{(g)},
$$

where $f$ is the $U(1)_F$ charge-map vector. If $U(1)_F$ is gauged, Yukawa couplings arise via a $U(1)_F$-charged Higgs or higher-dimension operators involving a flavon field. Mixed SM–$U(1)_F$ anomalies cancel because each generation's SM content is identical and the net family charge vanishes (as shown below). For the theory to be consistent, the remaining pure $U(1)_F$ and mixed gravitational–$U(1)_F$ anomalies must also cancel across the sectors, requiring:
$$
\sum_g F_g = 0,
\qquad
\sum_g F_g^3 = 0.
\tag{R.13}
$$
There is no nontrivial two-sector solution: if $N=2$, global neutrality $\sum_g q^{(g)}=0$ forces $q^{(2)}=-q^{(1)}$ and hence $F_2=-F_1$, producing a **family-vector-like pair under $U(1)_F$**. The minimal nontrivial solution is $N=3$ with offsets $\{a,-a,0\}$, where $a>0$ is the minimal nonzero value achievable from $f(L_{\rm light})$, i.e., $a = \gcd\{f\cdot q : q\in L_{\rm light}\}$.

*Proof.* The anomaly constraints are standard. For integers $F_1, F_2, F_3$, the identity $x^3+y^3+z^3-3xyz=(x+y+z)(x^2+y^2+z^2-xy-yz-zx)$ implies that if $\sum_g F_g=0$ then $\sum_g F_g^3=3F_1F_2F_3$. Thus $\sum_g F_g=\sum_g F_g^3=0$ forces $F_1F_2F_3=0$, i.e., at least one $F_g$ vanishes; the linear constraint then enforces $\{a,-a,0\}$. For $N=2$, $\sum q^{(g)}=0$ implies $q^{(2)}=-q^{(1)}$ and $F_2=-F_1$, which is vector-like. Therefore $N=3$ is minimal. The minimal nonzero magnitude $a$ is $\gcd(f(L_{\rm light}))$. ∎

## R.4 Minimal Three-Sector Solution: A Worked Instance

We illustrate the mechanism by analyzing a specific ansatz for embedding the first-generation left-handed fermions onto $H_0 \cong \mathbb{C}^8$. This embedding is physically motivated and posited to be favored by PCE for minimal complexity and structural simplicity.

We order the eight basis states as the components of the left-handed quark and lepton doublets ($Q_L \oplus L_L$):

$$
(e_1, \dots, e_8) = (u_L^r, u_L^g, u_L^b, d_L^r, d_L^g, d_L^b, \nu_L, e_L).
\tag{R.14}
$$

**Table R.1:** Integer-normalized gauge weights for the left-handed fermion embedding ansatz. We use integer normalizations $2T_3$ for weak isospin and $6Y$ for hypercharge.

|  i  |    State   | SU(3) (λ₁, λ₂) | 2T₃ |  6Y |
| :-: | :--------: | :------------: | :-: | :-: |
|  1  | $u_L^r$ |     (1, 0)     |  +1 |  +1 |
|  2  | $u_L^g$ |     (-1, 1)    |  +1 |  +1 |
|  3  | $u_L^b$ |     (0, -1)    |  +1 |  +1 |
|  4  | $d_L^r$ |     (1, 0)     |  -1 |  +1 |
|  5  | $d_L^g$ |     (-1, 1)    |  -1 |  +1 |
|  6  | $d_L^b$ |     (0, -1)    |  -1 |  +1 |
|  7  | $\nu_L$ |     (0, 0)     |  +1 |  -3 |
|  8  |  $e_L$  |     (0, 0)     |  -1 |  -3 |

### R.4.1 Charge-map vectors

Adjacent weight differences $v_A[i] = \langle w_i - w_{i+1}, H_A\rangle$ for $i = 1, \dots, 7$, computed from Table R.1, give:

*   **Hypercharge (6Y):** $y = (0, 0, 0, 0, 0, 4, 0)$
*   **Weak Isospin (2T₃):** $t = (0, 0, 2, 0, 0, -2, 2)$
*   **Color Cartan 1 (λ₁):** $c_1 = (2, -1, -1, 2, -1, 0, 0)$
*   **Color Cartan 2 (λ₂):** $c_2 = (-1, 2, -1, -1, 2, -1, 0)$

 For the family generator, we adopt the ansatz $f = y$. We choose $f$ to **coincide with the adjacent-difference pattern of hypercharge** to minimize complexity (PCE), while taking the corresponding generator to be **linearly independent of $Y$** in $u(8)$ (orthogonal in the Cartan metric), so $U(1)_F$ commutes with and is not a linear combination of SM factors. This choice suggests a deep, PCE-favored connection between the mechanism that differentiates families and the generation of hypercharge itself. Thus:
 *   **Family ($F$):** $f = (0, 0, 0, 0, 0, 4, 0)$

### R.4.2 The light sublattice

Solving $Cq=0$ for $C=\begin{bmatrix}c_1\\c_2\\t\end{bmatrix}$ yields a primitive $\mathbb{Z}$-basis for the rank-4 light sublattice $L_{\rm light} \subset \mathbb{Z}^7$:
$$
\ell_1 = (1, 2, 0, 0, 0, 3, 3),\qquad
\ell_2 = (0, -1, 1, 0, 0, -3, -4),
$$
$$
\ell_3 = (0, 2, 0, 1, 0, 3, 3),\qquad
\ell_4 = (0, -1, 0, 0, 1, 0, 0).
$$
One verifies $C\ell_j=0$ for $j=1,\dots,4$ and that $\{\ell_j\}$ are $\mathbb{Z}$-independent. A structural consequence of this basis is that for any $q\in L_{\rm light}$, the sixth component satisfies $q_6 \in 3\mathbb{Z}$.

### R.4.3 Minimal family-charge unit $a$ and three-sector solution

Since $F(q)=f\cdot q = 4q_6$ and $q_6\in 3\mathbb{Z}$ on $L_{\rm light}$, we obtain
$$
f(L_{\rm light}) = 12\mathbb{Z}
\qquad\Rightarrow\qquad
a := \gcd(f(L_{\rm light})) = 12
$$
in the chosen integer normalization. A search within $L_{\rm light}$ for vectors with $q_6=\pm 3$ that minimize the squared Euclidean norm $|q|^2$ reveals that the minimum norm is 21. One such minimal representative is
$$
q^{(1)} = (1, 1, 0, 0, 1, 3, 3).
$$

A canonical minimal-norm triple that satisfies global neutrality and is favored by PCE for its minimal energy and complexity is
$$
q^{(1)} = (1, 1, 0, 0, 1, 3, 3),\qquad
q^{(2)} = -q^{(1)},\qquad
q^{(3)} = 0,
$$
which realizes the family-charge offsets $\{+a, -a, 0\}=\{+12, -12, 0\}$.

## R.5 Dynamical Ground States and Geometric Yukawas

### R.5.1 Kähler geometry and potential

The flag manifold $\Sigma_8$ is a coadjoint orbit of $U(8)$. Fix $\Lambda = \mathrm{diag}(\lambda_1,\dots,\lambda_8)$ with $\lambda_i - \lambda_{i+1} = \alpha_i > 0$. A PCE-symmetric choice is $\alpha_i = 1$ for all $i$. On the dense Borel chart, the standard Kähler potential is
$$
K(Z, Z^\dagger) = \sum_{k=1}^7 \log\det(I_k + Z_k Z_k^\dagger),
$$
with metric $g = i\partial\bar\partial K$. The $U(8)$ moment map is $\mu_{U(8)}(U) = U\Lambda U^\dagger$. Projecting to $\mathfrak{g}_{\rm SM}$ gives $\mu_{G_{\rm SM}} = \mathrm{pr}_{\mathfrak{g}_{\rm SM}} \mu_{U(8)}$. A PCE-compatible potential on $\Sigma_8$ is
$$
V = (\kappa_\Sigma/2)\, \| \mu_{G_{\rm SM}} \|^2 + \Lambda_I\, V_S,
\tag{R.15}
$$
where the first term penalizes non-Abelian charges, and $V_S$ is a small Morse–Schubert term that breaks degeneracy and ensures non-degenerate minima at torus-fixed points $p_\sigma$.

### R.5.2 Sector minima

Each topological sector $q$ selects a preferred vacuum by adding a small linear pinning term, $\varepsilon V_B = -\varepsilon \langle\mu_{U(8)}, B(q)\rangle$, where $\varepsilon>0$ is small and $B(q)$ is a diagonal matrix encoding $q$. Minimizing $V_q = V + \varepsilon V_B$ over fixed points selects distinct minima $p_+$, $p_-$, and $p_0$ for sectors $q(+) = q^{(1)}$, $q(-) = q^{(2)}$, and $q(0) = q^{(3)}$. By symmetry,
$$
D := d_\Sigma(p_+, p_0) = d_\Sigma(p_-, p_0), \quad D' := d_\Sigma(p_+, p_-).
\tag{R.16}
$$

### R.5.3 Gaussian overlaps: closed form

The Yukawa coupling between two fermion generations $g, g'$ and the Higgs field is modeled by the overlap integral of three Gaussian wavepackets centered at $p_g$, $p_{g'}$, and $p_H$ (the Higgs vacuum) on $\Sigma_8$. In the symmetric case ($\beta_+ = \beta_- = \beta$, and $p_H = p_0$),
$$
Y_{gg'} \propto \exp\!\left[ -\frac{\alpha_1}{2}\big(d_\Sigma(p_g, p_0)^2 + d_\Sigma(p_{g'}, p_0)^2\big) - \frac{\alpha_2}{2}\, d_\Sigma(p_g, p_{g'})^2 \right],
\tag{R.17}
$$
with positive constants $\alpha_1,\alpha_2$ from the Hessians.

*Consequences:*
*   $Y_{33}$ is maximal (involves $p_0$).
*   $Y_{11} = Y_{22}$ are suppressed by $\exp(-\alpha_1 D^2)$.
*   $Y_{13} = Y_{23}$ are suppressed by $\exp(-\alpha_1 D^2/2)$.
*   $Y_{12}$ is most suppressed, by $\exp(-\alpha_1 D^2 - (\alpha_2/2) D'^2)$.

This geometry naturally produces hierarchical masses and small mixings. Large leptonic mixings can arise if the leptonic sector has a smaller $D'$ or a different Hessian ratio $\alpha_2/\alpha_1$ than the quark sector.

## R.6 Energy Bounds and the Selection of Three Light Sectors

For sigma models on a compact Kähler target $(\Sigma_8,\Omega)$, the energy of a finite-energy configuration on a **spatial slice** (corresponding to a map $S^2 \to \Sigma_8$) in a topological sector $q \in \pi_2(\Sigma_8)$ satisfies a Bogomolny-type bound [Manton & Sutcliffe 2004; Fujimori, Nitta & Ohashi 2024]:
$$
E[q] \ge 4\pi \sum_{i=1}^7 \alpha_i |q_i|,
\tag{R.18}
$$
where $\alpha_i$ are the Kähler class weights (here $\alpha_i=1$).

For the three sectors $q(\pm), q(0)$ derived above, one has
$$
\|q(\pm)\|_1 = |1|+|1|+|0|+|0|+|1|+|3|+|3| = 9,\qquad \|q(0)\|_1 = 0.
$$
Sectors outside $L_{\rm light}$ are non-Abelian charged and are excluded by PCE. Within $L_{\rm light}$, the triple $\{q^{(1)},-q^{(1)},0\}$ minimizes the family-charge unit $|F|=|f\cdot q|$ while achieving small $\ell_1$ and $\ell_2$ norms (with $|q^{(1)}|^2=21$), making the three-sector configuration PCE-favored under (R.18). Configurations with five or more sectors (e.g., $\{a, -a, b, -b, 0\}$), though mathematically possible, require a more complex fermion content and incur higher minimal energy and model complexity, rendering them disfavored.

## R.7 Summary

*   **Topology:** $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$ with an integral basis $\{\omega_i\}$ from universal quotient line bundles $Q_i$.
*   **Gauge–Topology Correspondence:** The embedding $\rho: G_{\rm SM} \to U(8)$ induces a homomorphism $\mu_{\rm top}: H^2(\Sigma_8; \mathbb{Z}) \to P_{G_{\rm SM}}$ via adjacent weight differences; the $SU(3)$ center character $\tau: \pi_2(\Sigma_8) \to \mathbb{Z}_3$ is surjective for the PCE-favored embedding.
*   **PCE Selection:** The **light sublattice** $L_{\rm light} = \ker_{\mathbb{Z}}\{c_1, c_2, t\}$ enforces non-Abelian neutrality; center neutrality is automatic for these states.
*   **Family $U(1)_F$:** An Abelian factor commuting with $G_{\rm SM}$ has charge-map vector $f$; family-charge offsets $F_g=f\cdot q^{(g)}$ across sectors satisfy (R.13). The minimal nontrivial three-sector pattern is $\{F_g\}=\{a,-a,0\}$, with $a=\gcd f(L_{\rm light})$.
*   **Worked Instance:** An explicit embedding ansatz yields charge vectors $c_1, c_2, t$, and a family vector $f=(0,0,0,0,0,4,0)$; a primitive basis for $L_{\rm light}$; the minimal family-charge unit $a = 12$; and three minimal-norm sectors $q^{(1)} = (1, 1, 0, 0, 1, 3, 3)$, $q^{(2)} = -q^{(1)}$, and $q^{(3)} = 0$.
*   **Dynamics:** A PCE-compatible potential on $\Sigma_8$ selects three distinct vacuum states $p_\pm, p_0$; Gaussian overlap integrals centered at these vacua yield a Yukawa matrix with hierarchical masses and small mixings controlled by the geodesic separations $D, D'$.

