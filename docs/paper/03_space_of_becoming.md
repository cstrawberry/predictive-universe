# 3. The Dynamics of Prediction and Interaction

Building upon the foundational principles of prediction, optimization, and resource constraints established in Section 2, this section delves into the core dynamical processes governing predictive systems within the PU framework. We formally define the operational cycle—the Fundamental Predictive Loop—that systems employ to address the Prediction Optimization Problem (POP). We then introduce Reflexive Interaction Dynamics (RID) as the formal structure characterizing the crucial interaction and update phases of this loop. We highlight the inherent properties of RID that impose fundamental constraints on predictive systems. Finally, we derive the necessity of operating within specific performance bounds, defining the "Space of Becoming".

#### 3.1 The Fundamental Predictive Loop

The ongoing effort to satisfy the POP (Axiom 1) necessitates a cyclical process of prediction, verification, and adaptation.

#### 3.1.1 Definition 4 (Def 4): The Loop Structure

The Fundamental Predictive Loop is the core operational cycle through which a system attempts to maintain predictive quality concerning relevant states. It involves three essential, interconnected phases:
1.  **Internal Prediction ($P_{int}$):** The system utilizes its current internal model ($M_t$) and available information (represented by its state $S(t)$) to generate a prediction ($\hat{S}(t+\Delta t)$ or a predictive distribution) about a relevant future state.
2.  **Verification ($V$):** The system interacts with its environment or internal state to acquire outcome information ($S(t+\Delta t)$) corresponding to the prediction time. It compares the prediction with the outcome, computing a measure of discrepancy (Prediction Error, $PE$) or success. This yields feedback for adaptation (contributing to $\Delta Q$).
3.  **Update/Cycle ($D_{cyc}$):** Based on the feedback from the verification phase, the system updates its internal model ($M_t \rightarrow M_{t+1}$) and potentially adjusts its operational complexity ($C(t)$) to optimize future performance relative to cost. It then transitions to initiate the next predictive cycle using the updated model and state.

#### 3.1.2 Definition 5 (Def 5): Minimal Functional Requirements

For the Fundamental Predictive Loop (Definition 4) to operate sustainably and adaptively, the system must possess the integrated functional capabilities to:
1.  **State Representation & Distinction ($b_m$):** The ability to encode, maintain, and distinguish between relevant states (e.g., current state, prediction, outcome).
2.  **Predictive Generation ($b_p$):** The ability to execute the internal model ($M_t$) to generate predictions based on the current state.
3.  **Verification & Update Initiation ($b_v$):** The ability to interact to acquire outcome information, compare it with the prediction, generate an error/feedback signal, and utilize this signal to initiate the adaptive update process ($D_{cyc}$) for the model and state.

These capabilities must operate in a coordinated, cyclical manner. Definition 13 assigns the task-relative Operational Threshold $C_{op}$ to qualifying implementations of the full loop. The inequality $C_{op}\ge K_0=3$ follows only on the Corollary 3 branch where every qualifying implementation satisfies (O1)–(O3) and (FC), uses a Hilbert carrier for the eight contexts, and obeys $C_P\ge\log_2d_0$.

**Definition 5a (Protocol-Relative Functional Support and Irreducibility).** Let
$$
\mathsf R_{\mathrm{loop}}:=\{b_m,b_p,b_v\}
$$
be the capability set of Definition 5. The update/cycle $D_{cyc}$ is the outcome-conditioned phase initiated through $b_v$; it is not a fourth capability in $\mathsf R_{\mathrm{loop}}$.

Fix a full-loop implementation $I$, a nonempty finite protocol family $\mathsf P$, and for every $P\in\mathsf P$ a nonempty finite outcome set $\Omega_P$. Every implementation $J$ compared below must carry a registered law
$$
\operatorname{Resp}_J(P)\in\Delta(\Omega_P)
\qquad
(P\in\mathsf P).
$$

