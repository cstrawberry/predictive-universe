# 9. Consciousness Complexity (CC): Emergent Biasing of MPU Interactions

**CC conjecture boundary.** CC is a model-level extension of the core MPU framework. Postulate 3 distinguishes three operational branches: (i) a local CPTP branch on which Bob's unconditional marginal is invariant while post-comparison joint or conditional correlations may vary; (ii) a preparation-context branch on which states $\omega_C$ are fixed in the shared causal past, with no independently late spacelike input; and (iii) a marginal-anomaly branch on which Alice's independently selected context, chosen after distribution and later than the latest shared-past preparation event, changes Bob's pre-lightcone marginal. Branch (iii) is PU's genuine statistical-FTL hypothesis and a departure from standard quantum mechanics. By Theorem 39c and Corollary 39c.1 it lies outside exact pre-lightcone context independence and is that causal branch's preregistered falsifier class. Theorems 39, 39a, and 40–42 bound endpoint forcing, finite-window zero-error reliability, sample complexity, and information rate without converting branch (iii) into branch (i) or (ii). Sections 10 and 13 distinguish the branches by late randomization and marginal measurement.

This section develops the CC hypothesis: under the stated operational conditions, sufficiently complex MPU aggregates acquire an information-geometric capability to bias local 'Evolve' probabilities by small amounts.

**9.1 MPU Aggregates and Context-Dependent Interactions**

**9.1.1 Definition 29 (Def 29): MPU Aggregate**

An **MPU aggregate** is a physical system composed of multiple interacting Minimal Predictive Units (Definition 23). The aggregate's collective state and dynamics implement a predictive model characterized by an aggregate Predictive Physical Complexity $C_{agg} = C_P(\mu_{agg})$, where $C_{agg} \ge C_{op}$. Such aggregates operate adaptively (Section 6) to solve their own potentially more complex Prediction Optimization Problem (Axiom 1), maintaining viability within the Space of Becoming $(\alpha, \beta)$ (Axiom 3). On Hypothesis 1's nominated branch, a macroscopic system—including a biological brain or AI system—is a candidate MPU aggregate. Identifying it as a Definition 29 aggregate requires a physical realization of its Definition 23 components and aggregate state and dynamics. Theorem 23e exhausts the architectures decoded by a frozen bounded total decoder under its finiteness, totality, and decidability premises; a nonempty admissible subcensus then lets Theorem 23d classify the populated exact response tables using the decidable PPI-admissibility predicates and source-exhausted common-unit cost. Using that bounded classification to identify a concrete system additionally requires accepting the decoder and bound as physically exhaustive, populating those records, and supplying the response-faithful physical realization.

**9.1.2 Assumption 1 (Context-Dependence of ND-RID Probabilities)**

