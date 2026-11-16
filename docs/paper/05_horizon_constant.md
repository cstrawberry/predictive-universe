# 5. Complexity Thresholds: Operational Threshold and Horizon Constant

Having established the logical limits on prediction (SPAP, Theorem 10; Theorem 11) and the notion of **Predictive Physical Complexity** $C_P$ (Equation 1), this section formalizes two distinct thresholds within the PU framework. The **Operational Threshold** $C_{op}$ (Definition 13) is the infimum of $C_P$ over implementations of the full adaptive predictive loop that exceed a declared random baseline by a declared margin. The **Horizon Constant** $K_0$ (Theorem 15) is a three-bit visited-context floor within the realization class satisfying its register and full-context hypotheses. Corollary 3 proves $C_{op}\ge K_0$ only under an explicit bridge from operational/Hilbert capacity to $C_P$.

**5.1 Operational Threshold $C_{op}$**

<a id="definition-13-def-13-operational-threshold-c_op"></a>**Definition 13 (Def 13): Operational Threshold ($C_{op}$)**

Let $\mathcal{S}_{\mathrm{phys}}$ denote the set of physically realizable system microstates consistent with the physical law set $\mathcal{L}_{\mathrm{phys}}$. Let $\mathcal{S}_{\mathrm{phys}}^{\mathrm{loop}}\subseteq\mathcal{S}_{\mathrm{phys}}$ denote the physically realizable microstates that lie in the finite full-constraint-realizability domain of $C_P$ in Section 2.4.1 and whose implemented dynamics instantiate the three phases of the full adaptive Fundamental Predictive Loop (Definition 4), including the integrated capabilities $b_m,b_p,b_v$ of Definition 5. Membership requires both that complexity-domain condition and the stated loop dynamics; it is not inferred from above-chance accuracy or from a functional-support test. For a microstate $\mu\in\mathcal{S}_{\mathrm{phys}}^{\mathrm{loop}}$, let $C_P(\mu)$ be its Predictive Physical Complexity (Equation 1), and let $f_\mu$ denote the predictive function implemented by $\mu$. Fix a relevant set of environmental variables $\mathcal{E}$ and a well‑defined accuracy functional $A(\cdot)$ (e.g., $1-\mathrm{PE}$, information gain). Let $f_{\mathrm{random}}$ denote a baseline random‑chance predictor matched to the task. For a chosen, strictly positive accuracy margin $\epsilon_{acc}>0$,

$$
\boxed{
\;C_{op} \;=\; \inf \Big\{\, C_P(\mu)\ \Big|\ \mu\in\mathcal{S}_{\mathrm{phys}}^{\mathrm{loop}},\; A\big(f_\mu(\mathcal{E}_{past}),\mathcal{E}_{\mathrm{future}}\big)\;>\; A\big(f_{\mathrm{random}}(\mathcal{E}_{past}),\mathcal{E}_{\mathrm{future}}\big)\;+\;\epsilon_{acc}\,\Big\} \;.
}
\quad \text{(15)}
$$

If the set in (15) is empty, define $C_{op}:=\infty$. Otherwise choose a qualifying state $\mu_0$. The domain condition gives a finite value $C_P(\mu_0)$, and nonnegativity gives $0\le C_{op}\le C_P(\mu_0)<\infty$. Thus the infimum exists in $[0,\infty)$. For independent trial scores $Z_1,\ldots,Z_T\in[0,1]$, let
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

The Operational Threshold $C_{op}$ measures the infimum of $C_P$ over the qualifying set $\mathcal Q$ in Definition 13. If $\mathcal Q=\varnothing$, no finite threshold loop exists and $P_{\min}$ is undefined. Suppose $\mathcal Q\ne\varnothing$, the integer-valued complexity $C_P$ attains its least qualifying value $C_{op}$, every qualifying implementation with complexity $C$ has baseline resource-consumption rate $R(C)$, and $R$ is non-decreasing. Then the least baseline dissipation among qualifying implementations is

$$
\boxed{P_{\min}
=\min_{\mu\in\mathcal Q}R\big(C_P(\mu)\big)
=R(C_{op}).}
\quad \text{(16)}
$$

A concrete baseline arises from Landauer‑type considerations for logically irreversible steps within the MPU cycle (cf. **Theorem 31** and Appendix J):

* Example: a minimal $K_0=3$‑bit (or 3‑qubit) system operating at $C_{op}=K_0$ at $T\approx 300$ K and completing one logically irreversible operation per $\tau_{cyc}\approx 10^{-9}$ s has

  $$
  P_{\min}\ \gtrsim\ k_B T (\ln 2)/\tau_{cyc}\ \approx\ (1.381\times10^{-23}\,\mathrm{J/K})\,(300\,\mathrm{K})\,(0.693)/(10^{-9}\,\mathrm{s})
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

<a id="proposition-521-necessary-logical-capabilities-for-the-adaptive-predictive-loop"></a>**Proposition 5.2.1 (Necessary Logical Capabilities for the Adaptive Predictive Loop)**

Any system instantiating the adaptive Fundamental Predictive Loop of Definition 4 must simultaneously possess capabilities equivalent to:
* (i) **State Distinction ($b_m$):** The ability to represent and distinguish between its own internal states.
* (ii) **Predictive Generation ($b_p$):** An internal mechanism or model that generates a representation of a possible future state before the outcome is observed.
* (iii) **Verification & Update ($b_v$):** The ability to compare the stored prediction with the realized outcome and to initiate an outcome-conditioned state or model transition.

*Proof.* Definition 4 requires model maintenance, prediction generation, verification, and adaptation. Model maintenance is not operationally defined unless at least two relevant internal alternatives can be distinguished; this is $b_m$. Prediction generation requires a forecast representation to exist before the corresponding outcome; this is $b_p$. Verification and adaptation require joint access to the stored forecast and realized outcome, followed by an outcome-conditioned transition; this is $b_v$. If any one of these capabilities is absent, the corresponding required stage of Definition 4 is absent, so the system does not instantiate that adaptive loop. Therefore every realization of the loop has all three capabilities. ∎

<a id="principle-5b-response-independent-full-context-closure"></a>**Principle 5b (Response-Independent Full-Context Closure).** A fundamental full-context MPU carries a nonempty visited state set $\mathcal S_{\mathrm{vis}}$ and a joint registered readout
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

<a id="lemma-5b-full-context-from-independent-register-roles"></a>**Lemma 5b (Full Context from Independent Register Roles).** Principle 5b implies
$$
r(\mathcal S_{\mathrm{vis}})=\{0,1\}^3,
\qquad
r=(r_m,r_p,r_v),
$$
and hence $|\mathcal S_{\mathrm{vis}}|\ge8$.

*Proof.* Fix $s_0$. For any desired triple, apply once, in any order, exactly those admissible interventions whose coordinates differ from $r(s_0)$. Equation (5b.1) holds after every intermediate state and toggles only the selected coordinate, so every triple is reached. Surjectivity and the cardinality bound follow. ∎

<a id="principle-5c-operational-online-capacity-accounting"></a>**Principle 5c (Operational Online-Capacity Accounting).** Define $C_{\mathrm{on}}(\mu)$ as the peak base-two log-cardinality of the jointly perfectly distinguishable retained register used by one registered cycle. If that register has $N_{\mathrm{dist}}(\mu)$ distinguishable contexts, then by definition
$$
C_{\mathrm{on}}(\mu)\ge\log_2N_{\mathrm{dist}}(\mu).
\tag{5c.1}
$$
This online resource is not the program-description complexity $C_P$ of Equation (1): a short program can generate a large compressible register. Any inequality relating $C_P$ or $C_{op}$ to $C_{\mathrm{on}}$ requires Corollary 3's separately registered complexity--capacity bridge.

<a id="theorem-15a-independent-full-context-register-and-carrier-bound"></a>**Theorem 15a (Independent Full-Context Register and Carrier Bound).** Principles 5b--5c imply
$$
|\mathcal S_{\mathrm{vis}}|\ge8,
\qquad
C_{\mathrm{on}}(\mu)\ge3
$$
for every implementation in their intervention-closed full-context class. This is independent of Theorem 15's minimum over the (O1)--(O3), (FC) SPAP-register class. On a branch supplying a response-preserving overlap map that identifies the three typed Principle-5b readouts with Theorem 15's current-state, stored-prediction, and phase responses, the two eight-state lower bounds coincide and Theorem 15 separately gives $K_0=3$.

On Principle 8.0b's sharp joint complex-carrier branch, the eight perfectly distinguishable outcomes give $d_0\ge8$. If a faithful $\mathbb C^8$ representative realizes the complete retained response presheaf and every higher-dimensional representative of that same presheaf has strictly larger total PCE potential after response-null quotienting, the selected carrier has $d_0=8$.

