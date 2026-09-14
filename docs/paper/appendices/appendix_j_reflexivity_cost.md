# Appendix J: The Fundamental Thermodynamic Cost of Reflexivity 

**J.1 Introduction: Structural Register Size and Conditional Reset Cost**

This appendix analyzes a declared implementation architecture in which a binary prediction record is returned to a fixed ready state. SPAP alone does not force that architecture, the reachable pre-reset set, or the probability law.

**J.2 The Declared Binary-Ancilla Reset Architecture**

**Definition J.1 (Reachable Register and Closed-Cycle Map).** Let
$$
A\subseteq\{0,1\}_{\phi}\times\{0,1\}_p
$$
be the reachable pre-reset set and define
$$
G_{\mathrm{cycle}}:A\longrightarrow\{0,1\}_{\phi'}\times\{p_{\mathrm{ready}}\}.
\tag{J.1}
$$
Fixing the second output component is an architectural reset assumption. An injective extension may instead retain the displaced label in side information.

**Lemma J.1 (Conditional Logical Merging in the Declared Binary-Ancilla Architecture).** If $|A|>2$, then $G_{\mathrm{cycle}}$ is noninjective. If all four pairs are reachable, some output has at least two preimages. If $|A|\le2$, cardinality alone gives no noninjectivity conclusion.

*Proof.* The accessible codomain has two elements. The conclusions follow from the pigeonhole principle. ∎
**J.3 Conditional Physical Reset Ledger**

**Theorem J.1 (Conditional Cost of the Declared Binary-Ancilla Reset Architecture)**

Let $P\in\{0,1\}$ be the prediction record in Definition J.1, let $R$ contain every classical record retained and unchanged through reset, and let $q(P,R)$ be their actual joint law. Assume a degenerate register Hamiltonian, a bath at temperature $T$, cyclic control, and an isothermal reset returning the register and controller to their initial Hamiltonians. Then
$$
\varepsilon_0:=\ln|\{0,1\}|=\ln2
\tag{J.2}
$$
is the structural log-cardinality, while
$$
\varepsilon_{\mathrm{reset}}
:=\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}},
\qquad
\varepsilon_{\mathrm{diss}}\ge0.
\tag{J.3}
$$
Moreover $0\le H_q(P\mid R)\le\ln2$, with the upper endpoint exactly when $q(P=0\mid R)=q(P=1\mid R)=1/2$ almost surely. On that maximal-entropy branch, $\varepsilon_{\mathrm{reset}}\ge\ln2$, with equality exactly when $\varepsilon_{\mathrm{diss}}=0$. The equality $\varepsilon_{\mathrm{reset}}=\ln2$ by itself does not imply maximal conditional entropy or saturation.

*Proof.* The reset alphabet has two elements, so its structural log-cardinality is
$$
\varepsilon_0=\ln|\{0,1\}|=\ln2.
$$
For every value $r$ with $q(r)>0$, put $p_r=q(P=1\mid R=r)$. Then
$$
H_q(P\mid R)=\sum_rq(r)h(p_r),
\qquad
h(p):=-p\ln p-(1-p)\ln(1-p).
$$
On $(0,1)$,
$$
h''(p)=-\frac1p-\frac1{1-p}<0,
$$
and $h'(p)=\ln((1-p)/p)$ vanishes only at $p=1/2$. Together with $h(0)=h(1)=0$, this proves $0\le h(p)\le\ln2$, with equality at the upper endpoint exactly at $p=1/2$. Averaging proves
$$
0\le H_q(P\mid R)\le\ln2,
$$
and equality on the right holds exactly when $p_r=1/2$ for $q_R$-almost every $r$.

The conditional Landauer principle for an isothermal cyclic reset with retained side information (Sagawa and Ueda 2009; Reeb and Wolf 2014) applies because the register Hamiltonian is degenerate, the controller and register Hamiltonians return to their initial values, and $R$ is retained and unchanged. It gives
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
\ge H_q(P\mid R).
$$
Define
$$
\varepsilon_{\mathrm{diss}}
:=\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}-H_q(P\mid R)\ge0.
$$
This is (J.3). If $H_q(P\mid R)=\ln2$, then $\varepsilon_{\mathrm{reset}}\ge\ln2$, and equality holds exactly when $\varepsilon_{\mathrm{diss}}=0$. Conversely, the numerical equality $\varepsilon_{\mathrm{reset}}=\ln2$ alone permits any decomposition $H_q(P\mid R)+\varepsilon_{\mathrm{diss}}=\ln2$ and therefore implies neither maximal entropy nor reversibility. Lemma J.1 concerns only the separate cardinality condition for logical merging. ∎

