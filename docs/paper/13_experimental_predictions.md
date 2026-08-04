# 13. Experimental Predictions and Protocols

Hypothesis 3 nominates the response-active Consciousness Complexity mechanism tested here; the core also admits $\mathrm{CC}(S)=0$ and leaves its sign and nonzero interval to the physical realization. With a causal aggregate-to-control map, normalized target instrument, complete source and artifact ledgers, and a forward-locked Definition 13.0d record, this section formulates branch-specific anomaly tests with preregistered analyses, blinding, controls, and multiplicity correction. Protocol 1a treats a provenance-marked true or false report as a physical context input and tests its registered correlation with later outcomes. Each protocol becomes test-ready when its realization, likelihood, sensitivity, stopping, and replication records are accepted.

### Assumption Checklist

- Geometric regularity (Theorem 43) holds on the operational-continuum branch, with exact continuum ontology excluded by Theorem K.10.3a.
- ND-RID irreversibility: $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$ (Theorem 31).
- Reflexivity Constraint: $\kappa_r>0$ (Theorem 33).
- PCE equilibrium reached (Definition 15a).
- Gauge sector realized as $G_{SM}$ on the Appendix G finite-response capacity/anomaly/hypercharge branch (Theorem G.8.4b and Corollary G.8.4c, with the Lagrangian gauge-realization branch for the generator bound where explicitly used).
- Emergent metric predictions use the operational-continuum, channel-capacity, stress-energy, and finite KMS-descent branch of Appendix F.10.12 and Corollary 12.1b when that certificate is invoked.
- Cosmological-sector theorem-level exponent claims use the Appendix U four-mode false-vacuum branch $\kappa=142$ under Theorem U.13b. A theorem-level numerical $\Lambda$ value additionally requires an accepted canonical four-mode prefactor closure record $\mathfrak F_U^{(4)}$ of Definition U.73e and Theorem U.73f. The earlier relative Quillen-Fredholm certificate $\mathfrak F_U$ of Definition U.15d together with the interval audit $\mathfrak I_U^{(4)}$ closes the canonical row only through an accepted embedding that additionally supplies $H_4$, $\mathcal T_4$, and every remaining field of Definition U.73e on the same four-mode branch. When determinant transfer is used, the Bismut-Lebeau transfer ledger of Definition U.15g through Corollary U.15j is also required. The five-mode $\kappa_{\mathrm{ref}}=141.5$ branch remains a reference convention blocked as theorem-level by Theorem U.8c in the Definition U.4 continuum action.
- Fine-structure predictions use the Appendix Z Thomson normalization certificate of Definition Z.27.11a when a certificate-complete Thomson interval is claimed.
- Electroweak matching uses an accepted forward-locked RHG record of Definition T.78.10 and Theorem T.78.11, an accepted torsion record of Definition T.78.5a and Theorem T.78.5b, an accepted spectral-action ledger of Definition X.9.6h.4 and Theorem X.9.6h.5, or an equivalent completed spectral tuple when a certificate-complete threshold or spectral-action Higgs finite-part value is claimed; Theorem T.78.14 gives the current PU-internal negative closure, so the present certificate interval for $\Delta_i$, $Z_i$, $\mu_H^2$, $\lambda_H$, and gauge/Higgs finite parts is $\varnothing_{\mathrm{cert}}$.
- Flavor and baryogenesis numerics use the flavor certificate of Definition T.79.4 and the baryogenesis transport certificate of Definition Y.11.7a when theorem-level numerical closure is claimed.
- Uncertainty budgets follow the paper-wide canonical T1 (truncation), T2 (threshold/vacuum), T3 (scheme/mapping) decomposition of Appendix T.25.5.3, with certificate-specific residual intervals fixed before comparison.
- External observations/payoffs include $\varepsilon$ and $\kappa_r$ costs at the observer boundary.
- Report-induced expectation protocols treat reports as provenance-marked context inputs. A false report may change the participant's physically instantiated expectation state, but it does not certify the reported outcome as true, does not rewrite a past measurement record, and can only be tested against target quantum outcomes generated after the expectation context has been formed under locked measurement settings. Human-subject deception requires prior consent procedures, ethics approval, and debriefing.

**Experimental handling of homogeneous spectral predictions.** A claimed electroweak spectral number is admissible only if its threshold, torsion, RHG, spectral-action, or equivalent completed spectral package is frozen before data comparison. The experimental row must list the finite-part convention, cutoff/tail bound, sector labels, projection ledger, grading, normalization map, master zeta-index label, and whether the value is a prediction, a fit, a no-entry certificate $\varnothing_{\mathrm{cert}}$, or a posterior consistency check.

**13.0a Operational Evidence Standard for CC and Statistical-Influence Tests**

**Definition 13.0a (CC Evidence Triage).** For each CC-facing protocol in Section 13, including Protocol 1, Protocol 1a, Protocol 3, Protocol L.1-L.3, or any statistical-influence experiment, define three mutually exclusive explanatory classes:
$$
H_0=\text{standard quantum/statistical null},
\qquad
H_{PU}=\text{PU CC effect under the stated protocol},
\qquad
H_{art}=\text{artifact, leakage, optional stopping, or uncontrolled selection}.
$$
Before outcome inspection, the protocol must also fix constants
$$
B_*>1,
\qquad
0<\rho_*<1,
$$
and a nonnegative artifact bound
$$
B_{art},
$$
where $B_*$ is the required support ratio, $\rho_*$ is the maximum allowed artifact fraction, and $B_{art}$ is the preregistered upper bound on the absolute artifact contribution inferred from sham runs, leakage tests, calibration drifts, and negative controls under the same analysis pipeline. A run is classified as **support** only if all of the following hold:

1. the primary endpoint, exclusion rules, stopping rule, and analysis statistic are fixed before outcome inspection;
2. the blind analysis gives Bayes factors or likelihood ratios satisfying
$$
BF_{PU,0}\ge B_*,
\qquad
BF_{PU,art}\ge B_*;
$$
3. the signed effect agrees with the protocol-level direction predicted before the run;
4. the residual artifact bound satisfies
$$
B_{art}\le \rho_* |\widehat\Delta|,
$$
where $\widehat\Delta$ is the blinded primary estimated effect under the preregistered analysis pipeline, and $\rho_*$ and $B_{art}$ are fixed before unblinding;
5. an independent replication using the same primary endpoint also satisfies items 1-4.

Classification is assigned by the following ordered rule. First, a run is classified as **failure** if $H_{art}$ is favored, the sign is inconsistent with the preregistered direction, the stopping or exclusion rule changes after outcome inspection, or the result fails the required independent replication. Among runs not classified as failure, a run is classified as **support** only if items 1–5 above all hold. Among the remaining runs, a run is classified as **null** if the preregistered confidence or posterior interval excludes the protocol target effect scale and no artifact class is favored. A run satisfying none of these clauses is classified as **inconclusive**.

**Proposition 13.0b (Mutual Exclusivity of Evidence Classes).** Under the ordered rule in Definition 13.0a, a completed run receives at most one of the labels support, null, and failure.

*Proof.* The first clause assigns every protocol-breaking or artifact-favored run to failure and removes it from later clauses. The second clause assigns support only among the remaining runs and removes those runs from the final clause. The third clause assigns null only among runs assigned neither of the preceding labels. Therefore no run can receive two of the three labels. ∎

**Corollary 13.0c (No Single-Run Upgrade for CC Claims).** No single experiment can promote Hypothesis 3 to theorem-level or established empirical status. At most, a single run can enter the support class of Definition 13.0a and become one datum in a replicated evidence ledger.

*Proof.* Definition 13.0a requires independent replication for support, and theorem-level status requires derivation from prior axioms and theorems rather than empirical frequency data. Therefore one run cannot by itself supply either replicated empirical support or theorem-level derivation. ∎

**Definition 13.0d (Forward-Locked Prediction Register).** A forward-locked prediction register is a finite table
$$
\mathfrak R_{\mathrm{pred}}
=
\left(
\mathcal P,
\mathcal C,
\mathcal I,
\mathcal E,
\mathcal F,
\chi_{\mathrm{pred}}
\right)
$$
where $\mathcal P$ is the list of predicted observables, $\mathcal C$ is the accepted certificate or theorem branch for each observable, $\mathcal I$ is the predicted numerical interval or qualitative falsifier, $\mathcal E$ is the evidence protocol, $\mathcal F$ is the falsification rule, and $\chi_{\mathrm{pred}}$ records that no entry was chosen from the validation data used to test it.

**Theorem 13.0e (No Validation Contamination).** A prediction listed in $\mathfrak R_{\mathrm{pred}}$ may be counted as forward PU evidence only if its branch or certificate was fixed before the validation data used to test it. If any branch entry, residual interval, normalization, or certificate component is selected after seeing the validation data, the entry remains a post-selection consistency check rather than forward evidence.

*Proof.* By Definition 13.0d, every forward-evidence entry is a pair consisting of a finite derivation certificate and a finite validation protocol. If the derivation certificate is fixed first, the validation data test an already determined interval or falsifier. If a certificate component is selected after the validation data are known, then the data participate in defining the interval being tested. Such a test is logically circular as forward evidence because the tested set is no longer independent of the observations. Therefore it can only be recorded as a post-selection consistency check. ∎

**Definition 13.0f (Prediction Status Class).** Every numerical claim in this paper carries one of the following four prediction statuses, and the status is recorded together with the predicted value.

1. **Derived-retrodictive.** The numerical value is derived from a closed PU branch but the corresponding measurement was already published before the derivation was completed. The claim counts as mathematical compression evidence in the sense of Convention P.14.1d but does not count as forward empirical evidence.

2. **Certificate-retrodictive.** The numerical value is derived from a closed strict PPI/PCE certificate in the sense of Convention P.14.1k, but the measurement target was already published before the certificate was accepted. The claim counts as certificate compression evidence but does not count as forward empirical evidence.

3. **Forward-locked.** The exact value, certificate, and residual interval are fixed and entered into the forward-locked prediction register $\mathfrak R_{\mathrm{pred}}$ of Definition 13.0d before the relevant validation data are collected, and $\chi_{\mathrm{pred}}$ is satisfied.

4. **Prospective-confirmed or prospective-falsified.** A forward-locked prediction has met its evidence rule under Definition 13.0a or has failed its falsification rule under $\mathcal F$ in Definition 13.0d. Only this status counts as completed forward empirical evidence.

**Theorem 13.0g (Forward-Lock Necessity for Empirical Promotion).** A prediction listed in $\mathfrak R_{\mathrm{pred}}$ may be promoted to status 4 of Definition 13.0f only if it was first registered at status 3. Statuses 1 and 2 cannot be promoted directly to status 4 without an intervening forward-locked re-registration on a fresh measurement.

*Proof.* Status 4 requires the validation data to satisfy the evidence rule of Definition 13.0a or the falsification rule of $\mathcal F$ in Definition 13.0d, evaluated against an entry of $\mathfrak R_{\mathrm{pred}}$ that was fixed before the data were collected. Statuses 1 and 2 record retrodictive derivations against already-published targets; their entries do not satisfy the pre-comparison condition $\chi_{\mathrm{pred}}$ for those targets. Promotion of such an entry without a fresh forward-locked registration would require post-comparison fixing of certificate components, which is forbidden by Theorem 13.0e and Corollary Z.27.11d. The intervening forward-locked re-registration on a fresh measurement is exactly the registration of the same predicted value under status 3 against a target whose data are not yet collected. ∎

**Corollary 13.0h (Status Inheritance for Sector Outputs).** Each numerical row in Convention P.14.1k inherits a prediction status under Definition 13.0f from its certificate acceptance and its measurement history. A row with closure status "closed" and a published target before certificate acceptance is at most certificate-retrodictive; the same row with a forward-locked registration before fresh measurement is at most forward-locked, and at most prospective-confirmed or prospective-falsified after the evidence rule is met.

*Proof.* Status under Definition 13.0f depends on three independent records: closure of the strict PPI/PCE certificate, the time order of certificate acceptance relative to the measurement target, and the satisfaction of the evidence rule. The certificate closure controls statuses 1 versus 2. The time order controls status 3. The evidence rule controls status 4. Each row inherits its status as the deterministic image of these three records by Definition 13.0f and Theorem 13.0g. ∎

**Corollary 13.0f (Certificate Failure Rule).** If an observable fails the interval or falsifier associated with its accepted certificate in $\mathfrak R_{\mathrm{pred}}$, the corresponding branch is demoted or rejected. The interval may not be widened by replacing the certificate after comparison.

*Proof.* The interval and falsifier are entries of the fixed register. Replacing the certificate changes the register entry and therefore changes the branch under test. It cannot rescue the failed branch as the same prediction. ∎

**Definition 13.0i (Discriminating Multi-Lock Witness).** A discriminating multi-lock witness is a forward-locked prediction-register entry
$$
\mathfrak W_{\mathrm{ML}}
=
(X_{\mathrm{value}},X_{\mathrm{shape}},X_{\mathrm{null}},X_{\mathrm{unit}},
\mathcal A_{\mathrm{art}},
\chi_{\mathrm{ind}})
\tag{13.0i.1}
$$
where $X_{\mathrm{value}}$ is the predicted value or finite-combinatorial pattern, $X_{\mathrm{shape}}$ is a signed, scaling, incidence, phase-grid, or spectrum-shape prediction not reducible to one scalar fit, $X_{\mathrm{null}}$ is the preregistered null-control or label-swap pattern, $X_{\mathrm{unit}}$ is the common PU unit bridge consumed by the prediction, $\mathcal A_{\mathrm{art}}$ is the artifact-control ledger implementing Definition 13.0a, and $\chi_{\mathrm{ind}}$ records that the value, shape, null, unit, and artifact entries are fixed independently of the validation data and of one another except through the named PU derivation branch. A witness is support-class only if the value, shape, null-control, unit-bridge, and artifact-control entries all satisfy their registered intervals or qualitative falsifiers under the same unmodified certificate.

**Theorem 13.0j (No Ad-Hoc Rescue for Multi-Lock Witnesses).** If a registered multi-lock witness of Definition 13.0i fails any of $X_{\mathrm{value}}$, $X_{\mathrm{shape}}$, $X_{\mathrm{null}}$, $X_{\mathrm{unit}}$, or $\mathcal A_{\mathrm{art}}$ under its locked evidence protocol, the same witness cannot be rescued by changing a normalization, unit bridge, null-control class, residual interval, or artifact model after unblinding. Such a change defines a new branch or a new protocol entry.

*Proof.* Each listed component is part of the forward-locked record $\mathfrak W_{\mathrm{ML}}$. Changing any component after outcome inspection changes the tested object. Theorem 13.0e forbids counting such a changed object as forward evidence for the original prediction, and Corollary 13.0f prevents widening the failed interval or replacing the falsifier while retaining the same branch identity. ∎

**Corollary 13.0k (Landauer-Ledger Constellation Standard).** When distinct protocols consume the same structural source constant $\varepsilon_0=\ln2$ through independent finite-response maps, their joint evidential value is recorded as a Landauer-ledger constellation only if each row separately satisfies Definition 13.0i and the common structural source $\varepsilon_0$ is inherited from Proposition 5 and Theorem J.1 rather than refit per platform. Any physical reset row must separately satisfy Definition 28 and Theorem 31. Examples of such rows include metered actualization thresholds, retained entropic clock-flow, conditional horizon phase grids, and finite record-current TUR tests. Failure of one branch-level row falsifies the named row or bridge; failure of a theorem-level row under a closed certificate falsifies the corresponding theorem stack.

*Proof.* Definition 13.0i requires every witness row to carry its own value, shape, null, unit, and artifact locks. Sharing the source label $\varepsilon_0$ cannot discharge any of those row-specific requirements. Proposition 5 and Theorem J.1 supply the structural value $\varepsilon_0=\ln2$ independently of the platforms, so a platform-level refit would replace the common source by separate empirical parameters and would not define a constellation. A row interpreted as physical reset heat must additionally satisfy Definition 28 and Theorem 31. Finally, Theorem 13.0j and Corollary 13.0f apply to each registered row separately, giving the stated branch-level and theorem-level failure consequences. ∎

**Definition 13.0l (Prediction Map and Whitened Tangent).** Let a forward-locked branch have coordinates $\theta\in\Theta\subset\mathbb R^p$ and predict $m$ registered observables through a $C^1$ map
$$
F:\Theta\to\mathbb R^m.
\tag{13.0l.1}
$$
At $\theta_*$, let the registered covariance be $\mathsf C\succ0$ and define
$$
A=\mathsf C^{-1/2}DF(\theta_*),
\qquad
\Pi_\perp=I_m-AA^+.
\tag{13.0l.2}
$$

**Theorem 13.0m (Prediction-Manifold Codimension).** Suppose $DF$ has constant rank $r$ in a neighborhood of $\theta_*$. After restricting to that local branch, $F(\Theta)$ is an immersed $r$-dimensional prediction manifold in observable space and possesses $m-r$ locally independent empirical relations. The matrix $\Pi_\perp$ is the unique covariance-whitened orthogonal projector onto their first-order normal space:
$$
\Pi_\perp^T=\Pi_\perp,
\qquad
\Pi_\perp^2=\Pi_\perp,
\qquad
\operatorname{rank}\Pi_\perp=m-r.
\tag{13.0m.1}
$$
For an affine prediction map with a Gaussian measurement $Y\sim N(F(\theta_*),\mathsf C)$,
$$
\chi_\perp^2
=
\left\lVert\Pi_\perp\mathsf C^{-1/2}(Y-F(\theta_*))\right\rVert_2^2
\sim\chi^2_{m-r}.
\tag{13.0m.2}
$$
For an asymptotic sequence $Y_N\sim N(F(\theta_*),\mathsf C/N)$, suppose $\theta_*$ is interior to a preregistered constant-rank neighborhood $\Theta_*\subset\Theta$ and that the minimum in (13.0m.3) is attained by a consistent local minimizer $\widehat\theta_N$ profiling the rank-$r$ coordinates within $\Theta_*$. Then
$$
\chi_{\mathrm{prof},N}^2
=
N
\min_{\theta\in\Theta_*}
\left\lVert\mathsf C^{-1/2}(Y_N-F(\theta))\right\rVert_2^2
\tag{13.0m.3}
$$
converges in distribution to $\chi^2_{m-r}$.

*Proof.* Definition 13.0l makes $F$ a $C^1$ map, $DF$ has constant rank $r$ by hypothesis, and $\theta_*$ is an interior point. The constant-rank theorem [Bott & Tu 1982] therefore supplies local domain and codomain coordinates in which the image has $r$ free coordinates and $m-r$ zero coordinates. Pulling the latter coordinates back gives $m-r$ local relations with linearly independent differentials, proving the manifold and relation count.

Take a reduced singular-value decomposition
$$
A=U_r\Sigma_rV_r^T,
\qquad
\Sigma_r=\operatorname{diag}(\sigma_1,\ldots,\sigma_r),
\qquad
\sigma_j>0.
$$
Then $A^+=V_r\Sigma_r^{-1}U_r^T$, so
$$
AA^+=U_rU_r^T.
$$
This matrix is symmetric, idempotent, and has rank $r$; it is the unique orthogonal projector onto $\operatorname{ran}A$. Consequently $\Pi_\perp=I-U_rU_r^T$ is symmetric, idempotent, has rank $m-r$, and projects onto the covariance-whitened normal space. This proves (13.0m.1).

In the affine case put $Z=\mathsf C^{-1/2}(Y-F(\theta_*))$. Then $Z\sim N(0,I_m)$. Extend the columns of $U_r$ to an orthogonal matrix $U=(U_r,U_\perp)$. Since
$$
\Pi_\perp Z=U_\perp U_\perp^TZ,
$$
the coordinates of this vector in the $U_\perp$ basis are $m-r$ independent $N(0,1)$ variables. Their squared sum is $\chi^2_{m-r}$, proving (13.0m.2).

For the nonlinear assertion, use the constant-rank coordinates to parametrize the local image by $t\in\mathbb R^r$, with $t=0$ representing $\theta_*$. Define
$$
g(t)=\mathsf C^{-1/2}\bigl(F(\theta(t))-F(\theta_*)\bigr)
=Bt+R(t),
$$
where $B$ has full column rank, $\operatorname{ran}B=\operatorname{ran}A$, and $\|R(t)\|/\|t\|\to0$ as $t\to0$ by differentiability. Let $s_{\min}>0$ be the least singular value of $B$. There is a neighborhood of zero on which
$$
\|R(t)\|\le\frac{s_{\min}}2\|t\|,
\qquad
\|g(t)\|\ge\frac{s_{\min}}2\|t\|.
\tag{13.0m.4}
$$
Put $Z_N=\sqrt N\,\mathsf C^{-1/2}(Y_N-F(\theta_*))$, so $Z_N\sim N(0,I_m)$ for every $N$, and let $\widehat t_N$ be the rank-coordinate representation of $\widehat\theta_N$. Consistency gives $\widehat t_N\to0$ in probability. Since the objective at the minimizer is no larger than its value at $t=0$,
$$
\|Z_N-\sqrt N\,g(\widehat t_N)\|\le\|Z_N\|.
$$
The triangle inequality and (13.0m.4) then give
$$
\sqrt N\,\|\widehat t_N\|
\le
\frac{4}{s_{\min}}\|Z_N\|,
$$
with probability tending to one. Hence $\widehat s_N:=\sqrt N\,\widehat t_N=O_p(1)$.

For every finite $M$,
$$
\sup_{\|s\|\le M}\left\|\sqrt N\,R\!\left(\frac{s}{\sqrt N}\right)\right\|
\le
M\sup_{0<\|t\|\le M/\sqrt N}\frac{\|R(t)\|}{\|t\|}
\longrightarrow0.
$$
Thus, uniformly for bounded $s$,
$$
\left\|Z_N-Bs-\sqrt N\,R\!\left(\frac{s}{\sqrt N}\right)\right\|^2
=\|Z_N-Bs\|^2+o_p(1).
$$
Both $\widehat s_N$ and the unique quadratic minimizer $B^+Z_N$ are $O_p(1)$, so the uniform estimate applies at both minimizers and yields
$$
\chi_{\mathrm{prof},N}^2
=
\min_{s\in\mathbb R^r}\|Z_N-Bs\|^2+o_p(1)
=
\|(I-BB^+)Z_N\|^2+o_p(1).
$$
Because $\operatorname{ran}B=\operatorname{ran}A$, one has $BB^+=AA^+$ and $I-BB^+=\Pi_\perp$. The leading term is therefore $\chi^2_{m-r}$ for every $N$, and Slutsky's theorem [van der Vaart 1998], whose required additive remainder is the displayed $o_p(1)$ term, proves convergence in distribution in (13.0m.3). ∎

**Corollary 13.0n (No Double Counting and Singular-Branch Rule).** When rank-$r$ branch coordinates are fitted or profiled from the same $m$-observable block, that block contributes $m-r$, not $m$, independent model-relation residual directions. If $\theta_*$ is specified independently before the block is observed, the full affine Gaussian point-prediction statistic $\lVert\mathsf C^{-1/2}(Y-F(\theta_*))\rVert^2$ has $m$ degrees of freedom; $\chi_\perp^2$ tests only its $m-r$ cross-observable normal relations. Registered residual intervals thicken the prediction manifold by their prespecified Minkowski set before the normal-distance statistic is evaluated. If the rank changes, a parameter lies on a boundary, the covariance is singular, or a discrete branch is selected after inspection, the $\chi^2_{m-r}$ calibration is not licensed; the branches must be profiled or tested separately under their preregistered mixture law.

*Proof.* Theorem 13.0m shows that profiling the $r$ tangent coordinates leaves the rank-$(m-r)$ normal projector $\Pi_\perp$, so the same observable block cannot contribute both those $r$ fitted directions and $m$ independent residual directions. If $\theta_*$ is specified without using the block, the full whitened residual is $N(0,I_m)$ on the affine Gaussian branch, and its squared norm is $\chi_m^2$; applying $\Pi_\perp$ retains only the $m-r$ normal coordinates. If the allowed residual set is $R$, the allowed prediction set is $F(\Theta)+R$, the Minkowski sum, so distance must be taken to that enlarged set. Rank change invalidates the constant-rank chart, a boundary point invalidates the interior localization, singular covariance invalidates $\mathsf C^{-1/2}$, and post-inspection branch selection invalidates the preregistered single-branch law. Theorem 13.0m therefore supplies no $\chi^2_{m-r}$ conclusion in any of those four cases. ∎

**13.1 Conditional Branch 1: Potential Born-Rule Deviations**

Hypothesis 3 nominates a CC-dependent response map for systems $S$ with $C_{\mathrm{agg}}>C_{\mathrm{op}}$ and operational $\mathrm{CC}(S)>0$. The core theory permits $\mathrm{CC}(S)=0$ and does not prove that the nominated map is nonzero. Theorem 51 therefore gives normalization and upper bounds for a supplied CC-dependent response; it does not predict the sign, magnitude, or statistical significance of a realized deviation without a forward-locked realization certificate.

**13.1.1 Theorem 51 (Quantitative Born Rule Deviation Prediction)**

Consider a quantum system prepared in state $\rho$ (pure case $\rho=\lvert\psi\rangle\!\langle\psi\rvert$) measured by a POVM $\{E_i\}_{i=1}^n$. Let $P_{\mathrm{Born}}(i)=\mathrm{tr}(\rho E_i)$ be the Born probability of outcome $i$. If this interaction occurs within the influencing context $\text{context}_S(i)$ provided by an MPU aggregate system $S$ possessing operational $\mathrm{CC}(S)>0$, the predicted observable probability $P_{\mathrm{obs}}(i)$ is

$$
P_{\mathrm{obs}}(i)=P_{\mathrm{Born}}(i)+\Delta P(i)\quad \text{(77)}
$$

