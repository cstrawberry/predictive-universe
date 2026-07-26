# 5. Complexity Thresholds: Operational Threshold and Horizon Constant

Having established the logical limits on prediction (SPAP, Theorem 10; Theorem 11) and the notion of **Predictive Physical Complexity** $C_P$ (Equation 1), this section formalizes two distinct thresholds within the PU framework. The **Operational Threshold** $C_{op}$ (Definition 13) is the infimum of $C_P$ over implementations of the full adaptive predictive loop that exceed a declared random baseline by a declared margin. The **Horizon Constant** $K_0$ (Theorem 15) is a three-bit visited-context floor within the realization class satisfying its register and full-context hypotheses. Corollary 3 proves $C_{op}\ge K_0$ only under an explicit bridge from operational/Hilbert capacity to $C_P$.

**5.1 Operational Threshold $C_{op}$**

**Definition 13 (Def 13): Operational Threshold ($C_{op}$)**

Let $\mathcal{S}_{phys}$ denote the set of physically realizable system microstates consistent with the physical law set $\mathcal{L}_{phys}$. Let $\mathcal{S}_{phys}^{loop}\subseteq\mathcal{S}_{phys}$ denote the physically realizable microstates whose implemented dynamics instantiate the three phases of the full adaptive Fundamental Predictive Loop (Definition 4), including the integrated capabilities $b_m,b_p,b_v$ of Definition 5. Membership in this set is stipulated by the loop dynamics; it is not inferred from above-chance accuracy or from a functional-support test. For a microstate $\mu\in\mathcal{S}_{phys}^{loop}$, let $C_P(\mu)$ be its Predictive Physical Complexity (Equation 1), and let $f_\mu$ denote the predictive function implemented by $\mu$. Fix a relevant set of environmental variables $\mathcal{E}$ and a well‑defined accuracy functional $A(\cdot)$ (e.g., $1-\mathrm{PE}$, information gain). Let $f_{random}$ denote a baseline random‑chance predictor matched to the task. For a chosen, strictly positive accuracy margin $\epsilon_{acc}>0$,

$$
\boxed{
\;C_{op} \;=\; \inf \Big\{\, C_P(\mu)\ \Big|\ \mu\in\mathcal{S}_{phys}^{loop},\; A\big(f_\mu(\mathcal{E}_{past}),\mathcal{E}_{future}\big)\;>\; A\big(f_{random}(\mathcal{E}_{past}),\mathcal{E}_{future}\big)\;+\;\epsilon_{acc}\,\Big\} \;.
}
\quad \text{(15)}
$$

If the set in (15) is empty, define $C_{op}:=\infty$. Otherwise, since $C_P(\mu)\ge0$ for physically realizable $\mu$ and the set is bounded below, the infimum exists in $[0,\infty)$. For independent trial scores $Z_1,\ldots,Z_T\in[0,1]$, let
$$
\bar\mu_0:=\frac1T\sum_{t=1}^T\mathbb E_0[Z_t]
$$
be their declared average null mean, and let $\delta\in(0,1)$ be the one-sided error probability. Hoeffding's inequality (Hoeffding, 1963) gives
$$
\Pr_0\!\left[
\frac1T\sum_{t=1}^T Z_t-\bar\mu_0\ge\epsilon_{acc}
\right]
\le e^{-2T\epsilon_{acc}^2},
$$
so $\epsilon_{acc}=\sqrt{\log(1/\delta)/(2T)}$ suffices. Dependent trials require a separately stated mixing, martingale, or other concentration hypothesis.

**Interpretation.** For the declared environment, accuracy functional, baseline, and margin in Definition 13, $C_{op}$ is the infimum of $C_P$ over qualifying full-loop implementations. A state with $C_P<C_{op}$ cannot belong to that qualifying set. Existence of an implementation at $C_P=C_{op}$ requires attainment of the infimum, and membership in a Space-of-Becoming band requires the separate task-and-score identification of Definition 8.

