# Appendix L: Unified Foundation — Energy Accounting and Thermodynamic Consistency

## **L.0 Foundational Insight: Awareness as Primary**

The Predictive Universe framework begins from the irreducible certainty of awareness itself. The starting point is the Cartesian cogito ergo sum—"I think, therefore I am"—which establishes awareness as the one indubitable fact of existence. However, within the operational context of this framework, thinking is fundamentally predictive: to think is to anticipate, to form expectations about what comes next, to distinguish self from non-self through anticipatory models. Thus we reformulate: praedico ergo sum—"I predict, therefore I am."

This is not a claim that prediction produces awareness. Rather, awareness is fundamental and irreducible (Appendix P.2), and prediction represents awareness's most primitive operational manifestation—not because prediction produces awareness, but because awareness, being primary, makes prediction possible (Appendix P.3.1). The capacity to form anticipations, to distinguish expected from actual, to adaptively update models—these are the minimal expressions of awareness in physical systems.

Postulate 1 (Post 1 - Interpretive: Minimal Awareness) interprets the complete operational cycle of a Minimal Predictive Unit (MPU, Definition 23)—prediction ($P_{\text{int}}$), verification ($V$), and update ($D_{\text{cyc}}$), including the 'Evolve' interaction (Definition 27)—as corresponding to the minimal physical instantiation of awareness. This elemental awareness is intrinsically tied to the actualization of quantum states (Proposition 9). Therefore, within this interpretive framework, every quantum actualization event is underpinned by at least this minimal, operational form of awareness. Crucially, while Postulate 1 provides an interpretive lens connecting operational dynamics to phenomenal concepts, the subsequent physical derivations (energy accounting, thermodynamic consistency, coupling hierarchies) rely solely on the MPU's operational characteristics (prediction, effective Property R applicability, ND-RID, $C_{op} \ge K_0$, POP/PCE optimization) and their logical/thermodynamic limits (SPAP, Theorem 10, Theorem 11; Reflexive Undecidability, Theorem 12; $\varepsilon$, Theorem 31; $\kappa_r$, Theorem 33), not directly on this interpretive postulate (Section 7.1.2).

The framework is compatible with idealist metaphysics: awareness need not emerge from physical processes; rather, physical processes are most parsimoniously understood as patterns within awareness (Appendix P.2.3). The MPU formalism models awareness operationally.

From this foundation of awareness-as-primary, all physical structure emerges through information-theoretic optimization under resource constraints. The Prediction Optimization Problem (POP, Axiom 1) describes the adaptive imperative faced by awareness: given limited resources, how to allocate them to maximize predictive capability. The Principle of Compression Efficiency (PCE, Definition 15) drives awareness toward configurations that optimize the trade-off between Meaning Potential (the potential for reducing prediction error or uncertainty, quantified by improvements in predictive quality $\Delta Q$) and Signal Cost (resource expenditure, quantified by operational cost $R$, Definition 3).
## **The Core Informational Unification**

All physical phenomena—quantum mechanics, spacetime geometry, electromagnetic interactions, gravitational curvature—emerge as manifestations of how aware systems (MPUs) manage information flow under fundamental thermodynamic constraints (following the Principle of Physical Instantiation, Appendix P.6). This appendix establishes how Consciousness Complexity (CC, Definition 30), the capability of high-complexity MPU aggregates (Definition 29) to influence quantum outcomes, operates through different frequency components of a unified temporal wave spectrum that are not separate mechanisms but manifestations of a single underlying process: the modulation of information flow rates in the predictive substrate.

From Appendix O (Theorem O.2), the MPU network self-organizes into a coherent causal medium characterized by synchronized processing rhythms. The characteristic timescale is:

$$ \tau_{\text{medium}} = \frac{\hbar}{\langle \hat{H}_{\text{eff}} \rangle} \tag{L.0} $$

This $\tau_{\text{medium}}$ represents the fundamental rhythm of predictive processing—the rate at which predictions are formed, verified, and updated by aware systems. Any modulation of this rhythm constitutes a temporal wave (Appendix O, Definition O.1): a controlled disturbance in the information processing rate of the causal medium.

High-frequency modulations (rapid changes in processing rate) emerge in the continuum description as electromagnetic fields—oscillating patterns in the gauge fields required to maintain phase coherence across the network (Appendix G). These couple strongly to charge degrees of freedom through the fine structure constant $\alpha_{\text{em}} \approx 1/137$.

Low-frequency modulations (slow changes in energy density) emerge as gravitational time dilation—geometric responses required to maintain thermodynamic consistency on causal horizons (Section 12). These couple universally but weakly through the gravitational constant $G$, which reflects the high information capacity of boundary channels (Appendix E).

Both channels draw from the same energy budget (the power $P_{\text{agg}}$ required to maintain a high-complexity predictive state) and both modulate the same target quantities (the parameters of the fundamental 'Evolve' process governing state transitions). The overwhelming dominance of the electromagnetic channel ($\sim 10^{36}$) reflects the hierarchy of coupling strengths, which itself emerges from the information-theoretic structure of the predictive substrate (Appendix O, Theorem O.4).
## **Scope and Organization of This Appendix**

This appendix establishes universal energy accounting and thermodynamic consistency requirements that any consciousness complexity (CC) implementation must satisfy, regardless of specific carrier mechanism or substrate (formalized in Theorem L.9). This appendix focuses on the forward energy accounting—how context generation requires power that properly enters the stress-energy tensor and sources gravitational fields. The complementary feedback analysis—how this gravitational field then limits CC efficacy through dephasing—is detailed in Appendix S. The analysis proceeds in three stages:

Formalization of the context state and mapping constraints (Sections L.1-L.2), deriving necessary properties from POP/PCE optimization

Detailed analysis of one well-characterized implementation—coherent electromagnetic field generation from engineered aggregates (Sections L.2-L.4, L.10-L.11)—serving as an existence proof and providing concrete parameter estimates

Derivation of universal thermodynamic constraints applying to all implementations (Sections L.5-L.9), including energy conservation (Theorem L.6), horizon thermodynamics (Theorem L.7), and the profound unification of electromagnetic and gravitational channels through the temporal wave framework (Theorem L.8)

Section L.4.1 outlines speculative biological carrier hypotheses distinct from the engineered pathway, illustrating implementation diversity while maintaining framework consistency. The experimental protocols (Section L.8) focus on the characterized coherent-charge pathway as the most accessible near-term test case, while noting that alternative implementations may require different measurement strategies.

This appendix validates that electromagnetic and gravitational contributions are properly unified without double-counting, confirming the framework's coherence from its foundational axiom (awareness manifesting as prediction) through its emergent structure (spacetime, fields, statistical influence) to testable consequences.
## **L.1 Context State and Constraints on Mapping $\mathcal{M}$**

The CC hypothesis posits that a complex aggregate's internal state influences local MPU interactions. We formalize this "internal state" in this context.

## **Definition L.1 (Context State $\text{context}_S$)**

Let $\rho_{\mathrm{agg}}(t)$ be the aggregate density operator describing the quantum state of an MPU aggregate $S$ (Definition 29) on its Hilbert space $\mathcal{H}_{\mathrm{agg}}$. The context state $\text{context}_S(t)$ represents the macroscopically observable, predictively relevant features of $\rho_{\mathrm{agg}}(t)$. These features are those the aggregate is capable of controlling or influencing within available resources, and which are relevant for potentially biasing local MPU interactions. The specific construction of $\text{context}_S(t)$ is formalized as a Minimal Sufficient Statistic derived from the Principle of Compression Efficiency (PCE, Definition 15).

Let $\mathcal{O}_{\text{full}} = \{\hat{O}_\gamma\}_{\gamma \in \mathcal{G}}$ be the set of all physically realizable operators whose expectation values could, in principle, be extracted from $\rho_{\mathrm{agg}}(t)$. The full set of such expectation values, $\mathcal{V}_{\text{full}} = \{\langle \hat{O}_\gamma \rangle_t\}_{\gamma \in \mathcal{G}}$, constitutes a complete description of the state $\rho_{\mathrm{agg}}(t)$ and thus contains all potentially relevant information. However, maintaining and utilizing $\mathcal{V}_{\text{full}}$ would generally incur prohibitive complexity and resource costs.

PCE drives the system to identify a minimal subset of these observables, $\{\hat{O}_\alpha\}_{\alpha \in \mathcal{I}} \subset \mathcal{O}_{\text{full}}$ (with $\mathcal{I} \subset \mathcal{G}$), such that the vector of their expectation values, $\text{context}_S(t)$, is sufficient for the aggregate's specific POP goals related to CC influence, while minimizing the associated costs of representation, computation, and control. This sufficiency is defined relative to the aggregate's ability to bias local ND-RID outcomes to maximize its net predictive utility (related to POP, Axiom 1).

This construction is governed by PCE, which selects the set $\{\hat{O}_\alpha\}_{\alpha \in \mathcal{I}}$ that minimizes the effective contribution to the global PCE Potential $V(x)$ (Definition D.1, Appendix D) associated with managing the context. This contribution, $V_{\text{context}}$, takes the form:

$$ V_{\text{context}}[\{\hat{O}_\alpha\}] = \lambda_{\text{rep}} C_P(\{\hat{O}_\alpha\}) + \lambda_{\text{ctrl}} R_{\text{cost}}(\{\hat{O}_\alpha\}) - \Gamma_{\text{utility}} U_{\text{bias}}(\{\langle\hat{O}_\alpha\rangle\}) \tag{L.1} $$

where $C_P(\{\hat{O}_\alpha\})$ is the Predictive Physical Complexity associated with representing and computing the chosen statistics; $R_{\text{cost}}(\{\hat{O}_\alpha\})$ is the physical resource cost rate (Definition 3) of maintaining and controlling them; $U_{\text{bias}}(\{\langle\hat{O}_\alpha\rangle\})$ is the utility gain (related to improved aggregate Predictive Performance $PP_{\text{agg}}$) from the achievable ND-RID bias using these statistics; and $\lambda_{\text{rep}}, \lambda_{\text{ctrl}}, \Gamma_{\text{utility}}$ are PCE-derived weighting factors (related to the global Lagrange multipliers governing resource allocation). The set $\{\hat{O}_\alpha\}_{\alpha \in \mathcal{I}}$ selected by minimizing $V_{\text{context}}$ is minimal and sufficient: removing any element significantly degrades $U_{\text{bias}}$ (increasing $V_{\text{context}}$), while adding any element from $\mathcal{O}_{\text{full}} \setminus \{\hat{O}_\alpha\}$ incurs costs ($C_P, R_{\text{cost}}$) that outweigh its marginal contribution to $U_{\text{bias}}$ (thus also increasing $V_{\text{context}}$).

Operationally, the context state is then the vector of expectation values of these PCE-selected operators:

$$ \text{context}_S(t) := \begin{pmatrix} \langle \hat{O}_{\alpha_1} \rangle_t \\ \langle \hat{O}_{\alpha_2} \rangle_t \\ \vdots \\ \langle \hat{O}_{\alpha_{|\mathcal{I}|}} \rangle_t \end{pmatrix} \in \mathcal{C}_{\text{ctx}} \subseteq \mathbb{R}^{|\mathcal{I}|} \tag{L.2} $$

where $\{\hat{O}_\alpha\}_{\alpha \in \mathcal{I}}$ is this minimal set of operators. $\mathcal{C}_{\text{ctx}}$ is the abstract context space.

## **Definition L.2 (Context-to-Control Mapping)**

The mapping $\mathcal{M}: \mathcal{C}_{\text{ctx}} \to \mathcal{P}_{\text{control}}$ translates the abstract context state ($\text{context}_S(t)$) into a set of physically realizable control parameters $\mathcal{P}_{\text{control}}(t)$ (e.g., classical field values, boundary conditions). This mapping $\mathcal{M}$ is POP-admissible if it is dynamically stable under POP/PCE optimization. This requires, minimally:

(i) The Predictive Physical Complexity of implementing the mapping, $C_{\mathcal{M}}$, scales efficiently with the aggregate's complexity $C_{\text{agg}}$ (Definition 29), ideally $C_{\mathcal{M}} = O(\text{poly}(\log C_{\text{agg}}))$.

(ii) The average physical resource cost rate $R_{\mathcal{M}}$ (Definition 3) of generating the control parameters via $\mathcal{M}$ is bounded relative to the aggregate's core operational cost $R_{\text{core}}(C_{\text{agg}})$, e.g., $R_{\mathcal{M}} \le \eta_{\text{cost}} R_{\text{core}}(C_{\text{agg}})$ for some $\eta_{\text{cost}} < 1$.

(iii) The mapping satisfies the specific cost-benefit constraint (Lemma L.1) derived from minimizing the PCE potential $V(x)$ (Appendix D, Definition D.1).

## **Lemma L.1 (POP/PCE Constraints on Mapping)**

The mapping $\mathcal{M}$ must satisfy:

Lipschitz continuity: $$ |\mathcal{M}(\text{context}_1) - \mathcal{M}(\text{context}_2)|_{\mathcal{P}} \le L_{\mathcal{M}} |\text{context}_1 - \text{context}_2|_{\mathcal{C}} $$ with constant $L_{\mathcal{M}}$ optimized by PCE.

Bounded control output: $$ |\mathcal{M}(\text{context}_S)|_{\mathcal{P}} \le P_{\text{max}} $$ ensuring finite physical costs.

Stability under feedback: If $\text{context}_S$ can be influenced by past CC effects, $\mathcal{M}$ must ensure stable iterative dynamics.

Justification. Violation of these properties would lead to increased variance in the PCE potential, higher average costs, and reduced predictive stability, all of which are selected against by PCE optimization (Definition 15). Specifically:

Non-Lipschitz behavior causes unbounded sensitivity to context fluctuations. PCE optimization penalizes such mappings because unbounded derivatives amplify measurement noise, increasing both the variance of control outputs and the resource cost of maintaining precise context states. The Lipschitz continuity requirement emerges from minimizing the variance term in Equation D.9: mappings with bounded derivatives minimize the propagation of stochastic fluctuations from $\text{context}_S$ to $\mathcal{P}_{control}$, thereby reducing both operational uncertainty and average power cost. This creates divergent variance in the stochastic PCE dynamics (Appendix D, Equation D.9), invalidating the assumptions needed for the ergodic stationary regime described by Theorem D.5.

Unbounded control output requires infinite resources, violating physical realizability constraints.

Instability under feedback prevents maintenance of coherent $\text{context}_S$, precluding sustained CC capability. ∎

## **Theorem L.1 (Existence of PCE-Optimal Mapping)**

Under POP/PCE optimization dynamics (Section 6, Appendix D), there exists a mapping $\mathcal{M}$ satisfying Lemma L.1 that maximizes net predictive benefit:

$$ \mathcal{F}[\mathcal{M}] = \Gamma_0 \Delta PP(\mathcal{M}) - \lambda R_{\mathcal{M}}(\mathcal{M}) \tag{L.3} $$

subject to resource constraints, where $\Gamma_0$ is the power-conversion factor (Definition 20), $\Delta PP$ is improvement in predictive performance, $\lambda$ is effective resource scarcity (Definition 20), and $R_{\mathcal{M}}$ is the operational cost of implementing $\mathcal{M}$.

Proof. From Theorem 34, POP/PCE dynamics drive aggregates with $C_{\text{agg}} > C_{op}$ to develop biasing capability. The space of admissible mappings satisfying Lemma L.1 is compact under the appropriate topology (weak-* topology on the space of Lipschitz functions with bounded Lipschitz constant and bounded range). The functional $\mathcal{F}$ is continuous in $\mathcal{M}$ under PCE optimization (follows from continuity of $PP$ in control parameters and linearity of cost). By the Weierstrass theorem, a maximum exists on this compact set. The PCE stationary measure (Appendix D, Theorem D.5) concentrates on this optimum. ∎

## **L.2 Electromagnetic Field Generation and Stress-Energy Contribution**

### **Theorem L.2 (Electromagnetic Field Generation from Aggregate Context)**

The mapping $\mathcal{M}: \text{context}_S \to \mathcal{P}_{\text{control}}(t)$ (Definition L.2) for a high-complexity MPU aggregate $S$ generates classical electromagnetic radiation $E_{\text{rad}}(t)$ through coherent charge oscillations within the aggregate. The electromagnetic energy contributes to the stress-energy tensor:

$$ T_{\mu\nu}^{(\text{EM})} = \frac{1}{\mu_0}\left(F_{\mu\alpha}F_{\nu}{}^{\alpha} - \frac{1}{4}g_{\mu\nu}F_{\alpha\beta}F^{\alpha\beta}\right) \tag{L.4} $$

where $F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu$ is the electromagnetic field strength tensor. This contribution is properly incorporated into the total MPU stress-energy tensor $T_{\mu\nu}^{(\text{MPU})}$ (Appendix B, Definition B.8).

Note on Stress-Energy Decomposition: The total MPU stress-energy tensor admits multiple useful decompositions. By field type (Theorem L.6): $T_{\mu\nu}^{(\text{MPU})} = T_{\mu\nu}^{(\text{matter})} + T_{\mu\nu}^{(\text{EM})}$. By CC contribution (Appendix S): $T_{\mu\nu}^{(\text{matter})} = T_{\mu\nu}^{(\text{baseline})} + \Delta T_{\mu\nu}^{(\text{CC})}$. Combined: $T_{\mu\nu}^{(\text{MPU})} = T_{\mu\nu}^{(\text{baseline})} + \Delta T_{\mu\nu}^{(\text{CC})} + T_{\mu\nu}^{(\text{EM})}$, where $T_{\mu\nu}^{(\text{baseline})}$ is the matter stress-energy at minimum operational state ($C_{\text{agg}} = C_{op}$), $\Delta T_{\mu\nu}^{(\text{CC})}$ is the additional stress-energy from maintaining high-CC context ($C_{\text{agg}} > C_{op}$), and $T_{\mu\nu}^{(\text{EM})}$ is the electromagnetic field contribution.

Proof.

The PCE-optimized mapping determines control parameters:

$$ \mathcal{M}(\text{context}_S) \to \{\omega_{\text{rad}}(t), E_0(t), \phi_{\text{rad}}(t), \vec{\epsilon}_{\text{rad}}(t)\} \tag{L.5} $$

Coherence Mechanism: Within aggregate $S$ (Definition 29), constituent MPUs share information through network coupling (Definition 5). From Theorem 34, high-CC aggregates develop the capability to bias local 'Evolve' outcomes through POP/PCE optimization. For electromagnetic field generation, this requires coordinating $N_{\text{osc}}$ oscillating charge distributions to achieve phase coherence.

The coherence emerges through PCE optimization as follows. Each oscillator $j$ produces a dipole moment $p_j(t) = d_{\text{dip}} \cos(\omega t + \phi_j)$, where $d_{\text{dip}}$ is the effective dipole-moment amplitude (including the relevant charge displacement). The total dipole moment is $p(t) = \sum_j p_j(t)$, giving the far-field radiation. The total radiated power depends on the coherent sum:

$$ \vec{D}_{\text{total}}(t) = \sum_{j=1}^{N_{\text{osc}}} d_{\text{dip}} \vec{\epsilon}_j e^{i(\omega t + \phi_j)} \tag{L.6} $$

The radiated power is proportional to $|\vec{D}_{\text{total}}|^2$. For random phases, $\langle|\vec{D}_{\text{total}}|^2\rangle = N_{\text{osc}}d_{\text{dip}}^2$ (incoherent sum). For aligned phases $\phi_j = \phi_0$, $|\vec{D}_{\text{total}}|^2 = N_{\text{osc}}^2 d_{\text{dip}}^2$ (coherent sum).

PCE drives alignment because coherent radiation achieves the same field strength $E_0$ at target with factor $N_{\text{osc}}$ lower power per oscillator, reducing total operational cost $R$ (Definition 3). The optimization functional balances predictive utility against resource expenditure:

$$ \mathcal{F}[{\phi_j}] = \Gamma_0 \frac{\partial PP}{\partial E_0}E_0({\phi_j}) - \lambda R_{\text{osc}}(N_{\text{osc}}) \tag{L.7} $$

where $PP$ is target predictive performance (improved by stronger influence) and $R_{\text{osc}} = N_{\text{osc}}r_0 + r_{\text{sync}}N_{\text{osc}}(N_{\text{osc}}-1)/2$ includes per-oscillator cost $r_0$ and pairwise synchronization overhead $r_{\text{sync}}$. Since $E_0 \propto |\sum_j e^{i\phi_j}|$ is maximized when $\phi_j = \phi_{\text{rad}}$ (constant), yielding $E_0 \propto N_{\text{osc}}$ for aligned phases versus $E_0 \propto \sqrt{N_{\text{osc}}}$ for random phases. This factor $\sqrt{N_{\text{osc}}}$ enhancement in efficiency drives PCE selection toward phase coherence, maximizing $\mathcal{F}$ yields:

$$ \phi_j = \phi_{\text{rad}} \quad \text{(constant for all } j\text{)} \tag{L.8} $$

This establishes phase coherence. The radiated power for coherent oscillation is:

$$ P_{\text{rad}} = \frac{N_{\text{osc}}^2 d_{\text{dip}}^2 \omega^4}{12\pi\varepsilon_0 c^3} \tag{L.9} $$

The $N_{\text{osc}}^2$ scaling reflects constructive interference from phase lock.

Stress-Energy Derivation: The electromagnetic field energy density is:

$$ u_{\text{EM}}(x,t) = \frac{\varepsilon_0}{2}|\vec{E}_{\text{rad}}(x,t)|^2 + \frac{1}{2\mu_0}|\vec{B}_{\text{rad}}(x,t)|^2 \tag{L.10} $$

