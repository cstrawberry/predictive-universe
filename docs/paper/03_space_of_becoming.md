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
PP(t)\le\beta:=\frac{1}{1+k_{PP}\varepsilon_E}<1
$$
almost surely on that window. On the additional branch of Theorem 19 where
$$
C(PP, \hat{C}_{target}) = C_{op} + \frac{\hat{C}_{target}}{\kappa_{\mathrm{eff}}} \ln\!\Bigl(\frac{\beta - \alpha}{\beta - PP}\Bigr),
$$
the required complexity diverges logarithmically as $PP\to\beta^-$.

*Proof.* The function $x\mapsto(1+k_{PP}x)^{-1}$ is strictly decreasing because $k_{PP}>0$. Hence the pathwise inequality $PE(t)\ge\varepsilon_E$ gives
$$
PP(t)=\frac{1}{1+k_{PP}PE(t)}
\le
\frac{1}{1+k_{PP}\varepsilon_E}
=\beta<1.
$$
For the Theorem 19 branch, $\beta-PP\downarrow0$ as $PP\to\beta^-$, so $\ln((\beta-\alpha)/(\beta-PP))\to+\infty$ when $\beta>\alpha$ and $\hat C_{target}/\kappa_{\mathrm{eff}}>0$. ∎

#### 3.3.4 Remark 1 (Distinction between $\beta$ and $\alpha_{SPAP}$)

It is essential to distinguish the *operational* upper bound $\beta$ from the *fundamental* upper bound $\alpha_{SPAP}$. $\beta$ arises from the need for adaptability and efficiency within the POP/PCE framework (Theorem 9). $\alpha_{SPAP}$ arises from the logical impossibility of perfect self-prediction (SPAP, Theorem 10, Theorem 11). The complexity divergence near $\beta$ is logarithmic (Theorem 19), whereas near $\alpha_{SPAP}$ Theorem 14 gives a log-enhanced quadratic lower bound on the verification/update resources required to maintain accuracy within $\delta_{SPAP}$ of the SPAP boundary, and the same asymptotic lower bound applies to $C_P$ whenever $C_P$ lower-bounds those operations. Framework consistency requires $\beta < \alpha_{SPAP}$, ensuring the system operates within a regime where adaptation is possible and resource costs are physically manageable, well away from the unattainable SPAP boundary.

#### 3.3.5 Definition 8 (Def 8): The Space of Becoming $(\alpha, \beta)$

Fix the task distribution, proper score, and evaluation window of Theorem 8. Let
$$
\alpha:=\frac{1}{1+k_{PP}PE_{random}}.
$$
On a branch carrying the pathwise excitation certificate of Theorem 9, set
$$
\beta_0:=\frac{1}{1+k_{PP}\varepsilon_E}<1
$$
and choose a declared operational safety boundary $\beta$ satisfying
$$
\max\{\alpha,\beta_0\}<\beta<1.
$$
The **Space of Becoming** for this registered task and score is the open interval $(\alpha,\beta)$. Strict expected super-chance performance gives $PP_W>\alpha$ by Theorem 8, while the excitation certificate gives $PP_W\le\beta_0<\beta$.

#### 3.3.6 Axiom 3 (Ax 3): Operational Viability

For the registered task, score, evaluation windows, and excitation branch above, sustained operation is required to maintain
$$
\alpha<PP_W<\beta.
$$
This is the framework's operational-viability axiom. Theorem 8 verifies its lower inequality when strict expected super-chance performance is required, and Theorem 9 verifies its upper inequality when the pathwise excitation certificate holds. No system-independent scalar relation between $\beta$ and an $\alpha_{SPAP}$ follows from Theorems 10–11.

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