On the separately supplied stochastic ND-RID branch, let the normalized kernels $P(o\mid x,y)$ and $P(x'\mid x,y,o)$ admit an additional registered context argument $S_{agg}$ from the surrounding MPU aggregate. On the independently accepted Hilbert/Born/instrument branch, $P_{\mathrm{Born}}(o)=\operatorname{tr}(\rho E_o)$ is the reference law on its certified effect domain. Assumption 1 permits response-active dependence of the observable law $P_{obs}(o\mid x,y,S_{agg})$ on $S_{agg}$; a nonzero deviation from the Born reference requires Theorem 34's strict-improvement hypotheses and Hypothesis 3's physical context-to-control realization.

*Justification:* This dependence is motivated by the adaptive nature of the MPU network operating under POP/PCE and is adopted as an explicit modeling assumption for the CC program. For an aggregate to optimize predictions efficiently, it is natural for its constituent MPUs' interactions to be sensitive to the aggregate context $S_{agg}$; a strictly context-independent ND-RID parameterization would generically restrict the controllable degrees of freedom available for PCE-driven adaptation. PCE optimization is therefore expected to favor configurations where ND-RID parameters can be modulated by $S_{agg}$. This allows the system to learn—via dynamics that minimize the PCE Potential $V(x)$ (Appendix D)—how to locally adapt interaction probabilities to enhance overall predictive performance. Appendix L describes conditional implementation classes for such modulation. An AC-Stark implementation requires a specified source, coupling Hamiltonian, target response, coherence window, and likelihood map; the Fourier construction of Theorem L.8 does not identify a carrier without an additional physical-response model, and Theorem L.9 applies only to its declared admissible mapping class.

**9.2 The Emergence of Biasing Capability from POP/PCE Optimization**

Given context-dependent ND-RID probabilities (Assumption 1), and that the aggregate's internal state $\rho_{agg}$ (or its effective description) provides the primary local context for constituent MPUs within complex aggregates ($C_{agg} > C_{op}$), the framework's optimization principles select non-Born biasing exactly when a reachable non-Born context has strictly lower PCE potential than every Born-realizing minimizer in the reduced context class. If no such strict-improvement context exists, PCE may select the Born reference context and no nonzero CC follows. Theorem 34 records this strict-improvement condition.

**Remark (Strict-Improvement Branch Discipline).** The strict-improvement antecedent is a branch condition, not a consequence of complexity alone. A sufficient local test at the null/Born-realizing map $u_0$ is an admissible differentiable curve $\gamma:[0,\delta)\to\mathcal U$ with $\gamma(0)=u_0$ and
$$
\left.\frac{d}{dt}V(\gamma(t))\right|_{t=0^+}<0.
$$
Then $V(\gamma(t))<V(u_0)$ for all sufficiently small positive $t$. Under Theorem 34's lower bound on every Born-realizing context, these nearby contexts are non-Born. Selection of a nonzero operational map additionally uses that theorem's attainment and representability hypotheses. Nonzero predictive sensitivity or a nonzero uncancelled ambient gradient alone does not supply an admissible descent direction when constraints are present. If strict improvement is absent, a Born/null context can remain a PCE minimizer; failure of this local test does not exclude improvement elsewhere in the reachable class. The empirical prediction of nonzero CC therefore remains conditional on the complete strict-improvement branch.

**9.2.1 Theorem 34 (POP/PCE Selects Biasing on the Strict-Improvement Branch)**

Assume context-dependent ND-RID probabilities (Assumption 1). Let $S$ be an MPU aggregate with $C_{agg}>C_{op}$. Let $\mathcal U$ be the set of reachable internal context states on the timescale of the local `Evolve`/ND-RID events, let $P_{obs}(\cdot\mid u)$ be the induced distribution for one retained measurement, and let $V:\mathcal U\to\mathbb R$ be the reduced PCE potential. Assume:

1. there is a reference context $u_0\in\mathcal U$ with $P_{obs}(\cdot\mid u_0)=P_{Born}$;
2. there is $u_+\in\mathcal U$ with $V(u_+)<V(u_0)$ and $P_{obs}(\cdot\mid u_+)\ne P_{Born}$;
3. if $P_{obs}(\cdot\mid u)=P_{Born}$, then $V(u)\ge V(u_0)$;
4. whenever $P_{obs}(\cdot\mid u)\ne P_{Born}$, the deviation on the retained event algebra is represented by a Hermitian-preserving, trace-annihilating complex-linear map $L_{S,u}$ in the sense of Definition 30;
5. $V$ attains its global minimum on $\mathcal U$, and the adaptive dynamics has an asymptotically stable attractor $u^*\in\arg\min_{u\in\mathcal U}V(u)$.

Then $P_{obs}(\cdot\mid u^*)\ne P_{Born}$ and $L_{S,u^*}\ne0$. Consequently
$$
\mathrm{CC}(S)=\|L_{S,u^*}\|_{\mathrm{op}}>0.
$$

*Proof:*
1.  Since $u^*$ minimizes $V$ on $\mathcal U$, one has
    $$
    V(u^*)\le V(u_+) < V(u_0).
    $$
2.  Suppose, for contradiction, that $P_{obs}(\cdot|u^*)=P_{Born}$. Then the Born-level minimality hypothesis implies $V(u^*)\ge V(u_0)$, contradicting Step 1. Hence
    $$
    P_{obs}(\cdot|u^*)\ne P_{Born}.
    $$
3.  By operational representability, there exists a Hermitian-preserving, trace-annihilating linear map $L_{S,u^*}$ such that the local deviations are given by
    $$
    \Delta P(i)=\operatorname{tr}\!\big(L_{S,u^*}(\rho)E_i\big).
    $$
    If $L_{S,u^*}=0$, then $\Delta P(i)=0$ for every local event, so $P_{obs}(\cdot|u^*)=P_{Born}$, contradicting Step 2.
4.  Therefore $L_{S,u^*}\ne0$, and by Definition 30,
    $$
    \mathrm{CC}(S)=\|L_{S,u^*}\|_{\mathrm{op}}>0.
    $$
    ∎

**9.3 Consciousness Complexity (CC): Operational Definition and Scaling**

We define Consciousness Complexity (CC) operationally as the quantitative measure of the emergent biasing capability conditionally certified by Theorem 34. The word "observer" denotes any finite record-forming protocol in the measurement formalism; CC is not a prerequisite for Evolve. High-CC systems enter the quantum formalism as high-resource record-integrating and context-modulating subsystems, while inter-perspective agreement of durable records is handled by Theorem M.4a in Appendix M.

**9.3.1 Definition 30 (Def 30): Operational CC**

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

**Lemma 9.1 (Variational characterization).** For Hermitian $H$ with $\mathrm{tr}\,H=0$,
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

**Corollary 9.1.** For Hermitian-preserving, trace-annihilating $L_S$,
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

**9.3.2 Definition 31 (Def 31): Physical Constraints on CC Scaling**

As an additional response-model assumption, extend the attainable complexity values to a real variable $C_{agg}$ and choose a nonnegative response function through their assigned CC values, twice differentiable for $C_{agg}>C_{op}$. Express $C_{agg}$, $C_{op}$, and $C_{scale}$ in the same registered complexity units. The derivative constraints below concern this extension; they do not give derivatives to the discrete prefix-length invariant $C_P$ itself. The response model is required to satisfy:
1.  **Threshold Behavior:** CC(S) emerges only in sufficiently complex systems. Since CC derives from exploiting context-dependence (Theorem 34), requiring $C_{agg} > C_{op}$ for non-trivial internal states, we expect CC($C_{agg}$) = 0 for $C_{agg} \le C_{op}$.
2.  **Declared Bounded-Bias Branch:** This CC model restricts its admissible family by $\alpha_{CC,max}<1/2$. Theorem 39 proves that this premise is sufficient to exclude endpoint-complete binary forcing and that endpoint-complete forcing would require $\alpha_{CC,max}\ge1/2$; it does not prove the converse implication from mere absence of endpoint forcing. Theorem 39a gives only a finite-window zero-error bound, while exact causal compliance is marginal invariance under Theorem 39c. Thus $\mathrm{CC}(C_{agg})\le\alpha_{CC,max}<1/2$ here by the declared bounded-bias branch contract.
3.  **Monotonicity:** Plausibly, capability increases with resources available for complex state modulation, so we assume $d\text{CC}/dC_{agg} \ge 0$ for $C_{agg} > C_{op}$.
4. **Diminishing Returns:** Achieving further increases likely becomes harder. We assume diminishing returns, **$d^2\text{CC}/dC_{agg}^2 \le 0$** for $C_{agg} > C_{op}$.

**9.3.3 Theorem 35 (General CC Scaling Form)**

Any function $\mathrm{CC}(C_{agg})$ satisfying Definition 31 and right-continuous at $C_{op}$ can be written as
$$
\mathrm{CC}(C_{agg})=
\begin{cases}
0,&C_{agg}\le C_{op},\\
\alpha_\infty\,\mathcal G\!\left((C_{agg}-C_{op})/C_{scale}\right),&C_{agg}>C_{op}.
\end{cases}
\tag{55}
$$
Here $0\le\alpha_\infty\le\alpha_{CC,max}<1/2$ is the asymptotic CC value, $C_{scale}>0$ is a characteristic complexity scale in the same units as $C_{agg}$, and $C_{op}$ is the operational threshold of Definition 13. The dimensionless function $\mathcal G:[0,\infty)\to[0,1]$ is right-continuous at $0$ and satisfies
$$
\mathcal G(0)=0,\qquad
\lim_{x\to\infty}\mathcal G(x)=1,\qquad
\mathcal G'(x)\ge0,\quad
\mathcal G''(x)\le0\quad(x>0).
$$
If the asymptotic value is not attained at finite positive $x$, then $\mathcal G(x)<1$ for every finite $x$.

*Proof.* The first branch of (55) is Definition 31's threshold condition. For the second branch, let
$$
\alpha_\infty:=\lim_{C_{agg}\to\infty}\mathrm{CC}(C_{agg}),
$$
which exists by nonnegativity, monotonicity and boundedness. If $\alpha_\infty=0$, the response is identically zero; choose $\mathcal G(x)=x/(1+x)$. If $\alpha_\infty>0$, set
$$
\mathcal G(x):=\frac{\mathrm{CC}(C_{op}+C_{scale}x)}{\alpha_\infty}
\qquad(x\ge0).
$$
The threshold condition and right continuity give $\mathcal G(0)=0$ and right continuity at $0$. The range, asymptotic limit, and derivative signs for $x>0$ follow by positive rescaling. If a nondecreasing function reaches its asymptotic upper bound, it remains at that bound; otherwise it stays strictly below it at every finite argument. Substitution proves (55). ∎

**9.3.4 Definition 32 (Def 32): Specific CC Scaling Model Example**

A simple concave, monotone shape on $[0,\infty)$ is $\mathcal G(x)=x/(1+x)$. Its threshold response is
$$
\mathrm{CC}(C_{agg})=
\begin{cases}
0,&C_{agg}\le C_{op},\\
\displaystyle\alpha_\infty\frac{C_{agg}-C_{op}}{C_{scale}+C_{agg}-C_{op}},&C_{agg}>C_{op},
\end{cases}
\tag{56}
$$
with $0\le\alpha_\infty\le\alpha_{CC,max}<1/2$, operational threshold $C_{op}$, and $C_{scale}>0$.

**9.3.4a Definition 32a (Backbone Representative for CC Scaling).** On any bounded-bias branch whose endpoint ceiling satisfies $3/8\le\alpha_{CC,max}<1/2$, the backbone representative is the admissible model representative of Theorem 35 with
$$
\alpha_\infty=\frac{3}{8},
\qquad
C_{scale}=K_0\varepsilon_0=3\ln2,
\qquad
\mathcal G_{\mathrm{bin}}(y)=1-2^{-y},
\tag{56a}
$$
where
$$
y=\frac{C_{agg}-C_{op}}{K_0\varepsilon_0}.
$$
It is an admissible model representative of the monotone-concave family, not a uniqueness theorem for all admissible CC functions.

**9.3.4b Proposition 35a (Admissibility of the Backbone Representative).** On branches satisfying $3/8\le\alpha_{CC,max}<1/2$, the representative of Definition 32a satisfies Definition 31 and the general form of Theorem 35. Its closed form is
$$
\text{CC}(C_{agg})
=
\frac{3}{8}
\left(
1-2^{-(C_{agg}-C_{op})/(3\ln2)}
\right)
\Theta(C_{agg}-C_{op}).
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
C_{agg}-C_{op}=K_0\varepsilon_0=3\ln2,
$$
and $99\%$ saturation occurs at
$$
C_{agg}-C_{op}=K_0\varepsilon_0\log_2(100)\approx13.8
$$
in the same registered complexity-coordinate units as $C_{scale}$. Interpreting these values as nats requires a separate calibration of that coordinate.

*Proof.* Half saturation means $1-2^{-y}=1/2$, hence $y=1$. The $99\%$ point means $1-2^{-y}=0.99$, hence $y=\log_2(100)$. Substituting $y=(C_{agg}-C_{op})/(K_0\varepsilon_0)$ gives the two displayed values. ∎

**9.3.4d Remark 35a.2 (Status of the Backbone Representative).** Definition 31 and Theorem 35 permit many monotone-concave scaling functions. Definition 32 remains a rational example, while Definition 32a supplies a binary-saturating benchmark representative. The condition $3/8\le\alpha_{CC,max}<1/2$ is an additional restriction on the declared bounded-bias branch of Definition 31, item 2, and the representative applies only to branches on which this restriction is independently registered. The asymptotic value $3/8$ is the same ratio as the sub-threshold Van Vleck effective dimension $D_{\mathrm{eff}}=t/d_{\min}=3/8$ of Theorem T.42.5 on the Golay assignment branch; the scale $K_0\varepsilon_0=3\ln2$ equals $\ln d_0$ on the $d_0=8$ carrier. Theorem E.6 and Equation (E.9) separately use the actual channel capacity $C(\mathcal E_N)$ in the thermodynamic boundary and coupling relations. These are cross-sector resonance choices: the value $3/8$ and scale $3\ln2$ remain model choices unless a forward-locked response certificate derives them.

**Interface-Fraction Response Hypothesis.** The interface count of Section Z.7 gives $\varphi(a,d)=2a(d-a)/d^2$. Register a physical response map that identifies the asymptotic coefficient with $\varphi(a,8)$ and specifies the admissible active-rank set $\mathcal A$. The endpoint ceiling is then
$$
\alpha_{CC,\max}=\max_{a\in\mathcal A}\varphi(a,8).
$$
For $\mathcal A=\{2\}$ it is $3/8$; for a class admitting rank four it reaches $1/2$. A strict sub-half ceiling is therefore a statement about the complete admissible rank class. The separate horizontal normalization $C_{scale}=\ln8$ and binary shape of Definition 32a give Proposition 35a's response curve. Hypothesis 3 and the registered CC protocol test this physical response map, its rank-class premise and its scaling behavior.

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

**9.4.1 Hypothesis 3 (Hyp 3): CC Influence Mechanism**

Hypothesis 3 proposes that the operational Consciousness Complexity $\mathrm{CC}(S)$ of an MPU aggregate $S$ modulates parameters of a registered stochastic `Evolve`/ND-RID instrument branch for constituent MPUs. The target outcome law, stochasticity, carrier, instrument, and single-outcome rule are independent entries of that branch. Subject to those entries, the proposed influence uses the context dependence of Assumption 1 without replacing the registered update law. The pathway is:

1.  **Internal State as Context ($\mathrm{context}_S$):** The aggregate's internal state providing context is formally the **context state $\mathrm{context}_S(t)$** (the selected finite operationally sufficient expectation vector of Definition L.1 in Appendix L, with minimal sufficiency requiring that definition's separate deletion and addition tests). Operationally, it represents the coarse-grained, predictively sufficient slice of the aggregate state $\rho_{agg}(t)$ relevant to influencing local ND-RID within available resources.
2.  **Physical Manifestation of Context:** $\mathrm{context}_S(t)$ manifests physically through properties like the reduced density operator, entanglement structure, patterns in the coarse-grained MPU Stress-Energy Tensor ($T_{\mu\nu}^{(MPU)}$, Appendix B), or emergent curvature patterns.
3.  **Modulation Pathway:** These collective physical patterns ($\mathrm{context}_S$) are hypothesized to act as structured boundary conditions or effective fields influencing the local parameters ($V_{prob}, T_{prob}$, or effective Lindblad parameters $\gamma_k$ as in Appendix L Equations (L.88) and (L.90)) of the underlying 'Evolve'/ND-RID process. A candidate controlled AC-Stark pathway uses context-conditioned classical fields to shift MPU level splittings and thereby alter effective jump rates. This candidate requires a specified control Hamiltonian, source geometry, target polarizability and detuning, coherence window, noise model, and likelihood map from the induced dynamics to the retained outcome probabilities. The mapping $\mathcal M:\mathcal C_{ctx}\to\mathcal P_{control}$ must belong to the admissible class of Theorem L.1 and satisfy its declared continuity, compactness, stability, and cost-benefit hypotheses. Appendix L supplies this conditional optimization framework; it does not determine a universal electromagnetic-to-gravitational channel ratio. Appendix S supplies a self-limitation model only on its registered power-law, retained-energy, weak-field, and calibrated-response branches. On branches satisfying both the strict-improvement antecedent of Theorem 34 and the relevant implementation certificates, the selected non-null map can represent controlled bias of the retained 'Evolve' outcomes.
4.  **Candidate Locus of Observable Effect:** On a branch carrying a response-active aggregate-to-control map and a normalized target instrument, the nominated mechanism may change a registered outcome law subject to $|\Delta P|\le\mathrm{CC}(S)$. Theorem 34 gives $\mathrm{CC}(S)>0$ on its strict-improvement, representability, attainment, and stability branch, and the registered CC protocol tests the existence, sign, and size of the effect.
5.  **Operational Nature:** CC measures this biasing capability. The link between specific content of $\mathrm{context}_S$ (e.g., intent, attention, report-induced expectation, or other retained predictive state) and bias direction is learned or selected via adaptation (driven by POP/PCE); the Minimal Awareness interpretive convention of Section 7.1.2 supplies its experiential reading, and the mechanism of influence on the 'Evolve' parameters is proposed as objective physics. A semantic item such as a belief, report, or expectation enters the mechanism only through its physical instantiation inside $\mathrm{context}_S$; the truth value of the represented proposition is not itself a probability-control parameter unless it is physically available to the aggregate or apparatus.
6.  **Implications for Locality:** Since $\mathrm{context}_S$ can involve non-local entanglement, and the CC mechanism acts by influencing local 'Evolve' events, a context change in one part of an entangled aggregate might have statistical consequences (via entanglement and the modified 'Evolve' probabilities) on 'Evolve' outcomes in space-like separated parts. This underpins the three-branch statistical-influence structure of Postulate 3; any late-randomized branch-(iii) Bob-marginal shift is a causal-branch falsifier by Corollary 39c.1, and its external regular finite-window model is analyzed on the independently declared bounded-bias branch, with Theorem 39 supplying only the endpoint-complete consequence, Theorem 39a supplying the finite-window zero-error constraint on the regular statistical branch, and Theorem 39b supplying the predictive-current no-loop/precision-cost gate whenever a current representation is asserted.
7.  **Physical Realization:** The challenge lies in the mapping $\mathcal{M}: \mathrm{context}_S \to (\text{Physical Control})$ respecting POP/PCE constraints (Appendix L, Lemma L.1, Theorem L.1), which generates the physical fields or boundary conditions that modulate the 'Evolve' process, alongside the physics of the interaction channel itself (Appendix L).


