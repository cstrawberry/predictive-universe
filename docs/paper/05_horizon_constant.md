# 5 Complexity Thresholds: Operational Threshold and Horizon Constant

Having established the logical limits on prediction (SPAP, Theorem 10, Theorem 11) and the concept of Predictive Physical Complexity $C_P$ (Equation 1), we now formally define two crucial, distinct complexity thresholds within the PU framework. The primary focus is the Operational Threshold ($C_{op}$, Definition 13), representing the minimum $C_P$ required for the *full adaptive predictive loop* (Definition 4) to achieve functional viability (prediction better than chance). We then define the Horizon Constant ($K_0$, Theorem 15), which represents the fixed, minimal complexity required merely to instantiate the *core logic* of the self-referential paradox (SPAP) that is necessarily embedded within the operational loop. We prove the crucial relationship $C_{op} \ge K_0$ (Corollary 3), establishing $K_0$ as a fundamental logical prerequisite contained within the operational threshold $C_{op}$, and discuss their distinct physical significance.

**5.1 Operational Threshold $C_{op}$**

The Operational Threshold marks the minimum complexity required for a system to engage in meaningful adaptive prediction.


**Definition 13 (Operational Threshold $C_{op}$)**

The **Operational Threshold ($C_{op}$)** is defined as the infimum of Predictive Physical Complexity $C_P(\mu)$ (Equation 1) over all physically realizable system microstates $\mu$ (consistent with $\mathcal{L}_{phys}$) that satisfy the following conditions:
(a) The microstate $\mu$ implements a predictive function $f_{\mu}$.
(b) The accuracy $A(f_{\mu})$ of this function, measured against relevant environmental variables $\mathcal{E}$ (using a chosen, well-defined accuracy measure $A$ such as $1-PE$ or information gain),
(c) exceeds the accuracy $A(f_{random})$ achievable by a baseline random chance predictor
(d) by at least a minimal significant threshold $\epsilon_{acc} > 0$.
Formally:
$$
C_{op} = \inf \{ C_P(\mu) \mid \mu \in \mathcal{S}_{phys}, A(f_{\mu}(\mathcal{E}_{past}), \mathcal{E}_{future}) > A(f_{random}(\mathcal{E}_{past}), \mathcal{E}_{future}) + \epsilon_{acc} \} \quad \text{(15)}
$$
where:
*   $\mathcal{S}_{phys}$ is the set of physically realizable microstates.
*   $C_P(\mu)$ is the Predictive Physical Complexity of state $\mu$.
*   The existence of such microstates achieving or arbitrarily approaching this infimum is assumed, contingent upon mild continuity properties of $A(f_\mu)$ with respect to the resources quantified by $C_P(\mu)$ and the properties of $\mathcal{S}_{phys}$ (e.g., that the set of $C_P$ values for states satisfying the accuracy condition is non-empty and bounded below).
*   In practice, for predictions averaged over $T$ trials, $\epsilon_{acc}$ can be chosen to scale appropriately, e.g., $\epsilon_{acc} \sim O(1/\sqrt{T})$, ensuring the threshold is meaningful even for finite operational timescales.

$C_{op}$ represents the minimum complexity required for a system to "come online" as a non-trivial predictive entity capable of engaging in the adaptive Fundamental Predictive Loop (Definition 4) and potentially operating within the Space of Becoming $(\alpha, \beta)$ (Definition 8). Systems with $C(t) < C_{op}$ lack the structural resources for reliable prediction better than chance. Viewed thermodynamically, $C_{op}$ marks the threshold where the system enters the predictive phase, characterized by non-zero irreversible cost ($\varepsilon > 0$, Theorem 31, derived in Appendix J) and active SPAP dynamics (enabled because $C_{op} \ge K_0$).

**5.1.2 Physical Interpretation: Baseline Cost and Capability**

