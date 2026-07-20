# Appendix B: Operational Complexity, Costs, and Stress–Energy Tensor Construction

This appendix provides the detailed construction and justification for key operators used within the Predictive Universe (PU) framework, culminating in the definition of the macroscopic MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}$. This includes the operational complexity operator $\hat{C}_v$ used as a proxy for the theoretical $C_P$, the associated resource cost operators $\hat{R}$ and $\hat{R}_I$, a rigorous lower bound for complexity near the SPAP limit, and the operators representing local energy density and flows, ensuring consistency with the framework's principles and conservation laws.

*(Units convention.)* Throughout this appendix we retain explicit
$\hbar$, $c$, and $k_B$ factors so that every operator’s physical
dimension is transparent. Predictive Physical Complexity ($C_P$ and its proxy $\hat C_v$) carries its own base dimension $\mathrm{[Complexity]}$, e.g.\ $[\hat C_v]=\mathrm{[Complexity]}$. Information-theoretic quantities such as the entropy $\varepsilon$ or
the channel capacity $C_{\max}$ are dimensionless, typically expressed
in nats (natural-log base $e$). The physical interpretation of complexity-derived cost terms is conditional on the functional-correspondence branch of Theorem 2. At a stable PCE equilibrium satisfying Dominance of Stabilizing Costs and faithful-cost identifiability/noncompensation, the operational proxy must align with the predictive complexity in the theorem's stated sense. Appendix D supplies the corresponding adaptation dynamics under its separate variational hypotheses; neither result asserts a universal equality of operational and predictive costs away from that branch.

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

The proxy can be used for exact PCE selection only on branches where the tracking noise is dominated by the PCE gap. Let $x^*$ be the $C_P$-selected representative in an admissible finite-response class $\mathcal A$, and suppose the proxy satisfies
$$
|C_P(x)-\hat C(x)|\le \varepsilon
\qquad
(x\in\mathcal A).
$$
If the true separation gap is
$$
\Delta_P
:=
\inf_{[x]\ne[x^*]}
\big(C_P(x)-C_P(x^*)\big)>2\varepsilon,
$$
then $\hat C$ selects the same PPI/PCE class:
$$
\hat C(x)-\hat C(x^*)
\ge C_P(x)-C_P(x^*)-2\varepsilon
\ge \Delta_P-2\varepsilon>0.
$$
Thus proxy-based minimization is theorem-preserving precisely on the gap-dominating branch $\Delta_P>2\varepsilon$. If this inequality is not certified, the proxy remains an operational tracker and not an exact selector.

*Proof.* Let
$$
\mathcal D(\hat C_v)
:=\left\{\psi\in\mathcal H_v:
\sum_{d=0}^{\infty}\lambda(d)^2\|\hat P_d\psi\|^2<\infty\right\}.
$$
Orthogonality and completeness of the projectors give
$$
\psi=\sum_d\hat P_d\psi,
\qquad
\|\psi\|^2=\sum_d\|\hat P_d\psi\|^2.
$$
On the displayed domain, $\hat C_v\psi=\sum_d\lambda(d)\hat P_d\psi$ is the real diagonal spectral operator. Its adjoint has the same diagonal coefficients and the same square-summability domain, so $\hat C_v^*=\hat C_v$. For every $\psi\in\mathcal D(\hat C_v)$,
$$
\langle\psi,\hat C_v\psi\rangle
=\sum_d\lambda(d)\|\hat P_d\psi\|^2
\ge K_0\sum_d\|\hat P_d\psi\|^2
=K_0\|\psi\|^2\ge0.
$$
Thus $\hat C_v$ is self-adjoint and positive. The coarse-graining remains branch data and need not coincide with mathematical circuit-complexity level sets. ∎

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

**Definition B.2 (Unified Complexity Functional $C_{\mathrm{uni}}$)**

Consider the task of achieving average predictive performance $\alpha$ on SPAP-limited aspects, where $\alpha$ is within an error margin $\delta_{\mathrm{SPAP}} = \alpha_{SPAP} - \alpha$ of the maximum limit $\alpha_{SPAP}$.