For $r\in\mathsf R_{\mathrm{loop}}$, a registered typed-null intervention contract is a tuple
$$
\iota_r
=
(M_r,0_r,I^{r\leftarrow0},\chi_r),
$$
where $M_r:D_r\to C_r$ is the designated map or bundled module realizing $r$, $0_r:D_r\to C_r$ is a specified null map, $I^{r\leftarrow0}$ is the resulting admissible implementation, and $\chi_r$ certifies that the replacement is well-typed, leaves every registered map outside the designated realization unchanged, and holds fixed the carrier, initial-state law, task and environment law, protocols, timing convention, and readout. The notation $0_r$ denotes the registered null behavior; matching type alone does not determine it. Define
$$
\mathsf T_0(I)
:=
\{r\in\mathsf R_{\mathrm{loop}}:\iota_r\text{ is registered}\}.
$$
Write
$$
\boldsymbol\iota_I
:=
(\iota_r)_{r\in\mathsf T_0(I)}
$$
for the registered intervention family.

For implementations on these common protocols, define
$$
d_{\mathsf P}(I,J)
:=
\max_{P\in\mathsf P}
d_{\mathrm{TV}}\!\left(
\operatorname{Resp}_I(P),
\operatorname{Resp}_J(P)
\right),
$$
where
$$
d_{\mathrm{TV}}(\mu,\nu)
:=
\frac12\sum_{o\in\Omega}|\mu(o)-\nu(o)|
$$
for probability laws $\mu$ and $\nu$ on the same finite outcome set $\Omega$.
The protocol-relative functional support is
$$
\operatorname{Supp}_{\mathsf P,0}(I)
:=
\left\{
r\in\mathsf T_0(I):
d_{\mathsf P}\!\left(I,I^{r\leftarrow0}\right)>0
\right\}.
$$

Fix also a response score
$$
\mathcal A_{\mathsf P}:
\prod_{P\in\mathsf P}\Delta(\Omega_P)\to\mathbb R,
$$
a baseline $A_0\in\mathbb R$, and a margin $\epsilon>0$. For brevity, write
$$
\mathcal A_{\mathsf P}(I)
:=
\mathcal A_{\mathsf P}\!\left(
(\operatorname{Resp}_I(P))_{P\in\mathsf P}
\right).
$$
Then write
$$
I\in\mathcal Q_{\mathsf P,\epsilon}
\quad\Longleftrightarrow\quad
\mathcal A_{\mathsf P}(I)>A_0+\epsilon.
$$
The implementation $I$ is functionally irreducible relative to $(\mathsf P,\boldsymbol\iota_I,\mathcal A_{\mathsf P},A_0,\epsilon)$ when
$$
I\in\mathcal Q_{\mathsf P,\epsilon},
\qquad
\mathsf T_0(I)=\mathsf R_{\mathrm{loop}},
$$
and
$$
I^{r\leftarrow0}\notin\mathcal Q_{\mathsf P,\epsilon}
\quad
\text{for every }r\in\mathsf R_{\mathrm{loop}}.
$$

**Proposition 5a (Null-Role Response and Qualification Criteria).** Under Definition 5a, for every $r\in\mathsf T_0(I)$:

1. $r\in\operatorname{Supp}_{\mathsf P,0}(I)$ if and only if there are $P\in\mathsf P$ and $E\subseteq\Omega_P$ such that
   $$
   \operatorname{Resp}_I(P)(E)
   \ne
   \operatorname{Resp}_{I^{r\leftarrow0}}(P)(E).
   $$
2. If $I\in\mathcal Q_{\mathsf P,\epsilon}$ and
   $$
   \mathcal A_{\mathsf P}\!\left(I^{r\leftarrow0}\right)\le A_0+\epsilon,
   $$
   then this registered typed-null replacement destroys $I$'s qualification, so $r$ is indispensable for $I$ relative to that intervention contract. Collapse to the registered baseline or below follows only from the stronger inequality
   $$
   \mathcal A_{\mathsf P}\!\left(I^{r\leftarrow0}\right)\le A_0.
   $$
