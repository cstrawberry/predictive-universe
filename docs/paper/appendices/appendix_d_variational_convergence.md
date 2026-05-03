# Appendix D: Variational Perspective and Dynamical Convergence to Alignment & Regularity

## D.1 Introduction: Optimization Landscape and Convergence

This Appendix develops the variational perspective on the Predictive Universe (PU) framework's dynamics, providing rigorous dynamical justifications for two cornerstone results presented in the main text:
1.  **Theorem 2 (Dynamically Enforced Functional Correspondence):** Isolating the exact equilibrium condition $C_P(v)=\langle \hat{C}_v \rangle$ for true stable PCE equilibria, together with the quantitative operational tracking bound that drives the proxy toward that condition.
2.  **Theorem 43 (Necessary Emergence of Geometric Regularity):** Showing that geometric regularity characterizes the lowest-potential sector of the dynamics and is selected by the low-noise detailed-balance stationary regime, complementing the necessity argument in Appendix C.

We introduce the **Principle of Compression Efficiency (PCE) Potential $V(x)$**, an effective potential function derived from the framework's core principles (Axiom 1: POP, Definition 15: PCE). The system's slow adaptation dynamics, governing the evolution of the network configuration $x(t)$, are modeled as a stochastic gradient flow on the landscape defined by $V(x)$. The stochastic differential equation (SDE) governing these dynamics is:
$$
\mathrm{d}x_t \;=\; -\eta(x_t)\,\nabla V(x_t)\,\mathrm{d}t \;+\; \sqrt{2D(x_t)}\,\mathrm{d}W_t,
\quad \text{(D.0)}
$$
where the potential $V(x_t)$ serves as a stochastic Lyapunov function (after an irrelevant additive normalization one may take $V\ge 0$). Under suitable conditions (detailed in Section D.6.2), the expected rate of change satisfies $\frac{\mathrm{d}}{\mathrm{d}t}\mathbb{E}[V(x_t)]\le 0$ when far from equilibrium, driving the system towards lower-potential regions. The stability of this process requires that the gradient $\nabla V$ be well-defined, which in turn necessitates that the underlying cost functions are non-contextual (i.e., independent of the choice of predictive basis), a key justification for the derivation of the Born rule (Appendix G). As detailed in Appendix X, this foundational potential $V(x)$ gives rise to the 1PI effective action of quantum field theory, and the stochastic gradient flow on $V(x)$ is a specific realization of the functional renormalization group. By analyzing the structure of $V(x)$ and the properties of this process, we prove three complementary results: exact alignment as a necessary condition at true stable PCE equilibria, quantitative proxy tracking with an explicit noise floor under the operational stochastic dynamics, and geometric regularity of the lowest-potential sector, which in detailed-balance low-noise regimes carries the dominant stationary mass. This establishes these properties not as assumptions, but as dynamically selected consequences of the fundamental optimization processes governing the MPU network under the stated hypotheses.

## D.2 The Instantaneous PCE Potential ($V(x)$)

The PCE principle mandates that the MPU network seeks configurations $x$ that optimize the trade-off between maximizing predictive utility (Benefit) and minimizing comprehensive costs (Operational, Propagation, Adaptation). The PCE Potential $V(x)$ quantifies this trade-off, such that configurations minimizing $V(x)$ correspond to the PCE-optimal states. $V(x)$ represents the effective potential governing the *slow* adaptation dynamics of the network configuration $x(t)$, encompassing network structure $\mathcal{N}(t)$, local MPU complexities $\{C_v(t) = \langle \hat{C}_v \rangle_{x(t)}\}$, and related macroscopic variables influencing costs and benefits.

**Definition D.1 (Structure of the PCE Potential $V(x)$).** Let $x$ represent the complete configuration state of the MPU network within the admissible state space $\mathcal{X}_{adm}$. The effective PCE Potential $V(x)$, representing the net cost rate the system seeks to minimize under its operational dynamics, is constructed as:
$$
V(x) = V_{op}(x) + V_{prop}(x) - V_{benefit}(x) + V_{penalty}(x)
\quad \text{(D.1)}
$$
where:
*   **$V_{op}(x) = \sum_{v} \langle \lambda \hat{R}(C_v) + \hat{R}_I(C_v) \rangle_{\rho^{(v)}(x)}$**: The total expected operational cost rate (power) associated with the complexity configuration $\{C_v = \langle \hat{C}_v \rangle_x\}$, including physical costs $R(C)$ and informational costs $R_I(C)$ (Definition 3), weighted by the scarcity factor $\lambda$ (Definition 20).
*   **$V_{prop}(x) = \sum_{(u,v)} \langle \Phi(w_{uv}) \rangle_{\rho(x)}$**: The total expected propagation cost rate associated with maintaining predictive coherence and communication infrastructure across the network. The cost function $\Phi(w_{uv})$ for a link $(u,v)$ with weight $w_{uv}$ (related to ND-RID fidelity $f_{RID}$ and cost $\varepsilon$, cf. Definition 35) is fundamentally information-theoretic: it scales with the rate of information required to be sent across the link to maintain coherence, penalized by the link's finite channel capacity $C_{\max}$ (derived from ND-RID limits in Appendix E). Irregular network geometries (as analyzed in Appendix C) increase path lengths and decrease effective channel fidelity, thus quantitatively increasing $V_{prop}$. A concrete example of this principle is used in Appendix G.8 to model the communication cost of maintaining gauge field coherence (see Equation G.8.5).
*   **$V_{benefit}(x) = \sum_{v} \Gamma_0 B(PP_v(x))$**: The total effective power-equivalent predictive benefit derived from the network's performance. $PP_v(x)$ is the local Predictive Performance (Definition 7) of MPU $v$ in configuration $x$, dependent on $C_v = \langle \hat{C}_v \rangle_x$ and the local effective target complexity $\hat{C}_{target}(v, x)$ via the Law of Prediction (Theorem 19, Equation 22). $B(PP)$ is a monotonically increasing benefit function (e.g., $B(PP) = PP$ or related to reduction in prediction error), and $\Gamma_0$ is the power conversion factor (Definition 20).
*   **$V_{penalty}(x)$**: Represents effective penalty terms implicitly required for the consistency of the framework. As derived below (Sections D.3, D.4), self-consistent optimization requires that the structure of $V(x)$ effectively incorporates terms equivalent to penalties for complexity misalignment ($V_{proxy}$) and geometric irregularity ($V_{geom}$).

The potential $V(x)$ is assumed to be continuously differentiable ($C^1$) with respect to the relevant components of configuration $x$ within $\mathcal{X}_{adm}$, and bounded below. The system's adaptation dynamics aim to minimize this operational potential $V(x)$, subject to the resource-order gate below.

**Definition D.1b (PCE Resource Preorder and Dual Certificates).** For each admissible configuration $x\in\mathcal X_{adm}$ define its PCE resource vector
$$
r(x)
=
\big(
V_{op}(x),
V_{prop}(x),
V_{penalty}(x),
-V_{benefit}(x)
\big)
\in\mathbb R^4.
$$
Let $K=\mathbb R_{\ge0}^4$ be the positive resource cone. Define
$$
x\preceq_{\mathrm{PCE}}y
\quad\Longleftrightarrow\quad
r(y)-r(x)\in K.
\tag{D.1b}
$$
Thus $x$ is no more costly than $y$ in every PCE component and at least as beneficial in the benefit coordinate. A dual PCE certificate is any vector
$$
w\in K^*=\mathbb R_{\ge0}^4
$$
and its scalar certificate functional is
$$
V_w(x)=w\cdot r(x).
\tag{D.1c}
$$
The potential (D.1) is the positive certificate $w=(1,1,1,1)$.

**Theorem D.1c (PCE Dual-Certificate Gate).** Let $x,y\in\mathcal X_{adm}$.

1. If $x\preceq_{\mathrm{PCE}}y$, then $V_w(x)\le V_w(y)$ for every dual PCE certificate $w\in K^*$.
2. If $x\preceq_{\mathrm{PCE}}y$ and at least one component of $r(y)-r(x)$ is strictly positive, then $V_w(x)<V_w(y)$ for every $w\in\mathrm{int}\,K^*$.
3. Therefore no PCE-admissible scalarization with strictly positive weights may select $y$ over $x$ when $x$ strictly PCE-dominates $y$.
4. Conversely, if $x^*$ uniquely minimizes $V_w$ over a compact admissible branch $\mathcal F\subset\mathcal X_{adm}$ for some $w\in K^*$, then $w$ is a dual certificate for that branch selection.

*Proof.* By Definition D.1b, $x\preceq_{\mathrm{PCE}}y$ means $r(y)-r(x)\in K$. For any $w\in K^*$,
$$
V_w(y)-V_w(x)
=
w\cdot(r(y)-r(x))
\ge0,
$$
which proves (1). If $r(y)-r(x)$ has at least one strictly positive component and $w\in\mathrm{int}\,K^*$, then every component of $w$ is strictly positive, so the dot product is strictly positive; this proves (2). Statement (3) is the contrapositive of (2) applied to branch selection by a strictly positive PCE scalarization. For (4), compactness and continuity give existence of a minimizer by Weierstrass. If $x^*$ is the unique minimizer of $V_w$, then
$$
V_w(x^*)<V_w(y)
$$
for every $y\in\mathcal F\setminus\{x^*\}$, so $w$ separates the selected point from every rejected branch point in the scalar certificate order. ∎

**Theorem D.1d (PCE Dominance and No-Surplus Branch Elimination).** Let $x,y\in\mathcal X_{adm}$ be PPI-admissible configurations with naturally isomorphic finite protocol-response presheaves,
$$
\mathcal R_x\simeq\mathcal R_y.
$$
If $x\preceq_{\mathrm{PCE}}y$ and $r(y)-r(x)$ has at least one strictly positive component, then $y$ is not a primitive physical branch at the PCE-Attractor. It is either the same physical branch as $x$ in the PPI quotient or is strictly PCE-dominated by $x$.

*Proof.* Since $\mathcal R_x\simeq\mathcal R_y$, Theorem P.6.1b.3 identifies $x$ and $y$ as representing the same physical invariant in the operational quotient unless an additional retained label changes a finite protocol response. By hypothesis no finite response differs. Thus any difference between $x$ and $y$ is a response-null implementation difference.

Because $x\preceq_{\mathrm{PCE}}y$ and the domination is strict in at least one component, Theorem D.1c gives
$$
V_w(x)<V_w(y)
$$
for every strictly positive dual certificate $w\in\mathrm{int}\,K^*$. Therefore no PCE-admissible scalarization can select $y$ over $x$. If the response-null distinction is quotiented out, $x$ and $y$ are the same physical branch. If it is retained, it carries strictly higher PCE cost without changing any finite protocol response and is eliminated by PCE dominance. These alternatives exhaust the PPI-admissible cases. ∎

**Theorem D.1e (Operational Quotient and Minimal Representative Existence).** Let $\mathcal X_{\mathrm{adm}}$ be the PPI-admissible configuration class on a finite-resolution protocol branch $\mathsf P_{\mathrm{PU}}$. Define
$$
x\sim_{\mathcal R}y
\quad\Longleftrightarrow\quad
\mathcal R_x\simeq\mathcal R_y.
$$
Then:

1. $\sim_{\mathcal R}$ is an equivalence relation, and the quotient
$$
\mathcal Q_{\mathrm{phys}}:=\mathcal X_{\mathrm{adm}}/{\sim_{\mathcal R}}
$$
is the PPI physical configuration space on this branch.

2. For any strictly positive dual certificate $w\in\mathrm{int}\,K^*$, the descended scalar potential
$$
\bar V_w([x])
:=
\inf_{y\in[x]}V_w(y)
$$
is well defined whenever the infimum is attained in each response class.

3. If the branch is compact after PPI quotienting and $\bar V_w$ is lower semicontinuous, then at least one PCE-minimal physical class exists:
$$
[x_{\mathrm{phys}}]\in
\operatorname*{argmin}_{[x]\in\mathcal Q_{\mathrm{phys}}}\bar V_w([x]).
$$

4. If the strict branch-separation hypotheses of Theorem P.6.1b.7 hold for the same descended scalarization, this PCE-minimal physical class is unique.

*Proof.* Natural isomorphism of finite protocol-response presheaves is reflexive, symmetric, and transitive, so $\sim_{\mathcal R}$ is an equivalence relation. Theorem P.6.1b.3 states that naturally isomorphic response presheaves represent the same physical invariant; therefore quotienting by $\sim_{\mathcal R}$ gives exactly the PPI physical configuration space on the branch.

For (2), if $x'\in[x]$, then $[x']=[x]$ by definition. The quantity $\inf_{y\in[x]}V_w(y)$ therefore depends only on the equivalence class and not on the representative. Attainment gives a minimal representative inside the response class. If two representatives have the same response presheaf but one carries strictly larger PCE cost, Theorem D.1d eliminates the higher-cost representative as response-null surplus; hence retained representatives are minimal inside their response class.

For (3), compactness of $\mathcal Q_{\mathrm{phys}}$ and lower semicontinuity of $\bar V_w$ give existence of a minimizer by the direct method. For (4), Theorem P.6.1b.7 supplies strict branch separation; if two distinct classes both minimized $\bar V_w$, strict separation would give a strictly lower value for one class over the other, a contradiction. Hence the minimizer is unique under that added separation condition. ∎

## D.3 Dynamic Complexity Alignment Mechanism ($C_P \leftrightarrow \langle \hat{C}_v \rangle$)

This section provides the rigorous justification for Theorem 2. We separate two statements: exact alignment as a necessary condition for true stable PCE equilibria, and quantitative operational tracking of that condition under the stochastic gradient dynamics.

**Lemma D.1 (True PCE Optimality Requires Alignment on the Faithful-Cost-Identifiability Branch).**
Let $V_{true}(x; \{C_P(v)\})$ denote the hypothetical "true" PCE potential, calculated identically to $V(x)$ but using the theoretical complexities $C_P(v)$ and their associated true physical costs $R(C_P(v))$, $R_I(C_P(v))$ in the operational cost term. On the faithful-cost-identifiability branch — under which persistent per-MPU proxy-cost mismatch cannot be exactly compensated by counter-adjustments in other MPUs or in non-complexity degrees of freedom at a true stable PCE equilibrium — a necessary condition for a configuration $x^*$ to be a stable minimum of $V_{true}$ under the true physical resource constraints is that the operational complexity proxies align with the theoretical complexities per MPU: $C_P(v) = \langle \hat{C}_v \rangle_{x^*}$ for all $v$. Persistent per-MPU misalignment $\delta_v = C_P(v) - \langle \hat{C}_v \rangle \neq 0$ then implies the system is operating with incorrect internal cost estimates relative to actual physical expenditure, leading to suboptimal resource allocation and preventing stabilization at a true PCE optimum. Without the faithful-cost-identifiability branch, only an aggregate/compensated version of the alignment condition is implied by stationarity.

*Proof.* The system's adaptation dynamics adjust variables (like $\langle \hat{C}_v \rangle$) based on gradients derived from the *operational* potential $V(x)$, which uses $R(\langle \hat{C}_v \rangle)$. However, the *actual* physical resources consumed are governed by the *true* complexities $C_P(v)$ and costs $R(C_P(v))$. If $\delta_v = C_P(v) - \langle \hat{C}_v \rangle \neq 0$, the operational cost estimate $R(\langle \hat{C}_v \rangle)$ deviates from the true cost $R(C_P(v))$. Minimizing $V(x)$ based on this potentially incorrect cost estimate will lead the system towards an operational minimum $x_{op}^*$ where the operational gradient vanishes, $\nabla_{op} V(x_{op}^*) = 0$. However, this operational minimum will generally *not* coincide with the true physical optimum $x_{true}^*$ where the gradient of the true potential $V_{true}$ vanishes, $\nabla_{true} V_{true}(x_{true}^*) = 0$. Coincidence of the operational and true gradients at $x^*$ requires the per-MPU cost-derivative mismatch to vanish locally. Strict monotonicity of $R$ gives $R(a) = R(b) \Rightarrow a = b$, which on the faithful-cost-identifiability branch (no compensation across MPUs or into other coordinates) gives $\delta_v = 0$ for all $v$. A configuration can only be a stable equilibrium under the full physics governed by PCE if it minimizes the true potential $V_{true}$. Therefore, any stable equilibrium $x^*$ on this branch must satisfy the per-MPU alignment condition $\delta_v = 0$. QED