A $\delta_{\mathrm{SPAP}}$-accurate SPAP strategy is any physically realizable procedure $S$ whose verification/calibration loop produces a predictor that achieves performance at least $\alpha_{SPAP}-\delta_{\mathrm{SPAP}}$ while the probability of violating this target is at most $\delta_{\mathrm{SPAP}}$. For such a strategy, define $\mathrm{Cost}(S;\delta_{\mathrm{SPAP}})$ to be its worst-case number of elementary physical operations, counting (i) each acquisition of an interaction outcome used for verification/calibration and (ii) each elementary internal update step used to process those outcomes and update the predictor. The unified complexity functional $C_{\mathrm{uni}}$ is the minimal such cost over all $\delta_{\mathrm{SPAP}}$-accurate strategies:
$$
C_{\mathrm{uni}}\bigl(\delta_{\mathrm{SPAP}}\bigr) := \inf_{S\ \delta_{\mathrm{SPAP}}\text{-accurate}} \mathrm{Cost}(S;\delta_{\mathrm{SPAP}}). \tag{B.4}
$$
This functional captures the fundamental effective computational resources demanded by high-accuracy self-calibration within the PU framework.

**Theorem B.2 (Conditional Log-Enhanced Quadratic Lower Bound).** For every $0<\delta\le1/8$ and every $\delta$-accurate admissible strategy $S$, assume certificate $\mathfrak C_{B.2}$ maps $S$, under either Bernoulli law $p_\pm=1/2\pm2\delta$, to a test based on $N(S,\delta)$ independent observations whose two errors are at most $\beta(\delta)\le\delta$, and proves
$$
\operatorname{Cost}(S;\delta)\ge c_sN(S,\delta)
$$
with fixed $c_s>0$. Then every such $S$ satisfies
$$
N(S,\delta)\ge\frac{3}{128\delta^2}\ln\!\left(\frac1{4\beta(\delta)}\right),
$$
and taking the infimum over $S$ gives
$$
C_{\mathrm{uni}}(\delta)=\Omega\!\left(\frac{\log(1/\delta)}{\delta^2}\right).\tag{B.5}
$$

*Proof.* Under $p_-=1/2-2\delta$, an estimate within $\delta$ of $p_-$ lies below $1/2$; under $p_+=1/2+2\delta$, an estimate within $\delta$ of $p_+$ lies above $1/2$. Thresholding at $1/2$ therefore gives a test whose type-I and type-II errors are each at most $\beta$.

Let $P_-^N$ and $P_+^N$ be the laws of the $N$ independent observations. The Bretagnolle–Huber inequality (Bretagnolle & Huber 1979) applies to these two probability laws and gives, for every test with errors $a,b$,
$$
a+b\ge\frac12\exp[-D(P_-^N\|P_+^N)].
$$
Independence gives
$$
D(P_-^N\|P_+^N)=N D(\operatorname{Bern}(p_-)\|\operatorname{Bern}(p_+)).
$$
Since $a+b\le2\beta$, it follows that
$$
ND(\operatorname{Bern}(p_-)\|\operatorname{Bern}(p_+))
\ge\ln\left(\frac1{4\beta}\right).
\tag{B.5b}
$$

Put $x=4\delta\le1/2$. Direct substitution into the Bernoulli relative entropy gives
$$
D(\operatorname{Bern}(p_-)\|\operatorname{Bern}(p_+))
=4\delta\ln\left(\frac{1+x}{1-x}\right).
$$
Moreover,
$$
\ln\left(\frac{1+x}{1-x}\right)
=2\int_0^x\frac{dt}{1-t^2}
\le\frac{2x}{1-x^2}
\le\frac{8x}{3},
$$
because $0\le x\le1/2$. Therefore
$$
D(\operatorname{Bern}(p_-)\|\operatorname{Bern}(p_+))
\le4\delta\frac{8(4\delta)}3
=\frac{128}{3}\delta^2.
$$
Combining this with (B.5b) proves
$$
N\ge\frac{3}{128\delta^2}\ln\left(\frac1{4\beta}\right).
$$
Multiplication by $c_s$ and the infimum over the uniformly certified strategies give (B.5). ∎

