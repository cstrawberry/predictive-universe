# 13 Experimental Predictions and Protocols

The Predictive Universe framework, particularly the Consciousness Complexity (CC) hypothesis (Section 9) proposing a mechanism by which complex MPU aggregates can influence quantum outcomes, leads to specific, potentially falsifiable predictions that deviate from standard quantum mechanics. Because the predicted deviations can be small and are susceptible to experimental and statistical artifacts, the protocols in this section are formulated with strict methodological constraints: pre-specified hypotheses and analysis pipelines, blinding wherever feasible, rigorous environmental and device controls, and correction for multiple comparisons across outcomes, times, and experimental settings. The aim is not merely to detect an anomaly, but to isolate a reproducible, device-independent shift consistent with the bounded modification structure of Definition 33 and Theorem 36 while ruling out classical confounds (drift, selection effects, hidden feedback, and post-selection). Protocol 1a adds a report-induced expectation variant of the QRNG test: a true or false report is treated as a provenance-marked input to the participant's physical context, and the measured question is whether the resulting expectation context correlates with later quantum outcomes. This section details these predictions and outlines experimental protocols designed for their investigation, emphasizing near-term feasibility while acknowledging the significant challenges involved in distinguishing a genuine CC effect from systematic error.

### Assumption Checklist

- Geometric regularity (Theorem 43) holds on the operational-continuum branch, with exact continuum ontology excluded by Theorem K.10.3a.
- ND-RID irreversibility: $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$ (Theorem 31).
- Reflexivity Constraint: $\kappa_r>0$ (Theorem 33).
- PCE equilibrium reached (Definition 15a).
- Gauge sector realized as $G_{SM}$ on the Appendix G finite-response capacity/anomaly/hypercharge branch (Theorem G.8.4b and Corollary G.8.4c, with the Lagrangian gauge-realization branch for the generator bound where explicitly used).
- Emergent metric predictions use the operational-continuum, channel-capacity, stress-energy, and finite KMS-descent branch of Appendix F.10.12 and Corollary 12.1b when that certificate is invoked.
- Cosmological-sector theorem-level exponent claims use the Appendix U four-mode false-vacuum branch $\kappa=142$ under Theorem U.13b. A theorem-level numerical $\Lambda$ value additionally requires the false-vacuum relative Quillen-Fredholm prefactor certificate of Definition U.15d, Theorem U.15e, and Theorem U.15i.2, the no-promotion gate of Corollary U.15f, and, when determinant transfer is used, the Bismut-Lebeau transfer ledger of Definition U.15g through Corollary U.15j. The five-mode $\kappa_{\mathrm{ref}}=141.5$ branch remains a reference convention blocked as theorem-level by Theorem U.8c in the Definition U.4 continuum action.
- Fine-structure predictions use the Appendix Z Thomson normalization certificate of Definition Z.27.11a when a certificate-complete Thomson interval is claimed.
- Electroweak matching uses the forward-locked RHG record of Definition T.78.10 and Theorem T.78.11 when a certificate-complete threshold value is claimed.
- Flavor and baryogenesis numerics use the flavor certificate of Definition T.79.4 and the baryogenesis transport certificate of Definition Y.11.7a when theorem-level numerical closure is claimed.
- Uncertainty budgets follow the paper-wide canonical T1 (truncation), T2 (threshold/vacuum), T3 (scheme/mapping) decomposition of Appendix T.25.5.3, with certificate-specific residual intervals fixed before comparison.
- External observations/payoffs include $\varepsilon$ and $\kappa_r$ costs at the observer boundary.
- Report-induced expectation protocols treat reports as provenance-marked context inputs. A false report may change the participant's physically instantiated expectation state, but it does not certify the reported outcome as true, does not rewrite a past measurement record, and can only be tested against target quantum outcomes generated after the expectation context has been formed under locked measurement settings. Human-subject deception requires prior consent procedures, ethics approval, and debriefing.

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

A run is classified as **null** when the preregistered confidence or posterior interval excludes the protocol target effect scale while no artifact class is favored. A run is classified as **failure** when $H_{art}$ is favored, when the sign is inconsistent with the preregistered direction, when the stopping or exclusion rule is changed after outcome inspection, or when the result is not reproducible under the same endpoint.

**Proposition 13.0b (Mutual Exclusivity of Evidence Classes).** Under Definition 13.0a, a completed run cannot be simultaneously classified as support, null, and failure.

*Proof.* Support requires $BF_{PU,0}\ge B_*$ and $BF_{PU,art}\ge B_*$, the preregistered sign, bounded residual artifact, and independent replication. Null requires exclusion of the target effect scale without favoring the artifact class. The first condition is incompatible with exclusion of the target effect scale for the same primary statistic. Failure requires artifact preference, sign inconsistency, post-outcome rule change, or failed replication; each contradicts one of the support requirements. Hence support is disjoint from null and failure. Null and failure are disjoint by definition because null requires no favored artifact class and no protocol-breaking condition, while failure requires at least one such condition. ∎

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

**Definition 13.0f (Prediction Status Class).** Every numerical claim in this paper carries one of the following four prediction statuses, and the status is recorded together with the predicted value.

1. **Derived-retrodictive.** The numerical value is derived from a closed PU branch but the corresponding measurement was already published before the derivation was completed. The claim counts as mathematical compression evidence in the sense of Convention P.14.1d but does not count as forward empirical evidence.

2. **Certificate-retrodictive.** The numerical value is derived from a closed strict PPI/PCE certificate in the sense of Convention P.14.1k, but the measurement target was already published before the certificate was accepted. The claim counts as certificate compression evidence but does not count as forward empirical evidence.

3. **Forward-locked.** The exact value, certificate, and residual interval are fixed and entered into the forward-locked prediction register $\mathfrak R_{\mathrm{pred}}$ of Definition 13.0d before the relevant validation data are collected, and $\chi_{\mathrm{pred}}$ is satisfied.

4. **Prospective-confirmed or prospective-falsified.** A forward-locked prediction has met its evidence rule under Definition 13.0a or has failed its falsification rule under $\mathcal F$ in Definition 13.0d. Only this status counts as completed forward empirical evidence.

**Theorem 13.0g (Forward-Lock Necessity for Empirical Promotion).** A prediction listed in $\mathfrak R_{\mathrm{pred}}$ may be promoted to status 4 of Definition 13.0f only if it was first registered at status 3. Statuses 1 and 2 cannot be promoted directly to status 4 without an intervening forward-locked re-registration on a fresh measurement.

*Proof.* Status 4 requires the validation data to satisfy the evidence rule of Definition 13.0a or the falsification rule of $\mathcal F$ in Definition 13.0d, evaluated against an entry of $\mathfrak R_{\mathrm{pred}}$ that was fixed before the data were collected. Statuses 1 and 2 record retrodictive derivations against already-published targets; their entries do not satisfy the pre-comparison condition $\chi_{\mathrm{pred}}$ for those targets. Promotion of such an entry without a fresh forward-locked registration would require post-comparison fixing of certificate components, which is forbidden by Theorem 13.0e and Corollary Z.27.11d. The intervening forward-locked re-registration on a fresh measurement is exactly the registration of the same predicted value under status 3 against a target whose data are not yet collected. ∎

**Corollary 13.0h (Status Inheritance for Sector Outputs).** Each numerical row in Convention P.14.1k inherits a prediction status under Definition 13.0f from its certificate acceptance and its measurement history. A row with closure status "closed" and a published target before certificate acceptance is at most certificate-retrodictive; the same row with a forward-locked registration before fresh measurement is at most forward-locked, and at most prospective-confirmed or prospective-falsified after the evidence rule is met.

*Proof.* Status under Definition 13.0f depends on three independent records: closure of the strict PPI/PCE certificate, the time order of certificate acceptance relative to the measurement target, and the satisfaction of the evidence rule. The certificate closure controls statuses 1 versus 2. The time order controls status 3. The evidence rule controls status 4. Each row inherits its status as the deterministic image of these three records by Definition 13.0f and Theorem 13.0g. ∎

*Proof.* By Definition 13.0d, every forward-evidence entry is a pair consisting of a finite derivation certificate and a finite validation protocol. If the derivation certificate is fixed first, the validation data test an already determined interval or falsifier. If a certificate component is selected after the validation data are known, then the data participate in defining the interval being tested. Such a test is logically circular as forward evidence because the tested set is no longer independent of the observations. Therefore it can only be recorded as a post-selection consistency check. ∎

**Corollary 13.0f (Certificate Failure Rule).** If an observable fails the interval or falsifier associated with its accepted certificate in $\mathfrak R_{\mathrm{pred}}$, the corresponding branch is demoted or rejected. The interval may not be widened by replacing the certificate after comparison.

*Proof.* The interval and falsifier are entries of the fixed register. Replacing the certificate changes the register entry and therefore changes the branch under test. It cannot rescue the failed branch as the same prediction. ∎

**13.1 Prediction 1: Potential Born-Rule Deviations**