where the deviation is generated by the probability-modification maps of Definition 33:

$$
\Delta P(i)=\mathrm{tr}\!\big(L_S(\rho)\,E_i\big)=\mathrm{tr}\!\big(\rho\,K_S(E_i)\big),\qquad K_S(I)=0 \quad \text{(78)}
$$

and the deviation magnitude is bounded by the operational CC budget of Definition 30 and Theorem 36:
$$
\mathrm{TV}(p,q)\le\mathrm{CC}(S),
\qquad
|\Delta P(i)|\le\mathrm{CC}(S)
\quad
\forall i.
$$
Consequently, for an observed per-outcome shift $\delta=|\Delta P(i)|$, an exact lower bound is
$$
\mathrm{CC}(S)\ge\delta.
$$
On the stricter Fisher-budget subbranch of Theorem 36, where $d_{\mathrm{FR}}(p,q)\le\mathrm{CC}(S)$, one has
$$
\mathrm{TV}(p,q)\le\sin(\mathrm{CC}(S)/2),
$$
and therefore, for every outcome $i$,
$$
|\Delta P(i)|\le\mathrm{TV}(p,q)\le\sin(\mathrm{CC}(S)/2).
$$
The componentwise Hellinger estimate $|\Delta P(i)|\le4\sin(\mathrm{CC}(S)/4)$ is also valid but is weaker. For $0\le\mathrm{CC}(S)<\pi$, an observed per-outcome shift $\delta$ gives the Fisher-branch lower bound
$$
\mathrm{CC}(S)\ge2\arcsin\delta.
$$
For $\mathrm{CC}(S)\ll1$, the bounds are $\mathrm{TV}(p,q)\le\mathrm{CC}(S)/2+O(\mathrm{CC}(S)^3)$ and $|\Delta P(i)|\le\mathrm{CC}(S)/2+O(\mathrm{CC}(S)^3)$.

*Remark on numerical impact.* The operational estimate is $\mathrm{CC}(S)\ge\delta$. On the Fisher-budget subbranch, the stronger estimate is
$$
\mathrm{CC}(S)\ge2\arcsin\delta
=2\delta+\frac13\delta^3+O(\delta^5).
$$
Thus the Fisher-branch lower bound is twice the operational lower bound at leading order, not equal to it. The QRNG protocols must report this estimate only when the Fisher-distance certificate is independently accepted.

*Remark:* The operational shift bound is Definition 30 applied to the retained event algebra; the Fisher-Rao formulas are the sharper geodesic estimates available on the stricter Fisher-budget subbranch recorded in Theorem 36.


Using the **Context-Targeted Bias (CTB)** model (Definition 34), where the context defines a target state $\sigma_S$ and $p_{\mathrm{target}}(S,i)=\mathrm{tr}(\sigma_S E_i)$, the deviation takes the form

$$
\Delta P(i)=\frac{\mathrm{CC}(S)}{r(\sigma_S)}\,\big(p_{\mathrm{target}}(S,i)-P_{\mathrm{Born}}(i)\big),\qquad
r(\sigma_S)=1-\lambda_{\min}(\sigma_S)
\quad \text{(79)}
$$

*Proof:* (77) is the definition of observable probability in the presence of context. The representation (78) follows from Definition 33 and Definition 30: $L_S$ acts on states, $K_S=L_S^*$ acts on effects, and $K_S(I)=0$ ensures normalization. The operational bound $|\Delta P(i)|\le\mathrm{CC}(S)$ follows from Theorem 36, which applies the Definition 30 operator norm to every retained effect $E_i$. The Fisher-Rao estimates follow from the stricter Fisher-budget subbranch of Theorem 36. The CTB expression (79) is Definition 34 with $p_{\mathrm{target}}(S,i)=\mathrm{tr}(\sigma_S E_i)$ and $\alpha_S=\mathrm{CC}(S)/r(\sigma_S)$. QED


## 13.2 Protocol 1: Accessible Born Rule Tests (QRNGs)

This protocol outlines a high-statistics, exploratory search for Born rule deviations (Theorem 51) using quantum random number generators (QRNGs) interacting with high-complexity systems (biological or potentially artificial).

*   **Objective:** To search for statistically significant deviations from non-uniform baseline Born rule probabilities in QRNG or retained finite-POVM outputs that are correlated with the controlled internal state ($\text{context}_S$) of a proximate system S (human participant or specialized AI system) hypothesized to have $\mathrm{CC}(S)>0$ on the strict-improvement branch of Theorem 34. For a binary QRNG, non-uniform means $p\ne1/2$; for an $m$-outcome retained POVM, it means that the baseline Born vector is not the uniform vector $(1/m,\ldots,1/m)$. Non-uniform baselines are preferred because they may facilitate detection of small shifts relative to systematic noise and drift. When a CTB target state $\sigma_S$ is **pre-registered** before data collection, so that the induced target-displacement direction
    $$
    v_i=p_i^{\mathrm{tar}}-p_i,
    \qquad
    p_i^{\mathrm{tar}}=\mathrm{tr}(\sigma_S E_i),
    \qquad
    p_i=\mathrm{tr}(\rho E_i),
    $$
is fixed in the analysis plan, the primary discriminant is not merely a scalar bias but the vector-shape law of Corollary 37a: the observed multinomial shift must be collinear with $v$ and must have no retained component orthogonal to that target direction. This orthogonal-residual falsifier is informative for retained multi-outcome tests, or for jointly registered families of binary channels, where the shift space has more than one retained direction. Pre-registration of $v$ is essential to the falsifier — without it, a post-hoc choice of target can be made to absorb whatever shape the observed shift has, defeating the discriminator.

*   **Experimental Setup:**
    1.  **QRNG:** Well-characterized QRNG producing stable, verifiable baseline probabilities $P_{\mathrm{Born}}(i) \neq 0.5$ for some outcome $i$. Multiple parallel QRNGs can increase data rate.

2.  **High-Complexity System (S):**
    *   *Biological:* Human participant performing standardized tasks generating specific internal states ($\mathrm{context}_S$, e.g., focused attention/intention). Optional physiological monitoring (EEG, fMRI, HRV).
    *   *Artificial:* Sophisticated AI system. Major Challenge: Designing and verifying the physical interaction pathway $N(t)$ coupling the AI's internal $\text{context}_S$ (Definition L.1) to the QRNG's physical process, respecting constraints (speed, cost $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$, PCE, orthogonality to noise, mapping stability Theorem L.1). The implementation record must fix the source spectrum and geometry, target coupling and detuning, coherence window, shielding, and likelihood map before an electromagnetic-to-gravitational channel ratio can be computed. Theorem L.2 gives a conditional coherent-field implementation, while effective Proposition L.5 supplies no universal dominance factor. Trial counts must be computed from the registered effect size, significance, power, multiplicity correction, and dependence model using the effective Protocol L.1. Appendix S supplies a gravitational-feedback benchmark only on its retained-energy, weak-field, and calibrated-response branches. This requires significant R&D and confirmation of both $C_{agg}>C_{op}$ and the strict-improvement and representability conditions needed for potential nonzero CC.
3.  **Interaction Control & Shielding:** Meticulous shielding (EM, thermal, acoustic, vibration). Well-defined interaction pathway $N(t)$. Measurement and control/compensation for conventional physical side-effects from S. Continuous environmental monitoring.
    4.  **Automation & Data Acquisition:** Automated randomization of conditions (baseline, neutral, specific context runs), synchronized recording of QRNG outcomes and $\mathrm{context}_S$ indicators, precise timestamps, secure storage for large datasets ($10^7 - 10^9+$ trials). Mandatory blinding procedures.

*   **Procedure:**
    1.  **Baseline Characterization:** Extensive data collection establishing baseline $P_{\mathrm{Born}}(i)$, stability, and noise levels.
    2.  **Intervention Runs:** Randomized block design interleaving conditions (Baseline, Neutral Context, Specific Context). Collect large $N_{int}$ trials per condition.
    3.  **Control Conditions:** Include sham interaction runs (pathway $N(t)$ disabled) to control for conventional influences.

