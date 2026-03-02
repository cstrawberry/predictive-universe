# 6 Complexity, Performance, and Adaptation Dynamics

This section explores the crucial interplay between system complexity, achievable predictive performance, and the dynamical processes governing adaptation within the Predictive Universe framework. We introduce the Principle of Compression Efficiency (PCE) as the core driver of adaptation, analyze the scaling relationship between complexity and performance, derive the specific functional form known as the Law of Prediction, and formally model the adaptation dynamics. These elements establish the foundation for understanding how systems governed by POP (Axiom 1) dynamically adjust their complexity, which is fundamentally bounded by the Operational Threshold ($C \ge C_{op} \ge K_0$, Corollary 3), to navigate the Space of Becoming (Definition 8) efficiently.

## 6.0 The Capacity Bound as Structural Constraint

*Throughout this section, natural units $\hbar = c = k_B = 1$ are used unless otherwise noted.*

A fundamental structural feature of the PU framework is that the ND-RID channel capacity bound $C_{\max} < \ln d_0$ (Theorem E.2) propagates through the derivation chain to constrain multiple physical domains. This bound arises from the irreversibility constraint $\varepsilon \geq \ln 2$ (Theorem 31), which implies strict contractivity $f_{RID} < 1$ (Lemma E.1), which in turn limits classical information capacity.

### 6.0.1 Capacity Manifestations Across Domains

**Theorem 6.0.1 (Capacity Bound Propagation).** *The channel capacity bound $C_{\max} < \ln d_0$ appears as a limiting factor in distinct physical contexts:*

| Domain | Capacity Role | Derived Relation | Reference |
|:-------|:--------------|:-----------------|:----------|
| Information channels | Upper bound on reliable transmission | $C_{\max}(f_{RID}) < \ln d_0$ | Theorem E.2 |
| Horizon entropy | Entropy per boundary channel | $S_{channel}^{max} \leq k_B C_{\max}$ | Corollary E.2 |
| Gravitational constant | Inverse proportionality | $G = \frac{\eta\delta^2 c^3}{4\hbar\chi C_{\max}}$ | Equation E.9 |

*where $\delta$ is the effective MPU spacing (Definition 35), $\eta$ is the geometric packing factor, and $\chi$ is the correlation factor quantifying reduction in independent degrees of freedom (all defined in Theorem E.3).*

*Proof.*

**Part A (Information Channels).** Theorem E.2 gives the strict inequality $C(\mathcal{E}_N)<\ln d_0$ via the flagged (erasure-mixture) argument. The key structural input is Lemma E.1: the averaged ND-RID channel contains a nonzero input-independent refresh component,
$$
\mathcal{E}_N=(1-p)\Psi+pT_\sigma,\qquad p>0,
$$
so a fraction $p$ of uses are effectively erased when the refresh triggers. Conditioning on the (conceptual) refresh flag yields the per-use bound
$$
C(\mathcal{E}_N)\le (1-p)\ln d_0<\ln d_0.
$$
Achievability and strong converse are established in [Holevo 1998; Winter 1999].

**Part B (Horizon Entropy).** From Corollary E.2, the maximum thermodynamic entropy per channel is $S_{channel}^{max} = k_B C_{\max}$ (SI units) or simply $C_{\max}$ (natural units). Combined with channel counting (Theorem E.3), the total boundary entropy is:
$$
S_{boundary} = N_{eff} \cdot S_{channel}^{max} = \sigma_{link} \cdot \mathcal{A} \cdot k_B \cdot C_{\max}
$$
where $\sigma_{link} = \chi/(\eta\delta^2)$ is the effective surface density of independent channels. Writing the operational area law in the standard normalization defines $1/(4G):=\sigma_{link}\,C_{\max}$ (Theorem E.5).

**Part C (Gravitational Constant).** From Equation E.9, requiring Clausius consistency on all local horizons fixes:
$$
G = \frac{\eta\delta^2 c^3}{4\hbar\chi C_{\max}(f_{RID})}
$$
The gravitational constant is inversely proportional to channel capacity: higher capacity implies weaker gravity. At the PCE-Attractor (Definition 15a), admissibility requires $\varepsilon \ge \ln 2$ (Theorem 31) and PCE selects the saturation $\varepsilon=\ln 2$. For the minimal MPU with $d_0=8$ (Theorem 23), Equation E.15 gives $C_{\max}^*=\ln d_0-\varepsilon=\ln 8-\ln 2=2\ln 2$, which determines $G$ in terms of the microscopic MPU parameters. ∎

**Principle 6.0 (Capacity Constraint Propagation).** *The physical constants and thermodynamic limits are mutually constrained by the single capacity bound $C_{\max} < \ln d_0$ arising from ND-RID contractivity.*

**Remark 6.0.1: Origin of the Constraint.** The capacity bound traces to the irreversibility of self-referential prediction:
$$
\text{SPAP (Thm 10)} \xrightarrow{\text{Thm 31}} \varepsilon \geq \ln 2 \xrightarrow{\text{Lem E.1}} f_{RID} < 1 \xrightarrow{\text{Thm E.2}} C_{\max} < \ln d_0
$$
The logical structure of self-reference (SPAP) propagates through thermodynamics (Landauer cost) to information theory (channel capacity) to geometry (gravitational coupling).

**Remark 6.0.2: PCE Optimization.** At the PCE-Attractor (Definition 15a), $\varepsilon$ is minimized subject to $\varepsilon \ge \ln 2$ (Theorem 31). For the minimal MPU ($d_0=8$, Theorem 23) this yields $\varepsilon=\ln 2$ and hence the PCE-optimal channel capacity
$$
C_{\max}^*=\ln d_0-\varepsilon=\ln 8-\ln 2=2\ln 2 \quad \text{(Equation E.15)}.
$$
This partitions the MPU information budget between the irreducible internal processing cost ($\varepsilon$) and the remaining external communication capacity ($C_{\max}$).

---

## 6.1 Principle of Compression Efficiency (PCE)

The adaptation of predictive systems is governed by an optimization principle that balances predictive utility against resource costs.

**6.1.1 Definition 14 (Def 14): Optimal Complexity Allocation Criteria**