The core testable prediction of the CC hypothesis (Hypothesis 3) is that systems $S$ with sufficiently high aggregate complexity ($C_{agg} > C_{op}$) and non-zero operational $\mathrm{CC}(S)>0$ (Definition 30) can induce statistically significant deviations from the standard Born rule probabilities (Proposition 7) when interacting with a quantum system undergoing an 'Evolve' event (e.g., measurement).

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
On the stricter Fisher-budget subbranch of Theorem 36, where $d_{\mathrm{FR}}(p,q)\le\mathrm{CC}(S)$, one also has
$$
\mathrm{TV}(p,q)\le\sin(\mathrm{CC}(S)/2),
\qquad
|\Delta P(i)|\le4\sin(\mathrm{CC}(S)/4)
\quad
\forall i.
$$
For $\mathrm{CC}(S)\ll1$, the Fisher-budget subbranch gives $\mathrm{TV}(p,q)\lesssim\frac12\mathrm{CC}(S)$ and $|\Delta P(i)|\lesssim\mathrm{CC}(S)$.

*Remark on numerical impact.* The operational total-variation bound $\mathrm{TV}\le\mathrm{CC}$ is a factor-of-two looser at leading order than the Fisher-budget total-variation bound $\mathrm{TV}\le\sin(\mathrm{CC}/2)\approx\mathrm{CC}/2$. The per-outcome operational and Fisher-budget bounds coincide to first order, because $4\sin(\mathrm{CC}/4)=\mathrm{CC}+O(\mathrm{CC}^3)$. The QRNG sensitivity protocols of §13.2 and §13.2a therefore report two paired CC-extraction estimates: a **conservative** estimate $\widehat{\mathrm{CC}}_{\mathrm{op}}\ge\delta$ from the operational bound, which is always available, and a **sharp** estimate $\widehat{\mathrm{CC}}_{\mathrm{Fisher}}\ge 4\arcsin(\delta/4)$ on the Fisher-budget subbranch, which applies only when the protocol independently certifies the Fisher condition. The two per-outcome estimates differ by $O(\delta^3)$.

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
    *   *Artificial:* Sophisticated AI system. Major Challenge: Designing and verifying the physical interaction pathway $N(t)$ coupling the AI's internal $\text{context}_S$ (Definition L.1) to the QRNG's physical process, respecting constraints (speed, cost $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$, PCE, orthogonality to noise, mapping stability Theorem L.1). On the analyzed far-field classical-channel parameter range, the electromagnetic channel dominates with baseline ratio $\mathcal{R}\sim 10^{36}$ and conservative range $\mathcal{R}\sim 10^{33}\text{--}10^{39}$ (Proposition L.5), requiring coherent field generation (Theorem L.2). Statistical requirements (Appendix L, Protocol L.1) and gravitational self-limitation (Appendix S) provide experimental benchmarks. This requires significant R&D and confirmation that the AI meets the operational criteria ($C_{agg}>C_{op}$) necessary for potential CC > 0.
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

| $\alpha_{\mathrm{sig}}$ | $\delta$ | $N_{\text{fixed}}$ | $N_{\text{OBF}}$ ($\approx 1.06 \times N_{\text{fixed}}$) | Expected stop % at looks 1/2/3 (under $H_1$) |
|---:|---:|---:|---:|:---|
| 0.01 | $10^{-3}$ | 2,302,586 | 2,440,742 | ~5% / 20% / 75% |
| 0.01 | $5 \times 10^{-4}$ | 9,210,341 | 9,762,962 | ~3% / 17% / 80% |
| 0.01 | $10^{-4}$ | 230,258,510 | 244,074,021 | $\lesssim 1$% / 10% / 89% |
| 0.001 | $10^{-3}$ | 3,453,878 | 3,661,111 | ~4% / 18% / 78% |
| 0.001 | $5 \times 10^{-4}$ | 13,815,511 | 14,644,442 | ~2% / 15% / 83% |
| 0.001 | $10^{-4}$ | 345,387,764 | 366,111,030 | $\lesssim 1$% / 9% / 90% |

*   *Assumptions for $N_{\rm fixed}$ in the table:* **One-sample proportion** design with baseline $p=0.25$, power $1-\beta_{\mathrm{II}}=0.80$ (with $\alpha_{\mathrm{sig}}$ as shown in the table).
    *   *Sequential design:* O’Brien–Fleming boundaries with **3 equally spaced** looks at cumulative information fractions $1/3, 2/3, 1$. The overhead factor (~1.06) and stop percentages are **illustrative**; exact values will be determined by the preregistered simulations and released with the code.

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
\quad \text{(79o)}
$$
On the Fisher-budget subbranch, the paired estimate is
$$
\widehat{\mathrm{CC}}_{\mathrm{Fisher}}
\ge
4\arcsin(|\widehat{\delta}_{\mathrm{false}}|/4).
\quad \text{(79p)}
$$
If the control arms are not null, the contrast alone does not license Protocol 1a support; at most it implies that at least one compared arm carries a context-dependent shift of size at least $|\widehat{\delta}_{\mathrm{false}}|/2$, subject to the artifact ledger. For multi-outcome tests, use the preregistered pointwise, total-variation, or CTB-vector norm corresponding to Theorem 51 and Corollary 37a.

*   **Feasibility Assessment:** Protocol 1a is experimentally attractive because it avoids requiring active intention or deliberate biasing. It tests passive expectation as a physically instantiated context variable, using true/false report structure as a placebo-style discriminator. The main difficulties are psychological variability, deception ethics, report internalization strength, large required sample size, and exclusion of timing, leakage, and device-label artifacts.

**13.3 Prediction/Protocol 2: Exploratory Coherence Time Tests**

Investigates the secondary prediction that CC might influence quantum coherence (Proposition 13).

**13.3.1 Potential Effect on Coherence**

The CC influence mechanism (Hypothesis 3), by modulating 'Evolve'/ND-RID parameters contributing to decoherence, could potentially modify effective decoherence rates $\Gamma_{eff}$ or coherence times $\tau_{coh} = 1/\Gamma_{eff}$ of quantum systems interacting with a high-CC aggregate $S$.

**13.3.2 Phenomenological Model**

A possible model relates fractional change in coherence time to CC:
$$
\frac{\Delta \tau_{coh}}{\tau_{coh}} = -\frac{\Delta \Gamma_{eff}}{\Gamma_{eff}} \approx \gamma'_{CC} \cdot \mathrm{CC}(S) \cdot f_{context}(\text{context}_S, \text{system}) \quad \text{(80)}
$$
where $\Delta \tau_{coh} = \tau_{coh, obs} - \tau_{coh, base}$, $\gamma'_{CC}$ is a coupling factor, and $f_{context} \in [-1, 1]$ captures context-system interaction. Sign depends on context.

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
In a freely falling Fermi frame with one branch on the reference worldline and the other displaced by $L^a$,
$$
\mathcal D
=
\frac12|R_{0a0b}L^aL^b|
+
O(|L|^3).
$$

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

**Theorem 52 (Maxwell-Stark bound within the triple-blind protocol)**

Consider a triple‑blind protocol with DFS‑locked atomic‑clock qubits operated at a “magic” point so that the residual differential polarizability $\Delta\alpha$ is small and the induced Ramsey phase remains in the mid‑fringe, small‑phase regime. Reciprocity‑null geometry and algorithmic shielding may further suppress other systematic or adversarial channels, but the estimate below uses only the residual Maxwell energy density $u = I/c$ at the sensors over interrogation time $T$.

Then the purely Maxwellian differential AC Stark contribution to the Ramsey probability bias satisfies
$$
|\Delta P|_{\rm EM}\ \le\ \frac{|\Delta\alpha|}{4\,\hbar\,\varepsilon_0}\,u\,T
\quad\text{(mid‑fringe, small‑phase regime).}
\quad \text{(81)}
$$

*Derivation.* In a Ramsey interferometer at mid‑fringe, a small differential AC Stark shift $\Delta\omega$ between the two arms produces a phase shift $\Delta\phi=\Delta\omega\,T$. For $|\Delta\phi|\ll 1$,
$$
|\Delta P| = |\sin(\Delta\phi/2)| \le |\Delta\phi|/2 = |\Delta\omega|\,T/2.
$$
For a free-space electromagnetic field with energy density $u$, the mean squared electric field is $\langle E^2\rangle = u/\varepsilon_0$. The residual differential Stark shift is therefore
$$
\Delta\omega = \frac{\Delta\alpha}{2\hbar}\langle E^2\rangle
= \frac{\Delta\alpha}{2\hbar\,\varepsilon_0}\,u.
$$
Substituting this into the mid-fringe bound gives
$$
|\Delta P|_{\rm EM}\le \frac{|\Delta\alpha|}{4\hbar\varepsilon_0}\,u\,T,
$$
which is Eq. (81).

A separate bound on algorithmic predictability confounds is given by $P_{\rm guess}\le2^{-(H_\infty L-t)}$, where an adversary has at most $t$ bits of side-information. The **CC** effect predicted by PU, using the operational bound from Theorem 51, is
$$
|\Delta P|_{\rm PU}\le\mathrm{CC}(S).
$$
On the stricter Fisher-budget subbranch this is refined to
$$
|\Delta P|_{\rm PU}\le4\sin\!\big(\mathrm{CC}(S)/4\big)
\approx\mathrm{CC}(S)
\qquad
(\mathrm{CC}(S)\ll1).
$$
Using representative achievable values of $|\Delta\alpha|\!\lesssim\!10^{-39}\,\mathrm{J\,m^2/V^2}$ and $u\!\lesssim\!10^{-18}\,\mathrm{J/m^3}$, we obtain
$|\Delta P|_{\rm EM}\ \lesssim\ 2.68\times 10^{-13}\,T$ (with $T$ in seconds). This yields $|\Delta P|_{\rm EM} \lesssim 2.7\times 10^{-13}$ at $T=1\,\mathrm{s}$, and $9.6\times 10^{-10}$ at $T=1\,\mathrm{hr}$. Consequently, any observed $|\Delta P|\gtrsim 10^{-6}$ would lie far above this Stark-channel bound under the stated residual-intensity estimate; attributing such a signal to ordinary electromagnetism would therefore require some additional uncontrolled mechanism not modeled by Eq. (81). In contrast, the PU framework predicts $|\Delta P|_{\rm PU}$ could potentially reach $\sim 10^{-4}$ (assuming $\mathrm{CC}(S) \sim 10^{-4}$).


