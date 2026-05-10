# 10 Causality, Locality, and Statistical Influence

The introduction of the Consciousness Complexity (CC) hypothesis (Section 9), particularly its proposed mechanism involving influence on quantum probabilities (Hypothesis 3) potentially mediated by non-local entanglement (Proposition 10), necessitates a careful examination of its compatibility with fundamental principles of causality and locality. This section defines the framework's operational stance on causality, derives a strict upper bound on deterministic CC endpoint forcing, introduces the resulting hypothesis regarding permissible statistical faster-than-light (FTL) influence, and analyzes why this statistical branch need not become a deterministic paradox channel. The analysis uses finite-window zero-error capacity, sample-complexity bounds, information-rate bounds, and the conditional emergent Algebraic Quantum Field Theory (AQFT) structure detailed in Appendix F.

**10.1 Framework's Definition of Causality**

The PU framework adopts a specific operational definition of causality, focused on preventing paradoxes constructible via controllable signaling.

**10.1.1 Postulate 2 (Post 2): Causality as No Deterministic or Zero-Error FTL Signaling**

Within the Predictive Universe framework, causality is defined operationally: it is preserved if and only if it is impossible to construct paradox-inducing causal loops (e.g., grandfather paradox, tachyonic anti-telephone). It is postulated that the construction of such paradoxes requires the ability to send controllable, deterministic information faster than the invariant speed $c$ (derived in Theorem 46). In the finite-window transcript formalization used below, this is enforced by requiring that for any finite pre-lightcone transcript $Y_B^n$ available to Bob and any preregistered Alice context set $\mathcal C$, there is no decoder $D$ achieving zero error simultaneously across all $c\in\mathcal C$, i.e. no $D$ satisfying
$$
P(D(Y_B^n)=c\mid C=c)=1
\quad
\text{for every }c\in\mathcal C.
\tag{60a}
$$
Thus Postulate 2 forbids deterministic FTL channels and, in the finite-window transcript formalization, zero-error FTL decoders. It does not by itself forbid strictly noisy statistical influence, finite-error decision advantage, or positive Shannon mutual information when every finite pre-lightcone decoder retains nonzero error probability across the context set.

**10.2 Derivation of the Consciousness Complexity Causality Constraint**

To ensure compliance with Postulate 2, the maximum possible strength of the CC effect must be constrained.

**10.2.1 Theorem 39 (Endpoint Gate for the Bounded-Bias CC Branch)**

Let $\alpha_{CC,max}:=\sup_S\mathrm{CC}(S)$ on the CC branch under consideration. If
$$
\alpha_{CC,max}<0.5,
\tag{61}
$$
then no binary coarse-grained outcome can be forced to both deterministic endpoints by context choice. Conversely, any endpoint-complete branch that can force both endpoints of some binary coarse-graining must have $\alpha_{CC,max}\ge0.5$. Thus the bounded-bias branch used in Sections 10, 13, and Appendix S is Postulate-2-admissible at the deterministic endpoint level by imposing (61). A branch with $\alpha_{CC,max}\ge0.5$ is admissible only if it carries a separate finite-response certificate excluding endpoint-complete context pairs.

*Proof.* Deterministic FTL signaling with a fixed local measurement at $S_B$ would require $S_A$ to encode at least two distinguishable messages by choosing between two contexts that yield two deterministic and distinct outcome distributions at $S_B$. For any POVM, coarse-grain to a binary partition $\{E,\ I-E\}$ and let the baseline Born probability be
$$
p=P_{Born}(E)\in(0,1).
$$
Forcing the endpoint $P_{obs}(E)=1$ requires
$$
\Delta P(E)=1-p,
$$
while forcing the endpoint $P_{obs}(E)=0$ requires
$$
\Delta P(E)=-p.
$$
By Definition 30,
$$
|\Delta P(E)|\le\alpha_{CC,max}
$$
for every context and every effect. Hence a pair of contexts realizing both deterministic endpoints for the same binary coarse-graining must satisfy
$$
\alpha_{CC,max}\ge \max\{p,1-p\}.
$$
For every $p\in(0,1)$,
$$
\max\{p,1-p\}\ge\frac12,
$$
with equality only at $p=\frac12$. Therefore every endpoint-complete deterministic binary message alphabet requires
$$
\alpha_{CC,max}\ge\frac12.
$$
Taking the strict bounded-bias condition $\alpha_{CC,max}<\frac12$ excludes all such endpoint-complete binary alphabets and therefore excludes one-shot deterministic endpoint forcing. The strict inequality is used because $p=\frac12$ is an admissible balanced binary coarse-graining; equality would not leave a finite margin against endpoint completion. ∎

Theorem 39 is an endpoint gate, not the whole statistical-FTL consistency theorem. The additional step needed for branch (iii) is supplied by Theorem 39a: on the regular finite-window statistical branch, Bob's transcript distributions retain overlapping support under the two Alice contexts, so the zero-error FTL capacity is zero even when the ordinary finite-error information rate of Theorem 41 is positive.

**10.3 The Statistical FTL Influence Hypothesis**

