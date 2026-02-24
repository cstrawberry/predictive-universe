# Appendix D: Variational Perspective and Dynamical Convergence to Alignment & Regularity

## D.1 Introduction: Optimization Landscape and Convergence

This Appendix develops the variational perspective on the Predictive Universe (PU) framework's dynamics, providing rigorous dynamical justifications for two cornerstone results presented in the main text:
1.  **Theorem 2 (Dynamically Enforced Functional Correspondence):** Demonstrating that the operational complexity proxy $\langle \hat{C}_v \rangle$ aligns with the theoretical Predictive Physical Complexity $C_P(v)$ at viable equilibria.
2.  **Theorem 43 (Necessary Emergence of Geometric Regularity):** Showing that the long-run adaptation dynamics concentrate on configurations exhibiting geometric regularity, complementing the necessity argument in Appendix C.

We introduce the **Principle of Compression Efficiency (PCE) Potential $V(x)$**, an effective potential function derived from the framework's core principles (Axiom 1: POP, Definition 15: PCE). The system's slow adaptation dynamics, governing the evolution of the network configuration $x(t)$, are modeled as a stochastic gradient flow on the landscape defined by $V(x)$. The stochastic differential equation (SDE) governing these dynamics is:
$$
\mathrm{d}x_t \;=\; -\eta(x_t)\,\nabla V(x_t)\,\mathrm{d}t \;+\; \sqrt{2D(x_t)}\,\mathrm{d}W_t,
\quad \text{(D.0)}
$$
where the potential $V(x_t) \ge 0$ serves as a stochastic Lyapunov function. Under suitable conditions (A2, A5, detailed in Section D.6.2), the expected rate of change satisfies $\frac{\mathrm{d}}{\mathrm{d}t}\mathbb{E}[V(x_t)]\le 0$ when far from equilibrium, driving the system towards the minima of $V(x)$. The stability of this process requires that the gradient $\nabla V$ be well-defined, which in turn necessitates that the underlying cost functions are non-contextual (i.e., independent of the choice of predictive basis), a key justification for the derivation of the Born rule (Appendix G). As detailed in Appendix X, this foundational potential $V(x)$ gives rise to the 1PI effective action of quantum field theory, and the stochastic gradient flow on $V(x)$ is a specific realization of the functional renormalization group. By analyzing the structure of $V(x)$ and the properties of this process, we prove that the dynamics robustly drive the system towards configurations that simultaneously exhibit complexity alignment and geometric regularity. This establishes these properties not as assumptions, but as necessary consequences of the fundamental optimization processes governing the MPU network.

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

The potential $V(x)$ is assumed to be continuously differentiable ($C^1$) with respect to the relevant components of configuration $x$ within $\mathcal{X}_{adm}$, and bounded below. The system's adaptation dynamics aim to minimize this operational potential $V(x)$.

## D.3 Dynamic Complexity Alignment Mechanism ($C_P \leftrightarrow \langle \hat{C}_v \rangle$)

This section provides the rigorous justification for Theorem 2, demonstrating that the operational complexity proxy $\langle \hat{C}_v \rangle$ is dynamically driven into alignment with the theoretical Predictive Physical Complexity $C_P(v)$ at stable equilibrium points.

**Lemma D.1 (True PCE Optimality Requires Alignment).**
Let $V_{true}(x; \{C_P(v)\})$ denote the hypothetical "true" PCE potential, calculated identically to $V(x)$ but using the theoretical complexities $C_P(v)$ and their associated true physical costs $R(C_P(v))$, $R_I(C_P(v))$ in the operational cost term. A necessary condition for a configuration $x^*$ to be a stable minimum of $V_{true}$ under the *true* physical resource constraints is that the operational complexity proxies align with the theoretical complexities: $C_P(v) = \langle \hat{C}_v \rangle_{x^*}$ for all $v$. Persistent misalignment $\delta_v = C_P(v) - \langle \hat{C}_v \rangle \neq 0$ implies the system is operating with incorrect internal cost estimates relative to actual physical expenditure, leading to suboptimal resource allocation and thus preventing stabilization at a true PCE optimum.

*Proof.* The system's adaptation dynamics adjust variables (like $\langle \hat{C}_v \rangle$) based on gradients derived from the *operational* potential $V(x)$, which uses $R(\langle \hat{C}_v \rangle)$. However, the *actual* physical resources consumed are governed by the *true* complexities $C_P(v)$ and costs $R(C_P(v))$. If $\delta_v = C_P(v) - \langle \hat{C}_v \rangle \neq 0$, the operational cost estimate $R(\langle \hat{C}_v \rangle)$ deviates from the true cost $R(C_P(v))$. Minimizing $V(x)$ based on this potentially incorrect cost estimate will lead the system towards an operational minimum $x_{op}^*$ where the operational gradient vanishes, $\nabla_{op} V(x_{op}^*) = 0$. However, this operational minimum will generally *not* coincide with the true physical optimum $x_{true}^*$ where the gradient of the true potential $V_{true}$ vanishes, $\nabla_{true} V_{true}(x_{true}^*) = 0$. Coincidence requires the operational costs to accurately reflect the true costs, which (assuming $R$ is strictly monotonic) necessitates $\delta_v = 0$ for all $v$. A configuration can only be a stable equilibrium under the full physics governed by PCE if it minimizes the true potential $V_{true}$. Therefore, any stable equilibrium $x^*$ must satisfy the alignment condition $\delta_v = 0$. QED