The Operational Threshold $C_{op}$ represents the minimum complexity required to implement the *full integrated functionality* of the adaptive Fundamental Predictive Loop (Definition 4: capabilities $b_m, b_p, b_v, D_{cyc}$, Definition 5) such that it achieves *functional efficacy* (prediction better than chance). As established by Corollary 3 ($C_{op} \ge K_0$), achieving this operational capability *necessarily requires* possessing at least the minimal complexity $K_0$ (Theorem 15) needed for the internal logic of self-reference. Therefore, $C_{op}$ represents the total complexity cost for the minimally functioning, adaptive predictive system. Sustaining this minimal operational cycle incurs a baseline physical resource cost rate, captured by the Physical Operational Cost function $R(C)$ (Definition 3a) evaluated at $C_{op}$:
$$
P_{min} = R(C_{op}) \quad \text{(16)}
$$
This baseline power $P_{min}$ signifies the minimum rate of physical resource consumption (e.g., energy/time) intrinsically required to operate a system at the threshold of non-trivial predictive capability ($C=C_{op}$). This cost is not merely formal but represents a lower bound on the continuous energy dissipation of any physical adaptive device, ultimately linked to fundamental thermodynamic costs like Landauer's principle applied to the MPU cycle (cf. Theorem 29 for the MPU Hamiltonian interpretation, and Section J.3 of Appendix J for the link between information processing and heat dissipation). For instance, a minimal $K_0=3$ bit (or 3-qubit MPU) system operating at $C_{op}=K_0$ at room temperature ($T \approx 300$K) and completing one logical cycle involving minimal irreversible operations per, say, $\tau_{cyc} \sim 10^{-9}$s, would have a baseline power $P_{min} \gtrsim k_B T (\ln 2) / \tau_{cyc} \approx (1.38 \times 10^{-23} \text{ J/K})(300 \text{ K})(0.693) / (10^{-9} \text{ s}) \approx 2.87 \times 10^{-12}$ W. Any system operating adaptively ($C(t) \ge C_{op}$) incurs at least this cost. If available power falls below $P_{min}$, PCE dynamics drive complexity below $C_{op}$, causing predictive performance to collapse. (Further justification for the microscopic heat dissipation bounds and their relation to $R(C)$ can be found in Section D.3 of Appendix D, specifically the work-cost gap mechanism).


**5.2 Minimal Complexity for Self-Reference and Prediction ($K_0$)**

We investigate the minimum complexity needed for a system to instantiate the core logic of the self-referential contradictions underlying SPAP *and* achieve minimal predictive success. Before quantifying this minimum complexity ($K_0$) in bits, we first establish the fundamental logical capabilities that any self-referential predictive system must possess. As established by Convention 1 (Section 2.4.1), Predictive Physical Complexity $C_P$ for quantum systems is measured in bits and relates to the required Hilbert space dimension $d_0$ via $C_P = \log_2 d_0$. This link will be essential in what follows.


**5.2 Minimal Complexity for Self-Reference and Prediction ($K_0$)**

**5.2.1 Fundamental Logical Capabilities for Self-Referential Prediction**

**Proposition 5.2.1 (Necessary Logical Capabilities for Self-Referential Prediction)**

Any system engaging in non-trivial self-referential prediction, irrespective of its specific physical or computational makeup, must simultaneously possess capabilities equivalent to:
* (i) **State Distinction ($b_m$):** The ability to represent and distinguish between its own internal states.
* (ii) **Predictive Generation ($b_p$):** An internal mechanism or model to generate representations of potential future states.
* (iii) **Verification & Update ($b_v$):** The ability to compare its predictions with actual outcomes and initiate an update to its internal state or model.

*Proof Outline:*
* (i) Self-reference requires the system to identify itself and differentiate its current state from others. Without state distinction, referencing a specific "self-state" is ill-defined.
* (ii) Prediction involves forming an internal representation of a future state. Without an internal modeling mechanism, the system cannot generate a prediction distinct from mere reaction.
* (iii) For adaptive or meaningful prediction, the system must assess its predictions against outcomes. Without verification, learning and model improvement are impossible, and predictive accuracy is undefined. For example, a memoryless device or one that cannot compare its output to subsequent events cannot verify its predictions and thus cannot adapt or even ascertain if its predictions are successful.
Thus, these three capabilities ($b_m, b_p, b_v$) are jointly necessary as the logical bedrock for any system that can predictively model aspects of itself and its environment in an operational cycle. QED


The Horizon Constant $K_0$ will represent the minimal physical complexity required to instantiate these capabilities in a way that enables both the encoding of the SPAP self-referential loop and the achievement of predictive accuracy better than chance.

**5.2.2 Theorem 15 (Minimal Complexity for SPAP Logic and Minimal Prediction ($K_0 = 3$ bits))**

