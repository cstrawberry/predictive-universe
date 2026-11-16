# 9. Consciousness Complexity (CC): Emergent Biasing of MPU Interactions

<a id="cc-conjecture-boundary"></a>**CC conjecture boundary.** CC is a model-level extension of the core MPU framework. Postulate 3 distinguishes three operational branches: (i) a local CPTP branch on which Bob's unconditional marginal is invariant while post-comparison joint or conditional correlations may vary; (ii) a preparation-context branch on which states $\omega_C$ are fixed in the shared causal past, with no independently late spacelike input; and (iii) a marginal-anomaly branch on which Alice's independently selected context, chosen after distribution and later than the latest shared-past preparation event, changes Bob's pre-lightcone marginal. Branch (iii) is PU's genuine statistical-FTL hypothesis and a departure from standard quantum mechanics. By Theorem 39c and Corollary 39c.1 it lies outside exact pre-lightcone context independence, and its preregistered marginal test decides between the two branches: a certified shift would select branch (iii) over the exact causal branch, while a null result keeps the exact causal branch. Theorems 39, 39a, and 40–42 bound endpoint forcing, finite-window zero-error reliability, sample complexity, and information rate without converting branch (iii) into branch (i) or (ii). Sections 10 and 13 distinguish the branches by late randomization and marginal measurement.

This section develops the CC hypothesis: under the stated operational conditions, sufficiently complex MPU aggregates acquire an information-geometric capability to bias local 'Evolve' probabilities by small amounts.

**9.1 MPU Aggregates and Context-Dependent Interactions**

<a id="911-definition-29-def-29-mpu-aggregate"></a>**9.1.1 Definition 29 (Def 29): MPU Aggregate**

An **MPU aggregate** is a physical system composed of multiple interacting Minimal Predictive Units (Definition 23). The aggregate's collective state and dynamics implement a predictive model characterized by an aggregate Predictive Physical Complexity $C_{\mathrm{agg}} = C_P(\mu_{\mathrm{agg}})$, where $C_{\mathrm{agg}} \ge C_{op}$. Such aggregates operate adaptively (Section 6) to solve their own potentially more complex Prediction Optimization Problem (Axiom 1), maintaining viability within the Space of Becoming $(\alpha, \beta)$ (Axiom 3). On Hypothesis 1's nominated branch, a macroscopic system—including a biological brain or AI system—is a candidate MPU aggregate. Identifying it as a Definition 29 aggregate requires a physical realization of its Definition 23 components and aggregate state and dynamics. Theorem 23e exhausts the architectures decoded by a frozen bounded total decoder under its finiteness, totality, and decidability premises; a nonempty admissible subcensus then lets Theorem 23d classify the populated exact response tables using the decidable PPI-admissibility predicates and source-exhausted common-unit cost. Using that bounded classification to identify a concrete system additionally requires accepting the decoder and bound as physically exhaustive, populating those records, and supplying the response-faithful physical realization.

<a id="912-assumption-1-context-dependence-of-nd-rid-probabilities"></a>**9.1.2 Assumption 1 (Context-Dependence of ND-RID Probabilities)**

On the separately supplied stochastic ND-RID branch, let the normalized kernels $P(o\mid x,y)$ and $P(x'\mid x,y,o)$ admit an additional registered context argument $S_{\mathrm{agg}}$ from the surrounding MPU aggregate. On the independently accepted Hilbert/Born/instrument branch, $P_{\mathrm{Born}}(o)=\operatorname{tr}(\rho E_o)$ is the reference law on its certified effect domain. Assumption 1 permits response-active dependence of the observable law $P_{\mathrm{obs}}(o\mid x,y,S_{\mathrm{agg}})$ on $S_{\mathrm{agg}}$; a nonzero deviation from the Born reference requires Theorem 34's strict-improvement hypotheses and Hypothesis 3's physical context-to-control realization.

*Justification:* This dependence is motivated by the adaptive nature of the MPU network operating under POP/PCE and is adopted as an explicit modeling assumption for the CC program. For an aggregate to optimize predictions efficiently, it is natural for its constituent MPUs' interactions to be sensitive to the aggregate context $S_{\mathrm{agg}}$; a strictly context-independent ND-RID parameterization would generically restrict the controllable degrees of freedom available for PCE-driven adaptation. PCE optimization is therefore expected to favor configurations where ND-RID parameters can be modulated by $S_{\mathrm{agg}}$. This allows the system to learn—via dynamics that minimize the PCE Potential $V(x)$ (Appendix D)—how to locally adapt interaction probabilities to enhance overall predictive performance. Appendix L describes conditional implementation classes for such modulation. An AC-Stark implementation requires a specified source, coupling Hamiltonian, target response, coherence window, and likelihood map; the Fourier construction of Theorem L.8 does not identify a carrier without an additional physical-response model, and Theorem L.9 applies only to its declared admissible mapping class.

**9.2 The Emergence of Biasing Capability from POP/PCE Optimization**

Given context-dependent ND-RID probabilities (Assumption 1), and that the aggregate's internal state $\rho_{\mathrm{agg}}$ (or its effective description) provides the primary local context for constituent MPUs within complex aggregates ($C_{\mathrm{agg}} > C_{op}$), the framework's optimization principles select non-Born biasing exactly when a reachable non-Born context has strictly lower PCE potential than every Born-realizing minimizer in the reduced context class. If no such strict-improvement context exists, PCE may select the Born reference context and no nonzero CC follows. Theorem 34 records this strict-improvement condition.

**Remark (Strict-Improvement Branch Discipline).** The strict-improvement antecedent is a branch condition, not a consequence of complexity alone. A sufficient local test at the null/Born-realizing map $u_0$ is an admissible differentiable curve $\gamma:[0,\delta)\to\mathcal U$ with $\gamma(0)=u_0$ and
$$
\left.\frac{d}{dt}V(\gamma(t))\right|_{t=0^+}<0.
$$
Then $V(\gamma(t))<V(u_0)$ for all sufficiently small positive $t$. Under Theorem 34's lower bound on every Born-realizing context, these nearby contexts are non-Born. Selection of a nonzero operational map additionally uses that theorem's attainment and representability hypotheses. Nonzero predictive sensitivity or a nonzero uncancelled ambient gradient alone does not supply an admissible descent direction when constraints are present. If strict improvement is absent, a Born/null context can remain a PCE minimizer; failure of this local test does not exclude improvement elsewhere in the reachable class. The empirical prediction of nonzero CC therefore remains conditional on the complete strict-improvement branch.

<a id="921-theorem-34-poppce-selects-biasing-on-the-strict-improvement-branch"></a>**9.2.1 Theorem 34 (POP/PCE Selects Biasing on the Strict-Improvement Branch)**

Assume context-dependent ND-RID probabilities (Assumption 1). Let $S$ be an MPU aggregate with $C_{\mathrm{agg}}>C_{op}$. Let $\mathcal U$ be the set of reachable internal context states on the timescale of the local `Evolve`/ND-RID events, let $P_{\mathrm{obs}}(\cdot\mid u)$ be the induced distribution for one retained measurement, and let $V:\mathcal U\to\mathbb R$ be the reduced PCE potential. Assume:

1. there is a reference context $u_0\in\mathcal U$ with $P_{\mathrm{obs}}(\cdot\mid u_0)=P_{\mathrm{Born}}$;
2. there is $u_+\in\mathcal U$ with $V(u_+)<V(u_0)$ and $P_{\mathrm{obs}}(\cdot\mid u_+)\ne P_{\mathrm{Born}}$;
3. if $P_{\mathrm{obs}}(\cdot\mid u)=P_{\mathrm{Born}}$, then $V(u)\ge V(u_0)$;
4. whenever $P_{\mathrm{obs}}(\cdot\mid u)\ne P_{\mathrm{Born}}$, the deviation on the retained event algebra is represented by a Hermitian-preserving, trace-annihilating complex-linear map $L_{S,u}$ in the sense of Definition 30;
5. $V$ attains its global minimum on $\mathcal U$, and the adaptive dynamics has an asymptotically stable attractor $u^*\in\arg\min_{u\in\mathcal U}V(u)$.

Then $P_{\mathrm{obs}}(\cdot\mid u^*)\ne P_{\mathrm{Born}}$ and $L_{S,u^*}\ne0$. Consequently
$$
\mathrm{CC}(S)=\|L_{S,u^*}\|_{\mathrm{op}}>0.
$$

*Proof:*
1.  Since $u^*$ minimizes $V$ on $\mathcal U$, one has
    $$
    V(u^*)\le V(u_+) < V(u_0).
    $$
2.  Suppose, for contradiction, that $P_{\mathrm{obs}}(\cdot|u^*)=P_{\mathrm{Born}}$. Then the Born-level minimality hypothesis implies $V(u^*)\ge V(u_0)$, contradicting Step 1. Hence
    $$
    P_{\mathrm{obs}}(\cdot|u^*)\ne P_{\mathrm{Born}}.
    $$
3.  By operational representability, there exists a Hermitian-preserving, trace-annihilating linear map $L_{S,u^*}$ such that the local deviations are given by
    $$
    \Delta P(i)=\operatorname{tr}\!\big(L_{S,u^*}(\rho)E_i\big).
    $$
    If $L_{S,u^*}=0$, then $\Delta P(i)=0$ for every local event, so $P_{\mathrm{obs}}(\cdot|u^*)=P_{\mathrm{Born}}$, contradicting Step 2.
4.  Therefore $L_{S,u^*}\ne0$, and by Definition 30,
    $$
    \mathrm{CC}(S)=\|L_{S,u^*}\|_{\mathrm{op}}>0.
    $$
    ∎

**9.3 Consciousness Complexity (CC): Operational Definition and Scaling**

We define Consciousness Complexity (CC) operationally as the quantitative measure of the emergent biasing capability conditionally certified by Theorem 34. The word "observer" denotes any finite record-forming protocol in the measurement formalism; CC is not a prerequisite for Evolve. High-CC systems enter the quantum formalism as high-resource record-integrating and context-modulating subsystems, while inter-perspective agreement of durable records is handled by Theorem M.4a in Appendix M.

<a id="931-definition-30-def-30-operational-cc"></a>**9.3.1 Definition 30 (Def 30): Operational CC**

The operational **Consciousness Complexity** (CC) of an MPU aggregate system $S$ is defined through a complex-linear probability modification map $L_S$ acting on the finite-dimensional operator space generated by the retained event algebra. The map is Hermitian-preserving and trace-annihilating:
$$
L_S(X)^\dagger=L_S(X)\quad\text{whenever }X^\dagger=X,\qquad
\mathrm{tr}(L_S(X))=0\quad\text{for all }X.
$$
For a density operator $\rho$, the induced first-order probability shift for an effect $0\le E\le I$ is
$$
\Delta P(E|\rho,S)=\mathrm{tr}\!\big(L_S(\rho)E\big).
$$
The CC value is the operational norm of this map:
$$
\mathrm{CC}(S):=\|L_S\|_{\mathrm{op}} \quad \text{(54)}
$$
where
$$
\|L_S\|_{\mathrm{op}}:=\sup_{\substack{\rho\ge0,\ \mathrm{tr}\,\rho=1\\ 0\le E\le I}}\big|\mathrm{tr}\!\big(L_S(\rho)E\big)\big|.
$$
Trace-annihilation implies normalization preservation: for any POVM $\{E_i\}$ with $\sum_iE_i=I$,
$$
\sum_i \Delta P(i)=\sum_i \mathrm{tr}\!\big(L_S(\rho)E_i\big)=\mathrm{tr}\!\big(L_S(\rho)\big)=0.
$$
In particular, the pointwise bound
$$
|\Delta P(i)|=\big|\mathrm{tr}\!\big(L_S(\rho)E_i\big)\big|\le \mathrm{CC}(S)
$$
holds for all POVMs.

<a id="lemma-91-variational-characterization"></a>**Lemma 9.1 (Variational characterization).** For Hermitian $H$ with $\mathrm{tr}\,H=0$,
$$
\sup_{0\le E\le I}\big|\mathrm{tr}(HE)\big|=\tfrac12\|H\|_1,
$$
with the supremum attained by the projector onto the positive or negative eigenspace of $H$.

*Proof.* Write the Jordan decomposition $H=H_+-H_-$, where $H_\pm\succeq0$ and $H_+H_-=0$. Since $\mathrm{tr}\,H=0$,
$$
\mathrm{tr}(H_+)=\mathrm{tr}(H_-)=\tfrac12\|H\|_1.
$$
For every effect $0\le E\le I$,
$$
0\le\mathrm{tr}(H_+E)
=\mathrm{tr}(H_+^{1/2}EH_+^{1/2})
\le\mathrm{tr}(H_+),
$$
and similarly $0\le\mathrm{tr}(H_-E)\le\mathrm{tr}(H_-)$. Therefore
$$
-\tfrac12\|H\|_1
\le\mathrm{tr}(HE)
\le\tfrac12\|H\|_1.
$$
Taking $E$ to be the support projector of $H_+$ gives the upper endpoint, while the support projector of $H_-$ gives the lower endpoint. Hence the supremum of the absolute value is $\tfrac12\|H\|_1$. ∎

<a id="corollary-91"></a>**Corollary 9.1.** For Hermitian-preserving, trace-annihilating $L_S$,
$$
\|L_S\|_{\mathrm{op}}=\tfrac12\sup_{\rho}\big\|L_S(\rho)\big\|_1,
$$
where the supremum ranges over density operators $\rho$.

*Proof.* For every density operator $\rho$, Hermitian preservation makes $L_S(\rho)$ Hermitian and trace annihilation gives $\operatorname{tr}L_S(\rho)=0$. Lemma 9.1 therefore gives
$$
\sup_{0\le E\le I}\left|\operatorname{tr}\!\bigl(L_S(\rho)E\bigr)\right|
=\frac12\|L_S(\rho)\|_1.
$$
Taking the supremum over density operators and using Definition 30 proves the identity. ∎

<a id="932-definition-31-def-31-physical-constraints-on-cc-scaling"></a>**9.3.2 Definition 31 (Def 31): Physical Constraints on CC Scaling**

As an additional response-model assumption, extend the attainable complexity values to a real variable $C_{\mathrm{agg}}$ and choose a nonnegative response function through their assigned CC values, twice differentiable for $C_{\mathrm{agg}}>C_{op}$. Express $C_{\mathrm{agg}}$, $C_{op}$, and $C_{\mathrm{scale}}$ in the same registered complexity units. The derivative constraints below concern this extension; they do not give derivatives to the discrete prefix-length invariant $C_P$ itself. The response model is required to satisfy:
1.  **Threshold Behavior:** $\mathrm{CC}(S)$ emerges only in sufficiently complex systems. Since CC derives from exploiting context-dependence (Theorem 34), requiring $C_{\mathrm{agg}} > C_{op}$ for non-trivial internal states, we expect $\mathrm{CC}(C_{\mathrm{agg}})=0$ for $C_{\mathrm{agg}} \le C_{op}$.
2.  **Declared Bounded-Bias Branch:** This CC model restricts its admissible family by $\alpha_{CC,max}<1/2$. Theorem 39 proves that this premise is sufficient to exclude endpoint-complete binary forcing and that endpoint-complete forcing would require $\alpha_{CC,max}\ge1/2$; it does not prove the converse implication from mere absence of endpoint forcing. Theorem 39a gives only a finite-window zero-error bound, while exact causal compliance is marginal invariance under Theorem 39c. Thus $\mathrm{CC}(C_{\mathrm{agg}})\le\alpha_{CC,max}<1/2$ here by the declared bounded-bias branch contract.
3.  **Monotonicity:** Plausibly, capability increases with resources available for complex state modulation, so we assume $d\text{CC}/dC_{\mathrm{agg}} \ge 0$ for $C_{\mathrm{agg}} > C_{op}$.
4. **Diminishing Returns:** Achieving further increases likely becomes harder. We assume diminishing returns, **$d^2\text{CC}/dC_{\mathrm{agg}}^2 \le 0$** for $C_{\mathrm{agg}} > C_{op}$.

<a id="933-theorem-35-general-cc-scaling-form"></a>**9.3.3 Theorem 35 (General CC Scaling Form)**

Any function $\mathrm{CC}(C_{\mathrm{agg}})$ satisfying Definition 31 and right-continuous at $C_{op}$ can be written as
$$
\mathrm{CC}(C_{\mathrm{agg}})=
\begin{cases}
0,&C_{\mathrm{agg}}\le C_{op},\\
\alpha_\infty\,\mathcal G\!\left((C_{\mathrm{agg}}-C_{op})/C_{\mathrm{scale}}\right),&C_{\mathrm{agg}}>C_{op}.
\end{cases}
\tag{55}
$$
Here $0\le\alpha_\infty\le\alpha_{CC,max}<1/2$ is the asymptotic CC value, $C_{\mathrm{scale}}>0$ is a characteristic complexity scale in the same units as $C_{\mathrm{agg}}$, and $C_{op}$ is the operational threshold of Definition 13. The dimensionless function $\mathcal G:[0,\infty)\to[0,1]$ is right-continuous at $0$ and satisfies
$$
\mathcal G(0)=0,\qquad
\lim_{x\to\infty}\mathcal G(x)=1,\qquad
\mathcal G'(x)\ge0,\quad
\mathcal G''(x)\le0\quad(x>0).
$$
If the asymptotic value is not attained at finite positive $x$, then $\mathcal G(x)<1$ for every finite $x$.

*Proof.* The first branch of (55) is Definition 31's threshold condition. For the second branch, let
$$
\alpha_\infty:=\lim_{C_{\mathrm{agg}}\to\infty}\mathrm{CC}(C_{\mathrm{agg}}),
$$
which exists by nonnegativity, monotonicity and boundedness. If $\alpha_\infty=0$, the response is identically zero; choose $\mathcal G(x)=x/(1+x)$. If $\alpha_\infty>0$, set
$$
\mathcal G(x):=\frac{\mathrm{CC}(C_{op}+C_{\mathrm{scale}}x)}{\alpha_\infty}
\qquad(x\ge0).
$$
The threshold condition and right continuity give $\mathcal G(0)=0$ and right continuity at $0$. The range, asymptotic limit, and derivative signs for $x>0$ follow by positive rescaling. If a nondecreasing function reaches its asymptotic upper bound, it remains at that bound; otherwise it stays strictly below it at every finite argument. Substitution proves (55). ∎

<a id="934-definition-32-def-32-specific-cc-scaling-model-example"></a>**9.3.4 Definition 32 (Def 32): Specific CC Scaling Model Example**

A simple concave, monotone shape on $[0,\infty)$ is $\mathcal G(x)=x/(1+x)$. Its threshold response is
$$
\mathrm{CC}(C_{\mathrm{agg}})=
\begin{cases}
0,&C_{\mathrm{agg}}\le C_{op},\\
\displaystyle\alpha_\infty\frac{C_{\mathrm{agg}}-C_{op}}{C_{\mathrm{scale}}+C_{\mathrm{agg}}-C_{op}},&C_{\mathrm{agg}}>C_{op},
\end{cases}
\tag{56}
$$
with $0\le\alpha_\infty\le\alpha_{CC,max}<1/2$, operational threshold $C_{op}$, and $C_{\mathrm{scale}}>0$.

**9.3.4a Definition 32a (Backbone Representative for CC Scaling).** On any bounded-bias branch whose endpoint ceiling satisfies $3/8\le\alpha_{CC,max}<1/2$, the backbone representative is the admissible model representative of Theorem 35 with
$$
\alpha_\infty=\frac{3}{8},
\qquad
C_{\mathrm{scale}}=K_0\varepsilon_0=3\ln2,
\qquad
\mathcal G_{\mathrm{bin}}(y)=1-2^{-y},
\tag{56a}
$$
where
$$
y=\frac{C_{\mathrm{agg}}-C_{op}}{K_0\varepsilon_0}.
$$
It is an admissible model representative of the monotone-concave family, not a uniqueness theorem for all admissible CC functions.

**9.3.4b Proposition 35a (Admissibility of the Backbone Representative).** On branches satisfying $3/8\le\alpha_{CC,max}<1/2$, the representative of Definition 32a satisfies Definition 31 and the general form of Theorem 35. Its closed form is
$$
\text{CC}(C_{\mathrm{agg}})
=
\frac{3}{8}
\left(
1-2^{-(C_{\mathrm{agg}}-C_{op})/(3\ln2)}
\right)
\Theta(C_{\mathrm{agg}}-C_{op}).
\tag{56b}
$$

*Proof.* The branch condition gives $3/8\le\alpha_{CC,max}<1/2$, so the upper-bound condition in Definition 31 is satisfied. For $y\ge0$,
$$
\mathcal G_{\mathrm{bin}}(0)=0,
\qquad
\lim_{y\to\infty}\mathcal G_{\mathrm{bin}}(y)=1,
$$
while
$$
\mathcal G_{\mathrm{bin}}'(y)=(\ln2)2^{-y}>0,
\qquad
\mathcal G_{\mathrm{bin}}''(y)=-(\ln2)^2 2^{-y}<0.
$$
Thus the representative is monotone and concave with diminishing returns. Substitution into Theorem 35 gives (56b). ∎

**9.3.4c Corollary 35a.1 (Backbone Representative Saturation Points).** For the representative (56b), half saturation occurs at
$$
C_{\mathrm{agg}}-C_{op}=K_0\varepsilon_0=3\ln2,
$$
and $99\%$ saturation occurs at
$$
C_{\mathrm{agg}}-C_{op}=K_0\varepsilon_0\log_2(100)\approx13.8
$$
in the same registered complexity-coordinate units as $C_{\mathrm{scale}}$. Interpreting these values as nats requires a separate calibration of that coordinate.

*Proof.* Half saturation means $1-2^{-y}=1/2$, hence $y=1$. The $99\%$ point means $1-2^{-y}=0.99$, hence $y=\log_2(100)$. Substituting $y=(C_{\mathrm{agg}}-C_{op})/(K_0\varepsilon_0)$ gives the two displayed values. ∎

**9.3.4d Remark 35a.2 (Status of the Backbone Representative).** Definition 31 and Theorem 35 permit many monotone-concave scaling functions. Definition 32 remains a rational example, while Definition 32a supplies a binary-saturating benchmark representative. The condition $3/8\le\alpha_{CC,max}<1/2$ is an additional restriction on the declared bounded-bias branch of Definition 31, item 2, and the representative applies only to branches on which this restriction is independently registered. The asymptotic value $3/8$ is the same ratio as the sub-threshold Van Vleck effective dimension $D_{\mathrm{eff}}=t/d_{\min}=3/8$ of Theorem T.42.5 on the Golay assignment branch; the scale $K_0\varepsilon_0=3\ln2$ equals $\ln d_0$ on the $d_0=8$ carrier. Theorem E.6 and Equation (E.9) separately use the actual channel capacity $C(\mathcal E_N)$ in the thermodynamic boundary and coupling relations. These are cross-sector resonance choices. The value $3/8$ and scale $3\ln2$ remain model choices until a response certificate derives them from the declared structure without using the matched values to select the response law.

**Interface-Fraction Response Hypothesis.** The interface count of Section Z.7 gives $\varphi(a,d)=2a(d-a)/d^2$. Register a physical response map that identifies the asymptotic coefficient with $\varphi(a,8)$ and specifies the admissible active-rank set $\mathcal A$. The endpoint ceiling is then
$$
\alpha_{CC,\max}=\max_{a\in\mathcal A}\varphi(a,8).
$$
For $\mathcal A=\{2\}$ it is $3/8$; for a class admitting rank four it reaches $1/2$. A strict sub-half ceiling is therefore a statement about the complete admissible rank class. The separate horizontal normalization $C_{\mathrm{scale}}=\ln8$ and binary shape of Definition 32a give Proposition 35a's response curve. Hypothesis 3 and the registered CC protocol test this physical response map, its rank-class premise and its scaling behavior.

**Definition 35b (Certified CC Response Shape and Tilt Budget).** A certificate fixes $C_0>0$, $\Delta C_{\mathrm{self}}\ge0$, $\alpha_{CC,max}\ge0$, a residual interval $I_{\mathrm{shape}}$, $C_{\max}^*>0$, and nonnegative $\epsilon_{\mathrm{base}},\epsilon_{\mathrm{tilt}}$. It records
$$
P(X>x)=e^{-x/C_0}\quad(x\ge0),
\tag{56c}
$$
$$
\Delta\alpha_{CC}
\in\alpha_{CC,max}
P(0\le X\le\Delta C_{\mathrm{self}})+I_{\mathrm{shape}},
\tag{56d}
$$
and $C_{\max}^*\operatorname{TV}(p,q)\le\epsilon_{\mathrm{base}}+\epsilon_{\mathrm{tilt}}$.

**Proposition 35c (Conditional Exponential Response).** The response interval is
$$
\Delta\alpha_{CC}
\in\alpha_{CC,max}
\left(1-e^{-\Delta C_{\mathrm{self}}/C_0}\right)+I_{\mathrm{shape}}.
\tag{56e}
$$

*Proof.* Definition 35b gives $\Delta C_{\mathrm{self}}\ge0$ and
$$
P(X>x)=e^{-x/C_0}
\qquad(x\ge0).
$$
In particular, $P(X>0)=1$, so $P(X<0)=P(X=0)=0$. Therefore
$$
\begin{aligned}
P(0\le X\le\Delta C_{\mathrm{self}})
&=1-P(X>\Delta C_{\mathrm{self}})\\
&=1-e^{-\Delta C_{\mathrm{self}}/C_0}.
\end{aligned}
$$
Substitution in Equation (56d) gives Equation (56e). ∎

**Proposition 35d (Residual-Aware Endpoint Ceiling).** One has
$$
\operatorname{TV}(p,q)
\le\frac{\epsilon_{\mathrm{base}}+\epsilon_{\mathrm{tilt}}}{C_{\max}^*}.
\tag{56f}
$$
The right-hand side equals $1/2$ exactly when $\epsilon_{\mathrm{base}}+\epsilon_{\mathrm{tilt}}=C_{\max}^*/2$. The specialization $(\epsilon_{\mathrm{base}},\epsilon_{\mathrm{tilt}},C_{\max}^*)=(\ln2,0,2\ln2)$ is one such choice. A bound of $1/2$ does not establish the strict condition $\operatorname{TV}(p,q)<1/2$.

*Proof.* Definition 35b gives
$$
C_{\max}^*\operatorname{TV}(p,q)
\le\epsilon_{\mathrm{base}}+\epsilon_{\mathrm{tilt}}
$$
and $C_{\max}^*>0$. Division by $C_{\max}^*$ proves Equation (56f). For
$$
(\epsilon_{\mathrm{base}},\epsilon_{\mathrm{tilt}},C_{\max}^*)
=(\ln2,0,2\ln2),
$$
the right-hand side is
$$
\frac{\ln2}{2\ln2}=\frac12.
$$
Thus this specialization permits $\operatorname{TV}(p,q)\le1/2$ and cannot establish the strict condition $\operatorname{TV}(p,q)<1/2$. ∎

**9.4 Proposed Mechanism of CC Influence**

Having defined Consciousness Complexity operationally in Definition 30 and proved Theorem 34's strict-improvement implication under its stated non-null-map and selector hypotheses, we now nominate a physical mechanism for CC influence on MPU interactions.

<a id="941-hypothesis-3-hyp-3-cc-influence-mechanism"></a>**9.4.1 Hypothesis 3 (Hyp 3): CC Influence Mechanism**

Hypothesis 3 proposes that the operational Consciousness Complexity $\mathrm{CC}(S)$ of an MPU aggregate $S$ modulates parameters of a registered stochastic `Evolve`/ND-RID instrument branch for constituent MPUs. The target outcome law, stochasticity, carrier, instrument, and single-outcome rule are independent entries of that branch. Subject to those entries, the proposed influence uses the context dependence of Assumption 1 without replacing the registered update law. The pathway is:

1.  **Internal State as Context ($\mathrm{context}_S$):** The aggregate's internal state providing context is formally the **context state $\mathrm{context}_S(t)$** (the selected finite operationally sufficient expectation vector of Definition L.1 in Appendix L, with minimal sufficiency requiring that definition's separate deletion and addition tests). Operationally, it represents the coarse-grained, predictively sufficient slice of the aggregate state $\rho_{\mathrm{agg}}(t)$ relevant to influencing local ND-RID within available resources.
2.  **Physical Manifestation of Context:** $\mathrm{context}_S(t)$ manifests physically through properties like the reduced density operator, entanglement structure, patterns in the coarse-grained MPU Stress-Energy Tensor ($T_{\mu\nu}^{(MPU)}$, Appendix B), or emergent curvature patterns.
3.  **Modulation Pathway:** These collective physical patterns ($\mathrm{context}_S$) are hypothesized to act as structured boundary conditions or effective fields influencing the local parameters ($V_{\mathrm{prob}}, T_{\mathrm{prob}}$, or effective Lindblad parameters $\gamma_k$ as in Appendix L Equations (L.88) and (L.90)) of the underlying 'Evolve'/ND-RID process. A candidate controlled AC-Stark pathway uses context-conditioned classical fields to shift MPU level splittings and thereby alter effective jump rates. This candidate requires a specified control Hamiltonian, source geometry, target polarizability and detuning, coherence window, noise model, and likelihood map from the induced dynamics to the retained outcome probabilities. The mapping $\mathcal M:\mathcal C_{ctx}\to\mathcal P_{\mathrm{control}}$ must belong to the admissible class of Theorem L.1 and satisfy its declared continuity, compactness, stability, and cost-benefit hypotheses. Appendix L supplies this conditional optimization framework; it does not determine a universal electromagnetic-to-gravitational channel ratio. Appendix S supplies a self-limitation model only on its registered power-law, retained-energy, weak-field, and calibrated-response branches. On branches satisfying both the strict-improvement antecedent of Theorem 34 and the relevant implementation certificates, the selected non-null map can represent controlled bias of the retained 'Evolve' outcomes.
4.  **Candidate Locus of Observable Effect:** On a branch carrying a response-active aggregate-to-control map and a normalized target instrument, the nominated mechanism may change a registered outcome law subject to $|\Delta P|\le\mathrm{CC}(S)$. Theorem 34 gives $\mathrm{CC}(S)>0$ on its strict-improvement, representability, attainment, and stability branch, and the registered CC protocol tests the existence, sign, and size of the effect.
5.  **Operational Nature:** CC measures this biasing capability. The link between specific content of $\mathrm{context}_S$ (e.g., intent, attention, report-induced expectation, or other retained predictive state) and bias direction is learned or selected via adaptation (driven by POP/PCE); the Minimal Awareness interpretive convention of Section 7.1.2 supplies its experiential reading, and the mechanism of influence on the 'Evolve' parameters is proposed as objective physics. A semantic item such as a belief, report, or expectation enters the mechanism only through its physical instantiation inside $\mathrm{context}_S$; the truth value of the represented proposition is not itself a probability-control parameter unless it is physically available to the aggregate or apparatus.
6.  **Implications for Locality:** Since $\mathrm{context}_S$ can involve non-local entanglement, and the CC mechanism acts by influencing local 'Evolve' events, a context change in one part of an entangled aggregate might have statistical consequences (via entanglement and the modified 'Evolve' probabilities) on 'Evolve' outcomes in space-like separated parts. This underpins the three-branch statistical-influence structure of Postulate 3; any late-randomized branch-(iii) Bob-marginal shift lies outside the exact causal branch by Corollary 39c.1, so observing one would select branch (iii) over that branch and a null result keeps it; its external regular finite-window model is analyzed on the independently declared bounded-bias branch, with Theorem 39 supplying only the endpoint-complete consequence, Theorem 39a supplying the finite-window zero-error constraint on the regular statistical branch, and Theorem 39b supplying the predictive-current no-loop/precision-cost gate whenever a current representation is asserted.
7.  **Physical Realization:** Theorem L.1c populates the context quotient, its source-retaining encoder and the controlled generator on Theorem L.12.8b's engineered source class, using the partial-swap carrier of Theorem 9.7i. Its complete finite control table and serial-time comparison realize the selected observable family. Theorem L.4.6c constructs the phase-seeded carrier with a populated phase/noise record, separate target-only and noise-assisted readouts, and an exact pulse/resource ledger. Dynamical mapping optimization uses the separate admissibility, feedback and resource hypotheses of Lemma L.1 and Theorem L.1; each field-carrier implementation carries its own interaction and source record.