**9.5 Modeling Modified Quantum Probabilities**

To make the CC hypothesis testable, we model how baseline Born rule probabilities are modified.

**9.5.1 Definition 33 (Def 33): General Form of Modified Probability**

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

**Theorem (Heisenberg–Schrödinger identity for CPTP semigroups).** Let $\Lambda_\xi=e^{\xi\mathcal L}$, $\xi\ge0$, be a norm-continuous CPTP semigroup on the trace-class operators $\mathcal T_1(\mathcal H)$, with bounded generator $\mathcal L$. Its Banach adjoint $\Lambda_\xi^*$ acts normally on $\mathcal B(\mathcal H)$. Let $\{E_i\}_i$ be a finite or countable POVM, with countable sums taken ultraweakly. Define the Heisenberg-picture effects
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

**9.5.2 Theorem 36 (PU Predictive-Perturbation Bounds)**

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

**9.5.3 Definition 34 (Def 34): Context-Targeted Bias (CTB) Model**

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

**9.5.4 Theorem 37 (Consistency of CTB Model)**

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

**9.5.5 Theorem 38 (Maximum Bias Effect with CTB Model)**

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

**Remark 5: Information-theoretic measure of CC bias.** Write $p_i=P_{\mathrm{Born}}(i)$, $q_i=P_{\mathrm{obs}}(i)$, and $\delta_i=q_i-p_i$. Let $I_+:=\{i:p_i>0\}$ and assume $q_i=0$ for $i\notin I_+$. The KL divergence is
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