*(Note on notation: In this Lemma, we used $\nabla_{op}$ and $\nabla_{true}$ to explicitly distinguish the operational system's calculation from the underlying physical optimum. In all subsequent sections of this appendix, we revert to the shorthand $\nabla V$ to denote the gradient of the operational potential $V(x)$ that drives the system dynamics according to Equation D.8.)*

**Corollary D.1 (Alignment Condition at Stable Equilibria).**
Any configuration $x^*$ that represents a stable equilibrium state (attractor) under the complete physical adaptation dynamics governed by the Principle of Compression Efficiency must satisfy the alignment condition $C_P(v) = \langle \hat{C}_v \rangle_{x^*}$ for all constituent MPUs $v$.

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

**Physical Feedback Mechanism and Efficiency Saturation:** By Definition 3a, $R(C)$ is the minimal operational power cost required to sustain complexity $C$ (at the relevant $T_{eff}$). Therefore any physical implementation with true complexity $C_P(v,t)$ satisfies $dW_{physical, v}/dt \ge R(C_P(v,t))$, with equality when the MPU operates at the efficiency-saturated limit. POP/PCE dynamics minimize the global potential $V(x)$ and thus select, at viable equilibria and in the low-noise stationary regime (Theorem D.5), configurations close to this efficiency-saturated limit; any nonnegative slack away from saturation can be absorbed into the stochastic forcing already present in (D.8) and the bounded noise term in the misalignment dynamics (Proposition D.1). Physical dissipation is operationally observable (e.g., as heat flux or entropy export), so $\Delta W_v$ is an accessible feedback signal. Lemma D.2 shows that this feedback decomposes into a leading term proportional to the misalignment $\delta_v$ plus a controlled quadratic remainder; consequently, driving $\Delta W_v$ small under POP/PCE drives the mean-square misalignment small and enforces $\delta_v\to 0$ in the low-noise equilibrium regime.

**Robustness to Noise and Deviations from Ideal Efficiency:** In a realistic physical setting, the measurement of the work-cost gap $\Delta W_v$ is noisy (e.g., thermal fluctuations, measurement imperfections), and the instantaneous dissipation rate may deviate from the efficiency-saturated limit $R(C_P)$. These effects can be modeled as an additive stochastic perturbation of the observed feedback, $\Delta W_v^{obs} = \Delta W_v + \xi_W$, with $\mathbb{E}[\xi_W]=0$ and bounded second moment over the averaging window. Since the adaptation dynamics are already modeled as a diffusion (Equation D.8), such perturbations are absorbed into the diffusion term $D(x)$ and therefore into the bounded forcing constant $C_{\mathcal M}$ appearing in Proposition D.1. The resulting rigorous conclusion is contraction of the mean-square misalignment toward a noise floor (Corollary D.2), rather than pointwise convergence in the presence of persistent stochastic forcing.

### D.3.2 Mean-Square Alignment Convergence

**Definition D.3 (Mean-Square Misalignment $\mathcal{M}$).**
The total mean-square misalignment over the network in configuration $x$ is defined as:
$$
\mathcal M(x) = \frac{1}{2} \sum_{v} \bigl(C_P(v) - \langle \hat{C}_v \rangle_{x} \bigr)^2 = k_1^{-1} V_{proxy}(x)
\quad \text{(D.4)}
$$

**Proposition D.1 (Stochastic Contraction of Misalignment).**
Consider the stochastic adaptation dynamics for the configuration $x(t)$ given by Equation (D.8) below, with potential decomposed as $V(x)=V_{core}(x)+V_{proxy}(x)$ where $V_{proxy}$ is given by (D.1a). Let $\nabla_C$ denote the gradient with respect to the proxy complexity coordinates $(\langle \hat{C}_v\rangle)_v$, and let $D_{CC}(x)$ denote the restriction of the diffusion matrix $D(x)$ to these coordinates. Under the technical assumptions (A1)-(A6) specified in Section D.6.1, the expected rate of change of the mean-square misalignment $\mathcal{M}(x(t))$ satisfies:
$$
\frac{d}{dt}\mathbb{E}[\mathcal M(x(t))] \le -2k_1\eta_{min}\,\mathbb{E}[\mathcal M(x(t))] + C_{\mathcal M}
\quad \text{(D.5)}
$$
where one may take
$$
C_{\mathcal M}
:= \frac{\eta_{max}^2}{4k_1\eta_{min}}\left(\sup_{x\in\mathcal K}\|\nabla_C V_{core}(x)\|^2\right) + \sup_{x\in\mathcal K}\operatorname{Tr}(D_{CC}(x)),
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
Combining with $\|\nabla_C V_{proxy}\|^2=2k_1^2\mathcal M$ yields a net drift term at most $-2k_1\eta_{min}\mathcal M + \frac{\eta_{max}^2}{4k_1\eta_{min}}\|\nabla_C V_{core}\|^2$. Finally, since $\nabla^2 V_{proxy}$ is constant on the proxy-complexity block, $\operatorname{Tr}(D\nabla^2 V_{proxy})=\operatorname{Tr}(D_{CC})$, which is bounded on $\mathcal K$ by (A3)-(A5). Taking expectations and using the definition of $C_{\mathcal M}$ gives (D.5). QED

**Corollary D.2 (Convergence to Alignment Noise Floor).**
Under the dynamics (Equation D.8) and assumptions (A1)-(A6), Gronwall's inequality applied to (D.5) gives:
$$
\mathbb E[\mathcal M(x(t))] \le e^{-2k_1\eta_{min}t}\mathbb E[\mathcal M(x(0))] + \frac{C_{\mathcal M}}{2k_1\eta_{min}}\bigl(1-e^{-2k_1\eta_{min}t}\bigr),
$$
and therefore the long-time expectation of the mean-square misalignment is bounded by the noise floor:
$$
\limsup_{t\to\infty} \mathbb E[\mathcal M(x(t))] \le \frac{C_{\mathcal M}}{2k_1\eta_{min}}
\quad \text{(D.6)}
$$
If the effective noise driving misalignment (captured in $C_{\mathcal M}$) is sufficiently small relative to $k_1\eta_{min}$, then $\mathbb E[\mathcal M(x(t))]$ becomes small, implying $C_P(v)\approx\langle\hat C_v\rangle$ in mean-square. More generally, under the ergodic stationary regime of the stochastic dynamics (Theorem D.5), the long-run time-average of $\langle \hat{C}_v \rangle_{x(t)}$ converges to its expectation under the invariant measure, providing the formal justification for Theorem 2.

*Proof.* The bound is the explicit solution of the scalar differential inequality (D.5). QED

**Remark D.1: Uniqueness and Optimality of Circuit Complexity Proxy.**
The operational proxy $\hat{C}_v$ was identified with quantum circuit complexity (Definition B.1). Could another proxy $\hat{C}'_v = f(\hat{C}_v)$ (with $f$ non-affine) be used consistently? If such a proxy were used, the operational cost estimate $R(\hat{C}'_v)$ would generally differ from the true physical cost $R(C_P(v))$ even when $\langle \hat{C}_v \rangle = C_P(v)$. This persistent mismatch would induce a non-zero work-cost gap $\Delta W_v$ via Equation (D.3) (using the chain rule for $R(f(C_v))$). The physical feedback mechanism, acting to minimize $\Delta W_v$, would generate a gradient term effectively penalizing the use of $\hat{C}'_v$. The dynamics governed by minimizing the true physical dissipation (including the work-cost gap penalty) uniquely favor the proxy $\hat{C}_v$ (or an affine transformation thereof) for which the operational cost function $R(\langle \hat{C}_v \rangle)$ most accurately reflects the true physical cost $R(C_P(v))$ near equilibrium. This minimizes the residual work-cost gap, satisfying the PCE imperative for maximum efficiency. Thus, quantum circuit complexity (or equivalent measures) emerges as the dynamically selected, optimal operational proxy.

