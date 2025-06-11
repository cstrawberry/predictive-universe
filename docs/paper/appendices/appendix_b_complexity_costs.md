# Appendix B — Operational Complexity, Costs, and Stress–Energy Tensor Construction

This appendix provides the detailed construction and justification for key operators used within the Predictive Universe (PU) framework, culminating in the definition of the macroscopic MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}$. This includes the operational complexity operator $\hat{C}_v$ used as a proxy for the theoretical $C_P$, the associated resource cost operators $\hat{R}$ and $\hat{R}_I$, a rigorous lower bound for complexity near the SPAP limit, and the operators representing local energy density and flows, ensuring consistency with the framework's principles and conservation laws.

*(Units convention.)* Throughout this appendix we retain explicit
$\hbar$, $c$, and $k_B$ factors so that every operator’s physical
dimension is transparent. Predictive Physical Complexity($C_P$ and its proxy $\hat C_v$) carries its own base dimension $\mathrm{[Complexity]}$, e.g.\ $[\hat C_v]=\mathrm{[Complexity]}$. Information-theoretic quantities such as the entropy $\varepsilon$ or
the channel capacity $C_{\max}$ are dimensionless, typically expressed
in nats (natural-log base $e$).The physical relevance of all complexity-derived cost terms rests on the Dynamically Enforced Functional Correspondence (Theorem 2),
which equates operational cost with predictive cost in
steady-state MPU optimisation.

**B.1 Operational Predictive Physical Complexity $\hat{C}_v$**

The theoretical Predictive Physical Complexity $C_{\mathrm P}(\mu)$ (Equation 1) is defined via a limit of algorithmic complexities, making it generally uncomputable. For the system's adaptive dynamics to operate on a physical observable that tracks this complexity, a computable operational proxy is required. Within the emergent quantum setting (Proposition 4), quantum circuit complexity provides a suitable measure, possessing expected properties like monotonicity with physical resources, approximate additivity, and computational accessibility. We formally define the operator representing this observable proxy.

**Definition B.1 (Operational Complexity Operator $\hat{C}_v$)**

For each MPU $v$, its operational complexity is represented by a Hermitian, positive-semi-definite operator $\hat C_v$ acting on the MPU's Hilbert space $\mathcal{H}_v$ (Proposition 4), identified with quantum circuit complexity. This operator is defined via its spectral decomposition:

 $$
 \hat C_v \;=\;
 \sum_{d=0}^{\infty}\lambda(d)\,\hat P_d
 \tag{B.1}
 $$

 where:

 *   $d \in \mathbb{N}_0$ is a dimensionless integer representing the minimum number of fundamental quantum gates (circuit depth or size, relative to a fixed gate set) required to prepare states in the subspace $\hat{P}_d \mathcal{H}_v$ starting from a reference state $|K_0\rangle$ corresponding to the Horizon Constant $K_0$.
 *   $\hat{P}_d$ is the orthogonal projector onto the subspace of $\mathcal{H}_v$ consisting of states requiring additional circuit complexity $d$ relative to $|K_0\rangle$. These projectors are assumed orthogonal and complete: $\hat{P}_d \hat{P}_{d'} \approx \delta_{dd'} \hat{P}_d$ and $\sum_{d} \hat{P}_d = \hat{I}$ (where the sum becomes effectively finite for a finite-dimensional $\mathcal{H}_v$).
 *   $\lambda(d)$ are the eigenvalues of $\hat{C}_v$, representing the effective Predictive Physical Complexity for states in the subspace $\hat{P}_d \mathcal{H}_v$. These eigenvalues are non-decreasing with $d$:
     $$ \lambda(d) = K_0 + \Delta C(d) \tag{B.2} $$
     where $K_0$ is the Horizon Constant (Theorem 15) and $\Delta C(d) \ge 0$ is the additional complexity due to circuit depth $d$, with $\Delta C(0)=0$.

 For an MPU with a finite-dimensional Hilbert space $\mathcal{H}_v$ of dimension $d_0$ (Theorem 23), the sum in Equation (B.1) is understood to be effectively finite. Only a finite number of distinct, non-zero orthogonal projectors $\hat{P}_d$ corresponding to achievable complexity levels can exist, or for $d$ beyond a certain $d_{max}$, the projectors $\hat{P}_d$ become zero or the eigenvalues $\lambda(d)$ cease to increase, reflecting the capacity limit of the $d_0$-dimensional space.

The expectation value $\langle \psi | \hat{C}_v | \psi \rangle$ for a state $|\psi\rangle$ provides the MPU's operational measure of complexity. The justification for this operator serving as a valid, dynamically selected proxy for the theoretical $C_P$ at viable equilibria is provided by Theorem 2 (Dynamically Enforced Functional Correspondence), detailed in Appendix D.