**13.5 Prediction/Protocol 3: Exploratory Bell Tests / Statistical FTL Search (Three-Branch)**

Addresses the most speculative prediction: potential statistical FTL influence mediated by CC acting on entangled systems (Postulate 3). The protocol targets the nonlocal/state-mediated marginal-anomaly branch (iii) of Postulate 3, on which Bob's marginal $P(b)$ shifts with Alice's *late-randomized* context; the local CPTP branch (i) preserves Bob's marginal and permits only Alice-local or joint-correlation changes detectable after classical comparison of records, and the preparation-context branch (ii) admits a Bob-marginal shift only when Alice's context is fixed in the shared causal past of the two measurement regions and is therefore excluded as an explanation of branch-(iii) data by a late-randomization design.

*   **Objective:** Sensitive search for preregistered statistical dependence of Bob's local measurement outcomes on Alice's remote context $\mathrm{context}_S$ (associated with system $S_A$ at her station), with A and B space-like separated and with $\mathrm{context}_S$ randomized strictly later than the latest event in the shared causal past of the two measurement regions. On branch (i), only Alice-local or joint/conditional correlations after classical comparison can vary; on branch (ii), a Bob-marginal shift can occur only when context randomization precedes preparation; on branch (iii), Bob's marginal itself shifts under late randomization. Secondary search for context-dependent changes in Bell parameters.
*   **Theoretical Basis:** Postulate 3 defines three branches. On branch (i), Bob's marginal probabilities are invariant by standard no-signaling (Bob-marginal kernel decomposition, Lemma 10.2). On branch (ii), Bob's marginal can depend on $C_A$ through common-cause statistics inherited from preparation in the shared causal past (Theorem L.12.8). On branch (iii), Alice's late-randomized context $C_A$ shifts Bob's marginal $P_{\mathrm{obs}}(b|B,C_A)$ while respecting Postulate 2 by remaining non-deterministic and zero-error inaccessible in finite pre-lightcone windows on the regular branch (Theorems 39a, 39b, and 42; Definitions 10.2a and 10.2c, when a current certificate is asserted). Detection of a marginal shift requires $N \propto 1/\mathrm{CC}(S_A)^2$ trials (Theorem 40); joint-correlation tests require classical comparison of records; the pre-lightcone information budget and sampling gate are bounded by Lemma 10.3.
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
    *   **Primary Focus (Statistical Influence):** Compare Bob's marginal probabilities $P(o_B | b, C_{A,k})$ across contexts $k$. Test the null hypothesis $H_0: P(o_B | b, C_{A,k=1}) = P(o_B | b, C_{A,k=2})$. Rejection under late-randomized $C_{A,k}$ supports branch (iii) of Postulate 3. Estimate the shift $\Delta P_{marginal}=|P(o_B | b, C_{A,1})-P(o_B | b, C_{A,2})|$. By Theorem 36, this shift is bounded by $\Delta P_{marginal}\lesssim\mathrm{CC}(S_A)$. Detection requires $N_{int}\gtrsim O(1/\mathrm{CC}(S_A)^2)$ (Theorem 40). Theorem 39a classifies the positive result as statistical rather than zero-error deterministic on the regular finite-window branch (Definition 10.2a).
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

The experimental program, especially Protocol 3, probes the framework's non-standard locality. Causal consistency is maintained as follows:

**13.7.1 Theorem 53 (CC Compliance with Postulate 2)**

The Consciousness Complexity (CC) mechanism (Hypothesis 3), constrained by $\mathrm{CC}\le\alpha_{CC,max}<0.5$ (Theorem 39) and by the finite-window zero-error gate (Theorem 39a) on the regular statistical branch (Definition 10.2a), and by the predictive-current no-loop/precision-cost gate when a current representation is asserted (Theorem 39b, Definition 10.2c), is consistent with the framework's definition of causality (Postulate 2) because it prevents deterministic or zero-error faster-than-light (FTL) signaling. The potential statistical FTL influence (Postulate 3) may still have positive finite-error statistical information (Theorem 41), but it remains sample-complexity limited (Theorem 40) and unusable for constructing paradox-inducing deterministic causal loops (Theorems 39b and 42, whose consistency is supported by the AQFT analysis in Appendix F).

*Proof.* Theorem 39 bounds the operational bias strength on the bounded-bias branch by $\mathrm{CC}\le\alpha_{CC,max}<0.5$. In particular, the CC mechanism cannot force both deterministic endpoints of a binary trial; hence it cannot implement deterministic one-shot superluminal signaling. Theorem 39a then addresses the finite-window statistical branch on the regular operating regime: under the common-support condition of Definition 10.2a — motivated by the endpoint gate, ND-RID finite-transfer limits, irreducible $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$, PPI admissibility of probability kernels, and refresh-branch strict contractivity where available — the context-conditioned transcript distributions retain positive overlap, so every finite pre-lightcone decoder has nonzero error probability. Theorem 39b adds that any current representation of such a signal is a coarse-graining of the same finite transcript algebra and therefore cannot create a zero-error decoder; when a finite Markov/KMS precision certificate is supplied, nonzero finite-cost current signals also carry nonzero variance. Theorem 40 shows that any nonzero CC signal can only be detected statistically, with required sample size scaling as $N=O(\mathrm{CC}^{-2})$. Theorem 41 bounds the finite-error information rate by a quantity of order $\mathrm{CC}^2$ at a regular operating point. Finally, Theorem 42 establishes that such a finite-error statistical channel cannot be concatenated into the deterministic or zero-error signaling loops excluded by Postulate 2. Appendix F supplies the AQFT locality framework for the Bob-marginal-preserving branch and the operator-local baseline; the branch-(iii) statistical-FTL consistency claim is furnished by Theorems 39a–42, with Theorem 39b supplying the current-level no-loop gate when that representation is used. Therefore the CC mechanism is compatible with Postulate 2 while remaining testable as a probabilistic Postulate 3 effect. ∎

*Note:* Empirical investigation of Postulate 3 (Protocol 3) critically tests this distinct aspect of PU's locality/causality. Confirmation requires re-evaluating standard locality; null results constrain/falsify this prediction.

**13.8 High-Precision Falsification Windows**

Beyond the direct experimental search for CC, the framework's quantitative predictions for fundamental constants and emergent gravity provide sharp, falsifiable tests.

**13.8.1 The Fine-Structure Constant Prediction Window**
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
This is a closed-form finite-response result: $K_0=3$, $d_0=8$, $M=24$, $D=4$, and $u^*=2^{1/8}-1$ are fixed upstream, and no continuous fit parameter appears in the expression. The closed-form core value is a single-valued elementary function of forced integers with no continuous tunable in the displayed chain (Theorem Z.26 with Corollary Z.26a). Its distance from $\alpha^{-1}_{\mathrm{exp}}=137.035999177(21)$ is
$$
0.00009287822863\ldots,
$$
about $0.678$ ppm. The comparison row is
$$
\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha.
$$
The residual $R_\alpha$ is structurally bounded by the named entries of $\mathfrak C_\alpha$ (Corollary Z.26b); it is not adjustable and cannot be selected using $\alpha^{-1}_{\mathrm{exp}}$. The displayed $\pm0.000060$ budget in the Appendix Z ledger is a canonical branch comparison budget; it is not a replacement for $R_\alpha$. The row is falsifiable as stated by Corollary Z.26c: once an accepted gate fixes $R_\alpha$, a measured value outside the certified residual interval refutes the Appendix Z normalization branch. Separately, by Corollary Z.27.11e.1, no same-branch theorem fixing $R_\alpha=0$ can land at the recorded comparison value, so the row is residual-gated rather than residual-free. On an accepted hypercharge-recoil operator-realized finite Ward branch, Definition Z.27.11k.12 and Theorem Z.27.11k.20 fix $R_{\alpha}^{YR\perp}=-0.00009287769839723537\ldots$, giving $\alpha^{-1}_{YR\perp}=137.03599917753023\ldots$; if the seventh-order passive-complement source is downgraded to the positive-contraction bound, Corollary Z.27.11k.21 gives $[137.03599917502362\ldots,137.03599917878353\ldots]$. Without the operator-realization ledgers these values remain diagnostic. Standard QED running from an accepted Thomson certificate is a downstream consistency ledger and does not close the residual.

**13.8.2 The Multi-Scale Gravity / Dark Sector Window**
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

**13.8.2a Critical Baryonic Surface-Density Window**
The bridge-law normalization for the galactic acceleration scale implies a second bridge-level galactic observable:

$$
\Sigma_\dagger = \frac{g_0}{2\pi G} = (134.7 \pm 2.3)\,M_\odot\,\mathrm{pc^{-2}}.
$$