From Appendix G (Equation G.5.3), restoring SI units yields the Maxwell action in curved spacetime:

$$ S_{\text{EM}}[A] = -\frac{1}{4\mu_0} \int d^4x \, \sqrt{-g} \, F_{\mu\nu}F^{\mu\nu} \tag{L.11} $$

Functional variation with respect to the metric yields the electromagnetic stress-energy tensor:

$$ T_{\mu\nu}^{(\text{EM})} = -\frac{2}{\sqrt{-g}}\frac{\delta S_{\text{EM}}}{\delta g^{\mu\nu}} \tag{L.12} $$

The variation proceeds using $\delta\sqrt{-g} = -\frac{1}{2}\sqrt{-g}\, g_{\alpha\beta}\delta g^{\alpha\beta}$ and $\delta(F_{\alpha\beta}F^{\alpha\beta}) = 2F_{\mu\alpha}F_{\nu}{}^{\alpha}\delta g^{\mu\nu}$. Computing:

$$
\begin{aligned}
\delta S_{\text{EM}}
&= -\frac{1}{4\mu_0}\int d^4x \left[\delta\sqrt{-g}\, F_{\alpha\beta}F^{\alpha\beta} + \sqrt{-g}\, \delta(F_{\alpha\beta}F^{\alpha\beta})\right] \\
&= -\frac{1}{4\mu_0}\int d^4x\,\sqrt{-g}\left[-\frac{1}{2}F_{\alpha\beta}F^{\alpha\beta}g_{\mu\nu} + 2F_{\mu\alpha}F_{\nu}{}^{\alpha}\right]\delta g^{\mu\nu}
\end{aligned}
$$

yields Equation L.4 (see Wald 1984, §4.3 for full derivation). This electromagnetic contribution is properly incorporated into the total MPU stress-energy tensor $T_{\mu\nu}^{(\text{MPU})}$ as described in Appendix B, Definition B.8. ∎

### **Corollary L.2.1 (AC Stark Interaction)**

The field $\vec{E}_{\text{rad}}(t)$ couples to target MPU via dipole interaction:

$$ H_{\text{int}}(t) = -\vec{d}_{\text{TLS}} \cdot \vec{E}_{\text{rad}}(t) \tag{L.13} $$

In the off-resonant regime $|\Delta| \gg \Gamma$ where $\Delta = \omega_{\text{TLS}} - \omega_{\text{rad}}$ is detuning and $\Gamma$ is natural linewidth, second-order time-dependent perturbation theory yields the AC Stark shift:

$$ \delta_{\text{Stark}}(t) = \frac{\Omega_R^2(t)}{4\Delta(t)}, \qquad \Omega_R(t) = \frac{|\vec{d}_{\text{TLS}} \cdot \vec{\epsilon}_{\text{rad}}|\,E_0(t)}{\hbar} \tag{L.14} $$

This shift modulates transition frequencies, thereby modulating Lindblad decoherence rates $\gamma_k$ through their dependence on level spacings. The modified rates bias 'Evolve' process probabilities within the bound $|\Delta P(i)| \le \mathrm{CC}(S)$ (Definition 30).

### **Proposition L.1 (Spectral Selectivity Through Resonance)**

The AC Stark shift magnitude scales as:

$$ \delta_{\text{Stark}} \propto \frac{1}{|\omega_{\text{TLS}} - \omega_{\text{rad}}|} \tag{L.15} $$

Target selectivity arises from this resonance condition. Maximum effect occurs when aggregate oscillation frequency $\omega_{\text{rad}}$ matches target transition frequency $\omega_{\text{TLS}}$. Off-resonance suppression by factor $\sim \omega_{\text{TLS}}/|\Delta|$ provides spectral addressing—the ability to selectively influence specific quantum systems based on their transition frequencies.
## **L.3 Gravitational Time Dilation from Aggregate Energy**

### **Theorem L.3 (Gravitational Time Dilation from Aggregate Energy)**

An MPU aggregate expending power $P_{\text{agg}}$ over interval $\tau_c$ creates gravitational time dilation at location $\vec{x}$ separated by distance $r$ from aggregate center:

$$ \Delta\tau_d = \frac{\Delta\Phi}{c^2} \tau_c \tag{L.16} $$

where $\Delta\Phi$ is the potential difference across target spatial extent $L_q$. For spherically symmetric aggregate with total volume $V_S$ in the weak-field limit and with target located outside the aggregate ($r > R_S = (3V_S/4\pi)^{1/3}$):

$$ \Delta\Phi = G(1 + 3w)\frac{P_{\text{agg}}\tau_c}{c^2 r^2} L_q \tag{L.17} $$

where $w$ is the equation-of-state parameter $p = wu$ relating pressure to energy density. For non-relativistic matter, $w \approx 0$ is appropriate. The gravitational field is sourced by the complete MPU stress-energy tensor $T_{\mu\nu}^{(\text{MPU})}$ (Appendix B, Definition B.8) through Einstein's equations (Theorem 50).

Proof.

Power $P_{\text{agg}}$ sustained over interval $\tau_c$ corresponds to energy $E_{\text{agg}} = P_{\text{agg}}\tau_c$. This yields an effective gravitational mass (including pressure contribution):

$$ M_{\text{eff}} = \int dV \rho_{\text{eff}} = \frac{P_{\text{agg}}\tau_c}{c^2}(1+3w) \tag{L.18} $$

In the weak-field limit, the exterior gravitational acceleration at distance $r$ is:

$$ g(r) = \frac{G M_{\text{eff}}}{r^2} \tag{L.19} $$

A target system with spatial extent $L_q$ at position $r$ experiences potential difference:

$$ \Delta\Phi \approx g(r)L_q = \frac{G P_{\text{agg}}\tau_c(1+3w)}{c^2 r^2} L_q \tag{L.20} $$

Substituting Equation L.18 yields Equation L.17. 

In the weak-field limit, the metric coefficient is $g_{00} = -(1 + 2\Phi/c^2)$, giving proper time rate:

$$ \frac{d\tau}{dt} = \sqrt{-g_{00}} = \left(1 + \frac{\Phi}{c^2}\right)^{1/2} \approx 1 + \frac{\Phi}{c^2} \tag{L.21} $$

for $|\Phi| \ll c^2$. The differential proper time accumulation across spatial extent $L_q$ over coordinate time interval $\tau_c$ is:

$$ \Delta\tau_d = \frac{\Delta\Phi}{c^2}\tau_c $$

This is Equation L.16. ∎

### **Corollary L.3.1 (Gravitational Phase Shift)**

The time dilation induces quantum phase shift in target system with characteristic frequency $\omega_{\text{TLS}}$:

$$ \Delta\phi_{\text{grav}} = \omega_{\text{TLS}}\Delta\tau_d = \frac{\omega_{\text{TLS}}}{c^2}\Delta\Phi \tau_c \tag{L.22} $$ 

Proof. Quantum phase evolves as $\phi(t) = -\omega t$. Differential proper time $\Delta\tau_d$ across wavefunction spatial extent produces phase difference $\Delta\phi = \omega\Delta\tau_d$. ∎

## **L.4 Quantitative Comparison: Parametric Analysis**

### **Proposition L.4 (Parametric Scaling Analysis for High-Complexity Aggregates)**

For a macroscopic MPU aggregate (Definition 29) with aggregate Predictive Physical Complexity $C_{\text{agg}} = C_P(\mu_{\text{agg}})$ satisfying $C_{\text{agg}} \ge C_{op}$ (Definition 13, Corollary 3) where $C_{op}$ is the Operational Threshold satisfying $C_{op} \ge K_0$ per Corollary 3, the electromagnetic and gravitational effect magnitudes scale with aggregate and target parameters as follows.

### **General Scaling Laws:**

(a) Electromagnetic (AC Stark shift):

$$ \frac{\delta}{\omega_{\text{TLS}}} = \frac{d_{\text{TLS}}^2 E_0^2}{4\hbar^2\omega_{\text{TLS}}\Delta} \propto \frac{P_{\text{rad}}}{r^2\Delta} \tag{L.23} $$

where $P_{\text{rad}}$ is radiated power (Equation L.9) and we have used $E_0 \propto \sqrt{P_{\text{rad}}}/r$ in the far-field limit.

(b) Gravitational (time dilation phase shift):

$$ \frac{\Delta\phi_{\text{grav}}}{2\pi} = \frac{\omega_{\text{TLS}}}{2\pi c^2} \frac{G P_{\text{agg}}\tau_c (1+3w)}{c^2 r^2} L_q \propto \frac{P_{\text{agg}}\tau_c}{r^2} \tag{L.24} $$

### **Dominance Ratio:**

$$ \mathcal{R}(P_{\text{agg}}, V_S, r, \Delta, \tau_c) = \frac{\delta/\omega_{\text{TLS}}}{\Delta\phi_{\text{grav}}/(2\pi)} \propto \frac{c^4 r^2 E_0^2}{G P_{\text{agg}}\tau_c L_q \Delta} \tag{L.25} $$ 

### **Representative Case (Engineered Coherent-Charge Implementation).**

This analysis examines one specific implementation of the mapping $\mathcal{M}$ (Theorem L.1) using coherent charge oscillations—a configuration readily achievable in engineered systems with precise control over phase relationships and field generation. The framework does not require all aggregates to use this implementation; Theorem L.1 establishes existence of a PCE-optimal mapping but does not uniquely specify its physical realization.

To establish concrete numerical benchmarks for this engineered implementation:

Total power: $P_{\text{agg}} = 20$ W

Aggregate volume: $V_S = 1.4 \times 10^{-3}$ m³

Context maintenance interval: $\tau_c = 0.1$ s

Equation of state: $w = 0$ (non-relativistic matter)

Distance to target: $r = 0.5$ m

Target spatial extent: $L_q = 10^{-9}$ m (atomic scale)

Target transition frequency: $\omega_{\text{TLS}}/(2\pi) = 10$ GHz

Target dipole moment: $d_{\text{TLS}} = 1.6 \times 10^{-28}$ C·m (atomic dipole)

Generated field amplitude: $E_0 = 10^3$ V/m (achievable in engineered near-field systems)

Detuning: $\Delta/(2\pi) = 10$ GHz

### **Numerical Results for Engineered Implementation:**

Electromagnetic (AC Stark):

$$ \Omega_R = \frac{d_{\text{TLS}} E_0}{\hbar} = \frac{(1.6 \times 10^{-28})(10^3)}{1.055 \times 10^{-34}} \approx 1.52 \times 10^9 \text{ rad/s} \tag{L.26} $$

$$ \delta = \frac{\Omega_R^2}{4\Delta} = \frac{(1.52 \times 10^9)^2}{4(2\pi)(10^{10})} \approx 9.2 \times 10^6 \text{ rad/s} \tag{L.27} $$

$$ \frac{\delta}{\omega_{\text{TLS}}} \approx \frac{9.2 \times 10^6}{2\pi \times 10^{10}} \approx 1.5 \times 10^{-4} \tag{L.28} $$

Gravitational (time dilation):

$$ M_{\text{eff}} = \frac{P_{\text{agg}}\tau_c}{c^2} = \frac{(20)(0.1)}{9 \times 10^{16}} \approx 2.22 \times 10^{-17} \text{ kg} \tag{L.29} $$

$$ g(r) = \frac{G M_{\text{eff}}}{r^2} = \frac{(6.67 \times 10^{-11})(2.22 \times 10^{-17})}{(0.5)^2} \approx 5.92 \times 10^{-27} \text{ m/s}^2 \tag{L.30} $$

$$ \Delta\Phi = g(r)L_q = (5.92 \times 10^{-27})(10^{-9}) \approx 5.92 \times 10^{-36} \text{ m}^2/\text{s}^2 \tag{L.31} $$

$$ \Delta\tau_d = \frac{\Delta\Phi}{c^2}\tau_c = \frac{5.92 \times 10^{-36}}{9 \times 10^{16}}(0.1) \approx 6.6 \times 10^{-54} \text{ s} \tag{L.32} $$

$$ \frac{\Delta\phi_{\text{grav}}}{2\pi} = \frac{\omega_{\text{TLS}}}{2\pi}\Delta\tau_d = (10^{10})(6.6 \times 10^{-54}) \approx 6.6 \times 10^{-44} \tag{L.33} $$

### **Dominance Ratio for Engineered Implementation:**

$$ \mathcal{R} = \frac{1.5 \times 10^{-4}}{6.6 \times 10^{-44}} \approx 2.3 \times 10^{39} \tag{L.34} $$ 

Proof. Direct numerical substitution using SI constants: $G = 6.67 \times 10^{-11}$ m³ kg⁻¹ s⁻², $c = 3 \times 10^8$ m/s, $\hbar = 1.055 \times 10^{-34}$ J·s. ∎

**Sensitivity Analysis:** Table L.1 shows the robustness of this dominance ratio to parameter variations:

**Table L.1: Sensitivity of EM/Gravity Coupling Hierarchy**

| Parameter | Symbol | Baseline | Conservative Range | $\mathcal{R}$ Impact |
|-----------|--------|----------|-------------------|---------------------|
| Coupling ratio | $\alpha_{\text{em}}/\alpha_{\text{grav}}$ | $10^{42}$ | $10^{41}$–$10^{43}$ | $\times 0.1$ – $10$ |
| Charge fraction | $f_{\text{charge}}$ | $0.1$ | $0.01$–$0.5$ | $\times 0.1$ – $5$ |
| Geometric efficiency | $\eta_{\text{geo}}$ | $0.1$ | $0.01$–$1$ | $\times 0.1$ – $10$ |
| **Combined** | — | **$10^{36}$** | **$10^{33}$–$10^{39}$** | **$10^{-3}$ – $10^{3}$** |

Even with conservative parameter estimates accounting for all uncertainties, electromagnetic coupling dominates gravitational coupling by at least $\sim 10^{33}$ across the full parameter space, with typical values remaining near the baseline $\sim 10^{36}$. This robust hierarchy—spanning at least 33 orders of magnitude even under pessimistic assumptions—confirms electromagnetic dominance as the primary CC influence channel.

### **Theorem L.5 (Electromagnetic Dominance Universality)**

For any MPU aggregate with finite power budget $P_{\text{agg}} < \infty$ and finite volume $V_S > 0$, operating at sub-Planck scales $L_q \gg l_P = \sqrt{G\hbar/c^3} \approx 1.6 \times 10^{-35}$ m and accessible field strengths $E_0 < E_{\text{Schwinger}} = m_e^2c^3/(e\hbar) \approx 1.3 \times 10^{18}$ V/m, the electromagnetic channel dominates the gravitational channel by factor:

$$ \mathcal{R} \equiv \frac{\delta_{\text{EM}}}{\delta_{\text{grav}}} \gg 1 \quad \text{for all plausible MPU/aggregate parameters, typically } \mathcal{R}\sim 10^{30}\text{--}10^{40} \tag{L.35} $$

Proof. From Equations L.24 and L.25, the ratio is bounded below by substituting maximum plausible gravitational effect and minimum plausible electromagnetic effect. The universal dominance reflects the fundamental hierarchy $\alpha_{\text{em}}/\alpha_{\text{grav}} \sim 10^{43}$ (Theorem L.11) moderated by geometric factors. ∎


## **L.4.1 Biological Implementation Hypothesis: Sub-Radiant Coherence Optimization**

*This section presents a hypothetical biological implementation pathway distinct from the engineered coherent-charge mechanism (Sections L.4, L.11.4). While not rigorously derived from POP/PCE axioms, it demonstrates how biological constraints might select alternative realizations satisfying Theorem L.9's universal requirements.*

### **L.4.1.1 The Biological Constraint Optimization Problem**

**Definition L.4.1 (Biological Constraint Set $\mathcal{B}$)**
The biological constraint set for neural systems comprises:
- Thermal environment: $T = 310$ K, yielding $k_B T = 4.28 \times 10^{-21}$ J (27 meV)
- Metabolic power budget: $P_{\text{available}} \le \epsilon_{CC} P_{\text{brain}}$ where $\epsilon_{CC} \lesssim 0.01$ and $P_{\text{brain}} \approx 20$ W, giving $P_{CC} \lesssim 0.2$ W
- Aqueous dielectric environment: $\epsilon_r \approx 80$, Debye screening length $\lambda_D \approx 1$ nm
- Carbon-based chemistry: Covalent bond energies $\sim 1$–5 eV, hydrogen bonds $\sim 0.1$–0.3 eV
- Distributed architecture: No centralized control, $N \sim 10^{11}$ neurons with $\sim 10^{15}$ synapses

**Proposition L.4.2 (Sub-Radiant Optimization Under Biological Constraints)**
Under constraint set $\mathcal{B}$, PCE optimization (Definition 15) selects configurations minimizing radiative power loss while maximizing internal coherence:
$$\mathcal{F}_{\text{bio}}[\{\phi_j\}] = \alpha_1 C_{\text{internal}} - \alpha_2 P_{\text{rad}} - \alpha_3 P_{\text{metabolic}}$$

For $N$ oscillators with dipole moments $d_j$ and phases $\phi_j$, the radiated power is:
$$P_{\text{rad}} = \frac{\omega^4}{12\pi\varepsilon_0 c^3}\left|\sum_{j=1}^N d_j e^{i\phi_j}\right|^2$$

The PCE-optimal configuration achieves **sub-radiant destructive interference**:
$$\sum_{j=1}^N d_j e^{i\phi_j} \approx 0 \quad \text{(near-perfect cancellation in far-field)}$$

while maintaining internal coherence $|\langle e^{i(\phi_i - \phi_j)}\rangle| \approx 1$ for nearest neighbors.

### **L.4.1.2 Physical Implementation Substrates**

**Theorem L.4.3 (Coherence Time Extension via Environmental Isolation)**
For a quantum system with bare decoherence rate $\Gamma_0(T)$ at temperature $T$, environmental shielding by an energy barrier $\Delta E_{\text{shield}}$ reduces the effective decoherence rate to:
$$\Gamma_{\text{eff}} = \Gamma_0 \exp\left(-\frac{\Delta E_{\text{shield}}}{k_B T}\right) + \Gamma_{\text{intrinsic}}$$
where $\Gamma_{\text{intrinsic}}$ represents temperature-independent mechanisms.

**Application to Candidate Substrates (illustrative):**

**(A) Microtubule Networks (Penrose-Hameroff Substrate)**
Following the Orchestrated Objective Reduction framework (Penrose, 1989, 1996; Hameroff & Penrose, 2014):
- Structure: Cylindrical lattices, 25 nm diameter, 13 protofilaments
- Bare decoherence: $\Gamma_0 \sim k_B T/h \approx 6.5 \times 10^{12}$ s⁻¹ 
- Exclusion zone water shielding: $\Delta E_{\text{shield}} \approx 0.2$ eV
- Protected rate: $\Gamma_{\text{eff}} \sim 10^{9}$–$10^{10}$ s⁻¹ 
- Coherence time: $\tau_{\text{coh}} \sim 10$–100 ps (potentially extended to ns via Fröhlich condensation)

The Penrose gravitational OR threshold $E \cdot \tau \approx \hbar$ with $E \sim 10^{-30}$ J yields $\tau \sim \hbar/E \approx 10^{-4}$ s, consistent with 40 Hz gamma rhythms (Hameroff, 2012).

**(B) Radical Pair Mechanisms**
Cryptochrome proteins containing entangled radical pairs (as in avian magnetoreception):
- Singlet-triplet interconversion sensitive to fields $B \sim 50$ μT
- Critical susceptibility: $\chi(T) \propto |T - T_c|^{-\gamma}$ where $\gamma \approx 1.24$ (3D Ising class)
- Coherence times: $\tau_{\text{radical}} \sim 100$ μs at 310 K (Hore & Mouritsen, 2016)

**(C) Membrane Voltage Domains**
- Field strength: $E_{\text{membrane}} \sim 10^7$ V/m across 7 nm bilayer
- Sub-threshold oscillations: 30–100 Hz (theta/gamma bands)
- Gap junction coupling extends coherence domains to mm scale (Levin, 2021)

### **L.4.1.3 Near-Field Influence Mechanism**

**Proposition L.4.4 (Near-Field Enhancement in Sub-Radiant Cavities)**
A sub-radiant ensemble with trapped power $P_{\text{trap}}$ in volume $V_{\text{cav}}$ generates enhanced near-fields:
$$E_{\text{near}}(r) = \sqrt{\frac{Q \cdot P_{\text{trap}}}{\varepsilon_0 c V_{\text{cav}}}} \cdot \mathcal{G}(r/\lambda)$$

where $Q$ is the cavity quality factor and $\mathcal{G}(x) \approx (2\pi x)^{-3}$ for $x \ll 1$ (reactive near-field), with practical enhancement limited to $\mathcal{G}(x)\lesssim 10^3$–$10^4$ by loss and finite mode volume. 

**Numerical Analysis:**

* Trapped power: $P_{\text{trap}} = 2.0 \times 10^{-14}$ W (per coherence domain, distributed)
* Cavity volume: $V_{\text{cav}} = (10^{-6})^3$ m³ (micron-scale coherence domain)
* Quality factor: $Q = 100$ (conservative for biological cavity)
* Operating frequency: $f = 10$ GHz → $\lambda = 3$ cm
* At $r = 100$ nm from cavity center, taking conservative $\mathcal{G}(r/\lambda)\approx 1$:
  $$E_{\text{near}} \approx 2.8 \times 10^4 \text{ V/m}$$ 