Given the relationship between Predictive Physical Complexity ($C \equiv C_P$, assumed operationally tracked by $\langle \hat{C}_v \rangle$ per Theorem 2) and achievable Predictive Performance $PP(C, \hat{C}_{target})$ (derived later in Theorem 19), the Optimal Complexity Allocation $C^*$ represents the level of complexity that maximizes the net benefit under resource constraints. For a given estimated environmental complexity $\hat{C}_{target}$ (Definition 21) and effective resource scarcity $\lambda$ (Definition 20), $C^*$ satisfies the following criteria at equilibrium:
1.  **Marginal Benefit Equals Marginal Cost:** The marginal improvement in performance, converted to an equivalent power benefit rate via factor $\Gamma_0$ (Definition 20), equals the marginal increase in the total weighted resource cost rate:
    $$
    \Gamma_0 \frac{\partial PP}{\partial C}\bigg|_{C^*} = \lambda R'(C^*) + R_I'(C^*) \quad \text{(18)}
    $$
    (This corresponds to the condition $\Psi(C^*) = 0$, where $\Psi$ is the Adaptation Driving Force, Definition 20). Here $\Gamma_0$ is the power-conversion factor (Definition 20), a system-level constant with dimensions of power $[E][T]^{-1}$.

2.  **Second Order Optimality (Diminishing Returns Exceed Cost Acceleration):** For a stable maximum, the second derivative of the net benefit must be negative:
    $$
    \Gamma_0 \frac{\partial^2 PP}{\partial C^2}\bigg|_{C^*} < \lambda R''(C^*) + R_I''(C^*) \quad \text{(19)}
    $$
3.  **Viability Constraint:** The performance achieved at the optimal complexity $C^*$ must lie strictly within the Space of Becoming: $\alpha < PP(C^*, \hat{C}_{target}) < \beta$ (Axiom 3).

**6.1.2 Definition 15 (Def 15): Principle of Compression Efficiency (PCE)**

The adaptation dynamics of systems within the PU framework are governed by the Principle of Compression Efficiency (PCE). This principle posits that complex predictive systems naturally evolve or self-organize towards configurations that optimize the trade-off between maximizing the functional utility or Meaning Potential (MP) derived from processed information—quantified by the expected improvement in predictive quality ($\Delta Q$, operationally related to achieving high PP, Definition 7) relevant to the POP (Axiom 1)—and minimizing the comprehensive Signal Cost (SC) associated with acquiring, representing, processing, updating, and utilizing that information. The Signal Cost encompasses the ongoing operational resource costs ($R(C), R_I(C)$, Definition 3, represented operationally by $\langle \hat{R} \rangle, \langle \hat{R}_I \rangle$ when acting on $\langle \hat{C}_v \rangle$) and any transient costs associated with adaptation (complexity changes, model updates). The system implicitly seeks configurations that maximize a net benefit, effectively balancing MP against SC, driving it towards states satisfying the optimal allocation criteria (Definition 14). The ultimate expression of this optimization is the PCE-Attractor.

**Remark (Relation to PPI).** PCE is an operational specialization of PPI-optimality (Definition P.6.2, Appendix P): PPI asserts that physical instantiations of abstract structures are constrained by irreducible thermodynamic costs and selected by resource-minimality, while PCE provides the explicit potential $V(x)$ and dynamics realizing that selection for adaptive predictive systems. In derivations, "PPI requires…" invokes admissibility and PPI-optimality; "PCE selects…" invokes the concrete $V$-minimization used to single out a unique attractor within the admissible class.

**Definition 15a (Def 15a): The PCE-Attractor**

 The **PCE-Attractor**, denoted $x_{attr}$, is the canonically selected global-minimum configuration within $\mathcal{E}_{*}^{\text{global}}$ (see Theorem D.3). Existence is guaranteed by the coercivity/compactness hypotheses used in Appendix D to show that $V$ attains its infimum on $\mathcal{E}_{*}^{\text{global}}$. Uniqueness is understood after quotienting by the internal symmetries that leave $V$ invariant (e.g., gauge and relabeling symmetries); $x_{attr}$ denotes any representative of the resulting unique minimizer equivalence class, singled out by the *co-occurring* conditions:

 1.  **Maximal Symmetry (Flat Spectrum):** For the U(1) sector, the SLD-QFI spectrum is flat ($\sigma^2=0$), reflecting a state of maximal robustness where all information-carrying modes are utilized democratically (see Appendix W; §Z.3).

 2.  **Maximal Efficiency (Capacity Saturation):** The system operates at the "zero-slack" or "branch boundary" condition, where the unconstrained minimum of the rate-level PCE potential $\phi(u)$ coincides with the information capacity limit ($V_{benefit} = \ln d_0$).

 3.  **Canonical Instantiation (Minimal Complexity Action):** At the Attractor scale $\mu^*$, the bulk gauge normalization satisfies $\kappa^*_{\mathrm{bulk}}=1$ (Appendix Z, Theorem Z.14; Appendix X, Theorem X.3). This follows from Legendre duality and the predictive Ward identity together with QFI geometric rigidity ($\lambda_i=1$, Theorem Z.5) and capacity saturation fixing $u^*=2^{1/8}-1$ (Theorem Z.7), obstructing the field-rescaling freedom that would otherwise make $\kappa$ a convention in standard $U(1)$ gauge theory.

 This orbit (equivalence class under the symmetries of $V$ and gauge redundancy) is the unique, PCE-favored selection used for predictions with zero continuously adjustable parameters; throughout we fix a canonical representative and denote it by $x_{attr}$.

**6.1.3 Definition 16 (Def 16): Prediction Optimization Problem - Operational Goal**

The Prediction Optimization Problem (POP, Axiom 1), when viewed operationally within the adaptation dynamics driven by PCE (Definition 15), is the ongoing challenge for the adaptive system to dynamically allocate its limited resources (manifesting as operational costs $\langle \hat{R} \rangle, \langle \hat{R}_I \rangle$, Theorem 3, weighted by scarcity $\lambda$) by adapting its internal model complexity (represented by $\langle \hat{C}_v \rangle$, Theorem 1) to achieve the highest possible predictive performance $PP(C, \hat{C}_{target})$ (consistent with Theorem 19), while strictly adhering to the viability constraint $PP(t) \in (\alpha, \beta)$ (Axiom 3). The system adaptively seeks the complexity level $C^*(t)$ that satisfies the optimal allocation criteria (Definition 14) consistent with PCE.