This is the characteristic baryonic surface-density scale at which rotationally supported systems enter the low-acceleration regime. The prediction follows directly from Corollary H.1a and therefore inherits the same PU backbone as $g_0$.

**Falsification Conditions:**
- Well-characterized disk-galaxy samples, after finite-thickness and geometry corrections, exhibit a population-level transition surface-density scale significantly outside the stated window.
- The observed onset of mass discrepancy in high-quality baryonic maps fails to cluster around a single universal $\Sigma_\dagger$.
- Independent determinations of $g_0$ and the surface-density threshold are mutually inconsistent through $\Sigma_\dagger = g_0/(2\pi G)$.

**Vacuum–Electroweak Complexity Product Lock.**
The Appendix U five-mode reference branch and Appendix T electroweak hierarchy branch jointly predict
$$
(\Lambda L_P^2)\left(\frac{v}{M_{Pl}}\right)^2
=
8\pi A_{\mathrm{eff}}A_{EW}^2e^{-360}.
$$
The observable test statistic is
$$
\mathcal H_{\Lambda EW}
:=
-\ln\left[
\frac{
(\Lambda L_P^2)(v/M_{Pl})^2
}{
8\pi A_{\mathrm{eff}}A_{EW}^2
}
\right].
$$
The five-mode reference branch predicts
$$
\mathcal H_{\Lambda EW}=360.
$$
A value inconsistent with $360$ after the stated $A_{\mathrm{eff}}$ and $A_{EW}$ branch uncertainties are propagated falsifies the product-lock component of the five-mode reference branch.

**Electroweak–Baryon Square-Root Lock.**
The Appendix Y branch predicts
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
must equal
$$
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}2^{-1/3}A_{EW}^{-1/2}.
$$
A future change in the electroweak scale within the same baryogenesis regime would imply $\delta\eta_B/\eta_B=\frac12\delta v/v$ at fixed thermal and CP prefactors.

### 13.8.3 Glueball Mass Spectrum from Leech Geometry

If the QCD vacuum configuration space inherits Leech lattice geometry through PCE optimization of the $M = 24$ interface modes (Theorem Z.5), glueball masses follow from the shell structure with spin corrections.

**Imported result (Theorem Z.8h, Shell-$J^{PC}$ Correspondence).** For a glueball with quantum numbers $J^{PC}$, the Leech lattice shell squared norm is
$$|v|^2(J^{PC}) = a^2 + \Delta_J(J) + \Delta_P(P) + \Delta_C(C),$$
where
- Base shell $= a^2 = 4$ (Landauer: $a = 2$, Theorem Z.1),
- $\Delta_J(J) = J(J-1)$ for $J \ge 1$ and $\Delta_J(0) = 0$,
- $\Delta_P(+) = 0$, $\Delta_P(-) = a^2 = 4$,
- $\Delta_C(+) = 0$, $\Delta_C(-) = d_{\text{Golay}} = 8$ (Theorem Z.13).

**Complete Mass Formula.** For a glueball with spin $J$ on shell $|v|^2(J^{PC})$:

$$\frac{m(J^{PC})}{m(0^{++})} = \sqrt{\frac{|v|^2(J^{PC})}{4}} \times \sqrt{1 + \frac{J(J+1)}{a(2b-a)}}$$

where $a(2b-a) = 2(12-2) = 20$ is the residual mode capacity for spin encoding.

**Predictions:**

| State      | $\Delta_J$ | $\Delta_P$ | $\Delta_C$ | Shell $\|v\|^2$ | $Z(J)$ | Predicted | Lattice QCD       | Error |
|:-----------|:----------:|:----------:|:----------:|:---------------:|:------:|:---------:|:-----------------:|:-----:|
| $0^{++}$   | 0          | 0          | 0          | 4               | 1.000  | 1.000     | 1.00              | —     |
| $2^{++}$   | 2          | 0          | 0          | 6               | 1.140  | 1.396     | $1.40 \pm 0.02$   | 0.3%  |
| $0^{-+}$   | 0          | 4          | 0          | 8               | 1.000  | 1.414     | $1.48 \pm 0.03$   | 4.4%  |
| $3^{++}$   | 6          | 0          | 0          | 10              | 1.265  | 2.000     | $2.00 \pm 0.05$   | 0.0%  |
| $1^{+-}$   | 0          | 0          | 8          | 12              | 1.049  | 1.817     | $1.83 \pm 0.06$   | 0.7%  |
| $2^{-+}$   | 2          | 4          | 0          | 10              | 1.140  | 1.803     | $1.93 \pm 0.08$   | 6.6%  |


**Imported result (Corollary Z.8h.1, Hierarchy of Symmetry Costs).** The discrete symmetry costs obey $\Delta_C(-) > \Delta_P(-) > \Delta_J(J)$ for $J \le 2$, with hierarchy $8 > 4 > 2 \ge 0$. This explains why C-odd glueballs are heaviest, followed by P-odd, with spin providing finer structure.

The framework quantities—$a = 2$, $b = 6$, $d_{\text{Golay}} = 8$, $|v|^2_{\min} = 4$—are all derived from axioms (Theorems Z.1, Z.5, Z.13). The shell-to-$J^{PC}$ mapping (Theorem Z.8h) is now derived from first principles rather than empirically assigned.

**Falsifiability:** Improved lattice QCD calculations could confirm or refute these predictions at the sub-percent level. The $2^{++}$, $3^{++}$, and $1^{+-}$ predictions are particularly sharp.

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
x\equiv N\ln2\pmod{2\pi}.
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

| Rank | $(k,N)$ | $|\alpha_L-k/N|$ | $\delta_N=|N\ln2-2\pi k|$ |
|:----:|:--------|:----------------:|:-------------------------:|
| 1 | $(1,9)$ | $7.93\times10^{-4}$ | $0.0449$ |
| 2 | $(15,136)$ | $2.37\times10^{-5}$ | $0.0202$ |
| 3 | $(31,281)$ | $2.49\times10^{-6}$ | $0.00439$ |
| 4 | $(139,1260)$ | $3.40\times10^{-7}$ | $0.00269$ |
| 5 | $(170,1541)$ | $1.75\times10^{-7}$ | $0.00170$ |

**Three-gap finite-budget test.** For any finite cutoff $N_{\max}$, the points $\{N\ln2\bmod2\pi:N=1,\ldots,N_{\max}\}$ partition $[0,2\pi)$ into at most three distinct gap lengths by Proposition Q.0.7n.

**Falsification conditions on this branch:**
- no phase-grid component at $x\equiv N\ln2\pmod{2\pi}$ in a system independently shown to satisfy Definition Q.0.7u;
- a measured exact rational phase-step ratio replacing $\alpha_L$;
- a dimensionless phase grid whose positions vary with horizon mass after transforming to $x=\hbar\omega/(k_B T_H)$.

**Status:** This is a conditional transfer-branch prediction. It does not replace ordinary greybody-factor calculations and does not assert universal amplitudes, widths, or envelopes.

## 13.9 Prediction 4: Quantum Error Correction Optimality from PCE Structure

Beyond the CC-specific predictions of Sections 13.1–13.5, the PU framework makes a structural prediction concerning optimal quantum error correction: the parameters of the uniquely optimal error-correcting code should coincide with the PCE-Attractor structure derived in Appendix Z. This prediction has empirical support from existing quantum computing research, providing an independent validation pathway for the framework's core mathematical architecture.

### 13.9.1 Theorem 54 (PCE-Optimal Error Correction Parameters on the Predictive-Recovery MacWilliams Branch)

Within the binary linear code class analyzed in Appendix Z and Appendix R, and on the predictive-recovery MacWilliams Golay branch, the $M=24$ QFI-active interface modes at the PCE-Attractor determine the code parameters $[n,k,d]=[24,12,8]$. The mathematical uniqueness of the extended Golay code is theorem-level once Theorem Z.13b.0a fixes the self-dual split $k=12$.

*Proof.* Theorem Z.5 fixes the interface mode count to
$$
n = M = 2ab = 2 \times 2 \times 6 = 24.
$$
On the predictive-recovery MacWilliams Golay branch, the symmetric point is $k=n/2$, hence
$$
k = 12.
$$
With $(n,k)=(24,12)$ fixed, Theorem R.4.4 applies the Griesmer bound to binary linear $[24,12,d]$ codes and rules out $d\ge 9$, so
$$
d_{\max}=8.
$$
The same theorem records that the extended binary Golay code $\mathcal{G}_{24}$ uniquely achieves $d=8$ up to code equivalence. Therefore the branch-selected binary-linear code parameters are $[24,12,8]$. ∎

### 13.9.2 Corollary 54.1 (Code-Substrate Alignment Hypothesis)

If the physical quantum substrate exhibits structure aligned with the PCE-Attractor, then error-correcting codes matching the predictive-recovery Golay parameters $[24,12,8]$ are predicted to demonstrate superior performance—potentially exceeding predictions based solely on mathematical distance bounds—compared to codes with different structural parameters.

*Rationale:* Standard coding theory establishes that the Golay code saturates mathematical bounds (Hamming, Griesmer, Singleton). However, if the PCE-Attractor structure reflects genuine physical substrate organization, codes aligned with this structure may benefit from reduced effective noise, improved syndrome extraction fidelity, or enhanced logical gate performance. This creates a discriminating prediction between PU and standard quantum information theory.

### 13.9.3 Empirical Evidence from Existing Literature

Comparative studies in quantum error correction provide support for the Golay code's exceptional performance:

**Evidence 1: Fault-Tolerance Threshold**

Cross, DiVincenzo, and Terhal (2009) conducted a comprehensive comparative study of quantum codes for fault tolerance using the Aliferis-Gottesman-Preskill (AGP) extended rectangle method. Their analysis of codes ranging from the 7-qubit Steane code to various Bacon-Shor and surface codes found that the quantum Golay code achieved the highest level-1 depolarizing pseudo-threshold in their study, at $(2.25 \pm 0.03) \times 10^{-3}$. This threshold exceeded that of many codes with both smaller and larger block sizes.

**Evidence 2: Gigaquop-Scale Performance**

Ibe et al. (2025) demonstrated measurement-based fault-tolerant quantum computation comparing the Steane code $[[7,1,3]]$ and Golay code $[[23,1,7]]$ under circuit-level depolarizing noise. Their results confirm that both codes achieve their theoretically expected error scaling:

| Code | Parameters | Error Scaling | Computational Regime |
|------|------------|---------------|---------------------|
| Steane | $[[7,1,3]]$ | $O(p^2)$ | Megaquop (~$10^6$ T gates) |
| Golay | $[[23,1,7]]$ | $O(p^4)$ | Gigaquop (>$2 \times 10^9$ T gates) |

At physical error rate $p = 10^{-4}$, the Golay code supports approximately **800 times more operations** than the Steane code. The scaling exponents match theoretical expectations: for a distance-$d$ code, the logical error rate scales as $O(p^{\lfloor(d+1)/2\rfloor})$, giving $p^2$ for $d=3$ (Steane) and $p^4$ for $d=7$ (Golay).

*Interpretation:* This result confirms that the Golay code's theoretical optimality translates directly into practical performance advantages. When researchers sought the best code for maximum fault-tolerant performance on high-connectivity hardware, they independently selected the code that PU identifies as fundamental. While this is consistent with standard coding theory (higher distance yields better scaling), it validates that the PCE-optimal structure delivers real computational value—the 24-dimensional organization is not merely mathematically elegant but practically superior.

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

### 13.9.4 Theoretical Interpretation: Why the Golay Code?

The PU framework provides a principled branch explanation for Golay optimality:

**Standard Theory:** The Golay code is optimal because it saturates mathematical bounds. This is correct but does not explain *why* these particular bounds are physically relevant or why this structure is selected.

**PU Explanation:** The Golay code parameters emerge necessarily from the PCE-Attractor structure:

1. $n=24$ from QFI mode count $M=2ab$ (Theorem Z.5)
2. $k=12$ from predictive-recovery MacWilliams self-duality (Definition Z.13b.0, Theorem Z.13b.0a)
3. $d=8$ from maximum distance at these constraints (Theorem R.4.4)

The code's exceptional properties—self-duality, Mathieu group $M_{24}$ symmetry, connection to the Leech lattice $\Lambda_{24}$—are consequences of this branch alignment, not independent coincidences.

### 13.9.5 Theorem 55 (Golay-Leech-Attractor Compatibility Chain)

The PCE-Attractor mode count $M=24$ enters three linked constructions:
$$
M=24 \xrightarrow{\text{predictive-recovery MacWilliams Golay branch}} \mathcal{G}_{24},\qquad
\mathcal{G}_{24} \xrightarrow{\text{Lemma R.4.5}} \Lambda_{24},\qquad
M=24=K(D) \xrightarrow{\text{Appendix Z Bures tangent-cell channel branch}} D=4.
$$
Accordingly, the Golay code, the Leech-lattice gluing construction, and the spacetime-dimension selection share a common 24-mode compatibility backbone. The cited results do not by themselves show that each later object uniquely determines every subsequent entry in the chain.

*Proof.* On the predictive-recovery MacWilliams branch, Definition Z.13b.0 and Theorem Z.13b.0a fix $k=12$, after which Theorem Z.13b identifies the binary linear code at interface mode count $M=24$ with the extended Golay code $\mathcal G_{24}$. Lemma R.4.5 states that $\mathcal G_{24}$ supplies the gluing data in the standard construction of the Leech lattice from $\sqrt2 E_8^3$. Independently, Theorem Z.11 proves that the mode-channel condition $M=K(D)$ with $M=24$ selects $D=4$. These three cited results share the same numerical backbone $M=24$, which is the precise common structure established here. ∎

### 13.9.6 Classical vs. Quantum Golay Codes

The framework's prediction concerns the classical extended binary Golay code $[24, 12, 8]$, whose parameters directly reflect the PCE-Attractor structure. The quantum codes derived from this classical code are:

| Code | Parameters | Construction | Role |
|------|------------|--------------|------|
| Classical extended Golay | $[24, 12, 8]$ | PCE-optimal (Theorem 54) | Information structure |
| Golay stabilizer state | $[[24, 0, 8]]$ | CSS from self-dual code | Vacuum state (Remark G.8.4g.1a) |
| Quantum Golay | $[[23, 1, 7]]$ | Punctured CSS construction | Error correction |

The $[[24, 0, 8]]$ CSS construction from the self-dual Golay code yields a unique stabilizer state rather than a code space, since the quantum Singleton bound requires $k \leq 10$ for $[[24, k, 8]]$. This state represents the PCE-Attractor vacuum, stabilized by 12 X-type and 12 Z-type generators with $M_{24}$ symmetry. The $[[23, 1, 7]]$ punctured code encodes one logical qubit; puncturing reduces the distance from 8 to 7 and removes the self-duality constraint. Experimental tests of the substrate alignment hypothesis (Protocol 4) should focus on the $[[23, 1, 7]]$ code and structurally similar alternatives.

**Remark on Quantum Bounds.** The quantum Hamming bound constrains achievable parameters for nondegenerate quantum codes. For a $[[n, k, d]]$ code with $t = \lfloor(d-1)/2\rfloor$ correctable errors, the bound requires:

$$\sum_{j=0}^{t} 3^j \binom{n}{j} \leq 2^{n-k}$$

The $[[23, 1, 7]]$ quantum Golay code satisfies this bound, achieving the maximum distance compatible with its block length and rate.

### 13.9.7 Protocol 4: Discriminating Tests for Substrate Alignment

To distinguish the PU explanation from standard coding theory, we propose targeted experimental comparisons:

**Protocol 4.1: Structural Comparison at Fixed Parameters**

*Objective:* Compare performance of Golay-structured codes against alternative codes with similar mathematical parameters but different internal structure.

*Method:*

1. Implement the $[[23, 1, 7]]$ quantum Golay code on high-connectivity hardware (trapped ions, neutral atoms)
2. Implement alternative CSS codes with comparable $[[n, k, d]]$ parameters (e.g., randomly constructed $[[23, 1, \leq 7]]$ stabilizer codes)
3. Measure logical error rates under identical physical noise conditions
4. Compare observed performance ratios against theoretical predictions from distance alone

*PU Prediction:* Golay-structured codes outperform alternatives by a margin exceeding that predicted by distance differences alone.

*Null Hypothesis:* Performance differences are fully explained by mathematical distance bounds.

**Protocol 4.2: Rate Optimality Test**

*Objective:* Verify that rate $R = 1/2$ represents an optimal operating point.

*Method:*

1. Construct a family of $[24, k, d(k)]$ codes with varying $k \in \{8, 10, 12, 14, 16\}$
2. Measure logical fidelity per physical qubit across the family
3. Determine empirical optimal rate $R^*_{\text{emp}}$

*PU Prediction:* $R^*_{\text{emp}} = 0.5 \pm \epsilon$ with $\epsilon \ll 0.1$, matching PCE-optimal rate.

*Alternative:* Optimal rate depends on noise model and shows no preference for $R = 1/2$.

**Protocol 4.3: Block Length Optimality Test**

*Objective:* Determine whether $n = 24$ represents a preferred block length.

*Method:*

1. Compare families of optimal codes at block lengths $n \in \{16, 20, 24, 28, 32\}$
2. Normalize for qubit count: measure logical error rate per physical qubit
3. Assess whether $n = 24$ shows disproportionate advantage

*PU Prediction:* The $n = 24$ family shows disproportionate advantage, reflecting substrate alignment.

*Null Hypothesis:* Performance scales smoothly with $n$; no special status for $n = 24$.

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

**Prediction 4.1 (Threshold Enhancement):** The fault-tolerance threshold $p_{\text{th}}$ for Golay-structured codes satisfies:

$$p_{\text{th}}^{\text{Golay}} \geq 1.2 \times p_{\text{th}}^{\text{generic}}$$

where $p_{\text{th}}^{\text{generic}}$ is the threshold for codes of comparable distance but non-Golay structure.

**Prediction 4.2 (Rate-½ Optimality):** Among codes with block length $n = 24$, the rate $R = 1/2$ achieves minimum logical error rate per physical qubit across diverse noise models.

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

The substrate alignment hypothesis (Corollary 54.1) is falsified if:

1. Golay-derived $[[23, 1, 7]]$ codes show no statistically significant advantage over random $[[23, 1, 7]]$ codes or comparable CSS constructions at $p < 0.05$ significance level, after controlling for distance
2. Block lengths other than $n = 24$ prove systematically superior for rate-$1/2$ codes across multiple noise models
3. Rate $R \neq 1/2$ proves optimal for $n = 24$ codes across diverse noise models
4. The observed threshold ratio satisfies $p_{\text{th}}^{\text{Golay}}/p_{\text{th}}^{\text{generic}} < 1.1$ within measurement uncertainty
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