**9.5 Modeling Modified Quantum Probabilities**

To make the CC hypothesis testable, we model how baseline Born rule probabilities are modified.

<a id="951-definition-33-def-33-general-form-of-modified-probability"></a>**9.5.1 Definition 33 (Def 33): General Form of Modified Probability**

The observable probability distribution $q=\{q_i\}$ for an outcome $i$ of a POVM $\{E_i\}$ on a system in state $\rho$, in the presence of a context-providing MPU aggregate $S$, is a modification of the baseline Born distribution $p=\{p_i\}$, where $p_i=P_{\mathrm{Born}}(i)=\mathrm{tr}(\rho E_i)$. The primary operational budget is Definition 30:
$$
\mathrm{TV}(p,q)
=
\sup_A|q(A)-p(A)|
\le
\mathrm{CC}(S),
$$
where the supremum is over all coarse-grained events $A$ in the retained event algebra. The Principle of Compression Efficiency (PCE) selects minimal-cost representatives inside this operational ball. The canonical geodesic length on the statistical manifold is the Fisher-Rao distance
$$
d_{\mathrm{FR}}(p,q)
=
2\arccos\left(\sum_k\sqrt{p_kq_k}\right).
$$
Since
$$
1-\sum_k\sqrt{p_kq_k}
=
H^2(p,q)
\le
\mathrm{TV}(p,q)
\le
\min\{\mathrm{CC}(S),1\},
$$
the operational CC budget implies the Fisher-Rao envelope
$$
d_{\mathrm{FR}}(p,q)
\le
D_{\mathrm{CC}}(S)
:=
2\arccos\bigl(1-\min\{\mathrm{CC}(S),1\}\bigr).
\tag{57}
$$
On branches where $0\le\mathrm{CC}(S)\le1$, this reduces to $D_{\mathrm{CC}}(S)=2\arccos(1-\mathrm{CC}(S))$. A stricter Fisher-budget subbranch may impose $d_{\mathrm{FR}}(p,q)\le\mathrm{CC}(S)$; Theorem 36 records the sharper trigonometric bounds available on that subbranch. The operational probability-shift bound itself does not require the stricter Fisher-budget condition.

**Typed adjoint and covariance:** Let $\mathcal X_{\mathrm{ret}}\subseteq\mathcal B(\mathcal H)$ be the finite-dimensional complex operator span generated by the retained event algebra, assume it is closed under adjoint and contains the tested states and effects, and require $L_S:\mathcal X_{\mathrm{ret}}\to\mathcal X_{\mathrm{ret}}$ to be complex-linear and Hermiticity-preserving. Use the restricted Hilbert–Schmidt inner product $\langle X,E\rangle_{\mathrm{HS}}=\operatorname{tr}(X^\dagger E)$ and define
$$
K_S:=L_S^*,
\qquad
\operatorname{tr}\!\bigl(L_S(X)^\dagger E\bigr)
=
\operatorname{tr}\!\bigl(X^\dagger K_S(E)\bigr).
$$
For Hermitian inputs this reduces to the usual Schrödinger–Heisenberg trace duality. If $\operatorname{Ad}_U(\mathcal X_{\mathrm{ret}})=\mathcal X_{\mathrm{ret}}$ and the family $L_S$ is unitary-covariant on that retained space, taking Hilbert–Schmidt adjoints gives, for retained $\rho$ and $E$,
$$
L_{USU^\dagger}(U\rho U^\dagger)=U\,L_S(\rho)\,U^\dagger,\qquad
K_{USU^\dagger}(U E U^\dagger)=U\,K_S(E)\,U^\dagger.
$$
Thus covariance of $K_S$ is a consequence of the declared covariance of $L_S$.

**Bipartite consistency** on $\mathcal{H}_A\otimes\mathcal{H}_B$:
$$
\sum_j K_{S_A\otimes S_B}(E_A\otimes F_{B,j})=K_{S_A\otimes S_B}(E_A\otimes I_B),\qquad
K_{S_A\otimes S_B}(E_A\otimes I_B)=K_{S_A}(E_A)\otimes I_B,
$$
ensuring each party’s marginal is invariant under the other party’s POVM choice.

**Small-deformation realizations:** for small $\xi$,
$$
\mathrm{tr}\!\big(e^{\xi L_S}(\rho)\,E_i\big)=\mathrm{tr}\!\big(\rho\,(E_i+\xi K_S(E_i))\big)+O(\xi^2).
$$
Two operational implementations are possible:

1.  **CPTP pre-processing** $\rho\mapsto e^{\xi L_S}(\rho)$ when $L_S$ is a GKLS generator and $\xi\ge0$.
2.  **Calibrated POVM deformations** $E_{i,\xi}=E_i+\xi K_S(E_i)$ on a stated interval of $\xi$ for which $E_{i,\xi}\succeq0$ for every $i$. The completeness-preserving condition $\sum_iK_S(E_i)=0$ then gives
    $$
    \sum_iE_{i,\xi}=\sum_iE_i+\xi\sum_iK_S(E_i)=I
    $$
    exactly throughout that interval. Positivity on $\ker(E_i)$ is a necessary first-order test but is not by itself a sufficient positivity certificate when kernel-to-support cross terms are present.

<a id="theorem-heisenberg-schrödinger-identity-for-cptp-semigroups"></a>**Theorem (Heisenberg–Schrödinger identity for CPTP semigroups).** Let $\Lambda_\xi=e^{\xi\mathcal L}$, $\xi\ge0$, be a norm-continuous CPTP semigroup on the trace-class operators $\mathcal T_1(\mathcal H)$, with bounded generator $\mathcal L$. Its Banach adjoint $\Lambda_\xi^*$ acts normally on $\mathcal B(\mathcal H)$. Let $\{E_i\}_i$ be a finite or countable POVM, with countable sums taken ultraweakly. Define the Heisenberg-picture effects
$$
E_{i,\xi}:=\Lambda_\xi^{*}(E_i).
$$
Then $\{E_{i,\xi}\}_i$ is a POVM for every $\xi\ge 0$ and, for any state $\rho$,
$$
\operatorname{tr}\big[\Lambda_\xi(\rho)\,E_i\big]=\operatorname{tr}\big[\rho\,E_{i,\xi}\big].
$$
*Proof.* Since $\Lambda_\xi$ is CPTP, its dual $\Lambda_\xi^*$ is completely positive and unital, hence $E_{i,\xi}\ge 0$ and $\sum_i E_{i,\xi}=I$. The probability identity is duality. ∎

*Corollary (all‑orders normalization & positivity; linearized form).* Writing $K(E_i):=\tfrac{d}{d\xi}\big|_{\xi=0}\Lambda_\xi^*(E_i)$ gives $\sum_i K(E_i)=\mathcal L^*(I)=0$.

**CTB generator semigroup.** For the linear generator
$$
L_S(X)=\nu_S\big(\mathrm{tr}(X)\sigma-X\big),
\qquad
\sigma\ge0,\quad \mathrm{tr}\,\sigma=1,\quad \nu_S>0,
$$
the semigroup $T_t=e^{tL_S}$ is CPTP and has the explicit form
$$
T_t(X)=e^{-\nu_S t}X+(1-e^{-\nu_S t})\mathrm{tr}(X)\sigma.
$$
For density operators $\rho$ this reduces to
$$
T_t(\rho)=e^{-\nu_S t}\rho+(1-e^{-\nu_S t})\sigma.
$$

*Proof.* Let $P_\sigma(X):=\mathrm{tr}(X)\sigma$. Then
$$
P_\sigma^2(X)
=
P_\sigma(\mathrm{tr}(X)\sigma)
=
\mathrm{tr}(\mathrm{tr}(X)\sigma)\sigma
=
\mathrm{tr}(X)\,\mathrm{tr}(\sigma)\,\sigma
=
\mathrm{tr}(X)\sigma
=
P_\sigma(X),
$$
so $P_\sigma^2=P_\sigma$, and
$$
L_S=\nu_S(P_\sigma-I).
$$
Since $P_\sigma$ and $I$ commute,
$$
e^{tL_S}
=
e^{-\nu_S t}I+(1-e^{-\nu_S t})P_\sigma.
$$
The identity map is CPTP, and $P_\sigma$ is CPTP because it is the trace-and-prepare channel $X\mapsto\mathrm{tr}(X)\sigma$. A convex combination of CPTP maps is CPTP. The semigroup identity follows from the exponential form:
$$
T_tT_s=e^{(t+s)L_S}=T_{t+s}.
$$
∎

<a id="952-theorem-36-pu-predictive-perturbation-bounds"></a>**9.5.2 Theorem 36 (PU Predictive-Perturbation Bounds)**

Let $p$ be the Born distribution for a fixed measurement and $q$ the context-conditioned distribution. Let
$$
\Delta P(i)=q_i-p_i,
\qquad
\mathrm{TV}(p,q)=\frac12\sum_i|q_i-p_i|.
$$

1. **Operational CC bounds.** From Definition 30, every retained measurement satisfies
$$
\mathrm{TV}(p,q)\le\mathrm{CC}(S),
\qquad
|\Delta P(i)|\le\mathrm{CC}(S)
\quad
\forall i.
$$
Consequently, the Fisher-Rao distance is bounded by the derived operational envelope
$$
d_{\mathrm{FR}}(p,q)
\le
2\arccos\bigl(1-\min\{\mathrm{CC}(S),1\}\bigr).
$$

2. **Sharper Fisher-budget subbranch.** If, in addition, the PCE-minimal modification lies on the stricter Fisher-budget subbranch
$$
d_{\mathrm{FR}}(p,q)\le \mathrm{CC}(S),
\qquad
0\le\mathrm{CC}(S)\le\pi,
$$
then
$$
\mathrm{TV}(p,q)\le\sin(\mathrm{CC}(S)/2),
\qquad
|\Delta P(i)|\le4\sin(\mathrm{CC}(S)/4)
\quad
\forall i.
$$

3. **Small-bias regime on the Fisher-budget subbranch.** If $\mathrm{CC}(S)\ll1$ and the stricter Fisher-budget condition holds, then
$$
\mathrm{TV}(p,q)\le\frac12\mathrm{CC}(S),
\qquad
|\Delta P(i)|\le\mathrm{CC}(S).
$$

*Proof.* The operational CC bounds follow directly from Definition 30. For any coarse-grained event $A$ in the retained event algebra,
$$
|q(A)-p(A)|\le\mathrm{CC}(S).
$$
Taking the supremum over $A$ gives $\mathrm{TV}(p,q)\le\mathrm{CC}(S)$, and each singleton event gives $|\Delta P(i)|\le\mathrm{CC}(S)$. Moreover, with
$$
c:=\sum_k\sqrt{p_kq_k},
\qquad
H^2(p,q):=1-c,
$$
one has $\sqrt{p_kq_k}\ge\min\{p_k,q_k\}$ for every $k$. Therefore
$$
c
\ge\sum_k\min\{p_k,q_k\}
=\frac12\sum_k\bigl(p_k+q_k-|p_k-q_k|\bigr)
=1-\mathrm{TV}(p,q),
$$
so $H^2(p,q)\le\mathrm{TV}(p,q)$. Since every total variation distance is at most one,
$$
c\ge1-\min\{\mathrm{CC}(S),1\}.
$$
The function $\arccos$ is decreasing on $[0,1]$, and hence
$$
d_{\mathrm{FR}}(p,q)=2\arccos(c)
\le
2\arccos\bigl(1-\min\{\mathrm{CC}(S),1\}\bigr).
$$

For the sharper Fisher-budget subbranch, let
$$
c:=\sum_k \sqrt{p_k q_k}.
$$
By the Fisher-Rao geometry on the probability simplex,
$$
c=\cos\big(d_{\mathrm{FR}}(p,q)/2\big),
$$
so with the convention
$$
H(p,q):=\sqrt{1-c}
$$
one has
$$
H^2(p,q)=1-c=2\sin^2\big(d_{\mathrm{FR}}(p,q)/4\big).
$$
Because $d_{\mathrm{FR}}(p,q)\le \mathrm{CC}(S)\le \pi$ and $\sin x$ is increasing on $[0,\pi/4]$,
$$
H^2(p,q)\le 2\sin^2\big(\mathrm{CC}(S)/4\big).
\tag{57a}
$$

For total variation, write
$$
|p_i-q_i|=|\sqrt{p_i}-\sqrt{q_i}|\,|\sqrt{p_i}+\sqrt{q_i}|.
$$
Applying Cauchy-Schwarz gives
$$
\sum_i |p_i-q_i|
\le
\Big(\sum_i (\sqrt{p_i}-\sqrt{q_i})^2\Big)^{1/2}
\Big(\sum_i (\sqrt{p_i}+\sqrt{q_i})^2\Big)^{1/2}.
$$
Now
$$
\sum_i (\sqrt{p_i}-\sqrt{q_i})^2 = 2-2c = 2H^2,
$$
and
$$
\sum_i (\sqrt{p_i}+\sqrt{q_i})^2 = 2+2c = 4-2H^2.
$$
Therefore
$$
\mathrm{TV}(p,q)
\le
\frac12\sqrt{(2H^2)(4-2H^2)}
=
\sqrt{2H^2-H^4}.
$$
Set $s:=\sin(\mathrm{CC}(S)/4)$. Since $\mathrm{CC}(S)\le \pi$, one has $0\le 2s^2\le 1$, and the function $f(x)=2x-x^2$ is increasing on $[0,1]$. Using (57a),
$$
\mathrm{TV}(p,q)
\le
\sqrt{f(H^2)}
\le
\sqrt{f(2s^2)}
=
\sqrt{4s^2-4s^4}
=
2s\sqrt{1-s^2}
=
\sin(\mathrm{CC}(S)/2).
$$
This proves the first non-perturbative bound.

For each coordinate $i$,
$$
|\Delta P(i)|=|q_i-p_i|=|\sqrt{q_i}-\sqrt{p_i}|\,|\sqrt{q_i}+\sqrt{p_i}|
\le 2|\sqrt{q_i}-\sqrt{p_i}|.
$$
Hence
$$
|\Delta P(i)|
\le
2\Big(\sum_j (\sqrt{q_j}-\sqrt{p_j})^2\Big)^{1/2}
=
2\sqrt{2}\,H(p,q).
$$
Using (57a) again,
$$
|\Delta P(i)|
\le
2\sqrt{2}\,\sqrt{2}\,\sin(\mathrm{CC}(S)/4)
=
4\sin(\mathrm{CC}(S)/4).
$$
This proves the second non-perturbative bound.

Finally, the elementary inequality $\sin x\le x$ for $x\ge0$ gives
$$
\mathrm{TV}(p,q)\le \sin(\mathrm{CC}(S)/2)\le \tfrac12\,\mathrm{CC}(S),
$$
and
$$
|\Delta P(i)|\le 4\sin(\mathrm{CC}(S)/4)\le \mathrm{CC}(S).
$$
These bounds are exact consequences of the non-perturbative estimates and, in the regime $\mathrm{CC}(S)\ll1$, coincide with their leading-order small-bias behavior. ∎

**Lemma 9.1a (Norm of the CTB Replacement Direction).**
Let $\sigma$ be a density operator on a finite-dimensional Hilbert space and define the linear replacement-direction map
$$
R_\sigma(X):=\mathrm{tr}(X)\sigma-X.
$$
For density operators $\rho$ and effects $0\le E\le I$,
$$
\sup_{\rho,E}\left|\mathrm{tr}\!\big(R_\sigma(\rho)E\big)\right|
=
1-\lambda_{\min}(\sigma).
\tag{58a}
$$
Equivalently,
$$
\sup_\rho \frac12\|\sigma-\rho\|_1
=
1-\lambda_{\min}(\sigma).
\tag{58b}
$$

*Proof.* For any density operator $\rho$, $R_\sigma(\rho)=\sigma-\rho$ is Hermitian and traceless. By Lemma 9.1,
$$
\sup_{0\le E\le I}\left|\mathrm{tr}\!\big((\sigma-\rho)E\big)\right|
=
\frac12\|\sigma-\rho\|_1.
$$
It remains to maximize over $\rho$. For any effect $E$,
$$
\sup_\rho \mathrm{tr}\!\big((\rho-\sigma)E\big)
=
\lambda_{\max}(E)-\mathrm{tr}(\sigma E).
$$
Let $m:=\lambda_{\max}(E)$. Since $0\le E\le mI$ and $\mathrm{tr}(E)\ge m$, one has
$$
\mathrm{tr}(\sigma E)\ge \lambda_{\min}(\sigma)\mathrm{tr}(E)\ge \lambda_{\min}(\sigma)m.
$$
Therefore
$$
\lambda_{\max}(E)-\mathrm{tr}(\sigma E)
\le
m(1-\lambda_{\min}(\sigma))
\le
1-\lambda_{\min}(\sigma).
$$
Because $\operatorname{tr}(\sigma-\rho)=0$,
$$
\operatorname{tr}\!\bigl((\sigma-\rho)E\bigr)
=\operatorname{tr}\!\bigl((\rho-\sigma)(I-E)\bigr).
$$
The operator $I-E$ is an effect, so the preceding upper bound applied to $I-E$ gives the same bound for the opposite sign. The bound is attained by taking $E$ to be the projector onto an eigenvector of $\sigma$ with eigenvalue $\lambda_{\min}(\sigma)$ and $\rho=E$. Hence the supremum is exactly $1-\lambda_{\min}(\sigma)$. ∎

<a id="953-definition-34-def-34-context-targeted-bias-ctb-model"></a>**9.5.3 Definition 34 (Def 34): Context-Targeted Bias (CTB) Model**

Let $\mathrm{context}_S$ define a target quantum state $\sigma_S$ and put $r(\sigma):=1-\lambda_{\min}(\sigma)$. On the convex CTB domain $0\le\mathrm{CC}(S)\le r(\sigma_S)$, define the linear modification map on the retained operator space by
$$
L_S(X):=\alpha_S\big(\mathrm{tr}(X)\sigma_S-X\big),
\qquad
\alpha_S:=
\begin{cases}
\mathrm{CC}(S)/r(\sigma_S),&r(\sigma_S)>0,\\
0,&r(\sigma_S)=0.
\end{cases}
$$
with $\lambda_{\min}(\sigma)$ the minimal eigenvalue of $\sigma$. By Lemma 9.1a,
$$
r(\sigma)=\sup_{\rho}\tfrac12\|\sigma-\rho\|_1
=
\sup_{\rho,E}\left|\mathrm{tr}\!\big((\sigma-\rho)E\big)\right|.
$$
For density operators $\rho$, $\mathrm{tr}(\rho)=1$, so
$$
L_S(\rho)=\alpha_S(\sigma_S-\rho).
$$
Then
$$
\Delta P(i)=\mathrm{tr}\!\big(L_S(\rho)E_i\big)=\alpha_S\big(\mathrm{tr}(\sigma_S E_i)-\mathrm{tr}(\rho E_i)\big)=\alpha_S\big(p_{\mathrm{target}}(S,i)-p_i\big) \quad \text{(58)}
$$
and
$$
P_{\mathrm{obs}}(i)=(1-\alpha_S)\,P_{\mathrm{Born}}(i)+\alpha_S\,p_{\mathrm{target}}(S,i) \quad \text{(59)}
$$
with $0\le\alpha_S\le1$. (Note: The upper bound corresponds to complete replacement of the Born rule distribution by the target distribution in the maximal case. The constraint $\alpha_S\le1$ is equivalent to $\mathrm{CC}(S)\le r(\sigma_S)$ for the chosen target state.) Under a unitary $U$, $\sigma_{USU^\dagger}=U\sigma_S U^\dagger$, so $L_S$ and $K_S$ transform covariantly.

*Remarks:*
*   Lemma 9.1a gives $\|L_S\|_{\mathrm{op}} = \alpha_S r(\sigma_S) = \mathrm{CC}(S)$.
*   For the convex combination in Equation (59) to be physically valid, the interpolation factor $\alpha_S$ must be bounded by $1$. This implies the target-dependent constraint $\mathrm{CC}(S)\le r(\sigma_S)=1-\lambda_{\min}(\sigma_S)$. The admissible interpolation is largest whenever $\lambda_{\min}(\sigma_S)=0$, which includes every rank-deficient target and is not restricted to pure or near-pure states. The bound depends on the smallest eigenvalue, not monotonically on von Neumann entropy; no entropy-efficiency ordering follows without an additional spectral constraint.
*   For bipartite $\sigma_{AB}$, define $\sigma_A=\mathrm{tr}_B\sigma_{AB}$ and require the interpolation coefficients to satisfy $\alpha_{S_A\otimes S_B}=\alpha_{S_A}$. Then $K_{S_A\otimes S_B}(E_A\otimes I_B)=K_{S_A}(E_A)\otimes I_B$; the marginal-state identity alone does not imply this consistency relation.
*   The same CTB form applies when the targeted event channel is internal to the aggregate $S$. In that case $P_{\mathrm{Born}}$ denotes the neutral baseline distribution of the internal ND-RID event channel, $\sigma_S$ denotes the context-defined target state for that channel, and no additional influence primitive is introduced. Only the event algebra changes: the target is an internal physiological channel rather than an external measurement channel.

<a id="954-theorem-37-consistency-of-ctb-model"></a>**9.5.4 Theorem 37 (Consistency of CTB Model)**

The CTB model (Definition 34) is consistent with the framework’s requirements for a valid probability modification.

*Proof:*
1.  **Normalization:** $\sum_i \Delta P(i) = \alpha_S(\sum_i p_{\mathrm{target}} - \sum_i p_i) = \alpha_S(1 - 1)=0$.
2.  **Zero CC:** $\mathrm{CC}(S)=0$ implies $\alpha_S=0$, hence $\Delta P=0$.
3.  **Magnitude bound:** For all $\rho,E$, Lemma 9.1a gives
    $$
    |\Delta P|=\alpha_S\left|\mathrm{tr}\!\big((\sigma_S-\rho)E\big)\right|
    \le \alpha_S r(\sigma_S)
    =
    \mathrm{CC}(S).
    $$
4.  **Context dependence:** $\Delta P$ depends on $\sigma_S$, hence on $\mathrm{context}_S$.
5.  **Positivity:** $p_{\mathrm{obs}}$ is a convex combination of $p_i$ and $p_{\mathrm{target}}$, with weight $\alpha_S\in[0,1]$. QED

