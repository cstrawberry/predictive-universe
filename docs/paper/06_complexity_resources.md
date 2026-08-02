# 6. Complexity, Performance, and Adaptation Dynamics

This section studies the interplay between complexity, predictive performance, and adaptation dynamics within the Predictive Universe framework. It defines the PCE optimization model, states complexity-performance scaling hypotheses, derives an exponential performance law under an explicit multiplicative-composition condition, and analyzes the resulting dynamics. For states belonging to the qualifying set of Definition 13, $C\ge C_{op}$; the further inequality $C_{op}\ge K_0$ holds only under the realization and complexity-capacity bridge hypotheses of Corollary 3.

## 6.0 The Capacity Bound as Structural Constraint

**Capacity branch note.** The refresh/minorization branch gives the theorem-level strict ND-RID bound $C_{\max}<\ln d_0$ under Lemma E.1 and Theorem E.2. Independently, a registered completed reset of an $r$-dimensional factor inside the $d_0$-dimensional MPU Hilbert space gives $C(\mathcal E_N)\le\ln d_0-\ln r$ by Proposition E.2a. For a binary registered reset, $r=2$. Exact equalities such as $C_{\max}^*=\ln d_0-\varepsilon_0=2\ln2$ require the separate residual-budget same-family saturation branch; they do not follow from SPAP or from the refresh strict-capacity bound alone.

*Throughout this section, natural units $\hbar = c = k_B = 1$ are used unless otherwise noted.*

Finite predictive transfer is bounded on two independent channel branches. A registered completed reset of an $r$-dimensional factor gives $C(\mathcal E_N)\le\ln d_0-\ln r$ by Proposition E.2a, specializing to $\ln d_0-\ln2$ for $r=2$. A refresh/minorization channel independently gives $C_{\max}<\ln d_0$ by Theorem E.2. The first conclusion uses fixed-ready-state support loss; the second uses the full-state refresh component of Lemma E.1. SPAP alone implies neither physical channel architecture.

### 6.0.1 Capacity Manifestations Across Domains

**Theorem 6.0.1 (Conditional Capacity-Bound Propagation).** *Finite predictive-transfer capacity supplies the following bounds and, on the saturated Clausius-calibration branch, the following gravitational relation:*

| Domain | Capacity Role | Derived Relation | Reference |
|:-------|:--------------|:-----------------|:----------|
| Information channels | Upper bound on reliable transmission | $C_{\max}\le\ln d_0-\ln r$ on the completed reset-support branch (specializing to $\ln d_0-\ln2$ for $r=2$); $C_{\max}(f_{RID})<\ln d_0$ on the refresh/minorization branch | Proposition E.2a; Theorem E.2 |
| Horizon entropy | Entropy upper bound per boundary channel | $S_{channel}^{max}\le k_BC_{\max}$ | Corollary E.2 |
| Gravitational calibration | Inverse proportionality on the capacity-saturated area-law branch | $G=\frac{\eta\delta^2c^3}{4\hbar\chi C_{\max}}$ | Equation E.9 |

*Here $\delta$ is the effective MPU spacing, $\eta$ is the geometric packing factor, and $\chi$ is the correlation factor defined in Theorem E.3. The equality in the gravitational row additionally assumes that boundary channels attain the registered capacity and that the Clausius normalization is imposed.*

*Proof.*

**Part A (Information Channels).** On the tensor-factor reset branch of Proposition E.2a, every one-use output is supported on a subspace of dimension $m=d_0/r$, and the memoryless $n$-use channel has output support dimension at most $m^n$, even for entangled inputs. For any $n$-use input ensemble $\{q_i,\rho_i\}$ with outputs $\sigma_i$ and average $\bar\sigma=\sum_iq_i\sigma_i$, its Holevo information satisfies
$$
\chi
=S(\bar\sigma)-\sum_iq_iS(\sigma_i)
\le S(\bar\sigma)
\le\ln\operatorname{rank}(\bar\sigma)
\le n\ln(d_0/r).
$$
Dividing by $n$ and taking the supremum over blocklengths and ensembles gives
$$
C(\mathcal E_N)\le\ln d_0-\ln r,
$$
and $r=2$ gives $C(\mathcal E_N)\le\ln d_0-\ln2$.

On the independent refresh/minorization branch, append a receiver-visible flag to
$$
\mathcal E_N=(1-p)\Psi+pT_\sigma,
\qquad p>0.
$$
For $n$ uses, the flag pattern is independent of the encoded message. Conditional on a pattern with $k$ nonrefresh positions, all message dependence lies in a space of dimension at most $d_0^k$, so the conditional Holevo information is at most $k\ln d_0$. Averaging over the binomial flag pattern gives
$$
\chi_n\le\mathbb E[k]\ln d_0
=n(1-p)\ln d_0.
$$
Discarding the flag cannot increase accessible classical information. Dividing by $n$ and taking the regularized supremum therefore yields
$$
C(\mathcal E_N)\le(1-p)\ln d_0<\ln d_0.
$$

**Part B (Horizon Entropy).** Corollary E.2 gives the per-channel upper bound
$$
S_{channel}^{max}\le k_BC_{\max}.
$$
With $N_{eff}=\sigma_{link}\mathcal A$ and $\sigma_{link}=\chi/(\eta\delta^2)$ from Theorem E.3,
$$
S_{boundary}
\le\sigma_{link}\mathcal A\,k_BC_{\max}.
$$
Equality requires an achievable capacity-saturating boundary ensemble and saturation by every counted effective channel.

**Part C (Gravitational Constant).** On that saturation branch, impose the local-horizon Clausius normalization used in Equation E.9. The equality of area coefficients then gives
$$
G=\frac{\eta\delta^2c^3}
{4\hbar\chi C_{\max}(f_{RID})}.
$$
This expression is dimensionally consistent because $[\delta^2c^3/\hbar]=L^3M^{-1}T^{-2}=[G]$. On the additional residual-budget branch with $d_0=8$ and $\varepsilon_0=\ln2$,
$$
C_{\max}^*=\ln d_0-\varepsilon_0
=\ln8-\ln2=2\ln2.
$$
Substitution gives the corresponding conditional calibration of $G$ in terms of the microscopic parameters. ∎

**Principle 6.0 (Capacity Constraint Propagation).** *Finite predictive-transfer capacity is branch-constrained by the reset-support deficit $C(\mathcal E_N)\le\ln d_0-\ln r$ on a registered completed reset and, independently, by $C_{\max}<\ln d_0$ on a refresh/minorization branch. Gravitational or thermodynamic conclusions require their additional density, saturation, calibration, and implementation hypotheses.*

**Remark 6.0.1: Conditional Origins of the Capacity Bounds.** The support-deficit route begins with a separately registered physical implementation:
$$
\text{reachable binary record}
+
\text{completed tensor-factor reset-support certificate}
\xrightarrow{\text{Prop E.2a}}
C_{\max}\le\ln d_0-\ln2.
$$
For the same registered reset ensemble, Theorem 31 supplies the independent heat ledger
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
\ge H_q(P\mid R).
$$
On a refresh/minorization branch, the channel-dynamical route is
$$
\mathcal{E}_N=(1-p)\Psi+pT_\sigma,\ p>0
\xrightarrow{\text{Lem E.1}} f_{RID}<1
\xrightarrow{\text{Thm E.2}} C_{\max}<\ln d_0.
$$
SPAP supplies the diagonal prediction obstruction but does not imply either physical channel branch. A geometric or gravitational conclusion additionally requires the area-density, capacity-saturation, and local Clausius hypotheses of Theorems E.3 and E.5.

**Remark 6.0.2: Residual-Budget Saturation Branch.** The declared reusable binary SPAP register has structural log-cardinality $\varepsilon_0=\ln2$ (Proposition 5; Theorem J.1), while Definition 28 and Theorem 31 govern only a registered physical reset ledger. The completed binary reset gives
$$
C_{\max}\le\ln d_0-\varepsilon_0.
$$
Assume the residual-budget branch on which no additional response-relevant or implementation deficit remains and an admissible channel attains this upper bound. For the Theorem-Z.2 comparator value $d_0=8$, Equations (E.14)--(E.15) give
$$
C_{\max}^*=\ln d_0-\varepsilon_0=\ln 8-\ln 2=2\ln 2.
$$
This equality is the branch-specific partition of the MPU information budget between the structural binary register cost and the residual external communication capacity; the reset-support theorem alone supplies only the preceding inequality.

---

## 6.1 Principle of Compression Efficiency (PCE)

The adaptation of predictive systems is governed by an optimization principle that balances predictive utility against resource costs.

**6.1.1 Definition 14 (Def 14): Optimal Complexity Allocation Criteria**

Throughout the differential model in Sections 6.1–6.8, let
$$
C(t):=\langle\hat C_v\rangle(t)
$$
be the continuous operational complexity coordinate, measured in the same calibrated bit units as the proxy baseline corresponding to $C_{op}$. Assume that $PP(C,\hat C_{target})$, $R(C)$, and $R_I(C)$ admit the differentiable interpolations stated below on this operational domain. The integer-valued theoretical quantity $C_P$ remains distinct; equality $C_P=\langle\hat C_v\rangle$ is used only on branches satisfying the hypotheses of Theorem 2.

The Optimal Complexity Allocation $C^*$ is a maximizer of the declared net-benefit function on this operational domain for a registered task-scale coordinate $\hat C_{target}$ and resource-scarcity weight $\lambda$.


Let
$$
J(C):=\Gamma_0PP(C,\hat C_{target})-\lambda R(C)-R_I(C)
$$
on the feasible domain $C\ge C_{op}$. Assume these functions are twice differentiable near a candidate allocation $C^*$.