*Proof.* Lemma 5b gives the independent eight-context bound, and Principle 5c gives $C_{\mathrm{on}}(\mu)\ge\log_2 8=3$ for each member of this class. These statements do not take an infimum over Definition 13's unrestricted qualifying set. Theorem 15 proves its own eight-state attainment under (O1)--(O3) and (FC); the overlap map is what permits the two typed ledgers to be compared. On the carrier branch, perfect distinguishability gives eight orthogonal supports, hence $d_0\ge8$. The faithful same-presheaf $\mathbb C^8$ comparator attains the bound, and the strict total-cost hypothesis excludes every larger same-presheaf representative. ∎

<a id="remark-521a-class-membership-performance-and-spap-scope"></a>**Remark 5.2.1a (Class Membership, Performance, and SPAP Scope).** Proposition 5.2.1 is a necessary-condition statement for systems already assumed to instantiate Definition 4. It does not imply that every above-chance predictor is an adaptive loop: a fixed forecast rule can exceed a matched chance baseline without performing online verification or update. Nor does the proposition imply that nulling one capability sends performance to chance. Response activity, loss of a registered qualifying margin, and collapse to a baseline are the three distinct conclusions formalized in Definition 5a and Proposition 5a. The Horizon Constant is proved by Theorem 15 on its (O1)--(O3), (FC) class. Principles 5b--5c give an independent three-bit capacity bound for their intervention-closed full-context class; the two results coincide only on the response-preserving overlap branch of Theorem 15a. Theorem 15(3) proves predictive existence on $\mathcal E_{\mathrm{basic}}(\gamma)$ rather than a universal lower bound for every predictive system.

The Horizon Constant $K_0=3$ is the minimum proved by Theorem 15 in its explicitly typed SPAP-register class. The theorem below gives its eight-state realization and basic super-chance predictive mode; Theorem 15a records when the separate Principle-5b context cube represents the same response data.

<a id="522-theorem-15-horizon-constant-minimal-complexity-for-spap-encodability-and-minimal-prediction"></a>**5.2.2 Theorem 15 (Horizon Constant: Minimal Complexity for SPAP Encodability and Minimal Prediction)**

We first state the operational restrictions on the realization class used for the SPAP register-count argument, then state the environment class used to certify minimal predictive success.

**Operational conditions (sub-dynamics hypotheses).**
At the **Commit Snapshot**, impose the following hypotheses:

* **(O1) Injective stepping on the reversible subsystem.** Before the cycle-closing reset, the transition restricted to the visited configurations of the reversible subsystem is injective.
* **(O2) Explicit two-phase control.** A binary response $c_{\mathrm{phase}}$ distinguishes the prepare/predict/store phase from the reflex/update phase.
* **(O3) Non-destructive retention.** The current-state response $\phi$ and stored-prediction response $p_{\mathrm{stored}}$ remain simultaneously readable across the phase boundary and at the reflexive comparison.

These hypotheses define the restricted realization class analyzed in Theorem 15. The following arguments give their operational motivation but do not derive them from Definition 4 or PCE.

*(O3) Non-destructive retention.* Verification is the finite-response operation that compares the realized state against the previously stored prediction (Definition 4, Verification phase). Suppose, for contradiction, that some realization of the SPAP sub-dynamics overwrites $p_{\mathrm{stored}}$ before the comparison while still claiming to instantiate the verification phase. Then at the comparison instant the system has access to $\phi$ but not to $p_{\mathrm{stored}}$; the binary distinction "prediction matched outcome" versus "prediction mismatched outcome" is therefore not extractable as a finite response, since both joint values $(\phi, p_{\mathrm{stored}})=(0,0)$ and $(\phi, p_{\mathrm{stored}})=(0,1)$ produce the same observable record after the overwrite. The verification phase is ill-defined in this case, so the candidate realization does not implement Definition 4. The same argument applies if $\phi$ is overwritten before the comparison. Hence any realization of the SPAP sub-dynamics that does instantiate verification must keep both registers simultaneously readable at the Commit Snapshot.

*(O2) Two-phase control.* The same logical pair $(\phi, p_{\mathrm{stored}})$ participates in two operationally distinct steps: prepare/predict/store, in which $p_{\mathrm{stored}}$ is written from the current model output; and reflex/update, in which $\phi$ is updated from $p_{\mathrm{stored}}$ via the SPAP rule. A finite autonomous transition law $T:\mathcal S\to\mathcal S$ on the system state space $\mathcal S$ is a single-valued function. If the same configuration of $(\phi, p_{\mathrm{stored}})$ admits two different successor configurations depending on which step is being performed, then $T$ cannot be a function unless the system state space carries an additional coordinate distinguishing the two steps. Two distinct successors require at least one bit of distinguishing data. If that bit is supplied by an external clock, PPI counts the clock state as part of the physical implementation (Appendix P.6.2), so the bit is still physically instantiated. Hence one binary phase coordinate $c_{\mathrm{phase}}$ is required either internally or as a counted external register.

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
   \phi_{t+1}=\mathrm{NOT}\big(p_{\mathrm{stored}}\big)
   $$

   that satisfies (O1)–(O3) and (FC) requires at least $8$ distinct visited operational configurations. The construction in part (2) attains the bound, so
   $$
   N_{\mathrm{vis}}^{\min}=8,
   \qquad
   K_0=\log_2 N_{\mathrm{vis}}^{\min}=3.
   $$
   On the Hilbert-carrier branch, representing these contexts by mutually perfectly distinguishable alternatives gives $\log_2 d_0\ge3$ and hence $d_0\ge8$.

2. (**SPAP Encodability—Sufficiency**). There exists a three‑bit (eight‑state) architecture with state $(\phi, p_{\mathrm{stored}}, c_{\mathrm{phase}})$ and a two‑phase injective transition that satisfies (O1)–(O3) and (FC), preserves $(\phi,p_{\mathrm{stored}})$ across the Commit Snapshot, and implements the reflex update $\phi_{t+1}=\mathrm{NOT}(p_{\mathrm{stored}})$ without ambiguity.

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

<a id="remark-522a-conditional-robustness-of-k_0-ge-3-under-reformalization"></a>**Remark 5.2.2a (Conditional robustness of $K_0 \ge 3$ under reformalization).**  
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

**(2) Sufficiency.** On the register $\{0,1\}^3$ with coordinates $(\phi,p_{\mathrm{stored}},c_{\mathrm{phase}})$, define
$$
T(\phi,p,0)=(\phi,p,1),
\qquad
T(\phi,p,1)=(1-p,\phi,0).
$$
The first slice map is bijective onto the $c_{\mathrm{phase}}=1$ slice. The second is bijective onto the $c_{\mathrm{phase}}=0$ slice because
$$
T^{-1}(a,b,0)=(b,1-a,1).
$$
The two images lie in disjoint phase slices, so $T$ is a bijection of all eight register states and satisfies (O1); the first rule preserves $(\phi,p)$ and supplies (O2)–(O3). Starting from $(0,0,0)$ gives the orbit
$$
(0,0,0)\to(0,0,1)\to(1,0,0)\to(1,0,1)
\to(1,1,0)\to(1,1,1)\to(0,1,0)\to(0,1,1)\to(0,0,0),
$$
which visits every element of $\{0,1\}^3$ and therefore satisfies (FC) for the coordinate readouts. On each reflex step the first output coordinate is $1-p=\mathrm{NOT}(p_{\mathrm{stored}})$, so the SPAP update is implemented. ∎

<a id="remark-522c-architecture-enumeration-and-the-independence-of-fc"></a>**Remark 5.2.2c (Architecture Enumeration and the Independence of (FC)).** Fix the two-phase form used in Theorem 15(2),
$$
T(\phi,p,0)=(\phi,W(\phi,p),1),
\qquad
T(\phi,p,1)=(1-p,U(\phi,p),0),
$$
with $W,U:\{0,1\}^2\to\{0,1\}$. Exhaustive enumeration of the $256$ pairs $(W,U)$ gives the following finite certificate.

1. Exactly $16$ pairs make $T$ injective on all eight configurations. Each has the unique form
$$
W(\phi,p)=p\oplus k(\phi),
\qquad
U(\phi,p)=\phi\oplus h(p)
$$
for Boolean maps $k,h:\{0,1\}\to\{0,1\}$.
2. Exactly $4$ of those $16$ pairs have a single eight-element orbit and hence satisfy (FC).
3. When verification is evaluated at the Commit Snapshot states $c_{\mathrm{phase}}=1$, every two- or four-element orbit has constant match/mismatch outcome, whereas each of the eight six-element orbits contains both outcomes. Thus informative verification does not imply (FC).

*Proof of the enumeration.* Each of $W,U$ has four binary input entries, so there are $2^4\cdot2^4=256$ pairs. On the phase-zero slice, the first output coordinate is $\phi$; injectivity is therefore equivalent to $W(\phi,0)\ne W(\phi,1)$ for each $\phi$, giving $W(\phi,p)=p\oplus k(\phi)$. On the phase-one slice, the first output is $1-p$; injectivity is equivalent to $U(0,p)\ne U(1,p)$ for each $p$, giving $U(\phi,p)=\phi\oplus h(p)$. The two image slices are disjoint. Consequently these conditions are necessary and sufficient, and the four choices for each of $k,h$ give exactly sixteen injective maps.