*Proof:* The definition of $\hat{C}_v$ as a Hermitian operator with a spectral decomposition based on quantum circuit complexity levels is standard in quantum information theory. The property of being positive-semi-definite follows from $\lambda(d) = K_0 + \Delta C(d) \ge K_0 > 0$.

**B.2 Physical Resource-Cost Operators $\hat{R}, \hat{R}_I$**

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
The operators $\hat R(C_v)$ and $\hat R_I(C_v)$ are Hermitian because the cost functions $R(\cdot)$ and $R_I(\cdot)$ are real-valued. They are positive-semi-definite because $R(C) \ge 0$ and $R_I(C) \ge 0$ for $C \ge K_0$ (Definition 3), and $\lambda(d) \ge K_0$ for all $d \ge 0$. The physical relevance of using $\langle\hat{R}\rangle$ and $\langle\hat{R}_I\rangle$ in dynamics relies on Theorem 2 ensuring alignment of $\langle \hat{C}_v \rangle$ with $C_P$.

*Proof:* The definition of operators via functional calculus on a Hermitian operator ($\hat{C}_v$) is a standard mathematical construction. The properties of self-adjointness (Hermitian) and positive-semi-definiteness for $\hat{R}$ and $\hat{R}_I$ follow directly from the real-valued and non-negative nature of the functions $R(\cdot)$ and $R_I(\cdot)$ when applied to the non-negative eigenvalues $\lambda(d)$ of $\hat{C}_v$.

**B.3 Fundamental Complexity Bound for SPAP Prediction**

**Definition B.2 (Unified Complexity Functional $C_{\text{uni}}$)**

Consider the task of achieving a prediction accuracy $\alpha$ for a SPAP-limited binary outcome, where $\delta_{\rm SPAP} = \alpha_{\mathrm{SPAP}}-\alpha$ is the error margin below the fundamental limit $\alpha_{\mathrm{SPAP}}$. A $\delta_{\rm SPAP}$-accurate SPAP strategy involves an encoding $\mathcal{C}$ of the prediction model and an evaluator $G$ that simulates the SPAP loop and verifies the accuracy constraint. The unified complexity functional $C_{\text{uni}}(\delta_{\rm SPAP})$ represents the minimal total resources (e.g., combined code length $m$ for $\mathcal{C}$ and evaluator Kolmogorov complexity $C(G)$) required by any such strategy:
$$
C_{\,\text{uni}}\bigl(\delta_{\rm SPAP}\bigr) :=\min_{(\mathcal C, G)\ \delta_{\rm SPAP}\text{-strategy}} \bigl[m \;+\; C(G)\bigr] \tag{B.4}
$$

**Theorem B.2 (Poly-logarithmic Complexity Divergence Near $\alpha_{SPAP}$ = Theorem 14)**

For a desired prediction accuracy $\alpha$ approaching the fundamental SPAP limit $\alpha_{\mathrm{SPAP}}$ (i.e., $\delta_{\rm SPAP} = \alpha_{\mathrm{SPAP}}-\alpha \to 0$), the minimum unified complexity $C_{\text{uni}}(\delta_{\rm SPAP})$ required to predict a SPAP-limited process is rigorously bounded below by a poly-logarithmic function of the accuracy gap $\delta_{\rm SPAP}$:

$$
C_{\text{uni}}(\delta_{\rm SPAP}) = \Omega\left(\frac{\log(1/\delta_{\rm SPAP})}{(\delta_{\rm SPAP})^2}\right)
\tag{B.5}
$$

where $\delta_{\rm SPAP}$ is the dimensionless error margin and $C_{uni}$ is a dimensionless measure of effective computational resources. This bound demonstrates that the resources required diverge faster than quadratically as the desired accuracy $\alpha$ approaches $\alpha_{SPAP}$.

*Proof Sketch:* The proof leverages rate-distortion theory and computational complexity bounds. The total complexity arises from two primary, independent cost components:
1.  **Statistical Resolution Cost:** The resources needed to distinguish the system's behavior from the SPAP limit with a statistical error margin of $\delta_{\rm SPAP}$. Rate-distortion arguments show this cost scales as $\Omega(1/(\delta_{\rm SPAP})^2)$.
2.  **Logical Simulation Cost:** The resources needed to execute the self-referential computation (e.g., DSRO simulation) to a logical depth sufficient to guarantee accuracy $1-\delta_{\rm SPAP}$. This depth scales at least logarithmically with the inverse of the error margin, contributing a complexity cost of $\Omega(\log(1/\delta_{\rm SPAP}))$.
3.  **Combined Bound:** A valid strategy must satisfy both requirements. The total unified complexity $C_{uni}$ is bounded below by the product of the resources needed for each level of simulation depth and the number of levels required. This multiplicative combination of the logical depth cost and the statistical resolution cost per level leads to the combined poly-logarithmic scaling shown in Equation (B.5).