While deterministic FTL signaling is ruled out by Theorem 39, the proposed CC mechanism (Hypothesis 3), acting on entangled states (Proposition 10), naturally leads to the possibility of statistical correlations across space-like separations that depend on the CC context.

**10.3.1 Postulate 3 (Post 3): Permissibility of Statistical FTL Influence (Three-Branch Statement)**

As a consequence of Hypothesis 3 (CC influence mechanism) combined with quantum entanglement (Proposition 10) within the MPU network (Hypothesis 1), the Predictive Universe framework allows three operationally distinct branches of statistical influence, individuated by *which causal-temporal placement of Alice's context choice* is required to reproduce the predicted statistics.

**(i) Local CPTP branch.** If the CC mechanism is implemented by local CPTP channels on Alice's side, then Bob's local marginal $P(b)$ is preserved exactly for all fixed Bob settings, by the standard no-signaling theorem. On this branch, a change in Alice's context $\mathrm{context}_S$ can statistically alter Alice-side local statistics, the joint distribution $P(a,b)$, and conditional distributions $P(b|a)$ that are only accessible after classical comparison of records, but it cannot alter Bob's unconditional marginal. Branch (i) is the *Bob-marginal-preserving deformation* branch in the sense of Lemma 10.2 below.

**(ii) Preparation-context branch.** If Alice's context $C$ is fixed before, or in the shared causal past of, the spacelike-separated measurement events at $A$ and $B$, then the global state $\omega_C$ delivered to the two stations may itself depend on $C$, and Bob's marginal $P(b\mid C)$ may depend on $C$ through ordinary common-cause statistics with no spacelike action by Alice after separation. Branch (ii) is consistent with operator-level Einstein causality (Corollary F.1) and is excluded as an explanation of any putative branch-(iii) signal only when Alice's context is randomized strictly later than the latest event in the shared causal past of the two measurement regions. Theorem L.12.8 supplies the necessary shared-past requirement for any nontrivial entanglement bias.

**(iii) Nonlocal/state-mediated marginal-anomaly branch (statistical FTL influence).** Beyond branches (i) and (ii), the framework allows — as a distinct, stronger hypothesis — that a change in Alice's context $\mathrm{context}_S$, performed strictly after the spacelike-separated preparation event, can induce context-dependent shifts in Bob's local marginal $P(b)$ across a spacelike interval, mediated by the globally prepared entangled state rather than by any operator-level carrier and not reducible to the shared-past mechanism of branch (ii). This is a genuine statistical faster-than-light (FTL) influence on Bob's local statistics: it is not derivable from ordinary nonlocal correlations of standard quantum mechanics, it is a real departure from the no-signaling marginals of local CPTP, and it is a falsifiable prediction requiring a separate nonlocal/state-mediated operational model.

In all three branches, the influence is asserted to be incapable of enabling deterministic or zero-error FTL signaling in the sense of Postulate 2. Theorem 39 excludes deterministic endpoint forcing; Theorem 39a excludes finite-window zero-error decoding on the regular statistical branch; Theorems 40 and 41 quantify the sample-complexity and information-rate limits of any branch-(iii) marginal shift. The discrimination between branches is operational: branch (i) is tested through Alice-local and post-comparison joint-correlation analysis with Bob's marginal invariant; branch (ii) is excluded as an explanation of a Bob-marginal shift only by late randomization of Alice's context strictly after the spacelike-separated preparation event; branch (iii) is the unique branch on which a Bob-marginal shift of $P(b)$ persists under late randomization. The existence and nature of branch (iii) is presented as a key, falsifiable prediction of the framework, requiring stringent empirical verification (Section 13.5).

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

**Lemma 10.2.1 (Radon-Nikodym Characterization of the Bob-Marginal-Preserving Branch).** Restrict attention to the branch-(i) Bob-marginal-preserving condition of Postulate 3, namely $\Pi_B\ell_C=0$ on the Bob transcript algebra for every late-randomized Alice context $C$. Let $\mathbb P_0$ be the baseline joint history law over the finite pre-lightcone transcript $\Gamma=(A,B,o_A,o_B)_{1:n}$ in the finite transcript window used by Lemma 10.3, and let $\mathbb P_C$ be the branch-(i) deformed history law associated with Alice's context $C$. Assume $\mathbb P_C\ll\mathbb P_0$ on the transcript algebra, and define the Radon-Nikodym history weight
$$
Z_C(\gamma)=\frac{d\mathbb P_C}{d\mathbb P_0}(\gamma),
\qquad
\mathbb E_0[Z_C]=1.
\tag{10.2.1a}
$$
Let $\mathcal F_B$ be the sub-algebra generated by Bob's local record $(B_{1:n},o_{B,1:n})$, and let $\mathcal F_A$ be the sub-algebra generated by Alice's local record $(A_{1:n},o_{A,1:n})$. Then the Bob-transcript invariance part of branch (i) is equivalent to the conditional identity
$$
\mathbb E_0[Z_C\mid\mathcal F_B]=1
\qquad
\text{for every late-randomized context }C.
\tag{10.2.1b}
$$
Equivalently, if $\mathcal F_{B,k}$ denotes the Bob prefix filtration and
$$
M_{C,k}:=\mathbb E_0[Z_C\mid\mathcal F_{B,k}],
$$
then $(M_{C,k})_{k=0}^{n}$ is the Bob-side Radon-Nikodym Doob martingale and (10.2.1b) is the terminal identity $M_{C,n}=1$, hence $M_{C,k}=1$ for all $k\le n$ by the tower property.