**J.4 Conditional Ancilla and Finite-Event Ledgers**

**Remark J.1.1 (Distribution-Dependent Reset Cost).** The binary alphabet fixes only $\ln2$ as a log-cardinality. The registered heat uses the actual conditional entropy $H_q(P\mid R)$, and equality at $\ln2$ requires both a conditionally uniform binary law and zero excess dissipation.

**Proposition (Conditional Entropy Floor of Reflexive Cycles).** Let $X$ be finite, $\tau:X\to X$ have no fixed points and all its cycles have length at least $L\ge2$. Let $q$ be $\tau$-invariant and let a retained record satisfy $R\circ\tau=R$. Conditional on any positive-probability record value, $q$ is a mixture of uniform distributions on cycles of length at least $L$. Therefore

$$
H_{\mathrm{Sh}}(X\mid R=r)\ge\ln L,
\qquad H_{\min}(X\mid R=r)\ge\ln L.
$$

Equality in either holds precisely for a uniform distribution on one cycle of length $L$. Invariance puts zero mass on transient vertices of the finite functional graph. On each cycle it makes all masses equal. If the cycle weights are $w_j$, Shannon entropy equals $H(w)+\sum_jw_j\ln|C_j|$, and the largest point mass is $\max_jw_j/|C_j|\le1/L$. These formulas prove the claims and their equality conditions.

The minimum over admissible fixed-point-free systems is $\ln2$, attained by distributions supported uniformly on a two-cycle, including two-cycles embedded in larger systems.

**Corollary (Invariant-Record Reset Floor).** Let the reset register $P$ be swapped by the reflexive involution and let its joint law with every record retained through the reset be invariant. When those records $R$ are unchanged by the involution, $P$ is conditionally uniform: $H(P\mid R)=\ln2$ and $I(P:R)=0$. Under Theorem J.1's cyclic degenerate-register reset hypotheses, with all such retained side information included in $R$,
$$
\langle Q_{\mathrm{bath}}\rangle\ge k_BT\ln2.
$$
*Proof.* Invariance pairs the two values of $P$ with equal conditional probability in each positive-weight fiber of $R$. Conditional Landauer then applies to their actual joint law. ∎

This gives the reset floor for the invariant-record class. A device test measures conditional bias and correlation on that class. A complete cycle ledger also charges preparation, work and other reversible or irreversible steps.

**Lemma J.1a (Ancilla Extension and Conditional Boundary Displacement).** Let the accessible map in Definition J.1 have a fiber containing two distinct inputs, and let an injective implementation append an auxiliary register $G$ initialized in a fixed state. The two final $G$ states over that fiber must be distinguishable. This is a cardinality statement, not an ensemble-entropy statement.

If $G$ is retained, no reset-heat conclusion follows. If $G$ is reset while classical side information $R$ remains available and unchanged, its registered law obeys
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
\ge H_q(G\mid R).
$$
For a conditionally uniform binary displaced label with no retained copy, the right-hand side is $\ln2$; otherwise it can be smaller, including zero.

*Proof.* Injectivity forces distinct auxiliary outputs for distinct inputs that share the same accessible output. Conditional Landauer applies only to a subsequent registered reset and uses its actual joint law with all retained side information. ∎

**Theorem J.1b (Complete Finite Fiber--Garbage Classification).** Let $A$ and $B$ be finite sets and let $f:A\to B$ be the accessible map on the exact reachable domain. Among all auxiliary alphabets $G$ and label maps $g:A\to G$ for which
$$
x\longmapsto(f(x),g(x))
\tag{J.3a}
$$
is injective, the minimum auxiliary cardinality is
$$
|G|_{\min}=\max_{b\in f(A)}|f^{-1}(b)|.
\tag{J.3b}
$$
For any actual joint law $q(X,R)$ supported on $A$, every injective extension obeys
$$
H_q(G\mid f(X),R)=H_q(X\mid f(X),R),
\tag{J.3c}
$$
where $G=g(X)$. If $G$ is subsequently reset while $f(X)$ and $R$ are retained and unchanged, the registered isothermal reset satisfies
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
\ge
H_q(X\mid f(X),R).
\tag{J.3d}
$$
No entropy or heat lower bound follows when the reachable law makes $X$ a function of $(f(X),R)$, even if another fiber of $f$ has more than one element.

