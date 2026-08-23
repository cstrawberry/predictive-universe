# 3. The Dynamics of Prediction and Interaction

Building on Section 2, this section defines the Fundamental Predictive Loop and Reflexive Interaction Dynamics as PU's operational update model. The loop and RID do not by themselves force one numerical viability interval. Theorem 8 supplies a lower bound only under its super-chance success premise, while Theorem 9 supplies an upper bound only under its pathwise-excitation certificate; Definition 8 registers the resulting branch-relative Space of Becoming.

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

**Theorem 5a.2 (Complete Finite Response-Table Support Audit).** Fix the finite protocols, outcome alphabets, score datum and three typed-null contracts of Definition 5a. For a submitted finite implementation $I$, form the exact table
$$
\mathsf T(I)
=
\left(
(\operatorname{Resp}_I(P))_{P\in\mathsf P},
(\operatorname{Resp}_{I^{r\leftarrow0}}(P))_{
r\in\mathsf R_{\mathrm{loop}},\,P\in\mathsf P},
\mathcal A_{\mathsf P},A_0,\epsilon
\right).
\tag{5a.2.1}
$$
Exact finite comparison of this table returns all of the following without inspecting an implementation's internal decomposition:

1. the support is exactly the set of rows for which at least one original/null response-law entry differs;
2. functional irreducibility holds exactly when the original score exceeds $A_0+\epsilon$ and every null-row score is at most $A_0+\epsilon$;
3. two implementations with the same table, up to the typed protocol, outcome and role bijections of Corollary 5a.1, have the same support cardinality and the same irreducibility status; and
4. no response-equivalent implementation preserving the entire intervention table can have a smaller protocol-relative support.

*Proof.* Item 1 is Proposition 5a(1), applied to each of the three finite rows. Item 2 is the definition of functional irreducibility, and all inequalities are exact finite comparisons. Corollary 5a.1 proves item 3. If a table-preserving implementation had smaller support, item 3 would give equal support cardinalities, a contradiction; this proves item 4. The audit terminates because the protocol, outcome and role sets are finite. ∎

**Resolution TV-BEC-01-R1 (Metadata).** Exact domain: the finite typed protocol/outcome/role tables of Definition 5a. Premises: exact response laws, the registered score datum and all three typed-null rows. Equivalence: Corollary 5a.1's typed protocol, outcome and role bijections. Budget: every submitted original and null table cell. Verifier: exact table equality and score comparison. Falsifier: equal complete tables with different support, or an audit result disagreeing with a registered score inequality. Provenance class: source-internal finite classification. Downstream consumers: Definition 5a's support/irreducibility claims and `TV-BEC-01`. Nonvacuity: a one-protocol binary table with baseline null rows and an original row above the margin. This is `positive-discharge` of the mathematical response-table component.

**Theorem 5a.3 (Finite Typed-Null Full Loop and Exact Response Transport).** Let the memory, prediction, task-outcome and verification registers all be $\{0,1\}$. Freeze one protocol with initial current-state datum $1$ and task outcome $y=1$. Realize the three Definition-5 roles by the typed maps
$$
M_m(*)=1,
\qquad
M_p(m)=m,
\qquad
M_v(m,p,y)=\bigl(mp\mathbf1_{\{p=y\}},y\bigr),
\tag{5a.3.1}
$$
where the first output of $M_v$ is the retained verification response and the second is the next-cycle memory. Thus $M_m$ encodes the current state, $M_p$ generates its prediction, and $M_v$ acquires the outcome, compares it with the prediction and initiates the update.

Register the typed nulls
$$
0_m(*)=0,
\qquad
0_p(m)=0,
\qquad
0_v(m,p,y)=(0,0).
\tag{5a.3.2}
$$
Each isolated replacement leaves every other module, register, initialization, task, protocol, timing convention and readout unchanged. The original and three null-intervened response laws are respectively
$$
\delta_1,
\qquad
\delta_0,\ \delta_0,\ \delta_0.
\tag{5a.3.3}
$$
For the score $\mathcal A(\nu)=\nu(\{1\})$, baseline $A_0=0$ and margin $\epsilon=1/2$, the full loop is functionally irreducible and all three roles form its protocol-relative support.