This poly-logarithmic divergence of the dimensionless complexity $C_{\text{uni}}$ (Eq B.5) underlies the divergence of the Predictive Physical Complexity $C_{pred}(\alpha)$ in **Theorem 14** of the main text. Since physical realizability requires finite $C_P$, attaining performance arbitrarily close to $\alpha_{SPAP}$ is physically unattainable.

**B.4 Microscopic Energy Density Operator $\hat{\rho}_v$ and Interaction Structure**

The total energy density associated with an individual MPU incorporates contributions from its baseline operation, complexity-related costs, and interactions, including the thermodynamic cost of irreversibility.

**Definition B.3 (Microscopic Energy Density Operator $\hat{\rho}_v$)**

The Hermitian operator representing the microscopic energy density associated with MPU $v$ is defined by its contributions from various physical aspects of the MPU, localized to an effective MPU volume $V_0$ and involving a characteristic MPU operational timescale $\tau_0$ where necessary for dimensional consistency:
$$
\hat{\rho}_v = \frac{1}{V_0} \left( \hat{H}_v + \left(\hat{R}(C_v) + \hat{R}_I(C_v)\right)\tau_0 + \hat{E}_{int}(v) \right) \quad \text{(B.6)}
$$
where:

1.  **$\hat{H}_v$:** The internal MPU Hamiltonian (Energy operator, from Def 26, Eq 43). Its contribution to energy density is $\hat{H}_v/V_0$. Theorem 29 relates its expectation value to the baseline operational *energy* for a cycle, with $R(C_{op})$ (Definition 3a) being the corresponding *power*.
2.  **$\hat{R}(C_v), \hat{R}_I(C_v)$:** The operational resource cost *power* operators (defined in Theorem B.1, Eq B.3, which are derived from the power functions $R(C), R_I(C)$ in Definition 3). Their contribution to energy density is $(\hat{R}(C_v)\tau_0)/V_0$ and $(\hat{R}_I(C_v)\tau_0)/V_0$, representing energy dissipated or utilized over timescale $\tau_0$ per unit volume. The justification for their inclusion as sources for $T_{\mu\nu}$ rests on PCE requiring all predictive work and costs to be accounted for in the system's energy balance, with Theorem 2 ensuring the proxy $\hat{C}_v$ accurately reflects $C_P$ at equilibrium.
3.  **$\hat{E}_{int}(v) = \frac{1}{2}\sum_{v' \sim v} \hat{V}_{vv'}$:** The interaction energy operator (Energy operator). Its contribution to energy density is $\hat{E}_{int}(v)/V_0$. Acts on the joint Hilbert space $\mathcal{H}_v \otimes \mathcal{H}_{v'}$ (or larger).

The constants $V_0$ (effective MPU volume) and $\tau_0$ (characteristic MPU timescale, e.g., $\tau_{min}$ from Theorem 29) are fundamental parameters related to the MPU scale. $\hat{\rho}_v$ is Hermitian by construction. Its expectation value $\langle \hat{\rho}_v \rangle = \text{Tr}(\rho_v \hat{\rho}_v)$ in the local MPU state $\rho_v$ represents the average local energy density associated with MPU $v$.

**Definition B.4 (Structure of Interaction Operator $\hat{V}_{vv'}$) **

The interaction operator $\hat{V}_{vv'}$ between MPUs $v$ and $v'$ must account for both conservative energy exchange and the energy implications of the inherent thermodynamic irreversibility ($\varepsilon > 0$, Thm 31) of the ND-RID/'Evolve' process (Def 27). We decompose it as:
$$ \hat{V}_{vv'} = \hat{V}_{dissip-contrib}^{(vv')} + \hat{V}_{pot}^{(vv')} \quad \text{(B.7)} $$
1.  **$\hat{V}_{pot}^{(vv')}$:** Represents conservative potential energy contributions.
2.  **$\hat{V}_{dissip-contrib}^{(vv')}$:** Represents the energy contribution associated with enabling the irreversible aspects of the interaction. The physical process underlying the irreversible ND-RID step involves coupling to underlying degrees of freedom, effectively modeled via open system dynamics (e.g., Lindblad master equation):
    $$ \frac{d\rho_{vv'}}{dt} = -\frac{i}{\hbar} [\hat{H}_{eff, vv'}, \rho_{vv'}] + \mathcal{L}_D(\rho_{vv'}) \quad \text{(B.8)} $$
    $$ \mathcal{L}_D(\rho_{vv'}) = \sum_k \gamma_k \left( L_k \rho_{vv'} L_k^\dagger - \frac{1}{2} \{L_k^\dagger L_k, \rho_{vv'}\} \right) \quad \text{(B.9)} $$
    The Lindblad operators $L_k$ and rates $\gamma_k$ are constrained by the requirement that the average entropy production rate $\dot{S}_{prod}$ associated with $\mathcal{L}_D$ must account for the minimal cost $\varepsilon$ over the interaction time $\tau_{int}$ when non-trivial self-referential information $\Delta I > 0$ is processed (Consistency Constraint):
    $$ \int_0^{\tau_{int}} \mathbb{E}[\dot{S}_{prod}(t)] dt \ge k_B \varepsilon \quad (\text{Consistency Constraint}) \quad \text{(B.10)} $$
    The term $\hat{V}_{dissip-contrib}^{(vv')}$ represents the average local system energy required to support this necessary dissipative process, consistent with the dynamics (B.8) and the constraint (B.10).

**B.5 Microscopic Flow Operators and Conservation Laws**

To construct the full stress-energy tensor, operators for momentum density and momentum flux are defined implicitly by requiring local conservation at the microscopic level.

**Definition B.5 (Microscopic Flow Operators $\hat{\pi}_{v,j}$ and $\hat{p}_{v,jk}$)**

Assuming a locally regular structure allowing definition of spatial directions $j, k$ and a discrete divergence $\nabla_j^{(v)}$, the local momentum density operator $\hat{\pi}_{v,j}$ and the stress tensor operator $\hat{p}_{v,jk}$ for MPU $v$ are defined as the Hermitian operators satisfying the operator continuity equations under the full MPU dynamics generated by $\hat{H}_{total} = \sum_v \hat{\rho}_v$:
$$
\frac{d\hat{\rho}_v}{dt} + \sum_{j=1}^3 \nabla_j^{(v)} \hat{q}_{v,j} = 0 \quad (\text{Local Energy Conservation}) \quad \text{(B.11)}
$$
$$
\frac{d\hat{\pi}_{v,k}}{dt} + \sum_{j=1}^3 \nabla_j^{(v)} \hat{p}_{v,jk} = 0 \quad (\text{Local Momentum Conservation}) \quad \text{(B.12)}
$$
where $\hat{\rho}_v$ is from Eq (B.6), $d/dt = (i/\hbar)[\hat{H}_{total}, \cdot]$, and $\hat{q}_{v,j}$ is the energy flux operator. Assuming the standard relation $\hat{q}_{v,j} = c^2 \hat{\pi}_{v,j}$, these equations implicitly define the flux operators consistent with the Hamiltonian and energy density.

**B.6 Canonical Microscopic Stress-Energy Tensor $\hat{T}^{\mu\nu}_{(can)}$**

We assemble the density and flux operators into a canonical stress-energy tensor.

**Definition B.6 (Canonical Microscopic Stress-Energy Operator $\hat{T}^{\mu\nu}_{(can)}$)**

The canonical microscopic stress-energy operator $\hat{T}^{\mu\nu}_{(can)}(v)$ for MPU $v$ is defined by its components in a local frame (0=time, j,k=spatial):

*   $\hat{T}^{00}_{(can)}(v) = \hat{\rho}_v$ (Energy Density, Eq B.6)
*   $\hat{T}^{0j}_{(can)}(v) = c \hat{\pi}_{v,j}$ (Energy Flux density)
*   $\hat{T}^{j0}_{(can)}(v) = c \hat{\pi}_{v,j}$ (Momentum Density scaled)
*   $\hat{T}^{jk}_{(can)}(v) = \hat{p}_{v,jk}$ (Stress)

(Assuming $\hat{q}_{v,j} = c^2 \hat{\pi}_{v,j}$).

**Theorem B.3 (Microscopic Conservation Law for $\hat{T}^{\mu\nu}_{(can)}$)**

The canonical tensor $\hat{T}^{\mu\nu}_{(can)}(v)$ satisfies the local conservation law using a discrete spacetime divergence $\partial_\mu^{(v)}$ (where $\partial_0^{(v)} = (1/c) d/dt$, $\partial_j^{(v)} = \nabla_j^{(v)}$):
$$
\sum_{\mu=0}^{3} \partial_\mu^{(v)} \hat{T}^{\mu\nu}_{(can)}(v) = 0 \quad (\text{for } \nu = 0, 1, 2, 3) \quad \text{(B.13)}
$$
*Proof:* Follows directly by substituting the definitions into the divergence equation and applying the local conservation laws (Eq B.11, B.12).

**B.7 Symmetric Physical Microscopic Stress-Energy Tensor $\hat{\Theta}_{\mu\nu}^{(MPU)}$**

The canonical tensor is symmetrized using the Belinfante-Rosenfeld procedure to obtain the physically relevant tensor.

**Assumption B.1 (MPU Effective Spin)**
Assume an effective microscopic spin tensor operator $\hat{S}^{\lambda \mu \nu}(v)$ exists, antisymmetric in $\mu \leftrightarrow \nu$.

**Theorem B.4 (Physical, Symmetric Microscopic Operator $\hat{\Theta}_{\mu\nu}^{(MPU)}$)**

The physical, symmetric, conserved stress-energy tensor operator $\hat{\Theta}_{\mu\nu}^{(MPU)}(v)$ is constructed from $\hat{T}_{\mu\nu}^{(can)}$ and $\hat{S}^{\lambda \mu \nu}$ via:
$$
\hat{\Theta}_{\mu\nu}^{(MPU)} = \hat{T}_{\mu\nu}^{(can)} + \frac{1}{2} \partial_\lambda^{(v)} (\hat{S}^{\lambda \mu \nu} - \hat{S}^{\mu \lambda \nu} - \hat{S}^{\nu \mu \lambda}) \quad \text{(B.14)}
$$
$\hat{\Theta}_{\mu\nu}^{(MPU)}$ is symmetric and satisfies $\partial_\mu^{(v)} \hat{\Theta}^{\mu\nu}_{(MPU)}(v) = 0$ if total angular momentum is conserved.

*Proof:* Standard field theory derivation.

**Definition B.7 (Physical Microscopic Stress-Energy Operator)**

We identify the symmetric, conserved tensor $\hat{\Theta}_{\mu\nu}^{(MPU)}(v)$ from Eq (B.14) as the physical microscopic stress-energy tensor operator for MPU $v$.

**B.8 Macroscopic Stress–Energy Tensor $T_{\mu\nu}^{(MPU)}$**

The macroscopic tensor sourcing emergent gravity is the coarse-grained average.

**Definition B.8 (Macroscopic MPU Stress-Energy Tensor $T_{\mu\nu}^{(MPU)}$)**

The macroscopic MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}(x)$ at spacetime point $x$ is the expectation value of the emergent operator field $\hat{\Theta}_{\mu\nu}(x)$ (formalized in Appendix F, Def F.4) in the relevant physical state $\omega$:
$$
T_{\mu\nu}^{\text{(MPU)}}(x) = \omega(\hat{\Theta}_{\mu\nu}(x)) \quad \text{(B.15)}
$$
This represents the thermodynamically relevant coarse-grained average $\langle \hat{\Theta}_{\mu\nu}^{(MPU)}(v) \rangle$.

**Theorem B.5 (Macroscopic Covariant Conservation of $T_{\mu\nu}^{(MPU)}$)**

Assuming a generally covariant emergent effective theory, $T_{\mu\nu}^{(MPU)}(x)$ satisfies:
$$
\nabla^{\mu} T_{\mu\nu}^{\text{(MPU)}} = 0 \quad \text{(B.16)}
$$
where $\nabla^{\mu}$ is the covariant derivative compatible with the emergent metric $g_{\mu\nu}$.
*Proof:* Follows from diffeomorphism invariance via Noether's second theorem (Appendix F, Thm F.1).

**B.9 Correspondence with Standard Forms**

The emergent tensor reproduces known physical forms.

**Theorem B.6 (Correspondence with Standard Physical Forms)**

The macroscopic tensor $T_{\mu\nu}^{(MPU)}(x)$ (Def B.8) reproduces standard forms:
(a) Vacuum State $\omega_{vac}$:
$$
T_{\mu\nu}^{(MPU)} \big|_{vac} = \rho_{vac} g_{\mu\nu} = \frac{c^4 \Lambda}{8\pi G} g_{\mu\nu} \quad \text{(B.17)}
$$
(b) **Perfect Fluid (Local Thermal Equilibrium $\omega_{th}$):**
$$
T_{\mu\nu}^{(MPU)} \big|_{th} = (\rho_{th} + p_{th}/c^2) u_\mu u_\nu + p_{th} g_{\mu\nu} \quad \text{(B.18)}
$$
*Proof:* Follows from Poincaré invariance for (a) and isotropy in LRF for (b).

**B.10 Construction Pathway (Summary)**

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