1. **Interior stationarity.** If $C^*>C_{op}$ is an interior local maximizer, then
   $$
   J'(C^*)
   =\Gamma_0\frac{\partial PP}{\partial C}\bigg|_{C^*}
   -\lambda R'(C^*)-R_I'(C^*)=0,
   \quad \text{(18)}
   $$
   so marginal benefit equals marginal cost.

2. **Strict local maximality.** If Equation (18) holds and
   $$
   J''(C^*)
   =\Gamma_0\frac{\partial^2PP}{\partial C^2}\bigg|_{C^*}
   -\lambda R''(C^*)-R_I''(C^*)<0,
   \quad \text{(19)}
   $$
   then $C^*$ is a strict local maximizer. At the boundary $C^*=C_{op}$, the corresponding one-sided necessary condition is $J'(C_{op})\le0$; Equation (18) is not required.

3. **Viability constraint.** An operationally viable allocation must also satisfy $\alpha<PP(C^*,\hat C_{target})<\beta$.

**6.1.2 Definition 15 (Def 15): Principle of Compression Efficiency (PCE)**

The Principle of Compression Efficiency declares an objective on a specified admissible comparison class: maximize registered predictive benefit while charging every registered acquisition, representation, processing, update, maintenance, and adaptation cost. It does not by itself prove that a minimizer exists or that physical dynamics reaches one. A PCE-attractor conclusion requires an explicit adaptation law together with attainment, invariance, stability, recurrence or convergence, and strictness hypotheses appropriate to that law. When those records are supplied, the objective balances Meaning Potential, quantified through registered improvements such as $\Delta Q$, against the Signal Cost entries $R(C)$ and $R_I(C)$ and their operational representatives.

**Remark (Relation to PPI).** PCE supplies an explicit potential $V$ and adaptation dynamics on a declared admissible class. Existence of a global minimizer requires attainment hypotheses; uniqueness modulo symmetry, flat QFI, and capacity saturation require additional branch conditions. The phrase "PCE selects" refers to minimization subject to those stated conditions.

**Definition 15a (Def 15a): PCE-Attractor Branch**

Let $\mathcal G_V$ be the declared group of gauge, relabeling, and other symmetries preserving $V$. A **PCE-Attractor branch** is a branch on which:

1. $V$ attains its infimum and $\mathcal E_*^{\mathrm{global}}\ne\varnothing$;
2. the quotient minimizer set is a singleton,
$$
\mathcal E_*^{\mathrm{global}}/\mathcal G_V=\{[x_{\mathrm{attr}}]\};
$$
3. the selected orbit has the U(1)-sector flat SLD-QFI spectrum $\sigma^2=0$ required by the cited Appendix W and Z branch;
4. the constrained minimum of the rate-level potential lies on the declared upper capacity boundary; on the one-dimensional cap-active branch, the unconstrained minimizer lies strictly above that boundary.

The symbol $x_{\mathrm{attr}}$ denotes a chosen representative of this orbit. Theorem D.3 may be used to infer geometric regularity only when its strict-comparison hypothesis holds; it does not establish clauses 1–4. The equality $\kappa^*_{\mathrm{bulk}}=1$ requires the separate unit Predictive-Ward branch of Theorem Z.14 and Theorem X.3.

**6.1.3 Definition 16 (Def 16): Prediction Optimization Problem - Operational Goal**

The Prediction Optimization Problem (POP, Axiom 1), when viewed operationally within the adaptation dynamics driven by PCE (Definition 15), is the ongoing challenge for the adaptive system to dynamically allocate its limited resources (manifesting as operational costs $\langle \hat{R} \rangle, \langle \hat{R}_I \rangle$, Theorem 3, weighted by scarcity $\lambda$) by adapting its internal model complexity (represented by $\langle \hat{C}_v \rangle$, Theorem 1) to achieve the highest possible predictive performance $PP(C, \hat{C}_{target})$ (consistent with Theorem 19), while strictly adhering to the viability constraint $PP(t) \in (\alpha, \beta)$ (Axiom 3). The system adaptively seeks the complexity level $C^*(t)$ that satisfies the optimal allocation criteria (Definition 14) consistent with PCE.

**6.2 Complexity-Performance Scaling Principles**

We now establish the general principles governing the relationship between invested complexity and achievable performance, and derive the expected functional form.

**6.2.1 Definition 17 (Def 17): Physical Realizability**

A predictive model $M$ or system state $\mu$ is physically realizable when there is a single finite program satisfying every constraint in the declared hierarchy:
$$
\bigcap_{n\ge0}\mathcal M_n(\mu)\ne\varnothing.
$$
Any $P_{\mathrm{phys}}$ in this intersection gives
$$
C_{P,n}(\mu)\le K(P_{\mathrm{phys}})
$$
for every $n$, so the monotone limit $C_P(\mu)$ is finite. The converse from finite stagewise minima to a common realizer is used only under the declared finite program alphabet, integer-valued program length, nested admissible sets, and attained-minimum hypotheses of Theorem 2.4.1a; under those hypotheses the descending finite minimizer sets have a nonempty intersection.

**6.2.2 Definition 18 (Def 18): PPC Requirement $C_{PPC}(PP_{target})$**

For a target average predictive performance $PP_{target}$ within the viable range $(\alpha, \beta)$, the Predictive Physical Complexity Requirement $C_{PPC}(PP_{target})$ is the minimum theoretical complexity $C_P$ (Equation 1) required by any physically realizable (Definition 17) model $M$ or system state to achieve that performance level on average against a given predictive challenge:
$$
C_{PPC}(PP_{target}) = \inf \{ C_P(\mu) \mid \mu \in \mathcal{S}_{phys}, \mathbb{E}[PP(f_{\mu})] \geq PP_{target} \} \quad \text{(20)}
$$
where the expectation $\mathbb{E}[\cdot]$ averages over relevant environmental conditions or task distributions.

**6.2.3 Theorem 17 (Complexity Lower Bound above a Nonviable Budget)**

Choose an environment and task distribution, and define
$$
PP_{\max}(C)
:=\sup\{\mathbb E[PP(f_\mu)]\mid
\mu\in\mathcal S_{phys},\ C_P(\mu)\le C\}.
$$
Assume $PP_{\max}(C_{op})\le\alpha$. Then every physically realizable state $\mu$ with $\mathbb E[PP(f_\mu)]>\alpha$ satisfies $C_P(\mu)>C_{op}$.

*Proof.* If $C_1\le C_2$, then
$$
\{\mu:C_P(\mu)\le C_1\}
\subseteq
\{\mu:C_P(\mu)\le C_2\},
$$
so $PP_{\max}$ is non-decreasing. Suppose $C_P(\mu)\le C_{op}$. By the definition of the supremum and the hypothesis,
$$
\mathbb E[PP(f_\mu)]
\le PP_{\max}(C_P(\mu))
\le PP_{\max}(C_{op})
\le\alpha.
$$
The contrapositive gives $\mathbb E[PP(f_\mu)]>\alpha\Rightarrow C_P(\mu)>C_{op}$. ∎

**6.2.4 Physical Nature of Complexity Transformations (Thermodynamic Irreversibility)**

The adaptation process involves changing the system's complexity $C(t) \to C(t+1)$ (Section 6.4). This corresponds to a physical transformation within the system's representational medium (Theorem 7). Implementing such changes requires physical operations that consume resources (transient Adaptation Costs, part of the SC in Definition 15). Model adaptation involves information processing (e.g., incorporating new data, computing updates) and typically requires logically irreversible information erasure (e.g., discarding outdated model components or hypotheses). By the fundamental link between information and thermodynamics (Landauer's Principle; specifically the bound $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$, Theorem 31), any logically irreversible operation that must be physically instantiated and cyclically reset incurs irreducible entropy production and energy dissipation. Therefore, complexity transformation ($C(t) \to C(t+1)$) is generally a thermodynamically irreversible physical process associated with resource costs and entropy generation, constraining the dynamics and efficiency of adaptation.

**6.2.5 Definition 19 (Def 19): Complexity-Performance Scaling Principles**

Definition 19 specifies a branch-level analytic interpolation for a declared task, score, evaluation window, boundary coordinate $C_{op}$, and estimated target scale $\hat C_{target}$. Let $\overline{PP}$ denote its continuous analytic extension to $C=C_{op}$; the corresponding viable physical performance curve is its restriction $PP=\overline{PP}|_{C>C_{op}}$. This definition is not a model-existence or infimum-attainment theorem.

1.  **Bounds and boundary value:** The image of $\overline{PP}$ for $C\ge C_{op}$ lies in $[\alpha,\beta)$, while the viable realized image of $PP$ lies in $(\alpha,\beta)$:
$$
\overline{PP}(C_{op},\hat{C}_{target})=\alpha,\qquad \lim_{C\to\infty} PP(C,\hat{C}_{target})=\beta.
$$
The response-law parameter $\beta$ is approached asymptotically but not reached for finite $C$ on this branch. It is distinct from Theorem 9's certified pathwise ceiling $\beta_0$ and from any task-relative SPAP boundary; neither Theorem 9 nor PCE alone derives this response law.

**Same-task attainment guard.** Suppose this $PP$ is the score used in Definition 13, $\alpha$ is that task's random-baseline value, the qualifying margin is strictly positive, and a registered same-state complexity bridge sends an attained $\mu_*$ with $C_P(\mu_*)=C_{op}$ to the response-law coordinate $C=C_{op}$. Then every $\mu\in\mathcal Q$ has $PP(\mu)>\alpha$, so the displayed extension value cannot be assigned to that same-task MPU. The $\alpha$-anchored law is admissible only as a nonattained analytic-boundary interpolation or on a separately indexed task, score, evaluation-window, or complexity-coordinate branch. An attained branch requires the missing same-state bridge together with a separately specified boundary anchor greater than $\alpha$ and propagation of that anchor through its response law; no such joint package is derived here.

2.  **Monotonicity with Complexity:** Performance increases with complexity investment above the baseline: $\partial PP / \partial C > 0$ for $C > C_{op}$.
3.  **Diminishing Returns:** The marginal gain in performance decreases as complexity increases: $\partial^2 PP / \partial C^2 < 0$ for $C > C_{op}$. Achieving further improvements becomes progressively harder.
4.  **Dependence on Relative Complexity:** Performance depends primarily on the ratio of invested complexity above baseline relative to the task difficulty, i.e., on a function of $x = (C-C_{op})/\hat{C}_{target}$. Increasing the target difficulty $\hat{C}_{target}$ for a fixed complexity $C$ decreases performance $PP$.

**6.2.6 Theorem 18 (Functional Form under Exact Relative-Complexity Scaling)**

Assume $\beta>\alpha$, $\hat C_{target}>0$, and exact relative-complexity scaling: there is a continuous function $G:[0,\infty)\to[\alpha,\beta)$, twice differentiable on $(0,\infty)$, such that on the analytic extension
$$
\overline{PP}(C,\hat C_{target})=G(x),
\qquad
x=\frac{C-C_{op}}{\hat C_{target}},
$$
with $G(0)=\alpha$, $\lim_{x\to\infty}G(x)=\beta$, $G'(x)>0$, and $G''(x)<0$ for $x>0$. Then, for $C>C_{op}$,
$$
PP(C,\hat C_{target})
=\alpha+(\beta-\alpha)F\left(\frac{C-C_{op}}{\hat C_{target}}\right),
\quad \text{(21)}
$$
where $F:[0,\infty)\to[0,1)$ satisfies $F(0)=0$, $\lim_{x\to\infty}F(x)=1$, $F'(x)>0$, and $F''(x)<0$ for $x>0$.

*Proof.* Define
$$
F(x):=\frac{G(x)-\alpha}{\beta-\alpha}.
$$
Because $\beta-\alpha>0$ and $G(x)\in[\alpha,\beta)$, $F(x)\in[0,1)$. The boundary values give
$$
F(0)=0,
\qquad
\lim_{x\to\infty}F(x)=1.
$$
Differentiation yields
$$
F'(x)=\frac{G'(x)}{\beta-\alpha}>0,
\qquad
F''(x)=\frac{G''(x)}{\beta-\alpha}<0.
$$
Substitution of the definition of $F$ and restriction to $C>C_{op}$ give Equation (21). ∎