*Proof.* On each fiber $f^{-1}(b)$, injectivity of (J.3a) requires distinct $G$ labels, so $|G|$ is at least the largest fiber size. Conversely, enumerate every fiber and assign its elements distinct labels in one common alphabet of that largest size; labels may be reused across different fibers because $b$ is also retained. This proves (J.3b) and constructs a minimizing embedding for every reachable-domain variant.

For fixed values of $(f(X),R)$, the maps $X\mapsto G$ and $G\mapsto X$ are inverse on the conditional support, so their conditional probability vectors differ only by relabeling. Their entropies are therefore equal, giving (J.3c). Conditional Landauer with all unchanged side information gives (J.3d). If $X$ is already determined by $(f(X),R)$, the right side vanishes. ∎

**Resolution TV-JREF-01-R1.** Equations (J.3b)--(J.3d) give `positive-discharge` of the exhaustive finite reachable-domain embedding, minimal-garbage, ensemble-entropy, and registered-reset classification. Lemma J.1 and Lemma J.1a are its binary cardinality slices.

**Theorem J.4a (Finite Registered-Reset Ledger).** Let $D$ contain a finite set $\mathcal E_{\mathrm{ref}}(D)$ of registered classical resets. For event $e$, let $P_e$ be the reset record, $R_e$ all classical information retained and unchanged through that reset, $q_e$ their actual law, and $T_e>0$ the bath temperature. Under the cyclic, degenerate-register hypotheses of Theorem J.1, define
$$
\varepsilon_{\mathrm{reset}}(e)
:=\frac{\langle Q_{\mathrm{bath}}(e)\rangle}{k_BT_e}
=H_{q_e}(P_e\mid R_e)+\varepsilon_{\mathrm{diss}}(e),
\qquad \varepsilon_{\mathrm{diss}}(e)\ge0.
\tag{J.4a.1}
$$
Then
$$
\mathcal X_{\mathrm{reset}}(D)
:=\sum_{e\in\mathcal E_{\mathrm{ref}}(D)}\varepsilon_{\mathrm{reset}}(e)
=\sum_eH_{q_e}(P_e\mid R_e)+\sum_e\varepsilon_{\mathrm{diss}}(e).
\tag{J.4a.2}
$$
The structural label ledger for $N_{\mathrm{ref}}$ binary reset supports is $N_{\mathrm{ref}}\ln2$, but it equals neither term in (J.4a.2) unless the relevant maximal-entropy and saturation hypotheses are separately verified. For sequential resets, each $R_e$ includes all earlier records still available and unchanged; this prevents double counting. ∎

**Corollary J.4a.3 (Conditional Guard-Reset Subledger).**

Let
$$
\mathcal E_{\mathrm{guard}}
\subseteq
\mathcal E_{\mathrm{ref}}(D)
$$
be a set of $m$ distinct registered reset events injectively assigned to $m$ physically established guard entries. Suppose
$$
H_{q_e}(P_e\mid R_e)\ge h_{\min}>0
\qquad
(e\in\mathcal E_{\mathrm{guard}}),
$$
where $R_e$ contains every record retained and unchanged through event $e$. Define
$$
\mathcal X_{\mathrm{guard}}(D)
:=
\sum_{e\in\mathcal E_{\mathrm{guard}}}
\varepsilon_{\mathrm{reset}}(e).
$$
Then
$$
\mathcal X_{\mathrm{guard}}(D)
\ge
mh_{\min}.
\tag{J.4a.3}
$$
If each $P_e$ is conditionally uniform binary, then
$$
\mathcal X_{\mathrm{guard}}(D)
=
m\ln2
+
\sum_{e\in\mathcal E_{\mathrm{guard}}}
\varepsilon_{\mathrm{diss}}(e)
\ge
m\ln2,
\tag{J.4a.4}
$$
with equality exactly when every displayed dissipative overhead vanishes.

*Proof.* Restrict Equation (J.4a.2) to $\mathcal E_{\mathrm{guard}}$ and use the stated conditional-entropy floor. On the conditionally uniform binary branch, every conditional entropy equals $\ln2$, giving (J.4a.4). ∎

No reset term follows merely because a guard is semantic or predetermined. This corollary counts exactly the physically assigned reset events satisfying its conditional-entropy premise; an entry retained reversibly or never reset contributes no event to $\mathcal E_{\mathrm{guard}}$. A predetermined guard is nevertheless counted if its physical implementation contains an assigned reset satisfying the stated hypotheses.