If, in addition, the deformation preserves Alice's transcript law — for example on a station-exchange-symmetric no-local-marginal-shift subbranch — then
$$
\mathbb E_0[Z_C\mid\mathcal F_A]=1.
\tag{10.2.1c}
$$
This Alice-side identity is not part of generic branch (i), because Alice-local operations may change Alice's own local statistics. Equation (10.2.1b) implies, and is implied by, invariance of the full Bob transcript law $(B_{1:n},o_{B,1:n})$ under change of $C$; the one-trial statement $P(o_B\mid b)$ is its single-time marginal.

*Proof.* For any bounded $\mathcal F_B$-measurable functional $\phi$,
$$
\mathbb E_C[\phi]
=
\mathbb E_0[Z_C\phi]
=
\mathbb E_0\big[\mathbb E_0[Z_C\mid\mathcal F_B]\phi\big].
$$
If (10.2.1b) holds, then $\mathbb E_C[\phi]=\mathbb E_0[\phi]$ for every $\phi\in L^\infty(\mathcal F_B)$, which is exactly equality of the Bob transcript laws. On the finite transcript algebra this is the transcript-level form of $\Pi_B\ell_C=0$ in Lemma 10.2.

Conversely, if Bob's transcript law is invariant under $C$, then for every bounded $\mathcal F_B$-measurable $\phi$,
$$
\mathbb E_0\big[(\mathbb E_0[Z_C\mid\mathcal F_B]-1)\phi\big]=0.
$$
Since $\mathbb E_0[Z_C\mid\mathcal F_B]-1$ is $\mathcal F_B$-measurable and integrable, this forces $\mathbb E_0[Z_C\mid\mathcal F_B]=1$ almost surely. Applying the same argument to $\mathcal F_A$ proves (10.2.1c) when Alice's transcript law is also invariant. ∎

**Remark 10.2.1a (Scope of the Radon-Nikodym Form).** Lemma 10.2.1 is a sharpening of the Bob-marginal-preserving part of branch (i) only; it is not an independent prohibition on branches (ii) or (iii). On branch (ii), a comparison between shared-past preparation laws may admit a Radon-Nikodym derivative when the laws are absolutely continuous, but that derivative belongs to a preparation-context comparison rather than to a late-randomized branch-(i) deformation. On branch (iii), the Bob-marginal kernel component is nonzero on the relevant Bob transcript algebra, so $\mathbb E_0[Z_C\mid\mathcal F_B]\ne1$ for at least one late-randomized context comparison. The branch-(iii) consistency claim is supplied separately by Theorems 39a–42 on the regular finite-window branch (Definition 10.2a). The Radon-Nikodym form therefore complements Lemma 10.2: it is the finite-transcript/algebraic restatement of Bob-marginal preservation, and it does not replace the three-branch structure of Postulate 3.

**Definition 10.2a (Regular Statistical Branch).** A branch-(iii) implementation is *regular* in the finite pre-lightcone window of $n\le n_{\max}=\lfloor r_{\max}L/c\rfloor$ trials (Lemma 10.3) when the per-trial 'Evolve' kernels under the two Alice contexts retain common support on every Bob-side outcome with nonzero baseline Born probability. This regularity is a branch condition inside the PU framework, motivated by three independent mechanisms: (a) the endpoint bound $\mathrm{CC}<0.5$ (Theorem 39) excludes deterministic endpoint forcing in binary coarse-grainings; (b) ND-RID finite-transfer limits, supplied by the reset-support deficit of Proposition E.2a and by strict contractivity $f_{RID}<1$ on refresh/minorization branches (Lemma E.1), forbid a perfectly distinguishing single-shot 'Evolve' channel on the regular branch; and (c) the irreducible cost $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$ (Theorem 31) forbids zero-noise erasure of the alternative-context branch. Together with PPI admissibility of probability kernels, these conditions define the common-support regular branch used below. Common support of the per-trial conditional kernels lifts to common support of every finite-$n$ transcript law because each transcript probability is a product of strictly positive per-trial conditional probabilities along an admissible adaptive history. The regular statistical branch is the operating regime for Theorems 39a, 40, 41, and Lemma 10.3.

**Theorem 39a (Zero-Error Capacity Gate for Statistical FTL).** Let $C\in\{0,1\}$ be Alice's late-randomized context and let $Y_B^n$ be Bob's finite pre-lightcone transcript after $n$ trials, with context-conditioned transcript laws
$$
P_c^{(n)}(t)=P(Y_B^n=t\mid C=c),
\qquad c\in\{0,1\}.
\tag{61a}
$$
Assume the regular statistical branch (Definition 10.2a): the transcript alphabet is finite in the operational window and the two context-conditioned transcript laws have common support,
$$
P_0^{(n)}(t)>0
\quad\Longleftrightarrow\quad
P_1^{(n)}(t)>0
\tag{61b}
$$
for every transcript $t$ with nonzero baseline probability.