**Corollary B.2.1 (Conditional Pattern-Specific Cost Inheritance).** Let $\mathcal S_E$ be the admissible strategies integrating pattern $E$ at margin $\delta_S(E)>0$. Assume a certificate maps every $S\in\mathcal S_E$ to a $\delta_S(E)$-accurate strategy in Definition B.2, preserves the two hard Bernoulli laws and their confidence requirement, and proves
$$
\operatorname{Cost}_{\mathrm{integrate}}(S,E)
\ge \operatorname{Cost}_{B.2}(\mathcal R_E(S);\delta_S(E)).
$$
Then
$$
C_{\mathrm{integrate}}(S,E)
\ge C_{\mathrm{uni}}(\delta_S(E))
=\Omega\!\left(\frac{\log(1/\delta_S(E))}{\delta_S(E)^2}\right).
\tag{B.5a}
$$
Without this uniform reduction certificate, self-reference or self-model engagement alone does not establish (B.5a).

*Proof.* Let $S\in\mathcal S_E$. By hypothesis, $\mathcal R_E(S)$ is admissible in the strategy class of Definition B.2 at margin $\delta_S(E)$. Hence the definition of the infimum gives
$$
\operatorname{Cost}_{B.2}(\mathcal R_E(S);\delta_S(E))
\ge C_{\mathrm{uni}}(\delta_S(E)).
$$
Combining this inequality with the certified cost preservation gives the first inequality in (B.5a). Theorem B.2 supplies the final asymptotic lower bound. Every step uses the uniform reduction certificate; absent that certificate, the comparison with the infimum class is unavailable. ∎

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

The constants $V_{\mathrm{MPU}}$ and $\tau_0$ are separately registered effective volume and operational-clock data for this dimensional conversion. Theorem 29 may motivate a characteristic internal timescale but does not identify $\tau_0$ with a universal minimum update duration. Let $\mathcal N[v]$ contain $v$, all incident-edge endpoints, and every auxiliary degree of freedom in the support of $\hat\rho_v$. Then $\hat\rho_v$ is Hermitian on $\mathcal H_{\mathcal N[v]}$, and its expectation is
$$
\langle\hat\rho_v\rangle
=
\operatorname{tr}_{\mathcal H_{\mathcal N[v]}}\!\left(
\rho_{\mathcal N[v]}\hat\rho_v
\right),
$$
where $\rho_{\mathcal N[v]}$ is the reduced state on that support. This expectation represents the average local energy density assigned to MPU $v$.

**Definition B.4 (Structure of Interaction Operator $\hat{V}_{vv'}$)**

Let $r_{int}(t)$ be the realized completed reset-support update rate on this edge. The ND-RID per-update constraint gives the activity-conditioned ledger
$$
\dot S_{tot}(t)\ge k_B\epsilon\,r_{int}(t),
\qquad
0\le r_{int}(t)\le\frac{1}{\tau_{int}}.
\tag{B.10}
$$
The value $k_B\epsilon/\tau_{int}$ is obtained only on a registered sustained one-update-per-$\tau_{int}$ branch; the interaction duration alone supplies no positive rate floor.



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

Assume a local chart with a registered discrete divergence and flux assignment for which (B.11) has the directional form
$$
\frac{d}{dt}\hat{\rho}_v + \sum_{j=1}^3 \nabla_j^{(v)} \hat{q}_{v,j} = 0.
$$
On the momentum-flux closure branch, assume in addition that: (i) the discrete translation Noether momentum density $\hat\pi_{v,j}^{\mathrm N}$ exists; (ii) the local relativistic bridge identifies
$$
\hat\pi_{v,j}^{\mathrm N}=\frac{\hat q_{v,j}}{c^2};
$$
and (iii) the corresponding Noether stress $\hat p_{v,jk}$ satisfies
$$
\frac{d}{dt}\hat\pi_{v,j}^{\mathrm N}
+
\sum_{k=1}^3\nabla_k^{(v)}\hat p_{v,jk}=0.
\tag{B.12}
$$
Write $\hat\pi_{v,j}:=\hat\pi_{v,j}^{\mathrm N}$. The stress is defined up to addition of a discrete divergence-free tensor. If the chart, Noether current, relativistic bridge, or closure identity is absent, the canonical stress-tensor construction below does not apply.

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

Let $\hat{S}^{\lambda\mu\nu}(v)$ be a spin current operator antisymmetric in $\mu,\nu$. Assume that the registered discrete derivative satisfies the coordinate Leibniz identities
$$
\partial_\lambda^{(v)}(x^\mu A^\lambda)
=
\delta_\lambda^{\mu}A^\lambda
+
x^\mu\partial_\lambda^{(v)}A^\lambda
$$
on the retained fields and that mixed derivatives commute on the superpotential below. Assume also local energy-momentum conservation (Theorem B.3, Equation B.13) and local total-angular-momentum conservation
$$
\partial_\lambda^{(v)} \left( x^\mu \hat{T}^{\lambda\nu}_{(can)}(v) - x^\nu \hat{T}^{\lambda\mu}_{(can)}(v) - \hat{S}^{\lambda\mu\nu}(v) \right)=0.
$$
Define the Belinfante-Rosenfeld improved tensor by
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

The macroscopic tensor sourcing emergent gravity is the unique regular-branch source tensor obtained from the same coarse-grained MPU operator field and the same metric variation of the continuum MPU action.

**Definition B.8 (Macroscopic MPU Stress-Energy Tensor $T_{\mu\nu}^{(MPU)}$)**

The macroscopic MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}(x)$ at spacetime point $x$ is the expectation value of the emergent operator field $\hat{\Theta}_{\mu\nu}(x)$ (formalized in Appendix F, Def F.4) in the relevant physical state $\omega$:
$$
T_{\mu\nu}^{\text{(MPU)}}(x) = \omega(\hat{\Theta}_{\mu\nu}(x))
\tag{B.15}
$$
This represents the thermodynamically relevant coarse-grained average $\langle \hat{\Theta}_{\mu\nu}^{(MPU)}(v) \rangle$. On the regular local-equilibrium branch where the continuum MPU action exists and is Gâteaux differentiable, Theorem B.8c identifies the same tensor with the metric variational source
$$
T_{(\mathrm{MPU})}^{\mu\nu}
=
\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g_{\mu\nu}},
\qquad
T^{(\mathrm{MPU})}_{\mu\nu}
=
-\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g^{\mu\nu}}
\tag{B.15a}
$$
Thus the expectation-value source, Belinfante continuum source, horizon heat-flux source, and metric variational source are not four independent objects; Corollary B.8d.1 identifies them as the same $T_{\mu\nu}^{(MPU)}$ on the stated branch.

