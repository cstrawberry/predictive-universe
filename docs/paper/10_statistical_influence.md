# 10 Causality, Locality, and Statistical Influence

The introduction of the Consciousness Complexity (CC) hypothesis (Section 9), particularly its proposed mechanism involving influence on quantum probabilities (Hypothesis 3) potentially mediated by non-local entanglement (Proposition 10), necessitates a careful examination of its compatibility with fundamental principles of causality and locality. This section defines the framework's operational stance on causality, derives a strict upper bound on CC necessary to preserve this causality, introduces the resulting hypothesis regarding permissible statistical faster-than-light (FTL) influence, and analyzes the consistency of this potentially non-standard picture, grounding the analysis within the emergent Algebraic Quantum Field Theory (AQFT) structure detailed in Appendix F.

**10.1 Framework's Definition of Causality**

The PU framework adopts a specific operational definition of causality, focused on preventing paradoxes constructible via controllable signaling.

**10.1.1 Postulate 2 (Post 2): Causality as No Deterministic FTL Signaling**

Within the Predictive Universe framework, causality is defined operationally: it is preserved if and only if it is impossible to construct paradox-inducing causal loops (e.g., grandfather paradox, tachyonic anti-telephone). It is postulated that the construction of such paradoxes requires the ability to send controllable, deterministic information faster than the invariant speed $c$ (derived in Theorem 46). Therefore, this operational definition of causality mandates the strict impossibility of deterministic faster-than-light (FTL) signaling by any mechanism within the framework, including any potential effects of Consciousness Complexity (CC).

**10.2 Derivation of the Consciousness Complexity Causality Constraint**

To ensure compliance with Postulate 2, the maximum possible strength of the CC effect must be constrained.

**10.2.1 Theorem 39 (Upper Bound on CC ($\alpha_{CC,max} < 0.5$))**

Upholding the causality definition in Postulate 2 is guaranteed if the maximum operational Consciousness Complexity $\alpha_{CC,max} = \sup_{S} \mathrm{CC}(S)$ (**Definition 30**) is strictly bounded to preclude deterministic FTL signaling. A sufficient universal bound on the operational norm is:
$$
\alpha_{CC,max} < 0.5 \quad \text{(61)}
$$
*Proof:* Deterministic FTL signaling with a fixed local measurement at $S_B$ would require $S_A$ (Alice) to encode at least two distinguishable messages by choosing between two contexts that yield two *deterministic* and *distinct* outcome distributions at $S_B$ (Bob). For any POVM, coarse-grain to a binary partition $\{E_i,\ I-E_i\}$; let the baseline Born probability for outcome $i$ be $p_i=P_{Born}(i)\in(0,1)$.
1.  **Deterministic endpoints:** Encoding two deterministic messages with this binary partition requires the existence of contexts achieving both $P_{obs}(i)=1$ and $P_{obs}(i)=0$ (equivalently, certainty of $E_i$ and certainty of $I-E_i$).
2.  **Required CC to reach both endpoints:** Achieving $P_{obs}(i)=1$ requires $\Delta P(i)=1-p_i$, and achieving $P_{obs}(i)=0$ requires $\Delta P(i)=-p_i$.
3.  **Operational bound:** By Definition 30, for any context and any effect, $|\Delta P(i)|\le \alpha_{CC,max}$. Therefore, the existence of contexts that achieve *both* endpoints implies
    $$
    \alpha_{CC,max}\ge \max\{p_i,\,1-p_i\}.
    $$
4.  **Universal sufficient ceiling:** For any $p_i\in(0,1)$, $\max\{p_i,1-p_i\}\ge 0.5$, with equality at $p_i=0.5$. Hence if $\alpha_{CC,max}<0.5$, no binary coarse-graining can be driven to both deterministic endpoints by context choice, so no deterministic message alphabet can be realized at spacelike separation.
5.  Therefore $\alpha_{CC,max}<0.5$ suffices to preclude deterministic FTL signaling and the construction of deterministic causal paradoxes. Hence:
$$
\alpha_{CC,max}<0.5.
$$

Under the information-rate bound for the balanced baseline $p=1/2$, $I(C;Y) \le 4 \ln 2 \cdot (\kappa \mathrm{CC})^2$ nats/trial (Theorem 41), so any AQFT-violating channel would require $\mathrm{CC}\sim O(1)$, excluded by Theorem 39 and gravitational backreaction (Appendix S).

**10.3 The Statistical FTL Influence Hypothesis**

While deterministic FTL signaling is ruled out by Theorem 39, the proposed CC mechanism (Hypothesis 3), acting on entangled states (Proposition 10), naturally leads to the possibility of statistical correlations across space-like separations that depend on the CC context.