*   **Statistical Analysis and Power:** Notation and design assumptions for the pre-registered tests below. In this section, $\alpha_{\mathrm{sig}}$ and $\beta_{\mathrm{II}}$ denote the type-I and type-II error probabilities; these are distinct from the Space-of-Becoming viability parameters $(\alpha,\beta)$ (Axiom 3) and from the fine-structure constant $\alpha$ in Section 13.8.
*   **Target Sensitivity:** The experiment aims to resolve CC-induced deviations $\Delta P$ from a baseline Born probability $P_{\mathrm{Born}}(i)$ with two-sided type-I error $\alpha_{\mathrm{sig}} = 0.01$ and power $1-\beta_{\mathrm{II}} = 0.80$, using a pre-registered primary endpoint and analysis pipeline. If normal approximations are used, apply continuity correction or exact binomial methods as appropriate.
*   **Prospective Sample Sizes:** For a one-sample test comparing an observed proportion $p'$ in a context condition against a precisely calibrated baseline $p_0$ (treated as known), an asymptotic normal approximation gives:
    $$
    N \approx \frac{ \left[ Z_{1-\alpha_{\mathrm{sig}}/2} \sqrt{ p_0(1-p_0) } + Z_{1-\beta_{\mathrm{II}}} \sqrt{ p'(1-p') } \right]^2 }{ (p' - p_0)^2 }
    $$
    where $Z_p$ is the $p$-quantile of the standard normal distribution ($\Phi(Z_p)=p$). If $p_0$ is estimated rather than known, the baseline calibration variance must be propagated (analytically or by simulation) into the test and sample-size calculation. If residual autocorrelation is present, replace $N$ by an effective sample size $N_{\mathrm{eff}}$ estimated from the output ACF and inflate the target $N$ accordingly.
*   **Independence and Error Control:** Independence of trials will be rigorously assessed using autocorrelation functions (ACF), Ljung–Box tests, and Wald–Wolfowitz runs tests on the output streams and residuals. The NIST Statistical Test Suite [Bassham et al. 2010] will be applied to verify randomness properties. If correlations are detected, appropriate methods such as pre-whitening, block-bootstrap confidence intervals, or data thinning will be employed. Multiplicity of tests across outcomes or contexts will be controlled using standard methods (e.g., Bonferroni correction for family-wise error rate or Benjamini-Hochberg procedure for false discovery rate).
*   **Sequential Analysis:** For high-statistics runs, a sequential analysis plan with pre-specified interim looks using O’Brien–Fleming-type boundaries (implemented via the Lan-DeMets error spending function [Lan & DeMets 1983]) is recommended. This allows for early stopping due to efficacy or futility while preserving the overall type-I error rate. The table below provides indicative total sample sizes ($N_{OBF}$) per context and expected stopping distributions under the alternative hypothesis for three equally spaced looks.

| $\alpha_{\mathrm{sig}}$ | $\delta$ | $N_{\text{design}}$ | $N_{\text{OBF}}$ ($\approx 1.06 \times N_{\text{design}}$) | Expected stop % at looks 1/2/3 (under $H_1$) |
|---:|---:|---:|---:|:---|
| 0.01 | $10^{-3}$ | 2,191,242 | 2,322,717 | ~5% / 20% / 75% |
| 0.01 | $5 \times 10^{-4}$ | 8,762,099 | 9,287,825 | ~3% / 17% / 80% |
| 0.01 | $10^{-4}$ | 218,995,031 | 232,134,733 | $\lesssim 1$% / 10% / 89% |
| 0.001 | $10^{-3}$ | 3,203,231 | 3,395,425 | ~4% / 18% / 78% |
| 0.001 | $5 \times 10^{-4}$ | 12,809,459 | 13,578,027 | ~2% / 15% / 83% |
| 0.001 | $10^{-4}$ | 320,167,012 | 339,377,033 | $\lesssim 1$% / 9% / 90% |

*   *Assumptions for $N_{\rm design}$ in the table:* **One-sample proportion** design with baseline $p_0=0.25$, positive alternative $p'=p_0+\delta$, power $1-\beta_{\mathrm{II}}=0.80$, and $N_{\mathrm{design}}$ equal to the ceiling of the normal-approximation formula above.
    *   *Sequential design:* O'Brien–Fleming boundaries with **3 equally spaced** looks at cumulative information fractions $1/3, 2/3, 1$. The overhead factor (~1.06) and stop percentages are **illustrative**; exact values will be determined by the preregistered simulations and released with the code.

*   **Primary Analysis:** Pre-register goodness-of-fit tests (e.g., $\chi^2$, z-tests) comparing observed frequencies $\hat{P}(i)$ to the Born rule probabilities. Where applicable, exact binomial tests or variance-stabilized (arcsin–sqrt) transformations will complement normal approximations to ensure proper calibration, especially for small $\delta$. Design-stage baselines will use device-specific $P_{\mathrm{Born}}(i)$ estimates. Report effect sizes (Cramér’s V, Cohen’s d) with 95% CIs. For a CTB-specific multi-outcome test with pre-registered target vector
    $$
    v_i=P_{\mathrm{target}}(i)-P_{\mathrm{Born}}(i),
    $$
    also report the orthogonal residual
    $$
    R_\perp
    :=
    \left\|
    \left(I-\frac{vv^T}{\|v\|_2^2}\right)
    \widehat{\Delta\mathbf P}
    \right\|_2
    $$
    when $v\ne0$, or the corresponding covariance-weighted quadratic form using the multinomial covariance matrix fixed in the analysis plan. On the CTB branch, $R_\perp$ must be zero up to the registered sampling and device-systematics error; a stable orthogonal residual falsifies the CTB explanation even if a scalar bias is present.
    *   **Correlation Analysis:** Model $\Delta\hat{P}(i)$ as a function of contextual variables $\text{context}_S$ via mixed-effects logistic regression. For paired target-swap contexts satisfying Corollary 37a, pre-register the sign-reversal contrast $\widehat{\Delta P}_{S_+}(i)+\widehat{\Delta P}_{S_-}(i)$ as a control endpoint.
    *   **Systematic Error Control (Paramount):** (i) electronic drift (ii) detector after-pulsing (iii) clock-sync bias (iv) experimenter degrees-of-freedom (blinding).
    *   **Outcome:** Deviations that survive all controls give an empirical estimate of $\mathrm{CC}(S)$ (cf. Theorem 51); null results tighten the exclusion curve $\mathrm{CC}_{\max}(S) < \epsilon(N)$.

*   **Feasibility Assessment:** High statistics achievable. Shielding/control standard but requires extreme care. Biological context control depends on participants. AI interaction pathway is a major R&D challenge. Rigorous systematic error exclusion is the primary hurdle. Challenging but potentially feasible exploratory search.

## 13.2a Protocol 1a: Report-Induced Expectation Tests for Passive CC

This protocol is a controlled variant of Protocol 1. It tests whether a report-induced expectation inside a participant's perspective can become a physically instantiated context variable and weakly bias later quantum outcome frequencies. The tested claim is not that a false report becomes true, nor that a past observation is changed. The tested claim is that a true, false, or neutral report can produce a real expectation state in the aggregate $S_A$, and that this expectation state may enter the CC map on branches where expectation-context coupling is nonzero.

<a id="definition-132a1-report-induced-expectation-context"></a>

**Definition 13.2a.1 (Report-Induced Expectation Context).**

Let $S_A$ be a human or other high-complexity aggregate satisfying the same operational screening assumptions as Protocol 1. Let $\Omega=\{0,1\}$ for a binary QRNG, or a finite outcome alphabet for a retained finite POVM. On trial $t$, define:

1. $R_t\in\Omega$, a hidden reference/provenance record generated and locked before the report stage;
2. $E_t\in\Omega\cup\{\varnothing\}$, the report content delivered to Alice through an automated Bob-channel, with $\varnothing$ used for neutral no-target content;
3. $H_t\in\{\mathrm{true},\mathrm{false},\mathrm{neutral}\}$, the report-truth tag, with $H_t=\mathrm{true}$ iff $E_t\in\Omega$ and $E_t=R_t$, $H_t=\mathrm{false}$ iff $E_t\in\Omega$ and $E_t\ne R_t$, and $H_t=\mathrm{neutral}$ iff $E_t=\varnothing$;
4. $V_t\in\{\mathrm{seen},\mathrm{unseen},\mathrm{delayed}\}$, the visibility tag recording whether Alice receives the report before, never before, or only after the target quantum event;
5. $Y_t\in\Omega$, the target quantum outcome generated after the expectation window on seen trials and after the matched timing window on control trials;
6. $Z_t$, the locked apparatus, block, timing, environmental, and calibration covariates.

The reference record $R_t$ is not the target event $Y_t$, is not used to generate $Y_t$, and does not define the correctness of $Y_t$. It is only the provenance record used to construct true or false report content. The tested correlation is between Alice's physically instantiated expectation from $E_t$ and the later generated target outcome $Y_t$.

The report-induced expectation context is the retained component
$$
\chi_A(t)
=
\chi\bigl(\mathrm{context}_{S_A}(t)\mid E_t,V_t,Z_t\bigr)
\quad \text{(79a)}
$$
formed after report delivery and before the target event $Y_t$. On blinded true/false trials, $H_t$ is not available to Alice and is therefore not an input to $\chi_A(t)$ except through any ordinary leakage channel, which the protocol must bound separately. A false report may change $\chi_A(t)$ without changing $R_t$ and without certifying $E_t$ as a true measurement record.

<a id="prediction-132a2-expectation-mediated-cc-branch"></a>

**Prediction 13.2a.2 (Expectation-Mediated CC Branch).**

Under the standard quantum null, once $Z_t$ is fixed and ordinary artifacts are closed,
$$
\Pr(Y_t=i\mid E_t,H_t,V_t,Z_t)
=
P_{\mathrm{Born}}(i\mid Z_t)
\quad \text{(79b)}
$$
for all report contents, truth tags, and visibility tags.

On the expectation-mediated CC branch, when $V_t=\mathrm{seen}$ and the report induces a retained expectation context $\chi_A(E_t)$, the target distribution may instead be
$$
\Pr(Y_t=i\mid E_t,V_t=\mathrm{seen},Z_t)
=
P_{\mathrm{Born}}(i\mid Z_t)
+
\Delta_{\chi_A(E_t)}(i),
\quad \text{(79c)}
$$
where the deviation obeys the operational CC budget
$$
\frac12\sum_i|\Delta_{\chi_A(E_t)}(i)|\le \mathrm{CC}(S_A),
\qquad
|\Delta_{\chi_A(E_t)}(i)|\le \mathrm{CC}(S_A),
\qquad
\sum_i\Delta_{\chi_A(E_t)}(i)=0.
\quad \text{(79d)}
$$
On the CTB subbranch of Definition 34, the expectation context selects a target state $\sigma_{E_t}$ and an expectation-internalization coefficient $\eta_\chi(E_t)\in[0,1]$, giving
$$
\Delta_{\chi_A(E_t)}(i)
=
\frac{\eta_\chi(E_t)\,\mathrm{CC}(S_A)}{r(\sigma_{E_t})}
\left(
\mathrm{tr}(\sigma_{E_t}E_i)-\mathrm{tr}(\rho E_i)
\right),
\qquad
r(\sigma_{E_t})=1-\lambda_{\min}(\sigma_{E_t}).
\quad \text{(79e)}
$$
The saturated CTB subbranch is the special case $\eta_\chi(E_t)=1$.

The report-truth tag $H_t$ is not the causal variable in (79c). The causal candidate is the physically instantiated expectation context $\chi_A(E_t)$. Therefore the diagnostic branch prediction is alignment with the report content $E_t$ on seen trials, including false-report trials, and no corresponding alignment on unseen or delayed-report controls.

<a id="protocol-1a1-false-true-report-qrng-expectation-test"></a>

**Protocol 1a.1 (False/True Report QRNG Expectation Test).**

*   **Objective:** To test whether report-induced expectation produces a bounded Born-rule deviation in later QRNG or finite-POVM outcomes. The participant is not instructed to intentionally bias the device. The active context variable is passive expectation created by the report.

*   **Experimental Setup:**
    1.  **Target quantum device:** A well-characterized QRNG or retained finite-POVM device with locked settings and stable baseline probabilities $P_{\mathrm{Born}}(i\mid Z_t)$. Balanced binary QRNGs are allowed, but non-uniform or multi-outcome baselines are preferred when they improve drift diagnostics.
    2.  **Reference generator:** An independent generator produces $R_t$ before the report stage. $R_t$ is locked in the forward record, is not the later target event, and is not used to generate $Y_t$.
    3.  **Automated Bob-channel:** The report channel assigns each trial to true, false, neutral, unseen, or delayed-report status according to a preregistered randomization schedule. Human operators must not know $H_t$ during data collection.
    4.  **Participant aggregate $S_A$:** Alice receives report content $E_t$ on seen trials and forms an expectation during a fixed expectation window. Optional confidence, attention, EEG, HRV, pupil, reaction-time, or other physiological markers may be recorded as secondary covariates, but they cannot redefine the primary endpoint after outcome inspection.
    5.  **Blinding and ethics:** Alice is blinded to the true/false assignment. Analysts are blinded to report labels until the analysis code and exclusion ledger are frozen. Any use of false reports with human participants requires consent procedures, ethics review, and debriefing.

*   **Procedure:**
    1.  **Baseline calibration:** Collect device-only data to estimate $P_{\mathrm{Born}}(i\mid Z_t)$, drift, autocorrelation, detector asymmetry, and environmental sensitivity.
    2.  **Trial construction:** For each trial or block, generate and lock $R_t$, assign the report condition, generate and lock $E_t$, $H_t$, and $V_t$, deliver $E_t$ only when the assigned condition requires delivery before the target event, wait through the fixed expectation window on seen trials, and only then generate and lock the target outcome $Y_t$.
    3.  **True-report arm:** Set $E_t=R_t$ and show $E_t$ before $Y_t$.
    4.  **False-report arm:** Set $E_t\ne R_t$ and show $E_t$ before $Y_t$.
    5.  **Unseen/report-only control:** Generate and lock the same report record but do not show it to Alice before $Y_t$.
    6.  **Delayed-report control:** Generate and lock $E_t$, $H_t$, and the report condition before $Y_t$, but withhold the report from Alice until after $Y_t$ is generated and locked. If delayed content is generated operationally after $Y_t$, it must be generated from a seed committed before $Y_t$ and unavailable to the outcome-recording process.
    7.  **Neutral control:** Present report-neutral content with matched timing, attention demand, and sensory load.
    8.  **Target-swap balance:** Counterbalance $E_t=0$ and $E_t=1$ or the corresponding multi-outcome target labels so that any genuine report-direction effect must reverse with the report content.

*   **Primary Endpoint, Binary Balanced Case:** For a balanced binary target with $P_{\mathrm{Born}}(Y_t=E_t)=1/2$ on target-labelled trials, define
$$
A_t=\mathbf 1\{Y_t=E_t\}.
\quad \text{(79f)}
$$
The primary false-report effect is
$$
\delta_{\mathrm{false}}
=
\mathbb E[A_t\mid H_t=\mathrm{false},V_t=\mathrm{seen}]
-
\mathbb E[A_t\mid H_t=\mathrm{false},V_t=\mathrm{unseen}].
\quad \text{(79g)}
$$
The standard null predicts $\delta_{\mathrm{false}}=0$. The expectation-mediated branch with report-direction alignment predicts a preregistered nonzero sign, usually $\delta_{\mathrm{false}}>0$ when the target state is defined as the report-matching outcome.

*   **Primary Endpoint, Non-Uniform or Multi-Outcome Case:** Let
$$
p_{E_t}^{\mathrm{Born}}(Z_t)=P_{\mathrm{Born}}(Y_t=E_t\mid Z_t).
$$
Use the centered report-match score
$$
S_t=\mathbf 1\{Y_t=E_t\}-p_{E_t}^{\mathrm{Born}}(Z_t).
\quad \text{(79h)}
$$
The primary false-report contrast is
$$
D_{\mathrm{false}}
=
\mathbb E[S_t\mid H_t=\mathrm{false},V_t=\mathrm{seen}]
-
\mathbb E[S_t\mid H_t=\mathrm{false},V_t=\mathrm{unseen}].
\quad \text{(79i)}
$$
For a retained multi-outcome CTB test, the full vector shift
$$
\widehat{\Delta\mathbf P}_{e}
=
\widehat{\mathbf P}(Y_t=\cdot\mid E_t=e,V_t=\mathrm{seen})
-
\widehat{\mathbf P}_{\mathrm{Born}}(\cdot)
\quad \text{(79j)}
$$
must be tested against the preregistered target-displacement vector
$$
v^{(e)}_i
=
p^{\mathrm{tar}}_{e,i}
-
p_i,
\qquad
p^{\mathrm{tar}}_{e,i}=\mathrm{tr}(\sigma_eE_i),
\qquad
p_i=\mathrm{tr}(\rho E_i).
\quad \text{(79k)}
$$
As in Protocol 1, the CTB branch requires the orthogonal residual
$$
R_{\perp,e}
=
\left\|
\left(I-\frac{v^{(e)}(v^{(e)})^T}{\|v^{(e)}\|_2^2}\right)
\widehat{\Delta\mathbf P}_{e}
\right\|_2
\quad \text{(79l)}
$$
to vanish up to the preregistered sampling and device-systematics budget whenever $v^{(e)}\ne0$.

*   **Secondary Analyses:**
    1.  **Report-content alignment:** On false-report trials, the shift should align with $E_t$, not with the hidden reference record $R_t$.
    2.  **Visibility gate:** Seen reports may show the effect; unseen and delayed reports should not.
    3.  **Confidence modulation:** If confidence is preregistered as a covariate, stronger internalization of $E_t$ may scale the effect, but this is secondary unless fixed as the primary endpoint before data collection.
    4.  **Truth-tag independence:** Conditional on being seen and internalized, true and false reports may produce the same report-direction effect. A dependence on $H_t$ alone suggests leakage, artifact, or an ordinary information channel rather than passive expectation-mediated CC.
    5.  **Target-swap sign reversal:** If report labels are swapped, the signed effect must reverse. A fixed device-channel bias independent of $E_t$ fails this discriminator.

*   **Statistical Analysis and Power:** The primary analysis must be preregistered and run on locked data. For a one-arm balanced binary test against a known $1/2$ baseline, an approximate required sample size for detecting $|\delta|$ with two-sided type-I error $\alpha_{\mathrm{sig}}$ and power $1-\beta_{\mathrm{II}}$ is
$$
N_{\mathrm{one}}
\approx
\frac{\left(Z_{1-\alpha_{\mathrm{sig}}/2}+Z_{1-\beta_{\mathrm{II}}}\right)^2}{4\delta^2}.
\quad \text{(79m)}
$$
For the equal-allocation two-arm seen-versus-unseen contrast in (79g), the approximate total sample size is
$$
N_{\mathrm{two}}
\approx
\frac{\left(Z_{1-\alpha_{\mathrm{sig}}/2}+Z_{1-\beta_{\mathrm{II}}}\right)^2}{\delta^2}.
\quad \text{(79n)}
$$
If autocorrelation, block effects, participant effects, or drift are present, replace $N$ by an effective sample size $N_{\mathrm{eff}}$ and use mixed-effects logistic or multinomial regression with participant, block, device, and time as preregistered effects.

*   **Evidence Rule:** A positive Protocol 1a result requires all of the following:
    1.  the false-report seen contrast (79g) or (79i) satisfies the preregistered support rule of Definition 13.0a;
    2.  unseen and delayed-report controls are null within their preregistered intervals;
    3.  the signed effect follows report content $E_t$, including on false-report trials;
    4.  target-swap conditions show the registered sign reversal;
    5.  environmental, timing, software, operator, device-drift, and leakage ledgers satisfy the artifact bound $B_{art}\le\rho_*|\widehat\Delta|$ from Definition 13.0a;
    6.  an independent replication satisfies the same primary endpoint.

*   **Falsification Rule:** A null result with a confidence or posterior interval excluding the registered effect scale falsifies the expectation-mediated CC branch at that scale for the tested aggregate, device, and expectation-induction class. A result is classified as artifact or failure, not support, if the effect appears in unseen or delayed-report controls, tracks $R_t$ rather than $E_t$ on false-report trials, fails target-swap reversal, depends on post-hoc exclusions, or correlates with ordinary device/environment channels.

*   **CC Extraction:** For a binary report-match shift $\widehat{\delta}_{\mathrm{false}}$, if unseen and delayed-report controls are null within the preregistered tolerance, then $|\widehat{\delta}_{\mathrm{false}}|$ estimates the seen-context Born-rule shift and the conservative operational estimate is
$$
\widehat{\mathrm{CC}}_{\mathrm{op}}\ge |\widehat{\delta}_{\mathrm{false}}|.
\tag{79o}
$$
On the Fisher-budget subbranch, the stronger estimate is
$$
\widehat{\mathrm{CC}}_{\mathrm{Fisher}}
\ge
2\arcsin(|\widehat{\delta}_{\mathrm{false}}|).
\tag{79p}
$$
If the control arms are not null, the contrast alone does not license Protocol 1a support; at most it implies that at least one compared arm carries a context-dependent shift of size at least $|\widehat{\delta}_{\mathrm{false}}|/2$, subject to the artifact ledger. For multi-outcome tests, use the preregistered pointwise, total-variation, or CTB-vector norm corresponding to Theorem 51 and Corollary 37a.

*   **Feasibility Assessment:** Protocol 1a is experimentally attractive because it avoids requiring active intention or deliberate biasing. It tests passive expectation as a physically instantiated context variable, using true/false report structure as a placebo-style discriminator. The main difficulties are psychological variability, deception ethics, report internalization strength, large required sample size, and exclusion of timing, leakage, and device-label artifacts.

**13.3 Protocol 2: Exploratory Coherence-Time Search**

This protocol searches for, but does not predict, a CC-correlated coherence response.

**13.3.1 Candidate Effect**

Hypothesis 3 permits an additional context-dependent contribution to an effective decoherence rate. Neither Proposition 13 nor the CC budget proves that this contribution is nonzero.

**13.3.2 Phenomenological Search Model**

Writing $\Gamma_0=1/\tau_0$ and $x=\Delta\Gamma_{\mathrm{eff}}/\Gamma_0$, the exact kinematic identity and a candidate linear parametrization are
$$
\frac{\Delta\tau_{\mathrm{coh}}}{\tau_0}
=
-\frac{x}{1+x}
=
-\frac{\Delta\Gamma_{\mathrm{eff}}}{\Gamma_0}
+O\!\left(\frac{\Delta\Gamma_{\mathrm{eff}}^2}{\Gamma_0^2}\right),
\qquad
-\frac{\Delta\Gamma_{\mathrm{eff}}}{\Gamma_0}
\stackrel{\mathrm{model}}{=}
\gamma'_{\mathrm{CC}}\,\mathrm{CC}(S)\,
f_{\mathrm{context}}(\mathrm{context}_S,\mathrm{system}).
\tag{80}
$$
Here $\gamma'_{\mathrm{CC}}$ and $f_{\mathrm{context}}\in[-1,1]$ are free phenomenological inputs. Equation (80) fixes no sign or nonzero interval. A PU prediction requires a realization record that derives them before the coherence data are inspected.

**13.3.3 Experimental Approach**

*   **Objective:** Exploratory search for statistically significant *relative changes* in $\tau_{coh}$ correlated with $\mathrm{context}_S$ of system S.
*   **Setup:**
    *   **Quantum System:** System with well-characterized, long, stable baseline $\tau_{coh, base}$ (NV centers, trapped ions, qubits, NMR).
    *   **High-Complexity System (S):** Human or AI.
    *   **Interaction/Control:** Similar requirements as Protocol 1 (shielding, interaction $N(t)$, stability, blinding). Temperature stability critical.
*   **Procedure:** Measure $\tau_{coh}$ (e.g., Ramsey, spin echo, $T_1/T_2$) repeatedly under randomized conditions (baseline, neutral context, specific context). Rapid interleaving mitigates drifts. Residual autocorrelation will be diagnosed and, if present, mitigated by prewhitening (e.g., AR(1)).
*   **Analysis:** Detect small differences $\Delta \hat{\tau}_{coh} = \hat{\tau}_{coh, context} - \hat{\tau}_{coh, baseline}$. High precision/stability needed; effect size $|\Delta \tau_{coh}/\tau_{coh}| \approx |\gamma'_{CC} \cdot \mathrm{CC}(S)|$ may be small. Use appropriate statistical tests (t-tests, ANOVA) after rigorous systematic error checks (temperature, fields correlated with S).
*   **Feasibility Assessment:** Technically demanding (high-precision $\tau_{coh}$ measurement). Requires specialized equipment/expertise. Sensitivity depends on achievable baseline stability $\sigma_{\tau_{coh, base}}$. Highly exploratory.

**13.3a Prediction/Protocol 2a: Chronometric Curvature-Dephasing Test**

This protocol tests the non-CC chronometric branch of Section 11.7.2 and Appendix S. The measured quantities are the coherent phase-rate invariant
$$
\mathcal D_{ij}^{\phi}
:=
\frac{\hbar|\dot\Theta_{ij}|}{|\Delta E_{ij}|}
$$
and, after subtracting independently characterized environmental decoherence channels, the residual dephasing invariant
$$
\mathcal D_{ij}^{\Gamma}
:=
\frac{\hbar\Gamma_{\mathrm{res}}^{(ij)}}{|\Delta E_{ij}|}.
$$
The deterministic phase theorem predicts
$$
\mathcal D_{ij}^{\phi}
=
\frac{|\Delta\Phi|}{c^2}.
$$
The saturated chronometric ND-RID branch predicts
$$
\mathcal D_{ij}^{\Gamma}
=
\frac{|\Delta\Phi|}{c^2}.
$$
In a freely falling Fermi frame with one branch on the reference worldline and the other displaced by the spatial vector $L^a$, let $\lVert L\rVert$ denote its Euclidean norm in that frame. Then
$$
\frac{|\Delta\Phi|}{c^2}
=
\frac12|R_{0a0b}L^aL^b|
+
O\!\left(\lVert L\rVert^3\sup_{\mathcal U}\lVert\nabla R\rVert\right),
$$
where $\mathcal U$ is the Fermi neighborhood containing the two branches.

*   **Objective:** Test whether residual clock dephasing, if present after all environmental subtractions, scales with internal energy splitting and tidal geometry rather than only with branch mass-density difference.
*   **Setup:** A clock interferometer, trapped-ion/neutral-atom clock, molecular clock, or superconducting clock platform with at least two selectable internal splittings $\Delta E_1,\Delta E_2$, branch separation $L^a$, and independently modeled environmental decoherence budget. The preferred geometry is reference-anchored or otherwise has a nonzero Fermi-frame contraction $R_{0a0b}(x_1^a x_1^b-x_0^a x_0^b)$.
*   **Primary phase check:** Verify
$$
\frac{\hbar|\dot\Theta_1|}{|\Delta E_1|}
=
\frac{\hbar|\dot\Theta_2|}{|\Delta E_2|}
=
\frac{|\Delta\Phi|}{c^2}
$$
within the geometric calibration uncertainty.
*   **Primary dephasing check:** If a residual gravitational dephasing channel is present, test the saturated chronometric branch ratio
$$
\frac{\Gamma_{\mathrm{res}}^{(1)}}{\Gamma_{\mathrm{res}}^{(2)}}
=
\frac{|\Delta E_1|}{|\Delta E_2|}
$$
at fixed geometry, together with the absolute normalization
$$
\Gamma_{\mathrm{res}}^{(i)}
=
\frac{|\Delta E_i|}{\hbar}\frac{|\Delta\Phi|}{c^2}.
$$
*   **Tidal angular check:** Rotate or reorient the separation vector where possible and test the quadrupolar dependence
$$
\Gamma_{\mathrm{res}}^{(i)}(\hat L)
\propto
|R_{0a0b}\hat L^a\hat L^b|.
$$
*   **Mass-density discriminator:** Compare branch pairs with matched mass-density difference but different internal splittings. The chronometric branch predicts energy-gap scaling; mass-density-only collapse models do not.
*   **Falsification status:** Failure of the coherent phase-rate invariant falsifies the chronometric mapping or the geometric calibration. Absence of residual dephasing after a closed environmental budget falsifies the saturated chronometric ND-RID dephasing branch, not the deterministic proper-time phase theorem. Residual dephasing that does not scale linearly with $|\Delta E|$ at fixed geometry falsifies the saturated chronometric branch.

**13.4 Identifiability Against Electromagnetic Confounds**

A critical challenge for any experiment seeking to detect CC is to unambiguously distinguish the hypothesized effect from conventional physical influences, particularly subtle electromagnetic (EM) fields generated by the high-complexity system. The following protocol design creates a quantitative, verifiable gap between the maximum possible EM-induced bias and the potential CC signal floor.

**Theorem 52 (Maxwell--Stark Bound within the Triple-Blind Protocol)**

At Ramsey quadrature let $P(\phi)=(1+\cos\phi)/2$ and let the differential Stark convention be $\Delta E_{\mathrm{Stark}}=-\Delta\alpha\langle E^2\rangle/2$. If $u_{\mathrm{EM}}$ is the time-averaged local Maxwell energy density, positivity of the magnetic contribution gives
$$
\langle E^2\rangle\le\frac{2u_{\mathrm{EM}}}{\varepsilon_{\mathrm{vac}}},
\qquad
|\Delta P|_{\mathrm{EM}}
\le\frac{|\Delta\alpha|u_{\mathrm{EM}}T}{2\hbar\varepsilon_{\mathrm{vac}}}.
\tag{81a}
$$
For a free-space plane wave, electric and magnetic energies are equal and $u=I/c=\varepsilon_{\mathrm{vac}}\langle E^2\rangle$, giving the sharper
$$
|\Delta P|_{\mathrm{EM}}
\le\frac{|\Delta\alpha|uT}{4\hbar\varepsilon_{\mathrm{vac}}}.
\tag{81}
$$
Indeed $|P(\pi/2+\Delta\phi)-P(\pi/2)|=|\sin\Delta\phi|/2\le|\Delta\phi|/2$ and $|\Delta\omega|=|\Delta\alpha|\langle E^2\rangle/(2\hbar)$. ∎

A separate bound on algorithmic-predictability confounds is $P_{\rm guess}\le2^{-(H_\infty L-t)}$, where an adversary has at most $t$ bits of side information. If a nonzero CC response map is independently supplied, Theorem 51 bounds rather than fixes its effect:
$$
|\Delta P|_{\mathrm{CC}}\le\mathrm{CC}(S).
$$
On the stricter Fisher-budget subbranch,
$$
|\Delta P|_{\mathrm{CC}}\le\sin\!\big(\mathrm{CC}(S)/2\big)
=\frac12\mathrm{CC}(S)+O(\mathrm{CC}(S)^3)
\qquad
(\mathrm{CC}(S)\ll1).
$$
Using representative achievable values $|\Delta\alpha|\lesssim10^{-39}\,\mathrm{J\,m^2/V^2}$ and $u\lesssim10^{-18}\,\mathrm{J/m^3}$ gives
$|\Delta P|_{\rm EM}\lesssim2.68\times10^{-13}T$ with $T$ in seconds: approximately $2.7\times10^{-13}$ at $1\,\mathrm{s}$ and $9.6\times10^{-10}$ at $1\,\mathrm{hr}$. An observed shift above $10^{-6}$ would exceed this registered Stark-channel bound, but would still require the full artifact ledger before attribution. The value $10^{-4}$ is a protocol sensitivity benchmark corresponding to an externally posited $\mathrm{CC}(S)\sim10^{-4}$; it is not a PU-predicted effect size.


**13.5 Prediction/Protocol 3: Exploratory Bell Tests / Statistical FTL Search (Three-Branch)**

Tests the registered hypothesis that CC acting on entangled systems produces a late-randomized Bob-marginal shift (Postulate 3). PU takes exact pre-lightcone no-signaling as the current-physics baseline and tests class (iii) as a statistical-FTL hypothesis beyond that baseline. A certified and replicated occurrence would establish a noisy statistical-FTL channel, support PU's QCP/statistical-FTL hypothesis, and simultaneously falsify the exact pre-lightcone context-independence branch by Theorem 39c and Corollary 39c.1. The local CPTP branch (i) preserves Bob's marginal and permits only Alice-local or joint-correlation changes detectable after classical comparison of records, while the preparation-context branch (ii) admits a Bob-marginal dependence only when the context is fixed in the shared causal past and is excluded as an explanation of class-(iii) data by late randomization.

*   **Objective:** Sensitive search for preregistered statistical dependence of Bob's local measurement outcomes on Alice's remote context $\mathrm{context}_S$ (associated with system $S_A$ at her station), with A and B space-like separated and with $\mathrm{context}_S$ randomized strictly later than the latest event in the shared causal past of the two measurement regions. On branch (i), only Alice-local or joint/conditional correlations after classical comparison can vary; on branch (ii), a Bob-marginal shift can occur only when context randomization precedes preparation; on branch (iii), Bob's marginal itself shifts under late randomization. Secondary search for context-dependent changes in Bell parameters.
*   **Theoretical Basis:** Postulate 3 defines three branches. On branch (i), Bob's marginal probabilities are invariant by standard no-signaling (Bob-marginal kernel decomposition, Lemma 10.2). On branch (ii), Bob's marginal can depend on $C_A$ through common-cause statistics inherited from a preparation that, by the branch definition, occurs in the shared causal past. Theorem L.12.8 separately states that strict target-conditioned joint-correlation advantage above the best information-free policy requires causal or common-cause information about the entanglement record. On branch (iii), Alice's late-randomized context $C_A$ shifts Bob's marginal $P_{\mathrm{obs}}(b|B,C_A)$ while remaining non-deterministic and zero-error inaccessible in finite pre-lightcone windows on the regular branch, but by Theorem 39c this would falsify Postulate 2. Detection of a marginal shift requires $N \propto 1/\mathrm{CC}(S_A)^2$ trials (Theorem 40); joint-correlation tests require classical comparison of records; the pre-lightcone information budget and sampling gate are bounded by Lemma 10.3.
*   **Experimental Setup:**
    1.  **Entanglement Source:** High-quality, stable source distributing entangled pairs to space-like separated stations (Alice, Bob).
    2.  **Measurement Stations (A, B):** Standard Bell test apparatus (independent, random settings $a, b$). High efficiency desirable. The setting generators are device‑independent and statistically independent of system $S$ and any hidden variables.
    3.  **High-Complexity System (S_A):** System S (human/AI) at Alice's station generating distinct contexts $C_{A,k}$.
    4.  **Interaction/Control (Alice):** Controlled pathway $N(t)$ linking $S_A$'s context $C_{A,k}$ to Alice's measurement/particle. Rigorous shielding/systematics control at both stations.
    5.  **Space-like Separation:** Ensure measurement events ($a, o_A$ and $b, o_B$) are space-like separated. Requires precise timing and separation.
    6.  **Data Acquisition:** Synchronized recording ($C_{A,k}, a, o_A, b, o_B$, timestamps) for billions of coincidences potentially needed. Mandatory blinding.
*   **Procedure:**
    1.  **Standard Bell Test:** Verify entanglement, calibrate, establish baseline correlations $E(a,b)$.
    2.  **Context Intervention Runs:** Interleave runs with Alice generating contexts $C_{A,k}$ (e.g., $k=0, 1, 2$). Random settings $a, b$. Collect large statistics $N_{int}$ per context $k$.
*   **Statistical Analysis:**
    *   **Primary Focus (Statistical Influence):** Compare Bob's marginal probabilities $P(o_B | b, C_{A,k})$ across contexts $k$. Test the null hypothesis $H_0: P(o_B | b, C_{A,k=1}) = P(o_B | b, C_{A,k=2})$. Rejection under independently late-randomized $C_{A,k}$ supports the branch-(iii) anomaly model and simultaneously falsifies the sealed Lorentz/AQFT no-signaling branch by Theorem 39c. Estimate the shift $\Delta P_{marginal}=|P(o_B | b, C_{A,1})-P(o_B | b, C_{A,2})|$. By Theorem 36, this shift is bounded by $\Delta P_{marginal}\lesssim\mathrm{CC}(S_A)$. Detection requires $N_{int}\gtrsim O(1/\mathrm{CC}(S_A)^2)$ (Theorem 40). Theorem 39a classifies the positive result as statistical rather than zero-error deterministic on the regular finite-window branch (Definition 10.2a).
    *   **Secondary Analysis (Correlations):** Calculate correlations $E(a,b)_k$ and Bell parameters $S_{CHSH, k}$ conditioned on context $k$. Look for differences $S_{CHSH, k=1} \neq S_{CHSH, k=2}$. Joint-correlation deformations with Bob-marginal component $\Pi_B\ell_{C_{A,k}}=0$ are compatible with branch (i); the stronger double-centered diagnostic $\Pi_{\mathrm{joint}}\ell_{C_{A,k}}$ isolates the part with both local marginals removed.
    *   **Causal Anomaly Ledger:** Each preregistered analysis pipeline must report three primary residual quantities computed on the same data:
$$
\Delta P
=
\Delta_{\rm Born}
+\Delta_{\rm drift}
+\Delta_{\rm EM}
+\Delta_{\rm thermal}
+\Delta_{\rm source}
+\Delta_{\rm detector}
+\Delta_{\rm CC}.
$$
The CC term is itemized as (a) a *joint-correlation anomaly* $\Delta_{\rm CC}^{\rm joint}$ from $\Pi_{\mathrm{joint}}\ell_{C_{A,k}}$, (b) a *Bob-marginal anomaly* $\Delta_{\rm CC}^{\rm marg}$ from $\Pi_B\ell_{C_{A,k}}$, and (c) a *control/environment anomaly* $\Delta_{\rm ctrl}$ aggregating residuals attributable to $\Delta_{\rm drift},\Delta_{\rm EM},\Delta_{\rm thermal},\Delta_{\rm source},\Delta_{\rm detector}$. A branch-(i) consistent positive result is $\Delta_{\rm CC}^{\rm joint}\ne 0$, $\Delta_{\rm CC}^{\rm marg}=0$, and $\Delta_{\rm ctrl}$ within its preregistered tolerance. A branch-(iii) consistent positive result requires additionally $\Delta_{\rm CC}^{\rm marg}\ne 0$ under late-randomized context with all entries of $\Delta_{\rm ctrl}$ within their preregistered tolerances.
    *   **Systematic Error Control (Extreme Rigor):** Exclude conventional communication (light leaks, EM, acoustic), detector/setting correlations with $C_{A,k}$, statistical loopholes, biases. Branch-(ii) preparation-context confounds are excluded only by randomizing $C_{A,k}$ strictly after the latest event in the shared causal past of the two measurement regions; the preregistered protocol must report the spacelike-interval certificate for this randomization step.
*   **Feasibility Assessment:** Extremely challenging. Requires state-of-the-art entanglement/measurement technology, robust space-like separation. Controlling systematics to demonstrate statistical FTL on the marginal-anomaly branch is extraordinarily difficult. Required statistics $N \propto 1/\mathrm{CC}(S_A)^2$ can be immense. Highly exploratory; positive indication needs exceptional scrutiny/replication.

**13.6 Staged Experimental Approach and General Considerations**

A pragmatic, staged approach is recommended to systematically test the framework's predictions:

1.  **Stage 1 (Near-Term Focus):** High-statistics QRNG tests (Protocol 1) and report-induced expectation QRNG tests (Protocol 1a). Protocol 1 searches for context-correlated deviations under controlled internal states. Protocol 1a isolates passive expectation by comparing true, false, unseen, and delayed reports while generating the target quantum outcome only after the expectation window. These protocols are the most accessible for either detecting a signal or placing meaningful upper bounds on CC in the range of $10^{-3} - 10^{-4}$. Success is contingent on meticulous QRNG and interaction-pathway design, rigorous systematics control, and achieving the required statistical power as outlined in the protocols' power analyses.
2.  **Stage 2 (Medium-Term):** If justified by positive and replicated results from Stage 1, coherence time tests (Protocol 2) should be pursued to seek complementary evidence. This stage would also involve refining the QRNG and expectation-induction protocols based on initial findings.
3.  **Stage 3 (Long-Term / Contingent):** The extraordinarily demanding Bell-type experiments for a statistical FTL search (Protocol 3) should only be undertaken if compelling, independently verified evidence emerges from the earlier stages.

All proposed experiments share common requirements for rigor and validity. They necessitate quantum systems with high stability over long integration times to achieve the required statistical power. Given the multiple hypotheses being tested, a clear, pre-registered statistical plan is mandatory to control the family-wise error rate. This should include specifying the use of sequential analyses with pre-defined stopping rules (e.g., O'Brien–Fleming boundaries) to allow for early termination for efficacy or futility while preserving the overall type-I error rate. As a concrete example, with three equally spaced looks, the canonical OBF boundaries (Z-scores) at a family-wise $\alpha_{\mathrm{sig}}=0.05$ are approximately $[3.47, 2.45, 2.00]$.

**13.7 Compliance with Causal Constraints**

The experimental program, especially Protocol 3, probes the framework's non-standard locality. The exact causal-compliance boundary is as follows:

**13.7.1 Theorem 53 (CC Causal-Compliance Boundary)**

The Consciousness Complexity (CC) mechanism (Hypothesis 3), constrained by $\mathrm{CC}\le\alpha_{CC,max}<0.5$ (Theorem 39) and by the finite-window zero-error gate (Theorem 39a) on the regular statistical branch (Definition 10.2a), and by the predictive-current no-loop/precision-cost gate when a current representation is asserted (Theorem 39b, Definition 10.2c), is consistent with Postulate 2 only on branches with exact pre-lightcone marginal invariance. Preventing deterministic or zero-error decoding alone is insufficient by Theorem 39c. The potential statistical FTL influence (Postulate 3) may still have positive finite-error statistical information (Theorem 41), but it remains sample-complexity limited (Theorem 40) and unusable for constructing paradox-inducing deterministic causal loops (Theorems 39b and 42, whose consistency is supported by the AQFT analysis in Appendix F).

*Proof.* Theorem 39 bounds the operational bias strength on the bounded-bias branch by $\mathrm{CC}\le\alpha_{CC,max}<0.5$. In particular, the CC mechanism cannot force both deterministic endpoints of a binary trial; hence it cannot implement deterministic one-shot superluminal signaling. Theorem 39a then addresses the finite-window statistical branch on the regular operating regime: under the common-support condition of Definition 10.2a — motivated by the endpoint gate, ND-RID finite-transfer limits, irreducible $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$, PPI admissibility of probability kernels, and refresh-branch strict contractivity where available — the context-conditioned transcript distributions retain positive overlap, so every finite pre-lightcone decoder has nonzero error probability. Theorem 39b adds that any current representation of such a signal is a coarse-graining of the same finite transcript algebra and therefore cannot create a zero-error decoder; when a finite Markov/KMS precision certificate is supplied, nonzero finite-cost current signals also carry nonzero variance. Theorem 40 shows that any nonzero CC signal can only be detected statistically, with required sample size scaling as $N=O(\mathrm{CC}^{-2})$. Theorem 41 bounds the finite-error information rate by a quantity of order $\mathrm{CC}^2$ at a regular operating point. Finally, Theorem 42 excludes a finite-window zero-error contradiction protocol; Theorem 39c independently shows that any nonzero freely selected pre-lightcone channel already violates Postulate 2. Appendix F supplies the AQFT locality framework for the Bob-marginal-preserving branch and the operator-local baseline; the branch-(iii) finite-window reliability bounds are furnished by Theorems 39a–42, while its noncausal status is fixed by Theorem 39c, with Theorem 39b supplying the current-level no-loop gate when that representation is used. Therefore the CC mechanism is compatible with Postulate 2 exactly when its pre-lightcone marginal channel is constant; branch (iii) remains testable as a falsifier of that condition. ∎

*Protocol attribution:* Protocol 3 tests PU's branch-(iii) anomaly hypothesis. A certified late-randomized Bob-marginal shift would support the nonlocal/state-mediated branch and falsify the exact causal branch; a null result constrains branch (iii) without falsifying the local-CPTP or shared-past branches.

## 13.8 High-Precision Falsification Windows

Beyond the direct experimental search for CC, the framework's quantitative predictions for fundamental constants and emergent gravity provide sharp, falsifiable tests.

### 13.8.1 The Fine-Structure Constant Prediction Window
The Appendix Z derivation fixes the Thomson-limit certificate-core value
$$
\alpha^{-1}_{0}
=
\frac{4\pi}{u^*}
-
\frac{\pi}{\sqrt{K_0}}
+
\frac{\pi u^*}{24\sqrt{K_0}}\operatorname{sinc}(u^*)
=
137.03609205522863\ldots .
$$
This is a closed-form finite-response branch evaluation. Its structural inputs are $K_0=3$, $d_0=8$, $a=2$ (equivalently $a/d_0=1/4$), $M=24$, and $u^*=2^{1/8}-1$; it additionally uses the independently registered unit-Ward, unit-interface-response, democratic visible-response, separable curvature-response, normalized-flux, electromagnetic-projection, and $SU(2)$ transport entries of Appendix Z (Theorem Z.26; Corollary Z.26a). Once those branch entries are fixed, the displayed expression contains no continuously adjusted coefficient. The structural integers alone do not determine the formula.
Its arithmetic distance from $\alpha^{-1}_{\mathrm{exp}}=137.035999177(21)$ is
$$
0.00009287822863\ldots,
$$
about $0.678$ ppm. The comparison row is
$$
\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha.
$$
The residual $R_\alpha$ is structurally bounded by the named entries of $\mathfrak C_\alpha$ (Corollary Z.26b); it is not adjustable and cannot be selected using $\alpha^{-1}_{\mathrm{exp}}$. The displayed $\pm0.000060$ budget in the Appendix Z ledger is a canonical branch comparison budget; it is not a replacement for $R_\alpha$. On a candidate finite-Ward branch carrying an independently supplied hypercharge-recoil operator-realization certificate, Definition Z.27.11k.12 specifies the required operator-realization certificate and Theorem Z.27.11k.20 fixes $R_{\alpha}^{YR\perp}=-0.00009287769839723537\ldots$, giving $\alpha^{-1}_{YR\perp}=137.03599917753023\ldots$; Corollary Z.27.11k.21.1 enters this as the conditional diagnostic registry residual. The three non-exact contributions are assigned to $[\omega_Y]$, $[\omega_5]$, and $[\sigma_{\perp}]$, while exact, obstructed, already-counted, and future residual sources are excluded by the stipulated-source-menu and overlap audit. If the seventh-order passive-complement source is downgraded to the positive-contraction bound, Corollary Z.27.11k.21 gives $[137.03599917502362\ldots,137.03599917878353\ldots]$. Corollary Z.27.11e.1 still excludes a same-branch theorem with $R_\alpha=0$. Standard QED running from a candidate Thomson certificate is a downstream consistency ledger and does not close or modify the residual gate.

### 13.8.2 The Multi-Scale Gravity / Dark Sector Window
The framework's two-mechanism model for the dark sector (Appendix I) is falsifiable through its demand for cross-scale consistency with a minimal set of universal parameters. On the acceleration-lock branch the relevant threshold is fixed before galaxy fitting:
$$
g_\Lambda
:=
\frac{c^2\sqrt{\Lambda}}{8}.
$$
The model can be falsified in several ways:
*   **Failure to Fit Galaxies:** If the scale-dependent $G(R)$ model (Equation I.4) fails to provide good fits to a large, diverse sample of galaxy rotation curves (e.g., the SPARC database) with a single, universal set of parameters $(L_0, A_G, m)$ and with the transition plotted against $\chi_b=|\nabla\Phi_b|/g_\Lambda$, the galaxy-scale mechanism is invalidated. On the backbone-channel-recruitment benchmark branch of Definition I.13a, the preregistered test pair is $(A_G,m)=(7,3)$ by Proposition I.13b, so exclusion of that pair refutes the benchmark branch rather than the whole dark-sector program.
*   **Acceleration-Lock Failure:** If galaxy acceleration data require a best-fit acceleration scale significantly different from $g_\Lambda$ after baryonic nuisance propagation, the adopted Appendix H bridge representative is falsified.
*   **Consistency with Early-Universe Constraints:** The galaxy-fit value for the asymptotic enhancement, $A_G$, must remain consistent with cosmological constraints on the effective gravitational coupling during recombination (e.g., CMB/BBN). A model that requires a larger $A_G$ to fit galaxies would be falsified.
*   **Failure to Fit Clusters:** The non-local predictive matter model (Equation I.7) must be able to fit the observed lensing profiles of massive galaxy clusters (like Abell 1689 and stacked samples) using a **universal nonlinearity exponent $q$**, the locked acceleration $g_\Lambda$ on the acceleration-lock branch, and either a **universal kernel scale $L_0$ or one derivable from ND–RID microphysics (allowing mild environment dependence)**, with per‑cluster amplitudes $A_{\rm PM}$ bounded by baryon budgets. If no such consistent fit can be found, the cluster-scale mechanism is invalidated.
*   **Parameter Incoherence:** The parameters derived from fitting galaxies (e.g., the transition scale $L_0$) and clusters (e.g., the kernel scale $L_0$ and the universal exponent $q$) must be coherently related by the underlying theory. A significant, unexplainable discrepancy between the best-fit parameters for the two regimes would falsify the claim of a unified underlying mechanism.
*   **Redshift-Lock Failure:** On a constant-$\Lambda$ branch, high-redshift acceleration-threshold measurements should not scale with the full $H(z)$. If the transition scale robustly tracks $H(z)$ rather than $\sqrt{\Lambda_{\mathrm{eff}}(z)}$, the acceleration-lock branch fails.

**Preregistration:** All primary endpoints, inference procedures, stopping rules, and exclusion criteria must be preregistered (e.g., via OSF/AsPredicted). Any deviations from the pre-registered plan must be explicitly documented and justified.

**Data and Code Availability:** All analysis scripts (including power and sample-size simulations), anonymized raw data, experimental logs, and time-stamps (with random seeds where applicable) will be made publicly available at a persistent repository to ensure full transparency and reproducibility. The preregistration will link directly to this repository.

### 13.8.2a Critical Baryonic Surface-Density Window
The bridge-law normalization for the galactic acceleration scale implies a second bridge-level galactic observable:

$$
\Sigma_\dagger = \frac{g_0}{2\pi G} = (134.4 \pm 2.3)\,M_\odot\,\mathrm{pc^{-2}}.
$$

This is the characteristic baryonic surface-density scale at which rotationally supported systems enter the low-acceleration regime. The prediction follows directly from Corollary H.1a and therefore inherits the same PU backbone as $g_0$.

**Falsification Conditions:**
- A preregistered joint analysis of an external cosmological posterior and an independent disk-galaxy likelihood excludes $16\pi G\Sigma_\dagger=c^2\sqrt{\Lambda}$ after cosmological, astrophysical, finite-thickness/geometry, and bridge-law uncertainties are jointly propagated.
- The observed onset of mass discrepancy in high-quality baryonic maps fails to cluster around a single universal $\Sigma_\dagger$.
- Independent determinations of $g_0$ and the surface-density threshold are mutually inconsistent through $\Sigma_\dagger=g_0/(2\pi G)$.

The numerical window above uses the Appendix V hybrid diagonal-input convention formed from the rounded Planck 2018 base-$\Lambda$CDM marginals in Equations (V.4)–(V.5), with twice the displayed diagonal propagation (Remark H.1a.2). As a one-parameter sensitivity calculation, replacing $H_0=67.4\pm0.5$ by $73.04\pm1.04\,\mathrm{km\,s^{-1}\,Mpc^{-1}}$ [Riess et al. 2022] while retaining $\Omega_\Lambda=0.6889\pm0.0056$ gives $\Sigma_\dagger=(145.6\pm4.3)\,M_\odot\,\mathrm{pc^{-2}}$. This hybrid rescaling is not an independent joint cosmological fit, and the two displayed windows are not exhaustive. The cosmological acceleration-lock relation is falsified if a preregistered external cosmological posterior and an independent galactic likelihood are inconsistent with $16\pi G\Sigma_\dagger=c^2\sqrt{\Lambda}$ after cosmological, astrophysical, finite-thickness/geometry, and bridge-law uncertainties are jointly propagated. Excluding either illustrative window alone is not sufficient.

**Vacuum–Electroweak Complexity Product Lock.**
The Appendix U five-mode reference exponent and Appendix T electroweak exponent give the branch identity
$$
(\Lambda L_P^2)\left(\frac{v}{M_{Pl}}\right)^2
=
8\pi A_{\mathrm{eff}}A_{EW}^2e^{-360}.
$$
On a vacuum branch whose forward $A_{\mathrm{eff}}$ is evaluated independently of $A_{EW}$, the observable test statistic is
$$
\mathcal H_{\Lambda EW}
:=
-\ln\left[
\frac{
(\Lambda L_P^2)(v/M_{Pl})^2
}{
8\pi A_{\mathrm{eff}}A_{EW}^2
}
\right],
$$
and the five-mode exponent ledger gives
$$
\mathcal H_{\Lambda EW}=360.
$$
Its uncertainty must be propagated with the full accepted joint covariance of the observational inputs and the two forward prefactors.

The current Appendix U working convention is instead a determinant-transfer branch:
$$
A_{\mathrm{eff}}^{\mathrm{BL}}
=
A_{EW}^{-1}\Xi_{\perp},
\qquad
A_{\mathrm{eff}}^{\mathrm{BL}}A_{EW}^2
=
\Xi_{\perp}A_{EW}.
$$
On that branch, the primitive uncertainty variables are $(\Xi_{\perp},A_{EW})$, not an independent pair $(A_{\mathrm{eff}},A_{EW})$. The resulting $360$ row is therefore a correlated determinant-transfer consistency check rather than an independent vacuum–electroweak prefactor test. A value inconsistent with $360$ after the appropriate primitive-variable covariance ledger is propagated falsifies the named five-mode transfer branch; an independently evaluated vacuum-prefactor branch must be tested with its own forward covariance record.

The mechanism-separated identity of Corollary U.72c is
$$
2\kappa_\Lambda+2\kappa_{EW}
=(288-m_\Lambda)+77
=365-m_\Lambda.
$$
Thus the five-mode vacuum reference branch gives $360$, whereas the four-mode theorem branch of Theorem U.13b gives
$$
2\kappa_{\Lambda,\mathrm{trans}}+2\kappa_{EW}=361.
$$
The electroweak term is the Steiner response action, not a zero-mode subtraction.
This is an exponent-ledger result. A numerical four-mode product-lock prediction additionally requires an independently evaluated forward prefactor $A_{\mathrm{eff}}^{(\mathrm{Fred},4)}$ and its accepted interval. The quantity $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$ is an observational inversion, not a forward vacuum-prefactor prediction (Proposition U.15c; Corollary U.15f).

For the diagnostic definitions of Corollary U.72d,
$$
A_{\mathrm{eff}}^{(\mathrm{obs},4)}
:=\frac{\Lambda L_P^2e^{284}}{8\pi},
\qquad
J:=\frac{(\Lambda L_P^2)(v_{\mathrm{obs}}/M_{Pl})^2e^{360}}{8\pi},
$$
one has the exact algebraic identity
$$
\frac{A_{\mathrm{eff}}^{(\mathrm{obs},4)}A_{EW}^2}{Je}
=
\left(\frac{A_{EW}e^{-38.5}M_{Pl}}{v_{\mathrm{obs}}}\right)^2
=
\left(\frac{v_{\mathrm{pred}}}{v_{\mathrm{obs}}}\right)^2.
$$
The same observed $\Lambda$ occurs in both $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$ and $J$, so its cancellation, including all $H_0$ dependence, is exact. Consequently this ratio is a cosmological-anchor-free electroweak diagnostic, not an input-free prediction and not an independent test of the vacuum prefactor or of $m_\Lambda$. On the registered determinant-model branch of Theorem T.29,
$$
\frac{A_{\mathrm{eff}}^{(\mathrm{obs},4)}A_{EW}^2}{Je}
=
\left(\frac{251.9993\ldots}{246.22}\right)^2
=1.04750\ldots.
$$
A four-mode product row can be tested only after a forward $A_{\mathrm{eff}}^{(\mathrm{Fred},4)}$ interval and an $A_{EW}$ interval are fixed independently of the observed product. Failure of both independently specified five-mode and four-mode rows would exclude those two branch realizations; it would not by itself exclude every instanton-exponent completion.

**Electroweak–Baryon Square-Root Lock.**
On the canonical Appendix Y branch carrying the equal-exponent decomposition, the Appendix T determinant relation, exact $N_g=3$ on the stated family branch, and an accepted transport certificate fixing every prefactor, Corollary Y.11.4b gives
$$
\eta_B
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}2^{-1/3}
\sqrt{\frac{v}{A_{EW}M_{Pl}}}.
$$
Equivalently, the prefactor-isolating observable
$$
\mathcal P_{\mathrm{eff}}
:=
\frac{\eta_B}{\sqrt{v/M_{Pl}}}
$$
satisfies
$$
\mathcal P_{\mathrm{eff}}
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}2^{-1/3}A_{EW}^{-1/2}
$$
on that branch. A change in the electroweak scale within the same certified baryogenesis regime gives $\delta\eta_B/\eta_B=\frac12\delta v/v$ only while the transport, thermal, CP-response, generation, and determinant prefactors are held constant.

### 13.8.3 Retired Glueball Shell-Assignment Benchmark

The canonical branch of Theorem Z.8h prescribes a map from glueball labels $J^{PC}$ to Leech shell norms and a spin-corrected mass readout. This subsection tests that branch against continuum pure $SU(3)$ Yang–Mills data; it does not treat the shell assignment as a derived representation-theoretic fact.

For
$$
|v|^2(J^{PC})
=
a^2+\Delta_J(J)+\Delta_P(P)+\Delta_C(C),
$$
the branch rules are
$$
a^2=4,
\qquad
\Delta_J(0)=0,
\qquad
\Delta_J(J)=J(J-1)\quad(J\ge1),
$$
$$
\Delta_P(+)=\Delta_C(+)=0,
\qquad
\Delta_P(-)=4,
\qquad
\Delta_C(-)=8.
$$
The branch mass readout is
$$
\frac{m(J^{PC})}{m(0^{++})}
=
\sqrt{\frac{|v|^2(J^{PC})}{4}}
\sqrt{1+\frac{J(J+1)}{20}},
$$
where $20=a(2b-a)=M-a^2$ on $(a,b,M)=(2,6,24)$.
Write
$$
Z(J):=\sqrt{1+\frac{J(J+1)}{20}}.
$$

**Continuum benchmark.** Athenodorou and Teper [2020, Table 17] report continuum pure $SU(3)$ Yang–Mills masses in units of $\sqrt{\sigma}$, including
$$
\frac{m(0^{++})}{\sqrt{\sigma}}=3.405(21).
$$
The observed ratios below divide the quoted state mass by $3.405$. Because the publication does not provide the covariance with the common $0^{++}$ denominator, the displayed uncertainties use the declared diagonal propagation
$$
\sigma_r
=
r\sqrt{
\left(\frac{\sigma_m}{m}\right)^2
+
\left(\frac{0.021}{3.405}\right)^2
}.
$$
The resulting column is the diagonal statistical pull
$$
\tau_{\mathrm{diag}}
=
\frac{r_{\mathrm{pred}}-r_{\mathrm{obs}}}{\sigma_r},
$$
not a covariance-aware global goodness-of-fit. The source errors are statistical only. A dagger marks a qualified continuum-spin assignment in the source.

| State | Shell $|v|^2$ | $Z(J)$ | Predicted | Observed ratio | $\tau_{\mathrm{diag}}$ |
|:---|---:|---:|---:|---:|---:|
| $2^{++}$ | 6 | 1.140 | 1.396 | $1.437\pm0.011$ | $-3.7$ |
| $0^{-+}$ | 8 | 1.000 | 1.414 | $1.549\pm0.016$ | $-8.3$ |
| $3^{++\dagger}$ | 10 | 1.265 | 2.000 | $2.264\pm0.030$ | $-8.8$ |
| $1^{+-}$ | 12 | 1.049 | 1.817 | $1.781\pm0.016$ | $+2.2$ |
| $2^{-+}$ | 10 | 1.140 | 1.803 | $1.856\pm0.029$ | $-1.9$ |
| $2^{--}$ | 18 | 1.140 | 2.419 | $2.373\pm0.046$ | $+1.0$ |
| $1^{--}$ | 16 | 1.049 | 2.098 | $2.441\pm0.033$ | $-10.4$ |
| $3^{+-}$ | 18 | 1.265 | 2.683 | $2.135\pm0.038$ | $+14.6$ |
| $4^{++\dagger}$ | 16 | 1.414 | 2.828 | $2.232\pm0.038$ | $+15.8$ |
| $1^{-+}$ | 8 | 1.049 | 1.483 | $2.490\pm0.038$ | $-26.2$ |

On this declared diagonal statistical benchmark, three rows lie within $3$ standard uncertainties and seven lie outside. The large discrepancies show that the canonical assignment/readout branch is incompatible with the benchmark; the three compatible rows are not confirmations.

**Pinned-scale reassignment no-go (imported from Theorem Z.8h.3).** Within the additive class that retains the mass readout of Theorem Z.8h, assigns the two pinned scales $\{4,8\}$ to parity and charge conjugation in either order, and allows nonnegative even spin increments, every rule has at least one of $0^{-+}$ and $2^{-+}$ with $|\tau_{\mathrm{diag}}|>4$. Allowing arbitrary covariance with the common denominator weakens the first-order guaranteed bound but still leaves at least one of these two rows more than $3.1$ maximal propagated statistical standard deviations from the branch prediction.

**Status.** The canonical shell-assignment and mass-readout branch is rejected on the stated benchmark and is retired from the falsifiable-prediction registry (Remark Z.8h.4). The independently derived statements that remain are
$$
a=2,
\qquad b=6,
\qquad M=24,
\qquad a^2=|v|_{\min}^2=4,
\qquad d_{\mathrm{Golay}}=8.
$$
Neither the physical identification of $0^{++}$ with the minimum shell nor the assignment of $4$ and $8$ to $P$ and $C$ survives as a derived glueball statement. Corollary Z.8h.1 remains only a conditional arithmetic ordering inside the retired branch.

Because $\operatorname{Aut}(\Lambda_{24})$ is finite, no nontrivial continuous embedding $SO(3)\hookrightarrow\operatorname{Aut}(\Lambda_{24})$ exists. Any reinstated spectrum branch that identifies physical rotations through Leech-lattice automorphisms therefore requires a declared finite rotational subgroup
$$
G_{\mathrm{rot}}\le SO(3),
\qquad
G_{\mathrm{rot}}\hookrightarrow\operatorname{Aut}(\Lambda_{24}),
$$
together with a continuum-spin reconstruction or subduction rule, an orbit-to-shell readout, and all numerical choices fixed before comparison with a new held-out continuum dataset. The existing value
$$
\frac{m(0^{-+})}{m(0^{++})}=1.549(16)
$$
is an already observed benchmark, not a preregistered prediction.

The Scalar-Channel Hyperon Spin Filter below cites Theorem Z.8k and does not use the retired $J^{PC}$-to-shell assignment or mass readout.

**Scalar-Channel Hyperon Spin Filter.**
The same scalar $0^{++}$ branch gives a collider-level spin-correlation filter:
$$
P^{\rm PU}_{\Lambda\bar{\Lambda},{\rm SR}}
=
\frac13\eta^{\rm PU}_{0^{++}\rightarrow\Lambda\bar{\Lambda}},
\qquad
P^{\rm PU}_{\Lambda\bar{\Lambda},{\rm LR}}=0,
$$
and
$$
P^{\rm PU}_{\Lambda\Lambda}
=
P^{\rm PU}_{\bar\Lambda\bar\Lambda}
=
P^{\rm PU}_{K_S^0K_S^0}
=
0.
$$
For radial bins,
$$
P^{\rm PU}_{\Lambda\bar{\Lambda}}(r)
=
\frac13
\eta^{\rm PU}_{0^{++}\rightarrow\Lambda\bar{\Lambda}}
\Omega_{\rm PU}(r),
$$
where $\Omega_{\rm PU}$ is the compact-support envelope of Corollary Z.8k.1. The discriminating test is not a generic nonzero hyperon correlation; it is the full selection pattern: nonzero short-range charge-conjugate $\Lambda\bar\Lambda$, no long-range scalar memory, and null same-sign/spin-zero controls. A stable nonzero same-sign or $K_S^0K_S^0$ spin-correlation slope in the same scalar-channel cuts falsifies the filter branch.

### 13.8.4 Conditional Landauer Horizon Spectroscopy

Appendix Q, Definition Q.0.7u, defines a horizon closed-loop transfer branch for near-horizon modes whose round-trip phases can be compared with MPU-cycle phases. On that branch, Proposition Q.0.19 gives the conditional phase-grid signature
$$
x := \frac{\hbar\omega}{k_B T_H}=\omega\tau_H,
\qquad
\operatorname{dist}_{2\pi}(x,N\ln2)\le\varepsilon_{\mathrm{peak}},\qquad\text{with exact central labels }[N\ln2]_{2\pi}.
$$

The two fixed scales are:
- closure period $2\pi$;
- SPAP cycle step $\ln2$.

Their ratio is
$$
\alpha_L=\frac{\ln2}{2\pi}\approx0.110317800,
\qquad
\beta_L=\frac{2\pi}{\ln2}\approx9.064720284.
$$
By Lemma Q.0.7b, $\alpha_L$ is transcendental and hence irrational.

**Low-defect phase hierarchy.** Corollary Q.0.19b gives the first continued-fraction low-defect phase pairs:

| Rank | $(k,N)$ | $\lvert\alpha_L-k/N\rvert$ | $\delta_N=\lvert N\ln2-2\pi k\rvert$ |
|:----:|:--------|:----------------:|:-------------------------:|
| 1 | $(1,9)$ | $7.93\times10^{-4}$ | $0.0449$ |
| 2 | $(15,136)$ | $2.37\times10^{-5}$ | $0.0202$ |
| 3 | $(31,281)$ | $2.49\times10^{-6}$ | $0.00439$ |
| 4 | $(139,1260)$ | $3.40\times10^{-7}$ | $0.00269$ |
| 5 | $(170,1541)$ | $1.75\times10^{-7}$ | $0.00170$ |

**Three-gap finite-budget test.** For any finite cutoff $N_{\max}$, the exact central labels $\{N\ln2\bmod2\pi:N=1,\ldots,N_{\max}\}$ partition $[0,2\pi)$ into at most three distinct gap lengths by Proposition Q.0.7n. For cyclically order-matched measured peaks, each observed adjacent gap must lie within $2\varepsilon_{\mathrm{peak}}$ of its central gap.

**Falsification conditions on this branch:**
- no label-matched phase-grid component within the registered tolerance of $[N\ln2]_{2\pi}$ in a system independently shown to satisfy Definition Q.0.7u;
- a measured exact rational phase-step ratio replacing $\alpha_L$;
- a dimensionless phase grid whose positions vary with horizon mass after transforming to $x=\hbar\omega/(k_B T_H)$.

**Status:** This is a conditional transfer-branch prediction. It does not replace ordinary greybody-factor calculations and does not assert universal amplitudes, widths, or envelopes.

### 13.8.5 Postselected Momentum-Sign Witness for Source-Superposition Interferometry

The exploratory source-superposition benchmark in Section 13.10.8 compares the preregistered channel hypotheses $H_{\mathrm{sep}}$ and $H_{\mathrm{phase}}$. This subsection gives a sign witness for the single-superposed-source protocol class analyzed by Saldanha, Marletto, and Vedral [2026]. Let
$$
\varphi_X(p)
=(2\pi\sigma_p^2)^{-1/4}
\exp\left[-\frac{(p-\delta_X)^2}{4\sigma_p^2}\right],
\qquad
X\in\{A,B\},
\qquad
0<\delta_B<\delta_A,
$$
with $\alpha,\beta>0$, $\alpha^2+\beta^2=1$, visibility $V\in[0,1]$, and
$$
O:=\exp\left[-\frac{(\delta_A-\delta_B)^2}{8\sigma_p^2}\right],
\qquad
d:=\delta_A-\delta_B.
$$

**Definition 13.8.5a (Classical Momentum-Exchange Class $\mathfrak G_{\mathrm{cl}}$).** A channel belongs to $\mathfrak G_{\mathrm{cl}}$ when every run admits a joint distribution over $(\lambda,\xi,r,a)$ such that:

1. $\lambda\in\{A,B\}$, $P(\lambda=A)=\alpha^2$, $P(\lambda=B)=\beta^2$, and $p=\delta_\lambda+\xi$;
2. $P(a=1\mid\lambda,\xi,r)=P(a=1\mid r)$;
3. $\mathbb E[\xi\mid\lambda,a=1]=0$ for both values of $\lambda$.

Momentum-dependent acceptance or record-conditioned backaction lies outside this class when it violates item 2 or makes $\mathbb E[\xi\mid\lambda,a=1]\ne0$ in violation of item 3; such alternatives require separate hypotheses.

**Theorem 13.8.5b (Convex-Hull Bound).** If $P(a=1)>0$, every channel in $\mathfrak G_{\mathrm{cl}}$ satisfies
$$
\langle p\rangle_{\mathrm{ps}}
=w_A\delta_A+w_B\delta_B,
\qquad
w_\lambda=P(\lambda\mid a=1),
$$
and hence
$$
\langle p\rangle_{\mathrm{ps}}\in[\delta_B,\delta_A].
$$

*Proof.* Conditional total expectation and item 3 give
$$
\mathbb E[p\mid a=1]
=\sum_\lambda P(\lambda\mid a=1)
\left(\delta_\lambda+\mathbb E[\xi\mid\lambda,a=1]\right),
$$
which is the displayed convex combination. ∎

**Lemma 13.8.5c (Postselected Gaussian Distribution).** The unnormalized dark-port density is
$$
w(p)=\frac12\left[
\alpha^2\varphi_A(p)^2+\beta^2\varphi_B(p)^2
-2V\alpha\beta\varphi_A(p)\varphi_B(p)
\right].
$$
With $\widetilde P:=1-2V\alpha\beta O$,
$$
P_{\mathrm{ps}}=\frac12\widetilde P,
$$
$$
\langle p\rangle_{\mathrm{ps}}
=
\frac{\alpha^2\delta_A+\beta^2\delta_B
-V\alpha\beta O(\delta_A+\delta_B)}{\widetilde P},
$$
$$
\operatorname{Var}_{\mathrm{ps}}
=
\sigma_p^2+
\frac{d^2}{4\widetilde P}
\left[1-\frac{(\alpha^2-\beta^2)^2}{\widetilde P}\right].
$$

*Proof.* Put $m=(\delta_A+\delta_B)/2$ and $d=\delta_A-\delta_B$, and let
$$
g_m(p)=(2\pi\sigma_p^2)^{-1/2}
\exp\!\left[-\frac{(p-m)^2}{2\sigma_p^2}\right].
$$
The identity
$$
(p-\delta_A)^2+(p-\delta_B)^2
=2(p-m)^2+\frac{d^2}{2}
$$
gives
$$
\varphi_A(p)\varphi_B(p)=O\,g_m(p).
$$
Since $g_m$ is a normalized Gaussian of mean $m$ and variance $\sigma_p^2$,
$$
\int\varphi_A\varphi_B\,dp=O,
\qquad
\int p\varphi_A\varphi_B\,dp=Om,
\qquad
\int(p-m)^2\varphi_A\varphi_B\,dp=O\sigma_p^2.
$$
Also $\varphi_X^2$ is a normalized Gaussian of mean $\delta_X$ and variance $\sigma_p^2$. Therefore
$$
\int w(p)\,dp
=\frac12\bigl(\alpha^2+\beta^2-2V\alpha\beta O\bigr)
=\frac12\widetilde P,
$$
and
$$
\int p\,w(p)\,dp
=\frac12\left[
\alpha^2\delta_A+\beta^2\delta_B
-2V\alpha\beta Om
\right].
$$
Division by $P_{\mathrm{ps}}=\widetilde P/2$ gives the displayed mean because $2m=\delta_A+\delta_B$.

Relative to $m$, the two diagonal Gaussian means are $d/2$ and $-d/2$, while the cross Gaussian has mean zero. Hence
$$
\mathbb E_{\mathrm{ps}}[p-m]
=\frac{(\alpha^2-\beta^2)d}{2\widetilde P}
$$
and
$$
\mathbb E_{\mathrm{ps}}[(p-m)^2]
=\frac{\sigma_p^2\widetilde P+d^2/4}{\widetilde P}
=\sigma_p^2+\frac{d^2}{4\widetilde P}.
$$
Subtracting the square of the first centered moment gives
$$
\operatorname{Var}_{\mathrm{ps}}
=\sigma_p^2+
\frac{d^2}{4\widetilde P}
\left[1-\frac{(\alpha^2-\beta^2)^2}{\widetilde P}\right],
$$
which is the third displayed expression. ∎

**Theorem 13.8.5d (Critical Visibility and Strong-Overlap Limit).** For $P_{\mathrm{ps}}>0$,
$$
\langle p\rangle_{\mathrm{ps}}<0
\quad\Longleftrightarrow\quad
V>V_{\mathrm{crit}}
:=
\frac{\alpha^2\delta_A+\beta^2\delta_B}
{\alpha\beta O(\delta_A+\delta_B)}.
$$
The negative branch is attainable exactly when $V_{\mathrm{crit}}<1$. At $V=1$ and $O\to1$,
$$
\langle p\rangle_{\mathrm{ps}}
\longrightarrow
\delta_{\mathrm{eff}}
:=
\frac{\beta\delta_B-\alpha\delta_A}{\beta-\alpha},
\qquad
P_{\mathrm{ps}}\longrightarrow\frac{(\beta-\alpha)^2}{2}.
$$
For $\beta>\alpha$ and $\alpha\delta_A>\beta\delta_B$, this limiting mean is negative and lies outside the classical hull.

*Proof.* Since $P_{\mathrm{ps}}>0$, the denominator $\widetilde P=2P_{\mathrm{ps}}$ in Lemma 13.8.5c is positive. Its mean is negative exactly when
$$
\alpha^2\delta_A+\beta^2\delta_B
-V\alpha\beta O(\delta_A+\delta_B)<0,
$$
which is equivalent to $V>V_{\mathrm{crit}}$. Because $0\le V\le1$, such a $V$ exists exactly when $V_{\mathrm{crit}}<1$. At $V=O=1$, $\widetilde P=1-2\alpha\beta=(\beta-\alpha)^2$, and the numerator factors as
$$
\alpha^2\delta_A+\beta^2\delta_B-\alpha\beta(\delta_A+\delta_B)
=(\alpha-\beta)(\alpha\delta_A-\beta\delta_B).
$$
Division gives $\delta_{\mathrm{eff}}$, and $P_{\mathrm{ps}}=\widetilde P/2$ gives the stated probability. Under the final two inequalities, the numerator of $\delta_{\mathrm{eff}}$ is negative and its denominator is positive. ∎

**Corollary 13.8.5e (Attainable-Branch Amplification–Visibility Identity).** At $O=1$, $\beta>\alpha$, and $\alpha\delta_A>\beta\delta_B$,
$$
(1-V_{\mathrm{crit}})|\delta_{\mathrm{eff}}|
=
\frac{(\alpha\delta_A-\beta\delta_B)^2}
{\alpha\beta(\delta_A+\delta_B)}.
$$
The right side is not independent of $\varepsilon:=\beta-\alpha$ at finite $\varepsilon$. Its normalized $\varepsilon\to0^+$ limit is
$$
\frac{(\delta_A-\delta_B)^2}{\delta_A+\delta_B}.
$$

*Proof.* Put $D=\alpha\delta_A-\beta\delta_B>0$ and $\varepsilon=\beta-\alpha>0$. Direct expansion gives
$$
\alpha\beta(\delta_A+\delta_B)-\alpha^2\delta_A-\beta^2\delta_B
=\varepsilon D.
$$
Thus $1-V_{\mathrm{crit}}=\varepsilon D/[\alpha\beta(\delta_A+\delta_B)]$, while $|\delta_{\mathrm{eff}}|=D/\varepsilon$; multiplication proves the identity. As $\varepsilon\to0^+$ subject to $\alpha^2+\beta^2=1$, $\alpha,\beta\to1/\sqrt2$, and substitution gives the displayed limit. ∎

**Proposition 13.8.5f (Asymptotic Standard-Error Budget).** For independent accepted events with finite variance, the Gaussian large-sample design condition for a $5$-standard-error sign resolution is
$$
N_{\mathrm{ps}}
\ge
25\frac{\operatorname{Var}_{\mathrm{ps}}}{\langle p\rangle_{\mathrm{ps}}^2},
\qquad
N_{\mathrm{tot}}
\ge
25\frac{\operatorname{Var}_{\mathrm{ps}}}
{P_{\mathrm{ps}}\langle p\rangle_{\mathrm{ps}}^2}.
$$
In the joint limit $V=1$, $O\to1$ with nonzero $\varepsilon$,
$$
N_{\mathrm{tot}}
\sim
\frac{50\sigma_p^2}{(\alpha\delta_A-\beta\delta_B)^2}.
$$
This is an asymptotic design scaling, not an exact finite-sample lower bound or a Fisher-information theorem.

*Proof.* The standard error of the accepted-sample mean is $\sqrt{\operatorname{Var}_{\mathrm{ps}}/N_{\mathrm{ps}}}$. Requiring $|\langle p\rangle_{\mathrm{ps}}|$ to be at least five times this quantity gives the first inequality. Asymptotically $N_{\mathrm{ps}}=P_{\mathrm{ps}}N_{\mathrm{tot}}+o_p(N_{\mathrm{tot}})$, which gives the second design condition. Put $D=\alpha\delta_A-\beta\delta_B$. In the strong-overlap limit, $P_{\mathrm{ps}}\to\varepsilon^2/2$, $\langle p\rangle_{\mathrm{ps}}\to-D/\varepsilon$, and $\operatorname{Var}_{\mathrm{ps}}\sim\sigma_p^2$. Hence $P_{\mathrm{ps}}\langle p\rangle_{\mathrm{ps}}^2\to D^2/2$, yielding the stated scaling. ∎

**Proposition 13.8.5g (Variance Scope).** Every channel in $\mathfrak G_{\mathrm{cl}}$ with finite accepted second moments obeys
$$
\operatorname{Var}_{\mathrm{ps}}^{\mathrm{cl}}
=
\sum_{\lambda\in\{A,B\}}
w_\lambda\operatorname{Var}(\xi\mid\lambda,a=1)
+w_Aw_Bd^2.
$$
Because Definition 13.8.5a does not constrain the accepted conditional noise variances, no class-wide variance discriminator follows. The registered endpoint is the sign of the mean; any variance test requires an additional calibrated noise class.

*Proof.* Conditional on $(\lambda,a=1)$, the accepted momentum has mean $\delta_\lambda$ by Definition 13.8.5a and variance $\operatorname{Var}(\xi\mid\lambda,a=1)$. The conditional law of total variance gives
$$
\operatorname{Var}(p\mid a=1)
=
\sum_\lambda w_\lambda\operatorname{Var}(\xi\mid\lambda,a=1)
+
\operatorname{Var}(\delta_\lambda\mid a=1).
$$
For a two-point variable taking $\delta_A$ and $\delta_B$ with probabilities $w_A,w_B$, the last variance is $w_Aw_B(\delta_A-\delta_B)^2=w_Aw_Bd^2$. Since the first two conditional variances are unrestricted nonnegative finite numbers, the class has no common variance bound. ∎

**Benchmark evaluation.** Set
$$
\beta=\frac1{\sqrt2}+3\times10^{-4},
\qquad
\alpha=\sqrt{1-\beta^2},
\qquad
\delta_A=10\delta_B,
\qquad
s:=\frac{\sigma_p}{\delta_B},
\qquad
V=1.
$$
Then
$$
\alpha=0.70680665\ldots,
\quad
\beta=0.70740678\ldots,
\quad
\varepsilon=0.000600127\ldots,
$$
$$
O(s)=\exp\left(-\frac{81}{8s^2}\right),
\quad
P_{\mathrm{ps}}(s)=\frac12[1-2\alpha\beta O(s)],
\quad
V_{\mathrm{crit}}(s)=\frac{0.9993059623\ldots}{O(s)}.
$$
A negative mean is physically attainable only when
$$
O(s)>0.9993059623\ldots,
\qquad
s>120.762\ldots.
$$
In the strong-overlap limit,
$$
P_{\mathrm{ps}}\to1.80076\times10^{-7},
\qquad
\delta_{\mathrm{eff}}\to-1.05989\times10^3\delta_A,
$$
and the asymptotic event budget becomes
$$
N_{\mathrm{tot}}\sim1.23585
\left(\frac{\sigma_p}{\delta_B}\right)^2.
$$
At finite $s$, all acceptance, mean, variance, and event-budget entries use the exact formulas above. If $V(\tau)=e^{-\Gamma\tau}$ with $\Gamma\ge0$, sign persistence requires
$$
\Gamma<\frac{-\ln V_{\mathrm{crit}}(s)}{\tau}.
$$
For $\tau=0.1\,\mathrm s$, the strong-overlap endpoint is $6.943\times10^{-3}\,\mathrm{s^{-1}}$.

**Falsification rows.**

- R1: at calibrated finite $O$, if the accepted joint calibration region lies entirely in $V>V_{\mathrm{crit}}$, a preregistered confidence interval for $\langle p\rangle_{\mathrm{ps}}$ contained in $[0,\infty)$ rejects the declared coherent Gaussian realization, not every possible $H_{\mathrm{phase}}$ completion.
- R2: with calibrated $\delta_B>0$, a preregistered confidence interval for $\langle p\rangle_{\mathrm{ps}}$ contained in $(-\infty,0)$ rejects every channel in $\mathfrak G_{\mathrm{cl}}$ for the tested apparatus class, but does not identify a unique gravitational or collapse completion.
- R3: on the declared visibility law, if the lower confidence bound for $\Gamma$ exceeds the upper propagated bound on $-\ln V_{\mathrm{crit}}/\tau$ while the mean-confidence interval remains entirely negative, that visibility model is rejected.

**Remark 13.8.5h (Scope).** The quantum calculation uses Born-rule statistics of the declared postselected Gaussian ensemble. The witness does not require a PU-specific modification. Its classical exclusion is only as broad as the explicit premises of Definition 13.8.5a.

## 13.9 Prediction 4: Conditional Golay Alignment from PCE Structure

Beyond the CC-specific predictions of Sections 13.1–13.5, the PU framework proposes a substrate-alignment test on a certified 24-mode distance-eight coding branch. The PCE rate gate fixes the dimension, while a separate existence/selection certificate must supply minimum distance eight. Existing code-performance data are comparison evidence; they do not establish substrate alignment.

### 13.9.1 Theorem 54 (Conditional Golay Selection)

Assume the minimal $M=24$ interface branch and the predictive-recovery MacWilliams rate gate. Then every binary linear rate minimizer has $n=24$ and $k=12$, and the Griesmer bound gives $d\le8$. If a separate construction/selection certificate supplies a retained binary linear code attaining $d=8$, then it is equivalent under a permutation of coordinates to the extended binary Golay code $\mathcal G_{24}$.

*Proof.* Theorem Z.5 gives
$$
n=M=2ab=2\times2\times6=24.
$$
For a binary length-$24$ code, $\dim C^\perp=24-\dim C$. The zero-penalty condition of Theorem Z.13b.0a therefore gives
$$
\dim C=\dim C^\perp=12.
$$
This proves $k=12$ but does not prove attainment of $d=8$. The Griesmer bound for a binary linear $[24,12,d]$ code excludes $d\ge9$, so $d\le8$. Under the separate $d=8$ construction/selection certificate, Theorem U.1 applies to the resulting binary linear $[24,12,8]$ code and gives equivalence to $\mathcal G_{24}$ under a coordinate permutation. ∎

### 13.9.2 Hypothesis 54.1 (Code-Substrate Alignment)

If a physical quantum substrate has a separately certified response coupling aligned with the PCE-Attractor code structure, then Golay-derived implementations may exhibit a performance advantage not accounted for by their ordinary code parameters and the registered physical noise model. The response coupling, comparator code family, decoder, hardware constraints, and predicted advantage interval must be specified before comparison.

The predictive-recovery rate gate gives $k=12$, and the binary-linear Griesmer converse gives $d\le8$. If a separate construction/selection certificate supplies a retained code with $d=8$, Theorem U.1 identifies that binary linear $[24,12,8]$ code with the extended Golay code up to coordinate permutation. None of these mathematical statements predicts reduced physical noise, improved syndrome extraction, or enhanced logical-gate performance. Those effects constitute the substrate-alignment hypothesis tested by Protocol 4.

### 13.9.3 Empirical Evidence from Existing Literature

Comparative studies in quantum error correction provide support for the Golay code's exceptional performance:

**Evidence 1: Fault-Tolerance Threshold**

Cross, DiVincenzo, and Terhal (2009) conducted a comprehensive comparative study of quantum codes for fault tolerance using the Aliferis-Gottesman-Preskill (AGP) extended rectangle method. Their analysis of codes ranging from the 7-qubit Steane code to various Bacon-Shor and surface codes found that the quantum Golay code achieved the highest level-1 depolarizing pseudo-threshold in their study, at $(2.25 \pm 0.03) \times 10^{-3}$. This threshold exceeded that of many codes with both smaller and larger block sizes.

**Evidence 2: Architecture-Specific Gigaquop Resource Estimate**

Ibe et al. (2025) analyze measurement-based fault-tolerant quantum-computation schemes based on the Steane code $[[7,1,3]]$ and the punctured Golay code $[[23,1,7]]$ under their circuit-level depolarizing-noise and resource assumptions. Their numerical study exhibits the expected leading distance scaling:

| Code | Parameters | Leading error scaling | Reported $T$-gate regime at $p=10^{-4}$ |
|------|------------|-----------------------|------------------------------------------|
| Steane | $[[7,1,3]]$ | $O(p^2)$ | approximately $2.4\times10^6$ |
| Golay | $[[23,1,7]]$ | $O(p^4)$ | more than $2\times10^9$ |

The ratio of these reported operation counts is greater than $833$. For an odd-distance code correcting $t=(d-1)/2$ faults, the leading stochastic-fault order is $p^{t+1}=p^{(d+1)/2}$, giving $p^2$ for $d=3$ and $p^4$ for $d=7$.

*Interpretation:* These are theoretical and numerical, architecture-specific resource estimates. They are consistent with ordinary distance-based fault-tolerance scaling and do not constitute a hardware demonstration, a selection proof for the classical $[24,12,8]$ code, or evidence for physical 24-mode substrate alignment.

**Evidence 3: Practical Deployment in Classical Communication**

The classical Golay code's exceptional performance is validated by real-world deployment in high-reliability communication systems:

- **Voyager 1 & 2 spacecraft** (1979–1981): The Golay code replaced the Reed-Muller code for color image transmission from Jupiter and Saturn, enabling higher data rates within constrained bandwidth (Curtis 2016).
- **MIL-STD-188**: U.S. military standard for automatic link establishment in HF radio systems employs Golay-based error correction (Johnson 1991).

*Note:* These classical deployments demonstrate the code's practical superiority but do not directly test the quantum substrate alignment hypothesis.

**Evidence 4: Structural Properties**

The extended binary Golay code possesses exceptional structural properties:

- Self-duality of the parent code
- Mathieu group $M_{24}$ symmetry
- Connection to the Leech lattice $\Lambda_{24}$ via the gluing construction (Conway & Sloane 1999)

These mathematical properties suggest the code occupies a special position in the space of possible error-correcting structures.

### 13.9.4 Theoretical Interpretation: Exact Scope

Standard coding bounds exclude binary linear $[24,12,d]$ codes with $d\ge9$, so $d\le8$. The extended Golay construction proves that distance $8$ is attainable and therefore optimal in that parameter class. The rate and block-length gates alone do not prove attainment. Once a separate construction/selection certificate supplies a binary linear $[24,12,8]$ code, Theorem U.1 identifies it with the extended Golay code up to coordinate permutation.

The code's Mathieu symmetry is then a mathematical property of the identified Golay code. A Leech connection additionally requires Lemma R.4.5's registered discriminant-form/coset-minimum datum and Equation (R.4.2a.1). Physical substrate alignment and spacetime claims retain their own response and mode-channel certificates.

The branch ledger therefore has four distinct steps:

1. $n=24$ from the QFI mode count $M=2ab$ (Theorem Z.5);
2. $k=12$ from equality of the predictive and recovery dimensions (Definition Z.13b.0; Theorem Z.13b.0a);
3. $d\le8$ from the binary-linear Griesmer converse, with $d=8$ attained by $\mathcal G_{24}$;
4. identification with $\mathcal G_{24}$ after a separate $d=8$ construction/selection certificate invokes Theorem U.1 for the binary linear $[24,12,8]$ class.

These steps establish conditional code selection. Type-II structure follows for the classified $[24,12,8]$ equivalence class, but neither Leech gluing nor a physical error-correction architecture follows from the rate penalty or the code classification.

### 13.9.5 Theorem 55 (Conditional 24-Mode Compatibility Ledger)

The count $M=24$ enters three separate branches:

1. the predictive-recovery rate gate gives $k=12$, and an additional minimum-distance-eight construction/selection certificate gives $\mathcal G_{24}$ by Theorem U.1;
2. a supplied discriminant-form/coset-minimum datum satisfying Lemma R.4.5 and Equation (R.4.2a.1) gives $\Lambda_{24}$;
3. the independent faithful-shell certificate gives $24\le K(D)$ and selects the least feasible $D=4$ using $K(3)=12$ and the regular $24$-cell.

The shared count is a compatibility ledger, not an unconditional sequence. The rate gate does not supply distance-eight attainment, Lemma R.4.5 does not produce its own gluing datum, and neither code nor lattice selection establishes the mode-channel certificate.

The three conditional arrows are
$$
M=24 \xrightarrow{\substack{\text{rate gate plus}\\\text{distance-eight certificate}}} \mathcal{G}_{24},\qquad
\mathcal{G}_{24} \xrightarrow{\text{registered Lemma R.4.5 datum}} \Lambda_{24},\qquad
M=24\xrightarrow{\text{verified response-labeled 24-cell; least-feasible cost}}D=4.
$$
Accordingly, the code, lattice, and spacetime-dimension branches share a numerical 24-mode backbone but retain distinct hypotheses.

*Proof.* Definition Z.13b.0 and Theorem Z.13b.0a give $k=12$. The minimum-distance-eight certificate identifies the resulting $[24,12,8]$ code with $\mathcal G_{24}$, and the separate gluing datum supplies $\Lambda_{24}$. Independently, Definition Z.9a and Theorems Z.10--Z.11 give $24\le K(D)$, exclude $D\le3$ by $K(3)=12$, realize the shell with the regular $24$-cell, and select the least feasible $D=4$. No branch supplies another branch's missing certificate. ∎

### 13.9.6 Classical Code, CSS State, and Quantum-Code Scope

| Object | Parameters | Certified statement |
|:--|:--|:--|
| Extended binary Golay code | $[24,12,8]$ | classical code on the predictive-recovery branch |
| Self-dual CSS construction | $[[24,0]]$ stabilizer state | one mathematical state; no logical-qubit protection claim |
| Punctured quantum Golay code | $[[23,1,7]]$ | one logical qubit with standard distance-$7$ error correction |

The $k=0$ CSS construction may be labeled $[[24,0,8]]$ only under a stated stabilizer-state distance convention. It is not thereby a physical vacuum. Such an interpretation requires a Hamiltonian or dynamics, encoder, physical channel, syndrome instrument, recovery map, and response certificate. The quantum Hamming bound is satisfied by the punctured code but is not saturated, and it does not prove maximum distance at fixed $(n,k)$.



The first table separates three objects that must not be conflated. Theorem 54 selects the classical $[24,12,8]$ carrier only on the predictive-recovery rate branch with the fixed-rate distance-maximization objective. The self-dual CSS construction gives a unique $[[24,0]]$ mathematical stabilizer state with $12$ independent $X$-type and $12$ independent $Z$-type generators and $M_{24}$ permutation symmetry; it becomes a physical-vacuum realization only when a registered Hamiltonian or dynamics, encoder, physical channel, syndrome instrument, recovery map, and response certificate realize that state on the same branch.

For physical error correction, Proposition Z.13b.7 supplies the punctured $[[23,1,7]]$ CSS code witness. An accepted Golay-QEC bootstrap record $\mathfrak C_{\mathrm{GQEC}}$ of Definition A.0.1q.1 then supplies the noise, syndrome, recovery, threshold, protected-gate, overhead, and branch-overlap data, and Theorem A.0.2a promotes the witness to a QEC compatibility certificate on exactly the covered finite windows. Protocol 4 tests this certificate-complete substrate-alignment claim against structurally similar alternatives.

**Remark on Quantum Bounds.** The quantum Hamming bound constrains nondegenerate quantum codes. For a $[[n,k,d]]$ code with $t=\lfloor(d-1)/2\rfloor$ correctable errors, it requires
$$
\sum_{j=0}^{t}3^j\binom{n}{j}\le2^{n-k}.
$$
For the $[[23,1,7]]$ quantum Golay code, the left side is
$$
\sum_{j=0}^{3}3^j\binom{23}{j}=50{,}164<2^{22}=4{,}194{,}304,
$$
so the code satisfies but does not saturate the bound. This inequality does not prove maximum distance for given $(n,k)$; indeed, its $t=4$ sum is $767{,}419<2^{22}$ and therefore does not exclude $d=9$.

### 13.9.7 Protocol 4: Discriminating Tests for Substrate Alignment

To distinguish the PU explanation from standard coding theory, we propose targeted experimental comparisons:

**Protocol 4.1: Structural Comparison at Fixed Parameters**

*Objective:* Compare performance of Golay-structured codes against alternative codes with similar mathematical parameters but different internal structure.

*Method:*

1. Implement the $[[23, 1, 7]]$ quantum Golay code on high-connectivity hardware (trapped ions, neutral atoms)
2. Implement alternative CSS codes with comparable $[[n, k, d]]$ parameters (e.g., randomly constructed $[[23, 1, \leq 7]]$ stabilizer codes)
3. Measure logical error rates under identical physical noise conditions
4. Compare observed performance ratios against theoretical predictions from distance alone

*Substrate-alignment hypothesis:* Hypothesis 54.1 must supply a prospective positive margin and uncertainty interval before comparison. The Golay selection and classification theorems alone predict no excess hardware performance beyond the registered code, decoder, and noise model.

*Null Hypothesis:* Performance differences are fully explained by mathematical distance bounds.

**Protocol 4.2: Rate Optimality Test**

*Objective:* Test whether rate $R=1/2$ represents an optimal operating point for a preregistered hardware, decoder, and noise model.

*Method:*

1. Construct a family of $[24,k,d(k)]$ codes with varying $k\in\{8,10,12,14,16\}$
2. Measure logical fidelity per physical qubit across the family under the same registered apparatus model
3. Determine the empirical optimal rate $R^*_{\mathrm{emp}}$ and its uncertainty

*Substrate-alignment hypothesis:* Hypothesis 54.1 must supply a prospective interval for $R^*_{\mathrm{emp}}$ before this comparison. The structural value $k/24=1/2$ does not itself determine the hardware optimum or a tolerance interval.

*Alternative:* The optimum follows the registered hardware and noise model without an additional substrate-alignment response.

**Protocol 4.3: Block Length Optimality Test**

*Objective:* Test whether $n=24$ is preferred for a preregistered hardware, decoder, normalization, and noise model.

*Method:*

1. Compare code families at block lengths $n\in\{16,20,24,28,32\}$
2. Normalize by the registered resource and performance convention
3. Estimate the block-length response with uncertainty

*Substrate-alignment hypothesis:* A disproportionate $n=24$ advantage must be supplied prospectively by the response certificate of Hypothesis 54.1; the structural mode count alone provides no hardware-performance interval.

*Null Hypothesis:* Performance follows the registered code, decoder, hardware, and noise variables without an additional $n=24$ response.

**Protocol 4.4: Golay Noise Spectroscopy**

*Objective:* Test whether the irreducible residual correlated noise of a clean 24-mode interface carries the Golay shell fingerprint rather than a generic hardware-specific weight distribution.

*Method:*

1. Choose a 24-mode interface basis and register the marked Golay-Leech frame used for decoding.
2. Prepare standardized probe states and repeatedly measure binary residual event patterns
$$
e\in\mathbb F_2^{24}.
$$
3. Fit and subtract ordinary device-local channels, including readout errors, leakage, single-mode noise, nearest-neighbor correlations, calibration drift, and known crosstalk.
4. Condition the remaining residual events on $|e|=8$ and compute
$$
\mathcal R_8
:=
\frac{
\mathbb P(e\in\mathcal O_8\mid |e|=8)
}{
759/\binom{24}{8}
}.
$$
5. For residual events supported on $\mathcal O_8$, test the Steiner incidence sequence
$$
\lambda_1:\lambda_2:\lambda_3:\lambda_4:\lambda_5
=
253:77:21:5:1.
$$
6. In a controlled decoder-boundary subtest, inject or isolate weight-4 tetrads $T$ and group them by the Golay syndrome quotient
$$
\sigma(1_T)=1_T+\mathcal G_{24}.
$$
The predicted first non-correctable shell consists of $1771$ syndrome classes, each containing exactly six tetrads.
7. Repeat after interface-basis changes and across hardware platforms to distinguish a fixed Golay-frame signal from device-specific correlations.

*PU Prediction on the substrate-aligned residual branch:* The observed octad excess obeys
$$
\mathcal R_8=1+968\eta_8,
$$
with $\eta_8>0$ when a substrate octad component is present. The conditional octad incidence statistics obey the exact $S(5,8,24)$ ratios. The controlled weight-4 decoder-boundary subtest obeys the sextet law of Corollary Z.13b.5: $1771$ syndrome classes, six tetrads per class.

*Null Hypothesis:* After conditioning on weight and subtracting device-local noise, residual weight-8 patterns are exchangeable or hardware-specific rather than Golay-octad-supported; therefore $\mathcal R_8\approx1$ and the $253:77:21:5:1$ incidence sequence is absent. Under a generic rate-$\tfrac12$ code or unmarked hardware frame, weight-4 syndrome fibers need not form $M_{24}$-transitive six-tetrad sextets.

**Protocol 4.5: Octad-Hessian Stiffness Spectroscopy**

*Objective:* Test the exact centered octad stiffness fingerprint of the Golay-Steiner branch independently of logical-code decoding performance.

*Method:*

1. Register a marked 24-mode coordinate frame and the associated octad set $\mathcal O_8$ of the Steiner system $S(5,8,24)$.
2. Implement or emulate the centered octad potential
   $$
   Q_{\mathrm{oct}}(u)
   =
   \kappa
   \sum_{O\in\mathcal O_8}
   \left(\sum_{i\in O}(u_i-\bar u)\right)^2,
   \qquad
   \bar u=\frac1{24}\sum_{i=1}^{24}u_i,
   $$
   with the scalar stiffness $\kappa>0$ fixed by calibration or set to $1$ in a simulator.
3. Apply small controlled perturbations $u$ spanning the uniform direction and the centered subspace $\mathbf1^\perp$.
4. Reconstruct the empirical Hessian $\widehat H$ from the quadratic response.
5. Diagonalize $\widehat H$ after projecting out the uniform mode.

*PU Prediction on the exact Golay-Steiner stiffness branch:* The Hessian is
$$
H_{\mathrm{oct}}
=
352\kappa
\left(I-\frac1{24}\mathbf1\mathbf1^T\right).
$$
Thus the spectrum is
$$
0\quad\text{with multiplicity }1,
\qquad
352\kappa\quad\text{with multiplicity }23.
$$
Equivalently, after dividing by the fitted scalar stiffness $\kappa$, the nonzero stiffness sector is exactly 23-fold degenerate at $352$.

*Null Hypothesis:* A generic 24-mode network with similar pair or higher-order couplings has no reason to produce a one-dimensional uniform kernel and a perfectly degenerate 23-dimensional centered stiffness sector. Stable splitting of the centered eigenvalues after subtracting calibrated device anisotropy falsifies the exact Golay-Steiner stiffness branch.

*Implementation Status.* Protocol 4.5 admits two distinct realization gates that should not be conflated:
- **Emulator gate (numerical):** the centered octad quadratic form $Q_{\mathrm{oct}}$ is evaluated on a classical simulator over a registered 24-coordinate frame using the explicit list of $759$ octads of $S(5,8,24)$. This is a numerical confirmation of Corollary Z.13b.1a's exact arithmetic; it does not test physical instantiation.
- **Physical gate (experimental):** an actual $759$-term eight-body interaction Hamiltonian on a 24-mode device. This is a substantially heavier ask than 24-qubit syndrome decoding (Protocol 4.4) and is not implementable on near-term high-connectivity hardware without architecture-level extensions.

The branch-prediction status (◐) of Protocol 4.5 in the experimental ledger refers to the emulator gate; the physical gate is flagged separately as untested (○) and architecture-pending.

**Feasibility Assessment:** Protocol 4.4 is experimentally implementable in principle with current high-connectivity quantum-computing platforms. Protocol 4.5 is currently closed at the classical-emulator audit level; its physical gate remains architecture-pending because a native or compiled $759$-term octad-coupling quadratic response is not a standard near-term primitive. High-connectivity platforms (trapped ions, neutral atoms, superconducting circuits with all-to-all connectivity) can implement 24-qubit logical blocks relevant to Protocol 4.4. The main experimental challenges are:

- Achieving sufficient syndrome extraction fidelity to distinguish PCE-alignment effects from implementation noise
- Controlling for noise model dependencies across different code families
- Obtaining sufficient statistics to detect potentially small performance differences

Near-term implementations could begin with Protocol 4.1 on existing 20–50 qubit systems.

### 13.9.8 Quantitative Predictions and Falsification Criteria

**Hypothesis 4.1 (Threshold-Enhancement Test):** On a substrate-alignment branch carrying the response coupling, comparator family, decoder, hardware, and noise-model data required by Hypothesis 54.1, with $p_{\mathrm{th}}^{\mathrm{generic}}>0$, the threshold ratio
$$
\mathcal R_{\mathrm{th}}
=
\frac{p_{\mathrm{th}}^{\mathrm{Golay}}}{p_{\mathrm{th}}^{\mathrm{generic}}}
$$
must be entered with a prospective interval before comparison. The conditional code-selection theorems alone supply no numerical lower bound on $\mathcal R_{\mathrm{th}}$.

**Hypothesis 4.2 (Rate-Optimality Test):** A claim that rate $R=1/2$ minimizes logical error per physical qubit for $n=24$ requires a separately registered hardware response and noise-model certificate. The predictive-recovery dimension penalty selects $k=12$ on its coding branch but does not determine a hardware logical-error optimum across noise models.

**Prediction 4.3 (Golay Residual Syndrome Spectrum):** On the substrate-aligned residual branch, after a closed device-noise budget, the residual correlated event law satisfies
$$
\mathcal R_8
=
1+968\eta_8
$$
for some $\eta_8>0$, and the octad-conditioned incidence counts satisfy
$$
\lambda_1:\lambda_2:\lambda_3:\lambda_4:\lambda_5
=
253:77:21:5:1.
$$
The exact substrate component has no native nonzero shell below weight 8. Separately, controlled weight-4 decoder-boundary probes satisfy the sextet law
$$
|\sigma^{-1}(\sigma(1_T))\cap\mathcal T_4|=6,
\qquad
|\sigma(\mathcal T_4)|=1771.
$$

**Prediction 4.4 (Octad-Hessian Stiffness Spectrum):** On the exact Golay-Steiner stiffness branch with scalar stiffness $\kappa$, the centered octad Hessian satisfies
$$
H_{\mathrm{oct}}
=
352\kappa
\left(I-\frac1{24}\mathbf1\mathbf1^T\right).
$$
Therefore the normalized spectrum is
$$
0^{(1)}\oplus352^{(23)}.
$$
A physical implementation with an unknown global stiffness has spectrum $0^{(1)}\oplus(352\kappa)^{(23)}$; the branch prediction is the exact one-dimensional uniform kernel and the exact degeneracy of the 23-dimensional centered eigenspace after registered calibration.

**Falsification Criteria:**

Before unblinding, the substrate-alignment test must freeze a record
$$
\mathfrak T_{\mathrm{Golay}}
=
(\mathcal C_{\mathrm{cand}},\mathcal D,\mathcal N,\mathcal S,
\delta_{\mathrm{eq}},\alpha,\beta,\mathcal M,\mathcal I),
$$
containing the candidate code classes, decoder, finite noise-family grid, primary statistic, equivalence or superiority margin, familywise significance level, target power, multiplicity rule, and simultaneous uncertainty construction. Hypothesis 54.1 is falsified on the covered record if any preregistered global decision rule establishes:

1. equivalence or inferiority of the Golay-derived $[[23,1,7]]$ construction to every registered distance-matched random or CSS comparator;
2. superiority, by the registered margin, of a non-$24$ block length at rate $1/2$ over the complete registered noise grid; or
3. superiority, by the registered margin, of a rate $R\ne1/2$ at block length $24$ over that grid;
4. The observed threshold ratio lies outside the prospective interval supplied by the substrate-response certificate of Hypothesis 54.1, with the registered measurement uncertainty included
5. On an independently substrate-aligned 24-mode interface with a closed device-noise budget, the residual weight-8 spectrum remains exchangeable with $\mathcal R_8=1$ within uncertainty
6. The residual weight-8 spectrum shows a stable structured excess not supported on the 759 Golay octads
7. Octad-conditioned residual events fail the Steiner incidence sequence $253:77:21:5:1$
8. Controlled weight-4 decoder-boundary probes fail the $1771$-class, six-tetrad sextet law
9. A stable $M_{24}$-invariant native residual shell appears at weight $1\le w\le7$
10. On a registered Golay-Steiner octad stiffness implementation, the uniform mode is not the unique zero mode or the centered stiffness eigenvalues split beyond the certified anisotropy and calibration error

### 13.9.9 Implications for Quantum Computing Engineering

If the substrate alignment hypothesis is supported by experimental evidence, the implications for quantum computing architecture include:

1. **Code Selection:** The Golay code and its relatives (punctured Golay, Golay-based concatenated codes) merit priority consideration for fault-tolerant implementations, particularly on high-connectivity platforms.

2. **Block Architecture:** Quantum processors designed with 24-qubit logical blocks as fundamental units may achieve more efficient error correction than arbitrary block sizes.

3. **Concatenation Strategy:** The 12+12 signal-parity structure of the Golay code suggests natural concatenation hierarchies preserving this symmetry.

4. **Hardware-Code Co-design:** Physical qubit layouts optimized for Golay syndrome extraction may achieve performance exceeding generic topological codes (surface codes) despite the latter's geometric locality advantages on planar architectures.

### 13.9.10 Relationship to Other Predictions

The following branch-relative rows share the integer $M=24$ but do not form a single implication chain:

| Result | Source | Branch-specific connection to $M = 24$ |
|--------|--------|-----------------------------------------|
| Fine-structure constant core $\alpha^{-1}_{0}=137.03609205522863\ldots$ and diagnostic-only hypercharge-recoil (operator realization open) row $\alpha^{-1}_{\mathrm{cand}}=\alpha^{-1}_{0}+R_{\alpha}^{YR\perp}=137.03599917753023\ldots$ | Section 13.8.1, Appendix Z | Capacity saturation plus the Appendix Z Ward, interface, curvature, and conditional transport package; the candidate residual additionally requires its operator certificate |
| Euclidean response-carrier dimension $D=4$ | Appendix Z, Definition Z.9a and Theorems Z.10--Z.11 | Faithful response-preserving regular-$24$-cell injection, $K(3)=12$ obstruction, and least-feasible support cost; no $3+1$ spacetime identification follows without the separate operational-continuum, principal-symbol, time-orientation, and metric-reconstruction certificates |
| Geometric norm isolation | Appendix R, Proposition R.4.2a; Appendix Z, Theorem Z.8c and Proposition Z.13a | A certified discriminant-form/coset-minimum gluing datum maps Golay $d=8$ to the absence of a norm-$2$ shell; no dynamical stability follows |
| Standard Model gauge-algebra dimension | Appendices G and T | $\dim[\mathfrak g_{\mathrm{SM}}]=12=k$ on the finite-response block-frame, chirality, determinant, and anomaly-admissibility branch; the equality of integers is not a derivation from Appendix W |


Each row tests its named theorem and certificate package. Agreement or disagreement propagates to another row only through a premise explicitly shared by the two derivation chains.

### 13.9.11 Summary

On the model's twenty-four-mode branch, one added selection rule picks the extended binary Golay code within a specific family of codes. Known engineering successes supply external comparison data for the selected code.

**Technical ledger.**

On the minimal $M=24$ interface branch, the predictive-recovery rate gate gives $k=12$ and the binary-linear distance converse gives $d\le8$. If a separate construction/selection certificate supplies a retained binary linear code with minimum distance $8$, Theorem U.1 selects the extended binary Golay code up to coordinate permutation. This is uniqueness within the binary linear $[24,12,8]$ parameter class, not uniqueness among all code families or physical fault-tolerance architectures. The following external benchmarks are comparison data:

| Finding | Source | Status | PU Interpretation |
|---------|--------|--------|-------------------|
| Golay achieves competitive threshold (~$2 \times 10^{-3}$) | Cross et al. (2009) | Established | External performance benchmark; nondiscriminating for PU |
| Golay enables gigaquop-scale computation (>$10^9$ T gates) | Ibe et al. (2025) | Recent | External engineering benchmark; nondiscriminating for PU |
| Golay achieves $p^4$ scaling (as expected for $d=7$) | Ibe et al. (2025) | Recent | Standard distance behavior; nondiscriminating for PU |
| Golay deployed in critical classical systems | Voyager, MIL-STD-188 | Established | External deployment evidence; nondiscriminating for PU |
| Unique mathematical properties (self-duality, $M_{24}$, $\Lambda_{24}$) | Conway & Sloane (1999) | Established | Exact structural facts; no physical-substrate implication by themselves |

These comparisons establish mathematical structure and engineering performance of Golay-based constructions in their recorded architectures. They neither prove PCE optimality nor validate substrate alignment. Protocol 4 becomes a PU-discriminating test only after $\mathfrak T_{\mathrm{Golay}}$ and the independent substrate-response certificate are frozen and the tested residual structure differs from standard coding and device-noise expectations.

This prospective pathway tests the PU substrate-alignment branch; the external benchmarks above remain nondiscriminating comparison data, and Protocol 4 becomes branch-discriminating under the frozen certificates and residual test just stated.

The detector-covariance and orbit-multiplicity records are declared once, with unique identifiers, in Definitions 13.9.12a–b and Proposition 13.9.12c below. Those declarations govern every subsequent detector-spectrum and sporadic-multiplicity claim; the unbridged orbit counts remain exact finite mathematics but do not imply physical degeneracies.

**Definition 13.9.12a (Detector-Covariance Pushforward Record).** A detector record fixes transfer operators $H_L^{a,mn}(f)$, Hermitian positive-semidefinite path covariance $\widetilde\Sigma(f)$, sampling and PSD conventions, baseline dependence, and a residual such that
$$
S_h^{ab}(f)=
H_L^{a,mn}(f)\widetilde\Sigma_{mnrs}(f)
\overline{H_L^{b,rs}(f)}+R_h^{ab}(f),
\qquad S_h(f)=S_h(f)^\dagger\succeq0.
\tag{13.9.12a.1}
$$
Rank alone determines neither whiteness nor a detector kernel.

**Definition 13.9.12b (Orbit-to-Observable Multiplicity Bridge).** A bridge fixes an orbit-diagonal observable and an injective response-faithful map of an orbit of cardinality $n$ into $n$ linearly independent observable states. A shared-eigenvalue certificate requires those states to have one exact eigenvalue and therefore gives an eigenspace multiplicity of at least $n$. An exact-degeneracy subcertificate additionally proves that their images span the entire common-eigenvalue eigenspace, with no further response-active state at that eigenvalue. The Golay orbit cardinalities are $|\mathcal O_8|=759$ and $|\mathcal O_{12}|=2576$.

**Proposition 13.9.12c (Conditional Sporadic Multiplicity).** A shared-eigenvalue bridge gives a multiplicity lower bound equal to the orbit cardinality. An exact-degeneracy subcertificate makes that cardinality the exact multiplicity. With a nonzero splitting residual the images form only a resolved cluster. A general $M_{24}$-commuting operator has representation-theoretic multiplicities, not automatically orbit cardinalities.

*Proof.* Injectivity and linear independence give $n$ independent states in the common eigenspace, hence dimension at least $n$. Under the exact-degeneracy subcertificate those states also span the whole eigenspace, so its dimension is exactly $n$. A registered splitting instead gives $n$ clustered states but no common eigenspace. Without the bridge, commutation with $M_{24}$ yields an isotypic decomposition whose eigenspace multiplicities depend on irreducible summands and their multiplicity spaces rather than on an orbit cardinality. ∎

## 13.10 Consolidated Falsifiability Analysis

This section catalogs theorem-level, branch-level, validation-level, and model-level rows formulated in the technical appendices and records how each would be rejected at its stated status. A row is a forward test only after its branch, observable map, interval or falsifier, likelihood, artifact model, stopping rule, and status are frozen under Definitions 13.0a and 13.0d. Fixing the discrete core alone does not make every downstream row test-ready.

The predictions fall into three epistemic categories that must be distinguished to prevent conflation of claims of different logical type:

*Theorem-level quantitative predictions* are numerical values obtained from the framework without validation targets, phenomenological kernels, empirical inversions, uncomputed spectral inputs, transferred prefactors, or unclosed residual records. *Branch-level quantitative rows* are numerical values obtained after named branch hypotheses, bridge laws, finite-part conventions, or matching conventions are fixed. *Certificate-pending rows* are deterministic only after their finite certificates are accepted. *Validation and model rows* use validation targets, phenomenological response kernels, transferred prefactors, or status-limited spectral data; these rows are falsifiable as stated branch/model claims but are not counted as theorem-level PU predictions unless their status-carrying inputs are derived from prior PU structure, supplied by an accepted certificate, proved output-null, or removed by a no-go theorem. Thus $D_{\rm car}=4$ is theorem-level only as the Euclidean response-carrier value on the Appendix Z Bures tangent-cell branch; its $3+1$ spacetime interpretation remains certificate-gated, the Appendix Z alpha core $\alpha^{-1}_{0}=137.03609205522863\ldots$ is a theorem-level closed-form core value on its stated branch, the Thomson comparison interval is certificate-pending on $R_\alpha$, the cosmological-constant prefactor is certificate-pending on an accepted canonical $\mathfrak F_U^{(4)}$ of Definition U.73e; the earlier $\mathfrak F_U+\mathfrak I_U^{(4)}$ representation is equivalent only when supplemented by the canonical $H_4$, $\mathcal T_4$, and remaining U.73e entries, Appendix T matching-scale observables remain validation-level before an accepted flag-lift spectral certificate, and flavor/baryogenesis/nuclear rows inherit their own certificate gates. A measured value outside an accepted theorem-level interval refutes the corresponding theorem stack; outside a branch/model interval it refutes the named branch, bridge law, certificate record, or model layer rather than silently upgrading the row.

*Structural predictions* assert that specific mathematical structures emerge necessarily or conditionally from the framework's axioms and stated finite-response principles. These include the uniform operational causal-speed upper bound of Theorem 46 and, only on the complete Corollary 46a/Appendix O promotion branch, Lorentzian signature and local Lorentz invariance; the Standard Model gauge algebra $\mathfrak g_{\mathrm{SM}}=\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)$ on the Appendix G finite-response block-frame positive-marginal capacity branch (Theorem G.8.4b and Corollary G.8.4c, conditional on Proposition G.M1); the Born rule (Proposition 7); and $N_g=3$ on the intersection of Appendix R's connected regular anomaly-descent, uniform-family-charge, CP-capability, global/torsion-cancellation, and additive-monotone family-selection branches; and chronology protection from SPAP (Theorem 14.1). Falsification is branch-resolved: for example, observed fundamental Lorentz violation refutes the local-Lorentz conclusion only after the attained-frontier and full Appendix O inputs have been independently accepted, while an additional low-energy response-changing gauge generator, a family-count outcome outside the declared Appendix R selection class, or an intervention-stable retrocausal contradiction protocol refutes the respective accepted branch.

*Diagnostic reclassifications* are branch-dependent interpretations of formal features of existing theories. The curvature-singularity and UV entries retain the hypotheses of Section 14.2.4, Appendix K.5, and Theorem K.10.4. Appendix O supplies an arrow-of-time reinterpretation only on the conjunction of its synchronization branch and its probability-arrow branch: the former requires a declared positive desynchronization penalty, connected finite dynamics, and the Appendix D selection hypotheses, while the latter requires forward and reverse path measures on a common event algebra and an independent positive pathwise entropy-production certificate. These rows are not predictions of new observations. Evidence contradicting an accepted branch refutes that branch-level reinterpretation; SPAP ordering or registered-reset heat alone does not establish it.

### 13.10.1 Euclidean Response-Carrier Dimension and Spacetime-Promotion Gate

**Conditional structural result:** On Definition Z.9a's faithful least-feasible tangent-shell branch with $M_{\mathrm{int}}=24$ and a verified response-preserving regular-$24$-cell injection, the Euclidean response-carrier dimension is $D_{\rm car}=4$. Identifying this carrier with observed $3+1$ spacetime requires the separate operational-continuum, principal-symbol, time-orientation, and metric-reconstruction certificates.

**Derivation Summary:** Within the selected branch, three dimensions cannot accommodate all retained modes, while four dimensions can. Identifying that four-dimensional carrier with observed spacetime is a separate task.

**Technical ledger.**

Definition Z.9a requires a response-preserving injection of all $M_{\mathrm{int}}=24$ modes into distinct tangent cells and assigns positive cost to response-null surplus dimensions. Theorem Z.10 gives the necessary capacity inequality $24\le K(D)$. The exact values $K(1)=2$, $K(2)=6$, and $K(3)=12$ exclude $D\le3$, while the regular $24$-cell supplies a feasible $24$-point contact configuration in $D=4$. With the strict least-feasible support cost,
$$
D_{\min}
=
\min\{D\in\mathbb N:K(D)\ge24\}
=
4.
$$
Thus $D_{\rm car}=4$ is a theorem from Definition Z.9a's registered branch premises. It is not yet an observable prediction of $D_{\rm st}$; that empirical statement begins only after the promotion certificate.

The theorem requires capacity and a registered response-preserving injection; it does not require the false equality $M_{\mathrm{int}}=K(D)$ in every admissible dimension.

**Falsification Conditions:**

- An operational determination $M_{\mathrm{int}}\ne24$ within the registered minimal Appendix Z branch.
- Failure of every registered response-preserving injection of the $24$ retained modes into the regular-$24$-cell tangent shell.
- A faithful equally predictive realization in $D\le3$ within Definition Z.9a's comparison class.
- A measured spacetime dimension different from $3+1$ falsifies the completed joint branch only after an accepted promotion certificate identifies the Euclidean carrier dimension with physical spacetime; it does not by itself refute Theorem Z.11.

**Robustness:** On the registered faithful-shell branch, $D=4$ is the least feasible carrier dimension for every integer mode count $13\le M_{\mathrm{int}}\le24$, provided the mode-to-cell injection uses a registered response-preserving subset of the regular $24$-cell. For $25\le M_{\mathrm{int}}\le40$, $K(4)=24$ excludes four dimensions and a known explicit $40$-contact configuration in $\mathbb R^5$ supplies geometric feasibility in five, so the least feasible dimension is five once a response-preserving labeling is registered. This uses the explicit lower-bound construction and does not assert an exact value of $K(5)$.

**Current Status:** Observations of $3+1$ spacetime are compatible with the carrier value $D_{\rm car}=4$ only on the separately certified promotion branch. Inverse-square-law and extra-dimension searches constrain physical spacetime models; they do not validate the faithful-shell injection or least-cost premise of Theorem Z.11.

### 13.10.2 Fine-Structure Constant


**Prediction:** At the Thomson limit (zero momentum transfer), the canonical Appendix Z branch gives the exact sinc core
$$
\alpha^{-1}_{0}=137.03609205522863\ldots
$$
and the certificate row
$$
\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha.
$$
On the candidate hypercharge-recoil (operator realization open) finite Ward branch, the diagnostic-only residual is
$$
R_{\alpha}^{YR\perp}
=
-\frac{5}{3}c_1(u^*)^3
+
\frac{10}{9}c_1(u^*)^5
-\frac{1}{3}c_1(u^*)^7
=-0.00009287769839723537\ldots,
$$
with $u^*=2^{1/8}-1$ and $c_1=\pi/(24\sqrt3)$. Thus the diagnostic-only candidate evaluation is
$$
\alpha^{-1}_{\mathrm{cand}}
=
\alpha^{-1}_{0}+R_{\alpha}^{YR\perp}
=137.03599917753023\ldots.
$$

**Derivation Summary:** The model first produces a fixed baseline value for the fine-structure constant. A proposed correction brings it close to the measured value. Its current role is a diagnostic comparison, and the paper treats its physical origin as an open task.

**Technical ledger.**

Theorem Z.26 combines the bulk Ward term, interface derivative, democratic-curvature response, separable-curvature response, and exact $SU(2)$ sinc transport:
$$
\alpha^{-1}_{0}
=
\frac{4\pi}{u^*}
-
\frac{\pi}{\sqrt{K_0}}
+
\frac{\pi u^*}{24\sqrt{K_0}}\operatorname{sinc}(u^*).
$$
Definition Z.27.11k.12 then realizes the finite post-core residual complex. Its retained cohomology basis is
$$
[\omega_Y],\qquad [\omega_5],\qquad [\sigma_{\perp}],
$$
with contributions
$$
[\omega_Y]:-\frac{5}{3}c_1(u^*)^3,
\qquad
[\omega_5]:\frac{10}{9}c_1(u^*)^5,
\qquad
[\sigma_{\perp}]:-\frac{1}{3}c_1(u^*)^7.
$$
The determinant-compatible hypercharge trace supplies $5/3$, the active-recoil lift supplies $10/9$, and the passive-complement contraction supplies $1/3$ with sign $\eta_7=-1$. Within the stipulated finite complex, the classes $[\sigma_{\parallel}]$, $[\nu_0]$, and $[\nu_1]$ evaluate to zero and $\theta$ is obstructed; that stipulated source menu does not prove physical source exhaustion. Theorem Z.27.11k.20 evaluates the candidate only if the operator-realization certificate is accepted, and Corollary Z.27.11k.21.1 expressly leaves strict-certificate status open and the value diagnostic. No populated accepted registry entry is supplied for this branch. If the seventh-order passive complement is downgraded to the positive-contraction record rather than fixed, Corollary Z.27.11k.21 gives
$$
\alpha^{-1}_{0}+R_{\alpha}^{YR}
\in
[137.03599917502362\ldots,137.03599917878353\ldots].
$$

**Falsification Conditions:**
- A fresh precision measurement, after the accepted branch record is entered into the forward prediction register of Definition 13.0d, lying outside the certified branch value or certified downgrade interval
- Energy dependence of $\alpha$ inconsistent with standard QED running from the accepted Thomson-limit value
- Spatial or temporal variation of $\alpha$ at levels exceeding the separately registered comparison model
- Post-comparison modification of $R_\alpha$, the Ward source alphabet, the contraction data, the evaluation row, or the overlap audit, which defines a new branch rather than confirming this one

**Residual interpretation.** The interval $\pm0.000060$ on the canonical branch is a displayed comparison-budget diagnostic. It is not an adjustable tolerance and cannot be widened after comparison without defining a new branch by Corollary Z.27.11i. The residual entry on the accepted branch is the exact cohomology evaluation in (Z.27.11k.20a). The source-removal clauses of Definition Z.27.11k.12 prove no double counting with the bulk Ward, interface, electromagnetic-projection, curvature, sinc-transport, or future residual ledgers: those entries are either already in $\alpha^{-1}_{0}$, exact in $C^\bullet_W$, obstructed, or require a separate direct-sum residual record. The SPAP-reflexive sinc-tail audit of Definition Z.27.11L is an internal consistency check on the Taylor truncation of the already included sinc factor; it is not a second closure of $R_\alpha$.

**Current Status:**
$$
\alpha^{-1}_{\mathrm{exp}} = 137.035999177(21) \quad \text{(Mohr et al. 2025; NIST 2024)}.
$$
The accepted branch value satisfies
$$
\alpha^{-1}_{YR\perp}-137.035999177
=5.3022969595\times10^{-10}.
$$
This comparison is certificate-retrodictive for already published values unless the same registry entry is made before a fresh measurement. The residual-free same-branch theorem is separately obstructed by Corollary Z.27.11e.1, because the exact sinc-core value alone differs from the recorded comparison value by $0.00009287822863\ldots$, about $0.678$ ppm. A measured value outside the certified residual interval for the accepted branch refutes the Appendix Z normalization branch by Corollary Z.26c.

**Consistency Check:** Standard QED running from the accepted Thomson-limit branch value yields $\alpha^{-1}(M_Z)$ in the electroweak comparison ledger; the branch must use the same locked normalization, residual value, and overlap audit when entered into Definition 13.0d.

---

### 13.10.3 Generation Number

**Prediction:** On the connected regular source branch with $Z_x[J]\ne0$, uniform nonzero family charges, nontrivial CP capability, and cancellation of every admitted global/torsion anomaly, the smallest locally anomaly-free family pattern has $N_{\min}=3$. Exact selection of $N_g=3$ additionally requires the additive-monotone family objective of Proposition R.3.5.1a.

**Derivation Summary:** Within the stated family of candidates, the smallest pattern that supports the required charge balance and mixing has three generations. Choosing exactly that smallest pattern also depends on a separate cost rule.

**Technical ledger.**

Effective Theorem R.3.4 reduces the local family-anomaly ledger to $\sum_gF_g=\sum_gF_g^3=0$ under its regular descent hypotheses and gives $\{a,-a,0\}$, $a\ne0$, as the smallest CP-capable pattern in that class. Effective Proposition R.3.5.1a assumes $L_{\mathrm{fam}}(N)=L_0+NL_{\mathrm{block}}+L_{\mathrm{mix}}(N)$ with $L_{\mathrm{block}}>0$ and nondecreasing $L_{\mathrm{mix}}$, and therefore selects the smallest admissible count $N=3$. Corollary P.6.1b.8 separately quotients response-null labels. The $D_4$ triality orbit, $M=24=8\times3$, and Leech/$E_8$ constructions are compatibility records rather than family-count proofs.

**Falsification Conditions:**
- Discovery of fourth-generation quarks or leptons at colliders
- Discovery of extra light active neutrino species
- Cosmological evidence for fourth light neutrino species ($N_\nu > 3.2$ at 95% CL)
- Z-pole width measurement inconsistent with three light neutrino families

**Experimental handle:** The clean collider observable is the effective number of light active neutrino species coupled to the $Z$. The historical combined LEP result is
$$
N_\nu^{(\mathrm{LEP\ 2006})}=2.9840\pm0.0082
\quad\text{(ALEPH \textit{et al.} 2006)}.
$$
Using the improved small-angle Bhabha luminosity calculation, the collider extraction is
$$
N_\nu^{(\mathrm{collider})}=2.9963\pm0.0074
\quad\text{(Janot \& Jadach 2020; PDG 2026 recommended value)}.
$$

These are indirect consistency checks for the three-generation claim under the identification "one light active neutrino per generation," provided every counted species has $m_\nu<M_Z/2$ and Standard-Model-strength coupling to the $Z$, and no additional species satisfying those conditions exists.

Indirectly consistent with $N_g=3$ under the stated identification of $N_\nu$ with light active neutrino flavors. In the ATLAS $13\ \mathrm{TeV}$ pair-production benchmark with $140\ \mathrm{fb}^{-1}$ and $\mathcal B(Q\to Wq)=1$, vectorlike-quark masses below $1530\ \mathrm{GeV}$ are excluded at $95\%$ confidence (ATLAS Collaboration 2024); that mass limit does not apply unchanged to other decay-branching assignments.


---

### 13.10.4 Gauge Group Structure

**Prediction:** On the finite-response block-frame positive-marginal capacity branch of Appendix G.8.4, the Standard Model gauge algebra
$$
\mathfrak g_{\mathrm{SM}}
=
\mathfrak{su}(3)_C\oplus\mathfrak{su}(2)_L\oplus\mathfrak u(1)_Y
$$
is uniquely selected inside the determinant-compatible block-frame/interface family. At the connected-cover notation level this is written as $SU(3)_C\times SU(2)_L\times U(1)_Y$; the determinant-compatible global form is fixed by the interface data rather than by an arbitrary $U(6)$-subgroup classification.

**Derivation Summary:** Within the model's restricted search space, dividing six available sectors into groups of three, two, and one is the only arrangement that uses the full allowed symmetry capacity. That arrangement has the symmetry structure used by the Standard Model.

**Technical ledger.**

The PU gauge-search space is the determinant-compatible block-frame/interface family acting faithfully on a direct-sum inactive-sector certificate $\mathcal B\cong\mathbb C^6$ induced by the $b=6$ Landauer partition, with response-null exact global phases quotiented and determinant-compatible anomaly-admissibility imposed. Within this finite block-frame search space, the sharp generator bound is $n_G\le12$ (Theorem G.8.2e). In the positive-marginal regime of Equation (G.8.5), every admissible non-null block-frame generator below the bound lowers finite-protocol regret, so the PCE optimum saturates $n_G=12$ whenever attainable. The exhaustive block-partition analysis has a unique saturating row, $(3,2,1)$, and hence the gauge algebra is
$$
\mathfrak g=\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)_Y,
\qquad
n_G=12=8+3+1.
$$