**6.3 Derivation of the Law of Prediction from POP / PCE**

The scaling principles of Definition 19 determine a class of saturation curves. The exponential member is selected by the following additional composition hypothesis: independent refinement stages act linearly on the unresolved performance fraction, and sequential stages with relative budgets $x_1,x_2$ have the same response as one stage with budget $x_1+x_2$.

**6.3.1 Theorem 19 (Law of Prediction — Exponential Saturation under Multiplicative Composition)**

Assume Theorem 18 and define, on its analytic extension,
$$
x:=\frac{C-C_{op}}{\hat C_{target}}\ge0,
\qquad
g(x):=\frac{\beta-G(x)}{\beta-\alpha}.
$$
Assume additionally that
$$
g(x_1+x_2)=g(x_1)g(x_2)
\qquad\text{for all }x_1,x_2\ge0.
\tag{*}
$$
Then there is a dimensionless constant $\kappa_{\mathrm{eff}}>0$ such that, for every $C>C_{op}$,
$$
PP(C,\hat C_{\mathrm{target}})
=\beta-(\beta-\alpha)
\exp\!\Bigl[-\kappa_{\mathrm{eff}}\,
\tfrac{C-C_{op}}{\hat C_{\mathrm{target}}}\Bigr].
\quad \text{(22)}
$$
The continuous extension of (22), not a physical state on this branch, has value $\alpha$ at $C=C_{op}$. For $PP\in(\alpha,\beta)$, the inverse is
$$
C(PP,\hat C_{\mathrm{target}})
=C_{op}+\frac{\hat C_{\mathrm{target}}}{\kappa_{\mathrm{eff}}}
\ln\!\Bigl(\tfrac{\beta-\alpha}{\beta-PP}\Bigr).
\quad \text{(23)}
$$

*Proof.* Theorem 18 gives $g(0)=1$, $0<g(x)\le1$, strict decrease on $(0,\infty)$, and continuity. Positivity permits
$$
h(x):=\ln g(x).
$$
Taking logarithms in (*) gives
$$
h(x_1+x_2)=h(x_1)+h(x_2)
\qquad(x_1,x_2\ge0).
$$
For every nonnegative integer $n$, additivity gives $h(n)=nh(1)$. For positive integers $m,n$,
$$
nh(m/n)=h(m)=mh(1),
$$
so $h(q)=qh(1)$ for every nonnegative rational $q$. For any $x\ge0$, choose nonnegative rationals $q_n\to x$. Continuity yields
$$
h(x)=\lim_{n\to\infty}h(q_n)=xh(1).
$$
Because $g$ is strictly decreasing and $g(0)=1$, $g(1)<1$, hence $h(1)<0$. Set $\kappa_{\mathrm{eff}}:=-h(1)>0$. Then
$$
g(x)=e^{h(x)}=e^{-\kappa_{\mathrm{eff}}x}.
$$
Substitution of $G(x)=\overline{PP}(C,\hat C_{\mathrm{target}})$ and the definition of $x$, followed by restriction to $C>C_{op}$, gives Equation (22). Rearranging it on that domain gives
$$
e^{-\kappa_{\mathrm{eff}}(C-C_{op})/\hat C_{\mathrm{target}}}
=\frac{\beta-PP}{\beta-\alpha},
$$
and taking logarithms yields Equation (23). ∎

*Remark:* Equation (23) implies $(C-C_{op})\propto -\ln(\beta-PP)$ as $PP\to\beta$, consistent with logarithmic rate–distortion scaling when the operational prediction error is proportional to the performance gap.

**Definition 19a (Effective Complexity Scale $C_s$).** For a given target complexity $\hat{C}_{target}$, define the e-fold complexity scale of the Law of Prediction by
$$
C_s := \frac{\hat{C}_{target}}{\kappa_{\mathrm{eff}}}.
\tag{22a}
$$
Then, on the physical domain $C>C_{op}$, Equation (22) becomes
$$
PP(C)=\beta-(\beta-\alpha)e^{-(C-C_{op})/C_s},
\tag{22b}
$$
and for $PP\in(\alpha,\beta)$ the inverse relation is
$$
C(PP)=C_{op}+C_s\ln\!\frac{\beta-\alpha}{\beta-PP}.
\tag{22c}
$$

**Proposition 19a (Interior Equilibrium Form of $C_s$).** Assume the exponential branch of Theorem 19 and let $C^*>C_{op}$ be an interior stationary PCE point with $PP^*\in(\alpha,\beta)$. Then
$$
C_s=\frac{\Gamma_0(\beta-PP^*)}{\lambda R'(C^*)+R_I'(C^*)}.
\tag{22d}
$$

*Proof.* Interior stationarity gives
$$
\Gamma_0\left.\frac{\partial PP}{\partial C}\right|_{C^*}
=\lambda R'(C^*)+R_I'(C^*).
$$
Equation (22b) gives
$$
\left.\frac{\partial PP}{\partial C}\right|_{C^*}
=\frac{\beta-PP^*}{C_s}>0.
$$
Since $\Gamma_0>0$, the equilibrium equation makes the marginal-cost sum positive. Substitution followed by division by that positive sum gives Equation (22d). ∎

**Corollary 19.1 (Conditional Power-Law Learning Curves on Logarithmic Complexity Budgets).** Fix a registered predictive-system branch satisfying every hypothesis of Theorem 19, with branch-fixed parameters $\alpha,\beta,C_{op},\hat C_{\mathrm{target}}$, and $\kappa_{\mathrm{eff}}$. Define the analytic composite $\overline{PP}(N):=\overline{PP}(C(N),\hat C_{\mathrm{target}})$ for $N\ge N_0$ and its physical restriction $PP(N):=\overline{PP}(N)$ for $N>N_0$. Assume independently that the registered positive experience coordinate $N$ and effective predictive complexity obey the exact logarithmic budget
$$
C(N)-C_{op}=\eta_{\ell}\ln\!\bigl(N/N_0\bigr),
\qquad N\ge N_0>0,
\qquad \eta_{\ell}>0.
\tag{22e}
$$
Under these joint branch hypotheses, the analytic performance gap obeys the exact power law
$$
\beta-\overline{PP}(N)=(\beta-\alpha)\bigl(N/N_0\bigr)^{-s},
\qquad
s=\frac{\kappa_{\mathrm{eff}}\eta_{\ell}}{\hat C_{\mathrm{target}}}>0.
\tag{22f}
$$
At $N=N_0$ this is the formal boundary normalization $\overline{PP}(N_0)=\alpha$; for $N>N_0$ it is the physical $PP$ law.

*Proof.* Substitute (22e) into the analytic extension of Equation (22b), using $C_s=\hat C_{\mathrm{target}}/\kappa_{\mathrm{eff}}$ from Definition 19a:
$$
\beta-\overline{PP}(N)
=(\beta-\alpha)\exp\!\left[-\frac{C(N)-C_{op}}{C_s}\right]
=(\beta-\alpha)\exp\!\left[-\frac{\kappa_{\mathrm{eff}}\eta_{\ell}}{\hat C_{\mathrm{target}}}\ln(N/N_0)\right].
$$
Using $\exp[-s\ln(N/N_0)]=(N/N_0)^{-s}$ gives (22f). Positivity of $s$ follows from $\kappa_{\mathrm{eff}},\eta_{\ell},\hat C_{\mathrm{target}}>0$. Restriction to $N>N_0$ gives the physical statement. ∎