**Theorem B.5 (Macroscopic Covariant Conservation of $T_{\mu\nu}^{(MPU)}$)**

On the regular branch and under the local-equilibrium hypothesis of Theorem B.8b(c), $T_{\mu\nu}^{(MPU)}(x)$ satisfies
$$
\nabla^{\mu}T_{\mu\nu}^{\text{(MPU)}}=0
\tag{B.16}
$$
in the distributional sense. On the smooth on-shell variational branch of Theorems F.1 and B.8c, the same equation holds pointwise.

*Proof.* Definition B.8a supplies the discrete weak-conservation identity and mesh-consistency assumptions. Theorem B.8b(b) passes those identities to the continuum measure $\mathbf T^{\mu\nu}$ and proves
$$
\int\nabla_\mu\psi_\nu\,d\mathbf T^{\mu\nu}=0
$$
for every compactly supported smooth test one-form $\psi$. Under local equilibrium, Theorem B.8b(c) writes $d\mathbf T^{\mu\nu}=T_{(\mathrm{MPU})}^{\mu\nu}dV_g$, so the last display is precisely $\nabla_\mu T_{(\mathrm{MPU})}^{\mu\nu}=0$ in distributions.

On the smooth variational branch, Theorem F.1 applies to the diffeomorphism-invariant on-shell action and gives covariant conservation of its metric-variation tensor. Theorem B.8c identifies that tensor with the continuum measure density, and Corollary B.8d.1 identifies it with the coarse-grained MPU source. Hence the microscopic and variational routes concern the same tensor. Distributional equality agrees with pointwise equality when the tensor is smooth. ∎

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

(a) There exist a subsequence $h_j\to0$ and a symmetric tensor-valued Radon measure $\mathbf T^{\mu\nu}$ on $M_{\mathrm{reg}}$ such that $\mathbf T_{h_j}^{\mu\nu}\rightharpoonup\mathbf T^{\mu\nu}$ weak-$*$ on compact subsets.

(b) $\mathbf T$ is distributionally divergence-free: $\int_{M_{\mathrm{reg}}}\nabla_\mu\psi_\nu\,d\mathbf T^{\mu\nu}=0$ for every $\psi\in C_c^\infty(T^*M_{\mathrm{reg}})$.