**Derivation Status:** The uniqueness statement is rigorous on the finite-response block-frame/interface branch, conditional on (i) Proposition G.M1, (ii) the positive-marginal saturation regime of Equation (G.8.5), and (iii) determinant-compatible anomaly-admissibility with no response-null exact global gauge factors. Under these conditions, no other compact connected faithful block-frame algebra on $\mathcal B$ with $n_G\le12$ both saturates the PCE optimum and preserves the same finite-response quotient data. This is not a classification of all compact connected subgroups of $U(6)$; irreducible tensor-product embeddings with the same abstract Lie algebra are outside the block-frame admissible family. Discovery of an additional long-range gauge factor would falsify at least one branch condition rather than merely adjust a fitted parameter.

**Falsification Conditions:**
- Discovery of additional gauge bosons ($Z'$, $W'$) at accessible energies indicating enlarged gauge group
- Detection of new long-range forces indicating additional $U(1)$ factors

**Current Status:** No evidence for physics beyond the Standard Model gauge structure. LHC searches for $Z'$ and $W'$ negative to multi-TeV scales (ATLAS Collaboration 2019; CMS Collaboration 2022).


---

### 13.10.5 Conditional Mass-Hierarchy Diagnostic

For a preregistered triad and one common leading coefficient, the distance ratio is an exact algebraic diagnostic. The physical triad, fourth-order coefficient, effective dimensions, mapping scheme, and remainder are not fixed by that identity.

