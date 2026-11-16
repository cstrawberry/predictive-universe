# Spin-three-halves mean-zero certificate: exact rational matrices

<a id="spin-three-halves-mean-zero-certificate"></a>

These companion calculations give the exact finite input tables used in [Theorem M.6.13ci](../../../appendices/appendix_m_perspectival_quantum_dynamics.md). The principal manuscript retains the hypotheses, constructive argument, coefficient identities, error bounds and positivity proof.

All indices, ordered products, adjoints and rational denominators have the conventions stated below. Matrix entries are exact integers divided by their stated denominator; no decimal approximation or implicit numerical tolerance is used. Numbered equation references in this note refer to the owning result in the principal manuscript.

## Notation, hypotheses and construction

The complete spin source
of Theorem M.6.13ch admits the following matrix-source interface. With its canonical Jordan
operator $L_B=-3\partial_\theta^2+\mathcal J_{W_B}$, let $P$ project on constant Fourier
amplitudes, $Q=I-P$, $L_0=-3\partial_\theta^2$ and $R_0=(QL_0Q)^{-1}$.
Here these $P,Q$ are Fourier projections, not charge operators. For every odd Hermitian
contraction $B$ and every finite coefficient dimension, including its independent direct
$0\leftrightarrow3$ corner, the full mean-zero Hermitian form has the bound below.
All circle measures are normalized and all traces are ordinary coefficient traces.

**Normalized matrix sources and the supported optimizer.**

Let $d\ge1$, $d\mu=d\theta/(2\pi)$, and
$$
p=(1,3,3,1)/8,\quad v_\theta=(\sqrt{p_i}e^{ii\theta})_{i=0}^3,\quad V_\theta=v_\theta\otimes I_d,
\quad \widehat Q=\operatorname{diag}(0,1,2,3)\otimes I_d,
\quad J=\operatorname{diag}(1,-1,1,-1)\otimes I_d.
$$
For a positive matrix symbol $F$ with $\int\operatorname{Tr}F\,d\mu=1$, set
$$
\tau=\int F\,d\mu,\quad
\Omega_F=\int V_\theta F_\theta V_\theta^*\,d\mu,\quad
R_F=(\Omega_F+J\Omega_FJ)/2,\quad D_F=(\Omega_F-J\Omega_FJ)/2.
$$
Write $\delta X=i[\widehat Q,X]$, and define
$$
q(F)=\sup_{B=B^*,\ JBJ=-B}\{2\operatorname{Tr}(D_FB)-\operatorname{Tr}(R_FB^2)\}.

$$
If $R_F>0$, its unique optimizer solves
$$
R_FB_F+B_FR_F=2D_F,\qquad
q(F)=\operatorname{Tr}(R_FB_F^2)=\operatorname{Tr}(D_FB_F).

$$
It is an odd contraction. For smooth uniformly positive $F$, it is a strict contraction and all the matrices in (M.6.13ci.S2) depend smoothly on $F$. Define
$$
E(F)=\operatorname{Tr}R_F(\delta B_F)^2,
\quad H_{\rm mat}(F)=\int\operatorname{Tr}(F\log F)\,d\mu-\operatorname{Tr}(\tau\log\tau),
$$
$$
\mathrm D\log_A[X]=\int_0^\infty(A+sI)^{-1}X(A+sI)^{-1}\,ds,
\quad I_{\rm BKM}(F)=\int\operatorname{Tr}(F'\mathrm D\log_F[F'])\,d\mu,
\quad I_{\rm WY}(F)=4\int\operatorname{Tr}[(\sqrt F\,)'^2]\,d\mu.

$$
All derivatives and inverses in this display are taken on the stated faithful domain.

**Proof of optimizer facts.** The inequalities $R_F\pm D_F\succeq0$ imply $D_F$ is supported on $E_F=\operatorname{supp}R_F$. On this support,
$$
B_F=2\int_0^\infty e^{-tR_F}D_Fe^{-tR_F}\,dt,
$$
with zero extension on $E_F^\perp$. This solves the Sylvester equation. Positivity and $-R_F\preceq D_F\preceq R_F$ show $-E_F\preceq B_F\preceq E_F$; parity follows by uniqueness on the support. Completing the square gives
$$
2\operatorname{Tr}(D_FB)-\operatorname{Tr}(R_FB^2)
=q(F)-\operatorname{Tr}R_F(B-B_F)^2.

$$
Thus the supported optimizer suffices, even for singular pairs. In particular the supremum may be restricted to the fixed compact set of odd Hermitian contractions, so $q$ is continuous in $(R,D)$.

If $F_\theta\succeq mI>0$, then $\Omega_F\succeq m\operatorname{diag}(p)\otimes I>0$, since $\int v_\theta v_\theta^*d\mu=\operatorname{diag}(p)$. Hence $R_F\pm D_F>0$. The same $\int$ formula gives
$$
I\mp B_F=2\int_0^\infty e^{-tR_F}(R_F\mp D_F)e^{-tR_F}\,dt>0.
$$
The inverse Sylvester map is smooth where $R_F>0$. These assertions do not require a dimension-uniform or smallest-eigenvalue-uniform bound. $\square$

**Canonical Hermitian/Jordan form.**

For any odd Hermitian contraction $B$, whether or not it optimizes a source, define
$$
K_B(\theta)=V_\theta^*(2B-B^2)V_\theta,\qquad M_B(\theta)=V_\theta^*(\delta B)^2V_\theta,\qquad
\mathscr D_B[H](\theta)=V_\theta^*(2H-BH-HB)V_\theta
$$
for odd Hermitian $H$. If $B=B_{G^2}$, its Sylvester normal equation gives
$$
\int\operatorname{Tr}(G^2 \mathscr D_B[H])d\mu=0.

$$
Equivalently, its canonical potential is $W_B=2(V_\theta^*BV_\theta)''-(V_\theta^*B^2V_\theta)''+M_B$. The canonical quadratic form is
$$
\mathcal Q_B(G)=3\int\operatorname{Tr}G'^2d\mu+
\int\operatorname{Tr}\{G^2(K_B''+M_B)\}d\mu,
\quad G\in H^1(S^1;\operatorname{Herm}_d).

$$
The form is defined for every odd Hermitian contraction, including tests that are not the optimizer of a source.

**Proof.** Integrating $\operatorname{Tr}(G^2\mathscr D_B[H])$ expresses it as $\operatorname{Tr}[(2D-RB-BR)H]$, proving (M.6.13ci.S5). The derivation identity $\delta^2(B^2)=(\delta^2B)B+B\delta^2B+2(\delta B)^2$ gives
$$
\mathscr D_B[\delta^2B]=K_B''+2M_B.
$$
At the optimizer, (M.6.13ci.S5) therefore gives
$$
\mathcal Q_B(G)=3\int\operatorname{Tr}G'^2d\mu-E(G^2).

$$
For $G=\sqrt F$, (M.6.13ci.S6) is exactly $\mathcal Q_B(\sqrt F)=3I_{\rm WY}(F)/4-E(F)$.  The potential $K_B''+M_B$ is a bounded Hermitian trigonometric polynomial of degree at most three. Smooth Hermitian functions are dense in the real $H^1$ space, and both terms of the form are continuous in that topology. Thus proofs of its positivity on smooth amplitudes extend to the displayed full domain. On the real Hermitian HS space the potential acts by Jordan multiplication $X\mapsto(W_BX+XW_B)/2$, $W_B=K_B''+M_B$. Replacing this real Hermitian problem by unrestricted complex left multiplication is a stronger relaxation, not the same statement. $\square$

**Metric ordering.**

For the displayed Fisher convention, put $L(a,b)=(\log a-\log b)/(a-b)$ for $a,b>0$, with $L(a,a)=1/a$. Then
$$
I_{\rm BKM}(F)\ge I_{\rm WY}(F)\ge I_{\rm SLD}(F),\qquad
I_{\rm SLD}(F)=\int\operatorname{Tr}[F'\mathcal J_F^{-1}(F')]d\mu,
\quad\mathcal J_F(X)=(FX+XF)/2.

$$
**Proof.** In an eigenbasis of $F$, the three coefficients against $|X_{ij}|^2$ are respectively $L(a,b)$, $4/(\sqrt a+\sqrt b)^2$, and $2/(a+b)$. The first comparison follows by setting $r=\sqrt{a/b}\ge1$ in
$\log r\ge2(r-1)/(r+1)$; the difference has derivative $(r-1)^2/[r(r+1)^2]\ge0$. The second is $(\sqrt a+\sqrt b)^2\le2(a+b)$. Continuous diagonal values agree. $\square$

**Full mean-zero statement.**

Use the Hermitian/Jordan operator and Fourier projections just defined. All coefficient dimensions are finite and arbitrary. The four forward odd blocks $a=B_{01},b=B_{12},c=B_{23},e=B_{03}$ are independent; the direct gap-three corner is not removed.

**The complete contraction bound.**

For every odd Hermitian contraction $B$,
$$
\boxed{\quad QL_BQ\ge\frac47QL_0Q\ge\frac{12}{7}Q,
\qquad (QL_BQ)^{-1}\le\frac74R_0.\quad}                 
$$
The bound holds on the complete mean-zero Hermitian form domain. It does not assert positivity of the constant Schur operator.