**5.1.1 Physical Interpretation: Baseline Cost and Capability**

The Operational Threshold $C_{op}$ measures the infimum of $C_P$ over the qualifying set $\mathcal Q$ in Definition 13. If $\mathcal Q=\varnothing$, no finite threshold loop exists and $P_{min}$ is undefined. Suppose $\mathcal Q\ne\varnothing$, the integer-valued complexity $C_P$ attains its least qualifying value $C_{op}$, every qualifying implementation with complexity $C$ has baseline resource-consumption rate $R(C)$, and $R$ is non-decreasing. Then the least baseline dissipation among qualifying implementations is

$$
\boxed{P_{min}
=\min_{\mu\in\mathcal Q}R\big(C_P(\mu)\big)
=R(C_{op}).}
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

More generally, suppose the loop executes $n_{\mathrm{reset}}\ge1$ registered resets per cycle at temperature $T$ and cycle time $\tau_{cyc}$. For reset $j$, let $P_j$ be the erased register, let $R_j$ be the retained side information, and measure $H_{q_j}(P_j\mid R_j)$ in nats. On the registered-reset branch of Theorem 31, additivity of the per-reset work lower bounds gives
$$
P_{\mathrm{reset}}\ge \frac{k_BT}{\tau_{cyc}}\sum_{j=1}^{n_{\mathrm{reset}}}H_{q_j}(P_j\mid R_j).
$$
The numerical estimate above is the conditionally uniform, overhead-free case $n_{\mathrm{reset}}=1$, $H_q(P\mid R)=\ln2$, $T\approx300$ K, and $\tau_{cyc}\approx10^{-9}$ s. If available power is below the right-hand side, the declared reset schedule cannot be sustained under this work bound. Concluding that $C(t)$ falls below $C_{op}$ additionally requires a dynamical hypothesis linking reset failure to departure from the qualifying set of Definition 13.


**5.2 Minimal Complexity for Self-Reference and Prediction ($K_0$)**

We investigate the minimum complexity needed for a system to instantiate the core logic of the self-referential contradictions underlying SPAP. We then show that the same three-bit register size also admits a minimal predictive mode with super-chance performance on $\mathcal{E}_{\mathrm{basic}}(\gamma)$. Before quantifying this complexity threshold ($K_0$) in bits, we first establish the fundamental logical capabilities that any self-referential predictive system must possess. As established by Convention 1 (Section 2.4.1), the Hilbert-space capacity is $C_{cap}=\log_2 d_0$ (bits), providing the translation between the number of distinguishable internal configurations required by the logic and the minimal dimension $d_0$ required to realize them. This link will be essential in what follows.

**5.2.1 Fundamental Logical Capabilities for Self-Referential Prediction**

**Proposition 5.2.1 (Necessary Logical Capabilities for the Adaptive Predictive Loop)**

Any system instantiating the adaptive Fundamental Predictive Loop of Definition 4 must simultaneously possess capabilities equivalent to:
* (i) **State Distinction ($b_m$):** The ability to represent and distinguish between its own internal states.
* (ii) **Predictive Generation ($b_p$):** An internal mechanism or model that generates a representation of a possible future state before the outcome is observed.
* (iii) **Verification & Update ($b_v$):** The ability to compare the stored prediction with the realized outcome and to initiate an outcome-conditioned state or model transition.

*Proof.* Definition 4 requires model maintenance, prediction generation, verification, and adaptation. Model maintenance is not operationally defined unless at least two relevant internal alternatives can be distinguished; this is $b_m$. Prediction generation requires a forecast representation to exist before the corresponding outcome; this is $b_p$. Verification and adaptation require joint access to the stored forecast and realized outcome, followed by an outcome-conditioned transition; this is $b_v$. If any one of these capabilities is absent, the corresponding required stage of Definition 4 is absent, so the system does not instantiate that adaptive loop. Therefore every realization of the loop has all three capabilities. ∎