Consider a computational framework capable of representing discrete states and implementing state transition functions based on internal computations (consistent with the requirements for Property R, Definition 10). The **Horizon Constant $K_0$** represents the minimum **Predictive Physical Complexity** $K$ (measured in bits) that allows a system to encode the SPAP loop and achieve long-run predictive accuracy strictly greater than the ½ baseline in every binary environment with conditional entropy $H(X_{t+1}\!\mid \mathbf{X_{\le t}})\; \le\; 1-\delta_{min}\quad\text{for some }\delta_{min}>0$. A system within this framework requires a state space capable of representing at least **8 distinct configurations**, corresponding to a minimal information capacity of **3 bits ($B_3$)**, to instantiate the minimal functional logic necessary for the deterministic self-referential paradox constructed in the proof of Theorem 10 (SPAP Encodability). Furthermore, this 3-bit complexity is demonstrated to be sufficient to achieve the required super-chance predictive performance. Thus, the Horizon Constant is:
$$ K_0 = 3 \quad \text{(bits)} $$


*Proof:* The proof demonstrates both necessity ($\ge 3$ bits) and sufficiency ($\le 3$ bits).

*   **(I) Necessity ($K_0 \ge 3$):** We show that fewer than 3 bits are insufficient to reliably implement the SPAP logic cycle.
    1.  *Functional Requirements (for SPAP Logic):* Implementing the deterministic SPAP logic ($\phi_{t+1} = \text{NOT}(\hat{\phi}_{P_f})$, Equation 10) requires a system that can reliably execute a sequence involving: representing the current state component $\phi$; computing a prediction $\hat{\phi}$ based on the state; storing the prediction $\hat{\phi}$ distinctly from $\phi$; computing the next state $\phi_{next}$ using the stored $\hat{\phi}$; and updating the state component to $\phi_{next}$. This sequence requires distinguishing between different configurations corresponding to these operational phases, which are instantiations of the necessary logical capabilities $b_m, b_p, b_v$ (Proposition 5.2.1).
    2.  *Minimum Configurations (for SPAP Logic):* Let the system's state component be $\phi \in \{0,1\}$ and its stored prediction be $p_{stored} \in \{0,1\}$. To execute the SPAP cycle deterministically without destructive overwriting of information needed for the next step, the system must distinguish states corresponding to different phases of the operation. These phases combine values of $\phi$, $p_{stored}$, and at least one "control" or "phase" bit, $c_{phase} \in \{0,1\}$, that sequences operations like "compute prediction," "store prediction," "compute update," "perform update."
        A minimal set of distinct internal configurations needed for one full cycle includes combinations of $(\phi, p_{stored}, c_{phase})$. For example:
        *   Phase 0 (e.g., $c_{phase}=0$): Read current $\phi_t$. Compute $\hat{\phi}_t$. State stores $(\phi_t, p_{old}, 0)$.
        *   Phase 1 (e.g., $c_{phase}=1$): Store $\hat{\phi}_t$ into $p_{stored}$. Update $\phi_t \to \phi_{t+1} = \text{NOT}(\hat{\phi}_t)$. State stores $(\phi_{t+1}, \hat{\phi}_t, 1)$.
        This requires $2 (\text{for } \phi) \times 2 (\text{for } p_{stored}) \times 2 (\text{for } c_{phase}) = 8$ distinct configurations to uniquely represent all necessary combinations of data and control states for one unambiguous cycle. The core SPAP mapping for a deterministic cycle is an injective function on this 8-element domain of logical state configurations.
    3.  *Insufficiency of Fewer Bits (for SPAP Logic):* An automaton with fewer than 8 internal states (i.e., < 3 bits) cannot implement such an injective cycle over an 8-element logical domain; by the pigeonhole principle, distinct logical configurations of the SPAP cycle would necessarily map to the same physical state, leading to ambiguity or failure of the deterministic logic. Therefore, $\lceil\log_2 8\rceil = 3$ independent bits are mandatory. A 3-bit system ($2^3=8$ states, consistent with $C_P = \log_2 d_0$ from Convention 1) provides the minimal sufficient capacity. Therefore, at least 3 bits are necessary, corresponding to a Hilbert space of at least $d_0 = 2^3 = 8$ dimensions.
    4.  *Necessity Conclusion:* Reliable implementation of the SPAP logical cycle requires a state space capable of representing at least 8 distinct configurations. The minimum integer number of bits providing this is 3 bits.