The Golay alignment prediction connects to other PU predictions through the unified PCE-Attractor structure:

| Prediction | Source | Connection to $M = 24$ |
|------------|--------|------------------------|
| Fine-structure constant core $\alpha^{-1}_{0}=137.03609205522863\ldots$ and certificate row $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$ | Section 13.8.1, Appendix Z | Capacity saturation, Appendix Z interface/curvature/sinc core, and residual gate |
| Spacetime dimensionality $D = 4$ | Appendix Z, Theorem Z.11 (see also Appendix H, Theorem H.4) | Kissing number $K(4) = 24$ |
| Vacuum stability | Appendix R, Proposition R.4.2a; Appendix Z, Theorem Z.8c and Proposition Z.13a | Golay $d = 8$ forces rootlessness, and rootlessness yields vacuum isolation |
| Gauge group structure | Appendix W | $\dim[\mathfrak{g}_{\text{SM}}] = 12 = k$ |

This web of interconnected predictions—all flowing from the single structure $(a, b, d_0) = (2, 6, 8)$ and the PCE optimization principle—provides robust cross-validation opportunities. Confirmation or falsification in any domain constrains the others.

### 13.9.11 Summary

The PU framework predicts that the extended binary Golay code $[24, 12, 8]$ represents the uniquely optimal error-correcting structure, with parameters derived from first principles via PCE optimization. Existing empirical evidence provides supporting validation:

| Finding | Source | Status | PU Interpretation |
|---------|--------|--------|-------------------|
| Golay achieves competitive threshold (~$2 \times 10^{-3}$) | Cross et al. (2009) | Established | Consistent with PCE-optimal parameters |
| Golay enables gigaquop-scale computation (>$10^9$ T gates) | Ibe et al. (2025) | Recent | Practical validation of theoretical optimality |
| Golay achieves $p^4$ scaling (as expected for $d=7$) | Ibe et al. (2025) | Recent | Distance bounds realized in practice |
| Golay deployed in critical classical systems | Voyager, MIL-STD-188 | Established | Practical validation of code superiority |
| Unique mathematical properties (self-duality, $M_{24}$, $\Lambda_{24}$) | Conway & Sloane (1999) | Established | Structural alignment with PCE-Attractor |

The evidence confirms that the Golay code's theoretical optimality—predicted by PU from first principles—translates into practical performance advantages. While the existing evidence is *consistent with* rather than *discriminating for* PU (standard coding theory also predicts Golay excellence), Protocol 4 provides methodology to test whether the code's performance exceeds distance-based predictions, which would constitute discriminating evidence for substrate alignment.

This constitutes an independent validation pathway for the PU framework, complementing the CC-focused protocols of Sections 13.2–13.5, including the report-induced expectation test of §13.2a.

## 13.10 Consolidated Falsifiability Analysis

The framework generates falsifiable rows once the core PU invariants are fixed, with status labels carried at the point of use. This section catalogs theorem-level, branch-level, validation-level, and model-level rows derived or formulated in the technical appendices, specifies the conditions under which each row would be refuted at its stated status, and summarizes current experimental status. Some are parameter-free within the discrete backbone of the theory; others use additional threshold, prefactor, or matching data stated explicitly in the technical appendices. This section catalogs the primary falsifiable predictions derived in the technical appendices, specifies the conditions under which each would be refuted, and summarizes current experimental status.

The predictions fall into three epistemic categories that must be distinguished to prevent conflation of claims of different logical type:

*Theorem-level quantitative predictions* are numerical values obtained from the framework without validation targets, phenomenological kernels, empirical inversions, uncomputed spectral inputs, transferred prefactors, or unclosed residual records. *Branch-level quantitative rows* are numerical values obtained after named branch hypotheses, bridge laws, finite-part conventions, or matching conventions are fixed. *Certificate-pending rows* are deterministic only after their finite certificates are accepted. *Validation and model rows* use validation targets, phenomenological response kernels, transferred prefactors, or status-limited spectral data; these rows are falsifiable as stated branch/model claims but are not counted as theorem-level PU predictions unless their status-carrying inputs are derived from prior PU structure, supplied by an accepted certificate, proved output-null, or removed by a no-go theorem. Thus $D=4$ is theorem-level on the Appendix Z Bures tangent-cell branch, the Appendix Z alpha core $\alpha^{-1}_{0}=137.03609205522863\ldots$ is a theorem-level closed-form core value on its stated branch, the Thomson comparison interval is certificate-pending on $R_\alpha$, the cosmological-constant prefactor is certificate-pending on $\mathfrak F_U^{(4)}$ and $\mathfrak I_U^{(4)}$, Appendix T matching-scale observables remain validation-level before an accepted flag-lift spectral certificate, and flavor/baryogenesis/nuclear rows inherit their own certificate gates. A measured value outside an accepted theorem-level interval refutes the corresponding theorem stack; outside a branch/model interval it refutes the named branch, bridge law, certificate record, or model layer rather than silently upgrading the row.

*Structural predictions* assert that specific mathematical structures emerge necessarily or conditionally from the framework's axioms and stated finite-response principles. These include Lorentz invariance (Theorem 46), the Standard Model gauge algebra $\mathfrak g_{\mathrm{SM}}=\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)$ on the Appendix G finite-response block-frame positive-marginal capacity branch (Theorem G.8.4b and Corollary G.8.4c, conditional on Proposition G.M1), the Born rule (Proposition 7), $N_{\mathrm{gen}}=3$ on the Appendix R pre-flavor family-redundancy PPI branch, and chronology protection from SPAP (Theorem 14.1). Falsification requires discovering that the predicted structure is violated in nature — for example, observation of fundamental Lorentz violation, an additional low-energy response-changing gauge generator outside the accepted branch, or a reproducible finite-response protocol demonstrating intervention-stable retrocausal control of paradox-enabling content (a retrocausal predictor of a causally affectable future variable whose accuracy guarantee survives the receiver's diagonal policy).

*Diagnostic reclassifications* identify formal features of existing theories as artifacts of unconstrained mathematical extrapolation rather than physical phenomena requiring resolution. These include the dissolution of curvature singularities (Section 14.2.4, Appendix K.5), the arrow-of-time "problem" (Appendix O), and UV divergences (Theorem K.10.4). These are not predictions of new observations but principled reinterpretations of existing physics; they are falsified if a phenomenon is discovered that demonstrably requires attribution of physical content to a structure the framework classifies as an artifact.

### 13.10.1 Spacetime Dimension

**Prediction:** Emergent spacetime has exactly $D = 4$ macroscopic dimensions.

**Derivation Summary:** The mode-channel correspondence (Theorem Z.10) requires $M_{\mathrm{int}} = M_{\mathrm{phys}} = K(D)$ at thermodynamic equilibrium, where $K(D)$ is the kissing number in $D$ dimensions. With $M_{\mathrm{int}} = 2ab = 24$ (Theorem Z.5), the equation $K(D) = 24$ has unique solution $D = 4$ (Theorem Z.11). On the minimal Appendix Z branch this is equivalently the chain
$$
M=24=K(4),
$$
and Corollary Z.11.3 makes the resulting falsifier explicit.

**Falsification Conditions:**
- Discovery of large extra dimensions accessible at collider energies
- Gravitational force law deviating from $1/r^2$ at any experimentally accessible scale
- Detection of Kaluza-Klein excitations indicating compact extra dimensions
- Any operational determination, within the minimal Appendix Z mode-channel chain, that the effective mode count is not $M=24$ or that mode-channel matching fails, i.e. $M\neq K(D)$

**Robustness:** The discrete nature of kissing numbers provides stability. The mode count $M=24$ would need to leave the interval $[13,39]$ before alternative dimensionality becomes even eligible, since $K(3)=12$ and standard bounds give $K(5)\ge40$ [Boyvalenkov et al. 2012].

**Current Status:** All observations consistent with $D = 4$. Gravitational inverse-square law confirmed to $\sim 52\ \mu\mathrm{m}$ (Lee *et al.* 2020). LHC searches exclude large extra dimensions to multi-TeV scales (ATLAS Collaboration 2021).


### 13.10.2 Fine-Structure Constant

**Prediction:** At the Thomson limit (zero momentum transfer), the canonical Appendix Z branch gives
$$
\alpha^{-1}_{0}=137.03609205522863\ldots,
\qquad
\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha
$$
through the third-order formula of Theorem Z.26. A certificate-complete Thomson interval is obtained only from an accepted Thomson normalization certificate $\mathfrak C_\alpha$ in the sense of Definition Z.27.11a.

**Derivation Summary:** Within the Appendix Z derivation, Theorem Z.26 combines bulk, interface, and curvature contributions:
$$
\alpha^{-1} = \frac{4\pi}{u^*} - \frac{\pi}{\sqrt{K_0}} + \frac{\pi u^*}{24\sqrt{K_0}}\left(1 - \frac{u^{*2}}{6}\right)
$$
where $u^*=2^{1/8}-1$ (Theorem Z.7) and $K_0=3$ (Theorem 15), evaluated on the canonical Appendix Z bulk-Ward, interface-derivative, response-sign, visible-space curvature, and separable-curvature branches. The certificate form replaces the third-order transport factor by the exact $SU(2)$ sinc factor and adds the forward-locked residual interval:
$$
\alpha^{-1}_{\mathrm{cert}}
=
\frac{4\pi}{u^*}
-
\frac{\pi}{\sqrt{K_0}}
+
\frac{\pi u^*}{24\sqrt{K_0}}
\operatorname{sinc}(u^*)
+
R_\alpha.
$$