**Principle 5b (Response-Independent Full-Context Closure).** A fundamental full-context MPU carries a joint registered readout
$$
r=(r_m,r_p,r_v):\mathcal S_{\mathrm{vis}}\to\{0,1\}^3
$$
whose distinct values are perfectly distinguishable in one registered cycle. For each $j\in\{m,p,v\}$ the branch supplies an admissible endomorphism $F_j:\mathcal S_{\mathrm{vis}}\to\mathcal S_{\mathrm{vis}}$; every finite composition of these endomorphisms is admissible, and after every intermediate state
$$
r_i(F_j s)=
\begin{cases}
1-r_j(s),&i=j,\\
r_i(s),&i\ne j.
\end{cases}
\tag{5b.1}
$$
The readouts are typed indicators of the three loop roles. Identifying them with Theorem 15's current-state, stored-prediction, and phase registers requires a separate response-preserving overlap map. A hardwired realization lies outside this full-context branch.

**Lemma 5b (Full Context from Independent Register Roles).** Principle 5b implies
$$
r(\mathcal S_{\mathrm{vis}})=\{0,1\}^3,
\qquad
r=(r_m,r_p,r_v),
$$
and hence $|\mathcal S_{\mathrm{vis}}|\ge8$.

*Proof.* Fix $s_0$. For any desired triple, apply once, in any order, exactly those admissible interventions whose coordinates differ from $r(s_0)$. Equation (5b.1) holds after every intermediate state and toggles only the selected coordinate, so every triple is reached. Surjectivity and the cardinality bound follow. ∎

**Principle 5c (Operational Online-Capacity Accounting).** Define $C_{\mathrm{on}}(\mu)$ as the peak base-two log-cardinality of the jointly perfectly distinguishable retained register used by one registered cycle. If that register has $N_{\mathrm{dist}}(\mu)$ distinguishable contexts, then by definition
$$
C_{\mathrm{on}}(\mu)\ge\log_2N_{\mathrm{dist}}(\mu).
\tag{5c.1}
$$
This online resource is not the program-description complexity $C_P$ of Equation (1): a short program can generate a large compressible register. Any inequality relating $C_P$ or $C_{op}$ to $C_{\mathrm{on}}$ requires Corollary 3's separately registered complexity--capacity bridge.

**Theorem 15a (Independent Full-Context Register and Carrier Bound).** Principles 5b--5c imply
$$
|\mathcal S_{\mathrm{vis}}|\ge8,
\qquad
C_{\mathrm{on}}(\mu)\ge3
$$
for every implementation in their intervention-closed full-context class. This is independent of Theorem 15's minimum over the (O1)--(O3), (FC) SPAP-register class. On a branch supplying a response-preserving overlap map that identifies the three typed Principle-5b readouts with Theorem 15's current-state, stored-prediction, and phase responses, the two eight-state lower bounds coincide and Theorem 15 separately gives $K_0=3$.

On Principle 8.0b's sharp joint complex-carrier branch, the eight perfectly distinguishable outcomes give $d_0\ge8$. If a faithful $\mathbb C^8$ representative realizes the complete retained response presheaf and every higher-dimensional representative of that same presheaf has strictly larger total PCE potential after response-null quotienting, the selected carrier has $d_0=8$.

*Proof.* Lemma 5b gives the independent eight-context bound, and Principle 5c gives $C_{\mathrm{on}}(\mu)\ge\log_2 8=3$ for each member of this class. These statements do not take an infimum over Definition 13's unrestricted qualifying set. Theorem 15 proves its own eight-state attainment under (O1)--(O3) and (FC); the overlap map is what permits the two typed ledgers to be compared. On the carrier branch, perfect distinguishability gives eight orthogonal supports, hence $d_0\ge8$. The faithful same-presheaf $\mathbb C^8$ comparator attains the bound, and the strict total-cost hypothesis excludes every larger same-presheaf representative. ∎