*   **(II) Sufficiency ($K_0 \le 3$):** We demonstrate that a 3-bit system can satisfy both SPAP Encodability and the Super-Chance Predictive Performance criteria. Our simple 3-bit flip-on-error automaton (described below) adapts to any stationary environmental bias $\delta>0$ and achieves accuracy $>\text{½}$ almost surely.
    1.  *SPAP Encodability:* As established in part (I.3), a 3-bit architecture (8 states) provides sufficient state space capacity to implement the necessary sequence of operations for the deterministic SPAP logic without ambiguity.
    2.  *Super-Chance Performance Construction:* Consider an explicit three-bit state machine $\mathcal{M}$ with state tuple $(m, p, e) \in \{0, 1\}^3$. These bits represent: $m$: current internal model; $p$: provisional prediction; $e$: error flag. Let the environment produce a binary sequence $X_t$. The machine operates cyclically:
        *   *Predict:* Output $\hat{X}_t = m$. Set $p \leftarrow m$.
        *   *Observe:* Receive outcome $X_t$.
        *   *Verify:* Compute error $e_{new} = (m \oplus X_t)$.
        *   *Update Model:* If $e_{new}=1$, $m_{new} = 1 - m$. Else $m_{new} = m$.
        *   *Store State:* Update to $(m_{new}, p, e_{new})$.
    3.  *Performance Analysis:* This machine implements "flip-on-error." For environments with conditional entropy $H(X_{t+1}|X_{\le t}) \le 1-\delta_{min}$ (i.e., environments with discoverable regularities, not pure noise), its long-run average accuracy $A_T$ provably exceeds $1/2$. For stationary bias $\delta \neq 0$, $A_T \to 1/2+2\delta^{2}$. For general bias sequences with $\inf_t |\delta_t| \ge\delta_{min}>0$, concentration bounds show $\mathbb E[A_T]\ge\frac12+\delta_{min}/2$, and $A_T\!\xrightarrow{\mathrm{a.s.}}\!E[Z_\infty]\ge½+\delta_{min}/2>½$ ([Cesa-Bianchi & Lugosi 2006]). This strategy fails if $\delta_t$ changes sign too frequently without exploitable structure, but the assumed environment class $H(X_{t+1}|X_{\le t})<1-\delta_{min}$ rules this out.
    4.  *Sufficiency Conclusion:* Since a 3-bit system can be constructed that meets both criteria, 3 bits are sufficient; hence $K_{0}\le3$. Together with $K_{0}\ge3$, we obtain $K_{0}=3$.

*   **Conclusion:** Since 3 bits are necessary (Part I) and sufficient (Part II) for a system to be a minimal predictor, the Horizon Constant is $K_0 = 3$ bits. This 3-bit complexity allows physical realization of the necessary logical capabilities $b_m, b_p, b_v$ (Proposition 5.2.1). QED

**5.2.3 Corollary 3 (Relation Between Thresholds ($C_{op} \ge K_0$))**