**6.2 Complexity-Performance Scaling Principles**

We now establish the general principles governing the relationship between invested complexity and achievable performance, and derive the expected functional form.

**6.2.1 Definition 17 (Def 17): Physical Realizability**

A predictive model $M$ or system state $\mu$ characterized by $C_P$ is physically realizable if there exists a finite refinement level $n$ and at least one admissible construction/operation program $p\in\mathcal{P}_n(\mu)$ (Section 2.4.1) that maps $\mu_{\rm ref}\mapsto\mu$, achieves the required predictive accuracy, and respects all constraints in $\mathcal{L}_{\rm phys}^{(n)}$. Equivalently, $C_{P,n}(\mu)<\infty$ for some (hence all larger) $n$, and $C_P(\mu)\le C_{\max}<\infty$ (Appendix Q).

**6.2.2 Definition 18 (Def 18): PPC Requirement $C_{PPC}(PP_{target})$**

For a target average predictive performance $PP_{target}$ within the viable range $(\alpha, \beta)$, the Predictive Physical Complexity Requirement $C_{PPC}(PP_{target})$ is the minimum theoretical complexity $C_P$ (Equation 1) required by any physically realizable (Definition 17) model $M$ or system state to achieve that performance level on average against a given predictive challenge:
$$
C_{PPC}(PP_{target}) = \inf \{ C_P(\mu) \mid \mu \in \mathcal{S}_{phys}, \mathbb{E}[PP(f_{\mu})] \geq PP_{target} \} \quad \text{(20)}
$$
where the expectation $\mathbb{E}[\cdot]$ averages over relevant environmental conditions or task distributions.

**6.2.3 Theorem 17 (Complexity Lower Bound ($C > C_{op}$))**

Any system operating sustainably within the Space of Becoming ($\alpha < PP(t) < \beta$, Axiom 3) in an environment presenting a non-trivial predictive challenge (where the baseline performance achievable with minimal operational complexity $C_{op}$ is at or below the viability threshold, i.e., $PP(C_{op}) \le \alpha$) necessarily requires an operational complexity $C(t) = C_P(\mu(t))$ strictly greater than the Operational Threshold $C_{op}$.
*Proof:* Fix an environment/task distribution and define the maximal achievable average performance at complexity budget $C$ by
$$
PP_{\max}(C):=\sup\{\mathbb{E}[PP(f_\mu)]\mid \mu\in\mathcal{S}_{phys},\ C_P(\mu)\le C\}.
$$
Because the feasible set $\{\mu:\ C_P(\mu)\le C\}$ is nested in $C$, $PP_{\max}(C)$ is non-decreasing in $C$. The hypothesis $PP(C_{op})\le \alpha$ states that, at the operational threshold budget, even the best achievable performance is at or below the viability boundary: $PP_{\max}(C_{op})\le \alpha$. Viability requires sustained operation with $PP(t)>\alpha$, hence the realized complexity must satisfy $PP_{\max}(C(t))>\alpha$. Monotonicity then forces $C(t)>C_{op}$. ∎

**6.2.4 Physical Nature of Complexity Transformations (Thermodynamic Irreversibility)**