*(Note on notation: In this Lemma, we used $\nabla_{op}$ and $\nabla_{true}$ to explicitly distinguish the operational system's calculation from the underlying physical optimum. In all subsequent sections of this appendix, we revert to the shorthand $\nabla V$ to denote the gradient of the operational potential $V(x)$ that drives the system dynamics according to Equation D.8.)*

**Corollary D.1 (Alignment Condition at Stable Equilibria on the Faithful-Cost-Identifiability Branch).**
On the faithful-cost-identifiability branch of Lemma D.1, any configuration $x^*$ that represents a stable equilibrium state (attractor) under the complete physical adaptation dynamics governed by the Principle of Compression Efficiency must satisfy the per-MPU alignment condition $C_P(v) = \langle \hat{C}_v \rangle_{x^*}$ for all constituent MPUs $v$.

**Theorem D.1 (Implicit Alignment Penalty in Operational Potential $V(x)$).**
For the system's operational adaptation dynamics, governed by minimizing the operational potential $V(x)$ (Equation D.1), to converge to states satisfying the true PCE optimality condition (which requires alignment per Corollary D.1), the effective operational potential $V(x)$ must behave *as if* it contains an implicit penalty term that vanishes only at alignment. The structure of the true physical costs versus the operational costs induces gradients that are functionally equivalent to those arising from adding a penalty term quadratic in the misalignment $\delta_v = C_P(v) - \langle \hat{C}_v \rangle_x$ to the core potential:
$$
V_{proxy}(x) = \frac{k_1}{2} \sum_{v} \delta_v^2 = \frac{k_1}{2} \sum_{v} \bigl(C_P(v) - \langle \hat{C}_v \rangle_x \bigr)^2
\quad \text{(D.1a)}
$$
where $k_1 > 0$ is an effective coupling constant reflecting the sensitivity of costs to misalignment. Specifically, the operational dynamics optimizing $V(x)$ must generate gradients $\nabla V$ that include the effect of $-\nabla V_{proxy}$ to dynamically drive the system towards alignment ($\delta_v = 0$).

*Proof.* The system adjusts its operational variables, including $\langle \hat{C}_u \rangle$, based on the gradient $\nabla_{\langle C_u \rangle} V(x)$. This gradient is calculated using the operational costs $R(\langle \hat{C}_u \rangle)$. However, the *physical consequences* (energy dissipation, constraint satisfaction) depend on the true costs $R(C_P(u))$. For the system to dynamically converge to a state that is optimal with respect to the *true* physics (which requires $\delta_u=0$), the operational dynamics must effectively incorporate feedback about the discrepancy between operational cost assumptions and physical reality. This feedback must generate a restoring force within the operational gradient $\nabla_{\langle C_u \rangle} V(x)$ that pushes $\langle \hat{C}_u \rangle$ towards $C_P(u)$ whenever $\delta_u \neq 0$. The simplest form for such a restoring force is proportional to $-\delta_u = C_P(u) - \langle \hat{C}_u \rangle$. This force is functionally equivalent to the negative gradient of the quadratic penalty $V_{proxy}$ with respect to $\langle \hat{C}_u \rangle$: $-\frac{1}{k_1}\nabla_{\langle C_u \rangle} V_{proxy} = C_P(u) - \langle \hat{C}_u \rangle = -\delta_u$. Therefore, for the operational dynamics based on minimizing $V(x)$ to achieve consistency with the true underlying PCE objective (requiring $\delta_u = 0$), the effective structure of $V(x)$ and the physical feedback mechanisms influencing its gradient must be such that they generate the same dynamics as minimizing $V_{core} + V_{proxy}$. The $V_{proxy}$ term thus represents the necessary implicit structure within the optimization landscape shaped by $V(x)$ and physical feedback, required for self-consistent convergence to alignment. QED

### D.3.1 Physical Realization via Observable Work-Cost Gap Feedback

The system does not need direct access to the uncomputable $C_P(v)$ to achieve alignment. Instead, alignment is enforced dynamically via an observable physical feedback signal: the discrepancy between actual work dissipated and the work expected based on the operational proxy.

**Definition D.2 (Observable Work-Cost Gap $\Delta W_v$).**
The Observable Work-Cost Gap $\Delta W_v$ for MPU $v$ over a sufficiently long averaging time interval $\tau$ is the difference between the actual physical work dissipated $W_{physical, v}(\tau)$ (empirically accessible, e.g., via heat flow measurements or thermodynamic cycle analysis) and the work expected based on the operational proxy cost function $R(\langle \hat{C}_v \rangle)$:
$$
\Delta W_v(\tau) = W_{physical, v}(\tau) - \int_t^{t+\tau} R(\langle \hat{C}_v(t') \rangle) dt'
\quad \text{(D.2)}
$$

**Lemma D.2 (Work-Cost Gap Identifies Misalignment).**
Assume the efficiency-saturated regime where the instantaneous physical dissipation rate equals the minimal operational cost evaluated at the true complexity:
$$
\frac{dW_{physical, v}}{dt}(t)=R(C_P(v,t)).
$$
Define the instantaneous misalignment $\delta_v(t):=C_P(v,t)-\langle \hat{C}_v(t)\rangle$. If $R$ is twice continuously differentiable on the viable complexity range, then for any averaging window length $\tau>0$,
$$
\frac{\Delta W_v(\tau)}{\tau}
= \frac{1}{\tau}\int_t^{t+\tau} R'(\langle \hat{C}_v(t')\rangle)\,\delta_v(t')\,dt'
+ \frac{1}{2\tau}\int_t^{t+\tau} R''(\xi_v(t'))\,\delta_v(t')^2\,dt'
\quad \text{(D.3)}
$$
where for each $t'\in[t,t+\tau]$ the intermediate value $\xi_v(t')$ lies between $\langle \hat{C}_v(t')\rangle$ and $C_P(v,t')$.

In particular, if $|R''(C)|\le L_R$ on the viable complexity range, then the remainder term is bounded by
$$
\left|\frac{1}{2\tau}\int_t^{t+\tau} R''(\xi_v(t'))\,\delta_v(t')^2\,dt'\right|
\le \frac{L_R}{2\tau}\int_t^{t+\tau}\delta_v(t')^2\,dt'.
$$

*Proof.* By Taylor's theorem with remainder, for each $t'$ there exists $\xi_v(t')$ between $\langle \hat{C}_v(t')\rangle$ and $C_P(v,t')$ such that
$$
R(C_P(v,t')) = R(\langle \hat{C}_v(t')\rangle) + R'(\langle \hat{C}_v(t')\rangle)\delta_v(t') + \frac{1}{2}R''(\xi_v(t'))\delta_v(t')^2.
$$
Subtract $R(\langle \hat{C}_v(t')\rangle)$, integrate from $t$ to $t+\tau$, divide by $\tau$, and use Definition D.2. The stated bound follows immediately from $|R''|\le L_R$. QED

**Physical Feedback Mechanism and Efficiency Saturation:** By Definition 3a, $R(C)$ is the minimal operational power cost required to sustain complexity $C$ (at the relevant $T_{eff}$). Therefore any physical implementation with true complexity $C_P(v,t)$ satisfies $dW_{physical, v}/dt \ge R(C_P(v,t))$, with equality when the MPU operates at the efficiency-saturated limit. The exact equilibrium statement of Theorem 2 concerns that saturated true-physical optimum (Lemma D.1 / Corollary D.1). The stochastic operational dynamics analyzed below describe how the proxy is driven toward that optimum: in the low-noise, near-saturated regime the leading restoring term is the work-cost gap itself, while any nonnegative slack away from saturation can be absorbed into the bounded forcing already present in (D.8) and in the misalignment estimate of Proposition D.1. Physical dissipation is operationally observable (e.g., as heat flux or entropy export), so $\Delta W_v$ is an accessible feedback signal. Lemma D.2 shows that this feedback decomposes into a leading term proportional to the misalignment $\delta_v$ plus a controlled quadratic remainder; consequently, driving $\Delta W_v$ small under POP/PCE drives the mean-square misalignment small and yields quantitative proxy tracking of the exact equilibrium alignment condition.

**Robustness to Noise and Deviations from Ideal Efficiency:** In a realistic physical setting, the measurement of the work-cost gap $\Delta W_v$ is noisy (e.g., thermal fluctuations, measurement imperfections), and the instantaneous dissipation rate may deviate from the efficiency-saturated limit $R(C_P)$. These effects can be modeled as an additive stochastic perturbation of the observed feedback, $\Delta W_v^{obs} = \Delta W_v + \xi_W$, with $\mathbb{E}[\xi_W]=0$ and bounded second moment over the averaging window. Since the adaptation dynamics are already modeled as a diffusion (Equation D.8), such perturbations are absorbed into the diffusion term $D(x)$ and therefore into the bounded forcing constant $C_{\mathcal M}$ appearing in Proposition D.1. The resulting rigorous conclusion is contraction of the mean-square misalignment toward a controlled noise floor (Corollary D.2), rather than pointwise convergence in the presence of persistent stochastic forcing.

### D.3.2 Mean-Square Alignment Convergence

**Definition D.3 (Mean-Square Misalignment $\mathcal{M}$).**
The total mean-square misalignment over the network in configuration $x$ is defined as:
$$
\mathcal M(x) = \frac{1}{2} \sum_{v} \bigl(C_P(v) - \langle \hat{C}_v \rangle_{x} \bigr)^2 = k_1^{-1} V_{proxy}(x)
\quad \text{(D.4)}
$$

**Proposition D.1 (Stochastic Contraction of Misalignment).**
Consider the stochastic adaptation dynamics for the configuration $x(t)$ given by Equation (D.8) below, with potential decomposed as $V(x)=V_{core}(x)+V_{proxy}(x)$ where $V_{proxy}$ is given by (D.1a). Assume, on the adaptation window under consideration, that the target complexities $C_P(v)$ are quasi-static (equivalently, that any residual target drift is negligible compared with the proxy relaxation rate). Let $\nabla_C$ denote the gradient with respect to the proxy complexity coordinates $(\langle \hat{C}_v\rangle)_v$, and let $D_{CC}(x)$ denote the restriction of the diffusion matrix $D(x)$ to these coordinates. Under the technical assumptions (A1)-(A6) specified in Section D.6.1, the expected rate of change of the mean-square misalignment $\mathcal{M}(x(t))$ satisfies:
$$
\frac{d}{dt}\mathbb{E}[\mathcal M(x(t))] \le -k_1\eta_{min}\,\mathbb{E}[\mathcal M(x(t))] + C_{\mathcal M}
\quad \text{(D.5)}
$$
where one may take
$$
C_{\mathcal M}
:= \frac{\eta_{max}^2}{2k_1\eta_{min}}\left(\sup_{x\in\mathcal K}\|\nabla_C V_{core}(x)\|^2\right) + \sup_{x\in\mathcal K}\operatorname{Tr}(D_{CC}(x)),
$$
and $\mathcal K$ is the compact invariant set from (A5).

*Proof.* By Definition D.3, $\mathcal M = k_1^{-1}V_{proxy}$. Applying Ito's formula to $V_{proxy}(x(t))$ under (D.8) gives
$$
\frac{d}{dt}\mathbb E[\mathcal M(x(t))]
= \mathbb E\bigl[-k_1^{-1}(\nabla V_{proxy})^T\eta(\nabla V_{core}+\nabla V_{proxy}) + k_1^{-1}\operatorname{Tr}(D\nabla^2 V_{proxy})\bigr].
$$
Since $V_{proxy}(x)=\frac{k_1}{2}\sum_v(C_P(v)-\langle\hat C_v\rangle_x)^2$, its gradient is supported only on the proxy-complexity coordinates and satisfies $\nabla_C V_{proxy} = k_1(\langle\hat C\rangle-C_P)$, hence $\|\nabla_C V_{proxy}\|^2 = 2k_1^2\mathcal M$. Using the SPD bounds on $\eta$ (A2),
$$
-k_1^{-1}(\nabla V_{proxy})^T\eta(\nabla V_{proxy})
\le -k_1^{-1}\eta_{min}\|\nabla_C V_{proxy}\|^2
= -2k_1\eta_{min}\mathcal M.
$$
For the cross term, Cauchy-Schwarz and Young's inequality give, for each $x$,
$$
k_1^{-1}\big|(\nabla V_{proxy})^T\eta\nabla V_{core}\big|
\le \frac{\eta_{min}}{2k_1}\|\nabla_C V_{proxy}\|^2 + \frac{\eta_{max}^2}{2k_1\eta_{min}}\|\nabla_C V_{core}\|^2.
$$
Combining with $\|\nabla_C V_{proxy}\|^2=2k_1^2\mathcal M$ yields a net drift term at most $-k_1\eta_{min}\mathcal M + \frac{\eta_{max}^2}{2k_1\eta_{min}}\|\nabla_C V_{core}\|^2$. Finally, since $\nabla^2 V_{proxy}$ is constant on the proxy-complexity block, $\operatorname{Tr}(D\nabla^2 V_{proxy})=\operatorname{Tr}(D_{CC})$, which is bounded on $\mathcal K$ by (A3)-(A5). Taking expectations and using the definition of $C_{\mathcal M}$ gives (D.5). If the targets $C_P(v,t)$ drift slowly rather than remaining frozen, the same computation produces an additional bounded forcing term proportional to the target drift, which can be absorbed into $C_{\mathcal M}$. QED

**Corollary D.2 (Convergence to Alignment Noise Floor).**
Under the dynamics (Equation D.8), the quasi-static-target assumption of Proposition D.1, and assumptions (A1)-(A6), Gronwall's inequality applied to (D.5) gives:
$$
\mathbb E[\mathcal M(x(t))] \le e^{-k_1\eta_{min}t}\mathbb E[\mathcal M(x(0))] + \frac{C_{\mathcal M}}{k_1\eta_{min}}\bigl(1-e^{-k_1\eta_{min}t}\bigr),
$$
and therefore the long-time expectation of the mean-square misalignment is bounded by the noise floor:
$$
\limsup_{t\to\infty} \mathbb E[\mathcal M(x(t))] \le \frac{C_{\mathcal M}}{k_1\eta_{min}}
\quad \text{(D.6)}
$$
If the effective noise driving misalignment (captured in $C_{\mathcal M}$) is sufficiently small relative to $k_1\eta_{min}$, then $\mathbb E[\mathcal M(x(t))]$ becomes small, implying $C_P(v)\approx\langle\hat C_v\rangle$ in mean-square. More generally, under the ergodic stationary regime of the stochastic dynamics (Theorem D.5), the long-run time-average of $\langle \hat{C}_v \rangle_{x(t)}$ converges to its expectation under the invariant measure. This is the quantitative tracking statement used in Theorem 2: exact alignment is the equilibrium condition of Corollary D.1, while the operational proxy approaches that condition up to the controlled noise floor (D.6).

*Proof.* The bound is the explicit solution of the scalar differential inequality (D.5). QED

**Remark D.1: Uniqueness and Optimality of Circuit Complexity Proxy.**
The operational proxy $\hat{C}_v$ was identified with quantum circuit complexity (Definition B.1). Could another proxy $\hat{C}'_v = f(\hat{C}_v)$ (with $f$ non-affine) be used consistently? If such a proxy were used, the operational cost estimate $R(\hat{C}'_v)$ would generally differ from the true physical cost $R(C_P(v))$ even when $\langle \hat{C}_v \rangle = C_P(v)$. This persistent mismatch would induce a non-zero work-cost gap $\Delta W_v$ via Equation (D.3) (using the chain rule for $R(f(C_v))$). The physical feedback mechanism, acting to minimize $\Delta W_v$, would generate a gradient term effectively penalizing the use of $\hat{C}'_v$. The dynamics governed by minimizing the true physical dissipation (including the work-cost gap penalty) uniquely favor the proxy $\hat{C}_v$ (or an affine transformation thereof) for which the operational cost function $R(\langle \hat{C}_v \rangle)$ most accurately reflects the true physical cost $R(C_P(v))$ near equilibrium. This minimizes the residual work-cost gap, satisfying the PCE imperative for maximum efficiency. Thus, quantum circuit complexity (or equivalent measures) emerges as the dynamically selected, optimal operational proxy.

## D.4 Dynamical Emergence of Geometric Regularity

This section provides the dynamical justification for Theorem 43, showing that minimizing the PCE Potential $V(x)$ inherently drives the system towards geometrically regular configurations.

**Lemma D.3 (Quantitative Cost of Irregularity under monotonicity/comparison hypotheses).**
Assume, in addition to the results of Appendix C, that:

1. $V_{prop}$ is monotone increasing in the bottleneck severity
   $$
   b(S):=\max(0,I_{req}(S)-C_{cut}(S));
   $$
2. for each irregular configuration $x_{\mathrm{irreg}}$ under consideration there exists a comparison regular configuration $x_{\mathrm{reg}}$ with the same proxy-complexity coordinates;
3. the loss of global coherence and local stability quantified in Appendix C yields a bounded reduction of $V_{\mathrm{benefit}}$ that is subleading relative to the displayed propagation and operational penalties.

Then geometric irregularities increase the core PCE potential. More precisely, for families with anomalous path-length exponent $\gamma>1$ and curvature-variance penalty bounded below as in Theorem C.4, there exist constants $a,b>0$ and $c\ge 0$ such that
$$
V_{core}[x_{\mathrm{irreg}}]-V_{core}[x_{\mathrm{reg}}]\ge aL^\gamma + bL - c.
\tag{D.7}
$$

*Proof.* By Theorem C.2, anomalous path scaling increases the number of ND-RID hops across scale $L$, so under assumption (1) the propagation component contributes a term bounded below by $aL^\gamma-c_1$ for some $a>0$ and $c_1\ge 0$. By Theorem C.4 and the DSC convexity hypothesis, curvature fluctuations induce a variance penalty in the operational cost, giving a lower bound of the form $bL-c_2$ after coarse graining over a size-$L$ region, with $b>0$ and $c_2\ge 0$. Assumption (3) bounds the loss in $V_{\mathrm{benefit}}$ by an additive constant $c_3\ge 0$. Comparing with the regular configuration from assumption (2) and collecting constants $c=c_1+c_2+c_3$ yields (D.7). ∎

**Theorem D.2 (Implicit Geometric Penalty in $V(x)$).**
The structure of the core PCE potential $V_{core} = V_{op} + V_{prop} - V_{benefit}$ inherently penalizes geometric irregularity. Minimizing $V_{core}$ (and thus the full potential $V = V_{core} + V_{proxy}$) dynamically favors geometrically regular configurations. The effective operational potential $V(x)$ therefore behaves *as if* it includes an implicit penalty term $V_{geom}(x) = f_{geom}(\gamma(x)-1, \sigma_\kappa^2(x))$ that increases with irregularity.

*Proof.* Lemma D.3 establishes that $V_{core}(x)$ is strictly higher for irregular configurations than for comparable regular ones. Therefore, along geometric perturbations that leave the proxy-complexity coordinates fixed, any reduction in irregularity lowers $V_{core}$ while leaving $V_{proxy}$ unchanged. Hence the negative gradient of the full potential $-\nabla V$ contains a geometric component that points away from irregular states toward states with lower irregularity (lower $\gamma$, lower $\sigma_\kappa^2$). The operational dynamics therefore behave exactly as if they included an effective geometric penalty $f_{geom}$ against irregularity. QED

**Lemma D.4 (Regular Configurations as Global Minima Candidate Set for $V_{core}$).**
The set of configurations $\mathcal{X}_{reg} \subset \mathcal{X}_{adm}$ that satisfy geometric regularity (Definition C.3, i.e., $\gamma=1$ and $\sigma_\kappa^2$ minimal/zero) contains the global minima of the core potential $V_{core}(x)$.

*Proof.* Follows directly from Lemma D.3 (Equation D.7), which shows that any irregular configuration has a strictly higher $V_{core}$ value than a comparable regular configuration. Thus, the minima must lie within the set of regular configurations. QED

**Theorem D.3 (Global Minima of $V(x)$ are Regular, with Controlled Proxy Residual).**
Every global minimum $x^*$ of the full PCE potential $V(x) = V_{core}(x) + V_{proxy}(x)$ is geometrically regular (Definition C.3). Let $\mathcal{E}_{*}^{\text{global}}$ denote the set of such global minima. Writing $\langle \hat C \rangle_{x^*}:=(\langle \hat C_v\rangle_{x^*})_v$ and $C_P:=(C_P(v))_v$, the proxy-complexity coordinates of any such minimum satisfy
$$
\nabla_C V_{core}(x^*) + k_1\bigl(\langle \hat C \rangle_{x^*} - C_P\bigr)=0,
$$
hence
$$
\bigl\|\langle \hat C \rangle_{x^*} - C_P\bigr\| \le k_1^{-1}\bigl\|\nabla_C V_{core}(x^*)\bigr\|.
$$
Thus the global minima are exactly regular and are close to alignment whenever the residual proxy-coordinate gradient of $V_{core}$ is small compared with $k_1$.

*Proof.* Let $x^*$ be a global minimum of $V(x)$. If the induced network were geometrically irregular, Lemma D.3 would provide a comparable regular configuration $\tilde x$ with the same proxy-complexity coordinates and strictly smaller core potential: $V_{core}(\tilde x)<V_{core}(x^*)$. Since $V_{proxy}(\tilde x)=V_{proxy}(x^*)$ along such a geometric comparison, this would imply $V(\tilde x)<V(x^*)$, contradicting global minimality. Hence $x^*$ must be geometrically regular.

Because $x^*$ is a global minimum, $\nabla V(x^*)=0$. Restricting to the proxy-complexity coordinates gives
$$
\nabla_C V_{core}(x^*) + \nabla_C V_{proxy}(x^*)=0.
$$
Using $\nabla_C V_{proxy}=k_1(\langle \hat C \rangle-C_P)$ yields the displayed balance relation, and the norm bound follows immediately. QED

## D.5 System Dynamics as Stochastic Gradient Flow on $V(x)$

The effective slow adaptation dynamics governing the evolution of the MPU network configuration $x(t)$ (which includes network structure variables like effective link weights $w_{uv}$, geometric parameters, and local complexities $\langle \hat{C}_v \rangle$) are modeled as a stochastic gradient flow seeking to minimize the PCE potential $V(x)$ in the presence of fluctuations:
$$
dx(t) = -\eta(x(t)) \nabla_xV(x(t)) dt + \sqrt{2D(x(t))} dW(t)
\quad \text{(D.8, repeated from D.0)}
$$
where:
*   $x(t)$ is the state vector in the high-dimensional configuration space $\mathcal{X}_{adm}$.
*   $\eta(x)$ is a symmetric, positive-definite matrix representing state-dependent adaptation rates or mobility. It encapsulates the responsiveness of different configuration parameters to the optimization drive.
*   $V(x)$ is the PCE Potential (Equation D.1), incorporating the core cost/benefit terms and the implicit penalties $V_{proxy}$ and $V_{geom}$.
*   $\nabla_xV(x)$ is the gradient of the potential $V$ with respect to the configuration variables $x$.
*   $D(x)$ is a positive semi-definite diffusion matrix representing stochastic fluctuations. These arise from the underlying discrete, probabilistic ND-RID interactions, thermal noise in the environment, and potentially quantum fluctuations affecting the adaptation process.
*   $dW(t)$ is a standard vector Wiener process, representing uncorrelated white noise sources.

This equation describes the configuration $x(t)$ evolving "downhill" on the potential landscape $V(x)$, driven by the negative gradient, while being perturbed by stochastic noise.

## D.6 Dynamical Convergence Proof

We use stochastic Lyapunov methods, common in the analysis of stochastic approximation and optimization algorithms, to characterize the ergodic stationary regime of the dynamics (Equation D.8) and its low-noise detailed-balance localization near the regular global-minimum set $\mathcal{E}_{*}^{\text{global}}$.

### D.6.1 Assumptions for Convergence

We make standard technical assumptions required for the convergence theorems, justifying them from the physical principles of the PU framework.
*   **(A1) Potential Properties:** $V(x)$ is twice continuously differentiable ($C^2$), bounded below on the admissible state space $\mathcal{X}_{adm}$. We assume $V(x)$ is coercive, meaning $V(x) \to \infty$ as $x$ approaches the boundary of $\mathcal{X}_{adm}$ or as some norm $|x| \to \infty$. *Physical Justification:* The $C^2$ smoothness is required for the Lyapunov analysis involving the Hessian (Lemma D.5). Coercivity is physically plausible because the resource cost terms ($V_{op}, V_{prop}$) are expected to grow super-linearly with complexity and network size (e.g., $R(C) \propto C^{\gamma_p}$ with $\gamma_p > 1$), while the benefit term ($V_{benefit}$) saturates (due to $PP < \beta$). This ensures the potential grows at the extremes of the configuration space, confining the dynamics.
*   **(A2) Mobility Bounds:** The mobility matrix $\eta(x)$ is symmetric positive definite, bounded, and Lipschitz on $\mathcal{X}_{adm}$: there exist constants $0<\eta_{\min}\le \eta_{\max}<\infty$ such that for all $x\in\mathcal{X}_{adm}$ and all vectors $v$,
$\eta_{\min}\|v\|^2 \le v^T\eta(x)v \le \eta_{\max}\|v\|^2$, and $\|\eta(x)-\eta(y)\|\le L_\eta\|x-y\|$ for all $x,y$. *Physical Justification:* In PU, $\eta$ encodes local equilibration/update rates of ND-RID channels and local routing policies. These are bounded by finite cycle times and finite per-step dissipation (each irreversible ND-RID update has $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$, Theorem 31), and Lipschitz dependence expresses local response of rates to small changes in configuration, consistent with near-equilibrium linear response [Onsager 1931].
*   **(A3) Diffusion Matrix Bounds:** The diffusion matrix $D(x)$ is bounded and uniformly elliptic. Specifically, there exist constants $0<d_{\min}\le d_{\max}<\infty$ such that for all $x$ and all vectors $v$, $d_{\min}\|v\|^2 \le v^T D(x) v \le d_{\max}\|v\|^2$. *Physical Justification:* In PU, diffusion models aggregate microscopic stochasticity of ND-RID routing and environmental forcing. Uniform bounds correspond to finite-temperature noise with bounded per-step fluctuations set by finite update rates and capacity constraints (e.g., bounded degree $\Delta_{max}$ and minimal cycle time $\tau_{min}$), preventing arbitrarily large instantaneous kicks while ensuring ergodic exploration of admissible configurations.
*   **(A4) Gradient Smoothness:** $\nabla V(x)$ is Lipschitz continuous on compact subsets of $\mathcal{X}_{adm}$. This prevents pathologically fast changes in the drift.
*   **(A5) Confinement:** Assumptions (A1) and the nature of the dynamics ensure that for any initial condition $x(0)$, the trajectory $x(t)$ remains within a compact subset $\mathcal{K} \subset \mathcal{X}_{adm}$ for all $t \ge t_0 > 0$.
*   **(A6) Noise Irreducibility:** The stochastic forcing is irreducible on $\mathcal{X}_{adm}$: for any nonempty open set $U\subset\mathcal{X}_{adm}$ and any $t>0$, the transition probability satisfies $\mathbb{P}_x(X_t\in U)>0$. A sufficient condition is uniform non-degeneracy of the diffusion (already implied by (A3)): there exists $d_*>0$ such that for all $x\in\mathcal{X}_{adm}$ and all vectors $v$, $v^T D(x)v\ge d_*\|v\|^2$. *Physical Justification:* PU includes irreducible environmental/measurement noise and ND-RID stochasticity; without such forcing, some degrees of freedom could become trapped on invariant submanifolds, breaking uniqueness/ergodicity of the stationary regime and invalidating the low-noise localization statement of Theorem D.5.

### D.6.2 Lyapunov Analysis

**Lemma D.5 (Stochastic Lyapunov Property of $V(x)$).**
Under assumptions (A1)-(A5), the PCE Potential $V(x)$ serves as a stochastic Lyapunov function for the dynamics (Equation D.8). Applying Ito's formula to $V(x(t))$ yields the expected instantaneous rate of change (the infinitesimal generator $\mathcal{L}V$ applied to $V$):
$$
\mathcal{L}V(x) = \lim_{\Delta t \to 0} \frac{\mathbb{E}[V(x(t+\Delta t)) - V(x(t)) | x(t)=x]}{\Delta t}
$$
$$
\mathcal{L}V(x) = \nabla V(x)^T (-\eta(x) \nabla V(x)) + \frac{1}{2} \mathrm{tr}\left( ( \sqrt{2D(x)} )^T (\nabla^2 V(x)) (\sqrt{2D(x)}) \right)
$$
$$
\mathcal{L}V(x) = -\nabla V(x)^T \eta(x) \nabla V(x) + \mathrm{tr}(D(x) \nabla^2 V(x))
\quad \text{(D.9)}
$$
Using the bounds on $\eta(x)$ (A2) and $D(x)$ (A3), and noting that the Hessian $\nabla^2 V(x)$ is bounded on the compact set $\mathcal{K}$ (which follows from $V$ being $C^2$ as per Assumption A1), we get:
$$
\mathcal{L}V(x) \le -\eta_{min} \|\nabla V(x)\|^2 + \mathrm{tr}(D(x) \nabla^2 V(x))
\le -\eta_{min} \|\nabla V(x)\|^2 + C_{noise}
\quad \text{(D.10)}
$$
where $C_{noise} = \sup_{x \in \mathcal{K}} |\mathrm{tr}(D(x) \nabla^2 V(x))|$ is a positive constant related to $D_{max}$ and the bounds on the Hessian eigenvalues on the compact set $\mathcal{K}$. This inequality shows that whenever the gradient $\|\nabla V(x)\|$ is sufficiently large (specifically, when $\|\nabla V(x)\|^2 > C_{noise}/\eta_{min}$), the negative drift term dominates, $\mathcal{L}V(x) < 0$, and the potential $V(x)$ decreases on average.

### D.6.3 Characterization of the Critical Set $\mathcal{E}_{*}$

**Definition D.4 (Critical Set $\mathcal{E}_{*}$).**
The critical set $\mathcal{E}_{*}$ consists of all configurations $x^* \in \mathcal{X}_{adm}$ where the deterministic drift term vanishes:
$$
\mathcal{E}_{*} = \{x^* \in \mathcal{X}_{adm} \mid \nabla V(x^*) = 0\}
\quad \text{(D.11)}
$$
This set includes all local minima, maxima, and saddle points of the potential $V(x)$.

**Theorem D.4 (Properties of Local Minimizers; Local Regularity on the Local-Regularization Branch).**
Any configuration $x^*$ that is a local minimizer of $V(x)$ (and in particular any $x^*\in\mathcal E_{*}^{\text{global}}$) must satisfy:
(i) **Proxy-Coordinate Balance:** writing $\langle \hat C \rangle_{x^*}:=(\langle \hat C_v\rangle_{x^*})_v$ and $C_P:=(C_P(v))_v$,
$$
\nabla_C V_{core}(x^*) + k_1\bigl(\langle \hat C \rangle_{x^*} - C_P\bigr)=0,
$$
hence
$$
\bigl\|\langle \hat C \rangle_{x^*} - C_P\bigr\| \le k_1^{-1}\bigl\|\nabla_C V_{core}(x^*)\bigr\|.
$$
In particular, per-MPU exact alignment follows whenever the residual proxy-coordinate gradient of $V_{core}$ vanishes and the faithful-cost-identifiability branch of Lemma D.1 is in force.
(ii) **Geometric Regularity (for global minimizers, unconditionally).** Every $x^* \in \mathcal{E}_*^{\text{global}}$ exhibits geometric regularity (Definition C.3) by Theorem D.3.
(iii) **Geometric Regularity (for local minimizers, on the local-regularization branch).** On the local-regularization branch — under which every irregular admissible configuration admits a geometric perturbation arbitrarily close to it, leaving the proxy-complexity coordinates fixed, that strictly lowers $V_{\text{core}}$ — every local minimizer $x^*$ of $V(x)$ additionally exhibits geometric regularity. Off this branch, Lemma D.3 and Theorem D.3 supply only the global-comparison statement in (ii), so a local minimizer of $V$ need not be regular in general.

*Proof.*
**(i) Proxy-Coordinate Balance:** At a local minimizer, $\nabla V(x^*)=0$. Restricting to the proxy-complexity coordinates gives
$$
\nabla_C V_{core}(x^*) + \nabla_C V_{proxy}(x^*)=0.
$$
Using $\nabla_C V_{proxy}=k_1(\langle \hat C \rangle-C_P)$ yields the displayed balance relation, and the norm bound follows immediately.
**(ii) Regularity of global minimizers.** Every $x^* \in \mathcal{E}_*^{\text{global}}$ is regular by Theorem D.3, whose proof uses Lemma D.3 to produce a comparison regular configuration $x_{\text{reg}}$ with the same proxy-complexity coordinates and strictly smaller core potential. Global minimality gives the required contradiction if $x^*$ is irregular.

**(iii) Regularity of local minimizers on the local-regularization branch.** Decompose the configuration variables as $x=(x_{geom},x_{other},\langle\hat C\rangle)$, where $x_{geom}$ are the geometric/network-structure variables. On the local-regularization branch, suppose for contradiction that the induced network $\mathcal N^*$ is geometrically irregular. The branch hypothesis supplies a geometric perturbation $\tilde x=(\tilde x_{geom},x_{other}^*,\langle\hat C\rangle^*)$ arbitrarily close to $x^*$ for which $V_{core}(\tilde x)<V_{core}(x^*)$. Along such a perturbation the proxy-complexity coordinates are unchanged, so $V_{proxy}(\tilde x)=V_{proxy}(x^*)$. Hence $V(\tilde x)=V_{core}(\tilde x)+V_{proxy}(\tilde x)<V_{core}(x^*)+V_{proxy}(x^*)=V(x^*)$, contradicting that $x^*$ is a local minimizer. Therefore, on the local-regularization branch, $\mathcal N^*$ must be geometrically regular.

Off the local-regularization branch, Lemma D.3 supplies only a global comparison regular configuration (possibly far from $x^*$), not a local regularizing perturbation, so the argument does not force local-minimizer regularity. The ergodicity and low-noise concentration results of Theorem D.5 and the selection statements of §D.8–§D.9 rely on the global part (ii); the local-regularization refinement in (iii) is an additional branch refinement supplementing the main global story. QED

### D.6.4 Noise-Driven Escape from Non-Global Minima

**Lemma D.6 (Almost-Sure Exit from Any Bounded Neighborhood Under Non-Degenerate Noise).**
Consider the stochastic PCE dynamics (Equation D.8). Let $\mathcal{D}\subset\mathcal{X}_{adm}$ be any bounded open set, and define the exit time
$$
\tau_{\mathcal{D}} := \inf\{t\ge 0 : x(t)\notin \mathcal{D}\}.
$$
Under Assumptions (A3) (uniform ellipticity) and (A6) (noise irreducibility), we have
$$
\mathbb{P}_x[\tau_{\mathcal{D}}<\infty]=1 \quad \text{for every }x\in\mathcal{D}. \qquad \text{(D.11a)}
$$
In particular, the process cannot remain trapped indefinitely inside any bounded neighborhood of a strict non-global local minimum.

*Proof.* Under (A3)–(A4), the diffusion is strong Feller, and under (A6) it is topologically irreducible on $\mathcal{X}_{adm}$. Fix any $T>0$ and define $p_T(x):=\mathbb{P}_x[\tau_{\mathcal{D}}\le T]$. Irreducibility implies $p_T(x)>0$ for all $x\in\overline{\mathcal{D}}$; strong Feller implies $x\mapsto p_T(x)$ is continuous. Since $\overline{\mathcal{D}}$ is compact, $p_*:=\inf_{x\in\overline{\mathcal{D}}}p_T(x)>0$. The strong Markov property then gives $\mathbb{P}_x[\tau_{\mathcal{D}}>nT]\le (1-p_*)^n\to 0$, hence $\tau_{\mathcal{D}}<\infty$ almost surely. See, e.g., [Pavliotis 2014; Freidlin & Wentzell 2012] for rigorous statements of these elliptic diffusion properties. QED

### D.6.5 Global Ergodicity and Low-Noise Concentration

**Theorem D.5 (Ergodic Long-Run Behavior; Low-Noise Concentration in Detailed-Balance Regimes).**
Under Assumptions (A1)–(A6), the stochastic dynamics (D.8) define a strong Markov diffusion on the compact set $\mathcal{K}$ (A5). For strictly non-vanishing noise ($d_{\min}>0$ in (A3)), the process does **not** converge almost surely to a single equilibrium point; instead it admits a unique invariant probability measure $\pi$ and is ergodic. In particular, for any bounded measurable observable $f$,
$$
\frac{1}{T}\int_0^T f(x(t))\,dt \xrightarrow[T\to\infty]{a.s.} \int_{\mathcal{K}} f(x)\,\pi(dx). \qquad \text{(D.12)}
$$

To identify when this stationary regime localizes near the PCE-optimal set, consider a "temperature-scaled" family of dynamics obtained by scaling the diffusion as $D_\theta(x):=\theta\,D(x)$ for $\theta>0$ (so the noise strength decreases as $\theta\downarrow 0$). Let $\pi_\theta$ denote the invariant measure of the corresponding diffusion. Then, in regimes where detailed balance holds (e.g., constant-coefficient Langevin with $D_\theta=\theta\,\eta$ and symmetric constant $\eta$), $\pi_\theta$ has the Gibbs form
$$
\pi_\theta(dx) \;=\; Z_\theta^{-1}\exp\!\left(-\frac{V(x)}{\theta}\right)\,dx, \qquad \text{(D.12a)}
$$
and therefore concentrates on the set of global minimizers
$\mathcal{E}_{*}^{\text{global}}:=\arg\min_{x\in\mathcal{K}}V(x)$ as $\theta\downarrow 0$. Concretely, for any $\delta>0$ let
$\Delta_\delta:=\inf\{V(x)-V_{\min}:\operatorname*{dist}(x,\mathcal{E}_{*}^{\text{global}})>\delta\}>0$.
Then
$$
\pi_\theta\bigl(\{x:\operatorname*{dist}(x,\mathcal{E}_{*}^{\text{global}})>\delta\}\bigr) \;\le\; C_\delta\,e^{-\Delta_\delta/\theta}, \qquad \text{(D.12b)}
$$
for all $\theta\in(0,\theta_0]$, where $\theta_0>0$ is any fixed reference temperature and $C_\delta<\infty$ is a constant depending on $\mathcal{K}$, $\delta$, and $\theta_0$ (absorbing polynomial-in-$1/\theta$ prefactors arising from the Laplace approximation to the partition function $Z_\theta$).

Finally, by Theorem D.3, every configuration in $\mathcal{E}_{*}^{\text{global}}$ is geometrically regular and satisfies the proxy-coordinate balance relation stated there.

*Proof.* By (A1)-(A4) the coefficients of (D.8) are globally Lipschitz on the compact set $\mathcal K$ from (A5), hence (D.8) admits a unique strong solution for all $t\ge 0$ with trajectories remaining in $\mathcal K$. Uniform ellipticity (A3) together with (A1)-(A4) implies the Markov semigroup is strong Feller on $\mathcal K$ (standard elliptic regularity; see, e.g., [Pavliotis 2014]), and (A6) gives topological irreducibility.

Existence of an invariant measure follows from the Krylov–Bogolyubov averaging procedure. For any initial condition $x\in\mathcal K$, define the time-averaged measures
$$
\mu_T := \frac{1}{T}\int_0^T \delta_x P_t\,dt.
$$
Since $\mathcal K$ is compact, the family $\{\mu_T\}_{T>0}$ is tight and therefore has weak limit points. Any such weak limit $\pi$ is invariant.

Uniqueness of the invariant measure follows from strong Feller plus irreducibility (Doob-type theorem; see, e.g., [Pavliotis 2014]). Thus the invariant measure $\pi$ is unique and the diffusion is ergodic. In particular, the strong law of large numbers for ergodic diffusions yields (D.12) for every bounded measurable observable $f$ and every initial condition (again standard; see [Pavliotis 2014]).

For the low-noise concentration statement, consider the temperature-scaled family with $D_\theta=\theta D$. In regimes satisfying detailed balance with respect to Lebesgue measure (e.g., constant SPD mobility $\eta$ and $D_\theta=\theta\eta$), the stationary Fokker–Planck equation for a density $p_\theta$ on $\mathcal K$ is
$$
\nabla\cdot(\eta(\nabla V\,p_\theta + \theta\nabla p_\theta))=0.
$$
Taking $p_\theta(x)=Z_\theta^{-1}e^{-V(x)/\theta}$ gives $\nabla p_\theta = -(p_\theta/\theta)\nabla V$, so the vector field inside the divergence vanishes identically, proving (D.12a).

Finally, since $V$ is continuous and $\mathcal K$ is compact, the energy gap $\Delta_\delta>0$ defined in the theorem exists. Let $A_\delta:=\{x\in\mathcal K:\operatorname*{dist}(x,\mathcal E_{*}^{\text{global}})>\delta\}$ and $U_\delta:=\mathcal K\setminus A_\delta$.
Then for $x\in A_\delta$, $V(x)\ge V_{\min}+\Delta_\delta$ where $V_{\min}:=\min_\mathcal K V$. Therefore
$$
\pi_\theta(A_\delta)
= \frac{\int_{A_\delta} e^{-V(x)/\theta}dx}{\int_\mathcal K e^{-V(x)/\theta}dx}
\le \frac{e^{-(V_{\min}+\Delta_\delta)/\theta}\operatorname{Vol}(\mathcal K)}{e^{-V_{\min}/\theta}\operatorname{Vol}(U_\delta)}
= C_\delta e^{-\Delta_\delta/\theta},
$$
with $C_\delta:=\operatorname{Vol}(\mathcal K)/\operatorname{Vol}(U_\delta)<\infty$, yielding (D.12b). The final sentence follows from Theorem D.3. QED

## D.7 Formal Justification of Theorems 2 and 43

The results derived in this appendix provide the rigorous dynamical justification for Theorems 2 and 43, establishing them as necessary consequences of the framework's core optimization principles operating through stochastic dynamics. The convergence from the discrete MPU network to a continuum description governed by a standard action is made precise by the following theorem.

**Lemma D.6a (Equicoercivity of the discrete predictive action from PU bounded geometry).**

Let $\{(\mathcal G_h,d_h,\mu_h)\}_{h\downarrow 0}$ be the family of PU weighted graphs used in Theorem D.6, with the PU macroscopic rescaling already applied. Assume
$$
\mathcal F_h=\mathcal F_h^{EH}+\mathcal F_h^{MPU},
\qquad
\mathcal F_h^{EH}\ge 0,
\quad
\mathcal F_h^{MPU}\ge 0.
$$
Assume further that for every fixed sublevel $M<\infty$ there exists $h_0(M)>0$ such that for all $h<h_0(M)$, every configuration with $\mathcal F_h\le M$ satisfies the bounded-geometry hypotheses already established in Appendix C, namely:

- uniform $D$-dimensional two-sided volume bounds,
- local doubling,
- bounded degree, properness, and minimal link length.

Then for each $M$, the sublevel family
$$
\mathfrak S_h(M):=\{(\mathcal G_h,d_h,\mu_h): \mathcal F_h\le M\}
$$
is precompact in the pointed measured Gromov-Hausdorff topology. In particular, $\{\mathcal F_h\}$ is equicoercive.

*Proof.* Fix $M<\infty$ and basepoints $x_h\in\mathcal G_h$.

**Step 1 (packing bound).** Fix $R>0$ and $\varepsilon\in(0,R)$. Let $S\subset B(x_h,R)$ be a maximal $\varepsilon$-separated set. Then the balls $\{B(s,\varepsilon/2):s\in S\}$ are pairwise disjoint and contained in $B(x_h,R+\varepsilon/2)$. Two-sided volume control gives
$$
|S|\,K_1\Big(\frac{\varepsilon/2}{h}\Big)^D
\le
\sum_{s\in S}\mu_h(B(s,\varepsilon/2))
\le
\mu_h(B(x_h,R+\varepsilon/2))
\le
K_2\Big(\frac{R+\varepsilon/2}{h}\Big)^D.
$$
Hence
$$
|S|
\le
\frac{K_2}{K_1}\Big(\frac{2R+\varepsilon}{\varepsilon}\Big)^D
\le
\frac{K_2}{K_1}\Big(\frac{3R}{\varepsilon}\Big)^D
=: \nu(\varepsilon,R).
$$
Because $S$ is maximal, it is also an $\varepsilon$-net, so the same bound controls covering numbers.

**Step 2 (pointed GH precompactness).** Gromov's covering-number criterion now yields pointed GH precompactness.

**Step 3 (measured precompactness).** On each bounded ball the measures are uniformly finite, and the covering bound gives tightness. Prokhorov therefore upgrades pointed GH subsequences to pointed measured GH subsequences.

So every bounded-action sequence has a pointed measured Gromov-Hausdorff convergent subsequence. This is exactly equicoercivity. ∎

**Theorem D.6 (Gamma-limit of discrete predictive action).**
Let $\{(\mathcal G_h,\mu_h)\}_{h\downarrow0}$ be a family of weighted graphs (or triangulations) with mesh $h\to0$, equipped with a discrete curvature proxy and an MPU (matter) term. Let $\mathcal F_h=\mathcal F_h^{EH}+\mathcal F_h^{MPU}$ denote the corresponding discrete predictive action. Suppose:

(i) **Equicoercivity:** holds by Lemma D.6a.

(ii) **Locality & consistency:** Along any convergent sequence $(\mathcal G_h,\mu_h)\to(M,g)$ in that topology, the discrete curvature term converges to the Einstein-Hilbert term with scalar curvature $R_g$ (e.g., via Regge convergence or via the Ollivier-to-continuum estimator of Remark C.3.3a), and the MPU term converges in $L^1_{\mathrm{loc}}$ to $\int_M \mathcal L_{MPU}(g,\phi)\sqrt{-g}\,d^4x$.

(iii) **Area-law scaling:** The horizon normalization is fixed by the thermodynamic area law (Appendix E), yielding the emergent $G$ below.

Then $\mathcal F_h \ \xrightarrow{\Gamma} \ \mathcal F$ in $L^1_{\mathrm{loc}}$, where

$$
\mathcal F[g,\phi]=\frac{c^3}{16\pi G}\int_M R_g\,\sqrt{-g}\,d^4x \ +\ \int_M \mathcal L_{MPU}(g,\phi)\,\sqrt{-g}\,d^4x,
$$

and minimizers of $\mathcal F_h$ converge (up to subsequences) to minimizers of $\mathcal F$ (the Einstein-Hilbert plus MPU action). The convergence of the discrete metric spaces is understood in the pointed Gromov-Hausdorff sense (Section 11). This is an action-level $\Gamma$-limit statement: it identifies the limit variational functional but does not by itself imply Mosco convergence of the rescaled random-walk Dirichlet forms, quadraticity of the limit Cheeger energy, or the Euclidean-rigidity conclusions used later on the infinitesimally Hilbertian branch of Section 11.4.

**D.6bis Cell-Averaged Closure of the Variational Limit**

**Theorem D.6b (Cell-Averaged Curvature Closure).** Let $U\Subset M$ be a precompact chart domain of a limit branch, $(\mathcal G_h,d_h,\mu_h,g_h)\to(U,g)$ a bounded-action convergent sequence, and $\mathcal P_h(U)=\{C_v^{(h)}\}_{v\in V_h(U)}$ an admissible quasi-uniform cell decomposition with $\mu_h(v)=\int_{C_v^{(h)}} dV_g$. Let $R_h(v;g_h)$ be the discrete scalar-curvature proxy on $v$ (Remark C.3.3a) and
$$
\overline R_g^{(h)}(v) \;:=\; \frac{1}{\mu_h(v)}\int_{C_v^{(h)}} R_g\,dV_g
$$
the cell average of the continuum scalar curvature. Assume: (i) cellwise consistency $\sum_{v}\mu_h(v)\,|R_h(v;g_h)-\overline R_g^{(h)}(v)|\to 0$ along every bounded-action convergent sequence; (ii) recovery discretization: for every admissible continuum $g$, a canonical discretization $I_h g$ satisfies the same estimate; (iii) coefficient convergence $\alpha_h\to\alpha\in\mathbb R$. Define
$$
\mathcal F^{\mathrm{curv}}_{h,U}[g_h] \;:=\; \alpha_h\sum_{v\in V_h(U)}\mu_h(v)\,R_h(v;g_h).
$$
Then $\mathcal F^{\mathrm{curv}}_{h,U}\xrightarrow{\Gamma}\mathcal F^{\mathrm{curv}}_U[g]=\alpha\int_U R_g\,dV_g$ in local $L^1$, and along every convergent $g_h\to g$, $\mathcal F^{\mathrm{curv}}_{h,U}[g_h]\to\alpha\int_U R_g\,dV_g$.

*Proof.* Using $\sum_v\mu_h(v)\,\overline R_g^{(h)}(v)=\sum_v\int_{C_v^{(h)}}R_g\,dV_g=\int_U R_g\,dV_g$,
$$
\bigl|\mathcal F^{\mathrm{curv}}_{h,U}[g_h] - \alpha_h\int_U R_g\,dV_g\bigr| \;\le\; |\alpha_h|\sum_v\mu_h(v)\,|R_h(v;g_h)-\overline R_g^{(h)}(v)|.
$$
By (i) the right side tends to $0$, and (iii) gives $\alpha_h\to\alpha$, yielding the $\Gamma$-liminf and pointwise convergence. For the $\Gamma$-limsup, use the canonical recovery sequence $g_h=I_h g$ from (ii). ∎

**Corollary D.6b.1 (Volume-Term Closure).** If the discrete sector also contains a cell-volume term $\mathcal V_{h,U}[g_h]:=\beta_h\sum_v\mu_h(v)$ with $\beta_h\to\beta$, then $\mathcal V_{h,U}\xrightarrow{\Gamma}\beta\int_U dV_g$. Combined with Theorem D.6b, the most general local gravitational limit obtained by this argument is $\alpha\int_U R_g\,dV_g+\beta\int_U dV_g$.

*Proof.* Immediate from $\sum_v\mu_h(v)=\int_U dV_g$. ∎

**Theorem D.6c (Cell-Averaged Matter Closure).** Let $\phi_h\to\phi$ be a convergent sequence of coarse-grained matter fields, $\ell_h(v;g_h,\phi_h)$ the discrete MPU matter density at $v$, and $\overline{\mathcal L}^{(h)}_{\mathrm{MPU}}(v):=\mu_h(v)^{-1}\int_{C_v^{(h)}}\mathcal L_{\mathrm{MPU}}(g,\phi)\,dV_g$. Assume (i) cellwise consistency $\sum_v\mu_h(v)|\ell_h(v;g_h,\phi_h)-\overline{\mathcal L}^{(h)}_{\mathrm{MPU}}(v)|\to 0$ along every bounded-action convergent sequence; (ii) recovery discretization as in Theorem D.6b. Define $\mathcal F^{\mathrm{MPU}}_{h,U}[g_h,\phi_h]:=\sum_v\mu_h(v)\ell_h(v;g_h,\phi_h)$. Then
$$
\mathcal F^{\mathrm{MPU}}_{h,U} \;\xrightarrow{\Gamma}\; \int_U \mathcal L_{\mathrm{MPU}}(g,\phi)\,dV_g.
$$

*Proof.* Exactly as in Theorem D.6b. ∎

**Corollary D.6c.1 (Predictive-Action Additive Closure).** Under Lemma D.6a and the hypotheses of Theorem D.6b, Corollary D.6b.1, and Theorem D.6c with a common canonical recovery discretization,
$$
\mathcal F_{h,U}:=\mathcal F^{\mathrm{curv}}_{h,U}+\mathcal V_{h,U}+\mathcal F^{\mathrm{MPU}}_{h,U} \;\xrightarrow{\Gamma}\; \alpha\int_U R_g\,dV_g + \beta\int_U dV_g + \int_U\mathcal L_{\mathrm{MPU}}\,dV_g,
$$
and minimizer sequences admit $\Gamma$-convergent subsequences. ∎

**Theorem D.6d (Closed Einstein–Hilbert + MPU $\Gamma$-Limit).** Combining Corollary D.6c.1 with the four-dimensional Wald/diffeomorphism normalization of Theorem 12.1a fixes
$$
\alpha \;=\; \frac{c^3}{16\pi G},\qquad \beta \;=\; -\frac{c^3\Lambda}{8\pi G},
$$
so the $\Gamma$-limit is
$$
\mathcal F[g,\phi] \;=\; \frac{c^3}{16\pi G}\int_M (R_g-2\Lambda)\sqrt{-g}\,d^4x + \int_M \mathcal L_{\mathrm{MPU}}(g,\phi)\sqrt{-g}\,d^4x,
$$
and minimizer sequences converge up to subsequences. In the vacuum-absorbed convention (Corollary B.8d.2), the constant term is absorbed geometrically and the same corollary reduces to
$$
\mathcal F[g,\phi] \;=\; \frac{c^3}{16\pi G}\int_M R_g\,\sqrt{-g}\,d^4x + \int_M\mathcal L_{\mathrm{MPU}}(g,\phi)\,\sqrt{-g}\,d^4x,
$$
with $\Lambda$ reappearing as an integration constant in §12.

*Proof.* Corollary D.6c.1 provides the generic limit. Theorem 12.1a fixes $\alpha,\beta$ uniquely under diffeomorphism invariance, second-order EOM, and Wald consistency. The minimizer statement is inherited from equicoercivity (Lemma D.6a) and $\Gamma$-convergence. ∎

**Theorem D.6e (Mosco–Cheeger Closure of the Spatial Sector).** Let $(X_n,d_n,\mu_n)$ be the rescaled MPU network metric-measure spaces on the geometric branch, and let the rescaled propagation-cost Dirichlet forms be
$$
\mathcal E_n(f)
=
\frac12\sum_{x\sim y}c^{(n)}_{xy}\bigl(f(x)-f(y)\bigr)^2.
$$
On the minimal $M=24$, $D=4$ branch, fix the curvature parameter $K$ used in the target $\mathrm{BE}(K,4)$ condition. For each finite configuration $\mathcal C$ at resolution $n$, define the continuum-control defect
$$
\mathfrak D_n(\mathcal C)
:=
\mathfrak B_n(\mathcal C)
+
\mathfrak C_n(\mathcal C)
+
\mathfrak R_n(\mathcal C)
+
\mathfrak H_n(\mathcal C).
$$

The radius-2 Bakry–Émery defect is
$$
\mathfrak B_n(\mathcal C)
=
\sup_x
\sup_{\substack{f\in\mathcal P_2(B_2(x))\\ \|f\|_{\mathcal P_2(B_2(x))}\le1}}
\left[
K\Gamma_{n,\mathcal C}(f)(x)
+
\frac14(L_{n,\mathcal C}f(x))^2
-
\Gamma_{2,n,\mathcal C}(f)(x)
\right]_+^2,
\tag{D.6e.1}
$$
where $\mathcal P_2(B_2(x))$ is the finite polynomial core generated by constants, affine shell coordinates, and their quadratic products on the radius-2 $D_4$ neighborhood, with any fixed coefficient norm on this finite-dimensional core.

Let $\mathcal L_n^{(2)}(\mathcal C)$ be the graph Lipschitz core generated by these local $\mathcal P_2$ functions. The finite-core defect is
$$
\mathfrak C_n(\mathcal C)
=
\sup_{\|u\|_{L^2(\mu_n)}^2+\mathcal E_n(u)\le1}
\inf_{v\in\mathcal L_n^{(2)}(\mathcal C)}
\left(
\|u-v\|_{L^2(\mu_n)}^2+\mathcal E_n(u-v)
\right).
\tag{D.6e.2}
$$
The recovery defect is
$$
\mathfrak R_n(\mathcal C)
=
\sup_{f\in\mathcal C_{\mathrm{Lip}},\ \|f\|_{\mathrm{Lip}}+\|f\|_\infty\le1}
\left(
\|I_nE_nf-f\|_{L^2}
+
\left|\mathcal E_n(E_nf)-\mathcal E_\infty^{\mathrm{cand}}(f)\right|
\right),
\tag{D.6e.3}
$$
where $E_n$ is the sampling map, $I_n$ is the canonical cell interpolation, and $\mathcal E_\infty^{\mathrm{cand}}$ is the quadratic form determined by the limiting shell tensor. The quantitative-rigidity defect is
$$
\mathfrak H_n(\mathcal C)
=
\sup_{x,r}
\left[
\frac{d_{GH}(B_r(x),B_r^{\mathbb R^4})}{r}
+
\left|
\frac{\mu_n(B_r(x))}{\omega_4r^4}-1
\right|
+
\mathrm{HarmEx}_n(x,r)
\right]^2,
\tag{D.6e.4}
$$
with the supremum taken over the fixed-radius noncollapsed chart range and with $\mathrm{HarmEx}_n$ the normalized harmonic-coordinate excess.

Let the continuum-control part of the microscopic PCE potential be
$$
V_n^{\mathrm{cont}}(\mathcal C)
=
V_n(\mathcal C)
+
\lambda_{\mathrm{BE}}\mathfrak B_n(\mathcal C)
+
\lambda_{\mathrm{core}}\mathfrak C_n(\mathcal C)
+
\lambda_{\mathrm{rec}}\mathfrak R_n(\mathcal C)
+
\lambda_{\mathrm{rig}}\mathfrak H_n(\mathcal C),
\qquad
\lambda_{\mathrm{BE}},\lambda_{\mathrm{core}},\lambda_{\mathrm{rec}},\lambda_{\mathrm{rig}}>0.
\tag{D.6e.5}
$$
Let $\lambda_{\min}$ and $\lambda_{\max}$ be the minimum and maximum of these four positive coefficients, let
$$
\mathcal M_n:=\arg\min V_n,
\qquad
\mathfrak d_n^*
:=
\inf_{\mathcal C\in\mathcal M_n}\mathfrak D_n(\mathcal C).
\tag{D.6e.6}
$$
Assume the $D_4$ branch of Theorem C.6e supplies a competitor sequence in $\mathcal M_n$ with $\mathfrak d_n^*\to0$. Then every global minimizer $\mathcal C_n^*$ of $V_n^{\mathrm{cont}}$ satisfies
$$
\mathfrak D_n(\mathcal C_n^*)
\le
\frac{\lambda_{\max}}{\lambda_{\min}}\mathfrak d_n^*,
\tag{D.6e.7}
$$
and hence lies on a vanishing-defect sequence. Moreover, in the detailed-balance low-noise regime of Theorem D.5, for every $\varepsilon>0$ and each fixed $n$ there are constants $c_{n,\varepsilon},C_{n,\varepsilon}>0$ such that
$$
\pi_{\theta,n}\!\left(
\mathfrak D_n>
\frac{\lambda_{\max}}{\lambda_{\min}}\mathfrak d_n^*+\varepsilon
\right)
\le
C_{n,\varepsilon}e^{-c_{n,\varepsilon}/\theta}.
\tag{D.6e.8}
$$
For every selected minimizing sequence with $\mathfrak D_n\to0$, after passage to a subsequence, $\mathcal E_n$ Mosco-converges to a strongly local regular Dirichlet form
$$
\mathcal E_\infty(f)
=
\int_X |\nabla f|_h^2\,d\mu
$$
on the measured-GH limit $(X,d,\mu)$, and this form is the Cheeger energy of $(X,d,\mu)$.

*Proof.* Each defect in (D.6e.1)–(D.6e.4) is nonnegative and finite on the normalized finite-resolution cores. Let $\mathcal Y_n\in\mathcal M_n$ be a competitor with $\mathfrak D_n(\mathcal Y_n)$ arbitrarily close to $\mathfrak d_n^*$. Since $\mathcal C_n^*$ minimizes $V_n^{\mathrm{cont}}$ and $V_n(\mathcal C_n^*)\ge V_n(\mathcal Y_n)=\min V_n$,
$$
\lambda_{\min}\mathfrak D_n(\mathcal C_n^*)
\le
\sum_\bullet\lambda_\bullet\mathfrak D_{n,\bullet}(\mathcal C_n^*)
\le
\sum_\bullet\lambda_\bullet\mathfrak D_{n,\bullet}(\mathcal Y_n)
\le
\lambda_{\max}\mathfrak D_n(\mathcal Y_n).
$$
Taking the infimum over such competitors gives (D.6e.7). Since $\mathfrak d_n^*\to0$, the selected minimizers have $\mathfrak D_n\to0$.

For (D.6e.8), Theorem D.5 gives the Gibbs stationary density proportional to $e^{-V_n^{\mathrm{cont}}/\theta}$ in the detailed-balance low-noise regime. The admissible configuration set at fixed $n$ is compact and the defects are continuous finite-dimensional functions on it. Therefore the closed set
$$
\left\{
\mathfrak D_n\ge
\frac{\lambda_{\max}}{\lambda_{\min}}\mathfrak d_n^*+\varepsilon
\right\}
$$
is separated from the global minimizer set of $V_n^{\mathrm{cont}}$ by a positive potential gap $c_{n,\varepsilon}$. The same Laplace estimate used in Theorem D.5 gives (D.6e.8).

Now take a selected minimizing sequence with $\mathfrak D_n\to0$. Theorem C.6 supplies uniform local doubling and local $(1,2)$-Poincaré control on the selected bounded-geometry branch, while Theorem C.6e supplies asymptotic $D_4$ shell isotropy, fixed-radius four-dimensional noncollapse, and uniform locality. The convergence $\mathfrak C_n\to0$ gives a dense finite Lipschitz core for the action-level spatial sector. The convergence $\mathfrak R_n\to0$ gives both interpolation consistency and recovery sequences on that core.

For the Mosco liminf inequality, let $f_n\to f$ in $L^2$ along the measured-GH realization. The discrete carré-du-champ measures are tight by uniform locality and the doubling/Poincaré bounds. Lower semicontinuity of convex quadratic forms gives
$$
\mathcal E_\infty(f)\le\liminf_{n\to\infty}\mathcal E_n(f_n).
$$
For the Mosco limsup inequality, take $f$ in the dense Lipschitz core and set $f_n=E_nf$. Since $\mathfrak R_n\to0$,
$$
I_nf_n\to f
\quad\text{in }L^2,
\qquad
\mathcal E_n(f_n)\to\mathcal E_\infty^{\mathrm{cand}}(f).
$$
Density of the core and the Markov property extend the recovery statement to the full form domain. Hence $\mathcal E_n$ Mosco-converges to $\mathcal E_\infty=\mathcal E_\infty^{\mathrm{cand}}$.

The odd $D_4$ shell moments vanish and the second moments converge to a positive definite quadratic tensor by Theorem C.6e. Therefore the limit form has no first-order drift term and its second-order part is represented by a measurable cotangent metric $h$. Strong locality follows from uniform locality, because all macroscopic jump contributions vanish in the limit. Regularity follows from the dense Lipschitz core and the regularity of the discrete Markov forms. On a doubling PI space, the quadratic strongly local relaxation of the slope energy is the Cheeger energy; hence $\mathcal E_\infty$ is the Cheeger energy of $(X,d,\mu)$. ∎

**Proposition D.6f (Sharp Global-Core Competitor Condition).** In Theorem D.6e, the weakest condition that can force asymptotic defect removal while selection remains inside the global core-minimum class is
$$
\mathfrak d_n^*
=
\inf_{\mathcal C\in\mathcal M_n}\mathfrak D_n(\mathcal C)
\longrightarrow 0.
\tag{D.6f.1}
$$
Equivalently, there exists a sequence $\mathcal Y_n\in\mathcal M_n$ with $\mathfrak D_n(\mathcal Y_n)\to0$ if and only if Equation (D.6f.1) holds. The $D_4$ shell moment closure, noncollapse, and local Bakry-Émery transfer data by themselves do not imply Equation (D.6f.1), because they do not rank the zero-defect configurations inside the core potential $V_n$.

*Proof.* If Equation (D.6f.1) holds, choose $\mathcal Y_n\in\mathcal M_n$ with
$$
\mathfrak D_n(\mathcal Y_n)
\le
\mathfrak d_n^*+\frac1n.
$$
Then $\mathfrak D_n(\mathcal Y_n)\to0$. Conversely, if $\mathcal Y_n\in\mathcal M_n$ and $\mathfrak D_n(\mathcal Y_n)\to0$, then
$$
0\le \mathfrak d_n^*\le \mathfrak D_n(\mathcal Y_n)\to0,
$$
so Equation (D.6f.1) holds.

The condition is necessary for any theorem whose selected configurations are required to remain in $\mathcal M_n$. If Equation (D.6f.1) fails, there are $\varepsilon_0>0$ and a subsequence $n_j$ such that $\mathfrak d_{n_j}^*\ge\varepsilon_0$. By the definition of $\mathfrak d_n^*$, every $\mathcal C\in\mathcal M_{n_j}$ then satisfies $\mathfrak D_{n_j}(\mathcal C)\ge\varepsilon_0$, so no sequence selected inside the global core-minimum class can have vanishing total continuum defect.

The sharpness is independent of the local $D_4$ data. At a fixed resolution, take two admissible configurations $r_n$ and $s_n$ with the same first-shell $D_4$ carrier and the same noncollapse data, but with $\mathfrak D_n(r_n)=0$ and $\mathfrak D_n(s_n)=1$. Define a core potential with $V_n(s_n)=0$ and $V_n(r_n)=1$. Then $\mathcal M_n=\{s_n\}$ and $\mathfrak d_n^*=1$, although a zero-defect $D_4$ competitor exists outside $\mathcal M_n$. Thus zero-defect local geometry does not imply zero-defect membership in the global core-minimum class. The extra hypothesis in Theorem D.6e is exactly the assertion that the zero-defect competitor exists inside $\mathcal M_n$. ∎

**Definition D.6f.1 (Fractal-to-Smooth Scale Audit).** For a finite configuration $\mathcal C$ at resolution $n$, let $p_t^{(n,\mathcal C)}(x,y)$ be the heat kernel of the rescaled propagation-cost Dirichlet form and define the averaged return probability
$$
P_{n,\mathcal C}(\tau)
=
\int p_\tau^{(n,\mathcal C)}(x,x)\,d\mu_n(x).
\tag{D.6f.2}
$$
The finite spectral dimension on the audited scale window is the logarithmic finite-difference quantity
$$
d_{s,n}^{\mathcal C}(\tau)
=
-2\,\Delta_{\log\tau}\log P_{n,\mathcal C}(\tau).
\tag{D.6f.3}
$$
Let $\mathfrak A_n(\mathcal C)$ denote the macroscopic anomalous chemical-distance excess relative to the $D=4$ operational-continuum scaling window. The scale audit is
$$
\mathfrak S_n(\mathcal C)
=
\sup_{\tau\in[\tau_{\mathrm{IR}},\tau_{\mathrm{UV}}]}
\left|d_{s,n}^{\mathcal C}(\tau)-4\right|^2
+
\mathfrak A_n(\mathcal C),
\tag{D.6f.4}
$$
where $[\tau_{\mathrm{IR}},\tau_{\mathrm{UV}}]$ is the fixed macroscopic operational window of the selected continuum branch. UV recursive or fractal behavior below this window is not penalized by $\mathfrak S_n$ unless it propagates into macroscopic spectral dimension or chemical-distance excess.

**Theorem D.6f.2 (Scale-Audit Sufficient Condition for the Global-Core Competitor).** Suppose that, on the selected microscopic branch, the global core-minimum class $\mathcal M_n$ satisfies:

1. a scale-audit competitor condition
$$
\inf_{\mathcal C\in\mathcal M_n}\mathfrak S_n(\mathcal C)\to0;
\tag{D.6f.5}
$$

2. a continuum-defect domination certificate with constants $A<\infty$ and $b_n\to0$,
$$
\mathfrak D_n(\mathcal C)
\le
A\,\mathfrak S_n(\mathcal C)+b_n
\qquad
\text{for every }\mathcal C\in\mathcal M_n.
\tag{D.6f.6}
$$

Then the sharp global-core competitor condition of Proposition D.6f follows:
$$
\mathfrak d_n^*\to0.
\tag{D.6f.7}
$$
Consequently the selected minimizers of Theorem D.6e have $\mathfrak D_n\to0$. The domination estimate (D.6f.6) is an explicit branch certificate; it is not derived from the definition of $\mathfrak S_n$ alone.

*Proof.* By (D.6f.5), for every $\epsilon>0$ and all sufficiently large $n$ there exists $\mathcal Y_n\in\mathcal M_n$ with
$$
\mathfrak S_n(\mathcal Y_n)\le\epsilon.
$$
Applying the domination certificate (D.6f.6) gives
$$
\mathfrak D_n(\mathcal Y_n)
\le
A\epsilon+b_n.
$$
Taking the infimum over $\mathcal M_n$ gives
$$
0\le
\mathfrak d_n^*
\le
A\epsilon+b_n.
$$
First let $n\to\infty$ and then $\epsilon\to0$. Hence $\mathfrak d_n^*\to0$. The final claim is Theorem D.6e applied to this conclusion. ∎

**Proposition D.6f.2a (Protocol-Response Domination Criterion for the Global-Core Competitor).** Suppose that, on the selected microscopic branch, the core potential $V_n$ factors through the finite protocol-response presheaf of the $24$-channel shell in the sense that two configurations with naturally isomorphic finite responses have the same core value up to $o(1)$. Suppose further that for each $n$ there exists a $D_4$ shell approximant $Y_n$ with
$$
\mathfrak D_n(Y_n)\to0
$$
whose finite response presheaf is naturally isomorphic, up to $o(1)$ protocol error, to that of some global core minimizer in $\mathcal M_n$. Then
$$
\mathfrak d_n^*=
\inf_{\mathcal C\in\mathcal M_n}\mathfrak D_n(\mathcal C)\to0.
$$

*Proof.* Let $Z_n\in\mathcal M_n$ be a global core minimizer whose finite response presheaf is $o(1)$-isomorphic to that of $Y_n$. Since $V_n$ factors through the response presheaf up to $o(1)$, replacing $Z_n$ by the response-equivalent representative $Y_n$ changes the core value by $o(1)$. By compactness of the finite configuration space at resolution $n$, choose an exact minimizer $\widehat Y_n\in\mathcal M_n$ in the same limiting response class with
$$
\mathfrak D_n(\widehat Y_n)
\le
\mathfrak D_n(Y_n)+o(1).
$$
This replacement is legitimate because response-null microstructure is removed by Corollary P.6.1b.8 and therefore cannot distinguish two representatives inside the global core-minimum quotient. Hence
$$
0\le\mathfrak d_n^*
\le
\mathfrak D_n(\widehat Y_n)
\le
\mathfrak D_n(Y_n)+o(1)\to0.
$$
Therefore the sharp global-core competitor condition (D.6f.1) holds. ∎

**Theorem D.6f.2b (Quantitative Defect Coercivity of the Continuum-Control Potential).** In the setting of Theorem D.6e, let
$$
V_{n,\min}^{\mathrm{cont}}
=
\inf_{\mathcal C}V_n^{\mathrm{cont}}(\mathcal C).
$$
Then every admissible configuration $\mathcal C$ satisfies
$$
V_n^{\mathrm{cont}}(\mathcal C)-V_{n,\min}^{\mathrm{cont}}
\ge
\lambda_{\min}\mathfrak D_n(\mathcal C)
-
\lambda_{\max}\mathfrak d_n^*.
\tag{D.6f.8}
$$
Consequently, for every $\varepsilon>0$,
$$
\mathfrak D_n(\mathcal C)
\ge
\frac{\lambda_{\max}}{\lambda_{\min}}\mathfrak d_n^*+\varepsilon
\quad\Longrightarrow\quad
V_n^{\mathrm{cont}}(\mathcal C)-V_{n,\min}^{\mathrm{cont}}
\ge
\lambda_{\min}\varepsilon.
\tag{D.6f.9}
$$

*Proof.* By definition,
$$
V_n^{\mathrm{cont}}(\mathcal C)
=
V_n(\mathcal C)
+
\sum_{\bullet}
\lambda_\bullet\mathfrak D_{n,\bullet}(\mathcal C),
$$
where the four defects are the Bakry-Émery, finite-core, recovery, and rigidity defects. Since $V_n(\mathcal C)\ge\min V_n$ and each defect is nonnegative,
$$
V_n^{\mathrm{cont}}(\mathcal C)
\ge
\min V_n+\lambda_{\min}\mathfrak D_n(\mathcal C).
\tag{D.6f.10}
$$
For every $\eta>0$, choose $\mathcal Y_n\in\mathcal M_n$ with
$$
\mathfrak D_n(\mathcal Y_n)\le\mathfrak d_n^*+\eta.
$$
Then
$$
V_{n,\min}^{\mathrm{cont}}
\le
V_n^{\mathrm{cont}}(\mathcal Y_n)
=
\min V_n+
\sum_{\bullet}
\lambda_\bullet\mathfrak D_{n,\bullet}(\mathcal Y_n)
\le
\min V_n+\lambda_{\max}(\mathfrak d_n^*+\eta).
\tag{D.6f.11}
$$
Subtracting (D.6f.11) from (D.6f.10) and sending $\eta\downarrow0$ gives (D.6f.8). Equation (D.6f.9) follows immediately by substituting the displayed lower bound on $\mathfrak D_n(\mathcal C)$ into (D.6f.8). ∎

**Corollary D.6f.2c (No Continuum Limit with Persistent Positive Defect).** Suppose $\mathfrak d_n^*\to0$ and $\mathcal C_n$ is any sequence with
$$
V_n^{\mathrm{cont}}(\mathcal C_n)-V_{n,\min}^{\mathrm{cont}}\to0.
$$
Then
$$
\mathfrak D_n(\mathcal C_n)\to0.
\tag{D.6f.12}
$$
Thus a selected operational-continuum branch cannot retain persistent positive Bakry-Émery, finite-core, recovery, or rigidity defect while also remaining asymptotically PCE-minimal.

*Proof.* Rearranging (D.6f.8) gives
$$
\lambda_{\min}\mathfrak D_n(\mathcal C_n)
\le
V_n^{\mathrm{cont}}(\mathcal C_n)-V_{n,\min}^{\mathrm{cont}}
+
\lambda_{\max}\mathfrak d_n^*.
$$
The two terms on the right tend to zero by hypothesis. Since $\lambda_{\min}>0$, (D.6f.12) follows. ∎

**Theorem 44a (Regular-Branch Manifold Closure).** Assume the hypotheses of Theorem C.6c and let the selected sequence satisfy $\mathfrak H_n\to0$ in the sense of Theorem D.6e. Then the regular set $X_{\mathrm{reg}}\subset X$ is open, every point of $X_{\mathrm{reg}}$ has unique tangent cone $\mathbb R^4$, and $X_{\mathrm{reg}}$ carries a $C^{1,\alpha}$ Riemannian metric $h_{ij}$ with
$$
d\mu=\sqrt{\det h}\,d^4x,
\qquad
\mathcal E_\infty(f)
=
\int_{X_{\mathrm{reg}}}
h^{ij}\partial_i f\,\partial_j f\,\sqrt{\det h}\,d^4x.
$$
Combined with Corollary O.7b.1, the regular branch carries a $C^{1,\alpha}$ Lorentzian metric $g$ with entropy-orthogonal local form
$$
g=-\alpha(x)^{-1}dt^2+h_{ij}dx^idx^j.
$$

*Proof.* Theorem C.6c gives a noncollapsed $\mathrm{RCD}^*(K,4)$ limit. Noncollapsed $\mathrm{RCD}$ regularity gives Euclidean tangent cones at $\mu$-almost every point. The condition $\mathfrak H_n\to0$ supplies asymptotic Reifenberg closeness, volume-cone closeness, and harmonic-coordinate excess control on the selected fixed-radius chart range. The standard $\varepsilon$-regularity implication for noncollapsed spaces converts these quantitative estimates into openness of the regular set and uniqueness of the tangent cone $\mathbb R^4$ at each point of that set. The harmonic-coordinate excess bound gives uniform $C^{1,\alpha}$ control of the coordinate metric coefficients, yielding the Riemannian metric $h_{ij}$. The energy representation is the local coordinate form of the Cheeger energy identified in Theorem D.6e. Corollary O.7b.1 then appends the finite ND-RID update clock as the entropy-orthogonal time direction, producing the stated Lorentzian metric. ∎

**Remark D.6.1 (PU motivation for hypotheses).**
(i) Appendix C shows that configurations with anomalous volume growth (Definition C.1) or without a uniform positive discrete Ricci lower bound (Definition C.2-C.3) violate at least one of (LV)–(RE) at sufficiently large scale (Theorem C.5). In the low-noise detailed-balance subcase of Theorem D.5, the stationary measure therefore places exponentially dominant weight on the bounded-geometry low-potential sector, motivating the equicoercivity hypothesis needed for $\Gamma$-convergence [Gromov 1999].
(ii) Remark C.3.3a supplies, conditional on the weighted-shell/local-isotropy bridge input or an equivalent replacement, an explicit local scalar curvature estimator built from Ollivier-Ricci curvature at mesh scale $h$, providing a concrete realization of the locality/consistency requirement for the Einstein-Hilbert term at the action level. It does not by itself furnish the Mosco/quadratic limit-energy or Euclidean-rigidity input used later in Section 11.4.
(iii) Appendix E derives the thermodynamic area law and fixes the emergent gravitational constant $G$ (Theorem E.6), providing the normalization invoked in (iii).

*Proof.* Write
$$
\mathcal F_h[g]=\mathcal F_h^{EH}[g]+\mathcal F_h^{MPU}[g].
$$
Hypothesis (i) is equicoercivity: for every $M<\infty$ the sublevel sets
$$
\{\,g:\ \mathcal F_h[g]\le M\,\}
$$
are precompact in the topology of Section 11. In particular, any sequence of (approximate) minimizers admits a convergent subsequence.

For the $\Gamma$-liminf inequality, fix any sequence $g_h\to g$. By hypothesis (ii),
$$
\liminf_{h\to 0}\mathcal F_h^{EH}[g_h]\ge \mathcal F^{EH}[g],
\qquad
\liminf_{h\to 0}\mathcal F_h^{MPU}[g_h]\ge \mathcal F^{MPU}[g].
$$
Hence
$$
\liminf_{h\to 0}\mathcal F_h[g_h]\ge \mathcal F[g].
$$

For the recovery sequence (the $\Gamma$-limsup inequality), fix any admissible continuum metric $g$. Choose the refinement family implicit in (ii) and define $g_h$ as the canonical discretization/interpolation of $g$ on the mesh $h$, so that $g_h\to g$ in the topology of Section 11. Hypothesis (ii) then yields
$$
\limsup_{h\to 0}\mathcal F_h[g_h]\le \mathcal F[g].
$$
Therefore $\mathcal F_h$ $\Gamma$-converges to $\mathcal F$.

By the fundamental theorem of $\Gamma$-convergence [Dal Maso 1993; Braides 2002], $\Gamma$-convergence together with equicoercivity implies convergence (up to subsequences) of minimizers of $\mathcal F_h$ to minimizers of $\mathcal F$, and convergence of minimum values. $\square$

This appendix thus provides the variational and action-level part of the PU dynamical bridge. The Mosco/quadratic limit-energy step and branch-specific Euclidean-rigidity input are encoded in the continuum-control defects of Theorem D.6e and selected only on the vanishing-defect operational branch; the AQFT coarse-graining closure remains the separate Appendix F bridge.

**Summary of Theorem 2 (Dynamically Enforced Functional Correspondence - Justified):**
The exact equilibrium statement of Theorem 2 is Corollary D.1: any true stable PCE equilibrium must satisfy $C_P(v)=\langle\hat C_v\rangle_{x^*}$ for all $v$. On the operational side, the work-cost gap feedback mechanism (Lemma D.2) and the stochastic contraction estimate of Proposition D.1 / Corollary D.2 show that the proxy-complexity coordinates are driven toward that equilibrium up to a controlled noise floor. The ergodic stationary regime of Theorem D.5 then identifies the long-run averages of the proxy variables with expectations under the invariant measure; in low-noise detailed-balance regimes, that invariant measure assigns exponentially dominant weight to neighborhoods of the lowest-potential regular set.

*Proof Reference:* Corollary D.1 gives exact alignment at true stable equilibria. Lemma D.2, Proposition D.1, and Corollary D.2 provide the physical feedback mechanism and quantitative tracking bound. Theorem D.5 provides ergodic stationary averaging and, in its detailed-balance subcase, low-noise concentration near the low-potential regular set.

**Summary of Theorem 43 (Dynamical Emergence of Geometric Regularity - Justified):**
The slow adaptation dynamics of the MPU network (Equation D.8), driven by minimizing the PCE Potential $V(x)$ which inherently penalizes irregularity (Theorem D.2, Lemma D.3), admit an ergodic stationary regime under Assumptions (A1)-(A6) (Theorem D.5). By Theorem D.3, every global minimum of the full potential $V(x)$ is geometrically regular (Definition C.3). Hence, in low-noise detailed-balance regimes, the stationary measure concentrates on neighborhoods of geometrically regular configurations; more generally, regularity characterizes the lowest-potential sector selected by POP/PCE.

*Proof Reference:* Lemma D.3 and Theorem D.2 identify irregularity as a positive contribution to the potential; Theorem D.3 proves that global minima are regular; Theorem D.5 provides ergodicity and, in its detailed-balance subcase, low-noise concentration near the regular low-potential sector.


**D.8 Rigorous Convergence Analysis for Complexity Adaptation**

The complexity adaptation dynamics (Section 6.4) are driven by the Adaptation Driving Force $\Psi(C)$ (Definition 20), which acts as a gradient flow on an effective complexity potential $V_{eff}(C)$ derived from the full PCE potential $V(x)$. We provide a rigorous convergence proof with quantitative rates using standard optimization theory.

### D.8.1 Effective Complexity Potential and Equilibrium

**Definition D.5 (Effective Complexity Potential).** 
The effective potential $V_{eff}(C)$ is obtained by reducing the full PCE potential $V(x)$ (Definition D.1) to the complexity coordinate $C$, with the rigorous reduction supplied by Theorem D.5a below. The deterministic complexity dynamics are:

$$
\dot{C}(t) = \eta_{adapt} \Psi(C(t)), \quad \Psi(C) = -\frac{\partial V_{eff}(C)}{\partial C}
\tag{D.13}
$$

**Theorem D.5a (Constrained Reduction and Free-Energy Representation of $V_{eff}$).** Let $\mathcal{K}\subset\mathcal{X}_{adm}$ be the compact invariant set from assumption (A5), let $V\in C^2(\mathcal{K})$ be the PCE potential of Definition D.1, and let $\mathcal{C}:\mathcal{K}\to [C_{op},\infty)$ be a continuous complexity projection. For each admissible $C$ with nonempty level set
$$
\Sigma_C:=\{x\in\mathcal{K}:\mathcal{C}(x)=C\},
$$
define
$$
V_{eff}(C):=\min_{x\in\Sigma_C}V(x).
\tag{D.13a}
$$
Then:

1. $V_{eff}(C)$ is well-defined and the minimum is attained on $\Sigma_C$.

2. If $\sigma_C$ is any finite Borel measure on $\Sigma_C$ with full support, then the low-noise free-energy reduction
$$
V_{eff}(C;\theta):=-\theta\ln\int_{\Sigma_C}e^{-V(x)/\theta}\,d\sigma_C(x)
\tag{D.13b}
$$
satisfies
$$
\lim_{\theta\downarrow0}V_{eff}(C;\theta)=V_{eff}(C).
\tag{D.13c}
$$

3. If locally $x=(C,y)$ and the constrained minimizer on $\Sigma_C$ is unique, written $x_*(C)=(C,y_*(C))$, then
$$
V_{eff}(C)=V(C,y_*(C)).
$$

*Proof.* Because $\mathcal{C}$ is continuous, $\Sigma_C$ is closed in the compact set $\mathcal{K}$ and is therefore compact. Continuity of $V$ on $\Sigma_C$ implies that the minimum in (D.13a) is attained by the Weierstrass theorem, proving (1). For (2), let $m_C:=V_{eff}(C)$. Since $V\ge m_C$ on $\Sigma_C$,
$$
\int_{\Sigma_C}e^{-V/\theta}\,d\sigma_C \le e^{-m_C/\theta}\sigma_C(\Sigma_C),
$$
hence
$$
-\theta\ln\int_{\Sigma_C}e^{-V/\theta}\,d\sigma_C \ge m_C-\theta\ln\sigma_C(\Sigma_C).
$$
Conversely, for any $\varepsilon>0$, the set
$$
U_\varepsilon:=\{x\in\Sigma_C:V(x)\le m_C+\varepsilon\}
$$
is nonempty and relatively open in $\Sigma_C$; by full support, $\sigma_C(U_\varepsilon)>0$. Therefore
$$
\int_{\Sigma_C}e^{-V/\theta}\,d\sigma_C \ge e^{-(m_C+\varepsilon)/\theta}\sigma_C(U_\varepsilon),
$$
so
$$
-\theta\ln\int_{\Sigma_C}e^{-V/\theta}\,d\sigma_C \le m_C+\varepsilon-\theta\ln\sigma_C(U_\varepsilon).
$$
Letting $\theta\downarrow0$ and then $\varepsilon\downarrow0$ yields (D.13c). Statement (3) is immediate from the definition of the constrained minimizer in the local split $x=(C,y)$. ∎

**Remark D.5a.1 (Relation to the informal marginalization language).** The phrase “marginalizing over the remaining degrees of freedom at quasi-equilibrium conditioned on $C$” is represented rigorously here by constrained minimization, and equivalently by the low-noise free-energy reduction (D.13b)–(D.13c). In the detailed-balance low-noise regime of Theorem D.5, both constructions select the same reduced potential.

where from Equation (24):
$$
\Psi(C) = \Gamma_0 \frac{\partial PP}{\partial C}(C) - \lambda R'(C) - R_I'(C)
$$

**Theorem D.5b (Schur-Complement Hessian Formula for $V_{eff}$).** Under the hypotheses of Theorem D.5a, assume a local coordinate split $x=(C,y)$ and a unique $C^1$ branch of constrained minimizers $y_*(C)$ satisfying $V_y(C,y_*(C))=0$ and with $V_{yy}(C,y_*(C))$ positive definite. Then $V_{eff}(C)=V(C,y_*(C))$ is twice continuously differentiable and
$$
V_{eff}''(C)=V_{CC}(C,y_*(C)) - V_{Cy}(C,y_*(C))V_{yy}(C,y_*(C))^{-1}V_{yC}(C,y_*(C)).
\tag{D.13d}
$$
Consequently,
$$
V_{eff}''(C)=-\Psi'(C).
\tag{D.13e}
$$

*Proof.* Since $V_y(C,y_*(C))=0$ and $V_{yy}(C,y_*(C))$ is positive definite, the implicit-function theorem gives a $C^1$ branch $y_*(C)$ on the neighborhood under consideration. Differentiating $V_{eff}(C)=V(C,y_*(C))$ once gives
$$
V_{eff}'(C)=V_C(C,y_*(C))+V_y(C,y_*(C))y_*'(C)=V_C(C,y_*(C)),
$$
because $V_y$ vanishes on the minimizing branch. Differentiating the first-order condition $V_y(C,y_*(C))=0$ yields
$$
V_{yC}+V_{yy}y_*'(C)=0,
$$
hence
$$
y_*'(C)=-V_{yy}^{-1}V_{yC}.
$$
Differentiating $V_{eff}'(C)=V_C(C,y_*(C))$ once more gives
$$
V_{eff}''(C)=V_{CC}+V_{Cy}y_*'(C)=V_{CC}-V_{Cy}V_{yy}^{-1}V_{yC},
$$
which is (D.13d). Identity (D.13e) follows immediately from $\Psi(C)=-V_{eff}'(C)$. ∎

**Corollary D.5b.1 (Explicit Reduced Curvature at the PCE Optimum).** At fixed $\hat{C}_{target}$, the PCE-optimal complexity $C^\star$ satisfies $\Psi(C^\star)=0$ (Equation 18), and the reduced curvature
$$
\kappa_C:=V_{eff}''(C^\star)
$$
is
$$
\kappa_C = -\Gamma_0\,PP''(C^\star) + \lambda R''(C^\star) - \frac{r_I}{(C^\star)^2\ln 2}.
\tag{D.13f}
$$
Using Equation (22),
$$
PP''(C)=-(\beta-\alpha)\frac{\kappa_{\mathrm{eff}}^2}{\hat{C}_{target}^2}e^{-\kappa_{\mathrm{eff}}(C-C_{op})/\hat{C}_{target}},
$$
so
$$
\kappa_C = \Gamma_0(\beta-\alpha)\frac{\kappa_{\mathrm{eff}}^2}{\hat{C}_{target}^2}e^{-\kappa_{\mathrm{eff}}(C^\star-C_{op})/\hat{C}_{target}} + \lambda R''(C^\star) - \frac{r_I}{(C^\star)^2\ln 2}.
\tag{D.13g}
$$

*Proof.* From Equation (35), at fixed $\hat{C}_{target}$,
$$
\Psi'(C)=\Gamma_0 PP''(C)-\lambda R''(C)+\frac{r_I}{C^2\ln 2}.
$$
Applying (D.13e) at $C=C^\star$ gives (D.13f). Substituting the second derivative of the Law of Prediction yields (D.13g). Under DSC (Theorem 22), $\Psi'(C^\star)<0$, so $\kappa_C>0$. ∎

**Theorem D.7 (Uniqueness and Stability of Optimal Complexity).**
Under the Dominance of Stabilizing Costs (DSC, Theorem 22), which ensures $\Psi'(C) < 0$ for all $C$ in the viable range, the effective potential $V_{eff}(C)$ is strictly convex. Consequently:

1. There exists a unique global minimum $C^\star$ satisfying $\Psi(C^\star) = 0$.
2. This minimum is globally stable: $\Psi(C) > 0$ for $C < C^\star$ and $\Psi(C) < 0$ for $C > C^\star$.

*Proof.* The DSC condition (Theorem 22) ensures that the convexity of the physical cost $R(C)$ together with performance saturation (concave $PP(C)$) dominates any destabilizing concavity in the informational cost $R_I(C)$. From Equation (35) in Section 6.5.1:
$$
\Psi'(C) = \Gamma_0 \frac{\partial^2 PP}{\partial C^2} - \lambda R''(C) + \frac{r_I}{C^2 \ln 2}
$$
DSC requires this derivative to be negative. Since $\frac{\partial^2 PP}{\partial C^2} < 0$ (strict concavity), $R''(C) \ge 0$ (convexity), and the stabilizing cost terms dominate, we have $\Psi'(C) < 0$. Strict convexity of $V_{eff}$ follows from $V''_{eff}(C) = -\Psi'(C) > 0$. A strictly convex function on an interval has at most one critical point, which must be a global minimum. The gradient flow property of Equation (D.13) ensures trajectories flow toward this minimum from any initial condition. QED

### D.8.2 Polyak–Łojasiewicz Condition and Linear Convergence

Near the unique optimum, the strict convexity ensures a strong local gradient dominance condition that guarantees exponential convergence.

**Definition D.6 (Polyak–Łojasiewicz Inequality).**
A function $V(C)$ satisfies the PL inequality with constant $\mu_{PL} > 0$ in a neighborhood $|C - C^\star| \le r$ if:

$$
\frac{1}{2}|\nabla V(C)|^2 \ge \mu_{PL} \big(V(C) - V(C^\star)\big)
\tag{D.14}
$$

The radius $r$ depends on the third and higher-order derivatives of $V_{eff}$; for practical purposes, we require the neighborhood to extend beyond the initial distance $|C(0) - C^\star|$ for deterministic convergence guarantees to apply.

**Lemma D.7 (PL Constant from Stability).**
Fix a neighborhood $|C-C^\star|\le r$ on which $\Psi$ is continuously differentiable. Define the strong monotonicity constant
$$
\underline{\lambda} := \inf_{|C-C^\star|\le r}\bigl(-\Psi'(C)\bigr).
$$
Under DSC (Theorem 22), $\Psi'(C)<0$ on the viable range, hence by continuity and compactness of the closed neighborhood the infimum exists and satisfies $\underline{\lambda}>0$. On this neighborhood the effective potential $V_{eff}$ satisfies the PL inequality with constant
$$
\mu_{PL} = \underline{\lambda}
\tag{D.14a}
$$

*Proof.* Since $\Psi(C)=-V'_{eff}(C)$, we have $V''_{eff}(C)=-\Psi'(C)\ge\underline{\lambda}$ on $|C-C^\star|\le r$, so $V_{eff}$ is $\underline{\lambda}$-strongly convex there. Let $C^\star$ be its unique minimizer (Theorem D.7), so $V'_{eff}(C^\star)=0$. Strong convexity implies for any $C$ in the neighborhood
$$
V_{eff}(C^\star)\ge V_{eff}(C)+V'_{eff}(C)(C^\star-C)+\frac{\underline{\lambda}}{2}(C^\star-C)^2.
$$
Rearranging and applying Cauchy–Schwarz and Young's inequality,
$$
V_{eff}(C)-V_{eff}(C^\star)
\le |V'_{eff}(C)|\,|C-C^\star|-\frac{\underline{\lambda}}{2}|C-C^\star|^2
\le \frac{1}{2\underline{\lambda}}|V'_{eff}(C)|^2.
$$
Multiplying by $\underline{\lambda}$ yields $\frac{1}{2}|V'_{eff}(C)|^2 \ge \underline{\lambda}\bigl(V_{eff}(C)-V_{eff}(C^\star)\bigr)$, which is exactly (D.14) with $\mu_{PL}=\underline{\lambda}$. QED

### D.8.3 Convergence Theorem with Explicit Rates

**Theorem D.8 (Exponential Convergence of Complexity Adaptation).**
Consider the complexity adaptation dynamics (D.13) with initial condition $C(0)$.

**Part I (Deterministic Rate):** For the deterministic flow, the distance to optimum decays exponentially:

$$
\big|C(t) - C^\star\big| \le e^{-\underline{\lambda}\,\eta_{adapt}\, t} \big|C(0) - C^\star\big|
\tag{D.15}
$$

with rate constant $\underline{\lambda}>0$ defined in Lemma D.7.

**Part II (Stochastic Rate with Noise Floor):** When the full stochastic dynamics (Equation D.8) are considered, the effective noise from ND-RID fluctuations induces a diffusion term in the complexity direction. Assume the complexity coordinate admits the effective one-dimensional Ito form
$$
dC_t = \eta_{adapt}\Psi(C_t)\,dt + \sqrt{2D_{CC}(x(t))}\,dB_t,
$$
where $B_t$ is a standard one-dimensional Wiener process and the projected diffusion coefficient satisfies $0\le D_{CC}(x)\le D_{CC}^{max}<\infty$ on the compact set $\mathcal K$ (A5). Let
$$
L_{eff}:=\sup_{|C-C^\star|\le r} V''_{eff}(C)<\infty.
$$
Then the expected potential gap decays exponentially to a noise floor:
$$
\mathbb{E}\big[V_{eff}(C_t) - V_{eff}(C^\star)\big]
\le e^{-2\underline{\lambda}\eta_{adapt}t}\big(V_{eff}(C_0) - V_{eff}(C^\star)\big)
+ \frac{D_{CC}^{max}L_{eff}}{2\underline{\lambda}\eta_{adapt}}\Bigl(1-e^{-2\underline{\lambda}\eta_{adapt}t}\Bigr)
\tag{D.16}
$$

*Proof.*

**Part I:** Let $e(t):=C(t)-C^\star$. Since $\Psi(C^\star)=0$ and $\Psi'(C)\le -\underline{\lambda}$ on $|C-C^\star|\le r$, the mean-value theorem gives
$$
e(t)\,\Psi(C(t)) = e(t)\bigl(\Psi(C(t))-\Psi(C^\star)\bigr) \le -\underline{\lambda}|e(t)|^2.
$$
Using $\dot e(t)=\eta_{adapt}\Psi(C(t))$,
$$
\frac{d}{dt}\frac{|e(t)|^2}{2} = e(t)\dot e(t) = \eta_{adapt}e(t)\Psi(C(t)) \le -\underline{\lambda}\eta_{adapt}|e(t)|^2.
$$
Gronwall's inequality yields (D.15).

**Part II:** Apply Ito's formula to the potential gap
$$
G(C_t):=V_{eff}(C_t)-V_{eff}(C^\star).
$$
Using $V'_{eff}(C)=-\Psi(C)$ and $dC_t = -\eta_{adapt}V'_{eff}(C_t)dt + \sqrt{2D_{CC}(x(t))}\,dB_t$, we obtain
$$
dG(C_t)= -\eta_{adapt}|V'_{eff}(C_t)|^2dt + V'_{eff}(C_t)\sqrt{2D_{CC}(x(t))}\,dB_t + D_{CC}(x(t))V''_{eff}(C_t)dt.
$$
Taking expectations eliminates the martingale term and gives
$$
\frac{d}{dt}\mathbb E[G(C_t)]
\le -\eta_{adapt}\,\mathbb E\bigl[|V'_{eff}(C_t)|^2\bigr] + D_{CC}^{max}L_{eff}.
$$
By the PL inequality (D.14) with $\mu_{PL}=\underline{\lambda}$ (Lemma D.7),
$$
\frac{1}{2}|V'_{eff}(C)|^2 \ge \underline{\lambda}\bigl(V_{eff}(C)-V_{eff}(C^\star)\bigr)=\underline{\lambda}G(C),
$$
hence
$$
\frac{d}{dt}\mathbb E[G(C_t)]
\le -2\underline{\lambda}\eta_{adapt}\,\mathbb E[G(C_t)] + D_{CC}^{max}L_{eff}.
$$
Solving this linear differential inequality yields (D.16). The asymptotic noise floor $D_{CC}^{max}L_{eff}/(2\underline{\lambda}\eta_{adapt})$ is the fundamental limit imposed by ND-RID stochasticity and cannot be eliminated by longer integration time. QED

### D.8.4 Physical Interpretation

**Rapid Equilibration:** The rate constant $\underline{\lambda}$ is the local "stiffness" of the complexity potential well near the optimum. DSC (Theorem 22) ensures this is strictly positive and typically $\mathcal{O}(1)$ in natural units, yielding convergence timescales $\tau_{conv} \sim 1/(\underline{\lambda}\,\eta_{adapt})$ that are rapid compared to environmental evolution timescales.

**Noise Floor:** The residual fluctuations $\sigma_{eff}$ arise from the underlying ND-RID irreversibility ($\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$, Theorem 31). The noise floor is typically small:

$$
\frac{\sigma_{eff}^2}{\underline{\lambda}\,\eta_{adapt}} \ll C^\star
$$

ensuring tight convergence to the optimal complexity.

**Connection to Global Dynamics:** This local analysis complements Theorem D.5. The global theorem gives ergodic stationary averaging for the full configuration dynamics and, in detailed-balance low-noise regimes, concentration of stationary mass near the lowest-potential set. The present theorem quantifies how quickly the reduced complexity coordinate relaxes within such a neighborhood.

The complexity adaptation is provably convergent with exponential rate $\underline{\lambda}\,\eta_{adapt}$ to a unique optimum $C^\star$, and in the stochastic setting remains within the ND-RID noise floor around that optimum. This provides the local tracking component of Theorem 2.

### D.8.5 PCE Marginality and 1/f Spectra

This subsection records the spectral consequence of stochastic PCE dynamics near a marginal viability surface. The result is not an additional dynamical postulate. It is the linear response form of Equation D.8 when the active relaxation spectrum has no preferred update scale inside a finite operational band.

**Definition D.8a (Prediction-Error Spectral Observable).** Let $x^*$ be a PCE operating point for the stochastic dynamics (D.8), and write $\xi_t=x_t-x^*$ in a local chart. A scalar prediction-error observable is any centered linear readout
$$
e(t)=\ell(\xi_t),
\tag{D.17}
$$
where $\ell$ is a continuous linear functional on the local tangent space. Its two-sided angular-frequency power spectrum is
$$
S_e(\omega)=\int_{-\infty}^{\infty} e^{-i\omega\tau}\,\mathbb E[e(t+\tau)e(t)]\,d\tau.
\tag{D.18}
$$

**Lemma D.8a (Modal Lorentzian Spectrum).** Suppose one stable relaxation mode of the linearized PCE flow has the stationary Ornstein-Uhlenbeck form
$$
dy_t=-\lambda y_t\,dt+\sqrt{2\lambda a}\,dB_t,
\qquad \lambda>0,\quad a>0.
\tag{D.19}
$$
Then its stationary variance is $a$, its autocovariance is $a e^{-\lambda|\tau|}$, and its power spectrum is
$$
S_\lambda(\omega)=\frac{2a\lambda}{\omega^2+\lambda^2}.
\tag{D.20}
$$

*Proof.* The stationary variance of (D.19) solves
$$
0=-2\lambda\,\mathrm{Var}(y_t)+2\lambda a,
$$
hence $\mathrm{Var}(y_t)=a$. The Markov solution gives
$$
\mathbb E[y(t+\tau)y(t)]=a e^{-\lambda|\tau|}.
$$
Taking the Fourier transform,
$$
\int_{-\infty}^{\infty}a e^{-\lambda|\tau|}e^{-i\omega\tau}\,d\tau
=
2a\int_0^\infty e^{-\lambda\tau}\cos(\omega\tau)\,d\tau
=
\frac{2a\lambda}{\omega^2+\lambda^2}.
$$
This proves (D.20). ∎

**Definition D.8b (Marginal PCE Relaxation Band).** A PCE operating point $x^*$ has an active marginal relaxation band $[\lambda_{\min},\lambda_{\max}]$ if the linearized prediction-error observable decomposes into stable relaxation modes whose rates fill the interval with logarithmic rate density $q(\lambda)\,d\log\lambda$, amplitudes $a(\lambda)>0$, and
$$
0<\lambda_{\min}\ll \lambda_{\max}<\infty.
$$
The band is called locally scale-neutral when the active mode-weight product
$$
h(\lambda):=a(\lambda)q(\lambda)
\tag{D.21}
$$
has no resolved rate dependence on the band, i.e. $h(\lambda)=h_0+o(1)$ over the operationally observed inertial interval.

**Theorem D.8a (Spectral Exponent from the PCE Relaxation Density).** Let $e(t)$ be a prediction-error observable whose active modes satisfy Lemma D.8a and Definition D.8b. Suppose that on an intermediate frequency window
$$
\lambda_{\min}\ll \omega\ll \lambda_{\max}
\tag{D.22}
$$
the mode-weight product has the asymptotic form
$$
h(\lambda)=A_0\lambda^s(1+o(1)),
\qquad -1<s<1,\quad A_0>0.
\tag{D.23}
$$
Then
$$
S_e(\omega)
\sim
\frac{\pi A_0}{\cos(\pi s/2)}\,\omega^{s-1},
\tag{D.24}
$$
and therefore the observed power-law exponent in $S_e(f)\propto f^{-\beta_{\mathrm{spec}}}$ is
$$
\boxed{\beta_{\mathrm{spec}}=1-s.}
\tag{D.25}
$$
In particular, the locally scale-neutral case $s=0$ gives
$$
S_e(\omega)\sim \frac{\pi A_0}{\omega},
\qquad
S_e(f)\propto \frac{1}{f}.
\tag{D.26}
$$

*Proof.* Summing the modal spectra (D.20) over the logarithmic rate density gives
$$
S_e(\omega)
=
\int_{\lambda_{\min}}^{\lambda_{\max}}
\frac{2a(\lambda)\lambda}{\omega^2+\lambda^2}\,q(\lambda)\,d\log\lambda.
$$
Since $d\log\lambda=d\lambda/\lambda$, this reduces to
$$
S_e(\omega)
=
\int_{\lambda_{\min}}^{\lambda_{\max}}
\frac{2h(\lambda)}{\omega^2+\lambda^2}\,d\lambda.
\tag{D.27}
$$
Using (D.23) and setting $\lambda=\omega u$,
$$
S_e(\omega)
=
2A_0\omega^{s-1}
\int_{\lambda_{\min}/\omega}^{\lambda_{\max}/\omega}
\frac{u^s}{1+u^2}\,du\,(1+o(1)).
$$
Under (D.22), the lower limit tends to $0$ and the upper limit tends to $\infty$. Since $-1<s<1$,
$$
\int_0^\infty \frac{u^s}{1+u^2}\,du
=
\frac{\pi}{2\cos(\pi s/2)}.
\tag{D.28}
$$
Substituting (D.28) yields (D.24), and (D.25) follows by comparison with $S_e(f)\propto f^{-\beta_{\mathrm{spec}}}$. The case $s=0$ gives (D.26). ∎

**Theorem D.8b (PCE Selection of Pink Spectra on the Scale-Neutral Marginal Branch).** Suppose a marginal relaxation band satisfies the following PCE neutrality conditions:

1. the band is inside the viable Space of Becoming, so no mode in the band is individually prohibited by Axiom 3;
2. the coarse-grained predictive benefit of retaining an active mode is independent of $\log\lambda$ across the band;
3. the resource cost of retaining an active mode is independent of $\log\lambda$ across the band after the fixed endpoints $\lambda_{\min},\lambda_{\max}$ are set by the fastest and slowest physically available update processes;
4. the only remaining operational cost of a nonuniform profile is the description cost of specifying the rate-profile shape.

Then PCE selects a locally scale-neutral active profile $h(\lambda)=h_0$ on the band. Consequently the prediction-error spectrum satisfies
$$
S_e(f)\propto \frac{1}{f}
$$
throughout the intermediate window $\lambda_{\min}\ll 2\pi f\ll\lambda_{\max}$.

*Proof.* Let $u=\log\lambda$ and let $I=[u_{\min},u_{\max}]$. Normalize the active mode-weight profile on $I$ by
$$
\rho(u)=\frac{h(e^u)}{\int_I h(e^v)\,dv}.
$$
Under assumptions 1-3, the benefit and physical resource terms in the reduced PCE potential are constant over admissible profiles with the same total active weight. The only profile-dependent term is therefore the operational description cost. The PCE-minimal description of a profile with no rate label is the uniform profile on $I$, equivalently the minimizer of the nonnegative relative-description cost
$$
V_{\mathrm{spec}}[\rho]
=
\chi\int_I \rho(u)\log\frac{\rho(u)}{|I|^{-1}}\,du,
\qquad \chi>0.
\tag{D.29}
$$
By Gibbs' inequality,
$$
V_{\mathrm{spec}}[\rho]\ge 0,
$$
with equality if and only if $\rho(u)=|I|^{-1}$ almost everywhere. Thus PCE selects the rate-unlabeled profile. In the modal representation (D.27), this is exactly the locally scale-neutral branch $h(\lambda)=h_0$ over the observed band, up to endpoint corrections. Theorem D.8a with $s=0$ then gives $S_e(f)\propto 1/f$. ∎

**Corollary D.8b.1 (Finite Pink Band and Endpoint Cutoffs).** In the exactly scale-neutral case $h(\lambda)=h_0$ on $[\lambda_{\min},\lambda_{\max}]$,
$$
S_e(\omega)
=
\frac{2h_0}{\omega}
\left[
\arctan\left(\frac{\lambda_{\max}}{\omega}\right)
-
\arctan\left(\frac{\lambda_{\min}}{\omega}\right)
\right].
\tag{D.30}
$$
Hence no PU system predicts exact $1/f$ behavior at all frequencies. Pink scaling holds only in the finite operational window
$$
\lambda_{\min}\ll \omega\ll \lambda_{\max}.
$$

*Proof.* Substitute $h(\lambda)=h_0$ into (D.27):
$$
S_e(\omega)=2h_0\int_{\lambda_{\min}}^{\lambda_{\max}}\frac{d\lambda}{\omega^2+\lambda^2}.
$$
The antiderivative is $\omega^{-1}\arctan(\lambda/\omega)$, giving (D.30). If $\lambda_{\min}\ll\omega\ll\lambda_{\max}$, the bracket tends to $\pi/2$, so $S_e(\omega)\sim \pi h_0/\omega$. Outside that interval, one of the endpoint cutoffs is resolved and exact pink scaling is lost. ∎

**Corollary D.8b.2 (Failure Modes Away from Criticality).** Departures from $1/f$ are not failures of PCE. They diagnose departures from the scale-neutral marginal branch. If the active profile satisfies $h(\lambda)\sim \lambda^s$, then the exponent shifts to $\beta_{\mathrm{spec}}=1-s$ by Theorem D.8a. If damage, overload, or loss of adaptive degrees of freedom narrows the band so that $\lambda_{\min}$ and $\lambda_{\max}$ are not widely separated, then the spectrum crosses over to a non-pink finite-band form governed by (D.30).

This identifies pink noise as the macroscopic spectral signature of PCE-regulated predictive systems operating near a marginal viability surface with no privileged update scale.

### D.8.6 PCE-Ricci Metric Flow

**Definition D.8.6a (Metric PCE Functional).** On a compact regular metric-measure branch $(M,g,e^{-f}d\mathrm{vol}_g)$ with fixed normalized measure
$$
\int_M e^{-f}d\mathrm{vol}_g=1,
$$
define the geometric PCE functional
$$
\mathcal V_{\mathrm{geom}}[g,f,\Psi]
=
\int_M
\left(
R_g+|\nabla f|_g^2+\lambda_{\mathrm{pred}}\mathcal U_{\mathrm{pred}}(g,\Psi)
\right)
e^{-f}d\mathrm{vol}_g,
\tag{D.8.6.1}
$$
where $\Psi$ denotes retained predictive matter fields and $\mathcal U_{\mathrm{pred}}$ is the local predictive energy-cost density. Define the predictive stress tensor by
$$
T^{\mathrm{pred}}_{\mu\nu}
=
-\frac{2}{\sqrt{|g|}}
\frac{\delta}{\delta g^{\mu\nu}}
\left(
\sqrt{|g|}\mathcal U_{\mathrm{pred}}
\right).
\tag{D.8.6.2}
$$

**Theorem D.8.6b (PCE-Ricci Flow on the Regular Metric Branch).** The negative $L^2(e^{-f}d\mathrm{vol}_g)$ natural-gradient flow of $\mathcal V_{\mathrm{geom}}$ with respect to the metric has the form
$$
\partial_\tau g_{\mu\nu}
=
-2\left(
\operatorname{Ric}_{\mu\nu}
+
\nabla_\mu\nabla_\nu f
-
\frac{\lambda_{\mathrm{pred}}}{2}
T^{\mathrm{pred}}_{\mu\nu}
\right)
+
\chi(\tau)g_{\mu\nu},
\tag{D.8.6.3}
$$
where $\chi(\tau)$ is the scalar normalization term enforcing the fixed weighted-volume constraint. In the gauge $f=\mathrm{const}$ and after absorbing $\chi g_{\mu\nu}$ into the volume-normalized trace sector, the leading geometric term is Ricci flow with predictive stress forcing:
$$
\partial_\tau g_{\mu\nu}
=
-2\operatorname{Ric}_{\mu\nu}
+
\lambda_{\mathrm{pred}}T^{\mathrm{pred}}_{\mu\nu}
+
\text{trace normalization}.
\tag{D.8.6.4}
$$

*Proof.* The first variation of Perelman's weighted functional
$$
\mathcal F[g,f]=\int_M(R_g+|\nabla f|^2)e^{-f}d\mathrm{vol}_g
$$
under metric variations at fixed weighted measure is
$$
\delta\mathcal F
=
-\int_M
\left(
\operatorname{Ric}_{\mu\nu}+\nabla_\mu\nabla_\nu f
\right)
\delta g^{\mu\nu}
e^{-f}d\mathrm{vol}_g
$$
up to the scalar constraint term enforcing $\int e^{-f}d\mathrm{vol}_g=1$. By Definition D.8.6a and (D.8.6.2),
$$
\delta
\int_M\mathcal U_{\mathrm{pred}}e^{-f}d\mathrm{vol}_g
=
-\frac12
\int_M
T^{\mathrm{pred}}_{\mu\nu}\delta g^{\mu\nu}
e^{-f}d\mathrm{vol}_g
$$
again up to the same scalar normalization direction. Therefore the $L^2(e^{-f}d\mathrm{vol}_g)$ gradient with respect to $g^{\mu\nu}$ is
$$
-\left(
\operatorname{Ric}_{\mu\nu}
+
\nabla_\mu\nabla_\nu f
-
\frac{\lambda_{\mathrm{pred}}}{2}T^{\mathrm{pred}}_{\mu\nu}
\right)
+
\frac12\chi g_{\mu\nu}.
$$
Taking the negative gradient flow and writing it for $g_{\mu\nu}$ gives (D.8.6.3), with the conventional factor $2$ fixed by Ricci-flow normalization. Setting $f$ constant removes the Hessian term and yields (D.8.6.4). ∎

**Corollary D.8.6c (Einstein Branch as Stationary Predictive Metric Flow).** A regular metric branch is stationary modulo diffeomorphism and weighted-volume normalization if and only if
$$
\operatorname{Ric}_{\mu\nu}
+
\nabla_\mu\nabla_\nu f
-
\frac{\lambda_{\mathrm{pred}}}{2}T^{\mathrm{pred}}_{\mu\nu}
=
\frac{\chi}{2}g_{\mu\nu}.
\tag{D.8.6.5}
$$
In the constant-$f$ macroscopic branch this is the trace-normalized Einstein-type balance between curvature and predictive stress.

*Proof.* Stationarity of (D.8.6.3) modulo normalization is exactly the vanishing of the traceless part of the parenthesized tensor, which is (D.8.6.5). For constant $f$, the Hessian term vanishes. Taking the trace fixes $\chi$, and the remaining traceless equation is the Einstein-type curvature-stress balance. ∎

**Definition D.8.6d (Finite Entropic-Ricci PCE Generator).** Let $X$ be a finite set and let $L$ be an irreducible continuous-time Markov generator
$$
Lf(x)=\sum_{y\in X}K(x,y)(f(y)-f(x))
$$
with stationary law $\pi$ and detailed balance
$$
\pi(x)K(x,y)=\pi(y)K(y,x).
\tag{D.8.6.6}
$$
Write a probability law as $\mu=\rho\pi$, where $\rho:X\to(0,\infty)$ and $\sum_x\rho(x)\pi(x)=1$. The finite PCE free cost is the relative entropy
$$
\mathcal V_{\mathrm{fin}}(\rho)
=
\sum_{x\in X}\rho(x)\log\rho(x)\,\pi(x).
\tag{D.8.6.7}
$$
Let
$$
\theta(r,s)
=
\begin{cases}
\dfrac{r-s}{\log r-\log s}, & r\ne s,\\
r, & r=s,
\end{cases}
\tag{D.8.6.8}
$$
be the logarithmic mean. The Maas-Mielke transport distance $\mathcal W_L$ is defined by
$$
\mathcal W_L(\rho_0,\rho_1)^2
=
\inf_{(\rho_t,\psi_t)}
\int_0^1
\frac12
\sum_{x,y\in X}
(\psi_t(y)-\psi_t(x))^2
\theta(\rho_t(x),\rho_t(y))
K(x,y)\pi(x)\,dt,
\tag{D.8.6.9}
$$
where the infimum is over smooth positive curves satisfying the discrete continuity equation
$$
\dot\rho_t(x)
+
\sum_{y\in X}
(\psi_t(y)-\psi_t(x))
\theta(\rho_t(x),\rho_t(y))
K(x,y)
=
0.
\tag{D.8.6.10}
$$
The generator has entropic Ricci curvature at least $\lambda$ when $\mathcal V_{\mathrm{fin}}$ is $\lambda$-geodesically convex along $\mathcal W_L$ geodesics.

**Theorem D.8.6e (Finite Entropic-Ricci PCE Stability).** For a finite detailed-balance generator of Definition D.8.6d, the Markov semigroup $P_t=e^{tL}$ is the $\mathcal W_L$-gradient flow of $\mathcal V_{\mathrm{fin}}$. Moreover, the following are equivalent on the positive probability simplex:

1. the generator has entropic Ricci curvature at least $\lambda$;

2. $P_t$ satisfies the evolution variational inequality
$$
\frac12\frac{d}{dt}
\mathcal W_L(P_t\rho,\nu)^2
+
\frac{\lambda}{2}
\mathcal W_L(P_t\rho,\nu)^2
\le
\mathcal V_{\mathrm{fin}}(\nu)
-
\mathcal V_{\mathrm{fin}}(P_t\rho)
\tag{D.8.6.11}
$$
for every positive density $\nu$;

3. the finite PCE free cost is locally $\lambda$-stable in the entropic-transport geometry.

If $\lambda>0$, then for all positive densities $\rho,\nu$,
$$
\mathcal W_L(P_t\rho,P_t\nu)
\le
e^{-\lambda t}
\mathcal W_L(\rho,\nu),
\tag{D.8.6.12}
$$
and
$$
\mathcal V_{\mathrm{fin}}(P_t\rho)
\le
e^{-2\lambda t}
\mathcal V_{\mathrm{fin}}(\rho).
\tag{D.8.6.13}
$$
Consequently
$$
\lVert P_t\rho-1\rVert_{L^1(\pi)}
\le
e^{-\lambda t}
\sqrt{2\mathcal V_{\mathrm{fin}}(\rho)}.
\tag{D.8.6.14}
$$

*Proof.* Detailed balance makes the Onsager operator associated with (D.8.6.9) symmetric and positive on the tangent space of the probability simplex. The logarithmic mean identity
$$
\theta(r,s)(\log r-\log s)=r-s
$$
turns the continuity equation into the Markov equation when the potential is $\psi=-\log\rho$: the corresponding velocity is
$$
\dot\rho(x)
=
\sum_y K(x,y)(\rho(y)-\rho(x))
=
L\rho(x).
$$
Thus $P_t=e^{tL}$ is the $\mathcal W_L$-gradient flow of $\mathcal V_{\mathrm{fin}}$.

On the interior of the finite probability simplex, $\mathcal W_L$ is a smooth Riemannian transport metric on each connected component; irreducibility gives one component. For smooth gradient flows in a finite-dimensional geodesic metric, $\lambda$-geodesic convexity of the potential is equivalent to the evolution variational inequality (D.8.6.11). This proves the equivalence of (1) and (2). Item (3) is the same statement in PCE language, because $\mathcal V_{\mathrm{fin}}$ is the finite PCE free cost and (D.8.6.11) says that its gradient flow is stable with modulus $\lambda$.

The contraction estimate (D.8.6.12) follows by applying (D.8.6.11) twice, once to $(P_t\rho,P_t\nu)$ and once to $(P_t\nu,P_t\rho)$, and adding:
$$
\frac{d}{dt}\mathcal W_L(P_t\rho,P_t\nu)^2
\le
-2\lambda\mathcal W_L(P_t\rho,P_t\nu)^2.
$$
Gronwall's inequality gives (D.8.6.12).

Let $1$ denote the equilibrium density. Since $\mathcal V_{\mathrm{fin}}(1)=0$ and $1$ is the unique minimizer, $\lambda$-convexity gives the gradient-dominance inequality
$$
|\nabla_{\mathcal W_L}\mathcal V_{\mathrm{fin}}|^2(\rho)
\ge
2\lambda\mathcal V_{\mathrm{fin}}(\rho).
\tag{D.8.6.15}
$$
Indeed, along a geodesic from $\rho$ to $1$,
$$
0
\ge
\mathcal V_{\mathrm{fin}}(\rho)
+
\langle \nabla\mathcal V_{\mathrm{fin}}(\rho),\dot\gamma(0)\rangle
+
\frac{\lambda}{2}\mathcal W_L(\rho,1)^2,
$$
so
$$
\mathcal V_{\mathrm{fin}}(\rho)
\le
|\nabla\mathcal V_{\mathrm{fin}}|(\rho)\mathcal W_L(\rho,1)
-
\frac{\lambda}{2}\mathcal W_L(\rho,1)^2
\le
\frac{|\nabla\mathcal V_{\mathrm{fin}}|^2(\rho)}{2\lambda}.
$$
Along the gradient flow,
$$
\frac{d}{dt}\mathcal V_{\mathrm{fin}}(P_t\rho)
=
-|\nabla_{\mathcal W_L}\mathcal V_{\mathrm{fin}}|^2(P_t\rho)
\le
-2\lambda\mathcal V_{\mathrm{fin}}(P_t\rho).
$$
Gronwall's inequality gives (D.8.6.13). Finally, Pinsker's inequality gives
$$
\lVert P_t\rho-1\rVert_{L^1(\pi)}^2
\le
2\mathcal V_{\mathrm{fin}}(P_t\rho),
$$
and (D.8.6.14) follows from (D.8.6.13). ∎

**Corollary D.8.6f (Finite Entropic-Ricci Limit of PCE-Ricci Flow).** Let $(X_N,L_N,\pi_N)$ be finite detailed-balance PCE generators with entropic Ricci curvature bounded below by $\lambda_N\to\lambda$. Suppose their metric-measure realizations converge to a compact regular metric-measure branch $(M,g,e^{-f}d\mathrm{vol}_g)$, their Dirichlet forms Mosco-converge to the Cheeger energy of that branch, their entropic transport actions and entropies Γ-converge to the corresponding continuum $W_2$ action and weighted entropy, and their retained predictive energy densities converge to $\mathcal U_{\mathrm{pred}}$. Then the finite PCE gradient flows converge to the metric PCE-Ricci flow (D.8.6.3), and the stationary limit is exactly the balance equation (D.8.6.5).

This is a finite Markov-chain stability statement. The metric branch appears only after the stated continuum limit, and gravity remains the thermodynamic/equation-of-state balance of Corollary D.8.6c.

*Proof.* Mosco convergence of the Dirichlet forms gives convergence of the quadratic tangent norms. Γ-convergence of the transport actions gives lower semicontinuity of metric slopes and convergence of minimizing movement schemes for the entropy-gradient flows. Γ-convergence of the entropies and of the predictive energy terms identifies the limiting PCE functional with $\mathcal V_{\mathrm{geom}}$ in Definition D.8.6a. Therefore every limit curve of finite $\mathcal W_{L_N}$-gradient flows is the natural-gradient flow of $\mathcal V_{\mathrm{geom}}$. The first-variation computation in Theorem D.8.6b identifies that limiting natural-gradient equation with (D.8.6.3). Lower semicontinuity of $\lambda_N$-convexity gives the limiting entropic stability bound with modulus $\lambda$. Setting the limiting gradient to zero gives (D.8.6.5), which is Corollary D.8.6c. ∎

### D.8.7 Thermodynamic Length Bound for Varying Effective Constants

**Definition D.8.7a (Predictive Coupling Manifold).** Let $\Lambda$ be a finite-dimensional manifold of effective constants or couplings $\lambda=(\lambda^1,\dots,\lambda^n)$ on a regular coarse-grained branch. Suppose the branch defines a locally asymptotically normal predictive family $p_\lambda$ with Fisher/PCE metric
$$
G_{ij}(\lambda)
=
\mathbb E_\lambda
\left[
\partial_i\log p_\lambda\,
\partial_j\log p_\lambda
\right],
\tag{D.8.7.1}
$$
positive definite on the retained identifiable directions. For a drift path $\lambda:[0,\tau]\to\Lambda$, define its thermodynamic length
$$
L_G(\lambda)
=
\int_0^\tau
\sqrt{
\dot\lambda^iG_{ij}(\lambda)\dot\lambda^j
}\,dt.
\tag{D.8.7.2}
$$

**Theorem D.8.7b (Thermodynamic Length Bound).** Suppose the entropy production of the drift obeys the local Onsager-PCE lower bound
$$
\Sigma[\lambda]
\ge
\int_0^\tau
\dot\lambda^iG_{ij}(\lambda)\dot\lambda^j\,dt.
\tag{D.8.7.3}
$$
Then every drift from $\lambda_0$ to $\lambda_1$ in time $\tau$ satisfies
$$
\boxed{
\Sigma[\lambda]\ge \frac{d_G(\lambda_0,\lambda_1)^2}{\tau}
}
\tag{D.8.7.4}
$$
where $d_G$ is the geodesic distance induced by $G$.

*Proof.* Let
$$
v(t)=
\sqrt{
\dot\lambda^iG_{ij}(\lambda)\dot\lambda^j
}.
$$
Then
$$
L_G(\lambda)=\int_0^\tau v(t)\,dt.
$$
By Cauchy-Schwarz,
$$
L_G(\lambda)^2
\le
\left(\int_0^\tau 1^2\,dt\right)
\left(\int_0^\tau v(t)^2\,dt\right)
=
\tau
\int_0^\tau
\dot\lambda^iG_{ij}(\lambda)\dot\lambda^j\,dt.
$$
Using (D.8.7.3),
$$
L_G(\lambda)^2\le \tau\,\Sigma[\lambda].
$$
Since $d_G(\lambda_0,\lambda_1)$ is the infimum of $L_G$ over all paths with the same endpoints,
$$
d_G(\lambda_0,\lambda_1)^2
\le
L_G(\lambda)^2
\le
\tau\,\Sigma[\lambda].
$$
Dividing by $\tau$ gives (D.8.7.4). ∎

**Corollary D.8.7c (Finite-Dissipation Bound on Varying Constants).** If a single effective constant $\lambda$ drifts on an interval where
$$
G_{\lambda\lambda}(\lambda)\ge G_{\min}>0,
$$
then
$$
|\lambda(\tau)-\lambda(0)|
\le
\sqrt{\frac{\Sigma[\lambda]\tau}{G_{\min}}}.
\tag{D.8.7.5}
$$

*Proof.* In one dimension,
$$
d_G(\lambda(0),\lambda(\tau))
\ge
\sqrt{G_{\min}}\,
|\lambda(\tau)-\lambda(0)|.
$$
Substitute this into Theorem D.8.7b and solve for the drift magnitude. ∎

**Corollary D.8.7d (Predictive Price of Cosmological Drift).** Slow variation of effective constants such as $\alpha$, $G$, masses, threshold scales, or dark-sector constitutive parameters is MPU-admissible only when the corresponding Fisher-geometric distance is paid for by entropy production. A drift with zero entropy production is confined to $d_G=0$, hence to operationally indistinguishable parameter directions.

*Proof.* Set $\Sigma[\lambda]=0$ in (D.8.7.4). Then $d_G(\lambda_0,\lambda_1)=0$. Since $G$ is positive definite on identifiable directions, the endpoints differ only along non-identifiable quotient directions. ∎

**Definition D.8.7e (Classical Predictive Record Current).** Let $X$ be the finite Blackwell-PCE record alphabet selected by Theorem M.6.11b for a steady ND-RID quotient. Let $k(x,y)$ be the continuous-time transition rate from $x$ to $y$, with stationary law $\pi$ satisfying
$$
\sum_x\pi(x)k(x,y)=\pi(y)\sum_z k(y,z).
\tag{D.8.7.6}
$$
For an antisymmetric increment $d(x,y)=-d(y,x)$, define the integrated record current
$$
J_T
=
\sum_{0<t\le T}
d(X_{t^-},X_t).
\tag{D.8.7.7}
$$
The total steady entropy production over time $T$ is
$$
\Sigma_T
=
T\sum_{x<y}
\left(\pi(x)k(x,y)-\pi(y)k(y,x)\right)
\log
\frac{\pi(x)k(x,y)}{\pi(y)k(y,x)},
\tag{D.8.7.8}
$$
with zero contribution from edges whose stationary forward and backward fluxes are both zero.

**Theorem D.8.7f (Predictive Thermodynamic Uncertainty Bound).** For every finite irreducible steady ND-RID record quotient of Definition D.8.7e with $\langle J_T\rangle\ne0$,
$$
\frac{\operatorname{Var}(J_T)}{\langle J_T\rangle^2}\,\Sigma_T
\ge
2.
\tag{D.8.7.9}
$$
Equivalently,
$$
\Sigma_T
\ge
2\,\frac{\langle J_T\rangle^2}{\operatorname{Var}(J_T)}.
\tag{D.8.7.10}
$$
Thus a stable predictive record current cannot be both highly precise and entropy-cheap. The bound applies to measurement records, update currents, anomaly-ledger currents, and memory-ledger currents after projection to the Blackwell-PCE commutative record algebra.

*Proof.* By Theorem M.6.11b, the retained record algebra is commutative and PCE-minimal. Therefore the ND-RID quotient on that record algebra is a finite continuous-time Markov jump process with rates $k(x,y)$ and stationary law $\pi$. Irreducibility gives a unique stationary law and finite current moments. The steady entropy production is exactly (D.8.7.8), the standard stochastic-thermodynamic entropy production for the stationary Markov jump process. The finite-time thermodynamic uncertainty relation for stationary continuous-time Markov jump processes gives
$$
\operatorname{Var}(J_T)\,\Sigma_T
\ge
2\langle J_T\rangle^2.
$$
Dividing by $\langle J_T\rangle^2$ proves (D.8.7.9), and rearranging proves (D.8.7.10). Since every reported PU record current is, by construction, a current on the selected commutative record quotient, the same inequality applies to the listed record-current channels. ∎

**Corollary D.8.7g (Quantum Protocols Report TUR-Bounded Classical Records).** Let a noncommutative finite protocol be read out through the Blackwell-PCE selected record channel
$$
\mathcal M:\mathfrak A\to C(X).
$$
Any operationally reported current is the classical current $J_T$ on $X$ and therefore obeys (D.8.7.9). Coherent pre-readout dynamics may change the induced rates $k(x,y)$ and the entropy production $\Sigma_T$, but it cannot license a reported classical current that violates the bound computed from its own stationary record statistics.

*Proof.* The output of $\mathcal M$ is the commutative sufficient record algebra selected by Theorem M.6.11b. Hence the reported current is a function of the classical jump record on $X$. Applying Theorem D.8.7f to that induced finite Markov quotient gives (D.8.7.9). Any coherent dynamics before $\mathcal M$ only changes the effective classical transition statistics seen by the record channel; once those statistics and their entropy production are fixed, the Markov current bound applies. ∎

### D.8.8 Tropical Predictive Action

**Definition D.8.8a (Finite Update-History Free Cost).** Let $\mathcal H$ be a finite set of admissible update histories $\gamma$, each with predictive cost $C(\gamma)\in\mathbb R$. For $\beta>0$, define
$$
Z_\beta=\sum_{\gamma\in\mathcal H}e^{-\beta C(\gamma)}
$$
and the free predictive cost
$$
F_\beta=-\frac1\beta\log Z_\beta.
\tag{D.8.8.1}
$$

**Theorem D.8.8b (Tropical Limit of Predictive Action).** For a finite update-history family,
$$
\lim_{\beta\to\infty}F_\beta
=
\min_{\gamma\in\mathcal H}C(\gamma).
\tag{D.8.8.2}
$$
More precisely, if
$$
C_{\min}=\min_{\gamma}C(\gamma),
\qquad
m=\#\{\gamma:C(\gamma)=C_{\min}\},
\qquad
N=\#\mathcal H,
$$
then
$$
C_{\min}-\frac{\log N}{\beta}
\le
F_\beta
\le
C_{\min}-\frac{\log m}{\beta}.
\tag{D.8.8.3}
$$

*Proof.* Write
$$
Z_\beta
=
e^{-\beta C_{\min}}
\sum_{\gamma\in\mathcal H}
e^{-\beta(C(\gamma)-C_{\min})}.
$$
The sum contains exactly $m$ terms equal to $1$ and at most $N$ terms bounded by $1$, hence
$$
m
\le
\sum_{\gamma\in\mathcal H}
e^{-\beta(C(\gamma)-C_{\min})}
\le
N.
$$
Taking logarithms and multiplying by $-1/\beta$ gives (D.8.8.3). Letting $\beta\to\infty$ gives (D.8.8.2). ∎

**Corollary D.8.8c (Least Action, Shortest Paths, and Minimum Cuts as One Tropical Limit).** Whenever a PU branch represents histories, paths, or cuts by finite costs $C(\gamma)$, the PCE-selected least-cost object is the tropical limit of the update-history sum. In this limit,
$$
\text{ordinary addition of weights becomes minimization,}
$$
and
$$
\text{ordinary multiplication of weights becomes addition of costs.}
$$

*Proof.* Theorem D.8.8b identifies the limiting free cost with the minimum of $C$. Products of weights satisfy
$$
e^{-\beta C_1}e^{-\beta C_2}
=
e^{-\beta(C_1+C_2)},
$$
so multiplication of weights corresponds to addition of costs. Sums of weights are dominated by the least exponent in the $\beta\to\infty$ limit, so addition of weights corresponds to minimization. ∎

## D.9 Conclusion

This appendix has provided a rigorous analysis grounded in the variational perspective of minimizing the PCE Potential $V(x)$ (Definition D.1), modeling the slow adaptation dynamics of the MPU network as a stochastic gradient flow (Equation D.8). We demonstrated through formal proofs and analysis of the potential structure and dynamics that:

1.  **Alignment (Theorem 2)** is dynamically enforced in a two-level sense. Exact alignment $C_P(v)=\langle \hat{C}_v \rangle$ is the necessary condition for true stable PCE equilibria (Section D.3, Corollary D.1). On the operational side, the observable work-cost gap $\Delta W_v$ (Lemma D.2) and the stochastic contraction estimate (Proposition D.1, Corollary D.2) drive the proxy toward that equilibrium up to a controlled ND-RID noise floor. Quantum circuit complexity emerges as the uniquely stable operational proxy choice (Remark D.1).

2.  **Geometric Regularity (Theorem 43)** emerges dynamically. Irregularity incurs fundamental costs in propagation ($V_{prop}$) and operation ($V_{op}$) while reducing predictive benefits ($V_{benefit}$), so regular configurations are precisely the global minima of the geometrical sector of the PCE landscape and hence the global minima of the full potential are geometrically regular (Section D.4, Theorem D.3).

3.  **Complexity Adaptation Convergence (Section D.8):** A rigorous analysis of the complexity adaptation dynamics (Equation D.13), driven by the Adaptation Driving Force $\Psi(C)$, establishes exponential convergence to the unique POP-optimal complexity $C^{\star}$ with explicit rate $\underline{\lambda}\,\eta_{adapt}$ (Theorem D.8). Using strong monotonicity, Polyak-Łojasiewicz control, and Ito estimates, we quantify both the deterministic convergence rate (Equation D.15) and the stochastic noise floor (Equation D.16), providing a detailed mechanism for how complexity optimization occurs within the larger PCE landscape.

4.  **Spectral Marginality and 1/f Noise (Section D.8.5):** Linearized stochastic PCE dynamics decompose into relaxation modes whose spectra are Lorentzian. When PCE operates on a marginal viability band with no privileged update scale, the active mode-weight profile is scale-neutral and the summed prediction-error spectrum becomes $S(f)\propto 1/f$ (Theorem D.8b). Deviations from exact pink scaling are controlled by the active rate-density exponent $s$ through $\beta_{\mathrm{spec}}=1-s$ (Theorem D.8a), and finite cutoffs are fixed by the slowest and fastest available update rates (Corollary D.8b.1).

Section D.6.5 establishes ergodicity of the full stochastic dynamics under Assumptions (A1)-(A6), and in the detailed-balance low-noise subcase it yields Gibbs concentration near the regular low-potential sector of $V(x)$. The analysis throughout this appendix confirms that complexity alignment, geometric regularity, and scale-neutral critical spectra are not ad-hoc assumptions but dynamically selected outcomes of the Predictive Universe framework's core optimization principles (POP/PCE) operating within the constrained MPU network under the stated hypotheses. These results provide the precise support needed for the subsequent conditional derivations of emergent spacetime, gravity, and critical adaptive dynamics.

**Remark D.9.1 (Justification for PCE Cost Minimization).** Three arguments support the principle that realized physical configurations minimize the PCE potential $V(x) = V_{\mathrm{op}}(x) + V_{\mathrm{prop}}(x) - V_{\mathrm{benefit}}(x)$ rather than maximizing it, satisfying some other functional, or occupying a random point in the admissible region. First, *thermodynamic stability*: configurations that do not minimize cost relative to perturbations are unstable under the fluctuation-dissipation dynamics of Theorem D.5. Any configuration with avoidable cost is driven toward lower cost by the same irreversible processes that Theorem 31 mandates; the PCE attractor is the fixed point from which no further cost reduction is achievable. Second, *selection pressure*: predictive systems that waste resources on avoidable costs are outcompeted by those that do not, because wasted resources reduce predictive capacity available for adaptation (Axiom 1, POP); the PCE attractor is the endpoint of this selection process, analogous to the ground state in thermodynamics. Third, *uniqueness*: for generic Morse-type potentials on the finite-dimensional configuration space constrained by Theorem E.2 and Theorem K.10.4, local minima are isolated (the set of smooth functions with non-degenerate critical points is open and dense in the $C^2$ topology); PCE therefore predicts discrete, isolated attractor configurations, consistent with the observed discreteness of physical constants and particle spectra. These arguments do not constitute a proof that PCE is the uniquely correct selection principle; they establish that PCE is the natural selection principle within the framework's operational logic and that its predictions are falsifiable: if the realized configuration demonstrably fails to minimize cost over the admissible class, PCE is refuted.