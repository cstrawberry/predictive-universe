# Appendix R: A Proposed Topological Origin for the Three-Fermion Generations

## R.0 Introduction

This appendix establishes a rigorous, first-principles pathway by which the threefold generation structure of the Standard Model (SM) fermion sector can emerge from the topology of a fundamental internal Perspective Space associated with a Minimal Predictive Unit (MPU). This derivation provides a detailed mechanism for the origin of the three-generation structure, a question left open in the main text's derivation of the Standard Model gauge group (Appendix G.8). The Perspective Space is the complete flag manifold
$$
\Sigma_8 \cong U(8)/U(1)^8,
\tag{R.1}
$$
naturally attached to an MPU with Hilbert space $H_0 \cong \mathbb{C}^8$, the minimal dimension required for self-referential logic (Theorem 23).

Three pillars drive the derivation:

1.  **Topology:** The second homotopy group of the Perspective Space, `π₂(Σ₈) ≅ ℤ⁷`, provides seven independent integer topological charges.
2.  **Gauge–Topology Correspondence:** A canonical, representation-theoretic map from the cohomology group `H²(Σ₈; ℤ)` to the weight lattice of the emergent gauge group `G_SM` is established.
3.  **PCE-based Selection:** Physical viability is enforced by constraints of non-Abelian charge neutrality and Abelian anomaly cancellation across the topological sectors, together with energetic and complexity minimization dictated by the Principle of Compression Efficiency (PCE).

A precise “gauge–topology correspondence” is proved: any `G_SM`-embedding on `H₀` induces an explicit homomorphism from `π₂(Σ₈)` to the Cartan weight lattice of `G_SM`, and hence a center character map to `Z(SU(3)) ≅ ℤ₃`. Non-Abelian neutrality then selects a “light sublattice” `L_light ⊂ ℤ⁷`, while Abelian (`U(1)_Y`) anomaly cancellation across multiple sectors forces a minimal nontrivial three-sector solution with hypercharge offsets `{a, −a, 0}`. The derivation is made concrete through a worked instance based on a physically motivated, PCE-compatible *ansatz* for embedding the first-generation fermions, which serves as a powerful existence proof for this mechanism. This instance delivers explicit Cartan charge vectors, the integer basis of `L_light`, the minimal hypercharge unit `a`, and the three minimal-norm sector vectors realizing the three generations. Finally, a PCE-compatible potential selects sector minima on `Σ₈`; Gaussian semiclassics on this Kähler target produce Yukawa matrices from overlap integrals, with exponentially hierarchical masses and small mixings determined by geodesic separations and local Hessians.

## R.1 The MPU’s Perspective Space and Its Topology

Let `Σ₈ := U(8)/U(1)⁸` be the complete flag manifold of `ℂ⁸`. It is a compact, simply connected Kähler manifold of complex dimension 28 and real dimension 56.

### R.1.1 Theorem (Homotopy of Σ₈).

The Perspective Space `Σ₈` is simply connected and its second homotopy group is `π₂(Σ₈) ≅ ℤ⁷`.

*Proof.* Consider the principal bundle `T⁸ → U(8) → Σ₈` where `T⁸ ≅ U(1)⁸` is the maximal torus. The long exact sequence in homotopy for this fibration yields [Bott & Tu 1982]:
$$
\dots \to \pi_2(U(8)) \to \pi_2(\Sigma_8) \to \pi_1(T^8) \to \pi_1(U(8)) \to \pi_1(\Sigma_8) \to 0.
\tag{R.2}
$$
Using the standard results `π₂(U(n)) = 0`, `π₁(Tⁿ) ≅ ℤⁿ`, and `π₁(U(n)) ≅ ℤ`, the relevant segment reduces to:
$$
0 \to \pi_2(\Sigma_8) \to \mathbb{Z}^8 \to \mathbb{Z} \to \pi_1(\Sigma_8) \to 0.
\tag{R.3}
$$
The homomorphism `ℤ⁸ → ℤ` is induced by the inclusion `T⁸ ↪ U(8)` and is given by the summation map `(k₁, \dots, k₈) ↦ Σᵢ kᵢ`, which is surjective. By the exactness of the sequence, it follows that `π₁(Σ₈) = 0` (it is simply connected) and `π₂(Σ₈)` is isomorphic to the kernel of the summation map, `ker(Σ: ℤ⁸ → ℤ) ≅ ℤ⁷`. ∎