**Proof: potential and contraction bounds.** Put $a=\sqrt3\alpha,c=\sqrt3\gamma$. The ordered four-spin path expansion gives
$$
\begin{split}
W_0={}&\tfrac18(3\alpha\alpha^*+9\alpha^*\alpha+3bb^*+3b^*b
 +9\gamma\gamma^*+3\gamma^*\gamma+9ee^*+9e^*e),\\
W_1={}&-\tfrac34(\alpha+b+\gamma),\\
W_2={}&\tfrac98(\alpha b+b\gamma)+\tfrac{21}{8}(e\gamma^*+\alpha^*e),
\qquad W_3=-\tfrac94e,\qquad W_{-k}=W_k^*.
\end{split}                                             
$$
In original variables, $W_2=(\sqrt3/8)[3ab+3bc+7ec^*+7a^*e]$. These are the coefficients of $V^*[2\delta^2B-B\delta^2B-\delta^2BB-(\delta B)^2]V$; all multiplication orders are retained.

The four diagonal compressions of $B^2\le I$ give
$$
aa^*+ee^*\le I,\quad a^*a+bb^*\le I,\quad
b^*b+cc^*\le I,\quad e^*e+c^*c\le I.
$$
Thus $0\le W_0\le3I$: the two outer weighted rows are at most $9I/8$ each, and the two inner rows at most $3I/8$ each.

Each of $ab,bc,ec^*,a^*e$ has norm at most $1/2$. Indeed compress $B$ to the three spin vertices on the relevant two-edge path. That principal compression is still a Hermitian contraction; its square is a positive contraction whose off-diagonal endpoint block is exactly the stated $\prod$. An off-diagonal block of a positive contraction has norm at most $1/2$, by centering the contraction at $I/2$. This argument does not assume that deleting an edge preserves the norm of the entire four-spin matrix. Consequently
$$
\|W_1\|\le\frac{13}{8},\qquad
\|W_2\|\le\frac{5\sqrt3}{4}\le\frac{13}{6},\qquad
\|W_3\|\le\frac94,
$$
and
$$
\|W_B\|_\infty\le3+2\left(\frac{13}{8}+\frac{13}{6}+\frac94\right)
=\frac{181}{12}.                                      
$$
These scalar norms are used only on the remote tail and its boundary. The central certificate retains all positive corner terms and complete contraction relations.

