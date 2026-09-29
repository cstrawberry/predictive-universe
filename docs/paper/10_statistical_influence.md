# 10. Causality, Locality, and Statistical Influence

**Baseline and test hypothesis in plain terms.** PU takes exact quantum no-signaling and relativistic causality as the baseline supplied by current physics: ordinary entanglement does not let Alice send Bob a message faster than light. PU also states a statistical-FTL hypothesis to be tested. Under that hypothesis, Alice's independently chosen late context changes Bob's local outcome distribution before light can arrive, so repeated trials define a noisy but genuine faster-than-light communication channel. A certified and replicated result would support PU's QCP/statistical-FTL hypothesis and show that the current local-CPTP/Lorentz-AQFT causal description is incomplete.

**Technical ledger.**

The Consciousness Complexity hypothesis of Section 9 nominates a response-active modification of quantum probabilities. This section defines PU's operational causality condition, derives a strict endpoint-forcing bound, specifies the evidence for the statistical-FTL channel, and analyzes its finite-window zero-error capacity, sample complexity, information rate, and relation to the local-net and relativistic-QFT structures of Appendix F.

**10.1 Framework's Definition of Causality**

The PU framework adopts a specific operational definition of causality, focused on preventing paradoxes constructible via controllable signaling.

**10.1.1 Postulate 2 (Post 2): Operational Causality as Exact Pre-Lightcone No-Signaling**



For every independently selectable finite context $C$ in region $A$ and every full finite-alphabet transcript $Y$ available in a spacelike-separated region $B$ before a light signal from the choice can arrive, Postulate 2 requires
$$
P(Y=y\mid C=c)=P(Y=y)
\qquad
\text{for all admissible }c,y.
$$
Equivalently, the induced context channel has zero Shannon capacity, as proved in Theorem 39c. Deterministic and zero-error FTL signaling are forbidden consequences of this condition, but their absence is not sufficient: any noisy positive-capacity pre-lightcone channel also violates Postulate 2. A shared-past preparation label that is not independently selectable at the spacelike choice event does not define an $A\to B$ channel.



**10.2 Derivation of the Consciousness Complexity Causality Constraint**

The endpoint bound below excludes endpoint-complete deterministic forcing.

**10.2.1 Theorem 39 (Endpoint Gate for the Bounded-Bias CC Branch)**

Let $\alpha_{CC,max}:=\sup_S\mathrm{CC}(S)$ on the CC branch under consideration. If
$$
\alpha_{CC,max}<0.5,
\tag{61}
$$
then no binary coarse-grained outcome can be forced to both deterministic endpoints by context choice. Conversely, any endpoint-complete branch that can force both endpoints of some binary coarse-graining must have $\alpha_{CC,max}\ge0.5$. Thus the bounded-bias branch used in Sections 10, 13, and Appendix S is Postulate-2-admissible at the deterministic endpoint level by imposing (61). A branch with $\alpha_{CC,max}\ge0.5$ is admissible only if it carries a separate finite-response certificate excluding endpoint-complete context pairs.

*Proof.* Deterministic FTL signaling with a fixed local measurement at $S_B$ would require $S_A$ to encode at least two distinguishable messages by choosing between two contexts that yield two deterministic and distinct outcome distributions at $S_B$. For any POVM, coarse-grain to a binary partition $\{E,\ I-E\}$ and let the baseline Born probability be
$$
p=P_{Born}(E)\in[0,1].
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
Taking the strict bounded-bias condition $\alpha_{CC,max}<\frac12$ excludes all such endpoint-complete binary alphabets and therefore excludes one-shot deterministic selection between both endpoints. It does not exclude forcing one endpoint when the baseline is sufficiently biased. The strict inequality is used because $p=\frac12$ is an admissible balanced binary coarse-graining; equality would not leave a finite margin against endpoint completion. ∎

Theorem 39 is an endpoint gate. The additional step needed for branch (iii) is supplied by Theorem 39a: on the regular finite-window statistical branch, Bob's transcript distributions retain overlapping support under the two Alice contexts, so the zero-error FTL capacity is zero even when the ordinary finite-error information rate of Theorem 41 is positive.

**10.3 The Statistical FTL Influence Hypothesis**

Theorem 39 excludes one-shot endpoint-complete forcing, and Theorem 39a excludes finite-window zero-error signaling on its common-support branch; both are compatible with a noisy positive-capacity pre-lightcone marginal shift, which Theorem 39c classifies as a violation of Postulate 2. Hypothesis 3 therefore motivates the following classification of possible context-dependent spacelike statistics, which Postulate 3 posits.

**10.3.1 Postulate 3 (Post 3): Statistical Influence (Three-Branch Causal Classification)**

As a branch contract motivated by Hypothesis 3 and the availability of entangled states on Proposition 10's quantum branch, PU distinguishes three operationally distinct classes of statistical influence according to the causal-temporal placement of Alice's context choice. Postulate 3 posits this three-branch classification; each class carries the status supplied by its realization, no-loop, no-zero-error, protocol, and empirical certificates.