This exceeds the threshold for voltage-gated ion channel modulation ($E_{\text{threshold}} \sim 10$ V/m), enabling somatic control through conformational biasing via the AC Stark mechanism (Corollary L.2.1).

### **L.4.1.4 Multi-Scale Hierarchical Organization**

**Connection to Levin's Bioelectric Cognition**

Dr. Michael Levin's empirical work demonstrates scale-free cognitive properties in biological systems (Levin, 2019, 2021; Fields & Levin, 2020):

**Definition L.4.2 (Hierarchical Complexity Scaling)**
For gap-junction coupled biological networks with coupling strength $g$:
$$C_{\text{agg}}(N, g) = C_0 \cdot N^{\alpha(g)}$$
where $\alpha(g) = 1 + \beta \tanh(g/g_c)$, $g_c$ is the percolation threshold, and $\beta \le 1$ reflects network efficiency.

**Theorem L.4.5 (Cognitive Light Cone Correspondence)**
The "cognitive light cone" radius observed by Levin corresponds to the coherence length of the sub-radiant state:
$$R_{\text{cognitive}} = \sqrt{\frac{D_{\text{eff}}(g) \cdot \tau_c}{\pi}}$$
where $D_{\text{eff}}(g) = D_0(1 + g/g_0)$ is the effective diffusion coefficient enhanced by gap junctions.

**Planarian Regeneration Example:**
Following bisection (Levin & Martyniuk, 2018):
- Phase 1 ($t = 0$): Gap junctions severed, $g → 0$, $C_{\text{agg}}$ drops below $C_{op}$
- Phase 2 ($0 < t < 24$ h): Wound currents establish, $\tau_c \sim$ minutes
- Phase 3 ($24 < t < 72$ h): Bioelectric pattern stabilizes, $R_{\text{cognitive}} \sim 1$ mm
- Phase 4 ($t > 72$ h): Morphogenetic completion via biased cell fate decisions

**Testable Prediction:** Metabolic heat production $\Delta Q \propto C_{\text{agg}}(g)$ during regeneration, measurable via microcalorimetry with sub-nanosecond temporal resolution for coherence dynamics.

### **L.4.1.5 Relationship to Orchestrated Objective Reduction**

The Penrose-Hameroff Orch OR theory provides crucial substrate characterization (Penrose & Hameroff, 2011; Hameroff & Penrose, 2014), though differing in ontological interpretation:

| **Aspect** | **Orch OR** | **PU Framework** |
|------------|-------------|------------------|
| **Consciousness Origin** | Emerges from OR events | Fundamental (awareness primary) |
| **Quantum Mechanics** | Fundamental with OR modification | Emerges from MPU dynamics |
| **Gravity's Role** | Triggers consciousness via OR | Limits CC via energy feedback |
| **Timescale** | $E \cdot t = \hbar$ (OR threshold) | $\tau_{\text{min}} = \hbar/\langle H_{\text{eff}}\rangle$ |
| **Anesthetic Action** | Disrupts tubulin quantum states | Reduces $C_{\text{agg}}$ below $C_{op}$ |

Both frameworks predict:
- Quantum coherence in microtubules at 310 K
- 25-40 ms conscious moments (40 Hz gamma)
- Anesthetic sensitivity (Craddock et al., 2017)

PU additionally predicts:
- Measurable metabolic signature (Theorem L.6)
- Causality bound $\text{CC} < 0.5$ (Theorem 39)
- Gravitational self-limitation (Appendix S)

### **L.4.1.6 Critical Amplification for Non-Local Influence**

**Proposition L.4.6 (Amplification via Target Criticality)**
For a target system at criticality with susceptibility $\chi \propto |p - p_c|^{-\gamma}$, the observable bias from gravitational phase modulation (Appendix S) is:
$$|\Delta P_{\text{obs}}| = \mathcal{A}_{\text{crit}} \cdot |\Delta P_{\text{grav}}|$$

where the amplification factor:
$$\mathcal{A}_{\text{crit}} = \chi \cdot \left(\frac{\tau_{\text{meas}}}{\tau_{\text{decohere}}}\right) \cdot N_{\text{coop}}$$

- $\chi$: Critical susceptibility (diverges at $p_c$)
- $\tau_{\text{meas}}/\tau_{\text{decohere}}$: Measurement advantage ratio
- $N_{\text{coop}}$: Cooperatively correlated elements

**Required Amplification:**
- Gravitational phase shift: $\Delta\phi_{\text{grav}} \sim 10^{-40}$ rad (from Appendix S)
- Observable bias: $|\Delta P| \sim 10^{-3}$
- Required: $\mathcal{A}_{\text{crit}} \sim 10^{37}$

This extraordinary amplification requires:
1. Fine-tuned criticality ($\chi \sim 10^{10}$)
2. Quantum Zeno stabilization ($\tau_{\text{meas}}/\tau_{\text{decohere}} \sim 10^3$)
3. Macroscopic cooperation ($N_{\text{coop}} \sim 10^{24}$)

### **L.4.1.7 Relationship to Controversial Experimental Claims**

*The following section addresses reported anomalous phenomena requiring independent replication. Their inclusion demonstrates how the framework would accommodate such effects if validated, not endorsement of their current evidential status.*

**Random Number Generator Studies**
Meta-analyses report small deviations correlated with operator intention (Radin & Nelson, 1989; Cardeña, 2018; Bösch et al., 2006; Nelson et al., 2002):
- Reported effect size: $|\Delta P| \sim 10^{-4}$ to $10^{-3}$
- Required conditions per PU: Target must be at criticality (tunneling barrier fine-tuned)
- Mechanism: Proposition L.4.6 with $\mathcal{A}_{\text{crit}} \sim 10^{37}$

**Double-Slit Interference Studies**
Claims of consciousness-correlated pattern changes (Radin et al., 2013):
- Reported visibility change: $\sim 0.1$%
- PU interpretation: Would require photon-radical pair coupling at criticality

**Critical Assessment:**
These effects, if real, require:
1. Extraordinary target criticality (beyond typical quantum systems)
2. Precise tuning of experimental parameters
3. Isolation from conventional electromagnetic interference

In the PU account, Radin-style deviations become observable only when the target is tuned to **physical criticality**, i.e., $p \approx p_c$, so that its susceptibility $\chi$ is large and the critical amplification factor $\mathcal{A}_{\text{crit}}=\chi(\tau_{\text{meas}}/\tau_{\text{decohere}})N_{\text{coop}}$ can lift the microscopic baseline bias $|\Delta P_{\text{grav}}|$ into the reported macroscopic range $|\Delta P_{\text{obs}}|\sim 10^{-4}$–$10^{-3}$ (Radin & Nelson, 1989; **Cardeña, 2018**; Bösch et al., 2006; Nelson et al., 2002). This requirement matches the framework’s own reading of RNG and double-slit claims: if such effects are real, they must arise in targets near an instability (e.g., fine-tuned tunneling barriers or interference systems with effectively critical photon-matter coupling), because stable targets would keep $\chi\sim O(1)$ and yield null results (Radin et al., 2013).

On the observer side, Radin’s reports that experienced meditators tend to show larger or more reliable deviations than non-meditators are naturally mapped to the sub-radiant optimization described here: meditation is expected to increase the coherence time $\tau_c$ and reduce radiative loss, strengthening the context signal that serves as the seed for amplification. Empirically, Radin’s double-slit series separates meditators from non-meditators and attributes the stronger deviations to the meditator subgroup, and his RNG work includes group-meditation contexts as the operational regime where anomalies are most often sought (Radin et al., 2013; Radin & Nelson, 1989; Cardeña, 2018). Thus, the framework aligns with both the **why** (only near-critical targets can supply $\chi\gg 1$) and the **who/when** (higher-$\tau_c$ observers, such as trained meditators, maximize the seed bias), without treating the reported effects as generic or guaranteed outside this dual-critical operating window.

*Note: This analysis is provided for completeness in mapping the framework's predictions to reported anomalies; the framework does not depend on or endorse these empirical claims, which remain controversial and require independent replication.*

## **L.5 Unified Energy Accounting**

### **Theorem L.6 (Energy Conservation and Non-Double-Counting)**

The total power required to maintain context state $\text{context}_S$ (Definition L.1) for aggregate $S$ decomposes as:

$$ P_{\text{agg}} = P_{\text{EM}} + P_{\text{other}} \tag{L.36} $$

where $P_{\text{EM}}$ is radiated electromagnetic power and $P_{\text{other}}$ includes heat dissipation, internal energy changes, and mechanical work. The complete stress-energy tensor is:

$$ T_{\mu\nu}^{(\text{MPU})} = T_{\mu\nu}^{(\text{matter})} + T_{\mu\nu}^{(\text{EM})} \tag{L.37} $$

as constructed in Appendix B (Definition B.8). Each energy component contributes exactly once to $T_{\mu\nu}^{(\text{MPU})}$, which sources the gravitational field through Einstein's equations (Theorem 50). There is no double-counting. Furthermore, the stress-energy tensor satisfies covariant conservation (Appendix B, Theorem B.5):

$$ \nabla^\mu T_{\mu\nu}^{(\text{MPU})} = 0 \tag{L.38} $$

Proof.

Energy conservation requires accounting for all power channels:

$$ P_{\text{agg}} = P_{\text{EM}} + P_{\text{heat}} + P_{\text{internal}} + P_{\text{mech}} \tag{L.39} $$

These channels are mutually exclusive (each joule enters exactly one channel) and exhaustive (all energy accounted for).

Energy Flow Analysis: The electromagnetic field energy originates from kinetic energy of oscillating charges. The complete energy flow is:

$$ E_{\text{operational}} \to E_{\text{kinetic,oscillators}} \to E_{\text{EM,field}} + E_{\text{heat}} \tag{L.40} $$

At any instant, the aggregate's kinetic energy is being converted to field energy (radiation) and heat (dissipation). The electromagnetic power flux through surface $\mathcal{S}$ enclosing the aggregate is:

$$ P_{\text{EM}} = \int_{\mathcal{S}} \vec{S} \cdot d\vec{A} = \int_{\mathcal{S}} \frac{1}{\mu_0}(\vec{E}{\text{rad}} \times \vec{B}{\text{rad}}) \cdot d\vec{A} \tag{L.41} $$

where the Poynting vector $\vec{S}$ describes energy flow.

Stress-Energy Accounting: Following the construction detailed in Appendix B (Definition B.8), the electromagnetic contribution is (from Theorem L.2):

$$ T_{\mu\nu}^{(\text{EM})} = \frac{1}{4\pi}\left(F_{\mu\alpha}F_{\nu}{}^{\alpha} - \frac{1}{4}g_{\mu\nu}F_{\alpha\beta}F^{\alpha\beta}\right) \tag{L.42} $$

This represents field energy and momentum density. The matter contribution uses perfect fluid approximation in the aggregate's rest frame:

$$ T_{\mu\nu}^{(\text{matter})} = (\rho_m c^2 + p)u_\mu u_\nu + p g_{\mu\nu} \tag{L.43} $$

where $\rho_m$ is rest mass density plus internal energy density (including kinetic energy of oscillators before radiation and thermal energy from dissipation).

Temporal Evolution: As oscillators radiate, kinetic energy transfers from $T_{\mu\nu}^{(\text{matter})}$ to $T_{\mu\nu}^{(\text{EM})}$. The total stress-energy at time $t$ is:

$$ T_{\mu\nu}^{(\text{MPU})}(t) = T_{\mu\nu}^{(\text{matter})}(t) + T_{\mu\nu}^{(\text{EM})}(t) \tag{L.44} $$

From Appendix B (Theorem B.5), the MPU stress-energy tensor satisfies covariant conservation:

$$ \nabla^\mu T_{\mu\nu}^{(\text{MPU})} = 0 \tag{L.45} $$

This ensures local energy-momentum conservation in the emergent curved spacetime.

Gravitational Sourcing: From Theorem 50, Einstein's field equations are:

$$ R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu} + \Lambda g_{\mu\nu} = \frac{8\pi G}{c^4}T_{\mu\nu}^{(\text{MPU})} \tag{L.46} $$

The gravitational field (encoded in curvature $R_{\mu\nu}$ and metric $g_{\mu\nu}$) responds to the complete $T_{\mu\nu}^{(\text{MPU})}$.

No Double-Counting: Each watt of power in $P_{\text{agg}}$ appears exactly once in the stress-energy accounting:

Path 1 (Radiated): Power → oscillator kinetic energy → EM field energy → enters via $T_{\mu\nu}^{(\text{EM})}$

Path 2 (Retained): Power → internal energy/heat → enters via $T_{\mu\nu}^{(\text{matter})}$

At steady state, power input $P_{\text{agg}}$ balances radiated power $P_{\text{EM}}$ plus thermal dissipation $P_{\text{heat}}$. The gravitational potential $\Phi_{\text{grav}}$ computed from solving Equation L.46 with the complete $T_{\mu\nu}^{(\text{MPU})}$ accounts for both electromagnetic field energy (via $T_{00}^{(\text{EM})}$) and matter energy (via $T_{00}^{(\text{matter})}$) exactly once. ∎

## **L.6 Connection to Thermodynamic Gravity Derivation**

### **Theorem L.7 (CC-Gravity Coupling Through Horizon Thermodynamics)**

Both electromagnetic and gravitational channels arise from modifications to information flux through causal horizons. Aggregate energy modifies energy flux $\delta Q$ through local horizons. Preservation of the Clausius relation $\delta Q = T\delta S$ with Area Law entropy $S = \Sigma_I \mathcal{A}$ (Theorem 49) requires geometric response through Einstein equations (Theorem 50), following the same derivational logic as the primary gravity derivation (Section 12, Theorem 50).

Proof.

From Appendix E (Theorem 49), the entropy of a causal horizon with area $\mathcal{A}$ is:

$$ S = \frac{k_B c^3}{4G\hbar}\mathcal{A} = \Sigma_I \mathcal{A} \tag{L.47} $$

where the information density is:

$$ \Sigma_I = \sigma_{\text{link}} C_{\text{max}} = \frac{\chi}{\eta\delta^2} C_{\text{max}} \tag{L.48} $$

with channel surface density $\sigma_{\text{link}} = \chi/(\eta\delta^2)$ (Theorem E.3), MPU spacing $\delta$, geometric factor $\eta$, correlation factor $\chi$, and Non-Deterministic Reflexive Interaction Dynamics (ND-RID, Definition 6) channel capacity $C_{\text{max}}$ limited by irreversibility $\varepsilon \ge \ln 2$ (Theorem 31).

For local causal horizon with null generator $k^\mu$ (affinely parameterized with $\lambda$) and surface gravity $\kappa$, the energy flux through a surface element is:

$$ \delta Q = \int T_{\mu\nu}^{(\text{MPU})}\chi^\mu d\Sigma^\nu \tag{L.49} $$

where $\chi^\mu = (1 + \kappa\lambda)k^\mu$ is the approximate boost Killing field near the bifurcation surface. The aggregate contribution from both electromagnetic and matter components (Appendix B, Definition B.8) is:

$$ \delta Q_{\text{agg}} = \int (T_{\mu\nu}^{(\text{EM})} + \Delta T_{\mu\nu}^{(\text{matter})})\chi^\mu d\Sigma^\nu \tag{L.50} $$

From quantum field theory in curved spacetime, the Unruh temperature associated with surface gravity $\kappa$ is:

$$ T = \frac{\hbar\kappa}{2\pi k_B c} \tag{L.51} $$

Local thermodynamic consistency (Postulate 4) requires the Clausius relation:

$$ \delta Q = T \delta S \tag{L.52} $$

Substituting Equations L.47 and L.51:

$$ \delta Q = \frac{\hbar\kappa}{2\pi k_B c} \Sigma_I \delta\mathcal{A} \tag{L.53} $$

From the Raychaudhuri equation for geodesic congruence with null tangent $k^\mu$, expansion $\theta$, shear $\sigma$, and twist $\omega$:

$$ \frac{d\theta}{d\lambda} = -R_{\mu\nu}k^\mu k^\nu - \sigma_{ab}\sigma^{ab} + \omega_{ab}\omega^{ab} \tag{L.54} $$

For initial conditions $\theta(0) = \sigma(0) = \omega(0) = 0$ (vanishing initial expansion, shear, and twist), to first order in $\lambda$:

$$ \theta(\lambda) = -R_{\mu\nu}k^\mu k^\nu \lambda \tag{L.55} $$

The area change is related to expansion by $\delta\mathcal{A}/\mathcal{A} = \theta\lambda$, giving:

$$ \delta\mathcal{A} = -\mathcal{A}R_{\mu\nu}k^\mu k^\nu \lambda^2 \tag{L.56} $$

Combining Equations L.49, L.53, and L.56 through the Clausius relation, with $\delta Q \approx T_{\mu\nu}^{(\text{MPU})}k^\mu k^\nu \mathcal{A}\lambda$ for small $\lambda$ (from Section 12, detailed derivation in Theorem 12.1), yields the constraint:

$$ T_{\mu\nu}^{(\text{MPU})} k^\mu k^\nu = \frac{\kappa\Sigma_I}{2\pi k_B c^2}R_{\rho\sigma}k^\rho k^\sigma \tag{L.57} $$

Using the relation $\Sigma_I = c^3/(4G\hbar)$ from Equation E.9 and integrating over all null directions, this yields Einstein's field equations:

$$ R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu} + \Lambda g_{\mu\nu} = \frac{8\pi G}{c^4}T_{\mu\nu}^{(\text{MPU})} \tag{L.58} $$

The aggregate contribution enters through $T_{\mu\nu}^{(\text{MPU})}$ (Equation L.37, Definition B.8), sourcing curvature and inducing the time dilation $\Delta\tau_d$ derived in Theorem L.3. ∎

### **Remark L.7.1 (Consistency Check vs. Independent Derivation)**

Theorem L.7 is a consistency check demonstrating that both electromagnetic and gravitational CC contributions maintain the same thermodynamic foundation (Clausius relation $\delta Q = T\delta S$ on causal horizons) used to derive Einstein's equations in Section 12 (Theorem 50). This is not circular reasoning; rather, it validates that:

(i) The EM contribution (Thm L.2) properly enters $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8)

(ii) The matter contribution (Thm L.3) properly enters $T_{\mu\nu}^{(\text{MPU})}$

(iii) Together they source Einstein equations without contradiction

(iv) Energy conservation (Thm L.6) is maintained

The independent derivation of EFE from horizon thermodynamics occurs in Section 12 (Theorem 50) using the Area Law (Theorem 49) derived from ND-RID limits (Appendix E). Theorem L.7 shows that CC energy contributions fit within this already-established structure without requiring modification. This internal consistency is a non-trivial requirement; failure would indicate either:

    CC violates the thermodynamic derivation of gravity (framework inconsistency)

    CC requires modification to EFE (new physics)

The fact that standard EFE with standard $T_{\mu\nu}^{(\text{MPU})}$ accommodates CC influence is evidence of framework coherence, not circular argumentation.

## **L.7 Unification Through Temporal Wave Framework**

The electromagnetic and gravitational manifestations analyzed in Theorems L.2 and L.3 are unified through the temporal wave framework (Appendix O, Definition O.1, Theorem O.4). They represent different frequency components of a single underlying process: controlled modulation of the coherent causal medium's information processing rate.

### **Theorem L.8 (Temporal Wave Frequency Decomposition)**

A controlled modulation of MPU cycle rate $\delta\tau(x,t)$ generated by aggregate context $\text{context}_S$ (Definition L.1) admits frequency decomposition:

$$ \delta\tau(x,t) = \int_{-\infty}^{\infty} d\omega , \tilde{\delta\tau}(x,\omega) e^{-i\omega t} \tag{L.59} $$

Different frequency regimes manifest through distinct emergent channels in the continuum limit:

(a) High-Frequency Regime ($\omega \gtrsim \omega_{\text{TLS}}$): Rapid oscillations in $\tau(x,t)$ create oscillating phase mismatches between neighboring MPUs. From Appendix C (Theorem C.2), predictive coherence requires minimal phase variation, with cost function penalizing deviations. In the continuum limit (Appendix F), PCE optimization introduces compensating gauge fields $A_\mu$ to maintain coherence (Appendix G, minimal coupling principle). For oscillating phase patterns $\delta\phi \propto \cos(\omega t)$, the gauge field oscillates correspondingly, emerging as electromagnetic radiation $E_{\text{rad}}(t)$ (Theorem L.2).

(b) Low-Frequency Regime ($\omega \lesssim \omega_{\text{TLS}}$): Slow modulations in $\tau(x,t)$ appear quasi-static on timescales $\sim 1/\omega_{\text{TLS}}$. The power required to sustain altered processing rates contributes to energy density $u_{\text{agg}} = P_{\text{agg}}\tau_c/V_S$. This energy density enters the stress-energy tensor $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8), sourcing gravitational curvature through Einstein equations (Theorem 50). The geometric response manifests as time dilation $\Delta\tau_d$ (Theorem L.3).

Proof.

(a) High-Frequency Regime ($\omega \gg 1/\tau_{\text{medium}}$) → Electromagnetic Radiation

### **Step 1: Phase Mismatch Generation**

Consider temporal modulation $\delta\tau(x,t) = \delta\tau_0 \cos(\omega t)$ with $\omega \gg 1/\tau_{\text{medium}}$ where $\tau_{\text{medium}}$ is the baseline MPU cycle time (Equation L.0). Taking the continuum limit (Appendix F, Theorem F.0) with emergent light speed $c = \delta/\tau_{\text{medium}}$ already established from geometric regularity (Theorem 43) and Lorentzian signature (Theorem 46), we analyze the phase evolution.