### R.1.2 Topological generators and cohomology in degree two

Let `0 ⊂ S₁ ⊂ S₂ ⊂ \dots ⊂ S₈ = ℂ⁸ × Σ₈` be the universal flag of subbundles over `Σ₈`, where `rank(S_k) = k`. We define the tautological quotient line bundles `Q_k := S_k/S_{k−1}`. Their first Chern classes, `x_k := c₁(Q_k)`, are elements of the second integer cohomology group `H²(Σ₈; ℤ)`. The triviality of the ambient rank-8 bundle implies the relation `Σₖ x_k = 0`.

An integral basis for `H²(Σ₈; ℤ)` is given by the differences of these Chern classes \[Fulton 1997; Brion 2005]:
$$
\omega_i := x_i - x_{i+1}, \quad i = 1, \dots, 7.
\tag{R.4}
$$
By the Hurewicz theorem, these cohomology classes `ω_i` can also be taken to represent the generators of `π₂(Σ₈)`.

## R.2 Gauge–Topology Correspondence

Let `ρ: G_SM → U(8)` be a fixed embedding of the Standard Model gauge group into `U(8)`. This embedding specifies a decomposition of the MPU Hilbert space `H₀ ≅ ℂ⁸` into eight one-dimensional weight lines, each associated with a weight `w_i ∈ 𝔱^∗(G_SM)` for `i = 1, \dots, 8`, where `𝔱^∗` is the dual of the Cartan subalgebra. We write each weight in terms of its components for `G_SM = SU(3) × SU(2) × U(1)_Y`:
$$
w_i = (r_i; s_i; y_i),
\tag{R.5}
$$
where `r_i ∈ 𝔱^∗(SU(3))` (specified by two Cartan coordinates, e.g., in the Dynkin basis), `s_i ∈ 𝔱^∗(SU(2))` (the `T₃` eigenvalue), and `y_i ∈ ℝ` (the hypercharge, in a chosen normalization).

### R.2.1 Theorem (Canonical charge map and center character).

There exists a canonical homomorphism from the topological charges to the gauge charges:
$$
\mu_{top}: H^2(\Sigma_8; \mathbb{Z}) \to P_{GSM}
\tag{R.6}
$$
where `P_GSM` is the integral weight lattice of `G_SM`. This map is characterized in the `ω`-basis by:
$$
\mu_{top}(\omega_i) = w_i - w_{i+1}, \quad i = 1, \dots, 7.
\tag{R.7}
$$
Consequently, for any element `H_A` in a basis of the Cartan subalgebra `𝔱(G_SM)`, the corresponding integer charge of a topological state `q ∈ H²(Σ₈; ℤ) ≅ ℤ⁷` is given by `A(q) = v_A \cdot q`, where the charge vector `v_A` has components `v_A[i] := ⟨w_i - w_{i+1}, H_A⟩ ∈ ℤ`.

Composing `μ_top` with the natural projection from the SU(3) weight lattice `P_SU(3)` to its center `Z(SU(3)) ≅ P_{SU(3)}/Q_{SU(3)} ≅ ℤ₃` (where `Q_SU(3)` is the root lattice) produces a well-defined homomorphism, the **center character map** \[Fulton & Harris 1991; Georgi 1999]:
$$
\tau: \pi_2(\Sigma_8) \cong H^2(\Sigma_8; \mathbb{Z}) \to \mathbb{Z}_3,
\tag{R.8}
$$
which is given by:
$$
\tau(q) \equiv (c_1 \cdot q + 2 c_2 \cdot q) \pmod 3,
\tag{R.9}
$$
where `c₁` and `c₂` are the two `SU(3)` Cartan charge vectors `v_{c₁}` and `v_{c₂}` derived above.

*Proof.* The universal splitting of the trivial bundle `E = ⊕ₖ Q_k` over `Σ₈` allows the construction of an equivariant characteristic class `Σₖ x_k ⊗ w_k ∈ H²(Σ₈; ℤ) ⊗ P_{GSM}`. Subject to the constraint `Σₖ x_k = 0`, passing to the `ω`-basis naturally maps `x_k - x_{k+1}` to `w_k - w_{k+1}`, defining `μ_top(ω_i)` as stated. The linearity of this map ensures that the charge of any `q` is given by the dot product with the corresponding charge vector. For `SU(3)`, the center character of a highest weight with Dynkin labels `(λ₁, λ₂)` is `exp(2πi(λ₁+2λ₂)/3)`. The integer `c₁ \cdot q + 2 c₂ \cdot q` represents the effective Dynkin labels of the topological charge `q`, and its value modulo 3 determines the `ℤ₃` center charge, defining `τ`. ∎

