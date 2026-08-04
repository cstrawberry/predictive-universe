# Appendix T: Electroweak Scale, Mixing, and Higgs Quartic from Golay-Steiner Structure

## T.1 Introduction

This appendix studies three electroweak questions: why the weak scale is so small, why the weak mixing angle has its observed size, and why the Higgs mass lies near its measured value. It separates exact structural results from matching assumptions, validation inputs, and still-open spectral calculations.

### Technical electroweak introduction

The electroweak sector presents three fundamental puzzles:

1. **The Hierarchy Problem**: Why is $v/M_{Pl} \sim 10^{-17}$?
2. **The Weinberg Angle**: Why is $\sin^2\theta_W(M_Z) \approx 0.231$?
3. **The Higgs Mass**: Why is $m_H \approx 125$ GeV (near the metastability boundary)?

Within the Predictive Universe framework, the electroweak exponent and the target-shift-dependent fixed-point quartic formula are derived from the Golay-Steiner/Grassmannian branch, while the numerical zero-slack value additionally requires the accepted moment-map datum of Definition T.22a. The quantitative gauge-threshold hierarchy is formulated on the minimal flag lift
$$
\pi:\widetilde X=\mathrm{Flag}_{1,2,3}(Q)\to \mathrm{Gr}(2,8)
$$
characterized by Theorem G.8.4e.1 in Appendix G. This appendix therefore uses a three-level scale dictionary that separates the PU fixed point $\mathfrak{A}_{PU}$, the lifted gauge-matching geometry, and the metastability scale $\mu_\lambda$:

$$
\boxed{
\begin{aligned}
v &= A_{EW} \, e^{-\kappa_{EW}} \, M_{Pl}, \quad \kappa_{EW} = 38.5 \\[6pt]
\sin^2\theta_W^{(0)} &= \frac{3}{8},\quad \sin^2\theta_W(\mu_G) = \frac{3 Z_2}{3 Z_2 + 5 Z_1} \quad \text{(Definition T.17; Definition T.17a)} \\[6pt]
\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU};\gamma) &= \frac{\gamma^2-1}{36},\qquad
\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU})=0\ \text{only on the accepted }\gamma=1\text{ branch}
\end{aligned}
}
$$

The appendix uses a three-level dictionary to separate the PU fixed point from physical matching scales:

- $\mathfrak{A}_{PU}$: the PU fixed point in theory space, characterized by PCE isotropy and capacity saturation (not an energy scale).
- $\mu_G$: the PU-to-SM matching scale at which canonically normalized gauge directions are identified with SM gauge kinetic terms. Its value $\mu_G=M_{Pl}e^{-9}\approx1.5\times10^{15}$ GeV is a matching-scale ansatz with a declared unreduced Planck convention; confinement counting does not derive the exponent. The seesaw branch reaches the same exponent independently, from its own scale map together with $\alpha_{UV}=3/2$ (Corollary T.41.3) and $d_{31}^2=6$ (Section T.24.5), giving $M_R=M_{Pl}e^{-9}$ in Theorem T.64. Theorem T.64a identifies the two only when both branches, exponents, and Planck conventions are jointly imposed, so the equality is not independent evidence for the matching ansatz. This identification is used throughout this appendix for all numerical results.
- $(\Delta_1,\Delta_2,\Delta_3)$: the flag-lift spectral threshold shifts above the PU bulk value $\alpha_U^{-1}=24$, defined by the canonical $\mathrm{MS2}_{\mu_G}$ sector functional of Definition T.17a and Convention T.69a. In this appendix the validation tuple
  $$
  (\Delta_1,\Delta_2,\Delta_3)=(15.14,20.94,18.41)
  $$
  is used only as an external comparison for the forward block-sum evaluation. Once the branch data required by Convention T.17a.0 and Theorem T.78 are fixed, the threshold calculation is the fixed map
  $$
  D^{\mathrm{PCE}}_{\widetilde X}\longmapsto F=(F_C,F_W,F_Y)\longmapsto \Delta=TF,
  $$
  with $T$ the candidate matrix subject to the commuting-sector gate of Remark T.17a.3 and with tails certified by Corollary T.69.1. Remark T.17a.4 and Proposition T.17a.5 remain the local no-go showing that a sector-independent affine local truncation cannot replace the global sector-resolving block sum. Theorem T.78.2 isolates the missing spectral branch data, Theorem T.78.5 closes the current-framework flag-lift status negatively, and Theorem T.78.14 classifies the present RHG, torsion, spectral-action, and equivalent spectral-source class as negatively closed for theorem-level electroweak threshold and Higgs finite-part intervals. Equivalently,
  $$
  Z_i = 1+\frac{\Delta_i}{24},
  $$
  so that $g_i(\mu_G)=g_U/\sqrt{Z_i}$ on any future accepted threshold branch; in the current PU-internal ledger the certificate interval for $\Delta_i$ and $Z_i$ is $\varnothing_{\mathrm{cert}}$.
- $\mu_\lambda$: the metastability crossing scale defined by $\lambda(\mu_\lambda)=0$ in the SM effective theory; $\mu_\lambda$ is an output of RG evolution from boundary conditions at $\mu_G$.

-----

# Part I: Electroweak Scale Derivation

## T.2 Review of Golay-Steiner Structure

### T.2.1 Foundational Constants

The following constants are derived in the main text and Appendix Z:

|Constant |Value |Origin |Reference |
|:-----------------------------|:----------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------|
| $K_0$ | 3 bits | Least visited-context log-capacity on the (O1)–(O3), (FC) branch | Theorem 15 |
|$d_0$ |8 on the minimal Appendix Z branch |MPU Hilbert space dimension: lower bound from Theorem 23, equality from Theorem Z.2 |Theorem 23; Theorem Z.2 |
|$\varepsilon_0$ |$\ln2$ structurally |Log-cardinality of the registered reachable binary verification quotient; no physical heat equality is asserted |Definition 28; Theorem J.1 |


|$a$ |2 |Active kernel dimension on the attractor-saturating branch (Theorem Z.1) |Theorem Z.1 |
|$b$ |6 |Inactive subspace dimension ($d_0 - a$) |Definition |
|$M$ |24 |QFI interface mode count ($2ab$) |Theorem Z.5 |
|$k$ |12 |Golay code dimension ($M/2$) on the predictive-recovery MacWilliams branch |Definition Z.13b.0; Theorem Z.13b.0a |
|$D$ |4 |Euclidean response-carrier dimension; any spacetime use requires the separate continuum/Lorentzian promotion certificates |Definition Z.9a; Theorems Z.10-Z.11; Corollary P.8.3 |
|$n_G$ |12 |Gauge algebra dimension |Corollary G.8.4c|
|$(\kappa_1,\kappa_2,\kappa_3)$|$(0.695,\,0.729,\,1.140)$|Branch optimum on the imposed $c_\ell/c_d = 8/3$ normalization branch |Corollary T.34.2 (with imposed Corollary T.34.1) |
|$g_U^2$ |$2\pi/(M\chi_U)$; $\pi/6$ when $M=24$ and $\chi_U=1/2$ |Bures-gauge holonomy coefficient on the specified calibration branch |Theorem T.39a; Theorem T.39a.2 |

|$\alpha_U^{-1}$ |$2M\chi_U$; $24$ when $M=24$ and $\chi_U=1/2$ |Inverse matching-scale gauge coefficient on the same calibration branch |Theorem T.39a; Theorem T.39a.2 |
|$(\Delta_1,\Delta_2,\Delta_3)$ |$(15.14,\,20.94,\,18.41)$ (validation target tuple); current theorem-level certificate interval $\varnothing_{\mathrm{cert}}$ |Flag-lift spectral threshold shifts above $\alpha_U^{-1}=24$; the displayed tuple is used only to compare with the forward $\mathrm{MS2}_{\mu_G}$ block-sum calculation after $D^{\mathrm{PCE}}_{\widetilde X}$, the Golay/parity construction, the structural parameters, and the tail certificate are fixed. Remark T.17a.4 and Proposition T.17a.5 show that any sector-independent local affine truncation still forces $F_Y>0$, so the operative object is the global sector-resolving spectral functional on $\widetilde X$ rather than the local affine truncation. Theorem T.78.2 states the current non-closure of those missing branch data in the canonical ledger, Theorem T.78.5 proves that no PU-internal branch package supplies them from the current framework, and Theorem T.78.14 proves that the current RHG, torsion, spectral-action, and equivalent spectral-source class supplies no certified $\Delta_i$, $Z_i$, $\mu_H^2$, $\lambda_H$, or gauge/Higgs finite-part intervals |Definition T.17a / Remark T.17a.4 / Prop. T.17a.5 / Theorem T.18 / Theorem T.78.2 / Theorem T.78.5 / Theorem T.78.14 |

The matching-scale branch uses the independent ansatz $\mu_G=M_{Pl}e^{-9}$. The seesaw branch independently uses $M_R=M_{Pl}e^{-9}$. They are equal only on the joint convention branch of Theorem T.64a; confinement counting does not derive either exponent.

**Theorem T.2.1a (Minimal Electroweak Mass-Bridge Representation).** On the locked one-family chiral branch
$$
Q=(3,2)_{1/6},
\qquad
u^c=(\bar3,1)_{-2/3},
\qquad
d^c=(\bar3,1)_{1/3},
$$
$$
L=(1,2)_{-1/2},
\qquad
e^c=(1,1)_1,
$$
suppose charged fermion masses must arise from local gauge-invariant operators using the smallest scalar representation, with no vectorlike mirror family and no gauge-null sterile singlet required at this stage. Then the unique scalar representation, up to conjugation convention, is
$$
H=(1,2)_{1/2}.
$$
It permits the minimal charged-fermion Yukawa bridges
$$
QHu^c,
\qquad
QH^\dagger d^c,
\qquad
LH^\dagger e^c,
$$
and a nonzero vacuum
$$
\langle H\rangle
=
\frac1{\sqrt2}
\begin{pmatrix}
0\\
v
\end{pmatrix}
$$
breaks
$$
SU(2)_L\times U(1)_Y\to U(1)_{\mathrm{em}},
$$
with unbroken generator
$$
Q_{\mathrm{em}}=T_3+Y.
$$

*Proof.* A bare left-Weyl mass term $\psi_i\psi_j$ must be a gauge singlet. The chiral package above forbids direct charged masses because
$$
Q u^c\supset(1,2)_{-1/2},
\qquad
Q d^c\supset(1,2)_{1/2},
\qquad
L e^c=(1,2)_{1/2},
$$
so each charged mass bridge leaves a weak doublet. A scalar singlet cannot remove this residual weak charge. Since $3\otimes\bar3$ already contains a color singlet and $Le^c$ is colorless, any nontrivial color charge on the scalar either fails the lepton bridge or adds response-active color structure beyond the minimal mass bridge. Thus the minimal scalar is colorless. In $SU(2)$ representation theory, $2\otimes R$ contains a singlet only for $R=2$, so the smallest scalar capable of bridging a weak doublet to a weak singlet is itself a weak doublet.

For the up-type bridge, gauge invariance of $QHu^c$ requires
$$
Y(Q)+Y(H)+Y(u^c)=0.
$$
Substituting the locked hypercharges gives
$$
\frac16+Y(H)-\frac23=0,
$$
hence
$$
Y(H)=\frac12.
$$
Thus the minimal up-type scalar is $H=(1,2)_{1/2}$.

The conjugate field has
$$
H^\dagger=(1,2)_{-1/2}.
$$
For the down-type bridge,
$$
Y(Q)+Y(H^\dagger)+Y(d^c)
=
\frac16-\frac12+\frac13
=
0,
$$
so $QH^\dagger d^c$ is gauge invariant. For the charged-lepton bridge,
$$
Y(L)+Y(H^\dagger)+Y(e^c)
=
-\frac12-\frac12+1
=
0,
$$
so $LH^\dagger e^c$ is gauge invariant. Hence one scalar doublet supplies all three charged mass bridges.

The Higgs vacuum can be gauge-rotated to
$$
\langle H\rangle
=
\frac1{\sqrt2}
\begin{pmatrix}
0\\
v
\end{pmatrix}.
$$
The lower component has $T_3=-1/2$ and $Y=1/2$, so
$$
(T_3+Y)\langle H\rangle=0.
$$
Therefore the unbroken generator is $Q_{\mathrm{em}}=T_3+Y$, and the broken generators are the other three directions of $SU(2)_L\times U(1)_Y$. Thus
$$
SU(2)_L\times U(1)_Y\to U(1)_{\mathrm{em}}.
$$
A scalar of higher weak representation or different hypercharge either fails at least one bridge or adds response-active scalar structure beyond the minimal mass bridge. ∎

**Corollary T.2.1b (Tree-Level Electroweak Mass Relations).** On the same branch, the leading scalar kinetic term
$$
(D_\mu H)^\dagger(D^\mu H)
$$
with
$$
D_\mu H
=
\left(
\partial_\mu
+\frac{i g_2}{2}\sigma^a W_\mu^a
+\frac{i g_Y}{2}B_\mu
\right)H
$$
gives
$$
m_W=\frac12 g_2v,
\qquad
m_Z=\frac12v\sqrt{g_2^2+g_Y^2},
$$
and leaves the photon massless. The weak mixing angle satisfies
$$
\sin\theta_W=\frac{g_Y}{\sqrt{g_2^2+g_Y^2}},
\qquad
\cos\theta_W=\frac{g_2}{\sqrt{g_2^2+g_Y^2}},
$$
and
$$
e=g_2\sin\theta_W=g_Y\cos\theta_W.
$$

*Proof.* Inserting the vacuum into $(D_\mu H)^\dagger(D^\mu H)$ gives the charged mass term for
$$
W_\mu^\pm=\frac1{\sqrt2}(W_\mu^1\mp iW_\mu^2)
$$
with $m_W=g_2v/2$. The neutral mass term is proportional to
$$
\frac{v^2}{8}(g_2W_\mu^3-g_YB_\mu)^2.
$$
Thus the massive neutral field is
$$
Z_\mu=\cos\theta_W W_\mu^3-\sin\theta_W B_\mu,
$$
with $m_Z=v\sqrt{g_2^2+g_Y^2}/2$, and the orthogonal field
$$
A_\mu=\sin\theta_W W_\mu^3+\cos\theta_W B_\mu
$$
is massless. The displayed angle and electric-charge identities are the unique orthogonal diagonalization of this $2\times2$ neutral mass matrix. ∎

### T.2.2 The Golay Code Structure

**Definition T.1a** (Extended Binary Golay Code). The extended binary Golay code $\mathcal{G}_{24}$ is the binary linear code with parameters $[24,12,8]$, unique up to coordinate permutation [MacWilliams & Sloane 1977]:

- Block length $n=M=24$
- Dimension $k=12$
- Minimum distance $d_{\min}=8$
- Error correction capacity $t=\lfloor(d_{\min}-1)/2\rfloor=3$

After fixing a systematic coordinate frame, the code admits a generator matrix
$$
G=[I_{12}\mid P],
$$
where $I_{12}$ is the $12\times12$ identity and $P$ is the parity matrix. The code detects up to $7$ errors and corrects up to $3$ errors per block.

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

This matrix satisfies
$$
PP^T\equiv I_{12}\pmod2.
$$
Consequently the systematic generator
$$
G=[I_{12}\mid P]
$$
obeys
$$
GG^T
=
I_{12}+PP^T
\equiv0\pmod2.
$$
Thus the generated code is self-orthogonal; since its dimension is $12=24/2$, it is self-dual. With minimum distance $8$, it is a representative of the unique coordinate-permutation equivalence class of binary linear $[24,12,8]$ codes, namely the extended binary Golay code $\mathcal G_{24}$.

**Convention T.2.1** (Real lift). Throughout this appendix, when $P$ acts on real or integer vectors (as in $p = Ps$ with $s\in\mathbb{R}^{12}$), it denotes the $\{0,1\}$-entry matrix with standard real multiplication. Over $\mathbb{F}_2$, the same symbol denotes reduction mod 2. Context determines which is meant; explicit qualification is given only where ambiguity could arise.

**Lemma T.1b** (Row Weight Property). For the Golay parity matrix $P$ in Definition T.2a, the row sums (computed over $\mathbb{Z}$ via Convention T.2.1) satisfy:
$$
\sum_{j=1}^{12} P_{1j} = 11, \quad \sum_{j=1}^{12} P_{ij} = 7 \quad \text{for all } i \in \{2, \ldots, 12\}
$$

In particular, no row of $P$ sums to 1, so $P\mathbf{1}_{12} \neq \mathbf{1}_{12}$.

*Proof.* Direct computation from Definition T.2a. The first row is $[0,1,1,1,1,1,1,1,1,1,1,1]$ with sum 11. Rows 2–12 each contain exactly 7 ones. ∎

### T.2.3 The Signal-Parity Decomposition

**Proposition T.1c** (Signal-Parity Structure on the Predictive-Recovery MacWilliams Branch). On the predictive-recovery MacWilliams branch — the same branch supplied by Definition Z.13b.0 and Theorem Z.13b.0a (Appendix Z), and propagated to Theorem P.13.12 (Appendix P) and Theorem R.4.4 (Appendix R) — the $M = 24$ QFI interface modes decompose into:

- **Signal subspace** $\mathcal{S}$: $k = 12$ information-carrying modes
- **Parity subspace** $\mathcal{P}$: $k = 12$ redundancy modes

with the parity modes determined by $p = Ps$ for signal vector $s$.

*Proof.* On the predictive-recovery MacWilliams branch, Theorem Z.13b.0a fixes the split of the $M=24$ interface modes into $k=M/2=12$ information modes and $M-k=12$ redundancy modes, and Theorem Z.13b then selects the extended binary Golay code $[24,12,8]$. The generator matrix $G=[I_{12}\mid P]$ maps 12-bit signals to 24-bit codewords, establishing the decomposition. ∎

-----

## T.3 The Electroweak Configuration Space

### T.3.1 Left-Chiral Sector

The connected-cover notation $SU(3)_C\times SU(2)_L\times U(1)_Y$ represents the twelve-dimensional gauge algebra selected in Appendix G. The global form, including a possible quotient by $\mathbb Z_6$, requires the determinant/global-form certificate. The electroweak sector $SU(2)_L \times U(1)_Y$ has dimension 4 and acts on left-chiral fermions.

**Definition T.3a** (Left-Chiral Information Modes on the Weak-Left Projection Branch). On the weak-left projection branch — under which the $SU(2)_L$ chiral interaction selects exactly $k/2 = 6$ of the $k = 12$ Golay signal modes — the left-chiral projection $\Pi_L: \mathbb{R}^{12} \to \mathbb{R}^6$ is the rank-6 projection onto these directions:
$$
x = \Pi_L s, \quad x \in \mathbb{R}^6, \quad s \in \mathbb{R}^{12}
$$
where $\Pi_L \in \mathbb{R}^{6 \times 12}$ satisfies $\Pi_L \Pi_L^T = I_6$.

The factor $k/2 = 6$ reflects the chiral asymmetry of the weak interaction on the weak-left projection branch. On the signal-pair Lagrangian branch below, the rank-six statement is forced by maximal isotropy of the signal symplectic form; the remaining choice is the weak-left orientation line fixed by the $SU(2)_L$ chirality label.

**Definition T.3a.1** (Signal-Pair Symplectic Datum). On the signal-pair branch, the Golay signal space $\mathcal S\simeq\mathbb R^{12}$ carries the factorization
$$
\mathcal S=\mathcal G_6\otimes\mathbb R^2,
\tag{T.3a.1}
$$
where $\mathcal G_6$ is a six-dimensional real Euclidean carrier with metric $g_{\mathcal G}$ and $\mathbb R^2$ carries the standard symplectic form $\varepsilon$ with $\varepsilon(e_1,e_2)=1$. Define
$$
\omega_{\mathrm{sig}}(a\otimes u,b\otimes v)
=
g_{\mathcal G}(a,b)\,\varepsilon(u,v).
\tag{T.3a.2}
$$
The weak-left orientation datum is a unit line $\ell_L\subset\mathbb R^2$ singled out by the retained $SU(2)_L$ chirality label. The weak-left signal plane is
$$
L_L:=\mathcal G_6\otimes\ell_L\subset\mathcal S.
\tag{T.3a.3}
$$
The projection $\Pi_L$ is the $L_{\mathrm{info}}$-orthogonal projection from $\mathcal S$ onto $L_L$ after the canonical basis choice of Lemma T.5b.

**Theorem T.3a.2** (Lagrangian Half-Polarization Rank). On the signal-pair symplectic branch of Definition T.3a.1, $L_L$ is a Lagrangian subspace of $(\mathcal S,\omega_{\mathrm{sig}})$ and
$$
\dim L_L=6.
\tag{T.3a.4}
$$
Therefore the weak-left active rank is
$$
n_L=6=\frac{k}{2}.
\tag{T.3a.5}
$$

*Proof.* Since $g_{\mathcal G}$ is nondegenerate and $\varepsilon$ is nondegenerate, $\omega_{\mathrm{sig}}$ is a nondegenerate alternating form on the $12$-dimensional space $\mathcal S$. Hence every Lagrangian subspace of $\mathcal S$ has dimension $12/2=6$.

For $a,b\in\mathcal G_6$ and $u,v\in\ell_L$, the line $\ell_L$ is one-dimensional, so $\varepsilon(u,v)=0$. Therefore
$$
\omega_{\mathrm{sig}}(a\otimes u,b\otimes v)=0,
$$
which shows that $L_L$ is isotropic. Its dimension is
$$
\dim(\mathcal G_6\otimes\ell_L)=6\cdot1=6,
$$
so it is maximally isotropic and therefore Lagrangian. The rank of the orthogonal projection onto $L_L$ is $\dim L_L=6$, giving $n_L=6$. ∎

### T.3.2 Reservoir Coupling

**Definition T.4a** (Reservoir Coordinates). The reservoir space $\mathcal{R} = \mathbb{R}^b$ with $b = 6$ represents the inactive subspace dimensions that couple to the active interface modes.

**Definition T.5a** (Alignment Constraints on the Weak-Left Projection Branch). On the weak-left projection branch (Definition T.3a), and on the signal-pair Lagrangian branch when Theorem T.3a.2 is active, the electroweak vacuum requires alignment between the left-chiral information modes $x \in \mathbb{R}^6$ and the reservoir coordinates $r \in \mathbb{R}^6$. The number of independent alignment constraints is:
$$
N_0 = b \times \frac{k}{2} = 6 \times 6 = 36.
$$
Off the Lagrangian half-polarization branch, the legacy Gaussian comparator replaces $N_0$ by $bn_L$. If a separate fluctuation model registers $n_{\mathrm{coset}}^{\mathbb C}$ complex channels and a compact $m$-dimensional zero-mode manifold, its Gaussian power is
$$
\widetilde\kappa_{\mathrm{G}}
=bn_L+n_{\mathrm{coset}}^{\mathbb C}-\frac m2.
$$
This comparator controls a prefactor power on that fluctuation model. It is not the electroweak action $\kappa_{EW}$ of Definition T.13, which is fixed by the Steiner incidence minimization of Theorem T.5.

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

**Definition T.8a** (Residual Gauge Coordinate). Let $\psi \in \mathbb{R}/2\pi\mathbb{Z}$ parametrize the surviving $U(1)_{em}$ gauge angle.

-----

## T.4 The Discrete Electroweak Action

### T.4.1 Embedding Map

**Definition T.9a** (Information-to-Full Embedding). The embedding map $T: \mathbb{R}^{12} \to \mathbb{R}^{24}$ encodes the Golay parity structure:
$$
Ts
=
\begin{pmatrix}
s\\
Ps
\end{pmatrix}
=
\begin{pmatrix}
I_{12}\\
P
\end{pmatrix}s.
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
L_{\mathrm{info}} = \frac{1}{24} T^T A_{oct} T = \frac{176}{24} T^T \left(I_{24} - \frac{1}{24}\mathbf{1}_{24}\mathbf{1}_{24}^T\right) T
$$

This is a $12 \times 12$ matrix acting on information coordinates $s \in \mathbb{R}^{12}$.

**Theorem T.1** (Strict Positivity of $L_{\mathrm{info}}$). The Golay-Steiner Laplacian is strictly positive definite:
$$
L_{\mathrm{info}} \succ 0
$$

*Proof.*

**Step 1** (Kernel exclusion). We show $\mathbf{1}_{24} \notin \operatorname{im}(T)$. Suppose $\mathbf{1}_{24} = Ts$ for some $s \in \mathbb{R}^{12}$. Then:

- Upper block: $s = \mathbf{1}_{12}$
- Lower block: $Ps = \mathbf{1}_{12}$

By Lemma T.1b, $P\mathbf{1}_{12} = (11, 7, 7, \ldots, 7)^T \neq \mathbf{1}_{12}$. Therefore no $s$ maps to $\mathbf{1}_{24}$.

**Step 2** (Positivity inheritance). Since $\ker(A_{oct}) = \operatorname{span}(\mathbf{1}_{24})$ and $\mathbf{1}_{24} \notin \operatorname{im}(T)$, the restriction of $A_{oct}$ to $\operatorname{im}(T)$ is positive definite. Therefore $L_{\mathrm{info}} \succ 0$. ∎

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
- $\varepsilon_0=\ln2$: structural binary log-cardinality of the registered verification quotient (Definition 28; Theorem J.1)

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
**Definition T.13 (Steiner Incidence Electroweak Action).** Let $\mathcal P_2([24])$ be the $276$ unordered pairs of interface labels and let $\mathcal O_8$ be the octads of the Steiner system $S(5,8,24)$. Define
$$
B_{O,p}:=\mathbf1_{\{p\subset O\}},
\qquad
N:=B^{\mathsf T}B.
\tag{T.13.1}
$$
The active kernel selects one pair $p_A$. A registered unit electroweak update is an absolutely continuous path
$$
x:[0,1]\longrightarrow\mathbb R^{\mathcal P_2([24])},
\qquad
x(0)=0,\quad x(1)=e_{p_A},
$$
with dimensionless response action
$$
\mathcal I_{EW}[x]
:=
\frac12\int_0^1\|B\dot x(t)\|_2^2\,dt.
\tag{T.13.2}
$$
Define the electroweak structural exponent by
$$
\kappa_{EW}
:=
\inf_x\mathcal I_{EW}[x].
\tag{T.13.3}
$$
The interval and endpoints are fixed by the registered unit update; reparameterizations that do not preserve this unit-response clock are different implementations.

**Principle T.13a (Electroweak Response-Action Closure).** On the fundamental active-pair branch, the least registered response action (T.13.3) is the semiclassical suppression exponent of that update. Fluctuation determinants, gauge volumes, and the residual $U(1)$ orbit multiply the saddle weight and do not alter $\kappa_{EW}$. This is a falsifiable physical closure principle, separate from the Steiner counting theorem.

### T.6.2 Main Result
**Theorem T.5 (Steiner Electroweak Action).** For the action of Definition T.13,
$$
N=72I+16A_1+5J,
\tag{T.5.1}
$$
where $A_1$ is the adjacency matrix of the Johnson graph $J(24,2)$ and $J$ is the all-ones matrix. Its spectrum is
$$
\operatorname{Spec}(N)
=
\{2156^{(1)},\,392^{(23)},\,40^{(252)}\},
\tag{T.5.2}
$$
so $N$ is positive definite. The unique minimizing path is
$$
x_*(t)=t e_{p_A},
\tag{T.5.3}
$$
and
$$
\boxed{\kappa_{EW}=\mathcal I_{EW}[x_*]=\frac{77}{2}=38.5.}
\tag{T.5.4}
$$

*Proof.* A fixed pair lies in $77$ octads. Two distinct pairs sharing one point have a three-point union and lie together in $21$ octads; disjoint pairs have a four-point union and lie together in $5$ octads. Hence
$$
N=77I+21A_1+5(J-I-A_1)=72I+16A_1+5J.
$$
The Johnson adjacency spectrum is
$$
44^{(1)},\quad20^{(23)},\quad(-2)^{(252)},
$$
and $J$ has eigenvalue $276$ on the constant vector and zero on its orthogonal complement. This gives (T.5.2).

For every admissible path, Cauchy–Schwarz in the positive inner product $\langle u,v\rangle_N=u^{\mathsf T}Nv$ gives
$$
\int_0^1\dot x^{\mathsf T}N\dot x\,dt
\ge
\left(\int_0^1\dot x\,dt\right)^{\mathsf T}
N
\left(\int_0^1\dot x\,dt\right)
=e_{p_A}^{\mathsf T}Ne_{p_A}.
$$
Equality holds exactly when $\dot x$ is constant, proving (T.5.3) and uniqueness. Finally,
$$
e_{p_A}^{\mathsf T}Ne_{p_A}
=\sum_O B_{O,p_A}^2
=77,
$$
so (T.13.2) gives $\kappa_{EW}=77/2$. ∎

**Corollary T.5c (Steiner Incidence Diagonal Identity).** For every active pair $p$,
$$
2\kappa_{EW}
=e_p^{\mathsf T}B^{\mathsf T}Be_p
=\lambda_2(S(5,8,24))
=77.
$$

*Proof.* The quadratic action contributes the factor $1/2$. The diagonal matrix element counts octads containing $p$, and the Steiner parameter is
$$
\lambda_2
=\frac{\binom{22}{3}}{\binom63}
=77.
$$
Theorem T.5 proves that the straight unit-update path attains this diagonal action. ∎

**Remark T.5d (Status of the Steiner–Electroweak Identity).** The equality is not a coincidence between an electroweak zero-mode count and an unrelated design number. Definition T.13 constructs the electroweak response action directly from the pair-octad incidence operator, and Principle T.13a is the explicit, testable action-to-suppression bridge. A different response operator, endpoint, or unit-update clock defines a different branch.

**Definition T.5d.1 (Active-Pair Steiner Incidence Projector).** Let $\mathcal O_8$ be the set of octads of the Steiner system $S(5,8,24)$ and let
$$
\mathcal P_2([24])=\{\{i,j\}:1\le i<j\le24\}
$$
be the set of unordered pairs of interface labels. Define the pair-octad incidence matrix
$$
B_{O,p}
=
\begin{cases}
1,& p\subset O,\\
0,& p\not\subset O,
\end{cases}
\qquad
O\in\mathcal O_8,\ p\in\mathcal P_2([24]).
\tag{T.5d.1}
$$
The Golay-Steiner pair-incidence operator is
$$
\mathcal N_{\mathrm{GS}}:=B^TB
\tag{T.5d.2}
$$
on $\mathbb R^{\mathcal P_2([24])}$. On the active-kernel branch $a=2$, the active MPU kernel selects one unordered active pair $p_A\in\mathcal P_2([24])$. The associated electroweak active-pair projector is
$$
P_{\mathrm{EW}}^{(2)}
=
|e_{p_A}\rangle\langle e_{p_A}|.
\tag{T.5d.3}
$$
Since the Golay-Steiner automorphism group is pair-transitive, the trace below is independent of the representative active pair.

**Theorem T.5d.2 (Steiner Pair-Projector Electroweak Identity).** On the active-pair weak-left branch of Definition T.3a and Definition T.5d.1,
$$
\operatorname{Tr}\!\left(P_{\mathrm{EW}}^{(2)}\mathcal N_{\mathrm{GS}}\right)
=
\lambda_2(S(5,8,24))
=
77.
\tag{T.5d.4}
$$
Consequently the registered fixed-time electroweak response action satisfies the projector identity
$$
\boxed{
\kappa_{EW}
=
\frac12
\operatorname{Tr}\!\left(P_{\mathrm{EW}}^{(2)}\mathcal N_{\mathrm{GS}}\right)
=
\frac{77}{2}.
}
\tag{T.5d.5}
$$

*Proof.* By Definition T.5d.1,
$$
\operatorname{Tr}\!\left(P_{\mathrm{EW}}^{(2)}\mathcal N_{\mathrm{GS}}\right)
=
\langle e_{p_A},B^TBe_{p_A}\rangle
=
\sum_{O\in\mathcal O_8}B_{O,p_A}^2.
$$
Because $B_{O,p_A}\in\{0,1\}$, this sum is exactly the number of octads containing the active pair $p_A$. In a Steiner system $S(5,8,24)$, the number of blocks containing a fixed pair is
$$
\lambda_2
=
\frac{\binom{24-2}{5-2}}{\binom{8-2}{5-2}}
=
\frac{\binom{22}{3}}{\binom{6}{3}}
=
\frac{1540}{20}
=
77.
$$
This proves (T.5d.4). The factor $1/2$ in (T.5d.5) is the quadratic-action normalization in Equation (T.13.2); Theorem T.5 proves that the unit active-pair path has squared incidence length $77$. Therefore Theorem T.5 and (T.5d.4) give
$$
\kappa_{EW}=\frac{77}{2}.
$$
∎

**Corollary T.5d.3 (Closure of the Active-Pair Steiner-Electroweak Gate).** On the active-pair weak-left branch, the equality $2\kappa_{EW}=77$ is not an independent numerical coincidence: it is the diagonal trace of the canonical Golay-Steiner pair-incidence operator against the active two-mode MPU projector.

*Proof.* Theorem T.5d.2 derives the value $77$ from the pair-incidence structure of $S(5,8,24)$ and identifies the electroweak complexity with one half of that trace. The active projector is fixed by the $a=2$ MPU kernel, while $\mathcal N_{\mathrm{GS}}$ is fixed by the Steiner octad system. No validation datum or adjustable continuous parameter enters the identity. ∎

-----

## T.7 Numerical Verification of Electroweak Scale

### T.7.1 Scale Prediction
**Principle T.6a (Semiclassical Scale Bridge).** On the registered electroweak branch, the order-parameter scale responds to the least unit-update action by
$$
\frac v{M_{Pl}}=A_{EW}e^{-\kappa_{EW}},
\tag{T.6a.1}
$$
where $M_{Pl}$ uses the unreduced convention and $A_{EW}$ is the forward determinant, gauge-volume, and matching prefactor computed on the same saddle. The relation is a physical scale-bridge principle: it is testable and is not inferred from a Gaussian power count.

**Theorem T.6 (Electroweak Scale on the Response-Action Branch).** Principles T.13a and T.6a and Theorem T.5 give
$$
\boxed{
v=A_{EW}e^{-77/2}M_{Pl}.
}
$$

*Proof.* Theorem T.5 gives $\kappa_{EW}=77/2$. Substitution in (T.6a.1) proves the formula. The exponent is fixed by the Steiner response action; the numerical scale is a forward prediction once $A_{EW}$ is evaluated rather than fitted. ∎
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

**Corollary T.6b (Planck-Normalization Non-Exchangeability).** The exponent $\kappa_{EW}=38.5$ in Theorem T.6 is calibrated to the unreduced Planck mass $M_{Pl}$ used throughout Appendix T. Since
$$
M_{Pl}=\sqrt{8\pi}\,\bar M_{Pl},
\tag{T.6b.1}
$$
replacing $M_{Pl}$ by the reduced Planck mass $\bar M_{Pl}$ while keeping $A_{EW}$ and $\kappa_{EW}$ fixed changes the branch by the factor $(8\pi)^{-1/2}$:
$$
\bar M_{Pl}e^{-38.5}
=
\frac{M_{Pl}e^{-38.5}}{\sqrt{8\pi}}
\approx
46.3\ \mathrm{GeV}.
\tag{T.6b.2}
$$
Thus the electroweak branch cannot exchange $M_{Pl}$ for $\bar M_{Pl}$ without either adding the compensating factor $\sqrt{8\pi}$ to the prefactor ledger or changing the exponent ledger.

*Proof.* Equation (T.6b.1) is the defining relation between the reduced and unreduced Planck masses. Substituting it into $e^{-\kappa_{EW}}M_{Pl}$ gives $e^{-\kappa_{EW}}\sqrt{8\pi}\,\bar M_{Pl}$. Holding the exponent and determinant prefactor fixed while replacing $M_{Pl}$ by $\bar M_{Pl}$ therefore rescales the predicted vacuum expectation value by $(8\pi)^{-1/2}$. This is a different normalization branch, not the branch of Theorem T.6. ∎

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

**Theorem T.7** (Mechanism-Separated Hierarchy Ledger). The vacuum and electroweak hierarchies use the same registered $M=24$ discrete backbone but different action operators:

|Quantity |Vacuum branch (Appendix U) |Electroweak branch (Appendix T) |
|:--|:--|:--|
|Carrier |$\operatorname{Gr}_{\mathbb C}(12,24)$ Hessian problem |$S(5,8,24)$ pair-to-octad incidence response |
|Discrete action |$\kappa_\Lambda=(288-m_\Lambda)/2$ |$\kappa_{EW}=\frac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}$ |
|Registered value |$141.5$ for $m_\Lambda=5$; $142$ for $m_\Lambda=4$ |$77/2=38.5$ |
|Zero modes |They enter $m_\Lambda$ in the vacuum Hessian ledger |Gaussian zero modes enter the determinant/prefactor ledger, not $\kappa_{EW}$ |
|Scale law |$\Lambda L_P^2=8\pi A_{\mathrm{eff}}e^{-2\kappa_\Lambda}$ |$v/M_{Pl}=A_{EW}e^{-\kappa_{EW}}$ |

*Proof.* Appendix U supplies the vacuum Hessian dimension $288$, the branch value $m_\Lambda$, and the stated exponent. Definition T.13 and Theorem T.5 give
$$
e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}=77
$$
and the fixed-time response action $77/2$; Principle T.13a identifies that action with the electroweak exponent. The determinant and Gaussian-mode records enter $A_{\mathrm{eff}}$ and $A_{EW}$ on their respective branches. Therefore the two rows share discrete inputs but not a zero-mode action formula. ∎

-----

## T.9 Experimental Predictions (Scale)

### T.9.1 Quantization Signature

**Prediction T.1** (Electroweak Action Rigidity). On the registered Steiner branch, relabeling the active pair leaves $\kappa_{EW}=77/2$ invariant. A different response endpoint $u$ or incidence operator $B'$ changes the exponent only by the computed action difference
$$
\Delta\kappa_{EW}=\frac12\left(u^{\mathsf T}{B'}^{\mathsf T}B'u-e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}\right).
$$
At fixed prefactor the scale changes by $e^{-\Delta\kappa_{EW}}$. Electroweak Gaussian zero modes alter the prefactor ledger and do not shift this action.

### T.9.2 No Fourth Generation

**Prediction T.2** (No Additional Sequential Generation on the Family-Redundancy Branch). The framework predicts exactly three realized fermion generations on the Appendix R anomaly+CP minimality route together with the pre-flavor family-redundancy PPI branch. A fourth sequential generation would require an additional response-distinct chiral family sector. On this branch, response-null copies are removed by the PPI quotient, while response-distinct copies change the finite family-charge, anomaly, or flavor certificate and leave the branch.

The prediction has empirical content because the existing $M=24$, $D=4$, $k=12$ ledger imports the Appendix R anomaly+CP family route as its realized family-count branch. Discovery of a fourth sequential generation matching the Standard-Model gauge structure would therefore falsify that branch, and any replacement would have to supply a new registered family/anomaly certificate compatible with the already constrained $M=24$, $D=4$, and $k=12$ closures. Thus T.2 is not a free multiplicity adjustment inside the recurrent minimal ledger $\mathfrak L_0$ of Definition P.16a.2; it is a branch falsifier for the current Appendix R family-count route.

-----

# Part II: Weinberg Angle Derivation

## T.10 The Electroweak 5-Plane

### T.10.1 Decomposition of the Inactive Subspace

**Theorem T.8 (Complex Electroweak Carrier on the Ordered Full-Block Branch).** On the ordered flag lift $\pi:\widetilde X=\mathrm{Flag}_{1,2,3}(Q)\to X=\mathrm{Gr}(2,8)$ of Theorem G.8.4c.0c, whose block ranks are fixed by the inactive-sector certificate of Theorem G.8.4b,
$$
\pi^*Q
\cong
\widetilde Q_C\oplus\widetilde Q_W\oplus\widetilde Q_Y,
\qquad
\operatorname{rk}_{\mathbb C}
(\widetilde Q_C,\widetilde Q_W,\widetilde Q_Y)
=(3,2,1).
$$
The electroweak normalization carrier is the complex rank-$5$ bundle
$$
W_5:=\widetilde Q_C\oplus\widetilde Q_W.
$$
It is unique up to independent $U(3)\times U(2)$ block-frame changes once the ordered full-block certificate is fixed. A local unitary fiber isometry from the active rank-$2$ bundle to $\widetilde Q_W$ transports the Pauli $\mathfrak{su}(2)$ action by Theorem G.8.4c.0c; this is a local frame identification, not a real tensor factorization or a canonical global bundle isomorphism.

*Proof.* Theorem G.8.4b gives the unique block split $3+2+1$ of the inactive-sector certificate, and Theorem G.8.4c.0c realizes it as the displayed splitting of $\pi^*Q$ on the ordered flag lift. Its rank-$3$ and rank-$2$ summands define $W_5$. Unitary changes preserving the ordered summands form $U(3)\times U(2)$. Transport through a local unitary fiber isometry preserves commutators and the Hermitian trace pairing, so it carries the Pauli action to the weak block. ∎

**Remark T.8a (Scope: Gauge Carrier versus Row-Pair Labelling).** The gauge-module content of the $b=6$ sector is the ordered complex block decomposition above; no real $\mathbb R^6\cong\mathbb R^3\otimes\mathbb R^2$ gauge-module identification is used here. The separate real row-pair identification of Theorem T.30 remains available as a labelling of the six left-chiral links by pair index and within-pair index. Results that consume that labelling, including the link count of Theorem T.18a and the generation projectors of Theorem T.31, rest on Theorem T.30 rather than on this theorem, and the $SU(2)_L$ action they invoke is carried by the weak block $\widetilde Q_W$.

**Definition T.14a (Electroweak 5-Plane).** On this branch,
$$
W_5
=\widetilde Q_C\oplus\widetilde Q_W
\cong\mathbb C^3\oplus\mathbb C^2.
$$
The color and weak blocks carry their fundamental complex $SU(3)$ and $SU(2)$ actions. A block-scalar hypercharge endomorphism has the form
$$
Y=\operatorname{diag}(y_cI_3,y_wI_2).
$$

### T.10.2 Hypercharge Structure

**Theorem T.9** (Traceless Hypercharge). Let $Y$ be the diagonal hypercharge generator on $W_5$:
$$
Y = \operatorname{diag}(y_c, y_c, y_c, y_w, y_w)
$$
The tracelessness constraint enforces:
$$
3y_c + 2y_w = 0
$$

*Proof.* The $U(1)$ generator is taken as the diagonal element of the embedded $SU(5)$ acting on $W_5$, hence it must lie in $\mathfrak{su}(5)$ and therefore be traceless. Equivalently, $Y$ must be orthogonal to the identity operator in the Hilbert–Schmidt inner product on $\operatorname{End}(W_5)$, which is exactly $\operatorname{Tr}(Y)=0$, giving $3y_c+2y_w=0$. ∎

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
\langle A, B \rangle_{\mathrm{HS}} = \operatorname{Tr}(A^\dagger B)
$$

**Theorem T.11** (Hypercharge Norm). The Hilbert--Schmidt norm of the hypercharge generator is:
$$
\lVert Y\rVert_{\mathrm{HS}}^2 = \operatorname{Tr}(Y^2) = 3\left(\frac{1}{3}\right)^2 + 2\left(\frac{1}{2}\right)^2 = \frac{1}{3} + \frac{1}{2} = \frac{5}{6}
$$

*Proof.* On the primitive-$(1/6)$-quantized traceless branch of Theorem T.10,
$$
Y=\operatorname{diag}\left(-\frac13,-\frac13,-\frac13,\frac12,\frac12\right).
$$
Because $Y$ is Hermitian,
$$
\|Y\|_{\mathrm{HS}}^2=\operatorname{Tr}(Y^2)
=3\left(\frac19\right)+2\left(\frac14\right)=\frac56.
$$
∎

### T.11.3 Canonical Normalization and the 5/3 Factor

**Definition T.16a** (SU(2) Generator Normalization). The $SU(2)_L$ generators $T_a = \sigma_a/2$ satisfy:
$$
\operatorname{Tr}(T_a T_b) = \frac{1}{2}\delta_{ab}
$$

**Theorem T.12** (GUT Normalization Factor). Define canonically normalized hypercharge $\hat{Y}$ by:
$$
\operatorname{Tr}(\hat{Y}^2) = \frac{1}{2} = \operatorname{Tr}(T_a^2)
$$
Then:
$$
\hat{Y} = \frac{Y}{\sqrt{5/3}}, \quad \boxed{c^2 = \frac{5}{3}}
$$

*Proof.* From $\operatorname{Tr}(Y^2) = 5/6$, requiring $\operatorname{Tr}(\hat{Y}^2) = 1/2$ gives $c^2 = (5/6)/(1/2) = 5/3$. ∎

**Remark T.12.1: Origin of 5/3.** The factor 5/3, traditionally assumed from SU(5) grand unification, emerges here on the primitive-(1/6)-quantized, traceless, $(3 + 2)$ hypercharge branch — the three explicit hypotheses of Theorem T.10. Under those hypotheses, the SU(5) group embedding is not separately required: the same constraints (rational charges, tracelessness on the 5-plane, primitive $(1/6)$-quantization) suffice to fix $(y_c, y_w) = (-1/3, 1/2)$ and hence $\operatorname{Tr}(Y^2) = 5/6$ giving $c^2 = 5/3$. The Hypercharge $5/3$ row in the summary tables (T.19.1, T.20) inherits this branch and is interpreted as derived on the primitive-(1/6)-quantized $(3+2)$ hypercharge branch rather than unconditionally.

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
These $Z_i$ are spectral matching data on the lifted gauge geometry $\widetilde X$; they are not Bures-norm orbit averages on the bare Grassmannian. The lifted formulation replaces the bare-Grassmannian orbit-average construction because the local Bures block formula provides only representative-state coupling data, while the quantitative gauge hierarchy requires the global sector-resolving structure formulated on the flag lift. Proposition T.17a.3a gives only a conditional base-to-lift pullback identity for the local part, while Convention T.69a, Theorem T.69, Corollary T.69.1, and Theorem T.70 give the finite-part prescription, local/global split, certified tail control, and sector/parity block spectrum. The numerical tuple adopted later in Theorem T.18 is not part of this definition; it is a validation target for the lifted spectral problem.

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
The tuple $(15.14,20.94,18.41)$ may be used only after this forward computation as a validation comparison. It may not be inserted into $F=T^{-1}\Delta$, used to choose the finite-part prescription, used to choose $(\mu_0,m_{\mathcal J},\eta)$, or used to select a Golay/parity lift.

**Theorem T.17a.0a (Single Determinant-Line Construction for Gauge Thresholds).** For a completed flag-lift threshold tuple $\mathfrak S_{\widetilde X}$ satisfying Convention T.17a.0, let
$$
D_\oplus:=D_C\oplus D_W\oplus D_Y
$$
with sector idempotents $\Pi_C,\Pi_W,\Pi_Y$. The sector threshold vector is the equivariant determinant-line character
$$
F_s
=
\log\det_{\mathrm{PU},\mu_G}(\Pi_sD_\oplus\Pi_s)
:=
-\zeta_s'(0)-\zeta_s(0)\log\mu_G^2,
\qquad
s\in\{C,W,Y\}.
$$
The physical threshold vector is uniquely
$$
\Delta=TF,
\qquad
F=(F_C,F_W,F_Y)^T,
$$
where
$$
T=
\begin{pmatrix}
2/5&3/5&8/15\\
0&1&0\\
1&0&0
\end{pmatrix},
\qquad
\det T=-\frac{8}{15}\ne0.
$$
Hence a completed spectral package determines all three threshold shifts and matching factors
$$
Z_i=1+\frac{\Delta_i}{24}
$$
with no additional sector threshold constants. Conversely, since $T$ is invertible, a numerical threshold vector determines at most one sector vector $F=T^{-1}\Delta$, but that inverse relation is diagnostic only unless $F$ has first been computed forward from $\mathfrak S_{\widetilde X}$.

*Proof.* Convention T.17a.0 fixes $D_s$, the finite-part prescription, the Golay/parity sector data, and the tail certificate before validation comparison. Therefore each sector zeta function $\zeta_s(q)$ is fixed. By Definition T.17a and Convention T.69a,
$$
F_s=-\zeta_s'(0)-\zeta_s(0)\log\mu_G^2.
$$
For direct sums of positive elliptic sector operators, the heat trace and zeta function are additive:
$$
\zeta_{D_\oplus}(q)=\zeta_C(q)+\zeta_W(q)+\zeta_Y(q).
$$
The sector idempotents recover the three components, so the determinant-line construction is single at the level of $D_\oplus$ and vector-valued at the level of sector characters. The Dynkin-index matrix $T$ is fixed by the flag-resolved sector representation data. Its determinant is
$$
\det T
=
-\frac{8}{15}\ne0,
$$
so the linear map $F\mapsto\Delta=TF$ is injective and surjective. Definition T.17a then gives
$$
Z_i=1+\frac{\Delta_i}{24}.
$$
No free sector constants appear in these equations. The inverse $F=T^{-1}\Delta$ exists algebraically, but using it before the forward determinant calculation would replace the spectral computation by validation data, which Convention T.17a.0 forbids. ∎

**Corollary T.17a.0b (Spectral-Action Transfer as a Completed Threshold Tuple).** An accepted PU spectral-action transfer ledger $\mathfrak S_{\mathrm{SA}}(P)$ of Definition X.9.6h.4 supplies a completed flag-lift threshold tuple in the sense of Convention T.17a.0 exactly when its first-order Dirac certificate, cutoff function, projection list, heat coefficients, finite-part prescription, finite-part scale, subtraction order, tail certificate, Dynkin-index map, scheme/overlap ledger, and normalization map determine
$$
\left(
D^{\mathrm{PCE}}_{\widetilde X},
\mathrm{MS2}_{\mu_G},
\mathcal J_G,
\mu_0,
m_{\mathcal J},
\eta,
\{\tau_{s,\pm,a}\},
\{F_s^{\mathrm{SA}}\}_{s\in\{C,W,Y\}},
\{\varepsilon_s(L)\}
\right)
\tag{T.17a.0b.1}
$$
before validation comparison. In that case the electroweak threshold vector is fixed by
$$
F_s=F_s^{\mathrm{SA}},
\qquad
\Delta=TF,
\qquad
Z_i=1+\frac{\Delta_i}{24}.
\tag{T.17a.0b.2}
$$
Thus spectral action is a positive closure route for the global flag-lift spectral gate only when it supplies the same finite data isolated by Theorem T.78 and the gauge/Higgs finite-part ledger of Theorem X.9.6h.5.

*Proof.* Theorem X.9.6h.5 makes each claimed threshold finite part and Higgs finite part a deterministic interval-valued function of the spectral-action Dirac certificate, cutoff moments, sector projections, heat coefficients, finite-part prescription, normalization map, and tail certificate. Convention T.17a.0 requires exactly a forward-fixed sector operator, finite-part prescription, Golay/parity sector data, and tail record. If $\mathfrak S_{\mathrm{SA}}(P)$ supplies the tuple (T.17a.0b.1), then the sector finite parts $F_s$ are fixed before validation comparison and Theorem T.17a.0a gives $\Delta=TF$ and $Z_i=1+\Delta_i/24$. Conversely, if any entry of (T.17a.0b.1) is absent, Theorem T.78.2 identifies a missing branch datum, so the spectral-action ledger has not completed the threshold tuple. ∎

**Definition T.17a.0c (Golay-Octad Spectral Extension Record).** A forward-locked extension fixes a self-adjoint elliptic first-order operator $D_{\mathrm{oct}}$ on a declared common domain and grading, octad projectors $P_O$ that reduce $D_{\mathrm{oct}}^2$, cutoff and heat coefficients, subtraction order, finite-part scale, tail bounds, Dynkin-index and normalization maps, and an overlap ledger. Its finite parts are interval-valued:
$$
F_s^{\mathrm{oct}}
\in
\operatorname{FP}_{t\downarrow0,\mu_{\mathrm{oct}}}
\sum_{O\in\mathcal O_8}w_{s,O}
\operatorname{Tr}(P_Oe^{-tD_{\mathrm{oct}}^2})
+I_s^{\mathrm{tail}}.
\tag{T.17a.0c.1}
$$
Acceptance requires Convention T.17a.0, Theorem T.78, Corollary T.69.1, and the applicable master-ledger overlap conditions. Definition T.78.10 is required only when the extension is asserted to be an RHG record.

**Proposition T.17a.0d (Status of the Octad Route).** An accepted extension supplies the corresponding forward intervals to Theorem T.17a.0a. A positive threshold conclusion requires those intervals, including tails, to meet the preregistered tolerance. Golay incidence alone determines no nonzero threshold.

**Definition T.17a.0e (Scalar Finite-Part Matching Ledger).** A scalar ledger fixes the scalar operator/projectors, zero- and negative-mode rules, heat coefficients, subtraction order, finite-part scale and scheme, tail intervals, units, and a forward-locked RG/threshold/pole map. Its typed output is
$$
(F_H,Z_H,\mu_H^2(\mu_G),\lambda_H(\mu_G))
\in I(F_H)\times I(Z_H)\times I(\mu_H^2)\times I(\lambda_H),
\tag{T.17a.0e.1}
$$
where each interval is produced by the fixed normalization map and spectral-action interval ledger of Definition X.9.6h.4.

**Proposition T.17a.0f (Status of Scalar Localization).** A localization theorem makes only its registered evaluation exact; it does not force that value to vanish. A zero finite part requires the evaluated interval to be $\{0\}$. Removing one explicit sensitivity term does not cancel an independent scalar finite part.

**Corollary T.17a.0g (Typed Higgs Comparison Gate).** Comparison with Theorem T.28 is licensed only after both outputs share scale, scheme, units, and observable type. A genuinely new scalar operator may lie outside the current no-go source class without changing that no-go statement.

A finite truncation establishes a stated tolerance only when
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

*Proof.* Fix a plane $V\in\mathrm{Gr}(2,8)$ and choose a complex complement $W$ with $\mathbb C^8=V\oplus W$. Every plane sufficiently close to $V$ is the graph
$$
\Gamma_A=\{v+A(v):v\in V\}
$$
of a unique $A\in\operatorname{Hom}_{\mathbb C}(V,W)$. The map $A\mapsto\Gamma_A$ is a holomorphic coordinate chart, so differentiation at $A=0$ gives
$$
T_V^{1,0}\mathrm{Gr}(2,8)
\cong
\operatorname{Hom}_{\mathbb C}(V,W).
$$
The quotient map $\mathbb C^8\to\mathbb C^8/V$ restricts to an isomorphism $W\cong\mathbb C^8/V$, yielding
$$
T_V^{1,0}\mathrm{Gr}(2,8)
\cong
\operatorname{Hom}_{\mathbb C}(V,\mathbb C^8/V).
$$
Changing the complement changes the graph coordinate by a holomorphic transition map whose derivative induces the same quotient-valued linear map. The identification is therefore independent of the chosen complement and varies holomorphically with $V$. Since the fibers of $S$ and $Q$ at $V$ are $V$ and $\mathbb C^8/V$, respectively,
$$
\operatorname{Hom}_{\mathbb C}(V,\mathbb C^8/V)
=S_V^\vee\otimes Q_V.
$$
Thus $T^{1,0}\mathrm{Gr}(2,8)\cong S^\vee\otimes Q$ as holomorphic vector bundles. Applying the pullback functor along $\pi$ gives
$$
\pi^*T^{1,0}\mathrm{Gr}(2,8)
\cong
\pi^*(S^\vee\otimes Q)
=\widetilde E.
$$
∎

**Remark T.17a.3 (Open Commuting-Sector and Threshold-Matching Gate).** The displayed diagonal hypercharge operator does not act as a scalar on the stated coordinate blocks $C,W,Y$; in particular, the proposed blocks mix unequal eigenvalues and contain zero-eigenvalue coordinates. Therefore the scalar charges, the displayed Dynkin-index matrix, and the numerical threshold map do not follow from the current coordinate assignment. A valid sector branch must first supply orthogonal projectors $P_s$ with $\sum_sP_s=I$, $[P_s,\hat Y]=0$, and the declared commuting $SU(3)\times SU(2)\times U(1)$ module action; only then may the sector charges and Dynkin indices be computed from traces on $P_s\mathcal H$.

**Proposition T.17a.3a (Conditional Base-to-Lift Matching Map).** Let $\pi:\widetilde X\to X$ be a surjective flag lift and assume a certified commuting sector decomposition as above. Pullback is a bijection between scalars on $X$ and fiber-constant scalars on $\widetilde X$. If the measures satisfy $\pi_*\mu_{\widetilde X}=\mu_X$, then
$$
\int_{\widetilde X}(b_s\circ\pi)\,d\mu_{\widetilde X}=\int_Xb_s\,d\mu_X.
$$
A relation $F=F^{\mathrm{loc}}+R^{\mathrm{glob}}$ is available only after a spectral certificate defines both terms, and $\Delta=TF$ is available only after the commuting-sector certificate defines $T$. No numerical threshold tuple follows from pullback alone. ∎

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

**Theorem T.13** (Predictive Ward Identity on a Registered Common-Stiffness Response Image). Assume a registered injective response map
$$
R:\mathfrak g_{\mathrm{SM}}\longrightarrow T_{\rho_0}\mathrm{Gr}(2,8)
$$
as in Corollary G.8.2f, and assume its image is supplied with the common-stiffness pullback certificate
$$
R^*\Gamma^{(2)}=\kappa_{\mathrm{bulk}}^* B_{\mathrm{SM}},
$$
where $B_{\mathrm{SM}}$ is the fixed positive invariant quadratic form whose canonically normalized color, weak, and primitive hypercharge directions use one common coefficient. Then Theorem Z.14 gives $\kappa_{\mathrm{bulk}}^*=1$, so
$$
R^*\Gamma^{(2)}=B_{\mathrm{SM}}.
$$
In a $B_{\mathrm{SM}}$-orthonormal generator basis the pulled-back susceptibility is the identity. On the electroweak branch, the primitive block-scalar hypercharge direction and the weak generators are normalized on $W_5$ by Theorems T.9--T.12. Thus a single PU bulk coefficient is obtained on this registered response image. Flatness of the ambient QFI metric alone does not construct $R$, identify gauge-vertical directions, or prove the common-stiffness pullback.

*Proof.* The pullback identity is the registered bridge from gauge-generator space to the QFI tangent space. Theorem Z.14 fixes its scalar bulk coefficient to $1$. Restriction to the electroweak generator subspace and passage to a $B_{\mathrm{SM}}$-orthonormal basis give the displayed identity. The final scope statement follows because a flat metric restricts uniformly only after the response embedding and its normalization have been fixed. ∎

**Corollary T.13.1** (PU-to-SM Gauge Matching). On the common-stiffness response-image branch of Theorem T.13, the canonically normalized gauge generators carry one PU bulk coefficient $g_U$. At the matching scale $\mu_G$, after matching to SM-canonical gauge fields, the gauge kinetic term at $\mu_G$ takes the form
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

**Theorem T.14** (Weinberg Angle at the Matching Scale). Assume the normalized block-scalar hypercharge and weak-generator branches of Theorems T.9--T.12 together with the common-stiffness response-image certificate of Theorem T.13. Then the PU-normalized value $\sin^2\theta_W^{(0)}=3/8$, while the SM-canonical tree-level weak mixing angle at the matching scale $\mu_G$ is
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

**Corollary T.17.1** (Subleading Threshold Splittings on the Uniform-Smallness Branch). Suppose
$$
\delta_i=\frac1M\sum_{\alpha=1}^Mx_{\alpha,i}
$$
and, uniformly in $\alpha$,
$$
x_{\alpha,i}-x_{\alpha,j}=O(M^{-1}).
$$
Then
$$
\delta_i-\delta_j=O(M^{-1}).
$$

*Proof.* There is a constant $C$, independent of $M$ and $\alpha$, such that
$$
|x_{\alpha,i}-x_{\alpha,j}|\le\frac{C}{M}.
$$
Therefore
$$
|\delta_i-\delta_j|
\le
\frac1M\sum_{\alpha=1}^M\frac{C}{M}
=
\frac{C}{M}.
$$
Independent bounded mean-zero contributions would generally yield only $O_{\mathbb P}(M^{-1/2})$ and are not equivalent to this hypothesis. ∎

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
Remark T.17a.4 and Proposition T.17a.5 give a theorem-level local no-go: once the positive color and weak validation channels are matched, every sector-independent affine local truncation still forces $F_Y>0$, whereas the validation tuple would require $F_Y=-8.9775$. The lifted threshold sector is therefore evaluated by the sector-resolving global $\mathrm{MS2}_{\mu_G}$ block functional of Definition T.17a, Convention T.69a, and Theorem T.70. Proposition T.17a.3a fixes the canonical base-to-lift identification of the local part of the threshold sector, Theorem T.69 fixes the local/global split, and Theorem T.78 records the determinacy of any completed flag-lift spectral problem. Theorem T.78.2 records the complementary status boundary, and Theorem T.78.5 proves that the present canonical ledger has no PU-internal branch package supplying the missing data needed to execute that completed spectral problem. Thus the displayed numerical run remains validation-level unless a separate appended spectral branch extension is fixed before comparison and evaluated forward. On the minimal residual ledger $\delta_i=0$ of Definition T.19a, one-loop SM running (Theorem T.15) gives
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

**Lemma T.3** (Bures Metric per Block). Let $S=\sigma_x/2$ and let $|\psi\rangle$ be a normalized pure state satisfying $\langle\psi|S|\psi\rangle=0$. Then
$$
g_B=\operatorname{Var}_\psi(S)=\frac14,
\qquad
F_Q=4g_B=1.
$$

*Proof.* Since $S^2=I/4$,
$$
\operatorname{Var}_\psi(S)
=
\langle S^2\rangle_\psi-\langle S\rangle_\psi^2
=
\frac14-0
=
\frac14.
$$
For a pure state undergoing the unitary family generated by $S$, the quantum Fisher information is $F_Q=4\operatorname{Var}_\psi(S)=1$. An eigenstate of $S$ has zero variance and is not covered by the hypothesis. ∎

**Lemma T.4** (Cosine-Distortion Expansion). On the SU(2) block branch on which the distortion energy is defined by
$$
V_{\text{block}}(u):=1-\cos u,
$$
one has, as $u\to0$,
$$
V_{\text{block}}(u)=\frac{u^2}{2}-\frac{u^4}{24}+O(u^6).
$$

*Proof.* Taylor's formula at the origin gives
$$
\cos u
=1-\frac{u^2}{2!}+\frac{u^4}{4!}+R_6(u),
$$
where the integral remainder is
$$
R_6(u)
=-\frac1{5!}\int_0^u (u-t)^5\cos t\,dt.
$$
Therefore
$$
|R_6(u)|
\le\frac1{5!}\int_0^{|u|}(|u|-t)^5dt
=\frac{|u|^6}{6!},
$$
so $R_6(u)=O(u^6)$. Subtracting the Taylor formula from $1$ yields
$$
1-\cos u
=\frac{u^2}{2}-\frac{u^4}{24}+O(u^6).
$$
∎

### T.14.2 Six Left-Chiral Links

**Theorem T.18a** (Link Count on the Weak-Left Projection Branch). On the weak-left projection branch (Definition T.3a) and the ordered full-block branch (Theorem T.8), the electroweak sector contains exactly 6 left-chiral SU(2) links, corresponding to $b = 6$ inactive modes.

*Proof.* On the weak-left projection branch, Definition T.3a fixes the rank-6 projection $\Pi_L:\mathbb{R}^{12}\to\mathbb{R}^6$ identifying $k/2 = 6$ independent information modes that couple to $SU(2)_L$, with $\Pi_L\Pi_L^T = I_6$ confirming six independent directions. On the ordered full-block branch (Theorem T.8), the local finite-response frame identification between the active rank-$2$ carrier and the weak rank-$2$ block $\widetilde Q_W$ transports an independent $SU(2)_L$ doublet action to each such direction, so each corresponds to one left-chiral SU(2) link. Therefore on the combined branch the electroweak sector contains exactly 6 independent left-chiral SU(2) links, matching the inactive dimension $b = 6$ used in the alignment-counting definition of $N_0$ (Definition T.5a). ∎

The $SU(2)_L$ algebra used by these six left-chiral links is the rank-2 weak-block algebra selected by Theorem G.8.4b and locally reflected from the active Pauli carrier by Theorem G.8.4c.0c. The link count remains $b=6$, while the Pauli algebra on each weak link is compatible with any local finite-response frame identification between the active rank-2 carrier and the capacity-selected weak rank-2 block.

**Definition T.14.2a (Structural Mass-Cost Ledger).** On any certified mass branch in which a fermion mass has multiplicative form
$$
m_f(\mu)=v\,Z_f(\mu)\prod_{\alpha\in\mathcal A}M_\alpha(f),
$$
define the structural mass-cost ledger
$$
\Omega_{\mathrm{mass}}(f;\mu)
:=-\log\frac{m_f(\mu)}{v}
=-\log Z_f(\mu)-\sum_{\alpha\in\mathcal A}\log M_\alpha(f).
$$
Equivalently, if $M_\alpha(f)=e^{-\Omega_\alpha(f)}$, then
$$
\Omega_{\mathrm{mass}}(f;\mu)
=\Omega_{\mathrm{RG}}(f;\mu)+\sum_{\alpha\in\mathcal A}\Omega_\alpha(f).
$$

**Proposition T.14.2b (Universal/Sector-Specific Separation of the Mass-Cost Ledger).** On a certified mass branch with running factor $Z_f(\mu)$ that depends only on the retained sector signature $\Gamma(f)$ of $f$ at scale $\mu$ — where $\Gamma(f)$ is the retained running-data class encoding the full charge signature of $f$ under color, weak, and hypercharge (rather than membership in a single exclusive gauge sector) — and on certified factors $\{M_\alpha\}_{\alpha\in\mathcal A}$ partitioned as
$$
\mathcal A=\mathcal A_{\mathrm{univ}}\sqcup\mathcal A_{\mathrm{sect}}\sqcup\mathcal A_{\mathrm{gen}},
$$
where $\mathcal A_{\mathrm{univ}}$ holds factors common to all fermions on the branch, $\mathcal A_{\mathrm{sect}}$ holds factors that depend only on $\Gamma(f)$, and $\mathcal A_{\mathrm{gen}}$ holds factors that depend only on generation index $g(f)\in\{1,2,3\}$, the mass-cost ledger separates as
$$
\Omega_{\mathrm{mass}}(f;\mu)
=
\Omega_{\mathrm{RG}}(\Gamma(f);\mu)
+\Omega_{\mathrm{univ}}
+\Omega_{\mathrm{sect}}(\Gamma(f))
+\Omega_{\mathrm{gen}}(g(f)).
$$
Consequently, for fermions $f,f'$ sharing the same sector signature $\Gamma(f)=\Gamma(f')$ at the same scale,
$$
\Omega_{\mathrm{mass}}(f;\mu)-\Omega_{\mathrm{mass}}(f';\mu)
=
\Omega_{\mathrm{gen}}(g(f))-\Omega_{\mathrm{gen}}(g(f')),
$$
and the running and sector contributions cancel from same-signature ratios.

*Proof.* Substitute the partitioned product into $\Omega_{\mathrm{mass}}=-\log(m_f/v)$. The logarithm of a product is the sum of logarithms, so the three certified groups add. The RG factor depends on $\Gamma(f)$ by hypothesis. Taking the difference between entries with the same sector signature removes the running, universal, and sector summands and leaves the generation summand. ∎

This ledger introduces no new mass formula. It reorganizes certified root, holonomy, sector, generation, and running factors into one additive accounting on which same-sector comparison isolates generation cost. A measured mass or mixing datum falsifies a certified mass branch only after the branch's stated running, threshold, and tolerance conventions are applied.

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

**Theorem T.22** (Elastic Energy with Coherent Target Shift). With $r$ eliminated, assume the leading coherent reservoir target shift in the $L_{\mathrm{info}}$-orthonormal coordinates of Lemma T.5b takes the form
$$
x(u) = \gamma\, u^2 v + O(u^4), \qquad |v| = 1,
$$
where $\gamma > 0$ is a dimensionless target-shift normalization. The reduced energy functional is then
$$
V[s; u] = \frac{1}{2} s^T s + \frac{1}{2} |\Pi_L s - x(u)|^2.
$$
The moment-map-normalized target-shift branch has $\gamma=1$; Theorem T.22b gives the gate under which this value is fixed only after the even-displacement condition (T.22a.2) and the $L_{\mathrm{info}}$-norm datum (T.22a.3) are verified in the reservoir coordinates of Lemma T.5b. Remark T.22c shows that the raw linear-subtracted Pauli-coordinate remainder has a nonzero cubic term and quadratic-coefficient norm $1/4$; the even projection and normalized reservoir map are separate gates.

*Proof.* The SU(2) rotation on each of six left-chiral links produces a coherent $O(u^2)$ shift in the reservoir, establishing the scaling order and the existence of a unit direction $v$. The magnitude coefficient $\gamma$ is the target-shift normalization of the SU(2)-coherent action on the reservoir coordinates. ∎

**Definition T.22a** (SU(2) Moment-Map Target-Shift Datum). On the weak-left signal-pair branch, let $S_a=\sigma_a/2$ be the Pauli-normalized $SU(2)$ generators, with
$$
\operatorname{tr}(S_aS_b)=\frac12\delta_{ab}.
\tag{T.22a.1}
$$
Let $\mu_{SU(2)}$ be the coherent-state moment map of the retained weak doublet, written in the $L_{\mathrm{info}}$-orthonormal reservoir coordinates of Lemma T.5b. For a weak-doublet curve $q(u)$, define its even reservoir displacement by
$$
\Delta\mu_{\mathrm{even}}(u)
:=
\frac12\left[\mu_{SU(2)}(q(u))+\mu_{SU(2)}(q(-u))\right]
-\mu_{SU(2)}(q(0)).
$$
The datum is accepted when
$$
\Delta\mu_{\mathrm{even}}(u)
=
u^2v+O(u^4),
\qquad |v|=1.
\tag{T.22a.2}
$$
Equivalently,
$$
\left|
\frac12
\frac{d^2}{du^2}\mu_{SU(2)}(q(u))\bigg|_{u=0}
\right|_{L_{\mathrm{info}}}
=1.
\tag{T.22a.3}
$$

The homogeneous Bures/Kähler-Einstein normalization may be used to verify this datum only when it supplies the displayed $L_{\mathrm{info}}$-norm identity in the same reservoir coordinates as Lemma T.5b. The curvature identity $\operatorname{Ric}(\omega)=8\omega$ fixes the homogeneous metric scale on the Grassmannian branch; it does not by itself determine the SU(2) target-shift curve $q(u)$ or the second derivative in (T.22a.3). Thus the Kähler-Einstein input closes the $\gamma=1$ branch exactly when it verifies (T.22a.3), and not merely by naming the Kähler-Einstein structure.

**Theorem T.22b** (Unit Moment-Map Target-Shift Normalization). On a branch carrying the SU(2) moment-map target-shift datum of Definition T.22a, the target-shift coefficient in Theorem T.22 is
$$
\gamma=1.
\tag{T.22b.1}
$$

*Proof.* By Definition T.22a, the quadratic reservoir displacement is
$$
u^2v+O(u^4)
$$
with $|v|=1$ in the same $L_{\mathrm{info}}$-orthonormal coordinates used in Theorem T.22. Theorem T.22 writes the same displacement as
$$
\gamma u^2v_\gamma+O(u^4),
\qquad |v_\gamma|=1.
$$
Taking the $L_{\mathrm{info}}$ norm of the coefficient of $u^2$ in both expressions gives
$$
1=\gamma.
$$
The accepted $L_{\mathrm{info}}$-norm datum (T.22a.3), when verified in the same reservoir coordinates used by Theorem T.22, fixes the target-shift scale. The Pauli trace normalization (T.22a.1) alone does not verify that datum. ∎

**Remark T.22c (Raw Moment-Map Normalization Audit).** For $q_0=(0,1)^T$, $S_a=\sigma_a/2$, and $q(u)=e^{iuS_1}q_0$,
$$
\mu_{SU(2)}(q(u))
=
\left(0,-\frac12\sin u,-\frac12\cos u\right).
$$
For comparison, the ordinary linear-subtracted remainder is
$$
\mu(q(u))-\mu(q_0)-d\mu|_{q_0}(\dot q(0))u
=
\left(
0,
\frac1{12}u^3+O(u^5),
\frac14u^2+O(u^4)
\right).
$$
Thus the raw linear-subtracted remainder has both a nonzero cubic coordinate and a quadratic coefficient of Euclidean norm $1/4$; it is not the even displacement defined in (T.22a.2). An injective coordinate embedding or rescaling alone cannot remove its cubic term. The even projection required by Definition T.22a is
$$
x_{\mathrm{even}}(u)
:=
\frac12\left(\mu(q(u))+\mu(q(-u))\right)-\mu(q_0)
=
\left(0,0,\frac14u^2+O(u^4)\right)
$$
and removes the odd term. In the raw Euclidean target coordinates its quadratic coefficient has norm $1/4$, so it does not by itself verify the unit $L_{\mathrm{info}}$-norm condition (T.22a.3). The unit branch $\gamma=1$ remains conditional on a response-preserving map into the $L_{\mathrm{info}}$-orthonormal reservoir coordinates that sends this coefficient to unit norm. Separately, Theorem T.24 proves the exact minimization identity $\min_sV[s;u]=|x(u)|^2/4$ for a declared target shift. This identity does not identify $u$ with the transverse variable $\xi$ of Definition T.12a and does not alter the positive $\mu I_3$ block or the zero-mode count of Theorems T.2–T.5.

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
V_{\min}(u) = \frac{\gamma^2}{4}u^4.
$$
In terms of the canonical Higgs field $h = \sqrt{6}\,u$,
$$
\lambda_{\mathrm{elastic}}(\gamma) = +\frac{\gamma^2}{36}.
$$
On the canonical unit target-shift branch $\gamma = 1$,
$$
\boxed{V_{\min}(u) = \frac{1}{4}u^4, \qquad \lambda_{\mathrm{elastic}} = +\frac{1}{36}.}
$$

*Proof.*

**Step 1** (Mismatch). With $\Pi_L s(u) = \tfrac{\gamma}{2}u^2 v$ and $x(u) = \gamma u^2 v$:
$$
\Pi_L s - x(u) = \frac{\gamma}{2}u^2 v - \gamma u^2 v = -\frac{\gamma}{2}u^2 v.
$$

**Step 2** (Energy evaluation).
$$
V_{\min}(u) = \frac{1}{2}\lVert s\rVert^2 + \frac{1}{2}\lVert\Pi_L s - x\rVert^2 = \frac{1}{2}\left\lVert\tfrac{\gamma}{2}\Pi_L^T u^2 v\right\rVert^2 + \frac{1}{2}\left\lVert-\tfrac{\gamma}{2}u^2 v\right\rVert^2.
$$
Since $\Pi_L^T$ is an isometry, $\lVert\Pi_L^T v\rVert^2 = \lVert v\rVert^2 = 1$:
$$
V_{\min}(u) = \frac{\gamma^2}{8}u^4 + \frac{\gamma^2}{8}u^4 = \frac{\gamma^2}{4}u^4.
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

**Remark T.24.2: Role of the Target-Shift Branch Assumption.** The magnitude $\gamma^2/36$ is fixed by the canonical normalizations $L_{info}=I_{12}$, $\Pi_L\Pi_L^T=I_6$, $|v|=1$, and the target-shift normalization $\gamma$. The specific value $\lambda_{\mathrm{elastic}}=1/36$ corresponds to the canonical unit target-shift branch $\gamma=1$. On branches carrying the accepted SU(2) moment-map target-shift datum of Definition T.22a, Theorem T.22b fixes $\gamma=1$ only after the even-displacement condition (T.22a.2) and the $L_{\mathrm{info}}$-norm identity (T.22a.3) are independently verified. Remark T.22c shows that the raw linear-subtracted Pauli-coordinate remainder is not the even displacement of (T.22a.2) and does not verify the norm identity (T.22a.3); the even projection removes the cubic term, but normalization remains separate. Without the accepted datum, $\gamma$ remains an explicit target-shift branch parameter.

-----

## T.16 Branch-Conditional Zero-Slack and Criticality Inputs

### T.16.1 Total Quartic at the Fixed Point

**Theorem T.25** (Zero-Slack Cancellation on the Moment-Map-Normalized Target-Shift Branch). At the PU fixed point $\mathfrak{A}_{PU}$:
$$
\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU}; \gamma) = \lambda_{\text{block}} + \lambda_{\text{elastic}}(\gamma) = -\frac{1}{36} + \frac{\gamma^2}{36} = \frac{\gamma^2 - 1}{36}.
$$

The zero-slack boundary
$$
\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU}) = 0
$$
holds on the moment-map-normalized target-shift branch $\gamma = 1$ fixed by Theorem T.22b.

*Proof.* Theorems T.21 and T.24, with Theorem T.24 evaluated on the target-shift normalization $\gamma$. ∎



**Remark T.25.1 (Branch Dependence of the Zero-Slack Boundary).** The vanishing of the fixed-point quartic at the PCE attractor depends on the target-shift normalization $\gamma=1$ introduced in Theorem T.22. The named supporting theorems (T.18a link count, T.19 canonical Higgs field, T.20 block quartic, T.21 block coefficient, T.5b canonical basis, T.23 optimal signal configuration) fix every factor in the derivation except this leading target-shift magnitude, which is the SU(2)-coherent action of the six left-chiral links on the six-dimensional reservoir. On the moment-map branch defined by Definition T.22a, Theorem T.22b supplies the unit normalization and the zero-slack statement is theorem-level within that branch. Without that moment-map datum, $\lambda_{\mathrm{PU}}=0$ is unavailable. Even with it, the Higgs-pole comparison of Theorem T.28 requires a completed threshold record together with the full target-shift, PU-to-SM quartic-matching, marginality, RG, decoupling, and pole-conversion tuple; the unit target-shift branch is necessary but not sufficient for $m_H\approx125$ GeV. A deviation $\gamma\neq1$ shifts $\lambda_{\mathrm{PU}}$ by $(\gamma^2-1)/36$, but its effect on a pole mass is determined only after that separately supplied forward record is accepted.

### T.16.2 Beta Function Boundary Condition

**Definition T.25.2 (PU-to-SM Quartic Matching Record).** A quartic matching record $\mathfrak M_\lambda$ specifies a response-preserving map from the abstract PU fixed point $\mathfrak A_{PU}$ to a renormalized Standard Model quartic at a declared energy and scheme. It must fix the matching scale, field normalization, threshold terms, finite-part convention, and residual interval before comparison. In particular, Theorem T.25 by itself does not identify $\mathfrak A_{PU}$ with $\mu_G$ or $\mu_\lambda$ and does not imply either $\lambda(\mu_G)=0$ or $\lambda(\mu_\lambda)=0$.

**Theorem T.26** (Conditional criticality relation at the PU matching scale). Assume:

1. the accepted moment-map datum of Definition T.22a fixes $\gamma=1$;
2. an accepted quartic matching record $\mathfrak M_\lambda$ maps $\lambda_{\mathrm{PU}}(\mathfrak A_{PU})=0$ to $\lambda(\mu_G)=0$ in the stated SM scheme; and
3. the matching trajectory is independently selected on the one-loop marginal surface $\beta_\lambda^{(1)}(\mu_G)=0$.

Then, with the GUT-normalized coupling $g_1=\sqrt{5/3}\,g'$, the couplings at $\mu_G$ satisfy
$$
6y_t^4
-
\frac98g_2^4
-
\frac9{20}g_2^2g_1^2
-
\frac{27}{200}g_1^4
=0
$$
in the convention $V=\lambda(H^\dagger H)^2$.

*Proof.* At $\lambda=0$, the one-loop Standard Model beta function in this normalization is
$$
16\pi^2\beta_\lambda^{(1)}
=
-6y_t^4
+
\frac98g_2^4
+
\frac9{20}g_2^2g_1^2
+
\frac{27}{200}g_1^4.
$$
The second hypothesis supplies $\lambda(\mu_G)=0$ and the third hypothesis supplies $\beta_\lambda^{(1)}(\mu_G)=0$. Setting the right side to zero and multiplying by $-1$ gives the displayed relation. ∎

**Remark T.26.2: Numerical Consistency.** Since $g_U^2=\pi/6$, $g_U\approx 0.724$ (Theorem T.39a). For the validation tuple of Theorem T.18, equivalently $(Z_1,Z_2,Z_3)=(1+15.14/24,1+20.94/24,1+18.41/24)\approx(1.6308,1.8725,1.7671)$, the marginality condition gives $y_t(\mu_G)\approx 0.392$. RG amplification over $t=\ln(\mu_G/M_t)\approx 30$ yields $y_t(M_t)\approx 0.93$–$0.99$, consistent with $y_t^{\mathrm{obs}}(M_t)\approx 0.994\pm 0.005$. The same validation matching data and SM running yield Z-pole gauge couplings in the observed range (Theorem T.18; Theorem T.27b), with residual finite matching shifts encoded by $\delta_i$ and splittings subleading as in Corollary T.17.1. These are validation-run outputs until the forward lifted-threshold calculation derives the tuple.

**Remark T.26.3: RG Sensitivity.** Sensitivity: $y_t(\mu_G)=C(Z_1,Z_2)^{1/4}g_U$ with $C(Z_1,Z_2)=\frac{1}{6}\!\left(\frac{9}{8Z_2^2}+\frac{9}{20Z_1Z_2}+\frac{27}{200Z_1^2}\right)$. Thus $\Delta y_t/y_t=\Delta g_U/g_U+\frac{1}{4}\Delta(\ln C)$, so the top boundary is linearly sensitive to $g_U$ and mildly sensitive to the matching factors $Z_{1,2}$.

-----

## T.17 Conditional Higgs-Mass Comparison

### T.17.1 RG Evolution of the Quartic

**Theorem T.27** (Quartic Running). The one-loop beta function is:
$$
16\pi^2 \frac{d\lambda}{dt} = 24\lambda^2 - 6y_t^4 + \lambda(12y_t^2 - 9g^2 - 3(g')^2) + \frac{9}{8}g^4 + \frac{3}{8}g'^4 + \frac{3}{4}g^2 (g')^2
$$

### T.17.2 Numerical Verification

**Proposition T.5** (Observed-Input SM Zero-Crossing Validation). For the displayed Standard Model validation trajectory initialized from the low-energy inputs $\lambda(M_Z)=0.129$ and the stated top/gauge data, define $\mu_\lambda$ by $\lambda(\mu_\lambda)=0$. At the working order used here,
$$
\mu_\lambda \approx 10^{10} \text{ GeV}.
$$

*Verification.* Running from $M_Z$ with $\lambda(M_Z) = 0.129$, the top Yukawa contribution drives $\lambda$ toward zero:

- At $\mu = 10^{4}$ GeV: $\lambda \approx 0.11$
- At $\mu = 10^{8}$ GeV: $\lambda \approx 0.02$
- At $\mu = 10^{10}$ GeV: $\lambda \approx 0$ (crossing)
- At $\mu = 10^{16}$ GeV: $\lambda \approx -0.02$

Two-loop analysis places this observed-input instability scale at $\mu_\lambda \sim 10^{10}$–$10^{11}$ GeV (Degrassi et al. 2012). This validation trajectory does not supply the fixed-point-to-SM matching record $\mathfrak M_\lambda$ required by Theorem T.26 and does not identify $\mu_\lambda$ with $\mu_G$. ∎

### T.17.3 Metastability and Higgs Mass

**Theorem T.28** (Conditional Higgs pole-mass map and current validation status). Fix a completed threshold ledger together with the forward-locked tuple
$$
(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}}),
$$
containing the accepted target-shift datum, PU-to-SM quartic matching record, marginality condition, fixed-loop-order SM RG system, decoupling convention, and pole-mass conversion convention. If those inputs place the resulting SM trajectory on the metastability boundary analyzed in the two-loop studies of Buttazzo et al. [2013], then the corresponding Higgs pole mass is approximately
$$
m_H \approx 125 \text{ GeV}.
$$
The present manuscript does not supply an accepted $\mathfrak M_\lambda$ connecting $\mathfrak A_{PU}$ to either $\mu_G$ or the distinct SM crossing scale $\mu_\lambda$, and its current PU-internal threshold source class is negatively closed by Theorem T.78.14. Accordingly, $125$ GeV is currently an external-RG validation value for the named branch, not a theorem-level PU prediction.

*Proof.* Once the completed threshold ledger and every member of the displayed tuple are fixed, the external SM RG calculation and deterministic decoupling/pole maps send the selected metastability trajectory to one pole mass. Proposition T.5 records the SM crossing scale $\mu_\lambda\sim10^{10}$--$10^{11}$ GeV, whereas the adopted matching scale is $\mu_G\approx1.5\times10^{15}$ GeV. Definition T.25.2 forbids identifying either scale with the abstract fixed point without a matching record. The conditional map is therefore valid, while current PU-internal closure is absent. QED

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

This part gathers the electroweak results and separates exact structural values from model outputs, validation targets, and imposed inputs. The following section records the detailed statuses.

## T.19 Complete Electroweak Parameter Summary

The tables below collect the electroweak, Higgs, flavor, and mixing outputs and state what kind of evidence supports each one. Exact structural values, model results, validation targets, and imposed inputs remain separate categories.

### Technical summary conventions

**Convention T.19.0 (Branch Ledger for Appendix T Summary Tables).** All branch entries in the Appendix T summary tables (T.19.1, T.20, T.24.26, T.25.8 and parallel rows) are interpreted relative to the controlling branch package of Theorem T.79: a fixed PU structural branch, the completed flag-lift spectral data $\Delta$, the flavor-geometric residual data $(\mathcal{T}_{E_8},\mathcal V)$, the CP-profile data $\mathcal B$, and every conversion record consumed by the requested output. For a Higgs-pole row the required record is
$$
\mathfrak H_T:=(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}}),
$$
fixed before comparison and used together with the completed threshold record. A zero-slack theory-space row uses only the applicable target-shift member and must not be conflated with this full pole-level record. Branch labels in the tables have the following interpretations:

- "Exact" — exact arithmetic consequence once every stated branch datum is fixed (e.g., $\sin^2\theta_W^{(0)}=3/8$ on the primitive-$(1/6)$-quantized hypercharge branch; $\lambda_{\mathrm{elastic}}(\gamma)=\gamma^2/36$ for a declared target shift). The special value $\lambda_{\mathrm{elastic}}=1/36$ is exact only inside the accepted Definition T.22a unit branch. A summary convention propagates status; it does not supply a missing target-shift or fixed-point-to-SM matching datum.

- "Derived" — derived within the adopted Appendix T branches (predictive-recovery MacWilliams Golay rate-$\tfrac12$, weak-left projection, row-pair, Bures-gauge holonomy normalization or the Kostant-Souriau prequantization gate, Toeplitz-Kraus Yukawa probability-overlap, $E_8$ triad selection, generation-internal tensor factorization, Takagi-Weyl Majorana $A_2$, triplet-projection exponent, the PMNS CP-phase branch of Theorem T.24.22, and the controlling branch package of Theorem T.79), not necessarily unconditional theorem-level output from the foundational PU axioms alone.

- "Validation" — validation-run output produced by the displayed validation tuple $\Delta^{\mathrm{val}}$ in conjunction with SM running. Such entries remain validation targets rather than derived predictions under the canonical minimal ledger. Theorem T.78.5 closes the current-framework flag-lift gate negatively, and Theorem T.78.14 closes the current RHG, torsion, spectral-action, and equivalent electroweak source class negatively for theorem-level $\Delta_i$, $Z_i$, $\mu_H^2$, $\lambda_H$, and gauge/Higgs finite-part intervals. Only a separately appended spectral branch extension fixed before validation comparison and evaluated by Theorem T.78, Definition T.78.10, and the relevant source theorem can supply a positive theorem-level tuple.

- "Conditional" or "Branch optimum" — the entry depends on an explicitly imposed normalization or branch input (e.g., $c_\ell/c_d = 8/3$ from Corollary T.34.1).

- "Imposed" or "Constraint" — the entry is supplied as a branch input rather than derived (e.g., the lepton-to-quark tilt normalization).

Theorem T.78.2, Corollary T.78.3, Theorem T.78.5, Theorem T.78.14, and Theorem T.79 are the controlling branch-ledger sections for the entire Appendix T quantitative ledger; entries in summary tables that omit branch labels or use unqualified "Derived" are governed by this convention.

### T.19.1 Quantitative Outputs and Status

|Parameter |PU construction / dependency |Framework value or status |Observed |Status |
|------------------------------------------|------------------------------------------------------------------------|---------------------------------|------------|----------|
|$\kappa_{EW}$ |$\frac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}$ with $B$ the pair--octad incidence matrix of $S(5,8,24)$ |$77/2=38.5$ |— |Exact on the registered Steiner response-action branch |
|$A_{EW}$ |One-loop determinant model |1.084 |— |Model layer |
|$v$ |$A_{EW} e^{-\kappa_{EW}} M_{Pl}$ |252 GeV |246 GeV |2.3% |
|$\sin^2\theta_W^{(0)}$ |PU-normalized fixed-point value |$3/8$ |— |Exact |
|$\sin^2\theta_W(\mu_G)$ |matching with lifted spectral thresholds |$\frac{3Z_2}{3Z_2+5Z_1}$ with $Z_i=1+\Delta_i/24$ on a completed branch; current PU-internal threshold interval $\varnothing_{\mathrm{cert}}$ |(matching-scale input) |Conditional on completed spectral input; current source class negatively closed by Theorem T.78.14 |
|$(\Delta_1,\Delta_2,\Delta_3)$ |Lifted spectral threshold shifts on $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$ (Definition T.17a)|$(15.14,\,20.94,\,18.41)$ validation tuple reproducing the previous matching outputs if obtained forward; Remark T.17a.4 and Proposition T.17a.5 show that every sector-independent affine local truncation gives $F_Y>0$, so the tuple must be compared against the global sector-resolving $\mathrm{MS2}_{\mu_G}$ block functional rather than inserted as input; Theorem T.78.14 proves that the current RHG, torsion, spectral-action, and equivalent source class supplies no certified interval for $\Delta_i$ or $Z_i$ |— |Validation target; current-framework electroweak source class closed negatively |
|$\sin^2\theta_W(M_Z)$ |SM RG from matched boundary |Conditional on the lifted spectral thresholds and $\delta_i$; validation runs remain comparison-only |$0.2312$ |Conditional|
|$5/3$ factor |Canonical hypercharge normalization |$5/3$ |$5/3$ |Derived |
|$\lambda_{\text{block}}$ |6 SU(2) blocks |$-1/36$ |— |Exact on the stated block branch |
|$\lambda_{\text{elastic}}(\gamma)$ |Projector algebra plus target-shift datum |$+\gamma^2/36$; $+1/36$ only for accepted $\gamma=1$ |— |Branch exact; moment-map datum required for the unit value |
|$\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU};\gamma)$|Abstract fixed-point quartic, not an SM running coupling or spectral-action Higgs finite part |$(\gamma^2-1)/36$; zero only for accepted $\gamma=1$ |(fixed-point branch value) |Branch exact; PU-to-SM matching remains open |
|$\mu_H^2,\lambda_H$ from spectral action |accepted $\mathfrak S_{\mathrm{SA}}(P)$ with Dirac certificate, cutoff, projections, heat coefficients, finite-part scale, tail, and normalization map |current PU-internal interval $\varnothing_{\mathrm{cert}}$ |— |No accepted current spectral-action source by Theorem T.78.14 |
|$m_H$ |external metastability-boundary comparison requiring a completed threshold record together with accepted $\mathfrak H_T$; not a spectral-action finite-part interval |$125$ GeV validation value; no accepted current $\mathfrak M_\lambda$ |$125.25$ GeV|Validation-level until the completed threshold record and every member of $\mathfrak H_T$ are fixed before comparison |
|$g_i(\mu_G)$ |PCE isotropy + matching |$g_U/\sqrt{Z_i}$ on a completed branch; current PU-internal threshold interval $\varnothing_{\mathrm{cert}}$ |(at $\mu_G$)|Boundary/conditional |
|$y_t^{\mathrm{PU}}(\mathfrak{A}_{PU})$ |$S_3$-democratic Higgs |1 |(PU units) |Exact |
|$c_\ell/c_d$ |Normalization constraint |$8/3$ |— |Constraint|
|$\mathcal{R}$ values |$E_8$ triads |${4/3, 3/2, 2, 3, 4}$ |(discrete) |Derived |
**Uncertainty budget for electroweak and transferred-prefactor outputs.** Each quantitative entry is reported with the paper-wide T1/T2/T3 decomposition of Convention P.14.1c and Section T.25.5.3. T1 records internal truncation/control, T2 records matching/threshold/branch/bridge/convention dependence, and T3 records empirical or model-mapping dependence. Rows for which a category is absent at the current working order are marked $0$ or negligible; a combined entry is used only when the manuscript has not yet supplied the pipeline needed to split the components.

|Quantity |Central (PU) |$\sigma_{T1}$ |$\sigma_{T2}$ |$\sigma_{T3}$ |$1\sigma$ theory |Dominant category and term |What shrinks it |
|---------------------|----------------:|----------------:|----------------:|----------------:|----------------:|---------------------------|-------------------------------------------------------------------------------------------------------------|
|$A_{EW}$ |$1.084$ |$0.005$ model allowance |$0$ |$0$ |$0.005$ |determinant-model curvature / Schur / Jacobian allowance; not a proved remainder bound |derive the determinant construction with explicit remainder bounds or replace it by a theorem-level prefactor |
|$v$ |$252\ \text{GeV}$|$1.2\ \text{GeV}$|$5\ \text{GeV}$ |$0$ |$5\ \text{GeV}$ |T2 matching and threshold dependence at $\mu_G$ |full 2-loop matching and threshold accounting at $\mu_G$ on an accepted threshold branch |
|$\sin^2\theta_W(M_Z)$|$0.2312$ validation-run value |negligible ($O(M^{-1})$ anisotropy) |$0.0015$ validation/threshold scale; current certificate interval $\varnothing_{\mathrm{cert}}$ |$0$ |$0.0015$ diagnostic only |T2 lifted thresholds, matching, and RG propagation; current source class negatively closed by Theorem T.78.14 |accepted $\Delta_i$ and $Z_i$ intervals from $\mathfrak R_{\mathrm{RHG}}$, $\mathfrak C_{\mathrm{tor}}$, $\mathfrak S_{\mathrm{SA}}(P)$, or an equivalent spectral tuple |
|$m_H$ |$125\ \text{GeV}$ conditional external-RG value |negligible |$2.5\ \text{GeV}$ (T2+T3 combined; diagnostic only while $\mathfrak M_\lambda$ is open) |included in T2 column |$2.5\ \text{GeV}$ conditional diagnostic |T2 completed-threshold, target-shift, PU-to-SM matching, marginality, RG, and decoupling inputs combined with T3 pole-mass conversion at the present working order (Theorem T.28); no current accepted $\mathfrak M_\lambda$ or spectral-action Higgs interval |a completed threshold record plus accepted $\mathfrak H_T$, higher-order residual control, and an accepted spectral-action Higgs finite-part ledger if such a claim is made |
|$A_{\text{eff}}$ |$0.923$ |$0.004$ |$0.010$ |$0$ at fixed forward-evaluation convention |$0.011$ |T2 bounce-determinant / zero-mode / finite-volume prefactor convention |compute ghost/zero-mode normalization under a fixed vacuum convention and derive the prefactor internally |

The $1\sigma$ theory column is the diagonal quadrature sum
$$
\sqrt{\sigma_{T1}^2+\sigma_{T2}^2+\sigma_{T3}^2}
$$
at the stated working order. The $A_{EW}$ entry is a determinant-model allowance, not a controlled theorem-level remainder estimate. For $v$, $\sigma_{T1}=1.2\ \text{GeV}$ is propagated from that allowance via $\delta v/v = \delta A_{EW}/A_{EW}$, and $\sqrt{1.2^2+5^2}=5.14\ \text{GeV}$ rounds to $5\ \text{GeV}$ at the stated precision. For $A_{\text{eff}}$, $\sqrt{0.004^2+0.010^2}=0.01077\approx 0.011$. For $\sin^2\theta_W(M_Z)$, the displayed $0.0015$ remains a validation/threshold diagnostic unless an accepted threshold source supplies $\Delta_i$ and $Z_i$ before comparison; by Theorem T.78.14 the current RHG, torsion, spectral-action, and equivalent source class supplies no such interval. For $m_H$, the $2.5\ \text{GeV}$ entry is a conditional diagnostic rather than a closed PU interval: the required forward pipeline consumes a completed threshold record together with $\mathfrak H_T=(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}})$ as recorded in Theorem T.28 and Theorem T.79.2. An independent spectral-action claim for $\mu_H^2$ or $\lambda_H$ additionally requires Definition X.9.6h.4 and does not replace any member of $\mathfrak H_T$ without an explicit matching map. The $A_{\text{eff}}$ row is a transferred vacuum-prefactor bookkeeping row rather than an electroweak observable.

### T.19.2 Dependency-Separated Chain

$$
\boxed{
\text{Golay } [24,12,8] \xrightarrow{b=6, k=12}
\begin{cases}
\kappa_{EW} = \tfrac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}=\tfrac{77}{2} \text{ (Steiner response-action branch)} \\[3pt]
A_{EW} = 1.084 \text{ (separate determinant-model branch)} \\[3pt]
v = A_{EW} e^{-\kappa_{EW}} M_{Pl} = 252 \text{ GeV} \text{ (model-conditional)} \\[3pt]
\sin^2\theta_W^{(0)} = 3/8;\quad \sin^2\theta_W(\mu_G) = \tfrac{3Z_2}{3Z_2+5Z_1} \text{ (completed-threshold branch)} \\[3pt]
\lambda_{\mathrm{PU}}(\mathfrak A_{PU};\gamma)=\lambda_{\mathrm{block}}+\lambda_{\mathrm{elastic}}(\gamma)=\tfrac{\gamma^2-1}{36} \\[3pt]
\bigl[\text{completed threshold record and accepted }\mathfrak H_T\bigr]
\longrightarrow \lambda_{\mathrm{SM}}(\mu_G)=0
\longrightarrow m_H\approx125\ \mathrm{GeV}\quad\text{(conditional forward map)} \\[3pt]
g_i(\mu_G)=g_U/\sqrt{Z_i} \text{ (matching)} \\[3pt]
y_t^{\mathrm{PU}}(\mathfrak{A}_{PU}) = |P_3 \mathbf{h}|_B = 1 \text{ (}S_3\text{-invariant projector)}
\end{cases}
}
$$

Separately, Proposition T.5 records the observed-input validation trajectory $\lambda_{\mathrm{SM}}(\mu_\lambda)=0$. That crossing neither identifies $\mu_\lambda$ with $\mu_G$ nor supplies the completed threshold record or any member of $\mathfrak H_T$, so it is not an arrow in the Golay derivation chain.

## T.20 Problems

### T.20.1 Algebraically Closed: Elastic Quartic as a Function of $\gamma$; Unit Branch Conditional

**Result**: Section T.15 derives $\lambda_{\text{elastic}}(\gamma)=\gamma^2/36$ via minimization over $(s,r)$ at $O(u^4)$. The numerical value $+1/36$ follows only on a branch carrying the accepted moment-map target-shift datum that fixes $\gamma=1$.

### T.20.2 Closed Subproblem: Isotropic Residual Thresholds; Principal Lift Requires Certificate

**Closed result**: Leading-order residual threshold effects are isotropic (Theorem T.17), giving only a common additive shift in $\alpha_i^{-1}(\mu_G)$ and leaving the gauge-factor separations controlled by the principal lifted spectral thresholds $\Delta_i$ (equivalently the matching factors $Z_i$) of Corollary T.13.1. Subleading anisotropic splittings are $O(M^{-1})$-suppressed (Corollary T.17.1).

**Unclosed numerical gate**: The numerical threshold tuple is not promoted by this isotropy result. The principal lifted spectral thresholds remain governed by the finite spectral certificate and the negative closure result of Theorem T.78.5. By Theorem T.78.14, the current PU-internal RHG, torsion, spectral-action, and equivalent spectral-source class supplies no certified interval for $\Delta_i$, $Z_i=1+\Delta_i/24$, $\mu_H^2$, $\lambda_H$, or any gauge/Higgs finite part. Therefore this subsection closes the isotropic residual subproblem and the current source-class classification, but not a positive theorem-level electroweak threshold tuple.

### T.20.3 Conditional Branch: PU-to-SM Quartic Matching and Marginality

**Status**: PCE zero slack fixes only $\lambda_{\mathrm{PU}}(\mathfrak A_{PU})=0$ on the accepted $\gamma=1$ branch. A value for the SM quartic at $\mu_G$ requires the separate matching record $\mathfrak M_\lambda$ of Definition T.25.2, and $\beta_\lambda(\mu_G)=0$ is an additional marginal-trajectory condition. Theorem T.26 derives the gauge-Yukawa relation only after both inputs are imposed.

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

**Remark T.29.3 (Requirements for a Zero-Point Refinement).** A zero-point refinement of the determinant model requires, before comparison:

1. a specified dimensionless transverse spectrum $\{\omega_i(u)\}$ and regularization;
2. a unit bridge converting $\frac{\ln2}{2}\sum_i\omega_i(u)$ into dimensionless link curvature;
3. the reflection symmetry, if any, that removes sine Fourier coefficients;
4. a forward evaluation of every retained Fourier coefficient with a remainder bound;
5. a derivation of the map from that curvature to $A_{\mathrm{link}}$.

Period $\pi$ alone gives the general expansion
$$
E_{zp}(u)
=
E_0+\sum_{k\ge1}
\left(a_k\cos2ku+b_k\sin2ku\right)
$$
and does not force a common phase center. Lemma T.3, Equation (O.2), and the unit Predictive-Ward branch of Theorem Z.14 normalize their own coordinates and kernels but do not fix an independent coupling between $E_{zp}$ and $A_{\mathrm{link}}$. No current theorem evaluates a coefficient $\mu_{zp}=0.00710$ or derives the deformation $(\cos u_0+\mu_{zp}\cos2u_0)^{-3}$. Moreover, if $E_{zp}=E_0+A_1\cos2(u-u_*)$ with $A_1>0$, then $E_{zp}''(u_*)=-4A_1<0$. Accordingly, the registered determinant-model value remains Theorem T.29's $A_{EW}=1.08406869\ldots$ and Corollary T.29.1's $v\approx252\,\mathrm{GeV}$; no zero-point-refined numerical row is integrated.

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

**Theorem T.31** (Generation projector construction in the fixed $S_3\times \mathbb{Z}_2$ basis). Relative to the ordered block decomposition of Theorem T.8, with the local fiber identification of its active rank-$2$ block, and the bases of Definition T.24a, the left-chiral space admits the orthogonal rank-2 decomposition
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
are the even- and odd-parity copies of the standard $S_3$ representation determined by the fixed $\mathbb{Z}_2$ basis $(\mathbf e,\mathbf a)$. ∎

**Corollary T.31.1** (Explicit Rational Form). The top-generation projector is:
$$
P_3 = \frac{1}{6}\left(\mathbf{1}_6 \mathbf{1}_6^T + \mathbf{s}\mathbf{s}^T\right)
$$
where $\mathbf{1}_6 = (1,1,1,1,1,1)^T$ and $\mathbf{s} = (1,-1,1,-1,1,-1)^T$.

**Corollary T.31.2** ($S_3$ invariance and parity splitting). The projector $P_3$ is the canonical rank-2 $S_3$-invariant plane containing the democratic direction. In the fixed parity basis of Definition T.24a, $P_1$ and $P_2$ are the even- and odd-parity copies of the standard $S_3$ representation.

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

**Remark T.32.1: Discrete-Action Verification.** The result $y_t^{\mathrm{PU}}(\mathfrak{A}_{PU}) = 1$ admits an independent derivation via the Yukawa source term. Adding to the discrete action (Definition T.12a):
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

**Definition T.34.1a** (Bures-Weight Representation-Variance Certificate). A Bures-weight representation-variance certificate is a branch record
$$
\mathfrak B_{\kappa}
=
(\kappa_1,\kappa_2,\kappa_3,\mathcal V_{\ell d})
\tag{T.34.1a.1}
$$
with $\kappa_i>0$ and
$$
\mathcal V_{\ell d}
:=
21\kappa_1+55\kappa_2-48\kappa_3.
\tag{T.34.1a.2}
$$
The certificate is accepted when $\mathcal V_{\ell d}=0$ is derived from a PU-internal representation-variance computation before using the lepton-to-quark tilt data. A raw Casimir trace without a derivation of (T.34.1a.2)$=0$ is not an accepted certificate.

**Theorem T.34.1b** (Tilt Normalization from a Bures-Weight Certificate). For positive Bures weights, the following are equivalent:
$$
\frac{c_\ell}{c_d}=\frac83,
\qquad
\frac{z_d}{z_\ell}=\frac{64}{9},
\qquad
\mathcal V_{\ell d}=0.
\tag{T.34.1b.1}
$$
Thus an accepted certificate $\mathfrak B_{\kappa}$ promotes the lepton-to-quark tilt normalization to a derived branch condition.

*Proof.* The equality $c_\ell/c_d=8/3$ is equivalent to $z_d/z_\ell=64/9$ because $c_{\mathrm{sector}}=Y_0/\sqrt{z_{\mathrm{sector}}}$ and $z_\ell,z_d>0$. Substituting
$$
z_\ell=\left(\frac34\kappa_2+\frac14\kappa_1\right)g_U^2,
\qquad
z_d=\left(\frac34\kappa_2+\frac1{36}\kappa_1+4\kappa_3\right)g_U^2
$$
and canceling $g_U^2$ gives exactly the algebra displayed in Corollary T.34.1:
$$
\frac{z_d}{z_\ell}=\frac{64}{9}
\quad\Longleftrightarrow\quad
21\kappa_1+55\kappa_2-48\kappa_3=0.
$$
This is $\mathcal V_{\ell d}=0$. ∎

**Corollary T.34.1c** (No Casimir-Only Closure of the Tilt). The value $c_\ell/c_d=8/3$ does not follow from the raw Standard Model Casimir table alone. It follows only after the Bures weights satisfy the certificate equation $\mathcal V_{\ell d}=0$.

*Proof.* The ratio is
$$
\frac{c_\ell}{c_d}
=
\sqrt{
\frac{\tfrac34\kappa_2+\tfrac1{36}\kappa_1+4\kappa_3}
{\tfrac34\kappa_2+\tfrac14\kappa_1}
}.
$$
For fixed Casimir entries, changing the positive weights $\kappa_i$ changes the ratio unless the weights are constrained. By Theorem T.34.1b, the exact value $8/3$ is equivalent to the additional weight equation $\mathcal V_{\ell d}=0$. ∎

**Corollary T.34.1d (No McKay-Only Forcing of the Tilt Normalization).** A McKay quiver or Dynkin-mark computation on the lifted flag problem does not by itself force
$$
21\kappa_1+55\kappa_2-48\kappa_3=0.
\tag{T.34.1d}
$$
Indeed, if the proposed representation-theoretic identification has the form
$$
\kappa_i=C_i\chi_i,
\qquad
i=1,2,3,
$$
where $C_i$ are discrete Casimir, mark, or node-weight data and $\chi_i>0$ are sector normalization factors, then McKay data can at most fix the $C_i$ and the adjacency/mark pattern. It does not fix the continuous relative scale vector $(\chi_1,\chi_2,\chi_3)$. The normalization constraint becomes
$$
21C_1\chi_1+55C_2\chi_2-48C_3\chi_3=0,
$$
which is an additional codimension-one condition on the scale vector unless a separate PU-internal normalization certificate fixes the $\chi_i$.

Thus the definite answer to the McKay question is negative in the McKay-only sense: $c_\ell/c_d=8/3$ remains an imposed normalization branch, or else the output of a separate Bures-weight representation-variance certificate. A raw McKay quiver, even if correctly computed, is not sufficient to promote Corollary T.34.1 to an unconditional theorem.

**Corollary T.34.2** (PCE-Optimal Bures Weights on the $c_\ell/c_d = 8/3$ Normalization Branch). On the lepton-to-quark tilt normalization branch $c_\ell/c_d = 8/3$ (Corollary T.34.1), equivalently on a branch carrying the Bures-weight certificate of Theorem T.34.1b, minimize the strictly convex PCE objective
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

### T.20.10 Branch-Qualified Fixed-Point and Matching Boundary Ledger

**Theorem T.35** (Branch-Qualified Electroweak Boundary Ledger). The PU fixed point and the separately declared matching data define the following ledger only on the named branches:
$$
\boxed{
\begin{aligned}
\lambda_{\mathrm{PU}}(\mathfrak{A}_{PU};\gamma) &= (\gamma^2-1)/36 \quad \text{(zero only with the accepted }\gamma=1\text{ datum, Theorems T.22b and T.25)}\\
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

These branch-resolved boundary formulas determine downstream observables only after every affected sector input is supplied. Gauge observables require the lifted spectral threshold data $Z_i=1+\Delta_i/24$ (Definition T.17a). A Higgs pole-mass row requires the completed threshold record together with $\mathfrak H_T=(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}})$. Flavor observables retain their separate normalization and profile ledgers. Neither threshold data nor the abstract zero-slack value closes those additional Higgs gates.

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

**Theorem T.39a (Unified Coupling on the Bures-Gauge Calibration Branch).** Let $\chi_U>0$ be the specified calibration in $\oint_\gamma\mathcal A_B=\chi_Ug_U^2$. For $M$ democratically assigned mode loops with Bures holonomy $2\pi/M$, the coupling satisfies $g_U^2=2\pi/(M\chi_U)$. The numerical value $g_U^2=\pi/6$ additionally assumes $M=24$ and $\chi_U=1/2$.

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
Definition T.39a.1 and Theorem T.39a.2 propagate the specified calibration $\chi_U$ through the prequantum branch; they do not select $\chi_U=1/2$. The following numerical specialization is conditional on that additional calibration.
The corresponding unified fine-structure constant is
$$
\alpha_U = \frac{g_U^2}{4\pi} = \frac{1}{24},
$$
giving
$$
\boxed{g_U = \sqrt{\frac{\pi}{6}} \approx 0.724, \qquad \alpha_U^{-1} = \frac{4\pi}{g_U^2} = M = 24.}
$$

**Consistency checks.** (i) The identity $\alpha_U^{-1}=M=24$ corresponds to $g_U^2=\pi/6$ (Theorem T.39a). (ii) With PU-to-SM matching $g_i(\mu_G)=g_U/\sqrt{Z_i}$ (Corollary T.13.1) and lifted spectral threshold data $Z_i=1+\Delta_i/24$ from Definition T.17a, one-loop SM running yields Z-pole gauge couplings once the threshold tuple is supplied, up to the residual finite shifts $\delta_i$ and $O(M^{-1})$ splittings (Definition T.19a; Corollary T.17.1). (iii) In the isotropic matching limit $Z_1=Z_2=Z_3$ one recovers the standard SU(5) tree-level ratios $(g')^2:g^2:g_s^2=\frac{3}{5}:1:1$ and $\sin^2\theta_W=3/8$ (Theorem T.14; Theorem T.27a). ∎

**Definition T.39a.1** (Kostant-Souriau Bures-Gauge Calibration Datum). A Kostant-Souriau Bures-gauge calibration datum on the matching branch consists of:

1. the Bures Kähler form $\omega_B$ on $\mathrm{Gr}(2,8)$ in the same normalization as Theorem T.39a;

2. a prequantum Hermitian line bundle $L_B\to\mathrm{Gr}(2,8)$ with compatible connection $\nabla_B$ satisfying
$$
F_{\nabla_B}=2\pi i\,\omega_B;
\tag{T.39a.1}
$$

3. a minimal mode loop $\gamma_1$ whose primitive Bures holonomy is the democratic mode period
$$
\oint_{\gamma_1}\mathcal A_B=\frac{2\pi}{M};
\tag{T.39a.2}
$$

4. the PU gauge generator normalization
$$
\operatorname{tr}(T_aT_b)=\frac12\delta_{ab};
\tag{T.39a.3}
$$

5. the calibration convention
$$
\oint_{\gamma_1}\mathcal A_B=\chi_U g_U^2,
\tag{T.39a.4}
$$
where $g_U$ is the PU-normalized unified gauge coefficient.

The datum is accepted only when (T.39a.1) and (T.39a.3) are fixed before using any gauge-coupling validation data.

**Theorem T.39a.2** (Gauge Coupling from a Specified Bures-Gauge Calibration Factor). On a branch carrying an accepted Kostant-Souriau Bures-gauge calibration datum with a specified coefficient $\chi_U>0$,
$$
g_U^2=\frac{2\pi}{M\chi_U},
\qquad
\alpha_U^{-1}=2M\chi_U.
\tag{T.39a.5}
$$
On the additional calibration branch $\chi_U=1/2$, these formulas give
$$
g_U^2=\frac{4\pi}{M}=\frac{\pi}{6},
\qquad
\alpha_U^{-1}=M=24.
$$

*Proof.* Equations (T.39a.2) and (T.39a.4) give
$$
\frac{2\pi}{M}=\chi_Ug_U^2.
$$
Division by $\chi_U>0$ yields $g_U^2=2\pi/(M\chi_U)$. Therefore
$$
\alpha_U^{-1}
=
\frac{4\pi}{g_U^2}
=
2M\chi_U.
$$
Substitution of $M=24$ and the additional calibration $\chi_U=1/2$ gives the final displayed values. The trace normalization $\operatorname{tr}(T_aT_b)=\delta_{ab}/2$ fixes the Lie-algebra basis but does not by itself fix $\chi_U$. ∎

**Problem T.3** (CKM/PMNS). *Solved for CKM sector in Section T.22 and PMNS sector in Section T.24.* The CKM matrix elements emerge from two limiting regimes of a unified overlap formula on the generation manifold $\mathrm{Gr}(2,8)$:

1. **Heavy-generation mixing** (3↔1, 3↔2): Gaussian overlap suppression $\exp(-\alpha d^2_{E_8})$ yields $|V_{cb}| = \sqrt{2/3} \cdot e^{-3} = 0.0407$ and $|V_{ub}| = 0.00392$ (Theorems T.46–T.48).
1. **Light-generation mixing** (1↔2): Geometric frustration between $D_4$ (cubic, $\theta_u = 90°$) and $A_2$ (hexagonal, $\theta_d = 120°$) symmetries, with stiffness-weighted vacuum at $\theta_{\mathrm{vac}} = 105.15°$, yields the Cabibbo angle $|V_{us}| = (\sqrt{3}/2)\sin(15.15°) \times f_{\mathrm{curv}} = 0.2261$ (Theorems T.49–T.52).
1. **CP violation**: On the minimal Berry-area branch, Berry holonomy around the flavor loop gives the base phase $\delta_{\mathrm{flat}}=70.53°$ (Theorems T.53–T.54). The symmetric average of Theorem T.55 changes visibility but not phase; the value $\delta=66.7°$ is conditional on the independent nonlinear response ansatz of Theorem T.56.

# Section T.21: Derivation of the Universal Hierarchy Parameter

## T.21.1 Introduction and Statement of Result

This section models mass differences between particle families as the effect of their geometric separation. One shared suppression coefficient controls the leading ratios, while physical labels, low-energy corrections, and absolute scales require additional records.

### Technical statement and notation

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

**Definition T.41.4a (Toeplitz-Kraus Yukawa Transition Branch).** Let
$$
P_i=|\psi_i\rangle\langle\psi_i|,\qquad P_j=|\psi_j\rangle\langle\psi_j|
$$
be generation-localized rank-one coherent projectors on the retained flavor Kähler branch over $(\mathrm{Gr}(2,8),g_B)$. A Yukawa magnitude kernel is on the Toeplitz-Kraus transition branch when the Yukawa interaction is represented operationally by the positive PPI-admissible measurement superoperator
$$
\mathcal Y_j(\rho)=P_j\rho P_j
\tag{T.41.4a.1}
$$
acting on the source generation density operator, up to a sector prefactor and a Berry phase factor carried separately by the connection on the flavor bundle. The physical Yukawa magnitude on this branch is the transition probability
$$
Y_{ij}^{\mathrm{mag}}\propto\operatorname{Tr}\!\big(\mathcal Y_j(P_i)\big)=\operatorname{Tr}\!\big(P_jP_iP_j\big)=\operatorname{Tr}(P_iP_j).
\tag{T.41.4a.2}
$$

**Theorem T.41.4b (Toeplitz-Kraus Probability-Overlap Gate).** On the Toeplitz-Kraus Yukawa transition branch of Definition T.41.4a,
$$
Y_{ij}^{\mathrm{mag}}\propto|\langle\psi_i|\psi_j\rangle|^2.
\tag{T.41.4b.1}
$$
The amplitude-overlap magnitude $|\langle\psi_i|\psi_j\rangle|$ is not an admissible replacement on this branch.

*Proof.* For rank-one projectors $P_i=|\psi_i\rangle\langle\psi_i|$ and $P_j=|\psi_j\rangle\langle\psi_j|$,
$$
P_jP_iP_j=|\psi_j\rangle\langle\psi_j|\psi_i\rangle\langle\psi_i|\psi_j\rangle\langle\psi_j|=\langle\psi_j|\psi_i\rangle\langle\psi_i|\psi_j\rangle\,P_j=|\langle\psi_i|\psi_j\rangle|^2P_j,
$$
where the last equality uses $\langle\psi_j|\psi_i\rangle=\overline{\langle\psi_i|\psi_j\rangle}$. Taking the trace and using $\operatorname{Tr}P_j=\langle\psi_j|\psi_j\rangle=1$ gives
$$
\operatorname{Tr}(P_jP_iP_j)=|\langle\psi_i|\psi_j\rangle|^2,
$$
which establishes (T.41.4b.1) via Definition T.41.4a.

The complex amplitude $\langle\psi_i|\psi_j\rangle$ is a section-level quantity whose phase depends on the local section choice $\psi_i\mapsto e^{i\theta_i}\psi_i$, $\psi_j\mapsto e^{i\theta_j}\psi_j$. Its modulus $|\langle\psi_i|\psi_j\rangle|$ is gauge-invariant, but it is the square root of the transition probability, not the expectation value of the positive Toeplitz-Kraus measurement map $\mathcal Y_j(\cdot)=P_j(\cdot)P_j$ on the projector state $P_i$. The probability overlap $|\langle\psi_i|\psi_j\rangle|^2=\operatorname{Tr}(P_iP_j)$ is the scalar selected by the positive operational transition branch. Thus the amplitude-overlap magnitude is not mathematically impossible in another model, but it is not the admissible kernel on the Toeplitz-Kraus branch defined in Definition T.41.4a. ∎

**Corollary T.41.4c (Berry-Phase Separation for Complex Yukawas).** On the Toeplitz-Kraus branch, complex Yukawa entries factor locally as
$$
Y_{ij}=|Y_{ij}|\,e^{i\theta_{ij}^{\mathrm{Berry}}},\qquad|Y_{ij}|\propto\operatorname{Tr}(P_iP_j).
\tag{T.41.4c.1}
$$
The magnitude is determined by Theorem T.41.4b; the phase $\theta_{ij}^{\mathrm{Berry}}$ is the holonomy of the retained flavor Berry connection along the chosen generation path, as in Theorems T.53–T.54 and Appendix Y. The numerical value $66.7°$ requires the additional response ansatz of Theorem T.56. The full Berry-phased matrix does not inherit the reality or determinant orientation of its positive magnitude matrix. Any strong-CP use therefore requires a common-convention absolute full-mass determinant-line certificate, such as a positively oriented reference pair together with determinant-one full complex transport; determinant-one holonomy without the base orientation, and entrywise magnitude positivity, are insufficient.

*Proof.* The probability overlap $\operatorname{Tr}(P_iP_j)$ is a gauge-invariant nonnegative real scalar, so it can determine only the magnitude $|Y_{ij}|$. A transported Yukawa section between $P_i$ and $P_j$ on the flavor bundle acquires an additional phase equal to the holonomy of the Berry connection along the generation path; this phase is gauge-invariant modulo $2\pi$ on closed loops by Lemma T.53.2 and supplies the base CKM/PMNS phase of Theorems T.53–T.54 and the Appendix Y CP-odd response datum. The numerical CKM phase $66.7°$ additionally requires the response ansatz of Theorem T.56, and baryon production additionally requires the driven gate of Theorem Y.6.1i. Combining the magnitude from Theorem T.41.4b with the Berry phase gives (T.41.4c.1). ∎


**Definition T.41.4d (Schur-Heat Realization of the Yukawa Magnitude Kernel).** On the retained flavor boundary branch, let the quadratic predictive operator split into visible flavor-boundary and internal blocks,
$$
L=
\begin{pmatrix}
L_{BB} & L_{BI}\\
L_{IB} & L_{II}
\end{pmatrix},
\qquad
L_{II}>0.
\tag{T.41.4d.1}
$$
The Schur-reduced flavor operator is
$$
\Lambda_{\mathrm{fl}}
=
L_{BB}-L_{BI}L_{II}^{-1}L_{IB}.
\tag{T.41.4d.2}
$$
Let
$$
K_\tau^{\mathrm{fl}}:=e^{-\tau\Lambda_{\mathrm{fl}}}
\tag{T.41.4d.3}
$$
be its heat kernel on the retained generation manifold. The Schur-heat Yukawa branch is the specialization of the Toeplitz-Kraus probability-overlap branch for which
$$
|Y_{ij}|
=
\mathcal N_f
\left\langle r_j\middle|K_{\tau_*}^{\mathrm{fl}}\middle|r_i\right\rangle
\tag{T.41.4d.4}
$$
with sector normalization $\mathcal N_f$ carried by the Bures/gauge normalization factors of Sections T.20.8-T.20.11, and with the attractor heat time
$$
\tau_*=\frac{\sigma_B^2}{2}.
\tag{T.41.4d.5}
$$
Berry phases remain separated as in Corollary T.41.4c.

**Theorem T.41.4e (Schur-Heat Kernel Gives the Universal Hierarchy Exponent).** On the local Schur-heat branch of Definition T.41.4d, assume the retained heat-kernel certificate of Corollary X.8k.4a on $(\mathrm{Gr}(2,8),g_B)$. Then
$$
|Y_{ij}|
=
\mathcal N_f
(4\pi\tau_*)^{-12}
\Delta_{\mathrm{VVM}}(r_i,r_j)^{1/2}
\exp\left[-\frac{d_B(r_i,r_j)^2}{4\tau_*}\right]
\left(1+O(\tau_*)\right).
\tag{T.41.4e.1}
$$
Using $\tau_*=\sigma_B^2/2$ gives
$$
\log |Y_{ij}|
=
\log\mathcal N_f
-
12\log(4\pi\tau_*)
-
\frac{d_B(r_i,r_j)^2}{2\sigma_B^2}
+
\frac12\log\Delta_{\mathrm{VVM}}(r_i,r_j)
+
O(\sigma_B^2).
\tag{T.41.4e.2}
$$
In the flat local constant-Van-Vleck truncation this reduces to Theorem T.41.5 and, after Lemma T.41.4,
$$
\log |Y_{ij}|
=
-\frac{d_{E_8}^2(r_i,r_j)}{16\sigma_B^2}
+
\text{sector constant},
\tag{T.41.4e.3}
$$
so the hierarchy coefficient is
$$
\alpha=\frac{1}{16\sigma_B^2}.
\tag{T.41.4e.4}
$$

*Proof.* Definition T.41.4d defines the Yukawa magnitude as the Schur-heat matrix element of the finite boundary operator. Corollary X.8k.4a gives the local heat-kernel expansion
$$
K_{\tau}^{\mathrm{fl}}(r_i,r_j)
=
(4\pi\tau)^{-12}
\Delta_{\mathrm{VVM}}(r_i,r_j)^{1/2}
\exp\left[-\frac{d_B(r_i,r_j)^2}{4\tau}\right]
\left(1+O(\tau)\right),
$$
because $\dim_{\mathbb R}\mathrm{Gr}(2,8)=24$. Substitution of $\tau=\tau_*=\sigma_B^2/2$ gives (T.41.4e.1) and (T.41.4e.2). If the local chart is taken in the flat Gaussian truncation used by Theorem T.41.5, then $\Delta_{\mathrm{VVM}}=1+O(d_B^2)$ and the heat-kernel prefactor together with $\mathcal N_f$ is absorbed into the sector constant, leaving
$$
\log |Y_{ij}|
=
-\frac{d_B(r_i,r_j)^2}{2\sigma_B^2}
+
\text{sector constant}.
$$
Lemma T.41.4 gives $d_B^2=d_{E_8}^2/8+O(u^4)$, hence (T.41.4e.3) at quadratic order. Matching the exponent to $\log(m_j/m_i)=\alpha d_{E_8}^2$ gives (T.41.4e.4). ∎

**Theorem T.41.5** (Gaussian Overlap and Yukawa Suppression on the Toeplitz-Kraus Probability-Overlap Branch).
Let $\psi_i,\psi_j$ be generation-localizing wavepackets modeled as isotropic Gaussians on $(\mathrm{Gr}(2,8),g_B)$ with common variance $\sigma_B^2$. The amplitude overlap is

$$
\langle \psi_i \mid \psi_j \rangle \propto \exp\!\left(-\frac{d_B^2}{4\,\sigma_B^2}\right).
$$

On the Toeplitz-Kraus probability-overlap branch of Definition T.41.4a and Theorem T.41.4b, the physical Yukawa magnitude is the squared wavefunction overlap:

$$
Y_{ij}\propto\left|\langle\psi_i\mid\psi_j\rangle\right|^2\propto\exp\!\left(-\frac{d_B^2}{2\,\sigma_B^2}\right).
$$

The amplitude-overlap magnitude would give $Y_{ij}\propto\exp(-d_B^2/(4\sigma_B^2))$, halving the exponent and yielding $\alpha_{\mathrm{amp}}=1/(32\sigma_B^2)=3/4$ rather than $\alpha_{\mathrm{prob}}=1/(16\sigma_B^2)=3/2$. Theorem T.41.4b rules out the amplitude-overlap replacement on the positive Toeplitz-Kraus transition branch by Definition T.41.4a; complex Berry phases remain in the separate holonomy factor of Corollary T.41.4c. The CKM base holonomy is treated in Theorems T.53–T.54, its optional nonlinear response in Theorem T.56, and the PMNS construction in Theorems T.24.19–T.24.22.

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

**Triad calibration boundary.** The condition $\mathcal R=3$ together with the allowed set $\{2,4,6,8\}$ has the unique arithmetic solution $(d_{32}^2,d_{31}^2)=(2,6)$. This is conditional on first selecting $\mathcal R=3$ and assigning the generation labels. Error-correcting properties of $E_8$, $D_4$, Golay, or Hamming codes do not make that physical selection. A predictive test must preregister the candidate triads and selection score.



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

|Quantity |Prediction|Conservative model allowance|Observation|Residual divided by allowance |
|:-----------------:|:--------:|:---------:|:---------:|:----------:|
|$\ln(m_\tau/m_\mu)$|$2.836$ |$\pm 0.06$ |$2.822$ |$+0.23$|
|$\ln(m_\mu/m_e)$ |$5.672$ |$\pm 0.12$ |$5.332$ |$+2.83$|
|$\ln(m_\tau/m_e)$ |$8.508$ |$\pm 0.18$ |$8.154$ |$+1.97$|

*Note on allowances: The values $(\pm 0.06, \pm 0.12, \pm 0.18)$ are conservative linear allowances obtained from $0.5\%+1\%+0.5\%=2\%$, rounded at the displayed precision. They are not standard deviations and carry no probabilistic coverage statement. A statistical uncertainty requires probability models and a covariance matrix for the sinc truncation, higher-order curvature terms, and RG contribution. Experimental mass uncertainties from Particle Data Group 2024 contribute $<0.01\%$ and are negligible at this precision.*

The $\tau/\mu$ splitting is reproduced at sub-percent level. The systematic deviations for $\mu/e$ and $\tau/e$ are reduced after adopting the conditional fourth-order coefficient and effective-dimension assignments of Section T.21.8; the agreement does not derive those inputs.



**Table T.21.2** (Charged leptons: predictions including $\mathcal{O}(d^4)$ curvature correction).

|Quantity |$d^2$|$D_{\mathrm{eff}}$|Corrected|Observation|Deviation|
|:-----------------:|:---:|:----------------:|:-------:|:---------:|:-------:|
|$\ln(m_\tau/m_\mu)$|$2$ |$3/8$ |$2.8212$ |$2.8224$ |$-0.042%$|
|$\ln(m_\mu/m_e)$ |$4$ |$13/6$ |$5.3306$ |$5.3316$ |$-0.019%$|
|$\ln(m_\tau/m_e)$ |— |(path sum) |$8.1518$ |$8.1540$ |$-0.027%$|

With the registered model inputs, all three displayed ratios lie within $0.05%$ of the quoted observations. Theorem T.42.6 makes these conditional model outputs and requires a separate remainder certificate. The $\tau/e$ value is the path sum $\ln(m_\tau/m_\mu)+\ln(m_\mu/m_e)$, so logarithmic additivity is exact by construction.



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

### T.21.7.3 Conditional Geometric Correction

The sinc transport and Grassmannian Van Vleck terms are geometric ingredients on their stated branch. The piecewise values $D_{eff}(2)=3/8$ and $D_{eff}(4)=13/6$ are separate phenomenological inputs of Theorem T.42.5. Neither $d^2=4$ nor either value is a Golay decoding boundary or a consequence of Leech gluing.

Numerical agreement obtained after adopting those values validates that model branch only; it does not turn the assignment into a first-principles derivation. The hierarchy formula below must therefore carry forward-calibration status and compare preregistered alternatives.



The dominant UV-to-IR reduction arises from the sinc correction (Theorem T.24.2.1):

$$
\alpha_{\mathrm{IR}} = \alpha_{\mathrm{UV}} \times f_{\mathrm{sinc}} = \frac{3}{2} \times \frac{\sin(1/\sqrt{3})}{1/\sqrt{3}} = 1.418.
$$

This accounts for the $5.5%$ reduction from $\alpha_{\mathrm{UV}} = 3/2$ to $\alpha_{\mathrm{IR}} = 1.418$, matching the empirical extraction $\alpha_{\mathrm{IR}}^{\mathrm{emp}} = 1.411$ within $0.5%$.

The complete hierarchy formula including $\mathcal{O}(d^4)$ corrections is derived in Section T.21.8 **(Theorem T.42.6)**. The fourth-order coefficient $\beta_{\mathrm{geom}}$ arises from the Van Vleck–Morette determinant in the Gaussian overlap integral on Riemannian manifolds [DeWitt 1965], applied to the Grassmannian $\mathrm{Gr}(2,8)$ with Bures metric. On the democratic visible-response branch $L_{\mathrm{vis}}=1/(ad_0)$ of Theorem Z.24, the effective curvature is $K_{\mathrm{eff}}=2$. Together with the Bures variance $\sigma_B^2=1/24$ (Lemma T.41.2) and the Van Vleck coefficient $1/12$, this gives the conditional curvature coefficient $\beta_{\mathrm{geom}}=1/144=1/C$.

The effective geodesic dimension $D_{\mathrm{eff}}(d^2)$ uses two declared phenomenological assignments at $d^2_{\mathrm{th}}=4$:

- **Lower-distance assignment** ($d^2<d^2_{\mathrm{th}}=4$): $D_{\mathrm{eff}}=3/8$
- **Boundary-value assignment** ($d^2=d^2_{\mathrm{th}}=4$): $D_{\mathrm{eff}}=13/6$

*Remark: Conditional Hamming-Chordal Calibration.* The inclusion $\sqrt2E_8\hookrightarrow\Lambda_{24}$ scales Euclidean squared distances but does not canonically assign Golay supports to root pairs. On the marked calibration branch of Lemma T.42.4, the two registered charged-lepton pairs satisfy $h_{ij}=2d_{ij}^2$, so the pair with $d^2=4$ is assigned $h=8=d_{\min}$. This is a branch coordinate assignment. It is not a theorem that $d^2=4$ is a geometric decoding boundary; the Golay unique-decoding radius is $t=3$, and Hamming ties can occur at radius $4$.

-----

## T.21.8 Fourth-Order Hierarchy Model and Certificate Boundary

The following section separates exact path additivity from model inputs. A normalized packet-overlap integral and controlled remainder are required to derive a fourth-order coefficient. Golay decoding does not determine a Grassmannian distance threshold or an effective geodesic dimension. The coefficient, effective-dimension assignment, and higher-order bound therefore remain forward-locked model entries unless their stated certificates are supplied.



The few-percent deviations in Table T.21.1 arise from the $\mathcal{O}(d^4)$ curvature correction on $\mathrm{Gr}(2,8)$. This section provides a conditional derivation using:

1. The Van Vleck–Morette determinant for Gaussian overlaps on curved manifolds [DeWitt 1965]
1. The intrinsic Bures curvature of $\mathrm{Gr}(2,8)$ together with the democratic visible-response input $L_{\mathrm{vis}}=1/(ad_0)$, which yields $K_{\mathrm{eff}}=2$ in Theorem Z.24 (Theorem Z.24; Lemma Z.24a)
1. The Golay parameters $(t,d_{\min},k)=(3,8,12)$ [MacWilliams & Sloane 1977] and the separately registered assignments $D_{\mathrm{eff}}(2)=3/8$ and $D_{\mathrm{eff}}(4)=13/6$
1. The path-additivity principle for generation triangles

### T.21.8.1 Normalized Overlap-Certificate Requirement

### T.21.8.2 Geometric Coefficient Status

**Lemma T.42.1a** (Conditional Packet-Overlap Expansion). Let $\mathcal I(d)$ be a specified normalized packet-overlap kernel. Assume that, for $0\le d<d_*$,
$$
\mathcal I(d)
=
e^{-\alpha_{\mathrm{flat}}d^2}
\left(
1+\frac{K_{\mathrm{sec}}}{12}\sigma_B^2d^4+R_6(d)
\right),
\qquad
|R_6(d)|\le C_6d^6,
$$
and that the factor in parentheses is positive. Then
$$
-\ln\mathcal I(d)
=
\alpha_{\mathrm{flat}}d^2
-
\frac{K_{\mathrm{sec}}}{12}\sigma_B^2d^4
+
O(d^6)
$$
as $d\to0$.

*Proof.* Put
$$
x(d)=\frac{K_{\mathrm{sec}}}{12}\sigma_B^2d^4+R_6(d).
$$
The assumptions give $x(d)=O(d^4)$. Taylor's theorem for $\log(1+x)$, on a sufficiently small interval where $1+x>0$, gives
$$
\log(1+x(d))=x(d)+O(x(d)^2)
=
\frac{K_{\mathrm{sec}}}{12}\sigma_B^2d^4+O(d^6),
$$
because $R_6(d)=O(d^6)$ and $x(d)^2=O(d^8)$. Therefore
$$
-\log\mathcal I(d)
=
\alpha_{\mathrm{flat}}d^2-\log(1+x(d))
=
\alpha_{\mathrm{flat}}d^2
-
\frac{K_{\mathrm{sec}}}{12}\sigma_B^2d^4
+
O(d^6).
$$
The packet-specific expansion and a bound placing $d^2=2,4$ within its controlled regime must be supplied separately before numerical use. ∎

**Remark T.42.1.1: Universality of 1/12.** *The coefficient $1/12$ is universal across all Riemannian manifolds and appears in:*

- *Gray–Vanhecke geodesic ball volume expansions [Gray & Vanhecke 1979, Theorem 3.1]*
- *Heat kernel short-time asymptotics [Berger, Gauduchon & Mazet 1971, §E.III]*
- *Synge's world-function expansion [Synge 1960, §2.3]*

*It does not depend on any framework-specific assumptions beyond the choice of metric.*

### T.21.8.2a Effective Curvature and the Geometric Coefficient

**Theorem T.42.2** (Conditional Geometric Curvature Coefficient). *Assume the normalized overlap model of Lemma T.42.1a and the democratic visible-response branch $L_{\mathrm{vis}}=1/(ad_0)$ of Theorem Z.24. Then the fourth-order geometric correction coefficient is:*

$$
\boxed{\beta_{\mathrm{geom}} = \frac{K_{\mathrm{eff}}}{12}\,\sigma_B^2 = \frac{1}{C} = \frac{1}{bM} = \frac{1}{144}}
$$

*Here $K_{\mathrm{eff}}=2$ follows from Theorem Z.24 under the stated visible-response assumption, $\sigma_B^2=1/24$ is the Bures variance (Lemma T.41.2), and $C=bM=144$ is the vacuum capacity (Theorem Z.13a).*

*Proof.*

**Step 1** (Effective curvature on the democratic visible-response branch). Theorem Z.24 defines
$$
K_{\mathrm{eff}}=(M-1)K_{\mathrm{avg}}^{\mathrm{Bures}}L_{\mathrm{vis}}.
$$
The symmetric-space geometry fixes $K_{\mathrm{avg}}^{\mathrm{Bures}}=32/23$, while the declared democratic response model supplies $L_{\mathrm{vis}}=1/(ad_0)=1/16$. Therefore
$$
K_{\mathrm{eff}}=23\times\frac{32}{23}\times\frac1{16}=2.
$$
By Lemma Z.24a, the response factor $L_{\mathrm{vis}}$ is an independent branch input and is not implied by Grassmannian isotropy.

**Step 2** (Bures variance from Lemma T.41.2). Capacity saturation at the PCE-attractor yields:
$$
\sigma_B^2 = \frac{1}{M} = \frac{1}{24}
$$

**Step 3** (Direct calculation). Applying Lemma T.42.1a:
$$
\beta_{\mathrm{geom}} = \frac{K_{\mathrm{eff}}}{12}\,\sigma_B^2 = \frac{2}{12} \times \frac{1}{24} = \frac{1}{6} \times \frac{1}{24} = \frac{1}{144}
$$

**Step 4** (Vacuum capacity identification). From Theorem Z.13a, the vacuum capacity is $C = bM = 6 \times 24 = 144$. The identity
$$
\beta_{\mathrm{geom}} = \frac{1}{C}
$$
demonstrates that the curvature correction is naturally scaled by the vacuum capacity—the same quantity governing the Golay code constraint structure. ∎

**Remark T.42.2.1: Conditional Coefficient Identity.** *On the democratic visible-response branch, the identity $\beta_{\mathrm{geom}}=1/C$ combines three inputs:*

- *$K_{\mathrm{eff}}=(M-1)K_{\mathrm{avg}}^{\mathrm{Bures}}L_{\mathrm{vis}}=2$ when $L_{\mathrm{vis}}=1/(ad_0)$ (Theorem Z.24)*
- *$\sigma_B^2=1/M$ is determined by capacity saturation (Lemma T.41.2)*
- *$C=bM$ is the vacuum capacity from Golay structure (Theorem Z.13a)*

*The discrete constants are $(K_0,d_0,a,b,M)=(3,8,2,6,24)$; $L_{\mathrm{vis}}$ is a separate response-model input.*

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

### T.21.8.4 Calibration-Pending Chordal Coordinate

### T.21.8.5 Model Assignment of Effective Dimension

**Definition T.42.3a (Marked-Branch Chordal Coordinate).** On the marked Hamming-chordal calibration branch of Lemma T.42.4, define
$$
d_{\mathrm{th}}^2:=\frac{d_{\min}}2=4.
$$
This symbol records the pair assigned $h=d_{\min}$; it does not identify the Golay unique-decoding radius or derive a Grassmannian geometric threshold.

**Lemma T.42.4** (Conditional Hamming-Chordal Calibration). Fix a marked Leech construction, a specified embedding $\sqrt2E_8\hookrightarrow\Lambda_{24}$, and a map from each generation pair to a binary representative in the associated Golay frame. Assume that the marked representatives satisfy
$$
h_{ij}=2d_{ij}^2
$$
for the two charged-lepton pairs used in the hierarchy calculation. Then
$$
(d_{\tau\mu}^2,d_{\mu e}^2)=(2,4)
\quad\Longrightarrow\quad
(h_{\tau\mu},h_{\mu e})=(4,8).
$$

*Proof.* Substitute $d_{\tau\mu}^2=2$ and $d_{\mu e}^2=4$ into the assumed marked-pair calibration $h_{ij}=2d_{ij}^2$. This gives $h_{\tau\mu}=4$ and $h_{\mu e}=8$. The lattice inclusion alone supplies no Hamming-support map. ∎

### T.21.8.5a Two Geodesic Regimes and Effective Dimension

The effective geodesic dimension $D_{\mathrm{eff}}(d^2)$ quantifies how many independent directions contribute to the quartic curvature correction.

**Theorem T.42.5** (Effective Geodesic Dimension on the Golay assignment branch). *On the Golay effective-dimension branch, the effective dimension $D_{\mathrm{eff}}(d^2)$ entering the Van Vleck curvature correction is assigned by the following model rule built from registered Golay parameter ratios:*

$$
D_{\mathrm{eff}}(d^2) = \begin{cases}
\displaystyle\frac{t}{d_{\min}} = \frac{3}{8} & \text{for the registered } d^2=2 \text{ assignment} \\[12pt]
\displaystyle\frac{k+1}{b} = \frac{13}{6} & \text{for the registered } d^2=4 \text{ assignment}
\end{cases}
$$

*where $t = 3$ is the Golay error correction capacity, $d_{\min} = 8$ is the minimum distance, $k = 12$ is the code dimension, and $b = 6$ is the inactive subspace dimension. The Golay data $(t, d_{\min}, k, b)$ are theorem-level inputs from Theorem Z.13. The assignment of these ratios as the effective curvature dimensions entering the Van Vleck expansion is the branch rule used in the charged-lepton hierarchy calculation.*

-----

**Registered pair I** ($d^2=2<d^2_{\mathrm{th}}=4$ on the marked calibration branch).

**Theorem T.42.5a** (Sub-threshold Effective Dimension). *For the declared $d^2=2<4$ branch, the effective dimension is:*

$$
D_{\mathrm{eff}} = \frac{t}{d_{\min}} = \frac{3}{8}
$$

*Proof.* On the marked Hamming-chordal calibration branch of Lemma T.42.4, $d^2=2$ is assigned $h=4$. The extended Golay code has
$$
d_{\min}=8,
\qquad
t=\left\lfloor\frac{d_{\min}-1}{2}\right\rfloor=3.
$$
Thus $h=4$ lies outside the guaranteed unique-decoding ball. No unique-syndrome-leader conclusion follows at this weight.

The Golay effective-dimension branch separately defines the model assignment
$$
D_{\mathrm{eff}}(2)
:=
\frac{t}{d_{\min}}
=
\frac38.
$$
The Golay parameters determine the numerical ratio, while its use as a Van Vleck effective dimension is an independent branch rule. ∎

-----

**Registered pair II** ($d^2=d^2_{\mathrm{th}}=4$ on the marked calibration branch).

**Theorem T.42.5b** (Threshold-Branch Effective-Dimension Assignment). On the Golay effective-dimension branch, define
$$
D_{\mathrm{eff}}(4)
:=
\frac{k+1}{b}
=
\frac{13}{6},
$$
where $k=12$ and $b=6$.

*Proof.* The marked Hamming-chordal calibration assigns $d^2=4$ the value $h=8=d_{\min}$. This identifies the code's minimum nonzero codeword separation, not the unique-decoding radius; the latter is $t=3$, with possible ties beginning at radius $4$. The effective-dimension value is therefore not a consequence of decoder-boundary geometry. It is the declared branch assignment
$$
\frac{k+1}{b}
=
\frac{12+1}{6}
=
\frac{13}{6}.
$$
No tangent-rank conclusion follows from the binary syndrome-map rank without an additional geometric bridge. ∎



**Remark T.42.5.2 (Branch Dependence of the Golay-to-Van-Vleck Assignment).** The numerical values $D_{\mathrm{eff}}(2) = 3/8$ and $D_{\mathrm{eff}}(4) = 13/6$ depend on the Golay assignment branch introduced in Theorem T.42.5. The named supporting theorems (Theorem Z.13 for the Golay parameters, Lemma T.42.4 for the Hamming-chordal correspondence, Lemma T.42.1a for the universal Van Vleck coefficient, Theorem T.42.2 for $\beta_{\mathrm{geom}}$, Theorem Z.5 for QFI isotropy) supply the constituent quantities but do not uniquely force the identification of $t/d_{\min}$ and $(k+1)/b$ as the Van Vleck effective dimensions in the two regimes. An alternative assignment branch $D_{\mathrm{eff}}(d^2) \equiv 1$ for both regimes would respect the same named helper results while changing the curvature-correction weighting. A change $\delta D_{\mathrm{eff}} \sim 0.03$ shifts the $\mu/e$ log prediction by approximately $0.005$, comparable to the stated theory uncertainty.

**Remark T.42.5.1: Physical Interpretation.** *The $\mu/e$ mass ratio uses the declared branch assignment $D_{\mathrm{eff}}(4)=13/6$. Under the marked calibration, $d^2=4$ maps to Hamming separation $h=8=d_{\min}$; the Golay unique-decoding radius is $t=3$, with possible ties beginning at radius $4$. The larger curvature correction follows from the assigned effective dimension.*

### T.21.8.6 Conditional Hierarchy Model

**Theorem T.42.6 (Conditional Fourth-Order Charged-Lepton Model).** Assume the six branch entries of Theorem T.42.7, including a specified normalized packet kernel with expansion radius $d_*$ and certified logarithmic remainder $\mathcal R_6(d)$; assume $\sqrt2<d_*$ and $2<d_*$ for the two registered separations; and assume the marked pair assignments $d_{\tau\mu}^2=2$, $d_{\mu e}^2=4$. Then
$$
\ln\!\left(\frac{m_j}{m_i}\right)
=\alpha_{\mathrm{IR}}d_{ij}^2
-\frac{\alpha_{\mathrm{IR}}}{C}
D_{\mathrm{eff}}(d_{ij}^2)d_{ij}^4
+\mathcal R_6(d_{ij}),
$$
where $C=144$, $D_{\mathrm{eff}}(2)=3/8$, and $D_{\mathrm{eff}}(4)=13/6$ are the declared branch values. Path additivity gives
$$
\ln\!\left(\frac{m_\tau}{m_e}\right)
=\ln\!\left(\frac{m_\tau}{m_\mu}\right)
+\ln\!\left(\frac{m_\mu}{m_e}\right).
$$

*Proof.* The effective Lemma T.42.1a gives the logarithmic expansion inside $d<d_*$. Theorem T.42.2 supplies the registered quartic coefficient $1/C$ on its packet-normalization branch, and the effective T.42.5 results supply the two model assignments for $D_{\mathrm{eff}}$. The two radius hypotheses license evaluation at $d=\sqrt2$ and $d=2$. Substitution gives the adjacent-pair equations, and the logarithmic identity of Theorem T.42.2a gives the path sum. ∎

**Zero-Remainder Central Truncation:**

|Ratio |$d^2$|Assignment |$D_{\mathrm{eff}}$|$d^4$|Quartic term|Central value with $\mathcal R_6=0$|
|:--------:|:---:|:-----------:|:----------------:|:---:|:--------:|:--------:|
|$\tau/\mu$|$2$ |Marked-calibration $d^2=2$ assignment|$3/8$ |$4$ |$0.0148$ |$2.8212$ |
|$\mu/e$ |$4$ |Marked-calibration $d^2=4$ assignment|$13/6$ |$16$ |$0.3414$ |$5.3306$ |
|$\tau/e$ |— |Path sum |— |— |— |$8.1518$ |

Setting the uncalibrated remainder to zero gives
$$
\begin{aligned}
\ln(m_\tau/m_\mu)_{\mathrm{central}}
&=1.418\cdot2-\frac{1.418}{144}\frac38\cdot4=2.8212,\\
\ln(m_\mu/m_e)_{\mathrm{central}}
&=1.418\cdot4-\frac{1.418}{144}\frac{13}{6}\cdot16=5.3306,\\
\ln(m_\tau/m_e)_{\mathrm{central}}
&=2.8212+5.3306=8.1518.
\end{aligned}
$$

**Retrospective comparison with the quoted mass inputs:**

|Quantity |Central truncation|Quoted value|Difference|
|:-----------------:|:--------:|:---------:|:-------:|
|$\ln(m_\tau/m_\mu)$|$2.8212$ |$2.8224$ |$-0.04\%$ |
|$\ln(m_\mu/m_e)$ |$5.3306$ |$5.3316$ |$-0.02\%$ |
|$\ln(m_\tau/m_e)$ |$8.1518$ |$8.1540$ |$-0.03\%$ |

These are calibration residuals of the zero-remainder central truncation. Prediction intervals require a preregistered marked map, effective-dimension assignment, coefficient, and certified bounds for $\mathcal R_6(\sqrt2)$ and $\mathcal R_6(2)$. Path additivity is an exact logarithmic identity once the two adjacent values are supplied. ∎

**Corollary T.42.6a** (Electron Mass from Tau Mass). *Given the tau mass $m_\tau = 1776.86$ MeV, the electron mass is:*

$$
m_e = m_\tau \times \exp\!\left(-8.1518\right) = 1776.86 \times 2.8821610 \times 10^{-4}\,\mathrm{MeV} = 0.5121197\,\mathrm{MeV}.
$$

*Relative to the PDG value $m_e = 0.510998950$ MeV, the branch value is higher by $0.219\%$.*

### T.21.8.7 Parameter and Certificate Ledger

**Theorem T.42.7** (Conditional Hierarchy-Parameter Ledger). Once the following branch entries are specified before comparison,

1. the structural tuple $(K_0,d_0,a,b,M)=(3,8,2,6,24)$;
2. the Bures metric and packet-width normalization;
3. the hierarchy response coefficient $\alpha_{\mathrm{IR}}$;
4. a normalized packet-overlap expansion with controlled remainder;
5. a marked Hamming-chordal correspondence; and
6. the effective-dimension assignments $D_{\mathrm{eff}}(2)=3/8$ and $D_{\mathrm{eff}}(4)=13/6$,

the displayed charged-lepton logarithms are determined with no further continuous fit.

*Proof.* Substitution of the registered entries into Theorem T.42.6 fixes each term in
$$
\ln(m_j/m_i)
=
\alpha_{\mathrm{IR}}d_{ij}^2
-
\frac{\alpha_{\mathrm{IR}}}{144}
D_{\mathrm{eff}}(d_{ij}^2)d_{ij}^4
+
R_6(d_{ij}).
$$
If the remainder certificate fixes $R_6$, no free coefficient remains in this formula. The theorem is conditional on the six entries and does not derive them solely from $K_0$ and $\varepsilon_0$. ∎

### T.21.8.8 Conditional Extension to the Quark Sector

**Theorem T.42.8** (Quark Sector Hierarchy). *The same geometric framework applies to quarks with sector-specific triads and prefactors:*

$$
\ln\!\left(\frac{m_j}{m_i}\right)_f = c_f \cdot \left[\alpha_{\mathrm{IR}}\,d^2_{ij,f} - \frac{\alpha_{\mathrm{IR}}}{C} \cdot D_{\mathrm{eff}}(d^2_{ij,f}) \cdot d^4_{ij,f}\right] + \mathcal{O}(d^6)
$$

*where $c_f$ is the sector prefactor (Theorem T.38) and $(d^2_{32,f}, d^2_{21,f})$ are the adjacent-generation $E_8$ distances for sector $f$.*

**Remark T.42.8.1: QCD Corrections.** *Quark-sector predictions apply to short-distance Yukawa eigenvalues (or $\overline{\text{MS}}$ masses) at the matching scale $\mu_G$. A precision comparison to quoted masses requires SM RG evolution to $\mu_{\mathrm{EW}}$, QCD decoupling at heavy thresholds, and multi-loop running in a specified scheme; the explicit protocol and T1/T2/T3 uncertainty decomposition are given in Section T.25.5.3. Same-scale hierarchy invariants provide a controlled intermediate diagnostic under common-scheme reduction (Section T.25.5.4), and the down-sector $A_2/D_4$ frustration correction is derived in Section T.25.6a with a matching uncertainty budget (Section T.25.6a.11).*

-----

## T.21.9 Quark Sector and Sector Prefactors

The same geometric hierarchy applies to quarks, with generation-independent sector prefactors determined by gauge/Bures normalization at the attractor.

### T.21.9.1 Explicit $E_8$ Triads for Quark Sectors

The displayed quark triads were chosen using the observed hierarchy and are therefore retrospective calibration candidates. A predictive use must lock the candidate set and selection score before new mass data are compared.



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

## T.21.10 Conditional Leech-Lattice Compatibility

A Leech identification is available only after the discriminant-form marking, maximal isotropic subgroup, glue representatives, and coset-minimum ledger of Lemma R.4.5 are registered. On that branch, a marked $(\sqrt2E_8)^3$ sublattice can occur inside the Leech overlattice and its norms scale by the homothety.

Homothety alone does not prove even unimodularity, rootlessness, family labels, hierarchy distances, or a physical response map. The numerical equality of a lattice rank with $M=24$ is a compatibility record, not a construction or physical identification.



The Leech lattice $\Lambda_{24}$ is constructed via Construction A as a union of cosets of the sublattice $\sqrt{2}E_8 \oplus \sqrt{2}E_8 \oplus \sqrt{2}E_8$, with coset representatives determined by the extended binary Golay code $\mathcal{G}_{24}$ (Conway–Sloane, *Sphere Packings, Lattices and Groups*).

On the registered gluing branch, scaling by $\sqrt{2}$ maps $E_8$ roots of squared norm $2$ to scaffold vectors of squared norm $4$. The gluing and coset-minimum certificate establishes even unimodularity and minimum norm $4$, and the homothety is consistent with Lemma T.41.4 in a common physical normalization:

$$
d^2_{E_8} \xrightarrow{\times\sqrt{2}} d^2_{\sqrt{2}E_8} = 2 d^2_{E_8},
$$

so that $E_8$ distances ${2, 4, 6, 8}$ map to ${4, 8, 12, 16}$ in the Leech embedding. This aligns with the interface dimension $M = 24$ and the Golay error-correction structure at the PU fixed point $\mathfrak{A}_{PU}$.

-----

## T.21.11 Summary

The hierarchy model uses one geometric suppression rule across the charged-lepton, neutrino, and quark sectors. It reproduces several leading ratios once the sector labels and normalizations are supplied, while the absolute mass scale and higher corrections remain separately calibrated.

### Technical results ledger

1. The hierarchy of inter-generation masses is governed by

$$
\ln\!\left(\frac{m_j}{m_i}\right) = \alpha\,d^2_{E_8}(r_i,r_j), \qquad \alpha = \frac{1}{16\,\sigma_B^2}.
$$

1. At the PU fixed point $\mathfrak{A}_{PU}$, the Predictive Ward identity fixes the quadratic kernel, isotropy fixes the covariance structure, and capacity saturation fixes the normalization $\langle r_B^2 \rangle = 1$. Together these yield

$$
\sigma_B^2 = \frac{1}{24}, \qquad \alpha_{\mathrm{UV}} = \frac{3}{2}.
$$

1. The effective infrared exponent from charged leptons is $\alpha_{\mathrm{IR}} = 1.411 \approx \sqrt{2}$, reproducing $\ln(m_\tau/m_\mu)$ at the $0.2%$ level.
1. The leading ratio invariant $\mathcal{R}:=d^2_{31}/d^2_{32}=3$ is a statement about the declared distance triad. The sub-$0.05%$ numerical agreement occurs only after the model coefficient and $D_{eff}$ assignments of Theorem T.42.6 are supplied; it does not derive those entries.


1. On the declared triad-selection model, $(d^2_{32},d^2_{31})=(2,6)$ is the minimal-$d^2_{32}$ candidate with $\mathcal R=3$; no Golay or Leech theorem fixes that physical assignment.


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

**Remark T.45.1 (Leading-order normalization gap).** The leading absolute normalization misses the observed tau mass by an order-one factor. The displayed ratio values are conditional outputs of Theorem T.42.6 after its distance, coefficient, effective-dimension, and calibration entries are fixed; their common-prefactor cancellation does not supply the missing overlap or remainder certificates. Until both the absolute-normalization ledger and the ratio-model certificates close, neither layer is a parameter-free prediction.



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
*Here $\ln(m_\tau/m_\mu)=2.8212$ and $\ln(m_\tau/m_e)=8.1518$ are conditional hierarchy-model values from Theorem T.42.6, while $v_{\rm PU}=252\ \text{GeV}$ is itself branch-conditional under Theorems T.6 and T.29.*



*Proof.* **Step 1 (RGE setup).** Using GUT-normalized $g_1^2=\tfrac{5}{3}g_Y^2$, the two-loop $\overline{\rm MS}$ beta functions for the coupled set $\{g_1^2,g_2^2,g_3^2,y_t^2,\lambda,y_\tau^2\}$ are given in Buttazzo et al. (2013), Appendix B, eqs. (96)–(103) (with $y_b$ set to $0$ here). At one loop the tau Yukawa satisfies
$$
16\pi^2\,\frac{d y_\tau}{d\ln\mu}
= y_\tau\!\left[
3y_t^2 + \frac{5}{2}y_\tau^2 - \frac{9}{4}g_2^2 - \frac{9}{4}g_1^2
\right],
$$
and we include the full two-loop contributions in the numerical integration below. Neglecting $y_b$ and lighter Yukawas (numerically irrelevant for $\eta_\tau$ at the stated precision), the gauge part of the matching-scale boundary is
$g_i^2(\mu_G)=g_U^2/Z_i$ with $g_U^2=\pi/6$ (Theorem T.39a) and $Z_i=1+\Delta_i/24$ from the lifted spectral threshold data (Definition T.17a). The displayed validation integration separately inserts $y_t(\mu_G)=0.392$ from the validation tuple of Remark T.26.2 and the external SM trajectory input $\lambda_{\mathrm{SM}}(\mu_G)=0$. Neither value is derived from the threshold triplet; a predictive Higgs boundary would require the matching and criticality records of Definition T.25.2 and Theorem T.26.

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

**Step 4 (Muon and electron masses from conditional ratio inputs).** After the Theorem T.42.6 model values are supplied,


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

*The $m_\tau$ row is a self-consistency check because $y_\tau(\mu_G)$ was extracted from observation. The $m_\mu$ and $m_e$ rows compare the conditional Theorem T.42.6 ratio model after the overall scale and its phenomenological entries are fixed; they are not parameter-free tests.*



**Interpretation.** The rows are validation comparisons for a conditional ratio model, not independent parameter-free predictions. The absolute normalization remains open: the leading value gives $m_\tau^{(0)}\approx0.94\ \text{GeV}$, about a factor $1.9$ below observation.



**Definition T.45.1b (Absolute Lepton-Normalization Correction Ledger).** An absolute lepton-normalization correction ledger is a finite record
$$
\mathfrak N_\ell
=
(\Delta_{\mathrm{thr}},\Delta_{\mathrm{VVM}}^{\mathrm{abs}},\Delta_{\mathrm{aniso}},I_\ell,\chi_\ell)
\tag{T.45.1b.1}
$$
fixed at the matching scale $\mu_G$, where:

1. $\Delta_{\mathrm{thr}}$ is the finite threshold-matching factor for the tau Yukawa normalization on the same SM running convention used in Lemma T.45.1a.
2. $\Delta_{\mathrm{VVM}}^{\mathrm{abs}}$ is the absolute-normalization Van Vleck-Morette determinant factor computed from a specified Bures heat-kernel or Jacobi-field determinant on the same $\mathrm{Gr}(2,8)$ branch as Theorem T.42.6, including the geodesic endpoints, determinant convention, and retained effective dimension.
3. $\Delta_{\mathrm{aniso}}$ is the finite PCE-anisotropy factor relating the isotropic normalization $1/(72\sqrt{12})$ to the retained lepton-sector block.
4. $I_\ell=[L_\ell^-,L_\ell^+]$ is a certified residual interval for omitted higher-order matching and curvature terms in logarithmic units.
5. $\chi_\ell=1$ records that no entry of the ledger is selected using $m_\tau$, $m_\mu$, or $m_e$.

Write
$$
\Delta_\ell
:=
\Delta_{\mathrm{thr}}\Delta_{\mathrm{VVM}}^{\mathrm{abs}}\Delta_{\mathrm{aniso}}.
\tag{T.45.1b.2}
$$
A scalar Van Vleck-Morette multiplier is admissible in the absolute mass anchor only as the entry $\Delta_{\mathrm{VVM}}^{\mathrm{abs}}$ of such a ledger; the geodesic angle, retained dimension, and full determinant convention are part of the datum.

**Theorem T.45.1c (Absolute Mass Anchor Determinacy from a Normalization Ledger).** If $\mathfrak N_\ell$ is accepted, then the forward absolute charged-lepton anchor is
$$
y_{\tau,\mathrm{abs}}(\mu_G)
=
\mathcal N_{\rm PU}c_\ell\Delta_\ell,
\qquad
\mathcal N_{\rm PU}=\frac{1}{72\sqrt{12}},
\tag{T.45.1c.1}
$$
and the corresponding forward interval is
$$
\log m_\tau^{\mathrm{abs}}
\in
\log\left(\frac{v_{\rm PU}}{\sqrt2}\eta_\tau\mathcal N_{\rm PU}c_\ell\Delta_\ell\right)
+
[L_\ell^-,L_\ell^+].
\tag{T.45.1c.2}
$$
The muon and electron absolute intervals are obtained by subtracting the ratio exponents of Theorem T.42.6 from the same tau interval. If $\mathfrak N_\ell$ is absent, the displayed leading-order value $m_\tau^{(0)}\approx0.94\ \mathrm{GeV}$ remains only the flat-isotropic anchor, while the charged-lepton ratios remain governed by Theorem T.42.6.

*Proof.* Once $\mathfrak N_\ell$ is accepted, every multiplicative correction to the absolute Yukawa normalization is fixed before comparison. Multiplying the flat-isotropic source $\mathcal N_{\rm PU}c_\ell$ by the ledger product (T.45.1b.2) gives (T.45.1c.1). The physical tau mass is obtained from the standard matching relation $m_\tau=(v_{\rm PU}/\sqrt2)\eta_\tau y_{\tau,\mathrm{abs}}(\mu_G)$; taking logarithms and adding the certified residual interval gives (T.45.1c.2). The ratio formulas of Theorem T.42.6 are independent of the common absolute prefactor, so $\log m_\mu=\log m_\tau-\log(m_\tau/m_\mu)$ and $\log m_e=\log m_\tau-\log(m_\tau/m_e)$ use the same interval. Without the ledger, at least one of the threshold, Van Vleck-Morette, anisotropy, residual, or forward-lock entries is undefined, so no scalar normalization correction is determined by the theorem stack. ∎

**Status ledger (parametric / scheme):**

| Entry | Current status |
|:--|:--|
| Two-loop SM running and electroweak matching | scheme-defined computation |
| Matching-scale threshold correction | not yet computed |
| Fourth-order overlap coefficient | model input pending the normalized-overlap certificate |
| $D_{eff}(2)$ and $D_{eff}(4)$ | forward-locked phenomenological assignments |
| Sixth-order remainder | no certified bound; $0.005$ is only a labeled model allowance |
| Leech/Golay relation | conditional on Lemma R.4.5's registered gluing datum |

Path additivity is exact once adjacent-edge values are supplied. It does not derive the coefficient, effective dimensions, or remainder. The numerical mass-ratio agreement is therefore conditional and carries no zero-parameter or Golay-decoding claim.

-----



| Source | Contribution | Status |
| :----- | :----------: | :----: |
| Two-loop SM RGE + electroweak-threshold matching (scheme: $\mu_{\rm EW}\in[m_t,v_{\rm PU}]$) | $\eta_\tau = 1.1127 \pm 0.0033$ | Computed (scheme-defined) |
| Two-loop threshold matching at $\mu_G$ in the absolute normalization | not yet computed | TBD |
| $E_8$ log-ratio theory uncertainty ($d^2/M$ expansion) | $0.005$ in $\ln$ per ratio | Labeled model allowance; remainder certificate open |

1. The Leech lattice connection via $\sqrt{2}E_8$ and the Golay code aligns with the $M = 24$ interface mode structure.
1. Theorem T.42.5 registers two effective-dimension assignments at $d^2_{\mathrm{th}}=d_{\min}/2=4$ for the $\mathrm{Gr}(2,8)$ model:
- **Lower-distance assignment** ($d^2<4$): $D_{\mathrm{eff}}=t/d_{\min}=3/8$.
- **Boundary-value assignment** ($d^2=4$): $D_{\mathrm{eff}}=(k+1)/b=13/6$.

Path additivity (Theorem T.42.2a) ensures $\ln(m_\tau/m_e) = \ln(m_\tau/m_\mu) + \ln(m_\mu/m_e)$ exactly. On the democratic visible-response branch $L_{\mathrm{vis}}=1/(ad_0)$ of Theorem Z.24, the conditional value $K_{\mathrm{eff}}=2$ gives $\beta_{\mathrm{geom}}=K_{\mathrm{eff}}\sigma_B^2/12=1/144$ in the declared Van Vleck model. The displayed sub-$0.05\%$ comparisons are conditional on that response input, the registered hierarchy coefficient, the effective-dimension assignments, and controlled higher-order remainders; they are not zero-adjustable-parameter consequences of the PU axioms.

-----

## T.21.12 Conditional Model Verification

The computational checks verify arithmetic and path additivity after the geometric distances, $\alpha_{IR}$, curvature coefficient, and $D_{eff}$ assignments are supplied. They do not verify a Hamming--chordal map, a Golay decoding boundary, or a no-free-parameter derivation of the effective dimensions.

A valid forward test must lock the two-value assignment and at least one alternative before mass-ratio comparison, propagate both numerical uncertainties, and report their relative predictive scores. The Leech and Golay structures may label candidate models only after their independent gluing and response maps are registered. The mass ratios are conditional outputs of the declared hierarchy model.



The following ledger separates theorem inputs, branch assignments, and model-layer entries:

|Quantity |Value |Source / locator |Role / status |
|:-----------------------------------|:--------------------|:----------------|:---------------------------------------------------------|
|$K_0$ |$3$ |Theorem 15 |Horizon Constant (SPAP encodability) |
|$N_{\mathrm{vis}}^{\min}$ |$8$ |Theorem 15 |$2^{K_0}$ |
|$d_0$ |$8$ |Theorem 23; Theorem Z.2 |$d_0=N_{\mathrm{vis}}^{\min}$ on the minimal complex Hilbert branch |
|$(a, b)$ |$(2, 6)$ |Theorem Z.1; Theorem Z.2 |Structural binary record, sharp match/mismatch admissibility, $d_0=8$, and PPI/PCE no-surplus selection |
|$(\kappa_1^*,\kappa_2^*,\kappa_3^*)$|$(0.695,0.729,1.140)$|Corollary T.34.2 |PCE optimum with normalization constraint |
|$g_U^2$ |$\pi/6$ |Theorem T.39a |Holonomy per mode $2\pi/M$ |
|$\mathcal{N}_{PU}$ |$1/(72\sqrt{12})$ |Section T.21.11 |Democratic × capacity × isotropy |
|$M$ |$24$ |Theorem Z.5 |$2ab$ (QFI-active modes) |
|$K_{\mathrm{eff}}$ |$2$ on the democratic visible-response branch |Theorem Z.24; Lemma Z.24a |$(M-1)K_{\mathrm{avg}}^{\mathrm{Bures}}L_{\mathrm{vis}}$ with the independent input $L_{\mathrm{vis}}=1/(ad_0)$ |
|$\sigma_B^2$ |$1/24$ |Lemma T.41.2 |Capacity saturation |
|$1/12$ |Universal |Van Vleck–Morette|World-function expansion coefficient |
|$\beta_{\mathrm{geom}}$ |$1/144$ |Theorem T.42.2 |$(K_{\mathrm{eff}}/12)\sigma_B^2 = 1/C$ |
|$C$ |$144$ |Theorem Z.13a |$bM = 6 \times 24$ (vacuum capacity) |
|$t$ |$3$ |Definition T.1a |$\lfloor(d_{\min}-1)/2\rfloor$ (Golay correction capacity)|
|$d_{\min}$ |$8$ |Definition T.1a |Golay minimum distance |
|$k$ |$12$ |Definition T.1a |Golay code dimension |
|$d^2_{\mathrm{th}}$ |$4$ |Definition T.42.3a; Lemma T.42.4 |Marked-coordinate label $d_{\min}/2$; not a decoding or geometric threshold |
|$D_{\mathrm{eff}}(d^2 = 2)$ |$3/8$ |Theorem T.42.5a |Registered assignment $t/d_{\min}$; no unique-decoding-basin inference |
|$D_{\mathrm{eff}}(d^2 = 4)$ |$13/6$ |Theorem T.42.5b |Registered assignment $(k+1)/b$; no decoder-boundary inference |

**Derivation chain:**

$$
K_0 = 3 \to d_0 = 8 \to (a,b) = (2,6) \to M = 24 \to \sigma_B^2 = \frac{1}{24} \to \alpha_{\mathrm{UV}} = \frac{3}{2} \to \alpha_{\mathrm{IR}} = 1.418
$$

$$
L_{\mathrm{vis}}=\frac1{ad_0}
\xrightarrow{\text{Thm Z.24}}
K_{\mathrm{eff}}=2
\xrightarrow{\text{Van Vleck; Thm T.42.2}}
\beta_{\mathrm{geom}}=\frac{K_{\mathrm{eff}}}{12}\sigma_B^2=\frac1{144}=\frac1C
$$

$$
\mathcal{G}_{24}[24,12,8]\to(t,d_{\min},k)=(3,8,12),
\qquad
\underbrace{d^2_{\mathrm{th}}:=d_{\min}/2=4,\;h_{ij}=2d_{ij}^2}_{\text{marked calibration}},
\qquad
\underbrace{D_{\mathrm{eff}}(2):=t/d_{\min},\;D_{\mathrm{eff}}(4):=(k+1)/b}_{\text{effective-dimension assignments}}
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

Path additivity (Theorem T.42.2a) guarantees this identity is satisfied exactly by construction.

-----

# Part VI: Flavor Mixing

# Section T.22: CKM Matrix from $E_8$ Grassmannian Geometry

## T.22.1 Conditional CKM-Model Status

The CKM construction is a geometric flavor model whose triads, packet widths, sector weights, holonomies, threshold maps, phases, and remainder intervals must be specified before a forward comparison. Unitarity identities and arithmetic evaluation are exact after those inputs are supplied. The observed matrix is not completely derived while the flavor certificate of Theorem T.79 remains open.



The Cabibbo-Kobayashi-Maskawa (CKM) matrix parametrizes quark flavor mixing in the Standard Model, encoding the mismatch between mass and weak interaction eigenstates (Cabibbo 1963; Kobayashi & Maskawa 1973). Its elements exhibit a striking hierarchical pattern: diagonal elements near unity, off-diagonal elements suppressed by powers of the Cabibbo angle λ ≈ 0.22. This section computes the CKM matrix elements within the branch-qualified $E_8$ Grassmannian model of Section T.21, completing **Problem T.3** at the model layer.

The derivation proceeds through a unified framework with two limiting regimes:

1. **Heavy-generation mixing** (3↔1, 3↔2): Gaussian overlap suppression on the generation manifold Gr(2,8)
1. **Light-generation mixing** (1↔2): Geometric frustration between incompatible lattice symmetries

The model uses the following prior branch entries:

- hierarchy coefficient $\alpha=3/2$ on the packet-width and Schur-normalization branch of Corollary T.41.3;
- registered $E_8$ triad distances from Section T.21.9.1;
- $N_g=3$ from the anomaly/CP minimality class of Theorem R.3.4 together with the additive-monotone selection branch of Proposition R.3.5.1a; and
- sector stiffness ratio $\kappa_d/\kappa_u=1.02$ on the normalization branch of Theorem T.38.

Proposition R.4.2 supplies triality/$E_8$/Leech compatibility, not an independent family-count derivation.

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
- *$\alpha=3/2$ on the Toeplitz-Kraus probability-overlap branch of Theorem T.41.4b and Theorem T.41.5 (Corollary T.41.3)*

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

**Theorem T.46 (Conditional Heavy-Generation Mixing Amplitude).** Assume the additive-monotone family-count branch of Proposition R.3.5.1a, the registered sector distances, the CKM geometric-prefactor convention $\sin^2\theta=d^2/N_g$, and the Gaussian-overlap response branch with coefficient $\alpha$. Then
$$
|V_{3j}|
=\sqrt{\frac{d_{3j,f}^2}{N_g}}
\exp(-\alpha d_{\mathrm{ref}}^2),
$$
where $d_{\mathrm{ref}}^2=\min(d_{3j,d}^2,d_{3j,u}^2)$. On the selected family branch $N_g=3$; on the Corollary-T.41.3 normalization branch $\alpha=3/2$.

*Proof.*

**Step 1 (Geometric prefactor on the CKM geometric-prefactor branch).** On the CKM geometric-prefactor branch, the geometric prefactor arises from rotation generators in $N_g$-dimensional generation space. For an $SU(N_g)$ rotation by angle $\theta$ in the $i$-$j$ plane, the mixing element is proportional to $\sin\theta$. Two related conventions appear in the literature: (a) $\sin^2\theta = d^2/N_g$, giving $|V| \propto \sqrt{d^2/N_g}$ (the convention adopted in the displayed formula and used numerically in Theorems T.47–T.48); (b) $\sin^2\theta = d^2/(2N_g)$, giving $|V| \propto \sqrt{d^2/(2N_g)}$ (which would absorb an additional factor of $1/\sqrt{2}$ relative to the displayed numerical results). This appendix uses convention (a) throughout, so $|V_{cb}| = \sqrt{d^2_{32,d}/N_g} \cdot e^{-\alpha d^2_{32,d}} = \sqrt{2/3} \cdot e^{-3}$. The choice between (a) and (b) is the CKM geometric-prefactor branch; convention (b) would multiply both $|V_{cb}|$ and $|V_{ub}|$ by $1/\sqrt{2}$ relative to the convention (a) values used here.

**Step 2 (Exponential suppression).** The exponential factor exp(−αd²) comes from Gaussian wavefunction overlap. From Theorem T.41.5, the Yukawa coupling (and hence mixing amplitude) satisfies:
$$Y_{ij} \propto \exp\left(-\frac{d^2_{E_8}}{16\sigma^2_B}\right) = \exp(-\alpha d^2_{E_8})$$

**Step 3 (Reference distance selection).** When both up and down sectors contribute to the transition amplitude, the total amplitude is:
$$V_{3j} = A_d e^{i\phi_d} + A_u e^{i\phi_u}$$

The exponential suppression $\exp(-\alpha d^2_{\mathrm{ref}})$ represents tunneling through the dominant path connecting generations, with $d^2_{\mathrm{ref}} = \min(d^2_{3j,d}, d^2_{3j,u})$. Both sector amplitudes share this tunneling factor because the weak vertex couples to both mass eigenstate bases through the common generation transition. The sector-specific geometric weights $\sqrt{d^2_{3j,f}/N_g}$ encode the projection onto each sector's $E_8$ configuration.

For $|V_{cb}|$, where $d^2_{32,d} = 2 \ll d^2_{32,u} = 4$, the ratio of tunneling factors $e^{-3}/e^{-6} \approx 20$ renders the up-sector negligible. For $|V_{ub}|$, the shared reference $d^2_{\mathrm{ref}} = 4$ admits comparable sector amplitudes whose interference generates the observed magnitude and CP phase. ∎

**Convention T.CKM.1 (Single Comparison Ledger).** Unless a row explicitly names a direct channel or another fit, CKM comparisons in this branch use the PDG-2024 global-fit tuple
$$
|V_{us}|=0.22501\pm0.00068,
\quad
|V_{cb}|=0.04183^{+0.00079}_{-0.00069},
\quad
|V_{ub}|=0.003732^{+0.000090}_{-0.000085},
$$
$$
J=(3.12^{+0.13}_{-0.12})\times10^{-5},
\qquad
\delta_{\mathrm{CKM}}=65.72^\circ\pm1.49^\circ.
$$
Pulls use the uncertainty on the side of the central value toward the prediction. Direct-channel and global-fit values are not combined in one row or aggregate.

### T.22.4.2 Calculation of $\vert V_{cb}\vert$

**Theorem T.47** ($\vert V_{cb}\vert$ from $E_8$ Geometry). *The CKM element $\vert V_{cb}\vert$ is:*

$$|V_{cb}| = \sqrt{\frac{2}{3}} \times e^{-3} = 0.0407$$

*Proof.*

**Step 1 (Parameter identification).** From Section T.21.9.1:

- d²_{32,d} = 2 (down-sector distance)
- d²_{32,u} = 4 (up-sector distance)
- d²_ref = min(2, 4) = 2

On the branch hypotheses of Theorem T.46:

- $N_g=3$ follows from Theorem R.3.4 together with the additive-monotone selection branch of Proposition R.3.5.1a;
- $\alpha=3/2$ is the Corollary-T.41.3 packet-width and Schur-normalization assignment.

**Step 2 (Geometric prefactor).**
$$\sqrt{\frac{d^2_{32,d}}{N_g}} = \sqrt{\frac{2}{3}} = 0.81650$$

**Step 3 (Exponential suppression).**
$$e^{-\alpha d^2_{\mathrm{ref}}} = e^{-(3/2)(2)} = e^{-3} = 0.04979$$

**Step 4 (Final result).**
$$|V_{cb}| = 0.81650 \times 0.04979 = 0.0407$$

**Experimental comparison** (Particle Data Group 2024):
$$|V_{cb}|_{\mathrm{PDG24}}=0.04183^{+0.00079}_{-0.00069}$$

|Quantity|Theory|Experiment |Deviation|
|:-------|:----:|:-------------:|:-------:|
|$\lvert V_{cb}\rvert$ | $0.0407$ | $0.04183^{+0.00079}_{-0.00069}$ | $-1.6\sigma$ |

∎

### T.22.4.3 Calculation of $\vert V_{ub}\vert$

For the 1→3 transition:

- d²_{31,d} = 4, d²_{31,u} = 8
- d²_ref = min(4, 8) = 4

Both sectors contribute with a relative CP phase.

**Theorem T.48** ($\vert V_{ub}\vert$ on the Declared Interference-Phase Branch). *Assume the relative sector phase is registered as $\phi_u-\phi_d=\pi-\delta$. Then:*

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

**Step 3 (Independent interference-phase hypothesis).** The half-surface relation would give $\Delta\gamma=\delta/2$ under the stated geometric partition; it does not imply $\pi-\delta$. The numerical branch therefore adopts $\phi_u-\phi_d=\pi-\delta$ as a separate interference-phase hypothesis.

**Step 4 (Interference formula).** The total amplitude is:
$$V_{ub} = A_d + A_u e^{i(\phi_u - \phi_d)} = A_d + A_u e^{i(\pi - \delta)} = A_d - A_u e^{-i\delta}$$

Taking the modulus squared:
$$|V_{ub}|^2 = |A_d|^2 + |A_u|^2 - 2\mathrm{Re}[A_d^* A_u e^{-i\delta}] = |A_d|^2 + |A_u|^2 - 2|A_d||A_u|\cos\delta$$

**Step 5 (Numerical evaluation on the nonlinear phase-response branch).** With $\delta=66.7°$ under the independently registered ansatz of Theorem T.56:
$$|A_d|^2 = (0.00286)^2 = 8.19 \times 10^{-6}$$
$$|A_u|^2 = (0.00405)^2 = 1.64 \times 10^{-5}$$
$$-2|A_d||A_u|\cos(66.7°) = -2(0.00286)(0.00405)(0.3955) = -9.15 \times 10^{-6}$$
$$|V_{ub}|^2 = 8.19 \times 10^{-6} + 1.64 \times 10^{-5} - 9.15 \times 10^{-6} = 1.54 \times 10^{-5}$$
$$|V_{ub}| = \sqrt{1.54 \times 10^{-5}} = 0.00392$$

**Experimental comparison** (Particle Data Group 2024):
$$|V_{ub}|_{\mathrm{PDG24}}=0.003732^{+0.000090}_{-0.000085}$$

|Quantity|Theory |Experiment |Deviation|
|:-------|:-----:|:---------------:|:-------:|
|$\lvert V_{ub}\rvert$ | $0.00392$ | $0.003732^{+0.000090}_{-0.000085}$ | $+2.1\sigma$ |

∎

**Corollary T.48.1** (Interference Sign on the Declared Phase Branch). Once the independent hypothesis $\phi_u-\phi_d=\pi-\delta$ is declared, $e^{i(\pi-\delta)}=-e^{-i\delta}$ and the cross term is $-2|A_d||A_u|\cos\delta$. The minus sign follows algebraically on that branch; the present construction does not derive the phase hypothesis from the Berry half-surface relation. ∎

-----

## T.22.5 Light-Generation Mixing: Frustration Regime

### T.22.5.1 The Geometric Frustration Mechanism

The perturbative tunneling formula predicts $\vert V_{us}\vert_{\mathrm{pert}}$ ~ exp(−αd²) ~ 0.002 for d² = 4, severely underpredicting the observed value of 0.225. This two-orders-of-magnitude discrepancy signals a qualitatively different mechanism.

**Theorem T.49** (Geometric Frustration). *The light generations (1 and 2) inhabit a shared vacuum valley where the physical state must reconcile two incompatible geometric constraints from the $E_8$ root lattice:*

- *Up-sector: d²₁₂ = 4 → θ_u = 90° (Cubic/D₄ symmetry)*
- *Down-sector: d²₁₂ = 6 → θ_d = 120° (Hexagonal/A₂ symmetry)*

*The vacuum minimizes elastic energy by aligning with the stiffness-weighted geometric bisector.*

*Proof.*

**Step 1 (Constraint incompatibility).** From Lemma T.44a, the up-sector enforces orthogonal generation alignment (90°) while the down-sector enforces hexagonal alignment (120°). These constraints are incompatible—no single vacuum orientation satisfies both.

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

for κ₃ in the phenomenologically relevant range. Since stiffness scales as $\kappa\propto c^2$, $c_d/c_u=1.02$ would give $\kappa_d/\kappa_u=1.0404$. The numerical branch below instead registers $\kappa_d/\kappa_u=1.02$ as an independent model input, corresponding to $c_d/c_u=\sqrt{1.02}\approx1.00995$.

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

**Step 1 (Lattice angles from $E_8$ distances).** From Lemma T.44a:
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
$$|V_{us}|_{\mathrm{PDG24}}=0.22501\pm0.00068$$

|Quantity|Theory|Experiment |Deviation|
|:-------|:----:|:-------------:|:-------:|
|$\lvert V_{us}\rvert$ | $0.2261$ | $0.22501\pm0.00068$ | $+1.6\sigma$ |

∎

**Remark T.52.1: Sensitivity to Stiffness Ratio.** *The branch value $\vert V_{us}\vert$ depends on the independently registered stiffness ratio $\kappa_d/\kappa_u$. The following table scans $c_d/c_u$ over $[1.00,1.02]$ and uses $\kappa_d/\kappa_u=(c_d/c_u)^2$:*

| $c_d/c_u$ | $\kappa_d/\kappa_u$ | $\theta_{\text{vac}}$ | $\theta_{\text{frustration}}$ | $\lvert V_{us}\rvert$ |
|:---------:|:-------------------:|:---------------------:|:-----------------------------:|:----------:|
| 1.00 | 1.00 | 105.00° | 15.00° | 0.2241 |
| 1.01 | 1.02 | 105.15° | 15.15° | 0.2261 |
| 1.02 | 1.04 | 105.29° | 15.29° | 0.2280 |

*The isotropic scan point $c_d/c_u=1.00$ gives $\vert V_{us}\vert=0.2241$, which is $0.40\%$ below the quoted PDG fit value. The registered $\kappa_d/\kappa_u=1.02$ branch gives $0.2261$, which is $0.48\%$ above the quoted value, or $+1.6\sigma$ using the quoted $0.00068$ uncertainty. The PDG value lies within the displayed sensitivity band; the scan is not an independent determination of the stiffness input.*

### T.22.5.6 Derivation of $\vert V_{ud}\vert$

From CKM unitarity (first row):

$$|V_{ud}|^2 + |V_{us}|^2 + |V_{ub}|^2 = 1$$

**Theorem T.52.2** ($\vert V_{ud}\vert$ from Unitarity).

*Using the derived $\vert V_{us}\vert = 0.2261$ and $\vert V_{ub}\vert = 0.00392$:*

$$|V_{ud}| = \sqrt{1 - |V_{us}|^2 - |V_{ub}|^2} = \sqrt{1 - 0.2261^2 - 0.00392^2}$$
$$= \sqrt{1 - 0.05112 - 0.00002} = \sqrt{0.94886} = 0.9741$$

**Experimental comparison** (Hardy & Towner 2020; see also Seng et al. 2018; Particle Data Group 2024):
$$|V_{ud}|_{\mathrm{direct,PDG24}}=0.97367\pm0.00032$$

|Quantity|Theory|Experiment|Deviation|
|:-------|:----:|:--------:|:-------:|
| $\lvert V_{ud}\rvert$ | $0.974096$ | $0.97367\pm0.00032$ (direct) | $+1.3\sigma$ |

∎

-----

*This construction is on the accepted common-range isometric carrier branch (T.79.9.4); otherwise the complement defect of Theorem T.79.9 is response-active.*

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

**Definition T.54a** (Grassmannian Gauss-Bonnet CP-Area Certificate). A Grassmannian Gauss-Bonnet CP-area certificate for the loop $\gamma=(u_3,d_3,d_2,u_2,u_3)$ is a finite record
$$
\mathfrak G_{\mathrm{CP}}
=
(\Sigma_\gamma,g_\Sigma,q_\Sigma,\{\alpha_j\}_{j=1}^4,K_\Sigma)
\tag{T.54a.1}
$$
where:

1. $\Sigma_\gamma$ is an oriented piecewise-geodesic two-surface in $\mathrm{Gr}(2,8)$ with $\partial\Sigma_\gamma=\gamma$;

2. $g_\Sigma$ is the induced Bures/Kähler-Einstein metric on $\Sigma_\gamma$;

3. $q_\Sigma$ is the Kähler calibration density defined by
$$
\omega_{\mathrm{KE}}|_{\Sigma_\gamma}=q_\Sigma\,dA_\Sigma;
\tag{T.54a.2}
$$

4. $\alpha_j$ are the four interior angles of the geodesic corners;

5. $K_\Sigma$ is the Gaussian curvature of the induced two-metric;

6. the Gauss-Bonnet identity
$$
\int_{\Sigma_\gamma}K_\Sigma\,dA_\Sigma
+
\sum_{j=1}^{4}(\pi-\alpha_j)
=
2\pi
\tag{T.54a.3}
$$
holds for the disk topology of $\Sigma_\gamma$;

7. the calibrated Kähler area evaluates to
$$
\int_{\Sigma_\gamma}q_\Sigma\,dA_\Sigma
=
2\arctan\left(\frac{d_{32,d}}{d_{32,u}}\right).
\tag{T.54a.4}
$$

The certificate is accepted only when the vertices, geodesic edges, induced curvature, corner angles, and calibration density are fixed before comparison with CKM data.

**Theorem T.54b** (Gauss-Bonnet Closure of the Base CP Phase). If the minimal flavor loop $\gamma$ carries an accepted Grassmannian Gauss-Bonnet CP-area certificate $\mathfrak G_{\mathrm{CP}}$, then the flat Berry phase of Theorem T.54 is theorem-level on that certified branch:
$$
\delta_{\mathrm{flat}}
=
\int_{\Sigma_\gamma}\omega_{\mathrm{KE}}
=
2\arctan\left(\frac{d_{32,d}}{d_{32,u}}\right)
=
70.53^\circ.
\tag{T.54b.1}
$$
The following numerical CKM phase is available only on the additional nonlinear response ansatz of Theorem T.56:
$$
\delta_{CKM}=\delta_{\mathrm{flat}}\,\mathrm{sinc}(1/\sqrt3).
\tag{T.54b.2}
$$

*Proof.* By Definition T.54a,
$$
\omega_{\mathrm{KE}}|_{\Sigma_\gamma}=q_\Sigma dA_\Sigma
$$
and the calibrated area is fixed by (T.54a.4). Stokes' theorem, already used in Theorem T.74, gives
$$
\delta_{\mathrm{flat}}
=
\oint_\gamma\mathcal A
=
\int_{\Sigma_\gamma}\omega_{\mathrm{KE}}
=
\int_{\Sigma_\gamma}q_\Sigma dA_\Sigma.
$$
Substituting (T.54a.4) gives (T.54b.1). The Gauss-Bonnet identity (T.54a.3) is the certificate's independent check that the area is obtained from the induced curvature and geodesic corner data rather than from the Simon-style solid-angle branch. Equation (T.54b.2) is the independent nonlinear phase-response ansatz of Theorem T.56; Theorem T.55 changes visibility but leaves the base phase unchanged. ∎

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

**Step 3 (Internal index on the declared tensor-factor branch).** Theorem 23 gives the Hilbert-carrier bound $d_0\ge8$, and Theorem Z.2 gives the minimal saturating value $d_0=8$ on the minimal PCE branch. The additional generation--internal tensor-factor hypothesis of Lemma T.54.1 assigns this eight-dimensional factor to each generation, giving
$$\dim(\mathcal{I}) = d_0 = 8.$$

**Step 4 (Tensor product).** The total interface dimension factors as:
$$24 = 3 \times 8 = N_g \times d_0$$

This matches the left-chiral tensor decomposition of Theorem T.30: ℝ⁶ ≅ ℝ³ ⊗ ℝ², extended to the full interface space. ∎

**Theorem T.54.2** (Generation Subspace Variance on the Generation–Internal Tensor-Factor Branch). *On the generation–internal tensor-factor branch (Lemma T.54.1) and the unit-total-generation-variance branch — under which (a) the canonical tensor factorization of the interface tangent space holds with a specified physical generation/internal assignment, and (b) the projected generation marginal carries unit total variance and is isotropic — the variance per direction in the generation subspace $\mathcal{G}_{N_g}$ is:*

$$\sigma^2_{\mathcal{G}} = \frac{1}{N_g} = \frac{1}{3}.$$

*A general parameterization $\sigma^2_{\mathcal{G}}=\chi_G/N_g$ with branch coefficient $\chi_G$ would rescale the visibility factor $f_{\mathrm{sinc}}=\operatorname{sinc}(\sqrt{\chi_G/N_g})$ in Theorem T.55. A corresponding change of $\delta_{\mathrm{CKM}}$ or of the PMNS predictions requires an independently stated nonlinear phase-response prescription, such as the conditional ansatz of Theorem T.56.*

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

**Theorem T.55 (Uniform Phase-Noise Visibility Factor).** If $\xi$ is uniform on $[-u,u]$, then
$$
\left\langle e^{i(\delta_0+\xi)}\right\rangle
=e^{i\delta_0}\frac{\sin u}{u}.
$$
For $0<u<\pi$, the sinc factor is positive, so it reduces visibility but leaves the phase $\delta_0$ unchanged. At $u=1/\sqrt3$, the visibility factor is $0.9454$. ∎

### T.22.6.6 Conditional CKM CP Phase

**Theorem T.56 (Open Phase-Response Gate).** The symmetric phase-noise model of Theorem T.55 preserves the base phase $\delta_0=70.53^\circ$; it does not derive $70.53^\circ\operatorname{sinc}(1/\sqrt3)=66.7^\circ$. The value $66.7^\circ$ is available only on an additional nonlinear response ansatz
$$
\delta_{\mathrm{CKM}}:=\delta_0\operatorname{sinc}(1/\sqrt3),
$$
which must be registered independently. Subsequent numerical rows using $66.7^\circ$ are conditional on that ansatz. ∎

## T.22.7 The Jarlskog Invariant

The Jarlskog invariant J quantifies CP violation independent of phase conventions (Jarlskog 1985):

$$J = c_{12}s_{12}c_{23}s_{23}c_{13}^2 s_{13}\sin\delta$$

where s_ij = sin θ_ij and c_ij = cos θ_ij in the standard parametrization.

**Theorem T.57** (Conditional Jarlskog Invariant from Branch Parameters).

*Assume the CKM-magnitude branches supplying $s_{12}$, $s_{23}$, and $s_{13}$ and the independently registered nonlinear phase-response ansatz of Theorem T.56. Then:*

- *$s_{12} = \vert V_{us}\vert = 0.2261$ → $c_{12} = \sqrt{1 - 0.2261^2} = 0.9741$*
- *$s_{23} = \vert V_{cb}\vert = 0.0407$ → $c_{23} = \sqrt{1 - 0.0407^2} = 0.9992$*
- *$s_{13} = \vert V_{ub}\vert = 0.00392$ → $c_{13} = \sqrt{1 - 0.00392^2} = 0.99999$*
- *$\delta = 66.7°$ → $\sin\delta = 0.9187$*

*Calculation:*
$$J = (0.9741)(0.2261)(0.9992)(0.0407)(0.99999)^2(0.00392)(0.9187)$$
$$= 3.22 \times 10^{-5}$$

**Experimental comparison** (Particle Data Group 2024):
$$J_{\mathrm{PDG24}}=(3.12^{+0.13}_{-0.12})\times10^{-5}$$

|Quantity|Theory |Experiment |Deviation|
|:-------|:---------:|:------------------:|:-------:|
|$J$ |$3.22\times10^{-5}$|$(3.12^{+0.13}_{-0.12})\times10^{-5}$|$+0.8\sigma$ |

∎

-----

## T.22.8 Complete CKM Matrix

### T.22.8.1 Derived Matrix Elements

The modulus matrix on the declared CKM model branch is
$$
|V_{\mathrm{CKM}}| \approx
\begin{pmatrix}
0.9741 & 0.2261 & 0.00392 \\
0.2260 & 0.9732 & 0.0407 \\
0.0087 & 0.0399 & 0.9992
\end{pmatrix}.
$$

The entries in the second and third rows are obtained by imposing row and column unitarity on the directly predicted values of $|V_{us}|$, $|V_{cb}|$, and $|V_{ub}|$, with the standard CKM ordering convention.

**Statistical Diagnostic:**

Using the four displayed one-dimensional pulls $(-1.6,+2.1,+1.6,+0.7)$ gives the arithmetic sum
$$
D_{\mathrm{diag}}:=\sum_i z_i^2=10.02.
$$
This is a diagonal, correlation-ignoring diagnostic, not a calibrated $\chi^2$ or a degrees-of-freedom statement. A likelihood claim requires preregistered theory uncertainties, the PDG covariance, the fitted-parameter count, and the nonlinear phase/stiffness branch treatment.

-----

## T.22.9 Complete Parameter Chain

The core counting parameters trace to the foundational derivation, while the quantitative hierarchy sector later in this appendix uses the additional threshold, prefactor, and matching data introduced in those sections:

|Parameter |Value |Origin |Section |
|:-----------------|:----------------|:------------------------------------------------------|:-------|
|K₀ |3 |Self-reference minimum |§2.3 |
|d₀ |8 |Hilbert space dimension 2^K₀ |§3.2 |
|(a, b) |(2, 6) |Spectral split from ε0 = ln 2 |§3.3 |
|M |24 |Interface modes 2ab |§6.4 |
|σ²_B |1/24 |Capacity saturation |T.41.2 |
|α |3/2 |Hierarchy coefficient 1/(16σ²_B) |T.41.3 |
|$N_g$ |$3$ |Conditional least-family selector on the declared SM15 linear-plus-cubic or SM16 linear-plus-primitive-norm family-redundancy candidate class, with a nonzero CKM-type rephasing invariant and the realized additive-monotone family-count objective |R.3.4; R.3.4a; R.3.5.1a; R.8.5b; R.8.5d |
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

**Status:** The CKM matrix is a conditional model output depending on the triad, stiffness-ratio, Berry-area, nonlinear phase-response, interference-phase, normalization, and remainder branch data.

-----

## T.22.10 Physical Interpretation

### T.22.10.1 Why Two Regimes Exist

The distinction between tunneling and frustration regimes reflects the structure of the generation manifold:

- **Generation 3** occupies a localized position (heavy mass, λ₃ = αd² ≫ 1) serving as a reference anchor
- **Generations 1, 2** occupy a delocalized valley (light masses) where vacuum geometry dominates

The valley-sharing criterion 𝒱_ij (Proposition T.45.2) determines which mechanism controls mixing:

- 𝒱_ij > 1: Wavefunction overlap through a barrier (tunneling)
- 𝒱_ij ≤ 1: Geometric alignment in a shared valley (frustration)

### T.22.10.2 Why CKM is Hierarchical

The CKM hierarchy $\vert V_{us}\vert \gg \vert V_{cb}\vert \gg \vert V_{ub}\vert$ arises from distinct mechanisms:

1. **$\vert V_{us}\vert \sim 0.22$**: Geometric frustration angle—non-exponential, O(1) mixing from vacuum misalignment
1. **$\vert V_{cb}\vert \sim 0.04$**: Single exponential suppression e⁻³ from tunneling with d²_ref = 2
1. **$\vert V_{ub}\vert \sim 0.004$**: Double exponential suppression e⁻⁶ from tunneling with d²_ref = 4

### T.22.10.3 Why CP Violation Exists

CP violation requires the up and down sectors to have different orientations in the generation manifold. On the stated triad and minimal Berry-area branches:

- Different $d^2_{32}$ values (2 vs 4) create orientation mismatch.
- The base Berry phase around the flavor loop is nonzero: $\delta_{\mathrm{flat}}=70.53°$ (Theorems T.53–T.54).
- The numerical value $\delta=66.7°$ is conditional on the independent nonlinear phase-response ansatz of Theorem T.56.

On either nonzero-phase branch, the Jarlskog invariant satisfies $J\propto\sin\delta\neq0$ when the remaining CKM factors are nonzero.

### T.22.10.4 Berry Phase Origin of CP Violation

The CP-violating phases of the Standard Model are organized by two distinct conditional mechanisms. CKM and PMNS relative phases use the Berry-holonomy branch on $\mathrm{Gr}(2,8)$ described as Type II CP violation in Remark T.57a.1. The strong sector uses the separate Appendix K implication requiring a constructed equivariant $\sigma$-CP map, an accepted QCD gauge-topology bridge, a $\sigma$-invariant vacuum, an operative first-harmonic QCD selection functional with a globally minimizing realized vacuum, and determinant- or Pfaffian-orientation data. The synthesis below identifies the mechanism in each sector:

|Observable |Berry or branch mechanism |Predicted value|Reference |
|:--------------------|:----------------------------------------------------|:--------------|:--------------|
|CKM base phase $\delta_{\mathrm{flat}}$ |Holonomy around $u_3 \to d_3 \to d_2 \to u_2 \to u_3$ on the minimal Berry-area branch |$70.53°$ |Theorems T.53–T.54 |
|CKM response phase $\delta$ |Independent nonlinear response ansatz applied to the base phase |$66.7°$ conditionally |Theorem T.56 |
|PMNS $\delta_{CP}$ |Holonomy with D₄-A₂ sector mismatch |$232.5°$ |Theorem T.24.22|
|Strong $\bar\theta$|Constructed equivariant $\sigma$-CP map, accepted QCD gauge-topology bridge, $\sigma$-invariant vacuum, operative first-harmonic QCD selection functional with a globally minimizing realized vacuum, and determinant- or Pfaffian-orientation certificate |$0$ modulo $2\pi$ on the complete conditional Appendix K branch |Theorem K.6.1; Proposition K.6.4; Theorems K.6.2, K.6.5-K.6.6, K.6.10b-K.6.11 |
**Theorem T.57a (CP from Holonomy).** *On the stated flavor-bundle branch, the CKM and PMNS relative phases arise as Berry-Simon holonomy on the generation manifold; the absolute strong-sector phase is governed by the independent Appendix K certificate branch* [Berry 1984; Simon 1983].

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
The $E_8$ sector mismatch $(d^2_{32,d}, d^2_{32,u}) = (2, 4)$ yields base phase $\delta_{flat} = 2\arctan(\sqrt{2}/2) = 70.53°$ (Theorem T.54). The symmetric average of Theorem T.55 changes visibility but not phase. On the separate nonlinear phase-response ansatz of Theorem T.56 one defines:
$$
\delta_{CKM} = 70.53° \times 0.9454 = 66.7°
$$

**Step 3 (PMNS phase).** The leptonic sector involves D₄ (charged leptons) and A₂ (neutrinos) geometries. The additional holonomy from the D₄-A₂ mismatch contributes $75°$ (Theorem T.24.22, Steps 3-4), yielding $\delta_{CP} = 232.5°$.

**Step 4 (Strong CP on the separate conditional Appendix K branch).** A constructed equivariant parameter map satisfying Theorem K.6.1 and an accepted QCD gauge-topology bridge satisfying Proposition K.6.4 identify the invariant strong-CP coordinate. A $\sigma$-invariant vacuum plus the operative global-minimizer record selects the gauge-angle representative on the first-harmonic route of Theorem K.6.6, or the all-harmonic positive-sector route of Theorem K.6.2a selects $\bar\theta=0$ directly when its stronger sector-partition hypotheses hold. Because Steps 1–3 retain Berry-phased full Yukawa matrices, the strong-CP branch must additionally supply the common-convention absolute determinant-line certificate of Theorem K.6.11, such as a positive-oriented nondegenerate reference plus determinant-one full complex flavor transport. Positive magnitude data alone do not fix the quark determinant phase. ∎

**Remark T.57a.1: Type I vs Type II.** The framework distinguishes Type I CP violation in absolute strong-sector parameters from Type II relative Berry holonomy. Type I vanishes only conditionally on the complete Appendix K branch carrying a constructed equivariant $\sigma$-CP map, accepted QCD gauge-topology bridge, $\sigma$-invariant vacuum, operative first-harmonic QCD selection functional with a globally minimizing realized vacuum, and determinant- or Pfaffian-orientation certificate. Type II remains permitted on its separately certified flavor-holonomy branch.

### T.22.10.5 Conditional CKM--PMNS Comparison



The all-harmonic route subsumes this datum only if its constructed sector partition is explicitly a function of the full invariant $\bar\theta$, including the mass determinant line; otherwise the determinant-line gate remains independent.
CKM and PMNS outputs may be compared only after their distinct triads, transport kernels, phases, and scale maps are registered. A shared geometric vocabulary does not make one a prediction of the other.

## T.22.11 Calibration and Validation Status

Agreement on observables used to choose the triads or continuous response data is calibration, not independent statistical evidence. A significance calculation requires a fixed likelihood, covariance, alternative family, and held-out data. Before those entries close, the separate evidential records govern statistical significance, while the CKM-sector evidence supports internal overdetermination.



The same framework predicts large PMNS mixing angles because:

- Charged leptons have triad $(d^2_{32}, d^2_{31}, d^2_{21}) = (2, 6, 4)$ from D₄ cubic geometry
- Neutrinos have triad $(d^2_{32}, d^2_{31}, d^2_{21}) = (2, 6, 6)$ from A₂ hexagonal geometry on the Majorana A₂ generation-geometry branch (Theorem T.24.5)
- The D₄–A₂ mismatch between charged lepton and neutrino sectors generates large PMNS mixing

The complete conditional PMNS model calculation appears in Section T.24. Its displayed one-dimensional residuals do not define $\chi^2/\mathrm{dof}$ because no predeclared row set, joint likelihood, covariance matrix, theory-error model, fitted-parameter count, or profiling rule is supplied.

-----

## T.22.12 Statistical Significance

**Proposition T.58 (Anti-Numerology Argument).** The PU framework's CKM-sector outputs are overdetermined by multiple constraints within the same discrete geometric construction, providing an internal consistency check against post-hoc numerological fitting.

*Proof.* Consider the following:

1. The framework produces multiple CKM-sector outputs (e.g., a Cabibbo-angle scale, quark-mass-ratio constraints, and a CP-phase prediction) from distinct constraints tied to the same underlying discrete geometry.
1. These outputs are generated without introducing independent continuous fit parameters tuned separately for each observable.
1. Because the outputs share a common construction, the appropriate interpretation is internal overdetermination: a failure of any one output constitutes a direct falsification of the shared mechanism. Assigning a frequentist “chance coincidence” probability is not meaningful without specifying an explicit alternative-model ensemble, priors, and a multiple-comparisons procedure.

Therefore, the framework's anti-numerology content is the rigidity of a shared constrained construction, not a standalone p-value claim. ∎

## T.23 Unified Exponential Suppression: The Master Mechanism for Hierarchies

### T.23.1 Introduction

This section compares several large hierarchies that share an exponential form. Each sector supplies its own action, prefactor, normalization, and residual record, so the common form organizes the results without making them one mechanism.

#### Technical cross-sector introduction

The cosmological and electroweak branches use a common exponential template only after each sector separately identifies a counting index with an action and that action with a physical observable. The reusable branch template is

$$
\frac{X}{M_{Pl}^n}
=
A_Xe^{-\kappa_X}.
$$

For each sector this formula requires a specified state space, saddle or action, counting-to-action map, observable normalization, determinant or measure prefactor, threshold route, and residual interval. Morse–Bott dimension counting controls Gaussian powers; it does not by itself identify a classical action exponent. The common functional form is therefore a conditional synthesis.

The reusable synthesis is the registered sector scale law
$$
\boxed{\frac{X}{M_{Pl}^n}=A_Xe^{-\kappa_X}},
$$
where the named sector certificate fixes the observable $X$, mass dimension $n$, action $\kappa_X$, scale bridge, and prefactor $A_X$ before comparison.

There is no universal base-plus-coset-minus-zero-modes formula for all rows. Appendix U uses the Grassmannian Hessian action
$$
\kappa_\Lambda=\frac{288-m_\Lambda}{2},
$$
the electroweak branch uses the Steiner incidence response action
$$
\kappa_{EW}
=\frac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}
=\frac{77}{2},
$$
and the flavor and baryogenesis branches use their own registered distance, path, midpoint-readout, and transport data. Cross-sector identities are obtained by algebraically composing these separately proved scale laws. They do not identify their operators or move a Gaussian zero mode from a determinant ledger into the electroweak action.

**Scope.** The common exponential form is a composition rule. A physical numerical prediction in any row additionally requires that row's determinant, matching, threshold, transport, normalization, and certified-remainder record.

-----

### T.23.2 The Foundational Cascade

The backbone values are assembled from distinct structural gates:

|Step|Quantity |Value |Origin |Reference |
|:---|:----------------------------------|:-----------------------|:------------------------------------------------------------------|:---------------|
|1 |$K_0$ |3 bits |Minimum visited-context capacity under the Theorem 15 hypotheses |Theorem 15 |
|2 |$d_0$ |$8$ on the minimal Appendix Z branch |Hilbert distinguishability lower bound plus active-dimension saturation |Theorem 23; Theorem Z.2 |
|3 |$\varepsilon_0$ |$\ln 2$ on the registered binary-record branch |Structural binary log-cardinality, independent of the Hilbert-carrier chain |Definition 28; Theorem J.1 |
|4 |$a$ |$2$ |Active kernel dimension on the attractor-saturating branch |Theorem Z.1 |
|5 |$b$ |$d_0 - a = 6$ |Inactive subspace dimension |Definition |
|5a |$\dim_{\mathbb{C}}(\text{Gr}(2,8))$|$ab = 12$ |Attractor orbit complex dimension; equals Golay $k$ |Theorem Z.6.3a |
|5b |$\dim_{\mathbb{R}}(\text{Gr}(2,8))$|$2ab = 24$ |Attractor orbit real dimension; equals Golay $n$ and mode count $M$|Theorem Z.6.3a |
|6 |$M$ |$2ab = 24$ |QFI interface modes |Theorem Z.5 |
|7 |$k$ |$M/2 = 12$ |Golay code dimension on the predictive-recovery MacWilliams branch |Definition Z.13b.0; Theorem Z.13b.0a; Theorem Z.13 |
|8 |$D$ |4 |Euclidean response-carrier dimension; $3+1$ spacetime interpretation separately certificate-gated |Definition Z.9a; Theorems Z.10-Z.11; Corollary P.8.3 |
|9 |$\sigma_B^2$ |$1/M = 1/24$ |Bures variance from capacity saturation |Lemma T.41.2 |
|10 |$\alpha$ |$1/(16\sigma_B^2) = 3/2$|Hierarchy coefficient |Corollary T.41.3|


**Proposition T.59** (Forked Minimal-Branch Backbone Ledger). *Assume the minimal Appendix Z Hilbert and active-projector branches, the registered binary verification quotient, the predictive-recovery MacWilliams gate of Definition Z.13b.0, and the faithful least-feasible tangent-shell contract of Definition Z.9a. Then the forked dependency graph is
$$
\begin{gathered}
K_0=3\Longrightarrow N_{\mathrm{vis}}^{\min}=8\Longrightarrow d_0\ge8\Longrightarrow d_0=8,\\
\text{registered binary verification quotient}\Longrightarrow\varepsilon_0=\ln2,\\
(d_0=8,\varepsilon_0,\text{ active-record/no-surplus gates})\Longrightarrow a=2\Longrightarrow b=6\Longrightarrow M=24,\\
(M=24,\text{ MacWilliams gate})\Longrightarrow k=12,\\
(M=24,\text{ Bures tangent-cell contract})\Longrightarrow D=4.
\end{gathered}
$$
Thus
$$
(K_0,d_0,\varepsilon_0,a,b,M,k,D)=(3,8,\ln2,2,6,24,12,4)
$$
on the conjunction of these branches. Quantitative hierarchy calculations require their additional threshold, determinant, response, and matching records.*

*Proof.* Theorem 15 gives $K_0=3$ and $N_{\mathrm{vis}}^{\min}=8$. Theorem 23 gives $d_0\ge8$, and Theorem Z.2 gives $d_0=8$ on the minimal carrier branch. Independently, Definition 28 and Theorem J.1 give the structural value $\varepsilon_0=\ln2$. Theorem Z.1 consumes the active-record, entropy-capacity, and no-surplus hypotheses and gives $a=2$; therefore the complement has
$$
b=d_0-a=6.
$$
The Peirce-Grassmann tangent count of Theorem Z.5 (equivalently Theorem Z.2.5b) gives
$$
M=2a(d_0-a)=24.
$$
On the predictive-recovery MacWilliams branch (Definition Z.13b.0; Theorem Z.13b.0a), Theorem Z.13 selects
$$
k=M/2=12.
$$
The faithful Bures tangent-shell contract of Definition Z.9a and Theorems Z.10--Z.11 gives
$$
24=M\le K(D),\qquad K(3)=12,
$$
while the regular $24$-cell proves feasibility in $D=4$. The registered strict cost for response-null surplus dimensions therefore selects the least feasible value $D=4$. This closes the backbone counting chain on the stated branch without assuming global kissing saturation. The proof composes the cited structural gates and does not collapse them into one parent invariant. ∎

**Corollary T.59a (Backbone Tuple).** The closed minimal-branch backbone tuple is
$$
(K_0,d_0,\varepsilon_0,a,b,M,k,D)=(3,8,\ln2,2,6,24,12,4).
$$

*Proof.* Proposition T.59 establishes, in order,
$$
K_0=3,
\quad d_0=8,
\quad\varepsilon_0=\ln2,
\quad(a,b)=(2,6),
\quad M=24,
\quad k=12,
\quad D=4.
$$
Collecting these entries in the order declared by the corollary gives
$$
(K_0,d_0,\varepsilon_0,a,b,M,k,D)
=(3,8,\ln2,2,6,24,12,4).
$$
∎

-----

### T.23.3 The Complexity-Action Correspondence

**Proposition T.60** (Complexity--Action Relation on the Residual-Budget Bridge). *Assume the residual-budget allocation $C_{\max}=\ln d_0-\varepsilon_0$ and the instanton action--complexity bridge $S_{\mathrm{inst}}=(C_{\max}/\varepsilon_0)\kappa$ of Proposition U.14. On the minimal branch $d_0=8$ and $\varepsilon_0=\ln2$, one has*

$$S_{\text{inst}} = 2\kappa.$$

*Proof.* The residual-budget identity gives

$$\frac{C_{\max}}{\varepsilon_0} = \frac{\ln(d_0) - \varepsilon_0}{\varepsilon_0} = \frac{3\ln 2 - \ln 2}{\ln 2} = 2.$$

Substitution into the independently assumed action--complexity bridge of Proposition U.14 gives $S_{\mathrm{inst}}=2\kappa$. ∎

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

where Theorem U.3 proves the Grassmannian dimension $k^2=144$, Convention U.14a identifies that complex normal-direction count with the base exponent, and the deficit $(D+1)/2=5/2$ arises from the Appendix U reference-counting convention summarized in Theorem U.15 and recorded in Theorem U.16. Theorem U.8c shows that the pure-coordinate dilatation tangent needed to realize that five-mode branch is obstructed in the Definition U.4 continuum action.

**Result.**

$$\Lambda L_P^2 = 8\pi A_{\text{eff}} \cdot e^{-283} = (2.88 \pm 0.03)\times 10^{-122}$$

on the Appendix U five-mode reference branch. Using the Appendix U working value $A_{\text{eff}} = 0.923 \pm 0.011$ (Corollary U.15b), this gives the branch-dependent five-mode reference evaluation. On the Definition U.6 four-mode branch, Theorem U.13b fixes only the exponent $\kappa=142$ under its stated false-vacuum spectral hypotheses; the forward row is $\Lambda_4L_P^2=8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284}$ and remains $\varnothing_{\mathrm{cert}}$ until the canonical record $\mathfrak F_U^{(4)}$ of Definition U.73e is accepted. Reusing the five-mode working prefactor gives $(1.06\pm0.01)\times10^{-122}$ only as a same-prefactor diagnostic, not as a four-mode Fredholm evaluation.

-----

### T.23.5 The Electroweak Scale: $\kappa_{EW} = 38.5$

**Configuration Space.** Electroweak symmetry breaking involves alignment between left-chiral modes and reservoir coordinates on the coset:

$$\mathcal{M}_{EW} = \frac{SU(2)_L \times U(1)_Y}{U(1)_{em}} \cong S^3$$

**Complexity Calculation.**

|Component |Formula |Value |
|:----------------|:------------------|:-------|
|Registered endpoint |$x(1)=e_{p_A}$ |one active pair |
|Pair-incidence norm |$e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}$ |77 |
|Quadratic-action normalization |$\tfrac12$ |$1/2$ |
|**$\kappa_{EW}$** |$\tfrac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}$ |**38.5** |

**Summary (Electroweak Response Action).** Theorem T.5 proves
$$
\kappa_{EW}
=\frac12\lambda_2(S(5,8,24))
=\frac{77}{2}
=38.5.
$$
This is the exact least action of the registered fixed-time unit update. The older alignment/coset/zero-mode expression may be retained only as a separate Gaussian-prefactor comparator and is not used to derive the action exponent.

**Result.**

$$v = A_{EW} \cdot e^{-\kappa_{EW}} \cdot M_{Pl} = A_{EW} \cdot e^{-38.5} \cdot M_{Pl}$$

With $e^{-38.5} \approx 1.90 \times 10^{-17}$ and $M_{Pl} = 1.22 \times 10^{19}$ GeV:

$$v \approx 252 \text{ GeV}$$

with the prefactor $A_{EW} = 1.084 \pm 0.005$ obtained in Theorem T.29 within the three-factor determinant model via SU(2) block curvature, the rank-one Schur factor, and the homogeneous-space Jacobian factor. Once that model is fixed, no further continuous tuning enters this subsection. By Theorem T.29.2 the value is model-conditional rather than a theorem-level prefactor derivation. The resulting value is $2.3\%$ above $v_{obs} = 246.22$ GeV.

-----

### T.23.6 The Fermi Constant: A Derived Quantity

**Proposition T.61** (Tree-Level Fermi Constant). *On the tree-level Standard-Model branch, at momentum transfer $|q^2|\ll M_W^2$ and before radiative matching corrections, the Fermi constant follows from the Higgs vacuum expectation value as*

$$G_F = \frac{1}{\sqrt{2} v^2}.$$

*Proof.* Tree-level charged-current matching [Weinberg 1996] applies because the assumed external momentum is small relative to $M_W$, so the $W$ propagator reduces to its leading local term. Matching that term to the Fermi interaction gives
$$
\frac{G_F}{\sqrt2}=\frac{g^2}{8M_W^2},
$$
or
$$
G_F=\frac{g^2}{4\sqrt2M_W^2}.
$$
On the same tree-level Higgs branch, $M_W=gv/2$, hence
$$
G_F
=\frac{g^2}{4\sqrt2\,(g^2v^2/4)}
=\frac1{\sqrt2v^2}.
$$
∎

**Effective Complexity.** In terms of the suppression mechanism:

$$G_F=\frac{e^{2\kappa_{EW}}}{\sqrt2\,A_{EW}^2M_{Pl}^2}=\frac{e^{77}}{\sqrt2\,A_{EW}^2M_{Pl}^2}$$

The effective complexity $\kappa_{G_F} = 2\kappa_{EW} = 77$ reflects the squared dependence on the VEV.

-----

### T.23.7 Conditional Yukawa-Hierarchy Model

A Yukawa hierarchy may be modeled by suppression along a registered geometric triad. Selecting the triad because it agrees with observed ratios is retrospective calibration. A predictive theorem requires a data-independent selector, the coefficient and effective-dimension functions, a scale map, and a certified remainder.



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

**Nonformal $E_8$ branch summary.** The external sphere-packing theorem establishes the optimality of the $E_8$ lattice within eight-dimensional Euclidean packing, while Appendix R records the additional even-unimodular lattice hypotheses under which $E_8$ is the unique rank-eight lattice. Octonionic and 240-root observations provide algebraic context but do not prove information-theoretic selection. The fermion triads used in this appendix are registered model assignments; Proposition T.58 establishes only internal overdetermination of the shared CKM construction and does not prove $E_8$ optimality or unique triad selection.

-----

### T.23.8 The Unified Hierarchy Table

**Theorem T.62** (Compiled hierarchy table). *The previously derived hierarchy relations organize into the following two classes.*

**Registered sector-specific exponent ledger**

|Quantity |Registered carrier/action |Exponent rule |Independent completion |$\kappa$ or exponent |Scaling |
|:--|:--|:--|:--|:--:|:--|
|$\Lambda$ |$\operatorname{Gr}_{\mathbb C}(12,24)$ vacuum Hessian |$(288-m_\Lambda)/2$ |vacuum branch and determinant certificate |$141.5$ for $m_\Lambda=5$; $142$ for $m_\Lambda=4$ |$\Lambda L_P^2=8\pi A_{\mathrm{eff}}e^{-2\kappa_\Lambda}$ |
|$v$ |Steiner active-pair response |$\frac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}$ |Principle T.13a and $A_{EW}$ |$77/2=38.5$ |$v/M_{Pl}=A_{EW}e^{-38.5}$ |
|$\eta_B$ |CP half-path plus binary/family share |$77/4+\ln2/3$ |midpoint readout, parallel-family saddles, transport certificate |$19.481049\ldots$ |$\eta_B=\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-(77/4+\ln2/3)}$ |
|$M_R$ |registered $E_8$ distance branch |$\alpha_{UV}d_{31}^2$ |scale-map and neutrino branch |$9$ for $(\alpha_{UV},d_{31}^2)=(3/2,6)$ |$M_R/M_{Pl}=e^{-9}$ |
|$G_F$ |derived from the electroweak scale |$2\kappa_{EW}=77$ in the squared scale |electroweak prefactor and matching convention |$77$ |$G_F=A_{EW}^{-2}e^{77}/(\sqrt2M_{Pl}^2)$ |

**Remark T.62.1: QCD Confinement Scale.** The matching scale $\mu_G = M_{Pl} \cdot e^{-\kappa_{\text{QCD}}}$ with $\kappa_{\text{QCD}} = \text{rank}(E_8) + 1 = 9$ yields:

$$\mu_G \approx 1.22 \times 10^{19} \text{ GeV} \times e^{-9} \approx 1.5 \times 10^{15} \text{ GeV}$$

The relation $\mu_G=M_{Pl}e^{-9}$ is a registered matching-scale ansatz. The arithmetic identity $9=\operatorname{rank}(E_8)+1$ does not prove that nine is a minimal Weyl-reflection length or that it defines a physical scale. Standard QCD running from a chosen $\mu_G$ additionally requires the coupling, renormalization scheme, particle content, and thresholds as external matching data.

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
so $\Lambda L_P^2 \propto e^{-2\kappa_{\Lambda,\mathrm{ref}}}=e^{-283}$ at fixed prefactor on the Appendix U five-mode reference branch. Theorem U.8c shows that this row is branch-dependent rather than a theorem-level consequence of the current Definition U.4 continuum action. The electroweak row is the Steiner response-action result of Definition T.13 and Theorem T.5:
$$
\kappa_{EW}
=\frac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}
=\frac{77}{2}
=38.5,
$$
hence Principle T.6a gives $v/M_{Pl}=A_{EW}e^{-38.5}$. The baryogenesis row is Theorem Y.8:
$$
\kappa_B=\frac{\kappa_{EW}}2+\frac{\varepsilon_0}{N_g}=19.25+0.23=19.48.
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

**Remark T.62b (Scope of the Vacuum–Electroweak Numerical Identity).** On the Appendix U five-mode reference branch,
$$
2\kappa_{\Lambda,\mathrm{ref}}+2\kappa_{EW}
=283+77
=360
=\binom{D+2}{2}M
$$
at $(D,M)=(4,24)$. The first term is the vacuum reference Hessian ledger and the second is the independent Steiner response action. The equality to $15M$ is exact arithmetic on the intersection of those registered branches; it neither derives $D=4$ nor supplies a common vacuum/electroweak mechanism. Changing the independently determined $D$, $M$, vacuum branch, or electroweak response operator changes the identity. The Moonshine dimensions $196883$ and $196884$ enter neither ledger.

**Corollary T.62c (Vacuum–Electroweak Complexity Product Lock).** On the Appendix U five-mode reference branch, together with the electroweak hierarchy branch of Theorem T.5 and the determinant normalization of Theorem T.29, the measured dimensionless vacuum/electroweak product satisfies
$$
\boxed{
(\Lambda L_P^2)\left(\frac{v}{M_{Pl}}\right)^2
=
8\pi A_{\mathrm{eff}}A_{EW}^2e^{-360}.
}
\tag{T.62c}
$$
Equivalently,
$$
-\ln\left[
\frac{
(\Lambda L_P^2)(v/M_{Pl})^2
}{
8\pi A_{\mathrm{eff}}A_{EW}^2
}
\right]
=
360
=
15M.
$$
The product relation is a branch-level cross-domain lock: the cosmological constant and the electroweak scale use different observables and different prefactors, but their leading exponential ledger closes on the same $D=4$, $M=24$ count.

*Proof.* On the Appendix U five-mode reference branch,
$$
\Lambda L_P^2
=
8\pi A_{\mathrm{eff}}e^{-2\kappa_{\Lambda,\mathrm{ref}}}.
$$
On the electroweak determinant branch,
$$
\frac{v}{M_{Pl}}=A_{EW}e^{-\kappa_{EW}}.
$$
Therefore
$$
(\Lambda L_P^2)\left(\frac{v}{M_{Pl}}\right)^2
=
8\pi A_{\mathrm{eff}}A_{EW}^2
e^{-2\kappa_{\Lambda,\mathrm{ref}}-2\kappa_{EW}}.
$$
Corollary T.62a gives
$$
2\kappa_{\Lambda,\mathrm{ref}}+2\kappa_{EW}=360.
$$
Substitution proves Equation T.62c. Since Theorem U.8c identifies the five-mode vacuum count as a reference branch rather than an unconditional continuum closure, the product lock inherits that status. ∎

-----

### T.23.9 Key Relationships Between Complexity Parameters

The following relationships emerge from the unified framework and provide internal consistency checks.

**Branch-arithmetic cross-check.** On the branches carrying $M=24$, $\kappa_{EW}=77/2$, and $\kappa_Q=11$,
$$
284+77=361=15M+1,
\qquad
\frac{\kappa_Q}{\kappa_{EW}}=\frac{22}{77}=\frac27,
\qquad
e^{-11}=1.670170079\ldots\times10^{-5}.
$$
If, in addition,
$$
\frac{v}{M_{Pl}}=A_{EW}e^{-77/2},
\qquad
Q=\sqrt{\frac{A_Q}{2}}e^{-11},
$$
then elimination of the common exponential gives the conditional identity
$$
Q
=
\sqrt{\frac{A_Q}{2}}A_{EW}^{-2/7}
\left(\frac{v}{M_{Pl}}\right)^{2/7}.
$$
The identity relates the two named branch parameterizations; it does not determine both prefactors. Likewise, changing a vacuum exponent from $283$ to $284$ changes the exponential weight by a factor $e^{-1}$ only when its prefactor is held fixed. Prefactors inferred by fitting the same observed target cannot then be used as independent evidence for that factor. No universal normal form for every exponent is asserted.

**Proposition T.63a** (Reference Complexity Ratio). *On the Appendix U five-mode reference branch, the ratio of cosmological to electroweak complexity is*

$$\frac{\kappa_{\Lambda,\mathrm{ref}}}{\kappa_{EW}} = \frac{141.5}{38.5} \approx 3.68.$$

*The corresponding corrected four-mode branch value, under the explicit false-vacuum spectral hypotheses of Theorem U.13b, is*

$$\frac{\kappa_{\Lambda,\mathrm{trans}}}{\kappa_{EW}} = \frac{142}{38.5} \approx 3.69.$$

**Corollary T.63.1** (Dimensionless Vacuum–Electroweak Quotient). On the five-mode reference branch and the electroweak scale branch,
$$
\kappa_{\Lambda,\mathrm{ref}}-\kappa_{EW}=103
$$
and the dimensionless quotient is
$$
\frac{\Lambda L_P^2}{(v/M_{Pl})^2}
=\frac{8\pi A_{\mathrm{eff}}}{A_{EW}^2}
e^{-2(\kappa_{\Lambda,\mathrm{ref}}-\kappa_{EW})}
=\frac{8\pi A_{\mathrm{eff}}}{A_{EW}^2}e^{-206}.
$$
Here $e^{-206}=3.43\times10^{-90}$. On the four-mode theorem branch,
$$
\frac{\Lambda L_P^2}{(v/M_{Pl})^2}
=\frac{8\pi A_{\mathrm{eff}}^{(4)}}{A_{EW}^2}e^{-207},
\qquad
e^{-207}=1.26\times10^{-90}.
$$
The prefactor ratio is part of the equality and cannot be omitted.

**Corollary T.63.2** (Electroweak–Baryon Square-Root Lock). On the Appendix Y branch carrying Lemma Y.8.1's midpoint half-history, Lemma Y.8.2's noncancelling parallel-family saddles, the structural binary value of Definition J.1 and Theorem J.1, and the accepted transport certificate,
$$
\kappa_B=\frac{\kappa_{EW}}2+\frac{\ln2}{3}.
$$
Combining this identity with
$$
\frac{v}{M_{Pl}}=A_{EW}e^{-\kappa_{EW}}
$$
gives
$$
\boxed{
e^{-\kappa_B}
=
2^{-1/3}
\sqrt{\frac{v}{A_{EW}M_{Pl}}}.
}
\tag{T.63.2}
$$
Consequently,
$$
\boxed{
\eta_B
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}2^{-1/3}
\sqrt{\frac{v}{A_{EW}M_{Pl}}}.
}
$$
The equality is exact on that joint branch; its transport and determinant factors remain the independently evaluated prefactor.

**Proposition T.64a** (Registered Dimensionless Ledger Ratios). The vacuum branches satisfy
$$
\frac{\kappa_{\Lambda,\mathrm{ref}}}{k^2}
=\frac{141.5}{144}
=1-\frac{5}{288},
\qquad
\frac{\kappa_{\Lambda,\mathrm{trans}}}{k^2}
=\frac{142}{144}
=1-\frac1{72}.
$$
The independent electroweak response action satisfies the numerical comparison
$$
\frac{\kappa_{EW}}{b^2}
=\frac{77}{72}.
$$
The first two equalities encode the Appendix U zero-mode deficits. The last compares the Steiner pair-incidence action with $b^2=36$ and is not a zero-mode formula.

-----

### T.23.10 Sector-Resolved Hierarchy Composition

**Theorem T.63** (Sector-Resolved Hierarchy Composition). On the intersection of the registered Appendix U and Appendix T branches,
$$
\Lambda L_P^2
=8\pi A_{\mathrm{eff}}e^{-2\kappa_\Lambda},
\qquad
\frac v{M_{Pl}}
=A_{EW}e^{-\kappa_{EW}},
$$
where $\kappa_\Lambda=(288-m_\Lambda)/2$ is the vacuum Hessian-counting exponent and
$$
\kappa_{EW}
=\frac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}
=\frac{77}{2}
$$
is the Steiner response action. Hence the two sector laws compose into the exact cross-ledger product
$$
(\Lambda L_P^2)\left(\frac v{M_{Pl}}\right)^2
=8\pi A_{\mathrm{eff}}A_{EW}^2
e^{-[(288-m_\Lambda)+77]}.
$$

*Proof.* Substitute the two registered scale laws and collect exponents. Convention U.14a gives $2\kappa_\Lambda=288-m_\Lambda$, while Theorem T.5 gives $2\kappa_{EW}=77$. No common fluctuation operator is required or asserted. ∎

**Corollary T.65.1** (Discrete Action Data on the Registered Branches). Once a vacuum branch fixes $m_\Lambda$ and an electroweak branch fixes $(B,p_A)$, the two leading exponents are discrete:
$$
2\kappa_\Lambda=288-m_\Lambda,
\qquad
2\kappa_{EW}=e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}=77.
$$
The vacuum exponent changes only when its certified Hessian kernel changes, and the electroweak action changes only when the registered incidence operator, endpoint, or action normalization changes. Determinants, matching, threshold corrections, and renormalized stability remain in their named certificates and prefactors.

-----

### T.23.11 Comparison with Standard Approaches

|Approach |Mechanism |Explanation for $\Lambda$|Explanation for $v/M_{Pl}$ |
|:------------------------|:----------------------------------|:------------------------|:----------------------------|
|**SUSY** |Boson-fermion cancellation |Partial |Partial |
|**Extra dimensions** |Geometric dilution |Model-dependent |Model-dependent |
|**Anthropic/landscape** |Environmental selection |Selection statement |Selection statement |
|**Technical naturalness**|Symmetry protection |Model-dependent |Partial |
|**PU Framework** |Sector-resolved registered actions |Appendix U five-mode reference exponent $141.5$ or certified four-mode exponent $142$ |Steiner response action $\kappa_{EW}=77/2$ plus the scale bridge and forward prefactor |

The PU entry is a constructive two-operator result: Appendix U fixes the vacuum exponent on its accepted Hessian branch, while Definition T.13 and Theorem T.5 fix the electroweak response action. Theorem T.63 proves their product composition. Radiative stability and the numerical scale remain controlled by the renormalized matching and determinant certificates rather than by a false shared zero-mode count.

-----

### T.23.12 Predictions and Extensions

**Prediction T.3** (Registered Discrete-Action Spectrum). For any accepted scale branch
$$
\frac E{M_{Pl}}=A_Ee^{-\kappa_E},
\qquad
\log_{10}\frac E{M_{Pl}}
=\log_{10}A_E-\frac{\kappa_E}{\ln10}.
$$
Its allowed values are computed from that branch's registered action: Appendix U uses the Grassmannian Hessian ledger; the electroweak branch uses $\frac12e_p^{\mathsf T}B^{\mathsf T}Be_p$; and the flavor branches use registered $E_8$ distance actions. A new scale tests PU only after its operator, endpoint or saddle, scale bridge, and prefactor interval are fixed before comparison.

**Prediction T.4** (Steiner Relabeling and Operator-Change Signature). For the $S(5,8,24)$ incidence operator, every unit pair endpoint obeys
$$
e_p^{\mathsf T}B^{\mathsf T}Be_p=77,
$$
so relabeling the active pair leaves $\kappa_{EW}=77/2$ invariant. Replacing the registered endpoint $e_p$ by $u$ or the operator $B$ by $B'$ changes the action by the computable amount
$$
\Delta\kappa_{EW}
=\frac12\left(
u^{\mathsf T}{B'}^{\mathsf T}B'u
-e_p^{\mathsf T}B^{\mathsf T}Be_p
\right),
$$
and, at fixed prefactor, rescales $v$ by $e^{-\Delta\kappa_{EW}}$. Electroweak Gaussian zero modes alter the separate prefactor ledger and do not shift this response action.
**Theorem T.64 (Seesaw Scale).** Assume the scale map
$$
\frac{M_R}{M_{Pl}}
=
e^{-\alpha_{UV}d_{31}^2}.
$$
Corollary T.41.3 gives the UV hierarchy coefficient $\alpha_{UV}=3/2$ from $\sigma_B^2=1/24$, and the Majorana $A_2$ neutrino triad $(d^2_{32},d^2_{31},d^2_{21})=(2,6,6)$ of Section T.24.5 selects $d_{31}^2=6$. Then
$$
M_R
=
M_{Pl}e^{-9}
\approx
1.5067\times10^{15}\,\mathrm{GeV}
$$
for the unreduced Planck convention $M_{Pl}=1.2209\times10^{19}\,\mathrm{GeV}$ used in Appendix T.

*Proof.* Substitution gives $\alpha_{UV}d_{31}^2=(3/2)6=9$, and the numerical value is the stated Planck convention times $e^{-9}$. The right-handed neutrino sector is an $SU(2)$ singlet, so it uses the UV attractor coefficient rather than an IR-corrected one. The result remains conditional on the scale map, that normalization, and the triad label selection. ∎

*Verification.* With $\langle H\rangle=(0,v/\sqrt2)^T$, the type-I seesaw carries the factor $1/2$. Using this $M_R$ and the normalization assumptions of Theorem T.24.14 gives $m_3=25.809938\,\mathrm{meV}$; the result remains conditional on those inputs.
**Theorem T.64a (Matching-Scale Identification).** The matching-scale branch posits $\mu_G=M_{Pl}e^{-9}$, while Theorem T.64 computes $M_R=M_{Pl}e^{-\alpha_{UV}d_{31}^2}=M_{Pl}e^{-9}$ on its own scale map with $(\alpha_{UV},d_{31}^2)=(3/2,6)$. If both use the same unreduced Planck convention, then
$$
\boxed{
\mu_G=M_R=M_{Pl}e^{-9}
}.
$$

*Proof.* The conclusion is substitution into the two scale maps, whose exponents both equal $9$. Only the seesaw exponent is computed from registered data; the matching exponent remains an ansatz, so the equality is not independent evidence for either scale. ∎

-----

### T.23.13 Conditional Mechanism Ledger

Exponential suppression is a reusable model form, not one universal derivation of every hierarchy. Each application must identify its state space, generator or action, coefficient, labels, scale bridge, and error interval. Shared functional form does not remove sector-specific inputs.

---



The sector-resolved exponential ledger demonstrates that:

1. **The discrete backbone fixes common inputs:** The registered chain $K_0\to d_0\to(a,b)\to M$ fixes the carrier and interface data used by the sector models.
1. **Each exponent has its own action:** The vacuum exponent is a certified Hessian-counting action, the electroweak exponent is the Steiner response action, and flavor exponents use their registered distance kernels.
1. **Cross-sector identities are exact compositions:** Theorem T.63 and Corollary T.63.2 follow by eliminating the registered exponentials without identifying their operators.
1. **Prefactors remain calculable obligations:** Determinants, matching, transport, thresholds, and remainders are fixed by the named forward certificates.
1. **Falsification is branch-local and quantitative:** A failed exponent, scale bridge, or prefactor interval rejects the corresponding registered branch without altering unrelated theorem stacks.

The reusable scale form is
$$
\frac{X}{M_{Pl}^n}=A_Xe^{-\kappa_X},
$$
with $(A_X,\kappa_X,n)$ supplied by the named sector certificate.

On the stated Majorana-normalization branch, the recomputed spectrum is $(m_1,m_2,m_3)=(0.142931,4.566325,25.809938)\,\mathrm{meV}$, with $(\Delta m^2_{21},\Delta m^2_{31})=(2.08309\times10^{-5},6.66132\times10^{-4})\,\mathrm{eV}^2$. This conditional branch does not match the cited oscillation splittings.

-----

# Part VII: Neutrino Sector

# Section T.24: Neutrino Mass Hierarchy and PMNS Matrix from $E_8$ Geometry

## Abstract

This part develops a three-neutrino mass and mixing model from a chosen geometric arrangement. The model gives definite values after its labels and response inputs are fixed, but its internally normalized mass splittings miss the cited measurements.

### Technical abstract

This part develops a conditional neutrino and PMNS model on declared $E_8$/Grassmannian triads. The charged-lepton triple is geometrically realizable but not selected by error correction; the neutrino labels and continuous response data likewise require independent certificates. Numerical agreement after calibration does not constitute a zero-external-parameter derivation.



**Status:** The internally normalized seesaw subbranch is arithmetically determined after its matching inputs are fixed, but its absolute mass-squared splittings do not match the cited oscillation values.

|Quantity |PU Value |
|--------------------------|----------------------------------------------|
|Neutrino $E_8$ Triad |(2, 6, 6) |
|Seesaw Scale |$M_R = 1.51 \times 10^{15}$ GeV |
|Solar Mass Splitting |$\Delta m^2_{21}=2.08309\times10^{-5}\,\mathrm{eV}^2$ on the internal subbranch; not closed against data|
|Atmospheric Mass Splitting|$\Delta m^2_{31}=6.66132\times10^{-4}\,\mathrm{eV}^2$ on the internal subbranch; not closed against data|
|Atmospheric Angle |$\theta_{23} = 47.4^\circ$ |
|Solar Angle |$\theta_{12} = 33.7^\circ$ |
|Reactor Angle |$\theta_{13} = 8.7^\circ$ |
|Neutrino CP Phase |$\delta_{CP} = 232.5^\circ$ |
|Jarlskog Invariant |$J_{CP} = -0.0268414$ |

All parameters connect directly to geometry and PCE. Any quoted $\chi^2/\text{dof}$ should be read only as a diagnostic (it depends on the uncertainty model and ignores correlations), not as a standalone goodness-of-fit proof.

-----

## Part I: Framework and Constraints

### T.24.1 Foundational Parameters

The derivation chain from Sections T.1–T.21 establishes the complete set of foundational constants.

**Recall from Theorem 15 (Horizon Constant).** On the realization class satisfying (O1)–(O3) and (FC), the least visited-context log-capacity for the stated SPAP encoding is $K_0=3$; this is not a universal complexity floor for self-referential prediction.

**Recall from Theorem 23 (MPU Dimension).** Theorem 15 gives $N_{\mathrm{vis}}^{\min}=2^{K_0}=8$, and Theorem 23 gives $d_0 \ge N_{\mathrm{vis}}^{\min}$ on the Hilbert-carrier branch; on the minimal PCE branch used throughout the Appendix Z backbone one has $d_0 = 8$ (Theorem Z.2).

**Recall from Theorem Z.1 (Active Dimension).** On the attractor-saturating branch $\varepsilon_0=\ln2$, Theorem Z.1 fixes the active kernel dimension to $a = 2$.

**Definition (Inactive Dimension).** The inactive subspace dimension is $b = d_0 - a = 6$.

**Recall from Theorem Z.5 (Interface Modes).** The quantum Fisher information interface has $M = 2ab = 24$ active modes.

The complete derivation chain:

$$K_0 = 3 \xrightarrow{\text{Thm 15}} N_{\mathrm{vis}}^{\min}=2^{K_0}=8 \xrightarrow{\text{Thm 23/Z.2}} d_0 = 8 \xrightarrow{\text{Thm Z.1}} (a,b) = (2,6) \xrightarrow{\text{Thm Z.5}} M = 2ab = 24$$

**Summary (Bures Variance).** *Assume that the Bures-orthonormal tangent variable $\xi\in\mathbb R^{24}$ is centered, has isotropic covariance $\operatorname{Cov}(\xi)=\sigma_B^2I_{24}$, and is normalized by capacity saturation so that $\langle r_B^2\rangle:=\mathbb E\lVert\xi\rVert^2=1$. Then*
$$
\langle r_B^2\rangle
=\operatorname{Tr}(\operatorname{Cov}\xi)
=24\sigma_B^2
=1,
\qquad
\sigma_B^2=\frac1{24}.
$$

*Proof.* For any square-integrable random vector,
$$
\mathbb E\lVert\xi\rVert^2
=\lVert\mathbb E\xi\rVert^2
+\operatorname{Tr}(\operatorname{Cov}\xi).
$$
Centeredness makes the first term zero, while isotropy gives $\operatorname{Tr}(\operatorname{Cov}\xi)=24\sigma_B^2$. The unit mean-squared-radius hypothesis therefore gives $24\sigma_B^2=1$, hence $\sigma_B^2=1/24$. ∎

**Summary (Hierarchy Coefficient).** *On the numerical convention that defines $\alpha:=1/(16\sigma_B^2)$, the unit-radius isotropic branch has $\alpha=3/2$.*

*Proof.* The preceding summary gives $\sigma_B^2=1/24$. Therefore
$$
\alpha
=\frac1{16\sigma_B^2}
=\frac1{16(1/24)}
=\frac{24}{16}
=\frac32.
$$
The factor $16$ is part of the stated Bures-to-$E_8$ convention; this calculation does not derive it from isotropy alone. ∎

**Definition T.24.1** (Generation Manifold). The generation manifold is the Grassmannian:

$$\mathcal{M}_{\text{gen}} = \text{Gr}(2,8)$$

with complex dimension $\dim_{\mathbb{C}} = ab = 12$ and real dimension $\dim_{\mathbb{R}} = 2ab = 24$. These 24 real directions coincide with the QFI/Bures-active interface modes at the PU fixed point.

-----

### T.24.2 UV-IR Evolution of the Hierarchy Coefficient

The UV value $\alpha_{\text{UV}} = 3/2$ receives a multiplicative correction when evaluated at infrared scales due to coherent averaging over the finite-width generation wavepackets.

**Theorem T.24.2.1 (Registered IR Hierarchy-Coefficient Ansatz).** The branch value
$$
\alpha_{\mathrm{IR}}:=\alpha_{\mathrm{UV}}\operatorname{sinc}(1/\sqrt3)=1.418
$$
is a model prescription. A uniform phase average gives an amplitude multiplier $\operatorname{sinc}u$; it does not generally multiply a Gaussian exponent coefficient. If
$$
e^{-\alpha d^2}\longmapsto e^{-\alpha d^2}\operatorname{sinc}u,
$$
the equivalent exponent is distance-dependent,
$$
\alpha_{\mathrm{eff}}(d)=\alpha-\frac{\log(\operatorname{sinc}u)}{d^2}.
$$
Thus $1.418$ must be registered as an ansatz or calibration and is not derived by the displayed coherent average. ∎

**Remark T.24.2.2: Parallel Registered Sinc Prescriptions.** *The hierarchy-coefficient ansatz and the independent CKM phase-response ansatz use the same numerical sinc factor, but neither is the visibility statement proved by Theorem T.55:*

|Observable |UV Value |Registered prescription |IR Value |
|:--------------------|:------------------------------|:-----------------------|:---------------------------|
|CP Phase (CKM) |$\delta_{\text{flat}}=70.53°$|independent nonlinear response ansatz of Theorem T.56|$\delta=66.7°$ conditionally|
|Hierarchy Coefficient|$\alpha_{\text{UV}} = 3/2$ |independent coefficient ansatz of Theorem T.24.2.1|$\alpha_{\text{IR}} = 1.418$ conditionally|

Theorem T.55 supplies a sinc visibility factor while preserving phase; both numerical multiplications above require their separately registered model prescriptions.

**Remark T.24.2.3: Connection to $\sqrt{2}$.** *The sinc-corrected value $\alpha_{\text{IR}} = 1.418$ is remarkably close to $\sqrt{2} = 1.414$. The approximate relation $\alpha_{\text{IR}} \approx \sqrt{a}$ (where $a = 2$ is the active dimension from Theorem Z.1) may reflect deeper structure connecting the Landauer cost to the effective hierarchy.*

**Remark T.24.2.4: RG Running.** *The one-loop RG evolution contributes negligibly for leptons. The Yukawa self-term gives $\delta_{\text{RG}} \approx 7 \times 10^{-5}$, which is $< 0.01%$ of $\alpha_{\text{UV}}$ and absorbed within the theoretical uncertainty of the sinc derivation.*

**Remark T.24.2.5: Neutrino-Sector UV Branch.** *For the neutrino sector, the seesaw model is evaluated at the scale $M_R\sim10^{15}$ GeV. On the separately registered triplet-projection exponent branch, the hierarchy coefficient is*

$$\alpha_\nu = \frac{\alpha_{\text{UV}}}{\sqrt{3}} = \frac{3/2}{\sqrt{3}} = \frac{\sqrt{3}}{2} \approx 0.866.$$

*The PMNS rows are conditional comparisons of the complete registered model branch; they do not define $\chi^2/\mathrm{dof}$ and do not isolate $\alpha_{\mathrm{UV}}$ for statistical validation. In the charged-lepton model, $\alpha_{\mathrm{IR}}=\alpha_{\mathrm{UV}}f_{\mathrm{sinc}}=1.418$ is a registered ansatz or calibration, and it differs from $\alpha_{\mathrm{IR}}^{\mathrm{emp}}=1.411$ by approximately $0.5\%$.*

-----

### T.24.3 Conditional Realizability of the Charged-Lepton Triad

**Theorem T.24.3** (Conditional Realizability of the Charged-Lepton Triad). *On the branch assigning the adjacent, hierarchy-span, and intermediate charged-lepton pairs the distances $a$, $b$, and $2a$, respectively, the triad*

$$\boxed{T_\ell = (d^2_{32}, d^2_{31}, d^2_{21})_\ell = (a, b, 2a) = (2, 6, 4)}$$

*is realizable by $E_8$ roots and is nondegenerate. The code parameters and role assignments stated in this branch do not by themselves establish uniqueness among $E_8$ root triads.*

*Proof.* In the standard coordinate realization of the $E_8$ roots, every vector of the form $\pm e_i\pm e_j$ with $i\ne j$ is a root. Choose
$$
r_3=(1,1,0,0,0,0,0,0),
\qquad
r_2=(1,0,1,0,0,0,0,0),
$$
and
$$
r_1=(0,-1,0,1,0,0,0,0).
$$
Each vector has squared norm $2$. Their pairwise squared distances are
$$
\lVert r_3-r_2\rVert^2
=\lVert(0,1,-1,0,0,0,0,0)\rVert^2
=2,
$$
$$
\lVert r_3-r_1\rVert^2
=\lVert(1,2,0,-1,0,0,0,0)\rVert^2
=1+4+1
=6,
$$
and
$$
\lVert r_2-r_1\rVert^2
=\lVert(1,1,1,-1,0,0,0,0)\rVert^2
=4.
$$
Equivalently, the Gram matrix is
$$
G=
\begin{pmatrix}
2&1&-1\\
1&2&0\\
-1&0&2
\end{pmatrix},
\qquad
\det G=4>0.
$$
Thus the displayed triad has the claimed $E_8$ realization and is nondegenerate. The calculation is an existence certificate; it contains no classification argument excluding other realizable triads. ∎

**Corollary T.24.3.1** (Conditional Hierarchy Ratio). *Assume the triad of Theorem T.24.3 and the anchored suppression law*
$$
\ln\!\frac{m_3}{m_i}=\alpha d_{3i}^2,
\qquad
i\in\{1,2\},
\qquad
\alpha>0.
$$
*Then*
$$
\mathcal R_\ell
:=
\frac{\ln(m_3/m_1)}{\ln(m_3/m_2)}
=
\frac{d_{31}^2}{d_{32}^2}
=3.
$$

*Proof.* The suppression law and $\alpha>0$ give
$$
\mathcal R_\ell
=
\frac{\alpha d_{31}^2}{\alpha d_{32}^2}
=
\frac{6}{2}
=3.
$$
For the quoted masses, the observed ratio is approximately $2.889$, which is $3.7\%$ below the branch value $3$. ∎

-----

### T.24.4 $E_8$ Lattice Angle Formula

**Lemma T.24.4** ($E_8$ Angle Formula). *For $E_8$ roots with $|r|^2 = 2$, the lattice angle $\theta_{ij}$ between roots $r_i, r_j$ satisfies:*

$$\cos\theta_{ij} = \frac{\langle r_i, r_j \rangle}{|r_i| \cdot |r_j|} = \frac{\langle r_i, r_j \rangle}{2}$$

*Using the $E_8$ inner product formula $\langle r_i, r_j \rangle = 2 - d^2_{ij}/2$:*

$$\cos\theta_{ij} = \frac{4 - d^2_{ij}}{4} = 1 - \frac{d^2_{ij}}{4}$$

*Proof.* Since $\lVert r_i\rVert^2=\lVert r_j\rVert^2=2$,
$$
d_{ij}^2
=\lVert r_i-r_j\rVert^2
=4-2\langle r_i,r_j\rangle.
$$
Thus $\langle r_i,r_j\rangle=2-d_{ij}^2/2$. Because $\lVert r_i\rVert\lVert r_j\rVert=2$,
$$
\cos\theta_{ij}
=\frac{\langle r_i,r_j\rangle}{2}
=1-\frac{d_{ij}^2}{4}
=\frac{4-d_{ij}^2}{4}.
$$
∎

**Table T.24.1** (Charged Lepton Lattice Angles)

|Pair|$d^2_{ij}$|Formula|$\cos\theta_{ij}$|$\theta_{ij}$|Lattice Type |
|:---|:---------|:------|:----------------|:------------|:-------------|
|3↔2 |2 |$a$ |1/2 |60° |A₂ (hexagonal)|
|3↔1 |6 |$b$ |−1/2 |120° |A₂ (hexagonal)|
|1↔2 |4 |$2a$ |0 |90° |D₄ (cubic) |

-----

### T.24.5 Neutrino Triad: A₂ Constraint for Majorana Fermions

The neutrino triad differs from the charged lepton triad because of Majorana structure.

**Definition T.24.5a** (Takagi-Weyl Majorana Geometry Datum). A Takagi-Weyl Majorana geometry datum consists of:

1. a complex symmetric three-generation Majorana mass operator $M_\nu=M_\nu^T$;

2. its Autonne-Takagi diagonalization
$$
U^TM_\nu U=D,
\qquad
D=\operatorname{diag}(m_1,m_2,m_3),
\qquad
m_i\ge0;
\tag{T.24.5a.1}
$$

3. the traceless eigenvalue-difference plane
$$
\mathfrak h_0
=
\{x\in\mathbb R^3:x_1+x_2+x_3=0\};
\tag{T.24.5a.2}
$$

4. the standard $A_2$ roots
$$
\alpha_{ij}=e_i-e_j,
\qquad
i\ne j,
\tag{T.24.5a.3}
$$
with $|\alpha_{ij}|^2=2$;

5. the identification of the retained Majorana $1\leftrightarrow2$ generation geometry with the Weyl plane $\mathfrak h_0/S_3$.

**Theorem T.24.5b** (Takagi-$A_2$ Weyl-Alcove Closure). On a branch carrying the Takagi-Weyl Majorana geometry datum, the Majorana $1\leftrightarrow2$ sector has $A_2$ angle geometry. When the retained generation displacement is restricted to adjacent non-opposite $A_2$ primitive roots,
$$
d^2_{21,\nu}\in\{2,6\},
\qquad
d^2_{21,\nu}\ne4.
\tag{T.24.5b.1}
$$

*Proof.* Since $M_\nu$ is complex symmetric, its physical diagonalization is Takagi diagonalization, not an independent left-right singular-value decomposition. The residual relabeling of the three nonnegative Takagi values is the permutation group $S_3$. On the traceless diagonal plane $\mathfrak h_0$, this is the Weyl group of the $A_2$ root system with roots $\alpha_{ij}=e_i-e_j$.

The roots satisfy
$$
|\alpha_{ij}|^2=2.
$$
For adjacent primitive roots,
$$
\alpha_{12}\cdot\alpha_{23}=-1,
$$
so the angle is $120^\circ$. For oppositely oriented adjacent choices,
$$
\alpha_{12}\cdot\alpha_{13}=1,
$$
so the angle is $60^\circ$. No two nonzero $A_2$ roots are orthogonal: distinct non-opposite roots have normalized inner products $\pm1/2$, while opposite roots have normalized inner product $-1$. Therefore the $90^\circ$ case required for the $D_4$ distance $d^2=4$ is not present in the Takagi-Weyl $A_2$ plane.

For $E_8$ roots with $|r|^2=2$, the angle-distance relation from Lemma T.24.4 is
$$
\cos\theta=\frac{4-d^2}{4}.
$$
Thus $\theta=60^\circ$ gives $d^2=2$, while $\theta=120^\circ$ gives $d^2=6$. The opposite-root case would give $\theta=180^\circ$ and $d^2=8$, so it is excluded by the adjacent non-opposite generation-displacement clause, not by the $A_2$ root system itself. The excluded $\theta=90^\circ$ case would give $d^2=4$, which is not an $A_2$ root angle. ∎

**Theorem T.24.5** (Conditional Majorana $A_2$ Consequence). On a branch carrying the Takagi-Weyl datum of Definition T.24.5a and the adjacent non-opposite primitive-root restriction of Theorem T.24.5b, the retained generation displacement has $A_2$ angle geometry. Majorana bilinearity alone does not select that datum.



$$d^2_{21,\nu} \in \{2, 6\} \quad \text{(not } d^2 = 4 \text{)}$$

*Proof.* The hypotheses of Theorem T.24.5 are exactly the Takagi--Weyl datum and the adjacent non-opposite primitive-root restriction of Theorem T.24.5b. That theorem gives
$$
d_{21,\nu}^2\in\{2,6\}
$$
and excludes $d_{21,\nu}^2=4$. Hence the retained displacement has the asserted $A_2$ angle geometry. ∎

**Corollary T.24.5.1** (Conditional Neutrino-Triad Candidate). *On the branch of Theorem T.24.5, additionally choose the anchored assignments*
$$
d_{32,\nu}^2=a=2,
\qquad
d_{31,\nu}^2=b=6,
\qquad
d_{21,\nu}^2=b=6.
$$
*Then*
$$
\boxed{T_\nu=(a,b,b)=(2,6,6)}.
$$

*Proof.* Substitution of the three declared branch assignments gives
$$
(d_{32,\nu}^2,d_{31,\nu}^2,d_{21,\nu}^2)=(2,6,6).
$$
Theorem T.24.5 verifies that the last entry is allowed by the retained $A_2$ geometry; the first two entries and the choice of $6$ for the last entry are the branch assignments stated in this corollary. ∎

**Table T.24.2** (Triad Comparison)

|Sector |Charged Leptons|Neutrinos |Origin |
|:--------|:--------------|:----------|:--------------------------|
|3↔2 |$a = 2$ |$a = 2$ |Minimal $E_8$ distance |
|3↔1 |$b = 6$ |$b = 6$ |Full hierarchy span |
|1↔2 |$2a = 4$ |$b = 6$ |D₄ (Dirac) vs A₂ (Majorana)|
|**Triad**|$(a, b, 2a)$ |$(a, b, b)$|Conditional root-geometry model data |

**Remark T.24.5.2: Derivation Status.** *The A₂ constraint on Majorana fermions is not an independent assumption on branches carrying the Takagi-Weyl datum of Definition T.24.5a. It is the Weyl geometry of the Takagi eigenvalue-difference plane:*

|Fermion Type|Mass Term |Diagonalization Geometry |Compatible Lattice |
|:-----------|:--------------------|:-------------------------|:-------------------|
|Dirac |$\bar{\psi}_L \psi_R$|left-right singular-value geometry |D₄ (90°, cubic) |
|Majorana |$\nu^T C \nu$ |Takagi eigenvalue-difference Weyl plane |A₂ (60°/120°, hexagonal)|

*This is a conditional model distinction; Theorem T.24.3 supplies only geometric realizability of one charged-lepton candidate



### T.24.6 Root-System Realizability and Selection Boundary

**Lemma T.24.6** (Gram Determinant Formula). *With $a = \langle r_3, r_2 \rangle$, $b = \langle r_3, r_1 \rangle$, $c = \langle r_2, r_1 \rangle$:*

$$\det(G) = 8 + 2abc - 2(a^2 + b^2 + c^2)$$

*Triads with $\det(G) < 0$ cannot be realized in $E_8$.*

*Proof.* The Gram matrix is
$$
G=
\begin{pmatrix}
2&a&b\\
a&2&c\\
b&c&2
\end{pmatrix}.
$$
Expansion along the first row gives
$$
\det G
=2(4-c^2)-a(2a-bc)+b(ac-2b)
=8+2abc-2(a^2+b^2+c^2).
$$
If roots $r_3,r_2,r_1$ realize the triad, then for every $x\in\mathbb R^3$,
$$
x^TGx
=\lVert x_1r_3+x_2r_2+x_3r_1\rVert^2
\ge0.
$$
Thus $G$ is positive semidefinite, all its eigenvalues are nonnegative, and their product $\det G$ is nonnegative. Therefore $\det G<0$ precludes an $E_8$ realization. ∎

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
|(8, 8, 2) |−2 |−2 |1 |−2 |1 |Infeasible|
|(8, 8, 6) |−2 |−2 |−1 |−18 |1 |Infeasible|

**Classification:**

- Feasible ($\det(G) > 0$): 9 triads
- Degenerate ($\det(G) = 0$): 5 triads
- Infeasible ($\det(G) < 0$): 6 triads

There are $4+3+2+1=10$ ordered pairs $(d_{32}^2,d_{31}^2)$ with $d_{31}^2\ge d_{32}^2$ and entries in $\{2,4,6,8\}$. Each pair permits the two declared values $d_{21}^2\in\{2,6\}$, hence the table contains all $20$ cases. Lemma T.24.4 supplies $(a,b,c)$ and Lemma T.24.6 supplies each determinant. Direct sign counting gives $9$ positive, $5$ zero, and $6$ negative determinants. ∎

-----

### T.24.8 Atmospheric Mixing Filter

**Lemma T.24.8** (Conditional Maximal Mixing in a Two-State Block). Let the relevant Hermitian $2\times2$ block, after removal of its trace, be
$$
M_{23}
=
\begin{pmatrix}
\Delta/2 & B\\
\overline B & -\Delta/2
\end{pmatrix},
\qquad
B\ne0.
$$
If the matched-sector branch independently gives $\Delta=0$, then the mixing angle is maximal:
$$
\theta_{23}=45^\circ.
$$

*Proof.* Rephase the two basis vectors so that $B>0$. Diagonalization gives
$$
\tan(2\theta_{23})=\frac{2B}{\Delta}.
$$
For $\Delta=0$ and $B\ne0$, one has $2\theta_{23}=\pi/2$ modulo the eigenvector-label convention, hence $\theta_{23}=\pi/4$. ∎

**Corollary T.24.8.1** (Scope of the Atmospheric Filter). Equality of the geometric suppressions $d^2_{32,\nu}=d^2_{32,\ell}$ yields maximal mixing only if a mass-matrix certificate also proves $\Delta=0$. Distances $d^2_{32,\nu}\in\{4,6,8\}$ do not determine numerical mixing angles without their corresponding diagonal and off-diagonal matrix entries. Therefore the listed triads cannot be filtered by the atmospheric angle from distance matching alone.

-----

### T.24.9 PCE-Optimal Selection

**Definition T.24.9a** (Alignment Cost). *The PCE cost for misalignment between neutrino and charged lepton triads:*

$$V_{\text{align}}(T_\nu, T_\ell) = \sum_{i<j} \kappa_{ij} \sin^2\left(\frac{\theta^{(\nu)}_{ij} - \theta^{(\ell)}_{ij}}{2}\right)$$

*where $\theta^{(f)}_{ij} = \arccos[(4-d^2_{ij,f})/4]$ and stiffness weights satisfy $\kappa_{23} > \kappa_{12} > \kappa_{13}$ from the mass hierarchy.*

**Proposition T.24.9** (Preferred neutrino triad within the alignment-cost model). Within Definition T.24.9a, let the charged-lepton triad be $T_\ell=(2,6,4)$ and let all stiffnesses be positive. Among the candidates
$$
(2,2,2),\quad(2,4,2),\quad(2,4,6),\quad(2,6,6),
$$
the unique minimizer is
$$
T_\nu=(2,6,6).
$$

*Proof.* The angle map gives
$$
\theta(2)=60^\circ,\qquad
\theta(4)=90^\circ,\qquad
\theta(6)=120^\circ.
$$
All four candidates match the $23$ angle. Their costs are
$$
\begin{aligned}
V(2,2,2)
&=\frac14\kappa_{31}+\sin^2(15^\circ)\kappa_{12},\\
V(2,4,2)
&=\sin^2(15^\circ)(\kappa_{31}+\kappa_{12}),\\
V(2,4,6)
&=\sin^2(15^\circ)(\kappa_{31}+\kappa_{12}),\\
V(2,6,6)
&=\sin^2(15^\circ)\kappa_{12}.
\end{aligned}
$$
Since $\kappa_{31}>0$ and $\sin^2(15^\circ)>0$, the last value is strictly smaller than each of the first three. ∎

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

The characteristic polynomial is
$$
\det(\lambda I-G)=(\lambda-1)^2(\lambda-4),
$$
so the eigenvalues are $1,1,4$. They are all positive, hence $G$ is positive definite and the three roots form the asserted nondegenerate realization. ∎

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

**Theorem T.24.12** (Conditional Majorana Exponent Reduction). *Assume the triplet-projection exponent branch on which the RMS reduction of a three-component isotropic Majorana order parameter acts on the Gaussian exponent coefficient, rather than on the prefactor or the wavefunction width. Then the neutrino-sector hierarchy coefficient is*

$$\alpha_\nu = \frac{\alpha_{\text{UV}}}{\sqrt{3}} = \frac{1}{\sqrt{3}} \cdot \frac{3}{2} = \frac{\sqrt{3}}{2} \approx 0.866.$$

*Proof.* Let $X\in\mathbb R^3$ be the nonzero centered isotropic triplet on this branch, with $\operatorname{Cov}(X)=\sigma_X^2I_3$, $\sigma_X^2>0$, and let $\widehat n$ be a unit vector. Then
$$
\mathbb E[(X\cdot\widehat n)^2]=\sigma_X^2,
\qquad
\mathbb E\|X\|^2=3\sigma_X^2.
$$
The projected-to-full RMS ratio is therefore
$$
\sqrt{\frac{\mathbb E[(X\cdot\widehat n)^2]}{\mathbb E\|X\|^2}}=\frac1{\sqrt3}.
$$
The stated triplet-projection exponent hypothesis assigns this ratio to the Gaussian exponent coefficient. Consequently
$$
\alpha_\nu=\frac{\alpha_{\mathrm{UV}}}{\sqrt3}=\frac{\sqrt3}{2}=0.866025\ldots.
$$
The RMS calculation does not independently choose whether the reduction acts on an exponent, a width, or a prefactor; that choice is precisely the branch hypothesis. ∎

**Remark T.24.12.1: UV-Branch Identity.** *On the triplet-projection exponent branch, the relation between the two coefficients is*

$$\alpha_\nu = \frac{\alpha_{\text{UV}}}{\sqrt{3}} = \frac{\sqrt{3}}{2} \quad \Longleftrightarrow \quad \alpha_{\text{UV}} = \frac{3}{2}.$$

*This equivalence is an internal algebraic identity on the registered branch. The seesaw scale motivates evaluating the model with a UV coefficient, but the displayed comparisons do not define $\chi^2/\mathrm{dof}$ and do not validate the coefficient independently of the triplet-projection, triad, mixing-response, scale, and phase inputs.*

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

**Theorem T.24.14 (Heaviest Neutrino Mass under Matching and Majorana-Normalization Assumptions).** Let $y_{\nu3}(\mu_G)$ be the neutrino Yukawa coupling at the matching scale and let $R_\nu>0$ collect the declared RG and threshold evolution to the low-energy mass. Assume $\langle H\rangle=(0,v/\sqrt2)^T$, $v=252\,\mathrm{GeV}$, $M_R=M_{Pl}e^{-9}$ with $M_{Pl}=1.2209\times10^{19}\,\mathrm{GeV}$, the Majorana normalization $\sqrt{3/2}$, and the leading type-I seesaw matching prescription
$$
m_3:=R_\nu\frac{y_{\nu3}(\mu_G)^2v^2}{2M_R}\sqrt{\frac32}.
$$
On the explicit subbranch $R_\nu=1$ and $y_{\nu3}(\mu_G)=1$,
$$
m_3=25.809938\,\mathrm{meV}.
$$
Thus the displayed number is a matching-subbranch value, not an RG-independent absolute mass prediction.

*Proof.* The assumed Majorana scale is
$$
M_R
=(1.2209\times10^{19})e^{-9}\,\mathrm{GeV}
=1.506710298\times10^{15}\,\mathrm{GeV}.
$$
Substitution of $R_\nu=y_{\nu3}(\mu_G)=1$ and $v=252\,\mathrm{GeV}$ into the matching prescription gives
$$
\begin{aligned}
m_3
&=
\frac{252^2}{2(1.506710298\times10^{15})}
\sqrt{\frac32}\,\mathrm{GeV}\\
&=2.580993785\times10^{-11}\,\mathrm{GeV}.
\end{aligned}
$$
Since $1\,\mathrm{GeV}=10^{12}\,\mathrm{meV}$,
$$
m_3=25.80993785\,\mathrm{meV},
$$
which rounds to the stated value. ∎

### T.24.15 Complete Mass Spectrum

**Theorem T.24.15 (Neutrino Mass Spectrum).** Under Theorem T.24.14, assume
$$
\frac{m_3}{m_2}=e^{\sqrt3},
\qquad
\frac{m_3}{m_1}=e^{3\sqrt3}.
$$
Then
$$
\boxed{(m_1,m_2,m_3)=(0.142931,4.566325,25.809938)\,\mathrm{meV}},
$$
and
$$
\Sigma_\nu=m_1+m_2+m_3
=30.519194\,\mathrm{meV}
=0.030519194\,\mathrm{eV}.
$$

*Proof.* Solving the two assumed ratios for the lighter masses gives
$$
m_2=m_3e^{-\sqrt3},
\qquad
m_1=m_3e^{-3\sqrt3}.
$$
With $m_3=25.809937853\,\mathrm{meV}$ from Theorem T.24.14,
$$
m_2=25.809937853e^{-\sqrt3}\,\mathrm{meV}
=4.566325340\,\mathrm{meV},
$$
$$
m_1=25.809937853e^{-3\sqrt3}\,\mathrm{meV}
=0.142931067\,\mathrm{meV}.
$$
Their sum is
$$
0.142931067+4.566325340+25.809937853
=30.519194260\,\mathrm{meV}
=0.030519194260\,\mathrm{eV}.
$$
Rounding gives the displayed spectrum and sum. ∎

-----

### T.24.16 Mass-Squared Differences

**Theorem T.24.16 (Mass-Squared Differences).** The spectrum of Theorem T.24.15 gives
$$
\boxed{
\Delta m^2_{21}=2.08309\times10^{-5}\,\mathrm{eV}^2,
\qquad
\Delta m^2_{31}=6.66132\times10^{-4}\,\mathrm{eV}^2
}
$$
and
$$
\frac{\Delta m^2_{31}}{\Delta m^2_{21}}=31.9781.
$$
The ratio is compatible with the cited ratio $32.6\pm0.7$, but both absolute splittings are far below the cited values $(7.53\pm0.18)\times10^{-5}\,\mathrm{eV}^2$ and $(2.453\pm0.033)\times10^{-3}\,\mathrm{eV}^2$. Agreement of the ratio alone does not close the absolute-scale branch.

*Proof.* By definition and the normal ordering of Theorem T.24.15,
$$
\Delta m_{21}^2=m_2^2-m_1^2,
\qquad
\Delta m_{31}^2=m_3^2-m_1^2.
$$
Using the unrounded masses from that theorem gives
$$
m_2^2-m_1^2
=20.83089782\,\mathrm{meV}^2,
$$
$$
m_3^2-m_1^2
=666.13246269\,\mathrm{meV}^2.
$$
Since $1\,\mathrm{meV}^2=10^{-6}\,\mathrm{eV}^2$,
$$
\Delta m_{21}^2
=2.083089782\times10^{-5}\,\mathrm{eV}^2,
\qquad
\Delta m_{31}^2
=6.661324627\times10^{-4}\,\mathrm{eV}^2.
$$
Finally,
$$
\frac{6.661324627\times10^{-4}}{2.083089782\times10^{-5}}
=31.97809660.
$$
Rounding gives all three displayed values. ∎

**Corollary T.24.16a (Conditional $A_2$ Absolute-Scale Projection).** On the internally normalized seesaw branch of Theorems T.24.14--T.24.16,
$$
\Sigma_\nu=30.519194\,\mathrm{meV},
\qquad
m_\beta=4.62340\,\mathrm{meV},
\qquad
\frac{m_\beta}{\Sigma_\nu}=0.15149.
\tag{T.24.16a}
$$
Here
$$
m_\beta
=\sqrt{c_{13}^2c_{12}^2m_1^2+c_{13}^2s_{12}^2m_2^2+s_{13}^2m_3^2}
\tag{T.24.16b}
$$
with the unrounded upstream outputs $\theta_{12}=33.69735528^\circ$ and $\theta_{13}=8.65607149^\circ$.

A distinct oscillation-anchored calibration may instead set
$$
m_3^{\mathrm{osc}}
=\sqrt{\frac{\Delta m^2_{31}}{1-e^{-6\sqrt3}}},
\qquad
m_2^{\mathrm{osc}}=m_3^{\mathrm{osc}}e^{-\sqrt3},
\qquad
m_1^{\mathrm{osc}}=m_3^{\mathrm{osc}}e^{-3\sqrt3}.
$$
Using the cited $\Delta m^2_{31}=2.453\times10^{-3}\,\mathrm{eV}^2$ gives
$$
(m_1^{\mathrm{osc}},m_2^{\mathrm{osc}},m_3^{\mathrm{osc}})
=(0.274281,8.762647,49.528529)\,\mathrm{meV},
$$
$$
\Sigma_\nu^{\mathrm{osc}}=58.565457\,\mathrm{meV},
\qquad
m_\beta^{\mathrm{osc}}=8.87216\,\mathrm{meV}.
$$
This second set is an empirical calibration, not a consequence of the internally normalized seesaw value. The two calibrations must not be combined, and neither constitutes an oscillation-data closure of the internal branch.

*Proof.* On the internally normalized branch, Theorem T.24.15 gives
$$
(m_1,m_2,m_3)
=(0.142931067,4.566325340,25.809937853)\,\mathrm{meV}.
$$
Hence
$$
\Sigma_\nu
=0.142931067+4.566325340+25.809937853
=30.519194260\,\mathrm{meV}.
$$
For the unrounded angle outputs $\theta_{12}=33.69735528^\circ$ and $\theta_{13}=8.65607149^\circ$,
$$
(s_{12}^2,c_{12}^2,s_{13}^2,c_{13}^2)
=(0.30780972,0.69219028,0.02265112,0.97734888).
$$
The three terms in $m_\beta^2$ are
$$
c_{13}^2c_{12}^2m_1^2=0.01382065\,\mathrm{meV}^2,
$$
$$
c_{13}^2s_{12}^2m_2^2=6.27286089\,\mathrm{meV}^2,
$$
$$
s_{13}^2m_3^2=15.08911112\,\mathrm{meV}^2.
$$
Thus
$$
m_\beta=\sqrt{21.37579266}\,\mathrm{meV}
=4.62339623\,\mathrm{meV},
\qquad
\frac{m_\beta}{\Sigma_\nu}=0.15149142.
$$

On the oscillation-anchored branch, the common ratios give
$$
m_1=m_3e^{-3\sqrt3},
\qquad
m_2=m_3e^{-\sqrt3}.
$$
Consequently
$$
\Delta m_{31}^2
=m_3^2-m_1^2
=m_3^2(1-e^{-6\sqrt3}),
$$
so
$$
m_3
=\sqrt{\frac{2.453\times10^{-3}}{1-e^{-6\sqrt3}}}\,\mathrm{eV}
=49.52852945\,\mathrm{meV}.
$$
Multiplication by $e^{-\sqrt3}$ and $e^{-3\sqrt3}$ gives
$$
(m_1,m_2,m_3)
=(0.274280612,8.762647178,49.528529454)\,\mathrm{meV}.
$$
Their sum is $58.565457244\,\mathrm{meV}$. Substitution of these masses and the same unrounded angles into the beta-decay formula gives
$$
m_\beta
=\sqrt{0.05089385+23.09950141+55.56490886}\,\mathrm{meV}
=8.87216457\,\mathrm{meV}.
$$
Rounding yields the two separately displayed sets. ∎

**Proposition T.24.16.1** (Illustrative Parameter-Sensitivity Ledger). *Conditional on holding all unlisted modeling choices constant, the stated one-at-a-time parameter variations give:*

|Parameter |Input Variation |Effect on $\Delta m^2_{21}$|Effect on $\theta_{12}$|
|:----------------|:--------------------------------|:--------------------------|:----------------------|
|$\alpha_\nu = \sqrt3/2$ inherited from $\alpha_{\text{UV}}=3/2$ |±2% (from $\delta_{\text{geom}}$)|±4% |±0.5° |
|$d^2_{ij}$ |Exact (discrete $E_8$) |0 |0 |
|$M_R$ |±5% (from $y_3$ running) |±10% |0 |
|$f_{\text{sinc}}$|< 0.1% |< 0.2% |< 0.1° |

*The discrete $E_8$ triad structure gives $d^2 \in \{2, 4, 6, 8\}$, so this entry does not vary continuously. The remaining entries are local one-at-a-time sensitivities; they do not by themselves define probability distributions or covariances. If the displayed symmetric variations are additionally interpreted as mutually independent centered $1\sigma$ Gaussian errors, quadrature gives $\sqrt{4^2+10^2+0.2^2}\%=10.77\%$ for $\Delta m^2_{21}$ and $\sqrt{0.5^2+0.1^2}^\circ=0.510^\circ$ for $\theta_{12}$. If they are deterministic ranges, the corresponding triangle-inequality bounds are $14.2\%$ and $0.6^\circ$. This ledger supplies no sensitivity calculation for $\theta_{13}$ and therefore no numerical uncertainty for that angle.*

-----

## Part IV: PMNS Mixing Angles

### T.24.17 Generation Variance and Sinc Factor

**Theorem T.24.17** (Conditional Generation-Subspace Variance). *Assume that the generation projection has $N_g=3$ mutually orthogonal directions, that its covariance is isotropic, and that its projected mean-squared radius is normalized to one. Then the variance per generation direction and the associated angular width are*

$$
\sigma^2_{\mathcal G}=\frac1{N_g}=\frac13,
\qquad
u=\sqrt{\sigma^2_{\mathcal G}}=\frac1{\sqrt3}=0.5774\ldots.
$$

*Proof.* Isotropy makes the covariance on the generation subspace equal to $\sigma_{\mathcal G}^2I_{N_g}$. The normalized projected mean-squared radius is therefore
$$
1
=\mathbb E\lVert X_{\mathcal G}\rVert^2
=\operatorname{Tr}(\sigma_{\mathcal G}^2I_{N_g})
=N_g\sigma_{\mathcal G}^2.
$$
Since $N_g=3$, division gives $\sigma_{\mathcal G}^2=1/3$, and taking the positive square root gives $u=1/\sqrt3$. ∎

**Theorem T.24.18** (Uniform-Packet Sinc Correction Factor). *Assume that the generation phase $\phi$ is uniformly distributed on $[-u,u]$, with $u=1/\sqrt3$ from Theorem T.24.17. Then coherent phase averaging gives*

$$
f_{\text{sinc}}
=\left|\mathbb E(e^{i\phi})\right|
=\frac{\sin u}{u}
=\frac{\sin(1/\sqrt3)}{1/\sqrt3}
=0.9454\ldots.
$$

*Proof.* For $u>0$, the uniform density is $1/(2u)$, so
$$
\mathbb E(e^{i\phi})
=\frac1{2u}\int_{-u}^{u}e^{i\phi}\,d\phi
=\frac1{2u}\left[\frac{e^{i\phi}}i\right]_{-u}^{u}
=\frac{e^{iu}-e^{-iu}}{2iu}
=\frac{\sin u}{u}.
$$
For $u=0$, the phase is concentrated at zero and the expectation is $1$, equal to the continuous extension $\lim_{u\to0}\sin u/u$. Substitution of $u=1/\sqrt3$ gives the displayed value. ∎

-----

### T.24.19 Atmospheric Angle θ₂₃

**Theorem T.24.19 (Conditional Atmospheric Mixing Model).** Assume the PMNS geometric-factor branch of Theorem T.24.20; a relevant Hermitian $2\times2$ mass block with $\Delta=0$ and $B\ne0$ as in Lemma T.24.8; the specified BCH generator convention; the bridge assignment $s_{13}^{\mathrm{eff}}=f_{\mathrm{sinc}}/N_g$; and the commutator-lift rule of Steps 4–5. Under these model inputs,
$$
\boxed{\theta_{23}=47.4^\circ}.
$$

*Proof.*

**Step 1 (Mass-Block Baseline).** The hypotheses $\Delta=0$ and $B\ne0$ give
$$
\tan(2\theta_{23}^{(0)})=\frac{2|B|}{\Delta},
\qquad
\theta_{23}^{(0)}=45^\circ.
$$
The equality $d^2_{32,\nu}=d^2_{32,\ell}=2$ is compatible with this branch but does not imply $\Delta=0$ by itself.

**Step 2** (Registered Bridge Amplitude). The bridge assignment assumed in the theorem gives
$$
s_{13}^{\mathrm{eff}}
=
\frac{f_{\mathrm{sinc}}}{N_g}
=
\frac{0.9453630557}{3}
=0.3151210186.
$$

**Step 3** (Registered Commutator Lift). The declared mismatch magnitude is
$$
\Delta\theta_{12}
=
|90^\circ-120^\circ|
=30^\circ.
$$
By the commutator-lift rule assumed in the theorem,
$$
\delta\theta_{23}
=
\frac14\Delta\theta_{12}s_{13}^{\mathrm{eff}}
=
\frac14(30^\circ)(0.3151210186)
=2.36340764^\circ.
$$
The sign is the positive orientation selected by that rule; reversing the ordered generation loop would reverse it.

**Step 4** (Final Result). Adding the mass-block baseline from Step 1 gives
$$
\theta_{23}
=45^\circ+2.36340764^\circ
=47.36340764^\circ
\approx47.4^\circ.
$$
No truncated Baker-Campbell-Hausdorff series is used in this conditional arithmetic. ∎

**Experimental Comparison** (Particle Data Group 2024 listing, Normal Ordering):

|Quantity |Theory|Experiment |Pull |
|:------------------|:-----|:------------|:-----|
|$\theta_{23}$ |47.36340764° |$48.33^{+0.87}_{-1.21}$° |$-0.80\sigma$|
|$\sin^2\theta_{23}$|0.54120247 |$0.558^{+0.015}_{-0.021}$|$-0.80\sigma$|

∎

-----

**Lemma T.24.19.1 (Majorana overlap coefficient on the declared model branch).** Assume the overlap model rule
$$
\mathcal E_{\mathrm{Maj}}
:=
\sqrt{\frac{d_{21,\nu}^2d_{31,\nu}^2}{d_{21,\ell}^2d_{32,\nu}^2}}
\frac{\dim(\mathbf3_S)}{\dim(\mathbf2)}.
$$
For the registered distances and dimensions,
$$
\mathcal E_{\mathrm{Maj}}
=\sqrt{\frac{6\cdot6}{4\cdot2}}\frac32
=\frac{9}{2\sqrt2}
=3.18198\ldots.
$$

*Proof.* Substitute the declared distance squares and the dimension ratio. The curvature, tilt, and sinc-renormalization factors belong to Theorem T.24.20 and are not part of this coefficient. ∎

### T.24.20 Solar Angle θ₁₂

**Theorem T.24.20** (Solar Mixing on the Conditional PMNS Geometric-Factor Branch). *Assume the Majorana $A_2$ branch of Theorem T.24.5, the triplet-projection exponent branch of Theorem T.24.12, and the unit-total-generation-variance branch of Theorem T.54.2. Assume further that*
$$
(d_{21,\ell}^2,d_{21,\nu}^2,d_{31,\nu}^2,d_{32,\nu}^2)=(4,6,6,2),
$$
*that the angular response cost is*
$$
V(\theta)
=
\frac{\kappa_\ell}{2}(\theta-90^\circ)^2
+
\frac{\kappa_\nu}{2}(\theta-120^\circ)^2,
\qquad
\frac{\kappa_\nu}{\kappa_\ell}=\frac13,
$$
*and that the PMNS response rule is*
$$
\sin\theta_{12}
=
\cos(30^\circ)\sin(\theta_{\mathrm{vac}}-90^\circ)
f_{\mathrm{dist}}f_{\mathrm{Schur}}f_{\mathrm{sym}}
f_{\mathrm{curv}}f_{\mathrm{tilt}}f_{\mathrm{sinc-renorm}},
$$
*with*
$$
f_{\mathrm{dist}}=\sqrt{\frac64},
\qquad
f_{\mathrm{Schur}}=\sqrt{\frac62},
\qquad
f_{\mathrm{sym}}=2,
$$
$$
f_{\mathrm{curv}}
=1-\frac{32/23}{6\cdot24}\frac19,
\qquad
f_{\mathrm{tilt}}
=1+\frac7{8\cdot25},
\qquad
f_{\mathrm{sinc-renorm}}
=\operatorname{sinc}(1/\sqrt3)^{-2}.
$$
*Then*
$$
\boxed{\theta_{12}=33.7^\circ}.
$$
*This is a conditional calculation within the declared PMNS response model; the response rule and its factors are model inputs.*

*Proof.* Differentiating the assumed quadratic cost gives
$$
V'(\theta)
=
\kappa_\ell(\theta-90^\circ)
+
\kappa_\nu(\theta-120^\circ).
$$
Because $V''(\theta)=\kappa_\ell+\kappa_\nu>0$, its unique minimizer is
$$
\theta_{\mathrm{vac}}
=
\frac{\kappa_\ell90^\circ+\kappa_\nu120^\circ}
{\kappa_\ell+\kappa_\nu}
=
\frac{90^\circ+(1/3)120^\circ}{1+1/3}
=97.5^\circ.
$$
Thus $\theta_{\mathrm{vac}}-90^\circ=7.5^\circ$ and
$$
\cos(30^\circ)\sin(7.5^\circ)
=0.1130389983.
$$
The remaining factors evaluate to
$$
f_{\mathrm{dist}}=1.224744871,
\qquad
f_{\mathrm{Schur}}=1.732050808,
\qquad
f_{\mathrm{curv}}=0.998926463,
$$
$$
f_{\mathrm{tilt}}=1.035,
\qquad
f_{\mathrm{sinc-renorm}}=1.118929561.
$$
Substitution into the assumed response rule gives
$$
\sin\theta_{12}
=0.554806025.
$$
Therefore
$$
\theta_{12}
=\arcsin(0.554806025)
=33.69735528^\circ
\approx33.7^\circ.
$$
∎

**Experimental Comparison** (Particle Data Group 2024):

|Quantity |Theory|Experiment |Pull |
|:------------------|:-----|:------------|:-----|
|$\theta_{12}$ |33.7° |33.6° ± 0.8° |+0.12σ|
|$\sin^2\theta_{12}$|0.30780973 |0.307 ± 0.013|+0.06σ|

∎

-----

### T.24.21 Reactor Angle θ₁₃

**Theorem T.24.21 (Reactor mixing on the registered capacity-sharing branch).** Assume the zero-baseline branch, the coefficient
$$
J_{\mathrm{geom}}=\frac1{18\sqrt3},
$$
and the capacity-sharing rule
$$
\sin\theta_{13}=A\cos\theta_{13},
\qquad
A=\frac{8J_{\mathrm{geom}}\operatorname{sinc}(1/\sqrt3)}{\sqrt3\sin(67.4^\circ)\sin(94.8^\circ)}.
$$
Then
$$
\boxed{\theta_{13}=8.66^\circ\approx8.7^\circ}.
$$

*Proof.* The registered inputs give $A=0.1522369451$. Since $0\le\theta_{13}<\pi/2$, division by $\cos\theta_{13}$ is valid and the branch equation becomes $\tan\theta_{13}=A$. Thus
$$
\theta_{13}=\arctan(A)=8.65607149^\circ,
\qquad
\sin\theta_{13}=\frac{A}{\sqrt{1+A^2}}=0.1505029004.
$$
The zero baseline, $J_{\mathrm{geom}}$, and the capacity-sharing equation are model inputs; distance matching does not derive them. ∎

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

**Theorem T.24.23** (Leptonic Jarlskog Invariant). *On the conditional mixing branch of Theorems T.24.19–T.24.22, the leptonic Jarlskog invariant is*
$$
J_{CP}
=
c_{12}s_{12}c_{23}s_{23}c_{13}^2s_{13}\sin\delta_{CP}
=
-0.0268414194.
$$

*Proof.* Use the unrounded upstream angle outputs
$$
(\theta_{12},\theta_{23},\theta_{13},\delta_{CP})
=
(33.69735528^\circ,47.36340764^\circ,8.65607149^\circ,232.5^\circ).
$$
They give
$$
c_{12}s_{12}c_{23}s_{23}c_{13}^2s_{13}
=0.0338328687127,
$$
and
$$
\sin\delta_{CP}
=\sin(232.5^\circ)
=-0.793353340291.
$$
Therefore
$$
\boxed{J_{CP}=-0.0268414194049}.
$$
Using the displayed comparison value $-0.030\pm0.010$, the diagonal standardized residual is
$$
\frac{-0.0268414194-(-0.030)}{0.010}
=+0.315858\ldots,
$$
which rounds to $+0.32\sigma$. This comparison is subject to the likelihood and covariance caveat of Section T.24.26. ∎

-----

## Part VI: Majorana Sector

### T.24.24 Majorana Phases

**Proposition T.24.24** (Majorana-phase assignment used in the leptonic model). *The working Majorana-phase assignment in the present Berry-phase model is*
$$
\alpha_{21}=0,\qquad \alpha_{31}=\pi.
$$

*Justification.* This assignment implements the model choice that generations 1 and 2 have the same CP parity while generation 3 carries the opposite parity. It is the phase convention used in the subsequent neutrinoless-double-beta-decay estimate, not an independently derived theorem of the previous sections.

### T.24.25 Effective Majorana Mass

**Theorem T.24.25 (Effective Majorana Mass).** Under the phase assignment of Proposition T.24.24,
$$
m_{\beta\beta}
=\left|
m_1c_{12}^2c_{13}^2
+m_2s_{12}^2c_{13}^2e^{i\alpha_{21}}
+m_3s_{13}^2e^{i(\alpha_{31}-2\delta)}
\right|.
$$
Using the internally normalized masses, the unrounded angle outputs $\theta_{12}=33.69735528^\circ$ and $\theta_{13}=8.65607149^\circ$, the assignment $\alpha_{21}=0$, $\alpha_{31}=\pi$, and the existing branch value $\delta=232.5^\circ$ gives
$$
\boxed{m_{\beta\beta}=1.71723393\,\mathrm{meV}}.
$$
This value is conditional on the Majorana-phase assignment and the internal absolute-scale branch.

*Proof.* With the unrounded masses of Theorem T.24.15, the three summand magnitudes are
$$
m_1c_{12}^2c_{13}^2=0.09669449\,\mathrm{meV},
$$
$$
m_2s_{12}^2c_{13}^2=1.37372185\,\mathrm{meV},
$$
$$
m_3s_{13}^2=0.58462408\,\mathrm{meV}.
$$
The first two phases vanish, while
$$
\alpha_{31}-2\delta
=180^\circ-465^\circ
=-285^\circ
\equiv75^\circ\pmod{360^\circ}.
$$
Consequently
$$
\operatorname{Re}z
=0.09669449+1.37372185+0.58462408\cos75^\circ
=1.62172819\,\mathrm{meV},
$$
$$
\operatorname{Im}z
=0.58462408\sin75^\circ
=0.56470350\,\mathrm{meV}.
$$
Thus
$$
m_{\beta\beta}
=\sqrt{(1.62172819)^2+(0.56470350)^2}\,\mathrm{meV}
=1.71723393\,\mathrm{meV}.
$$
∎

-----

## Part VII: Summary and Predictions

The neutrino branch gives a normal mass ordering, three mixing angles, a phase, and two laboratory mass combinations once its labels and calibrations are fixed. Its ratio structure is more successful than its internally normalized mass splittings, so the final tables keep those outcomes separate.

### T.24.26 Complete Parameter Table

**Table T.24.4**

|Parameter |Model value |Comparison value |Diagnostic |Status |
|:--------------------------------|:------------------------|:-------------------------------------|:-----|:---------|
|Mass hierarchy |Normal |Pending |— |Conditional branch output; T.79 certificate open|
|$M_R$ (seesaw scale) |$1.5\times10^{15}$ GeV |$(10^{14}-10^{16})$ GeV |Range comparison |Conditional scale calibration|
|$m_3$|25.809938 meV|—|—|Conditional branch output|
|$m_2$|4.566325 meV|—|—|Conditional branch output|
|$m_1$|0.142931 meV|—|—|Conditional branch output|
|$\Delta m^2_{21}$|$2.08309\times10^{-5}$ eV²|$(7.53\pm0.18)\times10^{-5}$ eV²|Not matched|Conditional branch output|
|$\Delta m^2_{31}$|$6.66132\times10^{-4}$ eV²|$(2.453\pm0.033)\times10^{-3}$ eV²|Not matched|Conditional branch output|
|$\Delta m^2_{31}/\Delta m^2_{21}$|31.9781|$32.6\pm0.7$|Diagonal residual only|Conditional ratio|
|$\theta_{23}$ |47.4° |$48.33^{+0.87}_{-1.21}$° |Diagonal residual only|Conditional calibrated model|
|$\sin^2\theta_{23}$ |0.542 |$0.558^{+0.015}_{-0.021}$ |Diagonal residual only|Conditional calibrated model|
|$\theta_{12}$ |33.7° |33.6° ± 0.8° |Diagonal residual only|Conditional calibrated model|
|$\sin^2\theta_{12}$ |0.308 |0.307 ± 0.013 |Diagonal residual only|Conditional calibrated model|
|$\theta_{13}$ |8.7° |8.54° ± 0.12° |Diagonal residual only|Conditional calibrated model|
|$\sin^2\theta_{13}$ |0.0226 |0.0220 ± 0.0007 |Diagonal residual only|Conditional calibrated model|
|$\delta_{CP}$ |232.5° |230° ± 36° |Diagonal residual only|Conditional holonomy model|
|$J_{CP}$ |$-0.0268414$ |−0.030 ± 0.010 |Diagonal residual only|Conditional mixing/phase model|
|$\sum m_\nu$|0.030519194 eV|<0.12 eV|Bound comparison|Conditional branch output|
|$m_\beta$|4.62340 meV|—|—|Conditional branch output|
|$m_{\beta\beta}$|1.71723 meV|<50 meV|Bound comparison|Conditional Majorana-phase model|

**Statistical Summary:** The displayed standardized residual sum is a diagonal, correlation-ignoring diagnostic. It is not an inferential $\chi^2$ statistic, and no degrees-of-freedom claim is made, unless a predeclared row set, joint likelihood, covariance matrix, theory-error model, fitted-parameter count, and profiling rule are supplied.

-----

### T.24.27 Dependency and Calibration Ledger

Root-system realizability, physical label selection, hierarchy coefficients, seesaw normalization, mixing transport, CP phases, RG matching, and uncertainty intervals are distinct entries. No chain may mark a downstream observable derived while an upstream entry is selected from the same data.



The flavor calculation has the following conditional dependency ledger:

**Structural branch:**
$$
K_0=3
\to d_0=8
\to(a,b)=(2,6)
\to M=24.
$$
The equalities use the minimal Hilbert-carrier, active-kernel, and QFI-interface branches cited above.

**Response branch:** The assignments $\sigma_B^2=1/24$, $\alpha_{UV}=3/2$, $u=1/\sqrt3$, and $\alpha_{IR}=1.418$ additionally require the packet-width, Schur, angular-profile, and sinc-response models.

**Label branch:**
$$
T_\ell=(2,6,4),
\qquad
T_\nu=(2,6,6)
$$
are registered Dirac and Majorana triads. Code and root geometry establish realizability or compatibility; physical label selection is independent branch data. Effective Proposition T.24.9 selects the neutrino triad only within its declared alignment-cost model.

**Scale and spectrum branch:** The values $\kappa_R=9$, $M_R=1.5\times10^{15}\,\mathrm{GeV}$, the three neutrino masses, and their splittings require the seesaw normalization, matching-scale, mixing, phase, scheme, and remainder entries of the T.79 flavor certificate.

|Fermion type |Registered triad |Formula |Status |
|:----------------------|:----------|:-----------|:-----------------------------------------------------------------------|
|Charged leptons (Dirac)|$(2,6,4)$|$(a,b,2a)$|Geometrically realizable model label; not selected by error correction alone|
|Neutrinos (Majorana)|$(2,6,6)$|$(a,b,b)$|Conditional symmetric-bilinear and alignment-cost branch|

No numerical flavor observable in this chain is a consequence of $K_0=3$ alone. Theorem-level numerical promotion requires closure of the corresponding T.79 certificate row before comparison with data.

The Majorana structure introduces four geometric factors absent in the Dirac sector:

|Factor |Theorem|Effect |Quantity Affected |
|:-----------------------|:------|:-------------------------------------------------|:------------------|
|A₂ replaces D₄ |T.24.5 |$d^2_{21}: 2a \to b$ |Triad structure |
|SU(2) triplet projection|T.24.12|$\alpha_\nu = \alpha_{\text{UV}}/\sqrt{3}$ |Mass hierarchy |
|Seesaw from $E_8$ distance |T.24.13|$\kappa_R = \alpha_{\text{UV}} \cdot d^2_{31} = 9$|Absolute mass scale|
|Spin-1 Berry phase |T.24.22|$+75°$ |$\delta_{CP}$ |

-----

### T.24.28 Open Input Inventory

**Proposition T.24.28** (Input inventory for the neutrino sector). *The neutrino sector uses no continuously fitted parameters within the adopted model once the following inputs are fixed:* the PU discrete data $(d_0,a,M)$, the canonical Bures/Fisher normalization with unit-radius convention, the type-I seesaw identification, the Majorana-instanton ansatz for $M_R$, and the Berry-loop prescriptions used for the PMNS angles and phase.

*Summary.* Under those assumptions, the neutrino masses, orderings, and mixing observables are determined without further continuous fitting inside the model.

-----

### T.24.29 Forward Validation Conditions

Before testing, register the charged and neutrino triads, every continuous coefficient, the seesaw and RG maps, the likelihood and covariance, and all remainder intervals. Outcomes not used for calibration may then falsify the registered model when they fall outside its propagated interval.

---



**Primary Prediction:** Normal Hierarchy ($\Delta m^2_{31} > 0$)

Falsified if: Inverted Hierarchy confirmed at > 5σ significance.

**Secondary Predictions:**

|Observable |Prediction|3σ Range |Falsification |
|:------------------|:---------|:------------------------------------|:-------------------------------------------|
|$\sin^2\theta_{23}$|$0.5412$|$0.478$–$0.604$|Falsified if the measured value lies outside this range at $>3\sigma$; the branch value currently lies inside it|
|$\delta_{CP}$|$232.5^\circ$|$160^\circ$–$305^\circ$|Falsified if the measured value lies outside this range at $>3\sigma$; the branch value currently lies inside it|
|$\sum m_\nu$|$0.0305192\,\mathrm{eV}$|$<0.10\,\mathrm{eV}$|Conditional absolute-scale projection, falsified by an established $\sum m_\nu>0.10\,\mathrm{eV}$; the internal splittings remain nonclosing|
|$m_{\beta\beta}$|$1.71723\,\mathrm{meV}$|$<10\,\mathrm{meV}$|Conditional Majorana-phase output, falsified by a confirmed $m_{\beta\beta}$ signal at LEGEND-1000 or nEXO sensitivity|
**Experimental Timeline:**

|Experiment |Years |Sensitivity |
|:---------------|:--------|:---------------------------------------|
|JUNO |2025–2031|3σ hierarchy determination |
|DUNE |2030–2042|5σ hierarchy (≤3 yr) + CP phase (≈10 yr)|
|Hyper-Kamiokande|2027–2035|5σ hierarchy + CP phase |
|LEGEND-1000 |2030+ |$m_{\beta\beta}$ sensitivity to 9–21 meV|
|nEXO |2030+ |$m_{\beta\beta}$ sensitivity to ≲ 8 meV |

# Section T.25: Fermion Mass Hierarchy from $E_8$ Geometry

## T.25.1 Conditional Flavor-Model Status

This section compares fermion data with a geometric hierarchy model. The distance triads, sector prefactors, $\alpha_{IR}$, $\beta_{geom}$, effective dimensions, matching maps, and remainders must be fixed before a forward comparison. Arithmetic evaluation after those choices is deterministic, but the full parameter set is not derived from $K_0=3$.

## T.25.2 Input and Certificate Ledger

| Entry | Status |
|:--|:--|
| $(d_0,a,b,M)$ | minimal discrete branch |
| generation count | anomaly/CP branch |
| fermion-to-root labels and triads | calibration candidates pending a forward selector |
| $\alpha_{IR}$ | model/calibration entry on the declared transport branch |
| $\beta_{geom}$ and $D_{eff}$ | model inputs under T.42.2 and T.42.5 |
| sector prefactors | branch inputs with their gauge/Bures certificates |
| RG and threshold maps | scheme-dependent computations |
| sixth-order and mapping remainders | open certificate intervals |

No precision or zero-parameter claim is valid until the corresponding row is closed independently of the comparison data.



This section consolidates conditional fermion-mass comparisons from the geometric hierarchy model on $\mathrm{Gr}(2,8)$. The structural value $K_0=3$ supplies the upstream minimal-branch ledger; the hierarchy-response ansatz separately connects registered $E_8$ root distances to mass ratios through $\alpha_{\mathrm{IR}}$, built from $\alpha_{\mathrm{UV}}=3/2$ and the declared sinc factor.

The primary result is the mass hierarchy formula (Theorem T.39):

$$\ln\left(\frac{m_j}{m_i}\right) = \alpha_{\text{IR}} \cdot d^2_{E_8}(r_i, r_j)$$

where $d^2_{E_8} \in \{2, 4, 6, 8\}$ are squared distances between $E_8$ roots representing fermion generations.

-----

## T.25.2.1 Derived Parameters

The structural backbone traces to $K_0=3$ through its stated branch gates; response, flavor, threshold, and remainder entries retain their independent model or certificate status:

$$K_0 = 3 \xrightarrow{\text{Thm 23}} d_0 = 8 \xrightarrow{\text{Thm Z.1}} (a,b) = (2,6) \xrightarrow{\text{Thm Z.5}} M = 24$$

|Parameter |Value |Derivation |Reference |
|:-------------------|:-----|:------------------------------------------|:----------------|
|$K_0$ |3 |Self-reference minimum |Theorem 15 |
|$N_{\mathrm{vis}}^{\min}$ |8 |$2^{K_0}$ |Theorem 15 |
|$d_0$ |8 |$d_0=N_{\mathrm{vis}}^{\min}$ on the minimal Hilbert-carrier branch |Theorem 23; Theorem Z.2 |
|$a$ |2 |Landauer partition (see Theorem Z.1) |Theorem Z.1 |
|$b$ |6 |$d_0 - a$ |Definition |
|$M$ |24 |$2ab$ |Theorem Z.5 |
|$N_g$ |3 |Anomaly+CP minimality with additive-monotone family-count selection |Theorem R.3.4; Proposition R.3.5.1a|
|$\sigma^2_B$ |$1/24$|Capacity saturation |Lemma T.41.2 |
|$\alpha_{\text{UV}}$|$3/2$ |$1/(16\sigma^2_B)$ |Corollary T.41.3 |
|$f_{\text{sinc}}$ |0.9454|$\sin(u)/u$, $u = 1/\sqrt{N_g}$ |Theorem T.24.2.1 |
|$\alpha_{\text{IR}}$|1.418 |$\alpha_{\text{UV}} \times f_{\text{sinc}}$|Theorem T.24.2.1 |

On the generation–internal tensor-factor and unit-total-generation-variance branches of Theorem T.54.2, the angular width is $u=1/\sqrt{N_g}=1/\sqrt3$. Uniform coherent averaging then gives the visibility factor of Theorem T.55,

$$f_{\text{sinc}} = \frac{\sin(1/\sqrt{3})}{1/\sqrt{3}} = \frac{0.5458}{0.5774} = 0.9454.$$

The hierarchy-exponent relation is the independently registered ansatz of Theorem T.24.2.1:

$$\alpha_{\text{IR}} := \frac{3}{2} \times 0.9454 = 1.418.$$

-----

## T.25.3 Candidate $E_8$ Generation Triads

### T.25.3.1 Calibration Status

The displayed sector triads are admissible root triples chosen during model development. Neither PCE nor error correction currently supplies a data-independent unique selector.

### T.25.3.2 Realizability Witnesses

Explicit roots certify that each candidate distance matrix occurs in $E_8$. They do not certify the mapping from physical generations to those roots.

### T.25.3.3 Geometry and Response Separation

Lattice angles and distances are geometric inputs. Turning them into masses or mixing observables requires the separately registered response functions and scale bridges.



### T.25.3.4 Triad Assignments

The registered model assignments use the following $E_8$ root triads for each fermion sector:

|Sector |$(d^2_{32}, d^2_{31}, d^2_{21})$|$\mathcal{R} = d^2_{31}/d^2_{32}$|
|:---------------|:-------------------------------|:--------------------------------|
|Charged leptons |$(2, 6, 4)$ |3 |
|Down-type quarks|$(2, 4, 6)$ |2 |
|Up-type quarks |$(4, 8, 4)$ |2 |

The indices denote generations: 3 (heaviest), 2 (middle), 1 (lightest).

### T.25.3.5 Explicit Root Vectors

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

### T.25.3.6 Lattice Geometry

**Summary of Lemma T.44a** ($E_8$ Lattice Angles). The angle $\theta$ between $E_8$ roots with squared distance $d^2$ satisfies:

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

### T.25.4.1 Leading-Order Ratio Diagnostic

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

**Conditional fourth-order model comparison.** Adopt $\alpha_{IR}$, $\beta_{geom}=1/144$, and the two $D_{eff}$ values as forward-locked model entries. Denote the adjacent-edge outputs by
$$
(L_{32},L_{21}):=(2.8212,5.3306).
$$
Exact path addition then sets $L_{31}:=L_{32}+L_{21}=8.1518$.
Thus the conditional ratio invariant is $R_\ell=8.1518/2.8212\approx2.889$. The agreement with the quoted observed value is descriptive model validation. It does not establish the overlap coefficient, the effective-dimension assignment, or a controlled uncertainty interval. The value $0.005$ is a model allowance until T.25.10's remainder certificate is supplied.

### T.25.4.2 Individual Logarithmic Ratios

| Ratio | Declared geometry input | Conditional model output |
|:--|:--|:--|
| $\ln(m_\tau/m_\mu)$ | $d^2=2$ | $2.8212$ |
| $\ln(m_\mu/m_e)$ | $d^2=4$ | $5.3306$ |
| $\ln(m_\tau/m_e)$ | adjacent-edge path sum | $8.1518$ |

The last row is not an independent prediction: it is fixed exactly by path additivity. No truncation-error bar is asserted without the missing sixth-order bound.



**Numerical Comparison (curvature-corrected):**

|Ratio |Predicted |Observed|Deviation |
|--------|-----------------|--------|----------|
|$R_\ell$|$2.889 \pm 0.002$|$2.889$ |consistent|

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

A precision test of the quark sector requires running all masses to a common $\overline{\text{MS}}$ scale $\mu_{\text{ref}}$ using a consistent protocol. This section uses the paper-wide T1/T2/T3 protocol of Convention P.14.1c; every other appendix reporting a T1/T2/T3 budget (Sections T.19.1, T.25.6a.11, the Appendix H.4.3.1 budget for $g_0$, Appendix U vacuum budgets, the Appendix Y baryogenesis budget, the Appendix Z fine-structure budget, and the map.md predictions and assumptions tables) uses the same three categories.

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
where T1 includes PU truncation and any geometric-approximation truncation used to evaluate geodesic inputs, T2 includes vacuum/regularization dependence when a frustration strain field is computed, and T3 includes scheme/mapping systematics from this protocol and any discrete identification ambiguity (triad assignment and generation labeling). For the down-sector frustration correction, the additional T1/T2/T3 terms are given in Section T.25.6a.11.

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

$$
\mathcal R_u(M_Z)
=
\frac{\ln(m_t/m_u)}{\ln(m_t/m_c)}
=
\frac{11.7673}{5.56871}
=
2.1131\pm0.0142,
$$

$$
\mathcal R_d(M_Z)
=
\frac{\ln(m_b/m_d)}{\ln(m_b/m_s)}
=
\frac{6.94360}{3.95520}
=
1.7556\pm0.0131,
$$
where the uncertainties use first-order propagation and treat the displayed mass errors as independent.

This confirms that the residual discrepancy in $\mathcal{R}_d$ is not removed by eliminating scale mixing; any resolution must therefore be sector-specific and compatible with a common-scheme comparison.

The up-sector deviation of $+5.5%$ is a model-comparison residual. Section T.21.8 does not supply a derived quark-sector correction or certified remainder; explaining this deviation requires a separately fixed coefficient, effective-dimension assignment, threshold map, and uncertainty ledger.



The down-sector deviation of $-12.4%$ persists under common-scale comparison and motivates a sector-specific correction tied to the $A_2/D_4$ asymmetry of the down-sector triads. Section T.25.6a records a conditional response ansatz. Its overlap and uncertainty certificates remain open.



### T.25.5.5 Conditional Same-Scale Quark Evaluation

A same-scale quark comparison first requires one renormalization scheme, threshold ledger, preregistered triad, and the coefficient/effective-dimension/remainder data of Theorem T.42.8. Denote the resulting baseline by $\mathcal R_f^{(0)}$.

A down-sector factor such as
$$
\frac{1-\Phi_{31}^{(d)}}{1-\Phi_{32}^{(d)}}
$$
is an additional model response. Its numerical value is not derived from the observed hierarchy or from $D_{eff}$. It becomes predictive only after the overlap functional and its uncertainty are fixed before comparison.



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

### T.25.6a Conditional Down-Sector Frustration Ansatz

#### T.25.6a.10 Open Uncertainty Ledger

A valid interval must include truncation, overlap-functional, vacuum-selection, scheme, threshold, and generation-label uncertainty. No numerical precision claim is made before those intervals are registered.



The down-quark sector is distinguished by its $1\leftrightarrow 2$ transition angle $\theta_{21,d}=120^\circ=2\pi/3$ (Section T.25.3.6), whereas the up-quark and charged-lepton sectors have $\theta_{21}=\pi/2$. This $A_2$ (hexagonal) mismatch induces a frustration strain on the generation manifold that modifies the relative suppression exponents along the $3\leftrightarrow 1$ and $3\leftrightarrow 2$ geodesic paths, and hence modifies the down-sector hierarchy invariant under same-scale comparison.

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

**Lemma T.25.6a.4 (Explicit overlap calculation for down quarks).** Using the down-quark $E_8$ root vectors from Section T.25.3.5:
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
\mathcal{R}_d^{\text{pred}}=\frac{211}{120}\approx1.75833.
$$

**Remark T.25.6a.8: Interpretation of $s_b$ and $N_g$.** The screening factor $s_b=b/(b+1)$ encodes the stipulated competition between one frustrated edge direction and $b$ inactive relaxation directions in this strain model. The value $N_g=3$ is imported from the completed Appendix R family-selection branch; it is not fixed by $(a,b)=(2,6)$ alone. Consequently, the displayed correction is conditional on both the strain-response model and the accepted family-count objective.

**Remark T.25.6a.9: Connection to Cabibbo mixing.** The same $A_2/D_4$ mismatch that shifts $\mathcal{R}_d$ also determines the Cabibbo angle via the vacuum position $\theta_{\text{vac}}=105.15^\circ$ (Section T.25.6.1). Both effects arise from a single geometric source: incompatibility between hexagonal (down) and cubic (up) lattice structures in the $1\leftrightarrow 2$ sector.


#### T.25.6a.11 Uncertainty budget for the frustration correction (T1/T2/T3)

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

### T.25.6.1 Vacuum-Frustration Model Boundary

A vacuum angle follows only from a specified potential, domain, measure, minimizer-selection rule, and stability certificate. Choosing stiffness data to reproduce a desired angle is calibration.

### T.25.6.2 Cabibbo Calibration Boundary

A Cabibbo value becomes a forward prediction only after the joint map from the frustration variables to the CKM observable is fixed without using that value.

### T.25.6.3 Sensitivity Protocol

Report the full dependence on stiffness, triad, threshold, and overlap inputs together with their intervals. Close numerical agreement at one calibrated point does not establish emergence or uniqueness.



**Summary (Geometric Frustration).** *The vacuum position minimizes elastic energy from incompatible lattice constraints:*

$$\theta_{\text{vac}} = \frac{\kappa_u \theta_u + \kappa_d \theta_d}{\kappa_u + \kappa_d}$$

*where $\kappa_f$ is the sector stiffness.*

Theorem T.38 gives $c_d/c_u\approx1.02$, hence $(c_d/c_u)^2\approx1.0404$. The numerical row below instead uses the independent stiffness input $\kappa_d/\kappa_u=1.02$, corresponding to $c_d/c_u\approx\sqrt{1.02}=1.00995$. With $\theta_u = 90°$ (from $d^2_{21,u} = 4$) and $\theta_d = 120°$ (from $d^2_{21,d} = 6$):

$$\theta_{\text{vac}} = \frac{90° + 1.02 \times 120°}{2.02} = \frac{212.4°}{2.02} = 105.15°$$

The frustration angle is:

$$\theta_{\text{frustration}} = \theta_{\text{vac}} - \theta_u = 15.15°$$

### T.25.6.4 Cabibbo Angle Prediction

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
| $\vert V_{us}\vert$ | 0.2261 | $0.22501\pm0.00068$ | 0.5% |

### T.25.6.5 Sensitivity to Stiffness Ratio

The branch value $\vert V_{us}\vert$ depends on $\kappa_d/\kappa_u$. The following table is an input scan over $c_d/c_u\in[1.00,1.02]$ with $\kappa_d/\kappa_u=(c_d/c_u)^2$. Theorem T.38 gives $c_d/c_u\approx1.025$ and therefore $\kappa_d/\kappa_u\approx1.050$; it does not select the middle row.

| $c_d/c_u$ | $\kappa_d/\kappa_u$ | $\theta_{\text{vac}}$ | $\theta_{\text{frustration}}$ | $\lvert V_{us}\rvert$ |
|:---------:|:-------------------:|:---------------------:|:-----------------------------:|:----------:|
| 1.00 | 1.00 | 105.00° | 15.00° | 0.2241 |
| 1.01 | 1.02 | 105.15° | 15.15° | 0.2261 |
| 1.02 | 1.04 | 105.29° | 15.29° | 0.2280 |

The independently registered $\kappa_d/\kappa_u=1.02$ row gives $\vert V_{us}\vert=0.2261$, $0.48\%$ above the quoted comparison value. This is a calibration-level branch comparison until the stiffness map is independently determined without using $\vert V_{us}\vert$.

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

## T.25.8 Conditional Status Summary

The flavor program currently contains conditional ratio models, calibrated mixing results, and open absolute normalizations. Its present precision claims cover named ratios and diagnostic comparisons.

### T.25.8.1 Certificate Status Table

| Sector | Current status |
|:--|:--|
| charged-lepton ratios | conditional fourth-order model; coefficient, $D_{eff}$, and remainder certificates open |
| absolute lepton scale | normalization-ledger gated |
| quark ratios | retrospective triad calibration plus scheme/threshold and frustration-model inputs |
| mixing observables | separate holonomy/frustration model branches |

### T.25.8.2 Open Continuous and Discrete Inputs

The open inputs include root-label selection, continuous response coefficients, effective dimensions, threshold maps, and remainder intervals. Consequently none of the flavor rows is presently a zero-adjustable-parameter theorem.



### T.25.8.3 Precision Tests

|Test |Prediction|Observation |Deviation|Status |
|:-----------------------|:--------:|:---------------:|:-------:|:----------------------------------:|
|$m_\tau$ |$\approx 0.94$ GeV (LO); 1776.86 MeV (anchored ⊘) |1.77686 GeV |factor $\approx 1.9$ (LO); 0% (anchored) |⚠ (LO normalization open; Remark T.45.1)|
|$m_\mu$ |105.78 MeV (anchored to $m_\tau^{\rm obs}$) |105.65838 MeV |0.12% |✓ (ratio test; Lemma T.45.1a) |
|Lepton $\mathcal{R}$ |3.000 |2.889 |3.7% |✓ |
|$\ln(m_\tau/m_\mu)$ |2.8212 |2.8224 |$\approx 0.04\%$ |✓ |
|$\vert V_{us}\vert$ |0.2261 |0.22501 |0.5% |✓ |
|Up quark $\mathcal{R}$ |2.11 |$2.111 \pm 0.007$|**0.0%** |✓ |
|Down quark $\mathcal{R}$|1.758 |$1.752 \pm 0.007$|**0.3%** |✓ |

The quark-sector entries are same-scale hierarchy invariants under a common-scheme reduction (Section T.25.5.4). The down-sector value includes the $A_2/D_4$ frustration correction (Section T.25.6a) with its matching uncertainty budget (Section T.25.6a.11).

The τ/μ log ratio agrees at approximately $0.04\%$ ($|\Delta\ln|=0.0012$) after the registered triad, coefficient, effective-dimension, and remainder inputs are fixed. Its registered status is a conditional geometric-hierarchy model comparison.

### T.25.8.4 Parameter Count

|Sector |Parameter status|Notes |
|:------------|:-------------:|:------------------------|
|Lepton ratios|Registered model inputs; certificates open|Triad, coefficient, effective-dimension, and remainder records |
|Cabibbo angle|Registered model inputs; forward validation open|Frustration geometry and stiffness/response records|
|Quark ratios |Registered retrospective inputs; certificates open|Triad, scheme, threshold, frustration, and remainder records |

-----

## T.25.9 Forward Validation Conditions

A flavor-model test must preregister:

1. the candidate triads and their selection rule;
2. all continuous coefficients and effective-dimension functions;
3. the renormalization and threshold convention;
4. overlap, frustration, and normalization maps;
5. a nonzero certified remainder interval; and
6. which observations are calibration data and which are held out.

Failure on held-out data outside the propagated interval rejects that registered model. Retrospective agreement cannot certify the selector or convert an open input into a theorem.



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

## T.25.10 Higher-Order Corrections: Open Remainder Certificate

The charged-lepton hierarchy branch uses the phenomenological $D_{eff}$ assignments of Theorem T.42.5 and the model coefficient of Theorem T.42.2. No Golay decoding threshold is inferred. The inequality $d^2/M\le1/6$ is only a small dimensionless ratio; without a bound on the next coefficient, derivatives, or analytic remainder it does not imply $|\Delta\ln|\lesssim0.005$.

A quantitative truncation interval must therefore be supplied by the registered normalized-overlap or effective-action certificate. Until then, $0.005$ may be used only as a labeled model allowance, not as a controlled mathematical error bound.



The declared PU Yukawa model uses a curvature/Van-Vleck expansion on $\text{Gr}(2,8)$ in the small parameter $u^2=\sigma_B^2=1/24$:

$$\ln\left(\frac{m_j}{m_i}\right) = \alpha_{IR} d^2_{ij} + \alpha_2(d_{ij}) d^4_{ij} + \mathcal{O}(d^6)$$

where $\alpha_2(d_{ij})$ is computed from the same Bures-geometry inputs used elsewhere in Appendix T. The full derivation appears in Section T.21.8: the Van Vleck–Morette determinant (Lemma T.42.1a) combined with the effective curvature $K_{\text{eff}} = 2$ (Theorem Z.24) yields the geometric coefficient $\beta_{\text{geom}} = 1/144$ (Theorem T.42.2).

For the charged-lepton triad, Theorem T.42.5's two branch assignments use $D_{\text{eff}}=3/8$ at $d^2=2$ and $D_{\text{eff}}=13/6$ at $d^2=4$, producing:

$$\ln(m_\tau/m_\mu) = 2.8212, \quad \ln(m_\mu/m_e) = 5.3306, \quad \ln(m_\tau/m_e) = 8.1518$$

|Ratio |Leading (Gaussian)|Curvature-corrected|Observed|Deviation|
|:------------------|:----------------:|:-----------------:|:------:|:-------:|
|$\ln(m_\tau/m_\mu)$|2.836 |2.8212 |2.8224 |−0.04% |
|$\ln(m_\mu/m_e)$ |5.672 |5.3306 |5.3316 |−0.02% |
|$\ln(m_\tau/m_e)$ |8.508 |8.1518 |8.1540 |−0.03% |
|$R_\ell$ |3.000 |2.889 |2.889 |exact |

**Model allowance / uncertainty.** With $M=24$ and $d^2\in\{2,4\}$ for the charged-lepton links, the ratio $d^2/M\le1/6$ motivates the displayed truncation scale. Pending the registered remainder certificate for the next coefficient or analytic remainder, $0.005$ is the labeled T1 model allowance for a single charged-lepton logarithm.

## T.26 Flag-Lift Threshold Compression and Parameter Rigidity

### T.26.1 Isotypic Decomposition of the Lifted Threshold Operator

**Theorem T.67 (Flag-Lift Threshold Compression).** Let $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$ be the minimal flag lift (Definition T.17a), let $H:=U(1)\times U(2)\times U(3)$ be the decomposition-preserving compact symmetry group, and let $U:H\to\mathcal U(\mathcal H_{\mathrm{thr}})$ be the unitary threshold-space representation. Let $\mathsf L$ be a densely defined self-adjoint operator whose spectral projections commute with every $U(h)$. Then:

(a) $\mathcal H_{\mathrm{thr}}$ admits the Hilbert isotypic decomposition
$$
\mathcal H_{\mathrm{thr}}
\cong
\widehat\bigoplus_{\lambda\in\widehat H}V_\lambda\otimes M_\lambda.
$$

(b) On each isotypic block, $\mathsf L$ has the form
$$
\mathsf L|_{V_\lambda\otimes M_\lambda}
=I_{V_\lambda}\otimes B_\lambda,
$$
where $B_\lambda$ is a unique self-adjoint operator on $M_\lambda$. If $M_\lambda$ is finite-dimensional, $B_\lambda$ is a Hermitian matrix.

(c) On the three retained Standard-Model gauge sectors, all threshold information entering gauge matching reduces to the corresponding multiplicity operators $B_1,B_2,B_3$.

(d) If $0<\dim M_i<\infty$ and matching depends only on sector-averaged thresholds, the lifted data reduce to
$$
\Delta_i:=\frac1{\dim M_i}\operatorname{Tr}(B_i),
\qquad i=1,2,3.
$$

(e) An isotropic shift $\mathsf L\mapsto\mathsf L+\delta_{\mathrm{avg}}I$ sends every finite-sector average to $\Delta_i+\delta_{\mathrm{avg}}$ and therefore changes only the common coupling offset.

*Proof.* The compact-group decomposition theorem of Peter and Weyl (1927) applies because $H$ is compact and $U$ is unitary, giving the Hilbert direct sum in (a). Commutation of all spectral projections with $U(H)$ makes every isotypic summand reducing for $\mathsf L$. On $V_\lambda\otimes M_\lambda$, the commutant of the irreducible $H$-action on $V_\lambda$ is $I_{V_\lambda}\otimes\mathcal B(M_\lambda)$ by Schur's lemma [Fulton & Harris 1991]; its hypotheses hold because $V_\lambda$ is a finite-dimensional complex irreducible representation. Applying this statement to the resolvent $(\mathsf L-iI)^{-1}$ yields a unique bounded resolvent on $M_\lambda$, hence a unique self-adjoint block operator $B_\lambda$. In finite multiplicity it is a Hermitian matrix. This proves (a) and (b).

Part (c) is the restriction of (b) to the three retained sector labels. Under the finite-dimensional hypothesis of (d), the normalized trace is defined and is the stated sector average. Finally,
$$
I_{V_i}\otimes B_i+\delta_{\mathrm{avg}}I_{V_i\otimes M_i}
=I_{V_i}\otimes(B_i+\delta_{\mathrm{avg}}I_{M_i}),
$$
so
$$
\frac1{\dim M_i}\operatorname{Tr}(B_i+\delta_{\mathrm{avg}}I_{M_i})
=\Delta_i+\delta_{\mathrm{avg}},
$$
which proves (e). ∎

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

*Proof.* Write $G=SU(8)$. A square-integrable section of $E_{s,\pm}=G\times_HV_{s,\pm}$ is represented by a measurable function $f:G\to V_{s,\pm}$ satisfying
$$
f(gh)=\tau_{s,\pm}(h)^{-1}f(g)
$$
for $h\in H$. The Peter--Weyl theorem (Peter and Weyl, 1927) applies because $G$ is compact and gives the Hilbert decomposition
$$
L^2(G)\cong\widehat\bigoplus_{\Lambda\in\widehat G}V_\Lambda\otimes V_\Lambda^*.
$$
Taking the $H$-equivariant part in the second factor gives
$$
L^2(G\times_HV_{s,\pm})
\cong
\widehat\bigoplus_{\Lambda\in\widehat G}
V_\Lambda\otimes\operatorname{Hom}_H(V_\Lambda,V_{s,\pm}).
$$
Each multiplicity space is finite-dimensional because both representations in the Hom space are finite-dimensional.

The spectral projections of the self-adjoint $G$-equivariant operator $D_{s,\pm}$ commute with the left $G$-action, so every isotypic summand is reducing. Schur's lemma [Fulton & Harris 1991] applies to the complex irreducible $G$-module $V_\Lambda$ and forces the restricted operator to have the form
$$
I_{V_\Lambda}\otimes B_{\Lambda,s,\pm}.
$$
Self-adjointness of $D_{s,\pm}$ makes each finite multiplicity operator $B_{\Lambda,s,\pm}$ Hermitian. Diagonalizing that finite Hermitian matrix shows that every one of its eigenvalues occurs in the full block with multiplicity $\dim V_\Lambda$. Taking the multiset union over $\Lambda$ proves the spectral statement. ∎

**Corollary T.68.1 (Threshold Functionals Reduce to Positive Block Sums).** Assume every sector/parity operator entering the canonical determinant is positive after a declared removal of its finite-dimensional zero-mode space. Let
$$
\nu_{\Lambda,s,\pm,a,j}>0
$$
be its nonzero block eigenvalues, counted with multiplicity. Then
$$
F_{s,\pm,a}
=
\left[
\sum_{\Lambda\in\widehat{SU(8)}}
(\dim V_\Lambda)
\sum_j'
\log(\nu_{\Lambda,s,\pm,a,j}/\mu_G^2)
\right]_{\mathrm{MS2}_{\mu_G}},
$$
where the prime omits the declared zero modes. Consequently
$$
F_s=\sum_{\pm,a}F_{s,\pm,a},
\qquad
\Delta=TF.
$$
A branch containing negative spectrum requires a specified spectral cut and phase convention.

*Proof.* Each $B_{\Lambda,s,\pm,a}$ is finite-dimensional and Hermitian. The finite-dimensional spectral theorem therefore supplies a unitary diagonalization with real eigenvalues. After the declared zero-mode removal, the positivity hypothesis leaves exactly the eigenvalues $\nu_{\Lambda,s,\pm,a,j}>0$, so every logarithm in the reduced determinant is real. The Peter--Weyl isotypic factor repeats each block spectrum $\dim V_\Lambda$ times. Linearity of the declared finite-part prescription yields $F_s=\sum_{\pm,a}F_{s,\pm,a}$, and the registered Dynkin-index map yields $\Delta=TF$. ∎

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

*Proof.* Theorem T.70.2 tests a scalar one-block parity closure against the canonical ordinary determinant. Its admissibility conditions require, first, an explicitly declared replacement by the parity-relative superdeterminant and, second, oriented sector data specified independently of the validation target. If either condition is absent, the one-block expression is not the canonical sector finite part. Theorem T.78 determines thresholds only from a completed flag-lift spectral tuple containing the operator, parity blocks, finite-part prescription, normalization map, and tail certificate. A scalar ratio formula lacking the two conditions of Theorem T.70.2 does not supply that tuple. Hence it remains a diagnostic ansatz until both conditions are proved and incorporated into a completed Theorem-T.78 record. ∎

## T.27 RG Rigidity and Yukawa Cancellation

**Theorem T.71 (RG Uniqueness Conditional on a Complete Boundary Record).** Fix a loop-order Standard Model RG system and a complete matching-scale input record in the sense of Theorem T.79.2. In particular, besides the threshold triplet $(\Delta_1,\Delta_2,\Delta_3)$ and flavor data, the record must contain every Higgs target-shift, PU-to-SM quartic matching, marginality, decoupling, RG-scheme, and pole-conversion datum used by the requested outputs. Assume that the resulting RG initial-value problem has a solution that remains in the smooth perturbative domain throughout the closed scale interval between the matching scale and every requested output scale. Then the low-energy observable vector is uniquely determined conditional on that record. The threshold triplet alone fixes only the gauge-matching coordinates and does not determine the Higgs or full Yukawa vector.

*Proof.* The completed spectral threshold record fixes $(\Delta_1,\Delta_2,\Delta_3)$ and hence the gauge-matching entries. The other components of the complete record fix the Higgs, flavor, decoupling, and observable-conversion boundary data. Put $t=\log\mu$; the RG equations become
$$
\frac{dX}{dt}=\beta(X).
$$
Let $X$ and $Y$ be two solutions with the same matching-scale value. At any point of the smooth perturbative domain, continuity of $D\beta$ supplies a ball on which $\lVert D\beta\rVert\le L$. The mean-value formula then gives
$$
\lVert\beta(X)-\beta(Y)\rVert\le L\lVert X-Y\rVert
$$
while both trajectories remain in that ball. With $z(t)=\lVert X(t)-Y(t)\rVert$ and $t\ge t_0$ in such an interval,
$$
z(t)\le L\int_{t_0}^{t}z(s)\,ds.
$$
Writing $F(t)=\int_{t_0}^{t}z(s)\,ds$ gives $F(t_0)=0$ and $F'(t)\le LF(t)$. Hence
$$
\frac{d}{dt}\bigl(e^{-Lt}F(t)\bigr)\le0.
$$
Because $F\ge0$ and $F(t_0)=0$, one has $F=0$ and therefore $X=Y$ on that interval. The same argument with reversed integration handles $t\le t_0$. The coincidence set is closed by continuity and open by this local argument; connectedness of the assumed scale interval makes it the whole interval. Thus the RG trajectory is unique wherever the assumed solution exists. The supplied decoupling and pole-conversion maps are deterministic, so they produce one output vector. If an independent boundary datum is omitted, the corresponding input coordinate is undetermined and lies outside this uniqueness conclusion. ∎

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

*Proof.* Exponentiating Equation (T.72.1) gives
$$
\frac{y_b}{y_a}
=\frac{D_b}{D_a}\exp[-\alpha(\ell_b-\ell_a)].
$$
Theorem T.73 gives
$$
\frac{D_b}{D_a}
=\frac{F(d_b^2)}{F(d_a^2)}.
$$
Substituting $\ell_a=d_a^2$, $\ell_b=d_b^2$, and $\alpha=3/2$ yields
$$
\frac{y_b}{y_a}
=\frac{F(d_b^2)}{F(d_a^2)}
\exp\!\left[\frac32(d_a^2-d_b^2)\right],
$$
which is the claimed formula. ∎

**Definition T.73.2** (Quillen-Van Vleck Flavor Normalization Certificate). A Quillen-Van Vleck flavor normalization certificate is a finite record
$$
\mathfrak Q_{\mathrm{fl}}
=
(\mathcal D_{\mathrm{fl}},\nabla_{\mathrm{Bures}},\|\tau_{\mathrm Q}\|,\Delta_{\mathrm{VVM}},Z_{\mathrm{EW/fl}},\mathcal A_{\mathrm{meas}},\mu_G)
\tag{T.73.2}
$$
where:

1. $\mathcal D_{\mathrm{fl}}$ is the branch-fixed elliptic flavor operator on the retained Grassmannian flavor bundle;

2. $\nabla_{\mathrm{Bures}}$ is the Bures/Kähler connection used to define the determinant line and coherent packets;

3. $\|\tau_{\mathrm Q}\|$ is the Quillen norm of the determinant-line torsion element associated with $\mathcal D_{\mathrm{fl}}$ at finite part scale $\mu_G$;

4. $\Delta_{\mathrm{VVM}}$ is the Van Vleck-Morette determinant factor for the generation-to-Higgs geodesic packet;

5. $Z_{\mathrm{EW/fl}}$ is the electroweak/flavor threshold matching factor supplied by the completed threshold branch;

6. $\mathcal A_{\mathrm{meas}}$ is the finite measure normalization of the retained coherent packet.

The certificate is accepted only if all factors are fixed before using charged-lepton, quark, CKM, or PMNS validation data.

**Theorem T.73.3** (Absolute Flavor Normalization from a Quillen-Van Vleck Certificate). On a branch carrying an accepted certificate $\mathfrak Q_{\mathrm{fl}}$, the universal flavor normalization in Theorem T.72 is fixed by
$$
\mathcal N_{\mathrm{PU}}^{\mathrm{fl}}
=
\|\tau_{\mathrm Q}\|\,
\Delta_{\mathrm{VVM}}^{1/2}\,
Z_{\mathrm{EW/fl}}\,
\mathcal A_{\mathrm{meas}}.
\tag{T.73.3}
$$
The absolute Yukawa values are then forward branch outputs:
$$
y_{f,a}(\mu_G)
=
\mathcal N_{\mathrm{PU}}^{\mathrm{fl}}\,
c_f\,
D_{f,a}\,
e^{-\alpha\ell_{f,a}}.
\tag{T.73.4}
$$
Without an accepted certificate, intrasector ratios remain governed by Theorem T.72, but the absolute charged-lepton anchor remains open.

*Proof.* Theorem T.72 isolates the only sector-independent scalar entering all Yukawa values as $\mathcal N_{\mathrm{PU}}$. Definition T.73.2 supplies a branch-fixed determinant-line norm, geodesic semiclassical prefactor, threshold matching factor, and finite measure normalization, all on the same Bures/Kähler flavor branch and all fixed before validation comparison. Their product is therefore a scalar branch output with the same transformation weight as $\mathcal N_{\mathrm{PU}}$. Substituting this scalar into Theorem T.72 gives (T.73.4). Since the same $\mathcal N_{\mathrm{PU}}^{\mathrm{fl}}$ multiplies every entry in a fixed sector, it cancels from ratios exactly as in Theorem T.72; hence the ratio predictions do not require the certificate, while absolute masses do. ∎

## T.28 Flavor CP: Berry Area and Packet Factorization

**Theorem T.74 (Geometric Berry-Area for Flavor CP).** Let $L\to\mathrm{Gr}(2,8)$ be a Hermitian line bundle with unitary Berry connection $\nabla$ and curvature $F_\nabla=i\omega_{KE}$. Let $\gamma=\partial\Sigma$ be a smooth closed loop bounding an oriented surface over which $L$ is trivialized. Then
$$
\operatorname{Hol}_\nabla(\gamma)
=
\exp\left(i\int_\Sigma\omega_{KE}\right),
$$
or equivalently
$$
\delta_{\mathrm{Berry}}(\gamma)
=
\int_\Sigma\omega_{KE}
\pmod{2\pi}.
$$

*Proof.* In the chosen trivialization write $\nabla=d+i\mathcal A$, so $d\mathcal A=\omega_{KE}$. Stokes' theorem gives
$$
\oint_\gamma\mathcal A=\int_\Sigma\omega_{KE}.
$$
Changing trivialization shifts the loop integral by an integer multiple of $2\pi$, leaving its exponential invariant. If two spanning surfaces are used, their difference is a closed surface, and integrality of the first Chern class shifts the curvature integral by $2\pi\mathbb Z$. ∎

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

*Proof.* Let $\rho$ be any probability density on $[-1,1]$, set $d\mu=dx/2$, and write $q=2\rho$. Then $q\ge0$ and
$$
\int_{-1}^{1}q\,d\mu=1.
$$
For $x\ge0$, the convexity inequality
$$
x\log x-x+1\ge0
$$
holds, with equality exactly at $x=1$. Integrating it with $x=q$ gives
$$
D\!\left(\rho\middle\|\tfrac12\right)
:=\int_{-1}^{1}\rho(x)\log\frac{\rho(x)}{1/2}\,dx
=\int q\log q\,d\mu
\ge0.
$$
If this integral is finite, the differential entropy satisfies
$$
h(\rho)
:=-\int_{-1}^{1}\rho\log\rho\,dx
=\log2-D\!\left(\rho\middle\|\tfrac12\right)
\le\log2;
$$
if the relative entropy is infinite, then $h(\rho)=-\infty$ and the same bound holds. Equality occurs exactly when $q=1$ almost everywhere, i.e. when $\rho=1/2$ almost everywhere. This density is symmetric, so it is the unique maximizer under both constraints.

For $u\ne0$, its characteristic function is
$$
\widehat\rho(u)
=\frac12\int_{-1}^{1}e^{iux}\,dx
=\frac{e^{iu}-e^{-iu}}{2iu}
=\frac{\sin u}{u}.
$$
At $u=0$, normalization gives $\widehat\rho(0)=1$, equal to the continuous extension of $\sin u/u$. The one- and two-direction phase formulas follow by substituting this characteristic function into Theorem T.75. ∎

**Corollary T.76.1 (Structural / Profile Split).** After Theorems T.74 and T.75, the CKM/PMNS CP sector splits into a structural part — Berry holonomy area on $\mathrm{Gr}(2,8)$ — and a profile part — the packet characteristic function $\widehat\rho$. On the PCE-MaxEnt branch of Theorem T.76, the profile part is forced to the sinc factors already used in Appendix T. ∎

## T.29 Relative Uniqueness of the Quantitative Parameter Sector

**Theorem T.77 (Relative Uniqueness from the Complete Appendix-T Input Record).** Fix a connected PU structural branch on $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$ and a fixed-loop Standard Model RG system. Let $\mathfrak I_T$ be the complete Appendix-T input record of Theorem T.79.2, including $A_{EW}$ and its determinant-model convention when $v$ is requested, the completed threshold data, any heavy-threshold ledger, flavor/neutrino/profile data, the target-shift datum $\mathcal M_\gamma$, quartic matching record $\mathfrak M_\lambda$, criticality record $\mathcal C_{\mathrm{crit}}$, and the RG, decoupling, and pole-conversion records. Then
$$
\Pi_T \;:=\; \bigl(\sin^2\theta_W(M_Z),\,g_i(\mu_G),\,v,\,m_H,\,Y_u,\,Y_d,\,Y_e,\,m_{\nu_a},\,V_{\mathrm{CKM}},\,U_{\mathrm{PMNS}}\bigr)
$$
is uniquely determined by $\mathfrak I_T$. Equality of the threshold triplet and flavor-geometric data without equality of the independent Higgs and observable-conversion entries does not imply equality of $\Pi_T$.

*Proof.* The completed threshold entries fix the gauge matching. The flavor, neutrino, and profile entries fix the Yukawa and mixing branches through Theorems T.72–T.76. The independent target-shift, quartic-matching, criticality, RG, decoupling, and pole entries fix the Higgs boundary and observable conversion. Theorem T.71 then supplies trajectory uniqueness for this complete boundary record. Therefore every component of $\Pi_T$ is a deterministic image of $\mathfrak I_T$, while no omitted gate is silently inferred from $\Delta$. ∎

**Corollary T.77.1 (No Hidden Tuning After Input Closure).** On a fixed structural and determinant-model branch, residual non-uniqueness is concentrated in the explicit entries of $\mathfrak I_T$; no additional continuous tuning remains inside the deterministic RG/matching/evolution maps after that complete record is fixed. ∎

**Corollary T.77.2 (Absolute Uniqueness After Complete Record Closure).** If PU uniquely fixes every entry of $\mathfrak I_T$ before comparison—including $A_{EW}$ and its determinant-model convention, threshold, heavy-threshold, flavor, neutrino, profile, target-shift, quartic-matching, criticality, RG, decoupling, and pole-conversion data—then $\Pi_T$ is absolutely unique on the fixed structural branch.

*Proof.* The full input record is then unique, and Theorem T.77 maps it deterministically to one $\Pi_T$. ∎

**Definition T.77.3 (Self-Similar Flavor Potential Branch Package).** A self-similar flavor potential branch package on the selected $E_8$ branch is a tuple
$$
\mathfrak F_{\mathrm{flav}}
=
\left(
X_{\mathrm{flav}},
\{\Phi_\alpha\}_{\alpha\in A},
\{r_\alpha\}_{\alpha\in A},
\{w_\alpha\}_{\alpha\in A},
V_0,
\mathcal N_{\mathrm{PU}},
\{c_f\}_{f}
\right)
\tag{T.77.3.1}
$$
with the following data:

1. $X_{\mathrm{flav}}$ is a compact finite-dimensional flavor cell containing the retained $E_8$ generation candidates.

2. Each $\Phi_\alpha:X_{\mathrm{flav}}\to X_{\mathrm{flav}}$ is a contraction with common Lipschitz bound $\rho<1$.

3. The constants $0<r_\alpha\le r<1$, $w_\alpha\in\mathbb R$, $\mathcal N_{\mathrm{PU}}$, and $c_f$ are fixed before comparison with charged-fermion or neutrino masses.

4. $V_0:X_{\mathrm{flav}}\to\mathbb R$ is a fixed continuous seed potential.

5. The flavor renormalization operator
$$
(\mathcal R_{\mathrm{flav}}V)(x)
=
V_0(x)
+
\min_{\alpha\in A}
\left[
w_\alpha+r_\alpha V(\Phi_\alpha^{-1}x)
\right]
\tag{T.77.3.2}
$$
is interpreted on the branch pieces where $\Phi_\alpha^{-1}x$ is defined, with $+\infty$ assigned outside the image of $\Phi_\alpha$.

The package is completed only when $\mathcal R_{\mathrm{flav}}$ is a strict contraction on the Banach space of continuous potentials modulo additive constants, the fixed point $V_*$ has a finite retained critical set
$$
\{x_{f,a}\},
$$
and the retained Hessians
$$
H_{f,a}:=\nabla^2V_*(x_{f,a})
$$
are positive definite on the retained flavor normal directions. These critical-set, Hessian, normalization, and sector-prefactor data are part of the package unless they are derived from earlier PU branch data in the sense of Convention P.14.1e.

**Theorem T.77.4 (Self-Similar Flavor Branch Criterion).** Assume a completed self-similar flavor potential branch package and choose a representative of its quotient contraction solution by the normalization
$$
\min_XV_*=0.
$$
Then the package determines $(\mathcal T_{E_8},\mathcal V)$, and its absolute Yukawa entries are
$$
y_{f,a}(\mu_G)
=
\mathcal N_{\mathrm{PU}}\,c_f\,
\det(H_{f,a})^{-1/2}
\exp[-\alpha V_*(x_{f,a})],
\qquad
\alpha=\frac32.
\tag{T.77.4.1}
$$
If the threshold tuple $\Delta$, mixing/CP record $\mathcal B$, and scalar normalization $\mathcal N_{\mathrm{PU}}$ are specified, these data determine the corresponding parameter vector $\Pi_T$.

*Proof.* Let $\mathcal B=C(X)/\mathbb R$ be the stated Banach quotient, and suppose
$$
\|\mathcal R_{\mathrm{flav}}[V]-\mathcal R_{\mathrm{flav}}[W]\|_{\mathcal B}
\le q\|[V]-[W]\|_{\mathcal B},
\qquad 0<q<1.
$$
For $[V_{n+1}]=\mathcal R_{\mathrm{flav}}[V_n]$,
$$
\|[V_m]-[V_n]\|_{\mathcal B}
\le\frac{q^n}{1-q}\|[V_1]-[V_0]\|_{\mathcal B}
\quad(m>n).
$$
Thus $(V_n)$ is Cauchy and converges to a fixed class $[V_*]$. If $[W_*]$ is another fixed class, the contraction inequality gives
$$
\|[V_*]-[W_*]\|_{\mathcal B}\le q\|[V_*]-[W_*]\|_{\mathcal B},
$$
so the classes coincide. Compactness of $X$ makes $\min_XV$ finite, and $\min_XV_*=0$ selects one representative. The remaining package hypotheses supply the finite nondegenerate critical points and positive Hessians; substitution into (T.77.4.1), together with the independent scalar normalization, determines the stated Yukawa vector. ∎

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

**Corollary T.78.3 (Airtight Status of the Lifted Threshold Computation).** The global flag-lift threshold problem is structurally formulated and locally constrained, but it does not produce theorem-level numerical thresholds in the current canonical ledger. A positive theorem-level numerical closure would require an independently specified spectral branch package containing the missing data listed in Theorem T.78.2, followed by the forward block-sum computation and Corollary T.69.1 tail certificate. Without such an appended positive branch extension, no value of $(\Delta_i,Z_i)$ may be promoted from validation target to derived prediction, and no nonminimal $\delta_i$ may be introduced unless a separate heavy-threshold ledger is explicitly appended.

*Proof.* Theorem T.78.2 identifies concrete entries absent from the current flag-lift data and proves that, without them, no completed tuple $\mathfrak S_{\widetilde X}$ is determined. Therefore Theorem T.78 cannot assign numerical $F$, $\Delta=TF$, or $Z_i=1+\Delta_i/24$ on the current record. Definition T.19a permits a residual $\delta_i$ only after the principal lifted threshold has been supplied, and Proposition T.19c forbids using that residual to replace or double-count an omitted principal contribution. Corollary T.79.1 propagates these missing inputs to every requested quantitative output. Consequently a positive numerical closure requires the independently specified spectral package and tail certificate stated in the corollary; absent that package, validation values cannot be promoted and the canonical minimal residual remains the empty value $\delta_i=0$. ∎

**Remark T.78.3a (Homogeneous-Zeta Positive Route).** A future positive branch extension for the lifted threshold sector may use the homogeneous-sector zeta reduction certificate of Theorem X.9.6g.2a, but only if it supplies every missing datum in Theorem T.78.2: the metric normalization, homogeneous connection, structural parameters, sector/parity $H$-types or residual block matrices, zero-mode rule, finite-part convention, normalization map, and explicit tail certificate. Such a record would be an appended spectral branch extension evaluated by Theorem T.78. It does not change the negative current-framework statement of Theorem T.78.5, and it cannot promote the validation tuple $(15.14,20.94,18.41)$ unless the forward homogeneous calculation lands there before comparison.

**Definition T.78.4 (Current-Framework PU-Internal Spectral Branch Package).** Let $\mathcal D_{\mathrm{cur}}$ denote the canonical flag-lift threshold data fixed in Definition T.17a, Convention T.17a.0, Convention T.69a, Theorems T.69-T.70, Theorem T.78.2, the flag-lift construction of Theorems G.8.4e-G.8.4e.1 and Proposition G.8.4e.1a, and the marked Golay-Leech half-swap convention of Definition G.8.4f.3.

A spectral branch package is **current-framework PU-internal** if every non-formal entry required by Theorem T.78 is fixed as a theorem-level consequence of $\mathcal D_{\mathrm{cur}}$, with no appended continuous constants, no appended sector/parity $H$-type table, no appended residual block matrices, no declared heat/zeta constants, no fitted finite counterterms, no appended tail constants, no replacement of the ordinary $\mathrm{MS2}_{\mu_G}$ determinant, and no use of the external validation tuple.

A spectral branch package is an **appended spectral branch extension** if at least one of those entries is stipulated as additional branch data before validation comparison. An appended extension may be evaluated by Theorem T.78, but it is not supplied by $\mathcal D_{\mathrm{cur}}$.

**Theorem T.78.5 (Negative Completion of the Current-Framework Flag-Lift Spectral Gate).** No current-framework PU-internal admissible spectral branch package supplies the missing data required for theorem-level numerical values of
$$
(F_C,F_W,F_Y),\qquad
(\Delta_1,\Delta_2,\Delta_3),\qquad
(Z_1,Z_2,Z_3).
$$
Equivalently,
$$
\mathcal D_{\mathrm{cur}}
\not\Rightarrow
\mathfrak S_{\widetilde X},
\qquad
\mathcal D_{\mathrm{cur}}
\not\Rightarrow
(F,\Delta,Z),
$$
while any completed $\mathfrak S_{\widetilde X}$ still determines $(F,\Delta,Z)$ by Theorem T.78. Thus the global flag-lift spectral gate closes inside the present framework only on its negative completion branch: any positive numerical closure requires appending a new spectral branch extension before validation comparison.

*Proof.* The positive completion route requires a completed tuple
$$
\mathfrak S_{\widetilde X}
=
(\widetilde X,
D^{\mathrm{PCE}}_{\widetilde X},
\mathrm{MS2}_{\mu_G},
\mathcal J_G,
\beta,
\nabla^{\widetilde G},
\mu_0,m_{\mathcal J},\eta,
\{\tau_{s,\pm,a}\}\text{ or }\{J_{\Lambda,s,a}\},
\{\varepsilon_s(L)\}).
$$
Theorem T.78.2 proves that $\mathcal D_{\mathrm{cur}}$ does not determine the metric normalization $\beta$, the homogeneous connection $\nabla^{\widetilde G}$, the structural parameters $(\mu_0,m_{\mathcal J},\eta)$, the operator-level Golay/parity block data required by Theorem T.70, the sector/parity $H$-types or residual finite matrices, or the Corollary T.69.1 tail certificate. These missing entries are genuine spectral moduli, not notation.

If no admissible completed package exists, then no current-framework PU-internal admissible package exists. Suppose, therefore, that at least one admissible completed package exists. For each sector $s$, write its positive operator as $D_s$. Replacing $\mu_0$ by $\mu_0+r$ gives $D_s(r)=D_s+rI$. For every real $r$ sufficiently small with $D_s+rI$ positive, and for every $r>0$, this replacement preserves the flag manifold, the sector split, self-adjointness, ellipticity, compact resolvent, the ordinary $\mathrm{MS2}_{\mu_G}$ prescription, the Dynkin-index matrix $T$, the marked carrier convention, and positivity. Hence $\mathcal D_{\mathrm{cur}}$ does not distinguish $D_s(0)$ from $D_s(r)$.

The dependence of the ordinary determinant on $r$ is nontrivial. In the convergence half-plane,
$$
\frac{d}{dr}\zeta_{s,r}(q)=-q\,\zeta_{s,r}(q+1).
$$
Writing the Laurent expansion at $q=0$ as
$$
\zeta_{s,r}(q+1)=\frac{\rho_{s,r}}{q}+\operatorname{FP}_{z=1}\zeta_{s,r}(z)+O(q),
$$
one obtains
$$
\frac{d}{dr}F_s(r)
=
\operatorname{FP}_{z=1}\zeta_{s,r}(z)+\rho_{s,r}\log\mu_G^2.
$$
This derivative cannot vanish identically as a function of $r$. Indeed the Seeley expansion for $\log\det_{\zeta,\mu_G}(D_s+r)$ as $r\to+\infty$ has a leading heat-kernel term controlled by
$$
a_{0,s}=(4\pi)^{-23}\operatorname{rk}(E_s)\operatorname{Vol}(\widetilde X)>0,
$$
because $\dim_{\mathbb R}\widetilde X=46$ and every sector bundle has positive rank. Therefore the determinant is not constant along the admissible mass-shift family. Already on any nonempty retained block set,
$$
F_s^{(\le L)}(r)-F_s^{(\le L)}(0)
=
\sum_{\nu\le L}m_\nu\log\left(1+\frac r\nu\right),
$$
which is nonzero for $r\ne0$ of fixed sign. The full zeta variation is therefore not a cutoff artifact.

The same non-descent applies to the other missing entries. Varying $\beta$ changes every nonzero Casimir contribution in the homogeneous formula
$$
\nu_{\Lambda,s,\pm,a}
=
\beta\left(C_2^{SU(8)}(\Lambda)-C_2^H(\tau_{s,\pm,a})\right)+c_{s,\pm}.
$$
Varying $(m_{\mathcal J},\eta)$ changes the parity shift
$$
Q_s=m_{\mathcal J}+\eta\lambda_s.
$$
Since $\lambda_C,\lambda_W,\lambda_Y$ are distinct, this variation is sector-dependent unless an additional theorem fixes $(m_{\mathcal J},\eta)$. Positivity defines an admissible region; it does not select a point.

The marked Golay half-swap supplies a carrier involution but not the spectral block package required by Theorem T.70. The finite carrier convention
$$
J_0=(1\,13)(2\,14)\cdots(12\,24)
$$
is a marked involution on the 24-mode Golay-Leech frame, and Proposition G.8.4f.4 transports it to a self-adjoint orthogonal involution on the lifted real interface bundle. Theorem T.70 still requires either a homogeneous operator commuting with the selected sector Laplacians together with its sector/parity $H$-type eigenspaces, or explicit residual finite matrices $J_{\Lambda,s,a}$ on every residual block. Corollary T.70.1 shows that a homogeneous irreducible pointwise $H$-equivariant involution is scalar on that irreducible sector, while the nonhomogeneous residual-symmetry case requires the infinite block family or an equivalent rule for all omitted blocks. Thus $J_0$ by itself does not determine the required block decomposition or residual matrices.

A retained finite-block sum is not, by itself, the canonical $\mathrm{MS2}_{\mu_G}$ finite part. Its raw pre-subtraction values have the form
$$
S_s^{(\le L)}=\sum_{\nu\le L}m_\nu\log\nu.
$$
For $P=24$, set
$$
B_s(q):=
\int_0^1 t^{q-1}\left(K_s(t)-\sum_{j=0}^{24}a_{2j,s}t^{j-23}\right)dt
+
\int_1^\infty t^{q-1}K_s(t)dt.
$$
Convention T.69a gives
$$
F_s
=
-B_s(0)
-
\sum_{\substack{0\le j\le24\\ j\ne23}}
\frac{a_{2j,s}}{j-23}
-
\gamma a_{46,s}
-
a_{46,s}\log\mu_G^2.
$$
Thus the determinant requires $B_s(0)$, the local coefficient vector $(a_{0,s},a_{2,s},\ldots,a_{48,s})$, and numerical constants $A_s,C_{s,24}$ for the tail certificate in each sector. Retained block counts, raw retained log sums, and tail-integral factors do not determine these quantities.

Therefore the assumptions that the package is completed in the sense of Theorem T.78 and that the package is current-framework PU-internal in the sense of Definition T.78.4 are incompatible. Since
$$
T=
\begin{pmatrix}
2/5&3/5&8/15\\
0&1&0\\
1&0&0
\end{pmatrix}
$$
has determinant $-8/15$, failure to determine $F$ propagates to failure to determine $\Delta=TF$, and then to failure to determine $Z_i=1+\Delta_i/24$. The canonical minimal residual ledger remains $\delta_i=0$ and cannot absorb missing principal lifted thresholds. ∎

**Corollary T.78.5.1 (Pre-Certificate Disposition of the Flag-Lift Spectral Gate).** Before a completed spectral certificate is supplied, the current-framework flag-lift spectral gate closes negatively: no theorem-level numerical $(F,\Delta,Z)$ follows from the canonical ledger alone, and no validation tuple may be promoted to a derived threshold output. A positive branch requires a completed spectral tuple, forward block sums, heat/zeta finite parts, and Corollary T.69.1 tail constants fixed before validation comparison.

*Proof.* Theorem T.78 proves determinacy only after every component of a completed spectral tuple is specified. Theorem T.78.5 proves that no current-framework PU-internal package supplies the missing components, so the antecedent of Theorem T.78 is false on the current ledger. Corollary T.78.3 therefore keeps $(F,\Delta,Z)$ nonnumerical and forbids replacing the absent principal calculation by a residual or validation target. Corollary T.79.1 propagates that open gate to the quantitative Appendix-T outputs. A future package containing the stated block sums, finite parts, and tail constants would satisfy the missing antecedent; before such a package is accepted, no theorem-level numerical threshold follows. ∎

**Definition T.78.5a (Equivariant Analytic-Torsion Spectral Certificate).** An equivariant analytic-torsion flag-lift certificate is a finite record
$$
\mathfrak C_{\mathrm{tor}}
=
\left(
\widetilde X,
g_{\mathrm{KE}},
\nabla^{\widetilde G}_{\mathrm{can}},
\mathcal J_G,
\{\mathcal E_s,\rho_s,D_s\}_{s\in\{C,W,Y\}},
\{\tau_s^{\mathrm{PU}}\}_{s\in\{C,W,Y\}},
\{\varepsilon_s(L)\}_{s\in\{C,W,Y\}}
\right)
\tag{T.78.5a.1}
$$
with the following entries fixed before comparison with any validation tuple:

1. $g_{\mathrm{KE}}$ is the homogeneous Kähler-Einstein normalization of the compact flag lift $\widetilde X=\mathrm{Flag}_{1,2,3}(Q)$ in the unit-radius Bures convention used by Definition T.17a;

2. $\nabla^{\widetilde G}_{\mathrm{can}}$ is the canonical homogeneous equivariant connection from the reductive splitting of the flag stabilizer;

3. $\mathcal J_G$ is the marked Golay-Leech parity involution transported to every retained sector block;

4. for each sector $s\in\{C,W,Y\}$, $\mathcal E_s$ is the sector determinant bundle with equivariant type $\rho_s$, and $D_s$ is a positive self-adjoint elliptic operator with compact resolvent acting on its retained sector/parity block;

5. $\tau_s^{\mathrm{PU}}$ is a nonzero equivariant determinant-line torsion element whose norm in the canonical torsion metric satisfies
$$
F_s^{\mathrm{tor}}
=
\log\|\tau_s^{\mathrm{PU}}\|
=
-\zeta_s'(0)-\zeta_s(0)\log\mu_G^2
\tag{T.78.5a.2}
$$
with the same ordinary $\mathrm{MS2}_{\mu_G}$ finite part as Convention T.69a;

6. the determinant-line anomaly class of the sector package is trivial, so that the three torsion elements are globally comparable without adding a finite counterterm;

7. the tail functions $\varepsilon_s(L)$ satisfy Corollary T.69.1.

The certificate is rejected if any entry is chosen by reference to the validation tuple $(15.14,20.94,18.41)$.

**Theorem T.78.5b (Torsion Certificate Closure of the Flag-Lift Spectral Gate).** An accepted equivariant analytic-torsion certificate $\mathfrak C_{\mathrm{tor}}$ is a completed spectral tuple in the sense of Theorem T.78. It determines
$$
F^{\mathrm{tor}}
=
(F_C^{\mathrm{tor}},F_W^{\mathrm{tor}},F_Y^{\mathrm{tor}})^T,
\qquad
\Delta^{\mathrm{tor}}=TF^{\mathrm{tor}},
\qquad
Z_i^{\mathrm{tor}}=1+\frac{\Delta_i^{\mathrm{tor}}}{24},
\tag{T.78.5b.1}
$$
with $\delta_i^{\mathrm{min}}=0$ on the canonical minimal residual ledger.

*Proof.* Definition T.78.5a supplies every non-formal datum listed in Theorem T.78.2. Item 1 fixes the metric normalization $\beta$ by the homogeneous Kähler-Einstein/Bures convention. Item 2 fixes the homogeneous connection. Items 3 and 4 fix the Golay/parity action, sector equivariant types, and sector operators. Item 5 identifies the determinant-line torsion norm with the same zeta finite part used by Convention T.69a, so no new finite-part prescription is introduced. Item 6 excludes an uncancelled determinant-line anomaly and forbids a hidden finite counterterm. Item 7 supplies the tail certificate required by Corollary T.69.1.

Thus the certificate is a completed spectral problem in the sense of Theorem T.78. Theorem T.78 then gives unique sector finite parts $F_s^{\mathrm{tor}}$, the fixed Dynkin-index map gives $\Delta^{\mathrm{tor}}=TF^{\mathrm{tor}}$, and Definition T.17a gives $Z_i^{\mathrm{tor}}=1+\Delta_i^{\mathrm{tor}}/24$. Since no separate heavy-threshold ledger is appended, Definition T.19a gives $\delta_i^{\mathrm{min}}=0$. ∎

**Remark T.78.6.0 (Anchor to the Global Ledger).** Definition T.78.6 supplies the local strict PPI/PCE certificate of the electroweak threshold row in Convention P.14.1k. Algorithm T.78.6a is the acceptance test, Theorem T.78.7 is the local determinacy theorem, Definition T.78.10 fixes the threshold-vector entries, and Theorem T.78.11 is the non-contamination theorem. An accepted $\mathfrak R_{\mathrm{RHG}}$ filling Definition T.78.6 and Definition T.78.10 closes the row by Theorem D.8.9b.

**Definition T.78.6 (RHG Flag-Lift Spectral Certificate).** An RHG flag-lift spectral certificate is a finite record
$$
\mathfrak C_{\mathrm{RHG}}
=
\left(
\mathcal B_L,
\mathcal P_{\mathrm{RHG}},
\mathcal D_{\mathrm{RHG}},
\mathcal E_{\mathrm{RHG}},
\mathcal H_{\mathrm{RHG}},
\mathcal L_{\mathrm{det},\mathrm{RHG}},
\mathcal T_{\mathrm{RHG}},
\mathcal F_{\mathrm{RHG}},
\mathcal I_{\mathrm{Dyn}},
\mathcal S_{\mathrm{scheme}},
\mathcal M_{\mathrm{RHG}},
\chi_{\mathrm{stat}}
\right)
\tag{T.78.6.1}
$$
with the following entries, all fixed before validation comparison.

1. **Finite block and source-origin ledger.** $\mathcal B_L$ is a finite list of retained Peter-Weyl/residual labels
$$
b=(\Lambda,s,a,o_b),
\qquad
s\in\{C,W,Y\},
$$
with cutoff $L$, omitted spectral threshold $\nu_L$, sector multiplicities, exact dimensions $\dim V_\Lambda$, and a source-origin tag $o_b$ for each retained block. The source-origin tag records whether the block descends from the homogeneous flag lift, RHG Clifford transport, Golay-Leech syndrome projection, or a declared restriction of the master zeta-index ledger. A block with unknown origin is not admissible.

2. **Finite sector projections, parity, and grading data.** $\mathcal P_{\mathrm{RHG}}$ gives, on every retained block, mutually compatible finite projections
$$
P_{s,b},
\qquad
\Pi_{\mathrm{syn},b},
\qquad
\Pi_{r,b},
\qquad
r\in\{C,W,Y\},
$$
together with the transported initial parity $J_{0,b}$, the grading $\Gamma_b$, and all sector-sector overlap projectors. These data satisfy
$$
P_{s,b}^2=P_{s,b}=P_{s,b}^*,
\qquad
\Gamma_b^2=I,
\qquad
J_{0,b}^*=J_{0,b},
\qquad
J_{0,b}^2=I,
\tag{T.78.6.2}
$$
and the declared commutation or anticommutation relations with the sector projections. The hypercharge sector projection uses the same determinant-compatible $5/3$ normalization as the running-coupling ledger.

3. **Finite matrices and differential-origin ledger.** $\mathcal D_{\mathrm{RHG}}$ gives, for every $b\in\mathcal B_L$, exact finite matrices
$$
A_{\alpha,b},
\qquad
\alpha=1,\ldots,6,
$$
obtained from the RHG generators $E_\alpha=i\gamma_\alpha$ on the same block representation. It also gives
$$
\mathcal K_b
=
\sum_{\alpha=1}^{6}
[A_{\alpha,b},\Pi_{\mathrm{syn},b}]^*[A_{\alpha,b},\Pi_{\mathrm{syn},b}]
+
\sum_{\alpha=1}^{6}
[A_{\alpha,b},J_{0,b}]^*[A_{\alpha,b},J_{0,b}]
+
\sum_r\sum_{\alpha=1}^{6}
[A_{\alpha,b},\Pi_{r,b}]^*[A_{\alpha,b},\Pi_{r,b}],
\tag{T.78.6.3}
$$
the RHG lowest-energy projection
$$
\Pi_b^{\mathrm{RHG}}
=
\mathbf 1_{\{\lambda_{\min}(\mathcal K_b)\}}(\mathcal K_b),
\tag{T.78.6.4}
$$
and the residual parity involution
$$
J_b^{\mathrm{RHG}}
=
\operatorname{sgn}_0
\left(
\Pi_b^{\mathrm{RHG}}J_{0,b}\Pi_b^{\mathrm{RHG}}
\right).
\tag{T.78.6.5}
$$
Here $\operatorname{sgn}_0$ is a branch-fixed finite spectral-sign convention on the compressed block. It must return a self-adjoint involution on $\Pi_b^{\mathrm{RHG}}\mathcal H_b$, either because the compressed operator has no zero eigenvalue or because a branch-fixed $\pm1$ assignment on the zero eigenspace is included before validation comparison.

4. **Geometric normalization and operator-origin data.** $\mathcal E_{\mathrm{RHG}}$ gives the canonical homogeneous metric $g_0$ on
$$
\widetilde X=SU(8)/S(U(2)\times U(1)\times U(2)\times U(3)),
$$
the six RHG Killing fields $E_\alpha^\#$, the exact volume $\operatorname{Vol}_{g_0}(\widetilde X)$, the metric normalization
$$
\beta_{\mathrm{RHG}}^{-1}
=
\frac{1}{6\operatorname{Vol}_{g_0}(\widetilde X)}
\sum_{\alpha=1}^{6}
\int_{\widetilde X}
\lVert E_\alpha^\#\rVert_{g_0}^2
\,d\operatorname{vol}_{g_0},
\tag{T.78.6.6}
$$
and the canonical homogeneous connection $\nabla_{\mathrm{RHG}}^{\widetilde G}$ induced by the reductive decomposition
$$
\mathfrak{su}(8)=\mathfrak h\oplus\mathfrak m.
$$
These entries are the differential-origin ledger for the RHG block operator.

5. **Structural triple certificate.** $\mathcal H_{\mathrm{RHG}}$ gives the spectrahedral admissible set
$$
\mathcal A_{\mathrm{RHG}}
=
\left\{
 x=(\mu,m,\eta):
 B_b^{\mathrm{RHG}}(x)\ge(\ln2)I
 \text{ for every retained and tail-certified block }b
\right\},
\tag{T.78.6.7}
$$
where
$$
B_b^{\mathrm{RHG}}(x)
=
\beta_{\mathrm{RHG}}
\left(
C_2^{SU(8)}(\Lambda)-C_2^H(\tau_{s,a})
\right)I
+
(\lambda_s+\mu)I
+
(m+\eta\lambda_s)J_b^{\mathrm{RHG}}.
\tag{T.78.6.8}
$$
It also gives the exact unique minimizer
$$
x_{\mathrm{RHG}}
=(\mu_0^{\mathrm{RHG}},m_{\mathcal J}^{\mathrm{RHG}},\eta^{\mathrm{RHG}})
=
\operatorname*{argmin}_{x\in\mathcal A_{\mathrm{RHG}}}
(\mu^2+m^2+\eta^2).
\tag{T.78.6.9}
$$
The active-constraint list and tangent-quotient Hessian certificate are part of $\mathcal H_{\mathrm{RHG}}$.

6. **Determinant-line construction.** $\mathcal L_{\mathrm{det},\mathrm{RHG}}$ gives, for each sector $s$, the finite determinant line
$$
\operatorname{Det}_{s,L}^{\mathrm{RHG}}
=
\bigotimes_{b=(\Lambda,s,a,o_b)}
\det{}'
\left(
B_b^{\mathrm{RHG}}(x_{\mathrm{RHG}})|_{\Pi_b^{\mathrm{RHG}}\mathcal H_b}
\right)^{\dim V_\Lambda},
\tag{T.78.6.10}
$$
the zero-mode exclusion rule, determinant-line orientation, and comparison isomorphism to the running-coupling determinant convention. The prime is interpreted by the same zero-mode rule used in the zeta finite part. The determinant-line convention is not editable after any dependent row is fixed.

7. **Tail certificate.** $\mathcal T_{\mathrm{RHG}}$ gives, for every sector $s$, constants
$$
A_s,
\qquad C_{s,P},
\qquad P>23,
\qquad \nu_L,
$$
such that
$$
N_s^{\mathrm{RHG}}(\nu)\le A_s(1+\nu)^{23},
\tag{T.78.6.11}
$$
and
$$
|R_{s,P}^{\mathrm{RHG}}(\nu)|
\le
C_{s,P}(1+\nu)^{-P}\log(2+\nu)
\tag{T.78.6.12}
$$
for all $\nu\ge\nu_L$. The certified tail error is
$$
\varepsilon_s(L)
=
A_sC_{s,P}
\int_{\nu_L}^{\infty}
(1+\nu)^{22-P}\log(2+\nu)\,d\nu.
\tag{T.78.6.13}
$$

8. **Finite heat/zeta sums and finite-part prescription.** $\mathcal F_{\mathrm{RHG}}$ gives the retained finite zeta sum
$$
\zeta_{s,L}^{\mathrm{RHG}}(q)
=
\sum_{b=(\Lambda,s,a,o_b)}
(\dim V_\Lambda)
\operatorname{Tr}_{\Pi_b^{\mathrm{RHG}}\mathcal H_b}
\left(
B_b^{\mathrm{RHG}}(x_{\mathrm{RHG}})^{-q}
\right),
\tag{T.78.6.14}
$$
its accepted meromorphic continuation, the finite-part scale $\mu_G$, and the sector finite part
$$
F_s^{\mathrm{RHG}}
=
-\left(\zeta_s^{\mathrm{RHG}}\right)'(0)
-
\zeta_s^{\mathrm{RHG}}(0)\log\mu_G^2,
\tag{T.78.6.15}
$$
with the tail interval from $\mathcal T_{\mathrm{RHG}}$ added. Equivalently, it records certified intervals
$$
F_s^{\mathrm{RHG}}
\in
[F_s^-,F_s^+],
\qquad
s\in\{C,W,Y\}.
\tag{T.78.6.16}
$$

9. **Determinant-compatible Dynkin-index map.** $\mathcal I_{\mathrm{Dyn}}$ gives the fixed rational matrix $T=(T_{is})$ that maps sector finite parts to threshold shifts,
$$
\Delta_i^{\mathrm{RHG}}
=
\sum_{s\in\{C,W,Y\}}T_{is}F_s^{\mathrm{RHG}},
\qquad i=1,2,3,
\tag{T.78.6.17}
$$
and proves that the hypercharge row uses the same $5/3$ normalization and determinant-line convention as the electromagnetic projection and running-coupling ledgers.

10. **Scheme ledger.** $\mathcal S_{\mathrm{scheme}}$ records the finite-part scheme, subtraction order, zero-mode prescription, finite-part scale, heat/zeta continuation convention, RG convention, and the map from $\mu_G$ to the matching scale. Retuning any one of these entries after comparison creates a new branch.

11. **Matching map and evaluation-origin ledger.** $\mathcal M_{\mathrm{RHG}}$ gives the forward evaluation map
$$
\mathcal M_{\mathrm{RHG}}:
(\mathcal F_{\mathrm{RHG}},\mathcal I_{\mathrm{Dyn}},\mathcal S_{\mathrm{scheme}})
\longmapsto
(\Delta^{\mathrm{RHG}},Z^{\mathrm{RHG}},g_i(\mu_G)),
\tag{T.78.6.18}
$$
with
$$
Z_i^{\mathrm{RHG}}=1+
\frac{\Delta_i^{\mathrm{RHG}}}{24},
\qquad
g_i(\mu_G)=\frac{g_U}{\sqrt{Z_i^{\mathrm{RHG}}}}.
\tag{T.78.6.19}
$$
The evaluation-origin ledger records the exact finite sums, continuation calls, and interval arithmetic that produced the displayed intervals.

12. **Status, overlap, and forward-lock ledger.** $\chi_{\mathrm{stat}}$ records that every entry of $\mathfrak C_{\mathrm{RHG}}$ is theorem-derived, convention-fixed, or branch-certified before validation comparison. It also records the overlap audit against bulk, interface, electromagnetic projection, curvature, sinc-transport, torsion, spectral-action, flavor, baryogenesis, primordial determinant, vacuum-prefactor, and future symmetry-residual ledgers. Any validation-selected entry, post-comparison finite-part convention, altered projector, altered tail bound, altered grading, altered determinant-line convention, altered Dynkin-index normalization, altered matching map, or unassigned overlap contribution invalidates the certificate.

**Algorithm T.78.6a (RHG Certificate Verification).** Given a finite record $\mathfrak C_{\mathrm{RHG}}$, verify the certificate by the following finite checks.

1. Check that the finite block list $\mathcal B_L$ contains exact labels, sector labels, multiplicities, dimensions, cutoff $L$, omitted threshold $\nu_L$, and source-origin tags for every retained block.

2. Check that every $A_{\alpha,b}$ is the derived $SU(8)$ representation of the RHG generator $E_\alpha=i\gamma_\alpha$ on the same block $b$, and that the matrices $\Pi_{\mathrm{syn},b}$, $J_{0,b}$, $\Gamma_b$, $P_{s,b}$, and $\Pi_{r,b}$ are the transported marked Golay/syndrome/grading/sector data declared in $\mathcal P_{\mathrm{RHG}}$.

3. Recompute $\mathcal K_b$ from (T.78.6.3), verify positivity, compute its lowest spectral projection, and check (T.78.6.4).

4. Recompute $J_b^{\mathrm{RHG}}$ from (T.78.6.5), including the branch-fixed zero-eigenspace convention if needed, and verify
$$
(J_b^{\mathrm{RHG}})^*=J_b^{\mathrm{RHG}},
\qquad
(J_b^{\mathrm{RHG}})^2=I.
\tag{T.78.6.20}
$$
Verify the declared commutation or anticommutation rules with $P_{s,b}$ and $\Gamma_b$.

5. Verify the metric normalization (T.78.6.6), the six Killing fields, the volume entry, and the homogeneous connection definition from the reductive splitting.

6. Verify that $\mathcal A_{\mathrm{RHG}}$ is the spectrahedron (T.78.6.7), that $x_{\mathrm{RHG}}$ satisfies the Karush-Kuhn-Tucker conditions for minimizing $\mu^2+m^2+\eta^2$ over $\mathcal A_{\mathrm{RHG}}$, and that the active-constraint Hessian is positive on the tangent quotient.

7. Recompute every retained finite eigenvalue of $B_b^{\mathrm{RHG}}(x_{\mathrm{RHG}})$ and verify the retained heat/zeta block sums.

8. Verify the determinant-line construction (T.78.6.10), the zero-mode convention, and the determinant-line comparison isomorphism to the running-coupling ledger.

9. Verify the Weyl bound (T.78.6.11), the heat-kernel remainder bound (T.78.6.12), and the tail integral (T.78.6.13). Propagate the interval arithmetic through each $F_s^{\mathrm{RHG}}$.

10. Recompute the finite-part value (T.78.6.15) from the declared continuation and finite-part scale. Reject the certificate if the subtraction order, zero-mode rule, or finite-part scale differs from $\mathcal S_{\mathrm{scheme}}$.

11. Verify the determinant-compatible Dynkin-index map $\mathcal I_{\mathrm{Dyn}}$, including the hypercharge normalization, and recompute
$$
\Delta^{\mathrm{RHG}}=T F^{\mathrm{RHG}}.
\tag{T.78.6.21}
$$

12. Propagate the threshold intervals through
$$
Z_i^{\mathrm{RHG}}=1+
\frac{\Delta_i^{\mathrm{RHG}}}{24}
$$
and through the matching map $g_i(\mu_G)=g_U/\sqrt{Z_i^{\mathrm{RHG}}}$.

13. Verify the overlap audit: no term assigned to bulk, interface, electromagnetic projection, curvature, sinc-transport, torsion, spectral-action, flavor, baryogenesis, primordial determinant, vacuum-prefactor, or future symmetry-residual ledgers may be counted again in $F_s^{\mathrm{RHG}}$ or $\Delta_i^{\mathrm{RHG}}$.

14. Reject the certificate if any entry is marked validation-selected, if any finite-part convention, projector, tail bound, grading, determinant-line convention, Dynkin-index normalization, or matching map was selected after comparison, or if any verification check fails.

**Lemma T.78.6b (Finite Verification and Uniqueness).** Algorithm T.78.6a terminates on every finite record $\mathfrak C_{\mathrm{RHG}}$. If it accepts, the accepted values of
$$
F^{\mathrm{RHG}},
\qquad
\Delta^{\mathrm{RHG}},
\qquad
Z^{\mathrm{RHG}}
$$
are unique up to the certified interval widths.

*Proof.* All block operations in steps 1-6 are finite-dimensional matrix computations. Spectral projections, signs, KKT checks, and finite eigenvalue enclosures are finite algebraic or interval-arithmetic checks. The tail checks in step 7 require only the listed constants $A_s,C_{s,P},P,\nu_L$ and the explicit integral (T.78.6.11), which is finite because $P>23$. Steps 8-9 are finite interval arithmetic and status-ledger checks. Hence the algorithm terminates.

If the certificate is accepted, the matrices $\mathcal K_b$, projections $\Pi_b^{\mathrm{RHG}}$, involutions $J_b^{\mathrm{RHG}}$, normalization $\beta_{\mathrm{RHG}}$, connection $\nabla_{\mathrm{RHG}}^{\widetilde G}$, and structural triple $x_{\mathrm{RHG}}$ are all fixed. The finite retained eigenvalue sums are fixed, and the omitted tails are enclosed by the certified intervals. Therefore $F^{\mathrm{RHG}}$ is unique up to those intervals. Since $T$ is fixed and $Z_i=1+\Delta_i/24$ is affine, $\Delta^{\mathrm{RHG}}$ and $Z^{\mathrm{RHG}}$ are unique up to propagated interval widths. ∎

**Lemma T.78.6c (Existence and Uniqueness of the RHG Structural Triple).** If the RHG block data pass steps 1-4 of Algorithm T.78.6a, the admissible set $\mathcal A_{\mathrm{RHG}}$ is nonempty, closed, and convex. Hence the structural triple (T.78.6.8) exists and is unique.

*Proof.* For each block $b$, the map
$$
x\mapsto B_b^{\mathrm{RHG}}(x)-(\ln2)I
$$
is an affine Hermitian matrix pencil. The positive-semidefinite locus of an affine Hermitian matrix pencil is a closed convex spectrahedron. Intersections of closed convex sets are closed and convex. Nonemptiness follows because increasing $\mu$ shifts every block by $\mu I$, so sufficiently large $\mu$ satisfies all block inequalities. The objective $\mu^2+m^2+\eta^2$ is strictly convex and proper on $\mathbb R^3$, so its minimizer on a nonempty closed convex set is unique. ∎

**Theorem T.78.7 (Certified RHG Completion of the Global Flag-Lift Spectral Gate).** An accepted RHG flag-lift spectral certificate $\mathfrak C_{\mathrm{RHG}}$ is a completed spectral tuple in the sense of Theorem T.78. It positively closes the global flag-lift spectral gate on the RHG branch by the forward map
$$
\mathfrak C_{\mathrm{RHG}}
\longmapsto
F^{\mathrm{RHG}}
\longmapsto
\Delta^{\mathrm{RHG}}=TF^{\mathrm{RHG}}
\longmapsto
Z_i^{\mathrm{RHG}}=1+\frac{\Delta_i^{\mathrm{RHG}}}{24}.
\tag{T.78.7.1}
$$
In the canonical minimal residual ledger,
$$
\delta_i^{\mathrm{min}}=0.
\tag{T.78.7.2}
$$
The comparison tuple
$$
(15.14,20.94,18.41)
$$
cannot be used to define, choose, tune, or repair any entry of $\mathfrak C_{\mathrm{RHG}}$.

*Proof.* An accepted certificate supplies all non-formal data isolated in Theorem T.78.2: the metric normalization $\beta_{\mathrm{RHG}}$, homogeneous connection $\nabla_{\mathrm{RHG}}^{\widetilde G}$, structural parameters $(\mu_0^{\mathrm{RHG}},m_{\mathcal J}^{\mathrm{RHG}},\eta^{\mathrm{RHG}})$, Golay/parity block operators $J_b^{\mathrm{RHG}}$, residual finite matrices through the block pencils $B_b^{\mathrm{RHG}}$, and tail constants satisfying Corollary T.69.1. The canonical $\mathrm{MS2}_{\mu_G}$ finite-part prescription is fixed by Convention T.69a.

By Lemma T.78.6b, the forward finite parts $F_s^{\mathrm{RHG}}$ are uniquely certified. Theorem T.78 then applies to the accepted tuple and gives determinacy of the completed flag-lift spectral problem. The fixed Dynkin-index map gives $\Delta^{\mathrm{RHG}}=TF^{\mathrm{RHG}}$, and Definition T.17a gives $Z_i^{\mathrm{RHG}}=1+\Delta_i^{\mathrm{RHG}}/24$. Since no separate heavy-threshold ledger is appended, Definition T.19a gives $\delta_i^{\mathrm{min}}=0$.

Finally, step 9 of Algorithm T.78.6a rejects any validation-selected entry. Therefore the validation tuple cannot influence the branch construction. It is available only for comparison after the forward computation. ∎

**Corollary T.78.8 (Flag-Lift Threshold Closure Criterion).** The electroweak threshold row is theorem-closed on a branch exactly when one of the following explicitly stated closure modes holds before validation comparison:

1. a positive numerical closure is supplied by an accepted equivariant analytic-torsion certificate $\mathfrak C_{\mathrm{tor}}$ in the sense of Definition T.78.5a and Theorem T.78.5b;
2. a positive numerical closure is supplied by an accepted RHG certificate $\mathfrak C_{\mathrm{RHG}}$ under Algorithm T.78.6a;
3. a positive numerical closure is supplied by another completed spectral tuple satisfying Theorem T.78 and Corollary T.69.1;
4. a negative closure is supplied by a no-go theorem proving that no admissible PU-internal spectral package can supply the missing threshold data.

A tuple of numerical threshold shifts is not promoted by agreement with the validation row. It is promoted only by one of the positive precomparison closures in items 1--3. Item 4 closes the row only negatively, by excluding theorem-level numerical threshold supply inside the stated admissible class.

*Proof.* Theorem T.78 makes the threshold tuple a deterministic function of the completed sector operator, scheme, finite-part, and tail data. Theorem T.78.5b proves that an accepted torsion certificate supplies such data. Theorem T.78.7 proves the same for an accepted RHG certificate. Item 3 is the same determinacy statement for any other completed spectral tuple satisfying the same hypotheses. Item 4 is the negative closure alternative supplied by a no-go theorem. Since each positive alternative fixes the tuple before comparison and the negative alternative forbids such a tuple, these cases exactly exhaust theorem-level threshold-row closure. ∎

**Corollary T.78.9 (No Fractal-Ontology Claim for RHG Closure).** RHG closure does not assert that the smooth homogeneous flag lift $\widetilde X$ is a fractal space. The RHG projection is finite and blockwise; the threshold operator remains an elliptic sector operator on the smooth compact flag lift.

*Proof.* The matrices $\mathcal K_b$, $\Pi_b^{\mathrm{RHG}}$, and $J_b^{\mathrm{RHG}}$ live on finite Peter-Weyl/residual blocks. The sector zeta functions are those of the elliptic lifted threshold operator on the smooth compact homogeneous space $\widetilde X$. No topology, differentiable structure, or homogeneous-space definition of $\widetilde X$ is changed. ∎

**Definition T.78.10 (Forward-Locked RHG Acceptance Record).** A forward-locked RHG acceptance record is a finite tuple
$$
\mathfrak R_{\mathrm{RHG}}
=
\left(
\mathfrak C_{\mathrm{RHG}},
\Delta_{\mathrm{RHG}},
Z_{\mathrm{RHG}},
\mathcal I_{\mathrm{RHG}},
\mathcal H_{\mathrm{RHG}},
\mathcal M_{\mathrm{RHG}},
\mathcal B_{\mathrm{tail}},
\mathcal S_{\mathrm{scheme}},
\mathfrak Z_{\mathrm{RHG}},
\chi_{\mathrm{RHG}}
\right)
\tag{T.78.10.1}
$$
where $\mathfrak C_{\mathrm{RHG}}$ is the certificate of Definition T.78.6, $\Delta_{\mathrm{RHG}}$ is the resulting threshold vector, $Z_{\mathrm{RHG}}$ is the componentwise wavefunction vector
$$
Z_i^{\mathrm{RHG}}=1+\frac{\Delta_i^{\mathrm{RHG}}}{24},
\tag{T.78.10.2}
$$
$\mathcal I_{\mathrm{RHG}}$ is the certified interval ledger for the finite parts, threshold entries, and $Z_i$ entries, $\mathcal H_{\mathrm{RHG}}$ is either $\varnothing$ or an accepted spectral-action Higgs ledger $\mathfrak S_{\mathrm{SA}}(P)$ in the sense of Definition X.9.6h.4, $\mathcal M_{\mathrm{RHG}}$ is the matching map from $\widetilde X$ to the running-coupling ledger, $\mathcal B_{\mathrm{tail}}$ is the finite heat/zeta tail bound, $\mathcal S_{\mathrm{scheme}}$ is the renormalization and scheme ledger, $\mathfrak Z_{\mathrm{RHG}}$ is the master zeta-index ledger label through which any shared flavor, baryogenesis, primordial determinant, or vacuum-prefactor source descends, and $\chi_{\mathrm{RHG}}$ records that no component was selected using $v$, $m_H$, $\alpha(M_Z)$, $\sin^2\theta_W(M_Z)$, Yukawa values, CKM data, PMNS data, baryogenesis data, the validation tuple $(15.14,20.94,18.41)$, or any row already fixed downstream.

If $\mathcal H_{\mathrm{RHG}}=\varnothing$, the record claims no values for $\mu_H^2$, $\lambda_H$, $Z_H$, or spectral-action Higgs finite parts. If $\mathcal H_{\mathrm{RHG}}\ne\varnothing$, those Higgs entries are exactly the intervals supplied by $\mathfrak S_{\mathrm{SA}}(P)$ and may not be retuned inside the RHG threshold record.

**Theorem T.78.11 (RHG Electroweak Certificate Non-Contamination).** If $\mathfrak R_{\mathrm{RHG}}$ is accepted before validation comparison, then the electroweak threshold vector $\Delta_{\mathrm{RHG}}$, the wavefunction vector $Z_{\mathrm{RHG}}$, the interval ledger $\mathcal I_{\mathrm{RHG}}$, and the matching map $\mathcal M_{\mathrm{RHG}}$ have theorem-level determinacy within their certified intervals on the RHG branch. Conversely, if any entry is chosen using validation observables listed in $\chi_{\mathrm{RHG}}$, or if any finite-part convention, projector, grading, tail bound, matching map, master-ledger label, or normalization is changed after a dependent row is fixed, the record is not an RHG derivation and the corresponding electroweak result remains validation-level or belongs to a distinct branch.

*Proof.* Theorem T.78.7 proves that a completed RHG certificate determines the global flag-lift spectral gate. Definition T.78.10 adds the threshold vector, $Z_i$ vector, interval ledger, matching map, tail bound, scheme ledger, master-ledger label, and optional Higgs ledger as finite entries, all fixed before validation comparison. Therefore the electroweak threshold output is the deterministic image of a finite accepted record and has exactly the interval certified by $\mathcal I_{\mathrm{RHG}}$ and $\mathcal B_{\mathrm{tail}}$. If an entry is chosen using a validation observable, then two records agreeing on the pre-validation structural data but differing only by the validation-dependent choice yield different outputs after seeing the target; this violates the forward-lock condition $\chi_{\mathrm{RHG}}$. If a finite-part convention, projector, grading, tail bound, matching map, master-ledger label, or normalization is changed after a dependent row is fixed, Theorem X.9.6g.4 identifies the altered object as a different branch. Such a record is not a derivation from the original PU branch but a validation fit or a new branch. ∎

**Theorem T.78.12 (RHG Finite-Data Necessity).** The RHG electroweak threshold sector is theorem-level numerical only if the accepted record $\mathfrak R_{\mathrm{RHG}}$ supplies the actual finite matrices, finite block projections, parity and grading data, determinant-line construction, structural triple, retained finite spectral sums, Dynkin-index map, finite-part prescription, scheme ledger, matching map, master zeta-index label, and heat/zeta tail bounds required by Definition T.78.10. Higgs-sector coefficients $\mu_H^2$, $\lambda_H$, $Z_H$, and spectral-action Higgs finite parts are theorem-level numerical only if the same record contains an accepted $\mathfrak S_{\mathrm{SA}}(P)$ in the sense of Definition X.9.6h.4. If those entries are not present, the sector is not numerically determined by the prior PU branch.

*Proof.* Theorem T.78.7 makes the threshold output a deterministic image of the finite RHG certificate. The map uses, in order, the RHG block matrices, projected involutions, parity and grading data, determinant line, structural triple, retained eigenvalues, finite zeta sums, tail bounds, Dynkin-index map, and matching map. Omit any one of these entries. Then there exist distinct admissible completions of the missing finite datum that still satisfy the already-stated abstract requirements but yield different retained spectra or different finite parts. The Dynkin-index map and matching map are deterministic after the finite parts are fixed, so different finite parts produce different threshold vectors. The equality $Z_i=1+\Delta_i/24$ transfers the same non-uniqueness to the $Z_i$ slots. The Higgs coefficients require the additional spectral-action data listed in Definition X.9.6h.4 and Theorem X.9.6h.5; without that ledger, $\mu_H^2$, $\lambda_H$, $Z_H$, and Higgs finite parts have no accepted finite operator source. By Theorem P.14.1f, the prior branch without the missing finite datum cannot determine a unique electroweak threshold or Higgs-sector output. ∎

**Remark T.78.13 (Definite Answer to the RHG-Certificate Question).** The concrete RHG certificate demanded by the finite program is the finite record listed in Definition T.78.10. Until that record is supplied, the present manuscript proves the non-identifiability of the threshold tuple from the prior branch alone. Therefore the definite pre-certificate status is
$$
\Delta^{\mathrm{RHG}}
\quad\text{is not a derived theorem-level threshold tuple.}
\tag{T.78.13}
$$
The validation tuple $(15.14,20.94,18.41)$ remains a validation target available only for post-comparison after an independently fixed certificate has passed Algorithm T.78.6a and Definition T.78.10. A future branch may be integrated only by supplying the Peter-Weyl branching ledger, RHG block matrices, compatibility projectors, spectrahedron minimizer, heat-kernel finite parts, scheme ledger, and Corollary T.69.1 tail intervals before comparison with that tuple.

An octad, Steiner, Mathieu, or Golay character formula may be used as a construction of the sector/parity block data only if it supplies the exact sector characters, Dynkin-index map, multiplicities, finite matrices or homogeneous $H$-types, canonical $\mathrm{MS2}_{\mu_G}$ finite parts, and tail intervals required by Theorem T.78 or Definition T.78.6. A raw octad sum, a post-comparison numerical match, or an identity involving the numbers $759$, $196560$, or the Steiner incidence constants is not a threshold certificate. If the accepted interval misses the validation tuple, the branch is rejected rather than retuned.

**Theorem T.78.14 (Finite No-Go Classification for PU-Internal Electroweak Gauge-Higgs Source Records).** Let $\mathscr E_{\mathrm{EW}}^{\mathrm{cur}}$ be the class of electroweak threshold and Higgs finite-part source records that use only the current PU-internal ledger data already fixed before Definition T.78.10, together with the schema-level acceptance formats of Definition T.78.6, Definition T.78.5a, Definition X.9.6g, Definition X.9.6h.4, and Definition P.14.1m. Then no element of $\mathscr E_{\mathrm{EW}}^{\mathrm{cur}}$ is an accepted record of any of the following types:
$$
\mathfrak R_{\mathrm{RHG}},
\qquad
\mathfrak C_{\mathrm{tor}},
\qquad
\mathfrak S_{\mathrm{SA}}(P),
\qquad
\mathfrak S_{\mathrm{EW}}^{\mathrm{equiv}}.
\tag{T.78.14.1}
$$
Here $\mathfrak S_{\mathrm{EW}}^{\mathrm{equiv}}$ denotes any equivalent completed spectral tuple intended to supply the same threshold or Higgs finite-part entries.

Equivalently, in the current PU-internal manuscript certificate ledger,
$$
\operatorname{Acc}_{\mathrm{cur}}(\mathfrak R_{\mathrm{RHG}})
=
\operatorname{Acc}_{\mathrm{cur}}(\mathfrak C_{\mathrm{tor}})
=
\operatorname{Acc}_{\mathrm{cur}}(\mathfrak S_{\mathrm{SA}}(P))
=
\operatorname{Acc}_{\mathrm{cur}}(\mathfrak S_{\mathrm{EW}}^{\mathrm{equiv}})
=
\varnothing.
\tag{T.78.14.2}
$$
Thus the current PU-internal ledger contains no certified interval for
$$
\Delta_i,
\qquad
Z_i=1+\frac{\Delta_i}{24},
\qquad
\mu_H^2,
\qquad
\lambda_H,
\qquad
\text{or any claimed gauge/Higgs finite part arising from an electroweak spectral source.}
\tag{T.78.14.3}
$$
The corresponding manuscript-ledger value is $\varnothing_{\mathrm{cert}}$, meaning that no accepted certificate interval exists in the present PU-internal branch. This is a negative closure of the current source class, not a numerical interval or a populated machine-registry output.

The classification exhausts the source alternatives as follows.

1. The RHG route is not accepted without the finite sector projections, parity and grading data, determinant-line construction, finite block matrices, structural triple, finite heat/zeta sums, finite-part prescription, Dynkin-index map, scheme ledger, matching map, tail constants, master zeta-index label, and forward-lock entries required by Definition T.78.10 and Theorem T.78.12.

2. The torsion route is not accepted without the explicit finite torsion elements, determinant-line orientation, anomaly-compatible hypercharge projection, torsion norm or zeta finite-part prescription, Dynkin-index descent, scheme ledger, matching map, tail constants, and forward-lock entries required by Definition T.78.5a and Theorem T.78.5b.

3. The spectral-action route is not accepted without the first-order Dirac certificate, cutoff function, projection list, parity and grading data, heat coefficients, subtraction order, finite-part scale, tail bound, and normalization map producing certified intervals for $g_i^{-2}$, $Z_H$, $\mu_H^2$, $\lambda_H$, finite threshold parts, $\Delta_i$, and $Z_i$ required by Definition X.9.6h.4 and Theorem X.9.6h.5.

4. Any equivalent spectral tuple is not accepted unless it contains a named finite operator source, the same determinant-compatible hypercharge and Dynkin-index maps, the same finite-part and tail certificates, the same matching map, and a registry entry satisfying Definition P.14.1m.

No validation value, raw octad sum, Steiner incidence count, Golay identity, target-shift normalization, or post-comparison finite-part choice supplies any missing entry in (1)--(4). If a future source is appended, it is a new branch with its own registry entry and cannot modify any row already fixed through another finite-part convention, projector, tail bound, grading, normalization, or master zeta-index ledger. If the same source is cited by flavor, baryogenesis, primordial determinants, or vacuum prefactors, every projection and finite part must descend from one accepted master zeta-index ledger; otherwise Theorem X.9.6g.4 and Definition P.14.1m reject the shared claim. Therefore no double counting occurs between the current bulk threshold schema, interface matching, electromagnetic projection, curvature or determinant sectors, spectral-action Higgs terms, flavor, baryogenesis, primordial determinant, vacuum-prefactor, or future symmetry-residual entries.

*Proof.* Theorem T.78.12 proves finite-data necessity for the RHG threshold route. Theorem T.78.5b proves that the torsion route is positive only after the finite torsion certificate supplies the determinant, finite-part, index, scheme, matching, and tail data listed there. Theorem X.9.6h.5 proves that the spectral-action route is positive only after an accepted spectral-action ledger supplies the Dirac certificate, cutoff, projections, heat coefficients, finite-part prescription, tail, normalization map, and interval ledger. Definition P.14.1m and Algorithm P.14.1m.0 allow a non-closed numerical sector to be promoted only by an accepted finite certificate, an all-completions equivalence theorem, or a no-go theorem excluding the candidate class. The current PU-internal ledger contains the acceptance schemas but not the finite matrices, torsion data, Dirac certificate, heat coefficients, finite-part scale, tail constants, normalization intervals, or master-ledger descent maps needed by any positive source. By Theorem P.14.1f, omitting any such finite datum permits distinct admissible completions with different finite parts, so no unique theorem-level value is determined. This proves (T.78.14.1)--(T.78.14.3). The no-retuning and no-double-counting clauses follow from Theorem X.9.6g.4, Definition P.14.1m, and the forward-lock clauses in Definition T.78.10 and Definition X.9.6h.4. ∎

**Theorem T.79 (Conditional Closure of the Quantitative Parameter Sector).** On a fixed PU structural branch with a fixed-loop-order SM RG system, suppose:
1. the determinant-model branch fixes $A_{EW}$ before comparison whenever $v$ or a quantity depending on $v$ is requested;
2. a completed flag-lift spectral calculation provides a definite threshold triplet $\Delta$;
3. the flavor-geometric residual data $(\mathcal T_{E_8},\mathcal V)$ are fixed on the selected branch;
4. the CP-profile data $\mathcal B$ are fixed;
5. the accepted moment-map datum of Definition T.22a fixes $\gamma=1$ wherever the unit target-shift branch is used;
6. an accepted quartic matching record $\mathfrak M_\lambda$ fixes the map from $\lambda_{\mathrm{PU}}(\mathfrak A_{PU})$ to a renormalized SM boundary at a declared scale and scheme; and
7. every marginality, decoupling, and pole/observable conversion convention used in the Higgs row is fixed before comparison.
Then the quantitative Appendix-T parameter vector
$$
\Pi_T \;=\; \bigl(\sin^2\theta_W(M_Z),\,g_i(\mu_G),\,v,\,m_H,\,Y_u,\,Y_d,\,Y_e,\,m_{\nu_a},\,V_{\mathrm{CKM}},\,U_{\mathrm{PMNS}}\bigr)
$$
is uniquely determined on that fully specified branch.

*Proof.* The fixed determinant-model input $A_{EW}$ determines $v=A_{EW}e^{-\kappa_{EW}}M_{Pl}$ on its stated branch. Theorem T.78 fixes $\Delta$ once the spectral problem is completed; Theorem T.71 then fixes the gauge/RG sector. Theorems T.72–T.73 fix the Yukawa ratios on the chosen flavor branch, and Theorems T.74–T.76 fix the CP sector. The moment-map datum fixes the elastic quartic, while $\mathfrak M_\lambda$ and the declared criticality/RG/pole conventions fix the Higgs boundary and its observable conversion. Combining these inputs determines every component of $\Pi_T$. Omitting item 1 leaves $v$ open; omitting items 5–7 leaves the Higgs component open. ∎

**Corollary T.79.1 (Status Boundary for the Quantitative Appendix-T Sector).** On a fixed PU structural branch, the deterministic machinery contains no further continuous ambiguity only after $A_{EW}$ and its determinant-model convention when $v$ is requested, the completed spectral input $\Delta$, any residual heavy-threshold ledger $\delta$, the residual flavor-profile data $(\mathcal T_{E_8},\mathcal V,\mathcal B)$, the moment-map target-shift datum, the quartic matching record $\mathfrak M_\lambda$, and all criticality, decoupling, and pole/observable conventions used by the requested outputs are fixed. In the canonical minimal $\mathrm{MS2}_{\mu_G}$ ledger, $\delta_i=0$ and the gauge-threshold input is exactly the completed flag-lift spectral output of Theorem T.78; this closes neither the determinant-model $v$ row nor the independent Higgs or flavor gates. ∎

**Theorem T.79.2 (Appendix-T Deterministic Matching Functor).** Fix an Appendix-T input record
$$
\mathfrak I_T
=
(A_{EW},\mathfrak S_{\widetilde X},\delta^{\mathrm{heavy}},\mathcal T_{E_8},\mathcal V,\mathcal N_\nu,\mathcal B,\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}}),
$$
where $A_{EW}$ is the forward-locked determinant-model prefactor of Theorem T.29.2 when $v$ or a $v$-dependent output is requested, $\mathfrak S_{\widetilde X}$ is a completed flag-lift spectral tuple in the sense of Theorem T.78, $\delta^{\mathrm{heavy}}$ is either the empty minimal residual ledger or an explicitly listed nonminimal heavy-threshold ledger, $(\mathcal T_{E_8},\mathcal V)$ are the selected flavor-geometric normalization and Van Vleck data, $\mathcal N_\nu$ is the neutrino/Majorana branch record of Proposition T.24.28, $\mathcal B$ is the selected CKM/PMNS CP-profile data, $\mathcal M_\gamma$ is the accepted target-shift datum of Definition T.22a when the unit branch is used, $\mathfrak M_\lambda$ is the quartic matching record of Definition T.25.2, $\mathcal C_{\mathrm{crit}}$ records any independently imposed marginal-trajectory condition, $\mathcal R_{\mathrm{RG}}$ is the fixed loop-order SM RG system with matching scale $\mu_G$, $\mathcal C_{\mathrm{dec}}$ is the fixed decoupling convention, and $\mathcal C_{\mathrm{pole}}$ is the fixed pole/observable conversion convention. Then there is a deterministic map
$$
\mathfrak F_T:\mathfrak I_T\longmapsto \Pi_T
$$
defined by the following ordered operations:

1. evaluate $v=A_{EW}e^{-\kappa_{EW}}M_{Pl}$ on the registered determinant-model branch when that output is requested;
2. evaluate the sector finite parts $F_s$ from $\mathfrak S_{\widetilde X}$ and set $\Delta=TF$ and $Z_i=1+\Delta_i/24$;
3. append the residual ledger by setting $\delta_i=0$ on the canonical minimal ledger and otherwise adding only the explicitly listed heavy-threshold shifts;
4. form the gauge boundary data at $\mu_G$ from Theorems T.13--T.17 and T.35, and form a Higgs boundary only from the separately fixed tuple $(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}})$ together with Theorems T.25--T.28;
5. form the charged-fermion and neutrino Yukawa boundary data from $(\mathcal T_{E_8},\mathcal V,\mathcal N_\nu)$;
6. form the CKM and PMNS matrices from the fixed CP-profile record $\mathcal B$;
7. evolve the boundary vector by the fixed RG system $\mathcal R_{\mathrm{RG}}$, apply $\mathcal C_{\mathrm{dec}}$, and convert to the requested pole or observable convention using $\mathcal C_{\mathrm{pole}}$.

The map is functorial only with respect to isomorphisms preserving every component of $\mathfrak I_T$. In particular, such an isomorphism preserves $A_{EW}$ and its determinant-model convention, the completed spectral and heavy-threshold records, and the full pole-level tuple $(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}})$. It may relabel equivalent flavor bases and CP-profile representatives, inducing the corresponding relabeling of Yukawa and mixing matrices, but it cannot manufacture or retune a scalar input and leaves every basis-invariant component of $\Pi_T$ unchanged.

*Proof.* In Step 1, the specified entries $A_{EW}$, $\kappa_{EW}$, and the Planck normalization determine one value of $v$. The completed spectral tuple determines one $F$, hence one $\Delta=TF$, by Theorem T.78. Definition T.19a and Proposition T.19c then determine the residual-threshold operation in Step 3. In Step 4, $(Z_i,\delta_i)$ determine the gauge boundary algebraically, while the explicitly supplied tuple $(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}})$ determines the Higgs boundary. Theorems T.72--T.76 make Steps 5 and 6 deterministic after the flavor, neutrino, and profile records are supplied.

For Step 7, the complete record includes the specified RG system and, on every requested output interval, the full-interval perturbative-solution hypothesis of Theorem T.71. That theorem gives a unique RG trajectory from the specified boundary vector. The maps $\mathcal C_{\mathrm{dec}}$ and $\mathcal C_{\mathrm{pole}}$ are supplied functions in the input record, so their composition with that trajectory is unique. Thus every ordered step is a function of the preceding supplied data, and their composition defines the deterministic map $\mathfrak F_T$. An isomorphism preserving every input commutes with each of these operations, which proves the stated functoriality and leaves no ambiguity beyond the complete input record. ∎

**Proposition T.79.3 (Electroweak, Higgs, Flavor, Neutrino, Majorana, and Common-Scale Dependency Ledger).** The dependency record for the Appendix-T matching, Higgs, flavor, and neutrino sectors is the following finite ledger.

| Input or convention | Role | Status at point of use | Uncertainty class carried forward | Affected outputs |
|:--|:--|:--|:--|:--|
| Completed $\Delta$ from $\mathfrak S_{\widetilde X}$ | ThresholdData | branch theorem after Theorem T.78 data are fixed; validation target if not fixed | T2 until spectral branch is completed | $g_i$, $\sin^2\theta_W$, RG boundary data |
| Residual $\delta_i$ | ThresholdData / SchemeScale | exact empty ledger value $0$ in the canonical minimal $\mathrm{MS2}_{\mu_G}$ ledger; nonminimal only if an explicit heavy ledger is appended | T2 for nonminimal heavy thresholds | gauge matching and all RG-propagated observables |
| $\mu_G$ and common-scale transport | SchemeScale | fixed gauge-matching convention on the adopted branch; not an identification with $\mathfrak A_{PU}$ or $\mu_\lambda$ | T2 for matching convention; T3 for empirical extraction comparisons | gauge, Yukawa, neutrino, and common-scale tables |
| $\mathcal M_\gamma$ | target-shift datum | branch-defining; unit value only after (T.22a.2)--(T.22a.3) are accepted | T2 | $\lambda_{\mathrm{elastic}}$, $\lambda_{\mathrm{PU}}$, and every downstream Higgs row |
| $\mathfrak M_\lambda$ and $\mathcal C_{\mathrm{crit}}$ | PU-to-SM quartic matching and marginality data | currently no accepted matching record; marginality is an additional branch input | T2 | SM quartic boundary, top criticality relation, and $m_H$ |
| $\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}}$ | RG scheme, decoupling, and running-to-pole conversion | branch-defining and fixed before comparison; no accepted PU-internal pole record currently closes the Higgs row | T2, with T3 for experimental pole extraction | $m_H$ and every pole-level observable |
| $A_{EW}$ | determinant-model prefactor | model layer by Theorem T.29.2 | model allowance at the stated working order | $v$, quantities using $v/M_{Pl}$, and transferred prefactor rows |
| $(\mathcal T_{E_8},\mathcal V)$ | flavor-geometric ThresholdData / model profile | branch-fixed data for Theorems T.72-T.73 | T1 for geometric truncations; T2 for branch and normalization choices | charged-lepton and quark Yukawa ratios and normalizations |
| top-sector normalization $y_t(\mu_G)=1$ | boundary normalization | branch boundary condition | T2 | absolute Yukawa scale and seesaw normalization |
| Majorana A₂ geometry and anchored neutrino reading | branch geometry | branch/model layer as recorded in Proposition T.24.28 | T2 | neutrino mass hierarchy and PMNS geometry |
| type-I seesaw and $M_R=\mu_G$ identification | sector-linking identification | conditional branch input | T2 | absolute light-neutrino masses |
| CKM/PMNS CP-loop, response, and profile data $\mathcal B$ | PhenomenologicalKernel / ThresholdData | branch-fixed loop, response, orientation, and profile data | T2 for response/profile branches; T3 for phase-convention or extraction comparisons | CKM, PMNS, Jarlskog, baryogenesis CP factors |
| common-scale quark reductions | SchemeScale / EmpiricalInput for comparison | comparison convention, not derivation input | T3 | quark-ratio validation tables |
| baryogenesis washout and thermal factors | PhenomenologicalKernel | Appendix Y model layer unless separately derived | T2, with T3 only for observational extraction | $\eta_B$ comparison |

No empirical mass, mixing, or pole value is permitted to enter the derivation side of this ledger. Empirical quantities may appear only in the comparison columns governed by Convention P.14.1c.

*Proof.* The threshold rows follow from Theorem T.78, Definition T.19a, Proposition T.19c, and Corollary T.78.3. The target-shift row follows from Definition T.22a and Theorem T.22b; the quartic-matching and marginality row follows from Definition T.25.2 and Theorem T.26; and the RG, decoupling, and pole row is the explicit observable-conversion gate of Theorem T.79.2. The matching-scale and common-scale rows follow from the stated RG/matching conventions and Section T.25.5.3. The $A_{EW}$ row follows from Theorem T.29.2. The flavor-geometric rows follow from Theorems T.72–T.73 and Proposition R.3.5f; the Majorana, seesaw, and anchored-reading rows follow from Theorems T.24.11–T.24.15 and Proposition T.24.28. The CKM/PMNS row follows from Theorems T.74–T.76, and the baryogenesis row inherits the Appendix Y model inputs. Each role and uncertainty class is therefore explicit and propagates by the meet rule of Convention P.14.1d without importing empirical comparison values into the derivation side. ∎

**Remark T.79.4.0 (Anchor to the Global Ledger).** Definition T.79.4 supplies the local strict PPI/PCE certificate of the flavor parameter row in Convention P.14.1k. Algorithm T.79.5 is the acceptance test and Theorem T.79.6 the local determinacy theorem. Definition T.79.8a packages the joint RHG-flavor-Higgs certificate together with the forward-locked $A_{EW}$ scale input, and Theorem T.79.8b is its joint determinacy theorem. An accepted $\mathfrak C_{\mathrm{fl}}$ closes only the flavor row; $\mathfrak J_{\mathrm{RHG-fl}}$ closes each additional component only because its threshold, scale, and Higgs slots are explicit.

**Definition T.79.4 (Flavor Completion Certificate).** A flavor completion certificate is a finite record
$$
\mathfrak C_{\mathrm{fl}}
=
\left(
\mathcal X_{\mathrm{fl}},
\mathcal A_{\mathrm{fl}},
\mathcal H_{\mathrm{fl}},
\mathcal V_{\mathrm{fl}},
\mathcal B_{\mathrm{fl}},
\mathcal N_{\mathrm{fl}},
\mathcal R_{\mathrm{fl}},
\chi_{\mathrm{fl}}
\right)
\tag{T.79.4.1}
$$
fixed before comparison with charged-lepton, quark, neutrino, CKM, PMNS, strong-CP, or baryogenesis data, where:

1. $\mathcal X_{\mathrm{fl}}$ is the retained finite flavor cell, generation-vacuum locations, residual symmetry ledger, positive-orientation real-Yukawa determinant branch, Majorana/seesaw branch, and sterile-response status.
2. $\mathcal A_{\mathrm{fl}}$ is the specified finite PCE-compatible flavor action, including all stationary actions and the rule assigning those stationary actions to charged-lepton, quark, Dirac-neutrino, and Majorana entries.
3. $\mathcal H_{\mathrm{fl}}$ is the finite Hessian, Van Vleck, and Quillen determinant package for the retained stationary points, computed as the second variation of $\mathcal A_{\mathrm{fl}}$ on the same Bures/Kähler-Einstein flavor metric and finite measure used for normalization. A Ricci identity for the homogeneous metric fixes metric scale only; it does not replace the action Hessian.
4. $\mathcal V_{\mathrm{fl}}$ is the Berry/holonomy package for relative determinant-line phases, including determinant-line connection, loop representatives, surface choices where used, CKM and PMNS phase profiles, strong-CP determinant orientation, and, whenever a real Yukawa determinant orientation is claimed, either the nonzero-path data of Theorem K.6.9 or the ordered heat-kernel chamber data of Corollary K.6.9a.1.
5. $\mathcal B_{\mathrm{fl}}$ is the finite threshold bridge from an accepted electroweak spectral record to the flavor scale, including the common-scale convention, top-normalization branch, $M_R=\mu_G$ branch or its replacement, decoupling map, and compatibility with any shared master zeta-index ledger.
6. $\mathcal N_{\mathrm{fl}}$ is the absolute Yukawa normalization and measure convention, including the Quillen norm, Van Vleck-Morette determinant, finite measure normalization, RG scheme, loop order, pole/running conversion convention, Majorana phases, seesaw normalization, and the convention for reporting charged-fermion and quark masses.
7. $\mathcal R_{\mathrm{fl}}$ is a rigorous residual and truncation interval for every listed flavor observable: charged-fermion masses, quark masses, neutrino masses, CKM entries and phase, PMNS entries and phases, determinant orientation, and $\bar\theta$.
8. $\chi_{\mathrm{fl}}$ records that no component, normalization, holonomy loop, Majorana phase, $M_R$ value, top normalization, threshold bridge, or residual interval was selected using the observed flavor data being predicted.

**Algorithm T.79.5 (Acceptance Test for the Flavor Completion Certificate).** The certificate $\mathfrak C_{\mathrm{fl}}$ is accepted if and only if each generation-vacuum location, stationary point, stationary action, and holonomy path is generated by the finite branch data already fixed in Appendices G, R, and T; the PCE-compatible action $\mathcal A_{\mathrm{fl}}$ is specified before comparison; the Hessian, Van Vleck, and Quillen determinants are computed with the same Bures/Kähler-Einstein metric, finite measure, and normalization convention as $\mathcal N_{\mathrm{fl}}$; the Berry holonomies and CP profiles are computed from the listed determinant-line connection and loops; every determinant-orientation and strong-CP claim is certified either by the nonzero-path condition of Theorem K.6.9 or by the ordered heat-kernel chamber condition of Corollary K.6.9a.1; the threshold inputs are taken only from an accepted $\mathfrak R_{\mathrm{RHG}}$, accepted $\mathfrak C_{\mathrm{tor}}$, accepted $\mathfrak S_{\mathrm{SA}}(P)$ where Higgs finite parts are claimed, accepted joint $\mathfrak J_{\mathrm{RHG-fl}}$, or another completed spectral tuple satisfying Theorem T.78; the top normalization, $M_R=\mu_G$ or its replacement, Majorana phases, seesaw branch, RG system, decoupling convention, and pole/running map are fixed before comparison; the residual interval $\mathcal R_{\mathrm{fl}}$ is bounded before empirical comparison; and $\chi_{\mathrm{fl}}$ is satisfied. If any one of these entries is inferred from masses, mixings, phases, or $\bar\theta$, the certificate is rejected.

**Theorem T.79.6 (Certified Flavor Determinacy).** If $\mathfrak C_{\mathrm{fl}}$ is accepted, then the charged-lepton, quark, neutrino, CKM, PMNS, determinant-orientation, and $\bar\theta$ outputs assigned to that certificate are uniquely determined up to the certified interval $\mathcal R_{\mathrm{fl}}$. If no accepted $\mathfrak C_{\mathrm{fl}}$ exists, those outputs remain model-layer, validation-layer, or branch-classification statements.

*Proof.* The flavor observables in Appendix T are functions of finite generation placement, the specified PCE-compatible flavor action, stationary-point actions, Hessian and Van Vleck determinants, Quillen normalization, determinant-line orientation, Berry/holonomy phases, accepted electroweak threshold maps, RG running, pole/running conversion, Majorana/seesaw data, strong-CP determinant orientation, and absolute normalization. Definition T.79.4 fixes each of these entries as a finite record and Algorithm T.79.5 requires the record to be fixed before empirical comparison. Therefore each listed observable is the image of one finite tuple under deterministic algebraic, spectral, determinant-line, and RG operations, with uncertainty only from the finite residual interval $\mathcal R_{\mathrm{fl}}$. If the certificate is absent, at least one required finite entry is unspecified; then the corresponding output is not determined by the branch and must remain model-layer, validation-layer, or branch-classification data. ∎

**Corollary T.79.7 (No Flavor Back-Fitting).** A flavor output may be promoted by Appendix T only through an accepted $\mathfrak C_{\mathrm{fl}}$. Changing generation placement, normalization, holonomy path, threshold input, or residual width after comparison defines a different flavor branch and cannot confirm the original one.

*Proof.* Each listed quantity is an entry of $\mathfrak C_{\mathrm{fl}}$. The forward-lock condition $\chi_{\mathrm{fl}}$ forbids selecting these entries from the target data. A post-comparison change therefore changes the certificate itself. ∎

**Corollary T.79.8 (Flavor Non-Identifiability Without $\mathfrak C_{\mathrm{fl}}$).** The charged-lepton, quark, neutrino, CKM, and PMNS numerical outputs are not theorem-level determined unless $\mathfrak C_{\mathrm{fl}}$ is accepted. In particular, exact $N_g=3$ and the SM gauge algebra do not by themselves determine masses, mixings, or CP phases.

*Proof.* The SM gauge algebra and $N_g=3$ determine the representation class and the number of family copies, but not the finite stationary-point actions, Hessian determinants, Berry holonomies, threshold map, absolute Yukawa normalization, or residual interval listed in Definition T.79.4. Varying any of these unspecified finite entries while preserving the gauge algebra and three-generation ledger changes at least one flavor mass or mixing output. Theorem P.14.1f therefore forbids theorem-level numerical promotion without the accepted flavor certificate. ∎

**Definition T.79.8a (Joint RHG-Flavor-Higgs Matching Certificate).** A joint RHG-flavor-Higgs matching certificate is a finite record
$$
\mathfrak J_{\mathrm{RHG-fl}}
=
\left(
\mathfrak R_{\mathrm{RHG}},
\mathfrak C_{\mathrm{fl}},
A_{EW},
\mathfrak H_T,
\mathfrak Z_{\mathrm{PU}},
\mathcal I_{\mathrm{mix}},
\mathcal R_{\mathrm{joint}},
\chi_{\mathrm{joint}}
\right),
\qquad
\mathfrak H_T
:=
(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}}).
\tag{T.79.8a}
$$
where:

1. $\mathfrak R_{\mathrm{RHG}}$ is an accepted forward-locked RHG record of Definition T.78.10.

2. $\mathfrak C_{\mathrm{fl}}$ is an accepted flavor completion certificate of Definition T.79.4.

3. $A_{EW}$ is the forward-locked determinant-model prefactor of Theorem T.29.2 whenever $v$ or a $v$-dependent observable is included.

4. $\mathfrak H_T$ is the independently accepted Higgs target-shift, PU-to-SM quartic-matching, marginality, RG, decoupling, and pole-conversion tuple. The threshold and flavor certificates do not supply it by implication.

5. $\mathfrak Z_{\mathrm{PU}}$ is the master spectral ledger used for the RHG thresholds and flavor stationary data; it also records any claimed spectral-action Higgs finite parts, which remain distinct from $\mathfrak H_T$ unless an explicit matching map identifies them.

6. $\mathcal I_{\mathrm{mix}}$ is the finite integrability ledger recording all mixed finite-part derivatives shared by RHG thresholds, Yukawa normalizations, CKM/PMNS holonomies, neutrino-sector entries, and any linked Higgs finite parts:
$$
\partial_{t_a}\partial_{t_b}\log\det_{\mathrm{PU}}
=
\partial_{t_b}\partial_{t_a}\log\det_{\mathrm{PU}}
\tag{T.79.8a.1}
$$
on every common chamber used by the certificate.

7. $\mathcal R_{\mathrm{joint}}$ is the joint residual interval after propagating the $A_{EW}$ model allowance, RHG tail bounds, flavor Hessian/Van Vleck bounds, holonomy bounds, Higgs matching, RG truncation, decoupling, and pole-conversion bounds.

8. $\chi_{\mathrm{joint}}$ records that no component is selected using observed $v$, Higgs, charged-lepton, quark, neutrino, CKM, PMNS, baryogenesis, or validation-threshold data.

**Theorem T.79.8b (Joint RHG-Flavor-Higgs Determinacy).** If $\mathfrak J_{\mathrm{RHG-fl}}$ of Definition T.79.8a is accepted, then the electroweak/flavor/Higgs observable vector
$$
\Pi_T
=
\bigl(
\sin^2\theta_W(M_Z),g_i(\mu_G),v,m_H,
\Delta_i,Z_i,
Y_u,Y_d,Y_e,m_{\nu_a},
V_{\mathrm{CKM}},U_{\mathrm{PMNS}},
\mathfrak o_{\det},\bar\theta
\bigr)
\tag{T.79.8b.1}
$$
is uniquely determined up to $\mathcal R_{\mathrm{joint}}$. The $v$ component is included only because the joint record explicitly contains forward-locked $A_{EW}$, and the $m_H$ component only because it contains $\mathfrak H_T$; neither is inferred from $\mathfrak R_{\mathrm{RHG}}$ or $\mathfrak C_{\mathrm{fl}}$. If an accepted spectral-action branch is also linked, its Higgs finite parts $(\mu_H^2,\lambda_H)$ are included only through the separately recorded spectral-action-to-$\mathfrak H_T$ matching map. Any two sector projections sharing a chamber of $\mathfrak Z_{\mathrm{PU}}$ must satisfy the identities in $\mathcal I_{\mathrm{mix}}$.

*Proof.* Theorem T.78.11 fixes the RHG threshold outputs, Theorem T.79.6 fixes the flavor outputs, $A_{EW}$ fixes the determinant-model scale $v$, and $\mathfrak H_T$ fixes the independent Higgs boundary and observable-conversion gates. The deterministic functor of Theorem T.79.2 therefore maps the complete record to one $\Pi_T$. For the common-ledger condition, shared chamber dependence is represented by finite smooth determinant or zeta functions, whose mixed partial derivatives commute. Failure of (T.79.8a.1), of the spectral-action-to-$\mathfrak H_T$ matching map when invoked, or of any forward lock rejects the joint certificate. Otherwise the remaining uncertainty is exactly $\mathcal R_{\mathrm{joint}}$. ∎

**Corollary T.79.8c (No Independent RHG-Flavor-Higgs Refit).** Once $\mathfrak J_{\mathrm{RHG-fl}}$ is accepted, changing $A_{EW}$, RHG block matrices, heat/zeta tail bounds, stationary flavor cells, Hessian determinants, holonomy paths, neutrino branch data, $\mathcal M_\gamma$, $\mathfrak M_\lambda$, marginality, RG/decoupling/pole conventions, or residual intervals after comparison defines a new joint branch and cannot confirm the original one.

*Proof.* Each listed object is either the explicit $A_{EW}$ slot or an entry of $\mathfrak R_{\mathrm{RHG}}$, $\mathfrak C_{\mathrm{fl}}$, $\mathfrak H_T$, $\mathfrak Z_{\mathrm{PU}}$, $\mathcal I_{\mathrm{mix}}$, or $\mathcal R_{\mathrm{joint}}$. The forward-lock condition $\chi_{\mathrm{joint}}$ forbids selecting any such entry from validation targets. ∎

**Corollary T.79.8d (Electroweak-Flavor-Higgs Row Closure Criterion).** The electroweak threshold tuple and flavor parameter vector are theorem-level numerical rows exactly on branches carrying one of the following records fixed before comparison:

1. an accepted forward-locked RHG record $\mathfrak R_{\mathrm{RHG}}$ together with an accepted flavor certificate $\mathfrak C_{\mathrm{fl}}$;
2. an accepted torus-threshold record $\mathfrak C_{\mathrm{tor}}$ satisfying the same threshold slots together with $\mathfrak C_{\mathrm{fl}}$;
3. an accepted spectral-action record $\mathfrak S_{\mathrm{SA}}(P)$ satisfying the threshold slots together with $\mathfrak C_{\mathrm{fl}}$;
4. an accepted joint certificate $\mathfrak J_{\mathrm{RHG-fl}}$ of Definition T.79.8a.

For items 1–3, a claimed $v$ row additionally requires forward-locked $A_{EW}$ on its determinant-model branch, and a claimed Higgs pole row requires the complete independently accepted tuple $\mathfrak H_T$ plus any spectral-action matching map invoked. Item 4 contains both $A_{EW}$ and $\mathfrak H_T$ by definition. Thus $\Delta_{\mathrm{EW}}$, $Z_i$, and flavor observables are deterministic images of their threshold/flavor records, $v$ only of its determinant-model record, and $m_H$ only after its separate matching, marginality, RG, decoupling, and pole gates are present. Gauge algebra, $N_g=3$, $\kappa_{\mathrm{EW}}=38.5$, and the SM matter/EWSB skeleton do not by themselves determine these numerical rows.

*Proof.* Theorems T.78.7 and T.78.11 establish threshold determinacy, Theorem T.79.6 establishes flavor determinacy, Theorem T.29.2 supplies only the explicit determinant-model $A_{EW}$ branch for $v$, and Definition T.25.2, Theorem T.26, and Theorem T.79.2 identify the separate Higgs inputs. Definition T.79.8a includes all of these records in the joint certificate, Theorem T.79.8b proves determinacy, and Corollary T.79.8c enforces the forward lock. Therefore each claimed numerical component closes exactly when its own finite inputs are accepted before comparison. ∎

**Theorem T.79.8e (Finite Flavor-Sector Classification Without an Accepted Certificate).** If neither $\mathfrak C_{\mathrm{fl}}$ nor $\mathfrak J_{\mathrm{RHG-fl}}$ is accepted, the certified interval vector for charged-fermion masses, quark masses, neutrino rows, CKM, PMNS, determinant orientation, and $\bar\theta$ is
$$
\mathcal R_{\mathrm{fl}}=\varnothing_{\mathrm{cert}}.
\tag{T.79.8e.1}
$$
The theorem-level content is the finite classification by the branch coordinates
$$
(\mathcal X_{\mathrm{fl}},\mathcal A_{\mathrm{fl}},\mathcal H_{\mathrm{fl}},\mathcal V_{\mathrm{fl}},\mathcal B_{\mathrm{fl}},\mathcal N_{\mathrm{fl}}),
\tag{T.79.8e.2}
$$
with the expanded meanings in Definition T.79.4. Changing top normalization, $M_R$, Majorana phases, determinant orientation, finite-part convention, holonomy loop, threshold bridge, RG convention, or residual width after any dependent row is fixed creates a new flavor branch and cannot validate the original one.

*Proof.* Each observable listed in (T.79.8e.1) depends on at least one entry of (T.79.8e.2). The structural gauge algebra and generation count do not specify the PCE flavor action, stationary actions, Hessians, Van Vleck or Quillen determinants, Berry loops, absolute normalization, threshold bridge, Majorana/seesaw data, RG scheme, pole convention, or strong-CP orientation. Therefore no finite function from the closed structural skeleton to the numerical flavor vector exists in the current record. The forward-lock condition in Definition T.79.4 and Algorithm T.79.5 forbids selecting missing entries from the target masses, mixings, or phases. ∎

**Theorem T.79.9 (Common-Carrier Flavor Complement Theorem).** Let $V_u,V_d:\mathbb C^3\to\mathcal H_{\mathrm{int}}$ be isometries for the retained up- and down-type flavor triples, let $P_u=V_uV_u^\dagger$, $P_d=V_dV_d^\dagger$, and define the overlap matrix
$$
C=V_u^\dagger V_d.
\tag{T.79.9.1}
$$
Then
$$
\mathbf1-C^\dagger C
=V_d^\dagger(\mathbf1-P_u)V_d\succeq0,
\qquad
\mathbf1-CC^\dagger
=V_u^\dagger(\mathbf1-P_d)V_u\succeq0.
\tag{T.79.9.2}
$$
Consequently every singular value of $C$ lies in $[0,1]$ and equals the cosine of a principal angle between $\operatorname{ran}V_u$ and $\operatorname{ran}V_d$. Moreover,
$$
\operatorname{rank}(\mathbf1-C^\dagger C)
=\operatorname{rank}\bigl((\mathbf1-P_u)V_d\bigr),
\tag{T.79.9.3}
$$
with the analogous up/down identity, and
$$
C\text{ is unitary}
\quad\Longleftrightarrow\quad
\operatorname{ran}V_u=\operatorname{ran}V_d.
\tag{T.79.9.4}
$$

*Proof.* Equation (T.79.9.2) follows by inserting the projectors and using $V_f^\dagger V_f=\mathbf1$. Each right-hand side is a Gram matrix $X^\dagger X$, which proves positivity and the rank identity. Principal-angle theory identifies the singular values of the overlap of two orthonormal frames. If the ranges coincide, the two frames differ by a unitary. Conversely, if $C$ is unitary then (T.79.9.2) vanishes, so $(\mathbf1-P_u)V_d=0$ and the two three-dimensional ranges coincide. ∎

**Corollary T.79.10 (Flavor-Leakage Falsifier).** Within an accepted isometric common-carrier model, a computed nonzero $\mathbf1-C^\dagger C$, or a measured value outside its registered uncertainty set, is the retained Gram matrix of the down-type component outside the up-type carrier rather than a unitary three-family matrix. Its rank counts the independent leaking directions and its nonzero eigenvalues are the squared sines of the corresponding principal angles. Without the accepted embedding and uncertainty certificate, apparent nonunitarity may instead be model failure or measurement/systematic error. A unitary CKM identification is theorem-level only on the common-range branch (T.79.9.4) or after the complement is explicitly included in the response certificate.

**Corollary T.79.11 (Log-Hierarchy/Jarlskog Determinant Identity).** On the common-range branch, take $C$ unitary and strictly positive Yukawa eigenvalues. Define
$$
\ell_{u,i}=\log\frac{y_{u,\max}}{y_{u,i}},
\qquad
\ell_{d,i}=\log\frac{y_{d,\max}}{y_{d,i}},
$$
$$
A_u=\operatorname{diag}(\ell_{u,1},\ell_{u,2},\ell_{u,3}),
\qquad
A_d=C\operatorname{diag}(\ell_{d,1},\ell_{d,2},\ell_{d,3})C^\dagger.
\tag{T.79.11.1}
$$
Then
$$
\left|\det[A_u,A_d]\right|
=2|J(C)|
\prod_{i<j}|\ell_{u,i}-\ell_{u,j}|
\prod_{i<j}|\ell_{d,i}-\ell_{d,j}|,
\tag{T.79.11.2}
$$
where $J(C)=\operatorname{Im}(C_{11}C_{22}C_{12}^*C_{21}^*)$ up to the common row/column orientation convention. Thus the determinant vanishes exactly when $J(C)=0$ or either logarithmic spectrum is degenerate.

*Proof.* The matrices $A_u$ and $A_d$ are Hermitian $3\times3$ matrices: $A_u$ is real diagonal and $A_d=C\operatorname{diag}(\ell_{d,1},\ell_{d,2},\ell_{d,3})C^\dagger$ is Hermitian because $C$ is unitary and the $\ell_{d,i}$ are real. The Jarlskog commutator-determinant identity [Jarlskog 1985] therefore applies and gives, for a specified common ordering of rows and columns,
$$
\det[A_u,A_d]
=2iJ(C)
\prod_{i<j}(\ell_{u,i}-\ell_{u,j})
\prod_{i<j}(\ell_{d,i}-\ell_{d,j}).
$$
The cited identity requires precisely two Hermitian $3\times3$ matrices related to their eigenbases by a unitary matrix; those hypotheses are the definitions of $A_u$, $A_d$, and $C$ in the theorem. Reversing an eigenvalue ordering changes the signs of one Vandermonde product and the orientation convention for $J(C)$, but not the absolute value. Hence
$$
\left|\det[A_u,A_d]\right|
=2|J(C)|
\prod_{i<j}|\ell_{u,i}-\ell_{u,j}|
\prod_{i<j}|\ell_{d,i}-\ell_{d,j}|.
$$
This product vanishes exactly when $J(C)=0$ or at least one pair of eigenvalues in either spectrum is equal. ∎

Equations (T.79.11.1)--(T.79.11.2) are asserted only when all three Yukawa eigenvalues in each sector are strictly positive. At a zero eigenvalue, the finite $3\times3$ identity is undefined; one may prove the positive-regulator identity at $y_i=\epsilon>0$ and report any $\epsilon\downarrow0$ limit under a separate regulator and normalization certificate. Equation (T.79.11.2) is not asserted for a nonunitary contraction $C$; in that case the complement data of Theorem T.79.9 are response-active.

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

**Corollary T.79a.1 (Boundary-Impedance Closure of Nuclear Extension Data).** For a fixed proton-neutron sector $(Z,N)$, the nuclear aggregate Hamiltonian required by Theorem T.79a is supplied at theorem level if PU supplies either:

1. a finite colorless boundary impedance map
$$
\Lambda_A^{\mathrm{PU}}(E),
\qquad
A=(Z,N),
$$
satisfying Definition X.8k.5 and Theorem X.8k.6, together with the finite spin-current and decay boundary operators for the same retained aggregate Hilbert space; or

2. an accepted finite nuclear aggregate bootstrap datum $\mathfrak B_A^{\mathrm{nuc}}$ satisfying Definition X.8k.6a and Theorem X.8k.6b.

In that case:

1. nuclear bound-state energies are the zeros of
$$
\det\Lambda_A^{\mathrm{PU}}(E)=0;
\tag{T.79a.1}
$$

2. open-channel nuclear resonances are the zeros of
$$
\det\left(\Lambda_A^{\mathrm{PU}}(E)-\Lambda_{\mathrm{out}}(E)\right)=0;
\tag{T.79a.2}
$$

3. isotope stability, shell gaps, and spin-dependent transition rates are determined by the same finite spectral data and matrix elements specified in Theorem T.79a.

*Proof.* Theorem X.8k.6 proves that the finite boundary impedance map is exactly the Schur spectral representative of the corresponding finite self-adjoint aggregate operator for all colorless boundary protocols. Therefore fixing $\Lambda_A^{\mathrm{PU}}(E)$ is equivalent, for those protocols, to fixing the spectral response of $H_A^{\mathrm{PU}}(Z,N)$ up to PPI-equivalent interior representatives. Theorem X.8k.6b supplies the same object by selecting the PCE-minimal self-adjoint aggregate completion among all admissible Hamiltonians with the accepted boundary impedance record, spin-current ledger, transition ledger, decay ledger, exterior-channel map, covariance ledger, and overlap map to Appendix T. Equation (T.79a.1) is (X.8k.18) applied to the nuclear aggregate sector, and (T.79a.2) is (X.8k.19). Once the spin-current, transition, decay, and exterior-channel operators are fixed on the same finite retained Hilbert space, the spectral theorem gives the stability, shell-gap, spin-dependent, transition-rate, decay-channel, and resonance quantities listed in Theorem T.79a. ∎

**Theorem T.79a.2 (Elementary/Nuclear Separation and Nuclear Completion Criterion).** Let $\Pi_T$ be an accepted Appendix T elementary parameter vector on a fixed electroweak/flavor branch. The nuclear observable vector
$$
\mathcal O_A^{\mathrm{nuc}}
=
\left(
\operatorname{spec}H_A,
\Delta_{\mathrm{shell}},
\mathcal M_A^{\mathrm{spin}},
\mathcal M_A^{\mathrm{tr}},
\Gamma_A^{\mathrm{dec}},
\mathcal R_A^{\mathrm{open}}
\right)
\tag{T.79a.3}
$$
is theorem-level exactly when every proton-neutron sector and every daughter or exterior channel appearing in the claimed isotope, shell, spin, transition, or decay row carries an accepted finite nuclear aggregate operator package $\mathfrak B_A^{\mathrm{nuc}}$ of Definition X.8k.6a, transported from $\Pi_T$ by $\Pi_{A\leftarrow T}$ and forward-locked before comparison. Without that package, the following entries are irreducibly nuclear effective-action or boundary-response data rather than elementary Standard Model inputs:

1. retained many-body measure and Hilbert-space truncation;
2. finite two-body, three-body, exchange, contact, spin-orbit, and finite-size operators;
3. colorless boundary impedance record $\Lambda_A^{\mathrm{PU}}(E)$;
4. exterior open-channel impedance $\Lambda_{A,\mathrm{out}}(E)$;
5. spin-current operators;
6. transition operators;
7. decay operators;
8. resonance sheet, width, and tail prescription;
9. nuclear uncertainty and covariance ledger.

Consequently, Appendix T elementary closure fixes the elementary currents, charges, masses, mixings, and coupling normalizations that may enter $\Pi_{A\leftarrow T}$, but it does not by itself close isotope stability, magic-number gaps, spin-dependent anomalies, transition rates, or nuclear decay rows.

*Proof.* The vector $\Pi_T$ contains elementary masses, gauge couplings, electroweak currents, Yukawa data, mixing matrices, and their branch conventions. It contains no finite self-adjoint many-body operator on $\mathcal H_A^{\mathrm{ret}}$, no colorless boundary impedance map, and no transition or decay operator ledger. If $\mathfrak B_A^{\mathrm{nuc}}$ is accepted, Theorem X.8k.6b makes every component of (T.79a.3) a finite spectral or matrix-element image of the accepted package, with residuals propagated through $\mathcal U_A$. Conversely, if any response-active entry in the displayed list is absent, Theorem X.8k.6c supplies two admissible finite completions agreeing on $\Pi_T$ but differing in a nuclear spectrum, matrix element, decay channel, or resonance map. Theorem P.14.1f then forbids theorem-level promotion of the nuclear row from elementary data alone. ∎