Beyond the local CPTP and shared-past preparation branches, PU admits as a falsifiable dynamical hypothesis a family of global context-indexed state maps $\{\Phi_x\}_{x\in\{0,1\}}$ on a distributed system $AB$. For at least one registered input $\rho_{AB}$ and a late selected Alice context $x$, define
$$
\rho_B^{(x)}:=\operatorname{Tr}_A\Phi_x(\rho_{AB}).
$$
The nonlocal branch asserts
$$
\delta_B
:=
\frac12\left\|\rho_B^{(1)}-\rho_B^{(0)}\right\|_1
>0
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
for the registered repeated preparation. Every local CPTP implementation instead satisfies $\rho_B^{(0)}=\rho_B^{(1)}$ and $\delta_B=0$. Once a forward-locked realization, timing, artifact, likelihood, and sensitivity record is accepted, a replicated $\delta_B>0$ would establish a noisy statistical-FTL channel and support PU's QCP/statistical-FTL hypothesis. The same result would simultaneously falsify the exact no-signaling baseline represented by the sealed local Lorentz/AQFT branch; these are two descriptions of the same evidence. A null result constrains the certified sensitivity interval. Entanglement supplies the distributed state; the branch-(iii) response law supplies the Bob-marginal shift.

The three branches do not share one causal status: branches (i) and (ii) can satisfy Theorem 39c, whereas a freely selectable branch-(iii) pre-lightcone marginal shift is, by Corollary 39c.1, a preregistered falsifier of the sealed Lorentz/AQFT branch. The discrimination between branches is operational: branch (i) is tested through Alice-local and post-comparison joint-correlation analysis with Bob's marginal invariant; branch (ii) is excluded as an explanation of a Bob-marginal shift only by late randomization of Alice's context strictly after the latest event in the shared causal past of the two measurement regions; branch (iii) is the unique branch on which a Bob-marginal shift of $P(b)$ persists under late randomization. The endpoint, zero-error, sample-complexity, information-rate, chronology, and contradiction gates of Theorems 39–42 remain mandatory. They limit the admissible nonlocal maps but do not turn them into local CPTP dynamics.

**Lemma 10.2 (Bob-Marginal Kernel Decomposition of CC Deformations).** Let $P_0(a,b\mid x,y)$ be the baseline joint probability for spacelike-separated POVM settings $x$ at Alice and $y$ at Bob, and let
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

**Remark 10.2.1a (Scope of the Radon-Nikodym Form).** Lemma 10.2.1 sharpens the Bob-marginal-preserving part of branch (i). On branch (ii), a comparison between shared-past preparation laws may admit a Radon-Nikodym derivative when the laws are absolutely continuous, but that derivative belongs to a preparation-context comparison rather than to a late-randomized branch-(i) deformation. On branch (iii), a comparison that also satisfies $\mathbb P_C\ll\mathbb P_0$ has the Radon-Nikodym characterization of Lemma 10.2.1: a change in Bob's transcript law is equivalent to $\mathbb E_0[Z_C\mid\mathcal F_B]\ne1$ on a set of positive baseline probability. If this absolute continuity fails, the baseline derivative $Z_C$ need not exist and that conditional-expectation test is unavailable. Common support between the two context laws does not by itself establish absolute continuity with respect to the neutral baseline. The branch-(iii) consistency claim is supplied separately by Theorems 39a–42 on the regular finite-window branch (Definition 10.2a). The Radon-Nikodym form therefore complements Lemma 10.2: it is the finite-transcript/algebraic restatement of Bob-marginal preservation.

**Definition 10.2a (Regular Statistical Branch).** A branch-(iii) implementation is *regular* in the finite pre-lightcone window of $n\le n_{\max}=\lfloor r_{\max}L/c\rfloor$ trials when, under the two late-randomized Alice contexts, every admissible Bob-side transcript has positive probability under one context if and only if it has positive probability under the other. A sufficient per-trial condition is that the two conditional `Evolve` kernels have identical support after every admissible adaptive history. Products of the corresponding positive conditional probabilities then give identical support for every finite-$n$ transcript law.

Common support is an independent branch hypothesis. The endpoint condition $\mathrm{CC}<1/2$ excludes a pair of deterministic binary endpoints but does not force positivity of every outcome. Strict contractivity supplies support overlap only on branches whose minorization hypotheses establish it. Proposition E.2a's completed-reset support deficit bounds capacity on its own branch but does not establish an ensemble floor or common transcript support. Theorem 31 supplies only the registered-reset inequality $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; it neither forces a positive entropy floor without an independent ensemble bound nor implies output noise or common support, and paying a positive reset cost does not prohibit a deterministic reset. These results motivate particular regular implementations but do not replace the common-support hypothesis. Together with PPI admissibility of probability kernels, the explicit transcript-support condition defines the operating regime for Theorems 39a, 40, 41, and Lemma 10.3.

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

**Theorem 39c (Shannon-Causality Dichotomy).** Let $C$ be an independently selectable finite context in a spacetime region $A$, and let $Y$ be the full finite-alphabet transcript available in a spacelike-separated region $B$ before any light signal from the choice event can arrive. Write $W_c(y)=P(Y=y\mid C=c)$. The following are equivalent:

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