The adaptation process involves changing the system's complexity $C(t) \to C(t+1)$ (Section 6.4). This corresponds to a physical transformation within the system's representational medium (Theorem 7). Implementing such changes requires physical operations that consume resources (transient Adaptation Costs, part of the SC in Definition 15). Model adaptation involves information processing (e.g., incorporating new data, computing updates) and typically requires logically irreversible information erasure (e.g., discarding outdated model components or hypotheses). By the fundamental link between information and thermodynamics (Landauer's Principle; specifically the bound $\varepsilon \ge \ln 2$, Theorem 31), any logically irreversible operation that must be physically instantiated and cyclically reset incurs irreducible entropy production and energy dissipation. Therefore, complexity transformation ($C(t) \to C(t+1)$) is generally a thermodynamically irreversible physical process associated with resource costs and entropy generation, constraining the dynamics and efficiency of adaptation.

**6.2.5 Definition 19 (Def 19): Complexity-Performance Scaling Principles**

The function $PP(C, \hat{C}_{target})$ describing the achievable Predictive Performance (Definition 7) within the viable operational range $(\alpha, \beta)$ as a function of invested complexity $C \ge C_{op}$ (Equation 1) and the estimated target complexity $\hat{C}_{target}$ (Definition 21) must adhere to the following general principles, derived from operational requirements and physical limitations:
1.  **Bounds and Diminishing Returns:** $PP(C, \hat{C}_{target})$ is bounded within the viable operational range $(\alpha, \beta)$, with
$$
PP(C_{op},\hat{C}_{target})=\alpha,\qquad \lim_{C\to\infty} PP(C,\hat{C}_{target})=\beta.
$$
The upper bound $\beta$ is approached asymptotically but not reached for finite complexity $C$, reflecting the need for adaptation (Theorem 9) and efficiency considerations (PCE, Definition 15).
2.  **Monotonicity with Complexity:** Performance increases with complexity investment above the baseline: $\partial PP / \partial C > 0$ for $C > C_{op}$.
3.  **Diminishing Returns:** The marginal gain in performance decreases as complexity increases: $\partial^2 PP / \partial C^2 < 0$ for $C > C_{op}$. Achieving further improvements becomes progressively harder.
4.  **Dependence on Relative Complexity:** Performance depends primarily on the ratio of invested complexity above baseline relative to the task difficulty, i.e., on a function of $x = (C-C_{op})/\hat{C}_{target}$. Increasing the target difficulty $\hat{C}_{target}$ for a fixed complexity $C$ decreases performance $PP$.

**6.2.6 Theorem 18 (General Functional Form for Performance)**

Any function $PP(C, \hat{C}_{target})$ satisfying the scaling principles outlined in Definition 19 must be expressible in the form:
$$
PP(C, \hat{C}_{target}) = \alpha + (\beta - \alpha) \cdot F\left(\frac{C-C_{op}}{\hat{C}_{target}}\right) \quad \text{(21)}
$$
where the function $F: \mathbb{R}_{\geq 0} \rightarrow [0, 1)$ satisfies:
*   $F(0)=0$ (performance is $\alpha$ at baseline complexity $C=C_{op}$).
*   $\lim_{x \rightarrow \infty} F(x) = 1$ (performance approaches $\beta$ as relative complexity $x \rightarrow \infty$).
*   $F'(x) > 0$ for $x > 0$ (monotonicity, Principle 2).
*   $F''(x) < 0$ for $x > 0$ (diminishing returns, Principle 3).
*Proof:* Principle 1 (Bounds) dictates the scaling form $PP = \alpha + (\beta - \alpha) F_{int}$, where $F_{int}$ maps complexity to $[0, 1)$. Principle 4 (Relative Complexity) implies $F_{int} = F(x)$ with $x = (C-C_{op})/\hat{C}_{target}$. The boundary conditions $F(0)=0$ and $\lim_{x\rightarrow\infty} F(x)=1$ follow directly from Principle 1 applied to $C=C_{op}$ and $C\rightarrow\infty$. Principle 2 (Monotonicity) ($\partial PP / \partial C = (\beta - \alpha) F'(x) / \hat{C}_{target} > 0$) requires $F'(x)>0$. Principle 3 (Diminishing Returns) ($\partial^2 PP / \partial C^2 = (\beta - \alpha) F''(x) / (\hat{C}_{target})^2 < 0$) requires $F''(x)<0$. QED

**6.3 Derivation of the Law of Prediction from POP / PCE**

We now derive the explicit complexity–performance relationship—the *Law of Prediction*—from the scaling principles (Definition 19) together with a PCE composition constraint: allocating relative complexity in independent refinement stages compounds multiplicatively on the remaining performance gap. This "memoryless compounding" is the unique scale-free rule compatible with Definition 19 and with stagewise PCE optimization.

**6.3.1 Theorem 19 (Law of Prediction — Exponential Saturation Model)**

Let a system adapt its operational complexity $C(t)=\langle\hat C_v\rangle(t) \ge C_{op}$, to meet the estimated task difficulty $\hat C_{\mathrm{target}}(t)$. For viability bounds $\alpha<PP<\beta$ (Definition 8), the achievable **Predictive Performance** is given by the following minimal model (consistent with the principles of Definition 19 and discussed in Section 6.7):
$$
PP(C,\hat C_{\mathrm{target}}) =\beta-(\beta-\alpha)\, \exp\!\Bigl[-\kappa_{\mathrm{eff}}\, \tfrac{C-C_{op}}{\hat C_{\mathrm{target}}}\Bigr] \quad \text{(22)}
$$
and the **complexity required** to reach a chosen performance $PP\in(\alpha,\beta)$ is:
$$
C(PP,\hat C_{\mathrm{target}}) = C_{op} +\frac{\hat C_{\mathrm{target}}}{\kappa_{\mathrm{eff}}}\, \ln\!\Bigl(\tfrac{\beta-\alpha}{\beta-PP}\Bigr). \quad \text{(23)}
$$
Here $\kappa_{\mathrm{eff}}$ is a dimensionless efficiency constant. Equation (22) realizes the generic form Equation (21) with $F(x)=1-e^{-\kappa_{\mathrm{eff}}x}$, satisfying the required properties (Theorem 18) and exhibiting logarithmic divergence of $C$ as $PP\rightarrow\beta$.

*Proof:* Define the dimensionless relative complexity
$$
x:=\frac{C-C_{op}}{\hat{C}_{target}}\ge 0,
$$
and the normalized performance gap
$$
g(x):=\frac{\beta-PP(C,\hat{C}_{target})}{\beta-\alpha}\in(0,1],\qquad g(0)=1.
$$
PCE together with the relative-complexity scaling of Definition 19 implies that independent refinement stages add in $x$ and compound on the remaining gap: if a system first allocates $x_1$ units of relative complexity and then allocates an additional $x_2$ units (with the second refinement operating on the residual prediction error left after the first), the resulting normalized gap satisfies the composition law
$$
g(x_1+x_2)=g(x_1)\,g(x_2)\qquad \text{for all }x_1,x_2\ge 0. \quad (\ast)
$$
Assuming $g$ is continuous (operational continuity of $PP$ under small complexity changes), $(\ast)$ together with $g(0)=1$ implies the standard exponential form $g(x)=e^{-\kappa_{eff}x}$ for a unique constant $\kappa_{eff}>0$. Substituting back yields Equation (22), and solving Equation (22) for $C$ yields Equation (23). ∎

*Remark:* Equation (23) implies $(C-C_{op})\propto -\ln(\beta-PP)$ as $PP\to\beta$, consistent with logarithmic rate–distortion scaling when the operational prediction error is proportional to the performance gap.

**6.4 Adaptation Dynamics Driven by PCE**

The Principle of Compression Efficiency (PCE, Definition 15) mandates that systems dynamically adjust their configuration to minimize a global effective potential, balancing predictive benefits against comprehensive resource costs. The adaptation of complexity $C(t)$ is driven by the local gradient of this potential.

**6.4.1 Definition 20 (Def 20): PCE Potential and Adaptation Driving Force $\Psi(t)$**
The adaptation dynamics are governed by the **Principle of Compression Efficiency (PCE) Potential $V(x)$**, which quantifies the net cost rate for a given MPU network configuration $x$. As detailed in Appendix D (Definition D.1), its core components are:
*   **Costs ($V_{op} + V_{prop}$):** The total resource cost rate, including operational costs for maintaining complexity ($R, R_I$) and propagation costs for maintaining network coherence.
*   **Benefit ($V_{benefit}$):** The power-equivalent predictive benefit derived from the system's performance $PP$.
The system's slow adaptation dynamics are modeled as a stochastic gradient flow seeking to minimize this potential: $dx(t) = -\eta(x) \nabla_x V(x) dt + \dots$ (Equation D.8).

The **Adaptation Driving Force $\Psi(t)$** for the complexity component $C(t)$ is defined as the negative of the local gradient of this potential with respect to $C(t)$, representing the net incentive for complexity adaptation. It arises from the local imbalance between the marginal benefit of increased complexity and its marginal cost.

The Adaptation Driving Force is:
$$
\Psi(t) = \Gamma_0 \frac{\partial PP}{\partial C}\bigg|_{C(t)} - \left( \lambda R'(C(t)) + R_I'(C(t)) \right) \quad \text{(24)}
$$
where:
1.  The **Power Conversion Factor ($\Gamma_0$)**: A positive **system-level constant** with dimensions of Power ($[E][T]^{-1}$), representing the conversion rate from dimensionless predictive performance gradients to an equivalent power. Its magnitude is set by the characteristic energy of the operational environment and the MPU cycle rate, e.g., $\Gamma_0 \propto k_B T_{eff} \cdot \nu$. At an equilibrium complexity $C^*$, the condition $\Psi(C^*)=0$ yields the relation in Equation (29), linking $\Gamma_0$ to the marginal benefit and marginal costs at $C^*$.
2.  The **Resource Scarcity Factor $\lambda$**: A dimensionless weight ($\lambda \ge 0$), arising from the operational cost term $V_{op}$, representing the relative importance of physical versus informational costs.

The specific components of the driving force are:
*   **Marginal Benefit:** The term $\Gamma_0 \frac{\partial PP}{\partial C}$ represents the marginal power-equivalent benefit rate per unit complexity increase, with units $[E][T]^{-1}[\text{Complexity}]^{-1}$. From the Law of Prediction (Theorem 19), the performance gradient is:
$$
\frac{\partial PP}{\partial C}\bigg|_{C(t), \hat{C}_{target}(t)}
= (\beta - \alpha)\left(\frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}(t)}\right)
e^{-\kappa_{\mathrm{eff}}\cdot \frac{C(t)-C_{op}}{\hat{C}_{target}(t)}}
= \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}(t)}\big(\beta - PP(t)\big),
\quad \text{with } PP(t)=\beta-(\beta-\alpha)\,e^{-\kappa_{\mathrm{eff}}\cdot \frac{C(t)-C_{op}}{\hat{C}_{target}(t)}} \quad \text{(25)}
$$
*   **Marginal Cost:** The term $\lambda R'(C(t)) + R_I'(C(t))$ is the weighted marginal resource cost rate, with units $[E][T]^{-1}[\text{Complexity}]^{-1}$. From Definition 3:
$$
    R_I'(C(t)) = \frac{r_I}{C(t) \ln 2} \quad (\text{for } C(t) > K_0) \quad \text{(26)}
    $$