## D.4 Dynamical Emergence of Geometric Regularity

This section provides the dynamical justification for Theorem 43, showing that minimizing the PCE Potential $V(x)$ inherently drives the system towards geometrically regular configurations.

**Lemma D.3 (Quantitative Cost of Irregularity).**
Geometric irregularities in the MPU network increase the core components of the PCE potential, making irregular configurations non-viable. Specifically, based on the analysis in Appendix C:

1. **Propagation Cost Penalty:** Anomalous dimension (i.e., $d_{N,max}(L)$ growing superlinearly with the physical length scale $L$, Theorem C.1(b)) increases the number of ND-RID hops required for predictive coherence across scale $L$. Since each hop incurs irreducible entropy production $\varepsilon\ge \ln 2$ (Theorem 31) and fidelity contraction $f_{RID}<1$ (Lemma E.1), the required redundancy and routing overhead increase, raising $V_{prop}$. More generally, for any coherence cut $S$ separating two subregions, define a bottleneck severity
$$
b(S):=\max\bigl(0,\ I_{req}(S)-C_{cut}(S)\bigr),
\qquad
C_{cut}(S):=\sum_{e\in S} C_{max}(f_{RID,e}),
$$
where $I_{req}(S)$ is the information rate required to maintain predictive coherence across $S$ and $C_{max}$ is the per-edge capacity bound (Theorem E.2). Since $V_{prop}$ is monotone increasing in bottleneck severity, geometry-induced bottlenecks (large $\gamma$ or poor local expansion) increase $V_{prop}$.

2. **Operational Cost Penalty:** Large curvature fluctuations (variance $\sigma_\kappa^2$ in the discrete Ollivier-Ricci scalar field) induce variance in the required local complexity $C_v$ by Theorem C.3, i.e. $\text{Var}(C_v)\gtrsim a\,\sigma_\kappa^2$. By the convexity of $f(C)$ ensured by the **Dominance of Stabilizing Costs (DSC)** condition (Theorem 22; Theorem C.4(i)), this increases the total operational cost $V_{op}=\sum_v f(C_v)$ with a quantitative lower bound
$$
V_{op}[x_{irreg}]-V_{op}[x_{reg}]\ \ge\ \frac{N}{2}f''_{min}\,\text{Var}(C_v),
$$
as in Equation (C.15).

3. **Benefit Reduction:** Irregular geometries reduce global predictive coherence and local stability (Theorem C.2 and Theorem C.4), reducing $V_{benefit}$.

