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

**Lemma J.1a (Ancilla Extension and Conditional Boundary Displacement).** Let the accessible map in Definition J.1 have a fiber containing two distinct inputs, and let an injective implementation append an auxiliary register $G$ initialized in a fixed state. The two final $G$ states over that fiber must be distinguishable. This is a cardinality statement, not an ensemble-entropy statement.

If $G$ is retained, no reset-heat conclusion follows. If $G$ is reset while classical side information $R$ remains available and unchanged, its registered law obeys
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
\ge H_q(G\mid R).
$$
For a conditionally uniform binary displaced label with no retained copy, the right-hand side is $\ln2$; otherwise it can be smaller, including zero.

*Proof.* Injectivity forces distinct auxiliary outputs for distinct inputs that share the same accessible output. Conditional Landauer applies only to a subsequent registered reset and uses its actual joint law with all retained side information. ∎

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

**J.5 Distinction from Existing Bounds**

The structural value $\varepsilon_0=\ln2$ counts a binary alphabet. The physical bath-heat ledger depends on $H_q(P\mid R)$, and the total entropy production is the excess $k_B\varepsilon_{\mathrm{diss}}$. Measurement, feedback, finite-time, and reservoir costs may be added only through compatible implementation theorems with an explicit no-double-counting rule.

**J.6 Consequences for the Predictive Universe Framework**

1. A declared reset with $H_q(P\mid R)>0$ exports positive bath heat; thermodynamic irreversibility additionally requires $\varepsilon_{\mathrm{diss}}>0$.
2. Strict trace-distance contraction requires the separate refresh/minorization hypothesis of Lemma E.1.
3. The fixed binary reset-support certificate of Proposition E.2a gives its own support-dimension capacity bound.
4. No area-law, gravitational, reflexivity, arrow-of-time, or locality conclusion follows from $\varepsilon_0=\ln2$ alone; each requires the independent bridge cited in its theorem.


**J.7 Conclusion**

On the declared binary-ancilla architecture, noninjectivity displaces a binary structural label only when the reachable pre-reset domain and fixed-ready-state hypotheses of Definition J.1 hold. An injective extension may retain that label in side information. If a classical record $P$ is later reset while a classical record $R$ remains available and unchanged, the registered branch obeys
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}\ge H_q(P\mid R).
$$
SPAP alone fixes neither this architecture nor the joint law $q$.