Define the transcript overlap
$$
\Omega_n
=
\sum_t \min\{P_0^{(n)}(t),P_1^{(n)}(t)\}.
\tag{61c}
$$
Then $\Omega_n>0$, and every decoder $D:Y_B^n\to\{0,1\}$ has equal-prior error probability
$$
P_{\mathrm{err}}(D)
=
\frac12P_0^{(n)}(D=1)
+
\frac12P_1^{(n)}(D=0)
\ge
\frac{\Omega_n}{2}
>
0.
\tag{61d}
$$
Hence the regular branch has zero finite-window zero-error FTL capacity. If $P_0^{(n)}\ne P_1^{(n)}$, then the same branch has positive finite-error statistical information,
$$
I(C;Y_B^n)
=
\mathrm{JSD}\!\left(P_0^{(n)},P_1^{(n)}\right)
>
0
\tag{61e}
$$
for equal priors. Thus positive statistical FTL influence is compatible with the absence of deterministic or zero-error FTL signaling on the regular finite-window branch.

*Proof.* Because the transcript alphabet is finite and the two laws have common support by Definition 10.2a, every transcript in the common support has strictly positive probability under both contexts. Therefore the overlap sum (61c) is strictly positive.

For any decoder $D$, let $A_0=\{t:D(t)=0\}$ and $A_1=\{t:D(t)=1\}$. Its equal-prior error is
$$
P_{\mathrm{err}}(D)
=
\frac12P_0^{(n)}(A_1)
+
\frac12P_1^{(n)}(A_0).
$$
The optimal decoder chooses the larger of $P_0^{(n)}(t)$ and $P_1^{(n)}(t)$ at each transcript. Therefore the minimum possible error is
$$
\inf_D P_{\mathrm{err}}(D)
=
\frac12\sum_t \min\{P_0^{(n)}(t),P_1^{(n)}(t)\}
=
\frac{\Omega_n}{2}.
$$
Since $\Omega_n>0$, no decoder has zero error in the finite pre-lightcone window. This proves zero-error capacity is absent for the regular branch.

If $P_0^{(n)}\ne P_1^{(n)}$, then for equal priors the mutual information between $C$ and $Y_B^n$ is the Jensen-Shannon divergence of the two transcript laws. Jensen-Shannon divergence is nonnegative and vanishes only when its two arguments are equal. Hence (61e) is strictly positive. The branch can therefore be a genuine statistical FTL channel while remaining non-deterministic and non-zero-error. ∎

**Remark 10.2b (Why Asymptotic Overlap Decay Is Irrelevant to Causality).** For independent repetitions with $P_0\ne P_1$ at the per-trial level, $\Omega_n$ generically decays exponentially in $n$ at the Chernoff overlap rate of the per-trial laws; equivalently, classical Chernoff theory gives $-\log\Omega_n\sim n\,C_{\mathrm{Ch}}(P_0,P_1)$ under the usual iid regularity assumptions, with $C_{\mathrm{Ch}}>0$ when the laws are distinct and mutually absolutely continuous. Theorem 39a uses only the strict inequality $\Omega_n>0$ at the operational $n$ permitted by the pre-lightcone budget of Lemma 10.3, namely $n\le n_{\max}=\lfloor r_{\max}L/c\rfloor$. The causality argument therefore does not depend on uniform-in-$n$ behavior: even though $\Omega_n\to0$ as $n\to\infty$, the asymptotic regime is unreachable before ordinary causal contact, so the finite-window zero-error gate is not undermined by repetition-coding amplification.