**Theorem J.4b (Conditional Finite-Work Quantum-Zeno Obstruction).** Consider $N$ equal interrogation cycles over duration $T$, with $\tau=T/N\le\tau_0$. Assume that every surviving cycle closes a registered reset in a cyclic degenerate register at common bath temperature $T_b>0$ and that, uniformly over surviving histories,
$$
q_j(\tau\mid H_{j-1})\ge b\tau^2,
\qquad
H_{q_j}(P_j\mid R_j)\ge h_{\min}>0.
\tag{J.4b.1}
$$
Assume also that work input is recorded as a nonnegative random variable and that the conditional mean work of each executed reset obeys conditional Landauer for its actual history. Then a survival requirement $P_N\ge1-\delta$, $0<\delta<1$, necessarily gives
$$
N\ge
\max\!\left\{
\left\lceil\frac{T}{\tau_0}\right\rceil,
\left\lceil\frac{bT^2}{-\log(1-\delta)}\right\rceil
\right\}.
\tag{J.4b.2}
$$
The sum $W_N^{\mathrm{surv}}$ of the conditional mean reset-work inputs along the all-survival history obeys
$$
W_N^{\mathrm{surv}}
\ge k_BT_bh_{\min}N
\ge k_BT_bh_{\min}\frac{bT^2}{-\log(1-\delta)}.
\tag{J.4b.3}
$$
If the protocol stops at first departure, then
$$
\mathbb EW_N\ge(1-\delta)k_BT_bh_{\min}N.
\tag{J.4b.4}
$$

*Proof.* Let $S_j$ be survival through cycle $j$. Along the unique all-survival history through cycle $j-1$,
$$
\mathbb P(S_j\mid S_{j-1})
=1-q_j(\tau\mid H_{j-1})
\le1-b\tau^2.
$$
The conditional-probability chain rule and $1-u\le e^{-u}$ give
$$
P_N=\mathbb P(S_N)
=\prod_{j=1}^N\mathbb P(S_j\mid S_{j-1})
\le(1-b\tau^2)^N
\le e^{-Nb\tau^2}
=e^{-bT^2/N}.
$$
Thus $1-\delta\le e^{-bT^2/N}$, so
$$
N\ge\frac{bT^2}{-\log(1-\delta)}.
$$
The condition $\tau=T/N\le\tau_0$ independently gives $N\ge T/\tau_0$; since $N$ is integral, taking ceilings proves (J.4b.2).

For every executed reset and every surviving history, conditional Landauer gives conditional mean work at least
$$
k_BT_bH_{q_j}(P_j\mid R_j)\ge k_BT_bh_{\min}.
$$
The all-survival history contains $N$ such resets, so summing proves the first inequality in (J.4b.3); the second follows from (J.4b.2). If $K$ is the number of executed resets in the stopping protocol, nonnegativity and the tower property give
$$
\mathbb EW_N\ge k_BT_bh_{\min}\,\mathbb EK.
$$
On $S_N$, $K=N$, while $K\ge0$ elsewhere. Hence
$$
\mathbb EK\ge N\mathbb P(S_N)=NP_N\ge N(1-\delta),
$$
which proves (J.4b.4). ∎

**Remark J.4b.1 (Scope Boundary).** The result assigns no cost to an unrecorded projection. It becomes void if $b=0$, if no registered reset is executed, or if no positive uniform conditional-entropy bound is certified.

**Theorem J.4c (Exact Zeno Survival and Record-Erasure Scaling Classification).** Let a qubit start in $|0\rangle$, evolve under $H=\hbar\omega\sigma_x$, and be projectively interrogated in the $\{|0\rangle,|1\rangle\}$ basis at $N$ equal intervals over a fixed time $T$. Put
$$
c_N=\cos^2\!\left(\frac{\omega T}{N}\right).
\tag{J.4c.1}
$$
Then the all-survival probability is $P_N=c_N^N$. If a single optimally compressed record stores the first failure time $J\in\{1,\ldots,N,\infty\}$, then
$$
\Pr(J=j)=c_N^{j-1}(1-c_N),
\qquad
\Pr(J=\infty)=c_N^N,
\tag{J.4c.2}
$$
and its Shannon entropy is exactly
$$
H(J)=h_2(c_N)\sum_{j=0}^{N-1}c_N^j
=
h_2(c_N)\frac{1-c_N^N}{1-c_N},
\tag{J.4c.3}
$$
where $h_2$ uses natural logarithms. For fixed $0<|\omega T|<\infty$,
$$
P_N=1-\frac{(\omega T)^2}{N}+O(N^{-2}),
\qquad
H(J)=\Theta\!\left(\frac{\log N}{N}\right).
\tag{J.4c.4}
$$