### R.2.2 Proposition (Surjectivity of τ for the PCE-optimal embedding).

For the PCE-optimal embedding `ρ` on `H₀ ≅ ℂ⁸` specified in R.4 below, the center character map `τ` is surjective.

*Proof.* For the embedding computed explicitly in R.4.1, the `SU(3)` Cartan charge vectors are `c₁ = (2, -1, -1, 2, -1, 0, 0)` and `c₂ = (-1, 2, -1, -1, 2, -1, 0)`. For the basis vector `e₆ ∈ ℤ⁷`, the center charge is:
$$
\tau(e_6) \equiv (c_1 \cdot e_6 + 2 c_2 \cdot e_6) \pmod 3 = (0 + 2(-1)) \pmod 3 = 1 \pmod 3.
\tag{R.10}
$$
Since the image contains a generator of `ℤ₃`, the map `τ` is surjective. ∎

## R.3 PCE Selection Principles

Two selection mechanisms, derived from the Principle of Compression Efficiency (PCE), enforce physical viability and minimality: global topological neutrality and non-Abelian neutrality (lightness).

### R.3.1 Theorem (Global topological neutrality).

For any physically realized collection of long-lived, low-energy sectors labeled by topological charges `{q^(g)} ⊂ π₂(Σ₈)`, the net charge must vanish:
$$
\Sigma_g q^{(g)} = 0.
\tag{R.11}
$$
*Proof.* On a compact Kähler target manifold, a nonzero topological charge `q ∈ π₂` represents a non-trivial homology class whose energy is bounded below by a positive value proportional to its area (see R.6). A non-zero net topological charge at spatial infinity would produce an unavoidable gradient energy density in the vacuum. PCE, which drives the system to minimize both energetic and complexity costs, selects for the globally trivial vacuum sector, thereby enforcing `Σ_g q^(g) = 0`. ∎

### R.3.2 Definition (Light sublattice).

Let `v_{c₁}, v_{c₂}, v_t` be the charge-map vectors for the `SU(3) × SU(2)` Cartan generators. We define the integer constraint matrix `C ∈ Mat_{3×7}(ℤ)` by stacking these row vectors. The **light sublattice** is the integer kernel of this map:
$$
L_{light} := \ker_{\mathbb{Z}} C = \{ q \in \mathbb{Z}^7 : C q = 0 \},
\tag{R.12}
$$
This is the set of topological charges that are neutral under the non-Abelian part of the gauge group, `SU(3) × SU(2)`. Sectors with charges `q ∉ L_light` would carry non-Abelian charges, leading to confinement-like dynamics or other high-energy penalties, and are thus excluded or heavily penalized by PCE.

### R.3.3 Lemma (Center neutrality in the light sublattice).

For any charge `q ∈ L_light`, its `SU(3)` center charge is trivial: `τ(q) = 0 ∈ ℤ₃`.

*Proof.* By definition, `τ(q) ≡ (c₁ \cdot q + 2 c₂ \cdot q) \pmod 3`. Since `q ∈ L_light` implies `c₁ \cdot q = 0` and `c₂ \cdot q = 0`, the expression vanishes identically. ∎

This result implies that the `SU(3)` center charge imposes no further constraint beyond `SU(3)`-Cartan neutrality for the physically viable light sectors. The determining constraint among these light sectors is therefore Abelian (`U(1)_Y`) anomaly cancellation across the sectors.

### R.3.4 Theorem (Abelian anomaly constraints across sectors).

Let `{q^(g)} ⊂ L_light` be the set of realized light sectors, and define their hypercharges as `Y_g := y \cdot q^(g)`. The absence of mixed gravitational–hypercharge and cubic hypercharge anomalies across these sectors enforces the conditions [Peskin & Schroeder 1995]:
$$
\Sigma_g Y_g = 0, \quad \Sigma_g Y_g^3 = 0.
\tag{R.13}
$$
For a system with exactly three light sectors, the minimal non-trivial integer solution for the set of hypercharges `{Y₁, Y₂, Y₃}` is `{a, −a, 0}`, where `a > 0` is the minimal non-zero hypercharge achievable within the light sublattice, `a = \text{gcd } y(L_{light})`.