**Lemma 10.3 (Pre-Lightcone Information Budget and Sampling Gate).** Let $L$ be the spacelike separation between Alice and Bob, $r_{\max}$ the maximum local measurement rate per channel at Bob's station, $\alpha_{\mathrm{err}}\in(0,1/2)$ a target decoding error probability, and $\delta\le\kappa\,\mathrm{CC}(S_A)$ the per-trial Bob-marginal bias on branch (iii). Define the pre-lightcone mutual-information budget
$$
\mathcal C_{\mathrm{pre}}(L)
:=
r_{\max}\frac{L}{c}\,I(C;Y_B),
$$
where $I(C;Y_B)$ is the per-trial mutual information from Alice's binary context to Bob's outcome. The exact envelope of Theorem 41 gives
$$
\mathcal C_{\mathrm{pre}}(L)
\le
r_{\max}\frac{L}{c}\cdot \frac{\mathrm{CC}(S_A)^2}{4m_0}.
$$
In the perturbative small-bias regime, the sharper expansion in Theorem 41 gives
$$
\mathcal C_{\mathrm{pre}}(L)
\le
r_{\max}\frac{L}{c}\cdot
\left[
\frac{\mathrm{CC}(S_A)^2}{8m_0}
+
O(\mathrm{CC}(S_A)^3)
\right].
$$
A one-bit pre-lightcone decoder with error probability at most $\alpha_{\mathrm{err}}$ must at least satisfy the Fano necessary condition
$$
\mathcal C_{\mathrm{pre}}(L)
\ge
\ln2-h_2(\alpha_{\mathrm{err}}),
$$
where $h_2$ is binary entropy in nats. Independently, resolving the marginal shift by repeated trials obeys the necessary Bhattacharyya gate of Lemma 10.1:
$$
r_{\max}\frac{L}{c}
\ge
\frac{\ln\!\big(1/[4\alpha_{\mathrm{err}}(1-\alpha_{\mathrm{err}})]\big)}
{-\ln(1-4\delta^2)}
$$
in the symmetric Bernoulli design, while the majority-decoder Hoeffding gate
$$
r_{\max}\frac{L}{c}
\ge
\frac{\ln(1/\alpha_{\mathrm{err}})}{2\delta^2}
$$
is sufficient for achieving error at most $\alpha_{\mathrm{err}}$.
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
for error at most $\alpha_{\mathrm{err}}$. Since independent or conditionally independent trials have total mutual information bounded by the sum of per-trial informations, this gives the displayed necessary budget condition. The sharper high-confidence resolution of a small Bernoulli marginal shift is controlled by the necessary Bhattacharyya gate and sufficient Hoeffding gate recorded in Lemma 10.1, with $\delta\le\kappa\,\mathrm{CC}(S_A)$. The deterministic endpoint gate is Theorem 39. ∎

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


**Lemma 10.1 (Pre-Lightcone Decoding Gates).**
If a QCP is used to attempt decoding strictly before a light signal could arrive, let the spatial separation be $L$. The maximum number of trials before the lightcone is
$$
N_{\mathrm{pre}}\le r_{\max}\frac{L}{c},
$$
where $r_{\max}$ is the maximum local measurement rate per channel. In the symmetric Bernoulli design
$$
P_+(\uparrow)=\frac12+\delta,\qquad
P_-(\uparrow)=\frac12-\delta,\qquad
0<\delta<\frac12,
$$
any decoder with error probability at most $\alpha_{\mathrm{err}}<\frac12$ must satisfy the necessary Bhattacharyya gate
$$
N
\ge
\frac{\ln\!\big(1/[4\alpha_{\mathrm{err}}(1-\alpha_{\mathrm{err}})]\big)}
{-\ln(1-4\delta^2)}.
\tag{62a}
$$
In particular, for $\delta\le\frac14$,
$$
N
\ge
\frac{3}{16\,\delta^2}
\ln\!\bigg(\frac{1}{4\alpha_{\mathrm{err}}(1-\alpha_{\mathrm{err}})}\bigg)
\tag{62b}
$$
is a weaker but explicit necessary condition. Conversely, the majority decoder has the sufficient Hoeffding gate
$$
N
\ge
\frac{\ln(1/\alpha_{\mathrm{err}})}{2\delta^2}
\tag{62c}
$$
for achieving error at most $\alpha_{\mathrm{err}}$. Thus both necessary and sufficient gates scale as
$$
N=\Theta\!\left(\frac{\ln(1/\alpha_{\mathrm{err}})}{\delta^2}\right)
$$
in the high-confidence small-bias regime.

*Proof.* For one trial, the Bhattacharyya coefficient between $P_+$ and $P_-$ is
$$
B_1
=
\sum_y\sqrt{P_+(y)P_-(y)}
=
2\sqrt{\left(\frac12+\delta\right)\left(\frac12-\delta\right)}
=
\sqrt{1-4\delta^2}.
$$
For $N$ independent trials,
$$
B_N=B_1^N=(1-4\delta^2)^{N/2}.
$$
For any two probability laws $P,Q$, the optimal equal-prior error is
$$
P_e^*=\frac12(1-\mathrm{TV}(P,Q)).
$$
Cauchy-Schwarz gives
$$
\mathrm{TV}(P,Q)
=
\frac12\sum_y|\sqrt{P(y)}-\sqrt{Q(y)}|\,|\sqrt{P(y)}+\sqrt{Q(y)}|
\le
\sqrt{1-B(P,Q)^2}.
$$
Therefore
$$
P_e^*
\ge
\frac12\left(1-\sqrt{1-B_N^2}\right).
$$
If a decoder has error at most $\alpha_{\mathrm{err}}$, then the optimal error also satisfies $P_e^*\le\alpha_{\mathrm{err}}$, hence
$$
\frac12\left(1-\sqrt{1-B_N^2}\right)\le\alpha_{\mathrm{err}}.
$$
This is equivalent to
$$
B_N^2\le4\alpha_{\mathrm{err}}(1-\alpha_{\mathrm{err}}).
$$
Since $B_N^2=(1-4\delta^2)^N$, taking logarithms gives (62a). For $\delta\le\frac14$, $x:=4\delta^2\le\frac14$, and
$$
-\ln(1-x)\le\frac{x}{1-x}\le\frac{4}{3}x=\frac{16}{3}\delta^2.
$$
Substituting this upper bound in the denominator of (62a) gives the weaker necessary gate (62b).