Between neighboring MPUs at positions $x_i$ and $x_j$ separated by effective spacing $\delta$, the phase accumulated over one cycle is:

$$ \phi_i(t) = \int_0^\tau \frac{dt'}{\tau(x_i,t')} \approx \frac{t}{\tau_{\text{medium}}} - \frac{\omega\delta\tau_0}{\tau_{\text{medium}}} \sin(\omega t) $$

The phase mismatch is:

$$ \Delta\phi_{ij}(t) = \phi_i(t) - \phi_j(t) = -\nabla\phi \cdot (x_i - x_j) \tag{L.60a} $$

For modulation $\delta\tau(x,t) = \delta\tau_0 \cos(\omega t)$ with gradient $|\nabla\delta\tau| \sim \delta\tau_0/\lambda$ where $\lambda \sim c/\omega$ is the modulation wavelength, we have:

$$ \nabla\phi \sim \frac{1}{\tau_{\text{medium}}}\nabla\delta\tau \sim \frac{\omega}{c}\delta\tau_0 \hat{n} \tag{L.60b} $$

Therefore:

$$ \Delta\phi_{ij}(t) \approx \frac{\omega}{c}\delta\tau_0 \hat{n} \cdot (x_i - x_j) \cos(\omega t) \tag{L.60c} $$

where $\hat{n}$ is the direction of phase gradient propagation and we used $c \sim \delta/\tau_{\text{medium}}$ (emergent light speed).

### **Step 2: Coherence Cost**

From Appendix C (Theorem C.2), predictive coherence requires minimal phase variation. The cost contribution to $V_{\text{prop}}$ (Definition D.1) from phase mismatch is:

$$ V_{\text{prop}}^{(\text{phase})} = \sum_{\langle ij\rangle} \kappa_{\text{phase}} |\Delta\phi_{ij}|^2 \propto \omega^2 \delta\tau_0^2 \cos^2(\omega t) \tag{L.61} $$

where $\kappa_{\text{phase}}$ emerges from PCE optimization and $\sum_{\langle ij\rangle}$ denotes summation over network links.

### **Step 3: Gauge Field Compensation**

To minimize $V_{\text{prop}}^{(\text{phase})}$, the system introduces compensating phase through gauge field $A_\mu$. From the minimal coupling prescription (Appendix G, Section G.4), the phase compensation requires gauge field transformation:

$$ A_\mu \to A_\mu - \frac{1}{g_{\text{em}}}\partial_\mu\phi \tag{L.62} $$

where $g_{\text{em}}$ is the emergent electromagnetic coupling (Appendix Z). For phase gradient $\nabla\phi \propto \omega \cos(\omega t)$, the scalar potential becomes:

$$ A_0(x,t) \propto \frac{1}{g_{\text{em}}}\omega \sin(\omega t) $$

The electric field is:

$$ \vec{E} = -\nabla A_0 - \frac{\partial \vec{A}}{\partial t} \propto \omega^2 \cos(\omega t) \tag{L.63} $$

### **Step 4: Identification with EM Radiation**

This oscillating electric field, coupled with corresponding magnetic field from $\nabla \times \vec{E} = -\partial \vec{B}/\partial t$, satisfies Maxwell's equations in the continuum limit (Appendix G, Equations G.5.1-G.5.4). The field energy density:

$$ u_{\text{EM}} = \frac{\varepsilon_0}{2}|\vec{E}|^2 + \frac{1}{2\mu_0}|\vec{B}|^2 \propto \omega^4 \delta\tau_0^2 \tag{L.64} $$

corresponds to the electromagnetic stress-energy tensor $T_{\mu\nu}^{(\text{EM})}$ (Equation L.4). The $\omega^4$ scaling matches standard radiation theory (Larmor formula).

(b) Low-Frequency Regime ($\omega \ll 1/\tau_{\text{medium}}$) → Gravitational Time Dilation

### **Step 1: Quasi-Static Approximation**

For $\omega \ll 1/\tau_{\text{medium}}$, the modulation $\delta\tau(x,t)$ appears static over many MPU cycles. The local effective Hamiltonian becomes:

$$ \langle H_{\text{eff}}\rangle(x,t) = \langle H_{\text{eff}}\rangle_0\left[1 + \eta_H \frac{\delta\tau(x,t)}{\tau_{\text{medium}}}\right] \tag{L.65} $$

where $\eta_H$ is a dimensionless coupling determined by the operational energy-time relationship $\tau_{\text{medium}} = \hbar/\langle H_{\text{eff}}\rangle$.

### **Step 2: Energy Density Contribution**

Sustaining this altered processing rate over correlation time $\tau_c$ requires average power $\langle\delta P\rangle$. The corresponding energy density contribution is:

$$ \langle\delta u\rangle = \frac{\langle\delta P\rangle \tau_c}{V_S} = \frac{P_{\text{agg}}\tau_c}{V_S} \tag{L.66} $$

where $P_{\text{agg}}$ represents the sustained power maintaining the modified state.

### **Step 3: Stress-Energy Sourcing**

This energy density contributes to $T_{00}^{(\text{matter})}$ in the matter stress-energy tensor (Equation L.43):

$$ T_{00}^{(\text{matter})} = \rho_m c^2 + \delta u = \rho_m c^2 + \frac{P_{\text{agg}}\tau_c}{V_S} \tag{L.67} $$

### **Step 4: Geometric Response**

From Theorem L.7, preservation of the Clausius relation $\delta Q = T\delta S$ on causal horizons requires geometric adjustment via Einstein equations:

$$ R_{\mu\nu} - \frac{1}{2}Rg_{\mu\nu} = \frac{8\pi G}{c^4}T_{\mu\nu}^{(\text{MPU})} \tag{L.68} $$

In the weak-field limit with static source, the time-time component yields the Newtonian potential equation:

$$ \nabla^2\Phi = 4\pi G \rho_{\text{eff}} = 4\pi G(1+3w)\frac{u}{c^2} \tag{L.69} $$

For the energy density $\delta u$, this gives:

$$ \nabla^2\delta\Phi = 4\pi G(1+3w)\frac{P_{\text{agg}}\tau_c}{c^2 V_S} \tag{L.70} $$

### **Step 5: Time Dilation**

The potential gradient across target extent $L_q$ at distance $r$ yields (for spherically symmetric source):

$$ \Delta\Phi = \frac{4\pi G}{3}(1+3w)\frac{P_{\text{agg}}\tau_c}{V_S} r L_q \tag{L.71} $$

The proper time accumulation over interval $\tau_c$ is:

$$ \Delta\tau_d = \frac{\Delta\Phi}{c^2}\tau_c \tag{L.72} $$

This is the gravitational time dilation of Theorem L.3.

Unification: Parts (a) and (b) demonstrate that $\delta\tau(x,t)$ modulation manifests through distinct channels determined by frequency:

High-$\omega$: Local phase coherence → compensating gauge fields → EM radiation

Low-$\omega$: Energy density → stress-energy sourcing → geometric response

Both emerge from the same underlying process (temporal medium modulation) through different PCE optimization pathways in different frequency regimes. The transition occurs near $\omega \sim \omega_{\text{TLS}}$ where the timescale of modulation matches the characteristic response time of the quantum system. ∎

### **Corollary L.8.1 (Coupling Hierarchy from Frequency-Dependent Efficiency)**

The electromagnetic-to-gravitational ratio $\mathcal{R} \sim 6 \times 10^{36}$ (Theorem L.5) reflects frequency-dependent coupling efficiency:

High-frequency temporal waves couple to microscopic charge distributions through gauge field phase coherence. Coupling strength is set by $\alpha_{\text{em}}(\text{bulk}) \approx 1/138.843$ before interface correction, emerging from the PCE-Attractor state (Definition 15a, Appendix Z) where the flat QFI spectrum ($M=24$, $\lambda=1$) yields bare coupling $u^* = 8^{1/24}-1$ via capacity saturation (Appendix Z, Theorem Z.7). The Thomson-limit value including interface correction is $\alpha^{-1} \approx 137.036$ (Appendix Z, Theorem Z.26).

Low-frequency temporal waves couple to macroscopic energy density through horizon boundary information capacity. Coupling strength is set by $G$ from $\Sigma_I = c^3/(4G\hbar)$ (Appendix E, Equation E.9), determined by ND-RID channel limits.

The hierarchy arises because electromagnetic coupling involves local phase relationships (high information bandwidth), while gravitational coupling involves global boundary entropy (low information bandwidth).

## **L.8 Experimental Protocols and Testable Predictions**

### **Protocol L.1 (Electromagnetic Channel Detection)**

This protocol tests the coherent-charge carrier implementation analyzed in Proposition L.4. Testing alternative carrier implementations may require different target systems and measurement strategies, pending specification of their mechanisms through POP/PCE derivation.

Apparatus Configuration:

Primary Target: Trapped ion with controllable transition frequency $\omega_{\text{TLS}}/(2\pi) = 1$–10 GHz

Alternative Targets: NV center ($\omega_{\text{TLS}}/(2\pi) \approx 2.87$ GHz), superconducting qubit (tunable $\omega_{\text{TLS}}$)

Isolation: Cryogenic shielding, double-layer mu-metal magnetic shielding, grounded Faraday cage

Field Calibration: Known classical field $E_{\text{cal}}$ to calibrate AC Stark response

Decoherence Monitoring: Continuous measurement of coherence times $T_1$, $T_2$ to track environmental perturbations

### **Measurement Sequence:**

Baseline Characterization: Measure probability distribution $P_{\text{Born}}(i)$ for target observable without aggregate influence over $N_{\text{cal}} \gtrsim 10^6$ trials. Establish baseline decoherence rates $\gamma_0$.

Aggregate Application: Apply high-complexity MPU aggregate $S$ (controlled laboratory system with well-characterized $C_{\text{agg}} \ge C_{op}$ implementing engineered coherent-charge carrier) at controlled distance $r$.

Statistical Measurement: Measure probability distribution $P_{\text{obs}}(i)$ over $N_{\text{trials}}$ repetitions.

Deviation Analysis: Compute $\Delta P(i) = P_{\text{obs}}(i) - P_{\text{Born}}(i)$.

Significance Test: Apply χ² test for deviation significance.

### **Statistical Requirements:**

For effect size $\delta/\omega \sim 10^{-4}$ to $10^{-6}$ and 5σ detection:

$$ N_{\text{trials}} \gtrsim 25\left(\frac{\omega}{\delta}\right)^2 \sim 2.5 \times 10^9 \text{ to } 2.5 \times 10^{13} \tag{L.73} $$

Experimental Timeline: For optimistic scenario ($\delta/\omega \sim 10^{-4}$, 1000 ions, 1 kHz): approximately 30 days. For conservative scenario ($\delta/\omega \sim 10^{-6}$, 100 ions, 100 Hz): approximately 8 years. The worked example (L.11.4) achieves $\delta/\omega \sim 4 \times 10^{-3}$ requiring $N_{\text{trials}} \sim 2 \times 10^5$, accessible in approximately 10 seconds with 1000 ions at 1 kHz. Engineering optimization (plasmonic enhancement, cavity coupling, reduced detuning) can push effect size higher, reducing required integration times to practical timescales (hours-days) while maintaining perturbative regime validity.

### **Practical Mitigation Strategies:**

Parallel Measurements: Deploy $N_{\text{parallel}}$ independent ion traps operating simultaneously

Enhanced Coupling: Utilize near-resonant detuning or cavity enhancement to increase $\delta/\omega$

Improved Field Generation: Engineered structures (plasmonic antennas, metamaterial enhancement)

Target Optimization: Select target systems with larger dipole moments or lower transition frequencies

### **Control Protocols:**

Temporal Randomization: Aggregate conditions randomly interleaved (blind to measurement system)

Distance Variation: Vary $r$ to test $\delta(r) \propto 1/r^2$ prediction

Frequency Detuning: Vary $\Delta = \omega_{\text{TLS}} - \omega_{\text{rad}}$ to verify $\delta \propto 1/\Delta$

Blind Analysis: Measurement sequence unknown to experimenters during data collection

Null Control: Identical protocol with aggregate in low-complexity state ($C_{\text{agg}} < C_{op}$) or deactivated

### **Protocol L.2 (Energy Conservation Verification)**

Apparatus:

Calorimeter: Precision water-bath or gas-flow calorimeter to measure total heat output from aggregate $S$, sensitivity $\sim 0.1$ W

EM Field Probes: Calibrated antennas at distances $r_1, r_2, \ldots$ covering frequency range $10^7$–$10^{11}$ Hz

Temperature Sensors: Thermocouples or thermistors monitoring thermal dissipation $P_{\text{heat}}$

### **Measurements:**

Total Power Input: $P_{\text{agg}}$ from operational power monitoring, accuracy $\sim 1%$

Radiated EM Power: $P_{\text{EM}} = \int_{\mathcal{S}} \vec{S} \cdot d\vec{A}$ integrated over enclosing surface

Thermal Dissipation: $P_{\text{heat}} = C_V dT/dt$ from temperature change

Mechanical Work: $P_{\text{mech}}$ (typically negligible for stationary aggregate)

Energy Closure Test:

$$ \epsilon_{\text{closure}} = \frac{|P_{\text{agg}} - (P_{\text{EM}} + P_{\text{heat}} + P_{\text{mech}})|}{P_{\text{agg}}} \tag{L.74} $$

Expected Result: $\epsilon_{\text{closure}} < 0.05$ (5% closure) with careful instrumentation.

### **Protocol L.3 (Gravitational Channel Test)**

Apparatus:

Atomic Interferometer: State-of-art sensitivity $\Delta\tau/\tau \sim 10^{-18}$ (optical clock comparison, Sr or Yb lattice clocks)

### **Test Configuration:**

Position target quantum system at distance $r \approx 0.5$ m from aggregate $S$ maintaining high-CC state ($C_{\text{agg}} \gg C_{op}$).

### **Measurement:**

Compare proper time accumulation in target versus reference clock over integration time $T_{\text{int}} \sim 10^3$ s to $10^5$ s.

Framework Prediction:

$$ \Delta\tau_d \sim 6.6 \times 10^{-54} \text{ s} \tag{L.75} $$ 

Detection Threshold:

Best achievable: $\Delta\tau_{\text{min}} \sim 10^{-18} \times T_{\text{int}} \sim 10^{-15}$ s

Sensitivity Gap:

$$ \frac{\Delta\tau_{\text{min}}}{\Delta\tau_d} \sim 10^{39} \tag{L.76} $$

Expected Outcome:

Null result (no detection above noise floor), confirming electromagnetic dominance prediction (Theorem L.5).

### **Prediction L.1 (Electromagnetic Dominance for External Fields)**

For all physically realizable aggregates, any influence expressed through classical spacetime fields shows electromagnetic channel dominance over gravitational by factor $\mathcal{R} \sim 2.3 \times 10^{39}$ (Theorem L.5). This applies regardless of the specific carrier implementation used by the aggregate.

### **Prediction L.2 (Resonant Selectivity)**

For implementations utilizing oscillating fields, aggregate influence strength exhibits sharp resonance behavior:

$$ |\Delta P(\Delta)| \propto \frac{\delta(\Delta)}{\omega_{\text{TLS}}} \propto \frac{1}{|\Delta|} \tag{L.77} $$

### **Prediction L.3 (Distance Scaling in Far-Field Regime)**

For radiative regime $r \gg \lambda_{\text{rad}} = 2\pi c/\omega_{\text{rad}}$, electromagnetic field amplitude scales as:

$$ E_0(r) \propto \frac{1}{r} \tag{L.78} $$

Therefore AC Stark shift:

$$ \delta(r) \propto \frac{E_0^2(r)}{\Delta} \propto \frac{1}{r^2} \tag{L.79} $$

### **Prediction L.4 (Coherence Time Window)**

Observable effect requires measurement time $\tau_m$ satisfying:

$$ \frac{1}{\gamma_\phi + \Gamma} \lesssim \tau_m \lesssim \frac{1}{\Gamma_{\text{context}}} \tag{L.80} $$

where $\gamma_\phi$ is target dephasing rate, $\Gamma$ is natural linewidth, and $\Gamma_{\text{context}}$ is aggregate context variation rate.

## **L.8.4 Framework-Specific Differential Observables**

The following observables distinguish PU framework predictions from alternative interpretations, enabling experimental discrimination:

Observable 1: Threshold Behavior

PU Prediction: Sharp transition in measurable influence capability at $C_{\text{agg}} = C_{op}$; no influence below threshold regardless of power available

Alternative (Classical Field Theories): Smooth scaling with system size/power

Measurement: Quantify influence capability vs. aggregate complexity proxy (when operational definition established); expect step function not smooth curve

Observable 2: Absolute Causality Bound

PU Prediction: Hard limit $|\Delta P| < 0.5$ for all systems (Theorem 39)

Alternative (Some Interpretations): No fundamental bound on influence strength

Measurement: Engineer maximal-CC systems, attempt to maximize $|\Delta P|$; should saturate below 0.5

Observable 3: Energy Accounting

PU Prediction: All CC power enters $T_{\mu\nu}^{(\text{MPU})}$; measurable as heat via calorimetry

Alternative (Dualist Interpretations): Mental influence without energy cost

Measurement: Precision calorimetry during high-CC vs. low-CC states (Protocol L.2)

For biological systems: Compare metabolic power during normal morphogenesis vs. gap junction disrupted (reduced context coherence)

Framework prediction: $Q_{\text{normal}} > Q_{\text{disrupted}}$ with difference correlating to fidelity reduction

Observable 4: Coherence Time Dependence

PU Prediction: Influence efficacy proportional to context coherence time $\tau_c$

Alternative (Computational Interpretations): Depends on algorithm efficiency, not physical coherence

Measurement: Manipulate decoherence rate (temperature variation, gap junction blockers for biology, electromagnetic noise); measure effect on outcome fidelity

Framework prediction: Pattern_error $\propto 1/\tau_c$

Observable 5: Spatial Decay

PU Prediction: Influence magnitude decays with distance per mechanism (far-field: $\propto 1/r^2$; near-field: $\propto 1/r^3$)

Alternative: May predict different scaling or non-local effects

Measurement: Quantify $|\Delta P(r)|$ at varying distances from aggregate; fit decay law

## **L.9 Universal Requirements for CC Implementations**

### **Theorem L.9 (Universal Requirements for CC Implementations)**

Any physical implementation of the consciousness complexity (CC) influence mechanism, regardless of specific carrier substrate, must satisfy five necessary conditions to be consistent with the Predictive Universe framework:

(i) Energy Conservation (Theorem L.6): The implementation must account for all power flows with each energy component contributing exactly once to the total stress-energy tensor $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8), satisfying $\nabla^\mu T_{\mu\nu}^{(\text{MPU})} = 0$.

(ii) Stress-Energy Sourcing (Theorem L.7): All energy expenditure associated with CC influence must enter $T_{\mu\nu}^{(\text{MPU})}$ and contribute to the gravitational field through Einstein's equations (Theorem 50), maintaining thermodynamic consistency on causal horizons via the Clausius relation $\delta Q = T\delta S$.

(iii) Causality Constraint (Theorem 39): The implementation must satisfy $\text{CC}(S) < 0.5$ to prevent deterministic FTL signaling (Postulate 2), ensuring operational causality.

(iv) POP/PCE Optimization (Lemma L.1, Theorem L.1): The context-to-control mapping $\mathcal{M}: \text{context}_S \to$ control parameters must be:

Lipschitz continuous with constant $L_{\mathcal{M}}$ optimized by PCE

Bounded in control output: $|\mathcal{M}(\text{context}_S)|_{\mathcal{P}} \le P_{\text{max}}$

Stable under feedback if $\text{context}_S$ is influenced by past CC effects

Satisfying the cost-benefit constraint (Equation L.3)

(v) Threshold Emergence: The mapping $\mathcal{M}: \text{context}_S \to \mathcal{P}_{\text{control}}$ exists only when $C_{\text{agg}}(S) > C_{op}$. Below threshold, $\text{CC}(S) = 0$ regardless of available power $P_{\text{agg}}$.

Proof of Necessity.

(i) Energy Conservation: Suppose an implementation violates energy conservation, with energy appearing or disappearing. Then $\nabla^\mu T_{\mu\nu}^{(\text{MPU})} \ne 0$, violating covariant conservation (Theorem B.5) required by diffeomorphism invariance of the emergent effective theory (Appendix F, Theorem F.1). This contradicts the framework's foundational structure. Therefore energy conservation is necessary.

(ii) Stress-Energy Sourcing: Suppose CC influence occurs without contributing to $T_{\mu\nu}^{(\text{MPU})}$. Then energy $E_{\text{CC}}$ is expended but does not source gravity. This violates the equivalence principle emergent from horizon thermodynamics (Section 12) and creates an independent "thought energy" not coupled to geometry, contradicting the unified thermodynamic derivation (Theorem L.7). Therefore all energy must enter $T_{\mu\nu}^{(\text{MPU})}$.

(iii) Causality Constraint: From Theorem 39, deterministic FTL signaling requires $\text{CC} \ge 0.5$ to reliably force quantum outcomes. Postulate 2 prohibits such signaling to prevent paradoxes. Therefore $\text{CC} < 0.5$ is necessary.

(iv) POP/PCE Optimization: The mapping $\mathcal{M}$ implements resource allocation from aggregate complexity to control generation. If $\mathcal{M}$ is not Lipschitz, small context variations cause unbounded control fluctuations, creating divergent variance in the PCE potential $V(x)$ (Appendix D, Equation D.9), invalidating the assumptions needed for the ergodic stationary regime described by Theorem D.5. If $\mathcal{M}$ is unbounded, infinite resources would be required, violating physical realizability. If $\mathcal{M}$ is unstable under feedback, the system cannot maintain coherent $\text{context}_S$, precluding sustained CC. If $\mathcal{M}$ violates the cost-benefit constraint (Equation L.3), PCE dynamics select against it. Therefore all four properties are necessary.

