# Appendix B: Operational Complexity, Costs, and Stress–Energy Tensor Construction

This appendix provides the detailed construction and justification for key operators used within the Predictive Universe (PU) framework, culminating in the definition of the macroscopic MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}$. This includes the operational complexity operator $\hat{C}_v$ used as a proxy for the theoretical $C_P$, the associated resource cost operators $\hat{R}$ and $\hat{R}_I$, a rigorous lower bound for complexity near the SPAP limit, and the operators representing local energy density and flows, ensuring consistency with the framework's principles and conservation laws.

*(Units convention.)* Throughout this appendix we retain explicit
$\hbar$, $c$, and $k_B$ factors so that every operator’s physical
dimension is transparent. Predictive Physical Complexity ($C_P$ and its proxy $\hat C_v$) carries its own base dimension $\mathrm{[Complexity]}$, e.g.\ $[\hat C_v]=\mathrm{[Complexity]}$. Information-theoretic quantities such as the entropy $\varepsilon$ or
the channel capacity $C_{\max}$ are dimensionless, typically expressed
in nats (natural-log base $e$). The physical relevance of all complexity-derived cost terms rests on the Dynamically Enforced Functional Correspondence (Theorem 2), rigorously proven in **Appendix D**, which equates operational cost with predictive cost in steady-state MPU optimisation.

## B.1 Operational Predictive Physical Complexity $\hat{C}_v$

The theoretical Predictive Physical Complexity $C_{\mathrm P}(\mu)$ (Equation 1) is defined via a limit of algorithmic complexities, making it generally uncomputable. For the system's adaptive dynamics to operate on a physical observable that tracks this complexity, a computable operational proxy is required. Within the emergent quantum setting (Proposition 4), quantum circuit complexity provides a suitable measure, possessing expected properties like monotonicity with physical resources, approximate additivity, and computational accessibility. We formally define the operator representing this observable proxy.

**Definition B.1 (Operational Complexity Operator $\hat{C}_v$)**

For each MPU $v$, its operational complexity is represented by a Hermitian, positive-semi-definite operator $\hat C_v$ acting on the MPU's Hilbert space $\mathcal{H}_v$ (Proposition 4), identified with quantum circuit complexity. This operator is defined via its spectral decomposition:

 $$
 \hat C_v \;=\;
 \sum_{d=0}^{\infty}\lambda(d)\,\hat P_d
 \tag{B.1}
 $$

 where:

 *   $d \in \mathbb{N}_0$ is a dimensionless integer representing the minimum number of fundamental quantum gates (circuit size, relative to a fixed universal gate set) required to prepare states in the subspace $\hat{P}_d \mathcal{H}_v$ starting from a reference state $|K_0\rangle$ corresponding to the Horizon Constant $K_0$.
 *   $\hat{P}_d$ is the orthogonal projector onto the subspace of $\mathcal{H}_v$ consisting of states requiring additional circuit complexity $d$ relative to $|K_0\rangle$. These projectors are orthogonal and complete: $\hat{P}_d \hat{P}_{d'} = \delta_{dd'} \hat{P}_d$ and $\sum_{d} \hat{P}_d = \hat{I}$ (where the sum becomes effectively finite for a finite-dimensional $\mathcal{H}_v$).
 *   $\lambda(d)$ are the eigenvalues of $\hat{C}_v$, representing the effective Predictive Physical Complexity for states in the subspace $\hat{P}_d \mathcal{H}_v$. These eigenvalues are non-decreasing with $d$:
     $$ \lambda(d) = K_0 + \Delta C(d) \tag{B.2} $$
     where $K_0$ is the Horizon Constant (Theorem 15) and $\Delta C(d) \ge 0$ is the additional complexity due to circuit depth $d$, with $\Delta C(0)=0$.

 For an MPU with a finite-dimensional Hilbert space $\mathcal{H}_v$ of dimension $d_0$ (Theorem 23), the sum in Equation (B.1) is understood to be effectively finite. Only a finite number of distinct, non-zero orthogonal projectors $\hat{P}_d$ corresponding to achievable complexity levels can exist, or for $d$ beyond a certain $d_{max}$, the projectors $\hat{P}_d$ become zero or the eigenvalues $\lambda(d)$ cease to increase, reflecting the capacity limit of the $d_0$-dimensional space.

The expectation value $\langle \psi | \hat{C}_v | \psi \rangle$ for a state $|\psi\rangle$ provides the MPU's operational measure of complexity. The justification for this operator serving as a valid, dynamically selected proxy for the theoretical $C_P$ at viable equilibria is rigorously provided by Theorem 2 (Dynamically Enforced Functional Correspondence), detailed in **Appendix D**.

*Proof:* The definition of $\hat{C}_v$ as a Hermitian operator with a spectral decomposition based on quantum circuit complexity levels is standard in quantum information theory. The property of being positive-semidefinite follows from $\lambda(d) = K_0 + \Delta C(d) \ge K_0 > 0$.

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