**Proposition 12 (Hypothesized correlation: CC and PP).** A positive correlation is hypothesized between achievable CC(S) and average sustainable Predictive Performance PP(S). Systems with higher CC might operate more effectively closer to the operational performance bound $\beta$.

**Proposition 13 (Potential CC effect on quantum coherence).** The CC mechanism (Hypothesis 3), by influencing “Evolve”/ND-RID parameters contributing to decoherence, could modify effective decoherence rates $\Gamma_{eff}$ or coherence times $\tau_{coh}$ of quantum systems interacting with the high-CC aggregate. Fractional change might scale as $O(\mathrm{CC})$, with context-dependent sign (Section 13.3).

**Proposition 14 (Relation between operational CC and system integration/prediction).** Theorem 34 establishes a nonzero operational bias map only on its strict-improvement and representability branch. It supplies no measure of functional integration and no theorem relating such a measure to $\mathrm{CC}(S)$. A positive relation among CC, integration, internal modeling, and predictive capacity is an explicit empirical hypothesis.

**Proposition 15 (Registered-Reset Cost for Introspection).** Let an aggregate run a registered introspection protocol satisfying
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

**Proposition 16 (Dynamic nature of high-CC states).** Assume, in addition to Proposition 15, that a high-CC protocol repeatedly acquires fresh introspective information and that every registered acquisition causes a nonzero displacement in a specified metric on $\mathrm{context}_S$. Then the context cannot remain static while that protocol operates. Without the repeated-acquisition, metric-displacement, and CC-to-protocol hypotheses, Theorem 33 does not exclude a static high-CC state or establish a claim about subjective experience.