**10.3.1 Postulate 3 (Post 3): Permissibility of Statistical FTL Influence (Three-Branch Statement)**

As a consequence of Hypothesis 3 (CC influence mechanism) combined with quantum entanglement (Proposition 10) within the MPU network (Hypothesis 1), the Predictive Universe framework allows three operationally distinct branches of statistical influence, individuated by *which causal-temporal placement of Alice's context choice* is required to reproduce the predicted statistics.

**(i) Local CPTP branch.** If the CC mechanism is implemented by local CPTP channels on Alice's side, then Bob's local marginal $P(b)$ is preserved exactly for all fixed Bob settings, by the standard no-signaling theorem. On this branch, a change in Alice's context $\mathrm{context}_S$ can statistically alter Alice-side local statistics, the joint distribution $P(a,b)$, and conditional distributions $P(b|a)$ that are only accessible after classical comparison of records, but it cannot alter Bob's unconditional marginal. Branch (i) is the *Bob-marginal-preserving deformation* branch in the sense of Lemma 10.2 below.

**(ii) Preparation-context branch.** If Alice's context $C$ is fixed before, or in the shared causal past of, the spacelike-separated measurement events at $A$ and $B$, then the global state $\omega_C$ delivered to the two stations may itself depend on $C$, and Bob's marginal $P(b\mid C)$ may depend on $C$ through ordinary common-cause statistics with no spacelike action by Alice after separation. Branch (ii) is consistent with operator-level Einstein causality (Corollary F.1) and is excluded as an explanation of any putative branch-(iii) signal only when Alice's context is randomized strictly later than the latest event in the shared causal past of the two measurement regions. Theorem L.12.8 supplies the necessary shared-past requirement for any nontrivial entanglement bias.

**(iii) Nonlocal/state-mediated marginal-anomaly branch (statistical FTL influence).** Beyond branches (i) and (ii), the framework allows — as a distinct, stronger hypothesis — that a change in Alice's context $\mathrm{context}_S$, performed strictly after the spacelike-separated preparation event, can induce context-dependent shifts in Bob's local marginal $P(b)$ across a spacelike interval, mediated by the globally prepared entangled state rather than by any operator-level carrier and not reducible to the shared-past mechanism of branch (ii). This is a genuine statistical faster-than-light (FTL) influence on Bob's local statistics: it is not derivable from ordinary nonlocal correlations of standard quantum mechanics, it is a real departure from the no-signaling marginals of local CPTP, and it is a falsifiable prediction requiring a separate nonlocal/state-mediated operational model.

In all three branches, the influence is asserted to be incapable of enabling deterministic FTL signaling (thus preserving causality as defined in Postulate 2) provided the constraint $\alpha_{CC,max}<0.5$ (Theorem 39) holds. The discrimination between branches is operational: branch (i) is tested through Alice-local and post-comparison joint-correlation analysis with Bob's marginal invariant; branch (ii) is excluded as an explanation of a Bob-marginal shift only by late randomization of Alice's context strictly after the spacelike-separated preparation event; branch (iii) is the unique branch on which a Bob-marginal shift of $P(b)$ persists under late randomization. The existence and nature of branch (iii) is presented as a key, falsifiable prediction of the framework, requiring stringent empirical verification (Section 13.5).

**Lemma 10.2 (Bob-Marginal Kernel Decomposition of CC Deformations).** Let $P_0(a,b\mid x,y)$ be the baseline joint probability for spacelike-separated POVM settings $x$ at Alice and $y$ at Bob, and let
$$
P_C(a,b\mid x,y)=P_0(a,b\mid x,y)+\epsilon\,\ell_C(a,b\mid x,y)
$$
be a CC-deformed joint probability associated with Alice's context $C$, with $\epsilon\le\mathrm{CC}(S_A)$ the operational scale (Definition 30) and $\epsilon$ small enough that $P_C(a,b\mid x,y)\in[0,1]$ for every $(a,b,x,y)$. The deformation is normalization-preserving,
$$
\sum_{a,b}\ell_C(a,b\mid x,y)=0
$$
for every $(x,y)$. Define the Bob-marginal component
$$
(\Pi_B\ell_C)(a,b\mid x,y)
:=
\frac1{|\mathcal A|}\sum_{a'}\ell_C(a',b\mid x,y),
$$
and the Bob-marginal-preserving component
$$
\ell_C^{B0}:=(I-\Pi_B)\ell_C.
$$
Then
$$
\ell_C=\ell_C^{B0}+\Pi_B\ell_C,
\qquad
\sum_a\ell_C^{B0}(a,b\mid x,y)=0
$$
for every $(b,x,y)$, and $\Pi_B\ell_C$ carries exactly the context-dependent Bob-marginal shift:
$$
\sum_a(\Pi_B\ell_C)(a,b\mid x,y)
=
\sum_a\ell_C(a,b\mid x,y).
$$
Both components preserve total normalization. Branch (i) of Postulate 3 requires
$$
\Pi_B\ell_C=0
$$
for every late-randomized Alice context, while branch (iii) requires that there exist $C,y,b$ for which
$$
\sum_a\ell_C(a,b\mid x,y)\ne0
$$
under late randomization of $C$. If one also wants to isolate the pure joint-correlation component with both local marginals removed, apply the usual double-centering projector
$$
\Pi_{\mathrm{joint}}\ell
=
\ell-\overline\ell_A-\overline\ell_B+\overline\ell,
$$
where $\overline\ell_A$ and $\overline\ell_B$ are the Alice- and Bob-marginal mean components. This stronger joint-only subspace is useful for diagnostics, but Bob-marginal preservation is the exact no-FTL condition relevant to Alice-to-Bob signaling.