**Corollary 39c.1 (Causal Status of the Three Branches).** Branch (i) is causal when Bob's marginal is exactly invariant. Branch (ii) is a shared-past preparation dependence and is not an $A\to B$ channel when the context label is chosen before the spacelike choice event. A branch-(iii) Bob-marginal shift under an independently late-randomized choice has positive Shannon capacity by Theorem 39c and therefore lies outside the Lorentz/AQFT causal branch. Such a shift remains a valid preregistered falsifier of that branch; finite-window sample complexity changes detectability, not causal classification.

*Proof.* On branch (i), exact Bob-marginal invariance says $W_c=W_{c'}$ for every admissible late context, so Theorem 39c gives zero $A\to B$ capacity. On branch (ii), the context label is part of the shared-past preparation and is not an independently selectable input at the later spacelike region $A$; the input hypothesis of Theorem 39c is therefore absent, so correlations with that label do not define a later $A\to B$ channel. On branch (iii), late independent randomization and a Bob-marginal shift give $W_c\ne W_{c'}$ for some contexts. Theorem 39c then gives positive capacity and failure of operational no-signaling. A finite sample ceiling affects whether the inequality of laws can be detected at a prescribed error level, but it does not turn unequal laws into equal laws. ∎

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

**Remark 10.2b (Finite-Window Overlap Versus Shannon Causality).** The finite sample ceiling is relevant to attainable reliability, but Theorem 39c makes causal classification depend on exact context independence, not on whether zero error is reached in that window. For independent repetitions with $P_0\ne P_1$ at the per-trial level, $\Omega_n$ generically decays exponentially in $n$ at the Chernoff overlap rate of the per-trial laws; equivalently, classical Chernoff theory gives $-\log\Omega_n\sim n\,C_{\mathrm{Ch}}(P_0,P_1)$ under the usual iid regularity assumptions, with $C_{\mathrm{Ch}}>0$ when the laws are distinct and mutually absolutely continuous. Theorem 39a uses only the strict inequality $\Omega_n>0$ at the operational $n$ permitted by the pre-lightcone budget of Lemma 10.3, namely $n\le n_{\max}=\lfloor r_{\max}L/c\rfloor$. The finite-window zero-error argument therefore does not depend on uniform-in-$n$ behavior: even though $\Omega_n\to0$ as $n\to\infty$, the asymptotic regime is unreachable before ordinary causal contact, so the finite-window zero-error gate is not undermined by repetition-coding amplification.

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

**Proposition 39d (Canonical Finite Algebraic Current Realization and Independence of the Support/KMS Gates).** Let $p$ and $q$ be probability laws on a finite alphabet $Y$, and put $\Delta(y)=q(y)-p(y)$. Write
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

**Theorem 39e (Common-Support Driven-Ring Markov/KMS Current Carrier).** Let $d\ge3$ and let one thermal reservoir be in its equilibrium (KMS) state at inverse temperature $\beta>0$. Bob's registered record is the position $X_\tau\in\mathbb Z_d$, at a registered time $\tau>0$, of a continuous-time Markov jump process on the ring $\mathbb Z_d$ with degenerate site energies, prepared at $X_0=0$ in the shared past. Alice's late context $x\in\{0,1\}$ selects, through the branch-(iii) response law posited by Postulate 3, the generator $L_x$ whose clockwise and counterclockwise jump rates at every site are $k_+^{(x)}>0$ and $k_-^{(x)}>0$, subject to local detailed balance with respect to that reservoir,
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

**Resolution TV-QCP-02-R2 (Metadata).** Exact domain: the driven-ring carrier of Theorem 39e for every $d\ge3$, both contexts, every registered $\tau>0$ and all positive rates obeying (61l). Premises: shared-past point preparation, fresh preparation per trial, degenerate site energies, one thermal reservoir in its KMS state at inverse temperature $\beta$, local detailed balance (61l), and Alice's late context selecting $L_x$, the branch-(iii) response law posited by Postulate 3. Equivalence: carriers are identified when their generators, clock $(k_\pm^{(x)},\tau)$, preparation, registered current, entropy ledger and Bob record map agree. Budget: all $d$ sites and edges, both contexts, every transcript length $n$ and the explicit $d=3$ witness. Verifier: entrywise positivity of $e^{\tau L_x}$, the integrated master equation, the Poisson construction of $Q$, the uniform stationary law and cycle affinity, the local-detailed-balance entropy ledger, the sign of $\phi$ and the circulant formula. Falsifier: a transcript with zero probability under one context, a divergence defect, a variance different from $(k_+^{(x)}+k_-^{(x)})\tau$, or a ratio in (61m) at most $2$ for $r\ne1$. Provenance class: source-internal finite Markov and stochastic-thermodynamics construction. Downstream consumers: Definitions 10.2a and 10.2c, Theorem 39b, (61h), Proposition 39d and `TV-QCP-02`. Nonvacuity: the $d=3$ witness of item 5. This is `positive-discharge` of the registered positive-closure proposition: one populated common-support Markov/KMS carrier, realized as a driven Markov ring obeying local detailed balance with respect to one reservoir in its KMS state, whose registered current and thermodynamic precision relation use the same law. Proposition 39d's `negative-refutation` and `nonentailment` remain the verdicts on the algebraic-current and stationary-law routes. The late-context assignment and source-to-map realization of the context-selected generator remain `C+R`-open under `TV-QCP-01`, and `ET-EXP-05` owns its experimental execution and replication.

