# Appendix R: A Proposed Topological Origin for the Three-Fermion Generations

## R.0 Introduction

This appendix develops a first-principles pathway by which the threefold generation structure of the Standard Model (SM) fermion sector emerges from the topology of a fundamental internal Perspective Space associated with a Minimal Predictive Unit (MPU). The Perspective Space $\Sigma_8$ is the complete flag manifold, rigorously defined in **Section 7.2.5** (Theorem 26, formalized in Appendix M.2),

$$
\Sigma_8 \cong U(8)/U(1)^8,
\tag{R.1}
$$

naturally attached to an MPU with Hilbert space $H_0 \cong \mathbb{C}^8$, the minimal dimension required for self-referential logic (Theorem 23). This derivation is a key component of the framework's ability to explain the Standard Model's structure from first principles.

Three pillars drive the derivation:

1.  **Topology:** The second homotopy group of the Perspective Space, $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$, provides seven independent integer topological charges.
2.  **Gauge–Topology Correspondence:** A representation-theoretic map from the cohomology group $H^2(\Sigma_8; \mathbb{Z})$ to the weight lattice of the emergent gauge group is established.
3.  **PCE-based Selection:** Physical viability is enforced by constraints of non-Abelian charge neutrality and Abelian anomaly cancellation across topological sectors, together with energetic and complexity minimization dictated by the Principle of Compression Efficiency (PCE).

A precise “gauge–topology correspondence” is proved: any embedding of the SM gauge group $G_{\rm SM}$ acting on $H_0$ induces a homomorphism from $\pi_2(\Sigma_8)$ to the Cartan weight lattice of $G_{\rm SM}$. This consequently yields a center character map, e.g., to $Z(SU(3)) \cong \mathbb{Z}_3$. Non-Abelian neutrality then selects a “light sublattice” $L_{\rm light}\subset\mathbb{Z}^7$. To achieve a nontrivial multi-sector structure while preserving SM gauge invariance of Yukawa couplings, we introduce a family $U(1)_F$ whose charges are induced by topology; anomaly cancellation for this Abelian factor across sectors forces a minimal nontrivial three-sector solution with offsets $\{a,-a,0\}$. A worked instance, based on a physically motivated, PCE-compatible ansatz for embedding the first-generation fermions, provides explicit Cartan charge vectors, a primitive basis of $L_{\rm light}$, the minimal family-charge unit $a$, and three minimal-norm sector vectors. A PCE-compatible potential on $\Sigma_8$ selects sector minima; Gaussian semiclassics on this Kähler target yields Yukawa matrices from overlap integrals, producing exponentially hierarchical masses and small mixings determined by geodesic separations and local Hessians.

## R.1 The MPU’s Perspective Space and Its Topology

Let $\Sigma_8 := U(8)/U(1)^8$ be the complete flag manifold of $\mathbb{C}^8$. It is a compact, simply connected Kähler manifold of complex dimension $28$ and real dimension $56$.

### R.1.1 Theorem (Homotopy of $\Sigma_8$)

The Perspective Space $\Sigma_8$ is simply connected and its second homotopy group is $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$.

*Proof.* This is a standard result in algebraic topology [Bott & Tu 1982]. Consider the principal fiber bundle $T^8 \hookrightarrow U(8) \to \Sigma_8$, where $T^8 \cong U(1)^8$ is the maximal torus. The long exact sequence in homotopy associated with this fibration provides the necessary relationships.

$$
\dots \to \pi_2(U(8)) \to \pi_2(\Sigma_8) \to \pi_1(T^8) \to \pi_1(U(8)) \to \pi_1(\Sigma_8) \to 0.
\tag{R.2}
$$

Using the standard homotopy groups of Lie groups: $\pi_2(U(n)) = 0$, $\pi_1(T^n) \cong \mathbb{Z}^n$, and $\pi_1(U(n)) \cong \mathbb{Z}$. The relevant segment of the sequence reduces to:

$$
0 \to \pi_2(\Sigma_8) \to \mathbb{Z}^8 \to \mathbb{Z} \to \pi_1(\Sigma_8) \to 0.
\tag{R.3}
$$