*Proof:* The definition of operators via functional calculus on a Hermitian operator ($\hat{C}_v$) is a standard mathematical construction. The properties of self-adjointness (Hermitian) and positive-semidefiniteness for $\hat{R}$ and $\hat{R}_I$ follow directly from the real-valued and non-negative nature of the functions $R(\cdot)$ and $R_I(\cdot)$ when applied to the non-negative eigenvalues $\lambda(d)$ of $\hat{C}_v$.

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
For $\beta\in(0,1/2)$,
$$
D(\mathrm{Bern}(1-\beta)\|\mathrm{Bern}(\beta))
=(1-2\beta)\log\!\left(\frac{1-\beta}{\beta}\right)
\ge \log\!\left(\frac{1}{2\beta}\right),
$$
since $\frac{1-\beta}{\beta}\ge \frac{1}{2\beta}$ and $1-2\beta\in(0,1)$.

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
16N\delta^2\ \ge\ \log\!\left(\frac{1}{2\beta}\right)
\quad\Rightarrow\quad
N\ \ge\ \frac{1}{16\delta^2}\log\!\left(\frac{1}{2\beta}\right).
$$
Taking the natural self-calibrated confidence choice $\beta=\delta$ (a strategy that claims accuracy $\delta$ but fails with probability much larger than $\delta$ is not operationally meaningful in the SPAP self-referential context, since the failure probability feeds back into the prediction loop) gives $N=\Omega(\log(1/\delta)/\delta^2)$. Finally, each sample acquisition and each internal update is counted as an elementary operation in $\mathrm{Cost}(\cdot;\delta)$, hence $C_{\text{uni}}(\delta)\ge N$, proving (B.5). ∎

This log-enhanced quadratic divergence of the dimensionless unified complexity $C_{\text{uni}}(\delta_{\rm SPAP})$ (Eq B.5) represents a fundamental information-processing lower bound within the PU framework. This lower bound underlies the divergence of the Predictive Physical Complexity $C_{pred}(\alpha)$ in Theorem 14 of the main text, since any physically realizable predictor must supply at least $C_{\text{uni}}(\delta_{\rm SPAP})$ effective computational resources to sustain performance $\alpha=\alpha_{SPAP}-\delta_{\rm SPAP}$.

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
\frac{d}{dt}\hat{\rho}_v + \sum_{j=1}^3 \nabla_j^{(v)} \hat{q}_{v,j} = 0. \tag{B.11}
$$
Define the momentum density by $\hat{\pi}_{v,j} := \hat{q}_{v,j}/c^2$ and define the stress operators $\hat{p}_{v,jk}$ by requiring local momentum conservation:
$$
\frac{d}{dt}\hat{\pi}_{v,j} + \sum_{k=1}^3 \nabla_k^{(v)}\hat{p}_{v,jk} = 0. \tag{B.12}
$$
These equations define $(\hat{\pi}_{v,j}, \hat{p}_{v,jk})$ consistently with the Hamiltonian and energy density in the locally regular chart.

## B.6 Canonical Microscopic Stress-Energy Tensor $\hat{T}^{\mu\nu}_{(can)}$

We assemble the density and flux operators into a canonical stress-energy tensor.

**Definition B.6 (Canonical Microscopic Stress-Energy Operator $\hat{T}^{\mu\nu}_{(can)}$)**

The canonical microscopic stress-energy operator $\hat{T}^{\mu\nu}_{(can)}(v)$ for MPU $v$ is defined by its components in a local frame (0=time, j,k=spatial):

*   $\hat{T}^{00}_{(can)}(v) = \hat{\rho}_v$ (Energy Density, Eq B.6)
*   $\hat{T}^{0j}_{(can)}(v) = c \hat{\pi}_{v,j}$ (Energy flux density)
*   $\hat{T}^{j0}_{(can)}(v) = c \hat{\pi}_{v,j}$ (Momentum density scaled)
*   $\hat{T}^{jk}_{(can)}(v) = \hat{p}_{v,jk}$ (Stress)

(By definition $\hat{\pi}_{v,j}:=\hat{q}_{v,j}/c^2$, one has $\hat{T}^{0j}_{(can)}(v)=\hat{T}^{j0}_{(can)}(v)$.)

**Theorem B.3 (Microscopic Conservation Law for $\hat{T}^{\mu\nu}_{(can)}$)**

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
\partial_\mu^{(v)}\hat{\Theta}^{\mu\nu}_{(MPU)} = 0. \tag{B.15}
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

Assuming a generally covariant emergent effective theory, $T_{\mu\nu}^{(MPU)}(x)$ satisfies:
$$
\nabla^{\mu} T_{\mu\nu}^{\text{(MPU)}} = 0 \tag{B.16}
$$
where $\nabla^{\mu}$ is the covariant derivative compatible with the emergent metric $g_{\mu\nu}$.
*Proof:* Follows from diffeomorphism invariance via Noether's second theorem (Appendix F, Thm F.1).

## B.9 Correspondence with Standard Forms

The emergent tensor reproduces known physical forms.

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