Combining these effects yields a quantitative penalty:
$$
V_{core}[x_{irreg}] - V_{core}[x_{reg}] \ge aL^{\gamma} + bL - c,
\tag{D.7}
$$
where $a,b>0$ and $\gamma>1$, so for sufficiently large $L$ the irregular configuration is strictly dominated in PCE potential.

*Proof.* Follows directly from parts (1)-(3) above, combined with the scaling bounds in Appendix C. QED

**Theorem D.2 (Implicit Geometric Penalty in $V(x)$).**
The structure of the core PCE potential $V_{core} = V_{op} + V_{prop} - V_{benefit}$ inherently penalizes geometric irregularity. Minimizing $V_{core}$ (and thus the full potential $V = V_{core} + V_{proxy}$) dynamically favors geometrically regular configurations. The effective operational potential $V(x)$ therefore behaves *as if* it includes an implicit penalty term $V_{geom}(x) = f_{geom}(\gamma(x)-1, \sigma_\kappa^2(x))$ that increases with irregularity.

*Proof.* Lemma D.3 establishes that $V_{core}(x)$ is strictly higher for irregular configurations than for comparable regular ones. Therefore, the negative gradient $-\nabla V_{core}$ points, on average, away from irregular states towards states with lower irregularity (lower $\gamma$, lower $\sigma_\kappa^2$). The deterministic part of the adaptation dynamics (Equation D.8), driven by $-\nabla V$, thus contains a component derived from $-\nabla V_{core}$ that actively pushes the system towards regularity. Minimizing the full potential $V(x) = V_{core}(x) + V_{proxy}(x)$ requires minimizing both non-negative terms (near equilibrium). This necessitates minimizing $V_{core}(x)$, which in turn drives the system towards geometric regularity. The system behaves as if minimizing $V_{core}(x)$ which contains the effective penalty $f_{geom}$ against irregularity. QED

**Lemma D.4 (Regular Configurations as Global Minima Candidate Set for $V_{core}$).**
The set of configurations $\mathcal{X}_{reg} \subset \mathcal{X}_{adm}$ that satisfy geometric regularity (Definition C.3, i.e., $\gamma=1$ and $\sigma_\kappa^2$ minimal/zero) contains the global minima of the core potential $V_{core}(x)$.

*Proof.* Follows directly from Lemma D.3 (Equation D.7), which shows that any irregular configuration has a strictly higher $V_{core}$ value than a comparable regular configuration. Thus, the minima must lie within the set of regular configurations. QED

**Theorem D.3 (Aligned, Regular Configurations are Global Minima of $V(x)$).**
The global minima of the full PCE potential $V(x) = V_{core}(x) + V_{proxy}(x)$ occur only at configurations $x^* \in \mathcal{X}_{adm}$ that are simultaneously geometrically regular (satisfying Definition C.3) and exhibit complexity alignment ($C_P(v) = \langle \hat{C}_v \rangle_{x^*}$ for all $v$). Let $\mathcal{E}_{*}^{\text{global}}$ denote the set of such global minima.

*Proof.* Let $x^*$ be a global minimum of $V(x)$. Since $V(x) = V_{core}(x) + V_{proxy}(x)$, where $V_{proxy}(x) \ge 0$ (Equation D.4) and $V_{core}(x)$ is minimized only for regular configurations (Lemma D.4), the global minimum of their sum $V(x)$ must occur where both terms achieve their minimum possible values simultaneously. This requires:
1.  $V_{proxy}(x^*) = 0$. From Definition D.3, this implies $\frac{1}{2} \sum_{v} (C_P(v) - \langle \hat{C}_v \rangle_{x^*})^2 = 0$, which necessitates $C_P(v) = \langle \hat{C}_v \rangle_{x^*}$ for all $v$ (complexity alignment).
2.  $V_{core}(x^*)$ must be minimized. By Lemma D.4, this requires $x^*$ to be geometrically regular.
Thus, any global minimum $x^*$ must be both aligned and regular. QED

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

We use stochastic Lyapunov methods, common in the analysis of stochastic approximation and optimization algorithms, to prove convergence of the dynamics (Equation D.8) to the set of aligned, regular global minima $\mathcal{E}_{*}^{\text{global}}$.

### D.6.1 Assumptions for Convergence