3. A strict response change or a strict score decrease alone does not imply loss of qualification, and a role outside $\mathsf T_0(I)$ is untested rather than absent.

*Proof.* Fix $r\in\mathsf T_0(I)$ and $P\in\mathsf P$, put $\mu:=\operatorname{Resp}_I(P)$ and $\nu:=\operatorname{Resp}_{I^{r\leftarrow0}}(P)$, abbreviate $\Omega:=\Omega_P$, and let $\delta(o):=\mu(o)-\nu(o)$. Since $\mu$ and $\nu$ are probability laws,
$$
\sum_{o\in\Omega}\delta(o)=0.
$$
Put $E_+:=\{o\in\Omega:\delta(o)\ge0\}$. The total positive and negative masses of $\delta$ are equal, so
$$
\sum_{o\in E_+}\delta(o)
=
-\sum_{o\notin E_+}\delta(o)
=
\frac12\sum_{o\in\Omega}|\delta(o)|.
$$
For every $E\subseteq\Omega$,
$$
\sum_{o\in E}\delta(o)
\le
\sum_{o\in E_+}\delta(o),
$$
and applying the same inequality to $-\delta$ bounds the negative value. Hence
$$
d_{\mathrm{TV}}(\mu,\nu)
=
\max_{E\subseteq\Omega}|\mu(E)-\nu(E)|.
$$
Taking the maximum over $P\in\mathsf P$ proves part 1. For part 2, the first displayed inequality is precisely the negation of the strict membership condition for $I^{r\leftarrow0}\in\mathcal Q_{\mathsf P,\epsilon}$, whereas the second places its score at or below the registered baseline. For part 3, a strict decrease that leaves the null-replaced score greater than $A_0+\epsilon$ preserves qualification. Moreover, Definition 5a assigns support only to $r\in\mathsf T_0(I)$, so failure to register an admissible isolated typed null entails no conclusion about absence. ∎

**Corollary 5a.1 (Support Transport under Certified Response–Intervention Equivalence).** Let $I$ and $J$ be full-loop implementations with finite protocol families $\mathsf P_I$ and $\mathsf P_J$. Suppose there are bijections
$$
F:\mathsf P_I\to\mathsf P_J,
\qquad
\tau:\mathsf R_{\mathrm{loop}}\to\mathsf R_{\mathrm{loop}},
$$
where $\tau$ preserves each role's registered input-output signature and intervention-contract type, and, for each $P\in\mathsf P_I$, an outcome bijection
$$
\psi_P:\Omega_P^I\to\Omega_{F(P)}^J
$$
such that
$$
\operatorname{Resp}_J(F(P))
=(\psi_P)_*\operatorname{Resp}_I(P)
$$
and, for every $r\in\mathsf T_0(I)$,
$$
\tau(r)\in\mathsf T_0(J),
\qquad
\operatorname{Resp}_{J^{\tau(r)\leftarrow0}}(F(P))
=(\psi_P)_*
\operatorname{Resp}_{I^{r\leftarrow0}}(P).
$$
Assume the same conditions for the inverse bijections. Then
$$
\tau\!\left(\operatorname{Supp}_{\mathsf P_I,0}(I)\right)
=
\operatorname{Supp}_{\mathsf P_J,0}(J).
$$
Let the two score data be $(\mathcal A^I_{\mathsf P_I},A_0^I,\epsilon_I)$ and $(\mathcal A^J_{\mathsf P_J},A_0^J,\epsilon_J)$. If
$$
\mathcal A^J_{\mathsf P_J}\!\left(
\bigl((\psi_P)_*\mu_P\bigr)_{F(P)\in\mathsf P_J}
\right)
=
\mathcal A^I_{\mathsf P_I}\!\left(
(\mu_P)_{P\in\mathsf P_I}
\right)
$$
for every family $\mu_P\in\Delta(\Omega_P^I)$, and if
$$
A_0^I=A_0^J,
\qquad
\epsilon_I=\epsilon_J,
$$
then functional irreducibility is preserved in both directions.