**Corollary 37a (CTB Vector-Shape, Target-Swap, and Coarsening Laws).** Fix a retained finite POVM $\{E_i\}_{i=1}^m$ and a CTB target state $\sigma_S$ with $r(\sigma_S)>0$. Let
$$
p_i=\mathrm{tr}(\rho E_i),
\qquad
p_i^{\mathrm{tar}}=\mathrm{tr}(\sigma_S E_i),
\qquad
v_i=p_i^{\mathrm{tar}}-p_i.
$$
Then the CTB deviation vector is exactly collinear with the target-displacement vector:
$$
\Delta\mathbf P
=
\alpha_S v,
\qquad
\alpha_S=\frac{\mathrm{CC}(S)}{r(\sigma_S)}.
\tag{59a}
$$
Consequently, if $v\ne0$ and $\Pi_{v^\perp}$ denotes orthogonal projection onto the Euclidean subspace perpendicular to $v$, then
$$
\Pi_{v^\perp}\Delta\mathbf P=0.
\tag{59b}
$$
For any coarse-grained event $A\subseteq\{1,\ldots,m\}$,
$$
\Delta P(A)=\sum_{i\in A}\Delta P(i),
\qquad
\Delta P(\Omega)=0,
\qquad
\Delta P(A^c)=-\Delta P(A).
\tag{59c}
$$
If two CTB contexts $S_+$ and $S_-$ have the same coefficient $\alpha_S$ and opposite target-displacement vectors,
$$
p_i^{\mathrm{tar},+}-p_i
=
-
\bigl(p_i^{\mathrm{tar},-}-p_i\bigr)
\qquad(1\le i\le m),
$$
then their CTB shifts obey the target-swap sign law
$$
\Delta P_{S_+}(i)=-\Delta P_{S_-}(i)
\qquad(1\le i\le m).
\tag{59d}
$$

*Proof.* Equation (58) gives
$$
\Delta P(i)=\alpha_S\bigl(p_i^{\mathrm{tar}}-p_i\bigr)=\alpha_Sv_i,
$$
which proves (59a). Orthogonal projection of a scalar multiple of $v$ onto $v^\perp$ is zero, proving (59b). For a coarse-grained effect
$$
E_A=\sum_{i\in A}E_i,
$$
linearity of $L_S$ and of the trace gives
$$
\Delta P(A)=\mathrm{tr}\!\big(L_S(\rho)E_A\big)
=\sum_{i\in A}\mathrm{tr}\!\big(L_S(\rho)E_i\big)
=\sum_{i\in A}\Delta P(i).
$$
Let $\Omega:=\{1,\ldots,m\}$. Since $E_\Omega=\sum_iE_i=I$ and $L_S$ is trace-annihilating,
$$
\Delta P(\Omega)=\mathrm{tr}\!\big(L_S(\rho)I\big)=\mathrm{tr}\!\big(L_S(\rho)\big)=0,
$$
so $\Delta P(A^c)=\Delta P(\Omega)-\Delta P(A)=-\Delta P(A)$. This proves (59c). Finally, applying (59a) to two contexts with the same $\alpha_S$ and opposite target-displacement vectors gives (59d). ∎

<a id="955-theorem-38-maximum-bias-effect-with-ctb-model"></a>**9.5.5 Theorem 38 (Maximum Bias Effect with CTB Model)**

For CTB (Equation 58), the maximum possible deviation magnitude over all states $\rho$ and effects $0\le E\le I$ equals $\mathrm{CC}(S)$:
$$
\sup_{\rho,\ 0\le E\le I}
|\Delta P(E\mid\rho,S)|
=
\|L_S\|_{\mathrm{op}}
=
\mathrm{CC}(S).
$$

*Proof.* If $r(\sigma_S)=0$, the CTB domain gives $\mathrm{CC}(S)=0$, and Definition 34 gives $\alpha_S=0$ and $L_S=0$, proving the asserted equality. Assume henceforth that $r(\sigma_S)>0$. By Lemma 9.1a,
$$
\sup_{\rho,E}
\left|
\mathrm{tr}\!\big((\sigma_S-\rho)E\big)
\right|
=
r(\sigma_S).
$$
For the CTB map,
$$
\Delta P(E|\rho,S)
=
\alpha_S\mathrm{tr}\!\big((\sigma_S-\rho)E\big).
$$
Therefore
$$
\sup_{\rho,E}|\Delta P(E|\rho,S)|
=
\alpha_S r(\sigma_S)
=
\frac{\mathrm{CC}(S)}{r(\sigma_S)}r(\sigma_S)
=
\mathrm{CC}(S).
$$
This is exactly the operational norm in Definition 30. ∎

<a id="remark-5-information-theoretic-measure-of-cc-bias"></a>**Remark 5: Information-theoretic measure of CC bias.** Write $p_i=P_{\mathrm{Born}}(i)$, $q_i=P_{\mathrm{obs}}(i)$, and $\delta_i=q_i-p_i$. Let $I_+:=\{i:p_i>0\}$ and assume $q_i=0$ for $i\notin I_+$. The KL divergence is
$$
D_{\mathrm{KL}}(q\Vert p)=\sum_{i\in I_+}q_i\ln\frac{q_i}{p_i},
\tag{60}
$$
with $0\ln(0/p_i):=0$. If $\delta_i=0$ for every $i$, this divergence is zero. For the local expansion, assume
$$
\eta:=\max_{i\in I_+}\frac{|\delta_i|}{p_i}<1.
$$
Taylor's theorem applied to $f(x)=(1+x)\ln(1+x)$, with $f'''(x)=-(1+x)^{-2}$, gives
$$
D_{\mathrm{KL}}(q\Vert p)
=\frac12\sum_{i\in I_+}\frac{\delta_i^2}{p_i}+\mathcal R,
\qquad
|\mathcal R|
\le\frac{1}{6(1-\eta)^2}
\sum_{i\in I_+}\frac{|\delta_i|^3}{p_i^2}.
$$
The linear term vanishes because $\sum_i\delta_i=0$. If at least one $\delta_i$ is nonzero, put $p_{\min}:=\min_{i:\delta_i\ne0}p_i>0$. Then
$$
|\mathcal R|
\le\frac{\|\delta\|_1^3}{6(1-\eta)^2p_{\min}^2}.
$$
In particular, on any regime with $\eta\le\eta_0<1$, this is the uniform expansion
$$
D_{\mathrm{KL}}(q\Vert p)
=\frac12\sum_{i\in I_+}\frac{\delta_i^2}{p_i}
+O\!\left(\frac{\|\delta\|_1^3}{p_{\min}^2}\right).
$$

**9.6 Theoretical Implications of Emergent CC**

Assuming the validity of the CC hypothesis (Theorem 34, Hypothesis 3), several implications arise:

<a id="proposition-12-hypothesized-correlation-cc-and-pp"></a>**Proposition 12 (Hypothesized correlation: CC and PP).** A positive correlation is hypothesized between achievable $\mathrm{CC}(S)$ and average sustainable Predictive Performance $\mathrm{PP}(S)$. Systems with higher CC might operate more effectively closer to the operational performance bound $\beta$.

<a id="proposition-13-potential-cc-effect-on-quantum-coherence"></a>**Proposition 13 (Potential CC effect on quantum coherence).** The CC mechanism (Hypothesis 3), by influencing “Evolve”/ND-RID parameters contributing to decoherence, could modify effective decoherence rates $\Gamma_{\mathrm{eff}}$ or coherence times $\tau_{\mathrm{coh}}$ of quantum systems interacting with the high-CC aggregate. Fractional change might scale as $O(\mathrm{CC})$, with context-dependent sign (Section 13.3).

<a id="proposition-14-relation-between-operational-cc-and-system-integrationprediction"></a>**Proposition 14 (Relation between operational CC and system integration/prediction).** Theorem 34 establishes a nonzero operational bias map only on its strict-improvement and representability branch. It supplies no measure of functional integration and no theorem relating such a measure to $\mathrm{CC}(S)$. A positive relation among CC, integration, internal modeling, and predictive capacity is an explicit empirical hypothesis.

<a id="proposition-15-registered-reset-cost-for-introspection"></a>**Proposition 15 (Registered-Reset Cost for Introspection).** Let an aggregate run a registered introspection protocol satisfying
$$
\Delta I\ge\Delta I_{\min}>0,
\qquad
H_q(P\mid R)\ge h_{\min}>0.
$$
Theorem 33 then gives the reset-cost trade-off
$$
\Delta I\,\varepsilon_{\mathrm{reset}}
\ge\Delta I_{\min}h_{\min}.
$$
Here $\varepsilon_{\mathrm{reset}}=\langle Q_{\mathrm{bath}}\rangle/(k_BT)$ is a thermodynamic reset ledger. This inequality does not define or lower-bound a state-space disturbance $\Delta S_{\min}$.

<a id="proposition-16-dynamic-nature-of-high-cc-states"></a>**Proposition 16 (Dynamic nature of high-CC states).** Assume, in addition to Proposition 15, that a high-CC protocol repeatedly acquires fresh introspective information and that every registered acquisition causes a nonzero displacement in a specified metric on $\mathrm{context}_S$. Then the context cannot remain static while that protocol operates. Without the repeated-acquisition, metric-displacement, and CC-to-protocol hypotheses, Theorem 33 does not exclude a static high-CC state or establish a claim about subjective experience.

## 9.7 Finite CC Resolution Records

<a id="theorem-97a-nonempty-finite-strict-improvement-witness"></a>**Theorem 9.7a (Nonempty Finite Strict-Improvement Witness).** Fix an MPU aggregate $S$ with $C_{\mathrm{agg}}>C_{op}$ and instantiate Assumption 1 on a qubit. Let the retained measurement be $\{P_0,P_1\}$, let
$$
p_{\mathrm{Born}}=(1/2,1/2),
$$
and take the reachable context set $\mathcal U=\{u_0,u_+\}$. Set
$$
P_{\mathrm{obs}}(\cdot\mid u_0)=p_{\mathrm{Born}},
\qquad
P_{\mathrm{obs}}(\cdot\mid u_+)
=\left(\frac{1+\alpha}{2},\frac{1-\alpha}{2}\right),
\quad 0<\alpha\le\alpha_{CC,max}<1/2,
\tag{9.7a.1}
$$
and take the reduced PCE potential, including every cost admitted in this two-context model, to be $V(u_0)=0$, $V(u_+)=-1+g(\alpha)$, where $g(\alpha)=\frac{1+\alpha}{2}h_{\mathrm{nat}}(\alpha/(1+\alpha))$ and $h_{\mathrm{nat}}(p)=-p\ln p-(1-p)\ln(1-p)$. The declared one-unit benefit of the $u_+$ branch is charged the cyclic ancilla-reset cost $g(\alpha)$ in $k_BT$ units, on the fresh product-input branch and in the justified exact-erasure limit of Theorem 9.7m. The benefit is the model’s declared input; Theorem 9.7m supplies the reset charge in its exact-erasure limit. Let the context dynamics send both points to $u_+$ in one step. Set $L_{u_0}=0$. With $\sigma=|0\rangle\!\langle0|$, the CTB direction
$$
L_{u_+}(X)=\alpha\bigl(\operatorname{tr}(X)\sigma-X\bigr)
\tag{9.7a.2}
$$
realizes (9.7a.1) from the maximally mixed input, and $\|L_{u_+}\|_{\mathrm{op}}=\alpha>0$.

*Proof.* The initial states $u_0$ and $u_+$ witness reachability, $u_0$ is the only Born-realizing point, and the reset-complete finite potential attains its unique strict minimum at $u_+$, since Theorem 9.7m proves $0<g(\alpha)\le h_{\mathrm{nat}}(\alpha/2)<\ln2<1$. That point is the globally attracting fixed point of the stated dynamics. Direct substitution of $I/2$ and $P_0,P_1$ in (9.7a.2) gives (9.7a.1), while $L_{u_0}=0$ represents the reference context. The map in (9.7a.2) is complex-linear, Hermitian-preserving, and trace-annihilating. Lemma 9.1a with pure $\sigma$ gives norm $\alpha$. Thus the declared finite model-level antecedents of Theorem 34 have a nonempty witness with reset completion in the stated Definition-28 limit. ∎

This witness settles nonvacuity and the complete reduced-PCE comparison on the declared two-context model. The physical aggregate-to-control carrier, source ledger, and distinct measured response remain certificate and realization records.

<a id="theorem-97b-response-shape-moduli-and-exponential-rigidity"></a>**Theorem 9.7b (Response-Shape Moduli and Exponential Rigidity).** The endpoint, monotonicity, concavity, and saturation conditions of Definition 31 leave a continuum of response shapes. For every $a>0$,
$$
G_a(x)=1-(1+x)^{-a}
\tag{9.7b.1}
$$
obeys $G_a(0)=0$, $G_a'(x)>0$, $G_a''(x)<0$, and $G_a(x)\to1$.

If a continuous response shape additionally obeys the complement-composition law
$$
1-G(x+y)=(1-G(x))(1-G(y))
\qquad(x,y\ge0),
\tag{9.7b.2}
$$
and is nonconstant, then there is a unique $\kappa>0$ such that
$$
G(x)=1-e^{-\kappa x}.
\tag{9.7b.3}
$$
A registered slope $G'(0)=\kappa$ or one nontrivial saturation point fixes $\kappa$.

*Proof.* Differentiation proves the claims for (9.7b.1). For (9.7b.2), put $S(x)=1-G(x)$. Then $S$ is continuous, $S(0)=1$, and $S(x+y)=S(x)S(y)$. If $S(x_0)=0$ for some $x_0>0$, repeated halving gives $S(x_0/2^n)=0$, contradicting continuity at $0$; hence $S$ is positive. The continuous Cauchy equation for $-\log S$ gives $-\log S(x)=\kappa x$. Monotonicity and nonconstancy give $\kappa>0$, proving (9.7b.3). ∎

Thus the exponential representative is rigid on the complement-semigroup branch, while Definition 31 alone retains the moduli (9.7b.1). Selection of the composition law and its scale is a separate physical response record.

<a id="theorem-97h-triangular-norm-census-of-complement-composition-laws"></a>**Theorem 9.7h (Triangular-Norm Census of Complement-Composition Laws).** Let $T$ be a continuous triangular norm on $[0,1]$: commutative, associative, nondecreasing in each argument, with $T(s,1)=s$. Call $T$ Archimedean when $T(s,s)<s$ for every $s\in(0,1)$. Consider continuous response shapes $G:[0,\infty)\to[0,1]$ with $G(0)=0$ obeying
$$
1-G(x+y)=T\bigl(1-G(x),1-G(y)\bigr)\qquad(x,y\ge0).
\tag{9.7h.1}
$$

1. Every solution is nondecreasing, and $G\equiv0$ is the constant solution.
2. A solution with $\lim_{x\to\infty}G(x)=1$ exists exactly when $T$ is Archimedean.
3. Let $T$ be Archimedean with continuous additive generator $f:[0,1]\to[0,\infty]$, strictly decreasing with $f(1)=0$, so that $T(s,t)=f^{(-1)}(f(s)+f(t))$ with $f^{(-1)}(v)=f^{-1}(\min\{v,f(0)\})$. The nonconstant solutions are exactly
$$
G_\kappa(x)=1-f^{(-1)}(\kappa x),\qquad\kappa>0,
\tag{9.7h.2}
$$
and each tends to $1$. For strict $T$, with $f(0)=\infty$, $G_\kappa<1$ everywhere; for nilpotent $T$, with $f(0)<\infty$, $G_\kappa$ reaches $1$ exactly at $x=f(0)/\kappa$. Moreover $G_\kappa$ is concave exactly when $f$ is convex.
4. Every shape $\mathcal G$ admitted by Theorem 35 solves (9.7h.1) for exactly one continuous triangular norm: the Archimedean norm $T_{\mathcal G}$ whose additive generator $f_{\mathcal G}$ is the inverse function of the strictly decreasing branch of $1-\mathcal G$, extended by $f_{\mathcal G}(0)=\inf\{x:\mathcal G(x)=1\}$ with $\inf\varnothing=\infty$; $f_{\mathcal G}$ is convex, and the solution has $\kappa=1$. More generally, if $1-\mathcal G(x+y)=\Phi\bigl(1-\mathcal G(x),1-\mathcal G(y)\bigr)$ for some function $\Phi$, then $\Phi=T_{\mathcal G}$ on the square of the range of $1-\mathcal G$.
5. The product norm, with $f=-\ln$, gives the exponential law (9.7b.3) and, at $\kappa=\ln2$, the backbone shape of Definition 32a. The Hamacher product $st/(s+t-st)$, with $f(t)=(1-t)/t$, gives Definition 32's shape $\kappa x/(1+\kappa x)$. The Clayton norms $(s^{-1/a}+t^{-1/a}-1)^{-a}$, with $f(t)=t^{-1/a}-1$, give (9.7b.1) at $\kappa=1$. The Łukasiewicz norm $\max\{s+t-1,0\}$, with $f(t)=1-t$, gives $\min\{\kappa x,1\}$, which is concave and saturates at $x=1/\kappa$, where its second derivative does not exist.

Consequently, continuous concave nondecreasing shapes with $G(0)=0$ and $G\to1$, taken modulo the scale $\kappa$, correspond bijectively to continuous Archimedean norms with convex additive generators, and Theorem 35's shapes lie in this class. Fixing a composition law is equivalent to fixing $T$; the scale $\kappa$ is a separate datum, fixed by one registered value $G(x_1)=g_1\in(0,1)$ with $x_1>0$ through $\kappa=f(1-g_1)/x_1$.

*Proof.* Since $T(s,t)\le T(s,1)=s$ and symmetrically $T(s,t)\le t$, one has $T\le\min$. Put $S=1-G$. Then $S(x+y)\le S(x)$, so $S$ is nonincreasing, and $S\equiv1$ is a solution because $T(1,1)=1$; this proves item 1.

If $T$ has an idempotent $e\in(0,1)$ and $S\to0$, continuity gives a least $x_e>0$ with $S(x_e)=e$. For $0\le y\le x_e$, $S(y)\ge e$, hence $e=T(e,e)\le T(e,S(y))\le e$, so $S=e$ on $[x_e,2x_e]$ and inductively on $[x_e,\infty)$, contradicting $S\to0$. Thus a solution tending to $1$ forces $T$ to be Archimedean; the converse follows from item 3.

For item 3, Ling's representation theorem (Ling, 1965) gives every continuous triangular norm with $T(s,s)<s$ on $(0,1)$ a continuous, strictly decreasing additive generator $f:[0,1]\to[0,\infty]$ with $f(1)=0$ and $T(s,t)=f^{(-1)}(f(s)+f(t))$; this supplies the generator of item 3. If $f(0)=\infty$ and $S(x_0)=0$ for some $x_0>0$, then $T(S(x_0/2),S(x_0/2))=0$ forces $S(x_0/2)=0$, and repeated halving contradicts $S(0)=1$; hence $h:=f\circ S$ is finite and continuous. Because $f(f^{(-1)}(v))=\min\{v,f(0)\}$, (9.7h.1) becomes
$$
h(x+y)=\min\{h(x)+h(y),f(0)\},\qquad h(0)=0.
$$
In the strict case $h$ is continuous, additive and nonnegative, so $h(x)=\kappa x$ with $\kappa\ge0$. In the nilpotent case put $x_0=\inf\{x:h(x)=f(0)\}$. When $x+y<x_0$ the minimum is the sum, so $h$ is continuous and additive on $[0,x_0)$ and equals $\kappa x$ there. If $x_0=\infty$, boundedness forces $\kappa=0$; if $x_0<\infty$, continuity gives $\kappa x_0=f(0)$ and $h(x_0+y)=\min\{f(0)+h(y),f(0)\}=f(0)$. In both cases nonconstancy gives $\kappa>0$ and $h(x)=\min\{\kappa x,f(0)\}$, which is (9.7h.2), and $S\to0$. Conversely, $\min\{\min\{\kappa x,c\}+\min\{\kappa y,c\},c\}=\min\{\kappa(x+y),c\}$ for $c=f(0)$ shows that every $G_\kappa$ solves (9.7h.1). A strictly decreasing bijection and its inverse are convex together, and appending the constant $0$ after a convex decreasing branch that reaches $0$ preserves convexity; hence $1-G_\kappa$ is convex exactly when $f$ is.

For item 4, Theorem 35's shape is continuous, nondecreasing and concave on $[0,\infty)$ with limit $1$. If it were constant on an interval below the level $1$, concavity would keep it constant thereafter, contradicting the limit; hence $S=1-\mathcal G$ decreases strictly until it reaches $0$, and $f_{\mathcal G}$ is a continuous, strictly decreasing, convex generator with $f_{\mathcal G}(1)=0$. The generated norm $T_{\mathcal G}$ is continuous and Archimedean, and $f_{\mathcal G}(S(x))=\min\{x,f_{\mathcal G}(0)\}$ gives (9.7h.1) with $\kappa=1$. For $s,t$ in the range of $S$ with $s,t>0$, any $\Phi$ with the stated property satisfies $\Phi(s,t)=S\bigl(S^{-1}(s)+S^{-1}(t)\bigr)=T_{\mathcal G}(s,t)$, with $S^{-1}$ the inverse of the strictly decreasing branch; if $0$ is in the range, $\Phi(0,t)=0=T_{\mathcal G}(0,t)$ because $S$ vanishes beyond its saturation point. Every triangular norm vanishes on $\{0\}\times[0,1]$, so a triangular norm with this property equals $T_{\mathcal G}$.

Item 5 is direct substitution of each generator in (9.7h.2). The argument for item 4 uses only continuity, monotonicity, concavity, $G(0)=0$ and the limit $1$, so it assigns a norm $T_G$ with convex generator to every shape in the stated class, and rescaling $x$ leaves $T_G$ unchanged. Two such shapes with the same norm are nonconstant solutions for that norm and lie in one family $G_\kappa$ by item 3, and item 3 applied to a convex generator produces a concave shape; this proves the bijection. ∎

<a id="theorem-97c-abstract-cc-data-do-not-determine-a-physical-control-carrier"></a>**Theorem 9.7c (Abstract CC Data Do Not Determine a Physical Control Carrier).** Fix any nonzero finite-dimensional map $L_S$ satisfying Definition 30. The tuple consisting of its operator space, norm, retained states, and retained effects contains no typed map from aggregate sources to a Hamiltonian, field, or instrument. Two source extensions can therefore agree on that complete abstract tuple while assigning respectively
$$
H_{\mathrm{ctrl}}(S)=0
\qquad\text{and}\qquad
H_{\mathrm{ctrl}}(S)=g(S)A
\tag{9.7c.1}
$$
for an independently supplied nonzero observable $A$ and source function $g$ with $g(S)\ne0$.

*Proof.* Definition 30 constrains $L_S$ as a linear operator on the retained event span and contains none of the source, geometry, energy, Hamiltonian, time, or likelihood types appearing in (9.7c.1). Appending either assignment leaves every equation of Definition 30 unchanged. Hence those equations cannot select between the extensions. ∎

Hypothesis 3 nominates the nonzero extension, but a campaign-resolution artifact for its physical claim must populate the source-to-Hamiltonian-to-instrument chain and its energy, timing, likelihood, and held-out response records.

<a id="theorem-97d-exact-complete-positivity-interval-for-the-ctb-replacement-line"></a>**Theorem 9.7d (Exact Complete-Positivity Interval for the CTB Replacement Line).** Let $d\ge2$, let $\sigma$ be a density operator, and define
$$
\Lambda_\alpha(X)=(1-\alpha)X+\alpha\operatorname{tr}(X)\sigma.
\tag{9.7d.1}
$$
This map is Hermiticity preserving and trace preserving for every real $\alpha$. If $\sigma$ is not full rank, $\Lambda_\alpha$ is completely positive exactly for
$$
0\le\alpha\le1.
\tag{9.7d.2}
$$
If $\sigma$ is full rank and $T_\sigma:=\operatorname{tr}(\sigma^{-1})$, the exact interval is
$$
0\le\alpha\le\frac{T_\sigma}{T_\sigma-1}.
\tag{9.7d.3}
$$
For $\alpha\ne0$, its covariance group is the unitary stabilizer of $\sigma$, and full $U(d)$ covariance holds exactly when $\sigma=I/d$; at $\alpha=0$ the identity channel is fully covariant independently of $\sigma$.

*Proof.* With $|\Omega\rangle=\sum_je_j\otimes e_j$, the Choi matrix is
$$
J(\Lambda_\alpha)
=(1-\alpha)|\Omega\rangle\!\langle\Omega|
+\alpha\sigma\otimes I.
\tag{9.7d.4}
$$
For $0\le\alpha\le1$ both summands are positive. If $\alpha<0$, the support of $\sigma\otimes I$ contains a nonzero vector orthogonal to $|\Omega\rangle$; its quadratic form in (9.7d.4) is negative. If $\sigma$ has a kernel and $\alpha>1$, a kernel direction with nonzero overlap with $|\Omega\rangle$ gives a negative quadratic form.

Now suppose $\sigma$ is full rank and $\alpha>1$. The rank-one downdate criterion applied to $A=\alpha\sigma\otimes I$ gives positivity exactly when
$$
(\alpha-1)\langle\Omega|A^{-1}|\Omega\rangle
=\frac{\alpha-1}{\alpha}\operatorname{tr}(\sigma^{-1})\le1,
$$
which is (9.7d.3). Finally, conjugating (9.7d.1) replaces $\sigma$ by $U\sigma U^\dagger$, proving the covariance statement. ∎

This interval is exact for the algebraic one-parameter replacement line containing the CTB family. Its intersection with Definition 34's declared convex-interpolation branch is $0\le\alpha\le1$; the full-rank segment above $1$ is an algebraic CPTP extension outside that branch. Theorem 9.7g gives the complete finite-dimensional classification of unrestricted Hermiticity-preserving perturbations and of bipartite marginal consistency.

<a id="theorem-97g-complete-choi-classification-of-finite-cc-perturbations"></a>**Theorem 9.7g (Complete Choi Classification of Finite CC Perturbations).** Let $L:\mathcal B(\mathcal H)\to\mathcal B(\mathcal H)$ be complex-linear, Hermiticity preserving, and trace annihilating on a finite-dimensional retained operator algebra, and put
$$
\Lambda:=\operatorname{id}+L.
$$
With the output--input Choi convention
$$
J(\Phi)=\sum_{i,j}\Phi(|i\rangle\!\langle j|)\otimes|i\rangle\!\langle j|,
$$
$\Lambda$ is CPTP if and only if
$$
J(L)=J(L)^\dagger,
\qquad
\operatorname{tr}_{\mathrm{out}}J(L)=0,
\qquad
|\Omega\rangle\!\langle\Omega|+J(L)\succeq0.
\tag{9.7g.1}
$$
Thus the complete admissible perturbation class is the affine spectrahedron (9.7g.1). For a unitary group $G$, the channel is $G$-covariant exactly when
$$
[J(\Lambda),U\otimes\overline U]=0
\qquad(U\in G).
\tag{9.7g.2}
$$

Let $\Lambda_{AB}$ and $\Lambda_A$ be channels on finite retained operator spaces whose state and effect spans are full trace-dual spaces, and write $K_{AB}=\Lambda_{AB}^*$ and $K_A=\Lambda_A^*$. The bipartite consistency condition
$$
K_{AB}(E_A\otimes I_B)=K_A(E_A)\otimes I_B
\qquad\text{for every retained }E_A
\tag{9.7g.3}
$$
holds if and only if
$$
\operatorname{tr}_B\Lambda_{AB}(X)
=
\Lambda_A(\operatorname{tr}_B X)
\qquad\text{for every retained }X.
\tag{9.7g.4}
$$