*Interpretation:* The driving force $\Psi(t)$ quantifies the net marginal incentive for complexity changes: $\Psi > 0$ favors increasing $C$, $\Psi < 0$ favors decreasing $C$. Equilibrium, corresponding to the optimal complexity allocation (Definition 14), occurs when $\Psi = 0$, precisely where the gradient of the effective potential with respect to complexity vanishes.

**Theorem 20 (Physical Bounds and Self-Consistency of $\Gamma_0$)**

The Power Conversion Factor $\Gamma_0$ is not an arbitrary parameter but is a **system-level constant** of the PCE potential, constrained by thermodynamic limits inherent in the MPU framework.

1.  **Lower Bound (from $P_{min}$):** The minimal power $P_{min} = R(C_{op})$ required to sustain the minimal $C_{op}$ MPU cycle (Equation 16, linked to Theorem 23, Theorem 29) sets a minimum physical scale for energy valuation. For adaptation to drive complexity increases when beneficial, the power-equivalent benefit gradient $\Gamma_0 \nu (\partial PP/\partial C)$ must overcome the marginal cost gradient. This necessitates $\Gamma_0$ be commensurate with baseline operational costs; locally, the threshold for $\Psi>0$ compares $\Gamma_0 \nu \frac{\partial PP}{\partial C}$ to $\lambda R'(C_{op}) + R_I'(C_{op})$:
    $$
    \Gamma_0 \gtrsim P_{min}=R(C_{op}) \gtrsim \frac{n_{irr}\,k_B T\,\varepsilon}{\tau_{\text{min}}}
\ge \frac{k_B T \ln 2}{\tau_{\text{min}}} \quad \text{(27)}
    $$
    where $n_{irr}\ge 1$ is the number of logically irreversible merges that must be reset per minimal cycle and $\varepsilon \ge \ln 2$ is the irreducible dimensionless entropy cost per such merge (Theorem 31). If the cycle rate $\nu \approx 1/\tau_{\text{min}}$, this corresponds to $\Gamma_0 \gtrsim n_{irr}\,k_B T\,\varepsilon$.
2.  **Upper Bound (from $\varepsilon$):** The irreducible thermodynamic cost, quantified by dimensionless entropy production $\varepsilon \ge \ln 2$ (Theorem 31), associated with the necessary irreversible state change during an 'Evolve' interaction, provides an upper bound. The maximum energy-equivalent benefit gainable in a single cycle, $\Gamma_0 \Delta PP_{max}$ (where $\Delta PP_{max} < (\beta-\alpha)$ is the maximal performance improvement), must be considered relative to this fundamental dissipation $E_{dissip} \ge k_B T \varepsilon$. For thermodynamically consistent energy valuation:
     $$
    \Gamma_0 \lesssim \frac{k_B T \varepsilon \nu}{\Delta PP_{max}} =: \Gamma_{0,crit} \quad \text{(28)}
    $$
3.  **Equilibrium Calibration Identity:** At a stable equilibrium configuration characterized by complexity $C^*$ and performance $PP^*$, the Adaptation Driving Force vanishes: $\Psi(C^*, PP^*) = 0$ (Equation 18). This provides a calibration identity relating the constant $\Gamma_0$ to the equilibrium properties of the system:
    $$
    \Gamma_0 = \frac{\lambda R'(C^*) + R_I'(C^*)}{\frac{\partial PP}{\partial C} \big|_{C^*, PP^*}} \quad \text{(29)}
    $$
    For a given constant value of $\Gamma_0$ within the physical bounds, this equation determines the optimal complexity $C^*$ that the system will adapt towards.

