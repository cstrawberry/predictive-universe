# Appendix B: Operational Complexity, Costs, and Stress–Energy Tensor Construction

This appendix provides the detailed construction and justification for key operators used within the Predictive Universe (PU) framework, culminating in the definition of the macroscopic MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}$. This includes the operational complexity operator $\hat{C}_v$ used as a proxy for the theoretical $C_P$, the associated resource cost operators $\hat{R}$ and $\hat{R}_I$, a rigorous lower bound for complexity near the SPAP limit, and the operators representing local energy density and flows, ensuring consistency with the framework's principles and conservation laws.

*(Units convention.)* Throughout this appendix we retain explicit
$\hbar$, $c$, and $k_B$ factors so that every operator’s physical
dimension is transparent. Predictive Physical Complexity ($C_P$ and its proxy $\hat C_v$) carries its own base dimension $\mathrm{[Complexity]}$, e.g.\ $[\hat C_v]=\mathrm{[Complexity]}$. Information-theoretic quantities such as the entropy $\varepsilon$ or
the channel capacity $C_{\max}$ are dimensionless, typically expressed
in nats (natural-log base $e$). The physical relevance of all complexity-derived cost terms rests on the Dynamically Enforced Functional Correspondence (Theorem 2), rigorously proven in **Appendix D**, which equates operational cost with predictive cost in steady-state MPU optimisation.

## B.1 Operational Predictive Physical Complexity $\hat{C}_v$

The theoretical Predictive Physical Complexity $C_{\mathrm P}(\mu)$ (Equation 1) is defined via a limit of algorithmic complexities, making it generally uncomputable. For the system's adaptive dynamics to operate on a physical observable that tracks this complexity, a computable operational proxy is required. Within the emergent quantum setting (Proposition 4), quantum circuit complexity provides a suitable measure, possessing expected properties like monotonicity with physical resources, approximate additivity, and computational accessibility. We formally define the operator representing this observable proxy.

**Definition B.1 (Coarse-Grained Operational Complexity Observable $\hat{C}_v$)**

For each MPU $v$, its operational complexity is represented by a Hermitian, positive-semi-definite operator $\hat C_v$ acting on the MPU's Hilbert space $\mathcal{H}_v$ (Proposition 4), identified with quantum circuit complexity. This operator is defined via its spectral decomposition:

 $$
 \hat C_v \;=\;
 \sum_{d=0}^{\infty}\lambda(d)\,\hat P_d
 \tag{B.1}
 $$

 where:

 *   $d \in \mathbb{N}_0$ is a dimensionless integer representing the minimum number of fundamental quantum gates (circuit size, relative to a fixed universal gate set) required to prepare states in the subspace $\hat{P}_d \mathcal{H}_v$ starting from a reference state $|K_0\rangle$ corresponding to the Horizon Constant $K_0$.
 *   On the operational coarse-graining branch, $\hat{P}_d$ is the orthogonal projector onto an experimentally resolved complexity bin labeled by effective circuit-depth $d$ relative to $|K_0\rangle$. These bins are chosen to partition $\mathcal{H}_v$ into an orthogonal, complete family: $\hat{P}_d \hat{P}_{d'} = \delta_{dd'} \hat{P}_d$ and $\sum_{d} \hat{P}_d = \hat{I}$ (the sum being effectively finite for a finite-dimensional $\mathcal{H}_v$). The bins are not assumed to coincide with the exact mathematical level sets $\{|\psi\rangle : C_{\text{circ}}(|\psi\rangle) = d\}$ of circuit complexity, which do not generally form linear subspaces (a superposition of two low-complexity states can require strictly more gates than either). The operator $\hat{C}_v$ is therefore a coarse-grained observable proxy for circuit complexity, dynamically validated as a tracker of the theoretical $C_P$ by Theorem 2 (Appendix D).
 *   $\lambda(d)$ are the eigenvalues of $\hat{C}_v$, representing the effective Predictive Physical Complexity for states in the subspace $\hat{P}_d \mathcal{H}_v$. These eigenvalues are non-decreasing with $d$:
     $$ \lambda(d) = K_0 + \Delta C(d) \tag{B.2} $$
     where $K_0$ is the Horizon Constant (Theorem 15) and $\Delta C(d) \ge 0$ is the additional complexity due to circuit depth $d$, with $\Delta C(0)=0$.

 For an MPU with a finite-dimensional Hilbert space $\mathcal{H}_v$ of dimension $d_0$ (Theorem 23), the sum in Equation (B.1) is understood to be effectively finite. Only a finite number of distinct, non-zero orthogonal projectors $\hat{P}_d$ corresponding to achievable complexity levels can exist, or for $d$ beyond a certain $d_{max}$, the projectors $\hat{P}_d$ become zero or the eigenvalues $\lambda(d)$ cease to increase, reflecting the capacity limit of the $d_0$-dimensional space.

The expectation value $\langle \psi | \hat{C}_v | \psi \rangle$ for a state $|\psi\rangle$ provides the MPU's operational measure of complexity on the chosen coarse-graining. The justification for this coarse-grained observable serving as a valid, dynamically selected proxy for the theoretical $C_P$ at viable equilibria is rigorously provided by Theorem 2 (Dynamically Enforced Functional Correspondence), detailed in **Appendix D**. Different admissible coarse-grainings define equivalent proxies in the sense of Theorem 2 up to the tracking noise floor established there.

*Proof:* On the operational coarse-graining branch, $\hat{C}_v$ is by construction a Hermitian operator with orthogonal complete spectral projectors $\{\hat{P}_d\}$ and real non-negative eigenvalues $\lambda(d) = K_0 + \Delta C(d) \ge K_0 > 0$. Self-adjointness and positive semi-definiteness follow directly. The coarse-graining choice is the branch input; exact agreement with mathematical circuit-complexity level sets is not claimed and would generally fail because such level sets are not linear subspaces.

## B.2 Physical Resource-Cost Operators $\hat{R}, \hat{R}_I$

The physical realization of predictive capability, quantified by complexity, incurs costs. These costs are represented by operators derived from the operational complexity operator $\hat{C}_v$ and the cost functions defined in the main text (Definition 3).

**Theorem B.1 (Physical and Reflexive-Information Cost Operators)**

The operational resource cost operators, $\hat R(C_v)$ and $\hat R_I(C_v)$, acting on the MPU Hilbert space $\mathcal{H}_v$, are defined via Borel functional calculus applied to the operational complexity operator $\hat C_v$ (Definition B.1, Equation B.1) and the resource-cost functions $R(\cdot)$ and $R_I(\cdot)$ (Definition 3):

$$
\hat R(C_v)=R(\hat C_v)=\sum_{d=0}^{\infty} R(\lambda(d))\hat P_d,
\quad
\hat R_I(C_v)=R_I(\hat C_v)=\sum_{d=0}^{\infty} R_I(\lambda(d))\hat P_d
\tag{B.3}
$$

