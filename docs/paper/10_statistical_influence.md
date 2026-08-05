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

The endpoint bound below excludes endpoint-complete deterministic forcing. Exact compliance with Postulate 2 separately requires the full marginal-invariance condition of Theorem 39c; a magnitude bound alone does not imply it.

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

Theorem 39 is an endpoint gate, not the whole statistical-FTL consistency theorem. The additional step needed for branch (iii) is supplied by Theorem 39a: on the regular finite-window statistical branch, Bob's transcript distributions retain overlapping support under the two Alice contexts, so the zero-error FTL capacity is zero even when the ordinary finite-error information rate of Theorem 41 is positive.

**10.3 The Statistical FTL Influence Hypothesis**

Theorem 39 excludes only one-shot endpoint-complete forcing, and Theorem 39a excludes finite-window zero-error signaling only on its common-support branch; neither proves Postulate 2. Hypothesis 3 therefore motivates, but does not derive, the following classification of possible context-dependent spacelike statistics.

**10.3.1 Postulate 3 (Post 3): Statistical Influence (Three-Branch Causal Classification)**

As a branch contract motivated by Hypothesis 3 and the availability of entangled states on Proposition 10's quantum branch, PU distinguishes three operationally distinct classes of statistical influence according to the causal-temporal placement of Alice's context choice. Postulate 3 is not a theorem-level consequence of the finite predictive substrate or of entanglement: each class inherits only the status supplied by its realization, no-loop, no-zero-error, protocol, and empirical certificates.

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

**(ii) Preparation-context branch.** If Alice's context $C$ is fixed before, or in the shared causal past of, the spacelike-separated measurement events at $A$ and $B$, then the global state $\omega_C$ delivered to the two stations may itself depend on $C$, and Bob's marginal $P(b\mid C)$ may depend on $C$ through ordinary common-cause statistics with no spacelike action by Alice after separation. Branch (ii) is consistent with operator-level Einstein causality (Corollary F.1) and is excluded as an explanation of any putative branch-(iii) signal only when Alice's context is randomized strictly later than the latest event in the shared causal past of the two measurement regions. The shared-past placement is part of the causal-temporal definition of branch (ii). Theorem L.12.8 adds only that a strict target-conditioned joint-correlation advantage above the best target-independent policy requires causal or common-cause information about the relevant entanglement record; a generic local joint-correlation change need not involve participation in preparation.

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

**Remark 10.2.1a (Scope of the Radon-Nikodym Form).** Lemma 10.2.1 is a sharpening of the Bob-marginal-preserving part of branch (i) only; it is not an independent prohibition on branches (ii) or (iii). On branch (ii), a comparison between shared-past preparation laws may admit a Radon-Nikodym derivative when the laws are absolutely continuous, but that derivative belongs to a preparation-context comparison rather than to a late-randomized branch-(i) deformation. On branch (iii), the Bob-marginal kernel component is nonzero on the relevant Bob transcript algebra, so $\mathbb E_0[Z_C\mid\mathcal F_B]\ne1$ for at least one late-randomized context comparison. The branch-(iii) consistency claim is supplied separately by Theorems 39a–42 on the regular finite-window branch (Definition 10.2a). The Radon-Nikodym form therefore complements Lemma 10.2: it is the finite-transcript/algebraic restatement of Bob-marginal preservation, and it does not replace the three-branch structure of Postulate 3.

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

**Theorem 39b (Predictive Current No-Loop and Precision-Cost Gate).** Let a branch-(iii) statistical influence model in the finite pre-lightcone window carry both Definition 10.2a and a finite predictive current certificate $\mathfrak J_\Omega$. Then the current representation cannot by itself create a deterministic or zero-error FTL causal loop: every decoder from Bob's projected current transcript still has strictly positive error probability whenever the two context-conditioned Bob transcript laws have common support.

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

*Proof.* Equation (61g) says that the Bob observable produced by the current certificate is a function of the same finite Bob transcript algebra used in Theorem 39a. Theorem 39a proves that, under common support, every decoder on that finite transcript algebra has error at least $\Omega_n/2>0$. Passing through the current projection $\Pi_B$ is a deterministic coarse-graining of the transcript and cannot make two overlapping transcript laws disjoint. Hence the current representation does not create a zero-error decoder.

Assume now that the branch also supplies (61h). If $0<\Sigma_\Omega<\infty$ and $\langle Q\rangle\ne0$, multiplying (61h) by $\langle Q\rangle^2/\Sigma_\Omega$ gives (61i). Therefore a nonzero mean current at finite entropy cost cannot have zero variance. If $\Sigma_\Omega=0$, (61h) is incompatible with $\langle Q\rangle\ne0$; if $\Sigma_\Omega=\infty$, the event is not in the finite-cost branch. These alternatives exhaust the finite-current certificate cases. ∎

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

**Scope note.** The finite-window budget above is a Fano and sampling gate for the CC branch. It is not an information-causality axiom for arbitrary no-signaling boxes and does not derive the Tsirelson bound by itself. The quantum CHSH/Tsirelson boundary, when invoked, must be supplied by the Hilbert/Born operator structure of Section 8, while branch-(iii) CC claims remain governed by Theorems 39a-42 and their protocol certificates.

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