**Falsification Conditions:**
- Precision measurements yielding $\alpha^{-1}$ outside the accepted branch interval in the forward-locked prediction register of Definition 13.0d
- Energy dependence of $\alpha$ inconsistent with standard QED running from the accepted Thomson-limit value
- Spatial or temporal variation of $\alpha$ at levels exceeding $10^{-6}$ per Gyr
- Post-comparison widening of $R_\alpha$, which demotes the branch by Corollary Z.27.11d rather than confirming it

**Residual interpretation.** The interval $\pm0.000060$ on the canonical branch is the displayed comparison budget attached to the provisional certificate record. It is not an adjustable tolerance and cannot be widened after comparison without defining a new branch by Corollary Z.27.11i. The residual entry $R_\alpha$ is structurally bounded by the named bulk, interface, electromagnetic, curvature, and sinc-transport entries of $\mathfrak C_\alpha$; it is not a free parameter and cannot be selected using $\alpha^{-1}_{\mathrm{exp}}$. A theorem-level Thomson comparison interval requires $R_\alpha$ to be fixed before comparison by Definition Z.27.11j, by the all-orders residual certificate of Definition Z.27.11g, or by a same-branch theorem proving $R_\alpha=0$. The SPAP-reflexive sinc-tail audit of Definition Z.27.11L is an internal consistency check on the third-order Taylor truncation of the already included sinc factor; it is not by itself a closure of the full residual gate.

**Current Status:**
$$
\alpha^{-1}_{\mathrm{exp}} = 137.035999177(21) \quad \text{(NIST 2024)}
$$
The exact sinc-core value satisfies
$$
\alpha^{-1}_{0}-\alpha^{-1}_{\mathrm{exp}}
=
0.00009287822863\ldots,
$$
about $0.678$ ppm. The closed-form core value from the discrete PU branch is a deterministic single-valued elementary function of the derived integers $K_0=3$, $d_0=8$, $M=24$, $D=4$ with no continuous fitting parameter in the displayed chain. This is a live precision test of the Appendix Z normalization package: theorem-level comparison status requires an accepted $\mathfrak C_\alpha$ together with an accepted residual gate fixing every entry of Definition Z.27.11a before comparison; by Corollary Z.27.11e.1 the gate must fix a nonzero $R_\alpha$, since a same-branch $R_\alpha=0$ theorem is obstructed at the recorded comparison value. A measured value outside the certified residual interval refutes the Appendix Z normalization branch by Corollary Z.26c.

**Consistency Check:** Standard QED running from the accepted Thomson-limit branch value yields $\alpha^{-1}(M_Z)$ in the electroweak comparison ledger; the branch must use the same forward-locked normalization and residual interval when entered into Definition 13.0d.

---

### 13.10.3 Generation Number

**Prediction:** Minimal admissible $N_{\min}=3$ in the anomaly+CP family-charge class; exact realized $N_{\mathrm{gen}}=3$ on the pre-flavor family-redundancy PPI branch.

**Derivation Summary:** The manuscript's strongest derivation of $N_{\mathrm{gen}}=3$ is topological: anomaly cancellation on $\Sigma_8 = U(8)/U(1)^8$, together with the requirement of nontrivial CP violation, selects the minimal admissible charge pattern $\{a,-a,0\}$ (Theorem R.3.4). Proposition R.3.5.1a removes supernumerary response-null family copies inside the pre-flavor family-redundancy PPI branch, so the exact realized count in that branch is $N_{\mathrm{gen}}=3$. The $D_4$ triality orbit, geometric $M=24=8\times3$ factorization, and Leech/$E_8$ constructions of Appendix R provide compatible three-fold structures without replacing the anomaly+CP and PPI selection route.

**Falsification Conditions:**
- Discovery of fourth-generation quarks or leptons at colliders
- Discovery of extra light active neutrino species
- Cosmological evidence for fourth light neutrino species ($N_\nu > 3.2$ at 95% CL)
- Z-pole width measurement inconsistent with three light neutrino families

**Current experimental handle:** The clean LEP observable is the effective number of light active neutrino species coupled to the $Z$:
$$
N_\nu = 2.9840 \pm 0.0082 \quad \text{(ALEPH \textit{et al.} 2006)}.
$$

This is an indirect consistency check for the three-generation claim under the standard identification "one light active neutrino per generation" and in the absence of additional light active species.

Indirectly consistent with $N_{\mathrm{gen}} = 3$ under the standard LEP identification of $N_\nu$ with the number of light active neutrino flavors. Direct searches exclude vectorlike quarks that decay to a $W$ boson and a light quark with masses below $\sim 1.5\ \mathrm{TeV}$ (ATLAS Collaboration 2024).


---

### 13.10.4 Gauge Group Structure

**Prediction:** On the finite-response block-frame positive-marginal capacity branch of Appendix G.8.4, the Standard Model gauge algebra
$$
\mathfrak g_{\mathrm{SM}}
=
\mathfrak{su}(3)_C\oplus\mathfrak{su}(2)_L\oplus\mathfrak u(1)_Y
$$
is uniquely selected inside the determinant-compatible block-frame/interface family. At the connected-cover notation level this is written as $SU(3)_C\times SU(2)_L\times U(1)_Y$; the determinant-compatible global form is fixed by the interface data rather than by an arbitrary $U(6)$-subgroup classification.

**Derivation Summary:** The PU gauge-search space is the determinant-compatible block-frame/interface family acting faithfully on a direct-sum inactive-sector certificate $\mathcal B\cong\mathbb C^6$ induced by the $b=6$ Landauer partition, with response-null exact global phases quotiented and determinant-compatible anomaly-admissibility imposed. Within this finite block-frame search space, the sharp generator bound is $n_G\le12$ (Theorem G.8.2e). In the positive-marginal regime of Equation (G.8.5), every admissible non-null block-frame generator below the bound lowers finite-protocol regret, so the PCE optimum saturates $n_G=12$ whenever attainable. The exhaustive block-partition analysis has a unique saturating row, $(3,2,1)$, and hence the gauge algebra is
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

### 13.10.5 Mass Hierarchy Invariant

**Prediction:** The mass hierarchy invariant takes discrete values:
$$
\mathcal{R} := \frac{\ln(m_3/m_1)}{\ln(m_3/m_2)} \in \left\{\frac{4}{3}, \frac{3}{2}, 2, 3, 4\right\}
$$

**Derivation Summary:** Equation R.17 derives $\mathcal{R} = d^2_{31}/d^2_{32}$ from $E_8$ root geometry, where the squared geodesic distances between generation vacua satisfy $d^2 \in \{2, 4, 6, 8\}$ (Section R.5). For Dirac sectors (charged leptons and quarks) the triad is path-additive and the pairwise suppression law of Theorem N.9 applies directly, so $\mathcal{R}$ is read as $d^2_{31}/d^2_{32}$. For the Majorana neutrino sector the triad $(a,b,b)=(2,6,6)$ is not path-additive, and Lemma T.24.10a shows that a pairwise law on this triad is inconsistent; the hierarchy invariant is therefore read in the anchored form $\mathcal{R}_\nu = \Delta_1/\Delta_2 = b/a = 3$ from Theorem T.24.11, and the $1\leftrightarrow 2$ $A_2$ edge $d^2_{21}=6$ is used as a mixing-geometry input to the PMNS construction of §T.24, not as an independent third mass-ratio equation. The prediction of a discrete value for $\mathcal{R}$ therefore has the same form across sectors, while the *extraction* of $\mathcal{R}$ from data uses path-additive and anchored readings respectively.

**Falsification Conditions:**
- Precision mass measurements yielding $\mathcal{R}$ values unambiguously between discrete predictions
- Failure of the invariant to match discrete values in multiple fermion sectors simultaneously

**Current Status (Charged Leptons):**

Using Particle Data Group 2024 values (Particle Data Group 2024):
$$
\mathcal{R}_\ell^{\mathrm{exp}} = \frac{\ln(m_\tau/m_e)}{\ln(m_\tau/m_\mu)} = \frac{\ln(3477.2)}{\ln(16.82)} = 2.889
$$

Closest discrete value: $\mathcal{R} = 3$, corresponding to $(d^2_{31}, d^2_{32}) = (6, 2)$. Deviation: 3.7%, within the theoretical uncertainty of $\sim 5\%$ arising from QED radiative corrections ($\sim \alpha/\pi \approx 0.2\%$ per mass, combining to $\sim 1\%$ on $\mathcal{R}$) and threshold matching effects ($\sim 1\%$), with a factor of $\sim 2$ for higher-order contributions.

---

### 13.10.6 Summary Table

**Table 13.1: Falsifiable Predictions and Current Status**