**Remark 19.1a (Interpretation of (22e)).** Equation (22e) is additional branch data; it is not implied by POP, PCE, Definition 19, or Theorem 19. On a connected differentiable range $N\ge N_0$, Equation (22e) is equivalent to the boundary condition $C(N_0)=C_{op}$ together with
$$
N\frac{dC}{dN}=\eta_{\ell}
$$
throughout that range. Differentiating (22e) proves necessity, while integrating $dC/dN=\eta_{\ell}/N$ from $N_0$ to $N$ proves sufficiency. Consequently, a qualitative observation of diminishing returns does not establish the exact logarithmic budget. The constant $\eta_{\ell}$ has dimensions of complexity and must be fixed by the registered complexity-accumulation map; $\hat C_{\mathrm{target}}$ enters the resulting exponent only through $C_s=\hat C_{\mathrm{target}}/\kappa_{\mathrm{eff}}$.

**Corollary 19.2 (Conditional Size- and Data-Coordinate Power Laws).** Fix a registered aggregate predictive-system branch (Definition 29) satisfying every hypothesis of Theorem 19, with branch-fixed parameters $\alpha,\beta,C_{op},\hat C_{\mathrm{target}}$, and $\kappa_{\mathrm{eff}}$. Suppose its registered size coordinate $N_p$ and effective predictive complexity obey the exact relation
$$
C(N_p)-C_{op}=\eta_p\ln\!\bigl(N_p/N_{p,0}\bigr),
\qquad N_p\ge N_{p,0}>0,
\qquad \eta_p>0.
\tag{22g}
$$
Define $\overline{PP}(N_p):=\overline{PP}(C(N_p),\hat C_{\mathrm{target}})$ for $N_p\ge N_{p,0}$ and physical $PP(N_p):=\overline{PP}(N_p)$ for $N_p>N_{p,0}$. Then
$$
\beta-\overline{PP}(N_p)=(\beta-\alpha)\bigl(N_p/N_{p,0}\bigr)^{-s_p},
\qquad
s_p=\frac{\kappa_{\mathrm{eff}}\eta_p}{\hat C_{\mathrm{target}}}.
\tag{22h}
$$
On a separately registered data-size branch satisfying
$$
C(N_d)-C_{op}=\eta_d\ln(N_d/N_{d,0}),
\qquad N_d\ge N_{d,0}>0,
\qquad \eta_d>0,
$$
define the analogous analytic composite for $N_d\ge N_{d,0}$ and its physical restriction for $N_d>N_{d,0}$; the identity then holds with exponent $s_d=\kappa_{\mathrm{eff}}\eta_d/\hat C_{\mathrm{target}}$. If a registered branch instead has a nonempty finite coordinate set $\mathcal I$ whose positive-coordinate complexity contributions add exactly,
$$
C-C_{op}=\sum_{i\in\mathcal I}\eta_i\ln(N_i/N_{i,0}),
\qquad
N_i\ge N_{i,0}>0,
\qquad
\eta_i>0,
$$
then the analytic performance gap factorizes into
$$
\beta-\overline{PP}
=
(\beta-\alpha)
\prod_{i\in\mathcal I}
(N_i/N_{i,0})^{-\kappa_{\mathrm{eff}}\eta_i/\hat C_{\mathrm{target}}}.
$$
It is a physical $PP$ statement only where $C>C_{op}$, equivalently where at least one coordinate is strictly above its anchor.

*Proof.* Direct substitution of (22g) into the analytic extension of (22b) via Definition 19a gives (22h). The data-size and compositional statements follow from the same substitution in the additive logarithmic regime; restricting away from the joint anchor gives the physical statements. ∎

**Proposition 19.2a (Exact Finite-Record Compatibility Criterion for the Registered Power-Law Formula).** Fix $\alpha<\beta$ and $N_0>0$. Take the formal analytic-boundary datum
$$
(N_0,P_0):=(N_0,\alpha)
$$
together with exact registered off-boundary observations
$$
(N_k,P_k),
\qquad
k=1,\ldots,m,
\qquad
m\ge2,
$$
where
$$
N_0<N_1<\cdots<N_m,
\qquad
P_k<\beta.
$$
Index the combined formal-and-observational record by $k=0,1,\ldots,m$ and define
$$
G_k:=\frac{\beta-P_k}{\beta-\alpha}>0.
$$
There exists $s>0$ such that
$$
G_k=\left(\frac{N_k}{N_0}\right)^{-s}
\quad
\text{for every }k=0,1,\ldots,m
\tag{22i}
$$
if and only if
$$
G_0=1
$$
and the numbers
$$
s_k:=-\frac{\ln G_k}{\ln(N_k/N_0)},
\qquad
k=1,\ldots,m,
\tag{22j}
$$
are all defined, positive, and equal. Here $G_0=1$, equivalently $P_0=\alpha$, checks the formal boundary normalization rather than validation data. When these conditions hold, the common value is the unique exponent $s$.