## 9.7 Finite CC Resolution Records

**Theorem 9.7a (Nonempty Finite Strict-Improvement Witness).** Fix an MPU aggregate $S$ with $C_{agg}>C_{op}$ and instantiate Assumption 1 on a qubit. Let the retained measurement be $\{P_0,P_1\}$, let
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
and take the reduced PCE potential, including every cost admitted in this two-context model, to be $V(u_0)=0$, $V(u_+)=-1$. Let the context dynamics send both points to $u_+$ in one step. Set $L_{u_0}=0$. With $\sigma=|0\rangle\!\langle0|$, the CTB direction
$$
L_{u_+}(X)=\alpha\bigl(\operatorname{tr}(X)\sigma-X\bigr)
\tag{9.7a.2}
$$
realizes (9.7a.1) from the maximally mixed input, and $\|L_{u_+}\|_{\mathrm{op}}=\alpha>0$.

*Proof.* The initial states $u_0$ and $u_+$ witness reachability, $u_0$ is the only Born-realizing point, and the finite potential attains its unique strict minimum at $u_+$. That point is the globally attracting fixed point of the stated dynamics. Direct substitution of $I/2$ and $P_0,P_1$ in (9.7a.2) gives (9.7a.1), while $L_{u_0}=0$ represents the reference context. The map in (9.7a.2) is complex-linear, Hermitian-preserving, and trace-annihilating. Lemma 9.1a with pure $\sigma$ gives norm $\alpha$. Thus every finite mathematical antecedent of Theorem 34 has a nonempty witness on the declared aggregate branch. ∎