**Remark 5.2.1a (Class Membership, Performance, and SPAP Scope).** Proposition 5.2.1 is a necessary-condition statement for systems already assumed to instantiate Definition 4. It does not imply that every above-chance predictor is an adaptive loop: a fixed forecast rule can exceed a matched chance baseline without performing online verification or update. Nor does the proposition imply that nulling one capability sends performance to chance. Response activity, loss of a registered qualifying margin, and collapse to a baseline are the three distinct conclusions formalized in Definition 5a and Proposition 5a. The Horizon Constant is proved by Theorem 15 on its (O1)--(O3), (FC) class. Principles 5b--5c give an independent three-bit capacity bound for their intervention-closed full-context class; the two results coincide only on the response-preserving overlap branch of Theorem 15a. Theorem 15(3) proves predictive existence on $\mathcal E_{\mathrm{basic}}(\gamma)$ rather than a universal lower bound for every predictive system.

The Horizon Constant $K_0=3$ is the minimum proved by Theorem 15 in its explicitly typed SPAP-register class. The theorem below gives its eight-state realization and basic super-chance predictive mode; Theorem 15a records when the separate Principle-5b context cube represents the same response data.

**5.2.2 Theorem 15 (Horizon Constant: Minimal Complexity for SPAP Encodability and Minimal Prediction)**

We first state the operational restrictions on the realization class used for the SPAP register-count argument, then state the environment class used to certify minimal predictive success.

**Operational conditions (sub-dynamics hypotheses).**
At the **Commit Snapshot**, impose the following hypotheses:

* **(O1) Injective stepping on the reversible subsystem.** Before the cycle-closing reset, the transition restricted to the visited configurations of the reversible subsystem is injective.
* **(O2) Explicit two-phase control.** A binary response $c_{phase}$ distinguishes the prepare/predict/store phase from the reflex/update phase.
* **(O3) Non-destructive retention.** The current-state response $\phi$ and stored-prediction response $p_{stored}$ remain simultaneously readable across the phase boundary and at the reflexive comparison.

These hypotheses define the restricted realization class analyzed in Theorem 15. The following arguments give their operational motivation but do not derive them from Definition 4 or PCE.

*(O3) Non-destructive retention.* Verification is the finite-response operation that compares the realized state against the previously stored prediction (Definition 4, Verification phase). Suppose, for contradiction, that some realization of the SPAP sub-dynamics overwrites $p_{stored}$ before the comparison while still claiming to instantiate the verification phase. Then at the comparison instant the system has access to $\phi$ but not to $p_{stored}$; the binary distinction "prediction matched outcome" versus "prediction mismatched outcome" is therefore not extractable as a finite response, since both joint values $(\phi, p_{stored})=(0,0)$ and $(\phi, p_{stored})=(0,1)$ produce the same observable record after the overwrite. The verification phase is ill-defined in this case, so the candidate realization does not implement Definition 4. The same argument applies if $\phi$ is overwritten before the comparison. Hence any realization of the SPAP sub-dynamics that does instantiate verification must keep both registers simultaneously readable at the Commit Snapshot.

*(O2) Two-phase control.* The same logical pair $(\phi, p_{stored})$ participates in two operationally distinct steps: prepare/predict/store, in which $p_{stored}$ is written from the current model output; and reflex/update, in which $\phi$ is updated from $p_{stored}$ via the SPAP rule. A finite autonomous transition law $T:\mathcal S\to\mathcal S$ on the system state space $\mathcal S$ is a single-valued function. If the same configuration of $(\phi, p_{stored})$ admits two different successor configurations depending on which step is being performed, then $T$ cannot be a function unless the system state space carries an additional coordinate distinguishing the two steps. Two distinct successors require at least one bit of distinguishing data. If that bit is supplied by an external clock, PPI counts the clock state as part of the physical implementation (Appendix P.6.2), so the bit is still physically instantiated. Hence one binary phase coordinate $c_{phase}$ is required either internally or as a counted external register.