*Proof.* For fixed $(x,y)$, $\Pi_B$ is the orthogonal projection onto the subspace of arrays that are constant in the Alice outcome $a$ for each Bob outcome $b$. Its complement $I-\Pi_B$ has zero Bob-column sums:
$$
\sum_a\ell_C^{B0}(a,b\mid x,y)
=
\sum_a\ell_C(a,b\mid x,y)
-
\sum_a\frac1{|\mathcal A|}\sum_{a'}\ell_C(a',b\mid x,y)
=
0.
$$
The Bob marginal of the full deformation is
$$
\sum_a\ell_C(a,b\mid x,y),
$$
and the displayed identity shows that this entire marginal shift lies in $\Pi_B\ell_C$. Since $\sum_{a,b}\ell_C=0$, summing the Bob-marginal component over $(a,b)$ also gives zero, and therefore both $\Pi_B\ell_C$ and $\ell_C^{B0}$ preserve total normalization. A local CPTP operation on Alice's side cannot change Bob's reduced state, so it lies in the $\Pi_B\ell_C=0$ branch. Conversely, a nonzero Bob-marginal component under late randomization is exactly a branch-(iii) marginal anomaly. ∎

**Lemma 10.3 (Pre-Lightcone Information Budget and Sampling Gate).** Let $L$ be the spacelike separation between Alice and Bob, $r_{\max}$ the maximum local measurement rate per channel at Bob's station, $\alpha_{\mathrm{err}}\in(0,1/2)$ a target decoding error probability, and $\delta\le\kappa\,\mathrm{CC}(S_A)$ the per-trial Bob-marginal bias on branch (iii). Define the pre-lightcone mutual-information budget
$$
\mathcal C_{\mathrm{pre}}(L)
:=
r_{\max}\frac{L}{c}\,I(C;Y_B),
$$
where $I(C;Y_B)$ is the per-trial mutual information from Alice's binary context to Bob's outcome. In the small-bias regime, Theorem 41 gives
$$
\mathcal C_{\mathrm{pre}}(L)
\le
r_{\max}\frac{L}{c}\cdot \frac{\mathrm{CC}(S_A)^2}{8m_0}
+
O\!\left(r_{\max}\frac{L}{c}\,\mathrm{CC}(S_A)^3\right).
$$
A one-bit pre-lightcone decoder with error probability at most $\alpha_{\mathrm{err}}$ must at least satisfy the Fano necessary condition
$$
\mathcal C_{\mathrm{pre}}(L)
\ge
\ln2-h_2(\alpha_{\mathrm{err}}),
$$
where $h_2$ is binary entropy in nats. Independently, resolving the marginal shift by repeated trials obeys the sampling gate of Lemma 10.1:
$$
r_{\max}\frac{L}{c}
\gtrsim
\frac{\ln(1/\alpha_{\mathrm{err}})}{2\delta^2}.
$$
Thus deterministic or arbitrarily reliable pre-lightcone communication is excluded whenever the finite pre-lightcone budget lies below these necessary gates, in addition to the deterministic forcing bound
$$
|\Delta P(i)|\le \mathrm{CC}(S_A)<\frac12
$$
of Theorem 39.