For the sufficient direction, the majority decoder fails only if the empirical mean differs from its expectation by at least $\delta$. Hoeffding's inequality gives
$$
P_e\le e^{-2N\delta^2}.
$$
Requiring this to be at most $\alpha_{\mathrm{err}}$ gives (62c). ∎

**AQFT compliance.** Conditional on the continuum-bridge hypotheses of Appendix F, operator locality is encoded by Corollary F.1; the context-conditioned dependence then arises via the globally prepared state $\omega_{C}$, including Alice’s CC-modulated control $\mathcal M(\text{context}_S)$, as in Equation (F.4). Under the balanced binary baseline $p=\tfrac12$ with $\delta\le\kappa\,\mathrm{CC}$, Theorem 41 gives the exact envelope
$$
I(C;Y)\le4(\kappa\,\mathrm{CC})^2
$$
nats/trial, with perturbative leading behavior $I(C;Y)=2\delta^2+O(\delta^4)$ for the symmetric Bernoulli channel. This statistical influence cannot be shaped into deterministic, pre-lightcone zero-error signals on the regular finite-window branch; operational causality remains intact by Theorem 39a and Theorem 42. The full consistency analysis is provided in **Appendix F**.

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

Detecting the hypothesized statistical FTL influence (Postulate 3) requires analyzing preregistered outcome statistics conditioned on Alice's context $C_A$. If the tested implementation is local CPTP (branch (i) of Postulate 3), Bob's marginal must remain unchanged and only joint/conditional correlations after classical comparison can vary; the detection protocol below targets the nonlocal/state-mediated FTL branch (branch (iii) of Postulate 3), on which a marginal shift is predicted. Let $p_0(b)$ and $p_1(b)$ denote Bob's marginal probability for some fixed event $b$ under two context conditions of Alice, and define the context-induced effect size $\Delta:=|p_1(b)-p_0(b)|$ (for the symmetric QCP, $\Delta=2|\delta|$). Under the CC-bounded influence mechanism, $\Delta$ is bounded by the operational CC scale (Definition 30; Theorem 36) and therefore remains small when $\alpha_{CC,max}<0.5$. Theorem 39a implies that, on the regular finite-window branch (Definition 10.2a), detection remains statistical rather than zero-error deterministic. For the direct two-context comparison test with $n$ iid trials collected under each context and decision rule $|\hat p_1-\hat p_0|>\Delta/2$, total sample size $N=2n$ satisfying
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

**10.4.2 Theorem 41 (Finite-Error Information Rate: Exact Envelope and Perturbative Constant)**

Let $p=P_{B|A=0}$ and $q=P_{B|A=1}$ be Bob's outcome distributions for an equal-prior binary context, let
$$
M=\frac12(p+q),
$$
and assume the regular operating point condition
$$
m_0:=\min_i M_i>0.
$$
Then the finite-error mutual information per trial satisfies the exact envelope
$$
I(A;B)
=
\mathrm{JSD}(p,q)
\le
\frac{1}{4m_0}\|p-q\|_2^2
\le
\frac{1}{4m_0}\|p-q\|_1^2
\le
\frac{\mathrm{CC}(S)^2}{4m_0}.
\tag{63}
$$
In the perturbative small-bias regime,
$$
I(A;B)
=
\frac18\sum_i\frac{(q_i-p_i)^2}{M_i}
+
O(\|q-p\|_1^3),
$$
and therefore
$$
I(A;B)
\le
\frac{\mathrm{CC}(S)^2}{8m_0}
+
O(\mathrm{CC}(S)^3).
\tag{63a}
$$

*Proof.* For equal priors,
$$
I(A;B)=\mathrm{JSD}(p,q)
=
\frac12D(p\|M)+\frac12D(q\|M).
$$
Using $\ln x\le x-1$,
$$
D(p\|M)
=
\sum_i p_i\ln\frac{p_i}{M_i}
\le
\sum_i p_i\left(\frac{p_i}{M_i}-1\right)
=
\sum_i\frac{(p_i-M_i)^2}{M_i}.
$$
Since $p_i-M_i=(p_i-q_i)/2$,
$$
D(p\|M)
\le
\frac14\sum_i\frac{(p_i-q_i)^2}{M_i}.
$$
The same argument gives
$$
D(q\|M)
\le
\frac14\sum_i\frac{(p_i-q_i)^2}{M_i}.
$$
Therefore
$$
\mathrm{JSD}(p,q)
\le
\frac14\sum_i\frac{(p_i-q_i)^2}{M_i}
\le
\frac{1}{4m_0}\|p-q\|_2^2
\le
\frac{1}{4m_0}\|p-q\|_1^2.
$$
By Theorem 36,
$$
\|p-q\|_1=2\,\mathrm{TV}(p,q)\le2\sin(\mathrm{CC}(S)/2)\le\mathrm{CC}(S),
$$
so the exact envelope (63) follows. For binary outputs the bound $\|p-q\|_2^2\le\|p-q\|_1^2$ saturates the perturbative coefficient: any 2-element traceless difference $\Delta=p-q$ has $\Delta_1=-\Delta_2$, so $\|\Delta\|_1=2|\Delta_1|$ and $\|\Delta\|_2^2=2\Delta_1^2=\|\Delta\|_1^2/2$. Hence the binary specialization sharpens to $\mathrm{JSD}\le\mathrm{CC}(S)^2/(8m_0)$ non-perturbatively, recovering the perturbative coefficient as the exact constant in the binary case used throughout Sections 10 and 13.