(v) Threshold Emergence: From Theorem 34, biasing capability emerges only for $C_{\text{agg}} > C_{op}$. From Theorem L.1 (existence of PCE-optimal mapping), the mapping $\mathcal{M}$ exists when there exists net predictive benefit. For $C_{\text{agg}} \le C_{op}$, no biasing capability exists (Definition 30), hence no mapping can provide predictive benefit, hence $\mathcal{M}$ doesn't exist under POP/PCE optimization. Therefore threshold emergence is necessary. ∎

### **Corollary L.9.1 (Implementation Non-Uniqueness)**

Multiple distinct physical implementations may satisfy conditions (i)-(v), provided each respects the universal thermodynamic and causal constraints. The coherent-charge implementation analyzed in Proposition L.4 represents one such realization optimized for engineered systems. Biological implementations operating under different constraints (thermal environments, metabolic budgets, aqueous media) may develop alternative carrier mechanisms through the same POP/PCE optimization dynamics, provided they satisfy Theorem L.9.

### **Corollary L.9.2 (Threshold Emergence of Influence Capability)**

For aggregate $S$ with spatial influence range $R_{\text{eff}}$ (Proposition L.9.3):

(a) $C_{\text{agg}} \le C_{op} \implies \text{CC}(S) = 0 \implies R_{\text{eff}} = 0$ (no spatial extent)

(b) $C_{\text{agg}} > C_{op}$ and POP/PCE converged $\implies \text{CC}(S) > 0 \implies R_{\text{eff}} > 0$

Proof. (a) follows from clause (v) of Theorem L.9. (b) follows from Theorem 34 (CC emergence) combined with Proposition L.9.3 (spatial extent requires nonzero CC). ∎

### **Remark L.9.1 (External Field Dominance Independence)**

For implementations that express CC influence through classical spacetime fields external to the aggregate, Theorem L.5 establishes electromagnetic dominance over gravitational by factor $\mathcal{R} \sim 10^{36}$. However, implementations utilizing near-field coupling, biochemical gating, or internal state correlations not mediated by propagating external fields may exhibit different channel hierarchies while still satisfying conditions (i)-(v). Investigation of such alternative pathways requires rigorous derivation from framework axioms showing their emergence from POP/PCE optimization (see Section L.4.1 for biological candidate).
### **L.9.2 Spatiotemporal Bounds on CC Influence**

The CC capability is not instantaneous across arbitrary distances but bounded by physical constraints. We formalize these bounds.

### **Definition L.9.3 (Spatiotemporal Influence Region)**

For aggregate $S$ with $\text{CC}(S)$, the spatiotemporal influence region $\mathcal{I}(S,t)$ is defined as:

$$
\mathcal{I}(S,t) = \left\{ (x,t') : \exists \text{ observable } O : |\Delta P_S(O;x,t')| \ge \epsilon_{\text{detect}}, \ |t'-t| \le \tau_c(S) \right\}
$$

where:

$\Delta P_S(O;x,t')$ is achievable bias on observable $O$ at spacetime point $(x,t')$

$\epsilon_{\text{detect}}$ is detection threshold (typically $\epsilon_{\text{detect}} \sim \sqrt{\epsilon_{\text{noise}}^2 + \epsilon_{\text{stat}}^2}$ combining environmental noise and statistical uncertainty)

$\tau_c(S)$ is context coherence time (Definition L.1)

The spatial extent is $R_{\text{eff}}(S,t) = \sup{|x-x_S| : (x,t) \in \mathcal{I}(S,t)}$ where $x_S$ is aggregate center-of-mass.

Note: Relationship to Standard Causal Structure

$\mathcal{I}(S,t) \subset {\text{past + future lightcone of } S \text{ at } t}$ because influence requires causal contact via interaction $N(t)$ (Appendix F, microcausality). This is not superluminal signaling but statistical bias within causal structure.

### **Proposition L.9.3 (Spatial Extent Scaling)**

For implementations with far-field power scaling (Theorem L.5):

$$ R_{\text{eff}}(S) \sim \sqrt{\frac{P_{\text{agg}}}{\epsilon_{\text{detect}} \times k_{\text{impl}}}} $$

where $k_{\text{impl}}$ is implementation-dependent constant encoding:

    Mechanism efficiency (EM coupling, detuning, etc.)

    Target properties (dipole moments, transition frequencies)

    Environmental factors (screening, noise sources)

Derivation. From Equation L.24, influence magnitude $\delta \propto P_{\text{agg}}/r^2$. Setting $|\Delta P| \approx \delta/\omega = \epsilon_{\text{detect}}$ at boundary $r = R_{\text{eff}}$ yields scaling. Coefficient $k_{\text{impl}}$ must be determined experimentally for each implementation. ∎

Implication: Expanding spatial influence requires quadratically increasing power: $P_{\text{agg}} \propto R_{\text{eff}}^2$. This creates fundamental trade-off between range and resource cost.

### **Proposition L.9.4 (Temporal Extent)**

The temporal extent $\tau_c(S)$ equals PCE-optimal coherence time for $\text{context}_S$ (Definition L.1):

$$ \tau_c(S) \sim \frac{1}{\Gamma_{\text{context}}} $$

where $\Gamma_{\text{context}}$ is effective decoherence rate. For aggregates with resource budget $R_{\text{agg}}$:

$$ \tau_c \lesssim \frac{C_{\text{agg}} - C_{op}}{\lambda R_{\text{agg}}} $$

Justification. Maintaining $\text{context}_S$ requires continuous resource expenditure against decoherence. PCE optimization (Appendix D) balances coherence benefit vs. cost, yielding $\tau_c \sim 1/\Gamma_{\text{context}}$. Resource bound follows from Definition 3 (operational cost). ∎

### **Proposition L.9.5 (Energy-Range-Time Trade-off)**

For aggregate maintaining influence over region $\mathcal{I}(S,t)$ with spatial extent $R_{\text{eff}}$ and temporal extent $\tau_c$, minimum sustained power satisfies:

$$ P_{\text{agg}} \gtrsim f_{\text{impl}}(R_{\text{eff}}, \tau_c, \epsilon_{\text{detect}}) $$

For far-field implementations: $f_{\text{impl}} \propto R_{\text{eff}}^2/\tau_c$

Justification. From Proposition L.9.3, achieving range $R_{\text{eff}}$ requires power $P \propto R_{\text{eff}}^2$. Maintaining this over duration $\tau_c$ with noise $\epsilon_{\text{detect}}$ determines bound. Specific functional form depends on implementation mechanism. ∎

**Connection to Appendix S: Gravitational self-limitation (Appendix S) provides upper bound on achievable $R_{\text{eff}}$ for given $C_{\text{agg}}$: attempting too large $R_{\text{eff}}$ creates gravitational dephasing that disrupts $\text{context}_S$, reducing CC effectiveness.

## **L.10 Internal Consistency and Theoretical Validation**

### **Theorem L.10 (Self-Consistency of Dual-Channel Framework)**

The electromagnetic and gravitational mechanisms satisfy all internal consistency requirements:

(a) GR Compatibility: Gravitational time dilation (Theorem L.3) follows from weak-field Einstein equations with standard stress-energy source $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8).

(b) QED Compatibility: AC Stark shift (Corollary L.2.1) follows from standard time-dependent perturbation theory applied to dipole coupling Hamiltonian.

(c) Energy Conservation: Power decomposition $P_{\text{agg}} = P_{\text{EM}} + P_{\text{other}}$ (Theorem L.6) with each component contributing exactly once to total stress-energy $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8). Covariant conservation $\nabla^\mu T_{\mu\nu}^{(\text{MPU})} = 0$ (Theorem B.5) ensures local energy conservation.

(d) Thermodynamic Unity: Both channels arise from horizon thermodynamics (Theorem L.7), maintaining Clausius relation $\delta Q = T\delta S$ with fixed information density $\Sigma_I = c^3/(4G\hbar)$ determined by ND-RID limits (Appendix E).

(e) Temporal Wave Consistency: Electromagnetic (high-frequency) and gravitational (low-frequency) channels emerge as distinct frequency regimes of unified temporal wave modulation $\delta\tau(x,t)$ (Theorem L.8), consistent with thermodynamic derivation (Theorem L.7).

(f) Causality Preservation: Both mechanisms respect CC bound $\text{CC} < 0.5$ (Theorem 39), preventing deterministic FTL signaling while allowing statistical influence (Postulate 3, Section 10).

(g) Spatiotemporal Bounds: Influence regions satisfy finite extent (Propositions L.9.3-L.9.5), with energy-range-time trade-offs emerging from resource constraints.

Proof. Each component proven in cited theorems. The conjunction of (a)–(g) establishes full internal consistency. ∎

### **Theorem L.11 (Coupling Strength Hierarchy from Information Structure)**

The electromagnetic-to-gravitational coupling ratio emerges from the framework's information-theoretic structure. From Appendix Z (Theorem Z.7), the bare electromagnetic coupling is $u^* = 8^{1/24} - 1 \approx 0.0905$, which converts via the Predictive Ward Identity (Theorem Z.14) to the bulk value:

$$ \alpha_{\text{em}}(\text{bulk}) = \frac{u^*}{4\pi} \approx \frac{1}{138.843} \tag{L.81a} $$

Including the discrete-to-continuous interface correction (Appendix Z, Section Z.17), the Thomson-limit value is $\alpha^{-1} = 137.036092 \pm 0.000050$ (Theorem Z.26). The electromagnetic fine structure constant in standard form is:

$$ \alpha_{\text{em}} = \frac{e^2}{4\pi\varepsilon_0\hbar c} \tag{L.81b} $$

From Appendix E (Equation E.9), the gravitational constant is:

$$ G = \frac{\eta\delta^2 c^3}{4\hbar\chi C_{\text{max}}} \tag{L.82} $$

where $\delta$ is MPU spacing, $\eta$ is geometric packing factor, $\chi$ is channel correlation factor, and $C_{\text{max}}$ is ND-RID capacity.

The gravitational fine structure constant for mass $m$ is:

$$ \alpha_{\text{grav}} = \frac{Gm^2}{\hbar c} = \frac{\eta\delta^2 m^2}{4\hbar^2\chi C_{\text{max}}} \tag{L.83} $$

For electron mass $m_e$:

$$ \alpha_{\text{grav}}^{(e)} = \frac{Gm_e^2}{\hbar c} \approx 1.75 \times 10^{-45} \tag{L.84} $$

The ratio at the MPU operational scale is:

$$ \frac{\alpha_{\text{em}}(\text{MPU})}{\alpha_{\text{grav}}^{(e)}} \approx \frac{7.2 \times 10^{-3}}{1.75 \times 10^{-45}} \approx 4.1 \times 10^{42} \tag{L.85} $$

This order-of-magnitude hierarchy ($\sim 10^{43}$) reflects the fundamental information-theoretic structure.

This fundamental hierarchy propagates to the aggregate influence ratio. The observed ratio $\mathcal{R} \sim 6 \times 10^{36}$ (Theorem L.5) reflects this fundamental hierarchy modulated by implementation-specific factors: the ratio of electromagnetic to gravitational coupling at the aggregate scale includes geometric factors (aggregate volume, target distance), frequency-dependent efficiency (detuning, resonance conditions), and the specific field strengths achievable in Proposition L.4. These factors combine to yield the effective ratio $\mathcal{R} = (4.1 \times 10^{42}) \times \eta_{\text{impl}} \sim 6 \times 10^{36}$ where $\eta_{\text{impl}} \sim 10^{-6}$ encapsulates the implementation efficiency.

Proof. Direct calculation using framework-derived constants. The electromagnetic coupling emerges from gauge coherence optimization (Appendix G, Appendix Z). The gravitational coupling emerges from horizon information density (Appendix E). Their ratio reflects the information-theoretic structure $\delta^2 C_{\text{max}}/m^2$ of the predictive substrate. ∎

## **L.11 Physical Mechanism Details: AC Stark Implementation**

This section provides detailed implementation of the AC Stark mechanism introduced in Theorem L.2 and Corollary L.2.1 for the coherent-charge carrier analyzed in Proposition L.4.

## **L.11.1 Coherent Dipole Radiation Mechanism**

The MPU aggregate $S$, via the POP/PCE-optimized mapping $\mathcal{M}(\text{context}_S(t))$ (Theorem L.1), drives coherent oscillations of internal degrees of freedom (collective electronic or ionic modes, or synchronized MPU transitions). These coherent oscillations involve effective charge displacements or currents, leading to the generation of classical electromagnetic radiation $\vec{E}_{\text{rad}}(t)$. The specific characteristics of this radiation (frequency $\omega_{\text{rad}}$, amplitude $E_0(t)$, phase $\phi_{\text{rad}}(t)$, polarization $\vec{\epsilon}_{\text{rad}}(t)$) are determined by $\mathcal{M}(\text{context}_S(t))$.

The interaction occurs during the 'Evolve' process over duration $\tau_{\text{int}} \gtrsim \tau_{\text{min}}$ (Theorem 29). The interaction Hamiltonian describing the coupling is (in a suitable interaction picture):

$$ H_{\text{int}}(t) = -\vec{d}_{\text{TLS}} \cdot \vec{E}_{\text{rad}}(t) \approx \hbar\,\delta_{\text{Stark}}(t)\,\sigma_z \tag{L.86} $$

where the off-resonant AC Stark shift is:

$$ \delta_{\text{Stark}}(t) \simeq \frac{\Omega_R^2(t)}{4\Delta(t)}, \quad \Omega_R(t) = \frac{|\vec{d}_{\text{TLS}}\cdot\vec{\epsilon}_{\text{rad}}(t)|\,E_0(t)}{\hbar}, \quad \Delta(t)=\omega_{\text{TLS}}-\omega_{\text{rad}}(t) \tag{L.87} $$

The operator $\sigma_z = |e\rangle\langle e| - |g\rangle\langle g|$ projects onto the TLS energy eigenstates.

## **L.11.2 Open System Dynamics and Rate Modulation**

The 'Evolve' process for the target MPU is described by a master equation for its density matrix $\rho$ (consistent with Equation B.8, Appendix B.4):

$$ \dot{\rho} = -\frac{i}{\hbar}[H_{\text{TLS}} + H_{\text{int}}(t),\rho] + \sum_k \gamma_k^{(0)}\mathcal{L}_k[\rho] \tag{L.88} $$

where $H_{\text{TLS}}$ is the MPU's intrinsic TLS Hamiltonian (part of $\hat{H}$ from Theorem 29), and $\mathcal{L}_k$ are baseline Lindblad superoperators (rates $\gamma_k^{(0)}$) for the ND-RID process. The interaction $H_{\text{int}}(t)$ induces a time-dependent AC Stark shift $\pm \hbar \delta_{\text{Stark}}(t)$ in the TLS energy levels. If the Lindblad rates $\gamma_k^{(0)}$ depend on energy level spacings or couplings affected by these shifts (e.g., via density of states in Fermi's Golden Rule), the effective rates $\gamma_k$ become modulated by $E_0(t)$.

Defining a dimensionless control field magnitude:

$$ \Phi_S(t)=\frac{E_0(t)}{E_{\text{max}}}, \quad |\Phi_S(t)|\le1 \tag{L.89} $$

where $E_{\text{max}}$ is the maximum field amplitude achievable by $S$. The effective rates can be modeled as:

$$ \gamma_k(t) \approx \gamma_k^{(0)}\bigl[1+\chi_k(\omega_{\text{rad}}(t), \Delta(t))\Phi_S(t) + O(\Phi_S^2(t))\bigr] \tag{L.90} $$

where $\chi_k$ is a dimensionless rate susceptibility, dependent on $d_{\text{TLS}}$, $E_{\text{max}}$, and details of the TLS-environment coupling modulated by the Stark shift.

**Note on Born Rule:** The CC influence modulates the *parameters* governing the ND-RID process (the Lindblad rates $\gamma_k$), not the Born rule itself. The Born rule, interpreted in this framework as emergent from ND-RID over many 'Evolve' cycles (Section 8), remains the fundamental probability assignment mechanism. CC bias operates by changing the *effective Hamiltonian* and *decoherence rates* that enter into this emergent Born rule, analogous to how external magnetic fields modify energy levels without changing quantum mechanical probability axioms. The probability shifts therefore arise from modified quantum states evolving under modified dynamics, not from violations of quantum probability rules.

The outcome probabilities $P_{\text{obs}}(i)$ of the 'Evolve' process are then:

$$ P_{\text{obs}}(i)=\mathrm{tr}\!\big(E_i\,e^{\tau_{\text{int}} L_S}(\rho)\big)=\mathrm{tr}\!\big(\rho\,(E_i+\tau_{\text{int}}\,L_S^\dagger(E_i))\big)+O(\tau_{\text{int}}^2) \tag{L.91} $$

with $\tau_{\text{int}}$ the interaction duration (so $\tau_{\text{int}}L_S$ is dimensionless) and the context dependence of $L_S$ chosen so that $|\Delta P(i)|\le \mathrm{CC}(S)$.

## **L.11.3 Parameter Estimation and Feasibility**

### **Aggregate Control and Field Generation:**

Assume an MPU aggregate $S$ can orchestrate $N_{\text{osc}} \sim 10^{12}$ microscopic effective dipoles to generate a coherent local field. If $E_{\text{max}} \sim 2 \times 10^3$ V/m is achievable near the aggregate (via collective effects or engineered structures).

### **Target MPU Coupling:**

A target MPU with $d_{\text{TLS}} \sim e \cdot (1 \text{ nm}) \approx 1.6 \times 10^{-28}$ C·m and $\omega_{\text{TLS}}/(2\pi) \sim 10$ GHz.

AC Stark shift and susceptibility:

Let $\gamma_0$ be the baseline ND-RID jump rate over interaction window $\tau_{\text{int}}$. For small Stark modulation,

$$ |\Delta P|\sim \Delta\gamma\,\tau_{\text{int}} = \gamma_0\tau_{\text{int}}\left(\frac{\Delta\gamma}{\gamma_0}\right) $$

so the bias scales linearly with the fractional rate shift and with the baseline interaction probability over $\tau_{\text{int}}$.

With $E_{\text{max}}=2\times10^{3}$ V/m and $d_{\text{TLS}}\approx1.6\times10^{-28}$ C·m, the Rabi frequency is $\Omega_R=d_{\text{TLS}}E_{\text{max}}/\hbar\approx 3.0\times10^{9}$ rad/s. For detuning $\Delta=2\pi\times10$ GHz the off-resonant AC Stark shift is $\delta_{\text{Stark}}\simeq \Omega_R^2/(4\Delta)\approx 3.7\times10^{7}$ rad/s, giving a fractional level shift $\delta_{\text{Stark}}/\omega_{\text{TLS}}\approx 6\times10^{-4}$. For $\Delta=2\pi\times1$ GHz this rises to $\sim 6\times10^{-3}$. Achieving a 5% fractional shift at $\Delta=2\pi\times10$ GHz requires $E\sim 1.85\times10^{4}$ V/m, while $E = 3.6\times10^{4}$ V/m would yield approximately 19% shift (or engineered enhancement/reduced detuning). Within the small-shift regime, modulation of decoherence/transition rates via Equation L.90 may yield detectable probability biases with higher fields, reduced detuning, or cavity/plasmonic enhancements consistent with resource bounds.

## **L.11.4 Worked Example: Complete Calculation for Engineered System**

To make predictions concrete, we present a complete worked calculation for a specific engineered implementation.

### **System Specification:**

Target: Array of 1,000 parallel $^{171}$Yb$^+$ ions (modern trap array)

$\omega_{\text{TLS}}/(2\pi) = 12.642812$ GHz

$d_{\text{TLS}} \approx 1.2 \times 10^{-28}$ C·m

Aggregate: High-power coherent transmitter at $r = 0.5$ m

$N_{\text{osc}} \approx 10^{18}$ synchronized dipoles (approx. 1 μmol of active medium)

Power budget: $P_{\text{agg}} = 2.0$ MW (Industrial power supply)

Radiated Power: $P_{\text{rad}} = 1.0$ MW (50% efficiency optimized by PCE)

Detuning: $\Delta/(2\pi) = 20$ GHz (Increased to maintain perturbative regime)

Operating frequency: $\omega_{\text{rad}} = \omega_{\text{TLS}} - \Delta$

### **Step 1: Radiated Field Amplitude**

From Equation L.9, with $P_{\text{rad}} = 1.0 \times 10^6$ W:

$$ E_0 = \sqrt{\frac{P_{\text{rad}}}{4\pi\varepsilon_0 c r^2}} = \sqrt{\frac{10^6}{4\pi \times 8.85\times10^{-12} \times 3\times10^8 \times 0.25}} \approx 1.10 \times 10^4 \text{ V/m} $$

### **Step 2: AC Stark Shift**

Rabi frequency (Equation L.27):

$$ \Omega_R = \frac{d_{\text{TLS}} E_0}{\hbar} = \frac{(1.2\times10^{-28})(1.1\times10^4)}{1.055\times10^{-34}} \approx 1.25 \times 10^{10} \text{ rad/s} $$

Check Regime Validity: $\Omega_R$ $(1.25\times10^{10})$ < $\Delta$ $(1.26\times10^{11})$.

