# 5 Complexity Thresholds: Operational Threshold and Horizon Constant

Having established the logical limits on prediction (SPAP, Theorem 10; Theorem 11) and the notion of **Predictive Physical Complexity** $C_P$ (Equation 1), this section formalizes two distinct complexity thresholds within the PU framework. The **Operational Threshold** $C_{op}$ (Definition 13) is the minimum $C_P$ required for the *full adaptive predictive loop* (Definition 4) to achieve functional viability (prediction better than chance). The **Horizon Constant** $K_0$ (Theorem 15) is the fixed, minimal complexity required to instantiate the *core logic* of the self‑referential paradox (SPAP) that is necessarily embedded, as a sub‑dynamic, within the operational loop. We prove the relationship $C_{op}\ge K_0$ (Corollary 3) and discuss the distinct physical roles of these thresholds.

**5.1 Operational Threshold $C_{op}$**

**Definition 13 (Def 13): Operational Threshold ($C_{op}$)**

Let $\mathcal{S}_{phys}$ denote the set of physically realizable system microstates consistent with the physical law set $\mathcal{L}_{phys}$. For a microstate $\mu\in\mathcal{S}_{phys}$, let $C_P(\mu)$ be its Predictive Physical Complexity (Equation 1), and let $f_\mu$ denote the predictive function implemented by $\mu$. Fix a relevant set of environmental variables $\mathcal{E}$ and a well‑defined accuracy functional $A(\cdot)$ (e.g., $1-\mathrm{PE}$, information gain). Let $f_{random}$ denote a baseline random‑chance predictor matched to the task. For a chosen, strictly positive accuracy margin $\epsilon_{acc}>0$,

$$
\boxed{
\;C_{op} \;=\; \inf \Big\{\, C_P(\mu)\ \Big|\ \mu\in\mathcal{S}_{phys},\; A\big(f_\mu(\mathcal{E}_{past}),\mathcal{E}_{future}\big)\;>\; A\big(f_{random}(\mathcal{E}_{past}),\mathcal{E}_{future}\big)\;+\;\epsilon_{acc}\,\Big\} \;.
}
\quad \text{(15)}
$$

If the set in (15) is empty, define $C_{op}:=\infty$. Otherwise, since $C_P(\mu)\ge 0$ for physically realizable $\mu$ and the set is bounded below, the infimum exists in $[0,\infty)$. For predictions aggregated over $T$ trials, a canonical statistically significant margin is $\epsilon_{acc}=\Theta(T^{-1/2})$ by standard concentration bounds.

**Interpretation.** $C_{op}$ is the minimum complexity at which a system “comes online” as a non‑trivial predictive unit capable of sustaining the adaptive Fundamental Predictive Loop (Definition 4; capabilities $b_m,b_p,b_v, D_{cyc}$, Definition 5) and operating within the Space of Becoming $(\alpha,\beta)$ (Definition 8). Any system with instantaneous complexity $C(t)<C_{op}$ lacks the structural resources for reliable better‑than‑chance prediction.

**5.1.1 Physical Interpretation: Baseline Cost and Capability**

The Operational Threshold $C_{op}$ measures the minimum complexity to implement the *integrated functionality* of the adaptive loop with super‑chance performance. Because the loop is adaptive and logically asymmetric, its operation entails irreversibility; thermodynamic costs follow. Let $R(C)$ be the Physical Operational Cost function (Definition 3), mapping complexity to baseline resource‑consumption rate. The minimal continuous dissipation required to sustain the threshold loop is

$$
\boxed{P_{min} \;=\; R(C_{op}).}
\quad \text{(16)}
$$

A concrete baseline arises from Landauer‑type considerations for logically irreversible steps within the MPU cycle (cf. **Theorem 29** and Appendix J):

* Example: a minimal $K_0=3$‑bit (or 3‑qubit) system operating at $C_{op}=K_0$ at $T\approx 300$ K and completing one logically irreversible operation per $\tau_{cyc}\approx 10^{-9}$ s has

  $$
  P_{min}\ \gtrsim\ k_B T (\ln 2)/\tau_{cyc}\ \approx\ (1.381\times10^{-23}\,\mathrm{J/K})\,(300\,\mathrm{K})\,(0.693)/(10^{-9}\,\mathrm{s})
  $$

  $$
  \approx\ 2.87\times 10^{-12}\ \mathrm{W}.
  $$