(c) If $\mathbf T\ll dV_g$, then there exists $T_{(\mathrm{MPU})}^{\mu\nu}\in L^1_{\mathrm{loc}}(M_{\mathrm{reg}})$ with $d\mathbf T^{\mu\nu}=T_{(\mathrm{MPU})}^{\mu\nu}dV_g$ and $\nabla_\mu T_{(\mathrm{MPU})}^{\mu\nu}=0$ in distributions.

*Proof.* Choose a countable exhaustion $K_1\subset\operatorname{int}K_2\subset\cdots$ of the second-countable manifold $M_{\mathrm{reg}}$ by compact metrizable sets. In a finite coordinate cover of $K_m$, each tensor measure has finitely many scalar signed-measure components. Hypothesis (i) bounds the total variation of every component uniformly in $h$. The Banach–Alaoglu theorem in the form given by Reed and Simon (1980) applies to each bounded subset of $C(K_m)^*$. Because compact metrizability makes $C(K_m)$ separable, the weak-$*$ compact bounded set is metrizable and sequentially compact. Thus a subsequence converges weak-$*$ on $K_m$. Repeated extraction and the diagonal subsequence over $m$ give a tensor-valued Radon measure $\mathbf T$ on the whole manifold. Each $\mathbf T_h$ is symmetric, so testing the antisymmetric part against continuous compactly supported tensors shows that $\mathbf T$ is symmetric. This proves (a).

Let $\psi\in C_c^\infty(T^*M_{\mathrm{reg}})$ and choose $m$ with $\operatorname{supp}\psi\subset K_m$. Hypotheses (ii) and (iii) give
$$
0=\int\nabla_\mu\psi_\nu\,d\mathbf T_h^{\mu\nu}+E_h,
\qquad
|E_h|\le |\mathbf T_h|(K_m)\,c_\psi h\le C_{K_m}c_\psi h.
$$
The error tends to zero, and $\nabla\psi$ is continuous with compact support. Weak-$*$ convergence therefore gives
$$
\int\nabla_\mu\psi_\nu\,d\mathbf T^{\mu\nu}=0,
$$
proving (b).

Under $\mathbf T\ll dV_g$, the Radon–Nikodym theorem as stated by Reed and Simon (1980), applied to each of the finitely many local tensor components, supplies a density $T_{(\mathrm{MPU})}^{\mu\nu}\in L^1_{\mathrm{loc}}$. Substitution of $d\mathbf T^{\mu\nu}=T_{(\mathrm{MPU})}^{\mu\nu}dV_g$ into the test-function identity in (b) is exactly the definition of $\nabla_\mu T_{(\mathrm{MPU})}^{\mu\nu}=0$ in distributions. ∎

**Corollary B.8b.1 (Paired-Subsequence Independence of Admissible Coarse-Graining).** If $(\mathbf T_h)$ and $(\widetilde{\mathbf T}_h)$ are $\varepsilon$-equivalent admissible coarse-grainings and $h_j\to0$ is a subsequence along which $\mathbf T_{h_j}\rightharpoonup\mathbf T$, then every further subsequence along which $\widetilde{\mathbf T}_{h_j}\rightharpoonup\widetilde{\mathbf T}$ satisfies $\widetilde{\mathbf T}=\mathbf T$. When both limits have local-equilibrium densities, those densities agree almost everywhere. If either full family has a unique weak-$*$ cluster point, both full families converge to that same limit.

*Proof.* For every compactly supported continuous tensor test field $\phi$,
$$
|\langle\mathbf T_{h_j}-\widetilde{\mathbf T}_{h_j},\phi\rangle|
\le
|\mathbf T_{h_j}-\widetilde{\mathbf T}_{h_j}|(K)\sup_K|\phi|
\longrightarrow0.
$$
Passing to the paired limits gives $\langle\mathbf T-\widetilde{\mathbf T},\phi\rangle=0$ for all such $\phi$, hence equality as Radon measures. Radon–Nikodym uniqueness gives equality of densities. Uniqueness of a cluster point upgrades subsequential convergence to convergence of the family. ∎

