# Appendix D: Variational Perspective and Dynamical Convergence to Alignment & Regularity

## D.1 Introduction: Optimization Landscape and Convergence

This Appendix develops the variational perspective on the Predictive Universe (PU) framework's dynamics, providing rigorous dynamical justifications for two cornerstone results presented in the main text:
1.  **Dynamical justification of Theorem 2 (Dynamically Enforced Functional Correspondence):** Isolating the exact equilibrium condition $C_P(v)=\langle \hat{C}_v \rangle$ for true stable PCE equilibria, together with the quantitative operational tracking bound that drives the proxy toward that condition.
2.  **Conditional dynamical justification of Theorem 43 (Geometric Regularity on the Strict-Comparison Branch):** Showing that geometric regularity characterizes the lowest-potential sector only when the declared monotonicity and regular-comparator hypotheses hold, and is selected by the low-noise detailed-balance stationary regime only under the additional stochastic hypotheses.

We introduce the **Principle of Compression Efficiency (PCE) Potential $V(x)$**, a branch-defined effective potential whose admissible terms, weights, and physical identification must be independently specified or derived. Axiom 1 (POP) and Definition 15 (PCE) provide the optimization grammar; they do not uniquely determine the physical function $V$. The system's slow adaptation dynamics, governing the evolution of the network configuration $x(t)$, are modeled as a stochastic gradient flow on the landscape defined by $V(x)$. The stochastic differential equation (SDE) governing these dynamics is:
$$
\mathrm{d}x_t \;=\; -\eta(x_t)\,\nabla V(x_t)\,\mathrm{d}t \;+\; \sqrt{2D(x_t)}\,\mathrm{d}W_t,
\quad \text{(D.0)}
$$
where the potential $V(x_t)$ serves as a stochastic Lyapunov function (after an irrelevant additive normalization one may take $V\ge 0$). Under suitable conditions (detailed in Section D.6.2), the expected rate of change satisfies $\frac{\mathrm{d}}{\mathrm{d}t}\mathbb{E}[V(x_t)]\le 0$ when far from equilibrium, driving the system towards lower-potential regions. The stability of this process requires that the gradient $\nabla V$ be well-defined, which in turn requires the declared regularity and response-coordinate hypotheses. As detailed in Appendix X, additional branch hypotheses connect this potential to a 1PI effective action and a functional-renormalization-group representation. By analyzing the structure of $V(x)$ and the properties of this process, we prove three complementary conditional results: exact alignment at true stable PCE equilibria on the faithful-force-identifiability branch, quantitative proxy tracking with an explicit noise floor under the operational stochastic hypotheses, and geometric regularity of the lowest-potential sector on the strict-comparison branch. These are implications of the named potential, comparison, and stochastic premises; they do not derive the realized physical potential from POP/PCE alone.

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
*   **$V_{penalty}(x)$**: Represents effective penalty terms supplied on the corresponding branch. Sections D.3 and D.4 show the consequences of a faithful misalignment restoring force and of a strict geometric-comparator penalty; they do not derive those physical terms from the bare POP/PCE grammar.

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

**Definition D.1f (PCE Branch Contract).** A finite-resolution PCE branch contract is a tuple
$$
\mathfrak B=
\bigl(
\mathcal X_{\mathfrak B},
\mathsf P_{\mathfrak B},
\mathcal R_{\mathfrak B},
K_{\mathfrak B},
r_{\mathfrak B},
W_{\mathfrak B}
\bigr)
$$
where:

1. $\mathcal X_{\mathfrak B}$ is the admissible configuration space for the branch;
2. $\mathsf P_{\mathfrak B}$ is the finite protocol family retained at that resolution;
3. $\mathcal R_{\mathfrak B}(x)$ is the finite protocol-response presheaf induced by $x\in\mathcal X_{\mathfrak B}$ on $\mathsf P_{\mathfrak B}$;
4. $K_{\mathfrak B}$ is a closed pointed convex resource cone whose dual cone has nonempty interior;
5. $r_{\mathfrak B}:\mathcal X_{\mathfrak B}\to K_{\mathfrak B}$ is the branch resource vector;
6. $W_{\mathfrak B}\subseteq K_{\mathfrak B}^*$ is the admissible set of dual PCE certificates.

For $w\in W_{\mathfrak B}$, the branch scalarization is
$$
V_{\mathfrak B,w}(x):=w\cdot r_{\mathfrak B}(x).
$$
The branch quotient is defined by
$$
x\sim_{\mathfrak B}y
\quad\Longleftrightarrow\quad
\mathcal R_{\mathfrak B}(x)\simeq\mathcal R_{\mathfrak B}(y).
$$

**Theorem D.1g (Branch-Indexed PCE Variational Grammar).** All PCE applications in the framework share the same variational grammar:
$$
\text{choose } \mathfrak B,\quad
\text{quotient by } \sim_{\mathfrak B},\quad
\text{minimize } V_{\mathfrak B,w}=w\cdot r_{\mathfrak B}
\text{ over the quotient.}
$$
This is a common resource-order grammar, not a claim that every branch has the same numerical Lagrangian, the same state space, or the same physical units.

More explicitly, for every finite-resolution branch contract $\mathfrak B$ and every $w\in W_{\mathfrak B}$:

1. if $r_{\mathfrak B}(y)-r_{\mathfrak B}(x)\in K_{\mathfrak B}$, then
$$
V_{\mathfrak B,w}(x)\le V_{\mathfrak B,w}(y);
$$

2. if $w\in\mathrm{int}\,K_{\mathfrak B}^*$ and $r_{\mathfrak B}(y)-r_{\mathfrak B}(x)\in K_{\mathfrak B}\setminus\{0\}$, then
$$
V_{\mathfrak B,w}(x)<V_{\mathfrak B,w}(y);
$$

3. if $\mathcal R_{\mathfrak B}(x)\simeq\mathcal R_{\mathfrak B}(y)$ and one representative is strictly more costly in the resource order, the higher-cost representative is response-null surplus and is removed by PCE;

4. if the quotient $\mathcal X_{\mathfrak B}/\sim_{\mathfrak B}$ is compact and the descended scalarization is lower semicontinuous, a PCE-minimal response class exists.

*Proof.* Items (1) and (2) are the dual-cone argument of Theorem D.1c applied with $K_{\mathfrak B}$ and $r_{\mathfrak B}$ in place of $K$ and $r$. If $r_{\mathfrak B}(y)-r_{\mathfrak B}(x)\in K_{\mathfrak B}$, then for $w\in K_{\mathfrak B}^*$,
$$
V_{\mathfrak B,w}(y)-V_{\mathfrak B,w}(x)
=
w\cdot\bigl(r_{\mathfrak B}(y)-r_{\mathfrak B}(x)\bigr)
\ge0.
$$
If $w\in\mathrm{int}\,K_{\mathfrak B}^*$ and the resource difference is a nonzero element of $K_{\mathfrak B}$, the standard dual-cone separation property gives a strict positive pairing, so the inequality is strict.

Item (3) is Theorem D.1d applied inside the branch contract: naturally isomorphic response presheaves define the same PPI physical invariant on $\mathsf P_{\mathfrak B}$, and strict resource dominance eliminates the more costly representative as surplus.

Item (4) is Theorem D.1e applied to the quotient of $\mathcal X_{\mathfrak B}$ by $\sim_{\mathfrak B}$. Compactness and lower semicontinuity give existence of a minimizer by the direct method. ∎

## D.3 Dynamic Complexity Alignment Mechanism ($C_P \leftrightarrow \langle \hat{C}_v \rangle$)

This section provides the rigorous justification for Theorem 2. We separate two statements: exact alignment as a necessary condition for true stable PCE equilibria, and quantitative operational tracking of that condition under the stochastic gradient dynamics.

**Lemma D.1 (Alignment from Faithful Force Identifiability).**
Write $q_v(x):=\langle\hat C_v\rangle_x$. Let $F_v^{\mathrm{op}}(x)$ and $F_v^{\mathrm{phys}}(x)$ be, respectively, the operational and physical adaptation forces in the $q_v$ coordinate. Assume that the branch has the per-MPU force-identifiability property
$$
F_v^{\mathrm{phys}}(x)-F_v^{\mathrm{op}}(x)=0
\quad\Longleftrightarrow\quad
q_v(x)=C_P(v)
$$
for every $v$, with no cancellation between distinct MPU coordinates. If $x^*$ is a joint stable equilibrium of the two ledgers,
$$
F_v^{\mathrm{op}}(x^*)=F_v^{\mathrm{phys}}(x^*)=0
\qquad\text{for every }v,
$$
then
$$
C_P(v)=\langle\hat C_v\rangle_{x^*}
\qquad\text{for every }v.
$$
Without per-MPU force identifiability, stationarity yields only the aggregate relations encoded by the kernel of the force-mismatch map.

*Proof.* At a joint equilibrium,
$$
F_v^{\mathrm{phys}}(x^*)-F_v^{\mathrm{op}}(x^*)=0-0=0.
$$
The forward implication in the force-identifiability hypothesis gives $q_v(x^*)=C_P(v)$ for each $v$. Since $q_v(x^*)=\langle\hat C_v\rangle_{x^*}$ by definition, the asserted alignment follows. If the mismatch map has a nontrivial kernel across MPU coordinates, its vanishing determines only the corresponding aggregate quotient, so componentwise alignment does not follow. ∎