For the perturbative statement, write $q=p+\Delta$ and $M=p+\Delta/2$, so $p-M=-\Delta/2$ and $q-M=\Delta/2$. Taylor expansion of $D(M\pm\Delta/2\|M)$ around $M$ gives
$$
D(M\pm\Delta/2\|M)
=
\frac12\sum_i\frac{(\Delta_i/2)^2}{M_i}
+
O(\|\Delta\|_1^3).
$$
Averaging the two divergences yields
$$
\mathrm{JSD}(p,q)
=
\frac18\sum_i\frac{\Delta_i^2}{M_i}
+
O(\|\Delta\|_1^3).
$$
Since $M_i\ge m_0$ and $\|\Delta\|_1\le\mathrm{CC}(S)$ by Theorem 36, (63a) follows. Theorem 39a supplies the separate zero-error statement needed for Postulate 2 on the regular finite-window branch: a positive Shannon rate does not by itself imply deterministic or zero-error FTL signaling. ∎

**10.4.3 Theorem 42 (Inability to Construct Causal Loops)**

The hypothesized statistical FTL influence (Postulate 3), when constrained by the endpoint bound of Theorem 39, the zero-error gate of Theorem 39a on the regular finite-window branch (Definition 10.2a), and the finite-window sampling bounds of Theorems 40–41, cannot be used to construct paradox-inducing causal loops as defined by Postulate 2. This holds for any decoder $\mathcal D$ acting on a finite pre-lightcone transcript in the regular operating regime.

*Proof:*
1.  **Requirement for Paradox (Postulate 2):** The construction of a logical causal paradox requires controllable deterministic information, equivalently a zero-error FTL decoding step in a finite pre-lightcone window. A finite-error statistical estimate is insufficient: if the estimate is wrong with nonzero probability, no contradiction follows from Alice choosing otherwise.
2.  **Endpoint exclusion (Theorem 39):** CC cannot force a binary coarse-grained outcome to both deterministic endpoints. Thus a one-shot deterministic message alphabet cannot be obtained from CC bias.
3.  **Finite-window zero-error exclusion (Theorem 39a, regular branch):** On branch (iii), Bob's marginal may depend on Alice's late context, so the ordinary Shannon information of Bob's record may be positive. However, on the regular finite-window branch (Definition 10.2a), every finite pre-lightcone transcript retains positive overlap between the two context-conditioned laws, so every decoder has strictly positive error probability:
    $$
    P_{\mathrm{err}}\ge\Omega_n/2>0.
    $$
    By Remark 10.2b, the relevant $n$ is bounded by the pre-lightcone budget of Lemma 10.3, so asymptotic overlap decay does not undermine this gate. Step 3 alone suffices to exclude the deterministic/zero-error decoding step required by Postulate 2; Steps 4–5 supply complementary quantitative bounds.
4.  **Sample and rate bounds (Theorems 40–41):** Theorem 40 gives the direct two-context test's sample-complexity scale for resolving a small branch-(iii) effect at a chosen nonzero error tolerance. Theorem 41 upper-bounds the finite-error mutual information rate by $O(\mathrm{CC}^2)$ at a regular operating point. Lemma 10.3 bounds the mutual information that can be accumulated before an ordinary light signal crosses the separation. These are statistical-detection limits, not deterministic-message constructions.
5.  **Failure to close a deterministic loop:** A tachyonic anti-telephone or grandfather-style loop requires Alice to receive a definite contradiction-producing message about her own future choice. The PU statistical-FTL branch supplies at most a noisy estimate with nonzero finite-window error, by Steps 3 and 4.