This witness settles nonvacuity and the complete reduced-PCE comparison on the declared two-context model. The physical aggregate-to-control carrier, source ledger, and distinct measured response remain certificate and realization records.

**Theorem 9.7b (Response-Shape Moduli and Exponential Rigidity).** The endpoint, monotonicity, concavity, and saturation conditions of Definition 31 leave a continuum of response shapes. For every $a>0$,
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

**Theorem 9.7h (Triangular-Norm Census of Complement-Composition Laws).** Let $T$ be a continuous triangular norm on $[0,1]$: commutative, associative, nondecreasing in each argument, with $T(s,1)=s$. Call $T$ Archimedean when $T(s,s)<s$ for every $s\in(0,1)$. Consider continuous response shapes $G:[0,\infty)\to[0,1]$ with $G(0)=0$ obeying
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

**Resolution TV-CC-02-R2 (Metadata).** Exact domain: continuous solutions $G:[0,\infty)\to[0,1]$ of (9.7h.1) with $G(0)=0$ that tend to $1$, as Theorem 35 normalizes its shapes, under every continuous triangular norm; all continuous solutions under Archimedean norms; and arbitrary binary laws $\Phi$ for Theorem 35 shapes. Premises: continuity of $G$ and $T$. Equivalence: pointwise equality of shapes, with the scale orbit $G(\kappa\,\cdot)$ and generators taken modulo positive multiples. Budget: all nonnegative arguments and all continuous norms, handled analytically. Verifier: the idempotent-trapping argument, Ling's generator, the reduction to $h(x+y)=\min\{h(x)+h(y),f(0)\}$, convexity of inverse functions and substitution of the four generators. Falsifier: a solution tending to $1$ for a norm with an interior idempotent, a nonconstant solution outside (9.7h.2) for an Archimedean norm, or two distinct norms realizing one Theorem 35 shape. Provenance class: source-internal functional-equation classification. Downstream consumers: Definitions 31--32a, Theorems 35 and 9.7b, Definition 35b and `TV-CC-02`. Nonvacuity: the product, Hamacher, Clayton and Łukasiewicz norms. This is `positive-discharge` of the complete continuous composition-law census on saturated shapes. By item 3, a nonconstant solution with limit below $1$ occurs only for a norm with an interior idempotent, and such a solution lies outside the normalization $\lim_{x\to\infty}\mathcal G(x)=1$ of Theorem 35. Selection of the composition norm, the scale $\kappa$ and the ceiling $\alpha_\infty$ through a formal physical response realization, and their calibration, remain `R`-open under `TV-CC-02`.

**Theorem 9.7c (Abstract CC Data Do Not Determine a Physical Control Carrier).** Fix any nonzero finite-dimensional map $L_S$ satisfying Definition 30. The tuple consisting of its operator space, norm, retained states, and retained effects contains no typed map from aggregate sources to a Hamiltonian, field, or instrument. Two source extensions can therefore agree on that complete abstract tuple while assigning respectively
$$
H_{\mathrm{ctrl}}(S)=0
\qquad\text{and}\qquad
H_{\mathrm{ctrl}}(S)=g(S)A
\tag{9.7c.1}
$$
for an independently supplied nonzero observable $A$ and source function $g$ with $g(S)\ne0$.

*Proof.* Definition 30 constrains $L_S$ as a linear operator on the retained event span and contains none of the source, geometry, energy, Hamiltonian, time, or likelihood types appearing in (9.7c.1). Appending either assignment leaves every equation of Definition 30 unchanged. Hence those equations cannot select between the extensions. ∎

Hypothesis 3 nominates the nonzero extension, but a campaign-resolution artifact for its physical claim must populate the source-to-Hamiltonian-to-instrument chain and its energy, timing, likelihood, and held-out response records.

**Theorem 9.7d (Exact Complete-Positivity Interval for the CTB Replacement Line).** Let $d\ge2$, let $\sigma$ be a density operator, and define
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

**Theorem 9.7g (Complete Choi Classification of Finite CC Perturbations).** Let $L:\mathcal B(\mathcal H)\to\mathcal B(\mathcal H)$ be complex-linear, Hermiticity preserving, and trace annihilating on a finite-dimensional retained operator algebra, and put
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

**Resolution TV-CC-04-R2.** Equations (9.7g.1)--(9.7g.4) give `positive-discharge` of the unrestricted finite-dimensional Hermiticity-preserving perturbation classification, covariance test, and bipartite marginal-consistency classification. Theorem 9.7d is the exact one-parameter slice. A physical aggregate-to-control realization remains a separate record.

**Theorem 9.7i (Context-Controlled Partial-Swap Realization of the CTB Family).** Consume the typed two-value source register $\mathcal H_S$, the degenerate control register $C$ and the controlled-$X$ encoder (L.12.8b.1) of Theorem L.12.8b, so that the context value $s_j$ writes $j$ into $C$ while $S$ is retained. Let the target register $\mathrm{tg}$ and an ancilla register $\mathrm{an}$ be copies of one $d$-dimensional Hilbert space, $d\ge2$, carrying the same Hamiltonian $H$; let $\mathrm{SW}$ be their swap; and let $Y$ be a degenerate coin qubit prepared in $I/2$. For a density operator $\sigma$ and $0\le\alpha\le1$, prepare $\mathrm{an}$ in $\sigma$, choose $\theta\in[0,\pi/2]$ with $\sin^2\theta=\alpha$, fix a registered duration $\tau>0$, and put
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