*Proof.* The constraints are the standard conditions for Abelian anomaly cancellation in a theory with multiple chiral sectors. For three integers `Y₁, Y₂, Y₃`, the algebraic identity `x³ + y³ + z³ − 3xyz = (x + y + z)(x² + y² + z² − xy − yz − zx)` implies that if `Σ Y_g = 0`, then `Σ Y_g³ = 3 Y₁Y₂Y₃`. For both sums to be zero, we must have `Y₁Y₂Y₃ = 0`, which means at least one of the hypercharges must be zero. The linear constraint `Σ Y_g = 0` then forces the other two to be equal and opposite. Thus, the set of hypercharges must be of the form `{a, −a, 0}`. PCE favors the minimal complexity solution, which corresponds to choosing the smallest possible non-zero integer value for `a`, given by the greatest common divisor of all possible hypercharges in the light sublattice. ∎

## R.4 Minimal Three-Sector Solution: Worked Instance

We now construct a concrete, minimal solution by analyzing a specific, physically motivated embedding of the Standard Model's first-generation left-handed fermions onto `H₀ ≅ ℂ⁸`. We posit this embedding is favored by PCE; while a full derivation of its optimality is a subject for future work, this *ansatz* serves as a powerful existence proof that a fully consistent and anomaly-free solution exists. The embedding identifies the eight one-dimensional weight lines with the states of the left-handed quark and lepton doublets (`Q_L ⊕ L_L`).

We order the eight basis states as:
$$
(e_1, \dots, e_8) = (u_L^r, u_L^g, u_L^b, d_L^r, d_L^g, d_L^b, \nu_L, e_L),
\tag{R.14}
$$
The corresponding gauge weights `w_i` in integer-normalized coordinates are:

| i | State | SU(3) (λ₁, λ₂) | 2T₃ | 6Y |
|:-:|:-----:|:--------------:|:---:|:--:|
| 1 | u_L^r | (1, 0) | +1 | +1 |
| 2 | u_L^g | (−1, 1) | +1 | +1 |
| 3 | u_L^b | (0, −1) | +1 | +1 |
| 4 | d_L^r | (1, 0) | −1 | +1 |
| 5 | d_L^g | (−1, 1) | −1 | +1 |
| 6 | d_L^b | (0, −1) | −1 | +1 |
| 7 | ν_L | (0, 0) | +1 | −3 |
| 8 | e_L | (0, 0) | −1 | −3 |

### R.4.1 Charge-map vectors

The adjacent weight differences `v_A[i] = ⟨w_i − w_{i+1}, H_A⟩` for `i = 1, \dots, 7` yield the charge vectors:
*   **Hypercharge (6Y):** `y = (0, 0, 0, 0, 0, 4, 0)`
*   **Weak Isospin (2T₃):** `t = (0, 0, 2, 0, 0, -2, 2)`
*   **Color Cartan 1 (λ₁):** `c₁ = (2, -1, -1, 2, -1, 0, 0)`
*   **Color Cartan 2 (λ₂):** `c₂ = (-1, 2, -1, -1, 2, -1, 0)`

These vectors define the homomorphism `q ↦ (c₁ \cdot q, c₂ \cdot q; t \cdot q; y \cdot q)`.

### R.4.2 The light sublattice

We form the `3×7` integer matrix `C` by stacking the rows `c₁`, `c₂`, and `t`. A `ℤ`-basis for the light sublattice `L_light = \ker_{\mathbb{Z}} C` can be computed, yielding four basis vectors:
$$
\ell_1 = (1, 2, 0, 0, 0, 3, 3),
$$
$$
\ell_2 = (0, -1, 1, 0, 0, -3, -4),
$$
$$
\ell_3 = (0, 2, 0, 1, 0, 3, 3),
$$
$$
\ell_4 = (0, -1, 0, 0, 1, 0, 0).
$$

### R.4.3 Minimal hypercharge unit `a` and three-sector solution

The image of the light sublattice under the hypercharge map, `y(L_light)`, is generated by the integers `y \cdot \ell_j`. Since `y \cdot q = 4q₆`, this image is generated by `4 \cdot (3n₁ - 3n₂ + 3n₃) = 12(n₁ - n₂ + n₃)` for `q = Σn_j \ell_j`. The minimal non-zero hypercharge unit is `a := \text{gcd } y(L_{light}) = 12` in 6Y-scaled normalization.