Thus an optimally compressed degenerate register erased once per completed run, with no retained side information about $J$, has Landauer floor $k_BT_bH(J)$, which tends to zero. A raw architecture that instead closes $N$ distinct resets with a uniform conditional-entropy floor $h_{\min}>0$ has the linear lower bound of Theorem J.4b. An architecture with no reset has no Landauer reset term but retains its record or side information and is not a closed cyclic reset. Zeno survival alone therefore fixes none of these three work scalings; the physical record architecture does.

*Proof.* One interval has survival amplitude $\cos(\omega T/N)$, giving (J.4c.1) and independence under projection gives $P_N=c_N^N$. Equation (J.4c.2) is the truncated geometric law. Revealing the successive survival/failure bit only while the run remains active gives the entropy chain rule
$$
H(J)=\sum_{j=0}^{N-1}\Pr(J>j)h_2(c_N)
=h_2(c_N)\sum_{j=0}^{N-1}c_N^j,
$$
which proves (J.4c.3). With $a=\omega T$, $1-c_N=a^2N^{-2}+O(N^{-4})$, $c_N^N=1-a^2N^{-1}+O(N^{-2})$, and $h_2(1-\epsilon)=\epsilon(1-\log\epsilon)+O(\epsilon^2)$. Substitution gives (J.4c.4). The three work statements follow respectively from conditional Landauer, Theorem J.4b, and the definition of a closed reset cycle. ∎

**J.5 Distinction from Existing Bounds**

The structural value $\varepsilon_0=\ln2$ counts a binary alphabet. The physical bath-heat ledger depends on $H_q(P\mid R)$, and the total entropy production is the excess $k_B\varepsilon_{\mathrm{diss}}$. Measurement, feedback, finite-time, and reservoir costs may be added only through compatible implementation theorems with an explicit no-double-counting rule.

**J.6 Consequences for the Predictive Universe Framework**

1. A declared reset with $H_q(P\mid R)>0$ exports positive bath heat; thermodynamic irreversibility additionally requires $\varepsilon_{\mathrm{diss}}>0$.
2. Strict trace-distance contraction requires the separate refresh/minorization hypothesis of Lemma E.1.
3. The fixed binary reset-support certificate of Proposition E.2a gives its own support-dimension capacity bound.
4. No area-law, gravitational, reflexivity, arrow-of-time, or locality conclusion follows from $\varepsilon_0=\ln2$ alone; each requires the independent bridge cited in its theorem.


---

## J.8 Finite-Time Dissipation on a Certified Markov-Jump Implementation

The excess $\varepsilon_{\mathrm{diss}}$ in Equation (J.3) is nonnegative and may vanish in a quasistatic limit. A strict finite-time statement requires implementation data beyond Definition J.1 and must distinguish an exact logical reset from a finite-rate physical approximation.

**Definition J.8.1 (Markov-Jump Implementation Certificate).** A certificate $\mathfrak M_{\mathrm{LDB}}$ specifies, for every retained side-information value $r$ of positive probability:

1. a finite-state, continuously differentiable Markov jump law $p_r(t)$ on $0\le t\le\tau$, with nonnegative rates locally bounded on the closed interval;
2. local detailed balance with respect to the registered bath temperature and instantaneous control Hamiltonian, together with the degenerate register Hamiltonian, fixed ready label, and cyclic endpoint control of Theorem J.1;
3. no transitions between distinct $r$-sectors and no change in the law of $R$;
4. the input law $p_r^{\mathrm{in}}=q(P\mid R=r)$ and a registered physical output law $p_r^{\mathrm{out}}=p_r(\tau)$, including its ready-state error $1-p_r^{\mathrm{out}}(\mathrm{ready})$; and
5. the standard stochastic entropy-production integral $\Sigma_r$ and activity integral
$$
N_r=\int_0^\tau A_r(t)\,dt.
\tag{J.8.1}
$$