*Proof.* Choi's theorem identifies complete positivity with $J(\Lambda)\succeq0$. Hermiticity preservation makes $J(L)$ Hermitian, and trace preservation is equivalent to $\operatorname{tr}_{\mathrm{out}}J(\Lambda)=I$, hence to the middle condition in (9.7g.1), because $J(\operatorname{id})=|\Omega\rangle\!\langle\Omega|$. This proves the first equivalence and exhausts the finite class. Applying covariance to the matrix units shows that $J(\Lambda)$ is invariant under conjugation by $U\otimes\overline U$, which is (9.7g.2), and reversing the calculation proves the converse.

For every retained $X$ and $E_A$, trace duality gives
$$
\operatorname{tr}\!\left[\operatorname{tr}_B\Lambda_{AB}(X)E_A\right]
=
\operatorname{tr}\!\left[XK_{AB}(E_A\otimes I_B)\right].
$$
Substitution of (9.7g.3) makes the right side equal to $\operatorname{tr}[\Lambda_A(\operatorname{tr}_B X)E_A]$, proving (9.7g.4). The same nondegenerate trace pairing proves the reverse implication. ∎

<a id="theorem-97i-context-controlled-partial-swap-realization-of-the-ctb-family"></a>**Theorem 9.7i (Context-Controlled Partial-Swap Realization of the CTB Family).** Consume the typed two-value source register $\mathcal H_S$, the degenerate control register $C$ and the controlled-$X$ encoder (L.12.8b.1) of Theorem L.12.8b, so that the context value $s_j$ writes $j$ into $C$ while $S$ is retained. Let the target register $\mathrm{tg}$ and an ancilla register $\mathrm{an}$ be copies of one $d$-dimensional Hilbert space, $d\ge2$, carrying the same Hamiltonian $H$; let $\mathrm{SW}$ be their swap; and let $Y$ be a degenerate coin qubit prepared in $I/2$. For a density operator $\sigma$ and $0\le\alpha\le1$, prepare $\mathrm{an}$ in $\sigma$, choose $\theta\in[0,\pi/2]$ with $\sin^2\theta=\alpha$, fix a registered duration $\tau>0$, and put
$$
H_{\mathrm{int}}
=-\frac{\hbar\theta}{\tau}\,|1\rangle\!\langle1|_C\otimes Z_Y\otimes\mathrm{SW},
\qquad
U_{\mathrm{int}}=e^{-i\tau H_{\mathrm{int}}/\hbar},
\tag{9.7i.1}
$$
with $Z_Y=|0\rangle\!\langle0|_Y-|1\rangle\!\langle1|_Y$. Support the encoder, the interaction and the readout in bounded world tubes $W_{\mathrm{ctx}}\prec W_{\mathrm{int}}\prec W_{\mathrm{rd}}$, as in (L.12.8b.12).

1. $U_{\mathrm{int}}$ is the identity on the sector $C=0$ and equals $e^{i(-1)^k\theta\,\mathrm{SW}}=\cos\theta\,I+i(-1)^k\sin\theta\,\mathrm{SW}$ on the sector $C=1$, $Y=k$. It commutes with $H_{\mathrm{tg}}+H_{\mathrm{an}}$, so every coin branch conserves the total energy exactly.
2. Under $\operatorname{do}(C=0)$ the target channel is the identity, and under $\operatorname{do}(C=1)$ it is
$$
\Lambda_\alpha(\rho)=(1-\alpha)\rho+\alpha\operatorname{tr}(\rho)\sigma .
\tag{9.7i.2}
$$
The realized response map $\Lambda_\alpha-\operatorname{id}$ is therefore the CTB map $L_S(X)=\alpha(\operatorname{tr}(X)\sigma-X)$ of Definition 34 with $\mathrm{CC}(S)=\alpha\,r(\sigma)$, and for every retained state $\rho$ and effect $E$
$$
p\bigl(E\mid\operatorname{do}(C=1)\bigr)-p\bigl(E\mid\operatorname{do}(C=0)\bigr)=\operatorname{tr}\bigl(E\,L_S(\rho)\bigr).
\tag{9.7i.3}
$$
The composite $s_j\mapsto j\mapsto\Lambda_{j\alpha}$ is total and, for $\alpha>0$, injective, and the realized response intertwines exactly with the CTB response. A retained projective measurement is recorded by a controlled copy into a degenerate memory and read by the normalized instrument (L.12.8b.4), whose outcome probabilities under $\operatorname{do}(C=j)$ are $\operatorname{tr}\bigl(E\,\Lambda_{j\alpha}(\rho)\bigr)$. Every stage extends by the identity on spacelike factors, so (L.12.8b.13) gives nonselective remote-marginal invariance.
3. The coin-averaged target energy change is $\alpha\operatorname{tr}\bigl(H(\sigma-\rho)\bigr)$, and the ancilla carries the opposite change. If $\sigma=e^{-\beta H}/\operatorname{tr}e^{-\beta H}$ is the Gibbs state of a declared reservoir at inverse temperature $\beta$, then $\sigma\otimes I/2$ is the Gibbs state of $\mathrm{an}\,Y$ at the same temperature, and (9.7i.2) is a thermal operation: an energy-conserving unitary on the target and a Gibbs bath.
4. For every channel $\Lambda=\operatorname{id}+L$ in the spectrahedron (9.7g.1), the Kraus operators $K_1,\ldots,K_{r_\Lambda}$ read from the spectral decomposition of $J(\Lambda)$, with $r_\Lambda\le d^2$, define an isometry $V|\psi\rangle=\sum_jK_j|\psi\rangle\otimes|j\rangle$. Any unitary $W$ on $\mathcal H_{\mathrm{tg}}\otimes\mathbb C^{r_\Lambda}$ extending $|\psi\rangle\otimes|1\rangle\mapsto V|\psi\rangle$ gives, through $|0\rangle\!\langle0|_C\otimes I+|1\rangle\!\langle1|_C\otimes W$ on degenerate registers, the $\operatorname{do}$-response $L$ exactly.
5. With $d=2$, $\sigma=|0\rangle\!\langle0|$, input $I/2$, retained measurement $\{P_0,P_1\}$ and $u_0\mapsto s_0$, $u_+\mapsto s_1$, items 1--3 realize Theorem 9.7a on its retained event ledger: $p(P_0\mid\operatorname{do}(C=0))=1/2$, $p(P_0\mid\operatorname{do}(C=1))=(1+\alpha)/2$, and the realized response map is $L_{u_+}$ of (9.7a.2).

*Proof.* Since $\mathrm{SW}^2=I$, $e^{i\phi\,\mathrm{SW}}=\cos\phi\,I+i\sin\phi\,\mathrm{SW}$, and the projector $|1\rangle\!\langle1|_C$ and the eigenprojectors of $Z_Y$ give the sector form of item 1. The swap commutes with $H\otimes I+I\otimes H$, and $C$ and $Y$ are degenerate.

Write $U_\pm=\cos\theta\,I\pm i\sin\theta\,\mathrm{SW}$. The partial traces $\operatorname{tr}_{\mathrm{an}}[\mathrm{SW}(\rho\otimes\sigma)\mathrm{SW}]=\sigma$, $\operatorname{tr}_{\mathrm{an}}[\mathrm{SW}(\rho\otimes\sigma)]=\sigma\rho$ and $\operatorname{tr}_{\mathrm{an}}[(\rho\otimes\sigma)\mathrm{SW}]=\rho\sigma$ give
$$
\operatorname{tr}_{\mathrm{an}}\bigl[U_\pm(\rho\otimes\sigma)U_\pm^\dagger\bigr]
=\cos^2\theta\,\rho+\sin^2\theta\,\sigma\pm i\sin\theta\cos\theta\,[\sigma,\rho].
$$
Averaging over the coin removes the commutator and gives (9.7i.2), while the sector $C=0$ acts as the identity. Subtraction gives the response map, Lemma 9.1a gives its norm $\alpha\,r(\sigma)$, and (9.7i.3) is trace duality. For $\alpha>0$ and any density operator $\rho\ne\sigma$, $\Lambda_\alpha(\rho)\ne\rho$, which gives injectivity. The controlled copy is a permutation unitary on orthogonal record states, and (L.12.8b.4) is a normalized instrument. Locality is (L.12.8b.13).

For item 3, the averaged target energy is $\operatorname{tr}(H\Lambda_\alpha(\rho))=\operatorname{tr}(H\rho)+\alpha\operatorname{tr}(H(\sigma-\rho))$, and branchwise conservation of $H_{\mathrm{tg}}+H_{\mathrm{an}}$ assigns the opposite change to the ancilla. A degenerate qubit has Gibbs state $I/2$ at every temperature, and the joint unitary $\sum_k|k\rangle\!\langle k|_Y\otimes U_{(-1)^k}$ commutes with the free Hamiltonian of $\mathrm{tg}\,\mathrm{an}\,Y$.

For item 4, Choi's theorem and $J(\Lambda)\succeq0$ give $\Lambda(X)=\sum_jK_jXK_j^\dagger$, and trace preservation gives $\sum_jK_j^\dagger K_j=I$, so $V$ is an isometry. Extending $V$ from $\mathcal H_{\mathrm{tg}}\otimes|1\rangle$ by any isometry between the orthogonal complements of $\mathcal H_{\mathrm{tg}}\otimes|1\rangle$ and $V\mathcal H_{\mathrm{tg}}$ yields $W$, and $\operatorname{tr}_{\mathbb C^{r_\Lambda}}[W(\rho\otimes|1\rangle\!\langle1|)W^\dagger]=\Lambda(\rho)$. Item 5 is substitution: $\Lambda_\alpha(I/2)=(1-\alpha)I/2+\alpha|0\rangle\!\langle0|$. ∎

<a id="theorem-97e-operational-cc-and-internal-mutual-information-are-independent-data"></a>**Theorem 9.7e (Operational CC and Internal Mutual Information Are Independent Data).** Let an aggregate have a registered bipartition $AB$ and define the operational integration invariant
$$
I_{\mathrm{int}}(A:B)_\eta
=S(\eta_A)+S(\eta_B)-S(\eta_{AB}).
\tag{9.7e.1}
$$
Here $S$ denotes von Neumann entropy.
There are finite models with equal nonzero $\mathrm{CC}$ and different $I_{\mathrm{int}}$, and models with equal $I_{\mathrm{int}}$ and different $\mathrm{CC}$.

*Proof.* Attach the same nonzero external retained-event map $L_S$ to the internal product state $|00\rangle\!\langle00|$ and to a Bell state. Their CC norms agree, while (9.7e.1) is respectively $0$ and $2\ln2$. Conversely, keep either internal state fixed and attach $L_S=0$ or the nonzero map; the integration invariant is unchanged while CC changes. ∎

Therefore Definition 30 entails no nontrivial monotone inequality between CC and (9.7e.1). A relation requires a physical coupling law and an identifiable multivariate protocol rather than identification of the two quantities.

<a id="theorem-97j-identifiable-integration-invariants-under-the-internal-target-coupling-law"></a>**Theorem 9.7j (Identifiable Integration Invariants Under the Internal-Target Coupling Law).** Let an aggregate with registered bipartition $AB$ have finite-dimensional state $\eta=\eta_{AB}$, and let it carry the internal-target coupling law
$$
L_\eta(X)=\alpha\bigl(\operatorname{tr}(X)\eta-X\bigr),\qquad0<\alpha\le1\ \text{fixed},
\tag{9.7j.1}
$$
the CTB form of Definition 34 with the target declared as $\sigma_S=\eta$, acting on a probe with the Hilbert space of $AB$. For a retained effect set $\mathcal E$ whose real span contains $I$, the response data of $\eta$ are the table $R_\eta(\rho,E)=\operatorname{tr}\bigl(E\,L_\eta(\rho)\bigr)$ over all probe states $\rho$ and all $E\in\mathcal E$. A function $\mathcal J$ of the aggregate state is identifiable when states with equal response data have equal values of $\mathcal J$. Then:

1. The response data determine exactly the values $\operatorname{tr}(E\eta)$ for $E$ in the span of $\mathcal E$, and $\mathcal J$ is identifiable if and only if $\mathcal J(\eta)$ depends on $\eta$ only through these values.
2. If $\mathcal E$ spans the full operator space, in particular for the local product effects $E_A\otimes F_B$, every integration invariant is identifiable, including $I_{\mathrm{int}}(A:B)_\eta$ of (9.7e.1), the conditional entropy $S(\eta_{AB})-S(\eta_B)$ and the relative entropy of coherence in any fixed basis.
3. If $\mathcal E$ consists of the local marginal effects $E_A\otimes I_B$ and $I_A\otimes F_B$, the identifiable invariants are exactly the functions of $(\eta_A,\eta_B)$. The two-qubit states $I/4$ and $|\Phi^+\rangle\!\langle\Phi^+|$ have equal response data, while their mutual informations are $0$ and $2\ln2$, their conditional entropies $\ln2$ and $-\ln2$, and their product-basis coherences $0$ and $\ln2$.
4. If the retained datum is the scalar $\mathrm{CC}=\|L_\eta\|_{\mathrm{op}}$, then $\mathrm{CC}=\alpha\bigl(1-\lambda_{\min}(\eta)\bigr)$, and the identifiable invariants are exactly the functions of $\lambda_{\min}(\eta)$; $|00\rangle\!\langle00|$ and $|\Phi^+\rangle\!\langle\Phi^+|$ have $\lambda_{\min}=0$ and mutual informations $0$ and $2\ln2$.
5. Theorem 9.7i with the ancilla register $\mathrm{an}$ replaced by the aggregate register $AB$ in state $\eta$ realizes (9.7j.1) on the probe response-faithfully for each context-controlled use.

*Proof.* For every probe state, $R_\eta(\rho,E)=\alpha\operatorname{tr}(E\eta)-\alpha\operatorname{tr}(E\rho)$. Since $\alpha$, $\rho$ and $E$ are known, the table is in bijection with the values $\operatorname{tr}(E\eta)$, $E\in\mathcal E$, and linearity extends it to the span. Identifiability is then the stated factorization, which proves item 1. Products of operator bases span the bipartite operator space, so item 2 follows from item 1: the table determines $\eta$. For item 3 the retained values are exactly those of the marginals $\eta_A$ and $\eta_B$; both witnesses have marginals $I/2$, and direct evaluation gives the stated invariants. For item 4, Lemma 9.1a gives $\|L_\eta\|_{\mathrm{op}}=\alpha r(\eta)$, and $\alpha$ is fixed, so the scalar datum is equivalent to $\lambda_{\min}(\eta)$; both pure witnesses have $\lambda_{\min}=0$. Item 5 is Theorem 9.7i, item 2, with $\sigma=\eta$. ∎

<a id="theorem-97l-message-mediated-aggregate-coupling-and-complete-response-quotient"></a>**Theorem 9.7l (Message-Mediated Aggregate Coupling and Complete Response Quotient).** Let a finite aggregate have a declared factorization $\mathcal H_S=\mathcal H_A\otimes\mathcal H_M$ and state $\eta$, where $M$ has dimension $d\ge2$. Supply an independent probe $Q$ isomorphic to $M$, a degenerate sign coin in $I/2$, identical probe/message free Hamiltonians $H$, and isolation of $A$ during the interaction. Fix a nonnegative pulse $g(t)$ with compact support and integral $\theta\in(0,\pi/2]$. On coin branch $k$ supply the actual Hamiltonian
$$
H_k(t)=H_Q+H_M+\hbar g(t)[I-(-1)^k\mathrm{SW}_{QM}],
\qquad \alpha=\sin^2\theta.
\tag{9.7l.1}
$$
Use the same free drift, preparations and readout in the reference arm, with $g=0$. Register effects in the common co-rotating probe frame. Then:

1. For every aggregate state, including states correlated across $A:M$, and every independent probe state $\rho$, the realized target channel and response are
$$
\Lambda_\eta(\rho)=(1-\alpha)\rho+\alpha\eta_M,\qquad
L_\eta(X)=\alpha[\operatorname{tr}(X)\operatorname{tr}_A\eta-X].
\tag{9.7l.2}
$$
The whole $A$ marginal is unchanged nonselectively. The message can be consumed and correlated with the probe.
2. For a retained effect family $\mathcal E$, the complete response table over all probe states is
$$
R_\eta(\rho,E)=\alpha[\operatorname{tr}(E\eta_M)-\operatorname{tr}(E\rho)].
\tag{9.7l.3}
$$
Two aggregate states have the same table exactly when their message reductions agree on the real span of $\mathcal E$. Every identifiable aggregate invariant is exactly a function factoring through that restricted partial-trace map. A tomographically complete message effect family identifies $\eta_M$; it need not identify $\eta$.
3. If the retained datum is only the scalar operational norm, then
$$
\mathrm{CC}(\eta)=\alpha[1-\lambda_{\min}(\eta_M)],
\tag{9.7l.4}
$$
and its identifiable functions are exactly functions of this minimum eigenvalue.
4. Every coin branch conserves the probe/message free energy. The target energy change after averaging is $\alpha\operatorname{tr}[H(\eta_M-\rho)]$, and the message has its opposite. Preparation, sign-coin, controller, pulse, clock and readout resources belong to the supplied source account. The theorem assigns no heat to a gate count and makes no cyclic reset claim.

*Proof.* The swap is a Hermitian involution and commutes with $H_Q+H_M$. Thus the propagator is the common free drift, an irrelevant scalar phase and
$$
U_\pm=\cos\theta\,I\pm i\sin\theta\,\mathrm{SW}_{QM}.
\tag{9.7l.5}
$$
The reduced input on $QM$ is $\rho\otimes\eta_M$ by probe independence. Tracing the swap expansion over $M$ gives
$$
\operatorname{tr}_M[U_\pm(\rho\otimes\eta_M)U_\pm^\dagger]
=\cos^2\theta\,\rho+\sin^2\theta\,\eta_M
\pm i\sin\theta\cos\theta[\eta_M,\rho].
\tag{9.7l.6}
$$
The physically prepared fair coin averages both signs and cancels the commutator, proving (9.7l.2). Correlations with $A$ do not enter this reduced calculation. Trace preservation of the operation on $QM$ implies invariance of every observable of $A$, proving its marginal assertion. No copy of an unknown aggregate state has been assumed.

Subtract the known reference probability to obtain (9.7l.3). Subtracting the known probe term and dividing by fixed $\alpha>0$ recovers exactly $\operatorname{tr}(E\eta_M)$; linearity gives the span. Equal tables are therefore precisely the fibers of that map, and a function is identifiable precisely when constant on those fibers. Full message tomography and its limitation follow. Lemma 9.1a applied to the message replacement target proves (9.7l.4) and the scalar quotient.

The free-energy commutator vanishes before averaging as well as afterward. Taking the trace against $H$ in (9.7l.2) gives the stated target change, and branchwise conservation supplies its opposite. The generator $I\pm\mathrm{SW}$ is positive. On the ideal pulse, its expectation is constant because it commutes with the free drift and itself at every time; switching its coefficient from zero back to zero therefore has zero net mean switching work. Peak drive capacity and positive service charges remain separate entries of the complete source account. ∎

<a id="corollary-97l1-parity-message-source-family-integration-and-predictive-composition"></a>**Corollary 9.7l.1 (Parity-Message Source Family, Integration and Predictive Composition).** Supply three classical predictive modules whose full ready laws have fair immutable initial bits $Y_{0i}$, model/record copies $m_i=I_{0i}=Y_{0i}$, independent binary increments $Z_{1i},Z_{2i}$ with probability $1/4$ of one, and independent fair fallbacks. On success of a data-independent event of probability $s$, module $i$ forecasts $Y_{1i}$ against $Y_{2i}=Y_{0i}\oplus Z_{1i}\oplus Z_{2i}$; on failure it returns its fallback. Let successes and noises be independent across modules conditional on the initial triple. Definition 2.4.1g, Theorem 2.4.1h and Corollary 2.4.1h.1 construct these modules and prove their qualification on the source-relative classical R14 presentation. Definition 9.7l.2 supplies the complete aggregate source, finite primitive decoder, timing and ownership account.

Prepare the initial triple uniformly conditional on its parity $b$, with $\Pr(b=1)=p$, retaining the other source fields with their original conditional laws. Supply a fresh zero message and three classical controlled-NOT copies into it. These leave every entire constituent ready marginal unchanged and make its actual parity the message. No preparatory label is delivered to the probe. Put $A$ equal to all other aggregate registers. At the coupling cut,
$$
\eta_p=(1-p)\eta_A^0\otimes|0\rangle\langle0|
+p\eta_A^1\otimes|1\rangle\langle1|,\qquad
\eta_A^0\eta_A^1=0,\qquad
(\eta_p)_M=\operatorname{diag}(1-p,p).
\tag{9.7l.7}
$$
For $\theta=\pi/6$ and the degenerate free-Hamiltonian specialization, the source implements Theorem 9.7l with $\alpha=1/4$. It has the following exact properties.

1. The single computational probe response from input $I/2$ is
$$
\Pr(P_1\mid\mathrm{EXCHANGE},p)=\frac38+\frac p4.
\tag{9.7l.8}
$$
It identifies $p$ and hence every invariant of the fixed one-parameter family. On a larger state family the complete quotient remains the message reduction.
2. At the initial coupling cut, with $h(p)=-p\ln p-(1-p)\ln(1-p)$ and $0\ln0=0$,
$$
I(A:M)_{\eta_p}=h(p),\qquad S(AM)-S(A)=0,\qquad
S(AM)-S(M)=(1-p)S(\eta_A^0)+pS(\eta_A^1).
\tag{9.7l.9}
$$
If the two conditional laws are related by a permutation, the last quantity is a source constant. If all prepared registers are diagonal in their computational basis, their fixed-basis coherence is zero.
3. The scalar norm is $\max\{p,1-p\}/4$. Its identifiable source-family functions are exactly those invariant under $p\mapsto1-p$; in particular $h(p)$ is identifiable from the scalar on this family. This does not give a universal CC–integration identity.
4. Lock the parity of the three returned forecasts before newly reading the three actual $Y_{2i}$ outcomes, including failed runs. The composite accuracy and optimal uninformed baseline are
$$
A_{\mathrm{parity}}=\frac12+\frac{s^3}{16},\qquad
A_0(p)=\frac12+\frac{|1-2p|}{128}.
\tag{9.7l.10}
$$
For the R14 bound $s>s_0=210529325/408146688$, their gap is uniformly greater than
$$
\frac{s_0^3}{16}-\frac1{128}
=\frac{832382218066893269911541}{1087849490465798670885322752} >\frac1{4096}.
\tag{9.7l.11}
$$
The subsequent original model updates and predictor dynamics are unchanged.
5. On the fixed diagonal source family, the observable $\{P_1^M\}$ is a sufficient and inclusion-minimal context family. The map $p\mapsto\operatorname{diag}(1-p,p)$ is trace-norm Lipschitz with constant two. Fresh independently prepared episodes have a constant feedback map. If all two-policy service costs are supplied with incremental cost at most $r>0$, equal blind prediction experiments at $p=0$ and $p=1$ have accuracy $1/2$ under OFF and $5/8$ under EXCHANGE; the declared benefit weight $\Gamma_0=16r$ gives strictly positive net improvement at least $r$. These are explicit source utility and resource calibrations.

*Proof.* Each coordinate of a uniformly parity-conditioned triple is fair. Keeping the other fields with their original conditional law preserves each complete marginal, not only the displayed bit. Controlled copies of classical diagonal fields preserve them and write parity into $M$. The immutable initial records distinguish the two parities by orthogonal support, yielding (9.7l.7). Applying the realized channel to $I/2$ gives (9.7l.8), whose affine dependence is injective.

Orthogonal conditional supports give $S(A)=h(p)+(1-p)S(\eta_A^0)+pS(\eta_A^1)$ and the same expression for $S(AM)$, while $S(M)=h(p)$. Subtracting proves (9.7l.9); permutations preserve entropy and diagonal states have zero coherence. The message eigenvalues and (9.7l.4) give the scalar formula. Its fibers on $[0,1]$ are exactly $\{p,1-p\}$, proving the complete scalar classification.

On success a module's forecast-error sign has mean $1/2$, and on failure mean zero. Its conditional mean is therefore $s/2$, independent of the initial bit. Conditional independence makes the parity-error sign have mean $(s/2)^3$, giving the first formula in (9.7l.10). Each two-increment noise sign has mean $1/4$. Thus the target parity sign before observing a forecast is $(1-2p)/64$, and the optimal constant prediction has the displayed baseline. Subtracting its worst value and using the stated rational bound proves (9.7l.11). Nonselective operations on the message leave the full remaining module marginal unchanged, and terminal reads occur only after the locked forecasts, so no feedback changes the original runs.

The response depends on $p$ and distinguishes its endpoints, so the empty context family is insufficient and $\{P_1^M\}$ is minimal. The norm of the difference of its diagonal states is $2|p-p'|$. Positive charges for optional additional observables give no utility improvement when the same response is already sufficient. The fresh-run map is constant and hence has contraction constant zero. In the two labeled endpoint experiments the blind probe receiver guesses the actual parity from its output bit, giving $5/8$ versus $1/2$; the labels remain with the evaluator. The net gain is at least $\Gamma_0/8-r=r>0$. No label side information, Born-rule violation or whole-host tomography has been used. ∎

<a id="definition-97l2-complete-paid-parity-aggregate-source"></a>**Definition 9.7l.2 (Complete Paid Parity-Aggregate Source).** The three constituent sources are the exact classical R14 construction of Definition 2.4.1g, Theorem 2.4.1h and Corollary 2.4.1h.1. Their complete ready laws, prefix presentation, original operating stocks and original fourteen-time-unit runs are retained. The following finite source supplies the new message, probe, controls, records, clock and services used in Corollary 9.7l.1. Its physical gates are the declared finite controlled-source primitives with the generators and prices below.

#### 9.7l.2.1 Cells and ROM

Allocate1024 new two-level cells in labeled banks:

- message M, external probe P, independent sign coin Y:3;
- retained initial I0 audit copies A1,A2,A3:3;
- terminal original-return forecast copies Q1,Q2,Q3 and parity Q:4;
- terminal actual Y2 copies T1,T2,T3 and parity T:4;
- four probe pointer/return cells:4;
- OFF/EXCHANGE policy:1;
- two readout-basis setting cells:2;
- six-bit slot counter:6;
-64 eight-bit executed-command records:512;
-64 three-cell energy receipt banks:192;
-16 work/lock/error/audit cells:16;
-277 unused paid padding cells.

Total:1024. Initial message/work/pointers/receipts/counter are pure zero; probe is the independently declared density $\rho$; sign coin is I/2. Settings/policy are external classical inputs independent of the R14 noises and unknown future targets. There is no unknown-state copy of P. A retained source coin purification, if demanded, takes one of the 277 paid padding cells and is unobserved; the reduced sign state remains I/2.

The external physical preparation parameter p is absent from the ROM; arbitrary rational descriptors of it are mathematical source specifications, not silently stored strings. The 4096-bit ROM is 64 fixed48-bit schedule words (3072 bits) plus a1024-bit fixed primitive-ID/calibration/finite-control syntax block. A48-bit word comprises4-bit opcode, three 8-bit LOCAL port indices,2-bit condition selector,6-bit successor counter, and 12 zero reserved bits. Every other word is invalid. The local port index identifies one of the finite wired banks or one of the nine nominated R14 ports (three initial I0, three original terminal forecast, three terminal Y2); records/receipts use the current slot index as a bank subaddress. No address into the large constituent R14 ROM is exposed.