We make standard technical assumptions required for the convergence theorems, justifying them from the physical principles of the PU framework.
*   **(A1) Potential Properties:** $V(x)$ is twice continuously differentiable ($C^2$), bounded below on the admissible state space $\mathcal{X}_{adm}$. We assume $V(x)$ is coercive, meaning $V(x) \to \infty$ as $x$ approaches the boundary of $\mathcal{X}_{adm}$ or as some norm $|x| \to \infty$. *Physical Justification:* The $C^2$ smoothness is required for the Lyapunov analysis involving the Hessian (Lemma D.5). Coercivity is physically plausible because the resource cost terms ($V_{op}, V_{prop}$) are expected to grow super-linearly with complexity and network size (e.g., $R(C) \propto C^{\gamma_p}$ with $\gamma_p > 1$), while the benefit term ($V_{benefit}$) saturates (due to $PP < \beta$). This ensures the potential grows at the extremes of the configuration space, confining the dynamics.
*   **(A2) Mobility Bounds:** The mobility matrix $\eta(x)$ is symmetric positive definite, bounded, and Lipschitz on $\mathcal{X}_{adm}$: there exist constants $0<\eta_{\min}\le \eta_{\max}<\infty$ such that for all $x\in\mathcal{X}_{adm}$ and all vectors $v$,
$\eta_{\min}\|v\|^2 \le v^T\eta(x)v \le \eta_{\max}\|v\|^2$, and $\|\eta(x)-\eta(y)\|\le L_\eta\|x-y\|$ for all $x,y$. *Physical Justification:* In PU, $\eta$ encodes local equilibration/update rates of ND-RID channels and local routing policies. These are bounded by finite cycle times and finite per-step dissipation (each irreversible ND-RID update has $\varepsilon\ge\ln 2$, Theorem 31), and Lipschitz dependence expresses local response of rates to small changes in configuration, consistent with near-equilibrium linear response [Onsager 1931].
*   **(A3) Diffusion Matrix Bounds:** The diffusion matrix $D(x)$ is bounded and uniformly elliptic. Specifically, there exist constants $0<d_{\min}\le d_{\max}<\infty$ such that for all $x$ and all vectors $v$, $d_{\min}\|v\|^2 \le v^T D(x) v \le d_{\max}\|v\|^2$. *Physical Justification:* In PU, diffusion models aggregate microscopic stochasticity of ND-RID routing and environmental forcing. Uniform bounds correspond to finite-temperature noise with bounded per-step fluctuations set by finite update rates and capacity constraints (e.g., bounded degree $\Delta_{max}$ and minimal cycle time $\tau_{min}$), preventing arbitrarily large instantaneous kicks while ensuring ergodic exploration of admissible configurations.
*   **(A4) Gradient Smoothness:** $\nabla V(x)$ is Lipschitz continuous on compact subsets of $\mathcal{X}_{adm}$. This prevents pathologically fast changes in the drift.
*   **(A5) Confinement:** Assumptions (A1) and the nature of the dynamics ensure that for any initial condition $x(0)$, the trajectory $x(t)$ remains within a compact subset $\mathcal{K} \subset \mathcal{X}_{adm}$ for all $t \ge t_0 > 0$.
*   **(A6) Noise Irreducibility:** The stochastic forcing is irreducible on $\mathcal{X}_{adm}$: for any nonempty open set $U\subset\mathcal{X}_{adm}$ and any $t>0$, the transition probability satisfies $\mathbb{P}_x(X_t\in U)>0$. A sufficient condition is uniform non-degeneracy of the diffusion (already implied by (A3)): there exists $d_*>0$ such that for all $x\in\mathcal{X}_{adm}$ and all vectors $v$, $v^T D(x)v\ge d_*\|v\|^2$. *Physical Justification:* PU includes irreducible environmental/measurement noise and ND-RID stochasticity; without such forcing, some degrees of freedom could become trapped on invariant submanifolds, breaking ergodicity and preventing concentration of the invariant measure on global PCE equilibria (Theorem D.5).

### D.6.2 Lyapunov Analysis

**Lemma D.5 (Stochastic Lyapunov Property of $V(x)$).**
Under assumptions (A1)-(A5), the PCE Potential $V(x)$ serves as a stochastic Lyapunov function for the dynamics (Equation D.8). Applying Ito's formula to $V(x(t))$ yields the expected instantaneous rate of change (the infinitesimal generator $\mathcal{L}V$ applied to $V$):
$$
\mathcal{L}V(x) = \lim_{\Delta t \to 0} \frac{\mathbb{E}[V(x(t+\Delta t)) - V(x(t)) | x(t)=x]}{\Delta t}
$$
$$
\mathcal{L}V(x) = \nabla V(x)^T (-\eta(x) \nabla V(x)) + \frac{1}{2} \text{Tr}\left( ( \sqrt{2D(x)} )^T (\nabla^2 V(x)) (\sqrt{2D(x)}) \right)
$$
$$
\mathcal{L}V(x) = -\nabla V(x)^T \eta(x) \nabla V(x) + \text{Tr}(D(x) \nabla^2 V(x))
\quad \text{(D.9)}
$$
Using the bounds on $\eta(x)$ (A2) and $D(x)$ (A3), and noting that the Hessian $\nabla^2 V(x)$ is bounded on the compact set $\mathcal{K}$ (which follows from $V$ being $C^2$ as per Assumption A1), we get:
$$
\mathcal{L}V(x) \le -\eta_{min} \|\nabla V(x)\|^2 + \text{Tr}(D(x) \nabla^2 V(x))
\le -\eta_{min} \|\nabla V(x)\|^2 + C_{noise}
\quad \text{(D.10)}
$$
where $C_{noise} = \sup_{x \in \mathcal{K}} |\text{Tr}(D(x) \nabla^2 V(x))|$ is a positive constant related to $D_{max}$ and the bounds on the Hessian eigenvalues on the compact set $\mathcal{K}$. This inequality shows that whenever the gradient $\|\nabla V(x)\|$ is sufficiently large (specifically, when $\|\nabla V(x)\|^2 > C_{noise}/\eta_{min}$), the negative drift term dominates, $\mathcal{L}V(x) < 0$, and the potential $V(x)$ decreases on average.

### D.6.3 Characterization of the Critical Set $\mathcal{E}_{*}$

