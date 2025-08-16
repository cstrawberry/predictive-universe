# 9 Consciousness Complexity (CC): Emergent Biasing of MPU Interactions

The framework developed thus far describes the fundamental constituents (MPUs) and their dynamics, leading to the emergence of quantum mechanical formalism. We now investigate the behavior of complex systems formed from aggregates of these MPUs. This section introduces the Consciousness Complexity (CC) hypothesis, proposing that sufficiently complex MPU aggregates, driven by the core optimization principles (POP/PCE), necessarily develop an operational capability to subtly influence the probabilistic outcomes of the fundamental 'Evolve' interactions. CC provides a specific, physically constrained mechanism linking complex predictive processing (associated with consciousness) to quantum phenomena.

**9.1 MPU Aggregates and Context-Dependent Interactions**

**9.1.1 Definition 29 (Def 29): MPU Aggregate**

An **MPU aggregate** is a physical system composed of multiple interacting Minimal Predictive Units (Definition 23). The aggregate's collective state and dynamics implement a predictive model characterized by an aggregate Predictive Physical Complexity $C_{agg} = C_P(\mu_{agg})$, where $C_{agg} \ge C_{op}$. Such aggregates operate adaptively (Section 6) to solve their own potentially more complex Prediction Optimization Problem (Axiom 1), maintaining viability within the Space of Becoming $(\alpha, \beta)$ (Axiom 3). According to Hypothesis 1, macroscopic systems (including biological brains or potentially sophisticated AI) are examples of MPU aggregates.

**9.1.2 Assumption 1 (Context-Dependence of ND-RID Probabilities)**