The 1024-bit syntax block records the fixed decoder version, rational pulse calibration $\theta/\pi=1/6$, port count, basis cases and temporal guards; the numerical opcode and port meanings are fixed by the wired decoder below. Its unused bits are zero. These fields are source-owned firmware constants and not an interpreter for arbitrary programs. At the last slot a terminal latch stops the controller, so the counter wrap does not execute a second episode. No runtime program can change a constituent motor rate, query a future Y2 before slot 24, skip the forecast lock, or bypass receipts. A hardwired phase latch prevents the terminal-phase counter from advancing until the original14 $\tau$ run ends. Invalid basis setting11 produces retained FAIL and uses identity readout gates; it still pays all slots and makes no tomography claim.

**Fixed ROM encoding.** The following numerical decoder fixes the register state used by the schedule. Port indices are listed in order from 0 through 33:

| Port | Register | Port | Register |
|--:|:--|--:|:--|
| 0 | `NONE` | 17 | `RETURN` |
| 1 | `M` | 18 | `LOCK` |
| 2 | `P` | 19 | `PROBE_VALID` |
| 3 | `Y` | 20 | `TERMINAL_VALID` |
| 4 | `A1` | 21 | `SETTING_LOCK` |
| 5 | `A2` | 22 | `FAIL` |
| 6 | `A3` | 23 | `POLICY` |
| 7 | `Q1` | 24 | `BASIS` |
| 8 | `Q2` | 25 | `I01` |
| 9 | `Q3` | 26 | `I02` |
| 10 | `Q` | 27 | `I03` |
| 11 | `T1` | 28 | `FORECAST1` |
| 12 | `T2` | 29 | `FORECAST2` |
| 13 | `T3` | 30 | `FORECAST3` |
| 14 | `T` | 31 | `Y21` |
| 15 | `ERROR` | 32 | `Y22` |
| 16 | `POINTER` | 33 | `Y23` |

The opcode values 0 through 10 are, in order, IDLE, CNOT, PHASE, HADAMARD, EXCHANGE, MEASURE, SOURCE_RECEIPT, LOCK, FLAG, RETURN_COPY and OUTCOME_COPY. For opcode $o$, port indices $a,b,c$, condition $v$ and successor $s$, the six-byte big-endian schedule word is
$$
2^{44}o+2^{36}a+2^{28}b+2^{20}c+2^{18}v+2^{12}s.
$$
The low twelve bits vanish. Conditions are opcode-local: 1 selects EXCHANGE policy for EXCHANGE and forecast LOCK for OUTCOME_COPY; 2 selects basis $Y$ for PHASE; 3 selects basis $X$ or $Y$ for HADAMARD. Other conditions are zero. FLAG at slot 15 sets PROBE_VALID for basis 00, 01 or 10 and FAIL for 11; FLAG at slot 32 sets TERMINAL_VALID. LOCK at slot 9 sets SETTING_LOCK and at slot 23 sets forecast LOCK. The temporal and terminal latches act as stated in the schedule.

The complete schedule is specified by the decoded rows below; the word formula above fixes its exact byte representation.

Slots in the table are numbered from one. The successor $s$ is the six-bit counter value, so its next slot is $s+1$; the terminal latch suppresses the nominal return after slot $64$.

| Slot | Operation | First port | Second port | Third port | $v$ | $s$ |
|--:|:--|:--|:--|:--|--:|--:|
| 1 | `SOURCE_RECEIPT` | `NONE` | `NONE` | `NONE` | 0 | 1 |
| 2 | `CNOT` | `I01` | `A1` | `NONE` | 0 | 2 |
| 3 | `CNOT` | `I02` | `A2` | `NONE` | 0 | 3 |
| 4 | `CNOT` | `I03` | `A3` | `NONE` | 0 | 4 |
| 5 | `CNOT` | `A1` | `M` | `NONE` | 0 | 5 |
| 6 | `CNOT` | `A2` | `M` | `NONE` | 0 | 6 |
| 7 | `CNOT` | `A3` | `M` | `NONE` | 0 | 7 |
| 8 | `SOURCE_RECEIPT` | `Y` | `NONE` | `NONE` | 0 | 8 |
| 9 | `LOCK` | `SETTING_LOCK` | `NONE` | `NONE` | 0 | 9 |
| 10 | `EXCHANGE` | `P` | `M` | `Y` | 1 | 10 |
| 11 | `PHASE` | `P` | `NONE` | `NONE` | 2 | 11 |
| 12 | `HADAMARD` | `P` | `NONE` | `NONE` | 3 | 12 |
| 13 | `MEASURE` | `P` | `POINTER` | `NONE` | 0 | 13 |
| 14 | `CNOT` | `POINTER` | `RETURN` | `NONE` | 0 | 14 |
| 15 | `FLAG` | `PROBE_VALID` | `FAIL` | `NONE` | 0 | 15 |
| 16 | `IDLE` | `NONE` | `NONE` | `NONE` | 0 | 16 |
| 17 | `RETURN_COPY` | `FORECAST1` | `Q1` | `NONE` | 0 | 17 |
| 18 | `RETURN_COPY` | `FORECAST2` | `Q2` | `NONE` | 0 | 18 |
| 19 | `RETURN_COPY` | `FORECAST3` | `Q3` | `NONE` | 0 | 19 |
| 20 | `CNOT` | `Q1` | `Q` | `NONE` | 0 | 20 |
| 21 | `CNOT` | `Q2` | `Q` | `NONE` | 0 | 21 |
| 22 | `CNOT` | `Q3` | `Q` | `NONE` | 0 | 22 |
| 23 | `LOCK` | `LOCK` | `NONE` | `NONE` | 0 | 23 |
| 24 | `OUTCOME_COPY` | `Y21` | `T1` | `NONE` | 1 | 24 |
| 25 | `OUTCOME_COPY` | `Y22` | `T2` | `NONE` | 1 | 25 |
| 26 | `OUTCOME_COPY` | `Y23` | `T3` | `NONE` | 1 | 26 |
| 27 | `CNOT` | `T1` | `T` | `NONE` | 0 | 27 |
| 28 | `CNOT` | `T2` | `T` | `NONE` | 0 | 28 |
| 29 | `CNOT` | `T3` | `T` | `NONE` | 0 | 29 |
| 30 | `CNOT` | `Q` | `ERROR` | `NONE` | 0 | 30 |
| 31 | `CNOT` | `T` | `ERROR` | `NONE` | 0 | 31 |
| 32 | `FLAG` | `TERMINAL_VALID` | `NONE` | `NONE` | 0 | 32 |
| $33\le r\le63$ | `IDLE` | `NONE` | `NONE` | `NONE` | $0$ | $r$ |
| $64$ | `IDLE` | `NONE` | `NONE` | `NONE` | $0$ | $0$ |

The final $128$ bytes consist of an $84$-byte message followed by $44$ zero bytes. Form the message by writing the tag `CC05-MSG-v1`, then a semicolon, then the following eight records in order, each followed by a semicolon. Insert no spaces or newline. The records state the calibration and the already specified observation schedule.

| Record | Meaning |
|:--|:--|
| `theta=pi/6` | Pulse angle $\theta=\pi/6$. |
| `ports=34` | Thirty-four registered ports. |
| `slots=64` | Sixty-four clock slots. |
| `phase11=Y` | The phase at slot eleven uses the $Y$ setting. |
| `H12=XorY` | The slot-twelve Hadamard is enabled for the $X$ or $Y$ setting. |
| `lock23` | The forecast locks at slot twenty-three. |
| `read24-26` | The outputs are read in slots twenty-four through twenty-six. |
| `stop64` | The controller stops after slot sixty-four. |

These 512 bytes are the classical initial state of the 4096 paid firmware cells. The fixed wired decoder above supplies the port and primitive meanings. Substitution of each table row into the six-byte formula verifies every opcode, port, condition and successor of the schedule; the byte encoding changes none of its generators, prices or timing.

#### 9.7l.2.2 Primitive matrices and generator decoder

All new computational cells are degenerate during primitive logic. Let $W$ be $X$, CNOT on its two nominated ports, SWAP on two return cells, or the XOR update of a fixed Boolean lock/error function. Each $W$ is an explicit permutation involution; its normalized pulse generator is $D=\pi(I-W)/2$, and $\exp(-iD)=W$. The lock/error operations here are $X$ and CNOT only, not unspecified truth tables. Source-controlled variants are block sums over orthogonal classical setting/policy projectors, with identity in disabled blocks.

Hadamard $H=(X+Z)/\sqrt{2}$ is a Hermitian involution with $D_H=\pi(I-H)/2$. The $Y$-readout prephase $S^\dagger=\operatorname{diag}(1,-i)$ has $D_S=\pi|1\rangle\langle1|/2$. Controlled counterparts have the corresponding classical condition projector. Computational measurement is the pointer unitary $\mathrm{CNOT}_{P,\mathrm{pointer}}$ followed by the registered Born computational pointer instrument. Thus every readout branch is normalized, includes its retained pointer and has a stated finite dilation.

A slot of duration $\tau$ is divided into 16 subslots. For a primitive dimensionless $D$, in its assigned subslot$[a,a+\tau/16]$, use the fixed smooth envelope $f(t)=(32/\tau)\sin^{2}[16\pi(t-a)/\tau]$ multiplying $\hbar D$. Its integral is 1, so its exact propagator is $\exp(-iD)$. Each $D$ above has norm$\le\pi$. Generator support is only its named fixed ports and controller sector. At most one native logic generator operates per subslot.

Receipt completion in EVERY slot uses the three fresh receipt cells: flip each while degenerate in subslots4,5,6, then raise their gaps by a fixed half-cosine profile to$5E,5E/2,5E/2$ in subslots7,8,9. Endpoint work is$10E$. Receipt cells are outside all later gates. Command-record writes and counter advance use subslots10–15 through fixed bitwise XORs controlled by the classical counter/source opcode; these operations are parallel on disjoint target bits. There are at most 14 such elementary controlled bit flips in a subslot. Their combined norm is bounded by$14\pi$. Counter advancement uses the finite64-state cyclic permutation as one explicitly supplied clock-register unitary; its principal Hermitian logarithm is fixed by the discrete Fourier eigenbasis with phases in$[0,2\pi)$. This is an explicitly defined$64\times64$ matrix, norm$<2\pi$, not an arbitrary complement. It acts in subslot16. The source owns the controller/clock service and pays its fee.

Impose $E\tau\ge10^{4}\hbar$. All parallel logic-generator peaks are then below$(448\pi/10^{4})E<E$. The three receipt gaps sum$10E$. Supply a separate$32E$ peak drive reservation; this bounds logic/receipt combinations even with conservative overlap. Endpoint receipt work$640E$ over 64 slots is supplied by the distinct operating work stock. Peak reservation is not counted again as consumed work.

#### 9.7l.2.3 Exact schedule

All slot numbers 1–16 occur BEFORE release of the constituent R14 clocks; their ready-state holding is paid. The original three devices then execute their unchanged14 $\tau$ run simultaneously. Slots 17–64 occur afterward. Total new episode duration is 78 $\tau$, consisting of 64 added slots and 14 original-run time units.

1. Deliver/check source prepared stocks, source version and setting fields; no measurement of hidden future Y2.
2–4. CNOT $\mathrm{I0}_i\to A_i$, $i=1,2,3$.
5–7. CNOT $A_i\to M$, $i=1,2,3$.
8. Check sign-coin prepared delivery receipt; do not measure/select its value.
9. Set the dedicated SETTING_LOCK work bit by $X$; policy and basis values are not mutated. The fixed interface thereafter disables writes to those setting fields.
10. Signed partial exchange on $P,M$, controlled by the locked policy; OFF is identity interaction with the same free drift.
11. Apply $S^\dagger$ to $P$ only for $Y$-basis setting.
12. Apply $H$ to $P$ for $X$- or $Y$-basis setting.
13. Copy computational $P$ to the fresh probe pointer and apply its normalized pointer instrument.
14. Copy the classical readout pointer to the external return-record cell.
15. Set the fresh PROBE_VALID work bit for a valid basis setting; on setting11 instead set a distinct FAIL bit. These are conditional $X$ operations on initially zero bits.
16. Paid identity; release the constituent R14 clocks at slot end.

[Constituent three 14 $\tau$ R14 runs, their original3 verifier calls each, original receipts and all failure branches. Added stocks held throughout.]

17–19. Copy original terminal forecast $\mathrm{return}_i\to Q_i$, $i=1,2,3$. The original interface returns its declared independent fallback on unsuccessful termination.
20–22. CNOT $Q_i\to Q$, $i=1,2,3$.
23. Set the forecast LOCK flag. No later primitive writes $Q$ or any $Q_{i}$.
24–26. Added terminal interface: CNOT $\mathrm{Y2}_i\to T_i$, $i=1,2,3$, conditional on LOCK. This reads actual source outcome fields even on unsuccessful runs and never feeds back.
27–29. CNOT $T_i\to T$, $i=1,2,3$.
30–31. CNOT $Q\to\mathrm{error}$, then $T\to\mathrm{error}$.
32. Set the separate initially zero TERMINAL_VALID work bit by $X$. It is distinct from PROBE_VALID and is not a second flip of the same flag.
33–64. Paid identities, retaining all records/resources.

The actual same-cut coupling-input aggregate is after slot 9 and before slot 10. The initial-parity audit fields are fixed classical functions of the three nominal sources; none changes the marginal ready R14 states. Their extra correlations do not alter individual source qualification. No output from slots 10–15 or 24–32 reaches constituent device state or rates. A controller invariant checks the constituent read ports' temporal guards; rejected calls write FAIL and consume the same fees.

#### 9.7l.2.4 Exchange energy and free drift

For definiteness freeze the message/probe FREE Hamiltonians to the degenerate branch $H_M=H_P=0$ for this candidate. The source uses the $\epsilon=0$ branch, so its free drift vanishes. The sign-exchange generator in subslot1 of slot 10 is $D_k=(\pi/6)[I-(-1)^k\,\mathrm{SW}]$; its norm$\le\pi/3$. With the common normalized envelope above, it gives $\alpha=\sin^{2}(\pi/6)=1/4$. The combined sign-controlled $D$ is positive and bounded. All logic and probe readout energy is therefore accounted as controlled drive/receipt service; no hidden gap change of $M$ is needed.

#### 9.7l.2.5 Complete finite prices and resource bound

Preflight supplies1024 new cells and 4096 firmware bits, stock cost$5120E/128=40E$. Hold all 5120 for$78\tau$, cost$5120\cdot78E/128=3120E$. Fixed source-preparation/controller/coin/correlation-delivery service invoice: $E(1+4096+1024)=5121E$. Source correlation and arbitrary independent probe preparation are supplied input contracts, not synthesized from a free thermal reservoir; their source delivery fee and state energy are explicit (zero storage energy on this degenerate branch). Native service costs$64\cdot10E=640E$, with the actual receipt mechanism above. Total new apparatus tariff is$8921E$, plus the separately owned$32E$ peak reservation (not consumed), and all constituent source purchase/original-run costs.

Constituent R14 holding extension:$3\cdot64[6978+68\cdot2^{72}+2^{1332}]R$ plus$192R$ for three timer packages. This includes their complete ROM, not just6978 counted registers. All devices have their original$20E$ main/verifier allocations. The preflight external meter/receipt is a separately supplied packaged service included in its fee, with no infinite recursive self-billing. All unused stock is still purchased and held; no reset takes place.

For a conservative context-control resource subtotal choose $r=8921E$ plus the complete constituent holding charge converted by the registered positive $E/R$ price. This overcharges control by including every new service and holding cost, so it bounds the actual context-control spending. The source actually purchases a separate core-service reserve$2r$ in the same units; it is a declared resource capacity/standing service budget, not a second consumed invoice. Thus $R_M\le r=(1/2)R_{\mathrm{core}}$, with no claim that the source is economical. The two policies share stock/holding; EXCHANGE's incremental operational charge is at most $r$ and its real slot fee$10E$ is retained. Using utility weight $\Gamma_0=16r$ makes net benefit at least $\Gamma_0/8-r=r>0$ even under this conservative incremental-cost upper bound. Actual shared slot fees do not imply an extra incremental invoice $r$. No resource is counted twice as consumed work.

<a id="theorem-97m-cyclic-reset-of-the-fixed-two-context-ctb-witness"></a>**Theorem 9.7m (Cyclic Reset of the Fixed Two-Context CTB Witness).** In Theorem 9.7i, item 5, take $H_{\mathrm{tg}}=H_{\mathrm{an}}=0$, retain the source register $S$ and its actual finite classical law $q_{jr}=\Pr(S=s_j,R_{\mathrm{ext}}=r)$, and use the projective readout $\{P_0,P_1\}$ on the target. Before the encoder, specify the complete registered input
$$
\rho_0=\left(\sum_{j,r}q_{jr}|s_j,r\rangle\!\langle s_j,r|\right)_{SR_{\mathrm{ext}}}
\otimes\frac{I_Y}{2}\otimes\frac{I_T}{2}
\otimes|0\rangle\!\langle0|_A
\otimes|0,0,0\rangle\!\langle0,0,0|_{CMR_M}.
\tag{9.7m.0}
$$
Here $T$ is the target, $Y$ the coin, $C$ the control and $M$ the readout-memory register. The record $R_{\mathrm{ext}}$ exhausts the other finite retained classical records; no additional retained record is correlated with the fresh target or coin. The bath and any permitted auxiliary resources satisfy the independent-initialization and cyclic-return conditions of Definition 28. The normalized projective instrument of Theorem 9.7i is an imported premise. An implementation with additional apparatus or dilation records must supply their own complete resource account. After (L.12.8b.4), copy the readout bit $M$ to a degenerate retained output log $R_M$, which is not a controller resource promised to return to ready. Let $A$ be the ancilla's computational-basis bit. For either coin value $k\in\{0,1\}$, the conditional law of $(M,A)$ is
$$
\begin{array}{c|ccc}
 &(0,0)&(1,0)&(0,1)\\ \hline
S=s_0&1/2&1/2&0\\
S=s_1&1/2&(1-\alpha)/2&\alpha/2
\end{array}.
\tag{9.7m.1}
$$
All other atoms vanish. The coin $Y$ is again $I/2$ and is independent of $(S,R_{\mathrm{ext}},M,A,R_M)$ after this readout. On the reachable support, a second application of the source-controlled $U_{\mathrm{ctx}}$ returns $C$ to $|0\rangle$, and a controlled $X$ from $R_M$ returns $M$ to $|0\rangle$. The ancilla is now a classical degenerate bit and has the logical CPTP ready-state map $\mathscr R_A(X)=|0\rangle_A\!\langle0|\otimes\operatorname{tr}_A X$. The source, external record, target and output log are retained and unchanged during this reset.

Let $q_1=\sum_rq_{1r}$. For ancilla reset the complete retained side information is $(S,R_{\mathrm{ext}},T,R_M,Y)$. The post-readout target is $|M\rangle$ with $R_M=M$, and $Y$ is independent, so these additional registers do not change the conditional entropy. The control and readout memory have zero conditional reset entropy, while
$$
H_q(A\mid S,R_{\mathrm{ext}},R_M)
=q_1g(\alpha),\qquad
g(\alpha)=\frac{1+\alpha}{2}
h_{\mathrm{nat}}\!\left(\frac{\alpha}{1+\alpha}\right).
\tag{9.7m.2}
$$
Theorem 31 gives $Q_{\mathrm{reset}}\ge k_BTq_1g(\alpha)$ under Definition 28. Corollary 7.6r.1 supplies a finite-swap sequence for the ancilla whose output excitation is at most $e^{-n}$, whose residual conditional entropy is at most $(n+2)e^{-n}$, and whose irreversible excess heat above its actual conditional-entropy reduction, in $k_BT$ units, is at most $e^{1/n}/n$. Its justified exact-erasure limit attains $Q_{\mathrm{reset}}=k_BTq_1g(\alpha)$ with convergent entropy and mean heat. The reset-work store $\mathsf W_{\mathrm{reset}}$ and bath $\Theta_T$ are the sole reset-work and reset-heat owners; the coin needs no reset. Each finite approximant admits positive-duration log and reset strokes in bounded world tubes after $W_{\mathrm{rd}}$, with identity extension on spacelike factors. The resource, duration and support bounds are attached to each finite approximant. For $q_1>0$, Theorem 7.6r excludes finite-resource exact reset under its hypotheses, so exact return is attained in the justified limit. The per-use reset charge is $g(\alpha)$ on $u_+$ and zero on $u_0$, so the reset-complete potential of Theorem 9.7a still has its strict gap $1-g(\alpha)>0$.

*Proof.* The initial target and ancilla state is the equiprobable mixture of $|00\rangle$ and $|10\rangle$. In the $S=s_0$ sector the interaction is the identity. In the $S=s_1$, $Y=k$ sector, the swap pulse sends $|10\rangle$ to $\cos\theta|10\rangle+i(-1)^k\sin\theta|01\rangle$ and changes $|00\rangle$ only by a phase. Projecting the target removes the cross term, proving (9.7m.1) and showing that the conditional post-readout state is independent of $k$. Because $C=j$ and $R_M=M$ on every reachable branch, their controlled returns are reversible and exchange no free energy. In the $j=1$ sector, $\Pr(M=0)=(1+\alpha)/2$ and $\Pr(A=1\mid M=0)=\alpha/(1+\alpha)$; in the $j=0$ sector $A=0$. The Shannon conditional-entropy formula gives (9.7m.2). The finite-swap and heat statements follow from Corollary 7.6r.1 applied to the actual law with the stated unchanged side information; on the registered reachable joint classical input domain its trace-norm output error is at most $2e^{-n}$, and contractivity bounds any next-use retained probability error by $e^{-n}$. Finally $g(\alpha)=H(A\mid M,S=s_1)\le H(A\mid S=s_1)=h_{\mathrm{nat}}(\alpha/2)<\ln2<1$. For each finite approximation the bath is an independent finite Gibbs product, conditional swaps are controlled by the retained classical records, no auxiliary memory is hidden, the external controls are cyclic and the retained records are unchanged. The work supplied equals the bath-energy increase. Corollary 7.6r.1 supplies the heat conclusion from these physical resource premises. The zero free Hamiltonian and identity extensions preserve the energy and locality conditions of Theorem 9.7i. The ready-state map is realized on the registered reachable witness domain. ∎

<a id="theorem-97f-fresh-records-with-static-response-context"></a>**Theorem 9.7f (Fresh Records with Static Response Context).** Let the response context space be the singleton $\{c_*\}$ carrying a fixed admissible nonzero CC map. If the branch declares a nonempty high-CC subrange, choose the map norm in that subrange. At update $n$, append a fresh internal binary record $Z_n$ to a retained tape,
$$
R_{n+1}=(R_n,Z_{n+1}),
$$
while the minimal sufficient response context remains $c_*$. Then the record process can acquire fresh positive conditional entropy at every step while
$$
d_{\mathrm{ctx}}(c_{n+1},c_n)=0
\tag{9.7f.1}
$$
for every metric on the singleton context space.

*Proof.* Choose independent unbiased $Z_n$. Each appended bit has conditional entropy $\ln2$, while the context projection is constant, proving (9.7f.1). The fixed nonzero map keeps the operational CC value unchanged. ∎

Thus, on every branch with a declared nonempty high-CC subrange, fresh acquisition plus a fixed CC value in that subrange do not entail context displacement. Proposition 16 obtains its dynamical conclusion precisely after adding the premise that every registered acquisition displaces the specified context metric.

<a id="theorem-97k-acquisition-displacement-classification-of-recursive-response-contexts"></a>**Theorem 9.7k (Acquisition-Displacement Classification of Recursive Response Contexts).** Let fresh records $Z_1,Z_2,\ldots$ take values in a finite alphabet $\mathcal Z$ with $|\mathcal Z|=b\ge2$, let the response context take values in a finite set $\mathcal C$ with $|\mathcal C|=k$ carrying a metric $d_{\mathrm{ctx}}$, and let the context be the recursive projection
$$
c_{n+1}=U_n(c_n,Z_{n+1})
\tag{9.7k.1}
$$
of the record, for deterministic update maps $U_n:\mathcal C\times\mathcal Z\to\mathcal C$. Call the projection displacing when $d_{\mathrm{ctx}}(U_n(c,z),c)>0$ for all $n$, $c$ and $z$, and acquisition-faithful when every $U_n(c,\cdot)$ is injective.

1. Displacing projections exist exactly when $k\ge2$. For $k=2$ every $U_n$ is the record-independent flip, and $I(Z_{n+1};c_{n+1}\mid c_n)=0$.
2. Displacing acquisition-faithful projections exist exactly when $k\ge b+1$. At each step there are exactly $\bigl((k-1)!/(k-1-b)!\bigr)^k$ admissible maps $U_n$; for $k=b+1$ they are the maps for which each $U_n(c,\cdot)$ is a bijection $\mathcal Z\to\mathcal C\setminus\{c\}$, and binary records on three contexts admit $8$ of them.
3. If $Z_{n+1}$ is uniform and independent of $(c_1,\ldots,c_n)$, every acquisition-faithful projection satisfies $I(Z_{n+1};c_{n+1}\mid c_n)=\ln b$.
4. Take $b=2$, $\mathcal C=\mathbb Z_3$ and $U_n(c,z)=c+1+z\bmod3$. Let $\sigma_0,\sigma_1,\sigma_2$ be pure qubit states with Bloch vectors at mutual angles $2\pi/3$, attach the CTB maps $L_c(X)=\alpha(\operatorname{tr}(X)\sigma_c-X)$ with one common $\alpha$ in a declared nonempty high-CC subrange, and put $d_{\mathrm{ctx}}(c,c')=\frac12\|\sigma_c-\sigma_{c'}\|_1$. Let each record be the computational-basis outcome of a fresh $|+\rangle$ qubit, and let a qutrit context register be updated by the controlled cyclic shift $\sum_z|z\rangle\!\langle z|\otimes V_3^{1+z}$ with $V_3|c\rangle=|c+1\bmod3\rangle$. Then $\mathrm{CC}(c)=\alpha$ for every context, distinct contexts carry distinct response maps, each acquisition has conditional entropy $\ln2$ and is written into the context, and every acquisition displaces the context by $d_{\mathrm{ctx}}=\sqrt3/2$.

The existence thresholds of items 1--2, and the record independence of two-context displacement, hold for every projection sequence $c_n=\pi_n(R_n)$ of the retained record, with displacement and faithfulness imposed pointwise in the record. Three contexts are therefore the minimal carrier on which every binary acquisition both displaces the response context and is recorded by it, and item 4 realizes the acquisition-to-metric-displacement premise of Proposition 16 on that minimal carrier at a fixed high CC value. Theorem 9.7f is the case $k=1$.