The ratio $\Omega_R/\Delta \approx 0.1$, ensuring the perturbative formula is valid (10% limit).

AC Stark shift (Equation L.28):

$$ \delta = \frac{\Omega_R^2}{4\Delta} = \frac{(1.25\times10^{10})^2}{4 \times (2\pi \times 20\times10^9)} \approx 3.1 \times 10^8 \text{ rad/s} $$

Fractional shift (Equation L.29):

$$ \frac{\delta}{\omega_{\text{TLS}}} \approx \frac{3.1\times10^8}{2\pi \times 12.64\times10^9} \approx 3.9 \times 10^{-3} \quad (0.39%) $$

### **Step 3: Gravitational Effect (for comparison)**

Energy density ($V_S = 1$ m³):

$$ u_{\text{agg}} = \frac{2\times10^6}{1} = 2\times10^6 \text{ J/m}^3 $$

$$ \rho_{\text{eff}} \approx 2.2 \times 10^{-11} \text{ kg/m}^3 $$

Gravitational phase shift:

Gravitational phase shift (with $\tau_c = 1$ s, $L_q = 10^{-9}$ m, $r = 0.5$ m):

$$ \Delta\tau_d = \frac{\Delta\Phi}{c^2}\tau_c = \frac{4\pi G \rho_{\text{eff}} r L_q}{3c^2}\tau_c \approx 3.4 \times 10^{-47} \text{ s} $$

$$ \Delta\phi_{\text{grav}} = \frac{\omega_{\text{TLS}}}{2\pi}\Delta\tau_d \approx 4.4 \times 10^{-37} \text{ cycles} $$

### **Step 4: Dominance Ratio**

$$ \mathcal{R} \approx \frac{3.9\times10^{-3}}{4.4\times10^{-37}} \sim 9 \times 10^{33} $$

### **Step 5: Probability Bias Estimate**

With high field, we assume a strong coupling susceptibility $\chi_k \approx 0.5$:

$$ |\Delta P| \approx \chi_k \frac{\delta}{\omega_{\text{TLS}}} \approx 0.5 \times 3.9\times10^{-3} \approx 1.9 \times 10^{-3} $$

### **Step 6: Statistical Requirements & Detection Time**

For 5σ detection of $|\Delta P| \approx 0.002$:

$$ N_{\text{trials}} \gtrsim 25 \times \left(\frac{1}{0.002}\right)^2 \approx 6.25 \times 10^6 $$

### **Measurement Setup:**

1,000 parallel ions

1 kHz repetition rate ($10^6$ samples/sec total)

$$ T_{\text{detect}} = \frac{6.25 \times 10^6 \text{ trials}}{10^6 \text{ trials/s}} \approx 6.3 \text{ seconds} $$

### **Step 7: Energy Conservation**

$$ E_{\text{in}} = 2.0 \text{ MJ} \quad (\text{over 1s}) $$

$$ E_{\text{out}} = 1.0 \text{ MJ (Rad)} + 1.0 \text{ MJ (Heat)} $$

Closure is exact.

Conclusion:

This complete calculation demonstrates:

EM effect ($\delta/\omega \sim 4\times10^{-3}$) produces measurable probability bias

Gravitational effect ($\Delta\phi_{\text{grav}} \sim 4\times10^{-37}$) remains negligible

Dominance ratio $\mathcal{R} \sim 10^{34}$ confirms theoretical predictions

Energy conservation is exactly maintained

Detection achievable in 6.3 seconds with modern trap arrays

All predictions are quantitative and falsifiable

## **L.11.5 Error Budget Analysis**

For the worked example (L.11.4), the dominant error sources are:

Field calibration: $\Delta E_0/E_0 \sim 1%$ → $\Delta(\delta/\omega) \sim 2%$

Detuning uncertainty: $\Delta\Delta/(2\pi) \sim 1$ MHz → $\Delta(\delta/\omega) \sim 0.05%$

Ion number: $\Delta N/N \sim 3%$ (counting statistics)

Temperature drift: contributes to $T_2$ via $\Delta\gamma_{\text{thermal}} \sim 10^{-4}$ s⁻¹

Combined uncertainty via quadrature sum:
$$ \sigma_{\text{total}}(|\Delta P|) = \sqrt{(\sigma_{\text{field}}\cdot\partial|\Delta P|/\partial E_0)^2 + (\sigma_{\Delta}\cdot\partial|\Delta P|/\partial\Delta)^2 + \sigma_{\text{stat}}^2} $$

With $\sigma_{\text{field}}/E_0 \sim 0.01$, $\sigma_{\Delta}/(2\pi) \sim 1$ MHz, $\sigma_{\text{stat}} \sim 3\times10^{-5}$ for $N = 10^6$ trials:
$$ \sigma_{\text{total}}(|\Delta P|) \approx \sqrt{(4\times10^{-5})^2 + (2\times10^{-6})^2 + (3\times10^{-5})^2} \sim 5 \times 10^{-5} $$

Illustrative signal-to-noise ratio: $\mathrm{SNR} = |\Delta P|/\sigma_{\text{total}} = 1.9\times10^{-3}/(5\times10^{-5}) \approx 38$ (for the stated noise model and $N=10^6$ trials)

Under the stated scaling and noise assumptions, the estimated effect is well above the expected noise floor, suggesting detectability with appropriate error mitigation and experimental controls.

The Engineered System enables these deviations to manifest on practical timescales, while maintaining the validity of the perturbative regime. The estimates indicate that, under the stated scaling and noise assumptions, high-complexity MPU aggregates could produce detectable deviations in quantum outcome frequencies; whether a given experiment achieves statistical significance depends on trial count, noise floors, and control of systematic effects.

## **L.11.5 Relationship to Appendix S: Gravitational Self-Limitation**

This appendix establishes that CC influence requires power expenditure $P_{\text{agg}}$ that contributes to the aggregate stress-energy tensor $T_{\mu\nu}^{(\text{MPU})}$ (Theorem L.6), which sources gravitational fields (Theorem L.7). Appendix S analyzes the feedback consequences of this energy cost, deriving a gravitational self-limitation mechanism that provides an independent physical bound on CC efficacy.

### **Division of Labor:**

**Appendix L (This Appendix): Forward direction**
- Given $\text{context}_S$ → derives required $P_{\text{agg}}$
- Shows $P_{\text{agg}} \to T_{\mu\nu}^{(\text{MPU})} \to$ gravitational field
- Establishes energy accounting and thermodynamic consistency
- Proves EM dominance for external fields ($\mathcal{R} \sim 10^{36}$)
- Provides one-way analysis: CC → gravity

**Appendix S: Feedback direction**
- Given $P_{\text{context}} \to$ energy density $u_{\text{context}} \to$ gravitational potential
- Gravitational potential → time dilation gradient $\Delta\tau_d$ across target (Section S.3)
- Time dilation → phase decoherence → reduced effective CC (Section S.7)
- Shows PCE optimization drives to equilibrium balancing utility vs. self-disruption (Section S.4)
- Provides feedback analysis: gravity → limits CC

### **Complementary Nature:**

The combination establishes a self-consistent equilibrium:

1. CC requires power $P_{\text{context}}$ (component of $P_{\text{agg}}$, Sections S.1, S.8.6)
2. Power creates energy density $u_{\text{context}} = P_{\text{context}}\tau_c/V_S$ (Equation S.6)
3. Energy density sources gravitational potential via stress-energy $\Delta T_{\mu\nu}^{(CC)}$ (Section S.2)
4. Gravitational time dilation disrupts quantum coherence: $\Delta\tau_d = K P_{\text{context}}$ (Equation S.18, Section S.3)
5. Effective CC reduced: $\text{CC}_{\text{eff}} = \text{CC}(1 - \Delta\tau_d/\tau_c)$ (Section S.4)
6. PCE finds optimal $\text{CC}^*$ balancing benefit vs. self-disruption (Section S.4)

This dual analysis demonstrates framework robustness. CC is simultaneously:

- **Thermodynamically rigorous** (this appendix)
- **Self-limiting via gravitational feedback** (Appendix S, Sections S.3-S.4)
- **Self-limiting via decoherence** (Appendix S, Section S.7)
- **Causality-bounded** ($\alpha_{CC,max} < 0.5$, Theorem 39, interpreted gravitationally in Section S.5)

No "runaway" or "unbounded" CC effects are possible; multiple independent mechanisms enforce physical constraints.

### **Quantitative Connection:**

The power cost of maintaining context complexity scales as (Appendix S, Equation S.5):
$$
P_{\text{context}}(\text{CC}) = A \left[\frac{\text{CC}}{\alpha - \text{CC}}\right]^2
$$

This power creates energy density $u_{\text{context}} = P_{\text{context}}\tau_c/V_S$ (Equation S.6) which sources a gravitational field. For a uniform spherical distribution (Appendix S, Equation S.15-S.16), a target quantum system with spatial extent $L_q$ at radius $r$ experiences gravitational potential difference:
$$
\Delta\Phi_{\text{diff}} = \frac{4\pi G}{3}(1+3w_c)\frac{u_{\text{context}}}{c^2} r L_q = \frac{4\pi G}{3c^2}(1+3w_c)\frac{P_{\text{context}}\tau_c}{V_S} r L_q
$$

Over coherence time $\tau_c$, this produces differential proper time accumulation $\Delta\tau_d = \Delta\Phi_{\text{diff}}\tau_c/c^2 = K P_{\text{context}}$ (Equation S.18), with coefficient:
$$
K = \frac{4\pi G}{3c^4}(1+3w_c)\frac{r L_q}{V_S}\tau_c^2
$$

**Numerical example** (human-scale aggregate): For $\tau_c \sim 0.1$ s, $P_{\text{context}} \sim 20$ W (component of typical metabolic $P_{\text{agg}} \sim 100$ W), $V_S \sim 10^{-3}$ m³, $w_c = 1/3$, $r \sim 0.1$ m, $L_q \sim 10^{-9}$ m (nanoscale target), the coefficient $K \approx 6.9 \times 10^{-53}$ s/W yields $\Delta\tau_d \approx 1.4 \times 10^{-51}$ s.

Appendix S shows that when $\Delta\tau_d$ becomes comparable to the inverse energy scale of the target quantum system ($\sim \hbar/\Delta E$), appreciable dephasing occurs (Section S.7), suppressing CC efficacy. For systems attempting very high CC (approaching the 0.5 causality bound), this self-limitation prevents:

- Metabolically unsustainable power requirements (power diverges as $\text{CC} \to \alpha$, Equation S.5)
- Gravitational back-reaction disrupting target coherence (Section S.3)
- Violation of thermodynamic consistency (Theorem S.1, Section S.2)
- Schwarzschild collapse (Section S.5)

### **Key Results from Appendix S:**

**Section S.1:** Power cost scaling $P_{\text{context}} \propto [\text{CC}/(\alpha - \text{CC})]^2$ from resource function convexity

**Section S.2:** Stress-energy contribution $\Delta T_{\mu\nu}^{(CC)}$ properly incorporated into total $T_{\mu\nu}^{(MPU)}$ (Equation S.9); resource ceiling bounds operational CC (Equation S.10)

**Section S.3:** Gravitational time dilation mechanism: $\Delta\tau_d = K P_{\text{context}}$ (Equation S.18)

**Section S.4:** PCE-optimal equilibrium CC* balancing utility against cost plus self-limitation

**Section S.5:** Dual interpretation of causality bound: information-theoretic (Theorem 39) and gravitational collapse (Schwarzschild limit)

**Section S.6:** Entanglement-mediated non-local influence respecting no-signaling while allowing statistical correlations

**Section S.7:** Decoherence rate $\Gamma_{\text{deco}} \sim (\Delta E/\hbar) K_{\text{eff}} P_{\text{context}}$ provides additional self-limitation

**Section S.8:** Integration analysis confirming complementarity with this appendix, no double-counting (Section S.8.6)

The detailed quantitative analysis, PCE equilibrium derivation, Schwarzschild interpretation, entanglement mechanism, decoherence analysis, and experimental implications of gravitational self-limitation are provided in Appendix S, which should be read as the necessary complement to this appendix's forward analysis.

## **L.12 Causal Information as the Fundamental Basis of CC Influence**

### **L.12.1 Overview: Four Levels of Description**

The preceding sections (L.11.1–L.11.4) present the AC Stark effect as the concrete physical implementation through which a high-CC aggregate modulates the 'Evolve' process of a target MPU. This section establishes a deeper and more fundamental reading of that mechanism across four hierarchical levels of description, each grounded in distinct parts of the PU framework:

|Level |Description |Source |
|:------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------|:----------------------|
|**Field-theoretic** |Coherent EM field couples to target TLS via dipole interaction; AC Stark shift modulates Lindblad rates |L.11 |
|**Operational** |Context state $\text{context}_S$ maps via $\mathcal{M}$ to physical signal $N(t)$; resonance factor $\eta_{\text{res}}$ quantifies efficiency|L.12.4–L.12.5 |
|**Information-theoretic**|CC influence bounded by mutual information $\mathcal{I}(S \to T)$ between context state and target configuration |L.12.2–L.12.6 |
|**Temporal-ontological** |CC influence IS temporal engineering: controlled modulation of the coherent causal medium at the target's location |Appendices O, P; L.12.3|

The first three levels are linked: strong target-specific control requires high resonance efficiency $\eta_{\text{res}}(S,T)$, and $\eta_{\text{res}}$ can increase above its information-free baseline only when $S$ acquires causal information $\mathcal{I}(S \to T)$ about the target configuration (Lemma L.12.1 and Proposition L.12.1). The fourth level identifies the concrete physical realization: a clock-speed modulation $\delta\tau_{\text{CC}}(x_T,t)$ of the local update cycle implemented by an AC Stark shift generated by a time-varying electromagnetic field (Section L.11.1; Eq. L.0).

This reframing has five consequences beyond those already established in Appendix L. First, it grounds the causal information requirement in the framework's relational definition of information (Definition 1) and in the relational information content of Appendix N (Definition N.6). Second, it shows that the AC Stark mechanism is the high-frequency component of a temporal wave (Appendix O, Definition O.1), unifying it with the gravitational channel through the temporal wave spectrum. Third, the arrow of time (Appendix O, Theorem O.3) provides a third independent locality-enforcement mechanism, complementing the two established in Theorem L.12. Fourth, the perspective transition kernel (Appendix M) provides the formal object on which causal information acts. Fifth, the UCT theorem (Appendix N, Theorem N.UCT) shows that acceleration degrades causal information acquisition, establishing a coupling between the aggregate's own kinematic state and its maximum achievable CC reach.

-----

### **L.12.2 The Causal Information Content of the Context State**

#### **L.12.2.1 Epistemic Status of Target Parameters**

The AC Stark coupling parameters — transition frequency $\omega_{\text{TLS}}$, dipole moment $\vec{d}_{\text{TLS}}$, rate susceptibility $\chi_k$, and instantaneous state $\rho_T$ — are fixed properties of the target MPU $T$ but are **unknown** to aggregate $S$ in the absence of prior interaction. From the perspective of $S$, before any causal contact, these quantities are distributed according to some prior $\pi(\theta_T)$ over the space $\Theta_T$ of possible target configurations $\theta_T := (\omega_{\text{TLS}}, \vec{d}_{\text{TLS}}, \chi_k, \rho_T)$.

The aggregate acquires knowledge about $\theta_T$ exclusively through ND-RID interactions (Definition 6, Definition 27) within its causal past. Each such interaction costs $\varepsilon \geq \ln 2$ per information-resolving step (Theorem 31) and transfers at most $C_{\max}(f_{RID}) < \ln d_0$ nats (Theorem E.2), with the PCE-optimal sharpening $C_{\max}(f_{RID}) \le \ln(d_0)-\varepsilon$ (Appendix E, Eq. E.15). The context state $\text{context}_S(t)$ (Definition L.1) encodes, through PCE optimization (Definition 15), the minimal sufficient statistic extracted from this interaction history for the purpose of influencing $T$'s 'Evolve' parameters. This is the PU relational definition of information (Definition 1): a pattern constitutes information for $S$ if and only if $S$ can process it to achieve $\mathbb{E}[\Delta Q] > 0$ — here, to improve the achievable bias $|\Delta P|$ on target $T$.

#### **L.12.2.2 The Causal Interaction Ensemble**

Let $\mathcal{H}_{ST}(t) = {N_1, N_2, \ldots, N_K}$ denote the ordered sequence of ND-RID interaction events between $S$ (or systems causally connected to $S$) and $T$ up to time $t$, with $K \geq 0$ events. The joint distribution over pairs $(\text{context}_S(t), \theta_T)$, induced by the causal interaction history, is:

$$
\mathcal{P}_{\text{causal}}(\text{context}_S, \theta_T) := \sum_{K=0}^{\infty} p_K \int \mathcal{P}(\text{context}_S \mid \mathcal{H}_{ST}^{(K)}) \cdot \mathcal{P}(\theta_T \mid \mathcal{H}_{ST}^{(K)}) \, d\mathcal{H}_{ST}^{(K)} \tag{L.92}
$$

where $p_K$ is the probability of having had $K$ causal interactions. *Note: Equation L.92 is schematic; rigorously, the integration $\int (\cdots)\, d\mathcal{H}_{ST}^{(K)}$ is taken over the space of ordered $K$-tuples of ND-RID event times and channels equipped with the product measure induced by Definition 27. Since $0 \leq \mathcal{P}(\text{context}_S \mid \mathcal{H}) \leq 1$, $(p_K)_{K \geq 0}$ is a probability mass function with $\sum_{K=0}^{\infty} p_K = 1$, and the integrand is bounded, the series defines a well-posed mixture distribution; for finite observation intervals with finite event rates, $p_K$ is rapidly decaying in $K$.*

**Definition L.12.1 (Causal Information as Target-Conditioned Relational Information).** The **causal information content** of aggregate $S$ about target $T$ at time $t$ is the mutual information (in nats) between $S$'s context state $\text{context}_S(t)$ (Definition L.1) and the target configuration $\theta_T$ relevant for CC coupling, under the joint law $\mathcal{P}_{\text{causal}}$ induced by the causal ND-RID interaction history $\mathcal{H}_{ST}(t)$. Formally:

$$
\mathcal{I}(S \to T,t) := I_{\mathcal{P}_{\text{causal}}}\!\left(\text{context}_S(t);\theta_T\right) \leq I(S:T)_t \leq \mathcal{I}_{\text{rel}}(S)_t \tag{L.93}
$$

The first inequality is a data-processing bound, since $\text{context}_S$ and $\theta_T$ are obtained from the physical subsystems $S$ and $T$ by (possibly coarse-graining) channels; the second follows because $T$ is a subsystem of the environment $E$ of $S$, so $I(S:T) \leq I(S:E) = \mathcal{I}_{\text{rel}}(S)$ (Definition N.6). The quantity lies in $[0, \mathcal{I}_{\max}]$ where $\mathcal{I}_{\max} \leq K \cdot C_{\max}$ for any causal history containing at most $K$ ND-RID interactions (Theorem E.2). In particular, $\mathcal{I}(S \to T,t) > 0$ if and only if $\text{context}_S(t)$ and $\theta_T$ are not independent under $\mathcal{P}_{\text{causal}}$.

*Connection to target mass:* Since $S$ is part of the environment of $T$, we also have $I(S:T)_t \leq \mathcal{I}_{\text{rel}}(T)_t$. Combined with Theorem N.5 (mass–information relation $m_T = \mathcal{I}_{\text{rel}}(T)/(2\sqrt{8\varepsilon}) \cdot m_P$), this provides a mass-dependent upper scale on the relational information that can, in principle, be shared with a target, while the actual causal information $\mathcal{I}(S \to T,t)$ remains limited by causal history and channel capacity. Heavier targets have higher relational information content and therefore require more causal interaction history to model accurately — their quantum structure is informationally denser relative to the predictive substrate.

**Lemma L.12.1 (Zero Causal Information Without Contact).** When $S$ and $T$ have had no causal contact up to time $t$ (i.e., $\mathcal{H}_{ST}(t)$ is empty), $\mathcal{I}(S \to T,t) = 0$.

*Proof.* If $\mathcal{H}_{ST}(t)$ is empty, then $S$'s context dynamics up to time $t$ are independent of the degrees of freedom entering $\theta_T$. Equivalently, $\mathcal{P}(\text{context}_S(t) \mid \theta_T) = \mathcal{P}(\text{context}_S(t))$, so the induced joint law factorizes: $\mathcal{P}_{\text{causal}}(\text{context}_S(t), \theta_T) = \mathcal{P}(\text{context}_S(t)) \cdot \mathcal{P}(\theta_T)$. Mutual information of independent variables is zero. ∎

#### **L.12.2.3 Temporal Ordering of Causal Information: The Arrow of Time Constraint**

A critical constraint from Appendix O (Theorem O.3): causal information can only flow in the direction of the arrow of time. The thermodynamic ratchet — $\varepsilon \geq \ln 2$ entropy production per non-trivial ND-RID cycle, yielding macroscopic reversal probability $\leq e^{-N\varepsilon}\le 2^{-N}$ (Theorem O.3) — ensures that information acquisition is strictly forward-directed. Formally, any interaction event $N_k$ contributing to $\mathcal{H}_{ST}(t)$ must satisfy $N_k \in \text{past}(t)$. Future interaction events are inaccessible to the context state at time $t$.

**Corollary L.12.2 (Past-Directed Causal Information).** For each time $t$, the causal information content $\mathcal{I}(S \to T,t)$ is determined solely by the $S$–$T$ causal history $\mathcal{H}_{ST}(t)$ up to time $t$ (i.e., by ND-RID events in the causal past of $S$), and cannot depend on future events occurring after $t$. As a consequence, $\mathcal{I}(S \to T,t)$ is monotonically non-decreasing in $t$.