*(O1) Operational motivation for injective stepping.* If two pre-commit configurations differ only by response-null information, PPI identifies them before operational contexts are counted. If their distinction is required by the verification response, merging them before the Commit Snapshot destroys that response and the realization fails Definition 4. A response-relevant distinction unused by verification can make a merge thermodynamically costly, but PCE excludes that merge only if an admissible merge-free realization with the same response presheaf and strictly smaller total PCE potential exists. These observations motivate (O1); they do not prove injectivity for every element of the qualifying set in Definition 13.

**Environment class for minimal predictive success.**

Let $(X_t)_{t\ge 0}$ be a binary process adapted to its natural history $\mathcal{H}_t = X_{\le t}$. Define the one‑step *persistence statistic*

$$
s_t \;=\; \Pr\!\big[X_{t+1}=X_t\ \big|\ \mathcal{H}_t\big].
$$

For $0<\gamma\le\tfrac12$, define

$$
\mathcal{E}_{\mathrm{basic}}(\gamma)\;=\;\Big\{\text{stationary ergodic binary processes}\ :\ \liminf_{T\to\infty}\ \frac1T\sum_{t=0}^{T-1}\mathbb{E}[s_t]\ \ge\ \tfrac12+\gamma\Big\}.
$$

For the declared $0<\gamma\le\tfrac12$, this class includes an i.i.d. Bernoulli($p$) process precisely when
$$
p^2+(1-p)^2
=\frac12+2\left(p-\frac12\right)^2
\ge\frac12+\gamma,
$$
and it includes the usual uniform-stationary ergodic symmetric two-state Markov chain with persistence $q$ precisely when
$$
\frac12+\gamma\le q<1.
$$
At $q=1$ the uniform-stationary chain is not ergodic and therefore is not an element of $\mathcal E_{\mathrm{basic}}(\gamma)$; degenerate absorbing stationary realizations, if admitted, must be stated separately.

Assume (O1)–(O3) and the following full-context hypothesis:

* **(FC) Full binary role context.** On the visited state set $\mathcal S_{\mathrm{vis}}$, the current-state, stored-prediction, and phase responses are represented by maps
  $$
  r_m,r_p,r_v:\mathcal S_{\mathrm{vis}}\to\{0,1\}
  $$
  whose joint map $r=(r_m,r_p,r_v)$ is surjective onto $\{0,1\}^3$.

Within this realization class, the **Horizon Constant** equals

$$
\boxed{K_0 = 3\ \text{bits}.}
$$

More precisely:

1. (**SPAP Encodability—Necessity**). Any realization of the SPAP sub‑dynamics

   $$
   \phi_{t+1}=\mathrm{NOT}\big(p_{stored}\big)
   $$

   that satisfies (O1)–(O3) and (FC) requires at least $8$ distinct visited operational configurations. The construction in part (2) attains the bound, so
   $$
   N_{\mathrm{vis}}^{\min}=8,
   \qquad
   K_0=\log_2 N_{\mathrm{vis}}^{\min}=3.
   $$
   On the Hilbert-carrier branch, representing these contexts by mutually perfectly distinguishable alternatives gives $\log_2 d_0\ge3$ and hence $d_0\ge8$.

2. (**SPAP Encodability—Sufficiency**). There exists a three‑bit (eight‑state) architecture with state $(\phi, p_{stored}, c_{phase})$ and a two‑phase injective transition that satisfies (O1)–(O3) and (FC), preserves $(\phi,p_{stored})$ across the Commit Snapshot, and implements the reflex update $\phi_{t+1}=\mathrm{NOT}(p_{stored})$ without ambiguity.

3. (**Minimal Predictive Success—Sufficiency on $\mathcal{E}_{\mathrm{basic}}(\gamma)$**). Within the same three-bit register size, a predictive mode that stores the last observed outcome and predicts persistence achieves long-run accuracy strictly greater than $1/2$ on $\mathcal{E}_{\mathrm{basic}}(\gamma)$. Its empirical accuracy converges almost surely to $\mathbb E[s_0]\ge\tfrac12+\gamma$.