Local detailed balance then gives the heat identity
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
=H_q(P\mid R)-\sum_rq(r)H(p_r^{\mathrm{out}})+\sum_rq(r)\Sigma_r.
\tag{J.8.2}
$$
Thus $\sum_rq(r)\Sigma_r$ is the irreversible entropy production. It equals the $\varepsilon_{\mathrm{diss}}$ of Equation (J.3) on an exact ready-state endpoint.

Definition J.1 and the existence of a discrete Markov kernel do not populate $\mathfrak M_{\mathrm{LDB}}$: a discrete-time kernel need not be embeddable as a finite-rate continuous-time jump process, and single-bath isothermal operation alone does not imply local detailed balance.

**Imported Result J.8.2 (Classical Stochastic Speed Limit; Shiraishi, Funo, and Saito 2018).** For each finite Markov-jump process satisfying the local-detailed-balance branch above,
$$
\|p_r(\tau)-p_r(0)\|_1^2\le2\Sigma_rN_r.
\tag{J.8.3}
$$
With the total-variation convention $\|p-p'\|_{\mathrm{TV}}=\tfrac12\|p-p'\|_1$, this is
$$
\Sigma_r\ge\frac{2L_r^2}{N_r},
\qquad
L_r=\|p_r^{\mathrm{out}}-p_r^{\mathrm{in}}\|_{\mathrm{TV}},
\tag{J.8.4}
$$
whenever $L_r>0$.

**Definition J.8.3 (Total-Activity and Displacement Data).** A total-activity certificate $\mathfrak A_N$ supplies $N_{\max}<\infty$ such that $N_r\le N_{\max}$ for every retained $r$. Define
$$
L^2=\sum_rq(r)L_r^2.
\tag{J.8.5}
$$
The condition $L>0$ is independent implementation data; a logical alphabet with more than one symbol does not imply it for the actual conditional input law.

**Theorem J.8.4 (Positive Entropy-Production Floor at Bounded Total Activity).** If $\mathfrak M_{\mathrm{LDB}}$ and $\mathfrak A_N$ are populated and $L>0$, then
$$
\sum_rq(r)\Sigma_r
\ge\frac{2L^2}{N_{\max}}
>0.
\tag{J.8.6}
$$

*Proof.* Equation (J.8.4) and $N_r\le N_{\max}$ give $\Sigma_r\ge2L_r^2/N_{\max}$ for every sector with $L_r>0$; sectors with $L_r=0$ contribute the nonnegative bound $\Sigma_r\ge0$. Average over $r$ and use (J.8.5). ∎

**Lemma J.8.5 (Exact Finite-Rate Erasure Obstruction).** Under item 1 of Definition J.8.1, if $p_r^{\mathrm{in}}(x)>0$ for a non-ready state $x$, then $p_r(\tau)(x)>0$. Hence an exact ready-state endpoint cannot be reached in finite time on that sector.

*Proof.* Let $\lambda_x(t)$ be the total exit rate from $x$. The probability of starting at $x$ and making no jump is at least
$$
p_r^{\mathrm{in}}(x)\exp\!\left(-\int_0^\tau\lambda_x(t)\,dt\right)>0,
$$
because local boundedness on the compact interval makes the integral finite. This event contributes to $p_r(\tau)(x)$. ∎

**Remark J.8.6 (Scope).** Theorem J.8.4 applies to finite-error physical resets. An exact logical reset in finite time requires a singular-rate or limiting idealization outside Definition J.8.1; transferring Theorem J.8.4 to Equation (J.3) requires a certified limit theorem. The bound is independent of $\tau$ because it assumes an upper bound on integrated activity. An activity-rate cap $A_r(t)\le A_{\max}$ gives
$$
\sum_rq(r)\Sigma_r\ge\frac{2L^2}{A_{\max}\tau},
$$
which vanishes as $\tau\to\infty$. A strict channel-capacity deficit additionally requires a theorem connecting dissipative excess to the certified achievable boundary-channel rate.