*Proof.* If (22i) holds, then $G_0=1^{-s}=1$. For $k\ge1$, $N_k/N_0>1$, so taking logarithms in (22i) gives
$$
\ln G_k=-s\ln(N_k/N_0),
$$
and hence $s_k=s>0$. Conversely, suppose $G_0=1$ and every $s_k$ equals one common $s>0$. Rearranging (22j) gives
$$
\ln G_k=-s\ln(N_k/N_0)
$$
for each $k\ge1$. Exponentiation yields (22i) for $k\ge1$, while the $k=0$ case follows from $G_0=1$. If both $s$ and $s'$ satisfy (22i), then for $k=1$,
$$
(N_1/N_0)^{-s}=(N_1/N_0)^{-s'}.
$$
Taking logarithms and using $\ln(N_1/N_0)>0$ gives $s=s'$. ∎

Compatibility on finitely many off-boundary observations neither proves the formula between them nor verifies either antecedent from which Corollary 19.1 derives it.

**Remark 19.2 (Scope and Registered Falsifier).** Corollaries 19.1-19.2 are conditional images of two independent antecedents: Theorem 19's exact multiplicative residual-composition hypothesis and an exact logarithmic map from the registered resource coordinate to effective predictive complexity. Proposition 19.2a gives the exact-record compatibility test after $\alpha$, $\beta$, $N_0$, the score, task, system or population, measurement protocol, and coordinate range have been fixed. Failure of $G_0=1$ is a formal boundary-normalization failure, not empirical evidence. Failure of the off-boundary $s_k$ to be defined, positive, and equal rejects the formula on that exact observational record; it does not identify which antecedent failed and does not refute a whole empirical domain. With noisy observations, one joint uncertainty region, including any registered covariance, and the acceptance rule must be fixed before the holdout observations; the branch is rejected only when no common $s>0$ is compatible with that pre-registered joint region. Agreement with one power-law form does not establish equality of mechanism across carriers. Once $\alpha$, $\beta$, and $N_0$ are fixed, the curve identifies only the combination $\kappa_{\mathrm{eff}}\eta_\bullet/\hat C_{\mathrm{target}}$, not its three factors separately; all remain branch-specific unless a separate transport theorem identifies them.

On an explicitly registered mixture evaluation, let a resource-independent fraction $f\in[0,1]$ of scored examples be diagonal cycles satisfying Theorem 11a, let $L_{\mathrm{data}}(N)$ be the conditional mean logarithmic loss on the remaining examples, and measure logarithmic score in nats. Then
$$
L(N)\ge f\ln2+(1-f)L_{\mathrm{data}}(N).
$$
Equality in the diagonal contribution holds exactly when the predictor reports $p=1/2$ on every diagonal cycle. Under the lower bound alone, no mixture exponent follows. If instead $0\le f<1$ is fixed, $c\ne0$, every diagonal cycle reports $p=1/2$, and the complete registered loss contains no additional $N$-dependent mixture term, so that
$$
L(N)=f\ln2+(1-f)L_{\mathrm{data}}(N),
$$
then
$$
L_{\mathrm{data}}(N)
=L_{\mathrm{data},\infty}+cN^{-s_p}+o(N^{-s_p}),
\qquad s_p>0,
$$
implies
$$
L(N)
=f\ln2+(1-f)L_{\mathrm{data},\infty}
+(1-f)cN^{-s_p}+o(N^{-s_p}).
$$
Only under these equality and nondegeneracy hypotheses does the mixture inherit the exponent $s_p$. No architecture-, scale-, or tokenizer-independent transport conclusion follows without a separate theorem identifying the score and registered mixture across those representations.

**Remark 19.3 (Weber-Fechner Relation from Equation (5)).** Let a predictive system represent an external stimulus by allocating reflexive-information complexity $C$ above the Horizon Constant $K_0$ (Theorem 15). By Definition 3b and Equation (5), the representative reflexive-information cost rate is
$$
R_I(C;T_{\mathrm{eff}})=\frac{r_I(T_{\mathrm{eff}})}{\ln 2}\ln\!\bigl(C/K_0\bigr),
\qquad C\ge K_0.
$$
If the operational internal signal representing the stimulus is identified with the expended reflexive-information rate $R_I$, then for any two stimulus levels $C_1,C_2>K_0$ the internal difference is
$$
\Delta R_I=\frac{r_I}{\ln 2}\ln\!\bigl(C_2/C_1\bigr).
\tag{5a}
$$
A prescribed just-noticeable internal increment $\Delta R_I=\delta_R$ is equivalent to
$$
\frac{C_2}{C_1}=e^a,
\qquad
a:=\frac{\delta_R\ln2}{r_I}.
$$
Hence the exact fractional increment is
$$
\frac{C_2-C_1}{C_1}=e^a-1.
$$
Taylor's theorem gives
$$
e^a-1=a+\mathcal R_2(a),
\qquad
|\mathcal R_2(a)|\le\frac12e^{|a|}a^2.
$$
Thus $\Delta C/C=a+O(a^2)$ in the regime $|a|\ll1$.

*Proof.* Subtract Equation (5) at $C_1$ and $C_2$:
$$
R_I(C_2)-R_I(C_1)=\frac{r_I}{\ln 2}\left[\ln(C_2/K_0)-\ln(C_1/K_0)\right]
=\frac{r_I}{\ln 2}\ln(C_2/C_1).
$$
Solving $\Delta R_I=\delta_R$ gives the displayed ratio. For infinitesimal increments, differentiating (5) gives
$$
\frac{\partial R_I}{\partial C}=\frac{r_I}{C\ln 2},
$$
so $dR_I=(r_I/\ln 2)(dC/C)$ and fixed $dR_I$ is equivalent to fixed $dC/C$. ∎

This is the Weber-Fechner relation [Weber 1834; Fechner 1860]: the minimum discriminable stimulus increment is proportional to the stimulus magnitude, with logarithmic compression of perceived intensity. Within PU, the logarithmic form is the representative reflexive-information cost (5) already used by the framework. The identification of an operational internal signal with expended $R_I$ is an explicit psychophysical bridge assumption, not a claim that every stimulus code is exhausted by reflexive-information cost. For self-model-engaging perception, the relevant internal-cost interpretation is the perspectival profile and self-model cost functional of Appendix M §M.6.10, especially Definition M.10.1 and Proposition M.10.9. The logarithmic gain is $r_I/\ln 2$, while the Weber fraction is fixed by the chosen just-noticeable internal threshold $\delta_R$ through $\Delta C/C\approx \delta_R\ln 2/r_I$ in the small-increment limit.

**6.4 Adaptation Dynamics Driven by PCE**

The Principle of Compression Efficiency (PCE, Definition 15) mandates that systems dynamically adjust their configuration to minimize a global effective potential, balancing predictive benefits against comprehensive resource costs. The adaptation of complexity $C(t)$ is driven by the local gradient of this potential.

**6.4.1 Definition 20 (Def 20): PCE Potential and Adaptation Driving Force $\Psi(t)$**
The adaptation dynamics are governed by the **Principle of Compression Efficiency (PCE) Potential $V(x)$**, which quantifies the net cost rate for a given MPU network configuration $x$. As detailed in Appendix D (Definition D.1), its core components are:
*   **Costs ($V_{op} + V_{prop}$):** The total resource cost rate, including operational costs for maintaining complexity ($R, R_I$) and propagation costs for maintaining network coherence.
*   **Benefit ($V_{benefit}$):** The power-equivalent predictive benefit derived from the system's performance $PP$.
The system's slow adaptation dynamics are modeled as a stochastic gradient flow seeking to minimize this potential: $dx(t) = -\eta(x) \nabla_x V(x) dt + \dots$ (Equation D.8).

The **Adaptation Driving Force $\Psi(t)$** for the complexity component $C(t)$ is defined as the negative of the local gradient of this potential with respect to $C(t)$, representing the net incentive for complexity adaptation. It arises from the local imbalance between the marginal benefit of increased complexity and its marginal cost.

The Adaptation Driving Force is:
$$
\Psi(t) = \Gamma_0 \frac{\partial PP}{\partial C}\bigg|_{C(t)} - \left( \lambda R'(C(t)) + R_I'(C(t)) \right) \quad \text{(24)}
$$
where:
1.  The **Power Conversion Factor ($\Gamma_0$)**: A positive **system-level constant** with dimensions of Power ($[E][T]^{-1}$), representing the conversion rate from dimensionless predictive performance gradients to an equivalent power. Its magnitude is set by the characteristic energy of the operational environment and the MPU cycle rate, e.g., $\Gamma_0 \propto k_B T_{eff} \cdot \nu$. At an equilibrium complexity $C^*$, the condition $\Psi(C^*)=0$ yields the relation in Equation (29), linking $\Gamma_0$ to the marginal benefit and marginal costs at $C^*$.
2.  The **Resource Scarcity Factor $\lambda$**: A dimensionless weight ($\lambda \ge 0$), arising from the operational cost term $V_{op}$, representing the relative importance of physical versus informational costs.

The specific components of the driving force are:
*   **Marginal Benefit:** On the physical Law-of-Prediction branch and at times for which $C(t)>C_{op}$, the term $\Gamma_0 \frac{\partial PP}{\partial C}$ represents the marginal power-equivalent benefit rate per unit complexity increase, with units $[E][T]^{-1}[\text{Complexity}]^{-1}$. The performance gradient is
$$
\frac{\partial PP}{\partial C}\bigg|_{C(t), \hat{C}_{target}(t)}
= (\beta - \alpha)\left(\frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}(t)}\right)
e^{-\kappa_{\mathrm{eff}}\cdot \frac{C(t)-C_{op}}{\hat{C}_{target}(t)}}
= \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}(t)}\big(\beta - PP(t)\big),
\quad \text{with } PP(t)=\beta-(\beta-\alpha)\,e^{-\kappa_{\mathrm{eff}}\cdot \frac{C(t)-C_{op}}{\hat{C}_{target}(t)}} \quad \text{(25)}
$$
*   **Marginal Cost:** The term $\lambda R'(C(t)) + R_I'(C(t))$ is the weighted marginal resource cost rate, with units $[E][T]^{-1}[\text{Complexity}]^{-1}$. From Definition 3:
$$
    R_I'(C(t)) = \frac{r_I}{C(t) \ln 2} \quad (\text{for } C(t) > K_0) \quad \text{(26)}
    $$

*Interpretation:* The driving force $\Psi(t)$ quantifies the net marginal incentive for complexity changes: $\Psi > 0$ favors increasing $C$, $\Psi < 0$ favors decreasing $C$. Equilibrium, corresponding to the optimal complexity allocation (Definition 14), occurs when $\Psi = 0$, precisely where the gradient of the effective potential with respect to complexity vanishes.

**Theorem 20 (Conditional Calibration Relations for $\Gamma_0$)**

Let $\Gamma_0>0$ be the system-level conversion factor appearing in the PCE potential.

1. On a branch with completed-cycle rate $\nu$, one execution of each listed registered reset per cycle, and the Landauer hypotheses of Theorem 31, the reset power satisfies
   $$
   P_{\mathrm{reset}}\ge k_BT\nu
   \sum_{j=1}^{n_{\mathrm{reset}}}H_{q_j}(P_j\mid R_j).
   \quad\text{(27)}
   $$
   This inequality does not bound $\Gamma_0$ unless a separate calibration relation between reset power and the performance benefit scale is imposed.

2. If an independently registered available-power budget satisfies
   $$
   \Gamma_0\Delta PP_{\max}\le P_{\mathrm{avail}}
   $$
   for a declared $\Delta PP_{\max}>0$, then
   $$
   \Gamma_0\le\frac{P_{\mathrm{avail}}}{\Delta PP_{\max}}
   =:\Gamma_{0,\mathrm{crit}}.
   \quad \text{(28)}
   $$

3. At an interior equilibrium $C^*$ with $\partial PP/\partial C|_{C^*}>0$, Equation (24) gives the calibration identity
   $$
   \Gamma_0
   =\frac{\lambda R'(C^*)+R_I'(C^*)}
   {\frac{\partial PP}{\partial C}|_{C^*}}.
   \quad \text{(29)}
   $$
   Determination and uniqueness of $C^*$ require the existence and strict-concavity hypotheses of Theorem 22.

*Proof.* The first relation is the sum of the registered per-cycle reset-work bounds multiplied by the cycle rate. The second follows by dividing the declared budget inequality by $\Delta PP_{\max}>0$. At an interior equilibrium, $\Psi(C^*)=0$; substituting Equation (24) and dividing by the positive performance derivative yields Equation (29). ∎

**6.4.2 Proposition 3 (Complexity Adaptation Dynamics Model)**

Assume $C(t)>\max\{C_{op},K_0\}$, $\hat C_{target}(t)>0$, and that the trajectory remains in this physical response-law domain while the rate of change of complexity $C(t)=\langle\hat C_v\rangle(t)$ is proportional to the net driving force $\Psi(t)$:
$$
\frac{dC}{dt}=\eta_{adapt}\Psi(C(t),\hat C_{target}(t),\lambda,\Gamma_0),
\qquad \eta_{adapt}>0.
\tag{30}
$$
Then Equations (24)–(26) imply
$$
\frac{dC}{dt}=\eta_{adapt}\left[
\Gamma_0\frac{\kappa_{\mathrm{eff}}}{\hat C_{target}(t)}(\beta-PP(t))
-\lambda R'(C(t))
-\frac{r_I}{C(t)\ln2}
\right].
\tag{31}
$$
If $[\Psi]=[E][T]^{-1}[\mathrm{Complexity}]^{-1}$, then
$$
[\eta_{adapt}]=[E]^{-1}[\mathrm{Complexity}]^2.
$$
The model is restricted to the viable interval $(\alpha,\beta)$ before activation of Definition 22.

*Proof.* Equation (24) is
$$
\Psi=\Gamma_0\frac{\partial PP}{\partial C}-\lambda R'(C)-R_I'(C).
$$
Equations (25) and (26) give, respectively,
$$
\frac{\partial PP}{\partial C}
=\frac{\kappa_{\mathrm{eff}}}{\hat C_{target}}(\beta-PP),
\qquad
R_I'(C)=\frac{r_I}{C\ln2}.
$$
Substitution of these two identities into (24), followed by multiplication by $\eta_{adapt}$ in (30), gives (31) term by term. Finally,
$$
[\eta_{adapt}]
=\frac{[dC/dt]}{[\Psi]}
=\frac{[\mathrm{Complexity}][T]^{-1}}
{[E][T]^{-1}[\mathrm{Complexity}]^{-1}}
=[E]^{-1}[\mathrm{Complexity}]^2.
$$
The positivity assumptions make both displayed reciprocal complexity factors well defined. ∎