*Conclusion:* $\Gamma_0$ is a **system-level constant** of the PCE potential, physically grounded by thermodynamic limits derived within the framework. Its value determines the location of the optimal equilibrium state achieved under PCE optimization.

**6.4.2 Proposition 3 (Complexity Adaptation Dynamics Model)**

Assuming the rate of change of complexity $C(t)$ (operationally, $C(t) = \langle \hat{C}_v \rangle(t)$) is proportional to the net driving force $\Psi(t)$ acting to optimize the PCE objective, the basic adaptation dynamics follow a gradient ascent on the effective benefit landscape defined implicitly by $V(x)$ (Appendix D, **Equation D.8**):
$$
\frac{dC}{dt} = \eta_{adapt} \cdot \Psi(C(t), \hat{C}_{target}(t), \lambda, \Gamma_0) \quad \text{(30)}
$$
Substituting the expression for $\Psi$ (Equation 24) using the derived forms for $\partial PP/\partial C$ (Equation 25) and $R_I'(C)$ (Equation 26):
$$
\frac{dC}{dt} = \eta_{adapt} \left[ \Gamma_0 \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}(t)} (\beta - PP(t)) - \lambda R'(C(t)) - \frac{r_I}{C(t) \ln 2} \right] \quad \text{(31)}
$$
where $\eta_{adapt} > 0$ is the adaptation rate parameter. It has dimensions of $[E]^{-1}[\text{Complexity}]^2$ (from $dC/dt = \eta_{adapt} \Psi$, with $[dC/dt] = [\text{Complexity}][T]^{-1}$ and $[\Psi] = [E][T]^{-1}[\text{Complexity}]^{-1}$), and it determines the timescale and responsiveness of the complexity adaptation to the driving force $\Psi$ (Definition 20). This model describes the dynamics within the viable range $(\alpha, \beta)$, prior to the activation of the viability enforcement mechanisms (Definition 22).

*Interpretation:* Complexity $C(t)$ evolves over time, driven by the imbalance $\Psi(t)$ between marginal benefits and costs, towards the locally optimal value $C^*(t)$ where $\Psi(t)$ approaches zero. This equilibrium $C^*(t)$ represents an efficient operating point satisfying the PCE principle (Definition 14, Equation 18). The dynamics depend explicitly on the current state ($C, \hat{C}_{target}$), the system's energy valuation ($\Gamma_0$), resource scarcity ($\lambda$), intrinsic performance efficiency ($\kappa_{\mathrm{eff}}$), informational overhead ($r_I$), and the marginal physical cost $R'$.

*Remark 4: Interpretation of $\kappa_{\mathrm{eff}}$*
The dimensionless performance-efficiency parameter $\kappa_{\mathrm{eff}}$, introduced in the Law of Prediction (Equation 22), can be expressed in terms of equilibrium quantities. At equilibrium the Adaptation Driving Force vanishes, $\Psi=0$ (Equation 18), and by definition (Equation 24):
$$
\Gamma_0 \,\frac{\partial PP}{\partial C} = \lambda R' + R_I'.
$$
Substituting Equation (25) for the derivative gives:
$$
\Gamma_0\,(\beta-\alpha)\, \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\text{target}}} \,e^{-\kappa_{\mathrm{eff}}(C^{*}-C_{op})/\hat{C}_{\text{target}}} = \lambda R'(C^{*}) + R_I'(C^{*}).
$$
Using Equation (22), we recognize $e^{-\kappa_{\mathrm{eff}}(C^{*}-C_{op})/\hat{C}_{\text{target}}} = (\beta-PP^{*})/(\beta-\alpha)$. Substituting this yields:
$$
\Gamma_0\,(\beta-PP^{*}) \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\text{target}}} = \lambda R'(C^{*}) + R_I'(C^{*}).
$$
Rearranging yields the equilibrium expression:
$$
\kappa_{\mathrm{eff}} = \frac{\hat{C}_{\text{target}}}{\Gamma_0\,(\beta-PP^{*})} \bigl[\lambda R'(C^{*}) + R_I'(C^{*})\bigr] \quad \text{(32)}
$$
Thus $\kappa_{\mathrm{eff}}$ encodes the ratio of marginal resource costs (weighted physical cost gradient $\lambda R' + R_I'$) to the power-equivalent value of the remaining performance gap $(\beta-PP^{*})$, scaled by the target complexity $\hat{C}_{\text{target}}$. Higher costs or a lower constant energy valuation $\Gamma_0$ reduce the effective efficiency $\kappa_{\mathrm{eff}}$.

**6.5 Stability, Response, and Target Estimation**

We analyze the properties of the adaptation dynamics, including stability and the crucial estimation of environmental complexity.

**6.5.1 Theorem 21 (Adaptation Response)**

The sensitivity of the optimal complexity $C^*(t)$ (where $\Psi(C^*) = 0$) to small changes in the estimated environmental complexity $\hat{C}_{target}(t)$ is given by the implicit function theorem:

$$\frac{dC^*(t)}{d\hat{C}_{target}(t)} = -\frac{\partial \Psi / \partial \hat{C}_{target}}{\partial \Psi / \partial C}\bigg|_{C=C^*(t)} \quad \text{(33)}$$

(assuming the denominator $\partial \Psi / \partial C$ is non-zero at $C^*$).

*Proof:* The total differential of $\Psi(C^*(\hat{C}_{target}), \hat{C}_{target}) = 0$ with respect to $\hat{C}_{target}$ is $d\Psi = (\partial \Psi / \partial C^*) (dC^*/d\hat{C}_{target}) + (\partial \Psi / \partial \hat{C}_{target}) = 0$. Rearranging gives Equation (33). We compute the partial derivatives from Equation (24), using Equations (25) and (26).

*   **Derivative w.r.t. C:**

$$\frac{\partial \Psi}{\partial C} = \Gamma_0 \frac{\partial^2 PP}{\partial C^2} - \lambda R''(C) - R_I''(C) \quad \text{(34)}$$

Using Equation (25): $\frac{\partial^2 PP}{\partial C^2} = \frac{\partial}{\partial C} \left( \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}} (\beta - PP) \right) = - \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}} \frac{\partial PP}{\partial C} < 0$.