**Lemma 10.3 (Pre-Lightcone Information Budget and Sampling Gate).** Let
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

**Definition (QCP).** Alice and Bob share many copies of a fixed entangled state. They agree on a binary mapping between **Alice’s context** $C\in\{\mathrm A,\mathrm B\}$ and a **target local measurement bias** for Bob's outcomes (Appendix L): if $C=\mathrm A$, Alice adopts an internal state $\mathrm{context}_S$ and applies the associated physical control $\mathcal M(\mathrm{context}_S)$ intended to bias Bob's local outcome toward "spin up"; if $C=\mathrm B$, she adopts the corresponding context and control intended to bias toward “spin down.” Bob measures each partner in the pre-agreed basis and uses the single-shot rule: choose Strategy A if he observes “spin up,” Strategy B if “spin down.”

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
the retained-energy source relation $E_{\mathrm{grav}}^{\mathrm{inst}}=\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c$ with $0<\eta_{\mathrm{ret}}\le1$, and the weak-field geometry yielding $\Delta\tau_d=K P_{\mathrm{context}}$ in the registered operating interval. A tracked deterministic proper-time difference produces a coherent relative phase and does not by itself reduce CC. If a calibrated unresolved-phase or stochastic ensemble supplies the small-response attenuation law of Equation (S.21), then $\mathrm{CC}_{eff}$ is reduced to first order in $K_{\mathrm{eff}}P_{\mathrm{context}}$. On the separate saturated ND-RID response branch, the registered chronometric model gives $\Gamma_{\mathrm{ch}}^{(ij)}=(|\Delta E_{ij}|/\hbar)K_{\mathrm{eff}}P_{\mathrm{context}}$. These conclusions apply only while the retention, weak-field, and response certificates remain valid.

**10.4 Consistency Analysis: Statistical Influence vs. Causality**

The framework must distinguish finite-window reliability from causal status: by Theorem 39c, an independently selectable statistical FTL marginal channel violates Postulate 2. This analysis relies on the limits imposed by the CC bound and the nature of the information transfer.

**10.4.1 Theorem 40 (Sufficient Sample Size for the Direct Two-Context Test)**

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

**10.4.2 Theorem 41 (Finite-Error Information Rate: Exact Envelope and Perturbative Constant)**

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

**10.4.3 Theorem 42 (Finite-Window Zero-Error Loop Exclusion and Shannon-Causality Boundary)**

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

**Branch-by-branch closing summary.** Two versions of the proposal preserve ordinary causality: one leaves the remote outcome distribution unchanged, and the other reflects a shared earlier cause. A freely chosen late setting that changes a remote outcome distribution before light could arrive would instead create a noisy faster-than-light channel and violate ordinary no-signaling.

**Technical ledger.**