*Proof.* Multiplying the per-trial bound of Theorem 41 by the maximum number of Bob trials before a light signal can cross the separation,
$$
N_{\mathrm{pre}}=r_{\max}L/c,
$$
gives the mutual-information budget. Fano's inequality for an equiprobable binary context gives
$$
P_e\ge 1-\frac{I(C;Y_B^{N_{\mathrm{pre}}})}{\ln2},
$$
equivalently a necessary condition
$$
I(C;Y_B^{N_{\mathrm{pre}}})\ge \ln2-h_2(\alpha_{\mathrm{err}})
$$
for error at most $\alpha_{\mathrm{err}}$. Since independent or conditionally independent trials have total mutual information bounded by the sum of per-trial informations, this gives the displayed necessary budget condition. The sharper high-confidence resolution of a small Bernoulli marginal shift is the Hoeffding/Chernoff sampling requirement already recorded in Lemma 10.1, with $\delta\le\kappa\,\mathrm{CC}(S_A)$. The deterministic-forcing bound is Theorem 39. ∎

**10.3.2 Quantum Communication Protocol (QCP)**

It is crucial to distinguish this protocol from “communication” in the operational sense used in physics. The name “Quantum Communication Protocol” is chosen to reflect the broader, semantic sense in which a meaningful statistical correlation is established to grant a decision advantage. However, operational “communication” implies the ability to transmit chosen, deterministic information. The analysis below shows that the protocol's influence is necessarily stochastic and information-rate limited (Theorems 40–42), so it can at best induce a strictly noisy statistical channel and cannot be amplified into controllable, error-free signaling, thereby preserving causality (Postulate 2). The protocol formalizes a method for leveraging statistical influence for a pre-agreed task, not for arbitrary FTL signaling.

**Definition (QCP).** Alice and Bob share many copies of a fixed entangled state. They agree on a binary mapping between **Alice’s context** $C\in\{\mathrm A,\mathrm B\}$ and a **target local measurement bias** for Bob's outcomes (Appendix L): if $C=\mathrm A$, Alice adopts an internal state $\mathrm{context}_S$ and applies the associated physical control $\mathcal M(\mathrm{context}_S)$ intended to bias Bob's local outcome toward "spin up"; if $C=\mathrm B$, she adopts the corresponding context and control intended to bias toward “spin down.” Bob measures each partner in the pre-agreed basis and uses the single-shot rule: choose Strategy A if he observes “spin up,” Strategy B if “spin down.”

**Statistical neutrality of the raw stream.** With equiprobable contexts $P(C=\mathrm A)=P(C=\mathrm B)=\tfrac12$ and the symmetric targeting convention $P(\uparrow\!\mid \mathrm A)=p+\delta$, $P(\uparrow\!\mid \mathrm B)=p-\delta$, Bob's unconditional marginal equals the baseline $p$ (e.g., $p=\tfrac12$ for a singlet in the matched basis). In this balanced design, the raw bit stream is indistinguishable from baseline even though each conditioned sub-ensemble is biased. If contexts are imbalanced, the induced marginal shift is $\Delta p = (P(C=\mathrm A)-P(C=\mathrm B))\delta = O(\mathrm{CC})$, yielding a strictly noisy statistical channel whose per-trial mutual information is bounded by Theorem 41.

**Single-shot decision advantage.** Write
$$
P(\uparrow\mid C=\mathrm A)=\tfrac12+\delta,\quad
P(\uparrow\mid C=\mathrm B)=\tfrac12-\delta,\quad
0<\delta\le \kappa\,\mathrm{CC},\ \kappa\in(0,1],
$$
where $\kappa$ quantifies context-to-control and basis alignment efficiency (Appendix L), and $\delta\le \mathrm{CC}$ follows from the magnitude bound on $f$ (Theorem 36; cf. Def. 30). With equiprobable contexts,
$$
P_{\text{succ}}
= \tfrac12\,P(\uparrow\!\mid \mathrm A)+\tfrac12\,P(\downarrow\!\mid \mathrm B)
= \tfrac12+\delta,
$$
so the single-shot advantage over random is exactly $\delta=O(\mathrm{CC})$.


**Lemma 10.1 (Pre-lightcone decoding condition).**
If a QCP is used to attempt decoding strictly before a light signal could arrive, let the spatial separation be $L$. The maximum number of trials before the lightcone is
$$
N_{\text{pre}} \le r_{\max}\frac{L}{c},
$$
where $r_{\max}$ is the maximum local measurement rate per channel. For a binary decision with bias parameter $\delta$ and target error probability $\alpha_{\text{err}}$, any decoding strategy that attains error $\le\alpha_{\text{err}}$ requires at least
$$
N_{\text{decode}} \ge \frac{\ln(1/\alpha_{\text{err}})}{2\delta^2}
$$
trials (Chernoff/Hoeffding). Therefore, achieving decoding strictly before the lightcone with error $\le\alpha_{\text{err}}$ requires
$$
r_{\max} \frac{L}{c} \ge \frac{\ln(1/\alpha_{\text{err}})}{2\delta^2}.
$$
If this inequality fails, pre-lightcone decoding with error $\le\alpha_{\text{err}}$ is impossible. QED