*Proof.* For a bijection $\psi:\Omega\to\Omega'$, every event of $\Omega'$ is uniquely $\psi(E)$ for an event $E\subseteq\Omega$, so
$$
d_{\mathrm{TV}}(\psi_*\mu,\psi_*\nu)
=
\max_{E\subseteq\Omega}|\mu(E)-\nu(E)|
=
d_{\mathrm{TV}}(\mu,\nu).
$$
Applying this identity to every $P$ and its null-replaced response gives
$$
d_{\mathsf P_J}\!\left(J,J^{\tau(r)\leftarrow0}\right)
=
d_{\mathsf P_I}\!\left(I,I^{r\leftarrow0}\right).
$$
Hence support membership is transported by $\tau$; the inverse hypotheses give equality rather than one-sided inclusion. Score invariance transports qualification of the original and every null-replaced implementation, which proves preservation of irreducibility. ∎

**Remark 5a.1 (Scope of Knockout and Conservation Claims).** Definition 5a supplies a common intervention form, not one universal physical experiment. Component ablation, gene knockout, and counterfactual deletion instantiate it only when the typed isolated-null contract is certified in the relevant domain. Distributed realization, redundancy, compensation, inadmissible null maps, and collateral changes can prevent role localization. A performance drop certifies loss of qualification only at the registered margin. Collapse to the registered baseline requires the stronger Proposition 5a inequality, and that baseline is chance only when $A_0$ has separately been fixed as the matched-chance score. Corollary 5a.1 requires transport of original and null-intervened response laws, intervention types, and score data; performing the same task, sharing a score, or exceeding chance does not by itself establish functional conservation across carriers.

#### 3.2 Reflexive Interaction Dynamics (RID)

The Verification ($V$) and Update ($D_{cyc}$) phases involve interaction, which inherently alters the system's state based on the outcome of the interaction itself. We formalize this crucial feedback structure as Reflexive Interaction Dynamics (RID).

#### 3.2.1 Definition 6 (Def 6): RID Formalism

Reflexive Interaction Dynamics (RID) formally characterizes interactions where the system's subsequent state depends intrinsically on the outcome of the interaction. (See Appendix A.2.1 for full formal definitions).