The **Operational Threshold $C_{op}$ (Definition 13)** must be greater than or equal to the Horizon Constant $K_0$ (Theorem 15):
$$ C_{op} \ge K_0 = 3 \quad \text{(bits)} \quad \text{(17)} $$
*Proof:* The adaptive Fundamental Predictive Loop (Definition 4) must, at minimum, embody the capabilities of the minimal predictor defined by $K_0=3$. Thus, $C_{op} \ge K_0$. If a target accuracy $\epsilon_{acc}$ (in Definition 13) is significantly higher than the minimal super-chance performance achievable at $K_0$ (e.g., $\epsilon_{acc} \gg \delta_{min}/2$ from Theorem 15 proof), $C_{op}$ will typically exceed $K_0$. This quantitative relationship can be foreshadowed by noting that achieving higher accuracy generally requires more complexity, consistent with the Law of Prediction (Theorem 19), potentially leading to an approximate scaling like $C_{op} \approx K_0 + O(\ln(1/\epsilon'_{acc}))$, where $\epsilon'_{acc}$ is the accuracy gap above the baseline $K_0$-level performance.


**Remark (Explicit Relation):** Because the Operational Threshold $C_{op}$ measures the physical complexity needed to reach a specified accuracy gap $\epsilon_{acc}>0$ (Definition 13), it must satisfy $C_{op}\ge K_{0}=3$.

**5.2.4 Justification: SPAP/RUD Limits Apply Fundamentally to MPUs**

The applicability of fundamental limits like SPAP (Theorem 10, Theorem 11) and Reflexive Undecidability (Theorem 12) to Minimal Predictive Units (MPUs) operating at complexity $C_{op}$ is crucial and follows from the interplay between their intrinsic structure and the optimizing dynamics of the network context.

1.  **Necessary $K_0$ Structure (Logical Prerequisite):** By definition (Definition 23), an MPU operates at $C_{op}$. Since $C_{op} \ge K_0$ (Corollary 3), every MPU inherently possesses *at least* the minimal logical structure ($K_0 \equiv B_3$, Theorem 15) for self-referential processing.
2.  **Effective Operational Realization (Computational Requirement):** Rigorous application of SPAP/RUD relies on the system's ability to *reliably execute* complex computational steps despite inherent ND-RID noise ($\varepsilon>0, f_{RID}<1$).
3.  **POP/PCE Driven Network Optimization (Enabling Mechanism):** It is hypothesized (and argued in Appendix A.0) that POP/PCE dynamics favor MPU network configurations that function as a *reliable computational substrate*, enabling sufficient operational fidelity for SPAP/RUD arguments to hold effectively. (Further details on adaptation dynamics are in Section 6).
4.  **Resulting Applicability:** Consequently, SPAP/RUD limitations apply fundamentally to MPUs due to their $K_0$ structure and the effective computational capability facilitated by the POP/PCE-optimized network.
5.  **Foundation for Indeterminacy:** This grounds Hypothesis 2 (origin of quantum randomness) in Logical Indeterminacy encountered by MPUs.

**5.2.5 Theorem 16 (Universal Necessity of $C_{op}$ for Modeled Process)**

Any physical system exhibiting the operational characteristics modeled by the Predictive Universe framework—specifically, sustaining the adaptive Fundamental Predictive Loop (Definition 4) while dynamically maintaining Predictive Performance $PP(t)$ within the Space of Becoming $(\alpha, \beta)$ (Axiom 3)—must possess the necessary integrated functional capabilities ($b_m, b_p, b_v, D_{cyc}$) (Definition 5, Proposition 5.2.1) and therefore must necessarily have a Predictive Physical Complexity $C(t)$ equal to or greater than the Operational Threshold $C_{op}$ (Definition 13). This implies a hard lower bound on its continuous energy dissipation via $P_{min}=R(C_{op})$ (Equation 16), emphasizing the thermodynamic inevitability of operational costs.
*Proof:*
1.  Assume a system $S$ exhibits the modeled characteristics.
2.  The adaptive loop requires the integrated capabilities ($b_m, b_p, b_v, D_{cyc}$) (Proposition 5.2.1).
3.  $C_{op}$ is the minimum $C_P$ to instantiate these capabilities for prediction significantly better than chance ($A > A_{random} + \epsilon_{acc}$). Since $\alpha > 0$ (Theorem 8), $PP > \alpha$ requires such prediction.
4.  Thus, implementing these capabilities for $PP > \alpha$ requires $C_P \ge C_{op}$.
5.  Suppose $C(S) < C_{op}$. By definition of $C_{op}$, $S$ lacks minimal resources for reliable prediction better than chance.
6.  This prevents sustained adaptive operation with $PP > \alpha$, contradicting the initial assumption.
7.  Therefore, any such system $S$ must have complexity $C(S) \ge C_{op}$. QED

**Table 5.1: Summary of Complexity Thresholds and an Example Instantiation**

| Symbol   | Name                   | Logical Purpose                                               | Complexity (Bits) | Example: 3-Qubit MPU (Sec 7.1.3) |
| :------- | :--------------------- | :------------------------------------------------------------ | :---------------- | :----------------------------------- |
| $K_0$    | Horizon Constant       | Minimal self-reference core & basic super-chance prediction | Exactly 3         | Corresponds to $K_0=3$ structure     |
| $C_{op}$ | Operational Threshold  | Full adaptive loop at target accuracy $\epsilon_{acc} > 0$    | $\ge K_0 = 3$     | Can be $C_{op}=K_0=3$ if $\epsilon_{acc}$ is minimal |