**AQFT compliance.** Conditional on the continuum-bridge hypotheses of Appendix F, operator locality is encoded by Corollary F.1; the context-conditioned dependence then arises via the globally prepared state $\omega_{C}$, including Alice’s CC-modulated control $\mathcal M(\text{context}_S)$, as in Equation (F.4). Under the information‑rate bound for the balanced baseline $p=\tfrac12$, $I(C;Y) \le 4\ln 2 \cdot (\kappa \cdot \mathrm{CC})^2$ nats/trial (Theorem 41), this statistical influence cannot be shaped into deterministic, pre-lightcone signals; operational causality remains intact (Theorem 42). The full consistency analysis is provided in **Appendix F**.

**No‑signaling equalities.** The standard no-signaling equalities hold with respect to local measurement *settings*. That is, for all choices of local measurement operators corresponding to settings $x,x’$ and $y,y’$ and all outcomes $a,b$,
$$
\sum_{a} P(a,b\,|\,x,y)=P(b\,|\,y),\qquad \sum_{b} P(a,b\,|\,x,y)=P(a\,|\,x).
$$
*Proof.* When the Appendix F continuum AQFT limit applies so that $O_A\subset O_B’$ implies $[\mathcal A(O_A),\mathcal A(O_B)]=\{0\}$, any local operation at $A$ is represented by an instrument that commutes with all effects at $B$, and vice versa. Marginals at one site are therefore invariant under changes of the other site’s setting; the displayed equalities follow by summing joint probabilities over the commuting outcome algebra.

**Physical self-limitation.** The context needed to achieve a bias $\delta$ carries a resource cost that contributes to the MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}$ (Appendix B) and induces gravitational self-dephasing (Appendix S). The power cost of maintaining the context scales as (Appendix S, Equation S.5):
$$
P_{\text{context}}(\mathrm{CC}) = A\!\left[\frac{\mathrm{CC}}{\alpha_{CC,max}-\mathrm{CC}}\right]^2,\qquad
\alpha_{CC,max}<\tfrac12,
$$
the resulting gravitational backreaction induces a time-dilation $\Delta\tau_d$ across the system (Appendix S, Equation S.18):
$$
\Delta\tau_d = K\,P_{\text{context}},
$$
with geometry constant $K$ defined in Appendix S (Equation S.19). This reduces the achieved $\text{CC}_{eff}$ (Equation S.21). A fully tracked gravitational phase remains coherent, while unresolved chronometric phase on the saturated ND-RID branch gives the residual dephasing rate $\Gamma_{\mathrm{ch}}^{(ij)}=(|\Delta E_{ij}|/\hbar)K_{\mathrm{eff}}P_{\mathrm{context}}$ (Equation S.57), further limiting any practical advantage on that branch.

**10.4 Consistency Analysis: Statistical Influence vs. Causality**

The framework must rigorously demonstrate that the allowed statistical FTL influence (Postulate 3) does not violate the core causality principle (Postulate 2). This analysis relies on the limits imposed by the CC bound and the nature of the information transfer.

**10.4.1 Theorem 40 (Statistical Detection Limit)**

Detecting the hypothesized statistical FTL influence (Postulate 3) requires analyzing preregistered outcome statistics conditioned on Alice's context $C_A$. If the tested implementation is local CPTP (branch (i) of Postulate 3), Bob's marginal must remain unchanged and only joint/conditional correlations after classical comparison can vary; the detection protocol below targets the nonlocal/state-mediated FTL branch (branch (ii) of Postulate 3), on which a marginal shift is predicted. Let $p_0(b)$ and $p_1(b)$ denote Bob's marginal probability for some fixed event $b$ under two context conditions of Alice, and define the context-induced effect size $\Delta:=|p_1(b)-p_0(b)|$ (for the symmetric QCP, $\Delta=2|\delta|$). Under the CC-bounded influence mechanism, $\Delta$ is bounded by the operational CC scale (Definition 30; Theorem 36) and therefore remains small when $\alpha_{CC,max}<0.5$. For the direct two-context comparison test with $n$ iid trials collected under each context and decision rule $|\hat p_1-\hat p_0|>\Delta/2$, total sample size $N=2n$ satisfying
$$
N \ge \frac{16}{\Delta^2}\ln\!\left(\frac{4}{\alpha_{\mathrm{det}}}\right)\quad \text{(62)}
$$
guarantees total decision error at most $\alpha_{\mathrm{det}}$. In particular, detection requires
$$
N=\Theta\!\left(\frac{\log(1/\alpha_{\mathrm{det}})}{\Delta^2}\right).
$$