| Prediction | Framework Value | Experimental Value | Derivation | Status |
|:-----------|:----------------|:-------------------|:-----------|:------:|
| Spacetime dimension $D$ | 4 | 4 | Theorem Z.11 | ✓ |
| Fine-structure constant $\alpha^{-1}$ | $\alpha^{-1}_{0}=137.03609205522863\ldots$ and $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$; accepted operator-realized hypercharge-recoil branch gives $\alpha^{-1}_{YR\perp}=137.03599917753023\ldots$ | $137.035999177(21)$ | Theorem Z.26; Definition Z.27.11a; Theorem Z.27.11j.1; Definition Z.27.11k.12; Theorem Z.27.11k.20; Corollary Z.27.11k.21 | ◐ closed-form core; point closure only on accepted operator-realized branch |
| Light active neutrino count $N_{\nu}$ | 3 under the standard identification from $N_{\mathrm{gen}}=3$ | $2.984 \pm 0.008$ | Theorem R.3.4 + LEP $Z$ width | indirect |
| Gauge algebra / connected-cover notation on the finite-response block-frame positive-marginal capacity branch | $\mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak u(1)$; connected cover $SU(3) \times SU(2) \times U(1)$ | Standard Model gauge algebra; global form fixed by determinant interface | Theorem G.8.4b; Corollary G.8.4c | ◐ finite-response block-frame branch theorem |
| Lepton hierarchy $\mathcal{R}_\ell$ | 3 | 2.889 (3.7% dev.) | Equation R.17 | ◐ hierarchy invariant; absolute normalization separate |
| Chronometric curvature phase/dephasing | $\hbar|\dot\Theta|/|\Delta E|=|\Delta\Phi|/c^2$; on saturated ND-RID branch $\hbar\Gamma_{\mathrm{res}}/|\Delta E|=|\Delta\Phi|/c^2$ | dedicated clock-interferometer test required | Theorem 47c; Theorem S.7.3a | ◐ branch prediction; ○ untested |
| Report-induced expectation CC | On the expectation-mediated branch, seen false reports can produce a report-content-aligned later outcome shift $\delta_{\mathrm{false}}\ne0$ while unseen and delayed-report controls remain null; CTB subbranch requires target-vector alignment and vanishing orthogonal residual | dedicated blinded true/false/unseen/delayed QRNG or finite-POVM expectation protocol required | Theorem 51; Definition 34; Corollary 37a; Protocol 1a | ◐ branch prediction; ○ untested |
| Golay noise spectroscopy | $\mathcal R_8=1+968\eta_8$ with $\eta_8>0$ on the aligned residual branch; incidence $253:77:21:5:1$; controlled weight-4 fibers form $1771$ six-tetrad sextets | dedicated 24-mode residual-noise and decoder-boundary tests required | Theorem Z.13b.3; Corollary Z.13b.5; Protocol 4.4 | ◐ branch prediction; ○ untested |
| Golay-Steiner octad stiffness | normalized Hessian spectrum $0^{(1)}\oplus352^{(23)}$ on the exact octad stiffness branch | classical-emulator audit available now; physical 24-mode quadratic-response spectroscopy with $759$-term octad coupling is architecture-pending | Corollary Z.13b.1a; Definition T.10a; Lemma T.2; Protocol 4.5 | ◐ branch prediction (emulator gate); ○ untested (physical gate) |
| Cosmological acceleration lock | $g_0=c^2\sqrt{\Lambda}/8$; $\Sigma_\dagger=c^2\sqrt{\Lambda}/(16\pi G)$ | $g_0\sim1.2\times10^{-10}\,\mathrm{m/s^2}$; surface-density tests pending | Cor H.1, Cor H.1a, Cor I.3a | ◐ bridge-law branch; ○ redshift/lensing tests pending |
| Primordial complexity product | $A_s r=A_Qe^{-22}/(4\pi^2)$; leading $A_Q=1$ gives $7.07\times10^{-12}$ | tensor measurement pending | Corollary U.65a; Section 13.10.6 | ◐ branch prediction; ○ untested |
| A2 neutrino cosmology closure | $\Sigma_\nu=58.2\,\mathrm{meV}$, $m_\beta=8.85\,\mathrm{meV}$ | future cosmology/beta endpoint tests | Cor T.24.16a | ◐ neutrino branch; ○ untested |
| Proper-acceleration entropy drag | $\mathcal Q_a=q_{\mathrm{act}}$ | dedicated acceleration calorimetry required | Cor N.12b | ◐ proper-acceleration branch; ○ untested |
| Predictive record-current TUR | $\operatorname{Var}(J_T)\Sigma_T/\langle J_T\rangle^2\ge2$ on every Blackwell-PCE classical record quotient | stochastic record-current and entropy-production tests | Thm D.8.7f; Cor D.8.7g | ✓ finite record theorem; ○ protocol-specific tests |
| Scalar-channel hyperon spin filter | short-range $\Lambda\bar\Lambda$ nonzero; long-range, same-sign, spin-zero controls vanish | collider correlation tests | Cor Z.8k.1a | ◐ scalar-channel branch |


All displayed rows are currently consistent with observation at their stated status level. A theorem-level row falling outside its stated uncertainty bound would falsify the corresponding theorem stack; a branch-level or model-level row falling outside its stated uncertainty bound would falsify the named branch, bridge law, threshold input, or model layer carried by that row. The Thomson $\alpha^{-1}$ row is residual-gated rather than residual-free: Corollary Z.27.11e.1 obstructs a same-branch $R_\alpha=0$ theorem at the recorded CODATA comparison value, so the row is theorem-level only with a forward-locked nonzero residual gate. For the predictive record-current TUR row, the relevant falsifier is a closed finite record quotient with measured stationary current, variance, and entropy production satisfying
$$
\frac{\operatorname{Var}(J_T)}{\langle J_T\rangle^2}\Sigma_T<2
$$
after the Blackwell-PCE record channel and entropy-production ledger have been fixed.

---

### 13.10.7 Theoretical Error Budget

| Prediction | Dominant Uncertainty Source | Estimated Magnitude |
|:-----------|:---------------------------|:--------------------|
| $\alpha^{-1}$ | exact sinc-core arithmetic plus branch comparison budget before residual closure; on an accepted operator-realized hypercharge-recoil branch the residual is fixed by the finite Ward operator gate | before residual closure: $\pm0.000060$ diagnostic budget; accepted operator-realized branch: $R_{\alpha}^{YR\perp}=-0.00009287769839723537\ldots$ or downgraded interval width $3.759913047\times10^{-9}$ |
| $\mathcal{R}$ | QED radiative corrections ($\sim 1\%$), threshold effects ($\sim 1\%$), higher-order ($\times 2$) | $\sim 5\%$ |
| $N_{\mathrm{gen}}$ | Minimal admissible count exact in the anomaly+CP class; exact realized count fixed on the pre-flavor family-redundancy PPI branch; $D_4$ triality and $E_8$/Leech provide compatibility checks | branch-discrete |
| $D$ | Exact in the Appendix Z Bures tangent-cell mode-channel contract | branch-discrete |

The predictions for $D$ and exact realized $N_{\mathrm{gen}}$ are exact within their named finite-response branches. A deviation would falsify the corresponding Bures tangent-cell channel contract or pre-flavor family-redundancy PPI branch; detailed flavor values remain downstream branch data.

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

**A2 Neutrino Cosmology Closure.**
The anchored Majorana $A_2$ branch predicts
$$
\Sigma_\nu=58.2\,\mathrm{meV},
\qquad
m_\beta=8.85\,\mathrm{meV},
\qquad
\frac{m_\beta}{\Sigma_\nu}=0.152.
$$
The branch is falsified by a robust cosmological neutrino mass sum or direct beta endpoint mass inconsistent with these values after the stated oscillation, PMNS, and cosmological-model uncertainties are propagated. A confirmed inverted ordering also falsifies the anchored Majorana branch by Corollary T.24.11.1.

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
The displayed validation run uses the reduced product form
$$
\eta_B^{\mathrm{val}}
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B}
=
(6.2\pm0.5)\times10^{-10},
\qquad
\kappa_B=\kappa_{EW}/2+\varepsilon_0/N_g=19.48.
$$
This value is theorem-level only after an accepted $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or APS-Kubo certificate $\mathfrak C_B^{\mathrm{APSK}}$ fixes the electroweak threshold record, CP-sector record, sphaleron coefficient, washout profile, transport window, quadrature ledger, photon normalization, and residual interval before comparison.

**Observational Status:** The Planck measurement $\eta_B^{obs}=(6.12\pm0.04)\times10^{-10}$ is consistent with the displayed validation run at its model/threshold status.

**Falsification Criterion:** A future value outside the accepted forward interval would falsify the accepted baryogenesis certificate if such a certificate is supplied; before acceptance, it falsifies the displayed validation branch or one of its transport inputs.

**Correlated Branch Prediction (Theorem Y.11):** The baryogenesis hierarchy relation of Theorem Y.11 gives a leading square-root sensitivity on the same transport branch, so within the same prefactor regime any BSM modification to the electroweak scale produces correlated shifts $\delta\eta_B/\eta_B \approx (1/2)\delta v/v$.

**Hierarchy Bridge Cross-Check (Corollary Y.11.4a):** The ratio $\mathcal{P}_{\mathrm{eff}} = \eta_B / \sqrt{v/M_{Pl}}$ removes the common exponential suppression and isolates the derived $O(1)$ prefactor. The theory value
$$
\mathcal{P}_{\mathrm{eff}}^{(\mathrm{th})}
=
\mathcal{C}_{eff}\,\mathcal{F}_{CP}\,f_{wash}\,2^{-1/3}A_{EW}^{-1/2}
=
0.1354
$$
agrees with the observational determination $\mathcal{P}_{\mathrm{eff}}^{(\mathrm{obs})} = 0.1363$ at the $0.6\%$ level.