The same typed loop has an exact diagonal quantum realization. For every deterministic map $f:X\to Y$ between the finite registers above, define the measure-and-prepare channel
$$
\mathcal E_f(\rho)
=\sum_{x\in X}\langle x|\rho|x\rangle|f(x)\rangle\langle f(x)|.
\tag{5a.3.4}
$$
Use $\mathcal E_f$ for each map in (5a.3.1)--(5a.3.2), tensor computational-basis carriers for the inputs of $M_v$, and read the verification register in its computational basis. Diagonal preparation and basis readout are inverse response maps and intertwine every original and null channel, so the complete table (5a.3.3), its score, support and irreducibility transport exactly.

*Proof.* On the original loop, $m=p=y=1$, so $M_v$ returns response $1$ and next memory $1$. Replacing $M_m$ or $M_p$ makes $mp=0$; replacing $M_v$ sets its first output to zero. This proves (5a.3.3). The score inequalities are $1>1/2$ for the original and $0\le1/2$ for every null row, so Theorem 5a.2 gives support $\{b_m,b_p,b_v\}$ and irreducibility. Each map in (5a.3.4) is completely positive and trace preserving, sends diagonal point states according to $f$, and returns the corresponding classical law under basis measurement. Therefore all original and null diagrams required by Corollary 5a.1 commute. ∎

**Resolution TV-BEC-01-R2 (Metadata).** Exact domain: the one-protocol binary full loop (5a.3.1)--(5a.3.3) and its complete diagonal-channel transport (5a.3.4). Premises: the frozen initial state and outcome, the displayed typed modules and nulls, and the registered score datum. Equivalence: the typed protocol, outcome and role bijections of Corollary 5a.1. Budget: three role maps, three isolated null maps and both finite carrier presentations. Verifier: exact evaluation of all four response rows, CPTP normalization and the classical--diagonal intertwining identities. Falsifier: any ill-typed null, changed non-target module, noncommuting response square or score/support mismatch. Provenance class: source-internal finite construction. Downstream consumers: Definition 5, Definition/Proposition 5a, Corollary 5a.1 and `TV-BEC-01`. Together with Theorem 5a.2, Theorem 5a.3 gives `positive-discharge` of `TV-BEC-01`.

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

This section defines Predictive Performance and a branch-relative viability band. Theorem 8's lower bound requires its registered super-chance premise; Theorem 9's upper bound requires its pathwise-excitation certificate. POP, RID, and finite resources alone do not imply either bound. Definition 8 names the Space of Becoming only after the applicable antecedents are supplied.

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

**Theorem 9a (Exact Endpoints for a Finite Locked Task).** Fix one finite outcome space, task law, evaluation window, proper score $S$, scale $k_{PP}>0$, and a nonempty finite set $\mathcal A$ of attainable predictive laws supplied by the registered dynamics. For $a\in\mathcal A$, let
$$
R(a):=\mathbb E[S(a,Y)],
\qquad
P(a):=\frac{1}{1+k_{PP}R(a)}.
\tag{9a.1}
$$
Assume each registered risk $R(a)$ is finite and nonnegative. Then the attainable performance endpoints are attained and equal
$$
P_{\min}=\frac{1}{1+k_{PP}\max_{a\in\mathcal A}R(a)},
\qquad
P_{\max}=\frac{1}{1+k_{PP}\min_{a\in\mathcal A}R(a)}.
\tag{9a.2}
$$
For two branches on the same locked task, score, normalization and window, inclusion $\mathcal A_1\subseteq\mathcal A_2$ implies
$$
P_{\max}(\mathcal A_1)\le P_{\max}(\mathcal A_2),
\qquad
P_{\min}(\mathcal A_1)\ge P_{\min}(\mathcal A_2).
\tag{9a.3}
$$
No ordering between two interior numerical endpoints is invariant under independently chosen score calibrations. Replacing $P$ by any strictly increasing bijection $h:(0,1]\to(0,1]$ preserves each within-branch ordering while moving every interior endpoint; two independently chosen such maps can reverse an interior cross-branch comparison. The universal endpoint $P=1$ is fixed.

*Proof.* A real function on a nonempty finite set attains its minimum and maximum. The map $r\mapsto(1+k_{PP}r)^{-1}$ is strictly decreasing, giving (9a.2). Set inclusion can only decrease the minimum risk and increase the maximum risk, which gives (9a.3) after applying the decreasing map. Strictly increasing recalibrations preserve order inside each branch, fix $1$, and can send any nominated interior value to any nominated interior value; choosing the two images in reverse order proves the final interior statement. ∎