**Definition D.4 (Critical Set $\mathcal{E}_{*}$).**
The critical set $\mathcal{E}_{*}$ consists of all configurations $x^* \in \mathcal{X}_{adm}$ where the deterministic drift term vanishes:
$$
\mathcal{E}_{*} = \{x^* \in \mathcal{X}_{adm} \mid \nabla V(x^*) = 0\}
\quad \text{(D.11)}
$$
This set includes all local minima, maxima, and saddle points of the potential $V(x)$.

**Theorem D.4 (Properties of Critical Points).**
Any configuration $x^*$ that is a local minimizer of $V(x)$ (and in particular any $x^*\in\mathcal E_{*}^{\text{global}}$) must simultaneously satisfy:
(i) **Complexity Alignment:** $C_P(v) = \langle \hat{C}_v \rangle_{x^*}$ for all $v$.
(ii) **Geometric Regularity:** The network structure $\mathcal{N}^*$ corresponding to $x^*$ exhibits geometric regularity (Definition C.3).

*Proof.*
**(i) Alignment:** At a local minimizer, $\nabla V(x^*)=0$. By Theorem D.1, the effective potential contains the misalignment penalty $V_{proxy}$, whose gradient with respect to the proxy-complexity coordinate $\langle\hat C_u\rangle$ is $\nabla_{\langle C_u\rangle} V_{proxy} = k_1(\langle\hat C_u\rangle-C_P(u))$. Since $k_1>0$, vanishing of the $\langle\hat C_u\rangle$-component of the full gradient forces $\langle\hat C_u\rangle_{x^*}=C_P(u)$ for every $u$.
**(ii) Regularity:** Decompose the configuration variables as $x=(x_{geom},x_{other},\langle\hat C\rangle)$, where $x_{geom}$ are the geometric/network-structure variables. By (i), at $x^*$ we have $V_{proxy}(x^*)=0$ and $\nabla_{\langle\hat C\rangle}V_{proxy}(x^*)=0$. Suppose for contradiction that the induced network $\mathcal N^*$ is geometrically irregular. Theorem D.2 (via Lemma D.3) asserts that geometric irregularity strictly increases the core potential $V_{core}$, in the sense that there exists a geometric perturbation $\tilde x=(\tilde x_{geom},x_{other}^*,\langle\hat C\rangle^*)$ arbitrarily close to $x^*$ for which $V_{core}(\tilde x)<V_{core}(x^*)$. Along such a perturbation the proxy-complexity coordinates are unchanged, so $V_{proxy}(\tilde x)=V_{proxy}(x^*)=0$. Hence $V(\tilde x)=V_{core}(\tilde x)+V_{proxy}(\tilde x)<V_{core}(x^*)+V_{proxy}(x^*)=V(x^*)$, contradicting that $x^*$ is a local minimizer. Therefore $\mathcal N^*$ must be geometrically regular. QED

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

**Theorem D.5 (Ergodic Long-Run Behavior and Low-Noise Bias Toward PCE-Optimal Equilibria).**
Under Assumptions (A1)–(A6), the stochastic dynamics (D.8) define a strong Markov diffusion on the compact set $\mathcal{K}$ (A5). For strictly non-vanishing noise ($d_{\min}>0$ in (A3)), the process does **not** converge almost surely to a single equilibrium point; instead it admits a unique invariant probability measure $\pi$ and is ergodic. In particular, for any bounded measurable observable $f$,
$$
\frac{1}{T}\int_0^T f(x(t))\,dt \xrightarrow[T\to\infty]{a.s.} \int_{\mathcal{K}} f(x)\,\pi(dx). \qquad \text{(D.12)}
$$

To relate this stationary regime to PCE-optimal equilibria, consider a "temperature-scaled" family of dynamics obtained by scaling the diffusion as $D_\theta(x):=\theta\,D(x)$ for $\theta>0$ (so the noise strength decreases as $\theta\downarrow 0$). Let $\pi_\theta$ denote the invariant measure of the corresponding diffusion. Then, in regimes where detailed balance holds (e.g., constant-coefficient Langevin with $D_\theta=\theta\,\eta$ and symmetric constant $\eta$), $\pi_\theta$ has the Gibbs form
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

Finally, by Theorem D.3, every configuration in $\mathcal{E}_{*}^{\text{global}}$ is both geometrically regular and complexity-aligned.

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

**Theorem D.6 (Gamma-limit of discrete predictive action).**
Let $\{(\mathcal G_h,\mu_h)\}_{h\downarrow0}$ be a family of weighted graphs (or triangulations) with mesh $h\to0$, equipped with a discrete curvature proxy and an MPU (matter) term. Let $\mathcal F_h=\mathcal F_h^{EH}+\mathcal F_h^{MPU}$ denote the corresponding discrete predictive action. Suppose:

(i) **Equicoercivity:** For every $M<\infty$, the sublevel sets $\{\,g\mid \mathcal F_h[g]\le M\,\}$ are precompact in the pointed Gromov-Hausdorff topology of Section 11 (after the standard PU rescaling).

(ii) **Locality & consistency:** Along any convergent sequence $(\mathcal G_h,\mu_h)\to(M,g)$ in that topology, the discrete curvature term converges to the Einstein-Hilbert term with scalar curvature $R_g$ (e.g., via Regge convergence or via the Ollivier-to-continuum estimator of Remark C.3.3a), and the MPU term converges in $L^1_{\mathrm{loc}}$ to $\int_M \mathcal L_{MPU}(g,\phi)\sqrt{-g}\,d^4x$.