**Resolution TV-CC-04-R3 (Metadata).** Exact domain: the Definition 34 CTB family $L_S(X)=\alpha(\operatorname{tr}(X)\sigma-X)$ for every $d\ge2$, every density operator $\sigma$ and every $0\le\alpha\le1$, and every channel in the spectrahedron (9.7g.1). Premises: the source register and encoder (L.12.8b.1), a $\sigma$-prepared ancilla, a degenerate coin in $I/2$ and a common target/ancilla Hamiltonian; degenerate dilation registers in item 4. Equivalence: realizations are identified when their control maps and target channels agree on all retained states and effects. Budget: both context values, both coin branches, every retained state and effect, and one dilation of Choi rank at most $d^2$. Verifier: the swap identities, the coin average, the energy commutator, the Choi--Kraus--isometry extension and (9.7i.3). Falsifier: a retained state or effect violating (9.7i.3), a nonvanishing energy commutator, or a nonunitary dilation. Provenance class: source-internal finite quantum-circuit construction. Downstream consumers: Definitions 30 and 34, Theorems 9.7a, 9.7d and 9.7g, Hypothesis 3 and `TV-CC-04`. Nonvacuity: Theorem 9.7a's ledger in item 5. This is `positive-discharge` of the response-faithful aggregate-to-control realization for the selected CTB family and for every admissible perturbation of (9.7g.1); with Theorem 9.7g it resolves every registered component of `TV-CC-04`. Biological admission to the engineered source class remains an independent consumer, as in Resolution TV-L-07-R1.

**Resolution TV-CC-01-R2 (Metadata).** Exact domain: Theorem 9.7a's two-context qubit model with $\sigma=|0\rangle\!\langle0|$, maximally mixed input, retained measurement $\{P_0,P_1\}$ and every $0<\alpha\le\alpha_{CC,max}<1/2$. Premises: Theorem 9.7i, items 1--3 and 5, with $u_0\mapsto s_0$ and $u_+\mapsto s_1$. Equivalence: equality of the retained outcome laws and of the realized response map with $L_{u_+}$. Budget: both contexts, both coin branches and both retained outcomes. Verifier: substitution of $I/2$ in (9.7i.2), the encoder identity $U_{\mathrm{ctx}}|s_j,0\rangle=|s_j,j\rangle$ and the energy commutator. Falsifier: a context-$u_0$ law different from $(1/2,1/2)$, a context-$u_+$ law different from (9.7a.1), or a realized map different from (9.7a.2). Provenance class: source-internal finite circuit construction. Downstream consumers: Theorem 34, Theorem 9.7a and `TV-CC-01`. Nonvacuity: every $\alpha\in(0,\alpha_{CC,max}]$. This is `positive-discharge` of the distinct formal response realization on Theorem 9.7a's retained event ledger and of the source, encoder, control, interaction, energy, timing, instrument, response and locality entries of its aggregate-to-control certificate. The cyclic reset ledger of the control, coin and ancilla registers, the analogue of (L.12.8b.10)--(L.12.8b.11), remains `C`-open under `TV-CC-01`.

**Theorem 9.7e (Operational CC and Internal Mutual Information Are Independent Data).** Let an aggregate have a registered bipartition $AB$ and define the operational integration invariant
$$
I_{\mathrm{int}}(A:B)_\eta
=S(\eta_A)+S(\eta_B)-S(\eta_{AB}).
\tag{9.7e.1}
$$
Here $S$ denotes von Neumann entropy.
There are finite models with equal nonzero $\mathrm{CC}$ and different $I_{\mathrm{int}}$, and models with equal $I_{\mathrm{int}}$ and different $\mathrm{CC}$.

*Proof.* Attach the same nonzero external retained-event map $L_S$ to the internal product state $|00\rangle\!\langle00|$ and to a Bell state. Their CC norms agree, while (9.7e.1) is respectively $0$ and $2\ln2$. Conversely, keep either internal state fixed and attach $L_S=0$ or the nonzero map; the integration invariant is unchanged while CC changes. ∎

Therefore Definition 30 entails no nontrivial monotone inequality between CC and (9.7e.1). A relation requires a physical coupling law and an identifiable multivariate protocol rather than identification of the two quantities.

**Theorem 9.7j (Identifiable Integration Invariants Under the Internal-Target Coupling Law).** Let an aggregate with registered bipartition $AB$ have finite-dimensional state $\eta=\eta_{AB}$, and let it carry the internal-target coupling law
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