where $\lambda(d) = K_0 + \Delta C(d)$ are the eigenvalues of $\hat{C}_v$.
The operators $\hat R(C_v)$ and $\hat R_I(C_v)$ are Hermitian because the cost functions $R(\cdot)$ and $R_I(\cdot)$ are real-valued. They are positive-semidefinite because $R(C) \ge 0$ and $R_I(C) \ge 0$ for $C \ge K_0$ (Definition 3), and $\lambda(d) \ge K_0$ for all $d \ge 0$. The physical relevance of using $\langle\hat{R}\rangle$ and $\langle\hat{R}_I\rangle$ in dynamics relies on Theorem 2 (Dynamically Enforced Functional Correspondence) ensuring alignment of $\langle \hat{C}_v \rangle$ with $C_P$.

*Proof.* By Definition B.1,
$$
\hat C_v = \sum_{d=0}^{\infty}\lambda(d)\hat P_d
$$
with mutually orthogonal spectral projectors $\hat P_d$ and real eigenvalues $\lambda(d)\ge K_0$. The Borel functional calculus for a self-adjoint operator therefore gives
$$
R(\hat C_v)=\sum_{d=0}^{\infty}R(\lambda(d))\hat P_d,
\qquad
R_I(\hat C_v)=\sum_{d=0}^{\infty}R_I(\lambda(d))\hat P_d,
$$
which is exactly Equation (B.3).

Because $R$ and $R_I$ are real-valued on the spectrum of $\hat C_v$, both $R(\hat C_v)$ and $R_I(\hat C_v)$ are self-adjoint. To prove positive semidefiniteness, let $|\psi\rangle\in\mathcal H_v$. Then
$$
\langle \psi|R(\hat C_v)|\psi\rangle
=
\sum_{d=0}^{\infty} R(\lambda(d))\,\langle \psi|\hat P_d|\psi\rangle
=
\sum_{d=0}^{\infty} R(\lambda(d))\,\|\hat P_d\psi\|^2
\ge 0,
$$
because each coefficient $R(\lambda(d))$ is non-negative for $\lambda(d)\ge K_0$. The same calculation gives
$$
\langle \psi|R_I(\hat C_v)|\psi\rangle
=
\sum_{d=0}^{\infty} R_I(\lambda(d))\,\|\hat P_d\psi\|^2
\ge 0.
$$
Hence both operators are Hermitian and positive-semidefinite. ∎

## B.3 Fundamental Complexity Bound for SPAP Prediction

**Definition B.2 (Unified Complexity Functional $C_{\text{uni}}$)**

Consider the task of achieving average predictive performance $\alpha$ on SPAP-limited aspects, where $\alpha$ is within an error margin $\delta_{\rm SPAP} = \alpha_{SPAP} - \alpha$ of the maximum limit $\alpha_{SPAP}$.

A $\delta_{\rm SPAP}$-accurate SPAP strategy is any physically realizable procedure $S$ whose verification/calibration loop produces a predictor that achieves performance at least $\alpha_{SPAP}-\delta_{\rm SPAP}$ while the probability of violating this target is at most $\delta_{\rm SPAP}$. For such a strategy, define $\mathrm{Cost}(S;\delta_{\rm SPAP})$ to be its worst-case number of elementary physical operations, counting (i) each acquisition of an interaction outcome used for verification/calibration and (ii) each elementary internal update step used to process those outcomes and update the predictor. The unified complexity functional $C_{\text{uni}}$ is the minimal such cost over all $\delta_{\rm SPAP}$-accurate strategies:
$$
C_{\text{uni}}\bigl(\delta_{\rm SPAP}\bigr) := \inf_{S\ \delta_{\rm SPAP}\text{-accurate}} \mathrm{Cost}(S;\delta_{\rm SPAP}). \tag{B.4}
$$
This functional captures the fundamental effective computational resources demanded by high-accuracy self-calibration within the PU framework.

**Theorem B.2 (Log-Enhanced Quadratic Complexity Divergence Near $\alpha_{SPAP}$ = Theorem 14)**

As $\delta_{\rm SPAP} \to 0^+$, the unified complexity satisfies the lower bound:
$$
C_{\text{uni}}\bigl(\delta_{\rm SPAP}\bigr) = \Omega\left(\frac{\log(1/\delta_{\rm SPAP})}{\delta_{\rm SPAP}^2}\right). \tag{B.5}
$$
where $\delta_{\rm SPAP}$ is the dimensionless error margin and $C_{uni}$ is a dimensionless measure of effective computational resources.

*Proof:* Fix $0<\delta_{\rm SPAP}\le 1/4$ and abbreviate $\delta:=\delta_{\rm SPAP}$. (The restriction $\delta\le 1/4$ is a mild technical condition ensuring $1-4\delta^2\ge 1/2$, which yields clean constants below; for $\delta>1/4$ the bound (B.5) is trivially satisfied by any strategy requiring at least one operation.) Consider the following estimation subtask, which is a special case of SPAP-limited performance calibration: an algorithm observes $N$ samples $X_1,\dots,X_N\in\{0,1\}$ with $X_i\sim\mathrm{Bern}(p)$ and must output an estimate $\hat p$ such that
$$
\Pr(|\hat p-p|\le \delta)\ \ge\ 1-\beta
$$
for all $p$ in $\{1/2-\delta,\ 1/2+\delta\}$, where $\beta\in(0,1/2)$ is a target failure probability. Any $\delta$-accurate SPAP strategy must be able to solve this subtask when restricted to this two-point family of bounded SPAP-limited success indicators (since calibrating a SPAP-limited success rate to additive accuracy $\delta$ entails at least distinguishing two hypotheses separated by $2\delta$), so a lower bound on $N$ yields a lower bound on $C_{\text{uni}}(\delta)$ via (B.4).

Define the decision rule $\varphi:=\mathbf{1}\{\hat p>1/2\}$. Under $p_+=1/2+\delta$ one has $\Pr_{p_+}(\varphi=1)\ge 1-\beta$, and under $p_-=1/2-\delta$ one has $\Pr_{p_-}(\varphi=1)\le \beta$. Let $P_+$ and $P_-$ denote the laws of $(X_1,\dots,X_N)$ under $p_+$ and $p_-$, respectively. By the data-processing inequality applied to the measurable map $(X_1,\dots,X_N)\mapsto\varphi$, the KL divergence satisfies
$$
D(P_+\|P_-)\ \ge\ D(\mathrm{Bern}(1-\beta)\|\mathrm{Bern}(\beta)).
$$
For $\beta\in(0,1/4]$,
$$
D(\mathrm{Bern}(1-\beta)\|\mathrm{Bern}(\beta))
=(1-2\beta)\log\!\left(\frac{1-\beta}{\beta}\right).
$$
Since $\beta\le 1/4$, one has $1-2\beta\ge 1/2$ and
$$
\frac{1-\beta}{\beta}\ge \frac{3}{4\beta}.
$$
Hence
$$
D(\mathrm{Bern}(1-\beta)\|\mathrm{Bern}(\beta))
\ge \frac{1}{2}\log\!\left(\frac{3}{4\beta}\right).
$$