*Proof.*
**(1) Necessity.** Hypothesis (FC) makes
$$
r:\mathcal S_{\mathrm{vis}}\to\{0,1\}^3
$$
surjective. For any map between finite sets, the cardinality of the image cannot exceed that of the domain. Therefore
$$
8=|\{0,1\}^3|=|r(\mathcal S_{\mathrm{vis}})|
\le |\mathcal S_{\mathrm{vis}}|.
$$
Taking base-two logarithms gives
$$
\log_2|\mathcal S_{\mathrm{vis}}|\ge\log_2 8=3.
$$
Part (2) supplies an eight-state realization, so the lower bound is attained and $N_{\mathrm{vis}}^{\min}=8$, $K_0=3$. If the eight contexts are represented by perfectly distinguishable Hilbert states, those states are mutually orthogonal; an orthonormal set has cardinality at most the Hilbert-space dimension. Hence $d_0\ge8$. ∎

**Remark 5.2.2a (Conditional robustness of $K_0 \ge 3$ under reformalization).**  
The lower bound is invariant under relabeling states, changing internal variable names, or reordering micro-operations provided that the realization continues to satisfy (O1)–(O3) and (FC). Indeed, (FC) requires the joint finite-response map onto the eight elements of $\{0,1\}^3$ to remain surjective. Hence every such encoding has
$$
|\mathcal S_{\mathrm{vis}}|\ge8,
\qquad
\log_2|\mathcal S_{\mathrm{vis}}|\ge3.
$$
The construction in Theorem 15(2) attains this conditional lower bound, so within this realization class
$$
N_{\mathrm{vis}}^{\min}=2^3=8,
\qquad
K_0=\log_2 N_{\mathrm{vis}}^{\min}=3.
$$
On the Hilbert-carrier branch, representing the contexts by mutually perfectly distinguishable alternatives gives
$$
\log_2 d_0\ge3,
\qquad
d_0\ge8.
$$

**Corollary 5.2.2b (Finite-State Full-Context Criterion).** No SPAP realization satisfying (FC) can be carried by fewer than eight visited states. If a candidate has a visited state set $\mathcal S_{\mathrm{vis}}$ with
$$
|\mathcal S_{\mathrm{vis}}|=N<8,
$$
then no transition table, phase convention, or state relabeling can make its joint three-role readout surjective onto $\{0,1\}^3$.

*Proof.* Let
$$
r=(r_m,r_p,r_v):\mathcal S_{\mathrm{vis}}\to\{0,1\}^3.
$$
For any map from an $N$-element domain,
$$
|r(\mathcal S_{\mathrm{vis}})|\le|\mathcal S_{\mathrm{vis}}|=N.
$$
If $N<8$, then
$$
|r(\mathcal S_{\mathrm{vis}})|<8=|\{0,1\}^3|,
$$
so $r$ is not surjective and (FC) fails. The eight-state construction in Theorem 15(2) satisfies (FC), so the conditional bound is attained. ∎

**(2) Sufficiency.** On the register $\{0,1\}^3$ with coordinates $(\phi,p_{stored},c_{phase})$, define
$$
T(\phi,p,0)=(\phi,p,1),
\qquad
T(\phi,p,1)=(1-p,\phi,0).
$$
The first slice map is bijective onto the $c_{phase}=1$ slice. The second is bijective onto the $c_{phase}=0$ slice because
$$
T^{-1}(a,b,0)=(b,1-a,1).
$$
The two images lie in disjoint phase slices, so $T$ is a bijection of all eight register states and satisfies (O1); the first rule preserves $(\phi,p)$ and supplies (O2)–(O3). Starting from $(0,0,0)$ gives the orbit
$$
(0,0,0)\to(0,0,1)\to(1,0,0)\to(1,0,1)
\to(1,1,0)\to(1,1,1)\to(0,1,0)\to(0,1,1)\to(0,0,0),
$$
which visits every element of $\{0,1\}^3$ and therefore satisfies (FC) for the coordinate readouts. On each reflex step the first output coordinate is $1-p=\mathrm{NOT}(p_{stored})$, so the SPAP update is implemented. ∎