More generally, if the loop executes $n_{\mathrm{irr}}\ge 1$ logically irreversible merges per cycle at temperature $T$ with cycle time $\tau_{cyc}$, the Landauer-limited baseline is
$$
P_{min}\gtrsim n_{\mathrm{irr}}\,k_B T\,\varepsilon/\tau_{cyc},
$$
where $\varepsilon$ is the per-merge entropy cost in nats satisfying $\varepsilon \ge \ln 2$ (Theorem 31); the numerical estimate above corresponds to $n_{\mathrm{irr}}=1$, $\varepsilon=\ln 2$, $T\approx 300$ K, and $\tau_{cyc}\approx 10^{-9}$ s. If available power falls below the relevant $P_{min}$ for the operating $(T,\tau_{cyc},n_{\mathrm{irr}})$, PCE dynamics reduce $C(t)$ beneath $C_{op}$, and predictive performance collapses (see Appendix D, Section D.3, work-cost gap mechanism, and Theorem 31).


**5.2 Minimal Complexity for Self-Reference and Prediction ($K_0$)**

We investigate the minimum complexity needed for a system to instantiate the core logic of the self-referential contradictions underlying SPAP *and* achieve minimal predictive success. Before quantifying this minimum complexity ($K_0$) in bits, we first establish the fundamental logical capabilities that any self-referential predictive system must possess. As established by Convention 1 (Section 2.4.1), the Hilbert-space capacity is $C_{cap}=\log_2 d_0$ (bits), providing the translation between the number of distinguishable internal configurations required by the logic and the minimal dimension $d_0$ required to realize them. This link will be essential in what follows.

**5.2.1 Fundamental Logical Capabilities for Self-Referential Prediction**

**Proposition 5.2.1 (Necessary Logical Capabilities for Self-Referential Prediction)**

Any system engaging in non-trivial self-referential prediction, irrespective of its specific physical or computational makeup, must simultaneously possess capabilities equivalent to:
* (i) **State Distinction ($b_m$):** The ability to represent and distinguish between its own internal states.
* (ii) **Predictive Generation ($b_p$):** An internal mechanism or model to generate representations of potential future states.
* (iii) **Verification & Update ($b_v$):** The ability to compare its predictions with actual outcomes and initiate an update to its internal state or model.

*Proof (outline):*
* (i) Self-reference requires the system to identify itself and differentiate its current state from others. Without state distinction, referencing a specific "self-state" is ill-defined.
* (ii) Prediction involves forming an internal representation of a future state. Without an internal modeling mechanism, the system cannot generate a prediction that is distinct from a mere reaction to current input.
* (iii) For adaptive or meaningful prediction, the system must assess its predictions against outcomes. Without verification, learning and model improvement are impossible, and predictive accuracy is undefined. For example, a memoryless device or one that cannot compare its output to subsequent events cannot verify its predictions and thus cannot adapt or even ascertain if its predictions are successful.
Thus, these three capabilities ($b_m, b_p, b_v$) are jointly necessary as the logical bedrock for any system that can predictively model aspects of itself and its environment in an operational cycle. QED


The Horizon Constant $K_0$ will represent the minimal physical complexity required to instantiate these capabilities in a way that enables both the encoding of the SPAP self-referential loop and the achievement of predictive accuracy better than chance.

**5.2.2 Theorem 15 (Horizon Constant: Minimal Complexity for SPAP Encodability and Minimal Prediction)**

We first formalize operational prerequisites for SPAP encodability within the loop, then state the environment class used to certify minimal predictive success.

**Operational conditions (sub‑dynamics constraints).**
To ensure a logically sound and physically robust implementation of the SPAP sub-dynamics, the system must reliably access and process the necessary information at the critical moment of the reflexive update—the **Commit Snapshot**. The following operational conditions are posited not as arbitrary constraints but as the minimal, necessary requirements for a robust and computationally efficient implementation consistent with the Principle of Compression Efficiency (PCE):