*Proof:* Under the null hypothesis $H_0:p_1(b)=p_0(b)=p$, a false positive for the threshold test implies
$$
|\hat p_1-\hat p_0|>\frac{\Delta}{2}.
$$
If both $|\hat p_1-p|<\Delta/4$ and $|\hat p_0-p|<\Delta/4$, then by the triangle inequality
$$
|\hat p_1-\hat p_0|\le |\hat p_1-p|+|\hat p_0-p|<\frac{\Delta}{2},
$$
so a false positive can occur only if at least one sample mean deviates from its expectation by at least $\Delta/4$. Hoeffding's inequality therefore gives
$$
\mathbb{P}_{H_0}(\text{false positive})
\le 2e^{-2n(\Delta/4)^2}+2e^{-2n(\Delta/4)^2}
=4e^{-n\Delta^2/8}.
$$

Under the alternative hypothesis $H_1:|p_1(b)-p_0(b)|=\Delta$, assume without loss of generality that $p_1(b)-p_0(b)=\Delta$. A missed detection for the same threshold test implies
$$
|\hat p_1-\hat p_0|\le \frac{\Delta}{2}.
$$
If both $|\hat p_1-p_1|<\Delta/4$ and $|\hat p_0-p_0|<\Delta/4$, then
$$
\hat p_1-\hat p_0>(p_1-\Delta/4)-(p_0+\Delta/4)=\Delta-\frac{\Delta}{2}=\frac{\Delta}{2},
$$
so a missed detection can occur only if at least one sample mean deviates from its expectation by at least $\Delta/4$. Again Hoeffding gives
$$
\mathbb{P}_{H_1}(\text{missed detection})\le 4e^{-n\Delta^2/8}.
$$

Hence the total decision error is bounded by $4e^{-n\Delta^2/8}$. Requiring this to be at most $\alpha_{\mathrm{det}}$ yields
$$
n\ge \frac{8}{\Delta^2}\ln\!\left(\frac{4}{\alpha_{\mathrm{det}}}\right),
$$
equivalently
$$
N=2n\ge \frac{16}{\Delta^2}\ln\!\left(\frac{4}{\alpha_{\mathrm{det}}}\right).
$$
The final $\Theta(\log(1/\alpha_{\mathrm{det}})/\Delta^2)$ scaling follows immediately. ∎

**10.4.2 Theorem 41 (No-Paradox Information Rate with Constant)**

The maximum classical information (Mutual Information $I(A;B)$) transmittable from Alice's choice of context ($A$) to Bob's observed outcome ($B$) per trial is quadratically suppressed by the CC value. Let $p=P_{B|A=0}$ and $q=P_{B|A=1}$ be the outcome distributions, $M=\frac{1}{2}(p+q)$ be the mixture, and $m_0 = \min_i M_i > 0$ be the minimum mixture probability (a necessary condition for a regular operating point). The mutual information is bounded by:
$$
I(A;B) \le \frac{\mathrm{CC}(S)^2}{8\,m_0} + O(\mathrm{CC}(S)^3) \quad \text{(nats/trial)} \quad \text{(63)}
$$
*Proof:* For a binary context with equal priors, the mutual information is the Jensen-Shannon Divergence, $I(A;B) = \mathrm{JSD}(p,q)$. For small deviations, JSD admits the expansion $\mathrm{JSD}(p,q) = \frac{1}{8}\sum_i \frac{(q_i-p_i)^2}{M_i} + O(\|q-p\|_1^3)$. Since $M_i \ge m_0 > 0$, this is bounded by $\frac{1}{8m_0} \sum_i (q_i-p_i)^2 = \frac{1}{8m_0}\|q-p\|_2^2 \le \frac{1}{8m_0}\|q-p\|_1^2$. From Theorem 36, the Total Variation distance is bounded by $\|q-p\|_1 = 2\,\mathrm{TV}(p,q) \le 2\sin\!\big(\mathrm{CC}(S)/2\big)$. For small $\mathrm{CC}(S)$, $2\sin(\mathrm{CC}(S)/2)\approx \mathrm{CC}(S)$, so $\|q-p\|_1 \le \mathrm{CC}(S)$. Combining these yields the result. This rigorous bound, with an explicit constant $K=1/(8m_0)$, proves that the information rate is too low for deterministic signaling, ensuring consistency with operational causality (Postulate 2).

**10.4.3 Theorem 42 (Inability to Construct Causal Loops)**

The hypothesized statistical FTL influence (Postulate 3), when constrained by the causality bound of Theorem 39 and the emergent AQFT locality conditions of Appendix F, cannot be used to construct paradox-inducing causal loops as defined by Postulate 2. This holds for any decoder $\mathcal{D}$ from a physically plausible computational class (e.g., BPP or BQP), as any such decoder is subject to the sample-complexity lower bound of Theorem 40.