This completes the three-bit sufficiency construction for SPAP encodability. The next part addresses a separate claim: using the same three-bit register size, one can also implement a predictive mode with super-chance performance on $\mathcal{E}_{\mathrm{basic}}(\gamma)$. The present construction proves encodability of the SPAP reflex rule; the next one proves basic predictive success.

**(3) Minimal Predictive Success.** Let $\hat X_{t+1}:=X_t$ and define
$$
Y_t:=\mathbf 1\{\hat X_{t+1}=X_{t+1}\}
=\mathbf 1\{X_{t+1}=X_t\}.
$$
The process $(Y_t)$ is a measurable factor of the stationary ergodic process $(X_t)$, hence is stationary and ergodic, and $0\le Y_t\le1$ makes it integrable. The Birkhoff pointwise ergodic theorem (Birkhoff, 1931) therefore gives
$$
\frac1T\sum_{t=0}^{T-1}Y_t\longrightarrow\mathbb E[Y_0]
\qquad\text{almost surely}.
$$
By the tower property and the definition of $s_t$,
$$
\mathbb E[Y_t]
=\mathbb E\!\left[\mathbb E[Y_t\mid\mathcal H_t]\right]
=\mathbb E\!\left[\Pr(X_{t+1}=X_t\mid\mathcal H_t)\right]
=\mathbb E[s_t].
$$
Stationarity makes $\mathbb E[s_t]=\mathbb E[s_0]$ for every $t$. Hence membership in $\mathcal E_{\mathrm{basic}}(\gamma)$ implies
$$
\mathbb E[Y_0]=\mathbb E[s_0]\ge\frac12+\gamma,
$$
which proves the almost-sure super-chance accuracy claim. If an error occurs at time $t$, then $X_{t+1}=1-X_t$, so $\hat X_{t+2}=X_{t+1}=1-\hat X_{t+1}$; this is the stated flip-on-error behavior. One register bit stores $X_t$, the prediction response reads that bit, and after observing $X_{t+1}$ the register stores $X_{t+1}$ for the next cycle, which fits within the declared three-bit capacity. ∎

**Consequence.** Within the realization class satisfying (O1)–(O3) and (FC), the least visited-context capacity that supports the stated SPAP encoding is attained by the construction in Theorem 15(2):
$$
K_0=3,
\qquad
N_{\mathrm{vis}}^{\min}=8.
$$
On the Hilbert-carrier branch, Convention 1 translates representation of these eight contexts as mutually perfectly distinguishable alternatives into $d_0\ge8$. The explicit construction shows that $d_0=8$ is admissible for this register model. Selecting that saturating value by PCE requires a separately stated optimization domain and objective, and relating this capacity bound to $C_P$ requires the bridge hypothesis of Corollary 3.

**5.2.3 Corollary 3 (Conditional Relation Between Thresholds $C_{op}\ge K_0$)**

Let $\mathcal Q$ be the qualifying set inside the infimum in Definition 13. Assume that every $\mu\in\mathcal Q$ satisfies (O1)–(O3) and (FC), is represented on the Hilbert-carrier branch, and obeys the complexity-capacity bridge
$$
C_P(\mu)\ge C_{cap}(\mu)=\log_2d_0(\mu).
$$
Then the **Operational Threshold** satisfies

$$
\boxed{C_{op}\ \ge\ K_0\ =\ 3\ \text{bits}.}
\quad \text{(17)}
$$

*Proof.* If $\mathcal Q=\varnothing$, Definition 13 gives $C_{op}=\infty$, so the inequality holds in the extended real line. Suppose $\mathcal Q\ne\varnothing$. For every $\mu\in\mathcal Q$, Theorem 15(1) and the Hilbert-carrier hypothesis give
$$
C_{cap}(\mu)=\log_2d_0(\mu)\ge3.
$$
The complexity-capacity bridge therefore yields $C_P(\mu)\ge3$ for every $\mu\in\mathcal Q$. Taking the infimum over $\mathcal Q$ gives
$$
C_{op}=\inf_{\mu\in\mathcal Q}C_P(\mu)\ge3=K_0.
$$
∎