(iii) **Area-law scaling:** The horizon normalization is fixed by the thermodynamic area law (Appendix E), yielding the emergent $G$ below.

Then $\mathcal F_h \ \xrightarrow{\Gamma} \ \mathcal F$ in $L^1_{\mathrm{loc}}$, where

$$
\mathcal F[g,\phi]=\frac{c^3}{16\pi G}\int_M R_g\,\sqrt{-g}\,d^4x \ +\ \int_M \mathcal L_{MPU}(g,\phi)\,\sqrt{-g}\,d^4x,
$$

and minimizers/critical points of $\mathcal F_h$ converge (up to subsequences) to critical points of $\mathcal F$ (the Einstein-Hilbert plus MPU action). The convergence of the discrete metric spaces is understood in the pointed Gromov-Hausdorff sense (Section 11).

**Remark D.6.1 (PU motivation for hypotheses).**
(i) Appendix C shows that configurations with anomalous volume growth (Definition C.1) or without a uniform positive discrete Ricci lower bound (Definition C.2-C.3) violate at least one of R1-R3 at sufficiently large scale (Theorem C.5). The support of the low-noise stationary measure (Theorem D.5) is therefore confined to bounded-geometry families, motivating the equicoercivity hypothesis needed for $\Gamma$-convergence [Gromov 1999].
(ii) Remark C.3.3a supplies an explicit local scalar curvature estimator built from Ollivier-Ricci curvature at mesh scale $h$, providing a concrete realization of the locality/consistency requirement for the Einstein-Hilbert term.
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

This appendix thus provides the rigorous foundation for the dynamical aspects of the Predictive Universe framework.

**Theorem 2 (Dynamically Enforced Functional Correspondence - Justified):**
The slow adaptation dynamics of the MPU network, modeled as a stochastic gradient flow minimizing the PCE Potential $V(x)$ (Equation D.8), concentrate in their long-run stationary regime on the set of global minima $\mathcal{E}_{*}^{\text{global}}$ (Theorem D.5). By Theorem D.4, any configuration $x^* \in \mathcal{E}_{*}^{\text{global}}$ necessarily satisfies the complexity alignment condition $C_P(v) = \langle\hat C_v\rangle_{x^*}$ for all $v$. This alignment is enforced physically via the observable work-cost gap feedback mechanism (Lemma D.2), which implements the necessary alignment gradient term implicitly within the operational dynamics minimizing $V(x)$ (Theorem D.1, Corollary D.2).

*Proof Reference:* Theorem D.5 establishes ergodicity and low-noise concentration on the global minima. Theorem D.4 proves that global minima must be aligned. Theorem D.1 and Lemma D.2 establish the mechanism driving alignment within the operational potential framework.

**Theorem 43 (Dynamical Emergence of Geometric Regularity - Justified):**
The slow adaptation dynamics of the MPU network (Equation D.8), driven by minimizing the PCE Potential $V(x)$ which inherently penalizes irregularity (Theorem D.2, Lemma D.3), concentrate in their long-run stationary regime on the set of global minima $\mathcal{E}_{*}^{\text{global}}$ (Theorem D.5). By Theorem D.4, any configuration $x^* \in \mathcal{E}_{*}^{\text{global}}$ necessarily exhibits large-scale geometric regularity (Definition C.3).

*Proof Reference:* Theorem D.5 establishes concentration on the global minima. Theorem D.4 proves that global minima must be geometrically regular. Theorem D.2 and Lemma D.3 establish how the PCE potential inherently penalizes irregularity, driving the system towards regular configurations.


**D.8 Rigorous Convergence Analysis for Complexity Adaptation**

The complexity adaptation dynamics (Section 6.4) are driven by the Adaptation Driving Force $\Psi(C)$ (Definition 20), which acts as a gradient flow on an effective complexity potential $V_{eff}(C)$ derived from the full PCE potential $V(x)$. We provide a rigorous convergence proof with quantitative rates using standard optimization theory.

### D.8.1 Effective Complexity Potential and Equilibrium

**Definition D.5 (Effective Complexity Potential).** 
The effective potential $V_{eff}(C)$ is obtained by marginalizing the full PCE potential $V(x)$ (Definition D.1) over all other degrees of freedom at their quasi-equilibrium values conditioned on complexity $C$. The deterministic complexity dynamics are:

$$
\dot{C}(t) = \eta_{adapt} \Psi(C(t)), \quad \Psi(C) = -\frac{\partial V_{eff}(C)}{\partial C}
\tag{D.13}
$$

where from Equation (24):
$$
\Psi(C) = \Gamma_0 \frac{\partial PP}{\partial C}(C) - \lambda R'(C) - R_I'(C)
$$

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

with rate constant $\underline{\lambda} = -\Psi'(C^\star) > 0$ guaranteed by DSC (Theorem 22).

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
+ \frac{D_{CC}^{max}L_{eff}}{2\underline{\lambda}\eta_{adapt}}
\tag{D.16}
$$

*Proof.* 

**Part I:** Under the PL inequality (D.14), standard gradient flow analysis [Polyak 1963; Karimi et al. 2016]
yields:

$$
\frac{d}{dt}\big(V_{eff}(C(t)) - V_{eff}(C^\star)\big) = \nabla V_{eff} \cdot \dot{C} = -\eta_{adapt}|\nabla V_{eff}|^2 \le -2\mu_{PL}\big(V_{eff}(C) - V_{eff}(C^\star)\big)
$$