**Proof: a stronger mean-zero vector statement.** We prove first that for every mean-zero $u\in H^1(S^1;\mathbb C^d)$,
$$
\int(3\|u'\|^2+u^*W_Bu)d\mu\ge\frac{12}{7}\int\|u'\|^2d\mu.

$$
This auxiliary left-vector statement is restricted to mean-zero amplitudes; no unrestricted left-vector form bound is used.

Subtract $(4/7)L_0$ and split the nonzero Fourier indices into
$$
\mathcal C=\{n:0<|n|\le8\},\qquad \mathcal T=\{n:|n|\ge9\}.
$$
On $\mathcal T$, (M.6.13ci.3) gives the positive lower bound
$$
\frac97\,81-\frac{181}{12}=\frac{7481}{84}.            
$$
Bandwidth three makes the central-tail coupling vanish on all central modes except
$\mathcal E=\{-8,-7,-6,6,7,8\}$. The positive and negative boundary components are disjoint. Componentwise norms bound each coupling by the scalar triangular matrix
$$
T_0=\begin{pmatrix}9/4&13/6&13/8\\0&9/4&13/6\\0&0&9/4\end{pmatrix}.
$$
The leading principal minors of $(196/9)I-T_0^*T_0$ are
$$
\frac{2407}{144},\qquad\frac{1224571}{6912},\qquad
\frac{2609797}{110592},
$$
all positive, so $\|T_0\|\le14/3$. No commutation of the coefficient matrices is used. The coupling $K$ therefore satisfies $K^*K\le(196/9)P_{\mathcal E}$. Exact tail Schur completion shows that (M.6.13ci.4) follows from the finite central inequality
$$
P_{\mathcal C}(L_{\rm left}-\tfrac47L_0)P_{\mathcal C}
-\frac{5488}{22443}P_{\mathcal E}\ge0,
\qquad L_{\rm left}=-3\partial^2+W_B,                 
$$
since $(196/9)/(7481/84)=5488/22443$. This controls every omitted Fourier mode before the finite certificate is applied.

**Proof: complete rational localizers.** In even/odd spin order,
$$
B=\begin{pmatrix}0&C\\C^*&0\end{pmatrix},\qquad
C=\begin{pmatrix}\sqrt3\alpha&e\\b^*&\sqrt3\gamma\end{pmatrix}.
$$
Congruences of $I-CC^*$ and $I-C^*C$ by $\operatorname{diag}(I/\sqrt3,I)$ and $\operatorname{diag}(I,I/\sqrt3)$ give positive operator matrices
$$
\Lambda_1=\begin{pmatrix}
I/3-\alpha\alpha^*-ee^*/3&-\alpha b-e\gamma^*\\
-b^*\alpha^*-\gamma e^*&I-b^*b-3\gamma\gamma^*
\end{pmatrix},
$$
$$
\Lambda_2=\begin{pmatrix}
I-3\alpha^*\alpha-bb^*&-\alpha^*e-b\gamma\\
-e^*\alpha-\gamma^*b^*&I/3-e^*e/3-\gamma^*\gamma
\end{pmatrix}.                                       
$$
Every corner correlation is retained.

**Proof: the exact finite operator certificate.** For independent vectors $u_n\in\mathbb C^d$, $n\in\mathcal C$, the polynomial in (M.6.13ci.6) is
$$
\mathcal P(u)=\sum_{n\in\mathcal C}
\left(\frac97n^2-\frac{5488}{22443}\mathbf1_{\mathcal E}(n)\right)\|u_n\|^2
+\sum_{n,m\in\mathcal C}u_n^*W_{n-m}u_m.             
$$
The complete rational data printed below specify the exact representation
$$
\mathcal P(u)=\sum_{\rm free}\sum_{i,j}Q_{ij}v_i^*v_j
+\sum_{\rm local}\sum_{i,j}Q_{ij}u_{n_i}^*\Lambda_{s_i,s_j}u_{n_j}.

$$
There are sixty-one Gram blocks, with maximum size nine and $1,208$ full rational entries.
The ordered alphabet is $(\alpha,\alpha^*,b,b^*,\gamma,\gamma^*,e,e^*)$, with grades $(1,-1,1,-1,1,-1,3,-3)$. Adjoint reverses multiplication order and interchanges each letter with its adjoint. Each free basis row gives the left word $w_i$ and mode $n_i$, denoting $w_i u_{n_i}$; each local row gives its localizer component $s_i$ and mode $n_i$. The matrix tables give the exact rational $Q$ and $R$, including every basis, component, localizer coefficient and entry.
Expand each free term as $u_{n_i}^*w_i^*w_ju_{n_j}$ and each local term with the displayed
$\Lambda_{s_i,s_j}$. The resulting literal ordered coefficient array is exactly the central
target (M.6.13ci.8), with $356$ nonzero ordered terms. Grouping terms with their adjoints gives $250$ coefficient pairs. The equality holds before grouping.
For each Gram the exact symmetric matrix $Q-RR^{\mathsf T}$ has positive diagonal exceeding
its absolute off-diagonal row $\sum$. Therefore all Grams are positive definite, and the
ordered vector/operator identity is nonnegative under the positive localizers.
It uses no cyclic trace reduction, fixed coefficient dimension or matrix sampling.

## Complete finite inputs

**Complete mean-zero rational data.**
These sixty-one Gram blocks specify the finite ordered operator identity (M.6.13ci.9). The target is the explicit finite expression (M.6.13ci.8); expanding that expression defines all of its coefficients. Each free basis row denotes $w u_n$; each local row denotes component $s$ on $u_n$. All indices start at zero. The two localizers are exactly (M.6.13ci.7).

**Mean-zero block 0: free, charge $-11$, dimension $1$.**

<a id="mean-zero-block-00-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $e^*$ | $-8$ |

**Gram $Q^{(0)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-00-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:4398984698817$ |

**Rational factor $R^{(0)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-00-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2097375667070$ |

**Mean-zero block 1: free, charge $-10$, dimension $1$.**

<a id="mean-zero-block-01-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $e^*$ | $-7$ |

**Gram $Q^{(1)}$.** The denominator is $6000000000$. In row $i$, each pair $j:n$ specifies the entry $n/6000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-01-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:21661860403$ |

**Rational factor $R^{(1)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-01-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1900081592239$ |

**Mean-zero block 2: free, charge $-9$, dimension $4$.**

<a id="mean-zero-block-02-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $\alpha^*$ | $-8$ |
| $1$ | $b^*$ | $-8$ |
| $2$ | $\gamma^*$ | $-8$ |
| $3$ | $e^*$ | $-6$ |

**Gram $Q^{(2)}$.** The denominator is $3000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/3000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-02-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:30590862289353$ |
| $1$ | $1:17681102530230$ |
| $2$ | $2:53043307590699\quad 3:4125000000000$ |
| $3$ | $3:8779669686566$ |

**Rational factor $R^{(2)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-02-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3193266992666$ |
| $1$ | $1:2427694551094$ |
| $2$ | $2:4204890310131$ |
| $3$ | $2:327000206566\quad 3:1679174623764$ |

**Mean-zero block 3: free, charge $-8$, dimension $5$.**

<a id="mean-zero-block-03-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $-8$ |
| $1$ | $\alpha^*$ | $-7$ |
| $2$ | $b^*$ | $-7$ |
| $3$ | $\gamma^*$ | $-7$ |
| $4$ | $e^*$ | $-5$ |

**Gram $Q^{(3)}$.** The denominator is $157101000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/157101000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-03-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:10126056383205215959\quad 1:-58912875000000000\quad 2:-58912875000000000\quad 3:-58912875000000000\quad 4:-177344615675570952$ |
| $1$ | $1:1230246965585851500$ |
| $2$ | $2:711894487761755571$ |
| $3$ | $3:2135683463285738016\quad 4:216013875000000000$ |
| $4$ | $4:369727134643506087$ |

**Rational factor $R^{(3)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-03-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:8028431308014$ |
| $1$ | $0:-46709000253\quad 1:2797990075178$ |
| $2$ | $0:-46709000253\quad 1:-779749265\quad 2:2128206360473$ |
| $3$ | $0:-46709000253\quad 1:-779749265\quad 2:-1025435669\quad 3:3686753393459$ |
| $4$ | $0:-140607459719\quad 1:-2347268466\quad 2:-3086854863\quad 3:371174099386\quad 4:1481850259055$ |

**Mean-zero block 4: free, charge $-7$, dimension $8$.**

<a id="mean-zero-block-04-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $-7$ |
| $1$ | $\alpha$ | $-8$ |
| $2$ | $\alpha^*$ | $-6$ |
| $3$ | $b$ | $-8$ |
| $4$ | $b^*$ | $-6$ |
| $5$ | $\gamma$ | $-8$ |
| $6$ | $\gamma^*$ | $-6$ |
| $7$ | $e^*$ | $-4$ |

**Gram $Q^{(4)}$.** The denominator is $22443000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/22443000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-04-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1110275212910539364\quad 1:-8416125000000000\quad 2:-8416125000000000\quad 3:-8416125000000000\quad 4:-8416125000000000$ |
| $0$ | $5:-8416125000000000\quad 6:-8416125000000000\quad 7:-25985599617666630$ |
| $1$ | $1:396816984085951890$ |
| $2$ | $2:129713126775600738\quad 3:-2805375000000000$ |
| $3$ | $3:132272328028673073$ |
| $4$ | $4:75193384750160754\quad 5:-2805231219100044$ |
| $5$ | $5:228857198239143687$ |
| $6$ | $6:225582702907231908\quad 7:30863158057439649$ |
| $7$ | $7:39423018878527988$ |

**Rational factor $R^{(4)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-04-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:7033554667886$ |
| $1$ | $0:-53315857729\quad 1:4204552287645$ |
| $2$ | $0:-53315857729\quad 1:-676072145\quad 2:2403502993301$ |
| $3$ | $0:-53315857729\quad 1:-676072145\quad 2:-53190296877\quad 3:2426526032824$ |
| $4$ | $0:-53315857729\quad 1:-676072145\quad 2:-1182872568\quad 3:-1197578374\quad 4:1829636589691$ |
| $5$ | $0:-53315857729\quad 1:-676072145\quad 2:-1182872568\quad 3:-1197578374\quad 4:-69871506379$ |
| $5$ | $5:3192105291710$ |
| $6$ | $0:-53315857729\quad 1:-676072145\quad 2:-1182872568\quad 3:-1197578374\quad 4:-1555429727$ |
| $6$ | $5:-925580797\quad 6:3169938831989$ |
| $7$ | $0:-164617865373\quad 1:-2087438112\quad 2:-3652233416\quad 3:-3697639014\quad 4:-4802539661$ |
| $7$ | $5:-2857820195\quad 6:431043864635\quad 7:1242426545332$ |

**Mean-zero block 5: free, charge $-6$, dimension $8$.**

<a id="mean-zero-block-05-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $-6$ |
| $1$ | $\alpha$ | $-7$ |
| $2$ | $\alpha^*$ | $-5$ |
| $3$ | $b$ | $-7$ |
| $4$ | $b^*$ | $-5$ |
| $5$ | $\gamma$ | $-7$ |
| $6$ | $\gamma^*$ | $-5$ |
| $7$ | $e^*$ | $-3$ |

**Gram $Q^{(5)}$.** The denominator is $157101000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/157101000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-05-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:5730977662049545726\quad 1:-58912875000000000\quad 2:-58918807239488973\quad 3:-58912875000000000\quad 4:-59192135829765456$ |
| $0$ | $5:-58912875000000000\quad 6:-59080842673813485\quad 7:-208383327391893927$ |
| $1$ | $1:2135683463285266713$ |
| $2$ | $2:637878403930518261\quad 3:-19637625000000000$ |
| $3$ | $3:711894487761912672$ |
| $4$ | $4:370834254044000376\quad 5:-19661532622010748$ |
| $5$ | $5:1230750636721817127$ |
| $6$ | $6:1126145134001314287\quad 7:244874442860449101$ |
| $7$ | $7:206295529282105942$ |

**Rational factor $R^{(5)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-05-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:6039832338035$ |
| $1$ | $0:-62087816186\quad 1:3686526695617$ |
| $2$ | $0:-62094068127\quad 1:-1045777071\quad 2:2014063293001$ |
| $3$ | $0:-62087816186\quad 1:-1045671776\quad 2:-63978316409\quad 3:2126851061112$ |
| $4$ | $0:-62382126981\quad 1:-1050628506\quad 2:-1923801888\quad 3:-1879468819\quad 4:1535116677576$ |
| $5$ | $0:-62087816186\quad 1:-1045671776\quad 2:-1914725640\quad 3:-1870601728\quad 4:-84054619280$ |
| $5$ | $5:2796999801704$ |
| $6$ | $0:-62264835998\quad 1:-1048653112\quad 2:-1920184752\quad 3:-1875935038\quad 4:-2535660334$ |
| $6$ | $5:-1461317214\quad 6:2676638508624$ |
| $7$ | $0:-219613551832\quad 1:-3698691740\quad 2:-6772660474\quad 3:-6616587841\quad 4:-8943496971$ |
| $7$ | $5:-5154194315\quad 6:577206589519\quad 7:965159082708$ |

**Mean-zero block 6: free, charge $-5$, dimension $9$.**

<a id="mean-zero-block-06-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $-5$ |
| $1$ | $\alpha$ | $-6$ |
| $2$ | $\alpha^*$ | $-4$ |
| $3$ | $b$ | $-6$ |
| $4$ | $b^*$ | $-4$ |
| $5$ | $\gamma$ | $-6$ |
| $6$ | $\gamma^*$ | $-4$ |
| $7$ | $e$ | $-8$ |
| $8$ | $e^*$ | $-2$ |

**Gram $Q^{(6)}$.** The denominator is $21000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/21000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-06-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:538032506689282\quad 1:-7874207025867\quad 2:-7811283663372\quad 3:-7837670655024\quad 4:-8166960194064$ |
| $0$ | $5:-7852547430315\quad 6:-9768660129102\quad 7:-23543996033208\quad 8:-46938794801808$ |
| $1$ | $1:211076203683114\quad 7:28875134536332$ |
| $2$ | $2:47664803695908\quad 3:-2621226252897$ |
| $3$ | $3:70359529490292$ |
| $4$ | $4:27923480657835\quad 5:-2675418833871$ |
| $5$ | $5:121853512407186$ |
| $6$ | $6:169236262920060\quad 8:52550652195636$ |
| $7$ | $7:92380848713363$ |
| $8$ | $8:23671147076388$ |

**Rational factor $R^{(6)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-06-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:5061679123239$ |
| $1$ | $0:-74078626914\quad 1:3169504715483$ |
| $2$ | $0:-73486659205\quad 1:-1717552520\quad 2:1504775500824$ |
| $3$ | $0:-73734901612\quad 1:-1723354517\quad 2:-86552305792\quad 3:1826888794631$ |
| $4$ | $0:-76832777605\quad 1:-1795759015\quad 2:-3754226761\quad 3:-3280598703\quad 4:1150546908267$ |
| $5$ | $0:-73874858700\quad 1:-1726625636\quad 2:-3609696019\quad 3:-3154301760\quad 4:-115687510612$ |
| $5$ | $5:2404928511255$ |
| $6$ | $0:-91901181512\quad 1:-2147942328\quad 2:-4490503737\quad 3:-3923987993\quad 4:-6166294982$ |
| $6$ | $5:-3133085066\quad 6:2837311369998$ |
| $7$ | $0:-221496195423\quad 1:428646868967\quad 2:-10327648151\quad 3:-9024726337\quad 4:-14181777523$ |
| $7$ | $5:-7205739507\quad 6:-6917417663\quad 7:2041029230301$ |
| $8$ | $0:-441588779223\quad 1:-10320947076\quad 2:-21577046462\quad 3:-18854916109\quad 4:-29629289075$ |
| $8$ | $5:-15054596542\quad 6:867513727062\quad 7:-43265874339\quad 8:419180966858$ |

**Mean-zero block 7: free, charge $-4$, dimension $9$.**

<a id="mean-zero-block-07-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $-4$ |
| $1$ | $\alpha$ | $-5$ |
| $2$ | $\alpha^*$ | $-3$ |
| $3$ | $b$ | $-5$ |
| $4$ | $b^*$ | $-3$ |
| $5$ | $\gamma$ | $-5$ |
| $6$ | $\gamma^*$ | $-3$ |
| $7$ | $e$ | $-7$ |
| $8$ | $e^*$ | $-1$ |

**Gram $Q^{(7)}$.** The denominator is $21000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/21000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-07-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:303674219510177\quad 1:-7938716336628\quad 2:-7017985271367\quad 3:-7583039805936\quad 4:22932933323412$ |
| $0$ | $5:-5981339870898\quad 6:-17883719858802\quad 7:-22935176136390\quad 8:-39272895252213$ |
| $1$ | $1:148710434718888\quad 7:28871804221092$ |
| $2$ | $2:19727788777746\quad 3:1232848932021$ |
| $3$ | $3:50178012476109$ |
| $4$ | $4:12836917686516\quad 5:3513372300795$ |
| $5$ | $5:89391545556558$ |
| $6$ | $6:184835660123142\quad 8:53575816952385$ |
| $7$ | $7:75838953647989$ |
| $8$ | $8:23641126036773$ |

**Rational factor $R^{(7)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-07-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3802719699049$ |
| $1$ | $0:-99411511020\quad 1:2659241736624$ |
| $2$ | $0:-87881779693\quad 1:-3285320169\quad 2:965238054935$ |
| $3$ | $0:-94957599348\quad 1:-3549838401\quad 2:52163698439\quad 3:1541972294520$ |
| $4$ | $0:287174583035\quad 1:10735563763\quad 2:26182849997\quad 3:16823729140\quad 4:726449386833$ |
| $5$ | $0:-74900526644\quad 1:-2800036728\quad 2:-6828979198\quad 3:-4387944641\quad 4:260301209600$ |
| $5$ | $5:2045311642945$ |
| $6$ | $0:-223946484348\quad 1:-8371882138\quad 2:-20418092524\quad 3:-13119597684\quad 4:89692331953$ |
| $6$ | $5:-19723730919\quad 6:2956763976465$ |
| $7$ | $0:-287202668360\quad 1:506270847919\quad 2:-24425704809\quad 3:-15694679601\quad 4:107296919207$ |
| $7$ | $5:-23595055640\quad 6:-23969892821\quad 7:1805296746153$ |
| $8$ | $0:-491789565668\quad 1:-18384768543\quad 2:-44838412550\quad 3:-28810817305\quad 4:196965596952$ |
| $8$ | $5:-43313584897\quad 6:818843447831\quad 7:-75340072675\quad 8:404821123261$ |

**Mean-zero block 8: free, charge $-3$, dimension $8$.**

<a id="mean-zero-block-08-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $-3$ |
| $1$ | $\alpha$ | $-4$ |
| $2$ | $\alpha^*$ | $-2$ |
| $3$ | $b$ | $-4$ |
| $4$ | $b^*$ | $-2$ |
| $5$ | $\gamma$ | $-4$ |
| $6$ | $\gamma^*$ | $-2$ |
| $7$ | $e$ | $-6$ |

**Gram $Q^{(8)}$.** The denominator is $21000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/21000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-08-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:85784034765581\quad 1:-8732014728633\quad 2:-15408385420113\quad 3:-38682933323412\quad 4:14756909009808$ |
| $0$ | $5:2133719858802\quad 6:21937744702314\quad 7:-19394990323233$ |
| $1$ | $1:83770441973505\quad 7:28824581166129$ |
| $2$ | $2:8013441229164\quad 3:21050652195636$ |
| $3$ | $3:56412087640020$ |
| $4$ | $4:8889729980985\quad 5:11736797623761$ |
| $5$ | $5:147305832879996$ |
| $6$ | $6:23636741283036$ |
| $7$ | $7:61617837469062$ |

**Rational factor $R^{(8)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-08-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2021126919928$ |
| $1$ | $0:-205731872191\quad 1:1986641148313$ |
| $2$ | $0:-363031451325\quad 1:-37594680956\quad 2:498384625362$ |
| $3$ | $0:-911394740137\quad 1:-94381889932\quad 2:1340327857324\quad 3:224193664059$ |
| $4$ | $0:347682248908\quad 1:36005153752\quad 2:255973373168\quad 3:-101761285423\quad 4:474619237917$ |
| $5$ | $0:50271809534\quad 1:5206030038\quad 2:37011508934\quad 3:-14713791040\quad 4:1117227806617$ |
| $5$ | $5:2400463451831$ |
| $6$ | $0:516867347287\quad 1:53525563548\quad 2:380532163437\quad 3:-151279180397\quad 4:-620356782119$ |
| $6$ | $5:270992409473\quad 6:479137472054$ |
| $7$ | $0:-456958421892\quad 1:643592926979\quad 2:-284307743715\quad 3:113025511592\quad 4:463488382768$ |
| $7$ | $5:-202467091888\quad 6:1397135700263\quad 7:98750407646$ |

**Mean-zero block 9: free, charge $-2$, dimension $9$.**

<a id="mean-zero-block-09-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $-2$ |
| $1$ | $\alpha$ | $-3$ |
| $2$ | $\alpha^*$ | $-1$ |
| $3$ | $b$ | $-3$ |
| $4$ | $b^*$ | $-1$ |
| $5$ | $\gamma$ | $-3$ |
| $6$ | $\gamma^*$ | $-1$ |
| $7$ | $e$ | $-5$ |
| $8$ | $e^*$ | $1$ |

**Gram $Q^{(9)}$.** The denominator is $21000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/21000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-09-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:102443606544758\quad 1:-341614579887\quad 2:-10840801351737\quad 3:-30506909009808\quad 4:-13904378397504$ |
| $0$ | $5:-37687744702314\quad 6:-18677358875406\quad 7:-311205198192\quad 8:-39513477838695$ |
| $1$ | $1:38510753059548\quad 7:35013372300795$ |
| $2$ | $2:7923378110319\quad 3:22075816952385$ |
| $3$ | $3:61611886707714$ |
| $4$ | $4:7919470237896\quad 5:21490223233332$ |
| $5$ | $5:291573693742821$ |
| $6$ | $6:53154360028161\quad 8:35458868762247$ |
| $7$ | $7:50797181852186$ |
| $8$ | $8:36783393809750$ |

**Rational factor $R^{(9)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-09-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2208679915316$ |
| $1$ | $0:-7365196213\quad 1:1354175441984$ |
| $2$ | $0:-233727228747\quad 1:-1271214088\quad 2:568043727274$ |
| $3$ | $0:-657727696428\quad 1:-3577301278\quad 2:1579976886144\quad 3:70383780458$ |
| $4$ | $0:-299777823139\quad 1:-1630455271\quad 2:-123350209034\quad 3:-32500818982\quad 4:520554167635$ |
| $5$ | $0:-812546216946\quad 1:-4419340459\quad 2:-334340094477\quad 3:-88093299346\quad 4:1413204316975$ |
| $5$ | $5:3332794704430$ |
| $6$ | $0:-402683084823\quad 1:-2190144526\quad 2:-165692852685\quad 3:-43657432394\quad 4:-273893071465$ |
| $6$ | $5:184494864\quad 6:1504866766972$ |
| $7$ | $0:-6709571201\quad 1:1231194994309\quad 2:-5452152\quad 3:-1436555\quad 4:-9012499$ |
| $7$ | $5:6071\quad 6:-5828033\quad 7:950277474756$ |
| $8$ | $0:-851908947850\quad 1:-4633429585\quad 2:-350536759842\quad 3:-92360863165\quad 4:-579443157980$ |
| $8$ | $5:390313951\quad 6:747334516027\quad 7:-14941988\quad 8:12243101382$ |

**Mean-zero block 10: free, charge $-1$, dimension $6$.**

<a id="mean-zero-block-10-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $-1$ |
| $1$ | $\alpha$ | $-2$ |
| $2$ | $b$ | $-2$ |
| $3$ | $\gamma$ | $-2$ |
| $4$ | $e$ | $-4$ |
| $5$ | $e^*$ | $2$ |

**Gram $Q^{(10)}$.** The denominator is $21000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/21000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-10-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3937889906194\quad 1:-4909198648263\quad 2:-1845621602496\quad 3:2927358875406\quad 4:-7977104747787$ |
| $0$ | $5:-7736522161305$ |
| $1$ | $1:26669189942955\quad 4:43236797623761$ |
| $2$ | $2:7878913761012$ |
| $3$ | $3:21349807910571$ |
| $4$ | $4:70101944293332$ |
| $5$ | $5:28116602636857$ |

**Rational factor $R^{(10)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-10-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:433034129096$ |
| $1$ | $0:-539845126506\quad 1:989206073193$ |
| $2$ | $0:-202955695801\quad 1:-110760180557\quad 2:567210302725$ |
| $3$ | $0:321910058168\quad 1:175677829711\quad 2:149488800842\quad 3:927265777742$ |
| $4$ | $0:-877210606102\quad 1:1602635989890\quad 2:-928469240\quad 3:1050508379\quad 4:15661555499$ |
| $5$ | $0:-850754692186\quad 1:-464287257099\quad 2:-395074013744\quad 3:447003028307\quad 4:-194359097922$ |
| $5$ | $5:76609293635$ |

**Mean-zero block 11: free, charge $0$, dimension $8$.**

<a id="mean-zero-block-11-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $\alpha$ | $-1$ |
| $1$ | $\alpha^*$ | $1$ |
| $2$ | $b$ | $-1$ |
| $3$ | $b^*$ | $1$ |
| $4$ | $\gamma$ | $-1$ |
| $5$ | $\gamma^*$ | $1$ |
| $6$ | $e$ | $-3$ |
| $7$ | $e^*$ | $3$ |

**Gram $Q^{(11)}$.** The denominator is $3000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/3000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-11-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3394058673384\quad 6:7570031890476$ |
| $1$ | $1:6764311632750\quad 2:565552680321$ |
| $2$ | $2:2531160001341$ |
| $3$ | $3:2531160001341\quad 4:565552680321$ |
| $4$ | $4:6764311632750$ |
| $5$ | $5:3394058673384\quad 7:7570031890476$ |
| $6$ | $6:16884461606801$ |
| $7$ | $7:16884461606801$ |

**Rational factor $R^{(11)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-11-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1063650732679$ |
| $1$ | $1:1501589336087$ |
| $2$ | $1:125545350900\quad 2:909922169921$ |
| $3$ | $3:918542318267$ |
| $4$ | $3:205235574190\quad 4:1487497527170$ |
| $5$ | $5:1063650732679$ |
| $6$ | $0:2372342617710\quad 6:12015120953$ |
| $7$ | $5:2372342617710\quad 7:12015120953$ |

**Mean-zero block 12: free, charge $1$, dimension $6$.**

<a id="mean-zero-block-12-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $1$ |
| $1$ | $\alpha^*$ | $2$ |
| $2$ | $b^*$ | $2$ |
| $3$ | $\gamma^*$ | $2$ |
| $4$ | $e$ | $-2$ |
| $5$ | $e^*$ | $4$ |

**Gram $Q^{(12)}$.** The denominator is $21000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/21000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-12-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3937889906194\quad 1:2927358875406\quad 2:-1845621602496\quad 3:-4909198648263\quad 4:-7736522161305$ |
| $0$ | $5:-7977104747787$ |
| $1$ | $1:21349807910571$ |
| $2$ | $2:7878913761012$ |
| $3$ | $3:26669189942955\quad 5:43236797623761$ |
| $4$ | $4:28116602636857$ |
| $5$ | $5:70101944293332$ |

**Rational factor $R^{(12)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-12-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:433034129096$ |
| $1$ | $0:321910058168\quad 1:955526778275$ |
| $2$ | $0:-202955695801\quad 1:68374305489\quad 2:573864356327$ |
| $3$ | $0:-539845126506\quad 1:181869917229\quad 2:-212593570605\quad 3:948818192378$ |
| $4$ | $0:-850754692186\quad 1:286613100412\quad 2:-335031231812\quad 3:-614056060258\quad 4:208912524317$ |
| $5$ | $0:-877210606102\quad 1:295525906397\quad 2:-345449696158\quad 3:1536806112620\quad 4:-14570528066$ |
| $5$ | $5:5743172689$ |

**Mean-zero block 13: free, charge $2$, dimension $9$.**

<a id="mean-zero-block-13-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $2$ |
| $1$ | $\alpha$ | $1$ |
| $2$ | $\alpha^*$ | $3$ |
| $3$ | $b$ | $1$ |
| $4$ | $b^*$ | $3$ |
| $5$ | $\gamma$ | $1$ |
| $6$ | $\gamma^*$ | $3$ |
| $7$ | $e$ | $-1$ |
| $8$ | $e^*$ | $5$ |

**Gram $Q^{(13)}$.** The denominator is $21000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/21000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-13-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:102443606544758\quad 1:-18677358875406\quad 2:-37687744702314\quad 3:-13904378397504\quad 4:-30506909009808$ |
| $0$ | $5:-10840801351737\quad 6:-341614579887\quad 7:-39513477838695\quad 8:-311205198192$ |
| $1$ | $1:53154360028161\quad 7:35458868762247$ |
| $2$ | $2:291573693742821\quad 3:21490223233332$ |
| $3$ | $3:7919470237896$ |
| $4$ | $4:61611886707714\quad 5:22075816952385$ |
| $5$ | $5:7923378110319$ |
| $6$ | $6:38510753059548\quad 8:35013372300795$ |
| $7$ | $7:36783393809750$ |
| $8$ | $8:50797181852186$ |

**Rational factor $R^{(13)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-13-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2208679915316$ |
| $1$ | $0:-402683084823\quad 1:1539157667212$ |
| $2$ | $0:-812546216946\quad 1:-212582910881\quad 2:3630294581453$ |
| $3$ | $0:-299777823139\quad 1:-78429559982\quad 2:210199978568\quad 3:486739817830$ |
| $4$ | $0:-657727696428\quad 1:-172078418874\quad 2:-157291665975\quad 3:-364887975886\quad 4:1521117598679$ |
| $5$ | $0:-233727228747\quad 1:-61149032022\quad 2:-55894476381\quad 3:-129664990345\quad 4:546225451421$ |
| $5$ | $5:25231765147$ |
| $6$ | $0:-7365196213\quad 1:-1926924054\quad 2:-1761342861\quad 3:-4085994178\quad 4:-4564966106$ |
| $6$ | $5:1029040125\quad 6:1354158675754$ |
| $7$ | $0:-851908947850\quad 1:874158811446\quad 2:-139488451057\quad 3:-323587764490\quad 4:-361519648088$ |
| $7$ | $5:81494191876\quad 6:-5828038840\quad 7:12243110500$ |
| $8$ | $0:-6709571201\quad 1:-1755395751\quad 2:-1604554039\quad 3:-3722272709\quad 4:-4158608166$ |
| $8$ | $5:937438431\quad 6:1231179690388\quad 7:-1159757140\quad 8:950276767049$ |

**Mean-zero block 14: free, charge $3$, dimension $8$.**

<a id="mean-zero-block-14-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $3$ |
| $1$ | $\alpha$ | $2$ |
| $2$ | $\alpha^*$ | $4$ |
| $3$ | $b$ | $2$ |
| $4$ | $b^*$ | $4$ |
| $5$ | $\gamma$ | $2$ |
| $6$ | $\gamma^*$ | $4$ |
| $7$ | $e^*$ | $6$ |

**Gram $Q^{(14)}$.** The denominator is $21000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/21000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-14-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:85784034765581\quad 1:21937744702314\quad 2:2133719858802\quad 3:14756909009808\quad 4:-38682933323412$ |
| $0$ | $5:-15408385420113\quad 6:-8732014728633\quad 7:-19394990323233$ |
| $1$ | $1:23636741283036$ |
| $2$ | $2:147305832879996\quad 3:11736797623761$ |
| $3$ | $3:8889729980985$ |
| $4$ | $4:56412087640020\quad 5:21050652195636$ |
| $5$ | $5:8013441229164$ |
| $6$ | $6:83770441973505\quad 7:28824581166129$ |
| $7$ | $7:61617837469062$ |

**Rational factor $R^{(14)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-14-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2021126919928$ |
| $1$ | $0:516867347287\quad 1:926502695098$ |
| $2$ | $0:50271809534\quad 1:-28045095794\quad 2:2647876446937$ |
| $3$ | $0:347682248908\quad 1:-193961229301\quad 2:202417619791\quad 3:473121197798$ |
| $4$ | $0:-911394740137\quad 1:508439084051\quad 2:22688628721\quad 3:868489229294\quad 4:917796757352$ |
| $5$ | $0:-363031451325\quad 1:202524077071\quad 2:9037451557\quad 3:345941107059\quad 4:291921629544$ |
| $5$ | $5:61720581335$ |
| $6$ | $0:-205731872191\quad 1:114771481610\quad 2:5121572310\quad 3:196046682356\quad 4:-453518584983$ |
| $6$ | $5:-541247923207\quad 6:1842954585906$ |
| $7$ | $0:-456958421892\quad 1:254923044038\quad 2:11375707494\quad 3:435446300237\quad 4:-1007326354858$ |
| $7$ | $5:-1202185126721\quad 6:30593703305\quad 7:98750407646$ |

**Mean-zero block 15: free, charge $4$, dimension $9$.**

<a id="mean-zero-block-15-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $4$ |
| $1$ | $\alpha$ | $3$ |
| $2$ | $\alpha^*$ | $5$ |
| $3$ | $b$ | $3$ |
| $4$ | $b^*$ | $5$ |
| $5$ | $\gamma$ | $3$ |
| $6$ | $\gamma^*$ | $5$ |
| $7$ | $e$ | $1$ |
| $8$ | $e^*$ | $7$ |

**Gram $Q^{(15)}$.** The denominator is $21000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/21000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-15-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:303674219510177\quad 1:-17883719858802\quad 2:-5981339870898\quad 3:22932933323412\quad 4:-7583039805936$ |
| $0$ | $5:-7017985271367\quad 6:-7938716336628\quad 7:-39272895252213\quad 8:-22935176136390$ |
| $1$ | $1:184835660123142\quad 7:53575816952385$ |
| $2$ | $2:89391545556558\quad 3:3513372300795$ |
| $3$ | $3:12836917686516$ |
| $4$ | $4:50178012476109\quad 5:1232848932021$ |
| $5$ | $5:19727788777746$ |
| $6$ | $6:148710434718888\quad 8:28871804221092$ |
| $7$ | $7:23641126036773$ |
| $8$ | $8:75838953647989$ |

**Rational factor $R^{(15)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-15-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3802719699049$ |
| $1$ | $0:-223946484348\quad 1:2958301212394$ |
| $2$ | $0:-74900526644\quad 1:-5670047914\quad 2:2061819103671$ |
| $3$ | $0:287174583035\quad 1:21739415174\quad 2:91635698589\quad 3:721070620693$ |
| $4$ | $0:-94957599348\quad 1:-7188389217\quad 2:-3469330893\quad 3:38475558621\quad 4:1542357977918$ |
| $5$ | $0:-87881779693\quad 1:-6652742296\quad 2:-3210811723\quad 3:35608530434\quad 4:31726116703$ |
| $5$ | $5:964036417264$ |
| $6$ | $0:-99411511020\quad 1:-7525554972\quad 2:-3632057135\quad 3:40280224501\quad 4:-7168491464$ |
| $6$ | $5:-10378320740\quad 6:2658893603492$ |
| $7$ | $0:-491789565668\quad 1:825167776759\quad 2:-15596206563\quad 3:172964983289\quad 4:-30781804760$ |
| $7$ | $5:-44564947081\quad 6:-18950205975\quad 7:411772107347$ |
| $8$ | $0:-287202668360\quad 1:-21741541262\quad 2:-10493115839\quad 3:116370708384\quad 4:-20709974685$ |
| $8$ | $5:-29983262290\quad 6:504325470132\quad 7:-330306948014\quad 8:1774822149333$ |

**Mean-zero block 16: free, charge $5$, dimension $9$.**

<a id="mean-zero-block-16-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $5$ |
| $1$ | $\alpha$ | $4$ |
| $2$ | $\alpha^*$ | $6$ |
| $3$ | $b$ | $4$ |
| $4$ | $b^*$ | $6$ |
| $5$ | $\gamma$ | $4$ |
| $6$ | $\gamma^*$ | $6$ |
| $7$ | $e$ | $2$ |
| $8$ | $e^*$ | $8$ |

**Gram $Q^{(16)}$.** The denominator is $21000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/21000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-16-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:538032506689282\quad 1:-9768660129102\quad 2:-7852547430315\quad 3:-8166960194064\quad 4:-7837670655024$ |
| $0$ | $5:-7811283663372\quad 6:-7874207025867\quad 7:-46938794801808\quad 8:-23543996033208$ |
| $1$ | $1:169236262920060\quad 7:52550652195636$ |
| $2$ | $2:121853512407186\quad 3:-2675418833871$ |
| $3$ | $3:27923480657835$ |
| $4$ | $4:70359529490292\quad 5:-2621226252897$ |
| $5$ | $5:47664803695908$ |
| $6$ | $6:211076203683114\quad 8:28875134536332$ |
| $7$ | $7:23671147076388$ |
| $8$ | $8:92380848713363$ |

**Rational factor $R^{(16)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-16-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:5061679123239$ |
| $1$ | $0:-91901181512\quad 1:2837326880304$ |
| $2$ | $0:-73874858700\quad 1:-2392810940\quad 2:2407713641523$ |
| $3$ | $0:-76832777605\quad 1:-2488618104\quad 2:-55273542475\quad 3:1149227963331$ |
| $4$ | $0:-73734901612\quad 1:-2388277722\quad 2:-2264750276\quad 3:-5043717838\quad 4:1828928830623$ |
| $5$ | $0:-73486659205\quad 1:-2380237136\quad 2:-2257125569\quad 3:-5026737214\quad 4:-71230207048$ |
| $5$ | $5:1503077671725$ |
| $6$ | $0:-74078626914\quad 1:-2399411004\quad 2:-2275307719\quad 3:-5067229817\quad 4:-3006470955$ |
| $6$ | $5:-3788400906\quad 6:3169495249973$ |
| $7$ | $0:-441588779223\quad 1:867658039633\quad 2:-12686794016\quad 3:-28254156743\quad 4:-16763656805$ |
| $7$ | $5:-21123587617\quad 6:-9759561214\quad 7:421407900802$ |
| $8$ | $0:-221496195423\quad 1:-7174274561\quad 2:-6803203894\quad 3:-15151092462\quad 4:-8989392837$ |
| $8$ | $5:-11327375013\quad 6:428591544982\quad 7:-209552108617\quad 8:2030243392482$ |

**Mean-zero block 17: free, charge $6$, dimension $8$.**

<a id="mean-zero-block-17-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $6$ |
| $1$ | $\alpha$ | $5$ |
| $2$ | $\alpha^*$ | $7$ |
| $3$ | $b$ | $5$ |
| $4$ | $b^*$ | $7$ |
| $5$ | $\gamma$ | $5$ |
| $6$ | $\gamma^*$ | $7$ |
| $7$ | $e$ | $3$ |

**Gram $Q^{(17)}$.** The denominator is $157101000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/157101000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-17-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:5730977662049545726\quad 1:-59080842673813485\quad 2:-58912875000000000\quad 3:-59192135829765456\quad 4:-58912875000000000$ |
| $0$ | $5:-58918807239488973\quad 6:-58912875000000000\quad 7:-208383327391893927$ |
| $1$ | $1:1126145134001314287\quad 7:244874442860449101$ |
| $2$ | $2:1230750636721817127\quad 3:-19661532622010748$ |
| $3$ | $3:370834254044000376$ |
| $4$ | $4:711894487761912672\quad 5:-19637625000000000$ |
| $5$ | $5:637878403930518261$ |
| $6$ | $6:2135683463285266713$ |
| $7$ | $7:206295529282105942$ |

**Rational factor $R^{(17)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-17-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:6039832338035$ |
| $1$ | $0:-62264835998\quad 1:2676641660138$ |
| $2$ | $0:-62087816186\quad 1:-1444305284\quad 2:2798263612044$ |
| $3$ | $0:-62382126981\quad 1:-1451151629\quad 2:-46109825154\quad 3:1534426058561$ |
| $4$ | $0:-62087816186\quad 1:-1444305284\quad 2:-1378348673\quad 3:-2566967195\quad 4:2127810889005$ |
| $5$ | $0:-62094068127\quad 1:-1444450718\quad 2:-1378487466\quad 3:-2567225676\quad 4:-60562647744$ |
| $5$ | $5:2013150175782$ |
| $6$ | $0:-62087816186\quad 1:-1444305284\quad 2:-1378348673\quad 3:-2566967195\quad 4:-1816642692$ |
| $6$ | $5:-1974955508\quad 6:3686524284698$ |
| $7$ | $0:-219613551832\quad 1:577228141227\quad 2:-4574848534\quad 3:-8519967654\quad 4:-6029581136$ |
| $7$ | $5:-6555033924\quad 6:-3486673869\quad 7:965159082708$ |

**Mean-zero block 18: free, charge $7$, dimension $8$.**

<a id="mean-zero-block-18-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $7$ |
| $1$ | $\alpha$ | $6$ |
| $2$ | $\alpha^*$ | $8$ |
| $3$ | $b$ | $6$ |
| $4$ | $b^*$ | $8$ |
| $5$ | $\gamma$ | $6$ |
| $6$ | $\gamma^*$ | $8$ |
| $7$ | $e$ | $4$ |

**Gram $Q^{(18)}$.** The denominator is $22443000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/22443000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-18-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1110275212910539364\quad 1:-8416125000000000\quad 2:-8416125000000000\quad 3:-8416125000000000\quad 4:-8416125000000000$ |
| $0$ | $5:-8416125000000000\quad 6:-8416125000000000\quad 7:-25985599617666630$ |
| $1$ | $1:225582702907231908\quad 7:30863158057439649$ |
| $2$ | $2:228857198239143687\quad 3:-2805231219100044$ |
| $3$ | $3:75193384750160754$ |
| $4$ | $4:132272328028673073\quad 5:-2805375000000000$ |
| $5$ | $5:129713126775600738$ |
| $6$ | $6:396816984085951890$ |
| $7$ | $7:39423018878527988$ |

**Rational factor $R^{(18)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-18-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:7033554667886$ |
| $1$ | $0:-53315857729\quad 1:3169939867737$ |
| $2$ | $0:-53315857729\quad 1:-896730160\quad 2:3192870292871$ |
| $3$ | $0:-53315857729\quad 1:-896730160\quad 2:-40038262313\quad 3:1829199134654$ |
| $4$ | $0:-53315857729\quad 1:-896730160\quad 2:-890541910\quad 3:-1573935011\quad 4:2427108192534$ |
| $5$ | $0:-53315857729\quad 1:-896730160\quad 2:-890541910\quad 3:-1573935011\quad 4:-52674477199$ |
| $5$ | $5:2402924971960$ |
| $6$ | $0:-53315857729\quad 1:-896730160\quad 2:-890541910\quad 3:-1573935011\quad 4:-1172858777$ |
| $6$ | $5:-1210372735\quad 6:4204551465315$ |
| $7$ | $0:-164617865373\quad 1:431050119739\quad 2:-2627794516\quad 3:-4644338176\quad 4:-3460849879$ |
| $7$ | $5:-3571545368\quad 6:-1999794545\quad 7:1242426545332$ |

**Mean-zero block 19: free, charge $8$, dimension $5$.**

<a id="mean-zero-block-19-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $I$ | $8$ |
| $1$ | $\alpha$ | $7$ |
| $2$ | $b$ | $7$ |
| $3$ | $\gamma$ | $7$ |
| $4$ | $e$ | $5$ |

**Gram $Q^{(19)}$.** The denominator is $52367000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/52367000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-19-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3375352127735089442\quad 1:-19637625000000000\quad 2:-19637625000000000\quad 3:-19637625000000000\quad 4:-59114871891856984$ |
| $1$ | $1:711894487761912672\quad 4:72004625000000000$ |
| $2$ | $2:237298162587251857$ |
| $3$ | $3:410082321861950500$ |
| $4$ | $4:123242378214502029$ |

**Rational factor $R^{(19)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-19-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:8028431308014$ |
| $1$ | $0:-46709000253\quad 1:3686753618526$ |
| $2$ | $0:-46709000253\quad 1:-591775565\quad 2:2128206421043$ |
| $3$ | $0:-46709000253\quad 1:-591775565\quad 2:-1025314500\quad 3:2797989824736$ |
| $4$ | $0:-140607459719\quad 1:371175431754\quad 2:-2982784592\quad 3:-2269858009\quad 4:1481850259055$ |

**Mean-zero block 20: free, charge $9$, dimension $4$.**

<a id="mean-zero-block-20-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $\alpha$ | $8$ |
| $1$ | $b$ | $8$ |
| $2$ | $\gamma$ | $8$ |
| $3$ | $e$ | $6$ |

**Gram $Q^{(20)}$.** The denominator is $3000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/3000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-20-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:53043307590699\quad 3:4125000000000$ |
| $1$ | $1:17681102530230$ |
| $2$ | $2:30590862289350$ |
| $3$ | $3:8779669686566$ |

**Rational factor $R^{(20)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-20-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:4204890310131$ |
| $1$ | $1:2427694551094$ |
| $2$ | $2:3193266992666$ |
| $3$ | $0:327000206566\quad 3:1679174623764$ |

**Mean-zero block 21: free, charge $10$, dimension $1$.**

<a id="mean-zero-block-21-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $e$ | $7$ |

**Gram $Q^{(21)}$.** The denominator is $6000000000$. In row $i$, each pair $j:n$ specifies the entry $n/6000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-21-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:21661860403$ |

**Rational factor $R^{(21)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-21-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1900081592239$ |

**Mean-zero block 22: free, charge $11$, dimension $1$.**

<a id="mean-zero-block-22-basis"></a>

| Index $i$ | Left word $w_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $e$ | $8$ |

**Gram $Q^{(22)}$.** The denominator is $60000000000$. In row $i$, each pair $j:n$ specifies the entry $n/60000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-22-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:263939081929$ |

**Rational factor $R^{(22)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-22-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2097375667070$ |

**Mean-zero block 23: localizer $\Lambda_1$, charge $-8$, dimension $1$.**

<a id="mean-zero-block-23-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-8$ |

**Gram $Q^{(23)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-23-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:9821954096451$ |

**Rational factor $R^{(23)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-23-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3133999694711$ |

**Mean-zero block 24: localizer $\Lambda_1$, charge $-7$, dimension $1$.**

<a id="mean-zero-block-24-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-7$ |

**Gram $Q^{(24)}$.** The denominator is $2000000000$. In row $i$, each pair $j:n$ specifies the entry $n/2000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-24-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:14911860403$ |

**Rational factor $R^{(24)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-24-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2730554923729$ |

**Mean-zero block 25: localizer $\Lambda_1$, charge $-6$, dimension $2$.**

<a id="mean-zero-block-25-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-6$ |
| $1$ | $1$ | $-8$ |

**Gram $Q^{(25)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-25-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:5404669686566\quad 1:-1250000000000$ |
| $1$ | $1:5518700843411$ |

**Rational factor $R^{(25)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-25-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2324794545022$ |
| $1$ | $0:-537681922334\quad 1:2286831647456$ |

**Mean-zero block 26: localizer $\Lambda_1$, charge $-5$, dimension $2$.**

<a id="mean-zero-block-26-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-5$ |
| $1$ | $1$ | $-7$ |

**Gram $Q^{(26)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-26-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3685307725161\quad 1:-1250000000000$ |
| $1$ | $1:4156444661472$ |

**Rational factor $R^{(26)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-26-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1919715529749$ |
| $1$ | $0:-651138140328\quad 1:1931958533117$ |

**Mean-zero block 27: localizer $\Lambda_1$, charge $-4$, dimension $2$.**

<a id="mean-zero-block-27-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-4$ |
| $1$ | $1$ | $-6$ |

**Gram $Q^{(27)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-27-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1894752556948\quad 1:-1249820297757$ |
| $1$ | $1:2975453785252$ |

**Rational factor $R^{(27)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-27-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1376500107863$ |
| $1$ | $0:-907969632997\quad 1:1466644101617$ |

**Mean-zero block 28: localizer $\Lambda_1$, charge $-3$, dimension $2$.**

<a id="mean-zero-block-28-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-3$ |
| $1$ | $1$ | $-5$ |

**Gram $Q^{(28)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-28-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:564418513226\quad 1:-1066292907999$ |
| $1$ | $1:2014429165529$ |

**Rational factor $R^{(28)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-28-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:751277913442$ |
| $1$ | $0:-1419305544487\quad 1:962765678$ |

**Mean-zero block 29: localizer $\Lambda_1$, charge $-2$, dimension $2$.**

<a id="mean-zero-block-29-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-2$ |
| $1$ | $1$ | $-4$ |

**Gram $Q^{(29)}$.** The denominator is $250000000000$. In row $i$, each pair $j:n$ specifies the entry $n/250000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-29-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1648109871\quad 1:-30646997671$ |
| $1$ | $1:577822471905$ |

**Rational factor $R^{(29)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-29-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:81193777372$ |
| $1$ | $0:-1509820021327\quad 1:178138656167$ |

**Mean-zero block 30: localizer $\Lambda_1$, charge $-1$, dimension $2$.**

<a id="mean-zero-block-30-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-1$ |
| $1$ | $1$ | $-3$ |

**Gram $Q^{(30)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-30-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2303719539\quad 1:-73770621315$ |
| $1$ | $1:2558899367034$ |

**Rational factor $R^{(30)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-30-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:47996974269$ |
| $1$ | $0:-1536984829527\quad 1:443370038272$ |

**Mean-zero block 31: localizer $\Lambda_1$, charge $0$, dimension $1$.**

<a id="mean-zero-block-31-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $1$ | $-2$ |

**Gram $Q^{(31)}$.** The denominator is $250000000000$. In row $i$, each pair $j:n$ specifies the entry $n/250000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-31-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:46592393$ |

**Rational factor $R^{(31)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-31-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:13651357881$ |

**Mean-zero block 32: localizer $\Lambda_1$, charge $1$, dimension $2$.**

<a id="mean-zero-block-32-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $1$ |
| $1$ | $1$ | $-1$ |

**Gram $Q^{(32)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-32-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1879770544250\quad 1:-936482439893$ |
| $1$ | $1:468720000447$ |

**Rational factor $R^{(32)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-32-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1371047239978$ |
| $1$ | $0:-683041701691\quad 1:46626432397$ |

**Mean-zero block 33: localizer $\Lambda_1$, charge $2$, dimension $1$.**

<a id="mean-zero-block-33-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $2$ |

**Gram $Q^{(33)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-33-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:641657519551$ |

**Rational factor $R^{(33)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-33-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:801035273600$ |

**Mean-zero block 34: localizer $\Lambda_1$, charge $3$, dimension $2$.**

<a id="mean-zero-block-34-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $3$ |
| $1$ | $1$ | $1$ |

**Gram $Q^{(34)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-34-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:13509461606801\quad 1:-101656036508$ |
| $1$ | $1:2117630376$ |

**Rational factor $R^{(34)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-34-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3675521948894$ |
| $1$ | $0:-27657578412\quad 1:36778781007$ |

**Mean-zero block 35: localizer $\Lambda_1$, charge $4$, dimension $2$.**

<a id="mean-zero-block-35-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $4$ |
| $1$ | $1$ | $2$ |

**Gram $Q^{(35)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-35-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:6639563470476\quad 1:-566104875059$ |
| $1$ | $1:48320475285$ |

**Rational factor $R^{(35)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-35-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2576735038858$ |
| $1$ | $0:-219698520229\quad 1:7281860629$ |

**Mean-zero block 36: localizer $\Lambda_1$, charge $5$, dimension $2$.**

<a id="mean-zero-block-36-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $5$ |
| $1$ | $1$ | $3$ |

**Gram $Q^{(36)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-36-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3881740264598\quad 1:-957696557105$ |
| $1$ | $1:236281794596$ |

**Rational factor $R^{(36)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-36-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1970213251046$ |
| $1$ | $0:-486087765675\quad 1:684585094$ |

**Mean-zero block 37: localizer $\Lambda_1$, charge $6$, dimension $2$.**

<a id="mean-zero-block-37-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $6$ |
| $1$ | $1$ | $4$ |

**Gram $Q^{(37)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-37-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:5427548209866\quad 1:-1252400896851$ |
| $1$ | $1:954689555135$ |

**Rational factor $R^{(37)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-37-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2329709896074$ |
| $1$ | $0:-537578047362\quad 1:815904031201$ |

**Mean-zero block 38: localizer $\Lambda_1$, charge $7$, dimension $2$.**

<a id="mean-zero-block-38-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $7$ |
| $1$ | $1$ | $5$ |

**Gram $Q^{(38)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-38-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:7459136235427\quad 1:-1250152179948$ |
| $1$ | $1:1985483090776$ |

**Rational factor $R^{(38)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-38-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2731141927002$ |
| $1$ | $0:-457739734280\quad 1:1332650522994$ |

**Mean-zero block 39: localizer $\Lambda_1$, charge $8$, dimension $2$.**

<a id="mean-zero-block-39-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $8$ |
| $1$ | $1$ | $6$ |

**Gram $Q^{(39)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-39-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:9822264101909\quad 1:-1249993593508$ |
| $1$ | $1:2975415931478$ |

**Rational factor $R^{(39)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-39-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3134049152759$ |
| $1$ | $0:-398843008703\quad 1:1678195511818$ |

**Mean-zero block 40: localizer $\Lambda_1$, charge $9$, dimension $1$.**

<a id="mean-zero-block-40-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $1$ | $7$ |

**Gram $Q^{(40)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-40-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:4156444661471$ |

**Rational factor $R^{(40)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-40-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2038736042618$ |

**Mean-zero block 41: localizer $\Lambda_1$, charge $10$, dimension $1$.**

<a id="mean-zero-block-41-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $1$ | $8$ |

**Gram $Q^{(41)}$.** The denominator is $100000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-41-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:551870084341$ |

**Rational factor $R^{(41)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-41-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2349191527613$ |

**Mean-zero block 42: localizer $\Lambda_2$, charge $-8$, dimension $1$.**

<a id="mean-zero-block-42-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-8$ |

**Gram $Q^{(42)}$.** The denominator is $100000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-42-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:551870084341$ |

**Rational factor $R^{(42)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-42-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2349191527613$ |

**Mean-zero block 43: localizer $\Lambda_2$, charge $-7$, dimension $1$.**

<a id="mean-zero-block-43-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-7$ |

**Gram $Q^{(43)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-43-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:4156444661471$ |

**Rational factor $R^{(43)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-43-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2038736042618$ |

**Mean-zero block 44: localizer $\Lambda_2$, charge $-6$, dimension $2$.**

<a id="mean-zero-block-44-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-6$ |
| $1$ | $1$ | $-8$ |

**Gram $Q^{(44)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-44-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2975415931478\quad 1:-1249993593508$ |
| $1$ | $1:9822264101909$ |

**Rational factor $R^{(44)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-44-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1724939396465$ |
| $1$ | $0:-724659426337\quad 1:3049120005466$ |

**Mean-zero block 45: localizer $\Lambda_2$, charge $-5$, dimension $2$.**

<a id="mean-zero-block-45-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-5$ |
| $1$ | $1$ | $-7$ |

**Gram $Q^{(45)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-45-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1985483090776\quad 1:-1250152179948$ |
| $1$ | $1:7459136235427$ |

**Rational factor $R^{(45)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-45-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1409071708884$ |
| $1$ | $0:-887216862042\quad 1:2583018092297$ |

**Mean-zero block 46: localizer $\Lambda_2$, charge $-4$, dimension $2$.**

<a id="mean-zero-block-46-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-4$ |
| $1$ | $1$ | $-6$ |

**Gram $Q^{(46)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-46-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:954689555135\quad 1:-1252400896851$ |
| $1$ | $1:5427548209866$ |

**Rational factor $R^{(46)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-46-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:977082158846$ |
| $1$ | $0:-1281776445832\quad 1:1945404159237$ |

**Mean-zero block 47: localizer $\Lambda_2$, charge $-3$, dimension $2$.**

<a id="mean-zero-block-47-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-3$ |
| $1$ | $1$ | $-5$ |

**Gram $Q^{(47)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-47-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:236281794596\quad 1:-957696557105$ |
| $1$ | $1:3881740264598$ |

**Rational factor $R^{(47)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-47-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:486088247745$ |
| $1$ | $0:-1970211297120\quad 1:2774760818$ |

**Mean-zero block 48: localizer $\Lambda_2$, charge $-2$, dimension $2$.**

<a id="mean-zero-block-48-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-2$ |
| $1$ | $1$ | $-4$ |

**Gram $Q^{(48)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-48-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:48320475285\quad 1:-566104875059$ |
| $1$ | $1:6639563470476$ |

**Rational factor $R^{(48)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-48-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:219819164963$ |
| $1$ | $0:-2575320833170\quad 1:85358460144$ |

**Mean-zero block 49: localizer $\Lambda_2$, charge $-1$, dimension $2$.**

<a id="mean-zero-block-49-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $-1$ |
| $1$ | $1$ | $-3$ |

**Gram $Q^{(49)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-49-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2117630376\quad 1:-101656036508$ |
| $1$ | $1:13509461606801$ |

**Rational factor $R^{(49)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-49-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:46017609412$ |
| $1$ | $0:-2209068176440\quad 1:2937597553894$ |

**Mean-zero block 50: localizer $\Lambda_2$, charge $0$, dimension $1$.**

<a id="mean-zero-block-50-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $1$ | $-2$ |

**Gram $Q^{(50)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-50-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:641657519551$ |

**Rational factor $R^{(50)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-50-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:801035273600$ |

**Mean-zero block 51: localizer $\Lambda_2$, charge $1$, dimension $2$.**

<a id="mean-zero-block-51-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $1$ |
| $1$ | $1$ | $-1$ |

**Gram $Q^{(51)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-51-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:468720000447\quad 1:-936482439893$ |
| $1$ | $1:1879770544250$ |

**Rational factor $R^{(51)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-51-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:684631280652$ |
| $1$ | $0:-1367863938384\quad 1:93374409342$ |

**Mean-zero block 52: localizer $\Lambda_2$, charge $2$, dimension $1$.**

<a id="mean-zero-block-52-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $2$ |

**Gram $Q^{(52)}$.** The denominator is $250000000000$. In row $i$, each pair $j:n$ specifies the entry $n/250000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-52-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:46592393$ |

**Rational factor $R^{(52)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-52-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:13651357881$ |

**Mean-zero block 53: localizer $\Lambda_2$, charge $3$, dimension $2$.**

<a id="mean-zero-block-53-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $3$ |
| $1$ | $1$ | $1$ |

**Gram $Q^{(53)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-53-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2558899367034\quad 1:-73770621315$ |
| $1$ | $1:2303719539$ |

**Rational factor $R^{(53)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-53-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1599656012096$ |
| $1$ | $0:-46116553032\quad 1:13303122770$ |

**Mean-zero block 54: localizer $\Lambda_2$, charge $4$, dimension $2$.**

<a id="mean-zero-block-54-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $4$ |
| $1$ | $1$ | $2$ |

**Gram $Q^{(54)}$.** The denominator is $250000000000$. In row $i$, each pair $j:n$ specifies the entry $n/250000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-54-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:577822471905\quad 1:-30646997671$ |
| $1$ | $1:1648109871$ |

**Rational factor $R^{(54)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-54-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1520292694720$ |
| $1$ | $0:-80634466711\quad 1:9513793259$ |

**Mean-zero block 55: localizer $\Lambda_2$, charge $5$, dimension $2$.**

<a id="mean-zero-block-55-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $5$ |
| $1$ | $1$ | $3$ |

**Gram $Q^{(55)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-55-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2014429165529\quad 1:-1066292907999$ |
| $1$ | $1:564418513226$ |

**Rational factor $R^{(55)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-55-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1419305871026$ |
| $1$ | $0:-751277740596\quad 1:509618543$ |

**Mean-zero block 56: localizer $\Lambda_2$, charge $6$, dimension $2$.**

<a id="mean-zero-block-56-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $6$ |
| $1$ | $1$ | $4$ |

**Gram $Q^{(56)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-56-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2975453785252\quad 1:-1249820297757$ |
| $1$ | $1:1894752556948$ |

**Rational factor $R^{(56)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-56-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1724950368924$ |
| $1$ | $0:-724554352562\quad 1:1170373246931$ |

**Mean-zero block 57: localizer $\Lambda_2$, charge $7$, dimension $2$.**

<a id="mean-zero-block-57-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $7$ |
| $1$ | $1$ | $5$ |

**Gram $Q^{(57)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-57-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:4156444661472\quad 1:-1250000000000$ |
| $1$ | $1:3685307725161$ |

**Rational factor $R^{(57)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-57-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2038736042619$ |
| $1$ | $0:-613124982278\quad 1:1819171644257$ |

**Mean-zero block 58: localizer $\Lambda_2$, charge $8$, dimension $2$.**

<a id="mean-zero-block-58-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $0$ | $8$ |
| $1$ | $1$ | $6$ |

**Gram $Q^{(58)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-58-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:5518700843411\quad 1:-1250000000000$ |
| $1$ | $1:5404669686566$ |

**Rational factor $R^{(58)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-58-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2349191527613$ |
| $1$ | $0:-532097951702\quad 1:2263082288906$ |

**Mean-zero block 59: localizer $\Lambda_2$, charge $9$, dimension $1$.**

<a id="mean-zero-block-59-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $1$ | $7$ |

**Gram $Q^{(59)}$.** The denominator is $2000000000$. In row $i$, each pair $j:n$ specifies the entry $n/2000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-59-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:14911860403$ |

**Rational factor $R^{(59)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-59-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2730554923729$ |

**Mean-zero block 60: localizer $\Lambda_2$, charge $10$, dimension $1$.**

<a id="mean-zero-block-60-basis"></a>

| Index $i$ | Component $s_i$ | Fourier mode $n_i$ |
|:--|:--|:--|
| $0$ | $1$ | $8$ |

**Gram $Q^{(60)}$.** The denominator is $20000000000$. In row $i$, each pair $j:n$ specifies the entry $n/20000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="mean-zero-block-60-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:196439081929$ |

**Rational factor $R^{(60)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="mean-zero-block-60-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:3133999694711$ |