**Theorem B.8c (Variational Identification of the Continuum Source Tensor).** Let $S_{(\mathrm{MPU})}[g,\Phi]=\int_{M_{\mathrm{reg}}}\mathcal L_{(\mathrm{MPU})}(g,\Phi)\sqrt{|g|}\,d^4x$ be the continuum matter action obtained from Theorem D.6d. Assume: (H B.8c.1) $S_{(\mathrm{MPU})}$ is Gâteaux differentiable with respect to compactly supported smooth metric perturbations $\delta g_{\mu\nu}$; (H B.8c.2) the discrete first variations agree with the continuum first variation up to $O(h)$ remainders under the admissible coarse-graining of Definition B.8a. Then
$$
\delta_g S_{(\mathrm{MPU})}[g,\Phi;\delta g] \;=\; \tfrac12\int_{M_{\mathrm{reg}}}\delta g_{\mu\nu}\,d\mathbf T^{\mu\nu},
$$
and under local equilibrium,
$$
T_{(\mathrm{MPU})}^{\mu\nu}
=
\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g_{\mu\nu}},
\qquad
T^{(\mathrm{MPU})}_{\mu\nu}
=
-\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g^{\mu\nu}}.
\tag{B.21}
$$

*Proof.* By (H B.8c.2),
$$
\delta_g S_h^{(\mathrm{MPU})}[\delta g]
=
\frac12\int \delta g_{\mu\nu}\,d\mathbf T_h^{\mu\nu}
+
r_h(\delta g),
\qquad
r_h(\delta g)=O(h).
$$
For fixed $\delta g$, weak-$*$ convergence (Theorem B.8b) gives
$$
\int \delta g_{\mu\nu}\,d\mathbf T_{h_j}^{\mu\nu}
\to
\int \delta g_{\mu\nu}\,d\mathbf T^{\mu\nu}.
$$
Combined with (H B.8c.1), which supplies $\delta_g S_{h_j}^{(\mathrm{MPU})}\to\delta_g S_{(\mathrm{MPU})}$, this yields the stated identity. Under local equilibrium,
$$
d\mathbf T^{\mu\nu}=T_{(\mathrm{MPU})}^{\mu\nu}\sqrt{|g|}\,d^4x,
$$
so
$$
\delta_g S_{(\mathrm{MPU})}[g,\Phi;\delta g]
=
\frac12\int_{M_{\mathrm{reg}}}
T_{(\mathrm{MPU})}^{\mu\nu}\delta g_{\mu\nu}\sqrt{|g|}\,d^4x.
$$
Therefore
$$
\frac{\delta S_{(\mathrm{MPU})}}{\delta g_{\mu\nu}}
=
\frac12\sqrt{|g|}\,T_{(\mathrm{MPU})}^{\mu\nu},
$$
which gives the covariant-metric form of (B.21). The inverse-metric form follows from
$$
\delta g^{\alpha\beta}
=
-g^{\alpha\mu}g^{\beta\nu}\delta g_{\mu\nu}.
$$
∎

**Theorem B.8d (Horizon-Flux Closure).** Let $\mathcal H$ be a smooth compact local horizon patch in a local Rindler region with null generator $k^\mu$, affine parameter $\lambda$, and approximate boost Killing field $\chi^\mu=-\kappa\lambda k^\mu+O(\lambda^2)$. Assume (H B.8d.1) continuity of $T_{(\mathrm{MPU})}^{\mu\nu}$ on $\mathcal H$. Let $\mathcal H_h$ be discrete face-unions approximating $\mathcal H$. Assume the flux-consistency certificate
$$
\left|
\sum_{f\subset\mathcal H_h}q_h(f)
-
\sum_{f\subset\mathcal H_h}
T_{\mu\nu}^{(\mathrm{MPU})}(x_f)
\chi^\mu(x_f)n_f^\nu\Delta\Sigma_f
\right|
\le\epsilon_h,
\qquad
\epsilon_h\to0,
$$
and assume that the second sum is a convergent Riemann sum for the horizon integral. Then:

(a) *Flux convergence.*
$$
\sum_{f\subset\mathcal H_h} q_h(f) \;\xrightarrow[h\to 0]{}\; \int_{\mathcal H} T_{\mu\nu}^{(\mathrm{MPU})}\,\chi^\mu\,d\Sigma^\nu.
$$