*Proof:*
1.  **Requirement for Paradox (Postulate 2):** The construction of a causal paradox requires deterministic faster-than-light signaling.
2.  **Nature of Statistical Influence:** On the nonlocal/state-mediated FTL branch, CC influence modifies Bob's outcome probabilities $P(b|C_A)$; on the local CPTP branch, Bob's marginal is unchanged and only joint/conditional correlations after classical comparison can vary. In either branch, with $\text{CC}<0.5$ any probabilities remain strictly between 0 and 1 for outcomes with non-zero Born probability, and Bob observes random outcomes rather than deterministic messages.
3.  **Inference is Probabilistic:** Bob can only infer Alice's context $C_A$ probabilistically by observing a sequence of $N$ outcomes. Any inference based on a finite sequence has a non-zero error probability, $P_{err}(N) > 0$. Deterministic certainty ($P_{err}=0$) is unattainable for any finite $N$.
4.  **Failure to Close Loop Deterministically:** To construct a paradox, Alice would send her choice of context $C_A$ via the FTL channel. Bob would infer her choice, yielding an estimate $C'_A$ (where $P(C'_A \neq C_A) > 0$), and send this estimate back to Alice via a slower-than-light (STL) channel, arriving before she finalizes her original choice. For a paradox to occur, Alice must receive deterministic information about the consequence of her impending choice. However, she only receives the probabilistic estimate $C'_A$. If she receives $C'_A=1$ but proceeds to choose $C_A=0$, no logical contradiction arises because Bob's inference could have been incorrect due to the statistical fluctuations inherent in the non-deterministic FTL channel.
5.  **Conclusion:** The statistical FTL channel, constrained by $\text{CC} < 0.5$, fundamentally cannot achieve the deterministic signaling required by Postulate 2 to construct causal loops. The physical infeasibility of achieving the necessary number of trials for reliable decoding before a light signal could arrive is formalized in Lemma 10.1. QED

**10.5 Relation to Emergent Locality and AQFT Framework**

The consistency of the framework's stance—allowing potential statistical FTL influence (Postulate 3) while preserving operational causality (Postulate 2)—is analyzed within the Algebraic Quantum Field Theory (AQFT) description of the emergent continuum limit formulated in Appendix F.

*   **Emergent Operator Locality (Microcausality):** Appendix F formulates operator-level Einstein causality through Corollary F.1, conditional on the continuum-bridge hypotheses of Theorem F.0.

*   **State‑Mediated Statistical Influence:** Within the structure of commuting local observables when that AQFT limit applies, the potential statistical FTL influence (Postulate 3) is interpreted as arising *solely* from the properties of the globally prepared physical state $\omega_{C_A}$, which is influenced by Alice's local CC context $C_A$ (via the mapping $\mathcal{M}$ and ND-RID dynamics). The non-local dependence appears in joint expectations such as $\omega_{C_A}(A\otimes B)$ (Equation F.4). Bob's unconditional local statistics are the marginals $\omega_{C_A}(\mathbf{1}_A\otimes B)$, which must remain independent of $C_A$ if operational causality is to hold. The non-local dependence is therefore carried by joint or post-selected statistics, not by Bob's unconditional marginal alone.

*   **Consistency Analysis:** AQFT then allows the mathematical coexistence of operator locality (Equation (F.2), Corollary F.1) and potential state‑mediated statistical non‑locality (Equation (F.4)). Compatibility with operational causality (Postulate 2) is maintained because: (i) The CC effect is bounded ($\text{CC} < 0.5$, Theorem 39), preventing deterministic forcing of outcomes. (ii) More fundamentally, the underlying ND-RID interactions mediating any influence are subject to irreducible irreversibility ($\varepsilon \ge \ln 2$, Theorem 31) and finite information capacity ($f_{RID}<1, C_{\max}<\ln d_0$, Theorem E.2). These limits, analyzed within Appendix F (Section F.6), severely constrain the rate and fidelity of any information transfer via this channel (Theorems 40, 41), rendering the construction of paradox-inducing causal loops via deterministic signaling impossible (Theorem 42).

*   Lorentz Invariance: Lorentz invariance is argued to be preserved in the conditional Appendix F continuum description because (i) local operators obey microcausality when Corollary F.1 applies, (ii) the influence is purely statistical and cannot establish a preferred frame (Theorem 42, analysis in Appendix F, Section F.7), and (iii) the continuum discussion is carried out in the Lorentz-covariant AQFT/Wightman setting used there.