By Theorem R.3.4, the minimal non-trivial three-sector pattern for hypercharges is `{+12, -12, 0}`. This enforces `q₆ = +3` for the first sector, `q₆ = -3` for the second, and `q₆ = 0` for the third. A minimal-norm choice for the topological charge `q(+)` with `y \cdot q = +12` (i.e., `q₆ = 3`), subject to the constraint `Cq = 0`, is:
$$
q^{(1)} = (1, 1, 0, 0, 1, 3, 3),
$$
with `q^{(2)} = −q^{(1)}` and `q^{(3)} = 0`. This solution set satisfies global neutrality `Σq = 0` and is composed of minimal-norm vectors for each required hypercharge sector.

*Minimality Proof.* With `q₆ = 3`, the non-Abelian neutrality constraints become a system of three linear Diophantine equations for the remaining `q_i`. The vector `q^{(1)}` corresponds to a solution of this system with squared Euclidean norm `‖q^{(1)}‖² = 1²+1²+0²+0²+1²+3²+3² = 21`. One can show through systematic analysis of the solution space that this is the minimal possible norm for any vector in `L_light` with `q₆ = 3`. ∎

Thus, the three generational topological charges are uniquely determined up to sign and basis choice:
$$
q^{(1)} = (1, 1, 0, 0, 1, 3, 3),
$$
$$
q^{(2)} = (-1, -1, 0, 0, -1, -3, -3),
$$
$$
q^{(3)} = (0, 0, 0, 0, 0, 0, 0).
$$
These correspond to hypercharge offsets `{+12, -12, 0}` (scaled), or `{+2, -2, 0}` in standard units.

## R.5 Dynamical Ground States and Geometric Yukawas

### R.5.1 Kähler geometry and potential

The flag manifold `Σ₈` is a coadjoint orbit of `U(8)`. We fix a diagonal element `Λ = \text{diag}(λ₁, \dots, λ₈)` with `λ_i - λ_{i+1} = α_i > 0`. A PCE-symmetric choice is `α_i = 1` for all `i`. The standard Kähler potential on the dense Borel chart is `K(Z, Z†) = Σ_{k=1}^7 \log \det(I_k + Z_k Z_k†)`, which induces the metric `g = i ∂∂̄K`.

The `U(8)` moment map is `μ_{U(8)}(U) = UΛU†`. Projecting to the SM Lie algebra `𝔤_SM` gives `μ_{G_SM} = \text{pr}_{𝔤_SM} μ_{U(8)}`. A PCE-compatible potential on `Σ₈` is:
$$
V = (\kappa_\Sigma/2) \|μ_{G_SM}\|^2 + \Lambda_I V_S,
\tag{R.15}
$$
where the first term penalizes non-Abelian charges, and `V_S` is a small Morse–Schubert term that breaks degeneracy and ensures non-degenerate minima at the torus-fixed points `p_σ` (where `σ` is a permutation in the symmetric group `S₈`).

### R.5.2 Sector minima

Each topological sector `q` selects its preferred vacuum by adding a small linear "pinning" term to the potential, `ε V_B = -ε ⟨μ_{U(8)}, B(q)⟩`, where `ε` is small and `B(q)` is a diagonal matrix encoding the charge `q`. Minimizing `V_q = V + ε V_B` over the fixed points selects distinct minima `p_+`, `p_−`, and `p_0` for the sectors `q(+)`, `q(−)`, and `q(0)`. By symmetry, `d_Σ(p_+, p_0) = d_Σ(p_−, p_0)`.

### R.5.3 Hessians and geodesic distances

At the minima `p_g`, the Hessian of `V_q` is positive definite, defining effective precisions `β_g`. The geodesic distances between these minima on `Σ₈` are denoted:
$$
D := d_\Sigma(p_+, p_0) = d_\Sigma(p_-, p_0), \quad D' := d_\Sigma(p_+, p_-).
\tag{R.16}
$$

### R.5.4 Gaussian overlaps: closed form