**Remark (Scope of the Threshold Relation).** Under the realization-class and complexity-capacity bridge hypotheses of Corollary 3, $C_{op}\ge K_0=3$. Separately, under the multiplicative-composition hypothesis of Theorem 19 and for a held task scale $\hat C_{target}$, Equation (23) gives
$$
C-C_{op}
=\frac{\hat C_{target}}{\kappa_{\mathrm{eff}}}
\ln\!\left(\frac{\beta-\alpha}{\beta-PP}\right).
$$
This logarithmic relation concerns complexity above $C_{op}$ near the performance ceiling; it does not determine the dependence of $C_{op}$ on the Definition 13 margin $\epsilon_{acc}$.

**5.2.4 Conditional Applicability of SPAP/RUD Limits to MPUs**

An MPU belongs to the SPAP/RUD scope only on a branch carrying the required computational certificates:

1. **SPAP certificate.** The retained MPU realization class has effective coding, predictor simulation, Boolean or threshold predicate evaluation, uniform finite-program composition, and the diagonal/self-reference closure of Theorems 10–11.
2. **RUD certificate.** For Theorem 12, the RID maps or kernels are computable and the system descriptions are reliably manipulable within Effective Operational Property R.
3. **Physical execution.** Any noisy implementation must execute the certified finite computation with the reliability assumed by the relevant operational theorem. Registered reset and refresh/minorization hypotheses govern thermodynamic cost and channel contraction; they do not imply the computational certificates.

Under items 1–2, Theorems 10–12 apply with their stated class-level quantifiers. The three-bit full-context result of Theorem 15 alone supplies neither diagonal closure nor Effective Operational Property R.

**5.2.5 Theorem 16 (Threshold Property for Qualifying Modeled Processes)**

Choose the environment class, accuracy functional, random baseline, and margin $\epsilon_{acc}>0$ appearing in Definition 13. Let $S$ have a microstate $\mu_S$ belonging to the corresponding qualifying set $\mathcal Q$. Then
$$
C_P(\mu_S)\ge C_{op}.
$$
If, in addition, the actual continuous power $P(S)$ satisfies $P(S)\ge R(C_P(\mu_S))$ and $R$ is non-decreasing, then
$$
P(S)\ge R(C_{op}).
$$

*Proof.* Because $\mu_S\in\mathcal Q$ and
$$
C_{op}=\inf_{\mu\in\mathcal Q}C_P(\mu),
$$
the defining lower-bound property of the infimum gives $C_P(\mu_S)\ge C_{op}$. Under the two cost hypotheses, monotonicity yields
$$
P(S)\ge R(C_P(\mu_S))\ge R(C_{op}).
$$
No implication from $PP>\alpha$ to membership in $\mathcal Q$ is asserted without a separate relation between $PP$ and the chosen accuracy functional. ∎

**Table 5.1 — Complexity Thresholds and an Example Instantiation**

|  Symbol  | Name                  | Logical Purpose                                                                                               | Complexity (Bits) | Example: 3‑Qubit MPU (Sec. 7.1.3)            |
| :------: | :-------------------- | :------------------------------------------------------------------------------------------------------------ | :---------------- | :------------------------------------------- |
|   $K_0$  | Horizon Constant      | Least visited-context capacity in the SPAP realization class satisfying (O1)–(O3) and (FC); the same register size admits a basic super-chance mode on $\mathcal{E}_{\mathrm{basic}}(\gamma)$ | Exactly 3 within that class | $d_0=8$ Hilbert carrier, SPAP two-phase map |
| $C_{op}$ | Operational Threshold | Infimum of $C_P$ for the declared task and margin $\epsilon_{acc}>0$                                          | $\ge K_0=3$ only under Corollary 3's bridge hypotheses | The three-bit carrier alone does not establish equality |