**Construction J.8.7 (Bounded Two-State LDB Erasure Witness).** Let the ready state be $0$, let $R$ be a singleton, and put $p_1(0)=p_0(0)=1/2$. Fix $\beta,\gamma,\Delta,\tau>0$ and define
$$
E_0(t)=0,
\qquad
E_1(t)=\Delta\sin^2\!\left(\frac{\pi t}{\tau}\right),
\tag{J.8.7a}
$$
$$
w_{0\leftarrow1}(t)=\gamma e^{\beta E_1(t)/2},
\qquad
w_{1\leftarrow0}(t)=\gamma e^{-\beta E_1(t)/2}.
\tag{J.8.7b}
$$
The register is degenerate at $t=0$ and $t=\tau$. The rates are positive, continuously differentiable and bounded, and
$$
\log\frac{w_{0\leftarrow1}(t)}{w_{1\leftarrow0}(t)}
=\beta(E_1(t)-E_0(t)),
\tag{J.8.7c}
$$
so the process obeys local detailed balance for the displayed cyclic control Hamiltonian. Write
$$
k(t)=w_{0\leftarrow1}(t)+w_{1\leftarrow0}(t),
\qquad
c=\frac{\beta\Delta}{2}.
$$

**Theorem J.8.8 (Explicit Nonempty Bounded-Activity Erasure Branch).** Construction J.8.7 populates Definition J.8.1 and Definition J.8.3. Its final error $\epsilon_\tau=p_1(\tau)$ satisfies
$$
0<\epsilon_\tau<\frac12,
\qquad
L=\frac12-\epsilon_\tau
=\int_0^\tau
\exp\!\left(-\int_s^\tau k(u)\,du\right)
\gamma\sinh\!\left(\frac{\beta E_1(s)}2\right)ds>0.
\tag{J.8.8a}
$$
Moreover
$$
N\le N_{\max}=2\gamma\tau\cosh c,
\tag{J.8.8b}
$$
and hence
$$
\Sigma\ge\frac{2L^2}{N_{\max}}>0.
\tag{J.8.8c}
$$
The completely explicit estimates
$$
L\ge \frac{\gamma\tau}{2}e^{-2\gamma\tau\cosh c}\sinh\!\left(\frac c2\right)
\tag{J.8.8d}
$$
and
$$
\Sigma\ge
\frac{\gamma\tau}{4\cosh c}
e^{-4\gamma\tau\cosh c}
\sinh^2\!\left(\frac c2\right)>0
\tag{J.8.8e}
$$
follow. The bath heat therefore obeys
$$
\frac{\langle Q_{\rm bath}\rangle}{k_BT}
=\log2-h_2(\epsilon_\tau)+\Sigma,
\tag{J.8.8f}
$$
where $h_2(x)=-x\log x-(1-x)\log(1-x)$.

*Proof.* The master equation is
$$
\dot p_1=w_{1\leftarrow0}(1-p_1)-w_{0\leftarrow1}p_1.
$$
For $y=1/2-p_1$ this becomes
$$
\dot y+k(t)y=\gamma\sinh\!\left(\frac{\beta E_1(t)}2\right),
\qquad y(0)=0.
$$
Variation of constants gives (J.8.8a); its integrand is nonnegative and is positive on $0<s<\tau$. Bounded rates and Lemma J.8.5 give $\epsilon_\tau>0$. The dynamical activity is at most $w_{0\leftarrow1}+w_{1\leftarrow0}=2\gamma\cosh(\beta E_1/2)\le2\gamma\cosh c$, proving (J.8.8b), and Theorem J.8.4 gives (J.8.8c). Since $k\le2\gamma\cosh c$ and $E_1(s)\ge\Delta/2$ on $\tau/4\le s\le3\tau/4$, (J.8.8d) follows by restricting the integral in (J.8.8a) to that interval. Substitution into (J.8.8c) gives (J.8.8e). Equation (J.8.8f) is (J.8.2). ∎

**Remark J.8.9 (Witness Scope).** The witness proves nonemptiness of the finite-error, bounded-rate, cyclic-control LDB branch and supplies a strictly positive computable entropy-production floor. Exact finite-time erasure is governed by the singular-rate or limiting certificate identified in Remark J.8.6. Quantum ND-RID transfer, a channel-capacity deficit, and horizon saturation or strictness are governed by their separately named transfer certificates.

**Definition J.8.10 (Reset-to-Capacity Transfer Certificate).** A transfer certificate $\mathfrak C_{\Sigma C}$ contains:

1. a physical boundary channel $\Phi_{\rm phys}$ induced by the same registered reset carrier, clock and protocol as $\mathfrak M_{\rm LDB}$, and an ideal comparator $\Phi_{\rm id}$ with the same input/output alphabets, code constraints and number of uses;
2. achievable-rate lower certificates and converse upper certificates for the regularized classical capacities, with a convergence modulus or an additive/single-letter theorem that makes each stated bound valid for arbitrary block length;
3. a proved implementation-class inequality
   $$
   C(\Phi_{\rm phys})\le C(\Phi_{\rm id})-g(\Sigma),
   \tag{J.8.10a}
   $$
   where $g:[0,\infty)\to[0,\infty)$ is fixed by the channel family, is nondecreasing on the certified entropy-production interval, satisfies $g(s)>0$ for $s>0$ in that interval, and is fixed independently of the desired horizon coefficient;