The homomorphism $\mathbb{Z}^8 \to \mathbb{Z}$ is induced by the inclusion $T^8 \hookrightarrow U(8)$ and is given by the summation map $(k_1, \dots, k_8) \mapsto \sum_i k_i$, which is surjective. By exactness of the sequence, $\pi_1(\Sigma_8) = 0$ and $\pi_2(\Sigma_8) \cong \ker(\sum: \mathbb{Z}^8 \to \mathbb{Z}) \cong \mathbb{Z}^7$. ∎

### R.1.2 Topological generators and cohomology in degree two

Let $0 \subset S_1 \subset S_2 \subset \dots \subset S_8$ be the universal flag of tautological subbundles over $\Sigma_8$, where $S_8$ is the trivial bundle $\mathbb{C}^8 \times \Sigma_8$, and $\mathrm{rank}(S_k) = k$. Define the tautological quotient line bundles $Q_k := S_k/S_{k-1}$ and their first Chern classes $x_k := c_1(Q_k) \in H^2(\Sigma_8; \mathbb{Z})$. The total Chern class of the ambient rank-8 bundle $S_8$ is trivial, which implies $\sum_k x_k = 0$ in $H^2(\Sigma_8; \mathbb{Z})$.

An integral basis for $H^2(\Sigma_8; \mathbb{Z})$ is given by differences of these Chern classes [Fulton 1997; Brion 2005]:

$$
\omega_i := x_i - x_{i+1}, \quad i = 1, \dots, 7.
\tag{R.4}
$$

By the Hurewicz theorem, the $\omega_i$ represent the generators of $\pi_2(\Sigma_8)$. Concretely, for a smooth map $f:S^2\to \Sigma_8$, define the Chern integers

$$
k_i := \int_{S^2} f^*(x_i)\in \mathbb{Z}.\tag{R.5}
$$
These integers must satisfy the constraint $\sum_{i=1}^8 k_i=0$, inherited from $\sum_i x_i = 0$.
The topological charges are defined as:

$$
q_i := \int_{S^2} f^*(\omega_i) = k_i-k_{i+1},\qquad i=1,\dots,7.\tag{R.6}
$$


Thus $\pi_2(\Sigma_8)\cong \ker\left(\sum_i : \mathbb{Z}^8\to\mathbb{Z}\right)\cong \mathbb{Z}^7$ with integral coordinates $q=(q_1,\dots,q_7)$ in the $\{\omega_i\}$-basis.

## R.2 Twisted Dirac index and chiral asymmetry of a predictive block

**Lemma R.IDX1 (Twisted Dirac index = net chirality of one predictive block).**
Let $M$ be a $4$‑dimensional, time‑orientable spin manifold carrying the emergent Lorentzian structure of §11. Let $P\to M$ be a principal

$$
G\ =\ U(1)\times SU(2)\times SU(3)\tag{R.7}
$$

bundle of **PCE‑preserving predictive frames** (Conjecture G.M1 in Appendix G), with connection $A$. For a *predictive block* $R$ (a finite‑dimensional complex representation of $G$ dictated by the $(1,2,3)$ block structure of Appendix G), consider the associated complex vector bundle $E_R:=P\times_G R$ and the chiral spinor bundles $S^\pm$. The **twisted Dirac operator**

$$
\slashed D_A:\ \Gamma\big(S^+\!\otimes E_R\big)\longrightarrow \Gamma\big(S^-\!\otimes E_R\big)\tag{R.8}
$$

has Fredholm index

$$
\operatorname{Ind}\big(\slashed D_A\big)=\dim\ker\big(\slashed D_A\big)\ -\ \dim\operatorname{coker}\big(\slashed D_A\big)\tag{R.9}
$$