**Resolution TV-BEC-02-R1 (Metadata).** Exact domain: nonempty finite attainable-law sets under one locked task, score, window and positive scale. Premises: nonnegative finite risks under Definition 7's registered score. Equivalence: equality of predictive laws on the locked outcome distribution. Budget: all laws in the submitted finite attainable sets. Verifier: exact risk evaluation, endpoint enumeration and set-inclusion comparison. Falsifier: an endpoint outside (9a.2) or a same-task inclusion violating (9a.3). Provenance class: source-internal finite optimization. Downstream consumers: Theorems 8--9b, Definition 8 and `TV-BEC-02`. Nonvacuity: the singleton zero-risk task and a two-law task with $0<r_1<r_2$. This is `positive-discharge` for the finite locked-data component and `nonentailment` of interior cross-branch ordering under independent calibrations. Theorem 9b and Resolution TV-BEC-02-R2 below discharge the arbitrary-class mathematical extension; physical identification of the locked task and its attainable dynamics remains `R`-open.

**Theorem 9b (Arbitrary Attainable-Class Endpoints and Generator-Only Obstruction).** Retain the locked outcome space, task law, evaluation window, proper score $S$, and scale $k_{PP}>0$ of Theorem 9a, but let $\mathcal A$ be any nonempty, possibly infinite set of attainable predictive laws. Assume that every risk $R(a)=\mathbb E[S(a,Y)]$ is finite and nonnegative, and define
$$
r_-:=\inf_{a\in\mathcal A}R(a),
\qquad
r_+:=\sup_{a\in\mathcal A}R(a)\in[0,\infty],
\tag{9b.1}
$$
$$
P_{\inf}(\mathcal A):=\inf_{a\in\mathcal A}\frac{1}{1+k_{PP}R(a)},
\qquad
P_{\sup}(\mathcal A):=\sup_{a\in\mathcal A}\frac{1}{1+k_{PP}R(a)}.
\tag{9b.2}
$$
With $(1+k_{PP}\infty)^{-1}:=0$, the exact extended endpoints are
$$
P_{\inf}(\mathcal A)=\frac{1}{1+k_{PP}r_+},
\qquad
P_{\sup}(\mathcal A)=\frac{1}{1+k_{PP}r_-}.
\tag{9b.3}
$$
The upper performance endpoint is attained exactly when some $a\in\mathcal A$ attains $r_-$. The lower performance endpoint is attained exactly when $r_+<\infty$ and some $a\in\mathcal A$ attains $r_+$; when $r_+=\infty$, it equals $0$ and is not attained. If $\mathcal A$ is compact in a registered topology and $R$ is real-valued and continuous, both endpoints are attained. For two classes on the same locked task, score, normalization, and window, $\mathcal A_1\subseteq\mathcal A_2$ implies
$$
P_{\sup}(\mathcal A_1)\le P_{\sup}(\mathcal A_2),
\qquad
P_{\inf}(\mathcal A_1)\ge P_{\inf}(\mathcal A_2).
\tag{9b.4}
$$
Independently chosen strictly increasing recalibrations can reverse the numerical order of any two interior cross-class endpoints, so such an order is invariant only after the calibration is shared.

There is no total algorithm that, from a code for an arbitrary uniformly computable sequence of attainable laws on a locked task, always decides whether $P_{\sup}=1$. This obstruction holds even for one deterministic binary task, the binary squared score, $k_{PP}=1$, and risks in $\{0,1\}$.

*Proof.* Extend $f(r)=(1+k_{PP}r)^{-1}$ continuously to $[0,\infty]$ by $f(\infty)=0$. The function is strictly decreasing. Applying it to sequences approaching $r_-$ and $r_+$ gives (9b.3), and strict monotonicity gives the two attainment criteria. Compactness and continuity give attained finite risk extrema. Set inclusion can only decrease the risk infimum and increase the risk supremum, which proves (9b.4). The recalibration claim follows by choosing independent increasing bijections of $(0,1]$ that send the two nominated interior endpoints to values in the reverse order.

For the algorithmic claim, fix a program/input pair $(e,w)$ and let $Y=0$ almost surely. At index $n$, simulate $e(w)$ for $n$ steps and output the predictive law with Bernoulli parameter $p_n=0$ if the computation has halted and $p_n=1$ otherwise. This is a uniformly computable sequence. Under $S(p,y)=(p-y)^2$, every risk belongs to $\{0,1\}$. If $e(w)$ never halts, every attainable performance is $1/2$; if it halts, the sequence contains a law of performance $1$. A total decision procedure for $P_{\sup}=1$ would therefore decide the halting problem. ∎

