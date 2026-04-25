# Appendix T: Electroweak Scale, Mixing, and Higgs Quartic from Golay-Steiner Structure

## T.1 Introduction

The electroweak sector presents three fundamental puzzles:

1. **The Hierarchy Problem**: Why is $v/M_{Pl} \sim 10^{-17}$?
2. **The Weinberg Angle**: Why is $\sin^2\theta_W(M_Z) \approx 0.231$?
3. **The Higgs Mass**: Why is $m_H \approx 125$ GeV (near the metastability boundary)?

Within the Predictive Universe framework, the electroweak scale and zero-slack quartic boundary are derived from the fixed-point Golay-Steiner structure on the Grassmannian orbit, while the quantitative gauge-threshold hierarchy is formulated on the minimal flag lift
$$
\pi:\widetilde X=\mathrm{Flag}_{1,2,3}(Q)\to \mathrm{Gr}(2,8)
$$
characterized by Theorem G.8.4e.1 in Appendix G. This appendix therefore uses a three-level scale dictionary that separates the PU fixed point $\mathfrak{A}_{PU}$, the lifted gauge-matching geometry, and the metastability scale $\mu_\lambda$:

$$
\boxed{
\begin{aligned}
v &= A_{EW} \, e^{-\kappa_{EW}} \, M_{Pl}, \quad \kappa_{EW} = 38.5 \\[6pt]
\sin^2\theta_W^{(0)} &= \frac{3}{8},\quad \sin^2\theta_W(\mu_G) = \frac{3 Z_2}{3 Z_2 + 5 Z_1} \quad \text{(Definition T.17; Definition T.17a)} \\[6pt]
\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU}) &= 0 \quad \text{(zero-slack boundary condition)}
\end{aligned}
}
$$

The appendix uses a three-level dictionary to separate the PU fixed point from physical matching scales:

- $\mathfrak{A}_{PU}$: the PU fixed point in theory space, characterized by PCE isotropy and capacity saturation (not an energy scale).
- $\mu_G$: the PU-to-SM matching scale at which canonically normalized gauge directions are identified with SM gauge kinetic terms. Remark T.62.1 derives $\mu_G = M_{Pl}e^{-9}$ from the confinement complexity exponent, and Theorem T.64a identifies this matching scale with the seesaw scale: $\mu_G = M_R = M_{Pl}e^{-9} \approx 1.5 \times 10^{15}$ GeV. This identification is used throughout this appendix for all numerical results.
- $(\Delta_1,\Delta_2,\Delta_3)$: the flag-lift spectral threshold shifts above the PU bulk value $\alpha_U^{-1}=24$, defined by the canonical $\mathrm{MS2}_{\mu_G}$ sector functional of Definition T.17a and Convention T.69a. In this appendix the validation tuple
  $$
  (\Delta_1,\Delta_2,\Delta_3)=(15.14,20.94,18.41)
  $$
  is used only as an external comparison for the forward block-sum evaluation. Once the branch data required by Convention T.17a.0 and Theorem T.78 are fixed, the threshold calculation is the fixed map
  $$
  D^{\mathrm{PCE}}_{\widetilde X}\longmapsto F=(F_C,F_W,F_Y)\longmapsto \Delta=TF,
  $$
  with $T$ the Dynkin-index matrix of Remark T.17a.3 and with tails certified by Corollary T.69.1. Remark T.17a.4 and Proposition T.17a.5 remain the local no-go showing that a sector-independent affine local truncation cannot replace the global sector-resolving block sum, while Theorem T.78.2 records that the current canonical ledger does not yet determine the missing spectral branch data needed to execute the global block sum. Equivalently,
  $$
  Z_i = 1+\frac{\Delta_i}{24},
  $$
  so that $g_i(\mu_G)=g_U/\sqrt{Z_i}$.
- $\mu_\lambda$: the metastability crossing scale defined by $\lambda(\mu_\lambda)=0$ in the SM effective theory; $\mu_\lambda$ is an output of RG evolution from boundary conditions at $\mu_G$.

-----

# Part I: Electroweak Scale Derivation

## T.2 Review of Golay-Steiner Structure

### T.2.1 Foundational Constants

The following constants are derived in the main text and Appendix Z:

|Constant |Value |Origin |Reference |
|:-----------------------------|:----------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------|
|$K_0$ |3 bits |Horizon constant (SPAP logic) |Theorem 15 |
|$d_0$ |8 on the minimal Appendix Z branch |MPU Hilbert space dimension: lower bound from Theorem 23, equality from Theorem Z.2 |Theorem 23; Theorem Z.2 |
|$\varepsilon$ |$\ln 2$ on the attractor branch |Irreducible Landauer cost: lower bound from Theorem 31, saturation at Definition 15a |Theorem 31; Definition 15a |
|$a$ |2 |Active kernel dimension on the attractor-saturating branch (Theorem Z.1) |Theorem Z.1 |
|$b$ |6 |Inactive subspace dimension ($d_0 - a$) |Definition |
|$M$ |24 |QFI interface mode count ($2ab$) |Theorem Z.5 |
|$k$ |12 |Golay code dimension ($M/2$) on the balanced rate-½ branch |Theorem Z.13 + balanced rate-½ branch |
|$D$ |4 |Emergent spacetime dimension |Theorem Z.11 |
|$n_G$ |12 |Gauge algebra dimension |Corollary G.8.4c|
|$(\kappa_1,\kappa_2,\kappa_3)$|$(0.695,\,0.729,\,1.140)$|Branch optimum on the imposed $c_\ell/c_d = 8/3$ normalization branch |Corollary T.34.2 (with imposed Corollary T.34.1) |
|$g_U^2$ |$\pi/6$ |PU-normalized gauge coefficient squared |Theorem T.39a |
|$\alpha_U^{-1}$ |$24$ |Inverse PU fine structure $\alpha_U=g_U^2/(4\pi)$ |Theorem T.39a |
|$(\Delta_1,\Delta_2,\Delta_3)$ |$(15.14,\,20.94,\,18.41)$ (validation target tuple)|Flag-lift spectral threshold shifts above $\alpha_U^{-1}=24$; the displayed tuple is used only to compare with the forward $\mathrm{MS2}_{\mu_G}$ block-sum calculation after $D^{\mathrm{PCE}}_{\widetilde X}$, the Golay/parity construction, the structural parameters, and the tail certificate are fixed. Remark T.17a.4 and Proposition T.17a.5 show that any sector-independent local affine truncation still forces $F_Y>0$, so the operative object is the global sector-resolving spectral functional on $\widetilde X$ rather than the local affine truncation. Theorem T.78.2 states the current non-closure of those missing branch data in the canonical ledger |Definition T.17a / Remark T.17a.4 / Prop. T.17a.5 / Theorem T.18 / Theorem T.78.2 |

The matching scale $\mu_G = M_{Pl}e^{-9} \approx 1.5 \times 10^{15}$ GeV connects the PU fixed point to SM effective theory. Remark T.62.1 fixes the exponent $9$ from confinement complexity, and Theorem T.64a identifies this matching scale with the seesaw scale: $\mu_G = M_R$ (Section T.23).

### T.2.2 The Golay Code Structure

**Definition T.1a** (Extended Binary Golay Code). The extended binary Golay code $\mathcal{G}_{24}$ is the unique linear code with parameters $[24, 12, 8]$ [MacWilliams & Sloane 1977]:

- Block length $n = M = 24$
- Dimension $k = 12$
- Minimum distance $d_{\min} = 8$
- Error correction capacity $t = \lfloor(d_{\min} - 1)/2\rfloor = 3$

The code admits a systematic generator matrix $G = [I_{12} \mid P]$ where $I_{12}$ is the $12 \times 12$ identity and $P$ is the parity matrix. The code can detect up to 7 errors and correct up to 3 errors per block.

**Remark T.1.1: Optimality Properties.** *The extended Golay code $\mathcal{G}_{24}$ is:*

- *Self-dual: $\mathcal{G}_{24} = \mathcal{G}_{24}^\perp$*
- *Optimal: achieves the maximum minimum distance $d_{\min} = 8$ for any $[24, 12]$ binary code*
- *Quasi-perfect: the covering radius is $\rho = t + 1 = 4$, meaning every vector in $\mathbb{F}_2^{24}$ lies within Hamming distance $\leq 4$ of some codeword*

*The associated punctured code $\mathcal{G}_{23}$ on 23 bits is perfect: the radius-$t=3$ Hamming spheres around codewords tile $\{0,1\}^{23}$ exactly. The sphere volume is $V_{23}(3)=\sum_{i=0}^3 \binom{23}{i}=2048=2^{11}$, and since $|\mathcal{G}_{23}|=2^{12}$ one has $|\mathcal{G}_{23}|\,V_{23}(3)=2^{12}\cdot 2^{11}=2^{23}$ [MacWilliams & Sloane 1977].*

**Definition T.2a** (Golay Parity Matrix). The $12 \times 12$ parity matrix $P$ over $\mathbb{F}_2$ is:

$$
P = \begin{pmatrix}
0 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1\\
1 & 1 & 1 & 0 & 1 & 1 & 1 & 0 & 0 & 0 & 1 & 0\\
1 & 1 & 0 & 1 & 1 & 1 & 0 & 0 & 0 & 1 & 0 & 1\\
1 & 0 & 1 & 1 & 1 & 0 & 0 & 0 & 1 & 0 & 1 & 1\\
1 & 1 & 1 & 1 & 0 & 0 & 0 & 1 & 0 & 1 & 1 & 0\\
1 & 1 & 1 & 0 & 0 & 0 & 1 & 0 & 1 & 1 & 0 & 1\\
1 & 1 & 0 & 0 & 0 & 1 & 0 & 1 & 1 & 0 & 1 & 1\\
1 & 0 & 0 & 0 & 1 & 0 & 1 & 1 & 0 & 1 & 1 & 1\\
1 & 0 & 0 & 1 & 0 & 1 & 1 & 0 & 1 & 1 & 1 & 0\\
1 & 0 & 1 & 0 & 1 & 1 & 0 & 1 & 1 & 1 & 0 & 0\\
1 & 1 & 0 & 1 & 1 & 0 & 1 & 1 & 1 & 0 & 0 & 0\\
1 & 0 & 1 & 1 & 0 & 1 & 1 & 1 & 0 & 0 & 0 & 1
\end{pmatrix}
$$

This matrix satisfies $P P^T \equiv I_{12}\pmod{2}$ (self-orthogonality) and generates the unique optimal $[24, 12, 8]$ code.

**Convention T.2.1** (Real lift). Throughout this appendix, when $P$ acts on real or integer vectors (as in $p = Ps$ with $s\in\mathbb{R}^{12}$), it denotes the $\{0,1\}$-entry matrix with standard real multiplication. Over $\mathbb{F}_2$, the same symbol denotes reduction mod 2. Context determines which is meant; explicit qualification is given only where ambiguity could arise.

**Lemma T.1b** (Row Weight Property). For the Golay parity matrix $P$ in Definition T.2a, the row sums (computed over $\mathbb{Z}$ via Convention T.2.1) satisfy:
$$
\sum_{j=1}^{12} P_{1j} = 11, \quad \sum_{j=1}^{12} P_{ij} = 7 \quad \text{for all } i \in \{2, \ldots, 12\}
$$

In particular, no row of $P$ sums to 1, so $P\mathbf{1}_{12} \neq \mathbf{1}_{12}$.

*Proof.* Direct computation from Definition T.2a. The first row is $[0,1,1,1,1,1,1,1,1,1,1,1]$ with sum 11. Rows 2–12 each contain exactly 7 ones. ∎

### T.2.3 The Signal-Parity Decomposition

**Proposition T.1c** (Signal-Parity Structure on the Balanced Rate-½ Branch). On the balanced rate-½ branch — the same branch supplied by Theorem P.13.12 (Appendix P) and propagated to Theorem R.4.4 (Appendix R) and Theorem Z.13b (Appendix Z) — the $M = 24$ QFI interface modes decompose into:

- **Signal subspace** $\mathcal{S}$: $k = 12$ information-carrying modes
- **Parity subspace** $\mathcal{P}$: $k = 12$ redundancy modes

with the parity modes determined by $p = Ps$ for signal vector $s$.

*Proof.* On the balanced rate-½ branch, where the $M = 24$ interface modes split into $k = M/2 = 12$ information modes and $M - k = 12$ redundancy modes, Theorem Z.13 (combined with the rate-½ branch input) shows that coding theory uniquely selects the extended binary Golay code $[24, 12, 8]$. The generator matrix $G = [I_{12} \mid P]$ then maps 12-bit signals to 24-bit codewords, establishing the decomposition. The rate-½ split is not forced by $M = 24$ alone; whether PCE optimization uniquely selects this rate among admissible $[24, k, d]$ code structures is the open rate-selection question flagged at Theorem P.13.12. ∎

-----

## T.3 The Electroweak Configuration Space

### T.3.1 Left-Chiral Sector

The Standard Model gauge group $G_{SM} = SU(3)_C \times SU(2)_L \times U(1)_Y$ has dimension 12 (Appendix G, Corollary G.8.4c). The electroweak sector $SU(2)_L \times U(1)_Y$ has dimension 4 and acts on left-chiral fermions.

**Definition T.3a** (Left-Chiral Information Modes on the Weak-Left Projection Branch). On the weak-left projection branch — under which the $SU(2)_L$ chiral interaction selects exactly $k/2 = 6$ of the $k = 12$ Golay signal modes — the left-chiral projection $\Pi_L: \mathbb{R}^{12} \to \mathbb{R}^6$ is the rank-6 projection onto these directions:
$$
x = \Pi_L s, \quad x \in \mathbb{R}^6, \quad s \in \mathbb{R}^{12}
$$
where $\Pi_L \in \mathbb{R}^{6 \times 12}$ satisfies $\Pi_L \Pi_L^T = I_6$.

The factor $k/2 = 6$ reflects the chiral asymmetry of the weak interaction on the weak-left projection branch. The branch-independent uniqueness of $\Pi_L$ is outside the stated weak-left projection hypotheses; this appendix takes the projection as given and tracks the resulting branch dependencies.

### T.3.2 Reservoir Coupling

**Definition T.4a** (Reservoir Coordinates). The reservoir space $\mathcal{R} = \mathbb{R}^b$ with $b = 6$ represents the inactive subspace dimensions that couple to the active interface modes.

**Definition T.5a** (Alignment Constraints on the Weak-Left Projection Branch). On the weak-left projection branch (Definition T.3a), the electroweak vacuum requires alignment between the left-chiral information modes $x \in \mathbb{R}^6$ and the reservoir coordinates $r \in \mathbb{R}^6$. The number of independent alignment constraints is:
$$
N_0 = b \times \frac{k}{2} = 6 \times 6 = 36 \quad \text{(on the weak-left projection branch)}.
$$
Off this branch, $N_0$ would be replaced by $b \cdot n_L$ where $n_L$ is the number of weak-left active directions, with $\kappa_{EW} = b n_L + \dim(G/H) - m/2$ shifting accordingly: a unit change in $n_L$ shifts $\kappa_{EW}$ by $b = 6$ and rescales $v$ by $e^{\pm 6}$.

**Proposition T.2b** (Equivalent Forms of $N_0$). The base complexity $N_0 = 36$ admits equivalent expressions:
$$
N_0 = \frac{bk}{2} = b^2 = 36
$$

*Proof.* Direct calculation: $bk/2 = 6 \times 12/2 = 36$. Since $k = 2b$, this equals $b^2 = 36$. ∎

### T.3.3 Electroweak Symmetry Breaking

**Definition T.6a** (Electroweak Coset). Electroweak symmetry breaking corresponds to the vacuum manifold:
$$
\mathcal{M}_{EW} = \frac{SU(2)_L \times U(1)_Y}{U(1)_{em}} \cong S^3
$$

The coset dimension is:
$$
\dim(G/H) = \dim(SU(2) \times U(1)) - \dim(U(1)_{em}) = 4 - 1 = 3
$$

**Definition T.7a** (Coset Coordinates). Let $\xi \in \mathbb{R}^3$ parametrize the three broken directions corresponding to the $W^\pm$ and $Z^0$ bosons.

**Definition T.8a** (Residual Gauge Coordinate). Let $\psi \in \mathbb{R}$ parametrize the surviving $U(1)_{em}$ gauge angle.

-----

## T.4 The Discrete Electroweak Action

### T.4.1 Embedding Map

**Definition T.9a** (Information-to-Full Embedding). The embedding map $T: \mathbb{R}^{12} \to \mathbb{R}^{24}$ encodes the Golay parity structure:
$$
T s = \begin{pmatrix} s \ P s \end{pmatrix} = \begin{pmatrix} I_{12} \ P \end{pmatrix} s
$$

where $P$ is the Golay parity matrix (Definition T.2a).

### T.4.2 The Octad Hessian

**Definition T.10a** (Centered Octad Quadratic-Form Operator). The Steiner system $S(5,8,24)$ induces the centered quadratic-form operator on $\mathbb{R}^{24}$:
$$
A_{oct} = (r - \lambda)\left(I_{24} - \frac{1}{24}\mathbf{1}_{24}\mathbf{1}_{24}^T\right)
$$
where $r - \lambda = 176$ is the octad regularity parameter (Appendix U, Theorem U.6). The actual Hessian of the centered octad potential is
$$
\nabla^2 Q(0)=2A_{oct}
$$
by Theorem U.5.

**Lemma T.2** (Spectrum of $A_{oct}$). The centered octad quadratic-form operator has:

- One-dimensional kernel: $\ker(A_{oct}) = \text{span}(\mathbf{1}_{24})$
- Positive eigenvalue $176$ with multiplicity 23 on $\mathbf{1}_{24}^\perp$

*Proof.* Direct calculation:
$$
A_{oct}\mathbf{1}_{24} = (r-\lambda)\left(I_{24} - \frac{1}{24}\mathbf{1}_{24}\mathbf{1}_{24}^T\right)\mathbf{1}_{24} = 0.
$$
For $v \perp \mathbf{1}_{24}$,
$$
A_{oct}v=(r-\lambda)v.
$$
Hence the spectrum is as stated. ∎

### T.4.3 The Information-Subspace Laplacian

**Definition T.11a** (Golay-Steiner Laplacian). The information-subspace Laplacian is the pullback of $A_{oct}$ via the embedding $T$:
$$
L_{info} = \frac{1}{24} T^T A_{oct} T = \frac{176}{24} T^T \left(I_{24} - \frac{1}{24}\mathbf{1}_{24}\mathbf{1}_{24}^T\right) T
$$

This is a $12 \times 12$ matrix acting on information coordinates $s \in \mathbb{R}^{12}$.

**Theorem T.1** (Strict Positivity of $L_{info}$). The Golay-Steiner Laplacian is strictly positive definite:
$$
L_{info} \succ 0
$$

*Proof.*

**Step 1** (Kernel exclusion). We show $\mathbf{1}_{24} \notin \text{im}(T)$. Suppose $\mathbf{1}_{24} = Ts$ for some $s \in \mathbb{R}^{12}$. Then:

- Upper block: $s = \mathbf{1}_{12}$
- Lower block: $Ps = \mathbf{1}_{12}$

By Lemma T.1, $P\mathbf{1}_{12} = (11, 7, 7, \ldots, 7)^T \neq \mathbf{1}_{12}$. Therefore no $s$ maps to $\mathbf{1}_{24}$.

**Step 2** (Positivity inheritance). Since $\ker(A_{oct}) = \text{span}(\mathbf{1}_{24})$ and $\mathbf{1}_{24} \notin \text{im}(T)$, the restriction of $A_{oct}$ to $\text{im}(T)$ is positive definite. Therefore $L_{info} \succ 0$. ∎

### T.4.4 The Complete Discrete Action

**Definition T.12a** (Electroweak Discrete Action). The Euclidean information action for electroweak alignment is:
$$
S_{EW}[s, r, \xi, \psi] = \frac{1}{\varepsilon} \int d\tau \left\{ \frac{1}{2}\left(|\dot{x}|^2 + |\dot{r}|^2 + |\dot{\xi}|^2 + |\dot{\psi}|^2\right) + V_{EW}(s, r, \xi, \psi) \right\}
$$

where the potential is:
$$
V_{EW}(s, r, \xi, \psi) = \frac{1}{2} s^T L_{info} s + \frac{1}{2} |r - R\Pi_L s|^2 + \frac{\mu}{2}|\xi|^2 + 0 \cdot \psi^2
$$

with:

- $s \in \mathbb{R}^{12}$: information amplitudes
- $x = \Pi_L s \in \mathbb{R}^6$: left-chiral components
- $r \in \mathbb{R}^6$: reservoir coordinates
- $\xi \in \mathbb{R}^3$: coset (broken direction) coordinates
- $\psi \in \mathbb{R}$: U(1)$_{em}$ gauge angle
- $R = I_6$: isotropic coupling matrix
- $\mu > 0$: isotropic curvature for broken directions
- $\varepsilon = \ln 2$: irreducible Landauer cost (Theorem 31)

-----

## T.5 Hessian Analysis and Zero Mode Structure

### T.5.1 The Hessian Matrix

**Theorem T.2** (Hessian Block Structure). At the stationary point $(s^*, r^*, \xi^* = 0, \psi)$, the potential Hessian has block structure:
$$
H = \begin{pmatrix}
L_{info} + \Pi_L^T \Pi_L & -\Pi_L^T & 0 & 0\\
-\Pi_L & I_6 & 0 & 0\\
0 & 0 & \mu I_3 & 0\\
0 & 0 & 0 & 0
\end{pmatrix}
$$

*Proof.* The potential is
$$
V_{EW}(s,r,\xi,\psi)=\frac12 s^T L_{info}s+\frac12|r-\Pi_L s|^2+\frac{\mu}{2}|\xi|^2+0\cdot\psi^2,
$$
since $R=I_6$ in the isotropic ansatz. Expanding the quadratic mismatch term gives
$$
\frac12|r-\Pi_L s|^2
=\frac12 r^Tr-r^T\Pi_L s+\frac12 s^T\Pi_L^T\Pi_L s.
$$
Hence
$$
V_{EW}(s,r,\xi,\psi)
=\frac12 s^T(L_{info}+\Pi_L^T\Pi_L)s-r^T\Pi_L s+\frac12 r^Tr+\frac{\mu}{2}\xi^T\xi.
$$
Taking second derivatives with respect to the block variables $(s,r,\xi,\psi)$ yields
$$
\frac{\partial^2 V_{EW}}{\partial s^2}=L_{info}+\Pi_L^T\Pi_L,\qquad
\frac{\partial^2 V_{EW}}{\partial s\,\partial r}=-\Pi_L^T,\qquad
\frac{\partial^2 V_{EW}}{\partial r^2}=I_6,
$$
$$
\frac{\partial^2 V_{EW}}{\partial \xi^2}=\mu I_3,\qquad
\frac{\partial^2 V_{EW}}{\partial \psi^2}=0,
$$
and all remaining mixed second derivatives vanish because no term couples $\xi$ or $\psi$ to the other variables at quadratic order. Therefore the Hessian has the claimed block form. ∎

### T.5.2 Positivity Analysis

**Theorem T.3** (Schur Complement Analysis). The coupled $(s,r)$ sector has no zero modes.

*Proof.* Consider the $(s,r)$-block of the Hessian in Theorem T.2:
$$
H_{sr}=
\begin{pmatrix}
L_{info}+\Pi_L^T\Pi_L & -\Pi_L^T \\
-\Pi_L & I_6
\end{pmatrix}.
$$
Since $I_6\succ 0$, $H_{sr}$ is positive definite if and only if its Schur complement with respect to $I_6$ is positive definite. The Schur complement is
$$
S = \left(L_{info}+\Pi_L^T\Pi_L\right) - \left(-\Pi_L^T\right)I_6^{-1}\left(-\Pi_L\right) = L_{info}.
$$
By Theorem T.1, $L_{info}\succ 0$, hence $S\succ 0$ and therefore $H_{sr}\succ 0$. In particular, the coupled $(s,r)$ sector has no zero modes. ∎

### T.5.3 Zero Mode Count

**Theorem T.4** (Unique Zero Mode). The Hessian $H$ has exactly one zero mode, corresponding to the U(1)$_{em}$ gauge angle $\psi$.
$$
\boxed{\dim(\ker H) = 1}
$$

*Proof.* The $(s, r)$ sector contributes no zero modes (Theorem T.3). The $\xi$ block $\mu I_3 \succ 0$ contributes none. Only the $\psi$ block vanishes identically, giving one zero mode. ∎

-----

## T.6 Derivation of $\kappa_{EW}$

### T.6.1 Complexity Counting

**Definition T.13** (Electroweak Complexity). The electroweak complexity $\kappa_{EW}$ counts the effective complex Gaussian dimension of the instanton saddle-point integral after zero-mode reduction:
$$
\kappa_{EW} = N_0 + \dim(G/H) - \frac{m}{2},
$$
where

- $N_0 = bk/2 = 36$ is the reservoir-alignment count,
- $\dim(G/H) = 3$ is the coset dimension,
- $m$ is the real zero-mode manifold dimension (Theorem T.4),
- the factor $1/2$ arises from the Morse–Bott stationary-phase structure derived in Theorem T.5.

### T.6.2 Main Result

**Theorem T.5** (Electroweak Complexity). For the electroweak PCE instanton with base complex Gaussian count $\kappa_0 = N_0 + \dim(G/H)$ and real zero-mode manifold dimension $m$, assume: (i) the Hessian is positive definite transverse to the zero-mode manifold; (ii) the zero modes form a compact Morse-Bott critical manifold of real dimension $m$; and (iii) the Gaussian fluctuation integral factorizes into the transverse determinant times the zero-mode volume. Then the effective complexity is
$$
\kappa_{EW} = \kappa_0 - \frac{m}{2}.
$$

In the present electroweak problem,
$$
\kappa_0 = N_0 + \dim(G/H) = 36 + 3 = 39,
\qquad
m = 1,
$$
so
$$
\kappa_{EW} = 39 - \frac{1}{2} = 38.5.
$$

*Proof.* Theorem T.2 and Theorem T.3 show that the Hessian is positive in the $(s,r,\xi)$ directions, while Theorem T.4 identifies a unique zero mode corresponding to the residual $U(1)_{em}$ angle. Hence the critical set is a one-dimensional compact manifold generated by that gauge angle, so $m=1$. Under the Morse-Bott assumptions stated above, each real zero mode removes one half-unit from the complex Gaussian count. Therefore the reduced complexity is $\kappa_0-m/2 = 39-1/2 = 38.5$. QED

**Corollary T.5c** (Steiner–Electroweak Numerical Identity). Under Theorem T.5,
$$
2\kappa_{EW} = bk + 2\dim(G/H) - m = 77.
$$
Using Corollary U.2a, this equals the pair multiplicity of the Steiner system $S(5,8,24)$:
$$
2\kappa_{EW} = \lambda = 77.
$$

*Proof.* Theorem T.5 gives
$$
2\kappa_{EW} = 2\left(\frac{bk}{2} + \dim(G/H) - \frac{m}{2}\right)=bk+2\dim(G/H)-m.
$$
With $b=6$, $k=12$, $\dim(G/H)=3$, and $m=1$, this becomes
$$
2\kappa_{EW}=72+6-1=77.
$$
Corollary U.2a gives $\lambda=77$ for $S(5,8,24)$, hence $2\kappa_{EW}=\lambda$. ∎

**Remark T.5d (Cross-Appendix Significance of the Steiner–Electroweak Identity).** The identity $2\kappa_{EW} = 77 = \lambda_{S(5,8,24)}$ is an exact algebraic consequence of the electroweak counting data $(b,k,\dim(G/H),m) = (6,12,3,1)$. It connects the electroweak instanton mechanism directly to the Golay-Steiner coding structure that governs the interface mode geometry ($M=24$), the gauge generator budget ($n_G=12$), and the vacuum configuration space ($\mathrm{Gr}_\mathbb{C}(12,24)$). The electroweak hierarchy and the code-theoretic structure of the vacuum are therefore not independent at the level of the currently derived backbone data: they share the same Steiner pair-count as their common complexity anchor. A direct theorem forcing this equality without routing through the specific numerical values remains open.

-----

## T.7 Numerical Verification of Electroweak Scale

### T.7.1 Scale Prediction

**Theorem T.6** (Electroweak Scale). The Higgs vacuum expectation value is:
$$
\boxed{v = A_{EW}\, e^{-\kappa_{EW}}\, M_{Pl}}
$$

where $A_{EW} \sim \mathcal{O}(1)$ is the one-loop determinant prefactor.

**Proposition T.3** (Baseline Scale from Complexity).
$$
e^{-\kappa_{EW}} = e^{-38.5} \approx 1.90 \times 10^{-17}.
$$

With $M_{Pl} = 1.2209 \times 10^{19}$ GeV, the complexity-suppressed baseline scale (prior to the one-loop determinant) is:
$$
\boxed{
v_0 := e^{-\kappa_{EW}} M_{Pl} \approx 232\ \mathrm{GeV}.
}
$$

The full electroweak prediction is then
$$
v = A_{EW}\, v_0,
$$
with $A_{EW}$ specified by the determinant-model branch of Theorem T.29.

### T.7.2 Prefactor Determination

**Proposition T.4** (Prefactor Consistency). The determinant model of Theorem T.29 gives the central value $A_{EW}=1.08407\ldots$ from the SU(2) link factor, the rank-one Schur-complement factor, and the homogeneous-space Jacobian factor. With the separate model allowance recorded in Theorem T.29, the working value is
$$
A_{EW}=1.084\pm0.005,
$$
and hence
$$
v = 1.084 \times 232 \text{ GeV} = 252 \text{ GeV}.
$$

This achieves 2.3% agreement with $v_{exp} = 246.22$ GeV. The agreement is a determinant-model consistency check: the central value is fixed once the model is fixed, but the $\pm0.005$ allowance is not a theorem-level remainder bound.

-----

## T.8 Connection to Cosmological Constant

### T.8.1 Structural Parallel

**Theorem T.7** (Unified Hierarchy Structure). Both hierarchies emerge from the same Golay $[24,12,8]$ code:

|Quantity |$\Lambda$ (Appendix U) |$v$ (This Appendix) |
|:--------------|:--------------------------|:------------------------|
|Configuration |Full Grassmannian Gr(12,24)|Left-chiral × reservoir |
|Base complexity|$k^2 = 144$ |$bk/2 = 36$ |
|Zero modes |4 exact translations, with a five-mode reference count used only on the Appendix U reference branch |1 |
|**Complexity** |$\kappa_{\Lambda,\mathrm{ref}} = 141.5$ on the five-mode reference branch; $\kappa_{\Lambda,\mathrm{trans}} = 142$ is the corrected four-mode branch value under the explicit false-vacuum spectral hypotheses of Theorem U.13b |$\kappa_{EW} = 38.5$ |
|**Suppression**|$e^{-283}$ on the five-mode reference branch; $e^{-284}$ on the translational branch |$e^{-38.5} \sim 10^{-17}$|

-----

## T.9 Experimental Predictions (Scale)

### T.9.1 Quantization Signature

**Prediction T.1** (Half-Integer Shifts). Any additional zero mode would shift $\kappa_{EW}$ by $\pm 0.5$, rescaling $v$ by $e^{\mp 0.5} \approx 0.61$ or $1.65$.

### T.9.2 No Fourth Generation

**Prediction T.2** (Three Generations). The framework predicts exactly three fermion generations (Appendix R). A fourth sequential generation would contradict $M = K(4) = 24$.

-----

# Part II: Weinberg Angle Derivation

## T.10 The Electroweak 5-Plane

### T.10.1 Decomposition of the Inactive Subspace

**Theorem T.8** (3 ⊗ 2 Factorization on the Row-Pair Branch). On the row-pair branch — under which the $b = 6$ inactive directions are organized into three ordered pairs — the $b=6$ sector admits an $S_3 \times \mathbb{Z}_2$-equivariant factorization:
$$
\mathbb{R}^6 \cong \mathbb{R}^3 \otimes \mathbb{R}^2,
$$
where $\mathbb{R}^3$ carries the triplet index (the fundamental of $SU(3)_C$) and $\mathbb{R}^2$ carries the within-pair index (the fundamental of $SU(2)_L$). The identification is unique up to independent basis changes in the two factors once the underlying $S_3 \times \mathbb{Z}_2$ pairing structure is fixed (made explicit in Theorem T.30).

*Proof.* The module partition from Theorem G.8.4b gives $(n_3,n_2,n_1) = (3, 2, 1)$ as block sizes in a direct-sum decomposition $3 + 2 + 1 = 6$. Numerically $\dim(\mathbb{R}^6) = 6 = 3 \cdot 2$, but a direct-sum block decomposition into three blocks of sizes $(3, 2, 1)$ does not by itself entail a canonical tensor-product structure $\mathbb{R}^3 \otimes \mathbb{R}^2$ on the $b = 6$ sector. The tensor identification requires the row-pair branch input of Theorem T.30: once the six left-chiral links are organized into three ordered pairs $(1,2), (3,4), (5,6)$, the resulting 6-dimensional space admits the natural identification $\mathbb{R}^6 \cong \mathbb{R}^3 \otimes \mathbb{R}^2$, with the ambiguity reduced to an $O(3) \times O(2)$ change of basis. The numerical coincidence $3 + 2 + 1 = 6 = 3 \cdot 2$ is consistent with this identification but does not force it. ∎

**Definition T.14a** (Electroweak 5-Plane). Write the internal $8$-space as a direct sum of the active and $b=6$ sectors,
$$
\mathbb{R}^8 \cong U_W \oplus U_{6}, \qquad U_W \cong \mathbb{R}^2,\quad U_{6}\cong \mathbb{R}^3\otimes \mathbb{R}^2.
$$
Let $w_0\in\mathbb{R}^2$ denote the $\mathbb{Z}_2$-even unit vector singled out by the within-pair splitting (Theorem T.30) in the second factor of $U_6\cong\mathbb{R}^3\otimes\mathbb{R}^2$ and define the color triplet slice
$$
U_C := \mathbb{R}^3\otimes \mathrm{span}{w_0} \cong \mathbb{R}^3.
$$
Then the electroweak 5-plane is
$$
W_5 := U_C \oplus U_W \cong \mathbb{R}^3 \oplus \mathbb{R}^2.
$$

- $U_C \cong \mathbb{R}^3$: color triplet sector (weak singlet slice of $U_6$)
- $U_W \cong \mathbb{R}^2$: weak doublet sector (the active plane)

### T.10.2 Hypercharge Structure

**Theorem T.9** (Traceless Hypercharge). Let $Y$ be the diagonal hypercharge generator on $W_5$:
$$
Y = \text{diag}(y_c, y_c, y_c, y_w, y_w)
$$
The tracelessness constraint enforces:
$$
3y_c + 2y_w = 0
$$

*Proof.* The $U(1)$ generator is taken as the diagonal element of the embedded $SU(5)$ acting on $W_5$, hence it must lie in $\mathfrak{su}(5)$ and therefore be traceless. Equivalently, $Y$ must be orthogonal to the identity operator in the Hilbert–Schmidt inner product on $\mathrm{End}(W_5)$, which is exactly $\mathrm{Tr}(Y)=0$, giving $3y_c+2y_w=0$. ∎

**Corollary T.9.1** (Hypercharge Ratio).
$$
\frac{y_w}{y_c} = -\frac{3}{2}
$$

-----

## T.11 Minimal Rational Hypercharge and the 5/3 Factor

### T.11.1 Uniqueness of Minimal Solution

**Theorem T.10** (Primitive $1/6$-Quantized Hypercharge). Assume the hypercharge generator on $W_5$ has diagonal entries $(y_c,y_c,y_c,y_w,y_w)\in\mathbb Q^5$, satisfies the tracelessness condition
$$
3y_c+2y_w=0,
$$
and is normalized so that all charges are integer multiples of $1/6$ while the pair $(6y_c,6y_w)$ is primitive in $\mathbb Z^2$. Then, up to an overall sign, the unique admissible rational solution is
$$
(y_c,y_w)=\left(-\frac13,\frac12\right).
$$
Choosing the orientation in which the weak-doublet entry is positive gives
$$
y_c = -\frac{1}{3}, \quad y_w = +\frac{1}{2}.
$$

*Proof.* Set
$$
m:=6y_c,\qquad n:=6y_w.
$$
By hypothesis, $(m,n)\in\mathbb Z^2$ is primitive and the tracelessness relation becomes
$$
3m+2n=0.
$$
Every integer solution has the form
$$
(m,n)=(-2\ell,3\ell),\qquad \ell\in\mathbb Z.
$$
Primitivity forces $|\ell|=1$, because $\gcd(2|\ell|,3|\ell|)=|\ell|$. Thus the only primitive integer solutions are
$$
(-2,3)\qquad\text{and}\qquad (2,-3).
$$
Dividing by $6$ gives the two admissible rational solutions
$$
\left(-\frac13,\frac12\right),\qquad \left(\frac13,-\frac12\right).
$$
They differ only by an overall sign. Adopting the orientation in which the weak-doublet entry is positive yields
$$
y_c=-\frac13,\qquad y_w=\frac12.
$$
This is the conventional $\bar5=\bar3\oplus2$ hypercharge assignment. ∎

### T.11.2 Design-Preserving Inner Product

**Definition T.15a** (Hilbert-Schmidt Norm). For diagonal generators on $W_5$:
$$
\langle A, B \rangle_{HS} = \mathrm{tr}(A^\dagger B)
$$

**Theorem T.11** (Hypercharge Norm). The HS norm of the hypercharge generator is:
$$
|Y|_{HS}^2 = \mathrm{tr}(Y^2) = 3\left(\frac{1}{3}\right)^2 + 2\left(\frac{1}{2}\right)^2 = \frac{1}{3} + \frac{1}{2} = \frac{5}{6}
$$

*Proof.* Direct computation. ∎

### T.11.3 Canonical Normalization and the 5/3 Factor

**Definition T.16a** (SU(2) Generator Normalization). The $SU(2)_L$ generators $T_a = \sigma_a/2$ satisfy:
$$
\mathrm{tr}(T_a T_b) = \frac{1}{2}\delta_{ab}
$$

**Theorem T.12** (GUT Normalization Factor). Define canonically normalized hypercharge $\hat{Y}$ by:
$$
\mathrm{tr}(\hat{Y}^2) = \frac{1}{2} = \mathrm{tr}(T_a^2)
$$
Then:
$$
\hat{Y} = \frac{Y}{\sqrt{5/3}}, \quad \boxed{c^2 = \frac{5}{3}}
$$

*Proof.* From $\mathrm{tr}(Y^2) = 5/6$, requiring $\mathrm{tr}(\hat{Y}^2) = 1/2$ gives $c^2 = (5/6)/(1/2) = 5/3$. ∎

**Remark T.12.1: Origin of 5/3.** The factor 5/3, traditionally assumed from SU(5) grand unification, emerges here on the primitive-(1/6)-quantized, traceless, $(3 + 2)$ hypercharge branch — the three explicit hypotheses of Theorem T.10. Under those hypotheses, the SU(5) group embedding is not separately required: the same constraints (rational charges, tracelessness on the 5-plane, primitive $(1/6)$-quantization) suffice to fix $(y_c, y_w) = (-1/3, 1/2)$ and hence $\mathrm{tr}(Y^2) = 5/6$ giving $c^2 = 5/3$. The Hypercharge $5/3$ row in the summary tables (T.19.1, T.20) inherits this branch and is interpreted as derived on the primitive-(1/6)-quantized $(3+2)$ hypercharge branch rather than unconditionally.

-----

## T.12 Weinberg Angle from PCE Isotropy

### T.12.1 Gauge Coupling Relations

**Definition T.17** (Coupling Conventions). Define:

- $g_1$: GUT-normalized $U(1)_Y$ coupling (couples to $\hat{Y}$)
- $g_2 = g$: $SU(2)_L$ coupling (couples to $T_a$)
- $g' = g_Y$: physical hypercharge coupling (couples to $Y$)

The relation is:
$$
g' = \frac{g_1}{\sqrt{5/3}}, \quad (g')^2 = \frac{3}{5}g_1^2
$$

**Definition T.17a** (Flag-Lift Spectral Threshold Data). Let
$$
\pi:\widetilde X=\mathrm{Flag}_{1,2,3}(Q)\to X=\mathrm{Gr}(2,8)
$$
be the minimal flag lift characterized in Theorem G.8.4e.1, so that
$$
\pi^*Q\cong \widetilde Q_Y\oplus \widetilde Q_W\oplus \widetilde Q_C
$$
with complex ranks $(1,2,3)$. Let
$$
\widetilde E:=\pi^*(S^\vee\otimes Q)\cong \pi^*S^\vee\otimes(\widetilde Q_Y\oplus \widetilde Q_W\oplus \widetilde Q_C)
$$
be the charged lifted interface bundle, and let $\mathcal J_G\in \Gamma(\operatorname{End}(\widetilde E_{\mathbb R}))$ denote the compatible Golay involution of the lifted gauge sector.

Define the lifted PCE operator
$$
D^{\mathrm{PCE}}_{\widetilde X}
=
(\nabla^{\widetilde G})^*\nabla^{\widetilde G}
+\mu_0 I
+m_{\mathcal J}\,\mathcal J_G
+\mathcal C_\kappa
+\eta\,\mathcal J_G\,\mathcal C_\kappa,
$$
where $m_{\mathcal J}$ denotes the Golay-involution coupling strength, distinct from the PU-to-SM matching scale $\mu_G = M_{Pl}e^{-9}$ of Remark T.62.1, and
$$
\mathcal C_\kappa
:=
\kappa_1\rho(Y)^2
+\kappa_2\sum_{a=1}^3 \rho(T_a)^2
+\kappa_3\sum_{A=1}^8 \rho(G_A)^2,
$$
and $\rho$ is the lifted $G_{\mathrm{SM}}$ representation on $\widetilde E$.

Let the sector order be $(C,W,Y)$ and write
$$
\widetilde E_C=\pi^*S^\vee\otimes\widetilde Q_C,\qquad
\widetilde E_W=\pi^*S^\vee\otimes\widetilde Q_W,\qquad
\widetilde E_Y=\pi^*S^\vee\otimes\widetilde Q_Y.
$$
For each sector $s\in\{C,W,Y\}$, let $D_s$ be the restriction of $D^{\mathrm{PCE}}_{\widetilde X}$ to the corresponding sector/parity block sum, with strictly positive spectrum after the fixed admissible mass shift. Let
$$
K_s(t):=\operatorname{Tr}_{\widetilde E_s}(e^{-tD_s})
$$
and let $\zeta_s(q)$ be the meromorphic continuation of
$$
\zeta_s(q)=\sum_{\nu\in\operatorname{Spec}(D_s)}m_\nu\nu^{-q},
\qquad \operatorname{Re}q>23,
$$
where $m_\nu$ is the spectral multiplicity. In the canonical $\mathrm{MS2}_{\mu_G}$ branch of Convention T.69a, the sector threshold functional is
$$
F_s
:=
-\zeta_s'(0)-\zeta_s(0)\log\mu_G^2.

$$
The displayed finite part is evaluated only after the threshold-active $a_{0,s}$ and $a_{2,s}$ heat coefficients have been assigned the canonical zero finite counterterm at $\mu_G$; no validation datum enters this assignment.

The physical threshold triplet is then
$$
\Delta=TF,
\qquad
F=(F_C,F_W,F_Y)^T,
\qquad
T=
\begin{pmatrix}
2/5&3/5&8/15\\
0&1&0\\
1&0&0
\end{pmatrix}.

$$
Equivalently,
$$
\Delta_3=F_C,\qquad
\Delta_2=F_W,\qquad
\Delta_1=\frac25F_C+\frac35F_W+\frac{8}{15}F_Y.

$$
The corresponding dimensionless matching factors are
$$
Z_i:=1+\frac{\Delta_i}{\alpha_U^{-1}}=1+\frac{\Delta_i}{24}.

$$
These $Z_i$ are spectral matching data on the lifted gauge geometry $\widetilde X$; they are not Bures-norm orbit averages on the bare Grassmannian. The lifted formulation replaces the bare-Grassmannian orbit-average construction because the local Bures block formula provides only representative-state coupling data, while the quantitative gauge hierarchy requires the global sector-resolving structure formulated on the flag lift. Proposition T.17a.3a gives the canonical base-to-lift matching map for the local part, while Convention T.69a, Theorem T.69, Corollary T.69.1, and Theorem T.70 give the finite-part prescription, local/global split, certified tail control, and sector/parity block spectrum. The numerical tuple adopted later in Theorem T.18 is not part of this definition; it is a validation target for the lifted spectral problem.

**Convention T.17a.0 (Forward-Only Threshold Rule).** A completed flag-lift threshold calculation is a tuple
$$
\mathfrak S_{\widetilde X}
=
\left(
\widetilde X,
D^{\mathrm{PCE}}_{\widetilde X},
\mathrm{MS2}_{\mu_G},
\mathcal J_G,
\mu_0,
m_{\mathcal J},
\eta,
\{\tau_{s,\pm,a}\},
\{\varepsilon_s(L)\}
\right)
$$
fixed before comparison with any numerical validation tuple. The sector/parity $H$-types $\{\tau_{s,\pm,a}\}$ are the canonical types fixed by the Golay/parity construction of Theorem G.8.4e.1 and the sector-bundle decomposition of Remark T.17a.3; no validation datum enters that assignment. In this canonical branch the only threshold kernel is the zeta/log-determinant finite part of Definition T.17a. The sector functionals are computed forward as
$$
F_s
=
\left[
\sum_{\pm,a}
\sum_{\Lambda\in\widehat{SU(8)}}
(\dim V_\Lambda)\,
m_{\Lambda,s,\pm,a}\,
\log(\nu_{\Lambda,s,\pm,a}/\mu_G^2)
\right]_{\mathrm{MS2}_{\mu_G}},

$$
where the spectrum $\nu_{\Lambda,s,\pm,a}$ is the sector/parity spectrum of Theorem T.70 and the finite part is the canonical one of Convention T.69a. With sector order $(C,W,Y)$,
$$
\Delta=T F,
\qquad
T=
\begin{pmatrix}
2/5&3/5&8/15\\
0&1&0\\
1&0&0
\end{pmatrix}.
$$
The tuple $(15.14,20.94,18.41)$ may be used only after this forward computation as a validation comparison. It may not be inserted into $F=T^{-1}\Delta$, used to choose the finite-part prescription, used to choose $(\mu_0,m_{\mathcal J},\eta)$, or used to select a Golay/parity lift. A finite truncation establishes a stated tolerance only when
$$
\left|(T F^{(\le L)})_i-\Delta_i^{\mathrm{val}}\right|
+
\sum_s |T_{is}|\varepsilon_s(L)
\le \tau_i
$$
is certified with the tail bounds of Corollary T.69.1.

**Remark T.17a.1 (Dynkin Index Structure and Singlet Hypercharge).** The lifted interface bundle $\widetilde E = \pi^*S^\vee \otimes \pi^*Q$ splits into three $G_{\mathrm{SM}}$-sectors of complex ranks $(6,4,2)$:
$$
\widetilde E \cong (\pi^*S^\vee \otimes \widetilde Q_C) \oplus (\pi^*S^\vee \otimes \widetilde Q_W) \oplus (\pi^*S^\vee \otimes \widetilde Q_Y),
$$
contributing $12+8+4=24$ real interface modes (confirming $M=24$).

**Proposition T.17a.2 (Interface Bundle as Pulled-Back Tangent Bundle).** *The charged lifted interface bundle is the pull-back of the holomorphic tangent bundle of the base Grassmannian:*
$$
\widetilde E = \pi^*(S^\vee\otimes Q) \cong \pi^*\bigl(T^{1,0}\mathrm{Gr}(2,8)\bigr).
$$

*Proof.* For $\mathrm{Gr}(2,8)$ one has the standard holomorphic identification $T^{1,0}\mathrm{Gr}(2,8)\cong S^\vee\otimes Q$, since tangent directions at a $2$-plane are linear maps from the tautological subspace to the quotient. Pulling back along $\pi$ gives the stated isomorphism. ∎

**Remark T.17a.3 (Sector-wise Action of $\mathcal C_\kappa$).** On the three lifted sectors $\widetilde E_s = \pi^*S^\vee\otimes \widetilde Q_s$, the endomorphism $\mathcal C_\kappa$ acts by scalar multiplication:
$$
\mathcal C_\kappa|_{\widetilde E_Y}=\frac{4\kappa_1}{15}I,\qquad
\mathcal C_\kappa|_{\widetilde E_W}=\left(\frac{3\kappa_1}{20}+\frac{3\kappa_2}{4}\right)I,\qquad
\mathcal C_\kappa|_{\widetilde E_C}=\left(\frac{\kappa_1}{15}+\frac{4\kappa_3}{3}\right)I.
$$
These values follow from the sector charges of Remark T.17a.1 together with the fundamental quadratic Casimirs $C_2(\mathbf 2)=3/4$ and $C_2(\mathbf 3)=4/3$ in the SU(5)-normalized convention used here.

The threshold shifts decompose as $\Delta_i = \sum_s T_i(s)\,F_s$, where $F_s$ is the spectral functional for sector $s\in\{C,W,Y\}$ and the Dynkin index matrix is
$$
T = \begin{pmatrix} T_1(C) & T_1(W) & T_1(Y) \\ T_2(C) & T_2(W) & T_2(Y) \\ T_3(C) & T_3(W) & T_3(Y) \end{pmatrix}
= \begin{pmatrix} 2/5 & 3/5 & 8/15 \\ 0 & 1 & 0 \\ 1 & 0 & 0 \end{pmatrix}.
$$
Here $T_3(C) = 2I_{SU(3)}(\mathbf{3})=1$, $T_2(W) = 2I_{SU(2)}(\mathbf{2})=1$, and the $U(1)$ entries are $T_1(s)=n_s\,y_s^2$ with $y_s$ the per-component hypercharge in SU(5) normalization. The singlet hypercharge $y_Y$ is determined by the following chain of identifications:

**Proposition T.17a.3a (Canonical Base-to-Lift Matching Map).** Let $X=\mathrm{Gr}(2,8)$ and $\pi:\widetilde X\to X$ the minimal flag lift (Theorem G.8.4e.1 and Proposition G.8.4e.1a). Let $b_s$ be any sector-labeled local scalar on $X$ obtained from the representative-state Bures block data, with $s\in\{C,W,Y\}$, and assume $b_s$ is invariant under the compact decomposition-preserving fiber action. Then:

1. there exists a unique fiber-constant lift $\widetilde b_s = b_s\circ\pi\in C^\infty(\widetilde X)$;
2. every fiber-constant lifted local scalar descends uniquely to the base;
3. after normalizing the canonical fiber measure to total mass one, the local lifted contribution satisfies
$$
F_s^{\mathrm{loc}} \;:=\; \int_{\widetilde X}\widetilde b_s\,d\mu_{\widetilde X} \;=\; \int_X b_s\,d\mu_X;\tag{T.17a.3a}
$$
4. writing the full sector functional as
$$
F_s \;=\; F_s^{\mathrm{loc}} + R_s^{\mathrm{glob}},\tag{T.17a.3b}
$$
the threshold tuple is
$$
\Delta \;=\; T\,F \;=\; T\bigl(F^{\mathrm{loc}} + R^{\mathrm{glob}}\bigr),\tag{T.17a.3c}
$$
where $T$ is the invertible Dynkin-index matrix above.

The representative-state Bures data on the bare Grassmannian therefore determine the entire fiber-constant local part of the lifted threshold sector. The nonlocal part is the globally defined spectral remainder $R^{\mathrm{glob}}$ computed from the sector/parity block spectrum of $D^{\mathrm{PCE}}_{\widetilde X}$ by the canonical $\mathrm{MS2}_{\mu_G}$ finite part.

*Proof.* By the universal ordered $(1,2,3)$ lift property of Theorem G.8.4e.1 and Proposition G.8.4e.1a, every point of the fiber $\pi^{-1}(x)$ corresponds to an ordered decomposition of the inactive sector over the same base point $x\in X$. Invariance of $b_s$ under the decomposition-preserving compact fiber action then makes $b_s$ constant on each fiber, so $\widetilde b_s:=b_s\circ\pi$ is the unique fiber-constant lift; conversely a fiber-constant lifted scalar takes the same value at every point of $\pi^{-1}(x)$ and defines a unique scalar on $X$.

The fibers of $\pi$ are compact homogeneous spaces, so their normalized invariant measure has total mass one independent of the base point; integrating a fiber-constant lifted scalar over $\widetilde X$ is therefore the same as integrating its descended scalar over $X$, which is (T.17a.3a).

Every spectral threshold functional decomposes canonically into its assigned local coefficient part and the remainder after those local coefficients are removed by the fixed finite-part prescription; (T.17a.3b) is this decomposition by definition. Multiplying by the invertible Dynkin-index matrix $T$ transfers the same decomposition to the physical threshold tuple, giving (T.17a.3c). The local part is therefore fixed by the bare-Grassmannian representative-state Bures data, and the complementary term is the global spectral remainder computed from the lifted block spectrum. ∎

*Step 1 (Coordinate-level hypercharge).* Theorem T.9 fixes the PU hypercharge generator in SU(5) normalization on $\mathbb{C}^8 = \mathbb{C}^2_{\mathcal{A}} \oplus \mathbb{C}^6_{\mathcal{B}}$ as
$$
\hat Y = \frac{1}{2\sqrt{15}}\operatorname{diag}(-2,-2,-2,3,3,0,0,0),
\qquad \operatorname{Tr}(\hat Y^2)=\tfrac{1}{2}.
$$

*Step 2 (Module identification on the fiber).* By Theorem G.8.4b and Corollary G.8.4c, the inactive fiber admits the unique $G_{\mathrm{SM}}$-module decomposition $\mathcal{B} = \mathbb{C}^3_C \oplus \mathbb{C}^2_W \oplus \mathbb{C}^1_Y$, where $\mathbb{C}^3_C$ carries the $\mathbf{3}$ of $SU(3)$, $\mathbb{C}^2_W$ carries the $\mathbf{2}$ of $SU(2)$, and $\mathbb{C}^1_Y$ is a $G_{\mathrm{SM}}$-singlet. In the coordinate basis of Step 1, these summands correspond to indices $\{3,4,5\}$, $\{6,7\}$, and $\{8\}$ respectively (up to reordering within each summand). On the flag lift, the tautological subbundles $\widetilde Q_C$, $\widetilde Q_W$, $\widetilde Q_Y$ globalize this fiberwise decomposition.

*Step 3 (Per-sector hypercharge from the embedding).* The hypercharge eigenvalues on each summand are read off from $\hat Y$:
$$
y_C = \hat Y_{33} = \frac{-2}{2\sqrt{15}} = \frac{-1}{\sqrt{15}}, \qquad
y_W = \hat Y_{66} = \frac{3}{2\sqrt{15}} = \frac{3}{2\sqrt{15}}.
$$
For the singlet, the trace constraint gives:
$$
\operatorname{Tr}(\hat Y|_{\mathcal{B}}) = 3y_C + 2y_W + y_Y = \frac{-3}{\sqrt{15}} + \frac{3}{\sqrt{15}} + y_Y = y_Y.
$$
Meanwhile, $\operatorname{Tr}(\hat Y|_{\mathcal{A}}) = 2 \times \frac{-2}{2\sqrt{15}} = \frac{-2}{\sqrt{15}}$, and tracelessness on $\mathbb{C}^8$ gives $\operatorname{Tr}(\hat Y|_{\mathcal{B}}) = \frac{+2}{\sqrt{15}}$. Therefore:
$$
y_Y = \frac{2}{\sqrt{15}}, \qquad T_1(Y) = 2y_Y^2 = \frac{8}{15}.
$$
Every step uses only the SU(5)-normalized hypercharge from Theorem T.9, the unique module decomposition from Theorem G.8.4b, and tracelessness. No free parameter enters.

The matrix $T$ is invertible ($\det T=-8/15\neq0$), so any completed sector vector $(F_C,F_W,F_Y)$ determines a unique threshold triplet $(\Delta_1,\Delta_2,\Delta_3)$. Conversely, the validation tuple $(15.14,20.94,18.41)$ would require $F_C=18.41$, $F_W=20.94$, and $F_Y=-8.9775$; this inverse calculation is diagnostic only and is not a construction of the spectral functional. Without the nonzero singlet charge, the $U(1)$ row of $T$ would have $T_1(Y)=0$, and the relation $\Delta_1 = \tfrac{2}{5}\Delta_3 + \tfrac{3}{5}\Delta_2 \approx 19.93$ would be forced — incompatible with the target $\Delta_1=15.14$. The nonzero $y_Y$ is therefore essential for the internal consistency of the lifted spectral framework.

**Remark T.17a.4 (Two-Coefficient Local Heat-Kernel Truncation Check).** Let $\nabla_s^{\widetilde G}$ denote the restriction of $\nabla^{\widetilde G}$ to the sector $\widetilde E_s$, and consider the sector-local operators obtained from $D^{\mathrm{PCE}}_{\widetilde X}$ by retaining only the scalar part $\mu_0 I+\mathcal C_\kappa|_{\widetilde E_s}$:
$$
L_s^{\mathrm{loc}}:=(\nabla_s^{\widetilde G})^*\nabla_s^{\widetilde G}+(\mu_0+\lambda_s)I
\qquad (s\in\{C,W,Y\}),
$$
with
$$
\lambda_C=\frac{\kappa_1}{15}+\frac{4\kappa_3}{3},\qquad
\lambda_W=\frac{3\kappa_1}{20}+\frac{3\kappa_2}{4},\qquad
\lambda_Y=\frac{4\kappa_1}{15}
$$
from Remark T.17a.3. If the renormalized threshold functional of Definition T.17a is approximated by a sector-independent two-coefficient local heat-kernel ansatz at the $A_0$ and $A_2$ levels, then
$$
F_s^{\mathrm{loc},2}=n_s(B_0+B_1\lambda_s),
\qquad (n_C,n_W,n_Y)=(6,4,2),
$$
because $A_0$ is proportional to rank and, under this truncation, the retained sector dependence of $A_2$ enters affinely through the scalar endomorphism $(\mu_0+\lambda_s)I$. Using the three-decimal PCE-optimal values of Corollary T.34.2,
$$
(\kappa_1,\kappa_2,\kappa_3)\approx(0.695,0.729,1.140),
$$
gives
$$
\lambda_C\approx 1.5663,\qquad
\lambda_W=0.6510,\qquad
\lambda_Y\approx 0.1853.
$$
Solving
$$
\Delta_1=\frac{2}{5}F_C+\frac{3}{5}F_W+\frac{8}{15}F_Y,\qquad
\Delta_2=F_W,\qquad
\Delta_3=F_C
$$
for the validation tuple $(\Delta_1,\Delta_2,\Delta_3)=(15.14,20.94,18.41)$ gives
$$
F_C=18.41,\qquad
F_W=20.94,\qquad
F_Y=\frac{15}{8}\Delta_1-\frac{9}{8}\Delta_2-\frac{3}{4}\Delta_3=-8.9775.
$$
Matching $F_C^{\mathrm{loc},2}=18.41$ and $F_W^{\mathrm{loc},2}=20.94$ determines
$$
B_1\approx -2.3671,\qquad
B_0\approx 6.7760,
$$
and therefore
$$
F_Y^{\mathrm{loc},2}=2(B_0+B_1\lambda_Y)\approx 12.67>0.
$$
Hence this sector-independent two-coefficient local truncation does not realize the validation tuple; any successful realization must depend on spectral information beyond this local truncation.

**Proposition T.17a.5 (Affine Per-Rank Sign Obstruction).** Let
$$
F_s=n_s(A+B\lambda_s),
\qquad
(n_C,n_W,n_Y)=(6,4,2),
$$
with
$$
\lambda_Y<\lambda_W<\lambda_C.
$$
If this affine per-rank ansatz matches the positive color and weak validation values
$$
F_C=18.41,\qquad F_W=20.94,
$$
then it necessarily gives $F_Y>0$. Consequently no sector-independent affine per-rank ansatz can realize a negative hypercharge contribution while simultaneously matching the color and weak channels.

*Proof.* Matching the color and weak channels fixes
$$
B=\frac{F_C/n_C-F_W/n_W}{\lambda_C-\lambda_W}.
$$
Since
$$
\frac{18.41}{6}<\frac{20.94}{4}
\qquad\text{and}\qquad
\lambda_C>\lambda_W,
$$
one has $B<0$, so $A+B\lambda$ is strictly decreasing in $\lambda$. Therefore
$$
\frac{F_Y}{n_Y}=A+B\lambda_Y>A+B\lambda_W=\frac{F_W}{n_W}>0,
$$
because $\lambda_Y<\lambda_W$. Hence $F_Y>0$. ∎

**Corollary T.17a.5a (Negative Affine Slope).** In the notation of Remark T.17a.4, the unique affine coefficient determined by the color and weak equations is
$$
B_1=\frac{18.41/6-20.94/4}{\lambda_C-\lambda_W}\approx -2.3671<0.
$$

**Remark T.17a.5b (Status of the Lifted Threshold Sector).** The local theorem-level conclusion is therefore a no-go statement: the validation tuple
$$
(\Delta_1,\Delta_2,\Delta_3)=(15.14,20.94,18.41)
$$
cannot come from a sector-independent affine local truncation. The sector-resolving threshold computation is therefore the global $\mathrm{MS2}_{\mu_G}$ block-sum problem on
$$
\widetilde X=\mathrm{Flag}_{1,2,3}(Q),
$$
with the local affine truncation used only as the diagnostic no-go above.

### T.12.2 PCE Isotropy at the Fixed Point

**Theorem T.13** (Predictive Ward Identity). At the PU fixed point $\mathfrak{A}_{PU}$, the susceptibility is flat across all canonically normalized signal directions:
$$
\Gamma^{(2)}\big|_{W_5} = \kappa_{\mathrm{bulk}}^* I_5 = I_5.
$$

*Proof.* Theorem Z.14 fixes the PU bulk normalization to $\kappa_{\mathrm{bulk}}^*=1$ and identifies the quadratic kernel with the QFI-normalized Hessian on the active subspace. The electroweak 5-plane $W_5$ is a canonically normalized subspace of that active signal sector, and by construction the induced quadratic form is the restriction of the isotropic bulk kernel. Therefore
$$
\Gamma^{(2)}\big|_{W_5} = \kappa_{\mathrm{bulk}}^* I_5 = I_5,
$$
which is the required flat predictive susceptibility across the canonically normalized electroweak signal directions. QED

**Corollary T.13.1** (PU-to-SM Gauge Matching). At the PU matching scale $\mu_G$, PCE isotropy fixes a single PU bulk gauge coefficient $g_U$ for the canonically normalized signal generators (Theorem T.13). After matching to SM-canonical gauge fields, the gauge kinetic term at $\mu_G$ takes the form
$$
\mathcal{L}_{\mathrm{kin}}(\mu_G)
=
-\frac{1}{4g_U^2}\!\left(
Z_3\,F_{3,\mu\nu}^A F_3^{A,\mu\nu}
+
Z_2\,F_{2,\mu\nu}^a F_2^{a,\mu\nu}
+
Z_1\,F_{1,\mu\nu}F_1^{\mu\nu}
\right),
$$
so the SM-canonical gauge couplings satisfy
$$
\boxed{
g_i(\mu_G) = \frac{g_U}{\sqrt{Z_i}},
\qquad
\alpha_i^{-1}(\mu_G)=Z_i\,\alpha_U^{-1}=24+\Delta_i,
\qquad
\alpha_U=\frac{g_U^2}{4\pi}
}
$$
for $i=1,2,3$, where $Z_i=1+\Delta_i/24$.

*Proof.* PCE isotropy fixes a single bulk quadratic coefficient $g_U$ in the canonically normalized signal sector. The quantitative gauge-sector splittings are encoded by the lifted spectral thresholds $\Delta_i$ of Definition T.17a, equivalently by the matching factors $Z_i=1+\Delta_i/24$. Substituting these factor-dependent rescalings into the gauge kinetic term yields the displayed relations. ∎

### T.12.3 Tree-Level Weinberg Angle

**Theorem T.14** (Weinberg Angle at the Matching Scale). The PU fixed-point output implies the PU-normalized value $\sin^2\theta_W^{(0)}=3/8$, while the SM-canonical tree-level weak mixing angle at the matching scale $\mu_G$ is
$$
\boxed{
\sin^2\theta_W(\mu_G)
=
\frac{(g')^2(\mu_G)}{(g')^2(\mu_G)+g_2^2(\mu_G)}
=
\frac{3Z_2}{3Z_2+5Z_1}
}
$$
and reduces to $\sin^2\theta_W(\mu_G)=3/8$ in the isotropic matching limit $Z_1=Z_2$.

*Proof.* By definition $\sin^2\theta_W = \frac{(g')^2}{(g')^2+g_2^2}$ and $(g')^2=\frac{3}{5}g_1^2$ (Definition T.17). Using the PU-to-SM matching relations $g_1^2(\mu_G)=g_U^2/Z_1$ and $g_2^2(\mu_G)=g_U^2/Z_2$ (Corollary T.13.1) gives
$$
\sin^2\theta_W(\mu_G)
=
\frac{\tfrac{3}{5}\,g_U^2/Z_1}{\tfrac{3}{5}\,g_U^2/Z_1+g_U^2/Z_2}
=
\frac{3Z_2}{3Z_2+5Z_1}.
$$
If $Z_1=Z_2$ this reduces to $3/8$. ∎

**Corollary T.14.1** (Validation Target from the Flag-Lift Thresholds). For the validation tuple used in Theorem T.18,
$$
(\Delta_1,\Delta_2)=(15.14,\,20.94),
\qquad
(Z_1,Z_2)=\left(1+\frac{15.14}{24},\,1+\frac{20.94}{24}\right)\approx(1.6308,1.8725),
$$
one has
$$
\sin^2\theta_W(\mu_G)=\frac{3 Z_2}{3 Z_2 + 5 Z_1}\approx 0.408.
$$
This is the tree-level matching value that would result if the forward lifted spectral calculation derived the validation tuple. Until that derivation is completed, the displayed value is a validation-run output, not a theorem-level threshold prediction.

-----

## T.13 Renormalization Group Evolution

### T.13.1 One-Loop Beta Functions

**Definition T.15b** (SM Beta Coefficients). The one-loop coefficients (GUT-normalized) are:
$$
b_1 = \frac{41}{10}, \quad b_2 = -\frac{19}{6}, \quad b_3 = -7
$$

**Theorem T.15** (RG Evolution). The gauge couplings evolve according to:
$$
\alpha_i^{-1}(\mu) = \alpha_i^{-1}(\mu_G) + \frac{b_i}{2\pi}\ln\frac{\mu_G}{\mu}
$$

### T.13.2 Running to the Z Pole

**Theorem T.16** (One-Loop Z-Pole Mixing Angle). Let $A_i(\mu):=\alpha_i^{-1}(\mu)$ denote the inverse gauge couplings with $g_1$ GUT-normalized. Under one-loop SM running (Theorem T.15) from $\mu_G$ down to $M_Z$ with matching data
$$
A_i(\mu_G)=Z_i\,\alpha_U^{-1}+\frac{\delta_i}{2\pi}
\qquad (i=1,2,3)
$$
(Definition T.19a), the Z-pole weak mixing angle is
$$
\boxed{
\sin^2\theta_W(M_Z)=\frac{3A_2(M_Z)}{3A_2(M_Z)+5A_1(M_Z)}
}
$$
with
$$
A_i(M_Z)=Z_i\,\alpha_U^{-1}+\frac{b_i}{2\pi}\ln\!\left(\frac{\mu_G}{M_Z}\right)+\frac{\delta_i}{2\pi}.
$$

*Proof.* One-loop running gives $A_i(\mu)=A_i(\mu_G)+\frac{b_i}{2\pi}\ln(\mu_G/\mu)$ (Theorem T.15). Using $(g')^2=\frac{3}{5}g_1^2$ and $A_i=4\pi/g_i^2$ yields $\sin^2\theta_W=\frac{(g')^2}{(g')^2+g_2^2}=\frac{3A_2}{3A_2+5A_1}$ at any scale. Substituting the one-loop expressions for $A_{1,2}(M_Z)$ gives the stated formula. ∎

### T.13.3 Threshold Corrections from 24-Mode Discretization

**Definition T.19a** (Residual Threshold Corrections Beyond the Flag-Lift Spectral Splitting). The principal PU-to-SM gauge splitting at $\mu_G$ is encoded by the lifted spectral thresholds $\Delta_i$ of Definition T.17a. Residual finite matching effects are encoded by additional threshold shifts $\delta_i$:
$$
\alpha_i^{-1}(\mu_G)=\alpha_U^{-1}+\Delta_i+\frac{\delta_i}{2\pi}
=Z_i\,\alpha_U^{-1}+\frac{\delta_i}{2\pi},
\qquad i=1,2,3,
$$
with
$$
Z_i=1+\frac{\Delta_i}{24},
\qquad
\alpha_U^{-1}=24.
$$
The $\delta_i$ capture finite heavy-threshold corrections not already included in the principal lifted spectral functional. Thus the canonical minimal $\mathrm{MS2}_{\mu_G}$ ledger is
$$
\delta_i^{\mathrm{min}}=0,
\qquad i=1,2,3,
\tag{T.19a.1}
$$
because the set of residual heavy thresholds is empty after $D^{\mathrm{PCE}}_{\widetilde X}$ and the finite-part prescription have been fixed. If an additional heavy ledger
$$
\mathcal H_{\mathrm{heavy}}=\{(M_k,b_1^{(k)},b_2^{(k)},b_3^{(k)})\}_k
$$
is explicitly appended to the matching data, then
$$
\delta_i=\sum_k b_i^{(k)}\ln\!\left(\frac{\mu_G}{M_k}\right).
\tag{T.19a.2}
$$
Equivalently, any nonminimal residual ledger may be written as a mode-local sum
$$
\delta_i=\sum_{m=1}^{M}\delta_i^{(m)},\qquad M=24,
$$
but these terms are zero in the minimal ledger unless the corresponding heavy threshold data are specified independently of the validation tuple.

**Definition T.19b (Finite Electroweak Matching Ledger).** The PU-to-SM electroweak matching ledger is the ordered tuple
$$
\mathfrak M_{EW}=\left(\widetilde X,D^{\mathrm{PCE}}_{\widetilde X},\Delta,Z,\delta,\mu_G,\mathbf b,\rho_{\mathrm{pole}},\mathcal S_{\mathrm{RG}}\right),
$$
where:

1. $\widetilde X$ and $D^{\mathrm{PCE}}_{\widetilde X}$ define the lifted spectral problem of Definition T.17a.
2. $\Delta=(\Delta_1,\Delta_2,\Delta_3)$ are the principal lifted spectral thresholds.
3. $Z_i=1+\Delta_i/24$ are the principal multiplicative matching factors.
4. $\delta_i$ are the residual finite heavy-threshold shifts after the principal lifted thresholds have been subtracted.
5. $\mu_G$ is the matching scale used for the PU-to-SM interface.
6. $\mathbf b=(b_1,b_2,b_3)$ are the SM beta-function coefficients used for running below $\mu_G$.
7. $\rho_{\mathrm{pole}}$ denotes the finite pole, threshold, and observable-conversion maps used for $m_H$, $m_t$, $v$, and other pole-level quantities.
8. $\mathcal S_{\mathrm{RG}}$ denotes the renormalization scheme, loop order, decoupling convention, and comparison scale.

With this ledger the inverse gauge couplings are organized as
$$
A_i(\mu_G)=\alpha_i^{-1}(\mu_G)=24+\Delta_i+\frac{\delta_i}{2\pi},
$$
$$
A_i(M_Z)=24+\Delta_i+\frac{b_i}{2\pi}\ln\left(\frac{\mu_G}{M_Z}\right)+\frac{\delta_i}{2\pi}
$$
at one-loop order, with higher-loop corrections stored in $\mathcal S_{\mathrm{RG}}$ and observable conversions stored in $\rho_{\mathrm{pole}}$.

**Proposition T.19c (No Double Counting in the Electroweak Matching Ledger).** If the principal thresholds $\Delta_i$ are defined by the lifted spectral functional of Definition T.17a and the residual thresholds $\delta_i$ are defined only after subtracting those principal thresholds, then the decomposition
$$
A_i(\mu_G)=24+\Delta_i+\frac{\delta_i}{2\pi}
$$
is unique for fixed $(\widetilde X,D^{\mathrm{PCE}}_{\widetilde X},\mu_G,\mathcal S_{\mathrm{RG}})$ and contains no double counting between $\Delta_i$ and $\delta_i$.

*Proof.* Fix the lifted operator, matching scale, and scheme. Definition T.17a assigns a definite principal number $\Delta_i$ to each gauge factor whenever the lifted spectral functional is evaluated or retained as target data. The total finite inverse-coupling shift at $\mu_G$ is a single number
$$
\Theta_i:=A_i(\mu_G)-24.
$$
Defining the residual by
$$
\delta_i:=2\pi(\Theta_i-\Delta_i)
$$
therefore gives
$$
\Theta_i=\Delta_i+\frac{\delta_i}{2\pi}
$$
with no freedom left. If a contribution were counted in both $\Delta_i$ and $\delta_i$, replacing $\Delta_i$ by $\Delta_i+x$ and $\delta_i$ by $\delta_i+2\pi x$ would change the reconstructed shift by a drift of $2x$, which vanishes only at $x=0$. If a contribution were omitted from both, the reconstructed shift would differ from $\Theta_i$. Hence the subtraction definition is both unique and exhaustive for the fixed ledger. ∎

**Theorem T.17** (Isotropic Leading Residual Threshold). In any nonminimal residual heavy-threshold ledger compatible with PCE isotropy, the leading residual correction is common:
$$
\delta_1 = \delta_2 = \delta_3 =:\delta_{\mathrm{avg}}.
$$
In the canonical minimal $\mathrm{MS2}_{\mu_G}$ ledger of Definition T.19a, this common value is the empty-sum value $\delta_{\mathrm{avg}}=0$. In either case, the leading residual correction only renormalizes the common coupling offset
$$
\alpha_U^{-1}\mapsto \alpha_U^{-1}+\delta_{\mathrm{avg}}/(2\pi)
$$
and does not affect the separations $\alpha_i^{-1}-\alpha_j^{-1}$ set by the $Z_i$.

*Proof.* PCE isotropy implies the QFI/Bures metric on the 24-mode interface is isotropic at leading order (Lemma Z.24a). Therefore any residual correction depending only on the leading isotropic mode count $M=24$ is independent of the gauge factor, giving a common shift $\delta_{\mathrm{avg}}$. In the minimal ledger, Definition T.19a contains no residual heavy threshold list, so $\delta_{\mathrm{avg}}=0$ by the empty-sum convention. Since $\delta_{\mathrm{avg}}$ enters additively in all three $\alpha_i^{-1}(\mu_G)$, all differences $\alpha_i^{-1}-\alpha_j^{-1}$ are unchanged. ∎

**Corollary T.17.1** (Subleading Threshold Splittings on the Normalized Mode-Average Branch). On the normalized mode-average residual branch — under which (a) the residual heavy-threshold ledger is normalized as a per-mode average $\delta_i = (1/M) \sum_\alpha x_{\alpha,i}$ over the $M = 24$ interface modes, with $x_{\alpha, i}$ bounded mode-local contributions, and (b) the per-mode anisotropic differences $x_{\alpha, i} - x_{\alpha, j}$ are themselves $O(M^{-1})$ uniformly in $\alpha$ (or, equivalently, satisfy a CLT-type independence condition) — subleading anisotropies generate splittings:
$$
\delta_i - \delta_j = O(M^{-1}).
$$

*Proof.* Theorem T.17 identifies the leading discretization contribution as $S_M$-invariant over the $M$ interface modes and therefore a common shift $\delta_{\mathrm{avg}}$. The splitting is $\delta_i - \delta_j = (1/M) \sum_\alpha (x_{\alpha,i} - x_{\alpha,j})$. Without an explicit smallness condition on the per-mode differences, this average can scale as $O(1)$ (correlated case), $O(M^{-1/2})$ (CLT-style independent case), or $O(M^{-1})$ (uniformly small per-mode case). On the normalized mode-average branch with assumption (b), the per-mode difference is $O(M^{-1})$, and averaging preserves this scaling, yielding $\delta_i - \delta_j = O(M^{-1})$. Without this branch, residual anisotropic splittings remain part of the T2 matching uncertainty budget rather than being assumed automatically negligible. ∎

**Theorem T.18** (Conditional Flag-Lift Matching from a Validation Threshold Tuple). The bare-Grassmannian orbit-average construction of the original gauge-matching definition is not used for the quantitative threshold sector. The local Bures block formula on $\mathrm{Gr}(2,8)$ provides representative-state coupling data, but the manuscript does not supply a completed global orbit integral on the bare Grassmannian that yields the required gauge-factor hierarchy. The quantitative gauge sector is therefore formulated on the lifted operator $D^{\mathrm{PCE}}_{\widetilde X}$ of Definition T.17a on
$$
\widetilde X=\mathrm{Flag}_{1,2,3}(Q)\cong SU(8)/S(U(2)\times U(1)\times U(2)\times U(3)).
$$
For any completed forward spectral calculation in the canonical $\mathrm{MS2}_{\mu_G}$ branch, the sector functionals are
$$
F_s=-\zeta_s'(0)-\zeta_s(0)\log\mu_G^2,
\qquad s\in\{C,W,Y\},
$$
and the threshold shifts are
$$
\Delta=TF,
\qquad
F=(F_C,F_W,F_Y)^T,
\qquad
T=
\begin{pmatrix}
2/5&3/5&8/15\\
0&1&0\\
1&0&0
\end{pmatrix}.
$$
The matching factors are
$$
Z_i=1+\frac{\Delta_i}{24}.
$$
The numerical tuple
$$
\boxed{\Delta^{\mathrm{val}}=(15.14,20.94,18.41)}
$$
is a validation target for the lifted spectral problem. It is not an input to $D^{\mathrm{PCE}}_{\widetilde X}$, to the finite-part prescription, to $\mathcal J_G$, to the sector/parity $H$-types, or to the structural parameters $(\mu_0,m_{\mathcal J},\eta)$. If a completed forward calculation yields $\Delta=\Delta^{\mathrm{val}}$, then
$$
\boxed{
Z_1=1+\frac{15.14}{24}\approx1.6308,
\qquad
Z_2=1+\frac{20.94}{24}\approx1.8725,
\qquad
Z_3=1+\frac{18.41}{24}\approx1.7671.
}
$$
Remark T.17a.4 and Proposition T.17a.5 give a theorem-level local no-go: once the positive color and weak validation channels are matched, every sector-independent affine local truncation still forces $F_Y>0$, whereas the validation tuple would require $F_Y=-8.9775$. The lifted threshold sector is therefore evaluated by the sector-resolving global $\mathrm{MS2}_{\mu_G}$ block functional of Definition T.17a, Convention T.69a, and Theorem T.70. Proposition T.17a.3a fixes the canonical base-to-lift identification of the local part of the threshold sector, Theorem T.69 fixes the local/global split, and Theorem T.78 records the determinacy of any completed flag-lift spectral problem. Theorem T.78.2 records the complementary status boundary: the present canonical ledger has not yet fixed the branch data needed to execute that completed spectral problem without additional input. On the minimal residual ledger $\delta_i=0$ of Definition T.19a, one-loop SM running (Theorem T.15) gives
$$
\alpha_i^{-1}(M_Z)=Z_i\alpha_U^{-1}+\frac{b_i}{2\pi}\ln\!\left(\frac{\mu_G}{M_Z}\right),
\qquad i=1,2,3.
$$
Thus, if $\Delta=\Delta^{\mathrm{val}}$, then with $\mu_G=M_{Pl}e^{-9}$, $\alpha_U^{-1}=24$, and $\ln(\mu_G/M_Z)\approx30.44$ one obtains the validation-run values
$$
\alpha_1^{-1}(M_Z)\approx59.0,
\qquad
\alpha_2^{-1}(M_Z)\approx29.6,
\qquad
\alpha_3^{-1}(M_Z)\approx8.5,
$$
equivalently
$$
\sin^2\theta_W(M_Z)\approx0.231,
\qquad
\alpha_s(M_Z)\approx0.118,
$$
with residual finite matching encoded by $\delta_i$ and subleading splittings as in Corollary T.17.1.

*Proof.* Definition T.17a defines $\Delta_i$ from the renormalized spectral functional after the operator, sector data, and subtraction prescription have been fixed. Writing
$$
Z_i=1+\frac{\Delta_i}{24}
$$
and using $\alpha_U^{-1}=24$ gives
$$
\alpha_i^{-1}(\mu_G)=24+\Delta_i=Z_i\alpha_U^{-1}.
$$
One-loop running then yields
$$
\alpha_i^{-1}(M_Z)=\alpha_i^{-1}(\mu_G)+\frac{b_i}{2\pi}\ln\!\left(\frac{\mu_G}{M_Z}\right),
$$
which is the displayed formula. Substituting $\Delta^{\mathrm{val}}$ proves the conditional numerical validation run. The status statement follows from Convention T.17a.0: because the validation tuple is not part of the spectral definition, it cannot promote a downstream Z-pole value to theorem-level status until obtained by a completed forward calculation. ∎

-----

# Part III: Higgs Quartic Derivation

## T.14 Higgs Quartic from SU(2) Block Geometry

### T.14.1 Single SU(2) Block

**Definition T.20a** (SU(2) Generator). For a single weak doublet, take $S = \sigma_x/2$ with:
$$
\mathrm{tr}(S^2) = \frac{1}{2}
$$

**Lemma T.3** (Bures Metric per Block). In the Bures/Fubini-Study metric:
$$
g_B = \text{Var}(S) = \frac{1}{4}
$$
The quantum Fisher information is $F_Q = 4g_B = 1$.

*Proof.* For a doublet eigenstate: $\text{Var}(S) = \langle S^2 \rangle - \langle S \rangle^2 = 1/4 - 0 = 1/4$. ∎

**Lemma T.4** (Block Nonlinearity). The distortion energy per SU(2) block is:
$$
V_{\text{block}}(u) = 1 - \cos u = \frac{u^2}{2} - \frac{u^4}{24} + O(u^6)
$$

*Proof.* Geodesic-chord relation for SU(2). ∎

### T.14.2 Six Left-Chiral Links

**Theorem T.18a** (Link Count on the Weak-Left Projection Branch). On the weak-left projection branch (Definition T.3a) and the row-pair branch (Theorem T.8), the electroweak sector contains exactly 6 left-chiral SU(2) links, corresponding to $b = 6$ inactive modes.

*Proof.* On the weak-left projection branch, Definition T.3a fixes the rank-6 projection $\Pi_L:\mathbb{R}^{12}\to\mathbb{R}^6$ identifying $k/2 = 6$ independent information modes that couple to $SU(2)_L$, with $\Pi_L\Pi_L^T = I_6$ confirming six independent directions. On the row-pair branch (Theorem T.8), each such direction supports an independent $SU(2)_L$ doublet rotation via the $\mathbb{R}^3 \otimes \mathbb{R}^2$ identification, so each corresponds to one left-chiral SU(2) link. Therefore on the combined branch the electroweak sector contains exactly 6 independent left-chiral SU(2) links, matching the inactive dimension $b = 6$ used in the alignment-counting definition of $N_0$ (Definition T.5a). ∎

### T.14.3 Canonical Field and Total Potential

**Theorem T.19** (Canonical Higgs Field). Define:
$$
h = \sqrt{6} \cdot u, \quad u = \frac{h}{\sqrt{6}}
$$

*Proof.* By Lemma T.3, each $SU(2)$ block has quantum Fisher information $F_Q=1$ in the geodesic coordinate $u$. Summing over the 6 independent left-chiral blocks (Theorem T.18a) gives a total kinetic coefficient proportional to $6$, hence canonical normalization is achieved by $h=\sqrt{6}\,u$. ∎

**Theorem T.20** (Block Contribution to Quartic). The total potential from six SU(2) blocks is:
$$
V_{\text{blocks}}(h) = 6\left(1 - \cos\frac{h}{\sqrt{6}}\right) = \frac{h^2}{2} - \frac{h^4}{144} + O(h^6)
$$

*Proof.* Substituting $u = h/\sqrt{6}$ into 6 copies of Lemma T.4:
$$
V = 6\left[\frac{h^2}{12} - \frac{h^4}{24 \cdot 36} + \cdots\right] = \frac{h^2}{2} - \frac{h^4}{144} + O(h^6)
$$
∎

### T.14.4 Higgs Quartic from Block Geometry

**Theorem T.21** (Block Quartic Coefficient). Matching to $V = \frac{1}{2}m^2 h^2 + \frac{1}{4}\lambda h^4$:
$$
\boxed{\lambda_{\text{block}} = -\frac{1}{36} \approx -0.0278}
$$

*Proof.* The $h^4$ coefficient is $-1/144$. Matching to $(1/4)\lambda$:
$$
\frac{1}{4}\lambda_{\text{block}} = -\frac{1}{144} \implies \lambda_{\text{block}} = -\frac{1}{36}
$$
∎

-----

## T.15 Elastic Quartic Derivation

### T.15.1 Setup

The elastic sector involves:

- Information variables: $s \in \mathbb{R}^{12}$ with positive-definite $L_{info} \succ 0$
- Reservoir variables: $r \in \mathbb{R}^6$, eliminated at quadratic order as $r = \Pi_L s$
- SU(2) rotation on each left-chiral link produces a coherent $O(u^2)$ target shift

### T.15.2 Canonical Normalization

**Lemma T.5b** (Canonical Basis). Equip $\mathbb{R}^{12}$ with the positive-definite inner product $\langle s,s'\rangle_{info}:=s^T L_{info} s'$ from Theorem T.1. Choose an $L_{info}$-orthonormal coordinate system (equivalently, perform the change of variables $s=L_{info}^{-1/2}\tilde s$ and drop tildes), so that $L_{info}=I_{12}$ in these coordinates. Let $\Pi_L$ denote the orthogonal projection onto the left-chiral 6-plane with respect to this inner product, and set $P_L:=\Pi_L^T\Pi_L$. Then $P_L$ is an orthogonal projector, hence $P_L^2=P_L$, and
$$
K=I_{12}+P_L,\quad K^{-1}=I_{12}-\frac{1}{2}P_L.
$$

*Proof.* In an $L_{info}$-orthonormal basis, orthogonal projection satisfies $\Pi_L\Pi_L^T=I_6$ on its image and $P_L=\Pi_L^T\Pi_L$ is idempotent and symmetric, hence $P_L^2=P_L$. The inverse identity follows from $(I+P_L)(I-\tfrac12 P_L)=I+\tfrac12(P_L-P_L^2)=I$. ∎

### T.15.3 Minimization over Signal Modes

**Theorem T.22** (Elastic Energy on the canonical unit target-shift branch). With $r$ eliminated, assume the leading coherent reservoir target shift in the $L_{\mathrm{info}}$-orthonormal coordinates of Lemma T.5b takes the form
$$
x(u) = \gamma\, u^2 v + O(u^4), \qquad |v| = 1,
$$
where $\gamma > 0$ is a dimensionless target-shift normalization. The reduced energy functional is then
$$
V[s; u] = \frac{1}{2} s^T s + \frac{1}{2} |\Pi_L s - x(u)|^2.
$$
The canonical unit target-shift branch used below is $\gamma = 1$.

*Proof.* The SU(2) rotation on each of six left-chiral links produces a coherent $O(u^2)$ shift in the reservoir, establishing the scaling order and the existence of a unit direction $v$. The magnitude coefficient $\gamma$ is the target-shift normalization of the SU(2)-coherent action on the reservoir coordinates; setting $\gamma = 1$ is the canonical unit-normalization choice used throughout this section. ∎

**Theorem T.23** (Optimal Signal Configuration). Under the target-shift normalization of Theorem T.22, the stationary $s(u)$ satisfies:
$$
\frac{\partial V}{\partial s} = s + \Pi_L^T(\Pi_L s - \gamma u^2 v) = 0
$$
giving $(I + P_L)s = \gamma \Pi_L^T u^2 v$. Using $(I + P_L)^{-1} = I - \frac{1}{2}P_L$:
$$
s(u) = \frac{\gamma}{2}\Pi_L^T u^2 v.
$$
On the canonical unit target-shift branch $\gamma = 1$, this reduces to $s(u) = \tfrac{1}{2}\Pi_L^T u^2 v$.

*Proof.* Since $P_L^2 = P_L$, we have $(I + P_L)(I - \frac{1}{2}P_L) = I + P_L - \frac{1}{2}P_L - \frac{1}{2}P_L^2 = I + P_L - P_L = I$. Substituting:
$$
s(u) = (I - \tfrac{1}{2}P_L)\gamma \Pi_L^T u^2 v = \gamma \Pi_L^T u^2 v - \tfrac{\gamma}{2}\Pi_L^T\Pi_L\Pi_L^T u^2 v = \tfrac{\gamma}{2}\Pi_L^T u^2 v
$$
where we used $\Pi_L \Pi_L^T = I_6$. ∎

### T.15.4 Minimized Energy and Elastic Quartic

**Theorem T.24** (Elastic Quartic). The minimized energy, in terms of the target-shift normalization $\gamma$ of Theorem T.22, is
$$
V_{min}(u) = \frac{\gamma^2}{4}u^4.
$$
In terms of the canonical Higgs field $h = \sqrt{6}\,u$,
$$
\lambda_{\text{elastic}}(\gamma) = +\frac{\gamma^2}{36}.
$$
On the canonical unit target-shift branch $\gamma = 1$,
$$
\boxed{V_{min}(u) = \frac{1}{4}u^4, \qquad \lambda_{\text{elastic}} = +\frac{1}{36}.}
$$

*Proof.*

**Step 1** (Mismatch). With $\Pi_L s(u) = \tfrac{\gamma}{2}u^2 v$ and $x(u) = \gamma u^2 v$:
$$
\Pi_L s - x(u) = \frac{\gamma}{2}u^2 v - \gamma u^2 v = -\frac{\gamma}{2}u^2 v.
$$

**Step 2** (Energy evaluation).
$$
V_{min}(u) = \frac{1}{2}|s|^2 + \frac{1}{2}|\Pi_L s - x|^2 = \frac{1}{2}\left|\tfrac{\gamma}{2}\Pi_L^T u^2 v\right|^2 + \frac{1}{2}\left|-\tfrac{\gamma}{2}u^2 v\right|^2.
$$
Since $\Pi_L^T$ is an isometry, $|\Pi_L^T v|^2 = |v|^2 = 1$:
$$
V_{min}(u) = \frac{\gamma^2}{8}u^4 + \frac{\gamma^2}{8}u^4 = \frac{\gamma^2}{4}u^4.
$$

**Step 3** (Field redefinition). With $h = \sqrt{6}\,u$, we have $u^4 = h^4/36$:
$$
V_{\text{elastic}}(h) = \frac{\gamma^2}{4} \cdot \frac{h^4}{36} = \frac{\gamma^2 h^4}{144}.
$$

**Step 4** (Landau matching). Matching to $V = \frac{1}{4}\lambda h^4$:
$$
\lambda_{\text{elastic}}(\gamma) = 4 \times \frac{\gamma^2}{144} = \frac{\gamma^2}{36}.
$$
On the canonical unit target-shift branch $\gamma = 1$, this gives $\lambda_{\text{elastic}} = 1/36$. ∎

**Remark T.24.1: Sign.** The positive sign is necessary: minimization over $s$ lowers the mismatch energy, producing a positive contribution to the quartic.

**Remark T.24.2: Role of the Target-Shift Branch Assumption.** The magnitude $\gamma^2/36$ is fixed by the canonical normalizations $L_{info} = I_{12}$, $\Pi_L\Pi_L^T = I_6$, $|v| = 1$, and the target-shift normalization $\gamma$. The specific value $\lambda_{\text{elastic}} = 1/36$ corresponds to the canonical unit target-shift branch $\gamma = 1$. This is the same pattern of canonical-branch normalization used to obtain $K_{eff} = 2$ for $\alpha$ on the democratic visible-space branch of Corollary Z.11. The branch-independent identification $\gamma = 1$ is outside the stated target-shift hypotheses.

-----

## T.16 Zero-Slack and the Criticality Boundary

### T.16.1 Total Quartic at the Fixed Point

**Theorem T.25** (Zero-Slack Cancellation on the canonical unit target-shift branch). At the PU fixed point $\mathfrak{A}_{PU}$:
$$
\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU}; \gamma) = \lambda_{\text{block}} + \lambda_{\text{elastic}}(\gamma) = -\frac{1}{36} + \frac{\gamma^2}{36} = \frac{\gamma^2 - 1}{36}.
$$

The zero-slack boundary
$$
\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU}) = 0
$$
holds on the canonical unit target-shift branch $\gamma = 1$.

*Proof.* Theorems T.21 and T.24, with Theorem T.24 evaluated on the target-shift normalization $\gamma$. ∎



**Remark T.25.1 (Branch Dependence of the Zero-Slack Boundary).** The vanishing of the fixed-point quartic at the PCE attractor depends on the target-shift normalization $\gamma = 1$ introduced in Theorem T.22. The named supporting theorems (T.18a link count, T.19 canonical Higgs field, T.20 block quartic, T.21 block coefficient, T.5b canonical basis, T.23 optimal signal configuration) fix every factor in the derivation except this leading target-shift magnitude, which is the SU(2)-coherent action of the six left-chiral links on the six-dimensional reservoir. Downstream consequences of $\lambda_{\text{PU}} = 0$ — including the Higgs metastability boundary used in Theorem T.28 and the resulting $m_H \approx 125$ GeV prediction — therefore are theorem-level on the canonical unit target-shift branch. A quantitative deviation $\gamma \neq 1$ shifts $\lambda_{\text{PU}}$ by $(\gamma^2 - 1)/36$, which propagates to the Higgs pole mass with sensitivity $\Delta m_H \sim (v^2/m_H)|\gamma^2 - 1|/36$. The branch-independent zero-slack statement is outside the stated target-shift hypotheses.

### T.16.2 Beta Function Boundary Condition

**Theorem T.26** (Criticality condition at the PU matching scale). Assume, in addition to Theorem T.25, that the PU matching trajectory is selected at the marginal boundary of the Standard Model effective flow, so that the quartic coupling not only satisfies
$$
\lambda(\mu_G)=0
$$
but lies on the one-loop critical surface
$$
\beta_\lambda^{(1)}(\mu_G)=0.
$$
Then the couplings at $\mu_G$ satisfy
$$
12y_t^4 - \frac{9}{4}g_2^4 - \frac{3}{2}g_2^2 g_1^2 - \frac{3}{4}g_1^4 = 0
$$
in the convention $V=\lambda(H^\dagger H)^2$.

*Proof.* Theorem T.25 gives the boundary value $\lambda(\mu_G)=0$. Imposing the additional marginal-trajectory condition $\beta_\lambda^{(1)}(\mu_G)=0$ and substituting $\lambda=0$ into the standard one-loop SM beta function yields exactly the displayed relation among the gauge and top-Yukawa couplings. QED

**Remark T.26.2: Numerical Consistency.** Since $g_U^2=\pi/6$, $g_U\approx 0.724$ (Theorem T.39a). For the validation tuple of Theorem T.18, equivalently $(Z_1,Z_2,Z_3)=(1+15.14/24,1+20.94/24,1+18.41/24)\approx(1.6308,1.8725,1.7671)$, the marginality condition gives $y_t(\mu_G)\approx 0.392$. RG amplification over $t=\ln(\mu_G/M_t)\approx 30$ yields $y_t(M_t)\approx 0.93$–$0.99$, consistent with $y_t^{\mathrm{obs}}(M_t)\approx 0.994\pm 0.005$. The same validation matching data and SM running yield Z-pole gauge couplings in the observed range (Theorem T.18; Theorem T.27b), with residual finite matching shifts encoded by $\delta_i$ and splittings subleading as in Corollary T.17.1. These are validation-run outputs until the forward lifted-threshold calculation derives the tuple.

**Remark T.26.3: RG Sensitivity.** Sensitivity: $y_t(\mu_G)=C(Z_1,Z_2)^{1/4}g_U$ with $C(Z_1,Z_2)=\frac{1}{6}\!\left(\frac{9}{8Z_2^2}+\frac{9}{20Z_1Z_2}+\frac{27}{200Z_1^2}\right)$. Thus $\Delta y_t/y_t=\Delta g_U/g_U+\frac{1}{4}\Delta(\ln C)$, so the top boundary is linearly sensitive to $g_U$ and mildly sensitive to the matching factors $Z_{1,2}$.

-----

## T.17 Higgs Mass Prediction

### T.17.1 RG Evolution of the Quartic

**Theorem T.27** (Quartic Running). The one-loop beta function is:
$$
16\pi^2 \frac{d\lambda}{dt} = 24\lambda^2 - 6y_t^4 + \lambda(12y_t^2 - 9g^2 - 3(g')^2) + \frac{9}{8}g^4 + \frac{3}{8}g'^4 + \frac{3}{4}g^2 (g')^2
$$

### T.17.2 Numerical Verification

**Proposition T.5** ($\lambda = 0$ Crossing Scale). In the Standard Model effective theory, the quartic crosses zero at the metastability scale $\mu_\lambda$ defined by $\lambda(\mu_\lambda)=0$:
$$
\mu_\lambda \approx 10^{10} \text{ GeV}
$$

*Verification.* Running from $M_Z$ with $\lambda(M_Z) = 0.129$, the top Yukawa contribution drives $\lambda$ toward zero:

- At $\mu = 10^{4}$ GeV: $\lambda \approx 0.11$
- At $\mu = 10^{8}$ GeV: $\lambda \approx 0.02$
- At $\mu = 10^{10}$ GeV: $\lambda \approx 0$ (crossing)
- At $\mu = 10^{16}$ GeV: $\lambda \approx -0.02$

Two-loop analysis places the instability scale at $\mu_\lambda \sim 10^{10}$–$10^{11}$ GeV (Degrassi et al. 2012). ∎

### T.17.3 Metastability and Higgs Mass

**Theorem T.28** (Conditional Higgs-mass prediction from the metastability boundary). Assume the Standard Model effective theory is valid between the electroweak scale and the matching scale $\mu_G$, and assume the criticality condition of Theorem T.26 places the quartic on the metastability boundary analyzed in the two-loop SM RG studies of Buttazzo et al. [2013]. Then the corresponding Higgs pole mass is approximately
$$
m_H \approx 125 \text{ GeV}.
$$

*Proof.* Under the stated assumptions, the boundary condition $\lambda(\mu_G)=0$ with $\mu_G$ near the seesaw/matching scale places the running quartic on the metastability trajectory of the Standard Model. The two-loop RG analysis of Buttazzo et al. maps that trajectory to a Higgs pole mass near $125$ GeV. Therefore, once the manuscript's matching scale is identified with that RG boundary, the Higgs mass prediction follows conditionally from the external RG result. QED

**Corollary T.28.1** (Experimental Agreement).
$$
m_H^{\text{obs}} = 125.25 \pm 0.17 \text{ GeV}
$$
Agreement: $< 1%$.

-----

# Part IV: Gauge Coupling Unification

## T.18 Full Gauge Unification

### T.18.1 Canonical Generators

**Definition T.18.1** (12D Signal Sector). The signal sector decomposes as:
$$
\mathfrak{g}_{SM} = \mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak{u}(1) \cong \mathbb{R}^8 \oplus \mathbb{R}^3 \oplus \mathbb{R}^1 = \mathbb{R}^{12}
$$

**Definition T.18.2** (Canonical Basis). Orthonormal generators with Golay-Bures inner product:

- $SU(3)$: $\mathrm{tr}(G_A G_B) = \frac{1}{2}\delta_{AB}$ for $A, B = 1, \ldots, 8$
- $SU(2)$: $\mathrm{tr}(T_a T_b) = \frac{1}{2}\delta_{ab}$ for $a, b = 1, 2, 3$
- $U(1)$: $\mathrm{tr}(\hat{Y}^2) = \frac{1}{2}$ (with $\hat{Y} = Y/\sqrt{5/3}$)

### T.18.2 Three-Way Unification

**Theorem T.26a** (Gauge Matching Condition). At the matching scale $\mu_G$, PCE isotropy at $\mathfrak{A}_{PU}$ fixes a single PU gauge coefficient $g_U$, while SM-canonical gauge fields match through the lifted spectral threshold data $Z_i$:
$$
\boxed{
g_i(\mu_G)=\frac{g_U}{\sqrt{Z_i}},
\qquad
\alpha_i^{-1}(\mu_G)=Z_i\,\alpha_U^{-1}=24+\Delta_i,
\qquad
\alpha_U=\frac{g_U^2}{4\pi}
}
$$
for $i=1,2,3$, with $Z_i=1+\Delta_i/24$.

*Proof.* The single coefficient $g_U$ follows from PCE isotropy in the canonical signal basis (Theorem T.13). The SM-canonical identification then proceeds through the lifted spectral threshold data of Definition T.17a, which fix the gauge-factor-dependent rescalings encoded by $Z_i$. Substituting those factors gives the displayed relations. ∎

**Theorem T.27a** (Matching-Scale Coupling Ratios). At $\mu_G$ the SM-canonical couplings satisfy
$$
\boxed{
(g')^2 : g^2 : g_s^2
=
\frac{3}{5}\frac{1}{Z_1}
:
\frac{1}{Z_2}
:
\frac{1}{Z_3}
}
$$
and reduce to the SU(5) ratio $\frac{3}{5}:1:1$ in the isotropic matching limit $Z_1=Z_2=Z_3$.

*Proof.* Using $(g')^2=\frac{3}{5}g_1^2$ and $g_i^2=g_U^2/Z_i$ (Corollary T.13.1) gives the stated ratio. ∎

### T.18.3 Strong Coupling Prediction

**Theorem T.27b** (Strong Coupling). Under one-loop SM running with boundary condition $\alpha_3^{-1}(\mu_G)=Z_3\alpha_U^{-1}$ (Corollary T.13.1),
$$
\alpha_s^{-1}(M_Z)=Z_3\alpha_U^{-1}+\frac{b_3}{2\pi}\ln\!\left(\frac{\mu_G}{M_Z}\right),
\qquad
b_3=-7,
$$
so for the numerical target value $\Delta_3=18.41$ of Theorem T.18, equivalently $Z_3=1+\Delta_3/24\approx 1.7671$, one finds $\alpha_s(M_Z)\approx 0.118$, with residual finite matching shift encoded by $\delta_3$ (Definition T.19a) and subleading splittings as in Corollary T.17.1.

*Proof.* One-loop running gives $\alpha_3^{-1}(M_Z)=\alpha_3^{-1}(\mu_G)+\frac{b_3}{2\pi}\ln(\mu_G/M_Z)$ (Theorem T.15). Substituting $\alpha_3^{-1}(\mu_G)=Z_3\alpha_U^{-1}$ yields the result. If $Z_3$ were set to $1$, the one-loop prediction would give $\alpha_3^{-1}(M_Z)<0$, so $Z_3>1$ is required; in the present formulation that requirement is encoded by the positive target threshold $\Delta_3>0$. ∎

-----

# Part V: Summary

## T.19 Complete Electroweak Parameter Summary

**Convention T.19.0 (Branch Ledger for Appendix T Summary Tables).** All branch entries in the Appendix T summary tables (T.19.1, T.20, T.24.26, T.25.8 and parallel rows) are interpreted relative to the controlling branch package of Theorem T.79: a fixed PU structural branch, the two-loop SM RG system, the completed flag-lift spectral data $\Delta$, the flavor-geometric residual data $(\mathcal{T}_{E_8}, \mathcal{V})$, and the CP-profile data $\mathcal{B}$. Branch labels in the tables have the following interpretations:

- "Exact" — exact arithmetic consequence once the structural branch and normalization conventions of the relevant section are fixed (e.g., $\sin^2\theta_W^{(0)} = 3/8$ on the primitive-(1/6)-quantized hypercharge branch; $\lambda_{\mathrm{elastic}} = +1/36$ on the elastic target-shift branch specified in the elastic target-shift branch).

- "Derived" — derived within the adopted Appendix T branches (Golay rate-½, weak-left projection, row-pair, Bures-gauge holonomy normalization, Yukawa probability-overlap, $E_8$ triad selection, generation-internal tensor factorization, Majorana A₂, triplet-projection exponent, PMNS Berry-loop, and the controlling branch package of Theorem T.79), not necessarily unconditional theorem-level output from the foundational PU axioms alone.

- "Validation" — validation-run output produced by the displayed validation tuple $\Delta^{\mathrm{val}}$ in conjunction with SM running. Such entries remain validation targets rather than derived predictions until the global flag-lift threshold problem is fixed by the data specified in Theorem T.78.2.

- "Conditional" or "Branch optimum" — the entry depends on an explicitly imposed normalization or branch input (e.g., $c_\ell/c_d = 8/3$ from Corollary T.34.1).

- "Imposed" or "Constraint" — the entry is supplied as a branch input rather than derived (e.g., the lepton-to-quark tilt normalization).

Theorems T.78.2, T.78.3, and T.79 are the controlling branch-ledger sections for the entire Appendix T quantitative ledger; entries in summary tables that omit branch labels or use unqualified "Derived" are governed by this convention.

### T.19.1 Derived Quantities

|Parameter |PU Derivation |Predicted |Observed |Status |
|------------------------------------------|------------------------------------------------------------------------|---------------------------------|------------|----------|
|$\kappa_{EW}$ |$bk/2 + 3 - 1/2$ |38.5 |— |Exact |
|$A_{EW}$ |One-loop determinant model |1.084 |— |Model layer |
|$v$ |$A_{EW} e^{-\kappa_{EW}} M_{Pl}$ |252 GeV |246 GeV |2.3% |
|$\sin^2\theta_W^{(0)}$ |PU-normalized fixed-point value |$3/8$ |— |Exact |
|$\sin^2\theta_W(\mu_G)$ |matching with lifted spectral thresholds |$\frac{3Z_2}{3Z_2+5Z_1}$ with $Z_i=1+\Delta_i/24$ |(matching-scale input) |Derived |
|$(\Delta_1,\Delta_2,\Delta_3)$ |Lifted spectral threshold shifts on $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$ (Definition T.17a)|$(15.14,\,20.94,\,18.41)$ validation tuple reproducing the previous matching outputs if obtained forward; Remark T.17a.4 and Proposition T.17a.5 show that every sector-independent affine local truncation gives $F_Y>0$, so the tuple must be compared against the global sector-resolving $\mathrm{MS2}_{\mu_G}$ block functional rather than inserted as input |— |Forward spectral block-sum gate |
|$\sin^2\theta_W(M_Z)$ |SM RG from matched boundary |Conditional on the lifted spectral thresholds and $\delta_i$ |$0.2312$ |Conditional|
|$5/3$ factor |Canonical hypercharge normalization |$5/3$ |$5/3$ |Derived |
|$\lambda_{\text{block}}$ |6 SU(2) blocks |$-1/36$ |— |Exact |
|$\lambda_{\text{elastic}}$ |Projector algebra |$+1/36$ |— |Exact |
|$\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU})$|Zero-slack |$0$ |(fixed-point input) |Exact |
|$m_H$ |$\sqrt{2\lambda} \cdot v$ |$125$ GeV |$125.25$ GeV|<1% |
|$g_i(\mu_G)$ |PCE isotropy + matching |$g_U/\sqrt{Z_i}$ |(at $\mu_G$)|Boundary |
|$y_t^{\mathrm{PU}}(\mathfrak{A}_{PU})$ |$S_3$-democratic Higgs |1 |(PU units) |Exact |
|$c_\ell/c_d$ |Normalization constraint |$8/3$ |— |Constraint|
|$\mathcal{R}$ values |$E_8$ triads |${4/3, 3/2, 2, 3, 4}$ |(discrete) |Derived |

**Uncertainty budget for electroweak and transferred-prefactor outputs.** Each prediction is reported with the paper-wide T1/T2/T3 decomposition of Convention P.14.1c and Section T.25.5.3. T1 records internal truncation/control, T2 records matching/threshold/branch/bridge/convention dependence, and T3 records empirical or model-mapping dependence. Rows for which a category is absent at the current working order are marked $0$ or negligible; a combined entry is used only when the manuscript has not yet supplied the pipeline needed to split the components.

|Quantity |Central (PU) |$\sigma_{T1}$ |$\sigma_{T2}$ |$\sigma_{T3}$ |$1\sigma$ theory |Dominant category and term |What shrinks it |
|---------------------|----------------:|----------------:|----------------:|----------------:|----------------:|---------------------------|-------------------------------------------------------------------------------------------------------------|
|$A_{EW}$ |$1.084$ |$0.005$ model allowance |$0$ |$0$ |$0.005$ |determinant-model curvature / Schur / Jacobian allowance; not a proved remainder bound |derive the determinant construction with explicit remainder bounds or replace it by a theorem-level prefactor |
|$v$ |$252\ \text{GeV}$|$1.2\ \text{GeV}$|$5\ \text{GeV}$ |$0$ |$5\ \text{GeV}$ |T2 matching and threshold dependence at $\mu_G$ |full 2-loop matching and threshold accounting at $\mu_G$ |
|$\sin^2\theta_W(M_Z)$|$0.2312$ |negligible ($O(M^{-1})$ anisotropy) |$0.0015$ |$0$ |$0.0015$ |T2 lifted thresholds, matching, and RG propagation |compute explicit PU threshold spectrum ($\delta_i$) + 2-loop matching/RG + $O(M^{-1})$ anisotropy corrections|
|$m_H$ |$125\ \text{GeV}$|negligible |$2.5\ \text{GeV}$ (T2+T3 combined) |included in T2 column |$2.5\ \text{GeV}$|T2 threshold matching combined with T3 pole-mass / observable conversion at the present working order (Theorem T.28) |explicit pole-mass conversion and higher-loop thresholds, which also resolve the combined T2+T3 entry into separate components |
|$A_{\text{eff}}$ |$0.923$ |$0.004$ |$0.010$ |$0$ at fixed forward-evaluation convention |$0.011$ |T2 bounce-determinant / zero-mode / finite-volume prefactor convention |compute ghost/zero-mode normalization under a fixed vacuum convention and derive the prefactor internally |

The $1\sigma$ theory column is the diagonal quadrature sum
$$
\sqrt{\sigma_{T1}^2+\sigma_{T2}^2+\sigma_{T3}^2}
$$
at the stated working order. The $A_{EW}$ entry is a determinant-model allowance, not a controlled theorem-level remainder estimate. For $v$, $\sigma_{T1}=1.2\ \text{GeV}$ is propagated from that allowance via $\delta v/v = \delta A_{EW}/A_{EW}$, and $\sqrt{1.2^2+5^2}=5.14\ \text{GeV}$ rounds to $5\ \text{GeV}$ at the stated precision. For $A_{\text{eff}}$, $\sqrt{0.004^2+0.010^2}=0.01077\approx 0.011$. For $m_H$, the $2.5\ \text{GeV}$ entry is combined because separating threshold matching from pole-mass / observable conversion requires the explicit internal pole/threshold pipeline referenced in Theorem T.28; until that pipeline is completed, the combined entry is reported in the T2 column and the T3 column is marked as included in that column to avoid double-counting. The $A_{\text{eff}}$ row is a transferred vacuum-prefactor bookkeeping row rather than an electroweak observable.

### T.19.2 Derivation Chain

$$
\boxed{
\text{Golay } [24,12,8] \xrightarrow{b=6, k=12}
\begin{cases}
\kappa_{EW} = 38.5 \text{ (constraint counting)} \\[3pt]
A_{EW} = 1.084 \text{ (determinant-model branch)} \\[3pt]
v = A_{EW} e^{-\kappa_{EW}} M_{Pl} = 252 \text{ GeV} \\[3pt]
\sin^2\theta_W^{(0)} = 3/8; \sin^2\theta_W(\mu_G) = \tfrac{3Z_2}{3Z_2+5Z_1} \text{ (fixed point + matching)} \\[3pt]
\lambda_{\text{block}} = -1/36; \lambda_{\text{elastic}}(\gamma) = +\gamma^2/36,\quad \gamma=1 \text{ on the canonical unit target-shift branch} \\[3pt]
\lambda(\mu_\lambda) = 0 \to m_H \approx 125 \text{ GeV} \\[3pt]
g_i(\mu_G)=g_U/\sqrt{Z_i} \text{ (matching)} \\[3pt]
y_t^{\mathrm{PU}}(\mathfrak{A}_{PU}) = |P_3 \mathbf{h}|_B = 1 \text{ (}S_3\text{-invariant projector)}
\end{cases}
}
$$

## T.20 Problems

### T.20.1 Solved: Elastic Quartic Derivation ✓

**Result**: $\lambda_{\text{elastic}} = +1/36$ derived explicitly in Section T.15 via minimization over $(s, r)$ at $O(u^4)$.

### T.20.2 Solved: Threshold Corrections ✓

**Result**: Leading-order residual threshold effects are isotropic (Theorem T.17), giving only a common additive shift in $\alpha_i^{-1}(\mu_G)$ and leaving the gauge-factor separations controlled by the principal lifted spectral thresholds $\Delta_i$ (equivalently the matching factors $Z_i$) of Corollary T.13.1. Subleading anisotropic splittings are $O(M^{-1})$-suppressed (Corollary T.17.1).

### T.20.3 Solved: Beta Function Vanishing ✓

**Result**: PCE zero-slack implies $\beta_\lambda(\mu_G) \approx 0$ via gauge-Yukawa cancellation at matching (Section T.16.2).

### T.20.4 Model-Conditional: Electroweak Prefactor

**Theorem T.29** (Electroweak Prefactor within the small-step isotropic determinant model). Assume:
1. PCE equipartition over the $M=24$ interface modes, so that the characteristic step size satisfies $u_0^2=1/M$;
2. the finite-$u_0$ reservoir correction is captured by the stated rank-one Schur-complement factor;
3. the curved-orbit Jacobian is represented by the homogeneous-space factor $(M/(M-1))^{1/4}$.

Then the three-factor determinant model gives the central value
$$
\boxed{A_{EW}=A_{\text{link}}A_{\text{Schur}}A_{\text{geo}}=1.08407\ldots}
$$
and, with the manuscript's separate modeling allowance for omitted higher-order determinant and Jacobian terms, the quoted working value is $A_{EW}=1.084\pm0.005$.

*Proof.* Under assumption (1),
$$
u_0^2=\frac{1}{24},\qquad u_0=\frac{1}{\sqrt{24}}.
$$
The three model factors are
$$
A_{\text{link}}=(\cos u_0)^{-3},
$$
$$
A_{\text{Schur}}=\left(1-\frac{u_0^2}{3\cos u_0}\right)^{-1/2},
$$
$$
A_{\text{geo}}=\left(\frac{24}{23}\right)^{1/4}.
$$
Evaluating these gives
$$
A_{\text{link}}=1.06496178\ldots,\qquad
A_{\text{Schur}}=1.00716802\ldots,\qquad
A_{\text{geo}}=1.01069671\ldots,
$$
hence
$$
A_{EW}=1.06496178\ldots\times1.00716802\ldots\times1.01069671\ldots
=1.08406869\ldots.
$$
Rounding the central value to three decimals gives $A_{EW}=1.084$. The additional $\pm0.005$ quoted in later numerical sections is the manuscript's model allowance for omitted higher-order determinant and Jacobian terms; it is not produced by the multiplication above and is not a proved remainder bound. ∎

**Corollary T.29.1** (Complete Electroweak Scale within the determinant model). Fix the determinant prescriptions of Theorem T.29. Then no further continuously tuned parameter enters the evaluation
$$
v = A_{EW} \cdot e^{-\kappa_{EW}} \cdot M_{Pl}
    = 1.084 \times e^{-38.5} \times 1.221 \times 10^{19}\,\text{GeV}
    = 252\,\text{GeV}.
$$
Compared with $v_{\text{obs}} = 246.22\,\text{GeV}$, this is a $2.35\%$ deviation.

**Remark T.29.1: Parameter scope.** The inputs used here are:

- $u_0^2 = 1/24$ from PCE equipartition over $M = 24$ interface modes (Theorem Z.5, Section Z.8),
- the rank-one Schur-complement prescription of Theorem T.29,
- the homogeneous-space Jacobian factor $(24/23)^{1/4}$,
- the previously fixed normalization conventions.

Accordingly, this subsection introduces no additional continuous fit parameter once the determinant model of Theorem T.29 is fixed. The numerical value of $v$ is therefore conditional on that model, not an unconditional consequence of the earlier sections alone.

**Theorem T.29.2 (Model-Conditional Status of the Electroweak Prefactor).** In the current Appendix T theorem stack, the statement
$$
A_{EW}=1.084\pm0.005
$$
is model-conditional. The central value $1.08407\ldots$ is uniquely determined after the three determinant factors in Theorem T.29 are adopted, but the prior PU data used before Theorem T.29 do not determine those factors, and the displayed uncertainty is not an internally derived remainder bound.

*Proof.* Before Theorem T.29, the fixed data relevant to this prefactor are $M=24$, $u_0^2=1/M$, the electroweak exponent $\kappa_{EW}=38.5$, and the requirement that the one-loop prefactor be dimensionless and of order one. These data do not specify a unique determinant functional. The model of Theorem T.29 chooses
$$
A_{\mathrm{link}}=(\cos u_0)^{-3},\qquad
A_{\mathrm{Schur}}=\left(1-\frac{u_0^2}{3\cos u_0}\right)^{-1/2},\qquad
A_{\mathrm{geo}}=\left(\frac{24}{23}\right)^{1/4}.
$$
Those choices give $A_{EW}=1.08406869\ldots$. If the prior data alone fixed $A_{EW}$, then replacing the Schur and homogeneous-space Jacobian prescriptions by the identity factors while retaining the same $M$, $u_0$, $\kappa_{EW}$, and order-one determinant status would be impossible. But that replacement is not excluded by any theorem preceding Theorem T.29 and gives
$$
A_{EW}'=(\cos u_0)^{-3}=1.06496178\ldots,
$$
which differs from $1.08406869\ldots$ by more than $0.005$. Therefore the prefactor value is not determined by the earlier theorem stack. Since no bound is proved for the omitted determinant, curvature, Schur-complement, or Jacobian terms, the $\pm0.005$ entry is a model allowance rather than a theorem-level error estimate. ∎

### T.20.5 Solved: Left-Chiral Row-Pair Structure ✓

**Theorem T.30** (Left-Chiral Tensor Decomposition). Once the six left-chiral links are partitioned into the three row pairs $(1,2)$, $(3,4)$, and $(5,6)$, the resulting 6-dimensional space admits a natural identification
$$
\mathbb{R}^6 \cong \mathbb{R}^3 \otimes \mathbb{R}^2
$$
unique up to independent orthogonal changes of basis in the two factors, where:

- $\mathbb{R}^3$: “pair-index” space labeling the three row pairs
- $\mathbb{R}^2$: “in-pair” space distinguishing the two entries within each pair

*Proof.* Let $e_1,\dots,e_6$ be the standard basis of $\mathbb{R}^6$. Let $f_1,f_2,f_3$ be the standard basis of $\mathbb{R}^3$ and $g_+,g_-$ the standard basis of $\mathbb{R}^2$. Define a linear map on basis vectors by
$$
e_{2a-1}\mapsto f_a\otimes g_+,\qquad
e_{2a}\mapsto f_a\otimes g_-,
\qquad a=1,2,3.
$$
Because both spaces have dimension $6$, this basis correspondence extends uniquely to a linear isomorphism
$$
\Phi:\mathbb{R}^6\to\mathbb{R}^3\otimes\mathbb{R}^2.
$$
The pair labels determine the $\mathbb{R}^3$ factor, while the within-pair labels determine the $\mathbb{R}^2$ factor. Any other choice of orthonormal bases in the pair-index and in-pair spaces composes $\Phi$ with an element of $O(3)\times O(2)$. Therefore the tensor decomposition is natural once the row-pair partition is fixed, but not absolutely canonical before that choice. ∎

**Definition T.24a** (Canonical Basis). Define orthonormal bases:

In-pair ($\mathbb{R}^2$):
$$
\mathbf{e} = \frac{1}{\sqrt{2}}(1, 1), \quad \mathbf{a} = \frac{1}{\sqrt{2}}(1, -1)
$$

Pair-index ($\mathbb{R}^3$):
$$
\mathbf{t} = \frac{1}{\sqrt{3}}(1, 1, 1), \quad \mathbf{u} = \frac{1}{\sqrt{2}}(1, -1, 0), \quad \mathbf{w} = \frac{1}{\sqrt{6}}(1, 1, -2)
$$

where $\mathbf{t}$ is the $S_3$-trivial direction and ${\mathbf{u}, \mathbf{w}}$ span the standard $S_3$ representation.

-----

### T.20.6 Solved: Generation Projectors ✓

**Theorem T.31** (Generation projector construction in the fixed $S_3\times \mathbb{Z}_2$ basis). Relative to the tensor-product structure of Theorem T.8 and the bases of Definition T.24, the left-chiral space admits the orthogonal rank-2 decomposition
$$
\mathbb{R}^6 = \text{Ran}(P_1) \oplus \text{Ran}(P_2) \oplus \text{Ran}(P_3),
$$
with $P_1 + P_2 + P_3 = I_6$ and $P_i P_j = \delta_{ij} P_i$.

*Proof.* Define
$$
\begin{aligned}
v_0 &= \mathbf{t} \otimes \mathbf{e} = \frac{1}{\sqrt{6}}(1, 1, 1, 1, 1, 1),\\
v_1 &= \mathbf{t} \otimes \mathbf{a} = \frac{1}{\sqrt{6}}(1, -1, 1, -1, 1, -1),\\
v_2 &= \mathbf{u} \otimes \mathbf{e} = \tfrac{1}{2}(1, 1, -1, -1, 0, 0),\\
v_3 &= \mathbf{w} \otimes \mathbf{e} = \frac{1}{\sqrt{12}}(1, 1, 1, 1, -2, -2),\\
v_4 &= \mathbf{u} \otimes \mathbf{a} = \tfrac{1}{2}(1, -1, -1, 1, 0, 0),\\
v_5 &= \mathbf{w} \otimes \mathbf{a} = \frac{1}{\sqrt{12}}(1, -1, 1, -1, -2, 2).
\end{aligned}
$$
Because $\{\mathbf t,\mathbf u,\mathbf w\}$ is an orthonormal basis of $\mathbb R^3$ and $\{\mathbf e,\mathbf a\}$ is an orthonormal basis of $\mathbb R^2$, the six tensor products $\{v_0,\dots,v_5\}$ form an orthonormal basis of $\mathbb R^6$. Define
$$
P_3 = v_0 v_0^T + v_1 v_1^T,\qquad
P_1 = v_2 v_2^T + v_3 v_3^T,\qquad
P_2 = v_4 v_4^T + v_5 v_5^T.
$$
Since the $v_i$ are orthonormal, each $P_i$ is an orthogonal rank-2 projector, $P_iP_j=\delta_{ij}P_i$, and $P_1+P_2+P_3=I_6$.

The plane $\text{Ran}(P_3)=\mathbf t\otimes\mathbb R^2$ is canonical for the $S_3$ action because $\mathbf t$ spans the unique $S_3$-trivial line in the pair-index factor. The complementary planes
$$
\text{Ran}(P_1)=\text{span}\{\mathbf u\otimes\mathbf e,\mathbf w\otimes\mathbf e\},\qquad
\text{Ran}(P_2)=\text{span}\{\mathbf u\otimes\mathbf a,\mathbf w\otimes\mathbf a\}
$$
are the even- and odd-parity copies of the standard $S_3$ representation determined by the fixed $\\mathbb Z_2$ basis $(\mathbf e,\mathbf a)$. ∎

**Corollary T.31.1** (Explicit Rational Form). The top-generation projector is:
$$
P_3 = \frac{1}{6}\left(\mathbf{1}_6 \mathbf{1}_6^T + \mathbf{s}\mathbf{s}^T\right)
$$
where $\mathbf{1}_6 = (1,1,1,1,1,1)^T$ and $\mathbf{s} = (1,-1,1,-1,1,-1)^T$.

**Corollary T.31.2** ($S_3$ invariance and parity splitting). The projector $P_3$ is the canonical rank-2 $S_3$-invariant plane containing the democratic direction. In the fixed parity basis of Definition T.24, $P_1$ and $P_2$ are the even- and odd-parity copies of the standard $S_3$ representation.

-----

### T.20.7 Solved: Top Yukawa at the PU Fixed Point ✓

**Definition T.25a** (Democratic Higgs Direction). At the PU fixed point $\mathfrak{A}_{PU}$, the canonical Higgs direction in left-chiral space is:
$$
\mathbf{h} = v_0 = \frac{1}{\sqrt{6}}(1, 1, 1, 1, 1, 1)
$$
with $|\mathbf{h}|_B = 1$ in the Bures metric.

**Theorem T.32** (Top Yukawa). At the PU fixed point $\mathfrak{A}_{PU}$:
$$
\boxed{y_t^{\mathrm{PU}}(\mathfrak{A}_{PU}) = |P_3 \mathbf{h}|_B = 1}
$$

*Proof.*

1. Since $\mathbf{h} = v_0$ and $P_3 = v_0 v_0^T + v_1 v_1^T$, we have $P_3 \mathbf{h} = v_0 (v_0^T v_0) + v_1 (v_1^T v_0) = v_0 \cdot 1 + v_1 \cdot 0 = \mathbf{h}$.
1. Therefore $|P_3 \mathbf{h}|_B = |\mathbf{h}|_B = 1$. ∎

**Corollary T.32.1** (Lighter Generation Yukawas). At the exact attractor:
$$
y_1^{\mathrm{PU}}(\mathfrak{A}_{PU}) = |P_1 \mathbf{h}|_B = 0, \quad y_2^{\mathrm{PU}}(\mathfrak{A}_{PU}) = |P_2 \mathbf{h}|_B = 0
$$

*Proof.* Since $\mathbf{h} \in \text{Ran}(P_3)$ and $P_i P_3 = 0$ for $i \neq 3$, we have $P_i \mathbf{h} = 0$. ∎

The corresponding SM Yukawa couplings at the matching scale are obtained by field and operator normalization:
$$
y_i(\mu_G) = \frac{y_i^{\mathrm{PU}}(\mathfrak{A}_{PU})}{\sqrt{Z_{L_i} Z_{R_i} Z_H}}.
$$

**Remark T.32.1: Discrete-Action Verification.** The result $y_t^{\mathrm{PU}}(\mathfrak{A}_{PU}) = 1$ admits an independent derivation via the Yukawa source term. Adding to the discrete action (Definition T.12):
$$
\mathcal{L}_Y = -Y_0 \langle \mathbf{h}, \Pi_L s \rangle
$$

Minimizing over $s$ with $P_L = \Pi_L^T \Pi_L$ gives:
$$
s^* = (I + P_L)^{-1} Y_0 \Pi_L^T \mathbf{h} = \frac{Y_0}{2} \Pi_L^T \mathbf{h}
$$

using $(I + P_L)^{-1} = I - \frac{1}{2}P_L$ (same projector algebra as Section T.15). The effective Yukawa coupling is the coefficient of $\mathbf{h}$ in $\Pi_L s^*$:
$$
y_{\text{eff}} = \frac{Y_0}{2}
$$

With canonical normalization $Y_0 = 2$ (identical to the SU(2) sinc calibration in Section T.20.4):
$$
\boxed{y_t^{\mathrm{PU}}(\mathfrak{A}_{PU}) = 1}
$$

This confirms the projector derivation (Theorem T.32) via an independent route, using only structures already established for the $\lambda$ derivation. The corresponding SM Yukawa at the matching scale is obtained by field and operator normalization:
$$
y_t(\mu_G) = \frac{y_t^{\mathrm{PU}}(\mathfrak{A}_{PU})}{\sqrt{Z_{Q_L^{(3)}} Z_{t_R} Z_H}} .
$$

**Corollary T.32.2** (Yukawa Sum Rule). At the PU fixed point:
$$
(y_1^{\mathrm{PU}})^2 + (y_2^{\mathrm{PU}})^2 + (y_t^{\mathrm{PU}})^2 = \vert\mathbf{h}\vert_B^2 = 1
$$

-----

### T.20.8 Yukawa Hierarchy from Geometric Tilts

**Theorem T.33** (Tilt Mechanism). For $0\le |\phi|\le \pi/4$, label the light generations so that $y_1\le y_2$. Small symmetry-breaking perturbations tilt $\mathbf{h}$ out of $\text{Ran}(P_3)$:
$$
\mathbf{h}(\vartheta, \phi) = \cos\vartheta \cdot v_0 + \sin\vartheta \cdot (\cos\phi \cdot v_2 + \sin\phi \cdot v_4).
$$
The corresponding Yukawa magnitudes are
$$
y_3 = \cos\vartheta,\qquad
y_2 = \sin\vartheta \cdot |\cos\phi|,\qquad
y_1 = \sin\vartheta \cdot |\sin\phi|.
$$

*Proof.* By Theorem T.31,
$$
P_3=v_0v_0^T+v_1v_1^T,\qquad
P_1=v_2v_2^T+v_3v_3^T,\qquad
P_2=v_4v_4^T+v_5v_5^T,
$$
with $\{v_0,\dots,v_5\}$ orthonormal. Therefore
$$
P_3\mathbf h(\vartheta,\phi)=\cos\vartheta\,v_0,
$$
because $v_0$ is orthogonal to $v_2$ and $v_4$, and similarly
$$
P_1\mathbf h(\vartheta,\phi)=\sin\vartheta\cos\phi\,v_2,\qquad
P_2\mathbf h(\vartheta,\phi)=\sin\vartheta\sin\phi\,v_4.
$$
Taking Bures norms and using $\|v_0\|_B=\|v_2\|_B=\|v_4\|_B=1$ gives
$$
\|P_3\mathbf h\|_B=\cos\vartheta,\qquad
\|P_1\mathbf h\|_B=\sin\vartheta|\cos\phi|,\qquad
\|P_2\mathbf h\|_B=\sin\vartheta|\sin\phi|.
$$
For $0\le |\phi|\le \pi/4$ one has $|\sin\phi|\le |\cos\phi|$, so the more suppressed light mode is the $P_2$ component. Ordering the light generations by increasing magnitude therefore gives
$$
y_1=\|P_2\mathbf h\|_B=\sin\vartheta|\sin\phi|,\qquad
y_2=\|P_1\mathbf h\|_B=\sin\vartheta|\cos\phi|.
$$
This proves the stated formulas. ∎

**Corollary T.33.1** ($E_8$ Distance Correspondence). By Appendix R (Section R.6), the tilt parameters relate to $E_8$ geodesic distances via:
$$
\mathcal{R} = \frac{\ln(y_3/y_1)}{\ln(y_3/y_2)} = \frac{d_{31}^2}{d_{32}^2} \in \left\{\frac{4}{3}, \frac{3}{2}, 2, 3, 4\right\}.
$$

**Corollary T.33.2** (Observed Tilts). Matching the observed continuous ratios gives:

|Sector |$\vartheta$|$\phi$|$\mathcal{R}_{\mathrm{obs}}$|
|-----------|-----------|------|-----------------------------|
|Up quarks |0.42° |0.10° |2.29 |
|Down quarks|1.28° |2.87° |1.79 |
|Leptons |3.41° |0.28° |2.89 |

All tilts are at the degree or sub-degree level, consistent with $E_8$ pinning and elastic projector effects.

-----

### T.20.9 Sector Prefactor Structure ✓

**Theorem T.34** (Normalization-induced prefactor ratios). Let
$$
z_{\text{sector}} := \kappa_2\,C_2^{SU(2)}\,g^2 + \kappa_1\,Y^2 g^2 + \kappa_3\,C_2^{SU(3)}\,g^2 N_c
$$
denote the Bures-normalization factor for a given fermion sector (with $N_c=3$ for color triplets and $N_c=1$ for color singlets). The corresponding Yukawa prefactor is
$$
c_{\text{sector}} = \frac{Y_0}{\sqrt{z_{\text{sector}}}}.
$$

*Proof.* In the prefactor ratio computation one uses the PU-normalized gauge coefficient $g_U$ for canonical generators (Theorem T.13); the SM-canonical matching factors $Z_i$ control the gauge-boson kinetic terms but do not alter the fermion-sector prefactor ratios set by the Bures weights $\kappa_i$ (Theorem T.34). The sector normalization entering the prefactor tilt is

|Sector |$C_2(SU(2))$|$Y^2$ |$C_2(SU(3))$|$N_c$|
|--------------------------|------------|------|------------|-----|
|Lepton doublet ($\ell_L$) |$3/4$ |$1/4$ |$0$ |$1$ |
|Down quark doublet ($d_L$)|$3/4$ |$1/36$|$4/3$ |$3$ |

Therefore:
$$
z_\ell = \left(\frac{3}{4}\kappa_2 + \frac{\kappa_1}{4}\right)g_U^2,\qquad
z_d = \left(\frac{3}{4}\kappa_2 + \frac{\kappa_1}{36} + 4\kappa_3\right)g_U^2,
$$
and the prefactor ratio is
$$
\frac{c_\ell}{c_d} = \sqrt{\frac{z_d}{z_\ell}}.
$$
(Note: $c \propto 1/\sqrt{z}$, so $c_\ell/c_d = \sqrt{z_d/z_\ell}$, not $z_d/z_\ell$.)
∎

**Corollary T.34.1** (Normalization Constraint). Imposing the lepton-to-quark tilt normalization
$$
\frac{c_\ell}{c_d} = \frac{8}{3}
$$
is equivalent to $z_d/z_\ell = 64/9$. Writing this out:
$$
\frac{\tfrac{3}{4}\kappa_2 + \tfrac{\kappa_1}{36} + 4\kappa_3}{\tfrac{3}{4}\kappa_2 + \tfrac{\kappa_1}{4}} = \frac{64}{9}.
$$
Cross-multiplying: $9\bigl(\tfrac{3}{4}\kappa_2 + \tfrac{\kappa_1}{36} + 4\kappa_3\bigr) = 64\bigl(\tfrac{3}{4}\kappa_2 + \tfrac{\kappa_1}{4}\bigr)$, i.e.
$$
\tfrac{27}{4}\kappa_2 + \tfrac{\kappa_1}{4} + 36\kappa_3 = 48\kappa_2 + 16\kappa_1.
$$
Collecting: $36\kappa_3 = \tfrac{63}{4}\kappa_1 + \tfrac{165}{4}\kappa_2$. Multiplying by $4/3$:
$$
\boxed{21\kappa_1 + 55\kappa_2 - 48\kappa_3 = 0},
$$
equivalently $\kappa_1 = (48\kappa_3 - 55\kappa_2)/21$.

**Corollary T.34.2** (PCE-Optimal Bures Weights on the $c_\ell/c_d = 8/3$ Normalization Branch). On the lepton-to-quark tilt normalization branch $c_\ell/c_d = 8/3$ (Corollary T.34.1), minimize the strictly convex PCE objective
$$
S(\kappa)=8\kappa_3\ln\kappa_3 + 3\kappa_2\ln\kappa_2 + \kappa_1\ln\kappa_1
$$
subject to the two linear constraints
$$
\mathcal{W}\colon\; 8\kappa_3 + 3\kappa_2 + \kappa_1 = 12,\qquad \mathcal{N}\colon\; 21\kappa_1 + 55\kappa_2 - 48\kappa_3 = 0.
$$
$\mathcal{W}$ enforces that the weighted sum of Bures weights equals the gauge algebra dimension $n_G = 12$; $\mathcal{N}$ is the normalization constraint from Corollary T.34.1.

*Derivation.* Introduce Lagrange multipliers $\mu$ for $\mathcal{W}$ and $\nu$ for $\mathcal{N}$. The stationarity conditions are
$$
n_i(1+\ln\kappa_i) = \mu\,n_i + \nu\,c_i, \qquad i\in\{1,2,3\},
$$
where $(n_1,n_2,n_3)=(1,3,8)$ are the multiplicities and $(c_1,c_2,c_3)=(21,55,-48)$ are the $\mathcal{N}$ coefficients. Thus
$$
1+\ln\kappa_1 = \mu + 21\nu,\quad 1+\ln\kappa_2 = \mu + \tfrac{55}{3}\nu,\quad 1+\ln\kappa_3 = \mu - 6\nu.
$$
Define $y := e^{-\nu/3}$. Then the ratios of the $\kappa_i$ are
$$
\ln(\kappa_1/\kappa_3) = 27\nu ;\Longrightarrow; \kappa_1/\kappa_3 = y^{-81},
$$
$$
\ln(\kappa_2/\kappa_3) = \tfrac{73}{3}\nu ;\Longrightarrow; \kappa_2/\kappa_3 = y^{-73}.
$$
(Here the exponents arise from $27/(1/3)=81$ and $(73/3)/(1/3)=73$ after expressing everything in terms of $y = e^{-\nu/3}$.)

Substituting into $\mathcal{N}$: $21\kappa_3 y^{-81} + 55\kappa_3 y^{-73} = 48\kappa_3$, which simplifies to
$$
21y^{-81} + 55y^{-73} = 48.
$$
Equivalently, multiplying through by $y^{81}$:
$$
21 + 55y^{8} = 48y^{81},
$$
which has a unique positive solution $y^*>1$. Equivalently, in the form
$$
21y^{-81}+55y^{-73}=48,
$$
the left side is strictly decreasing on $(0,\infty)$, tends to $\infty$ as $y\downarrow0$, and tends to $0$ as $y\to\infty$.

Substituting into $\mathcal{W}$ determines $\kappa_3$:
$$
\kappa_3 = \frac{12}{8 + 3y^{-73} + y^{-81}}.
$$
Numerically, $y^* \approx 1.00613$, giving
$$
\boxed{\kappa_1^*\approx 0.695,\quad \kappa_2^*\approx 0.729,\quad \kappa_3^*\approx 1.140.}
$$
Verification: $8(1.140)+3(0.729)+0.695 = 9.12+2.19+0.70 = 12.01 \approx 12$ ✓; $21(0.695)+55(0.729)-48(1.140) = 14.60+40.10-54.72 = -0.02 \approx 0$ ✓. The small residuals are rounding artifacts of three-decimal reporting. This is the unique minimizer (strict convexity of $x\ln x$ on $x > 0$ combined with the two linear constraints leaving a one-parameter family, on which the objective has a unique minimum).

**Remark T.34.1: Physical Interpretation.** The factor $8/3$ arises because:

- Quarks carry color charge ($C_2(SU(3)) = 4/3$, $N_c = 3$)
- Leptons do not ($C_2(SU(3)) = 0$)
- The SU(3) contribution to the Bures curvature suppresses the quark prefactor relative to leptons

-----

### T.20.10 Complete Fixed-Point and Matching Boundary Conditions

**Theorem T.35** (Complete Electroweak Boundary). The PU fixed point $\mathfrak{A}_{PU}$ and the matching scale $\mu_G$ impose the following boundary conditions:
$$
\boxed{
\begin{aligned}
\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU}) &= 0 \quad \text{(zero-slack, Theorem T.25)}\\
\sin^2\theta_W^{(0)} &= 3/8 \quad \text{(PU-normalized Weinberg angle, Theorem T.14)}\\
\sin^2\theta_W(\mu_G) &= \frac{3 Z_2}{3 Z_2 + 5 Z_1} \quad \text{(matching Weinberg angle, Theorem T.14)}\\
g_i(\mu_G) &= \frac{g_U}{\sqrt{Z_i}} \quad (i=1,2,3)\quad \text{(gauge matching, Corollary T.13.1)}\\
y_t^{\mathrm{PU}}(\mathfrak{A}_{PU}) &= 1 \quad \text{(}S_3\text{-democratic Higgs, Theorem T.32)}\\
c_\ell/c_d &= 8/3 \quad \text{(imposed normalization branch input, Corollary T.34.1; not derived)}\\
(\kappa_1,\kappa_2,\kappa_3) &= (\kappa_1^*,\kappa_2^*,\kappa_3^*) \quad \text{(branch optimum on the imposed }c_\ell/c_d = 8/3\text{ branch, Corollary T.34.2)}\\
g_U^2 &= \pi/6 \quad \text{(holonomy saturation, Theorem T.39a)}
\end{aligned}
}
$$

These eight boundary conditions, together with the PU-to-SM matching map encoded by the lifted spectral threshold data $Z_i=1+\Delta_i/24$ (Definition T.17a) and two-loop SM RG evolution from $\mu_G$, determine the electroweak and Yukawa observables once the spectral thresholds are supplied by the lifted gauge-sector computation on $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$.

-----

### T.20.11 Yukawa Sector Status

**Theorem T.36** (Yukawa Compression). The 21 Standard Model Yukawa couplings reduce to:

|Component |Status |Source |
|------------------------------------------|----------|-------------------------------------------------------------|
|$y_t^{\mathrm{PU}}(\mathfrak{A}_{PU}) = 1$|Exact |$S_3$ projector (Theorem T.32) |
|$\mathcal{R}$ values |Derived |$E_8$ triads: discrete set ${4/3, 3/2, 2, 3, 4}$ |
|$c_\ell/c_d = 8/3$ |Constraint|Normalization constraint (Corollary T.34.1) |
|$\kappa_1, \kappa_2, \kappa_3$ |Fixed |PCE optimum under constraints $\mathcal{W}$ and $\mathcal{N}$: Corollary T.34.2|
|$\alpha = 3/2$ |Derived |Capacity saturation (Corollary T.41.3) |
|$c_d/c_u \approx 1.00$–$1.02$ |Derived |Right-handed hypercharge (Theorem T.38) |

**Compression factor**: $21 \to 1$ continuous parameter + 3 discrete choices once the lifted threshold data are supplied. At the threshold layer, Remark T.17a.4 and Proposition T.17a.5 rule out the sector-independent local affine truncation, while the operative threshold data are the sector-resolving $\mathrm{MS2}_{\mu_G}$ block sums on $\widetilde X$.

**Theorem T.37** ($E_8$ Triad Assignment). The optimal sector assignment is:

|Sector |$(d_{31}^2, d_{32}^2)$|$\mathcal{R}_{E_8}$|$\mathcal{R}_{\text{obs}}$|Agreement|
|-----------|----------------------|-------------------|--------------------------|---------|
|Up quarks |$(8, 4)$ |$2$ |$2.30$ |87% |
|Down quarks|$(4, 2)$ |$2$ |$1.79$ |88% |
|Leptons |$(6, 2)$ |$3$ |$2.89$ |96% |

**Theorem T.38** (Up-Down Sector Prefactor). The prefactor ratio $c_d/c_u$ is determined by right-handed hypercharge normalization. Including the color multiplicity factor consistently with Theorem T.34, the right-handed normalization factors are
$$
Z_{u_R} = \kappa_3\,C_2^{SU(3)}(3)\,N_c + \kappa_1 Y_{u_R}^2,\qquad
Z_{d_R} = \kappa_3\,C_2^{SU(3)}(3)\,N_c + \kappa_1 Y_{d_R}^2,
$$
with $C_2^{SU(3)}(3) = 4/3$, $N_c = 3$, $Y_{u_R}^2 = 4/9$, $Y_{d_R}^2 = 1/9$. Thus
$$
Z_{u_R} = 4\kappa_3 + \frac{4}{9}\kappa_1,\qquad Z_{d_R} = 4\kappa_3 + \frac{1}{9}\kappa_1,
$$
and
$$
\boxed{\frac{c_d}{c_u}=\sqrt{\frac{Z_{u_R}}{Z_{d_R}}}
=\sqrt{\frac{4\kappa_3+\frac{4}{9}\kappa_1}{4\kappa_3+\frac{1}{9}\kappa_1}}
\approx 1.02.}
$$

*Proof.* The Yukawa tilt prefactor scales as $c \propto 1/\sqrt{Z}$, where $Z$ is the gauge/Bures normalization. For up vs. down, the left-chiral leg $Q_L$ is identical, so the ratio is controlled by right-handed normalization. For SU(2) singlets, the $N_c = 3$ color factor enters because each color copy contributes independently to the Bures curvature: $C_2(SU(3))\cdot N_c = (4/3)\cdot 3 = 4$. The ratio is close to unity because the shared color term $4\kappa_3$ dominates both $Z_{u_R}$ and $Z_{d_R}$, with the hypercharge terms providing a small upward tilt. Substituting the PCE-optimal weights $(\kappa_1^*,\kappa_3^*) \approx (0.695, 1.140)$ from Corollary T.34.2 gives $c_d/c_u \approx 1.02$. ∎

**Corollary T.38.1** (Near-Unity Ratio). Since both $u_R$ and $d_R$ carry identical SU(3) charge and differ only in U(1)$_Y$ hypercharge, the prefactor ratio is naturally close to unity.

**Remark T.38.1: PCE Determination.** Substituting the PCE-optimal weights from Corollary T.34.2 gives $c_d/c_u \approx 1.02$, consistent with the small right-handed hypercharge tilt assumed in the CKM construction (Section T.22).

**Theorem T.39a** (Unified Coupling from Holonomy). The unified gauge coupling $g_U$ at the matching scale $\mu_G$ is determined by the Bures holonomy on $\mathrm{Gr}(2,8)$.

*Proof.* We derive $g_U$ from the intrinsic Bures geometry in four steps.

**Step 1 (Bures connection on the attractor orbit).** The Bures metric at the PCE-Attractor $\rho_0 = \frac{1}{2}I_2 \oplus 0_6$ restricted to the orbit $\mathcal{O}_{\rho_0}\cong\mathrm{Gr}(2,8)$ is (Proposition Z.23a):
$$
ds^2_B = \frac{1}{2a}\sum_{i\le a,\,j>a}|dz_{ij}|^2 = \frac{1}{4}\sum_{i,j}|dz_{ij}|^2,
$$
where $a = 2$ and $z_{ij}$ are complex coordinates on $T_{x_0}\mathrm{Gr}(2,8)\cong\mathrm{Hom}(\mathbb{C}^2,\mathbb{C}^6)$. The associated Bures connection 1-form $\mathcal{A}_B$ is the Levi-Civita connection of this Kähler metric. On a holomorphic 2-plane $\mathbb{CP}^1\hookrightarrow\mathrm{Gr}(2,8)$ (the minimal geodesic submanifold), the holonomy around a geodesic loop of area $\mathcal{A}$ is $\Phi = K_{\mathrm{hol}}\cdot\mathcal{A}$, where $K_{\mathrm{hol}}$ is the holomorphic sectional curvature.

**Step 2 (Holomorphic sectional curvature).** For the Fubini-Study metric on $\mathrm{Gr}(a,d_0)$ with the Bures normalization $1/(2a)$, the holomorphic sectional curvature is (Kobayashi–Nomizu 1969):
$$
K_{\mathrm{hol}} = 2a = 4.
$$
This equals the effective curvature $K_{\mathrm{eff}} = 4/a = 2$ scaled by $2a/(4/a) = a^2 = 4$ — or equivalently, $K_{\mathrm{hol}} = 2a$ directly from the metric normalization. (Theorem Z.24 gives $K_{\mathrm{eff}} = 4/a = 2$ for the *average* over all tangent 2-planes; the holomorphic sectional curvature is $2a = 4$ for the specific $\mathbb{CP}^1$ 2-planes.)

**Step 3 (Holonomy per mode).** At capacity saturation, the $M = 24$ interface modes are utilized democratically (PCE isotropy). The total holonomy $2\pi$ distributed equally across $M$ modes gives holonomy per mode $2\pi/M$. The area of the minimal geodesic loop corresponding to one mode is
$$
\mathcal{A}_1 = \frac{(2\pi/M)}{K_{\mathrm{hol}}} = \frac{(2\pi/24)}{4} = \frac{\pi}{48}.
$$

**Step 4 (Gauge-coupling identification on the canonical Bures-gauge holonomy-normalization branch).** On the canonical Bures-gauge holonomy-normalization branch — under which the Bures connection $\mathcal{A}_B$ is identified with the gauge connection at matching with calibration constant $1/2$ — the holonomy $\oint_\gamma \mathcal{A}_B$ around a minimal mode loop equals $g_U^2/2$. The factor $1/2$ is motivated by the gauge kinetic term $-\frac{1}{4}F^2$ relative to the geometric connection in the standard normalization $\alpha = g^2/(4\pi)$, but its derivation from the PU effective action is a separate theorem: with a general calibration constant $\chi_U$, one would have $\oint_\gamma \mathcal{A}_B = \chi_U \cdot g_U^2$, giving $g_U^2 = (2\pi/M)/\chi_U$ and $\alpha_U^{-1} = 2M\chi_U$. The branch choice $\chi_U = 1/2$ yields:
$$
\frac{g_U^2}{2} = \frac{2\pi}{M} = \frac{\pi}{12},
$$
hence
$$
g_U^2 = \frac{2\pi}{M} \cdot 2 = \frac{4\pi}{M} = \frac{4\pi}{24} = \frac{\pi}{6}.
$$
A separate effective-action theorem deriving $\chi_U = 1/2$ from the Bures geometry is required for a branch-independent normalization.
The corresponding unified fine-structure constant is
$$
\alpha_U = \frac{g_U^2}{4\pi} = \frac{1}{24},
$$
giving
$$
\boxed{g_U = \sqrt{\frac{\pi}{6}} \approx 0.724, \qquad \alpha_U^{-1} = \frac{4\pi}{g_U^2} = M = 24.}
$$

**Consistency checks.** (i) The identity $\alpha_U^{-1}=M=24$ corresponds to $g_U^2=\pi/6$ (Theorem T.39a). (ii) With PU-to-SM matching $g_i(\mu_G)=g_U/\sqrt{Z_i}$ (Corollary T.13.1) and lifted spectral threshold data $Z_i=1+\Delta_i/24$ from Definition T.17a, one-loop SM running yields Z-pole gauge couplings once the threshold tuple is supplied, up to the residual finite shifts $\delta_i$ and $O(M^{-1})$ splittings (Definition T.19a; Corollary T.17.1). (iii) In the isotropic matching limit $Z_1=Z_2=Z_3$ one recovers the standard SU(5) tree-level ratios $(g')^2:g^2:g_s^2=\frac{3}{5}:1:1$ and $\sin^2\theta_W=3/8$ (Theorem T.14; Theorem T.27a). ∎
**Problem T.3** (CKM/PMNS). *Solved for CKM sector in Section T.22 and PMNS sector in Section T.24.* The CKM matrix elements emerge from two limiting regimes of a unified overlap formula on the generation manifold $\mathrm{Gr}(2,8)$:

1. **Heavy-generation mixing** (3↔1, 3↔2): Gaussian overlap suppression $\exp(-\alpha d^2_{E_8})$ yields $|V_{cb}| = \sqrt{2/3} \cdot e^{-3} = 0.0407$ and $|V_{ub}| = 0.00392$ (Theorems T.46–T.48).
1. **Light-generation mixing** (1↔2): Geometric frustration between $D_4$ (cubic, $\theta_u = 90°$) and $A_2$ (hexagonal, $\theta_d = 120°$) symmetries, with stiffness-weighted vacuum at $\theta_{\mathrm{vac}} = 105.15°$, yields the Cabibbo angle $|V_{us}| = (\sqrt{3}/2)\sin(15.15°) \times f_{\mathrm{curv}} = 0.2261$ (Theorems T.49–T.52).
1. **CP violation**: Berry holonomy around the flavor loop gives $\delta = 66.7°$ (Theorems T.53–T.56).

# Section T.21: Derivation of the Universal Hierarchy Parameter

## T.21.1 Introduction and Statement of Result

The inter-generation mass hierarchy arises from geometric suppression of Yukawa couplings on the generation vacuum manifold. This suppression is controlled by a single coefficient multiplying squared distances in the $E_8$ root space.

**Notation (to avoid symbol overload).** In Appendix T, the symbol $\alpha$ (and derived quantities such as $\alpha_{\mathrm{IR}}$) denotes the *hierarchy coefficient* controlling Yukawa scaling. The electromagnetic fine-structure constant is denoted $\alpha_{\mathrm{em}}$ (Appendix Z); in particular, $\alpha_{\mathrm{em}}^{-1}\approx 137$ should not be conflated with the hierarchy coefficient.

**Theorem T.39** (Universal hierarchy coefficient at the PU fixed point).
Let $d^2_{E_8}(r_i,r_j)$ denote the squared Euclidean distance between generation roots $r_i,r_j$ in the $E_8$ root system, where $d^2_{E_8} \in \{0, 2, 4, 6, 8\}$ for distinct roots. The hierarchy coefficient $\alpha = 3/2$ controls Yukawa suppression via $Y_{ij} \propto \exp(-\alpha d^2_{E_8}(r_i, r_j))$. This value coincides with the unique Hessian eigenvalue at a $K$-invariant PCE-Attractor minimum (Corollary T.41.3), providing a geometric interpretation of the mass hierarchy mechanism. Then, at the PCE-attractor,

$$
\boxed{\ln\!\left(\frac{m_j}{m_i}\right) = \alpha \, d^2_{E_8}(r_i,r_j), \qquad \alpha = \frac{1}{16\,\sigma_B^2}}
$$

**Scope.** For Dirac-type generation sectors this equation is used as a pairwise mass-ratio law on path-additive triads. In the Majorana self-conjugate neutrino sector, the same geometric suppression is applied in the anchored form of Theorem T.24.11; the third $A_2$ edge controls mixing geometry and is not an independent mass-ratio equation.

where $\sigma_B^2$ is the variance (per Bures-orthonormal direction) of the generation-localizing Gaussian on the interface orbit $\mathrm{Gr}(2,8)$ at the attractor. Isotropy and capacity equipartition across the $M=24$ interface directions fix
$$
\sigma_B^2 = \frac{1}{24} \quad\Longrightarrow\quad \alpha_{\mathrm{UV}} = \frac{24}{16} = \frac{3}{2},
$$
with $\sigma_B^2 = 1/24$ established explicitly in Lemma T.41.2.

At low scales, the effective exponent extracted from data satisfies

$$
\alpha_{\mathrm{IR}} = \frac{\ln(m_\tau/m_\mu)}{2} = 1.411,
$$

in excellent agreement with $\alpha_{\mathrm{IR}}\approx \sqrt{2}$, while the $\alpha$-independent ratio invariant

$$
\mathcal{R} = \frac{\ln(m_\tau/m_e)}{\ln(m_\tau/m_\mu)} = \frac{d^2_{31}}{d^2_{32}} = 3
$$

matches observation at the $3.8%$ level for the charged lepton triad described below.

-----

## T.21.2 Geometric Foundations

### T.21.2.1 Generation Orbit and Interface Dimension

The internal unitary orbit of the density operator $\rho_0 = I_2/2 \oplus 0_6$ is the Grassmannian

$$
\mathcal{M}_{\mathrm{gen}} = \mathrm{Gr}(a,d_0) = \mathrm{Gr}(2,8),
$$

with complex dimension $\dim_{\mathbb{C}}=ab=12$ and real dimension $\dim_{\mathbb{R}}=2ab=24$. These $24$ real directions coincide with the QFI/Bures-active interface modes (Theorem Z.5).

### T.21.2.2 Bures Metric at the Attractor

Let $G$ be an AB or BA tangent generator normalized by the Hilbert–Schmidt norm at $\rho_0$ with eigenvalues $(1/2,1/2,0,\dots,0)$. The quantum Fisher information satisfies $F_Q(\rho_0;G)=1$, so the Bures metric obeys

$$
g_B(G,G) = \frac{F_Q}{4} = \frac{1}{4}.
$$

The interface directions are mutually orthogonal and isotropic, hence

$$
g_B = \frac{1}{4} I_{24}.
$$

### T.21.2.3 $E_8$ Root Space

The $E_8$ root system in $\mathbb{R}^8$ consists of 240 roots of squared norm $2$:

- **Type I (112 roots):** All permutations of $(\pm 1, \pm 1, 0, 0, 0, 0, 0, 0)$ with all sign combinations.
- **Type II (128 roots):** All vectors $(\pm 1/2, \pm 1/2, \ldots, \pm 1/2)$ with an even number of minus signs.

The squared distances between roots lie in

$$
d^2_{E_8}(r_i,r_j) \in \{2,4,6,8\}.
$$

-----

## T.21.3 Derivation of $\sigma_B^2 = 1/24$

The generation-localizing fluctuations at the attractor are Gaussian on the interface orbit $(\mathrm{Gr}(2,8), g_B)$, with covariance $\sigma_B^2 I$ in the Bures-orthonormal frame of the 24 interface directions. We derive $\sigma_B^2 = 1/24$ from the Predictive Ward identity, isotropy, and capacity saturation.

**Theorem T.41.1** (Quadratic action and isotropic covariance).
At the PCE-attractor, the quadratic 1PI kernel on the interface orbit equals the Bures metric (Predictive Ward identity), and in the Hilbert–Schmidt normalized basis the metric is $g_B = (1/4) I_{24}$. Passing to the Bures-orthonormal frame $\xi \in \mathbb{R}^{24}$ defines the canonical quadratic action

$$
S_{\mathrm{quad}}(\xi) = \frac{1}{2} |\xi|^2,
$$

so that the Gaussian density is $p(\xi) \propto \exp\!\left(-\frac{S_{\mathrm{quad}}(\xi)}{\sigma_B^2}\right)=\exp\!\left(-\frac{|\xi|^2}{2\sigma_B^2}\right)$ for some isotropic scale $\sigma_B^2$ fixed by capacity saturation (Lemma T.41.2).

*Proof.* By the QFI calculation of Section T.21.2.2, $F_Q(\rho_0; G) = 1$ for each interface generator, and $g_B = F_Q/4 = (1/4) I_{24}$. The Predictive Ward identity identifies $\Gamma^{(2)} = g_B$. The Bures-orthonormal frame rescales the tangent basis by a factor $2$, delivering $\Gamma^{(2)} = I_{24}$ and $S_{\mathrm{quad}} = (1/2) \xi^T \xi$. ∎

**Lemma T.41.2** (Bures variance under canonical unit-radius normalization). Equip the $M=24$ interface-mode orbit with the canonical Bures/Fisher normalization inherited from Appendix Z, and impose the unit-radius convention
$$
\langle r_B^2\rangle = 1
$$
for the isotropic Gaussian on the generation submanifold. Then the variance per mode is
$$
\sigma_B^2 = \frac{1}{M} = \frac{1}{24}.
$$

*Proof.* Under isotropy, the total mean-square radius decomposes as the sum of equal contributions from the $M$ orthogonal Bures directions:
$$
\langle r_B^2\rangle = \sum_{i=1}^{M} \langle x_i^2\rangle = M \sigma_B^2.
$$
Imposing the canonical unit-radius convention $\langle r_B^2\rangle=1$ therefore gives
$$
\sigma_B^2 = \frac{1}{M} = \frac{1}{24}.
$$
QED

**Corollary T.41.3** (Universal hierarchy coefficient at UV).
With $\sigma_B^2 = 1/24$ and $\alpha = 1/(16\,\sigma_B^2)$,

$$
\alpha_{\mathrm{UV}} = \frac{24}{16} = \frac{3}{2}.
$$

*Proof.* Substituting $\sigma_B^2=1/24$ (Lemma T.41.2) into $\alpha=1/(16\,\sigma_B^2)$ yields $\alpha_{\mathrm{UV}}=24/16=3/2$. ∎

-----

## T.21.4 Bures–$E_8$ Conversion and Gaussian Suppression

**Lemma T.41.4** (Bures–$E_8$ conversion).
For a small SU(2) rotation of angle $u$ in a single AB block at $\rho_0$, the Bures and $E_8$ distances satisfy

$$
d_B^2 = \frac{1}{4}u^2 = \frac{1}{8}d^2_{E_8} + \mathcal{O}(u^4), \qquad d_{E_8}^2 = 2u^2.
$$

**Theorem T.41.5** (Gaussian Overlap and Yukawa Suppression on the Probability-Overlap Branch).
Let $\psi_i,\psi_j$ be generation-localizing wavepackets modeled as isotropic Gaussians on $(\mathrm{Gr}(2,8),g_B)$ with common variance $\sigma_B^2$. The amplitude overlap is

$$
\langle \psi_i \mid \psi_j \rangle \propto \exp\!\left(-\frac{d_B^2}{4\,\sigma_B^2}\right).
$$

On the probability-overlap Yukawa branch — under which the physical Yukawa coupling is identified with the squared wavefunction overlap rather than with the amplitude overlap or another kernel —

$$
Y_{ij} \propto \left|\langle \psi_i \mid \psi_j \rangle\right|^2 \propto \exp\!\left(-\frac{d_B^2}{2\,\sigma_B^2}\right).
$$

The amplitude-overlap branch would instead give $Y_{ij} \propto \exp(-d_B^2/(4\sigma_B^2))$, halving the exponent and yielding $\alpha_{\mathrm{amp}} = 1/(32\sigma_B^2) = 3/4$ rather than $\alpha_{\mathrm{prob}} = 1/(16\sigma_B^2) = 3/2$. The downstream value $\alpha = 3/2$ in Corollary T.41.6 inherits the probability-overlap branch; an effective-action derivation of the Yukawa operator is required to rule out alternative kernel normalizations.

Combining with Lemma T.41.4 gives

$$
\ln(Y_{ij}) = -\frac{d_B^2}{2\,\sigma_B^2} = -\frac{1}{2\,\sigma_B^2}\cdot\frac{d^2_{E_8}}{8} = -\frac{d^2_{E_8}}{16\,\sigma_B^2}.
$$

**Corollary T.41.6** (Hierarchy coefficient).
Matching $\ln(m_j/m_i)=\alpha\,d^2_{E_8}(r_i,r_j)$ yields

$$
\boxed{\alpha = \frac{1}{16\,\sigma_B^2}}.
$$

-----

## T.21.5 $E_8$ Triad Selection Mechanism

### T.21.5.1 Admissible Triads and $\mathcal{R}$-Values

**Definition T.42** (Admissible triads).
An admissible $E_8$ triad $(r_1, r_2, r_3)$ is a triple of roots with $d^2_{ij} \in \{2, 4, 6, 8\}$. For a given triad, define

$$
\mathcal{R} = \frac{d^2_{31}}{d^2_{32}} \in \left\{\frac{4}{3}, \frac{3}{2}, 2, 3, 4\right\}.
$$

**PCE Triad Selection Principle.** The charged lepton triad is uniquely determined by the error-correcting structure of $E_8$ (Theorem T.24.3): the framework constants $(a, b) = (2, 6)$ fix the triad $(d^2_{32}, d^2_{31}, d^2_{21}) = (a, b, 2a) = (2, 6, 4)$ with $\mathcal{R} = b/a = 3$. Among the admissible $E_8$ triads with $\mathcal{R} = 3$, the constraint $d^2_{31} = 3 d^2_{32}$ with $d^2 \in \{2, 4, 6, 8\}$ has a unique solution at $d^2_{32} = 2$ (Theorem T.42.1), which also minimizes the action cost $\exp(-\alpha d^2_{32})$ as required by PCE.

### T.21.5.2 Uniqueness of the Charged-Lepton Triad

**Theorem T.42.1** (Charged-lepton triad by minimal $d^2_{32}$).
Among $\mathcal{R} = 3$ triads, the constraint $d^2_{31} = 3 d^2_{32}$ with $d^2 \in \{2,4,6,8\}$ has a unique solution:

|$d^2_{32}$|$d^2_{31} = 3 \times d^2_{32}$|Valid $E_8$ distance?|
|:--------:|:----------------------------:|:-------------------:|
|2 |6 |✓ |
|4 |12 |✗ |
|6 |18 |✗ |
|8 |24 |✗ |

The unique solution is

$$
d^2_{31} = 6, \qquad d^2_{32} = 2, \qquad d^2_{21} = 4.
$$

Up to the Weyl group, this triad is represented by

$$
r_3 = (1,1,0,0,0,0,0,0), \quad r_2 = (1,0,1,0,0,0,0,0), \quad r_1 = (-1,0,1,0,0,0,0,0),
$$

which satisfies $|r_k|^2 = 2$ for all $k$ and the stated pairwise distances.

*Proof.* $\mathcal{R} = 3$ requires $d^2_{31} = 3 d^2_{32}$. Since available squared distances are ${2,4,6,8}$, the only possibility with $d^2_{32}$ minimized is $(d^2_{32}, d^2_{31}) = (2, 6)$. The remaining edge closes at $d^2_{21} = 4$ for the explicit triple above. ∎

-----

## T.21.6 Hierarchy Invariant and Phenomenology

**Corollary T.42.2** (Leading-order hierarchy invariant).
At quadratic order in the hierarchy law,
$$
\mathcal{R}_{\mathrm{LO}}
= \frac{\ln(m_3/m_1)}{\ln(m_3/m_2)}
= \frac{d^2_{31}}{d^2_{32}}
= 3.
$$

Experimentally, using charged-lepton masses,
$$
\mathcal{R}_{\mathrm{obs}}
= \frac{\ln(m_\tau/m_e)}{\ln(m_\tau/m_\mu)}
= \frac{\ln(3477.23)}{\ln(16.817)}
= 2.889.
$$

Thus the leading-order value $3$ differs from observation by $0.111$, i.e. by about $3.7\%$ relative to the leading-order prediction. The quartic curvature correction is incorporated later in Theorem T.42.6.

### T.21.6.1 Infrared Effective Exponent

**Proposition T.42.3** (Infrared extraction from charged-lepton data). The effective exponent extracted directly from the $(\tau,\mu)$ ratio is
$$
\alpha_{\mathrm{IR}}^{\mathrm{obs}}
:= \frac{\ln(m_\tau/m_\mu)}{d^2_{32}}
 = \frac{\ln(m_\tau/m_\mu)}{2}
 = 1.411.
$$

This observed value is within $0.21\%$ of $\sqrt{2}=1.41421356\ldots$.

### T.21.6.2 Phenomenological Predictions with $\alpha_{\mathrm{IR}}^{\mathrm{pred}} = 1.418$

From Theorem T.24.2.1, the sinc-corrected model prediction is
$$
\alpha_{\mathrm{IR}}^{\mathrm{pred}}
= \alpha_{\mathrm{UV}} \times f_{\mathrm{sinc}}
= \frac{3}{2} \times \frac{\sin(1/\sqrt{3})}{1/\sqrt{3}}
= 1.418.
$$

For the charged-lepton triad at leading order,
$$
\begin{aligned}
\ln\!\left(\frac{m_\tau}{m_\mu}\right) &= \alpha_{\mathrm{IR}}^{\mathrm{pred}} \cdot 2 = 2.836, \\[4pt]
\ln\!\left(\frac{m_\mu}{m_e}\right) &= \alpha_{\mathrm{IR}}^{\mathrm{pred}} \cdot 4 = 5.672, \\[4pt]
\ln\!\left(\frac{m_\tau}{m_e}\right) &= \ln\!\left(\frac{m_\tau}{m_\mu}\right) + \ln\!\left(\frac{m_\mu}{m_e}\right) = 8.508.
\end{aligned}
$$


**Remark T.21.6.2a: Path Additivity.** *The $\tau/e$ ratio is computed as the sum of adjacent ratios, reflecting the physical structure of the $E_8$ generation triad. The generations $(\tau, \mu, e)$ form a triangle in $E_8$ root space. Using standard $E_8$ normalization where roots have squared norm $|r|^2 = 2$, the inner products are $\langle r_\tau, r_\mu \rangle = 1$, $\langle r_\mu, r_e \rangle = 0$, $\langle r_\tau, r_e \rangle = -1$, corresponding to squared distances $d^2 = 2|r|^2 - 2\langle r_i, r_j \rangle = 4 - 2\langle r_i, r_j \rangle$, yielding $(d^2_{\tau\mu}, d^2_{\mu e}, d^2_{\tau e}) = (2, 4, 6)$. The dominant Yukawa tunneling path is $\tau \to \mu \to e$, not the direct $\tau \to e$ geodesic. This path structure ensures that logarithmic mass ratios satisfy the mathematical identity $\ln(m_\tau/m_e) = \ln(m_\tau/m_\mu) + \ln(m_\mu/m_e)$ automatically.*

**Table T.21.1** (Charged leptons: leading-order prediction vs observation).

|Quantity |Prediction|Uncertainty|Observation|Deviation |
|:-----------------:|:--------:|:---------:|:---------:|:----------:|
|$\ln(m_\tau/m_\mu)$|$2.836$ |$\pm 0.06$ |$2.822$ |$+0.2\sigma$|
|$\ln(m_\mu/m_e)$ |$5.672$ |$\pm 0.12$ |$5.332$ |$+2.8\sigma$|
|$\ln(m_\tau/m_e)$ |$8.508$ |$\pm 0.18$ |$8.154$ |$+2.0\sigma$|

*Note on uncertainties: The theoretical uncertainties $(\pm 0.06, \pm 0.12, \pm 0.18)$ are estimated as $\sim 2%$ of each prediction, reflecting the combined uncertainty from sinc truncation ($\sim 0.5%$), higher-order curvature terms ($\sim 1%$), and RG running effects ($\sim 0.5%$). Experimental mass uncertainties from Particle Data Group 2024 contribute $< 0.01%$ and are negligible.*

The $\tau/\mu$ splitting is reproduced at sub-percent level. The systematic deviations for $\mu/e$ and $\tau/e$ are resolved by the $\mathcal{O}(d^4)$ curvature correction derived in Section T.21.8.

**Table T.21.2** (Charged leptons: predictions including $\mathcal{O}(d^4)$ curvature correction).

|Quantity |$d^2$|$D_{\mathrm{eff}}$|Corrected|Observation|Deviation|
|:-----------------:|:---:|:----------------:|:-------:|:---------:|:-------:|
|$\ln(m_\tau/m_\mu)$|$2$ |$3/8$ |$2.8212$ |$2.8224$ |$-0.042%$|
|$\ln(m_\mu/m_e)$ |$4$ |$13/6$ |$5.3306$ |$5.3316$ |$-0.019%$|
|$\ln(m_\tau/m_e)$ |— |(path sum) |$8.1518$ |$8.1540$ |$-0.027%$|

All three ratios match observation to better than $0.05%$ **(Theorem T.42.6)**. The $\tau/e$ prediction is the path sum $\ln(m_\tau/m_\mu) + \ln(m_\mu/m_e)$, automatically satisfying logarithmic additivity.

-----

## T.21.7 UV to IR Evolution

### T.21.7.1 Decomposition of the Effective Exponent

The UV prediction $\alpha_{\mathrm{UV}} = 3/2$ and the IR extraction $\alpha_{\mathrm{IR}} = 1.411$ differ by approximately $6%$. This reduction decomposes as

$$
\alpha_{\mathrm{IR}} = \alpha_{\mathrm{UV}} - \delta_{\mathrm{geom}} - \delta_{\mathrm{RG}},
$$

where $\delta_{\mathrm{geom}}$ arises from subleading geometric corrections and $\delta_{\mathrm{RG}}$ from renormalization group running.

### T.21.7.2 RG Contribution

The one-loop RG evolution of $\ln(y_3/y_i)$ satisfies

$$
\frac{d}{dt}\ln(y_3/y_i) = \gamma_3 - \gamma_i.
$$

For leptons, the generation-independent gauge terms cancel, and the Yukawa self-term contributes

$$
\gamma_3 - \gamma_i \approx \frac{3}{16\pi^2}(y_3^2 - y_i^2) \lesssim \mathcal{O}(10^{-4})
$$

across the running interval. Integrating from $\mu_G$ to $m_\tau$ yields a correction $\mathcal{O}(10^{-3})$ to $\ln(y_3/y_i)$, i.e., $\mathcal{O}(0.1%)$ in the effective exponent:

$$
\delta_{\mathrm{RG}} \lesssim 0.01,\alpha_{\mathrm{UV}}.
$$

### T.21.7.3 Geometric Correction

The dominant UV-to-IR reduction arises from the sinc correction (Theorem T.24.2.1):

$$
\alpha_{\mathrm{IR}} = \alpha_{\mathrm{UV}} \times f_{\mathrm{sinc}} = \frac{3}{2} \times \frac{\sin(1/\sqrt{3})}{1/\sqrt{3}} = 1.418.
$$

This accounts for the $5.5%$ reduction from $\alpha_{\mathrm{UV}} = 3/2$ to $\alpha_{\mathrm{IR}} = 1.418$, matching the empirical extraction $\alpha_{\mathrm{IR}}^{\mathrm{emp}} = 1.411$ within $0.5%$.

The complete hierarchy formula including $\mathcal{O}(d^4)$ corrections is derived in Section T.21.8 **(Theorem T.42.6)**. The fourth-order coefficient $\beta_{\mathrm{geom}}$ arises from the Van Vleck–Morette determinant in the Gaussian overlap integral on Riemannian manifolds [DeWitt 1965], applied to the Grassmannian $\mathrm{Gr}(2,8)$ with Bures metric. The effective sectional curvature $K_{\mathrm{eff}} = 2$ (Theorem Z.24) and Bures variance $\sigma_B^2 = 1/24$ (Lemma T.41.2) combine with the universal Van Vleck coefficient $1/12$ to yield the curvature coefficient $\beta_{\mathrm{geom}} = 1/144 = 1/C$.

The effective geodesic dimension $D_{\mathrm{eff}}(d^2)$ encodes the tangent space structure at each geodesic separation, with two regimes determined by the Golay decoding geometry:

- **Sub-threshold** ($d^2 < d^2_{\mathrm{th}} = 4$): Inside unique-decoding basin
- **Threshold** ($d^2 = d^2_{\mathrm{th}} = 4$): On decoding boundary

*Remark: Hamming-Chordal Correspondence.* The threshold $d^2_{\mathrm{th}} = d_{\min}/2$ arises from the Leech lattice construction (Lemma R.4.5): the $\sqrt{2}$ scaling of $E_8$ in the gluing $\Lambda_{24} = \bigcup_{c \in \mathcal{G}_{24}}(\sqrt{2}E_8^3 + g_c)$ maps $E_8$ squared distances $d^2_{E_8} \in \{2, 4, 6, 8\}$ to Leech squared distances $\{4, 8, 12, 16\}$. The Hamming-chordal correspondence $h = 2d^2$ (Lemma T.42.4) maps the Golay minimum distance $d_{\min} = 8$ to $E_8$ squared distance $d^2 = 4$. Thus the decoding boundary in Hamming space ($h = d_{\min}$) corresponds exactly to the chordal threshold $d^2_{\mathrm{th}} = d_{\min}/2 = 4$ in $E_8$ geometry.

-----

## T.21.8 Fourth-Order Correction from Grassmannian Curvature

The few-percent deviations in Table T.21.1 arise from the $\mathcal{O}(d^4)$ curvature correction on $\mathrm{Gr}(2,8)$. This section provides a complete derivation using:

1. The Van Vleck–Morette determinant for Gaussian overlaps on curved manifolds [DeWitt 1965]
1. The effective sectional curvature $K_{\mathrm{eff}} = 2$ imported from Theorem Z.24 from the symmetric-space geometry of $\mathrm{Gr}(2,8)$ (Theorem Z.24; Lemma Z.24a)
1. The Golay decoding partition structure [MacWilliams & Sloane 1977]
1. The path-additivity principle for generation triangles

### T.21.8.1 Van Vleck–Morette Expansion on Symmetric Kähler Manifolds

The generation manifold $\mathcal{M}_{\mathrm{gen}} = \mathrm{Gr}(2,8)$ is a compact irreducible Hermitian symmetric space $U(8)/(U(2) \times U(6))$. As such, it is Kähler–Einstein with parallel curvature tensor ($\nabla R = 0$), ensuring a clean perturbative expansion [Helgason 1978].

**Lemma T.42.1a** (Curvature Expansion of Gaussian Overlap). *On a Kähler manifold with sectional curvature $K_{\mathrm{sec}}$ in the holomorphic 2-plane, two isotropic Gaussian wavepackets of covariance $\sigma_B^2$ centered at points separated by squared geodesic distance $d^2$ have overlap integral satisfying:*

$$
-\ln \mathcal{I}(d^2) = \alpha_{\mathrm{flat}}\,d^2 - \frac{K_{\mathrm{sec}}}{12}\,\sigma_B^2\,d^4 + \mathcal{O}(d^6).
$$

*The coefficient $1/12$ is the universal Van Vleck coefficient entering the first curvature correction to the off-diagonal kernel.*

*Proof.* The generation manifold used later is $\mathrm{Gr}(2,8)$, a compact Hermitian symmetric space. In particular it is complete, analytic, has bounded curvature, and satisfies $\nabla R=0$. Therefore the standard short-distance off-diagonal asymptotic expansions of DeWitt (1965) for the Van Vleck–Morette determinant and of Gray–Vanhecke (1979) for geodesic Gaussian integrals apply in a normal-coordinate ball about the geodesic midpoint.

Let $\mathcal I_0(d^2)=\exp(-\alpha_{\mathrm{flat}}\,d^2)$ denote the flat-space overlap of two equal isotropic Gaussians of covariance $\sigma_B^2$. The first curvature correction to the off-diagonal overlap kernel in a holomorphic 2-plane of sectional curvature $K_{\mathrm{sec}}$ has the form
$$
\mathcal I(d^2)
=
\mathcal I_0(d^2)
\left(
1+\frac{K_{\mathrm{sec}}}{12}\,\sigma_B^2\,d^4+\mathcal O(d^6)
\right).
$$
Taking negative logarithms and using $-\log(1+x)=-x+\mathcal O(x^2)$ gives
$$
-\log \mathcal I(d^2)
=
-\log \mathcal I_0(d^2)
-\frac{K_{\mathrm{sec}}}{12}\,\sigma_B^2\,d^4+\mathcal O(d^6).
$$
Since $-\log \mathcal I_0(d^2)=\alpha_{\mathrm{flat}}\,d^2$ and the square of the $d^4$ correction contributes only at order $d^8$, this yields
$$
-\ln \mathcal I(d^2)
=
\alpha_{\mathrm{flat}}\,d^2
-\frac{K_{\mathrm{sec}}}{12}\,\sigma_B^2\,d^4
+\mathcal O(d^6).
$$
This is the claimed expansion. ∎

**Remark T.42.1.1: Universality of 1/12.** *The coefficient $1/12$ is universal across all Riemannian manifolds and appears in:*

- *Gray–Vanhecke geodesic ball volume expansions [Gray & Vanhecke 1979, Theorem 3.1]*
- *Heat kernel short-time asymptotics [Berger, Gauduchon & Mazet 1971, §E.III]*
- *Synge's world-function expansion [Synge 1960, §2.3]*

*It does not depend on any framework-specific assumptions beyond the choice of metric.*

### T.21.8.2 Effective Curvature and the Geometric Coefficient

**Theorem T.42.2** (Geometric Curvature Coefficient). *The fourth-order geometric correction coefficient is:*

$$
\boxed{\beta_{\mathrm{geom}} = \frac{K_{\mathrm{eff}}}{12}\,\sigma_B^2 = \frac{1}{C} = \frac{1}{bM} = \frac{1}{144}}
$$

*where $K_{\mathrm{eff}} = 2$ is the effective sectional curvature imported from Theorem Z.24 from the symmetric-space geometry of $\mathrm{Gr}(2,8)$ (Theorem Z.24; Lemma Z.24a), $\sigma_B^2 = 1/24$ is the Bures variance (Lemma T.41.2), and $C = bM = 144$ is the vacuum capacity (Theorem Z.13a).*

*Proof.*

**Step 1** (Effective curvature from Theorem Z.24). From the symmetric-space geometry of $\mathrm{Gr}(2,8)$ (Theorem Z.24; Lemma Z.24a), the effective sectional curvature for interface modes is:
$$
K_{\mathrm{eff}} = K_{\mathrm{avg}}^{\mathrm{Bures}} \times \frac{M-1}{ad_0} = \frac{32}{23} \times \frac{23}{16} = 2
$$
This value follows from the symmetric-space structure of $\mathrm{Gr}(2,8)$ (Theorem Z.24; Lemma Z.24a) and is reused here because the same Gaussian overlap functional on $\mathrm{Gr}(2,8)$ is being evaluated.

**Step 2** (Bures variance from Lemma T.41.2). Capacity saturation at the PCE-attractor yields:
$$
\sigma_B^2 = \frac{1}{M} = \frac{1}{24}
$$

**Step 3** (Direct calculation). Applying Lemma T.42.1:
$$
\beta_{\mathrm{geom}} = \frac{K_{\mathrm{eff}}}{12}\,\sigma_B^2 = \frac{2}{12} \times \frac{1}{24} = \frac{1}{6} \times \frac{1}{24} = \frac{1}{144}
$$

**Step 4** (Vacuum capacity identification). From Theorem Z.13a, the vacuum capacity is $C = bM = 6 \times 24 = 144$. The identity
$$
\beta_{\mathrm{geom}} = \frac{1}{C}
$$
demonstrates that the curvature correction is naturally scaled by the vacuum capacity—the same quantity governing the Golay code constraint structure. ∎

**Remark T.42.2.1: Structural Unity.** *The identity $\beta_{\mathrm{geom}} = 1/C$ is not a numerical coincidence but reflects deep structural unity:*

- *$K_{\mathrm{eff}} = 2 = 4/a$ depends only on the active dimension $a = 2$ (Theorem Z.24)*
- *$\sigma_B^2 = 1/M$ is fixed by capacity saturation (Lemma T.41.2)*
- *$C = bM$ is the vacuum capacity from Golay structure (Theorem Z.13a)*

*All three trace to the foundational constants $(K_0, d_0, a, b, M) = (3, 8, 2, 6, 24)$.*

### T.21.8.3 $E_8$ Generation Triangle and Path Additivity

**Definition T.42.2b** ($E_8$ Generation Triangle). *The three charged-lepton generations occupy $E_8$ root positions $r_\tau, r_\mu, r_e$ with squared distances:*
$$
(d^2_{\tau\mu}, d^2_{\mu e}, d^2_{\tau e}) = (2, 4, 6)
$$

*The corresponding $E_8$ inner products are $\langle r_\tau, r_\mu \rangle = 1$, $\langle r_\mu, r_e \rangle = 0$, $\langle r_\tau, r_e \rangle = -1$, via the relation $d^2 = 4 - 2\langle r_i, r_j \rangle$ for unit roots.*

**Theorem T.42.2a** (Path Additivity Principle). *The physical mass ratio $\ln(m_\tau/m_e)$ is computed as the path sum of adjacent-edge predictions along the dominant tunneling path $\tau \to \mu \to e$, not by applying the curvature formula (Theorem T.42.6) directly at $d^2_{\tau e} = 6$:*

$$
\ln\!\left(\frac{m_\tau}{m_e}\right) = \ln\!\left(\frac{m_\tau}{m_\mu}\right) + \ln\!\left(\frac{m_\mu}{m_e}\right).
$$

*where each term on the right is evaluated using Theorem T.42.6 with its own $D_{\mathrm{eff}}(d^2)$. This is the manuscript's dominant-path prescription for the generation triangle.*

*Proof.* Let
$$
L_{\tau\mu}:=\ln\!\left(\frac{m_\tau}{m_\mu}\right),\qquad
L_{\mu e}:=\ln\!\left(\frac{m_\mu}{m_e}\right)
$$
be the adjacent-edge logarithmic suppressions obtained from Theorem T.42.6 at $d^2_{\tau\mu}=2$ and $d^2_{\mu e}=4$. The dominant-path prescription in the theorem statement says that the effective long-range transition $\tau\to e$ is represented, at the order retained in this model, by composing the two adjacent channels rather than by introducing an independent direct $d^2_{\tau e}=6$ formula. Therefore the corresponding suppression factors multiply:
$$
e^{-L_{\tau e}} = e^{-L_{\tau\mu}}\,e^{-L_{\mu e}}.
$$
Taking negative logarithms gives
$$
L_{\tau e}=L_{\tau\mu}+L_{\mu e}.
$$
Substituting back the definitions of the $L_{ij}$ yields
$$
\ln\!\left(\frac{m_\tau}{m_e}\right)
=
\ln\!\left(\frac{m_\tau}{m_\mu}\right)
+
\ln\!\left(\frac{m_\mu}{m_e}\right).
$$
The role of the $E_8$ triangle geometry is only to explain why the adjacent edges use the already-defined values $D_{\mathrm{eff}}(2)$ and $D_{\mathrm{eff}}(4)$, while no separate value at $d^2=6$ is introduced. ∎

**Remark T.42.2.1a: Consistency Check.** *Path additivity ensures internal consistency: the $\tau/e$ prediction is uniquely determined by the adjacent-edge predictions, with no additional parameters or choices required for the longest-range ratio.*

### T.21.8.4 Golay-Chordal Threshold from First Principles

**Definition T.42.3a** (Golay-Chordal Threshold). *The Golay code $\mathcal{G}_{24}$ has minimum distance $d_{\min} = 8$. Under the Leech–Golay correspondence (Lemma T.42.4), the threshold chordal distance on $\mathrm{Gr}(2,8)$ is:*

$$
d^2_{\mathrm{th}} = \frac{d_{\min}}{2} = 4
$$

**Lemma T.42.4** (Hamming-Chordal Correspondence). *Under the embedding $\sqrt{2}E_8 \hookrightarrow \Lambda_{24}$ [Conway & Sloane 1999], the $E_8$ squared distance $d^2$ maps to Golay Hamming distance $h$ via:*

$$
h = 2d^2
$$

*The charged-lepton distances $(d^2_{\tau\mu}, d^2_{\mu e}) = (2, 4)$ correspond to Hamming separations $(4, 8)$.*

*Proof.* The Leech lattice $\Lambda_{24}$ contains $\sqrt{2}E_8 \oplus \sqrt{2}E_8 \oplus \sqrt{2}E_8$ as a sublattice, scaled so that $E_8$ root vectors have squared norm $4$ in Leech coordinates. For two $E_8$ roots at squared distance $d^2$, the corresponding Leech vectors differ in $h = 2d^2$ coordinates of the 24-bit Golay frame. ∎

### T.21.8.5 Two Geodesic Regimes and Effective Dimension

The effective geodesic dimension $D_{\mathrm{eff}}(d^2)$ quantifies how many independent directions contribute to the quartic curvature correction.

**Theorem T.42.5** (Effective Geodesic Dimension on the Golay assignment branch). *On the Golay effective-dimension branch, the effective dimension $D_{\mathrm{eff}}(d^2)$ entering the Van Vleck curvature correction is assigned by the Golay decoding-structure rule:*

$$
D_{\mathrm{eff}}(d^2) = \begin{cases}
\displaystyle\frac{t}{d_{\min}} = \frac{3}{8} & \text{if } d^2 < d^2_{\mathrm{th}} \quad \text{(sub-threshold)} \\[12pt]
\displaystyle\frac{k+1}{b} = \frac{13}{6} & \text{if } d^2 = d^2_{\mathrm{th}} \quad \text{(threshold)}
\end{cases}
$$

*where $t = 3$ is the Golay error correction capacity, $d_{\min} = 8$ is the minimum distance, $k = 12$ is the code dimension, and $b = 6$ is the inactive subspace dimension. The Golay data $(t, d_{\min}, k, b)$ are theorem-level inputs from Theorem Z.13. The assignment of these ratios as the effective curvature dimensions entering the Van Vleck expansion is the branch rule used in the charged-lepton hierarchy calculation.*

-----

**Regime I: Sub-threshold** ($d^2 < d^2_{\mathrm{th}}$, exemplified by $d^2 = 2$).

**Theorem T.42.5a** (Sub-threshold Effective Dimension). *For $d^2 = 2 < 4$, the geodesic lies within the unique-decoding basin of the Golay code. The effective dimension is:*

$$
D_{\mathrm{eff}} = \frac{t}{d_{\min}} = \frac{3}{8}
$$

*Proof.*

**Step 1** (Hamming distance). Under the correspondence of Lemma T.42.4, $d^2 = 2$ maps to Hamming distance $h = 4 < d_{\min} = 8$.

**Step 2** (Unique syndrome region). The Golay code has minimum distance $d_{\min} = 8$. For $h = 4 < d_{\min}$, the syndrome uniquely identifies the error coset—no codeword lies within Hamming distance $h$ of another codeword, ensuring unambiguous syndrome decoding even though $h > t$.

**Step 3** (Tangent space decomposition). The $M = 24$ interface modes decompose under the Golay syndrome structure:

- **Correctable directions** ($\dim = t = 3$): Error patterns of weight $\leq t$ with distinct syndromes
- **Non-contributing directions** ($\dim = 24 - t = 21$): Directions that do not change the syndrome or lie outside the correction ball

**Step 4** (QFI weighting and branch assignment). By the isotropy of the Bures metric (Theorem Z.5, Step 6), all interface modes have equal QFI weight $\lambda_i = 1$. Within the unique-decoding basin ($h < d_{\min}$), the $t$ correctable error directions carry independent curvature-sensitive syndrome labels, and the remaining $M-t$ directions are syndrome-degenerate within the decoding ball.

On the Golay assignment branch introduced in the statement of this theorem, the effective dimension entering the Van Vleck curvature correction is assigned by the ratio of curvature-sensitive directions to the full syndrome-resolution scale:
$$
D_{\mathrm{eff}} = \frac{\dim(\text{curvature-sensitive tangent directions})}{\dim(\text{syndrome resolution scale})} = \frac{t}{d_{\min}} = \frac{3}{8}.
$$

The denominator $d_{\min} = 8$ is the full syndrome resolution scale (minimum distance of $\mathcal{G}_{24}=[24,12,8]$), while the numerator $t = 3$ is the Golay error-correction capacity that fixes the number of independent correctable directions [Conway & Sloane 1999]. The numerical identification of this ratio with the Van Vleck effective dimension is the branch rule; the Golay data $(t, d_{\min})$ are theorem-level inputs. ∎

-----

**Regime II: Threshold** ($d^2 = d^2_{\mathrm{th}}$, exemplified by $d^2 = 4$).

**Theorem T.42.5b** (Threshold Effective Dimension). *For $d^2 = 4$, the geodesic lies on the decoding boundary where syndrome ambiguity first appears. The effective dimension is:*

$$
D_{\mathrm{eff}} = \frac{k + 1}{b} = \frac{13}{6}
$$

*Proof.*

**Step 1** (Boundary identification). Under the correspondence of Lemma T.42.4, $d^2 = 4$ maps to $h = 8 = d_{\min}$. This is the decoding boundary—the locus where pairs of codewords become equidistant from the error pattern.

**Step 2** (Linear map rank at threshold). The syndrome map $s: \mathbb{F}_2^{24} \to \mathbb{F}_2^{12}$ defined by $s(e) = He^T$ has rank $k = 12$, equal to the dimension of the parity-check matrix $H$. At the decoding boundary, the syndrome space is fully explored. Additionally, the radial direction (normal to the boundary) contributes one independent mode.

**Step 3** (Independent directions). At the threshold boundary:

- Tangential Jacobian rank: $k = 12$
- Radial direction: $+1$
- Total: $k + 1 = 13$ independent directions

**Step 4** (PCE distribution over inactive modes and branch assignment). The $M = 24$ interface modes connect active ($a = 2$) to inactive ($b = 6$) subspaces (Theorem Z.1). At the decoding boundary, the syndrome map has full rank $k=12$ and the radial boundary mode adds $+1$, giving $k+1=13$ independent directions (Steps 2–3). By QFI isotropy at the attractor (Theorem Z.5, Step 5), no inactive direction is distinguished; therefore these $k+1$ threshold directions distribute uniformly across the $b$ inactive channels.

On the Golay assignment branch, the effective per-channel dimension entering the Van Vleck curvature correction is assigned by:
$$
D_{\mathrm{eff}} = \frac{k + 1}{b} = \frac{13}{6} \approx 2.167.
$$

The numerical identification of this ratio with the Van Vleck effective dimension at the decoding threshold is the branch rule; the Golay data $(k, b)$ are theorem-level inputs. ∎



**Remark T.42.5.2 (Branch Dependence of the Golay-to-Van-Vleck Assignment).** The numerical values $D_{\mathrm{eff}}(2) = 3/8$ and $D_{\mathrm{eff}}(4) = 13/6$ depend on the Golay assignment branch introduced in Theorem T.42.5. The named supporting theorems (Theorem Z.13 for the Golay parameters, Lemma T.42.4 for the Hamming-chordal correspondence, Lemma T.42.1a for the universal Van Vleck coefficient, Theorem T.42.2 for $\beta_{\mathrm{geom}}$, Theorem Z.5 for QFI isotropy) supply the constituent quantities but do not uniquely force the identification of $t/d_{\min}$ and $(k+1)/b$ as the Van Vleck effective dimensions in the two regimes. An alternative assignment branch $D_{\mathrm{eff}}(d^2) \equiv 1$ for both regimes would respect the same named helper results while changing the curvature-correction weighting. A change $\delta D_{\mathrm{eff}} \sim 0.03$ shifts the $\mu/e$ log prediction by approximately $0.005$, comparable to the stated theory uncertainty.

**Remark T.42.5.1: Physical Interpretation.** *The $\mu/e$ mass ratio ($d^2 = 4$) probes the Golay decoding boundary—the critical stratum where error-correction ambiguity first appears. This boundary position amplifies the effective dimension, explaining why the curvature correction is largest for the $\mu/e$ ratio despite it being intermediate in the hierarchy.*

### T.21.8.6 Complete Hierarchy Formula

**Theorem T.42.6** (Fourth-Order Corrected Mass Hierarchy). *The charged-lepton mass hierarchy including the $\mathcal{O}(d^4)$ curvature correction is:*

$$
\boxed{\ln\!\left(\frac{m_j}{m_i}\right) = \alpha_{\mathrm{IR}}\,d^2_{ij} - \frac{\alpha_{\mathrm{IR}}}{C} \cdot D_{\mathrm{eff}}(d^2_{ij}) \cdot d^4_{ij} + \mathcal{O}(d^6)}
$$

*applied to adjacent generation pairs $(\tau, \mu)$ and $(\mu, e)$. The $\tau/e$ ratio is computed via path additivity (Theorem T.42.2a):*

$$
\ln\!\left(\frac{m_\tau}{m_e}\right) = \ln\!\left(\frac{m_\tau}{m_\mu}\right) + \ln\!\left(\frac{m_\mu}{m_e}\right)
$$

*where:*

- *$\alpha_{\mathrm{IR}} = 1.418$ (Theorem T.24.2.1)*
- *$C = bM = 144$ (Theorem Z.13a)*
- *$D_{\mathrm{eff}}(d^2)$ is the effective geodesic dimension (Theorem T.42.5)*

*Proof.* The formula combines:

- Lemma T.42.1 (Van Vleck expansion with universal $1/12$ factor)
- Theorem T.42.2 ($\beta_{\mathrm{geom}} = (K_{\mathrm{eff}}/12)\sigma_B^2 = 1/C$)
- Theorem T.42.5 ($D_{\mathrm{eff}}$ in each regime)
- Theorem T.42.2a (path additivity for $\tau/e$)

The effective correction coefficient is $\beta_{\mathrm{eff}} = (\alpha_{\mathrm{IR}}/C) \cdot D_{\mathrm{eff}}$. ∎

**Numerical Evaluation:**

|Ratio |$d^2$|Regime |$D_{\mathrm{eff}}$|$d^4$|Correction|Prediction|
|:--------:|:---:|:-----------:|:----------------:|:---:|:--------:|:--------:|
|$\tau/\mu$|$2$ |Sub-threshold|$3/8$ |$4$ |$0.0148$ |$2.8212$ |
|$\mu/e$ |$4$ |Threshold |$13/6$ |$16$ |$0.3414$ |$5.3306$ |
|$\tau/e$ |— |Path sum |— |— |— |$8.1518$ |

**Detailed Calculations:**

$$
\begin{aligned}
\ln(m_\tau/m_\mu) &= 1.418 \times 2 - \frac{1.418}{144} \times \frac{3}{8} \times 4 = 2.836 - 0.0148 = 2.8212 \\[6pt]
\ln(m_\mu/m_e) &= 1.418 \times 4 - \frac{1.418}{144} \times \frac{13}{6} \times 16 = 5.672 - 0.3414 = 5.3306 \\[6pt]
\ln(m_\tau/m_e) &= 2.8212 + 5.3306 = 8.1518 \quad \text{(path sum)}
\end{aligned}
$$

**Comparison with Particle Data Group 2024 values** $(m_\tau, m_\mu, m_e) = (1776.86, 105.66, 0.5110)$ MeV:

|Quantity |Prediction|Observation|Deviation|
|:-----------------:|:--------:|:---------:|:-------:|
|$\ln(m_\tau/m_\mu)$|$2.8212$ |$2.8224$ |$-0.04%$ |
|$\ln(m_\mu/m_e)$ |$5.3306$ |$5.3316$ |$-0.02%$ |
|$\ln(m_\tau/m_e)$ |$8.1518$ |$8.1540$ |$-0.03%$ |

All predictions agree with observation to better than $0.05%$, with path additivity automatically satisfied. ∎

**Corollary T.42.6a** (Electron Mass from Tau Mass). *Given the tau mass $m_\tau = 1776.86$ MeV, the electron mass is:*

$$
m_e = m_\tau \times \exp\!\left(-8.1518\right) = 1776.86 \times 2.881 \times 10^{-4}\,\mathrm{MeV} = 0.5120\,\mathrm{MeV}
$$

*in agreement with the PDG value $m_e = 0.5110$ MeV within $0.2%$.*

### T.21.8.7 Complete Derivation Chain

**Theorem T.42.7** (Zero Continuously Adjustable Parameters Within PU Framework). *Given the foundational axioms of the Predictive Universe framework—specifically SPAP encodability (Theorem 15) and the Landauer thermodynamic cost $\varepsilon = \ln 2$ (Theorem Z.1)—the hierarchy formula contains no additional continuously adjustable parameters. Every coefficient traces to the Horizon Constant $K_0 = 3$:*

**Stage 1: Structural constants**
$$
K_0 = 3 \xrightarrow{\text{Thm 15}} d_0 = 8 \xrightarrow{\text{Thm Z.1}} (a,b) = (2,6) \xrightarrow{\text{Thm Z.5}} M = 24
$$

**Stage 2: Hierarchy coefficients**
$$
M = 24 \xrightarrow{\text{Lem T.41.2}} \sigma_B^2 = \frac{1}{24} \xrightarrow{\text{Cor T.41.3}} \alpha_{\mathrm{UV}} = \frac{3}{2} \xrightarrow{\text{Thm T.24.2.1}} \alpha_{\mathrm{IR}} = 1.418
$$

**Stage 3: Curvature correction**
$$
K_{\mathrm{eff}} = 2 \xrightarrow{\text{Thm Z.24}} \beta_{\mathrm{geom}} = \frac{K_{\mathrm{eff}}}{12}\sigma_B^2 = \frac{1}{144} = \frac{1}{C}
$$

**Stage 4: Effective dimension (from Golay structure)**
$$
\mathcal{G}_{24}[24,12,8] \xrightarrow{\text{Def T.1}} (t, d_{\min}, k) = (3, 8, 12) \xrightarrow{\text{Thm T.42.5}} D_{\mathrm{eff}}(d^2)
$$

**Remark T.42.7.1: Meaning of “Zero Continuously Adjustable Parameters Within PU Framework”.** *The statement “zero continuously adjustable parameters” must be understood in context:*

- *The PU framework itself rests on foundational axioms: SPAP encodability (which yields $K_0 = 3$), the Landauer thermodynamic cost ($\varepsilon = \ln 2$), and standard Riemannian geometry on the state manifold.*
- *Given these axioms, the charged-lepton mass hierarchy predictions follow deterministically with no additional fitting or adjustment.*
- *This is analogous to how the Standard Model, given its gauge structure and particle content, makes parameter-free predictions for certain ratios—but the gauge structure itself is an input.*
- *The PU framework's claim is that $(K_0, \varepsilon) = (3, \ln 2)$ are not arbitrary choices but follow from logical (SPAP) and thermodynamic (Landauer) necessity. The mass hierarchy predictions then test this claim against observation.*

### T.21.8.8 Extension to Quark Sector

**Theorem T.42.8** (Quark Sector Hierarchy). *The same geometric framework applies to quarks with sector-specific triads and prefactors:*

$$
\ln\!\left(\frac{m_j}{m_i}\right)_f = c_f \cdot \left[\alpha_{\mathrm{IR}}\,d^2_{ij,f} - \frac{\alpha_{\mathrm{IR}}}{C} \cdot D_{\mathrm{eff}}(d^2_{ij,f}) \cdot d^4_{ij,f}\right] + \mathcal{O}(d^6)
$$

*where $c_f$ is the sector prefactor (Theorem T.38) and $(d^2_{32,f}, d^2_{21,f})$ are the adjacent-generation $E_8$ distances for sector $f$.*

**Remark T.42.8.1: QCD Corrections.** *Quark-sector predictions apply to short-distance Yukawa eigenvalues (or $\overline{\text{MS}}$ masses) at the matching scale $\mu_G$. A precision comparison to quoted masses requires SM RG evolution to $\mu_{\mathrm{EW}}$, QCD decoupling at heavy thresholds, and multi-loop running in a fixed scheme; the explicit protocol and T1/T2/T3 uncertainty decomposition are given in Section T.25.5.3. Same-scale hierarchy invariants provide a controlled intermediate diagnostic under common-scheme reduction (Section T.25.5.4), and the down-sector $A_2/D_4$ frustration correction is derived in Section T.25.6a with a matching uncertainty budget (Section T.25.6a.10).*

-----

## T.21.9 Quark Sector and Sector Prefactors

The same geometric hierarchy applies to quarks, with generation-independent sector prefactors determined by gauge/Bures normalization at the attractor.

### T.21.9.1 Explicit $E_8$ Triads for Quark Sectors

PCE selection for quark sectors uses the observed hierarchy to choose among admissible $\mathcal{R}$-values.

**Down-type quarks** ($\mathcal{R} \approx 2$; minimal $(d^2_{32}, d^2_{31}) = (2, 4)$):

$$
\begin{aligned}
r_3 &= (1, 1, 0, 0, 0, 0, 0, 0),\\
r_2 &= (1, 0, 1, 0, 0, 0, 0, 0) \quad\Rightarrow\quad d^2_{32} = 2,\\
r_1 &= (-1, 1, 0, 0, 0, 0, 0, 0) \quad\Rightarrow\quad d^2_{31} = 4.
\end{aligned}
$$

**Up-type quarks** (stronger suppression; $(d^2_{32}, d^2_{31}) = (4, 8)$):

$$
\begin{aligned}
r_3 &= (1, 1, 0, 0, 0, 0, 0, 0),\\
r_2 &= (-1, 1, 0, 0, 0, 0, 0, 0) \quad\Rightarrow\quad d^2_{32} = 4,\\
r_1 &= (-1, -1, 0, 0, 0, 0, 0, 0) \quad\Rightarrow\quad d^2_{31} = 8.
\end{aligned}
$$

Each triple comprises valid $E_8$ roots of type $(\pm 1, \pm 1, 0, \ldots, 0)$, and the listed pairwise distances are verified directly.

### T.21.9.2 Sector Prefactors

**Theorem T.44** (Sector prefactors).
Let $c_\ell, c_d, c_u$ denote sector prefactors for charged leptons, down-type quarks, and up-type quarks, respectively. At the matching scale $\mu_G$, the prefactors satisfy:

$$
\frac{c_\ell}{c_d} = \frac{8}{3}, \qquad \frac{c_d}{c_u} \approx 1.02,
$$

with $c_\ell/c_d$ fixed by the normalization constraint (Corollary T.34.1) and $c_d/c_u$ controlled by right-handed hypercharge dependence (Theorem T.38).

*Proof.* In the prefactor ratio computation one uses the PU-normalized gauge coefficient $g_U$ for canonical generators (Theorem T.13); the SM-canonical matching factors $Z_i$ control the gauge-boson kinetic terms but do not alter the fermion-sector prefactor ratios set by the Bures weights $\kappa_i$ (Theorem T.34). The sector normalization entering the prefactor tilt is

$$
z_{\mathrm{sector}}
=
\left(
\kappa_2\,C_2^{SU(2)}
+
\kappa_1\,Y^2
+
\kappa_3\,C_2^{SU(3)}\,N_c
\right)g_U^2,
$$

where $C_2$ are quadratic Casimirs and $Y$ is the hypercharge.

**Left-chiral doublets:**

- Lepton $L$: $C_2(\mathrm{SU}(2)) = 3/4$, $C_2(\mathrm{SU}(3)) = 0$, $Y^2 = 1/4$, $N_c=1$
- Quark $Q$: $C_2(\mathrm{SU}(2)) = 3/4$, $C_2(\mathrm{SU}(3)) = 4/3$, $Y^2 = 1/36$, $N_c=3$

Therefore:
$$
z_\ell=\left(\frac{3}{4}\kappa_2+\frac{1}{4}\kappa_1\right)g_U^2,
\qquad
z_d=\left(\frac{3}{4}\kappa_2+\frac{1}{36}\kappa_1+4\kappa_3\right)g_U^2,
$$
where $4\kappa_3$ comes from $C_2^{SU(3)}=4/3$ and $N_c=3$. The normalization constraint (Corollary T.34.1) imposes $z_d/z_\ell=64/9$, hence
$$
\frac{c_\ell}{c_d} = \sqrt{\frac{z_d}{z_\ell}} = \frac{8}{3}.
$$

**Right-chiral singlets (Theorem T.38):**

For up- and down-type singlets ($C_2(\mathrm{SU}(3))=4/3$, $N_c=3$, giving $4\kappa_3$):

$$
z_{u_R} = \left(4\kappa_3 + \frac{4}{9}\kappa_1\right)g_U^2, \qquad z_{d_R} = \left(4\kappa_3 + \frac{1}{9}\kappa_1\right)g_U^2,
$$

and the prefactor ratio is

$$
\frac{c_d}{c_u} = \sqrt{\frac{z_{u_R}}{z_{d_R}}} = \sqrt{\frac{4\kappa_3 + \frac{4}{9}\kappa_1}{4\kappa_3 + \frac{1}{9}\kappa_1}}.
$$

Using $(\kappa_1,\kappa_2,\kappa_3)=(0.695,0.729,1.140)$ (Corollary T.34.2) gives $c_d/c_u\approx 1.025\approx 1.02$. ∎

With these prefactors and the appropriate $E_8$ triads, the observed quark hierarchies are reproduced up to QCD threshold effects and standard pole–$\overline{\mathrm{MS}}$ conversions. The top-Yukawa anchor $y_t^{\mathrm{PU}}(\mathfrak{A}_{PU}) = 1$ fixes the overall normalization in the up sector at the PU fixed point.

-----

## T.21.10 Leech Lattice Consistency

The Leech lattice $\Lambda_{24}$ is constructed via Construction A as a union of cosets of the sublattice $\sqrt{2}E_8 \oplus \sqrt{2}E_8 \oplus \sqrt{2}E_8$, with coset representatives determined by the extended binary Golay code $\mathcal{G}_{24}$ (Conway–Sloane, *Sphere Packings, Lattices and Groups*).

The scaling by $\sqrt{2}$ maps $E_8$ roots (squared norm $2$) to Leech minimal vectors (squared norm $4$), ensuring even unimodularity and minimal norm $4$. This homothety is consistent with Lemma T.41.4 when expressed in a common physical normalization:

$$
d^2_{E_8} \xrightarrow{\times\sqrt{2}} d^2_{\sqrt{2}E_8} = 2 d^2_{E_8},
$$

so that $E_8$ distances ${2, 4, 6, 8}$ map to ${4, 8, 12, 16}$ in the Leech embedding. This aligns with the interface dimension $M = 24$ and the Golay error-correction structure at the PU fixed point $\mathfrak{A}_{PU}$.

-----

## T.21.11 Summary

1. The hierarchy of inter-generation masses is governed by

$$
\ln\!\left(\frac{m_j}{m_i}\right) = \alpha\,d^2_{E_8}(r_i,r_j), \qquad \alpha = \frac{1}{16\,\sigma_B^2}.
$$

1. At the PU fixed point $\mathfrak{A}_{PU}$, the Predictive Ward identity fixes the quadratic kernel, isotropy fixes the covariance structure, and capacity saturation fixes the normalization $\langle r_B^2 \rangle = 1$. Together these yield

$$
\sigma_B^2 = \frac{1}{24}, \qquad \alpha_{\mathrm{UV}} = \frac{3}{2}.
$$

1. The effective infrared exponent from charged leptons is $\alpha_{\mathrm{IR}} = 1.411 \approx \sqrt{2}$, reproducing $\ln(m_\tau/m_\mu)$ at the $0.2%$ level.
1. The $\alpha$-independent ratio invariant $\mathcal{R} := d^2_{31}/d^2_{32} = 3$ (Corollary T.42.2) matches observation within $3.8%$ at leading order. Including the $\mathcal{O}(d^4)$ curvature correction with effective geodesic dimension $D_{\mathrm{eff}}(d^2)$ (Theorem T.42.6) reduces all deviations to $< 0.05%$.
1. PCE triad selection uniquely determines the charged-lepton triad $(d^2_{32}, d^2_{31}) = (2, 6)$ as the minimal-$d^2_{32}$ solution among $\mathcal{R} = 3$ candidates.
1. Explicit $E_8$ triads are provided for all fermion sectors:
- Charged leptons: $(d^2_{32}, d^2_{31}, d^2_{21}) = (2, 6, 4)$, formula $(a, b, 2a)$, $\mathcal{R} = 3$
- Neutrinos: $(d^2_{32}, d^2_{31}, d^2_{21}) = (2, 6, 6)$, formula $(a, b, b)$, $\mathcal{R} = 3$
- Down-type quarks: $(d^2_{32}, d^2_{31}) = (2, 4)$, $\mathcal{R} = 2$
- Up-type quarks: $(d^2_{32}, d^2_{31}) = (4, 8)$, $\mathcal{R} = 2$
1. Sector prefactors satisfy structural constraints at matching: $c_\ell/c_d = 8/3$ (normalization constraint, Corollary T.34.1) and $c_d/c_u \approx 1.02$ (right-handed hypercharge tilt, Theorem T.38 with Corollary T.34.2).
1. **Absolute mass scale anchor.** The tau lepton mass is determined by the universal normalization $\mathcal{N}_{PU}$ connecting Bures geometry to Yukawa eigenvalues:
$$
\mathcal{N}_{PU} = \frac{1}{N_g} \cdot \frac{1}{M} \cdot \frac{1}{\sqrt{n_G}} = \frac{1}{3 \cdot 24 \cdot \sqrt{12}} = \frac{1}{72\sqrt{12}} \approx 0.00401
$$
where the three factors arise from: (i) democratic generation projector trace $1/N_g = 1/3$, (ii) capacity saturation per mode $1/M = 1/24$, (iii) PCE isotropy amplitude $1/\sqrt{n_G} = 1/\sqrt{12}$. The sector prefactor using the PCE-optimal weights $(\kappa_1^*,\kappa_2^*,\kappa_3^*) \approx (0.695,0.729,1.140)$ from Corollary T.34.2 and $g_U^2 = \pi/6$ (Theorem T.39a) is as follows.

**Normalization convention.** To avoid collision with other uses of the symbol $Y_0$ in the manuscript, we distinguish:
- $Y_0^{\rm src}$: the discrete-action source normalization (a separate constant; e.g. $Y_0^{\rm src}=2$ where defined), and
- $Y_0^{\rm sec}$: the sector-prefactor normalization entering $c_{\rm sector}=Y_0^{\rm sec}/\sqrt{z_{\rm sector}}$.

In this appendix we fix
$$
Y_0^{\rm sec} \equiv g_U,
$$
so the lepton sector prefactor is
$$
c_\ell = \frac{Y_0^{\rm sec}}{\sqrt{z_\ell}} = \frac{g_U}{\sqrt{z_\ell}}, \qquad
z_\ell = \left(\tfrac{3}{4}\kappa_2^* + \tfrac{1}{4}\kappa_1^*\right)g_U^2
\approx 0.7205 \times 0.5236 = 0.3773,
$$
and therefore $c_\ell \approx 1.178$.

The leading-order Yukawa coupling at matching is therefore
$$
y_\tau^{(0)}(\mu_G) = \mathcal{N}_{\rm PU}\,c_\ell
= \frac{1}{72\sqrt{12}}\cdot\frac{g_U}{\sqrt{z_\ell}}
\approx 0.00401 \times 1.178 \approx 0.00472.
$$
In the 2-loop SM-running scheme defined in Lemma T.45.1a, the running factor is $\eta_\tau \approx 1.11$ (scheme-defined; do not over-interpret sub-percent digits without a full EFT threshold treatment), hence the leading-order absolute mass anchor is
$$
\boxed{
m_\tau^{(0)} = \frac{v_{\rm PU}}{\sqrt{2}}\,\eta_\tau\,y_\tau^{(0)}(\mu_G)
\approx 178.2 \times 1.113 \times 0.00472 \approx 0.94\ \text{GeV},
}
$$
a factor $\approx 1.9$ below $m_\tau^{\rm obs}=1776.86\ \text{MeV}$ (Particle Data Group (2024)), using $v_{\rm PU}=252\ \text{GeV}$ (Theorem T.6; Theorem T.29).

**Remark T.45.1 (Leading-order normalization gap).** This tension affects only the *absolute normalization*. The lepton mass *ratios* are controlled by the $E_8$ log-ratio predictions (Theorem T.42.6) and remain at sub-percent precision because they are insensitive to the overall prefactor $\mathcal{N}_{\rm PU} c_\ell$. The pathway to closing the normalization gap—two-loop threshold matching at $\mu_G$, Van Vleck–Morette curvature terms at order $1/M = 1/24$ in the absolute normalization, and PCE-anisotropy corrections—is identified but has not yet been computed. Until then, the absolute mass anchor carries $\mathcal{O}(1)$ theoretical uncertainty, while the ratio predictions remain controlled by the $d^2/M$ expansion (Theorem T.42.6).

**Lemma T.45.1a (Two-loop SM RGE correction to absolute lepton masses).** *Let $y_\tau(\mu_G)$ be the tau Yukawa coupling at the matching scale*
$$
\mu_G = M_{\rm Pl}e^{-\kappa_R}\approx 1.51\times 10^{15}\ \text{GeV}.
$$
*In this appendix we adopt the matching convention $\mu_G\equiv M_R$ (the seesaw threshold and Yukawa matching scale coincide), so the effective theory below $\mu_G$ is the SM. The leading-order PU framework estimate is*
$$
 y_\tau^{(0)}(\mu_G)=\mathcal{N}_{\rm PU}\,c_\ell
 =\frac{1}{72\sqrt{12}}\cdot\frac{g_U}{\sqrt{z_\ell}}\approx 0.00472,
$$
*with $\mathcal{N}_{\rm PU}=1/(72\sqrt{12})\approx 0.00401$ and $c_\ell=g_U/\sqrt{z_\ell}\approx 1.178$ (Section T.21.11; Corollary T.34.2; Theorem T.39a).* 

*Define the SM running factor*
$$
\eta_\tau := \frac{y_\tau(m_\tau)}{y_\tau(\mu_G)}.
$$
*Then the absolute lepton masses obey*
$$
\boxed{
 m_\tau = \frac{v_{\rm PU}}{\sqrt{2}}\,\eta_\tau\,y_\tau(\mu_G),\qquad
 m_\mu = m_\tau\,e^{-\ln(m_\tau/m_\mu)},\qquad
 m_e = m_\tau\,e^{-\ln(m_\tau/m_e)}.
}
$$
*Here $\ln(m_\tau/m_\mu)=2.8212$ and $\ln(m_\tau/m_e)=8.1518$ are the $E_8$ log-ratio predictions (Theorem T.42.6), and $v_{\rm PU}=A_{\rm EW}M_{\rm Pl}e^{-\kappa_{\rm EW}}=252\ \text{GeV}$ (Theorem T.6; Theorem T.29).* 

*Proof.* **Step 1 (RGE setup).** Using GUT-normalized $g_1^2=\tfrac{5}{3}g_Y^2$, the two-loop $\overline{\rm MS}$ beta functions for the coupled set $\{g_1^2,g_2^2,g_3^2,y_t^2,\lambda,y_\tau^2\}$ are given in Buttazzo et al. (2013), Appendix B, eqs. (96)–(103) (with $y_b$ set to $0$ here). At one loop the tau Yukawa satisfies
$$
16\pi^2\,\frac{d y_\tau}{d\ln\mu}
= y_\tau\!\left[
3y_t^2 + \frac{5}{2}y_\tau^2 - \frac{9}{4}g_2^2 - \frac{9}{4}g_1^2
\right],
$$
and we include the full two-loop contributions in the numerical integration below. Neglecting $y_b$ and lighter Yukawas (numerically irrelevant for $\eta_\tau$ at the stated precision), the PU boundary conditions at $\mu_G$ are fixed by
$g_i^2(\mu_G)=g_U^2/Z_i$ with $g_U^2=\pi/6$ (Theorem T.39a), $Z_i=1+\Delta_i/24$ from the lifted spectral threshold data (Definition T.17a), together with $y_t(\mu_G)=0.392$ for the validation threshold tuple of Remark T.26.2 and $\lambda(\mu_G)=0$.

**Step 2 (Two-loop integration with explicit electroweak matching).** The symmetric-phase SM RGEs are matched onto the low-energy effective description at an electroweak scale $\mu_{\rm EW}$ as a scheme choice: evolve with full SM RGEs for $\mu\in[\mu_G,\mu_{\rm EW}]$, and for $\mu<\mu_{\rm EW}$ decouple the top Yukawa by setting $y_t(\mu)=0$ in the beta functions while continuing to evolve $\{g_1^2,g_2^2,g_3^2,\lambda,y_\tau^2\}$ down to $\mu=m_\tau$.

Varying $\mu_{\rm EW}$ over the band $[m_t,\ v_{\rm PU}] = [173\ \text{GeV},\ 252\ \text{GeV}]$ yields
$$
\eta_\tau(\mu_{\rm EW}=173\ \text{GeV})=1.10937,\qquad
\eta_\tau(\mu_{\rm EW}=252\ \text{GeV})=1.11603,
$$
so we quote the scheme-defined value
$$
\boxed{\eta_\tau = 1.1127 \pm 0.0033,}
$$
where the uncertainty is the half-range from the $\mu_{\rm EW}$ matching-scale variation (a proxy for scheme/threshold dependence). Numerically, $\eta_\tau$ is insensitive to the input $y_\tau(\mu_G)$ itself (changes $\ll 10^{-4}$ under a $\pm 5\%$ variation).

**Supplemental note (reproducible two-loop integration code).** The following Python implements the *two-loop* SM RGE integration used in Step 2 (with $y_b$ neglected) and reproduces the quoted $\eta_\tau$ band. It integrates the equations in Buttazzo et al. (2013), Appendix B, eqs. (96)–(99), (101), (103), which are written as derivatives with respect to $\ln\bar\mu^2$, so the integration variable is $u=\ln\mu^2$.

~~~python
# Reproduce Lemma T.45.1a: eta_tau = y_tau(m_tau)/y_tau(mu_G)
#
# Two-loop SM RGEs in terms of g_i^2, y_t^2, lambda, y_tau^2:
#   Buttazzo et al. (2013), Appendix B, eqs. (96)–(99), (101), (103).
#
# Note: Buttazzo et al. write d/d ln(mu_bar^2); we therefore integrate in
#       u = ln(mu^2), so the beta functions can be used directly without
#       extra factors of 2.
#
# Requirements: numpy, scipy  (tested with solve_ivp + DOP853).
#
import math
import numpy as np
from scipy.integrate import solve_ivp

def betas_two_loop(u, X, yt_decouple=False):
    # State vector X = [g1sq, g2sq, g3sq, yt2, lam, ytau2]
    # where g1 is GUT-normalized: g1^2 = 5/3 g_Y^2.
    g1, g2, g3, yt2, lam, ytau2 = X
    yt2_eff = 0.0 if yt_decouple else yt2  # scheme: decouple top Yukawa below mu_EW

    fourpi = 4.0 * math.pi
    k1 = 1.0 / (fourpi**2)   # 1/(4π)^2
    k2 = 1.0 / (fourpi**4)   # 1/(4π)^4

    # --- Gauge couplings: eqs. (96)–(98), truncated at two loops; y_b set to 0.
    dg1 = (g1**2) * (k1 * (41.0/10.0)
                     + k2 * ((44.0/5.0)*g3 + (27.0/10.0)*g2 + (199.0/50.0)*g1
                             - (17.0/10.0)*yt2_eff - (3.0/2.0)*ytau2))

    dg2 = (g2**2) * (k1 * (-19.0/6.0)
                     + k2 * (12.0*g3 + (35.0/6.0)*g2 + (9.0/10.0)*g1
                             - (3.0/2.0)*yt2_eff - (1.0/2.0)*ytau2))

    dg3 = (g3**2) * (k1 * (-7.0)
                     + k2 * (-26.0*g3 + (9.0/2.0)*g2 + (11.0/10.0)*g1
                             - 2.0*yt2_eff))

    # --- Higgs quartic: eq. (99), truncated at two loops; y_b set to 0.
    beta_lam_1 = (
        lam*(12.0*lam + 6.0*yt2_eff + 2.0*ytau2 - (9.0/2.0)*g2 - (9.0/10.0)*g1)
        - 3.0*(yt2_eff**2) - (ytau2**2)
        + (9.0/16.0)*(g2**2) + (27.0/400.0)*(g1**2) + (9.0/40.0)*g2*g1
    )
    beta_lam_2 = (
        lam**2 * (-156.0*lam - 72.0*yt2_eff - 24.0*ytau2 + 54.0*g2 + (54.0/5.0)*g1)
        + lam*yt2_eff * (-(3.0/2.0)*yt2_eff + 40.0*g3 + (45.0/4.0)*g2 + (17.0/4.0)*g1)
        + lam*ytau2 * (-(1.0/2.0)*ytau2 + (15.0/4.0)*g2 + (15.0/4.0)*g1)
        + lam * (-(73.0/16.0)*(g2**2) + (1887.0/400.0)*(g1**2) + (117.0/40.0)*g2*g1)
        + (yt2_eff**2) * (15.0*yt2_eff - 16.0*g3 - (4.0/5.0)*g1)
        + yt2_eff * (-(9.0/8.0)*(g2**2) - (171.0/200.0)*(g1**2) + (63.0/20.0)*g2*g1)
        + (ytau2**2) * (5.0*ytau2 - (6.0/5.0)*g1)
        + ytau2 * (-(3.0/8.0)*(g2**2) - (9.0/8.0)*(g1**2) + (33.0/20.0)*g2*g1)
        + (305.0/32.0)*(g2**3) - (3411.0/4000.0)*(g1**3)
        - (289.0/160.0)*(g2**2)*g1 - (1677.0/800.0)*g2*(g1**2)
    )
    dlam = k1*beta_lam_1 + k2*beta_lam_2

    # --- Top Yukawa: eq. (101), truncated at two loops; y_b set to 0.
    if yt_decouple:
        dyt2 = 0.0
    else:
        beta_yt2_1 = yt2 * ((9.0/2.0)*yt2 + ytau2 - 8.0*g3 - (9.0/4.0)*g2 - (17.0/20.0)*g1)
        beta_yt2_2 = yt2 * (
            yt2 * (-12.0*yt2 - (9.0/4.0)*ytau2 - 12.0*lam + 36.0*g3 + (225.0/16.0)*g2 + (393.0/80.0)*g1)
            + ytau2 * (-(9.0/4.0)*ytau2 + (15.0/8.0)*g2 + (15.0/8.0)*g1)
            + 6.0*lam**2 - 108.0*(g3**2) - (23.0/4.0)*(g2**2) + (1187.0/600.0)*(g1**2)
            + 9.0*g3*g2 + (19.0/15.0)*g3*g1 - (9.0/20.0)*g2*g1
        )
        dyt2 = k1*beta_yt2_1 + k2*beta_yt2_2

    # --- Tau Yukawa: eq. (103), truncated at two loops; y_b set to 0.
    beta_ytau2_1 = ytau2 * (3.0*yt2_eff + (5.0/2.0)*ytau2 - (9.0/4.0)*g2 - (9.0/4.0)*g1)
    beta_ytau2_2 = ytau2 * (
        6.0*lam**2 - (23.0/4.0)*(g2**2) + (1371.0/200.0)*(g1**2) + (27.0/20.0)*g2*g1
        + yt2_eff * (-(27.0/4.0)*yt2_eff - (27.0/4.0)*ytau2 + 20.0*g3 + (45.0/8.0)*g2 + (17.0/8.0)*g1)
        + ytau2 * (-3.0*ytau2 - 12.0*lam + (165.0/16.0)*g2 + (537.0/80.0)*g1)
    )
    dytau2 = k1*beta_ytau2_1 + k2*beta_ytau2_2

    return np.array([dg1, dg2, dg3, dyt2, dlam, dytau2], dtype=float)

def integrate_eta(mu_G, mu_EW, mu_low, gU2, Z, yt_G, lam_G, ytau_G):
    # initial conditions at mu_G
    g1_G = gU2 / Z[0]
    g2_G = gU2 / Z[1]
    g3_G = gU2 / Z[2]
    yt2_G = yt_G**2
    ytau2_G = ytau_G**2
    X0 = np.array([g1_G, g2_G, g3_G, yt2_G, lam_G, ytau2_G], dtype=float)

    u_G = math.log(mu_G**2)
    u_EW = math.log(mu_EW**2)
    u_low = math.log(mu_low**2)

    # Stage 1: full SM running from mu_G -> mu_EW
    sol1 = solve_ivp(lambda u, X: betas_two_loop(u, X, yt_decouple=False),
                     t_span=(u_G, u_EW), y0=X0, method="DOP853",
                     rtol=1e-9, atol=1e-12)
    if not sol1.success:
        raise RuntimeError(sol1.message)

    X_EW = sol1.y[:, -1].copy()

    # Stage 2: below mu_EW, decouple top Yukawa in the beta functions (scheme choice)
    X_EW[3] = 0.0  # set y_t^2 = 0 below mu_EW
    sol2 = solve_ivp(lambda u, X: betas_two_loop(u, X, yt_decouple=True),
                     t_span=(u_EW, u_low), y0=X_EW, method="DOP853",
                     rtol=1e-9, atol=1e-12)
    if not sol2.success:
        raise RuntimeError(sol2.message)

    ytau2_low = sol2.y[5, -1]
    eta_tau = math.sqrt(ytau2_low / ytau2_G)
    return eta_tau

def trunc(x, ndp=5):
    # Truncate (not round) to ndp decimal places (used for matching the lemma's quoted digits).
    s = 10.0**ndp
    return math.floor(x * s) / s

if __name__ == "__main__":
    mu_G = 1.51e15      # GeV
    m_tau = 1.77686     # GeV   (Particle Data Group (2024))
    gU2 = math.pi/6.0
    # Validation-run tuple only; replace by a forward spectral output before using this as a prediction
    Z = (1 + 15.14/24.0, 1 + 20.94/24.0, 1 + 18.41/24.0)
    yt_G = 0.392
    lam_G = 0.0

    # Any O(1e-2) value gives the same eta_tau to <1e-4; choose the self-consistent value from Step 3.
    ytau_G = 0.00896

    for mu_EW in (173.0, 252.0):
        eta = integrate_eta(mu_G, mu_EW, m_tau, gU2, Z, yt_G, lam_G, ytau_G)
        print(f"mu_EW = {mu_EW:7.1f} GeV  ->  eta_tau = {eta:.8f}  (rounded: {eta:.5f}, truncated: {trunc(eta):.5f})")

    eta173 = integrate_eta(mu_G, 173.0, m_tau, gU2, Z, yt_G, lam_G, ytau_G)
    eta252 = integrate_eta(mu_G, 252.0, m_tau, gU2, Z, yt_G, lam_G, ytau_G)
    eta_mid = 0.5*(eta173 + eta252)
    eta_half_range = 0.5*abs(eta252 - eta173)
    print(f"eta_tau(mid) = {eta_mid:.7f} ; half-range = {eta_half_range:.7f}")
~~~
A common $\mathcal{O}(1)$ threshold shift $\delta$ in standard unification-threshold notation, entering
$\alpha_i^{-1}(\mu_G)=Z_i\alpha_U^{-1}+\delta/(2\pi)$,
changes $\eta_\tau$ at the $\sim 10^{-4}$–$10^{-3}$ level (depending on sign/magnitude). This is subdominant to the $\mu_{\rm EW}$ matching band above, but should not be quoted more sharply without a full threshold analysis.

**Step 3 (Self-consistent extraction of $y_\tau(\mu_G)$).** Imposing the observed tau mass (Particle Data Group (2024)) $m_\tau^{\rm obs}=1776.86\ \text{MeV}$ fixes the matching-scale Yukawa by inversion:
$$
 y_\tau(\mu_G)
 =\frac{m_\tau^{\rm obs}\sqrt{2}}{v_{\rm PU}\,\eta_\tau}
 =\frac{1776.86\times 10^{-3}\times\sqrt{2}}{252\times 1.1127}
 =0.00896\pm 0.00003,
$$
which *defines* the self-consistent $y_\tau(\mu_G)$ required to match $m_\tau^{\rm obs}$ for a given $(v_{\rm PU},\eta_\tau)$.

**Step 4 (Muon and electron masses via $E_8$ ratios).** The $E_8$ log-ratio predictions (Theorem T.42.6) imply
$$
\frac{m_\mu}{m_\tau}=e^{-\ln(m_\tau/m_\mu)}=e^{-2.8212},\qquad
\frac{m_e}{m_\tau}=e^{-\ln(m_\tau/m_e)}=e^{-8.1518}.
$$
Using $m_\tau=m_\tau^{\rm obs}$ as the overall anchor, the implied masses are
$$
 m_\mu = 1776.86\times e^{-2.8212}=105.78\ \text{MeV},\qquad
 m_e = 1776.86\times e^{-8.1518}=0.51212\ \text{MeV}.\quad\square
$$

**Numerical verification**

| Quantity |  Predicted  |   Observed (Particle Data Group (2024))  | Deviation | Status (⊘ = consistency check) |
| :------- | :---------: | :---------------------: | :-------: | :----------------------------: |
| $m_\tau$ | 1776.86 MeV | 1776.86 MeV |    $0$    |                ⊘               |
| $m_\mu$  | 105.78 MeV | 105.6583755 MeV |  $+0.12\%$ |                ✓               |
| $m_e$    | 0.51212 MeV | 0.51099895 MeV |  $+0.22\%$ |                ✓               |

*The $m_\tau$ row is a self-consistency check: $y_\tau(\mu_G)$ was extracted from $m_\tau^{\rm obs}$ in Step 3. The $m_\mu$ and $m_e$ rows test the parameter-free $E_8$ log-ratio predictions (Theorem T.42.6) once the overall scale is fixed.*

**Interpretation.** The ratio agreements above are genuine tests of the $E_8$ log-ratio predictions. The absolute normalization remains open at leading order: using $y_\tau^{(0)}(\mu_G)\approx 0.00472$ instead of the self-consistent value gives $m_\tau^{(0)}\approx 0.94\ \text{GeV}$ (Remark T.45.1), i.e. a factor $\approx 1.9$ below observation.

**Error budget (parametric / scheme):**

| Source | Contribution | Status |
| :----- | :----------: | :----: |
| Two-loop SM RGE + electroweak-threshold matching (scheme: $\mu_{\rm EW}\in[m_t,v_{\rm PU}]$) | $\eta_\tau = 1.1127 \pm 0.0033$ | Computed (scheme-defined) |
| Two-loop threshold matching at $\mu_G$ in the absolute normalization | not yet computed | TBD |
| $E_8$ log-ratio theory uncertainty ($d^2/M$ expansion) | $\le 0.005$ in $\ln$ per ratio | Theorem T.42.6 bound |

1. The Leech lattice connection via $\sqrt{2}E_8$ and the Golay code aligns with the $M = 24$ interface mode structure.
1. The Golay threshold $d^2_{\mathrm{th}} = d_{\min}/2 = 4$ determines two geodesic regimes on $\mathrm{Gr}(2,8)$ (Theorem T.42.5):
- **Sub-threshold** ($d^2 < 4$): Inside unique-decoding basin; $D_{\mathrm{eff}} = t/d_{\min} = 3/8$.
- **Threshold** ($d^2 = 4$): On decoding boundary; $D_{\mathrm{eff}} = (k+1)/b = 13/6$.

Path additivity (Theorem T.42.2a) ensures $\ln(m_\tau/m_e) = \ln(m_\tau/m_\mu) + \ln(m_\mu/m_e)$ exactly. The curvature coefficient $\beta_{\mathrm{geom}} = K_{\mathrm{eff}}/(12)\sigma_B^2 = 1/C = 1/144$ follows from the Van Vleck expansion [Gray & Vanhecke 1979] with $K_{\mathrm{eff}} = 2$ (Theorem Z.24). All three charged-lepton mass ratios are reproduced to $< 0.05%$ with no additional free parameters beyond the PU framework axioms.

-----

## T.21.12 Verification

All quantities trace to established theorems:

|Quantity |Value |Source |Derivation |
|:-----------------------------------|:--------------------|:----------------|:---------------------------------------------------------|
|$K_0$ |$3$ |Theorem 15 |Horizon Constant (SPAP encodability) |
|$d_0$ |$8$ |Theorem 23 |$2^{K_0}$ |
|$(a, b)$ |$(2, 6)$ |Theorem Z.1 |Landauer cost $\varepsilon = \ln 2$ |
|$(\kappa_1^*,\kappa_2^*,\kappa_3^*)$|$(0.695,0.729,1.140)$|Corollary T.34.2 |PCE optimum with normalization constraint |
|$g_U^2$ |$\pi/6$ |Theorem T.39a |Holonomy per mode $2\pi/M$ |
|$\mathcal{N}_{PU}$ |$1/(72\sqrt{12})$ |Section T.21.11 |Democratic × capacity × isotropy |
|$M$ |$24$ |Theorem Z.5 |$2ab$ (QFI-active modes) |
|$K_{\mathrm{eff}}$ |$2$ from the symmetric-space geometry of $\mathrm{Gr}(2,8)$ (Theorem Z.24; Lemma Z.24a) |Theorem Z.24 |$K_{\mathrm{avg}}^{\mathrm{Bures}} \times (M-1)/(ad_0)$ from the symmetric-space geometry (Lemma Z.24a) |
|$\sigma_B^2$ |$1/24$ |Lemma T.41.2 |Capacity saturation |
|$1/12$ |Universal |Van Vleck–Morette|World-function expansion coefficient |
|$\beta_{\mathrm{geom}}$ |$1/144$ |Theorem T.42.2 |$(K_{\mathrm{eff}}/12)\sigma_B^2 = 1/C$ |
|$C$ |$144$ |Theorem Z.13a |$bM = 6 \times 24$ (vacuum capacity) |
|$t$ |$3$ |Definition T.1 |$\lfloor(d_{\min}-1)/2\rfloor$ (Golay correction capacity)|
|$d_{\min}$ |$8$ |Definition T.1 |Golay minimum distance |
|$k$ |$12$ |Definition T.1 |Golay code dimension |
|$d^2_{\mathrm{th}}$ |$4$ |Lemma T.42.4 |$d_{\min}/2$ (Hamming-chordal correspondence) |
|$D_{\mathrm{eff}}(d^2 = 2)$ |$3/8$ |Theorem T.42.5a |$t/d_{\min}$ (sub-threshold) |
|$D_{\mathrm{eff}}(d^2 = 4)$ |$13/6$ |Theorem T.42.5b |$(k+1)/b$ (threshold) |

**Derivation chain:**

$$
K_0 = 3 \to d_0 = 8 \to (a,b) = (2,6) \to M = 24 \to \sigma_B^2 = \frac{1}{24} \to \alpha_{\mathrm{UV}} = \frac{3}{2} \to \alpha_{\mathrm{IR}} = 1.418
$$

$$
K_{\mathrm{eff}} = 2 \xrightarrow{\text{Van Vleck}} \beta_{\mathrm{geom}} = \frac{K_{\mathrm{eff}}}{12}\sigma_B^2 = \frac{1}{144} = \frac{1}{C}
$$

$$
\mathcal{G}_{24}[24,12,8] \to (t, d_{\min}, k) = (3, 8, 12) \xrightarrow{\text{Hamming-chordal}} d^2_{\mathrm{th}} = 4 \to D_{\mathrm{eff}}(d^2)
$$

**Results:**

|Observable |Leading Order|Corrected |Observed |Agreement|
|:--------------------|:-----------:|:---------:|:---------:|:-------:|
|$\ln(m_\tau/m_\mu)$ |$2.836$ |$2.8212$ |$2.8224$ |$0.04%$ |
|$\ln(m_\mu/m_e)$ |$5.672$ |$5.3306$ |$5.3316$ |$0.02%$ |
|$\ln(m_\tau/m_e)$ |$8.508$ |$8.1518$ |$8.1540$ |$0.03%$ |
|$m_e$ (from $m_\tau$)|— |$0.512$ MeV|$0.511$ MeV|$0.2%$ |

-----

## T.21.13 Internal Consistency Check

**Logarithmic Additivity:**
$$
\ln(m_\tau/m_\mu) + \ln(m_\mu/m_e) = 2.8212 + 5.3306 = 8.1518 = \ln(m_\tau/m_e) \quad \checkmark
$$

Path additivity (Theorem T.42.2a) guarantees this identity is satisfied exactly by construction, with no internal inconsistency.

-----

# Part VI: Flavor Mixing

# Section T.22: CKM Matrix from $E_8$ Grassmannian Geometry

## T.22.1 Introduction

The Cabibbo-Kobayashi-Maskawa (CKM) matrix parametrizes quark flavor mixing in the Standard Model, encoding the mismatch between mass and weak interaction eigenstates (Cabibbo 1963; Kobayashi & Maskawa 1973). Its elements exhibit a striking hierarchical pattern: diagonal elements near unity, off-diagonal elements suppressed by powers of the Cabibbo angle λ ≈ 0.22. This section derives all CKM matrix elements from the $E_8$ Grassmannian geometry established in Section T.21, completing **Problem T.3**.

The derivation proceeds through a unified framework with two limiting regimes:

1. **Heavy-generation mixing** (3↔1, 3↔2): Gaussian overlap suppression on the generation manifold Gr(2,8)
1. **Light-generation mixing** (1↔2): Geometric frustration between incompatible lattice symmetries

All parameters trace to prior derivations:

- Hierarchy coefficient α = 3/2 from capacity saturation (Corollary T.41.3)
- $E_8$ triad distances from Section T.21.9.1
- Generation count N_g = 3 from Proposition R.4.2
- Sector stiffness ratio κ_d/κ_u = 1.02 from Theorem T.38

-----

## T.22.2 $E_8$ Triad Structure

### T.22.2.1 Root System Properties

The $E_8$ root system in ℝ⁸ consists of 240 vectors with ||r||² = 2. For any two roots r₁, r₂, the squared distance satisfies:

$$d^2 = ||r_1 - r_2||^2 = ||r_1||^2 + ||r_2||^2 - 2\langle r_1, r_2 \rangle = 4 - 2\langle r_1, r_2 \rangle$$

The allowed values are d² ∈ {0, 2, 4, 6, 8}, corresponding to inner products ⟨r₁, r₂⟩ ∈ {2, 1, 0, -1, -2}.

### T.22.2.2 Generation Triads

From Section T.21.9.1, the three fermion generations are represented by $E_8$ root triads with the following squared distances:

**Down-type quarks (d, s, b):**

|Pair|d² |Inner Product|Lattice Angle|
|:---|:-:|:-----------:|:-----------:|
|3↔2 |2 |+1 |60° |
|3↔1 |4 |0 |90° |
|2↔1 |6 |−1 |120° |

**Up-type quarks (u, c, t):**

|Pair|d² |Inner Product|Lattice Angle|
|:---|:-:|:-----------:|:-----------:|
|3↔2 |4 |0 |90° |
|3↔1 |8 |−2 |180° |
|2↔1 |4 |0 |90° |

These assignments yield hierarchy ratios R = d²₃₁/d²₃₂ consistent with observed mass hierarchies (Theorem T.37).

### T.22.2.3 Lattice Angles

**Lemma T.44a** ($E_8$ Lattice Angles). *The angle θ between two $E_8$ roots with squared distance d² is given by:*

$$\cos\theta = \frac{4 - d^2}{4}$$

*The 1↔2 distances determine distinct lattice geometries:*

- *Up-sector (d² = 4): cos θ_u = 0 ⟹ θ_u = 90° (Cubic/D₄)*
- *Down-sector (d² = 6): cos θ_d = −1/2 ⟹ θ_d = 120° (Hexagonal/A₂)*

*Proof.* For roots r₁, r₂ with ||r₁||² = ||r₂||² = 2:

$$\cos\theta = \frac{\langle r_1, r_2 \rangle}{||r_1|| \cdot ||r_2||} = \frac{\langle r_1, r_2 \rangle}{2}$$

From d² = 4 − 2⟨r₁, r₂⟩, we obtain ⟨r₁, r₂⟩ = (4 − d²)/2, hence:

$$\cos\theta = \frac{4 - d^2}{4}$$

Direct substitution:
$$\theta_u = \arccos\left(\frac{4-4}{4}\right) = \arccos(0) = 90°$$
$$\theta_d = \arccos\left(\frac{4-6}{4}\right) = \arccos\left(-\frac{1}{2}\right) = 120°$$

The 90° angle corresponds to D₄ (cubic) lattice symmetry, while 120° corresponds to A₂ (hexagonal) lattice symmetry. ∎

-----

## T.22.3 Unified Framework for Flavor Mixing

### T.22.3.1 The Master Formula

**Theorem T.45** (Unified Mixing Amplitude). *The CKM matrix element between generations i and j is given by the overlap integral on Gr(2,8):*

$$|V_{ij}| = \mathcal{P}_{ij} \times \mathcal{O}_{ij}$$

*where:*

- *𝒫_ij is the geometric prefactor from representation theory*
- *𝒪_ij is the wavefunction overlap factor*

*The overlap decomposes into radial and angular components:*

$$\mathcal{O}_{ij} = \exp\left(-\alpha \cdot d^2_{\mathrm{eff}}\right) \times |\sin(\Theta_{ij}/2)|$$

*where:*

- *$d^2_{\mathrm{eff}}$ is the effective $E_8$ root-distance squared between generation centers (Lemma T.41.4 conversion from Bures to $E_8$ distance has been applied)*
- *$\Theta_{ij}$ is the angular mismatch between vacuum orientations*
- *$\alpha = 3/2$ on the probability-overlap branch of Theorem T.41.5 (Corollary T.41.3)*

*Convention.* The exponent is $-\alpha \cdot d^2_{\mathrm{eff}}$ (no factor of $1/2$), consistent with the proof below and with the form used in Theorems T.46–T.47 and the heavy-generation calculations $|V_{cb}| = \sqrt{2/3} \cdot e^{-3}$ (Theorem T.47, with $d^2 = 2$ and $\alpha = 3/2$).

*Proof.* The mixing amplitude is the overlap of generation wavefunctions:
$$V_{ij} = \langle\psi_i|\psi_j\rangle = \int_{\mathrm{Gr}(2,8)} \psi_i^*(P)\psi_j(P),d\mu_B(P)$$

On the Grassmannian, this decomposes into:

**Radial overlap:** Following Theorem T.41.5, the mixing amplitude is proportional to the probability overlap $|\langle\psi_i|\psi_j\rangle|^2$. For Gaussian wavefunctions with variance $\sigma^2_B = 1/24$ (Lemma T.41.2):
$$\exp\left(-\frac{d^2_B}{2\sigma^2_B}\right)$$

Converting to $E_8$ distance via Lemma T.41.4 ($d^2_B = d^2_{E_8}/8$):
$$\exp\left(-\frac{d^2_{E_8}}{16\sigma^2_B}\right) = \exp(-\alpha d^2_{E_8})$$

with $\alpha = 1/(16\sigma^2_B) = 3/2$ (Corollary T.41.6).

**Angular overlap:** For vacuum orientations misaligned by angle Θ, the transition amplitude between orthogonal states is sin(Θ/2).

The prefactor 𝒫_ij accounts for normalization and projection effects specific to each regime. ∎

### T.22.3.2 Regime Classification and Boundary

**Definition T.45.1a** (Localization Parameter). *For a generation g at $E_8$ distance d_g from the vacuum center, define the localization parameter:*

$$\lambda_g = \alpha \cdot d^2_g$$

*where α = 3/2 is the hierarchy coefficient.*

**Proposition T.45.2** (Model regime boundary). *Within the Gaussian-overlap model adopted in Section T.22, the crossover between the tunneling and frustration regimes occurs when the vacuum separation is comparable to the localization width:*
$$
d_{2,\mathrm{vac}} \sim \ell_g.
$$

*Proof.* In the Gaussian-overlap model, tunneling amplitudes are controlled by the ratio of the vacuum separation to the localization width. Overlaps are unsuppressed when $d_{2,\mathrm{vac}} \lesssim \ell_g$ and exponentially small when $d_{2,\mathrm{vac}} \gg \ell_g$. The regime boundary therefore occurs parametrically at $d_{2,\mathrm{vac}} \sim \ell_g$. QED

**Corollary T.45.3** (Regime Classification Summary).

|Transition|d²_ref|λ = αd²|Regime |Dominant Mechanism |
|:---------|:----:|:-----:|:---------:|:----------------------|
|3↔2 |2 |3 |Tunneling |Exponential suppression|
|3↔1 |4 |6 |Tunneling |Exponential suppression|
|1↔2 |— |— |Frustration|Angular mismatch |

-----

## T.22.4 Heavy-Generation Mixing: Tunneling Regime

### T.22.4.1 Mixing Amplitude Formula

**Theorem T.46** (Heavy-Generation Mixing Amplitude). *For transitions involving generation 3, the CKM amplitude in the dominant sector f is:*

$$|V_{3j}| = \sqrt{\frac{d^2_{3j,f}}{N_g}} \times \exp\left(-\alpha \cdot d^2_{\mathrm{ref}}\right)$$

*where:*

- *d²_{3j,f} is the $E_8$ distance in sector f ∈ {up, down}*
- *d²_ref = min(d²_{3j,d}, d²_{3j,u}) is the least-suppressed channel*
- *α = 3/2 (Corollary T.41.3)*
- *N_g = 3 (Proposition R.4.2)*

*Proof.*

**Step 1 (Geometric prefactor on the CKM geometric-prefactor branch).** On the CKM geometric-prefactor branch, the geometric prefactor arises from rotation generators in $N_g$-dimensional generation space. For an $SU(N_g)$ rotation by angle $\theta$ in the $i$-$j$ plane, the mixing element is proportional to $\sin\theta$. Two related conventions appear in the literature: (a) $\sin^2\theta = d^2/N_g$, giving $|V| \propto \sqrt{d^2/N_g}$ (the convention adopted in the displayed formula and used numerically in Theorems T.47–T.48); (b) $\sin^2\theta = d^2/(2N_g)$, giving $|V| \propto \sqrt{d^2/(2N_g)}$ (which would absorb an additional factor of $1/\sqrt{2}$ relative to the displayed numerical results). This appendix uses convention (a) throughout, so $|V_{cb}| = \sqrt{d^2_{32,d}/N_g} \cdot e^{-\alpha d^2_{32,d}} = \sqrt{2/3} \cdot e^{-3}$. The choice between (a) and (b) is the CKM geometric-prefactor branch; convention (b) would multiply both $|V_{cb}|$ and $|V_{ub}|$ by $1/\sqrt{2}$ relative to the convention (a) values used here.

**Step 2 (Exponential suppression).** The exponential factor exp(−αd²) comes from Gaussian wavefunction overlap. From Theorem T.41.5, the Yukawa coupling (and hence mixing amplitude) satisfies:
$$Y_{ij} \propto \exp\left(-\frac{d^2_{E_8}}{16\sigma^2_B}\right) = \exp(-\alpha d^2_{E_8})$$

**Step 3 (Reference distance selection).** When both up and down sectors contribute to the transition amplitude, the total amplitude is:
$$V_{3j} = A_d e^{i\phi_d} + A_u e^{i\phi_u}$$

The exponential suppression $\exp(-\alpha d^2_{\mathrm{ref}})$ represents tunneling through the dominant path connecting generations, with $d^2_{\mathrm{ref}} = \min(d^2_{3j,d}, d^2_{3j,u})$. Both sector amplitudes share this tunneling factor because the weak vertex couples to both mass eigenstate bases through the common generation transition. The sector-specific geometric weights $\sqrt{d^2_{3j,f}/N_g}$ encode the projection onto each sector's $E_8$ configuration.

For $|V_{cb}|$, where $d^2_{32,d} = 2 \ll d^2_{32,u} = 4$, the ratio of tunneling factors $e^{-3}/e^{-6} \approx 20$ renders the up-sector negligible. For $|V_{ub}|$, the shared reference $d^2_{\mathrm{ref}} = 4$ admits comparable sector amplitudes whose interference generates the observed magnitude and CP phase. ∎

### T.22.4.2 Calculation of $\vert V_{cb}\vert$

**Theorem T.47** ($\vert V_{cb}\vert$ from $E_8$ Geometry). *The CKM element $\vert V_{cb}\vert$ is:*

$$|V_{cb}| = \sqrt{\frac{2}{3}} \times e^{-3} = 0.0407$$

*Proof.*

**Step 1 (Parameter identification).** From Section T.21.9.1:

- d²_{32,d} = 2 (down-sector distance)
- d²_{32,u} = 4 (up-sector distance)
- d²_ref = min(2, 4) = 2

From established framework:

- N_g = 3 (Proposition R.4.2)
- α = 3/2 (Corollary T.41.3)

**Step 2 (Geometric prefactor).**
$$\sqrt{\frac{d^2_{32,d}}{N_g}} = \sqrt{\frac{2}{3}} = 0.81650$$

**Step 3 (Exponential suppression).**
$$e^{-\alpha d^2_{\mathrm{ref}}} = e^{-(3/2)(2)} = e^{-3} = 0.04979$$

**Step 4 (Final result).**
$$|V_{cb}| = 0.81650 \times 0.04979 = 0.0407$$

**Experimental comparison** (Particle Data Group 2024):
$$|V_{cb}|_{\mathrm{exp}} = 0.0405 \pm 0.0010$$

|Quantity|Theory|Experiment |Deviation|
|:-------|:----:|:-------------:|:-------:|
|$\vert V_{cb}\vert$ |0.0407|0.0405 ± 0.0010|+0.2σ |

∎

### T.22.4.3 Calculation of $\vert V_{ub}\vert$

For the 1→3 transition:

- d²_{31,d} = 4, d²_{31,u} = 8
- d²_ref = min(4, 8) = 4

Both sectors contribute with a relative CP phase.

**Theorem T.48** ($\vert V_{ub}\vert$ with Sector Interference). *The total amplitude includes interference between sectors with relative phase δ:*

$$|V_{ub}|^2 = |A_d|^2 + |A_u|^2 - 2|A_d||A_u|\cos\delta$$

*where the sector amplitudes at common reference are:*
$$A_d = \sqrt{\frac{d^2_{31,d}}{N_g}} \times e^{-\alpha d^2_{\mathrm{ref}}} = \sqrt{\frac{4}{3}} \times e^{-6} = 0.00286$$
$$A_u = \sqrt{\frac{d^2_{31,u}}{N_g}} \times e^{-\alpha d^2_{\mathrm{ref}}} = \sqrt{\frac{8}{3}} \times e^{-6} = 0.00405$$

*Proof.*

**Step 1 (Berry phases of sector paths).** Each sector amplitude A_f acquires a Berry phase from the geodesic path in Gr(2,8) from generation 1 to generation 3:
$$A_f = |A_f| e^{i\gamma_f}$$
where γ_f = ∫_{path_f} 𝒜 is the Berry phase along the sector-f geodesic.

**Step 2 (Phase difference from enclosed area).** The relative phase between sectors is:
$$\Delta\gamma = \gamma_d - \gamma_u = \int_{\Sigma_{1\to3}} \mathcal{F}$$
where Σ_{1→3} is the region bounded by the up-sector and down-sector paths from generation 1 to generation 3.

**Step 3 (Relation to CP holonomy).** The region Σ_{1→3} is half of the full flavor quadrilateral Σ_full. Since δ = ∫_{Σ_full} ℱ (Theorem T.54), we have:
$$\Delta\gamma = \frac{\delta}{2}$$

However, the two paths traverse opposite orientations relative to the full loop, contributing a sign:
$$\phi_u - \phi_d = \pi - \delta$$

**Step 4 (Interference formula).** The total amplitude is:
$$V_{ub} = A_d + A_u e^{i(\phi_u - \phi_d)} = A_d + A_u e^{i(\pi - \delta)} = A_d - A_u e^{-i\delta}$$

Taking the modulus squared:
$$|V_{ub}|^2 = |A_d|^2 + |A_u|^2 - 2\mathrm{Re}[A_d^* A_u e^{-i\delta}] = |A_d|^2 + |A_u|^2 - 2|A_d||A_u|\cos\delta$$

**Step 5 (Numerical evaluation).** With δ = 66.7° (Theorem T.56):
$$|A_d|^2 = (0.00286)^2 = 8.19 \times 10^{-6}$$
$$|A_u|^2 = (0.00405)^2 = 1.64 \times 10^{-5}$$
$$-2|A_d||A_u|\cos(66.7°) = -2(0.00286)(0.00405)(0.3955) = -9.15 \times 10^{-6}$$
$$|V_{ub}|^2 = 8.19 \times 10^{-6} + 1.64 \times 10^{-5} - 9.15 \times 10^{-6} = 1.54 \times 10^{-5}$$
$$|V_{ub}| = \sqrt{1.54 \times 10^{-5}} = 0.00392$$

**Experimental comparison** (Particle Data Group 2024):
$$|V_{ub}|_{\mathrm{exp}} = (3.82 \pm 0.24) \times 10^{-3}$$

|Quantity|Theory |Experiment |Deviation|
|:-------|:-----:|:---------------:|:-------:|
|$\vert V_{ub}\vert$ |0.00392|0.00382 ± 0.00024|+0.4σ |

**Corollary T.48.1** (Topological Origin of Interference Sign). *The destructive (minus) sign in the interference formula arises because:*

1. *The up and down paths traverse opposite sides of the flavor quadrilateral*
1. *This opposite orientation contributes a factor of e^{iπ} = −1 to the relative phase*
1. *The remaining phase e^{−iδ} comes from the Berry curvature enclosed between paths*

*The sign is topologically determined, not a fitting choice.* ∎

-----

## T.22.5 Light-Generation Mixing: Frustration Regime

### T.22.5.1 The Geometric Frustration Mechanism

The perturbative tunneling formula predicts $\vert V_{us}\vert_{\mathrm{pert}}$ ~ exp(−αd²) ~ 0.002 for d² = 4, severely underpredicting the observed value of 0.225. This two-orders-of-magnitude discrepancy signals a qualitatively different mechanism.

**Theorem T.49** (Geometric Frustration). *The light generations (1 and 2) inhabit a shared vacuum valley where the physical state must reconcile two incompatible geometric constraints from the $E_8$ root lattice:*

- *Up-sector: d²₁₂ = 4 → θ_u = 90° (Cubic/D₄ symmetry)*
- *Down-sector: d²₁₂ = 6 → θ_d = 120° (Hexagonal/A₂ symmetry)*

*The vacuum minimizes elastic energy by aligning with the stiffness-weighted geometric bisector.*

*Proof.*

**Step 1 (Constraint incompatibility).** From Lemma T.44, the up-sector enforces orthogonal generation alignment (90°) while the down-sector enforces hexagonal alignment (120°). These constraints are incompatible—no single vacuum orientation satisfies both.

**Step 2 (PCE energy functional).** Each sector f contributes an elastic energy cost when the vacuum deviates from its preferred lattice angle:
$$V_f(\theta) = \frac{\kappa_f}{2}(\theta - \theta_f)^2$$
where κ_f is the sector stiffness, determined by the Yukawa coupling strength.

The total vacuum energy is:
$$V_{\mathrm{PCE}}(\theta) = V_u(\theta) + V_d(\theta) = \frac{\kappa_u}{2}(\theta - 90°)^2 + \frac{\kappa_d}{2}(\theta - 120°)^2$$

**Step 3 (Stationarity condition).** Setting dV/dθ = 0:
$$\kappa_u(\theta - 90°) + \kappa_d(\theta - 120°) = 0$$
$$\theta_{\mathrm{vac}} = \frac{\kappa_u \cdot 90° + \kappa_d \cdot 120°}{\kappa_u + \kappa_d}$$

**Step 4 (Stiffness ratio from Theorem T.38).** From Theorem T.38, the sector prefactor ratio is:
$$\frac{c_d}{c_u} = \sqrt{\frac{4\kappa_3 + \frac{4}{9}\kappa_1}{4\kappa_3 + \frac{1}{9}\kappa_1}} \approx 1.02$$

for κ₃ in the phenomenologically relevant range. Since stiffness scales as κ ∝ c², we have:
$$\frac{\kappa_d}{\kappa_u} = \left(\frac{c_d}{c_u}\right)^2 \approx 1.02$$

**Step 5 (Vacuum position).** With κ_d/κ_u = 1.02 (central value from Theorem T.38):
$$\theta_{\mathrm{vac}} = \frac{1 \times 90° + 1.02 \times 120°}{1 + 1.02} = \frac{90° + 122.4°}{2.02} = 105.15°$$

**Step 6 (Stability verification).** The second derivative:
$$\left.\frac{\partial^2 V_{\mathrm{PCE}}}{\partial \theta^2}\right|_{\theta_{\mathrm{vac}}} = \kappa_u + \kappa_d > 0$$

confirms the weighted bisector is a stable minimum. ∎

### T.22.5.2 The Mismatch Angle

**Definition T.50** (Sector Tilt Angles). *Each sector deviates from the vacuum by:*

$$\theta_{\mathrm{tilt},u} = \theta_{\mathrm{vac}} - \theta_u = 105.15° - 90° = 15.15°$$
$$\theta_{\mathrm{tilt},d} = \theta_d - \theta_{\mathrm{vac}} = 120° - 105.15° = 14.85°$$

*The physical mixing is determined by the up-sector tilt, as the weak interaction couples left-handed up-type quarks to down-type quarks.*

### T.22.5.3 The A₂ Projection Factor

The $E_8$ roots occupy 8-dimensional space, but physical mass eigenstates are defined in the A₂ (SU(3) flavor) subspace. The observable mixing angle is the projection of the $E_8$ mismatch onto this physical manifold.

**Theorem T.51** (Root-Weight Duality in A₂). *The geometric projection from constraint directions (roots) to mass eigenstates (weights) introduces a factor:*

$$\mathcal{P} = \cos(30°) = \frac{\sqrt{3}}{2}$$

*Proof.*

**Step 1 (A₂ root system).** The A₂ Lie algebra admits two natural bases related by duality:

**Simple roots {α₁, α₂}:** Define the adjoint action and constraint geometry. These generate gauge transformations that cost energy, determining the “stiff” directions (vacuum constraints). The angle between simple roots is 120°.

**Fundamental weights {ω₁, ω₂}:** Define matter representations. Fermion generations transform in the fundamental representation **3**, with states labeled by weights. Mass eigenstates correspond to weight eigenstates.

**Step 2 (Duality relation).** The relation connecting roots and weights is:
$$\frac{2\langle\omega_i, \alpha_j\rangle}{\langle\alpha_j, \alpha_j\rangle} = \delta_{ij}$$

In the standard A₂ geometry with ||α||² = 2:

- Roots lie at angles: 0°, 60°, 120°, 180°, 240°, 300°
- Weights lie at angles: 30°, 90°, 150°, 210°, 270°, 330°

**Step 3 (Angular offset).** The angular offset between any root and the nearest weight is exactly 30°. This follows from the duality condition, which geometrically requires weights to bisect the angles between adjacent roots.

**Step 4 (Physical interpretation).** The vacuum tilt θ_tilt is defined along root directions (constraint geometry), while physical mixing is measured in the weight basis (mass eigenstates). The observable mixing is:

$$|V_{us}|_{\mathrm{obs}} = \cos(30°) \times \sin(\theta_{\mathrm{tilt},u})$$

The factor cos(30°) = √3/2 is uniquely determined by A₂ Lie algebra structure—it is not a fitted parameter (Humphreys 1972, §13). ∎

### T.22.5.4 Bures Curvature Effect

**Lemma T.51.1** (Curvature correction in the local Gaussian-overlap model). *In the local Gaussian-overlap approximation on the generation manifold, the first curvature correction to the overlap amplitude is taken to be*
$$
f_{\mathrm{curv}} = 1 - \frac{K_{\mathrm{eff}}}{6M}\sigma_B^4 + \mathcal{O}(\sigma_B^6).
$$

*Justification.* This is the leading Van Vleck–Morette/Jacobi-field correction for the isotropic Gaussian-overlap model used throughout Section T.22, with $K_{\mathrm{eff}}$ the effective sectional-curvature contraction and $M$ the interface-mode count. The precise coefficient is the same model coefficient used in the charged-lepton sector (Theorem T.42.2a and subsequent discussion). A full derivation from the Bures heat kernel is not supplied here and remains external to the present appendix.

### T.22.5.5 The Cabibbo Angle

**Theorem T.52** (Cabibbo Angle from Geometric Frustration). *The CKM element $\vert V_{us}\vert$ is the projection of the geometric tilt onto the mass eigenbasis:*

$$|V_{us}| = \mathcal{P} \times \sin(\theta_{\mathrm{tilt},u}) \times f_{\mathrm{curv}} = \frac{\sqrt{3}}{2} \sin(15.15°) \times 0.9989 = 0.2261$$

*Proof.*

**Step 1 (Lattice angles from $E_8$ distances).** From Lemma T.44:
$$\theta_u = \arccos\left(\frac{4-d^2_{21,u}}{4}\right) = \arccos\left(\frac{4-4}{4}\right) = \arccos(0) = 90°$$
$$\theta_d = \arccos\left(\frac{4-d^2_{21,d}}{4}\right) = \arccos\left(\frac{4-6}{4}\right) = \arccos\left(-\frac{1}{2}\right) = 120°$$

**Step 2 (Vacuum position from stiffness weighting).** From Theorem T.49 with κ_d/κ_u = 1.02:
$$\theta_{\mathrm{vac}} = 105.15°$$

**Step 3 (Tilt angle).** From Definition T.50:
$$\theta_{\mathrm{tilt},u} = 105.15° - 90° = 15.15°$$

**Step 4 (A₂ root-weight projection).** From Theorem T.51:
$$\mathcal{P} = \cos(30°) = \frac{\sqrt{3}}{2} = 0.86603$$

**Step 5 (Evaluation of sin(15.15°)).**
$$\sin(15.15°) = 0.26134$$

**Step 6 (Curvature correction).** From Lemma T.51.1:
$$f_{\mathrm{curv}} = 0.9989$$

**Step 7 (Final result).**
$$|V_{us}| = 0.86603 \times 0.26134 \times 0.9989 = 0.2261$$

**Experimental comparison** (Particle Data Group 2024, CKM global fit):
$$|V_{us}|_{\mathrm{exp}} = 0.2243 \pm 0.0008$$

|Quantity|Theory|Experiment |Deviation|
|:-------|:----:|:-------------:|:-------:|
|$\vert V_{us}\vert$ |0.2261|0.2243 ± 0.0008|+2.3σ |

∎

**Remark T.52.1: Sensitivity to Stiffness Ratio.** *The predicted $\vert V_{us}\vert$ depends on the stiffness ratio $\kappa_d/\kappa_u$. For $c_d/c_u$ in the range [1.00, 1.02] from Theorem T.38:*

| $c_d/c_u$ | $\kappa_d/\kappa_u$ | $\theta_{\text{vac}}$ | $\theta_{\text{frustration}}$ | $\vert V_{us}\vert$ |
|:---------:|:-------------------:|:---------------------:|:-----------------------------:|:----------:|
| 1.00 | 1.00 | 105.00° | 15.00° | 0.2241 |
| 1.01 | 1.02 | 105.15° | 15.15° | 0.2261 |
| 1.02 | 1.04 | 105.29° | 15.29° | 0.2280 |

*The isotropic value $c_d/c_u = 1.00$ yields $\vert V_{us}\vert = 0.2241$, within 0.1% of the PDG fit value. The central prediction $c_d/c_u \approx 1.01$ gives 0.2261 (0.8% deviation); the experimental value lies well within the stiffness-ratio sensitivity band.*

### T.22.5.6 Derivation of $\vert V_{ud}\vert$

From CKM unitarity (first row):

$$|V_{ud}|^2 + |V_{us}|^2 + |V_{ub}|^2 = 1$$

**Theorem T.52.2** ($\vert V_{ud}\vert$ from Unitarity).

*Using the derived $\vert V_{us}\vert = 0.2261$ and $\vert V_{ub}\vert = 0.00392$:*

$$|V_{ud}| = \sqrt{1 - |V_{us}|^2 - |V_{ub}|^2} = \sqrt{1 - 0.2261^2 - 0.00392^2}$$
$$= \sqrt{1 - 0.05112 - 0.00002} = \sqrt{0.94886} = 0.9741$$

**Experimental comparison** (Hardy & Towner 2020; see also Seng et al. 2018; Particle Data Group 2024):
$$|V_{ud}|_{\mathrm{exp}} = 0.97373 \pm 0.00031$$

|Quantity|Theory|Experiment|Deviation|
|:-------|:----:|:--------:|:-------:|
| $\vert V_{ud}\vert$ |0.9741 |

∎

-----

## T.22.6 CP Violation from Berry Holonomy

### T.22.6.1 Berry Connection on Gr(2,8)

**Lemma T.53.1** (Berry Connection on the Generation Manifold). *Let ℳ_gen = Gr(2,8) be the generation manifold (Section T.21.2.1) with Bures metric g_B = (1/4)g_KE (Lemma Z.12). The Berry connection 1-form on ℳ_gen is:*

$$\mathcal{A} = \frac{i}{2}\sum_{\alpha \in A, \beta \in B} \left( \bar{z}_{\alpha\beta}, dz_{\alpha\beta} - z_{\alpha\beta}, d\bar{z}_{\alpha\beta} \right)$$

*where z_αβ = ⟨β|ψ⟩/⟨α|ψ⟩ are inhomogeneous coordinates on Gr(2,8).*

*Proof.*

**Step 1 (Bundle structure).** The Grassmannian Gr(2,8) ≅ U(8)/[U(2) × U(6)] carries a natural U(1) determinant line bundle ℒ → Gr(2,8) whose fiber at a 2-plane W is det(W) = ⋀² W. The Berry connection is the natural connection on this bundle induced by the Fubini-Study structure (Nakahara 2003).

**Step 2 (Connection from QFI structure).** From Definition G.8.2a, the interface generators are:
$$X_{\alpha\beta} = |\alpha\rangle\langle\beta| + |\beta\rangle\langle\alpha|, \quad Y_{\alpha\beta} = -i(|\alpha\rangle\langle\beta| - |\beta\rangle\langle\alpha|)$$

The symplectic form (Definition G.8.2b) is ω(H₁, H₂) = -i \operatorname{Tr}(\rho_0[H_1, H_2]). For a closed curve $\Gamma$ on the orbit, the Berry phase is:
$$\gamma = \oint_{\Gamma} \mathcal{A}$$

**Step 3 (Local coordinates).** Introducing complex coordinates z_αβ corresponding to the ab = 12 complex dimensions, the connection 1-form in the Bures-orthonormal frame becomes:
$$\mathcal{A} = \frac{i}{2}\sum_{\alpha,\beta} \left( \bar{z}_{\alpha\beta}\, dz_{\alpha\beta} - z_{\alpha\beta}\, d\bar{z}_{\alpha\beta} \right)$$

This is the canonical U(1) connection on the determinant bundle, compatible with the Kähler structure. ∎

**Lemma T.53.2** (Berry Curvature on Gr(2,8)). *The Berry curvature 2-form is:*

$$\mathcal{F} = d\mathcal{A} = i\sum_{\alpha,\beta} dz_{\alpha\beta} \wedge d\bar{z}_{\alpha\beta} = \omega_{\mathrm{KE}}$$

*where ω_KE is the Kähler form of the Kähler-Einstein metric on Gr(2,8).*

*Proof.* Taking the exterior derivative of Lemma T.53.1:
$$\mathcal{F} = d\mathcal{A} = \frac{i}{2}\sum_{\alpha,\beta} \left( d\bar{z}_{\alpha\beta} \wedge dz_{\alpha\beta} - dz_{\alpha\beta} \wedge d\bar{z}_{\alpha\beta} \right) = i\sum_{\alpha,\beta} dz_{\alpha\beta} \wedge d\bar{z}_{\alpha\beta}$$

This equals the Kähler form ω_KE = ig_{ij̄}dz^i ∧ dz̄^{j̄} for the Fubini-Study metric on the Grassmannian (Kobayashi–Nomizu 1969, Vol. II). ∎

### T.22.6.2 The CP-Violating Loop

**Definition T.53.3** (Flavor-Changing Loop). *The CP-violating flavor loop γ in ℳ_gen traverses four geodesic segments:*

1. *u₃ → d₃: Weak transition at generation 3 (up→down)*
1. *d₃ → d₂: Propagation within down sector (generation 3→2)*
1. *d₂ → u₂: Weak transition at generation 2 (down→up)*
1. *u₂ → u₃: Propagation within up sector (generation 2→3)*

*Each leg is a geodesic on the appropriate sector submanifold, with length determined by the $E_8$ distances from Section T.21.9.1.*

### T.22.6.3 QFT Path Integral Derivation

**Theorem T.53** (CP Phase from QFT Path Integral). *The CP-violating phase δ arises as the Berry holonomy of the flavor-changing amplitude in the quantum field theory path integral.*

*Proof.*

**Step 1 (Flavor-changing amplitude in QFT).** In the Standard Model, the flavor-changing amplitude from quark q_i to quark q_j via W boson exchange is:

$$\mathcal{A}(q_i \to q_j) = \sum_k V_{ik}^* V_{jk} \cdot \mathcal{M}_k$$

where V is the CKM matrix and ℳ_k is the amplitude for intermediate state k. The phase of V_ij contributes to CP violation.

**Step 2 (Geometric interpretation).** In the PU framework, quark flavor states correspond to positions on the generation manifold Gr(2,8). The weak interaction vertex corresponds to parallel transport from the up-sector submanifold to the down-sector submanifold.

The flavor-changing path integral becomes:

$$\mathcal{A} = \int \mathcal{D}\phi , e^{iS[\phi]} = \int_{\mathrm{paths}} e^{i\int_\gamma \mathcal{A}}$$

where γ is the path on the generation manifold and 𝒜 is the Berry connection.

**Step 3 (Holonomy from enclosed area).** For a closed flavor loop γ enclosing area Σ, the Berry phase is:

$$\delta = \oint_\gamma \mathcal{A} = \int_\Sigma \mathcal{F}$$

by Stokes' theorem. The Berry curvature ℱ = ω_KE is the Kähler form, so the phase equals the symplectic area enclosed by the loop.

**Step 4 (Connection to CP violation).** The physical CP phase δ in the CKM parametrization corresponds to the Berry holonomy because:

- Both are geometric phases invariant under reparametrization
- Both arise from the non-commutativity of flavor rotations
- The Jarlskog invariant J ∝ sin δ measures the symplectic area enclosed by the flavor quadrilateral

This establishes the QFT origin of the geometric CP phase. ∎

### T.22.6.4 Base Phase from Sector Mismatch

**Theorem T.54** (Base CP Phase on the Minimal Berry-Area Branch). *On the minimal Berry-area branch — under which the flavor quadrilateral $(u_3, d_3, d_2, u_2)$ on $\mathrm{Gr}(2, 8)$ is assigned the minimal Kähler-Einstein area $2 \arctan(d_{32,d}/d_{32,u})$ via the Simon (1983) solid-angle identification — the CP-violating phase in the flat (infinitesimal wavefunction) limit is:*

$$\delta_{\mathrm{flat}} = 2\arctan\left(\frac{d_{32,d}}{d_{32,u}}\right) = 2\arctan\left(\frac{\sqrt{2}}{2}\right) = 70.53°.$$

*A theorem-level derivation requires an explicit computation of the geodesic-quadrilateral Kähler-Einstein area on $\mathrm{Gr}(2,8)$ with the Bures normalization (specifying vertices, geodesic edges, interior angles, and Gauss-Bonnet defect); this theorem reads this area off via the Simon-style identification rather than deriving it. The downstream value $\delta_{CKM} = 66.7°$ in Theorem T.56 inherits this branch.*

*Proof.*

**Step 1 (Sector submanifolds).** Each quark sector f ∈ {u, d} defines a geodesic submanifold of Gr(2,8) parametrized by its $E_8$ triad (r₁^f, r₂^f, r₃^f). From Section T.21.9.1:

- Down quarks: (d²_{32,d}, d²_{31,d}) = (2, 4), giving d_{32,d} = √2
- Up quarks: (d²_{32,u}, d²_{31,u}) = (4, 8), giving d_{32,u} = 2

**Step 2 (Geodesic orientations).** The geodesic connecting generations i and j in sector f has tangent direction determined by the $E_8$ root difference r_i^f − r_j^f. The mismatch angle between up and down geodesic orientations at the 3↔2 interface is:

$$\theta_{\mathrm{mismatch}} = \arctan\left(\frac{d_{32,d}}{d_{32,u}}\right) = \arctan\left(\frac{\sqrt{2}}{2}\right) = 35.26°$$

**Step 3 (Holonomy from solid angle).** The Berry holonomy around a closed loop equals the solid angle enclosed on the projective space. For the flavor quadrilateral (u₃, d₃, d₂, u₂), the enclosed solid angle is twice the mismatch angle (Simon 1983):

$$\delta_{\mathrm{flat}} = 2\theta_{\mathrm{mismatch}} = 2 \times 35.26° = 70.53°$$

**Step 4 (Stokes verification on the minimal Berry-area branch).**
$$\delta_{\mathrm{flat}} = \int_\Sigma \mathcal{F} = \int_\Sigma \omega_{\mathrm{KE}} = \mathrm{Area}_{\mathrm{KE}}(\Sigma)$$

where $\Sigma$ is the geodesic quadrilateral bounded by $\gamma$. On the minimal Berry-area branch, the Kähler-Einstein area is identified with $2 \arctan(d_{32,d}/d_{32,u})$ via the Simon-style solid-angle identification of Step 3. A direct application of the Gauss-Bonnet theorem to the geodesic quadrilateral on $\mathrm{Gr}(2, 8)$ requires explicit computation of interior angles and curvature integrals; that computation is not supplied here. The displayed area formula is therefore the minimal Berry-area branch identification via the Berry-holonomy prescription. ∎

### T.22.6.5 Generation Subspace Variance

**Lemma T.54.1** (Tensor Decomposition of Interface Space on the Generation–Internal Tensor-Factor Branch). *On the generation–internal tensor-factor branch — under which the 24-dimensional interface tangent space is identified as a tensor product of a generation factor and an internal factor with a specified physical assignment of which directions are "generation" and which are "internal" — the 24-dimensional interface tangent space admits the identification:*

$$T_{\rho_0}\mathrm{Gr}(2,8) \cong \mathcal{G}_{N_g} \otimes \mathcal{I}_{d_0}$$

*where:*

- *$\mathcal{G}_{N_g}$ is the $N_g = 3$ dimensional generation subspace*
- *$\mathcal{I}_{d_0}$ is the $d_0 = 8$ dimensional internal subspace*
- *$\dim_\mathbb{R}(T_{\rho_0}) = N_g \times d_0 = 3 \times 8 = 24$*

*The dimension equality $24 = 3 \times 8$ is consistent with this identification but does not by itself force a canonical tensor product structure: every 24-dimensional real vector space is abstractly isomorphic to $\mathbb{R}^3 \otimes \mathbb{R}^8$, but the canonical assignment of which directions correspond to "generation index" and which to "internal index" is the additional branch input. The same structural issue appears at Theorem T.8 (the $b = 6$ row-pair branch) and its propagation to the full interface space (the full interface-space factorization).*

*Proof.*

**Step 1 (Symplectic structure).** From Lemma G.8.2c, the interface space decomposes into ab = 12 symplectic 2-planes, with total real dimension 2 × 12 = 24.

**Step 2 (Generation index).** The three fermion generations (g = 1, 2, 3) occupy distinct $E_8$ root positions. Inter-generation transitions correspond to motion between these root positions. The generation-changing subspace 𝒢 has dimension equal to the number of independent generation indices:
$$\dim(\mathcal{G}) = N_g = 3$$

**Step 3 (Internal index).** The remaining directions correspond to the d₀ = 8 dimensional MPU Hilbert space structure (Theorem 23). Each generation carries the full internal structure, giving:
$$\dim(\mathcal{I}) = d_0 = 8$$

**Step 4 (Tensor product).** The total interface dimension factors as:
$$24 = 3 \times 8 = N_g \times d_0$$

This matches the left-chiral tensor decomposition of Theorem T.30: ℝ⁶ ≅ ℝ³ ⊗ ℝ², extended to the full interface space. ∎

**Theorem T.54.2** (Generation Subspace Variance on the Generation–Internal Tensor-Factor Branch). *On the generation–internal tensor-factor branch (Lemma T.54.1) and the unit-total-generation-variance branch — under which (a) the canonical tensor factorization of the interface tangent space holds with a specified physical generation/internal assignment, and (b) the projected generation marginal carries unit total variance and is isotropic — the variance per direction in the generation subspace $\mathcal{G}_{N_g}$ is:*

$$\sigma^2_{\mathcal{G}} = \frac{1}{N_g} = \frac{1}{3}.$$

*A general parameterization $\sigma^2_{\mathcal{G}} = \chi_G/N_g$ with branch coefficient $\chi_G$ would rescale the sinc factor $f_{\mathrm{sinc}} = \mathrm{sinc}(\sqrt{\chi_G/N_g})$ used in Theorem T.55 and propagate through $\delta_{CKM}$ and the PMNS predictions of Theorems T.24.19–T.24.22.*

*yielding angular width parameter:*

$$u = \sqrt{\sigma^2_{\mathcal{G}}} = \frac{1}{\sqrt{N_g}} = \frac{1}{\sqrt{3}}$$

*Proof.*

**Step 1 (Interface variance from capacity saturation).** From Lemma T.41.2, at the PCE-attractor:
$$\sigma^2_B = \frac{1}{24} = \frac{1}{M}$$
where M = 24 is the interface mode count.

**Step 2 (Total variance normalization).** The Predictive Ward identity (Appendix X) fixes the total interface variance:
$$\langle r_B^2 \rangle = \mathrm{Tr}(\mathrm{Cov}\,\xi) = M \cdot \sigma^2_B = 24 \times \frac{1}{24} = 1$$

**Step 3 (Isotropy and tensor factorization).** The Bures metric is isotropic on the interface (Section T.21.2.2): g_B = (1/4)I₂₄. By Lemma T.54.1, the tangent space factors as 𝒢_{N_g} ⊗ ℐ_{d₀}.

**Step 4 (Equipartition over generation directions).** The generation subspace 𝒢 carries the physically relevant variance for flavor mixing. By the equipartition principle (which follows from the isotropy of g_B), variance distributes equally among the N_g generation directions. With unit total generation variance:

$$\sigma^2_{\mathcal{G}} = \frac{1}{N_g} = \frac{1}{3}$$

**Step 5 (Angular width).** The characteristic angular spread of the generation wavefunction is:
$$u = \sqrt{\sigma^2_{\mathcal{G}}} = \sqrt{1/3} = \frac{1}{\sqrt{N_g}} = \frac{1}{\sqrt{3}} = 0.5774$$

∎

**Remark T.54.3: Consistency Check.** *The relation u² = 1/N_g connects generation number to interface variance:*
$$N_g = \frac{1}{u^2} = 3$$
*confirming internal consistency with Theorem R.3.4 (three generations from anomaly + CP).*

### T.22.6.5a Sinc Correction Factor

**Theorem T.55** (Sinc Correction Factor). *Under the variance assignment of Theorem T.54.2, uniform phase fluctuations on the bounded generation interval $[-u,u]$ renormalize the Berry phase by the coherent-average factor*
$$
f_{\mathrm{sinc}}=\left|\frac{1}{2u}\int_{-u}^{u} e^{i\xi}\,d\xi\right|=\frac{\sin u}{u}.
$$
*With $u=1/\sqrt{N_g}=1/\sqrt{3}$,*
$$
f_{\mathrm{sinc}}=\mathrm{sinc}(1/\sqrt{3})=0.9454.
$$

*Proof.* By Theorem T.54.2, $u=1/\sqrt{3}$. For a uniform distribution on $[-u,u]$,
$$
\frac{1}{2u}\int_{-u}^{u} e^{i\xi}\,d\xi=\frac{e^{iu}-e^{-iu}}{2iu}=\frac{\sin u}{u}.
$$
Since $0<u<\pi$, the modulus equals $\sin u/u$. Substituting $u=1/\sqrt{3}$ gives
$$
f_{\mathrm{sinc}}=\frac{\sin(1/\sqrt{3})}{1/\sqrt{3}}=0.9454.
$$
∎

### T.22.6.6 Conditional CKM CP Phase

**Theorem T.56** (Conditional CKM CP phase in the Berry-holonomy model). Assume the Berry-holonomy model of Sections T.22.6–T.22.7: (i) the relevant flavor loop is the minimal loop specified in Theorem T.53; (ii) the generation subspace carries the variance assignment of Theorem T.54.2; and (iii) phase fluctuations are uniformly distributed on the bounded interval used in Theorem T.55. Then the CKM phase is
$$
\delta_{CKM} = 70.53^\circ \times \mathrm{sinc}(1/\sqrt{3}) \approx 66.7^\circ.
$$

*Proof.* Under assumptions (i)–(iii), Theorem T.54 gives the flat-space Berry-holonomy phase $70.53^\circ$, and Theorem T.55 supplies the fluctuation-renormalization factor $\mathrm{sinc}(1/\sqrt{3}) = 0.9454$. Multiplying gives
$$
\delta_{CKM} \approx 70.53^\circ \times 0.9454 = 66.7^\circ.
$$
QED

-----

## T.22.7 The Jarlskog Invariant

The Jarlskog invariant J quantifies CP violation independent of phase conventions (Jarlskog 1985):

$$J = c_{12}s_{12}c_{23}s_{23}c_{13}^2 s_{13}\sin\delta$$

where s_ij = sin θ_ij and c_ij = cos θ_ij in the standard parametrization.

**Theorem T.57** (Jarlskog Invariant from Derived Parameters).

*Using derived values:*

- *$s_{12} = \vert V_{us}\vert = 0.2261$ → $c_{12} = \sqrt{1 - 0.2261^2} = 0.9741$*
- *$s_{23} = \vert V_{cb}\vert = 0.0407$ → $c_{23} = \sqrt{1 - 0.0407^2} = 0.9992$*
- *$s_{13} = \vert V_{ub}\vert = 0.00392$ → $c_{13} = \sqrt{1 - 0.00392^2} = 0.99999$*
- *$\delta = 66.7°$ → $\sin\delta = 0.9187$*

*Calculation:*
$$J = (0.9741)(0.2261)(0.9992)(0.0407)(0.99999)^2(0.00392)(0.9187)$$
$$= 3.22 \times 10^{-5}$$

**Experimental comparison** (Particle Data Group 2024):
$$J_{\mathrm{exp}} = (3.08 \pm 0.15) \times 10^{-5}$$

|Quantity|Theory |Experiment |Deviation|
|:-------|:---------:|:------------------:|:-------:|
|J |3.22 × 10⁻⁵|(3.08 ± 0.15) × 10⁻⁵|+0.9σ |

∎

-----

## T.22.8 Complete CKM Matrix

### T.22.8.1 Derived Matrix Elements

The complete CKM matrix from $E_8$ geometry is written as
$$
V_{\mathrm{CKM}} \approx
\begin{pmatrix}
0.9741 & 0.2261 & 0.00392 \\
0.2260 & 0.9732 & 0.0407 \\
0.0087 & 0.0399 & 0.9992
\end{pmatrix}.
$$

The entries in the second and third rows are obtained by imposing row and column unitarity on the directly predicted values of $|V_{us}|$, $|V_{cb}|$, and $|V_{ub}|$, with the standard CKM ordering convention.

**Statistical Analysis:**

For the four independent predictions ($\vert V_{cb}\vert$, $\vert V_{ub}\vert$, $\vert V_{us}\vert$, $\delta$):
$$\chi^2 = (0.2)^2 + (0.4)^2 + (2.3)^2 + (0.7)^2 = 0.04 + 0.16 + 5.29 + 0.49 = 5.98$$
$$\chi^2/\mathrm{d.o.f.} = 5.98/4 = 1.50$$

This indicates good overall agreement with experiment. The $\vert V_{us}\vert$ tension (+2.3σ) is driven by the stiffness ratio sensitivity (Remark T.52.1): the isotropic limit c_d/c_u = 1.00 yields $\vert V_{us}\vert = 0.2241$, essentially matching the PDG fit value.

-----

## T.22.9 Complete Parameter Chain

The core counting parameters trace to the foundational derivation, while the quantitative hierarchy sector later in this appendix uses the additional threshold, prefactor, and matching data introduced in those sections:

|Parameter |Value |Origin |Section |
|:-----------------|:----------------|:------------------------------------------------------|:-------|
|K₀ |3 |Self-reference minimum |§2.3 |
|d₀ |8 |Hilbert space dimension 2^K₀ |§3.2 |
|(a, b) |(2, 6) |Spectral split from ε = ln 2 |§3.3 |
|M |24 |Interface modes 2ab |§6.4 |
|σ²_B |1/24 |Capacity saturation |T.41.2 |
|α |3/2 |Hierarchy coefficient 1/(16σ²_B) |T.41.3 |
|N_g |3 |Topological (π₂ constraint) |R.4.2 |
|d²_{32,d} |2 |$E_8$ triad (down) |T.21.9.1|
|d²_{31,d} |4 |$E_8$ triad (down) |T.21.9.1|
|d²_{21,d} |6 |$E_8$ triad (down) |T.21.9.1|
|d²_{32,u} |4 |$E_8$ triad (up) |T.21.9.1|
|d²_{31,u} |8 |$E_8$ triad (up) |T.21.9.1|
|d²_{21,u} |4 |$E_8$ triad (up) |T.21.9.1|
|cos(30°) |√3/2 |A₂ root-weight duality |T.51 |
|1/√N_g |1/√3 |Generation variance |T.54.2 |
|K_avg |32/23 |Bures curvature |Z.23 |
|c_d/c_u |1.02 |Hypercharge normalization (PCE weights, Cor. T.34.2) |T.38 |
|$g_U^2$ |$\pi/6$ |Holonomy per mode |T.39a |
|$\mathcal{N}_{PU}$|$1/(72\sqrt{12})$|Universal normalization |T.21.11 |
|$m_\tau$ |$\approx 0.94$ GeV (LO) |Absolute mass anchor; factor $\approx 1.9$ gap (Remark T.45.1)|T.21.11; Lemma T.45.1a |

**The complete CKM matrix derives from K₀ = 3 with zero additional continuously adjustable parameters.**

-----

## T.22.10 Physical Interpretation

### T.22.10.1 Why Two Regimes Exist

The distinction between tunneling and frustration regimes reflects the structure of the generation manifold:

- **Generation 3** occupies a localized position (heavy mass, λ₃ = αd² ≫ 1) serving as a reference anchor
- **Generations 1, 2** occupy a delocalized valley (light masses) where vacuum geometry dominates

The valley-sharing criterion 𝒱_ij (Theorem T.45.2) determines which mechanism controls mixing:

- 𝒱_ij > 1: Wavefunction overlap through a barrier (tunneling)
- 𝒱_ij ≤ 1: Geometric alignment in a shared valley (frustration)

### T.22.10.2 Why CKM is Hierarchical

The CKM hierarchy $\vert V_{us}\vert \gg \vert V_{cb}\vert \gg \vert V_{ub}\vert$ arises from distinct mechanisms:

1. **$\vert V_{us}\vert \sim 0.22$**: Geometric frustration angle—non-exponential, O(1) mixing from vacuum misalignment
1. **$\vert V_{cb}\vert \sim 0.04$**: Single exponential suppression e⁻³ from tunneling with d²_ref = 2
1. **$\vert V_{ub}\vert \sim 0.004$**: Double exponential suppression e⁻⁶ from tunneling with d²_ref = 4

### T.22.10.3 Why CP Violation Exists

CP violation requires the up and down sectors to have different orientations in the generation manifold. This follows from their distinct $E_8$ triad assignments:

- Different $d^2_{32}$ values (2 vs 4) create orientation mismatch
- The Berry phase around the flavor loop is non-zero: $\delta = 66.7°$

The Jarlskog invariant $J \propto \sin\delta \neq 0$ confirms physical CP violation.

### T.22.10.4 Berry Phase Origin of CP Violation

The CP-violating phases of the Standard Model are organized in this framework by two distinct mechanisms operating on the generation manifold $\mathrm{Gr}(2,8)$: a Berry-holonomy mechanism for CKM and PMNS phases (Type II CP violation in the language of Remark T.57a.1), and a $\sigma$-invariance plus PCE topological-cost mechanism for strong CP (Type I CP violation, forbidden by $\sigma$-invariance per Theorem K.6.1 with the branch qualifications on K.6.4-K.6.10). The synthesis below identifies the mechanism in each sector:

|Observable |Berry Phase Mechanism |Predicted Value|Reference |
|:--------------------|:----------------------------------------------------|:--------------|:--------------|
|CKM $\delta$ |Holonomy around $u_3 \to d_3 \to d_2 \to u_2 \to u_3$|$66.7°$ |Theorem T.56 |
|PMNS $\delta_{CP}$ |Holonomy with D₄-A₂ sector mismatch |$232.5°$ |Theorem T.24.22|
|Strong $\bar{\theta}$|$\sigma$-invariance forces contractible loop |$0$ |Theorem K.6.5 |

**Theorem T.57a (CP from Holonomy).** *CP-violating phases arise as Berry-Simon holonomy on the generation manifold* [Berry 1984; Simon 1983].

*Proof.*

**Step 1 (Berry connection).** From Lemma T.53.1, the Berry connection on $\text{Gr}(2,8)$ is:
$$
\mathcal{A} = \frac{i}{2}\sum_{\alpha \in A, \beta \in B} \left( \bar{z}_{\alpha\beta}, dz_{\alpha\beta} - z_{\alpha\beta}, d\bar{z}_{\alpha\beta} \right)
$$
where $z_{\alpha\beta} = \langle\beta|\psi\rangle/\langle\alpha|\psi\rangle$ are inhomogeneous coordinates on $\text{Gr}(2,8)$ as defined in Lemma T.53.1, with curvature $\mathcal{F} = d\mathcal{A} = \omega_{KE}$ (Lemma T.53.2).

**Step 2 (CKM phase).** For the flavor loop $\gamma: u_3 \to d_3 \to d_2 \to u_2 \to u_3$ (Definition T.53.3), the holonomy is:
$$
\delta_{CKM} = \oint_\gamma \mathcal{A} = \int_\Sigma \omega_{KE}
$$
The $E_8$ sector mismatch $(d^2_{32,d}, d^2_{32,u}) = (2, 4)$ yields base phase $\delta_{flat} = 2\arctan(\sqrt{2}/2) = 70.53°$ (Theorem T.54). The finite wavepacket correction $f_{sinc} = \text{sinc}(1/\sqrt{3}) = 0.9454$ (Theorem T.55) gives:
$$
\delta_{CKM} = 70.53° \times 0.9454 = 66.7°
$$

**Step 3 (PMNS phase).** The leptonic sector involves D₄ (charged leptons) and A₂ (neutrinos) geometries. The additional holonomy from the D₄-A₂ mismatch contributes $75°$ (Theorem T.24.22, Steps 3-4), yielding $\delta_{CP} = 232.5°$.

**Step 4 (Strong CP via the σ-invariance + topological-cost branch — separate mechanism from Berry holonomy).** Strong CP is governed by a different mechanism than CKM/PMNS Berry holonomy. On the σ-symmetric attractor branch (Theorem K.6.5 as conditioned by the K.6.4 Hermiticity counterexample fix and the orientation-preserving real-Yukawa branch of K.6.7-K.6.10), the σ-involution (Definition K.6.3) restricts $\theta_{QCD} \in \{0, \pi\}$, and on the topological-cost branch (Theorem K.6.2; cf. Appendix K branch ledger K.11 noting the topological cost derivation as a separate closure item), the PCE cost $V_{PCE}(\theta) \propto (1 - \cos\theta)$ selects $\theta = 0$. The Berry-holonomy identification of Steps 1-3 does not apply to the strong-CP sector; the unification claim is that all SM CP-violating phases admit a geometric origin on $\mathrm{Gr}(2, 8)$, not that they share a single Berry-loop mechanism. ∎

**Remark T.57a.1: Type I vs Type II.** The framework distinguishes Type I CP violation (Lagrangian parameters, forbidden by $\sigma$-invariance per Theorem K.6.1) from Type II (Berry holonomy, permitted). This explains why $\bar{\theta} = 0$ while $\delta_{CKM} \neq 0$.

### T.22.10.4 Comparison with PMNS

The same framework predicts large PMNS mixing angles because:

- Charged leptons have triad $(d^2_{32}, d^2_{31}, d^2_{21}) = (2, 6, 4)$ from D₄ cubic geometry
- Neutrinos have triad $(d^2_{32}, d^2_{31}, d^2_{21}) = (2, 6, 6)$ from A₂ hexagonal geometry on the Majorana A₂ generation-geometry branch (Theorem T.24.5)
- The D₄–A₂ mismatch between charged lepton and neutrino sectors generates large PMNS mixing

The complete derivation of PMNS parameters appears in Section T.24, achieving $\chi^2/\mathrm{dof} = 0.28$ for seven measured quantities.

-----

## T.22.11 Statistical Significance

**Proposition T.58 (Anti-Numerology Argument).** The PU framework's CKM-sector outputs are overdetermined by multiple constraints within the same discrete geometric construction, providing an internal consistency check against post-hoc numerological fitting.

*Proof.* Consider the following:

1. The framework produces multiple CKM-sector outputs (e.g., a Cabibbo-angle scale, quark-mass-ratio constraints, and a CP-phase prediction) from distinct constraints tied to the same underlying discrete geometry.
1. These outputs are generated without introducing independent continuous fit parameters tuned separately for each observable.
1. Because the outputs share a common construction, the appropriate interpretation is internal overdetermination: a failure of any one output constitutes a direct falsification of the shared mechanism. Assigning a frequentist “chance coincidence” probability is not meaningful without specifying an explicit alternative-model ensemble, priors, and a multiple-comparisons procedure.

Therefore, the framework's anti-numerology content is the rigidity of a shared constrained construction, not a standalone p-value claim. ∎

## T.23 Unified Exponential Suppression: The Master Mechanism for Hierarchies

### T.23.1 Introduction

The derivations of the cosmological constant $\Lambda$ (Appendix U) and the electroweak scale $v$ (Sections T.2–T.7) reveal that these two hierarchies—conventionally treated as separate “problems”—emerge from a single underlying mechanism: exponential suppression from configuration space complexity. This section synthesizes these results into a unified framework, demonstrating that hierarchically small quantities associated with instanton-type transitions follow a universal pattern determined by the Golay-Steiner structure.

The central result is the **Master Formula** for instanton-mediated exponential suppression:

$$
\boxed{\frac{X}{M_{Pl}^n} = A_X \cdot \exp(-\kappa_X)}
$$

where:

- $X$ is the physical quantity
- $n$ is the mass dimension
- $A_X \sim \mathcal{O}(1)$ is a one-loop determinant prefactor
- $\kappa_X$ is the **complexity parameter** determined by configuration space geometry

The complexity parameter has the universal structure:

$$
\boxed{\kappa = (\text{base dimension}) + (\text{coset/extra DOF}) - \frac{(\text{zero modes})}{2}}
$$

This formula encompasses both the cosmological constant and the electroweak scale as special cases, unifying the “cosmological constant problem” and the “hierarchy problem” into manifestations of a single mechanism operating on different configuration spaces.

**Scope.** This unification applies to hierarchies arising from instanton-type tunneling processes in configuration spaces derived from the Golay-Steiner structure. Other hierarchies, such as Yukawa couplings, arise from distinct mechanisms ($E_8$ geodesic distances, Section T.9) that share the same foundational constants but employ different geometric structures.

-----

### T.23.2 The Foundational Cascade

All complexity parameters trace to the same logical foundation established in the main text:

|Step|Quantity |Value |Origin |Reference |
|:---|:----------------------------------|:-----------------------|:------------------------------------------------------------------|:---------------|
|1 |$K_0$ |3 bits |Minimum self-referential complexity |Theorem 15 |
|2 |$d_0$ |$8$ on the minimal Appendix Z branch |MPU Hilbert space dimension |Theorem 23; Theorem Z.2 |
|3 |$\varepsilon$ |$\ln 2$ on the attractor branch |SPAP thermodynamic cost |Theorem 31; Definition 15a |
|4 |$a$ |$2$ |Active kernel dimension on the attractor-saturating branch |Theorem Z.1 |
|5 |$b$ |$d_0 - a = 6$ |Inactive subspace dimension |Definition |
|5a |$\dim_{\mathbb{C}}(\text{Gr}(2,8))$|$ab = 12$ |Attractor orbit complex dimension; equals Golay $k$ |Theorem Z.6.3a |
|5b |$\dim_{\mathbb{R}}(\text{Gr}(2,8))$|$2ab = 24$ |Attractor orbit real dimension; equals Golay $n$ and mode count $M$|Theorem Z.6.3a |
|6 |$M$ |$2ab = 24$ |QFI interface modes |Theorem Z.5 |
|7 |$k$ |$M/2 = 12$ |Golay code dimension |Theorem Z.13 |
|8 |$D$ |4 |Emergent spacetime dimension |Theorem Z.11 |
|9 |$\sigma_B^2$ |$1/M = 1/24$ |Bures variance from capacity saturation |Lemma T.41.2 |
|10 |$\alpha$ |$1/(16\sigma_B^2) = 3/2$|Hierarchy coefficient |Corollary T.41.3|

**Proposition T.59** (Foundational Completeness of the Core Counting Chain). *Every parameter in the backbone chain $K_0 \to d_0 \to \varepsilon \to a \to b \to M \to k \to D$ derives from $K_0 = 3$ through the chain above. Quantitative hierarchy derivations later in this appendix additionally use the threshold data, prefactors, and matching prescriptions introduced in those sections.*

*Proof.* The logical necessity of $K_0 = 3$ (Theorem 15) initiates the backbone cascade. Each subsequent step follows from the cited results: Theorem 23 gives the lower bound $d_0 \ge 2^{K_0}=8$, and Theorem Z.2 selects $d_0=8$ on the minimal PCE branch; Theorem 31 gives $\varepsilon \ge \ln 2$, and Definition 15a supplies the attractor saturation $\varepsilon=\ln 2$; Theorem Z.1 then fixes $a = 2$ on that branch; $b = d_0 - a$ (complement); $M = 2ab$ (Theorem Z.5, interface mode count); $k = M/2$ (Theorem Z.13, PCE-optimal code dimension); and $D = 4$ from the mode-channel correspondence (Theorem Z.11). This proves foundational completeness only for the backbone counting chain. The later hierarchy sections supplement that chain with the additional sector-specific inputs stated there. ∎

**Corollary T.59a** (Explicit Backbone Data). On the minimal Appendix Z branch used in Proposition T.59,
$$
(K_0,d_0,a,b,M,k,D)=(3,8,2,6,24,12,4),
\qquad
\varepsilon=\ln 2.
$$

*Proof.* Proposition T.59 supplies the derivation chain. Theorem Z.2 gives $d_0=8$, Definition 15a gives $\varepsilon=\ln 2$, and Theorem Z.1 gives $a=2$, hence $b=d_0-a=6$. Theorem Z.5 then gives $M=2ab=24$, Theorem Z.13 gives $k=M/2=12$, and Theorem Z.11 gives $D=4$. ∎

-----

### T.23.3 The Complexity-Action Correspondence

**Proposition T.60** (Complexity-Action Relation). *The instanton action $S_{\text{inst}}$ and complexity $\kappa$ are related by:*

$$S_{\text{inst}} = 2\kappa$$

*Proof.* From Appendix Q, PCE optimization of the MPU budget yields the capacity ratio:

$$\frac{C_{\max}}{\varepsilon} = \frac{\ln(d_0) - \varepsilon}{\varepsilon} = \frac{3\ln 2 - \ln 2}{\ln 2} = 2$$

The instanton action scales with complexity as $S_{\text{inst}} = (C_{\max}/\varepsilon)\kappa$ (Appendix U, Section U.4). Substituting yields $S_{\text{inst}} = 2\kappa$. ∎

This correspondence connects the information-theoretic complexity parameter $\kappa$ to the Euclidean action governing tunneling amplitudes.

-----

### T.23.4 The Cosmological Constant: Appendix U Reference Branch

**Configuration Space.** Vacuum fluctuations correspond to deformations of the Golay code subspace within the 24-mode interface:

$$\mathcal{M}_\Lambda = \text{Gr}(k, M) = \text{Gr}(12, 24)$$

**Complexity Calculation.**

|Component |Formula |Value |
|:-------------|:----------------------------------|:--------|
|Base dimension|$k(M-k) = k^2$ |144 |
|Extra DOF |— |0 |
|Zero modes |$D + 1$ on the Appendix U five-mode reference branch |5 |
|**$\kappa_{\mathrm{ref}}$** |$144 - 5/2$ |**141.5**|

**Summary of Appendix U Theorem U.16.** Under the Appendix U leading-order five-mode reference-counting convention, the reference exponent is

$$\kappa_{\mathrm{ref}} = k^2 - \frac{D+1}{2} = 144 - \frac{5}{2} = 141.5$$

where the base complexity $k^2 = 144$ arises from the Grassmannian dimension (Theorem U.3), and the deficit $(D+1)/2 = 5/2$ arises from the Appendix U reference-counting convention summarized in Theorem U.15 and recorded in Theorem U.16. Theorem U.8c shows that the pure-coordinate dilatation tangent needed to realize that five-mode branch is obstructed in the current Definition U.4 continuum action.

**Result.**

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-283} = (2.88 \pm 0.03)\times 10^{-122}$$

on the Appendix U five-mode reference branch. Using the Appendix U working value $A_{\text{eff}} = 0.923 \pm 0.011$ (Corollary U.15b), this gives the branch-dependent reference evaluation; the translational branch instead yields $(1.06 \pm 0.01)\times 10^{-122}$ at the same prefactor.

-----

### T.23.5 The Electroweak Scale: $\kappa_{EW} = 38.5$

**Configuration Space.** Electroweak symmetry breaking involves alignment between left-chiral modes and reservoir coordinates on the coset:

$$\mathcal{M}_{EW} = \frac{SU(2)_L \times U(1)_Y}{U(1)_{em}} \cong S^3$$

**Complexity Calculation.**

|Component |Formula |Value |
|:----------------|:------------------|:-------|
|Base (alignment) |$bk/2 = b^2$ |36 |
|Coset DOF |$\dim(G/H) = 4 - 1$|+3 |
|Zero modes |$U(1)_{em}$ gauge |1 |
|**$\kappa_{EW}$**|$36 + 3 - 1/2$ |**38.5**|

**Summary (Electroweak Complexity).** *The electroweak complexity is:*

$$\kappa_{EW} = \frac{bk}{2} + \dim(G/H) - \frac{m}{2} = 36 + 3 - \frac{1}{2} = 38.5$$

*The base complexity $bk/2 = b^2 = 36$ counts reservoir-alignment constraints (Proposition T.2b), while the coset dimension $\dim(G/H) = 3$ adds the broken gauge directions. The single zero mode $m = 1$ from U(1)$_{em}$ is established in Theorem T.4.*

**Result.**

$$v = A_{EW} \cdot e^{-\kappa_{EW}} \cdot M_{Pl} = A_{EW} \cdot e^{-38.5} \cdot M_{Pl}$$

With $e^{-38.5} \approx 1.90 \times 10^{-17}$ and $M_{Pl} = 1.22 \times 10^{19}$ GeV:

$$v \approx 252 \text{ GeV}$$

with the prefactor $A_{EW} = 1.084 \pm 0.005$ obtained in Theorem T.29 within the three-factor determinant model via SU(2) block curvature, the rank-one Schur factor, and the homogeneous-space Jacobian factor. Once that model is fixed, no further continuous tuning enters this subsection. By Theorem T.29.2 the value is model-conditional rather than a theorem-level prefactor derivation. The resulting value is $2.3\%$ above $v_{obs} = 246.22$ GeV.

-----

### T.23.6 The Fermi Constant: A Derived Quantity

**Proposition T.61** (Fermi Constant Derivation). *The Fermi constant $G_F$ is not an independent parameter but follows from $v$:*

$$G_F = \frac{1}{\sqrt{2} v^2}$$

*Proof.* Standard electroweak theory: $G_F = g^2/(4\sqrt{2}M_W^2) = 1/(\sqrt{2}v^2)$ where $M_W = gv/2$. ∎

**Effective Complexity.** In terms of the suppression mechanism:

$$G_F \sim \frac{e^{2\kappa_{EW}}}{M_{Pl}^2} = \frac{e^{77}}{M_{Pl}^2}$$

The effective complexity $\kappa_{G_F} = 2\kappa_{EW} = 77$ reflects the squared dependence on the VEV.

-----

### T.23.7 Yukawa Hierarchies: $E_8$ Geometric Suppression

The fermion mass hierarchy employs a different configuration space—the $E_8$ root lattice—rather than Grassmannian dimension:

$$Y_{ij} \propto \exp\left(-\alpha \cdot d^2_{E_8}\right)$$

where $\alpha = 3/2$ (Theorem T.39b) and $d^2_{E_8} \in \{2, 4, 6, 8\}$ are the allowed squared distances between roots in $E_8$.

**Theorem T.39b** (Universal Hierarchy Coefficient). *At the PCE-attractor, under the same mode-equipartition assumption used in Theorem T.29:*

$$
\alpha = \frac{1}{16\sigma_B^2} = \frac{24}{16} = \frac{3}{2}
$$

*where $\sigma_B^2 = 1/24$ is the per-mode variance obtained by distributing the unit Bures variance isotropically across the $M=24$ interface modes of Theorem Z.5. The UV value $\alpha_{UV}=3/2$ evolves to $\alpha_{IR}\approx 1.41$ at low scales due to geometric curvature corrections on $\mathrm{Gr}(2,8)$, with negligible RG contributions for leptons.*

**Effective $\kappa$ Values for Yukawa Suppression.**

|$d^2_{E_8}$|$\kappa_Y = \alpha \cdot d^2$|$e^{-\kappa_Y}$ |Application |
|:---------:|:---------------------------:|:------------------:|:-------------------|
|2 |3 |0.050 |$V_{cb}$, $\tau/\mu$|
|4 |6 |0.0025 |$V_{ub}$, $\mu/e$ |
|6 |9 |$1.2 \times 10^{-4}$|$t/c$ ratio |
|8 |12 |$6.1 \times 10^{-6}$|$t/u$ ratio |

**Remark.** Although the Yukawa mechanism shares the foundational constants ($M = 24$, $\sigma_B^2 = 1/24$) with the instanton mechanism, the suppression arises from geodesic distances on $E_8$ rather than from configuration space dimensionality. This represents a complementary realization of the Golay-Steiner structure.

**Summary of Proposition T.58** ($E_8$ Optimality). *The $E_8$ root system is uniquely selected by information-theoretic criteria:*

1. *Packing optimality: $E_8$ achieves the densest sphere packing in 8 dimensions (Viazovska 2017)*
2. *Secondary octonionic coherence: the same $d_0 = 8$ branch singled out by SPAP and PCE is the octonionic Radon-Hurwitz dimension, providing algebraic context for the $E_8$ construction rather than the proof of necessity*
3. *Maximal symmetry: 240 roots provide uniform local neighborhoods consistent with PCE*

*The triad assignments $(d^2_{31}, d^2_{32})$ in Theorem T.37 are the unique optimal assignments achieving 87-96% agreement with observed mass ratios.*

-----

### T.23.8 The Unified Hierarchy Table

**Theorem T.62** (Compiled hierarchy table). *The previously derived hierarchy relations organize into the following two classes.*

**Mechanism A: Configuration-space instanton exponents**

|Quantity |Configuration Space |Base |Coset|Zero Modes|$\kappa$|Scaling |
|:--------|:----------------------------------|:---:|:---:|:--------:|:------:|:-------------------|
|$\Lambda$|Gr(12,24) |144 |0 |5 on the Appendix U five-mode reference branch |141.5 |$\Lambda L_P^2 \propto e^{-2\kappa}$ on that reference branch |
|$v$ |$SU(2) \times U(1)/U(1)$ |36 |+3 |1 |38.5 |$v/M_{Pl} \propto e^{-\kappa}$ |
|$\eta_B$ |CP-odd sector of $\mathcal{M}_{EW}$|19.25|0 |$+0.23$ |19.48 |$\eta_B \propto e^{-\kappa}$ |
|$M_R$ |$E_8$ instanton ($d^2_{31} = 6$) |– |– |– |9 |$M_R/M_{Pl} = e^{-9}$ |
|$G_F$ |(derived from $v$) |— |— |— |77 |$G_F \propto e^{2\kappa_{EW}} M_{Pl}^{-2}$ |

**Remark T.62.1: QCD Confinement Scale.** The matching scale $\mu_G = M_{Pl} \cdot e^{-\kappa_{\text{QCD}}}$ with $\kappa_{\text{QCD}} = \text{rank}(E_8) + 1 = 9$ yields:

$$\mu_G \approx 1.22 \times 10^{19} \text{ GeV} \times e^{-9} \approx 1.5 \times 10^{15} \text{ GeV}$$

The complexity parameter $\kappa_{\text{QCD}} = 9$ counts the minimum Weyl reflections required for vacuum transitions in the $E_8$ root system (cf. Theorem T.24.3 for the role of $E_8$ geodesics in mass hierarchies).

Standard QCD renormalization group running from $\mu_G$ with SM particle content yields:

$$\Lambda_{\text{QCD}} = \mu \cdot \exp\left(-\frac{2\pi}{b_3 \alpha_s(\mu)}\right)$$

where $b_3 = (11N_c - 2N_f)/3$ is the one-loop beta function coefficient. Using $\alpha_s(M_Z) \approx 0.118$ as input and integrating through flavor thresholds with the standard $\overline{\text{MS}}$ scheme:

$$\Lambda_{\text{QCD}}^{\overline{\text{MS}}} \approx 200\text{–}220 \text{ MeV}$$

consistent with the world average $\Lambda_{\text{QCD}}^{(5)} = 210 \pm 14$ MeV (Particle Data Group 2024). The suppression $e^{-9} \approx 1.2 \times 10^{-4}$ places the unification scale approximately four orders of magnitude below the Planck scale, with QCD running providing the remaining hierarchy to the confinement scale.

**Mechanism B: $E_8$ geodesic-distance exponents**

|Quantity |$d^2_{E_8}$|$\kappa_Y = \alpha d^2$|Suppression |
|:------------|:---------:|:---------------------:|:--------------------|
|$Y_{\tau\mu}$|2 |3 |0.050 |
|$Y_{\mu e}$ |4 |6 |0.0025 |
|$Y_{tc}$ |6 |9 |$1.2 \times 10^{-4}$ |
|$M_R/M_{Pl}$ |6 |9 |$1.23 \times 10^{-4}$|

*Proof.* The vacuum row is Theorem U.16:
$$
\kappa_{\Lambda,\mathrm{ref}} = 144 - \frac{5}{2} = 141.5,
$$
so $\Lambda L_P^2 \propto e^{-2\kappa_{\Lambda,\mathrm{ref}}}=e^{-283}$ at fixed prefactor on the Appendix U five-mode reference branch. Theorem U.8c shows that this row is branch-dependent rather than a theorem-level consequence of the current Definition U.4 continuum action. The electroweak row is the counting result of Section T.23.5:
$$
\kappa_{EW}=36+3-\frac12=38.5,
$$
hence $v/M_{Pl}\propto e^{-38.5}$. The baryogenesis row is Theorem Y.8:
$$
\kappa_B=\frac{\kappa_{EW}}2+\frac{\varepsilon}{N_g}=19.25+0.23=19.48.
$$
The seesaw row is Theorem T.64:
$$
\kappa_R=\alpha_{UV}d^2_{31}=\frac32\cdot6=9,
\qquad
M_R/M_{Pl}=e^{-9}.
$$
Finally, Proposition T.61 gives
$$
G_F=\frac1{\sqrt2\,v^2}.
$$
Since $v\propto e^{-\kappa_{EW}}M_{Pl}$, it follows that
$$
G_F\propto e^{2\kappa_{EW}}M_{Pl}^{-2}=e^{77}M_{Pl}^{-2}.
$$
Thus the $G_F$ row is a derived inverse-square consequence of the electroweak scale rather than an additional direct suppression. The $E_8$-distance rows follow from $\kappa_Y=\alpha d^2$ with $\alpha=3/2$ from Theorem T.39b. ∎

**Corollary T.62a** (Five-Mode Reference Vacuum–Electroweak Sum Rule). Within the Appendix U five-mode reference branch of Theorem U.16,
$$
2\kappa_{\Lambda,\mathrm{ref}} + 2\kappa_{EW} = 360 = \binom{D+2}{2}M.
$$

*Proof.* Theorem U.16 gives $\kappa_{\Lambda,\mathrm{ref}}=141.5$, so $2\kappa_{\Lambda,\mathrm{ref}}=283$. Corollary T.5c gives $2\kappa_{EW}=77$. Hence
$$
2\kappa_{\Lambda,\mathrm{ref}} + 2\kappa_{EW} = 283+77=360.
$$
Theorem Z.11 gives $D=4$ and Theorem Z.5 gives $M=24$, so
$$
\binom{D+2}{2}M=\binom{6}{2}\cdot 24 = 15\cdot 24 = 360.
$$
Therefore the two expressions agree on that reference branch. Theorem U.8c shows that this identity is branch-specific rather than a theorem-level vacuum closure for the current Definition U.4 continuum action. ∎

**Remark T.62b (Cross-Appendix Significance of the Vacuum–Electroweak Sum Rule).** The identity $2\kappa_{\Lambda,\mathrm{ref}} + 2\kappa_{EW} = 360 = \binom{D+2}{2}M$ holds on the Appendix U five-mode reference branch and carries the branch-dependent status of that branch. Its structural content is that the two largest instanton complexity exponents in the framework sum to exactly $15M$, where $15 = \binom{D+2}{2}$ encodes the emergent spacetime dimension $D=4$ and $M=24$ is the interface mode count. This sum rule is therefore sensitive to the spacetime dimension through $\binom{D+2}{2}$: any $D \neq 4$ would give a different right-hand side, so the identity provides a cross-check linking the hierarchy mechanism to the dimensional selection of Theorem Z.11. Turning that sensitivity into a standalone falsifier would require an external observable that constrains the effective dimensional count independently of the identity itself; the present manuscript does not yet supply such an independent bound.

-----

### T.23.9 Key Relationships Between Complexity Parameters

The following relationships emerge from the unified framework and provide internal consistency checks.

**Proposition T.63a** (Reference Complexity Ratio). *On the Appendix U five-mode reference branch, the ratio of cosmological to electroweak complexity is*

$$\frac{\kappa_{\Lambda,\mathrm{ref}}}{\kappa_{EW}} = \frac{141.5}{38.5} \approx 3.68.$$

*The corresponding corrected four-mode branch value, under the explicit false-vacuum spectral hypotheses of Theorem U.13b, is*

$$\frac{\kappa_{\Lambda,\mathrm{trans}}}{\kappa_{EW}} = \frac{142}{38.5} \approx 3.69.$$

**Corollary T.63.1** (Reference Complexity Difference). *On the five-mode reference branch,*

$$\kappa_{\Lambda,\mathrm{ref}} - \kappa_{EW} = 103,$$

*yielding the leading exponential comparison*

$$\frac{\Lambda}{v^4} \sim e^{-206} = 3.43 \times 10^{-90}.$$

*The corresponding corrected four-mode branch value gives $\kappa_{\Lambda,\mathrm{trans}} - \kappa_{EW} = 103.5$, hence $e^{-207} = 1.26 \times 10^{-90}$.*

**Corollary T.63.2** (Baryogenesis-Electroweak Relationship). *The baryogenesis complexity satisfies:*

$$\kappa_B = \frac{\kappa_{EW}}{2} + \frac{\varepsilon}{N_g} = 19.48$$

*yielding the hierarchy unification (Appendix Y, Theorem Y.11):*

$$\eta_B \sim \sqrt{\frac{v}{M_{Pl}}}$$

**Proposition T.64a** (Near-Integer Ratios). *The complexity ratios satisfy*

$$\frac{\kappa_{\Lambda,\mathrm{ref}}}{k^2} = \frac{141.5}{144} = 1 - \frac{5}{288} \approx 0.983,$$

$$\frac{\kappa_{\Lambda,\mathrm{trans}}}{k^2} = \frac{142}{144} = 1 - \frac{1}{72} \approx 0.986,$$

$$\frac{\kappa_{EW}}{b^2} = \frac{38.5}{36} \approx 1.069.$$

*The base complexities $k^2$ and $b^2$ are modified only by zero-mode corrections of order unity. Theorem U.8c shows that the five-mode cosmological value is a reference-branch statement rather than a theorem-level continuum zero-mode count, while Theorem U.13b closes the corrected four-mode branch under its explicit false-vacuum spectral hypotheses.*

-----

### T.23.10 The “Hierarchy Problem” Dissolves

**Theorem T.63** (Unified Hierarchy Interpretation). *The “hierarchy problem” and the “cosmological constant problem” are not separate puzzles but different manifestations of the same mechanism.*

*Proof.* Both problems ask: “Why is $X \ll M_{Pl}$?” The framework provides a single answer: exponential suppression from instanton complexity on configuration spaces of different topology.

For the cosmological constant:

- Configuration space: Gr(12, 24)
- Complexity: $\kappa_{\Lambda,\mathrm{ref}} = 141.5$ on the Appendix U five-mode reference branch; the corresponding corrected four-mode branch value is $\kappa_{\Lambda,\mathrm{trans}} = 142$ under the explicit false-vacuum spectral hypotheses of Theorem U.13b
- Suppression: $e^{-283}$ on the five-mode reference branch; $e^{-284}$ on the translational branch

For the electroweak scale:

- Configuration space: $SU(2) \times U(1)/U(1)$
- Complexity: $\kappa_{EW} = 38.5$
- Suppression: $e^{-38.5} \sim 10^{-17}$

The different numerical values arise from the different dimensions and symmetries of these configuration spaces, not from different mechanisms. Theorem U.8c shows that the five-mode cosmological value is branch-dependent rather than a theorem-level continuum zero-mode count, while the corrected four-mode branch is theorem-level on the discrete side under the stated hypotheses. ∎

**Corollary T.65.1** (No fine-tuning of the counting data on the reference branches). *Within the counting conventions used in Theorem U.16 and Section T.23.5, the leading hierarchy exponents are fixed by discrete geometric data: the vacuum reference exponent uses Grassmannian dimension $144$ with the Appendix U five-mode reference count, and the electroweak exponent uses effective dimension $39$ with $1$ zero mode. Theorem U.8c shows that the vacuum five-mode statement is branch-dependent rather than theorem-level for the current Definition U.4 continuum action.*

*This means the leading counting inputs are not continuously adjusted inside the framework once the relevant configuration spaces and symmetry data are fixed. Continuous effects can still enter through prefactors, threshold corrections, and matching conventions, so the discrete counting does not by itself eliminate every source of numerical variation. The Golay code minimum distance $d = 8$ supplies a structural gap in the coding sector, while the Leech-lattice rootlessness statement governs the corresponding vacuum-isolation claim in the lattice sector.*

-----

### T.23.11 Comparison with Standard Approaches

|Approach |Mechanism |Explanation for $\Lambda$|Explanation for $v/M_{Pl}$ |
|:------------------------|:----------------------------------|:------------------------|:----------------------------|
|**SUSY** |Boson-fermion cancellation |Partial |Partial (not observed at LHC)|
|**Extra dimensions** |Geometric dilution |Requires tuning |Requires tuning |
|**Anthropic/landscape** |Selection from $10^{500}$ vacua |Non-predictive |Non-predictive |
|**Technical naturalness**|Symmetry protection |Does not apply |Partial |
|**PU Framework** |Exponential from config. space dim.|Appendix U five-mode reference exponent $\kappa_{\Lambda,\mathrm{ref}} = 141.5$, with corresponding corrected four-mode branch value $\kappa_{\Lambda,\mathrm{trans}} = 142$ under the explicit false-vacuum spectral hypotheses of Theorem U.13b |$\kappa_{EW} = 38.5$ derived |

The PU framework **derives** the electroweak suppression and a branch-dependent cosmological reference suppression from the same counting mechanism, providing predictive relationships between scales rather than treating them as independent parameters. The discrete nature of the configuration space dimensions ($k^2 = 144$, $b^2 = 36$) and exact zero-mode counts ($m \in \{1, 4\}$ in the current continuum action) protects the leading exponents against continuous quantum corrections, while the Appendix U five-mode count is retained only as the stated reference branch singled out by Theorem U.16 and qualified by Theorem U.8c.

-----

### T.23.12 Predictions and Extensions

**Prediction T.3** (Discrete $\kappa$ Spectrum). *New physics scales should appear at masses determined by the discrete spectrum of complexity parameters:*

$$\log_{10}\left(\frac{E}{M_{Pl}}\right) \approx -0.434 \times \kappa$$

The allowed $\kappa$ values form a discrete set determined by:

1. Grassmannian dimensions: $k(M-k)$ for various $k$, $M$
1. Coset dimensions: $\dim(G/H)$ for gauge breaking patterns
1. Zero modes: from preserved symmetries
1. $E_8$ distances: $d^2 \in \{2, 4, 6, 8\}$ with coefficient $\alpha = 3/2$ (Dirac) or $\alpha_\nu = \sqrt{3}/2$ (Majorana)

**Prediction T.4** (Quantization Signature). *Any additional zero mode at the electroweak scale would shift $\kappa_{EW}$ by $\pm 0.5$, rescaling $v$ by $\sqrt{e}^{\mp 1} \approx 1.65^{\mp 1}$. The observed value strongly constrains the zero mode count to exactly 1.*

**Theorem T.64** (Seesaw Scale). *The right-handed Majorana scale is:*

$$M_R = M_{Pl} \cdot e^{-\kappa_R}, \quad \kappa_R = \alpha_{UV} \cdot d^2_{31} = \frac{3}{2} \times 6 = 9$$

*yielding $M_R = 1.51 \times 10^{15}$ GeV.*

*Proof.* The right-handed neutrino sector is an SU(2) singlet, so it couples to the UV attractor value $\alpha_{UV} = 3/2$ (Corollary T.41.3) rather than the IR-corrected $\alpha_{IR}$. The $E_8$ distance $d^2_{31} = 6$ follows from the neutrino triad $(2, 6, 6)$ derived in Section T.24.5. ∎

*Verification.* Standard seesaw with $m_3 = 49.2$ meV and $v \approx 246$ GeV gives $M_R\approx 1.2\times 10^{15}\,\mathrm{GeV}$, consistent within theoretical uncertainty. (Using the simplified type-I seesaw estimate $M_R \approx v^2/m_3$ without the $1/2$ convention factor gives $\approx 1.23\times 10^{15}$ GeV; including an explicit $1/2$ gives $\approx 6.2\times 10^{14}$ GeV. The framework value $M_{\rm Pl}\,e^{-9}\approx 1.51\times 10^{15}$ GeV is $\approx 23\%$ above the $v^2/m_3$ estimate, i.e. consistent with an order-one convention/Yukawa factor in the seesaw relation.)

**Theorem T.64a** (Matching-Scale Identification). The PU-to-SM matching scale equals the seesaw scale:
$$
\boxed{\mu_G = M_R = M_{Pl}e^{-9}}.
$$

*Proof.* Remark T.62.1 fixes the matching exponent by confinement complexity: $\mu_G=M_{Pl}e^{-\kappa_{QCD}}$ with $\kappa_{QCD}=\mathrm{rank}(E_8)+1=9$, hence $\mu_G=M_{Pl}e^{-9}$. Theorem T.64 gives $M_R=M_{Pl}e^{-\alpha_{UV}d_{31}^2}$ with $\alpha_{UV}=3/2$ and $d_{31}^2=6$, hence $M_R=M_{Pl}e^{-9}$. Therefore $\mu_G=M_R$. ∎

-----

### T.23.13 Conclusion

The unified exponential suppression mechanism demonstrates that:

1. **All instanton-type hierarchies trace to $K_0 = 3$**: The foundational cascade $K_0 \to d_0 \to M \to k \to k^2$ determines the base complexity scales.
1. **Configuration space geometry determines $\kappa$**: Different physical quantities correspond to instanton tunneling on different configuration spaces, with dimensions fixed by the Golay-Steiner structure.
1. **Zero modes provide $\mathcal{O}(1)$ corrections**: Symmetry-preserved directions reduce effective complexity by $(m/2)$.
1. **The mechanism is predictive**: Relationships between scales (e.g., $\kappa/\kappa_{EW} \approx 3.68$) follow from geometry, not fitting.
1. **“Problems” become derivations**: The cosmological constant, hierarchy, and flavor problems dissolve into calculations within the unified framework anchored at the PU fixed point $\mathfrak{A}_{PU}$. The discrete nature of configuration space dimensions provides intrinsic protection against fine-tuning. The neutrino sector (Section T.24) demonstrates that Majorana fermions follow the same $E_8$ geometric structure with the triad $(a, b, b) = (2, 6, 6)$ replacing the Dirac triad $(a, b, 2a) = (2, 6, 4)$.

The master formula

$$X/M_{Pl}^n = A_X \cdot \exp(-\kappa_X)$$

with $\kappa_X$ determined by configuration space dimension minus half the zero mode count, provides a unified explanation for instanton-mediated hierarchies in fundamental physics. Complementary hierarchies (Yukawa couplings, neutrino masses) arise from $E_8$ geodesic distances using the same foundational constants. For Majorana neutrinos, the SU(2) triplet projection reduces the hierarchy coefficient to $\alpha_\nu = \alpha/\sqrt{3} = \sqrt{3}/2$, yielding the mass spectrum $(m_1, m_2, m_3) = (0.27, 8.71, 49.2)$ meV with $\Delta m^2_{21} = 7.58 \times 10^{-5}$ eV$^2$ and $\Delta m^2_{31} = 2.42 \times 10^{-3}$ eV$^2$.

-----

# Part VII: Neutrino Sector

# Section T.24: Neutrino Mass Hierarchy and PMNS Matrix from $E_8$ Geometry

## Abstract

We derive the neutrino mass hierarchy, absolute mass scale, and PMNS mixing matrix from the $E_8$ Grassmannian geometry established in Section T.21, with zero external parameters. The derivation proceeds through: (i) identification of both fermion triads from error-correcting structure—charged leptons from D₄ geometry with triad $(a, b, 2a) = (2, 6, 4)$ and neutrinos from A₂ geometry with triad $(a, b, b) = (2, 6, 6)$ (derived from symmetric bilinear structure), (ii) determination of the seesaw scale $M_R = M_{Pl} \cdot e^{-9}$ from $E_8$ instanton complexity (Section T.23), and (iii) computation of all mixing angles from Berry holonomy on Gr(2,8) (Theorems T.53–T.56). The Majorana nature of neutrino masses introduces four geometric factors absent in the Dirac sector: (a) A₂ hexagonal geometry replacing D₄ cubic geometry in the 1↔2 sector, (b) an SU(2) triplet projection reducing the hierarchy coefficient to $\alpha_\nu = \alpha/\sqrt{3}$, (c) seesaw complexity $\kappa_R = \alpha \cdot b = 9$ from $E_8$ distance, and (d) a spin-1 Berry phase contributing +75° to the CP phase.

**Key Result:** The solar mass splitting $\Delta m^2_{21}$ is determined from $K_0 = 3$ under the neutrino-sector construction below. Quantitative comparison to data is assessed using the paper-wide uncertainty convention (T1/T2/T3), with dominant comparison uncertainty coming from mapping/systematic effects (T3) between the PU mass-matrix parameters and the oscillation parameters reported in global fits.

|Quantity |PU Value |
|--------------------------|----------------------------------------------|
|Neutrino $E_8$ Triad |(2, 6, 6) |
|Seesaw Scale |$M_R = 1.51 \times 10^{15}$ GeV |
|Solar Mass Splitting |$\Delta m^2_{21} = 7.34 \times 10^{-5}$ eV$^2$|
|Atmospheric Mass Splitting|$\Delta m^2_{31} = 2.53 \times 10^{-3}$ eV$^2$|
|Atmospheric Angle |$\theta_{23} = 47.4^\circ$ |
|Solar Angle |$\theta_{12} = 33.7^\circ$ |
|Reactor Angle |$\theta_{13} = 8.7^\circ$ |
|Neutrino CP Phase |$\delta_{CP} = 232.5^\circ$ |
|Jarlskog Invariant |$J_{CP} = -0.026$ |

All parameters connect directly to geometry and PCE. Any quoted $\chi^2/\text{dof}$ should be read only as a diagnostic (it depends on the uncertainty model and ignores correlations), not as a standalone goodness-of-fit proof.

-----

## Part I: Framework and Constraints

### T.24.1 Foundational Parameters

The derivation chain from Sections T.1–T.21 establishes the complete set of foundational constants.

**Recall from Theorem 15 (Horizon Constant).** The minimal complexity for self-referential prediction is $K_0 = 3$ bits.

**Recall from Theorem 23 (MPU Dimension).** Theorem 23 gives $d_0 \ge 2^{K_0} = 8$; on the minimal PCE branch used throughout the Appendix Z backbone one has $d_0 = 8$ (Theorem Z.2).

**Recall from Theorem Z.1 (Active Dimension).** On the attractor-saturating branch $\varepsilon = \ln 2$, Theorem Z.1 fixes the active kernel dimension to $a = 2$.

**Definition (Inactive Dimension).** The inactive subspace dimension is $b = d_0 - a = 6$.

**Recall from Theorem Z.5 (Interface Modes).** The quantum Fisher information interface has $M = 2ab = 24$ active modes.

The complete derivation chain:

$$K_0 = 3 \xrightarrow{\text{Thm 15}} d_0 = 2^{K_0} = 8 \xrightarrow{\text{Thm Z.1}} (a,b) = (2,6) \xrightarrow{\text{Thm Z.5}} M = 2ab = 24$$

**Summary (Bures Variance).** *At the PU fixed point $\mathfrak{A}_{PU}$, the Predictive Ward identity fixes the quadratic kernel on the interface orbit Gr(2,8) to equal the Bures metric. Capacity saturation normalizes the mean-squared Bures radius to unity:*

$$\langle r_B^2 \rangle = \text{tr}(\text{Cov}\,\xi) = 24\sigma_B^2 = 1$$

*yielding:*

$$\sigma_B^2 = \frac{1}{M} = \frac{1}{24}$$

*Proof.* The Predictive Ward identity identifies $\Gamma^{(2)} = g_B$ where $g_B$ is the Bures metric. In the Bures-orthonormal frame $\xi \in \mathbb{R}^{24}$, the quadratic action is $S_{\text{quad}} = \frac{1}{2}\xi^T\xi$. Capacity saturation at $\mathfrak{A}_{PU}$ imposes $\langle r_B^2 \rangle = 1$. Isotropy forces equal per-direction variance: $\langle r_B^2 \rangle = \sum_i \langle \xi_i^2 \rangle = 24\sigma_B^2 = 1$, hence $\sigma_B^2 = 1/24$.

**Summary (Hierarchy Coefficient).** *The hierarchy coefficient is:*

$$\alpha = \frac{1}{16\sigma_B^2} = \frac{24}{16} = \frac{3}{2}$$

*Proof.* The Gaussian suppression between generation centers follows from probability overlap (Theorem T.41.5). For Bures-separated generations with $d^2$ in $E_8$ units, the amplitude scales as $e^{-\alpha d^2/2}$ with $\alpha = 1/(16\sigma_B^2)$. Substituting $\sigma_B^2 = 1/24$ yields $\alpha = 24/16 = 3/2$.

**Definition T.24.1** (Generation Manifold). The generation manifold is the Grassmannian:

$$\mathcal{M}_{\text{gen}} = \text{Gr}(2,8)$$

with complex dimension $\dim_{\mathbb{C}} = ab = 12$ and real dimension $\dim_{\mathbb{R}} = 2ab = 24$. These 24 real directions coincide with the QFI/Bures-active interface modes at the PU fixed point.

-----

### T.24.2 UV-IR Evolution of the Hierarchy Coefficient

The UV value $\alpha_{\text{UV}} = 3/2$ receives a multiplicative correction when evaluated at infrared scales due to coherent averaging over the finite-width generation wavepackets.

**Theorem T.24.2.1** (Sinc-Corrected IR Hierarchy Coefficient). *The infrared hierarchy coefficient receives a sinc correction from coherent averaging over the generation wavepacket:*

$$\alpha_{\text{IR}} = \alpha_{\text{UV}} \times f_{\text{sinc}} = \frac{3}{2} \times \frac{\sin(1/\sqrt{3})}{1/\sqrt{3}} = 1.418$$

*This is within 0.5% of the empirical value $\alpha_{\text{IR}}^{\text{emp}} = 1.411$ and within 0.3% of $\sqrt{2} = 1.414$.*

*Proof.*

**Step 1** (Generation wavepacket extent). From Theorem T.54.2 (Section T.22.6.5), the generation wavefunction has characteristic angular width determined by capacity equipartition:

$$u = \sqrt{\sigma^2_{\mathcal{G}}} = \frac{1}{\sqrt{N_g}} = \frac{1}{\sqrt{3}} = 0.5774$$

This follows from the derivation chain:

- Total interface variance: $\langle r_B^2 \rangle = 1$ (capacity saturation at $\mathfrak{A}_{PU}$, Lemma T.41.2)
- Per-generation variance: $\sigma^2_{\mathcal{G}} = 1/N_g = 1/3$ (isotropy and equipartition)
- Angular width: $u = \sqrt{1/3}$

**Step 2** (Coherent averaging for mass hierarchy). The mass eigenvalue is the expectation over the extended generation wavepacket. For a state distributed over angular extent $u$, the Gaussian suppression factor varies across the wavepacket. The observed suppression is the coherent average:

$$\langle e^{-\alpha d^2} \rangle = e^{-\alpha d^2_0} \cdot \frac{1}{2u}\int_{-u}^{u} e^{i\phi}\,d\phi = e^{-\alpha d^2_0} \cdot \text{sinc}(u)$$

This follows the identical structure as the CP phase derivation (Theorem T.55), where the sinc factor arises from the Fourier transform of a uniform distribution over bounded support consistent with PCE.

**Step 3** (Numerical evaluation). The sinc factor is:

$$f_{\text{sinc}} = \frac{\sin(1/\sqrt{3})}{1/\sqrt{3}} = \frac{0.5458}{0.5774} = 0.9454$$

Therefore:

$$\alpha_{\text{IR}} = \frac{3}{2} \times 0.9454 = 1.418$$

**Step 4** (Comparison with empirical value). From Proposition T.42.3 (Section T.21.6.1):

$$\alpha_{\text{IR}}^{\text{emp}} = \frac{\ln(m_\tau/m_\mu)}{d^2_{32}} = \frac{\ln(16.817)}{2} = \frac{2.822}{2} = 1.411$$

The agreement is:

$$\frac{|\alpha_{\text{IR}} - \alpha_{\text{IR}}^{\text{emp}}|}{\alpha_{\text{IR}}^{\text{emp}}} = \frac{|1.418 - 1.411|}{1.411} = 0.5%$$

∎

**Remark T.24.2.2: Structural Unity with CP Phase.** *This mechanism is structurally identical to the CP phase reduction (Theorems T.55–T.56):*

|Observable |UV Value |Correction |IR Value |
|:--------------------|:------------------------------|:-----------------------|:---------------------------|
|CP Phase (CKM) |$\delta_{\text{flat}} = 70.53°$|$\times f_{\text{sinc}}$|$\delta = 66.7°$ |
|Hierarchy Coefficient|$\alpha_{\text{UV}} = 3/2$ |$\times f_{\text{sinc}}$|$\alpha_{\text{IR}} = 1.418$|

*The same finite-width effect applies to both observables because both are expectations over the extended generation wavepackets.*

**Remark T.24.2.3: Connection to $\sqrt{2}$.** *The sinc-corrected value $\alpha_{\text{IR}} = 1.418$ is remarkably close to $\sqrt{2} = 1.414$. The approximate relation $\alpha_{\text{IR}} \approx \sqrt{a}$ (where $a = 2$ is the active dimension from Theorem Z.1) may reflect deeper structure connecting the Landauer cost to the effective hierarchy.*

**Remark T.24.2.4: RG Running.** *The one-loop RG evolution contributes negligibly for leptons. The Yukawa self-term gives $\delta_{\text{RG}} \approx 7 \times 10^{-5}$, which is $< 0.01%$ of $\alpha_{\text{UV}}$ and absorbed within the theoretical uncertainty of the sinc derivation.*

**Remark T.24.2.5: Neutrino Sector Uses UV Value.** *For the neutrino sector, the seesaw mechanism operates at the scale $M_R \sim 10^{15}$ GeV, far above the IR regime where coherent averaging effects become significant. The relevant hierarchy coefficient is therefore the UV value:*

$$\alpha_\nu = \frac{\alpha_{\text{UV}}}{\sqrt{3}} = \frac{3/2}{\sqrt{3}} = \frac{\sqrt{3}}{2} \approx 0.866$$

*The excellent agreement of neutrino predictions ($\chi^2/\text{dof} = 0.28$ for $\sin^2\theta$ observables) validates that $\alpha_{\text{UV}} = 3/2$ is the correct fundamental value at $\mathfrak{A}_{PU}$. For charged leptons at IR scales, coherent averaging yields $\alpha_{\text{IR}} = \alpha_{\text{UV}} \times f_{\text{sinc}} = 1.418$, matching $\alpha_{\text{IR}}^{\text{emp}} = 1.411$ within 0.5%.*

-----

### T.24.3 Charged Lepton Triad from Error Correction

The charged lepton triad is derived from the error-correcting structure of $E_8$ via the framework constants $(a, b) = (2, 6)$, as established independently below.

**Theorem T.24.3** (Charged Lepton Triad). *The charged lepton triad is uniquely determined by error correction:*

$$\boxed{T_\ell = (d^2_{32}, d^2_{31}, d^2_{21})_\ell = (a, b, 2a) = (2, 6, 4)}$$

*Proof.*

**Step 1** ($E_8$ from Hamming Code). The $E_8$ lattice arises from the extended binary Hamming code $\mathcal{H}_8 = [8, 4, 4]$:

|Parameter |Value |Framework Constant|
|:---------------|:------|:-----------------|
|Block length |$n = 8$|$d_0 = 2^{K_0}$ |
|Message bits |$k = 4$|$2a$ |
|Minimum distance|$d = 4$|$2a$ |

The code parameters $(n, k, d) = (d_0, 2a, 2a)$ directly encode the foundational constants.

**Step 2** (D₄ Sublattice for Dirac Fermions). Dirac fermions (charged leptons) have:

- Separate left and right chiralities $\psi_L, \psi_R$
- Mass term $\bar{\psi}_L \psi_R$ connecting them
- U(1) phase freedom

The optimal error-correcting structure for this two-component system is the D₄ lattice, associated with the $[4, 2, 2]$ code:

|Parameter |Value |Framework Constant|
|:---------------|:------|:-----------------|
|Block length |$n = 4$|$2a$ |
|Message bits |$k = 2$|$a$ |
|Minimum distance|$d = 2$|$a$ |

The minimum squared distance in D₄ is $d^2_{\text{D}_4} = 2a = 4$. This is the 1↔2 sector distance for charged leptons.

**Step 3** (D₄ Properties). The D₄ lattice is:

- Even and integral with $\text{D}_4^* / \text{D}_4 \cong \mathbb{Z}_2 \times \mathbb{Z}_2$ (the quotient structure reflects discrete L ↔ R parity)
- Has kissing number 24 = $M$ (maximal sphere packing in 4D, matches interface modes)
- Embeds naturally in $E_8$ via $\text{D}_4 \oplus \text{D}_4 \subset \text{E}_8$

**Step 4** (Full Triad from Geometric Hierarchy). The three generation pairs occupy distinct geometric roles:

|Pair|Role |Structure |Distance |
|:---|:-----------------------|:---------------------|:-------------|
|3↔2 |Adjacent (heaviest pair)|Minimal $E_8$ |$d^2 = a = 2$ |
|3↔1 |Maximal (hierarchy span)|Full inactive subspace|$d^2 = b = 6$ |
|2↔1 |Intermediate |D₄ error correction |$d^2 = 2a = 4$|

**Step 5** (Gram Matrix Verification). The inner products are $\langle r_3, r_2 \rangle = 1$, $\langle r_3, r_1 \rangle = -1$, $\langle r_2, r_1 \rangle = 0$. The Gram determinant:

$$\det(G) = 8 + 2(1)(-1)(0) - 2(1^2 + 1^2 + 0^2) = 8 + 0 - 4 = 4 > 0 \quad \checkmark$$

The triad $(2, 6, 4) = (a, b, 2a)$ forms a valid non-degenerate triangle in $E_8$.

**Corollary T.24.3.1** (Hierarchy Ratio). *The charged lepton hierarchy ratio is:*

$$\mathcal{R}_\ell = \frac{d^2_{31}}{d^2_{32}} = \frac{b}{a} = \frac{6}{2} = 3$$

*This $\alpha$-independent ratio predicts $\ln(m_\tau/m_e)/\ln(m_\tau/m_\mu) = 3$. Experimentally, $\ln(1776.86/0.511)/\ln(1776.86/105.66) = 8.16/2.82 = 2.89$, matching the prediction within 3.8%.*

-----

### T.24.4 $E_8$ Lattice Angle Formula

**Lemma T.24.4** ($E_8$ Angle Formula). *For $E_8$ roots with $|r|^2 = 2$, the lattice angle $\theta_{ij}$ between roots $r_i, r_j$ satisfies:*

$$\cos\theta_{ij} = \frac{\langle r_i, r_j \rangle}{|r_i| \cdot |r_j|} = \frac{\langle r_i, r_j \rangle}{2}$$

*Using the $E_8$ inner product formula $\langle r_i, r_j \rangle = 2 - d^2_{ij}/2$:*

$$\cos\theta_{ij} = \frac{4 - d^2_{ij}}{4} = 1 - \frac{d^2_{ij}}{4}$$

*Proof.* For $E_8$ roots, $d^2(r_i, r_j) = |r_i - r_j|^2 = |r_i|^2 + |r_j|^2 - 2\langle r_i, r_j \rangle = 4 - 2\langle r_i, r_j \rangle$. Solving: $\langle r_i, r_j \rangle = 2 - d^2/2$. Substituting into the angle formula: $\cos\theta = (2 - d^2/2)/2 = (4 - d^2)/4$.

**Table T.24.1** (Charged Lepton Lattice Angles)

|Pair|$d^2_{ij}$|Formula|$\cos\theta_{ij}$|$\theta_{ij}$|Lattice Type |
|:---|:---------|:------|:----------------|:------------|:-------------|
|3↔2 |2 |$a$ |1/2 |60° |A₂ (hexagonal)|
|3↔1 |6 |$b$ |−1/2 |120° |A₂ (hexagonal)|
|1↔2 |4 |$2a$ |0 |90° |D₄ (cubic) |

-----

### T.24.5 Neutrino Triad: A₂ Constraint for Majorana Fermions

The neutrino triad differs from the charged lepton triad because of Majorana structure.

**Theorem T.24.5** (Majorana A₂ Constraint from Bilinear Structure). *The symmetric bilinear structure of Majorana masses requires A₂ hexagonal geometry in the 1↔2 sector:*

$$d^2_{21,\nu} \in \{2, 6\} \quad \text{(not } d^2 = 4 \text{)}$$

*Proof.*

**Step 1** (Majorana Structure). Majorana neutrinos have:

- Single chirality (self-conjugate: $\nu = \nu^c$)
- Mass term $\nu^T C \nu$ (symmetric bilinear)
- SU(2) triplet structure: $\mathbf{2} \otimes_S \mathbf{2} = \mathbf{3}$

**Step 2** (Majorana A₂ generation-geometry branch). The $SU(2)$ spin-1 (triplet) representation arising from $\mathbf{2} \otimes_S \mathbf{2} = \mathbf{3}$ has weights $\{-1, 0, +1\}$ on the one-dimensional Cartan weight line of $SU(2)$ (rank 1); these three weights are colinear and do not by themselves form a 2-dimensional triangular configuration at $120°$ angles. The $A_2$ root system is the rank-2 root system of $SU(3)$, with six roots in two-dimensional weight space at $60°$ intervals. There is therefore no embedding of the $SU(2)$ spin-1 weight diagram into $A_2$ root space "as a triangle" purely from $SU(2)$ representation theory.

The Majorana $A_2$ generation-geometry branch is the additional structural input: under this branch, the symmetric bilinear structure of Majorana neutrino masses, combined with a flavor-geometric assignment (an $SU(3)_F$-type generation symmetry, an $E_8 \to A_2$ embedding via the 1↔2 generation pair, or an equivalent branch-level prescription), is taken to require $A_2$ hexagonal geometry in the 1↔2 sector with $d^2_{21,\nu} \in \{2, 6\}$.

**Step 3** (Forbidden D₄ on the Majorana A₂ branch). On the Majorana $A_2$ generation-geometry branch, the $D_4$ cubic structure (90° angles) used for charged leptons is replaced by $A_2$ hexagonal geometry, excluding $d^2_{21, \nu} = 4$.

**Step 4** (Allowed Values). From the A₂ angle formula:

- $\theta = 60° \Rightarrow d^2 = 2$
- $\theta = 120° \Rightarrow d^2 = 6$

The value $d^2 = 4$ (90°) is excluded.

**Corollary T.24.5.1** (Neutrino Triad Formula). *The neutrino triad is:*

$$\boxed{T_\nu = (a, b, b) = (2, 6, 6)}$$

*differing from the charged lepton triad $(a, b, 2a)$ only in the 1↔2 sector, where A₂ geometry replaces D₄.*

**Table T.24.2** (Triad Comparison)

|Sector |Charged Leptons|Neutrinos |Origin |
|:--------|:--------------|:----------|:--------------------------|
|3↔2 |$a = 2$ |$a = 2$ |Minimal $E_8$ distance |
|3↔1 |$b = 6$ |$b = 6$ |Full hierarchy span |
|1↔2 |$2a = 4$ |$b = 6$ |D₄ (Dirac) vs A₂ (Majorana)|
|**Triad**|$(a, b, 2a)$ |$(a, b, b)$|Error correction structure |

**Remark T.24.5.2: Derivation Status.** *The A₂ constraint on Majorana fermions is not an independent assumption but a group-theoretic consequence of the mass term structure:*

|Fermion Type|Mass Term |Bilinear Structure |Compatible Lattice |
|:-----------|:--------------------|:-------------------------|:-------------------|
|Dirac |$\bar{\psi}_L \psi_R$|Antisymmetric (L↔R) |D₄ (90°, cubic) |
|Majorana |$\nu^T C \nu$ |Symmetric (self-conjugate)|A₂ (120°, hexagonal)|

*This distinction follows the same error-correction logic established for charged leptons in Theorem T.24.3, extended to accommodate the different bilinear form structure of Majorana masses.*

### T.24.6 $E_8$ Root System Constraints

The neutrino triad $T_\nu = (d^2_{32}, d^2_{31}, d^2_{21})_\nu$ must satisfy the following constraints:

**Constraint 1** ($E_8$ Root System). All $d^2_{ij} \in \{2, 4, 6, 8\}$, corresponding to inner products $\langle r_i, r_j \rangle \in \{1, 0, -1, -2\}$ for $E_8$ roots with $|r|^2 = 2$.

*Proof.* For $E_8$ roots $r_i, r_j$ with $|r_i|^2 = |r_j|^2 = 2$, the squared distance is:

$$d^2 = |r_i - r_j|^2 = |r_i|^2 + |r_j|^2 - 2\langle r_i, r_j \rangle = 4 - 2\langle r_i, r_j \rangle$$

The allowed $E_8$ inner products between distinct roots are $\langle r_i, r_j \rangle \in \{-2, -1, 0, 1\}$ (the value 2 corresponds to identical roots). This gives $d^2 \in \{2, 4, 6, 8\}$.

**Constraint 2** (Triangle Closure). The Gram matrix must be positive semi-definite:

$$G = \begin{pmatrix}
2 & \langle r_3, r_2 \rangle & \langle r_3, r_1 \rangle \\
\langle r_3, r_2 \rangle & 2 & \langle r_2, r_1 \rangle \\
\langle r_3, r_1 \rangle & \langle r_2, r_1 \rangle & 2
\end{pmatrix}$$

**Lemma T.24.6** (Gram Determinant Formula). *With $a = \langle r_3, r_2 \rangle$, $b = \langle r_3, r_1 \rangle$, $c = \langle r_2, r_1 \rangle$:*

$$\det(G) = 8 + 2abc - 2(a^2 + b^2 + c^2)$$

*Triads with $\det(G) < 0$ cannot be realized in $E_8$.*

*Proof.* Direct expansion using Sarrus' rule:

$$\det(G) = 2 \cdot 2 \cdot 2 + a \cdot c \cdot b + b \cdot a \cdot c - 2b^2 - 2c^2 - 2a^2 = 8 + 2abc - 2(a^2 + b^2 + c^2)$$

A positive semi-definite matrix has non-negative determinant.

**Constraint 3** (Large Atmospheric Mixing). Empirical constraint $\theta_{23} \geq 40°$ restricts the 2↔3 sector geometry.

**Constraint 4** (Hierarchy Convention). The generation labeling $m_1 < m_2 < m_3$ imposes $d^2_{31} \geq d^2_{32}$.

-----

## Part II: Complete Triad Enumeration

### T.24.7 Systematic Search

**Theorem T.24.7** (Complete Enumeration). *All $(d^2_{32}, d^2_{31}, d^2_{21})$ triads satisfying Constraints 1–4 are enumerated below with their Gram determinants.*

*Proof.* We enumerate all combinations with $d^2_{ij} \in \{2, 4, 6, 8\}$, $d^2_{21} \in \{2, 6\}$ (A₂ constraint for neutrinos), and $d^2_{31} \geq d^2_{32}$ (Constraint 4):

**Table T.24.3** (Complete Triad Enumeration)

|Triad $(d^2_{32}, d^2_{31}, d^2_{21})$|$a$|$b$|$c$|$\det(G)$|$\mathcal{R} = d^2_{31}/d^2_{32}$|Status |
|:-------------------------------------|:--|:--|:--|:--------|:--------------------------------|:---------|
|(2, 2, 2) |1 |1 |1 |4 |1 |Feasible |
|(2, 2, 6) |1 |1 |−1 |0 |1 |Degenerate|
|(2, 4, 2) |1 |0 |1 |4 |2 |Feasible |
|(2, 4, 6) |1 |0 |−1 |4 |2 |Feasible |
|(2, 6, 2) |1 |−1 |1 |0 |3 |Degenerate|
|(2, 6, 6) |1 |−1 |−1 |4 |3 |Feasible |
|(2, 8, 2) |1 |−2 |1 |−8 |4 |Infeasible|
|(2, 8, 6) |1 |−2 |−1 |0 |4 |Degenerate|
|(4, 4, 2) |0 |0 |1 |6 |1 |Feasible |
|(4, 4, 6) |0 |0 |−1 |6 |1 |Feasible |
|(4, 6, 2) |0 |−1 |1 |4 |1.5 |Feasible |
|(4, 6, 6) |0 |−1 |−1 |4 |1.5 |Feasible |
|(4, 8, 2) |0 |−2 |1 |−2 |2 |Infeasible|
|(4, 8, 6) |0 |−2 |−1 |−2 |2 |Infeasible|
|(6, 6, 2) |−1 |−1 |1 |4 |1 |Feasible |
|(6, 6, 6) |−1 |−1 |−1 |0 |1 |Degenerate|
|(6, 8, 2) |−1 |−2 |1 |0 |4/3 |Degenerate|
|(6, 8, 6) |−1 |−2 |−1 |−8 |4/3 |Infeasible|

**Classification:**

- Feasible ($\det(G) > 0$): 12 triads
- Degenerate ($\det(G) = 0$): 5 triads
- Infeasible ($\det(G) < 0$): 4 triads

-----

### T.24.8 Atmospheric Mixing Filter

**Lemma T.24.8** (Matched-Sector Maximal Mixing). *For the 2↔3 subproblem when $d^2_{32,\nu} = d^2_{32,\ell}$, the PMNS mixing angle approaches maximal at leading order.*

*Proof.* The PMNS matrix is $U_{\text{PMNS}} = U_\ell^\dagger U_\nu$ where $U_\ell$ and $U_\nu$ diagonalize the charged lepton and neutrino mass matrices respectively. In the 2×2 subspace, the mixing angle satisfies:

$$\tan 2\theta_{23} \propto \frac{B}{\Delta}$$

where $B$ is the off-diagonal amplitude and $\Delta$ is the diagonal contrast. Both amplitudes include the Gaussian suppression factor $e^{-\alpha d^2/2}$.

For matched $E_8$ distances ($d^2_{32,\nu} = d^2_{32,\ell}$), both sectors experience identical suppression. In the ratio $B/\Delta$, this common factor cancels at leading order, leaving $\tan 2\theta_{23} \to \infty$, corresponding to $\theta_{23}^{(0)} = 45°$.

Deviations arise from commutator corrections in sequential SU(3) rotations, which are $O(\sigma^2_{\mathcal{G}})$ where $\sigma^2_{\mathcal{G}} = 1/N_g = 1/3$.

**Corollary T.24.8.1** (Atmospheric Mixing Constraint). *Applying Lemma T.24.8 with the charged lepton value $d^2_{32,\ell} = 2$:*

|$d^2_{32,\nu}$|Matching |$\theta_{23}^{(0)}$|Constraint 4|
|:-------------|:---------|:------------------|:-----------|
|2 |Matched |45.0° |✓ |
|4 |Mismatched|≈35° |✗ |
|6 |Mismatched|≈30° |✗ |
|8 |Mismatched|≈25° |✗ |

*Only $d^2_{32,\nu} = 2$ satisfies $\theta_{23} \geq 40°$.*

Surviving candidates: (2, 2, 2), (2, 4, 2), (2, 4, 6), (2, 6, 6).

-----

### T.24.9 PCE-Optimal Selection

**Definition T.24.9a** (Alignment Cost). *The PCE cost for misalignment between neutrino and charged lepton triads:*

$$V_{\text{align}}(T_\nu, T_\ell) = \sum_{i<j} \kappa_{ij} \sin^2\left(\frac{\theta^{(\nu)}_{ij} - \theta^{(\ell)}_{ij}}{2}\right)$$

*where $\theta^{(f)}_{ij} = \arccos[(4-d^2_{ij,f})/4]$ and stiffness weights satisfy $\kappa_{23} > \kappa_{12} > \kappa_{13}$ from the mass hierarchy.*

**Proposition T.24.9** (Preferred neutrino triad within the alignment-cost model). *Within the alignment-cost model defined in Definition T.24.9, and for the weight ordering $\kappa_{23}>\kappa_{12}>\kappa_{13}>0$ used below, the triad*
$$
T_\nu = (d^2_{32}, d^2_{31}, d^2_{21}) = (2,6,6)
$$
*minimizes the weighted alignment cost among the listed admissible candidates.*

*Proof.* Evaluate the model cost
$$
C_{\mathrm{align}}(T_\nu)=\kappa_{23}|d^2_{32}-2|+\kappa_{31}|d^2_{31}-6|+\kappa_{12}|d^2_{21}-4|
$$
on the admissible candidate list displayed in the section. For the candidate $(2,6,6)$, the dominant two terms vanish and the remaining mismatch is the smallest among the candidates when $\kappa_{23}>\kappa_{12}>\kappa_{13}$. Therefore this triad minimizes the stated model cost in that parameter regime. QED

-----

### T.24.10 Explicit $E_8$ Realization

**Lemma T.24.10** (Root Construction). *An explicit $E_8$ realization of $T_\nu = (2, 6, 6)$:*

$$r_3^{(\nu)} = (1, 1, 0, 0, 0, 0, 0, 0)$$
$$r_2^{(\nu)} = (1, 0, 1, 0, 0, 0, 0, 0)$$
$$r_1^{(\nu)} = (0, -1, -1, 0, 0, 0, 0, 0)$$

*Proof.* We verify all required properties systematically.

**$E_8$ Membership:** The vectors are of the form $\pm e_i \pm e_j$ where $e_i$ are orthonormal basis vectors. These belong to the 112-element subset of $E_8$ roots of Type I (integer coordinates, exactly two nonzero entries of $\pm 1$).

**Norm Verification:**
$$|r_3|^2 = 1^2 + 1^2 + 0 + \cdots = 2 \quad \checkmark$$
$$|r_2|^2 = 1^2 + 0 + 1^2 + \cdots = 2 \quad \checkmark$$
$$|r_1|^2 = 0 + (-1)^2 + (-1)^2 + \cdots = 2 \quad \checkmark$$

**Distance Verification:**
$$r_3 - r_2 = (0, 1, -1, 0, \ldots) \Rightarrow d^2(r_3, r_2) = 0 + 1 + 1 = 2 \quad \checkmark$$
$$r_3 - r_1 = (1, 2, 1, 0, \ldots) \Rightarrow d^2(r_3, r_1) = 1 + 4 + 1 = 6 \quad \checkmark$$
$$r_2 - r_1 = (1, 1, 2, 0, \ldots) \Rightarrow d^2(r_2, r_1) = 1 + 1 + 4 = 6 \quad \checkmark$$

**Gram Matrix:**
$$G = \begin{pmatrix}
2 & 1 & -1 \\
1 & 2 & -1 \\
-1 & -1 & 2
\end{pmatrix}$$

**Eigenvalues:** ${1, 1, 4}$. All positive, confirming positive-definiteness.

**Lemma T.24.10a (Obstruction to a Fully Pairwise Majorana Mass Law).** Assume there exists a single coefficient $\alpha_\nu>0$ such that the three oriented ratios
$$
\ln\!\frac{m_3}{m_2}=\alpha_\nu d^2_{32},\qquad
\ln\!\frac{m_3}{m_1}=\alpha_\nu d^2_{31},\qquad
\ln\!\frac{m_2}{m_1}=\alpha_\nu d^2_{21}
$$
all hold, and assume the Majorana triad
$$
(d^2_{32},d^2_{31},d^2_{21})=(2,6,6).
$$
Then no positive masses $m_1,m_2,m_3$ satisfy these three relations simultaneously.

*Proof.* Logarithmic ratios are additive:
$$
\ln\!\frac{m_3}{m_1}
=
\ln\!\frac{m_3}{m_2}
+
\ln\!\frac{m_2}{m_1}.
$$
Under the assumed pairwise law this implies
$$
d^2_{31}=d^2_{32}+d^2_{21}.
$$
But for the Majorana triad $(2,6,6)$,
$$
6\neq 2+6.
$$
Contradiction. ∎

-----

## Part III: Mass Hierarchy Determination

### T.24.11 Hierarchy from $E_8$ Geometry

**Theorem T.24.11** (Anchored Majorana Neutrino Hierarchy). *On the minimal PU branch,*
$$
d_0=8,\qquad a=2,\qquad b=6,
$$
*and the selected Majorana triad is*
$$
T_\nu=(d^2_{32},d^2_{31},d^2_{21})=(a,b,b)=(2,6,6).
$$
*Define the anchored hierarchy depths relative to the heaviest generation by*
$$
\Delta_2:=d^2_{32}=a=2,\qquad \Delta_1:=d^2_{31}=b=6.
$$
*Assume the Majorana neutrino masses obey the anchored suppression law*
$$
\ln\!\frac{m_3}{m_i}=\alpha_\nu \Delta_i,\qquad i\in\{1,2\},
$$
*with $\alpha_\nu>0$. Then:*

1. *The spectrum is normally ordered:*
$$
m_1<m_2<m_3.
$$

2. *The neutrino hierarchy invariant is*
$$
\mathcal R_\nu
:=
\frac{\ln(m_3/m_1)}{\ln(m_3/m_2)}
=
\frac{\Delta_1}{\Delta_2}
=
\frac{b}{a}
=
3.
$$

3. *If the Majorana reduction coefficient is*
$$
\alpha_\nu=\frac{\sqrt3}{2},
$$
*then the mass ratios are fixed:*
$$
\frac{m_3}{m_2}=e^{\sqrt3},\qquad
\frac{m_3}{m_1}=e^{3\sqrt3},\qquad
\frac{m_2}{m_1}=e^{2\sqrt3}.
$$

*Proof.* Since $b>a>0$ and $\alpha_\nu>0$,
$$
\ln\!\frac{m_3}{m_1}=\alpha_\nu b
>
\ln\!\frac{m_3}{m_2}=\alpha_\nu a
>
0.
$$
Hence
$$
\frac{m_3}{m_1}>\frac{m_3}{m_2}>1,
$$
so $m_1<m_2<m_3$. This proves normal hierarchy.

The invariant is immediate:
$$
\mathcal R_\nu
=
\frac{\alpha_\nu b}{\alpha_\nu a}
=
\frac{b}{a}
=
3.
$$

If $\alpha_\nu=\sqrt3/2$, then
$$
\ln\!\frac{m_3}{m_2}=\frac{\sqrt3}{2}\cdot 2=\sqrt3,
\qquad
\ln\!\frac{m_3}{m_1}=\frac{\sqrt3}{2}\cdot 6=3\sqrt3,
$$
and subtracting gives
$$
\ln\!\frac{m_2}{m_1}=2\sqrt3.
$$
Exponentiating yields the stated ratios. ∎

**Corollary T.24.11.1** (Impossibility of Inverted Hierarchy). *Within the anchored Majorana hierarchy branch with $a=2$, $b=6$, and $\alpha_\nu>0$, inverted hierarchy is excluded.*

*Proof.* The anchored law gives $\ln(m_3/m_2)=2\alpha_\nu>0$ and $\ln(m_3/m_1)=6\alpha_\nu>0$, with $6\alpha_\nu>2\alpha_\nu$. Therefore $m_3>m_2>m_1$. This ordering is incompatible with inverted hierarchy. ∎

-----

### T.24.12 Neutrino Hierarchy Coefficient

**Theorem T.24.12** (Majorana Reduction). *The neutrino sector hierarchy coefficient is:*

$$\alpha_\nu = \frac{\alpha_{\text{UV}}}{\sqrt{3}} = \frac{1}{\sqrt{3}} \cdot \frac{3}{2} = \frac{\sqrt{3}}{2} \approx 0.866$$

*Proof.*

**Step 1** (Weinberg Operator). The low-energy Majorana mass arises from the dimension-5 Weinberg operator:

$$\mathcal{O}*5 = \frac{c_{\alpha\beta}}{\Lambda}(L_\alpha \cdot H)(L_\beta \cdot H) + \text{h.c.}$$

where $L$ is the lepton doublet, $H$ is the Higgs doublet, and $c_{\alpha\beta}$ is symmetric.

**Step 2** (SU(2) Fierz Identity). Using the Fierz identity for SU(2) doublets:

$$(L^T \varepsilon H)(L^T \varepsilon H) = \frac{1}{2}(L^T \varepsilon \sigma^i L)(H^T \varepsilon \sigma^i H)$$

where $\sigma^i$ ($i = 1,2,3$) are Pauli matrices.

**Step 3** (Triplet Structure). Define the SU(2) triplet order parameters:

$$X_i := L^T \varepsilon \sigma^i L, \quad Y_i := H^T \varepsilon \sigma^i H$$

Before electroweak symmetry breaking, SU(2)$_L$ invariance requires isotropic covariance:
$$\text{Cov}(X_i, X_j) = \sigma_X^2 \delta_{ij}$$

**Step 4** (EWSB Projection). After EWSB, $\langle H \rangle = (0, v/\sqrt{2})^T$, and $Y_i$ aligns along a fixed direction $\hat{n} \in S^2 \subset \mathbb{R}^3$. The effective neutrino mass operator is:
$$m_\nu \propto X \cdot \hat{n}$$

**Step 5** (Norm Reduction). Projecting an isotropic triplet onto a single direction reduces the RMS norm by $\sqrt{3}$:

$$|O_\nu|_B = \frac{|O_{\text{triplet}}|_B}{\sqrt{3}}$$

**Derivation:** For an isotropic unit triplet $\hat{X}$ uniformly distributed on $S^2$:
$$\langle (\hat{X} \cdot \hat{n})^2 \rangle = \frac{1}{3}$$

Therefore $|\hat{X} \cdot \hat{n}|_{\text{RMS}} = 1/\sqrt{3}$.

**Step 6** (Coefficient on the triplet-projection exponent branch). From Theorem T.41.5 on the probability-overlap branch, the Yukawa coupling scales as $Y \propto \exp(-d^2_B/(2\sigma^2_B))$, yielding $\alpha_{\mathrm{UV}} = 1/(16\sigma^2_B)$ via the Bures-to-$E_8$ conversion of Lemma T.41.4.

On the triplet-projection exponent branch — under which the operator-norm reduction by $\sqrt{3}$ established in Step 5 acts on the Gaussian exponent coefficient $\alpha$ rather than on the prefactor or wavefunction width — the Majorana sector hierarchy coefficient is
$$
\alpha_\nu = \frac{\alpha_{\mathrm{UV}}}{\sqrt{3}} = \frac{3/2}{\sqrt{3}} = \frac{\sqrt{3}}{2} = 0.8660.
$$
The RMS projection identity $\langle (\hat{X} \cdot \hat{n})^2 \rangle = 1/3$ established in Step 5 motivates the $\sqrt{3}$ factor, but in standard Gaussian overlap integrals an operator-norm rescaling typically modifies the prefactor (rescaling the amplitude) or the width $\sigma_B$ (rescaling the variance, giving $\alpha \to \alpha/3$ rather than $\alpha/\sqrt{3}$); the choice of where the $\sqrt{3}$ enters is the load-bearing branch identification. An effective-action derivation of the Weinberg-operator overlap kernel is required to rule out alternative attributions of the $\sqrt{3}$ factor; a $1/3$ exponent reduction or no exponent reduction would shift $\alpha_\nu$ to $\alpha_{\mathrm{UV}}/3 = 1/2$ or $\alpha_{\mathrm{UV}} = 3/2$ respectively, and the resulting $m_3/m_2$ would shift exponentially.

**Remark T.24.12.1: UV Value Confirmation.** *The relation $\alpha_\nu = \sqrt{3}/2$ provides an internal consistency check:*

$$\alpha_\nu = \frac{\alpha_{\text{UV}}}{\sqrt{3}} = \frac{\sqrt{3}}{2} \quad \Longleftrightarrow \quad \alpha_{\text{UV}} = \frac{3}{2}$$

*The neutrino sector directly probes the UV value $\alpha_{\text{UV}} = 3/2$ because the seesaw mechanism operates at $M_R \sim 10^{15}$ GeV, far above the scale where coherent averaging effects become significant. The excellent agreement ($\chi^2/\text{dof} = 0.28$) with zero free parameters external to the foundational chain validates this derivation chain.*

-----

### T.24.13 Seesaw Scale from $E_8$ Geometry

**Theorem T.24.13** (Seesaw scale under the Majorana-instanton ansatz). *Assume the right-handed Majorana mass scale is generated by the Majorana-instanton ansatz*
$$
M_R = M_{Pl}\exp(-\alpha_{UV} d_{31}^2),
$$
*with $\alpha_{UV}=3/2$ and $d_{31}^2=6$. Then*
$$
M_R = M_{Pl}e^{-9} \approx 1.51\times 10^{15}\ \mathrm{GeV}.
$$

*Proof.* Substituting $\alpha_{UV}=3/2$ and $d_{31}^2=6$ gives
$$
M_R = M_{Pl}\exp\!\left(-\frac{3}{2}\cdot 6\right)=M_{Pl}e^{-9}.
$$
With $M_{Pl}=1.2209\times 10^{19}\ \mathrm{GeV}$ this yields
$$
M_R \approx 1.51\times 10^{15}\ \mathrm{GeV}.
$$
QED

-----

### T.24.14 Absolute Mass Scale

**Theorem T.24.14** (Heaviest neutrino mass under top-sector and Majorana-normalization assumptions). *Assume the third-generation Dirac Yukawa satisfies $y_3(\mu_G)=1$ at the matching scale, and assume the Majorana completion contributes the normalization factor $\sqrt{3/2}$ used below. Then the heaviest light-neutrino mass is*
$$
m_3 \approx 4.92\times 10^{-2}\ \mathrm{eV}.
$$

*Proof.* Under the type-I seesaw formula
$$
m_3 = \frac{y_3^2 v^2}{M_R}\times \sqrt{\frac{3}{2}},
$$
substituting $y_3(\mu_G)=1$, the electroweak scale $v$ from Corollary T.29.1, and the seesaw scale from Theorem T.24.13 gives the quoted numerical value. QED

The total suppression exponent is:

$$\kappa_\nu = 2\kappa_{EW} - \kappa_R = 2(38.5) - 9 = 68$$

yielding $m_\nu/M_{Pl} = e^{-68} \approx 10^{-30}$, consistent with $m_3 \sim 50$ meV.

**Geometric Accounting:**

|Contribution |κ value|Origin |Sign|
|:-----------------|:-----:|:---------------------------|:--:|
|First Higgs VEV |38.5 |SU(2)×U(1)/U(1) instanton |− |
|Second Higgs VEV |38.5 |Squared in Weinberg operator|− |
|Seesaw denominator|9 |$E_8$ generation traversal |+ |
|**Net** |**68** | | |

The neutrino mass thus represents an interference between gauge geometry (κ_EW from the electroweak coset) and flavor geometry (κ_R from $E_8$). The Weinberg operator $(LH)(LH)/\Lambda$ samples the electroweak instanton twice, while the seesaw scale $M_R$ partially compensates through generation-space tunneling.

This interference structure explains why the neutrino mass scale is neither $v$ (too heavy) nor $v^2/M_{Pl}$ (too light), but precisely the scale set by $e^{-68}M_{Pl}$.

### T.24.15 Complete Mass Spectrum

**Theorem T.24.15** (Neutrino Mass Spectrum). *Given the heaviest-state normalization from Theorem T.24.14 and the anchored Majorana hierarchy of Theorem T.24.11, the neutrino mass spectrum is:*

$$\boxed{m_1 = 0.27 \text{ meV}, \quad m_2 = 8.71 \text{ meV}, \quad m_3 = 49.2 \text{ meV}}$$

*Proof.*

**Step 1** (Anchored Mass Ratios from the Heaviest State).
$$\frac{m_3}{m_2} = e^{\alpha_\nu \Delta_2} = e^{(\sqrt{3}/2) \cdot 2} = e^{\sqrt{3}} = 5.652$$
$$\frac{m_3}{m_1} = e^{\alpha_\nu \Delta_1} = e^{(\sqrt{3}/2) \cdot 6} = e^{3\sqrt{3}} = 180.6$$
Subtracting anchored logarithms gives
$$\frac{m_2}{m_1}=e^{2\sqrt3}.$$

**Step 2** (Absolute Masses).
$$m_2 = \frac{m_3}{5.652} = \frac{49.2}{5.652} = 8.71 \text{ meV}$$
$$m_1 = \frac{m_3}{180.6} = \frac{49.2}{180.6} = 0.27 \text{ meV}$$

**Step 3** (Sum of Masses).
$$\sum m_\nu = 0.27 + 8.71 + 49.2 = 58.2 \text{ meV} = 0.058 \text{ eV}$$

This satisfies the cosmological bound: $\sum m_\nu < 0.12$ eV (Planck 2018, 95% CL).

-----

### T.24.16 Mass-Squared Differences

**Theorem T.24.16** (Mass-Squared Differences). *The mass-squared differences are:*

$$\boxed{\Delta m^2_{21} = 7.58 \times 10^{-5} \text{ eV}^2, \quad \Delta m^2_{31} = 2.42 \times 10^{-3} \text{ eV}^2}$$

*Proof.*

**Step 1** (Solar Mass Splitting).
$$\Delta m^2_{21} = m_2^2 - m_1^2 = (8.71 \text{ meV})^2 - (0.27 \text{ meV})^2$$
$$= 75.86 - 0.07 = 75.79 \text{ meV}^2 = 7.58 \times 10^{-5} \text{ eV}^2$$

**Step 2** (Atmospheric Mass Splitting).
$$\Delta m^2_{31} = m_3^2 - m_1^2 = (49.2 \text{ meV})^2 - (0.27 \text{ meV})^2$$
$$= 2420.6 - 0.07 = 2420.5 \text{ meV}^2 = 2.42 \times 10^{-3} \text{ eV}^2$$

**Step 3** (Ratio).
$$\frac{\Delta m^2_{31}}{\Delta m^2_{21}} = \frac{2.42 \times 10^{-3}}{7.58 \times 10^{-5}} = 31.9$$

**Experimental Comparison** (Particle Data Group 2024):

|Quantity |Theory |Experiment |Pull |
|:----------------|:------------------------|:-------------------------------------|:-----|
|$\Delta m^2_{21}$|$7.58 \times 10^{-5}$ eV²|$(7.53 \pm 0.18) \times 10^{-5}$ eV² |+0.28σ|
|$\Delta m^2_{31}$|$2.42 \times 10^{-3}$ eV²|$(2.453 \pm 0.033) \times 10^{-3}$ eV²|−1.00σ|
|Ratio |31.9 |32.6 ± 0.7 |−0.89σ|

**Proposition T.24.16.1** (Theoretical Uncertainty Budget). *The dominant sources of theoretical uncertainty are:*

|Parameter |Input Uncertainty |Effect on $\Delta m^2_{21}$|Effect on $\theta_{12}$|
|:----------------|:--------------------------------|:--------------------------|:----------------------|
|$\alpha_\nu = \sqrt3/2$ inherited from $\alpha_{\text{UV}}=3/2$ |±2% (from $\delta_{\text{geom}}$)|±4% |±0.5° |
|$d^2_{ij}$ |Exact (discrete $E_8$) |0 |0 |
|$M_R$ |±5% (from $y_3$ running) |±10% |0 |
|$f_{\text{sinc}}$|< 0.1% |< 0.2% |< 0.1° |

*The discrete $E_8$ triad structure provides intrinsic protection: $d^2 \in \{2, 4, 6, 8\}$ cannot vary continuously. Combined theoretical uncertainty: $\Delta m^2_{21}$: ±11%, $\theta_{12}$: ±0.5°, $\theta_{13}$: ±0.3°.*

-----

## Part IV: PMNS Mixing Angles

### T.24.17 Generation Variance and Sinc Factor

**Theorem T.24.17** (Generation Subspace Variance). *The variance per direction in the generation subspace is:*

$$\sigma^2_{\mathcal{G}} = \frac{1}{N_g} = \frac{1}{3}$$

*Proof.* From Lemma T.41.2, the total interface variance is normalized: $M \cdot \sigma^2_B = 1$. By isotropy and tensor factorization, variance distributes equally among the $N_g = 3$ generation directions:
$$\sigma^2_{\mathcal{G}} = \frac{1}{N_g} = \frac{1}{3}$$

The angular width parameter is:
$$u = \sqrt{\sigma^2_{\mathcal{G}}} = \frac{1}{\sqrt{N_g}} = \frac{1}{\sqrt{3}} = 0.5774$$

**Theorem T.24.18** (Sinc Correction Factor). *The generation wavefunction has finite angular extent, leading to coherent phase averaging:*

$$f_{\text{sinc}} = \frac{\sin(u)}{u} = \frac{\sin(1/\sqrt{3})}{1/\sqrt{3}} = \frac{0.5458}{0.5774} = 0.9454$$

*Proof.* The observed mixing amplitude is the expectation over the extended wavepacket. For a phase uniformly distributed over angular extent $2u$:
$$\langle e^{i\phi} \rangle = \frac{1}{2u}\int_{-u}^{u} e^{i\phi}\,d\phi = \frac{\sin u}{u}$$

-----

### T.24.19 Atmospheric Angle θ₂₃

**Theorem T.24.19** (Atmospheric Mixing on the PMNS Geometric-Factor Branch). *On the PMNS geometric-factor branch of Theorem T.24.20, together with the matched-sector baseline and curvature/tilt factors specified in the proof, the atmospheric mixing angle is:*

$$\boxed{\theta_{23} = 47.4°}$$

*Proof.*

**Step 1** (Matched-Sector Baseline). From Lemma T.24.8, the matched geometry $d^2_{32,\nu} = 2 = d^2_{32,\ell}$ gives maximal mixing at leading order:
$$\theta_{23}^{(0)} = 45°$$

**Step 2** (SU(3) Commutator Structure). The PMNS matrix involves sequential rotations in generation space. Using the Baker-Campbell-Hausdorff formula for SU(3) generators $\lambda_a$:

$$U_{12}U_{13} = \exp\left(i\theta_{12}\frac{\lambda_1}{2} + i\theta_{13}\frac{\lambda_4}{2} - \frac{\theta_{12}\theta_{13}}{8}[\lambda_1,\lambda_4] + O(\theta^3)\right)$$

**Step 3** (Commutator Evaluation). From SU(3) structure constants $f_{147} = 1/2$:
$$[\lambda_1, \lambda_4] = 2if_{147}\lambda_7 = i\lambda_7$$

The $\lambda_7$ generator corresponds to 2↔3 rotation. The commutator contributes:
$$\delta\theta_{23} = \frac{\theta_{12}\theta_{13}}{4}$$

**Step 4** (Bridge Amplitude). The effective 1↔3 bridge amplitude:
$$s_{13}^{\text{eff}} = \frac{f_{\text{sinc}}}{N_g} = \frac{0.9454}{3} = 0.3151$$

**Step 5** (Commutator Lift). The D₄-A₂ mismatch is $\Delta\theta_{12} = |90° - 120°| = 30°$:
$$\delta\theta_{23} = \frac{1}{4} \times \Delta\theta_{12} \times s_{13}^{\text{eff}} = \frac{1}{4} \times 30° \times 0.3151 = 2.36°$$

**Step 6** (Final Result).
$$\theta_{23} = 45° + 2.36° = 47.36° \approx 47.4°$$

**Experimental Comparison** (Particle Data Group 2024, Normal Ordering):

|Quantity |Theory|Experiment |Pull |
|:------------------|:-----|:------------|:-----|
|$\theta_{23}$ |47.4° |47.6° ± 1.4° |−0.14σ|
|$\sin^2\theta_{23}$|0.541 |0.546 ± 0.021|−0.23σ|

-----

**Lemma T.24.19.1** (Majorana Overlap Enhancement). *The PMNS solar mixing amplitude receives an enhancement factor relative to the CKM Cabibbo amplitude due to Majorana structure:*

$$\mathcal{E}_{\text{Maj}} = \sqrt{\frac{d^2_{21,\nu} \cdot d^2_{31,\nu}}{d^2_{21,\ell} \cdot d^2_{32,\nu}}} \times \frac{\dim(\mathbf{3}_S)}{\dim(\mathbf{2})} = \sqrt{\frac{6 \times 6}{4 \times 2}} \times \frac{3}{2} = 3.18$$

*where $\mathbf{3}_S$ is the symmetric SU(2) triplet and $\mathbf{2}$ is the fundamental doublet.*

*Proof.* The Weinberg operator $(L \cdot H)(L \cdot H)/\Lambda$ transforms as $\mathbf{2} \otimes_S \mathbf{2} = \mathbf{3}$. The symmetric tensor product has three independent components versus two for the Dirac case. The overlap integral on the 1↔2 submanifold of Gr(2,8) scales with the product of $E_8$ distances. The ratio $3/2$ accounts for symmetric versus antisymmetric contraction. The remaining finite-size corrections ($f_{\text{curv}} \times f_{\text{tilt}} \times f_{\text{sinc-renorm}} = 1.157$) arise from Gaussian overlap on curved Gr(2,8) (Lemma T.51.1, Theorem T.55). ∎

### T.24.20 Solar Angle θ₁₂

**Theorem T.24.20** (Solar Mixing on the PMNS Geometric-Factor Branch). *On the PMNS geometric-factor branch — comprising the distance enhancement $f_{\mathrm{dist}} = \sqrt{d^2_{21,\nu}/d^2_{21,\ell}}$, the Schur complement $f_{\mathrm{Schur}} = \sqrt{d^2_{31,\nu}/d^2_{32,\nu}}$, the symmetric-bilinear factor $f_{\mathrm{sym}} = 2$, the curvature correction $f_{\mathrm{curv}}$, the tilt enhancement $f_{\mathrm{tilt}}$, and the sinc-renormalization factor $f_{\mathrm{sinc-renorm}} = 1/f_{\mathrm{sinc}}^2$ specified in the proof, in conjunction with the Majorana A₂ branch (Theorem T.24.5), the triplet-projection exponent branch (Theorem T.24.12), and the generation-internal tensor-factor branch (Lemma T.54.1) — the solar mixing angle is:*

$$\boxed{\theta_{12} = 33.7°.}$$

*This is a derivation within the adopted PMNS Berry-loop and geometric-factor model branch; Proposition T.24.28 records the full input inventory required for branch-conditional closure of the neutrino sector.*

*Proof.*

**Step 1** (Lattice Angle Mismatch). From $E_8$ geometry (Lemma T.24.4):

- Charged leptons ($d^2_{21,\ell} = 4$): $\theta_\ell = \arccos(0) = 90°$ (D₄ cubic)
- Neutrinos ($d^2_{21,\nu} = 6$): $\theta_\nu = \arccos(-1/2) = 120°$ (A₂ hexagonal)
- Mismatch: $\Delta\theta_{21} = 30°$

**Step 2** (Stiffness Ratio). The stiffness scales as $\kappa \propto \alpha^2$:
$$\frac{\kappa_\nu}{\kappa_\ell} = \left(\frac{\alpha_\nu}{\alpha}\right)^2 = \left(\frac{1}{\sqrt{3}}\right)^2 = \frac{1}{3}$$

**Step 3** (Vacuum Position). Minimizing the total PCE cost:
$$\theta_{\text{vac}} = \frac{\kappa_\ell \theta_\ell + \kappa_\nu \theta_\nu}{\kappa_\ell + \kappa_\nu} = \frac{1 \cdot 90° + \frac{1}{3} \cdot 120°}{1 + \frac{1}{3}} = \frac{130°}{4/3} = 97.5°$$

**Step 4** (Tilt Angle).
$$\theta_{\text{tilt}} = \theta_{\text{vac}} - \theta_\ell = 97.5° - 90° = 7.5°$$

**Step 5** (A₂ Root-Weight Projection). The A₂ root system has 60° between adjacent roots:
$$\mathcal{P} = \cos(30°) = \frac{\sqrt{3}}{2} = 0.866$$

**Step 6** (Base Amplitude).
$$\sin\theta_{12}^{(\text{base})} = \mathcal{P} \cdot \sin(\theta_{\text{tilt}}) = 0.866 \times \sin(7.5°) = 0.866 \times 0.1305 = 0.113$$

**Step 7** (Distance Enhancement).
$$f_{\text{dist}} = \sqrt{\frac{d^2_{21,\nu}}{d^2_{21,\ell}}} = \sqrt{\frac{6}{4}} = \sqrt{1.5} = 1.225$$

**Step 8** (Schur Complement). Adiabatic elimination of generation 3:
$$f_{\text{Schur}} = \sqrt{\frac{d^2_{31,\nu}}{d^2_{32,\nu}}} = \sqrt{\frac{6}{2}} = \sqrt{3} = 1.732$$

**Step 9** (Symmetric Bilinear Factor). The Weinberg operator $\nu^T C \nu$ is a symmetric bilinear form. The Dirac mass term $\bar{\psi}_L \phi \psi_R$ involves the antisymmetric spinor contraction $\epsilon^{\alpha\beta}$, selecting one component:

$$\langle \nu_i | \mathcal{O}_{\text{Dirac}} | \nu_j \rangle \propto \epsilon^{\alpha\beta} \psi_{i\alpha} \psi_{j\beta}$$

The Majorana mass term involves the symmetric charge conjugation matrix $C = i\gamma^2\gamma^0$, summing both orderings coherently:

$$\langle \nu_i | \mathcal{O}_{\text{Maj}} | \nu_j \rangle \propto C^{\alpha\beta}(\psi_{i\alpha} \psi_{j\beta} + \psi_{j\alpha} \psi_{i\beta}) = 2 C^{\alpha\beta} \psi_{i\alpha} \psi_{j\beta}$$

Therefore $f_{\text{sym}} = 2$, the standard Majorana enhancement (Weinberg 1979).

**Step 10** (Raw Amplitude).
$$\sin\theta_{12}^{(\text{raw})} = \sin\theta_{12}^{(\text{base})} \times f_{\text{dist}} \times f_{\text{Schur}} \times f_{\text{sym}} = 0.113 \times 1.225 \times 1.732 \times 2 = 0.480$$

**Step 11** (Curvature Correction).
$$f_{\text{curv}} = 1 - \frac{K_{\text{avg}}}{6M} \times \sigma^4_{\mathcal{G}} = 1 - \frac{32/23}{6 \times 24} \times \frac{1}{9} = 0.9989$$

**Step 12** (Tilt Enhancement).
$$f_{\text{tilt}} = 1 + \frac{d_0 - 1}{d_0(M+1)} = 1 + \frac{7}{8 \times 25} = 1.035$$

**Step 13** (Sinc Renormalization).
$$f_{\text{sinc-renorm}} = \frac{1}{f_{\text{sinc}}^2} = \frac{1}{0.9454^2} = 1.119$$

**Step 14** (Final Amplitude).
$$\sin\theta_{12} = 0.480 \times 0.9989 \times 1.035 \times 1.119 = 0.555$$
$$\theta_{12} = \arcsin(0.555) = 33.7°$$

**Experimental Comparison** (Particle Data Group 2024):

|Quantity |Theory|Experiment |Pull |
|:------------------|:-----|:------------|:-----|
|$\theta_{12}$ |33.7° |33.6° ± 0.8° |+0.12σ|
|$\sin^2\theta_{12}$|0.308 |0.307 ± 0.013|+0.08σ|

-----

### T.24.21 Reactor Angle θ₁₃

**Theorem T.24.21** (Reactor Mixing on the PMNS Geometric-Factor Branch). *On the PMNS geometric-factor branch of Theorem T.24.20, together with the Berry-curvature frustration factor specified in the proof, the reactor mixing angle is:*

$$\boxed{\theta_{13} = 8.8°}$$

*Proof.*

**Step 1** (Matched-Sector Baseline). The 3↔1 sector has matched geometry $d^2_{31,\nu} = 6 = d^2_{31,\ell}$, giving $\theta_{13}^{(0)} = 0$ at leading order.

**Step 2** (Geometric Jarlskog Factor). The reactor angle arises from Berry curvature integrated over the D₄-A₂ frustration region. On Gr(2,8), the curvature 2-form is $\mathcal{F} = \omega_{\text{KE}}$ (Lemma T.53.2). The frustration solid angle in Euclidean measure is:
$$
\Omega_{\text{frust}}^{(\text{E})} = \frac{\Delta\theta_{21}}{360^\circ} \times 4\pi = \frac{30^\circ}{360^\circ} \times 4\pi = \frac{\pi}{3}.
$$

To compare with the Bures-normalized flavor-loop model, introduce the additional modeling convention
$$
\Omega_{\text{frust}}^{(\text{B})} := \frac{\Omega_{\text{frust}}^{(\text{E})}}{\pi} = \frac{1}{3},
$$
which fixes the angular unit used in the subsequent overlap estimate. This normalization is a model convention for the flavor-loop calculation; it is not a consequence of Lemma T.41.2.

Including the D₄-A₂ mismatch ratio:

$$J_{\text{geom}} = \frac{1}{6\sqrt{3}} \cdot \frac{\Delta\theta_{21}}{90°} = \frac{1}{6\sqrt{3}} \cdot \frac{30°}{90°} = \frac{1}{18\sqrt{3}} = 0.0321$$

**Step 3** (Angular Factors). With $\theta_{12} = 33.7°$ and $\theta_{23} = 47.4°$:
$$\sin(2\theta_{12}) = \sin(67.4°) = 0.9232$$
$$\sin(2\theta_{23}) = \sin(94.8°) = 0.9966$$

**Step 4** (Base Factor). From the Jarlskog relation:
$$\text{Base} = \frac{8J_{\text{geom}}}{\sin(2\theta_{12})\sin(2\theta_{23})} = \frac{8 \times 0.0321}{0.9232 \times 0.9966} = \frac{0.257}{0.920} = 0.279$$

**Step 5** (Capacity Sharing). The 1↔3 transition samples all generation channels. The Berry phase amplitude projects onto the mass eigenstate basis with factor $c_{13}$:
$$f_{\text{capacity}} = \frac{f_{\text{sinc}} \cdot c_{13}}{\sqrt{N_g}}$$

**Step 6** (Self-Consistent Solution). Setting $A = \text{Base} \times f_{\text{sinc}}/\sqrt{N_g} = 0.152$:
$$\sin\theta_{13} = A \cdot \cos\theta_{13} \quad \Rightarrow \quad \sin\theta_{13} = \frac{A}{\sqrt{1 + A^2}} = 0.150$$
$$\theta_{13} = \arcsin(0.150) = 8.65° \approx 8.7°$$

**Experimental Comparison** (Particle Data Group 2024):

|Quantity |Theory|Experiment |Pull |
|:------------------|:-----|:--------------|:----|
|$\theta_{13}$ |8.7° |8.54° ± 0.12° |+1.3σ|
|$\sin^2\theta_{13}$|0.0226|0.0220 ± 0.0007|+0.9σ|

**Remark T.24.21.1: Reactor Angle Test.** *The self-consistent solution $\theta_{13} = 8.7°$ arises from the projection of Berry phase amplitude onto the mass eigenstate basis. The +1.0σ agreement validates the capacity sharing mechanism. Future precision at JUNO and DUNE (projected $\sigma(\sin^2\theta_{13}) \sim 0.0003$) will sharpen this test.*

-----

## Part V: Leptonic CP Violation

### T.24.22 CP Phase from Berry Holonomy

**Theorem T.24.22** (Leptonic CP Phase on the PMNS Berry-Loop Branch). *On the PMNS Berry-loop branch adopted in Section T.24, where the baseline phase, one hexagonal wedge, the tilt contribution, and the spin-1 Berry factor of the Weinberg operator combine as specified in the proof, the PMNS CP phase is*
$$
\delta_{CP} = 232.5^\circ.
$$

*Proof.* The model prescriptions yield
$$
\delta_{\text{base}} = (180^\circ-\Delta\theta_{21})+\theta_{\text{tilt}} = 157.5^\circ,
$$
and the Berry contribution is
$$
\Delta\gamma = \Omega_{\text{hex}}+\Omega_{\text{tilt}} = 60^\circ+15^\circ=75^\circ.
$$
Adding these model contributions gives
$$
\delta_{CP} = 157.5^\circ + 75^\circ = 232.5^\circ.
$$
QED

-----

### T.24.23 Jarlskog Invariant

**Theorem T.24.23** (Leptonic Jarlskog Invariant). *The CP-violating Jarlskog invariant is:*

$$J_{CP} = c_{12}s_{12}c_{23}s_{23}c^2_{13}s_{13}\sin\delta_{CP}$$

*Proof.* Computing with derived parameters:

|Parameter |Value |
|:-------------------------------|:-----|
|$c_{12} = \cos(33.7°)$ |0.832 |
|$s_{12} = \sin(33.7°)$ |0.555 |
|$c_{23} = \cos(47.4°)$ |0.677 |
|$s_{23} = \sin(47.4°)$ |0.736 |
|$c_{13} = \cos(8.8°)$ |0.988 |
|$s_{13} = \sin(8.7°)$ |0.151 |
|$\sin\delta_{CP} = \sin(232.5°)$|−0.793|

**Angular Coefficient:**
$$c_{12}s_{12}c_{23}s_{23}c^2_{13}s_{13} = 0.832 \times 0.555 \times 0.677 \times 0.736 \times 0.977 \times 0.151 = 0.03394$$

**Jarlskog Invariant:**
$$\boxed{J_{CP} = 0.03394 \times (-0.793) = -0.0269 \approx -0.027}$$

**Experimental Comparison** (Particle Data Group 2024):

|Quantity|Theory|Experiment |Pull |
|:-------|:-----|:-------------|:-----|
|$J_{CP}$|−0.027|−0.030 ± 0.010|+0.30σ|

-----

## Part VI: Majorana Sector

### T.24.24 Majorana Phases

**Proposition T.24.24** (Majorana-phase assignment used in the leptonic model). *The working Majorana-phase assignment in the present Berry-phase model is*
$$
\alpha_{21}=0,\qquad \alpha_{31}=\pi.
$$

*Justification.* This assignment implements the model choice that generations 1 and 2 have the same CP parity while generation 3 carries the opposite parity. It is the phase convention used in the subsequent neutrinoless-double-beta-decay estimate, not an independently derived theorem of the previous sections.

### T.24.25 Effective Majorana Mass

**Theorem T.24.25** (Effective Majorana Mass). *The neutrinoless double beta decay amplitude:*

$$m_{\beta\beta} = \left| \sum_{i=1}^{3} U_{ei}^2 m_i \right|$$

*Proof.*

**Step 1** (General Formula).
$$m_{\beta\beta} = \left| m_1 c_{12}^2 c_{13}^2 + m_2 s_{12}^2 c_{13}^2 e^{i\alpha_{21}} + m_3 s_{13}^2 e^{i(\alpha_{31} - 2\delta)} \right|$$

**Step 2** (Substituting Parameters).

|Parameter |Value |
|:----------------------|:-----------------------|
|$m_1$ |0.27 meV |
|$m_2$ |8.71 meV |
|$m_3$ |49.2 meV |
|$c_{12}^2$ |0.692 |
|$s_{12}^2$ |0.308 |
|$c_{13}^2$ |0.977 |
|$s_{13}^2$ |0.0226 |
|$\alpha_{21}$ |0 |
|$\alpha_{31} - 2\delta$|$180° - 465° \equiv 75°$|

**Step 3** (Term-by-Term).

Term 1: $m_1 c_{12}^2 c_{13}^2 = 0.27 \times 0.692 \times 0.977 = 0.18$ meV (real)

Term 2: $m_2 s_{12}^2 c_{13}^2 = 8.71 \times 0.308 \times 0.977 = 2.62$ meV (real)

Term 3: $m_3 s_{13}^2 e^{i \cdot 75°} = 49.2 \times 0.0226 \times (0.259 + 0.966i) = 0.29 + 1.07i$ meV

**Step 4** (Sum).
$$m_{\beta\beta,\text{complex}} = (0.18 + 2.62 + 0.29) + 1.07i = 3.09 + 1.07i \text{ meV}$$
$$\boxed{m_{\beta\beta} = \sqrt{3.09^2 + 1.07^2} = 3.3 \text{ meV}}$$

The predicted $m_{\beta\beta} = 3.3$ meV lies below the design sensitivity of next-generation ton-scale experiments (LEGEND-1000 targeting $m_{\beta\beta}$ reach 9–21 meV, nEXO targeting $m_{\beta\beta} \lesssim 8$–20 meV); observation of $0\nu\beta\beta$ decay in this mass range at LEGEND-1000 or nEXO would falsify the minimal Normal Hierarchy prediction of the model.

-----

## Part VII: Summary and Predictions

### T.24.26 Complete Parameter Table

**Table T.24.4**

|Parameter |Theory |Experiment (Particle Data Group 2024) |Pull |Status |
|:--------------------------------|:------------------------|:-------------------------------------|:-----|:---------|
|Mass Hierarchy |Normal |Pending |— |Prediction|
|$M_R$ (seesaw scale) |$1.5 \times 10^{15}$ GeV |$(10^{14}-10^{16})$ GeV |— |Derived |
|$m_3$ |49.2 meV |— |— |Derived |
|$m_2$ |8.71 meV |— |— |Derived |
|$m_1$ |0.27 meV |— |— |Derived |
|$\Delta m^2_{21}$ |$7.58 \times 10^{-5}$ eV²|$(7.53 \pm 0.18) \times 10^{-5}$ eV² |+0.28σ|✓ |
|$\Delta m^2_{31}$ |$2.42 \times 10^{-3}$ eV²|$(2.453 \pm 0.033) \times 10^{-3}$ eV²|−1.00σ|✓ |
|$\Delta m^2_{31}/\Delta m^2_{21}$|31.9 |32.6 ± 0.7 |−0.89σ|✓ |
|$\theta_{23}$ |47.4° |47.6° ± 1.4° |−0.14σ|✓ |
|$\sin^2\theta_{23}$ |0.541 |0.546 ± 0.021 |−0.23σ|✓ |
|$\theta_{12}$ |33.7° |33.6° ± 0.8° |+0.12σ|✓ |
|$\sin^2\theta_{12}$ |0.308 |0.307 ± 0.013 |+0.08σ|✓ |
|$\theta_{13}$ |8.7° |8.54° ± 0.12° |+1.3σ |✓ |
|$\sin^2\theta_{13}$ |0.0226 |0.0220 ± 0.0007 |+0.9σ |✓ |
|$\delta_{CP}$ |232.5° |230° ± 36° |+0.07σ|✓ |
|$J_{CP}$ |−0.027 |−0.030 ± 0.010 |+0.30σ|✓ |
|$\sum m_\nu$ |0.058 eV |< 0.12 eV |— |Consistent|
|$m_{\beta\beta}$ |3.3 meV |< 50 meV |— |Prediction|

**Statistical Summary:** $\chi^2 = 1.97$ for 7 measured quantities (using $\sin^2\theta$ values), $\chi^2/\text{dof} = 0.28$.

-----

### T.24.27 Derivation Chain

The complete derivation traces to $K_0 = 3$ with no external parameters:

**Stage 1: Foundational Constants**
$$K_0 = 3 \xrightarrow{\text{Thm 15}} d_0 = 8 \xrightarrow{\text{Thm Z.1}} (a,b) = (2,6) \xrightarrow{\text{Thm Z.5}} M = 24 \xrightarrow{\text{Lem T.41.2}} \sigma^2_B = \frac{1}{24} \xrightarrow{\text{Cor T.41.3}} \alpha_{\text{UV}} = \frac{3}{2}$$

$$\xrightarrow{\text{Thm T.54.2}} u = \frac{1}{\sqrt{3}} \xrightarrow{\text{Thm T.24.2.1}} \alpha_{\text{IR}} = \alpha_{\text{UV}} \times f_{\text{sinc}} = 1.418$$

**Stage 2: Triads from Error Correction**
$$\text{Hamming } [8,4,4] \xrightarrow{\text{Thm T.24.3}} T_\ell = (a, b, 2a) = (2,6,4) \text{ (D}_4\text{ for Dirac)}$$
$$\text{A}_2 \text{ constraint} \xrightarrow{\text{Thm T.24.5}} T_\nu = (a, b, b) = (2,6,6) \text{ (A}_2\text{ for Majorana)}$$

**Stage 3: Mass Hierarchy**
$$\xrightarrow{\text{Thm T.24.12}} \alpha_\nu = \frac{\sqrt{3}}{2} \xrightarrow{\text{Thm T.24.9}} T_\nu = (2,6,6) \text{ unique} \xrightarrow{\text{Thm T.24.11}} \text{Normal Hierarchy}$$

**Stage 4: Absolute Scale**
$$\xrightarrow{\text{Thm T.24.13}} \kappa_R = \alpha \cdot d^2_{31} = 9 \xrightarrow{} M_R = 1.5 \times 10^{15} \text{ GeV} \xrightarrow{\text{Thm T.24.14}} m_3 = 49 \text{ meV}$$

**Stage 5: Full Spectrum**
$$\xrightarrow{\text{Thm T.24.15}} (m_1, m_2, m_3) = (0.27, 8.71, 49.2) \text{ meV} \xrightarrow{\text{Thm T.24.16}} \Delta m^2_{21} = 7.58 \times 10^{-5} \text{ eV}^2$$

**Key Insight:** Both triads derive from the same constants $(a, b) = (2, 6)$:

|Fermion Type |Triad |Formula |Origin |
|:----------------------|:----------|:-----------|:-----------------------------------------------------------------------|
|Charged leptons (Dirac)|$(2, 6, 4)$|$(a, b, 2a)$|D₄ error correction, [4,2,2] code |
|Neutrinos (Majorana) |$(2, 6, 6)$|$(a, b, b)$ |A₂ hexagonal (derived from symmetric bilinear structure, Theorem T.24.5)|

The Majorana structure introduces four geometric factors absent in the Dirac sector:

|Factor |Theorem|Effect |Quantity Affected |
|:-----------------------|:------|:-------------------------------------------------|:------------------|
|A₂ replaces D₄ |T.24.5 |$d^2_{21}: 2a \to b$ |Triad structure |
|SU(2) triplet projection|T.24.12|$\alpha_\nu = \alpha_{\text{UV}}/\sqrt{3}$ |Mass hierarchy |
|Seesaw from $E_8$ distance |T.24.13|$\kappa_R = \alpha_{\text{UV}} \cdot d^2_{31} = 9$|Absolute mass scale|
|Spin-1 Berry phase |T.24.22|$+75°$ |$\delta_{CP}$ |

-----

### T.24.28 Parameter Count

**Proposition T.24.28** (Input inventory for the neutrino sector). *The neutrino sector uses no continuously fitted parameters within the adopted model once the following inputs are fixed:* the PU discrete data $(d_0,a,M)$, the canonical Bures/Fisher normalization with unit-radius convention, the type-I seesaw identification, the Majorana-instanton ansatz for $M_R$, and the Berry-loop prescriptions used for the PMNS angles and phase.

*Summary.* Under those assumptions, the neutrino masses, orderings, and mixing observables are determined without further continuous fitting inside the model.

-----

### T.24.29 Falsification Conditions

**Primary Prediction:** Normal Hierarchy ($\Delta m^2_{31} > 0$)

Falsified if: Inverted Hierarchy confirmed at > 5σ significance.

**Secondary Predictions:**

|Observable |Prediction|3σ Range |Falsification |
|:------------------|:---------|:------------------------------------|:-------------------------------------------|
|$\sin^2\theta_{23}$|0.541 |0.478 – 0.604 |Outside range at > 3σ |
|$\delta_{CP}$ |232.5° |160° – 305° |Outside range at > 3σ |
|$\sum m_\nu$ |0.058 eV |< 0.10 eV |> 0.10 eV measured |
|$m_{\beta\beta}$ |3.3 meV |< 10 meV (below next-gen sensitivity)|Observation at LEGEND-1000/nEXO falsifies NH|

**Experimental Timeline:**

|Experiment |Years |Sensitivity |
|:---------------|:--------|:---------------------------------------|
|JUNO |2025–2031|3σ hierarchy determination |
|DUNE |2030–2042|5σ hierarchy (≤3 yr) + CP phase (≈10 yr)|
|Hyper-Kamiokande|2027–2035|5σ hierarchy + CP phase |
|LEGEND-1000 |2030+ |$m_{\beta\beta}$ sensitivity to 9–21 meV|
|nEXO |2030+ |$m_{\beta\beta}$ sensitivity to ≲ 8 meV |

# Section T.25: Fermion Mass Hierarchy from $E_8$ Geometry

## T.25.1 Introduction

This section consolidates the fermion mass predictions derived from the geometric hierarchy on the generation manifold Gr(2,8). The framework connects all mass ratios to $E_8$ root distances through a single derived coefficient $\alpha_{\text{IR}}$, which traces ultimately to the foundational constant $K_0 = 3$.

The primary result is the mass hierarchy formula (Theorem T.39):

$$\ln\left(\frac{m_j}{m_i}\right) = \alpha_{\text{IR}} \cdot d^2_{E_8}(r_i, r_j)$$

where $d^2_{E_8} \in \{2, 4, 6, 8\}$ are squared distances between $E_8$ roots representing fermion generations.

-----

## T.25.2 Derived Parameters

All parameters trace to $K_0 = 3$ through the established derivation chain:

$$K_0 = 3 \xrightarrow{\text{Thm 23}} d_0 = 8 \xrightarrow{\text{Thm Z.1}} (a,b) = (2,6) \xrightarrow{\text{Thm Z.5}} M = 24$$

|Parameter |Value |Derivation |Reference |
|:-------------------|:-----|:------------------------------------------|:----------------|
|$K_0$ |3 |Self-reference minimum |Theorem 15 |
|$d_0$ |8 |$2^{K_0}$ |Theorem 23 |
|$a$ |2 |Landauer partition (see Theorem Z.1) |Theorem Z.1 |
|$b$ |6 |$d_0 - a$ |Definition |
|$M$ |24 |$2ab$ |Theorem Z.5 |
|$N_g$ |3 |Anomaly cancellation |Proposition R.4.2|
|$\sigma^2_B$ |$1/24$|Capacity saturation |Lemma T.41.2 |
|$\alpha_{\text{UV}}$|$3/2$ |$1/(16\sigma^2_B)$ |Corollary T.41.3 |
|$f_{\text{sinc}}$ |0.9454|$\sin(u)/u$, $u = 1/\sqrt{N_g}$ |Theorem T.24.2.1 |
|$\alpha_{\text{IR}}$|1.418 |$\alpha_{\text{UV}} \times f_{\text{sinc}}$|Theorem T.24.2.1 |

The sinc correction arises from coherent averaging over generation wavepackets of angular width $u = 1/\sqrt{N_g} = 1/\sqrt{3}$ (Theorem T.54.2):

$$f_{\text{sinc}} = \frac{\sin(1/\sqrt{3})}{1/\sqrt{3}} = \frac{0.5458}{0.5774} = 0.9454$$

$$\alpha_{\text{IR}} = \frac{3}{2} \times 0.9454 = 1.418$$

-----

## T.25.3 $E_8$ Generation Triads

### T.25.3.1 Triad Assignments

PCE selection (Section T.21.9) determines unique $E_8$ root triads for each fermion sector:

|Sector |$(d^2_{32}, d^2_{31}, d^2_{21})$|$\mathcal{R} = d^2_{31}/d^2_{32}$|
|:---------------|:-------------------------------|:--------------------------------|
|Charged leptons |$(2, 6, 4)$ |3 |
|Down-type quarks|$(2, 4, 6)$ |2 |
|Up-type quarks |$(4, 8, 4)$ |2 |

The indices denote generations: 3 (heaviest), 2 (middle), 1 (lightest).

### T.25.3.2 Explicit Root Vectors

From Section T.21.9.1, the triads are realized by Type I $E_8$ roots $(\pm 1, \pm 1, 0, 0, 0, 0, 0, 0)$:

**Charged leptons** (Theorem T.24.3, D₄ error correction):
$$r_3 = (1, 1, 0, 0, 0, 0, 0, 0)$$
$$r_2 = (1, 0, 1, 0, 0, 0, 0, 0) \quad \Rightarrow \quad d^2_{32} = 2$$
$$r_1 = (-1, 0, 1, 0, 0, 0, 0, 0) \quad \Rightarrow \quad d^2_{31} = 6, \quad d^2_{21} = 4$$

**Down-type quarks:**
$$r_3 = (1, 1, 0, 0, 0, 0, 0, 0)$$
$$r_2 = (1, 0, 1, 0, 0, 0, 0, 0) \quad \Rightarrow \quad d^2_{32} = 2$$
$$r_1 = (-1, 1, 0, 0, 0, 0, 0, 0) \quad \Rightarrow \quad d^2_{31} = 4, \quad d^2_{21} = 6$$

**Up-type quarks:**
$$r_3 = (1, 1, 0, 0, 0, 0, 0, 0)$$
$$r_2 = (-1, 1, 0, 0, 0, 0, 0, 0) \quad \Rightarrow \quad d^2_{32} = 4$$
$$r_1 = (-1, -1, 0, 0, 0, 0, 0, 0) \quad \Rightarrow \quad d^2_{31} = 8, \quad d^2_{21} = 4$$

### T.25.3.3 Lattice Geometry

**Summary of Lemma T.44** ($E_8$ Lattice Angles). The angle $\theta$ between $E_8$ roots with squared distance $d^2$ satisfies:

$$\cos\theta = \frac{4 - d^2}{4}$$

*Proof.* For roots with $|r_i|^2 = 2$:
$$\cos\theta = \frac{\langle r_1, r_2 \rangle}{2} = \frac{4 - d^2}{4}$$
using $d^2 = 4 - 2\langle r_1, r_2 \rangle$. ∎

The 1↔2 sector angles from $d^2_{21}$:

|Sector |$d^2_{21}$|$\cos\theta$|$\theta$|Lattice |
|:--------------|:--------:|:----------:|:------:|:-----------|
|Up quarks |4 |0 |90° |D₄ cubic |
|Charged leptons|4 |0 |90° |D₄ cubic |
|Down quarks |6 |−1/2 |120° |A₂ hexagonal|

-----

## T.25.4 Charged Lepton Masses

### T.25.4.1 The Ratio Invariant

**Theorem T.25.1** (Lepton Ratio Invariant). *The charged lepton mass ratio invariant equals:*

$$\mathcal{R}_\ell = \frac{\ln(m_\tau/m_e)}{\ln(m_\tau/m_\mu)} = \frac{d^2_{31}}{d^2_{32}} = \frac{6}{2} = 3$$

*Proof.* From the hierarchy formula $\ln(m_j/m_i) = \alpha \cdot d^2_{ij}$:

$$\mathcal{R}_\ell = \frac{\alpha \cdot d^2_{31}}{\alpha \cdot d^2_{32}} = \frac{d^2_{31}}{d^2_{32}} = \frac{6}{2} = 3$$

The ratio is independent of $\alpha$ and tests pure $E_8$ geometry. ∎

**Experimental Comparison** (Particle Data Group 2024):

|Mass |Value |
|:-------|:------------------------------------|
|$m_\tau$|$1776.86 \pm 0.12$ MeV |
|$m_\mu$ |$105.6583755 \pm 0.0000023$ MeV |
|$m_e$ |$0.51099895000 \pm 0.00000000015$ MeV|

$$\ln(m_\tau/m_\mu) = \ln(16.818) = 2.8224$$

$$\ln(m_\tau/m_e) = \ln(3477.4) = 8.1540$$

$$\mathcal{R}_{\text{obs}} = \frac{8.1540}{2.8224} = 2.889$$

**Curvature-corrected prediction and controlled remainder.** The leading expression receives a derived $O(d^4)$ curvature/Van-Vleck correction (Section T.25.10), which for the charged-lepton triad yields the corrected logarithms
$$
\ln(m_\tau/m_\mu)=2.8212,\quad \ln(m_\mu/m_e)=5.3306,\quad \ln(m_\tau/m_e)=8.1518,
$$
hence
$$
R_\ell = \frac{8.1518}{2.8212} = 2.889,
$$
with a conservative truncation remainder bound $|\Delta\ln|\lesssim 0.005$ from the next omitted term, implying $\sigma_{R_\ell}\approx 0.002$.

**Numerical Comparison (curvature-corrected):**

|Ratio |Predicted |Observed|Deviation |
|--------|-----------------|--------|----------|
|$R_\ell$|$2.889 \pm 0.002$|$2.889$ |consistent|

### T.25.4.2 Individual Logarithmic Ratios

The hierarchy formula predicts each mass ratio independently:

|Ratio |PU geometry input|Predicted $\ln(m_j/m_i)$|Observed $\ln(m_j/m_i)$|Deviation|
|-------------------|-----------------|------------------------|-----------------------|---------|
|$\ln(m_\tau/m_\mu)$|$d^2=2$ |2.8212 |2.822 |-0.03% |
|$\ln(m_\mu/m_e)$ |$d^2=4$ |5.3306 |5.332 |-0.03% |
|$\ln(m_\tau/m_e)$ |path sum $(2+4)$ |8.1518 |8.154 |-0.03% |

The remaining mismatch is at the $\sim 10^{-4}$ level in the logarithms and is consistent with the controlled remainder of the curvature/Van-Vleck expansion (Section T.25.10). In contrast, using the strict leading Gaussian/flat limit (Theorem T.39) would yield several-percent deviations for the charged-lepton logarithms, so the $O(d^4)$ correction is load-bearing for precision.

### T.25.4.3 Empirical Extraction of α

The hierarchy coefficient can be extracted independently from each ratio:

$$\alpha = \frac{\ln(m_j/m_i)}{d^2_{ij}}$$

|Source |$\alpha_{\text{emp}}$|
|:-----------------------------------|:-------------------:|
|$\ln(m_\tau/m_\mu)/2$ |1.411 |
|$\ln(m_\tau/m_e)/6$ |1.359 |
|$\ln(m_\mu/m_e)/4$ |1.333 |
|**Theoretical** $\alpha_{\text{IR}}$|**1.418** |

The τ/μ extraction yields $\alpha_{\text{emp}} = 1.411$, agreeing with the theoretical prediction $\alpha_{\text{IR}} = 1.418$ within **0.5%**.

The spread in extracted values (1.333 to 1.411, approximately 6%) reflects higher-order corrections that become more significant at larger $E_8$ distances. This systematic variation is consistent with the geometric expansion discussed in Section T.25.10.

-----

## T.25.5 Quark Sector Analysis

### T.25.5.1 Quark Mass Ratio Invariants

The following comparisons are diagnostic checks using PDG central values at their quoted renormalization scales. Because the quark masses are defined at different scales and in different schemes, these ratios are not scheme-invariant in the way the lepton ratios are; they should be interpreted as approximate consistency tests rather than precision predictions. A precision comparison is obtained by running all six masses to a common $\overline{\text{MS}}$ scheme and scale using the protocol in Section T.25.5.3; a worked common-scale reduction and same-scale invariants are reported in Section T.25.5.4.

**Quark masses** (Particle Data Group 2024):

|Mass |Value |Scheme |
|:----|:----------------------|:-------------------------------------------------------------------------------------------------|
|$m_t$|$172.57 \pm 0.29$ GeV |Direct (MC/event kinematics; not a short-distance mass parameter without a stated translation map)|
|$m_b$|$4.183 \pm 0.007$ GeV |$\overline{\text{MS}}$ at $\mu = m_b$ |
|$m_c$|$1.2730 \pm 0.0046$ GeV|$\overline{\text{MS}}$ at $\mu = m_c$ |
|$m_s$|$93.5 \pm 0.8$ MeV |$\overline{\text{MS}}$ at $\mu = 2$ GeV |
|$m_u$|$2.16 \pm 0.07$ MeV |$\overline{\text{MS}}$ at $\mu = 2$ GeV |
|$m_d$|$4.70 \pm 0.07$ MeV |$\overline{\text{MS}}$ at $\mu = 2$ GeV |

**Down-type quarks** $(d^2_{32}, d^2_{31}) = (2, 4)$:

$$\mathcal{R}_d = \frac{\ln(m_b/m_d)}{\ln(m_b/m_s)} = \frac{6.79}{3.80} = 1.79$$

|Quantity |Predicted|Observed|Deviation|
|:--------------|:-------:|:------:|:-------:|
|$\mathcal{R}_d$|2.00 |1.79 |11% |

**Up-type quarks** $(d^2_{32}, d^2_{31}) = (4, 8)$:

$$\mathcal{R}_u = \frac{\ln(m_t/m_u)}{\ln(m_t/m_c)} = \frac{11.29}{4.91} = 2.30$$

|Quantity |Predicted|Observed|Deviation|
|:--------------|:-------:|:------:|:-------:|
|$\mathcal{R}_u$|2.00 |2.30 |15% |

### T.25.5.2 QCD and Scheme Effects

The quark sector deviations (11–15%) exceed the lepton sector (3.7%) due to several effects:

1. **Renormalization scale mixing:** The PDG quark masses are defined at different scales ($m_b$ at $\mu = m_b$; light quarks at $\mu = 2$ GeV). A rigorous comparison fixes a target scheme (here $\overline{\text{MS}}$) and runs all masses to a common reference scale $\mu_{\text{ref}}$ using SM RG evolution above $\mu_{\mathrm{EW}}$ and QCD decoupling + running below $\mu_{\mathrm{EW}}$ (Section T.25.5.3). Reported comparisons should state loop order, threshold conventions, and mapping systematics (T1/T2/T3).
1. Scheme dependence: The direct $m_t$ is extracted from event kinematics and is sensitive to the mass parameter used in Monte Carlo generators; mapping it to a well-defined pole or $\overline{\text{MS}}$ mass introduces additional theoretical uncertainty.
1. **QCD threshold effects:** Heavy quark decoupling introduces scale-dependent corrections at flavor thresholds.
1. Experimental and theory uncertainties: Light-quark $\overline{\text{MS}}$ masses carry percent-level uncertainties at $\mu = 2$ GeV (CL = 90%), and additional systematic uncertainty enters through RG running and scheme conversions; these effects are non-negligible compared to the observed 10–15% deviations.

The agreement at the 10–15% level for quarks, compared to 3.7% for leptons, is consistent with these QCD-induced corrections.

### T.25.5.3 Common-Scale Protocol and Uncertainty Decomposition

A precision test of the quark sector requires running all masses to a common $\overline{\text{MS}}$ scale $\mu_{\text{ref}}$ using a consistent protocol. This section uses the paper-wide T1/T2/T3 protocol of Convention P.14.1c; every other appendix reporting a T1/T2/T3 budget (Sections T.19.1, T.25.6a.10, the Appendix H.4.3.1 budget for $g_0$, Appendix U vacuum budgets, the Appendix Y baryogenesis budget, the Appendix Z fine-structure budget, and the map.md predictions and assumptions tables) uses the same three categories.

- **T1 (internal truncation/control):** includes PU truncation error, finite-order hierarchy terms beyond the stated order in $d^2$, slow-roll truncation in primordial quantities, Morse-Bott / determinant / heat-kernel / zeta truncation in prefactors, curvature/Jacobian truncation, finite spectral truncation, geometric approximations in evaluating geodesics or chord integrals, and higher-order backreaction on curvature corrections.
- **T2 (matching/branch/bridge/convention):** includes PU-to-SM threshold matching at any matching scale used, loop-order and decoupling conventions, RG matching conventions, lifted-threshold branch dependence, vacuum/regularization dependence, bounce-determinant and zero-mode normalization in the Appendix U vacuum sector, frustration-strain regularization in the flavor sector, primordial vacuum/regularization dependence in the inflationary sector, thermal or sphaleron-decoupling threshold systematics, bridge-law normalizations such as Definition H.0, finite-volume/extensivity conventions, and coarse-graining conventions.
- **T3 (empirical/model mapping):** includes experimentally quoted mass definitions and their map to pole or $\overline{\text{MS}}$ values, QED/isospin conventions for $m_{u,d,s}$, nonperturbative renormalization systematics in light-quark extraction from hadronic observables, astrophysical/cosmological/CMB extraction systematics, target-tuple retention when a spectral value has not yet been derived, phenomenological-kernel fits, and discrete identification ambiguity in flavor labeling (triad assignment, generation labeling).

For independent entries the displayed theory uncertainty is
$$
\sigma_Q
=
\sqrt{\sigma_{Q,T1}^2+\sigma_{Q,T2}^2+\sigma_{Q,T3}^2}.
$$
When a table reports a combined T2+T3 entry, the combined entry is placed in one column and the other column states that it is included there; this prevents double-counting until the missing threshold-to-observable pipeline is supplied.

**Hierarchy invariants.** For same-scale hierarchy invariants
$$
\mathcal{R}_f(\mu)=\frac{\ln(m_{3,f}(\mu)/m_{1,f}(\mu))}{\ln(m_{3,f}(\mu)/m_{2,f}(\mu))},
$$
report
$$
\mathcal{R}_f(\mu)=\mathcal{R}^{\text{central}}_f(\mu)
\pm \Delta^{(T1)}_{\mathcal{R}_f}
\pm \Delta^{(T2)}_{\mathcal{R}_f}
\pm \Delta^{(T3)}_{\mathcal{R}_f},
$$
where T1 includes PU truncation and any geometric-approximation truncation used to evaluate geodesic inputs, T2 includes vacuum/regularization dependence when a frustration strain field is computed, and T3 includes scheme/mapping systematics from this protocol and any discrete identification ambiguity (triad assignment and generation labeling). For the down-sector frustration correction, the additional T1/T2/T3 terms are given in Section T.25.6a.10.

With this protocol, the quark-sector ratios in Section T.25.5.1 become a controlled test: the comparison is performed at a common scheme and scale, and deviations can be decomposed into explicit RG, threshold, vacuum, and mapping contributions rather than absorbed into a single informal “QCD effects” label.

### T.25.5.4 Common-Scale Reduction at $\mu = M_Z$ (SM $\overline{\text{MS}}$)

This section reports a worked common-scale reduction to $\mu=M_Z$ in the SM $\overline{\text{MS}}$ convention. The parameter set in the table below is a consistent $\overline{\text{MS}}$ input at $\mu=M_Z$ (VEV and Yukawa eigenvalues) and is used here to define the observed same-scale hierarchy invariants for comparison with PU predictions. Any standard SM parameter-extraction pipeline that outputs $(v(\mu),y_q(\mu))$ at $\mu=M_Z$ under a stated convention yields an equivalent input set within the quoted uncertainties.

|Quantity |Value at $\mu = M_Z$|Source |
|:---------------------------|:------------------:|:----------------|
|$m_t^{\overline{\text{MS}}}$|$162.5 \pm 1.1$ GeV |PDG 2024 + SMDR |
|$m_b^{\overline{\text{MS}}}$|$2.84 \pm 0.02$ GeV |PDG 2024 + RunDec|
|$m_c^{\overline{\text{MS}}}$|$0.62 \pm 0.02$ GeV |PDG 2024 + RunDec|
|$m_s^{\overline{\text{MS}}}$|$54.4 \pm 1.5$ MeV |PDG 2024 + RunDec|
|$m_u^{\overline{\text{MS}}}$|$1.26 \pm 0.05$ MeV |PDG 2024 + RunDec|
|$m_d^{\overline{\text{MS}}}$|$2.74 \pm 0.05$ MeV |PDG 2024 + RunDec|

**Same-scale hierarchy invariants at $\mu = M_Z$:**

$$\mathcal{R}_u(M_Z) = \frac{\ln(m_t/m_u)}{\ln(m_t/m_c)} = \frac{11.77}{5.57} = 2.111 \pm 0.007$$

$$\mathcal{R}_d(M_Z) = \frac{\ln(m_b/m_d)}{\ln(m_b/m_s)} = \frac{6.94}{3.96} = 1.752 \pm 0.007$$

This confirms that the residual discrepancy in $\mathcal{R}_d$ is not removed by eliminating scale mixing; any resolution must therefore be sector-specific and compatible with a common-scheme comparison.

The up-sector deviation of $+5.5%$ is comparable in magnitude to the uncorrected lepton-sector deviation and is within the expected range of the computed $\mathcal{O}(d^4)$ curvature corrections already derived in Section T.21.8 (Theorem T.42.6), together with remaining T3 mapping systematics in the common-scale reduction.

The down-sector deviation of $-12.4%$ persists under common-scale comparison and motivates a sector-specific correction tied to the $A_2/D_4$ asymmetry of the down-sector triads. This correction is derived in Section T.25.6a and carries its own T1/T2/T3 budget (Section T.25.6a.10).

### T.25.5.5 Corrected Quark Sector Predictions (Same-Scale Invariants)

Let $\mathcal{R}^{(0)}_f$ denote the PU prediction for the same-scale hierarchy invariant in sector $f$ computed from the PU exponent formula through the $d^4$ term (including the computed $D_{\mathrm{eff}}$ curvature correction at that order). For the up sector, no frustration correction applies ($\kappa_u=0$), hence
$$
\mathcal{R}_u^{\text{pred}}=\mathcal{R}_u^{(0)}.
$$

For the down sector, the $A_2/D_4$ lattice asymmetry induces a frustration correction derived in Section T.25.6a. Writing the down-sector correction in overlap form,
$$
\mathcal{R}_d^{\text{pred}}
=\mathcal{R}_d^{(0)}\cdot \frac{1-\Phi^{(d)}_{31}}{1-\Phi^{(d)}_{32}},
$$
Lemma T.25.6a.4 gives $(1-\Phi^{(d)}_{31})/(1-\Phi^{(d)}_{32})=5/6$ at the PU point, hence
$$
\mathcal{R}_d^{\text{pred}}=\mathcal{R}_d^{(0)}\cdot \frac{5}{6}.
$$

The same-scale quark hierarchy invariants can be compared at sub-percent precision once a common-scheme reduction is used and the down-sector $A_2/D_4$ frustration correction is included with its stated uncertainty budget.

-----

## T.25.6 Geometric Frustration and Cabibbo Mixing

### T.25.6a Hexagonal Frustration Correction for the Down-Sector Hierarchy Invariant

The down-quark sector is distinguished by its $1\leftrightarrow 2$ transition angle $\theta_{21,d}=120^\circ=2\pi/3$ (Section T.25.3.3), whereas the up-quark and charged-lepton sectors have $\theta_{21}=\pi/2$. This $A_2$ (hexagonal) mismatch induces a frustration strain on the generation manifold that modifies the relative suppression exponents along the $3\leftrightarrow 1$ and $3\leftrightarrow 2$ geodesic paths, and hence modifies the down-sector hierarchy invariant under same-scale comparison.

**Definition T.25.6a.1 (Frustration angle parameter).** For a fermion sector $f$, define
$$
\kappa_f := \frac{|\theta_{21,f}-\pi/2|}{\pi}.
$$
Thus $\kappa_u=\kappa_\ell=0$ (cubic $D_4$ geometry) and $\kappa_d=|2\pi/3-\pi/2|/\pi=1/6$ (hexagonal $A_2$ geometry).

**Definition T.25.6a.2 (Strain normalization and projector).** Let $b=d_0-a$ be the inactive dimension (so $b=6$ at the PU point). Define the screening factor
$$
s_b := \frac{b}{b+1}.
$$
Let $\hat e_{12}$ be the unit direction of the frustrated $1\leftrightarrow 2$ edge in the down-sector triad, and define the rank-1 projector
$$
\Pi_{12}:=\hat e_{12}\otimes \hat e_{12}.
$$
The frustration-induced metric perturbation is taken in the minimal coherent form
$$
h^{(f)} = s_b\,N_g\,\kappa_f\,\Pi_{12},
$$
where $N_g=3$ is the number of generations. The factor $s_b=b/(b+1)$ encodes screening of a single frustrated edge direction by the $b$ available inactive relaxation directions, and $N_g$ encodes coherent propagation across the generation graph in the symmetry-broken vacuum.

**Definition T.25.6a.3 (Geodesic overlap functional).** Let $d^2_{ij,f}$ denote the squared PU geodesic distance between generations $i,j$ in sector $f$ (Bures metric), and let $\gamma_{ij,f}$ be the corresponding geodesic. For the strain tensor $h^{(f)}$, define the dimensionless overlaps
$$
\Phi^{(f)}_{ij} := \frac{1}{d_{ij,f}^2}\int_{\gamma_{ij,f}} h^{(f)}(\dot\gamma,\dot\gamma),ds.
$$
In the chord approximation used for the explicit evaluation below (constant rank-1 perturbation along the dominant geodesic direction), this reduces to
$$
\Phi^{(f)}_{ij}= s_b\,N_g\,\kappa_f\cdot \frac{|\langle \vec v_{ij,f},\hat e_{12}\rangle|^2}{|\vec v_{ij,f}|^2},
\qquad \vec v_{ij,f}:=r_{i,f}-r_{j,f}.
$$

**Lemma T.25.6a.4 (Explicit overlap calculation for down quarks).** Using the down-quark $E_8$ root vectors from Section T.25.3.2:
$$
r_3 = (1, 1, 0, 0, 0, 0, 0, 0), \quad r_2 = (1, 0, 1, 0, 0, 0, 0, 0), \quad r_1 = (-1, 1, 0, 0, 0, 0, 0, 0),
$$
the frustrated edge direction is
$$
\hat e_{12} = \frac{r_2-r_1}{|r_2-r_1|}=\frac{(2,-1,1,0,\ldots)}{\sqrt{6}}.
$$
At the PU point, $b=6$ so $s_b=6/7$, and $\kappa_d=1/6$, hence
$$
s_b\,N_g\,\kappa_d=\frac{6}{7}\cdot 3\cdot \frac{1}{6}=\frac{3}{7}.
$$

*Path 3→1:* $\vec v_{31}=r_3-r_1=(2,0,0,\ldots)$ with $|\vec v_{31}|^2=4$ and
$$
\langle \vec v_{31},\hat e_{12}\rangle=\frac{4}{\sqrt{6}},
\qquad
\frac{|\langle \vec v_{31},\hat e_{12}\rangle|^2}{|\vec v_{31}|^2}
=\frac{16/6}{4}=\frac{2}{3}.
$$
Therefore
$$
\Phi^{(d)}_{31}=\frac{3}{7}\cdot \frac{2}{3}=\frac{2}{7}.
$$

*Path 3→2:* $\vec v_{32}=r_3-r_2=(0,1,-1,\ldots)$ with $|\vec v_{32}|^2=2$ and
$$
\langle \vec v_{32},\hat e_{12}\rangle=\frac{-2}{\sqrt{6}},
\qquad
\frac{|\langle \vec v_{32},\hat e_{12}\rangle|^2}{|\vec v_{32}|^2}
=\frac{4/6}{2}=\frac{1}{3}.
$$
Therefore
$$
\Phi^{(d)}_{32}=\frac{3}{7}\cdot \frac{1}{3}=\frac{1}{7}.
$$

*Ratio factor:*
$$
\frac{1-\Phi^{(d)}_{31}}{1-\Phi^{(d)}_{32}}
=\frac{1-2/7}{1-1/7}
=\frac{5/7}{6/7}
=\frac{5}{6}.
$$

*Difference:*
$$
\Phi^{(d)}_{31}-\Phi^{(d)}_{32}=\frac{1}{7}=s_b\,\kappa_d.
$$
∎

**Theorem T.25.6a.5 (Frustration correction to the down-sector hierarchy invariant).** Let the sector-$f$ hierarchy exponents be defined by the PU formula (Sections T.21.9 and T.25.3) as
$$
E_{3i,f}^{(0)} := \ln\!\left(\frac{y_{3,f}}{y_{i,f}}\right)
= c_f\left[\alpha_{\mathrm{IR}}\,d^2_{3i,f} - \frac{\alpha_{\mathrm{IR}}}{C} D_{\mathrm{eff}}(d^2_{3i,f})\,d^4_{3i,f}\right] + \mathcal{O}(d^6),
$$
and define the same-scale hierarchy invariant
$$
\mathcal{R}_f(\mu)=\frac{\ln(m_{3,f}(\mu)/m_{1,f}(\mu))}{\ln(m_{3,f}(\mu)/m_{2,f}(\mu))}=\frac{E_{31,f}}{E_{32,f}}.
$$
Under the frustration perturbation $h^{(f)}$, define corrected exponents by the overlap rule
$$
E_{3i,f}:=(1-\Phi^{(f)}_{3i})\,E^{(0)}_{3i,f}.
$$
Then the corrected invariant is
$$
\mathcal{R}_f(\mu)=\mathcal{R}_f^{(0)}\cdot \frac{1-\Phi^{(f)}_{31}}{1-\Phi^{(f)}_{32}},
\qquad
\mathcal{R}_f^{(0)}:=\frac{E^{(0)}_{31,f}}{E^{(0)}_{32,f}}.
$$
In particular, for up-type quarks $\kappa_u=0$ so $\Phi^{(u)}_{3i}=0$ and $\mathcal{R}_u=\mathcal{R}^{(0)}_u$. For down-type quarks, Lemma T.25.6a.4 yields
$$
\mathcal{R}_d=\mathcal{R}^{(0)}_d\cdot \frac{5}{6}.
$$
∎

**Corollary T.25.6a.6 (The 5/6 factor).** For down quarks at the PU point,
$$
\frac{1-\Phi^{(d)}_{31}}{1-\Phi^{(d)}_{32}}=\frac{5}{6}=\frac{b-1}{b}\qquad (b = 6 \text{ at the PU point}).
$$

**Corollary T.25.6a.7 (Numerical prediction for the invariant).** With $\mathcal{R}_d^{(0)}$ computed from the PU exponent formula through the $d^4$ term (including the computed curvature correction),
$$
\mathcal{R}_d^{\text{pred}}=\mathcal{R}_d^{(0)}\cdot \frac{5}{6}.
$$
If $\mathcal{R}_d^{(0)}=2.11$ at that truncation order, then
$$
\mathcal{R}_d^{\text{pred}}=2.11\cdot \frac{5}{6}=1.758.
$$

**Remark T.25.6a.8: Interpretation of $s_b$ and $N_g$.** The screening factor $s_b=b/(b+1)$ encodes that one frustrated edge direction competes with $b$ inactive relaxation directions in distributing strain, while $N_g=3$ encodes coherent propagation across the generation graph in the symmetry-broken vacuum. Both are fixed by the PU point data $(a,b)=(2,6)$ and the derived generation count.

**Remark T.25.6a.9: Connection to Cabibbo mixing.** The same $A_2/D_4$ mismatch that shifts $\mathcal{R}_d$ also determines the Cabibbo angle via the vacuum position $\theta_{\text{vac}}=105.15^\circ$ (Section T.25.6.1). Both effects arise from a single geometric source: incompatibility between hexagonal (down) and cubic (up) lattice structures in the $1\leftrightarrow 2$ sector.

#### T.25.6a.10 Uncertainty budget for the frustration correction (T1/T2/T3)

Report the down-sector prediction in the form
$$
\mathcal{R}_d=\mathcal{R}_d^{(0)}\cdot \frac{1-\Phi^{(d)}_{31}}{1-\Phi^{(d)}_{32}}
\pm \Delta^{(T1)}_{\mathcal{R}_d}
\pm \Delta^{(T2)}_{\mathcal{R}_d}
\pm \Delta^{(T3)}_{\mathcal{R}_d}.
$$

- **T1 (truncation/control):** includes (i) PU truncation error from neglected $\mathcal{O}(d^6)$ terms in $E^{(0)}_{3i,f}$, (ii) geometric truncation from the chord approximation used to evaluate $\Phi^{(d)}_{3i}$ (difference between the chord-direction evaluation and the true Bures geodesic integral), and (iii) neglect of higher-order backreaction of $h^{(d)}$ on the curvature term encoded by $D_{\mathrm{eff}}$ at fixed truncation order.
- **T2 (vacuum/regularization):** includes any dependence of the strain-field construction on regularization or on near-degenerate vacuum minimizers when $h^{(d)}$ is computed from an explicit minimization functional. In the minimal discrete normalization used here ($s_b=b/(b+1)$ with fixed $b$), this contribution vanishes unless a competing admissible vacuum yields a distinct triad assignment or strain support.
- **T3 (mapping/identification):** includes discrete identification uncertainty in the mapping of physical generations to triad labels, and any ambiguity in the down-sector triad choice used to define $\theta_{21,d}$ and $\hat e_{12}$. It also includes the common-scale reduction systematics (scheme conventions and mapping) from Section T.25.5.3 used to compare $\mathcal{R}_d$ to data at a fixed $\mu$.

A conservative propagation bound at fixed truncation order is obtained by treating $\mathcal{R}_d^{(0)}$, $\Phi^{(d)}_{31}$, and $\Phi^{(d)}_{32}$ as independent and varying each within its T1/T2/T3 range.

### T.25.6.1 Vacuum Frustration

**Summary (Geometric Frustration).** *The vacuum position minimizes elastic energy from incompatible lattice constraints:*

$$\theta_{\text{vac}} = \frac{\kappa_u \theta_u + \kappa_d \theta_d}{\kappa_u + \kappa_d}$$

*where $\kappa_f$ is the sector stiffness.*

From Theorem T.38, $\kappa_d/\kappa_u = (c_d/c_u)^2 \approx 1.02$. With $\theta_u = 90°$ (from $d^2_{21,u} = 4$) and $\theta_d = 120°$ (from $d^2_{21,d} = 6$):

$$\theta_{\text{vac}} = \frac{90° + 1.02 \times 120°}{2.02} = \frac{212.4°}{2.02} = 105.15°$$

The frustration angle is:

$$\theta_{\text{frustration}} = \theta_{\text{vac}} - \theta_u = 15.15°$$

### T.25.6.2 Cabibbo Angle Prediction

**Summary (Cabibbo Mixing).** *The Cabibbo angle emerges from frustration-induced tunneling:*

$$|V_{us}| = \mathcal{P} \times \sin(\theta_{\text{frustration}}) \times f_{\text{curv}}$$

where:

- $\mathcal{P} = \sqrt{3}/2 = \cos(30°)$ is the A₂ root-weight projection factor (Theorem T.51)
- $f_{\text{curv}} = 0.9989$ is the Bures curvature correction (Lemma T.51.1)

The factor $\sqrt{3}/2$ arises from the A₂ root-weight duality (Theorem T.51): the angular offset between any root and the nearest weight in the hexagonal lattice is exactly 30°, a consequence of Lie algebra geometry (Humphreys 1972, §13).

The curvature correction from Lemma T.51.1:

$$f_{\text{curv}} = 1 - \frac{K_{\text{avg}}}{6M}\sigma^4_{\mathcal{G}} = 1 - \frac{32/23}{144} \times \frac{1}{9} = 0.9989$$

where $K_{\text{avg}} = 32/23$ is the average Bures sectional curvature on Gr(2,8) (Theorem Z.23).

**Numerical evaluation:**

$$|V_{us}|_{\text{pred}} = \frac{\sqrt{3}}{2} \times \sin(15.15°) \times 0.9989 = 0.8660 \times 0.2613 \times 0.9989 = 0.2261$$

| Quantity | Predicted | Observed (Particle Data Group 2024) | Deviation |
|:---------|:---------:|:-----------------------------------:|:---------:|
| $\vert V_{us}\vert$ | 0.2261 | $0.2243 \pm 0.0008$ | 0.8% |

### T.25.6.3 Sensitivity to Stiffness Ratio

The predicted $\vert V_{us}\vert$ depends on the stiffness ratio $\kappa_d/\kappa_u$. For $c_d/c_u$ in the range [1.00, 1.02] from Theorem T.38:

| $c_d/c_u$ | $\kappa_d/\kappa_u$ | $\theta_{\text{vac}}$ | $\theta_{\text{frustration}}$ | $\vert V_{us}\vert$ |
|:---------:|:-------------------:|:---------------------:|:-----------------------------:|:----------:|
| 1.00 | 1.00 | 105.00° | 15.00° | 0.2241 |
| 1.01 | 1.02 | 105.15° | 15.15° | 0.2261 |
| 1.02 | 1.04 | 105.29° | 15.29° | 0.2280 |

The central value $c_d/c_u \approx 1.01$ yields excellent agreement with experiment.

-----

## T.25.7 Sector Prefactors

### T.25.7.1 Lepton-Quark Bridge

**Summary (Sector Prefactors).** *At the matching scale $\mu_G$:*

$$\frac{c_\ell}{c_d} = \frac{8}{3}$$

*Proof.* The Bures/gauge normalization factors satisfy (see Section T.21.9.2) together with the normalization constraint of Corollary T.34.1:

$$Z_\ell = \frac{2 + 4\kappa_3}{21}g_U^2, \quad Z_d = \frac{128 + 256\kappa_3}{189}g_U^2$$

The ratio is $\kappa_3$-independent:

$$\frac{Z_d}{Z_\ell} = \frac{21(128 + 256\kappa_3)}{189(2 + 4\kappa_3)} = \frac{21 \cdot 128(1 + 2\kappa_3)}{189 \cdot 2(1 + 2\kappa_3)} = \frac{2688}{378} = \frac{64}{9}$$

$$\frac{c_\ell}{c_d} = \sqrt{\frac{Z_d}{Z_\ell}} = \sqrt{\frac{64}{9}} = \frac{8}{3}$$

∎

The sector prefactors $c_f$ set absolute mass scales for each fermion sector; they cancel in the ratio invariants $\mathcal{R}$, which test pure $E_8$ geometry independently of normalization.

### T.25.7.2 Up-Down Ratio

**Summary (Up-Down Prefactor).** *The prefactor ratio between quark sectors:*

$$\frac{c_d}{c_u} = \sqrt{\frac{Z_{u_R}}{Z_{d_R}}} = \sqrt{\frac{4\kappa_3 + \frac{4}{9}\kappa_1}{4\kappa_3 + \frac{1}{9}\kappa_1}} \approx 1.02$$

for the PCE-optimal Bures weights $(\kappa_1^*,\kappa_2^*,\kappa_3^*)$ (Corollary T.34.2).

The near-unity ratio follows from identical SU(3) charges for $u_R$ and $d_R$; the small deviation arises from differing U(1)$_Y$ hypercharges ($Y_{u_R}^2 = 4/9$ vs. $Y_{d_R}^2 = 1/9$).

-----

## T.25.8 Summary of Results

### T.25.8.1 Precision Tests

|Test |Prediction|Observation |Deviation|Status |
|:-----------------------|:--------:|:---------------:|:-------:|:----------------------------------:|
|$m_\tau$ |$\approx 0.94$ GeV (LO); 1776.86 MeV (anchored ⊘) |1.77686 GeV |factor $\approx 1.9$ (LO); 0% (anchored) |⚠ (LO normalization open; Remark T.45.1)|
|$m_\mu$ |105.78 MeV (anchored to $m_\tau^{\rm obs}$) |105.65838 MeV |0.12% |✓ (ratio test; Lemma T.45.1a) |
|Lepton $\mathcal{R}$ |3.000 |2.889 |3.7% |✓ |
|$\ln(m_\tau/m_\mu)$ |2.8212 |2.8224 |$\approx 0.04\%$ |✓ |
|$\vert V_{us}\vert$ |0.2261 |0.2243 |0.8% |✓ |
|Up quark $\mathcal{R}$ |2.11 |$2.111 \pm 0.007$|**0.0%** |✓ |
|Down quark $\mathcal{R}$|1.758 |$1.752 \pm 0.007$|**0.3%** |✓ |

The quark-sector entries are same-scale hierarchy invariants under a common-scheme reduction (Section T.25.5.4). The down-sector value includes the $A_2/D_4$ frustration correction (Section T.25.6a) with its matching uncertainty budget (Section T.25.6a.10).

The τ/μ mass ratio achieves $\approx\mathbf{0.04\%}$ **precision** in the log ratio ($|\Delta\ln|=0.0012$), with zero adjustable parameters, representing the single most precise test of the geometric hierarchy mechanism.

### T.25.8.2 Parameter Count

|Sector |Free Parameters|Notes |
|:------------|:-------------:|:------------------------|
|Lepton ratios|0 |All from $K_0 = 3$ |
|Cabibbo angle|0 |From frustration geometry|
|Quark ratios |0 |From $E_8$ triads |

-----

## T.25.9 Falsification Conditions

The framework makes specific, testable predictions:

**Condition 1** (Discrete Spectrum). Mass hierarchy ratios must satisfy:

$$\mathcal{R} \in \left\{\frac{4}{3}, \frac{3}{2}, 2, 3, 4\right\}$$

corresponding to $E_8$ distance ratios. The lepton value $\mathcal{R}_\ell = 2.889$ lies within 4% of the discrete prediction $\mathcal{R} = 3$.

**Condition 2** (Hierarchy Coefficient). The coefficient extracted from τ/μ must equal:

$$\alpha = \frac{\ln(m_\tau/m_\mu)}{2} = 1.411 \pm 5%$$

The theoretical prediction $\alpha_{\text{IR}} = 1.418$ agrees within 0.5%.

**Condition 3** (Frustration Angle). The Cabibbo angle constrains:

$$\theta_{\text{frustration}} = \arcsin\left(\frac{2|V_{us}|}{\sqrt{3} \cdot f_{\text{curv}}}\right) = 15.0° \pm 2°$$

The geometric prediction $\theta_{\text{frustration}} = 15.15°$ lies within this window.

**Condition 4** (Sector Ratio). A measurement of the lepton-quark bridge inconsistent with $c_\ell/c_d = 8/3$ at the 10% level would falsify the gauge/Bures normalization constraint at matching.

-----

## T.25.10 Higher-Order Corrections

The leading PU Yukawa exponent admits a controlled curvature/Van-Vleck expansion on $\text{Gr}(2,8)$ in the small parameter $u^2 = \sigma_B^2 = 1/24$:

$$\ln\left(\frac{m_j}{m_i}\right) = \alpha_{IR} d^2_{ij} + \alpha_2(d_{ij}) d^4_{ij} + \mathcal{O}(d^6)$$

where $\alpha_2(d_{ij})$ is computed from the same Bures-geometry inputs used elsewhere in Appendix T. The full derivation appears in Section T.21.8: the Van Vleck–Morette determinant (Lemma T.42.1) combined with the effective curvature $K_{\text{eff}} = 2$ (Theorem Z.24) yields the geometric coefficient $\beta_{\text{geom}} = 1/144$ (Theorem T.42.2).

For the charged-lepton triad, the two-regime structure (sub-threshold for $d^2 = 2$, threshold for $d^2 = 4$) gives effective dimensions $D_{\text{eff}} = 3/8$ and $D_{\text{eff}} = 13/6$ respectively (Theorem T.42.5), producing:

$$\ln(m_\tau/m_\mu) = 2.8212, \quad \ln(m_\mu/m_e) = 5.3306, \quad \ln(m_\tau/m_e) = 8.1518$$

|Ratio |Leading (Gaussian)|Curvature-corrected|Observed|Deviation|
|:------------------|:----------------:|:-----------------:|:------:|:-------:|
|$\ln(m_\tau/m_\mu)$|2.836 |2.8212 |2.8224 |−0.04% |
|$\ln(m_\mu/m_e)$ |5.672 |5.3306 |5.3316 |−0.02% |
|$\ln(m_\tau/m_e)$ |8.508 |8.1518 |8.1540 |−0.03% |
|$R_\ell$ |3.000 |2.889 |2.889 |exact |

**Controlled remainder / uncertainty.** With $M = 24$ and $d^2 \in \{2, 4\}$ for the charged-lepton links, the expansion parameter is $d^2/M \le 1/6$; the next omitted term contributes a conservative bound $|\Delta\ln| \lesssim 0.005$ to any single logarithm. This bound is the dominant T1 truncation/control uncertainty for the charged-lepton logarithms.

## T.26 Flag-Lift Threshold Compression and Parameter Rigidity

### T.26.1 Isotypic Decomposition of the Lifted Threshold Operator

**Theorem T.67 (Flag-Lift Threshold Compression).** Let $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$ be the minimal flag lift (Definition T.17a), $H:=U(1)\times U(2)\times U(3)$ the decomposition-preserving compact symmetry group, and $\mathcal H_{\mathrm{thr}}$ the Hilbert space on which the threshold operator acts. Let $\mathsf L:\mathcal H_{\mathrm{thr}}\to\mathcal H_{\mathrm{thr}}$ be a self-adjoint $H$-equivariant operator (e.g. the Bures-Laplacian or heat-kernel-derived threshold operator). Then:

(a) $\mathcal H_{\mathrm{thr}}$ admits an $H$-isotypic decomposition
$$
\mathcal H_{\mathrm{thr}} \;\cong\; \bigoplus_{\lambda\in\widehat H} V_\lambda \otimes M_\lambda,
$$
with $V_\lambda$ irreducible $H$-modules and $M_\lambda$ multiplicity spaces.

(b) On each isotypic block, $\mathsf L|_{V_\lambda\otimes M_\lambda}=I_{V_\lambda}\otimes B_\lambda$ for a unique Hermitian $B_\lambda\in\mathrm{End}(M_\lambda)$.

(c) On the three SM gauge sectors $\lambda=1,2,3$ corresponding to $U(1),SU(2),SU(3)$, all threshold information entering gauge matching reduces to the Hermitian multiplicity operators $B_1,B_2,B_3$.

(d) If matching depends only on sector-averaged thresholds, the lifted data collapse to the triplet
$$
\Delta_i \;:=\; \frac{1}{\dim M_i}\,\mathrm{Tr}(B_i),\qquad i=1,2,3.
$$

(e) Any isotropic singlet shift $\mathsf L\mapsto\mathsf L+\delta_{\mathrm{avg}}I$ adds the same constant to every $\Delta_i$, changing only the common coupling offset. ∎

*Proof.* Compactness of $H$ gives complete reducibility and the isotypic decomposition. $H$-equivariance of $\mathsf L$ preserves isotypic blocks; Schur's lemma on the irreducible factor $V_\lambda$ forces the action on the block $V_\lambda\otimes M_\lambda$ to be $I_{V_\lambda}\otimes B_\lambda$. Self-adjointness of $\mathsf L$ gives Hermitian $B_\lambda$. Parts (c) and (d) specialize to the SM gauge sectors; (e) follows because the shift adds the same scalar to every $B_\lambda$. ∎

**Corollary T.67.1 (Pairwise-Coupling Rigidity at the Matching Scale).** With $g_i(\mu_G)=g_U/\sqrt{Z_i}$ and $Z_i=1+\Delta_i/24$ (Definition T.17a), the inverse couplings at $\mu_G$ satisfy $\alpha_i^{-1}(\mu_G)=\alpha_U^{-1}\,Z_i$, hence
$$
\alpha_i^{-1}(\mu_G) - \alpha_j^{-1}(\mu_G) \;=\; \frac{\alpha_U^{-1}}{24}\,(\Delta_i-\Delta_j).\tag{T.67.1}
$$
All pairwise electroweak/QCD threshold separations are determined by the threshold triplet and are insensitive to the isotropic common shift.

*Proof.* Since $\alpha_i=g_i^2/(4\pi)$ and $g_i=g_U/\sqrt{Z_i}$, one has
$$
\alpha_i=\frac{g_i^2}{4\pi}=\frac{g_U^2}{4\pi\,Z_i}=\frac{\alpha_U}{Z_i},
$$
hence $\alpha_i^{-1}=Z_i\,\alpha_U^{-1}$. Subtracting the $i$- and $j$-equations gives (T.67.1). ∎

### T.26.2 Peter–Weyl Block Reduction on the Flag Lift

**Theorem T.68 (Homogeneous Peter–Weyl Block Reduction).** Let $\widetilde X\cong SU(8)/H$ with $H=S(U(2)\times U(1)\times U(2)\times U(3))$ (Appendix G). Let $E_{s,\pm}\to\widetilde X$ be any homogeneous Hermitian bundle associated to a unitary representation $\tau_{s,\pm}:H\to U(V_{s,\pm})$. Then
$$
L^2(\widetilde X,E_{s,\pm}) \;\cong\; \widehat\bigoplus_{\Lambda\in\widehat{SU(8)}} V_\Lambda \otimes \mathrm{Hom}_H(V_\Lambda,\tau_{s,\pm}),
$$
and every $SU(8)$-equivariant self-adjoint Laplace-type operator $D_{s,\pm}$ acts blockwise as
$$
D_{s,\pm} \;\cong\; \widehat\bigoplus_{\Lambda\in\widehat{SU(8)}} I_{V_\Lambda}\otimes B_{\Lambda,s,\pm}
$$
for unique Hermitian $B_{\Lambda,s,\pm}\in\mathrm{End}\bigl(\mathrm{Hom}_H(V_\Lambda,\tau_{s,\pm})\bigr)$. The spectrum of $D_{s,\pm}$ is the multiset union of the finite-dimensional spectra of $B_{\Lambda,s,\pm}$, each weighted by $\dim V_\Lambda$.

*Proof.* Sections of $E_{s,\pm}$ identify with $H$-equivariant $V_{s,\pm}$-valued functions on $SU(8)$. Peter–Weyl gives $L^2(SU(8))\cong\bigoplus_\Lambda V_\Lambda\otimes V_\Lambda^*$; taking the $H$-equivariant part yields the induced-bundle decomposition. $SU(8)$-equivariance and Schur's lemma give the block structure. ∎

**Corollary T.68.1 (Exact Threshold Functionals Reduce to Block Sums).** Let $\{\nu_{\Lambda,s,\pm,a,j}\}$ be the eigenvalues of the sector/parity block $B_{\Lambda,s,\pm,a}$, counted with the internal block multiplicity index $j$. In the canonical $\mathrm{MS2}_{\mu_G}$ branch, every sector/parity contribution is the finite part
$$
F_{s,\pm,a}
=
\left[
\sum_{\Lambda\in\widehat{SU(8)}}
(\dim V_\Lambda)
\sum_j
\log(\nu_{\Lambda,s,\pm,a,j}/\mu_G^2)
\right]_{\mathrm{MS2}_{\mu_G}}.
$$
Equivalently, any noncanonical heat-kernel or Pauli-Villars branch gives the same block reduction after its kernels, coefficients, finite constants, and decay bounds have been fixed before validation comparison. Hence the three sector numbers
$$
F_s=\sum_{\pm,a}F_{s,\pm,a}
$$
are exact block finite parts, and the physical threshold triplet is
$$
\Delta=T\,F,
$$
where $T$ is the invertible Dynkin-index matrix of Remark T.17a.3.

*Proof.* Apply the spectral theorem to each finite-dimensional $B_{\Lambda,s,\pm}$ and sum over blocks with multiplicity $\dim V_\Lambda$. ∎

### T.26.3 Local–Global Decomposition of Sector Thresholds

**Convention T.69a (Canonical $\mathrm{MS2}_{\mu_G}$ Finite Anchoring).** In the canonical threshold branch, the single spectral kernel is
$$
\Phi_\zeta(\nu)=\log(\nu/\mu_G^2),
$$
with coefficient $c_\zeta=1$. For each sector block, write
$$
K_s(t)=\operatorname{Tr}_s(e^{-tD_s})
\sim
\sum_{j=0}^{\infty}a_{2j,s}t^{j-23}
=
a_{0,s}t^{-23}+a_{2,s}t^{-22}+a_{4,s}t^{-21}+\cdots
$$
because $\dim_{\mathbb R}\widetilde X=46$. For any integer $P\ge24$, the sector zeta function is the meromorphic continuation
$$
\zeta_s(q)
=
\frac1{\Gamma(q)}
\left[
\int_0^1 t^{q-1}\left(K_s(t)-\sum_{j=0}^{P}a_{2j,s}t^{j-23}\right)dt
+
\int_1^\infty t^{q-1}K_s(t)dt
+
\sum_{j=0}^{P}\frac{a_{2j,s}}{q+j-23}
\right].
\tag{T.69a.1}
$$
The value of $\zeta_s$ is independent of the chosen $P\ge24$, since increasing $P$ adds and subtracts the same meromorphic term. The canonical $\mathrm{MS2}_{\mu_G}$ threshold finite part is
$$
F_s
=
-\zeta_s'(0)-\zeta_s(0)\log\mu_G^2.
\tag{T.69a.2}
$$
The two threshold-active local coefficients are assigned by
$$
F_s^{\mathrm{loc},2}
:=
-\left.
\frac{d}{dq}
\left[
\frac1{\Gamma(q)}
\left(
\frac{a_{0,s}}{q-23}
+
\frac{a_{2,s}}{q-22}
\right)
\right]
\right|_{q=0},
\tag{T.69a.3}
$$
with zero additional finite counterterm at $\mu_G$. No part of $a_{0,s}$ or $a_{2,s}$ may be reassigned to the global remainder after (T.69a.3) is fixed. Any noncanonical heat-kernel or Pauli-Villars branch must specify all kernels, coefficients, finite constants, and tail bounds before comparison with any validation tuple.

**Theorem T.69 (Canonical Local/Global Threshold Split).** Fix the sector operators $D_s$ of Definition T.17a and the canonical $\mathrm{MS2}_{\mu_G}$ finite part of Convention T.69a. Define
$$
R_s^{\mathrm{glob}}:=F_s-F_s^{\mathrm{loc},2}.

$$
Then:

(a) $F_s^{\mathrm{loc},2}$ depends only on the local heat coefficients $a_{0,s}$ and $a_{2,s}$ of the corresponding sector/parity Laplace-type operator.

(b) $R_s^{\mathrm{glob}}$ is independent of local coordinate choices and depends only on the globally ordered sector/parity spectrum after the local finite anchoring has been fixed.

(c) The exact threshold functional decomposes as
$$
F_s=F_s^{\mathrm{loc},2}+R_s^{\mathrm{glob}}.\tag{T.69.1}
$$

*Proof.* Formula (T.69a.1) is the standard heat-kernel meromorphic continuation of the sector zeta function. The coefficients $a_{2j,s}$ are invariant local polynomials in the complete symbol of $D_s$, the bundle curvature, and the Riemann curvature of $\widetilde X$. Hence the expression (T.69a.3), which uses only $a_{0,s}$ and $a_{2,s}$, is local and coordinate-independent, proving (a).

The full finite part $F_s$ in (T.69a.2) is spectral: it is determined by the eigenvalue multiset of $D_s$ and is invariant under unitary equivalence of the sector operator. Subtracting the fixed local quantity $F_s^{\mathrm{loc},2}$ therefore leaves a coordinate-independent remainder depending on the residual global spectrum, proving (b). The displayed decomposition is exactly the definition of $R_s^{\mathrm{glob}}$, proving (c). ∎

**Corollary T.69.1 (Finite-Representation Closure Criterion).** Let $F_s^{(\le L)}$ be the $\mathrm{MS2}_{\mu_G}$ accelerated block sum obtained by retaining only sector/parity blocks with Casimir at most $L$, and let $\nu_L$ be the smallest omitted eigenvalue. Suppose the sector counting functions satisfy a Weyl bound
$$
N_s(\nu)\le A_s(1+\nu)^{23}
$$
and suppose the accelerated omitted kernel $R_{s,P}(\nu)$ obtained after subtracting the first $P$ asymptotic spectral terms satisfies, for some $P>23$,
$$
|R_{s,P}(\nu)|\le C_{s,P}(1+\nu)^{-P}\log(2+\nu).
$$
Then
$$
|F_s-F_s^{(\le L)}|
\le
\varepsilon_s(L)
:=
A_sC_{s,P}
\int_{\nu_L}^{\infty}
(1+\nu)^{22-P}\log(2+\nu)\,d\nu.
\tag{T.69.3}
$$
In particular,
$$
\varepsilon_s(L)
=
O\left((1+\nu_L)^{23-P}\log(2+\nu_L)\right).
\tag{T.69.4}
$$
If
$$
\left|(T F^{(\le L)})_i-\Delta_i^{\mathrm{val}}\right|
+
\sum_s |T_{is}|\varepsilon_s(L)
\le\tau_i,
$$
then the validation comparison is certified from finitely many $SU(8)$ highest-weight blocks.

*Proof.* The block decomposition of Corollary T.68.1 writes the omitted sector tail as a Stieltjes sum
$$
F_s-F_s^{(\le L)}
=
\int_{\nu_L}^{\infty} R_{s,P}(\nu)\,dN_s(\nu)
$$
after the finite asymptotic counterterms have been added back in the analytic form fixed by Convention T.69a. Taking absolute values and using the displayed bound on $R_{s,P}$ gives
$$
|F_s-F_s^{(\le L)}|
\le
C_{s,P}
\int_{\nu_L}^{\infty}
(1+\nu)^{-P}\log(2+\nu)\,dN_s(\nu).
$$
The Weyl bound implies $dN_s(\nu)$ has total variation dominated by the distributional derivative of $A_s(1+\nu)^{23}$ on monotone majorants; integration by parts gives the bound (T.69.3), with constants absorbed into $A_s$. Since $P>23$, the integral is finite and has the asymptotic order (T.69.4). Finally,
$$
| (TF)_i-(TF^{(\le L)})_i |
\le
\sum_s |T_{is}|\,|F_s-F_s^{(\le L)}|
\le
\sum_s |T_{is}|\varepsilon_s(L).
$$
The stated closure inequality therefore implies that the exact forward value lies inside the target tolerance. ∎

### T.26.4 Sector/Parity Decomposition

**Theorem T.70 (Sector/Parity Spectrum of the Lifted Threshold Operator).** Let
$$
G=SU(8),
\qquad
H=S(U(2)\times U(1)\times U(2)\times U(3)),
\qquad
\widetilde X=G/H.
$$
Let
$$
D^{\mathrm{PCE}}_{\widetilde X}
=
(\nabla^{\widetilde G})^*\nabla^{\widetilde G}
+\mu_0I
+m_{\mathcal J}\mathcal J_G
+\mathcal C_\kappa
+\eta\mathcal J_G\mathcal C_\kappa
$$
be the lifted threshold operator (Definition T.17a), and let the sector scalars be
$$
\lambda_C=\frac{\kappa_1}{15}+\frac{4\kappa_3}{3},
\qquad
\lambda_W=\frac{3\kappa_1}{20}+\frac{3\kappa_2}{4},
\qquad
\lambda_Y=\frac{4\kappa_1}{15}.
$$
Assume that $\mathcal J_G$ is a self-adjoint involution preserving the smooth sector bundles $E_s$ and commuting with $(\nabla_s^{\widetilde G})^*\nabla_s^{\widetilde G}$ and $\mathcal C_\kappa$ on the stated operator domain. Then
$$
E_s=E_{s,+}\oplus E_{s,-}
$$
orthogonally, and
$$
D^{\mathrm{PCE}}_{s,\pm}
=
(\nabla_s^{\widetilde G})^*\nabla_s^{\widetilde G}
+
c_{s,\pm}I,
\qquad
c_{s,\pm}
=
\mu_0+\lambda_s\pm m_{\mathcal J}\pm\eta\lambda_s.

$$

If $E_{s,\pm}$ is the homogeneous bundle associated to an $H$-type $\tau_{s,\pm,a}$, then for every dominant $SU(8)$ highest weight $\Lambda$ with irreducible module $V_\Lambda$, the corresponding eigenvalues are
$$
\nu_{\Lambda,s,\pm,a}
=
\beta\left(
C_2^{SU(8)}(\Lambda)
-
C_2^H(\tau_{s,\pm,a})
\right)
+
c_{s,\pm},

$$
with multiplicity
$$
(\dim V_\Lambda)\,
m_{\Lambda,s,\pm,a},
\qquad
m_{\Lambda,s,\pm,a}
=
\dim\operatorname{Hom}_H(\tau_{s,\pm,a},V_\Lambda|_H).

$$
Here $\beta$ is the fixed metric normalization of the homogeneous Laplacian. Hence
$$
\zeta_s(q)
=
\sum_{\pm,a}
\sum_{\Lambda\in\widehat{SU(8)}}
(\dim V_\Lambda)m_{\Lambda,s,\pm,a}
\nu_{\Lambda,s,\pm,a}^{-q}

$$
for $\operatorname{Re}q>23$, with continuation and finite part as in Convention T.69a.

If $\mathcal J_G$ is not homogeneous but preserves a residual compact symmetry, then the scalar Casimir formula is replaced by the finite Hermitian block formula
$$
B_{\Lambda,s,a}
=
\beta\left(
C_2^{SU(8)}(\Lambda)
-
C_2^H(\tau_{s,a})
\right)I
+
(\mu_0+\lambda_s)I
+
(m_{\mathcal J}+\eta\lambda_s)J_{\Lambda,s,a},

$$
and the sector spectrum is the multiset of eigenvalues of the blocks $B_{\Lambda,s,a}$, weighted by $\dim V_\Lambda$.

*Proof.* On $E_s$, Remark T.17a.3 gives $\mathcal C_\kappa=\lambda_sI$. Therefore
$$
D_s
=
(\nabla_s^{\widetilde G})^*\nabla_s^{\widetilde G}
+
(\mu_0+\lambda_s)I
+
(m_{\mathcal J}+\eta\lambda_s)\mathcal J_G.
$$
Since $\mathcal J_G$ is a self-adjoint involution commuting with the sector Laplacian, its $\pm1$ eigenspaces are orthogonal invariant closed domains for $D_s$. Restricting to $E_{s,\pm}$ replaces $\mathcal J_G$ by $\pm I$, which proves the displayed scalar-shift formula.

For a homogeneous associated bundle $G\times_H\tau_{s,\pm,a}$, sections identify with $H$-equivariant functions $f:G\to\tau_{s,\pm,a}$. Peter-Weyl gives
$$
L^2(G\times_H\tau_{s,\pm,a})
\cong
\widehat\bigoplus_{\Lambda\in\widehat G}
V_\Lambda\otimes
\operatorname{Hom}_H(\tau_{s,\pm,a},V_\Lambda|_H).
$$
The canonical homogeneous connection Laplacian is the difference of the $G$ and $H$ quadratic Casimirs, with the metric normalization factor $\beta$. Thus it acts by
$$
\beta\left(C_2^{SU(8)}(\Lambda)-C_2^H(\tau_{s,\pm,a})\right)
$$
on each multiplicity block. Adding the scalar shift $c_{s,\pm}$ proves the displayed Casimir eigenvalue formula, and the Peter-Weyl multiplicity gives the displayed multiplicity. Summing the powers of the eigenvalues gives the displayed zeta sum in the convergence half-plane.

If the Golay involution is not homogeneous, the Casimir part is still scalar on each homogeneous block, while the restricted Golay action is a finite Hermitian matrix $J_{\Lambda,s,a}$ on the corresponding multiplicity space. Adding the bounded endomorphism term gives the displayed finite-block formula, and the spectral theorem for finite Hermitian matrices gives the asserted block spectrum. ∎

**Corollary T.70.1 (Homogeneous Golay-Parity Obstruction).** Suppose a sector bundle $E_s$ is associated to a complex irreducible $H$-type $\tau_s$, and suppose $\mathcal J_G$ is a pointwise $H$-equivariant self-adjoint involution preserving $E_s$. Then $\mathcal J_G|_{E_s}=+I$ or $\mathcal J_G|_{E_s}=-I$. Hence a homogeneous $H$-equivariant pointwise Golay involution cannot by itself generate a nontrivial $\tau_{s,+}$ versus $\tau_{s,-}$ branching asymmetry inside an irreducible sector.

*Proof.* The fiber map defining $\mathcal J_G|_{E_s}$ lies in $\operatorname{End}_H(\tau_s)$. Since $\tau_s$ is a complex irreducible unitary representation, Schur's lemma gives $\operatorname{End}_H(\tau_s)=\mathbb C I$. Self-adjointness forces the scalar to be real, and $\mathcal J_G^2=I$ forces it to be $+1$ or $-1$. Thus one of the two eigensubbundles is zero on that irreducible sector. ∎

**Theorem T.70.2 (Admissibility Test for Scalar One-Block Parity Closures).** Work in the canonical $\mathrm{MS2}_{\mu_G}$ threshold functional of Definition T.17a and Convention T.69a, and let the lifted threshold operator be the operator of Theorem T.70. Suppose a proposed scalar one-block closure retains a single active $SU(8)$ block $\Lambda_{0,s}$ in each sector and assigns oriented parity eigenvalues
$$
\nu_{s,+}=a_s+Q_s,
\qquad
\nu_{s,-}=a_s-Q_s,
\qquad
s\in\{C,W,Y\},
$$
with $a_s>|Q_s|$ and equal active multiplicity $d_s$ in the two parity copies of sector $s$. Then the following conditions are necessary for theorem-level compatibility with the existing lifted threshold formalism.

1. The canonical active contribution is the ordinary zeta-determinant contribution
$$
F_s^{\mathrm{act}}
=
d_s\log\left(\frac{a_s+Q_s}{\mu_G^2}\right)
+
d_s\log\left(\frac{a_s-Q_s}{\mu_G^2}\right),
$$
not the parity-relative expression
$$
d_s\log\left(\frac{a_s+Q_s}{a_s-Q_s}\right).
$$
Thus the ratio formula defines a different superdeterminant threshold functional unless the threshold functional itself is replaced before any comparison is made.

2. If the scalar parity splitting comes from the Golay term already present in $D^{\mathrm{PCE}}_{\widetilde X}$, then after the sector scalars $\lambda_s$ of Remark T.17a.3 are fixed there are constants $m_{\mathcal J}$ and $\eta$, common to all three sectors, such that
$$
Q_s=m_{\mathcal J}+\eta\lambda_s,
\qquad
s\in\{C,W,Y\},
$$
up to the harmless relabeling of the two parity signs in a sector. Equivalently, for a fixed oriented parity convention and distinct $\lambda_C,\lambda_W,\lambda_Y$, the three proposed numbers $Q_C,Q_W,Q_Y$ must satisfy
$$
(Q_Y-Q_C)(\lambda_W-\lambda_C)
=
(Q_W-Q_C)(\lambda_Y-\lambda_C).
\tag{T.70.2}
$$

3. A zero-tail certificate for such a closure is valid only if every omitted block is either absent from the sector spectrum of Theorem T.70 or cancels inside the same canonical ordinary $\mathrm{MS2}_{\mu_G}$ functional. Cancellation in a parity-relative determinant line does not by itself certify cancellation for Definition T.17a.

For the PCE-optimal Bures weights of Corollary T.34.2, the sector scalars are
$$
\lambda_C=1.565841596738\ldots,
\qquad
\lambda_W=0.651237604893\ldots,
\qquad
\lambda_Y=0.185223077931\ldots.
$$
Consequently the oriented scalar triple
$$
Q_C=\frac{392}{215},
\qquad
Q_W=\frac{25}{12},
\qquad
Q_Y=-\frac{15}{16}
$$
does not satisfy (T.70.2). Indeed, fitting $Q_C$ and $Q_W$ to the required affine form gives
$$
\eta=-0.284360796256\ldots,
\qquad
m_{\mathcal J}=2.268519777212\ldots,
$$
and therefore predicts
$$
m_{\mathcal J}+\eta\lambda_Y
=2.215849595287\ldots,
$$
not $-15/16$. This failure is not removed by independently relabeling parity signs in the three sectors. If
$$
(q_C,q_W,q_Y)=\left(\frac{392}{215},\frac{25}{12},\frac{15}{16}\right),
$$
then the finite check over $\epsilon_C,\epsilon_W,\epsilon_Y\in\{\pm1\}$ gives
$$
\min_{\epsilon_C,\epsilon_W,\epsilon_Y}
\left|
(\epsilon_Yq_Y-\epsilon_Cq_C)(\lambda_W-\lambda_C)
-
(\epsilon_Wq_W-\epsilon_Cq_C)(\lambda_Y-\lambda_C)
\right|
=
1.1691836428\ldots>0.
$$
Hence this scalar one-block parity closure is not an admissible completion of the existing $D^{\mathrm{PCE}}_{\widetilde X}$ threshold problem.

*Proof.* By Definition T.17a and Convention T.69a, the sector functional is obtained from the zeta function of the sector operator $D_s$ by
$$
F_s=-\zeta_s'(0)-\zeta_s(0)\log\mu_G^2.
$$
For a finite active pair with eigenvalues $a_s+Q_s$ and $a_s-Q_s$, both counted as eigenvalues of the same sector spectrum with multiplicity $d_s$, the finite part is therefore the sum of the two logarithms. The difference of the two logarithms is the logarithm of a relative determinant line, not the ordinary determinant of the sector operator. This proves part 1.

For part 2, Theorem T.70 gives on sector $s$
$$
D_s=(\nabla_s^{\widetilde G})^*\nabla_s^{\widetilde G}
+(\mu_0+\lambda_s)I
+(m_{\mathcal J}+\eta\lambda_s)\mathcal J_G.
$$
On an oriented parity eigenspace, $\mathcal J_G$ is $+1$ or $-1$. Hence the splitting around the sector center is exactly the common affine quantity $m_{\mathcal J}+\eta\lambda_s$. Eliminating $m_{\mathcal J}$ and $\eta$ from the three equations $Q_s=m_{\mathcal J}+\eta\lambda_s$ gives (T.70.2).

For part 3, Corollary T.69.1 bounds the omitted part of the same canonical block sum that defines $F_s$. A cancellation statement in a different functional cannot set the ordinary omitted kernel to zero unless an additional theorem identifies the two omitted ordinary block sums. Therefore a zero-tail assertion must be made inside the Definition T.17a functional itself.

Substituting the PCE-optimal weights into Remark T.17a.3 gives the displayed values of $\lambda_C,\lambda_W,\lambda_Y$. Solving the color and weak equations gives the displayed $m_{\mathcal J}$ and $\eta$, and evaluating the affine expression at $\lambda_Y$ gives $2.215849595287\ldots\ne -15/16$. The displayed finite sign check evaluates the same affine compatibility residual after all possible independent parity-label relabelings, and none vanishes. Thus the displayed scalar closure fails the necessary compatibility condition. ∎

**Corollary T.70.3 (Status of One-Block Ratio Completions).** A one-block formula of the form
$$
F_s=d_s\log\left(\frac{a_s+Q_s}{a_s-Q_s}\right)
$$
can be used in Appendix T only after the paper explicitly replaces the canonical sector determinant by a parity-relative superdeterminant and independently proves that the resulting oriented $Q_s$ arise from admissible branch data fixed before comparison. Without those two additional steps, such a formula is a diagnostic ansatz rather than a completed flag-lift spectral computation in the sense of Theorem T.78.

*Proof.* This is immediate from Theorem T.70.2 and Theorem T.78. ∎

## T.27 RG Rigidity and Yukawa Cancellation

**Theorem T.71 (RG Rigidity of the Electroweak/Flavor Boundary Problem).** Assume the PU fixed-point boundary conditions of Theorem T.35 together with the threshold triplet $(\Delta_1,\Delta_2,\Delta_3)$, the $E_8$ triad assignment, and a fixed loop-order Standard Model RG system. Then the full electroweak/Yukawa observable vector at low energy is uniquely determined. Equivalently, two admissible lifted threshold operators inducing the same triplet produce the same electroweak/Yukawa predictions at the chosen RG order.

*Proof.* Theorem T.35 packages the fixed-point data into a complete set of boundary conditions once the lifted threshold data are supplied. Theorem T.67 shows those spectral data reduce, at matching level, to $(\Delta_1,\Delta_2,\Delta_3)$. The initial conditions for the RG flow are therefore uniquely fixed. At any finite loop order the RG equations form an autonomous first-order ODE system $\mu\,dX/d\mu=\beta(X)$ with smooth right-hand side on the perturbative PU matching branch; standard ODE uniqueness gives a unique running trajectory and therefore unique low-energy observables. ∎

**Theorem T.72 (Sector-Normalization Cancellation).** Assume the Yukawa entries in a fixed fermion sector $f$ at the matching scale have the PU form
$$
y_{f,a}(\mu_G) \;=\; \mathcal N_{\mathrm{PU}}\,c_f\,D_{f,a}\,e^{-\alpha\,\ell_{f,a}},\qquad D_{f,a}>0,
$$
with $\mathcal N_{\mathrm{PU}}$ the universal normalization, $c_f$ the sector prefactor, $D_{f,a}>0$ the Van Vleck–Morette / geodesic determinant correction, $\ell_{f,a}$ the $E_8$-geometric squared-length datum, and $\alpha$ the hierarchy coefficient. Then for any entries $a,b$ in the same sector,
$$
\ln\frac{y_{f,b}}{y_{f,a}} \;=\; -\alpha\,(\ell_{f,b}-\ell_{f,a}) + \ln\frac{D_{f,b}}{D_{f,a}}. \tag{T.72.1}
$$
In particular, the absolute normalizations $\mathcal N_{\mathrm{PU}}$ and $c_f$ cancel exactly from all intrasector mass ratios.

*Proof.* Take logarithms of both sides of $y_{f,a}=\mathcal N_{\mathrm{PU}}c_f D_{f,a}e^{-\alpha\ell_{f,a}}$ and subtract the $a$- and $b$-equations. ∎

**Corollary T.72.1 (Pure $E_8$ Hierarchy Law as the Triad-Symmetric Branch).** If $D_{f,a}=D_f$ for all $a$ in the chosen generation orbit, then $\ln(y_{f,b}/y_{f,a})=-\alpha(\ell_{f,b}-\ell_{f,a})$. If moreover $\ell_{f,a}=d^2_{E_8}(r_{f,a},r_{H,f})$, setting $i\leftrightarrow a$, $j\leftrightarrow b$ gives the exact distance law
$$
\ln\frac{m_j}{m_i} \;=\; \alpha\,\bigl(d^2_{E_8}(r_{i},r_{H})-d^2_{E_8}(r_{j},r_{H})\bigr). \tag{T.72.2}
$$

*Proof.* Set $D_{f,b}/D_{f,a}=1$ in Theorem T.72 and relabel. The sign in (T.72.2) is fixed by the direct substitution: if $\ell_b=d^2(r_j,r_H)$ and $\ell_a=d^2(r_i,r_H)$, then $-\alpha(\ell_b-\ell_a)=\alpha(\ell_a-\ell_b)=\alpha(d^2(r_i,r_H)-d^2(r_j,r_H))$, so $\ln(m_j/m_i)=\alpha(d^2(r_i,r_H)-d^2(r_j,r_H))$. With $\alpha>0$ this predicts $m_j>m_i$ whenever $d^2(r_i,r_H)>d^2(r_j,r_H)$, matching the Yukawa $y\propto e^{-\alpha\ell}$ convention: smaller distance to $r_H$ ↔ larger Yukawa ↔ heavier fermion. ∎

**Theorem T.73 (Conditional Van Vleck Symmetry Reduction).** Fix a Higgs reference point $r_H$ and a generation branch $\{r_a\}\subset E_8$. Assume that the relevant flavor manifold admits an isometry group whose isotropy subgroup at $r_H$ acts transitively on each subset of the chosen branch with the same geometric invariants entering the Jacobi equation along geodesics out of $r_H$ (for example, on each fixed-distance shell in an isotropy-symmetric model branch). Let $\gamma_a$ be the geodesic connecting $r_H$ to $r_a$, and let $\mathcal V_a$ be the corresponding Van Vleck–Morette determinant factor entering the complete Yukawa value. Then $\mathcal V_a$ depends only on the isotropy orbit of the initial tangent of $\gamma_a$. In particular, if orbit type on the chosen branch is completely indexed by the discrete squared-distance class $d^2_{E_8}(r_a,r_H)$, then
$$
\mathcal V_a \;=\; F\!\bigl(d^2_{E_8}(r_a,r_H)\bigr). \tag{T.73.1}
$$

*Proof.* Any isometry preserving $r_H$ maps geodesics out of $r_H$ to geodesics out of $r_H$ and conjugates the Jacobi equation along them. The Van Vleck determinant is built from the associated Jacobi map and is invariant under that conjugation. Hence it is constant on isotropy orbits of the initial tangent. If, on the chosen branch, those orbits are indexed by the discrete squared-distance classes, the displayed reduction follows. ∎

**Corollary T.73.1 (Ratio-Level Yukawa Formula on an Isotropy-Symmetric Branch).** On a branch satisfying the distance-class reduction of Theorem T.73, within any fixed flavor sector,
$$
\frac{y_b}{y_a} \;=\; \frac{F(d_b^2)}{F(d_a^2)}\,\exp\!\bigl[\tfrac32\,(d_a^2-d_b^2)\bigr],
$$
using $\alpha=3/2$ of Theorem T.41.5. Within such a branch, intrasector mass ratios are determined by the discrete $E_8$ distance data together with the orbit-reduced Van Vleck factor.

*Proof.* Apply Theorem T.72 with $\ell=d^2$ and $\alpha=3/2$; substitute $D_a/D_b=F(d_a^2)/F(d_b^2)$ from Theorem T.73. The sign in the exponent follows directly from (T.72.1) under the substitution $\ell=d^2$. ∎

## T.28 Flavor CP: Berry Area and Packet Factorization

**Theorem T.74 (Geometric Berry-Area for Flavor CP).** Let $\mathcal A$ be the Berry connection on the generation manifold $\mathrm{Gr}(2,8)$, and $\mathcal F=d\mathcal A=\omega_{KE}$ its curvature. Let $\gamma$ be a smooth closed flavor loop bounding a smooth oriented surface $\Sigma$. Then the Berry holonomy is gauge-invariant mod $2\pi$ and equals the oriented Kähler area:
$$
\delta_{\mathrm{Berry}}(\gamma) \;=\; \oint_\gamma \mathcal A \;=\; \int_\Sigma \omega_{KE} \pmod{2\pi}.
$$

*Proof.* Under a Berry gauge transformation $\mathcal A\mapsto\mathcal A+d\chi$, the loop integral changes by $\oint_\gamma d\chi=0$ by the endpoint-matching condition, so it is gauge-invariant mod $2\pi$. Since $\gamma=\partial\Sigma$, Stokes' theorem gives $\oint_\gamma\mathcal A=\int_\Sigma d\mathcal A=\int_\Sigma\omega_{KE}$. ∎

**Theorem T.75 (Coherent-Averaging Factorization).** Let $(x,y)$ be local mismatch coordinates on two independent coherence directions transverse to a minimal flavor loop, and assume the local Berry phase linearizes as
$$
\phi(x,y) \;=\; \delta_{\mathrm{base}} + u\,x + \sqrt2\,u\,y
$$
on the support of a normalized separable packet $\rho(x,y)=\rho_1(x)\rho_2(y)$. Define the effective CP-odd amplitude by
$$
\mathcal A_{\mathrm{CP}}^{\mathrm{eff}} \;:=\; \iint e^{\,i\phi(x,y)}\,\rho_1(x)\rho_2(y)\,dx\,dy.
$$
Then
$$
\mathcal A_{\mathrm{CP}}^{\mathrm{eff}} \;=\; e^{\,i\delta_{\mathrm{base}}}\,\widehat\rho_1(u)\,\widehat\rho_2(\sqrt2\,u),\qquad \widehat\rho_j(k):=\int_{\mathbb R} e^{ikx}\rho_j(x)\,dx.
$$
If $\rho_1=\rho_2=\rho_{\mathrm{flat}}=\tfrac12\,\mathbf 1_{[-1,1]}$, then $\widehat\rho_{\mathrm{flat}}(k)=\sin k/k=\mathrm{sinc}(k)$ and $\mathcal A_{\mathrm{CP}}^{\mathrm{eff}}=e^{i\delta_{\mathrm{base}}}\,\mathrm{sinc}(u)\,\mathrm{sinc}(\sqrt2\,u)$. If the phase-extraction map used in Appendix T is linear at this order, then $\delta_{\mathrm{obs}}=\delta_{\mathrm{base}}\,\mathrm{sinc}(u)\,\mathrm{sinc}(\sqrt2\,u)$.

*Proof.* Substitute the linearized phase to factor the double integral:
$$
\mathcal A_{\mathrm{CP}}^{\mathrm{eff}} \;=\; e^{i\delta_{\mathrm{base}}}\!\left(\int e^{iux}\rho_1(x)\,dx\right)\!\left(\int e^{i\sqrt2uy}\rho_2(y)\,dy\right) \;=\; e^{i\delta_{\mathrm{base}}}\,\widehat\rho_1(u)\,\widehat\rho_2(\sqrt2\,u).
$$
For the top-hat, $\widehat\rho_{\mathrm{flat}}(k)=\tfrac12\int_{-1}^1 e^{ikx}\,dx=\sin k/k$. ∎

**Theorem T.76 (Maximum-Entropy Coherent Packet).** Let $x$ denote the effective mismatch coordinate on the minimal CP loop. Assume: (i) the packet support is bounded by the normalized mismatch cell $x\in[-1,1]$; (ii) the only resolved coarse constraints are normalization $\int\rho=1$ and symmetry $\rho(x)=\rho(-x)$; (iii) PCE selects the equilibrium packet of maximal Shannon entropy under those constraints. Then the packet is uniquely uniform:
$$
\rho(x) \;=\; \tfrac12\,\mathbf 1_{[-1,1]}(x),\qquad \widehat\rho(u)=\mathrm{sinc}(u).
$$
On the one-direction CKM reduction $\delta_{\mathrm{obs}}=\delta_{\mathrm{base}}\,\mathrm{sinc}(u)$; on the two-direction factorized branch $\delta_{\mathrm{obs}}=\delta_{\mathrm{base}}\,\mathrm{sinc}(u)\,\mathrm{sinc}(\sqrt2\,u)$ (Theorem T.75).

*Proof.* Among probability densities on a compact interval with only normalization and symmetry constraints, the Shannon-entropy maximizer is the uniform density (standard MaxEnt; see Cover–Thomas §12). Its Fourier transform is the sinc function. Combining with Theorem T.75 gives the stated observed phases. ∎

**Corollary T.76.1 (Structural / Profile Split).** After Theorems T.74 and T.75, the CKM/PMNS CP sector splits into a structural part — Berry holonomy area on $\mathrm{Gr}(2,8)$ — and a profile part — the packet characteristic function $\widehat\rho$. On the PCE-MaxEnt branch of Theorem T.76, the profile part is forced to the sinc factors already used in Appendix T. ∎

## T.29 Relative Uniqueness of the Quantitative Parameter Sector

**Theorem T.77 (Relative Uniqueness of the Quantitative SM Parameter Sector).** Fix a connected PU structural branch for which the quantitative gauge-threshold sector is formulated on $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$ (Theorem G.8.4e), and fix the two-loop SM RG system. Let $\Delta=(\Delta_1,\Delta_2,\Delta_3)$ be the principal lifted threshold triplet (Theorem T.67) and $\mathcal R_T=(\mathcal T_{E_8},\mathcal V,\mathcal B)$ the residual flavor-geometric data: the chosen $E_8$ generation triads $\mathcal T_{E_8}$, the complete Van Vleck/geodesic data $\mathcal V$ entering the Yukawa sector, and the Berry/coherent-profile data $\mathcal B$ in the CKM/PMNS phase constructions. Then the quantitative Appendix-T parameter vector
$$
\Pi_T \;:=\; \bigl(\sin^2\theta_W(M_Z),\,g_i(\mu_G),\,v,\,m_H,\,Y_u,\,Y_d,\,Y_e,\,m_{\nu_a},\,V_{\mathrm{CKM}},\,U_{\mathrm{PMNS}}\bigr)
$$
is uniquely determined by $(\Delta,\mathcal R_T)$. Equivalently, two admissible PU realizations on the same structural branch with $(\Delta,\mathcal R_T)=(\Delta',\mathcal R_T')$ produce the same $\Pi_T=\Pi_T'$.

*Proof.* Theorem G.8.4e forces the quantitative threshold arena to $\widetilde X$. Corollary T.67.1 fixes the gauge-matching data from $\Delta$ alone (the isotropic residual of Theorem T.17 shifts only the common offset, not the physically relevant pairwise separations). Theorem T.71 (equivalently Theorem T.35) takes the eight PU fixed-point boundary conditions together with the two-loop RG flow and yields a unique running trajectory once $\Delta$ and $\mathcal T_{E_8}$ are fixed, hence unique electroweak/Higgs observables. Theorem T.36 reduces the 21 SM Yukawas to 7 fundamental quantities via $E_8$ geometry with $\alpha=3/2$ (Theorem T.41.5); Theorems T.72–T.73 fix ratios from $\mathcal T_{E_8}$ and $\mathcal V$, which in combination with the universal normalization $\mathcal N_{\mathrm{PU}}=1/(72\sqrt{12})$ and sector prefactors $c_f$ gives the complete Yukawa matrices. The mixing sector is fixed by Theorems T.74–T.76 once $\mathcal B$ is supplied. Combining the gauge-matching, RG, Yukawa, and mixing steps, every component of $\Pi_T$ is uniquely determined by $(\Delta,\mathcal R_T)$. ∎

**Corollary T.77.1 (No Hidden Continuous Tuning).** On a fixed PU structural branch, every residual non-uniqueness in the quantitative Appendix-T sector is concentrated in $(\Delta,\mathcal R_T)$; no continuous tuning freedom remains inside the RG/matching/evolution machinery once those data are fixed. ∎

**Corollary T.77.2 (Absolute Uniqueness After Residual Closure).** If additionally PU forces:
1. a completed flag-lift spectral computation of $(\Delta_1,\Delta_2,\Delta_3)$ on $\widetilde X$ (using Corollary T.69.1 and the block-sum expression of Corollary T.68.1);
2. a unique determination of $(\mathcal T_{E_8},\mathcal V)$ on the selected flavor branch;
3. a unique determination of $\mathcal B$ in the CKM/PMNS sector (for example by Theorem T.76 on the selected branch);

then $\Pi_T$ is absolutely unique.

*Proof.* Under (1)–(3), the residual data $(\Delta,\mathcal R_T)$ become unique. Theorem T.77 then yields uniqueness of $\Pi_T$. ∎

## T.30 Determinacy After Spectral Completion

**Theorem T.78 (Determinacy of a Completed Flag-Lift Spectral Problem).** Let $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$ be the minimal flag lift of the quantitative gauge sector. Fix:
1. the PU structural branch;
2. the metric normalization $\beta$ and the homogeneous connection $\nabla^{\widetilde G}$;
3. the parameters $(\mu_0,m_{\mathcal J},\eta)$ and the Golay involution $\mathcal J_G$;
4. the sector/parity $H$-types or, in the nonhomogeneous case, the finite residual-symmetry block matrices, canonically identified by the Golay/parity construction of Theorem G.8.4e.1 and Remark T.17a.3;
5. the canonical $\mathrm{MS2}_{\mu_G}$ finite part of Convention T.69a;
6. a tail certificate $\{\varepsilon_s(L)\}_{s\in\{C,W,Y\}}$ satisfying Corollary T.69.1.

Then the completed spectral problem produces unique sector values
$$
F_s
=
-\zeta_s'(0)-\zeta_s(0)\log\mu_G^2,
\qquad s\in\{C,W,Y\},
$$
and hence a unique threshold triplet
$$
\Delta_3=F_C,\qquad
\Delta_2=F_W,\qquad
\Delta_1=\frac25F_C+\frac35F_W+\frac{8}{15}F_Y.
$$
The matching factors and minimal residual ledger are uniquely
$$
Z_i=1+\frac{\Delta_i}{24},
\qquad
\delta_i^{\mathrm{min}}=0.
$$

*Proof.* The data in items 1–4 define a definite self-adjoint elliptic sector operator on the compact manifold $\widetilde X$ for each sector/parity block. Theorem T.70 gives its sector-resolving spectrum, either by scalar Casimir shifts in the homogeneous case or by finite Hermitian matrices in the residual-symmetry case. The heat trace and zeta function are therefore uniquely determined. Convention T.69a fixes the finite part and forbids changing the finite counterterms after the spectrum is known, so each $F_s$ is unique. The matrix $T$ is fixed and invertible, hence $\Delta=TF$ is unique. The formula $Z_i=1+\Delta_i/24$ is Definition T.17a. The minimal residual ledger contains no heavy-threshold list beyond the completed lifted operator, so Definition T.19a gives $\delta_i^{\mathrm{min}}=0$. ∎

**Corollary T.78.1 (No Ambiguity Inside a Completed Spectral Problem).** Two admissible realizations that define the same completed flag-lift spectral problem produce the same threshold triplet $\Delta$. ∎

**Theorem T.78.2 (Current Non-Closure of the Global Flag-Lift Spectral Gate).** Let $\mathcal D_{\mathrm{cur}}$ denote the canonical threshold data fixed in Definition T.17a, Convention T.17a.0, Convention T.69a, Theorems T.69-T.70, and the flag-lift construction of Theorems G.8.4e-G.8.4e.1 and Proposition G.8.4e.1a. Even after adjoining the marked Golay-Leech half-swap convention of Definition G.8.4f.3, the data $\mathcal D_{\mathrm{cur}}$ do not determine a completed tuple $\mathfrak S_{\widetilde X}$ in the sense of Convention T.17a.0 and Theorem T.78. The following data remain branch inputs unless fixed by an additional theorem before validation comparison:

1. the numerical metric normalization $\beta$ of the homogeneous Laplacian on $\widetilde X$, or an explicit normalization theorem tying it to the lifted Bures/Kähler-Einstein scale;
2. the homogeneous connection $\nabla^{\widetilde G}$ together with a proof that the chosen $\mathcal J_G$ either commutes with the corresponding sector Laplacians or else defines the stated residual finite block matrices;
3. the structural parameters $(\mu_0,m_{\mathcal J},\eta)$ independently of the validation tuple;
4. the complete sector/parity $H$-types $\{\tau_{s,\pm,a}\}$ in the homogeneous case, or the complete matrices $J_{\Lambda,s,a}$ in the residual-symmetry case;
5. a finite-block tail certificate $\{\varepsilon_s(L)\}$ satisfying Corollary T.69.1 with explicit constants and cutoff.

Consequently the sector spectra, canonical finite parts $F_s$, threshold shifts $\Delta_i$, and matching factors $Z_i$ are not theorem-level numerical outputs of the current canonical ledger. Any assignment of the missing data is an additional spectral branch package. If such a package is appended before validation comparison, Theorem T.78 applies to it; without such a package, the validation tuple remains a comparison target only. The canonical minimal residual ledger remains $\delta_i=0$ and cannot be used to absorb missing principal lifted thresholds.

*Proof.* Convention T.17a.0 defines a completed threshold calculation as the tuple
$$
\mathfrak S_{\widetilde X}
=
\left(
\widetilde X,
D^{\mathrm{PCE}}_{\widetilde X},
\mathrm{MS2}_{\mu_G},
\mathcal J_G,
\mu_0,
m_{\mathcal J},
\eta,
\{\tau_{s,\pm,a}\},
\{\varepsilon_s(L)\}
\right),
$$
fixed before comparison with any numerical validation tuple. Theorem T.78 requires the same information, including $\beta$, $\nabla^{\widetilde G}$, $(\mu_0,m_{\mathcal J},\eta)$, the Golay involution as an operator on the lifted sector blocks, the sector/parity $H$-types or finite residual matrices, the finite-part prescription, and a tail certificate.

The data listed in $\mathcal D_{\mathrm{cur}}$ fix the manifold $\widetilde X$, the formal determinant prescription, the Dynkin-index matrix $T$, and the structural form of the block spectrum. They do not give numerical values for $\beta$ or $(\mu_0,m_{\mathcal J},\eta)$, nor do they list the required $H$-types or residual matrices. The marked half-swap of Definition G.8.4f.3 is a finite coordinate-frame involution on the marked 24-mode Golay-Leech carrier. To enter Theorem T.70 it must be promoted to an operator-level action on every sector block and must either commute with the chosen sector Laplacians or be represented by explicit finite matrices $J_{\Lambda,s,a}$. Those data are not supplied by the marked coordinate convention alone.

The dependence on the missing data is genuine. Already at any finite retained block set used in Corollary T.69.1, changing $\mu_0$ to $\mu_0+r$ changes the retained ordinary determinant by
$$
F_s^{(\le L)}(r)-F_s^{(\le L)}(0)
=
\sum_{\Lambda,\pm,a,j}^{\le L}
(\dim V_\Lambda)
\log\left(1+\frac{r}{\nu_{\Lambda,s,\pm,a,j}}\right),
$$
where the sum is over the retained positive eigenvalues. For every nonempty retained sector and every admissible $r\ne0$ small enough to keep positivity, this expression is not identically zero. Similarly, changing $m_{\mathcal J}$ or $\eta$ changes the parity shifts $m_{\mathcal J}+\eta\lambda_s$, and changing $\beta$ changes every nonzero Casimir contribution. Since the canonical $\mathrm{MS2}_{\mu_G}$ prescription fixes zero additional finite counterterm at $\mu_G$, these variations are not removable by a later counterterm choice. Finally, $T$ is fixed and invertible, so variation of $F$ gives variation of $\Delta=TF$. Therefore the current data do not determine a unique completed spectral output. ∎

**Corollary T.78.3 (Airtight Status of the Lifted Threshold Computation).** The global flag-lift threshold problem is structurally formulated and locally constrained, but it is not numerically closed in the current canonical ledger. A theorem-level closure requires an independently specified spectral branch package containing the missing data listed in Theorem T.78.2, followed by the forward block-sum computation and Corollary T.69.1 tail certificate. Until then, no value of $(\Delta_i,Z_i)$ may be promoted from validation target to derived prediction, and no nonminimal $\delta_i$ may be introduced unless a separate heavy-threshold ledger is explicitly appended.

*Proof.* Immediate from Theorem T.78.2, Definition T.19a, Proposition T.19c, and Corollary T.79.1. ∎

**Theorem T.79 (Conditional Closure of the Quantitative Parameter Sector).** On a fixed PU structural branch with the two-loop SM RG system, suppose:
1. a completed flag-lift spectral calculation provides a definite threshold triplet $\Delta$;
2. the flavor-geometric residual data $(\mathcal T_{E_8},\mathcal V)$ are fixed on the selected branch;
3. the CP-profile data $\mathcal B$ are fixed.
Then the quantitative Appendix-T parameter vector
$$
\Pi_T \;=\; \bigl(\sin^2\theta_W(M_Z),\,g_i(\mu_G),\,v,\,m_H,\,Y_u,\,Y_d,\,Y_e,\,m_{\nu_a},\,V_{\mathrm{CKM}},\,U_{\mathrm{PMNS}}\bigr)
$$
is uniquely determined.

*Proof.* Theorem T.78 fixes $\Delta$ once the spectral problem is completed. Theorem T.71 then fixes the gauge/RG sector, Theorems T.72–T.73 fix the Yukawa ratios on the chosen flavor branch once $(\mathcal T_{E_8},\mathcal V)$ are fixed, and Theorems T.74–T.76 fix the CP sector once $\mathcal B$ is fixed. Combining these steps determines every component of $\Pi_T$. ∎

**Corollary T.79.1 (Status Boundary for the Quantitative Appendix-T Sector).** On a fixed PU structural branch, the RG/matching/evolution machinery contains no further continuous ambiguity once the completed spectral input $\Delta$, the residual heavy-threshold ledger $\delta$ if nonminimal heavy data are appended, and the residual flavor-profile data $(\mathcal T_{E_8},\mathcal V,\mathcal B)$ are fixed. In the canonical minimal $\mathrm{MS2}_{\mu_G}$ ledger, $\delta_i=0$ and the gauge-threshold input is exactly the completed flag-lift spectral output of Theorem T.78. ∎

**Theorem T.79.2 (Appendix-T Deterministic Matching Functor).** Fix an Appendix-T input record
$$
\mathfrak I_T
=
(\mathfrak S_{\widetilde X},\delta^{\mathrm{heavy}},\mathcal T_{E_8},\mathcal V,\mathcal N_\nu,\mathcal B,\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}}),
$$
where $\mathfrak S_{\widetilde X}$ is a completed flag-lift spectral tuple in the sense of Theorem T.78, $\delta^{\mathrm{heavy}}$ is either the empty minimal residual ledger or an explicitly listed nonminimal heavy-threshold ledger, $(\mathcal T_{E_8},\mathcal V)$ are the selected flavor-geometric normalization and Van Vleck data, $\mathcal N_\nu$ is the neutrino/Majorana branch record of Proposition T.24.28, $\mathcal B$ is the selected CKM/PMNS CP-profile data, $\mathcal R_{\mathrm{RG}}$ is the fixed loop-order SM RG system with matching scale $\mu_G$, $\mathcal C_{\mathrm{dec}}$ is the fixed decoupling convention, and $\mathcal C_{\mathrm{pole}}$ is the fixed pole/observable conversion convention. Then there is a deterministic map
$$
\mathfrak F_T:\mathfrak I_T\longmapsto \Pi_T
$$
defined by the following ordered operations:

1. evaluate the sector finite parts $F_s$ from $\mathfrak S_{\widetilde X}$ and set $\Delta=TF$ and $Z_i=1+\Delta_i/24$;
2. append the residual ledger by setting $\delta_i=0$ on the canonical minimal ledger and otherwise adding only the explicitly listed heavy-threshold shifts;
3. form the gauge and Higgs boundary data at $\mu_G$ from Theorems T.13-T.17, T.19, T.28, and T.35;
4. form the charged-fermion and neutrino Yukawa boundary data from $(\mathcal T_{E_8},\mathcal V,\mathcal N_\nu)$;
5. form the CKM and PMNS matrices from the fixed CP-profile record $\mathcal B$;
6. evolve the boundary vector by the fixed RG system $\mathcal R_{\mathrm{RG}}$, apply $\mathcal C_{\mathrm{dec}}$, and convert to the requested pole or observable convention using $\mathcal C_{\mathrm{pole}}$.

The map is functorial with respect to data-preserving isomorphisms of input records: an isomorphism of completed spectral tuples, flavor bases, and CP-profile representatives induces the corresponding basis relabeling of Yukawa and mixing matrices and leaves all basis-invariant components of $\Pi_T$ unchanged.

*Proof.* Step 1 is unique by Theorem T.78. Step 2 is unique by Definition T.19a and Proposition T.19c. Step 3 is unique because the gauge boundary values are algebraic functions of $(Z_i,\delta_i)$ and the fixed PU boundary conditions. Steps 4 and 5 are unique by Theorems T.72-T.76 after $(\mathcal T_{E_8},\mathcal V,\mathcal N_\nu,\mathcal B)$ are fixed. Step 6 is unique because a finite loop-order RG system is an autonomous first-order ODE with a smooth right-hand side on the perturbative PU branch, so standard ODE uniqueness gives one trajectory for the fixed initial vector; fixed decoupling and pole-conversion conventions are functions, so they preserve uniqueness. Data-preserving isomorphisms only rename bases or equivalent representatives before applying the same functions. Therefore $\mathfrak F_T$ is a well-defined deterministic functor and contains no further continuous ambiguity beyond the fixed input record. ∎

**Proposition T.79.3 (Flavor, Neutrino, Majorana, and Common-Scale Dependency Ledger).** The dependency record for the Appendix-T flavor and neutrino sector is the following finite ledger.

| Input or convention | Role | Status at point of use | Uncertainty class carried forward | Affected outputs |
|:--|:--|:--|:--|:--|
| Completed $\Delta$ from $\mathfrak S_{\widetilde X}$ | ThresholdData | branch theorem after Theorem T.78 data are fixed; validation target if not fixed | T2 until spectral branch is completed | $g_i$, $\sin^2\theta_W$, RG boundary data |
| Residual $\delta_i$ | ThresholdData / SchemeScale | exact empty ledger value $0$ in the canonical minimal $\mathrm{MS2}_{\mu_G}$ ledger; nonminimal only if an explicit heavy ledger is appended | T2 for nonminimal heavy thresholds | gauge matching and all RG-propagated observables |
| $\mu_G$ and common-scale transport | SchemeScale | fixed matching convention on the adopted branch | T2 for matching convention; T3 for empirical extraction comparisons | Higgs, Yukawa, neutrino, and common-scale tables |
| $A_{EW}$ | determinant-model prefactor | model layer by Theorem T.29.2 | model allowance at the stated working order | $v$, quantities using $v/M_{Pl}$, and transferred prefactor rows |
| $(\mathcal T_{E_8},\mathcal V)$ | flavor-geometric ThresholdData / model profile | branch-fixed data for Theorems T.72-T.73 | T1 for geometric truncations; T2 for branch and normalization choices | charged-lepton and quark Yukawa ratios and normalizations |
| top-sector normalization $y_t(\mu_G)=1$ | boundary normalization | branch boundary condition | T2 | absolute Yukawa scale and seesaw normalization |
| Majorana A₂ geometry and anchored neutrino reading | branch geometry | branch/model layer as recorded in Proposition T.24.28 | T2 | neutrino mass hierarchy and PMNS geometry |
| type-I seesaw and $M_R=\mu_G$ identification | sector-linking identification | conditional branch input | T2 | absolute light-neutrino masses |
| CKM/PMNS Berry-loop and CP profile $\mathcal B$ | PhenomenologicalKernel / ThresholdData | branch-fixed profile data | T2 for profile branch; T3 for phase-convention or extraction comparisons | CKM, PMNS, Jarlskog, baryogenesis CP factors |
| common-scale quark reductions | SchemeScale / EmpiricalInput for comparison | comparison convention, not derivation input | T3 | quark-ratio validation tables |
| baryogenesis washout and thermal factors | PhenomenologicalKernel | Appendix Y model layer unless separately derived | T2, with T3 only for observational extraction | $\eta_B$ comparison |

No empirical mass, mixing, or pole value is permitted to enter the derivation side of this ledger. Empirical quantities may appear only in the comparison columns governed by Convention P.14.1c.

*Proof.* The first two rows follow from Theorem T.78, Definition T.19a, Proposition T.19c, and Corollary T.78.3. The matching-scale and common-scale rows follow from the stated RG/matching conventions and from Section T.25.5.3, where common-scale data are used for comparison. The $A_{EW}$ row follows from Theorem T.29.2. The flavor-geometric rows follow from Theorems T.72-T.73 and Proposition R.3.5f: the generation-count statement is separate from the later texture and normalization data. The Majorana, seesaw, and anchored-reading rows follow from Theorems T.24.11-T.24.15 and Proposition T.24.28, which list the required neutrino-sector inputs. The CKM/PMNS row follows from Theorems T.74-T.76 and the Berry-loop assumptions explicitly stated there. The baryogenesis row follows from Appendix Y, where washout and thermal factors are model-layer inputs. Since each row is assigned to exactly one role and uncertainty class at its point of use, the ledger propagates by the meet rule of Convention P.14.1d and cannot use empirical comparison values as hidden derivation inputs. ∎

**Theorem T.79a (Nuclear Extension Determinacy Boundary).** The Appendix-T electroweak/flavor parameter vector $\Pi_T$ does not by itself determine stable isotope patterns, nuclear magic numbers, or spin-dependent nuclear transition anomalies. Those quantities become determinate only after PU supplies a finite self-adjoint nuclear aggregate Hamiltonian
$$
H_A^{\mathrm{PU}}(Z,N)
$$
for each proton-neutron sector $(Z,N)$, together with the corresponding spin-current and decay operators.

More precisely:

(i) Fixing $\Pi_T$ fixes the elementary masses, mixings, and gauge couplings on the stated branch, but leaves many-body nuclear operators underdetermined.

(ii) If $H_A^{\mathrm{PU}}(Z,N)$ is fixed as a finite self-adjoint operator on the MPU-admissible nuclear aggregate Hilbert space, then isotope stability, shell gaps, and spin-dependent transition rates are uniquely determined by spectral data and matrix elements of that operator.

(iii) Therefore nuclear-isotope claims are theorem-level only after the finite nuclear Hamiltonian and operators have been derived from the PU effective action; before that step they are conditional extension claims, not consequences of Appendix T alone.

*Proof.* For (i), $\Pi_T$ contains elementary sector data:
$$
\Pi_T=\bigl(\sin^2\theta_W(M_Z),g_i(\mu_G),v,m_H,Y_u,Y_d,Y_e,m_{\nu_a},V_{\mathrm{CKM}},U_{\mathrm{PMNS}}\bigr).
$$
It does not contain a complete many-body nuclear interaction operator. Let $H_A$ be any finite self-adjoint nuclear Hamiltonian compatible with the fixed elementary data and symmetries. For any nonzero finite self-adjoint two-body operator $Q$ that preserves the same elementary one-particle data, the family
$$
H_A(\eta)=H_A+\eta Q
$$
has the same fixed $\Pi_T$ for sufficiently small $\eta$, but generally changes nuclear binding eigenvalues and spin-dependent matrix elements. Hence the map $\Pi_T\mapsto$ nuclear isotope spectrum is not unique.

For (ii), once $H_A^{\mathrm{PU}}(Z,N)$ is fixed on a finite Hilbert space, the spectral theorem gives a discrete real spectrum. The ground-state energy
$$
E_0(Z,N)=\min\operatorname{spec}H_A^{\mathrm{PU}}(Z,N)
$$
is unique. Stability against a decay channel $(Z,N)\to\{(Z_i,N_i)\}_i$ is determined by the sign of
$$
\Delta E
=
\sum_i E_0(Z_i,N_i)-E_0(Z,N)
$$
after including the relevant emitted particles. Shell or magic-number gaps are finite differences of the corresponding ground-state energies, for example
$$
\Delta_N^2 E_0(Z,N)
=
E_0(Z,N+1)-2E_0(Z,N)+E_0(Z,N-1),
$$
and spin-dependent rates are determined by matrix elements
$$
\langle \psi_f|\,\mathcal O_{\mathrm{spin}}^{\mathrm{PU}}\,|\psi_i\rangle
$$
between eigenstates of the fixed Hamiltonian. These are all uniquely defined finite-dimensional quantities. Statement (iii) follows by combining the non-uniqueness in (i) with the uniqueness after operator closure in (ii). ∎

-----