Integrating gives:
$$
V_{eff}(C(t)) - V_{eff}(C^\star) \le e^{-2\mu_{PL} t}\big(V_{eff}(C(0)) - V_{eff}(C^\star)\big)
$$

Using strong convexity near the minimum, we have:
$$
V_{eff}(C) - V_{eff}(C^\star) \ge \frac{\underline{\lambda}\,\eta_{adapt}}{2}(C - C^\star)^2
$$

Combining these bounds yields (D.15).

**Part II:** The stochastic gradient descent analysis [Bottou et al. 2018] shows that under PL conditions, the expected suboptimality satisfies:

$$
\mathbb{E}[V_t - V^\star] \le (1 - \eta\mu_{PL})^t(V_0 - V^\star) + \frac{\eta\sigma^2}{2\mu_{PL}}
$$

Substituting our identifications yields (D.16). The noise floor $D_{CC}^{max}L_{eff}/(2\underline{\lambda}\eta_{adapt})$ represents the fundamental limit imposed by ND-RID stochasticity and cannot be eliminated by longer integration time. QED

### D.8.4 Physical Interpretation

**Rapid Equilibration:** The rate constant $\underline{\lambda} = -\Psi'(C^\star)$ is the "stiffness" of the complexity potential well at optimum. DSC (Theorem 22) ensures this is strictly positive and typically $\mathcal{O}(1)$ in natural units, yielding convergence timescales $\tau_{conv} \sim 1/(\underline{\lambda}\,\eta_{adapt})$ that are rapid compared to environmental evolution timescales.

**Noise Floor:** The residual fluctuations $\sigma_{eff}$ arise from the underlying ND-RID irreversibility ($\varepsilon \ge \ln 2$, Theorem 31). The noise floor is typically small:

$$
\frac{\sigma_{eff}^2}{\underline{\lambda}\,\eta_{adapt}} \ll C^\star
$$

ensuring tight convergence to the optimal complexity.

**Connection to Global Dynamics:** This local analysis complements the global ergodicity result (Theorem D.5) by providing explicit rates. The global theorem ensures the stationary measure concentrates near $C^\star$; this theorem quantifies how quickly the system equilibrates within that neighborhood.

The complexity adaptation is provably convergent with exponential rate $\underline{\lambda}\,\eta_{adapt}$ to a unique optimum $C^\star$, which then remains in sustained alignment (up to the stationary fluctuation level implied by the ND-RID noise floor) with the true physical cost $C_P$ (Theorem 2). The residual variance is suppressed by the ND-RID noise floor, ensuring high-fidelity tracking of optimal complexity.

## D.9 Conclusion

This appendix has provided a rigorous analysis grounded in the variational perspective of minimizing the PCE Potential $V(x)$ (Definition D.1), modeling the slow adaptation dynamics of the MPU network as a stochastic gradient flow (Equation D.8). We demonstrated through formal proofs and analysis of the potential structure and dynamics that:

1.  **Alignment (Theorem 2)** is dynamically enforced. The operational complexity proxy $\langle \hat{C}_v \rangle$ necessarily aligns with the theoretical Predictive Physical Complexity $C_P(v)$ at stable equilibria (Section D.3, Corollary D.2). This alignment is driven by minimizing $V(x)$, which implicitly penalizes misalignment via a term $V_{proxy}$ (Theorem D.1), with the crucial physical feedback provided by the observable work-cost gap $\Delta W_v$ (Lemma D.2). Quantum circuit complexity emerges as the uniquely stable operational proxy choice (Remark D.1).

2.  **Geometric Regularity (Theorem 43)** emerges dynamically. The MPU network dynamics concentrate in the long run on configurations exhibiting geometric regularity (Section D.4, Theorem D.4). This occurs because irregularity incurs fundamental costs in propagation ($V_{prop}$) and operation ($V_{op}$) while reducing predictive benefits ($V_{benefit}$), effectively making regular configurations the global minima of the core PCE potential $V_{core}(x)$ (Lemma D.3, Theorem D.2).

3.  **Complexity Adaptation Convergence (Section D.8):** A rigorous analysis of the complexity adaptation dynamics (Equation D.13), driven by the Adaptation Driving Force $\Psi(C)$, establishes its exponential convergence to the unique POP-optimal complexity $C^{\star}$ with explicit rate $\underline{\lambda}\,\eta_{adapt}$ (Theorem D.8). Using Polyak-Łojasiewicz conditions and stochastic gradient descent theory, we quantify both the deterministic convergence rate (Equation D.15) and the noise floor arising from ND-RID fluctuations (Equation D.16), providing a detailed mechanism for how complexity optimization occurs within the larger PCE landscape.

The long-run concentration of the full system configuration $x(t)$ on states that are simultaneously aligned and regular is established in Section D.6.5 (via Theorem D.5), relying on elliptic diffusion ergodicity and low-noise Gibbs concentration applied to $V(x)$ under standard technical assumptions (A1-A6). The analysis throughout this appendix confirms that complexity alignment and geometric regularity are not ad-hoc assumptions but necessary, stable outcomes of the Predictive Universe framework's core optimization principles (POP/PCE) operating within the constrained MPU network. These results provide crucial support for the subsequent derivations of emergent spacetime and gravity.