A valid test must lock those entries and a nonzero uncertainty interval before comparison, then evaluate held-out mass data. No generic five-percent theory error or discrete-set prediction is asserted without that certificate.



**Prediction:** The mass hierarchy invariant takes discrete values:
$$
\mathcal{R} := \frac{\ln(m_3/m_1)}{\ln(m_3/m_2)} \in \left\{\frac{4}{3}, \frac{3}{2}, 2, 3, 4\right\}
$$

**Derivation Summary:** The proposed mass pattern treats some ratios as distances in a fixed geometry. The ordered charged-lepton case supplies the derived link, while the quark and neutrino cases remain separate conditional models.

**Technical ledger.**

Equation R.17 records the geometric candidate $\mathcal{R}=d^2_{31}/d^2_{32}$ when a sector-specific hierarchy bridge identifies the relevant mass-log differences with $E_8$ squared distances in $\{2,4,6,8\}$ (Section R.5). Effective Theorem N.9 supplies that bridge only for the ordered charged-lepton path $\tau\to\mu\to e$, on $\mathfrak B_{mass}$ and the Appendix T charged-lepton calibration branch. It supplies no direct quark-sector pairwise law; quark ratios retain the separate Appendix T root assignment, threshold, running, matching, and remainder hypotheses. For the Majorana neutrino sector the triad $(a,b,b)=(2,6,6)$ is not path-additive, and Lemma T.24.10a rules out a three-edge pairwise reading. The anchored candidate $\mathcal{R}_\nu=\Delta_1/\Delta_2=b/a=3$ is the conditional result of Theorem T.24.11, while the $1\leftrightarrow2$ $A_2$ edge is only a PMNS mixing-geometry input. Thus the displayed discrete set is a sector-dependent geometric candidate; Theorem N.9 establishes it only for the ordered charged-lepton ratios.