For the return map $F=T^2$ on phase zero, set $q=p\oplus k(\phi)$. Then
$$
F(\phi,p)=(1-q,\phi\oplus h(q)).
$$
The intervening Commit Snapshot is $(\phi,q,1)$, with match indicator $\mathbf1_{\{\phi=q\}}$. A cycle of $F$ of length $r$ gives a cycle of $T$ of length $2r$. The complete table lists the four images of $F$ in the order $00,01,10,11$. Cycles start at their smallest unlisted two-bit state and follow $F$; the match strings follow this same order, with semicolons separating cycles.

| $k(0)k(1)$ | $h(0)h(1)$ | $F(00),F(01),F(10),F(11)$ | $T$-cycle lengths | Commit match strings |
|:--:|:--:|:--|:--|:--|
| 00 | 00 | 10,00,11,01 | 8 | 1010 |
| 00 | 01 | 10,01,11,00 | 6+2 | 101; 0 |
| 00 | 10 | 11,00,10,01 | 6+2 | 110; 0 |
| 00 | 11 | 11,01,10,00 | 4+2+2 | 11; 0; 0 |
| 01 | 00 | 10,00,01,11 | 6+2 | 110; 0 |
| 01 | 01 | 10,01,00,11 | 4+2+2 | 11; 0; 0 |
| 01 | 10 | 11,00,01,10 | 8 | 1010 |
| 01 | 11 | 11,01,00,10 | 6+2 | 101; 0 |
| 10 | 00 | 00,10,11,01 | 2+6 | 0; 101 |
| 10 | 01 | 01,10,11,00 | 8 | 0101 |
| 10 | 10 | 00,11,10,01 | 2+4+2 | 0; 11; 0 |
| 10 | 11 | 01,11,10,00 | 6+2 | 011; 0 |
| 11 | 00 | 00,10,01,11 | 2+4+2 | 0; 11; 0 |
| 11 | 01 | 01,10,00,11 | 6+2 | 011; 0 |
| 11 | 10 | 00,11,01,10 | 2+6 | 0; 101 |
| 11 | 11 | 01,11,00,10 | 8 | 0101 |

Four rows contain one cycle of length eight. Eight rows contain one six-cycle and one two-cycle; every displayed three-bit match string for a six-cycle contains both outcomes. The remaining four rows contain a four-cycle and two two-cycles. Every four-cycle has match string $11$ and every two-cycle has match string $0$. These exhaust the sixteen maps and establish all three claims. ∎

For example, $k(0)=k(1)=0$, $h(0)=0$, and $h(1)=1$ gives the informative orbit
$$
(0,0,0)\to(0,0,1)\to(1,0,0)\to(1,0,1)\to(1,1,0)\to(1,1,1)\to(0,0,0).
$$
It satisfies (O1)--(O3), implements $\phi_{t+1}=\operatorname{NOT}(p_{\mathrm{stored}})$ at every reflex state, and has
$$
N_{\mathrm{vis}}=6,
\qquad
\log_2N_{\mathrm{vis}}=\log_2 6<3.
$$
Consequently (FC) is independent of (O1)--(O3), the displayed SPAP sub-dynamics, and informative Commit Snapshot verification. The value $K_0=3$ remains the attained floor on Theorem 15's full-context class; the larger informative class contains the six-state witness above.

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

<a id="theorem-15b-complete-o1-o3fc-cardinality-ablation-classification"></a>**Theorem 15b (Complete O1--O3/FC Cardinality-Ablation Classification).** Consider all $2^4$ subsets of the displayed hypotheses (O1), (O2), (O3), and (FC), with the conclusion restricted to the visited-state cardinality bound $|\mathcal S_{\mathrm{vis}}|\ge8$.

1. Every subset containing (FC) forces the bound, because the joint readout is a surjection onto $\{0,1\}^3$; (O1)--(O3) are unused in that count.
2. Every subset omitting (FC) fails to force the bound. The six-state orbit in Remark 5.2.2c satisfies all of (O1)--(O3), implements the reflex rule and has informative Commit Snapshot verification, yet has $|\mathcal S_{\mathrm{vis}}|=6$.
3. The eight-state construction of Theorem 15(2) satisfies all four hypotheses and attains the bound.

Thus, among the sixteen displayed axiom-ablation classes, exactly the eight containing (FC) force the eight-state cardinality conclusion. Within this hypothesis family, (FC) is necessary and sufficient for that conclusion, while (O1)--(O3) govern transition semantics rather than the count.

*Proof.* Item 1 is the cardinality theorem for a surjection. The single six-state witness satisfies the strongest FC-omitting subset and therefore every weaker FC-omitting subset, proving item 2. Theorem 15(2) proves item 3. These cases exhaust the sixteen subsets. ∎

<a id="523-corollary-3-conditional-relation-between-thresholds-c_opge-k_0"></a>**5.2.3 Corollary 3 (Conditional Relation Between Thresholds $C_{op}\ge K_0$)**

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

<a id="proposition-523a-integer-attainment-and-the-exact-equality-gate"></a>**Proposition 5.2.3a (Integer Attainment and the Exact Equality Gate).** Assume $\mathcal Q\ne\varnothing$ and every $\mu\in\mathcal Q$ is full-constraint-realizable under the finite-alphabet, integer-length hypotheses of Theorem 2.4.1b. Then
$$
C_P(\mathcal Q):=\{C_P(\mu):\mu\in\mathcal Q\}
\subseteq\mathbb N
$$
has a least element. Hence Definition 13's infimum is attained without a compactness hypothesis:
$$
C_{op}=\min_{\mu\in\mathcal Q}C_P(\mu).
\tag{17a}
$$
On the additional bridge branch of Corollary 3,
$$
C_{op}=K_0=3
\quad\Longleftrightarrow\quad
(\exists\mu\in\mathcal Q)\ C_P(\mu)=3.
\tag{17b}
$$
At the retained numerical-consequence level, a nonempty image $\{4\}$ satisfies the lower bound and has $C_{op}=4>K_0$. This observation alone does not construct that image in the fixed universal-machine hierarchy.

*Proof.* Theorem 2.4.1b identifies every domain-defined $C_P(\mu)$ with an attained integer program length. The well-ordering principle gives a least element of the nonempty image, and a preimage state attains it, proving (17a). Corollary 3 gives $C_{op}\ge3$; equality holds exactly when the minimum image contains $3$, proving (17b). Proposition 5.2.3b below treats $\{4\}$ as a numerical-projection model without promoting it to a fixed-hierarchy qualifying class. ∎

<a id="proposition-523b-complete-numerical-equality-completion-fiber"></a>**Proposition 5.2.3b (Complete Numerical Equality-Completion Fiber).** Forget the program hierarchy and physical-realization fields while retaining Theorem 15(2)'s response register, the Hilbert-capacity value $\log_2d_0=3$, the declared task, score and positive margin, and the numerical consequences
$$
\varnothing\ne\mathcal Q,
\qquad
c:\mathcal Q\longrightarrow\mathbb N,
\qquad
c(\mu)\ge3.
\tag{17c}
$$
Define $c_{op}:=\min c(\mathcal Q)$. Up to equality of the retained complexity image, the complete class of such numerical completions is
$$
\left\{
S\subseteq\{3,4,\ldots\}:S\ne\varnothing
\right\},
\qquad
c_{op}=\min S.
\tag{17d}
$$
Consequently,
$$
c_{op}=K_0=3
\quad\Longleftrightarrow\quad
3\in S.
\tag{17e}
$$
Every displayed image is nonvacuous at this numerical-projection level: take $\mathcal Q_S=S$ and $c(s)=s$. In particular, the singleton models $S=\{3\}$ and $S=\{4\}$ have identical retained response/capacity entries and give equality and strict inequality, respectively. This projection classification makes no claim that an arbitrary $S$, or either singleton, is the complexity image of a microstate class under the specified universal machine and full admissible hierarchy of Section 2.4.1.

*Proof.* Equation (17c) makes $S=c(\mathcal Q)$ a nonempty subset of $\{3,4,\ldots\}$, so well-ordering supplies the minimum in (17d). Conversely, the displayed identity model realizes every such $S$ in the numerical language. Since every member of $S$ is at least $3$, its minimum is $3$ exactly when $3$ belongs to $S$, proving (17e). The two singleton choices prove nonentailment of equality and of strict inequality from the retained numerical projection. ∎