*Interpretation:* Complexity $C(t)$ evolves over time, driven by the imbalance $\Psi(t)$ between marginal benefits and costs, towards the locally optimal value $C^*(t)$ where $\Psi(t)$ approaches zero. This equilibrium $C^*(t)$ represents an efficient operating point satisfying the PCE principle (Definition 14, Equation 18). The dynamics depend explicitly on the current state ($C, \hat{C}_{target}$), the system's energy valuation ($\Gamma_0$), resource scarcity ($\lambda$), intrinsic performance efficiency ($\kappa_{\mathrm{eff}}$), informational overhead ($r_I$), and the marginal physical cost $R'$.

**Remark 4 (Interpretation of $\kappa_{\mathrm{eff}}$).**
The dimensionless performance-efficiency parameter $\kappa_{\mathrm{eff}}$, introduced in the Law of Prediction (Equation 22), can be expressed in terms of equilibrium quantities. At equilibrium the Adaptation Driving Force vanishes, $\Psi=0$ (Equation 18), and by definition (Equation 24):
$$
\Gamma_0 \,\frac{\partial PP}{\partial C} = \lambda R' + R_I'.
$$
Substituting Equation (25) for the derivative gives:
$$
\Gamma_0\,(\beta-\alpha)\, \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\text{target}}} \,e^{-\kappa_{\mathrm{eff}}(C^{*}-C_{op})/\hat{C}_{\text{target}}} = \lambda R'(C^{*}) + R_I'(C^{*}).
$$
Using Equation (22), we recognize $e^{-\kappa_{\mathrm{eff}}(C^{*}-C_{op})/\hat{C}_{\text{target}}} = (\beta-PP^{*})/(\beta-\alpha)$. Substituting this yields:
$$
\Gamma_0\,(\beta-PP^{*}) \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\text{target}}} = \lambda R'(C^{*}) + R_I'(C^{*}).
$$
Rearranging yields the equilibrium expression:
$$
\kappa_{\mathrm{eff}} = \frac{\hat{C}_{\text{target}}}{\Gamma_0\,(\beta-PP^{*})} \bigl[\lambda R'(C^{*}) + R_I'(C^{*})\bigr] \quad \text{(32)}
$$
Thus $\kappa_{\mathrm{eff}}$ is the target-complexity-weighted ratio of the marginal-cost sum $\lambda R'(C^*)+R_I'(C^*)$ to the power-equivalent remaining gap $\Gamma_0(\beta-PP^*)$. Holding the other displayed equilibrium quantities constant, a larger marginal-cost sum increases the inferred $\kappa_{\mathrm{eff}}$, while a larger $\Gamma_0$ decreases it. Because $C^*$ and $PP^*$ can co-vary with these parameters, Equation (32) alone supplies no total comparative-static conclusion along re-optimized equilibria.

**6.5 Stability, Response, and Target-Scale Control**

We analyze stability and sensitivity with respect to the registered task-scale coordinate. Estimation of external environmental difficulty is a separate identification problem.



**6.5.1 Theorem 21 (Adaptation Response along a Differentiable Equilibrium Branch)**

Write $T=\hat C_{target}$. Assume $\Psi$ is continuously differentiable near $(C_*,T_*)$, and let $C^*(T)$ be a differentiable local equilibrium branch satisfying
$$
\Psi(C^*(T),T)=0,
\qquad
\Psi_C(C^*(T),T)\ne0.
$$
Then
$$
\frac{dC^*}{dT}
=-\frac{\Psi_T}{\Psi_C}\bigg|_{C=C^*(T)}.
\quad \text{(33)}
$$

*Proof.* Differentiate the identity $\Psi(C^*(T),T)=0$. The chain rule gives
$$
0=\Psi_C(C^*(T),T)\frac{dC^*}{dT}+\Psi_T(C^*(T),T).
$$
Division by the declared nonzero $\Psi_C$ gives Equation (33). The required partial derivatives follow from Equations (24)–(26).

*   **Derivative w.r.t. C:**

$$\frac{\partial \Psi}{\partial C} = \Gamma_0 \frac{\partial^2 PP}{\partial C^2} - \lambda R''(C) - R_I''(C) \quad \text{(34)}$$

Using Equation (25): $\frac{\partial^2 PP}{\partial C^2} = \frac{\partial}{\partial C} \left( \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}} (\beta - PP) \right) = - \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}} \frac{\partial PP}{\partial C} < 0$.

Using Equation (26): $R_I''(C) = \frac{d}{dC} \left( \frac{r_I}{C \ln 2} \right) = -\frac{r_I}{C^2 \ln 2} < 0$.

Substituting into Equation (34):

$$\frac{\partial \Psi}{\partial C} = - \Gamma_0 \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}} \left( \frac{\partial PP}{\partial C} \right) - \lambda R''(C) + \frac{r_I}{C^2 \ln 2} \quad \text{(35)}$$

For stability, we typically expect $\partial \Psi / \partial C < 0$ (Theorem 22).

*   **Derivative w.r.t. $\hat{C}_{target}$:** Assuming $R'$ and $R_I'$ do not explicitly depend on $\hat{C}_{target}$:

$$\frac{\partial \Psi}{\partial \hat{C}_{target}} = \Gamma_0 \frac{\partial^2 PP}{\partial \hat{C}_{target} \partial C} \quad \text{(36)}$$

Calculating the mixed partial derivative from Equation (25):

$$\frac{\partial^2 PP}{\partial \hat{C}_{target} \partial C} = \frac{\partial}{\partial \hat{C}_{target}} \left( \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}} (\beta - PP) \right) = \left( \frac{\partial PP}{\partial C} \right) \left[ -\frac{1}{\hat{C}_{target}} + \frac{\kappa_{\mathrm{eff}} (C-C_{op})}{(\hat{C}_{target})^2} \right]$$

Thus:

$$\frac{\partial \Psi}{\partial \hat{C}_{target}} = \Gamma_0 \left( \frac{\partial PP}{\partial C} \right) \frac{1}{\hat{C}_{target}} \left( \frac{\kappa_{\mathrm{eff}} (C-C_{op})}{\hat{C}_{target}} - 1 \right) \quad \text{(37)}$$

*   **Result:** The sensitivity $dC^*/d\hat{C}_{target}$ is given by $-(\partial \Psi / \partial \hat{C}_{target}) / (\partial \Psi / \partial C)$. If $\partial \Psi / \partial C < 0$ (stability) and the relative complexity $(C-C_{op})/\hat{C}_{target}$ is sufficiently large ($> 1/\kappa_{\mathrm{eff}}$), then $\partial \Psi / \partial \hat{C}_{target} > 0$. In this regime where the relative complexity is sufficiently high, $dC^*/d\hat{C}_{target} > 0$, indicating that an increase in the registered task scale $\hat{C}_{target}$ leads to a corresponding increase in the optimal allocated complexity $C^*$. Identifying that change with external difficulty requires the innovation record specified in Definition 21.

 QED

**6.5.2 Theorem 22 (Existence, Uniqueness, and Local Exponential Stability of the PCE Optimum)**

Let $J\in C^2([C_{op},\infty))$ be strictly concave and satisfy
$$
\lim_{C\to\infty}J(C)=-\infty,
\qquad
J'(C_{op})>0.
$$
These hypotheses give a unique maximizer $C^*\in(C_{op},\infty)$. For the stability conclusion, assume additionally that $I=[a,b]$ is closed,
$$
C_{op}\le a<C^*<b,
$$
and that $J$ is $\mu$-strongly concave on $I$ for some $\mu>0$. Then:

1. $J$ has a unique maximizer $C^*\in(C_{op},\infty)$, and $J'(C^*)=\Psi(C^*)=0$.

2. For $\eta_{adapt}>0$, every solution of
$$
\dot C=\eta_{adapt}J'(C)
$$
with $C(0)\in I$ remains in $I$ and satisfies
$$
|C(t)-C^*|\le e^{-\eta_{adapt}\mu t}|C(0)-C^*|.
$$

*Proof.* The limit condition supplies $M>C_{op}$ such that $J(C)<J(C_{op})$ for $C\ge M$. Continuity gives a maximizer on the compact interval $[C_{op},M]$, hence on the full domain. Because $J'(C_{op})>0$, this maximizer is not the left endpoint and is therefore interior. Strict concavity gives uniqueness, and differentiability at the interior maximizer gives $J'(C^*)=0$.

For a differentiable strictly concave function, $J'(C)>0$ when $C<C^*$ and $J'(C)<0$ when $C>C^*$. Thus the vector field points toward $C^*$ at both endpoints of $I$, and solutions beginning in $I$ remain there. Strong concavity gives
$$
(C-C^*)\bigl(J'(C)-J'(C^*)\bigr)
\le-\mu(C-C^*)^2.
$$
Since $J'(C^*)=0$, for $W(t)=\frac12(C(t)-C^*)^2$,
$$
\dot W
=\eta_{adapt}(C-C^*)J'(C)
\le-2\eta_{adapt}\mu W.
$$
Multiplying by $e^{2\eta_{adapt}\mu t}$ and differentiating shows
$$
\frac{d}{dt}\left(e^{2\eta_{adapt}\mu t}W(t)\right)\le0.
$$
Hence $W(t)\le e^{-2\eta_{adapt}\mu t}W(0)$, and taking square roots proves the asserted bound. ∎

