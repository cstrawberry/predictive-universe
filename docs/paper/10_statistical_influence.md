# 10. Causality, Locality, and Statistical Influence

**Baseline and test hypothesis in plain terms.** PU takes exact quantum no-signaling and relativistic causality as the baseline supplied by current physics: ordinary entanglement does not let Alice send Bob a message faster than light. PU also states a statistical-FTL hypothesis to be tested. Under that hypothesis, Alice's independently chosen late context changes Bob's local outcome distribution before light can arrive, so repeated trials define a noisy but genuine faster-than-light communication channel. A certified and replicated result would support PU's QCP/statistical-FTL hypothesis and show that the current local-CPTP/Lorentz-AQFT causal description is incomplete.

**Technical ledger.**

The Consciousness Complexity hypothesis of Section 9 nominates a response-active modification of quantum probabilities. This section defines PU's operational causality condition, derives a strict endpoint-forcing bound, specifies the evidence for the statistical-FTL channel, and analyzes its finite-window zero-error capacity, sample complexity, information rate, and relation to the local-net and relativistic-QFT structures of Appendix F.

**10.1 Framework's Definition of Causality**

The PU framework adopts a specific operational definition of causality, focused on preventing paradoxes constructible via controllable signaling.

<a id="1011-postulate-2-post-2-operational-causality-as-exact-pre-lightcone-no-signaling"></a>**10.1.1 Postulate 2 (Post 2): Operational Causality as Exact Pre-Lightcone No-Signaling**

For every independently selectable finite context $C$ in region $A$ and every full finite-alphabet transcript $Y$ available in a spacelike-separated region $B$ before a light signal from the choice can arrive, Postulate 2 requires
$$
P(Y=y\mid C=c)=P(Y=y)
\qquad
\text{for all admissible }c,y.
$$
Equivalently, the induced context channel has zero Shannon capacity, as proved in Theorem 39c. Deterministic and zero-error FTL signaling are forbidden consequences of this condition, but their absence is not sufficient: any noisy positive-capacity pre-lightcone channel also falls outside the exact causal branch that Postulate 2 defines; branch (iii) of Postulate 3 proposes such a channel as the alternative to that branch. A shared-past preparation label that is not independently selectable at the spacelike choice event does not define an $A\to B$ channel.

**10.2 Derivation of the Consciousness Complexity Causality Constraint**

The endpoint bound below excludes endpoint-complete deterministic forcing.

<a id="1021-theorem-39-endpoint-gate-for-the-bounded-bias-cc-branch"></a>**10.2.1 Theorem 39 (Endpoint Gate for the Bounded-Bias CC Branch)**

Let $\alpha_{CC,max}:=\sup_S\mathrm{CC}(S)$ on the CC branch under consideration. If
$$
\alpha_{CC,max}<0.5,
\tag{61}
$$
then no binary coarse-grained outcome can be forced to both deterministic endpoints by context choice. Conversely, any endpoint-complete branch that can force both endpoints of some binary coarse-graining must have $\alpha_{CC,max}\ge0.5$. Thus the bounded-bias branch used in Sections 10, 13, and Appendix S is Postulate-2-admissible at the deterministic endpoint level by imposing (61). A branch with $\alpha_{CC,max}\ge0.5$ is admissible only if it carries a separate finite-response certificate excluding endpoint-complete context pairs.

*Proof.* Deterministic FTL signaling with a fixed local measurement at $S_B$ would require $S_A$ to encode at least two distinguishable messages by choosing between two contexts that yield two deterministic and distinct outcome distributions at $S_B$. For any POVM, coarse-grain to a binary partition $\{E,\ I-E\}$ and let the baseline Born probability be
$$
p=P_{\mathrm{Born}}(E)\in[0,1].
$$
Forcing the endpoint $P_{\mathrm{obs}}(E)=1$ requires
$$
\Delta P(E)=1-p,
$$
while forcing the endpoint $P_{\mathrm{obs}}(E)=0$ requires
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
Taking the strict bounded-bias condition $\alpha_{CC,max}<\frac12$ excludes all such endpoint-complete binary alphabets and therefore excludes one-shot deterministic selection between both endpoints. It does not exclude forcing one endpoint when the baseline is sufficiently biased. The strict inequality is used because $p=\frac12$ is an admissible balanced binary coarse-graining; equality would not leave a finite margin against endpoint completion. ∎

Theorem 39 is an endpoint gate. The additional step needed for branch (iii) is supplied by Theorem 39a: on the regular finite-window statistical branch, Bob's transcript distributions retain overlapping support under the two Alice contexts, so the zero-error FTL capacity is zero even when the ordinary finite-error information rate of Theorem 41 is positive.

**10.3 The Statistical FTL Influence Hypothesis**

Theorem 39 excludes one-shot endpoint-complete forcing, and Theorem 39a excludes finite-window zero-error signaling on its common-support branch; both are compatible with a noisy positive-capacity pre-lightcone marginal shift, which Theorem 39c places outside the exact causal branch of Postulate 2 as its statistical-influence alternative. Hypothesis 3 therefore motivates the following classification of possible context-dependent spacelike statistics, which Postulate 3 posits.

<a id="1031-postulate-3-post-3-statistical-influence-three-branch-causal-classification"></a>**10.3.1 Postulate 3 (Post 3): Statistical Influence (Three-Branch Causal Classification)**

As a branch contract motivated by Hypothesis 3 and the availability of entangled states on Proposition 10's quantum branch, PU distinguishes three operationally distinct classes of statistical influence according to the causal-temporal placement of Alice's context choice. Postulate 3 posits this three-branch classification; each class carries the status supplied by its realization, no-loop, no-zero-error, protocol, and empirical certificates.

Beyond the local CPTP and shared-past preparation branches, PU admits as a falsifiable dynamical hypothesis a family of global context-indexed state maps $\{\Phi_x\}_{x\in\{0,1\}}$ on a distributed system $AB$. For at least one registered input $\rho_{AB}$ and a late selected Alice context $x$, define
$$
\rho_B^{(x)}:=\operatorname{Tr}_A\Phi_x(\rho_{AB}).
$$
The nonlocal branch asserts
$$
\delta_B
:=
\frac12\left\|\rho_B^{(1)}-\rho_B^{(0)}\right\|_1 >0
\tag{10.3.1}
$$
before any light-speed signal from the context-selection event can reach Bob. The maps must satisfy the endpoint-bias, finite-resource, chronology, and no-loop gates of Theorems 39–41. This branch is not a local operation on $A$ and is not produced by entanglement alone.

**(i) Local CPTP branch.** If the CC mechanism is implemented by local CPTP channels on Alice's side, then Bob's local marginal $P(b)$ is preserved exactly for all fixed Bob settings, by the standard no-signaling theorem. On this branch, a change in Alice's context $\mathrm{context}_S$ can statistically alter Alice-side local statistics, the joint distribution $P(a,b)$, and conditional distributions $P(b|a)$ that are only accessible after classical comparison of records, but it cannot alter Bob's unconditional marginal. Branch (i) is the *Bob-marginal-preserving deformation* branch in the sense of Lemma 10.2 below.

**(ii) Preparation-context branch.** If Alice's context $C$ is fixed before, or in the shared causal past of, the spacelike-separated measurement events at $A$ and $B$, then the global state $\omega_C$ delivered to the two stations may itself depend on $C$, and Bob's marginal $P(b\mid C)$ may depend on $C$ through ordinary common-cause statistics with no spacelike action by Alice after separation. Branch (ii) is consistent with operator-level Einstein causality (Corollary F.1) and is excluded as an explanation of any putative branch-(iii) signal only when Alice's context is randomized strictly later than the latest event in the shared causal past of the two measurement regions. The shared-past placement is part of the causal-temporal definition of branch (ii). Theorem L.12.8 adds that a strict target-conditioned joint-correlation advantage above the best target-independent policy requires causal or common-cause information about the relevant entanglement record; a generic local joint-correlation change need not involve participation in preparation.

**(iii) Context-indexed nonlocal influence branch.** Postulate 3 asserts the global maps and positive trace distance in Equation (10.3.1) as a distinct physical hypothesis. For equiprobable contexts, the Helstrom measurement distinguishes the two Bob states with error
$$
p_e=\frac{1-\delta_B}{2}<\frac12 .
$$
The induced binary statistical channel therefore has positive classical capacity. Quantitatively, with the mutual information and the binary entropy $h_2$ measured in bits, Fano's inequality applied to the Helstrom decoder gives
$$
I(X;Y)\ge1-h_2(p_e)>0
$$
for the registered repeated preparation. Every local CPTP implementation instead satisfies $\rho_B^{(0)}=\rho_B^{(1)}$ and $\delta_B=0$. With an accepted realization record and a prospective test specifying timing, artifacts, likelihood and sensitivity under Definitions 13.0a and 13.0d, a replicated $\delta_B>0$ would establish a noisy statistical-FTL channel and support PU's QCP/statistical-FTL hypothesis. The same result would simultaneously falsify the exact no-signaling baseline represented by the sealed local Lorentz/AQFT branch; these are two descriptions of the same evidence. A null result constrains the certified sensitivity interval. Entanglement supplies the distributed state; the branch-(iii) response law supplies the Bob-marginal shift.

The three branches do not share one causal status: branches (i) and (ii) can satisfy Theorem 39c, whereas a freely selectable branch-(iii) pre-lightcone marginal shift lies, by Corollary 39c.1, outside the sealed Lorentz/AQFT branch, and its preregistered test decides between the two: a certified shift would select branch (iii), while a null result keeps the sealed branch. The discrimination between branches is operational: branch (i) is tested through Alice-local and post-comparison joint-correlation analysis with Bob's marginal invariant; branch (ii) is excluded as an explanation of a Bob-marginal shift only by late randomization of Alice's context strictly after the latest event in the shared causal past of the two measurement regions; branch (iii) is the unique branch on which a Bob-marginal shift of $P(b)$ persists under late randomization. The endpoint, zero-error, sample-complexity, information-rate, chronology, and contradiction gates of Theorems 39–42 remain mandatory. They limit the admissible nonlocal maps but do not turn them into local CPTP dynamics.

<a id="lemma-102-bob-marginal-kernel-decomposition-of-cc-deformations"></a>**Lemma 10.2 (Bob-Marginal Kernel Decomposition of CC Deformations).** Let $P_0(a,b\mid x,y)$ be the baseline joint probability for spacelike-separated POVM settings $x$ at Alice and $y$ at Bob, and let
$$
P_C(a,b\mid x,y)=P_0(a,b\mid x,y)+\epsilon\,\ell_C(a,b\mid x,y)
$$
be a CC-deformed joint probability associated with Alice's context $C$, on a branch with common scale $0<\epsilon\le\mathrm{CC}(S_A)$ (Definition 30) small enough that $P_C(a,b\mid x,y)\in[0,1]$ for every $(a,b,x,y)$. Strict positivity of $\epsilon$ is needed to identify a nonzero coefficient-array marginal with a nonzero probability shift. At zero scale every $P_C$ equals $P_0$ regardless of the coefficient arrays. The deformation is normalization-preserving,
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
for every late-randomized Alice context relative to the neutral baseline, while branch (iii) requires two independently selectable late contexts $C,C'$ and settings and outcomes $x,y,b$ for which
$$
\sum_a\bigl(\ell_C(a,b\mid x,y)-\ell_{C'}(a,b\mid x,y)\bigr)\ne0.
$$ If one also wants to isolate the pure joint-correlation component with both local marginals removed, apply the usual double-centering projector
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
and the displayed identity shows that this entire marginal shift lies in $\Pi_B\ell_C$. Since $\sum_{a,b}\ell_C=0$, summing the Bob-marginal component over $(a,b)$ also gives zero, and therefore both $\Pi_B\ell_C$ and $\ell_C^{B0}$ preserve total normalization. A local CPTP operation on Alice's side cannot change Bob's reduced state, so it lies in the $\Pi_B\ell_C=0$ branch. Conversely, a nonzero difference between the Bob-marginal components of two independently selectable late contexts is exactly a branch-(iii) marginal anomaly. ∎

<a id="lemma-1021-radon-nikodym-characterization-of-the-bob-marginal-preserving-branch"></a>**Lemma 10.2.1 (Radon-Nikodym Characterization of the Bob-Marginal-Preserving Branch).** Restrict attention to the branch-(i) Bob-marginal-preserving condition of Postulate 3, namely $\Pi_B\ell_C=0$ on the Bob transcript algebra for every late-randomized Alice context $C$. Let $\mathbb P_0$ be the baseline joint history law over the finite pre-lightcone transcript $\Gamma=(A,B,o_A,o_B)_{1:n}$ in the finite transcript window used by Lemma 10.3, and let $\mathbb P_C$ be the branch-(i) deformed history law associated with Alice's context $C$. Assume $\mathbb P_C\ll\mathbb P_0$ on the transcript algebra, and define the Radon-Nikodym history weight
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

<a id="remark-1021a-scope-of-the-radon-nikodym-form"></a>**Remark 10.2.1a (Scope of the Radon-Nikodym Form).** Lemma 10.2.1 sharpens the Bob-marginal-preserving part of branch (i). On branch (ii), a comparison between shared-past preparation laws may admit a Radon-Nikodym derivative when the laws are absolutely continuous, but that derivative belongs to a preparation-context comparison rather than to a late-randomized branch-(i) deformation. On branch (iii), a comparison that also satisfies $\mathbb P_C\ll\mathbb P_0$ has the Radon-Nikodym characterization of Lemma 10.2.1: a change in Bob's transcript law is equivalent to $\mathbb E_0[Z_C\mid\mathcal F_B]\ne1$ on a set of positive baseline probability. If this absolute continuity fails, the baseline derivative $Z_C$ need not exist and that conditional-expectation test is unavailable. Common support between the two context laws does not by itself establish absolute continuity with respect to the neutral baseline. The branch-(iii) consistency claim is supplied separately by Theorems 39a–42 on the regular finite-window branch (Definition 10.2a). The Radon-Nikodym form therefore complements Lemma 10.2: it is the finite-transcript/algebraic restatement of Bob-marginal preservation.

<a id="definition-102a-regular-statistical-branch"></a>**Definition 10.2a (Regular Statistical Branch).** A branch-(iii) implementation is *regular* in the finite pre-lightcone window of $n\le n_{\max}=\lfloor r_{\max}L/c\rfloor$ trials when, under the two late-randomized Alice contexts, every admissible Bob-side transcript has positive probability under one context if and only if it has positive probability under the other. A sufficient per-trial condition is that the two conditional `Evolve` kernels have identical support after every admissible adaptive history. Products of the corresponding positive conditional probabilities then give identical support for every finite-$n$ transcript law.

Common support is an independent branch hypothesis. The endpoint condition $\mathrm{CC}<1/2$ excludes a pair of deterministic binary endpoints but does not force positivity of every outcome. Strict contractivity supplies support overlap only on branches whose minorization hypotheses establish it. Proposition E.2a's completed-reset support deficit bounds capacity on its own branch but does not establish an ensemble floor or common transcript support. Theorem 31 supplies only the registered-reset inequality $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; it neither forces a positive entropy floor without an independent ensemble bound nor implies output noise or common support, and paying a positive reset cost does not prohibit a deterministic reset. These results motivate particular regular implementations but do not replace the common-support hypothesis. Together with PPI admissibility of probability kernels, the explicit transcript-support condition defines the operating regime for Theorems 39a, 40, 41, and Lemma 10.3.

<a id="theorem-39a-zero-error-capacity-gate-for-statistical-ftl"></a>**Theorem 39a (Zero-Error Capacity Gate for Statistical FTL).** Let $C\in\{0,1\}$ be Alice's late-randomized context and let $Y_B^n$ be Bob's finite pre-lightcone transcript after $n$ trials, with context-conditioned transcript laws
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
for equal priors. Thus positive statistical FTL influence is compatible with finite-window common support and nonzero decoder error, but Theorem 39c shows that it is not compatible with operational no-signaling.

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

If $P_0^{(n)}\ne P_1^{(n)}$, then for equal priors the mutual information between $C$ and $Y_B^n$ is the Jensen-Shannon divergence of the two transcript laws. Jensen-Shannon divergence is nonnegative and vanishes only when its two arguments are equal. Hence (61e) is strictly positive. The branch can therefore be a genuine statistical FTL channel while remaining non-deterministic and non-zero-error; by Theorem 39c that fact places it outside operational no-signaling. ∎

<a id="theorem-39c-shannon-causality-dichotomy"></a>**Theorem 39c (Shannon-Causality Dichotomy).** Let $C$ be an independently selectable finite context in a spacetime region $A$, and let $Y$ be the full finite-alphabet transcript available in a spacelike-separated region $B$ before any light signal from the choice event can arrive. Write $W_c(y)=P(Y=y\mid C=c)$. The following are equivalent:

1. the $A\to B$ experiment is operationally no-signaling;
2. $W_c=W_{c'}$ for every pair of admissible contexts $c,c'$;
3. $I_\pi(C;Y)=0$ for every prior $\pi$ on $C$;
4. the Shannon capacity $\max_\pi I_\pi(C;Y)$ is zero.

For two contexts with laws $P_0\ne P_1$ and equal priors,
$$
I(C;Y)=\operatorname{JSD}(P_0,P_1)>0,
\qquad
P_{e,*}=\frac12\left(1-\lVert P_0-P_1\rVert_{\mathrm{TV}}\right)<\frac12.
\tag{61j}
$$
Common support implies only $P_{e,*}>0$ for one finite transcript; it does not imply no-signaling. For iid repetitions of distinct laws, the optimal decoding error tends to zero as the number of pre-lightcone samples grows, although any particular geometry may impose a finite sample ceiling.

*Proof.* Conditions (1) and (2) are equivalent by the operational definition of no-signaling for a freely selected context and a pre-lightcone transcript. If (2) holds, then
$$
P(C=c,Y=y)=\pi(c)W_c(y)=\pi(c)P(Y=y)
$$
for every prior $\pi$, so $C$ and $Y$ are independent and (3) holds. Condition (3) implies (4) by maximizing over priors. Conversely, if $W_c\ne W_{c'}$, choose the prior assigning probability $1/2$ to $c$ and $c'$. The resulting mutual information is
$$
\operatorname{JSD}(W_c,W_{c'}),
$$
which is strictly positive because relative entropy is nonnegative and vanishes only for equal distributions. Hence (4) implies (2).

For two equal-prior laws $P_0,P_1$, a decoder minimizes error separately at each transcript by choosing the larger of $P_0(y)$ and $P_1(y)$. Thus
$$
P_{e,*}
=\frac12\sum_y\min\{P_0(y),P_1(y)\}
=\frac12\left(1-\frac12\sum_y|P_0(y)-P_1(y)|\right),
$$
which is (61j). If $P_0\ne P_1$, there is an event $A$ with $P_0(A)\ne P_1(A)$. For iid repetitions, threshold the empirical frequency of $A$ halfway between these two means. The weak law of large numbers makes both conditional error probabilities tend to zero. ∎

<a id="corollary-39c1-causal-status-of-the-three-branches"></a>**Corollary 39c.1 (Causal Status of the Three Branches).** Branch (i) is causal when Bob's marginal is exactly invariant. Branch (ii) is a shared-past preparation dependence and is not an $A\to B$ channel when the context label is chosen before the spacelike choice event. A branch-(iii) Bob-marginal shift under an independently late-randomized choice has positive Shannon capacity by Theorem 39c and therefore lies outside the Lorentz/AQFT causal branch. Such a shift remains a valid preregistered falsifier of that branch; finite-window sample complexity changes detectability, not causal classification.

*Proof.* On branch (i), exact Bob-marginal invariance says $W_c=W_{c'}$ for every admissible late context, so Theorem 39c gives zero $A\to B$ capacity. On branch (ii), the context label is part of the shared-past preparation and is not an independently selectable input at the later spacelike region $A$; the input hypothesis of Theorem 39c is therefore absent, so correlations with that label do not define a later $A\to B$ channel. On branch (iii), late independent randomization and a Bob-marginal shift give $W_c\ne W_{c'}$ for some contexts. Theorem 39c then gives positive capacity and failure of operational no-signaling. A finite sample ceiling affects whether the inequality of laws can be detected at a prescribed error level, but it does not turn unequal laws into equal laws. ∎

<a id="theorem-39c2-exact-binary-information-envelope-and-entropy-extension-obstruction"></a>**Theorem 39c.2 (Exact Binary Information Envelope and Entropy-Extension Obstruction).** Let $P_0,P_1$ be the finite transcript laws of two independently selectable contexts, and put
$$
t=\tfrac12\|P_0-P_1\|_1,\qquad
g(t)=\ln2-h_{\mathrm{nat}}((1-t)/2).
\tag{39c.2.1}
$$
For equal context priors the information $I_{1/2}$ obeys
$$
\tfrac12t^2\le g(t)\le I_{1/2}\le t\ln2.
\tag{39c.2.2}
$$
If this same channel is available under independent memoryless repetition, its Shannon capacity satisfies the sharp bounds
$$
g(t)\le C(P_0,P_1)\le t\ln2.
\tag{39c.2.3}
$$
Both endpoints are attained for every $t\in[0,1]$. In particular, a nonzero context-marginal difference has positive capacity irrespective of its smallness.

Suppose an implementation class is closed under adjoining a context-independent spectator with $d$ equiprobable states, while preserving this transcript channel and a prefactor $0\le K<\infty$. Let a dimensionless entropy functional on that class satisfy $s(\mathcal I\otimes I_d/d)=s(\mathcal I)+\ln d$. A bound
$$
C(\mathcal I)\le K e^{-s(\mathcal I)}
\tag{39c.2.4}
$$
holding for every such extension forces $C(\mathcal I)=0$ and $P_0=P_1$. The same conclusion holds if $C$ in (39c.2.4) is replaced by $t$.

*Proof.* Write $m_y=(P_0(y)+P_1(y))/2$. Terms with $m_y=0$ contribute zero. On the remaining terms put $z_y=(P_0(y)-P_1(y))/(P_0(y)+P_1(y))$. Direct substitution gives
$$
t=\sum_y m_y|z_y|,\qquad
I_{1/2}=\sum_y m_y g(|z_y|).
$$
The function $g$ is continuous on $[0,1]$, has $g(0)=g'(0)=0$, $g(1)=\ln2$, and $g''(u)=1/(1-u^2)\ge1$ on $[0,1)$. Jensen's inequality gives $I_{1/2}\ge g(t)$, the endpoint chord gives $g(u)\le u\ln2$, and twice integrating $g''\ge1$ gives $g(t)\ge t^2/2$.

For the capacity upper bound put $r_y=\min(P_0(y),P_1(y))$, so $\sum_y r_y=1-t$. For $0<t<1$ the channel has a realization that draws a context-independent flag $J\sim\operatorname{Bernoulli}(t)$; for $J=0$ it draws from $r/(1-t)$, and for $J=1$ it draws from $(P_c-r)/t$. For any context prior, data processing gives
$$
I(C;Y)\le I(C;J,Y)=t I(C;Y\mid J=1)\le tH(C)\le t\ln2.
$$
The endpoint cases follow directly. Maximization over priors proves (39c.2.3), whose lower bound follows by using equal priors. The binary symmetric channel with rows $((1+t)/2,(1-t)/2)$ and $((1-t)/2,(1+t)/2)$ has capacity $g(t)$. The binary erasure channel with rows $(t,0,1-t)$ and $(0,t,1-t)$ has capacity $t\ln2$. This proves sharpness.

For the entropy claim, each spectator extension has the same capacity and the asserted upper bound $K e^{-s(\mathcal I)}/d$. Letting integer $d$ tend to infinity forces the unchanged nonnegative capacity to vanish. Equation (39c.2.3), or Theorem 39c, then gives $P_0=P_1$. The argument for $t$ is identical. ∎

<a id="corollary-39c3-local-realization-and-finite-error-certificate"></a>**Corollary 39c.3 (Local Realization and Finite Error Certificate).** Let $\rho_{ABR}$ be fixed independently of the late context, and let $\Lambda_c$ be a trace-preserving completely positive map on $A$. Every fixed reader on $BR$ gives one context-independent transcript law. More generally, suppose a realized context law $\widetilde P_c$ is within total variation $\beta_c$ of such a common reference law. Then
$$
\operatorname{TV}(\widetilde P_0,\widetilde P_1)
\le b:=\min\{1,\beta_0+\beta_1\},\qquad
C(\widetilde P_0,\widetilde P_1)\le b\ln2
\tag{39c.3.1}
$$
on the memoryless repetition branch. An $n$-step adaptive protocol whose complete instrument differs from its reference by at most $\varepsilon_j$ in diamond norm at step $j$, uniformly over every retained history and reference, has $\beta_c\le\frac12\sum_{j=1}^n\varepsilon_{c,j}$ for the same initial state and final reader. Initial-state and final-reader errors are added in the same norm before dividing by two.

*Proof.* For every effect $E$ on $BR$, trace preservation gives $\Lambda_c^*(I_A)=I_A$, hence
$$
\operatorname{tr}\!\left[(I_A\otimes E)(\Lambda_c\otimes\operatorname{id}_{BR})(\rho)\right]
=\operatorname{tr}[(I_A\otimes E)\rho].
$$
The triangle inequality proves the variation bound, and (39c.2.3) proves the capacity bound. For the error estimate retain the entire classical outcome history as a register. At stage $j$, replace the realized history-controlled instrument by its reference while leaving the other stages fixed. Complete trace-norm contractivity bounds the resulting final-state difference by $\varepsilon_{c,j}$, including all retained reference systems. Telescoping over the $n$ replacements gives trace distance at most $\frac12\sum_j\varepsilon_{c,j}$. The common final reader cannot increase it. Telescoping the initial preparation and final readout in the same way gives the last assertion. ∎

The entropy property in Theorem 39c.2 is a test of the proposed entropy functional: a physical horizon entropy can enter a nonzero marginal-channel bound only through a source and geometric coupling that fixes its behavior under spectator extension. Local CPTP dynamics already gives exact zero. Postulate 3's late marginal-anomaly branch has the positive-capacity classification of Theorem 39c; thermodynamic suppression of a nonzero anomaly cannot convert that branch into exact no-signaling.

**Corollary 39a.1 (Finite-Window Zero-Error Separation).** On the regular statistical branch of Definition 10.2a, branch (iii) has zero finite-window zero-error FTL capacity for every admissible pre-lightcone transcript length
$$
n\le n_{\max}=\lfloor r_{\max}L/c\rfloor,
$$
even when $P_0^{(n)}\ne P_1^{(n)}$ and hence the finite-error Jensen-Shannon information is positive.

*Proof.* For a binary context channel with equal priors and finite transcript laws $P_0^{(n)},P_1^{(n)}$, a zero-error decoder exists if and only if the two supports are disjoint. Indeed, if the supports are disjoint, the decoder assigns every transcript in $\operatorname{supp}P_0^{(n)}$ to $0$ and every transcript in $\operatorname{supp}P_1^{(n)}$ to $1$. Conversely, if there exists a transcript $y$ with
$$
P_0^{(n)}(y)>0,
\qquad
P_1^{(n)}(y)>0,
$$
then any deterministic decoder assigns $y$ to either $0$ or $1$ and is wrong with positive probability under the other context.

Definition 10.2a gives common support in the finite pre-lightcone window, so the supports are not disjoint. Theorem 39a strengthens this support statement quantitatively:
$$
P_{\mathrm{err}}^{*(n)}
=
\frac12\bigl(1-\mathrm{TV}(P_0^{(n)},P_1^{(n)})\bigr)
\ge
\frac{\Omega_n}{2}
>
0.
$$
Therefore zero-error decoding is impossible for every admissible finite $n\le n_{\max}$.

If $P_0^{(n)}\ne P_1^{(n)}$, the same theorem gives
$$
I(C;Y_B^n)
=
\mathrm{JSD}\big(P_0^{(n)},P_1^{(n)}\big)
>
0.
$$
Thus the finite-window regular branch separates two statements exactly:
$$
I(C;Y_B^n)>0
\quad\text{is allowed,}
\qquad
P_{\mathrm{err}}^{*(n)}=0
\quad\text{is excluded.}
$$
This proves only the claimed finite-window zero-error separation; Theorem 39c supplies the causal classification. ∎

<a id="remark-102b-finite-window-overlap-versus-shannon-causality"></a>**Remark 10.2b (Finite-Window Overlap Versus Shannon Causality).** The finite sample ceiling is relevant to attainable reliability, but Theorem 39c makes causal classification depend on exact context independence, not on whether zero error is reached in that window. For independent repetitions with $P_0\ne P_1$ at the per-trial level, $\Omega_n$ generically decays exponentially in $n$ at the Chernoff overlap rate of the per-trial laws; equivalently, classical Chernoff theory gives $-\log\Omega_n\sim n\,C_{\mathrm{Ch}}(P_0,P_1)$ under the usual iid regularity assumptions, with $C_{\mathrm{Ch}}>0$ when the laws are distinct and mutually absolutely continuous. Theorem 39a uses only the strict inequality $\Omega_n>0$ at the operational $n$ permitted by the pre-lightcone budget of Lemma 10.3, namely $n\le n_{\max}=\lfloor r_{\max}L/c\rfloor$. The finite-window zero-error argument therefore does not depend on uniform-in-$n$ behavior: even though $\Omega_n\to0$ as $n\to\infty$, the asymptotic regime is unreachable before ordinary causal contact, so the finite-window zero-error gate is not undermined by repetition-coding amplification.

**Definition 10.2c (Finite Predictive Current Certificate).** A finite predictive current certificate for a regular statistical branch in a finite region $\Omega$ is a tuple
$$
\mathfrak J_\Omega
=
(\mathcal E_\Omega,J_{\mathrm{pred}},s_{\mathrm{pred}},\Pi_B,\mathcal A_{\mathrm{anom}},\mathcal D_{\mathrm{erase}},\mathcal I_{\mathrm{boundary}},\Sigma_\Omega)
$$
where $\mathcal E_\Omega$ is the finite event algebra, $J_{\mathrm{pred}}$ is the signed retained update-current assignment on events and boundary faces, $s_{\mathrm{pred}}$ is the entropy-action current assignment, $\Pi_B$ is the Bob-transcript projection, and
$$
\Sigma_\Omega
:=
\sum_{e\in\mathcal E_\Omega}\Delta s_{\mathrm{pred}}(e)
\ge0
$$
is the finite entropy-production ledger. The certificate is accepted only if, for every retained finite test function $f$ on the event algebra,
$$
\langle \nabla\cdot J_{\mathrm{pred}},f\rangle
=
\langle\mathcal A_{\mathrm{anom}}-\mathcal D_{\mathrm{erase}}+\mathcal I_{\mathrm{boundary}},f\rangle,
\tag{61f}
$$
and the Bob-side marginal shift is exactly the projected current divergence,
$$
\Delta P_B
=
\Pi_B(\nabla\cdot J_{\mathrm{pred}}).
\tag{61g}
$$
On a smooth-envelope branch, (61f) is written as
$$
\nabla_\mu J^\mu_{\mathrm{pred}}
=
\mathcal A_{\mathrm{anom}}-\mathcal D_{\mathrm{erase}}+\mathcal I_{\mathrm{boundary}}
$$
only as continuum notation for the same finite event-algebra equality.

**Theorem 39b (Predictive Current No-Loop and Precision-Cost Gate).** Let a branch-(iii) statistical influence model in the finite pre-lightcone window carry both Definition 10.2a and a finite predictive current certificate $\mathfrak J_\Omega$. Assume additionally that its recorded finite current statistic $R$ is obtained from Bob's admitted transcript $Y$ through a registered stochastic kernel $K(r\mid y)$ that is the same under both Alice contexts. Then every decoder based on $R$ has strictly positive equal-prior error whenever the two laws of $Y$ have common support. Thus this processing cannot supply a zero-error context-decoding step.

If, in addition, the selected finite Markov/KMS current branch carries the thermodynamic precision certificate
$$
\frac{\operatorname{Var}(Q)}{\langle Q\rangle^2}\,\Sigma_\Omega
\ge
2
\tag{61h}
$$
for a controlled current observable $Q$ with $\langle Q\rangle\ne0$, then any nonzero finite-cost current signal has nonzero variance:
$$
\operatorname{Var}(Q)
\ge
\frac{2\langle Q\rangle^2}{\Sigma_\Omega}
>
0
\quad
\text{whenever }0<\Sigma_\Omega<\infty.
\tag{61i}
$$
Thus a deterministic zero-variance current signal with nonzero mean is inadmissible on the finite-cost branch. If the branch lacks (61h), its current law remains a transport parametrization, not a theorem-level thermodynamic precision law.

*Proof.* Write $P_c(y)$ for the admitted Bob transcript laws and $Q_c(r)=\sum_yK(r\mid y)P_c(y)$ for the current-statistic laws. Since $K$ is nonnegative and normalized,
$$
\sum_r\min\{Q_0(r),Q_1(r)\}
\ge\sum_{r,y}K(r\mid y)\min\{P_0(y),P_1(y)\}
=\Omega_n>0.
$$
The optimal equal-prior error for decoding from $R$ is half its overlap, so it is at least $\Omega_n/2$. A deterministic statistic is included by taking $K(r\mid y)=\mathbf1_{r=g(y)}$. The distribution-level current identity (61g) alone does not supply this transcript-to-statistic kernel; it is the additional operational premise above.

Assume also that the branch also supplies (61h). If $0<\Sigma_\Omega<\infty$ and $\langle Q\rangle\ne0$, multiplying (61h) by $\langle Q\rangle^2/\Sigma_\Omega$ gives (61i). Therefore a nonzero mean current at finite entropy cost cannot have zero variance. If $\Sigma_\Omega=0$, (61h) is incompatible with $\langle Q\rangle\ne0$; if $\Sigma_\Omega=\infty$, the event is not in the finite-cost branch. These alternatives exhaust the finite-current certificate cases. ∎

<a id="proposition-39d-canonical-finite-algebraic-current-realization-and-independence-of-the-supportkms-gates"></a>**Proposition 39d (Canonical Finite Algebraic Current Realization and Independence of the Support/KMS Gates).** Let $p$ and $q$ be probability laws on a finite alphabet $Y$, and put $\Delta(y)=q(y)-p(y)$. Write
$$
Y_+=\{y:\Delta(y)>0\},
\qquad
Y_-=\{y:\Delta(y)<0\},
\qquad
s=\sum_{y\in Y_+}\Delta(y).
$$
If $s=0$, set $J=0$. If $s>0$, orient the complete bipartite graph from $Y_-$ to $Y_+$ and set
$$
J_{xy}:=\frac{[-\Delta(x)]\Delta(y)}{s}
\qquad(x\in Y_-,\ y\in Y_+).
\tag{61k}
$$
With divergence defined as inflow minus outflow, $\nabla\!\cdot J=\Delta$. Thus every finite marginal displacement has a nonnegative algebraic divergence-current realization, and any two such realizations of the same displacement differ by a signed divergence-free circulation after extension to a common edge set.

Algebraic current realizability does not imply common support. For
$$
p=(1,0),\qquad q=(0,1),
$$
Equation (61k) gives one unit of current from the first symbol to the second, while the supports are disjoint. Nor do a stationary law and its zero marginal displacement select a Markov clock: for every $a>0$,
$$
L_a=a
\begin{pmatrix}
-1&1\\
1&-1
\end{pmatrix}
$$
is reversible with stationary law $(1/2,1/2)$, but its physical relaxation rate is $2a$. Consequently an algebraic current certificate cannot by itself establish Definition 10.2a common support, select the physical Markov/KMS generator, or supply the thermodynamic precision relation (61h).

*Proof.* Since $\sum_y\Delta(y)=0$, the total positive and negative masses are both $s$. For $y\in Y_+$,
$$
\sum_{x\in Y_-}J_{xy}
=\frac{\Delta(y)}s\sum_{x\in Y_-}[-\Delta(x)]
=\Delta(y).
$$
For $x\in Y_-$,
$$
-\sum_{y\in Y_+}J_{xy}
=-[-\Delta(x)]
=\Delta(x),
$$
and the divergence vanishes on the remaining symbols. The difference of two solutions has zero divergence by linearity. The displayed two-point laws prove the support counterexample. Direct multiplication gives $(1/2,1/2)L_a=0$ and detailed balance for every $a>0$, while the nonzero eigenvalue is $-2a$; hence the stationary/algebraic-current record does not fix the clock normalization. ∎

<a id="theorem-39e-common-support-driven-ring-markovkms-current-carrier"></a>**Theorem 39e (Common-Support Driven-Ring Markov/KMS Current Carrier).** Let $d\ge3$ and let one thermal reservoir be in its equilibrium (KMS) state at inverse temperature $\beta>0$. Bob's registered record is the position $X_\tau\in\mathbb Z_d$, at a registered time $\tau>0$, of a continuous-time Markov jump process on the ring $\mathbb Z_d$ with degenerate site energies, prepared at $X_0=0$ in the shared past. Alice's late context $x\in\{0,1\}$ selects, through the branch-(iii) response law posited by Postulate 3, the generator $L_x$ whose clockwise and counterclockwise jump rates at every site are $k_+^{(x)}>0$ and $k_-^{(x)}>0$, subject to local detailed balance with respect to that reservoir,
$$
\ln\frac{k_+^{(x)}}{k_-^{(x)}}=\beta w_x,
\tag{61l}
$$
where $w_x$ is the work delivered to the reservoir by one clockwise step under context $x$. The KMS state belongs to the reservoir and enters through (61l); the ring is a driven Markov system: for $w_x\ne0$ its single cycle has affinity $d\beta w_x\ne0$, $L_x$ violates global detailed balance, and its stationary law, uniform on $\mathbb Z_d$, carries the current $(k_+^{(x)}-k_-^{(x)})/d$ through every edge. Write $p_x(t)=e^{tL_x}\delta_0$ and $p_x:=p_x(\tau)$, and for the edge $e_i=(i\to i+1)$ put
$$
J_x(e_i):=\int_0^\tau\Bigl[k_+^{(x)}p_x(t)(i)-k_-^{(x)}p_x(t)(i+1)\Bigr]dt .
$$
Let $Q$ be the net number of clockwise jumps in $[0,\tau]$. Then:

1. $p_x(i)>0$ for every $i\in\mathbb Z_d$ and both contexts. For $n$ trials with fresh preparations and any sequence of per-trial contexts, every transcript in $\mathbb Z_d^{\,n}$ has positive probability, so Definition 10.2a holds for every $n$.
2. With divergence taken as inflow minus outflow, $\nabla\!\cdot J_x=p_x-\delta_0$. Hence $J_{\mathrm{pred}}:=J_1-J_0$ satisfies $\nabla\!\cdot J_{\mathrm{pred}}=p_1-p_0$, which is (61g) with $\Pi_B$ the identity on Bob's ring record, and (61f) holds on the event algebra generated by the $d$ sites and $d$ edges with $\mathcal A_{\mathrm{anom}}=p_1-p_0$ and $\mathcal D_{\mathrm{erase}}=\mathcal I_{\mathrm{boundary}}=0$. Moreover $\sum_iJ_x(e_i)=\langle Q\rangle_x$, so $Q$ is the counting observable of the registered current.
3. Under context $x$ and for every initial law, $Q=\mathcal N_+-\mathcal N_-$ with independent Poisson counts of means $k_\pm^{(x)}\tau$; hence
$$
\langle Q\rangle_x=\bigl(k_+^{(x)}-k_-^{(x)}\bigr)\tau,
\qquad
\operatorname{Var}_x(Q)=\bigl(k_+^{(x)}+k_-^{(x)}\bigr)\tau .
$$
4. Put $\Delta s_{\mathrm{pred}}(e_i):=\beta w_1J_1(e_i)$. Then $\Sigma_\Omega=\sum_i\Delta s_{\mathrm{pred}}(e_i)=\beta w_1\langle Q\rangle_1\ge0$ is the reservoir entropy production of the context-$1$ law, and if $r:=k_+^{(1)}/k_-^{(1)}\ne1$,
$$
\frac{\operatorname{Var}_1(Q)}{\langle Q\rangle_1^2}\,\Sigma_\Omega
=\frac{(r+1)\ln r}{r-1}>2 .
\tag{61m}
$$
Thus (61h) holds for the controlled current $Q$ on the same law that carries the registered current, and it holds a fortiori for the total entropy production $\Sigma_\Omega+H(p_1)$, where $H$ is Shannon entropy in nats.
5. For $d=3$, $k_\pm^{(0)}=k$, $k_+^{(1)}=2k$, $k_-^{(1)}=k$ and $k\tau=1$, one has $p_0(1)=p_0(2)$ and
$$
p_1(1)-p_1(2)=\frac{2}{\sqrt3}\,e^{-9/2}\sin\frac{\sqrt3}{2}>0,
$$
so $p_1\ne p_0$, and the ratio in (61m) equals $3\ln2$.

Hence one finite carrier with a registered clock $(k_\pm^{(x)},\tau)$ populates Definition 10.2a, the current identities (61f)--(61g) and the precision certificate (61h) from one Markov law.

*Proof.* Write $L_x=-cI+M_x$ with $c=k_+^{(x)}+k_-^{(x)}$ and $M_x\ge0$ entrywise. The $(i,0)$ entry of $M_x^i$ is at least $(k_+^{(x)})^i>0$, so the series $e^{\tau L_x}=e^{-c\tau}\sum_m\tau^mM_x^m/m!$ has positive $(i,0)$ entry for every $i$. Fresh independent trials multiply these positive probabilities, which proves item 1. Under the uniform law every site has inflow and outflow $(k_+^{(x)}+k_-^{(x)})/d$, so that law is stationary, and it is the unique stationary law because $L_x$ is irreducible. Detailed balance with respect to it would require $k_+^{(x)}=k_-^{(x)}$, that is $w_x=0$, and by (61l) the cycle affinity $\ln\bigl[(k_+^{(x)}/k_-^{(x)})^d\bigr]$ equals $d\beta w_x$.

The master equation reads $\dot p_x(t)(i)=j_x(e_{i-1},t)-j_x(e_i,t)$, where $j_x(e_i,t)$ is the integrand defining $J_x(e_i)$. Integration over $[0,\tau]$ gives $\nabla\!\cdot J_x=p_x-\delta_0$, and subtraction of the two contexts gives item 2's divergence identity; the stated source assignment makes (61f) the same identity. Summing the integrand over the edges gives $(k_+^{(x)}-k_-^{(x)})\sum_ip_x(t)(i)=k_+^{(x)}-k_-^{(x)}$, and item 3 identifies the time integral with $\langle Q\rangle_x$.

For item 3, let $\mathcal N_\pm$ be independent Poisson processes of rates $k_\pm^{(x)}$ and set $X_t=X_0+\mathcal N_+(t)-\mathcal N_-(t)\bmod d$. Every site has the same outgoing rates, so $X$ is a Markov jump process with generator $L_x$ whose jumps are exactly the Poisson events. Uniqueness of the law of a finite Markov chain with given generator and initial law identifies $Q$ with $\mathcal N_+(\tau)-\mathcal N_-(\tau)$, whose mean and variance are the displayed ones.

Each clockwise jump transfers $w_1$ to the reservoir and each counterclockwise jump returns it, so by (61l) the expected reservoir entropy production is $\beta w_1\langle Q\rangle_1=(k_+^{(1)}-k_-^{(1)})\tau\ln r\ge0$; item 2 identifies it with $\sum_i\Delta s_{\mathrm{pred}}(e_i)$. Substitution of item 3 gives the equality in (61m). For $\phi(r)=(r+1)\ln r-2(r-1)$ one has $\phi(1)=0$ and $\phi'(r)=\ln r+r^{-1}-1>0$ for $r\ne1$, so $\phi(r)/(r-1)>0$ for every $r\ne1$, which is the strict inequality. Since the preparation is a point mass, the Shannon entropy of Bob's record increases by $H(p_1)\ge0$, which proves the total-entropy statement.

For $d=3$ the generator is circulant with eigenvalues $\lambda_m=k_+(\omega^m-1)+k_-(\omega^{-m}-1)$, $\omega=e^{2\pi i/3}$, and Fourier inversion gives
$$
p(1)-p(2)=\frac{2}{\sqrt3}\operatorname{Im}e^{\tau\lambda_1}
=\frac{2}{\sqrt3}\,e^{-\frac32(k_++k_-)\tau}\sin\!\Bigl(\frac{\sqrt3}{2}(k_+-k_-)\tau\Bigr).
$$
The context-$0$ rates give zero, and the context-$1$ rates with $k\tau=1$ give the displayed positive value. Finally $(r+1)\ln r/(r-1)=3\ln2$ at $r=2$. ∎

<a id="lemma-103-pre-lightcone-information-budget-and-sampling-gate"></a>**Lemma 10.3 (Pre-Lightcone Information Budget and Sampling Gate).** Let
$$
N_{\mathrm{pre}}:=\left\lfloor r_{\max}\frac{L}{c}\right\rfloor
$$
be the maximum number of trials available before a light signal can cross separation $L$. Let $p$ and $q$ be the two per-trial Bob laws, set $B_{01}:=\|p-q\|_1$, and assume $m_0:=\min_i(p_i+q_i)/2>0$. Assume the trials are conditionally independent given the equiprobable binary context and have the same conditional laws $p,q$. Then
$$
I(C;Y_B^{N_{\mathrm{pre}}})
\le
N_{\mathrm{pre}}I(C;Y_B)
\le
N_{\mathrm{pre}}\frac{B_{01}^2}{4m_0}.
$$
If $p$ and $q$ are separately within CC distances $c_0,c_1$ of the same Born law, then $B_{01}\le2(c_0+c_1)$ and
$$
I(C;Y_B^{N_{\mathrm{pre}}})
\le
N_{\mathrm{pre}}\frac{(c_0+c_1)^2}{m_0}.
$$
A decoder with error probability at most $\alpha_{\mathrm{err}}\in(0,1/2)$ must satisfy, in nats,
$$
I(C;Y_B^{N_{\mathrm{pre}}})
\ge
(\ln2)\bigl[1-h_2(\alpha_{\mathrm{err}})\bigr],
$$
where $h_2$ retains the bits convention fixed earlier in this section.
For the symmetric Bernoulli design with parameter $\delta$, Lemma 10.1 additionally gives the necessary gate
$$
N_{\mathrm{pre}}
\ge
\frac{\ln\!\big(1/[4\alpha_{\mathrm{err}}(1-\alpha_{\mathrm{err}})]\big)}{-\ln(1-4\delta^2)},
$$
while
$$
N_{\mathrm{pre}}
\ge
\frac{\ln(1/\alpha_{\mathrm{err}})}{2\delta^2}
$$
is sufficient for the majority decoder.

*Proof.* Conditional independence gives
$$
I(C;Y_B^{N_{\mathrm{pre}}})
=
\sum_{j=1}^{N_{\mathrm{pre}}}I(C;Y_{B,j}\mid Y_{B,1:j-1}).
$$
For each $j$,
$$
I(C;Y_{B,j}\mid Y_{B,1:j-1})
=H(Y_{B,j}\mid Y_{B,1:j-1})-H(Y_{B,j}\mid C)
\le H(Y_{B,j})-H(Y_{B,j}\mid C)
=I(C;Y_{B,j}),
$$
so the total information is at most $N_{\mathrm{pre}}I(C;Y_B)$. Theorem 41 bounds the per-trial term by $B_{01}^2/(4m_0)$. The triangle inequality and Theorem 36 give $B_{01}\le2(c_0+c_1)$.

For any estimate $\widehat C$ based on the transcript, binary Fano inequality gives, in nats,
$$
H(C\mid Y_B^{N_{\mathrm{pre}}})
\le H(C\mid\widehat C)
\le(\ln2)h_2(P_e).
$$
Since $H(C)=\ln2$ and $h_2$ is increasing on $[0,1/2]$, $P_e\le\alpha_{\mathrm{err}}$ implies $I(C;Y_B^{N_{\mathrm{pre}}})\ge(\ln2)[1-h_2(\alpha_{\mathrm{err}})]$. The two Bernoulli sampling statements are exactly Lemma 10.1 with $N=N_{\mathrm{pre}}$. ∎

**Scope note.** The finite-window budget above is a Fano and sampling gate for the CC branch. It is not an information-causality axiom for arbitrary no-signaling boxes. The quantum CHSH/Tsirelson boundary, when invoked, must be supplied by the Hilbert/Born operator structure of Section 8, while branch-(iii) CC claims remain governed by Theorems 39a-42 and their protocol certificates.

**10.3.2 Quantum Communication Protocol (QCP)**

QCP is a pre-agreed decision protocol built from context-dependent statistical correlations. Branch (iii) is QCP's testable statistical-FTL hypothesis. On that branch, Alice's independently chosen context changes Bob's pre-lightcone marginal, defining a noisy channel with positive capacity and therefore genuine statistical FTL communication. A certified and replicated detection would establish that channel, support the QCP hypothesis, and falsify exact operational no-signaling. Theorem 40 supplies the sample-complexity scale, Theorem 41 bounds the finite-error information rate, and Theorems 39a and 42 exclude finite-window zero-error decoding and contradiction protocols; none makes a positive-capacity channel noncommunicating. On the marginal-invariant or shared-past branches, the procedure changes only joint or conditional statistics and creates no pre-lightcone message channel.

<a id="definition-qcp"></a>**Definition (QCP).** Alice and Bob share many copies of a fixed entangled state. They agree on a binary mapping between **Alice’s context** $C\in\{\mathrm A,\mathrm B\}$ and a **target local measurement bias** for Bob's outcomes (Appendix L): if $C=\mathrm A$, Alice adopts an internal state $\mathrm{context}_S$ and applies the associated physical control $\mathcal M(\mathrm{context}_S)$ intended to bias Bob's local outcome toward "spin up"; if $C=\mathrm B$, she adopts the corresponding context and control intended to bias toward “spin down.” Bob measures each partner in the pre-agreed basis and uses the single-shot rule: choose Strategy A if he observes “spin up,” Strategy B if “spin down.”

**One-shot marginal neutrality in the balanced mixture.** With equiprobable contexts $P(C=\mathrm A)=P(C=\mathrm B)=\tfrac12$ and the symmetric targeting convention $P(\uparrow\mid\mathrm A)=p+\delta$, $P(\uparrow\mid\mathrm B)=p-\delta$, a single trial after averaging over the context has marginal $P(\uparrow)=p$. This equality does not by itself make a multi-trial raw stream indistinguishable from baseline: if one context is retained across a block, the resulting mixture generally has detectable inter-trial correlations. Stream-level neutrality requires an explicit joint-law certificate matching the baseline process. A sufficient special case is that contexts are independently randomized on every trial and, conditional on those contexts, the response variables are memoryless and independent with the displayed one-trial laws. If contexts are imbalanced on a trial, the one-shot marginal shift is
$$
\Delta p=
\bigl(P(C=\mathrm A)-P(C=\mathrm B)\bigr)\delta,
$$
and any channel or mutual-information conclusion remains subject to the joint protocol hypotheses of Theorems 40–42.
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

<a id="lemma-101-pre-lightcone-decoding-gates"></a>**Lemma 10.1 (Pre-Lightcone Decoding Gates).**
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
Assume Alice's equiprobable binary context is held constant across the block of $N$ observations and that, conditional on that context, Bob's observations are independent with the corresponding Bernoulli law above. For $0<\alpha_{\mathrm{err}}<1/2$, any decoder with equal-prior error probability at most $\alpha_{\mathrm{err}}$ must satisfy the necessary Bhattacharyya gate
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

**AQFT boundary.** Conditional on the continuum-bridge hypotheses of Appendix F, Corollary F.1 encodes operator locality and, together with local CPTP implementation, yields exact marginal no-signaling. On that branch, context dependence carried by a globally prepared state $\omega_C$, including Alice's CC-modulated control $\mathcal M(\text{context}_S)$, may change joint or conditional statistics as in Equation (F.4), while Bob's marginal remains invariant as in Equation (F.4a); shared-past preparation dependence is a common-cause case. Branch-(iii) QCP is the beyond-AQFT response law in which Alice's late choice shifts Bob's marginal. For a branch-(iii) response law satisfying the balanced binary conditions $p=\tfrac12$ and $\delta\le\kappa\,\mathrm{CC}$, Theorem 41 gives the exact envelope
$$
I(C;Y)\le4(\kappa\,\mathrm{CC})^2
$$
nats/trial, with perturbative leading behavior $I(C;Y)=2\delta^2+O(\delta^4)$ for the symmetric Bernoulli channel. This statistical influence cannot be shaped into deterministic, pre-lightcone zero-error signals on the regular finite-window branch; finite-window zero-error decoding remains excluded by Theorem 39a and Theorem 42, while Theorem 39c classifies any nonzero pre-lightcone context channel as signaling. **Appendix F** supplies the conditional local-AQFT baseline; the regular branch-(iii) finite-window analysis is given in this section.

**No‑signaling equalities.** Assume the Appendix F continuum hypotheses and let each local measurement setting be represented by a nonselective trace-preserving instrument. Then, for all local settings $x,x'$ and $y,y'$ and outcomes $a,b$,
$$
\sum_aP(a,b\mid x,y)=P(b\mid y),
\qquad
\sum_bP(a,b\mid x,y)=P(a\mid x).
$$

*Proof.* Let the nonselective Alice instrument for setting $x$ have Kraus operators $A_{a,r}^{x}\in\mathcal A(O_A)$ satisfying
$$
\sum_{a,r}(A_{a,r}^{x})^\dagger A_{a,r}^{x}=I.
$$
For a Bob effect $F_b^y\in\mathcal A(O_B)$, microcausality gives $[A_{a,r}^{x},F_b^y]=0$. Therefore, for the joint state $\omega$,
$$
\sum_aP(a,b\mid x,y)
=
\sum_{a,r}\omega\!\left((A_{a,r}^{x})^\dagger F_b^yA_{a,r}^{x}\right)
=
\omega\!\left(F_b^y\sum_{a,r}(A_{a,r}^{x})^\dagger A_{a,r}^{x}\right)
=
\omega(F_b^y),
$$
which is independent of $x$. Interchanging Alice and Bob proves the second equality. Outcome-selected conditional states are not covered by this nonselective marginal statement. ∎

**Physical self-limitation.** Appendix S defines a conditional feedback model. Assume the constitutive power law
$$
P_{\text{context}}(\mathrm{CC})
=
A\!\left[\frac{\mathrm{CC}}{\alpha_{CC,max}-\mathrm{CC}}\right]^2,
\qquad
\alpha_{CC,max}<\tfrac12,
$$
the retained-energy source relation $E_{\mathrm{grav}}^{\mathrm{inst}}=\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c$ with $0<\eta_{\mathrm{ret}}\le1$, and the weak-field geometry yielding $\Delta\tau_d=K P_{\mathrm{context}}$ in the registered operating interval. A tracked deterministic proper-time difference produces a coherent relative phase and does not by itself reduce CC. If a calibrated unresolved-phase or stochastic ensemble supplies the small-response attenuation law of Equation (S.21), then $\mathrm{CC}_{\mathrm{eff}}$ is reduced to first order in $K_{\mathrm{eff}}P_{\mathrm{context}}$. On the separate saturated ND-RID response branch, the registered chronometric model gives $\Gamma_{\mathrm{ch}}^{(ij)}=(|\Delta E_{ij}|/\hbar)K_{\mathrm{eff}}P_{\mathrm{context}}$. These conclusions apply only while the retention, weak-field, and response certificates remain valid.

**10.4 Consistency Analysis: Statistical Influence vs. Causality**

The framework must distinguish finite-window reliability from causal status: by Theorem 39c, an independently selectable statistical FTL marginal channel lies outside the exact causal branch of Postulate 2, as the branch-(iii) alternative, even where Theorem 39a excludes its zero-error use. This analysis relies on the limits imposed by the CC bound and the nature of the information transfer.

<a id="1041-theorem-40-sufficient-sample-size-for-the-direct-two-context-test"></a>**10.4.1 Theorem 40 (Sufficient Sample Size for the Direct Two-Context Test)**

Let $p_0(b)$ and $p_1(b)$ be Bob's marginal probabilities for one event $b$ under two Alice contexts, and set $\Delta:=|p_1(b)-p_0(b)|>0$. Suppose the two samples consist of $n$ independent Bernoulli trials under each context. For the decision rule $|\hat p_1-\hat p_0|>\Delta/2$, total sample size $N=2n$ satisfying
$$
N \ge \frac{16}{\Delta^2}\ln\!\left(\frac{4}{\alpha_{\mathrm{det}}}\right)\quad \text{(62)}
$$
is sufficient to make both the false-positive probability under $p_0=p_1$ and the missed-detection probability under $|p_1-p_0|=\Delta$ at most $\alpha_{\mathrm{det}}$. Thus this test has the sufficient scaling
$$
N=O\!\left(\frac{\log(1/\alpha_{\mathrm{det}})}{\Delta^2}\right).
$$
If the two context laws are separately within operational CC distances $c_0$ and $c_1$ of the same Born baseline, then
$$
\Delta\le c_0+c_1.
$$
For the symmetric QCP with $|\delta|\le\kappa c$ in both contexts, $\Delta=2|\delta|\le2\kappa c$.

*Proof.* Under the null $p_0=p_1=p$, the event $|\hat p_1-\hat p_0|>\Delta/2$ implies that at least one sample mean differs from $p$ by at least $\Delta/4$. The two-sided Hoeffding inequality (Hoeffding 1963) and a union bound give
$$
\mathbb P_{H_0}(\text{false positive})\le4e^{-n\Delta^2/8}.
$$
Under the alternative, take $p_1-p_0=\Delta$ without loss of generality. If both $|\hat p_j-p_j|<\Delta/4$, then
$$
\hat p_1-\hat p_0>(p_1-\Delta/4)-(p_0+\Delta/4)=\Delta/2,
$$
so the same inequality gives
$$
\mathbb P_{H_1}(\text{missed detection})\le4e^{-n\Delta^2/8}.
$$
The displayed condition on $N=2n$ makes each bound at most $\alpha_{\mathrm{det}}$. Finally, for the Born baseline law $b$,
$$
\Delta\le\mathrm{TV}(p_0,p_1)
\le\mathrm{TV}(p_0,b)+\mathrm{TV}(b,p_1)
\le c_0+c_1,
$$
and the symmetric specialization follows by substitution. ∎

<a id="1042-theorem-41-finite-error-information-rate-exact-envelope-and-perturbative-constant"></a>**10.4.2 Theorem 41 (Finite-Error Information Rate: Exact Envelope and Perturbative Constant)**

Let $p=P_{B\mid A=0}$ and $q=P_{B\mid A=1}$ be Bob's outcome distributions for an equal-prior binary context. Define
$$
M=\frac12(p+q),
\qquad
m_0:=\min_iM_i>0,
\qquad
B_{01}:=\|p-q\|_1.
$$
Then
$$
I(A;B)
=
\mathrm{JSD}(p,q)
\le
\frac{1}{4m_0}\|p-q\|_2^2
\le
\frac{B_{01}^2}{4m_0}.
\tag{63}
$$
If $p$ and $q$ are deformations of the same Born law $b$ under two contexts with $c_j:=\mathrm{CC}(S_j)$, then
$$
B_{01}\le2(c_0+c_1),
\qquad
I(A;B)\le\frac{(c_0+c_1)^2}{m_0}.
$$
In particular, $c_0,c_1\le c$ gives $I(A;B)\le4c^2/m_0$. In the perturbative regime $B_{01}/m_0\to0$,
$$
I(A;B)
=
\frac18\sum_i\frac{(q_i-p_i)^2}{M_i}
+
O\!\left(\frac{B_{01}^3}{m_0^2}\right),
$$
and hence
$$
I(A;B)
\le
\frac{B_{01}^2}{8m_0}
+
O\!\left(\frac{B_{01}^3}{m_0^2}\right).
\tag{63a}
$$
For binary outputs, the leading quadratic upper bound in (63a) is also a non-perturbative consequence of (63).

*Proof.* Equal priors give
$$
I(A;B)=\frac12D(p\|M)+\frac12D(q\|M).
$$
The inequality $\ln x\le x-1$ yields
$$
D(p\|M)
\le
\sum_i\frac{(p_i-M_i)^2}{M_i}
=
\frac14\sum_i\frac{(p_i-q_i)^2}{M_i},
$$
and the same bound holds for $D(q\|M)$. Consequently
$$
I(A;B)
\le
\frac14\sum_i\frac{(p_i-q_i)^2}{M_i}
\le
\frac{1}{4m_0}\|p-q\|_2^2
\le
\frac{B_{01}^2}{4m_0}.
$$
For two deformations of a common Born law $b$, Theorem 36 and the triangle inequality give
$$
\frac12B_{01}=\mathrm{TV}(p,q)
\le\mathrm{TV}(p,b)+\mathrm{TV}(b,q)
\le c_0+c_1,
$$
which proves the context-budget bounds.

For the perturbative expansion, put $\Delta=q-p$, so $p=M-\Delta/2$ and $q=M+\Delta/2$. Expanding each scalar term about $\Delta_i=0$ gives
$$
\frac12\left[
\left(M_i-\frac{\Delta_i}{2}\right)\ln\left(1-\frac{\Delta_i}{2M_i}\right)
+
\left(M_i+\frac{\Delta_i}{2}\right)\ln\left(1+\frac{\Delta_i}{2M_i}\right)
\right]
=
\frac{\Delta_i^2}{8M_i}
+
O\!\left(\frac{|\Delta_i|^3}{M_i^2}\right).
$$
Summing and using $M_i\ge m_0$ gives the displayed remainder because $\sum_i|\Delta_i|^3\le B_{01}^3$. Also,
$$
\frac18\sum_i\frac{\Delta_i^2}{M_i}
\le\frac{B_{01}^2}{8m_0}.
$$
For two outcomes, $\Delta_1=-\Delta_2$, so $\|\Delta\|_2^2=B_{01}^2/2$; substituting this identity into (63) gives $I(A;B)\le B_{01}^2/(8m_0)$ without a small-bias assumption. ∎

<a id="1043-theorem-42-finite-window-zero-error-loop-exclusion-and-shannon-causality-boundary"></a>**10.4.3 Theorem 42 (Finite-Window Zero-Error Loop Exclusion and Shannon-Causality Boundary)**

The hypothesized statistical FTL influence (Postulate 3), when constrained by the independently declared bounded-bias ceiling and Theorem 39's endpoint-complete consequence, the zero-error gate of Theorem 39a on the regular finite-window branch (Definition 10.2a), the predictive-current no-loop and precision-cost gate of Theorem 39b whenever a current certificate is asserted, and the finite-window sampling bounds of Theorems 40–41, cannot realize a finite-window zero-error contradiction protocol. This is weaker than Postulate 2: if its freely selected context changes a pre-lightcone marginal, Theorem 39c classifies it as signaling despite the nonzero decoder error. This holds for any decoder $\mathcal D$ acting on a finite pre-lightcone transcript in the regular operating regime.

*Proof:*
1.  **Registered zero-error decoding requirement:** A zero-error contradiction protocol in this theorem means a registered construction that requires recovering an independently selected context with error probability zero before ordinary causal contact. The conclusion concerns this required decoding step. It does not establish chronology consistency for every stochastic spacetime feedback model.
2.  **Endpoint exclusion (bounded-bias branch and Theorem 39):** The branch independently declares $\alpha_{CC,max}<1/2$, and Theorem 39 proves that this excludes forcing both deterministic endpoints of a binary coarse-graining. Thus an endpoint-complete one-shot message alphabet cannot be obtained on this branch; the theorem does not exclude every one-endpoint protocol.
3.  **Finite-window zero-error exclusion (Theorem 39a, regular branch):** On branch (iii), Bob's marginal may depend on Alice's late context, so the ordinary Shannon information of Bob's record may be positive. However, on the regular finite-window branch (Definition 10.2a), every finite pre-lightcone transcript retains positive overlap between the two context-conditioned laws, so every decoder has strictly positive error probability:
    $$
    P_{\mathrm{err}}\ge\Omega_n/2>0.
    $$
    By Remark 10.2b, the relevant $n$ is bounded by the pre-lightcone budget of Lemma 10.3, so asymptotic overlap decay does not undermine this gate. Step 3 alone suffices to exclude the deterministic/zero-error decoding step needed for a zero-error contradiction protocol; this is weaker than Postulate 2; Steps 4–6 supply complementary quantitative bounds.
4.  **Predictive-current gate (Theorem 39b, when asserted):** If the current record is obtained from Bob's admitted transcript through the same registered stochastic kernel under both contexts, its overlap is at least that of the transcript. It therefore cannot supply a zero-error decoder. On branches carrying the separate thermodynamic precision certificate, a nonzero finite-cost current signal also has nonzero variance.
5.  **Sample and rate bounds (Theorems 40–41):** Theorem 40 gives the direct two-context test's sample-complexity scale for resolving a small branch-(iii) effect at a chosen nonzero error tolerance. Theorem 41 upper-bounds the finite-error mutual information rate by $O(\mathrm{CC}^2)$ at a regular operating point. Lemma 10.3 bounds the mutual information that can be accumulated before an ordinary light signal crosses the separation. These are statistical-detection limits, not deterministic-message constructions.
6.  **Conclusion for the registered construction:** Since the required finite-window zero-error decoder does not exist on this branch, a loop construction requiring that decoder cannot be implemented there. Whether a different stochastic feedback or spacetime model admits a consistent law requires its own causal and dynamical premises. The distributional consistency result for a finite channel-policy closure is stated separately in Proposition 42c.

**Branch-by-branch closing summary.** Two versions of the proposal preserve ordinary causality: one leaves the remote outcome distribution unchanged, and the other reflects a shared earlier cause. A freely chosen late setting that changes a remote outcome distribution before light could arrive would instead create a noisy faster-than-light channel that departs from exact no-signaling but still cannot deliver a message with certainty; a replicated detection would select this third version, and a null result would keep ordinary causality.

**Technical ledger.**

The branches of Postulate 3 have distinct causal statuses under Theorem 39c: branch (i) by Lemma 10.2 and the standard no-signaling theorem (Bob's marginal is invariant); branch (ii) by absence of any late controllable Alice variable after the shared causal past, so no pre-lightcone message channel exists at all; branch (iii) is outside Postulate 2 whenever a freely selectable late context changes Bob's pre-lightcone marginal, although Theorems 39a and 39b still bound its finite-window zero-error reliability and current representation. Therefore branches (i) and (ii) can satisfy Postulate 2 for the stated reasons; branch (iii) lies outside Postulate 2's exact causal branch despite its finite-window zero-error limitation, and a late-randomized marginal test decides between the two. ∎

<a id="proposition-42c-finite-stochastic-feedback-has-a-distributional-fixed-point"></a>**Proposition 42c (Finite Stochastic Feedback Has a Distributional Fixed Point).** Let $W(y\mid x)$ be a finite channel and let $P(x'\mid y)$ be a finite feedback policy. Closing the output through the policy gives the stochastic transition matrix
$$
T(x'\mid x)=\sum_yP(x'\mid y)W(y\mid x).
\tag{63b}
$$
There exists at least one probability law $\pi$ satisfying $\pi=T\pi$. Hence positive Shannon capacity of $W$ does not by itself create a probabilistic inconsistency. A deterministic-symbol contradiction requires the stronger condition that the closed loop occupy a point mass $\delta_x$ while the deterministic transition has no fixed symbol.

The binary bit-flip channel $W(y\mid x)=\mathbf 1_{y=1-x}$ with the identity feedback policy has capacity one bit and has no deterministic fixed symbol, yet $\pi=(1/2,1/2)$ is stationary. This class is therefore chronology-consistent at the distributional level while failing the point-mass consistency test. Intervention-stable prediction of a receiver policy is a stronger object governed by Theorem 14.1.

*Proof.* Equation (63b) is stochastic because its entries are nonnegative and
$$
\sum_{x'}T(x'\mid x)
=\sum_yW(y\mid x)\sum_{x'}P(x'\mid y)
=1.
$$
Choose any probability vector $\mu$ and set $\mu_N=N^{-1}\sum_{j=0}^{N-1}T^j\mu$. Each $\mu_N$ lies in the compact probability simplex, and
$$
T\mu_N-\mu_N=\frac{T^N\mu-\mu}{N},
\qquad
\|T\mu_N-\mu_N\|_1\le\frac2N.
$$
A subsequence converges to a probability vector $\pi$. Continuity of matrix multiplication then gives $T\pi=\pi$. For a deterministic transition, $T\delta_x=\delta_x$ holds exactly when the transition sends $x$ to itself. The bit-flip sends $(1/2,1/2)$ to itself while sending each point mass to the other symbol, proving the stated separation. ∎

<a id="proposition-42c1-finite-memory-and-continuous-policy-loop-classification"></a>**Proposition 42c.1 (Finite-Memory and Continuous-Policy Loop Classification).** Let $H$ be a finite history alphabet. Every fixed finite-memory channel-policy closure induces a stochastic matrix on $H$ and therefore has a stationary history law. More generally, if an adaptive policy induces a continuous map
$$
F:\Delta(H)\longrightarrow\Delta(H),
$$
then it has a distributional fixed point. Continuity is a substantive gate: on $H=\{0,1\}$, writing $q=\Pr(1)$, the policy map
$$
F(q)=
\begin{cases}
1,&q<1/2,\\
0,&q\ge1/2
\end{cases}
\tag{63f}
$$
has no fixed point.

*Proof.* A finite-memory closure becomes first-order after lifting the state to the finite history alphabet. Its transition matrix maps the compact probability simplex continuously into itself, so Proposition 42c applies. An adaptive continuous $F$ has a fixed point by the finite-dimensional Brouwer theorem. For (63f), a putative fixed point with $q<1/2$ would satisfy $q=1$, while one with $q\ge1/2$ would satisfy $q=0$; both are contradictions. ∎

<a id="proposition-42c2-regularized-order-monotone-and-higher-order-loop-classification"></a>**Proposition 42c.2 (Regularized, Order-Monotone and Higher-Order Loop Classification).** Let $K$ be a nonempty compact convex subset of a locally convex Hausdorff space and let $F:K\to K$ be an arbitrary policy-closure map. Define its closed convex regularization
$$
\bar F(\pi):=\bigcap_{U\ni\pi}\overline{\operatorname{conv}}\,F(U),
\tag{63j}
$$
where $U$ ranges over the neighborhoods of $\pi$ in $K$. Then:

1. $\bar F$ has closed graph and nonempty compact convex values, $F(\pi)\in\bar F(\pi)$, and $\bar F(\pi)=\{F(\pi)\}$ at every continuity point of $F$. Its fixed set $\operatorname{Fix}\bar F=\{\pi:\pi\in\bar F(\pi)\}$ is nonempty and compact.
2. $\operatorname{Fix}F\subseteq\operatorname{Fix}\bar F$, and every continuity point of $F$ in $\operatorname{Fix}\bar F$ belongs to $\operatorname{Fix}F$. Hence, if $F$ has no fixed point, every regularized fixed point is a discontinuity point $\pi$ of $F$ with $F(\pi)\ne\pi$.
3. If $K=\Delta(H)$ with $|H|=n$, then $\bar F(\pi)=\operatorname{conv}\mathcal L_F(\pi)$ for the cluster set $\mathcal L_F(\pi)=\bigcap_{U\ni\pi}\overline{F(U)}$, and every $\pi\in\operatorname{Fix}\bar F$ is a convex combination of at most $n$ cluster values. A policy that, at $\pi$, randomizes among those cluster values with these weights has $\pi$ as a consistent law.
4. Items 1--3 cover $k$th-order recursions $\pi_{t+1}=F(\pi_t,\ldots,\pi_{t-k+1})$ on $\Delta(H)$, whose stationary laws are exactly the fixed points of the diagonal map $G(\pi)=F(\pi,\ldots,\pi)$, and items 1--2 cover second-order policies on $K=\Delta(\Delta(H))$ with the weak* topology. In both cases a continuous policy has an exact fixed point.
5. Let $H=\{h_1<\cdots<h_n\}$ be totally ordered and let $\preceq$ be first-order stochastic dominance on $\Delta(H)$. If $F:\Delta(H)\to\Delta(H)$ is monotone for $\preceq$, then $\operatorname{Fix}F$ is a nonempty complete lattice, without any continuity hypothesis. If $F$ is antitone, then $F\circ F$ is monotone and $F$ has an orbit of period one or two.
6. For $H=\{0,1\}$ and $q=\Pr(1)$, let $F:[0,1]\to[0,1]$ have one-sided limits at every point. If there is no $c\in(0,1]$ with $F(c^-)\ge c>F(c)$ and no $c\in[0,1)$ with $F(c)>c\ge F(c^+)$, then $F$ has a fixed point.
7. If $\Delta(H)$ is partitioned into finitely many convex cells, each defined by finitely many rational linear equalities, weak inequalities and strict inequalities, and $F$ is rational affine on each cell, then existence of a fixed point of $F$ is decided by finitely many rational linear-programming problems.

For the separator (63f), $\mathcal L_F(1/2)=\{0,1\}$, $\operatorname{Fix}\bar F=\{1/2\}$ with $F(1/2)=0$, $F$ is antitone with the period-two orbit $\{0,1\}$, the equal mixture of the two cluster values closes the loop at $q=1/2$, and $c=1/2$ is a downward diagonal crossing of the kind excluded in item 6.

*Proof.* If a net $(\pi_\iota,y_\iota)$ in the graph of $\bar F$ converges to $(\pi,y)$ and $U$ is an open neighborhood of $\pi$, then $U$ is a neighborhood of $\pi_\iota$ for large $\iota$, so $y_\iota\in\overline{\operatorname{conv}}F(U)$ and hence $y\in\overline{\operatorname{conv}}F(U)$; this proves closed graph. Each value contains $F(\pi)$ and is an intersection of closed convex subsets of the compact set $K$. At a continuity point, every closed convex neighborhood $V$ of $F(\pi)$ contains $F(U)$ for some $U$ and therefore contains $\bar F(\pi)$; local convexity and the Hausdorff property give $\bar F(\pi)=\{F(\pi)\}$. The Kakutani--Fan--Glicksberg theorem gives a fixed point of $\bar F$, and the fixed set is closed in $K$ because the graph is closed. Item 2 follows from $F(\pi)\in\bar F(\pi)$ and the singleton values at continuity points.

For item 3, $\mathcal L_F(\pi)$ is nonempty and compact as a directed intersection of nonempty closed subsets of $K$. Given $\varepsilon>0$, some $U$ satisfies $F(U)\subseteq\mathcal L_F(\pi)+B_\varepsilon$; otherwise points $y_U\in F(U)$ outside this open set have a cluster point that lies both in $\mathcal L_F(\pi)$ and outside the open set, which is impossible. Hence $\bar F(\pi)\subseteq\operatorname{conv}\mathcal L_F(\pi)+\overline B_\varepsilon$ for every $\varepsilon>0$, while $\operatorname{conv}\mathcal L_F(\pi)\subseteq\bar F(\pi)$ directly. The convex hull of a compact set in finite dimension is compact, which proves equality. Carathéodory's theorem in the $(n-1)$-dimensional affine hull of $\Delta(H)$ gives the bound $n$, and the randomized policy outputs the corresponding convex combination, which is $\pi$.

For item 4, the lifted map $(\pi_1,\ldots,\pi_k)\mapsto(F(\pi_1,\ldots,\pi_k),\pi_1,\ldots,\pi_{k-1})$ on $\Delta(H)^k$ has as fixed points exactly the constant tuples $(\pi,\ldots,\pi)$ with $\pi=G(\pi)$, and $G$ is continuous when $F$ is. The Borel probability laws on the compact metric space $\Delta(H)$ form a compact convex subset of the finite signed measures with the weak* topology, which is locally convex and Hausdorff. The Brouwer and Schauder--Tychonoff theorems give fixed points of continuous maps.

For item 5, identify $\pi$ with its distribution-function vector $c_j=\sum_{i\le j}\pi(h_i)$, $1\le j<n$. Then $\pi\preceq\pi'$ exactly when $c\ge c'$ componentwise, and the nondecreasing vectors in $[0,1]^{n-1}$ are closed under arbitrary componentwise infima and suprema. Thus $(\Delta(H),\preceq)$ is a complete lattice, and Tarski's theorem makes the fixed set of every monotone $F$ a nonempty complete lattice. If $F$ reverses $\preceq$, then $F\circ F$ preserves it, and a fixed point $\pi$ of $F\circ F$ gives the orbit $\{\pi,F(\pi)\}$.

For item 6, suppose $F$ has no fixed point and put $g(q)=F(q)-q$, so $g(0)>0>g(1)$. Let $q_*=\sup\{q:g(q)>0\}$. If $g(q_*)>0$, then $q_*<1$ and $g<0$ on $(q_*,1]$, so $F(q_*^+)\le q_*<F(q_*)$. If $g(q_*)<0$, then $q_*>0$ is a limit of points $q<q_*$ with $g(q)>0$, so $F(q_*^-)\ge q_*>F(q_*)$. Either case is an excluded downward diagonal crossing.

For item 7, a fixed point exists exactly when, for some cell $P_i$ with affine rule $\pi\mapsto A_i\pi+b_i$, the system $\pi\in\Delta(H)\cap P_i$, $A_i\pi+b_i=\pi$ is feasible. Replacing each strict inequality $s(\pi)>0$ by $s(\pi)\ge t$ and maximizing $t\le1$ gives a rational linear program whose optimum is positive exactly when that system is feasible.

For (63f), the one-sided limits at $1/2$ are $1$ and $0$, and $F$ is continuous with $F(q)\ne q$ at every other point, so items 1--3 give $\bar F(1/2)=[0,1]$ and $\operatorname{Fix}\bar F=\{1/2\}$. The remaining statements are direct evaluations. ∎

<a id="theorem-42c3-exact-rational-piecewise-affine-map-and-periodic-law-ledger"></a>**Theorem 42c.3 (Exact Rational Piecewise-Affine Map and Periodic-Law Ledger).** Let $K=\Delta_d$ be the probability simplex on $d$ symbols. Supply a finite disjoint exhaustive partition into nonempty convex cells $C_1,\ldots,C_m$, specified by rational linear equalities, weak inequalities and strict inequalities, with boundary ownership included. On $C_i$ let $F(x)=A_ix+b_i$, with rational coefficients and $F(C_i)\subseteq K$. Then:

1. For each supplied positive integer $r$, the entire set $\operatorname{Fix}(F^r)$ and the entire stratum of points of exact least period $r$ have effective finite Boolean-linear descriptions. Each nonempty linear component has a rational point and an exact rational orbit.
2. Equality of two supplied maps in this class on all of $K$ is decidable. A failure has a rational distinguishing input. Equal maps have equal iterates, exact-period sets and closed convex regularizations.
3. The cluster set and regularization at every real input are exactly
$$
\mathcal L_F(x)=\{A_ix+b_i:x\in\overline{C_i}\},
\qquad
\bar F(x)=\operatorname{conv}\mathcal L_F(x).
\tag{42c.3.1}
$$
Consequently $\operatorname{Fix}\bar F$ has an exact rational semialgebraic description. Exact and regularized-only fixed points remain separate.

*Proof.* For a word $w=(i_0,\ldots,i_{r-1})$ define affine maps $g_0(x)=x$ and $g_{t+1}(x)=A_{i_t}g_t(x)+b_{i_t}$. Put
$$
D_w=\{x\in K:g_t(x)\in C_{i_t}\ (0\le t<r)\},
\qquad
Q_w=\{x\in D_w:g_r(x)=x\}.
\tag{42c.3.2}
$$
Substitution preserves rational linearity and every original strict inequality. Induction gives $F^t(x)=g_t(x)$ on $D_w$. Unique boundary ownership assigns each real input exactly one word. Thus
$$
\operatorname{Fix}(F^r)=\bigcup_{w\in\{1,\ldots,m\}^r}Q_w,
\qquad
\operatorname{Per}_r(F)=\operatorname{Fix}(F^r)
\setminus\!\!\bigcup_{\substack{s\mid r\\s<r}}\operatorname{Fix}(F^s).
\tag{42c.3.3}
$$
The second identity holds because the least positive period of a point fixed by $F^r$ divides $r$. Expand the finite Boolean expression into linear sign cells, splitting a negated equality into its two strict signs. Mixed weak/strict cells, including half-open and lower-dimensional cells, are retained.

To test any such component, keep its equalities and weak inequalities and write its strict conditions as $s_j(x)>0$. Introduce one variable $t$ and maximize it subject to
$$
x\in K,\qquad s_j(x)\ge t\ \text{for every strict condition},
\qquad 0\le t\le1.
\tag{42c.3.4}
$$
The feasible set is a closed bounded rational polytope. Original feasibility supplies a positive minimum of finitely many strict slacks and hence a positive feasible $t$. Conversely a positive feasible $t$ enforces the original strict conditions. Thus the component is nonempty exactly when the optimum is positive. A maximizing rational vertex supplies an exact rational witness; affine substitution supplies its rational orbit. With no strict conditions the dummy $t$ attains one whenever the remaining constraints are feasible. An empty closed feasible set and an optimum of zero are distinct negative certificates. Exact rational elimination or full-rank active-set enumeration verifies these alternatives. The construction has at most $m^r$ itinerary components before simplification and is finite for each supplied $r$.

For map equality, intersect each pair of source cells, keeping their strict conditions, and test each output-coordinate difference for a strictly positive or strictly negative value. The preceding feasibility procedure decides every test and supplies a rational point on failure. If all tests fail, the two maps agree at every real point. Induction gives equality of all iterates; the neighborhood definition (63j) gives equality of their regularizations.

For a nonempty cell $C_i$, replacing its strict inequalities by weak ones gives exactly $\overline{C_i}$. Indeed, if $y\in C_i$ and $z$ satisfies that weak relaxation, $(1-\epsilon)z+\epsilon y$ lies in $C_i$ for $0<\epsilon\le1$ and tends to $z$. Nonemptiness must be checked first: the empty system $x=0,\ x>0$ has a nonempty weak relaxation.

Each incident cell $x\in\overline{C_i}$ therefore supplies the limit $A_ix+b_i$. Conversely a convergent sequence of outputs with inputs tending to $x$ has a subsequence in one of finitely many cells; affine continuity gives precisely such a value. This proves the first equality in (42c.3.1). In finite dimension, compactness and Carathéodory's theorem identify the intersection of closed convex neighborhood images with the convex hull of these cluster values, as in Proposition 42c.2. These are unpunctured relative neighborhoods: a singleton or boundary-only cell contributes through a constant sequence.

Writing $I(x)=\{i:x\in\overline{C_i}\}$, the exact regularized fixed-set formula is
$$
x\in K,\quad
\exists\lambda_1,\ldots,\lambda_m\ge0:\quad
\sum_i\lambda_i=1,\quad
\lambda_i>0\Longrightarrow i\in I(x),\quad
x=\sum_i\lambda_i(A_ix+b_i).
\tag{42c.3.5}
$$
Its coefficients are rational and its incidence predicates are linear; the displayed products are generally bilinear. It is a semialgebraic description, rather than the branch linear program (42c.3.4). At most $d$ active cluster values suffice because $K$ has affine dimension $d-1$. The rational-witness assertion for exact-period linear cells makes no rational-witness assertion for this different semialgebraic problem. ∎

<a id="proposition-42c4-support-preserving-stationary-and-periodic-law-approximation"></a>**Proposition 42c.4 (Support-Preserving Stationary and Periodic-Law Approximation).** Fix a finite real channel $W:Y\leftarrow X$ and a finite real menu of policies $P_j:X\leftarrow Y$, all column stochastic. There are simultaneous rational approximants $W_n,P_{j,n}$ converging entrywise and preserving every zero and every positive entry. Let $T_j=P_jW$ and $T_{j,n}=P_{j,n}W_n$. Then the complete stationary-law polytopes converge in $\ell^1$ Hausdorff distance. For every fixed $r\ge1$, the complete $T_j^r$-fixed polytopes admit affine bijections to the corresponding $T_{j,n}^r$-fixed polytopes, converging uniformly to the identity and intertwining their one-step dynamics. These bijections preserve exact least periods within those polytopes.

*Proof.* Each stochastic column is in the relative interior of the simplex on its positive support. Rational points are dense in that relative interior: approximate all but one positive coordinate rationally and choose the last to normalize, keeping every positive coordinate positive. Apply this to the finitely many columns. A product entry $(P_jW)_{x'x}$ is positive exactly when some $y$ has both factors positive. Hence each $T_{j,n}$ has exactly the same support graph as $T_j$, and their Boolean $r$th-power graphs agree for every $r$. With the induced column norm,
$$
\delta_n:=\max_j\|T_{j,n}-T_j\|_1
\le \|W_n-W\|_1+\max_j\|P_{j,n}-P_j\|_1
\longrightarrow0.
\tag{42c.4.1}
$$
A fixed support graph fixes its transient states and closed irreducible classes. Each closed class $C$ contributes one stationary probability vertex $v_C$, and every stationary law is a convex combination of these disjoint-support vertices. Choose a strictly positive probability vector $u_C$ on $C$ and set
$$
B_C=I-T_{CC}+u_C\mathbf1^\top,\qquad
v_C=B_C^{-1}u_C.
\tag{42c.4.2}
$$
To prove invertibility, $B_Cz=0$ first gives $\mathbf1^\top z=0$ by left multiplication by $\mathbf1^\top$, then $(I-T_{CC})z=0$. The stationary eigenspace of an irreducible finite stochastic matrix is one-dimensional, so its only zero-sum member is zero. The same argument applies to every approximant.

Let $K_C=\|B_C^{-1}\|_1$. The inverse identity and the Neumann bound, when $K_C\delta_n<1$, give
$$
\|v_{C,n}-v_C\|_1
\le\frac{K_C\delta_n}{1-K_C\delta_n}.
\tag{42c.4.3}
$$
Here $B_{C,n}v_{C,n}=u_C$, $\|v_C\|_1=1$ and $\|B_{C,n}-B_C\|_1\le\delta_n$. Matching the same convex weights bounds the two-sided Hausdorff distance by the largest matched-vertex error. In particular the mean of all stationary vertices converges; every other stationary mixture can also be approached using rational approximations to its convex weights.

For each fixed $r$ the telescoping identity gives
$$
\|T_{j,n}^r-T_j^r\|_1\le r\delta_n.
\tag{42c.4.4}
$$
Apply the preceding proof to the common support graph of $T_j^r$. Its closed classes are the cyclic subclasses determined by the original recurrent classes and $r$. The one-step map $T_j$ permutes their stationary vertices: it maps each supported invariant law to the unique invariant law of the next cyclic subclass. The same permutation holds for $T_{j,n}$ because the support graph is identical. Disjoint vertex supports make the convex coordinates unique. Sending each vertex to its matched approximant therefore defines an affine bijection $H_{j,n}^{(r)}$ with
$$
\sup_{p\in\operatorname{Fix}(T_j^r)}
\|H_{j,n}^{(r)}p-p\|_1\longrightarrow0,
\qquad
H_{j,n}^{(r)}T_j=T_{j,n}H_{j,n}^{(r)}.
\tag{42c.4.5}
$$
An orbit and its image have exactly the same least period because this map is bijective and intertwines the dynamics. The estimates are for each fixed $r$; no uniform estimate over unbounded periods is used.

For arbitrary real coefficients this is an existence theorem. Effective compilation uses supplied exact support and certified coefficient approximations. It supplies neither a zero-recognition oracle nor an algorithm for arbitrary noncomputable real coefficients. ∎

<a id="proposition-42c5-projected-closure-responses-and-finite-output-limits"></a>**Proposition 42c.5 (Projected Closure Responses and Finite-Output Limits).** The finite closure equivalence of Proposition 42c retains $T_j=P_jW$ and its stationary-law set. Observe the initial law, projected $X$ history and policy records, and let causal policy testers use only that projected past. Then:

1. Summing intermediate $Y$ gives the exact projected path law $\pi(x_0)\prod_{t=0}^{L-1}T_{j_t}(x_{t+1}\mid x_t)$, with the tester's causal command factors included. If $\max_j\|T_{j,n}-T_j\|_1\le\delta_n$, the full projected-history responses satisfy, uniformly over these normalized testers,
$$
\operatorname{TV}(\mathsf P_n,\mathsf P)
\le\operatorname{TV}(\pi_n,\pi)+\frac L2\delta_n.
\tag{42c.5.1}
$$
Retaining the raw $Y$ factorization gives instead the valid bound with $L(\|W_n-W\|_1+\max_j\|P_{j,n}-P_j\|_1)/2$ in place of $L\delta_n/2$.
2. Suppose a random finite-horizon population path $Z_M$ and deterministic nominal path $z$ obey $\mathbb E d(Z_M,z)\le\epsilon_M$, and a fixed finite-output stochastic reader $K$ satisfies $\operatorname{TV}(K(u),K(v))\le C d(u,v)$. Then
$$
\operatorname{TV}(\mathbb E K(Z_M),K(z))\le C\epsilon_M.
\tag{42c.5.2}
$$
A supplied rational physical reader $K_M$ with uniform error at most $\eta_M$ gives the bound $\eta_M+C\epsilon_M$. Prefix projection and stochastic coarse-graining commute with the responses; a registered finite reader menu uses its common finite Lipschitz constant.

*Proof.* At a fixed projected past the tester's command factor is independent of the intermediate $Y$, so it factors outside the $Y$ sum and $\sum_yP_j(x'\mid y)W(y\mid x)=T_j(x'\mid x)$. Iterate this identity. Couple the initial laws maximally and use the same tester randomization while the projected histories agree. Each next-state pair has disagreement probability at most $\delta_n/2$. The union bound gives (42c.5.1). If raw $Y$ is retained, first couple the $W$ outputs and then the $P_j$ outputs, giving the stated sum of column errors. Such a tester may use its retained $Y$ past because that stronger comparison keeps the factorization.

Raw $Y$ is a separate audit port. For the binary flip $T$, $(W,P)=(I,T)$ gives $Y=X_{\rm old}$ whereas $(W,P)=(T,I)$ gives $Y=X_{\rm next}$. They have the same $T$ and projected closure responses and different $Y$ responses. Thus the projection used here specifies an observation algebra; it does not erase the owned audit records or declare them null.

Convexity of total variation gives
$$
\operatorname{TV}(\mathbb E K(Z_M),K(z))
\le\mathbb E\operatorname{TV}(K(Z_M),K(z))
\le C\mathbb E d(Z_M,z).
\tag{42c.5.3}
$$
The triangle inequality adds $\eta_M$ for $K_M$. A prefix is 1-Lipschitz for the maximum path metric and stochastic output post-processing contracts total variation, proving the stated naturality. A coherent finite family can be obtained by approximating one common parent reader and applying its supplied stochastic arrows; fitting unrelated child readers does not give this conclusion. At each finite population alphabet, rational approximations to finite reader probability vectors exist. Their conditional samplers, coefficients, routing and retained records are additional charged physical ports. Equation (42c.5.2) accounts for their response error; the population source invoice alone does not include those reader ports.

Two exact examples identify the scope of these limits. For odd $M$, $M$ iid fair binary agents give an empirical frequency $q_M$ with
$$
\Pr(q_M\ge1/2)=1/2,\qquad
\mathbf1_{\{q\ge1/2\}}\big|_{q=1/2}=1.
\tag{42c.5.4}
$$
Binomial symmetry proves a total-variation gap of $1/2$ for this discontinuous reader even as expected empirical error tends to zero. This reader lies outside the stated Lipschitz class.

For a nontrivial simplex, $c\in K$ and $0<\epsilon<1$, let $F_\epsilon(x)=(1-\epsilon)x+\epsilon c$. It converges uniformly to the identity, and every fixed finite-horizon path converges uniformly, while
$$
F_\epsilon^r(x)=(1-\epsilon)^r x+
[1-(1-\epsilon)^r]c,\qquad
\operatorname{Fix}(F_\epsilon^r)=\{c\},
\qquad
\operatorname{Fix}(I^r)=K
\quad(r\ge1).
\tag{42c.5.5}
$$
The fixed-set Hausdorff gap is $\sup_{x\in K}\|x-c\|_1>0$. Thus uniform map or finite-horizon response convergence alone does not recover complete fixed-law sets. This example changes the identity's zero support and hence does not contradict Proposition 42c.4. ∎

<a id="definition-42c6-finite-rational-policy-source-and-charged-native-services"></a>**Definition 42c.6 (Finite Rational Policy Source and Charged Native Services).** Freeze nonempty finite alphabets $X,Y$ of sizes $n,m$, rational column-stochastic $W:Y\leftarrow X$, a nonempty finite rational policy menu $P_j:X\leftarrow Y$ of size $J$, and horizon $L\ge1$. Write $T_j=P_jW$. In stationary mode initialize from the canonical law
$$
\pi_j=\frac1{|\mathcal V_j|}\sum_{v\in\mathcal V_j}v,\qquad
\mathcal V_j=\operatorname{vert}\{p\ge0:\mathbf1^\top p=1,\ T_jp=p\}.
\tag{42c.6.1}
$$
Declared-initial-law mode instead supplies one rational probability vector for each initial policy. The two modes are distinct. Supply exact finite algebraic native ports, deterministic ready preparation, computational-basis instruments and an external clock with the costs below. These are the source's physical service assumptions.

Let $\operatorname{bits}(a)=\max(1,\lceil\log_2a\rceil)$, $b=\operatorname{bits}(\max(n,m))$ and $D=2^b$. Pad all initial laws, channel columns, policy columns and the dummy law $\delta_0$ to $D$ outcomes and deduplicate them into a menu $\mathcal M$ of size $K$. For $p\in\mathcal M$, put $v_p=e_0-\sqrt p$ and supply
$$
H_p=
\begin{cases}
I,&p=\delta_0,\\
I-\dfrac{2v_pv_p^\top}{v_p^\top v_p},&p\ne\delta_0.
\end{cases}
\qquad
U_{\mathcal M}=\bigoplus_{\alpha=0}^{2^k-1}H_\alpha,
\quad k=\operatorname{bits}(K),
\tag{42c.6.2}
$$
where unused selector blocks are identity. Every registered involution $U$ is implemented in one slot of duration $\tau>0$ by the supplied positive pulse
$$
H_U(s)=\frac{\pi\hbar}{2\tau}
(1-\cos(2\pi s/\tau))(I-U),\qquad 0\le s\le\tau.
\tag{42c.6.3}
$$
Each draw owns fresh $D$-level registers $S,A,B,C,R,V$ and a status qubit. Apply the selected sampler to $S$, then the three XOR copies $S\to A$, $A\to B$, $A\to C$. The readout port on $B,R,V$ and status has $D$ Kraus branches
$$
M_z=(\Pi_z^B\otimes I)\,
\operatorname{XOR}_{B,R}\operatorname{XOR}_{B,V}X_{\rm status},
\qquad z=0,\ldots,D-1.
\tag{42c.6.4}
$$
Every padded outcome and supplier output is retained.

The schedule has $N=2L+1$ draws and $Q=18L+12$ logical blocks, each consisting of one lookup slot and one action slot. Initial policy input/archive is block zero; initial $X$ draw occupies blocks $2,\ldots,9$. For $t=0,\ldots,L-1$, the policy window is $10+18t$, the $Y$ draw starts at $12+18t$ and the next $X$ draw starts at $20+18t$, each draw occupying eight blocks. Its phases are padding/selection, sampler, three copies, readout, append, padding. All gaps and the final two blocks are paid.

With $d_0=\operatorname{bits}(J+1)$, token zero is HOLD, tokens $1,\ldots,J$ are SET$(j=\mathrm{token}-1)$ and remaining codes are INVALID; initial HOLD is invalid. Raw tokens are archived. An invalid flag is sticky and forces all later sampler selectors to $\delta_0$. There are no resets. The initial token chooses the initial law once; later tokens choose subsequent transition policies.

Set $s_0=\operatorname{bits}(Q+1)$, $j_0=\operatorname{bits}(J)$ and $a_0=\operatorname{bits}(\max(N,L+1))$. The state word stores clock, policy, $x,y$, invalid and five reserved bits. The action word stores operation, draw/window index and sampler selector, with widths
$$
w=s_0+j_0+2b+1+5,\quad o=3+a_0+k,\quad
u=w+d_0+b,\quad v=w+o.
\tag{42c.6.5}
$$
The following total function $G$ specifies each lookup. Decode input into state, token and readout. Set invalid if a reserved bit is nonzero, clock $\ge Q$, policy $\ge J$, $x\ge n$ or $y\ge m$; replace each out-of-range policy/$x$/$y$ value by zero. Initialize operation, target and selector to zero. At a policy window use operation one, its window index, and the token rule above. Within a draw use its draw index as target. At phase one use operation two and select the initial-law column, $W(\cdot\mid x)$ for odd-numbered draws, or $P_j(\cdot\mid y)$ for even positive draws. At phases two/three/four use operations three/four/five for the three copies; at phase five use operation six for readout; at phase six use operation seven and append $y$ on odd draws or $x$ on even draws, marking invalid on an out-of-range readout. All other phases have operation zero. If invalid, overwrite the sampler selector by the dummy selector. Advance clock to $\min(\mathrm{clock}+1,Q)$, clear the new reserved bits, and encode next state and action. Every original input word remains retained. The $Q$ distinct native lookup ports act on input $z$ and output bank $q$ by
$$
|z,q\rangle\longmapsto|z,q\mathbin{\mathrm{XOR}}G(z)\rangle.
\tag{42c.6.6}
$$
Fresh next-state/action banks keep every earlier controller word. The external clock supplies each fixed scheduled port and its labeled service; the table generator is a description of the supplied couplings.

<a id="theorem-42c7-exact-finite-rational-source-full-histories-and-resource-account"></a>**Theorem 42c.7 (Exact Finite Rational Source, Full Histories and Resource Account).** Definition 42c.6 gives a separately compiled finite source for every frozen rational channel/menu/horizon, in either specified initialization mode. For each valid initial/late token schedule its full retained channel-policy history has law
$$
\Pr(x_0,y_0,x_1,\ldots,y_{L-1},x_L)
=\pi_{j_{\rm init}}(x_0)
\prod_{t=0}^{L-1}W(y_t\mid x_t)P_{j_t}(x_{t+1}\mid y_t).
\tag{42c.7.1}
$$
In declared-law mode replace $\pi$ by that supplied initial law. Normalized causal choices of late tokens also give normalized histories. A fixed policy initialized by (42c.6.1) is stationary; changing policy generally changes that property.

*Proof.* The stationary set is a nonempty compact rational polytope by Proposition 42c. Its vertices are found exactly by choosing all full-rank active coordinate-zero constraints together with stationary/normalization equalities and discarding infeasible or repeated solutions. At every vertex those active constraints span full rank; otherwise a nonzero null direction would allow two distinct nearby feasible points with that midpoint. Thus this enumeration is complete, including dependent equations, reducible kernels and lower-dimensional polytopes. The rational vertex mean is normalized, stationary and derived entirely from the supplied $W/P$ data. It is not a limiting law from an unspecified start.

For $p\ne\delta_0$,
$$
v_p^\top v_p=2(1-\sqrt{p_0})\ge1-p_0>0,\qquad
H_p^\top=H_p,\quad H_p^2=I,\quad H_pe_0=\sqrt p.
\tag{42c.7.2}
$$
Every finite menu therefore has a positive minimum denominator. The controlled direct sum is an involution on its entire domain. Integrating (42c.6.3) gives $(\pi\hbar/2)(I-U)$, whose propagator is $U$ by the two eigenvalues $\pm1$. The peak pulse norm is $2\pi\hbar/\tau$, with zero endpoints.

The readout before projection is unitary, so
$$
\sum_{z=0}^{D-1}M_z^\dagger M_z=I.
\tag{42c.7.3}
$$
This holds on arbitrary four-register inputs with any separate reference. On ready stocks the sampler and copies produce the selected law and the instrument retains the same classical value in $B,R,V$ with status one. Zero-weight padded labels remain declared outcomes.

The widths in (42c.6.5) contain every clock, policy, data, target and selector code. The clamping and sticky-invalid rules make $G$ a total finite function even on malformed words. Retaining $z$ makes (42c.6.6) an involution for any such function, without invertibility of $G$. On a valid ready run, induction through the eight phases records one exact draw and appends it to the next controller word. The initial draw uses the initial token; each later pair uses $W$ then the currently selected $P_j$. The next policy window occurs after the preceding $X$ readout with a positive gap. Future token banks are not read early. This proves (42c.7.1), retention of every token/history and absence of a retroactive change of initialization. Successive summation of normalized conditional draws and causal token kernels proves normalization. Invalid schedules remain defined: the flag persists and later samplers use $\delta_0$ on the same paid schedule.

The complete mutable-qubit stock is
$$
B=(6Nb+N)+2(L+1)d_0+(d_0+b)
+(Q+1)w+Qo+4Q+2Q+1.
\tag{42c.7.4}
$$
Its terms count draw/status stocks, policy inputs/archives, constant buses, controller/action banks, tick/invoice bits, heat capsules and the ready flag. Add a reservoir with $R_0=2Q+1$ levels and delivered table storage of $2^u\,8\lceil v/8\rceil$ bits. The distinct native matrices/ports have the following complete entry/row census:

| Native stock | Charged entries or rows |
| --- | --- |
| Controlled sampler dense entries | $N(2^kD)^2$ |
| Copy dense entries | $3ND^4$ |
| Policy archive dense entries | $(L+1)2^{4d_0}$ |
| Readout Kraus entries | $ND(2D^3)^2$ |
| Distinct lookup sparse rows | $Q2^{u+v}$ |
| Heat-exchange sparse rows | $2Q(2R_0)$ |
| Tick/invoice dense entries | $32Q$ |
| Local free-energy diagonals | $6Q+1$ |

The table storage and the distinct physical lookup couplings are both charged. There are $Q$ lookup, $Q$ action, $2Q$ clock/invoice and $2Q$ heat-transfer services, together with $B-(L+1)d_0+1$ ready preparations. Policy-input factors are externally prepared but their capacity and archives remain in the stock. Retention lasts $(2Q+1)\tau$, beyond the $2Q\tau$ episode.

For the energy account take $E_*=\hbar/\tau$. Initially excite $2Q$ fresh two-level capsules and put the reservoir at level zero. Each successive native exchange swaps $|1,\ell\rangle$ with $|0,\ell+1\rangle$; other endpoint states remain fixed. It commutes with the capsule-plus-reservoir free Hamiltonian, empties that capsule and increments the reservoir once. Thus the final level is $2Q$. On the complete domain the sum of capsule/reservoir free energies has norm $4QE_*$; the reached sector has energy $2QE_*$. Functional, heat and tick pulses have combined peak bound $6\pi E_*$. Retain the separately supplied conservative driver reserve $2Q(4\pi+1)E_*$. This finite reservoir records energy transfer; thermal-bath or entropy-production properties are a separate premise.

Give positive unit model tariffs to each qubit, reservoir level, ROM bit, matrix entry/row, native service, ready factor and retained stock unit per $\tau$. If $C_{\rm stock}$ sums the complete stock categories above, then
$$
C_{\rm svc}=6Q+B-(L+1)d_0+1,\qquad
C_{\rm episode}=(2Q+2)C_{\rm stock}+C_{\rm svc}
+4Q+6\pi+2Q(4\pi+1).
\tag{42c.7.5}
$$
Every entry is explicit, finite and positively priced for each frozen instance. This is an evaluated model invoice; no PCE minimum or empirically calibrated price is inferred.

For nonvacuity, take $W=I_3$, one policy swapping states zero/one and fixing state two, and the second resetting to zero. The first stationary vertices are $(1/2,1/2,0)$ and $(0,0,1)$, so its canonical mean is $(1/4,1/4,1/2)$; the second gives $\delta_0$. At $L=3$ the source has four sampler vectors, 2,242 mutable qubits and 132 physical slots. All $4^4=256$ raw token schedules have defined normalized responses; the $2\cdot3^3=54$ valid schedules have exactly (42c.7.1). This exhibits reducible and periodic initialization without an irreducibility or mixing assumption. ∎

<a id="theorem-42c8-continuous-piecewise-affine-population-source-and-certified-path-error"></a>**Theorem 42c.8 (Continuous Piecewise-Affine Population Source and Certified Path Error).** Let $F:\Delta_d\to\Delta_d$ be a continuous rational piecewise-affine map on a supplied finite convex-cell partition. Fix rational $p_0$, horizon $T\ge1$ and integer $M\ge1$. There is a finite instance of Definition 42c.6 with retained coordinate/count records whose conditional new population has exactly law $F(\mu_t)^{\otimes M}$. With a certified global $\ell^1$ Lipschitz constant $\kappa$, deterministic recursion $p_{t+1}=F(p_t)$ and iid initialization, its empirical law obeys
$$
a_M=\sqrt{\frac{d-1}{M}},\qquad
\mathbb E\|\mu_t-p_t\|_1\le a_M\sum_{j=0}^t\kappa^j,\qquad
\mathbb E\max_{0\le t\le T}\|\mu_t-p_t\|_1\le a_MB_T,
\quad B_T=\sum_{t=0}^T\sum_{j=0}^t\kappa^j.
\tag{42c.8.1}
$$

*Proof.* On the ordered alphabet $S_M=\{1,\ldots,d\}^M$, let $\mu(s)_a=M^{-1}\#\{i:s_i=a\}$. Compile the finite rational tables
$$
\nu_0(s)=\prod_{i=1}^M(p_0)_{s_i},\qquad
P_M(s'\mid s)=\prod_{i=1}^M F(\mu(s))_{s'_i}.
\tag{42c.8.2}
$$
Every grid point has decidable rational cell membership, including owned boundaries, so all entries are exact rational numbers. Apply Theorem 42c.7 with $X=Y=S_M$, $W=I$, $J=1$, $L=T$ and declared initial law $\nu_0$. All table entries are compiled before runtime. Conditional on the retained past, the next coordinates have exactly the displayed iid product law. The extra identity-$Y$ draw and every earlier population/audit record remain priced and retained.

To expose coordinates and counts, let $h=\operatorname{bits}(d)$, $c_0=\operatorname{bits}(M+1)$ and $A_0=Mh+dc_0+1$. At the last padding action of the initial and each successor $X$ draw, supply a distinct XOR decoder from the population index to a fresh $A_0$-bit bank containing its base-$d$ coordinate codes $s_i-1$, all $d$ counts and a padded-label-invalid flag. The clock and draw index identify these fixed ports; action code zero at those slots denotes this decoder. Declaring all padded codes makes its full XOR map an involution. It copies recorded classical outcomes without postselection. The added stock and tariff are
$$
B_{\rm dec}=(T+1)A_0,\quad
C_{\rm dec}=(T+1)2^{b+A_0},\quad
\Delta C=(B_{\rm dec}+C_{\rm dec})(2Q+2)+B_{\rm dec}.
\tag{42c.8.3}
$$
These are fresh qubits, full sparse rows, holding and preparation. The occupied slots were already paid; no new timing or service is hidden. Substitute $n=m=d^M$, $L=T$ and $J=1$ in the whole census (42c.7.4)--(42c.7.5). The number of distinct empirical types bounds the menu by
$$
K\le d^M+\binom{M+d-1}{d-1}+2.
\tag{42c.8.4}
$$
This counts identity rows, conditional population vectors, initialization and dummy.

A sufficient computable global constant is $\max_i\|A_i\|_{1\to1}$. A line segment meets finitely many convex cells in interval pieces. On each piece the affine bound applies, and continuity joins the endpoints, so summing proves the bound on the entire segment. Lower-dimensional owned cells are included. Equality of affine rules on closure intersections supplies an exact rational continuity certificate.

Conditional multinomial variance gives
$$
\mathbb E[\|\mu_{t+1}-F(\mu_t)\|_1\mid\mu_t]
\le\sum_{a=1}^d\sqrt{\frac{F(\mu_t)_a(1-F(\mu_t)_a)}M}
\le\sqrt{\frac{d-1}M}.
\tag{42c.8.5}
$$
The first inequality uses the coordinate standard deviations. Cauchy--Schwarz and $\sum_aq_a^2\ge1/d$ give the second. With $e_t=\mathbb E\|\mu_t-p_t\|_1$, the triangle and Lipschitz inequalities give $e_{t+1}\le\kappa e_t+a_M$. The iid initial draw also has $e_0\le a_M$. Induction and $\mathbb E\max_t E_t\le\sum_t\mathbb EE_t$ prove (42c.8.1).

For a general supplied initial source with expected error $\delta_0$, the exact initialization-sensitive bound is
$$
e_t\le\kappa^t\delta_0+a_M\sum_{j=0}^{t-1}\kappa^j.
\tag{42c.8.6}
$$
At $t=0$ the sum is empty and $\kappa^0=1$, including $\kappa=0$. Deterministic exact counts give $\delta_0=0$ only when every $M(p_0)_a$ is integral; rounded counts retain $\delta_0=\|q_0-p_0\|_1$. These are different initialization experiments.

For each fixed $C$-Lipschitz path response $g$ in the maximum $\ell^1$ metric,
$$
|\mathbb E g(\mu_0,\ldots,\mu_T)-g(p_0,\ldots,p_T)|
\le Ca_MB_T.
\quad
M\ge\frac{(d-1)C^2B_T^2}{\varepsilon^2}
\ \Longrightarrow\ \text{error}\le\varepsilon.
\tag{42c.8.7}
$$
For $d=1$ the empirical law is deterministic and the error is zero. Proposition 42c.5 converts this estimate to finite-output TV for its specified stochastic readers, including their additional physical-reader error and cost.

For an exact example take $d=2$, $f(q)=q/2+1/4$ below $1/2$ and $q/4+3/8$ at or above $1/2$. It is continuous, nonlinear, has unique fixed point $1/2$ and $\kappa=1/2$. At $M=2,T=2,p_0=(1/2,1/2)$, all 64 positive full population histories give
$$
(\mathbb E q_0,\mathbb E q_1,\mathbb E q_2)
=(1/2,15/32,931/2048),\quad
(e_0,e_1,e_2)=(1/2,69/128,4465/8192),\quad
\mathbb E\max_{t\le2}\|\mu_t-p_t\|_1=7/8.
\tag{42c.8.8}
$$
The base source has seven samplers, 1,628 qubits and 96 physical slots. Decoding adds 21 ready qubits and 1,536 sparse rows, with tariff increment 152,607. Here $B_T=17/4$, so $M=1807$ suffices for unit-Lipschitz path error at most $1/10$. The displayed means also prove that iid initialization at the nominal fixed law does not make this finite population stationary. ∎

<a id="theorem-42c9-finite-almost-sure-sample-sources-support-rigidity-and-exact-rational-factory"></a>**Theorem 42c.9 (Finite-Almost-Sure Sample Sources, Support Rigidity and Exact Rational Factory).**

Fix an unknown $q\in[0,1]$. A classical implementation receives independent $\mathrm{Bernoulli}(q)$ samples on request, plus independent fixed-law random coins, and uses $q$-independent causal controls. It has no exact-real $q$ input. A quantum implementation instead receives IID states $\rho_q=(1-q)\rho_0+q\rho_1$, with no other $q$-dependent supplier; it may use arbitrary fixed ancillas, instruments, coherent memory and adaptive processing. The common interior support $S=\operatorname{supp}(\rho_0+\rho_1)$ is finite dimensional. Algorithms may stop at an unbounded random time but must output after finitely many operations almost surely at each declared $q$. A finite stopping record cannot hide a limit test or infinitely many samples.

Two results are proved here:

1. Every nonzero output event has strictly positive probability throughout the entire interior $(0,1)$. Consequently a nonconstant probability function with an interior zero cannot be realized by such an almost-surely finite algorithm.
2. The rational map $R(q)=1/(2-q)$, impossible for bounded-sample exact full-response algorithms, has an explicit finite-almost-sure factory with uniform geometric tails and uniformly bounded expected resource use. Exact full response therefore depends materially on whether the budget is worst-case finite or only expected finite.

## 1. Interior support rigidity: classical and quantum

Let $f(q)$ be the probability that the algorithm outputs 1. Let $F_N(q)$ be the probability that it outputs 1 by operation $N$. Events increase with $N$ and $f(q)=\lim_N F_N(q)$ for the finite-output semantics.

Classical proof: any finite event uses at most $N$ unknown-source bits. Pad ignored requests and condition on a full $N$-bit word. There are coefficients $a_{w}\ge 0$, independent of $q$, with
 $F_N(q)=\sum_{w\in\{0,1\}^N}a_w q^{|w|}(1-q)^{N-|w|}$.
The coefficients integrate all private randomness and adaptivity. If $F_N(q^*)=0$ at an interior $q^*$, every nonnegative summand vanishes, hence all $a_{w}=0$ and $F_N(q)=0$ for every interior $q$. If $f(q^*)=0$, all $F_N(q^*)=0$; therefore $f(q)=0$ throughout the interior and also at endpoints wherever the same finite-output algorithm is defined, since the same vanished coefficients give $F_N(0)=F_N(1)=0$. Contrapositively, if $f(q_1)>0$ at one interior point, some finite $N$ has $F_N(q_1)>0$, and that same $N$ has $F_N(q)>0$ at every interior $q$.

Quantum proof: by padding unused copies and deferring the finite instrument, the success-by-$N$ event is represented by one positive effect $E_{N}$ on $S^{\otimes N}$, after tracing or absorbing fixed ancillas. Thus
 $F_N(q)=\operatorname{Tr}[E_N\rho_q^{\otimes N}]$,  $E_{N}\ge 0$.
For $0<q<1$, $\rho_q$ is strictly positive on $S$: if $\langle v|\rho_q|v\rangle=0$, positivity forces $v$ in the common kernel of $\rho_{0}$ and $\rho_{1}$. Hence at interior $q^*$ the equality $F_N(q^*)=0$ forces the compression of $E_{N}$ to $S^{\otimes N}$ to vanish. It follows that $F_{N}$ vanishes at every interior $q$. The same monotone-limit argument proves the claim; the endpoint supports are contained in $S$, so the vanishing extends to endpoints as well. This includes finite adaptive POVMs and coherent memory; positivity, not a classical path description, is the essential argument. Noncommuting $\rho_{0}$ and $\rho_{1}$ do not change it.

The complementary output event proves the analogous result for an interior value $f(q^*)=1$: if a binary-output algorithm halts almost surely everywhere, then $f$ is identically 1 throughout the interior. Endpoint zeros/ones are allowed because support can change there. For example XOR of two classical samples realizes $2q(1-q)$, positive in the interior and zero at the endpoints.

Explicit excluded map: $f(q)=(q-1/2)^{2}$ lies in $[0,1/4]$, is nonconstant, and vanishes at $q=1/2$. No algorithm in either declared interface realizes it exactly with finite-almost-sure output. This is a coverage-complete no-go for this interface and this entire interior-zero family, not a no-go for direct exact-$q$ controls, altered source families, limit-only output schemes, or retained conditional/postselected outputs.

## 2. Exact rational factory

Repeat the following cycle:

- Toss one fresh fair coin. On heads, output 1 and stop.
- On tails, request one fresh Bernoulli(q) sample. If it is 0, output 0 and stop. If it is 1, repeat.

Let $r=q/2$. Every cycle continues with probability $r$; it terminates with output 1 with probability 1/2 and output 0 with probability $(1-q)/2$. Therefore
 $\Pr(N>m)=r^m\le2^{-m}$,
 $\Pr(Y=1)=\sum_{j\ge0}(1/2)r^j=1/(2-q)=R(q)$,
 $\Pr(Y=0)=\sum_{j\ge0}((1-q)/2)r^j=(1-q)/(2-q)$.
These identities hold at both endpoints. At $q=0$ it stops in one cycle and outputs a fair bit. At $q=1$ it halts at the first fair heads and outputs 1 almost surely. Thus it halts almost surely uniformly in $q$ with a geometric tail; its worst-case runtime is still unbounded whenever $q>0$.

Expected cycles and resources are exact:

 $$
 \mathbb{E}N=1/(1-r)=2/(2-q)\le2,
 $$

 $\mathbb{E}[\text{number of fair coins}]=2/(2-q)$,
 $\mathbb{E}[\text{number of }q\text{ samples}]=(1/2)\mathbb{E}N=1/(2-q)\le1$.
For the last identity, sum the probabilities of reaching each cycle and then seeing its independent tails coin. No assumption of a deterministic number of sample calls is made. The interface is a classical finite-state controller; it does not require quantum coherence or a continuous parameter register.

## 3. Timing, archive, and reset prices

Let $\tau_{c}>0$ be the fair-coin/read/control time and $\tau_{q}>0$ the source-sample time, with corresponding positive finite per-call charges $k_c,k_q$. Then
 $\mathbb{E}\,\text{time}\le2\tau_c+\tau_q$,
 $\mathbb{E}\,\text{acquisition charge}\le2k_c+k_q$,
but neither time nor total charge has a finite worst-case ceiling on $q>0$. The controller can use a finite number of logical states if it does not retain the full path. A full path archive has unbounded worst-case length; its expected number of generated raw bits is at most 3. Retaining a cycle counter likewise has no fixed worst-case bit width. A finite expected archive is not a finite installed-capacity certificate.

Let $H_2(q)=-q\ln q-(1-q)\ln(1-q)$, with endpoint value 0. The complete finite halting transcript has entropy
 $H(\text{path})=\mathbb{E}N\,[\ln2+(1/2)H_2(q)]$
        $=[2\ln2+H_2(q)]/(2-q)\le3\ln2$.
This follows by coding the per-cycle outcomes heads/stop, tails-zero/stop and tails-one/continue; their entropy is $\ln2+(1/2)H_2(q)$, and summing survival probabilities gives $\mathbb{E}N$. The fair coin is always generated, while the $q$ bit is generated only on tails. It is also the entropy of the exact path probability law $r^{n-1}/2$ or $r^{n-1}(1-q)/2$.

If records are erased cyclically, the actual conditional entropy H(path|retained side information) enters the registered heat/reset ledger; it can be zero when retained side information determines the path. Keeping the path avoids that erasure but consumes its actual archive resources. No positive excess entropy-production floor follows without a separate certificate. The bound concerns expected entropy and does not supply a pathwise finite-size eraser. No-jump conditioning is not part of the construction.

## 4. Fixed finite horizon, full output, and the postselection distinction

If only $m$ cycles fit before a deadline, retain the timeout symbol. The exact full three-output law is

 $$
 P(1)=(1-r^m)/(2-q),
 $$

 $P(0)=(1-q)(1-r^m)/(2-q)$,
 $P(\text{timeout})=r^m$.
Although written rationally, the first two entries are finite geometric sums and hence polynomials in $q$, as required by the bounded-sample theorem. With timeout deterministically changed to 0, the binary probability is $P_m(1)=(1-r^m)R(q)$, with uniform absolute error $\le2^{-m}$. One cannot declare the exact factory complete by silently discarding timeouts.

There is a useful sharp distinction: conditioning on termination by $m$ does give $P(1\mid\text{not timeout})=R(q)$ EXACTLY, because both terminating outcomes share the same geometric prefactor. But the acceptance probability $1-r^m$ depends on $q$, and the complete response includes timeout. This is a finite postselected realization of the normalized rational map, not an exact all-invocation full closure map. At $m=1$ the acceptance probability is $1-q/2$ and the normalized heads probability is already $R(q)$. This exposes the precise price/support/conditioning interface rather than confusing rational compilation with a physical full-response realization.

<a id="theorem-42c10-effective-support-complete-affine-mixture-sample-factories"></a>

**Theorem 42c.10 (Effective Support-Complete Affine-Mixture Sample Factories).** Fix known finite-dimensional density matrices $\rho_0,\rho_1$ and the sample-access interface of Theorem 42c.9. Write
$$
\rho_q=(1-q)\rho_0+q\rho_1,\qquad 0\le q\le1,\qquad
S_i=\operatorname{supp}\rho_i,\quad S=S_0+S_1,\quad
m(q)=\min(q,1-q).
\tag{42c.10.1}
$$
Fresh IID copies of $\rho_q$ are the sole parameter-dependent input. Controls, auxiliary coins, ancillas and instruments are independent of $q$. A factory produces one bit after finitely many operations almost surely at every $q$, including both endpoints, while retaining and charging its finite history, allocation, copying, timing and reset services.

An effective instance supplies computable matrix entries, the applicable equality/support branch and its required fixed native measurement identities, and a computable function $f:[0,1]\to[0,1]$ with a computable uniform modulus. On a nonconstant admissible branch it also supplies a valid integer witness for (42c.10.2). Matrix and function computability mean rational approximations with any requested rational error. The branch and measurement identities are certified algebraic data or promises of the native-service contract. For general computable matrices, equality, rank and support inclusion are supplied branch data; the compiler does not decide them from approximations. A support projector can instead be supplied with certified support/rank and a nonzero-eigenvalue gap. A numerical near-zero eigenvalue is insufficient. The floor witness is a valid promised mathematical witness; mechanical verification of its global inequality for arbitrary function code requires an additional proof in a specified proof system or a decidable restricted function class. Constant branches may be declared directly with their computable value.

If $\rho_0=\rho_1$, the realizable laws are constant, and every supplied computable constant is realizable. If $\rho_0\ne\rho_1$, a supplied computable $f$ has an almost-surely finite factory exactly when it is identically zero or one, or it is continuous on $[0,1]$ and satisfies, for some integer $n\ge1$,
$$
\min\{f(q),1-f(q)\}\ge m(q)^n\qquad(0\le q\le1),
\tag{42c.10.2}
$$
with the endpoint conditions
$$
S_1\subseteq S_0\ \Longrightarrow\ 0<f(0)<1,
\qquad
S_0\subseteq S_1\ \Longrightarrow\ 0<f(1)<1.
\tag{42c.10.3}
$$
Every constant strictly between zero and one satisfies these conditions for a sufficiently large $n$. The compiler is uniform on each declared branch from the supplied function, modulus, valid floor witness and native measurement data. Mathematical necessity applies also to fixed instruments with noncomputable coefficients; finite-program sufficiency uses the effective-instance data above.

*Proof.* **Finite prefixes and continuity.** Count each fresh copy as an operation, or use the event that halts by $N$ control operations while using at most $N$ copies. These events increase to the completed event. Padding unused copies, absorbing fixed ancillas and composing the finite adaptive instrument gives effects $E_N,D_N$ on $S^{\otimes N}$, with $0\le E_N,D_N$ and $E_N+D_N\le I$, for the two output events. Coherent memory and adaptive measurements are included in the composed instrument. Hence
$$
F_N(q)=\operatorname{Tr}(E_N\rho_q^{\otimes N}),\qquad
G_N(q)=\operatorname{Tr}(D_N\rho_q^{\otimes N}),
\qquad F_N\uparrow f,\quad G_N\uparrow1-f.
\tag{42c.10.4}
$$
Both finite-prefix probabilities are continuous polynomials. Their increasing limits are lower semicontinuous, so $f$ and $1-f$ are lower semicontinuous and $f$ is continuous. The continuous survival functions $s_N=1-F_N-G_N$ decrease to zero on $[0,1]$. For any $\varepsilon>0$, the increasing open sets $\{q:s_N(q)<\varepsilon\}$ cover this compact interval; a finite subcover and monotonicity give one $N$ with $\sup_q s_N(q)<\varepsilon$. Thus convergence is uniform. Summability of the survival probabilities is an additional condition for finite expected operation count.

Expanding the tensor product without commuting the states yields
$$
F_N(q)=\sum_{w\in\{0,1\}^N}q^{|w|}(1-q)^{N-|w|}
\operatorname{Tr}\!\left(E_N\bigotimes_{j=1}^N\rho_{w_j}\right).
\tag{42c.10.5}
$$
Every coefficient is nonnegative. Unless an output is identically absent, a finite event for that output has a strictly positive coefficient. Choosing one for each output gives $c_0,c_1>0$ and integers $N_0,N_1\ge0$ such that $f(q)\ge c_1m(q)^{N_1}$ and $1-f(q)\ge c_0m(q)^{N_0}$. Choose $n\ge\max(1,N_0,N_1)$ large enough that $2^{-(n-N_i)}\le c_i$ for $i=0,1$. Since $m\le1/2$, this proves (42c.10.2). Zero-copy events use exponent zero before this increase.

When the finite truncation effects are uniformly computable, as under finitely branching effective controls and computable finite-dimensional native instruments, the output function is computable as well. The maximum of each computable survival polynomial on $[0,1]$ is computable: approximate its coefficients, bound its derivative from those coefficients, and use a finite grid with the resulting interpolation error. Dovetail certified upper-bound searches over $N$ and approximation precision until $\max s_N<\varepsilon$. Uniform survival convergence guarantees termination. Then $0\le f-F_N\le s_N<\varepsilon$ uniformly. The resulting effective uniform polynomial approximations also give a computable uniform modulus. Uniformly computable finite truncations are essential to this observation; a primitive with a noneffective infinite branch sum is outside that premise.

**Endpoint necessity and constants.** If $S_1\subseteq S_0$, then $\rho_0$ is strictly positive on $S$. If $f(0)=0$, every positive $E_N$ has zero expectation against $\rho_0^{\otimes N}$, so its compression to $S^{\otimes N}$ vanishes. Therefore $F_N(q)=0$ for every $N,q$, and $f\equiv0$. Applying the same argument to $D_N$ shows that $f(0)=1$ forces $f\equiv1$. Exchanging state labels proves the other implication in (42c.10.3). Identical states make every finite-prefix probability independent of $q$ and therefore make the completed law constant. A supplied computable constant $a$ is sampled from fair bits by constructing a uniform $U\in[0,1]$ progressively and comparing shrinking rational enclosures for $U$ and $a$. Disjoint enclosures decide $U<a$ or $U>a$ after finitely many bits and approximations whenever $U\ne a$, an event of probability one. The declared constants zero and one can be output directly.

The classical continuity/polynomial-floor criterion is due to Keane and O'Brien (1994), with a Bernstein-polynomial formulation developed by Nacu and Peres (2005, Introduction and Proposition 3); the closed-endpoint effective construction and quantum support reductions used here are proved below.

**Endpoint-weighted concentration.** Fix rational $0<\delta<1/2$ and integer $n\ge1$. For all sufficiently large effectively selected $N$, if $K\sim\operatorname{Bin}(N,p)$ then
$$
\Pr_p(|K/N-p|\ge\delta)\le m(p)^n
\qquad(0\le p\le1).
\tag{42c.10.6}
$$
Put $a=\delta/6$ and $k=\lceil N\delta\rceil$. Select $N$ so that $k\ge n$ and
$$
(3/\delta)^n2^{n-k}\le1,\qquad
2e^{-2N\delta^2}\le a^n.
\tag{42c.10.7}
$$
An entirely rational rule chooses an integer $M\ge0$ with $2^M\ge(3/\delta)^n$, then an integer $N$ with $N\ge(n+M)/\delta$ and $1+2N\delta^2\ge2(\delta/6)^{-n}$. The inequality $e^{-x}\le(1+x)^{-1}$ for $x\ge0$ verifies (42c.10.7). All these selections use integer and rational arithmetic.

For $0<p\le a$, the lower deviation is impossible and the upper deviation implies $K\ge k$. The union bound over $k$ successful trials and $\binom Nk\le(eN/k)^k$ give
$$
\Pr(K\ge k)\le\binom Nk p^k
\le(3p/\delta)^k
\le p^n(3/\delta)^n2^{n-k}\le p^n.
$$
Here $e<3$, $k\ge n$ and $3p/\delta\le1/2$. The case $p\ge1-a$ follows by counting failures. On $[a,1-a]$, the exponential bound $2e^{-2N\delta^2}$ suffices. To obtain it directly, for $X\sim\operatorname{Bernoulli}(p)$ set $\phi(t)=\log\mathbb E e^{t(X-p)}$. Under exponential tilting, $\phi''(t)$ is the variance of a binary variable and is at most $1/4$, while $\phi(0)=\phi'(0)=0$. Integration gives $\phi(t)\le t^2/8$. Independence and exponential Markov inequality, optimized at $t=4\delta$ for the sum, bound each deviation by $e^{-2N\delta^2}$. Equation (42c.10.7) bounds their sum by $a^n\le m(p)^n$. At $p=0,1$ the deviation event is empty. This proves (42c.10.6) on the entire closed interval.

**A computable Bernstein stage.** Let $h:[0,1]\to[0,1]$ be computable with a supplied modulus and $\min(h,1-h)\ge m^n$. Choose rational $\delta\in(0,1/2)$ so that $|x-p|<\delta$ implies $|h(x)-h(p)|<1/12$, and choose $N$ by (42c.10.7). Compute rationals $r_j$ with $|r_j-h(j/N)|\le1/24$ and set
$$
b_j=\mathbf1\{r_j>1/2\},\qquad
B(p)=\sum_{j=0}^N b_j\binom Njp^j(1-p)^{N-j}.
\tag{42c.10.8}
$$
The threshold comparison is rational and decidable. If $h(p)\le1/3$ and $b_j=1$, then $h(j/N)>11/24$, so $|j/N-p|\ge\delta$. Consequently $B(p)\le m(p)^n\le h(p)$. If $h(p)\ge2/3$ and $b_j=0$, then $h(j/N)\le13/24$, so the same argument gives $1-B(p)\le m(p)^n\le1-h(p)$. On $1/3<h(p)<2/3$, use $B,1-B\le1$; the remaining inequalities on the outer regions follow from these same elementary bounds. Thus
$$
B\le3h,\qquad 1-B\le3(1-h),\qquad
h^+=\frac{4h-B}{3},\qquad
\min(h^+,1-h^+)\ge\frac13\min(h,1-h)\ge m^{n+2}.
\tag{42c.10.9}
$$
The last inequality uses $m^2\le1/4\le1/3$. Both $h^+$ and $1-h^+$ are nonnegative and sum to one. The residual is computable with an effective modulus. Indeed
$$
B'(p)=N\sum_{j=0}^{N-1}(b_{j+1}-b_j)\binom{N-1}{j}
p^j(1-p)^{N-1-j},\qquad |B'|\le N.
$$
For desired error $\varepsilon$, impose the old modulus at $3\varepsilon/8$ and $|x-p|<3\varepsilon/(2N)$; these bound the two terms in $(4|h(x)-h(p)|+|B(x)-B(p)|)/3$ by $\varepsilon/2$ each.

Starting with $h_0=f$, recursively construct $B_k,h_{k+1}$ using floor exponent $n+2k$. Repeated substitution gives
$$
f(p)=\sum_{k=0}^{L-1}\frac14(3/4)^kB_k(p)+(3/4)^Lh_L(p),
\qquad
f(p)=\sum_{k\ge0}\frac14(3/4)^kB_k(p).
\tag{42c.10.10}
$$
The remainder is between zero and $(3/4)^L$, including at the endpoints. Sample $L\ge0$ with law $\Pr(L=k)=\tfrac14(3/4)^k$, using two fair bits per geometric trial. Compute the finitely many tables through stage $L$, request $N_L$ fresh $p$-coins, count their successes $J$, and output $b_{L,J}$. Its conditional success probability is $B_L(p)$, so (42c.10.10) proves exactness. Every realized stage, requested approximation and table is finite, and $L$ is almost surely finite. This is a finite program generating its tables, rather than a countably infinite table supplied as an oracle. Its sample expectation $\sum_k\tfrac14(3/4)^kN_k$ and its expected computation/archive prices need not be finite. The geometric tail of $L$ does not bound the tail of physical operations without a degree/computation bound.

**Incomparable supports.** On $S$, let $P_0$ project onto the kernel of $\rho_1$ restricted to $S$, and $P_1$ onto the kernel of $\rho_0$ restricted to $S$. If neither support contains the other, then $a=\operatorname{Tr}(P_0\rho_0)>0$ and $b=\operatorname{Tr}(P_1\rho_1)>0$. A rational $c>0$ with $c/a+c/b\le1$ can be found from positive rational lower bounds for $a,b$. The fixed POVM
$$
E_0=(c/a)P_0,\qquad E_1=(c/b)P_1,\qquad E_?=I-E_0-E_1
\tag{42c.10.11}
$$
is positive because $P_0,P_1\le I$, even when the projectors do not commute. Its probabilities are $c(1-q),cq,1-c$. Repeat on fresh copies until a conclusive label. For waiting count $W$ and output $Z$,
$$
\Pr(W=w,Z=z)=(1-c)^{w-1}c\,q^z(1-q)^{1-z}
\qquad(w\ge1,\ z\in\{0,1\}).
\tag{42c.10.12}
$$
Thus $W$ is geometric of mean $1/c$ and independent of the exact $q$-coin $Z$. Disjoint calls give IID coins. The preceding classical factory implements every admissible $f$. If an adaptive classical factory requests an integrable number $K$ of these coins, each request is decided before the fresh waiting count is seen; summing the expected waiting cost over requests gives expected raw copies $\mathbb EK/c$. Almost-sure finiteness alone preserves almost-sure completion of the composed factory.

**Proper containment.** If $S_0\subsetneq S_1$, let $P$ project onto the kernel of $\rho_0$ on $S$. Measuring the effect $P/2$ gives a coin with bias $p=cq$, where $c=\operatorname{Tr}(P\rho_1)/2\in(0,1/2]$. Define the computable clamped extension
$$
g(p)=f\bigl(\min(p/c,1)\bigr),\qquad 0\le p\le1.
\tag{42c.10.13}
$$
The permitted nonconstant $f$ has $f(1)\in(0,1)$. Equation (42c.10.2) gives strict interior probabilities, so $\min(f,1-f)$ has a positive minimum on $[1/2,1]$. A rational lower bound $\eta>0$ is found effectively by approximating on a finite grid and using the supplied modulus, refining until every certified lower bound is positive. On $p\le c/2$, the floor for $f(p/c)$ gives $\min(g,1-g)\ge(p/c)^n\ge m(p)^n$; on $p\ge c/2$ the bound is $\eta$. Choose $r\ge n$ with $2^{-r}\le\eta$. Then $g$ satisfies the global floor with exponent $r$. A positive rational lower bound for $c$ and the modulus of $f$ give an effective modulus for $g$. Computability of minimum and division by a positive computable number avoids an exact comparison at the possibly nonrational breakpoint. The classical factory for $g$ therefore outputs $f(q)$. If $S_1\subsetneq S_0$, use the same construction with $q$ replaced by $1-q$ and $f(q)$ replaced by $f(1-q)$.

**Equal supports and distinct states.** Put $\Delta=\rho_1-\rho_0$. Since $-I\le\Delta\le I$, the effect $E=I/2+\Delta/4$ lies between $I/4$ and $3I/4$. Its measured bias is
$$
p=a+(b-a)q,\qquad
a=\operatorname{Tr}(E\rho_0),\quad b=\operatorname{Tr}(E\rho_1),\quad
b-a=\tfrac14\operatorname{Tr}(\Delta^2)>0,
\qquad 1/4\le a<b\le3/4.
\tag{42c.10.14}
$$
The floor and both endpoint conditions make $f$ strictly between zero and one everywhere. Its two probabilities have a positive minimum by compactness, with an effective positive rational lower bound obtained by the grid/modulus search above. Extend by
$$
g(p)=f\!\left(\max\!\left(0,\min\!\left(1,\frac{p-a}{b-a}\right)\right)\right).
$$
This extension is computable, uniformly continuous with an effective modulus, and bounded away from zero and one. It satisfies the floor for an effectively selected exponent. The classical factory for $g$ yields $f(q)$. A positive lower bound for $b-a$ is found by approximation using the promised distinct-state branch. These cases exhaust all support relations.

**Finite native instruments and control.** For each fixed POVM $(E_i)$, the map $V\psi=\sum_i|i\rangle\otimes\sqrt{E_i}\psi$ satisfies $V^\dagger V=\sum_iE_i=I$. Extend its orthonormal columns to a finite unitary $U$ on a ready-ancilla space, measure the label, and copy that classical label to output/archive registers. The resulting instrument is complete on its whole domain and retains the postmeasurement carrier. For algebraic data, spectral projectors, positive square roots and an orthonormal completion can all be chosen algebraically. To use Definition 42c.6's involution ports, enlarge by a flag and apply
$$
\widetilde U=\begin{pmatrix}0&U^\dagger\\ U&0\end{pmatrix},
\qquad \widetilde U^\dagger=\widetilde U,\qquad
\widetilde U^2=I.
\tag{42c.10.15}
$$
On flag zero this applies $U$ and records flag one, so the pulse (42c.6.3) implements the instrument's unitary part. Fixed general computable measurements are supplied native primitives on their declared branch. The controller uses fair bits, finite rational approximations, integer arithmetic, finite tables, counters, classical copies and a halting flag. Retaining each gate input makes a Boolean update a total XOR extension of the form (42c.6.6). A finite universal interpreter executes the supplied finite programs with stock allocated as needed; every realized finite computation has a finite composition of these gates. Thus the construction belongs to the unbounded-random-time interface and charges its realized stock. A single finite installed carrier for every possible stage requires a separate uniform allocation bound. ∎

<a id="corollary-42c11-sharp-extraction-and-one-sided-rational-factories"></a>

**Corollary 42c.11 (Sharp Extraction and One-Sided Rational Factories).** On the supplied support/measurement branches of Theorem 42c.10, an exact $q$-coin can be extracted from fresh IID copies of $\rho_q$ with almost-surely finite output if and only if $S_0,S_1$ are incomparable. The particular rational map $R(q)=1/(2-q)$ has the weaker exact criterion
$$
R\text{ is realizable with almost-surely finite output}
\quad\Longleftrightarrow\quad S_0\not\subseteq S_1.
\tag{42c.11.1}
$$
On the latter branch, a one-sided detector realizes $R$ with uniformly exponential raw-copy and fixed-coin call tails, hence all call-count moments are finite. Full physical-time and charge moments require the corresponding native-service bounds.

*Proof.* For $f(q)=q$, the endpoint values zero and one in (42c.10.3) require both support inclusions to fail. The POVM (42c.10.11) supplies the converse. For $R$, nonconstancy and $R(1)=1$ require $S_0\not\subseteq S_1$. Conversely let $P$ project onto the kernel of $\rho_1$ on $S$ and let $c=\operatorname{Tr}(P\rho_0)>0$. The supplied fixed binary measurement of $P$ succeeds with probability $p=c(1-q)$. Repeat this cycle: toss a fixed coin with success probability $c/(1+c)$; on success output one; otherwise request one fresh copy, measure $P$, and output zero on success or repeat on failure. The terminating probabilities per cycle are $c/(1+c)$ and $p/(1+c)$, and the continuation probability is $t=(1-p)/(1+c)<1$. Therefore the cycle count $A$ is geometric on the positive integers, and, for raw-copy count $C$,
$$
\Pr(Y=1)=\frac{c}{c+p}=\frac1{2-q},\qquad
\mathbb EA=\frac{1+c}{c+p},\qquad
\mathbb EC=\frac1{c+p}.
\tag{42c.11.2}
$$
For the last identity, sum the probability of reaching each cycle multiplied by $1/(1+c)$, the independent probability that its fixed coin requests a copy.

The raw-copy probability generating function satisfies
$$
H_q(s)=\frac{c}{1+c}+\frac{s}{1+c}\{p+(1-p)H_q(s)\},\qquad
H_q(s)=\frac{c+ps}{1+c-(1-p)s}.
\tag{42c.11.3}
$$
There is mass $c/(1+c)$ at $C=0$. Conditional on $C\ge1$, the next measured copy terminates the entire process before another copy is requested with probability $(c+p)/(1+c)$: either it immediately gives detector success, or detector failure is followed by fixed-coin success. Consequently the conditional positive count is geometric, and
$$
\Pr(C>m)=\frac1{1+c}\left(\frac{1-p}{1+c}\right)^m,
\qquad
\mathbb EC^2=\frac{2+c-p}{(c+p)^2}
\qquad(m=0,1,\ldots).
\tag{42c.11.4}
$$
The second identity follows by summing $(2m+1)\Pr(C>m)$ over $m\ge0$, using $\sum t^m=(1-t)^{-1}$ and $\sum mt^m=t(1-t)^{-2}$. Since $0\le p\le c$ and $c>0$ is fixed, both $\Pr(A>m)=t^m$ and the displayed copy tail are uniformly geometric. This proves all call-count moment assertions, including $q=0,1$. Each cycle retains its fixed-coin and measurement labels; $A\le C+1$ on every completed path.

The measurement and fixed coin are finite fixed instruments. For algebraic input data their projectors, coefficients and dilations are algebraic and use (42c.10.15). For nonalgebraic computable $c$, a fair-bit approximation sampler supplies almost-sure completion of the fixed coin. A bounded-time full-cost conclusion instead assumes a priced native fixed-coin service of bias $c/(1+c)$, or a separately analyzed implementation with the required moment bounds. Computability of $c$ alone provides no such call-time bound. ∎

<a id="proposition-42c12-noncommuting-rational-sources-and-resource-moments"></a>

**Proposition 42c.12 (Noncommuting Rational Sources and Resource Moments).** Let
$$
\rho_0=|0\rangle\langle0|,\qquad
\rho_1=|+\rangle\langle+|,\qquad
|\pm\rangle=(|0\rangle\pm|1\rangle)/\sqrt2.
\tag{42c.12.1}
$$
The balanced conclusive-sampling construction and the one-sided construction below both realize the completed halting-bit law $R(q)=1/(2-q)$ using finite algebraic instruments. Their raw-copy counts have uniform exponential tails and the exact moments below. Given a charged linear peak-stock census and bounded whole-call blocks, these moments give finite expected invocation cost and stock-time holding. The bounds in this proposition use supplied symbolic stock constants and tariffs. Theorem 42c.14 separately evaluates the one-sided native source and its conditional paid consumptive cycle. The balanced construction retains its own parametric bounds; the one-sided invoice is not transferred across architectures, suppliers or retained transcripts.

*Proof.* **Balanced conclusive sampling.** The two states in (42c.12.1) do not commute and have incomparable supports. In (42c.10.11), $a=b=1/2$ and $c=1/4$ give
$$
E_0=\tfrac12|-\rangle\langle-|,\qquad
E_1=\tfrac12|1\rangle\langle1|,\qquad
E_?=I-E_0-E_1
=\begin{pmatrix}3/4&1/4\\1/4&1/4\end{pmatrix}.
\tag{42c.12.2}
$$
The last matrix has eigenvalues $(2\pm\sqrt2)/4>0$. Thus this is a complete algebraic POVM, with the algebraic dilation (42c.10.15). Its three probabilities are $c(1-q),cq,1-c$. Repeat to a conclusive label to generate each exact $q$-coin, and feed these coins into the rational factory of Theorem 42c.9: fair heads outputs one, fair tails requests a generated coin, coin zero outputs zero, and coin one repeats. The cycle continuation probability is $q/2$. If $A$ counts fair calls and $C$ counts raw copies, summing the reach probabilities for fair calls and generated-coin requests gives
$$
\mathbb EA=\frac2{2-q}\le2,
\qquad
\mathbb EC=\frac1{c(2-q)}\le4.
\tag{42c.12.3}
$$
Every request precedes its fresh waiting time, whose mean is $1/c$ and whose output label is independent of it by (42c.10.12).

For a conclusive-sampling waiting count, $G(s)=cs/[1-(1-c)s]$. Conditioning on the first fair call and its possible generated coin yields
$$
H_q(s)=\tfrac12+\tfrac12G(s)\{(1-q)+qH_q(s)\}
=\frac{1+(1-q)G(s)}{2-qG(s)}
=\tfrac12+\tfrac12\frac{\lambda s}{1-(1-\lambda)s},
\qquad \lambda=\frac{c(2-q)}2.
\tag{42c.12.4}
$$
Thus $C$ is zero with probability $1/2$, and otherwise geometric on the positive integers with parameter $\lambda$. For $c=1/4$, all $q\in[0,1]$ and integers $m\ge0$,
$$
\begin{aligned}
\Pr_q(C>m)&=\tfrac12(1-\lambda)^m\le\tfrac12(7/8)^m,\\
\mathbb EC^2&=\frac4{c^2(2-q)^2}-\frac1{c(2-q)}
=\frac{2q}{c^2(2-q)^2}+\frac{2-c}{c^2(2-q)}\le60,\\
\mathbb E(C+1)^2&\le69.
\end{aligned}
\tag{42c.12.5}
$$
The moment identities follow either by differentiating the geometric generating function or summing its tail. Both moments are largest at $q=1$: the positive geometric parameter $\lambda$ decreases with $q$, so the count is stochastically increasing. The last bound is $60+2\cdot4+1=69$. Each nonfinal fair-call cycle has requested at least one raw copy; hence $A\le C+1$ pathwise. Any fixed $1<s<8/7$ makes $H_q(s)$ uniformly finite, proving a uniform exponential-moment bound for $C$, and for $A+C+1\le2(C+1)$ after rescaling its exponential parameter.

**One-sided detector.** For Corollary 42c.11 use $P=|-\rangle\langle-|$ and $c=1/2$. The fixed coin has bias $1/3$ and the detector bias is $p=(1-q)/2$. The exact tail and moments (42c.11.2)--(42c.11.4) give
$$
\mathbb EC\le2,
\qquad \mathbb EA\le3,
\qquad \Pr(C>m)\le(2/3)^{m+1},
\qquad \mathbb EC^2\le10,
\qquad \mathbb E(C+1)^2\le15.
\tag{42c.12.6}
$$
Indeed $\mathbb EC^2=(2+c-p)/(c+p)^2$ decreases with $p\ge0$, since its derivative is $-(4+3c-p)/(c+p)^3<0$ for $p\le c$; its maximum at $p=0,c=1/2$ is ten. Then $10+2\cdot2+1=15$. This protocol uses a different fixed measurement and controller from the balanced protocol, whose four-copy bound in (42c.12.3) remains unchanged.

**Charged whole-call and holding bounds.** For either protocol, suppose a supplied charged native inventory bounds peak stock on a completed path by $b_0+b_1(C+1)$, where $b_0,b_1\ge0$. Suppose each whole fixed-coin block, each whole raw-copy block and the finalization block takes at most $\tau>0$, including preparation, measurement, classical-label copies, controller transition, clocks/invoices and ready-stock services. The block count satisfies $A+C+1\le2(C+1)$, so completion time is at most $2\tau(C+1)$. The integral of charged stock over the invocation is bounded by peak stock times completion time. Therefore
$$
\mathbb E\int_0^{T_{\rm end}}B(t)\,dt
\le2\tau\{b_0\mathbb E(C+1)+b_1\mathbb E(C+1)^2\}
\le
\begin{cases}
10\tau b_0+138\tau b_1,&\text{balanced protocol},\\
6\tau b_0+30\tau b_1,&\text{one-sided protocol}.
\end{cases}
\tag{42c.12.7}
$$
The census includes acquisition, ready preparation, retained postmeasurement carriers and ancillas, archive and controller histories, clocks/invoices, native-coupling storage and final readout. Additional readers or after-completion retention are included through their own stock/time bound or an explicit separate invoice. These are parametric expected-cost and holding theorems on the declared census and tariffs. For its separately counted one-sided source, Theorem 42c.14 supplies $b_0=2$ and $b_1=1818$, together with its own whole-block-time, acquisition and retention contract. The balanced-source constants remain parametric.

More generally let $\tau_c,\tau_\rho,\tau_f$ be finite all-inclusive whole-block time bounds for the fixed coin, raw copy and finalization, and let $k_c,k_\rho,k_f$ be their positive finite charges. The exact call means give
$$
\begin{array}{c|c|c}
&\mathbb E\,\mathrm{time}&\mathbb E\,\mathrm{service\ charge}\\\hline
\text{balanced}&\le2\tau_c+4\tau_\rho+\tau_f&\le2k_c+4k_\rho+k_f\\
\text{one-sided}&\le3\tau_c+2\tau_\rho+\tau_f&\le3k_c+2k_\rho+k_f
\end{array}
\tag{42c.12.8}
$$
Acquisition/holding categories of the declared inventory are charged in addition when not already contained in these whole-call tariffs. The geometric call-count laws imply finite moments and exponential tails for bounded-cost block totals. Unbounded external delays or source preparation times require their own moment hypotheses. The controller is finite state; a complete retained history has unbounded worst-case length. In the balanced protocol, one bit per fair label and two bits per ternary measurement label use $A+2C$ raw record bits, with expectation at most ten, plus declared final-output and record-management overhead.

**Transcript entropy and binary readout.** For the balanced protocol, let $h(x)=-x\ln x-(1-x)\ln(1-x)$ with endpoint value zero. Each fair call contributes $\ln2$ conditional entropy. Each fresh raw-copy label, with probabilities $c(1-q),cq,1-c$, contributes $h(c)+ch(q)$. Applying the chain rule to the halted transcript, equivalently padding it by a deterministic absorbing symbol, and summing the nonnegative conditional entropies over reached calls gives
$$
H(\mathrm{path})=\frac{2\ln2+h(c)/c+h(q)}{2-q}
\le3\ln2+h(c)/c.
\tag{42c.12.9}
$$
Finite expected calls justify the finite entropy bound; monotone summation of the nonnegative terms gives equality. A cyclic eraser is charged according to the appropriate conditional entropy given retained side information. A streaming archive is charged for its storage and holding. Neither accounting policy introduces an unconditional positive excess-production floor.

Both protocols have halting-bit probabilities $1/2$ at input $q=0$ and one at input $q=1$. For input-one probability $\alpha$, the mutual information of this binary readout is
$$
I(\alpha)=h\bigl((1+\alpha)/2\bigr)-(1-\alpha)\ln2.
\tag{42c.12.10}
$$
It is strictly concave on $(0,1)$. Its derivative is $\tfrac12\ln[(1-\alpha)/(1+\alpha)]+\ln2$, which vanishes at $\alpha=3/5$. Substitution gives capacity $\ln(5/4)$ nats per completed invocation. This is the capacity of the declared halting-bit channel; the full retained transcript is a richer channel with its own capacity. A reusable positive full-cost transmission rate additionally requires an output/archive/reset policy and finite expected full cycle time.

At each fixed deadline the pending/timeout outcome and every finite history record remain part of the response. The exact binary laws above concern almost-surely completed invocations; a bounded-deadline response retains its pending branch. ∎

<a id="proposition-42c13-typed-process-interface-realizations"></a>

<a id="proposition-42c13-typed-non-iid-compact-law-and-causal-source-realizations"></a>**Proposition 42c.13 (Typed Non-IID, Compact-Law and Causal-Source Realizations).**

The following twenty parts give response classifications, constructions or explicit obstructions on their stated source interfaces. Numerical names, supplied samplers, populations, unknown samples, static coherent streams and interactive source calls are not interchangeable. Exact completed output, finite-deadline TIMEOUT, decoded infinite names, regularized relations and full retained instruments remain separately typed. The effective clauses require the displayed descriptions, moduli, supports, tail certificates and native service contracts as supplied data. The existing finite native compiler is Definition 42c.6 and Theorems 42c.7–42c.8.

**Part 1. Interface, topology and theorem.**

Let $A$ be a nonempty finite alphabet, $X=A^{\mathbb{N}}$, with metric $d(x,z)=2^{-\min\{i\ge1:x_i\ne z_i\}}$ and $d(x,x)=0$. Let $K=P(X)$ with its weak topology. $X$ and $K$ are compact metrizable. A source supplies successive classical labels from **one** stream $x$ drawn with unknown law $P\in K$. There is no IID, mixing, stationary, Markov or computability assumption on $P$. A request consumes the next label; rewind, cloning the source, independent reinitialization and access to probabilities are not available. Source law is the only $P$-dependent input.

A controller has P-independent private randomness and causal finite operations. By operation N it has requested at most N labels. It stops with Y in {0,1}; the stopping time T is finite P-almost surely for every P in K. Coefficients of a mathematical controller may be arbitrary fixed constants; effective constructions below instead use finite code and fair bits. A deadline produces TIMEOUT, not a renormalized successful distribution. Every request, private coin, control token and output has a retained finite classical record.

<a id="theorem-42c13a-universal-one-stream-law-transformations"></a>**Theorem 42c.13a (universal one-stream law transformations).**

For $f:K\to[0,1]$, the following are equivalent, at the mathematical level:

1. A controller in this interface terminates almost surely for every $P$ and has $\Pr_P(Y=1)=f(P)$.
2. $f$ is continuous and affine on $K$.
3. There is a continuous $g:X\to[0,1]$ such that $f(P)=\int g(x)\,P(dx)$.

Moreover, any controller in (1) has uniformly vanishing deadline failure:

$$
\lim_{N\to\infty}\sup_{P\in K}\Pr_P(T>N)=0.
\tag{42c.13.1}
$$

The effective sufficient input is a computable g, an effective uniform cylinder modulus, and a finite program approximating g at canonical eventually-constant representatives. The effective criterion is representation-sensitive: a bare extensional assertion that f is continuous is not a supplied executable description.

**Proof: necessity.**

For deterministic input $x$, integrate out the controller's private randomness. Set $a_N(x)=\Pr(T\le N,Y=1\mid x)$, $b_N(x)=\Pr(T\le N,Y=0\mid x)$, and $s_N=1-a_N-b_N$. At most $N$ stream coordinates have been inspected. Thus $a_N,b_N,s_N$ are bounded cylinder functions depending on $x_1,\dots,x_N$, hence continuous even if the private randomness has an infinite alphabet. The events increase, $a_{N}$ and $b_{N}$ increase, and $s_{N}$ decreases.

Every Dirac law $\delta_{x}$ belongs to $K$. Almost-sure termination therefore gives $a_N(x)$ increasing to $g(x)$, $b_N(x)$ increasing to $1-g(x)$, $s_N(x)$ decreasing to zero for every $x$. As increasing limits of continuous functions, $g$ and $1-g$ are lower semicontinuous. Therefore $g$ is continuous. Compactness yields uniform $s_{N}$ convergence: the increasing open sets $\{x:s_N(x)<\epsilon\}$ cover $X$; a finite subcover and monotonicity give one $N$ valid for every $x$. Consequently $a_{N}$ converges uniformly to $g$.

For arbitrary $P$, independence of the fixed private coins gives $f(P)=\int g\,dP$ by conditioning on $x$. Affineness follows from linearity of integration. Continuity follows because $g$ is bounded continuous. Finally $\sup_P\int s_N\,dP=\sup_x s_N(x)$, since Dirac laws attain the pointwise supremum (or approximate it). This proves the uniform deadline statement.

**Proof: continuous affine representation.**

If $f$ is continuous affine, put $g(x)=f(\delta_x)$. The Dirac embedding is continuous, so $g$ is continuous. Affineness gives $f(\sum_i p_i\delta_{x_i})=\sum_i p_i g(x_i)$ for finite mixtures. Finitely supported probability measures are weakly dense in $K$: replace each length-$n$ cylinder by one representative and retain its mass. Continuity extends this equality to every $P$. This proves $(2)\Rightarrow(3)$; $(3)\Rightarrow(2)$ is immediate.

**Proof: executable sufficiency and explicit uniform error.**

Fix a distinguished symbol $a_*$ and canonical representative $r(w)=w a_* a_*\ldots$ . At stage $k\ge 1$ choose a supplied computable nondecreasing $m(k)$ with

$$
x_{1:m(k)}=z_{1:m(k)}\quad\Longrightarrow\quad |g(x)-g(z)|\le2^{-k}.
\tag{42c.13.2}
$$

Compute a rational $q_k(w)$ approximating $g(r(w))$ within $2^{-k}$. For $w=x_1\dots x_{m(k)}$, form

$$
L_k=\max\{0,q_k(w)-2^{1-k}\},\qquad H_k=\min\{1,q_k(w)+2^{1-k}\}.
\tag{42c.13.3}
$$

Then $g(x)$ belongs to $[L_k,H_k]$, whose width is at most $2^{2-k}$. Draw independent fair bits $U_1,U_2,\dots$; their infinite expansion defines a uniform $U\in[0,1]$, although the controller never needs to finish that expansion. At stage $k$ its first $k$ bits give a dyadic interval $I_k=[u_k,u_k+2^{-k}]$. Output 1 if $\operatorname{upper}(I_k)<L_k$; output 0 if $\operatorname{lower}(I_k)>H_k$; otherwise proceed. Boundary conventions are immaterial on the probability-zero equality events. Previously read stream and coin bits are reused, not resampled.

For each $x$, if $U<g(x)$ eventually $\operatorname{upper}(I_k)<L_k$; if $U>g(x)$ eventually $\operatorname{lower}(I_k)>H_k$. The only possible nontermination is $U=g(x)$, which has probability zero for each fixed $x$. Thus the algorithm outputs 1 exactly on $U<g(x)$, up to null events, and its output probability is $g(x)$. Conditioning on arbitrary $P$ gives $f(P)$.

If the controller is pending at stage $k$, its $U$ lies in $[L_k-2^{-k},H_k+2^{-k}]$ intersected with $[0,1]$. Hence

$$
\sup_x\Pr(\mathrm{pending\ after\ stage}\ k\mid x)\le\min\{1,6\,2^{-k}\}.
\tag{42c.13.4}
$$

This bound requires no source law and holds uniformly over $K$. Every stage requests finitely many labels and performs finite rational computation. The compiler can precompute the finitely many $q_k(w)$ for all words $w$ of length $m(k)$, obtaining an explicit finite truth table for every finite deadline. Effective running-time bounds follow by running these finitely many terminating computations; efficient bounds do not follow automatically. Slow computation or rapidly growing $m(k)$ can make expected physical time or acquired stock infinite despite the geometric **stage** tail.

**Part 2. Nonlinear, discontinuous and indistinguishable sources.**

<a id="corollary-42c13b-a-uniform-quantitative-affine-obstruction"></a>**Corollary 42c.13b (a uniform quantitative affine obstruction).**

If a target $h:K\to[0,1]$ has Jensen defect

$$
D=\left|h(\lambda P+(1-\lambda)Q)-\lambda h(P)-(1-\lambda)h(Q)\right|.
\tag{42c.13.5}
$$

then every exactly normalized one-stream controller approximating $h$ uniformly with error $\epsilon$ has $\epsilon\ge D/2$. Indeed the implemented functional is affine, and the three approximation errors have total bound $\epsilon+\lambda\epsilon+(1-\lambda)\epsilon=2\epsilon$. This remains true for a sequence of finite controllers: no uniform limit of their affine responses can be nonlinear.

Example: $h(P)=[P(x_1=1)]^{2}$ on binary streams. For $P=\delta_{000\ldots}$, $Q=\delta_{111\ldots}$, $\lambda=1/2$, $D=1/4$. Therefore uniform error below 1/8 is impossible. On IID Bernoulli laws, requesting two independent bits realizes $q^{2}$. There is no contradiction: the IID family is not convex under mixtures of full stream laws. On the mixture above, all bits are perfectly correlated. This is a concrete failure of transporting the IID compiler to arbitrary changing sources.

<a id="corollary-42c13c-retained-discontinuities-cannot-be-exact-universal-outputs"></a>**Corollary 42c.13c (retained discontinuities cannot be exact universal outputs).**

If $x_{j}$ approaches $x$ but $g(x_j)$ does not approach $g(x)$, no almost-surely finite controller on all deterministic streams realizes $g$. For example, $g(x)=1$ if any stream bit is 1, and 0 on the all-zero stream, fails: streams with their first 1 arbitrarily late approach the all-zero stream. A search that outputs 1 on finding a 1 is valid as a **partial** instrument, but remains pending forever on all zeros. The pending branch is part of its response.

A general source-class obstruction needs no compactness. If $P$ and $Q$ have equal length-$N$ prefix laws, then the law of all retained controller observations up to operation $N$ is equal. In particular all completed output probabilities and the pending probability coincide. If $f(P)=0$ and $f(Q)=1$, that common pending probability must be one; otherwise at least one completed output has positive probability under both laws. If a source $P$ has alternatives $Q_{N}$ indistinguishable through every $N$ but with the opposite deterministic required output, a total exact controller cannot halt under $P$. This argument applies to non-IID and time-changing sources.

**Part 3. Whole transcript, controls and native instruments.**

The full response law is specified as follows. For a fixed program and a causal external token policy, define $R(h\mid x,u)$ as the deterministic indicator that finite source/coin tapes $x,u$ and that token history produce the complete finite retained history $h$. Its law is

$$
\Pr_P(H=h)=\int_X\int_{[0,1]}R(h\mid x,u)\,du\,P(dx).
\tag{42c.13.6}
$$

with external token kernels multiplied in their chronological order. All finite-time laws normalize because each next operation is a total normalized transition. The terminal transcript space also includes an infinite-pending event. Under Theorem 42c.13a's unperturbed progress schedule its mass is zero, but interventions may deliberately produce it.

Use the explicit finite token alphabet START(j), STEP, HOLD, ABORT, READ, and INVALID, for a frozen finite menu of $g_{j}$ programs. START(j) is valid only in READY and chooses the program once; additional START is INVALID. STEP advances one native controller operation. HOLD changes no computational state but advances and archives the clock. ABORT sets a terminal ABORT flag. READ copies the current status, latest acquired prefix length and archived output (if any) without changing them. Unknown codes set a sticky INVALID flag and produce INVALID on subsequent step/read operations. STOPPED, ABORT and INVALID retain their status, and future tokens remain archived. A deadline reader emits the current terminal value or TIMEOUT; it never conditions away pending paths. This is a total grammar on one source.

Adaptive token policies see only already released records. They cannot look at future source symbols or future private coins. Arbitrarily many HOLD tokens remove any universal termination guarantee, exactly as an external adversary can halt any computer's clock. Theorem 42c.13a requires the designated progress schedule or a separately promised fair scheduler. Adaptive choice of j from a previously observed history is allowed as a new invocation on the remaining source suffix, but its conditional law is the actual conditional source law. It is not a fresh IID input or the unconditional original P.

For a source prefix with law $P_{n}$, its classical register state is $\rho_n=\sum_w P_n(w)|w\rangle\langle w|$. Prefix consistency is precisely the marginal consistency of these states. A symbol read-and-archive instrument can be taken as

$$
K_a=|a\rangle_R|a\rangle_V\otimes\langle a|_S.
\tag{42c.13.7}
$$

from source symbol $S$ to two new records $R,V$ (or the isometric copying version retaining $S$). $\sum_a K_a^\dagger K_a=I_S$. Padded invalid labels are retained as declared outcomes if a binary encoding has unused words. Tensoring $I_{E}$ proves complete normalization with any spectator $E$. This is a classical-source contract; for coherent $S$ the same instrument dephases $S$.

Fair private bits use a prepared $|0\rangle$, $H$, and the same complete computational instrument. Every deterministic finite controller update is supplied as an XOR extension $|z,q\rangle\to|z,q\oplus G(z)\rangle$ retaining $z$, with total $G$ including malformed and invalid words. This is an involution and hence unitary on the whole encoded space, not only valid states. All readout maps are complete instruments; no acceptance branch is renormalized. Finite-deadline programs may be compiled into Toffoli/CNOT/NOT gates with fresh banks or into explicitly charged XOR truth-table ports. Independent spectators are untouched by these local operations. The source request itself is an acquisition service, not a synthesized probability oracle.

Initialization prepares controller READY, empty retained banks, the chosen program description and the fixed source cursor. It does not prepare or infer P. If the source is delivered from a larger physical mechanism, that mechanism's initial stock, supply and acquisition price must be supplied independently.

**Part 4. Inventory and clock contract.**

For any fixed stage deadline $k$, the construction consumes at most $m(k)$ source symbols and $k$ fair bits. It stores every acquired symbol, every fair bit, every raw token, every controller configuration or reversible garbage bank, all clock/invoice records, output and status, plus the supplied program/table. There are no resets. A concrete circuit compiler determines a finite gate list with widths $b_{i}$ and primitive durations $\tau_{i}$. Its ledger is:

$$
\begin{aligned}
B_{\rm peak}&=B_{\rm program}+B_{\rm initial}+\sum_i B_{\rm fresh}(i),\\
T_{\rm deadline}&=\sum_i\tau_i,\\
C_{\rm deadline}&=C_{\rm source\text{-}preparation}+C_{\rm delivery}\\
&\quad+\sum_i\bigl(C_{\rm acquire}(i)+C_{\rm prepare}(i)+C_{\rm gate}(i)+C_{\rm clock}(i)+C_{\rm invoice}(i)\bigr)\\
&\quad+\int_0^{T_{\rm deadline}}C_{\rm hold}(B(t),t)\,dt
+C_{\rm retention\text{-}after\text{-}output}+C_{\rm output\text{-}delivery}.
\end{aligned}
\tag{42c.13.8}
$$

The exact archive widths and gate/table sizes are obtained by the total finite compiler. The ledger is stated in the supplied tariff units; physical energy and native MPU capacity require the registered implementation data. Supplier preparation, source storage and source-request timing are explicitly not determined by the abstract law P. The same is true of an arbitrary supplied exact native constant port.

At a fixed deadline all counts are finite and the output law on $\{0,1,\mathrm{TIMEOUT},\mathrm{ABORT},\mathrm{INVALID}\}$ is normalized. Under the intended progress schedule the total-variation distance from the ideal bit law embedded with zero timeout mass equals the timeout probability: the two completed masses are only reduced and the missing mass is retained as TIMEOUT. At stage $k$ it is at most $\min(1,6\cdot2^{-k})$. This comparison is for the output/status marginal; a finite archive cannot be identified with an infinite archive. For the full transcript use the explicit truncation map and retain pending completion records.

For the unbounded exact algorithm, acquisition and archive stock are finite on every completed sample path, but need not have a finite uniform worst-case bound or finite expectation. One sufficient expected-charge criterion is $\sum_k\Pr(\text{reach stage }k)\,C_{\mathrm{increment}}(k)<\infty$ with **whole** incremental physical charges; use the stated tail bound only after bounding those increments. A reusable rate additionally needs an explicit archive export/retention/reset protocol, reset errors, physical cycle duration and numerical native capacity. Theorem 42c.14 supplies these data for the one-sided noncommuting factory.

**Part 5. Closure, fixed laws, least periods and regularization remain separate.**

Theorem 42c.13a concerns implementability of a law transformation; existence of a fixed point is the separate result of Propositions 42c–42c.2. A fixed finite channel with feedback still gives $T=P_{\mathrm{feedback}}W$ and stationary $\pi$ with $T\pi=\pi$; arbitrary correlated source histories do not automatically close on their one-time marginal. Closure requires either the complete history law as state or a proved sufficient-state/conditional-kernel property. Repeated invocations on one correlated stream use conditional suffix laws and can have changing kernels. Replacing these by independent draws from one marginal changes the source.

For a continuous affine self-map $F$ of a compact convex law space, fixed-point existence follows from Proposition 42c.2. This does not turn a sampled finite output into an exact encoded probability measure. An exact fixed law is a solution $F(\mu)=\mu$. A least-period-$p$ law is a tuple with $F(\mu_i)=\mu_{i+1\bmod p}$ and no smaller period; proving $F^p(\mu)=\mu$ alone is not sufficient.

A concrete distinguishing policy on [0,1] is

$$
F(p)=\begin{cases}1,&p<\tfrac12,\\0,&p\ge\tfrac12.\end{cases}
\tag{42c.13.9}
$$

It has no exact fixed point. Its orbit $0\to1\to0$ has least period two because $0\ne1$ and neither endpoint is fixed. Its closed-convex neighborhood regularization at 1/2 is $[0,1]$, so 1/2 is a regularized fixed point. Away from 1/2 the regularization equals $F$. Thus the only regularized fixed point is 1/2. This discontinuous map is not a universally realizable finite-output functional of an unknown stream law with $p=P(x_1=1)$. The regularized value 1/2 is a consistency point of the relation (63j); an exact physical implementation of the discontinuous selector is a different object.

Theorem 14.1 is untouched: finite output capacity or stationary distributions give no intervention-stable prediction of a later variable under all receiver policies. A receiver taking the complement of the released bit makes the claimed matching event empty.

**Part 6. Interface coverage and retained scope.**

The classical stream criterion is intrinsic: continuity and affineness characterize the target functional, and the path-observable compiler supplies a normalized controller. The following parts extend the construction to output stream laws, static coherent instruments and compact source families, the numerical higher-order spaces of Proposition 42c.2(4), continuous populations, hierarchical sample sources, and finite or compatible infinite classical causal strategies. Higher-order here means the kth-order recursions and laws on $\Delta(H)$ of Proposition 42c.2(4).

These are positive realizations and exact obstructions on the named interfaces. The arbitrary regularized relation is not recoverable from policy point queries, as proved below; a supplied global relation/graph port is a stronger source contract. Actual supplier acquisition, native clock/port, archive and full-cycle ownership remain source data. The concrete numerical host below counts its entire declared native-service branch, not every supplier. Non-effective native constants remain admissible supplied data, and nonmetrizable sources are excluded under the stated countable faithful response grammar.

**Part 7. Distribution-valued self-maps: a stronger streaming extension.**

The preceding binary theorem extends to an exact distribution-valued **streaming** interface, not a finitely terminated exact-real object.

Let $X=A^{\mathbb{N}}$ and $Y=B^{\mathbb{N}}$ for finite alphabets. An output-stream controller reads the same single unknown input stream and emits successive symbols of $Y$. For every input law $P$ and every $n$, its first $n$ output symbols must be produced after finitely many operations almost surely. The full output is not required to finish after finitely many operations. Emitted prefixes, source prefixes, private coins and control history are retained. The output law $F(P)$ belongs to $P(Y)$, with weak topology.

<a id="theorem-42c13d-all-continuous-affine-stream-law-transformations"></a>**Theorem 42c.13d (all continuous affine stream-law transformations).**

An $F:P(X)\to P(Y)$ has such a controller exactly when $F$ is continuous and affine. Effective sufficiency requires uniformly computable cylinder probabilities of the kernel

$$
\kappa_x=F(\delta_x).
\tag{42c.13.10}
$$

with supplied computable cylinder moduli for each output depth and requested precision. This is data for a fixed controller, not a runtime oracle for the unknown input law. No IID or stationarity assumption is made.

**Necessity.** For every output word $v$, membership in the cylinder $[v]$ is decided after the controller has produced $|v|$ output symbols. This is a binary finite-almost-sure response in Theorem 42c.13a. Hence $P\to F(P)([v])$ is continuous affine. Cylinders determine probability measures. Their indicators linearly span the locally constant functions, uniformly dense in $C(Y)$. Therefore these component statements imply weak continuity and affineness of $F$.

**Kernel representation.** Continuity gives weak continuity of $x\to\kappa_x$. Affineness and finite-supported density, tested on each output cylinder, give

$$
F(P)([v])=\int_X\kappa_x([v])\,P(dx).
\tag{42c.13.11}
$$

**Constructive sufficiency.** Order B and every finite word lexicographically. At depth n define cumulative cylinder masses

$$
c_{n,0}(x)=0,\qquad c_{n,j}(x)=\sum_{i\le j}\kappa_x([v_{n,i}]),\qquad c_{n,|B|^n}(x)=1.
\tag{42c.13.12}
$$

Every $c_{n,j}$ is continuous. They partition [0,1] into ordered intervals; depth n+1 refines depth n because child cylinder masses sum to their parent. Draw one common uniform U by fair bits. Output word $v_{n,j}$ when finite observations certify

$$
c_{n,j-1}(x)<U<c_{n,j}(x).
\tag{42c.13.13}
$$

Certification uses rational upper/lower bounds for the continuous endpoint functions from a sufficiently long input prefix and a sufficiently fine dyadic interval for $U$, exactly as in Theorem 42c.13a. For each fixed $x$, the union of all endpoint sets $\{c_{n,j}(x):n,j\}$ is countable and hence $U$ hits it with probability zero. Outside this set each depth is certified after finitely many operations. Refinement ensures already emitted symbols never change. Zero-mass cylinders are never selected. The selected cylinder probabilities are precisely $\kappa_x([v])$, proving the output law conditional on $x$ is $\kappa_{x}$ and the unconditional law is $F(P)$.

At fixed depth $n$, suppose all cumulative endpoints are approximated within $e=2^{-k}$ (including source-prefix variation and rational calculation) and $U$ is bracketed within $e$. Failure to certify requires $U$ within $2e$ of some cumulative boundary; a union bound gives

$$
\sup_P\Pr(\mathrm{first}\ n\ \mathrm{symbols\ not\ certified})\le\min\{1,4(|B|^n+1)2^{-k}\}.
\tag{42c.13.14}
$$

If a compiler approximates individual masses instead of cumulative endpoints, it must divide their individual error budget by $|B|^n$ before applying this formula. This avoids an omitted accumulation factor. A finite deadline compiler may certify depth $n$ directly and release its $n$ symbols in order; its released-prefix law agrees exactly with the streaming kernel. An online implementation dovetails the finite certifications and preserves all earlier output. The complete infinite archive is not produced in finite time.

**Typed meaning of fixed and periodic laws.** With $B=A$, $F$ is a continuous affine self-map of the compact convex stream-law space. Its fixed points are invariant input/output stream laws $F(P)=P$, not fixed sample streams. Proposition 42c.2 applies. For example, complementing every binary input symbol is a causal exact streaming controller with $F(P)=C_*P$ and $F^{2}=\text{identity}$. The source $\delta_{000...}$ has least period two under $F$; the correlated mixture $(\delta_{000\ldots}+\delta_{111\ldots})/2$ is fixed. The latter is not IID. This realizes a distribution-space example outside the IID family. Finding an invariant law from code, preparing it, or proving convergence of iteration is a distinct task.

**Boundary of the extension.** This is an intrinsic full classification for compact **stream-law** inputs and outputs with prefix-almost-sure streaming semantics. Identifying a Cantor name with an exact compact physical state requires a chosen representation, representation-invariant outputs and native ports. Quantum coherences and controlled process inputs are treated in parts 8–9 and 18–20. For a finite requested output prefix the circuit/instrument/archive construction in parts 3–4 applies, with all endpoint tables and computation charged. For the infinite output, total archive and total elapsed time are not finite, and no reusable finite cycle follows.

**Part 8. Coherent quantum streams: explicit failure of the classical criterion.**

This construction tests, and refutes, the tempting extension “continuous affine law response implies finite-almost-sure implementation” to all coherent source states. It is a coverage-complete no-go for the displayed response over the full coherent stream input class.

Let the source be an infinite chain of qubits, with quasi-local observable algebra the norm closure of finite-prefix matrix algebras. Let $X_{1}$ be Pauli $X$ on site 1 and $Z_{n}$ Pauli $Z$ at site $n$. Set $\theta_n=2^{-n}$ for $n\ge 2$ and

$$
V=\sum_{n\ge2}\theta_nX_1Z_n,\qquad U=e^{iV},\qquad A=U(|1\rangle\langle1|_1\otimes I)U^*.
\tag{42c.13.15}
$$

The series converges in operator norm since $\sum\theta_n<\infty$; its terms commute. Thus $U$ and the projection $A$ belong to the quasi-local algebra. The response $f(\rho)=\rho(A)$ is affine and continuous on the compact weak-* state space. It is the probability of a mathematically valid binary POVM $\{A,I-A\}$, and defines a completely positive classical-output readout.

<a id="theorem-42c13e-no-nonzero-local-effect-hence-no-exact-finite-completion"></a>**Theorem 42c.13e (no nonzero local effect, hence no exact finite completion).**

For every N and every positive effect E in the first-N-sites algebra,

$$
E\otimes I_{\rm tail}\le A\quad\Longrightarrow\quad E=0.
\tag{42c.13.16}
$$

Consequently no source-independent controller reading only finitely many sites on each completed path can realize f on all coherent source states with almost-surely finite output. This includes adaptive finite quantum instruments, fixed ancillas, coherent finite memory and arbitrary fixed private randomization.

**Proof.** Apply the positive conditional expectation obtained by evaluating tail sites in a joint Z-eigenstate. Since E is local it is unchanged. The conditional image of A is the projection

$$
A(t)=e^{iX_1(\sum_{n=2}^N\theta_nZ_n+t)}(|1\rangle\langle1|_1\otimes I_{2,\ldots,N})e^{-iX_1(\sum_{n=2}^N\theta_nZ_n+t)}.
\tag{42c.13.17}
$$

where $t=\sum_{n>N}\theta_n z_n$. Choose two tail assignments differing at one site $m>N$. Their $t$ values differ by $\delta=2\theta_m$, which is not an integer multiple of $\pi$. If $E\le A$, positivity gives $E\le A(t)$ and $E\le A(t+\delta)$. For a positive operator dominated by a projection, its range lies in that projection's range. Resolve the first $N$ sites by the common eigenbasis of $Z_2,\dots,Z_N$. In each block the two projections have one-dimensional ranges, obtained by rotating $|1\rangle$ around $X$ by angles differing by $\delta$. Their line intersection is zero because $\sin(\delta)\ne0$. The full projection ranges therefore have zero intersection. Hence $E=0$.

For any finite controller, the event “output 1 by operation $N$” has a positive effect $E_{N}$ supported on at most the first $N$ source sites, after absorbing fixed ancillas and all private randomness. An algorithm realizing $f$ for every source state must satisfy $\rho(E_N)\le\rho(A)$ for every $\rho$, so $E_N\le A$ in operator order. The result above gives $E_{N}=0$ for every $N$. Countable additivity then gives zero probability of any finite completed 1-output under every state, contrary to $\rho(A)=1$ for states supported on the projection. This proves the no-go. The argument does not rely on a finite cutoff for the entire algorithm.

**Uniform finite approximation nevertheless exists.**

Let $U_N=\exp(i\sum_{n=2}^N\theta_n X_1Z_n)$, $A_N=U_N|1\rangle\langle1|_1U_N^*$. The commuting-tail formula, or a unitary norm bound, gives

$$
\|A-A_N\|\le2\|U-U_N\|\le2\sum_{n>N}\theta_n=2^{1-N}.
\tag{42c.13.18}
$$

Measuring the finite-prefix projection $A_{N}$ yields uniformly correct bit probabilities within $2^{1-N}$ on **all** states, including entangled states with external references for the corresponding classical outcome statistics. The instrument's native rotations must still be supplied or approximated with their own declared errors. The tail-angle bound is independent of the input state. Thus this example sharply separates exact finite-almost-sure implementation from arbitrary uniform finite approximation. No spectral gap in the effect itself repairs the issue: $A$ is a projection with spectrum $\{0,1\}$; it is the nonlocal support geometry that prevents finite stopping effects.

The approximation concerns the POVM effect and its classical outcome statistics. A retained postmeasurement source channel is fixed by its instrument, and the approximating projection instrument is distinct from the exact nonlocal Lüders instrument, also in the presence of a coherent spectator.

**Part 9. Full binary-effect classification on coherent static streams.**

The obstruction in part 8 admits an exact operator-regularity classification. The source here is one consistent coherent static stream, with arbitrary state on the quasi-local algebra; controlled quantum processes are outside this class. Reading/acquiring the next systems does not resample, reprepare, or decorrelate them. Fixed causal controller instruments act on the acquired prefix, which may be retained coherently. The target is a classical bit plus a specified stopping/archive record; it is not an independently prescribed postmeasurement source channel.

Let $L_{n}$ be the first-$n$-sites full matrix algebra (allow increasing known finite site dimensions). Write $L_{\mathrm{loc}}=\bigcup_n L_n$. A *local-positive decomposition* of an effect $E$ is a sequence of pairs $A_j,B_j$ in $L_{\mathrm{loc}}$ with

$$
A_j,B_j\ge0,\qquad S_n=\sum_{j\le n}(A_j+B_j)\le I,\qquad \sum_jA_j=E,\quad\sum_jB_j=I-E.
\tag{42c.13.19}
$$

where the two sums converge in operator norm. Equivalently, $E$ and $I-E$ each belong to the cone of norm-convergent sums of positive local operators. Reindexing puts the supports of the first $n$ summands inside a known nondecreasing finite prefix $m(n)$. Define $R_n=I-S_n$. This is an intrinsic positive-cone condition on the requested effect, stronger than mere norm approximation by local observables. It does not mention a stopping tree or a physical algorithm. The all-state quantifier is essential.

<a id="theorem-42c13f-local-positive-cone-criterion"></a>**Theorem 42c.13f (local-positive cone criterion).**

A binary effect $E$ has a controller with almost-surely finite completion on every coherent stream state if and only if $E$ has a local-positive decomposition. This statement permits fixed finite local instruments with exact coefficients as mathematical services. Effective compilation additionally requires computable finite matrices, a computable residual bound $\lVert R_n\rVert\le\eta_n$ tending to zero, certified support/equality branches for the finite inverses below, and supplied exact native instruments (or a separate approximation contract). Bare approximate matrix entries do not decide support.

**Necessity.** Let $E_{n}$ and $D_{n}$ be the effects of output 1 or 0 by operation $n$. Finite-prefix instruments give local positive effects, with $E_{n}$ increasing, $D_{n}$ increasing, $E_n+D_n\le I$. Their increments $A_n=E_n-E_{n-1}$, $B_n=D_n-D_{n-1}$ are positive and local. Include any operation-zero output in the first increments. Almost-sure termination for every state $\rho$ gives $\rho(R_n)$ decreasing to zero, where $R_n=I-E_n-D_n$. The state space is weak-* compact; each $\rho\to\rho(R_n)$ is continuous. The same compact-open-cover argument as Theorem 42c.13a gives $\sup_\rho\rho(R_n)$ tending to zero. For positive $R_{n}$ this supremum is $\lVert R_n\rVert$. Since $0\le E-E_n\le R_n$ and $0\le I-E-D_n\le R_n$, the two sums converge in norm. No assumed mixing, tensor-product input state or independent-copy access occurs in this proof.

**Sufficiency with a complete instrument.** At stage $n$ acquire all sites through $m(n)$, retaining their existing correlations. Regard prior residual $R=R_{n-1}$ ($R_0=I$) as an operator on this acquired prefix. Let $P_{R}$ be its support projection and $R^{-1/2}$ its Moore–Penrose inverse square root. Set

$$
K_{n,1}=\sqrt{A_n}R^{-1/2},\quad K_{n,0}=\sqrt{B_n}R^{-1/2},\quad K_{n,?}=\sqrt{R_n}R^{-1/2},\quad K_{n,\rm invalid}=I-P_R.
\tag{42c.13.20}
$$

Since $A_n+B_n+R_n=R$, the sum of the first three $K^*K$ is $P_{R}$; the invalid Kraus term supplies $I-P_R$. Thus the full instrument is trace-preserving on every input, including malformed states and arbitrary spectators. Outcomes 1,0 halt, ? continues, and invalid is retained as INVALID rather than discarded.

Inductively the composed continuation Kraus operator from the original acquired prefix is $\sqrt{R_{n-1}}$. All positive summands have support in $P_{R}$ because they are dominated by $R$. Hence

$$
K_{n,1}\sqrt R=\sqrt{A_n},\quad K_{n,0}\sqrt R=\sqrt{B_n},\quad K_{n,?}\sqrt R=\sqrt{R_n},\quad K_{n,\rm invalid}\sqrt R=0.
\tag{42c.13.21}
$$

These identities hold also across newly acquired sites by tensoring prior operators with their identities. Therefore the stage-$n$ stopping effects on the original input are $A_n,B_n$, and the pending effect is $R_{n}$. The invalid branch is null on valid initialized executions, but remains a declared output on the full native domain. Probability of pending at stage $n$ is $\rho(R_n)\le\eta_n$. The completed bit effect is $E$. Finite-a.s. termination follows, uniformly over all coherent source states.

For a spectator Z the full local maps are tensored with $I_{Z}$. In particular the subnormalized spectator state associated with bit 1 is the sum over the stopping branches and equals the partial trace defined by the effect E. The retained source poststate and stage archive are the explicitly constructed instrument; a separately chosen Lüders instrument for E is a different instrument.

**Scope and decision caveat.** This is a necessary and sufficient structural classification with a constructive normalization proof. Effective support branches and an effective decomposition are substantial inputs. The criterion does not collapse to norm-quasilocality: Theorem 42c.13e gives an explicit norm-quasilocal projection outside the cone, while Theorem 42c.13g below gives a large constructive interior class inside it. Finite physical supplier, clock and price data remain separate from the state-space effect.

<a id="theorem-42c13g-every-uniformly-interior-quasi-local-effect-has-an-exact-factory"></a>**Theorem 42c.13g (every uniformly interior quasi-local effect has an exact factory).**

Suppose a supplied rational $\delta>0$ satisfies

$$
\delta I\le E\le(1-\delta)I.
\tag{42c.13.22}
$$

Suppose selfadjoint local $H_{n}$ are supplied with certified norm errors

$$
\|H_n-E\|\le\varepsilon_n=\delta\,2^{-(n+4)},\qquad n\ge0.
\tag{42c.13.23}
$$

Then E has an explicit convex decomposition into finite local effects and an exact universally finite-a.s. controller requiring no support inverses.

Put $d_n=\epsilon_n+\epsilon_{n-1}=3\delta\cdot2^{-(n+4)}$ for $n\ge 1$ and $D=\sum_{n\ge1}d_n=3\delta/16$. Define

$$
p_0=1-2D,\quad C_0=\frac{H_0-DI}{1-2D},\quad p_n=2d_n,\quad C_n=\frac12\left(I+\frac{H_n-H_{n-1}}{d_n}\right)\quad(n\ge1).
\tag{42c.13.24}
$$

All $p_{n}$ are nonnegative and sum to one. Since $\lVert H_n-H_{n-1}\rVert\le d_n$, each $C_n$ for $n\ge 1$ lies in $[0,I]$. For $C_{0}$, the lower bound $H_0\ge15\delta I/16$ exceeds $D I$; the upper bound $H_0\le(1-15\delta/16)I$ is at most $(1-D)I$. Thus $0\le C_0\le I$. Telescoping in norm gives

$$
E=\sum_{n\ge0}p_nC_n,\qquad I-E=\sum_{n\ge0}p_n(I-C_n).
\tag{42c.13.25}
$$

The residual after including indices through k is exactly

$$
\sum_{n>k}p_nI=\frac{3\delta}{8}\,2^{-k}I.
\tag{42c.13.26}
$$

Sample $N$ independently with probabilities $p_{n}$ and measure the finite-prefix POVM $\{C_N,I-C_N\}$. The sample can be generated by a rational fixed coin for the $p_{0}$ branch, followed by a geometric fair-coin index on its complement. Every $N$ is finite almost surely, independent of the source state. Its input prefix size and native measurement time are whatever the supplied local approximation requires; finite mean $N$ does not imply finite mean source acquisition or physical duration. The full archive retains $N$, all private coins and the measured outcome. This gives a coherent non-IID exact branch beyond the affine-mixture IID factories of Theorem 42c.10, while the boundary projection of part 8 remains impossible.

**Native realization, deadlines and cost binding for Theorem 42c.13f.**

Every stage is a finite normalized instrument. For algebraic data with supplied support branches, its stacked Kraus map is an algebraic isometry. Complete its columns by finite algebraic orthonormalization to a unitary $V_{n}$; the zero/nonzero pivots are certified branch data. A block involution

$$
J_n=\begin{pmatrix}0&V_n^*\\V_n&0\end{pmatrix}.
\tag{42c.13.27}
$$

with one fresh flag maps $|0\rangle\otimes\psi$ to $|1\rangle\otimes V_n\psi$. The same positive pulse as Definition 42c.6,

$$
H_n(t)=\frac{\pi\hbar}{2\tau_n}\left(1-\cos\frac{2\pi t}{\tau_n}\right)(I-J_n).
\tag{42c.13.28}
$$

implements $J_{n}$ in duration $\tau_{n}>0$. Complete computational-basis readout of its outcome register, two retained label copies, and the total controller grammar of part 3 implement 1,0,?,INVALID. All flags, source-prefix registers, dilating ancillas, raw outcome labels, controller banks, support-branch/program tables, clocks and invoices are retained. No reset is hidden. Each deadline stops after a finite prefix of this supplied stage list, with TIMEOUT effect $R_{n}$ and full normalization. Its bit/status TV error is at most $\lVert R_n\rVert$.

This supplies explicit finite native **controller** maps; supplier prices are source data. To obtain a fully evaluated physical instance one must supply site dimensions, each algebraic stage matrix/lookup size, preparation and acquisition services, $\tau_{n}$, holding/retention charges and the chosen horizon; then count every listed register/port and pulse by the same finite census as Definition 42c.6. An infinite list is not one finite native port, and a norm limit is not a finite source preparation.

**Part 10. Higher-order domains and the numerical-name interface.**

Proposition 42c.2(4) uses **kth-order recursions on Delta(H)^k and second-order probability laws Delta(Delta(H))**. The general ambient K in 42c.2 is compact convex locally convex Hausdorff, not necessarily metrizable. The next bridge addresses the actual effective compact-metric branches without replacing unknown samples by a law oracle.

**Named-input contract.**

An effective compact metric space $K$ comes with finite $2^{-r}$ nets $D_r=\{d_{r,i}:i<M_r\}$, computable distances between named points and finite index bounds $M_{r}$. A numerical input for $x$ in $K$ is a supplied sequence of finite indices $i_{r}$ with $d(x,d_{r,i_r})\le 2^{-r}$. Different valid names of the same $x$ are identified in the response quotient. Requesting a name digit is an explicitly supplied **numerical input service**. It is not inferred from one sample, a population, or an unknown stream.

A supplied computable continuous $F:K\to L$ includes an effective modulus $\mu$: $d(x,x')\le 2^{-\mu(n)}$ implies $d(Fx,Fx')\le 2^{-n}$, and an algorithm approximating $F$ on the finite net points. Increase $\mu$ if necessary to be nondecreasing. For desired output error $2^{-n}$, request the input index at $r=\mu(n+2)$. Before runtime, compile a total finite table $T_{n}$ that maps every valid net index $i$ to an output-net index $j$ such that

$$
d_L(d^{\prime}_{n+2,j},F(d_{r,i}))\le2^{-(n+1)}.
\tag{42c.13.29}
$$

A sufficiently fine output net and the supplied approximation algorithm find such an index; strict error slack avoids deciding equality of arbitrary computable reals. The runtime output $z_n=d'_{n+2,T_n(i_r)}$ satisfies

$$
d_L(z_n,F(x))\le2^{-(n+2)}+2^{-(n+1)}<2^{-n}.
\tag{42c.13.30}
$$

Thus finite-prefix outputs form a correct name of $F(x)$. For every valid input name they represent the same $F(x)$, although finite rounded outputs and archives may differ. The quotient is equality of the decoded limiting object; finite readout contracts retain their stated error. This is exact name-realization in the limit and a uniform finite approximation at every requested precision, **not** finite-time production of an exact real object.

Finite products use the maximum metric and product nets. Therefore the kth-order update $(x_1,\dots,x_k)\to(F(x_1,\dots,x_k),x_1,\dots,x_{k-1})$ has the same compiler when $F$ and its modulus are supplied. Every initial coordinate has its own actual name; a late intervention changes the designated later update, not the already archived initialization. A finite menu of changing computable maps uses the selected table for each update. Exact recursions are implemented at the name level by composition. For a finite requested horizon, errors may instead be propagated through the supplied moduli; the precision schedule is calculated backward to meet the final tolerance.

**Explicit nets for second-order laws.**

For $K=\Delta_d$ with $\ell^1$ metric, rational vectors with denominator $M$ form a finite net of radius at most $2d/M$ (round $d-1$ coordinates down and put the remainder in the last coordinate). For $P(K)$ use Wasserstein-1 with this metric; on compact $K$ it gives the weak topology. Let $G$ be the finite rational $M$-grid with $J$ points. Push any measure to nearest grid points, moving it by at most $2d/M$ in Wasserstein distance. Round its $J$ weights to denominator $L$ by rounding $J-1$ down and putting the remainder in the final weight. Their $\ell^1$ error is at most $2J/L$, hence a conservative Wasserstein error at most $2J/L$ because the diameter of $\Delta_{d}$ is two. Thus the finite family of grid-supported rational laws gives a net with error at most

$$
\frac{2d}{M}+\frac{2J}{L}.
\tag{42c.13.31}
$$

Choose $M\ge 8d\cdot 2^r$ and $L\ge 8J\cdot 2^r$ to obtain error at most $2^{-(r+1)}$. Distances between these finite rational laws are exact rational transportation linear programs. This is a concrete effective compact representation of $\Delta(\Delta(H))$. The supplied input law is a Wasserstein name. A population-only source must provide a proved statistical approximation guarantee to produce such names with specified confidence.

For finite-output stochastic readout, supplied computable probabilities with a uniform error/modulus contract can be sampled exactly using retained fair bits and cumulative-probability intervals. The bit/output prefix halts almost surely and retains TIMEOUT at deadlines. A finite output probability may be computable from a name even when the full law object requires an infinite name. Readout functionals must respect the quotient; an arbitrary discontinuous equality test of a named real does not.

**Obstructions which the name contract does not erase.**

Finite programs on the stated finite-prefix numerical names realize continuous extensional maps. The proof is specific to this representation. Let $N$ be the valid-name subset of the compact product of the finite index sets. The relation $\{(\text{name},x): d(x,d_{r,i_r})\le 2^{-r}\text{ for every }r\}$ is closed in that product times compact $K$; its projection $N$ is therefore compact. Each valid name determines a unique $x$. Two names agreeing at level $r$ decode to points at distance at most $2^{1-r}$, so $\operatorname{decode}:N\to K$ is continuous and surjective, hence a quotient map. A total finite-prefix deterministic output program is continuous on $N$. A universally almost-sure finite binary-output program is continuous on $N$ by increasing finite halting-event probabilities and their complements, exactly as in Theorem 42c.13a. Extensionality and the quotient property give continuity of the decoded response on $K$. Extra branch/equality answers or discontinuous native ports can change this conclusion, but they are additional source services, not consequences of a Cauchy name.

Even continuous computable maps do not yield a general exact fixed/least-period **membership decision**. Given a program $e$, define $a_e=2^{-(t+2)}$ if $e$ halts at step $t$, and $a_{e}=0$ if it never halts. This is a uniformly computable real in $[0,1/4]$, since simulating enough steps bounds an unobserved later value below the requested error. For the continuous constant map $F_e(x)=a_e$, the named point $0$ is fixed exactly when $e$ never halts. Likewise $G_e(x)=a_e+(1-2a_e)(1-x)$ has $0$ of least period two exactly when $a_e=0$: $G_e(0)=1-a_e$ and $G_e^2(0)=2a_e(1-a_e)$. A purported exact membership decider would decide halting. The existing existence theorems and rational-PWA decision procedures are not contradicted.

Regularized laws remain separate data: at continuity points the regularization equals F. At a retained discontinuity, a supplied cluster-value/weight witness can be read and sampled with its actual precision/branch services, but the compiler does not discover arbitrary cluster sets or decide exact equality from Cauchy approximations. In finite dimension, the at-most-d cluster mixture of Proposition 42c.2(3) is an existential witness bound; Theorems 42c.13h and 42c.13h.1 exclude a universal computable witness extractor.

Finally, a nonmetrizable compact K cannot be treated as a finite-alphabet numerical-name space with a faithful continuous embedding into a countable observable product: a compact space so embedded is metrizable. The general topological existence theorem (Proposition 42c.2) remains valid; physical realization needs its actual observable quotient and source representation. Countable-name constructions therefore cover metrizable domains only.

<a id="theorem-42c13k-no-universal-exact-fixed-or-periodic-initializer-from-continuous-map-names"></a>**Theorem 42c.13k (No Universal Exact Fixed or Periodic Initializer from Continuous Map Names).** Transporting a supplied witness, deciding whether a supplied point is fixed, and constructing some consistency witness from the map alone are different tasks. Even a uniformly computable continuous one-parameter family of affine maps has no everywhere-total continuous exact fixed-point initializer, and no universally finite-almost-sure numerical-name sampler supported on its fixed points. Thus INIT$(F)$ and INIT$(F,\text{witness})$ are different contracts.

*Proof.* For a supplied ordinary Cauchy name of $t\in[-1,1]$, define
$$
F_t(x)=(1-|t|)x+\max\{t,0\},\qquad 0\le x\le1.
\tag{42c.13.48}
$$
This is a uniformly computable jointly continuous family mapping $[0,1]$ to itself. In particular $\|F_t-F_s\|_\infty\le2|t-s|$. For $t>0$, its unique fixed point is $1$; for $t<0$, its unique fixed point is $0$; at $t=0$, every point is fixed. Any deterministic exact selection must therefore jump from zero to one at zero. A weakly continuous probability-valued selection supported on the fixed-point set is also impossible: it must equal $\delta_0$ on the negative side and $\delta_1$ on the positive side, and its mean would have the same discontinuity.

The finite-prefix name interface cannot evade this with randomized waiting. On the compact space of valid finite-net names of $t$, the probability of each completed finite output is continuous by the increasing-halting-event/complement proof. If the selected point is itself emitted as a random Cauchy name, its precision-$n$ rational approximation has a continuous expected value and differs from the selected point by at most $2^{-n}$. The means therefore converge uniformly to a continuous function on valid input names. Extensionality and the compact quotient map from names to $t$ give a continuous mean on $[-1,1]$, contradicting the forced values zero and one. If the operational task is instead to emit a binary sample from a selected fixed law whose mass at one is $x$, that bit's probability is already this mean and the same argument applies. Every timeout or deliberate nontermination must remain a pending output; omitting it changes the task.

This obstruction is stronger than the undecidable membership example and is independent of the choice of fixed point: it excludes the construction of *any* supported exact initialization law from the map parameter alone. Exact rational-input encodings with a decidable sign, a separately supplied sign/stratum port, or a supplied fixed-point witness are stronger contracts and remain valid positive branches. Ordinary Cauchy approximations do not supply those exact branch answers. An approximate residual requirement $|F_t(x)-x|\le\varepsilon$ is different from exact fixed-law support and is not excluded by this proof.

For a promised least-period-two witness, use the compact convex product $[0,1]^2$ and
$$
G_t(x,y)=(F_t(x),1-y).
\tag{42c.13.49}
$$
Every $t$ admits an orbit of least period two: take a fixed point of $F_t$ and the alternating second coordinates zero and one. For $t\ne0$, every point satisfying $G_t^2(x,y)=(x,y)$ must have $x=1$ when $t>0$ and $x=0$ when $t<0$, because $F_t$ is a strict contraction in its first coordinate. Thus any exact initializer supported on least-period-two states has the same forbidden discontinuous first-coordinate mean, even though existence of such an orbit is promised for every parameter. A universal initializer allowed to choose *any* period already fails on $F_t$, whose only periodic states for $t\ne0$ are fixed states. The obstruction embeds in the higher-order product domains of Proposition 42c.2(4); the exact rational-PWA fixed/period procedures and transport of supplied initialized witnesses are unaffected. $\square$

<a id="corollary-42c13k1-exact-negative-names-for-continuous-fixed-and-periodic-relations"></a>**Corollary 42c.13k.1 (Exact Negative Names for Continuous Fixed and Periodic Relations).** An exact relation-name output with weaker operational readouts remains available. Let $K$ be the effectively compact metric domain of part 10, and supply a computable continuous $F:K\to K$ with its modulus. For every supplied positive integer $r$, there is a uniform effective negative-information name of $\operatorname{Fix}(F^r)$: an enumeration of basic open balls covering exactly its complement. Every emitted ball is a valid finite exclusion certificate. Dummy enumeration symbols are allowed, so each requested output-name prefix takes finite computation even when the complement is empty.

*Proof.* The nonnegative function $g_r(x)=d(F^r(x),x)$ is computable and has an effective uniform modulus obtained by composing the supplied modulus and using the metric triangle inequality. Enumerate dense named centers and positive rational radii, dovetailing their approximations. Emit a ball when a certified lower bound for $g_r$ at its center exceeds a certified modulus bound for variation over that radius. Every emitted ball has $g_r>0$ throughout. Conversely, if $g_r(x)>0$, continuity and density provide a sufficiently close center and a sufficiently small ball containing $x$ with strictly positive margin. The dovetailed search eventually certifies such a ball. Thus the union of emitted balls is exactly $K\setminus\operatorname{Fix}(F^r)$.

The least-period-$r$ stratum has the exact finite Boolean representation
$$
\operatorname{Per}_r(F)=\operatorname{Fix}(F^r)
\setminus\bigcup_{\substack{s\mid r\\s<r}}\operatorname{Fix}(F^s).
\tag{42c.13.50}
$$
Return that Boolean expression together with the negative names of its finitely many closed-set operands. The stratum is in general not closed, and the code supplies neither a membership test nor a witness. The same construction on $K\times K$, using $g(x,y)=d(y,F(x))$, gives a negative name of the graph of $F$; at continuity points and for continuous $F$ the regularization is the same graph. All finite enumeration stages compile through the total numerical host with retained input, output, dummy and pending records, and their actual computation/acquisition costs. This preserves exact decoded relations while respecting the negative initialization and equality results. General discontinuous finite policy codes do not inherit this construction: Theorem 42c.13h.1 excludes even their uniform regularization negative-name compiler. $\square$

**Part 11. A completely counted finite numerical-lookup host.**

To make the finite-prefix bridge concrete, the following is one frozen source/controller host for one requested table $T_{n}$. It is a supplied algebraic native-service contract; its table, clock and input source are counted below. No arbitrary input law is synthesized.

Let $b=\max(1,\lceil\log_2 M_r\rceil)$, $c=\max(1,\lceil\log_2 M'_{n+2}\rceil)$, $d=2$ and $v=c+3$. The external classical input has $b$ index bits and $d$ token bits. Tokens are QUERY, HOLD, ABORT, INVALID. A total function $G$ on all $b+d$ input bits outputs $v$ bits: $c$ payload bits and a three-bit status. QUERY with an in-range index returns $T_n(i)$,DONE; HOLD returns zero,PENDING; ABORT returns zero,ABORT; invalid tokens or out-of-range QUERY index return zero,INVALID. Every unused status/payload code is still a declared physical readout. The source-name validity across all precisions is a promise of the numerical input contract; finite hardware does not decide consistency of an infinite name.

Allocate input and input-archive banks of b bits each, token and token-archive banks of d bits each, and lookup-output, output-archive and reader banks of v bits each. Also allocate six tick bits, six invoice bits, six heat capsules and one ready flag. The mutable-qubit count is

$$
B=2b+2d+3v+19.
\tag{42c.13.32}
$$

Add a seven-level reservoir, initially level zero; its capacity is log2(7) bits. All banks except the delivered input/token start zero; heat capsules start excited. The six slots, each of duration $\tau>0$, are:

1. XOR-copy the token into its archive.
2. XOR-copy the input index into its archive.
3. Apply $|i,t,q\rangle\to|i,t,q\oplus G(i,t)\rangle$.
4. XOR-copy the $v$-bit result into the output archive.
5. XOR-copy the $v$-bit result into the reader.
6. Measure the reader in its complete computational basis and release that label.

Each slot also toggles its fresh tick and invoice bits and transfers the excitation of its dedicated capsule to the next reservoir level by the supplied energy-conserving swap. The controller action ports in slots 1–5 are involutions; the positive pulse in Definition 42c.6 implements them. Slot 6 is the supplied complete computational instrument. The tick/invoice/heat services have their own ports and are counted, even when simultaneous with the action. The capsule/reservoir gap is $E_*=\hbar/\tau$; six prepared excitations supply $6E_*$ of bookkeeping transfer. The declared action-service tariff includes its pulse-waveform generation, drive work and measurement service; these are not inferred from that transfer. The native-port acquisition/holding tariff includes the supplied port’s built-in drive/control hardware. If an implementation instead has a separate shared pulse/clock driver, its actual acquisition, holding and calibration invoice must be added. No reset occurs. Retention is seven slots, one beyond output release.

The exact declared port census is:

| Native stock | Count |
|---|---:|
| Input archive XOR sparse rows | $2^{2b}$ |
| Token archive XOR sparse rows | $2^{2d}$ |
| Lookup XOR sparse rows | $2^{b+d+v}$ |
| Two result-copy sparse rows | $2\cdot 2^{2v}$ |
| Complete reader Kraus dense entries | $2^{3v}$ |
| Twelve tick/invoice X dense entries | 48 |
| Six 14-dimensional heat-swap sparse rows | 84 |
| Six capsule plus reservoir energy diagonals | 19 |

Let $C_{\mathrm{nat}}$ be their sum and $D_{\mathrm{tab}}=2^{b+d}\cdot v$ be delivered truth-table bits; the truth table and physical coupling rows are charged separately. There are six action services, six clock services, six invoice services and six heat services: 24 total. There are $B-b-d$ qubit ready preparations plus one reservoir preparation; $b+d$ external input/token bits have separate acquisition and source preparation charges. All unread/padded/invalid labels are retained by the complete instrument; arbitrary superpositions and spectators receive a normalized channel, though only classical valid names carry the numerical interpretation.

For an explicitly chosen illustrative unit tariff—one per acquired bit/counted port entry, one per ready preparation, one per service, and one per held stock unit per slot—define

$$
V=B+\log_2 7+C_{\rm nat}+D_{\rm tab},\qquad C_{\rm host}=7V+(C_{\rm nat}+D_{\rm tab})+(B+\log_2 7)+(B-b-d+1)+24.
\tag{42c.13.33}
$$

The terms are seven-slot holding; delivered port/table acquisition; acquisition of every host carrier (including the externally prepared input/token factors and reservoir); ready preparations for all nonexternal qubits and the reservoir; and 24 services. Add the supplied source's preparation/delivery charge $C_{\mathrm{supplier}}$ without identifying it with this host invoice. Source preparation is not duplicated by the host ready-preparation term, which excludes the b+d external bits. These are concrete counts under the declared inclusive native-service tariff. The separate-driver convention requires its supplied invoice and is not numerically populated by this construction. An exact-ready reset, repeated READ, additional tokens, or later precision block requires its own appended, counted services.

This host gives a fully normalized finite physical realization of every compiled numerical table on one declared source interface, with exact raw records and uniform represented-output error. All table data come from the supplied effective F and modulus, before the unknown numeric input is delivered. It extends beyond rational PWA functions. Its limiting name realization uses a sequence of finite hosts; its price/stock may grow without bound.

**Part 12. Exact sampling of a supplied second-order law as a random name.**

For the $K=P(\Delta_d)$ branch of Proposition 42c.2(4), a supplied effective weak/Wasserstein name of a probability measure $\mu$ permits a random **Cauchy name** with decoded distribution $\mu$. Each requested finite name prefix is emitted after finitely many operations almost surely.

The construction is explicit. View $\Delta_{d}$ inside $[0,1]^d$. Generate an independent random shift $s$ uniformly in $[0,1)^d$ by $d$ fair-bit tapes, and another uniform $V$ by a separate fair-bit tape. At level $n$ partition the cube by the coordinate grids $s_j+k\cdot 2^{-n}$, restricted to the cube. Use the same shift at every depth, so the partitions refine. Enumerate cells by a recursively ordered finite tree, so child intervals remain inside their parent's inverse-CDF interval.

For every fixed $\mu$, almost surely in s every grid boundary has mu-measure zero. For one coordinate and one grid level, the exceptional shifts are those hitting an atom of the coordinate marginal; a probability measure has only countably many atoms. The union over finitely many coordinates and countably many levels is still a null set. Equivalently this follows by integrating the boundary indicator over s.

Here “grid boundaries” means internal shifted cutting faces, not the outer cube boundary, which may carry atoms. On this probability-one shift event, the mu-mass of every cell is computable from the supplied measure name and the shift name. Approximate the cell indicator from below and above by bounded Lipschitz ramps near its faces. Their integrals are computable from the Wasserstein name, with error bounded by the ramp's Lipschitz constant times the name error, plus the explicitly bounded approximation of the shift. The lower and upper integrals converge to the same mass because the cell boundary is null. Search until their certified gap is below the requested tolerance. This search terminates for each cell; no unsupported decidable zero-mass test is used.

Use these mass intervals and V's dyadic intervals to certify the unique level-n cumulative-probability interval containing V, as in Theorem 42c.13d. Conditional on any valid shift, V equals no cumulative boundary at any depth almost surely. Thus each depth is certified after finite work, and the chosen cells are nested and have the correct conditional mu-masses. A selected cell has positive mu-mass and null boundary almost surely. Enumerate rational points of $\Delta_{d}$ until one lies strictly inside all its non-cube grid faces; finite interval comparisons against the shift certify this. Such a point exists because the selected cell contains a nonempty relatively open subset of the rational simplex. Cube faces shared with $\Delta_{d}$ are allowed as non-strict outer domain constraints.

The selected closed cells have $\ell^1$ diameter at most $d\cdot 2^{-n}$ and a unique limiting point. Any emitted rational point in the selected cell is within $d\cdot 2^{-n}$ of that point. Reindex $n$ by $n+\lceil\log_2 d\rceil$ to obtain a certified ordinary Cauchy name. The limiting point has law $\mu$, since every finite partition has the correct cell masses and the mesh tends to zero. All finite computations use only finitely many supplied measure-name and private-bit digits. Every raw digit, search history and pending state is retained. A deadline retains TIMEOUT; a uniform physical-time or expected-cost bound requires separate bounds on the searches and native name-prefix services.

Composing this sampler with part 10 realizes any supplied computable continuous second-order policy $F:P(\Delta_d)\to P(\Delta_d)$ as either an exact output measure-name or a random point-name whose decoded law is $F(\mu)$. These are distinct readout contracts. Both take a numerical measure-name as input; unknown sample and population inputs are the interfaces of parts 14–15, and preparing a fixed point of $F$ is the initialization task of Theorem 42c.13k.

**Part 13. Two obstructions and a sharp quantum corollary.**

**Regularization need not have any realizable supported selector.**

For the downward step $F(p)=1$ below $1/2$ and $F(p)=0$ at or above $1/2$, its regularization is $\{1\}$ below $1/2$, $[0,1]$ at $1/2$ and $\{0\}$ above $1/2$. There is no continuous deterministic selection. There is not even a weakly continuous probability-valued selection whose output distribution is supported in the indicated regularized value: away from the midpoint it would have to be $\delta_{1}$ on the left and $\delta_{0}$ on the right. Applying the continuous bounded reader $y\to y$ gives a discontinuous mean. Hence a total finite-almost-sure numerical-name sampler with those supported outputs is impossible in the ordinary name interface. The regularized fixed point $1/2$ is an existential consistency result, not a total physically computable selection rule. A supplied discontinuity/branch service or a different closed-set-output contract must be declared explicitly.

**Nonmetrizable compact sources under a countable faithful grammar.**

Suppose a frozen physical grammar has countably many finite settings/transcripts, each assigning a continuous probability $r_j(x)$ to every $x$ in a compact Hausdorff source domain $K$. If the retained response contract separates every two points of $K$, the evaluation map

$$
x\longmapsto(r_1(x),r_2(x),\ldots)\in[0,1]^{\mathbb N}.
\tag{42c.13.34}
$$

is continuous and injective. A continuous injection from compact K into a Hausdorff space is a homeomorphism onto its image; the target is metrizable. Therefore K is metrizable. Consequently a nonmetrizable K (for example $[0,1]^{\mathbb R}$ with the product topology) with all its separating continuous responses retained cannot have such a faithful countable finite-port realization. A metrizable response quotient is possible only if the omitted distinctions are outside the retained response contract. Uncountably parameterized native settings are a different grammar and are not excluded by this argument.

This is a coverage-complete exclusion for the stated grammar. Finite-dimensional supplied states or native amplitudes can contain noncomputable constants. The effective-source/compiler results must not be promoted to a noncomputability no-go for those separately supplied oracle resources. Conversely those resources are not part of an effective or sample-only interface.

**Every universally exact sharp static-stream effect is finite-local.**

Theorem 42c.13f implies a stronger classification than the explicit example in part 8: a projection $P$ admits universally almost-surely finite prefix measurement iff $P$ belongs to a finite-prefix matrix algebra. The forward implication follows by choosing a local partial success effect $E_n\le P$ with $\lVert P-E_n\rVert<1$. Its support projection $Q$ is finite-local and $Q\le P$. If $Q\ne P$, the nonzero projection $P-Q$ has $E_n(P-Q)=0$, so $\lVert P-E_n\rVert\ge 1$, a contradiction. Hence $P=Q$ is finite-local. Conversely a local projection is measured in one finite native instrument. This proof covers every sharp projection effect, including all quasilocal nonlocal projections, without relying on the particular controlled-rotation construction.

**Part 14. Compact source families, full retained instruments and hierarchical sampling.**

The universal-state cone criterion can be restricted to the **actual supplied compact source family** without imposing all-state conditions on an IID or hierarchical interface. Let $S$ be a compact subset of the static stream state space, and let $f:S\to[0,1]$. A source-independent finite-prefix controller has output probability $f$ and terminates almost surely on every $\rho$ in $S$ iff there are local positive pairs $A_n,B_n$ with

$$
\sum_{j\le n}(A_j+B_j)\le I,\qquad \sum_n\rho(A_n)=f(\rho),\qquad\sum_n\rho(B_n)=1-f(\rho)\quad(\rho\in S).
\tag{42c.13.35}
$$

The residual $R_n=I-\sum_{j\le n}(A_j+B_j)$ remains positive on the whole physical input algebra. Compactness gives $\sup_{\rho\in S}\rho(R_n)\to 0$ by the same decreasing-continuous-function argument. Norm convergence on all states is not required, nor need $f$ extend to an effect of the entire quasi-local algebra. Necessity is the finite stopping-instrument argument; sufficiency is exactly the normalized residual instrument of Theorem 42c.13f. Without compactness the same necessary/sufficient pair criterion holds with pointwise residual convergence on $S$, but no uniform tail follows. Effective compilation with certified uniform deadlines needs supplied local matrices/support data and an effective $S$-tail certificate. Thus a restricted source family is handled with its actual states.

For a **prescribed retained poststate/archive instrument**, replace the success square roots by finite local Kraus families $M_{n,a,l}$, with output label a, retained stage n and Kraus/archive label l. Require

$$
A_n=\sum_{a,\ell}M_{n,a,\ell}^*M_{n,a,\ell},\qquad\sum_{j\le n}A_j\le I.
\tag{42c.13.36}
$$

and require the desired output CP maps (with their declared source/output spaces and archives) to equal the sums of these finite local CP summands on the supplied source/spectator domain. Use stage Kraus $M_{n,a,l}R_{n-1}^{-1/2}$, continuation $\sqrt{R_n}\,R_{n-1}^{-1/2}$, and support-null INVALID. Their product with prior continuation is $M_{n,a,l}$; hence the prescribed finite output CP summands, and with them their scalar effects, are realized exactly. The residual trace controls completion and truncation. Conversely every finite stopping controller yields such local CP summands by collecting its finite Kraus branches. The physically nontrivial content is global positivity, local support, the explicit residual construction and the source-relative tail condition; exact CP-sum equality remains a mathematical certificate, not an automatically decidable test for arbitrary source code.

If only a coarse output label a is retained, summing over n,l gives its CP map. If n,l are externally observable, the target must retain them or explicitly specify an allowed archive quotient. No such labels are postselected away. A supplied coherent reference is preserved through tensor identities; equality of full instruments on entangled extensions is the CP-sum condition above, which scalar probabilities on S do not determine.

**A concrete second-order sample interface.**

For $\mu$ in $P(\Delta_d)$, define a hierarchical source: each new block independently draws one latent $p$ from $\mu$, then supplies conditionally IID categorical samples with law $p$ within that block. The latent $p$ is not released as a number. The supplier must explicitly promise block independence and within-block conditional sampling, with acquisition/reset costs; these are not inferred from marginal samples. Preallocate the countable label array and flatten it in a known order when considering a static supplier. Finite histories have probabilities

$$
\prod_b\int_{\Delta_d}\prod_a p_a^{n_{b,a}}\,\mu(dp).
\tag{42c.13.37}
$$

These are continuous functions of $\mu$ in the weak topology. Therefore the induced family of classical stream states is compact. Its finite-prefix local-positive criterion is the source-relative theorem above, with these explicit moment-product coefficients. Classical diagonal matrices suffice; no numerical law input is introduced.

This source has different responses from both an arbitrary one-tape law and a single IID mixture parameter. Asking for $r$ labels within one fresh block and outputting 1 iff they are all label 1 realizes $\int p_1^r\,\mu(dp)$. Asking for one label from each of two independent blocks and outputting their conjunction realizes $(\int p_1\,\mu(dp))^2$. Confusing those operations would replace an intra-block moment by the square of its mean. Every label, block index and outcome is retained; exact bounded sample counts make the finite circuit/readout host directly applicable once the supplier's ports and prices are supplied.

The criterion covers all finite-prefix realizable target responses on this declared family; Corollary 42c.13k.2 exhibits a continuous second-order policy outside it. The named-law interface of parts 10–12 is different. Changing an actual source under actions also requires the appropriate controlled supplier contract; a preallocated static family only covers changes already encoded by that contract.

<a id="corollary-42c13k2-a-continuous-second-order-policy-need-not-be-sample-initializable"></a>**Corollary 42c.13k.2 (A Continuous Second-Order Policy Need Not Be Sample-Initializable).** In the hierarchical unknown-source interface above, let $m(\mu)=\int p_1\,\mu(dp)$ and consider the weakly continuous policy $F(\mu)=\delta_{m(\mu)}$ on the binary simplex. Its numerical-name realization is supplied by parts 10–12. Nevertheless there is no source-independent algorithm which, from hierarchical samples alone, emits a certified Cauchy name of a point with law $F(\mu)$, with each requested finite precision completed almost surely for every $\mu$.

*Proof.* Restrict to $\mu=\delta_q$ with $0<q<1$. All observed binary labels, both within and between blocks, are then IID Bernoulli$(q)$. Every finite source word has positive probability for every interior $q$. Integrating fixed private randomization, any finite completed output event which is positive at one interior $q$ is positive at every interior $q$, by the same finite-prefix support argument as Theorem 42c.9.

Choose two parameters separated by more than twice the requested name accuracy. Their permitted finite net-index sets are disjoint. At the first parameter, almost-sure finite output of that precision gives a permitted output index with positive probability by some finite operation bound. The same finite event remains positive at the second parameter, where that index violates the required certified error. This is a contradiction. The requested decoded point is deterministic, namely $q$, so randomizing the name does not change the argument. Approximate estimators with a nonzero error probability, finite-horizon populations and a separately supplied numerical measure-name are different interfaces and are not refuted. $\square$

**Part 15. General continuous population approximations on the domains of Proposition 42c.2.**

The following extension of the rational-PWA population theorem (Theorem 42c.8) uses its finite native source compiler and makes the second-order population rate explicit.

For $F:\Delta_d\to\Delta_d$, supply a computable concave modulus $\omega$ with $\omega(0)=0$ and $\lVert F(x)-F(y)\rVert_1\le\omega(\lVert x-y\rVert_1)$. At population size $M$, choose rational normalized $F_M(\mu)$ on the finitely many empirical states with uniform error at most $\eta_{M}$. This uses the supplied effective $F$, not runtime knowledge of an unknown probability. Compile the finite rational transition table, then draw $M$ conditionally independent successors from $F_M(\mu_t)$ using the full Definition 42c.6 source.

With $a_M=\sqrt{(d-1)/M}$, $p_{t+1}=F(p_t)$ and $e_t=\mathbb{E}\lVert\mu_t-p_t\rVert_1$,

$$
e_{t+1}\le a_M+\eta_M+\omega(e_t).
\tag{42c.13.38}
$$

Conditional empirical fluctuation gives $a_{M}$, table error gives $\eta_{M}$, and Jensen's inequality for concave $\omega$ gives the last term. For IID initialization $e_0\le a_M$. If $\eta_M\to 0$, finite induction gives $e_t\to 0$ at each fixed $t$ and $\mathbb{E}\max_{t\le T}\lVert\mu_t-p_t\rVert_1\le\sum_{t\le T}e_t$. Supplied Lipschitz readouts convert this to their finite response error. No stationary convergence or exact infinite-horizon law follows without more hypotheses.

For the second-order domain $P(\Delta_d)$, use a finite $\delta$-net $Q$ with $J$ points in $\Delta_{d}$, whose $\ell^1$ diameter is $D=2$. A population of $M$ grid points represents its empirical measure $\nu$. For each of the finitely many $\nu$, approximate $F(\nu)$ by a rational measure $q_{\nu}$ supported on $Q$ within $W_1$ error $\delta+\eta$. Such a measure is found by searching the finite rational-measure net with certified $W_1$ comparisons and slack, not by attempting to decide masses of discontinuous Voronoi cells from a weak name. Draw $M$ conditionally IID grid points from $q_{\nu}$. Conditional empirical fluctuation obeys

$$
\mathbb E W_1(\operatorname{empirical}_M(q_\nu),q_\nu)\le\frac D2\sqrt{\frac{J-1}{M}}.
\tag{42c.13.39}
$$

Indeed finite-grid $W_1$ is at most $D$ times total variation, and the expected $\ell^1$ multinomial error is at most $\sqrt{(J-1)/M}$. With a supplied concave $W_1$ modulus for $F$,

$$
e_{t+1}\le\frac D2\sqrt{\frac{J-1}{M}}+\delta+\eta+\omega(e_t).
\tag{42c.13.40}
$$

Choose $\delta_s\to 0$, $\eta_s\to 0$ and $M_{s}$ with $J_s/M_s\to 0$. Initialization by the same grid/rational/population procedure has the corresponding error. Then each fixed finite-horizon path converges with the displayed recursive bound. The finite grid population is a finite rational Markov source, so all native stocks, initial laws, invalid tokens, readout records, clocks and charges are obtained by substituting its actual finite alphabet/table sizes into Definition 42c.6.

For kth-order updates use populations for each of the $k$ retained coordinates. A safe continuity term is $\omega(\sum_{i=1}^k e_{t-i+1})$, since the maximum metric is bounded by the sum and concavity permits Jensen. A finite-horizon error recursion follows. The decoded-name intertwiner of part 10, not these approximate populations alone, preserves exact fixed and least-period predicates: if an initial fixed/periodic witness is supplied as actual names, its decoded orbit is exactly the mathematical one; different name strings of the same point are not different states. Initialization of arbitrary witnesses and decisions of their exact equality are separate supplies (Theorem 42c.13k).

**Part 16. Arbitrary regularization cannot be recovered even from exact policy queries.**

The regularized relation of an arbitrary policy has an explicit impossibility theorem. Its scope is Proposition 42c.2's **arbitrary** $F:[0,1]\to[0,1]$. The access interface supplies exact point values $F(x)$ at queried $x$, permits arbitrary adaptive randomized queries, and even allows countably many queries. No prior global graph/regularization oracle is supplied. This is stronger evaluation access than finite-precision policy queries.

<a id="theorem-42c13h-indistinguishable-spike-policies"></a>**Theorem 42c.13h (indistinguishable spike policies).**

There is no such universal algorithm which faithfully outputs the closed convex regularization $\bar{F}(x_0)$ for every bounded Borel $F$, even at one fixed interior point $x_{0}$. In particular it cannot always provide a Hausdorff approximation of error less than $1/2$ with success probability greater than $1/2$. The conclusion applies to whole output-name streams as well as finite stopping outputs.

**Proof.** Run the candidate algorithm against $F_{0}$ identically zero. For each query index $j$, let $Q_{j}$ be the probability law of its query location, including all private randomness and previous zero replies. After halting, pad unused queries by $x_{0}$. Every probability measure has at most countably many atoms; the union $D$ of the atoms of all $Q_{j}$ is countable. Choose distinct $z_{n}$ tending to $x_{0}$, with $z_n\ne x_0$ and $z_{n}$ outside $D$. This is possible in disjoint open intervals shrinking to $x_{0}$, each of which is uncountable.

Set $F_1(x)=1$ on $\{z_n:n\ge 1\}$ and $F_1(x)=0$ elsewhere. It is a bounded Borel function. Under $F_{0}$ the probability that any query hits any $z_{n}$ is zero, by a countable union over $j,n$. Couple the two executions using identical private randomness. Before their first hit they have identical replies, hence identical next query and computation. Since the $F_{0}$ execution almost surely never hits a spike, neither execution ever differs, almost surely. This coupling also identifies every stage of an infinite output stream.

But $\bar{F}_0(x_0)=\{0\}$, while every neighborhood of $x_{0}$ contains both a spike and nonspike, so $\bar{F}_1(x_0)=[0,1]$. These compact sets have Hausdorff distance one. Any approximations within $\epsilon<1/2$ belong to disjoint admissible-output sets. The identical output law cannot place probability greater than $1/2$ in both disjoint sets. In particular no everywhere-correct total output or name decoder exists. This proves the claim.

**Consequence for regularized-relation compilers.** A general regularized-relation compiler cannot be obtained from the policy's point-query source alone. A supplied symbolic graph, a supplied closed-set name, a richer global oracle, or a restricted effective function class is an additional primitive. The finite rational-PWA incident-cell construction succeeds precisely because its finite global partition is supplied. A source that directly supplies the regularized relation as part of its native contract is a different input interface.

**Nonuniform finite-port coverage is also limited.**

Under a fixed countable finite-port description grammar whose primitive data consist of countably many finite-dimensional real/complex matrices, countable real coefficients and finite programs, there are at most continuum many descriptions—even allowing noncomputable coefficients. There are $2^{\text{continuum}}$ distinct maps $[0,1]\to[0,1]$. Thus no such grammar can faithfully realize **every** unrestricted policy map nonuniformly. The cardinality count excludes coverage of arbitrary $F$ by finitely or countably many fixed native matrix parameters; which maps are realizable is settled by the operational results above, and noncomputable constants remain admissible. An uncountably indexed function-oracle port is outside that grammar and must be declared as a stronger service.

<a id="theorem-42c13h1-no-uniform-effective-regularization-compiler-from-finite-global-policy-codes"></a>**Theorem 42c.13h.1 (No Uniform Effective Regularization Compiler from Finite Global Policy Codes).** The point-query obstruction does not require that global finite policy descriptions be withheld. On the arbitrary-policy domain $F:[0,1]\to[0,1]$ of Proposition 42c.2, there is no uniform effective procedure which receives the finite global descriptions below and returns a compact-set representation of $\bar F(0)$ with certified Hausdorff error less than $1/2$. This includes an output compact-set name whose requested finite precision is produced after finitely many operations. A computable randomized procedure that halts almost surely and succeeds with probability greater than $1/2$ on each code is also impossible. The conclusion is relative to the effective native-service branch: it does not exclude a separately supplied noncomputable advice or relation service.

*Proof.* Given a finite program $e$, define $z_n=2^{-n}$, $n\ge1$, and give the following finite symbolic description:
$$
F_e(x)=
\begin{cases}
1,&x=2^{-n}\text{ for some }n\ge1\text{ and }e\text{ halts within }n\text{ steps},\\
0,&\text{otherwise}.
\end{cases}
\tag{42c.13.47}
$$
This describes a total Borel policy at every real input, including $F_e(0)=0$, and is uniformly generated from the complete code of $e$. Its exact rational-input evaluator is total and computable: reduce the input fraction, test whether it is a positive power $2^{-n}$, and, if it is, simulate $e$ for only $n$ steps. Otherwise return zero. The compiler may inspect this entire finite code; it is not limited to black-box point queries. The finite symbolic definition, exact rational query interface and ordinary real-name interface remain different contracts.

If $e$ never halts, $F_e$ is identically zero and $\bar F_e(0)=\{0\}$. If $e$ halts at time $t$, all $z_n$ with $n\ge\max\{1,t\}$ are spikes. Both spikes and zero-valued nonspikes lie in every relative neighborhood of zero. Hence $\bar F_e(0)=[0,1]$. The Hausdorff distance between these two compact sets is one.

For a requested rational error $\varepsilon<1/2$, an accurate compact-set output $A$ has $\sup A\le\varepsilon$ in the nonhalting case and $\sup A\ge1-\varepsilon$ in the halting case. The output representation must support this retained finite certified readout; finite rational-set Hausdorff approximations do so directly. For an effective compact-set name, approximate its supremum to an error smaller than $(1-2\varepsilon)/4$. Comparison with $1/2$ then decides which case holds. Thus a deterministic uniform compiler would decide halting.

For a computable randomized compiler, convert its completed finite output to that same binary decision, assigning a fixed decision to any malformed output. On every program code the correct decision has probability greater than $1/2$, and the decision procedure halts almost surely. Enumerate the two finite halting-output probabilities from below: finite effective computation branches have computable probabilities, and their disjoint completed cylinders yield increasing rational lower bounds. One of these bounds must eventually exceed $1/2$; its label is the correct halting decision. This gives a deterministic halting decider, again impossible. No uniform success gap or runtime bound is needed. Computable native coins may equivalently be expanded into retained fair-bit simulations; a noncomputable native advice primitive is outside this effective claim.

The obstruction also covers exact negative-information names of the regularized graph, not just Hausdorff approximations. Such a name enumerates basic open sets whose union is the graph's complement, with each emitted exclusion certified and never retracted. The point $(0,1)$ is outside the graph of $\bar F_e$ exactly when $e$ does not halt. A uniform effective negative name would therefore semidecide nonhalting by waiting for an enumerated open set containing $(0,1)$, which is impossible. The same argument applies to a negative name of the fiber $\bar F_e(0)$ using the point $1$. Even a computable randomized generator with correct-name probability greater than $1/2$ on every code cannot do this: the probability of ever emitting an exclusion covering that point is lower semicomputable, greater than $1/2$ for nonhalting codes and less than $1/2$ for halting codes. Enumerating this probability from below until it exceeds $1/2$ would again semidecide nonhalting. This argument concerns certified negative information, not retractable guesses.

The theorem does not rule out an uncertified sequence of limit guesses that changes after $e$ is observed to halt. Such a sequence supplies no uniformly certified finite Hausdorff accuracy or terminating exact relation reader. Nor does it prohibit returning a formal expression that repeats the undecided halting condition. The impossible contract is the operational one: effective finite certified relation output or readout, not an unevaluated restatement of its defining predicate. The finite rational-PWA compiler of Theorem 42c.3 is unaffected because its supplied finite partition has effective incidence and arithmetic data. Together with Theorem 42c.13h, this theorem negatively settles the natural point-access and finite-global-code generalizations of that regularization compiler. The source-internal existence theorem for regularized fixed points is unchanged. $\square$

**Part 17. Unknown finite-channel stationary initialization has its own obstruction.**

This separates the finite stationary-law theorem (Proposition 42c) from a source-access claim. Let an unknown two-state channel have transitions $0\to 1$ with probability $a$ and $1\to 0$ with probability $b$. A controller may request fresh transition samples at either nominated input state; $a,b$ in $[0,1]$ are otherwise unknown. This is stronger access than observing only one uncontrolled trajectory, but weaker than exact numerical transition entries/support labels.

For $a+b>0$ the stationary mass at state 1 is $a/(a+b)$. At $a=b=0$ every distribution is stationary. There is no universally finite-almost-sure algorithm which outputs a sample from **some** stationary law for every $a,b$, even if it may choose any stationary law at $(0,0)$.

To prove this, let $c$ be its probability of output 1 at $(0,0)$. If $c>0$, a positive-probability completed 1-event occurs after finitely many operations. At $(0,b)$ with $0<b<1$, the same finite private-randomness event and all-self-transition source transcript still have positive probability: every requested 1-input self-transition has factor $1-b>0$ and 0-input self-transitions are deterministic. But the unique stationary law there is $\delta_{0}$, a contradiction. If $c=0$, the completed 0-event has positive probability at $(0,0)$; at $(a,0)$, $0<a<1$, it remains positive, contradicting the unique stationary law $\delta_{1}$. Thus every possible choice at the degenerate channel fails.

More generally no universally terminating controller can uniformly approximate a stationary-law sample within TV error $\epsilon<1/2$ on this full parameter square. Its output probability is continuous in $(a,b)$, by the finite-event/complement argument. Along $(0,b)$ as $b$ decreases to zero the target is zero, so continuity forces $c\le\epsilon$. Along $(a,0)$ the target is one, so $c\ge 1-\epsilon$. These inequalities require $\epsilon\ge 1/2$.

Proposition 42c's existence theorem and Definition 42c.6's exact rational-entry compiler use known normalized columns and exact support/vertex data, which this interface withholds. The result is a coverage-complete obstruction to promoting **unknown transition samples** into a universal stationary initializer without an additional support/ergodicity/access promise. Theorem 42c.4's support-stratum distinction is therefore operationally necessary.

**Part 18. Unknown finite changing/interactive classical suppliers: a complete finite criterion.**

This part addresses a concrete changing-source interface.

**Source and response grammar.**

Fix finite action and outcome alphabets and a finite source-use horizon $L$. At history $h=(a_1,o_1,\dots,a_t,o_t)$, $t<L$, the source accepts the next action $a$ and returns $o$ according to an **unknown** normalized conditional law $q(o\mid h,a)$. The source may change with time and history, need not be IID, and is used along exactly one realized path. Its finite action/outcome ports, readiness, durations and tariffs are supplied source-contract data; the $q$ values are not supplied numerically and are not learned by a free oracle. Distinct histories may have distinct kernels. This is a finite family of conditional probability simplexes, a compact parameter domain.

The controller may use source-independent private randomness, retain all actions/outcomes/tokens, and stop with a finite output. A fixed finite external intervention grammar is admitted: at each declared window a new token may be read, but future tokens may not be inspected early. Invalid tokens have a supplied total response. A source query on an unchosen counterfactual branch is not allowed. Bounded source-use and finite native-time implementation are distinct unless source query times and native controls are priced/bounded.

<a id="theorem-42c13i-finite-causal-tester-polytope"></a>**Theorem 42c.13i (finite causal-tester polytope).**

For this fixed finite grammar, enumerate all deterministic causal controller strategies $D$. Each $D$ assigns actions, stopping output and specified readout/status at every finite information history, including every admitted external-token history. There are finitely many such strategies. For a fixed external intervention schedule $j$ and full declared observable transcript/output $h$, let $P_D(h\mid q,j)$ be its probability under the source. It is an explicit polynomial formed by sums of products of the unknown conditional $q$ entries along allowed realized paths.

A target full response table $R(h\mid q,j)$ is implementable on this one source for all $q$ and all admitted $j$ iff

$$
R(h\mid q,j)=\sum_D\lambda_D P_D(h\mid q,j)\quad(\forall h,q,j),\qquad\lambda_D\ge0,\quad\sum_D\lambda_D=1.
\tag{42c.13.41}
$$

with one common $\lambda$ vector for all interventions. For a rational polynomial target, this is a finite rational linear feasibility problem: eliminate the last outcome of each conditional simplex using normalization and match all remaining polynomial coefficients. If the target is not in this finite polynomial span, it is not realizable at this source-use horizon.

**Necessity.** Fix the controller's entire private random tape before the episode. On the finite information tree it then chooses a deterministic causal strategy, including its behavior at every possible token/history branch. Integrating over private tapes gives a probability distribution on the finite set of deterministic strategies. The source probabilities multiply only along the chosen path; no counterfactual outcomes are jointly acquired. The tape is source-independent and cannot depend on future external tokens, so the same mixture weights work for every q and intervention. For unbounded but almost-sure finite internal computation, the same necessity holds for the fixed finite declared response projection, but an unbounded raw internal archive is not a finite output alphabet; it belongs to the hierarchy below. The finite polytope claim for the entire retained response assumes its full episode record grammar is finite. Native compilation may add a declared audit extension and resource overhead while preserving the source-use budget; a separate fixed gate-count budget is a further constraint.

**Sufficiency.** Sample D once from the fixed $\lambda$ distribution and execute its finite causal lookup table. All conditional decisions read only retained information. This samples precisely the displayed polynomial full response. For rational feasible target data, a rational feasible $\lambda$ exists by finite rational polytope theory; hence its selection has an algebraic finite native sampler. Arbitrary supplied exact $\lambda$ has its corresponding declared fixed native sampler, or an effective fair-bit sampler with its own runtime contract. The unknown source is queried only at the actual actions prescribed by D.

An equivalent explicit *realization-flow* description avoids enumerating strategies. For each source/information history $h$ let $r(h)$ be its controller-only reach weight, excluding source likelihoods. Split it into nonnegative stop weights $r_y(h)$ and action weights $r_a(h)$ with

$$
\sum_y r_y(h)+\sum_a r_a(h)=r(h),\qquad r(\varnothing)=1,\qquad r(h,a,o)=r_a(h)\quad(\forall o).
\tag{42c.13.42}
$$

External-token successors have the corresponding same pre-token reach weight, because tokens are externally supplied rather than privately sampled. These are finite linear causal constraints. A terminal leaf has probability $r_y(h)$ times the product of its source $q$ entries (and any externally randomized token factors). When $r(h)>0$, use controller probabilities $r_a(h)/r(h)$ and $r_y(h)/r(h)$; at zero reach choose a declared INVALID/dummy rule. The linear constraints make the full controller normalized for every source. This gives a direct finite causal-flow certificate.

The full token/readout/invalid/timeout/archive response is included by enumerating it in h and j before matching. Private strategy-selection records are retained in a separately specified audit bank; if exposed as an additional output, the implemented target is the corresponding declared extension.

**Concrete one-use consequence, with a sharp approximation obstruction.**

Consider a source accepting $u$ in $\{0,1\}$, returning one $\mathrm{Bernoulli}(q_u)$ bit, and then closing. For its final binary output every controller has the form

$$
f(q_0,q_1)=\lambda[(1-q_0)a_0+q_0b_0]+(1-\lambda)[(1-q_1)a_1+q_1b_1].
\tag{42c.13.43}
$$

with all coefficients in $[0,1]$. Ignoring the source is included. Thus $f$ is affine in the pair $(q_0,q_1)$, not a bilinear two-sample function. Conversely every affine function of $(q_0,q_1)$ bounded between zero and one on the square is implementable: express its slopes by weighted use of $q_{i}$ or $1-q_i$ and use the remaining weight for a fixed coin. Bounded range implies the sum of absolute slopes is at most one and leaves a valid fixed-coin weight.

In particular $q_0 q_1$ is impossible. Its best uniform approximation by an implementable probability has error exactly $1/3$. For a candidate $f$ let $A=f(0,0)$, $B=f(1,0)$, $C=f(0,1)$, $D=f(1,1)$. Affineness gives $D=B+C-A$. If the error is $\epsilon$, then $A\ge 0$, $B,C\le\epsilon$ and $D\ge 1-\epsilon$, hence $1-\epsilon\le 2\epsilon$ and $\epsilon\ge 1/3$. The implementable $f=(q_0+q_1)/3$ attains this error: its difference from $q_0q_1$ is bilinear, so its extrema occur at square vertices, where the absolute error is at most $1/3$. Supplying the pair of counterfactual outcomes would make AND possible, but that is a different source access contract.

**Native finite realization and limits of this theorem.**

The deterministic strategy selector, total history lookup, token archives, action outputs and source-return readers are finite ports. Compile them with the same XOR extension/positive-pulse/complete-readout construction as parts 3 and 11. Freeze the actual finite history and selector widths; each round retains its old input, selected action, returned outcome, status, clock and invoice. After stopping, a padded finite deadline uses paid dummy/no-op blocks and does not secretly query additional source branches. Include the supplied source's action/return acquisition and service prices at each actual query. Thus the finite causal-flow certificate has a finite normalized native controller, coherent spectators on controller ancillas, and a finite computable inventory from its actual table sizes. The unknown source kernels and any source resets remain source-contract data.

The criterion is complete for every **supplied finite source-use horizon and finite intervention grammar**, including non-IID and history-changing source kernels. Uniformly approximable infinite-use response functions need not have exact almost-sure factories; the Bernoulli and quantum boundary examples (Theorems 42c.9 and 42c.13e) are counterexamples. Unbounded protocols need their own coherent sequence of causal flow certificates and retained tail/resource contract, not the unrestricted static positive-effect criterion. The compatible infinite classical extension is given in the following part; it retains its own causal and tail hypotheses.

**Part 19. Compatible infinite classical causal flows, with retained stopping.**

The finite causal-flow description extends to arbitrary stopping protocols on the same finite-action/outcome classical source interface. This is an algebraic normal form with explicit linear conservation and source-polynomial response equations.

Let $\Theta$ be the product of all normalized conditional source simplexes $q(\cdot\mid h,a)$, over the countable finite histories. It is compact metrizable. A restricted source family may instead be specified. Choose nonnegative reach, action and stopped-output weights $r(h),r_a(h),r_y(h)$ on every finite history satisfying the part 18 conservation equations exactly and **compatibly** at every depth. Their depth-$n$ restrictions are finite causal flows, not independently chosen approximating testers. Let

$$
\begin{aligned}
L_h(q,\sigma)&=\left(\prod_{\text{source steps in }h}q(o\mid h_{<},a)\right)
\left(\prod_{\text{token steps in }h}\sigma(u\mid h_{<})\right),\\
f_y(q,\sigma)&=\sum_{h\text{ finite}}r_y(h)L_h(q,\sigma),\\
s_n(q,\sigma)&=\sum_{\substack{h\text{ pending}\\\mathrm{depth}(h)=n}}r(h)L_h(q,\sigma).
\end{aligned}
\tag{42c.13.44}
$$

Here $\sigma$ is the externally chosen causal token policy. For deterministic $\sigma$, equivalently restrict to its consistent histories instead of multiplying token probabilities. The same controller weights $r$ must work for every admitted $\sigma$. Omitting the external factors while summing all token histories would double-count externally duplicated reach weights. Include intermediate native/control-only steps in the history depth when a retained timing/internal archive contract requires them; their source probability factor is one or their declared fixed-coin probability. No new unknown source call is inserted. The finite conservation equations give $\sum_y f_{y,\le n}(q,\sigma)+s_n(q,\sigma)=1$ at every $n$. Thus every partial response is a normalized output/timeout instrument.

A supplied target response is realized exactly by a universally finite stopping protocol on the designated admissible progress schedules iff it has such a compatible causal flow with the target's terminal leaf responses and $s_n(q,\sigma)\to 0$ for every admitted pair $(q,\sigma)$. Arbitrary HOLD-forever interventions need not terminate; their pending mass is retained rather than excluded from normalization. Necessity integrates the private-randomness branches of the actual finite prefixes and factors out their common source likelihood, yielding the stated source-independent control weights. Sufficiency uses the known ratios $r_a(h)/r(h),r_y(h)/r(h)$ at each visited history. Zero reach has a declared total INVALID/dummy rule. The conditional kernel $q$ remains unknown and is invoked only at the actual chosen action. Induction proves the response equations and $s_{n}$ tail. On a compact set of source/intervention pairs $(q,\sigma)$ on which termination holds pointwise, the continuous finite polynomials $s_n(q,\sigma)$ decrease to zero, so their supremum tends to zero. This applies to compact $\Theta$ with one fixed progress schedule. A uniform tail over arbitrary schedules that promise eventual progress does not follow, because that schedule set need not be compact. On a noncompact admitted pair family only pointwise termination follows.

The normal form is explicit: finite prefixes are finite linear causal polytopes; whole-source response coefficients are given source-history polynomials; compatibility is a literal shared-variable constraint; and the ratio construction produces the normalized controller without querying counterfactual source branches. Finite target membership is the exact LP of part 18. An infinite flow and its target equations are supplied certificate data.

For effective implementation, supply a finite program generating each finite flow table and its rational weights, or certified computable weights plus the necessary zero/support branches and local sampling procedures. Supply an effective tail $\eta_{n}$ if uniform deadlines are required. Rational generated tables use the algebraic native selector and total XOR lookup host; every finite depth has finitely many such tables and registers. Source port dimensions and query times, table generation, acquisition, selector, update, copied labels, clock/invoice, holding and output-retention services enter the finite inventory. Unbounded exact execution is a compatible sequence of these actual finite stages with fresh retained banks, not an installed infinite lookup oracle. With per-stage incremental physical charge $c_{n}$, the sufficient expected-charge condition is $\sum_n\eta_{n-1}c_n<\infty$; source-dependent sharper reach probabilities may be substituted. An archive/reset cycle and numerical native capacity are still required for a reusable rate. An existence certificate with no such invoices is a response realization, not a completed physical pricing claim.

This closes the mathematical classical changing-source stopping interface on its declared causal grammar, including its converse and all pending branches. An unknown interactive quantum device is the separate interface of part 20.

**Part 20. Finite coherent reactive ports: stated external realization dependency.**

For a registered ordered $N$-slot interface, let $X_j$ enter the unknown source and $Y_j$ return from it. In the transpose convention $p(a\mid C)=\operatorname{Tr}(P_a^{\mathsf T}C)$, finite tester effects satisfy
$$
P_a\ge0,\quad T:=\sum_aP_a=I_{Y_N}\otimes\Xi_N,\quad
\operatorname{Tr}_{X_j}\Xi_j=I_{Y_{j-1}}\otimes\Xi_{j-1}\ (2\le j\le N),\quad
\operatorname{Tr}_{X_1}\Xi_1=1.
\tag{42c.13.45}
$$
Chiribella et al. (2009, Theorems 11–12 and Eq. (67)) prove these normalized testers have sequential memory-channel/isometry realizations and a final complete measurement. Their support-complete realization uses
$$
\mathcal S(C)=\sqrt T^{\mathsf T}C\sqrt T^{\mathsf T},\qquad
M_a=(T^+)^{1/2}P_a(T^+)^{1/2}+Q_a,\quad
\sum_aQ_a=I-\Pi_T,
\tag{42c.13.46}
$$
with measurement $\{M_a^{\mathsf T}\}$ and positive $Q_a$. Here $T^+$ is the Moore–Penrose inverse and $\Pi_T$ its support projector. The map $\mathcal S$ is realized by the causal circuit using actual source calls, not by granting direct access to an unknown Choi state.

This is a finite semantic dependency. Its matrices, support branches, slot dimensions, ancillas, source acquisition, measurement branches, clocks and prices remain registered data for the native dilation/pulse construction.

<a id="theorem-42c14-evaluated-consumptive-native-factory"></a>

<a id="theorem-42c14-evaluated-noncommuting-native-factory-and-paid-consumptive-cycles"></a>**Theorem 42c.14 (Evaluated Noncommuting Native Factory and Paid Consumptive Cycles).** Let $\rho_q=(1-q)|0\rangle\langle0|+q|+\rangle\langle+|$, $0\le q\le1$. Use the algebraic-port, deterministic fresh-ready, complete-readout and external-clock service assumptions of Definition 42c.6, the positive native/stock tariffs of Theorem 42c.7, and the supplied quantum-input boundary of Corollary 42c.11 and Proposition 42c.12. Under the explicit supplier and archive contract below, the one-sided detector has a finite-state native controller with exact completed halting-bit response $R(q)=1/(2-q)$ and an evaluated cell census. Every coin, raw-detector and terminal cell takes $12\tau$ and owns $909$ charged stock units. On every completed history, with $C$ actual raw-detector calls, the peak stock satisfies
$$
 B\le 2+1818(C+1),\qquad b_0=2,\quad b_1=1818.
\tag{42c.14.1}
$$
Including supplier acquisition, postmeasurement factors, all controller histories, clock/invoice records, native couplings, energy-transfer stocks, output/egress and one further $\tau$ of retention, the supplied consumptive cycle obeys
$$
 \mathbb E T_{\rm cycle}\le73\tau,\qquad
 \mathbb E\!\int B(t)\,dt\le660080\tau,\qquad
 \mathbb E C_{\rm cycle}\le668405.150264.
\tag{42c.14.2}
$$
The last number uses the explicit unit model tariffs below, not empirical calibration or a PCE minimum. A separately installed deadline source with $32$ active cells and one terminal cell has $29999$ charged stock units, duration $397\tau$, and complete retained TIMEOUT probability at most $(2/3)^{16}$. This finite deadline response is not the exact completed binary channel. The capacity $\ln(5/4)$ refers only to the designated completed halting bit for the two declared endpoint inputs; all other retained outputs remain separately typed.

The construction supplies conditional reusable full-cycle pricing through paid fresh acquisition and archive/export, on the output/archive policy and finite expected cycle time that Proposition 42c.12 requires. The conditional supply, declared retention boundary and additional longer-storage liability remain explicit. The finite deadline source is a realization in the algebraic native-service grammar of Definition 42c.6 and is distinct from its rational classical-channel sampler family.

*Proof.* Definition 42c.6 supplies exact algebraic ports, deterministic ready preparation, computational-basis instruments and an external clock, and its concrete history construction has no resets. Theorem 42c.7 prices qubits, reservoir levels, ROM bits, native entries/rows, services, fresh-ready factors and stock-time separately; its energy-transfer reservoir records energy transfer, and thermal-bath properties are a separate premise. Definition 15 charges all registered acquisition, representation, processing, update, maintenance and adaptation costs but supplies neither a reset mechanism nor a minimizer. We use these same native-service and tariff conventions with the following fully specified quantum supplier and controller.

**Part 1. Input and service boundary.**

For each cell the input supplier delivers two qubits T,E in the product-across-cells state

$$
|\Psi_{q}\rangle=\sqrt{1-q}\,|0\rangle_{T}|0\rangle_{E}+\sqrt{q}\,|+\rangle_{T}|1\rangle_{E}.
$$

Only $T$ is accessible to the factory; $E$ is a sealed supplier-reference factor retained with the cell and included in the archive stock. Its custody passes with the retained cell under the archive/export contract, without granting the controller or designated output reader access. The displayed purification is a concrete source realization, not a numerical name of an unknown input or permission to inspect an actual supplier's purifier. Thus $\operatorname{Tr}_E|\Psi_q\rangle\langle\Psi_q|=\rho_q$. This is a supplied quantum input, not a command to prepare unknown $q$ from a classical name. The factory never reads $E$, the supplier's $q$, or a purification label. The parameter-bearing input preparation lies at this declared supplied-input boundary; its two factors have positive acquisition/preparation/delivery tariffs.

For simplicity and to remove any uncounted adaptive supplier-routing mechanism, **every cell** acquires a fresh independent pair, including coin, terminal and padded cells. An input not selected for detection is retained untouched. Consequently $C$ below counts measured raw copies, whereas $U=N$ counts acquired input pairs. The latter, not $C$ alone, is charged. This is wasteful but closes the actual supplier census.

The service contract has a one-tau procurement/preparation interval delivering the ready cell and its input pair, ten one-tau native slots, and a one-tau lossless append/egress interval. A final one-tau retention follows the invocation. Procurement is delivery of fresh ready factors, not erasure of spent factors. All services, built-in clock/drive hardware, native instruments and their inaccessible implementation environments are included in the positively priced native service/port contract, exactly as their supplied existence is a premise in 42c.6. The finite deadline version requires only a finite prepared input batch. The on-demand version additionally assumes every requested finite next cell is available in that bounded procurement interval. That availability is stronger than one finite installed instance of Definition 42c.6, and is exactly a bounded whole-service hypothesis of the type stated in Proposition 42c.12.

The stock units below count qubits, reservoir levels, delivered ROM bits and native entries/rows with the positive unit tariffs of 42c.7. These are accounting units. Unspecified microscopic realization of an admitted ready/read/clock primitive is not inferred from its matrix; actual empirical fabrication prices remain outside this illustrative model, just as in 42c.7.

**Part 2. Finite controller and actual native operations.**

The old two-bit controller word s has codes

$$
00=\mathrm{COIN};\quad 01=\mathrm{RAW};\quad 10=\mathrm{DONE0};\quad 11=\mathrm{DONE1}.
$$

Initially it is 00. Each cell owns fresh next-state n (2 qubits), data S,L,R,V (one each), next-state archive a (2), next-state reader r (2), input T and sealed E (one each), ten tick bits, ten invoice bits, ten excited heat capsules and one ready flag. Thus there are **43 fresh qubits** per cell. The old s is the preceding cell's n; the initial two qubits are charged once separately. Every preceding word is retained.

Let

$$
J=\begin{bmatrix} \sqrt{2/3} & \sqrt{1/3} \\ \sqrt{1/3} & -\sqrt{2/3} \end{bmatrix}.
$$

Both J and the Hadamard H are algebraic involutions. The ten slots are:

1. Controlled $\mathrm{SWAP}(T,S)$, enabled exactly at $s=\mathrm{RAW}$; toggle the ready flag. $T,E$ are never otherwise read.
2. Controlled sampler: $J$ on $S$ at COIN; $H$ on $S$ at RAW; identity at either DONE code.
3. CNOT $S\to L$.
4. CNOT $L\to R$.
5. CNOT $L\to V$.
6. Complete computational readout of $R$, retaining both declared outcomes and all other factors.
7. XOR lookup $(s,L,n)\to(s,L,n\oplus G(s,L))$, with all eight input codes defined by

   $$
   \begin{aligned}
   G(00,0)&=01,\quad G(00,1)=11, \\
   G(01,0)&=00,\quad G(01,1)=10, \\
   G(10,y)&=10,\quad G(11,y)=11.
   \end{aligned}
   $$

8. Two-bit XOR copy $n\to a$.
9. Two-bit XOR copy $n\to r$.
10. Complete four-outcome computational readout of $r$. The read word remains internal unless this is the terminal cell.

A terminal cell has the same inventory and paid slots, uses identity sampler, and uses $G_{\mathrm{terminal}}(s,y)=s$. Its readout declares 00/01 as TIMEOUT and 10/11 as DONE0/DONE1. All four raw codes remain archived; they are not renormalized after dropping timeout. For an almost-sure run, invoke this terminal cell immediately after the first DONE state. For a prescribed deadline, invoke it after the prescribed number of active cells, with DONE states already absorbing. The externally fixed terminal port/table has the same counted dimensions as an active port/table.

All unitary operations above are involutions, with complete controlled extensions. Implement them with the positive pulse (42c.6.3). Both readouts are complete instruments, hence normalized on the entire Hilbert space including any retained spectators; the promised ready inputs, not a deletion of other outcomes, establish the interpretation. The ready flag, clock services and append schedule are supplied native services, not an unpriced interpreter. The table has 8 two-bit outputs, hence 16 delivered ROM bits in a bit-packed layout. This layout is distinct from the byte-padded ROM layout of the specific 42c.6 construction. No table of $\rho_{q}$, $q$ or $R(q)$ is supplied.

On RAW, $S$ receives $\rho_{q}$ and $H$ followed by computational outcome 1 detects $|-\rangle\langle -|$, of probability $p=(1-q)/2$. On COIN, outcome 1 has probability $1/3$, independently of $q$. Accordingly this is exactly Corollary 42c.11. All postmeasurement states (in the rotated measurement frame), unused inputs, sealed references, controller words, duplicate labels, clock records and invoices remain in the cell. There is no uncomputation or reset of a spent cell.

**Part 3. Complete per-cell numerical inventory and invoice.**

Each cell also owns an eleven-level reservoir, initially at level zero. Its ten capsules begin excited. Each slot has its own energy-conserving swap of capsule excitation into the next reservoir level. The reservoir ends at level ten and is retained. Its value is not reused as zero. Energy gap $E^*=\hbar/\tau$.

| Native stock | Exact charged entries/rows |
|---|---:|
| Controlled sampler on s,S, dense 8×8 | 64 |
| Controlled SWAP on s,T,S, dense 16×16 | 256 |
| Three CNOTs, dense 4×4 each | 48 |
| Complete binary reader, two 2×2 Kraus matrices | 8 |
| XOR lookup on five qubits, sparse rows | 32 |
| Two two-bit XOR copies, sparse rows | 32 |
| Four-outcome two-bit reader, four 4×4 matrices | 64 |
| Twenty tick/invoice X ports, dense 2×2 | 80 |
| Ten capsule/reservoir swaps, 22 sparse rows each | 220 |
| Capsule and reservoir free-energy diagonals | 31 |
| Ready-flag X port | 4 |
| **Total** | **839** |

Together with 43 qubits, 11 reservoir levels and 16 ROM bits, the acquired/held stock is

$$
V=43+11+839+16=909\text{ units per cell}.
$$

Two initial controller qubits give the pathwise total $B_N=2+909N$. Distinct native couplings and their delivered tables are both charged. No gate reuse is needed to achieve these bounds.

There are eleven functional gate/instrument services in the ten slots (slot 1 has two), ten clock services, ten invoice services, ten heat services, and one append/egress service: 42. The 41 noninput qubits plus reservoir require 42 fresh-ready preparations. The two supplied input factors have two procurement/preparation/delivery services. Total: **86 positively priced services per cell**, plus two initial-controller preparations. Those two seed preparations run in parallel within the first cell's already paid procurement interval, so they add no uncounted startup time. The supplier's two factors are excluded from the 42 ready count, avoiding double counting. The procurement interval can deliver these finite ready factors in parallel; this is a bounded-duration supplied-service premise.

The capsule+reservoir free energy has norm 20E*, with reached energy 10E*. At most five involutory pulses are simultaneous (SWAP, ready flag, tick, invoice, heat), giving peak at most 10pi E*; use the conservative declared allowance 12pi E*. Reserve (100pi+20)E* per cell for drivers and handling, exceeding the finite pulse-action budget. Measurement/procurement/transport work remains in its supplied inclusive service tariff; the capsule transfer is a bookkeeping record, separate from that work and from entropy production. With unit energy tariffs the deliberately conservative separate allowance is

$$
e=20+12\pi+(100\pi+20)=40+112\pi.
$$

The whole coin, raw and terminal cell times are all **12tau**. Their acquisition+service+energy charges, excluding holding already separately integrated, are all

$$
k=909+86+40+112\pi=1035+112\pi.
$$

This evaluates the actual supplier-containing whole blocks. Extra reader services or longer storage are added to this invoice.

**Part 4. Exact completed moments and populated b0,b1.**

Let $A$ be the number of coin cells and $C$ the number of actual RAW detector cells. Let $N=A+C+1$ include the terminal cell, and $T=N-1$. Put $p=(1-q)/2$ and $d=1+2p=2-q$. Conditioning on the first coin gives

$$
\begin{aligned}
\mathbb{E}\,T &= 5/d, \\
\mathbb{E}\,T^{2} &= 9/d+40(1-p)/d^{2}, \\
\mathbb{E}\,N &= 1+5/d\le 6, \\
\mathbb{E}\,N^{2} &= 1+19/d+40(1-p)/d^{2}\le 60.
\end{aligned}
$$

At $q=1$, $A$ is geometric with success $1/3$, $C=A-1$ and $N=2A$, so both maxima are attained. For every $q$, $A\le C+1$ and $N\le 2(C+1)$. Hence the requested concrete stock constants are

$$
B_{N}=2+909N\le 2+1818(C+1):\quad b_{0}=2,\ b_{1}=1818.
$$

The acquisition count $U=N$ is explicitly different from the measured-copy count $C$; $\mathbb{E}\,U\le 6$, so the sealed supplier references and unused $q$ inputs are covered. Full completion and final retention take $(12N+1)\tau$, with expectation at most **73tau**. Because all accumulated cells are retained, the following conservative bound includes holding every acquired cell throughout the whole invocation:

$$
\begin{aligned}
\mathbb{E}\int B(t)\,dt &\le\tau\,\mathbb{E}[(12N+1)(2+909N)] \\
&= \tau[2+933\,\mathbb{E}\,N+10908\,\mathbb{E}\,N^{2}] \\
&\le 660080\,\tau.
\end{aligned}
$$

The expected acquired stock is at most 5456. Expected services including the initial seed are at most 518. Thus the evaluated complete finite-retention invocation invoice is

$$
\begin{aligned}
\mathbb{E}\,\mathrm{Cost} &\le 660080+5456+518+6(40+112\pi) \\
&= 668405.150264\ (\text{rounded upward}).
\end{aligned}
$$

The operational-period version of 42c.12.7 with whole-block $\tau_{\mathrm{block}}=12\tau$ gives $654624\tau$; the additional one-slot retention contributes at most $5456\tau$, yielding the same $660080\tau$. No energy-consumption or entropy-production lower bound is inferred from these illustrative tariffs.

**Part 5. Actual finite native source: 32 active cells.**

Install 33 cells, the first 32 active and the last terminal, and the initial two-qubit state. The source requires 33 independent input pairs, i.e. 66 supplied parameter-bearing qubits including sealed purifications. All cells are already included in installed capacity, whether a DONE branch occurs early or not. No streaming extension or reset is needed.

$$
\begin{aligned}
&\text{Installed stock: }2+33\cdot 909=29999. \\
&\text{Total duration including final retention: }12\cdot 33+1=397\tau. \\
&\text{Services: }2+33\cdot 86=2840. \\
&\text{Positive model invoice:} \\
&\qquad 29999\text{ acquisition}+397\cdot 29999\text{ holding}+2840\text{ services} \\
&\qquad+33(40+112\pi)\text{ energy allowance} \\
&\qquad=11955373.326448\ (\text{rounded upward}).
\end{aligned}
$$

The process can be coupled monotonically in $p$ so that its slowest stopping case is $p=0$ ($q=1$). There $T=2A-1$ with $A$ geometric($1/3$). Thus

$$
\begin{aligned}
\Pr(\text{TIMEOUT after 32 active cells}) &\le(2/3)^{16} \\
&= 65536/43046721\approx 0.0015224388403474448.
\end{aligned}
$$

More generally the bound for $K$ active cells is $(2/3)^{\lfloor (K+1)/2\rfloor}$. Keep the raw terminal codes, every cell, all source remnants and postmeasurement references. Under the common-history coupling, the complete bit-or-TIMEOUT channel is within this probability in TV of the completed binary channel embedded with zero TIMEOUT probability. This is a uniform approximation, not an exact bounded-time realization of $R$.

**Part 6. Output capacity, renewals and environmental boundary.**

For the completed halting-bit channel, $q=0$ gives output-one probability 1/2 and $q=1$ gives 1. With input-one probability $\alpha$,

$$
I(\alpha)=h((1+\alpha)/2)-(1-\alpha)\ln 2,
$$

maximized at $\alpha=3/5$, yielding **ln(5/4)=0.22314355131420976 nats per completed invocation**. The full transcript, sealed environment, timing channel and 32-cell deadline channel are separate channels with their own capacities.

Under the explicitly renewed consumable-input/ready service, repeat a cycle by supplying a fresh two-bit seed and fresh cells. Old cells and heat reservoirs become declared waste/archive outputs; no factor is reset. The next controller run starts in a fresh seed, not in an assumed restored spent seed. Expected cycle time including output/egress and one-slot retention is at most 73tau, so the bit information/expected-time accounting quotient is at least ln(5/4)/(73tau), approximately 0.003056760977/tau. This is **consumptive open-system throughput**. Proposition 42c.12 requires an output/archive/reset policy and finite expected full-cycle time, and the paid replacement and archive-export policy here supplies conditional reusable full-cycle pricing at this declared operational service boundary; spent factors are archived and are not restored. The uniform on-demand supply and bounded delivery-time hypotheses remain explicit, as in the whole-block premises of 42c.12.

The physical waste remains explicitly present: each cycle adds 2+43N qubits, N eleven-level reservoirs at their reached levels, N physical port/table cells, all references and histories. It transfers exactly 10N E* into those reservoirs. Expected transferred energy is at most 60E*. No bath is restored and no fresh-ready resource is regenerated. Retention beyond the declared one-slot postcompletion period adds its actual positive holding charge; retaining all these archives forever gives infinite integrated holding. Export changes ownership/location, not the physical resource balance. An actual externally operated renewable supplier must include its own waste processing, preparation and drive boundary.

**Part 7. Parameter independence of the controller.**

The only parameter-dependent inputs are the fresh T,E pairs; E is never coupled to the control or output. All controller matrices, ROM entries, timings, fixed coin, detector and terminal policies are independent of q. The completed output uses only the detector outcomes of selected fresh T copies. Keeping unused input/reference systems in the full channel may reveal more to a hypothetical enlarged reader, but the declared reader does not have that access. Full retained channel and binary-output channel are therefore explicitly different operational interfaces.

**Part 8. Precise obstructions to a stronger finite closed-cycle reading.**

1. **No finite deadline gives exact R.** Any protocol consuming at most $M$ affine IID source copies has every outcome probability polynomial in $q$ of degree at most $M$: expand the tensor product in the finite-prefix effect formula. Neither $1/(2-q)$ nor its complement is a polynomial on $[0,1]$. If a polynomial $P$ equalled it, $(2-q)P(q)=1$ would hold identically, impossible at $q=2$. Thus neither additional fixed controls nor free classical scheduling turns the deadline source into the exact completed channel.

2. **Exact complete retained histories require unbounded worst-case capacity.** Already at $q=1$ the one-sided algorithm has positive probability of every $A=a\ge 1$. Its complete recorded paths are distinguishable classical records of distinct lengths. A finite-dimensional archive cannot contain infinitely many mutually orthogonal exact records. Encoding length compactly changes average storage, not the need for unbounded maximum capacity. The existing no-reset grammar therefore cannot place this exact factory with its complete history in a single fixed finite installed source. The streaming finite-prefix family is legitimate but not that stronger object.

3. **Finite-temperature exact pure reset is not a corollary of a price.** If a controller of rank $r>1$ is initially independent of a finite-dimensional full-rank bath of dimension d, their initial product has rank rd. Unitary coupling preserves this rank. A final pure controller factor forces joint rank at most d, even allowing the bath state to change. Hence exact reset of that mixed controller is impossible in this model. A fresh pure ancilla permits a SWAP reset precisely because its low entropy is consumed and the displaced state survives in the ancilla; our archive policy exposes rather than hides this resource. Initially correlated helpers, selective postselection or additional consumables change the premises and require their own normalized and charged ledger.

These are structural obstructions. They leave valid the finite prescribed-deadline source and the explicitly consumptive supplied-service source, and they exclude indefinite bounded-stock full-history operation in the no-reset grammar of Definition 42c.6 and an exact globally closed finite-bath cycle in the unitary model of item 3.

This proves the numerical census, normalized native realization, moment and invoice claims, the finite-deadline error bound, and the designated-bit capacity. $\square$

**Exact domain and access.** The domain includes the general nonempty compact convex domains in locally convex Hausdorff spaces retained by Proposition 42c.2, and comprises finite channel/policy and finite-history closures; numerical policy descriptions and names; finite rational symbolic policies and their natural arbitrary finite-code extensions; population and supplied-law sampling; unknown IID and non-IID classical/coherent source samples; known changing classical kernels and unknown causal classical source calls; the kth-order recursions on finite-simplex products and second-order laws on the finite simplex; and the retained exact fixed, least-periodic and regularized relations. Finite coherent reactive ports, when separately registered, have the explicitly stated finite tester normalization/dilation dependency. Infinite quantum superprocesses, global graph-oracle inputs and globally regenerated finite baths lie outside the domain of this record.

**Constructive source branches.** The rational finite source has its already populated native lookup, sampler, initialization, controls, full histories and census. The compact numerical-name compiler gives exact decoded maps and uniformly certified finite approximations, with explicit product/Wasserstein names, quotient-respecting readouts and the counted native host. Continuous populations have the stated modulus/grid/sample recurrences and actual finite rational source tables. Numerical second-order laws have a random-name sampler, while hierarchical unknown samples retain their different conditional moment laws. Universal classical stream response functionals and stream-law maps have the continuous-affine characterization and retained stopping compiler. Static coherent stream/source-family effects and full declared instruments have the local-positive/CP-summand criterion, normalized residual construction, support-null INVALID branches and spectator contract. Finite classical interactive responses have the causal-flow polytope/LP; compatible infinite flows have the source-owned ratio realization and pointwise or compact-uniform halting tails on the admitted progress schedules. The stream, coherent-source and causal-flow criteria are necessary and sufficient on their specified sources, with effective compilation from the stated finite certificates and programs.

**Initialization, relations and negative branches.** Source-internal fixed-point/regularization existence remains distinct from executable initialization. Rational-PWA fixed/least-period/incident-cell relations retain their exact finite algorithms. Continuous computable maps have exact decoded witness transport, negative-information names of fixed/graph sets, and exact Boolean closed-set codes for least-period strata; these outputs do not provide equality tests or witness choice. The explicit continuous family in Theorem 42c.13k rules out universal fixed or promised-periodic initialization from the map name alone. The unknown-transition theorem separately rules out universal stationary initialization from samples. The point-query and finite-global-policy-code theorems rule out their uniform arbitrary regularization compilers, including certified Hausdorff and negative-information graph outputs; the downward-step relation also excludes a supported total selection. These are coverage-complete obstructions on those interfaces. Nonlinear universal one-tape outputs, nonlocal exact sharp static effects, inaccessible counterfactual source queries and the hierarchical deterministic-mean initializer have their separate exact obstructions. For the general compact domain of Proposition 42c.2, the effective compact-metric branch has the numerical construction, whereas part 13 excludes a faithful countable continuous response grammar for nonmetrizable compact K. A metrizable response quotient is legitimate only if the omitted distinctions are outside the retained response contract; uncountably parameterized settings are a different declared grammar. Non-effective native advice is admissible only as a separately declared supply.

**Native resources and cycle ownership.** Each positive branch specifies its actual source preparation/acquisition boundary, initialization, causal controls, output/readout maps, complete instruments and retained invalid/pending/archive records. Finite-prefix constructions use the native algebraic/deterministic-ready/readout/clock service grammar with their explicit finite sizes and invoices; unbounded factories retain their stage, tail and stock quantifiers rather than claiming a fixed installed infinite archive. Theorem 42c.14 numerically populates the one-sided noncommuting sample factory: its parameter-bearing supplier factors, inaccessible references, unused inputs, native controller cells, physical stock and ROM/coupling counts, clock and energy-transfer services, output/archive custody, retention and positively priced replacement cycle are counted. The balanced construction of Proposition 42c.12 retains its separately proved parametric inventory/tariff bounds; the one-sided numerical invoice is not transferred to that architecture or another supplier. The two constructions share the designated completed law but are not identified on full transcripts. The numerical capacity belongs to the designated completed bit, while deadline TIMEOUT and the richer full transcript remain distinct. Conditional paid consumptive full-cycle pricing satisfies the supplied-service requirement of Proposition 42c.12; exact finite-bath regeneration and indefinite bounded-stock complete-history operation are excluded by Part 8 of Theorem 42c.14.

**Equivalence, causal grammar and budgets.** The comparison retains the declared complete responses and source contracts: mathematical law versus sample, exact numerical name versus statistical estimator, exact completed output versus deadline approximation, fixed point versus least period, regularized relation versus selected law, and public bit versus retained archive/reference channel. All interventions enter one causal grammar; no future token is read early, no source branch is queried counterfactually, and no acceptance/pending branch is postselected away. Exact, uniformly finite-approximate and uncertified limit semantics are separately stated. Complete-cost and native-capacity statements use the whole-block and stock hypotheses of their branch. Supplied support, modulus, source-independence, native-service and tail promises are the hypotheses of the realized branch.

**Verifier and falsifier.** Verification consists of the displayed finite-prefix affine/cone/causal-flow identities, complete Kraus sums, source/history factorizations, name-decoding intertwining, exact finite symbolic tests and negative-name enumerations, stated approximation/tail recurrences, explicit support/continuity/code indistinguishability obstructions, and the independently populated native supplier/cycle ledger. A counterexample to one of these results keeps its declared source access, output representation, intervention grammar, budget and supplied-service premises. A missing charged factor, unjustified oracle or reset, altered source custody, incorrect decoded relation, failed normalization or violated claimed error/tail bound would falsify the relevant realization.

**Disposition.** The constructive branches supply the source, input, intervention and readout maps with the closure law for supplied effective continuous policies on compact metric domains, including the $k$th-order and second-order domains of Proposition 42c.2(4), together with the response criteria of the stream, static coherent-source and causal-flow interfaces and the finite-horizon population bounds. Each negative branch excludes a uniform compiler, selector or grammar over all controllers of one access interface; source contracts with a branch, stratum or relation port, with native advice or with uncountably parameterized settings lie outside these exclusions. Theorem 42c.16 realizes the fixed, least-periodic, regularized and order-discontinuous laws on its declared native relation service. Exact graph truth and the setting reader are supplied primitives of this source. Theorem 14.1's receiver-policy-stable diagonal prediction obstruction is unchanged: positive capacity and consistent distributions do not create paradox-enabling prediction.

<a id="theorem-42c15"></a>

<a id="theorem-42c15-exact-semialgebraic-initialization-and-finite-retained-policy-sources"></a>**Theorem 42c.15 (Exact Semialgebraic Initialization and Finite Retained Policy Sources).** Let $K$ be a finite simplex $\Delta(H)$ or its finite product for a lifted history recursion. Supply a finite menu of total single-valued policy graphs on $K$, given by Boolean formulas in polynomial equalities and inequalities over the real algebraic numbers. Specify the initial policy, a finite interrogation horizon, and whether to initialize a fixed law, a law of prescribed least period $r\ge1$, or a regularized fixed law on the simplex. There is a terminating constructor which decides the requested initialization and, for each nonempty relation, computes an algebraic initializer and a finite exact source with the algebraic ports of Definition 42c.6. The policies, horizon and mode are its inputs. The source retains the exact law codes, sampled symbols, intervention records and the sampled cluster indices on regularized steps.

*Proof.* For a policy $G$, impose the graph equations $G(x_i)=x_{i+1}$, with indices modulo $r$, and pairwise distinctness of the $x_i$. Determinism makes the period exactly $r$. The $r=1$ case is the fixed-point relation. A fixed state of a shift lift is a constant history. Real-closed-field quantifier elimination and algebraic cell sampling decide these relations and produce an algebraic point in every nonempty case (Collins, 1975). The chosen effective order of variables and cells fixes a selection rule. Algebraic point existence agrees with real point existence by the real-closed-field transfer principle. The continuous, dominance-monotone and binary no-downward-crossing classes have the existence guarantees of Proposition 42c.2. On its antitone class apply the fixed-law procedure to $G^2$ and classify the resulting orbit by exact equality. A prescribed least period uses the actual period relation and may yield an empty result.

On the finite simplex use the following graph-closure relation:
$$
C_G(x,y)\iff(\forall\epsilon>0)(\exists(u,v)\in\operatorname{graph}G)
\bigl(\|u-x\|^2+\|v-y\|^2<\epsilon^2\bigr).
\tag{42c.15.1}
$$
Its fibre is the cluster set in Proposition 42c.2(3). Write $n=|H|$. Add the equations $C_G(x,y_i)$, $\lambda_i\ge0$, $\sum_i\lambda_i=1$ and $x=\sum_i\lambda_i y_i$ for $1\le i\le n$. Carathéodory's bound and the existence of a fixed law for (63j) make this relation nonempty. Cell sampling returns the cluster values, weights and law together. For a designated algebraic setting $x_0$, imposing $x=x_0$ decides whether that point supports a regularized fixed law. A regularized transition keeps its selected code $x$ and draws the joint symbol $(i,h)$ with probability $\lambda_i y_i(h)$, which has marginal $x$ on $H$. An ordinary transition at the same code uses $G(x)$.

Enumerate the reachable algebraic law codes through the requested horizon for all finite intervention words. A single-valued graph fibre over an algebraic code has an algebraic output, obtained by the same point sampling. Include the full selected initial orbit in the source description. The native alphabet records the current law code and sampled symbol, with a cluster index at a regularized draw and a dummy index otherwise. A setting token reads that deterministic code and selects the next code and its normalized column of symbol probabilities. For a history recursion read the newest simplex coordinate for the symbol draw. A regularized token acts at its declared code. Unsupported tokens use the total invalid-input rule. The initial sampler uses the selected law. The retained law code supplies a control register, and no sample frequency is substituted for it.

The identity observation matrix on this enlarged finite alphabet, the finite lookup and record copies, and the positive clock slots use the service grammar of Definition 42c.6. The Householder column preparation of (42c.6.2)–(42c.6.3) extends to the algebraic columns here: nonnegativity and exact normalization give algebraic square roots and a finite algebraic involution. Charge the resulting alphabet, matrix entries, controls, ready factors, readout copies, clocks and archive by the finite census of Theorem 42c.7. The policy graph, algebraic root descriptions and finite external compilation are declared source data. Induction over the horizon gives the stated graph update and conditional sample law for every retained token history, including causal choices based on earlier records. Under the selected policy the exact law code follows the initialized orbit. A sampled symbol path has its own probability law.

The same construction applies to the weight coordinates of a second-order policy restricted to a supplied invariant simplex $\operatorname{conv}\{\delta_{p_i}\}$ on distinct algebraic $p_i\in\Delta(H)$, when its restriction has the specified graph description. The second-order atom and its associated symbol can be recorded with joint weight $w_i p_i(h)$. Invariance is a premise of this case.

For nonvacuity, $G(q)=1-q^2$ has fixed law $(\sqrt5-1)/2$ and the least-period-two orbit $(0,1)$. The rule $G(q)=1-q^2$ for $q<1/2$ and $G(q)=(1-q)^2$ for $q\ge1/2$ is antitone, has the same period-two orbit and has no ordinary fixed law. At $q=1/2$ its cluster values $1/4$ and $3/4$ have a fair mixture with the selected fixed law, yielding the joint cluster-symbol column $(3,1,1,3)/8$. The rule $q^2/2$ for $q<1/2$ and $(1+q^2)/2$ otherwise is a discontinuous monotone example without downward crossing and has fixed laws $0$ and $1$. These policy graphs lie outside the rational piecewise-affine class. ∎

<a id="theorem-42c16"></a>

<a id="theorem-42c16-exact-policy-law-initialization-from-global-relation-tests"></a>**Theorem 42c.16 (Exact Policy-Law Initialization from Global Relation Tests).** Let $H$ be a nonempty finite set and let $K$ be $\Delta(H)$, a finite product of its copies, or $\mathcal P(\Delta(H))$ with its weak topology. Give these carriers their ordinary compact metric presentations with finite rational nets. For the full regularization statement also allow any nonempty compact convex $K$ in a locally convex Hausdorff space, with the affine-coordinate presentation specified below. Supply each policy by its total single-valued graph. A lifted finite-history policy uses the complete shift on the history product. A second-order policy uses laws on the whole simplex. The same graph-access contract described below gives:

1. An exact fixed-law initializer for every continuous policy in these three cases, and a total decision for existence of a prescribed finite least period. When the period exists, the initializer returns the full periodic tuple.
2. For every policy on any stated compact convex carrier, an exact regularized fixed-law initializer in the declared response coordinates. On the finite simplex the initializer also gives an explicit finite cluster mixture. A specified setting can be tested and used when it supports a regularized fixed law. The test and constructor include retained discontinuities.
3. Exact closure for all dominance-monotone and dominance-antitone policies of Proposition 42c.2(5), and for all binary one-sided-limit policies without downward crossing in Proposition 42c.2(6). The antitone output is a fixed law or a two-cycle, with its exact period.

The source law uses the selected tuple or mixture as its initialization output. Its ordinary policy action, regularized action, intervention record and conditional symbol law are given below. No fixed point, periodic tuple, cluster witness, or sampling law is supplied as an extra policy input.

##### The relation service

The policy input is its whole graph as a single relation on the declared sorts. It has no field for an initializer, a cluster value, a decomposition, a period label, or answers to queries. Separately the source supplies an exact truth bit for a finite quantified formula over those sorts. Its basic relations are the supplied policy graphs, equality, the declared affine coordinates and real arithmetic, and the metric and rational metric-ball constraints when the carrier is metric. Formulas may use finite products, the input settings, Boolean connectives and quantification over a declared sort. Metric presentations have fixed ordered finite nets and bounded rational approximations to their distance functions. The source has a conjunction reader on a declared indexed family of predicates: it returns the universal truth bit for the family, including when the family is a countable response name or an indexed coordinate constraint. On the general compact carrier the index and predecessor sorts below are part of the declared setting presentation. The relation service answers truth relative to the complete input graph, including for input settings with noncomputable coordinates. Universal quantification over the index and finite-subset sorts supplies the indexed conjunctions used below. It is the general exact global relation service, applied also to formulas unrelated to consistency. The service returns no selected point. It is stronger than evaluation at finitely many graph points or provision of a finite global policy code. Its truth bit is a supplied native response. The effective access boundaries of Theorem 42c.13h.1 apply to weaker inputs.

There is a set-theoretic operational interpretation for this service on every supplied graph: for each finite formula and tuple of settings assign the truth bit by ordinary quantifier semantics, using the declared carrier for each quantified variable. For example, an existential bit is the indicator that the projection of its satisfaction relation contains the settings. The bit can be represented by the two deterministic outputs of a classical two-state instrument at that setting. Settings are externally declared control values. For arbitrary graphs the bit need not vary measurably with arbitrary settings. The source grammar uses deterministic initial settings, deterministic law-name updates and choices between a countable menu of tokens based on retained records. Hence each queried setting, conditional on the declared inputs and a finite token history, has countably many possibilities, and its instrument law is a countable sum of fixed-setting laws. Sampled second-order simplex values are read through their coordinate names and are used only in the Borel sampling channel below. This interpretation is uncountably parameterized and admits non-effective settings. The global relation service is a primitive of the formal source. All subsequent uses of the service expose their actual queries and readouts.

##### Extraction from a compact relation

For a nonempty compact relation $C$ in any finite product of the metric sorts, use ordered finite closed-ball covers of radii $2^{-j}$ for $j\ge1$. Such covers exist in the declared presentations. In $\mathcal P(\Delta(H))$ one may use finite rational weights on the grids of the simplex: transport each point to a nearest grid point, then approximate the resulting masses by rational weights. The transport error and the simplex diameter times the mass approximation bound give finite nets for the Wasserstein-$1$ metric, which induces the weak topology here.

At stage $j$, intersect all previously selected closed balls with the first ball in the $j$th cover for which the relation service reports a nonempty intersection with $C$. A ball exists because the previous intersection is nonempty and the new cover is complete. The finite intersection with $C$ is compact, nested and has diameter at most $2^{1-j}$. Their intersection is a singleton. The recorded ball centers form its certified Cauchy name, because the singleton belongs to each selected ball. Each requested name prefix takes finitely many bit queries. A preliminary relation test returns a retained NO-LAW status for an empty requested relation and keeps the ready state. This extraction also applies to a singleton whose defining relation is itself given by quantified formulas.

The resulting point is an output and formulas may subsequently use it as a setting. The declared exact real-setting reader accepts a certified Cauchy name and supplies its limit to the relation port. This reader is a supplied native interface of the same contract. A setting computed by extraction is therefore the output of the graph-derived countable rule, rather than an independently supplied law witness. A later relation query may depend on the whole name. Finite call counts in this contract count calls to this native reader as well as truth-bit queries.

##### The three initializers

For a continuous policy, the fixed relation is compact. The graph constraints
$$
F(x_i)=x_{i+1\bmod r},\qquad d(x_i,x_j)\ge 2^{-k}\quad (i\ne j)
\tag{42c.16.1}
$$
are compact for each integer $k\ge1$, and their union is the prescribed least-period relation. First test the latter relation with strict pairwise inequality. If it exists, increase $k$ until a nonempty compact slice is found, and extract on that slice. A cycle with distinct points has exact least period $r$, and every least-period orbit is found in some slice. For $r=1$ use the fixed relation. Existence of a fixed law on the three continuous carriers follows from Proposition 42c.2. In the history case a fixed shift tuple has identical coordinates. In the second-order case the compact weak metric is used on the full law carrier, without a finite-support restriction.

For regularization on a compact convex carrier, choose a separating family $(\phi_i)_{i\in I}$ of continuous affine real coordinates, each scaled to take values in $[0,1]$ on $K$. In finite dimensions use ordinary affine coordinates. On $\mathcal P(\Delta(H))$ use integrals against a uniformly dense countable family of continuous functions on the simplex. In the general case continuous linear functionals on the locally convex ambient space separate points. The affine-coordinate map is then a continuous injection from compact $K$ into a Hausdorff product, so it is a homeomorphism onto its image. Finite coordinate cylinders therefore generate the topology in every case.

The relation for $y\in\bar F(x)$ is given by a family of finite formula tests. For every finite coordinate set $I_0$ and rational $\epsilon>0$, restrict all contributing inputs $u$ to $|\phi_i(u)-\phi_i(x)|<\epsilon$ for $i\in I_0$. For every finite output coordinate set $I_1$ and rational $\delta>0$, ask whether a convex combination of at most $|I_1|+1$ points $F(u_j)$ differs from $y$ by less than $\delta$ on $I_1$. Membership in the closed convex hull is exactly this output family, by the cylinder topology and Carathéodory's theorem on each finite coordinate image. Imposing the input family is exactly (63j). These tests use the graph with no regularization relation supplied as input. Their conjunction, and its restriction to the diagonal, are available from the declared reader. Proposition 42c.2(1) gives compactness and nonemptiness of the fixed relation $C$.

On the metric carriers apply compact extraction to $C$, asking the same exact graph formula with its indexed conjunction and the finite ball constraints. On a general compact carrier supply a well-order of the coordinate index set independently of the policy. For two distinct points $x,y$, write $x<_{\rm lex}y$ if there exists an index $i$ with $\phi_i(x)<\phi_i(y)$ and $\phi_k(x)=\phi_k(y)$ for every $k<i$. This uses quantification over the index sort and the fixed order. The selected point in $C$ is specified by the relation $x\in C$ and $\neg\exists y\in C:\ y<_{\rm lex}x$. To prove existence, begin with $C$ and at each coordinate restrict to its minimum over the current compact set. At a limit take the intersection of the earlier restricted sets, which is nonempty by compactness. The resulting intersection is a singleton since the coordinates separate points, and its member satisfies the displayed relation. The transfinite argument verifies the formula; a readout query uses only the original graph, the coordinate family and the index order. In particular, the service receives neither the selected point nor an initialized ledger of preceding minima. A query at a chosen index and rational threshold obtains a bit about the corresponding coordinate of the unique point by adding that threshold to the formula. A finite experiment on this branch reads finitely many selected coordinates to its declared precision. If a setting is specified, intersect with its singleton and test first. The regularized law then retains the selected fixed law and uses its own normalized coordinate readouts.

On $\Delta(H)$ the finite cluster mixture has a direct finite relation. A point $y$ belongs to the cluster fibre at $x$ exactly when for every real $\epsilon>0$ there exist $u,v$ with $F(u)=v$ and $d(x,u)+d(y,v)<\epsilon$. This is closure of the supplied policy graph. For $n=|H|$ use $n$ such graph-closure constraints and weights $\lambda_i\ge0$ with $\sum_i\lambda_i=1$ and $x=\sum_i\lambda_i y_i$. These equations define a compact relation on the product of simplexes. It is nonempty by Proposition 42c.2(1) and (3). If $x$ is specified, intersect with its singleton and test first. Extraction supplies $x$, all $y_i$, and their weights. On this regularized step the joint readout $(i,h)$ has law $\lambda_i y_i(h)$, so its symbol marginal is exactly $x$. For every cluster value the graph formula supplies the source of its approach: at any requested radius there is an actual graph point in the specified ball. A separate least-period test on the original graph distinguishes an ordinary orbit from the regularized branch.

For a dominance-monotone policy, take the infimum, in the dominance order, of all prefixed laws $F(x)\preceq x$. This set contains the top law. In cumulative-probability coordinates the infimum is a coordinatewise supremum, so its coordinates are determined by rational threshold truth queries about the graph. The infimum $x_*$ is fixed: for every prefixed $y$ one has $F(x_*)\preceq F(y)\preceq y$, hence $F(x_*)\preceq x_*$. Then monotonicity makes $F(x_*)$ itself prefixed, giving $x_*\preceq F(x_*)$. For an antitone policy apply the same rule to $F^2$ with its graph defined by one intermediate point. Output $(x_*,F(x_*))$ and distinguish period one from two by the exact graph and equality test. For a binary policy of Proposition 42c.2(6), first test and return $0$ or $1$ if either is fixed. Otherwise $F(0)>0$ and $F(1)<1$. The real setting
$$
x_*=\sup\{x\in[0,1]:F(x)>x\}
\tag{42c.16.2}
$$
has its exact name from rational threshold queries. If $F(x_*)>x_*$, the right limit is at most $x_*$ and $x_*<1$. If $F(x_*)<x_*$, a sequence of positive-sign points approaches $x_*$ from the left, so the left limit is at least $x_*$ and $x_*>0$. Each alternative is an excluded crossing. Thus $F(x_*)=x_*$.

##### Law and readout maps

The ready source contains the fixed presentation, the supplied graph and relation port, a fair-bit source, and a public token and output archive. An input sets the carrier, policy, initialization mode and any period or designated regularization setting. On a supported input the deterministic constructor produces certified names, or NO-LAW when the requested relation is empty. A graph step updates the law by reading the unique output of the current graph. Its name is obtained by compact extraction from its singleton fibre. A periodic token advances along the initialized tuple. A regularized token at a selected simplex law uses the initialized mixture and records the cluster index. On the other carriers the token returns the selected regularized law through its declared law or coordinate interface. An unsupported token emits INVALID and retains the state and previous records. Each operation retains its actual setting, the completed finite queries, readouts, and record of any unfinished sample.

For a finite alphabet, sample the law by comparison of an independent fair-bit real with the cumulative masses. Refine the real and mass names until their relative order is decided. The boundary events have probability zero and the resulting exact conditional probabilities are the supplied masses. For a history tuple use its newest coordinate. For a second-order law $\mu$ on the simplex, the sampling map uses a fixed Borel partition tree of the simplex with finite branching and diameters tending to zero. Include evaluations $\mu(C)$ for cells of this fixed tree among the declared law-coordinate relations, with the truth bit for a rational threshold supplied by the same native service. For each child cell use these thresholds to obtain a mass name, and use the cumulative comparison on the child probabilities, divided by the positive parent mass. A zero-mass parent occurs with probability zero and has a declared INVALID branch if supplied separately as an invalid input. The probability of visiting each node is its $\mu$-mass by induction. The nested closed cell closures define the sampled simplex point in the limit, and its distribution is $\mu$: a continuous test function varies by at most its modulus on each cell, so the approximating finite partition integrals converge to the correct expectation. The mass coordinates are Borel functions of a weak law, since the cells are Borel. Each finite prefix supplies a finite accuracy bound on the sampled simplex point. The next finite symbol is drawn from that simplex point by the cumulative method.

Thus every finite history of supported law transitions and recorded samples has exactly the stated conditional law. On the general compact carrier use the coordinate menu $i\in I$. For a law code $x$, read the exact $\phi_i(x)$ or output a bit of that probability by the finite-alphabet sampler. The family of all settings separates the retained laws, and finite adaptive histories use only the queried coordinates. One can use finite caps on the number of calls for a deadline presentation, retaining PENDING when the cap is reached. The exact sampled output is the almost-surely completed law, with each requested finite precision kept as an explicit response. The source uses declared service calls and per-call records, and the time of a finite response counts these calls. The stronger setting reader remains a declared service. No uniform finite bound on all completed histories or installation of that service by a finite matrix alphabet follows.

The input graph and policy settings are supplied before their initialization and forward updates. The outputs describe the distribution of that declared policy. The source has no transition from a later receiver action to an earlier recorded prediction. In particular the fixed-law identity supplies no guarantee for a transcript challenged after recording by the receiver's diagonal policy in Theorem 14.1. All supported interventions and subsequent readouts occur in the ordinary forward token order.

##### Populated policies

On the binary simplex put $\alpha=\sqrt2$ and take the continuous policy $F(q)=1-q^\alpha$. It is strictly decreasing, so its fixed law is unique by continuity, and $(0,1)$ is a least-period-two orbit. The graph is outside the semialgebraic class, since the leading exponent of a nonzero one-variable semialgebraic function at the origin is rational. For this function the latter criterion follows directly from a polynomial identity: a nonzero polynomial vanishing on $y=q^\alpha$ would give a nontrivial finite sum of distinct powers $q^{i+j\alpha}$, and the smallest exponent cannot cancel. A semialgebraic graph with empty interior must lie in the union of the zero sets of its finitely many nonzero boundary polynomials, whose product then vanishes on the graph. A two-history example is the shift $(q_1,q_2)\mapsto(1-q_1^\alpha,q_1)$, with the same stationary coordinate and the two alternating histories. A weakly continuous second-order example on the full law carrier is $F(\mu)=\delta_{1-m(\mu)^\alpha}$, where $m(\mu)=\int q\,\mu(dq)$. Its fixed law is the point mass at the fixed binary probability, and $(\delta_0,\delta_1)$ is a least-period-two tuple.

For a discontinuous example take $F(q)=1-q^\alpha$ below $1/2$ and $F(q)=(1-q)^\alpha$ at and above it. It is antitone, has no ordinary fixed law, has orbit $(0,1)$, and its cluster values at $1/2$ are $p=2^{-\alpha}$ and $1-p$. Their equal-weight mixture closes at $1/2$ and the joint cluster-symbol probabilities are $(1-p,p,p,1-p)/2$. The same policy gives a nonmetrizable example on $K=[0,1]^I$ for an uncountable $I$ with one specified coordinate $i_0$: apply this binary policy at $i_0$ and set every other output coordinate to zero. At a fixed point of the regularized policy the other coordinates vanish. For $q\ne1/2$ the active output is its ordinary single value and is different from $q$, whereas at $q=1/2$ the interval $[p,1-p]$ contains $q$. Thus the regularized fixed law is unique and its active readout is a fair bit.

A discontinuous monotone policy with one-sided limits and without downward crossing is $F(q)=q+a(q)(3/4-q)$, with $a(q)=(1+q^\alpha)/4$ for $q<1/4$ and $a(q)=(2+q^\alpha)/4$ for $q\ge1/4$. Its only jump is upward and both values near the jump are above the diagonal. On either continuity interval its derivative is positive: for $q\le3/4$ this follows from $a\le3/4$ and $a'\ge0$, and for $q>3/4$ the derivative is at least $1/4-\alpha/16>0$. Its only fixed law is $q=3/4$, and the endpoint values are strictly inside the interval. Thus the same nontrivial initializer applies to both the dominance-monotone and binary one-sided-limit predicates. Each discontinuous binary graph retains a branch with the same irrational exponent at the origin, so neither graph is semialgebraic by the polynomial argument above. In each example the graph, mode and any chosen setting are source data, and the laws and orbit tests are outputs of the construction. ∎

**10.5 Relation to Emergent Locality and AQFT Framework**

Appendix F supplies the conditional AQFT setting for the marginal-invariant and shared-past branches. Corollary F.1 formulates operator-level Einstein causality under Theorem F.0's continuum-bridge hypotheses. On the local CPTP branch, the prepared state $\omega_{C_A}$ may depend on Alice's context through the map $\mathcal M$ and ND-RID dynamics, so joint expectations such as $\omega_{C_A}(A\otimes B)$ in Equation (F.4) may vary while Bob's unconditional statistics $\omega_{C_A}(\mathbf{1}_A\otimes B)$ remain invariant. Thus operator locality, Equation (F.2), and state-mediated joint or conditional dependence coexist on the Bob-marginal-preserving branch.

A late-randomized branch-(iii) Bob-marginal shift is PU's statistical-FTL hypothesis; by Theorem 39c/Corollary 39c.1 it lies outside exact pre-lightcone context independence, so a certified shift would select branch (iii) over the exact causal branch, while a null result keeps that branch. On the regular finite-window model, Theorems 39a–42 bound reliability, sample complexity, information rate, and zero-error accessibility. Implementation remains subject to ND-RID irreversibility, $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ on the registered reset branch, with a positive floor inferred from this entropy bound requiring $H_q(P\mid R)\ge h_{\min}>0$ (Theorem 31). On the separate refresh/minorization branch, Lemma E.1 gives $f_{RID}<1$ and Theorem E.2 gives $C_{\max}<\ln d_0$. These contraction and capacity results do not establish the common-support condition of Definition 10.2a, which remains an independent finite-window regularity hypothesis. The conditional Lorentz-invariant description applies to the exact marginal-invariant and shared-past branches, while branch (iii) supplies PU's statistical-FTL experimental alternative outside the exact Lorentz/AQFT causal branch.

**Measurement-independence guardrail.** For experimental settings $x,y$ and a past variable $\lambda$, measurement independence is the separate condition
$$
P(x,y\mid\lambda)=P(x,y).
$$
Logical indeterminacy, stochastic outcomes, no-signaling, and absence of a deterministic hidden variable do not imply this equality. Stochastic settings may remain correlated with $\lambda$, and no-signaling constrains outcome marginals rather than the setting distribution. Every Bell-type PU protocol must therefore either assume measurement independence or bound its failure with an explicit causal and statistical model; CC is not presumed to be the only possible common-cause channel.

<a id="theorem-42b-sharp-chsh-robustness-on-the-uniform-setting-contamination-class"></a>**Theorem 42b (Sharp CHSH Robustness on the Uniform Setting-Contamination Class).** Let $z=(x,y)\in\{0,1\}^2$ be uniformly selected settings, let $a,b\in\{0,1\}$, and fix $0\le\mu\le1$. Consider the causal-model class
$$
P(a,b\mid x,y)
=(1-\mu)P_{\mathrm{MI}}(a,b\mid x,y)
+\mu P_{\mathrm{SD}}(a,b\mid x,y),
\tag{63c}
$$
where $P_{\mathrm{MI}}$ is a measurement-independent local hidden-variable model and $P_{\mathrm{SD}}$ is a local-response model whose hidden-variable distribution may depend arbitrarily on the full setting pair. If $S_{\mathrm{CHSH}}$ is the usual absolute CHSH value, then
$$
S_{\mathrm{CHSH}}\le 2+2\mu.
\tag{63d}
$$
The bound is sharp for every $\mu$. Therefore an observed value $S\in[2,4]$ requires
$$
\mu\ge\frac{S-2}{2}
\tag{63e}
$$
within this class; in particular, reproducing $2\sqrt2$ requires $\mu\ge\sqrt2-1$.

*Proof.* The signed CHSH functional is affine in the conditional law. Its absolute value therefore obeys
$$
S_{\mathrm{CHSH}}(P)
\le
(1-\mu)S_{\mathrm{CHSH}}(P_{\mathrm{MI}})
+\mu S_{\mathrm{CHSH}}(P_{\mathrm{SD}})
\le 2+2\mu,
$$
where the first inequality is the triangle inequality, the local bound is $2$, and the algebraic bound is $4$. To attain it, choose a measurement-independent deterministic local model with signed CHSH value $2$. In the setting-dependent component, choose for each setting pair a hidden-variable value carrying deterministic local outputs whose parity obeys $a\oplus b=xy$ on that pair. This component has signed CHSH value $4$ in the same convention, so the mixture has value $(1-\mu)2+4\mu=2+2\mu$. Rearrangement proves (63e). ∎

Theorem 42b is a complete robustness result for the explicitly frozen mixture class (63c). Total-variation, mutual-information, min-entropy, retrocausal, and common-cause bounds define different measurement-dependence classes, which Theorem 42b.1 classifies.

<a id="theorem-42b1-sharp-chsh-census-across-measurement-dependence-measures-and-causal-classes"></a>**Theorem 42b.1 (Sharp CHSH Census Across Measurement-Dependence Measures and Causal Classes).** Keep the scenario of Theorem 42b: uniformly selected settings $z=(x,y)\in\{0,1\}^2$, binary outcomes, local responses $P(a\mid x,\lambda)P(b\mid y,\lambda)$, and hidden-variable laws $\rho_z(\lambda)=P(\lambda\mid z)$ that may depend arbitrarily on $z$. Write $P(z,\lambda)=\frac14\rho_z(\lambda)$ and $\bar\rho=\frac14\sum_z\rho_z$, and define
$$
\begin{aligned}
M_{\mathrm{pair}}&=\max_{z,z'}\operatorname{TV}(\rho_z,\rho_{z'}),
&D_{\mathrm{TV}}&=\operatorname{TV}(P_{Z\Lambda},P_Z\otimes P_\Lambda),
&I&=I(Z;\Lambda),\\
P_{\mathrm{guess}}&=\sum_\lambda\max_zP(z,\lambda),
&m&=\sum_\lambda\min_zP(z,\lambda),
&\ell&\le P(z\mid\lambda)\le u\ \text{ for all }z\text{ and }\bar\rho\text{-almost every }\lambda,
\end{aligned}
$$
with $I$ in nats; for a general standard Borel hidden-variable space the sums over $\lambda$ are integrals. Conditional probabilities are taken modulo $\bar\rho$-null sets. The sharp intrinsic choices of $\ell$ and $u$ are the essential infimum of $\min_zP(z\mid\lambda)$ and essential supremum of $\max_zP(z\mid\lambda)$; supplied weaker bounds are also allowed and are retained annotations rather than canonical functionals of the joint law. If pointwise mechanisms or source-value interventions are needed, fix a normalized measurable conditional version. Any admissible bounds obey $\ell\le1/4\le u$, so uniform completion on an exceptional null set makes those same bounds hold everywhere. A supplied pointwise-bounded version can instead be retained unchanged. Tight pointwise extrema of an unspecified version are not determined by the joint law. Put $\gamma_S:=(4-S_{\mathrm{CHSH}})/8$ and $H_4(\gamma):=-\gamma\ln\gamma-(1-\gamma)\ln\frac{1-\gamma}{3}$. Every model in the class obeys
$$
\begin{aligned}
S_{\mathrm{CHSH}}&\le4-8m,
&S_{\mathrm{CHSH}}&\le2+6M_{\mathrm{pair}},
&S_{\mathrm{CHSH}}&\le2+8D_{\mathrm{TV}},\\
S_{\mathrm{CHSH}}&\le24P_{\mathrm{guess}}-4,
&S_{\mathrm{CHSH}}&\le4-8\ell,
&S_{\mathrm{CHSH}}&\le24u-4,
\end{aligned}
\tag{63g}
$$
and, whenever $S_{\mathrm{CHSH}}\ge2$,
$$
I(Z;\Lambda)\ge\ln4-H_4(\gamma_S).
\tag{63h}
$$
Every bound in (63g)--(63h) is attained, at every value $S_{\mathrm{CHSH}}\in[2,4]$, by the four-strategy family
$$
\rho_z=\gamma\,\delta_{\lambda_z}+\frac{1-\gamma}{3}\sum_{w\ne z}\delta_{\lambda_w},
\qquad0\le\gamma\le\frac14,
\tag{63i}
$$
where $\lambda_w$ is a deterministic local strategy whose outputs obey $a\oplus b=xy$ at every setting pair except $w$. On this family $S_{\mathrm{CHSH}}=4-8\gamma$, $m=\ell=\gamma$, $M_{\mathrm{pair}}=(1-4\gamma)/3$, $D_{\mathrm{TV}}=(1-4\gamma)/4$, $P_{\mathrm{guess}}=u=(1-\gamma)/3$ and $I=\ln4-H_4(\gamma)$. Hence an observed $S\in[2,4]$ requires exactly
$$
M_{\mathrm{pair}}\ge\frac{S-2}{6},\quad
D_{\mathrm{TV}}\ge\frac{S-2}{8},\quad
P_{\mathrm{guess}},\,u\ge\frac{S+4}{24},\quad
m,\,\ell\le\frac{4-S}{8},\quad
I\ge\ln4-H_4\!\Bigl(\frac{4-S}{8}\Bigr);
$$
at $S=2\sqrt2$ these thresholds are $(\sqrt2-1)/3$, $(\sqrt2-1)/4$, $(2+\sqrt2)/12$, $(2-\sqrt2)/4$ and $0.0321$ nats ($0.0463$ bits).

Every joint law $P(z,\lambda)$ with uniform setting marginal is generated by each of three causal structures: setting-to-source influence $Z\to\Lambda$, including retrocausal influence on the source; source-to-setting influence $\Lambda\to Z$; and a common cause $C\to Z$, $C\to\Lambda$ with no edge between $Z$ and $\Lambda$. The CHSH value, the five intrinsic dependence quantities $M_{\mathrm{pair}},D_{\mathrm{TV}},I,P_{\mathrm{guess}},m$, and the sharp essential bounds are functionals of $P(z,\lambda)$ and the local responses. Supplied weaker bounds $\ell,u$ are retained admissibility annotations rather than canonically inferred values. The thresholds coincide across the three causal classes, which realize exactly the same outcome tables and intrinsic values and preserve the same supplied bounds.

*Proof.* Absorbing independent local randomness $\xi$ into $\lambda$ makes every local response deterministic without changing $P(z\mid\lambda)$ or any of the measures above, because $\xi$ is independent of $(z,\lambda)$. The relabeling $b\mapsto b\oplus1$ reverses the sign of the signed CHSH functional and leaves every measure unchanged, so it suffices to bound the signed value. For a deterministic strategy $\lambda=(\alpha,\beta)$ put $g_z(\lambda)=(-1)^{\alpha(x)\oplus\beta(y)\oplus xy}$; the signed value is $\sum_z\sum_\lambda\rho_z(\lambda)g_z(\lambda)$. Each of $\alpha(0),\alpha(1),\beta(0),\beta(1)$ occurs in two of the four parities $\alpha(x)\oplus\beta(y)$, while $\sum_zxy=1$; hence every $\lambda$ fails the relation $\alpha(x)\oplus\beta(y)=xy$ at an odd number of setting pairs, so $\sum_zg_z(\lambda)\le2$ and some $g_z(\lambda)=-1$.

For fixed $\lambda$, placing the value $-1$ on a smallest weight gives $\sum_zP(z,\lambda)g_z(\lambda)\le P(\lambda)-2\min_zP(z,\lambda)$; multiplication by $4$ and summation give $S\le4-8m$. Since $\min_zP(z\mid\lambda)\ge\ell$ and $\min_zP(z\mid\lambda)\ge1-3\max_zP(z\mid\lambda)$, averaging over $\lambda$ gives $m\ge\ell$, $m\ge1-3u$ and $m\ge1-3P_{\mathrm{guess}}$; with $S\le4-8m$ these give the bounds in $\ell$, $u$ and $P_{\mathrm{guess}}$. For a law $\nu$ and $|g|\le1$, $\bigl|\sum_\lambda(\rho_z-\nu)(\lambda)g(\lambda)\bigr|\le2\operatorname{TV}(\rho_z,\nu)$. With $\nu=\rho_{z_0}$ this gives $S\le\sum_\lambda\rho_{z_0}(\lambda)\sum_zg_z(\lambda)+6M_{\mathrm{pair}}\le2+6M_{\mathrm{pair}}$; with $\nu=\bar\rho$ it gives $S\le2+2\sum_z\operatorname{TV}(\rho_z,\bar\rho)=2+8D_{\mathrm{TV}}$.

For (63h), let $W(\lambda)$ be a setting pair with $g_{W(\lambda)}(\lambda)=-1$. Then $S\le\sum_z\bigl(1-2\rho_z(W=z)\bigr)=4-8\Pr(W=Z)$, so $p_e:=\Pr(W\ne Z)\ge1-\gamma_S\ge3/4$. Fano's inequality for the estimator $W$ of the uniform four-valued $Z$ gives $H(Z\mid W)\le(\ln2)h_2(p_e)+p_e\ln3$, and the right side decreases on $[3/4,1]$ because its derivative is $\ln\bigl(3(1-p_e)/p_e\bigr)\le0$; at $p_e=1-\gamma_S$ it equals $H_4(\gamma_S)$. Data processing gives $I(Z;\Lambda)\ge I(Z;W)=\ln4-H(Z\mid W)\ge\ln4-H_4(\gamma_S)$.

On (63i), $\lambda_w$ fails only at $w$, so $S=\sum_z(1-2\gamma)=4-8\gamma$. The hidden-variable marginal is uniform on the four strategies, so $P(z\mid\lambda_w)=\rho_z(\lambda_w)$, which equals $\gamma$ for $z=w$ and $(1-\gamma)/3$ otherwise. This gives $m$, $\ell$, $u$, $P_{\mathrm{guess}}$, $I=H(\Lambda)-H(\Lambda\mid Z)=\ln4-H_4(\gamma)$, $\operatorname{TV}(\rho_z,\rho_{z'})=\bigl|\gamma-\frac{1-\gamma}{3}\bigr|=\frac{1-4\gamma}{3}$ and $\operatorname{TV}(\rho_z,\bar\rho)=\frac{1-4\gamma}{4}$. Substituting $\gamma=\gamma_S$ attains every bound, and rearrangement gives the thresholds.

For the causal classes, sample $z$ uniformly and then $\lambda\sim\rho_z$; or sample $\lambda\sim\bar\rho$ and then $z\sim P(z\mid\lambda)$; or sample $C=(z,\lambda)$ from the joint law and let $Z$ and $\Lambda$ be its coordinates. The three constructions produce the same joint law, hence the same outcome table and the same measures. ∎

<a id="theorem-42b2-formal-setting-source-and-spacelike-separation-realization"></a>**Theorem 42b.2 (Formal Setting, Source and Spacelike-Separation Realization).** Fix any finite hidden-variable alphabet and deterministic local response functions $\alpha_x(\lambda),\beta_y(\lambda)$ in the four-setting class of Theorem 42b.1. Let
$$
q(z,\lambda)=\tfrac14\rho_z(\lambda),\qquad
\bar\rho(\lambda)=\sum_zq(z,\lambda),\qquad
K(z\mid\lambda)=\frac{q(z,\lambda)}{\bar\rho(\lambda)}
\quad\text{when }\bar\rho(\lambda)>0.
\tag{63j.1}
$$
Omit zero-marginal $\lambda$. The following three finite stochastic structural models have exactly the same observational law $q$ and the same local outcome table $a=\alpha_x(\lambda)$, $b=\beta_y(\lambda)$:

1. **Setting to source:** generate the setting pair $Z=(X,Y)$ uniformly and then generate $\Lambda$ by $\rho_Z$.
2. **Source to setting:** generate $\Lambda$ by $\bar\rho$ and then $Z$ by $K(\cdot\mid\Lambda)$.
3. **Common cause:** generate a past variable $C=(Z_0,\Lambda_0)$ by $q$, and set $Z=Z_0$, $\Lambda=\Lambda_0$ by separate projection maps.

For the source-to-setting model, a descendant sampler at the source draws the pair $(X,Y)$ jointly from $K(\cdot\mid\Lambda)$ and sends its components along the two future-timelike branches to the setting displays. The pair need not factor into conditionally independent local draws. This sampling randomness is implementation data, not an enlargement of the registered $\Lambda$ used in the retained equivalence and dependence measures. In the common-cause model, send the two components of $Z_0$ from $C$ to their separate setting displays. An ideal $\operatorname{do}(\Lambda=\lambda)$ replaces the source assignment before its descendant sampler; $\operatorname{do}(Z=z)$ replaces both displayed setting assignments. A randomized trusted setting intervention uses fresh randomness independent of $C$ and $\Lambda$.

Replace a variable's incoming structural kernel under an ideal intervention. The resulting cross-intervention kernels are
$$
\begin{array}{c|cc}
 &P(\Lambda\mid\operatorname{do}(Z=z))
 &P(Z\mid\operatorname{do}(\Lambda=\lambda))\\ \hline
Z\to\Lambda&\rho_z&\text{uniform on four pairs}\\
\Lambda\to Z&\bar\rho&K(\cdot\mid\lambda)\\
C\to(Z,\Lambda)&\bar\rho&\text{uniform on four pairs}
\end{array}.
\tag{63j.2}
$$
Thus the three causal classes have distinct intervention profiles whenever $\rho_z\ne\bar\rho$ for some $z$; they coincide on these profiles exactly at measurement independence. In particular the non-independent four-strategy family (63i), including $\gamma=0$, is a nonempty separating witness.

All three models admit forward-timelike edge embeddings in Minkowski space, but the event assignments differ. Suppress two unused spatial coordinates. In the setting-to-source model place $X,Y$ at $(0,-1),(0,1)$, the source at $(3,0)$, and the two outcomes at $(6,-1),(6,1)$. In the source-to-setting model place the source at $(0,0)$, $X,Y$ at $(3,-1),(3,1)$, and the outcomes at $(6,-1),(6,1)$. In the common-cause model place $C$ at $(-4,0)$, the source at $(0,0)$, $X,Y$ at $(1,-2),(1,2)$, and the outcomes at $(5/2,-2),(5/2,2)$. Each declared causal edge is timelike, each local setting precedes its own outcome, and each pair of outcomes is spacelike. The common-cause assignment additionally makes the source spacelike from both late settings and each setting spacelike from the remote outcome. On that late-separation geometry, forward-local setting-to-source and source-to-setting edges are excluded by the source--setting spacelike relation; the common-cause generator remains admissible. A trusted intervention that replaces both setting kernels removes its observational setting dependence as (63j.2) states.

*Proof.* In item 1 the chain rule gives $P(z,\lambda)=P(z)P(\lambda\mid z)=q(z,\lambda)$. In item 2 it gives $P(z,\lambda)=\bar\rho(\lambda)K(z\mid\lambda)=q(z,\lambda)$, and item 3 gives $q$ by projection. Substitution into the deterministic local responses proves equality of every observational outcome probability and therefore of all seven dependence measures of Theorem 42b.1. Intervention deletes the incoming kernel of the intervened variable while retaining the other kernels. Direct marginalization gives each entry of (63j.2). If $\rho_z\ne\bar\rho$ for some $z$, the first column distinguishes item 1 from items 2--3, and Bayes' formula makes $K(\cdot\mid\lambda)$ nonuniform for some positive-marginal $\lambda$, so the second distinguishes item 2 from items 1 and 3. Conversely, $\rho_z=\bar\rho$ for all $z$ is measurement independence and makes $K$ uniform.

For the event embeddings, the Minkowski timelike test is $\Delta t>|\Delta x|$. Every listed arrow satisfies it: the setting/source arrows in the first two assignments have $(\Delta t,|\Delta x|)=(3,1)$, the source/outcome arrows have $(3,1)$ in the setting-to-source assignment and $(6,1)$ in the source-to-setting assignment, and in the third assignment $C$ reaches the source and both settings by $(4,0)$ and $(5,2)$, while the source reaches each outcome by $(5/2,2)$ and each local setting reaches its outcome by $(3/2,0)$. The outcomes in each assignment are simultaneous at different locations. In the third, source to setting has $(1,2)$ and each setting to the remote outcome has $(3/2,4)$, both spacelike. A forward-local influence requires a future-causal edge; the source--setting spacelike relation therefore excludes either directed influence between them on this geometry. Under $\operatorname{do}(Z=z)$ the common-cause source law remains $\bar\rho$, proving the final assertion. ∎

<a id="theorem-42b3-standard-borel-setting-source-and-separation-realization"></a>**Theorem 42b.3 (Standard-Borel Setting, Source and Separation Realization).** Let $L$ be any nonempty standard-Borel hidden-variable space, let $\rho_z$ be any four probability measures on $L$, and retain the normalized measurable local-response kernels $A_x(a\mid\lambda)$ and $B_y(b\mid\lambda)$ of Theorem 42b.1, including stochastic responses. Put
$$
\mu=\bar\rho=\tfrac14\sum_z\rho_z,\qquad
q(\{z\},d\lambda)=\tfrac14\rho_z(d\lambda).
\tag{63j.3}
$$
Every $\rho_z\ll\mu$. Choose measurable Radon--Nikodym derivatives and, on a common conull set, set
$$
K_z(\lambda)=\tfrac14\frac{d\rho_z}{d\mu}(\lambda).
\qquad
\mu(d\lambda)K_z(\lambda)=\tfrac14\rho_z(d\lambda).
\tag{63j.4}
$$
Complete $K$ by the uniform distribution on the exceptional null set, or retain any supplied normalized measurable version satisfying (63j.4). When supplied bounds $\ell,u$ are retained, choose the completion within those bounds. The following conclusions hold.

1. **Exact measurable realization.** The setting-to-source, source-to-setting and common-cause constructions of Theorem 42b.2 extend to $L$ and preserve exactly the original measure $q$ and the original local kernels, hence the complete retained law
   $$
   J(\{z\},d\lambda,a,b)=\tfrac14\rho_z(d\lambda)A_x(a\mid\lambda)B_y(b\mid\lambda).
   \tag{63j.5}
   $$
   No finite strategy quotient or enlargement of the registered $\Lambda$ is used. The carrier consists of standard-Borel registers, measurable gates and samplers, diagonal copy maps, coordinate projections and identity register transport along the declared timelike wires.
2. **Interventions.** Use the ideal node-replacement semantics of Theorem 42b.2. A source replacement in the source-to-setting model occurs before the descendant joint-setting sampler. A setting replacement acts at the setting nodes specified below. For a fresh source draw with law $\eta$, or a fresh setting-pair draw with law $\pi$, both independent of all surviving exogenous randomness, the retained setting/source laws are
   $$
   \begin{array}{c|cc}
   &P^{\operatorname{do}(Z\sim\pi)}(\{z\},d\lambda)
   &P^{\operatorname{do}(\Lambda\sim\eta)}(\{z\},d\lambda)\\ \hline
   Z\to\Lambda&\pi(z)\rho_z(d\lambda)&\tfrac14\eta(d\lambda)\\
   \Lambda\to Z&\pi(z)\mu(d\lambda)&K_z(\lambda)\eta(d\lambda)\\
   C\to(Z,\Lambda)&\pi(z)\mu(d\lambda)&\tfrac14\eta(d\lambda).
   \end{array}
   \tag{63j.6}
   $$
   Multiplying by the unchanged factors $A_x(a\mid\lambda)B_y(b\mid\lambda)$ gives the full intervened law. The point-intervention table (63j.2) follows by taking Dirac replacement laws. It is exact for the chosen version, including null source values. Under every $\eta\ll\mu$, the laws in (63j.6) are independent of the conditional-version choice.
3. **Intrinsic separation.** For the profiles comprising all setting replacements and all source replacements $\eta\ll\mu$, the three constructed models are pairwise distinct whenever some $\rho_z\ne\mu$. These profiles coincide exactly at measurement independence. Coincidence for all point interventions at null values requires a pointwise version convention.
4. **Formal spacetime realization.** All three models use the event assignments of Theorem 42b.2 and measurable identity transport on the affine future-timelike paths between each declared sender and receiver. This preserves its spacelike outcome and late common-cause separation claims. Its carriers are standard-Borel registers with measurable gates. Finite-alphabet storage, bandwidth, effective sampling and physical resource bounds require separate implementation data.

The intervention locations are part of the theorem. In the setting-to-source model, $Z$ consists of the two root selections at $(0,-1),(0,1)$, before the source at $(3,0)$. In the source-to-setting model, $Z$ consists of the copied displays at $(3,-1),(3,1)$, after the source at $(0,0)$. In the common-cause model, the copied displays at $(1,-2),(1,2)$ are spacelike from the source at $(0,0)$; the common cause is at $(-4,0)$. The second and third observational setting mechanisms therefore distribute earlier data. A source intervention targets the source assignment at its listed event, not the source-label coordinate inside the earlier common cause. A late overwrite of an additional device copy in the first model is a different intervention from replacing its root settings: it leaves the already generated source marginal $\mu$ unchanged. Deterministic pair replacement is two prearranged local constants; uniform replacement can use independent local seeds. A general correlated replacement law $\pi$ requires a fresh coordinated seed distributed from the settings' common past.

*Proof.* Standard-Borel measures admit measurable uniform-seed samplers: code the space as a Borel subset of $[0,1]$, apply the inverse cumulative distribution to the pushed-forward law, replace exceptional values outside the subset by a fixed element, and pull back. Since $z$ has four values, the four samplers for $\rho_z$ give a jointly measurable setting-indexed sampler. A finite-output kernel $K$ is sampled measurably by its cumulative thresholds, at every $\lambda$. Independent uniform seeds and the gates $a=\mathbf1\{U_A<A_x(1\mid\lambda)\}$ and $b=\mathbf1\{U_B<B_y(1\mid\lambda)\}$ implement the unchanged local kernels. The local seeds are implementation data; the registered hidden variable retains its original coordinates.

For $Z\to\Lambda$, draw independent fair settings at the two root events and use the corresponding $\rho_z$ sampler at the source. For $\Lambda\to Z$, sample $\Lambda\sim\mu$, draw the entire pair jointly by $K$ at its descendant source sampler, and send the separate components to their displays. Conditional independence of the two setting components is not assumed. For the common-cause model, sample $C=(Z_0,\Lambda_0)\sim q$ and distribute its coordinates by the declared projections. The respective setting/source laws are $\tfrac14\rho_z$, $\mu K_z$ and the coordinate law of $q$, equal as measures by (63j.4). Adding the independent local response gates proves (63j.5).

With $\mu$ as dominating measure, the preserved dependence functionals are
$$
\begin{aligned}
M_{\rm pair}&=2\max_{z,z'}\int|K_z-K_{z'}|\,d\mu,
&D_{\rm TV}&=\tfrac12\int\sum_z|K_z-\tfrac14|\,d\mu,\\
I&=\int\sum_zK_z\ln(4K_z)\,d\mu,
&P_{\rm guess}&=\int\max_zK_z\,d\mu,
\qquad m=\int\min_zK_z\,d\mu.
\end{aligned}
$$
The essential bounds and any supplied bounds on the retained chosen version are preserved as well. This establishes exact preservation of the entire dependence census and the outcome table without dropping latent-law data.

Deleting the intervened incoming assignment and retaining all other gates gives (63j.6) directly. Two versions of $K$ coincide simultaneously in all four coordinates outside one $\mu$-null set; every $\eta\ll\mu$ also gives that set measure zero. If $\rho_j\ne\mu$, then $\operatorname{do}(Z=j)$ separates the setting-to-source model from the other two. The function $h=K_j-1/4$ has zero mean and is nonzero modulo $\mu$, so $E=\{h>0\}$ has positive measure. The source replacement $\eta=\mu(\cdot\cap E)/\mu(E)$ gives $P(Z=j)>1/4$ in the source-to-setting model, while the other two remain uniform. This separates the latter two models without any positive-mass singleton assumption. At measurement independence, $K_z=1/4$ almost everywhere and (63j.6) coincides for all three models whenever $\eta\ll\mu$.

The copy and transport maps are measurable. Every wire uses the same endpoint displacement checked in Theorem 42b.2: source/outcome displacements are $(3,1)$, $(6,1)$ and $(5/2,2)$ respectively; local-setting/outcome displacements are $(6,0)$, $(3,0)$ and $(3/2,0)$. The directed source/setting edges have $(3,1)$ on their respective geometries. Common-cause/source and common-cause/setting displacements are $(4,0)$ and $(5,2)$. These are all future timelike. Outcomes are simultaneous and distinct. On the common-cause geometry, source/setting and setting/remote-outcome relations have $(1,2)$ and $(3/2,4)$, hence are spacelike. Future-causal transitivity excludes either forward-local source/setting direction on that late-separation geometry, even with intermediate relays. The geometries are different; no backwards-time source influence or branch-(iii) late marginal channel is thereby realized. ∎

**Null-point and finite-record boundaries.** Let $L=[0,1]$ with every $\rho_z$ Lebesgue and constant local outcomes. The everywhere-uniform $K$ and the version equal to it except for $K(\cdot\mid0)=\delta_{(0,0)}$ have the identical retained observational law and essential bounds. Their source-to-setting models give different setting laws under $\operatorname{do}(\Lambda=0)$. Their tight pointwise extrema differ as well. This proves that neither null-point interventions nor unspecified pointwise extrema are identified by the joint law. Conversely, a finite or countably coded classical register with a deterministic decoder has a countably supported decoded law; it cannot exactly encode a nonatomic source. Response-strategy quotienting can also change registered dependence: with constant outcomes and $\Lambda=(Z,R)$ for independent uniform $R\in[0,1]$, that quotient keeps all outcomes but changes $I(Z;\Lambda)=\ln4$ to zero.

<a id="theorem-42a-relational-decoding-principle-no-actionable-capacity-without-shared-decoding"></a>**Theorem 42a (Relational Decoding Principle: No Actionable Capacity Without Shared Decoding).** Consider bipartite $AB$ in state $\rho_{AB}$. For each message $x$, let Alice apply a local CPTP channel $\Phi_x$ on $A$, equivalently the nonselective trace-preserving sum of a local instrument with its outcome discarded. Bob's detector is keyed by a classical variable $K$ sampled independently of both the message $x$ and the prepared quantum system, so the joint preparation is $\rho_{AB}\otimes\sum_K\pi(K)|K\rangle\langle K|$. For each $K$, let $\Lambda_K^*$ be a unital CP Heisenberg map and let $E_i^{(K)}=\Lambda_K^*(E_i)$. Assume
$$
\overline{\Lambda^*}:=\sum_K\pi(K)\Lambda_K^*
$$
is independent of $x$. Then Bob's observed distribution is independent of $x$ and the channel $X\!\to\!Y$ has zero capacity:
$$
p_B(i\mid x)=\sum_K\pi(K)\operatorname{tr}\big[\rho_B E_i^{(K)}\big]
=\operatorname{tr}\big[\rho_B\overline{\Lambda^*}(E_i)\big],
\qquad I(X;Y)=0.
$$

*Proof.* Write $\Phi_x(Z)=\sum_rA_{x,r}ZA_{x,r}^\dagger$ with $\sum_rA_{x,r}^\dagger A_{x,r}=I_A$. For every Bob effect $F$,
$$
\operatorname{tr}\!\left[(\Phi_x\otimes\operatorname{id})(\rho_{AB})(I_A\otimes F)\right]
=
\sum_r\operatorname{tr}\!\left[\rho_{AB}(A_{x,r}^\dagger A_{x,r}\otimes F)\right]
=
\operatorname{tr}\!\left[\rho_{AB}(I_A\otimes F)\right].
$$
Thus $\rho_B^{(x)}=\rho_B$. Averaging the keyed effects gives the displayed distribution, which contains no $x$. Hence $X$ and $Y$ are independent for every prior and $I(X;Y)=0$. ∎

*Foundational reading.* Theorem 42a articulates a principle of *relational decoding* that is built into the framework's relational information ontology (Definition 1, Appendix N): the operational physics of a CC-induced effect resides not in any observer's standalone measurement stream but in the *jointly decoded* statistics that become accessible only after Alice's record, Bob's record, and any classical labels (context tags, basis assignments, timing certificates) have been brought together for joint analysis. Under the hypotheses of Theorem 42a,
$$
I(C;Y_B)=0,\qquad I(C;Y_B,K)=0,
$$
where $Y_B$ is Bob's record, $C$ is Alice's context label, and $K$ is the keying variable. Joint analysis with Alice's record $Y_A$ may still reveal context dependence:
$$
I(C;Y_A,Y_B,K)\;\text{may be}\;>0.
$$
Revealing the key $K$ alone does not unlock $C$ from Bob's stream: for each $K$, the conditional law $p_B(i\mid x,K)=\operatorname{tr}[\rho_B\Lambda_K^*(E_i)]$ is independent of $x$, and the key distribution is also independent of $x$. On branch (i) of Postulate 3, Bob's marginal is invariant by Lemma 10.2. On branch (ii), any context dependence of Bob's marginal is a shared-past preparation effect and is excluded as an explanation of late-randomized branch-(iii) data by the branch definition and the certified causal timing of the randomization. Theorem L.12.8 separately constrains strict target-conditioned joint-correlation advantage above information-free policies. On branch (iii), Bob's marginal itself shifts under late randomization, but the shift is statistical with rate bounded by Theorem 41; on the regular finite-window branch (Definition 10.2a) it retains zero-error capacity zero by Theorem 39a in any pre-lightcone window of operational size. The QCP of Section 10.3.2 fixes a single shared decoding rule — the pre-agreed binary mapping between context and target measurement bias — and converts the relational structure into a one-shot decision advantage $\delta=O(\mathrm{CC})$ that cannot be amplified into deterministic or zero-error signaling under the regular-branch hypothesis.

**10.6 Gravitational Self-Limitation of CC**

The Consciousness Complexity (CC) extension admits a conditional gravitational-feedback branch. On that branch, the physical context contributes to the stress-energy source through the retained-energy relation of Appendix S. The model additionally assumes a constitutive power law that grows as CC approaches its branch ceiling, a weak-field geometry converting retained source energy into differential proper time, and a calibrated unresolved-phase or stochastic response converting that proper-time spread into attenuation.

If the same branch also supplies the Appendix S PCE objective and its coercivity or boundary-growth conditions, optimization can yield a finite interior operating point balancing predictive utility, direct resource cost, and gravitational attenuation. Theorem 39's endpoint-completeness bound remains a separate constraint.

## 10.7 Finite Global Context-Channel Witness

<a id="theorem-107a-normalized-positive-branch-iii-replacement-family"></a>**Theorem 10.7a (Normalized Positive Branch-(iii) Replacement Family).** Let $\tau_A$ be a density operator on $A$, let $\sigma_B^{(0)},\sigma_B^{(1)}$ be density operators on $B$, and let $0<\epsilon<1$. Define
$$
\Phi_x(X)
=(1-\epsilon)X
+\epsilon\operatorname{tr}(X)\,\tau_A\otimes\sigma_B^{(x)},
\qquad x\in\{0,1\}.
\tag{10.7a.1}
$$
Each $\Phi_x$ is CPTP as a global map, and for every input $\rho_{AB}$,
$$
\rho_B^{(x)}
=(1-\epsilon)\rho_B+\epsilon\sigma_B^{(x)},
\qquad
\delta_B
=\frac{\epsilon}{2}
\left\|\sigma_B^{(1)}-\sigma_B^{(0)}\right\|_1.
\tag{10.7a.2}
$$
Orthogonal pure target states give $\delta_B=\epsilon>0$. If $\rho_B$ is full rank, both output states have common support for every $0<\epsilon<1$.

*Proof.* Equation (10.7a.1) is a convex combination of the identity channel and a trace-and-prepare channel, so it is CPTP. Partial trace gives (10.7a.2), and homogeneity of the trace norm gives the formula for $\delta_B$. Orthogonal pure states have trace distance one. The positive $(1-\epsilon)\rho_B$ summand makes both outputs full rank when $\rho_B$ is full rank. ∎

The family is an explicit finite normalized positive witness for the global-map component nominated by Postulate 3(iii). Each map acts globally because its target state on $B$ depends directly on $x$. Assigning $x$ by a freely selected spacelike-late apparatus would supply a physical realization of this nonlocal law; entanglement and local CPTP dynamics supply no such assignment. Admission to the Postulate-3 physical branch additionally requires its endpoint-bias, finite-resource, chronology, and no-loop gates, while Definition 10.2a's finite-transcript common-support condition requires a repeated-law certificate beyond the one-shot state-support statement above; Proposition 10.7b supplies it for full-rank $\rho_B$.

<a id="proposition-107b-finite-transcript-common-support-for-the-replacement-family"></a>**Proposition 10.7b (Finite-Transcript Common Support for the Replacement Family).** Keep the family (10.7a.1) with $0<\epsilon<1$ and a full-rank reduced input $\rho_B$. Run $n$ trials, each on a fresh copy of the registered input $\rho_{AB}$, with any sequence of Alice contexts $x_1,\ldots,x_n$ and with Bob choosing the POVM $\{F^{(i)}_b\}_b$ of trial $i$ as a function of his earlier outcomes, every retained effect being nonzero. Then
$$
P_{x_i}\bigl(b\mid F^{(i)}\bigr)
=\operatorname{tr}\!\Bigl[F^{(i)}_b\bigl((1-\epsilon)\rho_B+\epsilon\sigma_B^{(x_i)}\bigr)\Bigr]
\ge(1-\epsilon)\lambda_{\min}(\rho_B)\operatorname{tr}F^{(i)}_b>0,
\tag{10.7b.1}
$$
so every Bob transcript has strictly positive probability under every context sequence. Definition 10.2a therefore holds for every $n$, in particular for $n\le n_{\max}$, and Theorems 39a, 40 and 41 apply to the family. For every POVM the per-trial Bob laws of the two contexts have total-variation distance at most $\delta_B$, with equality for the Helstrom measurement $\{\Pi_+,I-\Pi_+\}$, where $\Pi_+$ projects onto the positive part of $\sigma_B^{(1)}-\sigma_B^{(0)}$. For a qubit $B$ with $\rho_B=I/2$, $\sigma_B^{(x)}=|x\rangle\!\langle x|$ and the computational-basis measurement, the per-trial laws are the symmetric Bernoulli design of Lemma 10.1 with $\delta=\epsilon/2$; for equal priors
$$
I(C;Y)=\ln2-H\!\left(\frac{1+\epsilon}{2},\frac{1-\epsilon}{2}\right)>0
\tag{10.7b.2}
$$
nats per trial, and block-constant contexts give $\Omega_n=\sum_{j=0}^n\binom nj\min\{p^jq^{n-j},p^{n-j}q^j\}>0$ with $p=(1+\epsilon)/2$ and $q=(1-\epsilon)/2$.

*Proof.* Theorem 10.7a gives the post-map Bob state $(1-\epsilon)\rho_B+\epsilon\sigma_B^{(x)}\succeq(1-\epsilon)\lambda_{\min}(\rho_B)I$, which gives (10.7b.1) for every nonzero effect. Fresh copies make the transcript probability the product of the per-trial conditional probabilities along Bob's adaptive branch, each positive under every context, so the supports of all context-conditioned transcript laws coincide with the set of transcripts. For a coarse-grained effect $F$, $|P_1(F)-P_0(F)|=\epsilon\bigl|\operatorname{tr}[F(\sigma_B^{(1)}-\sigma_B^{(0)})]\bigr|\le\delta_B$ by Lemma 9.1, with equality at $F=\Pi_+$. In the qubit case the laws are $(p,q)$ and $(q,p)$, their equal mixture is uniform, and the Jensen--Shannon divergence equals (10.7b.2), which is positive because $p\ne q$. Grouping the $\binom nj$ transcripts with $j$ zeros gives $\Omega_n$. ∎

<a id="definition-107c-finite-external-source-with-terminal-output-transfer"></a>**Definition 10.7c (Finite External Source with Terminal Output Transfer).** Fix $L,c,\hbar>0$, the reference metric $\operatorname{diag}(-1,1,1,1)$ in coordinates $(ct,x)$, and its preferred time $t$. Alice's stationary ports have center $x=0$, Bob's center $x=L$, and every spatial support has radius $r\le L/1000$. The source belongs to Postulate 3(iii): its primitive interaction is explicitly bilocal relative to this fixed reference light cone.

One trial owns seven qubits $R,C,R_{\mathrm{archive}},B,O,E,F$, finite preparation/control services, a clock and retained records. A Hadamard on Alice's initially independent zero register $R$, followed by the registered computational single-outcome instrument and record copy, produces and logs the fair late context event $x\in\{0,1\}$. A local controlled-NOT writes $R$ into the initially zero coupling register $C$. The only intended cross-laboratory interaction is the fixed, prearmed Hamiltonian
$$
H_{\mathrm{edge}}=\hbar gP_1^C\otimes Y_B,\qquad
T=\frac{L}{16c},\quad \tau=\frac{T}{10000},\quad
gT=\theta=\arctan\frac{12}{35},
\quad \sin\theta=\frac{12}{37},\quad\cos\theta=\frac{35}{37}.
\tag{10.7c.1}
$$
It remains present after emission, acts only on the internal $C,B$ core, and has norm $\hbar g$. The edge does not read a future setting. Until the late write, $C=0$ makes its action trivial.

In the shared past prepare
$$
|\psi_{BE}\rangle=\frac{\sqrt3}{2}|00\rangle+\frac12|11\rangle,
\qquad
|\psi_{OF}\rangle=\frac{|00\rangle+|11\rangle}{\sqrt2}.
\tag{10.7c.2}
$$
The rotations $e^{-i(\pi/6)Y_B}$ and $e^{-i(\pi/4)Y_O}$, each followed by its controlled-NOT into $E$ or $F$, prepare the pairs from ready zeros. Thus the registered reduced input is $\rho_B=\operatorname{diag}(3/4,1/4)$ and $\rho_O=I/2$, while the full purification is retained. Transport $E,F$ at speed $c/2$ to a supplier vault centered at $x=2L$, completing delivery by $t\le-8L/c$ after preparation by $t\le-10L/c$. There is no intended nonlocal edge from that vault to Bob.

The source interface exposes exactly the complete emitted qubit algebra $\mathcal B(\mathcal H_O)$ from each trial. Internal $C,B$, preparation records and the vault belong to the paid source complement and are not receiver-accessible. There are no receiver interventions into the active source. During a duration $\tau$ use the controlled-NOT generator for the write, evolve for $T$, and then transfer $B$ to $O$ during a duration $\tau$ with
$$
H_{\mathrm{write}}=\frac{\pi\hbar}{2\tau}P_1^R\otimes(I-X_C),
\qquad
H_{\mathrm{swap}}=\frac{\pi\hbar}{2\tau}(I-\mathrm{SW}_{BO}).
\tag{10.7c.3}
$$
The actual prearmed edge remains on during both boundaries. At the end of the terminal gate, all $O$–complement interactions end by the supplied output-port isolation contract. No nonlocal switch-off of the internal edge is assumed.

Supply four disjoint source copies and a finite preferred-time schedule. An optional separate context-randomization duration is at most $\tau$, so every trial fits in $D=T+3\tau$. Reserve $t_{\mathrm{read}}=L/(8c)$ for a common context-independent final instrument on all emitted outputs. Admit at most 256 final outcomes, at most eight ready read-ancilla qubits and the corresponding retained record. An adaptive readout is included when its complete induced POVM has this budget. Four is the source-copy cap; a separate throughput bound permits at most $\min\{4,\lfloor r_{\max}L/c\rfloor\}$ trials and is not identified with equality at four.

The error class contains every self-adjoint trial-local parasitic term $K_x(t)$ with integrated norm divided by $\hbar$ at most $1/4000$, and a separate edge-calibration perturbation with the same bound. They act during write/interaction/emission, do not couple different trials, and cease to couple an emitted $O$ to its source. A context-independent final-read dilation may have additional integrated generator error at most $1/20000$. These are forward-specified source-class bounds and isolation premises. The source preparations (10.7c.2) are exact in this contract.

All source copies, purifiers, local instruments, couriers, controller/clock services, positive-duration gates, held records and readout ancillas have declared finite positive service tariffs and owned supplies. The complete account includes the seven qubits per trial, two purifier couriers per trial, all preparation/write/transfer gates, the autonomous intervals, held source complement and the final instrument/record. It consumes fresh preparations and does not erase or cyclically renew unknown states. Scalar local energy baselines may be chosen at least $\hbar g$; finite gate norms, durations, action and boundary-work bounds are separately recorded. The operational schedule allows no return to an earlier preferred time.

<a id="theorem-107d-complete-formal-source-to-output-certificate-on-the-external-branch"></a>**Theorem 10.7d (Complete Formal Source-to-Output Certificate on the External Branch).** The source of Definition 10.7c has a derived CPTP response channel on its complete input/output algebra, a late-context assignment, a strictly spacelike observation schedule, a locked nonzero response interval and a separated causal-artifact class. Its conclusions hold uniformly over the stated bounded perturbations.

For clarity, take the complete variable input carrier to be $BEFO$. Let $\Omega_x$ contain the prepared/logged context, zero $C$ and other fixed source auxiliaries; let $W_x,V_x,S_x$ be the actual write, interaction and terminal unitaries, including the always-on edge and admitted errors. The emitted channel is
$$
\mathcal E_x(Z)=\operatorname{tr}_{\mathrm{source}\setminus O}
\!\left[S_xV_xW_x(\Omega_x\otimes Z)W_x^\dagger V_x^\dagger S_x^\dagger\right].
\tag{10.7d.1}
$$
It includes the registered, internally purified input (10.7c.2). A separate reference may be tensored with the entire channel. The ideal boundary comparator, retaining the interaction for time $T$, is
$$
\mathcal E_x^{\mathrm{id}}(Z)
=J\,U_x(\operatorname{tr}_{EFO}Z)U_x^\dagger J^\dagger,
\qquad U_0=I,\quad U_1=e^{-i\theta Y},\quad J:\mathcal H_B\longrightarrow\mathcal H_O.
\tag{10.7d.2}
$$
Thus an arbitrary input need not be assigned a state-dependent purification to define the all-input channel.

On the registered source state the ideal computational event probabilities, trace-distance separation and all-input disturbance are, respectively,
$$
p_0=\frac14,\qquad
p_1=\frac34\sin^2\theta+\frac14\cos^2\theta,\qquad
d_Z=p_1-p_0=\frac{72}{1369},\qquad
\delta_O=\frac6{37},\qquad
\frac12\|\mathcal E_1^{\mathrm{id}}-\mathcal E_0^{\mathrm{id}}\|_\diamond
=\frac{12}{37}.
\tag{10.7d.3}
$$
With
$$
\eta=\frac1{10000}+\frac1{4000}+\frac1{4000}=\frac3{5000},
\qquad e=\frac7{10000}>\eta+\frac1{20000},
\tag{10.7d.4}
$$
the actual pre-read channel differs from its comparator by half-diamond norm less than $\eta$. Every final registered event differs by at most $e$, and
$$
\left[\frac{72}{1369}-2e,\frac{72}{1369}+2e\right]
\subset\left(\frac1{20},\frac{11}{200}\right),\qquad
\frac12\|\mathcal E_1-\mathcal E_0\|_\diamond
<\frac{12}{37}+2\eta=\frac{30111}{92500}<\frac12 .
\tag{10.7d.5}
$$
The same source without $H_{\mathrm{edge}}$ has ideal contrast zero and actual contrast in $[-2e,2e]$, disjoint from the locked interval.

*Proof.* Preparation, finite unitary evolution and partial trace make (10.7d.1) CPTP. This expression is the physical circuit, not a prescribed detector probability. The identities $P_1^2=P_1$ and $Y^2=I$ give the controlled rotation. The boundary generators exponentiate exactly to controlled-NOT and SWAP because their nontrivial involutions have eigenvalues $\pm1$. In the ideal comparator the write makes $C=x$, and the terminal SWAP identifies the original $B$ marginal with $O$, proving (10.7d.2) on every matrix unit and hence every input, including entangled $BEFO$ inputs.

The two rotations/CNOTs prepare (10.7c.2). Partial trace gives the registered target eigenvalues $3/4,1/4$. Direct conjugation by $U_1$ yields the event contrast in (10.7d.3). The difference of the two Bloch vectors has length $\sin\theta$, so their half trace distance is $\sin\theta/2=6/37$. For an arbitrary qubit input, rotation about $Y$ gives half trace distance at most $\sin\theta$, attained on a pure transverse state. The same bound holds with any reference: the overlap of a pure input and its unitary image is $\operatorname{tr}(\rho U_1)=\cos\theta-i\sin\theta\,\operatorname{tr}(\rho Y)$, whose modulus is at least $\cos\theta$. Pure-state trace distance and convexity give the upper bound, and a product pure transverse input attains it. Pretracing unused input factors and the terminal basis identification preserve this value. This proves the distinct separation/norm statements.

For time-dependent self-adjoint generators, Duhamel's identity bounds a difference of unitaries by the integrated operator norm of their difference divided by $\hbar$. Omitting the intended edge during write and terminal transfer costs at most $2g\tau=2\theta/10000<1/10000$, since $0<\theta<12/35<1/2$. The separate randomization acts while $C=0$. Add the two admitted $1/4000$ perturbation budgets to obtain the strict $\eta$ bound. This remains valid after adjoining any reference. A unitary norm error $\eta$ gives trace-norm state error at most $2\eta$, half-diamond channel error at most $\eta$ and event error at most $\eta$; tracing the source complement cannot increase them. The final-read error adds at most $1/20000$. The two-context triangle inequality gives the disturbance bound, and exact rational subtraction gives (10.7d.5).

The edge-free comparator has the same preparations, timing and readout, but the local late write has no channel to the target. Its ideal output is independent of $x$. The same two event-error bounds therefore confine its contrast to $[-2e,2e]$. No member of that declared artifact class reaches the locked interval.

The context is generated after the shared-past preparation and purifier transport, and it is the local instrument event actually written into the coupling register. The prearmed edge depends on that register rather than a future label. In the common reference clock, the entire four-trial/readout horizon is
$$
\frac{c}{L}(4D+t_{\mathrm{read}})=\frac{15003}{40000},\qquad
\frac{c}{L}(4D+t_{\mathrm{read}})+\frac1{100}
=\frac{15403}{40000}<1-\frac2{1000}.
\tag{10.7d.6}
$$
Thus even the final record is outside the ordinary-light future of the earliest context, with the stated tube and jitter allowances. The vault at $2L$ is causally inaccessible from Bob during this observation window. The internal bilocal edge genuinely exceeds the fixed reference light cone; its presence does not redefine that cone.

The seven source qubits per trial, finite controller and read ancillas give a finite carrier. The write and transfer generators have norms $\pi\hbar/\tau$, and every preparation/read gate has a finite norm and positive duration. Their integrated actions and switch/state-energy work bounds are finite. Between boundary operations, scalar baselines $E_0I$ with $E_0\ge\hbar g$ make the two half-edge energies $E_0I+H_{\mathrm{edge}}/2$ positive and commuting with the autonomous total Hamiltonian. Their zero energy current does not remove the separately paid preparation, courier, drive, clock and readout services. The proof assumes those prescribed suppliers and makes no autonomous-controller or cyclic-reset construction. ∎

<a id="corollary-107d1-whole-output-support-finite-readout-and-preferred-time-chronology"></a>**Corollary 10.7d.1 (Whole-Output Support, Finite Readout and Preferred-Time Chronology).** On the same source, every fixed intervened context word and every admitted final joint instrument on $n\le4$ emitted outputs has common support. In particular,
$$
\rho_O^{(x)}\succeq
\left(\frac14-2\eta\right)I=\frac{311}{1250}I
\succeq\lambda I,\qquad \lambda=\frac6{25},
\qquad
\rho_{O^n}^{(\mathbf x)}\succeq\lambda^n I,
\tag{10.7d.7}
$$
and for every induced output POVM $\{M_y\}$,
$$
P(y\mid\mathbf x)\ge\lambda^n\operatorname{tr}M_y,\qquad
\Omega_n\ge(2\lambda)^n=\left(\frac{12}{25}\right)^n>0.
\tag{10.7d.8}
$$
Every nonzero induced output effect therefore has positive probability under every context word. Equal-prior binary decoding error is at least $\Omega_n/2$. This source has a positive-information marginal channel and nonzero finite decoding error; common support does not restore exact no-signaling.

*Proof.* The ideal emitted state is a unitary image of $\rho_B$ and has minimum eigenvalue $1/4$. The uniform trace-norm perturbation bound implies (10.7d.7). After emission, every subsequent intended or admitted source operation acts only on the complement. Partial-trace invariance under complement-only trace-preserving maps fixes the entire $O$ marginal, including when the imperfect transfer left residual entanglement. It also fixes every future output instrument. This is the reason for terminal transfer rather than leaving the accessible target coupled to the source.

Fresh independent source copies and trial-local errors make the conditional joint output a product for a fixed context word. Tensoring the floors gives the joint inequality. Any fixed context-independent ancilla and adaptive read sequence induces one common POVM on $O^n$. Some nonzero effects on an enlarged ancilla carrier can induce the zero output effect; those events are impossible under every context and cause no support mismatch. Every nonzero induced effect satisfies (10.7d.8). Summing its bound on the minimum of two context-conditioned laws and using $\sum_yM_y=I$ gives the overlap.

For at most 256 effects, the isometry $|\psi\rangle\mapsto\sum_y\sqrt{M_y}|\psi\rangle\otimes|y\rangle$ extends to a unitary on dimension at most $2^4\cdot256=4096$. A Hermitian logarithm of norm at most $\pi$ implements it over the paid time $t_{\mathrm{read}}$, with at most eight ready ancilla qubits and its retained outcome record. The source no longer acts on this output/read apparatus, so the actual final measurement remains common to all contexts. Equation (10.7d.6) includes its entire time.

The source supplies a finite schedule in increasing preferred time, with no operation returning to a past time and no guaranteed prediction of a future independently chosen receiver policy. It therefore supplies no return-to-past or diagonal-policy operation. This is the stipulated chronology class of this external source, rather than the local Lorentz/AQFT containment branch. Theorem 14.1 retains its own stronger intervention-stable prediction predicate. ∎