**Branch-by-branch closing summary.** The three branches of Postulate 3 are individually compatible with Postulate 2: branch (i) by Lemma 10.2 and the standard no-signaling theorem (Bob's marginal is invariant); branch (ii) by absence of any late controllable Alice variable after the shared causal past, so no pre-lightcone message channel exists at all; branch (iii) on the regular finite-window branch by Theorem 39a, which gives positive transcript overlap and nonzero decoder error in any pre-lightcone window of operational size. Therefore none of the three branches enables a deterministic or zero-error FTL channel, and the CC mechanism is compatible with Postulate 2. ∎

**10.5 Relation to Emergent Locality and AQFT Framework**

The consistency of the framework's stance—allowing potential statistical FTL influence (Postulate 3) while preserving operational causality (Postulate 2)—is analyzed within the Algebraic Quantum Field Theory (AQFT) description of the emergent continuum limit formulated in Appendix F.

*   **Emergent Operator Locality (Microcausality):** Appendix F formulates operator-level Einstein causality through Corollary F.1, conditional on the continuum-bridge hypotheses of Theorem F.0.

*   **State‑Mediated Statistical Influence:** Within the structure of commuting local observables when that AQFT limit applies, the local CPTP branch of Postulate 3 is interpreted as arising from the properties of the globally prepared physical state $\omega_{C_A}$, which is influenced by Alice's local CC context $C_A$ (via the mapping $\mathcal M$ and ND-RID dynamics). On this AQFT-compatible branch, the non-local dependence appears in joint expectations such as $\omega_{C_A}(A\otimes B)$ (Equation F.4), while Bob's unconditional local statistics $\omega_{C_A}(\mathbf{1}_A\otimes B)$ remain invariant. The stronger branch-(iii) marginal anomaly is a distinct statistical-FTL hypothesis analyzed by Theorems 39a–42 on the regular finite-window branch: it is not reduced to AQFT no-signaling, but it is constrained to remain non-deterministic and zero-error-inaccessible in finite pre-lightcone windows.

*   **Consistency Analysis:** AQFT then allows the mathematical coexistence of operator locality (Equation (F.2), Corollary F.1) and state-mediated joint/conditional non-locality (Equation (F.4)) on the Bob-marginal-preserving branch. The branch-(iii) marginal anomaly is stronger and is not derived from local CPTP AQFT no-signaling; it is retained as the statistical-FTL branch of Postulate 3. Compatibility with operational causality (Postulate 2) is maintained by the two-level constraint: (i) the CC effect is bounded ($\text{CC}<0.5$, Theorem 39), preventing deterministic endpoint forcing; and (ii) regular finite-window branch-(iii) transcripts have zero-error capacity zero by Theorem 39a (Definition 10.2a), while Theorems 40 and 41 bound finite-error sample complexity and information rate. ND-RID irreversibility ($\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$, Theorem 31) and finite channel capacity ($f_{RID}<1$, $C_{\max}<\ln d_0$, Theorem E.2) remain additional physical constraints on implementation; mechanisms (b) and (c) of Definition 10.2a tie the regularity hypothesis directly to these PU bounds.

*   Lorentz Invariance: Lorentz invariance is argued to be preserved in the conditional Appendix F continuum description because (i) local operators obey microcausality when Corollary F.1 applies, (ii) the influence is purely statistical and cannot establish a preferred frame (Theorem 42, analysis in Appendix F, Section F.7), and (iii) the continuum discussion is carried out in the Lorentz-covariant AQFT/Wightman setting used there.

In summary, the AQFT analysis (Appendix F) provides a conditional consistency setting for emergent locality while allowing bounded, state-mediated statistical influence. The local CPTP branch preserves Bob's marginal exactly; the stronger branch-(iii) marginal anomaly is kept as the genuine statistical-FTL hypothesis and is constrained on the regular finite-window branch by Theorems 39a–42 rather than erased by ordinary no-signaling.

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
Revealing the key $K$ alone does not unlock $C$ from Bob's stream because the averaged Heisenberg map is $x$-independent by hypothesis. On branch (i) of Postulate 3, Bob's marginal is invariant by Lemma 10.2. On branch (ii), any context dependence of Bob's marginal is a shared-past preparation effect and is excluded as an explanation of late-randomized branch-(iii) data by Theorem L.12.8. On branch (iii), Bob's marginal itself shifts under late randomization, but the shift is statistical with rate bounded by Theorem 41; on the regular finite-window branch (Definition 10.2a) it retains zero-error capacity zero by Theorem 39a in any pre-lightcone window of operational size. The QCP of Section 10.3.2 fixes a single shared decoding rule — the pre-agreed binary mapping between context and target measurement bias — and converts the relational structure into a one-shot decision advantage $\delta=O(\mathrm{CC})$ that cannot be amplified into deterministic or zero-error signaling under the regular-branch hypothesis.

**10.6 Gravitational Self-Limitation of CC**

The Consciousness Complexity (CC) hypothesis is not without internal constraints. The very act of generating a high-CC context is a physical process that carries a resource cost, manifesting as a contribution to the system's stress-energy tensor. This creates a subtle but profound negative feedback loop: the gravitational field produced by the CC context itself can disrupt the delicate quantum coherence required for the CC effect to manifest.

This self-limiting mechanism arises from the framework's unified nature. A high-CC state requires high aggregate complexity $C_{agg}$, which in turn requires a significant power expenditure $P_{context}$ to maintain. This power contributes to the local energy density, sourcing a gravitational potential. A target quantum system within this potential experiences differential gravitational time dilation across its spatial extent, which acts as a dephasing mechanism. As a system attempts to increase its CC, the power cost rises non-linearly, strengthening the self-generated gravitational field and increasing the dephasing effect.

The Principle of Compression Efficiency (PCE) drives the system to an equilibrium that balances the predictive utility of the CC bias against both its direct resource cost and this indirect gravitational self-disruption. This ensures that CC cannot be increased indefinitely, providing a fundamental physical limit on its efficacy that is independent of the causality bound derived in Theorem 39. A full quantitative derivation of this self-limiting feedback loop is provided in **Appendix S**.