**Resolution TV-BEC-02-R2 (Arbitrary-Class Classification).** Exact domain: nonempty finite or infinite attainable-law sets under one locked task, score, window, and positive scale, with finite nonnegative risk for every admitted law. Premises: Theorems 9a and 9b's frozen task and risk hypotheses. Equivalence: equality of predictive laws on the locked outcome distribution. Budget: the submitted census for the finite case; the full abstract class for the order theorem; and submitted extremum, continuity, or compactness proofs for a concrete nonfinite application. Verifier: exact finite enumeration under Theorem 9a or checked risk bounds and extremum witnesses under Theorem 9b. Falsifier: an endpoint violating (9b.3), an attainment claim without the corresponding risk extremum, a same-task inclusion violating (9b.4), or a total generator-only equality decider succeeding on the halting-coded family. Provenance class: source-internal exact analysis and computability. Downstream consumers: Theorems 8--9b, Definition 8, and `TV-BEC-02`. Nonvacuity: Theorem 9a's finite examples, every nonempty compact continuous-risk class, and the halting-coded binary family. Theorems 9a and 9b give `positive-discharge` of the mathematical endpoint, attainment, and same-task ordering classification and `negative-refutation` of uniform exact extraction from a generator alone.

**Theorem 9c (Populated Two-Law Endpoint Realization).** Freeze a one-cycle window, the deterministic binary task law $Y=0$, the proper binary squared score $S(p,Y)=(p-Y)^2$, and $k_{PP}=1$. Let a two-state classical control register $X=\{x_0,x_1\}$ have controls $a_0,a_1$ with
$$
T(x,a_i)=x_i,
\qquad
\widehat p(x_0)=0,
\qquad
\widehat p(x_1)=\frac12.
\tag{9c.1}
$$
The registered attainable-law class is exactly $\mathcal A=\{\operatorname{Bern}(0),\operatorname{Bern}(1/2)\}$, since either state is reached in one control step and the readout has no other value. Its risks and performance values are
$$
R_0=0,
\quad R_1=\frac14,
\qquad
P_0=1,
\quad P_1=\frac45.
\tag{9c.2}
$$
Thus the realized endpoints are attained and equal $P_{\min}=4/5$ and $P_{\max}=1$.

*Proof.* Equation (9c.1) proves reachability and exhausts the two-state carrier. Direct expectation under $Y=0$ gives $R(p)=p^2$, and Definition 7 gives $P(p)=(1+R(p))^{-1}$. Substitution yields (9c.2), which agrees with Theorem 9a. ∎

**Resolution TV-BEC-02-R3 (Metadata).** Exact domain: the one-cycle binary task, two-state control register and two-law attainable class in (9c.1). Premises: the deterministic outcome law, squared score, $k_{PP}=1$, and the two exhaustive controls. Equivalence: equality of predictive laws on the frozen task. Budget: both states, controls, laws, risks and endpoint comparisons. Verifier: one-step reachability, census exhaustion, direct risk evaluation and Definition-7 normalization. Falsifier: any additional attainable readout, incorrect risk, unattained endpoint or task/score drift. Provenance class: source-internal finite realization. Downstream consumers: Theorems 8--9b, Definition 8 and `TV-BEC-02`. Theorem 9c populates the task, score, window, scale, attainable dynamics and both certified risk extrema on one carrier; together with Theorems 9a--9b it gives `positive-discharge` of `TV-BEC-02`.

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

**Theorem 1a (Finite Response-Preserving Safety Kernel and Minimum Controller).** Let $X$ be a finite registered state set, $V\subseteq X$ the states whose performance lies in $(\alpha,\beta)$, and $A(x)$ a finite nonempty set of response-preserving admissible controls at $x$. Let $P(\cdot\mid x,a)$ be an exact transition law. Define
$$
W_0:=V,
\qquad
W_{n+1}:=
\left\{x\in W_n:\exists a\in A(x),\ 
\operatorname{supp}P(\cdot\mid x,a)\subseteq W_n\right\}.
\tag{1a.1}
$$
The descending sequence stabilizes after at most $|V|$ strict deletions at a greatest fixed point $W_*$. A controller keeps the process in $V$ almost surely from $x$ for every cycle if and only if $x\in W_*$. When $x\in W_*$, one deterministic stationary controller is obtained by choosing at each state a witnessing action in (1a.1). If $W_*\ne\varnothing$, the deterministic stationary selectors whose transition supports stay in $W_*$ form a nonempty finite safe-controller census. When that census carries an exact cost $J(\pi)$, its minimum is attained; it is strict exactly when one controller has cost smaller than every other controller modulo the declared response equivalence.