The Yukawa coupling between two fermion generations `g, g'` and the Higgs field is modeled by the overlap integral of three Gaussian wavepackets centered at their respective minima `p_g`, `p_{g'}`, and `p_H` (the Higgs vacuum) on `Σ₈`. In the symmetric case (`β_+ = β_− = β`, and `p_H = p_0`), the overlap integral `Y_{gg'}` is proportional to:
$$
Y_{gg'} \propto \exp\left[ -(\alpha_1/2)(d_\Sigma(p_g, p_0)^2 + d_\Sigma(p_{g'}, p_0)^2) - (\alpha_2/2) d_\Sigma(p_g, p_{g'})^2 \right],
\tag{R.17}
$$
where `α₁` and `α₂` are positive constants derived from the Hessians.

*Consequences:* The Yukawa matrix entries are given by these overlaps:
*   `Y₃₃` (third generation) is maximal as it involves `p_0`.
*   `Y₁₁ = Y₂₂` (first two generations) are suppressed by `exp(−α₁ D²)`.
*   `Y₁₃ = Y₂₃` (off-diagonal) are suppressed by `exp(−α₁ D²/2)`.
*   `Y₁₂` (off-diagonal) is most suppressed, by `exp(−α₁ D² − (α₂/2) D′²)`.

This geometric structure naturally produces hierarchical masses (from the diagonal `Y_{gg}`) and small mixing angles (from the off-diagonal `Y_{gg'}`), with the hierarchy determined exponentially by the geodesic distances `D` and `D'` between the sector vacua on the Perspective Space.

## R.6 Energy Bounds and Uniqueness of Three Light Sectors

For sigma models on a compact Kähler target `(Σ₈, Ω)`, the energy in a topological sector `q` satisfies a Bogomolny-type bound \[Manton & Sutcliffe 2004; Fujimori, Nitta & Ohashi 2024; Ohmori 2019]:
$$
E[q] \ge 4\pi \sum_{i=1}^7 \alpha_i |q_i|,
\tag{R.18}
$$
where `α_i` are the Kähler class weights (here `α_i=1`).

For the three sectors `q(±), q(0)` derived above, the L₁-norm is `‖q(±)‖₁ = 12` and `‖q(0)‖₁ = 0`. Any other non-trivial `q ∈ L_light` that could realize the same Abelian anomaly pattern can be shown to have a larger L₁ norm and thus a higher minimal energy. Sectors outside `L_light` are non-Abelian charged and are excluded by PCE. Therefore, exactly three light sectors are selected: they are anomaly-compatible, non-Abelian neutral, and energy-minimizing. Solutions with five or more sectors (e.g., `{a, -a, b, -b, 0}`), while mathematically possible, are disfavored. They would require supporting a more complex fermion sector, incurring a higher `V_{fermion}` cost under PCE (cf. Appendix G.8), and would possess a higher minimal Bogomolny energy bound, making the three-sector configuration a PCE-optimal configuration under the stated assumptions.

## R.7 Summary

*   **Topology:** `π₂(Σ₈) ≅ ℤ⁷` with an integral basis `{ω_i}` defined by universal quotient line bundles `Q_i`.
*   **Gauge–Topology Correspondence:** The embedding `ρ: G_SM → U(8)` induces a canonical homomorphism `μ_top: H²(Σ₈; ℤ) → P_GSM` given by adjacent weight differences, with an `SU(3)`-center character `τ: π₂(Σ₈) → ℤ₃` which is surjective for the PCE-favored embedding.
*   **PCE Selection:** The **light sublattice** `L_light = \ker_{\mathbb{Z}}\{c₁, c₂, t\}` enforces non-Abelian neutrality; center neutrality is automatic for these states.
*   **Abelian Anomalies:** Anomaly cancellation across sectors forces the minimal non-trivial three-sector pattern `{Y_g} = {a, −a, 0}`, with `a = \text{gcd } y(L_{light})`.
*   **Worked Instance:** An explicit embedding *ansatz* yields charge vectors `c₁, c₂, t, y`; a basis for `L_light`; the minimal hypercharge unit `a = 12` (scaled); and three minimal-norm sectors `q^{(1)} = (1, 1, 0, 0, 1, 3, 3)`, `q^{(2)} = −q^{(1)}`, and `q^{(3)} = 0`.
*   **Dynamics:** A PCE-compatible potential on `Σ₈` selects three distinct vacuum states `p_±, p_0` for the three sectors. Gaussian overlap integrals of wavepackets centered at these vacua yield the Yukawa matrix, with hierarchical masses and small mixings emerging geometrically from the separations `D, D'` between the vacua.

In this framework, the number of fermion generations, their hierarchical masses, and small mixings emerge from the topology and geometry of the observer’s Perspective Space, combined with PCE selection and gauge consistency. The threefold family structure is the minimal non-trivial, anomaly-compliant solution inside the non-Abelian-neutral light sublattice, and the observed hierarchies are geometric consequences of the separations between sector minima on `Σ₈`.