*(Note on notation: In this Lemma, we used $\nabla_{op}$ and $\nabla_{true}$ to explicitly distinguish the operational system's calculation from the underlying physical optimum. In all subsequent sections of this appendix, we revert to the shorthand $\nabla V$ to denote the gradient of the operational potential $V(x)$ that drives the system dynamics according to Equation D.8.)*

**Corollary D.1 (Alignment Condition at Stable Equilibria on the Faithful-Cost-Identifiability Branch).**
On the faithful-cost-identifiability branch of Lemma D.1, any configuration $x^*$ that represents a stable equilibrium state (attractor) under the complete physical adaptation dynamics governed by the Principle of Compression Efficiency must satisfy the per-MPU alignment condition $C_P(v) = \langle \hat{C}_v \rangle_{x^*}$ for all constituent MPUs $v$.

**Theorem D.1 (Quadratic Representation of Linear Alignment Feedback).**
Let $q_v:=\langle\hat C_v\rangle_x$ and suppose the operational adaptation force contains the linear feedback
$$
F_v^{\mathrm{align}}(x)=k_1\bigl(C_P(v)-q_v\bigr),
\qquad k_1>0,
$$
with the targets $C_P(v)$ independent of the proxy coordinates on the adaptation window. Then this feedback is the negative proxy-coordinate gradient of
$$
V_{\mathrm{proxy}}(x)
=
\frac{k_1}{2}
\sum_v\bigl(C_P(v)-\langle\hat C_v\rangle_x\bigr)^2.
\quad \text{(D.1a)}
$$
Among differentiable scalar potentials on the proxy-coordinate domain, this representation is unique up to an additive function independent of all $q_v$.

*Proof.* For each $v$,
$$
\frac{\partial V_{\mathrm{proxy}}}{\partial q_v}
=
k_1(q_v-C_P(v)).
$$
Therefore
$$
-\frac{\partial V_{\mathrm{proxy}}}{\partial q_v}
=
k_1(C_P(v)-q_v)
=F_v^{\mathrm{align}}.
$$
If another differentiable potential $U$ has the same negative gradient in every proxy coordinate, then $\partial_{q_v}(U-V_{\mathrm{proxy}})=0$ for every $v$. Hence $U-V_{\mathrm{proxy}}$ is independent of the proxy coordinates, proving the stated uniqueness. ∎

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
Consider (D.8) with $V=V_{\mathrm{core}}+V_{\mathrm{proxy}}$, with quasi-static targets $C_P(v)$ and $V_{\mathrm{proxy}}$ given by (D.1a). Let $\nabla_C$ denote the proxy-coordinate gradient and $D_{CC}$ the corresponding principal diffusion block. Assume (A1)--(A6) and assume that the proxy-coordinate subspace is invariant under the mobility matrix $\eta(x)$ for every $x\in\mathcal K$. Then
$$
\frac{d}{dt}\mathbb E[\mathcal M(x(t))]
\le
-k_1\eta_{\min}\mathbb E[\mathcal M(x(t))]+C_{\mathcal M},
\quad \text{(D.5)}
$$
where
$$
C_{\mathcal M}
:=
\frac{\eta_{\max}^2}{2k_1\eta_{\min}}
\sup_{x\in\mathcal K}\|\nabla_CV_{\mathrm{core}}(x)\|^2
+
\sup_{x\in\mathcal K}\operatorname{Tr}D_{CC}(x).
$$

*Proof.* Since $\mathcal M=k_1^{-1}V_{\mathrm{proxy}}$, Itô's formula gives
$$
\frac{d}{dt}\mathbb E\mathcal M
=
\mathbb E\left[
-k_1^{-1}(\nabla V_{\mathrm{proxy}})^T\eta
(\nabla V_{\mathrm{core}}+\nabla V_{\mathrm{proxy}})
+k_1^{-1}\operatorname{Tr}(D\nabla^2V_{\mathrm{proxy}})
\right].
$$
The proxy derivatives satisfy
$$
\nabla_CV_{\mathrm{proxy}}=k_1(\langle\hat C\rangle-C_P),
\qquad
\|\nabla_CV_{\mathrm{proxy}}\|^2=2k_1^2\mathcal M,
\qquad
\nabla_C^2V_{\mathrm{proxy}}=k_1I.
$$
The lower mobility bound yields
$$
-k_1^{-1}(\nabla V_{\mathrm{proxy}})^T\eta\nabla V_{\mathrm{proxy}}
\le-2k_1\eta_{\min}\mathcal M.
$$
Mobility invariance of the proxy subspace and Young's inequality give
$$
k_1^{-1}|(\nabla V_{\mathrm{proxy}})^T\eta\nabla V_{\mathrm{core}}|
\le
\frac{\eta_{\min}}{2k_1}\|\nabla_CV_{\mathrm{proxy}}\|^2
+
\frac{\eta_{\max}^2}{2k_1\eta_{\min}}\|\nabla_CV_{\mathrm{core}}\|^2.
$$
The first term on the right equals $k_1\eta_{\min}\mathcal M$. Finally,
$$
k_1^{-1}\operatorname{Tr}(D\nabla^2V_{\mathrm{proxy}})
=
k_1^{-1}\operatorname{Tr}(D_{CC}k_1I)
=
\operatorname{Tr}D_{CC}.
$$
Combining these estimates and taking the two suprema gives (D.5). ∎

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

*Proof.* Put
$$
y(t):=\mathbb E[\mathcal M(x(t))],
\qquad
a:=k_1\eta_{min}>0,
\qquad
C:=C_{\mathcal M}\ge0.
$$
Equation (D.5) is $y'(t)\le-ay(t)+C$. Multiplying by $e^{at}$ gives
$$
\frac d{dt}\bigl(e^{at}y(t)\bigr)
=e^{at}(y'(t)+ay(t))
\le Ce^{at}.
$$
Integration from $0$ to $t$ yields
$$
e^{at}y(t)-y(0)
\le C\int_0^te^{as}\,ds
=\frac Ca(e^{at}-1).
$$
After multiplication by $e^{-at}$,
$$
y(t)
\le e^{-at}y(0)+\frac Ca(1-e^{-at}),
$$
which is the asserted bound. Since $e^{-at}\to0$,
$$
\limsup_{t\to\infty}y(t)\le\frac Ca
=\frac{C_{\mathcal M}}{k_1\eta_{min}},
$$
proving (D.6). ∎

**Remark D.1: Reparameterization Scope of the Operational Complexity Proxy.**
The operational proxy $\hat C_v$ is identified with quantum circuit complexity by Definition B.1. The alignment results do not make that coordinate unique. Let $f$ be a strictly monotone bijection on the viable complexity interval, set $C'=f(C)$, and transform the cost law by
$$
R_f(C'):=R(f^{-1}(C')).
$$
Then $R_f(f(C))=R(C)$, so the physical cost, work-cost gap, and PCE ordering are unchanged after the corresponding coordinate transformation. A non-affine $f$ is penalized only if one applies the untransformed law $R$ to $f(C)$, which describes a different cost model. Thus Theorem 2 and Section D.3 identify a cost-relevant proxy up to response- and cost-preserving reparameterization. Selection of quantum circuit complexity among that equivalence class is the modeling choice of Definition B.1 unless an additional calibration or comparison theorem fixes the coordinate.

## D.4 Dynamical Emergence of Geometric Regularity

This section provides the conditional dynamical justification for Theorem 43: minimizing $V(x)$ selects geometrically regular configurations only under the monotonicity and regular equal-proxy comparator hypotheses stated in Theorem D.3.

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

**Theorem D.2 (Global Geometric Comparison in $V(x)$).**
Under the hypotheses of Lemma D.3, if an irregular configuration $x_{\mathrm{irreg}}$ and its comparison configuration $x_{\mathrm{reg}}$ have the same proxy-complexity coordinates and satisfy
$$
aL^\gamma+bL-c>0,
$$
then
$$
V(x_{\mathrm{irreg}})>V(x_{\mathrm{reg}}).
$$
This is a global comparison statement. A claim about the direction of $-\nabla V$ requires the additional local-regularization hypothesis used in Theorem D.4(iii).

*Proof.* Lemma D.3 gives
$$
V_{\mathrm{core}}(x_{\mathrm{irreg}})-V_{\mathrm{core}}(x_{\mathrm{reg}})
\ge aL^\gamma+bL-c>0.
$$
Equality of the proxy coordinates gives
$$
V_{\mathrm{proxy}}(x_{\mathrm{irreg}})=V_{\mathrm{proxy}}(x_{\mathrm{reg}}).
$$
Adding the two relations proves the strict inequality for $V$. No local gradient conclusion follows from this argument. ∎

**Lemma D.4 (Regular Configurations as Global Minima Candidate Set for $V_{core}$).**
Assume that every geometrically irregular $x\in\mathcal X_{adm}$ has a geometrically regular comparator $x_{reg}\in\mathcal X_{reg}$ with the same proxy-complexity coordinates and
$$
V_{core}(x_{reg})<V_{core}(x).
$$
Then every global minimizer of $V_{core}$, if one exists, belongs to $\mathcal X_{reg}$.

*Proof.* Let $x_*$ be a global minimizer of $V_{core}$. If $x_*$ were irregular, the hypothesis would provide $x_{reg}\in\mathcal X_{reg}$ satisfying
$$
V_{core}(x_{reg})<V_{core}(x_*),
$$
contradicting the defining inequality $V_{core}(x_*)\le V_{core}(x)$ for every $x\in\mathcal X_{adm}$. Hence $x_*\in\mathcal X_{reg}$. ∎

**Theorem D.3 (Regularity of Global Minima under Strict Comparison).**
Assume that every geometrically irregular admissible configuration $x$ has a geometrically regular admissible comparator $\widetilde x$ with the same proxy-complexity coordinates and
$$
V_{\mathrm{core}}(\widetilde x)<V_{\mathrm{core}}(x).
$$
Then every global minimizer $x^*$ of $V=V_{\mathrm{core}}+V_{\mathrm{proxy}}$ is geometrically regular. If, in addition, $x^*$ is interior in the proxy-complexity coordinates, then
$$
\nabla_CV_{\mathrm{core}}(x^*)
+k_1\bigl(\langle\hat C\rangle_{x^*}-C_P\bigr)=0
$$
and
$$
\bigl\|\langle\hat C\rangle_{x^*}-C_P\bigr\|
\le
k_1^{-1}\bigl\|\nabla_CV_{\mathrm{core}}(x^*)\bigr\|.
$$

*Proof.* If a global minimizer $x^*$ were irregular, the strict-comparison hypothesis would supply $\widetilde x$ with equal proxy coordinates. Hence
$$
V_{\mathrm{proxy}}(\widetilde x)=V_{\mathrm{proxy}}(x^*)
$$
and
$$
V(\widetilde x)-V(x^*)
=
V_{\mathrm{core}}(\widetilde x)-V_{\mathrm{core}}(x^*)<0,
$$
contradicting global minimality. Thus $x^*$ is regular.

At an interior minimizer, the proxy-coordinate first-order condition is $\nabla_CV(x^*)=0$. Since
$$
\nabla_CV_{\mathrm{proxy}}
=k_1(\langle\hat C\rangle-C_P),
$$
the balance equation follows. Taking norms and dividing by $k_1>0$ gives the bound. ∎

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

We use stochastic Lyapunov methods to characterize the ergodic stationary regime of the dynamics (Equation D.8) and its low-noise detailed-balance localization near the global-minimum set $\mathcal{E}_{*}^{\text{global}}$. This set is geometrically regular only on the strict-comparison branch of Theorem D.3.

### D.6.1 Assumptions for Convergence

We make standard technical assumptions required for the convergence theorems, justifying them from the physical principles of the PU framework.
*   **(A1) Potential Properties:** $V(x)$ is twice continuously differentiable ($C^2$), bounded below on the admissible state space $\mathcal{X}_{adm}$. We assume $V(x)$ is coercive, meaning $V(x) \to \infty$ as $x$ approaches the boundary of $\mathcal{X}_{adm}$ or as some norm $|x| \to \infty$. *Physical Justification:* The $C^2$ smoothness is required for the Lyapunov analysis involving the Hessian (Lemma D.5). Coercivity is physically plausible because the resource cost terms ($V_{op}, V_{prop}$) are expected to grow super-linearly with complexity and network size (e.g., $R(C) \propto C^{\gamma_p}$ with $\gamma_p > 1$), while the benefit term ($V_{benefit}$) saturates (due to $PP < \beta$). This ensures the potential grows at the extremes of the configuration space, confining the dynamics.
*   **(A2) Mobility Bounds:** The mobility matrix $\eta(x)$ is symmetric positive definite, bounded, and Lipschitz on $\mathcal{X}_{adm}$: there exist constants $0<\eta_{\min}\le \eta_{\max}<\infty$ such that for all $x\in\mathcal{X}_{adm}$ and all vectors $v$,
$\eta_{\min}\|v\|^2 \le v^T\eta(x)v \le \eta_{\max}\|v\|^2$, and $\|\eta(x)-\eta(y)\|\le L_\eta\|x-y\|$ for all $x,y$. *Physical Justification:* In PU, $\eta$ encodes local equilibration/update rates of ND-RID channels and local routing policies. These are bounded by finite cycle times and finite per-step dissipation (each irreversible ND-RID update has $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$, Theorem 31), and Lipschitz dependence expresses local response of rates to small changes in configuration, consistent with near-equilibrium linear response [Onsager 1931].
*   **(A3) Diffusion regularity and ellipticity:** The noise coefficient $\sigma(x)$ in $dx=b(x)dt+\sigma(x)dW_t$ is globally Lipschitz on the retained state space and satisfies $\sigma(x)\sigma(x)^T=2D(x)$. There are constants $0<d_{\min}\le d_{\max}<\infty$ such that
$$
d_{\min}\|v\|^2\le v^TD(x)v\le d_{\max}\|v\|^2
$$
for every tangent vector $v$.
*   **(A4) Drift regularity:** The drift $b(x)=-\eta(x)\nabla V(x)$ is globally Lipschitz on the retained state space.
*   **(A5) Compact intrinsic state-space branch:** The retained state space $\mathcal K$ is a connected compact Riemannian manifold without boundary. Equation (D.8) denotes the intrinsic diffusion whose generator on $C^2(\mathcal K)$ is
    $$
    \mathcal L f
    =-\langle\eta\,\operatorname{grad}V,\operatorname{grad}f\rangle
    +\operatorname{tr}\!\bigl(D\,\operatorname{Hess}f\bigr),
    $$
    where $\eta$ is a symmetric positive tangent-bundle endomorphism, $D$ is a symmetric positive contravariant diffusion tensor, and the gradient and Hessian are taken with respect to the declared Riemannian metric. Any local-coordinate Itô representation must include the connection correction needed to realize this generator. A branch with boundary requires a separately specified reflecting diffusion and no-flux boundary condition.
*   **(A6) Irreducibility:** For every nonempty open $U\subset\mathcal K$, every $t>0$, and every $x\in\mathcal K$, one has $\mathbb P_x(X_t\in U)>0$.

### D.6.2 Lyapunov Analysis

**Lemma D.5 (Stochastic Drift Bound for $V(x)$).**
Under assumptions (A1)–(A5), Itô's formula for the intrinsic generator of (D.8) yields the following drift identity and bound for $V$. They do not by themselves make $V(X_t)$ a global supermartingale.
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
Using the bounds on $\eta(x)$ (A2) and $D(x)$ (A3), and noting that the Hessian $\nabla^2 V(x)$ is bounded on the compact set $\mathcal{K}$ (which follows from the $C^2$ clause in assumption (A1) together with the compact confinement clause (A5) of §D.6.1), we get:
$$
\mathcal{L}V(x) \le -\eta_{min} \|\nabla V(x)\|^2 + \mathrm{tr}(D(x) \nabla^2 V(x))
\le -\eta_{min} \|\nabla V(x)\|^2 + C_{noise}
\quad \text{(D.10)}
$$
where
$$
C_{\mathrm{noise}}
:=
\sup_{x\in\mathcal K}
\left|
\operatorname{tr}\!\left(D(x)\operatorname{Hess}V(x)\right)
\right|
<\infty.
$$
Consequently,
$$
\mathcal LV(x)<0
\quad\text{whenever}\quad
\|\operatorname{grad}V(x)\|^2
>
\frac{C_{\mathrm{noise}}}{\eta_{\min}}.
$$
Thus $V(X_{t\wedge\tau})$ is a supermartingale only after localization on a region where the displayed nonpositive drift condition holds, with $\tau$ its exit time. The estimate supplies no global monotonicity, almost-sure point convergence, or convergence to a single minimizer without additional recurrence, invariance, and asymptotic-stability hypotheses.

### D.6.3 Characterization of the Critical Set $\mathcal{E}_{*}$

**Definition D.4 (Critical Set $\mathcal{E}_{*}$).**
The critical set $\mathcal{E}_{*}$ consists of all configurations $x^* \in \mathcal{X}_{adm}$ where the deterministic drift term vanishes:
$$
\mathcal{E}_{*} = \{x^* \in \mathcal{X}_{adm} \mid \nabla V(x^*) = 0\}
\quad \text{(D.11)}
$$
This set includes all local minima, maxima, and saddle points of the potential $V(x)$.

**Theorem D.4 (Conditional Properties of Local Minimizers).**
Let $x^*$ be a local minimizer of $V=V_{\mathrm{core}}+V_{\mathrm{proxy}}$, and write $\langle\hat C\rangle_{x^*}:=(\langle\hat C_v\rangle_{x^*})_v$ and $C_P:=(C_P(v))_v$.

(i) If $x^*$ is interior in the proxy-complexity coordinates, then
$$
\nabla_CV_{\mathrm{core}}(x^*)
+k_1\bigl(\langle\hat C\rangle_{x^*}-C_P\bigr)=0
$$
and
$$
\bigl\|\langle\hat C\rangle_{x^*}-C_P\bigr\|
\le
k_1^{-1}\bigl\|\nabla_CV_{\mathrm{core}}(x^*)\bigr\|.
$$
At a proxy-coordinate boundary, the corresponding conclusion is the first-order variational inequality
$$
\Bigl[\nabla_CV_{\mathrm{core}}(x^*)
+k_1\bigl(\langle\hat C\rangle_{x^*}-C_P\bigr)\Bigr]\cdot h_C\ge0
$$
for every feasible one-sided proxy tangent $h_C$. Per-MPU exact alignment follows from the equality only when $\nabla_CV_{\mathrm{core}}(x^*)=0$ and the faithful-cost-identifiability branch of Lemma D.1 is in force.

(ii) Assume the strict-comparison hypothesis of Theorem D.3: every geometrically irregular admissible configuration has a geometrically regular admissible comparator with the same proxy coordinates and strictly smaller core potential. Then every global minimizer is geometrically regular.

(iii) Assume the local-regularization hypothesis that every irregular admissible configuration has arbitrarily close geometric perturbations with unchanged proxy coordinates and strictly smaller core potential. Then every local minimizer is geometrically regular.

*Proof.* For (i), differentiability and local minimality give a nonnegative directional derivative in every feasible one-sided proxy direction. Since
$$
\nabla_CV
=
\nabla_CV_{\mathrm{core}}
+k_1(\langle\hat C\rangle-C_P),
$$
this is the displayed variational inequality. At an interior point both $h_C$ and $-h_C$ are feasible for every proxy direction, so the directional derivative vanishes in every direction and the equality follows. Taking norms gives the bound.

For (ii), if a global minimizer $x^*$ were irregular, the strict-comparison hypothesis would supply a regular $\widetilde x$ with equal proxy coordinates. Thus $V_{\mathrm{proxy}}(\widetilde x)=V_{\mathrm{proxy}}(x^*)$ and $V_{\mathrm{core}}(\widetilde x)<V_{\mathrm{core}}(x^*)$, contradicting global minimality.

For (iii), if a local minimizer $x^*$ were irregular, the local-regularization hypothesis would supply arbitrarily close $\widetilde x$ with equal proxy coordinates and lower core potential. The proxy term is unchanged, so $V(\widetilde x)<V(x^*)$, contradicting local minimality. ∎

### D.6.4 Noise-Driven Escape from Non-Global Minima

**Lemma D.6 (Almost-Sure Exit from a Proper Relatively Compact Domain Under Non-Degenerate Noise).**
Let $\mathcal K$ be the connected compact invariant state manifold from (A5), equipped with a finite full-support reference measure $m$. Assume the stochastic PCE dynamics have, for every $T>0$, a jointly continuous transition density $p_T(x,y)>0$ on $\mathcal K\times\mathcal K$ with respect to $m$. Let $\mathcal D$ be an open set such that
$$
\overline{\mathcal D}\subsetneq\mathcal K
$$
and $\mathcal K\setminus\overline{\mathcal D}$ contains a nonempty open set. Define
$$
\tau_{\mathcal D}
:=
\inf\{t\ge0:X_t\notin\mathcal D\}.
$$
Then
$$
\mathbb P_x(\tau_{\mathcal D}<\infty)=1
\qquad
\text{for every }x\in\mathcal D.
\qquad\text{(D.11a)}
$$

*Proof.* Choose a nonempty open set $O$ with $\overline O\subset\mathcal K\setminus\overline{\mathcal D}$ and choose $T>0$. Joint continuity and strict positivity on the compact set $\overline{\mathcal D}\times\overline O$ give
$$
q
:=
\inf_{x\in\overline{\mathcal D}}
\int_Op_T(x,y)\,m(dy)
>
0.
$$
If $X_T\in O$, the path has exited $\mathcal D$ no later than $T$, so
$$
\inf_{x\in\overline{\mathcal D}}
\mathbb P_x(\tau_{\mathcal D}\le T)
\ge q.
$$
The strong Markov property at the times $T,2T,\ldots$ therefore gives inductively
$$
\mathbb P_x(\tau_{\mathcal D}>nT)
\le
(1-q)^n.
$$
The events $\{\tau_{\mathcal D}>nT\}$ decrease to $\{\tau_{\mathcal D}=\infty\}$, and continuity from above yields
$$
\mathbb P_x(\tau_{\mathcal D}=\infty)
\le
\lim_{n\to\infty}(1-q)^n
=0.
$$
Thus $\tau_{\mathcal D}<\infty$ almost surely. ∎

### D.6.5 Global Ergodicity and Low-Noise Concentration

**Theorem D.5 (Ergodic Long-Run Behavior; Low-Noise Concentration in Detailed-Balance Regimes).**
Under Assumptions (A1)–(A6), the stochastic dynamics (D.8) define a strong Markov diffusion on the compact state space $\mathcal K$ (A5). For strictly non-vanishing noise ($d_{\min}>0$ in (A3)), the process admits a unique invariant probability measure $\pi$ and is ergodic. If $\mathcal K$ contains at least two points, the process does **not** converge almost surely to a single equilibrium point. For any bounded measurable observable $f$,
$$
\frac{1}{T}\int_0^T f(x(t))\,dt \xrightarrow[T\to\infty]{a.s.} \int_{\mathcal{K}} f(x)\,\pi(dx). \qquad \text{(D.12)}
$$

To identify when this stationary regime localizes near the PCE-optimal set, consider a "temperature-scaled" family of dynamics obtained by scaling the diffusion as $D_\theta(x):=\theta\,D(x)$ for $\theta>0$ (so the noise strength decreases as $\theta\downarrow 0$). Let $\pi_\theta$ denote the invariant measure of the corresponding diffusion. The Gibbs form is available on the registered reversible subbranch, namely when $D_\theta=\theta\eta$ and the generator is the divergence-form operator
$$
\mathcal L_\theta f
=\theta\,e^{V/\theta}\operatorname{div}\!\left(e^{-V/\theta}\,\eta\operatorname{grad}f\right)
=\theta\operatorname{div}(\eta\operatorname{grad}f)-\langle\eta\operatorname{grad}V,\operatorname{grad}f\rangle,
$$
with $\eta$ a symmetric positive-definite mobility field on $\mathcal K$. On that subbranch the invariant probability measure is
$$
\pi_\theta(dx)
=Z_\theta^{-1}\exp\!\left(-\frac{V(x)}{\theta}\right)d\operatorname{vol}(x).
\tag{D.12a}
$$
On a flat compact torus with constant $\eta$ this generator coincides with $-\langle\eta\nabla V,\nabla f\rangle+\theta\operatorname{tr}(\eta\nabla^2f)$; on a curved manifold or with state-dependent mobility the two differ by the noise-induced drift $\theta\langle\operatorname{div}\eta,\operatorname{grad}f\rangle$, so (D.12a) does not follow from $D_\theta=\theta\eta$ alone. On this reversible subbranch, the family concentrates on the global-minimizer set
$$
\mathcal E_*^{\mathrm{global}}:=\operatorname*{argmin}_{x\in\mathcal K}V(x)
$$
as $\theta\downarrow0$. For $\delta>0$, let
$$
A_\delta:=\{x:\operatorname{dist}(x,\mathcal E_*^{\mathrm{global}})>\delta\},
\qquad
\Delta_\delta:=\inf_{x\in A_\delta}(V(x)-V_{\min}).
$$
If $A_\delta$ is nonempty, then $\Delta_\delta>0$, and for every $\varepsilon\in(0,\Delta_\delta)$ there is $C_{\delta,\varepsilon}<\infty$ such that
$$
\pi_\theta(A_\delta)
\le
C_{\delta,\varepsilon}
\exp\left(-\frac{\Delta_\delta-\varepsilon}{\theta}\right)
\qquad(\theta>0).
\tag{D.12b}
$$

If the strict-comparison hypothesis of Theorem D.3 also holds, every configuration in $\mathcal E_*^{\mathrm{global}}$ is geometrically regular. A configuration in that set satisfies the proxy-coordinate balance relation of Theorem D.3 only when it is also interior in the proxy-complexity coordinates.

*Proof.* Under (A3)--(A5), the drift and noise coefficients are globally Lipschitz in the retained intrinsic diffusion charts, and $\mathcal K$ is compact and has no boundary. The strong-existence and pathwise-uniqueness theorem for Itô equations (Itô 1951) therefore gives a unique solution up to its explosion time, while compactness excludes explosion. The solution consequently defines a conservative strong Markov semigroup $(P_t)_{t\ge0}$. Uniform ellipticity and Lipschitz coefficients satisfy the hypotheses of the strong-Feller theorem for uniformly elliptic diffusions (Stroock and Varadhan 1979), so $P_t$ maps bounded measurable functions to continuous functions for every $t>0$. Assumption (A6) is precisely topological irreducibility.

For $x\in\mathcal K$, define
$$
\mu_T:=\frac1T\int_0^T\delta_xP_t\,dt.
$$
Compactness makes $\{\mu_T:T>0\}$ tight. Prokhorov's theorem (Prokhorov 1956) gives a sequence $T_j\to\infty$ and a probability measure $\pi$ with $\mu_{T_j}\Rightarrow\pi$. For $s>0$ and $g\in C(\mathcal K)$, the Feller property and the semigroup law give
$$
\begin{aligned}
\mu_T(P_sg)-\mu_T(g)
&=\frac1T\int_0^T(P_{t+s}g(x)-P_tg(x))\,dt\\
&=\frac1T\left(\int_T^{T+s}P_ug(x)\,du-\int_0^sP_ug(x)\,du\right).
\end{aligned}
$$
Its absolute value is at most $2s\lVert g\rVert_\infty/T$. Passing to $T_j\to\infty$ yields $\pi(P_sg)=\pi(g)$ for every $g\in C(\mathcal K)$, hence $\pi P_s=\pi$. This is the Krylov--Bogolyubov existence argument (Kryloff and Bogoliouboff 1937) with the invariance step displayed.

Doob's uniqueness theorem (Doob 1948) applies because the semigroup is strong Feller and topologically irreducible; hence $\pi$ is the unique invariant probability measure. Uniform ellipticity on the connected compact manifold gives positive transition densities, so the process is $\pi$-irreducible and positive Harris recurrent. The positive-Harris ergodic theorem (Meyn and Tweedie 2009) therefore gives, for every initial state and every bounded measurable $f$,
$$
\frac1T\int_0^Tf(X_t)\,dt\longrightarrow\int_{\mathcal K}f\,d\pi
\quad\text{almost surely},
$$
which is (D.12).

If $\mathcal K$ contains at least two points, irreducibility gives $\operatorname{supp}\pi=\mathcal K$, so $\pi$ is not a point mass. Were $X_t\to X_\infty$ almost surely, Cesàro convergence would give
$$
\frac1T\int_0^Tf(X_t)\,dt\longrightarrow f(X_\infty)
$$
for every $f\in C(\mathcal K)$. Comparing with (D.12) on a countable point-separating dense subset of $C(\mathcal K)$ would imply $f(X_\infty)=\int f\,d\pi$ for all continuous $f$, which is possible only if $\pi=\delta_{X_\infty}$. This contradiction proves the nonconvergence clause on the nontrivial-state-space branch.

For the low-noise concentration statement, work on the registered reversible subbranch stated in the theorem, where $\mathcal L_\theta f=\theta e^{V/\theta}\operatorname{div}(e^{-V/\theta}\eta\operatorname{grad}f)$. Put $\pi_\theta:=Z_\theta^{-1}e^{-V/\theta}d\operatorname{vol}$. For $f,g\in C^\infty(\mathcal K)$ the divergence theorem on the closed manifold $\mathcal K$ gives
$$
\int_{\mathcal K}g\,\mathcal L_\theta f\,d\pi_\theta
=-\theta Z_\theta^{-1}\int_{\mathcal K}\langle\eta\operatorname{grad}f,\operatorname{grad}g\rangle\,e^{-V/\theta}\,d\operatorname{vol},
$$
which is symmetric in $f$ and $g$ because $\eta$ is symmetric. Taking $g\equiv1$ gives $\int_{\mathcal K}\mathcal L_\theta f\,d\pi_\theta=0$ for every such $f$, so $\pi_\theta$ is reversible and invariant, proving (D.12a) on the stated branch. On the flat torus with constant $\eta$ the same computation reduces to the stationary Fokker-Planck identity $\nabla\cdot(\eta(\nabla V\,p_\theta+\theta\nabla p_\theta))=0$, whose probability current vanishes identically at $p_\theta=Z_\theta^{-1}e^{-V/\theta}$.

Let $A_\delta$ and $\Delta_\delta$ be as in (D.12b), choose $\varepsilon\in(0,\Delta_\delta)$, and choose a minimizer $x_*$. Continuity of $V$ makes
$$
U_\varepsilon:=\{x\in\mathcal K:V(x)<V_{\min}+\varepsilon\}
$$
a nonempty open set, so $\operatorname{Vol}(U_\varepsilon)>0$. The numerator and denominator obey
$$
\int_{A_\delta}e^{-V/\theta}dx
\le
\operatorname{Vol}(\mathcal K)e^{-(V_{\min}+\Delta_\delta)/\theta}
$$
and
$$
\int_{\mathcal K}e^{-V/\theta}dx
\ge
\int_{U_\varepsilon}e^{-V/\theta}dx
\ge
\operatorname{Vol}(U_\varepsilon)e^{-(V_{\min}+\varepsilon)/\theta}.
$$
Division gives
$$
\pi_\theta(A_\delta)
\le
\frac{\operatorname{Vol}(\mathcal K)}{\operatorname{Vol}(U_\varepsilon)}
e^{-(\Delta_\delta-\varepsilon)/\theta},
$$
which is (D.12b) with $C_{\delta,\varepsilon}=\operatorname{Vol}(\mathcal K)/\operatorname{Vol}(U_\varepsilon)$. The final sentence follows from Theorem D.3 under its strict-comparison and interior hypotheses. ∎

**Theorem D.6.5a (Finite Detailed-Balance PCE H-Theorem).** On a finite detailed-balance PCE branch, let $X$ be a finite state set and let $L$ be an irreducible continuous-time Markov generator acting on functions $f:X\to\mathbb R$ by
$$
Lf(x)=\sum_{y\in X}K(x,y)\bigl(f(y)-f(x)\bigr),
$$
where the rate kernel $K:X\times X\to[0,\infty)$ satisfies $K(x,y)\ge0$ for $x\ne y$ and the off-diagonal entries are the transition rates from $x$ to $y$. Let $\pi$ be the unique stationary law of $L$ on the irreducible branch, and impose detailed balance
$$
\pi(x)K(x,y)=\pi(y)K(y,x).
$$
Writing
$$
\mu_t(x)=\rho_t(x)\pi(x),
\qquad
\rho_t(x)>0,
$$
define the finite PCE free-cost functional
$$
H_{\mathrm{PCE}}(\mu_t\mid\pi)
=
D(\mu_t\Vert\pi)
=
\sum_{x\in X}\rho_t(x)\log\rho_t(x)\,\pi(x).
$$
Then
$$
\frac{d}{dt}D(\mu_t\Vert\pi)
=
-\frac12\sum_{x,y\in X}\pi(x)K(x,y)
(\rho_t(y)-\rho_t(x))(\log\rho_t(y)-\log\rho_t(x))
\le0.
$$
Equality holds, under irreducibility, exactly at $\mu_t=\pi$.

This is the detailed-balance entropy monotone underlying the low-noise concentration part of Theorem D.5. It is relative entropy to the stationary PCE law, not raw entropy and not the reset entropy ledger.

*Proof.* The forward equation and detailed balance give
$$
\begin{aligned}
\pi(x)\dot\rho_t(x)
&=
\sum_y\bigl[\rho_t(y)\pi(y)K(y,x)-\rho_t(x)\pi(x)K(x,y)\bigr]\\
&=
\pi(x)\sum_yK(x,y)\bigl(\rho_t(y)-\rho_t(x)\bigr).
\end{aligned}
$$
Thus
$$
\dot\rho_t(x)=\sum_yK(x,y)(\rho_t(y)-\rho_t(x)).
$$
Differentiating the relative entropy yields
$$
\frac d{dt}D(\mu_t\Vert\pi)
=
\sum_x\pi(x)(1+\log\rho_t(x))\dot\rho_t(x).
$$
The contribution of $1$ vanishes because $\sum_x\pi(x)\dot\rho_t(x)=d(\sum_x\mu_t(x))/dt=0$. Substitution of the preceding evolution equation gives
$$
\frac d{dt}D(\mu_t\Vert\pi)
=
\sum_{x,y}\pi(x)K(x,y)
\log\rho_t(x)\bigl(\rho_t(y)-\rho_t(x)\bigr).
$$
Interchanging $x$ and $y$ in one copy of this sum and using $\pi(x)K(x,y)=\pi(y)K(y,x)$ gives
$$
\frac d{dt}D(\mu_t\Vert\pi)
=
-\frac12\sum_{x,y}\pi(x)K(x,y)
(\rho_t(y)-\rho_t(x))
(\log\rho_t(y)-\log\rho_t(x)).
$$
Because the logarithm is strictly increasing, every summand after the minus sign is nonnegative. Equality forces $\rho_t(x)=\rho_t(y)$ on every positive-rate edge. Irreducibility makes $\rho_t$ constant on $X$, and normalization then gives $\rho_t\equiv1$, equivalently $\mu_t=\pi$. Conversely, $\mu_t=\pi$ makes every summand zero. ∎

**Definition D.6.5c (Predictive Free-Energy Envelope Certificate $\mathfrak C_{\mathrm{Pred2}}$).** On a retained PCE branch define the predictive free energy by
$$
F_{\mathrm{pred}}(x):=-V(x)
$$
after the additive normalization of $V$ has been fixed. A predictive-envelope certificate is a finite record
$$
\mathfrak C_{\mathrm{Pred2}}
=
(F_{\mathrm{pred}},\mathcal L_t,\mathcal X_{\mathrm{viab}},\mathcal S_{\mathrm{sel}},\mathcal I_{\mathrm{inh}},\mathcal A_{\mathrm{arch}},\mathcal H_{\mathrm{DB}},\text{coarse-graining window},\text{forward lock}),
$$
where $\mathcal L_t$ is the finite lineage or learning-trajectory ensemble under comparison, $\mathcal X_{\mathrm{viab}}$ is the retained viability set $PP\in(\alpha,\beta)$, $\mathcal S_{\mathrm{sel}}$ is the selection/removal rule for sub-viable branches, $\mathcal I_{\mathrm{inh}}$ records inheritance or model-copy maps, $\mathcal A_{\mathrm{arch}}$ records whether the reported envelope is an archive/running supremum or an instantaneous survivor supremum, and $\mathcal H_{\mathrm{DB}}$ records the detailed-balance or Lyapunov hypotheses used for monotonicity. The running viable envelope is
$$
\widehat F_{\max}(t)
:=
\sup\{F_{\mathrm{pred}}(x_\ell(s)):
0\le s\le t,
\ell\in\mathcal L_s,
 x_\ell(s)\in\mathcal X_{\mathrm{viab}}
\}.
$$
The instantaneous survivor envelope $F_{\max}(t)$ is obtained by restricting the supremum to $s=t$.

**Proposition D.6.5d (Second-Law-of-Prediction Status).** On a branch carrying $\mathfrak C_{\mathrm{Pred2}}$, the following are the theorem-level monotonicity statements and no stronger ones.

1. Wherever Lemma D.5 or Theorem D.5 gives $\frac{d}{dt}\mathbb E[V(x_t)]\le0$ on the recorded window, the same window satisfies
$$
\frac{d}{dt}\mathbb E[F_{\mathrm{pred}}(x_t)]\ge0.
$$
On a finite detailed-balance reduction in which $H_{\mathrm{PCE}}=D(\mu_t\Vert\pi)$ is the retained free-cost coordinate, Theorem D.6.5a gives monotone decrease of that coordinate and hence monotone increase of its negative.
2. The running viable envelope $\widehat F_{\max}(t)$ is nondecreasing by its definition. The instantaneous survivor envelope $F_{\max}(t)$ is nondecreasing only when $\mathcal I_{\mathrm{inh}}$ and $\mathcal A_{\mathrm{arch}}$ certify that the previously best viable retained structure is inherited, archived, or otherwise not removed from the reported survivor class.
3. Equality means stationarity or no new certified envelope increase on the recorded branch. The proposition does not say that every lineage improves, does not identify $F_{\mathrm{pred}}$ with raw thermodynamic entropy, and does not prove open-ended non-saturation without a separate unbounded-opportunity or noncompact-task certificate.

*Proof.* Item 1 is the identity $F_{\mathrm{pred}}=-V$ applied to the Lyapunov drift inequality, together with Theorem D.6.5a on the finite detailed-balance coordinate. Item 2 follows from the supremum over the larger time interval $[0,t]$ for the running envelope; the instantaneous version requires the explicit no-loss or archive entry because stochastic extinction or removal of the current best lineage can otherwise lower the instantaneous maximum. Item 3 is the status audit: monotonicity of an expectation or of a running supremum is weaker than monotonic improvement of every trajectory and does not by itself supply a domain mechanism for endless novelty. ∎

**Remark D.6.5e (Evolution, Learning, and Cosmic Structure as Projections).** When $\mathfrak C_{\mathrm{Pred2}}$ is instantiated by a biological lineage ensemble, a learning system, or a cosmological structure-formation ledger, Proposition D.6.5d permits the common phrase “second law of prediction” for the covered envelope. The branch input is the finite certificate that the same $F_{\mathrm{pred}}$ ledger, viability cut, inheritance/archive rule, and coarse-graining window are being compared. Without that record, the statement remains an analogy to PCE descent rather than a law-level conclusion.

**Theorem D.6.5b (Regular Morse--Smale Basin Decomposition of Deterministic PCE Flow).** Let $\mathcal X$ be a compact smooth Riemannian manifold without boundary, let $V_{\mathrm{PCE}}\in C^2(\mathcal X)$ be Morse, and assume the negative-gradient flow
$$
\dot x
=
-\nabla V_{\mathrm{PCE}}(x)
$$
is Morse--Smale. Then
$$
\mathcal X
=
\bigsqcup_{c\in\mathrm{Crit}(V_{\mathrm{PCE}})}W^s(c).
$$
For every set $A$ of local minima,
$$
\mathcal B(A)
:=
\{x:\omega(x)\subseteq A\}
=
\bigsqcup_{a\in A}W^s(a).
$$
The basin $\mathcal B(A)$ is open, and
$$
\partial\mathcal B(A)
\subseteq
\bigsqcup_{\substack{c\in\mathrm{Crit}(V_{\mathrm{PCE}})\\
\operatorname{ind}(c)>0}}
W^s(c).
$$
If $[u,v]$ contains no critical value, the sublevel sets $\{V_{\mathrm{PCE}}\le u\}$ and $\{V_{\mathrm{PCE}}\le v\}$ are diffeomorphic. Crossing a critical value containing critical points of indices $\lambda_1,\ldots,\lambda_k$ changes the sublevel by attachment of the corresponding $\lambda_j$-handles.

For the small-noise diffusion
$$
dX_t
=
-\nabla V_{\mathrm{PCE}}(X_t)\,dt
+
\sqrt{2\theta}\,dW_t,
$$
the Freidlin--Wentzell action is
$$
I_T(\phi)
=
\frac14\int_0^T
\left|\dot\phi+\nabla V_{\mathrm{PCE}}(\phi)\right|^2dt.
$$
If $a$ is a local minimum and $B$ is a target set outside its basin, define
$$
H(a,B)
:=
\inf_{\phi(0)=a,\ \phi(T)\in B}
\max_{0\le t\le T}V_{\mathrm{PCE}}(\phi(t)).
$$
Then the quasipotential obeys
$$
\mathcal Q(a,B)
\ge
H(a,B)-V_{\mathrm{PCE}}(a).
$$

For a Morse--Bott potential the analogous decomposition is indexed by connected critical submanifolds, $A$ must be a union of complete minimum components, and crossing a critical value attaches the disk bundle of the negative normal bundle rather than an individual handle.

*Proof.* Compactness and absence of boundary make the gradient flow complete. Along every trajectory,
$$
\frac{d}{dt}V_{\mathrm{PCE}}(x(t))
=
-|\nabla V_{\mathrm{PCE}}(x(t))|^2
\le0.
$$
Thus $V_{\mathrm{PCE}}(x(t))$ converges and every omega-limit point is critical: if $|\nabla V_{\mathrm{PCE}}|$ were bounded below on a neighborhood of an omega-limit point, each return to that neighborhood would decrease $V_{\mathrm{PCE}}$ by a uniform positive amount, contradicting convergence. A Morse function on a compact manifold has finitely many critical points, while an omega-limit set is connected; hence every trajectory converges to one critical point. This proves the disjoint stable-manifold decomposition and the formula for $\mathcal B(A)$.

At a local minimum the Hessian is positive definite, so the minimum has an attracting neighborhood. If $x\in W^s(a)$, continuity of the time-$T$ flow map carries a neighborhood of $x$ into that attracting neighborhood for sufficiently large $T$. Hence every $W^s(a)$ for a minimum is open. If $x\in\partial\mathcal B(A)$ and $x\in W^s(c)$, then $c$ cannot be a minimum in $A$, because $x$ would be interior to $\mathcal B(A)$; it cannot be a minimum outside $A$, because $x$ would be interior to the complement. Therefore $c$ is nonminimal and $\operatorname{ind}(c)>0$, proving the frontier inclusion. The stable-manifold and transverse-intersection hypotheses are those of Smale's gradient-system theorem (Smale 1961, *Annals of Mathematics* 74, 199--206).

The no-critical-value diffeomorphism theorem and the handle-attachment theorem apply because $\mathcal X$ is compact without boundary and $V_{\mathrm{PCE}}$ is Morse; these are the hypotheses of Milnor's Morse theory theorem (Milnor 1963, *Morse Theory*, Princeton University Press). The Morse--Bott lemma gives the stated negative-normal-bundle attachment for a critical submanifold.

For every absolutely continuous path,
$$
\begin{aligned}
I_T(\phi)
&=
\frac14\int_0^T
|\dot\phi-\nabla V_{\mathrm{PCE}}(\phi)|^2dt
+
\int_0^T
\langle\dot\phi,\nabla V_{\mathrm{PCE}}(\phi)\rangle dt\\
&=
\frac14\int_0^T
|\dot\phi-\nabla V_{\mathrm{PCE}}(\phi)|^2dt
+
V_{\mathrm{PCE}}(\phi(T))-V_{\mathrm{PCE}}(a).
\end{aligned}
$$
Applying the same identity up to the first time the path reaches its maximum potential gives
$$
I_T(\phi)
\ge
\max_tV_{\mathrm{PCE}}(\phi(t))-V_{\mathrm{PCE}}(a)
\ge
H(a,B)-V_{\mathrm{PCE}}(a).
$$
Taking the infimum over all admissible paths proves the quasipotential bound. ∎

## D.7 Formal Justification of Theorems 2 and 43

The results derived in this appendix provide conditional dynamical justifications for Theorems 2 and 43 under their faithful-identifiability, comparison, regularity, and stochastic hypotheses. They are not necessary consequences of the bare optimization grammar. The convergence from the discrete MPU network to a continuum description governed by a standard action is likewise conditional on the hypotheses of the following theorem.

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

**Theorem D.6 (Conditional Gamma-Convergence Fundamental Theorem).** Let the varying-space realization be metrizable, let $\mathcal F_h$ and $\mathcal F$ be proper extended-real functionals, and assume $\inf_h\inf\mathcal F_h> -\infty$. Assume the sequential Gamma-liminf and recovery inequalities and equicoercivity, and assume $\mathcal F(x_0)<\infty$ for at least one $x_0$. Then
$$
\mathcal F_h\xrightarrow{\Gamma}\mathcal F,\qquad\lim_{h\downarrow0}\inf\mathcal F_h=\min\mathcal F.
$$
Every sequence satisfying $\mathcal F_h(x_h)-\inf\mathcal F_h\to0$ has convergent subsequences, and every cluster point minimizes $\mathcal F$. Identification of $\mathcal F$ with a displayed continuum action requires separate liminf and recovery proofs; an unconstrained Lorentzian Einstein--Hilbert expression is not generally coercive or bounded below.

*Proof.* Write $m_h:=\inf\mathcal F_h$. A recovery sequence $x_{0,h}\to x_0$ gives
$$
\limsup_{h\downarrow0}m_h
\le
\limsup_{h\downarrow0}\mathcal F_h(x_{0,h})
\le
\mathcal F(x_0)<\infty.
$$
Together with $\inf_hm_h> -\infty$, this bounds the energies of every sequence $x_h$ satisfying $\mathcal F_h(x_h)\le m_h+o(1)$. Equicoercivity therefore gives a convergent subsequence $x_{h_j}\to x$.

Choose the indices $h_j$ so that $m_{h_j}\to\liminf_{h\downarrow0}m_h$ and choose $x_{h_j}$ with $\mathcal F_{h_j}(x_{h_j})\le m_{h_j}+1/j$. The liminf inequality yields
$$
\mathcal F(x)
\le
\liminf_{j\to\infty}\mathcal F_{h_j}(x_{h_j})
=
\liminf_{h\downarrow0}m_h.
$$
For every $y$ with $\mathcal F(y)<\infty$, a recovery sequence $y_h\to y$ gives
$$
\limsup_{h\downarrow0}m_h
\le
\limsup_{h\downarrow0}\mathcal F_h(y_h)
\le
\mathcal F(y).
$$
The two inequalities imply $\mathcal F(x)\le\mathcal F(y)$ for every admissible $y$; hence $x$ minimizes $\mathcal F$. They also give
$$
\min\mathcal F
\le
\liminf_{h\downarrow0}m_h
\le
\limsup_{h\downarrow0}m_h
\le
\min\mathcal F,
$$
where the last inequality uses a recovery sequence for $x$. Thus $m_h\to\min\mathcal F$.

Finally, let $z_h$ be any approximate-minimizer sequence. Its energies are bounded, so equicoercivity gives a convergent subsequence $z_{h_j}\to z$. The liminf inequality and convergence of $m_h$ give
$$
\mathcal F(z)
\le
\liminf_{j\to\infty}\mathcal F_{h_j}(z_{h_j})
=
\min\mathcal F.
$$
Therefore every cluster point $z$ minimizes $\mathcal F$. ∎

**D.6bis Cell-Averaged Closure of the Variational Limit**

**Theorem D.6b (Cell-Averaged Curvature Closure).** Let $U\Subset M$ be a precompact chart domain, equip the admissible metric realizations with the declared metrizable local topology, and assume $R_g\in L^1(U,dV_g)$ for every admissible limit metric $g$. Let
$$
\mathcal F^{\mathrm{curv}}_{h,U}[g_h]
:=
\alpha_h\sum_{v\in V_h(U)}\mu_h(v)R_h(v;g_h),
\qquad
\alpha_h\to\alpha\in\mathbb R.
$$
Assume the following universal consistency condition: whenever $g_h\to g$ and
$$
\liminf_{h\downarrow0}\mathcal F^{\mathrm{curv}}_{h,U}[g_h]<\infty,
$$
there are compatible quasi-uniform cells $\{C_v^{(h)}\}$, covering $U$ up to a null set and satisfying $\mu_h(v)=\int_{C_v^{(h)}}dV_g$, for which
$$
\sum_v\mu_h(v)
\left|
R_h(v;g_h)
-
\frac{1}{\mu_h(v)}\int_{C_v^{(h)}}R_g\,dV_g
\right|
\longrightarrow0.
$$
Assume also that every admissible $g$ with finite $\mathcal F_U^{\mathrm{curv}}[g]:=\alpha\int_UR_g\,dV_g$ has a recovery discretization $I_hg\to g$ satisfying the same estimate. Then
$$
\mathcal F^{\mathrm{curv}}_{h,U}
\xrightarrow{\Gamma}
\mathcal F^{\mathrm{curv}}_U
$$
in the declared local topology. Moreover, the curvature actions converge along every convergent sequence covered by the universal consistency condition.

*Proof.* For such a sequence define
$$
\overline R_g^{(h)}(v)
:=
\frac{1}{\mu_h(v)}\int_{C_v^{(h)}}R_g\,dV_g.
$$
The cell partition gives $\sum_v\mu_h(v)\overline R_g^{(h)}(v)=\int_UR_g\,dV_g$, and hence
$$
\begin{aligned}
\left|
\mathcal F^{\mathrm{curv}}_{h,U}[g_h]
-
\alpha\int_UR_g\,dV_g
\right|
&\le
|\alpha_h|
\sum_v\mu_h(v)|R_h(v;g_h)-\overline R_g^{(h)}(v)|\\
&\quad+
|\alpha_h-\alpha|
\left|\int_UR_g\,dV_g\right|.
\end{aligned}
$$
Both terms tend to zero. This proves the liminf inequality whenever its left side is finite; when it is infinite the liminf inequality is automatic. Applying the same computation to $I_hg$ proves the recovery inequality. These are the two defining inequalities of Γ-convergence. ∎

**Corollary D.6b.1 (Volume-Term Closure).** Suppose compatible cells cover $U$ up to a null set, $\mu_h(v)=\int_{C_v^{(h)}}dV_g$, and $\beta_h\to\beta$. Then
$$
\mathcal V_{h,U}[g_h]
:=
\beta_h\sum_v\mu_h(v)
\longrightarrow
\beta\int_UdV_g
$$
along every admissible convergent sequence, and the associated liminf and recovery inequalities hold.

*Proof.* The cell identity gives $\sum_v\mu_h(v)=\int_UdV_g$; multiplication by $\beta_h\to\beta$ gives the conclusion. ∎

**Theorem D.6c (Cell-Averaged Matter Closure).** Equip pairs $(g,\phi)$ with the declared metrizable local topology and assume $\mathcal L_{\mathrm{MPU}}(g,\phi)\in L^1(U,dV_g)$. Define
$$
\mathcal F^{\mathrm{MPU}}_{h,U}[g_h,\phi_h]
:=
\sum_v\mu_h(v)\ell_h(v;g_h,\phi_h).
$$
Assume that for every convergent sequence $(g_h,\phi_h)\to(g,\phi)$ with finite liminf matter action there are compatible cells for which
$$
\sum_v\mu_h(v)
\left|
\ell_h(v;g_h,\phi_h)
-
\frac{1}{\mu_h(v)}
\int_{C_v^{(h)}}\mathcal L_{\mathrm{MPU}}(g,\phi)\,dV_g
\right|
\longrightarrow0,
$$
and assume a recovery discretization satisfying this estimate for every finite-energy pair $(g,\phi)$. Then
$$
\mathcal F^{\mathrm{MPU}}_{h,U}
\xrightarrow{\Gamma}
\int_U\mathcal L_{\mathrm{MPU}}(g,\phi)\,dV_g.
$$

*Proof.* Summing the cell averages gives the continuum integral. The triangle inequality proves convergence on every finite-liminf sequence covered by the hypothesis, while infinite-liminf sequences satisfy the liminf inequality automatically. The declared recovery discretization proves the limsup inequality. ∎

**Corollary D.6c.1 (Predictive-Action Additive Closure).** Assume the hypotheses of Theorem D.6b, Corollary D.6b.1, and Theorem D.6c, assume their componentwise liminf inequalities hold on the same topology, assume they admit a common recovery discretization, and assume the summed functionals are equicoercive. Then
$$
\mathcal F_{h,U}
:=
\mathcal F^{\mathrm{curv}}_{h,U}
+
\mathcal V_{h,U}
+
\mathcal F^{\mathrm{MPU}}_{h,U}
\xrightarrow{\Gamma}
\alpha\int_UR_g\,dV_g
+
\beta\int_UdV_g
+
\int_U\mathcal L_{\mathrm{MPU}}\,dV_g,
$$
and every approximate-minimizer sequence has convergent subsequences whose cluster points minimize the limit functional.

*Proof.* Adding the three componentwise liminf inequalities gives the liminf inequality for $\mathcal F_{h,U}$. Evaluating all three summands on the common recovery discretization gives the limsup inequality. Equicoercivity and Theorem D.6 give the assertion about approximate minimizers. ∎

**Theorem D.6d (Signature-Qualified Einstein--Hilbert + MPU $\Gamma$-Limit).** Assume Corollary D.6c.1 on an equicoercive positive-definite Riemannian branch. Assume also a signature bridge identifying its two gravitational coefficients with the four-dimensional Wald/diffeomorphism normalization of Theorem 12.1a. Then
$$
\alpha
=
\frac{c^3}{16\pi G},
\qquad
\beta
=
-\frac{c^3\Lambda}{8\pi G},
$$
and the Riemannian $\Gamma$-limit is
$$
\mathcal F_E[g,\phi]
=
\frac{c^3}{16\pi G}
\int_M(R_g-2\Lambda)\,dV_g
+
\int_M\mathcal L_{\mathrm{MPU}}(g,\phi)\,dV_g.
$$
Every approximate-minimizer sequence covered by the common equicoercivity hypothesis has subsequences converging to minimizers of $\mathcal F_E$.

Under the same signature bridge, the coefficient correspondence gives the Lorentzian action
$$
\mathcal S_L[g,\phi]
=
\frac{c^3}{16\pi G}
\int_M(R_g-2\Lambda)\sqrt{-g}\,d^4x
+
\int_M\mathcal L_{\mathrm{MPU}}(g,\phi)\sqrt{-g}\,d^4x.
$$
This coefficient correspondence does not assert Lorentzian Γ-convergence or convergence of Lorentzian minimizers. In the vacuum-absorbed convention of Corollary B.8d.2, the constant term is absorbed geometrically and $\Lambda$ occurs as an integration constant in §12.

*Proof.* Corollary D.6c.1 gives the Riemannian limit
$$
\alpha\int_MR_g\,dV_g
+
\beta\int_MdV_g
+
\int_M\mathcal L_{\mathrm{MPU}}\,dV_g.
$$
Substitution of the two coefficient identities yields $\mathcal F_E$. The common equicoercivity hypothesis and Theorem D.6 give the Riemannian minimizer conclusion. The signature bridge transfers the coefficients to $\mathcal S_L$, but no compactness or lower-bound inference is made for the Lorentzian functional. ∎

**Theorem D.6e (Conditional Mosco–Cheeger Closure of the Spatial Sector).** Let $(X_n,d_n,\mu_n)$ be the rescaled MPU network metric-measure spaces on the geometric branch, and let the rescaled propagation-cost Dirichlet forms be
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
Assume an independent continuum-bridge certificate supplies a competitor sequence in $\mathcal M_n$ with $\mathfrak d_n^*\to0$; Theorem C.6e supplies only the fixed-trace shell-isotropy and shell-tensor rank statement. Then every global minimizer $\mathcal C_n^*$ of $V_n^{\mathrm{cont}}$ satisfies
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
Assume, relative to the declared measured-Gromov--Hausdorff identifications, that weak convergence $f_n\rightharpoonup f$ implies
$$
\mathcal E_\infty(f)\le\liminf_{n\to\infty}\mathcal E_n(f_n),
$$
and that every $f$ admits $f_n\to f$ strongly with
$$
\limsup_{n\to\infty}\mathcal E_n(f_n)\le\mathcal E_\infty(f).
$$
Assume also that $\mathcal E_\infty$ is the closed quadratic strongly local regular Cheeger energy. Then $\mathcal E_n$ Mosco-converges to $\mathcal E_\infty$ relative to those identifications. The defect condition $\mathfrak D_n\to0$ alone implies neither Mosco inequality nor the candidate-form identification.

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

The defect estimates select a candidate branch but do not prove the two Mosco inequalities. Under the additional liminf and recovery hypotheses above, Mosco convergence follows by definition; the separately assumed candidate-form identification gives the strongly local regular Cheeger-energy conclusion. ∎

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

**Proposition D.6f.2a (Protocol-Response Domination Criterion for the Global-Core Competitor).** Let $d_{\mathrm{resp},n}$ be the declared distance between finite protocol-response presheaves. Suppose that the core potential $V_n$ factors through those responses up to $o(1)$. Assume in addition a defect-stable minimizer-selection certificate: there are nondecreasing moduli $\omega_n:[0,\infty)\to[0,\infty)$ such that
$$
\lim_{\varepsilon\downarrow0}\limsup_{n\to\infty}\omega_n(\varepsilon)=0,
$$
and whenever an admissible configuration $Y$ satisfies
$$
\inf_{Z\in\mathcal M_n}
d_{\mathrm{resp},n}(Y,Z)
\le
\varepsilon,
$$
there exists $P_nY\in\mathcal M_n$ with
$$
\mathfrak D_n(P_nY)
\le
\mathfrak D_n(Y)+\omega_n(\varepsilon).
$$
Suppose there are $D_4$ shell approximants $Y_n$ and numbers $\varepsilon_n\downarrow0$ such that
$$
\mathfrak D_n(Y_n)\to0,
\qquad
\inf_{Z\in\mathcal M_n}
d_{\mathrm{resp},n}(Y_n,Z)
\le
\varepsilon_n.
$$
Then
$$
\mathfrak d_n^*
=
\inf_{\mathcal C\in\mathcal M_n}
\mathfrak D_n(\mathcal C)
\longrightarrow0.
$$

*Proof.* Apply the selection certificate to $Y_n$ and choose $\widehat Y_n:=P_nY_n\in\mathcal M_n$. Then
$$
0
\le
\mathfrak d_n^*
\le
\mathfrak D_n(\widehat Y_n)
\le
\mathfrak D_n(Y_n)+\omega_n(\varepsilon_n).
$$
The first term on the right tends to zero by hypothesis. The modulus condition and $\varepsilon_n\downarrow0$ give $\omega_n(\varepsilon_n)\to0$ along the selected branch. Hence $\mathfrak d_n^*\to0$. ∎

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

**Theorem 44a (Quantitatively Regular Branch Manifold Closure).** Assume the hypotheses of Theorem C.6c and the Mosco-liminf, recovery, and candidate-form identification hypotheses of Theorem D.6e. Let $X_{\mathrm{reg}}$ be the set of points $x\in X$ for which there are $r_x>0$, $C_x<\infty$, and $\alpha\in(0,1)$ such that every $y\in B_{r_x}(x)$ and every $r\in(0,r_x]$ admit compatible harmonic-coordinate charts along the approximating sequence with
$$
\limsup_{n\to\infty}
\left[
\frac{d_{GH}(B_r(y),B_r^{\mathbb R^4})}{r}
+
\left|
\frac{\mu_n(B_r(y))}{\omega_4r^4}-1
\right|
+
\mathrm{HarmEx}_n(y,r)
\right]
\le
C_xr^\alpha.
$$
Assume in those charts that the metric coefficients are uniformly elliptic, uniformly bounded in $C^{1,\alpha}$ on compact subcharts, and converge together with the quadratic energy coefficients. Then $X_{\mathrm{reg}}$ is open, every point of $X_{\mathrm{reg}}$ has unique tangent cone $\mathbb R^4$, and $X_{\mathrm{reg}}$ carries a $C^{1,\alpha}$ Riemannian metric $h_{ij}$ satisfying
$$
d\mu
=
\sqrt{\det h}\,d^4x,
\qquad
\mathcal E_\infty(f)
=
\int_{X_{\mathrm{reg}}}
h^{ij}\partial_i f\,\partial_j f\,
\sqrt{\det h}\,d^4x
$$
for every compactly supported Lipschitz function $f$ in a regular chart.

The metric $h$ in this theorem is a four-dimensional Riemannian auxiliary metric. Corollary O.7b.1 supplies a four-dimensional Lorentzian principal symbol only on its independent causal branch. If that branch also supplies a compatible $3+1$ foliation, a lapse $a\in C^{1,\alpha}$ satisfying $a>0$, vanishing shift, and a three-dimensional induced metric $\gamma_{ab}\in C^{1,\alpha}$, then its local Lorentzian metric has the form
$$
g
=
-a(x)^{-1}dt^2
+
\gamma_{ab}dx^adx^b,
\qquad a,b\in\{1,2,3\}.
$$

*Proof.* The defining quantitative certificate holds uniformly throughout $B_{r_x}(x)$, so each such ball is contained in $X_{\mathrm{reg}}$; hence $X_{\mathrm{reg}}$ is open. Dividing the first estimate by the scale and sending $r\downarrow0$ shows that every rescaled ball converges to the Euclidean unit ball, independently of the chosen sequence of scales. Thus the tangent cone is uniquely $\mathbb R^4$.

Uniform ellipticity and the local $C^{1,\alpha}$ bounds give, by Arzelà--Ascoli on nested compact subcharts, limiting coefficients $h_{ij}\in C^{1,\alpha}$. Compatibility of the harmonic charts makes these coefficients a Riemannian metric. The volume-ratio convergence and convergence of the chart measures identify the limit measure with $\sqrt{\det h}\,d^4x$. The Mosco liminf and recovery inequalities identify $\mathcal E_\infty$ with the candidate quadratic form, while convergence of its chart coefficients gives the displayed integral for compactly supported $f$. On the independent causal branch, the $3+1$ foliation has one time coordinate and three spatial coordinates. Positivity of $a$ and positive-definiteness of $\gamma$ therefore give signature $(-,+,+,+)$. ∎

**Remark D.6.1 (PU motivation for hypotheses).**
(i) Theorem C.5 proves non-viability only on a registered quantitative branch where a super-linear-distance coherence certificate, a non-amortized traffic and budget certificate, a strong-convexity variance-cost certificate, or an independent-failure certificate yields a strict GC, RE, or LV inequality. Failure of Definition C.1 or C.2 alone gives no such conclusion. In the low-noise detailed-balance subcase of Theorem D.5, any potential gap established by one of those certificates produces exponentially larger stationary weight for the lower-potential sector. Equicoercivity for $\Gamma$-convergence remains a separate hypothesis and is not implied by the qualitative geometric definitions [Gromov 1999].
(ii) Remark C.3.3a supplies, conditional on the weighted-shell/local-isotropy bridge input or an equivalent replacement, an explicit local scalar curvature estimator built from Ollivier-Ricci curvature at mesh scale $h$, providing a concrete realization of the locality/consistency requirement for the Einstein-Hilbert term at the action level. It does not by itself furnish the Mosco/quadratic limit-energy or Euclidean-rigidity input used later in Section 11.4.
(iii) Appendix E derives the thermodynamic area law and fixes the emergent gravitational constant $G$ (Theorem E.6), providing the normalization invoked in (iii).

**Remark D.6.2 (Location of the Variational Hypotheses).** The variational conclusion uses three logically distinct entries. Theorems D.6b and D.6c supply the componentwise liminf inequalities on every relevant convergent sequence. Corollary D.6c.1 assumes a common recovery discretization and equicoercivity of the summed functional. Under those entries, adding the componentwise liminf inequalities and evaluating the sum on the common recovery discretization proves Γ-convergence; Theorem D.6 then proves convergence of minimum values and the cluster-point statement for approximate minimizers. The continuum-control defects of Theorem D.6e do not replace any of these entries.

This appendix thus provides the variational and action-level part of the PU dynamical bridge. The Mosco/quadratic limit-energy step and branch-specific Euclidean-rigidity input are encoded in the continuum-control defects of Theorem D.6e and selected only on the vanishing-defect operational branch; the AQFT coarse-graining closure remains the separate Appendix F bridge.

**Summary of Theorem 2 (Conditional Dynamical Functional Correspondence):**
The exact equilibrium statement of Theorem 2 is Corollary D.1 on its faithful-cost-identifiability branch. Lemma D.2, Proposition D.1, and Corollary D.2 give the registered work-cost feedback and its noise-floor estimate under their measurement, drift, and martingale hypotheses. Theorem D.5 identifies long-run averages with invariant-measure expectations under (A1)–(A6); its detailed-balance subbranch gives low-noise concentration near the global-minimum set. Calling that set regular additionally requires the strict-comparison hypothesis of Theorem D.3.

*Proof Reference:* Corollary D.1 supplies exact alignment on its stated branch. Lemma D.2, Proposition D.1, and Corollary D.2 supply the conditional tracking chain. Theorem D.5 supplies ergodic averaging and detailed-balance concentration. Theorem D.3 supplies regularity only under strict comparison.

**Summary of Theorem 43 (Geometric Regularity on the Strict-Comparison Branch):**
Under (A1)–(A6), Equation (D.8) has the ergodic stationary regime of Theorem D.5. Under detailed balance, its low-noise invariant measures concentrate near the global-minimum set of $V$. If every irregular admissible configuration has a regular equal-proxy comparator with strictly smaller core potential, Theorem D.3 makes every such global minimizer geometrically regular. Without that comparison premise, Theorem D.5 still gives concentration near global minimizers but does not identify their geometry.

*Proof Reference:* Theorem D.5 gives ergodicity and conditional Gibbs concentration. The strict-comparison hypothesis followed by Theorem D.3 gives regularity of the minimizer set. ∎


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
Conversely, for any $\varepsilon>0$, the strict sublevel set
$$
U_\varepsilon
:=
\{x\in\Sigma_C:V(x)<m_C+\varepsilon\}
$$
is nonempty and relatively open in $\Sigma_C$. Full support therefore gives $\sigma_C(U_\varepsilon)>0$. Since $V(x)<m_C+\varepsilon$ on $U_\varepsilon$,
$$
\int_{\Sigma_C}e^{-V/\theta}\,d\sigma_C
\ge
e^{-(m_C+\varepsilon)/\theta}\sigma_C(U_\varepsilon),
$$
and hence
$$
-\theta\ln\int_{\Sigma_C}e^{-V/\theta}\,d\sigma_C
\le
m_C+\varepsilon-\theta\ln\sigma_C(U_\varepsilon).
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

**Theorem D.7 (Existence, Uniqueness, and Stability of Optimal Complexity).**
Let the viable complexity range be a compact interval $[C_-,C_+]$. Assume $\Psi\in C^1([C_-,C_+])$, DSC gives $\Psi'(C)<0$ throughout the interval, and
$$
\Psi(C_-)>0,
\qquad
\Psi(C_+)<0.
$$
Then there is a unique $C^\star\in(C_-,C_+)$ such that $\Psi(C^\star)=0$. It is the unique global minimizer of $V_{\mathrm{eff}}$, and
$$
\Psi(C)>0\quad(C<C^\star),
\qquad
\Psi(C)<0\quad(C>C^\star).
$$
Every solution of $\dot C=\eta_{\mathrm{adapt}}\Psi(C)$ with $C(0)\in[C_-,C_+]$ and $\eta_{\mathrm{adapt}}>0$ remains in the interval and converges to $C^\star$.

*Proof.* Continuity and the endpoint signs give at least one zero by the intermediate value theorem. Strict decrease of $\Psi$ makes the zero unique and gives the two sign statements. Since
$$
V_{\mathrm{eff}}''(C)=-\Psi'(C)>0,
$$
$V_{\mathrm{eff}}$ is strictly convex, so its unique critical point is its unique global minimizer on the interval. At $C_-$ the vector field points inward and at $C_+$ it points inward, so the interval is positively invariant. Along any nonstationary solution,
$$
\frac d{dt}V_{\mathrm{eff}}(C(t))
=
-\eta_{\mathrm{adapt}}\Psi(C(t))^2<0.
$$
Monotonicity of the scalar vector field makes a solution below $C^\star$ increase without crossing it and a solution above $C^\star$ decrease without crossing it. In either case the limit exists; continuity of $\Psi$ forces the limit to be its unique zero $C^\star$. ∎

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
Let $I=[C_-,C_+]$ be the invariant viable interval of Theorem D.7 and assume throughout $I$ that
$$
0<\underline\lambda
\le
V_{\mathrm{eff}}''(C)
\le
L_{\mathrm{eff}}<\infty.
$$

**Part I (Deterministic Rate).** Every deterministic solution of (D.13) with $C(0)\in I$ satisfies
$$
|C(t)-C^\star|
\le
e^{-\underline\lambda\eta_{\mathrm{adapt}}t}|C(0)-C^\star|.
\tag{D.15}
$$

**Part II (Stochastic Rate with Noise Floor).** Assume that the complexity coordinate is an Itô diffusion on $I$,
$$
dC_t
=
\eta_{\mathrm{adapt}}\Psi(C_t)dt
+
\sqrt{2D_{CC}(x(t))}\,dB_t,
$$
with boundary behavior making $I$ invariant and producing no boundary local-time term in Itô's formula for $V_{\mathrm{eff}}$ (for example, $D_{CC}=0$ at the endpoints with inward drift), and with
$$
0\le D_{CC}(x)\le D_{CC}^{\max}<\infty.
$$
Then
$$
\mathbb E\bigl[V_{\mathrm{eff}}(C_t)-V_{\mathrm{eff}}(C^\star)\bigr]
\le
e^{-2\underline\lambda\eta_{\mathrm{adapt}}t}
\bigl(V_{\mathrm{eff}}(C_0)-V_{\mathrm{eff}}(C^\star)\bigr)
+
\frac{D_{CC}^{\max}L_{\mathrm{eff}}}{2\underline\lambda\eta_{\mathrm{adapt}}}
\left(1-e^{-2\underline\lambda\eta_{\mathrm{adapt}}t}\right).
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

**Noise Floor:** The residual fluctuations $\sigma_{eff}$ arise from the underlying ND-RID irreversibility ($\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)\quad\text{on a registered reset branch}$, Theorem 31). The noise floor is typically small:

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