**Corollary 22.1 (Gaussian Attractor under Quadratic-Cost PCE).** Let $\mathcal K\subset\mathbb R^d$ be compact with $x^*\in\operatorname{int}(\mathcal K)$. Assume $V$ is continuous on $\mathcal K$, twice continuously differentiable near $x^*$, and has $x^*$ as its unique global minimum, with
$$
H:=\nabla^2V(x^*)\succ0.
$$
For $\theta>0$, let
$$
\pi_\theta(dx)=Z_\theta^{-1}e^{-V(x)/\theta}\mathbf1_{\mathcal K}(x)\,dx,
$$
as given by Equation (D.12a) of Appendix D,
and define $\xi_\theta=(x-x^*)/\sqrt\theta$. Then
$$
\xi_\theta\xrightarrow{d}\mathcal N(0,H^{-1})
\qquad(\theta\downarrow0).
\tag{37a}
$$
Each coordinate projection therefore converges to a centered one-dimensional Gaussian whose variance is the corresponding diagonal entry of $H^{-1}$.

*Proof.* Let $\lambda_{min}>0$ be the smallest eigenvalue of $H$. Taylor expansion at the critical point $x^*$ gives
$$
V(x^*+h)-V(x^*)
=\frac12h^THh+r(h),
\qquad
\frac{r(h)}{\|h\|^2}\longrightarrow0.
$$
Choose $\rho>0$ such that $B_\rho(x^*)\subset\mathcal K$ and
$$
V(x^*+h)-V(x^*)\ge\frac{\lambda_{min}}4\|h\|^2
\qquad(\|h\|\le\rho).
$$
Continuity, compactness, and uniqueness of the minimum give
$$
\Delta_\rho
:=\min_{x\in\mathcal K\setminus B_\rho(x^*)}
\bigl(V(x)-V(x^*)\bigr)>0.
$$

Let $\varphi$ be bounded and continuous and put
$$
\mathcal K_\theta:=\frac{\mathcal K-x^*}{\sqrt\theta}.
$$
After the change of variables $x=x^*+\sqrt\theta\,\xi$, the common Jacobian cancels and
$$
\mathbb E_{\pi_\theta}[\varphi(\xi_\theta)]
=\frac{
\int_{\mathcal K_\theta}\varphi(\xi)
e^{-[V(x^*+\sqrt\theta\xi)-V(x^*)]/\theta}\,d\xi}
{
\int_{\mathcal K_\theta}
e^{-[V(x^*+\sqrt\theta\xi)-V(x^*)]/\theta}\,d\xi}.
$$
On $\|\xi\|\le\rho/\sqrt\theta$, the integrands are dominated by
$$
\|\varphi\|_\infty e^{-\lambda_{min}\|\xi\|^2/4},
$$
which is integrable on $\mathbb R^d$, and they converge pointwise to
$$
\varphi(\xi)e^{-\xi^TH\xi/2}.
$$
The contribution from $\mathcal K\setminus B_\rho(x^*)$ to either rescaled integral is bounded by a constant times
$$
\theta^{-d/2}e^{-\Delta_\rho/\theta},
$$
which tends to zero. Dominated convergence therefore gives
$$
\lim_{\theta\downarrow0}
\mathbb E_{\pi_\theta}[\varphi(\xi_\theta)]
=\frac{
\int_{\mathbb R^d}\varphi(\xi)e^{-\xi^TH\xi/2}\,d\xi}
{
\int_{\mathbb R^d}e^{-\xi^TH\xi/2}\,d\xi}.
$$
Orthogonal diagonalization of $H$ and the one-dimensional Gaussian integral give
$$
\int_{\mathbb R^d}e^{-\xi^TH\xi/2}\,d\xi
=\frac{(2\pi)^{d/2}}{\sqrt{\det H}}.
$$
Thus the limiting density is
$$
\frac{\sqrt{\det H}}{(2\pi)^{d/2}}e^{-\xi^TH\xi/2},
$$
the density of $\mathcal N(0,H^{-1})$. Taking $\varphi(\xi)$ to depend on one coordinate proves the projection statement. ∎

**Remark 22.1 (Explanatory Scope).** Corollary 22.1 identifies the empirical ubiquity of Gaussian statistics for small perturbations around stable operating points as the local quadratic normal form of the PCE potential near a non-degenerate attractor. The result is local and low-noise: it does not claim that all stationary PU fluctuations are Gaussian, only that the rescaled fluctuations near a unique non-degenerate PCE minimum have Gaussian leading order.

**Remark 22.2 (Non-Gaussian Regimes).** Corollary 22.1 concerns the strictly local fluctuation regime near a non-degenerate PCE minimum. At degenerate or marginal minima where $H$ has zero eigenvalues, the leading cost is higher order and the local stationary distribution is non-Gaussian. Far from a minimum, or in the presence of multiplicative rather than additive fluctuations, heavier-tailed distributions can arise, including the conditional Pareto regime analyzed in Appendix P.8.9a.11 under multiplicative PCE adaptation.

**6.5.3 Definition 21 (Def 21): Dynamics of $\hat{C}_{target}(t)$**

The variable $\hat C_{target}(t)>0$ is the internal task-scale coordinate entering the Law of Prediction. On the homeostatic branch it is a response-active task-selection/control coordinate, and the certificate must include an intervention map showing that changing it changes retained measured performance according to $p(C,T)$. If it is only an estimator or label, Equation (38) regulates an internal score and is not a physical homeostasis law. When the response-active record exists for a registered target performance $PP_{op}\in(\alpha,\beta)$, its feedback law is
$$
\frac{d\hat C_{target}}{dt}
=\mu_{target}\hat C_{target}(t)
\left(PP(C(t),\hat C_{target}(t))-PP_{op}\right),
\qquad
\mu_{target}>0,
\qquad
[\mu_{target}]=[T]^{-1}.
\tag{38}
$$
This sign is fixed by Equation (22). For $C>C_{op}$,
$$
\frac{\partial PP}{\partial C}>0,
\qquad
\frac{\partial PP}{\partial\hat C_{target}}<0.
\tag{38a}
$$
Thus performance below target makes $\hat C_{target}$ decrease and raises the modeled performance, while performance above target makes it increase and lowers the modeled performance. If $\hat C_{target}$ is instead claimed to estimate an external environmental complexity, Equation (38) is not an unbiased estimator by itself; that stronger reading requires a separate innovation or observation model comparing predictions with external records.

**Theorem 21a (Feedback Sign and Joint Fixed-Point Stability).** Write $T=\hat C_{target}$ and $p(C,T)=PP(C,T)$, and assume the response-active branch of Definition 21. For Equation (22),
$$
p_C
=\frac{\kappa_{eff}}{T}(\beta-p)>0,
\qquad
p_T
=-\frac{\kappa_{eff}(C-C_{op})}{T^2}(\beta-p)<0
\tag{38b}
$$
whenever $C>C_{op}$. For each fixed $C>C_{op}$, the unique positive target-scale equilibrium satisfying $p(C,T_*)=PP_{op}$ is
$$
T_*
=
\frac{\kappa_{eff}(C-C_{op})}
{\log\!\left((\beta-\alpha)/(\beta-PP_{op})\right)},
\tag{38c}
$$
and Equation (38) is locally exponentially stable there. The opposite sign $\dot T=\mu T(PP_{op}-p)$ is locally unstable whenever $p_T<0$.

For the coupled system
$$
\dot C=\eta_{adapt}\Psi(C,T),
\qquad
\dot T=\mu_{target}T(p(C,T)-PP_{op}),
\tag{38d}
$$
assume $p$ and $\Psi$ are $C^1$ near an interior equilibrium $(C_*,T_*)$ with $\Psi(C_*,T_*)=0$ and $p(C_*,T_*)=PP_{op}$. Its Jacobian is
$$
J_*
=
\begin{pmatrix}
\eta_{adapt}\Psi_C & \eta_{adapt}\Psi_T\\
\mu_{target}T_*p_C & \mu_{target}T_*p_T
\end{pmatrix}_{(C_*,T_*)}.
\tag{38e}
$$
The equilibrium is locally exponentially stable if and only if
$$
\operatorname{tr}J_*
=\eta_{adapt}\Psi_C+\mu_{target}T_*p_T<0,
\tag{38f}
$$
and
$$
\det J_*
=\eta_{adapt}\mu_{target}T_*
(\Psi_Cp_T-\Psi_Tp_C)>0.
\tag{38g}
$$
On the DSC branch $\Psi_C<0$, so (38b) makes (38f) automatic; Equation (38g) is the additional joint-stability gate that scalar Theorem 22 does not supply.

*Proof.* Differentiating Equation (22) gives
$$
p_C=\frac{\kappa_{eff}}T(\beta-p),
\qquad
p_T=-\frac{\kappa_{eff}(C-C_{op})}{T^2}(\beta-p),
$$
which proves (38b). Solving $p(C,T_*)=PP_{op}$ gives
$$
e^{-\kappa_{eff}(C-C_{op})/T_*}
=\frac{\beta-PP_{op}}{\beta-\alpha},
$$
and taking logarithms gives (38c). The derivative of $\mu_{target}T(p-PP_{op})$ at $T_*$ is $\mu_{target}T_*p_T<0$; reversing the controller sign changes this coefficient to a positive number.

Differentiating the two components of (38d) gives (38e). If $\lambda_1,\lambda_2$ are the eigenvalues of the real $2\times2$ matrix $J_*$, then
$$
\lambda_1+\lambda_2=\operatorname{tr}J_*,
\qquad
\lambda_1\lambda_2=\det J_*.
$$
If the eigenvalues are real, negative trace and positive determinant are equivalent to both being negative. If they are nonreal, they are conjugates, their common real part is $\operatorname{tr}J_*/2$, and their product is positive. Thus both eigenvalues have negative real part exactly when the trace is negative and determinant positive, proving (38f)–(38g). ∎