On the other hand, $P_\pm$ are product measures, so
$$
D(P_+\|P_-)=N\cdot D(\mathrm{Bern}(p_+)\|\mathrm{Bern}(p_-))
= N\cdot 2\delta\log\!\left(\frac{1+2\delta}{1-2\delta}\right).
$$
Using $\log\!\left(\frac{1+x}{1-x}\right)\le \frac{2x}{1-x^2}$ for $|x|<1$ with $x=2\delta\le 1/2$, we obtain
$$
D(\mathrm{Bern}(p_+)\|\mathrm{Bern}(p_-))
=2\delta\log\!\left(\frac{1+2\delta}{1-2\delta}\right)
\le \frac{8\delta^2}{1-4\delta^2}
\le 16\delta^2.
$$
Combining these bounds yields
$$
16N\delta^2\ \ge\ \frac{1}{2}\log\!\left(\frac{3}{4\beta}\right)
\quad\Rightarrow\quad
N\ \ge\ \frac{1}{32\delta^2}\log\!\left(\frac{3}{4\beta}\right).
$$
Taking the natural self-calibrated confidence choice $\beta=\delta$ (which lies in $(0,1/4]$ under the standing assumption $\delta\le 1/4$) gives
$$
N=\Omega\!\left(\frac{\log(1/\delta)}{\delta^2}\right).
$$
Likewise, for a horizon budget $\beta=1/\mathcal{T}$ with $\mathcal{T}\ge 4$, one obtains
$$
N=\Omega\!\left(\frac{\log \mathcal{T}}{\delta^2}\right).
$$
Finally, each sample acquisition and each internal update is counted as an elementary operation in $\mathrm{Cost}(\cdot;\delta)$, hence $C_{\text{uni}}(\delta)\ge N$, proving (B.5). ∎

This log-enhanced quadratic divergence of the dimensionless unified complexity $C_{\text{uni}}(\delta_{\rm SPAP})$ (Eq B.5) represents a fundamental information-processing lower bound within the PU framework. It gives the minimum effective verification/update resources required to sustain performance $\alpha=\alpha_{SPAP}-\delta_{\rm SPAP}$. If the operational complexity notion $C_{pred}(\alpha)$ is taken to lower-bound those effective verification/update resources, then Theorem 14 inherits the same asymptotic lower bound for $C_{pred}(\alpha)$.

**Corollary B.2.1 (Pattern-Specific Cost Inheritance).** Let $S$ be a predictive system with Effective Operational Property R (Definition A.0.1) and self-model $\mathcal{M}_S$ (Appendix M, §M.6.10, Definition M.10.1). Let $E$ be a pattern whose integration requires $S$'s self-predictive performance on the affected self-model component to reach level $PP_S^{(E)}$, placing it within $\delta_S(E) = \alpha_{SPAP} - PP_S^{(E)} > 0$ of the SPAP boundary (Appendix M, §M.6.10, Definition M.10.3). Then the minimum computational cost for $S$ to integrate $E$ into its self-model satisfies:
$$
C_{\text{integrate}}(S, E) \geq C_{\text{uni}}(\delta_S(E))
\tag{B.5a}
$$

*Proof.* Integration of $E$ requires $S$ to update its self-model from $\theta_S$ to $\theta_S' = \theta_S + \delta\theta_S(E)$ such that the self-consistency condition (Appendix M, Equation M.18) is satisfied at performance level $PP_S^{(E)}$. This entails that $S$'s self-predictive performance on the self-model component affected by $E$ must reach at least $PP_S^{(E)}$, which lies within $\delta_S(E) = \alpha_{SPAP} - PP_S^{(E)}$ of the SPAP boundary.

The restriction of $S$'s predictive task to this self-referential subtask — predicting the component of its own state affected by $\delta\theta_S(E)$ while knowing that its state depends on its prediction — is an instance of self-prediction within a model class possessing Property R, to which Theorem B.2 applies. Specifically, the subtask embeds the binary estimation problem of Theorem B.2's proof as follows: the self-model parameter $\theta_j$ affected by $E$ is either correctly calibrated ($|\hat{\theta}_j - \theta_j| \leq \delta_S(E)$) or not, yielding a binary hypothesis $H_\pm$ separated by $2\delta_S(E)$ in the Fisher metric. Any strategy that integrates $E$ to the required performance level must distinguish these hypotheses with failure probability at most $\delta_S(E)$ (the self-calibrated confidence choice, Definition B.2). By the sample-complexity lower bound of Theorem B.2, this requires at least $C_{\text{uni}}(\delta_S(E))$ elementary physical operations.

Since integration of $E$ requires achieving this performance level on the self-referential subtask, we obtain $C_{\text{integrate}}(S, E) \geq C_{\text{uni}}(\delta_S(E))$. $\square$

## B.4 Microscopic Energy Density Operator $\hat{\rho}_v$ and Interaction Structure

The total energy density associated with an individual MPU incorporates contributions from its baseline operation, complexity-related costs, and interactions, including the thermodynamic cost of irreversibility.

**Definition B.3 (Microscopic Energy Density Operator $\hat{\rho}_v$)**

The Hermitian operator representing the microscopic energy density associated with MPU $v$ is defined by its contributions from various physical aspects of the MPU, localized to an effective MPU volume $V_{\mathrm{MPU}}$ and involving a characteristic MPU operational timescale $\tau_0$ where necessary for dimensional consistency:
$$
\hat{\rho}_v = \frac{1}{V_{\mathrm{MPU}}} \left( \hat{H}_v + \left(\hat{R}(C_v) - R(C_{op})\hat{\mathbb I}_v\right)\tau_0 + \hat{R}_I(C_v)\tau_0 + \hat{E}_{int}(v) \right) \tag{B.6}
$$
where:

1.  **$\hat{H}_v$:** The internal MPU Hamiltonian (Energy operator, from Def 26, Eq 43). Its contribution to energy density is $\hat{H}_v/V_{\mathrm{MPU}}$. Theorem 29 relates $\langle \hat{H}_v\rangle$ to the baseline operational energy per predictive cycle; the corresponding baseline operational power is $R(C_{op})$ (Definition 3), where $C_{op}$ is the fixed baseline operational complexity (Definition 13).
2.  **$\hat{R}(C_v), \hat{R}_I(C_v)$:** The operational resource cost *power* operators (defined in Theorem B.1, Eq B.3, derived from the power functions $R(C), R_I(C)$ in Definition 3). Since $\langle \hat{H}_v\rangle$ already accounts for the baseline operational energy associated with $R(C_{op})$, the term $\left(\hat{R}(C_v)-R(C_{op})\hat{\mathbb I}_v\right)\tau_0$ contributes only the excess operational energy (above baseline) over the timescale $\tau_0$, while $\hat{R}_I(C_v)\tau_0$ contributes the reflexive/irreversible overhead energy over $\tau_0$. Here $\hat{\mathbb I}_v$ is the identity on $\mathcal H_v$ and $R(C_{op})$ is a scalar (the power evaluated at the fixed baseline complexity $C_{op}$).
3.  **$\hat{E}_{int}(v) = \frac{1}{2}\sum_{v' \sim v} \hat{V}_{vv'}$:** The interaction energy operator (Energy operator). Its contribution to energy density is $\hat{E}_{int}(v)/V_{\mathrm{MPU}}$. Acts on the joint Hilbert space $\mathcal{H}_v \otimes \mathcal{H}_{v'}$ (or larger, if auxiliary degrees implementing ND-RID are included explicitly as in Definition B.4).

The constants $V_{\mathrm{MPU}}$ (effective MPU volume) and $\tau_0$ (characteristic MPU operational timescale, identified with $\tau_{min}$ from Theorem 29) are fundamental parameters related to the MPU scale. $\hat{\rho}_v$ is Hermitian by construction. Its expectation value $\langle \hat{\rho}_v \rangle = \mathrm{tr}(\rho_v \hat{\rho}_v)$ in the local MPU state $\rho_v$ represents the average local energy density associated with MPU $v$.

**Definition B.4 (Structure of Interaction Operator $\hat{V}_{vv'}$)**

The interaction operator between two adjacent MPUs $v$ and $v'$ ($v \sim v'$) represents the energetic coupling and the energetic bookkeeping of irreversible ND-RID processes that enforce self-consistency and dissipation. We decompose it as:
$$
\hat{V}_{vv'} = \hat{V}_{pot}^{(vv')} + \hat{V}_{dissip-contrib}^{(vv')}. \tag{B.7}
$$
where:
1.  **$\hat{V}_{pot}^{(vv')}$:** Represents "potential-like" energy from predictive coupling, such as alignment or consistency forces (e.g. analogous to spin coupling). This term is conservative and contributes to the Hamiltonian interaction energy.
2.  **$\hat{V}_{dissip-contrib}^{(vv')}$:** Represents the local energetic contribution associated with implementing irreversible ND-RID updates. The ND-RID mechanism (Definition 20, Theorem 31) produces entropy and is well-described at the level of the reduced two-MPU state $\rho_{vv'}$ by a CPTP semigroup; hence one may write an effective Lindblad master equation
$$
\frac{d}{dt}\rho_{vv'}(t) = -\frac{i}{\hbar}[\hat{H}_{vv'}, \rho_{vv'}(t)] + \mathcal{L}_D(\rho_{vv'}(t)), \tag{B.8}
$$
where $\hat{H}_{vv'} = \hat{H}_v + \hat{H}_{v'} + \hat{V}_{pot}^{(vv')}$ is the reduced unitary part and $\mathcal{L}_D$ is of the form [Gorini–Kossakowski–Sudarshan 1976; Lindblad 1976]
$$
\mathcal{L}_D(\rho) = \sum_k \left( \hat{L}_k \rho \hat{L}_k^\dagger - \frac{1}{2}\{\hat{L}_k^\dagger \hat{L}_k, \rho\} \right). \tag{B.9}
$$
The entropy production rate $\dot{S}_{tot}$ associated with this reduced dissipative evolution is bounded below by the ND-RID constraint (Theorem 31):
$$
\dot{S}_{tot} \ge \frac{\epsilon}{\tau_{int}}. \tag{B.10}
$$
The GKSL form (B.8) is a reduced description: by unitary dilation (e.g. [Stinespring 1955]) there exists an auxiliary Hilbert space $\mathcal H_{E(vv')}$ and a self-adjoint Hamiltonian on $\mathcal H_v\otimes\mathcal H_{v'}\otimes\mathcal H_{E(vv')}$ whose unitary evolution reproduces (B.8) after tracing out $E(vv')$. Accordingly, $\hat{V}_{dissip-contrib}^{(vv')}$ is taken to be the self-adjoint local edge term (supported on the tensor factor $\mathcal{H}_v \otimes \mathcal{H}_{v'} \otimes \mathcal{H}_{E(vv')}$) that encodes the system–auxiliary coupling and auxiliary energy required to realize $\mathcal{L}_D$; its expectation accounts for the heat/work channel whose entropy production obeys (B.10). With this choice, the microscopic conservation construction in Definition B.5 is applied to the global closed Hamiltonian (with auxiliaries included), while the apparent dissipation arises only after tracing out $E(vv')$.

## B.5 Microscopic Flow Operators and Conservation Laws

To construct the full stress-energy tensor, operators for momentum density and momentum flux are defined by requiring local conservation at the microscopic level. We also make the energy-current explicit under a standard locality assumption.

**Definition B.5 (Microscopic Flow Operators $\hat{\pi}_{v,j}$ and $\hat{p}_{v,jk}$)**

Let $\hat{\rho}_v$ be the microscopic energy density operator from (B.6) and define the corresponding local energy operator $\hat{\epsilon}_v := V_{\mathrm{MPU}} \hat{\rho}_v$ (so $\hat{\epsilon}_v$ has units of energy). Let the total Hamiltonian be
$$
\hat{H}_{total} := \sum_v \hat{\epsilon}_v,
$$
interpreted as the global closed Hamiltonian of the MPU network (including any local auxiliary degrees of freedom used to implement ND-RID as in Definition B.4). We define the time derivative in the Heisenberg picture as $\frac{d}{dt}\hat{O} = \frac{i}{\hbar}[\hat{H}_{total}, \hat{O}]$.

Because each $\hat{\epsilon}_v$ is supported on $v$ and its finite set of incident edges, one has $[\hat{\epsilon}_v, \hat{\epsilon}_u]=0$ whenever the supports of $\hat{\epsilon}_v$ and $\hat{\epsilon}_u$ are disjoint. Define the antisymmetric pairwise energy-current operator:
$$
\hat{J}_{v \to u} := \frac{i}{\hbar V_{\mathrm{MPU}}}\,[\hat{\epsilon}_v, \hat{\epsilon}_u] = -\hat{J}_{u \to v}.
$$
Then
$$
\frac{d}{dt}\hat{\rho}_v
= \frac{i}{\hbar V_{\mathrm{MPU}}}\left[\sum_u \hat{\epsilon}_u,\hat{\epsilon}_v\right]
= \sum_u \frac{i}{\hbar V_{\mathrm{MPU}}}[\hat{\epsilon}_u,\hat{\epsilon}_v]
= -\sum_u \hat{J}_{v\to u},
$$
so the local energy continuity equation holds:
$$
\frac{d}{dt}\hat{\rho}_v + \sum_u \hat{J}_{v \to u} = 0. \tag{B.11}
$$

Under geometric regularity (Theorem 43), there exists a local chart in which neighbors of $v$ can be indexed as $v\pm e_j$ and a local discrete divergence operator $\nabla_j^{(v)}$ is well-defined. Choose local energy flux operators $\hat{q}_{v,j}$ consistent with the edge currents (e.g. $\hat{q}_{v,j}:=\hat{J}_{v\to v+e_j}$ in that chart). Then (B.11) can be written in the directional form:
$$
\frac{d}{dt}\hat{\rho}_v + \sum_{j=1}^3 \nabla_j^{(v)} \hat{q}_{v,j} = 0.
$$
Define the momentum density by $\hat{\pi}_{v,j} := \hat{q}_{v,j}/c^2$. On the momentum-flux closure branch — assuming that $\hat{H}_{\mathrm{total}}$ is approximately translation-invariant on the locally regular chart at the relevant coarse-graining scale — Noether's theorem for discrete translation symmetry supplies a local stress tensor $\hat{p}_{v,jk}$ satisfying the discrete conservation identity
$$
\frac{d}{dt}\hat{\pi}_{v,j} + \sum_{k=1}^3 \nabla_k^{(v)}\hat{p}_{v,jk} = 0, \tag{B.12}
$$
fixed up to a standard stress-gauge freedom (addition of a discrete divergence-free tensor). These equations determine the admissible class of stress operators $\hat{p}_{v,jk}$ up to that gauge; a choice is then made consistent with the Hamiltonian and energy density in the locally regular chart. When approximate translation invariance fails at the chosen chart (for instance under pronounced geometric irregularity), the construction of this section does not apply and the closure branch must be stated explicitly elsewhere in the derivation.

## B.6 Canonical Microscopic Stress-Energy Tensor $\hat{T}^{\mu\nu}_{(can)}$

We assemble the density and flux operators into a canonical stress-energy tensor.

**Definition B.6 (Canonical Microscopic Stress-Energy Operator $\hat{T}^{\mu\nu}_{(can)}$)**

The canonical microscopic stress-energy operator $\hat{T}^{\mu\nu}_{(can)}(v)$ for MPU $v$ is defined by its components in a local frame (0=time, j,k=spatial):

*   $\hat{T}^{00}_{(can)}(v) = \hat{\rho}_v$ (Energy Density, Eq B.6)
*   $\hat{T}^{0j}_{(can)}(v) = c \hat{\pi}_{v,j}$ (Energy flux density)
*   $\hat{T}^{j0}_{(can)}(v) = c \hat{\pi}_{v,j}$ (Momentum density scaled)
*   $\hat{T}^{jk}_{(can)}(v) = \hat{p}_{v,jk}$ (Stress)

(By definition $\hat{\pi}_{v,j}:=\hat{q}_{v,j}/c^2$, one has $\hat{T}^{0j}_{(can)}(v)=\hat{T}^{j0}_{(can)}(v)$.)

**Theorem B.3 (Microscopic Conservation Law for $\hat{T}^{\mu\nu}_{(can)}$ on the Momentum-Flux Closure Branch)**

The canonical tensor $\hat{T}^{\mu\nu}_{(can)}(v)$ satisfies the local conservation law using a discrete spacetime divergence $\partial_\mu^{(v)}$ (where $\partial_0^{(v)} = (1/c)\, d/dt$, $\partial_j^{(v)} = \nabla_j^{(v)}$):
$$
\sum_{\mu=0}^{3} \partial_\mu^{(v)} \hat{T}^{\mu\nu}_{(can)}(v) = 0 \quad (\text{for } \nu = 0, 1, 2, 3) \tag{B.13}
$$
*Proof:* For $\nu = 0$,
$$
\sum_{\mu=0}^{3} \partial_\mu^{(v)} \hat{T}^{\mu 0}_{(can)}
= \partial_0^{(v)} \hat{\rho}_v + \sum_{j=1}^3 \nabla_j^{(v)}(c\hat{\pi}_{v,j})
= \frac{1}{c}\frac{d\hat{\rho}_v}{dt} + \frac{1}{c}\sum_{j=1}^3 \nabla_j^{(v)} \hat{q}_{v,j} = 0
$$
by (B.11) and $\hat{q}_{v,j}=c^2\hat{\pi}_{v,j}$ (Definition B.5). For $\nu = k$, one has
$$
\sum_{\mu=0}^{3} \partial_\mu^{(v)} \hat{T}^{\mu k}_{(can)}
= \partial_0^{(v)}(c\hat{\pi}_{v,k}) + \sum_{j=1}^3 \nabla_j^{(v)} \hat{p}_{v,jk}
= \frac{d\hat{\pi}_{v,k}}{dt} + \sum_{j=1}^3 \nabla_j^{(v)} \hat{p}_{v,jk} = 0
$$
by (B.12). ∎

## B.7 Symmetric Physical Microscopic Stress-Energy Tensor $\hat{\Theta}_{\mu\nu}^{(MPU)}$

The canonical tensor is symmetrized using the Belinfante-Rosenfeld procedure to obtain the physically relevant tensor.

**Theorem B.4 (Belinfante-Rosenfeld Symmetrization)**

Let $\hat{S}^{\lambda\mu\nu}(v)$ be a spin current operator (antisymmetric in $\mu,\nu$) such that the local conservation of total angular momentum holds in the form
$$
\partial_\lambda^{(v)} \left( x^\mu \hat{T}^{\lambda\nu}_{(can)}(v) - x^\nu \hat{T}^{\lambda\mu}_{(can)}(v) - \hat{S}^{\lambda\mu\nu}(v) \right)=0,
$$
together with local energy-momentum conservation (Theorem B.3, Eq B.13). Define the Belinfante-Rosenfeld improved tensor by
$$
\hat{\Theta}^{\mu\nu}_{(MPU)}(v)
= \hat{T}^{\mu\nu}_{(can)}(v)
+ \frac{1}{2}\partial_\lambda^{(v)}\!\left(\hat{S}^{\mu\lambda\nu}(v) + \hat{S}^{\nu\lambda\mu}(v) - \hat{S}^{\lambda\mu\nu}(v)\right). \tag{B.14}
$$
Then $\hat{\Theta}^{\mu\nu}_{(MPU)}$ is symmetric and satisfies:
$$
\partial_\mu^{(v)}\hat{\Theta}^{\mu\nu}_{(MPU)} = 0.
$$

*Proof:* From the assumed local conservation of total angular momentum and (B.13), expand the divergence:
$$
0=\partial_\lambda^{(v)}\!\left(x^\mu \hat{T}^{\lambda\nu}_{(can)}-x^\nu \hat{T}^{\lambda\mu}_{(can)}-\hat{S}^{\lambda\mu\nu}\right)
=\hat{T}^{\mu\nu}_{(can)}-\hat{T}^{\nu\mu}_{(can)}-\partial_\lambda^{(v)}\hat{S}^{\lambda\mu\nu},
$$
hence
$$
\hat{T}^{\mu\nu}_{(can)}-\hat{T}^{\nu\mu}_{(can)}=\partial_\lambda^{(v)}\hat{S}^{\lambda\mu\nu}. \quad (\ast)
$$
Define the superpotential
$$
\hat{B}^{\lambda\mu\nu}(v):=\frac{1}{2}\left(\hat{S}^{\mu\lambda\nu}(v)+\hat{S}^{\nu\lambda\mu}(v)-\hat{S}^{\lambda\mu\nu}(v)\right),
$$
so that (B.14) is $\hat{\Theta}^{\mu\nu}_{(MPU)}=\hat{T}^{\mu\nu}_{(can)}+\partial_\lambda^{(v)}\hat{B}^{\lambda\mu\nu}$. Using only $\hat{S}^{\lambda\mu\nu}=-\hat{S}^{\lambda\nu\mu}$, one checks $\hat{B}^{\lambda\mu\nu}=-\hat{B}^{\mu\lambda\nu}$.

*Symmetry.* Compute the antisymmetric part:
$$
\hat{\Theta}^{\mu\nu}_{(MPU)}-\hat{\Theta}^{\nu\mu}_{(MPU)}
=(\hat{T}^{\mu\nu}_{(can)}-\hat{T}^{\nu\mu}_{(can)})+\partial_\lambda^{(v)}(\hat{B}^{\lambda\mu\nu}-\hat{B}^{\lambda\nu\mu}).
$$
A direct substitution gives $\hat{B}^{\lambda\mu\nu}-\hat{B}^{\lambda\nu\mu}=-\hat{S}^{\lambda\mu\nu}$, hence
$$
\hat{\Theta}^{\mu\nu}_{(MPU)}-\hat{\Theta}^{\nu\mu}_{(MPU)}
=(\hat{T}^{\mu\nu}_{(can)}-\hat{T}^{\nu\mu}_{(can)})-\partial_\lambda^{(v)}\hat{S}^{\lambda\mu\nu}=0
$$
by $(\ast)$.

*Conservation.* Using (B.13) and $\hat{B}^{\lambda\mu\nu}=-\hat{B}^{\mu\lambda\nu}$,
$$
\partial_\mu^{(v)}\hat{\Theta}^{\mu\nu}_{(MPU)}
=\partial_\mu^{(v)}\hat{T}^{\mu\nu}_{(can)}+\partial_\mu^{(v)}\partial_\lambda^{(v)}\hat{B}^{\lambda\mu\nu}
=0+\partial_\mu^{(v)}\partial_\lambda^{(v)}\hat{B}^{\lambda\mu\nu}=0,
$$
since in the locally regular chart (Theorem 43) the mixed discrete derivatives commute and the double divergence is symmetric in $(\mu,\lambda)$ while $\hat{B}^{\lambda\mu\nu}$ is antisymmetric in $(\lambda,\mu)$. ∎

**Definition B.7 (Physical Microscopic Stress-Energy Operator)**

We identify the symmetric, conserved tensor $\hat{\Theta}_{\mu\nu}^{(MPU)}(v)$ from Eq (B.14) as the physical microscopic stress-energy tensor operator for MPU $v$.

## B.8 Macroscopic Stress–Energy Tensor $T_{\mu\nu}^{(MPU)}$

The macroscopic tensor sourcing emergent gravity is the coarse-grained average.

**Definition B.8 (Macroscopic MPU Stress-Energy Tensor $T_{\mu\nu}^{(MPU)}$)**

The macroscopic MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}(x)$ at spacetime point $x$ is the expectation value of the emergent operator field $\hat{\Theta}_{\mu\nu}(x)$ (formalized in Appendix F, Def F.4) in the relevant physical state $\omega$:
$$
T_{\mu\nu}^{\text{(MPU)}}(x) = \omega(\hat{\Theta}_{\mu\nu}(x)) \tag{B.15}
$$
This represents the thermodynamically relevant coarse-grained average $\langle \hat{\Theta}_{\mu\nu}^{(MPU)}(v) \rangle$.

**Theorem B.5 (Macroscopic Covariant Conservation of $T_{\mu\nu}^{(MPU)}$)**

On the regular branch, $T_{\mu\nu}^{(MPU)}(x)$ satisfies
$$
\nabla^{\mu} T_{\mu\nu}^{\text{(MPU)}} = 0 \tag{B.16}
$$
where $\nabla^{\mu}$ is the covariant derivative compatible with the emergent metric $g_{\mu\nu}$. The conservation law follows both microscopically and variationally:

1. *Microscopic route.* Theorem B.8b(b) (Belinfante Continuum Limit and Conservation) establishes distributional divergence-freeness of the continuum limit $\mathbf T^{\mu\nu}$ from the discrete weak-conservation identity (B.20) via Definition B.8a and mesh-consistency.
2. *Variational route.* Theorem F.1 (diffeomorphism invariance of the derived generally covariant effective action of Theorem X.5a, Appendix X) yields $\nabla^\mu T_{\mu\nu}=0$ on-shell through Noether's second theorem; the variational tensor coincides with the coarse-grained expectation-value tensor by Theorem B.8c (Variational Identification).

The two routes agree because both refer to the same object — Corollary B.8d.1 (Source-Term Identity) consolidates the four-way identity at the microscopic, variational, thermodynamic, and conservation levels.

## B.9 Correspondence with Standard Forms

The emergent tensor reproduces known physical forms.

**Definition B.8a (Admissible Coarse-Graining).** A refinement family $\{\mathcal G_h\}_{h\downarrow 0}$ of the PU substrate, together with discrete Belinfante tensors $\Theta_h^{\mu\nu}(v)$ and sampling maps producing tensor-valued Radon measures
$$
\mathbf T_h^{\mu\nu} \;:=\; \sum_{v\in V_h} \Theta_h^{\mu\nu}(v)\,\mu_h(v)\,\delta_{x_v},\tag{B.19}
$$
is *admissible* if: (i) for every compact $K\subset M_{\mathrm{reg}}$, $\sup_{h>0}|\mathbf T_h|(K)<\infty$; (ii) for every $\psi\in C_c^\infty(T^*M_{\mathrm{reg}})$, the discrete weak-conservation identity
$$
\sum_{v\in V_h}\Theta_h^{\mu\nu}(v)\,\mu_h(v)\,(\nabla_\mu^h \psi_\nu^{(h)})(v) \;=\; 0\tag{B.20}
$$
holds with $\nabla_\mu^h$ the discrete covariant derivative; (iii) the discrete gradient approximates the continuum gradient uniformly on compact supports: $\sup_{v\in K_h}\lvert(\nabla_\mu^h\psi_\nu^{(h)})(v)-(\nabla_\mu\psi_\nu)(x_v)\rvert=O(h)$.

Two admissible coarse-grainings $(\mathbf T_h),(\widetilde{\mathbf T}_h)$ are *$\varepsilon$-equivalent* if $|\mathbf T_h-\widetilde{\mathbf T}_h|(K)=O(h)\cdot|\mathbf T_h|(K)$ for every compact $K$.

**Theorem B.8b (Belinfante Continuum Limit and Conservation).** Let $(\mathbf T_h)_{h>0}$ be an admissible coarse-graining on the Lorentzian branch of Theorem 45 and Corollary 46a. Then:

(a) There exist a subsequence $h_j\to 0$ and a symmetric tensor-valued Radon measure $\mathbf T^{\mu\nu}$ on $M_{\mathrm{reg}}$ such that $\mathbf T_{h_j}^{\mu\nu}\rightharpoonup \mathbf T^{\mu\nu}$ in weak-$*$ on compact subsets.

(b) $\mathbf T$ is distributionally divergence-free: $\int_{M_{\mathrm{reg}}}\nabla_\mu\psi_\nu\,d\mathbf T^{\mu\nu}=0$ for every $\psi\in C_c^\infty(T^*M_{\mathrm{reg}})$.

(c) If $\mathbf T$ is absolutely continuous with respect to $dV_g$ (equivalent to local thermodynamic equilibrium, Postulate 4), then there exists $T_{(\mathrm{MPU})}^{\mu\nu}\in L^1_{\mathrm{loc}}(M_{\mathrm{reg}})$ with $d\mathbf T^{\mu\nu}=T_{(\mathrm{MPU})}^{\mu\nu}\,dV_g$ and $\nabla_\mu T_{(\mathrm{MPU})}^{\mu\nu}=0$ in the distributional sense. ∎

*Proof.* (a) Hypothesis (i) gives a uniform total-variation bound $|\mathbf T_h|(K)\le C_K<\infty$. By Banach–Alaoglu applied to $\mathcal M(K)$ as the dual of $C(K;T^{*2}M_{\mathrm{reg}})$, a weak-$*$ convergent subsequence on $K$ exists. A diagonal argument over an exhaustion of $M_{\mathrm{reg}}$ gives a globally defined weak-$*$ limit $\mathbf T$. Symmetry is preserved by weak-$*$ convergence.

(b) For $\psi\in C_c^\infty(T^*M_{\mathrm{reg}})$, (B.20) together with hypothesis (iii) gives
$$
0 \;=\; \sum_{v\in V_h}\Theta_h^{\mu\nu}(v)\,\mu_h(v)\,(\nabla_\mu\psi_\nu)(x_v) \;+\; E_h,
$$
with $|E_h|\le C_K\cdot O(h)$. Passing to the convergent subsequence and taking $h_j\to 0$ yields $\int\nabla_\mu\psi_\nu\,d\mathbf T^{\mu\nu}=0$.

(c) Under absolute continuity, the Radon–Nikodym theorem supplies $T_{(\mathrm{MPU})}^{\mu\nu}=d\mathbf T^{\mu\nu}/dV_g\in L^1_{\mathrm{loc}}$. Integration by parts of (b) against compactly supported $\psi$, with vanishing boundary terms, gives $\nabla_\mu T_{(\mathrm{MPU})}^{\mu\nu}=0$. ∎

**Corollary B.8b.1 (Independence of Admissible Coarse-Graining).** If $(\mathbf T_h)$ and $(\widetilde{\mathbf T}_h)$ are $\varepsilon$-equivalent admissible coarse-grainings, their continuum limits coincide: $\mathbf T^{\mu\nu}=\widetilde{\mathbf T}^{\mu\nu}$. When both admit pointwise representations under local equilibrium, $T_{(\mathrm{MPU})}^{\mu\nu}=\widetilde T_{(\mathrm{MPU})}^{\mu\nu}$ almost everywhere.

*Proof.* For any compactly supported $\phi\in C(K;T^{*2}M_{\mathrm{reg}})$, $\lvert\langle\mathbf T_h-\widetilde{\mathbf T}_h,\phi\rangle\rvert\le|\mathbf T_h-\widetilde{\mathbf T}_h|(K)\cdot\sup_K|\phi|=O(h)\cdot C_K\cdot\sup_K|\phi|$, so the limits agree on a dense set and therefore as measures. Radon–Nikodym uniqueness gives a.e. equality of densities. ∎

**Theorem B.8c (Variational Identification of the Continuum Source Tensor).** Let $S_{(\mathrm{MPU})}[g,\Phi]=\int_{M_{\mathrm{reg}}}\mathcal L_{(\mathrm{MPU})}(g,\Phi)\sqrt{|g|}\,d^4x$ be the continuum matter action obtained from Theorem D.6d. Assume: (H B.8c.1) $S_{(\mathrm{MPU})}$ is Gâteaux differentiable with respect to compactly supported smooth metric perturbations $\delta g_{\mu\nu}$; (H B.8c.2) the discrete first variations agree with the continuum first variation up to $O(h)$ remainders under the admissible coarse-graining of Definition B.8a. Then
$$
\delta_g S_{(\mathrm{MPU})}[g,\Phi;\delta g] \;=\; \tfrac12\int_{M_{\mathrm{reg}}}\delta g_{\mu\nu}\,d\mathbf T^{\mu\nu},
$$
and under local equilibrium,
$$
T_{(\mathrm{MPU})}^{\mu\nu} \;=\; -\frac{2}{\sqrt{|g|}}\,\frac{\delta S_{(\mathrm{MPU})}}{\delta g_{\mu\nu}}.\tag{B.21}
$$

*Proof.* By (H B.8c.2), $\delta_g S_h^{(\mathrm{MPU})}[\delta g]=\tfrac12\int\delta g_{\mu\nu}\,d\mathbf T_h^{\mu\nu}+r_h(\delta g)$ with $r_h(\delta g)=O(h)$. For fixed $\delta g$, weak-$*$ convergence (Theorem B.8b) gives $\int\delta g_{\mu\nu}\,d\mathbf T_{h_j}^{\mu\nu}\to\int\delta g_{\mu\nu}\,d\mathbf T^{\mu\nu}$. Combined with (H B.8c.1), which supplies $\delta_g S_{h_j}^{(\mathrm{MPU})}\to\delta_g S_{(\mathrm{MPU})}$, this yields the stated identity. Absolute continuity and the definition of the metric functional derivative give (B.21). ∎

**Theorem B.8d (Horizon-Flux Closure).** Let $\mathcal H$ be a smooth local horizon patch in a local Rindler region with null generator $k^\mu$, affine parameter $\lambda$, and approximate boost Killing field $\chi^\mu=-\kappa\lambda k^\mu+O(\lambda^2)$. Assume (H B.8d.1) continuity of $T_{(\mathrm{MPU})}^{\mu\nu}$ on $\mathcal H$ (a consequence of Postulate 4). Let $\mathcal H_h$ be an admissible family of discrete face-unions approximating $\mathcal H$ with face fluxes $q_h(f)$ induced by the current operators of Definition B.5. Then:

(a) *Flux convergence.*
$$
\sum_{f\subset\mathcal H_h} q_h(f) \;\xrightarrow[h\to 0]{}\; \int_{\mathcal H} T_{\mu\nu}^{(\mathrm{MPU})}\,\chi^\mu\,d\Sigma^\nu.
$$

(b) *Clausius flux formula.* To first order in $\lambda$,
$$
\delta Q_\mathcal H \;=\; \int_{\mathcal H} T_{\mu\nu}^{(\mathrm{MPU})}\,\chi^\mu\,d\Sigma^\nu \;=\; -\kappa\int_\mathcal H \lambda\,T_{\mu\nu}^{(\mathrm{MPU})}\,k^\mu k^\nu\,d\lambda\,dA,
$$
reproducing Equation (68). ∎

*Proof.* (a) On the null surface with $d\Sigma^\nu=k^\nu\,d\lambda\,dA$, the integrand $T_{(\mathrm{MPU})}^{\mu\nu}\chi^\mu k^\nu$ is continuous by (H B.8d.1) and the smoothness of $\chi,k$. Admissibility of the horizon discretization makes the face-sum $\sum_f\Theta_h^{\mu\nu}(x_f)\chi^\mu(x_f)n^\nu(x_f)\Delta A_f$ a Riemann sum, with $O(h)$ error per face; the sum converges to the continuum integral.

(b) Substituting $\chi^\mu=-\kappa\lambda k^\mu+O(\lambda^2)$ into (a) and discarding $O(\lambda^2)$ corrections yields (b). ∎

**Corollary B.8d.1 (Source-Term Identity).** On $M_{\mathrm{reg}}$ under the admissibility and local-equilibrium hypotheses of Definition B.8a and (H B.8d.1), the tensor $T_{\mu\nu}^{(\mathrm{MPU})}$ coincides simultaneously with: (1) the continuum Belinfante limit of Theorem B.8b; (2) the metric variational source $-\tfrac{2}{\sqrt{|g|}}\,\delta S_{(\mathrm{MPU})}/\delta g_{\mu\nu}$ of Theorem B.8c; (3) a covariantly conserved symmetric tensor ($\nabla_\mu T^{\mu\nu}=0$ by Theorem B.8b(b) and, independently, by Corollary 45a.1); (4) the horizon heat-flux source of Theorem B.8d. The gravity derivation of §12 therefore uses one and the same stress-energy object at the microscopic, variational, thermodynamic, and conservation levels. ∎

*Proof.* Items (1), (2), (4) follow from Theorems B.8b, B.8c, B.8d. Item (3) follows from Theorem B.8b(b) directly and, independently, from Corollary 45a.1 applied to the scalar-density matter action of Theorem 45a. The two routes agree because they refer to the same underlying tensor identified by (1) and (2). ∎

**Corollary B.8d.2 (Vacuum Normalization and $\Lambda$-Absorption).** The continuum Belinfante tensor is defined up to an additive metric-proportional constant absorbed into the cosmological constant. Under the shift $T'_{\mu\nu}:=T_{\mu\nu}^{(\mathrm{MPU})}+\sigma g_{\mu\nu}$ for constant $\sigma$, the Einstein equation (76a) is equivalent to its form with $T'_{\mu\nu}$ and $\Lambda':=\Lambda-(8\pi G/c^4)\sigma$. The PCE-Attractor vacuum normalization $T_{\mu\nu}^{(\mathrm{MPU})}|_{\mathrm{vac}}=0$ (Theorem B.6(a)) fixes $\sigma$ uniquely, placing the vacuum contribution into $\Lambda$ (whose value is determined by Appendix U).

*Proof.* Substitute $T'_{\mu\nu}=T_{\mu\nu}^{(\mathrm{MPU})}+\sigma g_{\mu\nu}$ into (76a) and collect the metric-proportional terms on the geometric side. Theorem B.6(a) fixes the vacuum contribution to zero in the PU convention, so $\sigma$ is determined. ∎

**Theorem B.6 (Correspondence with Standard Physical Forms)**

The macroscopic tensor $T_{\mu\nu}^{(MPU)}(x)$ (Def B.8) reproduces standard forms:
(a) **Vacuum State $\omega_{vac}$:** In a Poincaré-invariant vacuum, symmetry implies that the vacuum expectation of the stress-energy tensor is proportional to the metric:
$$
T_{\mu\nu}^{(MPU)}\big|_{vac} = \kappa\, g_{\mu\nu}
$$
for some constant $\kappa$. In the PU convention used in Eq (76), the cosmological constant $\Lambda$ is carried entirely by the geometric term on the left-hand side, and $T_{\mu\nu}^{(MPU)}$ is understood as the renormalized excitation stress-energy with the vacuum contribution absorbed into $\Lambda$. Therefore $\kappa=0$ and
$$
T_{\mu\nu}^{(MPU)}\big|_{vac} = 0. \tag{B.17}
$$

(b) **Perfect Fluid (Local Thermal Equilibrium $\omega_{th}$):**
$$
T_{\mu\nu}^{(MPU)} \big|_{th} = (\rho_{th} + p_{th}/c^2) u_\mu u_\nu + p_{th} g_{\mu\nu} \tag{B.18}
$$

*Proof:* (a) In a Poincaré-invariant vacuum, translation invariance makes $T_{\mu\nu}^{(MPU)}\big|_{vac}$ constant in spacetime, and Lorentz invariance restricts any constant symmetric rank-2 tensor to be proportional to $g_{\mu\nu}$. In the convention of Eq (76) (with $\Lambda g_{\mu\nu}$ retained on the geometric side), the vacuum contribution is absorbed into $\Lambda$ by definition of the renormalized matter stress-energy, so the proportionality constant is fixed to zero, giving (B.17). (b) In the local rest frame of an isotropic medium, spatial isotropy forces $T_{0i}=0$ and $T_{ij}=p\,\delta_{ij}$ while $T_{00}=\rho c^2$. Writing this covariantly in terms of the four-velocity $u^\mu$ yields $T_{\mu\nu}^{(MPU)}=(\rho+p/c^2)u_\mu u_\nu + p\, g_{\mu\nu}$. ∎

## B.10 Construction Pathway (Summary)

This appendix detailed the construction of $T_{\mu\nu}^{(MPU)}$:

1.  Defined operational complexity $\hat{C}_v$ (Def B.1) and cost operators $\hat{R}, \hat{R}_I$ (Thm B.1), justified via dynamic correspondence (Thm 2).
2.  Derived the SPAP complexity bound (Thm B.2) using a unified complexity functional (Def B.2).
3.  Constructed microscopic energy density $\hat{\rho}_v$ (Def B.3) including interaction energy $\hat{V}_{vv'}$ incorporating dissipative costs linked to $\varepsilon$ (Def B.4).
4.  Defined microscopic flow operators $\hat{\pi}, \hat{p}$ via local conservation (Def B.5).
5.  Assembled the canonical tensor $\hat{T}^{\mu\nu}_{(can)}$ (Def B.6) and proved its conservation (Thm B.3).
6.  Constructed the symmetric, physical tensor $\hat{\Theta}_{\mu\nu}^{(MPU)}$ (Thm B.4, Def B.7).
7.  Defined the macroscopic tensor $T_{\mu\nu}^{(MPU)}$ (Def B.8).
8.  Established its covariant conservation (Thm B.5) and correspondence with standard forms (Thm B.6).

This provides a self-consistent definition of the stress-energy tensor arising from the underlying MPU network dynamics and costs, suitable for sourcing the emergent gravitational field (Eq 76).