**Falsification Conditions:**
- Precision mass measurements yielding $\mathcal{R}$ values unambiguously between discrete predictions
- Failure of the invariant to match discrete values in multiple fermion sectors simultaneously

**Current Status (Charged Leptons):**

Using the displayed Particle Data Group 2024 central ratios,
$$
\mathcal R_\ell^{\mathrm{exp}}
=
\frac{\ln(m_\tau/m_e)}{\ln(m_\tau/m_\mu)}
=
\frac{\ln(3477.2)}{\ln(16.82)}
=
2.88885\ldots.
$$
The closest listed discrete value is $\mathcal R=3$, corresponding to $(d^2_{31},d^2_{32})=(6,2)$, and the relative central-value discrepancy is
$$
\frac{3-\mathcal R_\ell^{\mathrm{exp}}}{3}
=0.03705\ldots.
$$
No theory-consistency interval follows from these central values alone. A comparison claiming compatibility must first specify the mass renormalization scheme and scale, threshold map, covariance of the three mass inputs, higher-order remainder bound, and a nonzero prediction interval before examining the held-out masses.

---

### 13.10.6 Summary Table

The table below separates exact branch results from conditional bridges, diagnostic comparisons, and open experimental tests. A row counts as a forward test only when its protocol, inputs, uncertainty, and failure rule were fixed before comparison.