*   **Deterministic RID (D-RID):** A D-RID system is a tuple $S = (X, Y, O, V, T)$. Here $X$ is the set of states, $Y$ is the set of interactions, and $O$ is the set of outcomes. $V: X \times Y \to O$ is the deterministic interaction function (outcome $o = V(x, y)$), and $T: X \times Y \times O \to X$ is the deterministic state transformation function (next state $x' = T(x, y, o)$).
*   **Non-Deterministic RID (ND-RID):** An ND-RID system is a tuple $S = (X, Y, O, V_{prob}, T_{prob})$. $V_{prob}: X \times Y \to \Delta(O)$ is the probabilistic interaction function yielding a distribution over outcomes ($P(o | x, y) = [V_{prob}(x, y)](o)$). $T_{prob}: X \times Y \times O \to \Delta(X)$ is the probabilistic state transformation function yielding a distribution over next states ($P(x' | x, y, o) = [T_{prob}(x, y, o)](x')$).

The defining characteristic of RID is the dependence of the transformation ($T$ or $T_{prob}$) on the outcome $o$, creating a reflexive loop where the interaction result influences the subsequent state from which future interactions will originate. The MPU 'Evolve' process (Definition 27) is modeled as an instance of ND-RID.

#### 3.2.2 Lemma 2 (Properties of RID)

The structure of Reflexive Interaction Dynamics (Definition 6) inherently implies several key properties that constrain systems governed by it. (Detailed proofs in Appendix A.2.2).

1.  **Potential Irrecoverability of Prior State:** The state transformation function ($T$ or $T_{prob}$) may not be invertible, meaning the pre-interaction state $x$ cannot always be uniquely determined from the post-interaction state $x'$ and the interaction details $(y, o)$.
2.  **Information Context Shift:** The outcome $o$ generated by an interaction at step $n$ depends only on the state $x_n$ and interaction $y_n$. The resulting state $x_{n+1}$ then defines a new context for subsequent interactions and predictions. Information gained pertains specifically to the context ($x_n$) in which it was acquired.
3.  **Predictive Instability/Regress:** If the system dynamics ($T/T_{prob}$) are designed to react to predictions ($y$) in a counter-predictive way (e.g., by altering the state to invalidate accurate predictions based on outcome $o$), then achieving stable, accurate self-prediction can become logically or dynamically impossible, leading to instability or an infinite regress.

These properties highlight the intrinsic limitations and complexities introduced by the reflexive nature of interactions within the predictive loop. They form part of the basis for the fundamental unpredictability and information constraints explored later in the framework (e.g., Section 4, Theorem 27, Appendix A).

#### 3.3 The Space of Becoming: Predictive Viability Bounds

The adaptive Fundamental Predictive Loop (Definition 4), driven by the POP (Axiom 1) and operating under the constraints of RID (Definition 6) and finite resources (Section 2.4.4), requires a specific operational range of predictive effectiveness to function sustainably. This section defines the measure of predictive effectiveness—Predictive Performance (PP)—and derives the necessity of both lower and upper bounds on this performance, defining the "Space of Becoming" within which viable, adaptive prediction must occur.

#### 3.3.1 Definition 7 (Def 7): Predictive Performance (PP)

To quantify the effectiveness of the system’s predictions, we define Predictive Performance (PP). It is a normalized measure, monotonically decreasing with the Prediction Error (PE) incurred during the Verification phase (V) of the predictive loop. PP reflects the quality (Q) and reliability of the system’s predictive state relative to its task. We adopt the functional form:
$$
PP(t) = \frac{1}{1 + k_{PP} \cdot PE(t)} \quad \text{(8)}
$$

**Definition (Predictive Error $PE$).** Let $\hat{y}(t)$ denote the system's predictive object (a point prediction or a predictive distribution) and $y(t)$ the realized outcome. Fix a proper scoring rule $S(\cdot,\cdot)$ (e.g., Brier score or log‑loss). Define $PE(t) = S(\hat{y}(t), y(t)) \geq 0$. When $S$ is log‑loss, $PE$ has units of nats (base $e$) or bits (base 2); otherwise $PE$ is made dimensionless by a specified normalization protocol.

**Definition (Scale $k_{PP}$).** The constant $k_{PP} > 0$ rescales $PE$ in Equation (8) so that a designated operating point $PE_*$ maps to a specified $PP_* \in (0, 1)$, typically chosen within the viability band $(\alpha, \beta)$ defined below. Concretely, $k_{PP} = (1/PP_* - 1)/PE_*$. When $PE$ carries units (nats/bits), $k_{PP}$ has the corresponding reciprocal units so that $k_{PP} \cdot PE$ is dimensionless; if $PE$ is dimensionless, so is $k_{PP}$.

This definition ensures $PP(t) \in (0, 1]$, with $PP = 1$ corresponding to perfect prediction ($PE = 0$) and $PP \to 0$ as $PE \to \infty$. Higher $PP$ corresponds to higher predictive quality $Q$. The specific choice of $k_{PP}$ anchors $PP$ to the task's typical error scale and does not alter the ordering of predictive quality across models or time.

#### 3.3.2 Theorem 8 (Expected Lower Performance Bound $\alpha > 0$)

Fix an evaluation window $W$ and the proper scoring rule $S$ of Definition 7. Define the system's expected error and its corresponding window performance by
$$
\overline{PE}_W:=\mathbb E\!\left[S(\hat y(t),y(t))\mid t\in W\right],
\qquad
PP_W:=\frac{1}{1+k_{PP}\overline{PE}_W}.
$$
Let $f_{random}$ be a matched random-chance predictor for the same outcome space, scoring rule, and task distribution, and assume
$$
0<PE_{random}:=\mathbb E\!\left[S(\hat y_{random}(t),y(t))\mid t\in W\right]<\infty.
$$
If solving the POP on $W$ requires strict expected super-chance performance, $\overline{PE}_W<PE_{random}$, then
$$
PP_W>\alpha,
\qquad
\alpha:=\frac{1}{1+k_{PP}PE_{random}}\in(0,1).
$$

*Proof.* Because $k_{PP}>0$, the function $x\mapsto(1+k_{PP}x)^{-1}$ is strictly decreasing on $[0,\infty)$. Therefore
$$
\overline{PE}_W<PE_{random}
\quad\Longrightarrow\quad
\frac{1}{1+k_{PP}\overline{PE}_W}
>
\frac{1}{1+k_{PP}PE_{random}},
$$
which is $PP_W>\alpha$. The assumptions $0<PE_{random}<\infty$ imply $0<\alpha<1$. ∎

#### 3.3.3 Theorem 9 (Conditional Upper Performance Bound from a Pathwise Excitation Floor)

Consider the adaptive predictive cycle of Definition 4 with performance $PP(t)=1/(1+k_{PP}PE(t))$. Assume that its registered error-driven update protocol carries a pathwise excitation certificate: there is a constant $\varepsilon_E>0$ such that
$$
PE(t)\ge\varepsilon_E
$$
almost surely on every update cycle in the certified operating window. Then
$$
PP(t)\le\beta_0:=\frac{1}{1+k_{PP}\varepsilon_E}<1
$$
almost surely on that window. On an additional joint branch of Theorem 19, assume $\alpha<\beta\le\beta_0$ and the exact response law
$$
C(PP,\hat C_{\mathrm{target}})
=
C_{op}
+\frac{\hat C_{\mathrm{target}}}{\kappa_{\mathrm{eff}}}
\ln\!\left(\frac{\beta-\alpha}{\beta-PP}\right).
$$
Then the required complexity diverges logarithmically as $PP\to\beta^-$ while remaining compatible with the certified ceiling $PP\le\beta_0$.

*Proof.* The function $x\mapsto(1+k_{PP}x)^{-1}$ is strictly decreasing because $k_{PP}>0$. Hence the pathwise inequality $PE(t)\ge\varepsilon_E$ gives
$$
PP(t)=\frac{1}{1+k_{PP}PE(t)}
\le
\frac{1}{1+k_{PP}\varepsilon_E}
=\beta_0<1.
$$
This proves the pathwise ceiling. On the additional joint response-law branch, $\alpha<\beta\le\beta_0$ and $\beta-PP\downarrow0$ as $PP\to\beta^-$, so
$$
\ln\!\left(\frac{\beta-\alpha}{\beta-PP}\right)\longrightarrow+\infty
$$
when $\hat C_{\mathrm{target}}/\kappa_{\mathrm{eff}}>0$. ∎

#### 3.3.4 Remark 1 (Distinct Roles of $\beta_0$, $\beta$, and $\alpha_{SPAP}$)

Theorem 9 supplies the task-relative pathwise ceiling $\beta_0$. Definition 8 uses a registered analytic upper endpoint $\beta$; on a branch that also carries Theorem 9 and Theorem 19, consistency requires $\alpha<\beta\le\beta_0$. The logarithmic divergence at $\beta$ follows only from Theorem 19's exact multiplicative residual-composition hypothesis.

The SPAP quantity $\alpha_{SPAP}$ belongs to a separately certified diagonal prediction task. Theorems 10–11 exclude a universal exact self-predictor on their stated diagonal classes but do not produce a system-independent scalar $\alpha_{SPAP}$. Theorem 14 supplies a log-enhanced quadratic lower bound only under its Bernoulli-reduction and resource certificates, and that bound transfers to $C_P$ only when $C_P$ lower-bounds the registered operations. No ordering between $\beta$ and $\alpha_{SPAP}$ follows without a bridge identifying the same system, task, score, and window.

#### 3.3.5 Definition 8 (Def 8): The Space of Becoming $(\alpha, \beta)$

Fix the task distribution, proper score, and evaluation window of Theorem 8. Let
$$
\alpha:=\frac{1}{1+k_{PP}PE_{\mathrm{random}}}.
$$
On a branch carrying the pathwise excitation certificate of Theorem 9, set
$$
\beta_0:=\frac{1}{1+k_{PP}\varepsilon_E}<1.
$$
If the same branch also carries Theorem 19's exact response law, require $\alpha<\beta\le\beta_0$ and use its response-law asymptote $\beta$ as the registered upper endpoint. More generally, a Space-of-Becoming branch must register an upper endpoint $\beta$ with
$$
\alpha<\beta<1
$$
and certify that its attainable performance is strictly below that endpoint. The **Space of Becoming** for the registered task and score is the open interval $(\alpha,\beta)$. Strict expected super-chance performance gives $PP_W>\alpha$ by Theorem 8. The excitation branch gives $PP_W\le\beta_0$; it is jointly compatible with the response-law branch only when $\beta\le\beta_0$.

#### 3.3.6 Axiom 3 (Ax 3): Operational Viability

For the registered task, score, evaluation windows, and excitation branch above, sustained operation is required to maintain
$$
\alpha<PP_W<\beta.
$$
This is the framework's operational-viability axiom. Theorem 8 verifies its lower inequality when strict expected super-chance performance is required. On Theorem 19's exact response-law branch, finite $C$ gives $PP_W<\beta$; Theorem 9 alone verifies the strict upper inequality only on an alternative branch whose registered viability endpoint satisfies $\beta_0<\beta$. No system-independent scalar relation between $\beta$ and an $\alpha_{SPAP}$ follows from Theorems 10–11.

#### 3.3.7 Proposition 1 (Regulation Requirement under Uniform Uncontrolled Exit Risk)

Let $(PP_n,\mathcal F_n)_{n\ge0}$ be the performance process sampled once per predictive cycle, and define
$$
\tau:=\inf\{n\ge0:PP_n\notin(\alpha,\beta)\}.
$$
Assume that, without a regulatory or protective response, there exist an integer $m\ge1$ and $p_{exit}>0$ such that for every $k\ge0$,
$$
\Pr(\tau\le(k+1)m\mid\mathcal F_{km},\tau>km)\ge p_{exit}
$$
almost surely. Then $\Pr(\tau<\infty)=1$. Consequently, a system required by Axiom 3 to remain in $(\alpha,\beta)$ for all cycles almost surely must contain a regulatory or protective mechanism that invalidates this uncontrolled exit-risk condition.

*Proof.* The conditional hypothesis gives
$$
\Pr(\tau>(k+1)m\mid\mathcal F_{km},\tau>km)\le1-p_{exit}.
$$
Multiplying by $\mathbf 1_{\{\tau>km\}}$, taking expectations, and iterating yields
$$
\Pr(\tau>km)\le(1-p_{exit})^k.
$$
The right-hand side tends to zero, so continuity from above gives
$$
\Pr(\tau=\infty)=\lim_{k\to\infty}\Pr(\tau>km)=0.
$$
Thus the unregulated process exits almost surely. Any implementation satisfying perpetual operational viability must alter the uncontrolled dynamics through regulation or protection so that the uniform exit-risk premise no longer holds. ∎