**AQFT boundary.** Conditional on the continuum-bridge hypotheses of Appendix F, Corollary F.1 encodes operator locality and, together with local CPTP implementation, yields exact marginal no-signaling. On that branch, context dependence carried by a globally prepared state $\omega_C$, including Alice's CC-modulated control $\mathcal M(\text{context}_S)$, may change joint or conditional statistics as in Equation (F.4), while Bob's marginal remains invariant as in Equation (F.4a); shared-past preparation dependence is a common-cause case. Branch-(iii) QCP is the beyond-AQFT response law in which Alice's late choice shifts Bob's marginal. For a branch-(iii) response law satisfying the balanced binary conditions $p=\tfrac12$ and $\delta\le\kappa\,\mathrm{CC}$, Theorem 41 gives the exact envelope
$$
I(C;Y)\le4(\kappa\,\mathrm{CC})^2
$$
nats/trial, with perturbative leading behavior $I(C;Y)=2\delta^2+O(\delta^4)$ for the symmetric Bernoulli channel. This statistical influence cannot be shaped into deterministic, pre-lightcone zero-error signals on the regular finite-window branch; finite-window zero-error decoding remains excluded by Theorem 39a and Theorem 42, while Theorem 39c classifies any nonzero pre-lightcone context channel as signaling. The full consistency analysis is provided in **Appendix F**.

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
1.  **Requirement for a Zero-Error Contradiction Protocol (Weaker than Postulate 2):** The construction of a logical causal paradox requires controllable deterministic information, equivalently a zero-error FTL decoding step in a finite pre-lightcone window. A finite-error statistical estimate is insufficient: if the estimate is wrong with nonzero probability, no contradiction follows from Alice choosing otherwise.
2.  **Endpoint exclusion (bounded-bias branch and Theorem 39):** The branch independently declares $\alpha_{CC,max}<1/2$, and Theorem 39 proves that this excludes forcing both deterministic endpoints of a binary coarse-graining. Thus an endpoint-complete one-shot message alphabet cannot be obtained on this branch; the theorem does not exclude every one-endpoint protocol.
3.  **Finite-window zero-error exclusion (Theorem 39a, regular branch):** On branch (iii), Bob's marginal may depend on Alice's late context, so the ordinary Shannon information of Bob's record may be positive. However, on the regular finite-window branch (Definition 10.2a), every finite pre-lightcone transcript retains positive overlap between the two context-conditioned laws, so every decoder has strictly positive error probability:
    $$
    P_{\mathrm{err}}\ge\Omega_n/2>0.
    $$
    By Remark 10.2b, the relevant $n$ is bounded by the pre-lightcone budget of Lemma 10.3, so asymptotic overlap decay does not undermine this gate. Step 3 alone suffices to exclude the deterministic/zero-error decoding step needed for a zero-error contradiction protocol; this is weaker than Postulate 2; Steps 4–6 supply complementary quantitative bounds.
4.  **Predictive-current gate (Theorem 39b, when asserted):** If the same branch is written as a finite predictive current, the Bob-side current transcript is a projection or coarse-graining of the same finite transcript algebra. It cannot turn overlapping transcript laws into disjoint laws. On branches carrying the thermodynamic precision certificate, a nonzero finite-cost current signal also has nonzero variance, so it cannot become a deterministic current pulse.
5.  **Sample and rate bounds (Theorems 40–41):** Theorem 40 gives the direct two-context test's sample-complexity scale for resolving a small branch-(iii) effect at a chosen nonzero error tolerance. Theorem 41 upper-bounds the finite-error mutual information rate by $O(\mathrm{CC}^2)$ at a regular operating point. Lemma 10.3 bounds the mutual information that can be accumulated before an ordinary light signal crosses the separation. These are statistical-detection limits, not deterministic-message constructions.
6.  **Failure to close a deterministic loop:** A tachyonic anti-telephone or grandfather-style loop requires Alice to receive a definite contradiction-producing message about her own future choice. The PU statistical-FTL branch supplies at most a noisy estimate with nonzero finite-window error, by Steps 3--5.

**Branch-by-branch closing summary.** Two versions of the proposal preserve ordinary causality: one leaves the remote outcome distribution unchanged, and the other reflects a shared earlier cause. A freely chosen late setting that changes a remote outcome distribution before light could arrive would instead create a noisy faster-than-light channel and violate ordinary no-signaling.

**Technical ledger.**