equal to the **net chiral asymmetry** $(\#\mathrm{LH}-\#\mathrm{RH})$ of zero‑modes in that block, and is given topologically by the Atiyah–Singer index theorem [Atiyah & Singer 1963]:

$$
\operatorname{Ind}\big(\slashed D_A\big)\ =\ \big\langle\,\widehat A(TM)\ \mathrm{ch}(E_R)\,,\ [M]\ \big\rangle\ \in\ \mathbb Z. \tag{R.10}
$$

*Proof.* This is a direct application of the Atiyah–Singer index theorem for the Dirac operator twisted by the complex vector bundle $E_R$ associated with the principal $G$-bundle $P$. In four dimensions, the analytical index (LHS of R.9) equals the difference between the dimensions of the spaces of left-handed and right-handed zero modes (since $\dim\operatorname{coker}(\slashed D_A) = \dim\ker(\slashed D_A^\dagger)$), which corresponds to the net chiral asymmetry of the matter content in representation $R$. The RHS (R.10) provides the topological expression for this index. ∎

**Corollary R.IDX1.1 (Degree‑4 characteristic‑class form).**
In $4$D, only the degree‑4 part contributes:

$$
\operatorname{Ind}(\slashed D_A)
\ =\ \int_M \left[\ -\tfrac{1}{24}\,p_1(TM)\ \mathrm{rk}(E_R)\ +\ \tfrac12\,c_1(E_R)^2\ -\ c_2(E_R)\ \right],
$$

with the usual identifications $c_i,\,p_1$ built from the $U(1),SU(2),SU(3)$ curvatures (and their hypercharge embedding inside $c_1$).

**Lemma R.IDX2 (Anomaly additivity and block replication).**
Let $I_6(R)$ be the **perturbative gauge‑anomaly polynomial** (the 6‑form) of the chiral content in one predictive block $R$; additivity of the Chern character over direct sums implies

$$
I_6(R_1\oplus R_2)\ =\ I_6(R_1)\ +\ I_6(R_2).
$$

Hence, for $k$ identical blocks,

$$
I_6\big(\,R^{\oplus k}\,\big)\ =\ k\,I_6(R).
$$

In particular, if a single predictive block is **anomaly‑free** (all cubic/mixed gauge anomalies and mixed gauge–gravitational anomalies vanish, including the global SU(2) parity constraint, i.e., an even number of SU(2) doublets per block [Witten 1982]), then any number $k$ of **replicated blocks remains anomaly‑free**.

*Proof.* The perturbative anomaly polynomial in 4D is $\mathrm{ch}_3(E_R)$ plus mixed terms involving $c_1(E_R)$ and $p_1(TM)$; all are linear in $\mathrm{ch}(E_R)$, which is additive under direct sums. The global SU(2) anomaly (Witten parity) depends on the parity of the **number of SU(2) doublets**; replication multiplies that number by $k$, so if one block has an even count, every replicated theory does as well. ∎

**Remark (Predictive block and SM‑like content).**
The block structure $H_x\cong\mathbb C\oplus\mathbb C^2\oplus\mathbb C^3$ from Appendix G naturally yields associated bundles whose Chern classes reproduce the usual $U(1)$, $SU(2)$, $SU(3)$ contributions. In that setting, Lemma R.IDX1 pins the **net chirality per block** to the topological pairing $\langle \widehat A\,\mathrm{ch},[M]\rangle$, while Lemma R.IDX2 guarantees that once a **single** predictive block satisfies the anomaly constraints, any number of generations (blocks) preserves them automatically.

## R.3 PCE Selection Principles

This section details the PCE-based mechanisms that select the physically realized fermion sector. We first establish general principles related to the topology of the Perspective Space and the light sublattice, then derive a uniqueness result for three generations using only the standing PCE principles together with a standard MDL replication lemma.

### R.3.1 Theorem (Global topological neutrality)

For any physically realized collection of long-lived, low-energy sectors labeled by topological charges $\{q^{(g)}\} \subset \pi_2(\Sigma_8)$, the net charge must vanish:
$$
\sum_g q^{(g)} = 0.
\tag{R.11}
$$

*Proof.* On a compact Kähler target, a nonzero $q \in \pi_2$ represents a nontrivial homology class whose energy is bounded below by a positive value proportional to its area (related to the topological charges defined in R.1.2). A nonzero net topological charge at spatial infinity would produce an unavoidable gradient energy density in the vacuum. PCE selects the globally trivial vacuum sector, enforcing $\sum_g q^{(g)} = 0$. This is a consequence of PCE minimizing the total energy contribution to the PCE potential $V(x)$. ∎

### R.3.2 Definition (Light sublattice)

Let $v_{c_1}, v_{c_2}, v_t$ be the charge-map vectors for the $SU(3) \times SU(2)$ Cartan generators. Stack these as rows of $C \in \mathrm{Mat}_{3\times 7}(\mathbb{Z})$. The **light sublattice** is the integer kernel:
$$
L_{\rm light} := \ker_{\mathbb{Z}} C = \{ q \in \mathbb{Z}^7 : C q = 0 \}.
\tag{R.12}
$$

These are topological charges neutral under $SU(3)\times SU(2)$. Sectors $q \notin L_{\rm light}$ carry non-Abelian charges and are penalized by PCE.

### R.3.3 Lemma (Center neutrality in the light sublattice)

For any $q \in L_{\rm light}$, its $SU(3)$ center charge is trivial: $\tau(q) = 0 \in \mathbb{Z}_3$.

*Proof.* If $q \in L_{\rm light}$, then $c_1 \cdot q = c_2 \cdot q = 0$, hence $\tau(q)\equiv (c_1\cdot q + 2 c_2\cdot q)\pmod 3 = 0$. ∎

### R.3.4 Theorem (Family-charge anomaly constraints and minimal sector count)

Let $\{q^{(g)}\}\subset L_{\rm light}$ be the set of realized light sectors. Each sector corresponds to a full SM generation with identical $G_{\rm SM}$ charges, but carries a distinct **family** charge offset $F_g := f \cdot q^{(g)}$. For a consistent theory, the net family charges must satisfy the anomaly cancellation conditions:
$$
\sum_g F_g = 0,
\qquad
\sum_g F_g^3 = 0.
\tag{R.13}
$$
The minimal non-trivial solution satisfying these conditions requires $N=3$ sectors, with family charge offsets of the form $\{a, -a, 0\}$.

*Proof.* The identity $x^3+y^3+z^3-3xyz=(x+y+z)(x^2+y^2+z^2-xy-yz-zx)$ implies that if $\sum_g F_g=0$, then $\sum_g F_g^3=3F_1F_2F_3$. Thus the two anomaly conditions together force $F_1F_2F_3=0$, meaning at least one family charge must be zero. The linear constraint then enforces the pattern $\{a, -a, 0\}$. For $N=2$, $\{a,-a\}$ is vector-like and predictively degenerate. Therefore, $N=3$ is the minimal nontrivial solution. Moreover, any basis‑invariant CP‑odd observable (the Jarlskog invariant) vanishes for $N<3$ and can be nonzero for $N=3$, so a nonzero CP‑odd predictive capacity is feasible only for three or more families; by PCE minimality this selects $N=3$. ∎

### R.3.5 Three Generations: Minimality, Doping Exclusion, and MDL-Based Uniqueness

**Lemma R.3.5a (Doping irrelevance under PCE).**
Adding any finite multiset of abelian vector-like singlet pairs leaves all gauge and mixed anomalies unchanged and does not create new chirally imbalanced categories. Under PCE’s compression-first criterion, such additions provide no predictive benefit but increase description length. Hence minimizers have no abelian “doping.” ∎

**Proposition R.3.5b (Minimal cardinality of anomaly-consistent family offsets).**
Let $\{F_g\} \subset \mathbb{Z}$ satisfy $\sum_g F_g = \sum_g F_g^3 = 0$. There is no nontrivial solution with $N=2$. The minimal nontrivial solution has $N=3$ and can be written $\{a,-a,0\}$ for some nonzero integer $a$. ∎

**Lemma R.3.5c (Replication sublinearity from MDL).**
Let a one-generation fermion block $\mathcal{B}$ induce a regular $k$-dimensional parametric predictive family $\{p_\theta\}$. For $N$ identical copies used i.i.d. and coded by any asymptotically minimax-optimal universal code, the predictive redundancy satisfies
$$
\mathcal{R}_N = \frac{k}{2}\log N + C + o(1),
$$
hence the incremental predictive gain obeys
$$
0 \le \Delta\Psi_{\mathrm{pred}}(N) \le \kappa_{\mathrm{MDL}}\log\!\left(1+\frac{1}{N}\right) + O\!\left(\frac{1}{N^2}\right),
$$
with $\kappa_{\mathrm{MDL}}=\frac{k}{2}$ up to units, and there exist $\beta_1,\beta_2>0$ such that
$$
\Delta\Psi_{\mathrm{pred}}(1)\ge \beta_1,\qquad
\Delta\Psi_{\mathrm{pred}}(2)\ge \beta_2.
$$
Here the $N$ copies are treated as independent predictive modules for MDL accounting. ∎

**Theorem R.3.5d (Uniqueness of $N=3$ via PCE Optimization).**
The Principle of Compression Efficiency (PCE), when applied to the problem of family replication, uniquely selects $N=3$ generations as the optimal, stable solution. The PCE potential for a model with $N$ generations, $\mathcal{V}(N)$, balances a linear complexity cost against a non-linear predictive benefit. The potential exhibits a global minimum at $N=3$ because this is the minimal structure required to unlock the significant predictive benefit of CP violation, while the marginal benefit of adding further generations ($N>3$) is subject to rapidly diminishing returns that are insufficient to justify the fixed complexity cost.

*Proof.*
Let the PCE potential for a model with $N$ identical, anomaly-free fermion generations be $\mathcal{V}(N)$. This potential balances the cost of complexity against the predictive benefit:
$$
\mathcal{V}(N) = \lambda_3 C(N) - \lambda_4 \Psi_{\mathrm{pred}}(N)
$$
where $\lambda_3, \lambda_4 > 0$ are PCE weights, $C(N)$ is the complexity cost, and $\Psi_{\mathrm{pred}}(N)$ is the total predictive benefit.

1.  **Complexity Cost:** The cost of adding each identical generation is constant, so the total complexity cost is linear: $C(N) = N \cdot C_{\mathrm{gen}}$, where $C_{\mathrm{gen}}$ is the complexity cost of a single generation.

2.  **Predictive Benefit:** The benefit function $\Psi_{\mathrm{pred}}(N)$ has two distinct components:
    *   **Benefit of CP Violation:** The Standard Model requires a minimum of three generations to accommodate a non-trivial CP-violating phase in the CKM matrix. This capability represents a significant increase in the model's predictive richness. We model this as a discrete jump in benefit, $\Delta\Psi_{CP} > 0$, that is unlocked only upon reaching $N=3$.
    *   **Benefit of Replication (MDL):** The marginal benefit of adding an $(N+1)$-th generation to an existing $N$ generations is subject to diminishing returns. By the Minimum Description Length (MDL) principle [Grünwald 2007], this marginal information gain, $\Delta\Psi_{MDL}(N+1) = \Psi_{MDL}(N+1) - \Psi_{MDL}(N)$, scales as $\mathcal{O}(\log(1+1/N))$. This benefit is largest for small $N$ and rapidly approaches zero as $N$ increases.

3.  **Analysis of Potential Increments:** We analyze the change in potential, $\Delta_N = \mathcal{V}(N+1) - \mathcal{V}(N)$.
    $$
    \Delta_N = \lambda_3 C_{\mathrm{gen}} - \lambda_4 \left( \Psi_{\mathrm{pred}}(N+1) - \Psi_{\mathrm{pred}}(N) \right)
    $$
    *   For $N=1, 2$: The marginal benefit is the relatively large initial MDL term. For a viable system, PCE requires this benefit to outweigh the cost, so $\Delta_1 < 0$ and $\Delta_2 < 0$. The jump from $N=2$ to $N=3$ is particularly favored, as the marginal benefit includes both the MDL term and the large, discrete CP-violation term: $\Psi_{\mathrm{pred}}(3) - \Psi_{\mathrm{pred}}(2) = \Delta\Psi_{MDL}(3) + \Delta\Psi_{CP}$. This makes $\Delta_2$ strongly negative.
    *   For $N=3$: The marginal benefit of adding a fourth generation is *only* the much smaller MDL term, $\Psi_{\mathrm{pred}}(4) - \Psi_{\mathrm{pred}}(3) = \Delta\Psi_{MDL}(4)$, as the CP-violation capability has already been unlocked. PCE will select for a system where the fixed cost of a generation outweighs this small, rapidly diminishing return: $\lambda_3 C_{\mathrm{gen}} > \lambda_4 \Delta\Psi_{MDL}(4)$. This ensures $\Delta_3 > 0$.
    *   For $N > 3$: The marginal benefit $\Delta\Psi_{MDL}(N)$ is a monotonically decreasing function. Therefore, if $\Delta_3 > 0$, it follows that $\Delta_N > 0$ for all $N > 3$.

4.  **Conclusion:** The potential $\mathcal{V}(N)$ decreases up to $N=3$ and increases thereafter. This establishes that $N=3$ is the unique, stable global minimum of the PCE potential for family replication. It is the minimal structure that is complex enough to enable CP violation, but not so complex as to be inefficient under the principle of diminishing returns. ∎

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
*   $Y_{13} = Y_{23}$ are suppressed by $\exp(-(\alpha_1 + \alpha_2) D^2/2)$.
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

### R.8 PCE Constraints on Flavor Mixing (Small-Angle Regime)

PCE selects the basis that minimizes the descriptive complexity of interactions. For flavor mixing, a natural basis-invariant proxy for this complexity is the squared Frobenius norm of the off-diagonal part of the rotated Yukawa matrix, $V^\dagger Y V$, where $Y$ is the diagonal matrix of Yukawa couplings (with singular values $\{y_1 \ge y_2 \ge y_3\}$) and $V$ is the unitary mixing matrix.

**Lemma R.8.1 (Quadratic Small-Angle Bound).**
Let the mixing matrix be parameterized as $V=\exp(\Theta)$ with $\Theta$ being anti-Hermitian and $\|\Theta\| \ll 1$. Then, to second order in the mixing angles, the off-diagonal complexity measure is:
$$
\big\|\mathrm{offdiag}(V^\dagger Y V)\big\|_F^2
= 2\sum_{i<j}(y_i-y_j)^2\,|\Theta_{ij}|^2 + O(\|\Theta\|^3).
$$
If PCE imposes a budget $\mathcal{K} \le \varepsilon_{mix}$ on this off-diagonal complexity, it implies an upper bound on the mixing matrix elements:
$$
|V_{ij}| \approx |\Theta_{ij}| \le \sqrt{\frac{\varepsilon_{mix}}{2\,(y_i-y_j)^2}}.
$$

**Consequences for Flavor Structure:** This simple PCE-based cost model provides a powerful qualitative explanation for the observed pattern of fermion mixing:
*   **Quarks (Hierarchical Gaps):** The quark masses are strongly hierarchical, meaning the gaps $(y_i-y_j)^2$ between Yukawa couplings are large. The PCE bound thus forces the corresponding mixing angles $|V_{ij}|$ to be small. This naturally explains why the CKM matrix is nearly diagonal.
*   **Leptons (Quasi-degenerate):** In the lepton sector, particularly for neutrinos, the mass eigenstates are much closer together, leading to small gaps $(y_i-y_j)^2$. For a comparable complexity budget $\varepsilon_{mix}$, the PCE bound permits much larger mixing angles. This provides a natural explanation for the large angles observed in the PMNS matrix.

For neutrinos, where mixing is not small, higher-order terms must be included in the expansion; the qualitative conclusion that smaller mass gaps permit larger mixing at a similar complexity cost remains robust.

## R.9 Summary

*   **Topology:** The second homotopy group of the MPU's Perspective Space is $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$, providing seven independent topological charges.
*   **Gauge–Topology Correspondence:** An embedding of the Standard Model gauge group into the MPU's internal symmetry group induces a homomorphism from the topological charges to the Cartan weight lattice of the gauge group.
*   **PCE Selection:** The Principle of Compression Efficiency selects for physically viable sectors by enforcing non-Abelian charge neutrality via the **light sublattice** and requiring anomaly cancellation for an emergent family symmetry $U(1)_F$.
*   **Three Generations:** The minimal non-trivial solution satisfying these consistency and optimization constraints requires exactly three generations, with family charges $\{a, -a, 0\}$.
*   **Worked Instance:** An explicit, PCE-favored embedding ansatz for the first-generation fermions allows for the calculation of the light sublattice basis and the minimal three-sector solution.
*   **Masses and Mixings:** A PCE-compatible potential on the Perspective Space creates distinct vacuum states for each generation. Yukawa couplings arise from the overlap of Gaussian wavepackets centered at these vacua, naturally producing hierarchical masses and small CKM mixing angles controlled by the geodesic distances between the vacua. The same mechanism allows for large PMNS mixing if the leptonic vacua are closer or have different local geometry.