In summary, the AQFT analysis (Appendix F) provides a conditional consistency setting for emergent locality while allowing bounded, state‑mediated statistical influence (which is hypothesized and bounded).

**Theorem 42a (Relational Decoding Principle: No Actionable Capacity Without Shared Decoding).** Consider bipartite $AB$ in state $\rho_{AB}$. Alice chooses a local instrument $\Phi_x$ labeled by a message $x$. Bob’s local detector is keyed by a classical variable $K$ (unavailable to Bob at measurement time), selecting a unital CP Heisenberg map $\Lambda_K^*$, and he measures effects $\{E_i^{(K)}\}$ with $E_i^{(K)}=\Lambda_K^*(E_i)$. Assume the key distribution $\pi(K)$ is independent of $x$, and that the averaged Heisenberg map
$$
\overline{\Lambda^*}:=\sum_K \pi(K)\,\Lambda_K^*
$$
is completely positive, unital, and independent of $x$ (if moreover $\overline{\Lambda^*}=\mathrm{id}$, the baseline statistics are preserved). Then Bob’s observed distribution is independent of $x$ and the classical channel $X\!\to\!Y$ has zero capacity [Watrous 2018; Nielsen & Chuang 2010]:
$$
p_B(i\mid x)=\sum_K\pi(K)\operatorname{tr}\big[\rho_B\,E_i^{(K)}\big]=\operatorname{tr}\big[\rho_B\,\overline{\Lambda^*}(E_i)\big],\qquad I(X;Y)=0.
$$
*Proof.* Local operations on $A$ do not change $B$’s marginal, $\rho_B^{(x)}=\rho_B$. Linearity and the $x$‑independence of $\overline{\Lambda^*}$ give the result. ∎

*Foundational reading.* Theorem 42a articulates a principle of *relational decoding* that is built into the framework's relational information ontology (Definition 1, Appendix N): the operational physics of a CC-induced effect resides not in any observer's standalone measurement stream but in the *jointly decoded* statistics that become accessible only after Alice's record, Bob's record, and any classical labels (context tags, basis assignments, timing certificates) have been brought together for joint analysis. Under the hypotheses of Theorem 42a,
$$
I(C;Y_B)=0,\qquad I(C;Y_B,K)=0,
$$
where $Y_B$ is Bob's record, $C$ is Alice's context label, and $K$ is the keying variable. Joint analysis with Alice's record $Y_A$ may still reveal context dependence:
$$
I(C;Y_A,Y_B,K)\;\text{may be}\;>0.
$$
Revealing the key $K$ alone does not unlock $C$ from Bob's stream because the averaged Heisenberg map is $x$-independent by hypothesis. On branch (i) of Postulate 3, Bob's marginal is invariant by Lemma 10.2. On branch (ii), any context dependence of Bob's marginal is a shared-past preparation effect and is excluded as an explanation of late-randomized branch-(iii) data by Theorem L.12.8. On branch (iii), Bob's marginal itself shifts under late randomization, but the shift is statistical with rate bounded by Theorem 41 and remains operationally inaccessible for deterministic signaling without sufficient sample complexity (Theorem 40, Lemma 10.3). The QCP of Section 10.3.2 fixes a single shared decoding rule — the pre-agreed binary mapping between context and target measurement bias — and converts the relational structure into a one-shot decision advantage $\delta=O(\mathrm{CC})$ that cannot be amplified into deterministic signaling.

**10.6 Gravitational Self-Limitation of CC**

The Consciousness Complexity (CC) hypothesis is not without internal constraints. The very act of generating a high-CC context is a physical process that carries a resource cost, manifesting as a contribution to the system's stress-energy tensor. This creates a subtle but profound negative feedback loop: the gravitational field produced by the CC context itself can disrupt the delicate quantum coherence required for the CC effect to manifest.

This self-limiting mechanism arises from the framework's unified nature. A high-CC state requires high aggregate complexity $C_{agg}$, which in turn requires a significant power expenditure $P_{context}$ to maintain. This power contributes to the local energy density, sourcing a gravitational potential. A target quantum system within this potential experiences differential gravitational time dilation across its spatial extent, which acts as a dephasing mechanism. As a system attempts to increase its CC, the power cost rises non-linearly, strengthening the self-generated gravitational field and increasing the dephasing effect.

The Principle of Compression Efficiency (PCE) drives the system to an equilibrium that balances the predictive utility of the CC bias against both its direct resource cost and this indirect gravitational self-disruption. This ensures that CC cannot be increased indefinitely, providing a fundamental physical limit on its efficacy that is independent of the causality bound derived in Theorem 39. A full quantitative derivation of this self-limiting feedback loop is provided in **Appendix S**.