4. an overlap map proving that the entropy-production record and the channel law in (J.8.10a) arise from the same physical implementation, plus a source-partition table preventing the reset-support deficit, refresh deficit and dissipative deficit from being counted twice; and
5. the density, additivity, coding, unit and error records required to use the resulting capacity in Theorem E.9.1.

The verifier evaluates the channels and witnesses, checks complete positivity and normalization, checks every code and converse inequality at its declared block length, checks the convergence modulus, evaluates (J.8.10a) at the certified $\Sigma$ interval, and checks every overlap square and source partition. Failure of any check rejects the transfer; a positive entropy-production number by itself never populates this certificate.

**Theorem J.8.11 (Strict Leading Horizon-Capacity Coefficient on the Transfer Branch).** Suppose Theorem J.8.4 gives $\Sigma\ge\sigma_{\min}>0$, $\mathfrak C_{\Sigma C}$ is accepted, and $\Delta_C:=g(\sigma_{\min})>0$. If $C(\Phi_{\rm id})=2\log2$ and the density/additivity hypotheses of Theorem E.9.1 hold, then
$$
\limsup_{\mathcal A\to\infty}
\frac{S_\Sigma^{\rm op}}{\mathcal A}
\le
\frac{\chi(2\log2-\Delta_C)}{\eta\delta^2}
<
\frac{2\chi\log2}{\eta\delta^2}.
\tag{J.8.11}
$$
On the additional branch $\chi=\eta=1$ and $\delta^2=8\log2\,L_P^2$, the rightmost coefficient is $1/(4L_P^2)$. This is strictness of the leading area-density coefficient; a finite-area strict inequality additionally requires a quantitative remainder bound.

*Proof.* Monotonicity of $g$ on the certified interval gives $C(\Phi_{\rm phys})\le2\log2-\Delta_C$. Substitute this capacity in (E.9.1a), divide by $\mathcal A$, and use $o(\mathcal A)/\mathcal A\to0$. The final substitution is arithmetic. ∎

**Definition J.8.12 (Observer-Algebra/Trace Realization Certificate).** An observer-algebra certificate specifies a represented von Neumann algebra $\mathcal M$, a faithful normal state or semifinite weight $\varphi$, the modular action $\sigma^\varphi$, and, when invoked, a represented crossed product $\mathcal N=\mathcal M\rtimes_{\sigma^\varphi}\mathbb R$. It supplies the domains and self-adjointness data of the observer clock, a faithful semifinite trace $\tau$ or finite-trace corner $p\mathcal Np$, a normalized density $h$, and the convention
$$
S_\tau(h)=-\tau(h\log h)
$$
with units, additive constant, regulator, convergence proof and error bound. A restriction claim additionally supplies a normal channel from the retained full algebra to the accessible algebra and the state/code family on which data processing is applied; strict loss requires a certified strict data-processing or capacity-gap constant. A cosmological interpretation additionally supplies on the same branch the Lorentzian continuum, state-selection, stress-tensor, horizon, Einstein-equation and cosmological-constant maps, with a source-exhaustion/no-double-counting table.

**Remark J.8.13 (Algebraic Scope).** An accepted Definition J.8.12 certificate proves its represented algebraic trace and entropy statements. A declared normal restriction channel adds the corresponding data-processing inequality, and a certified strictness constant adds the stated strict loss. Horizon and cosmological conclusions follow when the same certificate also carries the listed continuum, state, stress-tensor, gravitational, observable, and source-exhaustion maps.

**J.9 Conclusion**

A reset dissipates heat when its physical implementation erases uncertain information. The implementation's actual erasures determine that dissipation.

**Technical ledger.**

On the declared binary-ancilla architecture, noninjectivity displaces a binary structural label only when the reachable pre-reset domain and fixed-ready-state hypotheses of Definition J.1 hold. An injective extension may retain that label in side information. If a classical record $P$ is later reset while a classical record $R$ remains available and unchanged, the registered branch obeys
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}\ge H_q(P\mid R).
$$
SPAP alone fixes neither this architecture nor the joint law $q$.