**Technical ledger.**

**Experimental row for metered events.** If a protocol claims a $\ln 2$ actualization timing threshold, the protocol must identify the binary interface register, the no-early-firing margin, the overwrite bound, and the process-tensor no-future-to-past causality audit. Otherwise the observation tests the broader $\mathfrak C_{\mathrm{act}}$ branch and not the sharper metered branch.

**Experimental row for retained entropic clock-flow.** If a protocol claims the Appendix O entropic-clock branch, it must identify the retained sector $R$, the finite event alphabet $\mathcal E_R$, the retained entropy-increment estimator $\sigma_R^{\mathrm{ECF}}$, the cumulative entropy ledger $\Sigma_R^{\mathrm{ECF}}$, the locked guarantee-level subset $\mathcal G_R$ when a SPAP-unit count is claimed, the complement or reservoir controls, the null-exchange windows, the external laboratory clock used only for data parameterization, and the Blackwell-PCE record-current estimator when the TUR subtest is invoked. The primary endpoint is fixed before comparison:
$$
\Delta\mathcal T_R
=
\frac{\Delta\Sigma_R^{\mathrm{ECF}}}{\ln2}.
\tag{13.10.6a}
$$
The mandatory null endpoint is
$$
\Delta\Sigma_R^{\mathrm{ECF}}=0
\Rightarrow
\Delta\mathcal T_R=0
\tag{13.10.6b}
$$
for the retained entropic-clock coordinate, unless an independently registered non-entropic clock record is present in the retained presheaf. When the clock is read as a stationary current with nonzero registered current mean, the registered quotient must also satisfy
$$
\frac{\operatorname{Var}(\widehat{\Delta\mathcal T_R})}
{\langle\widehat{\Delta\mathcal T_R}\rangle^2}
\Sigma_T
\ge2.
\tag{13.10.6c}
$$
A positive result must show the clock-flow slope, the stall/null condition, and the current-precision inequality under the same fixed $\ln2$ unit bridge. Cold-atom bright/dark-sector entropic-time experiments such as Barontini [2026] are recorded as external analogue tests of internal entropy-clock ordering, not as forward PU evidence for the $\ln2$ unit bridge unless the PU unit, retained entropy-increment estimator, null windows, guarantee-level subset when used, and witness locks were registered before comparison. A result is classified as failure if the apparent clock advances during null-exchange windows, if the effect follows laboratory timing rather than retained entropy flow after label swaps, if the retained entropy-increment estimator or guarantee-level subset is chosen after unblinding, or if the clock-current TUR is violated after the finite record quotient and entropy ledger have been fixed.

**Experimental row for Landauer-ledger constellations.** A cross-protocol claim that PU is supported by repeated appearances of $\ln2$ must satisfy Corollary 13.0k: the same structural $\varepsilon_0=\ln2$ must be inherited from Proposition 5 and Theorem J.1 and consumed through independent finite-response maps; any physical reset row must separately satisfy Definition 28 and Theorem 31. Separate fitted $\ln2$-like constants in different platforms do not count as a constellation.

**Table 13.1: Falsifiable Predictions and Current Status**

| Prediction | Framework Value | Experimental Value | Derivation | Status |
|:-----------|:----------------|:-------------------|:-----------|:------:|
| Euclidean response-carrier dimension $D$ and its spacetime promotion | $D=4$ on the faithful tangent-shell branch; $3+1$ interpretation requires the separate continuum/Lorentzian promotion certificates | $3+1$ observed spacetime | Definition Z.9a; Theorems Z.10-Z.11; Corollary P.8.3 | ◐ carrier theorem exact on branch; spacetime promotion certificate-gated |
| Fine-structure constant $\alpha^{-1}$ | $\alpha^{-1}_{0}=137.03609205522863\ldots$ and diagnostic-only branch $\alpha^{-1}_{\mathrm{cand}}=\alpha^{-1}_{0}+R_{\alpha}^{YR\perp}=137.03599917753023\ldots$; passive-complement downgrade interval $[137.03599917502362\ldots,137.03599917878353\ldots]$ | $137.035999177(21)$ | Theorem Z.26; Definition Z.27.11a; Theorem Z.27.11j.1; Definition Z.27.11k.16a; Theorem Z.27.11k.16b; Corollary Z.27.11k.16c; Definition Z.27.11k.12; Theorem Z.27.11k.20; Corollary Z.27.11k.21; Corollary Z.27.11k.21.1 | ◐ open operator-realization gate; current published comparison certificate-retrodictive |
| Light active neutrino count $N_{\nu}$ | 3 on the pre-flavor family-redundancy branch of Proposition R.3.5.1a, provided each realized light family contributes exactly one active neutrino species with $m_\nu<M_Z/2$ and no additional such species | $2.9963\pm0.0074$ (Janot--Jadach collider extraction; PDG 2026 recommended value) | Proposition R.3.5.1a + stated active-neutrino identification + collider $Z$-width extraction | indirect, branch-conditional |
| Gauge algebra / connected-cover notation on the finite-response block-frame positive-marginal capacity branch | $\mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak u(1)$; connected cover $SU(3) \times SU(2) \times U(1)$ | Standard Model gauge algebra; global form fixed by determinant interface | Theorem G.8.4b; Corollary G.8.4c | ◐ finite-response block-frame branch theorem |

| Lepton hierarchy diagnostic $\mathcal{R}_\ell$ | 3 on the preregistered $(d_{31}^2,d_{32}^2)=(6,2)$ leading-response branch with one common coefficient and controlled remainders | 2.889 (3.7% retrospective residual) | Equation R.17; effective Appendix-T flavor ledger | ◐ conditional model diagnostic; physical labels, scale scheme, and remainder interval required |
| Chronometric curvature phase/dephasing | $\hbar\lvert\dot\Theta\rvert/\lvert\Delta E\rvert=\lvert\Delta\Phi\rvert/c^2$; on saturated ND-RID branch $\hbar\Gamma_{\mathrm{res}}/\lvert\Delta E\rvert=\lvert\Delta\Phi\rvert/c^2$ | dedicated clock-interferometer test required | Theorem 47c; Theorem S.7.3a | ◐ branch prediction; ○ untested |
| Retained entropic clock-flow | On accepted $\mathfrak C_{\mathrm{ECF}}^{(R,q)}$, $\Delta\mathcal T_R=\Delta\Sigma_R^{\mathrm{ECF}}/\ln2$; zero retained entropy/update flow gives $\Delta\mathcal T_R=0$; record-current estimates with nonzero registered mean obey $\operatorname{Var}(\widehat{\Delta\mathcal T_R})\Sigma_T/\langle\widehat{\Delta\mathcal T_R}\rangle^2\ge2$ | Barontini-type cold-atom bright/dark-sector analogue clocks, reservoir-swap quantum simulators, photonic/ion-trap retained-record clocks, and stochastic record-current tests with null-exchange windows | Definition O.3f; Theorem O.3f; Corollary O.3g; Barontini [2026] as analogue only | ◐ certificate-gated finite-record theorem; ○ protocol-specific tests pending |
| Actualization threshold under engineered leakage | On branches with accepted $\mathfrak C_{\mathrm{act}}$, commit onset occurs when the retained link ledger reaches the certified $C_{\max}$; on the residual-budget minimal branch $C_{\max}^*=2\ln2$ nats per link-cycle and $\Gamma_{\mathrm{Evolve}}=\dot I/C_{\max}$ | controlled-leakage interferometry with a locked ledger-to-laboratory bridge required | Definition E.2a.4; Proposition E.2a.5; Definition E.2a.6; Corollary M.6.14b.1 | ◐ certificate-gated branch prediction; ○ untested |
| Landauer-ledger constellation | The same structural $\varepsilon_0=\ln2$ must appear through independent locked maps: metered actualization, retained entropic clock-flow, conditional horizon tolerance grid $\operatorname{dist}_{2\pi}(x,N\ln2)\le\varepsilon_{\mathrm{peak}}$ around exact central labels, and finite record-current TUR; no platform-specific refitting of the unit is allowed, and physical reset rows retain the separate Definition 28/Theorem 31 gate | multi-platform finite-register, horizon-analogue, and stochastic-current protocols entered as Definition 13.0i witnesses | Proposition 5; Theorem J.1; Theorem 31 for registered reset rows; Definition 13.0i; Corollary 13.0k; Definition O.3f; Proposition Q.0.19; Theorem D.8.7f; Corollary D.8.7g | ◐ multi-lock evidence standard; ○ protocol constellation pending |
| Cone-saturation residual floor | With accepted $\mathfrak C_{\mathrm{cone}}$, retained sector front-speed splitting in vacuum is represented by a pre-locked misalignment functional satisfying $\xi_{\mathrm{cone}}\le\xi_{\mathrm{res}}$; no universal no-birefringence theorem is asserted without that certificate | multi-messenger timing, polarization, and in-vacuo dispersion tests constrain the future certificate | Definition O.7.2.5; Corollary 46a; Theorem F.0 Condition 4 | ◐ certificate-gated structural test; ○ existing bounds constrain certificate choices |
| Predictive GSL / null-slack tomography | With accepted $\mathfrak C_{\mathrm{PGSL}}$, retained generalized entropy satisfies $\Delta S_{\mathrm{out}}+\Delta\mathcal A/(4G)\ge0$ on covered horizon cuts; with accepted $\mathfrak C_{\mathrm{NC}}$, the QNEC/null-slack ledger is nonnegative and zero slack selects the reversible Einstein branch | local horizon analogues, modular-flow tomography, and Clausius-defect null-tomography protocols constrain the finite cut records | Definition 12.5.3l; Theorem 12.5.3m; Definition 12.5.3n; Proposition 12.5.3o; Theorem 12.1g | ◐ certificate-gated branch prediction; ○ protocol-specific tests pending |
| Self/world predictive complementarity | With accepted $\mathfrak C_{\mathrm{SW}}$, external task capacity obeys $C_{\mathrm{world}}\le B_C-C_{\mathrm{sh}}-c_{\mathrm{SPAP}}\log(1/\delta_{\mathrm{self}})/\delta_{\mathrm{self}}^2$ for certified SPAP-near self-model tasks | AI metacognition/world-task scaling, cognitive-load, and neuroscience bandwidth protocols with a locked task split | Definition 14.1d; Proposition 14.1e; Remark 14.1f | ◐ certificate-gated allocation test; ○ protocol-specific tests pending |
| Predictive free-energy envelope | On accepted $\mathfrak C_{\mathrm{Pred2}}$ branches, $d\mathbb E[-V]/dt\ge0$ on the Lyapunov window and the running viable envelope $\widehat F_{\max}(t)$ is nondecreasing | learning-curve, evolutionary-lineage, or structure-growth tests with inheritance/archive ledger fixed before comparison | Definition D.6.5c; Proposition D.6.5d; Theorem D.6.5a | ◐ certificate-gated envelope law; ○ domain ledgers pending |
| Marginal predictability / criticality | Criticality claims require $\mathfrak C_{\mathrm{crit}}$ and report $d_{\mathrm{crit}}\le\epsilon_{\mathrm{crit}}$; exponents inherit the universality-class entry and are not fixed by PCE alone | finite-size scaling, avalanche, $1/f$, or cosmological-spectrum tests with a pre-registered critical manifold | Definition P.8.9a.12.0c; Proposition P.8.9a.12.0d | ◐ certificate-gated criticality claim; ○ not a core theorem |
| Reflexive-charge loop ledger | Closed retained predictive loops satisfy $N\ln2+\Delta=2\pi k$ with $k\in\mathbb Z$; nonzero exact sectors require positive structural phase-defect overhead in the Q.0.7f--g ledger | closed-loop interference and finite phase-grid audits; a thermodynamic reading additionally requires the eventwise reset calibration (Q.0.7e.0) | Definition Q.0.7e with Equation (Q.0.7e.0); Definition Q.0.7g.1; Proposition Q.0.7g.2; Proposition Q.0.7f; Corollary Q.0.7g | ✓ fixed-loop structural theorem; ◐ physical bridge pending |
| Predictive-equivalence ledger | With accepted $\mathfrak C_{\mathrm{PEq}}$, definiteness, temporal access, action phase, finite speed, and curvature readings are projections of the same retained update-cost record through their existing unit bridges | Wigner-friend-style perspective tests, certificate-relative model-access asymmetry protocols under Theorem M.10.5's hypotheses, and unit-bridge consistency audits | Definition M.6.6a; Proposition M.6.6b; Corollary O.4.3; Theorem Q.0.1 | ◐ certificate-gated compression test; ○ protocol-specific tests pending |
| Report-induced expectation CC | On the expectation-mediated branch, seen false reports can produce a report-content-aligned later outcome shift $\delta_{\mathrm{false}}\ne0$ while unseen and delayed-report controls remain null; CTB subbranch requires target-vector alignment and vanishing orthogonal residual | dedicated blinded true/false/unseen/delayed QRNG or finite-POVM expectation protocol required | Theorem 51; Definition 34; Corollary 37a; Protocol 1a | ◐ branch prediction; ○ untested |
| Golay noise spectroscopy | $\mathcal R_8=1+968\eta_8$ with $\eta_8>0$ on the aligned residual branch; incidence $253:77:21:5:1$; controlled weight-4 fibers form $1771$ six-tetrad sextets | dedicated 24-mode residual-noise and decoder-boundary tests required | Theorem Z.13b.3; Corollary Z.13b.5; Protocol 4.4 | ◐ branch prediction; ○ untested |
| Golay-QEC bootstrap | On accepted $\mathfrak C_{\mathrm{GQEC}}$ branches, the punctured Golay witness supplies a $[[23,1,7]]$ CSS code inside a finite physical syndrome/recovery/threshold ledger; direct Golay statistics alone do not certify protected computation | 23/24-mode syndrome extraction, logical-error scaling, leakage/correlation audits, and non-transversal resource-injection tests | Definition A.0.1q.1; Theorem A.0.2a; Corollary A.0.2b; Proposition Z.13b.7 | ◐ certificate-gated foundation test; ○ architecture-pending |
| Golay-Steiner octad stiffness | normalized Hessian spectrum $0^{(1)}\oplus352^{(23)}$ on the exact octad stiffness branch | classical-emulator audit available now; physical 24-mode quadratic-response spectroscopy with $759$-term octad coupling is architecture-pending | Corollary Z.13b.1a; Definition T.10a; Lemma T.2; Protocol 4.5 | ◐ branch prediction (emulator gate); ○ untested (physical gate) |
| Cosmological acceleration lock | $g_0=c^2\sqrt{\Lambda}/8$; $\Sigma_\dagger=c^2\sqrt{\Lambda}/(16\pi G)$ | $g_0\sim1.2\times10^{-10}\,\mathrm{m/s^2}$; surface-density tests pending | Cor H.1, Cor H.1a, Cor I.3a | ◐ bridge-law branch; ○ redshift/lensing tests pending |
| Primordial complexity product | $A_s r=A_Qe^{-22}/(4\pi^2)$; leading $A_Q=1$ gives $7.07\times10^{-12}$ | tensor measurement pending | Corollary U.65a; Section 13.10.6 | ◐ branch prediction; ○ untested |
| Conditional $A_2$ internal absolute-scale projection | $\Sigma_\nu=30.519194260\,\mathrm{meV}$, $m_\beta=4.62339623\,\mathrm{meV}$; cited oscillation splittings are not matched | conditional cosmology and beta-endpoint comparison | Corollary T.24.16a | ◐ internal branch; ✗ oscillation closure |
| Oscillation-anchored $A_2$ calibration | $\Sigma_\nu=58.565457244\,\mathrm{meV}$, $m_\beta=8.87216457\,\mathrm{meV}$ | empirical calibration comparison, not an internal-branch prediction | Corollary T.24.16a | ◐ calibration row; ○ prospective comparison |
| Proper-acceleration entropy drag | $\mathcal Q_a=q_{\mathrm{act}}$ | dedicated acceleration calorimetry required | Cor N.12b | ◐ proper-acceleration branch; ○ untested |
| Predictive record-current TUR | $\operatorname{Var}(J_T)\Sigma_T/\langle J_T\rangle^2\ge2$ on every Blackwell-PCE classical record quotient with $\langle J_T\rangle\ne0$ | stochastic record-current and entropy-production tests | Thm D.8.7f; Cor D.8.7g | ✓ finite record theorem; ○ protocol-specific tests |
| Scalar-channel hyperon spin filter | short-range $\Lambda\bar\Lambda$ nonzero; long-range, same-sign, spin-zero controls vanish | collider correlation tests | Cor Z.8k.1a | ◐ scalar-channel branch |
| Postselected momentum-sign witness | $\langle p\rangle_{\mathrm{ps}}\in[\delta_B,\delta_A]$ for $\mathfrak G_{\mathrm{cl}}$; the calibrated coherent Gaussian realization has $\langle p\rangle_{\mathrm{ps}}<0$ iff $V>V_{\mathrm{crit}}$ | dedicated protocol pending | Theorems 13.8.5b and 13.8.5d | ◐ conditional sign witness; ○ untested |