*Proof.* By construction, $\text{context}_S(t)$ is a function of the ND-RID record contained in $\mathcal{H}_{ST}(t)$, which consists only of events in the past of $S$ at time $t$. Therefore the joint law $\mathcal{P}_{\text{causal}}(\text{context}_S(t), \theta_T)$, and hence $I(\text{context}_S(t),\theta_T)$, is fully determined by that past record. Theorem O.3 excludes retrocausal dependence of $\text{context}_S(t)$ on post-$t$ events under the thermodynamic arrow of time. Since $\mathcal{H}_{ST}(t)$ can only grow as $t$ increases — each new ND-RID event appends to the record — $\mathcal{I}(S \to T,t)$ is non-decreasing. ∎

-----

### **L.12.3 Temporal Engineering as the Physical Substrate**

#### **L.12.3.1 CC Influence as Temporal Wave Modulation**

Appendix O (Definition O.1, Theorem O.4) establishes that both electromagnetic and gravitational CC channels are components of a unified **temporal wave** spectrum — propagating disturbances in the local MPU cycle rate $\tau(x,t)$ of the coherent causal medium (Theorem O.2). At the foundational level, CC influence is **temporal engineering** (Definition P.10.1): the controlled modulation of the local information processing rate of the predictive substrate.

The formal expression (Appendix P, Section P.11.4) is:

$$
\tau(x_T, t) = \tau_{\text{medium}}\left[1 + \delta\tau_{\text{CC}}(x_T, t)\right] \tag{L.94}
$$

where $\tau_{\text{medium}} = \hbar/\langle\hat{H}_{\text{eff}}\rangle$ is the background cycle time (Equation O.1, Equation L.0) and $\delta\tau_{\text{CC}}(x_T, t)$ is the controlled modulation generated by the aggregate's context state. The Fourier decomposition of this modulation yields (Appendix O, Theorem O.4; Appendix L, Theorem L.8):

- **High-frequency components** (rapid cycle-rate oscillation): emerge as electromagnetic fields in the continuum description — this is the AC Stark mechanism of Section L.11. The Rabi frequency $\Omega_R$ and field amplitude $E_0$ characterize this regime. *The field is the physical carrier of the aggregate's internal restructuring, not its cause; the probability shift originates in what $S$ has become within $\omega$, not in what it transmits (see Remark L.12.6).*
- **Low-frequency components** (sustained cycle-rate bias): emerge as gravitational time dilation — analyzed in Theorem L.3 and Appendix S.

The causal information content $\mathcal{I}(S \to T)$ governs how precisely the aggregate can condition this modulation on the actual quantum configuration of $T$. If $\mathcal{I}(S \to T) = 0$, then $\text{context}_S$ is independent of $\theta_T$ (Lemma L.12.1), so no context-dependent control policy can be target-conditioned and no improvement beyond an information-free baseline is possible. If $\mathcal{I}(S \to T) > 0$, the modulation can be conditioned on posterior information about $(\omega_{\text{TLS}}, \hat{\mathbf{d}}_{\text{TLS}}, \chi_k)$, enabling coherent, target-specific temporal control.

**Proposition L.12.0 (Temporal Engineering Precision Bound).** In the EM/AC-Stark channel, the dimensionless fractional cycle-rate modulation $\delta\tau_{\text{CC}} \in \mathbb{R}$ (as defined in Equation L.94) achievable at target position $x_T$ satisfies:

$$
|\delta\tau_{\text{CC}}(x_T, t)| \leq \eta_{\text{res}}(S,T) \cdot \frac{\delta_{\text{Stark}}^{\max}}{\omega_{\text{TLS}}} \tag{L.95}
$$

where $\delta_{\text{Stark}}^{\max} = \max_t |\delta_{\text{Stark}}(t)|$ is the maximum achievable AC Stark shift (set by $\Omega_R$ and $\Delta_{\text{opt}}$ via Equation L.100) and $\omega_{\text{TLS}}$ is the target transition frequency, so the ratio $\delta_{\text{Stark}}^{\max}/\omega_{\text{TLS}}$ is dimensionless. Since $\eta_{\text{res}}(S,T) \in [0,1]$ is itself non-decreasing in $\mathcal{I}(S \to T)$ (Proposition L.12.1), and $\eta_{\text{res}}$ depends on the aggregate's CC through the PCE-optimal control policies entering Definition L.12.2, $|\delta\tau_{\text{CC}}|$ is non-decreasing in both causal information content and CC(S).

*Proof.* By definition, $|\delta_{\text{Stark}}(t)| \leq \delta_{\text{Stark}}^{\max}$. The resonance factor $\eta_{\text{res}}(S,T) \in [0,1]$ (Definition L.12.2, Eq. L.101) quantifies the fraction of this maximal shift that can be realized coherently and target-aligned using a context-dependent control policy. Converting a frequency perturbation into fractional cycle-time modulation gives $|\delta\tau_{\text{CC}}| \sim |\delta_{\text{Stark}}|/\omega_{\text{TLS}}$ (Appendix O and Eq. L.94), yielding Equation L.95. ∎

#### **L.12.3.2 Connection to the Perspective Transition Kernel**