Using Equation (26): $R_I''(C) = \frac{d}{dC} \left( \frac{r_I}{C \ln 2} \right) = -\frac{r_I}{C^2 \ln 2} < 0$.

Substituting into Equation (34):

$$\frac{\partial \Psi}{\partial C} = - \Gamma_0 \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}} \left( \frac{\partial PP}{\partial C} \right) - \lambda R''(C) + \frac{r_I}{C^2 \ln 2} \quad \text{(35)}$$

For stability, we typically expect $\partial \Psi / \partial C < 0$ (Theorem 22).

*   **Derivative w.r.t. $\hat{C}_{target}$:** Assuming $R'$ and $R_I'$ do not explicitly depend on $\hat{C}_{target}$:

$$\frac{\partial \Psi}{\partial \hat{C}_{target}} = \Gamma_0 \frac{\partial^2 PP}{\partial \hat{C}_{target} \partial C} \quad \text{(36)}$$

Calculating the mixed partial derivative from Equation (25):

$$\frac{\partial^2 PP}{\partial \hat{C}_{target} \partial C} = \frac{\partial}{\partial \hat{C}_{target}} \left( \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{target}} (\beta - PP) \right) = \left( \frac{\partial PP}{\partial C} \right) \left[ -\frac{1}{\hat{C}_{target}} + \frac{\kappa_{\mathrm{eff}} (C-C_{op})}{(\hat{C}_{target})^2} \right]$$

Thus:

$$\frac{\partial \Psi}{\partial \hat{C}_{target}} = \Gamma_0 \left( \frac{\partial PP}{\partial C} \right) \frac{1}{\hat{C}_{target}} \left( \frac{\kappa_{\mathrm{eff}} (C-C_{op})}{\hat{C}_{target}} - 1 \right) \quad \text{(37)}$$

*   **Result:** The sensitivity $dC^*/d\hat{C}_{target}$ is given by $-(\partial \Psi / \partial \hat{C}_{target}) / (\partial \Psi / \partial C)$. If $\partial \Psi / \partial C < 0$ (stability) and the relative complexity $(C-C_{op})/\hat{C}_{target}$ is sufficiently large ($> 1/\kappa_{\mathrm{eff}}$), then $\partial \Psi / \partial \hat{C}_{target} > 0$. In this regime where the relative complexity is sufficiently high, $dC^*/d\hat{C}_{target} > 0$, indicating that an increase in perceived environmental difficulty $\hat{C}_{target}$ leads to a corresponding increase in the optimal allocated complexity $C^*$. QED

**6.5.2 Theorem 22 (Existence, uniqueness, and exponential stability of the PCE optimum)**

Let $J(C):=\Gamma_0\,PP(C)-\big[\lambda R(C)+R_I(C)\big]$ on $[C_{op},\infty)$. Assume the Dominance of Stabilizing Costs (DSC) condition holds, such that $J(C)$ is strictly concave on $[C_{op},\infty)$, and that there exists $\mu>0$ and a neighborhood $\mathcal N(C^*)$ of the unique maximizer $C^*$ where $J(C)$ is $\mu$-strongly concave. Then:

1. There exists a unique maximizer $C^*$ of $J(C)$, characterized by the first‑order condition $\partial J/\partial C = \Psi(C^*) = 0$ (Equation 18).

2. The adaptation dynamics $\dot C=\eta_{adapt}\,\partial J/\partial C$ with $\eta_{adapt}>0$ converge locally and exponentially to $C^*$: for any $C(0)\in\mathcal N(C^*)$,
$$
|C(t)-C^*|\le e^{-\eta_{adapt}\mu t}\,|C(0)-C^*|.
$$

*Proof.* Strict concavity of $J$ guarantees a unique maximizer $C^*$. Strong concavity in a neighborhood implies $(C-C^*)\,\partial J/\partial C\le -\mu(C-C^*)^2$ for $C\in\mathcal N(C^*)$. Let $V(t)=\frac{1}{2}(C(t)-C^*)^2$. Then $\dot V = (C-C^*)\dot C = \eta_{adapt}(C-C^*)\partial J/\partial C \le -\eta_{adapt}\mu(C-C^*)^2 = -2\eta_{adapt}\mu V$. By Grönwall's inequality, $V(t)\le e^{-2\eta_{adapt}\mu t}V(0)$, which yields the stated exponential bound on $|C(t)-C^*|$. ∎

**6.5.3 Definition 21 (Def 21): Dynamics of $\hat{C}_{target}(t)$**

The system must dynamically estimate the environmental complexity or predictive difficulty $\hat{C}_{target}(t)$, which scales performance (Theorem 19) and influences adaptation (Definition 20). We propose an adaptive model based on performance feedback:
$$
\frac{d\hat{C}_{target}}{dt} = \mu_{target} \cdot \hat{C}_{target}(t) \cdot \left( PP_{op} - PP(C(t), \hat{C}_{target}(t)) \right) \quad \text{(38)}
$$
where:
*   $\mu_{target} \ge 0$ is the learning rate parameter (units $[T]^{-1}$).
*   $PP_{op} \in (\alpha, \beta)$ is the system's target operational performance level.
*   $PP(C(t), \hat{C}_{target}(t))$ is the currently achieved performance (Equation 22).

*Interpretation:* This equation implements negative feedback. If current performance $PP$ is below the target $PP_{op}$, the term $(PP_{op} - PP)$ is positive, causing $\hat{C}_{target}$ to increase (system estimates environment is harder). If $PP$ exceeds $PP_{op}$, $\hat{C}_{target}$ decreases. At equilibrium, $PP = PP_{op}$, and $d\hat{C}_{target}/dt = 0$. These dynamics allow the system to adjust its internal representation of task difficulty in conjunction with adapting its own complexity $C(t)$ via Equation (30), facilitating robust operation under varying conditions. Functionally, $\hat{C}_{target}(t)$ serves as the MPU's internal, running estimate of the effective algorithmic complexity of the local environmental dynamics it is trying to predict. Its value is not derived from direct analysis of the environment but is adapted purely through performance feedback, consistent with the MPU's bounded epistemic access.

**6.6 Viability Enforcement**