The branches of Postulate 3 have distinct causal statuses under Theorem 39c: branch (i) by Lemma 10.2 and the standard no-signaling theorem (Bob's marginal is invariant); branch (ii) by absence of any late controllable Alice variable after the shared causal past, so no pre-lightcone message channel exists at all; branch (iii) is outside Postulate 2 whenever a freely selectable late context changes Bob's pre-lightcone marginal, although Theorems 39a and 39b still bound its finite-window zero-error reliability and current representation. Therefore branches (i) and (ii) can satisfy Postulate 2 for the stated reasons; branch (iii) is a causal-branch falsifier despite its finite-window zero-error limitation. ∎

**Proposition 42c (Finite Stochastic Feedback Has a Distributional Fixed Point).** Let $W(y\mid x)$ be a finite channel and let $P(x'\mid y)$ be a finite feedback policy. Closing the output through the policy gives the stochastic transition matrix
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

**Proposition 42c.1 (Finite-Memory and Continuous-Policy Loop Classification).** Let $H$ be a finite history alphabet. Every fixed finite-memory channel-policy closure induces a stochastic matrix on $H$ and therefore has a stationary history law. More generally, if an adaptive policy induces a continuous map
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

**Resolution TV-QCP-05-R2.** Fixed finite memory and every distribution-dependent continuous policy are `positive-discharge` for distributional loop consistency. Equation (63f) is an exact separator showing that unrestricted discontinuous policy dependence does not inherit the fixed-point theorem. Intervention-stable receiver-policy prediction remains governed by Theorem 14.1.

**Proposition 42c.2 (Regularized, Order-Monotone and Higher-Order Loop Classification).** Let $K$ be a nonempty compact convex subset of a locally convex Hausdorff space and let $F:K\to K$ be an arbitrary policy-closure map. Define its closed convex regularization
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

**Resolution TV-QCP-05-R3 (Metadata).** Exact domain: every policy-closure map on a nonempty compact convex subset of a locally convex Hausdorff space, specialized to first-order policies on $\Delta(H)$ for finite $H$, $k$th-order recursions and second-order policies on $\Delta(\Delta(H))$; the monotone and antitone classes for first-order stochastic dominance on a totally ordered finite $H$; binary policies with one-sided limits; and rational piecewise-affine policies on finite convex polyhedral partitions. Premises: the stated class conditions, with continuity assumed only where stated. Equivalence: policies are compared by their closure maps and their fixed or periodic law sets; regularized fixed points are kept distinct from exact fixed points. Budget: every point of $K$, all neighborhoods entering (63j), at most $n$ cluster values per regularized fixed point and finitely many cell programs. Verifier: the closed-graph and singleton checks, the Kakutani--Fan--Glicksberg, Carathéodory, Brouwer, Schauder--Tychonoff and Tarski theorems, the diagonal-crossing argument and the linear-programming reduction. Falsifier: a policy whose regularization has no fixed point, a continuity point of $F$ in $\operatorname{Fix}\bar F$ that is not fixed, a dominance-monotone policy without a fixed point, a binary policy with one-sided limits and no downward diagonal crossing yet no fixed point, or a cell program whose verdict disagrees with exact fixed-point existence. Provenance class: source-internal fixed-point and order-theoretic classification. Downstream consumers: Theorem 42, Propositions 42c--42c.1, Theorem 14.1 and the chronology discussion. Nonvacuity: (63f), the identity policy and every constant policy. This is `positive-discharge` of regularized loop consistency for every policy, of exact loop consistency on the continuous higher-order, dominance-monotone and binary no-downward-crossing classes, of period-at-most-two consistency for antitone policies, and of decidability for rational piecewise-affine policies; (63f) remains the `negative-refutation` of exact consistency for unrestricted discontinuous single-valued policies. Formal realization of the retained intervention-stable process class remains `R`-open under `TV-QCP-05`, and paradox control remains governed by Theorem 14.1.

**10.5 Relation to Emergent Locality and AQFT Framework**

Appendix F supplies the conditional AQFT setting for the marginal-invariant and shared-past branches. Corollary F.1 formulates operator-level Einstein causality under Theorem F.0's continuum-bridge hypotheses. On the local CPTP branch, the prepared state $\omega_{C_A}$ may depend on Alice's context through the map $\mathcal M$ and ND-RID dynamics, so joint expectations such as $\omega_{C_A}(A\otimes B)$ in Equation (F.4) may vary while Bob's unconditional statistics $\omega_{C_A}(\mathbf{1}_A\otimes B)$ remain invariant. Thus operator locality, Equation (F.2), and state-mediated joint or conditional dependence coexist on the Bob-marginal-preserving branch.

A late-randomized branch-(iii) Bob-marginal shift is PU's statistical-FTL hypothesis and the Theorem 39c/Corollary 39c.1 falsifier of exact pre-lightcone context independence. On the regular finite-window model, Theorems 39a–42 bound reliability, sample complexity, information rate, and zero-error accessibility. Implementation remains subject to ND-RID irreversibility, $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ on the registered reset branch, with a positive floor inferred from this entropy bound requiring $H_q(P\mid R)\ge h_{\min}>0$ (Theorem 31). On the separate refresh/minorization branch, Lemma E.1 gives $f_{RID}<1$ and Theorem E.2 gives $C_{\max}<\ln d_0$. These contraction and capacity results do not establish the common-support condition of Definition 10.2a, which remains an independent finite-window regularity hypothesis. The conditional Lorentz-invariant description applies to the exact marginal-invariant and shared-past branches, while branch (iii) supplies PU's statistical-FTL experimental alternative outside the exact Lorentz/AQFT causal branch.

**Measurement-independence guardrail.** For experimental settings $x,y$ and a past variable $\lambda$, measurement independence is the separate condition
$$
P(x,y\mid\lambda)=P(x,y).
$$
Logical indeterminacy, stochastic outcomes, no-signaling, and absence of a deterministic hidden variable do not imply this equality. Stochastic settings may remain correlated with $\lambda$, and no-signaling constrains outcome marginals rather than the setting distribution. Every Bell-type PU protocol must therefore either assume measurement independence or bound its failure with an explicit causal and statistical model; CC is not presumed to be the only possible common-cause channel.

**Theorem 42b (Sharp CHSH Robustness on the Uniform Setting-Contamination Class).** Let $z=(x,y)\in\{0,1\}^2$ be uniformly selected settings, let $a,b\in\{0,1\}$, and fix $0\le\mu\le1$. Consider the causal-model class
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

**Theorem 42b.1 (Sharp CHSH Census Across Measurement-Dependence Measures and Causal Classes).** Keep the scenario of Theorem 42b: uniformly selected settings $z=(x,y)\in\{0,1\}^2$, binary outcomes, local responses $P(a\mid x,\lambda)P(b\mid y,\lambda)$, and hidden-variable laws $\rho_z(\lambda)=P(\lambda\mid z)$ that may depend arbitrarily on $z$. Write $P(z,\lambda)=\frac14\rho_z(\lambda)$ and $\bar\rho=\frac14\sum_z\rho_z$, and define
$$
\begin{aligned}
M_{\mathrm{pair}}&=\max_{z,z'}\operatorname{TV}(\rho_z,\rho_{z'}),
&D_{\mathrm{TV}}&=\operatorname{TV}(P_{Z\Lambda},P_Z\otimes P_\Lambda),
&I&=I(Z;\Lambda),\\
P_{\mathrm{guess}}&=\sum_\lambda\max_zP(z,\lambda),
&m&=\sum_\lambda\min_zP(z,\lambda),
&\ell&\le P(z\mid\lambda)\le u\ \text{ for all }z,\lambda,
\end{aligned}
$$
with $I$ in nats; for a general standard Borel hidden-variable space the sums over $\lambda$ are integrals. Put $\gamma_S:=(4-S_{\mathrm{CHSH}})/8$ and $H_4(\gamma):=-\gamma\ln\gamma-(1-\gamma)\ln\frac{1-\gamma}{3}$. Every model in the class obeys
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

Every joint law $P(z,\lambda)$ with uniform setting marginal is generated by each of three causal structures: setting-to-source influence $Z\to\Lambda$, including retrocausal influence on the source; source-to-setting influence $\Lambda\to Z$; and a common cause $C\to Z$, $C\to\Lambda$ with no edge between $Z$ and $\Lambda$. The CHSH value and every measure above are functionals of $P(z,\lambda)$ and the local responses, so the thresholds coincide across the three causal classes, which realize exactly the same outcome tables and measure values.

*Proof.* Absorbing independent local randomness $\xi$ into $\lambda$ makes every local response deterministic without changing $P(z\mid\lambda)$ or any of the measures above, because $\xi$ is independent of $(z,\lambda)$. The relabeling $b\mapsto b\oplus1$ reverses the sign of the signed CHSH functional and leaves every measure unchanged, so it suffices to bound the signed value. For a deterministic strategy $\lambda=(\alpha,\beta)$ put $g_z(\lambda)=(-1)^{\alpha(x)\oplus\beta(y)\oplus xy}$; the signed value is $\sum_z\sum_\lambda\rho_z(\lambda)g_z(\lambda)$. Each of $\alpha(0),\alpha(1),\beta(0),\beta(1)$ occurs in two of the four parities $\alpha(x)\oplus\beta(y)$, while $\sum_zxy=1$; hence every $\lambda$ fails the relation $\alpha(x)\oplus\beta(y)=xy$ at an odd number of setting pairs, so $\sum_zg_z(\lambda)\le2$ and some $g_z(\lambda)=-1$.

For fixed $\lambda$, placing the value $-1$ on a smallest weight gives $\sum_zP(z,\lambda)g_z(\lambda)\le P(\lambda)-2\min_zP(z,\lambda)$; multiplication by $4$ and summation give $S\le4-8m$. Since $\min_zP(z\mid\lambda)\ge\ell$ and $\min_zP(z\mid\lambda)\ge1-3\max_zP(z\mid\lambda)$, averaging over $\lambda$ gives $m\ge\ell$, $m\ge1-3u$ and $m\ge1-3P_{\mathrm{guess}}$; with $S\le4-8m$ these give the bounds in $\ell$, $u$ and $P_{\mathrm{guess}}$. For a law $\nu$ and $|g|\le1$, $\bigl|\sum_\lambda(\rho_z-\nu)(\lambda)g(\lambda)\bigr|\le2\operatorname{TV}(\rho_z,\nu)$. With $\nu=\rho_{z_0}$ this gives $S\le\sum_\lambda\rho_{z_0}(\lambda)\sum_zg_z(\lambda)+6M_{\mathrm{pair}}\le2+6M_{\mathrm{pair}}$; with $\nu=\bar\rho$ it gives $S\le2+2\sum_z\operatorname{TV}(\rho_z,\bar\rho)=2+8D_{\mathrm{TV}}$.

For (63h), let $W(\lambda)$ be a setting pair with $g_{W(\lambda)}(\lambda)=-1$. Then $S\le\sum_z\bigl(1-2\rho_z(W=z)\bigr)=4-8\Pr(W=Z)$, so $p_e:=\Pr(W\ne Z)\ge1-\gamma_S\ge3/4$. Fano's inequality for the estimator $W$ of the uniform four-valued $Z$ gives $H(Z\mid W)\le(\ln2)h_2(p_e)+p_e\ln3$, and the right side decreases on $[3/4,1]$ because its derivative is $\ln\bigl(3(1-p_e)/p_e\bigr)\le0$; at $p_e=1-\gamma_S$ it equals $H_4(\gamma_S)$. Data processing gives $I(Z;\Lambda)\ge I(Z;W)=\ln4-H(Z\mid W)\ge\ln4-H_4(\gamma_S)$.

On (63i), $\lambda_w$ fails only at $w$, so $S=\sum_z(1-2\gamma)=4-8\gamma$. The hidden-variable marginal is uniform on the four strategies, so $P(z\mid\lambda_w)=\rho_z(\lambda_w)$, which equals $\gamma$ for $z=w$ and $(1-\gamma)/3$ otherwise. This gives $m$, $\ell$, $u$, $P_{\mathrm{guess}}$, $I=H(\Lambda)-H(\Lambda\mid Z)=\ln4-H_4(\gamma)$, $\operatorname{TV}(\rho_z,\rho_{z'})=\bigl|\gamma-\frac{1-\gamma}{3}\bigr|=\frac{1-4\gamma}{3}$ and $\operatorname{TV}(\rho_z,\bar\rho)=\frac{1-4\gamma}{4}$. Substituting $\gamma=\gamma_S$ attains every bound, and rearrangement gives the thresholds.

For the causal classes, sample $z$ uniformly and then $\lambda\sim\rho_z$; or sample $\lambda\sim\bar\rho$ and then $z\sim P(z\mid\lambda)$; or sample $C=(z,\lambda)$ from the joint law and let $Z$ and $\Lambda$ be its coordinates. The three constructions produce the same joint law, hence the same outcome table and the same measures. ∎

**Resolution TV-QCP-03-R2 (Metadata).** Exact domain: the four-setting binary-outcome CHSH scenario with uniform settings, local responses, arbitrarily setting-dependent hidden-variable laws, the seven dependence measures of Theorem 42b.1, and the setting-to-source, source-to-setting and common-cause causal classes. Premises: factorized local responses, with independent local randomness absorbed into $\lambda$. Equivalence: equality of the joint law $P(z,\lambda)$ and of the local response functions, hence of the complete outcome table and every measure. Budget: sixteen deterministic strategies, four setting pairs, the one-parameter family (63i) and three causal generators. Verifier: the parity count of failures, the per-$\lambda$ minimum bound, the total-variation transfer inequality, Fano monotonicity on $[3/4,1]$ and exact evaluation of (63i). Falsifier: a local model exceeding a bound in (63g)--(63h), or a member of (63i) failing to attain it. Provenance class: source-internal finite causal-model classification. Downstream consumers: the measurement-independence guardrail, Theorem 42b, Bell/CC setting-independence audits and `TV-QCP-03`. Nonvacuity: (63i) at $\gamma=0$ ($S=4$), $\gamma=(2-\sqrt2)/4$ ($S=2\sqrt2$) and $\gamma=1/4$ (measurement independence, $S=2$). This is `positive-discharge` of the sharp dependence-measure census and `nonentailment` of the causal class from the CHSH value and every listed measure. Formal realization of the setting, source and separation maps remains `R`-open under `TV-QCP-03`.

**Resolution ledger 42d-R1 (Finite QCP Classifications).** Each row registers the exact mathematical artifact on the finite domain and premises shown; the target's physical carrier and experiment remain independent required records.

| Target | Exact domain and premises | Equivalence and budget | Registered polarity | Verifier, falsifier and nonvacuity | Provenance and downstream consumers |
|:--|:--|:--|:--|:--|:--|
| `TV-QCP-02` | Normalized laws $p,q$ on one finite alphabet; for the clock clause, the displayed faithful two-state stationary law and reversible generators $L_a$, $a>0$. | Currents are equivalent modulo signed divergence-free circulation after extension to a common edge set; supports are compared literally and distinct $a$ remain clock-inequivalent. Budget: every alphabet symbol and bipartite edge, plus the symbolic positive one-parameter generator family. | Algebraic divergence-current existence is `positive-discharge`; current $\Rightarrow$ common support is `negative-refutation`; clock normalization from the stationary law is `nonentailment`. | Verify (61k), both supports, stationarity and the eigenvalue $-2a$. A finite displacement without such a current, overlapping supports in the displayed counterexample, or an $a$-independent relaxation rate falsifies the corresponding artifact. The two-point laws and any $a\ne a'$ prove nonvacuity. | Source-internal finite probability and Markov linear algebra. Consumers: Theorem 39b, Definition 10.2a, (61h), and the common-support/KMS carrier. |
| `TV-QCP-03` | The exact four-setting, binary-outcome mixture (63c), with uniform settings, a measurement-independent local component, an arbitrarily setting-dependent local-response component, and $0\le\mu\le1$. | Equality of the complete conditional outcome table in the fixed signed-CHSH convention. Budget: four setting pairs and the finite deterministic local-response assignments used at the two extremal values. | The bound $S_{\mathrm{CHSH}}\le2+2\mu$ and its sharp threshold are `positive-discharge` on this mixture class. | Evaluate the affine CHSH functional and the aligned value-$2$/value-$4$ witnesses. A member exceeding (63d), or failure of the witness to attain it, falsifies the artifact. The deterministic endpoint models prove nonvacuity. | Source-internal finite causal-model analysis. Consumers: Bell/CC setting-independence audits and the held-out causal comparison. |
| `TV-QCP-05` | One fixed finite channel $W$ and one fixed finite feedback policy $P$, both normalized; the point-mass clause uses deterministic $T$, and the separator is the binary bit-flip with identity feedback. | Closed loops are compared by the induced stochastic matrix $T$ and stationary-law set; distributional fixed points are not identified with deterministic point-mass fixed symbols. Budget: the complete finite matrix (63b), its simplex, and the two-symbol separator. | Existence of a stationary distribution for every fixed finite closure is `positive-discharge`; positive capacity forcing a deterministic-symbol fixed point is `negative-refutation`. | Check stochasticity, solve $\pi=T\pi$, and evaluate the bit-flip capacity and symbols. A finite stochastic $T$ with no stationary law, or a fixed symbol for the displayed bit-flip, falsifies the corresponding artifact. The bit-flip law proves nonvacuity. | Source-internal finite stochastic-matrix analysis. Consumers: Theorems 42 and 14.1 and the chronology discussion. |

**Theorem 42a (Relational Decoding Principle: No Actionable Capacity Without Shared Decoding).** Consider bipartite $AB$ in state $\rho_{AB}$. For each message $x$, let Alice apply a local CPTP channel $\Phi_x$ on $A$, equivalently the nonselective trace-preserving sum of a local instrument with its outcome discarded. Bob's detector is keyed by a classical variable $K$ sampled independently of both the message $x$ and the prepared quantum system, so the joint preparation is $\rho_{AB}\otimes\sum_K\pi(K)|K\rangle\langle K|$. For each $K$, let $\Lambda_K^*$ be a unital CP Heisenberg map and let $E_i^{(K)}=\Lambda_K^*(E_i)$. Assume
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

**Theorem 10.7a (Normalized Positive Branch-(iii) Replacement Family).** Let $\tau_A$ be a density operator on $A$, let $\sigma_B^{(0)},\sigma_B^{(1)}$ be density operators on $B$, and let $0<\epsilon<1$. Define
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

The family is an explicit finite normalized positive witness for the global-map component nominated by Postulate 3(iii). Each map acts globally because its target state on $B$ depends directly on $x$. Assigning $x$ by a freely selected spacelike-late apparatus would supply the physical nonlocal law that `TV-QCP-01` asks to realize; entanglement and local CPTP dynamics supply no such assignment. Admission to the Postulate-3 physical branch additionally requires its endpoint-bias, finite-resource, chronology, and no-loop gates, while Definition 10.2a's finite-transcript common-support condition requires a repeated-law certificate beyond the one-shot state-support statement above; Proposition 10.7b supplies it for full-rank $\rho_B$.

**Resolution record 10.7a-R1 (`TV-QCP-01`).** The exact registered proposition is existence of a finite normalized positive global context family with nonzero Bob-marginal separation; Theorem 10.7a supplies `positive-discharge` on finite-dimensional $AB$ modulo equality of the two global channels on all density operators. The budget is two contexts, one finite input carrier, and $0<\epsilon<1$; provenance is analytic. The verifier checks Choi positivity, trace preservation, both partial traces, and the trace norm in (10.7a.2). A negative Choi eigenvalue, trace defect, or zero separation for orthogonal targets falsifies the artifact. Proposition 10.7b supplies finite-transcript support for full-rank $\rho_B$ with a fresh input copy in each trial. Physical spacelike timing, source-to-map realization, locked nonzero interval, causal artifact controls, and replication remain open. The result feeds Theorems 39a--42, QCP, and Protocol 3.

**Proposition 10.7b (Finite-Transcript Common Support for the Replacement Family).** Keep the family (10.7a.1) with $0<\epsilon<1$ and a full-rank reduced input $\rho_B$. Run $n$ trials, each on a fresh copy of the registered input $\rho_{AB}$, with any sequence of Alice contexts $x_1,\ldots,x_n$ and with Bob choosing the POVM $\{F^{(i)}_b\}_b$ of trial $i$ as a function of his earlier outcomes, every retained effect being nonzero. Then
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

**Resolution TV-QCP-01-R2 (Metadata).** Exact domain: the family (10.7a.1) with $0<\epsilon<1$ and full-rank $\rho_B$, fresh independent inputs, arbitrary context sequences and Bob-adaptive POVM sequences with nonzero effects, for every $n\ge1$. Premises: Theorem 10.7a. Equivalence: equality of the complete context-conditioned transcript laws. Budget: all transcripts of length $n$, all adaptive measurement trees and the qubit witness. Verifier: the operator lower bound, the product rule, Lemma 9.1 with the Helstrom projector, and direct evaluation of (10.7b.2) and $\Omega_n$. Falsifier: a transcript with nonzero effects and zero probability under some context, or a POVM separation exceeding $\delta_B$. Provenance class: source-internal finite quantum-probability proof. Downstream consumers: Definition 10.2a, Theorems 39a--42, Lemma 10.1, QCP and `TV-QCP-01`. Nonvacuity: the qubit witness for every $\epsilon\in(0,1)$. This is `positive-discharge` of the finite-transcript common-support record and of the exact per-trial separation for the formal family. The late-context assignment, spacelike timing, source-to-map, locked nonzero-interval and causal-artifact-control records and their formal realization remain `C+R`-open under `TV-QCP-01`; `ET-EXP-05` owns execution and replication.