(b) *Clausius flux formula.* To first order in $\lambda$,
$$
\delta Q_\mathcal H \;=\; \int_{\mathcal H} T_{\mu\nu}^{(\mathrm{MPU})}\,\chi^\mu\,d\Sigma^\nu \;=\; -\kappa\int_\mathcal H \lambda\,T_{\mu\nu}^{(\mathrm{MPU})}\,k^\mu k^\nu\,d\lambda\,dA,
$$
reproducing Equation (68).

*Proof.* (a) Let
$$
R_h
:=
\sum_{f\subset\mathcal H_h}
T_{\mu\nu}^{(\mathrm{MPU})}(x_f)
\chi^\mu(x_f)n_f^\nu\Delta\Sigma_f.
$$
By the Riemann-sum hypothesis, $R_h\to\int_{\mathcal H}T_{\mu\nu}^{(\mathrm{MPU})}\chi^\mu d\Sigma^\nu$. By flux consistency,
$$
\left|\sum_fq_h(f)-R_h\right|\le\epsilon_h\to0.
$$
The triangle inequality proves part (a).

(b) On the null surface, choose the stated orientation $d\Sigma^\nu=k^\nu d\lambda dA$. Substitution of $\chi^\mu=-\kappa\lambda k^\mu+O(\lambda^2)$ gives
$$
\int_{\mathcal H}T_{\mu\nu}^{(\mathrm{MPU})}\chi^\mu d\Sigma^\nu
=
-\kappa\int_{\mathcal H}\lambda T_{\mu\nu}^{(\mathrm{MPU})}k^\mu k^\nu d\lambda dA
+
O(\lambda^2)
$$
in the local expansion, proving part (b) to the stated order. ∎

**Corollary B.8d.1 (Source-Term Identity).** On $M_{\mathrm{reg}}$ under the admissibility and local-equilibrium hypotheses of Definition B.8a and (H B.8d.1), the tensor $T_{\mu\nu}^{(\mathrm{MPU})}$ coincides simultaneously with: (1) the continuum Belinfante limit of Theorem B.8b; (2) the metric variational source of Theorem B.8c, written equivalently as
$$
T_{(\mathrm{MPU})}^{\mu\nu}
=
\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g_{\mu\nu}}
\qquad
\text{or}
\qquad
T^{(\mathrm{MPU})}_{\mu\nu}
=
-\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g^{\mu\nu}};
$$
(3) a covariantly conserved symmetric tensor ($\nabla_\mu T^{\mu\nu}=0$ by Theorem B.8b(b) and, independently, by Corollary 45a.1); (4) the horizon heat-flux source of Theorem B.8d. The gravity derivation of §12 therefore uses one and the same stress-energy object at the microscopic, variational, thermodynamic, and conservation levels. ∎

*Proof.* Items (1), (2), (4) follow from Theorems B.8b, B.8c, B.8d. Item (3) follows from Theorem B.8b(b) directly and, independently, from Corollary 45a.1 applied to the scalar-density matter action of Theorem 45a. The two routes agree because they refer to the same underlying tensor identified by (1) and (2). ∎

**Definition B.8e (Predictive-Engine Rate Certificate $\mathfrak C_{\mathrm{eng}}$).** A predictive-engine rate certificate on a regular branch is a finite record
$$
\mathfrak C_{\mathrm{eng}}
=
(\Phi_F,\;T_{\mathrm{eff}},\;N_{\mathrm{str}},\;C_{\mathrm{ret}}^{\mathrm{nat}},\;\mathcal W_{\mathrm{free}},\;\mathcal O_{\mathrm{oh}},\;\mathcal R_{\mathrm{src}},\;\text{coarse-graining window},\;\text{forward lock})
$$
where $\Phi_F$ is the available free-energy flux into the retained predictive engine, $T_{\mathrm{eff}}>0$ is the effective temperature of the verified heat bath or local equilibrium ledger, $N_{\mathrm{str}}(t)$ counts new irreducible retained structural quanta, $C_{\mathrm{ret}}^{\mathrm{nat}}(t)=\varepsilon_0N_{\mathrm{str}}(t)$ is the associated retained structural content in nats when that normalization is used, $\mathcal W_{\mathrm{free}}$ records the free-energy bookkeeping, $\mathcal O_{\mathrm{oh}}\ge0$ records overhead and failed-verification losses, and $\mathcal R_{\mathrm{src}}$ records any Source-Principle relocation of the payment ledger.