*Proof.* Finiteness makes the decreasing sequence stabilize. At a fixed point, choose a witnessing action at every $x\in W_*$. Its transition support stays in $W_*$, so induction gives almost-sure safety for all times. Conversely, if $x\notin W_*$, let $n$ be the first deletion stage. Every admissible action at $x$ has positive probability of entering $X\setminus W_{n-1}$; backward induction on deletion rank shows that no policy can guarantee perpetual membership in $V$. A real-valued function on the nonempty finite safe-controller set attains its minimum, and the strictness criterion is the definition of a unique minimizing equivalence class. ∎

**Resolution TV-BEC-03-R1 (Metadata).** Exact domain: finite registered controlled Markov kernels with a finite viable set and response-preserving action sets. Premises: exact transition supports and nonempty admissible actions; $W_*\ne\varnothing$ for the minimum-controller clause. Equivalence: equality of retained task responses, with controller uniqueness taken modulo that declared response equivalence. Budget: at most $|V|$ strict kernel deletions plus exhaustive comparison of the finite deterministic-stationary safe-controller census. Verifier: fixed-point iteration (1a.1), support checks and exact cost comparison. Falsifier: a selected action leaving $W_*$ or an almost-sure safe policy from a deleted state. Provenance class: source-internal finite control classification. Downstream consumers: Proposition 1, Axiom 3 and `TV-BEC-03`. Nonvacuity: a one-state viable self-loop system. The theorem is `positive-discharge` of the finite mathematical controller component.

**Theorem 1b (Two-State Regulator with a Strict Safe Optimum).** Take $X=\{v,o\}$, $\alpha=1/3$, $\beta=2/3$, and registered performance values $PP(v)=1/2$, $PP(o)=1/4$, so $V=\{v\}$. Let the response-preserving admissible sets be $A(v)=\{h_0,h_1\}$ and $A(o)=\{h_o\}$. Their deterministic transition laws are
$$
P(v\mid v,h_0)=P(v\mid v,h_1)=1,
\qquad
P(o\mid o,h_o)=1.
\tag{1b.1}
$$
Register the complete controlled-cycle response as the next-state/performance pair. The two hold controls both return $(v,1/2)$ on every cycle, so $h_0$ and $h_1$ are response-equivalent safe realizations; $h_o$ returns $(o,1/4)$ on its separate state fiber. For comparison, the uncontrolled transition $u$ with $P(o\mid v,u)=1$ is recorded outside $A(v)$ and is not an admissible response-preserving selector. The safety iteration gives $W_*=\{v\}$. Its deterministic stationary safe-controller census consists exactly of the selectors $h_0$ and $h_1$. With exact retained costs
$$
J(h_0)=1,
\qquad
J(h_1)=2,
\tag{1b.2}
$$
$h_0$ is the unique strict minimum modulo response equivalence. The matrices defined by (1b.1), the two-state register and the selected feedback wire form a finite formal transition-loop realization.

*Proof.* Both admissible hold actions at $v$ have support in $V$, so Equation (1a.1) stabilizes at $\{v\}$. The separately recorded uncontrolled transition leaves $V$ but does not enter the admissible-action quantifier. A stationary admissible selector is safe exactly when it chooses one of the two hold actions at $v$. Equation (1b.2) makes $h_0$ its strict minimum, and induction on cycles proves perpetual retention of $v$. ∎

**Resolution TV-BEC-03-R2 (Metadata).** Exact domain: the two-state controlled kernel (1b.1), its complete next-state/performance response, the external uncontrolled comparator and deterministic stationary admissible selectors. Premises: the displayed viable band, action supports, response equivalence and exact costs. Equivalence: equality of the retained controlled-cycle response, with controller uniqueness modulo that equality. Budget: both states, every admissible action, the one uncontrolled comparator and the complete two-member safe-controller census. Verifier: fixed-point iteration, transition-support checks, response equality and exact cost comparison. Falsifier: admitting the uncontrolled comparator into $A(v)$, an omitted safe selector, unequal hold responses or a cost tie/reversal. Provenance class: source-internal finite control realization. Downstream consumers: Proposition 1, Axiom 3 and `TV-BEC-03`. Theorem 1b populates the transition law, response-preserving safe-action audit, viable kernel and strict minimum controller on one formal carrier; together with Theorem 1a it gives `positive-discharge` of `TV-BEC-03`.

