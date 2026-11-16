# Spin-one endpoint: rational seed and witness tables

<a id="spin-one-endpoint-certificate"></a>

These companion calculations give the exact finite input tables used in [Theorem M.6.13cd](../../../appendices/appendix_m_perspectival_quantum_dynamics.md). The principal manuscript retains the hypotheses, constructive argument, coefficient identities, error bounds and positivity proof.

All indices, ordered products, adjoints and rational denominators have the conventions stated below. Matrix entries are exact integers divided by their stated denominator; no decimal approximation or implicit numerical tolerance is used. Numbered equation references in this note refer to the owning result in the principal manuscript.

## Notation, hypotheses and construction

Let $z_*$ be the unique root in $(1/\sqrt5,1)$ of
$$
3(1-z^2)\operatorname{atanh}z=\sqrt{9z^2-1},
\quad
\lambda_* =\frac{4z_*}{\sqrt{9z_*^2-1}}-1,
\quad
\chi_* =\frac{1-\sqrt{1-z_*^2}}{1+\sqrt{1-z_*^2}},
\quad
c_* =\frac{4\operatorname{atanh}z_*}{3z_*+\sqrt{9z_*^2-1}}=c_{\mathrm{loc}}.

$$
Then every finite complete reference in the unrestricted spin-one class satisfies
$$
\mathcal A_Q(\sigma)\ge c_*\mathfrak q_{\lambda_*}(\sigma)\ge c_*u,
\qquad c_{\mathrm{proj}}=c_{\mathrm{loc}}
=0.83487144924356266269\ldots.

$$
Arbitrary real charges, degeneracies, complex gap-two coherences, mixed states, correlations, charged pointers, neutral factors and retained flags are included. The same $\lambda_*$ is used in every retained block. No finite-quality optimizer or uniqueness assertion is made. The equality uses the reflected-qubit operational upper construction below; the unrestricted lower bound is proved by the complete rational certificate below.


**Complete reference and normalized source.** The system charge and observable are
$$
Q_S=\operatorname{diag}(0,1,2),\qquad
X=\frac1{\sqrt2}\begin{pmatrix}0&1&0\\1&0&1\\0&1&0\end{pmatrix},
\qquad u=1-\epsilon_\infty^2.

$$
Here $\epsilon_\infty$ is the worst-case, all-input Ozawa RMS error. The complete finite reference contains every charged or neutral pointer, initial correlation and retained flag. Its charge $Q$ may have arbitrary finite real eigenvalues, and
$\mathcal A_Q(\sigma)=D(\sigma\Vert\mathcal G_Q\sigma)$ uses natural logarithms. Put
$|e\rangle=(|0\rangle+|2\rangle)/\sqrt2$, $|m\rangle=|1\rangle$, and
$\rho_\lambda=(1-\lambda)|e\rangle\langle e|+\lambda|m\rangle\langle m|$.
Since $\{\rho_\lambda,X\}=X$ and $\operatorname{Tr}\rho_\lambda X^2=1$, every actual conserving model obeys
$$
u\le\mathfrak q_\lambda(\sigma):=
\sup_{N=N^*,\,[N,Q_S+Q]=0}
\bigl\{\operatorname{Tr}[(X\otimes\sigma)N]
-\operatorname{Tr}[(\rho_\lambda\otimes\sigma)N^2]\bigr\}.

$$
Compression of an initially pure neutral pointer preserves the first moment and decreases the second moment to at least the square of the first. Thus the variational expression is a valid relaxation for complete actual pointers. It is not the separate state-discrimination quality.

**Weighted source and heat identities.** For a smooth positive definite matrix source $F_\theta$ on the circle, normalized by $\int\operatorname{Tr}F=1$, let $\tau=\int F$, $U_\theta=e^{iQ_S\theta}$, and
$$
R(F)=\int U_\theta\rho_\lambda U_\theta^*\otimes F_\theta,\qquad
D(F)=\frac12\int U_\theta XU_\theta^*\otimes F_\theta,
\quad
\mathfrak q_\lambda(F)=\sup_{N=N^*}\{2\operatorname{Tr}DN-\operatorname{Tr}RN^2\}.

$$
Here $\rho_\lambda=(1-\lambda)|e\rangle\langle e|+\lambda|m\rangle\langle m|$, with the system vectors just defined. On $\operatorname{span}\{e,m\}$, the inequality
$$
-M_\lambda\rho_\lambda\le X/2\le M_\lambda\rho_\lambda,
\qquad M_\lambda=\frac1{2\sqrt{\lambda(1-\lambda)}}

$$
is an elementary positive $2\times2$ determinant test, and both sides vanish on the orthogonal complement. Hence $-M_\lambda R\le D\le M_\lambda R$. For faithful $F$, $R>0$, because its lower bound contains the strictly positive system average $\operatorname{diag}((1-\lambda)/2,\lambda,(1-\lambda)/2)$. The Sylvester optimizer satisfies
$$
RN+NR=2D,\qquad
N=2\int_0^\infty e^{-sR}De^{-sR}\,ds,\qquad
-M_\lambda I\le N\le M_\lambda I.

$$
System parity makes $R$ even and $D$ odd, so uniqueness makes $N$ odd. The same conclusions on the support of a singular $R$, followed by zero extension, show that the supremum may always be restricted to this fixed compact norm ball. Thus $\mathfrak q_\lambda$ is continuous in every finite-dimensional source, including singular limits. For a total-charge-twirled source the supported optimizer also commutes with total charge, so this matrix variational quantity equals the conserving dual.

For a system-coefficient matrix $T$, write
$$
\Xi_\theta(T)=\operatorname{Tr}_S[(U_\theta XU_\theta^*\otimes I)T],\qquad
\Psi_\theta(T)=\operatorname{Tr}_S[(U_\theta\rho_\lambda U_\theta^*\otimes I)T],\qquad
\delta T=i[Q_S\otimes I,T].
$$
Put $K_N=\Xi(N)-\Psi(N^2)$, $M_N=\Psi((\delta N)^2)$, and $W_N=K_N''+M_N$. The map $\Psi$ is positive. Writing
$$
N=\begin{pmatrix}0&a&0\\a^*&0&b\\0&b^*&0\end{pmatrix},\qquad
a=\sqrt2\alpha,\quad b=\sqrt2\beta,
$$
ordered multiplication gives, for general $\lambda$,
$$
\begin{split}
W_0&=(1-\lambda)\alpha\alpha^*+2\lambda\alpha^*\alpha
       +2\lambda\beta\beta^*+(1-\lambda)\beta^*\beta,\\
W_1&=-(\alpha+\beta),\qquad W_2=3(1-\lambda)\alpha\beta,
\qquad W_{-n}=W_n^*.
\end{split}

$$
All other modes vanish. For example, the mode-two coefficient of $-\Psi(N^2)$ is $-(1-\lambda)ab/2$; differentiating twice and adding the mode-two coefficient $-(1-\lambda)ab/2$ of $M_N$ gives $3(1-\lambda)ab/2$. No block commutativity is used.

Sylvester stationarity says $\int\operatorname{Tr}F[\Xi(T)-\Psi(NT+TN)]=0$ for every Hermitian $T$. Use $T=\delta^2N$ and
$\delta^2(N^2)=(\delta^2N)N+N\delta^2N+2(\delta N)^2$ to obtain
$$
\int\operatorname{Tr}F(K_N''+2M_N)=0.

$$
For $F_t=e^{t\partial_\theta^2}F$, stationarity removes the derivative of the optimizer. If $E(F)=\int\operatorname{Tr}(FM_N)$ and $H(F)=\int\operatorname{Tr}(F\log F)-\operatorname{Tr}(\tau\log\tau)$, integration by parts yields
$$
-\frac d{dt}\mathfrak q_\lambda(F_t)=2E(F_t),\qquad
-\frac d{dt}H(F_t)=I_{\mathrm{BKM}}(F_t).

$$

**Exact continuum auxiliary.** Let $L_C(T)=CT$, $R_C(T)=TC$, and use the Hilbert–Schmidt inner $\prod$, integrated with normalized circle measure for source functions. For faithful $G=\sqrt F>0$, diagonalize $G$ pointwise, with eigenvalues $g_i>0$, and put $t_{ij}=(g_i-g_j)/(g_i+g_j)$. The divided-difference formula is
$$
I_{\mathrm{BKM}}(F)=4\int\sum_{i,j}
 \frac{\operatorname{atanh}t_{ij}}{t_{ij}}|G'_{ij}|^2,
\qquad \left.\frac{\operatorname{atanh}t}{t}\right|_{t=0}:=1.

$$
For the continuum auxiliary put $S=L_G+R_G$, $A=L_G-R_G$, $C=[G,G']$, and $d\mu(u)=\sqrt u\,du/2$ on $[0,1]$. The commuting spectral representation gives
$$
I_{\mathrm{BKM}}(F)=4\|G'\|_2^2
+4\int_0^1\langle C,(S^2-uA^2)^{-1}C\rangle\,d\mu(u).

$$
The inverse eigenvalues have positive denominators $(x+y)^2-u(x-y)^2$ for $x,y>0$. For fixed $0<\chi<1$, real $\gamma$, and Hermitian $Y$, use the bounded test $Z(u)=i\gamma Y/(1-u\chi)$. Completing the square inside the $\int$ yields
$$
I_{\mathrm{BKM}}\ge4\|G'\|_2^2
+4\int\left[-2id\operatorname{Tr}Y[G,G']-s\|\{G,Y\}\|_2^2+a\|[G,Y]\|_2^2\right],

$$
where, with $L(\chi)=\operatorname{atanh}(\sqrt\chi)/\sqrt\chi$ and $F(\chi)=[L(\chi)-1]/\chi$,
$$
d=\gamma F(\chi),\qquad s=\gamma^2L'(\chi),\qquad a=\gamma^2F'(\chi),
\quad L'(\chi)=\frac{1/(1-\chi)-L(\chi)}{2\chi}.
$$
For nonzero $\gamma$, $0<a<s$. All circle integrals are normalized. This inequality is valid directly for every faithful source, regardless of its dimension or spectrum.

**Rational stationary family.** For formal parameters $(\lambda,\chi)$ near $(\lambda_*,\chi_*)$, define
$$
\begin{gathered}
\ell=1+\lambda,\quad b=3\lambda-1,\quad
T=\ell^2(1+\chi)^2-4b^2\chi,\\
E=\ell^2(\chi^2+1)+(38\lambda^2-20\lambda+6)\chi,
\qquad \overline L=\frac{(1+\chi)T}{(1-\chi)^2E},\\
c=\frac{T\overline L}{2\ell(1+\chi)},\quad\kappa=\frac2c,
\quad\gamma=\frac{T}{16b},\quad
f=\frac{\overline L-1}{\chi},\quad h=\frac{1/(1-\chi)-\overline L}{2\chi},\\
d=\gamma f,\qquad s=\gamma^2h,\qquad a=\gamma^2(h-f)/\chi.
\end{gathered}

$$
These are rational functions used to construct the certificate. Away from the actual saddle, no claim is made that $\overline L$ equals the logarithmic function or that this family supplies an operational coefficient. At the true saddle,
$$
(-\chi^2+34\chi-1)\ell^2=64\chi,
\qquad L(\chi)=\frac{4(1+\chi)}{3\ell(1-\chi)^2}.
$$
The exact identities
$$
4E-3\ell T=b[(-\chi^2+34\chi-1)\ell^2-64\chi],
\quad
T(3\ell+4)-8\ell^2(1+\chi)^2=-b[(-\chi^2+34\chi-1)\ell^2-64\chi]
$$
therefore identify $\overline L=L(\chi_*)$, $c=c_*$, and all three coefficients in (M.6.13cd.5) with the valid continuum coefficients in (M.6.13cd.4). They are verified as polynomial identities, not through decimal substitution.

**Complete Fourier form.** Set $M^2=[4\lambda(1-\lambda)]^{-1}$. With odd optimizer blocks $\sqrt2\alpha,\sqrt2\beta$, use the positive localizers
$$
\Lambda_0=M^2I-2\alpha^*\alpha-2\beta\beta^*,\qquad
\Lambda_1=\begin{pmatrix}M^2I-2\alpha\alpha^*&-2\alpha\beta\\
-2\beta^*\alpha^*&M^2I-2\beta^*\beta\end{pmatrix}.
$$
The exact weighted potential is
$W_0=(1-\lambda)\alpha\alpha^*+2\lambda\alpha^*\alpha+2\lambda\beta\beta^*+(1-\lambda)\beta^*\beta$, $W_1=-(\alpha+\beta)$, $W_2=3(1-\lambda)\alpha\beta$, and $W_{-j}=W_j^*$. Put $Y_1=\alpha-\beta,Y_{-1}=Y_1^*$, all other modes zero. The form is
$$
\mathcal Q(G)=\kappa\|G'\|_2^2+\langle G,\mathcal J_WG\rangle
+\kappa\int[-2id\operatorname{Tr}Y[G,G']-s\|\{G,Y\}\|_2^2+a\|[G,Y]\|_2^2].

$$
Here $\mathcal J_C=(L_C+R_C)/2$, $\mathcal S_C=L_C+R_C$, and $\operatorname{ad}_C=L_C-R_C$. Its ordered Fourier blocks are $\mathcal L_{nm}=\kappa n^2\mathbf1_{n=m}+\mathcal U_{nm}+\mathcal V_{nm}$, where
$$
\begin{split}
\mathcal U_{nm}&=\mathcal J_{W_{n-m}}-\kappa d(n+m)\operatorname{ad}_{Y_{n-m}},&&|n-m|=1,\\
\mathcal V_{nm}&=\mathcal J_{W_{n-m}}-\kappa\sum_{j+k=n-m}
(s\mathcal S_{Y_j}\mathcal S_{Y_k}-a\operatorname{ad}_{Y_j}\operatorname{ad}_{Y_k}),&&n-m\in\{0,\pm2\}.
\end{split}
$$
Absent coefficients vanish.

For clarity the complete all-mode constants are reconstructed, rather than inherited from a rounded dual. Let
$$
B=\frac1{1-\lambda}+\frac1{2\lambda},\quad
P_2=\frac9{8\lambda},\quad N_2=\frac3{16\lambda},\quad D_2=32M^2B,
$$
and set
$$
\begin{gathered}
a_0=1-8B\kappa s,\qquad U_0=M^2(1+8B\kappa a),\qquad
c_2=N_2+8\kappa sM^2,\\
\beta_{\rm rel}=\frac{P_2+D_2(\kappa s)^2+32\kappa s}{a_0}.
\end{gathered}

$$
The ordered estimates below give
$a_0\mathcal J_{W_0}\le\mathcal V_0\le U_0I$, $\mathcal V_0^2\le U_0\mathcal V_0$, $\|\mathcal V_{\pm2}G\|_2^2\le\beta_{\rm rel}\langle G,\mathcal V_0G\rangle$, and $\|\mathcal V_{\pm2}\|\le c_2$. The parameter box below verifies $a_0>0$, $0<a<s$, and $P_2D_2<256$; thus the cross-term bound $\sqrt{P_2D_2}<16$ is rigorous. It also verifies $2M^2<(153/100)^2$ and $d>0$. The adjacent bound is
$\|\mathcal U_{nm}\|\le\sqrt2M\max(1,2\kappa d|n+m|)$.


The localizers imply $0\le W_0\le M^2I$, $\|\alpha\|,\|\beta\|\le M/\sqrt2$,
$\|W_2\|\le N_2$ and
$W_2^*W_2,W_2W_2^*\le P_2W_0$. To retain the ordered information, use
$$
(A-B)^*(A-B)\le(1/p+1/q)(pA^*A+qB^*B),\qquad p,q>0.
$$
The difference is the square of $\sqrt{p/q}A+\sqrt{q/p}B$. Applying the weights
$(2\lambda,1-\lambda)$ and their reversal to $y=\alpha-\beta$ and $y^*$ gives
$y^*y,yy^*\le BW_0$, $\|y\|^2\le2M^2$, and
$\|\mathcal S_yG\|_2^2,\|\operatorname{ad}_yG\|_2^2
\le4B\langle G,\mathcal J_{W_0}G\rangle$.
The two orientations therefore give
$a_0\mathcal J_{W_0}\le\mathcal V_0\le U_0I$ and
$\mathcal V_0^2\le U_0\mathcal V_0$.
For a gap-two block, expand
$s\mathcal S_y^2-a\operatorname{ad}_y^2
=(s-a)(L_y^2+R_y^2)+2(s+a)L_yR_y$.
Using $0<a<s$ and the same ordered estimate gives its squared relative bound
$D_2s^2$ and its operator norm bound $4s\|y\|^2$.
Combining it with the $W_2$ bound gives
$\|\mathcal V_{\pm2}G\|_2^2\le\beta_{\rm rel}\langle G,\mathcal V_0G\rangle$
and $\|\mathcal V_{\pm2}\|\le c_2$.
The cross term is bounded by $2\sqrt{P_2D_2}\,\kappa s<32\kappa s$.
For an adjacent block put $h=\kappa d(n+m)$. Its exact form is
$$
\mathcal U_{nm}
=L_{-(\alpha+\beta)/2-h(\alpha-\beta)}
+R_{-(\alpha+\beta)/2+h(\alpha-\beta)}.
$$
The identity $|1/2+h|+|1/2-h|=\max(1,2|h|)$ gives
$\|\mathcal U_{nm}\|\le\sqrt2M\max(1,2|h|)$.
All estimates retain arbitrary complex ordered blocks.

Let $P$ project on constants, $Q=I-P$, and $D=-\kappa\partial_\theta^2$ on the mean-zero space. Define the full majorant
$$
K_{nm}=\begin{cases}
(153/100)\max(1,2\kappa d|n+m|)/(\kappa|nm|),&|n-m|=1,\\
c_2/(\kappa|nm|),&|n-m|=2,\\
0,&\text{otherwise},
\end{cases}\qquad n,m\ne0.
$$
Use $w_{\pm1}=1,w_{\pm2}=7/10,w_{\pm3}=2/5,w_{\pm4}=1/10$, and $w_n=1/50$ for $|n|\ge5$. Put $r_n=\sum_mK_{nm}w_m/w_n$ and $\rho_n=(1-r_n)^{-1}$. Exact interval arithmetic proves $r_1,\ldots,r_7<9/10$ throughout the box. For $n\ge7$ all neighbor weights agree and each summand decreases; negative rows reflect positive ones. Weighted Young and inverse order give
$$
Q\mathcal LQ\ge D_w\ge D/10,\qquad
(Q\mathcal LQ)^{-1}\le D_w^{-1},\qquad
(D_w^{-1}G)_n=\frac{\rho_n}{\kappa n^2}G_n.

$$
This controls every Fourier mode. The correlated maximum has fixed branches in the box, since $6\kappa d<1<10\kappa d$, so the finite residual coefficients are rational functions there. Fourier-polynomial density supplies the entire $H^1$ form domain.

For constant $H=H^*$, define $(g_1)_n=-\mathcal U_{n0}H/(\kappa n^2)$ at $n=\pm1$ and
$(g_2)_n=-[\mathcal V_{n0}H+\sum_{m=\pm1}\mathcal U_{nm}(g_1)_m]/(\kappa n^2)$ at $n=\pm2$. For $G=H+g_1+g_2$, the exact residual is $Q\mathcal LG=r_3+r_4$, with $r_3=Q(\mathcal Vg_1+\mathcal Ug_2)$ on $\pm1,\pm3$ and $r_4=Q\mathcal Vg_2$ on $\pm2,\pm4$. Put $T_2=\sum_{n=\pm2}\langle(g_2)_n,\mathcal V_0(g_2)_n\rangle$. The diagonal inverse removes the odd/even cross term, and the complete constant Schur complement is bounded below by
$$
\begin{gathered}
\vartheta=\frac{\rho_2U_0/4+\rho_4\beta_{\rm rel}/16}{\kappa},\\
K_6=\mathcal Q(H+g_1+g_2)
-\sum_{n=\pm1,\pm3}\frac{\rho_{|n|}}{\kappa n^2}\|(r_3)_n\|_2^2
-\vartheta T_2.
\end{gathered}

$$
Every residual term is retained; only witness degrees two, four and six occur.

**The exact degree-two face.** Put $A_0=\ell(1+\chi)/4$ and define charge-one polynomials
$$
f_1=A_0[\alpha-\beta,H]+\frac{b\chi}{2}\{\alpha+\beta,H\},\qquad
f_2=A_0\{\alpha-\beta,H\}+\frac b2[\alpha+\beta,H].
$$
The degree-two part $q_2$ of $K_6$ obeys the generic rational identity
$$
q_2=a_1\operatorname{Tr}(f_1^*f_1)+a_2\operatorname{Tr}(f_2^*f_2),
\qquad a_1=\frac{2(\ell/4-1/\kappa)}{b^2\chi^2},\quad a_2=\frac{\ell}{2b^2}.

$$
Here is the cleared polynomial comparison, valid for all formal parameters where the displayed denominators are nonzero. Put
$$
D_f=(1-\chi)^2E,\quad N_f=(1+\chi)T-D_f,\quad
N_p=(1-\chi)E-(1+\chi)T,\quad C_f=\ell^2D_f-T^2.
$$
The off-diagonal and the two antisymmetric quadratic coefficients reduce respectively to
$$
\begin{aligned}
4b^2\chi D_f-TN_f
  &=(1+\chi)(C_f+\ell^2D_f\chi),\\
8b^2\chi-N_p&=2\ell^2\chi(1+\chi)^2,\\
8b^2\chi^2D_f-2N_f^2+(N_p-2N_f)D_f
  &=2C_f(1+\chi)^2.
\end{aligned}

$$
Each is a polynomial identity after substituting $\ell=1+\lambda$, $b=3\lambda-1$, $T$ and $E$. The symmetric diagonal coefficient follows directly from the definitions of $a_1,a_2$. Expanding the ordered four words $\alpha H,H\alpha,\beta H,H\beta$ and their adjoints therefore proves (M.6.13cd.10). Both face coefficients are strictly positive throughout the box below. This treats the semidefinite endpoint face exactly, including its zero direction.

**Finite parametric certificate.** The exact rational box is
$$
\begin{split}
\lambda&\in\left[\frac{68829346073897702716108}{10^{23}},
\frac{68829346073897702716110}{10^{23}}\right],\\
\chi&\in\left[\frac{8726588664078259781089}{10^{23}},
\frac{8726588664078259781090}{10^{23}}\right].
\end{split}

$$


**Complete rational Gram certificate.** Use the ordered noncommuting alphabet
$(\alpha,\alpha^*,\beta,\beta^*,H)$, coded $(0,1,2,3,4)$, with charges
$(1,-1,1,-1,0)$. Adjoint reverses a word, interchanges $0\leftrightarrow1$ and
$2\leftrightarrow3$, and fixes $4$. Words are ordered lexicographically in this alphabet.
For $d\ge1$ and integer $j$, let $\mathcal W_{d,j}$ be the following ordered list:
run through all length-$d$ words in $(0,1,2,3)$ in lexicographic order, retain charge $j$,
and for each word insert one $H$ at positions $0,1,\ldots,d$, in that order.
Let $\mathcal F_1=(f_1,f_2)$, $\mathcal F_{-1}=(f_1^*,f_2^*)$, and
$\mathcal F_j$ be empty for other $j$.
The four free bases, in order, are
$\mathcal F_1\mathbin\Vert\mathcal W_{3,1}$,
$\mathcal W_{3,3}$, $\mathcal W_{2,0}$, and $\mathcal W_{2,2}$.
Their dimensions are $98,32,24,12$.
For each localizer $\Lambda_r$, $r=0,1$, then each $d=1,2$, then each
$j=-d,-d+2,\ldots,d+2$, list components $s=0,\ldots,r$ in order.
For $d=1$ component $s$ contributes $\mathcal F_{j-2s}$;
for $d=2$ it contributes $\mathcal W_{2,j-2s}$.
Delete only empty combined lists. Each resulting basis vector retains its component $s$.
This gives the remaining twelve dimensions
$2,2,12,24,12,2,4,2,12,36,36,12$ and the names printed in the data below.
For a free block define
$\Gamma_{ij}=\operatorname{Tr}(v_i^*v_j)$;
for a localizer block define
$\Gamma_{ij}=\operatorname{Tr}(v_i^*\Lambda_{s_i,s_j}v_j)$.
All basis vectors have exactly one $H$.

Here is the complete finite reconstruction of the Gram functions.
Every numerator in the following indexed tables is an exact integer.
At the rational center
$$
\lambda_0=688293460738977/10^{15},\qquad
\chi_0=872658866407826/10^{16},
$$
fill each symmetric Gram from its upper triangle divided by $10^{14}$.
Fill each lower-triangular witness $C$ from its lower triangle divided by $10^{14}$,
and fill its upper triangle with zeros.
A real trace word is represented by the lexicographically least cyclic rotation of
itself or its adjoint. A complex cyclic word uses rotations only.
All polynomial additions, products, adjoints and trace reductions below are literal
finite operations in this alphabet.

First form a $2\times2$ matrix $L$ by summing entries of every degree-one localizer
Gram whose two component indices agree, assigning indices $i,j$ to
$(i\bmod2,j\bmod2)$. Replace the first free $2\times2$ corner by
$$
(1-10^{-5})\operatorname{diag}(a_1,a_2)-M^2L.

$$
Expand the target $K_6-10^{-5}(q_2+\operatorname{Tr}H^2Z_0^2)$ and subtract the
Gram $\sum$. The exact face identity (M.6.13cd.10) cancels every degree-two coefficient.
For the remaining trace classes, enumerate slots in the first four free blocks in
that order; in the first block use indices $2,\ldots,97$, and in the others use all
indices. Within each block enumerate $(i,j)$ in lexicographic order with $i\le j$.
The trace polynomial of each such slot is one unit monomial class.
Assign each class its first such slot. Add its residual coefficient divided by one
for $i=j$, or by two for $i<j$, to that symmetric Gram entry.
This yields the center matrices $Q^0$ exactly, not by rounding a positive matrix.

There are $4,736$ nonzero complex cyclic target coefficients, and this reconstruction
makes every coefficient of the center target minus its Gram $\sum$ zero.
Every one of the $2,458$ admissible higher-degree real cyclic classes is covered:
these are all charge-zero words with four or six letters from $(0,1,2,3)$ and exactly
two inserted $H$ letters, reduced by cyclic rotation and adjoint.
The sixteen exact rational residual matrices $Q^0-CC^{\mathsf T}$ have strictly
positive diagonal-dominance margin, with every row margin exceeding $9\cdot10^{-10}$.
Thus every $Q^0$ is strictly positive definite.

For a variable point of (M.6.13cd.11), keep $Q^0$ initially, replace its first
$2\times2$ corner by (M.6.13cd.C1), and repair every higher trace coefficient in the
same fixed slot. This does not change any other trace class or any lower degree.
The generic two-square identity proves all degree-two equations exactly.
Since the target and the symmetric Gram $\sum$ are formally self-adjoint under trace,
matching cyclic-plus-adjoint classes also matches their complex cyclic expansions.
Consequently this construction gives
$$
K_6-\frac{q_2+\operatorname{Tr}(H^2Z_0^2)}{100000}
=\sum_{\mathrm{free}}\sum_{i,j}Q_{ij}\operatorname{Tr}(v_i^*v_j)
+\sum_{\mathrm{local}}\sum_{i,j}Q_{ij}
 \operatorname{Tr}(v_i^*\Lambda_{s_i,s_j}v_j),
\qquad Z_0=\alpha\alpha^*+\alpha^*\alpha.

$$
The parameter-dependent entries are rational functions. Enclose each rational
operation outwards at denominator $2^{256}$: floor the lower endpoint and ceil
the upper endpoint after addition, multiplication and division, using all four
endpoint products and using reciprocal endpoint order for a nonzero denominator.
Apply the displayed formulas to the complete rational box (M.6.13cd.11).
They give $a_0>0$, $0<a<s$, $d>0$, $P_2D_2<256$,
$2M^2<(153/100)^2$, $r_1,\ldots,r_7<9/10$, $a_1,a_2>1/2$,
and $6\kappa d<1<10\kappa d$.
The maximum row $\sum$ of absolute Gram repairs is less than $6\cdot10^{-15}$;
the maximum obtained by the same finite operations on the data is less than
$5.725\cdot10^{-15}$, whereas every center row margin is greater than
$9.998\cdot10^{-10}$.
In particular the exact bounds are
$$
\max_i\sum_j|\Delta Q_{ij}|<6\cdot10^{-15},\qquad
\min_i\left[(Q^0-CC^{\mathsf T})_{ii}
-\sum_{j\ne i}|(Q^0-CC^{\mathsf T})_{ij}|\right]>9\cdot10^{-10}.

$$
The perturbation operator norm is bounded by its symmetric absolute row-$\sum$ norm,
so every repaired Gram remains strictly positive definite throughout the box.
There are $15,124$ full entries in the sixteen Grams and the same number in the sixteen witnesses. The indexed symmetric and lower-triangular tables determine every entry through the exact reconstruction just specified.

## Complete finite inputs

**Rational seed and witness data.**
The following sixteen indexed matrix tables are the complete rational seed and positive-definiteness witnesses. All indices start at zero; the bases and correction map are the ones just defined. The seed denominator is $10^{14}$, and every witness denominator is $10^{14}$. Thus the tables, together with (M.6.13cd.C1), define each parameter-dependent Gram without a numerical choice.

**Seed block 0: free1; dimension $98$.**

**Symmetric seed $S^{(0)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-00-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:20346128728194\quad 1:-45153933\quad 2:-1032613720795\quad 3:2078781878452\quad 4:-330057677753$ |
| $0$ | $5:-131590205684\quad 6:-554762543790\quad 7:-1155214153417\quad 8:-166789998813\quad 9:-114693869287$ |
| $0$ | $10:1557478882927\quad 11:1572036126737\quad 12:-1182359741937\quad 13:2036214060339\quad 14:358043146814$ |
| $0$ | $15:-760699511708\quad 16:1856892024229\quad 17:-154963363724\quad 18:108396973120\quad 19:-213193417628$ |
| $0$ | $20:522402481165\quad 21:-1276029812268\quad 22:3034817036841\quad 23:1559766307559\quad 24:1129002540652$ |
| $0$ | $25:-1479044995284\quad 26:-1443767798318\quad 27:-1167796407659\quad 28:-126164474178\quad 29:-231689435442$ |
| $0$ | $30:-154926213357\quad 31:1856839078974\quad 32:-760691235489\quad 33:358047634038\quad 34:29908438098$ |
| $0$ | $35:113241489648\quad 36:-3192506198562\quad 37:1384552484928\quad 38:-1479123465485\quad 39:1129070774238$ |
| $0$ | $40:1559806975430\quad 41:3034831793591\quad 42:61636036854\quad 43:-505509800449\quad 44:-1041009865727$ |
| $0$ | $45:-455661781600\quad 46:-114693458685\quad 47:-166765779273\quad 48:-1155236066453\quad 49:-554753039706$ |
| $0$ | $50:1226396327240\quad 51:-1938625129466\quad 52:30517761818\quad 53:728870599303\quad 54:-455646292023$ |
| $0$ | $55:-1040999351925\quad 56:-505484927617\quad 57:61622614973\quad 58:901817906210\quad 59:-979335381063$ |
| $0$ | $60:1500531269070\quad 61:-300826519205\quad 62:-231657985539\quad 63:-126217454493\quad 64:-1167777104200$ |
| $0$ | $65:-1443735688365\quad 66:155385321158\quad 67:-94749881875\quad 68:-192479353305\quad 69:9262659089$ |
| $0$ | $70:1384609463796\quad 71:-3192457820218\quad 72:113243288362\quad 73:29772827434\quad 74:-300927390162$ |
| $0$ | $75:1500505832160\quad 76:-979341440737\quad 77:901735146445\quad 78:2036238336951\quad 79:-1182368838865$ |
| $0$ | $80:1571912101608\quad 81:1557099349018\quad 82:9330055848\quad 83:-192442032245\quad 84:-94760285426$ |
| $0$ | $85:155394925560\quad 86:-1276071484073\quad 87:522420497887\quad 88:-213200286046\quad 89:108420712578$ |
| $0$ | $90:728919348857\quad 91:30498151064\quad 92:-1938623331203\quad 93:1226361640461\quad 94:-131430820413$ |
| $0$ | $95:-330061642288\quad 96:2078794986754\quad 97:-1032615545858$ |
| $1$ | $1:24186428882845\quad 2:-15452301140\quad 3:3255583372461\quad 4:-771544547404\quad 5:-657137803996$ |
| $1$ | $6:-792647569373\quad 7:-879914126161\quad 8:-189252019126\quad 9:-133010611277\quad 10:350147282050$ |
| $1$ | $11:1483776463974\quad 12:-1468970994786\quad 13:148909588378\quad 14:434668865493\quad 15:-312342030713$ |
| $1$ | $16:-4693582645196\quad 17:-1914484461740\quad 18:234206744432\quad 19:-1263980291030\quad 20:904619599701$ |
| $1$ | $21:1632650699501\quad 22:575486532676\quad 23:1429882117065\quad 24:-1552100870094\quad 25:-1467158236892$ |
| $1$ | $26:-613541680659\quad 27:-1286459972182\quad 28:-7036480605\quad 29:147623506180\quad 30:1914453167317$ |
| $1$ | $31:4693474071206\quad 32:312386044478\quad 33:-434843699686\quad 34:-253136280176\quad 35:-261192202211$ |
| $1$ | $36:251830240322\quad 37:1503853063752\quad 38:1467171268604\quad 39:1552158725980\quad 40:-1429932244395$ |
| $1$ | $41:-575385606854\quad 42:-93334551043\quad 43:-217474096103\quad 44:-297092477745\quad 45:-37603376650$ |
| $1$ | $46:133013290955\quad 47:189249432041\quad 48:879897221275\quad 49:792648001315\quad 50:-2235986286791$ |
| $1$ | $51:424019536698\quad 52:98741688025\quad 53:-39890613573\quad 54:37587891190\quad 55:297030802514$ |
| $1$ | $56:217446371115\quad 57:93341349241\quad 58:-197880695395\quad 59:60539199764\quad 60:669819232458$ |
| $1$ | $61:696275039380\quad 62:-147635742054\quad 63:7073053287\quad 64:1286452569199\quad 65:613532965276$ |
| $1$ | $66:-162016423467\quad 67:-488664814757\quad 68:-458154874374\quad 69:-364363825174\quad 70:-1503883157154$ |
| $1$ | $71:-251887935004\quad 72:261156959907\quad 73:253196532092\quad 74:-696268284951\quad 75:-669766928866$ |
| $1$ | $76:-60468623730\quad 77:197890580024\quad 78:-149052516127\quad 79:1468909868530\quad 80:-1483688082848$ |
| $1$ | $81:-350084234182\quad 82:364412267042\quad 83:458149075391\quad 84:488672253179\quad 85:162015493007$ |
| $1$ | $86:-1632681127231\quad 87:-904664422237\quad 88:1263969877244\quad 89:-234235240254\quad 90:39900810200$ |
| $1$ | $91:-98733269604\quad 92:-423992533362\quad 93:2235927009707\quad 94:656797285720\quad 95:771524208551$ |
| $1$ | $96:-3255576679956\quad 97:15463390459$ |
| $2$ | $2:1236199282737\quad 3:-63887771162\quad 4:47292219520\quad 5:230709403194\quad 6:1109877298$ |
| $2$ | $7:184443176082\quad 8:199627965317\quad 9:19890409652\quad 10:-336116739870\quad 11:-547388705817$ |
| $2$ | $12:357439627117\quad 13:-960290640327\quad 14:-5214290036\quad 15:-17300983987\quad 16:-238172537366$ |
| $2$ | $17:23502225437\quad 18:-340735531658\quad 19:137543865716\quad 20:49967641837\quad 21:-165490365531$ |
| $2$ | $22:-448280100405\quad 23:-269900791793\quad 24:242348963688\quad 25:-600979366491\quad 26:-5214290036$ |
| $2$ | $27:319827955693\quad 28:-155490830775\quad 29:-19005781552\quad 30:-72074773527\quad 31:-457978396656$ |
| $2$ | $32:80239511542\quad 33:-402345683\quad 34:9563497771\quad 35:-163834532929\quad 36:540991397969$ |
| $2$ | $37:191059193348\quad 38:-434829707724\quad 39:-330615431747\quad 40:8656432772\quad 41:214587423578$ |
| $2$ | $42:-9563497771\quad 43:-54578284129\quad 44:-150481160344\quad 45:16947013577\quad 46:9563497771$ |
| $2$ | $47:-39897435688\quad 48:111333530794\quad 49:46374106268\quad 50:500864158237\quad 51:349111829638$ |
| $2$ | $52:-206294774956\quad 53:10394727069\quad 54:-7812170996\quad 55:107591070829\quad 56:-44055470564$ |
| $2$ | $57:65695441496\quad 58:-616469676632\quad 59:-169817972483\quad 60:95351148739\quad 61:98149487667$ |
| $2$ | $62:-9563497771\quad 63:-75287423319\quad 64:155691336899\quad 65:114383483798\quad 66:42233017315$ |
| $2$ | $67:26533615714\quad 68:-652826197\quad 69:-8474239502\quad 70:-528946295350\quad 71:187587204795$ |
| $2$ | $72:168565678484\quad 73:29523220224\quad 74:-9563497771\quad 75:-94177664015\quad 76:620195874694$ |
| $2$ | $77:93576016710\quad 78:-132191905547\quad 79:12733162522\quad 80:-190112807642\quad 81:-151467361691$ |
| $2$ | $82:5214290036\quad 83:79993015798\quad 84:-89461818907\quad 85:-10655601432\quad 86:-237081480726$ |
| $2$ | $87:-221820737284\quad 88:-12143972064\quad 89:274855013090\quad 90:-5214290036\quad 91:-90677892131$ |
| $2$ | $92:135624648097\quad 93:-346793216167\quad 94:5214290036\quad 95:31450802039\quad 96:13643496638$ |
| $2$ | $97:216688536179$ |
| $3$ | $3:2977390570463\quad 4:-203004621242\quad 5:351928275146\quad 6:-115454693085\quad 7:-231830147299$ |
| $3$ | $8:22682289851\quad 9:-66229145026\quad 10:-118483644215\quad 11:656612289950\quad 12:-196833006650$ |
| $3$ | $13:1038683962657\quad 14:-52014903138\quad 15:-215264571754\quad 16:-426884039864\quad 17:-215127751797$ |
| $3$ | $18:6548126268\quad 19:-119753537654\quad 20:346689843588\quad 21:-47711967528\quad 22:47336856351$ |
| $3$ | $23:880690845363\quad 24:59557066772\quad 25:-624387712189\quad 26:-402049425654\quad 27:-684337866302$ |
| $3$ | $28:-183734030347\quad 29:184517672520\quad 30:-403236537261\quad 31:1725740904728\quad 32:-206726828077$ |
| $3$ | $33:-43421147701\quad 34:128827891413\quad 35:29039633659\quad 36:-552777561205\quad 37:854499251390$ |
| $3$ | $38:-113824257111\quad 39:100368967025\quad 40:35591863227\quad 41:344903022177\quad 42:-103803553720$ |
| $3$ | $43:-88258514460\quad 44:-152126700775\quad 45:34263584581\quad 46:-62217430488\quad 47:29439195143$ |
| $3$ | $48:13927386649\quad 49:74682162156\quad 50:-90742356932\quad 51:-14941900086\quad 52:84873861583$ |
| $3$ | $53:34375244118\quad 54:-65037314740\quad 55:-37660159709\quad 56:9770549701\quad 57:-119911867363$ |
| $3$ | $58:-745477679966\quad 59:-504241006006\quad 60:78015938550\quad 61:171804670093\quad 62:-79491764763$ |
| $3$ | $63:-94219501881\quad 64:-51959605511\quad 65:-105615171820\quad 66:-6314095390\quad 67:318512691$ |
| $3$ | $68:-218653545659\quad 69:-159251031405\quad 70:-614861402886\quad 71:-368708231970\quad 72:185502520493$ |
| $3$ | $73:-114391343205\quad 74:-152606879087\quad 75:-155977781210\quad 76:-538599119812\quad 77:907616931471$ |
| $3$ | $78:-911058983988\quad 79:-192607395219\quad 80:-181921731723\quad 81:134862988487\quad 82:71070694214$ |
| $3$ | $83:-8943875776\quad 84:-111365738483\quad 85:-12738462903\quad 86:-147061297287\quad 87:-602944887320$ |
| $3$ | $88:-70903798938\quad 89:-236074750473\quad 90:-69819229811\quad 91:-86377128172\quad 92:-622423713537$ |
| $3$ | $93:1199452284914\quad 94:48123805141\quad 95:-3317697873\quad 96:-72504333921\quad 97:13631809909$ |
| $4$ | $4:1442498661807\quad 5:-101749199279\quad 6:-21143587282\quad 7:-316365584857\quad 8:-106013083918$ |
| $4$ | $9:502476704881\quad 10:70302629768\quad 11:412090731730\quad 12:119630343868\quad 13:-189559972176$ |
| $4$ | $14:-82173116226\quad 15:-185427453207\quad 16:10338343883\quad 17:33171521544\quad 18:-487339223038$ |
| $4$ | $19:561804838192\quad 20:-173987621109\quad 21:-67360483663\quad 22:-208186019833\quad 23:-375246730941$ |
| $4$ | $24:-97681088361\quad 25:-81664914053\quad 26:98465598452\quad 27:237277379823\quad 28:449966876143$ |
| $4$ | $29:-170539095946\quad 30:-382387512209\quad 31:-137188928625\quad 32:-177034297986\quad 33:-39733459642$ |
| $4$ | $34:-49630306644\quad 35:45314950757\quad 36:-91015415918\quad 37:-7804632090\quad 38:-196852779995$ |
| $4$ | $39:-24266328035\quad 40:-19340169738\quad 41:166968621755\quad 42:3529832129\quad 43:9008537608$ |
| $4$ | $44:-22461804585\quad 45:39345153867\quad 46:-113777736327\quad 47:105023224308\quad 48:15442926508$ |
| $4$ | $49:21343807576\quad 50:10169866433\quad 51:292254942960\quad 52:304865527688\quad 53:804410334$ |
| $4$ | $54:12210264081\quad 55:-177073922566\quad 56:-36256769601\quad 57:103456567766\quad 58:-148929161837$ |
| $4$ | $59:153836656541\quad 60:48113653791\quad 61:-3808713042\quad 62:-41737061264\quad 63:-72399858014$ |
| $4$ | $64:-46358102470\quad 65:55071381006\quad 66:5685023303\quad 67:273293732732\quad 68:-131286459256$ |
| $4$ | $69:-24586574484\quad 70:-89890199828\quad 71:-156415280343\quad 72:-4138401980\quad 73:2336333352$ |
| $4$ | $74:216571895378\quad 75:158254938670\quad 76:-90659258026\quad 77:78205452123\quad 78:-483542084958$ |
| $4$ | $79:-125617530994\quad 80:-264831628566\quad 81:22254052318\quad 82:33527293751\quad 83:-39880782058$ |
| $4$ | $84:43584511016\quad 85:11858098233\quad 86:-27920894063\quad 87:-234998229009\quad 88:84226593603$ |
| $4$ | $89:-49973615271\quad 90:105826986620\quad 91:53817389349\quad 92:-41105793401\quad 93:-174883984542$ |
| $4$ | $94:-33672646303\quad 95:-37282993234\quad 96:-3301848003\quad 97:31449486342$ |
| $5$ | $5:1435685503535\quad 6:136203336748\quad 7:274162191945\quad 8:-373495748196\quad 9:39610356924$ |
| $5$ | $10:45134505284\quad 11:-45838197965\quad 12:470796510991\quad 13:315926969513\quad 14:83328866164$ |
| $5$ | $15:215745651916\quad 16:126043028458\quad 17:-76727809065\quad 18:-39472448037\quad 19:79473940882$ |
| $5$ | $20:-272373159128\quad 21:-96606530500\quad 22:-167722851360\quad 23:-167631743509\quad 24:-427384654024$ |
| $5$ | $25:-93866880265\quad 26:-55628085648\quad 27:-45789966306\quad 28:-28303512682\quad 29:-99009441322$ |
| $5$ | $30:-226365393938\quad 31:-79661773297\quad 32:-228170094106\quad 33:269920176108\quad 34:-435965077202$ |
| $5$ | $35:-47978032190\quad 36:-104807062381\quad 37:38470786887\quad 38:-361048493812\quad 39:31959997002$ |
| $5$ | $40:-139041702745\quad 41:32617190205\quad 42:-74516900630\quad 43:-114386789485\quad 44:-66059985767$ |
| $5$ | $45:568154094\quad 46:-300456729401\quad 47:19173201688\quad 48:-44136121134\quad 49:-81188207$ |
| $5$ | $50:146932539103\quad 51:100845977263\quad 52:-14481873272\quad 53:379302214\quad 54:-2310618923$ |
| $5$ | $55:281752915560\quad 56:30229804462\quad 57:695675894\quad 58:-464544021352\quad 59:-73564040985$ |
| $5$ | $60:399487959922\quad 61:695675894\quad 62:23013954450\quad 63:-52163542499\quad 64:-133163177805$ |
| $5$ | $65:379302214\quad 66:-36045649587\quad 67:96913785776\quad 68:115054949347\quad 69:-379302214$ |
| $5$ | $70:-486153420442\quad 71:-232287104327\quad 72:213791966366\quad 73:-695675894\quad 74:-364749788603$ |
| $5$ | $75:3089691371\quad 76:171663317328\quad 77:44843748980\quad 78:-1140842664356\quad 79:2305479760$ |
| $5$ | $80:-202096666304\quad 81:24450082919\quad 82:-10901398762\quad 83:-32508131000\quad 84:98427147495$ |
| $5$ | $85:299409567\quad 86:154803548132\quad 87:-111413554828\quad 88:6890259262\quad 89:887127236$ |
| $5$ | $90:-79688531818\quad 91:39734366229\quad 92:72226507580\quad 93:9608084116\quad 94:-296469300446$ |
| $5$ | $95:-33693284163\quad 96:48129711529\quad 97:5214290036$ |
| $6$ | $6:481005273955\quad 7:-299769447514\quad 8:-317844288043\quad 9:-52894789687\quad 10:88475350813$ |
| $6$ | $11:-100857508929\quad 12:155281350532\quad 13:-142806241277\quad 14:81188207\quad 15:-18880780202$ |
| $6$ | $16:57366358044\quad 17:-62802653550\quad 18:300233897\quad 19:111430383030\quad 20:-214612134993$ |
| $6$ | $21:-42424825810\quad 22:-138613033507\quad 23:9753543923\quad 24:-119773670111\quad 25:-51077241464$ |
| $6$ | $26:63705096807\quad 27:4098499160\quad 28:137739810425\quad 29:49501238973\quad 30:1122227870$ |
| $6$ | $31:-215061474284\quad 32:-18293202451\quad 33:-119178382360\quad 34:43411283122\quad 35:46693424699$ |
| $6$ | $36:-178023065220\quad 37:-70245064295\quad 38:6770441206\quad 39:-57691992987\quad 40:-99822925050$ |
| $6$ | $41:-49084539539\quad 42:40433310355\quad 43:-52265970916\quad 44:-27947607079\quad 45:41297853638$ |
| $6$ | $46:-148906798\quad 47:724416198\quad 48:-62408366259\quad 49:-69477834143\quad 50:2054851143$ |
| $6$ | $51:-6834876061\quad 52:42272488623\quad 53:78738104214\quad 54:-471314477894\quad 55:283937410377$ |
| $6$ | $56:12901643864\quad 57:152637818970\quad 58:72610079052\quad 59:31052734829\quad 60:18912152035$ |
| $6$ | $61:189029690290\quad 62:148906798\quad 63:-28872535248\quad 64:91169830020\quad 65:34659018373$ |
| $6$ | $66:-22019068\quad 67:80606979236\quad 68:54874166726\quad 69:-11505242521\quad 70:90025814393$ |
| $6$ | $71:123597641377\quad 72:-111273501876\quad 73:194091658791\quad 74:17567888114\quad 75:34857377638$ |
| $6$ | $76:29713703640\quad 77:-8979322025\quad 78:2058271338\quad 79:-112156937002\quad 80:-94228816785$ |
| $6$ | $81:-57217796497\quad 82:15599477970\quad 83:17097576237\quad 84:-142256712672\quad 85:-24871475077$ |
| $6$ | $86:3691436435\quad 87:51084291030\quad 88:-51687887143\quad 89:119909442077\quad 90:1076960243$ |
| $6$ | $91:-11096015264\quad 92:142469797559\quad 93:-107097798964\quad 94:-81188207\quad 95:21346551895$ |
| $6$ | $96:74703993957\quad 97:46395614721$ |
| $7$ | $7:2934933743206\quad 8:204432768591\quad 9:-324271681145\quad 10:254612854088\quad 11:-840714585298$ |
| $7$ | $12:275669335215\quad 13:60955711294\quad 14:-36997657473\quad 15:195873624833\quad 16:240483783648$ |
| $7$ | $17:142433093782\quad 18:38486174964\quad 19:-239082105915\quad 20:-358136684783\quad 21:132484691890$ |
| $7$ | $22:450681582861\quad 23:578382987544\quad 24:61117882553\quad 25:-395599330270\quad 26:-72903880004$ |
| $7$ | $27:-641400742402\quad 28:-265748759384\quad 29:232157986211\quad 30:-95865607711\quad 31:-664208347521$ |
| $7$ | $32:332856406252\quad 33:-19525840017\quad 34:-196828316794\quad 35:146483200190\quad 36:425214329096$ |
| $7$ | $37:119978704370\quad 38:-394625536345\quad 39:-49937309978\quad 40:60972695593\quad 41:-26406584211$ |
| $7$ | $42:-140630796346\quad 43:115340169002\quad 44:128087335129\quad 45:34703786811\quad 46:15949285847$ |
| $7$ | $47:29113536600\quad 48:-13193106700\quad 49:-62406436478\quad 50:-188751552605\quad 51:77237032266$ |
| $7$ | $52:-152146428251\quad 53:-42585799446\quad 54:-107944039835\quad 55:-35767853665\quad 56:-145157736605$ |
| $7$ | $57:-199360734510\quad 58:474515704859\quad 59:5820792165\quad 60:-73015259216\quad 61:-19820577128$ |
| $7$ | $62:55650954269\quad 63:-8364400157\quad 64:97401095524\quad 65:76374341820\quad 66:-56622495085$ |
| $7$ | $67:-53665989706\quad 68:48110807337\quad 69:50022081506\quad 70:146255701438\quad 71:532573430037$ |
| $7$ | $72:87818279221\quad 73:-171452026098\quad 74:-508060794277\quad 75:-83923565331\quad 76:265533962095$ |
| $7$ | $77:257606604599\quad 78:-339068401922\quad 79:-35338651158\quad 80:89198842335\quad 81:-372246151049$ |
| $7$ | $82:126051344\quad 83:74950463981\quad 84:-148937152171\quad 85:33377050495\quad 86:-41479079979$ |
| $7$ | $87:-134578776483\quad 88:-24792897610\quad 89:-48264609911\quad 90:-272842157835\quad 91:-166162614590$ |
| $7$ | $92:72253547085\quad 93:-159416673084\quad 94:-44133730938\quad 95:15441877157\quad 96:13921208334$ |
| $7$ | $97:111346113812$ |
| $8$ | $8:2872256978932\quad 9:-257075243581\quad 10:323346790831\quad 11:-811099976029\quad 12:-9371529880$ |
| $8$ | $13:91943520\quad 14:119124745071\quad 15:60303230523\quad 16:167338437967\quad 17:5189070709$ |
| $8$ | $18:-11633295906\quad 19:-24686533263\quad 20:78608861359\quad 21:-66592826578\quad 22:-269966512244$ |
| $8$ | $23:1057699961576\quad 24:602488158814\quad 25:-326034841879\quad 26:234389969407\quad 27:-631557456383$ |
| $8$ | $28:-495753113441\quad 29:385967267996\quad 30:-237517307242\quad 31:-164478822801\quad 32:454821144275$ |
| $8$ | $33:-51209539189\quad 34:-421344647950\quad 35:122623529392\quad 36:242286795159\quad 37:185363964217$ |
| $8$ | $38:-113490521794\quad 39:-480703791\quad 40:26175864338\quad 41:94080504964\quad 42:-46618696397$ |
| $8$ | $43:129611529927\quad 44:135515934611\quad 45:23351944127\quad 46:44262744135\quad 47:62678541059$ |
| $8$ | $48:29111246814\quad 49:728136401\quad 50:328352498\quad 51:32169852784\quad 52:-70839128946$ |
| $8$ | $53:28035175142\quad 54:-29882477303\quad 55:128086063535\quad 56:68959338902\quad 57:-95774670543$ |
| $8$ | $58:41257353497\quad 59:72826413311\quad 60:103166548238\quad 61:92730244651\quad 62:-3096139538$ |
| $8$ | $63:-35256190622\quad 64:10878455437\quad 65:58052799835\quad 66:-111287728586\quad 67:-103215063291$ |
| $8$ | $68:-91197980918\quad 69:-40882125538\quad 70:13836344318\quad 71:128573386489\quad 72:-68291808509$ |
| $8$ | $73:-58948954907\quad 74:-743716865968\quad 75:66545462754\quad 76:294438561524\quad 77:215622418671$ |
| $8$ | $78:-241556834905\quad 79:-283277977318\quad 80:-44310290579\quad 81:-135370954486\quad 82:-45445713423$ |
| $8$ | $83:193165627905\quad 84:-7013435338\quad 85:74175286218\quad 86:-107887716026\quad 87:-240147834987$ |
| $8$ | $88:131315849561\quad 89:-8781366499\quad 90:-322915024100\quad 91:2454759263\quad 92:-140567786863$ |
| $8$ | $93:110633794506\quad 94:19194620737\quad 95:105023634741\quad 96:29427068263\quad 97:-39898951802$ |
| $9$ | $9:1468448263385\quad 10:161870479985\quad 11:651979136239\quad 12:74416618680\quad 13:280409503019$ |
| $9$ | $14:-130584430536\quad 15:-64186613408\quad 16:7364541600\quad 17:178027361367\quad 18:88684583488$ |
| $9$ | $19:89743048046\quad 20:145822482145\quad 21:-5943616995\quad 22:-331481879179\quad 23:-545197854139$ |
| $9$ | $24:-184153029084\quad 25:37621783096\quad 26:89011764482\quad 27:206339204662\quad 28:506980632943$ |
| $9$ | $29:-376950059964\quad 30:-340319419829\quad 31:15974652987\quad 32:-406327932616\quad 33:-99023442894$ |
| $9$ | $34:-233758259436\quad 35:9134166987\quad 36:-23674665954\quad 37:70559037200\quad 38:-184257281355$ |
| $9$ | $39:68146071229\quad 40:17266368110\quad 41:59822990982\quad 42:-36999021629\quad 43:27363591225$ |
| $9$ | $44:49426167914\quad 45:1042047982\quad 46:-138388219112\quad 47:44256972300\quad 48:15944311905$ |
| $9$ | $49:-148906798\quad 50:-57350161501\quad 51:111226902685\quad 52:116766235486\quad 53:695675894$ |
| $9$ | $54:-82336929050\quad 55:-142867886787\quad 56:-21230374879\quad 57:1275934943\quad 58:-120048980140$ |
| $9$ | $59:139273083018\quad 60:-71573089085\quad 61:1275934943\quad 62:-8223858385\quad 63:-21834030157$ |
| $9$ | $64:14623354157\quad 65:695675894\quad 66:-87093496403\quad 67:-25678066185\quad 68:32188179877$ |
| $9$ | $69:-695675894\quad 70:-85167647575\quad 71:-164729344908\quad 72:12933912883\quad 73:-1275934943$ |
| $9$ | $74:-56039673315\quad 75:152444799597\quad 76:-91283751731\quad 77:82247648372\quad 78:-436522288754$ |
| $9$ | $79:132662410873\quad 80:-157651353839\quad 81:44843748980\quad 82:65401269944\quad 83:-49128421352$ |
| $9$ | $84:38473813803\quad 85:549145272\quad 86:-72938837816\quad 87:-117273137986\quad 88:18484029700$ |
| $9$ | $89:1627074689\quad 90:-9621363727\quad 91:64236280945\quad 92:15012182377\quad 93:17622128878$ |
| $9$ | $94:-300448901836\quad 95:-113780031657\quad 96:-62219233546\quad 97:9563497771$ |
| $10$ | $10:3300246408044\quad 11:-91977941568\quad 12:-75111694229\quad 13:145743734507\quad 14:-24450082919$ |
| $10$ | $15:-222152850466\quad 16:312542358232\quad 17:-169031418683\quad 18:-57184834793\quad 19:2133752305$ |
| $10$ | $20:-502102828776\quad 21:-111176117050\quad 22:1022893371021\quad 23:206943042405\quad 24:-1030765865019$ |
| $10$ | $25:121596208077\quad 26:39303155181\quad 27:-76820880927\quad 28:-248012500178\quad 29:-84356623190$ |
| $10$ | $30:-337962441064\quad 31:-630937879758\quad 32:-330678822950\quad 33:-198989591141\quad 34:-563500558300$ |
| $10$ | $35:-249510411685\quad 36:-418079844836\quad 37:-143798895919\quad 38:-2038939593960\quad 39:600860456908$ |
| $10$ | $40:-35055263777\quad 41:445488589404\quad 42:216053693937\quad 43:-603819254331\quad 44:-448212901943$ |
| $10$ | $45:-2524358219\quad 46:44843748980\quad 47:-135352111978\quad 48:-372260230023\quad 49:-57211317865$ |
| $10$ | $50:-619343743244\quad 51:-125548040702\quad 52:96182487087\quad 53:246704075781\quad 54:8061955757$ |
| $10$ | $55:126034601649\quad 56:441814760170\quad 57:-127143111551\quad 58:1845387439063\quad 59:-434071780737$ |
| $10$ | $60:67866986306\quad 61:937628782334\quad 62:-44843748980\quad 63:-27610780776\quad 64:155465365200$ |
| $10$ | $65:28055170909\quad 66:-19300147613\quad 67:152187978282\quad 68:-168448618237\quad 69:-40856819049$ |
| $10$ | $70:2065146187630\quad 71:-338168392032\quad 72:298283865200\quad 73:769373831740\quad 74:-908282531100$ |
| $10$ | $75:53818477070\quad 76:394912645198\quad 77:-215114619799\quad 78:-619854866013\quad 79:-564788326954$ |
| $10$ | $80:-344565467154\quad 81:-555997521040\quad 82:135131671036\quad 83:-19650131265\quad 84:-13948340685$ |
| $10$ | $85:332369160646\quad 86:-1111687654869\quad 87:577742384390\quad 88:430281328053\quad 89:775571427163$ |
| $10$ | $90:-54458154476\quad 91:-95432864590\quad 92:24471189479\quad 93:23435638889\quad 94:24450082919$ |
| $10$ | $95:22265961560\quad 96:134887317630\quad 97:-151449009436$ |
| $11$ | $11:4057292641701\quad 12:-66862337463\quad 13:1474448434881\quad 14:-154865339664\quad 15:-114593273131$ |
| $11$ | $16:299910776822\quad 17:313548776341\quad 18:257196667057\quad 19:187098911108\quad 20:397496944323$ |
| $11$ | $21:400331667078\quad 22:-137940741532\quad 23:-73768622647\quad 24:-605383628290\quad 25:60172395485$ |
| $11$ | $26:-322899181533\quad 27:203651685359\quad 28:732457654507\quad 29:-552719165114\quad 30:-739421655787$ |
| $11$ | $31:855877574327\quad 32:-715070842863\quad 33:-94992939251\quad 34:-420657660308\quad 35:13998210858$ |
| $11$ | $36:-853766263325\quad 37:353650506350\quad 38:202441109783\quad 39:231404860378\quad 40:171416938436$ |
| $11$ | $41:475832087045\quad 42:-193859598237\quad 43:-137782024307\quad 44:170681962972\quad 45:-19342689765$ |
| $11$ | $46:-157646485376\quad 47:-44305986775\quad 48:89198961091\quad 49:-94232863549\quad 50:-73743450821$ |
| $11$ | $51:-364986858851\quad 52:48016285494\quad 53:101547727190\quad 54:193072817187\quad 55:-213492018916$ |
| $11$ | $56:61387952153\quad 57:229717686724\quad 58:112803119303\quad 59:373385099456\quad 60:-28174139499$ |
| $11$ | $61:-182771587958\quad 62:-24110179957\quad 63:-52959928891\quad 64:-342111627140\quad 65:-103347945055$ |
| $11$ | $66:26359072939\quad 67:-35317839945\quad 68:63785628568\quad 69:2269663429\quad 70:175335078596$ |
| $11$ | $71:-290726312331\quad 72:-2440397268\quad 73:40135462394\quad 74:-218292482661\quad 75:253065755976$ |
| $11$ | $76:-1073754284111\quad 77:295084836274\quad 78:-329408872483\quad 79:-204190213494\quad 80:-476046833268$ |
| $11$ | $81:-344602380372\quad 82:137735567124\quad 83:-281902181839\quad 84:78649780225\quad 85:-11940142000$ |
| $11$ | $86:-359590539138\quad 87:-301036377020\quad 88:-75641483580\quad 89:-142132165830\quad 90:99702255206$ |
| $11$ | $91:-75627822622\quad 92:-398448490673\quad 93:788556168855\quad 94:-202098913369\quad 95:-264826651043$ |
| $11$ | $96:-181922659032\quad 97:-190144008141$ |
| $12$ | $12:2225392306891\quad 13:117034451732\quad 14:181743173700\quad 15:134845312993\quad 16:383650353475$ |
| $12$ | $17:106557488955\quad 18:182774378385\quad 19:112317553614\quad 20:249615360079\quad 21:310300931443$ |
| $12$ | $22:-1040682636315\quad 23:-440279941199\quad 24:-837588561618\quad 25:323345193630\quad 26:-127963612423$ |
| $12$ | $27:-87102488926\quad 28:208407358146\quad 29:114890516032\quad 30:-16025341459\quad 31:-390319008207$ |
| $12$ | $32:-461841174\quad 33:43008954638\quad 34:-501581054466\quad 35:-209074545639\quad 36:-386728540940$ |
| $12$ | $37:-693415180578\quad 38:482445538553\quad 39:-170175014202\quad 40:-633980520813\quad 41:-348431582993$ |
| $12$ | $42:139249925408\quad 43:-234250682892\quad 44:-171751918180\quad 45:17834001855\quad 46:132675866845$ |
| $12$ | $47:-283293228918\quad 48:-35360613775\quad 49:-112176095874\quad 50:302956014432\quad 51:432363330893$ |
| $12$ | $52:-59577275711\quad 53:43831212183\quad 54:102359574666\quad 55:394462345649\quad 56:92273437551$ |
| $12$ | $57:32465833894\quad 58:-865767463077\quad 59:-267586474892\quad 60:43976314729\quad 61:111984545527$ |
| $12$ | $62:58408276102\quad 63:196465309900\quad 64:61084310040\quad 65:88238057033\quad 66:25236001426$ |
| $12$ | $67:-99856291890\quad 68:-2388655989\quad 69:41054621528\quad 70:-482817833578\quad 71:407092330052$ |
| $12$ | $72:-17420489923\quad 73:23977986705\quad 74:-597787609350\quad 75:-128875789348\quad 76:20552220063$ |
| $12$ | $77:-513312172560\quad 78:-546925405529\quad 79:132616262481\quad 80:-204164773897\quad 81:-564789772651$ |
| $12$ | $82:-12635525453\quad 83:-22144306283\quad 84:-179439264665\quad 85:4430129153\quad 86:548792181535$ |
| $12$ | $87:33731463607\quad 88:-112260945526\quad 89:73747904255\quad 90:-159318714571\quad 91:-60680519161$ |
| $12$ | $92:27930689481\quad 93:-291295194102\quad 94:2371521669\quad 95:-125618458178\quad 96:-192599557341$ |
| $12$ | $97:12749354508$ |
| $13$ | $13:10204409215166\quad 14:-528450063414\quad 15:-172555430693\quad 16:-826825559875\quad 17:3297556891057$ |
| $13$ | $18:-82263606386\quad 19:-123753513207\quad 20:2012744830235\quad 21:2557308771584\quad 22:-351303478155$ |
| $13$ | $23:1982200126122\quad 24:321230760591\quad 25:3519056014297\quad 26:-501469712008\quad 27:-419814094578$ |
| $13$ | $28:-309749137207\quad 29:-38039346760\quad 30:-1513220573498\quad 31:679707024801\quad 32:-687386278177$ |
| $13$ | $33:-135123551543\quad 34:-537646740189\quad 35:-67955976369\quad 36:-468734539449\quad 37:-975305667883$ |
| $13$ | $38:-593073114323\quad 39:-418213357056\quad 40:-293727189984\quad 41:-826906155331\quad 42:94267883074$ |
| $13$ | $43:-141573295509\quad 44:84993990626\quad 45:-14403758089\quad 46:-436498794892\quad 47:-241564502781$ |
| $13$ | $48:-339041469899\quad 49:2058271338\quad 50:-628437292410\quad 51:-474606878549\quad 52:-490364407808$ |
| $13$ | $53:-9616013332\quad 54:-88965979458\quad 55:56331800329\quad 56:-85361813810\quad 57:-17636671806$ |
| $13$ | $58:168098448565\quad 59:184778932766\quad 60:20410999873\quad 61:-17636671806\quad 62:-124800163307$ |
| $13$ | $63:51139998520\quad 64:-115189829986\quad 65:-9616013332\quad 66:-31573079957\quad 67:-272041327981$ |
| $13$ | $68:-11629558205\quad 69:9616013332\quad 70:279136804118\quad 71:371500088330\quad 72:-79792296182$ |
| $13$ | $73:17636671806\quad 74:-1070551447800\quad 75:-175859567966\quad 76:-397276870116\quad 77:-1136872055103$ |
| $13$ | $78:-2179855793982\quad 79:-546954407953\quad 80:-329375045337\quad 81:-619854866013\quad 82:220901278719$ |
| $13$ | $83:35361229335\quad 84:-8449015605\quad 85:-7590586804\quad 86:112509056249\quad 87:-97806503700$ |
| $13$ | $88:-340834358434\quad 89:-22490317747\quad 90:-334607877794\quad 91:-41294375550\quad 92:-351205996626$ |
| $13$ | $93:-243582719621\quad 94:-1140774260261\quad 95:-483523428964\quad 96:-911043909515\quad 97:-132191905547$ |
| $14$ | $14:1435685503535\quad 15:-316510089080\quad 16:311512581159\quad 17:-262807949181\quad 18:-887127236$ |
| $14$ | $19:-30568410941\quad 20:-231669592052\quad 21:243105822158\quad 22:-32617190205\quad 23:-60650385469$ |
| $14$ | $24:-27684141090\quad 25:438827294650\quad 26:-379302214\quad 27:-87863474312\quad 28:-19665989435$ |
| $14$ | $29:71345145221\quad 30:-119095431393\quad 31:-52846800527\quad 32:53502965706\quad 33:302250077856$ |
| $14$ | $34:695675894\quad 35:120677518627\quad 36:-307296552278\quad 37:-776279444197\quad 38:274680212607$ |
| $14$ | $39:144427469017\quad 40:-116448164211\quad 41:-257281337629\quad 42:-695675894\quad 43:61420041000$ |
| $14$ | $44:-22755123726\quad 45:20657842421\quad 46:-99009441322\quad 47:-51189007634\quad 48:-19514251637$ |
| $14$ | $49:-119196441111\quad 50:-9608084116\quad 51:76008980155\quad 52:52350560632\quad 53:18971653373$ |
| $14$ | $54:-568154094\quad 55:-4025411108\quad 56:42757672846\quad 57:-35864091869\quad 58:-44843748980$ |
| $14$ | $59:125855933626\quad 60:98814233761\quad 61:58924095137\quad 62:39610356924\quad 63:-320917931127$ |
| $14$ | $64:199595100547\quad 65:99567569311\quad 66:-299409567\quad 67:145996305191\quad 68:-207909843239$ |
| $14$ | $69:23463323696\quad 70:-38470786887\quad 71:-88378917950\quad 72:135612489921\quad 73:16888802260$ |
| $14$ | $74:-695675894\quad 75:378302418088\quad 76:-998743104\quad 77:-680542985210\quad 78:-135113637170$ |
| $14$ | $79:43030281092\quad 80:-94975015977\quad 81:-199032360167\quad 82:379302214\quad 83:6245822048$ |
| $14$ | $84:50123708482\quad 85:-17117459272\quad 86:-99216709958\quad 87:112748166551\quad 88:141620813631$ |
| $14$ | $89:-236782677957\quad 90:-379302214\quad 91:-32486925867\quad 92:-156843134042\quad 93:56109600802$ |
| $14$ | $94:269920176108\quad 95:-39728218850\quad 96:-43408271974\quad 97:-408781108$ |
| $15$ | $15:1920971831130\quad 16:-124854161053\quad 17:182911830331\quad 18:69528832812\quad 19:-311552259077$ |
| $15$ | $20:-87528899745\quad 21:-1958482630\quad 22:-6533686873\quad 23:-244606540609\quad 24:195881615389$ |
| $15$ | $25:434727082882\quad 26:6032885490\quad 27:-80463938017\quad 28:97459228050\quad 29:198072332162$ |
| $15$ | $30:-75602491184\quad 31:-309934561736\quad 32:763286952363\quad 33:53488082173\quad 34:-87586136463$ |
| $15$ | $35:-16270973403\quad 36:147184363644\quad 37:-426710693316\quad 38:291465996624\quad 39:530706810530$ |
| $15$ | $40:114342678183\quad 41:30433643603\quad 42:-119459908261\quad 43:48035073634\quad 44:127723910507$ |
| $15$ | $45:-36245206255\quad 46:-406324265837\quad 47:454810581340\quad 48:332865082422\quad 49:-18282551410$ |
| $15$ | $50:-108966310090\quad 51:152670222931\quad 52:98888915744\quad 53:-3705691748\quad 54:1357401096$ |
| $15$ | $55:144557159730\quad 56:32555674951\quad 57:5053613919\quad 58:-209362023491\quad 59:-39207117016$ |
| $15$ | $60:-34510043288\quad 61:9666447996\quad 62:508114327577\quad 63:-61252017695\quad 64:-317459297829$ |
| $15$ | $65:410779743\quad 66:92422924001\quad 67:86752119691\quad 68:-48571511051\quad 69:21370163363$ |
| $15$ | $70:-300296695433\quad 71:155379182643\quad 72:121077006108\quad 73:1964250848\quad 74:35715091880$ |
| $15$ | $75:-20616750377\quad 76:-172739392047\quad 77:-265644522145\quad 78:-687376377849\quad 79:-477430791$ |
| $15$ | $80:-715068035095\quad 81:-330683795720\quad 82:-68828895206\quad 83:-90482165078\quad 84:126652559459$ |
| $15$ | $85:48538191130\quad 86:671078903\quad 87:-81013587699\quad 88:-154702164311\quad 89:-282219552215$ |
| $15$ | $90:17688477118\quad 91:41970254032\quad 92:287561434199\quad 93:92940988898\quad 94:-228203132112$ |
| $15$ | $95:-177038315946\quad 96:-206741194592\quad 97:80226957532$ |
| $16$ | $16:4238728178451\quad 17:59017938965\quad 18:-80951618255\quad 19:-365258674716\quad 20:-372507956594$ |
| $16$ | $21:232971532294\quad 22:467560198551\quad 23:411008783229\quad 24:490998457923\quad 25:949361748848$ |
| $16$ | $26:-58523137605\quad 27:14093641836\quad 28:206124799113\quad 29:8766843952\quad 30:-705265130295$ |
| $16$ | $31:-1622042811264\quad 32:-309939274728\quad 33:-52838691429\quad 34:66226544030\quad 35:42741319827$ |
| $16$ | $36:-488274326036\quad 37:-1374213240498\quad 38:-664885842720\quad 39:195933048346\quad 40:408436506370$ |
| $16$ | $41:-404911969085\quad 42:-88204298579\quad 43:-37045531545\quad 44:-95753370020\quad 45:-54899501187$ |
| $16$ | $46:15988211986\quad 47:-164456512838\quad 48:-664206616585\quad 49:-215054422133\quad 50:1398263075731$ |
| $16$ | $51:-226244261181\quad 52:-32006722667\quad 53:-97286220827\quad 54:131975339745\quad 55:175838756903$ |
| $16$ | $56:45457071238\quad 57:-175229183625\quad 58:1065577763247\quad 59:-484234243665\quad 60:-242155868113$ |
| $16$ | $61:-179521656526\quad 62:140429248429\quad 63:313209693185\quad 64:-268460958673\quad 65:-394610915259$ |
| $16$ | $66:-96967910117\quad 67:-135990884558\quad 68:-125716126671\quad 69:17884665565\quad 70:1204787697832$ |
| $16$ | $71:-420465124661\quad 72:187163820781\quad 73:98967373576\quad 74:90978741473\quad 75:221386907348$ |
| $16$ | $76:-281578545132\quad 77:-1635020908058\quad 78:679754827427\quad 79:-390339191880\quad 80:855846546431$ |
| $16$ | $81:-630964142686\quad 82:-105819547560\quad 83:1030351039\quad 84:-44999065700\quad 85:-37154697964$ |
| $16$ | $86:-111332247182\quad 87:198921260577\quad 88:-4593586155\quad 89:-102915888199\quad 90:-26851124441$ |
| $16$ | $91:-66957903230\quad 92:-444512182547\quad 93:-567442315970\quad 94:-79580545087\quad 95:-137180618692$ |
| $16$ | $96:1725718815773\quad 97:-457984287253$ |
| $17$ | $17:3276957834450\quad 18:114474330757\quad 19:-279463516761\quad 20:1298811600265\quad 21:1371048015487$ |
| $17$ | $22:-108845566143\quad 23:13658999270\quad 24:931539162048\quad 25:2557291274369\quad 26:-61166737092$ |
| $17$ | $27:58998530714\quad 28:-26743830486\quad 29:-47184605791\quad 30:-1444519608014\quad 31:-705274067522$ |
| $17$ | $32:-75598443276\quad 33:-119073463253\quad 34:164746633891\quad 35:-1857815724\quad 36:617465805336$ |
| $17$ | $37:-531764292538\quad 38:-1108087850246\quad 39:-833467451946\quad 40:-724064584666\quad 41:-450852672310$ |
| $17$ | $42:-51058469216\quad 43:284285289148\quad 44:357226812545\quad 45:-7853337146\quad 46:-340308448343$ |
| $17$ | $47:-237534832508\quad 48:-95883379605\quad 49:1122227870\quad 50:-109423608850\quad 51:65647133053$ |
| $17$ | $52:-253772498024\quad 53:-5242923009\quad 54:-66765434733\quad 55:-193128860179\quad 56:-127148614189$ |
| $17$ | $57:-9616013332\quad 58:246531182884\quad 59:759114435874\quad 60:-597391520949\quad 61:-9616013332$ |
| $17$ | $62:-76977647666\quad 63:67406184900\quad 64:-81353985316\quad 65:-5242923009\quad 66:13673939112$ |
| $17$ | $67:-29692428926\quad 68:62709973685\quad 69:5242923009\quad 70:204076173206\quad 71:431914313981$ |
| $17$ | $72:-455257097386\quad 73:9616013332\quad 74:164435359576\quad 75:-85331964701\quad 76:-231908157718$ |
| $17$ | $77:-619854866013\quad 78:-1513173210514\quad 79:-16039026570\quad 80:-739400474941\quad 81:-337962441064$ |
| $17$ | $82:35383919095\quad 83:22074119162\quad 84:8872708387\quad 85:-4138603060\quad 86:-210412429658$ |
| $17$ | $87:-523489198709\quad 88:-274807878805\quad 89:-12262358663\quad 90:-212093977011\quad 91:62336461606$ |
| $17$ | $92:-154381855496\quad 93:-132808202433\quad 94:-226272949730\quad 95:-382385457445\quad 96:-403253178780$ |
| $17$ | $97:-72074773527$ |
| $18$ | $18:2806903004690\quad 19:-1438845812124\quad 20:482478495629\quad 21:-459314142023\quad 22:-78243482951$ |
| $18$ | $23:-83468301651\quad 24:-269946444182\quad 25:-784522376572\quad 26:-887127236\quad 27:-2534795744$ |
| $18$ | $28:-116963542573\quad 29:-200296169588\quad 30:-12262358663\quad 31:-102909868063\quad 32:-282227831222$ |
| $18$ | $33:-236763963969\quad 34:1627074689\quad 35:148309329560\quad 36:61690255037\quad 37:621633850314$ |
| $18$ | $38:-73979251998\quad 39:-246800424787\quad 40:20812985304\quad 41:-13017116682\quad 42:-1627074689$ |
| $18$ | $43:67540964044\quad 44:182072346558\quad 45:43020290675\quad 46:1627074689\quad 47:-8792484487$ |
| $18$ | $48:-48275803963\quad 49:119898998947\quad 50:316243183082\quad 51:154883083735\quad 52:-25904697065$ |
| $18$ | $53:345865361518\quad 54:-1298263443\quad 55:-232965990519\quad 56:162485492087\quad 57:518743578532$ |
| $18$ | $58:-104882359108\quad 59:291881083085\quad 60:8906722171\quad 61:-538489631469\quad 62:-1627074689$ |
| $18$ | $63:-131155932895\quad 64:-12547985162\quad 65:34214041459\quad 66:-367170500573\quad 67:-944962973026$ |
| $18$ | $68:-245000818741\quad 69:358255665012\quad 70:-88449862051\quad 71:68260719562\quad 72:-316883362584$ |
| $18$ | $73:-283757034680\quad 74:-1627074689\quad 75:109650519146\quad 76:-313992222943\quad 77:775941258608$ |
| $18$ | $78:-22490317747\quad 79:73756416145\quad 80:-142128368121\quad 81:775573319676\quad 82:887127236$ |
| $18$ | $83:20095641934\quad 84:22620459180\quad 85:56200420686\quad 86:-40335584931\quad 87:-128442057949$ |
| $18$ | $88:66553455156\quad 89:-431187698911\quad 90:-887127236\quad 91:-55955637664\quad 92:-99029815772$ |
| $18$ | $93:205849421797\quad 94:887127236\quad 95:-49978466203\quad 96:-236058978680\quad 97:274897902657$ |
| $19$ | $19:1922375901602\quad 20:-122116634490\quad 21:-429795994976\quad 22:-106591176534\quad 23:40840387369$ |
| $19$ | $24:-122064904448\quad 25:-229712600137\quad 26:83782201264\quad 27:41904238788\quad 28:176499865030$ |
| $19$ | $29:15825327630\quad 30:-274792734095\quad 31:-4593234020\quad 32:-154690162594\quad 33:141602001951$ |
| $19$ | $34:36721948198\quad 35:76092466406\quad 36:-258345821371\quad 37:448954493240\quad 38:-161504344087$ |
| $19$ | $39:-225597921291\quad 40:44372122183\quad 41:473003604696\quad 42:-17325473111\quad 43:34630265265$ |
| $19$ | $44:25112927485\quad 45:75548566061\quad 46:18497398168\quad 47:131313424567\quad 48:-24787661123$ |
| $19$ | $49:-51687735531\quad 50:-153384598321\quad 51:271842753205\quad 52:174637064163\quad 53:-335618709424$ |
| $19$ | $54:24546741117\quad 55:-226181064147\quad 56:-144492717408\quad 57:-139823783306\quad 58:-29857534494$ |
| $19$ | $59:121584981030\quad 60:-71129742901\quad 61:38707503025\quad 62:4920110876\quad 63:-100976990892$ |
| $19$ | $64:39230536364\quad 65:76755940071\quad 66:289070245551\quad 67:600602696803\quad 68:126061017138$ |
| $19$ | $69:-154056197660\quad 70:4794665741\quad 71:-74052113992\quad 72:-73628359811\quad 73:104124863431$ |
| $19$ | $74:157244224461\quad 75:55738982295\quad 76:-346324413642\quad 77:395156333269\quad 78:-340844019190$ |
| $19$ | $79:-112253250663\quad 80:-75644025026\quad 81:430310511723\quad 82:-57143138866\quad 83:-36010876485$ |
| $19$ | $84:19840363659\quad 85:-9980852608\quad 86:97278936734\quad 87:-106708777601\quad 88:131902251060$ |
| $19$ | $89:66561324472\quad 90:6310072160\quad 91:12565805754\quad 92:22594361715\quad 93:-72642574523$ |
| $19$ | $94:6906350982\quad 95:84232279297\quad 96:-70886543531\quad 97:-12147865038$ |
| $20$ | $20:2634222906281\quad 21:308123187455\quad 22:-475592666661\quad 23:117765511914\quad 24:291437297589$ |
| $20$ | $25:362341339174\quad 26:-120548820988\quad 27:54692221173\quad 28:29740715937\quad 29:-64670842795$ |
| $20$ | $30:-523528647866\quad 31:198919400508\quad 32:-81008454180\quad 33:112752003078\quad 34:128586464711$ |
| $20$ | $35:7744331745\quad 36:-19272303757\quad 37:334541077198\quad 38:138855991136\quad 39:-864944664628$ |
| $20$ | $40:-468128668563\quad 41:135773633297\quad 42:14127857620\quad 43:191719884105\quad 44:152251334654$ |
| $20$ | $45:44634303099\quad 46:-117266244952\quad 47:-240147034647\quad 48:-134584698770\quad 49:51073764044$ |
| $20$ | $50:366836215181\quad 51:418794366638\quad 52:-95035272721\quad 53:-107609479476\quad 54:-113029259197$ |
| $20$ | $55:-261798224331\quad 56:-121655599203\quad 57:90655334625\quad 58:-583965090318\quad 59:-133567978464$ |
| $20$ | $60:-468876906974\quad 61:-150051786310\quad 62:-102544502037\quad 63:-201852974989\quad 64:-38800773775$ |
| $20$ | $65:206131227380\quad 66:206856041400\quad 67:13444677618\quad 68:-62050194809\quad 69:-88930250891$ |
| $20$ | $70:-667668092983\quad 71:71996923805\quad 72:-343775892590\quad 73:-309453972027\quad 74:131108746242$ |
| $20$ | $75:-238719522663\quad 76:-775812025521\quad 77:64475868723\quad 78:-97806285464\quad 79:33749537908$ |
| $20$ | $80:-301021116009\quad 81:577742219785\quad 82:52697063626\quad 83:10907862804\quad 84:19985757743$ |
| $20$ | $85:255586048\quad 86:96648550216\quad 87:-32366608648\quad 88:-106715926369\quad 89:-128446210843$ |
| $20$ | $90:-50103804323\quad 91:25544111247\quad 92:-284098881295\quad 93:482039166863\quad 94:-111385192065$ |
| $20$ | $95:-234993473741\quad 96:-602968154502\quad 97:-221826736463$ |
| $21$ | $21:2565296600477\quad 22:-651650627128\quad 23:-123071439330\quad 24:192507103885\quad 25:1992309587951$ |
| $21$ | $26:-145674374357\quad 27:-202971958650\quad 28:43925737645\quad 29:136774996127\quad 30:-210419198735$ |
| $21$ | $31:-111337980692\quad 32:675443803\quad 33:-99236664314\quad 34:20921857033\quad 35:-147449979201$ |
| $21$ | $36:188540678915\quad 37:-1749176025160\quad 38:469235635185\quad 39:-305556902140\quad 40:-669113164819$ |
| $21$ | $41:-1483026777750\quad 42:-62155400960\quad 43:56139735083\quad 44:92760953294\quad 45:-25832627812$ |
| $21$ | $46:-72931746158\quad 47:-107880542330\quad 48:-41488879753\quad 49:3691436435\quad 50:-167743094955$ |
| $21$ | $51:-64653282471\quad 52:-84354698011\quad 53:-17245977884\quad 54:81506377721\quad 55:262513877589$ |
| $21$ | $56:78888849040\quad 57:-31630743573\quad 58:-91257059095\quad 59:235760572204\quad 60:-193015650546$ |
| $21$ | $61:-31630743573\quad 62:96380133156\quad 63:245131882456\quad 64:161965050458\quad 65:-17245977884$ |
| $21$ | $66:-223473606762\quad 67:75909701983\quad 68:-226934034454\quad 69:17245977884\quad 70:-305969133234$ |
| $21$ | $71:64548324860\quad 72:-40334656846\quad 73:31630743573\quad 74:-131611997769\quad 75:-182617384506$ |
| $21$ | $76:-94336234762\quad 77:-2038939593960\quad 78:112450656171\quad 79:548747085921\quad 80:-359575942444$ |
| $21$ | $81:-1111687654869\quad 82:39734486113\quad 83:-91794732380\quad 84:86943593702\quad 85:-13613447447$ |
| $21$ | $86:277764946869\quad 87:96663343018\quad 88:97275888231\quad 89:-40335584931\quad 90:-207032394303$ |
| $21$ | $91:-8437134649\quad 92:61960276604\quad 93:-436856943762\quad 94:154786328735\quad 95:-27922277189$ |
| $21$ | $96:-147086632844\quad 97:-237081480726$ |
| $22$ | $22:3699623756866\quad 23:795570932474\quad 24:19155533829\quad 25:-1096253772400\quad 26:-156209807047$ |
| $22$ | $27:-387503830370\quad 28:-360200538632\quad 29:-19567962535\quad 30:-450852672310\quad 31:-404882984584$ |
| $22$ | $32:30430826171\quad 33:-257286927625\quad 34:162368648501\quad 35:-33297586643\quad 36:539155586084$ |
| $22$ | $37:722401753302\quad 38:-2720010429921\quad 39:424210688757\quad 40:476066287468\quad 41:1096179627251$ |
| $22$ | $42:-67870578228\quad 43:236206670157\quad 44:-138895095658\quad 45:-65334112640\quad 46:59822990982$ |
| $22$ | $47:94099264735\quad 48:-26399780460\quad 49:-49059844146\quad 50:-826193743116\quad 51:-337534095615$ |
| $22$ | $52:-97100202432\quad 53:64296503617\quad 54:116228461430\quad 55:433195071986\quad 56:-350408685881$ |
| $22$ | $57:-453448327450\quad 58:3219830979955\quad 59:-176889519681\quad 60:-90518017915\quad 61:-470669588304$ |
| $22$ | $62:-59822990982\quad 63:28409794416\quad 64:113210753644\quad 65:-207754679178\quad 66:-24219854650$ |
| $22$ | $67:24012658408\quad 68:109514630952\quad 69:64349436261\quad 70:2472076264194\quad 71:645310842977$ |
| $22$ | $72:33770195911\quad 73:-588733394660\quad 74:408961365190\quad 75:-426112200889\quad 76:-18047376231$ |
| $22$ | $77:690452374759\quad 78:-826906155331\quad 79:-348415094758\quad 80:475811904672\quad 81:445479478922$ |
| $22$ | $82:-48588870613\quad 83:69614083083\quad 84:66043051666\quad 85:100490488783\quad 86:-1483026777750$ |
| $22$ | $87:135741718412\quad 88:472990205587\quad 89:-13029551451\quad 90:-108929334801\quad 91:34151968287$ |
| $22$ | $92:-139921439064\quad 93:242332216523\quad 94:32617190205\quad 95:166973712591\quad 96:344882320932$ |
| $22$ | $97:214593197464$ |
| $23$ | $23:4476545310030\quad 24:401616827142\quad 25:-577001499512\quad 26:-342454536817\quad 27:-1054978436310$ |
| $23$ | $28:-590490991398\quad 29:520451739091\quad 30:-724074004051\quad 31:408410746861\quad 32:114335017569$ |
| $23$ | $33:-116463057442\quad 34:-175616499321\quad 35:37971806545\quad 36:-89356621205\quad 37:967151232623$ |
| $23$ | $38:-288416043916\quad 39:6457502517\quad 40:329218134876\quad 41:476088809273\quad 42:-127397924130$ |
| $23$ | $43:159558478663\quad 44:128330430670\quad 45:76516643692\quad 46:17264431266\quad 47:26178745574$ |
| $23$ | $48:60980373920\quad 49:-99813047464\quad 50:12067633310\quad 51:-429602955723\quad 52:-470409068005$ |
| $23$ | $53:-248428161328\quad 54:14247334391\quad 55:196718472829\quad 56:-82352747502\quad 57:-411439129522$ |
| $23$ | $58:437606758129\quad 59:18225165680\quad 60:-361566032044\quad 61:260703307592\quad 62:-101192538513$ |
| $23$ | $63:-148676261819\quad 64:-80912361364\quad 65:-190882970953\quad 66:-124825448757\quad 67:-284984164057$ |
| $23$ | $68:-107992952433\quad 69:-185192541057\quad 70:493108702004\quad 71:580694857359\quad 72:47862586648$ |
| $23$ | $73:94552749435\quad 74:-1077923439419\quad 75:-281146959198\quad 76:-25110561173\quad 77:916407587915$ |
| $23$ | $78:-293740426533\quad 79:-633945413777\quad 80:171414834224\quad 81:-35060220824\quad 82:20869314141$ |
| $23$ | $83:209848911011\quad 84:-57303076900\quad 85:25344650551\quad 86:-669154157116\quad 87:-468122331627$ |
| $23$ | $88:44374230061\quad 89:20809492589\quad 90:-438683204272\quad 91:-95085938563\quad 92:-274851727132$ |
| $23$ | $93:1122412099133\quad 94:-139045032599\quad 95:-19343926271\quad 96:35591538205\quad 97:8666673515$ |
| $24$ | $24:2634633873143\quad 25:-14022071775\quad 26:77397488206\quad 27:-115016740009\quad 28:14979138724$ |
| $24$ | $29:252621217428\quad 30:-833401974277\quad 31:195943826219\quad 32:530740140568\quad 33:144432144843$ |
| $24$ | $34:601112111653\quad 35:372154256104\quad 36:406469651786\quad 37:-39882202773\quad 38:202097184587$ |
| $24$ | $39:-575762832718\quad 40:6444722722\quad 41:424174070718\quad 42:-117068320533\quad 43:346416519603$ |
| $24$ | $44:163349606321\quad 45:70440885017\quad 46:68152292846\quad 47:-466298482\quad 48:-49941040357$ |
| $24$ | $49:-57690756576\quad 50:434054479133\quad 51:-80217995845\quad 52:-147417131809\quad 53:44473133246$ |
| $24$ | $54:-44317452787\quad 55:-288183906933\quad 56:-195455166453\quad 57:-137089141984\quad 58:-590270517379$ |
| $24$ | $59:217762379078\quad 60:-106421868834\quad 61:-61208977769\quad 62:-105811102726\quad 63:95376301293$ |
| $24$ | $64:124135722364\quad 65:-61038510414\quad 66:38393362317\quad 67:-80345537732\quad 68:13546490024$ |
| $24$ | $69:36847158232\quad 70:-737424100707\quad 71:-108888778289\quad 72:-27121566697\quad 73:-296142690489$ |
| $24$ | $74:529698007568\quad 75:206997283885\quad 76:310067972525\quad 77:88211623\quad 78:-418122440731$ |
| $24$ | $79:-170121089289\quad 80:231395830281\quad 81:600814946794\quad 82:-131373865486\quad 83:338025286125$ |
| $24$ | $84:-116719275041\quad 85:8912061894\quad 86:-305555934219\quad 87:-864933549682\quad 88:-225604245606$ |
| $24$ | $89:-246812137624\quad 90:-8426677321\quad 91:157160150021\quad 92:-389719384928\quad 93:-240834667292$ |
| $24$ | $94:32023408848\quad 95:-24246724462\quad 96:100328193735\quad 97:-330627648268$ |
| $25$ | $25:7810446460211\quad 26:144898719876\quad 27:116019865976\quad 28:-156051988255\quad 29:204772322570$ |
| $25$ | $30:-1108096092221\quad 31:-664910993195\quad 32:291469010769\quad 33:274741151466\quad 34:-170001752521$ |
| $25$ | $35:-9912137582\quad 36:122557967756\quad 37:-3208153152448\quad 38:247358851050\quad 39:202041475604$ |
| $25$ | $40:-288421854987\quad 41:-2720010429921\quad 42:49554404888\quad 43:-2575155449\quad 44:73895068462$ |
| $25$ | $45:-47379466193\quad 46:-184233768956\quad 47:-113470859500\quad 48:-394574842270\quad 49:6770441206$ |
| $25$ | $50:189921634613\quad 51:261398381509\quad 52:313658368625\quad 53:-31630743573\quad 54:108037135074$ |
| $25$ | $55:-14204685599\quad 56:150573313797\quad 57:-58013755191\quad 58:-120279315330\quad 59:-85157669728$ |
| $25$ | $60:59108305129\quad 61:-58013755191\quad 62:304101114375\quad 63:470269404706\quad 64:-44789139048$ |
| $25$ | $65:-31630743573\quad 66:-39793948303\quad 67:280121170568\quad 68:-364967113016\quad 69:31630743573$ |
| $25$ | $70:-414408449558\quad 71:-559686330692\quad 72:76240609515\quad 73:58013755191\quad 74:75480130966$ |
| $25$ | $75:232930934105\quad 76:56953548308\quad 77:-3739606758795\quad 78:-593069587819\quad 79:482385596040$ |
| $25$ | $80:202429802204\quad 81:-2038939593960\quad 82:82422609318\quad 83:-45589796416\quad 84:181867774745$ |
| $25$ | $85:-24968341502\quad 86:469248688233\quad 87:138836373779\quad 88:-161493013286\quad 89:-73979251998$ |
| $25$ | $90:92719809119\quad 91:89383935790\quad 92:20440281792\quad 93:-801236674376\quad 94:-360982479505$ |
| $25$ | $95:-196835369174\quad 96:-113827205793\quad 97:-434829707724$ |
| $26$ | $26:638461380499\quad 27:-82595330915\quad 28:-170675776124\quad 29:-26640939958\quad 30:-5242923009$ |
| $26$ | $31:-394605941196\quad 32:408607590\quad 33:99576943280\quad 34:85764192423\quad 35:6662539432$ |
| $26$ | $36:286754137162\quad 37:-171592574063\quad 38:-31630743573\quad 39:-61051512582\quad 40:-190900592617$ |
| $26$ | $41:-207758386356\quad 42:168112134378\quad 43:95658286336\quad 44:-5547386967\quad 45:-31245896511$ |
| $26$ | $46:695675894\quad 47:58052014961\quad 48:76378711260\quad 49:34666351652\quad 50:-9608084116$ |
| $26$ | $51:122197626360\quad 52:104830364084\quad 53:-97758553521\quad 54:-6405527254\quad 55:-98602270092$ |
| $26$ | $56:64283320914\quad 57:33573676193\quad 58:-37023600873\quad 59:243145974406\quad 60:-51432818819$ |
| $26$ | $61:153463194924\quad 62:-695675894\quad 63:44938138219\quad 64:229394751111\quad 65:121993389644$ |
| $26$ | $66:-299409567\quad 67:-24943625842\quad 68:91297886238\quad 69:19109731994\quad 70:-72653506752$ |
| $26$ | $71:84108110812\quad 72:7657795207\quad 73:65818556105\quad 74:-229117769823\quad 75:265789878423$ |
| $26$ | $76:129057654165\quad 77:-48115804216\quad 78:-9616013332\quad 79:88244231851\quad 80:-103341529665$ |
| $26$ | $81:28092914569\quad 82:-92810716084\quad 83:104500020410\quad 84:41592450742\quad 85:56590891432$ |
| $26$ | $86:-17245977884\quad 87:206120385168\quad 88:76748750931\quad 89:34225478075\quad 90:-52704679996$ |
| $26$ | $91:117014912835\quad 92:327782470979\quad 93:-327716378885\quad 94:379302214\quad 95:55072668589$ |
| $26$ | $96:-105609348815\quad 97:114382977065$ |
| $27$ | $27:2760139674004\quad 28:-135255352576\quad 29:-450563913987\quad 30:-81328972718\quad 31:-268502952363$ |
| $27$ | $32:-317470004504\quad 33:199576989042\quad 34:6685413600\quad 35:92078749744\quad 36:-38332390319$ |
| $27$ | $37:-292628535180\quad 38:-44820360724\quad 39:124143098648\quad 40:-80912773357\quad 41:113200601015$ |
| $27$ | $42:49237389426\quad 43:-184278357012\quad 44:27904163595\quad 45:37285203322\quad 46:14626636011$ |
| $27$ | $47:10885784727\quad 48:97400895282\quad 49:91176191266\quad 50:-202521178249\quad 51:47328897372$ |
| $27$ | $52:147773954132\quad 53:70979356772\quad 54:15122474377\quad 55:-166593490844\quad 56:108499099213$ |
| $27$ | $57:174181048371\quad 58:-394574658012\quad 59:411762230808\quad 60:30494540919\quad 61:-8419096021$ |
| $27$ | $62:-35009456825\quad 63:-111278805673\quad 64:-73365717998\quad 65:229387503711\quad 66:41861822354$ |
| $27$ | $67:-2394371183\quad 68:136370301526\quad 69:14125633248\quad 70:-51784726765\quad 71:202651881721$ |
| $27$ | $72:106632591067\quad 73:208610056644\quad 74:83351031103\quad 75:-18339339791\quad 76:-81445796097$ |
| $27$ | $77:-454910445688\quad 78:-115170944574\quad 79:61089026125\quad 80:-342119150340\quad 81:155472130552$ |
| $27$ | $82:-14004472490\quad 83:73102862174\quad 84:195818903173\quad 85:-35760226228\quad 86:161987345757$ |
| $27$ | $87:-38808735086\quad 88:39227267648\quad 89:-12541653530\quad 90:273903449981\quad 91:159388354080$ |
| $27$ | $92:358545173260\quad 93:-500337177832\quad 94:-133147110138\quad 95:-46355957537\quad 96:-51970214358$ |
| $27$ | $97:155668249283$ |
| $28$ | $28:2536616889737\quad 29:-445265604866\quad 30:67386794821\quad 31:313219531011\quad 32:-61253707240$ |
| $28$ | $33:-320957849174\quad 34:-125554880835\quad 35:143310515565\quad 36:-392015134641\quad 37:-34529014663$ |
| $28$ | $38:470284662938\quad 39:95382290797\quad 40:-148681605501\quad 41:28399410115\quad 42:-63593125271$ |
| $28$ | $43:7045359814\quad 44:105083394424\quad 45:-96782512763\quad 46:-21840756098\quad 47:-35252914080$ |
| $28$ | $48:-8372904852\quad 49:-28885175292\quad 50:-121127084892\quad 51:-38113165045\quad 52:76649489$ |
| $28$ | $53:73718817871\quad 54:104918348219\quad 55:31933828560\quad 56:-13864665304\quad 57:15500936980$ |
| $28$ | $58:-367502955605\quad 59:129441790288\quad 60:-17778534378\quad 61:-37596228915\quad 62:-140834292251$ |
| $28$ | $63:-115616062714\quad 64:-111278052807\quad 65:44933187842\quad 66:9856140598\quad 67:22198954523$ |
| $28$ | $68:-14807720808\quad 69:-57446812187\quad 70:-28695598398\quad 71:88908674880\quad 72:-5879965833$ |
| $28$ | $73:16990918164\quad 74:-133636779466\quad 75:9459198575\quad 76:-176506072131\quad 77:51460976724$ |
| $28$ | $78:51147226057\quad 79:196462189519\quad 80:-52954296364\quad 81:-27621053917\quad 82:51996931979$ |
| $28$ | $83:-5157375106\quad 84:-122118016328\quad 85:-86564753363\quad 86:245124036100\quad 87:-201870905288$ |
| $28$ | $88:-100975124319\quad 89:-131157454118\quad 90:91901213468\quad 91:-17626974782\quad 92:-153975455890$ |
| $28$ | $93:-36180069786\quad 94:-52160044837\quad 95:-72399867483\quad 96:-94217542160\quad 97:-75298673858$ |
| $29$ | $29:1468443164863\quad 30:-76996428527\quad 31:140421334786\quad 32:508123919289\quad 33:39617845533$ |
| $29$ | $34:-112878715431\quad 35:111513844828\quad 36:75934980806\quad 37:-70559037200\quad 38:304112307903$ |
| $29$ | $39:-105825700765\quad 40:-101190260441\quad 41:-59822990982\quad 42:-10755275037\quad 43:18164849590$ |
| $29$ | $44:77307073943\quad 45:-1042047982\quad 46:-8228524661\quad 47:-3090621927\quad 48:55655546128$ |
| $29$ | $49:148906798\quad 50:-78375282937\quad 51:289037111533\quad 52:-39040368134\quad 53:-695675894$ |
| $29$ | $54:-50791619983\quad 55:141235972651\quad 56:-5851554476\quad 57:-1275934943\quad 58:-291186381059$ |
| $29$ | $59:-184110419611\quad 60:-19003205453\quad 61:-1275934943\quad 62:-27801472751\quad 63:-140826291986$ |
| $29$ | $64:-35014407202\quad 65:-695675894\quad 66:-12599818837\quad 67:-2213543098\quad 68:-83904796857$ |
| $29$ | $69:695675894\quad 70:-429059662253\quad 71:18972610917\quad 72:-105457548715\quad 73:1275934943$ |
| $29$ | $74:-142876690333\quad 75:-53219656682\quad 76:-103071691197\quad 77:-82247648372\quad 78:-124806373867$ |
| $29$ | $79:58423938548\quad 80:-24102487871\quad 81:-44843748980\quad 82:-7663732845\quad 83:40258901107$ |
| $29$ | $84:96915440983\quad 85:-549145272\quad 86:96371338299\quad 87:-102564247804\quad 88:4915440848$ |
| $29$ | $89:-1627074689\quad 90:18771396132\quad 91:908650918\quad 92:-39771939440\quad 93:-17622128878$ |
| $29$ | $94:23006867980\quad 95:-41740296033\quad 96:-79491733847\quad 97:-9563497771$ |
| $30$ | $30:3276960021387\quad 31:59074159568\quad 32:182918758433\quad 33:-262785007724\quad 34:9616013332$ |
| $30$ | $35:-455264302178\quad 36:431917236796\quad 37:204055845029\quad 38:2557308771584\quad 39:931570939085$ |
| $30$ | $40:13687555831\quad 41:-108847065682\quad 42:-9616013332\quad 43:-127149882980\quad 44:-193136388584$ |
| $30$ | $45:-66771493107\quad 46:178021753032\quad 47:5195696395\quad 48:142457789131\quad 49:-62791243624$ |
| $30$ | $50:-132808202433\quad 51:-154422129533\quad 52:62353753971\quad 53:-212099982665\quad 54:-7853337146$ |
| $30$ | $55:357208857820\quad 56:284302478505\quad 57:-51050526985\quad 58:-619854866013\quad 59:-231914948207$ |
| $30$ | $60:-85316699785\quad 61:164434054319\quad 62:-47190373901\quad 63:-26747758578\quad 64:59003753676$ |
| $30$ | $65:-61172601884\quad 66:-4138603060\quad 67:8875646972\quad 68:22070779197\quad 69:35378847307$ |
| $30$ | $70:-531764292538\quad 71:617424630812\quad 72:-1832712834\quad 73:164743222937\quad 74:-9616013332$ |
| $30$ | $75:-597360939751\quad 76:759140145272\quad 77:246505987885\quad 78:3297567157477\quad 79:106546723186$ |
| $30$ | $80:313550831756\quad 81:-169012531785\quad 82:5242923009\quad 83:62692378862\quad 84:-29678786944$ |
| $30$ | $85:13686216588\quad 86:1371048015487\quad 87:1298846317676\quad 88:-279445465455\quad 89:114478906634$ |
| $30$ | $90:-5242923009\quad 91:-253769972165\quad 92:65658679100\quad 93:-109410396910\quad 94:-76747763421$ |
| $30$ | $95:33166598946\quad 96:-215089731053\quad 97:23515814261$ |
| $31$ | $31:4238712359961\quad 32:-124865175251\quad 33:311502988480\quad 34:98973955802\quad 35:187140843773$ |
| $31$ | $36:-420468288580\quad 37:1204796365297\quad 38:949401186118\quad 39:490989979433\quad 40:411034644237$ |
| $31$ | $41:467588936785\quad 42:-175234693343\quad 43:45451738690\quad 44:175839106235\quad 45:131977787920$ |
| $31$ | $46:7366786151\quad 47:167329202227\quad 48:240483752026\quad 49:57373218134\quad 50:-567463164865$ |
| $31$ | $51:-444518252841\quad 52:-66967153650\quad 53:-26857306211\quad 54:-54890322233\quad 55:-95769715843$ |
| $31$ | $56:-37052404070\quad 57:-88196852729\quad 58:-1635014222610\quad 59:-281582361097\quad 60:221391982778$ |
| $31$ | $61:90933022439\quad 62:8769483612\quad 63:206106786925\quad 64:14065863122\quad 65:-58537341922$ |
| $31$ | $66:-37156821277\quad 67:-45015679524\quad 68:1018130418\quad 69:-105822057331\quad 70:-1374200134485$ |
| $31$ | $71:-488279805444\quad 72:42738807639\quad 73:66193439000\quad 74:-179510548770\quad 75:-242186014046$ |
| $31$ | $76:-484247433646\quad 77:1065564025319\quad 78:-826790618361\quad 79:383687740362\quad 80:299924548439$ |
| $31$ | $81:312570236082\quad 82:17892970398\quad 83:-125693981192\quad 84:-135990863011\quad 85:-96972643152$ |
| $31$ | $86:232987613888\quad 87:-372500169251\quad 88:-365253924780\quad 89:-80946512894\quad 90:-97287653645$ |
| $31$ | $91:-32004932629\quad 92:-226279549491\quad 93:1398228359622\quad 94:126032597634\quad 95:10342567523$ |
| $31$ | $96:-426878405163\quad 97:-238160089936$ |
| $32$ | $32:1920950734618\quad 33:-316494872556\quad 34:1981776342\quad 35:121074474226\quad 36:155389672504$ |
| $32$ | $37:-300306500074\quad 38:434740216197\quad 39:195858319043\quad 40:-244631127390\quad 41:-6531125425$ |
| $32$ | $42:5049256250\quad 43:32553972292\quad 44:144565505328\quad 45:1359631028\quad 46:-64197748574$ |
| $32$ | $47:60290108280\quad 48:195879335803\quad 49:-18875531554\quad 50:92955074404\quad 51:287572220567$ |
| $32$ | $52:41969491152\quad 53:17688523922\quad 54:-36249570855\quad 55:127705041985\quad 56:48040976695$ |
| $32$ | $57:-119456769276\quad 58:-265629875998\quad 59:-172742956001\quad 60:-20613434981\quad 61:35711320192$ |
| $32$ | $62:198062692180\quad 63:97469659286\quad 64:-80461792461\quad 65:6039640451\quad 66:48537089319$ |
| $32$ | $67:126657128057\quad 68:-90490890458\quad 69:-68822304786\quad 70:-426715093112\quad 71:147162274356$ |
| $32$ | $72:-16260672083\quad 73:-87590222060\quad 74:9664542916\quad 75:-34508178451\quad 76:-39213232353$ |
| $32$ | $77:-209389465564\quad 78:-172540412880\quad 79:134865345024\quad 80:-114585183678\quad 81:-222160906732$ |
| $32$ | $82:21373642047\quad 83:-48568628919\quad 84:86750352917\quad 85:92421312981\quad 86:-1956270235$ |
| $32$ | $87:-87543933554\quad 88:-311555658429\quad 89:69521919991\quad 90:-3702108113\quad 91:98889333994$ |
| $32$ | $92:152669403400\quad 93:-108999902831\quad 94:215726375581\quad 95:-185437793080\quad 96:-215260781446$ |
| $32$ | $97:-17302592570$ |
| $33$ | $33:1435701977795\quad 34:16910288811\quad 35:135629758939\quad 36:-88385500176\quad 37:-38470786887$ |
| $33$ | $38:438823942997\quad 39:-27703484772\quad 40:-60648706624\quad 41:-32617190205\quad 42:-35871897707$ |
| $33$ | $43:42767239136\quad 44:-4033715941\quad 45:-568154094\quad 46:-130577166344\quad 47:119131817308$ |
| $33$ | $48:-37003526310\quad 49:81188207\quad 50:56118872274\quad 51:-156802255522\quad 52:-32480715891$ |
| $33$ | $53:-379302214\quad 54:20652783190\quad 55:-22760807330\quad 56:61420300200\quad 57:-695675894$ |
| $33$ | $58:-680540734101\quad 59:-1029462401\quad 60:378297444025\quad 61:-695675894\quad 62:71342166033$ |
| $33$ | $63:-19672409798\quad 64:-87869649130\quad 65:-379302214\quad 66:-17119249082\quad 67:50130809604$ |
| $33$ | $68:6246005331\quad 69:379302214\quad 70:-776306326206\quad 71:-307313371736\quad 72:120664642798$ |
| $33$ | $73:695675894\quad 74:58934966544\quad 75:98779014365\quad 76:125844825870\quad 77:-44843748980$ |
| $33$ | $78:-528430645173\quad 79:181717009339\quad 80:-154859050074\quad 81:-24450082919\quad 82:23451345684$ |
| $33$ | $83:-207909842520\quad 84:146001814909\quad 85:-299409567\quad 86:243108067818\quad 87:-231647461611$ |
| $33$ | $88:-30577920334\quad 89:-887127236\quad 90:18956576591\quad 91:52342194514\quad 92:76010412974$ |
| $33$ | $93:-9608084116\quad 94:83379895215\quad 95:-82170342391\quad 96:-52000151652\quad 97:-5214290036$ |
| $34$ | $34:3925038160113\quad 35:-670899895480\quad 36:-41316610300\quad 37:273093636693\quad 38:58013755191$ |
| $34$ | $39:-296138878861\quad 40:94530522865\quad 41:-588735335362\quad 42:-178130544016\quad 43:9458682435$ |
| $34$ | $44:-268991905679\quad 45:-224865625835\quad 46:-1275934943\quad 47:-58953144480\quad 48:-171475454657$ |
| $34$ | $49:194085711257\quad 50:17622128878\quad 51:195138933093\quad 52:173906370206\quad 53:425494130849$ |
| $34$ | $54:-70410478186\quad 55:-490259595974\quad 56:-318100264353\quad 57:338770330853\quad 58:152703050833$ |
| $34$ | $59:339454108204\quad 60:-172038639866\quad 61:-63298846626\quad 62:1275934943\quad 63:16988640092$ |
| $34$ | $64:208594155045\quad 65:65801774734\quad 66:549145272\quad 67:67662545075\quad 68:-4176112481$ |
| $34$ | $69:-130304223258\quad 70:-36466933502\quad 71:-864030177899\quad 72:-67694017620\quad 73:170659129559$ |
| $34$ | $74:2440771237903\quad 75:-214629370195\quad 76:181127860843\quad 77:-107387436176\quad 78:17636671806$ |
| $34$ | $79:23976307859\quad 80:40137090205\quad 81:769408109259\quad 82:-502697170410\quad 83:-236943799786$ |
| $34$ | $84:-166386434860\quad 85:19731199503\quad 86:31630743573\quad 87:-309450925621\quad 88:104108170779$ |
| $34$ | $89:-283772980554\quad 90:326840526053\quad 91:-488618491572\quad 92:-495492148955\quad 93:-351285517508$ |
| $34$ | $94:-695675894\quad 95:2338991850\quad 96:-114380949216\quad 97:29518048743$ |
| $35$ | $35:1746577783692\quad 36:-516914585865\quad 37:-14541799656\quad 38:76226642292\quad 39:-27139485710$ |
| $35$ | $40:47850902747\quad 41:33778096900\quad 42:-211104933871\quad 43:-132051436483\quad 44:513423657709$ |
| $35$ | $45:351037538070\quad 46:12939161531\quad 47:-68308002836\quad 48:87814133592\quad 49:-111268390165$ |
| $35$ | $50:-248504329007\quad 51:238738539291\quad 52:249473106745\quad 53:-98287564333\quad 54:-69100704637$ |
| $35$ | $55:-440619771151\quad 56:-347339446990\quad 57:331536573038\quad 58:140001483325\quad 59:621450379555$ |
| $35$ | $60:134603559245\quad 61:-151381406254\quad 62:-105462757630\quad 63:-5874458627\quad 64:106650101592$ |
| $35$ | $65:7673211779\quad 66:37276560126\quad 67:121870330711\quad 68:178526940523\quad 69:66315982870$ |
| $35$ | $70:-268097507441\quad 71:-324610226023\quad 72:-425809912310\quad 73:-67680650951\quad 74:-206044473142$ |
| $35$ | $75:-265746323032\quad 76:-565777459452\quad 77:-112755178805\quad 78:-79802798287\quad 79:-17390297402$ |
| $35$ | $80:-2425592189\quad 81:298278547606\quad 82:203143367796\quad 83:-408714373413\quad 84:-234680528240$ |
| $35$ | $85:-72479968101\quad 86:-40369526540\quad 87:-343788332029\quad 88:-73624747334\quad 89:-316863221846$ |
| $35$ | $90:-29536183463\quad 91:-48781121251\quad 92:71884441130\quad 93:167739793514\quad 94:213799018517$ |
| $35$ | $95:-4128573040\quad 96:185501717468\quad 97:168571827249$ |
| $36$ | $36:4653625111646\quad 37:458196323199\quad 38:-559662230129\quad 39:-108882289390\quad 40:580719973017$ |
| $36$ | $41:645326670050\quad 42:-862358631611\quad 43:79781391447\quad 44:630230383496\quad 45:172816261654$ |
| $36$ | $46:-164724487539\quad 47:128594502113\quad 48:532602186360\quad 49:123599688479\quad 50:-98273184434$ |
| $36$ | $51:328425408044\quad 52:192759652558\quad 53:-645112371967\quad 54:311134229103\quad 55:585847122063$ |
| $36$ | $56:210166404561\quad 57:189697502837\quad 58:232476222978\quad 59:81386804114\quad 60:-412035824414$ |
| $36$ | $61:-885939773328\quad 62:18996684191\quad 63:88920977769\quad 64:202650332949\quad 65:84100294149$ |
| $36$ | $66:-170832375218\quad 67:10142544582\quad 68:278360979567\quad 69:149408127835\quad 70:18732249834$ |
| $36$ | $71:705454037833\quad 72:-324591078849\quad 73:-863990475084\quad 74:370933485762\quad 75:-1180586645211$ |
| $36$ | $76:542286215955\quad 77:396596285634\quad 78:371507408717\quad 79:407057320297\quad 80:-290703498134$ |
| $36$ | $81:-338156501026\quad 82:-8599532000\quad 83:-71596608090\quad 84:-266266912322\quad 85:5207390565$ |
| $36$ | $86:64526685534\quad 87:71989731923\quad 88:-74055459836\quad 89:68266133536\quad 90:-296800476360$ |
| $36$ | $91:-819610747586\quad 92:40277378088\quad 93:-415121566687\quad 94:-232256122503\quad 95:-156421856917$ |
| $36$ | $96:-368707113826\quad 97:187607256818$ |
| $37$ | $37:6418832092792\quad 38:-414389508606\quad 39:-737412532182\quad 40:493118048869\quad 41:2472089445076$ |
| $37$ | $42:-340956829375\quad 43:149785233384\quad 44:249841300009\quad 45:174890017753\quad 46:-85161489609$ |
| $37$ | $47:13834902725\quad 48:146256041928\quad 49:90019741714\quad 50:-286231364\quad 51:-244840854936$ |
| $37$ | $52:-173586433570\quad 53:-148371468612\quad 54:-71409336188\quad 55:-77804675757\quad 56:-233712283372$ |
| $37$ | $57:22477774208\quad 58:-77943015056\quad 59:-45509990180\quad 60:-30827952247\quad 61:48920748800$ |
| $37$ | $62:-429048231443\quad 63:-28683478568\quad 64:-51809575832\quad 65:-72690723954\quad 66:149736245036$ |
| $37$ | $67:-67622197380\quad 68:159473674075\quad 69:-14046379567\quad 70:283242831165\quad 71:18699936345$ |
| $37$ | $72:-268141280715\quad 73:-36476597930\quad 74:15558770754\quad 75:-643229811355\quad 76:312951890904$ |
| $37$ | $77:4952666710068\quad 78:279147608941\quad 79:-482770306196\quad 80:175355174136\quad 81:2065188801586$ |
| $37$ | $82:63176875939\quad 83:233851864495\quad 84:-105580451673\quad 85:-31559335061\quad 86:-305977939827$ |
| $37$ | $87:-667675515708\quad 88:4795719007\quad 89:-88449862051\quad 90:-440094034108\quad 91:-393740134956$ |
| $37$ | $92:-418998902763\quad 93:-974525291010\quad 94:-486148359256\quad 95:-89883615563\quad 96:-614844699674$ |
| $37$ | $97:-528946295350$ |
| $38$ | $38:7810444213245\quad 39:-14051114807\quad 40:-576988195558\quad 41:-1096247567864\quad 42:-58013755191$ |
| $38$ | $43:150562123303\quad 44:-14200095238\quad 45:108040118413\quad 46:37611080236\quad 47:-326023878539$ |
| $38$ | $48:-395591538827\quad 49:-51071412888\quad 50:-801236674376\quad 51:20449862676\quad 52:89385241262$ |
| $38$ | $53:92708137941\quad 54:-47379466193\quad 55:73898521609\quad 56:-2588556423\quad 57:49566761596$ |
| $38$ | $58:-3739606758795\quad 59:56958674483\quad 60:232952624278\quad 61:75452178099\quad 62:204759076023$ |
| $38$ | $63:-156041237363\quad 64:116021122725\quad 65:144893855411\quad 66:-24968341502\quad 67:181864421313$ |
| $38$ | $68:-45596885580\quad 69:82430397363\quad 70:-3208153152448\quad 71:122555593518\quad 72:-9927337754$ |
| $38$ | $73:-170003292254\quad 74:-58013755191\quad 75:59098041681\quad 76:-85167615541\quad 77:-120277630421$ |
| $38$ | $78:3519056014297\quad 79:323372221207\quad 80:60180650323\quad 81:121650875578\quad 82:31630743573$ |
| $38$ | $83:-364971325989\quad 84:280116270675\quad 85:-39792879871\quad 86:1992299321531\quad 87:362283874603$ |
| $38$ | $88:-229705377753\quad 89:-784510464276\quad 90:-31630743573\quad 91:313655396783\quad 92:261393263427$ |
| $38$ | $93:189929921273\quad 94:-93876794637\quad 95:-81670441669\quad 96:-624386969862\quad 97:-600950583525$ |
| $39$ | $39:2634613016259\quad 40:401623866734\quad 41:19163778895\quad 42:-137096054806\quad 43:-195463189740$ |
| $39$ | $44:-288165165659\quad 45:-44315542820\quad 46:-184140634713\quad 47:602517711217\quad 48:61159634573$ |
| $39$ | $49:-119773211741\quad 50:-240763136817\quad 51:-389738143861\quad 52:157150608935\quad 53:-8415168368$ |
| $39$ | $54:70446172280\quad 55:163352361217\quad 56:346407105835\quad 57:-117063897377\quad 58:151052315$ |
| $39$ | $59:310067208701\quad 60:207027339916\quad 61:529688400923\quad 62:252591755903\quad 63:14974811640$ |
| $39$ | $64:-114981740202\quad 65:77379459385\quad 66:8917832397\quad 67:-116732590170\quad 68:337999187647$ |
| $39$ | $69:-131400947381\quad 70:-39834368520\quad 71:406475885980\quad 72:372174012027\quad 73:601076615854$ |
| $39$ | $74:-61223194468\quad 75:-106421082955\quad 76:217792583086\quad 77:-590257722452\quad 78:321221167913$ |
| $39$ | $79:-837622070545\quad 80:-605392308104\quad 81:-1030822346122\quad 82:36860158261\quad 83:13542222931$ |
| $39$ | $84:-80363742460\quad 85:38398928270\quad 86:192487103248\quad 87:291440724943\quad 88:-122060083440$ |
| $39$ | $89:-269908631867\quad 90:44467113110\quad 91:-147431598439\quad 92:-80212477389\quad 93:434074199232$ |
| $39$ | $94:-427408702052\quad 95:-97664953111\quad 96:59560938458\quad 97:242344900066$ |
| $40$ | $40:4476561959436\quad 41:795555761473\quad 42:-411437345222\quad 43:-82345611502\quad 44:196765554307$ |
| $40$ | $45:14256096588\quad 46:-545156747838\quad 47:1057725675196\quad 48:578431028058\quad 49:9769327962$ |
| $40$ | $50:1122417967817\quad 51:-274886642949\quad 52:-95105302695\quad 53:-438715609585\quad 54:76509076748$ |
| $40$ | $55:128311350943\quad 56:159560630556\quad 57:-127398535296\quad 58:916424639629\quad 59:-25144091256$ |
| $40$ | $60:-281153920119\quad 61:-1077937481222\quad 62:520467886719\quad 63:-590495152461\quad 64:-1054955134286$ |
| $40$ | $65:-342446906203\quad 66:25332455698\quad 67:-57302726111\quad 68:209829854283\quad 69:20858568548$ |
| $40$ | $70:967155863849\quad 71:-89353876915\quad 72:37964642799\quad 73:-175626306044\quad 74:260702536505$ |
| $40$ | $75:-361568610066\quad 76:18225421629\quad 77:437579219586\quad 78:1982208694083\quad 79:-440239984516$ |
| $40$ | $80:-73777681978\quad 81:206891103864\quad 82:-185200321092\quad 83:-108005534773\quad 84:-284985303537$ |
| $40$ | $85:-124828031945\quad 86:-123079557422\quad 87:117760767390\quad 88:40825749869\quad 89:-83482518350$ |
| $40$ | $90:-248429641732\quad 91:-470413962105\quad 92:-429609817842\quad 93:12075978518\quad 94:-167575300187$ |
| $40$ | $95:-375228789153\quad 96:880735080501\quad 97:-269890440028$ |
| $41$ | $41:3699602463695\quad 42:-453462392549\quad 43:-350390314087\quad 44:433222791243\quad 45:116225139407$ |
| $41$ | $46:-331482201736\quad 47:-269945365904\quad 48:450715609752\quad 49:-138612028131\quad 50:242295951537$ |
| $41$ | $51:-139954513435\quad 52:34131597897\quad 53:-108955599009\quad 54:-65341758833\quad 55:-138914272116$ |
| $41$ | $56:236206444283\quad 57:-67869770526\quad 58:690453791949\quad 59:-18060316021\quad 60:-426145657926$ |
| $41$ | $61:408932124952\quad 62:-19555859414\quad 63:-360182099741\quad 64:-387514767506\quad 65:-156216780085$ |
| $41$ | $66:100493224055\quad 67:66039452461\quad 68:69615974013\quad 69:-48611041750\quad 70:722398257040$ |
| $41$ | $71:539137039880\quad 72:-33292297478\quad 73:162352757833\quad 74:-470679711600\quad 75:-90553592008$ |
| $41$ | $76:-176895151022\quad 77:3219820151846\quad 78:-351294505031\quad 79:-1040628440668\quad 80:-137949451890$ |
| $41$ | $81:1022844119453\quad 82:64353319631\quad 83:109505833640\quad 84:24014288467\quad 85:-24219854650$ |
| $41$ | $86:-651662228605\quad 87:-475599027056\quad 88:-106587045610\quad 89:-78243482951\quad 90:64316696850$ |
| $41$ | $91:-97110222463\quad 92:-337505937698\quad 93:-826193743116\quad 94:-167677657070\quad 95:-208181684089$ |
| $41$ | $96:47330474112\quad 97:-448280100405$ |
| $42$ | $42:1875413916710\quad 43:-375672450664\quad 44:-570232732784\quad 45:-210676106123\quad 46:1275934943$ |
| $42$ | $47:-95776281562\quad 48:-199366858953\quad 49:152638367826\quad 50:-17622128878\quad 51:-28212513799$ |
| $42$ | $52:-175049365058\quad 53:125064045481\quad 54:-130604525429\quad 55:-55260151778\quad 56:25453344275$ |
| $42$ | $57:-206610533922\quad 58:-95309350908\quad 59:-102445206735\quad 60:-28738082885\quad 61:492989430252$ |
| $42$ | $62:-1275934943\quad 63:15505607008\quad 64:174167059169\quad 65:33573051300\quad 66:-549145272$ |
| $42$ | $67:-39632370391\quad 68:-122475386090\quad 69:-68270555165\quad 70:22489601209\quad 71:189714110377$ |
| $42$ | $72:331545915457\quad 73:338784381278\quad 74:-177848782797\quad 75:506704217693\quad 76:23093759911$ |
| $42$ | $77:-3468589034\quad 78:-17636671806\quad 79:32475343287\quad 80:229722870377\quad 81:-127116481577$ |
| $42$ | $82:99696247435\quad 83:68275464131\quad 84:-56010934306\quad 85:-158261173413\quad 86:-31630743573$ |
| $42$ | $87:90653813402\quad 88:-139835905935\quad 89:518760911557\quad 90:68486257726\quad 91:549036430468$ |
| $42$ | $92:-6269285764\quad 93:-69464340078\quad 94:695675894\quad 95:103453996473\quad 96:-119904768415$ |
| $42$ | $97:65699368921$ |
| $43$ | $43:2498826883118\quad 44:-373783696973\quad 45:-154655560257\quad 46:-21228144947\quad 47:68939624381$ |
| $43$ | $48:-145160024753\quad 49:12905237718\quad 50:-117747228672\quad 51:163787833767\quad 52:51404706691$ |
| $43$ | $53:-221011632582\quad 54:41163080560\quad 55:-32517761112\quad 56:-381422273476\quad 57:25451717446$ |
| $43$ | $58:-10835198058\quad 59:507645404175\quad 60:93632555869\quad 61:-260447525354\quad 62:-5854123635$ |
| $43$ | $63:-13863851157\quad 64:108493578442\quad 65:64295792114\quad 66:12342880964\quad 67:86055089891$ |
| $43$ | $68:5491638011\quad 69:91370366206\quad 70:-233708149054\quad 71:210145392595\quad 72:-347326124900$ |
| $43$ | $73:-318085440260\quad 74:71878438005\quad 75:-72548123225\quad 76:-139045045873\quad 77:62546995444$ |
| $43$ | $78:-85345958595\quad 79:92272470720\quad 80:61388063127\quad 81:441824162713\quad 82:87584851673$ |
| $43$ | $83:-67236937303\quad 84:-146701510488\quad 85:-105248776537\quad 86:78879841530\quad 87:-121654924386$ |
| $43$ | $88:-144493331747\quad 89:162500895522\quad 90:-310930328684\quad 91:-190106365092\quad 92:235616624352$ |
| $43$ | $93:189612007914\quad 94:30220625508\quad 95:-36256947734\quad 96:9748672399\quad 97:-44061195572$ |
| $44$ | $44:1784321913321\quad 45:-435003987270\quad 46:-142856062505\quad 47:128097294683\quad 48:-35748214296$ |
| $44$ | $49:283928327676\quad 50:-114110198915\quad 51:-50289974832\quad 52:31308871865\quad 53:-287526111032$ |
| $44$ | $54:23892436936\quad 55:-185170600356\quad 56:-32512727182\quad 57:-55262142771\quad 58:168365253486$ |
| $44$ | $59:591235580453\quad 60:-629274597821\quad 61:-592117025001\quad 62:141253635346\quad 63:31950328387$ |
| $44$ | $64:-166607936723\quad 65:-98595145639\quad 66:78650396316\quad 67:88658096293\quad 68:133354947943$ |
| $44$ | $69:-8370869448\quad 70:-77800217564\quad 71:585858291851\quad 72:-440591840912\quad 73:-490263373516$ |
| $44$ | $74:-96628892632\quad 75:-15130547331\quad 76:-478297476725\quad 77:286321982968\quad 78:56361739452$ |
| $44$ | $79:394453967906\quad 80:-213471463370\quad 81:126056481336\quad 82:112222950669\quad 83:-100073640436$ |
| $44$ | $84:-124001248134\quad 85:-47016055740\quad 86:262492220328\quad 87:-261789321791\quad 88:-226170590591$ |
| $44$ | $89:-232976832731\quad 90:109233865061\quad 91:-341987559533\quad 92:-74685002716\quad 93:-2330703435$ |
| $44$ | $94:281754585800\quad 95:-177062252328\quad 96:-37651891233\quad 97:107580762276$ |
| $45$ | $45:2056198249132\quad 46:-82336298432\quad 47:-29878923122\quad 48:-107941958058\quad 49:-471321994411$ |
| $45$ | $50:-77332295756\quad 51:174117122686\quad 52:-89177207644\quad 53:-53735827125\quad 54:2533207071$ |
| $45$ | $55:23888843397\quad 56:41161752922\quad 57:-130609062228\quad 58:-54143314221\quad 59:-23371167424$ |
| $45$ | $60:-312918873311\quad 61:-106815364742\quad 62:-50788340713\quad 63:104917906075\quad 64:15121974480$ |
| $45$ | $65:-6406675394\quad 66:98240449977\quad 67:12633612657\quad 68:-651907597\quad 69:-61987056787$ |
| $45$ | $70:-71402273500\quad 71:311121883450\quad 72:-69085165512\quad 73:-70406399496\quad 74:-132924545248$ |
| $45$ | $75:-128491418638\quad 76:-233292811242\quad 77:253996836639\quad 78:-88944180107\quad 79:102368867464$ |
| $45$ | $80:193087490751\quad 81:8077787068\quad 82:26777085938\quad 83:143024635174\quad 84:18440882935$ |
| $45$ | $85:-472328613\quad 86:81497844616\quad 87:-113027031006\quad 88:24544171958\quad 89:-1298263443$ |
| $45$ | $90:-59127058984\quad 91:-175201717401\quad 92:13270776173\quad 93:-14392358109\quad 94:-2303996317$ |
| $45$ | $95:12216798947\quad 96:-65037573939\quad 97:-7812170996$ |
| $46$ | $46:1468443164863\quad 47:-257057146419\quad 48:-324256835612\quad 49:-52897321569\quad 50:17622128878$ |
| $46$ | $51:15005704450\quad 52:64240028607\quad 53:-9630147431\quad 54:1042047982\quad 55:49423328171$ |
| $46$ | $56:27366638354\quad 57:-36995463530\quad 58:82247648372\quad 59:-91288347369\quad 60:152433373898$ |
| $46$ | $61:-56052457540\quad 62:-376950059964\quad 63:506981941228\quad 64:206308313763\quad 65:89004250317$ |
| $46$ | $66:549145272\quad 67:38477788281\quad 68:-49126207154\quad 69:65402830809\quad 70:70559037200$ |
| $46$ | $71:-23680334217\quad 72:9127865464\quad 73:-233761210960\quad 74:1275934943\quad 75:-71568348614$ |
| $46$ | $76:139250527920\quad 77:-120044647536\quad 78:280422749566\quad 79:74451084674\quad 80:651984960456$ |
| $46$ | $81:161903244768\quad 82:-695675894\quad 83:32175539833\quad 84:-25680205496\quad 85:-87093601645$ |
| $46$ | $86:-5937848886\quad 87:145819731324\quad 88:89734511132\quad 89:88705078624\quad 90:695675894$ |
| $46$ | $91:116755475301\quad 92:111228432875\quad 93:-57361794881\quad 94:39617845533\quad 95:502469607215$ |
| $46$ | $96:-66232729146\quad 97:19885777788$ |
| $47$ | $47:2872278366153\quad 48:204471743462\quad 49:-317834672055\quad 50:110676045577\quad 51:-140577921583$ |
| $47$ | $52:2451665260\quad 53:-322926627814\quad 54:23353550660\quad 55:135520301893\quad 56:129615975735$ |
| $47$ | $57:-46618329773\quad 58:215643894397\quad 59:294427774683\quad 60:66530142511\quad 61:-743701827373$ |
| $47$ | $62:385949309849\quad 63:-495763166957\quad 64:-631571139642\quad 65:234403260516\quad 66:74169159017$ |
| $47$ | $67:-7017090018\quad 68:193157393556\quad 69:-45446440367\quad 70:185380396602\quad 71:242299608577$ |
| $47$ | $72:122630982731\quad 73:-421340270554\quad 74:92727661462\quad 75:103164695084\quad 76:72824018292$ |
| $47$ | $77:41251481283\quad 78:102855957\quad 79:-9371749159\quad 80:-811105361003\quad 81:323333471603$ |
| $47$ | $82:-40882031608\quad 83:-91194349978\quad 84:-103215975108\quad 85:-111286830470\quad 86:-66611723415$ |
| $47$ | $87:78629470701\quad 88:-24694403035\quad 89:-11618505246\quad 90:28037298455\quad 91:-70847096598$ |
| $47$ | $92:32160116422\quad 93:326941912\quad 94:-373542086808\quad 95:-106006338935\quad 96:22688805485$ |
| $47$ | $97:199594640369$ |
| $48$ | $48:2934944174105\quad 49:-299763666612\quad 50:-159400770323\quad 51:72271172718\quad 52:-166160933837$ |
| $48$ | $53:-272849850257\quad 54:34704688844\quad 55:128084902951\quad 56:115351771188\quad 57:-140621419043$ |
| $48$ | $58:257627874348\quad 59:265512066487\quad 60:-83930227650\quad 61:-508068961543\quad 62:232165134763$ |
| $48$ | $63:-265753245510\quad 64:-641396139163\quad 65:-72888416348\quad 66:33375574750\quad 67:-148923414873$ |
| $48$ | $68:74947003671\quad 69:129335449\quad 70:119989010598\quad 71:425222259885\quad 72:146492570347$ |
| $48$ | $73:-196821681340\quad 74:-19825835074\quad 75:-73029017889\quad 76:5825626737\quad 77:474495161029$ |
| $48$ | $78:60974358398\quad 79:275671000576\quad 80:-840716989389\quad 81:254594904652\quad 82:50009036443$ |
| $48$ | $83:48105304136\quad 84:-53666755452\quad 85:-56623279958\quad 86:132490165038\quad 87:-358122109626$ |
| $48$ | $88:-239085440938\quad 89:38473172796\quad 90:-42596163196\quad 91:-152150991224\quad 92:77228688917$ |
| $48$ | $93:-188762355380\quad 94:274117976580\quad 95:-316364846150\quad 96:-231830089133\quad 97:184423830008$ |
| $49$ | $49:480993476976\quad 50:-107127280772\quad 51:142459160074\quad 52:-11094542839\quad 53:1069931890$ |
| $49$ | $54:41295713744\quad 55:-27949162225\quad 56:-52273671789\quad 57:40426157020\quad 58:-8972146772$ |
| $49$ | $59:29719251467\quad 60:34862986232\quad 61:17571966935\quad 62:49500875439\quad 63:137721396373$ |
| $49$ | $64:4096392087\quad 65:63698992295\quad 66:-24869736407\quad 67:-142247116481\quad 68:17102737347$ |
| $49$ | $69:15599810875\quad 70:-70239977193\quad 71:-178025771020\quad 72:46675410330\quad 73:43428602058$ |
| $49$ | $74:189028169426\quad 75:18911862342\quad 76:31067093521\quad 77:72615606800\quad 78:-142782059841$ |
| $49$ | $79:155287634941\quad 80:-100831573488\quad 81:88492832125\quad 82:-11504520832\quad 83:54876972596$ |
| $49$ | $84:80607995784\quad 85:-22019068\quad 86:-42409960224\quad 87:-214615760455\quad 88:111425174114$ |
| $49$ | $89:300233897\quad 90:78732940500\quad 91:42279663805\quad 92:-6835059344\quad 93:2054851143$ |
| $49$ | $94:136183313703\quad 95:-21149889068\quad 96:-115441817255\quad 97:1109877298$ |
| $50$ | $50:5543092514671\quad 51:-218882996345\quad 52:132265220836\quad 53:-167771810923\quad 54:-14392358109$ |
| $50$ | $55:-2327922556\quad 56:189639902759\quad 57:-69460617525\quad 58:-1135934607928\quad 59:-730853067027$ |
| $50$ | $60:-194796923345\quad 61:-395646207000\quad 62:-17622128878\quad 63:-36171977005\quad 64:-500309067714$ |
| $50$ | $65:-327716699305\quad 66:2833760503\quad 67:-194248953351\quad 68:-264072692059\quad 69:24717458578$ |
| $50$ | $70:-974525291010\quad 71:-415099613646\quad 72:167741163011\quad 73:-351305476888\quad 74:-17622128878$ |
| $50$ | $75:-166504027618\quad 76:-302427450382\quad 77:-115342764510\quad 78:-243582719621\quad 79:-291299458852$ |
| $50$ | $80:788511529411\quad 81:23370845210\quad 82:9608084116\quad 83:-170888144214\quad 84:-170164837673$ |
| $50$ | $85:16128921466\quad 86:-436856943762\quad 87:482055436604\quad 88:-72634084642\quad 89:205820697252$ |
| $50$ | $90:-9608084116\quad 91:-129287073159\quad 92:-290645731036\quad 93:-396154129230\quad 94:9608084116$ |
| $50$ | $95:-174852668877\quad 96:1199480322194\quad 97:-346809800871$ |
| $51$ | $51:1942182540064\quad 52:250113283702\quad 53:-327670130009\quad 54:13276986150\quad 55:-74718907116$ |
| $51$ | $56:235620868548\quad 57:-6274774983\quad 58:-374160214232\quad 59:34649235474\quad 60:32793715227$ |
| $51$ | $61:-427914255986\quad 62:-39771986243\quad 63:-153965158653\quad 64:358553165694\quad 65:327786024291$ |
| $51$ | $66:-169102019711\quad 67:-62275309232\quad 68:-352446047849\quad 69:264551335092\quad 70:-418996442596$ |
| $51$ | $71:40229196652\quad 72:71869997223\quad 73:-495461925203\quad 74:225552628856\quad 75:19361510674$ |
| $51$ | $76:-192078274156\quad 77:-307101877379\quad 78:-351207961052\quad 79:27947443044\quad 80:-398426722308$ |
| $51$ | $81:24520030962\quad 82:50670125803\quad 83:82444568335\quad 84:-214885711706\quad 85:24125132902$ |
| $51$ | $86:61979291119\quad 87:-284111318786\quad 88:22585236512\quad 89:-99013400014\quad 90:-50536989297$ |
| $51$ | $91:-67956091366\quad 92:-37533587874\quad 93:-290674425408\quad 94:72222512800\quad 95:-41124448477$ |
| $51$ | $96:-622405588229\quad 97:135603908889$ |
| $52$ | $52:2040451752154\quad 53:30246920372\quad 54:-175206572166\quad 55:-341978321640\quad 56:-190112475035$ |
| $52$ | $57:549028282319\quad 58:78633706212\quad 59:-198366551250\quad 60:398322656526\quad 61:-432738047265$ |
| $52$ | $62:904559032\quad 63:-17638311483\quad 64:159392095189\quad 65:117006796344\quad 66:-30212538295$ |
| $52$ | $67:478344324695\quad 68:-289511881889\quad 69:-57283386061\quad 70:-393734359287\quad 71:-819608625570$ |
| $52$ | $72:-48777174350\quad 73:-488649707609\quad 74:415627653769\quad 75:-45005352397\quad 76:-124033618784$ |
| $52$ | $77:-268964048403\quad 78:-41310765377\quad 79:-60719685674\quad 80:-75649704129\quad 81:-95485464049$ |
| $52$ | $82:24113581623\quad 83:-65487237423\quad 84:-96382795250\quad 85:17511484791\quad 86:-8434443518$ |
| $52$ | $87:25545068721\quad 88:12567485985\quad 89:-55951464187\quad 90:157320894399\quad 91:-186235558442$ |
| $52$ | $92:-67962543009\quad 93:-129297521155\quad 94:39750271546\quad 95:53823117210\quad 96:-86385895156$ |
| $52$ | $97:-90672147724$ |
| $53$ | $53:1106166866801\quad 54:-59120944413\quad 55:109249096251\quad 56:-310878831433\quad 57:68480155913$ |
| $53$ | $58:-75551930220\quad 59:-9978168615\quad 60:496616323076\quad 61:476854973581\quad 62:18772764165$ |
| $53$ | $63:91908061383\quad 64:273894460752\quad 65:-52686845309\quad 66:-291821739514\quad 67:-141480744862$ |
| $53$ | $68:68437760483\quad 69:973446200\quad 70:-440070972131\quad 71:-296822191109\quad 72:-29527927191$ |
| $53$ | $73:326807956651\quad 74:270309332112\quad 75:268165936375\quad 76:32741162426\quad 77:-234269301035$ |
| $53$ | $78:-334618961351\quad 79:-159317644826\quad 80:99692713740\quad 81:-54497844615\quad 82:-100236595166$ |
| $53$ | $83:59236774984\quad 84:67593836713\quad 85:-299409567\quad 86:-207040335341\quad 87:-50091291792$ |
| $53$ | $88:6316550087\quad 89:-887127236\quad 90:374757070713\quad 91:157309411132\quad 92:-50531082910$ |
| $53$ | $93:-9608084116\quad 94:-79668952327\quad 95:105823303069\quad 96:-69815235031\quad 97:-5214290036$ |
| $54$ | $54:2056209281685\quad 55:-435009237119\quad 56:-154645697168\quad 57:-210676524373\quad 58:253995165033$ |
| $54$ | $59:-233290176716\quad 60:-128470291408\quad 61:-132925158182\quad 62:-1042047982\quad 63:-96771752578$ |
| $54$ | $64:37294272785\quad 65:-31250668535\quad 66:-472328613\quad 67:18444655485\quad 68:143025929766$ |
| $54$ | $69:26779419929\quad 70:174886128270\quad 71:172805660444\quad 72:351034889550\quad 73:-224859560788$ |
| $54$ | $74:-106813040509\quad 75:-312918556642\quad 76:-23357550782\quad 77:-54159070469\quad 78:-14403758089$ |
| $54$ | $79:17845592615\quad 80:-19349199240\quad 81:-2532229108\quad 82:-61993865918\quad 83:-653574986$ |
| $54$ | $84:12635471092\quad 85:98241248872\quad 86:-25832627812\quad 87:44641378020\quad 88:75547860380$ |
| $54$ | $89:43024417050\quad 90:-53732600307\quad 91:-89176352862\quad 92:174117761001\quad 93:-77321719030$ |
| $54$ | $94:568154094\quad 95:39347107058\quad 96:34277255159\quad 97:16953939452$ |
| $55$ | $55:1784323598974\quad 56:-373750080777\quad 57:-570203275876\quad 58:286325079401\quad 59:-478306747901$ |
| $55$ | $60:-15078717544\quad 61:-96639507034\quad 62:77300483522\quad 63:105066654346\quad 64:27898095079$ |
| $55$ | $65:-5539593367\quad 66:-47017343324\quad 67:-123990949854\quad 68:-100062727859\quad 69:112233391225$ |
| $55$ | $70:249817347314\quad 71:630212571892\quad 72:513435536891\quad 73:-268974523018\quad 74:-592075238234$ |
| $55$ | $75:-629233010996\quad 76:591251682374\quad 77:168341166250\quad 78:84982133789\quad 79:-171778874758$ |
| $55$ | $80:170677134925\quad 81:-448202436153\quad 82:-8382021679\quad 83:133353785536\quad 84:88685396528$ |
| $55$ | $85:78656020028\quad 86:92758789246\quad 87:152264149783\quad 88:25110110910\quad 89:182072899698$ |
| $55$ | $90:-287514642353\quad 91:31325485868\quad 92:-50283491850\quad 93:-114128340926\quad 94:-66040860704$ |
| $55$ | $95:-22468416203\quad 96:-152140029944\quad 97:-150482824153$ |
| $56$ | $56:2498811209327\quad 57:-375690916056\quad 58:62551342887\quad 59:-139063274021\quad 60:-72572284546$ |
| $56$ | $61:71859348454\quad 62:18166399788\quad 63:7049081576\quad 64:-184277978785\quad 65:95644113605$ |
| $56$ | $66:-105244162488\quad 67:-146695256459\quad 68:-67254864493\quad 69:87560190519\quad 70:149795066519$ |
| $56$ | $71:79806973082\quad 72:-132036075747\quad 73:9443156358\quad 74:-260467864207\quad 75:93627950593$ |
| $56$ | $76:507651368806\quad 77:-10845279781\quad 78:-141585264008\quad 79:-234275659579\quad 80:-137776165469$ |
| $56$ | $81:-603880468858\quad 82:91355164279\quad 83:5494145976\quad 84:86057803362\quad 85:12348627226$ |
| $56$ | $86:56153414916\quad 87:191727965750\quad 88:34632809136\quad 89:67552469551\quad 90:-221038954847$ |
| $56$ | $91:51405874579\quad 92:163775879978\quad 93:-117751005954\quad 94:-114378708124\quad 95:9006781195$ |
| $56$ | $96:-88251471878\quad 97:-54583447621$ |
| $57$ | $57:1875408289626\quad 58:-3471641614\quad 59:23109527156\quad 60:506710783983\quad 61:-177858117552$ |
| $57$ | $62:-10750508637\quad 63:-63582872801\quad 64:49240225691\quad 65:168103397761\quad 66:-158252980650$ |
| $57$ | $67:-56015828873\quad 68:68264544287\quad 69:99700663912\quad 70:-340951467660\quad 71:-862350346766$ |
| $57$ | $72:-211121266063\quad 73:-178151921500\quad 74:492981182061\quad 75:-28733807418\quad 76:-102444878517$ |
| $57$ | $77:-95312471688\quad 78:94263510702\quad 79:139217337203\quad 80:-193852215450\quad 81:216046221629$ |
| $57$ | $82:-68266891549\quad 83:-122474517613\quad 84:-39645738859\quad 85:-549145272\quad 86:-62153585014$ |
| $57$ | $87:14133156269\quad 88:-17329447590\quad 89:-1627074689\quad 90:125061132949\quad 91:-175056056036$ |
| $57$ | $92:-28228605519\quad 93:-17622128878\quad 94:-74529336329\quad 95:3530377872\quad 96:-103800767537$ |
| $57$ | $97:-9563497771$ |
| $58$ | $58:7429484717991\quad 59:148009170860\quad 60:-575322422930\quad 61:-345830790145\quad 62:-82247648372$ |
| $58$ | $63:51459284757\quad 64:-454900490472\quad 65:-48122585107\quad 66:-35398283830\quad 67:32995912155$ |
| $58$ | $68:126992697477\quad 69:25049059299\quad 70:4952657824748\quad 71:396607295124\quad 72:-112730790856$ |
| $58$ | $73:-107376410045\quad 74:214294945095\quad 75:-293800751771\quad 76:-525170033879\quad 77:-117235603564$ |
| $58$ | $78:-1136872055103\quad 79:-513346150626\quad 80:295077038636\quad 81:-215157836956\quad 82:-111575001178$ |
| $58$ | $83:123648575963\quad 84:-99428969326\quad 85:216508669152\quad 86:-2038939593960\quad 87:64507081717$ |
| $58$ | $88:395158652501\quad 89:775927587842\quad 90:-234277710822\quad 91:-268941502298\quad 92:-307096067245$ |
| $58$ | $93:-115308134223\quad 94:44843748980\quad 95:78219296365\quad 96:907630719059\quad 97:93562436840$ |
| $59$ | $59:3612297990543\quad 60:-572876638523\quad 61:-64196259109\quad 62:-103067919509\quad 63:-176510011093$ |
| $59$ | $64:-81433247337\quad 65:129066093701\quad 66:-38830363433\quad 67:-89740573364\quad 68:371769074850$ |
| $59$ | $69:99438386857\quad 70:312935793735\quad 71:542242933665\quad 72:-565770529127\quad 73:181127556141$ |
| $59$ | $74:449349355669\quad 75:338301389043\quad 76:-925218168815\quad 77:-525173227890\quad 78:-397266723737$ |
| $59$ | $79:20588625671\quad 80:-1073728979610\quad 81:394954689265\quad 82:-44243571311\quad 83:-57413284057$ |
| $59$ | $84:-43255899754\quad 85:-300635535954\quad 86:-94348256245\quad 87:-775794177782\quad 88:-346304728524$ |
| $59$ | $89:-314006432122\quad 90:32700356893\quad 91:-124039873427\quad 92:-192054338388\quad 93:-302406574885$ |
| $59$ | $94:171643272753\quad 95:-90655902171\quad 96:-538594574506\quad 97:620155301445$ |
| $60$ | $60:2489739671078\quad 61:-681657871309\quad 62:-53220799924\quad 63:9433761476\quad 64:-18353090120$ |
| $60$ | $65:265814025442\quad 66:-51571044018\quad 67:214704464301\quad 68:250053908604\quad 69:102702613205$ |
| $60$ | $70:-643233130181\quad 71:-1180578978597\quad 72:-265760898805\quad 73:-214700659329\quad 74:-299636253913$ |
| $60$ | $75:853860177030\quad 76:338295740717\quad 77:-293827423844\quad 78:-175862438304\quad 79:-128912073440$ |
| $60$ | $80:253030898073\quad 81:53786452532\quad 82:46614333316\quad 83:38995157401\quad 84:-95824199431$ |
| $60$ | $85:14914022371\quad 86:-182616487916\quad 87:-238719226665\quad 88:55743284105\quad 89:109642340214$ |
| $60$ | $90:268174783953\quad 91:-44998807585\quad 92:19369441605\quad 93:-166465098654\quad 94:3066340484$ |
| $60$ | $95:158253248579\quad 96:-155954535794\quad 97:-94187662112$ |
| $61$ | $61:4581917139680\quad 62:-142868971134\quad 63:-133643818581\quad 64:83324506325\quad 65:-229123284113$ |
| $61$ | $66:39321826120\quad 67:-105017519865\quad 68:118498615489\quad 69:-220222647870\quad 70:15591414389$ |
| $61$ | $71:370968521454\quad 72:-205990840383\quad 73:2440740708169\quad 74:-515765496691\quad 75:-299633213817$ |
| $61$ | $76:449332713226\quad 77:214255182334\quad 78:-1070536149580\quad 79:-597775799246\quad 80:-218301685190$ |
| $61$ | $81:-908302026004\quad 82:-116444324756\quad 83:135836023613\quad 84:218625601413\quad 85:-549145272$ |
| $61$ | $86:-131606194710\quad 87:131126091263\quad 88:157248820099\quad 89:-1627074689\quad 90:270309581926$ |
| $61$ | $91:415628588770\quad 92:225554875922\quad 93:-17622128878\quad 94:-364777932402\quad 95:216558907908$ |
| $61$ | $96:-152586834512\quad 97:-9563497771$ |
| $62$ | $62:1468448263385\quad 63:-445266064596\quad 64:-450542723749\quad 65:-26642804796\quad 66:-549145272$ |
| $62$ | $67:96912301997\quad 68:40246463180\quad 69:-7663672732\quad 70:-70559037200\quad 71:75939066403$ |
| $62$ | $72:111509845293\quad 73:-112886440661\quad 74:-1275934943\quad 75:-19009960414\quad 76:-184109193925$ |
| $62$ | $77:-291191281125\quad 78:-38028643900\quad 79:114888739375\quad 80:-552716912230\quad 81:-84359873230$ |
| $62$ | $82:695675894\quad 83:-83903780308\quad 84:-2218678285\quad 85:-12599744698\quad 86:136780604462$ |
| $62$ | $87:-64676539949\quad 88:15814882042\quad 89:-200296239187\quad 90:-695675894\quad 91:-39044140683$ |
| $62$ | $92:289027983297\quad 93:-78357889430\quad 94:-99023442894\quad 95:-170550199328\quad 96:184516474944$ |
| $62$ | $97:-19001301691$ |
| $63$ | $63:2536601963812\quad 64:-135252183516\quad 65:-170667937494\quad 66:-86562182070\quad 67:-122119151393$ |
| $63$ | $68:-5157995992\quad 69:52005580108\quad 70:-34514017252\quad 71:-391997033768\quad 72:143311083480$ |
| $63$ | $73:-125569637428\quad 74:-37603921001\quad 75:-17799090854\quad 76:129407955140\quad 77:-367499385736$ |
| $63$ | $78:-309744761856\quad 79:208413682591\quad 80:732452089110\quad 81:-248001625858\quad 82:-57451404046$ |
| $63$ | $83:-14810432548\quad 84:22190784318\quad 85:9853410293\quad 86:43922187737\quad 87:29744271982$ |
| $63$ | $88:176503181218\quad 89:-116973072313\quad 90:73718786954\quad 91:78589666\quad 92:-38116455452$ |
| $63$ | $93:-121114094653\quad 94:-28328906823\quad 95:449969106565\quad 96:-183738275974\quad 97:-155473297909$ |
| $64$ | $64:2760150785480\quad 65:-82618803742\quad 66:-35755683495\quad 67:195812656562\quad 68:73107398340$ |
| $64$ | $69:-13977533144\quad 70:-292607968550\quad 71:-38342165338\quad 72:92083694723\quad 73:6701810250$ |
| $64$ | $74:-8427796932\quad 75:30472541908\quad 76:411743066947\quad 77:-394602847356\quad 78:-419795806240$ |
| $64$ | $79:-87146282842\quad 80:203629116125\quad 81:-76803989113\quad 82:14131998632\quad 83:136367641431$ |
| $64$ | $84:-2400690304\quad 85:41861916283\quad 86:-202973027655\quad 87:54700488035\quad 88:41892013110$ |
| $64$ | $89:-2521795716\quad 90:70971809538\quad 91:147763436848\quad 92:47316162126\quad 93:-202503997875$ |
| $64$ | $94:-45837693341\quad 95:237255289289\quad 96:-684322070078\quad 97:319837571845$ |
| $65$ | $65:638445323633\quad 66:56598029603\quad 67:41599051250\quad 68:104498030734\quad 69:-92809989952$ |
| $65$ | $70:-171576830573\quad 71:286743241282\quad 72:6640587201\quad 73:85776679968\quad 74:153467294171$ |
| $65$ | $75:-51418675578\quad 76:243126733436\quad 77:-37023999790\quad 78:-501446592584\quad 79:-127976201006$ |
| $65$ | $80:-322903642746\quad 81:39318444117\quad 82:19108946279\quad 83:91291455064\quad 84:-24946907696$ |
| $65$ | $85:-299409567\quad 86:-145665917852\quad 87:-120547356119\quad 88:83777460793\quad 89:-887127236$ |
| $65$ | $90:-97760728961\quad 91:104823605102\quad 92:122181558692\quad 93:-9608084116\quad 94:-55625648019$ |
| $65$ | $95:98455273450\quad 96:-402032339128\quad 97:-5214290036$ |
| $66$ | $66:1170083438372\quad 67:115272430093\quad 68:296478268557\quad 69:-93804497483\quad 70:-31559335061$ |
| $66$ | $71:5209410154\quad 72:-72483624253\quad 73:19735070433\quad 74:-549145272\quad 75:14909051445$ |
| $66$ | $76:-300641680216\quad 77:216509972466\quad 78:-7590586804\quad 79:4423795142\quad 80:-11946880794$ |
| $66$ | $81:332388337162\quad 82:299409567\quad 83:-45804745869\quad 84:17463971902\quad 85:-41769793017$ |
| $66$ | $86:-13613447447\quad 87:261443587\quad 88:-9982229913\quad 89:56200163210\quad 90:-299409567$ |
| $66$ | $91:17511255047\quad 92:24128623842\quad 93:16131348766\quad 94:299409567\quad 95:11857979898$ |
| $66$ | $96:-12733746604\quad 97:-10649692205$ |
| $67$ | $67:2051745896510\quad 68:-332769693066\quad 69:-176199561864\quad 70:-105580424681\quad 71:-266266532042$ |
| $67$ | $72:-234666205697\quad 73:-166398309880\quad 74:218630469876\quad 75:-95822845556\quad 76:-43264233074$ |
| $67$ | $77:-99426984479\quad 78:-8444968426\quad 79:-179443722497\quad 80:78647929417\quad 81:-13976898373$ |
| $67$ | $82:-13751913319\quad 83:-69418356084\quad 84:-17599279886\quad 85:17462000759\quad 86:86938452174$ |
| $67$ | $87:19988990231\quad 88:19840257299\quad 89:22626653937\quad 90:67595639771\quad 91:-96377179872$ |
| $67$ | $92:-214884534790\quad 93:-170196881960\quad 94:98424361312\quad 95:43587663413\quad 96:-111375491056$ |
| $67$ | $97:-89477983769$ |
| $68$ | $68:2291352672847\quad 69:-535853075146\quad 70:233852705586\quad 71:-71576846099\quad 72:-408715045977$ |
| $68$ | $73:-236960491243\quad 74:135825729875\quad 75:38994709401\quad 76:-57412099899\quad 77:123657940209$ |
| $68$ | $78:35354262303\quad 79:-22156483791\quad 80:-281909184117\quad 81:-19662664855\quad 82:-53821981004$ |
| $68$ | $83:-107420640553\quad 84:-69423567120\quad 85:-45807097642\quad 86:-91794080703\quad 87:10903823950$ |
| $68$ | $88:-36015465810\quad 89:20093986260\quad 90:59234344628\quad 91:-65491390285\quad 92:82437603210$ |
| $68$ | $93:-170907161402\quad 94:-32516632940\quad 95:-39877176173\quad 96:-8953630950\quad 97:80010520307$ |
| $69$ | $69:514951999972\quad 70:63173799477\quad 71:-8594447114\quad 72:203119724810\quad 73:-502702442388$ |
| $69$ | $74:-116453359025\quad 75:46616170319\quad 76:-44254860208\quad 77:-111540988125\quad 78:220892342760$ |
| $69$ | $79:-12623020910\quad 80:137760635465\quad 81:135174986554\quad 82:35808118342\quad 83:-53825876978$ |
| $69$ | $84:-13756887261\quad 85:299409567\quad 86:39732249792\quad 87:52678657724\quad 88:-57140299123$ |
| $69$ | $89:887127236\quad 90:-100233869024\quad 91:24110186120\quad 92:50667735607\quad 93:9608084116$ |
| $69$ | $94:-10905767971\quad 95:33533276297\quad 96:71051569151\quad 97:5214290036$ |
| $70$ | $70:6418828790310\quad 71:458197865506\quad 72:-14537497482\quad 73:273128384632\quad 74:48949166574$ |
| $70$ | $75:-30792949208\quad 76:-45468557997\quad 77:-77955943678\quad 78:-975305667883\quad 79:-693399136659$ |
| $70$ | $80:353629259933\quad 81:-143855541367\quad 82:-14075574294\quad 83:159457947483\quad 84:-67625911145$ |
| $70$ | $85:149745776225\quad 86:-1749176025160\quad 87:334558415231\quad 88:448964667910\quad 89:621629551811$ |
| $70$ | $90:-148370788688\quad 91:-173579997191\quad 92:-244774378017\quad 93:-269982153\quad 94:38470786887$ |
| $70$ | $95:-7781445534\quad 96:854523469673\quad 97:191065983181$ |
| $71$ | $71:4653580145751\quad 72:-516858008615\quad 73:-41229873806\quad 74:-885896837983\quad 75:-412005014134$ |
| $71$ | $76:81429984542\quad 77:232455819724\quad 78:-468725057610\quad 79:-386692700638\quad 80:-853730576680$ |
| $71$ | $81:-418070219133\quad 82:149411641702\quad 83:278348724698\quad 84:10163295651\quad 85:-170827994274$ |
| $71$ | $86:188519524519\quad 87:-19252495723\quad 88:-258341897000\quad 89:61698581702\quad 90:-645097979035$ |
| $71$ | $91:192779766192\quad 92:328478291162\quad 93:-98285542580\quad 94:-104801185108\quad 95:-91020197228$ |
| $71$ | $96:-552756522635\quad 97:540993012237$ |
| $72$ | $72:1746602011825\quad 73:-670877448191\quad 74:-151405420129\quad 75:134569993790\quad 76:621474066863$ |
| $72$ | $77:139989466604\quad 78:-67965628513\quad 79:-209098975137\quad 80:13981662479\quad 81:-249556386917$ |
| $72$ | $82:66301295086\quad 83:178537652994\quad 84:121885305525\quad 85:37280807023\quad 86:-147425589247$ |
| $72$ | $87:7764818405\quad 88:76092021287\quad 89:148313609634\quad 90:-98321083235\quad 91:249490705785$ |
| $72$ | $92:238736925454\quad 93:-248490650070\quad 94:-47977509498\quad 95:45308549687\quad 96:29055488185$ |
| $72$ | $97:-163848819411$ |
| $73$ | $73:3925032482563\quad 74:-63302808689\quad 75:-172049173538\quad 76:339448571350\quad 77:152692424772$ |
| $73$ | $78:-537653896857\quad 79:-501575452849\quad 80:-420692913629\quad 81:-563475518039\quad 82:-130308947026$ |
| $73$ | $83:-4170514442\quad 84:67664481919\quad 85:549145272\quad 86:20944328074\quad 87:128580884849$ |
| $73$ | $88:36727616461\quad 89:1627074689\quad 90:425502028518\quad 91:173911180255\quad 92:195142262948$ |
| $73$ | $93:17622128878\quad 94:-435987485875\quad 95:-49640999126\quad 96:128822014140\quad 97:9563497771$ |
| $74$ | $74:4582000283487\quad 75:-681615199446\quad 76:-64184521861\quad 77:-345840547231\quad 78:-17636671806$ |
| $74$ | $79:111978255938\quad 80:-182775579821\quad 81:937634379715\quad 82:-220202722519\quad 83:118525739290$ |
| $74$ | $84:-105027690074\quad 85:39322262469\quad 86:-31630743573\quad 87:-150046372335\quad 88:38705203967$ |
| $74$ | $89:-538482473696\quad 90:476886393689\quad 91:-432749091706\quad 92:-427966788881\quad 93:-395656456188$ |
| $74$ | $94:695675894\quad 95:-3810732630\quad 96:171778973791\quad 97:98123753060$ |
| $75$ | $75:2489731034688\quad 76:-572850548324\quad 77:-575287558270\quad 78:20439318096\quad 79:43976436301$ |
| $75$ | $80:-28151753002\quad 81:67842609949\quad 82:102671679539\quad 83:250081558760\quad 84:214718905738$ |
| $75$ | $85:-51571866120\quad 86:-193011865052\quad 87:-468889918485\quad 88:-71118252725\quad 89:8910723212$ |
| $75$ | $90:496628942995\quad 91:398327382248\quad 92:32805442822\quad 93:-194777944773\quad 94:399470873395$ |
| $75$ | $95:48127634945\quad 96:78013192158\quad 97:95332055641$ |
| $76$ | $76:3612367423497\quad 77:148010400634\quad 78:184777031223\quad 79:-267634491558\quad 80:373368285738$ |
| $76$ | $81:-434122789258\quad 82:99442545109\quad 83:371758441184\quad 84:-89729740343\quad 85:-38827704934$ |
| $76$ | $86:235759675545\quad 87:-133563089513\quad 88:121590983940\quad 89:291884129491\quad 90:-9966425756$ |
| $76$ | $91:-198376710640\quad 92:34661140238\quad 93:-730862798444\quad 94:-73582714384\quad 95:153826025760$ |
| $76$ | $96:-504255645019\quad 97:-169812722343$ |
| $77$ | $77:7429449007877\quad 78:168124593087\quad 79:-865708692590\quad 80:112813031253\quad 81:1845434264711$ |
| $77$ | $82:25065297052\quad 83:126991062595\quad 84:33003321768\quad 85:-35398283830\quad 86:-91268862358$ |
| $77$ | $87:-583978377049\quad 88:-29839831367\quad 89:-104882359108\quad 90:-75582087104\quad 91:78631948504$ |
| $77$ | $92:-374134877185\quad 93:-1135934607928\quad 94:-464559960364\quad 95:-148913451268\quad 96:-745456114168$ |
| $77$ | $97:-616469676632$ |
| $78$ | $78:10204411462132\quad 79:117111559582\quad 80:1474479160942\quad 81:145770508211\quad 82:9616013332$ |
| $78$ | $83:-11635350654\quad 84:-272049253330\quad 85:-31580681840\quad 86:2557291274369\quad 87:2012733504817$ |
| $78$ | $88:-123752851003\quad 89:-82248098277\quad 90:-9616013332\quad 91:-490349485158\quad 92:-474617112652$ |
| $78$ | $93:-628420302783\quad 94:315987908372\quad 95:-189536519726\quad 96:1038687630266\quad 97:-960255719779$ |
| $79$ | $79:2225477974858\quad 80:-66790142463\quad 81:-74996614841\quad 82:41060490365\quad 83:-2389429451$ |
| $79$ | $84:-99864559664\quad 85:25234099120\quad 86:310300343264\quad 87:249611078338\quad 88:112321486733$ |
| $79$ | $89:182779136011\quad 90:43816460696\quad 91:-59576561865\quad 92:432336535178\quad 93:302949938760$ |
| $79$ | $94:470807670246\quad 95:119643160020\quad 96:-196841542945\quad 97:357453458922$ |
| $80$ | $80:4057266054029\quad 81:-91953909537\quad 82:2295810568\quad 83:63780250975\quad 84:-35315569285$ |
| $80$ | $85:26354883366\quad 86:400336547436\quad 87:397479382316\quad 88:187111262026\quad 89:257200478685$ |
| $80$ | $90:101546920598\quad 91:48018640707\quad 92:-364997072281\quad 93:-73750531767\quad 94:-45798149829$ |
| $80$ | $95:412102985413\quad 96:656585013268\quad 97:-547358158345$ |
| $81$ | $81:3300403118940\quad 82:-40840811520\quad 83:-168445810182\quad 84:152193060944\quad 85:-19300147613$ |
| $81$ | $86:-111113123231\quad 87:-502103303228\quad 88:2132878761\quad 89:-57184834793\quad 90:246684694672$ |
| $81$ | $91:96203348796\quad 92:-125505615434\quad 93:-619343743244\quad 94:45103193210\quad 95:70314405526$ |
| $81$ | $96:-118496509884\quad 97:-336116739870$ |
| $82$ | $82:514928337187\quad 83:-535839953333\quad 84:-176192639251\quad 85:-93806187573\quad 86:17245977884$ |
| $82$ | $87:-88938429823\quad 88:-154063321549\quad 89:358255609023\quad 90:973601685\quad 91:-57255900845$ |
| $82$ | $92:264555727361\quad 93:24721775996\quad 94:-379302214\quad 95:-24581603558\quad 96:-159241024149$ |
| $82$ | $97:-8487927844$ |
| $83$ | $83:2291413680988\quad 84:-332761615749\quad 85:296505145739\quad 86:-226942422843\quad 87:-62055973369$ |
| $83$ | $88:126073293918\quad 89:-245008232477\quad 90:68425721816\quad 91:-289508641438\quad 92:-352522742830$ |
| $83$ | $93:-264094945734\quad 94:115035790475\quad 95:-131299548793\quad 96:-218682475077\quad 97:-672053027$ |
| $84$ | $84:2051736036410\quad 85:115259615505\quad 86:75920165534\quad 87:13452865082\quad 88:600604775512$ |
| $84$ | $89:-944960109443\quad 90:-141500217845\quad 91:478334948130\quad 92:-62278175650\quad 93:-194254182882$ |
| $84$ | $94:96890010101\quad 95:273286399373\quad 96:319387519\quad 97:26530674344$ |
| $85$ | $85:1170086851147\quad 86:-223465405798\quad 87:206875190304\quad 88:289075430214\quad 89:-367183740565$ |
| $85$ | $90:-291846513544\quad 91:-30203772581\quad 92:-169111371063\quad 93:2826385813\quad 94:-36054562934$ |
| $85$ | $95:5692475999\quad 96:-6321126722\quad 97:42235339973$ |
| $86$ | $86:2565294413539\quad 87:308172213718\quad 88:-429779089092\quad 89:-459288073469\quad 90:-17245977884$ |
| $86$ | $91:-84352610344\quad 92:-64669196110\quad 93:-167772896925\quad 94:-96584562360\quad 95:-67366368759$ |
| $86$ | $96:-47738755351\quad 97:-165484805950$ |
| $87$ | $87:2634262600062\quad 88:-122097827567\quad 89:482491223045\quad 90:-107617991367\quad 91:-95034131076$ |
| $87$ | $92:418771843599\quad 93:366849624721\quad 94:-272380092568\quad 95:-173953447025\quad 96:346693563154$ |
| $87$ | $97:49983159236$ |
| $88$ | $88:1922373921655\quad 89:-1438858597558\quad 90:-335628873558\quad 91:174634626814\quad 92:271844698794$ |
| $88$ | $93:-153378604709\quad 94:79442888046\quad 95:561790198672\quad 96:-119734160500\quad 97:137560433086$ |
| $89$ | $89:2806899491016\quad 90:345875142431\quad 91:-25895879111\quad 92:154884635662\quad 93:316232586933$ |
| $89$ | $94:-39449727500\quad 95:-487303987202\quad 96:6552799941\quad 97:-340746471279$ |
| $90$ | $90:1106241429091\quad 91:30233672021\quad 92:-327647233668\quad 93:-167752423185\quad 94:379302214$ |
| $90$ | $95:810744344\quad 96:34391038809\quad 97:10383841255$ |
| $91$ | $91:2040409148054\quad 92:250123659648\quad 93:132263475447\quad 94:-14493464032\quad 95:304845440685$ |
| $91$ | $96:84875456364\quad 97:-206294519477$ |
| $92$ | $92:1942247596836\quad 93:-218854921119\quad 94:100813298051\quad 95:292262419779\quad 96:-14899809589$ |
| $92$ | $97:349146362784$ |
| $93$ | $93:5543090998283\quad 94:146905869111\quad 95:10181636093\quad 96:-90724708618\quad 97:500886422432$ |
| $94$ | $94:1435701977795\quad 95:-101784004740\quad 96:351982926691\quad 97:230693585193$ |
| $95$ | $95:1442458964818\quad 96:-202997920505\quad 97:47289357255$ |
| $96$ | $96:2977355027028\quad 97:-63845621052$ |
| $97$ | $97:1236206545922$ |

**Lower-triangular witness $C^{(0)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-00-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:45106683128106$ |
| $1$ | $0:-100104752\quad 1:49179699859540$ |
| $2$ | $0:-2289269902339\quad 1:-31424739988\quad 2:10880173439500$ |
| $3$ | $0:4608589535498\quad 1:6619780102718\quad 2:401606931406\quad 3:15248513790001$ |
| $4$ | $0:-731726774978\quad 1:-1568828768986\quad 2:276172236581\quad 3:-436360229778\quad 4:11873774759817$ |
| $5$ | $0:-291731061914\quad 1:-1336197857875\quad 2:2055215354235\quad 3:2922071233184\quad 4:-991864085517$ |
| $5$ | $5:11311578307975$ |
| $6$ | $0:-1229889908363\quad 1:-1611739808936\quad 2:-253232243063\quad 3:320926449783\quad 4:-449130182982$ |
| $6$ | $5:905721003359\quad 6:6542248404399$ |
| $7$ | $0:-2561070939612\quad 1:-1789186783221\quad 2:1151186635818\quad 3:105488147\quad 4:-3085402145618$ |
| $7$ | $5:1666595316606\quad 6:-5902285441417\quad 7:15338632277835$ |
| $8$ | $0:-369767819858\quad 1:-384818105482\quad 2:1755873239349\quad 3:381320930335\quad 4:-993291645686$ |
| $8$ | $5:-3861512018021\quad 6:-4506986638854\quad 7:-420132779517\quad 8:15726570977801$ |
| $9$ | $0:-254272452180\quad 1:-270458880790\quad 2:128531369566\quad 3:-243454408913\quad 4:4168478789362$ |
| $9$ | $5:716722777765\quad 6:-719079608649\quad 7:-1713808853624\quad 8:-1468294318881\quad 9:11096450425944$ |
| $10$ | $0:3452878320722\quad 1:711982260049\quad 2:-2360691201876\quad 3:-2067503745018\quad 4:877866215099$ |
| $10$ | $5:1612149697854\quad 6:2024007114458\quad 7:3276959198563\quad 8:3587249037578\quad 9:2215255419103$ |
| $10$ | $10:16485370918602$ |
| $11$ | $0:3485151240831\quad 1:3017057763699\quad 2:-4289050054640\quad 3:2055928280418\quad 4:4259314461864$ |
| $11$ | $5:662710956693\quad 6:-209386504959\quad 7:-3521109953174\quad 8:-4295052674699\quad 9:3355177921406$ |
| $11$ | $10:-856789265575\quad 11:17331928867479$ |
| $12$ | $0:-2621251796722\quad 1:-2986951166801\quad 2:2725080245103\quad 3:726334505415\quad 4:414639103930$ |
| $12$ | $5:3095238306753\quad 6:814686069564\quad 7:867201442234\quad 8:526661152394\quad 9:422870941472$ |
| $12$ | $10:-64882287293\quad 11:1260687856979\quad 12:13622585855720$ |
| $13$ | $0:4514218113879\quad 1:302795884786\quad 2:-7875360219800\quad 3:5523330086027\quad 4:-892106414635$ |
| $13$ | $5:2870985630715\quad 6:-2294083848272\quad 7:403319740603\quad 8:861419024676\quad 9:3027546702944$ |
| $13$ | $10:-1135593999802\quad 11:4677552188301\quad 12:1995814393084\quad 13:29256080773448$ |
| $14$ | $0:793769619010\quad 1:883839595068\quad 2:121643127417\quad 3:-967918930686\quad 4:-564761592036$ |
| $14$ | $5:1039960704316\quad 6:237648656393\quad 7:-149849294292\quad 8:1091437593849\quad 9:-878063316342$ |
| $14$ | $10:-647237737007\quad 11:-582168797032\quad 12:1520014924276\quad 13:-1798020238040\quad 14:11465724462064$ |
| $15$ | $0:-1686445242599\quad 1:-635107005160\quad 2:-515688912342\quad 3:-612712192773\quad 4:-1760019984878$ |
| $15$ | $5:1886428874901\quad 6:-1133991963022\quad 7:-35321068417\quad 8:426792465491\quad 9:-123181841015$ |
| $15$ | $10:-1138433512341\quad 11:146419116750\quad 12:325297557695\quad 13:-762992267149\quad 14:-3145450229296$ |
| $15$ | $15:12967970771322$ |
| $16$ | $0:4116667188663\quad 1:-9543731534803\quad 2:-1350438098016\quad 3:135050283305\quad 4:-883837425859$ |
| $16$ | $5:226061898679\quad 6:-851290139338\quad 7:713376760329\quad 8:849590599336\quad 9:431543715489$ |
| $16$ | $10:1014183164912\quad 11:2734060251833\quad 12:1465351773667\quad 13:-4444734095673\quad 14:2413219967370$ |
| $16$ | $15:-846123216012\quad 16:16555394672163$ |
| $17$ | $0:-343548567479\quad 1:-3892835481136\quad 2:132480958449\quad 3:379512969127\quad 4:-245280635820$ |
| $17$ | $5:-1290635896389\quad 6:-1835222944943\quad 7:-208097715681\quad 8:-958231195664\quad 9:1406043695733$ |
| $17$ | $10:-293154923671\quad 11:2064614965123\quad 12:40461618279\quad 13:10845279207896\quad 14:185212560709$ |
| $17$ | $15:1869622844220\quad 16:790835687531\quad 17:13345563819575$ |
| $18$ | $0:240312445081\quad 1:476226950683\quad 2:-3079771475729\quad 3:-155316704705\quad 4:-3960677065241$ |
| $18$ | $5:-34108237867\quad 6:-211683202327\quad 7:-296722006001\quad 8:-36169869327\quad 9:2274330198587$ |
| $18$ | $10:-876812005160\quad 11:1028232051447\quad 12:2108042497306\quad 13:-1829371837095\quad 14:-619020702099$ |
| $18$ | $15:-467428579875\quad 16:-1518142753273\quad 17:2151771064790\quad 18:15256104006847$ |
| $19$ | $0:-472642639279\quad 1:-2570127039770\quad 2:1157299053992\quad 3:442781425564\quad 4:4352124634895$ |
| $19$ | $5:443765638790\quad 6:1241633023222\quad 7:-719261241531\quad 8:349536371951\quad 9:-916361343442$ |
| $19$ | $10:206651815378\quad 11:912411298000\quad 12:-415391387093\quad 13:75919746657\quad 14:149836527476$ |
| $19$ | $15:-1851273542747\quad 16:-3375146822107\quad 17:-2215695327690\quad 18:-7891050526543\quad 19:8868013396130$ |
| $20$ | $0:1158148737475\quad 1:1839419031931\quad 2:708249968493\quad 3:1106374354541\quad 4:-1126718474592$ |
| $20$ | $5:-2674046170375\quad 6:-2343532190709\quad 7:-2817980750366\quad 8:-1008466670734\quad 9:1277020937999$ |
| $20$ | $10:-1910358748507\quad 11:971158486275\quad 12:3119655516906\quad 13:6202221619307\quad 14:-1263534971459$ |
| $20$ | $15:-483527321870\quad 16:71952567353\quad 17:4246660043951\quad 18:2142041145245\quad 19:2980671103690$ |
| $20$ | $20:12096945173767$ |
| $21$ | $0:-2828915193440\quad 1:3319759722579\quad 2:-2106663510743\quad 3:-843617723139\quad 4:-285016864221$ |
| $21$ | $5:40841394247\quad 6:-427816894949\quad 7:710349100118\quad 8:-264661448790\quad 9:119817914997$ |
| $21$ | $10:-668727671727\quad 11:1965282361038\quad 12:2729022202469\quad 13:8148455804574\quad 14:3024199698103$ |
| $21$ | $15:649317294610\quad 16:5056413644801\quad 17:3751785586051\quad 18:-3042420167738\quad 19:-3329509403777$ |
| $21$ | $20:-2247130393121\quad 21:8873829482244$ |
| $22$ | $0:6728087339568\quad 1:1170184587248\quad 2:-2701136117977\quad 3:-2159874554668\quad 4:-1200643091963$ |
| $22$ | $5:-227558515559\quad 6:-615149059931\quad 7:3947332489396\quad 8:-1378395097734\quad 9:-1967556208720$ |
| $22$ | $10:4028831977894\quad 11:-1427986475651\quad 12:-5293234938360\quad 13:-1697333160240\quad 14:-397291296912$ |
| $22$ | $15:832569879249\quad 16:1584688233465\quad 17:1328157509270\quad 18:-341149015928\quad 19:1445584298718$ |
| $22$ | $20:-1460378021457\quad 21:-4408811667279\quad 22:14493711712863$ |
| $23$ | $0:3457949464227\quad 1:2907471136913\quad 2:-1744690296366\quad 3:3514222808475\quad 4:-2393322511272$ |
| $23$ | $5:-1849995777880\quad 6:1367325991258\quad 7:5063921853353\quad 8:6909318116673\quad 9:-1862325369936$ |
| $23$ | $10:-1522975905664\quad 11:1225939612292\quad 12:-2008427067919\quad 13:5095728638004\quad 14:-348257260703$ |
| $23$ | $15:-1246734928430\quad 16:3995169178292\quad 17:-2722080649374\quad 18:224791233800\quad 19:3119074616403$ |
| $23$ | $20:-829969255770\quad 21:-5955248310495\quad 22:784670457698\quad 23:14783831592964$ |
| $24$ | $0:2502960675352\quad 1:-3155973641450\quad 2:2744962975523\quad 3:931896960963\quad 4:-1114999045886$ |
| $24$ | $5:-4923783807570\quad 6:-1472088991556\quad 7:-13534196204\quad 8:1781924007949\quad 9:-815295573025$ |
| $24$ | $10:-5684485295790\quad 11:-2117919781165\quad 12:-5590765036927\quad 13:2172637609193\quad 14:721496359118$ |
| $24$ | $15:2172360181681\quad 16:2384787882149\quad 17:3583243820094\quad 18:-665294916001\quad 19:3775186549$ |
| $24$ | $20:-235321654977\quad 21:1069380009820\quad 22:-1118634189165\quad 23:46274100346\quad 24:10387660812627$ |
| $25$ | $0:-3278993028779\quad 1:-2983266517507\quad 2:-6222160469308\quad 3:-1644737808436\quad 4:-1199733296324$ |
| $25$ | $5:183391023689\quad 6:-2400019433971\quad 7:-4192364953856\quad 8:-2319208121296\quad 9:-443878982194$ |
| $25$ | $10:2194237302046\quad 11:-792041894377\quad 12:3013365322361\quad 13:11136352839665\quad 14:5747968689569$ |
| $25$ | $15:4291365203381\quad 16:6558160720357\quad 17:7838594414962\quad 18:-5625404352300\quad 19:-1790679383958$ |
| $25$ | $20:-4039919776496\quad 21:-2753424309396\quad 22:-7548796245556\quad 23:-3818941409469\quad 24:-4621901635788$ |
| $25$ | $25:15603025678833$ |
| $26$ | $0:-3200784669131\quad 1:-1247557196463\quad 2:-724997006245\quad 3:-1108575034759\quad 4:443308254993$ |
| $26$ | $5:-264728609253\quad 6:158081911179\quad 7:-922063266204\quad 8:1476116990275\quad 9:596209844526$ |
| $26$ | $10:484688049050\quad 11:-1060043356429\quad 12:-1503916679811\quad 13:-942811379272\quad 14:189285452471$ |
| $26$ | $15:-362284192263\quad 16:-363764769877\quad 17:182227524153\quad 18:68014170129\quad 19:188938372749$ |
| $26$ | $20:419931388488\quad 21:-447599903031\quad 22:-240659427427\quad 23:-1239946464201\quad 24:724852628042$ |
| $26$ | $25:465034205957\quad 26:6246440439202$ |
| $27$ | $0:-2588965374249\quad 1:-2615840616217\quad 2:2387255413996\quad 3:-2632699626316\quad 4:1340889306543$ |
| $27$ | $5:-416649820206\quad 6:-697208559420\quad 7:-5051446415534\quad 8:-4695816469337\quad 9:-272509475223$ |
| $27$ | $10:2318421810741\quad 11:709444910313\quad 12:-1495792353712\quad 13:473051259607\quad 14:284765399285$ |
| $27$ | $15:-464966725922\quad 16:-120738012780\quad 17:-1205547141717\quad 18:1333854717696\quad 19:-859310613944$ |
| $27$ | $20:420049033833\quad 21:-738271504371\quad 22:-1213289541205\quad 23:-1444994458321\quad 24:29822553583$ |
| $27$ | $25:-1918904222005\quad 26:-3686203672243\quad 27:12867153969682$ |
| $28$ | $0:-279702397580\quad 1:-14308262597\quad 2:-1488013686674\quad 3:-1074993639070\quad 4:3765562272138$ |
| $28$ | $5:619122684570\quad 6:2217215228636\quad 7:-125867467125\quad 8:-1945143148445\quad 9:2968049166033$ |
| $28$ | $10:-2276978062874\quad 11:1927080200317\quad 12:1241898790882\quad 13:-1714470066772\quad 14:-196019929780$ |
| $28$ | $15:910031277404\quad 16:854322843603\quad 17:679187130820\quad 18:-1141720086492\quad 19:2670478857$ |
| $28$ | $20:890930096399\quad 21:-251848282143\quad 22:-1275468640605\quad 23:-1673252741129\quad 24:1685063884291$ |
| $28$ | $25:-1612625274972\quad 26:-3271126636457\quad 27:-2797284737714\quad 28:13120052411382$ |
| $29$ | $0:-513647688933\quad 1:300170583423\quad 2:-281891054811\quad 3:1242423033678\quad 4:-1376045020361$ |
| $29$ | $5:-1243474152081\quad 6:739852319158\quad 7:1626956361340\quad 8:2314112110177\quad 9:-2168295193097$ |
| $29$ | $10:-733184216474\quad 11:-1672984086603\quad 12:1106285435813\quad 13:71138342936\quad 14:145303481347$ |
| $29$ | $15:1455494637906\quad 16:465397632982\quad 17:12455542010\quad 18:-1326478793099\quad 19:205184019700$ |
| $29$ | $20:-139797591573\quad 21:351770984716\quad 22:-46765998175\quad 23:1199064618103\quad 24:690435019383$ |
| $29$ | $25:1167037307115\quad 26:-246590433931\quad 27:-843680519973\quad 28:-2400895563822\quad 29:10463958673124$ |
| $30$ | $0:-343466206365\quad 1:3892770449919\quad 2:-723465939761\quad 3:-4211524826543\quad 4:-2865215636140$ |
| $30$ | $5:-582047710309\quad 6:974073849610\quad 7:-312222273788\quad 8:-1293294251792\quad 9:-2106223049679$ |
| $30$ | $10:-2061626754273\quad 11:-3894226496212\quad 12:1686124782164\quad 13:-3825216967760\quad 14:-2951151915302$ |
| $30$ | $15:-1982276076736\quad 16:-1993356160419\quad 17:-5323782951385\quad 18:-987833211044\quad 19:-3348545518201$ |
| $30$ | $20:-617552719927\quad 21:1950409816774\quad 22:-2619214211656\quad 23:-2256608563943\quad 24:-4427648179631$ |
| $30$ | $25:-3607505123320\quad 26:168947623042\quad 27:-1513794954397\quad 28:400169705624\quad 29:-726393341971$ |
| $30$ | $30:11517923535024$ |
| $31$ | $0:4116549810813\quad 1:9543527523496\quad 2:-3315576117590\quad 3:6017511483190\quad 4:657493536324$ |
| $31$ | $5:-365151596557\quad 6:-490095246277\quad 7:-2297609245706\quad 8:-741240559862\quad 9:-66778808236$ |
| $31$ | $10:-4133896516773\quad 11:-80624928494\quad 12:618866961999\quad 13:-551153779713\quad 14:-1233243979378$ |
| $31$ | $15:-1826872333776\quad 16:-5335375445049\quad 17:-1748886278402\quad 18:-2292793626590\quad 19:-2064076723879$ |
| $31$ | $20:-426467801464\quad 21:-878704990849\quad 22:-2662990996218\quad 23:357553783980\quad 24:4189108732576$ |
| $31$ | $25:630599681896\quad 26:-2293031129458\quad 27:1115911061202\quad 28:912483745857\quad 29:817250164841$ |
| $31$ | $30:-3170238367473\quad 31:12415611067007$ |
| $32$ | $0:-1686426894499\quad 1:635189635514\quad 2:384481507999\quad 3:-1131904384668\quad 4:-1561511085373$ |
| $32$ | $5:-1899977768448\quad 6:-213921877294\quad 7:1743736988681\quad 8:2272594179529\quad 9:-2448753534223$ |
| $32$ | $10:-1983864948174\quad 11:-1920588265417\quad 12:332283811423\quad 13:-1286804062975\quad 14:-301782022468$ |
| $32$ | $15:5302268418747\quad 16:-863571529374\quad 17:421077470391\quad 18:-1965258630782\quad 19:-1543437899346$ |
| $32$ | $20:904496936757\quad 21:-514098865863\quad 22:203349099268\quad 23:301646685398\quad 24:1934852310252$ |
| $32$ | $25:2118293886421\quad 26:-1273412550334\quad 27:-608518165548\quad 28:-288450564312\quad 29:1302361991449$ |
| $32$ | $30:783387010157\quad 31:-1523553558510\quad 32:10305718880860$ |
| $33$ | $0:793779567035\quad 1:-884191864360\quad 2:160765415545\quad 3:-145045464836\quad 4:-411609025039$ |
| $33$ | $5:2274421589271\quad 6:-2220071848909\quad 7:-1294164658608\quad 8:-481374122025\quad 9:-1300517261034$ |
| $33$ | $10:-721478255150\quad 11:-675540509964\quad 12:79123636365\quad 13:-673162775497\quad 14:2193052870114$ |
| $33$ | $15:325672192547\quad 16:-1399779373989\quad 17:-495456703870\quad 18:-1528906237374\quad 19:-342563980956$ |
| $33$ | $20:1868897535208\quad 21:211433118319\quad 22:-1451669294165\quad 23:1134954722677\quad 24:1283206922777$ |
| $33$ | $25:1309628448545\quad 26:1629481387971\quad 27:1597801378003\quad 28:-1331185151789\quad 29:25833479624$ |
| $33$ | $30:-1711237051116\quad 31:793340530793\quad 32:-3641889733252\quad 33:9117789266456$ |
| $34$ | $0:66306001736\quad 1:-514716874083\quad 2:100363038638\quad 3:1045624396239\quad 4:-445811388355$ |
| $34$ | $5:-4240678657782\quad 6:1058287350293\quad 7:-561411661133\quad 8:-3507909987753\quad 9:-2136770800318$ |
| $34$ | $10:-1793761352109\quad 11:-2823891236098\quad 12:-2453611854861\quad 13:-646081309009\quad 14:611370114825$ |
| $34$ | $15:150189790727\quad 16:973427591684\quad 17:1589757706761\quad 18:496207743568\quad 19:1811102513673$ |
| $34$ | $20:-58875192308\quad 21:1824760178391\quad 22:161039813502\quad 23:-148003594784\quad 24:290845698501$ |
| $34$ | $25:-1187552204406\quad 26:1354794662114\quad 27:-670942437126\quad 28:-557559865145\quad 29:-1841104044797$ |
| $34$ | $30:-812304456091\quad 31:1295917429407\quad 32:41331000231\quad 33:421482436217\quad 34:17782991627300$ |
| $35$ | $0:251052575350\quad 1:-531097082010\quad 2:-1454518704498\quad 3:383437747741\quad 4:374860677679$ |
| $35$ | $5:-282320156885\quad 6:619786521392\quad 7:1388696176233\quad 8:1094804178261\quad 9:377308974527$ |
| $35$ | $10:-2336795051408\quad 11:8338795017\quad 12:-1471059551384\quad 13:-723821995228\quad 14:1047943305073$ |
| $35$ | $15:2182103255\quad 16:-377303817763\quad 17:514048285843\quad 18:687823758472\quad 19:1310556476390$ |
| $35$ | $20:505741879560\quad 21:-297056383125\quad 22:-790080388781\quad 23:-1238584730220\quad 24:1473315326270$ |
| $35$ | $25:893533122455\quad 26:-1081028503824\quad 27:1831475002214\quad 28:332482972864\quad 29:818223433456$ |
| $35$ | $30:-2222065266954\quad 31:-488386971832\quad 32:298600675889\quad 33:909501246828\quad 34:-4047677391297$ |
| $35$ | $35:11094217697652$ |
| $36$ | $0:-7077678909564\quad 1:512046954228\quad 2:3484550466414\quad 3:-1800089989076\quad 4:-1282235754575$ |
| $36$ | $5:-1329133973231\quad 6:-3606367975047\quad 7:-112587153860\quad 8:-402544527115\quad 9:-179735930777$ |
| $36$ | $10:-27363238496\quad 11:-2282901181965\quad 12:-3893415030854\quad 13:1232535836365\quad 14:-1671343166556$ |
| $36$ | $15:-203493978248\quad 16:486585452288\quad 17:3336378474523\quad 18:1164589038193\quad 19:-234589493660$ |
| $36$ | $20:-1705824776891\quad 21:-531551123475\quad 22:4862369844485\quad 23:1076001163531\quad 24:462660760621$ |
| $36$ | $25:1024459272620\quad 26:547960846104\quad 27:-2175950453108\quad 28:-669392145581\quad 29:315957442566$ |
| $36$ | $30:5724525258942\quad 31:3588603048829\quad 32:-788591577304\quad 33:1166122262918\quad 34:-1539295462032$ |
| $36$ | $35:-2685272841695\quad 36:15920012810971$ |
| $37$ | $0:3069506310175\quad 1:3057879858496\quad 2:2410709808172\quad 3:3285118874947\quad 4:592110839908$ |
| $37$ | $5:-454234061519\quad 6:292359305252\quad 7:1751407858224\quad 8:1033291682364\quad 9:1057968305834$ |
| $37$ | $10:-1628208157254\quad 11:1299782473223\quad 12:-4731091400203\quad 13:-3836993552176\quad 14:-6897469114048$ |
| $37$ | $15:-4275368336315\quad 16:-7173941422458\quad 17:881673750809\quad 18:3249861144475\quad 19:4856889360252$ |
| $37$ | $20:1854394137180\quad 21:-4728470946126\quad 22:1574677357833\quad 23:2812602263050\quad 24:-90069527005$ |
| $37$ | $25:-4238862311945\quad 26:-1410455393273\quad 27:-873377399259\quad 28:-301549117982\quad 29:904705715072$ |
| $37$ | $30:979239610247\quad 31:2674184364567\quad 32:68280117748\quad 33:2081924599870\quad 34:1111094445370$ |
| $37$ | $35:-821856310689\quad 36:936291227560\quad 37:18271710989989$ |
| $38$ | $0:-3279166994576\quad 1:2983279666595\quad 2:-4677877661878\quad 3:-927308621278\quad 4:-1391067147820$ |
| $38$ | $5:-1956515125497\quad 6:261774734099\quad 7:-2387702701523\quad 8:-738010797029\quad 9:-1429620427302$ |
| $38$ | $10:-11535763262365\quad 11:-281170800317\quad 12:5217095052615\quad 13:-3022255130771\quad 14:566097193952$ |
| $38$ | $15:679412872821\quad 16:-2278886535882\quad 17:-5300500677423\quad 18:-2839817920490\quad 19:-4061317038940$ |
| $38$ | $20:2257806537792\quad 21:3827986050275\quad 22:-11072453968465\quad 23:1838629958183\quad 24:1449285532624$ |
| $38$ | $25:-56820517838\quad 26:-588589406019\quad 27:592034320504\quad 28:-297359309649\quad 29:306435521257$ |
| $38$ | $30:9624385499942\quad 31:-2100566291259\quad 32:-2274055930444\quad 33:1032230203131\quad 34:429862116344$ |
| $38$ | $35:589351498636\quad 36:-934890686013\quad 37:1060036987649\quad 38:15552223783682$ |
| $39$ | $0:2503111946918\quad 1:3156101473061\quad 2:-2502907220712\quad 3:-1402525646869\quad 4:373560319183$ |
| $39$ | $5:1569738988827\quad 6:146507677443\quad 7:609339002897\quad 8:913775598025\quad 9:729423623133$ |
| $39$ | $10:1840540707391\quad 11:-20645380104\quad 12:37040644178\quad 13:-2427089438715\quad 14:318377965515$ |
| $39$ | $15:4315719915877\quad 16:1511561610358\quad 17:-3701114946902\quad 18:-1638806524964\quad 19:-2223180991621$ |
| $39$ | $20:-3182368973882\quad 21:-4135276187735\quad 22:-1328640807369\quad 23:-2390552910237\quad 24:-2040933115802$ |
| $39$ | $25:-1215636736677\quad 26:-25869817760\quad 27:1785146502381\quad 28:3033450064\quad 29:-714962749014$ |
| $39$ | $30:3721219954326\quad 31:2503238390475\quad 32:822275551083\quad 33:911708545395\quad 34:65190808424$ |
| $39$ | $35:768120991061\quad 36:741459681903\quad 37:-3198097123407\quad 38:-2537043093829\quad 39:9977083329752$ |
| $40$ | $0:3458039623530\quad 1:-2907558986364\quad 2:798761166048\quad 3:429491968541\quad 4:-336735495006$ |
| $40$ | $5:-1769077172974\quad 6:-1360392247044\quad 7:176793319013\quad 8:-763783987944\quad 9:242992509697$ |
| $40$ | $10:-186751233728\quad 11:870856690932\quad 12:-4385893988496\quad 13:-1169253746198\quad 14:-305656543918$ |
| $40$ | $15:1302564883936\quad 16:7243968566\quad 17:-6000790480856\quad 18:1464480425880\quad 19:33115896043$ |
| $40$ | $20:-1088562171532\quad 21:-231936482140\quad 22:641643956534\quad 23:652641375576\quad 24:-2885613185914$ |
| $40$ | $25:2755040186345\quad 26:-2015459251166\quad 27:-2027531332660\quad 28:-259125750775\quad 29:-563195724817$ |
| $40$ | $30:-914486982361\quad 31:4541299152339\quad 32:-1384058067356\quad 33:-1371354921370\quad 34:-172700326728$ |
| $40$ | $35:519790190879\quad 36:3674456344703\quad 37:857618531740\quad 38:-970138687559\quad 39:944347638730$ |
| $40$ | $40:17062700297759$ |
| $41$ | $0:6728120054786\quad 1:-1169951978823\quad 2:3384547118359\quad 3:647192632921\quad 4:1611302640296$ |
| $41$ | $5:-317169678842\quad 6:480119638521\quad 7:1104066581723\quad 8:525196278412\quad 9:326084464418$ |
| $41$ | $10:1418172994470\quad 11:2340327114963\quad 12:-2547444383204\quad 13:-3155462390119\quad 14:-2471428291774$ |
| $41$ | $15:890016481841\quad 16:-5179768508973\quad 17:-1055170236059\quad 18:391192852517\quad 19:2114200337046$ |
| $41$ | $20:2737639510567\quad 21:-4200630063889\quad 22:3081015246183\quad 23:1478460573887\quad 24:4106757100459$ |
| $41$ | $25:-4782416988982\quad 26:-945032331964\quad 27:588030169184\quad 28:-664384021378\quad 29:798324066069$ |
| $41$ | $30:1840826315127\quad 31:1106676462449\quad 32:372569650996\quad 33:-360396686252\quad 34:-2830217577824$ |
| $41$ | $35:-1024365070486\quad 36:4801484232327\quad 37:3725070311417\quad 38:-1728088224572\quad 39:-1098045504761$ |
| $41$ | $40:1411330788690\quad 41:10372627241084$ |
| $42$ | $0:136645021490\quad 1:-189782399082\quad 2:-59695399919\quad 3:-638082142723\quad 4:-8987328311$ |
| $42$ | $5:-502769726565\quad 6:694944994042\quad 7:-591444029008\quad 8:-216385274645\quad 9:-387327925045$ |
| $42$ | $10:1382605534163\quad 11:-1052657004568\quad 12:1287833784873\quad 13:699771279120\quad 14:-76562202296$ |
| $42$ | $15:-687161388872\quad 16:-447955721322\quad 17:-608342242437\quad 18:99906901761\quad 19:-595960417812$ |
| $42$ | $20:24014663565\quad 21:-874804899291\quad 22:-509376414286\quad 23:-672483032163\quad 24:316417358672$ |
| $42$ | $25:-653798033109\quad 26:2461179600706\quad 27:185766770845\quad 28:276313434045\quad 29:155245535969$ |
| $42$ | $30:-1368544537684\quad 31:-1342642940237\quad 32:643276928405\quad 33:-530067118687\quad 34:-987882045811$ |
| $42$ | $35:-1853894853301\quad 36:-4474165519369\quad 37:-685665877922\quad 38:411948183143\quad 39:-771095458335$ |
| $42$ | $40:-249850300009\quad 41:-2022476775236\quad 42:11697245830087$ |
| $43$ | $0:-1120698232263\quad 1:-442205256633\quad 2:-738711140541\quad 3:-28661168743\quad 4:-35492551066$ |
| $43$ | $5:-953866753905\quad 6:-1016091550968\quad 7:274208121558\quad 8:349832705688\quad 9:315805755001$ |
| $43$ | $10:-3471451190625\quad 11:-729459968487\quad 12:-1594111486780\quad 13:-443134385896\quad 14:661911995637$ |
| $43$ | $15:87553170669\quad 16:-75909665365\quad 17:2128576956805\quad 18:-3060145302\quad 19:1141334504016$ |
| $43$ | $20:647778567793\quad 21:500841639458\quad 22:2173220164386\quad 23:1055722471767\quad 24:-369452229638$ |
| $43$ | $25:708970261997\quad 26:548089830910\quad 27:-101466103087\quad 28:210039835280\quad 29:-338788242138$ |
| $43$ | $30:474680862631\quad 31:1155950201173\quad 32:-760230444281\quad 33:-79229381130\quad 34:-1169423035920$ |
| $43$ | $35:-2513575570360\quad 36:-2646178436307\quad 37:31044181528\quad 38:419106094612\quad 39:979763519884$ |
| $43$ | $40:-110709090855\quad 41:-1826118426027\quad 42:-3861185868561\quad 43:13423693731813$ |
| $44$ | $0:-2307883873373\quad 1:-604100449769\quad 2:-1870417685586\quad 3:11384993806\quad 4:-367290582921$ |
| $44$ | $5:-410193568504\quad 6:-1051259487498\quad 7:85795345362\quad 8:578311535924\quad 9:585849273855$ |
| $44$ | $10:-2508666530527\quad 11:1106367184973\quad 12:-1456864827618\quad 13:-159861100146\quad 14:143153674465$ |
| $44$ | $15:315155389673\quad 16:-569884586700\quad 17:2145214048387\quad 18:295604323791\quad 19:1144554684450$ |
| $44$ | $20:273856786050\quad 21:141307186785\quad 22:-84921766185\quad 23:980578803426\quad 24:-583887242362$ |
| $44$ | $25:-744487710635\quad 26:-1557631636214\quad 27:226772934455\quad 28:-8309747806\quad 29:684156606226$ |
| $44$ | $30:-274429403605\quad 31:1545652244892\quad 32:864367870481\quad 33:436426369769\quad 34:-1930632214557$ |
| $44$ | $35:2602225538172\quad 36:2617896242601\quad 37:157211744181\quad 38:-1100906783334\quad 39:-1961227922247$ |
| $44$ | $40:651090113269\quad 41:3035186749034\quad 42:-1878913257139\quad 43:-3614619567988\quad 44:9698736327627$ |
| $45$ | $0:-1010186850374\quad 1:-76463231786\quad 2:-57011208082\quad 3:564708207043\quad 4:281084834945$ |
| $45$ | $5:-140935842930\quad 6:431404175160\quad 7:290794885247\quad 8:230087275355\quad 9:4253862276$ |
| $45$ | $10:99638058249\quad 11:85467163074\quad 12:-136241959006\quad 13:29973532688\quad 14:336913054310$ |
| $45$ | $15:-205881866904\quad 16:-178834014011\quad 17:-51393764592\quad 18:397938882902\quad 19:785593468290$ |
| $45$ | $20:404752418373\quad 21:30129023236\quad 22:41268510021\quad 23:273943864411\quad 24:953737770358$ |
| $45$ | $25:450319990029\quad 26:-1182164799849\quad 27:84497593030\quad 28:-1072657615383\quad 29:-536706267482$ |
| $45$ | $30:634250082584\quad 31:1120902245870\quad 32:-117188980117\quad 33:7106085544\quad 34:-1407570290782$ |
| $45$ | $35:2372722710588\quad 36:591369605723\quad 37:605916973129\quad 38:397016222042\quad 39:156397885088$ |
| $45$ | $40:-336410155160\quad 41:214730291203\quad 42:-693046944548\quad 43:-1168861037185\quad 44:-6690010485705$ |
| $45$ | $45:11903964866626$ |
| $46$ | $0:-254271541889\quad 1:270463294402\quad 2:35178927071\quad 3:-449515645381\quad 4:-955499557100$ |
| $46$ | $5:-2604850340017\quad 6:334990894763\quad 7:310166068005\quad 8:-306593730350\quad 9:-700410399003$ |
| $46$ | $10:625927668829\quad 11:-351470418695\quad 12:1651511882053\quad 13:-1063411239639\quad 14:-1111449714139$ |
| $46$ | $15:-3204800242749\quad 16:-69098948452\quad 17:-1236196782338\quad 18:-402622383325\quad 19:-427130901205$ |
| $46$ | $20:-813280099474\quad 21:199090714609\quad 22:690172227910\quad 23:-55458508405\quad 24:2120665414687$ |
| $46$ | $25:1664701131202\quad 26:-266249203028\quad 27:254520533562\quad 28:395475063478\quad 29:-614337536728$ |
| $46$ | $30:-57176283752\quad 31:-1408577431326\quad 32:-916059787919\quad 33:-1074577017909\quad 34:-188241383348$ |
| $46$ | $35:241458580388\quad 36:-872978237514\quad 37:-159684124514\quad 38:-956454895043\quad 39:-239887249192$ |
| $46$ | $40:-2796905675902\quad 41:-2052204188384\quad 42:-1410873921520\quad 43:-554777098643\quad 44:287438353107$ |
| $46$ | $45:-782463445142\quad 46:9501262892112$ |
| $47$ | $0:-369714125952\quad 1:384811339801\quad 2:-443377710887\quad 3:149422908301\quad 4:928360766307$ |
| $47$ | $5:328784106036\quad 6:30094634922\quad 7:368835168900\quad 8:602998435645\quad 9:176882125765$ |
| $47$ | $10:-1118561276795\quad 11:-481247646545\quad 12:-2103457693208\quad 13:-785906358592\quad 14:-388918813574$ |
| $47$ | $15:3350446681906\quad 16:-370707786071\quad 17:-1340672139226\quad 18:476231659736\quad 19:1808617683026$ |
| $47$ | $20:-869949071435\quad 21:1125100824561\quad 22:242631534069\quad 23:-57996602623\quad 24:-1407406728325$ |
| $47$ | $25:563499813066\quad 26:436292703878\quad 27:891476724131\quad 28:-33215871409\quad 29:-365825031832$ |
| $47$ | $30:-139374946107\quad 31:1780926054338\quad 32:-399277205674\quad 33:1027510027574\quad 34:-912297877758$ |
| $47$ | $35:-1722028496470\quad 36:-198103206072\quad 37:-576804500800\quad 38:-2047415979788\quad 39:3162709054683$ |
| $47$ | $40:4232242445927\quad 41:-3341043455442\quad 42:-534874349620\quad 43:-1533014184103\quad 44:1141980500049$ |
| $47$ | $45:496739927664\quad 46:-532676064668\quad 47:14144568603121$ |
| $48$ | $0:-2561119520077\quad 1:1789141983350\quad 2:489558608329\quad 3:75781198577\quad 4:200018594994$ |
| $48$ | $5:-335878655468\quad 6:-919164387091\quad 7:-618650371763\quad 8:-237610606302\quad 9:-115397309724$ |
| $48$ | $10:-1394124794879\quad 11:551801825296\quad 12:-342416732228\quad 13:-789262511244\quad 14:-193595592262$ |
| $48$ | $15:2131675393950\quad 16:-2344757415687\quad 17:-69839627129\quad 18:-519975591780\quad 19:-928401291417$ |
| $48$ | $20:-907637414110\quad 21:-700340929059\quad 22:1202621947623\quad 23:1722230700328\quad 24:-92510803671$ |
| $48$ | $25:-1166127988560\quad 26:834243191257\quad 27:732712598583\quad 28:228259736015\quad 29:416888675657$ |
| $48$ | $30:332369043728\quad 31:213770692889\quad 32:-12919174135\quad 33:-751586037384\quad 34:-879618250887$ |
| $48$ | $35:976376476314\quad 36:1503069690639\quad 37:-227144730645\quad 38:-4329021461820\quad 39:-1591101969108$ |
| $48$ | $40:3340961348624\quad 41:1330001758504\quad 42:-489821010278\quad 43:-1141682706903\quad 44:-4341245114113$ |
| $48$ | $45:-3564830143820\quad 46:-2237621695203\quad 47:100785420498\quad 48:13498254666983$ |
| $49$ | $0:-1229868838129\quad 1:1611735680416\quad 2:172107301129\quad 3:157242970224\quad 4:318691696563$ |
| $49$ | $5:114006559130\quad 6:-891083944607\quad 7:-728292807831\quad 8:-234582444527\quad 9:-317134351672$ |
| $49$ | $10:205026752097\quad 11:-781020350050\quad 12:-593305736895\quad 13:348493002038\quad 14:-949664973879$ |
| $49$ | $15:-424385067859\quad 16:349261266843\quad 17:236124877728\quad 18:1032605706477\quad 19:751484953353$ |
| $49$ | $20:-502787656577\quad 21:-259886408644\quad 22:-270488468299\quad 23:-770811025209\quad 24:-243223553929$ |
| $49$ | $25:-285736504122\quad 26:-76293951294\quad 27:57083699398\quad 28:87305573109\quad 29:380954134218$ |
| $49$ | $30:-1215304228919\quad 31:-483948449849\quad 32:286225079146\quad 33:553241885715\quad 34:853432908928$ |
| $49$ | $35:-876060438988\quad 36:21718095837\quad 37:-218213000101\quad 38:808160920227\quad 39:-491103253985$ |
| $49$ | $40:706260561297\quad 41:222557139967\quad 42:992440400160\quad 43:438360740456\quad 44:3305334711829$ |
| $49$ | $45:-1637534222062\quad 46:-173991451920\quad 47:-2531116652424\quad 48:-1595439849182\quad 49:2860384549526$ |
| $50$ | $0:2718879425820\quad 1:-4546557973004\quad 2:5162398427874\quad 3:420993425278\quad 4:-452115175810$ |
| $50$ | $5:-254351386685\quad 6:-394202452658\quad 7:-1909377137959\quad 8:-886816306456\quad 9:-867423350551$ |
| $50$ | $10:-2551563309724\quad 11:597008532824\quad 12:905537779951\quad 13:-1344158915014\quad 14:-383333671958$ |
| $50$ | $15:-952782277038\quad 16:5299923356785\quad 17:-1462625957049\quad 18:3400838321445\quad 19:1020531567449$ |
| $50$ | $20:2075817489834\quad 21:2553321815134\quad 22:-3806560839071\quad 23:1302763047805\quad 24:-809769426470$ |
| $50$ | $25:2913079130472\quad 26:1633681435048\quad 27:-2942602818565\quad 28:-754450634857\quad 29:-867269414075$ |
| $50$ | $30:-495116684155\quad 31:603337941393\quad 32:2655811102689\quad 33:37328694365\quad 34:-1332536423955$ |
| $50$ | $35:-2203280747577\quad 36:143568788733\quad 37:1597822214436\quad 38:-6572531775523\quad 39:1030901635618$ |
| $50$ | $40:3262812640560\quad 41:1591596415903\quad 42:301993309658\quad 43:-729180430092\quad 44:-1182419221987$ |
| $50$ | $45:-763510964811\quad 46:1050046232874\quad 47:-955749243372\quad 48:-1995424846011\quad 49:-1999655529121$ |
| $50$ | $50:17455957994708$ |
| $51$ | $0:-4297866735091\quad 1:862175319370\quad 2:2306884148268\quad 3:765913460458\quad 4:2284897005656$ |
| $51$ | $5:465887521461\quad 6:-555949631571\quad 7:-91571002552\quad 8:-54597534901\quad 9:-30850156734$ |
| $51$ | $10:463036314884\quad 11:-1501014418251\quad 12:2041470847053\quad 13:-386511471540\quad 14:636310574672$ |
| $51$ | $15:1121473022974\quad 16:375273361162\quad 17:958690419941\quad 18:1880354641670\quad 19:4193163379341$ |
| $51$ | $20:1994399035138\quad 21:149136742317\quad 22:449478157586\quad 23:-1445061573737\quad 24:876039426984$ |
| $51$ | $25:2371939401567\quad 26:-432474987341\quad 27:-395512729802\quad 28:-851375276155\quad 29:2094983810898$ |
| $51$ | $30:1778505826039\quad 31:-992921628769\quad 32:1155048880652\quad 33:-917437130171\quad 34:1223383658557$ |
| $51$ | $35:2363782912503\quad 36:18658101238\quad 37:-908549319844\quad 38:324096880052\quad 39:-1431731047715$ |
| $51$ | $40:351038242397\quad 41:1084622007198\quad 42:517215923598\quad 43:1692522206302\quad 44:-1189530593983$ |
| $51$ | $45:-207146128560\quad 46:821468735162\quad 47:-91778875783\quad 48:-235226602764\quad 49:1645186463470$ |
| $51$ | $50:-1468255074885\quad 51:9310703306902$ |
| $52$ | $0:67656851938\quad 1:200777467196\quad 2:-1881246051324\quad 3:498540538087\quad 4:2660328025245$ |
| $52$ | $5:343728100759\quad 6:746102093162\quad 7:-31130157433\quad 8:219429782730\quad 9:142456758164$ |
| $52$ | $10:26144206685\quad 11:-932331620351\quad 12:-158765743794\quad 13:-2043125460660\quad 14:227267064832$ |
| $52$ | $15:1052007515295\quad 16:-451339029842\quad 17:30104643950\quad 18:-37793484371\quad 19:951244551328$ |
| $52$ | $20:703899706474\quad 21:1469204986114\quad 22:-669657389806\quad 23:-1795986911110\quad 24:-572986826538$ |
| $52$ | $25:2551971028031\quad 26:403873406619\quad 27:1995585583292\quad 28:-632128030220\quad 29:-489695111754$ |
| $52$ | $30:799369856491\quad 31:-1216691150846\quad 32:-221929141489\quad 33:-1097871933293\quad 34:944622576143$ |
| $52$ | $35:1492615436855\quad 36:3112918014138\quad 37:45815302955\quad 38:-1154029388068\quad 39:-169354351549$ |
| $52$ | $40:-1098154112358\quad 41:569520196581\quad 42:221770058501\quad 43:1355584157828\quad 44:-104719837785$ |
| $52$ | $45:-1184188525154\quad 46:587137226545\quad 47:-80620443490\quad 48:-1648317422848\quad 49:-1208227238884$ |
| $52$ | $50:661317922979\quad 51:-64241254799\quad 52:11821664984736$ |
| $53$ | $0:1615881613891\quad 1:-81108660916\quad 2:435297567531\quad 3:-239191029071\quad 4:76722755654$ |
| $53$ | $5:24873397918\quad 6:1517729761017\quad 7:546785804026\quad 8:631991236705\quad 9:267029825019$ |
| $53$ | $10:718940203255\quad 11:661262883372\quad 12:316517441315\quad 13:-153306810022\quad 14:-19302760192$ |
| $53$ | $15:340347240062\quad 16:-1182113147733\quad 17:279185675440\quad 18:2130205498602\quad 19:-2453117043509$ |
| $53$ | $20:-371716937511\quad 21:682901605007\quad 22:275760899256\quad 23:-1269114168100\quad 24:998803033665$ |
| $53$ | $25:1637491303348\quad 26:-1183415102095\quad 27:613804019670\quad 28:399119573075\quad 29:281781118699$ |
| $53$ | $30:-1419523987899\quad 31:-1447474932895\quad 32:-403401071175\quad 33:280987394139\quad 34:3129623693997$ |
| $53$ | $35:-617564270083\quad 36:-2124778679047\quad 37:-429696670140\quad 38:1780220786471\quad 39:849490303703$ |
| $53$ | $40:-2084012608102\quad 41:918691691994\quad 42:212407712494\quad 43:-1010044634095\quad 44:-585828687688$ |
| $53$ | $45:-219454453443\quad 46:-1288865062369\quad 47:-1019366805117\quad 48:-437656133239\quad 49:-968965282220$ |
| $53$ | $50:65472057272\quad 51:-2524319322367\quad 52:48643705793\quad 53:6594713390810$ |
| $54$ | $0:-1010152510503\quad 1:76427631902\quad 2:-284124801629\quad 3:-146911419887\quad 4:51890298620$ |
| $54$ | $5:56672824604\quad 6:-7383313166065\quad 7:-3678972528621\quad 8:-2373639946911\quad 9:-2147127477160$ |
| $54$ | $10:2632595915998\quad 11:356954012712\quad 12:1437669247042\quad 13:-490858401235\quad 14:112751243847$ |
| $54$ | $15:-545048174121\quad 16:505538317766\quad 17:-1065483554054\quad 18:158415450865\quad 19:793216637272$ |
| $54$ | $20:-2654915824061\quad 21:356044114719\quad 22:979518135346\quad 23:3119009892794\quad 24:1900361592686$ |
| $54$ | $25:-693273678671\quad 26:564505037143\quad 27:-2593119964860\quad 28:2280954896586\quad 29:689709426244$ |
| $54$ | $30:438029729558\quad 31:-668085078656\quad 32:644904503384\quad 33:-966001661296\quad 34:-295468214219$ |
| $54$ | $35:1944980610329\quad 36:-256925994840\quad 37:832622030376\quad 38:239182473123\quad 39:2128780557217$ |
| $54$ | $40:15471204442\quad 41:323886068963\quad 42:-1068439783285\quad 43:470530125128\quad 44:327474133864$ |
| $54$ | $45:191235559481\quad 46:-1322936392929\quad 47:882117547852\quad 48:-762686329136\quad 49:-687661182351$ |
| $54$ | $50:-556930417994\quad 51:-708672789549\quad 52:28750139501\quad 53:1665537466897\quad 54:7733636711786$ |
| $55$ | $0:-2307860564627\quad 1:603965646566\quad 2:505026031762\quad 3:175035048569\quad 4:-1559040250632$ |
| $55$ | $5:2228979519206\quad 6:3650340145690\quad 7:262872604399\quad 8:2216329912869\quad 9:-315567200841$ |
| $55$ | $10:240836720273\quad 11:249000409530\quad 12:1681815160570\quad 13:483842492498\quad 14:-619651924654$ |
| $55$ | $15:434980568455\quad 16:2018849276998\quad 17:-1058494052792\quad 18:-1536440638862\quad 19:-3247882175575$ |
| $55$ | $20:-25798195241\quad 21:-975805975659\quad 22:4739841414214\quad 23:-297043323176\quad 24:172679358571$ |
| $55$ | $25:832307359078\quad 26:-2110511923168\quad 27:-466680066250\quad 28:-85172710200\quad 29:-102063383759$ |
| $55$ | $30:2757214812868\quad 31:1191649233872\quad 32:-889016238454\quad 33:1621553557495\quad 34:-1132209644050$ |
| $55$ | $35:-3051985704769\quad 36:499314113260\quad 37:869062064420\quad 38:667581458826\quad 39:-534676126853$ |
| $55$ | $40:1353377856867\quad 41:-1445424610702\quad 42:-253045782613\quad 43:-956511485427\quad 44:-833254962734$ |
| $55$ | $45:-446067682481\quad 46:187790967493\quad 47:292610403598\quad 48:274829610758\quad 49:2353672395120$ |
| $55$ | $50:1474740726429\quad 51:96893712586\quad 52:-1130290437781\quad 53:1954129037598\quad 54:-1284791159266$ |
| $55$ | $55:7115827591815$ |
| $56$ | $0:-1120643090030\quad 1:442144319545\quad 2:-639429814442\quad 3:227664171884\quad 4:-292754115999$ |
| $56$ | $5:322270596770\quad 6:-5172732104\quad 7:-1129797740154\quad 8:517807024810\quad 9:-210978717343$ |
| $56$ | $10:2957616908298\quad 11:462723549518\quad 12:640155337776\quad 13:-360189418528\quad 14:367764538260$ |
| $56$ | $15:309477095322\quad 16:312662015190\quad 17:-568716201195\quad 18:1020371435401\quad 19:-634654231760$ |
| $56$ | $20:-430000454062\quad 21:505196375502\quad 22:-2086531534164\quad 23:331841663049\quad 24:629559022267$ |
| $56$ | $25:-470828845841\quad 26:286012593834\quad 27:-117949793129\quad 28:205903691027\quad 29:131484474967$ |
| $56$ | $30:2133561841651\quad 31:416571848143\quad 32:926561772987\quad 33:1287452522824\quad 34:-1214043166339$ |
| $56$ | $35:-2582594554263\quad 36:417596608165\quad 37:-522059991178\quad 38:-1559577761940\quad 39:963842524234$ |
| $56$ | $40:1469736026785\quad 41:2292245645272\quad 42:138392037155\quad 43:-1810346709611\quad 44:-980402398912$ |
| $56$ | $45:-161267178162\quad 46:1283035158883\quad 47:287102079058\quad 48:-262175680942\quad 49:-1177406471387$ |
| $56$ | $50:-878321773060\quad 51:2726072548989\quad 52:-1346818216361\quad 53:-2873638601302\quad 54:-2793126650510$ |
| $56$ | $55:-6514193565881\quad 56:11239638865021$ |
| $57$ | $0:136615265631\quad 1:189796778480\quad 2:633101826751\quad 3:-926743526233\quad 4:856016010977$ |
| $57$ | $5:231526496549\quad 6:2502229840171\quad 7:-192400685147\quad 8:173516832565\quad 9:-189539592131$ |
| $57$ | $10:-1183108409943\quad 11:1324622369931\quad 12:-116109256283\quad 13:229019748851\quad 14:-434301436152$ |
| $57$ | $15:132920263638\quad 16:-752681360513\quad 17:33876423911\quad 18:3585929491963\quad 19:456997894411$ |
| $57$ | $20:184781219223\quad 21:1291936062523\quad 22:-2049646853162\quad 23:-2287426005882\quad 24:-1301925874448$ |
| $57$ | $25:463995646186\quad 26:298871953028\quad 27:713653669279\quad 28:-538856487754\quad 29:824875296728$ |
| $57$ | $30:-1561326601554\quad 31:-505343512752\quad 32:-133740134648\quad 33:590045410560\quad 34:1827093574185$ |
| $57$ | $35:2360706328335\quad 36:3617136639412\quad 37:-408292757625\quad 38:-122138081344\quad 39:-745890005814$ |
| $57$ | $40:-1556662566394\quad 41:-205816402336\quad 42:-302339529609\quad 43:1941770468021\quad 44:-1198869193379$ |
| $57$ | $45:-1953451525298\quad 46:40021316089\quad 47:464680178559\quad 48:-1394038646772\quad 49:-595861249696$ |
| $57$ | $50:-1219839165289\quad 51:-2510405929668\quad 52:1515881590052\quad 53:-2431398767318\quad 54:1658748165407$ |
| $57$ | $55:-2943671794124\quad 56:-3573258237799\quad 57:8205142310730$ |
| $58$ | $0:1999299978783\quad 1:-402358482394\quad 2:-5246485703943\quad 3:-5180253783735\quad 4:-1252569613439$ |
| $58$ | $5:-1921166477173\quad 6:1617609735609\quad 7:4353515686958\quad 8:1039928291884\quad 9:410697836851$ |
| $58$ | $10:8300845496828\quad 11:1508834669968\quad 12:-4785475559422\quad 13:387420826139\quad 14:428588840955$ |
| $58$ | $15:-636619706738\quad 16:4787402366702\quad 17:1541832274985\quad 18:-759488658865\quad 19:2250706732794$ |
| $58$ | $20:-2092408428893\quad 21:-4272639579147\quad 22:12243389825156\quad 23:-3393347521447\quad 24:-3049095905439$ |
| $58$ | $25:-1889062770968\quad 26:-2083225701009\quad 27:-2617639171487\quad 28:-2284026592493\quad 29:-2288003694115$ |
| $58$ | $30:-2101065288212\quad 31:-2875914914372\quad 32:-688458459817\quad 33:-899446837107\quad 34:897425510858$ |
| $58$ | $35:2270129110133\quad 36:-320263613324\quad 37:-162199341659\quad 38:-3981330304364\quad 39:-5166209234808$ |
| $58$ | $40:3842584592280\quad 41:2232082402293\quad 42:-515960863653\quad 43:887989033304\quad 44:143294455350$ |
| $58$ | $45:-52229878394\quad 46:782060214623\quad 47:2315148756165\quad 48:925357138400\quad 49:1395409361953$ |
| $58$ | $50:-2300948258361\quad 51:-3212331883658\quad 52:1330532680349\quad 53:-68185881706\quad 54:5243902123089$ |
| $58$ | $55:-1146259346794\quad 56:3634175013760\quad 57:1356732437417\quad 58:12593062783509$ |
| $59$ | $0:-2171153614380\quad 1:123093525396\quad 2:-2017273512335\quad 3:-2650936765053\quad 4:1127563804972$ |
| $59$ | $5:458400031936\quad 6:162718634601\quad 7:80829130723\quad 8:937112616602\quad 9:867408469748$ |
| $59$ | $10:-3266370877984\quad 11:2011326496989\quad 12:-2228386813795\quad 13:510122560099\quad 14:1318125463596$ |
| $59$ | $15:-609762345294\quad 16:-2490071776751\quad 17:5252138428534\quad 18:771871103189\quad 19:1809032117264$ |
| $59$ | $20:-2973430597049\quad 21:-251169123025\quad 22:-1025264809479\quad 23:898116021697\quad 24:-298061315143$ |
| $59$ | $25:-3745271997043\quad 26:2075659150023\quad 27:3700178747500\quad 28:595826725406\quad 29:-117222667585$ |
| $59$ | $30:-281275949229\quad 31:-1779353619294\quad 32:-448712426338\quad 33:7637510135\quad 34:1522288636012$ |
| $59$ | $35:4162117477266\quad 36:623819204953\quad 37:-1690992635130\quad 38:-666759939417\quad 39:3623091231476$ |
| $59$ | $40:2837665677578\quad 41:1244494226682\quad 42:614482157435\quad 43:3115702343375\quad 44:2882395113718$ |
| $59$ | $45:1523192381972\quad 46:2211483922902\quad 47:839369610888\quad 48:1279517709891\quad 49:-1930524513412$ |
| $59$ | $50:-1288864687122\quad 51:121707435266\quad 52:-2795409565623\quad 53:2268288160770\quad 54:-3712943157236$ |
| $59$ | $55:169374045713\quad 56:-986492270982\quad 57:-1211777599460\quad 58:2380443298845\quad 59:11025852584199$ |
| $60$ | $0:3326627375390\quad 1:1361989935854\quad 2:1580256332850\quad 3:-1126679115517\quad 4:712007426615$ |
| $60$ | $5:3844719766626\quad 6:883040087861\quad 7:184970728601\quad 8:1865439979487\quad 9:-761781893152$ |
| $60$ | $10:-1121561539485\quad 11:-263300955756\quad 12:16242997123\quad 13:-87063916844\quad 14:-243282651519$ |
| $60$ | $15:-370774242189\quad 16:-1315691394510\quad 17:-3033549633362\quad 18:814589911161\quad 19:-1735134950507$ |
| $60$ | $20:-1824477058081\quad 21:100052394610\quad 22:-1214832644326\quad 23:-3499212293286\quad 24:604010043220$ |
| $60$ | $25:3146915978547\quad 26:44467310146\quad 27:1250145512438\quad 28:254908812667\quad 29:277757163708$ |
| $60$ | $30:-3240760826257\quad 31:-2283890974956\quad 32:-403161708832\quad 33:2227024080907\quad 34:847097476627$ |
| $60$ | $35:-241250479127\quad 36:1431623696341\quad 37:451137269909\quad 38:1789574519050\quad 39:331428543349$ |
| $60$ | $40:-2495339203612\quad 41:-3672955967212\quad 42:-1161087625861\quad 43:1836894911448\quad 44:-1833051593811$ |
| $60$ | $45:-2792651891284\quad 46:-225343002398\quad 47:573989152041\quad 48:698220719228\quad 49:914820186068$ |
| $60$ | $50:-154780748402\quad 51:1708691885508\quad 52:1667152139329\quad 53:2478339096870\quad 54:1560146191368$ |
| $60$ | $55:-1824565245620\quad 56:1256928187436\quad 57:472756466937\quad 58:-1738549606665\quad 59:-1437729638919$ |
| $60$ | $60:8828528397012$ |
| $61$ | $0:-666922279234\quad 1:1415775968027\quad 2:765858568671\quad 3:693466819081\quad 4:121555812897$ |
| $61$ | $5:-151440796368\quad 6:3137718869846\quad 7:1115381511846\quad 8:1405790596201\quad 9:562800366998$ |
| $61$ | $10:4982679281007\quad 11:-333458244931\quad 12:568802177539\quad 13:460723586121\quad 14:641096147488$ |
| $61$ | $15:1004918070157\quad 16:-229447601017\quad 17:423363207416\quad 18:-3126058291739\quad 19:-2344866551552$ |
| $61$ | $20:925141380503\quad 21:-2956279924226\quad 22:-4614684597496\quad 23:656386978725\quad 24:2073891851864$ |
| $61$ | $25:-3765397258993\quad 26:1893576034090\quad 27:15048604889\quad 28:-778649933203\quad 29:-829349304064$ |
| $61$ | $30:867636906374\quad 31:-18461684303\quad 32:-180554439032\quad 33:-159213436216\quad 34:477353062733$ |
| $61$ | $35:134676644209\quad 36:-3749827333817\quad 37:791624486680\quad 38:-734896189826\quad 39:1507584619699$ |
| $61$ | $40:-3128769085039\quad 41:3500961418304\quad 42:1887429230211\quad 43:816943806679\quad 44:-2952937213741$ |
| $61$ | $45:-2377438096376\quad 46:-494910998822\quad 47:-2217906111556\quad 48:-4586109921608\quad 49:298782339410$ |
| $61$ | $50:-1255375158046\quad 51:-4106486900278\quad 52:-3405177377688\quad 53:2459116196324\quad 54:-545325160444$ |
| $61$ | $55:-1735118935370\quad 56:-2153557424619\quad 57:-2833759151429\quad 58:-322390570286\quad 59:-885137281367$ |
| $61$ | $60:-5127949320836\quad 61:13395684958685$ |
| $62$ | $0:-513577965556\quad 1:-300197554258\quad 2:-196826089047\quad 3:-230581023752\quad 4:-426715347401$ |
| $62$ | $5:212657858543\quad 6:-223271347925\quad 7:61965756228\quad 8:-48607673614\quad 9:39256793144$ |
| $62$ | $10:-186266955753\quad 11:72836565280\quad 12:282893122621\quad 13:-446725155631\quad 14:245176369533$ |
| $62$ | $15:3720695018011\quad 16:759178999708\quad 17:-916539478571\quad 18:67041913257\quad 19:1125445055799$ |
| $62$ | $20:-426802448493\quad 21:1162989732203\quad 22:-174789252896\quad 23:-160977030518\quad 24:-1516794694735$ |
| $62$ | $25:618358256873\quad 26:139164772396\quad 27:-21389036429\quad 28:-1055484161398\quad 29:-1098115641176$ |
| $62$ | $30:-665942075373\quad 31:1955251039104\quad 32:832082099448\quad 33:609139689058\quad 34:-436804263157$ |
| $62$ | $35:-1044310147622\quad 36:-173836896130\quad 37:-942682290400\quad 38:1495412110655\quad 39:554405683894$ |
| $62$ | $40:1870310874495\quad 41:1728644537406\quad 42:568822702640\quad 43:-225337653469\quad 44:743412395078$ |
| $62$ | $45:664205710\quad 46:-1104140997061\quad 47:701544565602\quad 48:1441462415884\quad 49:1217241909712$ |
| $62$ | $50:-562938419162\quad 51:-1045083443964\quad 52:384645069317\quad 53:841379931627\quad 54:379862619626$ |
| $62$ | $55:166124174242\quad 56:151799841271\quad 57:563310906299\quad 58:-1386314791633\quad 59:-71848763155$ |
| $62$ | $60:166523546526\quad 61:69137500294\quad 62:9751656379860$ |
| $63$ | $0:-279819853157\quad 1:14381489099\quad 2:-750803616385\quad 3:-519791620953\quad 4:-626729141654$ |
| $63$ | $5:-250934808940\quad 6:-502234181312\quad 7:-335284886096\quad 8:-388067386390\quad 9:-89569860422$ |
| $63$ | $10:501267948\quad 11:-365312369039\quad 12:1748484356638\quad 13:44451540941\quad 14:-3031932093360$ |
| $63$ | $15:-1416389117470\quad 16:2180631112751\quad 17:522188387902\quad 18:-1411611766247\quad 19:-1077220050879$ |
| $63$ | $20:-2363169550781\quad 21:102874211435\quad 22:259450339777\quad 23:-997291676832\quad 24:1598537454033$ |
| $63$ | $25:1399150438285\quad 26:720525687079\quad 27:-342177726660\quad 28:-989619420323\quad 29:-1954441489306$ |
| $63$ | $30:-1250740991588\quad 31:1133309259701\quad 32:1291046110912\quad 33:669113899188\quad 34:-149115363885$ |
| $63$ | $35:434804245671\quad 36:83172831597\quad 37:1236293464441\quad 38:-416442958655\quad 39:-36859788067$ |
| $63$ | $40:-3051723960921\quad 41:-647144014892\quad 42:-324510305436\quad 43:127585051835\quad 44:1061065701500$ |
| $63$ | $45:1310121081479\quad 46:2456852149808\quad 47:-2176070598773\quad 48:393628695149\quad 49:2670931097941$ |
| $63$ | $50:-187561810004\quad 51:-736078196798\quad 52:212639084030\quad 53:1436417424510\quad 54:-2430607359174$ |
| $63$ | $55:-1017365978742\quad 56:223784824401\quad 57:692618699076\quad 58:681088760610\quad 59:-972600657195$ |
| $63$ | $60:-1575130584251\quad 61:-2236405479565\quad 62:-3937283156863\quad 63:11848954006300$ |
| $64$ | $0:-2588922579130\quad 1:2615815023757\quad 2:893790205735\quad 3:-717430681042\quad 4:-251506085497$ |
| $64$ | $5:-934117931878\quad 6:1733131484856\quad 7:1158595417248\quad 8:272302534953\quad 9:592222230828$ |
| $64$ | $10:933159172752\quad 11:-1249552243965\quad 12:516926356882\quad 13:690074648867\quad 14:1748247810377$ |
| $64$ | $15:-1854117954868\quad 16:557097759616\quad 17:70830764465\quad 18:150305907225\quad 19:1125640182027$ |
| $64$ | $20:-584523431650\quad 21:-774826010535\quad 22:1230976933480\quad 23:-1818197484881\quad 24:2939041316321$ |
| $64$ | $25:302255422514\quad 26:1914256382224\quad 27:159137682768\quad 28:-519174950289\quad 29:-856463103788$ |
| $64$ | $30:959850495136\quad 31:421390471205\quad 32:-748424971945\quad 33:-270338537686\quad 34:716651708534$ |
| $64$ | $35:1232104728219\quad 36:-569539300184\quad 37:355328178152\quad 38:1489234896436\quad 39:-428216578866$ |
| $64$ | $40:-4099166499186\quad 41:-1193025920528\quad 42:451548283945\quad 43:784756697362\quad 44:361923096471$ |
| $64$ | $45:-450309296971\quad 46:-994000372805\quad 47:-2426929698838\quad 48:-3286308337844\quad 49:-5644352856183$ |
| $64$ | $50:-794743183254\quad 51:1819536677752\quad 52:-6578443788\quad 53:1915403392958\quad 54:635791468855$ |
| $64$ | $55:1001149813987\quad 56:-160576531519\quad 57:-20457926846\quad 58:-2711343106866\quad 59:-526970012311$ |
| $64$ | $60:-2258646444542\quad 61:-3899613854399\quad 62:-1894246368009\quad 63:-3271961180263\quad 64:9908693855608$ |
| $65$ | $0:-3200713482445\quad 1:1247526444777\quad 2:381451137308\quad 3:-276898243095\quad 4:412343355616$ |
| $65$ | $5:106551493557\quad 6:277307458477\quad 7:258468945468\quad 8:427116408975\quad 9:-94537340955$ |
| $65$ | $10:608551820883\quad 11:62081351108\quad 12:157626276838\quad 13:623497069267\quad 14:1041151628847$ |
| $65$ | $15:38560208521\quad 16:-874808178297\quad 17:-124431539469\quad 18:498892151366\quad 19:820213756832$ |
| $65$ | $20:1644734877875\quad 21:-1097901828982\quad 22:-150915842735\quad 23:-1339862187033\quad 24:1175544534320$ |
| $65$ | $25:-379007220285\quad 26:-109045072703\quad 27:967772424147\quad 28:158984653716\quad 29:123090655363$ |
| $65$ | $30:97848940312\quad 31:-395378189125\quad 32:-630359318793\quad 33:-297501980376\quad 34:741705777975$ |
| $65$ | $35:-157922624189\quad 36:-298399671340\quad 37:-376276286440\quad 38:566446177235\quad 39:1449401415123$ |
| $65$ | $40:-484452141569\quad 41:-312059524552\quad 42:-96536235852\quad 43:311031321005\quad 44:-473225511627$ |
| $65$ | $45:-661453728344\quad 46:658321413062\quad 47:1744667360937\quad 48:-728705903710\quad 49:1465542259274$ |
| $65$ | $50:29011306594\quad 51:429508039961\quad 52:675243488505\quad 53:-804990325959\quad 54:383572487698$ |
| $65$ | $55:-825356361322\quad 56:13665993236\quad 57:521249327136\quad 58:150328826675\quad 59:554888282994$ |
| $65$ | $60:2305101668942\quad 61:-1862330510135\quad 62:86296171267\quad 63:-548623177432\quad 64:-2429982394428$ |
| $65$ | $65:3261370562023$ |
| $66$ | $0:344484032924\quad 1:-329436899950\quad 2:459695446834\quad 3:-14612052934\quad 4:14351728875$ |
| $66$ | $5:-427181930855\quad 6:61899439269\quad 7:-311439169886\quad 8:-853138339498\quad 9:-925435328616$ |
| $66$ | $10:294317413227\quad 11:188217345954\quad 12:246566405375\quad 13:105743048037\quad 14:47329885299$ |
| $66$ | $15:882126575881\quad 16:-736927795732\quad 17:-179963357452\quad 18:-2211855607671\quad 19:915874421009$ |
| $66$ | $20:1761760909621\quad 21:-1905824383271\quad 22:-800534932032\quad 23:-1003071440288\quad 24:313377666115$ |
| $66$ | $25:-1412335100472\quad 26:56660119750\quad 27:-517026297672\quad 28:-635338862851\quad 29:-302959780815$ |
| $66$ | $30:-391457348433\quad 31:-754529506520\quad 32:-277862460108\quad 33:-1107368922292\quad 34:-201012751971$ |
| $66$ | $35:439411993752\quad 36:123860765527\quad 37:564538510798\quad 38:-454589349031\quad 39:-204220746928$ |
| $66$ | $40:408235736262\quad 41:-1814666565230\quad 42:-715373330471\quad 43:215004434790\quad 44:1476978174450$ |
| $66$ | $45:1639098309397\quad 46:-146919562944\quad 47:257921479191\quad 48:877134654434\quad 49:319653075316$ |
| $66$ | $50:695340375511\quad 51:-1546356352324\quad 52:121655080177\quad 53:-2754491443529\quad 54:532916721228$ |
| $66$ | $55:1181260472865\quad 56:689298547318\quad 57:-1243778718391\quad 58:-1436389403092\quad 59:550711007680$ |
| $66$ | $60:1214125097836\quad 61:857669035323\quad 62:211961924352\quad 63:325511962320\quad 64:1359963463845$ |
| $66$ | $65:995660637741\quad 66:7857829784069$ |
| $67$ | $0:-210057302608\quad 1:-993631572437\quad 2:196803765013\quad 3:491753099074\quad 4:2170923838865$ |
| $67$ | $5:761543562565\quad 6:974921237454\quad 7:213466146378\quad 8:-110253732172\quad 9:-1035087330786$ |
| $67$ | $10:910811329303\quad 11:-287596038430\quad 12:-1300553161889\quad 13:-581639579680\quad 14:1473574506874$ |
| $67$ | $15:1326572322770\quad 16:-1347225419850\quad 17:233060833865\quad 18:-5262718876755\quad 19:164952675676$ |
| $67$ | $20:2759971527644\quad 21:1453211590930\quad 22:322750692826\quad 23:-108740552401\quad 24:-1129116688052$ |
| $67$ | $25:963710994088\quad 26:-1137741209914\quad 27:-190947752065\quad 28:-785500249887\quad 29:-882206348201$ |
| $67$ | $30:824069688521\quad 31:185035613409\quad 32:-371928488597\quad 33:-1354188562008\quad 34:287480665580$ |
| $67$ | $35:1472455813690\quad 36:940085597285\quad 37:878863420018\quad 38:499315439222\quad 39:-911949834620$ |
| $67$ | $40:-878151742920\quad 41:-605285493078\quad 42:784487940751\quad 43:983256807201\quad 44:1060903986010$ |
| $67$ | $45:127750154507\quad 46:1188052877199\quad 47:254620681166\quad 48:-365474813475\quad 49:-1911575530109$ |
| $67$ | $50:126327794539\quad 51:-1514895986654\quad 52:1463109972539\quad 53:-1091143983879\quad 54:2435942657792$ |
| $67$ | $55:-565420115293\quad 56:521375432010\quad 57:-1760682004183\quad 58:-1725780358471\quad 59:1127357919013$ |
| $67$ | $60:2951952103776\quad 61:-541058409640\quad 62:818074653477\quad 63:1176039443838\quad 64:1873242449717$ |
| $67$ | $65:-158766569292\quad 66:-3282403031271\quad 67:9141433843876$ |
| $68$ | $0:-426720255086\quad 1:-931594342482\quad 2:-98475963848\quad 3:-897941788335\quad 4:-1285777323048$ |
| $68$ | $5:1033201161810\quad 6:337968309455\quad 7:-99709043704\quad 8:-313283177360\quad 9:620358274797$ |
| $68$ | $10:-1088347300035\quad 11:706914296317\quad 12:-523568972463\quad 13:-108496461574\quad 14:-1847892593551$ |
| $68$ | $15:-1346321096451\quad 16:-1084481418867\quad 17:482044226032\quad 18:-2364101520533\quad 19:-929935488540$ |
| $68$ | $20:16910040372\quad 21:-2483788541999\quad 22:434981475854\quad 23:-867263900524\quad 24:496456236585$ |
| $68$ | $25:-2471111649587\quad 26:821068593998\quad 27:641107473203\quad 28:-626973366990\quad 29:-121906896995$ |
| $68$ | $30:-1266089495378\quad 31:-628879210625\quad 32:-439348520132\quad 33:-481503102805\quad 34:386681346218$ |
| $68$ | $35:1644302955958\quad 36:2376338126163\quad 37:-655986579789\quad 38:309261867718\quad 39:2853590140010$ |
| $68$ | $40:1512540979544\quad 41:-2059203768147\quad 42:-687553020676\quad 43:256785875370\quad 44:1191182533737$ |
| $68$ | $45:722112500800\quad 46:-565338086002\quad 47:704760066849\quad 48:396716821778\quad 49:1245934224451$ |
| $68$ | $50:495429665441\quad 51:-1218283454138\quad 52:-1712377201917\quad 53:2661680233881\quad 54:1382099340142$ |
| $68$ | $55:-2966347569402\quad 56:505696346657\quad 57:451852900534\quad 58:-1039447425930\quad 59:-969763179952$ |
| $68$ | $60:264584262274\quad 61:189927113699\quad 62:802920018670\quad 63:-806817563222\quad 64:1711015916005$ |
| $68$ | $65:2278479228459\quad 66:1232756054586\quad 67:-3715302532365\quad 68:10631025375429$ |
| $69$ | $0:20535003788\quad 1:-740882530105\quad 2:-75706130005\quad 3:-726946714864\quad 4:-328644601002$ |
| $69$ | $5:82385190616\quad 6:-355760771199\quad 7:36857650014\quad 8:-353022060096\quad 9:15134113270$ |
| $69$ | $10:-201569819418\quad 11:185858695530\quad 12:202009661055\quad 13:65227814248\quad 14:200229323024$ |
| $69$ | $15:45527998190\quad 16:-390824499589\quad 17:-301034199457\quad 18:2224832902639\quad 19:77148551842$ |
| $69$ | $20:-1071821171697\quad 21:969557185991\quad 22:749790287624\quad 23:-535610181184\quad 24:519360573282$ |
| $69$ | $25:1106955155553\quad 26:137038844756\quad 27:-176477576773\quad 28:-87773069381\quad 29:292273833090$ |
| $69$ | $30:675236619152\quad 31:378309145827\quad 32:-477307365956\quad 33:84867619604\quad 34:-770724894532$ |
| $69$ | $35:273381341091\quad 36:16549141101\quad 37:366190812750\quad 38:662615094559\quad 39:-539706252939$ |
| $69$ | $40:-498256106392\quad 41:-151735331399\quad 42:-483675737187\quad 43:304061943791\quad 44:-223149355220$ |
| $69$ | $45:-962229118503\quad 46:61198385159\quad 47:-165309434440\quad 48:55267843215\quad 49:589424446290$ |
| $69$ | $50:8401644597\quad 51:2072629889421\quad 52:-640023643052\quad 53:-18563943444\quad 54:-241559166428$ |
| $69$ | $55:987056928280\quad 56:864750619670\quad 57:1491555901789\quad 58:611368278139\quad 59:1418601099862$ |
| $69$ | $60:-192246757703\quad 61:860339515281\quad 62:-10238915758\quad 63:425470360034\quad 64:-245976382102$ |
| $69$ | $65:-2438052926373\quad 66:873120518274\quad 67:524905178672\quad 68:-2885029824801\quad 69:2891825946416$ |
| $70$ | $0:3069632630410\quad 1:-3057928553043\quad 2:-4224519655704\quad 3:-3521222256794\quad 4:-1003057615419$ |
| $70$ | $5:-2990667475382\quad 6:1554172432639\quad 7:2147652981726\quad 8:347468176597\quad 9:248328994996$ |
| $70$ | $10:10588889733174\quad 11:1676386367882\quad 12:-2236719167376\quad 13:654518438526\quad 14:720914906880$ |
| $70$ | $15:-788890799565\quad 16:3688458530887\quad 17:126698652230\quad 18:-423889966141\quad 19:1020831146646$ |
| $70$ | $20:-3149467657918\quad 21:-5161073565369\quad 22:8116517285034\quad 23:-1485945482740\quad 24:-3344614998847$ |
| $70$ | $25:-6109784183102\quad 26:-1356863617193\quad 27:-2333340589164\quad 28:485583979186\quad 29:-2279027553260$ |
| $70$ | $30:-2807947131852\quad 31:-1278572323649\quad 32:383236725410\quad 33:-2139919934155\quad 34:-123454333233$ |
| $70$ | $35:-310970556033\quad 36:593543245535\quad 37:1673475555452\quad 38:-1692328916369\quad 39:-5249077990307$ |
| $70$ | $40:3681542277555\quad 41:-776565322248\quad 42:-1628214125583\quad 43:-7222237592\quad 44:-609769586403$ |
| $70$ | $45:-37519910214\quad 46:437738128264\quad 47:2326149565880\quad 48:488674353715\quad 49:1169312930343$ |
| $70$ | $50:-2197861751154\quad 51:279922549767\quad 52:-491855001054\quad 53:-3313833519887\quad 54:1479878054787$ |
| $70$ | $55:-303407426280\quad 56:460141237571\quad 57:-1695033111904\quad 58:4896462047736\quad 59:4178904269376$ |
| $70$ | $60:329683802194\quad 61:616590524169\quad 62:730272747485\quad 63:1041913226862\quad 64:2085000687599$ |
| $70$ | $65:-170260275707\quad 66:-4343801309985\quad 67:-3354431507484\quad 68:994781043107\quad 69:3859932815028$ |
| $70$ | $70:9259119320986$ |
| $71$ | $0:-7077571656402\quad 1:-512193081107\quad 2:233466238795\quad 3:-62718021595\quad 4:-1828884658912$ |
| $71$ | $5:-2483155784507\quad 6:662844947710\quad 7:2370086510891\quad 8:142115557955\quad 9:-388032883412$ |
| $71$ | $10:-712295641961\quad 11:1009174807638\quad 12:1809956234434\quad 13:2372593651878\quad 14:3162595281$ |
| $71$ | $15:449089352353\quad 16:-808251534572\quad 17:689283386768\quad 18:16212493587\quad 19:-362541588236$ |
| $71$ | $20:-652348693213\quad 21:-4656337799634\quad 22:6756517234398\quad 23:1590955553383\quad 24:448077486806$ |
| $71$ | $25:-3706611621966\quad 26:-505161591165\quad 27:1225327899847\quad 28:1500219642902\quad 29:-504090730598$ |
| $71$ | $30:7274125061992\quad 31:1604060689750\quad 32:-926495574707\quad 33:781550828172\quad 34:-4575091131878$ |
| $71$ | $35:-2504636710034\quad 36:-4521491477581\quad 37:-1254845283956\quad 38:588948609\quad 39:2763082377742$ |
| $71$ | $40:2548049285051\quad 41:4104708880804\quad 42:861622148150\quad 43:-1511478468650\quad 44:3461041884300$ |
| $71$ | $45:3617282646439\quad 46:561998181700\quad 47:513067716613\quad 48:1925982597727\quad 49:-4182293240338$ |
| $71$ | $50:857595927845\quad 51:654429362926\quad 52:-1981463050254\quad 53:-221111170461\quad 54:787470867112$ |
| $71$ | $55:-1413023403319\quad 56:-3555657844779\quad 57:-1378169072109\quad 58:-365582246626\quad 59:-741715803152$ |
| $71$ | $60:2136766146518\quad 61:1916544205382\quad 62:-193303553870\quad 63:-446508549793\quad 64:-2768470528408$ |
| $71$ | $65:954089899950\quad 66:-55568925432\quad 67:-949928754632\quad 68:-1919691478213\quad 69:1825925912120$ |
| $71$ | $70:545200904533\quad 71:7971570453525$ |
| $72$ | $0:251056563038\quad 1:531026443782\quad 2:1603650120734\quad 3:867882620678\quad 4:45375628523$ |
| $72$ | $5:1447644073252\quad 6:-1700625497046\quad 7:-246534167406\quad 8:-751076317828\quad 9:-222493319930$ |
| $72$ | $10:2379503379016\quad 11:-25663120543\quad 12:-493461566428\quad 13:-144503586217\quad 14:1313893162548$ |
| $72$ | $15:1297638872383\quad 16:1186281274661\quad 17:-3513053374850\quad 18:-851089872403\quad 19:-1795155032853$ |
| $72$ | $20:-634152899677\quad 21:-586677899542\quad 22:-369147688599\quad 23:439097881171\quad 24:1488103985207$ |
| $72$ | $25:791529641645\quad 26:743852555050\quad 27:-40365648833\quad 28:896810022099\quad 29:-725378690989$ |
| $72$ | $30:109083598726\quad 31:-113865818534\quad 32:-327306222058\quad 33:-328464719555\quad 34:411016494432$ |
| $72$ | $35:-2542472856837\quad 36:-2172457056773\quad 37:489102272665\quad 38:351170095453\quad 39:1434741999326$ |
| $72$ | $40:-597811147638\quad 41:447753938354\quad 42:1450231123715\quad 43:-1774087500930\quad 44:-1078920892053$ |
| $72$ | $45:-505047701977\quad 46:-164500961435\quad 47:507041642723\quad 48:1127898405312\quad 49:3389166533859$ |
| $72$ | $50:682875387734\quad 51:1819990693131\quad 52:1323285247618\quad 53:-1376000603196\quad 54:1978262414043$ |
| $72$ | $55:4880221217250\quad 56:40791847581\quad 57:2954873013023\quad 58:542749984283\quad 59:1591668913178$ |
| $72$ | $60:-4436688347455\quad 61:-3037310923884\quad 62:-98605290774\quad 63:441710942492\quad 64:635670911417$ |
| $72$ | $65:-1306194866380\quad 66:-193817018642\quad 67:-266185643116\quad 68:-546240775755\quad 69:1262569478320$ |
| $72$ | $70:-1241830677396\quad 71:-2251847565241\quad 72:3413913706780$ |
| $73$ | $0:66005357453\quad 1:514839657195\quad 2:286723811929\quad 3:-1001186195558\quad 4:48305067676$ |
| $73$ | $5:267140981622\quad 6:3132529738616\quad 7:117867641965\quad 8:601103206374\quad 9:242613549347$ |
| $73$ | $10:3946316042713\quad 11:655173274067\quad 12:-31988455006\quad 13:538040432352\quad 14:236253027099$ |
| $73$ | $15:666312240628\quad 16:824434787572\quad 17:129193132120\quad 18:-1459822472545\quad 19:-108578040428$ |
| $73$ | $20:-1256270623921\quad 21:-1530629799923\quad 22:-5761387166553\quad 23:-55553010380\quad 24:-1015258617654$ |
| $73$ | $25:-4713876991006\quad 26:1010667192755\quad 27:329977836606\quad 28:-644533305165\quad 29:418710968887$ |
| $73$ | $30:-800615694430\quad 31:1584077714398\quad 32:1095672839671\quad 33:1035478560463\quad 34:1246047626754$ |
| $73$ | $35:593984951230\quad 36:-2682812497415\quad 37:-20556504060\quad 38:-1080352635091\quad 39:1330660081680$ |
| $73$ | $40:535515011516\quad 41:2489025851554\quad 42:1355167228449\quad 43:524352513633\quad 44:-3749622349916$ |
| $73$ | $45:-2160322170002\quad 46:-10449391859\quad 47:-2204347270701\quad 48:-2877306627761\quad 49:-42719551258$ |
| $73$ | $50:-2981659480650\quad 51:-4598112366258\quad 52:-3290872524370\quad 53:2087683837187\quad 54:-1643974045696$ |
| $73$ | $55:-1684607631163\quad 56:-3330013531341\quad 57:-6311134767506\quad 58:610712489607\quad 59:-2746662137992$ |
| $73$ | $60:106335496828\quad 61:2528818838912\quad 62:-1419305062832\quad 63:-1223992550137\quad 64:-477831171637$ |
| $73$ | $65:4560274468883\quad 66:186688791021\quad 67:-452344233834\quad 68:-4491334468272\quad 69:-4648067088980$ |
| $73$ | $70:2365407010099\quad 71:-1976009350661\quad 72:-3408534913787\quad 73:6124261980582$ |
| $74$ | $0:-667145906755\quad 1:-1415764949327\quad 2:-232359978578\quad 3:-178425011248\quad 4:1594627017213$ |
| $74$ | $5:-3180880112442\quad 6:343923563143\quad 7:-2772672654584\quad 8:-5404933140434\quad 9:-2070752096654$ |
| $74$ | $10:-3174936225491\quad 11:-2840096011378\quad 12:-3419921437346\quad 13:-2206964573190\quad 14:600130481498$ |
| $74$ | $15:816366549835\quad 16:806818797526\quad 17:2368189233852\quad 18:661412488968\quad 19:2341625977846$ |
| $74$ | $20:332197954569\quad 21:1865118727390\quad 22:2374947030943\quad 23:-3153214075040\quad 24:-402743410064$ |
| $74$ | $25:310822301407\quad 26:-5404892595946\quad 27:-3912478576072\quad 28:-4314525073105\quad 29:-1887735964464$ |
| $74$ | $30:-890710866371\quad 31:-323849592252\quad 32:-1008485797846\quad 33:1382867286119\quad 34:9368643916158$ |
| $74$ | $35:549126421654\quad 36:656243296500\quad 37:-917385029440\quad 38:38171444307\quad 39:3120639664117$ |
| $74$ | $40:-609354671565\quad 41:-481171553441\quad 42:1512577714720\quad 43:-430914597005\quad 44:-484184755218$ |
| $74$ | $45:-1345213597981\quad 46:282022169028\quad 47:-113307131937\quad 48:1125697742796\quad 49:1207611912224$ |
| $74$ | $50:-553108777925\quad 51:-1240874557132\quad 52:1643583841067\quad 53:-314306651525\quad 54:-995049922171$ |
| $74$ | $55:-4743668726908\quad 56:-1929489509529\quad 57:-554612491507\quad 58:-1905689021958\quad 59:3435858209595$ |
| $74$ | $60:-2965661066763\quad 61:-1883343285180\quad 62:-1465021083346\quad 63:-2213810726749\quad 64:-1321542334128$ |
| $74$ | $65:375658393883\quad 66:403645759548\quad 67:465587079218\quad 68:380437660512\quad 69:-419387175998$ |
| $74$ | $70:2672937181396\quad 71:-2898347800322\quad 72:367054022052\quad 73:-708792285469\quad 74:8427984199970$ |
| $75$ | $0:3326570982616\quad 1:-1361870041345\quad 2:-169587736381\quad 3:-1432611127153\quad 4:1309170440030$ |
| $75$ | $5:467923703511\quad 6:911471205183\quad 7:425409975159\quad 8:991862142630\quad 9:1121371550889$ |
| $75$ | $10:-1193891169900\quad 11:883748889372\quad 12:-882633838747\quad 13:-1088549797679\quad 14:2978919386733$ |
| $75$ | $15:866842110326\quad 16:-942114115323\quad 17:-136845766351\quad 18:793281235360\quad 19:171184307501$ |
| $75$ | $20:-735438658972\quad 21:51138931277\quad 22:-4274584752578\quad 23:-1783553839470\quad 24:91879881927$ |
| $75$ | $25:177855202799\quad 26:4310546152369\quad 27:1130651510534\quad 28:-189641369262\quad 29:402227820022$ |
| $75$ | $30:-5065653923539\quad 31:-2993869678544\quad 32:629496591968\quad 33:-1566475961283\quad 34:-1167530635611$ |
| $75$ | $35:-5344583563382\quad 36:-2354234153901\quad 37:-1654134901165\quad 38:1150710274026\quad 39:-541780418642$ |
| $75$ | $40:-1188362896563\quad 41:445213862914\quad 42:436575564084\quad 43:-1041966528444\quad 44:2544679084933$ |
| $75$ | $45:2502752640585\quad 46:4630760295\quad 47:46826234945\quad 48:2757941922927\quad 49:-263539491420$ |
| $75$ | $50:-2054227673863\quad 51:3759963236787\quad 52:255637196612\quad 53:1463949430649\quad 54:970677053435$ |
| $75$ | $55:-1643969098004\quad 56:-594629082879\quad 57:-46187337672\quad 58:1436465598688\quad 59:605364775854$ |
| $75$ | $60:3997686371854\quad 61:28299250594\quad 62:-1488641258852\quad 63:421360467101\quad 64:2211803725499$ |
| $75$ | $65:-897292091709\quad 66:-402015350248\quad 67:-745548886562\quad 68:343154756201\quad 69:1075660766777$ |
| $75$ | $70:-1170238727000\quad 71:-23818012529\quad 72:1573024235722\quad 73:273461168126\quad 74:-1212693580120$ |
| $75$ | $75:3503958462383$ |
| $76$ | $0:-2171167048474\quad 1:-122958857708\quad 2:5243053932868\quad 3:-2960654465412\quad 4:-1144322368170$ |
| $76$ | $5:1158924350306\quad 6:124903088353\quad 7:652765293740\quad 8:1570098924590\quad 9:-329386968615$ |
| $76$ | $10:2740205533670\quad 11:-3129241922084\quad 12:-1210187176425\quad 13:1477929079945\quad 14:-96709100635$ |
| $76$ | $15:-1548062212323\quad 16:-162803983718\quad 17:-1956697982817\quad 18:-297800388019\quad 19:-5098558867975$ |
| $76$ | $20:-3568194288642\quad 21:-2720854235290\quad 22:-456447492472\quad 23:-139027915262\quad 24:3578127083876$ |
| $76$ | $25:836999554617\quad 26:-275527405996\quad 27:-2812692365594\quad 28:65241394696\quad 29:-1525861214078$ |
| $76$ | $30:4392375992863\quad 31:-645751636414\quad 32:-2621747649261\quad 33:1550983977783\quad 34:2336285374030$ |
| $76$ | $35:-1505871684821\quad 36:-2016077508365\quad 37:2811206031834\quad 38:-1667073218827\quad 39:196236562934$ |
| $76$ | $40:362131374274\quad 41:-1640454589334\quad 42:-1189176669768\quad 43:-577986731967\quad 44:-295666059747$ |
| $76$ | $45:-1817226571016\quad 46:-1653577116032\quad 47:1075599254765\quad 48:-987746204558\quad 49:1451848627886$ |
| $76$ | $50:-1862170151451\quad 51:-1081829586648\quad 52:1881777336357\quad 53:-2527142564171\quad 54:-2401801086039$ |
| $76$ | $55:469708710232\quad 56:2446930789376\quad 57:1753726079892\quad 58:-5490992045570\quad 59:-2198646964783$ |
| $76$ | $60:-918671283366\quad 61:-453919590469\quad 62:-283823794687\quad 63:-488522867239\quad 64:-425095473739$ |
| $76$ | $65:2846797827392\quad 66:-4995156139450\quad 67:-378902766913\quad 68:-669217790104\quad 69:505990028814$ |
| $76$ | $70:-1375382118954\quad 71:-1701023847897\quad 72:438919100014\quad 73:2730781561406\quad 74:-1155011638904$ |
| $76$ | $75:615861727829\quad 76:6038585449293$ |
| $77$ | $0:1999116503167\quad 1:402386720130\quad 2:1281851239653\quad 3:5139522112333\quad 4:994064626591$ |
| $77$ | $5:-977874635311\quad 6:338820398108\quad 7:2400534605880\quad 8:1144092034625\quad 9:1128566590680$ |
| $77$ | $10:-1789540242790\quad 11:1199538251086\quad 12:-4005599403116\quad 13:-4842526559292\quad 14:-5813551248583$ |
| $77$ | $15:-2953765811938\quad 16:-10523861245275\quad 17:176930148192\quad 18:3885428704591\quad 19:2785051014438$ |
| $77$ | $20:1250672186735\quad 21:-5726780995765\quad 22:2425776779350\quad 23:3693549277598\quad 24:1037530647393$ |
| $77$ | $25:-6180491222798\quad 26:-169612203576\quad 27:-1977627867864\quad 28:189143547582\quad 29:540830619237$ |
| $77$ | $30:1606821939562\quad 31:1502444574270\quad 32:-180381935662\quad 33:1690525301038\quad 34:-930765591504$ |
| $77$ | $35:-2278442291913\quad 36:287980005111\quad 37:9925613634431\quad 38:1126107638786\quad 39:-574871067551$ |
| $77$ | $40:511907623269\quad 41:7346794603665\quad 42:2384368559255\quad 43:394018160480\quad 44:-1149281750791$ |
| $77$ | $45:601036196329\quad 46:1690864423887\quad 47:1890350938523\quad 48:726536247725\quad 49:3823875821897$ |
| $77$ | $50:1185433030244\quad 51:-1883900983119\quad 52:56848425837\quad 53:-2559622202288\quad 54:1225505073263$ |
| $77$ | $55:4039494012359\quad 56:2088671330702\quad 57:1810238182956\quad 58:-2368493311006\quad 59:-4325763624069$ |
| $77$ | $60:1884193962905\quad 61:580037764563\quad 62:-1863759359885\quad 63:-983392713260\quad 64:1035791461429$ |
| $77$ | $65:-1610872725745\quad 66:363024561016\quad 67:740990664394\quad 68:1004049075192\quad 69:-2908455892189$ |
| $77$ | $70:315404401129\quad 71:-5006524371673\quad 72:-1108455914212\quad 73:743198565930\quad 74:499542356799$ |
| $77$ | $75:-3224610852501\quad 76:-3846072740378\quad 77:7032221676646$ |
| $78$ | $0:4514271934312\quad 1:-303068130859\quad 2:-266018509518\quad 3:-7200521116220\quad 4:-4092633720927$ |
| $78$ | $5:-8455446705460\quad 6:2037990670863\quad 7:-592460178513\quad 8:-2999380866265\quad 9:-2265475806708$ |
| $78$ | $10:-3764131651970\quad 11:-1224745151450\quad 12:-532228815853\quad 13:-5574861943983\quad 14:-2523582219438$ |
| $78$ | $15:-5394177909695\quad 16:2161422631034\quad 17:-6400340450766\quad 18:-948694798525\quad 19:-3781750586367$ |
| $78$ | $20:2829170611075\quad 21:9038103804564\quad 22:-5657208821917\quad 23:2305510737895\quad 24:-8271473228755$ |
| $78$ | $25:1850972734772\quad 26:2342795637396\quad 27:-1450114748047\quad 28:1740932997388\quad 29:-1108855332957$ |
| $78$ | $30:10462184990240\quad 31:-2726454559761\quad 32:-2232563290702\quad 33:-4462955919694\quad 34:-2571320683596$ |
| $78$ | $35:2400776033823\quad 36:3329051087169\quad 37:4174254266412\quad 38:1869173149937\quad 39:3023601323654$ |
| $78$ | $40:6143605013046\quad 41:-1646929254667\quad 42:1588231730709\quad 43:-29730427887\quad 44:2718533677521$ |
| $78$ | $45:1310883833910\quad 46:-636196366338\quad 47:-1882454720388\quad 48:2057387142964\quad 49:1824555488816$ |
| $78$ | $50:-8128195401057\quad 51:1139008684979\quad 52:-1447009775671\quad 53:1583553977044\quad 54:-1289710322724$ |
| $78$ | $55:3636631119636\quad 56:-465311804528\quad 57:2290613455244\quad 58:-2519160357340\quad 59:-3875259384768$ |
| $78$ | $60:1533143379857\quad 61:-2135207007173\quad 62:-1929706170624\quad 63:-3107716619378\quad 64:-2277929095349$ |
| $78$ | $65:-2132691648621\quad 66:1358351611065\quad 67:426427166291\quad 68:565807784809\quad 69:2687652740508$ |
| $78$ | $70:-803233690623\quad 71:-2467490666467\quad 72:-1798301742873\quad 73:-3508306295496\quad 74:-65781261459$ |
| $78$ | $75:2845931659747\quad 76:-2825611275726\quad 77:1617012682825\quad 78:5827918790078$ |
| $79$ | $0:-2621271964305\quad 1:2986816204059\quad 2:-425877663139\quad 3:-1756328807052\quad 4:-879482848377$ |
| $79$ | $5:759565062115\quad 6:-1567159840831\quad 7:-1150166245721\quad 8:-2048575692210\quad 9:905731585668$ |
| $79$ | $10:-2569562514497\quad 11:-1943534424326\quad 12:1542694671593\quad 13:-1415090235608\quad 14:-317777192043$ |
| $79$ | $15:-994883880998\quad 16:-54005911980\quad 17:1855597899297\quad 18:-792973719815\quad 19:176823446245$ |
| $79$ | $20:-1039864990720\quad 21:3894476530001\quad 22:192935394640\quad 23:1520190133\quad 24:-892279370064$ |
| $79$ | $25:2289230288630\quad 26:882227993330\quad 27:1037485238664\quad 28:1627065125723\quad 29:977952712407$ |
| $79$ | $30:-2377225659962\quad 31:757931256864\quad 32:932263845071\quad 33:1056124931704\quad 34:-592530433456$ |
| $79$ | $35:-831639239430\quad 36:1062832576414\quad 37:-885362074883\quad 38:-340465839457\quad 39:-6309220373722$ |
| $79$ | $40:-731384357423\quad 41:-3858517990541\quad 42:-496920052743\quad 43:-814482929735\quad 44:2050361072748$ |
| $79$ | $45:2581424893631\quad 46:-933982173657\quad 47:-454488620643\quad 48:1866874480287\quad 49:260516704973$ |
| $79$ | $50:-487582721404\quad 51:-1016273428539\quad 52:-614707127452\quad 53:-423843136286\quad 54:125341023404$ |
| $79$ | $55:-2228863890895\quad 56:-1437800350201\quad 57:-320327096840\quad 58:-1313401554183\quad 59:874474542390$ |
| $79$ | $60:-2855344856885\quad 61:-4987081707\quad 62:808510640411\quad 63:-739229021945\quad 64:-2111112787103$ |
| $79$ | $65:241690373342\quad 66:707651190478\quad 67:-751024368755\quad 68:-73738257185\quad 69:-740914549435$ |
| $79$ | $70:-1750963654568\quad 71:-652417247605\quad 72:461336535453\quad 73:-124701307632\quad 74:-850260583630$ |
| $79$ | $75:-1023308280433\quad 76:-426710250316\quad 77:1824321058331\quad 78:-874279421022\quad 79:5094918049831$ |
| $80$ | $0:3484876281290\quad 1:-3016863865698\quad 2:-1022801943781\quad 3:-909649162205\quad 4:-2423879027344$ |
| $80$ | $5:-1844850213235\quad 6:-1434378537438\quad 7:49193704971\quad 8:-1153219354803\quad 9:-630761672536$ |
| $80$ | $10:-2138774046500\quad 11:-2677969880095\quad 12:-359141921573\quad 13:-1273067900714\quad 14:-1171929187026$ |
| $80$ | $15:-5953925558019\quad 16:2513236457608\quad 17:-4626088970298\quad 18:-1041975255954\quad 19:-1925915588888$ |
| $80$ | $20:-619501842311\quad 21:-476649096240\quad 22:1552842377238\quad 23:-570676778091\quad 24:474328584670$ |
| $80$ | $25:4778347214753\quad 26:-1264015284608\quad 27:-2524114601854\quad 28:529178305431\quad 29:-695728121009$ |
| $80$ | $30:-1113135049112\quad 31:1464312428179\quad 32:-131145162359\quad 33:-2447808048163\quad 34:-491650708726$ |
| $80$ | $35:-169156941444\quad 36:-1342155957685\quad 37:2086781537878\quad 38:-299311201168\quad 39:-4081610883585$ |
| $80$ | $40:-4647814155187\quad 41:342116021388\quad 42:1053803425743\quad 43:387655839431\quad 44:-432875895644$ |
| $80$ | $45:1551298290623\quad 46:902399362392\quad 47:-1981560426298\quad 48:-2697819870917\quad 49:-2041084386444$ |
| $80$ | $50:1252034052172\quad 51:-548520545768\quad 52:-838764428069\quad 53:-797905064929\quad 54:-1479928858368$ |
| $80$ | $55:2476544579689\quad 56:2301597360601\quad 57:1411393960123\quad 58:629449039782\quad 59:-759616718143$ |
| $80$ | $60:1466403124517\quad 61:1292062463343\quad 62:-2097128048128\quad 63:1302892960705\quad 64:-688424765376$ |
| $80$ | $65:1707870763903\quad 66:141440077286\quad 67:820310439423\quad 68:776278730734\quad 69:391558510817$ |
| $80$ | $70:2572664777037\quad 71:-4102117716106\quad 72:-2133207932865\quad 73:-1939272529243\quad 74:-2178092331132$ |
| $80$ | $75:2959345862101\quad 76:189256199032\quad 77:-1193215582528\quad 78:4372029139642\quad 79:-1650926353597$ |
| $80$ | $80:8610281654278$ |
| $81$ | $0:3452036906805\quad 1:-711840006199\quad 2:-667862640618\quad 3:167735708170\quad 4:327801088898$ |
| $81$ | $5:327851294068\quad 6:-457965917052\quad 7:-2029290736508\quad 8:-810784834005\quad 9:-117400145243$ |
| $81$ | $10:-3537266150152\quad 11:-3607600677698\quad 12:-3089060501572\quad 13:-2199317110274\quad 14:-2179411608409$ |
| $81$ | $15:-3028118393927\quad 16:-4355880767769\quad 17:237591232865\quad 18:4528801242017\quad 19:6814746570354$ |
| $81$ | $20:2831811666016\quad 21:497849742237\quad 22:1576111649250\quad 23:128983684742\quad 24:3448726827144$ |
| $81$ | $25:-2565679875380\quad 26:-382443740960\quad 27:835862177378\quad 28:-270959419545\quad 29:978807510473$ |
| $81$ | $30:-1460240663261\quad 31:-1595465748638\quad 32:-66079251386\quad 33:-1596155804576\quad 34:2182529851807$ |
| $81$ | $35:596399799127\quad 36:-709741529754\quad 37:3451043565376\quad 38:1949288842239\quad 39:-2102059628222$ |
| $81$ | $40:1111577950678\quad 41:204920863544\quad 42:-1115441293424\quad 43:1510167210590\quad 44:352885090113$ |
| $81$ | $45:-17748509574\quad 46:1462190752274\quad 47:2790039974088\quad 48:2954571934791\quad 49:1612703236355$ |
| $81$ | $50:793703727383\quad 51:-2733945449173\quad 52:-1286811744705\quad 53:-1108061587719\quad 54:-261419321177$ |
| $81$ | $55:1371368741144\quad 56:-1027168839185\quad 57:-195400194343\quad 58:-2093794840885\quad 59:318263456612$ |
| $81$ | $60:184620908538\quad 61:-2029993793861\quad 62:284026319927\quad 63:-427104495825\quad 64:1155512506697$ |
| $81$ | $65:-637885779001\quad 66:1128419625644\quad 67:601496973342\quad 68:-1032571715657\quad 69:1524105497179$ |
| $81$ | $70:-545074253447\quad 71:1543127253846\quad 72:-783986956651\quad 73:4317996516\quad 74:2969315154738$ |
| $81$ | $75:1480607986019\quad 76:45808408604\quad 77:-1711061866542\quad 78:528316230212\quad 79:-2303241205339$ |
| $81$ | $80:-2224990027040\quad 81:4937057887150$ |
| $82$ | $0:20684420137\quad 1:740981113730\quad 2:54416996772\quad 3:136718710535\quad 4:385300163125$ |
| $82$ | $5:-19730515921\quad 6:449460139182\quad 7:339222243061\quad 8:-122385737070\quad 9:532149365347$ |
| $82$ | $10:622232224223\quad 11:536623630654\quad 12:-58682236333\quad 13:668182906153\quad 14:198943887590$ |
| $82$ | $15:-241077992254\quad 16:-175580561510\quad 17:-85955132603\quad 18:111095700384\quad 19:-727471833860$ |
| $82$ | $20:366194025031\quad 21:-524151430939\quad 22:-419521992355\quad 23:-228328860990\quad 24:-501698389413$ |
| $82$ | $25:33051259195\quad 26:-1253331850739\quad 27:-569015475457\quad 28:-208649922936\quad 29:143907158154$ |
| $82$ | $30:5099801268\quad 31:-502899536884\quad 32:431057027959\quad 33:1111392308446\quad 34:-2378244540496$ |
| $82$ | $35:959956066791\quad 36:220614995007\quad 37:270603635824\quad 38:369883615188\quad 39:-13183375265$ |
| $82$ | $40:-1048455725701\quad 41:115937884586\quad 42:980899982198\quad 43:1464895326472\quad 44:1248192236960$ |
| $82$ | $45:527282288495\quad 46:197413248480\quad 47:441498251809\quad 48:1451195238175\quad 49:-197491573562$ |
| $82$ | $50:932744415998\quad 51:813800997193\quad 52:396140250760\quad 53:-608119788505\quad 54:191283611894$ |
| $82$ | $55:-272283587056\quad 56:624664054759\quad 57:-777941494055\quad 58:-1196325831432\quad 59:-125510885055$ |
| $82$ | $60:-469764018180\quad 61:-599022259211\quad 62:151027168940\quad 63:-616507985165\quad 64:-619927945765$ |
| $82$ | $65:-54739950263\quad 66:-725499826226\quad 67:-1268471348816\quad 68:-747684619274\quad 69:1264675902570$ |
| $82$ | $70:-828337183685\quad 71:-389339490860\quad 72:1176022847904\quad 73:1142735895995\quad 74:-705585016057$ |
| $82$ | $75:1998975458852\quad 76:-477721058240\quad 77:59637132260\quad 78:10836247200\quad 79:35090441418$ |
| $82$ | $80:556231912979\quad 81:1058892133901\quad 82:2932691310678$ |
| $83$ | $0:-426637515551\quad 1:931580814066\quad 2:648141123882\quad 3:-351204620112\quad 4:-267060803668$ |
| $83$ | $5:-238800708942\quad 6:467681594373\quad 7:629616737698\quad 8:1252537468632\quad 9:-35989066106$ |
| $83$ | $10:-434023747939\quad 11:-996586643123\quad 12:-114124607263\quad 13:578236550354\quad 14:-108567519069$ |
| $83$ | $15:-715173706597\quad 16:963447453316\quad 17:289255979585\quad 18:349919571797\quad 19:554856838544$ |
| $83$ | $20:-350082651911\quad 21:-2046281129681\quad 22:-141746267131\quad 23:-831600281477\quad 24:2634168886026$ |
| $83$ | $25:-21278247952\quad 26:766188629545\quad 27:1338126829598\quad 28:364184988474\quad 29:23818248713$ |
| $83$ | $30:1589070524035\quad 31:-1303380215124\quad 32:-1404222261324\quad 33:-2262811068885\quad 34:-1058446419270$ |
| $83$ | $35:-4433355228262\quad 36:-2036773716214\quad 37:1229933949672\quad 38:-2988643356555\quad 39:-60966840130$ |
| $83$ | $40:989920565964\quad 41:-665638018692\quad 42:-1373259125291\quad 43:-2250403110505\quad 44:-18671866170$ |
| $83$ | $45:1682795677110\quad 46:-1497678055322\quad 47:-1888580060434\quad 48:-379707102584\quad 49:1033554382658$ |
| $83$ | $50:-2052653417935\quad 51:1217551261102\quad 52:904505197477\quad 53:1348567285051\quad 54:1376195687459$ |
| $83$ | $55:-1022794685820\quad 56:-1413908670925\quad 57:1628595385371\quad 58:155911155930\quad 59:1555342257150$ |
| $83$ | $60:1085617062651\quad 61:380691843635\quad 62:273356225928\quad 63:-41388916577\quad 64:167589729407$ |
| $83$ | $65:-561927680177\quad 66:-647203165294\quad 67:1506124991546\quad 68:-406279949022\quad 69:-3221870432721$ |
| $83$ | $70:1770802242054\quad 71:-2382211590013\quad 72:-455825925444\quad 73:-2237393038443\quad 74:3413030457495$ |
| $83$ | $75:-3874762463932\quad 76:1448566343034\quad 77:-1589339610845\quad 78:1610037577836\quad 79:663590491892$ |
| $83$ | $80:345505528614\quad 81:-1361851610743\quad 82:-4894466042104\quad 83:5893663109083$ |
| $84$ | $0:-210080366931\quad 1:993645842236\quad 2:-863578833720\quad 3:-1075468575078\quad 4:465967626223$ |
| $84$ | $5:1457687653788\quad 6:-2119617823391\quad 7:-1705624133872\quad 8:-168388621914\quad 9:-339729575039$ |
| $84$ | $10:172144468112\quad 11:-272890839819\quad 12:-976596398039\quad 13:-150655011522\quad 14:297577101570$ |
| $84$ | $15:682362853710\quad 16:350554273541\quad 17:296127702772\quad 18:218437578423\quad 19:1014061848470$ |
| $84$ | $20:-195388090871\quad 21:717672804432\quad 22:82741559981\quad 23:734292185578\quad 24:-866447381394$ |
| $84$ | $25:-47681241695\quad 26:377711122538\quad 27:978448164397\quad 28:-311609749222\quad 29:1541992789867$ |
| $84$ | $30:-155637297239\quad 31:-1064108706295\quad 32:1021665448382\quad 33:851966871879\quad 34:-669718204365$ |
| $84$ | $35:-2437783083001\quad 36:-2529920121272\quad 37:-128219222308\quad 38:1897520715572\quad 39:-397574194861$ |
| $84$ | $40:-384372702884\quad 41:2483154793076\quad 42:-1478125187756\quad 43:-2425441392986\quad 44:-2578647318599$ |
| $84$ | $45:-855404000514\quad 46:1053083305152\quad 47:-627506055104\quad 48:-1145442259352\quad 49:983404365602$ |
| $84$ | $50:-924276238525\quad 51:-3204290287507\quad 52:-86102298898\quad 53:-1269335327325\quad 54:-2168607642142$ |
| $84$ | $55:1736833769283\quad 56:-118529941781\quad 57:784761710936\quad 58:40589813430\quad 59:533644043340$ |
| $84$ | $60:791286864681\quad 61:460091381288\quad 62:-1292155260251\quad 63:34661783539\quad 64:2348769361522$ |
| $84$ | $65:411030272195\quad 66:701101168161\quad 67:1251642734964\quad 68:2370851011078\quad 69:1527387355116$ |
| $84$ | $70:-433742954678\quad 71:2344505616664\quad 72:-810223063669\quad 73:-619353252015\quad 74:1003353617418$ |
| $84$ | $75:3001101468358\quad 76:-133190566742\quad 77:-347319712712\quad 78:-1486426634517\quad 79:175711989616$ |
| $84$ | $80:-409448930058\quad 81:-4450004837959\quad 82:1527708661743\quad 83:-2877280114999\quad 84:7048672467148$ |
| $85$ | $0:344505325560\quad 1:329436410421\quad 2:-24497956597\quad 3:-330031375093\quad 4:153066403720$ |
| $85$ | $5:153575466839\quad 6:-229755226832\quad 7:241084712946\quad 8:486527472037\quad 9:33219105215$ |
| $85$ | $10:1731645233297\quad 11:40027630181\quad 12:137083246359\quad 13:-24841632208\quad 14:-190669733126$ |
| $85$ | $15:482381771649\quad 16:-240494577678\quad 17:105780674514\quad 18:425244056052\quad 19:353518330054$ |
| $85$ | $20:96453471380\quad 21:311019142297\quad 22:76025190417\quad 23:229621258562\quad 24:1085358556024$ |
| $85$ | $25:466975896695\quad 26:812407847526\quad 27:103849572508\quad 28:-159303901249\quad 29:-104200261463$ |
| $85$ | $30:1082867380946\quad 31:-183252418556\quad 32:698052214162\quad 33:238530073807\quad 34:422662114825$ |
| $85$ | $35:-134519822357\quad 36:-290397835103\quad 37:-184854353021\quad 38:460266175771\quad 39:-121165562250$ |
| $85$ | $40:-201035066810\quad 41:-853558999453\quad 42:-1840704819526\quad 43:-1100796129651\quad 44:-137256336903$ |
| $85$ | $45:-288833920199\quad 46:-1617844377488\quad 47:-1048002103316\quad 48:-521864368329\quad 49:-433261356443$ |
| $85$ | $50:436411283460\quad 51:88402635266\quad 52:58973408993\quad 53:-1332594237763\quad 54:398505253575$ |
| $85$ | $55:1375308087129\quad 56:165491983851\quad 57:540162960346\quad 58:1812665307332\quad 59:-1154042628330$ |
| $85$ | $60:419380648725\quad 61:72587207335\quad 62:369956259400\quad 63:553943480215\quad 64:-173927639146$ |
| $85$ | $65:-148712147427\quad 66:-704971665132\quad 67:605555804847\quad 68:1137838311274\quad 69:-660992429968$ |
| $85$ | $70:409506213226\quad 71:-896680496398\quad 72:-2416624129649\quad 73:-439055981249\quad 74:3732816037270$ |
| $85$ | $75:2236746161221\quad 76:-2006749388883\quad 77:-1244337559315\quad 78:-1139017282867\quad 79:3411062122905$ |
| $85$ | $80:336132136748\quad 81:317274267552\quad 82:217133141320\quad 83:2032163866824\quad 84:-819635242345$ |
| $85$ | $85:6054500226653$ |
| $86$ | $0:-2829007578431\quad 1:-3319833109728\quad 2:-2783855885763\quad 3:1405132740948\quad 4:-731732925098$ |
| $86$ | $5:982076685205\quad 6:-1656153648664\quad 7:-1812281235867\quad 8:-885143515701\quad 9:-1032882273604$ |
| $86$ | $10:-5392072517304\quad 11:-2315416259625\quad 12:3506657843816\quad 13:-328154262187\quad 14:-1313020803659$ |
| $86$ | $15:-1815211603156\quad 16:-1695716011024\quad 17:-1890577958789\quad 18:-1446704108424\quad 19:-1630696185966$ |
| $86$ | $20:770578060467\quad 21:3730204630025\quad 22:-4525865829263\quad 23:-507966803774\quad 24:-3336562340595$ |
| $86$ | $25:-464384568560\quad 26:-1148568246083\quad 27:425635243725\quad 28:1041228283678\quad 29:558037088054$ |
| $86$ | $30:5090497927358\quad 31:1039820686265\quad 32:-486801671617\quad 33:1176469040694\quad 34:77069377006$ |
| $86$ | $35:287242350848\quad 36:295915330916\quad 37:136472882172\quad 38:-2066553731117\quad 39:1567200952741$ |
| $86$ | $40:-635606203646\quad 41:242412111334\quad 42:973323240451\quad 43:172279052010\quad 44:870753017481$ |
| $86$ | $45:1147791312528\quad 46:9113799092\quad 47:-1053526383900\quad 48:1034138581885\quad 49:860060115381$ |
| $86$ | $50:-4504571083134\quad 51:-4555896261\quad 52:-968335323960\quad 53:472489221030\quad 54:-1548824543733$ |
| $86$ | $55:1882012089764\quad 56:-256890327077\quad 57:4869929170\quad 58:-2779226878266\quad 59:-2702513050281$ |
| $86$ | $60:2102234753\quad 61:97514715248\quad 62:443796563011\quad 63:-687099638000\quad 64:51712630513$ |
| $86$ | $65:-282819103323\quad 66:283193473479\quad 67:682196091393\quad 68:-822034353213\quad 69:1135442523321$ |
| $86$ | $70:-693480986744\quad 71:-445514861618\quad 72:-163408423475\quad 73:-876351168597\quad 74:-1197358561680$ |
| $86$ | $75:2061083394507\quad 76:566893903839\quad 77:206638888483\quad 78:1144332469541\quad 79:397002877814$ |
| $86$ | $80:401508977830\quad 81:-662602182235\quad 82:-301962168140\quad 83:-1059506377664\quad 84:-252810473610$ |
| $86$ | $85:56290319794\quad 86:2692672523177$ |
| $87$ | $0:1158188679942\quad 1:-1839505457371\quad 2:-1800382441688\quad 3:-3458168972756\quad 4:-2236020693889$ |
| $87$ | $5:-147995088191\quad 6:512323925103\quad 7:-999987804050\quad 8:-1317393227479\quad 9:-576189727107$ |
| $87$ | $10:3283434707604\quad 11:-1379305909352\quad 12:958476300872\quad 13:55560446869\quad 14:729973256050$ |
| $87$ | $15:-541058026659\quad 16:-408147221361\quad 17:-4020244952538\quad 18:-1016429077467\quad 19:-2402480931567$ |
| $87$ | $20:2493183433222\quad 21:2704306982263\quad 22:661188332190\quad 23:-386393401639\quad 24:-5087050735919$ |
| $87$ | $25:-359664745835\quad 26:3527437213230\quad 27:-1261689800301\quad 28:485458876975\quad 29:-156543623471$ |
| $87$ | $30:4484813340388\quad 31:2844871359754\quad 32:753097685654\quad 33:-2716492112761\quad 34:-1662449123013$ |
| $87$ | $35:97684123199\quad 36:-171991858241\quad 37:-431794867019\quad 38:-347470793038\quad 39:-1282011453223$ |
| $87$ | $40:-1588102148785\quad 41:-2807652786540\quad 42:-1116508747718\quad 43:-921552434084\quad 44:-696057169321$ |
| $87$ | $45:-956431922013\quad 46:67648441492\quad 47:500218357369\quad 48:-2401832237690\quad 49:-548619734532$ |
| $87$ | $50:1755505032232\quad 51:52386077272\quad 52:-443414404081\quad 53:1983882158316\quad 54:-889729998669$ |
| $87$ | $55:-1523603367627\quad 56:15011172596\quad 57:1243201846117\quad 58:-401690538326\quad 59:-1402935162590$ |
| $87$ | $60:-2287504248872\quad 61:-1155853014133\quad 62:-603553993250\quad 63:-648854677402\quad 64:-1931859740594$ |
| $87$ | $65:-541747326218\quad 66:1721668841949\quad 67:23628857630\quad 68:241098481233\quad 69:-1358352563418$ |
| $87$ | $70:2152569719235\quad 71:631864331573\quad 72:-698995685638\quad 73:-1020220465856\quad 74:1714460279601$ |
| $87$ | $75:-1187951298377\quad 76:-2137462424785\quad 77:2036968840445\quad 78:1764773602173\quad 79:826793649273$ |
| $87$ | $80:-2104040787345\quad 81:-225518658483\quad 82:2009422897805\quad 83:899841932919\quad 84:1581332074599$ |
| $87$ | $85:619063817891\quad 86:-1911944560219\quad 87:3533885335746$ |
| $88$ | $0:-472657866331\quad 1:2570103940652\quad 2:-203643241371\quad 3:-1432522046995\quad 4:971889827689$ |
| $88$ | $5:844599123207\quad 6:-233569234122\quad 7:88381552485\quad 8:1148431815216\quad 9:-79858705925$ |
| $88$ | $10:2026846787017\quad 11:-524996870727\quad 12:-431204436714\quad 13:-809344420790\quad 14:830830105494$ |
| $88$ | $15:-905450082907\quad 16:1150164183244\quad 17:-287294290357\quad 18:850424506080\quad 19:2685449525762$ |
| $88$ | $20:-507335782087\quad 21:1408526968871\quad 22:2419540794464\quad 23:-187489000008\quad 24:238026093565$ |
| $88$ | $25:1226208990000\quad 26:450898805155\quad 27:1125753602938\quad 28:190440583318\quad 29:273776391584$ |
| $88$ | $30:-1592643786678\quad 31:-2401140992167\quad 32:-2395032048268\quad 33:-950829351485\quad 34:964220156541$ |
| $88$ | $35:-722009025084\quad 36:-429416798133\quad 37:608019558287\quad 38:2193419914364\quad 39:842503543920$ |
| $88$ | $40:1144277081030\quad 41:790717697273\quad 42:-1486741493948\quad 43:-1749099120752\quad 44:-1617609457815$ |
| $88$ | $45:-710978242951\quad 46:104270983726\quad 47:-599392287310\quad 48:-1825801150988\quad 49:34078418060$ |
| $88$ | $50:829620901548\quad 51:-1644853869271\quad 52:-950581935637\quad 53:-2999819752761\quad 54:-61082839356$ |
| $88$ | $55:254142317945\quad 56:-84985339518\quad 57:-1478803367520\quad 58:-982227242095\quad 59:-2331729644722$ |
| $88$ | $60:-404160989517\quad 61:684886080161\quad 62:467551591256\quad 63:2886603627359\quad 64:-107815832530$ |
| $88$ | $65:-158769744520\quad 66:-209648354183\quad 67:110565568017\quad 68:1250529838977\quad 69:-195000646192$ |
| $88$ | $70:1502684251643\quad 71:-1201217036430\quad 72:1194250786654\quad 73:-660490123737\quad 74:89526703651$ |
| $88$ | $75:1929275760617\quad 76:-209381741014\quad 77:-567979501163\quad 78:2220162971121\quad 79:3432358074350$ |
| $88$ | $80:188706020111\quad 81:-4366224562404\quad 82:308068388877\quad 83:86200352374\quad 84:-109970046077$ |
| $88$ | $85:-616910654186\quad 86:-846060624363\quad 87:-1429333915841\quad 88:5904193741609$ |
| $89$ | $0:240365074661\quad 1:-476283914514\quad 2:2575399638396\quad 3:-1481890162656\quad 4:-583351109798$ |
| $89$ | $5:-178488986191\quad 6:1917740335673\quad 7:116634115852\quad 8:158586198810\quad 9:340161006930$ |
| $89$ | $10:4567437724527\quad 11:423904845153\quad 12:-50959375300\quad 13:1085616983809\quad 14:-1780944423963$ |
| $89$ | $15:-1993776485841\quad 16:-582070327947\quad 17:-503745652326\quad 18:-2232804945826\quad 19:-2453758790668$ |
| $89$ | $20:312923537579\quad 21:-704218453646\quad 22:-778444851480\quad 23:704594837204\quad 24:27910701893$ |
| $89$ | $25:-336447070188\quad 26:491423593360\quad 27:-1521389995219\quad 28:-433364127285\quad 29:287231481011$ |
| $89$ | $30:-331791607427\quad 31:1074325780820\quad 32:1779248448510\quad 33:1256990770809\quad 34:-748483603839$ |
| $89$ | $35:-1141850778014\quad 36:-208407746376\quad 37:-950144816344\quad 38:-1603702040789\quad 39:-3751649977692$ |
| $89$ | $40:-219182435486\quad 41:-3071564234671\quad 42:2208782374714\quad 43:3421289995430\quad 44:1504842466588$ |
| $89$ | $45:1837132125292\quad 46:-239740032369\quad 47:1227693400330\quad 48:1681685544288\quad 49:1031273295952$ |
| $89$ | $50:1438661213560\quad 51:594974468386\quad 52:1549843329783\quad 53:1987116486804\quad 54:2296877822908$ |
| $89$ | $55:-922543536777\quad 56:1276922010153\quad 57:1532384442976\quad 58:1325157822919\quad 59:880873314528$ |
| $89$ | $60:-1065524024194\quad 61:-993288257904\quad 62:-1063909764989\quad 63:-3250722053403\quad 64:-1456376382719$ |
| $89$ | $65:-8086554035\quad 66:149069810465\quad 67:-282350572509\quad 68:-1453485615808\quad 69:453750317957$ |
| $89$ | $70:116602831502\quad 71:2075932932414\quad 72:-803184838743\quad 73:459656685033\quad 74:-1758699626973$ |
| $89$ | $75:-2522259042116\quad 76:-725444612324\quad 77:1203412022318\quad 78:-261811569796\quad 79:-3923961934207$ |
| $89$ | $80:2450472552763\quad 81:7048461322031\quad 82:1748519901606\quad 83:155596129054\quad 84:-1177250046513$ |
| $89$ | $85:-1602671722340\quad 86:29651083771\quad 87:1709643950820\quad 88:-4056697467224\quad 89:2277413229654$ |
| $90$ | $0:1615989690013\quad 1:81135972762\quad 2:292325968031\quad 3:-989201885300\quad 4:958420518004$ |
| $90$ | $5:-366761960356\quad 6:516654566967\quad 7:-1089993033170\quad 8:-1932555675022\quad 9:-799720852955$ |
| $90$ | $10:-88459098085\quad 11:-339314889811\quad 12:-623344642560\quad 13:-774705830392\quad 14:-90878624463$ |
| $90$ | $15:541140279853\quad 16:-286060876074\quad 17:-892650954933\quad 18:485094450393\quad 19:-198519765803$ |
| $90$ | $20:131254820327\quad 21:-146692054543\quad 22:-1749030209269\quad 23:-1620906262020\quad 24:-321005189627$ |
| $90$ | $25:460326953046\quad 26:-544615704535\quad 27:395912115702\quad 28:-55623462045\quad 29:1035439247626$ |
| $90$ | $30:-1825039977230\quad 31:-2258921487039\quad 32:-92617610582\quad 33:-443211395709\quad 34:1516293543401$ |
| $90$ | $35:-436666027462\quad 36:736049214079\quad 37:-1952451375532\quad 38:-563838036886\quad 39:-541380430018$ |
| $90$ | $40:-1947124684423\quad 41:1260759337634\quad 42:255245979912\quad 43:-874753740630\quad 44:1773656044121$ |
| $90$ | $45:1251214122309\quad 46:-525280822258\quad 47:865600596352\quad 48:1013623059755\quad 49:822035865323$ |
| $90$ | $50:-59437202768\quad 51:-459282211468\quad 52:334955314304\quad 53:2741370149365\quad 54:-425440449618$ |
| $90$ | $55:-665182911617\quad 56:-1116917189869\quad 57:-703558731058\quad 58:-1058824340401\quad 59:-145288388390$ |
| $90$ | $60:-204063459898\quad 61:1812179722034\quad 62:-577698563090\quad 63:314660567402\quad 64:2255861132088$ |
| $90$ | $65:965293319126\quad 66:-1100474708347\quad 67:139738921145\quad 68:-783706598456\quad 69:-819164287353$ |
| $90$ | $70:479999059736\quad 71:-2423755699196\quad 72:-1623358911449\quad 73:1031937490618\quad 74:89360894201$ |
| $90$ | $75:-472696394864\quad 76:1049226970877\quad 77:1512740050393\quad 78:-54133266258\quad 79:-2094190796429$ |
| $90$ | $80:-726783183890\quad 81:2047223074477\quad 82:56814151241\quad 83:97038585257\quad 84:37116826380$ |
| $90$ | $85:-2065492313000\quad 86:-766633144436\quad 87:203381392799\quad 88:-1804774198972\quad 89:1424782311175$ |
| $90$ | $90:1950786495270$ |
| $91$ | $0:67613375555\quad 1:-200760074181\quad 2:-819776709467\quad 3:-478151488034\quad 4:432382174167$ |
| $91$ | $5:639679176953\quad 6:-273504585518\quad 7:-1121667493001\quad 8:191437399999\quad 9:205175930497$ |
| $91$ | $10:-660008106410\quad 11:-947947071944\quad 12:-286896968904\quad 13:-216832616468\quad 14:-433793704072$ |
| $91$ | $15:43703902270\quad 16:-336889547859\quad 17:767940644513\quad 18:-592492752793\quad 19:-411043802575$ |
| $91$ | $20:240720027306\quad 21:15054152588\quad 22:350061389204\quad 23:262343776347\quad 24:1160402838230$ |
| $91$ | $25:427897378537\quad 26:1125827257509\quad 27:1559342403859\quad 28:110716671560\quad 29:187793124101$ |
| $91$ | $30:-1696154826087\quad 31:-1517441271653\quad 32:518655642725\quad 33:-618255541248\quad 34:-2705779629970$ |
| $91$ | $35:-2188384257598\quad 36:-4901815009381\quad 37:-1200229665758\quad 38:2293168901271\quad 39:424467786814$ |
| $91$ | $40:-407710339840\quad 41:1636302763638\quad 42:1733619774442\quad 43:-2644118276824\quad 44:-2925708011940$ |
| $91$ | $45:-2621770937600\quad 46:941798361174\quad 47:-20591128161\quad 48:-1816712406169\quad 49:747481107983$ |
| $91$ | $50:-498463364048\quad 51:-300225451156\quad 52:-568155379988\quad 53:-541800905783\quad 54:-594600124189$ |
| $91$ | $55:231191874588\quad 56:-632462567915\quad 57:375093182789\quad 58:181608459172\quad 59:231144293876$ |
| $91$ | $60:-562720563729\quad 61:-474855387889\quad 62:-658065196095\quad 63:-269160332339\quad 64:1272881453750$ |
| $91$ | $65:1965993538110\quad 66:1997153730981\quad 67:1387899830670\quad 68:833389279958\quad 69:1891116757432$ |
| $91$ | $70:873065994823\quad 71:1457339764999\quad 72:-612038542078\quad 73:-1299962466393\quad 74:-2543838827388$ |
| $91$ | $75:1153462166346\quad 76:-717825438534\quad 77:2283523344402\quad 78:-2603543120466\quad 79:493346113332$ |
| $91$ | $80:-352558094521\quad 81:1189420553937\quad 82:1752135849067\quad 83:-1316591685887\quad 84:-4480696163652$ |
| $91$ | $85:-219641595042\quad 86:240382536970\quad 87:-153277438492\quad 88:-195938847911\quad 89:1994050869918$ |
| $91$ | $90:2215832492921\quad 91:5579561718055$ |
| $92$ | $0:-4297862748403\quad 1:-862137908401\quad 2:339737646310\quad 3:-2417584047592\quad 4:-821705917059$ |
| $92$ | $5:916577843511\quad 6:1105770028556\quad 7:-211976920920\quad 8:-510893450917\quad 9:179608526987$ |
| $92$ | $10:778851648580\quad 11:-899467137508\quad 12:-884814367127\quad 13:224989633463\quad 14:-1147658823516$ |
| $92$ | $15:1220985018467\quad 16:-1565465354637\quad 17:-1373109183794\quad 18:-455220981180\quad 19:-962343492023$ |
| $92$ | $20:-329329102592\quad 21:1020670030292\quad 22:785176703152\quad 23:908031493369\quad 24:-1930419820073$ |
| $92$ | $25:52407742900\quad 26:2847156111769\quad 27:1878665256243\quad 28:472670793361\quad 29:26317389062$ |
| $92$ | $30:-2049360279451\quad 31:1485114552881\quad 32:1120164004132\quad 33:360530865888\quad 34:-2850396435948$ |
| $92$ | $35:172927936119\quad 36:-1727629176722\quad 37:-848427793302\quad 38:2847475736668\quad 39:-154214937762$ |
| $92$ | $40:-1990667046823\quad 41:842683811067\quad 42:-1857570794022\quad 43:492216506431\quad 44:-1487532922633$ |
| $92$ | $45:-916846236376\quad 46:1273069446272\quad 47:279891402368\quad 48:-153994229780\quad 49:707534183467$ |
| $92$ | $50:341943919871\quad 51:-549060501761\quad 52:86445357273\quad 53:-522554049254\quad 54:2844450901669$ |
| $92$ | $55:-1634314503316\quad 56:1180371144632\quad 57:-1681036639344\quad 58:-2467189802719\quad 59:-303503664622$ |
| $92$ | $60:-2055988313491\quad 61:-747459424487\quad 62:966818222111\quad 63:-602149285355\quad 64:-1532299239805$ |
| $92$ | $65:-771655359474\quad 66:1451868332965\quad 67:-2826516450738\quad 68:-1096808846310\quad 69:-361429696930$ |
| $92$ | $70:-734010921795\quad 71:377552300706\quad 72:4046732565286\quad 73:2038138899796\quad 74:-745622638235$ |
| $92$ | $75:-134259641330\quad 76:-579767379856\quad 77:-2983723190382\quad 78:53529080354\quad 79:944616181428$ |
| $92$ | $80:338500645087\quad 81:906239272534\quad 82:1381939578519\quad 83:905435073853\quad 84:-926250055822$ |
| $92$ | $85:-847489751916\quad 86:443493184410\quad 87:420386352046\quad 88:1833772358170\quad 89:-889090012736$ |
| $92$ | $90:-1919739316534\quad 91:958860668012\quad 92:2689658205926$ |
| $93$ | $0:2718802526397\quad 1:4546448509738\quad 2:-2602199130182\quad 3:5139120869293\quad 4:-455223012320$ |
| $93$ | $5:-202570730972\quad 6:-361875959893\quad 7:-68580995698\quad 8:860553553105\quad 9:738734502102$ |
| $93$ | $10:-536177664244\quad 11:2103097217529\quad 12:-539255426174\quad 13:-3413354300904\quad 14:2071234154$ |
| $93$ | $15:1089196670598\quad 16:-2965267390456\quad 17:2647336162780\quad 18:-683875678029\quad 19:-780803200$ |
| $93$ | $20:3424957463173\quad 21:-1979747672754\quad 22:-26196978654\quad 23:5843241956079\quad 24:-1344127264047$ |
| $93$ | $25:-499580384339\quad 26:-2032245817070\quad 27:-410271693526\quad 28:-812509105153\quad 29:-1341532875952$ |
| $93$ | $30:751287556600\quad 31:2853595558769\quad 32:-1494132141024\quad 33:-1800562219256\quad 34:-1806783253384$ |
| $93$ | $35:945936448627\quad 36:-1346482893141\quad 37:-11198325647487\quad 38:-191272549714\quad 39:-654636472512$ |
| $93$ | $40:1929517488\quad 41:-10158564491793\quad 42:-1516967448766\quad 43:-1919748337647\quad 44:-325541470549$ |
| $93$ | $45:-911597674569\quad 46:-2189928694565\quad 47:-3477793546148\quad 48:-3371622564129\quad 49:-309022789311$ |
| $93$ | $50:1065970445000\quad 51:-353780415852\quad 52:-741422515429\quad 53:958978884499\quad 54:611074345181$ |
| $93$ | $55:-1894575567475\quad 56:162095802318\quad 57:1867790887112\quad 58:3290806719553\quad 59:-1753756261851$ |
| $93$ | $60:-222241246172\quad 61:-379591683600\quad 62:960098352170\quad 63:1337656544432\quad 64:-1292498124211$ |
| $93$ | $65:854752527569\quad 66:-33453404996\quad 67:-2085094135787\quad 68:-4811406322974\quad 69:1818730425462$ |
| $93$ | $70:3264075896851\quad 71:-732840705412\quad 72:684517990553\quad 73:-1085288225486\quad 74:-2533693905947$ |
| $93$ | $75:866765704997\quad 76:1570621468584\quad 77:-141683844775\quad 78:-67568376404\quad 79:-118370120562$ |
| $93$ | $80:1234125724145\quad 81:-91364335258\quad 82:2127213534381\quad 83:-1546310040924\quad 84:1498432936683$ |
| $93$ | $85:-1322788285333\quad 86:1576373604375\quad 87:267873005321\quad 88:-453145279331\quad 89:414376917917$ |
| $93$ | $90:165962533493\quad 91:-77343060935\quad 92:-1973643895614\quad 93:3483985209498$ |
| $94$ | $0:-291377710127\quad 1:1335504274961\quad 2:-9526074594\quad 3:-175866195613\quad 4:-131331963303$ |
| $94$ | $5:-2435047262539\quad 6:609350171130\quad 7:292752597764\quad 8:-270539136316\quad 9:-2429966335375$ |
| $94$ | $10:625762391529\quad 11:-694921069136\quad 12:920830114514\quad 13:-3226790793546\quad 14:1673829201046$ |
| $94$ | $15:-1108792536118\quad 16:-687566830610\quad 17:1692269379140\quad 18:-403301202160\quad 19:13914033638$ |
| $94$ | $20:-29535662168\quad 21:3097844762987\quad 22:440061144691\quad 23:1272179078761\quad 24:333926215141$ |
| $94$ | $25:87329599452\quad 26:136873790763\quad 27:-240036857864\quad 28:87353760248\quad 29:-961784394612$ |
| $94$ | $30:-2442413623283\quad 31:-320280964296\quad 32:1192734213099\quad 33:670710815490\quad 34:-1633741917136$ |
| $94$ | $35:932298776770\quad 36:-713687571435\quad 37:-2069853213552\quad 38:-430114281570\quad 39:-2164897671204$ |
| $94$ | $40:312692007832\quad 41:153485108510\quad 42:-754438265010\quad 43:-301255878883\quad 44:1604718480493$ |
| $94$ | $45:608081136102\quad 46:-1470413640125\quad 47:-2361340217920\quad 48:1658457674570\quad 49:2124526770691$ |
| $94$ | $50:374843947269\quad 51:414281268435\quad 52:667809876966\quad 53:-876834273495\quad 54:-214257885088$ |
| $94$ | $55:1060194412452\quad 56:-47878649815\quad 57:416543756610\quad 58:-404914777991\quad 59:2112740669225$ |
| $94$ | $60:2279802802447\quad 61:182200295255\quad 62:-1808333920598\quad 63:-1279136660153\quad 64:80736799344$ |
| $94$ | $65:-311320086453\quad 66:-999199726289\quad 67:-54376262507\quad 68:1721866209950\quad 69:-205779266341$ |
| $94$ | $70:-1312489141425\quad 71:1305861361241\quad 72:1353868324638\quad 73:49473803315\quad 74:-231451304738$ |
| $94$ | $75:1378518763868\quad 76:3165165111613\quad 77:-554584828156\quad 78:284621189554\quad 79:571276123243$ |
| $94$ | $80:-840438629808\quad 81:-480124268836\quad 82:-1709356001442\quad 83:1282041738144\quad 84:-258087976878$ |
| $94$ | $85:-929223014402\quad 86:-812301158492\quad 87:312087598023\quad 88:876912005625\quad 89:-1526322873277$ |
| $94$ | $90:-449871968746\quad 91:1423093484219\quad 92:840576447338\quad 93:-1201925966872\quad 94:1687324157178$ |
| $95$ | $0:-731735564219\quad 1:1568784433928\quad 2:139633678784\quad 3:-485331676234\quad 4:-172895149542$ |
| $95$ | $5:-46579180688\quad 6:599002654542\quad 7:351790061980\quad 8:843875635212\quad 9:-743399138084$ |
| $95$ | $10:-33741352316\quad 11:-1087452590120\quad 12:-672453908057\quad 13:-1114911267560\quad 14:-751399176492$ |
| $95$ | $15:-1620758644365\quad 16:224710535384\quad 17:-895254635294\quad 18:-159740722323\quad 19:778053521582$ |
| $95$ | $20:-921171032204\quad 21:980672966419\quad 22:992846489270\quad 23:-705535336157\quad 24:524941929113$ |
| $95$ | $25:1549813170156\quad 26:-43119135969\quad 27:457471255112\quad 28:146058519487\quad 29:-888627127248$ |
| $95$ | $30:-1280911728371\quad 31:-1054803896134\quad 32:-2099039471257\quad 33:-1410412834754\quad 34:-184554357760$ |
| $95$ | $35:-522202430713\quad 36:-1197226629895\quad 37:-411960716008\quad 38:49753679327\quad 39:158707653272$ |
| $95$ | $40:-2060195587129\quad 41:416849526928\quad 42:210919333015\quad 43:-739816912499\quad 44:-728849972891$ |
| $95$ | $45:-341065872708\quad 46:2543316627111\quad 47:-216767142733\quad 48:-1542419736645\quad 49:-2477868005179$ |
| $95$ | $50:-770275841180\quad 51:-585797357398\quad 52:-755709334922\quad 53:-738251942374\quad 54:1289134825642$ |
| $95$ | $55:562511714653\quad 56:608486061721\quad 57:-554949547123\quad 58:-976274878730\quad 59:253304734556$ |
| $95$ | $60:69512230775\quad 61:845693492204\quad 62:-320791025174\quad 63:3424449873357\quad 64:-423679273114$ |
| $95$ | $65:2276500569093\quad 66:252004750021\quad 67:-1129928578977\quad 68:251094905315\quad 69:2392026857503$ |
| $95$ | $70:-782313930166\quad 71:-1889881841048\quad 72:12031732980\quad 73:-117405292495\quad 74:290318098367$ |
| $95$ | $75:-341985959679\quad 76:-472709118912\quad 77:-527215678965\quad 78:-2067999451702\quad 79:903108706040$ |
| $95$ | $80:-1044883882096\quad 81:333786549634\quad 82:178898137179\quad 83:-2027680782322\quad 84:1229839098278$ |
| $95$ | $85:90230980820\quad 86:2536068999447\quad 87:284302899312\quad 88:2462156950120\quad 89:-257658078902$ |
| $95$ | $90:1547016880158\quad 91:-237357146127\quad 92:3417968838845\quad 93:331390610047\quad 94:-957817294769$ |
| $95$ | $95:4179341816943$ |
| $96$ | $0:4608618596163\quad 1:-6619747732922\quad 2:1075966088337\quad 3:977111229736\quad 4:-607554504858$ |
| $96$ | $5:-738799334435\quad 6:431708680938\quad 7:131511815940\quad 8:-102872378969\quad 9:-296851418718$ |
| $96$ | $10:503196274993\quad 11:-407324414958\quad 12:-2040397119598\quad 13:-3307853605521\quad 14:-339882165600$ |
| $96$ | $15:-1343573991228\quad 16:4858658068715\quad 17:-2196303869341\quad 18:-612965861507\quad 19:-1959529912721$ |
| $96$ | $20:-1075738663817\quad 21:3581090222073\quad 22:578557455756\quad 23:978332213268\quad 24:-3528396463926$ |
| $96$ | $25:1146550716267\quad 26:-163909714447\quad 27:-666607688327\quad 28:238886364074\quad 29:-682961045031$ |
| $96$ | $30:-2792162759951\quad 31:1996618124814\quad 32:493296626177\quad 33:-899132516762\quad 34:-1992579952893$ |
| $96$ | $35:1199311311823\quad 36:159608099059\quad 37:-1090249008907\quad 38:424581400914\quad 39:900544990236$ |
| $96$ | $40:-131352711934\quad 41:1285055544982\quad 42:-291127479974\quad 43:226497941545\quad 44:-78570722103$ |
| $96$ | $45:-397943501391\quad 46:-834857384003\quad 47:-159607968436\quad 48:415935864595\quad 49:2077017322992$ |
| $96$ | $50:1888770127180\quad 51:-1766801241053\quad 52:-648221887268\quad 53:-1873993854279\quad 54:854001994192$ |
| $96$ | $55:-1113967663476\quad 56:-42673082930\quad 57:-2260030760034\quad 58:4117451863142\quad 59:-937614885976$ |
| $96$ | $60:-1170496521648\quad 61:-56651118666\quad 62:430930888556\quad 63:-2940626827416\quad 64:-498965216717$ |
| $96$ | $65:520548879814\quad 66:1424396633721\quad 67:-698684218616\quad 68:-316189341916\quad 69:2888337424367$ |
| $96$ | $70:858935179658\quad 71:585446281324\quad 72:-2090465757182\quad 73:-1189961054620\quad 74:-117429255784$ |
| $96$ | $75:606777871857\quad 76:1863457505146\quad 77:-1020484025878\quad 78:93783301265\quad 79:-354069602349$ |
| $96$ | $80:-2500466565197\quad 81:-1709600911207\quad 82:-3768190094171\quad 83:1713067305609\quad 84:123580354016$ |
| $96$ | $85:342025425615\quad 86:-925818790059\quad 87:-3180800726594\quad 88:-2271819979445\quad 89:-419053916382$ |
| $96$ | $90:1249430491401\quad 91:580154647753\quad 92:289660766702\quad 93:-1067860417228\quad 94:877763872125$ |
| $96$ | $95:-446612000514\quad 96:2373829166128$ |
| $97$ | $0:-2289273948442\quad 1:31437968981\quad 2:1510001259727\quad 3:727871954764\quad 4:119569417310$ |
| $97$ | $5:-461128473069\quad 6:381339845076\quad 7:454910680777\quad 8:-477236271288\quad 9:49662125548$ |
| $97$ | $10:-134382187902\quad 11:-404128990208\quad 12:-577850784156\quad 13:350380889428\quad 14:396357320699$ |
| $97$ | $15:675005207557\quad 16:-1828971722570\quad 17:-862977176710\quad 18:2302671310280\quad 19:774686623624$ |
| $97$ | $20:-1966116923785\quad 21:-1272388599771\quad 22:2257408174420\quad 23:-126233459326\quad 24:-2665422925577$ |
| $97$ | $25:-1269335235648\quad 26:1365951698327\quad 27:718244413314\quad 28:905646650797\quad 29:629416128434$ |
| $97$ | $30:-347369202966\quad 31:-14528373561\quad 32:533719455579\quad 33:1623040346284\quad 34:-185834656017$ |
| $97$ | $35:1635097828846\quad 36:-540617677727\quad 37:-4472785876220\quad 38:-792924892686\quad 39:420713507639$ |
| $97$ | $40:-1702161891783\quad 41:-2456451549778\quad 42:-377470315488\quad 43:-995607872584\quad 44:785064750591$ |
| $97$ | $45:363333899264\quad 46:-179173550491\quad 47:-80926790578\quad 48:586826484368\quad 49:-1945777057090$ |
| $97$ | $50:-278632677966\quad 51:641540356432\quad 52:-192052644719\quad 53:-122160498319\quad 54:189414665822$ |
| $97$ | $55:-811958345812\quad 56:-525383863503\quad 57:-2040806028583\quad 58:573170576108\quad 59:2467068561860$ |
| $97$ | $60:-868953984160\quad 61:1102041273109\quad 62:201961462954\quad 63:366654974153\quad 64:1486181339040$ |
| $97$ | $65:68419237931\quad 66:-167462164845\quad 67:-105250060690\quad 68:81433520384\quad 69:-1185451858077$ |
| $97$ | $70:-419258573400\quad 71:729288697988\quad 72:877892858900\quad 73:394360711555\quad 74:197408491140$ |
| $97$ | $75:560036005026\quad 76:1026257108989\quad 77:-62337692328\quad 78:-128046343403\quad 79:2685200047592$ |
| $97$ | $80:-804975536065\quad 81:-1580684155501\quad 82:-711421229734\quad 83:474046386481\quad 84:599921978366$ |
| $97$ | $85:-172723403684\quad 86:-1147997964516\quad 87:159436368129\quad 88:966545258741\quad 89:-851839979082$ |
| $97$ | $90:41823132045\quad 91:-639245466541\quad 92:360879114708\quad 93:429886906421\quad 94:841710744862$ |
| $97$ | $95:-374011553600\quad 96:90230079428\quad 97:1322088554498$ |

**Seed block 1: free3; dimension $32$.**

**Symmetric seed $S^{(1)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-01-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:478103866529\quad 1:-648147308345\quad 2:-178256833217\quad 3:-117820349611\quad 4:1312989178$ |
| $0$ | $5:-136957835626\quad 6:-153125195307\quad 7:193317048179\quad 8:-62856166048\quad 9:-59438657487$ |
| $0$ | $10:196686893185\quad 11:183177390515\quad 12:930093415\quad 13:-34856113941\quad 14:115420312804$ |
| $0$ | $15:-8480753770\quad 16:-349759826701\quad 17:319206981611\quad 18:186763768713\quad 19:-10472751229$ |
| $0$ | $20:2492446373\quad 21:-23712513669\quad 22:33838434771\quad 23:3020167255\quad 24:-71878592240$ |
| $0$ | $25:30390443007\quad 26:-1978317107\quad 27:-59450150550\quad 28:-804381581\quad 29:42121126139$ |
| $0$ | $30:-14738809578\quad 31:-3329624553$ |
| $1$ | $1:2146858179764\quad 2:-335839867138\quad 3:224933270310\quad 4:71551719792\quad 5:94473379341$ |
| $1$ | $6:-28468628867\quad 7:-36161073585\quad 8:180941257660\quad 9:-366130547116\quad 10:-398845328146$ |
| $1$ | $11:2193728505\quad 12:75432123806\quad 13:-294329455930\quad 14:-259993326785\quad 15:-13703774605$ |
| $1$ | $16:-290168589876\quad 17:-249313921304\quad 18:-214725766617\quad 19:63770429374\quad 20:-5150442595$ |
| $1$ | $21:8663026641\quad 22:47851717407\quad 23:-28825773875\quad 24:-5723599356\quad 25:-33460823617$ |
| $1$ | $26:-56685905301\quad 27:97598993334\quad 28:-10894556148\quad 29:18142394032\quad 30:124088932753$ |
| $1$ | $31:-14739370377$ |
| $2$ | $2:1899385220444\quad 3:66911463949\quad 4:128023400057\quad 5:111672305605\quad 6:412242534572$ |
| $2$ | $7:-689269572832\quad 8:-500701565190\quad 9:263635558160\quad 10:48573521797\quad 11:-58602702106$ |
| $2$ | $12:-12980738576\quad 13:220748751109\quad 14:57751988254\quad 15:64298900391\quad 16:-52636244021$ |
| $2$ | $17:-28503547821\quad 18:-88775182108\quad 19:-9025533405\quad 20:-47860929722\quad 21:-66040282226$ |
| $2$ | $22:-44949860051\quad 23:-15139968984\quad 24:-22686850868\quad 25:15319623823\quad 26:-214010866543$ |
| $2$ | $27:-25279495378\quad 28:-21349049347\quad 29:-56886035395\quad 30:18142435394\quad 31:42123477913$ |
| $3$ | $3:1145669320946\quad 4:-109222224527\quad 5:57275471886\quad 6:243626124498\quad 7:-338346741159$ |
| $3$ | $8:-89310097756\quad 9:29468796926\quad 10:-132842284646\quad 11:96019897992\quad 12:-92934884172$ |
| $3$ | $13:21499046151\quad 14:-94494069109\quad 15:91631576446\quad 16:-17137059199\quad 17:-33659702645$ |
| $3$ | $18:-9088560842\quad 19:5043693699\quad 20:-219883863282\quad 21:-38799594126\quad 22:-31413076902$ |
| $3$ | $23:-3005799877\quad 24:-23002637706\quad 25:-38954406977\quad 26:-15065475162\quad 27:-1829829089$ |
| $3$ | $28:-4612941771\quad 29:-21350655535\quad 30:-10898276351\quad 31:-804381581$ |
| $4$ | $4:1224717051132\quad 5:-511662454900\quad 6:-168655547223\quad 7:-76569361063\quad 8:8435748205$ |
| $4$ | $9:111372183533\quad 10:-429638702997\quad 11:-768342710540\quad 12:-380217115990\quad 13:153594802679$ |
| $4$ | $14:-674871725803\quad 15:-130813979349\quad 16:3315215156\quad 17:33215031309\quad 18:50582509374$ |
| $4$ | $19:-1077444677\quad 20:475714007474\quad 21:195212800433\quad 22:131813645468\quad 23:12258078997$ |
| $4$ | $24:-11538215138\quad 25:60036547967\quad 26:31932857771\quad 27:-45139733517\quad 28:91629253788$ |
| $4$ | $29:64306225640\quad 30:-13703093593\quad 31:-8479329996$ |
| $5$ | $5:2600578969474\quad 6:14786244102\quad 7:993704996196\quad 8:216605684920\quad 9:105123650584$ |
| $5$ | $10:-33864602265\quad 11:-590609281761\quad 12:-551568842012\quad 13:-96584058423\quad 14:-609480162810$ |
| $5$ | $15:-674871760214\quad 16:-47318251184\quad 17:-34851635876\quad 18:-102304904881\quad 19:-170797478072$ |
| $5$ | $20:125298004183\quad 21:381820413223\quad 22:-58950796494\quad 23:-310805644122\quad 24:-28810597676$ |
| $5$ | $25:-25181795174\quad 26:-73630581962\quad 27:121356569162\quad 28:-94486955041\quad 29:57751502642$ |
| $5$ | $30:-259970841940\quad 31:115414138608$ |
| $6$ | $6:1494405785364\quad 7:-868077825119\quad 8:-115336587440\quad 9:171663245265\quad 10:226604494689$ |
| $6$ | $11:-109426868700\quad 12:-515097785144\quad 13:608212113758\quad 14:-96581566926\quad 15:153582825257$ |
| $6$ | $16:-67620581546\quad 17:-73671206192\quad 18:-53056290050\quad 19:-53987623007\quad 20:-184212321686$ |
| $6$ | $21:182942186336\quad 22:49792668714\quad 23:-50036243754\quad 24:-1844832021\quad 25:16921503705$ |
| $6$ | $26:-16121160103\quad 27:-11120236613\quad 28:21497711722\quad 29:220751448431\quad 30:-294328527424$ |
| $6$ | $31:-34860360838$ |
| $7$ | $7:2776862735385\quad 8:226059333950\quad 9:-273085343613\quad 10:-35298221309\quad 11:241001164072$ |
| $7$ | $12:-1450560780252\quad 13:-515095958587\quad 14:-551573060413\quad 15:-380228055611\quad 16:177871975032$ |
| $7$ | $17:44029914281\quad 18:-110688465103\quad 19:-5589078933\quad 20:-165111917572\quad 21:76846014534$ |
| $7$ | $22:-102095782742\quad 23:3216238518\quad 24:215946543476\quad 25:181931785700\quad 26:-53861423069$ |
| $7$ | $27:2091673467\quad 28:-92912184538\quad 29:-12965753449\quad 30:75430887396\quad 31:930093415$ |
| $8$ | $8:864250180815\quad 9:-384353684779\quad 10:-225551779148\quad 11:-680548411229\quad 12:3216238518$ |
| $8$ | $13:-50042014257\quad 14:-310826390369\quad 15:12280914032\quad 16:-160477434185\quad 17:85588913152$ |
| $8$ | $18:177261721992\quad 19:98023982160\quad 20:15770996425\quad 21:51101220492\quad 22:-3804925516$ |
| $8$ | $23:925335595\quad 24:-243763415849\quad 25:2616963739\quad 26:202499613040\quad 27:-85956158069$ |
| $8$ | $28:-3005799877\quad 29:-15145826522\quad 30:-28821505222\quad 31:3022986946$ |
| $9$ | $9:1589534549777\quad 10:-244956488466\quad 11:-412726086212\quad 12:-102101070006\quad 13:49779095238$ |
| $9$ | $14:-58957568255\quad 15:131810081918\quad 16:-24251128048\quad 17:-57573776458\quad 18:-79484378380$ |
| $9$ | $19:-38823083886\quad 20:20114632257\quad 21:15392506700\quad 22:-43715578632\quad 23:-3801256124$ |
| $9$ | $24:252211449855\quad 25:13778729568\quad 26:-160742183372\quad 27:31959723014\quad 28:-31414683435$ |
| $9$ | $29:-44949384780\quad 30:47850405561\quad 31:33839976967$ |
| $10$ | $10:1123440572370\quad 11:-455825496464\quad 12:76855793296\quad 13:182926400408\quad 14:381851459283$ |
| $10$ | $15:195239991831\quad 16:248016892976\quad 17:-35056295078\quad 18:69661771353\quad 19:69277993803$ |
| $10$ | $20:-449096357551\quad 21:-106170176258\quad 22:15387355034\quad 23:51105373385\quad 24:-366321409402$ |
| $10$ | $25:-31847833051\quad 26:-1775723943\quad 27:43905798835\quad 28:-38787555038\quad 29:-66036613645$ |
| $10$ | $30:8660470580\quad 31:-23710857995$ |
| $11$ | $11:5489199818981\quad 12:-165130022339\quad 13:-184231213573\quad 14:125280265416\quad 15:475736271670$ |
| $11$ | $16:272848148577\quad 17:121950913457\quad 18:34208201219\quad 19:-21675801403\quad 20:-656356998115$ |
| $11$ | $21:-449080736169\quad 22:20112350467\quad 23:15770996425\quad 24:-315702733288\quad 25:-101070508797$ |
| $11$ | $26:-23327683131\quad 27:6270699809\quad 28:-219884921222\quad 29:-47863474421\quad 30:-5166616183$ |
| $11$ | $31:2492446373$ |
| $12$ | $12:2776866249059\quad 13:-868050033246\quad 14:993749498649\quad 15:-76593945122\quad 16:2091673467$ |
| $12$ | $17:-53871950055\quad 18:181902474670\quad 19:215927972328\quad 20:241011760221\quad 21:-35267693746$ |
| $12$ | $22:-273114951143\quad 23:226059230135\quad 24:-5589078933\quad 25:-110695540024\quad 26:44022993810$ |
| $12$ | $27:177875905330\quad 28:-338333501168\quad 29:-689258561453\quad 30:-36183109622\quad 31:193320194405$ |
| $13$ | $13:1494387108251\quad 14:14794682521\quad 15:-168671183096\quad 16:-11114490350\quad 17:-16115384778$ |
| $13$ | $18:16931202702\quad 19:-1846388538\quad 20:-109414189622\quad 21:226606541112\quad 22:171669007509$ |
| $13$ | $23:-115329471546\quad 24:-53981495806\quad 25:-53054108624\quad 26:-73671689152\quad 27:-67625339614$ |
| $13$ | $28:243625983175\quad 29:412243563946\quad 30:-28472889449\quad 31:-153118448665$ |
| $14$ | $14:2600598909745\quad 15:-511741518796\quad 16:121361578832\quad 17:-73646425489\quad 18:-25186495639$ |
| $14$ | $19:-28821715664\quad 20:-590599046684\quad 21:-33805280389\quad 22:105114388840\quad 23:216617397757$ |
| $14$ | $24:-170805189106\quad 25:-102316815125\quad 26:-34863126019\quad 27:-47329756692\quad 28:57282182398$ |
| $14$ | $29:111671575913\quad 30:94462445362\quad 31:-136962115700$ |
| $15$ | $15:1224724314318\quad 16:-45144772083\quad 17:31923845991\quad 18:60032946848\quad 19:-11538215138$ |
| $15$ | $20:-768325192761\quad 21:-429617016540\quad 22:111375519062\quad 23:8435748205\quad 24:-1085240845$ |
| $15$ | $25:50572006070\quad 26:33204224028\quad 27:3315215156\quad 28:-109255081050\quad 29:127992967329$ |
| $15$ | $30:71561586535\quad 31:1312989178$ |
| $16$ | $16:1892826059883\quad 17:-723754968130\quad 18:-214208411856\quad 19:63952995938\quad 20:6270699809$ |
| $16$ | $21:43909972311\quad 22:31965150907\quad 23:-85964254926\quad 24:-82592415328\quad 25:-177084908437$ |
| $16$ | $26:179732183540\quad 27:145995168464\quad 28:-1829829089\quad 29:-25279265634\quad 30:97595673286$ |
| $16$ | $31:-59444369922$ |
| $17$ | $17:1083064520868\quad 18:-711362206892\quad 19:-97969742346\quad 20:-23314583749\quad 21:-1784603901$ |
| $17$ | $22:-160741006772\quad 23:202506253629\quad 24:-140705642038\quad 25:-323663163787\quad 26:386289065268$ |
| $17$ | $27:179736584168\quad 28:-15068219481\quad 29:-214005362556\quad 30:-56683968467\quad 31:-1990210528$ |
| $18$ | $18:2104821168176\quad 19:-137923405147\quad 20:-101059641869\quad 21:-31849549968\quad 22:13762925376$ |
| $18$ | $23:2602560019\quad 24:-142074314414\quad 25:-261650143748\quad 26:-323679670714\quad 27:-177084738299$ |
| $18$ | $28:-38949962123\quad 29:15314306996\quad 30:-33468941111\quad 31:30399378952$ |
| $19$ | $19:1705942037337\quad 20:-315696427759\quad 21:-366317319141\quad 22:252203811163\quad 23:-243778328627$ |
| $19$ | $24:-169561976985\quad 25:-142074023996\quad 26:-140699081889\quad 27:-82585844771\quad 28:-23004675905$ |
| $19$ | $29:-22688445663\quad 30:-5738010435\quad 31:-71879072828$ |
| $20$ | $20:5489201335369\quad 21:-455814876351\quad 22:-412701364645\quad 23:-680529807312\quad 24:-21675801403$ |
| $20$ | $25:34214704913\quad 26:121968993825\quad 27:272841241106\quad 28:96027272683\quad 29:-58589909011$ |
| $20$ | $30:2221624115\quad 31:183167519142$ |
| $21$ | $21:1123368750575\quad 22:-244934761194\quad 23:-225539887586\quad 24:69282844735\quad 25:69661202618$ |
| $21$ | $26:-35044466510\quad 27:247999770749\quad 28:-132826114889\quad 29:48602764008\quad 30:-398810175749$ |
| $21$ | $31:196673759800$ |
| $22$ | $22:1589520506344\quad 23:-384381445120\quad 24:-38822078602\quad 25:-79486919299\quad 26:-57567443141$ |
| $22$ | $27:-24240273584\quad 28:29464890219\quad 29:263646827784\quad 30:-366131823170\quad 31:-59439525014$ |
| $23$ | $23:864212514692\quad 24:98036957895\quad 25:177278149207\quad 26:85566643413\quad 27:-160466166250$ |
| $23$ | $28:-89293727480\quad 29:-500695882202\quad 30:180917662489\quad 31:-62842935415$ |
| $24$ | $24:1705952962779\quad 25:-137905207255\quad 26:-97976835394\quad 27:63947268076\quad 28:5043693699$ |
| $24$ | $29:-9025415071\quad 30:63766731234\quad 31:-10475049160$ |
| $25$ | $25:2104829064674\quad 26:-711385263818\quad 27:-214212364546\quad 28:-9090514034\quad 29:-88775455519$ |
| $25$ | $30:-214718956233\quad 31:186765531517$ |
| $26$ | $26:1083081901285\quad 27:-723750316351\quad 28:-33659073572\quad 29:-28505490060\quad 30:-249298988421$ |
| $26$ | $31:319203040321$ |
| $27$ | $27:1892806201567\quad 28:-17136610739\quad 29:-52628229561\quad 30:-290151633108\quad 31:-349760874315$ |
| $28$ | $28:1145665908171\quad 29:66914936223\quad 30:224912235306\quad 31:-117813948542$ |
| $29$ | $29:1899396955904\quad 30:-335830593178\quad 31:-178263307396$ |
| $30$ | $30:2146815765943\quad 31:-648148121777$ |
| $31$ | $31:478105137301$ |

**Lower-triangular witness $C^{(1)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-01-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:6914504801710$ |
| $1$ | $0:-9373734301041\quad 1:11261390377298$ |
| $2$ | $0:-2578013007857\quad 1:-5128105299546\quad 2:12529760453117$ |
| $3$ | $0:-1703959328828\quad 1:579046174967\quad 2:420417202592\quad 3:10542836411677$ |
| $4$ | $0:18988911221\quad 1:651177940020\quad 2:1292171767495\quad 3:-1120208926163\quad 4:10914335797927$ |
| $5$ | $0:-1980732381473\quad 1:-809804191646\quad 2:152286674302\quad 3:261537763051\quad 4:-4627410357606$ |
| $5$ | $5:15296217947624$ |
| $6$ | $0:-2214550422601\quad 1:-2096141715503\quad 2:1976564381576\quad 3:1989207548485\quad 4:-1446196498585$ |
| $6$ | $5:-792266014816\quad 6:11382425123605$ |
| $7$ | $0:2795819132719\quad 1:2006071860444\quad 2:-4104783299335\quad 3:-2703883246932\quad 4:-617643124736$ |
| $7$ | $5:6864898110764\quad 6:-5128410066626\quad 7:12956705026616$ |
| $8$ | $0:-909047977418\quad 1:850068351958\quad 2:-3835225277347\quad 3:-887789996623\quad 4:391095758750$ |
| $8$ | $5:1515039965963\quad 6:-57320241652\quad 7:-397792442684\quad 8:8171234497840$ |
| $9$ | $0:-859622766800\quad 1:-3966733114657\quad 2:303725841241\quad 3:346334457435\quad 4:1258170171754$ |
| $9$ | $5:737609917070\quad 6:708328101565\quad 7:-1189992052561\quad 8:-4456465553902\quad 9:10879447115637$ |
| $10$ | $0:2844555016237\quad 1:-1173960713976\quad 2:492464151842\quad 3:-755440475165\quad 4:-4007209254846$ |
| $10$ | $5:-1119443870862\quad 6:1787519197570\quad 7:403511245357\quad 8:-1741129337833\quad 9:-2690663037343$ |
| $10$ | $10:8433328716215$ |
| $11$ | $0:2649175837866\quad 1:2224595936386\quad 2:987832274732\quad 3:1177352255856\quad 4:-7173203549691$ |
| $11$ | $5:-5600328470698\quad 6:-1714767169956\quad 7:3449197635072\quad 8:-6136155572416\quad 9:-3653603684482$ |
| $11$ | $10:-12327112160664\quad 11:15296280692667$ |
| $12$ | $0:13451338039\quad 1:681026178156\quad 2:177894687493\quad 3:-923821929349\quad 4:-3640183062791$ |
| $12$ | $5:-4655323333410\quad 6:-5053324142648\quad 7:-11147362872945\quad 8:412386389339\quad 9:-649432658318$ |
| $12$ | $10:43230895924\quad 11:-2540488978065\quad 12:9196032480604$ |
| $13$ | $0:-504101377330\quad 1:-3033218529902\quad 2:416658499141\quad 3:272425696967\quad 4:1567754306182$ |
| $13$ | $5:-391813681922\quad 6:4738726018536\quad 7:-1050287183290\quad 8:-148065108935\quad 9:-1347315299879$ |
| $13$ | $10:1195291945981\quad 11:1218013359209\quad 12:-7199294360294\quad 13:7548976651160$ |
| $14$ | $0:1669249152527\quad 1:-919267896204\quad 2:428136060846\quad 3:-593082469187\quad 4:-6242969402557$ |
| $14$ | $5:-5699773300573\quad 6:-1853665397750\quad 7:-2474413648159\quad 8:-2163917553212\quad 9:-666208474838$ |
| $14$ | $10:-112285125613\quad 11:-5100368725004\quad 12:70836440801\quad 13:2502809847204\quad 14:11723936608672$ |
| $15$ | $0:-122651643367\quad 1:-223780660520\quad 2:396346102106\quad 3:845798274805\quad 4:-1145101688433$ |
| $15$ | $5:-4804570430659\quad 6:587675860416\quad 7:152225898800\quad 8:1395014736384\quad 9:2090265525141$ |
| $15$ | $10:2019134902155\quad 11:3494812317640\quad 12:-2075853363603\quad 13:-5207004678524\quad 14:-4117130454600$ |
| $15$ | $15:5078623993576$ |
| $16$ | $0:-5058349610433\quad 1:-6787126782467\quad 2:-4238645783906\quad 3:-438294624044\quad 4:900950671705$ |
| $16$ | $5:-1001431688753\quad 6:-1970708446112\quad 7:1874370348930\quad 8:-3637673027848\quad 9:-4157984910075$ |
| $16$ | $10:2456100619811\quad 11:2893555217396\quad 12:2266901802766\quad 13:-1210904476175\quad 14:2052156503545$ |
| $16$ | $15:-387144929597\quad 16:5862413743174$ |
| $17$ | $0:4616483620520\quad 1:1628777452777\quad 2:1388976460855\quad 3:282015484157\quad 4:63616998223$ |
| $17$ | $5:456776145075\quad 6:300284484846\quad 7:-529746505849\quad 8:1962726829061\quad 9:1069834633902$ |
| $17$ | $10:-1002823897166\quad 11:234352015297\quad 12:-875465648262\quad 13:-73797282689\quad 14:-466143111374$ |
| $17$ | $15:-469328409454\quad 16:-2376154632644\quad 17:8296767329156$ |
| $18$ | $0:2701043300553\quad 1:341546242908\quad 2:-12985750965\quad 3:332102301145\quad 4:473996545991$ |
| $18$ | $5:-163136024739\quad 6:115369851016\quad 7:-1270125573256\quad 8:2410822080108\quad 9:394481245834$ |
| $18$ | $10:856504771381\quad 11:1894918040388\quad 12:1050436692327\quad 13:852692188248\quad 14:479491321291$ |
| $18$ | $15:408567182215\quad 16:-457655093868\quad 17:-10766748825214\quad 18:8510574607434$ |
| $19$ | $0:-151460611126\quad 1:440202430210\quad 2:76967445043\quad 3:-3885986761\quad 4:-45383135816$ |
| $19$ | $5:-1127336457074\quad 6:-519628909494\quad 7:334425109996\quad 8:1396509195673\quad 9:513793332993$ |
| $19$ | $10:1304180048263\quad 11:982105942870\quad 12:2083830230625\quad 13:2203255400979\quad 14:-532817017437$ |
| $19$ | $15:-354087230549\quad 16:1070261331670\quad 17:-863830582354\quad 18:-3787613302545\quad 19:11747061922668$ |
| $20$ | $0:36046635938\quad 1:-15730976890\quad 2:-380999652761\quad 3:-2063740316821\quad 4:4192784374963$ |
| $20$ | $5:2130458738090\quad 6:-506449291263\quad 7:-2960433638812\quad 8:-947754661195\quad 9:-1050050326705$ |
| $20$ | $10:-3508862379028\quad 11:-4213221642542\quad 12:114158182263\quad 13:-1073687163781\quad 14:-4443490213648$ |
| $20$ | $15:-11316364969840\quad 16:2944935644025\quad 17:-473559088929\quad 18:308782726810\quad 19:-2066744680741$ |
| $20$ | $20:17862726552696$ |
| $21$ | $0:-342938711434\quad 1:-208527865543\quad 2:-682972477087\quad 3:-384757216141\quad 4:1842997180894$ |
| $21$ | $5:3011649371273\quad 6:2131735890179\quad 7:-261332676577\quad 8:-397812810210\quad 9:-677980079856$ |
| $21$ | $10:-629160188929\quad 11:-1336182528527\quad 12:2319536163342\quad 13:3744254583504\quad 14:964451742718$ |
| $21$ | $15:1793227103109\quad 16:573161546813\quad 17:804946462724\quad 18:396368711674\quad 19:-3335408682418$ |
| $21$ | $20:-2764373700310\quad 21:6945292507421$ |
| $22$ | $0:489383343296\quad 1:832270337685\quad 2:82573051014\quad 3:-267864960949\quad 4:1119935518448$ |
| $22$ | $5:64598781367\quad 6:865197154635\quad 7:-690560490196\quad 8:-162179419680\quad 9:-385668248168$ |
| $22$ | $10:338280953192\quad 11:857966191142\quad 12:-2730948203446\quad 13:-1090605420801\quad 14:2068371000109$ |
| $22$ | $15:1434635186501\quad 16:1583373015457\quad 17:-2007635438121\quad 18:-2547387844706\quad 19:1829574296313$ |
| $22$ | $20:-1146059991198\quad 21:-2439915487436\quad 22:10761374304443$ |
| $23$ | $0:43678720915\quad 1:-219612728107\quad 2:-201726903880\quad 3:-1344785444\quad 4:149083265500$ |
| $23$ | $5:-1990750294545\quad 6:-555895058644\quad 7:827054713877\quad 8:342537707916\quad 9:278809123540$ |
| $23$ | $10:616862846214\quad 11:-66022863897\quad 12:2209694069696\quad 13:804637674643\quad 14:900853904369$ |
| $23$ | $15:413093107710\quad 16:-3435033997022\quad 17:1964761383684\quad 18:1829407940155\quad 19:-1861887527959$ |
| $23$ | $20:-2459204821842\quad 21:-5481417171342\quad 22:-2929175639622\quad 23:2667009805204$ |
| $24$ | $0:-1039533477846\quad 1:-916109841531\quad 2:-769888912418\quad 3:-305178034612\quad 4:10576380915$ |
| $24$ | $5:-355379763804\quad 6:-223532407548\quad 7:1825557005697\quad 8:-3245353541333\quad 9:841022059622$ |
| $24$ | $10:-4586823746212\quad 11:-7036774798013\quad 12:189715122798\quad 13:1403589520822\quad 14:-5142423804279$ |
| $24$ | $15:4220361432537\quad 16:1605967958049\quad 17:91658691293\quad 18:2010235136049\quad 19:38716649991$ |
| $24$ | $20:-1334114919832\quad 21:-2724293592118\quad 22:684739012994\quad 23:-1029417768705\quad 24:4366165549101$ |
| $25$ | $0:439517273883\quad 1:68715829793\quad 2:240820696753\quad 3:-311828412428\quad 4:484689863978$ |
| $25$ | $5:45486601185\quad 6:324255130616\quad 7:1437240852919\quad 8:193535597651\quad 9:345868680922$ |
| $25$ | $10:-309166554258\quad 11:-871108416668\quad 12:666382969727\quad 13:140787408231\quad 14:-680292521301$ |
| $25$ | $15:1506354780645\quad 16:-1794423666698\quad 17:-4613529332866\quad 18:-8929359066885\quad 19:-4344289249338$ |
| $25$ | $20:666950710029\quad 21:-532736604920\quad 22:-2571871091268\quad 23:6558281866218\quad 24:-855992998898$ |
| $25$ | $25:5414502518051$ |
| $26$ | $0:-28611117697\quad 1:-527180334448\quad 2:-1929668395917\quad 3:-41618036632\quad 4:548266015613$ |
| $26$ | $5:-327194782078\quad 6:144965096332\quad 7:-691052086546\quad 8:1621435960056\quad 9:-1078834100955$ |
| $26$ | $10:234140950002\quad 11:947785529954\quad 12:-43855357563\quad 13:-1792197183919\quad 14:779077141579$ |
| $26$ | $15:-1365069609883\quad 16:120988056473\quad 17:4801914310704\quad 18:1727885303671\quad 19:-182401284643$ |
| $26$ | $20:6453030614\quad 21:-121932219325\quad 22:443245956303\quad 23:-1063877571463\quad 24:2231733512724$ |
| $26$ | $25:-3537137561887\quad 26:6931123854972$ |
| $27$ | $0:-859788983519\quad 1:150999635920\quad 2:-316857988067\quad 3:-151975381037\quad 4:-399179926242$ |
| $27$ | $5:575028182046\quad 6:-166279997341\quad 7:-343320618067\quad 8:-1433918449463\quad 9:-312346824588$ |
| $27$ | $10:379164230915\quad 11:-62049140016\quad 12:1564067075853\quad 13:657489756209\quad 14:-752900333712$ |
| $27$ | $15:1702164865303\quad 16:563753083925\quad 17:3442219029643\quad 18:2658953253084\quad 19:161008103504$ |
| $27$ | $20:2325455207531\quad 21:2491685333225\quad 22:2145675868412\quad 23:-766179311765\quad 24:-1867992748038$ |
| $27$ | $25:4798738673191\quad 26:-9828987940902\quad 27:4463104643718$ |
| $28$ | $0:-11633249298\quad 1:-106425810901\quad 2:-216337604996\quad 3:-31162320889\quad 4:868315363626$ |
| $28$ | $5:-359485918603\quad 6:295320621705\quad 7:-424398483667\quad 8:-125428854858\quad 9:-514515450323$ |
| $28$ | $10:-328449998102\quad 11:-1437162916787\quad 12:-4286805511252\quad 13:-1145251196598\quad 14:322586565747$ |
| $28$ | $15:-3599044202143\quad 16:1191590763253\quad 17:-351439063852\quad 18:258945961880\quad 19:827922094884$ |
| $28$ | $20:-2489709517656\quad 21:-216231480579\quad 22:-1171829323939\quad 23:-873847252938\quad 24:493733122999$ |
| $28$ | $25:3301112406223\quad 26:45116159540\quad 27:1257323859925\quad 28:7399691542736$ |
| $29$ | $0:609170538555\quad 1:668162804373\quad 2:-55208138386\quad 3:-138553833093\quad 4:540581806038$ |
| $29$ | $5:658265560916\quad 6:2329274392238\quad 7:217578114295\quad 8:-349053279502\quad 9:-493435855493$ |
| $29$ | $10:-1294065934374\quad 11:-1095543225896\quad 12:-5783231903160\quad 13:-960460705172\quad 14:1593776865068$ |
| $29$ | $15:2571131501631\quad 16:3726614278569\quad 17:-2442130572510\quad 18:-1847900340082\quad 19:491329151749$ |
| $29$ | $20:404960005391\quad 21:1247203975128\quad 22:-1173939784747\quad 23:-3483525898806\quad 24:-3406247838054$ |
| $29$ | $25:-2241656813977\quad 26:1443023249127\quad 27:6096035037082\quad 28:-2775942491424\quad 29:5815884534676$ |
| $30$ | $0:-213157847173\quad 1:924469173248\quad 2:479298477072\quad 3:-207710289278\quad 4:-258400564937$ |
| $30$ | $5:-1757627020092\quad 6:-2659141121957\quad 7:459950651963\quad 8:71777174744\quad 9:1155168914190$ |
| $30$ | $10:825594636092\quad 11:-342724607161\quad 12:-2407687323056\quad 13:-507261372101\quad 14:-374370786554$ |
| $30$ | $15:-2380537649055\quad 16:3067874054053\quad 17:-187013719334\quad 18:62615089228\quad 19:-351469939099$ |
| $30$ | $20:-1744758012639\quad 21:-3253498717735\quad 22:-4756608597984\quad 23:-2500472418629\quad 24:-80537562450$ |
| $30$ | $25:-1747859853277\quad 26:-4697530632292\quad 27:-8799187047387\quad 28:692221509964\quad 29:675366795156$ |
| $30$ | $30:5787858875821$ |
| $31$ | $0:-48154201183\quad 1:-170966608967\quad 2:256307442811\quad 3:-16243205235\quad 4:-99417680058$ |
| $31$ | $5:706890646873\quad 6:-352216272778\quad 7:-396834574776\quad 8:19862492262\quad 9:189499403808$ |
| $31$ | $10:-100338776221\quad 11:268751387947\quad 12:1839473284890\quad 13:-129581895611\quad 14:-886734820048$ |
| $31$ | $15:370501032201\quad 16:-1271936240075\quad 17:-305777354138\quad 18:-356271743815\quad 19:-919124725685$ |
| $31$ | $20:1044096656004\quad 21:2341741885083\quad 22:877353843508\quad 23:1926318400192\quad 24:1570875644635$ |
| $31$ | $25:-413763418798\quad 26:4676223944720\quad 27:1249407351500\quad 28:706479469660\quad 29:-985728762964$ |
| $31$ | $30:-854821531599\quad 31:688071529615$ |

**Seed block 2: free0; dimension $24$.**

**Symmetric seed $S^{(2)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-02-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:642623445364\quad 1:-456623966914\quad 2:-202610709568\quad 3:-250341409956\quad 4:776823951093$ |
| $0$ | $5:76717402172\quad 6:395422557516\quad 7:97356022477\quad 8:230839049715\quad 9:-66782569674$ |
| $0$ | $10:-270037591202\quad 11:36831013514\quad 12:-462829923646\quad 13:-529578821045\quad 14:147581532584$ |
| $0$ | $15:215031021529\quad 16:-403642124039\quad 17:762011250552\quad 18:38090761159\quad 19:-72144754266$ |
| $0$ | $20:-300579548929\quad 21:-94453424332\quad 22:-183868396612\quad 23:196732390303$ |
| $1$ | $1:3173679580246\quad 2:-456623966914\quad 3:80412790117\quad 4:-546950728917\quad 5:341888171215$ |
| $1$ | $6:-1106058194854\quad 7:592008763675\quad 8:-1106058194854\quad 9:239852619070\quad 10:-18074188327$ |
| $1$ | $11:239860658071\quad 12:341888171215\quad 13:-546950728917\quad 14:80412790117\quad 15:-926161830100$ |
| $1$ | $16:482069857035\quad 17:-926161830100\quad 18:239860658071\quad 19:-18074188327\quad 20:239852619070$ |
| $1$ | $21:-183899277397\quad 22:458541570416\quad 23:-183899277397$ |
| $2$ | $2:642623445364\quad 3:147581532584\quad 4:-529578821045\quad 5:-462829923646\quad 6:230839049715$ |
| $2$ | $7:97356022477\quad 8:395422557516\quad 9:-300579548929\quad 10:-72144754266\quad 11:38090761159$ |
| $2$ | $12:76717402172\quad 13:776823951093\quad 14:-250341409956\quad 15:762011250552\quad 16:-403642124039$ |
| $2$ | $17:215031021529\quad 18:36831013514\quad 19:-270037591202\quad 20:-66782569674\quad 21:196732390303$ |
| $2$ | $22:-183868396612\quad 23:-94453424332$ |
| $3$ | $3:705890129690\quad 4:-1018404391907\quad 5:-46592785130\quad 6:-173874169340\quad 7:60761469456$ |
| $3$ | $8:-377347589355\quad 9:77649708877\quad 10:-101720194545\quad 11:284290128851\quad 12:117433486397$ |
| $3$ | $13:232966167456\quad 14:57642217042\quad 15:-798910250323\quad 16:810178819278\quad 17:-326721207519$ |
| $3$ | $18:54532747235\quad 19:-165241575229\quad 20:184365375406\quad 21:38081455796\quad 22:239869019572$ |
| $3$ | $23:36852508334$ |
| $4$ | $4:4257009776499\quad 5:-601547969164\quad 6:385435052772\quad 7:326577700955\quad 8:34419969130$ |
| $4$ | $9:-21081533522\quad 10:-259118051826\quad 11:-101695696668\quad 12:-186417881017\quad 13:-136931776679$ |
| $4$ | $14:232966167456\quad 15:-783738298986\quad 16:-930795333594\quad 17:-142043908977\quad 18:-165252842728$ |
| $4$ | $19:456171447003\quad 20:126534236240\quad 21:-72158382079\quad 22:-18074928387\quad 23:-270120306898$ |
| $5$ | $5:2568805123421\quad 6:-1190362806060\quad 7:537590324065\quad 8:-238731481157\quad 9:-445365585328$ |
| $5$ | $10:-21080312459\quad 11:77654909236\quad 12:-58504364526\quad 13:-186417881017\quad 14:117433486397$ |
| $5$ | $15:-695076931147\quad 16:189902408908\quad 17:-463145113980\quad 18:184355852038\quad 19:126547572910$ |
| $5$ | $20:421043441725\quad 21:-300658070624\quad 22:239851894958\quad 23:-66781426938$ |
| $6$ | $6:4505389161634\quad 7:-1728793140797\quad 8:1232376774673\quad 9:-463154920238\quad 10:-142023696036$ |
| $6$ | $11:-326749315418\quad 12:-238731481157\quad 13:34419969130\quad 14:-377347589355\quad 15:1214363882036$ |
| $6$ | $16:-546847112081\quad 17:1241099157141\quad 18:-798916880326\quad 19:-783764748052\quad 20:-695024188305$ |
| $6$ | $21:215042668063\quad 22:-926111359045\quad 23:762122558763$ |
| $7$ | $7:2463708506910\quad 8:-1728793140797\quad 9:189910061831\quad 10:-930791183497\quad 11:810220846596$ |
| $7$ | $12:537590324065\quad 13:326577700955\quad 14:60761469456\quad 15:-546915218989\quad 16:-740230366171$ |
| $7$ | $17:-546915218989\quad 18:810220846596\quad 19:-930791183497\quad 20:189910061831\quad 21:-403672538970$ |
| $7$ | $22:482067955406\quad 23:-403672538970$ |
| $8$ | $8:4505389161634\quad 9:-695024188305\quad 10:-783764748052\quad 11:-798916880326\quad 12:-1190362806060$ |
| $8$ | $13:385435052772\quad 14:-173874169340\quad 15:1241099157141\quad 16:-546847112081\quad 17:1214363882036$ |
| $8$ | $18:-326749315418\quad 19:-142023696036\quad 20:-463154920238\quad 21:762122558763\quad 22:-926111359045$ |
| $8$ | $23:215042668063$ |
| $9$ | $9:2568786751464\quad 10:-601521621526\quad 11:-46604785296\quad 12:421043441725\quad 13:126534236240$ |
| $9$ | $14:184365375406\quad 15:-238761016718\quad 16:537588564521\quad 17:-1190379657571\quad 18:117433831133$ |
| $9$ | $19:-186449136224\quad 20:-58530168636\quad 21:-462815962922\quad 22:341873287400\quad 23:76701120518$ |
| $10$ | $10:4257117468271\quad 11:-1018420268268\quad 12:126547572910\quad 13:456171447003\quad 14:-165241575229$ |
| $10$ | $15:34410726681\quad 16:326616198080\quad 17:385451159435\quad 18:232944732229\quad 19:-136907985067$ |
| $10$ | $20:-186449136224\quad 21:-529690596764\quad 22:-546930362545\quad 23:776822480922$ |
| $11$ | $11:705897090866\quad 12:184355852038\quad 13:-165252842728\quad 14:54532747235\quad 15:-377336258140$ |
| $11$ | $16:60708393703\quad 17:-173859462538\quad 18:57671745563\quad 19:232944732229\quad 20:117433831133$ |
| $11$ | $21:147580470432\quad 22:80413834784\quad 23:-250344732941$ |
| $12$ | $12:2568805123421\quad 13:-601547969164\quad 14:-46592785130\quad 15:-463145113980\quad 16:189902408908$ |
| $12$ | $17:-695076931147\quad 18:77654909236\quad 19:-21080312459\quad 20:-445365585328\quad 21:-66781426938$ |
| $12$ | $22:239851894958\quad 23:-300658070624$ |
| $13$ | $13:4257009776499\quad 14:-1018404391907\quad 15:-142043908977\quad 16:-930795333594\quad 17:-783738298986$ |
| $13$ | $18:-101695696668\quad 19:-259118051826\quad 20:-21081533522\quad 21:-270120306898\quad 22:-18074928387$ |
| $13$ | $23:-72158382079$ |
| $14$ | $14:705890129690\quad 15:-326721207519\quad 16:810178819278\quad 17:-798910250323\quad 18:284290128851$ |
| $14$ | $19:-101720194545\quad 20:77649708877\quad 21:36852508334\quad 22:239869019571\quad 23:38081455796$ |
| $15$ | $15:4505470797595\quad 16:-1728750339403\quad 17:1232401648984\quad 18:-173859462538\quad 19:385451159435$ |
| $15$ | $20:-1190379657571\quad 21:395537816044\quad 22:-1106089334023\quad 23:230853011726$ |
| $16$ | $16:2463706374889\quad 17:-1728750339403\quad 18:60708393703\quad 19:326616198080\quad 20:537588564521$ |
| $16$ | $21:97373871399\quad 22:592010096284\quad 23:97373871399$ |
| $17$ | $17:4505470797595\quad 18:-377336258140\quad 19:34410726681\quad 20:-238761016718\quad 21:230853011726$ |
| $17$ | $22:-1106089334023\quad 23:395537816044$ |
| $18$ | $18:705897090866\quad 19:-1018420268268\quad 20:-46604785296\quad 21:-250344732941\quad 22:80413834784$ |
| $18$ | $23:147580470432$ |
| $19$ | $19:4257117468271\quad 20:-601521621526\quad 21:776822480922\quad 22:-546930362545\quad 23:-529690596764$ |
| $20$ | $20:2568786751464\quad 21:76701120518\quad 22:341873287400\quad 23:-462815962922$ |
| $21$ | $21:642772736741\quad 22:-456623396057\quad 23:-202696539992$ |
| $22$ | $22:3173570681220\quad 23:-456623396057$ |
| $23$ | $23:642772736741$ |

**Lower-triangular witness $C^{(2)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-02-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:8016379141260$ |
| $1$ | $0:-5696137356635\quad 1:16879631726991$ |
| $2$ | $0:-2527459168237\quad 1:-3558084219392\quad 2:6724159529414$ |
| $3$ | $0:-3122873875419\quad 1:-577443849956\quad 2:715423716461\quad 3:7745410849864$ |
| $4$ | $0:9690459213601\quad 1:29805972434\quad 2:-4217566498303\quad 3:-8849601425460\quad 4:15352256085866$ |
| $5$ | $0:957008155668\quad 1:2348396438317\quad 2:-5280719599840\quad 3:447149472651\quad 4:-5719897624489$ |
| $5$ | $5:13771220023036$ |
| $6$ | $0:4932682830348\quad 1:-4888055727837\quad 2:2700552446281\quad 3:-869919969875\quad 4:-353006665645$ |
| $6$ | $5:-7235896527304\quad 6:18487344345017$ |
| $7$ | $0:1214463796695\quad 1:3917065848203\quad 2:3977056161292\quad 3:1198822073279\quad 4:3136666190141$ |
| $7$ | $5:5940289406280\quad 6:-6779222922858\quad 7:11009758716174$ |
| $8$ | $0:2879592464962\quad 1:-5580883919595\quad 2:4009877071690\quad 3:-4497316383073\quad 4:-3073409325573$ |
| $8$ | $5:-574850395463\quad 6:3341107720423\quad 7:-11750181061317\quad 8:14689777590649$ |
| $9$ | $0:-833076486245\quad 1:1139831965769\quad 2:-4180136334182\quad 3:1137723471826\quad 4:-106227849157$ |
| $9$ | $5:-5054493900747\quad 6:-3297797394150\quad 7:3524192917195\quad 8:703376803725\quad 9:13666314136839$ |
| $10$ | $0:-3368573098192\quad 1:-1243822983538\quad 2:-2997256865900\quad 3:-2487353871799\quad 4:-1816340997140$ |
| $10$ | $5:-1529859262917\quad 6:-510986113145\quad 7:-5258320934198\quad 8:-9620740451114\quad 9:-4064893343462$ |
| $10$ | $10:15969166037481$ |
| $11$ | $0:459447000511\quad 1:1576049730260\quad 2:1573137472067\quad 3:3827870317253\quad 4:1683214544483$ |
| $11$ | $5:1441273130010\quad 6:-926727434119\quad 7:3934824406755\quad 8:-420631448874\quad 9:-952484428671$ |
| $11$ | $10:-4166587417221\quad 11:3327246266977$ |
| $12$ | $0:-5773553314920\quad 1:77126351150\quad 2:-988414679916\quad 3:-714624290752\quad 4:1746417663673$ |
| $12$ | $5:332803575029\quad 6:543895648567\quad 7:5584926572792\quad 8:-2169221667819\quad 9:1419015333521$ |
| $12$ | $10:425013782789\quad 11:774261497322\quad 12:13412896018876$ |
| $13$ | $0:-6606209757704\quad 1:-5469606954202\quad 2:6175366202754\quad 3:-633941511205\quad 4:4619643068316$ |
| $13$ | $5:4345507752585\quad 6:1359774603335\quad 7:655795609277\quad 8:1312926303430\quad 9:4655549899754$ |
| $13$ | $10:5274568012415\quad 11:-166333057700\quad 12:-8350983820748\quad 13:12252189616190$ |
| $14$ | $0:1840999907607\quad 1:1097646421358\quad 2:-2450205177022\quad 3:1794636405866\quad 4:714662351599$ |
| $14$ | $5:-163364899140\quad 6:-1850032289918\quad 7:-606651260895\quad 8:169409964892\quad 9:117300294885$ |
| $14$ | $10:-802661546669\quad 11:-1080141901641\quad 12:695221614804\quad 13:-4733270353309\quad 14:5263267169562$ |
| $15$ | $0:2682395851546\quad 1:-4581669140986\quad 2:9916303455076\quad 3:-10490632197367\quad 4:-10112270139907$ |
| $15$ | $5:-4509422077977\quad 6:741296726115\quad 7:-302666517703\quad 8:-2439208592895\quad 9:1341089054058$ |
| $15$ | $10:-2134646120874\quad 11:2875495753937\quad 12:-1210386606545\quad 13:-2068291825532\quad 14:2074878724471$ |
| $15$ | $15:7753594809524$ |
| $16$ | $0:-5035217483197\quad 1:1156760740675\quad 2:-7283388599666\quad 3:9188951688676\quad 4:409056629174$ |
| $16$ | $5:-1389720988797\quad 6:-348450344245\quad 7:-4530388081581\quad 8:-1008104224582\quad 9:1162757991653$ |
| $16$ | $10:-763388989905\quad 11:-250855872310\quad 12:828978257788\quad 13:-4472775654092\quad 14:5352665379296$ |
| $16$ | $15:-1672778803599\quad 16:2072181095793$ |
| $17$ | $0:9505678774964\quad 1:-2279109619331\quad 2:5564866953038\quad 3:-1069585671835\quad 4:-6008632361737$ |
| $17$ | $5:-3962122878062\quad 6:1045673980663\quad 7:-2605493985162\quad 8:-43131128928\quad 9:-6735261482825$ |
| $17$ | $10:1491329669576\quad 11:1203559518967\quad 12:1787741591619\quad 13:1701908707645\quad 14:-12392842796659$ |
| $17$ | $15:-2482394840660\quad 16:-4325420513436\quad 17:5441882858608$ |
| $18$ | $0:475161671966\quad 1:1581352744476\quad 2:1563115698704\quad 3:869159454593\quad 4:-448969430962$ |
| $18$ | $5:1420707878928\quad 6:-3670042543619\quad 7:3186355337937\quad 8:1467837956363\quad 9:-98756564399$ |
| $18$ | $10:3986856421364\quad 11:-849142655955\quad 12:-48307931748\quad 13:-2589151649250\quad 14:2585678595193$ |
| $18$ | $15:-1078163045667\quad 16:1248691343772\quad 17:439506715920\quad 18:1932729699369$ |
| $19$ | $0:-899966842814\quad 1:-410776354480\quad 2:-4571569918633\quad 3:-2104630925260\quad 4:1071141284459$ |
| $19$ | $5:-188260527604\quad 6:-3592421394515\quad 7:-8743874723560\quad 8:-6303206058466\quad 9:-956948630913$ |
| $19$ | $10:-9196353860157\quad 11:8195335443561\quad 12:1560656930746\quad 13:6114462793762\quad 14:431609631674$ |
| $19$ | $15:3699247099886\quad 16:-3469835287875\quad 17:803847733123\quad 18:-426804206663\quad 19:7065196262752$ |
| $20$ | $0:-3749567524594\quad 1:155643813883\quad 2:-2320192124843\quad 3:1094442538196\quad 4:3184133398483$ |
| $20$ | $5:3688740070951\quad 6:-822884879456\quad 7:-601986084396\quad 8:-874170859978\quad 9:-79930603921$ |
| $20$ | $10:-2267384050021\quad 11:-1887334590928\quad 12:-5222199304875\quad 13:-5768424293979\quad 14:-4576341393867$ |
| $20$ | $15:-4476845788402\quad 16:528699857909\quad 17:3295242487811\quad 18:-3590732452989\quad 19:-4821248431444$ |
| $20$ | $20:7290291512537$ |
| $21$ | $0:-1178255452584\quad 1:-1487084140500\quad 2:1695985322929\quad 3:-250916748465\quad 4:597875634746$ |
| $21$ | $5:-940943228966\quad 6:467962751889\quad 7:-2967273068361\quad 8:1922688603251\quad 9:-2358908873045$ |
| $21$ | $10:-3828435683293\quad 11:3307586027300\quad 12:768037763416\quad 13:-1249608925259\quad 14:870027431543$ |
| $21$ | $15:479584417072\quad 16:-1033420632403\quad 17:1288814485818\quad 18:-501094833738\quad 19:730114579516$ |
| $21$ | $20:1078799455994\quad 21:2190468309434$ |
| $22$ | $0:-2293658937200\quad 1:1942528202994\quad 2:-2568691291526\quad 3:2554221900036\quad 4:2092945548342$ |
| $22$ | $5:1371206785278\quad 6:-2811786724607\quad 7:1522754228057\quad 8:-1284579750673\quad 9:719751353870$ |
| $22$ | $10:-3651555740185\quad 11:-8676438524023\quad 12:242635880683\quad 13:1348617404002\quad 14:702010926940$ |
| $22$ | $15:165865561377\quad 16:2629418082784\quad 17:-734960370574\quad 18:-140269748875\quad 19:-4368772022706$ |
| $22$ | $20:-4093573810714\quad 21:-1694155211288\quad 22:11804534274277$ |
| $23$ | $0:2454130310411\quad 1:-261312833826\quad 2:-620508976953\quad 3:1503112467741\quad 4:-2612057999567$ |
| $23$ | $5:-1982587850075\quad 6:2734028585028\quad 7:-286418921475\quad 8:38079479585\quad 9:395786067468$ |
| $23$ | $10:5109331740392\quad 11:621697036846\quad 12:-985135309875\quad 13:-608962234605\quad 14:818571041816$ |
| $23$ | $15:553287465103\quad 16:147222250801\quad 17:512169665358\quad 18:1472997494172\quad 19:750257621691$ |
| $23$ | $20:-670266364470\quad 21:-448218679531\quad 22:-378697304778\quad 23:2110412230240$ |

**Seed block 3: free2; dimension $12$.**

**Symmetric seed $S^{(3)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-03-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:821243819539\quad 1:-1224398410930\quad 2:-312648168723\quad 3:167336232108\quad 4:-84464167455$ |
| $0$ | $5:-8691764962\quad 6:-943709995063\quad 7:836318997679\quad 8:280120201508\quad 9:-136339280463$ |
| $0$ | $10:180272717374\quad 11:-38364988083$ |
| $1$ | $1:4252498733080\quad 2:-501891199886\quad 3:-35158880478\quad 4:-651086465808\quad 5:468734507198$ |
| $1$ | $6:-427666250967\quad 7:-925742571040\quad 8:-206576728640\quad 9:-207669634116\quad 10:-315540845249$ |
| $1$ | $11:180267770214$ |
| $2$ | $2:3354819583021\quad 3:-264342072101\quad 4:251296393382\quad 5:-528079753497\quad 6:-157380068588$ |
| $2$ | $7:-243351546236\quad 8:-130214292611\quad 9:-24350060693\quad 10:-207675617900\quad 11:-136341228881$ |
| $3$ | $3:225556387459\quad 4:-486434139644\quad 5:148046529500\quad 6:-54445098486\quad 7:88262548053$ |
| $3$ | $8:36637433880\quad 9:-528066279317\quad 10:468709759587\quad 11:-8686154195$ |
| $4$ | $4:2792388069869\quad 5:-486470400367\quad 6:43750449944\quad 7:-77123027192\quad 8:43742061683$ |
| $4$ | $9:251333851925\quad 10:-651070327363\quad 11:-84469726980$ |
| $5$ | $5:225575380380\quad 6:36647963978\quad 7:88248956816\quad 8:-54447991308\quad 9:-264361731812$ |
| $5$ | $10:-35139747752\quad 11:167334780549$ |
| $6$ | $6:3963936574682\quad 7:-1312639084999\quad 8:-418573701281\quad 9:-130212719435\quad 10:-206573009503$ |
| $6$ | $11:280104490381$ |
| $7$ | $7:2074193739526\quad 8:-1312633027044\quad 9:-243368484188\quad 10:-925722158172\quad 11:836322776258$ |
| $8$ | $8:3963899879598\quad 9:-157391713917\quad 10:-427663856752\quad 11:-943704659060$ |
| $9$ | $9:3354856770096\quad 10:-501847135944\quad 11:-312666416566$ |
| $10$ | $10:4252521351696\quad 11:-1224414016380$ |
| $11$ | $11:821247663018$ |

**Lower-triangular witness $C^{(3)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-03-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:9062249828482$ |
| $1$ | $0:-13510976127382\quad 1:15578940509332$ |
| $2$ | $0:-3450006065164\quad 1:-6213649093555\quad 2:16881053622173$ |
| $3$ | $0:1846519741502\quad 1:1375728733641\quad 2:-682149797130\quad 3:4097320550772$ |
| $4$ | $0:-932044128706\quad 1:-4987596717945\quad 2:-537708995391\quad 3:-9866837008544\quad 4:12484004413300$ |
| $5$ | $0:-95911778273\quad 1:2925589769466\quad 2:-2070977566311\quad 3:2329381113422\quad 4:-983236724183$ |
| $5$ | $5:1818662850024$ |
| $6$ | $0:-10413639139548\quad 1:-11776478304183\quad 2:-7395274701737\quad 3:6087157336399\quad 4:-639439633757$ |
| $6$ | $5:3846602094478\quad 6:6505038279676$ |
| $7$ | $0:9228602317390\quad 1:2061319155569\quad 2:1203236107267\quad 3:-2496648763142\quad 4:-1026661363525$ |
| $7$ | $5:6036040936598\quad 6:-1639417591141\quad 7:8375361520605$ |
| $8$ | $0:3091066863193\quad 1:1354755653640\quad 2:359026547727\quad 3:-893959587706\quad 4:431327146579$ |
| $8$ | $5:-3223128187289\quad 6:4159361722060\quad 7:-16540100196414\quad 8:9089667433857$ |
| $9$ | $0:-1504474970824\quad 1:-2637784565775\quad 2:-1422643518418\quad 3:-11561254380205\quad 4:-8351730331300$ |
| $9$ | $5:-1699500099363\quad 6:199701201540\quad 7:-3600644545759\quad 8:-8757277738751\quad 9:5314476644882$ |
| $10$ | $0:1989271105806\quad 1:-300218753686\quad 2:-934184485719\quad 3:10488199023370\quad 4:3062536287029$ |
| $10$ | $5:-14185891033224\quad 6:-2721483204924\quad 7:156051983261\quad 8:-7914520725484\quad 9:979998097314$ |
| $10$ | $10:5355397685800$ |
| $11$ | $0:-423349486155\quad 1:789971064659\quad 2:-603402987805\quad 3:-386908794230\quad 4:-724408365812$ |
| $11$ | $5:7324668047106\quad 6:331967661616\quad 7:4926282328134\quad 8:1073736260402\quad 9:-315863757870$ |
| $11$ | $10:-522833655137\quad 11:853029638199$ |

**Seed block 4: L0 d1 q 1; dimension $2$.**

**Symmetric seed $S^{(4)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-04-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:14327168097101\quad 1:982081553908$ |
| $1$ | $1:3905466969602$ |

**Lower-triangular witness $C^{(4)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-04-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:37851245682409$ |
| $1$ | $0:2594581859071\quad 1:19591192713482$ |

**Seed block 5: L0 d1 q1; dimension $2$.**

**Symmetric seed $S^{(5)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-05-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:14326896747919\quad 1:-982020975349$ |
| $1$ | $1:3905464698131$ |

**Lower-triangular witness $C^{(5)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-05-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:37850887239164$ |
| $1$ | $0:-2594446384160\quad 1:19591204857609$ |

**Seed block 6: L0 d2 q 2; dimension $12$.**

**Symmetric seed $S^{(6)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-06-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:2693220080462\quad 1:2035762350724\quad 2:-447986099719\quad 3:123467527354\quad 4:91313005145$ |
| $0$ | $5:-446596137567\quad 6:-518412892936\quad 7:2495142101422\quad 8:871352560075\quad 9:-274610431709$ |
| $0$ | $10:129597497439\quad 11:36964485361$ |
| $1$ | $1:2252693934006\quad 2:-682906779894\quad 3:496670386325\quad 4:692472458128\quad 5:-358164419993$ |
| $1$ | $6:-235187959804\quad 7:2212574706077\quad 8:1186672727566\quad 9:-395165859366\quad 10:589727900175$ |
| $1$ | $11:-64364365042$ |
| $2$ | $2:654140749048\quad 3:-275972341735\quad 4:137102366084\quad 5:316529062310\quad 6:174685936059$ |
| $2$ | $7:-478095486210\quad 8:-167826613764\quad 9:34761719379\quad 10:87947587238\quad 11:25949753204$ |
| $3$ | $3:1449042579544\quad 4:1124710323405\quad 5:299199690380\quad 6:176451790686\quad 7:-39185534201$ |
| $3$ | $8:1114504321559\quad 9:-236710855382\quad 10:831407625744\quad 11:-284708073662$ |
| $4$ | $4:1848060128928\quad 5:96510980806\quad 6:447220564566\quad 7:-7859504245\quad 8:1323414831544$ |
| $4$ | $9:-343920023204\quad 10:1195464316557\quad 11:-302041120503$ |
| $5$ | $5:2893252568160\quad 6:528179286423\quad 7:-460147285642\quad 8:168372578290\quad 9:-77537323597$ |
| $5$ | $10:45920595967\quad 11:5977581518$ |
| $6$ | $6:358386690050\quad 7:-614555429407\quad 8:147904921311\quad 9:-12773218265\quad 10:210004232828$ |
| $6$ | $11:-129043451732$ |
| $7$ | $7:3321352941719\quad 8:884540825811\quad 9:-390179477002\quad 10:183831993221\quad 11:254261179715$ |
| $8$ | $8:1467566613749\quad 9:-418481134217\quad 10:1234815695357\quad 11:-232455933593$ |
| $9$ | $9:208381195935\quad 10:-398138824591\quad 11:-65692841892$ |
| $10$ | $10:1840580870705\quad 11:-272654436345$ |
| $11$ | $11:623567910683$ |

**Lower-triangular witness $C^{(6)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-06-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:16411032814732$ |
| $1$ | $0:12404839925105\quad 1:8449220664245$ |
| $2$ | $0:-2729786143117\quad 1:-4074709280579\quad 2:6431102300260$ |
| $3$ | $0:752344649772\quad 1:4773733020638\quad 2:-947259061834\quad 3:10984188581766$ |
| $4$ | $0:556412300041\quad 1:7378791817126\quad 2:7043202327816\quad 3:7601815371381\quad 4:4759783986017$ |
| $5$ | $0:-2721316461972\quad 1:-243684830210\quad 2:3612343318180\quad 3:3327733123809\quad 4:-7936474875207$ |
| $5$ | $5:13955279853763$ |
| $6$ | $0:-3158929110608\quad 1:1854279180771\quad 2:2550269069531\quad 3:1236842768525\quad 4:1141453482361$ |
| $6$ | $5:2895257550078\quad 6:2168499459114$ |
| $7$ | $0:15204052844146\quad 1:3864691213641\quad 2:1468139809654\quad 3:-2951108888321\quad 4:-5392901280995$ |
| $7$ | $5:-3008285813072\quad 6:-2684722813070\quad 7:5461761674899$ |
| $8$ | $0:5309553456580\quad 1:6249465382930\quad 2:3603742809231\quad 3:7377533277917\quad 4:380089235560$ |
| $8$ | $5:-124878648178\quad 6:731879694229\quad 7:676560134363\quad 8:3307729188783$ |
| $9$ | $0:-1673328149478\quad 1:-2220230580500\quad 2:-1576471611781\quad 3:-1211441786800\quad 4:679493568463$ |
| $9$ | $5:162696198227\quad 6:841970521384\quad 7:28863855830\quad 8:-1615393383817\quad 9:2312656458163$ |
| $10$ | $0:789697387739\quad 1:5820267014853\quad 2:5390422685326\quad 3:5450412966073\quad 4:-680361753269$ |
| $10$ | $5:-2497252981236\quad 6:101951203476\quad 7:-3451987317940\quad 8:7705097945257\quad 9:1236560049401$ |
| $10$ | $10:3357364828912$ |
| $11$ | $0:225241676001\quad 1:-1092470395349\quad 2:-193071463384\quad 3:-2149270585918\quad 4:-960154522022$ |
| $11$ | $5:84118030828\quad 6:-2842497944079\quad 7:1392962681313\quad 8:136443291899\quad 9:-3594900163999$ |
| $11$ | $10:-83577376268\quad 11:5705952485587$ |

**Seed block 7: L0 d2 q0; dimension $24$.**

**Symmetric seed $S^{(7)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-07-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:1741032855768\quad 1:-1227904711002\quad 2:-195831572657\quad 3:6529816770\quad 4:-468425235463$ |
| $0$ | $5:-176204340345\quad 6:-465250703659\quad 7:-593313535856\quad 8:-1262330949792\quad 9:-80987406019$ |
| $0$ | $10:-663751646441\quad 11:-425758963438\quad 12:-1057776356065\quad 13:-1486299833267\quad 14:-67650215612$ |
| $0$ | $15:-382377991106\quad 16:-1247213097142\quad 17:-1368482053262\quad 18:-111273197908\quad 19:-339283094407$ |
| $0$ | $20:60215348646\quad 21:640780253454\quad 22:-225940912581\quad 23:-435900231221$ |
| $1$ | $1:2443595305004\quad 2:-288338190823\quad 3:-80061519936\quad 4:-199266936276\quad 5:-34079838355$ |
| $1$ | $6:-46955033952\quad 7:-7742817290\quad 8:194651369473\quad 9:-42227260645\quad 10:141383118725$ |
| $1$ | $11:-118995655745\quad 12:2272306207821\quad 13:2445738918276\quad 14:-378430889196\quad 15:-155463241665$ |
| $1$ | $16:344800568757\quad 17:458687373805\quad 18:-34483660105\quad 19:33126719806\quad 20:150647917916$ |
| $1$ | $21:-225905236349\quad 22:406482337411\quad 23:198327090556$ |
| $2$ | $2:718032402875\quad 3:145495873282\quad 4:-225641409977\quad 5:20153016409\quad 6:-240102176112$ |
| $2$ | $7:371633247333\quad 8:153155478090\quad 9:246117376561\quad 10:267968566294\quad 11:-40985366037$ |
| $2$ | $12:-584513979891\quad 13:-235188776775\quad 14:-56926254192\quad 15:5231117827\quad 16:118741681099$ |
| $2$ | $17:-62748811919\quad 18:85337962670\quad 19:-23749400371\quad 20:-49852558608\quad 21:-435914278332$ |
| $2$ | $22:198330941036\quad 23:134770436947$ |
| $3$ | $3:168353902296\quad 4:-147174344292\quad 5:22156822835\quad 6:-154225051458\quad 7:27037138454$ |
| $3$ | $8:-103274108488\quad 9:-31437050203\quad 10:21806013060\quad 11:24263230011\quad 12:-157735899606$ |
| $3$ | $13:-121220922776\quad 14:16518427212\quad 15:-228785497834\quad 16:33312060633\quad 17:148112442861$ |
| $3$ | $18:-51811823249\quad 19:2519054429\quad 20:-4650777278\quad 21:-111258166911\quad 22:-34499623529$ |
| $3$ | $23:85329929418$ |
| $4$ | $4:2155396628379\quad 5:51071229519\quad 6:1253320938951\quad 7:919020963609\quad 8:979682132225$ |
| $4$ | $9:198288927726\quad 10:75631742463\quad 11:100173519348\quad 12:-322657803091\quad 13:-236518539933$ |
| $4$ | $14:-272287553996\quad 15:991513886835\quad 16:1239776573050\quad 17:630748025885\quad 18:2534080475$ |
| $4$ | $19:1350295809608\quad 20:-94830297271\quad 21:-339233466694\quad 22:33136110847\quad 23:-23751314543$ |
| $5$ | $5:734862099164\quad 6:-103934927914\quad 7:-148123036648\quad 8:131386415607\quad 9:159310106914$ |
| $5$ | $10:255215856283\quad 11:84205674017\quad 12:-206494776338\quad 13:-172084738747\quad 14:-18787180284$ |
| $5$ | $15:-304688857496\quad 16:157296128435\quad 17:-10195986047\quad 18:-4646679609\quad 19:-94839802976$ |
| $5$ | $20:-189112997454\quad 21:60234056704\quad 22:150642379721\quad 23:-49859559394$ |
| $6$ | $6:2533810562913\quad 7:780609810210\quad 8:796935869565\quad 9:285132924857\quad 10:407285078397$ |
| $6$ | $11:513511296341\quad 12:203106263233\quad 13:397253210718\quad 14:121294486770\quad 15:1954196012717$ |
| $6$ | $16:1133951687261\quad 17:1075293333493\quad 18:-228750332655\quad 19:991451491128\quad 20:-304678521972$ |
| $6$ | $21:-382307140050\quad 22:-155459767006\quad 23:5267360691$ |
| $7$ | $7:1716659666300\quad 8:993506155424\quad 9:111742264320\quad 10:565848066884\quad 11:134171809373$ |
| $7$ | $12:-71052427508\quad 13:479955582738\quad 14:548875035930\quad 15:1133876620543\quad 16:798649490560$ |
| $7$ | $17:1488390367655\quad 18:33315144551\quad 19:1239732617762\quad 20:157301044897\quad 21:-1247196981547$ |
| $7$ | $22:344772582856\quad 23:118744149336$ |
| $8$ | $8:5224096477551\quad 9:429705104634\quad 10:1258111147889\quad 11:1715237347731\quad 12:112477065131$ |
| $8$ | $13:1639171419628\quad 14:1497263119065\quad 15:1075285044600\quad 16:1488405904593\quad 17:2160476960664$ |
| $8$ | $18:148120901906\quad 19:630734261804\quad 20:-10201337477\quad 21:-1368463176729\quad 22:458673856892$ |
| $8$ | $23:-62753769105$ |
| $9$ | $9:3484682944491\quad 10:2635364804239\quad 11:-208535098504\quad 12:-222614885128\quad 13:-412312006502$ |
| $9$ | $14:-439480393027\quad 15:203127960345\quad 16:-71052326059\quad 17:112465001257\quad 18:-157740792922$ |
| $9$ | $19:-322658856700\quad 20:-206488422155\quad 21:-1057703007078\quad 22:2272342698067\quad 23:-584502279656$ |
| $10$ | $10:3410336308999\quad 11:251365500618\quad 12:-412302362185\quad 13:-6560017240\quad 14:665813908020$ |
| $10$ | $15:397263413120\quad 16:479985571112\quad 17:1639162947300\quad 18:-121226132153\quad 19:-236520582339$ |
| $10$ | $20:-172080922007\quad 21:-1486274527866\quad 22:2445791320146\quad 23:-235183999378$ |
| $11$ | $11:1674714194304\quad 12:-439459965928\quad 13:665825807919\quad 14:804715684999\quad 15:121260679611$ |
| $11$ | $16:548881595894\quad 17:1497254370458\quad 18:16518536250\quad 19:-272273595199\quad 20:-18784296229$ |
| $11$ | $21:-67669784617\quad 22:-378427311574\quad 23:-56915270122$ |
| $12$ | $12:3484638408244\quad 13:2635312305824\quad 14:-208490823947\quad 15:285146435618\quad 16:111776195533$ |
| $12$ | $17:429719220754\quad 18:-31423549832\quad 19:198279572592\quad 20:159317388940\quad 21:-80958183740$ |
| $12$ | $22:-42225539594\quad 23:246138971625$ |
| $13$ | $13:3410253943480\quad 14:251366121835\quad 15:407255752295\quad 16:565871576721\quad 17:1258116587804$ |
| $13$ | $18:21804956718\quad 19:75645792331\quad 20:255219519889\quad 21:-663766072510\quad 22:141379543931$ |
| $13$ | $23:267984563516$ |
| $14$ | $14:1674715287773\quad 15:513516146550\quad 16:134178736228\quad 17:1715242480941\quad 18:24253470400$ |
| $14$ | $19:100174656106\quad 20:84202869850\quad 21:-425777426487\quad 22:-119027913607\quad 23:-40995343215$ |
| $15$ | $15:2533898446374\quad 16:780687348255\quad 17:796954225215\quad 18:-154198516826\quad 19:1253312674540$ |
| $15$ | $20:-103936424174\quad 21:-465206922326\quad 22:-46931533141\quad 23:-240073000331$ |
| $16$ | $16:1716799246549\quad 17:993569099266\quad 18:27051598681\quad 19:919118371411\quad 20:-148106240423$ |
| $16$ | $21:-593328069018\quad 22:-7730778713\quad 23:371632394127$ |
| $17$ | $17:5224097601034\quad 18:-103249024942\quad 19:979688606337\quad 20:131393038880\quad 21:-1262362148144$ |
| $17$ | $22:194643249358\quad 23:153185947520$ |
| $18$ | $18:168350967073\quad 19:-147147694246\quad 20:22150237924\quad 21:6527075103\quad 22:-80068186096$ |
| $18$ | $23:145498933894$ |
| $19$ | $19:2155414847632\quad 20:51085180421\quad 21:-468432649980\quad 22:-199255480367\quad 23:-225658026277$ |
| $20$ | $20:734859549903\quad 21:-176220602750\quad 22:-34075888482\quad 23:20156760713$ |
| $21$ | $21:1741044491379\quad 22:-1227858377177\quad 23:-195843010311$ |
| $22$ | $22:2443621495357\quad 23:-288347571594$ |
| $23$ | $23:718040640005$ |

**Lower-triangular witness $C^{(7)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-07-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:13194820028208$ |
| $1$ | $0:-9305960281209\quad 1:12560199988255$ |
| $2$ | $0:-1484154935333\quad 1:-3395272846097\quad 2:7620540447762$ |
| $3$ | $0:49487728942\quad 1:-600756449795\quad 2:1651234949870\quad 3:3707485134514$ |
| $4$ | $0:-3550069151846\quad 1:-4216771723360\quad 2:-5531114816545\quad 3:-2142107653690\quad 4:12246372596581$ |
| $5$ | $0:-1335405408852\quad 1:-1260745334023\quad 2:-557338592307\quad 3:659386200422\quad 4:-540581411925$ |
| $5$ | $5:8311183356325$ |
| $6$ | $0:-3526010227228\quad 1:-2986291186127\quad 2:-5167958458686\quad 3:-2294960239433\quad 4:5448256739276$ |
| $6$ | $5:-2080198344525\quad 6:12885844921445$ |
| $7$ | $0:-4496564065198\quad 1:-3393188672274\quad 2:2489183772892\quad 3:-869179111106\quad 4:6004779487113$ |
| $7$ | $5:-2392977089675\quad 6:1959422949230\quad 7:9346580998150$ |
| $8$ | $0:-9566867506289\quad 1:-5538427106803\quad 2:-2321047582281\quad 3:-2521552718782\quad 4:1830049752747$ |
| $8$ | $5:-633025696425\quad 6:27318162947\quad 7:3056529309394\quad 8:19374521871028$ |
| $9$ | $0:-613781816242\quad 1:-790955182009\quad 2:2757715392551\quad 3:-2196134986872\quad 4:2030277140632$ |
| $9$ | $5:2189433405762\quad 6:2071402375612\quad 7:-1503618698036\quad 8:1847309544228\quad 9:17780837148889$ |
| $10$ | $0:-5030395602381\quad 1:-2601419550053\quad 2:1377650454297\quad 3:-379799228054\quad 4:-1180618855259$ |
| $10$ | $5:1913598992811\quad 6:2474318269542\quad 7:3017058640615\quad 8:3076243608371\quad 9:13817896046543$ |
| $10$ | $10:9286605809580$ |
| $11$ | $0:-3226712926192\quad 1:-3338101936571\quad 2:-2653518542335\quad 3:1338428019127\quad 4:-2231156577058$ |
| $11$ | $5:-440908328506\quad 6:2374874540582\quad 7:325125827416\quad 8:6303522105626\quad 9:-1450836384789$ |
| $11$ | $10:-388317044295\quad 11:9174745521016$ |
| $12$ | $0:-8016603135198\quad 1:12151751608928\quad 2:-3817415185434\quad 3:-478268660710\quad 4:-2582248549962$ |
| $12$ | $5:-2315286821722\quad 6:1300598998519\quad 7:1560388944287\quad 8:-503535636605\quad 9:157515535033$ |
| $12$ | $10:-5603687413488\quad 11:-5219837867901\quad 12:6830089815871$ |
| $13$ | $0:-11264267569316\quad 1:11126340771749\quad 2:-322789873177\quad 3:-1172607899524\quad 4:-1716490634203$ |
| $13$ | $5:-2232890242198\quad 6:2606089544338\quad 7:3716928029263\quad 8:5386739586317\quad 9:-2385505558550$ |
| $13$ | $10:-2950541109403\quad 11:1887331371574\quad 12:2027323191026\quad 13:3040107118629$ |
| $14$ | $0:-512702829348\quad 1:-3392802751980\quad 2:-2358500297046\quad 3:953046357646\quad 4:-4438797547413$ |
| $14$ | $5:-1345570686717\quad 6:898115959602\quad 7:7429784526409\quad 8:5548373145077\quad 9:-1537021193172$ |
| $14$ | $10:3839253144659\quad 11:1002635891663\quad 12:1488456682825\quad 13:-3371368047082\quad 14:3038302253693$ |
| $15$ | $0:-2897940178711\quad 1:-3384853776744\quad 2:-2003845089032\quad 3:-5788233861931\quad 4:4173303338244$ |
| $15$ | $5:-4048807054091\quad 6:9335373177383\quad 7:3828988843176\quad 8:1014341350051\quad 9:-359433549103$ |
| $15$ | $10:-347218130735\quad 11:-3164467242624\quad 12:203043248407\quad 13:-1287406036412\quad 14:2994660881988$ |
| $15$ | $15:6199735460356$ |
| $16$ | $0:-9452293358119\quad 1:-4258101760425\quad 2:-2179886994201\quad 3:1305575589492\quad 4:5161152566103$ |
| $16$ | $5:-186159205930\quad 6:2372719865737\quad 7:-707396364465\quad 8:1321084066136\quad 9:-1455840787487$ |
| $16$ | $10:1253128721520\quad 11:-139749030904\quad 12:-358700986823\quad 13:-885922953646\quad 14:-1042846694380$ |
| $16$ | $15:-338278342758\quad 16:4168183648024$ |
| $17$ | $0:-10371358232522\quad 1:-4032317195657\quad 2:-4639880993015\quad 3:5546507025919\quad 4:-369913358920$ |
| $17$ | $5:-3176026043944\quad 6:3342975552764\quad 7:9946135288712\quad 8:3400573839253\quad 9:2031460895512$ |
| $17$ | $10:4154688028867\quad 11:5753908049987\quad 12:2972285712461\quad 13:-4160874255326\quad 14:-801769244052$ |
| $17$ | $15:-1360823015876\quad 16:-10228413860117\quad 17:5161945775365$ |
| $18$ | $0:-843309705400\quad 1:-899362481830\quad 2:554896732239\quad 3:-1779106670148\quad 4:-594024591826$ |
| $18$ | $5:-188111631032\quad 6:-2087912523740\quad 7:82185457157\quad 8:-34122874649\quad 9:-917338024899$ |
| $18$ | $10:-300116514926\quad 11:225985670032\quad 12:371354119007\quad 13:134050561608\quad 14:-24750640216$ |
| $18$ | $15:-1405318717134\quad 16:323343516750\quad 17:-417431115165\quad 18:1921855335358$ |
| $19$ | $0:-2571335521680\quad 1:-1641381050707\quad 2:-1543740491138\quad 3:523849166609\quad 4:9109911312126$ |
| $19$ | $5:-1355796764830\quad 6:2013660458629\quad 7:5268935468165\quad 8:-339030897870\quad 9:-2299346025291$ |
| $19$ | $10:-1426290254081\quad 11:-3740816257769\quad 12:-624493857216\quad 13:-4863102149725\quad 14:-3701086507939$ |
| $19$ | $15:3534968379075\quad 16:-139955852043\quad 17:1907689376261\quad 18:-1428304095447\quad 19:3093571476299$ |
| $20$ | $0:456355967852\quad 1:1537525064933\quad 2:119724343775\quad 3:64281668517\quad 4:-47331151747$ |
| $20$ | $5:-1968997320019\quad 6:-2121631712519\quad 7:2405877495050\quad 8:198493972389\quad 9:-409932376987$ |
| $20$ | $10:-462657791487\quad 11:677424968662\quad 12:-464624374852\quad 13:667591437755\quad 14:-799586249374$ |
| $20$ | $15:733477761410\quad 16:598613615860\quad 17:1934189345506\quad 18:26655019027\quad 19:-2214444149317$ |
| $20$ | $20:6708449394930$ |
| $21$ | $0:4856301579591\quad 1:1799495708625\quad 2:-3972703139330\quad 3:-1004783288326\quad 4:-2712714195580$ |
| $21$ | $5:1414864643254\quad 6:-1617857961515\quad 7:-6945479822669\quad 8:-3357062867873\quad 9:-5123386460547$ |
| $21$ | $10:-1535146019694\quad 11:2127220044631\quad 12:608017274679\quad 13:-3136878193144\quad 14:1170509249320$ |
| $21$ | $15:3017706631650\quad 16:-251447296110\quad 17:15838207842\quad 18:742752882505\quad 19:681841380170$ |
| $21$ | $20:-1044338554993\quad 21:1736396414388$ |
| $22$ | $0:-1712345542402\quad 1:1967581261358\quad 2:3145732695647\quad 3:-1989901140508\quad 4:1524396970206$ |
| $22$ | $5:2303834820833\quad 6:-584405202245\quad 7:2289449722074\quad 8:1773128754371\quad 9:11694210004625$ |
| $22$ | $10:6555693346938\quad 11:-1350860109344\quad 12:642920888215\quad 13:3732758015054\quad 14:-2454972694580$ |
| $22$ | $15:625599456549\quad 16:938005160914\quad 17:-933193110524\quad 18:-306631764906\quad 19:1185463599066$ |
| $22$ | $20:-57829404399\quad 21:-555186916935\quad 22:1208946424832$ |
| $23$ | $0:-3303570873185\quad 1:-868631891739\quad 2:738109119993\quad 3:1876164333001\quad 4:-789159937597$ |
| $23$ | $5:-1413159933938\quad 6:-328697388026\quad 7:-442212202503\quad 8:-1772264284418\quad 9:-2873544885586$ |
| $23$ | $10:686756047439\quad 11:-1525229151994\quad 12:535257238838\quad 13:2036447037067\quad 14:-76783524823$ |
| $23$ | $15:-3698389219200\quad 16:821418324803\quad 17:-142219898849\quad 18:2281528042985\quad 19:-3014780216984$ |
| $23$ | $20:-401244393596\quad 21:106929228294\quad 22:1387748102199\quad 23:1935596051259$ |

**Seed block 8: L0 d2 q2; dimension $12$.**

**Symmetric seed $S^{(8)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-08-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:208409975004\quad 1:-398174787343\quad 2:-65674587494\quad 3:-12766991698\quad 4:-390180376685$ |
| $0$ | $5:-418538162682\quad 6:-236758821663\quad 7:-343965336994\quad 8:-77537970311\quad 9:-274618025226$ |
| $0$ | $10:-395189331213\quad 11:34778150036$ |
| $1$ | $1:1840518214268\quad 2:-272667765760\quad 3:209969910070\quad 4:183821238085\quad 5:1234801520652$ |
| $1$ | $6:831345401887\quad 7:1195418191287\quad 8:45891186525\quad 9:129589905904\quad 10:589705525451$ |
| $1$ | $11:87932064653$ |
| $2$ | $2:623569617071\quad 3:-129055252944\quad 4:254253034184\quad 5:-232462553589\quad 6:-284706647067$ |
| $2$ | $7:-302051750799\quad 8:5973894172\quad 9:36960912938\quad 10:-64377301962\quad 11:25950914533$ |
| $3$ | $3:358356560407\quad 4:-614574041781\quad 5:147894747689\quad 6:176453886115\quad 7:447163086765$ |
| $3$ | $8:528155373476\quad 9:-518422912365\quad 10:-235222250452\quad 11:174661267900$ |
| $4$ | $4:3321290363784\quad 5:884503012749\quad 6:-39200025819\quad 7:-7851522965\quad 8:-460159368333$ |
| $4$ | $9:2495088793969\quad 10:2212550926033\quad 11:-478104485063$ |
| $5$ | $5:1467564856912\quad 6:1114463561192\quad 7:1323415525206\quad 8:168367280215\quad 9:871306906469$ |
| $5$ | $10:1186652309345\quad 11:-167832083575$ |
| $6$ | $6:1449017030236\quad 7:1124667467756\quad 8:299178071853\quad 9:123450859718\quad 10:496660045019$ |
| $6$ | $11:-275995654227$ |
| $7$ | $7:1847993065854\quad 8:96459735647\quad 9:91319867994\quad 10:692461114190\quad 11:137053246749$ |
| $8$ | $8:2893251809966\quad 9:-446605773225\quad 10:-358177568900\quad 11:316540194408$ |
| $9$ | $9:2693152795197\quad 10:2035743681580\quad 11:-448000611494$ |
| $10$ | $10:2252677868452\quad 11:-682937697276$ |
| $11$ | $11:654144380641$ |

**Lower-triangular witness $C^{(8)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-08-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:4565193040869$ |
| $1$ | $0:-8721970435388\quad 1:10391296509628$ |
| $2$ | $0:-1438593875572\quad 1:-3831490111978\quad 2:6753301628839$ |
| $3$ | $0:-279659405061\quad 1:1785899375201\quad 2:-957337041942\quad 3:5625967105098$ |
| $4$ | $0:-8546853839300\quad 1:-5404838813080\quad 2:-1122226587217\quad 3:-9823993284624\quad 4:11493380558533$ |
| $5$ | $0:-9168027702993\quad 1:4187820590872\quad 2:-3019224047652\quad 3:329918103997\quad 4:2834663252269$ |
| $5$ | $5:5282615532858$ |
| $6$ | $0:-5186173279935\quad 1:3647368750684\quad 2:-3251240019863\quad 3:1167561110569\quad 4:-1801953983695$ |
| $6$ | $5:8240493885681\quad 6:4649243237092$ |
| $7$ | $0:-7534518998752\quad 1:5179908698288\quad 2:-3138837886039\quad 3:5395248056739\quad 4:1069779247232$ |
| $7$ | $5:5164683361724\quad 6:-567373477213\quad 7:5839312161919$ |
| $8$ | $0:-1698459837664\quad 1:-983977103129\quad 2:-831608500980\quad 3:9474229151267\quad 4:2287477370064$ |
| $8$ | $5:-1274906218601\quad 6:5497779251793\quad 7:-7624803572832\quad 8:9989917853358$ |
| $9$ | $0:-6015474543300\quad 1:-3802008776719\quad 2:-2891192138246\quad 3:-8798916626094\quad 4:7644503035180$ |
| $9$ | $5:3863040406178\quad 6:-4768493086949\quad 7:-1530169163945\quad 8:2435172496926\quad 9:5340657460664$ |
| $10$ | $0:-8656574380867\quad 1:-1590930762224\quad 2:-3699917750090\quad 3:-4735886834876\quad 4:7655922059489$ |
| $10$ | $5:2773940853137\quad 6:-1073010294210\quad 7:526814671689\quad 8:-1436873485632\quad 9:4312452059089$ |
| $10$ | $10:4825328721468$ |
| $11$ | $0:761811159455\quad 1:1485637606540\quad 2:1389429146924\quad 3:2907256095936\quad 4:-274036813308$ |
| $11$ | $5:-2273086630926\quad 6:-2087829175975\quad 7:1930692451316\quad 8:3198190910654\quad 9:-1663642812691$ |
| $11$ | $10:-4872316784323\quad 11:1476507700426$ |

**Seed block 9: L1 d1 q 1; dimension $2$.**

**Symmetric seed $S^{(9)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-09-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:9990366021527\quad 1:119445858133$ |
| $1$ | $1:6305235644839$ |

**Lower-triangular witness $C^{(9)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-09-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:31607540115496$ |
| $1$ | $0:377903050021\quad 1:25107384247840$ |

**Seed block 10: L1 d1 q1; dimension $4$.**

**Symmetric seed $S^{(10)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-10-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:13039623021243\quad 1:583241226217\quad 2:1003101502128\quad 3:-311658668207$ |
| $1$ | $1:11353080753938\quad 2:311674422699\quad 3:-856834111733$ |
| $2$ | $2:13039619821473\quad 3:-583178908761$ |
| $3$ | $3:11353026798299$ |

**Lower-triangular witness $C^{(10)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-10-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:36110418055241$ |
| $1$ | $0:1615160548196\quad 1:33655598669424$ |
| $2$ | $0:2777872858169\quad 1:792757599814\quad 2:35994679189001$ |
| $3$ | $0:-863071337834\quad 1:-2504469263081\quad 2:-1498414560304\quad 3:33556521947476$ |

**Seed block 11: L1 d1 q3; dimension $2$.**

**Symmetric seed $S^{(11)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-11-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:9990315644827\quad 1:-119530003842$ |
| $1$ | $1:6305271092793$ |

**Lower-triangular witness $C^{(11)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-11-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:31607460424443$ |
| $1$ | $0:-378170223855\quad 1:25107450817657$ |

**Seed block 12: L1 d2 q 2; dimension $12$.**

**Symmetric seed $S^{(12)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-12-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:635744414368\quad 1:210438120809\quad 2:-127968822851\quad 3:-35597660740\quad 4:-112694398647$ |
| $0$ | $5:-131135860842\quad 6:-149806667841\quad 7:354779587292\quad 8:21474387163\quad 9:-60618842595$ |
| $0$ | $10:-50219260963\quad 11:25974306941$ |
| $1$ | $1:1590262500376\quad 2:-432823480150\quad 3:-140727038724\quad 4:-214867328378\quad 5:-209994775416$ |
| $1$ | $6:158966425325\quad 7:462438936841\quad 8:113103016162\quad 9:-199745905473\quad 10:17045222628$ |
| $1$ | $11:-23293126509$ |
| $2$ | $2:239105397016\quad 3:54070818529\quad 4:216088508019\quad 5:-174841697290\quad 6:-4692295318$ |
| $2$ | $7:-203540470520\quad 8:-32124693523\quad 9:77419261089\quad 10:-39195508410\quad 11:-35435021858$ |
| $3$ | $3:692333386905\quad 4:-241742994201\quad 5:-82272136894\quad 6:26956202982\quad 7:-85447365480$ |
| $3$ | $8:-143690774551\quad 9:-108626592980\quad 10:3204003870\quad 11:-38782111253$ |
| $4$ | $4:507278991666\quad 5:-362977620862\quad 6:-29206280155\quad 7:-148907750571\quad 8:132815716225$ |
| $4$ | $9:133409401986\quad 10:-40928793636\quad 11:-102904061829$ |
| $5$ | $5:946482474937\quad 6:-35017997258\quad 7:-140605337303\quad 8:-80283885173\quad 9:114837194861$ |
| $5$ | $10:-71759513627\quad 11:-41359788673$ |
| $6$ | $6:210018148990\quad 7:-280442960839\quad 8:-109143389992\quad 9:67005277752\quad 10:-86243180626$ |
| $6$ | $11:-84030495518$ |
| $7$ | $7:1515684430703\quad 8:33314443836\quad 9:-195169401284\quad 10:-197681467650\quad 11:181310301527$ |
| $8$ | $8:446067799100\quad 9:-164859840709\quad 10:597720095910\quad 11:-133009542144$ |
| $9$ | $9:288131177516\quad 10:-502036189288\quad 11:-97097381020$ |
| $10$ | $10:1729884319836\quad 11:-233275823921$ |
| $11$ | $11:862000969838$ |

**Lower-triangular witness $C^{(12)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-12-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:7973357601212$ |
| $1$ | $0:2639266057464\quad 1:12331281957506$ |
| $2$ | $0:-1604955267923\quad 1:-3166454565485\quad 2:3362768766104$ |
| $3$ | $0:-446457596917\quad 1:-1045664476345\quad 2:410223961766\quad 3:8232393722895$ |
| $4$ | $0:-1413386985551\quad 1:-1439949925885\quad 2:4395452951129\quad 3:-3415062779077\quad 4:3959054202204$ |
| $5$ | $0:-1644675523171\quad 1:-1350933448376\quad 2:-7256362675059\quad 3:-898569856166\quad 4:-2965676325945$ |
| $5$ | $5:5278332654028$ |
| $6$ | $0:-1878840450079\quad 1:1691259873195\quad 2:556271711577\quad 3:412649370832\quad 4:-1054966550679$ |
| $6$ | $5:-573758617548\quad 6:3562236995043$ |
| $7$ | $0:4449563220871\quad 1:2797787985353\quad 2:-1294655946942\quad 3:-376749333082\quad 4:-42729657214$ |
| $7$ | $5:-2429284491714\quad 6:-7012256265754\quad 7:8188354023854$ |
| $8$ | $0:269326778467\quad 1:859559989622\quad 2:-17382779199\quad 3:-1620779172977\quad 4:2384736355853$ |
| $8$ | $5:-177023310529\quad 6:-2461746591472\quad 7:-2258754307600\quad 8:4928254284222$ |
| $9$ | $0:-760267451014\quad 1:-1457110666284\quad 2:567346811331\quad 3:-1574083435737\quad 4:580664369756$ |
| $9$ | $5:2404050746104\quad 6:2824722562679\quad 7:1680032635023\quad 8:-1578805620408\quad 9:1975217227475$ |
| $10$ | $0:-629838312474\quad 1:273031883806\quad 2:-1209084057318\quad 3:99691451733\quad 4:269001686542$ |
| $10$ | $5:-2979953122155\quad 6:-3105912381698\quad 7:-5894277268757\quad 8:7653582868290\quad 9:-5910507757309$ |
| $10$ | $10:4918561293568$ |
| $11$ | $0:325763727655\quad 1:-258617863986\quad 2:-1141787603666\quad 3:-429378189664\quad 4:-1679707370971$ |
| $11$ | $5:-3334783831838\quad 6:-2870856360655\quad 7:-1531321274872\quad 8:-4259732072436\quad 9:1560383497185$ |
| $11$ | $10:-2031681409734\quad 11:5941568204681$ |

**Seed block 13: L1 d2 q0; dimension $36$.**

**Symmetric seed $S^{(13)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-13-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:479269536964\quad 1:-323833697448\quad 2:-509060223720\quad 3:-19011502931\quad 4:-260905986959$ |
| $0$ | $5:-954512796564\quad 6:-134612601705\quad 7:-2780666384\quad 8:92598123128\quad 9:1651310444$ |
| $0$ | $10:-172828813851\quad 11:15760405168\quad 12:62487898583\quad 13:-48307634400\quad 14:79700271412$ |
| $0$ | $15:-12944578287\quad 16:-183495909479\quad 17:167379900086\quad 18:-65815154611\quad 19:112557449574$ |
| $0$ | $20:16373374368\quad 21:-11611064204\quad 22:-91608286712\quad 23:-549431963\quad 24:116193130449$ |
| $0$ | $25:119222195367\quad 26:-31514459644\quad 27:38619423341\quad 28:-89111798443\quad 29:-49530796141$ |
| $0$ | $30:-128772408791\quad 31:-141539690282\quad 32:-616370111942\quad 33:31806720077\quad 34:-432337883069$ |
| $0$ | $35:-742339434186$ |
| $1$ | $1:2376091309792\quad 2:304200746115\quad 3:-124220446816\quad 4:920477896385\quad 5:1510847236685$ |
| $1$ | $6:194832274064\quad 7:143730308332\quad 8:-317780961229\quad 9:9797022615\quad 10:60686736642$ |
| $1$ | $11:78063347877\quad 12:640199365215\quad 13:592765812924\quad 14:-86896241305\quad 15:470526077980$ |
| $1$ | $16:610269415638\quad 17:111344421754\quad 18:278354143172\quad 19:59823574979\quad 20:8265871560$ |
| $1$ | $21:-4255873719\quad 22:206088303473\quad 23:1579401964\quad 24:657703627866\quad 25:854589458447$ |
| $1$ | $26:-183128205863\quad 27:242802309267\quad 28:370835999720\quad 29:-29832874226\quad 30:846054143085$ |
| $1$ | $31:1280284395016\quad 32:1800927349971\quad 33:-18304765577\quad 34:462763278267\quad 35:1234319774203$ |
| $2$ | $2:2438157826472\quad 3:-461260966690\quad 4:-752023542362\quad 5:2368023247199\quad 6:-1007256094230$ |
| $2$ | $7:441848951998\quad 8:-304172153640\quad 9:-615300189418\quad 10:163742417192\quad 11:55340794059$ |
| $2$ | $12:-28116133710\quad 13:-184200430350\quad 14:31876619050\quad 15:-236388508530\quad 16:7290727621$ |
| $2$ | $17:-431719391060\quad 18:-104546976723\quad 19:-89670351158\quad 20:130448721459\quad 21:-582349077440$ |
| $2$ | $22:62605841547\quad 23:-15004035779\quad 24:-312981412024\quad 25:-282501984692\quad 26:41620951451$ |
| $2$ | $27:-591386299460\quad 28:-230963849941\quad 29:22342780672\quad 30:43493978447\quad 31:169039830417$ |
| $2$ | $32:1562709998340\quad 33:-545262287999\quad 34:-387236699644\quad 35:2272499850715$ |
| $3$ | $3:630157682904\quad 4:438755154161\quad 5:-362130588007\quad 6:542756602319\quad 7:82338993921$ |
| $3$ | $8:332241894680\quad 9:-39096203025\quad 10:-138476704195\quad 11:43992765609\quad 12:-25864258418$ |
| $3$ | $13:95188769251\quad 14:-12712461091\quad 15:-171544096783\quad 16:-9625858770\quad 17:473258090054$ |
| $3$ | $18:92926767931\quad 19:217949794732\quad 20:-253670416411\quad 21:105555064369\quad 22:-212249880026$ |
| $3$ | $23:27094737931\quad 24:31024185455\quad 25:-31435114923\quad 26:42586813122\quad 27:429215293873$ |
| $3$ | $28:136893952272\quad 29:-24910151904\quad 30:23910733402\quad 31:-273178618486\quad 32:-145572726890$ |
| $3$ | $33:244404843810\quad 34:571310317742\quad 35:-501777854521$ |
| $4$ | $4:3892172282826\quad 5:1141409084135\quad 6:2196231212805\quad 7:146474619012\quad 8:508493755768$ |
| $4$ | $9:259474601413\quad 10:-82906393167\quad 11:-231741887013\quad 12:-91430855512\quad 13:60747482441$ |
| $4$ | $14:47903481203\quad 15:1330753317853\quad 16:37977214991\quad 17:582767216257\quad 18:598835061766$ |
| $4$ | $19:450963157997\quad 20:-266465071672\quad 21:473882826914\quad 22:-156451555297\quad 23:-346762326574$ |
| $4$ | $24:-81985905215\quad 25:124846451413\quad 26:-68779285730\quad 27:834938848566\quad 28:834821264748$ |
| $4$ | $29:332904812438\quad 30:588608928860\quad 31:898910208987\quad 32:1343207313158\quad 33:906305810815$ |
| $4$ | $34:1780797810002\quad 35:903557534873$ |
| $5$ | $5:6365612490884\quad 6:958009042399\quad 7:345697468099\quad 8:35227701230\quad 9:-466935692390$ |
| $5$ | $10:173372549254\quad 11:-78209375079\quad 12:-256657737801\quad 13:-121250146774\quad 14:3910074054$ |
| $5$ | $15:1177636671075\quad 16:447567378620\quad 17:148271296734\quad 18:114010319042\quad 19:-20589989837$ |
| $5$ | $20:-6530851268\quad 21:-472145483054\quad 22:179622930589\quad 23:-94716980921\quad 24:-144475561146$ |
| $5$ | $25:-80438955506\quad 26:31505721969\quad 27:-273195948\quad 28:345724963154\quad 29:160583149101$ |
| $5$ | $30:871736266263\quad 31:1329538662792\quad 32:3538031164211\quad 33:-175998498784\quad 34:1178681064959$ |
| $5$ | $35:4750471066585$ |
| $6$ | $6:3063942039735\quad 7:-516880808264\quad 8:1272684263253\quad 9:94758836498\quad 10:8495829996$ |
| $6$ | $11:-313296004470\quad 12:-128664518848\quad 13:120421597182\quad 14:-135220128406\quad 15:1775119728913$ |
| $6$ | $16:-43536860925\quad 17:1548470382005\quad 18:204862086317\quad 19:123383588479\quad 20:-323625305309$ |
| $6$ | $21:493609709629\quad 22:-329845202357\quad 23:214068604208\quad 24:204055773826\quad 25:272191479849$ |
| $6$ | $26:1503302026\quad 27:325939930302\quad 28:623741450131\quad 29:93650678375\quad 30:804810706515$ |
| $6$ | $31:991622895280\quad 32:315569044800\quad 33:683176901463\quad 34:2133167054578\quad 35:804077276054$ |
| $7$ | $7:826128660536\quad 8:-337038781542\quad 9:-113187938304\quad 10:-260120335440\quad 11:246568681809$ |
| $7$ | $12:127545858737\quad 13:123693983075\quad 14:80048806781\quad 15:-359404420061\quad 16:-297673790597$ |
| $7$ | $17:36801542196\quad 18:201351172590\quad 19:-148982805146\quad 20:-73291890834\quad 21:-190936972164$ |
| $7$ | $22:-26431230978\quad 23:-157962608465\quad 24:-62608368263\quad 25:-47096642643\quad 26:52123256345$ |
| $7$ | $27:76470285247\quad 28:-23309351868\quad 29:11413707644\quad 30:22664636614\quad 31:-40363512238$ |
| $7$ | $32:335284079768\quad 33:-64340238505\quad 34:-41519263171\quad 35:181536411873$ |
| $8$ | $8:1963157047528\quad 9:-204587710289\quad 10:2241157555\quad 11:-251000747258\quad 12:-93234629721$ |
| $8$ | $13:403057247145\quad 14:42534258265\quad 15:1304884786879\quad 16:-192690372299\quad 17:1219747651480$ |
| $8$ | $18:-19646641213\quad 19:467576698201\quad 20:-89703239480\quad 21:118994219628\quad 22:-232677276581$ |
| $8$ | $23:163072425080\quad 24:669081811126\quad 25:289513332887\quad 26:21780094960\quad 27:-86915886078$ |
| $8$ | $28:342005540365\quad 29:-35726263084\quad 30:621278398592\quad 31:471611613501\quad 32:51272828760$ |
| $8$ | $33:284349646549\quad 34:1100643086493\quad 35:-53512985351$ |
| $9$ | $9:890350386971\quad 10:399001630642\quad 11:-140791579469\quad 12:-189224578545\quad 13:29350520291$ |
| $9$ | $14:-15929862776\quad 15:59881738541\quad 16:-39506902696\quad 17:-223941612418\quad 18:32096010817$ |
| $9$ | $19:-240553959096\quad 20:-79015836251\quad 21:-85506982716\quad 22:326844218914\quad 23:-38627849268$ |
| $9$ | $24:-54899026915\quad 25:-94949554514\quad 26:12415118569\quad 27:-27771452108\quad 28:22723986028$ |
| $9$ | $29:21373557619\quad 30:-104129327743\quad 31:-222579761259\quad 32:-533554360292\quad 33:94052558092$ |
| $9$ | $34:199575774170\quad 35:-446607750407$ |
| $10$ | $10:1981196916462\quad 11:-291920884084\quad 12:-95495992943\quad 13:72440714934\quad 14:99781142152$ |
| $10$ | $15:271347379848\quad 16:67773002599\quad 17:243566639539\quad 18:-62283874376\quad 19:-119528476532$ |
| $10$ | $20:-38462508331\quad 21:-519537881282\quad 22:517996655999\quad 23:56136049360\quad 24:70653169165$ |
| $10$ | $25:-22564528597\quad 26:31028461221\quad 27:-78213668407\quad 28:9599233114\quad 29:50682451201$ |
| $10$ | $30:93332330942\quad 31:337147364347\quad 32:135252332144\quad 33:-31841063214\quad 34:34223516819$ |
| $10$ | $35:118935464145$ |
| $11$ | $11:257653819701\quad 12:103950750231\quad 13:165331489521\quad 14:-46595009149\quad 15:-341970503848$ |
| $11$ | $16:-11993373125\quad 17:-110449199206\quad 18:29353503860\quad 19:-85867963560\quad 20:49500285770$ |
| $11$ | $21:71907635410\quad 22:-70334821008\quad 23:297149735\quad 24:36477314233\quad 25:22725103728$ |
| $11$ | $26:7840333088\quad 27:14515771200\quad 28:-69192119013\quad 29:-31281010006\quad 30:-39832145409$ |
| $11$ | $31:-18176205867\quad 32:-40603030409\quad 33:-96057053912\quad 34:-211167847041\quad 35:-26273180590$ |
| $12$ | $12:1727121659948\quad 13:827099298661\quad 14:-98412105590\quad 15:11420234286\quad 16:166032288456$ |
| $12$ | $17:249645013569\quad 18:48809646680\quad 19:86325992395\quad 20:16231942805\quad 21:13606980274$ |
| $12$ | $22:-34625134084\quad 23:-9858030339\quad 24:965086509454\quad 25:1109823616600\quad 26:-246591287081$ |
| $12$ | $27:-26956041179\quad 28:-66934186910\quad 29:-233151626131\quad 30:415897819279\quad 31:964469445165$ |
| $12$ | $32:511962261177\quad 33:-111609362345\quad 34:-87431596533\quad 35:-99627593733$ |
| $13$ | $13:2396804382663\quad 14:-316786358117\quad 15:164294911885\quad 16:-42556730432\quad 17:132458593065$ |
| $13$ | $18:29271882453\quad 19:-58345594037\quad 20:66930124415\quad 21:-16883292197\quad 22:159298721071$ |
| $13$ | $23:117308212453\quad 24:1352208028961\quad 25:866958732950\quad 26:-108725207952\quad 27:78454216830$ |
| $13$ | $28:26342577670\quad 29:-80735103890\quad 30:542296184240\quad 31:1059264084643\quad 32:312007491485$ |
| $13$ | $33:-69294936043\quad 34:74158906969\quad 35:66388354463$ |
| $14$ | $14:319420341357\quad 15:-87925637622\quad 16:76977835963\quad 17:-114211046964\quad 18:41029738865$ |
| $14$ | $19:-74263576584\quad 20:84403905136\quad 21:-66008164083\quad 22:46816007189\quad 23:-26162688891$ |
| $14$ | $24:-145798652687\quad 25:-53560719330\quad 26:31811954300\quad 27:-9285929417\quad 28:-24807936118$ |
| $14$ | $29:-2918686580\quad 30:8460778195\quad 31:26008819361\quad 32:-61796308421\quad 33:-36480268763$ |
| $14$ | $34:-76531885803\quad 35:-17091359933$ |
| $15$ | $15:2859975942868\quad 16:-274434450535\quad 17:1430304312472\quad 18:28539098829\quad 19:670063938586$ |
| $15$ | $20:-82370063031\quad 21:371579755825\quad 22:-184768020953\quad 23:-21171590533\quad 24:395683818289$ |
| $15$ | $25:418260662721\quad 26:-38906659861\quad 27:-78040430598\quad 28:444945437443\quad 29:8078140870$ |
| $15$ | $30:1029737245190\quad 31:1563115346860\quad 32:650542723544\quad 33:204005915360\quad 34:1817494457550$ |
| $15$ | $35:1101421060929$ |
| $16$ | $16:644017872543\quad 17:-437350534609\quad 18:26920105084\quad 19:26129738852\quad 20:79630947869$ |
| $16$ | $21:124704599490\quad 22:23857590659\quad 23:90596345218\quad 24:118270107132\quad 25:107897751806$ |
| $16$ | $26:-41125880623\quad 27:207578570513\quad 28:70223566851\quad 29:-48735179156\quad 30:27187080371$ |
| $16$ | $31:175610224066\quad 32:500565971435\quad 33:-24541093682\quad 34:-178247104356\quad 35:352220787088$ |
| $17$ | $17:2291638109215\quad 18:11496597229\quad 19:549851750691\quad 20:-88286423927\quad 21:-118566415253$ |
| $17$ | $22:-255377984751\quad 23:238791034791\quad 24:689957052067\quad 25:384455250352\quad 26:8709490658$ |
| $17$ | $27:85397600339\quad 28:411030597849\quad 29:-52885496264\quad 30:745513470383\quad 31:787522395488$ |
| $17$ | $32:234392178086\quad 33:334919550315\quad 34:1298444510866\quad 35:59754101887$ |
| $18$ | $18:263075206307\quad 19:-141265790011\quad 20:-135683566090\quad 21:110495721846\quad 22:-113104657414$ |
| $18$ | $23:28110537798\quad 24:40111243068\quad 25:38967179003\quad 26:-3947529960\quad 27:273566913445$ |
| $18$ | $28:105869522423\quad 29:29181492323\quad 30:63844193937\quad 31:52191506845\quad 32:278762161468$ |
| $18$ | $33:126127458621\quad 34:256214918368\quad 35:-26128392992$ |
| $19$ | $19:1661885318910\quad 20:-165260094368\quad 21:153693485014\quad 22:-295043829182\quad 23:-280194522252$ |
| $19$ | $24:18681219397\quad 25:-84550783\quad 26:-42262717529\quad 27:385133370790\quad 28:268120856360$ |
| $19$ | $29:13647248189\quad 30:100529783943\quad 31:139884328594\quad 32:480266579156\quad 33:234810987768$ |
| $19$ | $34:317832973439\quad 35:-69220042857$ |
| $20$ | $20:938344925827\quad 21:-153650260642\quad 22:193849637693\quad 23:34590966810\quad 24:188118467743$ |
| $20$ | $25:103358232026\quad 26:20142201779\quad 27:-275729192246\quad 28:-110115950244\quad 29:-64781238724$ |
| $20$ | $30:74031747016\quad 31:306491243287\quad 32:-4023793623\quad 33:-210440352888\quad 34:-212782386691$ |
| $20$ | $35:46524319205$ |
| $21$ | $21:958529772199\quad 22:-525484269617\quad 23:-188666245671\quad 24:-195099721078\quad 25:111471955007$ |
| $21$ | $26:-30803001067\quad 27:107020555952\quad 28:193935150799\quad 29:650732195\quad 30:116443934649$ |
| $21$ | $31:-74274515481\quad 32:-430790778936\quad 33:178078790491\quad 34:413782251637\quad 35:-316763849844$ |
| $22$ | $22:1404300816284\quad 23:-100869893365\quad 24:63172463982\quad 25:28687843825\quad 26:-6243939136$ |
| $22$ | $27:-226603255615\quad 28:-91341130519\quad 29:13560877221\quad 30:-25489976819\quad 31:94459555626$ |
| $22$ | $32:38459141472\quad 33:-126357092303\quad 34:-114894946900\quad 35:109364730817$ |
| $23$ | $23:553310365653\quad 24:287327878969\quad 25:86916634520\quad 26:497886018\quad 27:42596175263$ |
| $23$ | $28:-79227695445\quad 29:-26582223107\quad 30:23708793292\quad 31:165737028128\quad 32:-38156072298$ |
| $23$ | $33:-44836845871\quad 34:-118808486050\quad 35:-54950000901$ |
| $24$ | $24:1790449499765\quad 25:641348135982\quad 26:-66123898652\quad 27:73782347943\quad 28:153309366312$ |
| $24$ | $29:-188748600851\quad 30:404371263532\quad 31:978686279540\quad 32:625220206622\quad 33:12281336331$ |
| $24$ | $34:76135825695\quad 35:-47692035515$ |
| $25$ | $25:1920474659654\quad 26:-404382331248\quad 27:-75317937445\quad 28:-95843287524\quad 29:-157144870044$ |
| $25$ | $30:990781823744\quad 31:938671023761\quad 32:245330570886\quad 33:-76721335225\quad 34:210750541855$ |
| $25$ | $35:-123513706888$ |
| $26$ | $26:240554326500\quad 27:3775440706\quad 28:190083486624\quad 29:-235706136605\quad 30:-114780176966$ |
| $26$ | $31:-89070468418\quad 32:-73559952866\quad 33:9413079250\quad 34:85982380970\quad 35:41490749859$ |
| $27$ | $27:1349803906887\quad 28:13718278089\quad 29:40997227227\quad 30:-229728351899\quad 31:-281646257148$ |
| $27$ | $32:528586633158\quad 33:258755084188\quad 34:319107227041\quad 35:-200974505827$ |
| $28$ | $28:814451382224\quad 29:-300481250170\quad 30:294682836872\quad 31:311477271777\quad 32:356587178767$ |
| $28$ | $33:389798374974\quad 34:320775497506\quad 35:155668760902$ |
| $29$ | $29:1028533455459\quad 30:-110024395925\quad 31:-75151237682\quad 32:82331563810\quad 33:116035946531$ |
| $29$ | $34:-66901690678\quad 35:116420423745$ |
| $30$ | $30:1061499898272\quad 31:1145515017938\quad 32:603272504582\quad 33:37947532145\quad 34:875932586596$ |
| $30$ | $35:709998789089$ |
| $31$ | $31:2745625342037\quad 32:1156673214442\quad 33:-90893172704\quad 34:849527371917\quad 35:1321614995726$ |
| $32$ | $32:3265756642347\quad 33:12479104906\quad 34:599562730432\quad 35:2879585356012$ |
| $33$ | $33:454404278642\quad 34:299326114351\quad 35:-347347204577$ |
| $34$ | $34:3204982051824\quad 35:511016973379$ |
| $35$ | $35:5168603182602$ |

**Lower-triangular witness $C^{(13)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-13-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:6922928838028$ |
| $1$ | $0:-4677697908278\quad 1:14687690875631$ |
| $2$ | $0:-7353249406865\quad 1:-270716805773\quad 2:13772153361719$ |
| $3$ | $0:-274616471956\quad 1:-933204388226\quad 2:-3514196576126\quad 3:7051233656451$ |
| $4$ | $0:-3768722647066\quad 1:5066749036699\quad 2:-7373070501288\quad 3:3071583850167\quad 4:16898082912734$ |
| $5$ | $0:-13787701981289\quad 1:5895414036411\quad 2:9948618590136\quad 3:65752857335\quad 4:6240838188634$ |
| $5$ | $5:16546214368123$ |
| $6$ | $0:-1944445838668\quad 1:707238276054\quad 2:-8337994816776\quad 3:3559707368182\quad 4:8066067776765$ |
| $6$ | $5:5874482547480\quad 6:10970345012040$ |
| $7$ | $0:-40166040256\quad 1:965784639044\quad 2:3205816640365\quad 3:2891694482663\quad 4:1441425574898$ |
| $7$ | $5:-770994415390\quad 6:-3929700305918\quad 7:6702586134488$ |
| $8$ | $0:1337557055611\quad 1:-1737605216352\quad 2:-1528607990277\quad 3:3772125018825\quad 4:2475862744101$ |
| $8$ | $5:1916847006391\quad 6:6717563276699\quad 7:-2039851534081\quad 8:10763407685823$ |
| $9$ | $0:23852772181\quad 1:74298835214\quad 2:-4453516309661\quad 3:-2763242101416\quad 4:77662132568$ |
| $9$ | $5:-169184760197\quad 6:-1591554379499\quad 7:653673028672\quad 8:-426368285169\quad 9:7640866863005$ |
| $10$ | $0:-2496469599711\quad 1:-381888276921\quad 2:-151487236878\quad 3:-2187131867940\quad 4:-601439582342$ |
| $10$ | $5:-569770714837\quad 6:1001447926607\quad 7:-2173832111687\quad 8:217212437490\quad 9:4754384398830$ |
| $10$ | $10:12564586099197$ |
| $11$ | $0:227655166429\quad 1:603991257621\quad 2:535253639266\quad 3:979463815064\quad 4:-1446231160456$ |
| $11$ | $5:-278409100052\quad 6:-1552991957148\quad 7:2282945868897\quad 8:-745861856545\quad 9:-1734878527273$ |
| $11$ | $10:-976552258633\quad 11:3128962136175$ |
| $12$ | $0:902622286679\quad 1:4646212361202\quad 2:369107216497\quad 3:467213305803\quad 4:-1656766389570$ |
| $12$ | $5:-2053354808305\quad 6:1134251239571\quad 7:1645860193453\quad 8:11162213943\quad 9:-2072925607618$ |
| $12$ | $10:452420827672\quad 11:-441574647677\quad 12:11588885660530$ |
| $13$ | $0:-697791867145\quad 1:3813568940777\quad 2:-1635088055914\quad 3:1012598724541\quad 4:-1837092058726$ |
| $13$ | $5:-1001029482280\quad 6:1043628773305\quad 7:2528776524103\quad 8:4288732400901\quad 9:-731770273$ |
| $13$ | $10:857493922971\quad 11:3585558658065\quad 12:4871274958686\quad 13:12384523649192$ |
| $14$ | $0:1151250767944\quad 1:-224978919380\quad 2:841712261885\quad 3:254267187340\quad 4:928744735625$ |
| $14$ | $5:205709598535\quad 6:-1249827064894\quad 7:-187509177492\quad 8:740444066615\quad 9:164801773179$ |
| $14$ | $10:1116259153479\quad 11:-1172740460218\quad 12:-627041244517\quad 13:-1782959393066\quad 14:4530109458410$ |
| $15$ | $0:-186981241464\quad 1:3143990871467\quad 2:-1754456166379\quad 3:-2898397156859\quad 4:6652102495849$ |
| $15$ | $5:4398637282053\quad 6:8305811619288\quad 7:218354228677\quad 8:5964860009043\quad 9:756953179037$ |
| $15$ | $10:1196460872691\quad 11:-670962319682\quad 12:-30846126219\quad 13:-990938900476\quad 14:-2376850700746$ |
| $15$ | $15:9343440783049$ |
| $16$ | $0:-2650553165750\quad 1:3310830475420\quad 2:-1297168845848\quad 3:-448048721463\quad 4:-1843672069926$ |
| $16$ | $5:793749048406\quad 6:-990090560277\quad 7:-4213083049951\quad 8:-851357340226\quad 9:-1316056174134$ |
| $16$ | $10:-169799074635\quad 11:347962854776\quad 12:728745197291\quad 13:-993615375260\quad 14:2726581458376$ |
| $16$ | $15:-1281839871012\quad 16:2927356431309$ |
| $17$ | $0:2417761383976\quad 1:1528082237976\quad 2:-1813794723659\quad 3:6104144330785\quad 4:1628797605364$ |
| $17$ | $5:2818297240900\quad 6:8379054398367\quad 7:3463903882516\quad 8:3432184028583\quad 9:-116577140796$ |
| $17$ | $10:3628037949355\quad 11:-1080428307130\quad 12:378113965064\quad 13:-2222988225889\quad 14:-3625119712096$ |
| $17$ | $15:2498855039891\quad 16:-1361117702185\quad 17:5931549771801$ |
| $18$ | $0:-950683679565\quad 1:1592381229692\quad 2:-1235407932821\quad 3:875896973441\quad 4:2156061513321$ |
| $18$ | $5:-744404681226\quad 6:-813579251940\quad 7:1955639604698\quad 8:225271984698\quad 9:-358358612808$ |
| $18$ | $10:105722378497\quad 11:-375296724861\quad 12:-243678453488\quad 13:-494225273230\quad 14:479801329226$ |
| $18$ | $15:-803153951452\quad 16:993101314444\quad 17:-919814268778\quad 18:2746456400827$ |
| $19$ | $0:1625864604526\quad 1:925105319324\quad 2:235169787546\quad 3:3393904534513\quad 4:2239646552327$ |
| $19$ | $5:-98873759071\quad 6:-1163069765681\quad 7:-5097958396568\quad 8:2397575827220\quad 9:-1495184198148$ |
| $19$ | $10:-168797859883\quad 11:-285292270459\quad 12:969536869678\quad 13:-565070260628\quad 14:-3685286682497$ |
| $19$ | $15:5192199255941\quad 16:971209586069\quad 17:3144408037247\quad 18:-2169031644413\quad 19:7301987007610$ |
| $20$ | $0:236509355377\quad 1:131600432587\quad 2:1076056189803\quad 3:-3034619222646\quad 4:-542489338541$ |
| $20$ | $5:-319598978177\quad 6:-544010422972\quad 7:-555529337937\quad 8:790717110960\quad 9:-1529623291296$ |
| $20$ | $10:-298473657406\quad 11:1408605275007\quad 12:-54132466566\quad 13:316621336916\quad 14:2214376614464$ |
| $20$ | $15:-271958992019\quad 16:-1143732131010\quad 17:4506065441391\quad 18:-1461238200499\quad 19:-2673577656209$ |
| $20$ | $20:6432619482760$ |
| $21$ | $0:-167718959355\quad 1:-82390486530\quad 2:-4319621631363\quad 3:-673277740319\quad 4:1029276673924$ |
| $21$ | $5:-752213902218\quad 6:1056435436734\quad 7:-169805755744\quad 8:-58740324463\quad 9:-3674764075005$ |
| $21$ | $10:-3046937456028\quad 11:1330511442158\quad 12:-224789521921\quad 13:-663832738486\quad 14:475531035247$ |
| $21$ | $15:2538230325914\quad 16:1644398893761\quad 17:-2423779339998\quad 18:644426709264\quad 19:1006935169069$ |
| $21$ | $20:-621483364600\quad 21:5640914145071$ |
| $22$ | $0:-1323259112658\quad 1:981708022453\quad 2:-232636479306\quad 3:-3047661428223\quad 4:-1062861268035$ |
| $22$ | $5:186022294072\quad 6:-1810557461043\quad 7:70840310732\quad 8:550990760997\quad 9:2696893338306$ |
| $22$ | $10:2440381292519\quad 11:-384005329447\quad 12:-38899773802\quad 13:890232327484\quad 14:801713419211$ |
| $22$ | $15:-1658538112545\quad 16:-2894489971452\quad 17:798173529289\quad 18:-2974198066023\quad 19:-1128198220469$ |
| $22$ | $20:-421775802218\quad 21:-3687812063237\quad 22:8552577089280$ |
| $23$ | $0:-7936409226\quad 1:8225668186\quad 2:-113020462874\quad 3:328707647953\quad 4:-2165380612206$ |
| $23$ | $5:301395670368\quad 6:3187566759495\quad 7:-76527418419\quad 8:-173353057795\quad 9:236911690832$ |
| $23$ | $10:57372774066\quad 11:696741519508\quad 12:-587820209121\quad 13:438169559077\quad 14:1010998309466$ |
| $23$ | $15:-1144919329701\quad 16:1429682555960\quad 17:1474076666085\quad 18:3270774713811\quad 19:-1146178502936$ |
| $23$ | $20:-199831311271\quad 21:-3053204162975\quad 22:-1075307548259\quad 23:3173587836462$ |
| $24$ | $0:1678381118274\quad 1:5012450442771\quad 2:-1277914295953\quad 3:531840034673\quad 4:-2268056660689$ |
| $24$ | $5:361174965252\quad 6:2164767541801\quad 7:533981336954\quad 8:5656542505806\quad 9:-573056907963$ |
| $24$ | $10:1072028159942\quad 11:1162109370475\quad 12:5553151681048\quad 13:4104894735271\quad 14:-603284721990$ |
| $24$ | $15:-1303596026305\quad 16:693685105035\quad 17:3595555007916\quad 18:2017945786999\quad 19:-2283624738752$ |
| $24$ | $20:-644453301884\quad 21:-1396831533065\quad 22:-628199960568\quad 23:-1022314512627\quad 24:5278584447244$ |
| $25$ | $0:1722135214103\quad 1:6366866985786\quad 2:-1006617517992\quad 3:-37787489872\quad 4:-1218494230009$ |
| $25$ | $5:-254654124377\quad 6:2655396305723\quad 7:677608499468\quad 8:2170704873230\quad 9:-1287307768495$ |
| $25$ | $10:622684580439\quad 11:-208285297360\quad 12:6083424374200\quad 13:1316125491706\quad 14:752122696691$ |
| $25$ | $15:-246284362304\quad 16:-2995284361617\quad 17:-1539376249645\quad 18:-183396123242\quad 19:10614641325$ |
| $25$ | $20:1458616769745\quad 21:1462124222559\quad 22:-137714607156\quad 23:3811481605575\quad 24:-3488013661640$ |
| $25$ | $25:7067545587084$ |
| $26$ | $0:-455218598679\quad 1:-1391790979688\quad 2:31801711362\quad 3:417884719990\quad 4:-153316640721$ |
| $26$ | $5:344024434101\quad 6:-160175252759\quad 7:758611804888\quad 8:110039279144\quad 9:264150757449$ |
| $26$ | $10:237748754789\quad 11:-10253834187\quad 12:-1567787553954\quad 13:-76209388815\quad 14:386619365190$ |
| $26$ | $15:212530475021\quad 16:946042883438\quad 17:161965033062\quad 18:-418497729644\quad 19:8888912640$ |
| $26$ | $20:498682897238\quad 21:-379642160361\quad 22:-31952030085\quad 23:-735773921258\quad 24:1492116815181$ |
| $26$ | $25:-1520233661908\quad 26:3409747546044$ |
| $27$ | $0:557848047330\quad 1:1830762629642\quad 2:-3960238786131\quad 3:4377410151290\quad 4:1992861717605$ |
| $27$ | $5:1422982277195\quad 6:-3705688280061\quad 7:-1551448254938\quad 8:-1370905101156\quad 9:-1812597598629$ |
| $27$ | $10:1154663342817\quad 11:-1253847796217\quad 12:-356079985118\quad 13:1157856538414\quad 14:-1238149720290$ |
| $27$ | $15:1006629204354\quad 16:2901802505830\quad 17:-292951649343\quad 18:3943346877100\quad 19:510228555777$ |
| $27$ | $20:477968947902\quad 21:-2059035710842\quad 22:170869217528\quad 23:-443699063928\quad 24:-607844781460$ |
| $27$ | $25:291823558063\quad 26:284518919293\quad 27:5718954838400$ |
| $28$ | $0:-1287197955199\quad 1:2114864552396\quad 2:-2322726328864\quad 3:1013580570844\quad 4:2821422051971$ |
| $28$ | $5:591689806583\quad 6:835612907151\quad 7:-35336096183\quad 8:1711183740024\quad 9:-449419930697$ |
| $28$ | $10:263002319487\quad 11:-407824709066\quad 12:-968508654749\quad 13:-609231657822\quad 14:-924583080582$ |
| $28$ | $15:-548259612976\quad 16:830413454945\quad 17:1396156704501\quad 18:-1258786650988\quad 19:800661931187$ |
| $28$ | $20:-1188408126709\quad 21:1584891277363\quad 22:-276075121776\quad 23:469472417238\quad 24:978956319792$ |
| $28$ | $25:-1927968306466\quad 26:4625639720598\quad 27:-2076140690149\quad 28:3819078932932$ |
| $29$ | $0:-715460136885\quad 1:-430972701016\quad 2:-228239566495\quad 3:-551925639900\quad 4:1940468666000$ |
| $29$ | $5:-64586712986\quad 6:-631904472146\quad 7:-219837152286\quad 8:-233716166482\quad 9:-193488053195$ |
| $29$ | $10:328838188163\quad 11:24891992364\quad 12:-1441060505621\quad 13:454019559346\quad 14:-459073747636$ |
| $29$ | $15:-729991938410\quad 16:-819349453125\quad 17:563911093821\quad 18:-143036868116\quad 19:197708075004$ |
| $29$ | $20:-1511932553452\quad 21:194428361158\quad 22:-508244753967\quad 23:959490702949\quad 24:-875726760266$ |
| $29$ | $25:-834223959647\quad 26:-6917788683882\quad 27:834240678152\quad 28:-1783854203487\quad 29:6050310850971$ |
| $30$ | $0:-1860085692108\quad 1:5167898480437\quad 2:-575744329160\quad 3:663669676470\quad 4:1147040210156$ |
| $30$ | $5:1788091690132\quad 6:4219562696572\quad 7:2004320032338\quad 8:3687305200774\quad 9:-561671920690$ |
| $30$ | $10:934133198868\quad 11:-64262967742\quad 12:1293536600724\quad 13:270424425986\quad 14:1373019574623$ |
| $30$ | $15:1835842189534\quad 16:-2028053426459\quad 17:-267753873635\quad 18:-1695664076414\quad 19:401526384532$ |
| $30$ | $20:920273813845\quad 21:1055382611716\quad 22:-800325517585\quad 23:1463235399523\quad 24:-1722340083316$ |
| $30$ | $25:2632303279066\quad 26:816954210055\quad 27:-1229041911435\quad 28:468795482640\quad 29:169973104883$ |
| $30$ | $30:1673340581788$ |
| $31$ | $0:-2044505925072\quad 1:8065587668990\quad 2:294341130599\quad 3:-2739676969189\quad 4:3071643231553$ |
| $31$ | $5:2133241713676\quad 6:5868681022108\quad 7:2290152354915\quad 8:2624560789147\quad 9:-2615319122228$ |
| $31$ | $10:3165375817397\quad 11:1833048367094\quad 12:4742427842922\quad 13:2358788097860\quad 14:3526190298741$ |
| $31$ | $15:4143924190318\quad 16:-922772219315\quad 17:1064033969047\quad 18:-2499861979933\quad 19:288774644832$ |
| $31$ | $20:721061667952\quad 21:-3722093379871\quad 22:-2275617972563\quad 23:643508954307\quad 24:308643309244$ |
| $31$ | $25:-1379152763926\quad 26:652568864374\quad 27:-1759968510757\quad 28:-504560529697\quad 29:552323466720$ |
| $31$ | $30:-1598816952091\quad 31:4730387387553$ |
| $32$ | $0:-8903314281612\quad 1:9425969104168\quad 2:6778495357181\quad 3:2214513406001\quad 4:5691997744020$ |
| $32$ | $5:4373917071826\quad 6:-1403056483028\quad 7:-2150346921125\quad 8:1670922936619\quad 9:-2271086614055$ |
| $32$ | $10:1102234970592\quad 11:-946444562243\quad 12:2571422258573\quad 13:191703336752\quad 14:-2134537775125$ |
| $32$ | $15:-847676322492\quad 16:1232833328375\quad 17:1928076959143\quad 18:1760837439352\quad 19:408944552854$ |
| $32$ | $20:38386325808\quad 21:-2324136460716\quad 22:-521017377692\quad 23:-666683488313\quad 24:1948704526331$ |
| $32$ | $25:-333037067753\quad 26:284863747971\quad 27:2143824749301\quad 28:-397766048244\quad 29:14035186697$ |
| $32$ | $30:945519732773\quad 31:-859856224996\quad 32:1580331992806$ |
| $33$ | $0:459440228567\quad 1:21694767486\quad 2:-3713433602598\quad 3:1636190884894\quad 4:3541647711817$ |
| $33$ | $5:201857380538\quad 6:242086679168\quad 7:-486582620598\quad 8:393507439530\quad 9:-260928792526$ |
| $33$ | $10:245704801736\quad 11:-828567721817\quad 12:-455964290384\quad 13:-277810106692\quad 14:-1513763263498$ |
| $33$ | $15:-1561863808602\quad 16:570582661089\quad 17:762643075579\quad 18:-183411897515\quad 19:802597134221$ |
| $33$ | $20:-1202100075381\quad 21:691664901059\quad 22:-217300063732\quad 23:903853344479\quad 24:287830371620$ |
| $33$ | $25:-669853635134\quad 26:281972525967\quad 27:-573920169738\quad 28:1403491648406\quad 29:718674635254$ |
| $33$ | $30:433419082510\quad 31:-110798492564\quad 32:-207544068662\quad 33:1361773622859$ |
| $34$ | $0:-6245014114462\quad 1:1161791769095\quad 2:-6123247216745\quad 3:4961109574356\quad 4:5223784883253$ |
| $34$ | $5:3197427285216\quad 6:6446252556355\quad 7:2987881375875\quad 8:3353167447674\quad 9:2137244150349$ |
| $34$ | $10:-611872663817\quad 11:-1512447415299\quad 12:-135417668958\quad 13:-2072418941921\quad 14:-200375182332$ |
| $34$ | $15:5685525102138\quad 16:-2021219607580\quad 17:-2194850737528\quad 18:-165929826135\quad 19:1182985925516$ |
| $34$ | $20:4106483803235\quad 21:-5169942540\quad 22:1450434868465\quad 23:-1620135902225\quad 24:2348374388838$ |
| $34$ | $25:883306515904\quad 26:-443731968207\quad 27:1425806150141\quad 28:-2414910040844\quad 29:-1028812623080$ |
| $34$ | $30:-1436345580880\quad 31:-789446044547\quad 32:-1351430306540\quad 33:1873945476710\quad 34:4419878363488$ |
| $35$ | $0:-10722910079738\quad 1:4988765353935\quad 2:10873557066640\quad 3:-1454372235118\quad 4:6468543624865$ |
| $35$ | $5:9025726403000\quad 6:4254468055268\quad 7:-506448360181\quad 8:-2151893805894\quad 9:895257305134$ |
| $35$ | $10:-1163741381837\quad 11:3466940840617\quad 12:206934156866\quad 13:1124858120740\quad 14:2048399053272$ |
| $35$ | $15:1201292673446\quad 16:1858612602331\quad 17:1322472684800\quad 18:-2414403729082\quad 19:-700631073979$ |
| $35$ | $20:-2658935938899\quad 21:179092794602\quad 22:125472630108\quad 23:-2391868804814\quad 24:1079788367029$ |
| $35$ | $25:1618566854303\quad 26:765934870373\quad 27:4420750262226\quad 28:-113225886517\quad 29:422679646706$ |
| $35$ | $30:2819370765969\quad 31:348053570519\quad 32:2155528799604\quad 33:-3238584712658\quad 34:-2977689006665$ |
| $35$ | $35:2947134372667$ |

**Seed block 14: L1 d2 q2; dimension $36$.**

**Symmetric seed $S^{(14)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-14-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:454377030781\quad 1:299296294827\quad 2:-347349613041\quad 3:37919314968\quad 4:-90929352874$ |
| $0$ | $5:12479768965\quad 6:258751018135\quad 7:389761941262\quad 8:116035526951\quad 9:12270760276$ |
| $0$ | $10:-76728611212\quad 11:9412485718\quad 12:178064192976\quad 13:-126378943061\quad 14:-44843842754$ |
| $0$ | $15:126113089622\quad 16:234797953844\quad 17:-210445419887\quad 18:203936561809\quad 19:-24563281790$ |
| $0$ | $20:334872800777\quad 21:-111612095030\quad 22:-69300866390\quad 23:-36476267665\quad 24:94045046975$ |
| $0$ | $25:-31865683809\quad 26:-96055337394\quad 27:683104689732\quad 28:-64315497201\quad 29:284316152897$ |
| $0$ | $30:244386240483\quad 31:906273589253\quad 32:-176017487072\quad 33:31820080125\quad 34:-18311662770$ |
| $0$ | $35:-545253268967$ |
| $1$ | $1:3204920966352\quad 2:510996355886\quad 3:875918526678\quad 4:849543294764\quad 5:599567834350$ |
| $1$ | $6:319064809365\quad 7:320703976129\quad 8:-66903851398\quad 9:76141140153\quad 10:210746775406$ |
| $1$ | $11:85986300746\quad 12:413720113468\quad 13:-114927010219\quad 14:-118814208174\quad 15:256141585161$ |
| $1$ | $16:317810752335\quad 17:-212796355862\quad 18:1817425692244\quad 19:-178312451893\quad 20:1298428696984$ |
| $1$ | $21:-87434198868\quad 22:74163134163\quad 23:-76551404973\quad 24:199553524165\quad 25:34203041942$ |
| $1$ | $26:-211194951012\quad 27:2133146904575\quad 28:-41529395870\quad 29:1100665843436\quad 30:571239011031$ |
| $1$ | $31:1780738629322\quad 32:1178665933026\quad 33:-432328839171\quad 34:462773751473\quad 35:-387219507834$ |
| $2$ | $2:5168604833843\quad 3:710081099180\quad 4:1321620687053\quad 5:2879591946453\quad 6:-200995539864$ |
| $2$ | $7:155650940687\quad 8:116422368486\quad 9:-47675492601\quad 10:-123515712727\quad 11:41487713520$ |
| $2$ | $12:-316741870385\quad 13:109384525522\quad 14:-54950340863\quad 15:-26132927025\quad 16:-69216366865$ |
| $2$ | $17:46518405704\quad 18:1101435731423\quad 19:352209805739\quad 20:59739893000\quad 21:-99638957210$ |
| $2$ | $22:66399337145\quad 23:-17109968533\quad 24:-446586677871\quad 25:118955187401\quad 26:-26258583227$ |
| $2$ | $27:804087386576\quad 28:181517535379\quad 29:-53517817565\quad 30:-501810839917\quad 31:903554830353$ |
| $2$ | $32:4750475509245\quad 33:-742330036825\quad 34:1234310576221\quad 35:2272521157693$ |
| $3$ | $3:1061597424699\quad 4:1145615055771\quad 5:603333751397\quad 6:-229763468183\quad 7:294691900407$ |
| $3$ | $8:-110028247625\quad 9:404401259575\quad 10:990828590206\quad 11:-114772012153\quad 12:116423737718$ |
| $3$ | $13:-25504049320\quad 14:23716077466\quad 15:63829569687\quad 16:100522761229\quad 17:74040336378$ |
| $3$ | $18:1029707089911\quad 19:27189074110\quad 20:745521903097\quad 21:415920056437\quad 22:542333333064$ |
| $3$ | $23:8464279803\quad 24:-104152736215\quad 25:93323962667\quad 26:-39824795276\quad 27:804794725164$ |
| $3$ | $28:22662222545\quad 29:621291826745\quad 30:23879704166\quad 31:588618686762\quad 32:871818851025$ |
| $3$ | $33:-128809062853\quad 34:846121767627\quad 35:43542761776$ |
| $4$ | $4:2745729560025\quad 5:1156654888341\quad 6:-281678923096\quad 7:311456390202\quad 8:-75154784191$ |
| $4$ | $9:978715857981\quad 10:938675747523\quad 11:-89057325346\quad 12:-74288188597\quad 13:94459784040$ |
| $4$ | $14:165725615914\quad 15:52172472827\quad 16:139882049673\quad 17:306489260989\quad 18:1563109796558$ |
| $4$ | $19:175564861193\quad 20:787517937674\quad 21:964486579393\quad 22:1059296506216\quad 23:26007502944$ |
| $4$ | $24:-222570275181\quad 25:337152666212\quad 26:-18179852089\quad 27:991626025406\quad 28:-40368000358$ |
| $4$ | $29:471605523020\quad 30:-273212629886\quad 31:898918321571\quad 32:1329536743080\quad 33:-141543978354$ |
| $4$ | $34:1280267274035\quad 35:169011837997$ |
| $5$ | $5:3265745995761\quad 6:528579294227\quad 7:356571779790\quad 8:82329902799\quad 9:625216708492$ |
| $5$ | $10:245325135850\quad 11:-73559450178\quad 12:-430753073615\quad 13:38494891380\quad 14:-38169204402$ |
| $5$ | $15:278744411455\quad 16:480270745743\quad 17:-4023389772\quad 18:650552448141\quad 19:500524108569$ |
| $5$ | $20:234377557967\quad 21:511945078758\quad 22:312005096381\quad 23:-61799794940\quad 24:-533521131143$ |
| $5$ | $25:135315992643\quad 26:-40614115977\quad 27:315557724723\quad 28:335278109784\quad 29:51264883426$ |
| $5$ | $30:-145589335586\quad 31:1343227789858\quad 32:3538025750157\quad 33:-616358826808\quad 34:1800874572466$ |
| $5$ | $35:1562685372555$ |
| $6$ | $6:1349761092356\quad 7:13700614825\quad 8:40995583722\quad 9:73773633113\quad 10:-75312160186$ |
| $6$ | $11:3761381749\quad 12:107033637633\quad 13:-226609251325\quad 14:42586962786\quad 15:273546953080$ |
| $6$ | $16:385116770626\quad 17:-275728265972\quad 18:-78090433782\quad 19:207560805448\quad 20:85354969915$ |
| $6$ | $21:-26966621085\quad 22:78438091336\quad 23:-9291376190\quad 24:-27773750526\quad 25:-78227127417$ |
| $6$ | $26:14511677792\quad 27:325878599127\quad 28:76478176823\quad 29:-86960869696\quad 30:429202902810$ |
| $6$ | $31:834886157126\quad 32:-276501208\quad 33:38625198462\quad 34:242790744412\quad 35:-591394229345$ |
| $7$ | $7:814424790147\quad 8:-300479888175\quad 9:153314657488\quad 10:-95836524629\quad 11:190087742685$ |
| $7$ | $12:193923261546\quad 13:-91357786142\quad 14:-79220762005\quad 15:105853231229\quad 16:268103827250$ |
| $7$ | $17:-110115421488\quad 18:444856002469\quad 19:70213646853\quad 20:411002406119\quad 21:-66929067387$ |
| $7$ | $22:26342260183\quad 23:-24793226242\quad 24:22704089883\quad 25:9591721579\quad 26:-69181643010$ |
| $7$ | $27:623646194094\quad 28:-23298428558\quad 29:341983155446\quad 30:136872653853\quad 31:834767159577$ |
| $7$ | $32:345688974626\quad 33:-89112883648\quad 34:370824661410\quad 35:-230956769200$ |
| $8$ | $8:1028527939182\quad 9:-188744157846\quad 10:-157143194760\quad 11:-235709894863\quad 12:662582804$ |
| $8$ | $13:13557197982\quad 14:-26583836515\quad 15:29181054378\quad 16:13645443475\quad 17:-64783507123$ |
| $8$ | $18:8070958301\quad 19:-48736381324\quad 20:-52886658380\quad 21:-233149018795\quad 22:-80730850083$ |
| $8$ | $23:-2919260650\quad 24:21375875195\quad 25:50681484336\quad 26:-31277605440\quad 27:93640223748$ |
| $8$ | $28:11423144971\quad 29:-35724223739\quad 30:-24909342701\quad 31:332904981096\quad 32:160583984904$ |
| $8$ | $33:-49554701703\quad 34:-29819942197\quad 35:22350696328$ |
| $9$ | $9:1790433306658\quad 10:641341976144\quad 11:-66116236664\quad 12:-195098894781\quad 13:63172291381$ |
| $9$ | $14:287328735820\quad 15:40110243302\quad 16:18682303749\quad 17:188122401626\quad 18:395665721715$ |
| $9$ | $19:118258522521\quad 20:689920173637\quad 21:965078550693\quad 22:1352231034087\quad 23:-145808583257$ |
| $9$ | $24:-54902060448\quad 25:70651159877\quad 26:36479898090\quad 27:204050944649\quad 28:-62609253411$ |
| $9$ | $29:669025857358\quad 30:31021208336\quad 31:-81986501536\quad 32:-144458270706\quad 33:116171901611$ |
| $9$ | $34:657681716259\quad 35:-313023487317$ |
| $10$ | $10:1920479887511\quad 11:-404375838400\quad 12:111441541119\quad 13:28684596302\quad 14:86922295566$ |
| $10$ | $15:38966550306\quad 16:-79696202\quad 17:103360349913\quad 18:418207364574\quad 19:107889637166$ |
| $10$ | $20:384445155977\quad 21:1109807620688\quad 22:866971405903\quad 23:-53551094755\quad 24:-94945669826$ |
| $10$ | $25:-22564670487\quad 26:22725663756\quad 27:272169843908\quad 28:-47094978952\quad 29:289506073416$ |
| $10$ | $30:-31428698443\quad 31:124841024532\quad 32:-80449865617\quad 33:119230514416\quad 34:854585918826$ |
| $10$ | $35:-282517813464$ |
| $11$ | $11:240548428010\quad 12:-30786816410\quad 13:-6249752614\quad 14:494371842\quad 15:-3946488186$ |
| $11$ | $16:-42274654760\quad 17:20138625111\quad 18:-38901874690\quad 19:-41118882132\quad 20:8711530068$ |
| $11$ | $21:-246592273867\quad 22:-108708826641\quad 23:31808902044\quad 24:12414448162\quad 25:31025638136$ |
| $11$ | $26:7840499541\quad 27:1506872036\quad 28:52119182532\quad 29:21788754428\quad 30:42584036953$ |
| $11$ | $31:-68769999897\quad 32:31508485843\quad 33:-31528196296\quad 34:-183108254531\quad 35:41629692107$ |
| $12$ | $12:958462809518\quad 13:-525483241485\quad 14:-188683440525\quad 15:110482622221\quad 16:153724772198$ |
| $12$ | $17:-153625199352\quad 18:371494949488\quad 19:124703931816\quad 20:-118612940581\quad 21:13636843906$ |
| $12$ | $22:-16848497985\quad 23:-65982095593\quad 24:-85513196397\quad 25:-519529742272\quad 26:71936134890$ |
| $12$ | $27:493533312110\quad 28:-190895993603\quad 29:118957044544\quad 30:105548773562\quad 31:473842586164$ |
| $12$ | $32:-472122074312\quad 33:-11622455643\quad 34:-4233856401\quad 35:-582308342308$ |
| $13$ | $13:1404341208471\quad 14:-100861136815\quad 15:-113105955458\quad 16:-295067981966\quad 17:193841517228$ |
| $13$ | $18:-184804323757\quad 19:23853515668\quad 20:-255383439051\quad 21:-34640346206\quad 22:159295290386$ |
| $13$ | $23:46810558504\quad 24:326803659736\quad 25:517941906991\quad 26:-70329099134\quad 27:-329907203875$ |
| $13$ | $28:-26426045247\quad 29:-232697750309\quad 30:-212262917146\quad 31:-156468236096\quad 32:179638452213$ |
| $13$ | $33:-91618176100\quad 34:206089913638\quad 35:62644824588$ |
| $14$ | $14:553273084508\quad 15:28121034234\quad 16:-280158349179\quad 17:34587915903\quad 18:-21168014435$ |
| $14$ | $19:90598356018\quad 20:238775324738\quad 21:-9854760687\quad 22:117283580820\quad 23:-26153771547$ |
| $14$ | $24:-38607086155\quad 25:56150164687\quad 26:297071993\quad 27:214056149883\quad 28:-157961425627$ |
| $14$ | $29:163056140379\quad 30:27097421824\quad 31:-346749461044\quad 32:-94712776027\quad 33:-534875552$ |
| $14$ | $34:1573649019\quad 35:-15023880848$ |
| $15$ | $15:263061003103\quad 16:-141285221753\quad 17:-135667455584\quad 18:28493395324\quad 19:26933453242$ |
| $15$ | $20:11456858065\quad 21:48800786850\quad 22:29260549215\quad 23:41033014551\quad 24:32099507342$ |
| $15$ | $25:-62283859892\quad 26:29354105345\quad 27:204814015508\quad 28:201339589549\quad 29:-19674289829$ |
| $15$ | $30:92907136718\quad 31:598771640252\quad 32:114005858774\quad 33:-65815254502\quad 34:278353724987$ |
| $15$ | $35:-104537366748$ |
| $16$ | $16:1661799951376\quad 17:-165286123434\quad 18:670029869053\quad 19:26095402599\quad 20:549846378519$ |
| $16$ | $21:86313344418\quad 22:-58347780199\quad 23:-74276064337\quad 24:-240548527471\quad 25:-119542488815$ |
| $16$ | $26:-85871703951\quad 27:123370009298\quad 28:-148976004952\quad 29:467565394689\quad 30:217928753651$ |
| $16$ | $31:450946863964\quad 32:-20579951202\quad 33:112552945567\quad 34:59838541371\quad 35:-89678985357$ |
| $17$ | $17:938342112285\quad 18:-82391965822\quad 19:79641803369\quad 20:-88291091304\quad 21:16223580254$ |
| $17$ | $22:66933011841\quad 23:84399536827\quad 24:-79021077290\quad 25:-38473593523\quad 26:49502494009$ |
| $17$ | $27:-323648893307\quad 28:-73300861221\quad 29:-89713928222\quad 30:-253669513312\quad 31:-266469737941$ |
| $17$ | $32:-6532411658\quad 33:16366774361\quad 34:8271586543\quad 35:130444985305$ |
| $18$ | $18:2859831951258\quad 19:-274501482727\quad 20:1430197902239\quad 21:11407710871\quad 22:164313992620$ |
| $18$ | $23:-87955032679\quad 24:59856031468\quad 25:271291858839\quad 26:-341972988527\quad 27:1775039024832$ |
| $18$ | $28:-359376265734\quad 29:1304819952238\quad 30:-171601687892\quad 31:1330655110321\quad 32:1177598026840$ |
| $18$ | $33:-12931324457\quad 34:470525428253\quad 35:-236336076165$ |
| $19$ | $19:644006211301\quad 20:-437382460963\quad 21:166017404177\quad 22:-42565668178\quad 23:77002415772$ |
| $19$ | $24:-39510981294\quad 25:67771014536\quad 26:-11969020345\quad 27:-43625430066\quad 28:-297668974787$ |
| $19$ | $29:-192730726558\quad 30:-9626903735\quad 31:37916200538\quad 32:447555596253\quad 33:-183502580796$ |
| $19$ | $34:610209741012\quad 35:7302204438$ |
| $20$ | $20:2291596537312\quad 21:249627469665\quad 22:132441935432\quad 23:-114213804109\quad 24:-223933729180$ |
| $20$ | $25:243563103650\quad 26:-110459161882\quad 27:1548402543966\quad 28:36833534459\quad 29:1219732386613$ |
| $20$ | $30:473227748303\quad 31:582741981463\quad 32:148251415353\quad 33:167397395428\quad 34:111344893679$ |
| $20$ | $35:-431729138512$ |
| $21$ | $21:1727118678311\quad 22:827113776451\quad 23:-98440868940\quad 24:-189217873679\quad 25:-95494464633$ |
| $21$ | $26:103947736505\quad 27:-128657550582\quad 28:127532559147\quad 29:-93269916016\quad 30:-25873807591$ |
| $21$ | $31:-91451105270\quad 32:-256663618690\quad 33:62493357716\quad 34:640186269671\quad 35:-28132245881$ |
| $22$ | $22:2396832712576\quad 23:-316782803931\quad 24:29337899834\quad 25:72448715192\quad 26:165335981831$ |
| $22$ | $27:120412235525\quad 28:123692344535\quad 29:403044858209\quad 30:95171787565\quad 31:60744234799$ |
| $22$ | $32:-121252246695\quad 33:-48360378415\quad 34:592784920214\quad 35:-184204294182$ |
| $23$ | $23:319412312924\quad 24:-15925270086\quad 25:99774993037\quad 26:-46594646083\quad 27:-135231215325$ |
| $23$ | $28:80028157628\quad 29:42540502037\quad 30:-12706241610\quad 31:47903303424\quad 32:3909874595$ |
| $23$ | $33:79679779886\quad 34:-86884312800\quad 35:31884263518$ |
| $24$ | $24:890306448173\quad 25:398943040050\quad 26:-140795093511\quad 27:94726871642\quad 28:-113178691483$ |
| $24$ | $29:-204616797572\quad 30:-39097250446\quad 31:259464455645\quad 32:-466904848343\quad 33:1647284778$ |
| $24$ | $34:9801114277\quad 35:-615286456157$ |
| $25$ | $25:1981154618212\quad 26:-291932444038\quad 27:8433123656\quad 28:-260121451838\quad 29:2235436897$ |
| $25$ | $30:-138480603240\quad 31:-82928011223\quad 32:173391283278\quad 33:-172861664844\quad 34:60700691484$ |
| $25$ | $35:163802536305$ |
| $26$ | $26:257665651093\quad 27:-313309931612\quad 28:246561668392\quad 29:-251003383247\quad 30:43992777582$ |
| $26$ | $31:-231760997473\quad 32:-78192368553\quad 33:15736939435\quad 34:78069953630\quad 35:55362451817$ |
| $27$ | $27:3063924535627\quad 28:-516870269912\quad 29:1272661060112\quad 30:542682863759\quad 31:2196192090754$ |
| $27$ | $32:957956481883\quad 33:-134550157235\quad 34:194793902016\quad 35:-1007257952265$ |
| $28$ | $28:826127358546\quad 29:-337012284162\quad 30:82341125601\quad 31:146494994136\quad 32:345708742277$ |
| $28$ | $33:-2800790134\quad 34:143730288713\quad 35:441877956818$ |
| $29$ | $29:1963154208753\quad 30:332226954711\quad 31:508484369067\quad 32:35222388200\quad 33:92595163045$ |
| $29$ | $34:-317793846970\quad 35:-304159633510$ |
| $30$ | $30:630128018357\quad 31:438709487806\quad 32:-362151422771\quad 33:-19010327090\quad 34:-124223234073$ |
| $30$ | $35:-461256421932$ |
| $31$ | $31:3892148563386\quad 32:1141401132272\quad 33:-260876911746\quad 34:920480485527\quad 35:-752037015781$ |
| $32$ | $32:6365594635827\quad 33:-954515724595\quad 34:1510840616254\quad 35:2368046660023$ |
| $33$ | $33:479306825760\quad 34:-323861751141\quad 35:-509069701556$ |
| $34$ | $34:2375984147256\quad 35:304188372213$ |
| $35$ | $35:2438236181920$ |

**Lower-triangular witness $C^{(14)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-14-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:6740748703082$ |
| $1$ | $0:4440104623544\quad 1:17342939703729$ |
| $2$ | $0:-5152982678055\quad 1:4265679236984\quad 2:21728120571074$ |
| $3$ | $0:562538623501\quad 1:4906557006963\quad 2:2438179739369\quad 3:8707712711322$ |
| $4$ | $0:-1348950344825\quad 1:5243852062741\quad 2:4733145682923\quad 3:8963412763522\quad 4:11937749289072$ |
| $5$ | $0:185139211009\quad 1:3409730240571\quad 2:12627341486083\quad 3:1459793590695\quad 4:2109554450075$ |
| $5$ | $5:12201765545353$ |
| $6$ | $0:3838609471032\quad 1:856985812676\quad 2:-182937702728\quad 3:-3318268368273\quad 4:261789237289$ |
| $6$ | $5:4575313853874\quad 6:9352023858406$ |
| $7$ | $0:5782175815037\quad 1:368849350323\quad 2:2015229652586\quad 3:2238615465353\quad 4:620494325089$ |
| $7$ | $5:270872083652\quad 6:-1576805984494\quad 7:5987955431964$ |
| $8$ | $0:1721404135685\quad 1:-826480391820\quad 2:1106313024647\quad 3:-1218850262041\quad 4:404537601927$ |
| $8$ | $5:-189443944020\quad 6:-521938560657\quad 7:-6716856146032\quad 8:7135043194341$ |
| $9$ | $0:182038536319\quad 1:392427349965\quad 2:-253288222351\quad 3:4482212331991\quad 4:4781659023354$ |
| $9$ | $5:3910743799383\quad 6:216473364862\quad 7:154586543304\quad 8:-1844733780277\quad 9:10819880802591$ |
| $10$ | $0:-1138280250337\quad 1:1506593541197\quad 2:-1134187119043\quad 3:10920933399678\quad 4:-677583621072$ |
| $10$ | $5:1591166072301\quad 6:2617130858777\quad 7:-3607842975988\quad 8:-2836114089316\quad 9:581300465276$ |
| $10$ | $10:6057311179074$ |
| $11$ | $0:139635612194\quad 1:460050803588\quad 2:133738308039\quad 3:-1623743873513\quad 4:233835894427$ |
| $11$ | $5:-718106251679\quad 6:-287994540490\quad 7:3505774504580\quad 8:-335157275386\quad 9:100425098877$ |
| $11$ | $10:-1550706928474\quad 11:2387131904364$ |
| $12$ | $0:2641608533702\quad 1:1709225401755\quad 2:-1166830386770\quad 3:529978127811\quad 4:-1009903917513$ |
| $12$ | $5:-2729245675024\quad 6:1432328276824\quad 7:1382286235456\quad 8:1232252881977\quad 9:-561993085184$ |
| $12$ | $10:2176385410057\quad 11:-2316638291131\quad 12:7741810940631$ |
| $13$ | $0:-1874850237381\quad 1:-182677785230\quad 2:94652760409\quad 3:-95339702087\quad 4:693715155881$ |
| $13$ | $5:188498382085\quad 6:-1780432643892\quad 7:-249484917204\quad 8:190782306973\quad 9:360740269537$ |
| $13$ | $10:1059736011604\quad 11:653285945841\quad 12:-5662467418229\quad 13:9966884184237$ |
| $14$ | $0:-665265013269\quad 1:-514767087277\quad 2:-309612691899\quad 3:692084208872\quad 4:1142302438206$ |
| $14$ | $5:-118753387447\quad 6:1041240905280\quad 7:-642236822926\quad 8:-701819578654\quad 9:1798265631781$ |
| $14$ | $10:-1042345748473\quad 11:716827608104\quad 12:-1411646852256\quad 13:-1834118724889\quad 14:6367567226635$ |
| $15$ | $0:1870906262450\quad 1:997935717107\quad 2:127511313406\quad 3:14145614704\quad 4:148910570404$ |
| $15$ | $5:1817807253314\quad 6:1179642385778\quad 7:64457867624\quad 8:242641228450\quad 9:-405828087492$ |
| $15$ | $10:-34547784261\quad 11:143996803706\quad 12:1001865573732\quad 13:-24608306838\quad 14:877731129689$ |
| $15$ | $15:3879549539759$ |
| $16$ | $0:3483262233714\quad 1:940730162434\quad 2:322839710066\quad 3:308912255093\quad 4:792188485178$ |
| $16$ | $5:3112322539705\quad 6:1173165925593\quad 7:917791360681\quad 8:450092170255\quad 9:-1475327997925$ |
| $16$ | $10:-414077562290\quad 11:-2455368118624\quad 12:639473582968\quad 13:-1556529808597\quad 14:-3792708014215$ |
| $16$ | $15:-6847964842245\quad 16:8230372642463$ |
| $17$ | $0:-3121988805053\quad 1:-427705959021\quad 2:-442341858457\quad 3:1416829649658\quad 4:1514052946986$ |
| $17$ | $5:160417050213\quad 6:-1254489311894\quad 7:326787456851\quad 8:240608434250\quad 9:543786471671$ |
| $17$ | $10:-486847594976\quad 11:1060518516915\quad 12:-105132580427\quad 13:941404602236\quad 14:-101867271302$ |
| $17$ | $15:-1574980475846\quad 16:-1532880357576\quad 17:8381496547045$ |
| $18$ | $0:3025428936637\quad 1:9704776185000\quad 2:3881426076345\quad 3:5074597407584\quad 4:3823556274468$ |
| $18$ | $5:-2711206576545\quad 6:129731416739\quad 7:467080488286\quad 8:932811402934\quad 9:682585823232$ |
| $18$ | $10:-1630186583681\quad 11:-3259799735376\quad 12:680731095959\quad 13:-544328914913\quad 14:-300923226139$ |
| $18$ | $15:-2282218018395\quad 16:2818630172847\quad 17:-252065119131\quad 18:9536153315656$ |
| $19$ | $0:-364399903808\quad 1:-934862933768\quad 2:1718098878620\quad 3:381480297245\quad 4:872512377272$ |
| $19$ | $5:2394324802156\quad 6:1427818322284\quad 7:1038469457846\quad 8:191493914010\quad 9:-246551600131$ |
| $19$ | $10:1162703326595\quad 11:-1283296587257\quad 12:1923422610464\quad 13:1374518509660\quad 14:2358488040588$ |
| $19$ | $15:-1555568179516\quad 16:-1288260093734\quad 17:373638041048\quad 18:-2660287471733\quad 19:5014146144012$ |
| $20$ | $0:4967887330140\quad 1:6214916965399\quad 2:232996884535\quad 3:4673515364017\quad 4:826761079008$ |
| $20$ | $5:-834451517666\quad 6:351973494856\quad 7:-97036204987\quad 8:-592282344106\quad 9:3966433259664$ |
| $20$ | $10:-3204004004031\quad 11:-435917830774\quad 12:-3965796282875\quad 13:-3468798415618\quad 14:504276876755$ |
| $20$ | $15:-2142301987604\quad 16:2434056383317\quad 17:276877385742\quad 18:1899614215817\quad 19:-3432130532828$ |
| $20$ | $20:7868488408299$ |
| $21$ | $0:-1655781871515\quad 1:-80238711965\quad 2:-835499709077\quad 3:5162577437518\quad 4:4382407305277$ |
| $21$ | $5:3732539038622\quad 6:265308313324\quad 7:-1715869569193\quad 8:-3611292898065\quad 9:2909748448422$ |
| $21$ | $10:4969378939541\quad 11:-815088379509\quad 12:1569425411651\quad 13:-593847664435\quad 14:-2006663006131$ |
| $21$ | $15:766063778145\quad 16:122260334476\quad 17:-1565569726884\quad 18:-1683665235661\quad 19:-278759474551$ |
| $21$ | $20:2550292530286\quad 21:6346869197095$ |
| $22$ | $0:-1028088561710\quad 1:690836409354\quad 2:-73852469558\quad 3:5926023504846\quad 4:4033618472189$ |
| $22$ | $5:1049678812751\quad 6:2672176742437\quad 7:-562282021393\quad 8:-314318703650\quad 9:7772263920915$ |
| $22$ | $10:1042703930831\quad 11:783161829825\quad 12:621531717153\quad 13:1553191451298\quad 14:-1616976556853$ |
| $22$ | $15:631382812186\quad 16:46462688720\quad 17:-1474549934861\quad 18:-3092887596293\quad 19:-3942023610817$ |
| $22$ | $20:-5305293466872\quad 21:-3937985497\quad 22:7399304319140$ |
| $23$ | $0:-541130804184\quad 1:-302858869455\quad 2:-147621406654\quad 3:344149708220\quad 4:89874274222$ |
| $23$ | $5:-317580616068\quad 6:422590496951\quad 7:164492334727\quad 8:308473345790\quad 9:-1356676016723$ |
| $23$ | $10:-1275060526836\quad 11:642059158132\quad 12:-451381908575\quad 13:326613999575\quad 14:-480748654647$ |
| $23$ | $15:1445271626733\quad 16:332065326673\quad 17:978655649085\quad 18:-327879340795\quad 19:2423968803101$ |
| $23$ | $20:432866752087\quad 21:-69297660681\quad 22:-1800854644180\quad 23:3743174472715$ |
| $24$ | $0:1395172125791\quad 1:793443467210\quad 2:-1880233735824\quad 3:-1206842712981\quad 4:-403665722636$ |
| $24$ | $5:-2455398173243\quad 6:-194777818176\quad 7:168642066350\quad 8:242477092596\quad 9:1004961098963$ |
| $24$ | $10:1122705332594\quad 11:-679212174509\quad 12:-3353404053814\quad 13:1585122066270\quad 14:-564860135890$ |
| $24$ | $15:2368120423100\quad 16:-217348307234\quad 17:63600679046\quad 18:1052027643835\quad 19:3416448226073$ |
| $24$ | $20:-2866205414017\quad 21:728102109800\quad 22:826621808099\quad 23:-2368163719997\quad 24:4986186765955$ |
| $25$ | $0:-472732113488\quad 1:318243869337\quad 2:372881402959\quad 3:818549371862\quad 4:1868597863206$ |
| $25$ | $5:220351053809\quad 6:-533978827797\quad 7:-178654129708\quad 8:635907457169\quad 9:-464758025265$ |
| $25$ | $10:-1328694485997\quad 11:1128813475871\quad 12:-5591014943089\quad 13:1779262177425\quad 14:-344718495548$ |
| $25$ | $15:-93209004428\quad 16:-814937434455\quad 17:-1801122694825\quad 18:2203615838517\quad 19:4379249254599$ |
| $25$ | $20:1954479413935\quad 21:-912003162200\quad 22:4274223109558\quad 23:613310079647\quad 24:2222682447157$ |
| $25$ | $25:9936422904999$ |
| $26$ | $0:-1424995080296\quad 1:-852933130678\quad 2:-291350285958\quad 3:196890353791\quad 4:29035304098$ |
| $26$ | $5:200052317699\quad 6:783707559341\quad 7:491977192901\quad 8:409576203457\quad 9:265665778365$ |
| $26$ | $10:-18603008128\quad 11:190037101448\quad 12:1404001488412\quad 13:-68436215955\quad 14:-91521098069$ |
| $26$ | $15:983425264643\quad 16:151269883801\quad 17:239214278761\quad 18:-2149021920111\quad 19:-2082515871593$ |
| $26$ | $20:456602668152\quad 21:-120635750340\quad 22:-454676966319\quad 23:-1025212986184\quad 24:-39034356513$ |
| $26$ | $25:-555369173439\quad 26:2816990436324$ |
| $27$ | $0:10133958701348\quad 1:9705324267295\quad 2:4198662824617\quad 3:1943324094277\quad 4:2064696245252$ |
| $27$ | $5:-5214273994971\quad 6:1700510444985\quad 7:-1638371453895\quad 8:-2000825087402\quad 9:1277089022040$ |
| $27$ | $10:96881456813\quad 11:-744697181992\quad 12:-155737175266\quad 13:-1087380111750\quad 14:3457773641405$ |
| $27$ | $15:-836984777107\quad 16:-1599020696567\quad 17:133778452482\quad 18:725806751369\quad 19:437286336857$ |
| $27$ | $20:2171724977011\quad 21:-523322447530\quad 22:1327322113332\quad 23:-90628414082\quad 24:-1420914050739$ |
| $27$ | $25:-950992202000\quad 26:-1368517111680\quad 27:4019731818026$ |
| $28$ | $0:-954129875389\quad 1:4814459694\quad 2:608179701205\quad 3:148889077753\quad 4:-801011759431$ |
| $28$ | $5:2252196991329\quad 6:194260070159\quad 7:303889580471\quad 8:727487103740\quad 9:-954450774607$ |
| $28$ | $10:-1264483090924\quad 11:1959416200394\quad 12:-703800497762\quad 13:-766628370265\quad 14:-2836732126898$ |
| $28$ | $15:5128817037830\quad 16:907489024424\quad 17:-211762855298\quad 18:-1532198282281\quad 19:-3717492030165$ |
| $28$ | $20:768505257942\quad 21:753419967611\quad 22:-455123582104\quad 23:604564170678\quad 24:632070204149$ |
| $28$ | $25:-1424525287755\quad 26:2192675517679\quad 27:-1936119103140\quad 28:1844200873391$ |
| $29$ | $0:4217872011265\quad 1:5266626816746\quad 2:-279955230617\quad 3:3973264204577\quad 4:-758610158775$ |
| $29$ | $5:-1170069012501\quad 6:-1145752357421\quad 7:-247524776133\quad 8:-490980275351\quad 9:4969730822414$ |
| $29$ | $10:-3090528174830\quad 11:31337110397\quad 12:-317762881492\quad 13:-1564493694978\quad 14:770225862599$ |
| $29$ | $15:-2551576125303\quad 16:2594461206396\quad 17:-235055699273\quad 18:2732447993889\quad 19:825108998548$ |
| $29$ | $20:-156050719361\quad 21:-1312864721554\quad 22:669221645172\quad 23:3673085483203\quad 24:-3924899387957$ |
| $29$ | $25:-734431950806\quad 26:-629655661147\quad 27:1022358643606\quad 28:-2158669526890\quad 29:5898567807495$ |
| $30$ | $0:3625505878468\quad 1:2365589478502\quad 2:-1914098404710\quad 3:-756972648284\quad 4:-1590808408859$ |
| $30$ | $5:437208542875\quad 6:2409125966254\quad 7:345812463240\quad 8:-178733247528\quad 9:870075995848$ |
| $30$ | $10:-714463746706\quad 11:252579678641\quad 12:-825458605393\quad 13:-1289562251735\quad 14:-46004685387$ |
| $30$ | $15:-476655181809\quad 16:160008857233\quad 17:-953489727306\quad 18:-3746098142126\quad 19:-515113470311$ |
| $30$ | $20:1296443109780\quad 21:208030931578\quad 22:539109008096\quad 23:746613871785\quad 24:-663936282038$ |
| $30$ | $25:-516619501846\quad 26:568967710098\quad 27:608344925644\quad 28:372278947306\quad 29:840001377361$ |
| $30$ | $30:2720725315879$ |
| $31$ | $0:13444702201087\quad 1:6825715856092\quad 2:6006938600938\quad 3:363119978547\quad 4:3396663216556$ |
| $31$ | $5:2049916165476\quad 6:1931744242166\quad 7:-1555741878157\quad 8:-118021633681\quad 9:-3519869724330$ |
| $31$ | $10:1722610993049\quad 11:-1020001927432\quad 12:966496162524\quad 13:1624106819620\quad 14:-2220459761810$ |
| $31$ | $15:5298870549315\quad 16:331123042779\quad 17:3449498182262\quad 18:798953268206\quad 19:417412156186$ |
| $31$ | $20:-2148570741476\quad 21:-827660910015\quad 22:761274992796\quad 23:529071206955\quad 24:201744955214$ |
| $31$ | $25:-629771977362\quad 26:-30568094691\quad 27:2145543591252\quad 28:-2685735442\quad 29:-379082756556$ |
| $31$ | $30:3097145321874\quad 31:4123906641684$ |
| $32$ | $0:-2611245350113\quad 1:7464754999235\quad 2:19778498423371\quad 3:436513182695\quad 4:-606479411925$ |
| $32$ | $5:6533935296985\quad 6:-2253054781254\quad 7:189151637612\quad 8:974264716497\quad 9:-3164874235758$ |
| $32$ | $10:-697332477920\quad 11:515195648390\quad 12:-1331544842209\quad 13:165006808615\quad 14:956996740810$ |
| $32$ | $15:-1019191658479\quad 16:-3677038808492\quad 17:-875660144040\quad 18:562679331436\quad 19:124431216022$ |
| $32$ | $20:-785607036418\quad 21:-1947728267726\quad 22:749680093172\quad 23:1613282100660\quad 24:1400641809902$ |
| $32$ | $25:-2061841905546\quad 26:2644707063329\quad 27:1217830501347\quad 28:2867663877959\quad 29:574496525897$ |
| $32$ | $30:-2167237330905\quad 31:-6371544524763\quad 32:5316182860909$ |
| $33$ | $0:472055576118\quad 1:-2613678006010\quad 2:-2791377987566\quad 3:744579641540\quad 4:563435061826$ |
| $33$ | $5:-1625927668624\quad 6:1448035523026\quad 7:-725493348836\quad 8:-1203322077490\quad 9:901660863878$ |
| $33$ | $10:-375493347395\quad 11:63247719111\quad 12:-462429437866\quad 13:-849199542308\quad 14:-1631364163914$ |
| $33$ | $15:-203782592660\quad 16:1164569680285\quad 17:329584357692\quad 18:2001499008091\quad 19:-152203020031$ |
| $33$ | $20:1054572919444\quad 21:-680713974544\quad 22:-1127069424122\quad 23:1106135487084\quad 24:-242231691152$ |
| $33$ | $25:-1720804743684\quad 26:811803590188\quad 27:900492877935\quad 28:54277342700\quad 29:-764068310195$ |
| $33$ | $30:-774283390300\quad 31:122864639323\quad 32:-1107431694269\quad 33:2102714522300$ |
| $34$ | $0:-271656214711\quad 1:2737918598197\quad 2:5078770387685\quad 3:6769663525589\quad 4:2394520716844$ |
| $34$ | $5:7518349373937\quad 6:1212838040612\quad 7:1777551856709\quad 8:2159648793303\quad 9:-158870757867$ |
| $34$ | $10:1976050315057\quad 11:-2705676051583\quad 12:436195988542\quad 13:2215114608991\quad 14:1066147546895$ |
| $34$ | $15:2023510152599\quad 16:-1663262800816\quad 17:-952211347833\quad 18:-2069066713201\quad 19:2341527325348$ |
| $34$ | $20:411426443774\quad 21:-1647466552090\quad 22:-5262587663\quad 23:-3460689713003\quad 24:2742531875581$ |
| $34$ | $25:-1939031301430\quad 26:-49288286557\quad 27:-756516100333\quad 28:-571049404063\quad 29:-2512310921742$ |
| $34$ | $30:-144673294688\quad 31:1767462389195\quad 32:-2531202789237\quad 33:2080889225979\quad 34:2144893702609$ |
| $35$ | $0:-8088912567201\quad 1:-161814129685\quad 2:8572316965482\quad 3:-1286479899540\quad 4:-1860032606478$ |
| $35$ | $5:4579182905446\quad 6:-5465717683983\quad 7:106156384551\quad 8:624263725218\quad 9:-2636296026481$ |
| $35$ | $10:-660256772842\quad 11:1406997362860\quad 12:-665916564786\quad 13:-2237469718321\quad 14:540800180886$ |
| $35$ | $15:219298725859\quad 16:1219062238389\quad 17:-918458088531\quad 18:-334550642808\quad 19:-2394021756511$ |
| $35$ | $20:-235020940680\quad 21:479664683218\quad 22:1454596455110\quad 23:2186620173825\quad 24:-1812410581282$ |
| $35$ | $25:1442752870436\quad 26:-389817532258\quad 27:-2818692726598\quad 28:-334698341460\quad 29:761118960594$ |
| $35$ | $30:240814040776\quad 31:-612082970214\quad 32:186304432880\quad 33:152001345619\quad 34:471717452972$ |
| $35$ | $35:1773306641804$ |

**Seed block 15: L1 d2 q4; dimension $12$.**

**Symmetric seed $S^{(15)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="spin-one-block-15-seed"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:288139623772\quad 1:-502037362660\quad 2:-97082665183\quad 3:67014133293\quad 4:-195145117626$ |
| $0$ | $5:-164843642961\quad 6:-108622093723\quad 7:133427355086\quad 8:114846488284\quad 9:-60603429230$ |
| $0$ | $10:-199729680588\quad 11:77420541341$ |
| $1$ | $1:1729849057921\quad 2:-233300580699\quad 3:-86264932998\quad 4:-197701566067\quad 5:597704759180$ |
| $1$ | $6:3159144368\quad 7:-40952738394\quad 8:-71764652555\quad 9:-50222431813\quad 10:17031433247$ |
| $1$ | $11:-39200549032$ |
| $2$ | $2:861995507116\quad 3:-84028812997\quad 4:181285356645\quad 5:-133016998533\quad 6:-38768299475$ |
| $2$ | $7:-102901439603\quad 8:-41356503394\quad 9:25966230925\quad 10:-23301090104\quad 11:-35435262152$ |
| $3$ | $3:210023660032\quad 4:-280447199978\quad 5:-109146731979\quad 6:26975974277\quad 7:-29196178547$ |
| $3$ | $8:-35005272204\quad 9:-149793304710\quad 10:158938885220\quad 11:-4682560521$ |
| $4$ | $4:1515645990995\quad 5:33264798428\quad 6:-85436176140\quad 7:-148915601404\quad 8:-140601798712$ |
| $4$ | $9:354734909176\quad 10:462389273831\quad 11:-203534064815$ |
| $5$ | $5:446048966038\quad 6:-143717068144\quad 7:132801581767\quad 8:-80278251206\quad 9:21433085678$ |
| $5$ | $10:113085110316\quad 11:-32118078206$ |
| $6$ | $6:692330110519\quad 7:-241745135988\quad 8:-82270544073\quad 9:-35588604007\quad 10:-140731264730$ |
| $6$ | $11:54070863025$ |
| $7$ | $7:507275388923\quad 8:-362972422769\quad 9:-112701264342\quad 10:-214868776271\quad 11:216095289629$ |
| $8$ | $8:946472545779\quad 9:-131132583291\quad 10:-209988878778\quad 11:-174842221097$ |
| $9$ | $9:635711843945\quad 10:210409504902\quad 11:-127963871332$ |
| $10$ | $10:1590271686802\quad 11:-432831030107$ |
| $11$ | $11:239106032402$ |

**Lower-triangular witness $C^{(15)}$.** The denominator is $100000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/100000000000000$ in column $j$. Every unlisted entry is zero.

<a id="spin-one-block-15-witness"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:5367862924591$ |
| $1$ | $0:-9352648711652\quad 1:9247316252218$ |
| $2$ | $0:-1808590616915\quad 1:-4352091966514\quad 2:7999239726812$ |
| $3$ | $0:1248432276204\quad 1:329788139245\quad 2:-588769714184\quad 3:4357563867783$ |
| $4$ | $0:-3635434070643\quad 1:-5814778354844\quad 2:-1719279196391\quad 3:-5186554239719\quad 4:8641776152207$ |
| $5$ | $0:-3070936148645\quad 1:3357632426204\quad 2:-530430540052\quad 3:-1950728993827\quad 4:75986968069$ |
| $5$ | $5:4450625583079$ |
| $6$ | $0:-2023563106006\quad 1:-2012449875397\quad 2:-2037067857195\quad 3:1075875719576\quad 4:-2953594031309$ |
| $6$ | $5:-2827966338967\quad 6:6249797882494$ |
| $7$ | $0:2485669939051\quad 1:2071122409062\quad 2:402429565346\quad 3:-1484522521332\quad 4:-94844044093$ |
| $7$ | $5:2535416784644\quad 6:-907180216237\quad 7:5534741144118$ |
| $8$ | $0:2139519766011\quad 1:1387830931440\quad 2:721797705644\quad 3:-1423797904456\quad 4:-504039998321$ |
| $8$ | $5:-1903912684909\quad 6:-796091500559\quad 7:-7739598498923\quad 8:4602319656479$ |
| $9$ | $0:-1129004784239\quad 1:-1684967605420\quad 2:-847382823569\quad 3:-3101061941934\quad 4:466413571117$ |
| $9$ | $5:-494434242924\quad 6:-1223215844792\quad 7:-1634845597577\quad 8:-5757104549898\quad 9:3368609085920$ |
| $10$ | $0:-3720841671888\quad 1:-3579047243702\quad 2:-3079784072443\quad 3:4568183440682\quad 4:3506085823946$ |
| $10$ | $5:4248937164428\quad 6:-2819652613045\quad 7:-1771123360239\quad 8:-1181900160325\quad 9:2874373804505$ |
| $10$ | $10:7136330322731$ |
| $11$ | $0:1442297287182\quad 1:1034813204240\quad 2:446117566180\quad 3:-538712734382\quad 4:-1286758917650$ |
| $11$ | $5:-668130472531\quad 6:993075530032\quad 7:3139227809944\quad 8:15445614396\quad 9:-1190792169446$ |
| $11$ | $10:-1573155477877\quad 11:1853149024753$ |


<a id="scalar-quartic-shared-moments"></a>

## Shared-profile scalar quartic moments

| $L$ | $(\mu_0,\ldots,\mu_8)$ | $(\nu_0,\ldots,\nu_8)$ |
|---|---|---|
| $2$ | $(1, 1, 1, 1, 1, 1, 1, 1, 1)$ | $(1, 0, 1, 0, 1, 0, 1, 0, 1)$ |
| $3$ | $(1, \frac{4}{3}, 2, \frac{8}{3}, 4, \frac{16}{3}, 8, \frac{32}{3}, 16)$ | $(1, 0, \frac{4}{3}, 0, \frac{8}{3}, 0, \frac{16}{3}, 0, \frac{32}{3})$ |
| $4$ | $(1, \frac{3}{2}, \frac{5}{2}, 4, \frac{13}{2}, \frac{21}{2}, 17, \frac{55}{2}, \frac{89}{2})$ | $(1, 0, \frac{3}{2}, 0, \frac{7}{2}, 0, 9, 0, \frac{47}{2})$ |
| $5$ | $(1, \frac{8}{5}, \frac{14}{5}, \frac{24}{5}, \frac{42}{5}, \frac{72}{5}, \frac{126}{5}, \frac{216}{5}, \frac{378}{5})$ | $(1, 0, \frac{8}{5}, 0, 4, 0, \frac{56}{5}, 0, \frac{164}{5})$ |
| $6$ | $(1, \frac{5}{3}, 3, \frac{16}{3}, \frac{29}{3}, \frac{52}{3}, \frac{94}{3}, \frac{169}{3}, \frac{305}{3})$ | $(1, 0, \frac{5}{3}, 0, \frac{13}{3}, 0, \frac{38}{3}, 0, 39)$ |
| $7$ | $(1, \frac{12}{7}, \frac{22}{7}, \frac{40}{7}, \frac{74}{7}, \frac{136}{7}, 36, \frac{464}{7}, \frac{860}{7})$ | $(1, 0, \frac{12}{7}, 0, \frac{32}{7}, 0, \frac{96}{7}, 0, \frac{304}{7})$ |
| $8$ | $(1, \frac{7}{4}, \frac{13}{4}, 6, \frac{45}{4}, 21, \frac{79}{2}, 74, \frac{557}{4})$ | $(1, 0, \frac{7}{4}, 0, \frac{19}{4}, 0, \frac{29}{2}, 0, \frac{187}{4})$ |
| $\infty$ | $(1, 2, 4, 8, 16, 32, 64, 128, 256)$ | $(1, 0, 2, 0, 6, 0, 20, 0, 70)$ |


<a id="scalar-quartic-shared-pivots"></a>

## Shared-profile scalar quartic pivots and maxima

| $L$ | Positive $LDL^T$ pivots on the active coordinates | Maximum $b^T\mathsf G^{-1}b$ |
|---|---|---|
| $2$ | $(\frac{5}{12}, \frac{199}{21000})$ | $\frac{785}{1194}$ |
| $3$ | $(\frac{17}{27}, \frac{409}{11475}, \frac{178447}{2705535}, \frac{11578915}{2124768429})$ | $\frac{774278183}{868418625}$ |
| $4$ | $(\frac{35}{48}, \frac{1343}{21000}, \frac{123373}{1128120}, \frac{127533823}{5078032680})$ | $\frac{14420459291}{15304058760}$ |
| $5$ | $(\frac{59}{75}, \frac{19813}{221250}, \frac{221312761}{1456255500}, \frac{2184001102223}{48799463800500})$ | $\frac{10448662019271}{10920005511115}$ |
| $6$ | $(\frac{89}{108}, \frac{4913}{48060}, \frac{197699}{1124550}, \frac{6678909931163}{108849052156320})$ | $\frac{99749278545098}{100183648967445}$ |
| $7$ | $(\frac{125}{147}, \frac{4013}{36750}, \frac{2837436131}{14452819500}, \frac{7242235877}{93381293565})$ | $\frac{30030798898817}{29113788225540}$ |
| $8$ | $(\frac{167}{192}, \frac{11353}{100200}, \frac{18721543}{89007520}, \frac{66640087309}{754852613760})$ | $\frac{353297187747}{333200436545}$ |
| $\infty$ | $(1, \frac{26}{225}, \frac{2707}{9555}, \frac{13497229}{143254440})$ | $\frac{18261460}{13497229}$ |


<a id="scalar-quartic-seed-cap"></a>

## Seventeen-charge diagonal cap values

| $j$ | $(U^*U+VV^*)_{jj}$ |
|---|---|
| $0$ | $\frac{199007449}{200000000}$ |
| $1$ | $\frac{198992257}{200000000}$ |
| $2$ | $\frac{199010813}{200000000}$ |
| $3$ | $\frac{99500077}{100000000}$ |
| $4$ | $\frac{198997517}{200000000}$ |
| $5$ | $\frac{7959521}{8000000}$ |
| $6$ | $\frac{154995433}{200000000}$ |
| $7$ | $\frac{83521}{200000}$ |
| $8$ | $\frac{9296401}{25000000}$ |
| $9$ | $\frac{83521}{200000}$ |
| $10$ | $\frac{154995433}{200000000}$ |
| $11$ | $\frac{7959521}{8000000}$ |
| $12$ | $\frac{198997517}{200000000}$ |
| $13$ | $\frac{99500077}{100000000}$ |
| $14$ | $\frac{199010813}{200000000}$ |
| $15$ | $\frac{198992257}{200000000}$ |
| $16$ | $\frac{199007449}{200000000}$ |


<a id="scalar-quartic-seed-moments"></a>

## Seventeen-charge state moments

| $j$ | $\mu_j$ | $\nu_j$ |
|---|---|---|
| $0$ | $1$ | $1$ |
| $1$ | $\frac{84336639607}{49993808500}$ | $0$ |
| $2$ | $\frac{5933756808005369}{1999752340000000}$ | $\frac{7695264502545573}{4999380850000000}$ |
| $3$ | $\frac{534611333844934061659}{99987617000000000000}$ | $0$ |
| $4$ | $\frac{39177355059383997901301333}{3999504680000000000000000}$ | $\frac{3209688577189075212304413}{799900936000000000000000}$ |
| $5$ | $\frac{725506699965273773241682469219}{39995046800000000000000000000}$ | $0$ |
| $6$ | $\frac{54165394260585578574307112383622029}{1599801872000000000000000000000000}$ | $\frac{19718362784228915064025702013196867}{1599801872000000000000000000000000}$ |
| $7$ | $\frac{1016402005627941306473045562417421850923}{15998018720000000000000000000000000000}$ | $0$ |
| $8$ | $\frac{76603738842399235945904202664048608583236101}{639920748800000000000000000000000000000000}$ | $\frac{5223296645758250582112908187795830917480947}{127984149760000000000000000000000000000000}$ |


<a id="scalar-quartic-seed-pivots"></a>

## Seventeen-charge Gram pivots

| Pivot index | $\mathsf G$ | $\mathsf J$ | $7\mathsf J-\mathsf G$ |
|---|---|---|---|
| $1$ | $1$ | $1$ | $6$ |
| $2$ | $\frac{24288700673903280359753}{199950471066773780000000}$ | $\frac{7695264502545573}{4999380850000000}$ | $\frac{21994041908967384917495827}{2999257066001606700000000}$ |
| $3$ | $\frac{15834619398154039880057586767540892281925029337}{485713860081976618330921035720200000000000000000}$ | $\frac{657172028500073503206885601895841}{399900942133547560000000000000000}$ | $\frac{74537138613322419266011406208624904777180120368623}{10995659193378898743110746745871295000000000000000}$ |
| $4$ | $\frac{764817744542475712326833221137894470020200897533748315907206810088532180553}{21989803607269397868471165606349260685046886889746110125000000000000000000000}$ | $\frac{15307838433378057688213459684934979915492564925119}{8207265704471704300475104000000000000000000000000}$ | $\frac{1644488075157042258001136265090697224804960420154137247954700913361037537869153663173}{238489307774233380962667827251821090416708998893816810924512000000000000000000000000}$ |
| $5$ | $\frac{2395540635287751420293819450347641748672188359534173125289651706779139798177428451592026220318787738462390431231}{106211532939051252438802192969461245076108096674528709979617780648505405224039183612500000000000000000000000000000}$ | $\frac{119288120331224637429229462763730937409450351662309768640703298056985800027}{70089669428030329504531572613520878720956800000000000000000000000000000000}$ | $\frac{12055516102749022356465263287244054121861249827512609210509081978076402313171922939668774404804277354806236610683523354710351}{1826982709109661734953697760429990048630680913228121734599207425274373378434265917638765874900000000000000000000000000000000}$ |