The displayed rows are status-resolved rather than uniformly consistent: in particular, the conditional $A_2$ internal absolute-scale projection fails its oscillation-closure comparison as marked, rejecting that physical identification without rejecting the upstream $A_2$ geometry. A theorem-level row falling outside its stated uncertainty bound would falsify the corresponding theorem stack; a branch-level or model-level row falling outside its stated uncertainty bound would falsify the named branch, bridge law, threshold input, or model layer carried by that row. The Thomson $\alpha^{-1}$ row is not residual-free: Corollary Z.27.11e.1 obstructs a same-branch $R_\alpha=0$ theorem at the recorded CODATA comparison value. It is open pending the independent diagnostic-only hypercharge-recoil (operator realization open) branch by Corollary Z.27.11k.21.1; off that branch, or after downgrading the passive complement, the corresponding residual-gated or interval status is retained. For the predictive record-current TUR row, the relevant test available only after certification is a closed finite record quotient with measured stationary current satisfying $\langle J_T\rangle\ne0$, variance, and entropy production satisfying
$$
\frac{\operatorname{Var}(J_T)}{\langle J_T\rangle^2}\Sigma_T<2
$$
after the Blackwell-PCE record channel and entropy-production ledger have been fixed.

---

### 13.10.7 Theoretical Error Budget

| Prediction | Dominant Uncertainty Source | Estimated Magnitude |
|:-----------|:---------------------------|:--------------------|
| $\alpha^{-1}$ | exact sinc-core arithmetic plus diagnostic-only finite Ward hypercharge-recoil (operator realization open) residual; no residual contribution is shared with the bulk, interface, electromagnetic-projection, curvature, sinc-transport, or future residual ledgers | candidate branch: degenerate residual interval $R_{\alpha}^{YR\perp}=-0.00009287769839723537\ldots$ and $\alpha^{-1}_{\mathrm{cand}}=137.03599917753023\ldots$; passive-complement downgrade interval width $3.759913047\times10^{-9}$; $\pm0.000060$ remains only a diagnostic budget |
| $\mathcal{R}$ | QED radiative corrections ($\sim 1\%$), threshold effects ($\sim 1\%$), higher-order ($\times 2$) | $\sim 5\%$ |
| $N_g$ | Minimal admissible count $3$ on the connected regular uniform-charge anomaly/CP branch with global/torsion cancellation; exact selected count $3$ only under the additive-monotone objective of Proposition R.3.5.1a; $D_4$ triality and $E_8$/Leech are compatibility checks | branch-discrete |
| $D$ | Exact in the Appendix Z Bures tangent-cell mode-channel contract | branch-discrete |

The prediction for $D$ is exact within its Bures tangent-cell contract. The selected value $N_g=3$ is exact only on the stated Appendix-R anomaly and additive-selection intersection. A deviation tests the corresponding declared branch package; detailed flavor values remain downstream model data.

**Proper-Acceleration Entropy Drag Test.**
On the proper-acceleration UCT branch, after ordinary loss channels are subtracted, the residual excess power should obey
$$
P_{\mathrm{excess}}
=
q_{\mathrm{act}}\frac{c}{2\pi}m_S|a|.
$$
The dimensionless collapse variable is
$$
\mathcal Q_a
=
\frac{2\pi P_{\mathrm{excess}}}{c\,m_S|a|}.
$$
The branch predicts $\mathcal Q_a=q_{\mathrm{act}}$ and no proper-acceleration UCT contribution for ideal geodesic free fall. A positive signal must scale linearly with inertial mass and proper acceleration; a signal scaling with coordinate acceleration, gravitational potential, or support force without proper acceleration falsifies the proper-acceleration reading of the branch. A null result gives a direct bound on $q_{\mathrm{act}}$ for the tested material system and acceleration range.

**Conditional $A_2$ Absolute-Scale Projection.** The internally normalized seesaw branch gives
$$
\Sigma_\nu=30.519194\,\mathrm{meV},
\qquad
m_\beta=4.62340\,\mathrm{meV},
\qquad
\frac{m_\beta}{\Sigma_\nu}=0.15149.
$$
These are conditional absolute-scale projections. The same branch does not match the cited mass-squared splittings and therefore is not an oscillation-data closure.

### 13.10.8 Baryon Asymmetry

The baryon-to-photon ratio is a finite transport image on the Appendix Y anomaly-holonomy/sphaleron branch:
$$
\eta_B
=
\mathcal N_\gamma
\left[
\mathcal U_B(t_f,t_i)Y_B(t_i)
+
\int_{t_i}^{t_f}
\mathcal U_B(t_f,t)
S_{CP}(t)e^{-W_B(t)}
\,dt
\right].
$$
The displayed illustrative reduction is

$$
\eta_B^{\mathrm{illustr}}
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B}
\approx
6.15\times10^{-10},
\qquad
\kappa_B
=
\frac{\kappa_{EW}}2+\frac{\varepsilon_0}{N_g}
=
19.481049060\ldots.
$$

The number uses the illustrative factors $\mathcal C_{\mathrm{eff}}=0.282$, $\mathcal F_{CP}=0.9997$, and $f_{\mathrm{wash}}=0.63$. The current archive fixes the displayed exponent only on the registered Steiner response-action, midpoint-readout, parallel-family-saddle, and family-selection branches; the transport factors and their covariance require the accepted transport certificate.
This value is theorem-level only after an accepted $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or APS-Kubo certificate $\mathfrak C_B^{\mathrm{APSK}}$ fixes the Steiner active-pair action and scale-bridge record supplying $\kappa_{EW}=77/2$, the regular anomaly/CP and additive-monotone family-selection record supplying $N_g=3$, the CP-sector record, sphaleron coefficient, washout profile, transport window, quadrature ledger, photon normalization, and residual interval before comparison.

**Observational Status:** The Planck measurement $\eta_B^{obs}=(6.12\pm0.04)\times10^{-10}$ is comparison data. No theory pull or agreement statement is defined before acceptance of a source, transport, freeze-out, washout, normalization, residual, and covariance certificate.

**Falsification Criterion:** A future value outside an accepted forward interval would falsify that accepted baryogenesis certificate. No numerical falsification interval exists on the current certificate-pending branch.

**Correlated Branch Prediction (Theorem Y.11):** The baryogenesis hierarchy relation of Theorem Y.11 gives a leading square-root sensitivity on the same transport branch, so within the same prefactor regime any BSM modification to the electroweak scale produces correlated shifts $\delta\eta_B/\eta_B \approx (1/2)\delta v/v$.

**Hierarchy Bridge Comparison (Proposition Y.11.1; Corollary Y.11.4a):** The ratio $\mathcal{P}_{\mathrm{eff}} = \eta_B / \sqrt{v/M_{Pl}}$ removes the common exponential factor on the conditional square-root branch. Inserting the adopted Appendix T/Y model inputs gives
$$
\mathcal{P}_{\mathrm{eff}}^{(\mathrm{model})}
=
\mathcal{C}_{eff}\,\mathcal{F}_{CP}\,f_{wash}\,2^{-1/3}A_{EW}^{-1/2}
=
0.1354.
$$
Observational inversion gives $\mathcal{P}_{\mathrm{eff}}^{(\mathrm{obs\,inv})}=0.1363$, an arithmetic difference of approximately $0.65\%$ from the unrounded inputs. Because $\mathcal C_{\mathrm{eff}}$, $\mathcal F_{CP}$, and $f_{\mathrm{wash}}$ remain open in the current archive, this is a model-branch/inversion comparison rather than an independent prediction of the prefactor.

**Exploratory source-channel benchmark.** Compare only preregistered, non-exhaustive hypotheses: a separability-preserving channel on a declared input class and a coherent branch-phase channel with full apparatus transfer data. For the diagnostic geometry
$$
\Phi_{\mathrm{geom}}=
\frac{Gm^2\tau}{\hbar}
\left(\frac1d-\frac1{\sqrt{d^2+\Delta x^2}}\right),
$$
$m=10^{-14}\,\mathrm{kg}$, $d=\Delta x=250\,\mu\mathrm m$, and $\tau=10\,\mathrm s$ give $0.741479\ldots$ rad. This is not a universal phase; a full prediction uses all branch distances and nuisance channels.

**Reset-support calorimetry.** For certified reset entropy decreases $\Delta H_j$ thermalized into a bath at $T$,
$$
Q_{\mathrm{bath}}\ge k_BT\sum_{j=1}^{N_{\mathrm{reset}}}\Delta H_j.
$$
Only the special record $\Delta H_j=\ln2$ for every event yields $N_{\mathrm{reset}}k_BT\ln2$. At $20\,\mathrm{mK}$ this special-event scale is $1.9139859\times10^{-25}\,\mathrm J$.

**Galactic-to-FRW projection.** A cosmological comparison requires one locked covariant map predicting expansion, sound horizon, equation of state, lensing, and growth with a common covariance ledger. Under the narrow diagnostic $H^2\propto G_{\mathrm{eff}}$,
$$
\delta\mu_{\mathrm{exact}}=
\left(\frac{73}{67.4}\right)^2-1
=0.173075\ldots,
$$
whereas $0.166172\ldots$ is only the first-order estimate $2\,\delta H/H$.

**Common-attractor drift.** If $\lambda_a=\lambda_a(u)$, then $d\log\lambda_a/dt=(\partial_u\log\lambda_a)\dot u$. The response functions, clock, thermodynamic metric, and dissipation allocation must be fixed before fitting one common drift.

**Conditional horizon conversion.** The assumptions $\Delta S=\ln2$ and $S=A/(4L_P^2)$ give $\Delta A=4\ln2\,L_P^2$. A quasistatic thermal step additionally gives $\Delta E=k_BT_H\ln2$. These identities establish no spectrum or line strength without a transition model.

**Finite-network emulator.** Hardware tests require explicit state, update, and observable maps, detector transfer, artifact residuals, and an injective response-faithful observable bridge. Combinatorial counts alone identify no physical spectrum.

**Exploratory benchmark: source-superposition response.** A source-superposition experiment may compare two preregistered, non-exhaustive channel hypotheses without treating either as a consequence of the Clausius construction.

1. $H_{\mathrm{sep}}$ is a specified CPTP channel that is separability-preserving on the tested input class. For every separable input $\rho_{AB}$ in that class,
   $$
   \mathcal N_{\mathrm{ent}}\!\left(H_{\mathrm{sep}}(\rho_{AB})\right)=0.
   $$
   This statement concerns entanglement generation; it does not assert that the channel erases entanglement from arbitrary inputs, and separability-preserving does not mean measure-and-prepare.
2. $H_{\mathrm{phase}}$ is a specified coherent branch-phase channel. For a declared two-distance geometry, use the diagnostic contrast
   $$
   \Phi_{\mathrm{geom}}
   :=
   \frac{Gm^2\tau}{\hbar}
   \left(
   \frac1d-
   \frac1{\sqrt{d^2+\Delta x^2}}
   \right).
   $$
   At $m=10^{-14}\,\mathrm{kg}$, $d=\Delta x=250\,\mu\mathrm m$, and $\tau=10\,\mathrm s$, this defined contrast is
   $$
   \Phi_{\mathrm{geom}}=0.741479\ldots\ \mathrm{rad}.
   $$
   A full apparatus prediction must use its four branch distances and transfer function; the displayed number is not a universal BMV phase.

The input state, witness, channel parameters, electromagnetic and mechanical nuisance channels, metric-covariance contribution, decision threshold, and stopping rule must be fixed before unblinding. Witness support above the certified separable cap rejects $H_{\mathrm{sep}}$ for the tested input and apparatus class. A null rejects $H_{\mathrm{phase}}$ only when the accepted sensitivity and decoherence ledger would have detected the specified phase channel. These two benchmarks do not exhaust the admissible source rules, so neither outcome selects a unique gravitational completion.

**Exploratory benchmark: reset-support calorimetry.** Let $N_{\mathrm{reset}}$ count physical binary reset-support events for which an accepted implementation record shows that the discarded logical information is thermalized into an instrumented bath at temperature $T$. Under those conditions Landauer accounting gives
$$
Q_{\mathrm{bath}}
\ge
N_{\mathrm{reset}}k_BT\ln2.
$$
At $T=20\,\mathrm{mK}$ the conditional scale is
$$
k_BT\ln2
=
1.9139859\times10^{-25}\,\mathrm J
$$
per certified reset, or $1.9139859\times10^{-20}$--$1.9139859\times10^{-18}\,\mathrm W$ at $10^5$--$10^7$ certified resets per second. A generic QND measurement, photon detection, or readout cycle is not thereby identified with a Definition 27 event or a Theorem 31 merge. The protocol must separately certify the reset counter, the bath receiving the entropy, the complete drive/readout energy balance, reversible controls, and uncertainty in $T$. The measured slope tests that implementation record; it is not a model-independent calorimetric discriminator between all unitary and nonunitary descriptions.

**Exploratory benchmark: galactic-to-FRW projection.** Let $\Theta_{\mathrm{DS}}$ be fixed by the declared galactic branch before cosmological comparison. A cosmological test requires an explicit covariant projection
$$
\mathcal F_{\mathrm{FRW}}:
\Theta_{\mathrm{DS}}
\longmapsto
\bigl(H(z),r_s,w(z),G_{\mathrm{eff}}(z),R_{\mathrm{FRW}}\bigr),
$$
where $R_{\mathrm{FRW}}$ is a propagated residual interval and the map introduces no target-fitted freedom. On the narrow fixed-density linearization $H^2\propto G_{\mathrm{eff}}$ with $G_{\mathrm{eff}}=G(1+\delta\mu)$,
$$
\frac{\delta H}{H}
=
\frac12\delta\mu+O(\delta\mu^2).
$$
The shift from $67.4$ to $73\,\mathrm{km\,s^{-1}\,Mpc^{-1}}$ would therefore require $\delta\mu=0.16617\ldots$ within this diagnostic linearization. This number is a required output test, not a value derived from Appendix I. The branch is testable only after the same locked map jointly predicts $H(z)$, $r_s$, $w(z)$, lensing, and growth with one covariance ledger.

**Exploratory benchmark: common-attractor drift.** Corollary D.8.7c supplies the applicable finite-dissipation bound. If several effective constants are functions of one accepted attractor coordinate $u(t)$, their first-order drift vector is
$$
\frac{d}{dt}\log\lambda_a
=
J_a(u)\dot u,
\qquad
J_a(u):=\partial_u\log\lambda_a(u).
$$
The correlated direction is fixed only after the response functions $J_a$, the thermodynamic metric, the clock convention, and the allocated dissipation interval are supplied independently. A joint clock protocol should fit the full covariance matrix and test whether one $\dot u$ accounts for all retained ratios within the D.8.7c budget. Strict convexity or quantum Fisher information alone supplies neither a numerical drift ceiling nor the response vector.

**Conditional horizon-step identity.** On a branch that separately assumes an exact dimensionless entropy step $\Delta S=\ln2$ and the saturated area law $S=A/(4L_P^2)$,
$$
\Delta A=4\ln2\,L_P^2.
$$
If the same quasistatic Schwarzschild step obeys $\Delta E=T_H\Delta S_{\mathrm{phys}}$ with $\Delta S_{\mathrm{phys}}=k_B\ln2$, then
$$
\Delta E=k_BT_H\ln2.
$$
These are conditional conversion identities. They do not establish an area spectrum, identify every merge with a horizon eigenvalue transition, or imply a ringdown-frequency comb. A spectroscopy search may use the spacing as a preregistered phenomenological template only after an independent transition model supplies line strengths, selection rules, damping, and the detector transfer function.

**Exploratory benchmark: finite-network emulator.** A programmable network test must begin with an implementation certificate
$$
\mathfrak C_{\mathrm{emu}}
=
\bigl(
\iota_{\mathrm{state}},
\iota_{\mathrm{update}},
\iota_{\mathrm{obs}},
H_{\mathrm{det}},
R_{\mathrm{cal}},
R_{\mathrm{art}},
\chi_{\mathrm{lock}}
\bigr),
$$
where the three $\iota$ maps identify abstract states, update rules, and observables with hardware records; $H_{\mathrm{det}}$ is the measured detector transfer operator; $R_{\mathrm{cal}}$ and $R_{\mathrm{art}}$ are calibration and artifact residuals; and $\chi_{\mathrm{lock}}=1$ records forward locking. The emulator may then test finite combinatorial outputs such as the $759$ octads or $2576$ dodecads, geometric relaxation on the represented graph, min-cut scaling, or a declared noise law. A failed output rejects the specified implementation certificate or the abstract rule it faithfully realizes. It rejects a physical PU branch only if $\iota_{\mathrm{obs}}$ is proved response-faithful and injective for the falsifying observable. Combinatorial multiplicities alone do not identify a glueball, CMB, gravitational, or material spectrum.

**Exploratory benchmark: receiver-relative matched-input cost audit.**

Let $T,R\in\{0,1\}$ index the target self-model and the receiving engineered system. At each registered ladder point $n$ and realization $r$, deliver the same serialized pattern $W_{nTr}$ to both receivers. The target-binding certificate must prove
$$
\Delta M_{S_R}^{(\mathrm{self})}(W_{nTr})\ne0
\quad\text{when }R=T,
$$
and
$$
\Delta M_{S_R}^{(\mathrm{self})}(W_{nTr})=0
\quad\text{when }R\ne T.
$$
A register permutation without this typed role and no-leakage proof is insufficient.

Use restored initial-state snapshots and Protocol Convention L.8.0's crossed design. The symmetric interaction contrast
$$
\Gamma_n
:=
\frac12
\left[
\mathbb E(Y_{n,0,0}-Y_{n,0,1})
+
\mathbb E(Y_{n,1,1}-Y_{n,1,0})
\right]
\tag{13.10.8a}
$$
removes fixed receiver and target main effects under the additive crossed model. A nonzero $\Gamma_n$ establishes a receiver-target cost interaction for the registered implementation. It does not by itself establish that $\mu$ is the unique mediator or distinguish PU from every ordinary receiver-dependent computation model.

Before unblinding, the external evaluator must register cost-independent certified intervals
$$
\mu_{nTR}\in[\mu^-_{nTR},\mu^+_{nTR}].
$$
If $\mu^-_{nTT}\ge8$ and Corollary B.2.2 records $c_s$, monotonicity of $u^2\ln(u/4)$ for $u\ge8$ gives the conservative floor
$$
L^-_{nTT}
:=
\frac{3c_s}{128}
(\mu^-_{nTT})^2
\ln\!\left(\frac{\mu^-_{nTT}}4\right).
\tag{13.10.8b}
$$
Observed cost above this floor is only consistency evidence because overhead can raise cost. A contradiction requires a fixed-path count or a verified all-path upper bound below $L^-_{nTT}$ after counter uncertainty is included; it rejects the joint implementation and reduction certificate for the tested class, not the mathematical proof of Theorem B.2.

The boundary pattern of Theorem M.10.4 is not a finite-cost observation: $\mu=\infty$ records absence of a completed subboundary integration on the certified branch. No finite ladder establishes observed unboundedness. Registered-reset calorimetry is a separate secondary protocol requiring independently certified reset events, conditional entropies, and bath data. This benchmark does not test CC, the perspectival quantum branch, gravity, cosmology, or a universal biological claim.

**Optional-program status register.**

| Program | Retained form | Status | Decisive missing or tested bridge |
|---|---|---|---|
| Source superposition | two non-exhaustive channel benchmarks | protocol | source rule and apparatus transfer |
| Calorimetry | reset-support heat inequality | conditional identity and protocol | certified reset count and bath map |
| Hubble comparison | locked galactic-to-FRW projection | certificate-gated diagnostic | covariant projection and joint covariance |
| Coupling drift | common-coordinate response test | certificate-gated diagnostic | response Jacobian and dissipation allocation |
| Horizon spacing | entropy/area/energy conversion | conditional identity | independent spectral transition model |
| Emulator | response-faithful implementation test | protocol | injective observable bridge |
| Receiver-relative cost | crossed matched-input implementation audit | certificate-gated protocol | typed target binding, model-access decision certificate, uniform B.2 reduction, and fixed-path or all-path cost ledger |

None of these rows is a theorem selecting a unique physical completion. Each becomes load-bearing only under the hypotheses and certificates stated in its own row.