**Proposition B.8f (Conditional Predictive Engine Bound).** In addition to $\mathfrak C_{\mathrm{eng}}$, assume that every counted retained-structure event includes a registered reset with
$$
H_q(P\mid R)\ge h_{\min}>0
$$
in the recorded bath. Then autonomous retained-structure growth satisfies
$$
\frac{dN_{\mathrm{str}}}{dt}
\le
\frac{\Phi_F}{k_BT_{\mathrm{eff}}h_{\min}}.
$$
When $C_{\mathrm{ret}}^{\mathrm{nat}}=\varepsilon_0N_{\mathrm{str}}$ with $\varepsilon_0=\ln2$ as the structural normalization,
$$
\frac{dC_{\mathrm{ret}}^{\mathrm{nat}}}{dt}
\le
\frac{\varepsilon_0\Phi_F}{k_BT_{\mathrm{eff}}h_{\min}}.
$$
With Source-Principle relocation, the same inequalities apply to target-side retained growth while sender-side payment and overhead are recorded through $\mathcal R_{\mathrm{src}}$. Equality requires an overhead-free Landauer-saturating branch and equality $H_q(P\mid R)=h_{\min}$ for every counted event.

*Proof.* Theorem 31 and the entropy-floor hypothesis give a free-energy cost at least $k_BT_{\mathrm{eff}}h_{\min}$ per counted reset. During $dt$, at most $\Phi_Fdt$ is available, and nonnegative overhead can only reduce the available amount. Therefore
$$
k_BT_{\mathrm{eff}}h_{\min}\,dN_{\mathrm{str}}
\le
\Phi_Fdt.
$$
Division by $dt$ proves the first inequality, and multiplication by $\varepsilon_0$ proves the second. ∎

**Remark B.8f.1 (Capacity Cost of a Metered Event).** Under $\mathfrak C_{\mathrm{meter}}$ a binary retained event carries the Landauer floor $k_BT_{\mathrm{eff}}\ln2$ for the recorded bit, plus any SPAP, verification, recovery, or overwrite overhead already present in the capacity ledger. This is a lower bound on the certified register write, not a claim that the full physical episode costs exactly one bit.

**Corollary B.8g (Complexity Backreaction Bound).** If $\mathfrak C_{\mathrm{eng}}$ is supplemented by an FRW or Buchert averaging certificate fixing the homogeneity scale, stress coefficient, and averaging window, then the complexity-growth contribution to $T_{\mu\nu}^{(\mathrm{MPU})}$ is bounded by the time integral of Proposition B.8f through the corresponding term in Definition B.8. This gives a finite backreaction estimate. It proves negligible contamination of the Appendix U $\Lambda$ branch only when the resulting bound is below the accepted residual budget fixed before comparison.

*Proof.* The stress tensor of Definition B.8 is the variational source of the retained cost action by Theorem B.8c and Corollary B.8d.1. The averaging certificate converts the local rate bound into the recorded cosmological source term. Comparison with the accepted residual budget is an ordinary strict-certificate comparison; without it the result is a bound, not a negligibility theorem. ∎

**Corollary B.8d.2 (Vacuum Normalization and $\Lambda$-Absorption).** The continuum Belinfante tensor is defined up to an additive metric-proportional constant absorbed into the cosmological constant. Under
$$
T'_{\mu\nu}:=T_{\mu\nu}^{(\mathrm{MPU})}+\sigma g_{\mu\nu},
$$
the Einstein equation (76a) is equivalent to its form with $T'_{\mu\nu}$ and
$$
\Lambda':=\Lambda+\frac{8\pi G}{c^4}\sigma.
$$
The PCE-Attractor convention $T_{\mu\nu}^{(\mathrm{MPU})}|_{\mathrm{vac}}=0$ fixes the allocation of a metric-proportional vacuum term between $T_{\mu\nu}$ and $\Lambda$.

*Proof.* Put $K=8\pi G/c^4$. Since $T_{\mu\nu}^{(\mathrm{MPU})}=T'_{\mu\nu}-\sigma g_{\mu\nu}$,
$$
G_{\mu\nu}+\Lambda g_{\mu\nu}
=
K(T'_{\mu\nu}-\sigma g_{\mu\nu})
$$
is equivalent to
$$
G_{\mu\nu}+(\Lambda+K\sigma)g_{\mu\nu}=KT'_{\mu\nu}.
$$
This is the stated transformation. ∎

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