The branches of Postulate 3 have distinct causal statuses under Theorem 39c: branch (i) by Lemma 10.2 and the standard no-signaling theorem (Bob's marginal is invariant); branch (ii) by absence of any late controllable Alice variable after the shared causal past, so no pre-lightcone message channel exists at all; branch (iii) is outside Postulate 2 whenever a freely selectable late context changes Bob's pre-lightcone marginal, although Theorems 39a and 39b still bound its finite-window zero-error reliability and current representation. Therefore branches (i) and (ii) can satisfy Postulate 2 for the stated reasons; branch (iii) is a causal-branch falsifier despite its finite-window zero-error limitation. ∎

**10.5 Relation to Emergent Locality and AQFT Framework**

Appendix F supplies the conditional AQFT setting for the marginal-invariant and shared-past branches. Corollary F.1 formulates operator-level Einstein causality under Theorem F.0's continuum-bridge hypotheses. On the local CPTP branch, the prepared state $\omega_{C_A}$ may depend on Alice's context through the map $\mathcal M$ and ND-RID dynamics, so joint expectations such as $\omega_{C_A}(A\otimes B)$ in Equation (F.4) may vary while Bob's unconditional statistics $\omega_{C_A}(\mathbf{1}_A\otimes B)$ remain invariant. Thus operator locality, Equation (F.2), and state-mediated joint or conditional dependence coexist on the Bob-marginal-preserving branch.

A late-randomized branch-(iii) Bob-marginal shift is PU's statistical-FTL hypothesis and the Theorem 39c/Corollary 39c.1 falsifier of exact pre-lightcone context independence. On the regular finite-window model, Theorems 39a–42 bound reliability, sample complexity, information rate, and zero-error accessibility. Implementation remains subject to ND-RID irreversibility, $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ on the registered reset branch, with a positive floor requiring $H_q(P\mid R)\ge h_{\min}>0$ (Theorem 31). On the separate refresh/minorization branch, Lemma E.1 gives $f_{RID}<1$ and Theorem E.2 gives $C_{\max}<\ln d_0$. These contraction and capacity results do not establish the common-support condition of Definition 10.2a, which remains an independent finite-window regularity hypothesis. The conditional Lorentz-invariant description applies to the exact marginal-invariant and shared-past branches, while branch (iii) supplies PU's statistical-FTL experimental alternative outside the exact Lorentz/AQFT causal branch.

**Measurement-independence guardrail.** For experimental settings $x,y$ and a past variable $\lambda$, measurement independence is the separate condition
$$
P(x,y\mid\lambda)=P(x,y).
$$
Logical indeterminacy, stochastic outcomes, no-signaling, and absence of a deterministic hidden variable do not imply this equality. Stochastic settings may remain correlated with $\lambda$, and no-signaling constrains outcome marginals rather than the setting distribution. Every Bell-type PU protocol must therefore either assume measurement independence or bound its failure with an explicit causal and statistical model; CC is not presumed to be the only possible common-cause channel.

**Theorem 42a (Relational Decoding Principle: No Actionable Capacity Without Shared Decoding).** Consider bipartite $AB$ in state $\rho_{AB}$. For each message $x$, let Alice apply a local CPTP channel $\Phi_x$ on $A$, equivalently the nonselective trace-preserving sum of a local instrument with its outcome discarded. Bob's detector is keyed by a classical variable $K$ with distribution $\pi(K)$ independent of $x$. For each $K$, let $\Lambda_K^*$ be a unital CP Heisenberg map and let $E_i^{(K)}=\Lambda_K^*(E_i)$. Assume
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
Revealing the key $K$ alone does not unlock $C$ from Bob's stream because the averaged Heisenberg map is $x$-independent by hypothesis. On branch (i) of Postulate 3, Bob's marginal is invariant by Lemma 10.2. On branch (ii), any context dependence of Bob's marginal is a shared-past preparation effect and is excluded as an explanation of late-randomized branch-(iii) data by the branch definition and the certified causal timing of the randomization. Theorem L.12.8 separately constrains strict target-conditioned joint-correlation advantage above information-free policies. On branch (iii), Bob's marginal itself shifts under late randomization, but the shift is statistical with rate bounded by Theorem 41; on the regular finite-window branch (Definition 10.2a) it retains zero-error capacity zero by Theorem 39a in any pre-lightcone window of operational size. The QCP of Section 10.3.2 fixes a single shared decoding rule — the pre-agreed binary mapping between context and target measurement bias — and converts the relational structure into a one-shot decision advantage $\delta=O(\mathrm{CC})$ that cannot be amplified into deterministic or zero-error signaling under the regular-branch hypothesis.

**10.6 Gravitational Self-Limitation of CC**

The Consciousness Complexity (CC) extension admits a conditional gravitational-feedback branch. On that branch, the physical context contributes to the stress-energy source through the retained-energy relation of Appendix S. The model additionally assumes a constitutive power law that grows as CC approaches its branch ceiling, a weak-field geometry converting retained source energy into differential proper time, and a calibrated unresolved-phase or stochastic response converting that proper-time spread into attenuation.

If the same branch also supplies the Appendix S PCE objective and its coercivity or boundary-growth conditions, optimization can yield a finite interior operating point balancing predictive utility, direct resource cost, and gravitational attenuation. A tracked deterministic phase alone does not dephase, and POP/PCE without the constitutive and response certificates does not prove a universal gravitational ceiling. Theorem 39's endpoint-completeness bound remains a separate constraint.