**Resolution TV-CC-05-R2 (Metadata).** Exact domain: finite-dimensional bipartite aggregate states, the coupling law (9.7j.1) with fixed $0<\alpha\le1$, and three retained data classes: effects spanning the operator space, local marginal effects, and the scalar CC value. Premises: the declared coupling law (9.7j.1), which is Definition 34's CTB form with target $\eta$, and Theorem 9.7i for realization. Equivalence: equality of the complete retained response table, or of the scalar CC in item 4. Budget: all probe states and retained effects, and the witnesses $I/4$, $|00\rangle$ and $|\Phi^+\rangle$. Verifier: the affine identity for $R_\eta$, tomographic completeness of product effects, the equal marginals of the witnesses, Lemma 9.1a and the partial-swap identities. Falsifier: two states with equal retained values and different response tables, or a witness pair with different retained data. Provenance class: source-internal finite identifiability classification and circuit realization. Downstream consumers: Proposition 14, Theorem 9.7e, integration and coherence protocols, and `TV-CC-05`. Nonvacuity: the displayed witnesses. This is `positive-discharge` of the identifiable-invariant classification and of its formal realization on the declared coupling-law branch (9.7j.1). Derivation of the aggregate's physical coupling law from the Hypothesis 3 mechanism, together with the classification and formal realization of its identifiable invariants where that law differs from (9.7j.1), remains `M+R`-open under `TV-CC-05`.

**Theorem 9.7f (Fresh Records with Static Response Context).** Let the response context space be the singleton $\{c_*\}$ carrying a fixed admissible nonzero CC map. If the branch declares a nonempty high-CC subrange, choose the map norm in that subrange. At update $n$, append a fresh internal binary record $Z_n$ to a retained tape,
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

**Theorem 9.7k (Acquisition-Displacement Classification of Recursive Response Contexts).** Let fresh records $Z_1,Z_2,\ldots$ take values in a finite alphabet $\mathcal Z$ with $|\mathcal Z|=b\ge2$, let the response context take values in a finite set $\mathcal C$ with $|\mathcal C|=k$ carrying a metric $d_{\mathrm{ctx}}$, and let the context be the recursive projection
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

**Resolution TV-CC-06-R2 (Metadata).** Exact domain: finite recursive response-context projections (9.7k.1), and for the thresholds of items 1--2 every projection sequence of the retained record, with record alphabet of size $b\ge2$ and context set of size $k$, together with the trine CTB realization of item 4. Premises: deterministic updates; for item 3, uniform records independent of past contexts; for item 4, a declared nonempty high-CC subrange containing $\alpha$. Equivalence: projections are compared by their update maps, and realizations by their context-to-response maps and context metric. Budget: all $k^{bk}$ update maps at each step, both record values, three contexts and three targets. Verifier: exhaustive counting of fixed-point-free injections, the conditional-mutual-information identity, Lemma 9.1a and the trine overlaps. Falsifier: a displacing faithful map with $k\le b$, a displacing two-context map that depends on the record, or a trine displacement different from $\sqrt3/2$. Provenance class: source-internal finite classification and quantum-circuit realization. Downstream consumers: Propositions 15--16, Theorem 9.7f and `TV-CC-06`. Nonvacuity: the $\mathbb Z_3$ realization and the two-context flip. This is `positive-discharge` of the classification of nontrivial recursive response-context projections and of the minimal realization of Proposition 16's acquisition-to-displacement premise; with Theorem 9.7f it resolves every registered component of `TV-CC-06`.

**Resolution ledger 9.7-R1.** These are analytic finite-model artifacts. Equivalence fixes the retained event map and response probabilities while allowing source extensions or internal aggregate states to vary; budgets are the displayed qubits, two contexts, finite operator spaces, and finite records.

| Target | Exact scoped proposition and polarity | Verifier and falsifier | Downstream consumers |
|:--|:--|:--|:--|
| `TV-CC-01` | Finite model-level existence, attainment, strict gap, attraction, and nonzero response are `positive-discharge`; physical realization is open. | Evaluate (9.7a.1)--(9.7a.2), both displayed potential values, and the two-state transition graph; loss of the strict gap or zero norm falsifies it. | Theorem 34 and every nonzero-CC branch. |
| `TV-CC-02` | Endpoint/concavity rigidity is `nonentailment`; exponential rigidity on (9.7b.2) is `positive-discharge`. | Differentiate (9.7b.1) and check the complement law; a nonexponential continuous solution falsifies rigidity. | Definitions 31--35b and response ceilings. |
| `TV-CC-03` | A physical source/control carrier from the abstract CC tuple is `nonentailment`. | Type-check the two extensions (9.7c.1); an existing equation that fixes the source map invalidates the scoped independence proof. | Hypothesis 3, Appendices L/S and experimental likelihoods. |
| `TV-CC-04` | The exact CP interval and covariance class of the algebraic replacement line containing the CTB branch are `positive-discharge`; Definition 34 retains $0\le\alpha\le1$. Theorem 9.7g and Resolution TV-CC-04-R2 give `positive-discharge` of the unrestricted finite-dimensional perturbation, covariance, and bipartite marginal-consistency classifications on their stated domains; Theorem 9.7i supplies the response-faithful realization. | Diagonalize (9.7d.4) or apply the rank-one criterion; a negative Choi eigenvalue inside, or a positive semidefinite Choi matrix outside, falsifies the interval. | Definitions 33--34, Theorem 37 and bipartite consistency. |
| `TV-CC-05` | A CC--mutual-information relation from current definitions is `nonentailment`. | Compute the product/Bell invariants and attached map norms; failure to preserve the stipulated retained map or state invalidates a witness. | Proposition 14 and integration/coherence experiments. |
| `TV-CC-06` | On every branch with a declared nonempty high-CC subrange, fresh acquisition plus a CC value in that subrange forcing context displacement is `nonentailment`. | Check the chosen map norm, fresh conditional entropy, and (9.7f.1); a rule identifying every retained bit with the response context lies outside the frozen class. | Propositions 15--16 and introspection dynamics. |