*Proof.* Displacement means $U_n(c,z)\ne c$, which is impossible for $k=1$. For $k=2$ it forces $U_n(c,z)$ to be the other context for every $z$, so $c_{n+1}$ is a function of $c_n$ and the conditional mutual information vanishes. Acquisition-faithful displacement requires, for each $c$, an injection of $\mathcal Z$ into $\mathcal C\setminus\{c\}$; such injections exist exactly when $b\le k-1$, there are $(k-1)!/(k-1-b)!$ of them for each of the $k$ contexts, and for $k=b+1$ they are bijections. For a general projection sequence the same counting applies, for each record $r$, to the values $\pi_{n+1}(r,z)$, which must avoid $\pi_n(r)$ and, under faithfulness, be pairwise distinct. Under faithfulness of (9.7k.1), $Z_{n+1}$ is a function of $(c_n,c_{n+1})$, so $I(Z_{n+1};c_{n+1}\mid c_n)=H(Z_{n+1}\mid c_n)=\ln b$ for a uniform independent record.

In item 4, $U_n(c,z)\in\{c+1,c+2\}$ differs from $c$ and $U_n(c,0)\ne U_n(c,1)$, and the controlled shift is the permutation unitary implementing $U_n$. Pure targets have $r(\sigma_c)=1$, so Lemma 9.1a gives $\mathrm{CC}(c)=\alpha$, and distinct targets give distinct maps; hence the context is the minimal sufficient response statistic of the record. The Born rule gives probability $1/2$ to each record value. The trine states satisfy $|\langle\psi_c|\psi_{c'}\rangle|^2=1/4$ for $c\ne c'$, and the trace distance of pure states is $\sqrt{1-|\langle\psi_c|\psi_{c'}\rangle|^2}=\sqrt3/2$. ∎

### I. Statement and exact scope

<a id="cubic-plateau-source"></a>

<a id="theorem-97n-selected-cubic-plateau-realization-and-calibration"></a>**Theorem 9.7n (Selected Cubic-Plateau Realization and Calibration).** There is an explicit optimal-prefix source presentation $C$ containing the unchanged $R_h$ family and a countable family of complete three-$R_{14}$ parity aggregates $\mu_n$ with the following properties.

1. Every $R_h$ has exactly its original complete realizer set and predictive complexity. The three constituents of each $\mu_n$ remain the source-relative MPUs of Corollary 2.4.1h.1. Every aggregate $\mu_n$ solves the same parity prediction task with the strict margin greater than $1/4096$ of Corollary 9.7l.1. The aggregate-task operational threshold in this presentation is attained and equals eight. The exact protected complexity partition is

$$
C_{\mathrm{op}}^{C}=C_P^{C}(\mu_0)=8,\qquad
C_P^{C}(\mu_1)=9,\qquad
9\le C_P^{C}(\mu_n)<\infty\quad(n\ge1).
$$

2. The nominal probe response of the complete aggregate is zero for $\mu_0$ and has operational norm $1/4$ for every $\mu_n$ with $n\ge1$. It is realized by a read-only source enable and the unchanged $\pi/6$ sign-averaged partial exchange of Theorem 9.7l on its $p=0$ pure parity message. The independent probe may be arbitrarily entangled with an external reference. All source stocks, histories, controls, clocks and probe/readout resources are retained and paid.

3. Finite calibrated dyadic activation instruments on the same declared source family realize the source-dose composition

$$
T(s,t)=\left[\max\{s^{1/3}+t^{1/3}-1,0\}\right]^3
$$

and converge with explicit finite-history error bounds to the continuous normalized response

$$
G(x)=1-(1-\min\{x,1\})^3,\qquad x\ge0.
$$

This $T$ is a continuous Archimedean nilpotent triangular norm with normalized convex additive generator $f(s)=1-s^{1/3}$.

4. Under the Definition 31 extension convention of this construction, in which one binary-symbol complexity increment corresponds to one dose unit of item 3, the selected complexity extension is

$$
\operatorname{CC}_{C}(C)=
\begin{cases}
0,&C\le8,\\
\frac14[1-(9-C)^3],&8<C<9,\\
\frac14,&C\ge9.
\end{cases}
$$

It agrees with every nominal attained aggregate complexity, including unknown compressed descriptions. It satisfies the threshold, right-continuity, monotonicity, concavity and $C^2$-above-threshold requirements of Definition 31 on every bounded-bias branch with $1/4\le\alpha_{\mathrm{CC},\max}<1/2$. Its calibrated ceiling is $\alpha_\infty=1/4$, its declared scale is $C_{\mathrm{scale}}=1$ binary symbol, and $\kappa=1$ for the displayed normalized generator. The midpoint calibration on an enabled valid EXCHANGE diagnostic (for example on $\mu_1$) is exact: three independent half-probability flags give $G(1/2)=7/8$ and response $7/32$.

Theorem 9.7n realizes the selected source-relative Definition 31 extension through the finite paid source instruments specified below. Nominal aggregate complexities and diagnostic dose settings are distinct typed quantities; the continuous dose response is obtained as a calibrated limit of finite source instruments. The construction uses the controlled CPTP probe response of Theorem 9.7l. Identification with a separately nominated baseline presentation requires a presentation-equivalence result.

### II. Complete finite source and accounts

#### A. The source indexed by $n$

For each integer $n\ge0$ set

$$
\begin{aligned}
M=b&=n+1,& D&=2^b,& w&=b+1,\\
d&=\max\{1,\lceil\log_2(M+2)\rceil\},&
a&=\max\{1,\lceil\log_2(M+1)\rceil\},\\
L&=14M+n+2,& c&=\max\{1,\lceil\log_2 L\rceil\},\\
\ell&=4+a+2+c.
\end{aligned}
$$

Here $M$ is the number of available diagnostic stages, $w$ is the width of an unsigned dose/counter field, $L$ is the number of additional paid clock slots, and $\ell$ is the instruction/log width. Everything below, including finite tables and their sizes, is computably determined by $n$. The nominal descriptor contains exactly the inventory index.

The complete old $p=0$ Definition 9.7l.2 assembly, including its $1{,}024$ new cells, $4{,}096$ firmware cells, $64$ slots, three complete $R_{14}$ sources and all their stocks, is retained. Its initial-parity source delivery is unchanged. Its independent probe and fair sign coin remain the original input contracts. Its message is exactly $|0\rangle\langle0|$ at the coupling cut. The sole change to the original interaction is the *additional immutable hard gate* in Section F; the original exchange angle, sign averaging and underlying generator are unchanged. Original source receipt, forecasts, return copies, lock, outcome reads and failure branches all execute.

The added finite controller pauses the original controller after old slot $9$, performs its prelude, then resumes old slot $10$. The three original devices remain in their explicitly supplied ready-isolation regime until old slot $16$ releases their native clocks. Their stipulated $14\tau$ stochastic runs then start at their nominated relative time zero and run unchanged. The $R_{14}$ generator and elapsed running time are preserved during this paid ready holding before release. The existing source already supplies ready holding before old slot $16$; the extra interval is the same supplied holding operation, invoiced below. The added controller pauses again after its stage prelude until old slot $64$, then performs inventory readout and stops. No added output reaches an original module.

The canonical new output bytes are exactly ASCII `CC02v1`, one LF byte, ASCII `{"n":`, the ordinary base-ten expansion of $n$ with no leading zeros (except the single digit `0`), and ASCII `}`. There is no other whitespace, field or payload. The normative decoder of this `CC02v1` namespace is the complete indexed construction in Sections A–H of Part II: it expands that integer into every bank, table, primitive, setting grammar, schedule, initialization, price and local assertion specified here, including the unchanged old source. Thus the finite code denotes the complete apparatus. An integer is not a Boolean, signed numeral, floating-point literal or alternative JSON spelling. Parsing and equality to this literal template give a decidable inverse; distinct $n$ have distinct physical inventory. All expanded tables and stocks are physically purchased at the full counts $N,F$ below. The namespace and its normative decoder are fixed by that construction. The `CC02v1` prefix does not retag or modify any old bare-JSON descriptor.

#### B. Complete indexed additional carrier

All computational cells have zero free Hamiltonian during logic. Every field below is distinct from every old register. A named $q$-bit field means exactly $q$ labeled two-level cells, with unsigned little-endian bit significance; ROM words are serialized most-significant field first.

| Bank | Index set and width | Count | Initial state |
|---|---|---:|---|
| Inventory $I$ and retained inventory pointers $R$ | $I_r,R_r$, $1\le r\le n$ | $2n$ | all zero |
| Current activation flags $A$ | $A_k$, $1\le k\le3$ | $3$ | all zero |
| Fresh coins $C$, retained coin pointers $P$, old-flag copies $H$ | $C_{ik},P_{ik},H_{ik}$, $1\le i\le M$, $1\le k\le3$ | $9M$ | all zero |
| Mode | $\mathrm{MODE}$, two bits | $2$ | `00` nominal |
| Word length | $m$, $d$ bits | $d$ | integer one |
| Immutable increments | $W_i$, $w$ bits, $1\le i\le M$ | $Mw$ | $W_1=eD$; others zero |
| Hard enable | $e$, one bit | $1$ | $e=0$ for $n=0$; $e=1$ otherwise |
| Retained accumulated-dose fields | $J_i$, $w$ bits, $0\le i\le M$ | $(M+1)w$ | all zero |
| Validity/failure history | $V_i,F_i$, $0\le i\le M$ | $2(M+1)$ | all zero |
| Setting lock and terminal stop | $\mathrm{LOCK}_{\mathrm{ADD}},\mathrm{DONE}_{\mathrm{ADD}}$ | $2$ | zero |
| Additional slot counter | $K$, $c$ bits | $c$ | zero |
| Executed-command log | $\mathrm{LOG}_s$, $\ell$ bits, $1\le s\le L$ | $L\ell$ | zero |
| Work receipts | $B_{sj}$, $1\le s\le L$, $1\le j\le3$ | $3L$ | zero, initially degenerate |

The total new non-ROM binary carrier is exactly

$$
N=2n+11M+10+d+(2M+1)w+c+L(\ell+3).
$$

Add exactly $F$ immutable ROM bits, defined in Section D. Thus $B_{\mathrm{add}}=N+F$ prepared and held binary cells are added. The source's separately supplied finite timer/clock and drive package consists of the explicit $K$-register clock, its bounded generator, and the packaged finite services below; these exhaust its workspace. External supply packages have the same nonrecursive packaged-service status as the original source's preflight meter/work supply.

Every unused stage, padding bit, inactive setting and zero outcome remains in the carrier. No run resets or overwrites a history bank. Current $A$ may change, but its previous value is first copied to its fresh $H_i$ bank; the coin, pointer, input setting and previous counter value all remain. All classical XOR updates below are permutations on their *whole* specified carrier, not irreversible assignments.

#### C. Closed physical setting grammar and exact primitives

A physical frame consists of exactly the two-bit $\mathrm{MODE}$ field, the $d$-bit $m$ field, and $M$ dose fields $W_i$ of width $w$, together with the old policy/basis fields. $\mathrm{MODE}=\texttt{00}$ is the nominal protocol; $\mathrm{MODE}=\texttt{01}$ is a separately typed diagnostic protocol. $\mathrm{MODE}=\texttt{10}$ or $\texttt{11}$ is an invalid frame. A diagnostic frame with $m\le M$ supplies fixed doses $y_i=W_i/D$ for $i\le m$, with $0\le W_i\le D$; $W_i=0$ for $i>m$. Values $y>1$ need no larger descriptor because replacing an increment by $\min\{y,1\}$ leaves every clipped accumulated dose unchanged. The nominal frame has $m=1$, $W_1=eD$ and all other $W_i$ zero. The canonical ready descriptor and its assigned nominal response fix old $\mathrm{POLICY}=\mathrm{EXCHANGE}$ and old $\mathrm{BASIS}=\texttt{00}$ (computational readout). Old $\mathrm{POLICY}=\mathrm{OFF}$ remains a separately typed, fully paid comparison instrument, not an alternative assigned nominal CC value.

All inputs are supplied before $\mathrm{LOCK}_{\mathrm{ADD}}$, classical and independent of activation, probe, module noise, future outcomes and prediction histories. They are read-only afterward. There is no opcode that changes $e,W,\mathrm{MODE}$ or $m$, writes an old constituent state, requests another exchange, or releases an original clock early. Outcome-conditioned *read queries* of retained records may form a mathematical response tree; they do not create new active controls. In particular, a policy that adaptively chooses later doses from earlier flag outcomes is not this source and is not admitted under the addition law.

The physical frame has bounded length. An attempted stage budget above $M$ is represented by the reserved length value $M+1$ and is rejected. Other representable $m>M$ values are also rejected. An arbitrarily long external request is not silently stored in this finite apparatus: it is outside the physical frame grammar, and its assertion has false admissibility antecedent unless the caller supplies and pays a separately enlarged apparatus. Rejection never postselects away a physical branch of an admitted frame.

Define the initialization predicate $\chi$ as follows:

1. $\mathrm{MODE}$ is `00` or `01`; $m\le M$; and every $W_i$ with $i>m$ is zero.
2. If $\mathrm{MODE}=\texttt{00}$, additionally $m=1$, $W_1=eD$ and $W_i=0$ for $i>1$.
3. If $\mathrm{MODE}=\texttt{01}$, no extra preflight condition is imposed on active $W_i$; their range errors are retained by their stage $F_i$.

$\mathrm{INIT}$ is the permutation XORing $(\chi,1-\chi,1)$ into $(V_0,F_0,\mathrm{LOCK}_{\mathrm{ADD}})$. These target cells are initially zero. For each stage $i$, define

$$
\begin{aligned}
\mathrm{bad}_i&=(i\le m)\land(W_i>D),\\
F_{\mathrm{new}}&=F_{i-1}\lor\mathrm{bad}_i,\\
V_{\mathrm{new}}&=(i\le m)\land\neg F_{\mathrm{new}}.
\end{aligned}
$$

$\mathrm{VALID}_i$ XORs $(V_{\mathrm{new}},F_{\mathrm{new}})$ into the fresh pair $(V_i,F_i)$. $\mathrm{ACCUM}_i$ XORs into fresh $J_i$ the $w$-bit value

$$
j_{\mathrm{new}}(v,j,z)=
\begin{cases}
\min\{D,j+z\},&v=1,\ j\le D,\ z\le D,\\
j,&\text{otherwise}.
\end{cases}
$$

Here $(v,j,z)=(V_i,J_{i-1},W_i)$. This is a completely specified function on all bit patterns. Since $J_0=0$, every reachable $J_i$ lies in $\{0,\ldots,D\}$. Invalid/inactive stages retain $J_i=J_{i-1}$. The dose counter is not inferred from random outcomes.

$\mathrm{COPYOLD}_{ik}$ is the CNOT $A_k\to H_{ik}$. On the fresh coin $C_{ik}$ define

$$
h(j,z)=
\begin{cases}
\min\{z/(D-j),1\},&j<D,\\
0,&j\ge D,
\end{cases}
\qquad
\theta(j,z)=\arcsin\sqrt{h(j,z)}.
$$

The $\mathrm{COIN}_{ik}$ dimensionless generator, controlled by the classical settings, is

$$
D_{ik}=[V_i=1]\,[H_{ik}=0]\,\theta(J_{i-1},W_i)(I-\sigma_y)_{C_{ik}}.
$$

It is positive with norm $\le\pi$. It is identity on invalid, inactive, already-one and saturated branches. The ideal pulse unitary is exactly $\exp(-iD_{ik})$. For rational $h$, its entries are algebraic:

$$
\exp(-i\theta)=\sqrt{1-h}-i\sqrt h,\qquad
\cos\theta=\sqrt{1-h},\qquad
\sin\theta=\sqrt h.
$$

Thus each source uses a finite table of exact algebraic unitaries. The Hamiltonian angle is a specified computable calibration, of the same ideal-primitive status as the old $\pi/6$ pulse.

$\mathrm{READCOIN}_{ik}$ is the CNOT $C_{ik}\to P_{ik}$ followed by the normalized computational Born pointer instrument on $P_{ik}$. The pointer and both outcomes remain. $\mathrm{FLIPFLAG}_{ik}$ is the CNOT $C_{ik}\to A_k$. Since a coin can be one only when its old flag was zero, this implements the desired persistent OR update without erasure. An already-one flag stays one. Conditional on the predetermined dose counters, the three coin/history chains are independent; the original sign coin and probe remain independent of them.

$\mathrm{INVREAD}_r$ is the CNOT $I_r\to R_r$ and the same normalized pointer instrument. $\mathrm{STOP}$ is $X$ on $\mathrm{DONE}_{\mathrm{ADD}}$. The immutable $e$ bit and its gate have no write/bypass port. The original setting and forecast locks retain their original meaning.

Every XOR-permutation $W$ just specified is an explicit finite involution, with supplied generator $\pi(I-W)/2$. Its norm is $\le\pi$. $\mathrm{INIT}$, $\mathrm{VALID}$ and $\mathrm{ACCUM}$ have the complete finite truth tables in Section D and exact permutation action

$$
(\mathrm{control},\mathrm{target})\longmapsto
(\mathrm{control},\mathrm{target}\mathbin{\mathrm{XOR}}\mathrm{table}(\mathrm{control})).
$$

Equivalently their generator is the direct sum over *all* control basis strings of the stated target-XOR permutation generator. The decoder exposes exactly these table-defined primitives, CNOT, the stated pulse family, pointer instrument and clock. Their additional tables and controlled-source services are purchased under the account below.

#### D. Exact immutable firmware census and instruction bytes

Let $\operatorname{dec}(q)$ be the ordinary base-ten expansion of a nonnegative integer without leading zeroes. The header is the following ASCII string, with the displayed key order, no spaces/newline, and a final semicolon:

`CC02-PAID-v1;n=<n>;M=<M>;b=<b>;D=<D>;w=<w>;d=<d>;a=<a>;L=<L>;c=<c>;ell=<ell>;`

Angle brackets are replaced by $\operatorname{dec}(\mathrm{value})$. Write $H_n$ for eight times its exact byte length.

Every instruction has fixed fields $\mathrm{opcode}[4]$, $\mathrm{index}[a]$, $\mathrm{chain}[2]$, $\mathrm{successor}[c]$. The unsigned word value is

$$
\mathrm{opcode}\,2^{a+2+c}+\mathrm{index}\,2^{2+c}
+\mathrm{chain}\,2^c+\mathrm{successor}.
$$

Opcodes $0,\ldots,9$ mean, in order, $\mathrm{IDLE}$, $\mathrm{INIT}$, $\mathrm{VALID}$, $\mathrm{ACCUM}$, $\mathrm{COPYOLD}$, $\mathrm{COIN}$, $\mathrm{READCOIN}$, $\mathrm{FLIPFLAG}$, $\mathrm{INVREAD}$, $\mathrm{STOP}$. All other opcode/port combinations are invalid and have no exposed write port. $\mathrm{index}$ is the stage $i$ or inventory address $r$; $\mathrm{chain}$ is $1,2,3$ for chain operations and $0$ otherwise. Successor is $s$ for slot $s<L$ (counter value $s$ selects slot $s+1$), and zero at slot $L$, when $\mathrm{DONE}_{\mathrm{ADD}}$ prevents wrap execution. There is no runtime writable instruction memory.

The schedule has these exact rows:

- $s=1$: $\mathrm{INIT}$, $\mathrm{index}=0$, $\mathrm{chain}=0$.
- For $i=1,\ldots,M$ let $t_i=2+14(i-1)$. At $t_i$ use $\mathrm{VALID}(i,0)$; at $t_i+1$ use $\mathrm{ACCUM}(i,0)$.
- At $t_i+1+k$, $k=1,2,3$, use $\mathrm{COPYOLD}(i,k)$.
- At $t_i+4+k$, $k=1,2,3$, use $\mathrm{COIN}(i,k)$.
- At $t_i+7+k$, $k=1,2,3$, use $\mathrm{READCOIN}(i,k)$.
- At $t_i+10+k$, $k=1,2,3$, use $\mathrm{FLIPFLAG}(i,k)$.
- At $s=14M+1+r$, $r=1,\ldots,n$, use $\mathrm{INVREAD}(r,0)$.
- At $s=L=14M+n+2$ use $\mathrm{STOP}(0,0)$.

In every row use the successor above. For $n=0$ the inventory range is empty; there is still a $\mathrm{STOP}$ row. The stage block ends at $14M+1$ without an off-by-one slot.

The ROM is the concatenation, in order, of the header, $L$ instruction words, and these truth/calibration blocks. Within each table, input bit strings are in increasing unsigned order and output fields in displayed order. Fixed-width integer outputs are padded with zero high bits.

1. $\mathrm{INIT}$: all $k_{\mathrm{in}}=3+d+Mw$ input bits $(\mathrm{MODE},m,e,W_1,\ldots,W_M)$; two output bits $(\chi,1-\chi)$. Size $T_0=2\cdot2^{k_{\mathrm{in}}}$.
2. $\mathrm{VALID}$: for $i=1,\ldots,M$, all $1+d+w$ input bits $(F_{\mathrm{prev}},m,W_i)$; two outputs $(V_{\mathrm{new}},F_{\mathrm{new}})$. Size $T_v=2M\cdot2^{1+d+w}$.
3. $\mathrm{ACCUM}$: all $1+2w$ input bits $(v,j,z)$, $w$-bit output $j_{\mathrm{new}}$. Size $T_a=w\cdot2^{1+2w}$.
4. $\mathrm{COIN}$ calibration: all $2w$ input bits $(j,z)$, two $w$-bit integers $(k,r)$. For $j<D$ set $r=D-j$ and $k=\min\{z,r\}$; for $j\ge D$ set $(k,r)=(0,1)$. The exact angle tag is the fixed decoder formula $\arcsin\sqrt{k/r}$. No denominator is omitted. Size $T_q=2w\cdot2^{2w}$.

Therefore the *exact physical firmware bit count* is

$$
F=H_n+L\ell+2\cdot2^{3+d+Mw}+2M\cdot2^{1+d+w}
+w\cdot2^{1+2w}+2w\cdot2^{2w}.
$$

The decoder is fixed by the numerical opcode meanings and these direct-sum matrices. Table lookup is a supplied finite controlled-source operation on the named immutable input sectors; no arithmetic interpreter, scratch register or hidden history is needed at runtime. The full truth-table stock is paid at its displayed size. Source synthesis/delivery and the bounded matrix-driving package are included in the positive service invoice below, exactly as the old finite source buys its fixed calibrated gates and decoder.

#### E. Slot timing and the full resource account

Each added slot lasts exactly $\tau$, divided into the same $16$ subslots as Definition 9.7l.2. Native logic uses subslot $1$ with its normalized smooth pulse envelope; the pointer instrument, where present, occurs in subslot $2$ under the same paid readout service. No other native logic runs in that subslot. Subslots $4,5,6$ flip the three fresh receipt cells; subslots $7,8,9$ raise their gaps by the original half-cosine profiles to $5E,5E/2,5E/2$. This transfers exactly $10E$ per slot to retained receipts. There is a separate purchased finite operating-work supply of capacity $10LE$. This is the source of the *same* $10LE$ native-service/work invoice, not a second consumed invoice.

In subslot $10$, copy the $\ell$-bit immutable schedule word to fresh $\mathrm{LOG}_s$ using $\ell$ parallel disjoint-target CNOTs, controlled by the current counter sector. This records every identity, inactive, invalid and zero-probability setting slot as well as every successful one. The generator norm is $\le\ell\pi$. In subslot $16$ advance the $c$-bit $K$ register by the $L$-cycle $0\to1\to\cdots\to L-1\to0$, with identity on every padding state $L,\ldots,2^c-1$. Its fixed discrete-Fourier spectral logarithm on the $L$-dimensional block, and zero generator on the padding block, uses phases in $[0,2\pi)$ and has norm $<2\pi$. This exactly matches every ROM successor, including terminal successor zero. Only the first $L$ counter states are reachable; $\mathrm{STOP}$ prevents another episode, but its own current slot still completes its receipt, log and counter-advance subslots before the terminal guard takes effect. The pause guards are the following explicit read-only predicates of the existing counters and terminal latches. Write $K_{\mathrm{old}}$ for the zero-based old counter (value $9$ selects old slot $10$), $\mathrm{DONE}_{\mathrm{old}}$ for its original terminal latch, and $P=14M+1$. At the entry of an atomic $16$-subslot package set

$$
\begin{aligned}
\mathrm{ADD}_{\mathrm{enable}}
&=\neg\mathrm{DONE}_{\mathrm{ADD}}\land
\bigl[(K_{\mathrm{old}}=9\land K<P)
\lor(\mathrm{DONE}_{\mathrm{old}}\land K\ge P)\bigr],\\
\mathrm{OLD}_{\mathrm{enable}}
&=\neg\mathrm{DONE}_{\mathrm{old}}\land
\bigl[(K_{\mathrm{old}}<9)\lor(K\ge P)\bigr].
\end{aligned}
$$

Compose $\mathrm{OLD}_{\mathrm{enable}}$ with the old native $14\tau$ $R_{14}$-wait guard. Each enable gates the *whole* corresponding package, including its native action, receipt/log subslots and counter advancement; a disabled package does not advance its counter. Evaluate the guard at package entry only: the selected current package finishes all $16$ subslots before the next entry decision, even when its $\mathrm{STOP}$ action sets a terminal latch. These are the declared finite clock/atomic-package controls on the named registers, with no new runtime workspace. After old slot $9$, $K_{\mathrm{old}}=9$ and $K=0$, so only the $P$-package added prelude runs; when $K=P$, only old slots $10$–$64$ can run, with the original $14\tau$ waiting guard after old slot $16$. $\mathrm{DONE}_{\mathrm{old}}$ then enables the added inventory/$\mathrm{STOP}$ tail. At the end both terminal latches prevent another package. Thus the old controller, its counter and its exchange generator are paused during the prelude. Invalid physical input frames use the defined identity native branches but still log, receipt and advance through the complete scheduled episode to the terminal stop. Corrupted ROM or a nonzero initial counter is not an admitted preparation; the explicitly defined padding action completes the matrix on those sectors.

Retain $E\tau\ge10^4\hbar$. The original $32E$ peak reservation remains owned. Add a distinct peak drive reservation $P_{\mathrm{add}}=32(1+\ell)E$. It bounds the $\ell$ parallel record copies, native bounded generators, counter and receipt combinations with ample slack under the same smooth envelope. A peak reservation is standing capacity, not additional consumed work. The added operating work stock is finite and positive even for the all-OFF $n=0$ episode.

The complete episode duration is $T_n=(78+L)\tau$. The additional prelude lasts $(1+14M)\tau$ and the terminal addition lasts $(n+1)\tau$. All added bits are purchased before the episode and held throughout $T_n$; all old aggregate bits and complete constituent apparatuses remain present until its end. The old $14\tau$ runs, original operations and their original service charges are not counted a second time.

At the original $E/128$ preparation price and $E/(128\tau)$ bit-holding rate, set $B_{\mathrm{add}}=N+F$. The extra consumed source invoice, above the complete old account, is the ordered pair $(\Delta Q_E E,\Delta Q_R R)$, with

$$
\begin{aligned}
\Delta Q_E&=\frac{B_{\mathrm{add}}}{128}
+\frac{B_{\mathrm{add}}(78+L)}{128}
+\frac{5120L}{128}+(1+B_{\mathrm{add}})+10L,\\
\Delta Q_R&=3L(6978+68\cdot2^{72}+2^{1332})+3L.
\end{aligned}
$$

$E$ and $R$ are distinct units and are not added. A scalar total is formed only after applying the registered strictly positive $E$-per-$R$ conversion price.

Its terms respectively purchase every added bit, hold every added bit throughout the full run, extend holding of all $5{,}120$ old aggregate cells/ROM bits, buy source preparation/controller/table-calibration/input-setting delivery, execute every added slot, and hold all three complete $R_{14}$ registers/ROM plus their three finite timer packages for the extra $L$ time units. The strictly positive service $E(1+B_{\mathrm{add}})$ owns delivery of the exact finite tables, calibrated pulse/decoder package, initialization, all fixed-word settings and their correlation/independence contract. This adopted finite source-service tariff uses the original packaged finite external metering and billing service.

The full paid account is: the unchanged original $8921E$; the original constituent purchase/original-run fees and $20E$ main/verifier allocations; the original $R_{14}$ holding extension $3\cdot64(6978+68\cdot2^{72}+2^{1332})R+192R$; $\Delta Q_n$; the old $32E$ and new $P_{\mathrm{add}}$ standing peak capacities. It retains any original separately purchased core-service reserve. If the utility comparison is reused with the enlarged apparatus, its conservative $r$ must be enlarged to include $\Delta Q_n$ after the registered positive $E/R$ conversion, and the corresponding $2r$ reserve must actually be purchased. The old numerical $r$ does not pay new services. Reserves are capacities, never duplicated consumed invoices.

No failure, zero flag, invalid frame, saturated increment, OFF policy, unused cell or nominally unnecessary diagnostic slot receives a discount or is removed from the state. A failed frame runs the same duration, retains its settings, logs, pointers, $F_i$ and receipts, executes the unchanged original predictive experiment, and has no added exchange.

#### F. Hard-enabled interaction and exact finite responses

Replace only the original slot-$10$ generator by

$$
[e=1]\,[F_M=0]\,[\text{old }\mathrm{POLICY}=\mathrm{EXCHANGE}]
\,[\neg(A_1=A_2=A_3=0)]\,D_{\mathrm{old}},
$$

where $D_{\mathrm{old}}$ is exactly the original sign-controlled generator on probe, message and sign with angle $\pi/6$. The control factors commute and its norm is no larger than $\pi/3$. The old independent sign coin is neither read nor postselected. No other opcode couples probe to message. Consequently **every admitted frame of $\mu_0$ has identically zero exchange**, including every diagnostic, malformed and fractional-dose frame. There is no operator that can rewrite or bypass $e$.

For every valid predetermined diagnostic word put $x_i=J_i/D$. The coin update is $h_i=\min\{(W_i/D)/(1-x_{i-1}),1\}$ until saturation. On each chain,

$$
\Pr(A_k\text{ remains zero through }i)=1-x_i,
$$

by induction, including zero increments, saturation, inactive stages and already-one branches. Conditional coin preparation and retained pointer instruments implement exactly this ordinary stochastic recursion. Chains remain independent, giving activation probability $1-(1-x_m)^3$. For $n\ge1$ with the old $\mathrm{POLICY}=\mathrm{EXCHANGE}$ the original partial exchange therefore gives gain $[1-(1-x_m)^3]/4$; the hard-disabled $n=0$ source gives zero regardless of its diagnostic fields.

For the fixed *nominal* source frame, $\mu_0$ has gain zero and every $\mu_n$ with $n\ge1$ has $W_1=D$, deterministic all-one flags and gain exactly $1/4$. Diagnostic readings are tagged diagnostic instruments and never entered as fractional-complexity values of nominal aggregates. The original predictive laws, all failures, return marginals and terminal guard remain unchanged. Inventory outputs have their physical $n$-cell cardinality and retained $n$-pointer record; different $n$ are complete-source distinguishable even when reduced nominal probe responses coincide.

#### G. Finite precision and the continuum limit

A fixed $\mu_n$ supports its finite predetermined dyadic setting grammar and a finite computable table of ideal matrix calibrations. The new exact unitary entries and finite controlled-instrument coefficients, conditional on inherited source data, are algebraic, so their local equalities and finite-history calculations have effective exact semantics. The full aggregate retains the original $R_{14}$ stochastic waiting laws with their existing coefficient/assertion semantics; the algebraicity assertion applies to the added instrument.

For any fixed finite nonnegative real word $(y_1,\ldots,y_m)$, first clip each $y_i$ to at most one. For $n$ with $M\ge m$, choose integers $0\le W_i\le D$ satisfying $|W_i/D-y_i|\le1/D$, set the remaining $W_i$ zero, and use diagnostic mode. The choice $W_i=\lfloor Dy_i\rfloor$ proves existence. For effective inputs, take a certified rational enclosure of each clipped $y_i$ of width at most $1/(2D)$, round its rational midpoint to the nearest multiple of $1/D$ (with a fixed rational tie rule), and clip the resulting integer to $[0,D]$. This finite procedure has error at most $1/(4D)+1/(2D)=3/(4D)$ and hence meets the stated $1/D$ bound. The clipped sums differ by at most $m/D$, uniformly over the real word. The activation estimate below holds for every $n\ge0$ with $M\ge m$; the gain estimate compares valid EXCHANGE diagnostics on the cofinal enabled family $n\ge\max\{1,m-1\}$ with its enabled probe limit. Matched OFF controls have identically zero gain. Therefore

$$
|G_n-G|\le\frac{3m}{2^{n+1}},\qquad
|\mathrm{gain}_n-\mathrm{gain}|\le\frac{3m}{4\cdot2^{n+1}}.
$$

The schedule is uniform over finite grid words. Effective grid-word selection uses the certified rational enclosures specified above. A specified error $\epsilon>0$ for a fixed word is reached once $M\ge m$ and $3m/2^{n+1}\le\epsilon$, with $n\ge1$ for the enabled EXCHANGE probe/gain comparison. If words may grow to the full capacity, the uniform error bound is $3(n+1)/2^{n+1}$, which still tends to zero. The limiting exact addition/composition law follows from these finite retained response identities and continuity. The limit extends the diagnostic dose response while preserving the nominal $C_P$ assignment.

For numerical implementation of the *finite ideal apparatus* $\mu_n$ at fixed $n$ and integer $k\ge1$, use a separately typed paid synthesis accessory. Let $q=k+\lceil\log_2(64M)\rceil$. Replace each ideal table angle by a multiple of $\pi/2^q$ within $\pi2^{-q}$; force exact entries $0$, $\pi/4$ when $h=1/2$, and $\pi/2$ when $h=1$. This is uniformly computable by certified rational evaluation/bisection of the finite rational-pair table. Midpoint rounding of an enclosure of $\theta/\pi$ of width $\le2^{-q-2}$ gives the stated bound at every rounding boundary. The $q$-bit coefficient $a$ is stored for each of the $2^{2w}$ $(j,z)$ rows; its pulse is $(\pi a/2^q)(I-\sigma_y)$. This table has exactly $Q=q\cdot2^{2w}$ bits. Its finite precision tag is the canonical Elias-gamma code $\gamma(k)$, of length $g(k)=2\lfloor\log_2 k\rfloor+1$. The immutable coefficient table is never overwritten.

The numerical accessory has exactly $Q+g(k)$ additional descriptor/ROM bits and no runtime arithmetic workspace: it substitutes the specified direct-sum calibrated pulse block at each $\mathrm{COIN}$ slot. It is prepared before the run, held for $(78+L)\tau$ and pays positive preparation, holding and source calibration/delivery service:

$$
\left[\frac{Q+g(k)}{128}+\frac{(Q+g(k))(78+L)}{128}
+1+Q+g(k)\right]E.
$$

All original/additional slots, receipts, stocks and peak bounds are still paid. The finite pulse-table synthesis is part of that supplied external preparation/calibration service. If one instead implements synthesis as an active computation on the apparatus, that is a different source and its actual compiler tape/clock/work trace must be added; none is admitted by this nominal decoder. This is the same separation between declared supplied calibration and an internally executed compiler used by the old $\pi/6$ source primitive.

For each implemented coin, the generator error is $\le2\pi2^{-q}$, and the unitary error is no larger. There are exactly $3M$ coin slots, including identities. Uniform direct-sum bounds therefore give whole-unitary error $\le6\pi M2^{-q}$ and full retained instrument diamond error $\le12\pi M2^{-q}<2^{-k}$. Fixed control, copying, pointer dilations, records, invalid and hard-disabled sectors are included. Pointer measurement is contractive, so the bound persists after any retained readout or spectator extension. If any other gate is approximated, give its paid implementation a separately recorded $\epsilon_j$ and add $2\sum_j\epsilon_j$ to the channel bound. Endpoints remain exact in the stated angle approximation, hence nominal gain and the dyadic half-dose calibration are not spoiled.

The coefficient table is finite for every $(n,k)$, and every source-dependent cost is explicit. Increasing $n$ or $k$ requires purchasing the corresponding larger source/accessory; its cost is the displayed function of $n,k$.

#### H. Source assertions and scope

Append these output-extensional local owner families only to the new tagged aggregate branch: exact indexed stocks/header/tables; nominal and diagnostic typing; immutable setting/hard gate; finite primitive matrices; timing and original-port guards; every retained-history response; positive complete accounts; numerical instrument/error instances. Enumerate their finite payloads in length/lexicographic order exactly as the existing source does. Runtime/out-of-budget source obligations use the explicit closed grammar above; rejected physical frames retain the displayed failure response. The constructor theorem is by finite table substitution, induction in $i$, matrix composition and the billed inventory sum. No owner depends on $C_P$, source qualification or the selected Definition 31 extension. Old output tags continue to invoke only their unchanged old full hierarchy.

The construction supplies an indexed finite carrier, exact immutable schedule/word grammar, complete finite control/calibration tables including rational hazard denominators, hard-disabled $\mu_0$, all-input/zero/failure retention, temporal guards and paid ready isolation, full preparation/holding/service/supply/peak account, and uniform finite setting/pulse approximation bounds.

#### I. Finite consistency checks

The bank sum, row encoding and rational three-chain transition recursion give the following exact finite accounts. Their general form follows from the induction above.

For $n=0$ the account gives $M=1$, $L=16$, $\ell=11$, $N=257$, $F=1080$ and $B_{\mathrm{add}}=1337$. For $n=1$ it gives $M=2$, $L=31$, $\ell=13$, $N=552$, $F=5979$ and $B_{\mathrm{add}}=6531$. These counts include the complete truth tables.

### III. Common presentation and full-hierarchy proof

#### Exact source syntax

Write $\nu_h$ for the byte-identical original $R_h$ descriptor and $\mu_n$ for the new aggregate descriptor. No new tag is inserted into $\nu_h$. Encode $\mu_n$ by the exact ASCII bytes `CC02v1`, one LF byte, the literal `{"n":`, the ordinary decimal expansion of $n$ with no leading zeroes except the single digit `0`, and the literal `}`. The fixed normative decoder expands this index into the entire source apparatus and its physical stocks; the encoding does not assign those stocks the cost of one integer. The original $\nu_h$ is the unchanged bare canonical JSON of Definition 2.4.1g, so the two formats are disjoint. The finite canonical language has a total decoder on its range: it first distinguishes the existing JSON format from the new header, then reads the nonnegative capacity index and reconstructs the complete specified constructor. A candidate descriptor is canonical exactly when its entire byte sequence equals the reconstructed canonical sequence. The normative expansion is the complete fixed source construction, not a user-supplied partial dictionary or arbitrary executable payload. All owner assertions are checked on that expansion. An altered controller, clock, primitive or resource count is not the source represented by this code; equality of a scalar response alone never suffices.

Fix the same optimal partial prefix machine $V$ as Definition 2.4.1g, the binary program alphabet, and empty reference auxiliary input. For a positive integer $r$, write its binary representation as $b(r)$ and define the Elias $\gamma$ code $\gamma(r)=0^{|b(r)|-1}b(r)$. Its length is $2\lfloor\log_2 r\rfloor+1$ and its code set is prefix-free. Define the full partial prefix machine by

$$
\begin{aligned}
U_C(0\gamma(h+1),z)&=\nu_h &&(h\ge0),\\
U_C(\texttt{10000000},z)&=\mu_0,\\
U_C(\texttt{11000000}\gamma(n),z)&=\mu_n &&(n\ge1),\\
U_C(1^{16}0p,z)&=V(p,z).
\end{aligned}
$$

Whole-string constructor parsing rejects trailing bits. All other syntax is undefined. The four branches are prefix-disjoint, distinguished by `0`, `10`, `110` and `111`. The universal branch retains its fixed seventeen-bit overhead, so $U_C$ remains optimal. Source constructor descriptions may be short, but their decoded physical firmware, registers and services retain the full sizes and charges in Section II. No code-length quantity is substituted for apparatus inventory.

For a $\nu_h$ descriptor use precisely Definition 2.4.1g's inherited owner grammar and proofs. For $\mu_n$ use these seven added ownership classes:

1. The three physical $R_{14}$ sources, their shared parity-conditioned initial law at $p=0$, original marginals, original predictive task and protected time ordering.
2. The unchanged Definition 9.7l.2 parity/probe assembly, angle $\pi/6$, fair independent sign coin, and the exact nominal OFF/ON hard-enable rule.
3. Added inventory, finite precision and stage capacities, fixed zero/ready states, finite settings and dose-counter types, and complete controller/firmware descriptors.
4. The finite controlled-generator matrices, their supported ports and clocks, the retained pointer instruments, and no predictor-input feedback.
5. Every full finite allowed history, including dose-setting validity, saturation, identity, failure, pointer, old-flag and spent-message branches.
6. Exact nominal and diagnostic source-to-response maps, independently calibrated single-flag probabilities, conditional composition and all probe/reference effects.
7. Every prepared, idle, held, read, driven, firmware, clock and external-service stock, with once-only costs and the source's out-of-budget rejection rule.

The owner inventory is the fixed finite *schema* list for this source branch. Descriptor and primitive owners have rank zero; finite supported source maps and clock wiring rank one; composition and retained histories rank two; response, prediction and resource consequences rank three. Dependencies within this constructor are to lower-rank owners, with finite-word induction confined to its explicit word-length parameter. The inherited $R_h$ leaves retain their original dependency order. Logical arithmetic, finite sets, finite-dimensional matrices and induction are the metatheory, not additional unlisted physical supplies.

#### A total generated assertion hierarchy

Enumerate finite binary strings in length-lexicographic order. An assertion payload specifies a local owner equality, an eligible finite protocol word or retained-readout adaptive finite tree, an algebraic matrix coefficient, an original $R_h$ semigroup coefficient, a response/effect coefficient, or an indexed resource/cost entry. Invalid payloads repeat the type-and-canonical-descriptor assertion. The added dose-setting word and hard-enable are immutable inputs independent of activation, probe and predictor histories; no adaptive readout tree can write them. Bounds and typing are part of each assertion: an over-capacity input returns its declared failure response, not an unsupported successful protocol.

For each returned source code the generator's assertion is a total finite symbolic check, or a proved schema instance with the explicitly indexed induction certificate. Finite added rotations have algebraic unitary entries even though a principal-log Hamiltonian can contain a symbolic inverse-trigonometric constant. Original $R_h$ waiting laws use their existing coefficient/semigroup proof, not undecidable equality of arbitrary real expressions. This gives a total effective assertion generator with every finite admitted owner instance included.

Use a cumulative bounded simulation of $U_C$, with each virtual step finite. Define $L_j^C$ as the programs which have not returned by step $j$ or whose returned descriptor satisfies the first $j$ assertions. The simulation is cumulative and the assertion lists are initial segments, so

$$
L_{j+1}^C\subseteq L_j^C.
$$

For a fixed finite program and $j$ the membership test terminates. All constructors satisfy all assertions by the inherited source proof, the explicit finite matrix dilation and induction on added protocol words. They therefore belong to every $L_j^C$, including stages before the constructor returns. Noncanonical halted outputs fail the canonical descriptor assertion after a finite stage. Nonhalting programs remain admissible but cannot realize a source output.

For every full-admissible canonical $\nu_h$ or $\mu_n$, admission is output-extensional. Any $U_C$ program returning that exact output satisfies the same assertions. Consequently its full complexity is the minimum of all prefix descriptions of that descriptor; the optimal universal tail is included without filtering.

#### Exact old-source transfer

The machine $U_C$ agrees with $U_R$ on every original $0\gamma(h+1)$ constructor and the entire universal branch $1^{16}0p$. The new `10000000` and $\texttt{11000000}\gamma(n)$ branches return only $\mu$-tagged descriptors. Therefore, for every $h$, the complete set of programs returning $\nu_h$ is exactly the same under both machines. Its owner assertions, physical source and full-admissibility status are also unchanged. The preserved objects are the full realizer sets and full hierarchy intersections; virtual-step timing and finite-stage membership belong to each interpreter's enumeration. Hence

$$
C_P^C(\nu_h)=C_P^R(\nu_h)
$$

for every $h$, not only $h=14$. The original predictive source task and MPU minimality of $R_{14}$ therefore transfer to the same $U_C$ presentation. A new aggregate constructor has length at least eight, so it cannot add a shorter qualifying component-task source.

#### Exact aggregate threshold

For the aggregate task, the initial source contains the three distinct registered future-outcome fields of Corollary 9.7l.1 and returns their protected parity forecast before reading them. Its margin is the original lower bound greater than $1/4096$. Every $\mu_n$ has that entire unchanged source and return, regardless of its isolated additional response apparatus. It therefore qualifies.

A $\nu_h$ descriptor is not an aggregate-task source: its contract has one original two-step environment, not the three source-indexed target fields, their common parity target and protected aggregate return. Its source type cannot be reinterpreted as a three-source aggregate without changing its descriptor and source maps. Thus the qualifying full-domain aggregate class is exactly the $\mu_n$ family. A program shorter than eight either does not halt or returns only a $\nu_h$ with $h\le6$; it cannot return $\mu_n$. The eight-bit program `10000000` returns qualifying $\mu_0$, which establishes the source-relative task infimum:

$$
C_{\mathrm{op}}^C=8.
$$

At nine bits `110000001` returns $\mu_1$, and no shorter code returns it. For every $n\ge1$, all shorter-than-nine strings are either undefined, original $\nu_h$ constructors or the different $\mu_0$ constructor. Thus

$$
C_P^C(\mu_1)=9,\qquad C_P^C(\mu_n)\ge9\quad(n\ge1).
$$

Every $\mu_n$ has a finite full realizer.

The attained aggregate complexities are unbounded. For any finite $B$ there are only finitely many binary programs of length at most $B$, hence only finitely many outputs with complexity at most $B$. The canonical $\mu_n$ are infinitely many distinct outputs, so some have complexity above $B$. This establishes an unbounded attained source family without computing which index first reaches a given complexity. Since every attained value above eight already has response $1/4$, the ceiling $1/4$ is also the asymptotic value along the attained complexity family.

#### Plateau compatibility with optimal compression

The nominal response is zero on $\mu_0$ and exactly $1/4$ on $\mu_n$ for $n\ge1$. The declared cubic extension is zero at $C=8$ and already equals $1/4$ for every $C\ge9$. Hence it agrees with *every* unknown optimal description minimum in the full aggregate family. Compression cannot move $\mu_n$ across the protected finite threshold. This is a noninjective plateau law and cannot be inverted to compute unbounded prefix complexity.

### IV. Finite composition and continuous-extension proof

#### Finite controls and exact marginal law

For $\mu_n$ let $b=M=n+1$ and $D=2^b$. The entire setting word is preloaded, classical, independent of the probe, original predictive noises and all activation histories, and immutable during the run. No admitted control writes those settings or the hard-enable. There are $M$ stage settings $W_i$ in the finite integer range $0,\ldots,D$ and complete retained accumulated-dose records $J_i$, with $J_0=0$ and

$$
J_i=\min\{D,J_{i-1}+W_i\}
$$

on valid histories. Invalid settings retain their failure record, do not invent a dose, and disable the nominal exchange. Section II specifies the full finite controller and stock census.

For each of three activation flags, stage $i$ flips a still-zero flag with the finite calibrated probability

$$
h_i=\begin{cases}
\min\{W_i/(D-J_{i-1}),1\},&J_{i-1}<D,\\
0,&J_{i-1}=D.
\end{cases}
$$

An already-one flag remains one. Independent fresh coin preparations realize the three conditional flips by bounded rotations, with the actual pointer instruments retaining the coin outcomes. Every setting and counter value is finite. Each coin unitary has algebraic entries obtained from the rational $h_i$, and its positive constant-duration generator is explicitly defined by $\theta_i=\arcsin\sqrt{h_i}$. Each $\mu_n$ therefore uses a finite list of source primitives.

Inductively, for one flag the probability of remaining zero after stage $i$ is

$$
\left(1-\frac{J_{i-1}}D\right)(1-h_i)
=1-\frac{J_i}D.
$$

At saturation both sides are zero; before saturation it is direct cancellation, including $W_i=0$. The three complete flag histories are independent conditional on that data-independent supplied classical setting word. This assertion does not extend to postselected or flag-adaptive dose words. Consequently

$$
\Pr(A_1=A_2=A_3=0)=\left(1-\frac{J_M}D\right)^3.
$$

For valid diagnostics on hard-enabled sources $n\ge1$ with the old $\mathrm{POLICY}=\mathrm{EXCHANGE}$, the unchanged sign-averaged exchange therefore yields

$$
L_{n,W}(X)=\frac14\left[1-\left(1-\frac{J_M}D\right)^3\right]
\bigl(\operatorname{tr}(X)|0\rangle\langle0|-X\bigr).
$$

Every input reference is retained through the same controlled-dilation calculation. The operational norm is its displayed scalar coefficient, attained on $|1\rangle\langle1|$ and effect $|0\rangle\langle0|$. On $\mu_0$ the immutable hard-enable is zero and every admitted protocol has zero exchange response, even if a diagnostic setting is presented.

#### Exact physical composition on the dyadic domains

Let $x$ and $y$ be nonnegative dyadic doses on the same grid. Their finite operation is the actual sequential conditional update above, with the accumulated-dose record retained. After the concatenated word the complement is

$$
S(x+y)=\bigl(1-\min\{x+y,1\}\bigr)^3.
$$

Each fresh-dose calibration has $S(x)=(1-\min\{x,1\})^3$. Hence

$$
S(x+y)=\left[\max\{S(x)^{1/3}+S(y)^{1/3}-1,0\}\right]^3.
$$

The cubic nilpotent triangular norm is the composition law of the activation/source-control instrument before the one final exchange.

#### Compatibility of finite refinements

Pass from grid $b$ to $b+1$ by mapping $W_i$ to $2W_i$ and $J_i$ to $2J_i$. On every common finite stage prefix, the ratios $W_i/(D-J_{i-1})$ and the saturation tests are unchanged. Thus the calibrated coin rotations, classical flag transitions and common pointer-history instruments are exactly the same on corresponding inputs for every $n\ge0$. The counter arithmetic intertwines integer doubling. Equality of the final probe/reference exchange additionally requires matching the effective exchange-enable and policy: it holds for corresponding EXCHANGE inputs on the enabled pairs $\mu_n,\mu_{n+1}$ with $n\ge1$, or for matched OFF controls. The $n=0$ to $n=1$ EXCHANGE pair is not a universal probe-response refinement edge. The larger apparatus retains its added unused stocks and extra counter/zero-dose records, all of which remain paid.

The comparison is the named common response/history projection, not equality of complete differently sized physical inventories or costs. Extra stages are padded by zero dose and do not change any activation history; they preserve the probe response under the same matched exchange-enable and policy condition. Their clocks and records still exist. The original predictors keep their registered relative start/run/lock times; holding them ready for the added prelude incurs the source-account holding charge rather than altering their native kernels.

#### Quantitative continuous limit

Fix a finite real word of $m$ nonnegative doses $y_1,\ldots,y_m$. Doses beyond one may be clipped at one without changing any later saturation outcome. For the enabled EXCHANGE probe limit choose $n\ge\max\{1,m-1\}$, so $M=n+1\ge m$; activation/history-only approximation also allows $n=0$ when $M\ge m$. Set

$$
y_i^{(b)}=2^{-b}\lfloor2^b\min\{y_i,1\}\rfloor,
$$

and pad the remaining stages with zero. The floor choice supplies the existence witness. For an effectively specified input, take a certified rational enclosure of width at most $1/(2D)$, round its midpoint to the nearest dyadic grid point with a fixed rational tie rule, and clip to $[0,1]$. The resulting error is at most $3/(4D)$, hence at most $1/D$; all bounds below apply to either choice and do not require downward rounding. Clipping and addition give

$$
\left|\min\left\{\sum_i y_i^{(b)},1\right\}-\min\left\{\sum_i y_i,1\right\}\right|
\le m2^{-b}.
$$

The function $G(x)=1-(1-\min\{x,1\})^3$ is Lipschitz with constant three, so the activation error is at most $3m2^{-b}$, the operational-norm coefficient error at most $3m2^{-b}/4$, and the probe-channel diamond error at most $3m2^{-b}/2$. These bounds are uniform in the particular finite real word, for its fixed length $m$. They do not require a bound on derivatives of the conditional ratio near saturation.

For the retained abstract first-activation history, let $C_i=\min\{\sum_{j\le i}y_j,1\}$. One flag's first-activation law has masses $C_i-C_{i-1}$ for stages $i$ and $1-C_m$ for no activation. If $C_i'$ are the dyadic counterparts, the total variation distance is at most $\sum_i|C_i-C_i'|$, hence at most $m(m+1)2^{-b}/2$. The product of three histories has total variation at most three times this bound. On the cofinal enabled comparison domain with matched EXCHANGE policy, or for matched OFF controls, conditional probe operations are identical given the histories, so their joint classical-history/probe instruments inherit the corresponding channel bound. The preceding history-only total-variation bound holds for every $n\ge0$ with sufficient stage capacity. The comparison is made on the calibrated abstract dose/history projection of the raw setting-register bit strings.

Finite implementation error is separate. If each dilated gate has operator error $\epsilon_j$, telescoping bounds the full instrument diamond error by $2\sum_j\epsilon_j$, uniformly on every retained branch and spectator. Adding this to the dyadic bound provides an explicit approximation schedule. Each finite schedule has finite paid apparatus, precision, clock and record resources; those resources may grow without a uniform bound in the limit.

The dyadic domains remain dense on the cofinal family $n\ge1$. Common-prefix activation/history maps agree exactly under refinement for all $n\ge0$; probe/reference response maps agree on the enabled family with matched EXCHANGE policy, or for matched OFF controls. The displayed uniform bounds on the enabled family determine the unique continuous normalized response function of the calibrated dose:

$$
G(x)=1-(1-\min\{x,1\})^3.
$$

Continuity extends the exact dyadic composition identity to all $x,y\ge0$. This proves the continuous dose extension as the limit of the explicit finite source instruments, with the nominal $C_P$ invariant fixed.

#### Binding to the declared complexity extension

For nominal $\mu_0$ use the hard-disabled response. For nominal $\mu_n$ with $n\ge1$ use $W_1=D$ and all later settings zero. Thus $\operatorname{CC}(\mu_0)=0$ and $\operatorname{CC}(\mu_n)=1/4$. The exact common-presentation proof gives $C_P^C(\mu_0)=C_{\mathrm{op}}^C=8$ and $C_P^C(\mu_n)\ge9$. These statements make the selected extension

$$
\operatorname{CC}_C(C)=\tfrac14G((C-8)_+)
$$

agree with every nominal attained value, without knowing the larger complexities. The one-symbol-to-one-dose rule is explicitly part of the allowed Definition 31 extension convention. Its dose normalization is operationally calibrated at $x=1/2$ on an enabled valid EXCHANGE diagnostic, for example on $\mu_1$: three independent half-probability flags give $G=7/8$ and response $7/32$. With normalized generator $f(s)=1-s^{1/3}$,

$$
\kappa=\frac{f(1-7/8)}{1/2}=1.
$$

The same finite calibration also fixes the plateau ceiling $1/4$ from the source's $\pi/6$ exchange.

The variable $x$ denotes diagnostic dose. Nominal $\mu_n$ complexities remain discrete; the one-symbol-to-one-dose convention fixes the selected continuous extension.

### V. Response norm and calibrated shape on the selected source family

#### Probe response on the complete fixed source

The Definition 30 retained event algebra is exactly the two-level probe algebra $\mathcal B(\mathbb C_Q^2)$, as in the source of Definition 9.7l.2. Its source-owned physical readouts include the computational effect attaining the norm and the inherited basis-readout span. The CC norm is the supremum over that probe algebra. The inventory, sign, dose, history, receipt and controller outputs remain in the complete source instrument, source hierarchy, physical-response comparisons and resource account.

At the nominated coupling cut the original $p=0$ parity message is $\sigma=|0\rangle\langle0|$ and the probe, with any external reference, is independent of the aggregate. Let $\theta=\pi/6$ and let $\varepsilon=\pm1$ be the original independently fair sign. Ignoring a common scalar phase, the active unitary is

$$
U_\varepsilon=\cos\theta I+i\varepsilon\sin\theta\,\mathrm{SW}_{QM}.
$$

For every probe matrix $X$ the partial trace over $M$ is

$$
\operatorname{tr}_M\bigl(U_\varepsilon(X\otimes\sigma)U_\varepsilon^*\bigr)
=\cos^2\theta X+\sin^2\theta\operatorname{tr}(X)\sigma
+i\varepsilon\sin\theta\cos\theta[\sigma,X].
$$

The actual fair-sign source averages the two signs and cancels the last term. Hence the active response relative to the matched no-exchange reference is

$$
L_{\mathrm{active}}(X)=\tfrac14\bigl(\operatorname{tr}(X)\sigma-X\bigr).
$$

Flag activation is a classical recorded event independent of the input probe and the sign. For an admitted frame, let $G_{\mathrm{ex}}$ be the probability that flag activation and all exchange gates in Section II.F hold, including the immutable hard-enable, validity and EXCHANGE policy. Averaging the actual exchange-ON and exchange-OFF leaves gives $L=G_{\mathrm{ex}}L_{\mathrm{active}}$. On a valid enabled EXCHANGE diagnostic $G_{\mathrm{ex}}=G$, its flag-activation probability; on $\mu_0$, an invalid frame or OFF policy, $G_{\mathrm{ex}}=0$. The following $G/4$ calculation is on that valid enabled EXCHANGE domain. The same identity holds after tensoring with an arbitrary reference identity, by linearity on all matrix units. The channel identity is reference-uniform.

For density matrices $\rho$ and effects $0\le E\le I$, the trace-distance bound gives

$$
|\operatorname{tr}(L(\rho)E)|\le G/4.
$$

The bound is attained at $\rho=|1\rangle\langle1|$ and $E=|0\rangle\langle0|$, so the operational norm is exactly $G/4$. Its finite endpoint calibration is the existing $\pi/6$ exchange itself, whose gain is $1/4$. The matched reference retains the same activation preparation, clocks, stocks and readout, and switches only the exchange to its identity branch. No source record or unsuccessful outcome is postselected away.

The message and probe exchange is local to their two owned registers. Nonselective trace-preserving operations on those registers leave every other aggregate marginal unchanged, even when the original source has correlations. The new clocks, flags, pointers and probe outputs have no feedback port to the three predictors. Their original source laws and parity accuracy therefore remain exactly those of Corollary 9.7l.1 after the charged ready interval. Spent message, sign, activation and pointer outputs are owned and retained under the stated instrument.

#### Shape and calibrated composition

For $x\ge0$ put $G(x)=1-(1-\min\{x,1\})^3$. For $x\in(0,1)$,

$$
G'(x)=3(1-x)^2,\qquad G''(x)=-6(1-x).
$$

At one they join continuously to zero plateau derivatives. At zero $G$ is right-continuous and zero; no differentiability at the threshold is required by Definition 31. Thus the complexity extension $\operatorname{CC}_C(C)=G((C-8)_+)/4$ is monotone on the real line, is $C^2$ and concave for $C>8$, and is bounded by $1/4$.

The exact composition law is the physically realized source-dose law

$$
T(s,t)=\bigl[\max\{s^{1/3}+t^{1/3}-1,0\}\bigr]^3.
$$

Continuity, symmetry, monotonicity and the identity $T(s,1)=s$ are immediate. Associativity follows by setting $a=s^{1/3}$, $b=t^{1/3}$ and $c=r^{1/3}$: both parenthesizations have cube root $\max\{a+b+c-2,0\}$. For every $0<s<1$,

$$
\max\{2s^{1/3}-1,0\}<s^{1/3},
$$

so $T(s,s)<s$. It is therefore an Archimedean nilpotent triangular norm. The convex normalized additive generator $f(s)=1-s^{1/3}$, with $f(0)=1$, yields

$$
T(s,t)=f^{-1}\bigl(\min\{f(s)+f(t),1\}\bigr).
$$

Its convexity follows from $f''(s)=2/(9s^{5/3})>0$ on $(0,1)$ and continuous extension at zero.

Set $C_{\mathrm{scale}}=1$ binary symbol and use the one-symbol-to-one-dose extension bridge. Definition 31 permits this declared extension convention. The separately realized valid half-dose EXCHANGE setting is on an enabled source (already $\mu_1$ suffices) and uses exactly $h=1/2$ at the first stage. Its three independent flags have all-zero probability $1/8$, so $G(1/2)=7/8$ and $\operatorname{CC}=7/32$. With $f$ normalized as above,

$$
\kappa=\frac{f(1-G(1/2))}{1/2}=1.
$$

The exact nominal complexity partition proves agreement on every source-family complexity: $\mu_0$ has complexity $8$ and response $0$; every $\mu_n$ with $n\ge1$ has complexity at least $9$ and response $1/4$, already on the plateau. Plateau compatibility follows for every larger optimal prefix complexity, independently of its relation to the inventory index.

The theorem's domain consists of the displayed common optimal-prefix presentation, the unchanged $R_h$ component sources, the complete nominal three-$R_{14}$ parity aggregates $\mu_n$, their fixed nominal probe response and the explicitly typed precommitted diagnostic dose instruments, together with the selected Definition 31 continuous extension. The finite ideal source and its finite numerical approximants remain distinct.

The premises are the inherited finite classical $R_{14}$ and paid quantum-controlled parity source leaves; the additional explicit finite supported primitive matrices, ready isolation, calibrated clocks, independent fresh supplies and positive complete invoices; and the displayed one-symbol-to-one-dose extension convention.

For the complexity theorem, equivalence means byte identity of canonical source outputs. For the response theorem, it means equality of the complete specified finite instrument on the probe/reference and retained histories. Cross-source integer-doubling refinement preserves the common activation/history projection for all $n\ge0$; its probe/reference comparison requires the enabled $n\ge1$ family with matched EXCHANGE policy, or matched OFF controls. For shape and calibration, it means pointwise equality of the selected extension and its composition law. Differently sized physical inventories remain distinct sources when their reduced nominal probe maps coincide.

The quantifiers range over every $n\ge0$; every valid, invalid, inactive and saturated frame in its finite bounded grammar; arbitrary independent probe/reference input; all complete source and pointer outcomes; all short prefix strings and all universal aliases; and every fixed finite real dose word through the quantitative finite-source limit.

The proof consists of exact prefix parsing and inherited-output equality; the original three-source parity qualification; finite table substitution and stage induction; bounded positive generator and partial-swap identities; once-owned carrier, ROM, clock and receipt accounting; all-$n$ integer-doubling activation/history refinement, gate-qualified probe refinement and uniform dose and instrument error bounds; and convexity, triangular-norm composition and exact half-dose calibration.

A counterexample on this domain would include a shorter qualifying aggregate realizer, a changed old $R_h$ realizer, a nonzero exchange on a hard-disabled source, a lost coin/failure/history branch, a different normalized channel, an omitted finite source cost or input field, failure of the finite composition identities or the activation/history and gate-qualified probe refinement identities, or disagreement of the extension with an attained nominal complexity.

The domain is nonempty: $\mu_0$ and $\mu_1$ have explicit eight- and nine-bit constructors, qualifying aggregate tasks, and different realized response norms. The enabled half-dose diagnostic has response $7/32$, while the full-dose diagnostic and every enabled nominal source have response $1/4$.

Together, these results select, realize and calibrate the cubic-plateau member of the composition census in Theorem 9.7h, on the declared source-relative branch of Theorem 9.7n. Scope limits: the composition law, the scale $\kappa$ and their calibration are established in the dose variable of the diagnostic instrument and are tied to the complexity variable by the one-symbol-to-one-dose convention of the construction; the cubic exponent equals the number of activation flags of the design, and the accumulated dose is the activation probability of one flag; the ceiling $\alpha_\infty=1/4=\sin^2(\pi/6)$ is fixed by the exchange angle $\pi/6$ adopted in Corollary 9.7l.1; and in the complexity variable the realized nominal response is the two-valued step, $0$ at $C=8$ and $1/4$ at every attained $C\ge9$, on which (9.7h.1) holds for every triangular norm. The result is a complete finite-source construction with exact dyadic composition and analytic continuum limit. The HC8 presentation of Theorem 5.2.3f, the R14 presentation of Definition 2.4.1i and the $3/8$ backbone representative of Definition 32a have their own source domains. Identification with another presentation requires the transport conditions of Proposition 2.4.1j.

The partial-exchange primitive of Theorems 9.7i and 9.7n admits the following finite cycle controller.

<a id="definition-97o-complete-finite-controller-and-comparison"></a>**Definition 9.7o (Complete finite controller and comparison).**

Let $\Gamma$ be a finite connected oriented graph with an assigned unit-modulus gain $g_e$ on each oriented edge, and $g_{\bar e}=g_e^{-1}$. Fix a finite list of closed oriented cycles $\gamma_1,\ldots,\gamma_m$, $m\ge1$, their lengths $\ell_j$, and positive dyadic weights
$$
w_j=n_j/2^B,\qquad \sum_jn_j=2^B.
$$
Each $g_e$ is supplied as a phase-gate primitive. For a finite symbolic instance, the gains can be chosen as roots of unity of a common specified order. Their preparation and physical accuracy are input data. The message and probe carriers are both $\mathbb C^2$.

Define
$$
W_j=\prod_{e\in\gamma_j}g_e,
\qquad q=\sum_jw_j\frac{1-\operatorname{Re}W_j}{2}.
\tag{9.7o.0}
$$
Reversed traversals use the inverse gain. The cycle list and its weights are retained parts of the controller, not an unrecorded choice of coordinates.

The protocol has the following literal steps.

1. Generate and retain a uniform $B$-bit word, and select cycle $j$ by a fixed partition of its $2^B$ values into blocks of sizes $n_j$.
2. Prepare a controller qubit in $|0\rangle$, apply a Hadamard gate, then apply $P(g_e)=\operatorname{diag}(1,g_e)$ in the order of the selected cycle, and apply a second Hadamard gate.
3. Use a complete projective binary instrument to record the final computational-basis value $b$. Retain its pointer and the declared classical-record implementation environment. No outcome is rejected.
4. Independently prepare and retain a fair classical sign $s\in\{-1,+1\}$, a message register in the fixed pure state $\sigma=|0\rangle\langle0|$, and the independent input probe $\rho$. The probe may have an arbitrary external reference. On the active policy, apply
$$
U_s=\cos\theta\,I+i s\sin\theta\,\mathrm{SW},\qquad \theta=\pi/6,
$$
to message and probe if $b=1$, and apply the identity if $b=0$. On the matched reference policy always apply the identity. All controller preparation, outcome distributions, clocks and retained stocks are otherwise the same.
5. Read the designated probe algebra. Message, sign, selected cycle, outcome and preparation records remain in the complete instrument and resource account. A separate complete-output reader is explicitly distinguished below.

The source is a quantum instrument with an explicit classical output algebra for the selection, activation and sign. Its declared complete archive is block diagonal in those labels. Any additional implementation environment included in this archive must preserve that block structure. A coherently accessible purification of the controller randomness or activation is a different output model, treated separately in Proposition 9.7o.2a. External probe references are allowed throughout and are initially independent of the controller and the fixed message.

<a id="theorem-97o1-exact-gauge-invariant-probe-response"></a>**Theorem 9.7o.1 (Exact gauge-invariant probe response).**

The controller's activation probability is $q$, its probe channel is
$$
\Phi_q(X)=\left(1-\frac q4\right)X+\frac q4\operatorname{tr}(X)\sigma,
\tag{9.7o.1.1}
$$
and the response relative to the matched reference has operational norm
$$
\|\Phi_q-\mathrm{id}\|_{\mathrm{op}}
:=\sup_{\rho,\,0\le E\le I}
\left|\operatorname{tr}\bigl(E[\Phi_q(\rho)-\rho]\bigr)\right|
=q/4.
\tag{9.7o.1.2}
$$
The complete protocol is normalized. Equation (9.7o.1.1) also holds with any external reference identity tensored onto the channel. The activation and probe response are invariant under vertex gauge changes $g_{uv}\mapsto h_u^{-1}g_{uv}h_v$, for the same registered cycles and weights.

**Proof.** Before the second Hadamard, the controller qubit is
$$
\frac{|0\rangle+W_j|1\rangle}{\sqrt2}.
$$
The amplitude of its final outcome one is $(1-W_j)/2$. Thus
$$
\Pr(b=1\mid j)=|1-W_j|^2/4=(1-\operatorname{Re}W_j)/2,
$$
and averaging the retained cycle choice proves (9.7o.0).

The source swap identity gives, for a probe matrix $X$,
$$
\operatorname{tr}_M U_s(X\otimes\sigma)U_s^*
=\cos^2\theta X+\sin^2\theta\operatorname{tr}(X)\sigma
+is\sin\theta\cos\theta[\sigma,X].
$$
The independent fair sign cancels the commutator. Since $\sin^2(\pi/6)=1/4$, the active leaf has channel $3X/4+\operatorname{tr}(X)\sigma/4$. Activation is independent of the incoming probe, so averaging the active and identity leaves proves (9.7o.1.1).

For every state, the trace distance between $\sigma$ and $\rho$ is at most one. The effect supremum of their difference is that trace distance. This bounds (9.7o.1.2) by $q/4$; equality follows from $\rho=|1\rangle\langle1|$, $E=|0\rangle\langle0|$. The channel identity holds on every matrix unit and therefore after extension by any reference identity. Each preparation and unitary is normalized, the binary instrument retains both outcomes, and classical averaging sums all branches. Hence the complete protocol is a normalized instrument. Finally all vertex gauge factors cancel around a closed cycle, so $W_j$, $q$, and $\Phi_q$ are unchanged. $\square$

For a complete fundamental-cycle family with positive weights, $q=0$ exactly when all its cycle gains equal one. Thus the controller detects a trivial gain class exactly on this mathematical graph. For phases permitting $W_j=-1$ for every registered cycle, it attains $q=1$ and the source probe norm $1/4$. The graph variables specify the operational controller; the same-task qualification of its components and aggregate is governed by Theorem 34.

<a id="theorem-97o2-exact-dependence-on-the-retained-reader"></a>**Theorem 9.7o.2 (Exact dependence on the retained reader).**

Let the complete-output comparison retain, in addition to the declared classical controller records, both the spent message and the probe. More explicitly, for classical labels $\lambda$ its active output has the form
$$
\mathcal I_q(\rho)=\bigoplus_\lambda p_\lambda\,
\tau_\lambda\otimes U_\lambda(\rho\otimes\sigma)U_\lambda^*,
$$
where the archive states $\tau_\lambda$ are normalized and independent of the probe, the reference uses the identical $p_\lambda,\tau_\lambda$ with every $U_\lambda$ replaced by the identity, and total active probability is $q$. For this matched reference its operational state/effect norm is
$$
\|\mathcal I_q-\mathcal I_0\|_{\mathrm{op}}=q\sin(\pi/6)=q/2.
\tag{9.7o.2.1}
$$
The same bound holds when an arbitrary external reference is retained. This is a norm on a different output algebra from the designated probe norm in (9.7o.1.2).

**Proof.** For a pure joint input $|\Psi\rangle$, including a purification when needed, put $v=\langle\Psi|\mathrm{SW}\otimes I_R|\Psi\rangle$. The swap is Hermitian, so $v$ is real. The overlap of the active and reference pure states is
$$
\langle\Psi|U_s\otimes I_R|\Psi\rangle=\cos\theta+is\sin\theta\,v.
$$
The trace distance of the two pure states is therefore
$$
\sqrt{1-|\cos\theta+is\sin\theta v|^2}
=\sin\theta\sqrt{1-v^2}\le\sin\theta.
$$
Partial trace and convexity extend the bound to arbitrary mixed inputs. Classical controller records are orthogonal blocks with the same probabilities on both policies. Identity leaves contribute zero and active leaves have total probability $q$, so the total distance is at most $q\sin\theta$.

For the fixed pure message $|0\rangle$ and orthogonal pure probe $|1\rangle$, $v=0$. The bound is attained on every active sign branch, so summing the blocks gives equality. The supremum over effects equals the trace distance of the full output difference. $\square$

All auxiliary records remain in the physical inventory. The designated reader accesses the probe algebra specified in Theorem 9.7n, Section V. Equation (9.7o.2.1) shows why a probe-calibrated norm cannot be promoted to a norm over every archived output. At $q=1$, the two norms are respectively $1/4$ and $1/2$; there is no contradiction because the compared reader algebras differ.

<a id="proposition-97o2a-coherently-retained-activation-has-a-different-norm"></a>**Proposition 9.7o.2a (Coherently retained activation has a different norm).**

In a separate comparison model, prepare a coherent activation qubit
$$
|\chi_q\rangle=\sqrt{1-q}|0\rangle+\sqrt q|1\rangle
$$
and apply $|0\rangle\langle0|\otimes I+|1\rangle\langle1|\otimes U_s$, retaining the activation coherence, message and probe. The sign may be fixed or independently classical and retained. Relative to the identity policy with the same preparation, the complete-output norm is
$$
\beta_{\mathrm{coh}}(q)=\sqrt{1-(1-q+q\cos\theta)^2},\qquad\theta=\pi/6.
\tag{9.7o.2a.1}
$$
For $0<q<1$, it strictly exceeds $q\sin\theta$.

**Proof.** For a pure message/probe/reference input, the active/reference overlap is
$$
1-q+q\cos\theta+isq\sin\theta\,v,
$$
with the same real swap expectation $v$ as in 9.7o.2. Its squared modulus is at least $(1-q+q\cos\theta)^2$. Convexity and purification extend the resulting distance bound to mixed inputs, and an orthogonal pure message/probe pair gives $v=0$ and attains it. The difference of squared norms is
$$
\beta_{\mathrm{coh}}(q)^2-q^2\sin^2\theta
=2q(1-q)(1-\cos\theta)>0.
$$
This proves both assertions. $\square$

This comparison fixes the exact output-algebra boundary in 9.7o.2. Neither norm is a universal bound for unspecified accessible purifications.

<a id="proposition-97o3-a-finite-phase-accuracy-bound"></a>**Proposition 9.7o.3 (A finite phase-accuracy bound).**

Suppose the intended phase angle on every oriented edge has an implemented angle differing by at most $\varepsilon_e$, with inverse edges implemented consistently. Retain the same exact weights, fair sign and exchange angle. Then
$$
|q_{\mathrm{impl}}-q|
\le\frac12\sum_jw_j\sum_{e\in\gamma_j}\varepsilon_e,
$$
and
$$
\|\Phi_{q_{\mathrm{impl}}}-\Phi_q\|_{\mathrm{op}}
\le\frac18\sum_jw_j\sum_{e\in\gamma_j}\varepsilon_e.
\tag{9.7o.3.1}
$$

**Proof.** Choose real lifts for the nominal and implemented edge angles. The difference of a cycle angle is bounded by the sum of its edge errors, counting traversals. The function $(1-\cos t)/2$ is $1/2$-Lipschitz. Average the resulting inequalities with $w_j$, and use (9.7o.1.1) and the norm of the pure-state replacement difference. $\square$

**Finite implementation.**

The added controller uses a finite $B$-bit selection record, one phase-test qubit and its complete readout implementation, one sign bit, a pure message register, and the nominated probe. It executes two Hadamards, at most $\max_j\ell_j$ phase calls, one complete binary readout, and one conditional exchange stage, in addition to the specified preparation and archive operations. Each primitive must have its source-owned duration, energy/control envelope, precision and storage cost. With any supplied finite tariff for these operations and a finite retention window, their sum is finite. The pulse conserves target-plus-message energy when their free Hamiltonians agree, since swap commutes with $H\otimes I+I\otimes H$; preparation and control costs remain charged.

The finite controller realizes Definition 9.7o's response with the stated reader and resource inventories. Its use within a selected MPU aggregate family consumes that family's component qualification, complete comparison class and PCE selection record.

<a id="theorem-97r-shared-context-exact-parallel-bias-and-reader-closure"></a>**Theorem 9.7r (Shared Context, Exact Parallel Bias, and Reader Closure).** Let a finite context set $\mathcal C$ control a finite family of retained response instruments $\{\mathcal I_{c,p}:p\in\mathcal P\}$. Define
$$
c\sim c'\quad\Longleftrightarrow\quad
\mathcal I_{c,p}=\mathcal I_{c',p}\ \text{for every }p\in\mathcal P.
\tag{9.7r.1}
$$
Equality includes every admitted input and retained reference. Among deterministic classical encodings $z:\mathcal C\to Z$ through which all these instruments factor, the least number of used context symbols is $|\mathcal C/{\sim}|$. The quotient map attains it. If the finite matrix tables have specified algebraic coefficients with effective equality, and the admitted inputs/effects contain complete state/effect spaces or specified algebraic tomographically complete families, the quotient and a separating admitted protocol/input/effect for each unequal pair are determined by finite algebraic comparison.

Now let $Q_1,\ldots,Q_k$ be finite-dimensional probes, each of dimension at least two, with independent pure messages $\sigma_i$. Set
$$
\Phi_i=(1-a_i)\operatorname{id}+a_i\mathcal R_{\sigma_i},\qquad
\mathcal R_{\sigma_i}(X)=\operatorname{tr}(X)\sigma_i,\qquad 0\le a_i\le1,
$$
and $\Phi=\bigotimes_i\Phi_i$. The operational bias of the joint probe reader relative to the unchanged probes is exactly
$$
\sup_{R,\rho_{QR},\,0\le E\le I}
\left|\operatorname{tr}E[(\Phi\otimes\operatorname{id}_R)(\rho)-\rho]\right|
=1-\prod_{i=1}^k(1-a_i).
\tag{9.7r.2}
$$
The supremum allows arbitrary external probe references, initially independent of the messages and controls. A product input and a joint probe effect already attain it.

There is an explicit stable shared-context source with four contexts $c=(c_1,c_2)\in\{0,1\}^2$, two qubit probes, and
$$
\sigma_1(c)=|c_1\rangle\langle c_1|,\qquad
\sigma_2(c)=|c_1\mathbin\oplus c_2\rangle\langle c_1\mathbin\oplus c_2|,
\qquad a_1=a_2=\tfrac14.
\tag{9.7r.3}
$$
Its sufficient classical context alphabet has exactly four symbols, each individual probe bias is $1/4$, and its joint probe bias is $7/16$. Three independent probes of the same strength have joint bias $37/64>1/2$. Consequently an admissible family with a universal bias ceiling below $1/2$, measured relative to the tensor identity and allowing unrestricted joint effects, cannot be closed under arbitrary parallel composition of any fixed nonzero pure-message replacement channel.

*Proof.* If $z(c)=z(c')$ and all instruments factor through $z$, the response instruments agree, so $c\sim c'$. Every fiber of $z$ is therefore contained in one equivalence class and $z$ uses at least as many symbols as there are classes. The quotient factors all instruments by construction and attains the lower bound. On the stated coefficient and tomography branch, equality of superoperator matrices is a finite test. A nonzero difference of Hermiticity-preserving instrument maps has a Hermitian input with nonzero output; density matrices span the Hermitian input space. With complete state/effect spaces admitted, a nonzero Hermitian output is separated by one of its spectral effects. With specified tomographically complete families, their spanning property ensures that one admitted input/effect pair separates the same nonzero map, and exhaustive finite comparison finds it. The corresponding outcome-history block remains retained.

Expanding the product channel gives
$$
\Phi=p\operatorname{id}+(1-p)\Psi,\qquad
p=\prod_i(1-a_i),
$$
where, for $p<1$, $\Psi$ is a convex combination of channels replacing a nonempty subset of the probes. For every reference and input, the difference is $(1-p)$ times a difference of two states. Its effect norm is at most $1-p$. For each $i$ choose a pure $|v_i\rangle$ orthogonal to the support vector of $\sigma_i$, and use input $|v\rangle=\bigotimes_i|v_i\rangle$. Every nonempty replacement is supported orthogonally to $|v\rangle$. The effect $I-|v\rangle\langle v|$ has reference probability zero and output probability $1-p$. This proves (9.7r.2), including its reference-stable upper bound.

For (9.7r.3), store $c$ in a retained classical two-bit register. Reversible controlled-XOR gates write $c_1$ and $c_1\oplus c_2$ into two initially blank message registers without changing the source. Apply Theorem 9.7l's independent fair-sign partial swaps of angle $\pi/6$ to the corresponding probe/message pairs. Retain both signs, the source, the message outputs, the clock and control receipts. Taking the designated probe marginal gives exactly the product channel in (9.7r.3), since the independent sign averages cancel the two commutator terms separately. Choose common zero free Hamiltonians for these finite registers; the swap pulses and XOR controls have the finite pulse realization and temporary-stock ledger of Theorems 9.7i and 9.7l. For a declared finite number of repetitions, include one fresh message pair and sign pair per repetition and retain the complete outgoing archive. The two-bit source is unchanged by every cycle, so its context is stable throughout that schedule.

On probe input $I/2$, computational-basis measurement has probability $5/8$ at the message bit and $3/8$ at the other bit. Thus the two retained probe laws identify $(c_1,c_1\oplus c_2)$, hence $c$, at the level of exact distributions. The four contexts are inequivalent and the quotient requires four classical symbols. Equation (9.7r.2) gives $1-(3/4)^2=7/16$ and $1-(3/4)^3=37/64$. More generally, $1-(1-a)^k$ tends to one for every $a>0$, proving the closure obstruction. ∎

The source in (9.7r.3) supplies one stable shared context and an explicit map regulating two retained interactions. Its four-symbol minimality concerns classical deterministic sufficient records; it asserts no minimum quantum memory dimension. Theorem 9.7n's $1/4$ ceiling remains the value of its specified one-probe source family. Theorem 9.7r identifies the change caused by enlarging the reader to a parallel probe product. Definition 31 therefore fixes its admissible aggregate, reference, and reader family before applying a ceiling. The context construction meets the shared-coordination component of Definition P.2.6.1; membership in Theorem 34's selected aggregate branch consumes that theorem's complexity, reachability, strict-improvement and realization record.