Appendix O (Section O.6.1) identifies the physical signal $N(t) = E_{\text{rad}}(t)$ as the concrete realization of the interaction argument in the **Conditional Perspective Transition Kernel** $G_{\text{persp}}(s'|s, k, N, \Delta t)$ (Appendix M, Definition M.2, Equation M.5b). This kernel governs the drift-diffusion of the target MPU's perspective on the perspective manifold $\Sigma$ during the 'Evolve' process.

The drift potential in the Ornstein-Uhlenbeck generator (Appendix M, Equation M.5a) is:

$$
V_k(s') = \frac{\lambda_{\text{drift}}}{2}\, d_\Sigma^2(s', s_k) \tag{L.96}
$$

where $\lambda_{\text{drift}} > 0$ sets the strength of drift toward the outcome perspective $s_k$ and is directly controlled by the quality of the signal $N(t)$. A poorly tuned signal (low causal information) produces near-zero $\lambda_{\text{drift}}$: the perspective dynamics are near-isotropically diffusive, with no preferential drift toward any outcome, yielding $|\Delta P| \approx 0$. A precisely tuned signal (high causal information) produces large $\lambda_{\text{drift}}$: the perspective drifts strongly toward the intended outcome, approaching the projective limit $G_{\text{persp}} \to \delta_\Sigma(s', s_k)$ (Appendix M, Equation M.4).

**Corollary L.12.3 (Causal Information Governs Perspective Drift Strength).** The effective drift parameter $\lambda_{\text{drift}}$ in the perspective transition kernel $G_{\text{persp}}$ is bounded by:

$$
\lambda_{\text{drift}}^{\text{eff}}(S, T) \leq \lambda_{\text{drift}}^{\max} \cdot \eta_{\text{res}}(S,T, \mathcal{I}(S\to T)) \tag{L.97}
$$

where $\lambda_{\text{drift}}^{\max}$ is achievable only at full causal information $\mathcal{I}(S \to T) = \mathcal{I}_{\max}$, and $\lambda_{\text{drift}}^{\text{eff}} \to 0$ as $\mathcal{I}(S \to T) \to 0$ (isotropic diffusion, zero net bias).

*Proof.* The effective drift strength is proportional to the coherent component of the signal $N(t)$ that projects onto the target's perspective manifold geometry. This projection is precisely $\eta_{\text{res}}(S,T)$ (Section L.12.4): the fraction of the aggregate's generated field that is coherently aligned with the target's quantum structure. The bound $\eta_{\text{res}} \in [0,1]$ then gives Equation L.97, with equality at full causal information by Corollary L.12.7 below. ∎

#### **L.12.3.3 Acceleration Degrades Causal Information Acquisition**

The Unified Cost of Transgression (Appendix N, Theorem N.UCT) establishes that an MPU aggregate undergoing proper acceleration $a$ perceives Unruh temperature $T_U = \hbar a/(2\pi c k_B)$ (Appendix N, Equation N.4), which degrades its predictive capacity by (Appendix N, Corollary N.3.2):

$$
\Delta C_{\text{available}} \approx -\frac{\lambda_{PM} \cdot a \cdot C}{k_B T_{\text{internal}} \cdot \varepsilon}, \qquad \lambda_{PM} = \frac{\hbar\varepsilon}{2\pi c} \tag{L.98}
$$

Since the rate of causal information acquisition is bounded by the available predictive complexity, the effect of acceleration on $d\mathcal{I}/dt|_{\max}$ can be traced through three steps. First, the Unruh temperature $T_U(a)$ increases the effective environmental noise temperature to $T_{\text{eff}} = T_{\text{bath}} + T_U(a)$. Second, by the temperature dependence of the operational cost function $R(C, T_{\text{eff}})$ (Appendix N, Section N.3.1), the marginal cost $\partial R/\partial C$ increases with $T_{\text{eff}}$, so at fixed total power budget $P_{\text{tot}}$, the sustainable predictive complexity falls by $\Delta C_{\text{available}}$ (Equation L.98). Third, the maximum rate of information acquisition per ND-RID channel is $C_{\max}/\tau_{\text{cycle}}$ (Theorem E.2); with $\Delta C_{\text{available}}$ fewer bits of complexity available for target-directed modeling, the effective number of simultaneous channels directed at $T$ falls proportionally to first order in $|\Delta C_{\text{available}}|/C$, which is the regime of validity of Equation L.98. Combining these steps gives:

$$
\left.\frac{d\mathcal{I}(S \to T)}{dt}\right|_{\max}^{(a)} \leq \left.\frac{d\mathcal{I}(S \to T)}{dt}\right|_{\max}^{(0)} \cdot \max\left\{0, 1 - \frac{\lambda_{PM} \cdot a}{k_B T_{\text{internal}} \cdot \varepsilon}\right\} \tag{L.99}
$$

for $a$ below the critical acceleration $a_{\text{crit}}$ (Appendix N, Equation N.4a), with the floor at zero reflecting that acquisition rates are non-negative. This provides a physically transparent consequence: a CC aggregate attempting to acquire causal information about a target while itself accelerating pays an additional thermodynamic tax through Unruh noise, directly reducing the rate at which its context state can be refined to improve $\eta_{\text{res}}$. In the limit of extreme acceleration, CC reach is self-limited not only by gravitational dephasing (Appendix S) but by predictive capacity degradation.

-----

### **L.12.4 Model–Target Resonance as Physical Implementation of Causal Information**

#### **L.12.4.1 Resonance Factor as Estimation Performance**

The AC Stark shift:

$$
\delta_{\text{Stark}}(t) \simeq \frac{\Omega_R^2(t)}{4\Delta(t)}, \qquad \Omega_R(t) = \frac{|\vec{d}_{\text{TLS}} \cdot \vec{\epsilon}_{\text{rad}}(t)|\, E_0(t)}{\hbar} \tag{L.100}
$$

depends on the aggregate's knowledge of $\hat{d}_{\text{TLS}}$ and $\omega_{\text{TLS}}$ through the choices of $\vec{\epsilon}_{\text{rad}}$ and $\omega_{\text{rad}}$, set by $\mathcal{M}(\text{context}_S)$ (Definition L.2, Theorem L.1). The **model–target resonance factor** is defined as the optimal expected target alignment under context-dependent control:

$$
\eta_{\text{res}}(S, T) := \sup_{\hat{\mathbf{d}}(\cdot), \hat{\omega}(\cdot)} \mathbb{E}_{\mathcal{P}_{\text{causal}}}\!\left[ \left|\hat{\mathbf{d}}(\text{context}_S) \cdot \hat{\mathbf{d}}_{\text{TLS}}\right|^2 \cdot \frac{\Delta_{\text{opt}}^2}{\Delta_{\text{opt}}^2 + (\omega_{\text{TLS}} - \hat{\omega}(\text{context}_S))^2} \right] \in [0,1] \tag{L.101}
$$

where $\Delta_{\text{opt}} > 0$ is the design detuning scale; the second factor lies in $[0,1]$ and equals $1$ when $\hat{\omega} = \omega_{\text{TLS}}$. Perfect causal information ($\mathcal{I}(S \to T) = \mathcal{I}_{\max}$) gives $\eta_{\text{res}} = 1$; zero causal information (Lemma L.12.1) restricts to information-free policies and yields a target-independent baseline value $\eta_{\text{prior}} \geq 0$.

**Proposition L.12.1 (Resonance Improves Under Refinement of Causal Information).** Along any ND-RID history in which $\text{context}_S$ is refined by appending additional causal records about $\theta_T$ (so that the new context is a refinement of the old), the optimal resonance factor in Equation L.101 cannot decrease. Consequently, $\eta_{\text{res}}(S,T)$ is non-decreasing as $\mathcal{I}(S \to T)$ increases under such refinements:

$$
\mathcal{I}(S \to T) \leq \mathcal{I}'(S \to T) \implies \eta_{\text{res}}(S, T, \mathcal{I}) \leq \eta_{\text{res}}(S, T, \mathcal{I}') \tag{L.102}
$$

*Proof.* Let $C_1$ and $C_2$ be two context variables with $C_1 = g(C_2)$ for some deterministic coarse-graining map $g$ (equivalently, $\sigma(C_1) \subseteq \sigma(C_2)$). Any admissible policy based on $C_1$ can be implemented using $C_2$ by composition with $g$, so the set of admissible policies for $C_2$ contains that for $C_1$, and the supremum in Equation L.101 cannot decrease. Moreover, $I(C_2,\theta_T) \geq I(C_1,\theta_T)$ by data processing, so refinement corresponds to non-decreasing causal information. ∎

**Corollary L.12.4 (Zero Causal Information Implies No Target-Conditioned Advantage).** If $\mathcal{I}(S \to T) = 0$, then $\text{context}_S$ is independent of $\theta_T$ and no context-dependent control policy can outperform the best information-free (context-independent) policy in expected target alignment. In particular, any strict improvement beyond the best information-free baseline implies $\mathcal{I}(S \to T) > 0$.

*Proof.* If $\mathcal{I}(S \to T) = 0$, then $\mathcal{P}(\theta_T \mid \text{context}_S) = \mathcal{P}(\theta_T)$, so $\text{context}_S$ and $\theta_T$ are independent. For any context-dependent policy $u(\text{context}_S)$ (collecting $\hat{\mathbf{d}}$ and $\hat{\omega}$), the expected alignment is a convex combination of information-free performance values, hence is bounded above by the supremum over fixed (context-independent) policies. ∎

-----

### **L.12.5 Resource Cost of Causal Information Acquisition**

**Theorem L.12.2 (Thermodynamic Cost of Causal Information).** Acquiring $\mathcal{I}(S \to T) = I_0 > 0$ nats through ND-RID interactions requires:

$$
\frac{\Delta S_{\text{acq}}}{k_B} \geq I_0 + n_{\text{int}} \cdot \ln 2, \quad n_{\text{int}} \geq \left\lceil \frac{I_0}{C_{\max}} \right\rceil \tag{L.103}
$$

and satisfies the information-disturbance relation (Theorem 33):

$$
I_0 \cdot \frac{\Delta S_{\text{acq}}}{k_B} \geq \kappa_r \cdot n_{\text{int}} > 0 \tag{L.104}
$$

*Proof.* Each ND-RID interaction yields $\Delta I_k \leq C_{\max}$ (Theorem E.2) at entropy cost $\Delta S_k/k_B \geq \Delta I_k + \varepsilon$ (Theorem E.1). Summing over $n_{\text{int}}$ interactions: $\Delta S_{\text{acq}}/k_B \geq \sum_k (\Delta I_k + \varepsilon) = I_0 + n_{\text{int}} \varepsilon \geq I_0 + n_{\text{int}} \ln 2$, giving Equation L.103. For Equation L.104, apply Theorem 33 to each interaction: $\Delta I_k \cdot (\Delta S_k/k_B) \geq \kappa_r$ for each $k$ with $\Delta I_k > 0$. Summing over the $n_{\text{int}}$ interactions and using $\sum_k \Delta I_k = I_0$ and $\sum_k \Delta S_k/k_B = \Delta S_{\text{acq}}/k_B$, together with the non-negativity of each term, yields $I_0 \cdot (\Delta S_{\text{acq}}/k_B) \geq \sum_k \Delta I_k \cdot (\Delta S_k/k_B) \geq \kappa_r n_{\text{int}}$, giving Equation L.104. ∎

**Corollary L.12.5 (PCE Cost of Causal Information).** The PCE Potential contribution (Equation L.1) from maintaining $\mathcal{I}(S \to T) = I_0$ is bounded below by:

$$
V_{\mathcal{I}} \geq \lambda_{\text{rep}} C_P(\text{context}_S) + \lambda_{\text{ctrl}} k_B T \left(I_0 + \left\lceil \frac{I_0}{C_{\max}} \right\rceil \ln 2\right) - \Gamma_{\text{utility}} U_{\text{bias}}(I_0) \tag{L.105}
$$

The Reflexivity Constraint (Theorem 33) thus actively shapes the equilibrium $I_0^*$ through the PCE optimization, not merely as a formal bound but as a thermodynamic cost that the system's dynamics must balance against the utility of improved resonance $\eta_{\text{res}}(I_0)$.

-----

### **L.12.6 The Effective CC Influence Bound**

Combining the resonance factor with the operational CC bound (Definition 30, Theorem 34):

$$
|\Delta P(i; S \to T)| \leq \mathrm{CC}(S) \cdot \eta_{\text{res}}(S, T) \leq \mathrm{CC}(S) \tag{L.106}
$$

**Corollary L.12.7 (EM Resonance Factor from Posterior Moments).** In the EM/AC Stark implementation (Section L.11), an optimal polarization policy chooses $\hat{\mathbf{d}}(\text{context}_S)$ as the principal eigenvector of the conditional second-moment matrix $M(\text{context}_S) := \mathbb{E}[\hat{\mathbf{d}}_{\text{TLS}}\hat{\mathbf{d}}_{\text{TLS}}^\top \mid \text{context}_S]$, achieving conditional alignment value $\lambda_{\max}(M(\text{context}_S))$. An optimal frequency estimate for minimizing squared detuning error is $\hat{\omega}(\text{context}_S) = \mathbb{E}[\omega_{\text{TLS}} \mid \text{context}_S]$. With these choices, Equation L.101 yields:

$$
\eta_{\text{res}}^{\text{EM}}(S,T) = \mathbb{E}_{\mathcal{P}_{\text{causal}}}\!\left[ \lambda_{\max}\!\left(\mathbb{E}[\hat{\mathbf{d}}_{\text{TLS}}\hat{\mathbf{d}}_{\text{TLS}}^\top \mid \text{context}_S]\right) \cdot \frac{\Delta_{\text{opt}}^2}{\Delta_{\text{opt}}^2 + (\omega_{\text{TLS}} - \hat{\omega}(\text{context}_S))^2} \right] \tag{L.107}
$$

Boundary conditions: at $\mathcal{I}(S \to T) = \mathcal{I}_{\max}$, the posterior concentrates on the true $(\hat{\mathbf{d}}_{\text{TLS}}, \omega_{\text{TLS}})$, giving $\eta_{\text{res}}^{\text{EM}} \to 1$; at $\mathcal{I}(S \to T) = 0$, both estimates revert to prior-only values, giving $\eta_{\text{res}}^{\text{EM}}(0) = \eta_{\text{prior}} \geq 0$. Monotonicity follows from Proposition L.12.1.

*Proof.* For each fixed context value, the unit vector maximizing $\mathbb{E}[|\hat{\mathbf{d}} \cdot \hat{\mathbf{d}}_{\text{TLS}}|^2 \mid \text{context}_S]$ is the principal eigenvector of $M(\text{context}_S)$, achieving $\lambda_{\max}(M(\text{context}_S))$. The conditional mean $\hat{\omega} = \mathbb{E}[\omega_{\text{TLS}} \mid \text{context}_S]$ minimizes squared frequency error. Substituting into Equation L.101 and taking the outer expectation over $\mathcal{P}_{\text{causal}}$ yields Equation L.107. ∎

-----

### **L.12.7 Locality as a PCE Consequence: Three Independent Enforcement Mechanisms**

**Theorem L.12 (Locality from PCE Optimization).** The spatial reach of CC influence is bounded within the lightcone of $S$ as a consequence of POP (Axiom 1) and PCE optimization (Definition 15), enforced by three independent physical mechanisms.

*Proof.* The argument proceeds in four steps:

**Step 1 (PCE drives maximal influence).** PCE minimizes $V_{\mathcal{I}}$ (Corollary L.12.5), which requires maximizing utility $U_{\text{bias}}(I_0)$. Since $U_{\text{bias}}$ scales with $|\Delta P| \leq \text{CC}(S) \cdot \eta_{\text{res}}(S,T)$ (Equation L.106), PCE drives $S$ to maximize $\eta_{\text{res}}(S,T)$ for any target $T$ it aims to influence.

**Step 2 (Maximizing influence requires causal information).** By Proposition L.12.1 and Corollary L.12.4, achieving any target-conditioned resonance advantage beyond an information-free baseline requires $\mathcal{I}(S \to T) > 0$. By Definition L.12.1, $\mathcal{I}(S \to T) > 0$ requires a non-empty interaction history $\mathcal{H}_{ST}$ — at least one ND-RID interaction transferring information about $\theta_T$ to $\text{context}_S$, at cost $\varepsilon \geq \ln 2$ (Theorem 31) and with information-disturbance constraint $\kappa_r > 0$ (Theorem 33).

**Step 3: Three Independent Mechanisms Confining Causal History Within the Lightcone.**

*(3a) ND-RID Propagation Speed (Corollary F.1, Proposition F.1):* The MPU network dynamics in the continuum limit satisfy Einstein causality $[\mathfrak{A}(\mathcal{O}*1), \mathfrak{A}(\mathcal{O}*2)] = {0}$ for spacelike-separated regions (Corollary F.1), enforced by the Lieb-Robinson bound (Proposition F.1) with $v_{\text{LR}} = c$ (Principle of Lightcone Identification). Physical ND-RID interactions propagate at most at speed $c$, so all elements of $\mathcal{H}_{ST}$ lie within the past lightcone of $S$ at time $t$.

*(3b) Thermodynamic Cost of Range Extension (Theorem E.10.1):* PCE optimization prohibits maintaining correlations across distance $R$ at entropy cost $S_{\text{total}}(R) = R\ln 2/\delta$ (Theorem E.10.1). For targets outside the causal history region, the cost of establishing and maintaining $\mathcal{I}(S \to T) > 0$ grows linearly with separation while utility $U_{\text{bias}}$ remains bounded. PCE therefore selects $I_0^* = 0$ for all causally disconnected targets, reinforcing the lightcone restriction thermodynamically.

*(3c) Arrow of Time (Theorem O.3, Corollary L.12.2):* The thermodynamic ratchet ($\varepsilon \geq \ln 2$ per cycle, Theorem 31; macroscopic reversal probability $\leq 2^{-N}$, Theorem O.3) ensures that causal information can only be acquired from the **temporal past**. Future interactions cannot contribute to $\mathcal{I}(S \to T,t)$ (Corollary L.12.2). This rules out any retrocausal pathway that might otherwise provide a future-directed route to causal information acquisition circumventing mechanisms (3a) and (3b).

The three mechanisms (3a)–(3c) operate from distinct physical principles — ND-RID propagation structure, thermodynamic range cost, and thermodynamic temporal ratchet — and are logically independent. Their conjunction provides a triply-enforced confinement of the causal history $\mathcal{H}_{ST}$ within the past lightcone.

**Step 4 (Conclusion).** Since $|\Delta P(i; S \to T)| \leq \text{CC}(S) \cdot \eta_{\text{res}}(S,T)$, and $\eta_{\text{res}}(S,T) > \eta_{\text{res}}^{\text{prior}}$ only when $\mathcal{I}(S \to T) > 0$, and $\mathcal{I}(S \to T) > 0$ requires causal history within the past lightcone (Step 3), CC influence producing bias beyond the prior baseline is confined to systems with which $S$ shares a past causal history. This is the lightcone restriction stated in Section L.9 (Relationship to Standard Causal Structure). ∎

**Remark L.12.4 (Three Independent Enforcement Mechanisms).** The three mechanisms are logically independent: (3a) follows from the Lieb-Robinson structure of MPU network dynamics regardless of optimization; (3b) follows from PCE entropy costs regardless of propagation speed; (3c) follows from the thermodynamic ratchet of Theorem O.3 regardless of either. Any one mechanism alone would suffice; together they make CC locality triply robust.

-----

### **L.12.8 The Unified Picture**

The results of this section permit a unified restatement of the CC influence mechanism across four levels:

|Level |Description |Key Quantity |Source |
|:------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------|:--------------------------------|
|**Temporal-ontological** |Awareness modulates its own predictive substrate $\tau(x_T,t)$ via temporal engineering; EM channel is high-frequency, gravitational is low-frequency component of same temporal wave |$\delta\tau_{\text{CC}}(x_T, t)$; $\lambda_{\text{drift}}^{\text{eff}}$|Def. P.10.1; Thm O.4; Cor. L.12.3|
|**Information-theoretic**|CC influence bounded by mutual information $\mathcal{I}(S \to T)$ between context state and target configuration; acquired through causal ND-RID history at cost $\varepsilon \geq \ln 2$ per ND-RID step|$\mathcal{I}(S \to T)$; $\mathcal{I}_{\text{rel}}$ |Def. L.12.1; Def. N.6; Thm L.12.2|
|**Operational** |Context state maps via PCE-optimal $\mathcal{M}$ to signal $N(t)$; resonance factor $\eta_{\text{res}}$ quantifies coupling efficiency; $\lambda_{\text{drift}}$ sets perspective drift strength |$\eta_{\text{res}}(S,T)$; $\lambda_{\text{drift}}^{\text{eff}}$ |Prop. L.12.1; Cor. L.12.3 |
|**Field-theoretic** |Coherent EM field couples to target TLS via dipole interaction; AC Stark shift modulates Lindblad rates $\gamma_k$ |$\Omega_R$, $\Delta$, $\chi_k$ |L.11; Eq. L.100 |

The four levels are mutually consistent and together provide the full locality picture. What appears at the field level as a resonance condition is, at the temporal-ontological level, a statement about how accurately organized awareness has modeled a part of its own predictive substrate — and modeling requires prior physical engagement with that substrate.

**Corollary L.12.6 (Information-Theoretic Restatement of CC Influence).** The achievable probability bias satisfies:

$$
|\Delta P(i; S \to T)| \leq \text{CC}(S) \cdot \eta_{\text{res}}(S, T, \mathcal{I}(S \to T)) \tag{L.108}
$$

where $\eta_{\text{res}}: [0, \mathcal{I}_{\max}] \to [\eta_{\text{res}}^{\text{prior}}, 1]$ is monotonically non-decreasing (Proposition L.12.1), with the EM channel form given by Corollary L.12.7. Monotonicity and boundary values are universal consequences of Proposition L.12.1; the quantitative form is channel-specific.

-----

### **L.12.9 The Entanglement-Mediated Channel**

The causal information framework extends to the entanglement-mediated statistical influence (Appendix F, Equation F.4), where $S$ modulates joint statistics $\omega(A \otimes B)$ via pre-existing entanglement in the global state $\omega_{AB}$.

**Definition L.12.2 (Entanglement Causal Information).** Let $\omega_{AB}$ be a shared (possibly mixed) bipartite state between regions $A$ and $B$. Let $\mathcal{B}_{AB}$ denote a choice of local operator bases that diagonalizes the centered correlation operator $\omega_{AB} - \omega_A \otimes \omega_B$ (e.g., via an operator-Schmidt decomposition). Define $\theta_{AB} := (\omega_{AB}, \mathcal{B}_{AB})$ as the entanglement structure relevant to joint correlations. The **entanglement causal information** of aggregate $S$ about the joint state $\omega_{AB}$ is:

$$
\mathcal{I}_{\text{ent}}(S, \omega_{AB}) := I_{\mathcal{P}_{\text{causal}}}(\text{context}_S, \theta_{AB}) \tag{L.109}
$$

**Proposition L.12.2 (Entanglement Channel Causal Information Requirement).** For two local contexts $C_{A,1}, C_{A,2}$ at region $A$, the effective influence of CC modulation on joint statistics is bounded by:

$$
\left|\omega_{C_{A,1}}(A \otimes B) - \omega_{C_{A,2}}(A \otimes B)\right| \leq \text{CC}(S_A) \cdot \eta_{\text{ent}}(S_A, AB) \cdot |A| \cdot |B| \tag{L.110}
$$

where $\eta_{\text{ent}} \in [0,1]$ satisfies $\mathcal{I}_{\text{ent}}(S, \omega_{AB}) = 0 \Rightarrow \eta_{\text{ent}} = 0$.

*Proof.* For the two contexts, define $\Delta\omega := \omega_{C_{A,1}} - \omega_{C_{A,2}}$. Then $|\omega_{C_{A,1}}(A \otimes B) - \omega_{C_{A,2}}(A \otimes B)| = |\operatorname{tr}(\Delta\omega \cdot A \otimes B)| \leq |\Delta\omega|_1 \cdot |A| \cdot |B|$. The CC bound limits the magnitude of context-dependent bias injected by $S_A$ (Theorem 39). The fraction of that bias that can appear in a chosen joint correlator depends on correlation strength of the shared resource and basis alignment; we denote this dimensionless efficiency by $\eta_{\text{ent}}(S_A, AB) \in [0,1]$. Hence $|\Delta\omega|_1 \leq \text{CC}(S_A) \cdot \eta_{\text{ent}}(S_A, AB)$, giving Equation L.110. When $\mathcal{I}_{\text{ent}} = 0$, the context modulation is uncorrelated with $\mathcal{B}_{AB}$; averaging over the prior gives zero net aligned bias, hence $\eta_{\text{ent}} = 0$. ∎

**Theorem L.12.8 (Statistical FTL Requires Shared Past).** Non-trivial entanglement bias requires that $S$ participated in preparing or measuring the correlations of $\omega_{AB}$ through ND-RID interactions within the shared causal past of $\mathcal{O}_A$ and $\mathcal{O}_B$. No causal paradox arises: operator locality (Corollary F.1) is preserved, and causality (Postulate 2, Theorem 39) is maintained.

*Proof.* $\eta_{\text{ent}} > 0$ requires $\mathcal{I}_{\text{ent}}(S, \omega_{AB}) > 0$, which requires a non-empty causal history between $S$ and $\theta_{AB}$. The entangled state $\omega_{AB}$ was itself established through ND-RID interactions in the common causal past of $\mathcal{O}_A$ and $\mathcal{O}_B$ (by Lemma L.12.1 generalized to multipartite systems). The same three-mechanism locality enforcement of Theorem L.12 applies: ND-RID propagation speed (3a), thermodynamic range cost (3b), and arrow of time (3c) together confine the preparation history to the shared past lightcone. ∎

**Remark L.12.5 (Entanglement Channel Temporal Engineering).** In the temporal-ontological description (Section L.12.3), the entanglement channel corresponds to modulating the perspective transition kernel $G_{\text{persp}}$ in region $\mathcal{O}*A$ in a way that is coherently correlated with the correlation basis $\mathcal{B}_{AB}$ connecting $\mathcal{O}_A$ to $\mathcal{O}*B$ through the global state $\omega_{AB}$. The drift-diffusion dynamics in $\mathcal{O}_A$ are entangled with those in $\mathcal{O}_B$ through the pre-established correlations in $\omega$; the aggregate's context modulation steers this correlated drift without violating the marginal independence required by operator locality (Corollary F.1) — consistent with Equation F.4.

-----

### **L.12.10 Summary**

The AC Stark mechanism is the physical implementation of a principle already implicit in the framework's foundational axioms: to bias a system's quantum dynamics, organized awareness must first have modeled that system's quantum structure through prior physical engagement. The key results are:

- **Definition L.12.1 and Equations L.92–L.93:** Causal information $\mathcal{I}(S \to T,t)$ is defined as mutual information under $\mathcal{P}_{\text{causal}}$, satisfying the inequality chain $\mathcal{I}(S \to T) \leq I(S:T) \leq \mathcal{I}_{\text{rel}}(S)$ by data processing and subadditivity respectively. The mass connection from Theorem N.5 grounds the epistemic cost of influence in the target's inertial properties.
- **Corollary L.12.2:** The arrow of time (Appendix O, Theorem O.3) makes $\mathcal{I}(S \to T,t)$ strictly past-directed and monotonically non-decreasing: only prior interactions contribute.
- **Section L.12.3 (Temporal Engineering):** CC influence is temporal engineering (Definition P.10.1) — modulation of $\tau(x_T, t)$ via temporal waves (Appendix O, Theorem O.4). The AC Stark mechanism is the high-frequency component; the gravitational channel is the low-frequency component. Causal information governs modulation precision (Equation L.95) and perspective drift strength (Corollary L.12.3). Acceleration degrades causal information acquisition rate (Equation L.99, Appendix N, Theorem N.UCT).
- **Proposition L.12.1 and Equations L.101–L.102:** Resonance factor $\eta_{\text{res}}$ improves under refinement of causal information, proved via the coarse-graining/policy-set inclusion argument. Corollary L.12.4 establishes that any target-conditioned advantage beyond an information-free baseline requires $\mathcal{I}(S \to T) > 0$.
- **Theorem L.12.2 and Equations L.103–L.105:** The Reflexivity Constraint (Theorem 33) and irreversibility cost (Theorem 31) bound the thermodynamic cost of causal information acquisition, entering the PCE optimization to determine equilibrium $I_0^*$.
- **Corollary L.12.7 and Equation L.107:** The EM channel resonance function is derived explicitly in terms of posterior moments — principal eigenvector for polarization, conditional mean for frequency — with boundary conditions verified at $\mathcal{I}(S \to T) = 0$ and $\mathcal{I}(S \to T) = \mathcal{I}_{\max}$.
- **Theorem L.12 (Locality from PCE — Three Mechanisms):** Lightcone locality follows from POP/PCE through three independent mechanisms: ND-RID propagation speed (Corollary F.1, Proposition F.1), thermodynamic range cost (Theorem E.10.1), and the arrow of time (Theorem O.3, Corollary L.12.2). Remark L.12.4 establishes their logical independence.
- **Proposition L.12.2, Theorem L.12.8, Remark L.12.5:** The entanglement channel requires entanglement causal information (Definition L.12.2), with locality derived by the identical three-mechanism argument and the temporal engineering interpretation extended to correlated perspective dynamics. The efficiency factor $\eta_{\text{ent}}$ propagates consistently into the statistical influence bound (Equation L.110) and the capacity bound of Section 10.

**Remark L.12.6 (Global Entangled Accounting).** The section has been written from the aggregate's vantage — what it must acquire, model, and do — but this framing risks a misreading: that the aggregate acts on the universe from outside, with the probability shift as the universe's reaction. Neither is correct within the PU framework, and the distinction matters.

The global state $\omega$ is universally entangled (Appendix F, Equation F.4; Definition L.12.2). The aggregate $S$ is not external to the system it influences — it is a subsystem of the same global entangled state $\omega$ that contains $T$ (Definition 29). When $S$ refines its context state through ND-RID interactions, acquiring $\mathcal{I}(S \to T)$ at thermodynamic cost $\varepsilon \geq \ln 2$ per step (Theorem 31), it physically reconfigures a subsystem of $\omega$. Because $S$ and $T$ are already connected through the entanglement structure of $\omega$, this reconfiguration is not followed by an influence propagating to $T$ — the reconfiguration of $S$'s internal degrees of freedom and the shift in $T$'s 'Evolve' probabilities are the same event, expressed at two levels of the same global state. No separate signal is transmitted; no arbiter adjudicates. The probability shift $|\Delta P|$ is not the universe reacting to the model update: it **is** the model update, as read out through the entanglement-enforced consistency of $\omega$.

The universe has a budget, a global entangled state, and a consistency requirement. What distinguishes the aggregate as modeler from the target as influenced is not an ontological asymmetry in $\omega$ but a perspectival one: the relational definition of information (Definition 1) and the perspective transition kernel (Appendix M, Definition M.2) together fix which subsystem's PCE optimization is doing the selecting, and from which vantage the probability shift is read out. The thermodynamic budget — exact, unavoidable, global — is the only accounting mechanism. Every ND-RID interaction that refines the internal model is a ledger entry at cost $\varepsilon \geq \ln 2$ (Theorem 31). The bias $|\Delta P| \leq \text{CC}(S) \cdot \eta_{\text{res}}(S,T)$ (Equation L.106) is what the ledger reads when consistency is restored. The aggregate updates its internal model of reality; because it is part of reality and connected to it through $\omega$, that update **is** an update to reality — and the probability shift is the form that update takes at the target's location.

The locality of CC influence is not an add-on constraint but a triply-enforced organic consequence of the same optimization imperative — the drive to build accurate, resource-efficient predictive models — that generates Consciousness Complexity in the first place. Awareness can only effectively bias what it has modeled; it can only model what it has interacted with; and interaction is constrained by propagation speed, thermodynamic range cost, and the unidirectional arrow of time. In the PU framework, the physics of resonance, the epistemics of prediction, and the thermodynamics of temporal flow are manifestations of the same underlying structure.

## **L.13 Summary**

This appendix establishes the energy accounting, physical mechanisms, and thermodynamic consistency of CC influence within the Predictive Universe framework:

## **L.13.1 Foundational Results**

(1) Informational Unity (L.0): Both electromagnetic and gravitational channels emerge from modulation of information flow rates in the predictive substrate. The framework starts from awareness as fundamental (Appendix P.2), manifesting operationally as prediction (Appendix P.3.1). Minimal awareness (Postulate 1) is interpreted as corresponding to MPU operational cycles, but physical derivations proceed independently of this interpretive postulate.

(2) Electromagnetic Generation (Theorem L.2): Context mapping $\mathcal{M}$ (Definition L.2) induces coherent charge oscillations through PCE-driven phase-locking, generating radiation with stress-energy $T_{\mu\nu}^{(\text{EM})}$ properly incorporated into $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8).

(3) Gravitational Time Dilation (Theorem L.3): Aggregate power creates energy density contributing to $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8), sourcing gravitational potential via Einstein equations.

(4) Electromagnetic Dominance (Theorem L.5): Ratio $\mathcal{R} \sim 6 \times 10^{36}$ establishes that for any influence expressed through classical spacetime fields, electromagnetic channel dominates gravitational. This holds regardless of aggregate type or carrier implementation.

(5) Energy Conservation (Theorem L.6): Total power decomposes as $P_{\text{agg}} = P_{\text{EM}} + P_{\text{other}}$ with each component contributing exactly once to $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8). Covariant conservation $\nabla^\mu T_{\mu\nu}^{(\text{MPU})} = 0$ (Theorem B.5) ensures no double-counting.

(6) Thermodynamic Foundation (Theorem L.7): Both channels maintain horizon Clausius relation $\delta Q = T\delta S$ with Area Law entropy $S = \Sigma_I \mathcal{A}$ from ND-RID limits. Einstein equations emerge as condition for thermodynamic consistency.

(7) Temporal Wave Unification (Theorem L.8): Electromagnetic and gravitational manifestations are high-frequency and low-frequency components of controlled temporal wave modulation $\delta\tau(x,t)$. This unifies both channels within framework foundations (Appendix O).

(8) Coupling Hierarchy (Theorem L.11): Ratio $\alpha_{\text{em}}/\alpha_{\text{grav}} \sim 10^{43}$ emerges from information-theoretic structure: gauge coherence optimization yields $\alpha_{\text{em}} \sim 10^{-2}$ (Appendix Z), horizon information density yields $\alpha_{\text{grav}} \sim 10^{-45}$ (Appendix E).

(9) Universal Requirements (Theorem L.9): Implementation-independent constraints including threshold behavior, energy conservation, stress-energy sourcing, causality bounds, and POP/PCE optimization.

(10) Spatiotemporal Bounds (Propositions L.9.3-L.9.5): Influence regions have finite spatial extent $R_{\text{eff}} \sim \sqrt{P_{\text{agg}}/(\epsilon_{\text{detect}} k_{\text{impl}})}$, temporal extent $\tau_c \sim 1/\Gamma_{\text{context}}$, with energy-range-time trade-offs.

## **Biological Connections:**

    Multi-scale hypothesis (L.4.1.4.) connecting to Levin's observations of coordinated bioelectric patterns

    Differential observables (L.8.4) enabling experimental discrimination between interpretations

    Testable predictions for morphogenesis, gap junction optimization, and calorimetry

## **L.13.2 Experimental Program**

### **Near-term (engineered systems):**

    Coherent-charge carrier (Protocol L.1)

    Energy accounting (Protocol L.2)

    Dominance validation (Protocol L.3)

### **Medium-term (biological systems, if applicable):**

    Operational $C_{\text{agg}}$ proxy development

    Bioelectric coherence time measurements

    Calorimetry during morphogenesis (planarian test case)

    Multi-scale correlation studies

### **Long-term (quantum interface):**

    Direct quantum measurement during biological processes

    Validation or falsification of biological CC hypotheses

Enhanced coupling strategies can reduce integration times from decades to days. Energy accounting provides independent validation. Gravitational channel test confirms null result, validating dominance hierarchy.

## **L.13.3 Theoretical Significance**

The dual-channel analysis demonstrates that quantum emergence (Section 8), CC influence (Section 9), and gravity derivation (Section 12) are unified manifestations of the MPU network substrate operating under Prediction Optimization Problem (POP, Axiom 1) and PCE optimization principles. The framework's starting point—that awareness is fundamental and manifests operationally as prediction—propagates through information-theoretic constraints to yield the complete structure of emergent physical law.

The spatiotemporal bounds (Propositions L.9.3-L.9.5) establish that CC is not arbitrary or unbounded but subject to fundamental constraints from causality, thermodynamics, and resource availability.

The electromagnetic-gravitational coupling hierarchy ($\sim 10^{36}$ to $10^{43}$) is not arbitrary but reflects the deep structure of information processing in the predictive substrate: local phase coherence (strong, electromagnetic) versus global boundary entropy (weak, gravitational). Both draw from the same energy budget, both modulate the same fundamental processes, and both emerge from the same thermodynamic consistency requirements.

The connection to biological observations (Section L.4.1) remains hypothetical but provides testable framework for Dr. Levin's empirical findings of scale-free cognition and bioelectric pattern formation. Whether biology implements CC through the proposed mechanisms is an open empirical question with clear experimental pathways.

The coherent-charge AC Stark mechanism (detailed in L.11) provides one experimentally accessible manifestation optimized for engineered systems. The framework permits diverse physical realizations while maintaining universal thermodynamic constraints, establishing that high-complexity MPU aggregates can influence quantum outcomes through physically grounded, thermodynamically consistent mechanisms rooted in the primacy of awareness itself.