**Theorem D.8a (Spectral Exponent from the PCE Relaxation Density).** Let the centered observable be a superposition of stationary modes satisfying Lemma D.8a, and assume distinct modes have zero cross spectrum, equivalently
$$
\mathbb E[y_\lambda(t+\tau)y_{\lambda'}(t)]=0
\qquad(\lambda\ne\lambda',\ \tau\in\mathbb R).
$$
Consider a scaling regime in which
$$
\frac{\lambda_{\min}}{\omega}\to0,
\qquad
\frac{\lambda_{\max}}{\omega}\to\infty,
\tag{D.22}
$$
and suppose
$$
h(\lambda)=A_0\lambda^s(1+r_\omega(\lambda)),
\qquad
-1<s<1,\quad A_0>0,
\tag{D.23}
$$
where $r_\omega(\omega u)\to0$ pointwise and is dominated by an integrable multiple of $u^s/(1+u^2)$ after rescaling.
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
4. among profiles with the same total active weight, the only profile-dependent term in the reduced PCE potential is
$$
V_{\mathrm{spec}}[\rho]
=
\chi D_{\mathrm{KL}}\!\left(\rho\middle\| |I|^{-1}\right)
=
\chi\int_I\rho(u)\log\frac{\rho(u)}{|I|^{-1}}\,du,
\qquad
\chi>0,
$$
where $u=\log\lambda$, $I=[\log\lambda_{\min},\log\lambda_{\max}]$, and $\rho$ is the normalized active profile.

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

**Theorem D.8.6b (Variational Sign of the PCE-Ricci Flow).** Twice the positive $L^2(e^{-f}d\mathrm{vol}_g)$ metric gradient of $\mathcal V_{\mathrm{geom}}$, subject to normalized weighted volume, is
$$
\partial_\tau g_{\mu\nu}
=
-2\left(
\operatorname{Ric}_{\mu\nu}
+
\nabla_\mu\nabla_\nu f
-
\frac{\lambda_{\mathrm{pred}}}{2}T^{\mathrm{pred}}_{\mu\nu}
\right)
+
\chi(\tau)g_{\mu\nu}.
\tag{D.8.6.3}
$$
Equivalently, (D.8.6.3) is negative-gradient flow for $-\mathcal V_{\mathrm{geom}}$. It is not negative-gradient flow for the functional with the sign displayed in (D.8.6.1). For constant $f$,
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

*Proof.* Put $dm=e^{-f}d\mathrm{vol}_g$ and let $h_{\mu\nu}=\delta g_{\mu\nu}$ while varying $f$ so that $dm$ is preserved. Perelman's first-variation formula gives
$$
\delta\int_M(R+|\nabla f|^2)dm
=
-\int_M
(\operatorname{Ric}^{\mu\nu}+\nabla^\mu\nabla^\nu f)
h_{\mu\nu}\,dm.
$$
The stress-tensor convention (D.8.6.2), converted with $\delta g^{\mu\nu}=-h^{\mu\nu}$, gives
$$
\delta\int_M\mathcal U_{\mathrm{pred}}\,dm
=
\frac12\int_M T_{\mathrm{pred}}^{\mu\nu}h_{\mu\nu}\,dm
$$
modulo the scalar normalization direction. Hence the covariant-metric gradient is
$$
-\left(\operatorname{Ric}_{\mu\nu}+\nabla_\mu\nabla_\nu f\right)
+\frac{\lambda_{\mathrm{pred}}}{2}T^{\mathrm{pred}}_{\mu\nu}
+\frac{\chi}{2}g_{\mu\nu}.
$$
Multiplying this positive gradient by $2$ gives (D.8.6.3). Setting $f$ constant gives (D.8.6.4). ∎

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

**Corollary D.8.6f (Finite Entropic-Ricci Limit of PCE Density Flow).** Let $(X_N,L_N,\pi_N)$ be finite detailed-balance PCE generators with entropic Ricci curvature bounded below by $\lambda_N\to\lambda$. Suppose their metric-measure realizations converge to a compact regular metric-measure branch $(M,g,m)$, where $m=e^{-f}d\mathrm{vol}_g$. Assume an energy-dissipation convergence certificate for the finite entropic transport flows: the energies
$$
\mathcal H_N(\rho_N)
=
D(\rho_N\pi_N\Vert\pi_N)
+
\int \mathcal U_{\mathrm{pred},N}\rho_N\,d\pi_N
$$
Γ-converge to
$$
\mathcal H(\rho)
=
\int_M\rho\log\rho\,dm
+
\int_M\mathcal U_{\mathrm{pred}}\rho\,dm,
$$
the initial energies converge, the metric derivatives satisfy the action liminf inequality, the descending slopes satisfy the slope liminf inequality, and the corresponding sublevels are compact. Assume in addition that $\mathcal H$ is proper and lower semicontinuous and that its descending slope is a strong upper gradient on the retained $W_2$ domain; geodesic $\Lambda$-convexity is a sufficient branch condition. Then every convergent subsequence of finite density gradient flows converges to the $W_2$ gradient flow of $\mathcal H$ on the prescribed metric-measure space $(M,g,m)$. Its stationary densities satisfy
$$
\log\rho+1+\mathcal U_{\mathrm{pred}}=\text{constant}
$$
on each connected component on which $\rho>0$.

This conclusion concerns density evolution on $(M,g,m)$. It supplies no evolution equation for $g$ and no tensor equation of the form (D.8.6.5). A continuum limit yielding (D.8.6.3) requires an independent microscopic metric variable together with convergence of its metric action, energy, slopes, and dissipation.

*Proof.* Each finite flow satisfies the energy-dissipation inequality
$$
\mathcal H_N(\rho_N(T))
+
\frac12\int_0^T
\left(
|\dot\rho_N|_N^2
+
|\partial\mathcal H_N|_N^2(\rho_N)
\right)dt
\le
\mathcal H_N(\rho_N(0)).
$$
Sublevel compactness gives a convergent subsequence. Apply the assumed Γ-liminf inequality to the endpoint energy and the two assumed liminf inequalities to the action and slope terms. Convergence of the initial energies yields
$$
\mathcal H(\rho(T))
+
\frac12\int_0^T
\left(
|\dot\rho|_{W_2}^2
+
|\partial\mathcal H|_{W_2}^2(\rho)
\right)dt
\le
\mathcal H(\rho(0)),
$$
which, by the strong-upper-gradient hypothesis, characterizes the retained $W_2$ gradient flow of $\mathcal H$. At stationarity the first variation vanishes subject to $\int\rho\,dm=1$; hence $\log\rho+1+\mathcal U_{\mathrm{pred}}$ equals the Lagrange multiplier on every positive connected component. No step varies $g$, so no metric-flow or tensor-balance conclusion is available. ∎

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

**Definition D.8.7e (Classical Predictive Record Current).** Let $X$ be a finite record alphabet and let $(X_t)_{t\ge0}$ be an irreducible continuous-time Markov jump process with finite rates $k(x,y)$. Let its stationary law $\pi$ satisfy
$$
\sum_x\pi(x)k(x,y)
=
\pi(y)\sum_zk(y,z),
\tag{D.8.7.6}
$$
assume $X_0\sim\pi$, and assume dynamic reversibility,
$$
k(x,y)>0
\quad\Longleftrightarrow\quad
k(y,x)>0.
$$
For an antisymmetric increment $d(x,y)=-d(y,x)$, define
$$
J_T
=
\sum_{0<t\le T}d(X_{t^-},X_t).
\tag{D.8.7.7}
$$
The total steady entropy production is
$$
\Sigma_T
=
T\sum_{x<y}
\left(\pi(x)k(x,y)-\pi(y)k(y,x)\right)
\log
\frac{\pi(x)k(x,y)}{\pi(y)k(y,x)},
\tag{D.8.7.8}
$$
where pairs with both rates zero contribute zero. Irreducibility makes $\pi(x)>0$ for every $x$, and dynamic reversibility makes every remaining logarithm finite.

**Theorem D.8.7f (Predictive Thermodynamic Uncertainty Bound).** Under Definition D.8.7e, for every $T>0$ and every current with $\langle J_T\rangle\ne0$,
$$
\frac{\operatorname{Var}(J_T)}{\langle J_T\rangle^2}\,\Sigma_T
\ge
2,
\tag{D.8.7.9}
$$
or equivalently
$$
\Sigma_T
\ge
2\,\frac{\langle J_T\rangle^2}{\operatorname{Var}(J_T)}.
\tag{D.8.7.10}
$$
The bound applies to a measurement, update, anomaly-ledger, or memory-ledger output only after that output independently satisfies Definition D.8.7e.

*Proof.* The hypotheses are precisely those of the finite-time thermodynamic uncertainty relation of Horowitz and Gingrich (2017, *Physical Review E* 96, 020103): a finite stationary continuous-time Markov jump process and an integrated antisymmetric jump current. Their theorem gives
$$
\operatorname{Var}(J_T)\,\Sigma_T
\ge
2\langle J_T\rangle^2.
$$
Because $\langle J_T\rangle\ne0$, division by its square gives (D.8.7.9). If $\operatorname{Var}(J_T)=0$, the displayed inequality forces $\langle J_T\rangle=0$ whenever $\Sigma_T<\infty$, so the nonzero-mean branch has positive variance and rearrangement gives (D.8.7.10). ∎

**Corollary D.8.7g (TUR Gate for a Classical Readout).** Let a noncommutative finite protocol be read out through a channel
$$
\mathcal M:\mathfrak A\to C(X).
$$
The reported current obeys (D.8.7.9) only when the induced output record independently satisfies Definition D.8.7e: it is a finite irreducible stationary continuous-time Markov jump process and the observable is the registered antisymmetric jump current. Commutativity of $C(X)$ alone implies neither Markovianity nor stationarity.

*Proof.* The independent Definition D.8.7e entry supplies exactly the hypotheses of Theorem D.8.7f; apply that theorem. Without the entry, no TUR conclusion follows. ∎

**Conditional reciprocity identity.** Let $\Psi(\lambda_1,\ldots,\lambda_n)$ be one scalar value function on an open coordinate domain, with $\Psi\in C^2$, and define the response matrix $L_{ab}:=\partial_a\partial_b\Psi$. Then
$$
L_{ab}=L_{ba}
$$
by equality of mixed partial derivatives. A physical response matrix inherits this symmetry only after an accepted bridge identifies its entries with this Hessian in fixed coordinates and controls constraints, contact terms, frame choices, and time-reversal parity. In magnetic or other time-reversal-odd backgrounds the relevant relation may instead be Onsager--Casimir reciprocity. Detailed balance does not eliminate every antisymmetric response, and this identity does not make unrelated constants KKT multipliers of one optimization problem.

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

### D.8.9 Strict Finite-Certificate Closure

**Remark D.8.9.0 (Global Ledger Anchor).** The strict PPI/PCE certificate object defined below is the local sector record consumed by the Global Strict-Certificate Ledger of Convention P.14.1k and the No-Overclaim Discipline of Convention P.14.1l. Theorem D.8.9b is the local closure theorem; Theorem D.8.9c is the acyclic compatible-tuple theorem; Corollary D.8.9d is the sectorwise closure criterion. Ambient realization retains the separate restriction-fiber gate of Theorem P.14.1k.3.

**Definition D.8.9a (Strict PPI/PCE Certificate).** For a sector $S$ with fixed parent data, a strict PPI/PCE certificate is a tuple
$$
\mathfrak C_S=(Q_S,\sim_S,\mathcal R_S,V_S,q_S^*,g_S,\Pi_S)
$$
with the following entries.

1. $Q_S$ is the finite or compact set of PPI-admissible finite-response candidates for $S$ at the fixed parent data.
2. $\sim_S$ is the operational equivalence relation generated by equality of all retained finite protocol-response presheaves in $\mathcal R_S$.
3. $\bar Q_S:=Q_S/\sim_S$ is finite or compact Hausdorff, and $V_S: \bar Q_S\to\mathbb R$ is lower semicontinuous.
4. $q_S^*\in\bar Q_S$ is the proposed retained sector value.
5. $g_S>0$ is a strict separation gap satisfying
$$
V_S(q)\ge V_S(q_S^*)+g_S
\qquad
\text{for all }q\in\bar Q_S\setminus\{q_S^*\}.
$$
6. $\Pi_S$ is the finite list of overlap maps to previously fixed sectors; $q_S^*$ satisfies all overlap equations in $\Pi_S$.

A sector is certificate-complete exactly when such a tuple has been supplied and every entry has the status required by Convention P.14.1a.

**Theorem D.8.9b (Strict Certificate Implies Forced Sector Selection).** If $\mathfrak C_S$ is a strict PPI/PCE certificate, then $q_S^*$ is the unique PCE-selected representative of $S$ modulo response equivalence. Moreover, for any perturbation $\Delta V$ on $\bar Q_S$ with $\lVert\Delta V\rVert_\infty<g_S/2$, the perturbed functional $V_S+\Delta V$ has the same unique minimizer $q_S^*$.

*Proof.* Since $\bar Q_S$ is finite or compact Hausdorff and $V_S$ is lower semicontinuous, the direct method gives at least one minimizer of $V_S$. The gap condition gives, for every $q\ne q_S^*$,
$$
V_S(q)>V_S(q_S^*),
$$
so no $q\ne q_S^*$ can be a minimizer. Thus $q_S^*$ is the unique minimizer on $\bar Q_S$. Because $\bar Q_S$ is the quotient by equality of all finite protocol responses, choosing any representative of $q_S^*$ gives the same physical sector, and any label outside that class either changes a retained response or is response-null surplus. For the perturbation claim, for $q\ne q_S^*$,
$$
(V_S+\Delta V)(q)-(V_S+\Delta V)(q_S^*)
\ge g_S-2\lVert\Delta V\rVert_\infty>0.
$$
Therefore $q_S^*$ remains the unique minimizer. ∎

**Theorem D.8.9e (Strict-Gap Empirical Certificate Stability).** Let $S$ be a sector with strict PPI/PCE certificate $\mathfrak C_S$ and selected class $q_S^*$ in the sense of Definition D.8.9a. Let $\mathsf P_S$ be its finite retained protocol family and set
$$
d_S(q,q')
:=
\max_{P\in\mathsf P_S}
\operatorname{TV}\bigl(R_P(q),R_P(q')\bigr).
\tag{D.8.9e.1}
$$
Assume that the certificate score is $L_S$-Lipschitz for this response distance,
$$
|V_S(q)-V_S(q')|
\le
L_S d_S(q,q')
\tag{D.8.9e.2}
$$
on the tested quotient family, and that an empirical score $\widehat V_S$ induced by empirical protocol frequencies satisfies
$$
\sup_{q\in\bar Q_S}|\widehat V_S(q)-V_S(q)|
\le
L_S\varepsilon.
\tag{D.8.9e.3}
$$
If
$$
2L_S\varepsilon<g_S,
\tag{D.8.9e.4}
$$
then $q_S^*$ remains the unique selected class for the empirical certificate score $\widehat V_S$.

A sufficient finite-sample condition for (D.8.9e.3) is the following. If every retained protocol has at most $m$ outcomes and $N$ independent runs are taken for each $P\in\mathsf P_S$, then the conservative bound
$$
N
\ge
\frac{m^2}{2\varepsilon^2}
\log\frac{2|\mathsf P_S|m}{\delta}
\tag{D.8.9e.5}
$$
implies uniform total-variation accuracy at scale $\varepsilon$ with probability at least $1-\delta$, whenever the empirical score is calibrated so that this uniform response error implies (D.8.9e.3). Conversely, if the observed response profile lies outside the $g_S/(2L_S)$ response tube of the asserted selected response after all declared calibration and sampling tolerances are included, the empirical realization no longer satisfies this strict certificate and the sector status is downgraded to failed or certificate-pending according to the ledger convention of Corollary D.8.9d.

*Proof.* The first claim is Theorem D.8.9b applied to the perturbation $\Delta V=\widehat V_S-V_S$, since (D.8.9e.3) gives $\lVert\Delta V\rVert_\infty\le L_S\varepsilon$ and (D.8.9e.4) is exactly the strict-gap stability condition $2\lVert\Delta V\rVert_\infty<g_S$.

For the sampling statement, Hoeffding's inequality bounds each empirical outcome-coordinate error, and a union bound over at most $|\mathsf P_S|m$ retained coordinates gives simultaneous coordinate control with probability at least $1-\delta$. The displayed value of $N$ is conservative enough to imply the required total-variation control for every retained protocol. The final statement is the contrapositive ledger reading: once the asserted empirical response is outside the certified tolerance tube, the finite record no longer instantiates the accepted strict certificate. ∎

**Theorem D.8.9c (Acyclic Gluing of Strict Certificates).** Let $S_1,\ldots,S_N$ be sectors ordered by an acyclic dependency graph. Suppose each $S_j$ has a strict certificate
$$
\mathfrak C_{S_j}=(Q_{S_j},\sim_{S_j},\mathcal R_{S_j},V_{S_j},q_{S_j}^*,g_{S_j},\Pi_{S_j})
$$
conditional only on parent values among $S_1,\ldots,S_{j-1}$, and suppose every overlap map in $\Pi_{S_j}$ is satisfied by the previously selected parent tuple. Then the product branch has a unique global PPI/PCE-selected tuple
$$
(q_{S_1}^*,\ldots,q_{S_N}^*)
$$
modulo response equivalence.

*Proof.* Induct on $j$. For $j=1$, Theorem D.8.9b gives a unique selected quotient class $q_{S_1}^*$. Assume $q_{S_1}^*,\ldots,q_{S_{j-1}}^*$ are uniquely fixed. The certificate for $S_j$ is evaluated at these fixed parent data; its overlap equations are satisfied by hypothesis, and Theorem D.8.9b gives a unique selected quotient class $q_{S_j}^*$. The dependency graph is acyclic, so no later sector can alter an earlier parent value; later sectors may only fail an overlap equation, in which case the product branch is inadmissible, or satisfy it, in which case the already selected value remains fixed. After $N$ steps the tuple is unique. ∎

**Theorem D.8.9c.1 (Affine Cycle-Consistency Audit for Selected Sector Overlaps).** Let $G=(V,E)$ be a connected finite comparison graph with $|V|\ge2$, and let $y\in\mathcal H^E$ be the overlap record obtained after the sector representatives have already been selected by the existing acyclic certificate stack and transported into one finite-dimensional real inner-product space $\mathcal H$. Assume the overlap transports are flat and gauge-trivialized. The audit asks whether there are common-chart vertex coordinates $q_i$ such that an oriented edge $e:i\to j$ obeys
$$
q_j-q_i=y_e.
\tag{D.8.9c.1.1}
$$
Let
$$
D:\mathcal H^V\to\mathcal H^E,
\qquad
(Dq)_e=q_j-q_i,
\qquad
\Delta=D^*D.
\tag{D.8.9c.1.2}
$$
Then:

1. a global glued tuple exists if and only if
$$
y\in\operatorname{im}D
\quad\Longleftrightarrow\quad
P_{\ker D^*}y=0
\quad\Longleftrightarrow\quad
\sum_{e\in\gamma}\operatorname{sgn}_\gamma(e)y_e=0
\tag{D.8.9c.1.3}
$$
for every cycle $\gamma$; checking a cycle basis is sufficient;
2. solutions are unique up to one global translation in $\mathcal H$; this translation must be response-null or fixed by an accepted root datum, and a root or mean-zero gauge then makes the audit solution unique;
3. every noisy overlap record has the orthogonal decomposition
$$
y=y_{ex}+h,
\qquad
y_{ex}=D\Delta^+D^*y,
\qquad
h=(I-D\Delta^+D^*)y\in\ker D^*,
\tag{D.8.9c.1.4}
$$
and $\|h\|$ is exactly the least attainable overlap residual;
4. the mean-zero least-squares correction $q_*=\Delta^+D^*y$ obeys
$$
\|q_*\|
\le
\frac{\|y_{ex}\|}{\sqrt{\lambda_{gap}(\Delta)}},
\tag{D.8.9c.1.5}
$$
where $\lambda_{gap}(\Delta):=\min(\operatorname{spec}\Delta\setminus\{0\})$, equivalently the scalar graph-Laplacian $\lambda_2$.

*Proof.* The finite graph Hodge decomposition gives
$$
\mathcal H^E=\operatorname{im}D\oplus\ker D^*.
$$
Exactness is therefore equivalent to vanishing harmonic/cycle projection, which is equivalent to zero signed sum on a cycle basis. Connectedness gives $\ker D$ as the constant vertex fields, proving uniqueness modulo global translation. Orthogonal projection onto $\operatorname{im}D$ gives (D.8.9c.1.4) and its least-squares interpretation. On the orthogonal complement of the constant vertex fields, $\Delta\succeq\lambda_{gap}(\Delta)I$; singular-value inversion gives (D.8.9c.1.5). ∎

**Remark D.8.9c.2 (Scope: Audit, Not Cyclic Selection).** Theorem D.8.9c.1 audits compatibility only after local representatives have been selected. It does not remove the acyclicity requirement on PU's parent-dependency graph and does not prove a fixed point for cyclic parent-dependent certificate selection. Non-flat or nonabelian overlap maps require twisted cohomology or ordered holonomy; applying the ordinary incidence formulas there is not licensed.

**Corollary D.8.9d (Sectorwise Strict-Certificate Closure Criterion).** Suppose every live sector in a finite acyclic dependency graph has a strict PPI/PCE certificate with theorem-level entries and all typed overlap maps commute. Then Theorem D.8.9c selects a unique compatible tuple of sector response classes. This conclusion neither constructs an ambient global realizer nor proves a unique lift of the tuple; those claims require a declared restriction map with a nonempty, respectively singleton, fiber as in Theorem P.14.1k.3. If a sector lacks one finite entry required by this route, Convention P.14.1a and Corollary P.14.1g retain the weakest unresolved status until an equivalent theorem-level record is supplied.

*Proof.* Theorem D.8.9c gives existence and uniqueness of the compatible product tuple. A lift through an ambient restriction map is additional data, so it cannot follow from product compatibility alone. The unresolved-entry statement follows because Definition D.8.9a cannot select the affected sector class when its candidate family, quotient, response record, cost, minimizer, strict gap, or overlap map is missing. ∎

**Remark D.8.9d.1 (Structural-Invariant Projection on a Strict Branch).** Let $S$ be a sector with strict PPI/PCE certificate $\mathfrak C_S$ in the sense of Definition D.8.9a, and let $q_S^*\in\bar Q_S$ be its unique selected class from Theorem D.8.9b. If

$$
\mathcal O:\bar Q_S\longrightarrow\mathcal Y
$$

is an internal finite invariant that is well-defined on response-equivalence classes, then the branch value

$$
\mathcal O_{\mathrm{phys}}
:=
\mathcal O(q_S^*)
$$

is unique on that strict branch. Consequently, once $\mathfrak C_S$ is accepted, the strict-separation proof need not be repeated for every invariant that factors through the same selected quotient class. If two derivation chains are shown to factor through the same $q_S^*$ and the same invariant $\mathcal O$, their common value is a projection of one selected response class rather than an additional independent coincidence.

This remark does not collapse the recurrent-ledger source roles of Theorem R.3.5e.3. On the minimal Appendix Z / attractor branch, the tuple

$$
(K_0,d_0,\varepsilon_0,a,b,M,k,D)=(3,8,\ln2,2,6,24,12,4)
$$

retains exactly the status assigned by Proposition T.59, Corollary T.59a, Proposition R.3.5e, and Theorem R.3.5e.3: it is closed on the stated branch, with the current source-role non-collapse still in force.

*Proof.* Theorem D.8.9b states that $q_S^*$ is the unique minimizer in $\bar Q_S$. Since $\mathcal O$ is a function on $\bar Q_S$, evaluating it at $q_S^*$ gives a unique value. The second statement is the same observation applied to derivation chains whose maps have both been proved to factor through $q_S^*$. The final paragraph is a status-preservation clause: Theorem R.3.5e.3 records non-collapse of the present source roles, while Proposition T.59 and Corollary T.59a record the closed minimal-branch tuple. ∎

**Theorem D.8.9f (Branch-Degeneracy Observable Stratification).** Let $\bar Q_S$ be a compact finite-response quotient and let $V_S:\bar Q_S\to\mathbb R\cup\{+\infty\}$ be lower semicontinuous. Then the minimizer set
$$
M_S
:=
\operatorname*{argmin}_{q\in\bar Q_S}V_S(q)
\tag{D.8.9f.1}
$$
is compact and nonempty whenever $V_S$ is finite somewhere.

A retained observable $O:\bar Q_S\to\mathcal Y$ has theorem-level value on the non-strict sector exactly when $O$ is constant on $M_S$. If $O$ separates two points of $M_S$, then the value of $O$ is certificate-pending until a further strict certificate, calibration datum, empirical protocol, or ledger-accepted branch condition reduces the minimizer set.

If, in addition, $M_S$ is a polytope in the retained affine response coordinates, and the admissible tie-breaking perturbations are affine protocol-cost functionals restricted to $M_S$, then sufficiently small lexicographic admissible perturbations select exposed faces of $M_S$. A sufficient route to this hypothesis is that $K_B(S)$ is a finite response polytope and $V_S$ is affine on the face decomposition containing its minimum set, so that $M_S$ is itself a face, or a finite union refined into polytopal minimizer faces. Under this $M_S$-polytope hypothesis the unresolved branch decomposes into a finite stratification by operationally distinguishable exposed minimizer faces.

*Proof.* A lower semicontinuous function on a compact space attains its minimum on a compact sublevel set, giving compactness and nonemptiness of $M_S$. Constancy of $O$ on $M_S$ is precisely independence from the unresolved minimizer choice; if $O$ takes two different values on $M_S$, the finite record has not selected which value is physical. For the final claim, the added hypotheses make the unresolved minimizer set a finite polytope, or a finite polytopal union refined into minimizer faces. An affine tie-breaking perturbation restricted to the polytope $M_S$ is minimized on an exposed face of $M_S$. A finite polytope has finitely many faces, so these exposed operational minimizer faces give the stated finite stratification. ∎


## D.9 Conclusion

This appendix has provided a rigorous analysis grounded in the variational perspective of minimizing the PCE Potential $V(x)$ (Definition D.1), modeling the slow adaptation dynamics of the MPU network as a stochastic gradient flow (Equation D.8). We demonstrated through formal proofs and analysis of the potential structure and dynamics that:

1.  **Alignment (Theorem 2)** has two conditional levels. On the faithful-cost-identifiability and efficiency-saturated branch, Corollary D.1 makes $C_P(v)=\langle\hat C_v\rangle$ necessary at a true stable PCE equilibrium. Under the quasi-static-target and stochastic regularity hypotheses of Proposition D.1, the registered work-cost feedback contracts mean-square misalignment toward the noise floor of Corollary D.2. This identifies the cost-relevant proxy only up to the response- and cost-preserving reparameterizations described in Remark D.1; Definition B.1 supplies the quantum-circuit-complexity coordinate.

2.  **Geometric Regularity (Theorem 43)** holds for full-potential global minimizers on the strict-comparison branch of Theorem D.3. The cost estimates of Lemma D.3 motivate regular configurations as candidates for the low-potential geometrical sector; they do not prove that every regular configuration is a minimizer. If every irregular configuration has a regular equal-proxy comparator with strictly lower core potential, no irregular configuration can minimize the full potential.

3.  **Complexity Adaptation Convergence (Section D.8):** A rigorous analysis of the complexity adaptation dynamics (Equation D.13), driven by the Adaptation Driving Force $\Psi(C)$, establishes exponential convergence to the unique POP-optimal complexity $C^{\star}$ with explicit rate $\underline{\lambda}\,\eta_{adapt}$ (Theorem D.8). Using strong monotonicity, Polyak-Łojasiewicz control, and Ito estimates, we quantify both the deterministic convergence rate (Equation D.15) and the stochastic noise floor (Equation D.16), providing a detailed mechanism for how complexity optimization occurs within the larger PCE landscape.

4.  **Spectral Marginality and 1/f Noise (Section D.8.5):** Linearized stochastic PCE dynamics decompose into relaxation modes whose spectra are Lorentzian. When PCE operates on a marginal viability band with no privileged update scale, the active mode-weight profile is scale-neutral and the summed prediction-error spectrum becomes $S(f)\propto 1/f$ (Theorem D.8b). Deviations from exact pink scaling are controlled by the active rate-density exponent $s$ through $\beta_{\mathrm{spec}}=1-s$ (Theorem D.8a), and finite cutoffs are fixed by the slowest and fastest available update rates (Corollary D.8b.1).

Section D.6.5 establishes ergodicity of the full stochastic dynamics under Assumptions (A1)–(A6), and its detailed-balance low-noise subcase yields Gibbs concentration near the global-minimum sector of $V(x)$. That sector is geometrically regular only under the strict-comparison hypothesis of Theorem D.3. Exact alignment, local-minimizer regularity, pink spectra, and continuum closure likewise retain the faithful-cost, local-regularization, scale-neutral, and continuum-certificate hypotheses stated in their respective results. The subsequent spacetime and gravity arguments may consume only the branches on which those records are jointly satisfied.

**Remark D.9.1 (Justification for PCE Cost Minimization).** Three arguments support the principle that realized physical configurations minimize the PCE potential $V(x) = V_{\mathrm{op}}(x) + V_{\mathrm{prop}}(x) - V_{\mathrm{benefit}}(x)$ rather than maximizing it, satisfying some other functional, or occupying a random point in the admissible region. First, *thermodynamic stability*: configurations that do not minimize cost relative to perturbations are unstable under the fluctuation-dissipation dynamics of Theorem D.5. Any configuration with avoidable cost is driven toward lower cost by the same irreversible processes that Theorem 31 mandates; the PCE attractor is the fixed point from which no further cost reduction is achievable. Second, *selection pressure*: predictive systems that waste resources on avoidable costs are outcompeted by those that do not, because wasted resources reduce predictive capacity available for adaptation (Axiom 1, POP); the PCE attractor is the endpoint of this selection process, analogous to the ground state in thermodynamics. Third, *uniqueness*: for generic Morse-type potentials on the finite-dimensional configuration space constrained by Theorem E.2 and Theorem K.10.4, local minima are isolated (the set of smooth functions with non-degenerate critical points is open and dense in the $C^2$ topology); PCE therefore predicts discrete, isolated attractor configurations, consistent with the observed discreteness of physical constants and particle spectra. These arguments do not constitute a proof that PCE is the uniquely correct selection principle; they establish that PCE is the natural selection principle within the framework's operational logic and that its predictions are falsifiable: if the realized configuration demonstrably fails to minimize cost over the admissible class, PCE is refuted.