<a id="proposition-523c-presentation-relative-threshold-spectrum-and-fiber-bound"></a>**Proposition 5.2.3c (Presentation-Relative Threshold Spectrum and Fiber Bound).** Call $\mathfrak P=(\Sigma,U,\mu_{\mathrm{ref}},\{\mathcal L_n\}_{n\ge0})$ a presentation when it satisfies the hypotheses of Theorem 2.4.1b, and write $\operatorname{Dom}(\mathfrak P)$ for its full-constraint-realizable microstates and $C_P^{\mathfrak P}$ for its complexity. Let $\mathcal Q_{\mathrm{ph}}$ be the set of physically realizable microstates that instantiate the adaptive loop of Definition 13 and exceed its accuracy margin. Membership in $\mathcal Q_{\mathrm{ph}}$ does not refer to the presentation, and Definition 13 gives the qualifying set $\mathcal Q(\mathfrak P)=\mathcal Q_{\mathrm{ph}}\cap\operatorname{Dom}(\mathfrak P)$. Fix a presentation $\mathfrak P$ with $|\Sigma|\ge2$ whose qualifying set $\mathcal Q:=\mathcal Q(\mathfrak P)$ is nonempty and satisfies the hypotheses of Corollary 3, and put
$$
m_0:=\min_{\mu\in\mathcal Q}\lceil\log_2d_0(\mu)\rceil.
\tag{17f}
$$
A presentation $\mathfrak P'$ with alphabet $\Sigma$ is **$\mathcal Q$-admissible** when $\mathcal Q(\mathfrak P')=\mathcal Q$ and $C_P^{\mathfrak P'}(\mu)\ge\log_2d_0(\mu)$ for every $\mu\in\mathcal Q$.

1. Every $\mathcal Q$-admissible presentation has $C_{op}\ge m_0\ge3$, and $m_0=3$ exactly when some $\mu\in\mathcal Q$ has $d_0(\mu)=8$.
2. For $b\in\Sigma$ and $t\ge0$, the padded presentation $\mathfrak P^{+t}$ with $U^{+t}(b^tP,x):=U(P,x)$ and $\mathcal L_n^{+t}:=\{b^tP:P\in\mathcal L_n\}$ is $\mathcal Q$-admissible; its complexity satisfies $C_P^{+t}=C_P^{\mathfrak P}+t$ on $\operatorname{Dom}(\mathfrak P)$, and its threshold is $C_{op}^{+t}=C_{op}+t$.
3. Fix $a\ne b$ in $\Sigma$ and $\mu_*\in\mathcal Q$ with $\lceil\log_2d_0(\mu_*)\rceil=m_0$. For every integer $m\ge m_0$, the anchored presentation $\mathfrak P_m$ given by
$$
U_m(a^m,x):=\mu_*,
\qquad
U_m(b^mP,x):=U(P,x),
\qquad
\mathcal L_n^{(m)}:=\{a^m\}\cup\{b^mP:P\in\mathcal L_n\},
\tag{17g}
$$
with $U_m$ undefined on every other string, is $\mathcal Q$-admissible. Its complexity satisfies $C_P^{(m)}(\mu_*)=m$ and $C_P^{(m)}=C_P^{\mathfrak P}+m$ on $\operatorname{Dom}(\mathfrak P)\setminus\{\mu_*\}$, and its threshold is $C_{op}^{(m)}=m$.
4. Consequently,
$$
\{C_{op}(\mathfrak P'):\mathfrak P'\ \text{is}\ \mathcal Q\text{-admissible}\}
=\{m\in\mathbb N:m\ge m_0\}.
\tag{17h}
$$
Equality $C_{op}=K_0=3$ holds for some $\mathcal Q$-admissible presentation exactly when some qualifying microstate has $d_0=8$, and every $\mathcal Q$-admissible presentation with $C_{op}=3$ has a minimizer $\mu$ with $C_P(\mu)=\log_2d_0(\mu)=3$.
5. The machines of items 2--3 are computable when $U$ is and keep the domain of $U(\cdot,\mu_{\mathrm{ref}})$ prefix-free when it is. With $K_U(y):=\min\{K(P):U(P,\mu_{\mathrm{ref}})=y\}$, they change $K_U$ by exactly $t$, respectively by at most $\max(m,K_U(\mu_*))$, and each is universal when $U$ is. The padded presentations add a uniform code-length overhead. In the anchored presentations, the interpreter stores $\mu_*$ and returns it on the special prefix $a^m$. The measured program length then omits the interpreter-held data. Definition 2.4.1d requires a structurally independent presentation for a physical complexity claim. Any description-length comparison involving an anchored evaluator must account for the interpreter and its stored data under a common reference encoding.
6. For every presentation $\mathfrak P'=(\Sigma,U',\mu_{\mathrm{ref}},\{\mathcal L'_n\})$ and every $s\in\mathbb N$, at most $|\Sigma|^s$ members of $\mathcal Q(\mathfrak P')$ have complexity $s$. If $U'(\cdot,\mu_{\mathrm{ref}})$ has prefix-free domain, then
$$
\sum_{\mu\in\mathcal Q(\mathfrak P')}|\Sigma|^{-C_P^{\mathfrak P'}(\mu)}\le1.
\tag{17i}
$$
In particular, at most $|\Sigma|^3$ qualifying microstates have complexity $3$, and an infinite qualifying class has an unbounded complexity image.

*Proof.* For item 1, the bridge and integrality of $C_P$ give $C_P(\mu)\ge\lceil\log_2d_0(\mu)\rceil\ge m_0$ on $\mathcal Q$, and the bridge with finite $C_P(\mu)$ forces $d_0(\mu)<\infty$. Theorem 15(1) gives $d_0\ge8$ on the Hilbert-carrier branch, so $\lceil\log_2d_0\rceil=3$ exactly when $d_0=8$.

For item 3, the prefixes $a^m$ and $b^m$ differ in their first symbol, so (17g) defines a partial map. Nesting of $\{\mathcal L_n\}$ passes to $\{\mathcal L_n^{(m)}\}$, and neither membership rule refers to $C_P$, $C_{op}$ or an MPU. A program $b^mP$ lies in every level and outputs $\mu$ exactly when $P$ does, and $a^m$ lies in every level and outputs $\mu_*\in\operatorname{Dom}(\mathfrak P)$. Hence $\operatorname{Dom}(\mathfrak P_m)=\operatorname{Dom}(\mathfrak P)$ and $\mathcal Q(\mathfrak P_m)=\mathcal Q$. Minimum-length full realizers give $C_P^{(m)}=m+C_P^{\mathfrak P}$ away from $\mu_*$ and $C_P^{(m)}(\mu_*)=\min(m,m+C_P^{\mathfrak P}(\mu_*))=m$. The bridge persists because $m+C_P^{\mathfrak P}(\mu)\ge C_P^{\mathfrak P}(\mu)\ge\log_2d_0(\mu)$ for $\mu\ne\mu_*$ and $m\ge m_0\ge\log_2d_0(\mu_*)$, and the remaining hypotheses of Corollary 3 are properties of the microstates in $\mathcal Q$. Therefore $C_{op}^{(m)}=m$. Item 2 is the same computation without the anchor. Item 4 combines items 1 and 3 with the integer attainment (17a); for its last clause, Proposition 5.2.3a attains $C_{op}=3$ at some $\mu$, and $3=C_P(\mu)\ge\log_2d_0(\mu)\ge3$.

For item 5, the added rules are finite. The string $a^m$ is incomparable in the prefix order with every $b^mP$, and $b^mP$ is a prefix of $b^mP'$ exactly when $P$ is a prefix of $P'$. The output complexities satisfy $K_{U^{+t}}=K_U+t$, $K_{U_m}=K_U+m$ away from $\mu_*$ and $K_{U_m}(\mu_*)=m$. For every program $P$ and input $x$, $U^{+t}(b^t\sigma P,x)=U(\sigma P,x)$ and $U_m(b^m\sigma P,x)=U(\sigma P,x)$, so a simulation prefix $\sigma$ of $U$ for a machine $V$ yields the simulation prefix $b^t\sigma$, respectively $b^m\sigma$, for $V$.

For item 6, choose for each $\mu\in\mathcal Q(\mathfrak P')$ a minimum-length full realizer $P_\mu$ by Theorem 2.4.1b. Since $U'(P_\mu,\mu_{\mathrm{ref}})=\mu$, distinct microstates have distinct realizers, and $\Sigma$ has $|\Sigma|^s$ strings of length $s$. If the domain is prefix-free, the one-sided infinite sequences extending distinct $P_\mu$ form disjoint cylinders of uniform measure $|\Sigma|^{-K(P_\mu)}$, which gives (17i). Finite fibers force an infinite qualifying class to have an unbounded image. ∎

Items 1--4 lift the nonentailment of Proposition 5.2.3b from its numerical projection to Section 2.4.1 presentations: whenever $\mathcal Q$ contains a member with $d_0=8$, the anchored presentations with $m=3$ and $m=4$ satisfy every hypothesis of Corollary 3 and give $C_{op}=3$ and $C_{op}=4$. Item 6 bounds the fiber multiplicities that (17c) leaves free, while every image set in (17d) remains compatible with (17i) because $\sum_{s\ge3}|\Sigma|^{-s}\le\tfrac14$. Proposition 5.2.3c thus places the value of $C_{op}$ in the registered presentation, which an accepted baseline-identity extension of Definition 2.4.1d fixes; $K_0=3$ does not depend on the reference machine (Section 2.4.1).

<a id="proposition-523e-three-symbol-equality-census-and-copy-anchored-presentations"></a>**Proposition 5.2.3e (Three-Symbol Equality Census and Copy-Anchored Presentations).** Work on the branch of Corollary 3 with a presentation $\mathfrak P=(\Sigma,U,\mu_{\mathrm{ref}},\{\mathcal L_n\})$ whose qualifying set $\mathcal Q=\mathcal Q(\mathfrak P)$ is nonempty, and write $\mathcal L_\infty:=\bigcap_n\mathcal L_n$.

1. *Reduction of the equality test.* $C_{op}=K_0=3$ holds exactly when some string $P\in\Sigma^3$ satisfies $P\in\mathcal L_\infty$ and $U(P,\mu_{\mathrm{ref}})\in\mathcal Q$; every such output has $d_0=8$. Moreover no string of length at most two in $\mathcal L_\infty$ has an output in $\mathcal Q$. The equality is therefore decided by $|\Sigma|^3$ membership queries, eight for a binary alphabet, each consisting of the realizability question $P\in\mathcal L_\infty$ and the qualification question $U(P,\mu_{\mathrm{ref}})\in\mathcal Q_{\mathrm{ph}}$; the rest of the complexity image is not needed.
2. *Copy-anchored presentations.* Suppose $\mu_{\mathrm{ref}}\in\mathcal Q$ and $\lceil\log_2d_0(\mu_{\mathrm{ref}})\rceil=m_0$, with $m_0$ as in (17f). Fix $a\ne b$ in $\Sigma$. For every integer $m\ge m_0$ define
$$
U^{\mathrm{cp}}_m(a^m,x):=x,
\qquad
U^{\mathrm{cp}}_m(b^mP,x):=U(P,x),
\qquad
\mathcal L^{\mathrm{cp},m}_n:=\{a^m\}\cup\{b^mP:P\in\mathcal L_n\},
\tag{17j}
$$
with $U^{\mathrm{cp}}_m$ undefined on every other string. Then $\mathfrak P^{\mathrm{cp}}_m$ is a $\mathcal Q$-admissible presentation with $C_P(\mu_{\mathrm{ref}})=m$, $C_P=C_P^{\mathfrak P}+m$ elsewhere on $\operatorname{Dom}(\mathfrak P)$, and $C_{op}=m$. The added rule copies the input and names no microstate. The machine $U^{\mathrm{cp}}_m$ is computable when $U$ is, keeps the domain of $U(\cdot,\mu_{\mathrm{ref}})$ prefix-free when it is, and is universal when $U$ is. Hence, when the reference microstate is a qualifying microstate with $d_0=8$, the presentations $\mathfrak P^{\mathrm{cp}}_3$ and $\mathfrak P^{\mathrm{cp}}_4$ add no microstate name to $\mathfrak P$ and have $C_{op}=3$ and $C_{op}=4$.
3. *Consequence.* Within Section 2.4.1's axioms, the property of naming no microstate does not fix $C_{op}$, in either direction. The padded presentations of Proposition 5.2.3c(2) raise the threshold by any $t\ge0$, and under the hypothesis of item 2 the copy-anchored presentations realize every value $m\ge m_0$. The equality $C_{op}=K_0$ is fixed by the registered machine and hierarchy on the $|\Sigma|^3$ strings of item 1, which an accepted hierarchy registration with its baseline-identity extension (Definition 2.4.1d) identifies; Theorems 5.2.3f and 2.4.1k give the separate HC8 and classical R14 registrations.

*Proof.* Item 1. By (17a)--(17b), $C_{op}=3$ exactly when some $\mu\in\mathcal Q$ has $C_P(\mu)=3$, and by (2.4.1b.4) $C_P(\mu)$ is the least length of a string in $\mathcal L_\infty$ with output $\mu$. The bridge gives $C_P(\mu)\ge\log_2d_0(\mu)\ge3$ on $\mathcal Q$, so a string of length three in $\mathcal L_\infty$ with output $\mu\in\mathcal Q$ gives $C_P(\mu)=3$ and $d_0(\mu)=8$, and no shorter string in $\mathcal L_\infty$ has an output in $\mathcal Q$. Membership in $\mathcal Q=\mathcal Q_{\mathrm{ph}}\cap\operatorname{Dom}(\mathfrak P)$ of an output of a string in $\mathcal L_\infty$ is membership in $\mathcal Q_{\mathrm{ph}}$. Item 2. The prefixes $a^m$ and $b^m$ differ in their first symbol, so (17j) defines a partial map, and the levels are nested. The string $a^m$ lies in every level and outputs $\mu_{\mathrm{ref}}\in\operatorname{Dom}(\mathfrak P)$, and $b^mP$ lies in every level and outputs $\mu$ exactly when $P$ does; hence $\operatorname{Dom}(\mathfrak P^{\mathrm{cp}}_m)=\operatorname{Dom}(\mathfrak P)$ and the qualifying set is unchanged. Minimum-length realizers give $C_P(\mu_{\mathrm{ref}})=\min(m,m+C_P^{\mathfrak P}(\mu_{\mathrm{ref}}))=m$ and $C_P=m+C_P^{\mathfrak P}$ elsewhere. The bridge persists because $m\ge m_0\ge\log_2d_0(\mu_{\mathrm{ref}})$ and $m+C_P^{\mathfrak P}(\mu)\ge\log_2d_0(\mu)$. So $C_{op}=m$ by (17a). The added rule is finite and computable, $a^m$ is incomparable with every $b^mP$ in the prefix order, and a simulation prefix $\sigma$ of $U$ gives the simulation prefix $b^m\sigma$. Item 3 combines item 2 with Proposition 5.2.3c(2). ∎

Choosing $m=3$ in (17j) uses the value $K_0=3$, which Theorem 15 fixes independently of the reference machine, and is a choice of presentation made with the equality in view. Item 2 is a nonentailment statement about the syntactic property of naming no microstate.

<a id="remark-scope-of-the-threshold-relation"></a>**Remark (Scope of the Threshold Relation).** Under the realization-class and complexity-capacity bridge hypotheses of Corollary 3, $C_{op}\ge K_0=3$. Separately, under the multiplicative-composition hypothesis of Theorem 19 and for a held task scale $\hat C_{\mathrm{target}}$, Equation (23) gives
$$
C-C_{op}
=\frac{\hat C_{\mathrm{target}}}{\kappa_{\mathrm{eff}}}
\ln\!\left(\frac{\beta-\alpha}{\beta-PP}\right).
$$
This logarithmic relation concerns complexity above $C_{op}$ near the performance ceiling; it does not determine the dependence of $C_{op}$ on the Definition 13 margin $\epsilon_{acc}$.

**5.2.4 Conditional Applicability of SPAP/RUD Limits to MPUs**

An MPU belongs to the SPAP/RUD scope only on a branch carrying the required computational certificates:

1. **SPAP certificate.** The retained MPU realization class has effective coding, predictor simulation, Boolean or threshold predicate evaluation, uniform finite-program composition, and the diagonal/self-reference closure of Theorems 10–11.
2. **RUD certificate.** For Theorem 12, the RID maps or kernels are computable and the system descriptions are reliably manipulable within Effective Operational Property R.
3. **Physical execution.** Any noisy implementation must execute the certified finite computation with the reliability assumed by the relevant operational theorem. Registered reset and refresh/minorization hypotheses govern thermodynamic cost and channel contraction; they do not imply the computational certificates.

Theorem 1R and Theorems 1--3 of the pure-$\mathbf S$ root-restarted universality theorem (Cinematic Strawberry, 2026, Theorem 1R) supply exact selected computation, literal source-output reading and a fixed regular halting language. Corollary 2a gives an intermediate-trace realization of item 1's interpreter component. Corollary 2b constructs a further realization by compiling terminating bounded trace queries, using the implementing class's finite orchestration and scalable storage. The persistent certificate-enumeration theorem (Cinematic Strawberry, 2026, Theorem 5) separately supplies a direct finite encoding of every explicit ordered-binary source instance and a bounded current-term observer sound on the complete encoded reduction cone. The associated projection has exact finite range and cofinal recovery on finite valid history ideals; a separate declaration supplies a directed subdivision of the valid ordered occurrence-history tree. Coding, uniform composition and Boolean post-processing, logical memory, diagonal closure, and physical execution remain separate entries. Theorem 15's $K_0$ ledger is entered through a response-preserving realization into its $(\mathrm{O1})$--$(\mathrm{O3})$, $(\mathrm{FC})$ context census.

Under items 1–2, Theorems 10–12 apply with their stated class-level quantifiers. The three-bit full-context result of Theorem 15 alone supplies neither diagonal closure nor Effective Operational Property R.

<a id="525-theorem-16-threshold-property-for-qualifying-modeled-processes"></a>**5.2.5 Theorem 16 (Threshold Property for Qualifying Modeled Processes)**

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

<a id="construction-523d-sealed-eight-role-predictor-and-exact-presentation-relative-minimum"></a>**Construction 5.2.3d (Sealed Eight-Role Predictor and Exact Presentation-Relative Minimum).** On the ideal finite primitive and supplied-ready-stock assumptions below, HC8 has a qualifying adaptive loop of accuracy 3/4, a visited eight-dimensional role carrier and complete complexity image {3}. The construction and proof specify one complete initialized assembly and its entire physical program hierarchy. Identification with a separately specified presentation requires equality with the explicit tuple below.

### 1. One sealed physical assembly

Fix a singleton ideal factory HC8 whose supplied primitives are calibrated coordinate permutations, coordinate/comparator splitters, finite interval source selectors, and finite consumed-label selector modules. Its only supplied initialized architecture is the sealed assembly H. There is no ROM-writing, expansion, general-program-execution, alternative-assembly or parameter-setting service. These services define its closed physical inventory.

$H$ has one eight-mode bank with basis $e_{\phi,p,c}$, where the third coordinate is a literal binary phase latch. Its readouts are current state/outcome $\phi$, stored prediction $p$, and phase $c$. This is not the CSW-P input register renamed to a phase: the device has no $I$ bank coordinate. Outcome acquisition instead acts on $\phi$ through a source-controlled permutation, as specified below. A finite sealed sequencer selects the listed stage operations; it cannot supply an uncounted substitute for $c$. O1 is the controlled reversible-subsystem claim at each fixed stage and source setting. The stage and retained source setting remain in the counted apparatus context; projecting them away and demanding an autonomous single-valued law on repeated bare-bank snapshots is not claimed.

The supplied assembly also includes the finite stage sequencer and acquisition gate; a comparator whose output actually wires the next-model selector, including six finite comparator/readout modules (four diagnostic and two predictive) and every internal selector supply they require; three external-input rotor sockets; eight diagnostic and two predictive finite write-once record packages; two fresh closing-reset/consumed-label modules, each including its complete CSW selector and any internal rotor; eight live-channel controller pairs of bias resistors; finite battery and signal stocks. The ready-board package additionally supplies 32 fresh complete coordinate-readout modules, padded beyond the finite stage-read demand, alongside the six comparator modules. Every such module includes any internal selector rotor, switch and retained microscopic label required by its accepted CSW realization. The record package supplies their 38 finite label/completion slots, including bypassed modules. The three separately named rotors are external task-input rotors only; they do not purport to enumerate the internal selector rotors. Every read/comparison uses its assigned supplied module once, with no cost-free cyclic reuse. All these padded supplies are included in the declared one-joule ready-board package and one-joule record package primitive stock entries. The ready assembly has $e_{000}$, blank records, ready modules, and all source parameters fixed. Future rotor outcomes are external experiment inputs, not missing initialized internal data.

For a fully numerical formal stock instance, use $V_{b}=1$ volt, $R_{b}=1$ ohm, signal energy $E_0=1$ joule, and zero final battery reserve. The complete eight-second protocol below requires 16 resistors × 1 watt × 8 seconds = 128 joules of actual bias heat. Declare one joule each for the whole ready-board/comparator/sequencer package, each of three external rotors, each of two entire reset modules, and the complete finite write-once record package. Ready stock is $1+3+2+1=7$ joules; initial battery/ready/signal stock is 136 joules. The package prices are primitive supplied-ready-stock resource entries inherited from the CSW boundary, not measured manufacture energies or entropy conversions. No cyclic erasure is claimed. All old labels remain in supplied record/modules; no apparatus used below is free. All ideal routing is lossless except the inherited accounted signal/absorber partition, whose total remains $E_0$. This budget pays for the extension, including its diagnostic.

### 2. Same-bank SPAP diagnostic and phase semantics

During the first four seconds apply eight half-second diagnostic steps, using the actual CSW permutation coupler

$$
\begin{aligned}
T(\phi,p,0)&=(\phi,p,1), \\
T(\phi,p,1)&=(1-p,\phi,0).
\end{aligned}
$$

The phase-0 branch preserves both $\phi$ and $p$ into the comparison boundary. At phase 1, a nondestructive basis comparator reads $\phi$ and $p$ before applying the reflex branch. The comparator writes a finite match bit without merging basis states; the record remains counted. The entire map $T$ is a permutation; its inverse on phase-0 outputs is $T^{-1}(a,b,0)=(b,1-a,1)$, and its inverse on phase-1 outputs is $(a,b,0)$. The orbit from 000 is

000,001,100,101,110,111,010,011,000.

Thus the actual visited register, not merely a preparable state space, has all eight role contexts. Every reflex step sets the next current state to $\mathrm{NOT}(p_{\mathrm{stored}})$. O1, O2, O3 and FC hold with literal coordinate maps. The bank returns to its original state before task acquisition. Diagnostic records and the sequencer do not reset for free; they remain in their supplied packages.

The diagnostic realizes Theorem 15's finite sub-dynamics on the eight displayed role states.

### 3. Original two-cycle predictive task on that same initialized assembly

After the diagnostic, the same bank acquires the independent fair bit $B_0$ into $\phi$ and starts at $(B_0,0,0)$. Let $F_1,F_2$ be independent quarter-interval CSW rotor bits with probability 1/4 of 1. The environment is $B_t=B_{t-1}\oplus F_{t}$. Each $F_{t}$ is drawn/read only after the corresponding forecast commitment. Independent uniform coordinates in $[0,1)$ give $B_0$ by threshold 1/2 and $F_t$ by threshold 1/4; the selected finite labels remain in the counted records. The task is the two-cycle mean forecast accuracy against the independent fair baseline 1/2, with $\epsilon_{\mathrm{acc}}=1/8$.

The last four seconds consist of two four-slot cycles of half a second each:

1. Prediction: from $(M,0,0)$, apply the permutation $(\phi,p,c)\to(\phi,p\oplus\phi,c)$, committing $p=M$. The forecast is read nondestructively on these basis inputs.
2. Acquisition: reveal $F_{t}$ and use its physical source signal to control $X_\phi^F$. Since the active induction has $M=B_{t-1}$, $\phi$ becomes $B_{t}$ while $p$ remains the committed forecast. This is an injective permutation for each retained external source input, not a many-to-one overwrite with an unstated ancilla.
3. Verification: at the post-acquisition state $(\phi,p,0)$, toggle $c$ to 1, preserving both other coordinates. Read $S=1\{\phi=p\}$ by the actual comparator. The phase-boundary pair of snapshots makes both outcomes and predictions simultaneously readable. $S$ is wired to the closing module; it is not an external score with no effect on the device.
4. Feedback update and cycle closing: use $S$ and $p$ to prepare the next model $M_{\mathrm{next}}=p\oplus(1-S)$, and reset the working prediction/phase coordinates to zero, retaining the previous microscopic label in the fresh consumed-label module. For a fixed $S$ this is the physically implemented selector with blocks
$A_{\phi,p,c}^{(S)}=|p\oplus(1-S),0,0\rangle\langle\phi,p,c|$.
The sum $A^*A$ is identity. These complete rank-one columns implement the normalized finite instrument, retaining the input label in a fresh eight-valued consumed-label module. On the actual comparator-consistent branch $p\oplus(1-S)=\phi=B_t$, so the next model equals the verified outcome. The reset is deliberately not asserted reversible on the bare bank. It is the cycle-closing reset excluded from O1, with its finite retained-label source cost already paid.

The update is genuinely feedback-conditioned: on fixed p, changing S changes $M_{\mathrm{next}}$; no next model is handed to a constant forecaster. The acquired outcome temporarily occupies $\phi$ during Verification; the model for the next cycle is written by the S-controlled closing module. This respects Definition 4's prediction, acquisition/comparison, then feedback update order. The second prediction uses that new model. Representation, forecast generation, verification and update initiation are physical connected components, so above-chance accuracy alone is not being substituted for full-loop admission.

For every source atom, the first and second predictions are correct exactly when $F_1=0$ and $F_2=0$ respectively. Thus each accuracy is 3/4 and the two-cycle mean is $3/4>5/8$. The joint input law is $\Pr(B_0,F_1,F_2)=1/2$ times the two Bernoulli quarter laws. All eight atoms are positive; the source fixes the law, rather than estimating it from one record.

All original predictive pre-reset operations on the reversible bank are permutations conditional on recorded source settings, and nondestructive comparison retains their distinction. Across the $0\to1$ boundary, $(\phi,p)$ is unchanged. Already in the first cycle, $p=B_0$ and $\phi=B_0\oplus F_1$ take all four pairs with positive probability; both $c=0$ and $c=1$ snapshots are visited. Here the predictive visited set is the union of positive-probability reachable role states for this initialization, not a claim that each individual two-cycle sample visits eight states. Therefore the original predictive operation also has FC on that support convention, independently of the diagnostic. The diagnostic establishes literal single-run eight-state visitation under the stricter interpretation as well. Its third role is actual phase, not incoming data. The diagnostic and task run belong to one complete initialization; no switch of architectures or task score occurs.

### 4. Carrier convention and finite PPI map

The nominated $d_0$ is the dimension of Theorem 15's typed role register. The map $(\phi,p,c)\to|\phi,p,c\rangle$ embeds its eight perfectly distinguishable responses into $H_{\mathrm{role}}=\mathbb{C}^8$. The registered transitions are the literal permutations/instruments just specified and all readouts are the same coordinates. This supplies the role-to-Hilbert overlap directly; it does not infer the Principle-5b intervention axiom from accuracy. Principle 5b is unnecessary because FC is proved by actual visitation.

The complete physical initialized microstate includes controller, resource, ROM, records and input sockets. Their cost is never discarded. The value $d_0=8$ refers to the typed role register; the complete apparatus has its larger counted carrier. Outputs and the fixed finite protocol apparatus have their separate classical context, exactly as in the source's role-register realization and accepted CSW fixed-controller carrier convention. If instead $d_0$ is required to be the dimension of the entire retained apparatus, this certificate does not claim $d_0=8$ and must not be accepted on that changed convention.

The retained finite protocol aspect consists of this fixed diagnostic-plus-two-cycle experiment, its finite stage prefixes and deterministic coarse-grainings. Its records are the three finite rotor labels, diagnostic role/readout sequence, the two forecast/outcome/phase/comparison/update sequences, closing-module labels, fixed clock slots and the complete stock/heat ledger. They are all finite. The verifier checks T, forecast commitments before F disclosure, the two XOR environment transitions, the coordinate boundary identities, S comparison, S-wired update, the source atom law and energy ownership. Precision is exact on the accepted ideal calibrated finite-label source convention.

The physical-to-record map takes each rotor interval and basis coupler/selector response to the displayed symbol. Conversely every table row is realized by those actual source intervals and same calibrated operations. Because the eight source atoms are all positive and operations deterministic conditional on them, this correspondence preserves every admitted prefix and coarse-graining. It reflects distinct retained record values. Continuous source refinements within the same intervals are quotiented only through these finite responses; stock/heat is still retained in its ledger. No arbitrary-state full-cone reconstruction claim is required for this finite aspect. Finite recording, verification, eight-second maintenance and the actual second-cycle update-use establish the P.6.2 finite physical dressing.

### 5. One fixed presentation and its complete complexity image

Fix the binary presentation $P_{H}$ with the ready blank assembly as reference initialization. Let $\gamma$ be Elias $\gamma$ coding of positive integers. Use the fixed finite-table transducer enumeration and output-cleanup convention of Definition 2.4.1g for the interpreter V below. For each e and fixed auxiliary input z, dovetail their computations on all binary words. Accept a newly halting word only when it is prefix-incomparable with every previously accepted word, using a fixed effective tie order; keep its output. This defines a partial computable prefix machine $V_{e}$. Every partial computable prefix machine occurs in this family: its prefix-free halting domain loses no word under the filter. Define

$$
V(\gamma(e+1)p,z)=V_e(p,z).
$$

The $\gamma$ prefixes and the domains of $V_{e}$ are prefix-free, so V is prefix-free. Each machine's fixed index gives simulation overhead |gamma(e+1)|; hence V is optimal. Set

$$
U_H(0w)=V(w,\varnothing),\qquad U_H(101)=s_H,
$$

with all other syntax undefined. The state word $s_H$ is the canonical ASCII encoding of the following finite initialized-state description $D_0$. The description records the apparatus, its ready resources, source law and task; its physical interpretation is fixed by parts 1–4.

For precision, encode an integer by its ordinary decimal expansion, a Boolean by the word `true` or `false`, and $\bot$ by `null`. Encode a displayed character string by that string between double quotation marks. Encode a finite ordered tuple by the encodings of its entries, separated by commas and enclosed in square brackets. Encode a finite record by its quoted field names in increasing ASCII order, each followed by a colon and its value, with commas between fields and braces around the record. Insert no spaces or terminal newline. All character strings below use the displayed ASCII characters and require no escapes. This gives a finite recursive definition of $s_H$.

The notation $(v)^{\times m}$ denotes the ordered tuple of exactly $m$ copies of $v$. Repeated module descriptions label separately supplied modules. The pairs in `basis_amplitudes` are the real and imaginary parts in the displayed basis order.

The fields of $D_{0}$ are:

| Field | Value |
|:--|:--|
| `admitted_protocols` | `fixed_schedule_and_its_prefixes_and_deterministic_coarse_grainings` |
| `closing_modules` | $(D_{1})^{\times 2}$ |
| `comparators` | $D_{2}$ |
| `controller` | $D_{3}$ |
| `energy` | $D_{4}$ |
| `external_source_sockets` | $D_{5}$ |
| `mode_schedule` | (`SPAP_diagnostic`, `predictive_task`) |
| `physical_inventory` | `one_initialized_assembly_only` |
| `records` | $D_{6}$ |
| `role_bank` | $D_{7}$ |
| `schema` | `HC8-complete-ready-state-v1` |
| `source_law` | $D_{8}$ |
| `task` | $D_{9}$ |
| `technology` | `HC8-singleton-sealed-factory` |

The fields of $D_{1}$ are:

| Field | Value |
|:--|:--|
| `internal_selector_rotor` | `supplied` |
| `ready` | $\mathsf{true}$ |
| `retained_label` | $\bot$ |
| `selector` | `eight_rank_one_columns_conditioned_on_S` |

The fields of $D_{2}$ are:

| Field | Value |
|:--|:--|
| `all_internal_selector_supplies` | `included_in_ready_board_package` |
| `diagnostic` | `phi_equals_p_at_phase1` |
| `feedback_wire` | `S_controls_next_model_p_xor_not_S` |
| `predictive` | `S=phi_equals_p` |
| `supplied_finite_comparator_modules` | $6$ |
| `supplied_finite_coordinate_readout_modules` | $32$ |

The fields of $D_{3}$ are:

| Field | Value |
|:--|:--|
| `diagnostic_slots` | $8$ |
| `duration_seconds` | $8$ |
| `expansion_ports` | $0$ |
| `initial_stage` | $0$ |
| `physical_command` | `101` |
| `predictive_slots` | $8$ |
| `rom` | `diagnostic_T_8_then_acquire_B0_then_two_cycles_P_XF_phase_compare_feedback_reset` |
| `slot_seconds` | `1/2` |
| `writable` | $\mathsf{false}$ |

The fields of $D_{4}$ are:

| Field | Value |
|:--|:--|
| `bias_battery_joules` | $128$ |
| `bias_resistors` | $16$ |
| `ohms_each` | $1$ |
| `ready_stock_joules` | $D_{10}$ |
| `reserve_joules` | $0$ |
| `signal_joules` | $1$ |
| `total_initial_joules` | $136$ |
| `volts_each` | $1$ |

The fields of $D_{5}$ are:

| Field | Value |
|:--|:--|
| `B0` | `fresh_fair_half_interval` |
| `F1` | `fresh_quarter_interval_not_read_until_forecast1` |
| `F2` | `fresh_quarter_interval_not_read_until_forecast2` |

The fields of $D_{6}$ are:

| Field | Value |
|:--|:--|
| `clock_ledger` | `fixed_16_half_second_slots` |
| `diagnostic_comparison_slots` | $(\bot)^{\times 4}$ |
| `diagnostic_role_slots` | $(\bot)^{\times 8}$ |
| `energy_ledger` | `finite_fixed_stock_heat_ledger` |
| `internal_readout_module_label_slots` | $(\bot)^{\times 38}$ |
| `predictive_history_slots` | $(\bot)^{\times 2}$ |
| `source_label_slots` | $(\bot)^{\times 3}$ |

The fields of $D_{7}$ are:

| Field | Value |
|:--|:--|
| `basis_amplitudes` | (($1$, $0$), $(0)^{\times 2}$, $(0)^{\times 2}$, $(0)^{\times 2}$, $(0)^{\times 2}$, $(0)^{\times 2}$, $(0)^{\times 2}$, $(0)^{\times 2}$) |
| `coordinate_order` | (`phi`, `p`, `c`) |
| `dimension` | $8$ |

The fields of $D_{8}$ are:

| Field | Value |
|:--|:--|
| `B0_1` | `1/2` |
| `F1_1` | `1/4` |
| `F2_1` | `1/4` |
| `independent` | $\mathsf{true}$ |

The fields of $D_{9}$ are:

| Field | Value |
|:--|:--|
| `baseline` | `1/2` |
| `cycles` | $2$ |
| `margin` | `1/8` |
| `score` | `mean_forecast_accuracy` |

The fields of $D_{10}$ are:

| Field | Value |
|:--|:--|
| `board` | $1$ |
| `closing_modules` | $2$ |
| `external_rotors` | $3$ |
| `record_package` | $1$ |

These fields specify the complete initialized assembly, with the operations, schedule, input law and resource account proved above. The $U_{H}$ branches are disjoint and prefix-free. The 0 branch supplies optimal universality with one-bit overhead over V. The closed physical factory supplies command 101 alone, independently of mathematical outputs of the universal branch.

The physical service accepts exactly the command 101. Accordingly $L_n=\{101\}$ for every natural $n$. This is a constant decidable hierarchy defined by the physical source interface, independently of accuracy or complexity. The mathematical universal branch exists, but there is no physical interpreter service in the sealed factory. The complete state code includes $H$'s wiring, ROM, phase initialization, $e_{000}$, blank finite records, numerical source-law parameters, supplied modules and numerical resource stocks from part 1. The only externally stochastic values occur after initialization under the fixed experiment law.

The full realizability domain is exactly $\{\mu_H\}$. Its unique admitted realizer is 101 at every level. All seven binary strings of length below three are rejected by the physical hierarchy, and all other words are rejected too. Thus $C_P(\mu_H)=3$, stagewise from $n=0$ onwards, with a literal finite shorter-word exclusion certificate and immediate all-level persistence. The full domain image is $\{3\}$; since part 3 proves full-loop qualification, $Q=\{\mu_H\}$ and its complete qualifying image is also $\{3\}$. This is an image calculation for the nominated entire physical hierarchy, not just an arbitrary bounded slice of a larger supplied technology.

On this same $Q$, the part 4 role-carrier dimension is $d_0(\mu_H)=8$. Consequently the entire Corollary-3 bridge is verified, $C_P(\mu_H)=3=\log_2(8)$. O1–O3 and FC were established for that same initialized assembly and task, and also for its diagnostic SPAP sub-dynamics. Every qualifying state satisfies the bridge because the full qualifying set was exhausted, not because capacity was asserted to equal code length in general. Proposition 5.2.3a then gives $C_{\mathrm{op}}=\min C_P(Q)=3=K_0$, attained by $\mu_{H}$. The minimum is relative to the displayed closed physical hierarchy and role-carrier convention.

<a id="theorem-523f"></a>

<a id="theorem-523f-registered-hc8-hierarchy-and-attained-operational-threshold"></a>**Theorem 5.2.3f (Registered HC8 Hierarchy and Attained Operational Threshold).** On the ideal sealed-factory branch of Construction 5.2.3d, use its declared binary presentation $\mathfrak P_H$ for the HC8 task. Its physical hierarchy registration, baseline-identity extension and realizer certificate of Definition 2.4.1d are given below. With the typed role carrier, the complete qualifying complexity image is $\{3\}$ and the same-task realizer attains
$$
C_{P,n}^{H}(s_H)=C_P^H(s_H)=C_{op}^H=K_0=3,\qquad
d_0(s_H)=8,\qquad N_{\rm val}=N_{\rm arg}=0 .
\tag{17k}
$$

*Proof.* The declared source is the HC8 assembly in Construction 5.2.3d, including its ideal primitive interpretation and all supplied ready modules, schedules and costs. The source inventory has the following list of physical constraint owners. Each row defines one named premise, with dependencies on the earlier rows named in its last column. The rows partition the construction by ownership of physical requirements.

| Owner | Source and physical requirement | Earlier dependencies |
|:--|:--|:--|
| H1 | Part 1 supplies the sealed initialized assembly, ready-code fields and complete stocks. The only physical command is the immutable controller's `101`. | None |
| H2 | Part 2 supplies the fixed diagnostic clock, conditional permutations and nondestructive coordinate and comparator readouts with their retained records. | H1 |
| H3 | Part 3 supplies the independent external interval selectors and the literal prediction, acquisition, verification, feedback and closing maps. It retains the reset labels and the order of all task ports. | H1 |
| H4 | Part 4 supplies the role encoding, the retained record dictionary and the fixed schedule with its prefixes and deterministic coarse-grainings. | H1–H3 |
| H5 | Part 5 supplies the sealed command interface throughout the hierarchy and interprets its initialized bytes by parts 1–4. | H1–H4 |

The eligible declarations are the supplied source, interface, schedule, stock and response constraints in parts 1–5. The mathematical syntax, coding and universal-tail convention in part 5 fix presentation fields. The role capacity, task score, qualification and minimum are derived consequences. Every physical declaration belongs to its indicated part. The admissible prefixes and coarse-grainings are those of H4 on the full finite history set.

The registered presentation is the binary alphabet, whole-string evaluator $U_H$, canonical byte-code convention, blank ready reference, binary length and all-stage command grammar of part 5. For each $n\in\mathbb N$ and finite binary string $P$, its membership generator emits $P=\texttt{101}$ by the H1/H5 interface rule. All instantiated eligible requirements are carried by the supplied assembly returned by that command. Its initialized fields are exactly $D_0$, its operations are precisely the H2–H4 maps, and every represented prefix and coarse-graining is obtained from those maps. A distinct command has no supplied physical service. This gives both directions of coverage. The generator is total, the levels coincide, and the owner graph has ranks zero for H1, one for H2 and H3, two for H4 and three for H5. The membership and constructor rules have rank four. The physical and mathematical parts of the evaluator have disjoint prefix namespaces. The interpreter on its universal namespace is the one fixed in part 5.

The finite certificate uses equality of finite strings and records, natural-number arithmetic and propositional inference. Its checker accepts these derived rules: verify a literal command or descriptor equality by exact evaluation, unfold the registered H1/H5 command grammar at any stage, unfold the registered finite constructor at its literal command, and generalize a stage-independent equality. The physical command and descriptor assertions are the listed source premises. The checker rejects an unknown rule, an ill-typed field, a nonmatching premise or a forward proof reference. The rule checks terminate by finite string and record evaluation and a scan of the finite proof. Soundness follows by substitution in the declared grammar and its finite constructor. The exclusions use literal inequality with the physical command.

Take the HC8 source of parts 1–5 as the baseline owning this instance of Section 2.4.1. Its fields and the registered fields are literally the same alphabet, evaluator, canonical code, reference and length. At each stage both languages are defined by the same sealed-command test. Reflexivity of these field identities and unfolding that test give the baseline-identity proof, with the H1–H5 inventory and rule dependencies as its replay manifest. The inventory and proof records use the canonical finite encoding and the artifact binding of Definition 2.4.1d. The value certificate has output $s_H$, program $\texttt{101}$, the constructor evaluation, the stage-zero membership proof and the stage-independent persistence proof. Its shorter-program table is
$$
\begin{array}{c|rrrrrrr}
Q&\epsilon&0&1&00&01&10&11\\\hline
e_Q&0&0&0&0&0&0&0 .
\end{array}
\tag{17l}
$$
At length three the same test rejects the seven other strings and accepts exactly $\texttt{101}$, giving the exact-minimizer certificate. The fixed grammar and constructor rules apply uniformly to any submitted code.

Construction 5.2.3d gives the actual full-loop history map, accuracy $3/4>5/8$, and the eight distinct role contexts on that same initialized source. Its three external rotor bits enumerate eight positive-probability source atoms and the normalized acquisition and closing maps preserve the declared readouts. Thus $s_H$ qualifies and the full qualifying image is the singleton in (17k). The bridge $C_P^H(s_H)=\log_2d_0(s_H)$ holds on this whole qualifying class. The threshold follows from Definition 13. The word length comes from the installed HC8 command coding and the initialized assembly comes from its constructor. The result is a threshold in that presentation, with all ancillary physical resources counted by Construction 5.2.3d. ∎

The [HC8 hierarchy record](related/calculation_companions/section_05/hc8-hierarchy-certificate.md) gives the literal inventory, binding and complete census.

**Table 5.1 — Complexity Thresholds and an Example Instantiation**

|  Symbol  | Name                  | Logical Purpose                                                                                               | Complexity (Bits) | Example: 3‑Qubit MPU (Sec. 7.1.3)            |
| :------: | :-------------------- | :------------------------------------------------------------------------------------------------------------ | :---------------- | :------------------------------------------- |
|   $K_0$  | Horizon Constant      | Least visited-context capacity in the SPAP realization class satisfying (O1)–(O3) and (FC); the same register size admits a basic super-chance mode on $\mathcal{E}_{\mathrm{basic}}(\gamma)$ | Exactly 3 within that class | $d_0=8$ Hilbert carrier, SPAP two-phase map |
| $C_{op}$ | Operational Threshold | Infimum of $C_P$ for the declared task and margin $\epsilon_{acc}>0$                                          | $\ge K_0=3$ only under Corollary 3's bridge hypotheses | Equality requires a qualifying member with $C_P=3$ (Proposition 5.2.3a) |