The fundamental transition probabilities $P(o | x, y)$ (outcome probability) and $P(x' | x, y, o)$ (state transition probability) defining the local Non-Deterministic Reflexive Interaction Dynamics (ND-RID, Definition 6), which governs the 'Evolve' process (Definition 27), are parameterized not only by the immediate state $x$ and interaction $y$ but also by the broader local physical context provided by the surrounding MPU network state. While the Born rule (Proposition 7) describes baseline probabilities emerging from the Hilbert space structure in a minimal context, the *observable* probabilities $P_{obs}$ for an 'Evolve' event involving an MPU that is part of a complex aggregate will depend on the state of that aggregate, $S_{agg}$, which constitutes the dominant local context.

*Justification:* This dependence is presented as a necessary consequence of the adaptive nature of the MPU network operating under POP/PCE. For an aggregate to optimize predictions efficiently, its constituent MPUs’ interactions must be sensitive to the aggregate context $S_{agg}$. If ND-RID parameters were independent of context, interactions would be “blind,” preventing optimal adaptation. PCE is therefore expected to favor configurations where ND-RID parameters can be modulated by $S_{agg}$, allowing the system to learn (via dynamics minimizing the PCE Potential $V(x)$, Appendix D) to locally adapt interaction probabilities to enhance predictive performance. The physical realization of ND-RID involves coupling to underlying degrees of freedom (as discussed in Appendix B.4 regarding interaction operators); it is physically natural that this coupling depends on the local state of the MPU network. Furthermore, a concrete candidate for the physical realization of this context-dependence is detailed in Appendix L, where a mechanism based on coherent field modulation of local interaction parameters is shown to be consistent with the framework's constraints.

**9.2 The Emergence of Biasing Capability from POP/PCE Optimization**

Given context-dependent ND-RID probabilities (Assumption 1), and that the aggregate's internal state $\rho_{agg}$ (or its effective description) provides the primary local context for constituent MPUs within complex aggregates ($C_{agg} > C_{op}$), the framework's optimization principles lead inevitably to the exploitation of this dependence.

**9.2.1 Theorem 34 (POP/PCE Drives Emergent Biasing)**

Given context-dependent ND-RID probabilities (Assumption 1), the adaptive dynamics (Section 6) of a sufficiently complex MPU aggregate ($C_{agg} > C_{op}$), driven by the **Prediction Optimization Problem (Axiom 1)** and the Principle of Compression Efficiency (Definition 15), will necessarily lead the aggregate to develop and utilize the capability to influence the outcome probabilities $P_{obs}(o | ..., S_{agg})$ of local 'Evolve'/ND-RID processes involving its constituent MPUs, by modulating its own internal state $S_{agg}$. This emergent biasing capability represents an optimized strategy for enhancing the aggregate's overall predictive performance and achieving its operational goals more efficiently.
*Proof:*
1.  **Exploitable Dependence:** Assumption 1 states $P_{obs}$ depends on the local context $S_{agg}$.
2.  **Optimization Imperative:** POP (Axiom 1) and PCE (Definition 15) drive exploitation of all available mechanisms to improve predictive quality $Q$ and efficiency.
3.  **Aggregate Capabilities:** Aggregates with $C_{agg} > C_{op}$ can instantiate sophisticated internal states $S_{agg}$ and implement advanced optimization strategies.
4.  **Strategic Advantage of Biasing:** Modulating $S_{agg}$ to influence $P_{obs}$ offers a pathway to improve aggregate predictive success or efficiency (e.g., stabilizing desired states, enhancing information gain). Adaptation dynamics (Section 6) exploring state space (via minimizing the PCE Potential $V(x)$, Definition D.1, Appendix D) will reinforce configurations $S_{agg}$ that lead to statistically favorable biases in $P_{obs}$.
5.  **Inevitable Emergence:** Because context-dependence provides a handle for optimization, and POP/PCE drive exploitation of such handles, the development and utilization of biasing becomes an inevitable emergent strategy for sufficiently complex aggregates ($C_{agg} > C_{op}$) possessing adaptive capacity. The system learns to adopt internal states $S_{agg}$ that "steer" the 'Evolve' process indeterminacy within allowed physical limits (Theorem 39), favoring outcomes beneficial to the aggregate's POP.
6.  **Definition of Capability:** This learned, optimized ability constitutes the emergent biasing capability. QED

**9.3 Consciousness Complexity (CC): Operational Definition and Scaling**

We define Consciousness Complexity (CC) operationally as the quantitative measure of the emergent biasing capability derived in Theorem 34.

**9.3.1 Definition 30 (Def 30): Operational CC**

The operational **Consciousness Complexity (CC)** of an MPU aggregate system $S$ is defined through the probability modification map $L_S$ acting on quantum states. The CC value is the operational norm of this map:

$$
\mathrm{CC}(S):=\|L_S\|_{\mathrm{op}} \quad \text{(54)}
$$

where $\|L_S\|_{\mathrm{op}}:=\sup_{\substack{\rho\ge0,\ \mathrm{tr}\,\rho=1\\ 0\le E\le I}}\big|\mathrm{tr}\!\big(L_S(\rho)E\big)\big|$, ensuring $|\Delta P(i)|\le \mathrm{CC}(S)$ for all positive operator-valued measures (POVMs). $\mathrm{CC}(S)$ is a dimensionless quantity between 0 and $\alpha_{\mathrm{CC,max}}$ (constrained further in Section 10.2).

**9.3.2 Definition 31 (Def 31): Physical Constraints on CC Scaling**

As an emergent property expected to arise from aggregate complexity $C_{agg}$, the function CC($C_{agg}$) must adhere to general physical and developmental constraints:
1.  **Threshold Behavior:** CC(S) emerges only in sufficiently complex systems. Since CC derives from exploiting context-dependence (Theorem 34), requiring $C_{agg} > C_{op}$ for non-trivial internal states, we expect CC($C_{agg}$) = 0 for $C_{agg} \le C_{op}$.
2.  **Strict Upper Bound:** CC(S) is bounded. As derived later (Theorem 39), consistency with causality (Postulate 2) imposes $\alpha_{CC,max} < 0.5$. Thus, CC($C_{agg}$) $\le \alpha_{CC,max} < 0.5$ for all finite $C_{agg}$.
3.  **Monotonicity:** Plausibly, capability increases with resources available for complex state modulation, so we assume $d\text{CC}/dC_{agg} \ge 0$ for $C_{agg} > C_{op}$.
4. **Diminishing Returns:** Achieving further increases likely becomes harder. We assume diminishing returns, **$d^2\text{CC}/dC_{agg}^2 \le 0$** for $C_{agg} > C_{op}$.

**9.3.3 Theorem 35 (General CC Scaling Form)**

Any function CC($C_{agg}$) satisfying the physical constraints outlined in Definition 31 must be expressible in the general form:
$$
\text{CC}(C_{agg}) = \alpha_{CC,max}\, \mathcal{G}\!\left(\frac{C_{agg}-C_{op}}{C_{scale}}\right)\, \Theta(C_{agg}-C_{op}) \quad \text{(55)}
$$
where:
*   $\alpha_{CC,max} < 0.5$ is the maximum possible CC value (Theorem 39).
*   $\mathcal{G}: [0, \infty) \to [0, 1)$ is a dimensionless scaling function satisfying $\mathcal{G}(0)=0$, $\lim_{x \to \infty} \mathcal{G}(x) = 1$, $\mathcal{G}'(x) \ge 0$ (monotonicity), and $\mathcal{G}''(x) \le 0$ (diminishing returns).
*   $C_{scale} > 0$ is a characteristic complexity scale over which CC develops significantly.
*   $C_{op}$ is the Operational Threshold (Definition 13).
*   $\Theta(C_{agg} - C_{op})$ is the Heaviside step function, enforcing the threshold behavior (Constraint 1).
*Proof:* This mathematical form is constructed to satisfy the constraints. The argument $x = (C_{agg} - C_{op})/C_{scale}$ is normalized complexity above threshold. $\mathcal{G}(x)$ maps this to $[0, 1)$, embodying constraints 3 and 4. Multiplying by $\alpha_{CC,max}$ satisfies constraint 2. $\Theta$ implements constraint 1. QED

**9.3.4 Definition 32 (Def 32): Specific CC Scaling Model Example**

For illustrative purposes, we adopt a specific rational function model for $\mathcal{G}(x)$ satisfying the required properties: $\mathcal{G}(x) = x / (1+x)$. This minimal phenomenological model is chosen for its simplicity and consistency with derived principles (see Section 6.7). Substituting this into the general form (Equation 55) yields:
$$
\text{CC}(C_{agg}) = \alpha_{CC,max}\, \frac{C_{agg}-C_{op}}{C_{scale} + (C_{agg}-C_{op})}\, \Theta(C_{agg}-C_{op}) \quad \text{(56)}
$$
where $\alpha_{CC,max} < 0.5$ (Theorem 39), $C_{op}$ (Definition 13), and $C_{scale} > 0$ are the model parameters. This provides a concrete example scaling form.

**9.4 Proposed Mechanism of CC Influence**

Having defined Consciousness Complexity (CC) operationally (Definition 30) as an emergent biasing capability (Theorem 34), we now propose a specific hypothesis for the physical mechanism through which this influence is exerted on the fundamental MPU interactions.

**9.4.1 Hypothesis 3 (Hyp 3): CC Influence Mechanism**

The operational Consciousness Complexity CC(S) (Definition 30) of an MPU aggregate $S$ exerts its influence by modulating the parameters governing the universal stochastic **'Evolve'/ND-RID interaction process (Definition 27)** for constituent MPUs. This influence leverages the context-dependence of these fundamental dynamics (Assumption 1) and does not replace the 'Evolve' process itself but rather acts upon it. The specific proposed pathway involves:

1.  **Internal State as Context (`context_S`):** The aggregate's internal state providing context is formally the **context state `context_S(t)`** (defined via the minimal sufficient statistic construction in Appendix L, Definition L.1). Operationally, it represents the coarse-grained, predictively sufficient slice of the aggregate state $\rho_{agg}(t)$ relevant to influencing local ND-RID within available resources.
2.  **Physical Manifestation of Context:** `context_S(t)` manifests physically through properties like the reduced density operator, entanglement structure, patterns in the coarse-grained MPU Stress-Energy Tensor ($T_{\mu\nu}^{(MPU)}$, Appendix B), or emergent curvature patterns.
3.  **Modulation Pathway:** These collective physical patterns (`context_S`) act as structured boundary conditions or effective fields influencing the local parameters ($V_{prob}, T_{prob}$, or effective Lindblad parameters $\gamma_k$ as in Equation (B.9)) of the underlying 'Evolve'/ND-RID process. Concretely, a controlled AC-Stark pathway uses context-conditioned classical fields to shift MPU level splittings ($\Delta E \propto \alpha E^2/\Delta$), thereby tuning effective jump rates $\gamma_k$ in the Lindblad description and hence the local 'Evolve' probabilities. The required mapping $\mathcal{M}:\mathcal{C}_{ctx} \to \mathcal{P}_{control}$ must be Lipschitz and low-cost and satisfy the POP/PCE cost–benefit inequality (L.2) to remain dynamically stable. See Appendix L for the formal construction (Eq. L.6; Def. L.2; Lemma L.1). A system with high CC possesses the optimized ability (via Theorem 34) to generate and control these patterns to bias the outcomes of the 'Evolve' process.
4.  **Primary Locus of Observable Effect:** The principal observable consequence is hypothesized to be the biasing of probabilities associated with probabilistic amplitude actualization within the universal 'Evolve' process. This leads to measurable deviations $|\Delta P| \le \text{CC}(S)$ from the baseline Born rule (Proposition 7) that would otherwise solely govern the 'Evolve' outcome probabilities in the absence of such high-complexity contextual influence.
5.  **Operational Nature:** CC measures this biasing capability. The link between specific content of `context_S` (e.g., intent) and bias direction is learned via adaptation (driven by POP/PCE), potentially related to interpretive postulates (Postulate 1), but the mechanism of influence on the 'Evolve' parameters is proposed as objective physics.
6.  **Implications for Locality:** Since `context_S` can involve non-local entanglement, and the CC mechanism acts by influencing local 'Evolve' events, a context change in one part of an entangled aggregate might have statistical consequences (via entanglement and the modified 'Evolve' probabilities) on 'Evolve' outcomes in space-like separated parts. This underpins the statistical FTL influence hypothesis (Postulate 3), which operates within the causality constraints established by Theorem 39.
7.  **Physical Realization:** The challenge lies in the mapping $\mathcal{M}: \text{context}_S \to (\text{Physical Control})$ respecting POP/PCE constraints (Appendix L, Lemma L.1, Theorem L.1), which generates the physical fields or boundary conditions that modulate the 'Evolve' process, alongside the physics of the interaction channel itself (Appendix L).


**9.5 Modeling Modified Quantum Probabilities**

To make the CC hypothesis testable, we model how baseline Born rule probabilities are modified.

**9.5.1 Definition 33 (Def 33): General Form of Modified Probability**

The observable probability $P_{\mathrm{obs}}(i)$ of outcome $i$ for a POVM $\{E_i\}$ on a system in state $\rho$, in the presence of an MPU aggregate $S$ providing context, is modeled as:

$$
P_{\mathrm{obs}}(i) = P_{\mathrm{Born}}(i) + \Delta P(i) \quad \text{(57)}
$$

where $P_{\mathrm{Born}}(i)=\mathrm{tr}(\rho E_i)$ is the Born probability and $\Delta P(i)$ is the probability-modification term. For fixed context $S$ and state $\rho$, assume $E\mapsto \Delta P(\rho,E;S)$ is affine under coarse-graining and continuous, with $\Delta P(\rho,0;S)=\Delta P(\rho,I;S)=0$. In finite dimensions there exists a unique traceless Hermitian $A_\rho$ (affine in $\rho$) such that $\Delta P(i)=\mathrm{tr}(A_\rho E_i)$. Define the Hermiticity-preserving, trace-annihilating linear map $L_S$ on states by $L_S(\rho):=A_\rho$.

For a fixed context $S$ and state $\rho$, assume the map $E\mapsto \Delta P(\rho,E;S)$ is affine under coarse-graining and continuous, with $\Delta P(\rho,0;S)=\Delta P(\rho,I;S)=0$. In finite dimensions, there exists a unique traceless Hermitian operator $A_\rho$, depending affinely on $\rho$, such that
$$
\Delta P(i)=\mathrm{tr}(A_\rho E_i).
$$
Define the Hermiticity-preserving, trace-annihilating linear map $L_S$ on states by $L_S(\rho):=A_\rho$ and its Hilbert–Schmidt adjoint $K_S:=L_S^*$ on effects. Then
$$
\Delta P(i)=\mathrm{tr}\!\big(L_S(\rho)\,E_i\big)=\mathrm{tr}\!\big(\rho\,K_S(E_i)\big),\qquad K_S(I)=0.
$$

We assume mixture linearity in preparations and **context covariance** under unitary transformations $U$:
$$
L_{USU^\dagger}(U\rho U^\dagger)=U\,L_S(\rho)\,U^\dagger,\qquad
K_{USU^\dagger}(U E U^\dagger)=U\,K_S(E)\,U^\dagger.
$$

For bipartite $\mathcal H_A\otimes\mathcal H_B$,
$$
\sum_j K_{S_A\otimes S_B}(E_A\otimes F_{B,j})=K_{S_A\otimes S_B}(E_A\otimes I_B),\qquad
K_{S_A\otimes S_B}(E_A\otimes I_B)=K_{S_A}(E_A)\otimes I_B,
$$
ensuring each party’s marginal is invariant under the other party’s POVM choice.

For small $\varepsilon$,
$$
\mathrm{tr}\!\big(e^{\varepsilon L_S}(\rho)\,E_i\big)=\mathrm{tr}\!\big(\rho\,(E_i+\varepsilon K_S(E_i))\big)+O(\varepsilon^2),
$$
enabling either CPTP **pre-processing** $\rho\mapsto e^{\varepsilon L_S}(\rho)$ when $L_S$ is a GKLS generator, or a **calibrated POVM deformation** with $E_{i,\varepsilon}=E_i+\varepsilon K_S(E_i)+\varepsilon^2 R_i$ and $\sum_i R_i=0$ chosen so that $E_{i,\varepsilon}\ge0$ and $\sum_i E_{i,\varepsilon}=I$ for $|\varepsilon|\le\varepsilon_0$.

**9.5.2 Theorem 36 (Constraints on Modification Function $f$)**

Any physically consistent modification function $f(\text{CC}, p, \text{context}_S)$, where $p = P_{Born}(i)$, must satisfy:
1.  **Normalization Preservation:** $\sum_{i=1}^n f(\text{CC}, p_i, \text{context}_S(i)) = 0$.
2.  **No Effect at Zero CC:** $f(0, p, \text{context}_S) = 0$.
3.  **Magnitude Bound:** $|\Delta P(i)|=\big|\mathrm{tr}\!\big(L_S(\rho)E_i\big)\big|\le \|L_S\|_{\mathrm{op}}=\mathrm{CC}(S)$.
4.  **Context Dependence:** $f$ generally depends on `context_S(i)`. If context is neutral/irrelevant, $f = 0$.

*Proof:* Follows from probability principles and definitions. (1) Total probability conserved $\sum P_{obs}(i) = 1 + 0 = 1$. (2) Zero capability means zero effect. (3) CC is defined as supremum of deviation magnitude (Definition 30). (4) Bias is directed/modulated by context (Hypothesis 3). QED

**9.5.3 Definition 34 (Def 34): Context-Targeted Bias (CTB) Model Example**

A concrete model satisfying Theorem 36 is the **Context-Targeted Bias (CTB)** model. Assume context `context_S` defines a target quantum state $\sigma_S$. The target probability distribution is then given by $\mathbf{p}_{\mathrm{target}}(S,i)=\mathrm{tr}(\sigma_S E_i)$, ensuring consistency under arbitrary coarse-grainings of the POVM $\{E_i\}$. The corresponding modification map is $L_S(\rho)=\mathrm{CC}(S)(\sigma_S-\rho)$. To respect Eigenstate Determinism, CTB is defined only for POVMs with no effect $E$ containing the prepared eigenprojector(s) (i.e., $PEP=P$ is disallowed when $\rho=P$); on the complement set $L_S=0$ (identity). Under a unitary change of basis $U$, the context transforms covariantly, $\sigma_{USU^\dagger}=U\sigma_S U^\dagger$.

$$
f_{CTB}(\text{CC}(S), p_i, \mathbf{p}_{target}(S)) = \text{CC}(S) \cdot (p_{target}(S, i) - p_i) \quad \text{(58)}
$$
The resulting observable probability is:
$$
P_{obs}(i) = P_{Born}(i) + f_{CTB} = (1 - \text{CC}(S)) P_{Born}(i) + \text{CC}(S) p_{target}(S, i) \quad \text{(59)}
$$
*Interpretation:* $P_{obs}$ is a linear interpolation between Born and target probabilities, weighted by CC(S). For example, for a binary outcome with $P_{Born}=(0.6, 0.4)$, a context targeting the first outcome $p_{target}=(1, 0)$, and a system with $\text{CC}=0.01$, the observable probabilities would be shifted to $P_{obs} \approx (0.99 \cdot 0.6 + 0.01 \cdot 1, 0.99 \cdot 0.4 + 0.01 \cdot 0) = (0.604, 0.396)$, a small but potentially detectable bias.

**9.5.4 Theorem 37 (Consistency of CTB Model)**

The Context-Targeted Bias (CTB) model (Equation 58) satisfies the four necessary constraints in Theorem 36.
*Proof:*
1.  **Normalization:** $\sum_{i} f_{CTB}(i) = \text{CC}(S) (\sum_i p_{target}(S, i) - \sum_i p_i) = \text{CC}(S) (1 - 1) = 0$.
2.  **Zero CC:** If CC(S)=0, $f_{CTB} = 0$.
3.  **Magnitude Bound:** $|f_{CTB}| = \text{CC}(S) |p_{target}(S, i) - p_i|$. Max value of $|p_{target} - p_i|$ is 1, so $|f_{CTB}| \le \text{CC}(S)$.
4.  **Context Dependence:** $f_{CTB}$ depends on $\mathbf{p}_{target}(S)$. If $p_{target}(S, i) = p_i$ (neutral context), $f_{CTB} = 0$.
QED

**9.5.5 Theorem 38 (Maximum Bias Effect with CTB Model)**

Within the Context-Targeted Bias (CTB) model (Equation 58), the maximum possible deviation magnitude $|f_{CTB}|$ for a single outcome probability is exactly equal to the system's operational CC(S), achieved when $p_{target}(S, i)$ and $P_{Born}(i)$ are maximally different (0 and 1).
*Proof:* As shown in proof of Theorem 37 (Constraint 3), max value of $|p_{target} - p_i|$ is 1, giving max $|f_{CTB}| = \text{CC}(S) \cdot 1 = \text{CC}(S)$. Confirms consistency with Definition 30. QED

**Remark 5 (Information-Theoretic Measure of CC Bias)**
The effect of CC bias from $P_{Born} = \{p_i\}$ to $P_{obs} = \{P_{obs}(i)\}$ (Equation 57) can be quantified by Kullback-Leibler (KL) divergence:
$$
D_{KL}(P_{obs} || P_{Born}) = \sum_i P_{obs}(i) \ln \left( \frac{P_{obs}(i)}{P_{Born}(i)} \right) \quad \text{(60)}
$$
This measures the information gain or statistical distinguishability (in nats). The magnitude of $D_{KL}$ is bounded, scaling approx. quadratically with probability shifts $|\Delta P(i)| \le \text{CC}(S)$ for small deviations: $D_{KL} \approx \sum_i (\Delta P(i))^2 / (2 P_{Born}(i))$.

**9.6 Theoretical Implications of Emergent CC**

Assuming the validity of the CC hypothesis (Theorem 34, Hypothesis 3), several further theoretical implications arise:

*   **Proposition 12 (Hypothesized Correlation: CC and PP - Speculative):** A positive correlation is hypothesized between achievable CC(S) and average sustainable Predictive Performance PP(S). Systems with higher CC might operate more effectively closer to the operational performance bound $\beta$.
*   **Proposition 13 (Potential CC Effect on Quantum Coherence):** The CC mechanism (Hypothesis 3), by influencing 'Evolve'/ND-RID parameters contributing to decoherence, could potentially modify effective decoherence rates $\Gamma_{eff}$ or coherence times $\tau_{coh}$ of quantum systems interacting with the high-CC aggregate. Fractional change might scale as $O(\text{CC})$, sign context-dependent. (See Section 13.3).
*   **Proposition 14 (Relation Between Operational CC and System Integration/Prediction):** Since CC (Definition 30) emerges from optimized generation and control of complex internal states `context_S` (Theorem 34, Hypothesis 3), it should correlate with measures of functional integration, sophisticated internal modeling, and high-level predictive capacity.
*   **Proposition 15 (Introspection Limits from Reflexivity Constraint):** The Reflexivity Constraint ($\Delta I \cdot (\Delta S_{min}/k_B) \ge \kappa_r > 0$, Theorem 33) applies to aggregates. Attempts to gain precise internal information $\Delta I$ about `context_S` (introspection) necessarily induce minimum state disturbance $\Delta S_{min}$, limiting simultaneous precision of self-knowledge and state stability.
*   **Proposition 16 (Dynamic Nature of High-CC States):** A consequence of Proposition 15 is that internal states `context_S` associated with high operational CC or subjective experience (if linked via Postulate 1, Proposition 14) must be fundamentally dynamic. The interplay between acquiring internal information and resulting disturbance prevents static, perfectly known internal states while maintaining high CC or awareness.