The adaptation dynamics modeled so far (Equation 30, Equation 38) optimize performance but do not explicitly guarantee that $PP(t)$ remains strictly within the viable Space of Becoming $(\alpha, \beta)$ (Axiom 3). A mechanism is needed to enforce these hard boundaries.

**6.6.1 Definition 22 (Def 22): Viability Enforcement Mechanism**

The complexity adaptation dynamics (Equation 30) are modified to ensure operation within $(\alpha, \beta)$ by incorporating rate modulation and corrective forces that become active near or beyond the viability boundaries:
$$
\frac{dC}{dt} = \eta_{adapt} \cdot \Psi(t) \cdot V_{mod}(PP(t)) + F_{corr}(PP(t)) \quad \text{(39)}
$$
where $PP(t) = PP(C(t), \hat{C}_{target}(t))$ is the instantaneous performance (Equation 22). The components are:
1.  **Rate Modulation $V_{mod}(PP)$:** A smooth function $V_{mod}: (0, 1] \to [0, 1]$ that scales the adaptation rate. $V_{mod}(PP) \approx 1$ deep within the viable range $(\alpha, \beta)$, but $V_{mod}(PP) \to 0$ as $PP$ approaches the boundaries $\alpha^+$ or $\beta^-$, and $V_{mod}(PP) = 0$ outside $[\alpha, \beta]$. This prevents the standard adaptation driver $\Psi$ from pushing the system out of bounds or causing instability near the edges. Define
$$
V_{mod}(PP)=\sin^2\\!\Bigl(\pi\,\frac{PP-\alpha}{\beta-\alpha}\Bigr),
$$
so that $V_{mod}(\alpha)=V_{mod}(\beta)=0$ and $V_{mod}((\alpha+\beta)/2)=1$. For $PP \notin [\alpha, \beta]$, set $V_{mod}(PP)=0$.
2.  **Corrective Force $F_{corr}(PP)$:** A strong restoring force active only *outside* the interval $[\alpha, \beta]$, designed to rapidly push the complexity $C$ back towards the viable range. $F_{corr} > 0$ (increasing C) if $PP < \alpha$, $F_{corr} < 0$ (decreasing C) if $PP > \beta$, and $F_{corr} = 0$ if $\alpha \le PP \le \beta$. Define
    $$
    F_{corr}(PP)=-\lambda \left( H(PP-(\beta-\delta)) - H((\alpha+\delta)-PP) \right) \quad \text{(40)}
    $$
    where $H$ is the Heaviside step function, $\delta>0$ is a small margin, and $\lambda>0$ is a restoring coefficient.

*Function:* This combined dynamics (Equation 39) ensures that complexity adaptation primarily follows the optimization gradient $\Psi$ (scaled by $V_{mod}$) within the viable range $(\alpha, \beta)$, while strong corrective forces $F_{corr}$ prevent sustained operation outside these critical bounds, upholding Axiom 3.

**6.7 Model-Form Robustness**

The optimization and stability results in this section depend only on the stated boundary conditions and regularity/convexity hypotheses (Definitions 19–22). When an explicit closed form is required, it is fixed either by the composition constraint underlying Theorem 19 or by the admissibility requirements built into the dynamical definition (Definition 22). Any substitution must preserve the stated monotonicity/convexity and boundary conditions; under those conditions, existence/uniqueness of the target-tracking dynamics (Theorem 22) and viability enforcement remain valid.

**6.8 Functional Interpretation: Adaptation as Implicit Error Management**

The complex adaptation dynamics governing $C(t)$ and $\hat{C}_{target}(t)$ (Equation 39, Equation 38) can be understood functionally as a control system aiming to keep the "error" (deviation from optimal/viable performance) low.

*   **Desired State:** Operation near the target performance $PP_{op}$ within the viable range $(\alpha, \beta)$.
*   **Disturbances:** Changes in the environment (actual predictive difficulty), internal noise, resource fluctuations.
*   **Performance Measurement:** $PP(t)$ acts as the system's measurement of its current operational state relative to the desired state $PP_{op}$.
*   **Error Signal:** The deviation $(PP_{op} - PP)$ serves as an error signal.
*   **Control Actions:** Adjusting $\hat{C}_{target}$ (Equation 38) adapts the internal representation of the environment. Adjusting $C$ via $\Psi$ (Equation 30) modifies capability based on perceived difficulty and costs. Viability enforcement (Equation 39) acts as boundary control.
*   **Goal:** The coupled dynamics function as a feedback control loop, continuously adjusting internal complexity $C$ and environmental representation $\hat{C}_{target}$ to minimize prediction error (maximize $PP$) efficiently (PCE) while staying within the operational boundaries $(\alpha, \beta)$. It implicitly manages uncertainty and the irreducible stochasticity of ND-RID interactions ($\varepsilon \ge \ln 2$), enabling sustained viable prediction.

**6.9 Self-Consistent Determination of Viability Bounds $\alpha$ and $\beta$**

In the PU framework, $\alpha$ and $\beta$ are derived thresholds tied to the structure of SPAP, ND-RID, and thermodynamic bounds. Key constraints include:

*   **Lower Bound $\alpha$:** $\alpha$ is constrained by the minimal information content of a predictive act. Specifically, SPAP/erasure implies a necessary overhead of at least one bit of irreducible uncertainty, with $\varepsilon \ge \ln 2$ (Theorem 31), suggesting $\alpha \ge 0.5$ (for binary tasks) or a more general bound $\alpha > 0$.

*   **The Upper Bound $\beta$:** This is the threshold of adaptability, where the marginal cost of further predictive improvement becomes prohibitive under PCE. Its value is set by a dynamic stability condition: the system must be able to afford the resource cost of achieving the next increment of performance without entering a regime of runaway costs or instability. This constrains the relationship between the marginal cost functions ($R'$, $R_I'$) and the performance gap $(\beta - PP)$ at the limit of high complexity. Deriving $\beta$ requires a full, self-consistent solution of the PCE optimization problem at its upper boundary, likely yielding a value for $\beta$ that is a complex function of the framework's core cost and efficiency parameters ($r_p$, $\gamma_p$, $r_I$, $\kappa_{eff}$, $\lambda$, $\Gamma_0$).