**6.6 Viability Enforcement**

The adaptation dynamics modeled so far (Equation 30, Equation 38) optimize performance but do not explicitly guarantee that $PP(t)$ remains strictly within the viable Space of Becoming $(\alpha, \beta)$ (Axiom 3). A mechanism is needed to enforce these hard boundaries.

**6.6.1 Definition 22 (Def 22): Viability Enforcement Mechanism**

Let $z=(C,T)$, $p(z)=PP(C,T)$, and $[x]_+=\max\{x,0\}$. The controlled complexity dynamics are
$$
\dot C
=
\eta_{adapt}\Psi(C,T)V_{mod}(p)+F_{corr}(p),
\tag{39}
$$
where
$$
V_{mod}(p)
=
\begin{cases}
\sin^2\!\left(\pi\dfrac{p-\alpha}{\beta-\alpha}\right),&\alpha\le p\le\beta,\\
0,&\text{otherwise},
\end{cases}
\tag{39a}
$$
and a continuous buffer controller is
$$
F_{corr}(p)
=k_\alpha[\alpha+\delta-p]_+
-k_\beta[p-(\beta-\delta)]_+,
\qquad
k_\alpha,k_\beta,\delta>0,
\tag{40}
$$
with
$$
[k_\alpha]=[k_\beta]=[\text{complexity}][T]^{-1},
\qquad
[\delta]=1.
$$
The gains are accepted only when the full coupled vector field, including Equation (38) and the registered disturbance set, satisfies Theorem 22a.

**Theorem 22a (Robust Predictive-Viability Kernel).** Let
$$
K_{viab}
=
\{z:\alpha\le p(z)\le\beta\}
\tag{40a}
$$
intersected with any registered compact bounds on $C$ and $T$. Assume this intersection is closed and uniformly prox-regular, and that the active constraint gradients satisfy a constraint qualification so its contingent tangent cone is exactly the intersection of the active face half-spaces. Let $F(z)$ be the locally Lipschitz controlled drift and let the disturbance multifunction $\mathcal D(z)$ have nonempty compact convex values and be locally Lipschitz in Hausdorff distance, so $\dot z\in F(z)+\mathcal D(z)$ has the standard strong-solution property. Assume $\nabla p\ne0$ on the two performance faces. Then $K_{viab}$ is robustly forward invariant for every inclusion trajectory if and only if
$$
\inf_{d\in\mathcal D(z)}\nabla p(z)\cdot(F(z)+d)\ge0
\quad\text{when }p(z)=\alpha,
\tag{40b}
$$
and
$$
\sup_{d\in\mathcal D(z)}\nabla p(z)\cdot(F(z)+d)\le0
\quad\text{when }p(z)=\beta,
\tag{40c}
$$
together with the analogous all-velocity inward conditions on every active $C$ or $T$ bound.

If the two performance faces and every active $C,T$ face have registered strict inward margins, the conclusion survives every additional perturbation $e$ whose outward normal component on each face is smaller than that face's margin. In particular, if the performance-face margin is $m_p>0$, it is enough there that
$$
|\nabla p\cdot e|<m_p.
\tag{40d}
$$
If the same uniform performance margin $m_p$ holds throughout the corresponding exterior buffer regions inside an invariant $C,T$ domain, every trajectory in that domain enters $K_{viab}$. From $p_0<\alpha$ the entry time is at most $(\alpha-p_0)/m_p$, and from $p_0>\beta$ it is at most $(p_0-\beta)/m_p$. Boundary inequalities alone prove invariance, not finite-time capture.

*Proof.* Put $G(z):=F(z)+\mathcal D(z)$. The compact-convex value, Hausdorff-Lipschitz, and strong-solution hypotheses in the theorem are the regularity assumptions used by the strong-invariance form of Nagumo's tangent theorem for differential inclusions (Aubin and Cellina, 1984): a closed uniformly prox-regular set is strongly invariant exactly when
$$
G(z)\subseteq T_{K_{viab}}(z)
\qquad(z\in\partial K_{viab}).
$$
The constraint qualification makes the tangent cone the intersection of the active face half-spaces. On $p=\alpha$, membership of every $F(z)+d$ in the tangent cone is equivalent to
$$
\nabla p(z)\cdot(F(z)+d)\ge0
\qquad\text{for every }d\in\mathcal D(z),
$$
which is Equation (40b). On $p=\beta$, the analogous all-velocity condition is $\nabla p\cdot(F+d)\le0$, which is Equation (40c). The registered $C,T$ faces give the stated analogous inequalities.

If an additional perturbation $e$ has outward normal component smaller than a strict face margin, adding $e$ preserves the corresponding tangent inequality. In the lower exterior buffer, $\dot p\ge m_p$ implies
$$
p(t)-p_0\ge m_pt
$$
until entry, so entry occurs by $(\alpha-p_0)/m_p$. The upper-buffer calculation with $\dot p\le-m_p$ gives $(p_0-\beta)/m_p$. Conditions only on the boundary contain no estimate before a trajectory reaches the boundary and therefore prove invariance but not capture. ∎

**6.7 Model-Form Robustness**

The optimization and stability results in this section depend only on the stated boundary conditions and regularity/convexity hypotheses (Definitions 19–22). When an explicit closed form is required, it is fixed either by the composition constraint underlying Theorem 19 or by the admissibility requirements built into the dynamical definition (Definition 22). Any substitution must preserve the stated monotonicity/convexity and boundary conditions; under those conditions, scalar fixed-target convergence remains governed by Theorem 22; joint target-scale stability additionally requires Theorem 21a, and robust viability additionally requires Theorem 22a.



**6.8 Functional Interpretation: Adaptation as Implicit Error Management**

The complex adaptation dynamics governing $C(t)$ and $\hat{C}_{target}(t)$ (Equation 39, Equation 38) can be understood functionally as a control system aiming to keep the "error" (deviation from optimal/viable performance) low.

*   **Desired State:** Operation near the target performance $PP_{op}$ within the viable range $(\alpha, \beta)$.
*   **Disturbances:** Changes in the environment (actual predictive difficulty), internal noise, resource fluctuations.
*   **Performance Measurement:** $PP(t)$ acts as the system's measurement of its current operational state relative to the desired state $PP_{op}$.
*   **Feedback Signal:** The signed deviation $(PP-PP_{op})$ is the signal used by Equation (38); reversing its sign requires reversing the controller convention as well.


*   **Control Actions:** Adjusting $\hat{C}_{target}$ by Equation (38) supplies homeostatic task-scale control; interpreting it as an estimator of external difficulty requires a separate innovation record. Adjusting $C$ via $\Psi$ (Equation 30) modifies capability based on perceived difficulty and costs. Viability enforcement (Equation 39) acts as boundary control.
*   **Goal:** The coupled dynamics function as a feedback control loop, continuously adjusting internal complexity $C$ and the registered task-scale coordinate $\hat{C}_{target}$ to minimize prediction error (maximize $PP$) efficiently (PCE) while staying within the operational boundaries $(\alpha, \beta)$. It implicitly manages uncertainty and the irreducible stochasticity of ND-RID interactions ($\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$), enabling sustained viable prediction.

**6.9 Task- and Branch-Dependent Viability Bounds $\alpha$ and $\beta$**

The viability bounds are registered relative to a task, score calibration, and physical branch. The SPAP theorems do not determine either numerical endpoint, and a Landauer bound does not determine a dimensionless performance score.

* **Lower bound $\alpha$.** Let $R_{base}$ be the registered chance or reference risk and let $\phi$ be the strictly decreasing calibration from risk to performance. Then $\alpha_{task}=\phi(R_{base})$.



**Theorem 6.9a (Scoring-Rule-Invariant Viability Band).** Let $R$ be task risk, $R_{base}$ the fixed reference risk, and $R_B<R_{base}$ the best risk attainable under the registered physical budget. For every strictly decreasing calibration $\phi$ define
$$
PP=\phi(R),
\qquad
\alpha_{task}=\phi(R_{base}),
\qquad
\beta_B=\phi(R_B).
\tag{40e}
$$
Then
$$
\alpha_{task}<PP<\beta_B
\quad\Longleftrightarrow\quad
R_B<R<R_{base}.
\tag{40f}
$$
Hence viability membership is invariant under every order-preserving change of score coordinate, including positive affine rescalings of a proper score followed by a decreasing performance calibration. For the paper's representative $PP=1/(1+k_{PP}R)$,
$$
\alpha_{task}=\frac{1}{1+k_{PP}R_{base}},
\qquad
\beta_B=\frac{1}{1+k_{PP}R_B}.
\tag{40g}
$$

*Proof.* Strict monotonicity of $\phi$ reverses the two risk inequalities and is injective, proving (40f). Equation (40g) is direct substitution. The physical budget may constrain $R_B$, but no dimensionless chance score follows from the entropy cost $\varepsilon_0$ without a task and calibration map. ∎

*   **The Upper Bound $\beta$:** This is the threshold of adaptability, where the marginal cost of further predictive improvement becomes prohibitive under PCE. Its value is set by a dynamic stability condition: the system must be able to afford the resource cost of achieving the next increment of performance without entering a regime of runaway costs or instability. This constrains the relationship between the marginal cost functions ($R'$, $R_I'$) and the performance gap $(\beta - PP)$ at the limit of high complexity. Deriving $\beta$ requires a full, self-consistent solution of the PCE optimization problem at its upper boundary, likely yielding a value for $\beta$ that is a complex function of the framework's core cost and efficiency parameters ($r_p$, $\gamma_p$, $r_I$, $\kappa_{eff}$, $\lambda$, $\Gamma_0$).