* **(O1) Injective stepping on the cycle.** The one‑cycle transition over visited internal configurations is injective on the reversible subsystem (excluding the ancilla register subject to reset for cycle closure, as detailed in Section 7.1.3). This enforces maximal computational efficiency (cf. Landauer's principle) and is distinct from the overall thermodynamic irreversibility of the full MPU loop, which arises from the ancilla reset operation required for cycle closure (Appendix J, Section J.2).
* **(O2) Explicit two‑phase control.** The loop consists of two logically distinct phases—(prepare/predict/store) and (reflex/update)—distinguished internally by a control bit $c_{phase}$, preventing race conditions.
* **(O3) Non‑destructive retention.** The current state component $\phi$ and the stored prediction $p_{stored}$ must coexist without destructive overwrite across the phase boundary, preserving the information essential for the logical paradox.

**Environment class for minimal predictive success.**

Let $(X_t)_{t\ge 0}$ be a binary process adapted to its natural history $\mathcal{H}_t = X_{\le t}$. Define the one‑step *persistence statistic*

$$
s_t \;=\; \Pr\!\big[X_{t+1}=X_t\ \big|\ \mathcal{H}_t\big].
$$

For $\gamma>0$, define

$$
\mathcal{E}_{\mathrm{basic}}(\gamma)\;=\;\Big\{\text{stationary ergodic binary processes}\ :\ \liminf_{T\to\infty}\ \frac1T\sum_{t=0}^{T-1}\mathbb{E}[s_t]\ \ge\ \tfrac12+\gamma\Big\}.
$$

This class includes, for example, i.i.d. Bernoulli($p$) with $p\neq \tfrac12$ (where $\mathbb{E}[s_t]=p^2+(1-p)^2$) and symmetric two‑state Markov chains with persistence $q>1/2$ (where $\mathbb{E}[s_t]=q$).

Under (O1)–(O3), the **Horizon Constant** equals

$$
\boxed{K_0 = 3\ \text{bits}.}
$$

More precisely:

1. (**SPAP Encodability—Necessity**). Any realization of the SPAP sub‑dynamics

   $$
   \phi_{t+1}=\mathrm{NOT}\big(p_{stored}\big)
   $$

   that satisfies (O1)–(O3) requires at least $8$ distinct internal configurations. Hence the single-cycle capacity must satisfy $\log_2 d_0 \ge \log_2 8=3$ bits (equivalently $d_0\ge 8$).

2. (**SPAP Encodability—Sufficiency**). There exists a three‑bit (eight‑state) architecture with state $(\phi, p_{stored}, c_{phase})$ and a two‑phase injective transition that preserves $(\phi,p_{stored})$ across the Commit Snapshot and implements the reflex update $\phi_{t+1}=\mathrm{NOT}(p_{stored})$ without ambiguity.

3. (**Minimal Predictive Success—Sufficiency on $\mathcal{E}_{\mathrm{basic}}(\gamma)$**). Within the same three-bit register size, a predictive mode that stores the last observed outcome and predicts persistence (equivalently, flips its prediction on error) achieves long-run accuracy strictly greater than $1/2$ on the environment class $\mathcal{E}_{basic}(\gamma)$. In particular, its asymptotic accuracy equals the time‑average of $s_t$, which by stationarity/ergodicity converges almost surely to $\mathbb{E}[s_t]\ge\tfrac12+\gamma$.

*Proof.*
**(1) Necessity.** By (O2), the sub-dynamics must internally distinguish two phases via a control bit $c_{phase}\in\{0,1\}$. By (O3), at the Commit Snapshot (the boundary between phases) the current state component $\phi$ and the stored prediction $p_{stored}$ must coexist and remain simultaneously readable across the boundary. Since $\phi\in\{0,1\}$ and $p_{stored}\in\{0,1\}$ are independently variable logical registers at the snapshot, there must be at least $2^2=4$ distinguishable configurations for $(\phi,p_{stored})$ within each phase value. Combining with the two phase values yields at least $2\cdot 4=8$ distinct internal configurations that must be physically distinguishable at some point in the operational cycle. By (O1), the reversible sub-dynamics cannot merge distinct logical configurations into the same physical configuration on the visited set without violating injective stepping. Therefore the system requires at least $8$ distinguishable internal configurations, i.e. $K_0\ge \log_2 8=3$. ∎

**Remark 5.2.2a (Robustness of $K_0 \ge 3$ under reformalization).**  
The lower bound in (1) depends only on the need for an injective realization of the SPAP update across a phase boundary: at the Commit Snapshot the machine must distinguish the triple $(\phi,p_{stored},c_{phase})\in\{0,1\}^3$. Any alternative encoding (e.g., relabeling states, using different internal variables, or changing the order of micro-operations) that still satisfies (O1)-(O3) must implement an injective map from these eight logical contexts to physical configurations. Consequently, any such realization requires at least $8$ distinguishable internal configurations, i.e. $\log_2 d_0\ge 3$ and thus $K_0 \ge 3$.

Thus the required single-cycle distinguishability is at least $3$ bits: $\log_2 d_0\ge 3$ (equivalently $d_0\ge 8$).

**(2) Sufficiency.** Define the two-phase transition on the three-bit register $(\phi,p_{stored},c_{phase})$ by:
- Phase boundary (Commit Snapshot): $(\phi,p_{stored},0)\mapsto(\phi,p_{stored},1)$, preserving $\phi$ and $p_{stored}$ while toggling the internal phase bit (O2–O3).
- Reflex/update: $(\phi,p_{stored},1)\mapsto(\mathrm{NOT}(p_{stored}),\phi,0)$, which sets the next $\phi$ to $\mathrm{NOT}(p_{stored})$ while swapping the old $\phi$ into the auxiliary register to keep the map bijective (O1).
The phase-boundary map is a bijection between the phase slices, and the reflex/update map is a bijection from the $c_{phase}=1$ slice to the $c_{phase}=0$ slice. Hence the visited internal transitions are injective and the SPAP update $\phi_{t+1}=\mathrm{NOT}(p_{stored})$ is realized without ambiguity. ∎

**(3) Minimal Predictive Success.** Consider the predictor $\hat X_{t+1}:=X_t$ ("predict persistence"). Its correctness indicator is $\mathbf{1}\{\hat X_{t+1}=X_{t+1}\}=\mathbf{1}\{X_{t+1}=X_t\}$. Therefore, for any stationary ergodic process in $\mathcal{E}_{basic}(\gamma)$,
$$
\lim_{T\to\infty}\frac1T\sum_{t=0}^{T-1}\mathbf{1}\{\hat X_{t+1}=X_{t+1}\}
=\lim_{T\to\infty}\frac1T\sum_{t=0}^{T-1}\mathbf{1}\{X_{t+1}=X_t\}
=\mathbb{E}[s_t]\ge \frac12+\gamma
$$
almost surely (ergodic theorem). This rule is equivalent to "flip on error": if $\hat X_{t+1}=X_t$ is wrong, then $X_{t+1}\ne X_t$ and the next prediction $\hat X_{t+2}=X_{t+1}$ is the flipped value. Implementation within the same three-bit register size is immediate: store the last observed outcome in a single bit (identified with $\phi$), copy it into the prediction register as needed during the predict/store phase, and after observing $X_{t+1}$ overwrite $\phi\leftarrow X_{t+1}$ to advance the stored hypothesis. ∎

**Consequence.** The minimal single-cycle state-space capacity that (i) supports SPAP encodability and (ii) admits a predictive mode with super‑chance performance equals three bits. This provides a model‑independent lower bound on MPU internal distinguishability. This result, combined with Convention 1 ($C_{cap}=\log_2 d_0$), provides the direct link from the logical requirement of $8$ distinguishable states to the physical requirement $d_0\ge 8$; the PCE minimality criterion selects the saturating MPU choice $d_0=8$.

**5.2.3 Corollary 3 (Relation Between Thresholds $C_{op}\ge K_0$)**

The **Operational Threshold** must satisfy

$$
\boxed{C_{op}\ \ge\ K_0\ =\ 3\ \text{bits}.}
\quad \text{(17)}
$$

*Proof.* The adaptive Fundamental Predictive Loop (Definition 4) includes, as an internal sub‑dynamic, the SPAP logic and the capabilities $b_m,b_p,b_v, D_{cyc}$ (Definition 5; Proposition 5.2.1). By Theorem 15, the minimal $C_P$ that realizes this sub‑dynamic and permits super‑chance operation on $\mathcal{E}_{\mathrm{basic}}(\gamma)$ is $K_0=3$. Therefore, any system meeting the Definition 13 criterion must have $C_P\ge 3$. ∎

**Remark (Explicit Relation).** Since $C_{op}$ is defined as the minimal physical complexity that achieves a target accuracy gap $\epsilon_{acc}>0$ under the full loop, $C_{op}\ge K_0=3$. Achieving larger accuracy gaps generally requires additional structure; informally, in many regimes one expects $C_{op}\approx K_0 + O\!\big(\ln(1/\epsilon'_{acc})\big)$ (cf. Law of Prediction, Theorem 19), with constants depending on the environment class and $A(\cdot)$.

**5.2.4 Applicability of SPAP/RUD Limits to MPUs**

Minimal Predictive Units (MPUs) operating at or above $C_{op}$ inherit SPAP and Reflexive Undecidability (RUD) constraints through the following chain:

1. **Embedded structure.** By design, every MPU at operational capacity possesses at least the $K_0\equiv B_3$ three-bit Boolean core (the 8-state architecture $(\phi,p_{stored},c_{phase})$ in Theorem 15) required for self‑referential processing.
2. **Noise and Stochasticity:** SPAP/RUD arguments rely on reliable execution of the sub‑dynamics in the presence of ND‑RID stochasticity and finite-temperature noise; the loop's irreducible merge cost satisfies $\varepsilon \ge \ln 2$ (Theorem 31) and the effective interaction channel is strictly contractive ($f_{RID}<1$), so the operational loop must supply the required computational regularity.
3. **POP/PCE optimization.** POP/PCE dynamics favor MPU networks that function as reliable computational substrates (Appendix A.0), increasing the practical salience of SPAP/RUD limitations.
4. **Conclusion.** SPAP/RUD constraints thus apply fundamentally to MPUs through their internal $K_0$ structure and the effective computation enabled by network optimization.

**5.2.5 Theorem 16 (Universal Necessity of $C_{op}$ for Modeled Process)**

Any physical system exhibiting the operational characteristics modeled by the Predictive Universe framework—specifically, sustaining the adaptive Fundamental Predictive Loop (Definition 4) while dynamically maintaining Predictive Performance $PP(t)$ within the Space of Becoming $(\alpha, \beta)$ (Axiom 3)—must possess the necessary integrated functional capabilities ($b_m, b_p, b_v, D_{cyc}$) (Definition 5, Proposition 5.2.1) and therefore must necessarily have a Predictive Physical Complexity $C(t)$ equal to or greater than the Operational Threshold $C_{op}$ (Definition 13). This implies a hard lower bound on its continuous energy dissipation via $P_{min}=R(C_{op})$ (Equation 16), emphasizing the thermodynamic inevitability of operational costs.
*Proof:*
1.  Assume a system $S$ exhibits the modeled characteristics.
2.  The adaptive loop requires the integrated capabilities ($b_m, b_p, b_v, D_{cyc}$) (Proposition 5.2.1).
3.  $C_{op}$ is the minimum $C_P$ to instantiate these capabilities for prediction significantly better than chance ($A > A_{random} + \epsilon_{acc}$). Since $\alpha > 0$ (Theorem 8), $PP > \alpha$ requires such prediction.
4.  Thus, implementing these capabilities for $PP > \alpha$ requires $C_P \ge C_{op}$.
5.  Suppose $C(S) < C_{op}$. By definition of $C_{op}$, $S$ lacks minimal resources for reliable prediction better than chance.
6.  This prevents sustained adaptive operation with $PP > \alpha$, contradicting the initial assumption.
7.  Therefore, any such system $S$ must have complexity $C(S) \ge C_{op}$. See Table 5.1. QED

**Table 5.1 — Complexity Thresholds and an Example Instantiation**

|  Symbol  | Name                  | Logical Purpose                                                                                               | Complexity (Bits) | Example: 3‑Qubit MPU (Sec. 7.1.3)            |
| :------: | :-------------------- | :------------------------------------------------------------------------------------------------------------ | :---------------- | :------------------------------------------- |
|   $K_0$  | Horizon Constant      | Minimal SPAP sub‑dynamics (O1–O3) and basic super‑chance prediction on $\mathcal{E}_{\mathrm{basic}}(\gamma)$ | Exactly 3         | $d_0=8$ Hilbert subspace, SPAP two‑phase map |
| $C_{op}$ | Operational Threshold | Full adaptive loop at target margin $\epsilon_{acc}>0$                                                        | $\ge K_0=3$       | Can equal $K_0$ for minimal $\epsilon_{acc}$ |



