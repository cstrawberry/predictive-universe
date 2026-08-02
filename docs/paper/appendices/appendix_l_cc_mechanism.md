# Appendix L: Unified Foundation — Energy Accounting and Thermodynamic Consistency

## **L.0 Foundational Insight: Awareness as Primary**

The Predictive Universe framework begins from the irreducible certainty of awareness itself. The starting point is the Cartesian cogito ergo sum—"I think, therefore I am"—which establishes awareness as the one indubitable fact of existence. However, within the operational context of this framework, thinking is fundamentally predictive: to think is to anticipate, to form expectations about what comes next, to distinguish self from non-self through anticipatory models. Thus we reformulate: praedico ergo sum—"I predict, therefore I am."

This is not a claim that prediction produces awareness. Rather, awareness is fundamental and irreducible (Appendix P.2), and prediction represents awareness's most primitive operational manifestation—not because prediction produces awareness, but because awareness, being primary, makes prediction possible (Appendix P.3.1). The capacity to form anticipations, to distinguish expected from actual, to adaptively update models—these are the minimal expressions of awareness in physical systems.

**Interpretive note (outside the deductive premise ledger).** One may interpret the complete operational MPU cycle—prediction ($P_{\text{int}}$), verification ($V$), and update ($D_{\text{cyc}}$), including the 'Evolve' interaction—as a minimal physical correlate of awareness. No theorem, proposition, corollary, numerical estimate, energy ledger, thermodynamic conclusion, or coupling hierarchy in this appendix uses that interpretation as a hypothesis. The formal arguments use only the operational MPU definitions and the explicitly cited logical, thermodynamic, carrier, and branch premises.

The framework is compatible with idealist metaphysics: awareness need not emerge from physical processes; rather, physical processes are most parsimoniously understood as patterns within awareness (Appendix P.2.3). The MPU formalism models awareness operationally.

Within the declared awareness-first interpretation, POP and PCE organize finite predictive activity under resource constraints. The mathematical results below use the explicit MPU, carrier, response, and energy-ledger premises stated in their theorem bodies; the interpretive priority of awareness does not by itself derive a Hilbert carrier, electromagnetic current, metric response, CC outcome shift, or physical coupling.

## **The Core Informational Comparison**

Appendix O, Theorem O.2 supplies a synchronized processing rhythm on its coherent-medium branch. Choose an energy origin for $\hat H_{\text{eff}}$ and assume $0<\langle\hat H_{\text{eff}}\rangle<\infty$. On this branch define
$$
\tau_{\text{medium}}
:=
\frac{\hbar}{\langle\hat H_{\text{eff}}\rangle}.
\tag{L.0}
$$
This is an operational convention relative to the chosen energy origin, not an invariant energy-time equality. Appendix O calls a modulation of the registered rhythm a temporal wave.

A temporal modulation has an electromagnetic interpretation only after an accepted Maxwell-carrier record supplies a conserved current, gauge field, source geometry, and nonzero radiating multipole. It has a gravitational interpretation only after an accepted metric branch supplies a complete conserved stress tensor, continuum limit, and Einstein-response map. Fourier frequency alone identifies neither channel and does not prove that they are one mechanism.

When electromagnetic radiation and retained matter energy occur in one implementation, a non-overlapping ledger may charge both to the aggregate input power $P_{\text{agg}}$. Their target responses remain distinct functions. A numerical electromagnetic-to-gravitational comparison requires a common source, target, geometry, retention fraction, units, and covariance ledger.

## **Scope and Organization of This Appendix**

The appendix provides:

1. context-state and mapping definitions for a declared CC implementation;
2. a conditional coherent-charge/AC-Stark candidate construction for engineered systems;
3. energy, reset, conservation, locality, and stress-energy obligations that every claimed implementation must satisfy; and
4. preregistered tests that distinguish a target response from source leakage, ordinary field effects, selection artifacts, and underpowered null results.

The coherent-charge construction is a candidate implementation class, not an existence proof that high complexity causes a quantum-outcome shift. Biological carrier proposals remain hypotheses. Physical CC closure requires one preregistered record containing a source state, causal carrier, context-to-generator map, normalized target instrument, nonzero effect with sign and interval, non-overlapping energy/reset ledgers, artifact controls, and blinded replication, compatible with the selected locality branch.
## **L.1 Context State and Constraints on Mapping $\mathcal{M}$**

The CC hypothesis posits that a complex aggregate's internal state influences local MPU interactions. We formalize this "internal state" in this context.

## **Definition L.1 (Context State $\text{context}_S$)**

Let $\rho_{\mathrm{agg}}(t)$ be the aggregate density operator of an MPU aggregate $S$ (Definition 29) on $\mathcal H_{\mathrm{agg}}$. Let $\mathcal O_{\mathrm{full}}=\{\hat O_\gamma\}_{\gamma\in\mathcal G}$ be a specified family of bounded self-adjoint observables that separates the admissible density operators: if $\operatorname{tr}(\rho\hat O_\gamma)=\operatorname{tr}(\rho'\hat O_\gamma)$ for every $\gamma$, then $\rho=\rho'$. Under this informational-completeness hypothesis, the full expectation family determines the admissible state.

Choose a class of admissible control policies and a utility functional. A finite observable subfamily $\{\hat O_\alpha\}_{\alpha\in\mathcal I}$ is operationally sufficient for that control problem when every admissible control output and every utility value used by the POP objective factor through the vector $\big(\operatorname{tr}(\rho\hat O_\alpha)\big)_{\alpha\in\mathcal I}$. It is inclusion-minimal when no proper subfamily has this factorization property. Assume that at least one finite operationally sufficient family exists and that the optimization below attains a minimum over the registered candidate families.

For each candidate family define
$$ V_{\text{context}}[\{\hat{O}_\alpha\}] = \lambda_{\text{rep}} C_P(\{\hat{O}_\alpha\}) + \lambda_{\text{ctrl}} R_{\text{cost}}(\{\hat{O}_\alpha\}) - \Gamma_{\text{utility}} U_{\text{bias}}(\{\langle\hat{O}_\alpha\rangle\}). \tag{L.1} $$
The weights carry whatever conversion units are required to make the three terms commensurate. PCE selects a minimizing family. Minimal sufficiency is an additional registered property of that minimizer; it follows only if every deletion destroys operational sufficiency and every admissible addition has nonnegative net marginal value in $V_{\text{context}}$.

For a selected finite, self-adjoint family, define
$$ \text{context}_S(t) := \begin{pmatrix} \langle \hat{O}_{\alpha_1} \rangle_t \\ \langle \hat{O}_{\alpha_2} \rangle_t \\ \vdots \\ \langle \hat{O}_{\alpha_{|\mathcal{I}|}} \rangle_t \end{pmatrix} \in \mathcal{C}_{\text{ctx}} \subseteq \mathbb{R}^{|\mathcal{I}|}. \tag{L.2} $$
Only the physically instantiated state enters these expectation values; semantic truth by itself is not a control variable.

## **Definition L.2 (Context-to-Control Mapping)**

The mapping $\mathcal M:\mathcal C_{\text{ctx}}\to\mathcal P_{\text{control}}$ translates a context vector into physically realizable control parameters. POP-admissibility is a registered property relative to specified norms, a cost model, and a feedback law. It requires:

(i) For a declared asymptotic family indexed by $C_{\text{agg}}$, an explicit implementation bound such as $C_{\mathcal M}(C_{\text{agg}})\le p(\log C_{\text{agg}})$ for a stated polynomial $p$ and all $C_{\text{agg}}\ge C_*$.

(ii) A registered resource bound such as $R_{\mathcal M}\le\eta_{\text{cost}}R_{\text{core}}(C_{\text{agg}})$ with $0\le\eta_{\text{cost}}<1$.

(iii) The Lipschitz, bounded-range, bounded-cost, invariant-domain, and contraction hypotheses stated in Lemma L.1 whenever its stability conclusions are used.

PCE may optimize over mappings satisfying these conditions. Minimization of an unspecified PCE potential does not itself imply them.

## **Lemma L.1 (Consequences of Registered Mapping Bounds)**

Let $\mathcal C_{\mathrm{ctx}}$ be a complete metric space and let $\mathcal P_{\mathrm{control}}$ be finite-dimensional. Assume an admissible mapping $\mathcal M:\mathcal C_{\mathrm{ctx}}\to\mathcal P_{\mathrm{control}}$ satisfies
$$ \|\mathcal M(c_1)-\mathcal M(c_2)\|_{\mathcal P}\le L_{\mathcal M}\|c_1-c_2\|_{\mathcal C}, $$
$$ \|\mathcal M(c)\|_{\mathcal P}\le P_{\max}, $$
and assume the feedback map has the form $c_{n+1}=F(\mathcal M(c_n))$, maps $\mathcal C_{\mathrm{ctx}}$ into itself, and has Lipschitz constant $L_F$ with $L_FL_{\mathcal M}<1$. Assume also that the physical cost is bounded on the closed control ball of radius $P_{\max}$.

Then finite-variance context noise produces finite-variance control noise, every realized control has finite registered cost, and the feedback iteration has a unique globally attracting state.

*Proof.* If $C,C'$ are independent copies of a square-integrable random context, then
$$
\mathbb E\|\mathcal M(C)-\mathcal M(C')\|_{\mathcal P}^2
\le L_{\mathcal M}^2\mathbb E\|C-C'\|_{\mathcal C}^2<\infty,
$$
so the control variance is finite. The range bound places every control in the stated ball, on which the registered cost is bounded by hypothesis. Finally,
$$
\|F(\mathcal M(c_1))-F(\mathcal M(c_2))\|_{\mathcal C}
\le L_FL_{\mathcal M}\|c_1-c_2\|_{\mathcal C}.
$$
Because $L_FL_{\mathcal M}<1$, the Banach contraction theorem gives a unique attracting state and convergence from every initial context in $\mathcal C_{\mathrm{ctx}}$. These are admissibility consequences; PCE can compare their costs but does not imply the hypotheses by minimization alone. ∎

## **Theorem L.1 (Existence of a PCE-Optimal Mapping on a Compact Admissible Class)**

Assume the admissible class of mappings satisfying Lemma L.1 is nonempty and compact in the chosen topology on the mapping space, and assume both $\Delta PP(\mathcal{M})$ and $R_{\mathcal{M}}(\mathcal{M})$ are continuous on that class. Under POP/PCE optimization dynamics (Section 6, Appendix D), there exists a mapping $\mathcal{M}$ maximizing the net predictive benefit
$$ \mathcal{F}[\mathcal{M}] = \Gamma_0 \Delta PP(\mathcal{M}) - \lambda R_{\mathcal{M}}(\mathcal{M}) \tag{L.3} $$
subject to the resource constraints, where $\Gamma_0$ is the power-conversion factor (Definition 20), $\Delta PP$ is improvement in predictive performance, $\lambda$ is effective resource scarcity (Definition 20), and $R_{\mathcal{M}}$ is the operational cost of implementing $\mathcal{M}$.

*Proof.* By assumption, the admissible class of mappings satisfying Lemma L.1 is compact, and the functional $\mathcal{F}$ is continuous on that class because it is a linear combination of the continuous functionals $\Delta PP$ and $R_{\mathcal{M}}$. The Weierstrass theorem therefore implies that $\mathcal{F}$ attains a maximum on the admissible class. Hence there exists at least one admissible mapping $\mathcal{M}$ maximizing the net predictive benefit. Appendix D, Theorem D.5 may then be invoked separately, when its low-noise detailed-balance hypotheses are satisfied, to conclude concentration of the stationary measure near such an optimum. ∎

## **L.2 Electromagnetic Field Generation and Stress-Energy Contribution**

### **Theorem L.2 (Electromagnetic Field on a Registered Coherent-Dipole Branch)**

Assume that the context-to-control map is realized by a conserved classical current $J^\mu$ supported in a source of diameter $a$, that its electric dipole moment has a nonzero harmonic component at angular frequency $\omega$, that $a\ll c/\omega$, and that the observation point lies in the radiation zone. Assume Maxwell's equations for this current. Then the retarded solution has a nonzero radiation field whenever the transverse component of the dipole acceleration is nonzero. Its electromagnetic stress-energy tensor is

$$ T_{\mu\nu}^{(\text{EM})} = \frac{1}{\mu_0}\left(F_{\mu\alpha}F_{\nu}{}^{\alpha} - \frac{1}{4}g_{\mu\nu}F_{\alpha\beta}F^{\alpha\beta}\right), \tag{L.4} $$

where $F_{\mu\nu}=\partial_\mu A_\nu-\partial_\nu A_\mu$. Theorem L.1 supplies only an optimizer in a registered mapping class; the conserved-current, multipole, size, and radiation-zone conditions are independent carrier hypotheses. Under the stress-energy decomposition of Appendix B, Definition B.8, this field contribution is one component of $T_{\mu\nu}^{(\text{MPU})}$.

Note on Stress-Energy Decomposition: The total MPU stress-energy tensor admits multiple useful decompositions. By field type (Theorem L.6): $T_{\mu\nu}^{(\text{MPU})} = T_{\mu\nu}^{(\text{matter})} + T_{\mu\nu}^{(\text{EM})}$. By CC contribution (Appendix S): $T_{\mu\nu}^{(\text{matter})} = T_{\mu\nu}^{(\text{baseline})} + \Delta T_{\mu\nu}^{(\text{CC})}$. Combined: $T_{\mu\nu}^{(\text{MPU})} = T_{\mu\nu}^{(\text{baseline})} + \Delta T_{\mu\nu}^{(\text{CC})} + T_{\mu\nu}^{(\text{EM})}$, where $T_{\mu\nu}^{(\text{baseline})}$ is the matter stress-energy at minimum operational state ($C_{\text{agg}} = C_{op}$), $\Delta T_{\mu\nu}^{(\text{CC})}$ is the additional stress-energy from maintaining high-CC context ($C_{\text{agg}} > C_{op}$), and $T_{\mu\nu}^{(\text{EM})}$ is the electromagnetic field contribution.

Proof.

The PCE-optimized mapping determines control parameters:

$$ \mathcal{M}(\text{context}_S) \to \{\omega_{\text{rad}}(t), E_0(t), \phi_{\text{rad}}(t), \vec{\epsilon}_{\text{rad}}(t)\} \tag{L.5} $$

Coherence Mechanism: Within aggregate $S$ (Definition 29), constituent MPUs share information through network coupling (Definition 5). On branches satisfying the strict-improvement antecedent of Theorem 34, high-CC aggregates develop the capability to bias local 'Evolve' outcomes through POP/PCE optimization. For electromagnetic field generation, this requires coordinating $N_{\text{osc}}$ oscillating charge distributions to achieve phase coherence.

Assume $N_{\text{osc}}$ equal dipoles of peak amplitude $d_{\text{dip}}$ have a common polarization $\vec\epsilon$, a common frequency $\omega$, and propagation phases already included in $\phi_j$. Assume the source is electrically small, the coefficient $\Gamma_0\partial PP/\partial E_0$ is positive over the relevant range, and $R_{\text{osc}}$ is independent of $\{\phi_j\}$. Their complex dipole amplitude is
$$ \vec{D}_{\text{total}} = d_{\text{dip}}\vec\epsilon\sum_{j=1}^{N_{\text{osc}}}e^{i\phi_j}. \tag{L.6} $$
For independent uniform phases,
$$
\mathbb E\left|\sum_j e^{i\phi_j}\right|^2
=\sum_j1+\sum_{j\ne k}\mathbb E e^{i(\phi_j-\phi_k)}
=N_{\text{osc}}.
$$
For deterministic phases, the triangle inequality gives
$$
\left|\sum_j e^{i\phi_j}\right|\le\sum_j|e^{i\phi_j}|=N_{\text{osc}},
$$
with equality exactly when all phases agree modulo $2\pi$. Under the stated sign and phase-independence hypotheses, maximizing
$$ \mathcal{F}[\{\phi_j\}] = \Gamma_0 \frac{\partial PP}{\partial E_0}E_0(\{\phi_j\}) - \lambda R_{\text{osc}}(N_{\text{osc}}) \tag{L.7} $$
is therefore equivalent to maximizing the coherent sum, and every maximizer satisfies
$$ \phi_j = \phi_{\text{rad}} \pmod{2\pi} \quad \text{for all }j. \tag{L.8} $$
The standard time-averaged dipole formula then gives
$$ P_{\text{rad}} = \frac{N_{\text{osc}}^2 d_{\text{dip}}^2 \omega^4}{12\pi\epsilon_{\text{vac}} c^3}. \tag{L.9} $$
If any stated hypothesis fails, (L.7) does not by itself establish phase alignment or the $N_{\text{osc}}^2$ law.

Stress-Energy Derivation: The electromagnetic field energy density is:

$$ u_{\text{EM}}(x,t) = \frac{\epsilon_{\mathrm{vac}}}{2}|\vec{E}_{\text{rad}}(x,t)|^2 + \frac{1}{2\mu_0}|\vec{B}_{\text{rad}}(x,t)|^2 \tag{L.10} $$

Use $x^0=ct$ and $d^4x=dx^0d^3x$. In SI units the Maxwell action is
$$ S_{\text{EM}}[A] = -\frac{1}{4\mu_0c} \int d^4x \, \sqrt{-g} \, F_{\mu\nu}F^{\mu\nu}. \tag{L.11} $$
For this coordinate convention define
$$ T_{\mu\nu}^{(\text{EM})} = -\frac{2c}{\sqrt{-g}}\frac{\delta S_{\text{EM}}}{\delta g^{\mu\nu}}. \tag{L.12} $$
Using
$$
\delta\sqrt{-g}=-\frac{1}{2}\sqrt{-g}\,g_{\mu\nu}\delta g^{\mu\nu},
\qquad
\delta(F_{\alpha\beta}F^{\alpha\beta})
=2F_{\mu\alpha}F_\nu{}^\alpha\delta g^{\mu\nu},
$$
one obtains
$$
\delta S_{\text{EM}}
=-\frac{1}{4\mu_0c}\int d^4x\sqrt{-g}
\left[-\frac{1}{2}g_{\mu\nu}F_{\alpha\beta}F^{\alpha\beta}
+2F_{\mu\alpha}F_\nu{}^\alpha\right]\delta g^{\mu\nu}.
$$
Substitution into (L.12) gives
$$
T_{\mu\nu}^{(\text{EM})}
=\frac{1}{\mu_0}\left(F_{\mu\alpha}F_\nu{}^\alpha
-\frac{1}{4}g_{\mu\nu}F_{\alpha\beta}F^{\alpha\beta}\right),
$$
which is Equation (L.4). ∎

### **Corollary L.2.1 (Off-Resonant Two-Level AC Stark Interaction)**

Let $\vec E_{\text{rad}}(t)=\operatorname{Re}(E_0(t)\vec\epsilon_{\text{rad}}e^{-i\omega_{\text{rad}}t})$, where the envelope varies slowly on the scales $|\Delta|^{-1}$ and $\omega_{\text{rad}}^{-1}$. With
$$ H_{\text{int}}(t)=-\vec d_{\text{TLS}}\cdot\vec E_{\text{rad}}(t), \tag{L.13} $$
define $\Omega_R=|\vec d_{\text{TLS}}\cdot\vec\epsilon_{\text{rad}}|E_0/\hbar$ and $\Delta=\omega_{\text{TLS}}-\omega_{\text{rad}}$. Under the rotating-wave approximation and $|\Delta|\gg\max(|\Omega_R|,\Gamma)$, the following calculation applies.

*Proof.* The rotating-frame eigenvalue separation is $\sqrt{\Delta^2+|\Omega_R|^2}$. Therefore
$$
\sqrt{\Delta^2+|\Omega_R|^2}-|\Delta|
=\frac{|\Omega_R|^2}{2|\Delta|}+O\!\left(\frac{|\Omega_R|^4}{|\Delta|^3}\right).
$$
Tracking the sign of $\Delta$, the transition angular-frequency shift is
$$ \delta_{\text{Stark}}(t)=\frac{|\Omega_R(t)|^2}{2\Delta(t)}+O\!\left(\frac{|\Omega_R(t)|^4}{|\Delta(t)|^3}\right), \qquad \Omega_R(t)=\frac{|\vec d_{\text{TLS}}\cdot\vec\epsilon_{\text{rad}}|E_0(t)}{\hbar}. \tag{L.14} $$
Each individual dressed level has leading shift magnitude $|\Omega_R|^2/(4|\Delta|)$. A change in a Lindblad rate follows only when the specified bath spectral density or jump operators depend on the shifted level spacing; Definition 30 supplies a bound on an already established probability bias, not a derivation of that bias. ∎

### **Proposition L.1 (Conditional Far-Detuned Spectral Selectivity)**

Consider two target transitions driven by the same field on the rotating-wave branch of Corollary L.2.1. Assume their dipole projections and linewidths are registered and each satisfies $|\Delta_a|\gg\max(|\Omega_{R,a}|,\Gamma_a)$. Then
$$ |\delta_{\text{Stark},a}|=\frac{|\Omega_{R,a}|^2}{2|\Delta_a|}+O\!\left(\frac{|\Omega_{R,a}|^4}{|\Delta_a|^3}\right). \tag{L.15} $$
For equal nonzero Rabi amplitudes at leading order, the transition having smaller $|\Delta_a|$ has the larger shift as long as both detunings remain in the stated domain.

*Proof.* Corollary L.2.1 gives the displayed expansion. With equal leading numerators, $x\mapsto1/x$ is strictly decreasing for $x>0$, so $0<|\Delta_1|<|\Delta_2|$ implies $1/|\Delta_1|>1/|\Delta_2|$. Polarization selectivity enters through $|\Omega_{R,a}|^2=|\vec d_a\cdot\vec\epsilon|^2E_0^2/\hbar^2$. The proof gives no conclusion at $\Delta=0$ or when the far-detuned inequalities fail. ∎
## **L.3 Gravitational Time Dilation from Aggregate Energy**

### **Theorem L.3 (Exterior Weak-Field Time Dilation on a Quasistatic Retained-Energy Branch)**

Assume a weak, quasistatic, spherically symmetric source of radius $R_S$, with negligible retardation over the measurement interval. Assume its active Poisson density can be modeled by an isotropic component with $p=w u$, so that $\rho_{\mathrm{act}}=(u+3p)/c^2=(1+3w)u/c^2$. Let
$$ E_{\text{grav}}^{\text{inst}}:=\int_{r\le R_S}u(\mathbf x)\,d^3x $$
be the energy localized in the source at the measurement time. For a radially oriented target of extent $L_q\ll r$ at $r>R_S$,
$$ \Delta\tau_d=\frac{\Delta\Phi}{c^2}\tau_c, \tag{L.16} $$
where
$$ \Delta\Phi=G(1+3w)\frac{E_{\text{grav}}^{\text{inst}}}{c^2r^2}L_q+O\!\left(\frac{L_q^2}{r^2}\frac{GE_{\text{grav}}^{\text{inst}}}{c^2r}\right). \tag{L.17} $$

*Proof.* Under the stated active-density model,
$$ M_{\text{eff}}=\int\rho_{\text{act}}\,dV=\frac{1+3w}{c^2}E_{\text{grav}}^{\text{inst}}. \tag{L.18} $$
Spherical symmetry gives the exterior acceleration
$$ g(r)=\frac{GM_{\text{eff}}}{r^2}. \tag{L.19} $$
Taylor's theorem applied to the exterior potential over a radial interval $L_q\ll r$ gives
$$ \Delta\Phi=g(r)L_q+O(L_q^2\sup|\Phi''|). $$
If a fraction $\eta_{\text{ret}}\in[0,1]$ of energy supplied during $\tau_c$ remains localized, then $E_{\text{grav}}^{\text{inst}}=\eta_{\text{ret}}P_{\text{agg}}\tau_c$, and hence
$$ \Delta\Phi=\frac{G\eta_{\text{ret}}P_{\text{agg}}\tau_c(1+3w)}{c^2r^2}L_q+O(L_q^2\sup|\Phi''|). \tag{L.20} $$
Energy that has crossed the source boundary is excluded from $E_{\text{grav}}^{\text{inst}}$. This proves (L.17) and the retained-power specialization.

In the weak-field limit, $g_{00}=-(1+2\Phi/c^2)$ and therefore
$$ \frac{d\tau}{dt}=\sqrt{-g_{00}}=\left(1+\frac{2\Phi}{c^2}\right)^{1/2}=1+\frac{\Phi}{c^2}+O\!\left(\frac{\Phi^2}{c^4}\right). \tag{L.21} $$
For $|\Phi|\ll c^2$, the differential proper-time accumulation across the target over coordinate interval $\tau_c$ is
$$ \Delta\tau_d=\frac{\Delta\Phi}{c^2}\tau_c+O\!\left(\tau_c\frac{\Phi\Delta\Phi}{c^4},\tau_c\frac{(\Delta\Phi)^2}{c^4}\right). $$
At first order this is Equation (L.16). ∎

### **Corollary L.3.1 (Gravitational Phase Difference)**

For the phase convention $\phi=-\omega_{\text{TLS}}\tau$, the oriented phase difference is
$$ \Delta\phi_{\text{grav}}=-\omega_{\text{TLS}}\Delta\tau_d=-\frac{\omega_{\text{TLS}}}{c^2}\Delta\Phi\,\tau_c+\text{higher-order weak-field terms}. \tag{L.22} $$
Consequently
$$|\Delta\phi_{\text{grav}}|=\frac{\omega_{\text{TLS}}}{c^2}|\Delta\Phi|\tau_c+\text{higher-order weak-field terms}.$$

*Proof.* Subtracting $\phi_1=-\omega_{\text{TLS}}\tau_1$ and $\phi_2=-\omega_{\text{TLS}}\tau_2$ gives $\phi_1-\phi_2=-\omega_{\text{TLS}}(\tau_1-\tau_2)$. Substitute Equation (L.16) and take an absolute value for the magnitude statement. ∎

## **L.4 Quantitative Comparison: Parametric Analysis**

### **Proposition L.4 (Parametric Scaling Analysis for High-Complexity Aggregates)**

For a macroscopic MPU aggregate (Definition 29) with aggregate Predictive Physical Complexity $C_{\text{agg}} = C_P(\mu_{\text{agg}})$ satisfying $C_{\text{agg}} \ge C_{op}$ (Definition 13, Corollary 3) where $C_{op}$ is the task-indexed Operational Threshold and where the additional relation $C_{op}\ge K_0$ is invoked only under all realization and complexity-capacity hypotheses of Corollary 3 but is not used in the scaling identities below, the electromagnetic and gravitational effect magnitudes scale with aggregate and target parameters as follows.

### **General Scaling Laws:**

*Proof.* Corollary L.2.1 and Theorem L.3 give the following two leading responses.

(a) Electromagnetic transition shift on the two-level, rotating-wave, far-detuned branch:
$$ \left|\frac{\delta_{\text{Stark}}}{\omega_{\text{TLS}}}\right| = \frac{d_{\text{TLS}}^2 E_0^2}{2\hbar^2\omega_{\text{TLS}}|\Delta|}+O\!\left(\frac{|\Omega_R|^4}{\omega_{\text{TLS}}|\Delta|^3}\right). \tag{L.23} $$
For a specified radiation pattern and polarization, $E_0^2$ scales as $P_{\text{rad}}/r^2$ in the radiation zone.

(b) Gravitational phase shift on the exterior retained-energy branch of Theorem L.3:
$$ \left|\frac{\Delta\phi_{\text{grav}}}{2\pi}\right| = \frac{\omega_{\text{TLS}}G\eta_{\text{ret}}P_{\text{agg}}\tau_c^2|1+3w|L_q}{2\pi c^4r^2}+O\!\left(\frac{L_q^2}{r^2}\right). \tag{L.24} $$

### **Dominance Ratio:**

At leading order, when every denominator is nonzero,
$$ \mathcal R:=\frac{|\delta_{\text{Stark}}|/\omega_{\text{TLS}}}{|\Delta\phi_{\text{grav}}|/(2\pi)}=\frac{\pi d_{\text{TLS}}^2c^4r^2E_0^2}{\hbar^2\omega_{\text{TLS}}^2|\Delta|G\eta_{\text{ret}}P_{\text{agg}}\tau_c^2|1+3w|L_q}. \tag{L.25} $$
This expression does not determine a number until the carrier, target, geometry, and retention inputs are supplied. ∎

### **Representative Case (Engineered Coherent-Charge Implementation).**

The stated data do not define a valid numerical implementation. A quantitative comparison requires a measured differential dynamic polarizability or an allowed-transition model, a positive drive frequency, $|\Delta|\gg\max(\Omega_R,\Gamma)$, a retention-time/field-energy solution, and a common uncertainty ledger for electromagnetic and gravitational responses. Therefore no numerical dominance ratio is reported here.

### **Proposition L.5 (Indeterminacy of the Dominance Ratio from the Stated Data)**

The assumptions and scaling relations in §L.4 do not determine a numerical value or a positive lower bound for
$$ \mathcal{R} \equiv \frac{\delta_{\text{EM}}}{\delta_{\text{grav}}}. \tag{L.35} $$

*Proof.* Equations (L.23)–(L.25) leave unspecified the dipole matrix element, field amplitude or source-to-field transfer, detuning, transition frequency, retained-energy fraction, equation-of-state factor, target geometry, and common uncertainty model. For admissible positive values of the remaining parameters, the electromagnetic response tends to zero as $E_0\to0$, while the gravitational response can remain nonzero when retained source energy is nonzero. Conversely, increasing a permitted electromagnetic source amplitude can increase the electromagnetic response within its perturbative domain. Hence the scaling laws alone imply neither $\mathcal R>1$ nor any finite numerical interval. ∎


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

**Proposition L.4.2 (Conditional Sub-Radiant Optimization)**
Let $d_j\ge0$, $\alpha_2>0$, and
$$\mathcal{F}_{\text{bio}}[\{\phi_j\}] = \alpha_1 C_{\text{internal}}(\{\phi_j\}) - \alpha_2 P_{\text{rad}}(\{\phi_j\}) - \alpha_3 P_{\text{metabolic}}(\{\phi_j\}),$$
where
$$P_{\text{rad}} = \frac{\omega^4}{12\pi\epsilon_{\mathrm{vac}} c^3}\left|\sum_{j=1}^N d_j e^{i\phi_j}\right|^2.$$
If $C_{\text{internal}}$ and $P_{\text{metabolic}}$ are phase-independent and the polygon condition
$$\max_j d_j\le\sum_{k\ne j}d_k$$
holds, then every phase choice satisfying $\sum_jd_je^{i\phi_j}=0$ maximizes $\mathcal F_{\text{bio}}$.

*Proof.* The polygon condition is necessary and sufficient for vectors of lengths $d_j$ to form a closed polygon, so it is equivalent to the existence of phases with zero vector sum. Because $P_{\text{rad}}\ge0$, such phases attain its global minimum. Under the phase-independence hypotheses, the other two terms are constant on the phase torus, and minimizing $P_{\text{rad}}$ maximizes $\mathcal F_{\text{bio}}$. If either phase-independence or the polygon condition fails, no sub-radiant conclusion follows from this functional. A separate compatibility calculation is required if nearest-neighbor alignment is imposed. ∎

### **L.4.1.2 Physical Implementation Substrates**

**Theorem L.4.3 (Activated-Channel Decoherence Model)**
Assume that one statistically independent decoherence channel has rate
$$\Gamma_{\text{act}}(T)=\Gamma_0(T)\exp\left(-\frac{\Delta E_{\text{shield}}}{k_BT}\right)$$
with $T>0$ and $\Delta E_{\text{shield}}\ge0$, and that all remaining independent channels have total rate $\Gamma_{\text{intrinsic}}\ge0$. Then
$$\Gamma_{\text{eff}}=\Gamma_0(T)\exp\left(-\frac{\Delta E_{\text{shield}}}{k_BT}\right)+\Gamma_{\text{intrinsic}}.$$

*Proof.* Independent exponential decay channels multiply their survival factors:
$$e^{-\Gamma_{\text{act}}t}e^{-\Gamma_{\text{intrinsic}}t}=e^{-(\Gamma_{\text{act}}+\Gamma_{\text{intrinsic}})t}.$$
Thus their generators and rates add, giving the displayed formula. The barrier suppresses only the channel assumed to obey the activated model. ∎

**Application to Candidate Substrates (illustrative):**

**(A) Microtubule Networks (Penrose-Hameroff Substrate)**
Following the Orchestrated Objective Reduction framework (Penrose, 1989, 1996; Hameroff & Penrose, 2014):
- Structure: Cylindrical lattices, 25 nm diameter, 13 protofilaments
- Model input: $\Gamma_0=k_BT/h=6.46\times10^{12}\,\mathrm{s}^{-1}$ at $T=310\,\mathrm K$
- Assumed barrier: $\Delta E_{\text{shield}}=0.2\,\mathrm{eV}$
- Activated-channel factor: $\exp[-\Delta E_{\text{shield}}/(k_BT)]=5.60\times10^{-4}$
- Activated-channel rate: $\Gamma_{\text{act}}=3.62\times10^9\,\mathrm{s}^{-1}$
- Activated-channel lifetime when $\Gamma_{\text{intrinsic}}=0$: $\tau_{\text{act}}=1/\Gamma_{\text{act}}=2.76\times10^{-10}\,\mathrm s=276\,\mathrm{ps}$

For the separate relation $E\tau=\hbar$, the input $E=10^{-30}\,\mathrm J$ gives $\tau=1.05\times10^{-4}\,\mathrm s$. A 40 Hz period is $1/40=2.50\times10^{-2}\,\mathrm s$, about 237 times larger. These inputs do not yield a 40 Hz timescale.

**(B) Radical-Pair Candidate Inputs**
- A specified radical-pair Hamiltonian, reaction operators, and magnetic-field response must be supplied.
- Any critical law $\chi(T)\propto|T-T_c|^{-\gamma}$ requires an independently established universality class and critical temperature; radical-pair kinetics alone does not select the 3D-Ising exponent.
- A coherence time must identify the measured spin observable, solvent, temperature, and kinetic model before it can enter a carrier calculation.

**(C) Membrane-Voltage Candidate Inputs**
- A field of $10^7$ V/m across 7 nm corresponds to a potential difference of $0.070$ V.
- Oscillation frequencies and gap-junction conductances are classical network inputs.
- A millimeter-scale classical voltage-correlation domain is not, without an additional coherence observable, a millimeter-scale quantum-coherence domain.

### **L.4.1.3 Near-Field Influence Mechanism**

**Proposition L.4.4 (Cavity-Energy Field Scale)**
Let a driven mode of angular frequency $\omega$ have quality factor $Q:=\omega U/P_{\text{loss}}$, stored energy $U$, and loss power $P_{\text{loss}}$. Define its effective electric mode volume by $U=\epsilon_{\mathrm{vac}}E_{\mathrm{rms}}^2V_{\mathrm{eff}}$. Then
$$E_{\mathrm{rms}}=\sqrt{\frac{QP_{\mathrm{loss}}}{\omega\epsilon_{\mathrm{vac}}V_{\mathrm{eff}}}}.$$

*Proof.* The definition of $Q$ gives $U=QP_{\mathrm{loss}}/\omega$. Substitution into the definition of $V_{\mathrm{eff}}$ and solution for $E_{\mathrm{rms}}$ give the formula. ∎

For $P_{\mathrm{loss}}=2.0\times10^{-14}$ W, $Q=100$, $f=10$ GHz, $V_{\mathrm{eff}}=10^{-18}\,\mathrm m^3$, and $\epsilon_{\mathrm{vac}}=8.854\times10^{-12}\,\mathrm{F/m}$,
$$E_{\mathrm{rms}}=\sqrt{\frac{100(2.0\times10^{-14})}{2\pi(10^{10})(8.854\times10^{-12})(10^{-18})}}=1.90\times10^3\,\mathrm{V/m}.$$
A spatial near-field enhancement requires a normalized mode profile obtained from Maxwell's equations and boundary conditions; it is not a universal function of $r/\lambda$. A biological response additionally requires a measured field-to-channel transfer function, so no somatic-control conclusion follows from this field scale alone.

### **L.4.1.4 Multi-Scale Hierarchical Organization**

**Connection to Levin's Bioelectric Cognition**

Michael Levin's work develops and surveys scale-free cognition and multiscale bioelectric control as hypotheses and organizing frameworks for biological systems (Levin, 2019, 2021; Fields & Levin, 2020):

**Definition L.4.2 (Hierarchical-Complexity Ansatz)**
For a specified gap-junction network model, one may test the dimensionless ansatz

$$C_{\text{agg}}(N,g)=C_0N^{\alpha(g)},\qquad \alpha(g)=1+\beta\tanh(g/g_c),$$
where $g/g_c$ is dimensionless and $\beta\le1$. This is a model input, not a consequence of PCE.

**Theorem L.4.5 (Diffusive Point-Impulse Correlation-Length Scale)**
Let $d\ge1$, $D_{\mathrm{eff}}>0$, and let
$$
u(r,t)
=
(4\pi D_{\mathrm{eff}}t)^{-d/2}
\exp\!\left[-\frac{r^2}{4D_{\mathrm{eff}}t}\right]
$$
be the radial free-space fundamental solution of $\partial_tu=D_{\mathrm{eff}}\Delta u$ on $\mathbb R^d$ for $t>0$. For every threshold $q\in(0,1)$, the unique radius $R_q(t)>0$ satisfying $u(R_q(t),t)/u(0,t)=q$ is
$$R_q(t)=\sqrt{4D_{\mathrm{eff}}t\ln(1/q)}.$$

*Proof.* The common positive prefactor cancels, so
$$
\frac{u(r,t)}{u(0,t)}
=
\exp\!\left[-\frac{r^2}{4D_{\mathrm{eff}}t}\right].
$$
This function is continuous and strictly decreasing from $1$ to $0$ for $r\in[0,\infty)$, so there is a unique $R_q(t)>0$ with ratio $q$. Taking logarithms gives
$$
\ln q=-\frac{R_q(t)^2}{4D_{\mathrm{eff}}t},
$$
and solving for the positive radius proves the formula. ∎

Thus a diffusive model supplies only the scale $R=O(\sqrt{D_{\mathrm{eff}}\tau_c})$. Identifying it with a biological cognitive radius requires boundary conditions, a threshold, and empirical estimates of $D_{\mathrm{eff}}$ and $\tau_c$. Neither $D_{\mathrm{eff}}=D_0(1+g/g_0)$ nor metabolic heat proportionality to $C_{\mathrm{agg}}$ follows from the diffusion equation.

### **L.4.1.5 Relationship to Orchestrated Objective Reduction**

The Penrose-Hameroff Orch OR theory provides crucial substrate characterization (Penrose & Hameroff, 2011; Hameroff & Penrose, 2014), though differing in ontological interpretation:

| **Aspect** | **Orch OR** | **PU Framework** |
|------------|-------------|------------------|
| **Consciousness Origin** | Emerges from OR events | Fundamental (awareness primary) |
| **Quantum Mechanics** | Fundamental with OR modification | Emerges from MPU dynamics |
| **Gravity's Role** | Triggers consciousness via OR | Limits CC via energy feedback |
| **Timescale** | $E \cdot t = \hbar$ (OR threshold) | $\tau_{\text{min}} = \hbar/\langle H_{\text{eff}}\rangle$ |
| **Anesthetic Action** | Disrupts tubulin quantum states | Reduces $C_{\text{agg}}$ below $C_{op}$ |

The following are empirical comparison targets rather than consequences established in this appendix:
- Whether a specified microtubule degree of freedom remains coherent at 310 K, measured with an operational coherence observable
- Whether any registered event distribution has a 25–40 ms timescale
- Whether an anesthetic changes that observable through the proposed substrate

The illustrative input $E=10^{-30}$ J in the OR relation $E\tau=\hbar$ gives $\tau=0.105$ ms and therefore does not predict a 25–40 ms interval.

PU additionally predicts:
- Measurable metabolic signature (Theorem L.6)
- Endpoint-bias bound $\text{CC} < 0.5$ (Theorem 39); exact causality uses Theorem 39c
- Gravitational self-limitation (Appendix S)

### **L.4.1.6 Critical Amplification for Non-Local Influence**

**Proposition L.4.6 (Conditional Linear-Response Amplification Ledger)**
Let $b_{\mathrm{seed}}$ be a dimensionless probability bias produced by a specified phase-to-probability transfer function. Assume, rather than infer, a linear-response regime in which a dimensionless normalized susceptibility $\chi_N$, a justified temporal gain $G_t$, and a justified cooperative gain $G_N$ multiply without overlap. Then
$$|\Delta P_{\mathrm{obs}}|=\mathcal A_{\mathrm{crit}}|b_{\mathrm{seed}}|,
\qquad
\mathcal A_{\mathrm{crit}}:=\chi_NG_tG_N,$$
subject to $0\le P_0+\Delta P_{\mathrm{obs}}\le1$ and to the domain of validity of linear response.

*Proof.* The conclusion is the composition of the three assumed linear gains. Probability normalization supplies the displayed bound. No product law follows if the gains share degrees of freedom, if the response is nonlinear, or if correlations prevent multiplicative composition. ∎

A phase estimate such as $|\Delta\phi_{\mathrm{grav}}|\sim10^{-40}$ rad is not $b_{\mathrm{seed}}$; a target Hamiltonian, initial state, measurement, and transfer derivative $\partial P/\partial\phi$ are required. If a separately derived probability seed were $10^{-40}$ and the desired bias were $10^{-3}$, their quotient would be $10^{37}$. The numerical factors $10^{10}$, $10^3$, and $10^{24}$ merely multiply to that value and are not derived by this proposition.

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

If the conditional response model of Proposition L.4.6 applies, a large measured susceptibility near a specified target instability could be tested as one possible gain mechanism. The model does not establish that criticality is necessary, that a stable target must give a null result, or that any reported deviation has this origin. Those conclusions require a registered carrier, a phase-to-probability transfer function, controls for conventional interference, and independent replication.

Likewise, an observer-state comparison can test whether a measured coherence time or radiative-loss observable changes with the intervention. The present equations do not imply that meditation increases $\tau_c$, produces a sub-radiant state, or enlarges a probability seed. Those are empirical hypotheses and are logically separate from reports of group differences in an outcome statistic.

*Note: This analysis is provided for completeness in mapping the framework's predictions to reported anomalies; the framework does not depend on or endorse these empirical claims, which remain controversial and require independent replication.*

## **L.5 Unified Energy Accounting**

### **Theorem L.6 (First-Law Ledger and Non-Overlapping Stress-Energy Partition)**

Let $\mathcal V$ be a specified control volume enclosing the aggregate, with outward-oriented boundary $\mathcal S$. Let $E_{\text{matter}}^{\mathcal V}$ and $E_{\text{EM}}^{\mathcal V}$ be the matter and electromagnetic energies stored inside $\mathcal V$, and define outward electromagnetic, heat, and mechanical powers through disjoint registered boundary channels. Then the first-law ledger is
$$
P_{\text{agg}}
=\frac{d}{dt}\left(E_{\text{matter}}^{\mathcal V}+E_{\text{EM}}^{\mathcal V}\right)
+P_{\text{EM}}^{\text{out}}+P_{\text{heat}}^{\text{out}}+P_{\text{mech}}^{\text{out}}. \tag{L.36}
$$
On the matter-plus-electromagnetic branch of Appendix B, Definition B.8,
$$ T_{\mu\nu}^{(\text{MPU})}=T_{\mu\nu}^{(\text{matter})}+T_{\mu\nu}^{(\text{EM})}. \tag{L.37} $$
If all external sources are included in this total tensor, its field equations imply
$$ \nabla^\mu T_{\mu\nu}^{(\text{MPU})}=0. \tag{L.38} $$

*Proof.* Integrate the local energy balance over $\mathcal V$ and apply the divergence theorem. The volume term is the time derivative of stored matter-plus-field energy, while the boundary terms are the outward powers. Thus
$$
P_{\text{agg}}
=\dot E_{\text{stored}}^{\mathcal V}
+P_{\text{EM}}^{\text{out}}+P_{\text{heat}}^{\text{out}}+P_{\text{mech}}^{\text{out}},
\qquad
E_{\text{stored}}^{\mathcal V}:=E_{\text{matter}}^{\mathcal V}+E_{\text{EM}}^{\mathcal V}. \tag{L.39}
$$
Transfers between oscillator kinetic energy and field energy change the two stored terms with opposite signs and therefore cancel in their sum:
$$
\dot E_{\text{matter}\to\text{EM}}
+\dot E_{\text{EM}\leftarrow\text{matter}}=0. \tag{L.40}
$$
The outward electromagnetic power is
$$
P_{\text{EM}}^{\text{out}}
=\int_{\mathcal S}\vec S\cdot d\vec A
=\int_{\mathcal S}\frac{1}{\mu_0}
(\vec E_{\text{rad}}\times\vec B_{\text{rad}})\cdot d\vec A. \tag{L.41}
$$
The partition is non-overlapping by the stated definitions of stored energy and disjoint boundary channels. In steady state $\dot E_{\text{stored}}^{\mathcal V}=0$; only on that branch does input power equal the sum of outward powers. ∎

Stress-Energy Accounting: On the SI Maxwell branch, the electromagnetic tensor is
$$ T_{\mu\nu}^{(\text{EM})} = \frac{1}{\mu_0}\left(F_{\mu\alpha}F_{\nu}{}^{\alpha} - \frac{1}{4}g_{\mu\nu}F_{\alpha\beta}F^{\alpha\beta}\right). \tag{L.42} $$
This normalization agrees with Equation (L.11) and the Poynting flux in (L.41).

No perfect-fluid form follows for a general driven aggregate. If an isotropic local-equilibrium approximation is independently justified, let $U^\mu U_\mu=-1$, let $\epsilon_m$ be matter energy density, and let $p$ be isotropic pressure. On that branch,
$$ T_{\mu\nu}^{(\text{matter})}=(\epsilon_m+p)U_\mu U_\nu+pg_{\mu\nu}. \tag{L.43} $$
Anisotropic stress, viscosity, heat flux, and external drives require their corresponding tensor terms.

With every interaction contribution assigned to one registered sector,
$$ T_{\mu\nu}^{(\text{MPU})}(t)=T_{\mu\nu}^{(\text{matter})}(t)+T_{\mu\nu}^{(\text{EM})}(t). \tag{L.44} $$
The Lorentz-force exchange terms cancel between the two divergences. If no omitted external sector exchanges energy-momentum with this system, then
$$ \nabla^\mu T_{\mu\nu}^{(\text{MPU})}=0. \tag{L.45} $$
On the Einstein-equation branch of Theorem 50, the resulting source obeys
$$ R_{\mu\nu}-\frac{1}{2}Rg_{\mu\nu}+\Lambda g_{\mu\nu}=\frac{8\pi G}{c^4}T_{\mu\nu}^{(\text{MPU})}. \tag{L.46} $$
Internal transfers alter $T^{(\text{matter})}$ and $T^{(\text{EM})}$ but not their sum. Non-double-counting is therefore a property of the declared sector assignment and boundary ledger, not a consequence of labeling input power as radiated or retained.

## **L.6 Connection to Thermodynamic Gravity Derivation**

### **Theorem L.7 (Conditional Horizon-Thermodynamic Consistency of the Aggregate Source)**

Assume the local-equilibrium horizon hypotheses of Theorems 48a.0 and 48a, the Area Law $S=\Sigma_I\mathcal A$ of Theorem 49, the Unruh temperature, and covariant conservation of the complete aggregate stress-energy tensor. Then the local Clausius relation implies the Einstein equation with that complete tensor as source, up to a cosmological constant. This is a consistency derivation for an independently specified source tensor; it does not derive an electromagnetic carrier, retained aggregate energy, or either channel's microscopic origin.

Proof.

From Appendix E (Theorem 49), the entropy of a causal horizon with area $\mathcal{A}$ is:

$$ S = \frac{k_B c^3}{4G\hbar}\mathcal{A} = \Sigma_I \mathcal{A} \tag{L.47} $$

where the information density is:

$$ \Sigma_I = k_B\sigma_{\text{link}} C_{\text{max}} = \frac{k_B\chi}{\eta\delta^2} C_{\text{max}}. \tag{L.48} $$

with channel surface density $\sigma_{\text{link}} = \chi/(\eta\delta^2)$ (Theorem E.3), MPU spacing $\delta$, geometric factor $\eta$, correlation factor $\chi$, and dimensionless Non-Deterministic Reflexive Interaction Dynamics (ND-RID, Definition 6) channel capacity $C_{\text{max}}$ measured in nats. The factor $k_B$ in Equation (L.48) converts nats per unit area to thermodynamic entropy per unit area. Theorem E.2 gives $C_{\max}<\ln d_0$ on the refresh/minorization branch, and Proposition E.2a gives $C_{\max}\le\ln d_0-\ln2$ on the completed binary reset-support branch. The registered physical reset ledger $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ is a separate result of Theorem 31.

For a local causal horizon, let $k^\mu=dx^\mu/d\ell$ be tangent to hypersurface-orthogonal null generators, where the affine length $\ell\in[0,\ell_0]$ vanishes on the bifurcation two-surface. Choose the orientation
$$
\chi^\mu=-\frac{\kappa\ell}{c^2}k^\mu,
\qquad
d\Sigma^\nu=k^\nu\,d\ell\,d\mathcal A.
$$
The approximate boost Killing field $\chi^\mu$ therefore vanishes at $\ell=0$. If $T_{\mu\nu}^{(\text{MPU})}$ is continuous at the base point, its heat flux is
$$
\delta Q
=\int T_{\mu\nu}^{(\text{MPU})}\chi^\mu d\Sigma^\nu
=-\frac{\kappa}{c^2}\int_0^{\ell_0}\!\int_{\mathcal A}
\ell\,T_{\mu\nu}^{(\text{MPU})}k^\mu k^\nu\,d\mathcal A\,d\ell
=-\frac{\kappa\mathcal A\ell_0^2}{2c^2}T_{\mu\nu}^{(\text{MPU})}k^\mu k^\nu+o(\ell_0^2). \tag{L.49}
$$
For the additional aggregate contribution, linearity gives
$$
\delta Q_{\text{agg}}
=-\frac{\kappa}{c^2}\int_0^{\ell_0}\!\int_{\mathcal A}\ell
\left(T_{\mu\nu}^{(\text{EM})}+\Delta T_{\mu\nu}^{(\text{matter})}\right)
k^\mu k^\nu\,d\mathcal A\,d\ell. \tag{L.50}
$$

The Unruh temperature associated with acceleration $\kappa$ is
$$ T = \frac{\hbar\kappa}{2\pi k_B c}. \tag{L.51} $$
On the local-equilibrium branch of Theorems 48a.0 and 48a, impose
$$ \delta Q = T\delta S. \tag{L.52} $$
Since $S=\Sigma_I\mathcal A$, the entropy side is
$$ T\delta S=\frac{\hbar\kappa}{2\pi k_B c}\Sigma_I\delta\mathcal A. \tag{L.53} $$

For a four-dimensional null congruence, the Raychaudhuri equation is
$$
\frac{d\theta}{d\ell}
=-\frac{1}{2}\theta^2-\sigma_{ab}\sigma^{ab}+\omega_{ab}\omega^{ab}
-R_{\mu\nu}k^\mu k^\nu. \tag{L.54}
$$
Hypersurface orthogonality gives $\omega_{ab}=0$. Choose the local-equilibrium cross-section so that $\theta(0)=0$ and $\sigma_{ab}(0)=0$, and assume the curvature is continuous. Then $\theta^2$ and $\sigma_{ab}\sigma^{ab}$ contribute only beyond first order, so
$$ \theta(\ell)=-\ell R_{\mu\nu}k^\mu k^\nu+O(\ell^2). \tag{L.55} $$
Using $d\mathcal A/d\ell=\theta\mathcal A$ and integrating from $0$ to $\ell_0$ gives
$$
\delta\mathcal A
=-\frac{\mathcal A\ell_0^2}{2}R_{\mu\nu}k^\mu k^\nu+o(\ell_0^2). \tag{L.56}
$$
Substitution of (L.49), (L.53), and (L.56) into (L.52), followed by cancellation of the common factor $-\kappa\mathcal A\ell_0^2/2$, yields
$$
T_{\mu\nu}^{(\text{MPU})}k^\mu k^\nu
=\frac{\hbar c\Sigma_I}{2\pi k_B}R_{\rho\sigma}k^\rho k^\sigma. \tag{L.57}
$$
Equation (L.47) gives $\Sigma_I=k_Bc^3/(4G\hbar)$, and hence
$$
R_{\mu\nu}k^\mu k^\nu
=\frac{8\pi G}{c^4}T_{\mu\nu}^{(\text{MPU})}k^\mu k^\nu
$$
for every null vector $k^\mu$. Therefore
$R_{\mu\nu}-(8\pi G/c^4)T_{\mu\nu}^{(\text{MPU})}=f g_{\mu\nu}$ for a scalar $f$. Covariant conservation of $T_{\mu\nu}^{(\text{MPU})}$ and the contracted Bianchi identity give
$$
\nabla_\nu f=\frac12\nabla_\nu R,
$$
so $f=R/2-\Lambda$ on each connected component. Thus
$$ R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu} + \Lambda g_{\mu\nu} = \frac{8\pi G}{c^4}T_{\mu\nu}^{(\text{MPU})}. \tag{L.58} $$

This calculation applies only on the stated local-equilibrium horizon branch. The aggregate contribution enters through $T_{\mu\nu}^{(\text{MPU})}$ as defined in Equation (L.37) and Definition B.8. ∎

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

The electromagnetic and gravitational models of Theorems L.2 and L.3 can be represented as frequency-labeled projections of one temporal-modulation variable only on the joint branch stated in Theorem L.8. Fourier decomposition alone neither constructs either carrier nor proves that their source maps have a common physical origin.

### **Theorem L.8 (Conditional Temporal-Modulation Channel Decomposition)**

Let $t\mapsto\delta\tau(x,t)$ be real-valued and either a Schwartz function for each $x$ or a tempered distribution. With the Fourier convention
$$
\widetilde{\delta\tau}(x,\omega)=\frac{1}{2\pi}\int_{-\infty}^{\infty}\delta\tau(x,t)e^{i\omega t}\,dt,
$$
Fourier inversion gives the following identity pointwise on the Schwartz branch and distributionally on the tempered-distribution branch:
$$ \delta\tau(x,t) = \int_{-\infty}^{\infty} d\omega\, \widetilde{\delta\tau}(x,\omega) e^{-i\omega t}. \tag{L.59} $$
Reality requires $\widetilde{\delta\tau}(x,-\omega)=\widetilde{\delta\tau}(x,\omega)^*$.

The Fourier identity alone establishes no electromagnetic or gravitational carrier. The following channel statements are conditional:

(a) On a branch with $\omega\tau_{\text{medium}}\gg1$, a spatially varying modulation produces the phase mismatch calculated below. A compensating potential proportional to $\partial_\mu\phi$ is pure gauge because $\partial_\mu\partial_\nu\phi-\partial_\nu\partial_\mu\phi=0$. Electromagnetic radiation occurs only under the additional coherent-charge hypothesis of Theorem L.2: a conserved source current must have a nonzero time-dependent radiating multipole whose Maxwell solution has $F_{\mu\nu}\ne0$.

(b) On a branch with $\omega\tau_{\text{medium}}\ll1$, a modulation is quasi-static relative to the MPU cycle. Gravity responds to the complete instantaneous stress-energy. If a fraction $\eta_{\text{ret}}$ of energy supplied over $\tau_c$ remains localized in volume $V_S$, the associated mean retained energy density is $\eta_{\text{ret}}P_{\text{agg}}\tau_c/V_S$. Energy carried away is not part of that local source.

The carrier crossover set by $1/\tau_{\text{medium}}$ and target resonance set by $\omega_{\text{TLS}}$ are independent scales unless an additional relation between them is supplied.

Proof.

(a) High-Frequency Regime ($\omega \gg 1/\tau_{\text{medium}}$) → Electromagnetic Radiation

### **Step 1: Phase Mismatch Generation**

Write $\tau_0:=\tau_{\text{medium}}$ and assume $|\delta\tau(x,t)|\le q\tau_0$ for some $0<q<1$. The exact identity
$$
\frac{1}{\tau_0+z}=\frac{1}{\tau_0}-\frac{z}{\tau_0^2}
+\frac{z^2}{\tau_0^2(\tau_0+z)}
$$
gives a remainder bounded by $|z|^2/[\tau_0^3(1-q)]$. Hence
$$
\phi_i(t)=\frac{t}{\tau_0}-\frac{1}{\tau_0^2}\int_0^t\delta\tau(x_i,t')\,dt'+R_i(t),
\qquad
|R_i(t)|\le\frac{t\|\delta\tau\|_\infty^2}{\tau_0^3(1-q)}.
$$
For $\delta\tau(x,t)=\delta\tau_0(x)\cos(\omega t)$ with $\omega\ne0$,
$$
\phi_i(t)=\frac{t}{\tau_0}-\frac{\delta\tau_0(x_i)}{\omega\tau_0^2}\sin(\omega t)+R_i(t).
$$
If $\delta\tau_0$ is twice continuously differentiable on the segment joining $x_i$ and $x_j$, Taylor's theorem gives
$$
\Delta\phi_{ij}(t)
=-\frac{\nabla\delta\tau_0(x_j)\cdot(x_i-x_j)}{\omega\tau_0^2}\sin(\omega t)
+O\!\left(\frac{\|D^2\delta\tau_0\|_\infty|x_i-x_j|^2}{|\omega|\tau_0^2}
+\frac{t\|\delta\tau\|_\infty^2}{\tau_0^3(1-q)}\right). \tag{L.60a}
$$

A rapid spatially varying modulation therefore produces an oscillatory phase mismatch proportional to the modulation amplitude and its spatial gradient. This is the input required for the coherence-restoring gauge response discussed below.

### **Step 2: Reformulation via Cycle-Rate Perturbation**

Define the cycle-rate perturbation exactly by
$$
\delta\nu(x,t):=\frac{1}{\tau(x,t)}-\frac{1}{\tau_0},
\qquad
\delta\nu(x,t)=\delta\nu_0(x)\cos(\omega t).
$$
Then, for $\omega\ne0$,
$$
\phi_i(t)=\frac{t}{\tau_0}+\frac{\delta\nu_0(x_i)}{\omega}\sin(\omega t)
$$
exactly. The exact link difference is
$$
\Delta\phi_{ij}(t)
=\frac{\delta\nu_0(x_i)-\delta\nu_0(x_j)}{\omega}\sin(\omega t). \tag{L.60b}
$$
Consequently the specified phase cost is exactly
$$
V_{\text{prop}}^{(\text{phase})}
=\frac{\kappa_{\text{phase}}\sin^2(\omega t)}{\omega^2}
\sum_{\langle ij\rangle}|\delta\nu_0(x_i)-\delta\nu_0(x_j)|^2. \tag{L.61}
$$
The change from $\delta\tau$ to $\delta\nu$ is only a change of variable; it does not derive a radiating current or alter the $1/\omega$ phase factor. Radiation requires the independent carrier transfer introduced in Step 3.

### **Step 3: Gauge Field Compensation**

The minimal coupling prescription (Appendix G, Section G.4) compensates the phase mismatch through
$$
A_\mu\to A_\mu-g_{\text{em}}^{-1}\partial_\mu\phi.
\tag{L.62}
$$
Since $\partial_t\phi_i=\delta\nu_0(x_i)\cos(\omega t)$, the local scalar-potential response is
$$
A_0(x,t)\propto \frac{1}{g_{\text{em}}}\delta\nu_0(x)\cos(\omega t).
$$
The phase-compensation potential alone has zero field strength. On an additional coherent-charge carrier branch, assume a calibrated linear transfer
$$p_0=K_\nu\delta\nu_0,$$
where $K_\nu$ has units of dipole moment times time. For $p(t)=p_0\cos(\omega t)$, the radiation-zone electric field is
$$
\vec E_{\text{rad}}(\mathbf r,t)
=\frac{\omega^2}{4\pi\epsilon_{\mathrm{vac}}c^2r}
\widehat{\mathbf r}\times(\widehat{\mathbf r}\times\mathbf p_0)
\cos[\omega(t-r/c)]+O(r^{-2}), \tag{L.63}
$$
and $\vec B_{\text{rad}}=c^{-1}\widehat{\mathbf r}\times\vec E_{\text{rad}}+O(r^{-2})$. Therefore the cycle-averaged far-zone energy density satisfies
$$
\langle u_{\text{EM}}\rangle
=\epsilon_{\mathrm{vac}}\langle|\vec E_{\text{rad}}|^2\rangle
\propto\frac{\omega^4K_\nu^2\delta\nu_0^2}{r^2}. \tag{L.64}
$$
The exact change of variables is
$$
\delta\nu
=-\frac{\delta\tau}{\tau_0^2}
+\frac{\delta\tau^2}{\tau_0^2(\tau_0+\delta\tau)},
$$
so the leading amplitude relation is $\delta\nu_0=-\delta\tau_0/\tau_0^2$ with a remainder of order $\delta\tau_0^2/\tau_0^3$. The radiation law remains conditional on the calibrated transfer and nonzero dipole source.

(b) Low-Frequency Regime ($\omega\tau_0\ll1$) → Conditional Gravitational Response

### **Step 1: Quasi-Static Approximation**

With the energy origin and positivity assumptions of Equation (L.0), $\langle H_{\text{eff}}\rangle=\hbar/\tau$. For $|\delta\tau|\le q\tau_0$ with $q<1$,
$$
\langle H_{\text{eff}}\rangle(x,t)
=\langle H_{\text{eff}}\rangle_0
\left[1-\frac{\delta\tau(x,t)}{\tau_0}
+O\!\left(\frac{\delta\tau^2}{\tau_0^2}\right)\right]. \tag{L.65}
$$

### **Step 2: Retained Energy Density**

Let $\eta_{\text{ret}}\in[0,1]$ be the fraction of energy supplied during $\tau_c$ that remains localized in the source volume $V_S$ at the measurement time. Then
$$ \langle\delta u\rangle=\frac{\eta_{\text{ret}}\langle\delta P\rangle\tau_c}{V_S}=\frac{\eta_{\text{ret}}P_{\text{agg}}\tau_c}{V_S}. \tag{L.66} $$

### **Step 3: Stress-Energy Sourcing**

In a local orthonormal rest frame, the matter energy density is
$$ T_{\hat0\hat0}^{(\text{matter})}=\epsilon_{\text{baseline}}+\delta u
=\epsilon_{\text{baseline}}+\frac{\eta_{\text{ret}}P_{\text{agg}}\tau_c}{V_S}. \tag{L.67} $$

### **Step 4: Geometric Response**

On the Einstein-equation branch,
$$ R_{\mu\nu}-\frac{1}{2}Rg_{\mu\nu}+\Lambda g_{\mu\nu}=\frac{8\pi G}{c^4}T_{\mu\nu}^{(\text{MPU})}. \tag{L.68} $$
On scales for which the $\Lambda$ contribution is negligible, and under the quasistatic isotropic active-density model $p=wu$ with $1+3w\ge0$,
$$ \nabla^2\Phi=4\pi G(1+3w)\frac{u}{c^2}, \tag{L.69} $$
so a uniform retained increment inside a sphere of radius $R_S=(3V_S/4\pi)^{1/3}$ obeys
$$ \nabla^2\delta\Phi=4\pi G(1+3w)\frac{\eta_{\text{ret}}P_{\text{agg}}\tau_c}{c^2V_S}. \tag{L.70} $$

### **Step 5: Interior and Exterior Geometry**

Spherical symmetry and regularity at the origin give
$$
|\nabla\delta\Phi(r)|
=\frac{4\pi G}{3}(1+3w)\frac{\eta_{\text{ret}}P_{\text{agg}}\tau_c}{c^2V_S}
\begin{cases}
r,&0\le r\le R_S,\\
R_S^3/r^2,&r\ge R_S.
\end{cases}
$$
For a radial target with $L_q$ small relative to the field-variation scale,
$$ \Delta\Phi=|\nabla\delta\Phi(r)|L_q+O(L_q^2\sup|\nabla^2\delta\Phi|). \tag{L.71} $$
The exterior branch $r>R_S$ is exactly the retained-energy formula of Theorem L.3. Finally,
$$ \Delta\tau_d=\frac{\Delta\Phi}{c^2}\tau_c+O\!\left(\tau_c\frac{\Phi\Delta\Phi}{c^4},\tau_c\frac{(\Delta\Phi)^2}{c^4}\right). \tag{L.72} $$

Conclusion: Fourier decomposition and the phase calculation apply to the registered temporal modulation. They do not select a physical carrier. On the additional conserved-current branch, a calibrated nonzero dipole produces Maxwell radiation. On the additional retained-energy branch, localized stress-energy produces a weak gravitational response. The pure phase-compensation potential produces neither radiation nor stress-energy by itself.

The approximations used here separate according to $\omega\tau_{\mathrm{medium}}\gg1$ and $\omega\tau_{\mathrm{medium}}\ll1$. Resonance of a specified target is governed independently by $|\omega-\omega_{\mathrm{TLS}}|$. No universal crossover follows unless a relation among the carrier and target scales is supplied. ∎

### **Corollary L.8.1 (No Carrier-Independent Coupling Ratio)**

Theorem L.8 supplies no numerical electromagnetic-to-gravitational ratio. On the coherent-charge branch, the response depends on the calibrated source transfer, Maxwell geometry, target dipole, detuning, and bath. On the gravitational branch, it depends on the complete retained stress-energy, equation of state, and geometry. The constants $\alpha_{\mathrm{em}}$ and $G$ have different dimensions and cannot be divided without a common dimensionless observable.

Appendix Z's coupling calibration and Appendix E's entropy-density calibration may be used only after all branch hypotheses in those appendices and the carrier data above are supplied. Proposition L.5 establishes that the inputs in this appendix do not determine a numerical dominance bound.

*Proof.* Equation (L.25) shows that a dimensionless response ratio depends on carrier, target, retention, and geometry inputs absent from this corollary. The dimensions of $\alpha_{\mathrm{em}}$ and $G$ also differ, so the constants alone cannot form that observable. Proposition L.5 supplies the indeterminacy conclusion. ∎

### **Corollary L.8.2 (Conditional Cavitation-Boundary Radiation Criterion)**

A cavitation preparation yields a certified electromagnetic component only when Definition L.8.2b supplies a conserved coherent-charge source with a nonzero radiating dipole component and a Maxwell radiation-zone solution. Acceleration of an unspecified boundary supplies neither a charge current nor a detector response. In Appendix L, vacuum permittivity is $\epsilon_{\mathrm{vac}}$; $\varepsilon_0=\ln2$ denotes the SPAP constant.

*Proof.* Maxwell's equations are sourced by $J^\mu$, not by an unlabeled acceleration field. If the certified dipole spectrum vanishes, Theorem L.8.2c gives zero dipole power. If it has positive certified spectral weight, that theorem gives a positive electromagnetic component. Detectability remains conditional on the separate detector record required by Definition L.8.2b. ∎

### **Lemma L.8.2a (Preparation Independence of the Carrier Calculation)**

Suppose two preparations produce identical conserved source current, material response, initial data, boundary conditions, and Maxwell radiation branch. Then their far-zone Maxwell fields are identical.

*Proof.* The difference of the two fields solves the homogeneous Maxwell initial-boundary-value problem with zero initial and boundary data. Uniqueness of that registered problem makes the difference vanish. Thus the output depends on the carrier data, not on the preparation label. ∎

### **Definition L.8.2b (Cavitation-Boundary Temporal-Wave Certificate)**

Fix a finite collapse interval, boundary $\Sigma(t)$, Fourier convention, retained band $\mathcal B_{\mathrm{ret}}$, positive spectral measure $\mu_{\mathrm{spec}}$, and
$$
\mathbf p_\omega=
\int_{\Sigma_*}\boldsymbol\chi_\Sigma(\sigma,\omega)
\widetilde{\delta\nu}_\Sigma(\sigma,\omega)\,dA.
\tag{L.8.2b.1}
$$
An accepted $\mathfrak C_{\mathrm{cav}}$ certifies localization, small amplitude, the Theorem L.8 and G.3 carrier hypotheses, a Maxwell radiation branch, a non-overlapping nonnegative power ledger, and either a positive-weight line with $\mathbf p_\omega\ne0$ or
$$
0<\int_{\mathcal B_{\mathrm{ret}}}
\omega^4|\mathbf p_\omega|^2\,d\mu_{\mathrm{spec}}(\omega)<\infty.
\tag{L.8.2b.2}
$$
The record also fixes spectral normalization and residuals. Detectability claims require an additional detector transfer, noise, threshold, and decision record.

### **Theorem L.8.2c (Dipole Radiation on the Certified Branch)**

For $\mathbf p(t)=\operatorname{Re}(\mathbf p_\omega e^{-i\omega t})$ and a localized source satisfying the radiation-zone hypotheses in Definition L.8.2b,
$$
\langle u_{\mathrm{EM}}\rangle
=\frac{\omega^4}{32\pi^2\epsilon_{\mathrm{vac}}c^4r^2}
\left|\widehat{\mathbf r}\times
(\widehat{\mathbf r}\times\mathbf p_\omega)\right|^2+O(r^{-3}),
\tag{L.8.2c.1}
$$
and
$$
\langle P_{\mathrm{EM}}(\omega)\rangle
=\frac{\omega^4|\mathbf p_\omega|^2}
{12\pi\epsilon_{\mathrm{vac}}c^3}.
\tag{L.8.2c.2}
$$

*Proof.* In Lorenz gauge, the retarded solution of $\Box A^\mu=\mu_0J^\mu$ is
$$
A^\mu(t,\mathbf r)=\frac{\mu_0}{4\pi}\int
\frac{J^\mu(t-|\mathbf r-\mathbf x|/c,\mathbf x)}{|\mathbf r-\mathbf x|}\,d^3x.
$$
For a source of diameter $a\ll r$, expand the denominator and retarded time to leading order in $a/r$. Charge conservation gives
$$
\int\mathbf J(t,\mathbf x)\,d^3x
=\frac{d}{dt}\int\mathbf x\rho(t,\mathbf x)\,d^3x
=\dot{\mathbf p}(t),
$$
where the boundary term vanishes because the source is localized. Hence the transverse radiation field has leading complex amplitudes
$$
\mathbf E_\omega(\mathbf r)
=\frac{\omega^2e^{i\omega r/c}}{4\pi\epsilon_{\mathrm{vac}}c^2r}
\widehat{\mathbf r}\times(\mathbf p_\omega\times\widehat{\mathbf r})+O(r^{-2}),
\qquad
\mathbf B_\omega=\frac{1}{c}\widehat{\mathbf r}\times\mathbf E_\omega+O(r^{-2}).
$$
The certificate supplies localization, harmonic source data, and the Maxwell radiation branch, so these hypotheses hold. For a real harmonic field, $\langle|\mathbf E|^2\rangle=|\mathbf E_\omega|^2/2$ and similarly for $\mathbf B$. Since $1/(\mu_0c^2)=\epsilon_{\mathrm{vac}}$ and the leading fields are transverse,
$$
\langle u_{\mathrm{EM}}\rangle
=\frac{\epsilon_{\mathrm{vac}}}{4}|\mathbf E_\omega|^2
+\frac{1}{4\mu_0}|\mathbf B_\omega|^2
=\frac{\epsilon_{\mathrm{vac}}}{2}|\mathbf E_\omega|^2,
$$
which gives (L.8.2c.1). Choose the polar axis along $\mathbf p_\omega$. Then
$$
\int_{S^2}|\widehat{\mathbf r}\times(\widehat{\mathbf r}\times\mathbf p_\omega)|^2d\Omega
=2\pi|\mathbf p_\omega|^2\int_0^\pi\sin^3\theta\,d\theta
=\frac{8\pi}{3}|\mathbf p_\omega|^2.
$$
The outward power is $c r^2\int\langle u_{\mathrm{EM}}\rangle d\Omega$, which yields (L.8.2c.2). The certified positive finite spectral integral gives $P_{\mathrm{EM}}>0$ and finiteness; the separately certified non-overlapping channel ledger gives $P_{\mathrm{EM}}\le P_{\mathrm{agg}}$. Detector response is not used in either conclusion. ∎

### **Remark L.8.2d (Scope)**

No transfer function, numerical spectrum, pulse duration, or detector sensitivity follows from acceleration, near-field phase, or thermodynamic cost alone.

## **L.8 Experimental Protocols and Testable Predictions**

**Protocol Convention L.8.0 (Matched-Receiver Operation-Count Audits).**

A receiver-relative operation-count audit must register all of the following before cost data are inspected:

1. the exact serialized input and its sampling law, with the same realized serialization delivered to both receivers in each yoked trial;
2. a typed target-binding map proving which receiver treats the input as self-model content and which treats it as external content;
3. a receiver-exchange isomorphism for instruction semantics and cost units, including calibrated counter uncertainty;
4. restoration from registered initial-state snapshots or an explicit carryover model, with setup and restoration costs separated from the integration subtask;
5. randomized crossed receiver and target labels, blinded analysis, and checks for address resolution, memory locality, cross-talk, and order effects;
6. Theorem M.10.5's effective descriptions, moduli, and decision certificate, fixed independently of the cost observations;
7. when Appendix B is tested, Corollary B.2.2's constants and execution class together with either a fixed-path count or a verified all-path upper bound.

Let $Y_{nTRr}$ be the counted cost for ladder index $n$, target label $T$, receiver label $R$, and replicate $r$. A crossed analysis may use
$$
Y_{nTRr}
=
a_n+b_{nR}+d_{nT}
+\gamma_n\mathbf1_{\{R=T\}}
+u_r+\varepsilon_{nTRr},
\tag{L.72a}
$$
with a preregistered covariance model and identification constraints such as
$$
\sum_R b_{nR}=0,
\qquad
\sum_T d_{nT}=0
\qquad(n\ \text{fixed}).
$$
The coefficient $\gamma_n$ estimates a receiver-target interaction after ladder-specific receiver and target effects are removed. A nonzero value does not uniquely identify SPAP proximity: ordinary address binding, cache locality, update routing, or another receiver-target interaction can produce it unless excluded by the implementation certificate.

For a fixed exact design whose constrained design matrix $X$ has full column rank and whose errors are independent and homoskedastic with variance $\sigma^2$, ordinary least squares has $\operatorname{Cov}(\widehat\beta\mid X)=\sigma^2(X^\top X)^{-1}$; the usual estimator is $s^2(X^\top X)^{-1}$ under its residual-degree-of-freedom assumptions. With paired trials, repeated receivers, uncertain $\mu$ enclosures, heteroskedasticity, or carryover, the applicable covariance is the preregistered generalized-least-squares or hierarchical covariance. No trial count follows before the finite target effect, covariance, counter error, and exclusion model are supplied.

This convention is a design and audit rule. It does not convert a lower complexity bound into a finite-ladder slope law and does not assign heat without registered resets.

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

Let $\Delta p$ denote a preregistered probability difference for a specified endpoint. Let $p_1=p_0+\Delta p\in(0,1)$ be the preregistered positive alternative. For a one-sided asymptotic $z$-test of size $\alpha$ and target power $1-\beta$, use
$$
N_{\mathrm{trials}}
\approx
\frac{\left[z_{1-\alpha}\sqrt{p_0(1-p_0)}+z_{1-\beta}\sqrt{p_1(1-p_1)}\right]^2}{(p_1-p_0)^2}.
\tag{L.73}
$$
Replacing $p_1(1-p_1)$ by $p_0(1-p_0)$ gives the fixed-null-variance, local-alternative approximation
$$
N_{\mathrm{trials}}
\approx
\frac{(z_{1-\alpha}+z_{1-\beta})^2p_0(1-p_0)}{(\Delta p)^2},
$$
which is not the general power formula.
If the baseline is estimated from finite data, its sampling variance must be added; a multinomial endpoint requires the corresponding covariance matrix and test statistic. The Hamiltonian ratio $\delta/\omega$ cannot be substituted for $\Delta p$ until a target-specific open-system likelihood derives that map. Consequently, the present conditional Stark-scaling formulas do not determine a trial count or experimental timeline.

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

Total Power Input: $P_{agg}$ from operational power monitoring.

Radiated EM Power: $P_{EM}=\int_{\mathcal S}\vec S\cdot d\vec A$ over a closed calibrated surface.

Boundary Heat Flow: $P_{heat,out}$ measured or inferred from a calibrated thermal model.

Mechanical Work: $P_{mech}$ measured at the control-volume boundary.

Stored Energy: $E_{stored}$ includes thermal, electromagnetic, chemical, and mechanical storage inside the control volume. In an isothermal lumped model its thermal term is $C_VT$, so $dE_{thermal}/dt=C_VdT/dt$ only when $C_V$ is constant.

Energy Closure Test:
$$
\epsilon_{closure}
=\frac{\left|P_{agg}-P_{EM}-P_{heat,out}-P_{mech}-dE_{stored}/dt\right|}
{P_{agg}}.
\tag{L.74}
$$
A numerical acceptance threshold must be preregistered from propagated calibration and model uncertainties; conservation alone does not select 5%.

### **Protocol L.3 (Gravitational Channel Test)**

Apparatus:

Atomic Interferometer: State-of-art sensitivity $\Delta\tau/\tau \sim 10^{-18}$ (optical clock comparison, Sr or Yb lattice clocks)

### **Test Configuration:**

Position target quantum system at distance $r \approx 0.5$ m from aggregate $S$ maintaining high-CC state ($C_{\text{agg}} \gg C_{op}$).

### **Measurement:**

Compare proper-time accumulation in the target and reference clocks over a registered integration time $T_{\text{int}}\in[10^3,10^5]\,\mathrm s$.

Framework status:

No numerical $\Delta\tau_d$ follows until the localized source stress-energy, retention fraction, source-target geometry, and clock response are supplied. If the conditional value
$$
\Delta\tau_d=6.6\times10^{-54}\,\mathrm s
\tag{L.75}
$$
is imported from a separately validated source model, a fractional clock sensitivity of $10^{-18}$ gives
$$
\Delta\tau_{\min}
\in[10^{-15},10^{-13}]\,\mathrm s
$$
and therefore
$$
\frac{\Delta\tau_{\min}}{\Delta\tau_d}
\in[1.5\times10^{38},1.5\times10^{40}].
\tag{L.76}
$$

Expected Outcome:

A null result is expected because the declared sensitivity is many orders of magnitude above the predicted gravitational signal. Such a result is consistent with Proposition L.5 but does not confirm electromagnetic dominance. A discriminating test would require sensitivity to a range on which the competing models predict different detectable outcomes.

### **Prediction L.1 (Conditional Electromagnetic-to-Gravitational Comparison)**

For a specified far-field implementation, define $\mathcal R$ only after the electromagnetic and gravitational responses are evaluated for the same source, target, geometry, observation interval, and endpoint likelihood. The scaling relations in this appendix do not determine the sign of $\mathcal R-1$ or a numerical interval for $\mathcal R$.

### **Prediction L.2 (Conditional Far-Detuned Selectivity)**

If $|\Delta|\gg\max\{\Omega_R,\Gamma\}$, the drive amplitude is held constant, and a specified likelihood is linear in the perturbative Stark shift, then
$$
|\Delta P(\Delta)|
\propto\frac{|\delta_{Stark}(\Delta)|}{\omega_{TLS}}
\propto\frac1{|\Delta|}.
\tag{L.77}
$$
This asymptotic relation does not apply in the resonant region $|\Delta|\lesssim\max\{\Omega_R,\Gamma\}$.

### **Prediction L.3 (Distance Scaling in Far-Field Regime)**

For radiative regime $r \gg \lambda_{\text{rad}} = 2\pi c/\omega_{\text{rad}}$, electromagnetic field amplitude scales as:

$$ E_0(r) \propto \frac{1}{r} \tag{L.78} $$

Therefore AC Stark shift:

$$ \delta(r) \propto \frac{E_0^2(r)}{\Delta} \propto \frac{1}{r^2} \tag{L.79} $$

### **Prediction L.4 (Conditional Coherence-Time Window)**

For a phase-accumulation protocol resolving a nonzero Stark angular-frequency shift $|\delta_{Stark}|$, a necessary parametric window is
$$
\frac{1}{|\delta_{Stark}|}
\lesssim\tau_m
\lesssim
\min\left\{
\frac{1}{\gamma_\phi+\Gamma},
\frac{1}{\Gamma_{context}}
\right\}.
\tag{L.80}
$$
Here $\gamma_\phi$ is the target dephasing rate, $\Gamma$ is the natural linewidth, and $\Gamma_{context}$ is the aggregate context-variation rate. The window exists only if the lower scale does not exceed either upper scale; protocol-specific estimation constants must be supplied separately.

## **L.8.4 Framework-Specific Differential Observables**

The following observables distinguish PU framework predictions from alternative interpretations, enabling experimental discrimination:

Observable 1: Threshold and Selection Behavior

PU branch prediction: $C_{agg}\leq C_{op}$ implies zero operational CC. For $C_{agg}>C_{op}$, nonzero influence additionally requires the strict class-level PCE improvement in Theorem L.9. No universal step-function shape above threshold is derived.

Observable 2: Endpoint and Causality Gates

PU branch prediction: $\mathrm{CC}<0.5$ excludes endpoint-complete deterministic forcing by Theorem 39. Finite-window zero-error and exact causal conclusions require Theorems 39a and 39c, respectively. This does not predict saturation at $0.5$.

Observable 3: Complete Energy Accounting

PU metric-branch prediction: every physical energy contribution enters the complete stress-energy ledger. Protocol L.2 must measure boundary flows and stored-energy changes; the ledger does not require all power to appear as heat. A biological sign comparison requires a preregistered metabolic model and is not determined by conservation alone.

Observable 4: Coherence-Time Dependence

PU conditional prediction: the effect is resolvable only when the nonempty window in Equation (L.80) exists. A quantitative law relating efficacy or pattern error to $\tau_c$ requires a specified likelihood and decoherence model.

Observable 5: Spatial Decay

PU carrier prediction: on the far-field AC-Stark branch, $E\propto r^{-1}$ and $\delta_{Stark}\propto E^2\propto r^{-2}$. For a dipolar reactive near field $E\propto r^{-3}$, the perturbative Stark shift scales as $r^{-6}$. Other response mechanisms require their own field-to-probability maps.

## **L.9 Universal Requirements for CC Implementations**

### **Theorem L.9 (Consistency Requirements and Mapping-Class Selection Conditions)**

Every physical implementation on the emergent metric branch must satisfy the energy-accounting, stress-energy, and operational-causality requirements (i)-(iii). Conditions (iv)-(v) characterize the compact Lipschitz admissible mapping class used by Theorem L.1 and the strict-improvement branch used to select nonzero influence; they are branch hypotheses, not implementation-independent necessities.

(i) Energy Conservation (Theorem L.6): The implementation must account for all power flows with each energy component contributing exactly once to the total stress-energy tensor $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8), satisfying $\nabla^\mu T_{\mu\nu}^{(\text{MPU})} = 0$.

(ii) Stress-Energy ledger: Every measured CC-associated matter, field, and boundary-flux contribution must be entered exactly once in a complete covariantly conserved $T_{\mu\nu}^{(\mathrm{MPU})}$. If the local-equilibrium horizon, area-law, Unruh-temperature, and Clausius hypotheses are also satisfied, Theorem L.7 verifies that this independently specified complete source is compatible with the Einstein equation up to a cosmological constant.

(iii) Endpoint, zero-error, and causality constraints: On the bounded-bias branch, $\text{CC}(S)<0.5$ excludes deterministic endpoint-complete forcing by Theorem 39. Finite-window zero-error exclusion additionally requires all regular-branch hypotheses of Theorem 39a. These are reliability statements. Exact operational causality requires the pre-lightcone context-independence hypothesis and conclusion of Theorem 39c.

(iv) POP/PCE Optimization (Lemma L.1, Theorem L.1): The context-to-control mapping $\mathcal{M}: \text{context}_S \to$ control parameters must be:

Lipschitz continuous with constant $L_{\mathcal{M}}$ optimized by PCE

Bounded in control output: $|\mathcal{M}(\text{context}_S)|_{\mathcal{P}} \le P_{\text{max}}$

Stable under feedback if $\text{context}_S$ is influenced by past CC effects

Satisfying the cost-benefit constraint (Equation L.3)

(v) Threshold and strict-improvement emergence: Let $\mathfrak N_0$ be the null/Born-realizing equivalence class inside the compact admissible class $\mathfrak A$, and define
$$
F_0^*:=\max_{\mathcal M\in\mathfrak N_0}\mathcal F[\mathcal M],
\qquad
F_+^*:=\sup_{\mathcal M\in\mathfrak A\setminus\mathfrak N_0}
\mathcal F[\mathcal M].
$$
For $C_{\mathrm{agg}}(S)>C_{op}$, every PCE maximizer is non-null if $F_+^*>F_0^*$, while every PCE maximizer is null if $F_+^*<F_0^*$. If $F_+^*=F_0^*$, the objective alone does not resolve the degeneracy. For $C_{\mathrm{agg}}(S)\leq C_{op}$, Definition 30 gives $\mathrm{CC}(S)=0$ regardless of available power.

Proof of Necessity.

(i) Energy Conservation: Suppose an implementation violates energy conservation, with energy appearing or disappearing. Then $\nabla^\mu T_{\mu\nu}^{(\text{MPU})} \ne 0$, violating covariant conservation (Theorem B.5) required by diffeomorphism invariance of the emergent effective theory (Appendix F, Theorem F.1). This contradicts the framework's foundational structure. Therefore energy conservation is necessary.

(ii) Stress-Energy ledger: The effective-action and horizon-gravity branches are formulated with a complete covariantly conserved source tensor. An implementation that omits a measured energy or flux contribution from that tensor does not satisfy those branch hypotheses, so Theorem L.7 cannot be applied to it. Thus source completeness is a compatibility condition for the stated emergent-gravity branch; Theorem L.7 does not independently derive that condition.

(iii) Endpoint, zero-error, and causality constraints: For a binary event with Born probability $p\in(0,1)$, forcing both deterministic endpoints requires biases $1-p$ and $-p$. Definition 30 bounds their magnitudes by $\mathrm{CC}(S)$, so endpoint completeness requires
$$
\mathrm{CC}(S)\geq\max\{p,1-p\}\geq\frac12.
$$
Thus $\mathrm{CC}(S)<1/2$ excludes endpoint-complete deterministic forcing. Theorem 39a supplies finite-window zero-error exclusion only under its regular-branch hypotheses. Neither implication gives exact causal independence; that conclusion requires Theorem 39c.

(iv) POP/PCE mapping class: Theorem L.1 assumes a nonempty compact admissible class on which $\Delta PP$ and $R_{\mathcal M}$ are continuous. Lipschitz control, bounded output, and feedback stability are sufficient regularity conditions used to define one such class. Feedback stability is required only when the context dynamics contain the corresponding feedback loop. These conditions permit application of Weierstrass' theorem and, on the separate low-noise detailed-balance branch, Theorem D.5; PCE does not prove that every physically realizable mapping must be Lipschitz.

(v) Threshold and strict-improvement emergence: Theorem L.1 gives a global maximizer of $\mathcal F$ on the compact admissible class. For $C_{\mathrm{agg}}>C_{op}$, partition that class into the null class $\mathfrak N_0$ and its complement. If $F_+^*>F_0^*$, no null map attains the global value, so every maximizer is non-null and Theorem 34 supplies a nonzero operational map on its strict-improvement branch. If $F_+^*<F_0^*$, no non-null map attains the global value, so every maximizer is null. If $F_+^*=F_0^*$, both classes may contain maximizers and the objective supplies no unique selection. For $C_{\mathrm{agg}}\leq C_{op}$, Definition 30 gives $\mathrm{CC}(S)=0$. These cases exhaust the order relation between the two class optima. ∎

### **Corollary L.9.1 (Implementation Non-Uniqueness)**

If two or more physical implementations independently satisfy conditions (i)--(v) of Theorem L.9 together with the applicable thermodynamic and causal constraints, the theorem admits all of them and supplies no implementation-level uniqueness conclusion. Proposition L.4 gives a parametric coherent-charge candidate scaling, not an existence or optimization certificate for a realized carrier; Proposition L.5 proves that its stated data do not determine a numerical dominance ratio. Biological or other carriers remain candidates until their source-to-control, retention, response, and uncertainty records independently satisfy Theorem L.9.

### **Corollary L.9.2 (Threshold and Detectability Cases)**

Let $F_0^*$ and $F_+^*$ be the class optima in Theorem L.9.

(a) If $C_{\mathrm{agg}}\leq C_{op}$, then $\mathrm{CC}(S)=0$. Hence the CC-attributable detectable influence region in Definition L.9.3 is empty.

(b) If $C_{\mathrm{agg}}>C_{op}$ and $F_+^*>F_0^*$, every PCE maximizer is non-null on the strict-improvement branch. This gives $\mathrm{CC}(S)>0$, but $R_{eff}>0$ follows only on a declared spatial carrier branch for which $|\Delta P_S(O;x,t)|\geq\epsilon_{detect}$ at some point.

(c) If $C_{\mathrm{agg}}>C_{op}$ and $F_+^*<F_0^*$, every maximizer is null, so $\mathrm{CC}(S)=0$ and the CC-attributable detectable region is empty. If $F_+^*=F_0^*$, the objective does not determine whether a null or non-null maximizer is selected.

*Proof.* Parts (a) and (c) follow from Definition 30 and the trichotomy proved in Theorem L.9. In part (b), strict class-level improvement excludes null maximizers. Definition L.9.3 defines $R_{eff}$ through a positive threshold, so nonzero operational norm alone is insufficient; a threshold-crossing spatial carrier supplies the additional implication. ∎

### **Remark L.9.1 (External Field Dominance Independence)**

Proposition L.5 proves that the stated carrier, target, geometry, and retention data determine neither a numerical value nor a positive lower bound for $\mathcal R$. Consequently no electromagnetic-over-gravitational dominance claim, baseline ratio, or finite range follows for the analyzed external-field candidate. Near-field, biochemical, internal-correlation, and other channel hierarchies likewise require independently calibrated source-to-control and response records before they can be compared under Theorem L.9.
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

$\mathcal{I}(S,t)$ is contained in the causal domain generated by finite-speed ND-RID propagation. When the continuum AQFT limit of Appendix F applies, this is represented by the past and future lightcone of $S$ at time $t$. This is not deterministic superluminal signaling but statistical bias constrained by causal structure.

### **Proposition L.9.3 (Conditional Far-Field Spatial Extent)**

Assume a specified carrier, target, and likelihood for which the CC-attributable probability response in a far-field interval is
$$
|\Delta P(r)|=K_{impl}\frac{P_{agg}}{r^2},
\qquad K_{impl}>0,
$$
where $K_{impl}$ has units $[\mathrm{length}]^2/[\mathrm{power}]$. Assume also that this response is monotone on that interval. The threshold-defined radius is then
$$
R_{eff}
=\sqrt{\frac{K_{impl}P_{agg}}{\epsilon_{detect}}},
$$
provided this radius lies in the far-field interval and inside the causal domain. Equivalently,
$$
P_{agg}=\frac{\epsilon_{detect}}{K_{impl}}R_{eff}^2.
$$

*Proof.* At the boundary of the detectable region,
$$
\epsilon_{detect}=K_{impl}\frac{P_{agg}}{R_{eff}^2}.
$$
Solving this equality gives both displayed formulas. Equation (L.24) supplies a separate gravitational phase scaling and cannot determine $K_{impl}$ for an observed probability endpoint without a likelihood map. ∎

### **Proposition L.9.4 (Conditional Temporal Extent)**

If the registered context autocorrelation decays exponentially as
$$
|G_{context}(t)|=|G_{context}(0)|e^{-\Gamma_{context}t},
$$
then its $e^{-1}$ coherence time is
$$
\tau_c(S)=\frac1{\Gamma_{context}}.
$$
If a separate ledger supplies available sustaining energy $E_{avail}$ and a positive sustaining power $P_{hold}$ throughout the interval, then
$$
P_{hold}\tau_c\leq E_{avail}
\quad\Longrightarrow\quad
\tau_c\leq\frac{E_{avail}}{P_{hold}}.
$$
No bound involving $C_{agg}-C_{op}$ follows from Definition 3 without an explicit map from complexity to available energy.

*Proof.* The first formula is the definition of the $e^{-1}$ decay time for the stated exponential law. The second follows by integrating the constant lower power over the interval: $E_{used}\geq P_{hold}\tau_c$, while feasibility requires $E_{used}\leq E_{avail}$. ∎

### **Proposition L.9.5 (Conditional Energy-Range-Time Trade-off)**

Under the stationary far-field response law of Proposition L.9.3, maintaining detectability at radius $R_{eff}$ throughout an interval of duration $\tau_c$ requires
$$
P_{agg}(t)\geq
P_{min}:=\frac{\epsilon_{detect}}{K_{impl}}R_{eff}^2
\qquad(0\leq t\leq\tau_c).
$$
Consequently, the supplied energy satisfies
$$
E_{agg}=\int_0^{\tau_c}P_{agg}(t)\,dt
\geq\frac{\epsilon_{detect}}{K_{impl}}R_{eff}^2\tau_c.
$$

*Proof.* Proposition L.9.3 applied at every time in the interval gives the pointwise power lower bound. Integrating it over $[0,\tau_c]$ gives the energy lower bound. ∎

**Connection to Appendix S: Gravitational self-limitation (Appendix S) provides upper bound on achievable $R_{\text{eff}}$ for given $C_{\text{agg}}$: attempting too large $R_{\text{eff}}$ creates gravitational dephasing that disrupts $\text{context}_S$, reducing CC effectiveness.

## **L.10 Internal Consistency and Theoretical Validation**

### **Theorem L.10 (Conditional Compatibility Checklist for the Dual-Channel Framework)**

Assume one nonempty branch simultaneously satisfies the hypotheses of Theorems L.3 and L.6--L.8, Theorem B.5, Theorems 39, 39a, and 39c at their distinct scopes, and Propositions L.9.3--L.9.5, with common units, source ownership, and overlap maps. Then the supplied electromagnetic and gravitational mechanisms satisfy the following compatibility checklist:

(a) GR Compatibility: Gravitational time dilation (Theorem L.3) follows from weak-field Einstein equations with standard stress-energy source $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8).

(b) QED Compatibility: AC Stark shift (Corollary L.2.1) follows from standard time-dependent perturbation theory applied to dipole coupling Hamiltonian.

(c) Energy Conservation: Power decomposition $P_{\text{agg}} = P_{\text{EM}} + P_{\text{other}}$ (Theorem L.6) with each component contributing exactly once to total stress-energy $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8). Covariant conservation $\nabla^\mu T_{\mu\nu}^{(\text{MPU})} = 0$ (Theorem B.5) ensures local energy conservation.

(d) Conditional thermodynamic compatibility: Given independently specified carrier stress-energy, the local-equilibrium horizon hypotheses, the saturated/calibrated area-law branch, the Unruh temperature, the Clausius relation, and covariant source conservation, Theorem L.7 reproduces the Einstein equation with the aggregate tensor as source. It does not derive either carrier.

(e) Conditional temporal-wave representation: If the common cycle-rate modulation and the separate high-frequency electromagnetic and low-frequency gravitational response hypotheses of Theorem L.8 are jointly supplied, the two responses can be represented as frequency sectors of that modulation. This is a branch compatibility statement, not a derivation of the carriers from one scalar field.

(f) Endpoint, zero-error, and causal scope: On the bounded-bias branch, $\text{CC}<0.5$ excludes endpoint-complete deterministic forcing by Theorem 39. Finite-window zero-error exclusion additionally requires the regularity hypotheses of Theorem 39a. Exact operational causality is supplied only on the pre-lightcone context-independence branch of Theorem 39c.

(g) Spatiotemporal Bounds: Influence regions satisfy finite extent (Propositions L.9.3-L.9.5), with energy-range-time trade-offs emerging from resource constraints.

*Proof.* Fix a branch on which the hypotheses of Theorems L.3, L.6-L.8, B.5, 39, 39a, 39c, and Propositions L.9.3-L.9.5 are simultaneously satisfied. Clauses (a)-(e) then follow by direct substitution of the common stress-energy, perturbative, and thermodynamic data into the cited conclusions. Clause (f) has the three distinct scopes stated above. Clause (g) follows only with the registered response, energy, and duration ledgers of Propositions L.9.3-L.9.5. Hence (a)-(g) form a conditionally compatible checklist on the common branch. The cited results alone do not prove that this branch is nonempty; existence of a joint realization remains an additional hypothesis. ∎

### **Theorem L.11 (Conditional Electron-Scale Coupling-Ratio Evaluation)**

Fix the Appendix Z scheme-specific electromagnetic core and its stated interface inputs, the Appendix E gravitational calibration branch, and the externally normalized electron mass. The following is then a dimensionless electron-scale evaluation; it is not an aggregate carrier-response ratio. The bare Appendix Z coupling is $u^*=8^{1/24}-1\approx0.0905$, which its conditional Ward map converts to

$$ \alpha_{\text{em}}(\text{bulk}) = \frac{u^*}{4\pi} \approx \frac{1}{138.843} \tag{L.81a} $$

Including the registered interface-response and $SU(2)$ transport inputs, Appendix Z gives the scheme-specified sinc-core candidate $\alpha^{-1}_{0}=137.03609205522863\ldots$ (Theorem Z.26). The physical comparison identity is $\alpha^{-1}=\alpha^{-1}_{0}+R_\alpha$ only after a complete remainder certificate is supplied. The diagnostic hypercharge-recoil construction gives $R_{\alpha}^{YR\perp}=-0.00009287769839723537\ldots$ and $\alpha^{-1}_{\mathrm{cand}}=137.03599917753023\ldots$; Corollary Z.27.11k.21.1 records that candidate, while its operator-realization and source-exhaustion gates remain open. The electromagnetic fine structure constant in standard form is:

$$ \alpha_{\text{em}} = \frac{e^2}{4\pi\epsilon_{\mathrm{vac}}\hbar c} \tag{L.81b} $$

From Appendix E (Equation E.9), the gravitational constant is:

$$ G = \frac{\eta\delta^2 c^3}{4\hbar\chi C_{\text{max}}} \tag{L.82} $$

where $\delta$ is MPU spacing, $\eta$ is geometric packing factor, $\chi$ is channel correlation factor, and $C_{\text{max}}$ is ND-RID capacity.

The gravitational fine structure constant for mass $m$ is:

$$ \alpha_{\text{grav}} = \frac{Gm^2}{\hbar c} = \frac{\eta\delta^2 m^2}{4\hbar^2\chi C_{\text{max}}} \tag{L.83} $$

For electron mass $m_e$:

$$ \alpha_{\text{grav}}^{(e)} = \frac{Gm_e^2}{\hbar c} \approx 1.75 \times 10^{-45} \tag{L.84} $$

The ratio at the MPU operational scale is:

$$ \frac{\alpha_{\text{em}}(\text{MPU})}{\alpha_{\text{grav}}^{(e)}} \approx \frac{7.2 \times 10^{-3}}{1.75 \times 10^{-45}} \approx 4.1 \times 10^{42} \tag{L.85} $$

The order-$10^{43}$ value is the arithmetic ratio of the supplied electron-scale electromagnetic and gravitational couplings on this branch. It does not by itself establish an information-theoretic origin, an aggregate electromagnetic-to-gravitational response ratio, or electromagnetic dominance of a CC carrier.

The dimensionless electron-scale ratio does not by itself determine an aggregate field-response ratio. From Equations (L.81b) and (L.83),
$$
\frac{\alpha_{em}}{\alpha_{grav}^{(m)}}
=\alpha_{em}\frac{4\hbar^2\chi C_{max}}
{\eta\delta^2m^2}.
$$
For $m=m_e$ and the numerical values displayed above, this is approximately $4.1\times10^{42}$. An aggregate ratio has the conditional form
$$
\mathcal R_{agg}
=\frac{\alpha_{em}}{\alpha_{grav}^{(e)}}\eta_{impl},
$$
where $\eta_{impl}$ must be computed independently from a specified geometry, field solution, target response, detuning, and likelihood. Choosing $\eta_{impl}$ to reproduce $6\times10^{36}$ does not derive that value. ∎

## **L.11 Physical Mechanism Details: AC Stark Implementation**

This section provides detailed implementation of the AC Stark mechanism introduced in Theorem L.2 and Corollary L.2.1 for the coherent-charge carrier analyzed in Proposition L.4.

## **L.11.1 Coherent Dipole Radiation Mechanism**

Assume a registered electromagnetic-source branch on which $\mathcal M(\text{context}_S(t))$ controls a conserved current $J^\mu$ with a nonzero time-dependent radiating multipole. Solving Maxwell's equations with the stated geometry and boundary conditions then defines $\vec E_{\text{rad}}(t)$ and its frequency, amplitude, phase, and polarization. The existence and normalization of this current are implementation data, not consequences of Theorem L.1.

On the separately registered interaction-clock branch, assume $\tau_{\mathrm{int}}\ge\tau_{\min}>0$. In a suitable interaction picture the dipole coupling is
$$
H_{\text{int}}(t)
=
-\vec d_{\text{TLS}}\cdot\vec E_{\text{rad}}(t)
\approx
\hbar\delta_{\text{Stark}}(t)\sigma_z.
\tag{L.86}
$$
For $|\Delta|\gg\max(\Omega_R,\Gamma)$ on the two-level perturbative branch,
$$
\delta_{\text{Stark}}(t)
\simeq
\frac{\Omega_R^2(t)}{4\Delta(t)},
\qquad
\Omega_R(t)
=
\frac{|\vec d_{\text{TLS}}\cdot\vec\epsilon_{\text{rad}}(t)|E_0(t)}{\hbar},
\qquad
\Delta(t)=\omega_{\text{TLS}}-\omega_{\text{rad}}(t).
\tag{L.87}
$$
The operator
$$
\sigma_z=|e\rangle\langle e|-|g\rangle\langle g|
$$
is the population-difference observable; the two spectral projectors are $|e\rangle\langle e|$ and $|g\rangle\langle g|$.

## **L.11.2 Open System Dynamics and Rate Modulation**

The 'Evolve' process for the target MPU is described by a master equation for its density matrix $\rho$ (the Lindblad equation below):

$$ \dot{\rho} = -\frac{i}{\hbar}[H_{\text{TLS}} + H_{\text{int}}(t),\rho] + \sum_k \gamma_k^{(0)}\mathcal{L}_k[\rho] \tag{L.88} $$

where $H_{\text{TLS}}$ is the MPU's intrinsic TLS Hamiltonian (part of $\hat{H}$ from Theorem 29), and $\mathcal{L}_k$ are baseline Lindblad superoperators (rates $\gamma_k^{(0)}$) for the ND-RID process. The interaction $H_{\text{int}}(t)$ induces a time-dependent AC Stark shift $\pm \hbar \delta_{\text{Stark}}(t)$ in the TLS energy levels. If the Lindblad rates $\gamma_k^{(0)}$ depend on energy level spacings or couplings affected by these shifts (e.g., via density of states in Fermi's Golden Rule), the effective rates $\gamma_k$ become modulated by $E_0(t)$.

Defining a dimensionless control field magnitude:

$$ \Phi_S(t)=\frac{E_0(t)^2}{E_{\text{max}}^2}, \quad 0\le\Phi_S(t)\le1 \tag{L.89} $$

where $E_{\text{max}}$ is the maximum field amplitude achievable by $S$. The effective rates can be modeled as:

$$ \gamma_k(t) \approx \gamma_k^{(0)}\bigl[1+\chi_k(\omega_{\text{rad}}(t), \Delta(t))\Phi_S(t) + O(\Phi_S^2(t))\bigr] \tag{L.90} $$

where $\chi_k$ is a dimensionless rate susceptibility, dependent on $d_{\text{TLS}}$, $E_{\text{max}}$, and details of the TLS-environment coupling modulated by the Stark shift.

**Note on Born Response.** The CC model changes the effective Hamiltonian and the Lindblad rates $\gamma_k$; it does not alter the probability functional. On the selected complex-Hilbert branch, Theorem 8.3 gives the trace weight $\operatorname{tr}(\rho E_k)$ and Principle 8.0c identifies it with the registered single-run outcome probability. Changing the generator can change $\rho$ and the instrument effects $E_k$, hence the numerical probabilities, without changing that rule. Empirical-frequency convergence requires a separate i.i.d., exchangeable, or stationary-ergodic repeated-trial certificate.

Let $L_S(t)$ denote the bounded time-dependent Lindblad generator on $0\leq t\leq\tau_{int}$ and let
$$
\mathcal U_S(\tau_{int},0)
:=\mathcal T\exp\!\left(\int_0^{\tau_{int}}L_S(t)\,dt\right).
$$
Then
$$
P_{obs}(i)
=\operatorname{tr}\!\left(E_i\mathcal U_S(\tau_{int},0)(\rho)\right)
=\operatorname{tr}(\rho E_i)
+\int_0^{\tau_{int}}
\operatorname{tr}\!\left(\rho L_S^\dagger(t)(E_i)\right)dt
+O(M^2\tau_{int}^2),
\tag{L.91}
$$
provided $\sup_{0\leq t\leq\tau_{int}}\|L_S(t)\|\leq M<\infty$. For a constant generator this reduces to the exponential and linear term in the original formula. The context branch must separately verify $|\Delta P(i)|\leq\mathrm{CC}(S)$.

## **L.11.3 Parameter and Feasibility Status**

Equations (L.87)--(L.90) give conditional scaling only. A quantitative implementation requires a real differential dynamic polarizability or a valid allowed-transition matrix element, a positive drive frequency, a detuning and linewidth satisfying the perturbative inequality, a field solution consistent with geometry and boundary conditions, and a measured rate susceptibility. None is supplied here, so no field threshold, probability bias, dominance ratio, or detection time is claimed.

## **L.11.4 Worked-Example Status**

The former numerical example is not a valid implementation calculation. It modeled the $^{171}\mathrm{Yb}^+$ hyperfine clock transition with a direct electric-dipole matrix element, chose a red detuning larger than the transition frequency so that the stated drive frequency was negative, treated power density as stored energy density, and converted an assumed susceptibility directly into a probability bias. The perturbative Stark formula also cannot be optimized at resonance.

A valid example must instead use a measured differential dynamic polarizability through allowed optical states, a positive drive frequency, $|\Delta|\gg\max(\Omega_R,\Gamma)$, a retention time when converting power to stored energy, and a specified open-system likelihood. No detection-time claim follows from the present data.

### **L.11.4a Error-Budget Status**

Because the implementation and likelihood are open, no numerical error budget or detection time is registered. The section retains only the conditional scaling formulas (L.87)--(L.90).

## **L.11.5 Relationship to Appendix S: Gravitational Self-Limitation**

If a CC implementation has a measured nonzero power ledger, its localized energy and boundary fluxes contribute to the complete stress-energy tensor without duplicate entries. Appendix S studies conditional feedback models for such a registered source.

### **Division of Labor:**

**Appendix L (This Appendix): Conditional forward direction**
- Specifies which source, retention, geometry, and target-response data a quantitative implementation requires
- Enters localized energy and radiation once in the complete stress-energy ledger
- Supplies conditional AC-Stark and gravitational scaling relations
- Leaves the electromagnetic-to-gravitational response ratio undetermined without implementation data
- Does not derive $P_{\text{agg}}$ from $\text{context}_S$ alone

**Appendix S: Feedback direction**
- Given $P_{\text{context}} \to$ energy density $u_{\text{context}} \to$ gravitational potential
- Gravitational potential → time dilation gradient $\Delta\tau_d$ across target (Section S.3)
- Time dilation → phase decoherence → reduced effective CC (Section S.7)
- Shows PCE optimization drives to equilibrium balancing utility vs. self-disruption (Section S.4)
- Provides feedback analysis: gravity → limits CC

### **Complementary Nature:**

On the joint Appendix S branch, the feedback construction requires:

1. a specified constitutive power law $P_{\text{context}}(\text{CC})$;
2. a retention fraction giving $u_{\text{context}}=\eta_{\text{ret}}P_{\text{context}}\tau_c/V_S$;
3. a weak-field source geometry mapping $u_{\text{context}}$ to $\Delta\tau_d$;
4. a stochastic or unresolved-phase model mapping $\Delta\tau_d$ to decoherence;
5. a calibrated law mapping coherence loss to $\text{CC}_{\text{eff}}$; and
6. a specified PCE objective whose minimizer exists in the feasible domain.

The deterministic endpoint-forcing bound of Theorem 39 is independent of those gravitational hypotheses, and operational causality additionally requires Theorem 39c. Resource, weak-field, and collapse ceilings bound only the branches satisfying their respective assumptions; they do not establish a universal no-runaway theorem for all CC implementations.

### **Quantitative Connection:**

On the constitutive branch of Appendix S, assume
$$
P_{\text{context}}(\text{CC})
=
A\left[\frac{\text{CC}}{\alpha-\text{CC}}\right]^2,
\qquad
A>0,
\qquad
0\leq\text{CC}<\alpha.
$$
If a fraction $\eta_{\text{ret}}\in(0,1]$ of the supplied energy remains localized for $\tau_c$, then
$$
u_{\text{context}}
=
\frac{\eta_{\text{ret}}P_{\text{context}}\tau_c}{V_S}.
$$
For a uniform spherical source and a target point inside the sphere, the linearized interior-field estimate gives
$$
\Delta\Phi_{\text{diff}}
=
\frac{4\pi G}{3c^2}(1+3w_c)
\frac{\eta_{\text{ret}}P_{\text{context}}\tau_c}{V_S}
rL_q,
$$
and hence
$$
\Delta\tau_d
=
K_{\text{ret}}P_{\text{context}},
\qquad
K_{\text{ret}}
:=
\eta_{\text{ret}}
\frac{4\pi G}{3c^4}(1+3w_c)
\frac{rL_q}{V_S}\tau_c^2.
$$

For the ideal-retention value $\eta_{\text{ret}}=1$, choose $r=0.05\,\mathrm m$, which lies inside the sphere of volume $10^{-3}\,\mathrm m^3$. With $\tau_c=0.1\,\mathrm s$, $w_c=1/3$, and $L_q=10^{-9}\,\mathrm m$,
$$
K_{\text{ret}}
\approx
3.46\times10^{-53}\,\mathrm{s/W},
\qquad
\Delta\tau_d
\approx
6.92\times10^{-52}\,\mathrm s
$$
at $P_{\text{context}}=20\,\mathrm W$.

The dimensionless phase scale is
$$
\left|\frac{\Delta E\,\Delta\tau_d}{\hbar}\right|.
$$
A value of order unity can reduce ensemble coherence only when a specified noise or unresolved-phase distribution converts phase dispersion into dephasing. The power divergence, calibrated dephasing response, and Schwarzschild ceiling are separate conditional restrictions.

### **Conditional Results Imported from Appendix S:**

**Section S.1:** The rational power law is a registered constitutive branch, with positive parameters and $\mathrm{CC}<\alpha$.

**Section S.2:** Local gravity is sourced by retained energy $\eta_{\text{ret}}P_{\text{context}}\tau_c$ entered once in the complete stress-energy ledger.

**Section S.3:** The weak-field proper-time formula is conditional on the specified source geometry and operating region.

**Section S.4:** A self-limiting optimum exists only after the utility, attenuation response, and feasible domain are specified.

**Section S.5:** The deterministic endpoint bound and the Schwarzschild resource ceiling are independent restrictions; neither derives the other.

**Section S.6:** Alice-side local CPTP modulation may change joint correlations but preserves Bob's marginal exactly.

**Section S.7:** A proper-time difference produces a phase. Dephasing requires a noise or unresolved-phase ensemble and a calibrated response law.

**Section S.8:** Complementarity requires a mutually exclusive energy decomposition; covariant conservation alone does not prevent duplicate ledger entries.

Appendix S therefore supplies conditional feedback models and resource ceilings, not an unconditional derivation of gravitational self-limitation for every CC implementation.

## **L.12 Causal Information as the Fundamental Basis of CC Influence**

### **L.12.1 Overview: Four Levels of Description**

Sections L.11.1–L.11.4 define a conditional AC-Stark implementation class. A quantitative realization still requires the source, geometry, detuning, susceptibility, and likelihood data listed in Section L.11.3. The logical levels used below are:

|Level |Object |Status |
|:------------------------|:----------------------------------------------------------------|:--------------------------------------------------------------|
|**Field-theoretic** |Dipole Hamiltonian and conditional rate expansion |Valid on the registered EM-source and perturbative branches |
|**Operational** |Context-dependent control policy and observed endpoint |Requires a carrier-to-endpoint response calibration |
|**Information-theoretic** |Mutual information and posterior decision reward |Defined for the normalized causal joint law |
|**Temporal model** |Clock-rate perturbation and perspective kernel |Requires the constitutive response certificates of Section L.12.3 |

Under causal separation, a strict target-conditioned advantage beyond the best information-free policy implies positive causal information. Context refinement enlarges the policy set and cannot lower the optimal decision reward. Neither statement alone proves a nonzero physical carrier or endpoint shift. The Appendix N acceleration result remains conditional on its detector-response, active-refresh, saturation, and CC-to-UCT allocation branches.

-----

### **L.12.2 The Causal Information Content of the Context State**

#### **L.12.2.1 Epistemic Status of Target Parameters**

Let
$$
\theta_T:=(\omega_{\text{TLS}},\vec d_{\text{TLS}},\chi_k,\rho_T)
$$
collect the target parameters and its time-indexed state relevant to the registered control interval. Relative to the aggregate's information, assign a prior probability law $\pi$ on a specified measurable parameter space $\Theta_T$. Prior independence between $\theta_T$ and $\text{context}_S$ is an additional causal-separation hypothesis; it does not follow from absence of direct contact when common causes or initial correlations are present.

Information about $\theta_T$ may enter the context through causal ND-RID records or common-cause records admitted by the causal model. Every finite-dimensional channel use transfers at most $\ln d_0$ nats. Theorem E.2 sharpens this to $C_{\max}(f_{RID})<\ln d_0$ on the refresh/minorization branch, while Proposition E.2a gives $C_{\max}\le\ln d_0-\ln2$ on the completed binary reset-support branch; Equation (E.15) gives equality at $2\ln2$ only on the minimal $d_0=8$ PCE residual-budget saturation branch. If an information-resolving step also performs a registered reset satisfying Definition 28, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$, with a positive floor only under $H_q(P\mid R)\ge h_{\min}>0$. If the analysis uses $\text{context}_S(t)$ as a minimal sufficient statistic for $\theta_T$, that sufficiency and minimality are branch assumptions to be verified for the chosen joint law and likelihood.

#### **L.12.2.2 The Causal Interaction Ensemble**

Let $\mathcal H_{ST}(t)=(N_1,\ldots,N_K)$ be the ordered ND-RID history up to time $t$. Let $p_K=\mathbb P(|\mathcal H_{ST}(t)|=K)$, let $\nu_K$ be the conditional probability law of the ordered history given $K$, and let
$$
Q_K(dc,d\theta\mid h)
$$
be the conditional joint probability kernel of $C_t:=\mathrm{context}_S(t)$ and $\Theta:=\theta_T$ given history $h$. Define
$$
\mathcal P_{causal}(dc,d\theta)
:=\sum_{K=0}^\infty p_K
\int Q_K(dc,d\theta\mid h)\,\nu_K(dh).
\tag{L.92}
$$
Assume $p_K\geq0$, $\sum_Kp_K=1$, and that every $Q_K$ and $\nu_K$ is a probability kernel or probability measure. Then $\mathcal P_{causal}$ is a normalized probability measure. Factorization
$$
Q_K(dc,d\theta\mid h)
=Q_K^C(dc\mid h)Q_K^\Theta(d\theta\mid h)
$$
may be used only on a branch that explicitly assumes conditional independence given the history.

**Definition L.12.1 (Causal Information as Target-Conditioned Relational Information).** The **causal information content** of aggregate $S$ about target $T$ at time $t$ is the mutual information (in nats) between $S$'s context state $\text{context}_S(t)$ (Definition L.1) and the target configuration $\theta_T$ relevant for CC coupling, under the joint law $\mathcal{P}_{\text{causal}}$ induced by the causal ND-RID interaction history $\mathcal{H}_{ST}(t)$. Formally:

$$
\mathcal{I}(S \to T,t) := I_{\mathcal{P}_{\text{causal}}}\!\left(\text{context}_S(t);\theta_T\right) \leq I(S:T)_t \leq \mathcal{I}_{\text{rel}}(S)_t \tag{L.93}
$$

Assume that $\text{context}_S$ and $\theta_T$ are outputs of local channels applied to the same joint $S$-$T$ law and that $T$ is a subsystem of the environment $E$. Data processing then gives
$$
\mathcal I(S\to T,t)\leq I(S:T)_t\leq I(S:E)_t=\mathcal I_{rel}(S)_t.
$$
If, in addition, the initial relevant records are independent, all target information reaches the retained context solely through at most $K$ channels of capacity $C_{max}$, and retention is lossless for that information, then
$$
\mathcal I(S\to T,t)\leq KC_{max}.
$$
Without these acquisition hypotheses, pre-existing or common-cause mutual information is not bounded by the number of direct interactions. In every case, $\mathcal I(S\to T,t)>0$ exactly when the two variables fail to be independent under $\mathcal P_{causal}$.

*Conditional connection to target mass:* The inequality $I(S:T)_t\le\mathcal I_{rel}(T)_t$ is branch independent. Only when all compared targets share $\mathfrak B_{mass}$ and one universal mass-per-information coefficient may Theorem N.5 rewrite that upper scale in terms of $m_T$. Off that branch, no monotone heavier-target conclusion follows; actual causal information remains limited by causal history and channel capacity.



**Lemma L.12.1 (Zero Causal Information under Causal Separation).** Let $C_t:=\text{context}_S(t)$ and $\Theta:=\theta_T$. Assume that the initial law factorizes across the relevant $S$ and $T$ records and that the causal model contains no common-cause path into both $C_t$ and $\Theta$. If there is also no directed ND-RID path between the two records up to time $t$, then $\mathcal I(S\to T,t)=0$.

*Proof.* Under the initial-factorization and no-common-cause hypotheses, causal separation gives
$$
\mathcal P_{\mathrm{causal}}(C_t,\Theta)
=\mathcal P_{\mathrm{causal}}(C_t)\mathcal P_{\mathrm{causal}}(\Theta).
$$
Therefore
$$
\mathcal I(S\to T,t)
=\int \log\!\left(
\frac{d\mathcal P_{C_t,\Theta}}
{d(\mathcal P_{C_t}\otimes\mathcal P_\Theta)}
\right)d\mathcal P_{C_t,\Theta}
=0.
$$
Without the two separation hypotheses, an empty direct interaction history does not imply the displayed factorization. ∎

#### **L.12.2.3 Temporal Ordering of Causal Information: The Arrow of Time Constraint**

Let $(\mathcal F_t)_{t\ge0}$ be the filtration generated by ND-RID records available by time $t$. Assume the context process is adapted, so $\text{context}_S(t)$ is $\mathcal F_t$-measurable. The path-ratio branch of Theorem O.3 supplies a statistical time asymmetry when its common-measure and entropy-production hypotheses hold; it does not establish adaptedness.

**Corollary L.12.2 (Past-Record Dependence and Lossless-Refinement Monotonicity).** Under the adaptedness hypothesis, $\mathcal I(S\to T,t)$ depends only on records in $\mathcal F_t$. If, for $t_2\ge t_1$, there is a measurable map $g$ such that
$$
\text{context}_S(t_1)=g(\text{context}_S(t_2)),
$$
then
$$
\mathcal I(S\to T,t_1)
\leq
\mathcal I(S\to T,t_2).
$$
Without recoverability, retained mutual information may decrease under compression, forgetting, or overwrite.

*Proof.* Adaptedness gives the past-record statement by definition. Let $C_j=\text{context}_S(t_j)$ and $\Theta=\theta_T$. The recoverability relation gives the Markov chain $\Theta\to C_2\to C_1$. The data-processing inequality therefore yields
$$
I(\Theta;C_1)\leq I(\Theta;C_2).
$$
No monotonicity follows for an arbitrary lossy update. ∎

-----

### **L.12.3 Temporal Engineering as the Physical Substrate**

#### **L.12.3.1 CC Influence as Temporal Wave Modulation**

On the clock-variable branch of Appendices O and P, write the local cycle rate as
$$
\tau(x_T,t)
=
\tau_{\text{medium}}
\left[1+\delta\tau_{\text{CC}}(x_T,t)\right].
\tag{L.94}
$$
Here $\tau_{\text{medium}}=\hbar/\langle\hat H_{\text{eff}}\rangle$ and $\delta\tau_{\text{CC}}$ is dimensionless. The Fourier representation of Theorem L.8 decomposes a sufficiently regular modulation into frequency components; it does not identify their physical carriers.

- A high-frequency component is electromagnetic only on a branch with a conserved charge current whose time-dependent multipole produces a Maxwell solution with $F_{\mu\nu}\ne0$. The AC-Stark response then additionally requires the detuning and target-coupling hypotheses of Section L.11.
- A low-frequency component contributes to gravitational time dilation only through the complete localized stress-energy tensor. Supplied work contributes to the local source only to the extent recorded by the retention and boundary-flux ledger.

Causal information governs a decision-theoretic target-conditioned advantage only under the joint-law and causal-separation hypotheses of Definition L.12.1 and Lemma L.12.1. Positive mutual information permits posterior-conditioned control; it does not by itself establish a carrier field or a nonzero target response.

**Proposition L.12.0 (Conditional Temporal-Engineering Precision Bound).** In the EM/AC-Stark channel, assume a carrier-response certificate establishes
$$
|\delta_{Stark}^{real}(x_T,t)|
\leq\eta_{res}(S,T)\delta_{Stark}^{max},
\qquad0\leq\eta_{res}\leq1.
$$
For $|\delta_{Stark}^{real}|\ll\omega_{TLS}$, the magnitude of the fractional cycle-time perturbation satisfies
$$
|\delta\tau_{CC}(x_T,t)|
\leq\eta_{res}(S,T)
\frac{\delta_{Stark}^{max}}{\omega_{TLS}}
+O\!\left(\frac{(\delta_{Stark}^{max})^2}{\omega_{TLS}^2}\right).
\tag{L.95}
$$
Refinement of a context cannot reduce the optimal decision reward by Proposition L.12.1. A larger scalar mutual information without a refinement relation, or a larger $\mathrm{CC}(S)$ without nested feasible policy sets, does not by itself imply a larger $\eta_{res}$ or cycle-rate modulation.

*Proof.* For cycle period $T=2\pi/\omega$, Taylor expansion gives
$$
\frac{T(\omega+\delta\omega)-T(\omega)}{T(\omega)}
=-\frac{\delta\omega}{\omega}
+O\!\left(\frac{\delta\omega^2}{\omega^2}\right).
$$
Apply the carrier-response certificate with $\delta\omega=\delta_{Stark}^{real}$ and take absolute values. ∎

#### **L.12.3.2 Connection to the Perspective Transition Kernel**

On a registered perspective-response branch, let the physical signal $N(t)$ enter the conditional kernel $G_{\text{persp}}(s'|s,k,N,\Delta t)$ and assume its drift potential is
$$
V_k(s')
=
\frac{\lambda_{\text{drift}}}{2}d_\Sigma^2(s',s_k).
\tag{L.96}
$$
The map from $N(t)$ and the context record to $\lambda_{\text{drift}}$ is an implementation-specific constitutive law. Its information-free value may be a nonzero baseline $\lambda_{\text{drift}}^{\text{prior}}$. Convergence toward a projective kernel requires a separately stated large-drift limit and normalization theorem; it does not follow from mutual information alone.

**Corollary L.12.3 (Conditional Perspective-Drift Response).** Assume a perspective-kernel response certificate supplies constants $\lambda_{drift}^{prior}\geq0$ and $\lambda_{drift}^{span}\geq0$ such that
$$
0\leq\lambda_{drift}^{eff}(S,T)-\lambda_{drift}^{prior}
\leq\lambda_{drift}^{span}
\bigl(\eta_{res}(S,T)-\eta_{prior}\bigr)_+.
\tag{L.97}
$$
Then refinement of the context cannot reduce the maximal certified drift advantage whenever Proposition L.12.1's nested-policy hypothesis applies. Zero causal information yields no advantage over $\lambda_{drift}^{prior}$; it yields zero drift only when a separate isotropic-baseline condition sets $\lambda_{drift}^{prior}=0$. Full target identification permits, but does not force, saturation of the upper bound.

*Proof.* The displayed inequality is the registered kernel-response certificate. Proposition L.12.1 gives non-decrease of the optimal resonance reward under context refinement. Monotonicity of $x\mapsto(x-\eta_{prior})_+$ transfers that ordering to the certified upper envelope. No equality claim follows without a saturation hypothesis. ∎

#### **L.12.3.3 Conditional Acceleration–Refresh Bound on Causal Information Acquisition**

Appendix N does not make proper acceleration a universal loss of predictive capacity. On the detector-response, additive-temperature, active-refresh, and Landauer-saturating branch of Corollary N.3.2, let a fixed comoving non-kinetic power budget sustain baseline complexity $C_0$. At constant proper acceleration $a$, the sustainable complexity $C_a$ is defined by
$$
R(C_a)+\frac{\lambda_{PM}aC_a}{\tau_{cycle}}
=R(C_0),
\qquad
C_a\le C_0,
\qquad
\lambda_{PM}=\frac{\hbar\ln2}{2\pi c}.
\tag{L.98}
$$
All quantities in this equation are evaluated in the same instantaneous comoving frame; endpoint kinetic work remains in the separate laboratory ledger.

A further CC-to-UCT allocation bridge is required. Let $\mathfrak B_{\mathrm{CC-UCT}}$ assert that, for the target and protocol class under study, the maximum target-directed causal-information acquisition rate is a specified nondecreasing function $F(C)$ of sustainable predictive complexity, with the same remaining channel resources held fixed. Only on this bridge does $C_a\le C_0$ imply
$$
\left.\frac{d\mathcal I(S\to T)}{dt}\right|_{\max}^{(a)}
=F(C_a)
\le F(C_0)
=\left.\frac{d\mathcal I(S\to T)}{dt}\right|_{\max}^{(0)}.
\tag{L.99}
$$
On the additional local-linear subbranch $F(C)=\kappa C$ and for $R'(C_0)>0$,
$$
\frac{\left.d\mathcal I/dt\right|_{\max}^{(a)}}
{\left.d\mathcal I/dt\right|_{\max}^{(0)}}
=
\frac{C_a}{C_0}
=
1-\frac{\lambda_{PM}a}{\tau_{cycle}R'(C_0)}+o(a).
$$
Thus Equation (L.99) is conditional on both the Appendix N response/refresh branch and $\mathfrak B_{\mathrm{CC-UCT}}$. Theorem N.UCT alone does not establish an MPU detector response, a universal acquisition-rate law, or CC-reach contraction; inertial motion with $a=0$ has no Unruh increment in this model.

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

where $\Delta_{opt}>0$ is the design scale and $\hat\omega$ is an estimate of the target transition frequency. The physical drive retains a nonzero detuning satisfying $|\Delta_{drive}|\gg\max\{\Omega_R,\Gamma\}$. The reward equals $1$ only when the context identifies the relevant dipole direction and transition frequency exactly and the matching action is admissible. Information equality $\mathcal I(S\to T)=\mathcal I_{max}$ implies this only if $\theta_T$ is almost surely a measurable function of $\text{context}_S$, equivalently if the posterior law is almost surely a point mass at the realized target parameter.
Zero causal information restricts performance to the optimal information-free baseline $\eta_{prior}\geq0$.

**Proposition L.12.1 (Resonance Reward Is Monotone under Context Refinement).** Let $C_1,C_2$ be two context variables on the same target experiment and assume $C_1=g(C_2)$ for a measurable deterministic coarse-graining $g$. If every $C_1$-policy composed with $g$ is admissible as a $C_2$-policy, then
$$
\eta_{res}(C_1;T)\leq\eta_{res}(C_2;T),
\qquad
I(C_1;\theta_T)\leq I(C_2;\theta_T).
\tag{L.102}
$$
No ordering of $\eta_{res}$ follows from the mutual-information inequality alone.

*Proof.* If $u_1$ is an admissible policy based on $C_1$, then $u_2:=u_1\circ g$ is an admissible policy based on $C_2$ and has the same expected reward. Hence the supremum over $C_2$-policies is at least the supremum over $C_1$-policies. The Markov chain $\theta_T\to C_2\to C_1$ and data processing give $I(C_1;\theta_T)\leq I(C_2;\theta_T)$. ∎

**Corollary L.12.4 (Zero Causal Information Implies No Target-Conditioned Advantage).** If $\mathcal{I}(S \to T) = 0$, then $\text{context}_S$ is independent of $\theta_T$ and no context-dependent control policy can outperform the best information-free (context-independent) policy in expected target alignment. In particular, any strict improvement beyond the best information-free baseline implies $\mathcal{I}(S \to T) > 0$.

*Proof.* If $\mathcal{I}(S \to T) = 0$, then $\mathcal{P}(\theta_T \mid \text{context}_S) = \mathcal{P}(\theta_T)$, so $\text{context}_S$ and $\theta_T$ are independent. For any context-dependent policy $u(\text{context}_S)$ (collecting $\hat{\mathbf{d}}$ and $\hat{\omega}$), the expected alignment is a convex combination of information-free performance values, hence is bounded above by the supremum over fixed (context-independent) policies. ∎

-----

### **L.12.5 Resource Cost of Causal Information Acquisition**

**Theorem L.12.2 (Conditional Reset Cost of Causal Information).** Let $n_{\mathrm{int}}$ interactions acquire nonnegative increments $\Delta I_k$ with $\sum_k\Delta I_k=I_0>0$. Assume that every interaction uses a channel whose classical capacity is bounded by the same finite $C_{\max}>0$. Then
$$
n_{\mathrm{int}}
\ge
\left\lceil\frac{I_0}{C_{\max}}\right\rceil.
\tag{L.103}
$$
If interaction $k$ additionally contains a registered reset satisfying the hypotheses of Theorem E.1, with pre-reset law $q_k(P_k,R_k)$, then its bath-heat ledger obeys
$$
\frac{\langle Q_{\mathrm{bath}}^{\mathrm{acq}}\rangle}{k_BT}
\ge
\sum_{k=1}^{n_{\mathrm{int}}}H_{q_k}(P_k\mid R_k).
\tag{L.103a}
$$
If the branch supplies the further uniform floor $H_{q_k}(P_k\mid R_k)\ge h_{\min}>0$, then
$$
\frac{\langle Q_{\mathrm{bath}}^{\mathrm{acq}}\rangle}{k_BT}
\ge
h_{\min}\left\lceil\frac{I_0}{C_{\max}}\right\rceil.
\tag{L.103b}
$$
On the separate registered information-disturbance branch of Theorem 33, if every counted interaction has $\Delta I_k>0$ and satisfies $\Delta I_k(\Delta S_k/k_B)\ge\kappa_r$, then
$$
I_0\frac{\Delta S_{\mathrm{acq}}}{k_B}
\ge
\sum_{k=1}^{n_{\mathrm{int}}}\Delta I_k\frac{\Delta S_k}{k_B}
\ge
\kappa_r n_{\mathrm{int}}.
\tag{L.104}
$$

*Proof.* The capacity bound gives $\Delta I_k\le C_{\max}$, hence $I_0\le n_{\mathrm{int}}C_{\max}$ and (L.103). Theorem E.1 gives $\langle Q_{\mathrm{bath},k}\rangle/(k_BT)=H_{q_k}(P_k\mid R_k)+\varepsilon_{\mathrm{diss},k}\ge H_{q_k}(P_k\mid R_k)$ for each registered reset; summing gives (L.103a), and the declared uniform floor plus (L.103) gives (L.103b). Under the additional Theorem 33 hypotheses, all factors are nonnegative, so expanding the product of the two sums gives
$$
\left(\sum_k\Delta I_k\right)
\left(\sum_j\frac{\Delta S_j}{k_B}\right)
\ge
\sum_k\Delta I_k\frac{\Delta S_k}{k_B},
$$
and summing the eventwise trade-offs proves (L.104). ∎

**Corollary L.12.5 (Conditional PCE Acquisition-Rate Cost).** Suppose the acquisition in Theorem L.12.2 occurs during a registered duration $\tau_{acq}>0$ at temperature $T$, and let $n$ be the number of charged interactions. Then its mean thermodynamic power obeys
$$
R_{acq}
\geq\frac{k_BT}{\tau_{acq}}
\sum_{k=1}^{n}H_{q_k}(P_k\mid R_k)
\geq\frac{k_BT}{\tau_{acq}}h_{min}
\left\lceil\frac{I_0}{C_{max}}\right\rceil.
$$
Accordingly, the acquisition-window contribution to Equation (L.1) satisfies
$$
V_{\mathcal I}
\geq\lambda_{rep}C_P(\text{context}_S)
+\lambda_{ctrl}\frac{k_BT}{\tau_{acq}}
h_{min}\left\lceil\frac{I_0}{C_{max}}\right\rceil
-\Gamma_{utility}U_{bias}(I_0).
\tag{L.105}
$$
This bounds registered-reset acquisition power on the registered window. A continuing maintenance cost requires a separate refresh-rate ledger, and the information-disturbance term of Theorem 33 belongs to its separately registered branch.

-----

### **L.12.6 The Effective CC Influence Bound**

Let a specified implementation supply a carrier-response certificate with efficiency $\eta_{\text{impl}}(S,T)\in[0,1]$:
$$
|\Delta P(i;S\to T)|
\leq
\mathrm{CC}(S)\eta_{\text{impl}}(S,T)
\leq
\mathrm{CC}(S).
\tag{L.106}
$$
The estimation reward $\eta_{\text{res}}$ of Equation (L.101) may replace $\eta_{\text{impl}}$ only when an independent calibration proves $\eta_{\text{impl}}\leq\eta_{\text{res}}$. Without that calibration, Definition 30 supplies only $|\Delta P|\leq\mathrm{CC}(S)$.

**Corollary L.12.7 (EM Resonance Factor as a Posterior Bayes Reward).** Let $C:=\text{context}_S$ and define
$$
r(d,\nu;\hat d,\omega)
:=|d\cdot\hat d|^2
\frac{\Delta_{opt}^2}{\Delta_{opt}^2+(\omega-\nu)^2},
\qquad\|d\|=\|\hat d\|=1.
$$
Assume the action set is compact. Then a posterior-optimal policy is any measurable selection
$$
(d^*(c),\nu^*(c))
\in\operatorname*{arg\,max}_{\|d\|=1,\nu}
\mathbb E[r(d,\nu;\hat d_{TLS},\omega_{TLS})\mid C=c],
$$
and
$$
\eta_{res}^{EM}(S,T)
=\mathbb E\!\left[
\max_{\|d\|=1,\nu}
\mathbb E[r(d,\nu;\hat d_{TLS},\omega_{TLS})\mid C]
\right].
\tag{L.107}
$$
If the posterior identifies $(\hat d_{TLS},\omega_{TLS})$ exactly and the matching action is admissible, the reward is $1$. Under zero mutual information, (L.107) reduces to the optimal prior-only reward $\eta_{prior}$. The principal-eigenvector rule is exact for the polarization-only factor; the conditional mean is exact for squared frequency loss, not generally for the Lorentzian reward above.

*Proof.* Conditional on $C=c$, the optimal decision is the action maximizing the posterior expected reward. Compactness and continuity give existence, and the measurable-selection hypothesis gives a policy. Taking the expectation over $C$ proves (L.107). Exact posterior identification turns the conditional reward into $r(\hat d_{TLS},\omega_{TLS};\hat d_{TLS},\omega_{TLS})=1$. Independence of $C$ and the target makes the conditional law equal to the prior, yielding the prior-only optimum. ∎

-----

### **L.12.7 Locality as a PCE Consequence: Three Independent Enforcement Mechanisms**

**Theorem L.12 (Conditional Locality of Target-Conditioned CC Advantage).** Assume:

1. the initial joint law obeys the causal-Markov condition that $\text{context}_S$ and $\theta_T$ are conditionally independent whenever there is no common-cause or directed ND-RID path from the causal past to both records;
2. $\text{context}_S(t)$ is generated only from records available in the causal past at time $t$;
3. the relevant ND-RID branch has an exact causal cone, or the Appendix F continuum bridge applies and its limiting cone is the geometric lightcone.

Then any target-conditioned resonance advantage beyond the optimal information-free baseline can occur only for a target whose relevant record shares a causal past with $S$. In the Appendix F continuum branch, that history is contained in the geometric past lightcone. A Lieb-Robinson estimate without an exact-cone hypothesis gives only quantitative suppression outside an effective cone.

*Proof.* Let $C=\text{context}_S(t)$ and $\Theta=\theta_T$. Corollary L.12.4 gives
$$
\text{target-conditioned advantage}>0
\quad\Longrightarrow\quad
I(C;\Theta)>0.
$$
Under hypothesis 1, absence of a common-cause or directed causal path implies
$$
\mathcal P(C,\Theta)=\mathcal P(C)\mathcal P(\Theta),
$$
which gives $I(C;\Theta)=0$. The contrapositive therefore implies that positive target-conditioned advantage requires a shared causal history. Hypothesis 2 excludes dependence on post-$t$ events. Hypothesis 3 confines every directed interaction path to the declared causal cone; on the continuum branch this is the geometric past lightcone. Combining these implications proves the claim. ∎

**Remark L.12.4 (Distinct Roles of the Three Restrictions).** Exact propagation supplies the spatial causal cone. The arrow-of-time branch supplies past directionality. A registered range-cost lower bound can make sufficiently distant correlations PCE-disfavored when its cost exceeds the bounded utility, but it does not make finite spacelike correlations identically zero. These restrictions are logically distinct and are not interchangeable proofs of exact locality.

-----

### **L.12.8 The Unified Picture**

The conditional relations of this section can be organized as follows:

|Level |Established object |Additional branch requirement |
|:------------------------|:--------------------------------------------------------------------|:--------------------------------------------------------------------|
|**Temporal model** |Dimensionless clock perturbation $\delta\tau_{\text{CC}}$ |A registered map from a physical carrier to the clock variable |
|**Information-theoretic** |Mutual information $\mathcal I(S\to T)$ and decision reward $\eta_{\text{res}}$ |A normalized joint law and the causal-separation hypotheses |
|**Operational** |Target-conditioned advantage under context refinement |A carrier-response certificate converting a policy reward to $\Delta P$ |
|**Field-theoretic** |Conditional AC-Stark and Lindblad scaling |A source current, target coupling, detuning regime, and measured susceptibility |

These levels are compatible only on branches satisfying all requirements in the last column. A shared state or a model record does not replace the causal carrier needed for a target-local response.

**Corollary L.12.6 (Conditional Information-Theoretic Influence Bound).** On an implementation satisfying the response certificate of Equation (L.106),
$$
|\Delta P(i;S\to T)|
\leq
\text{CC}(S)\eta_{\text{impl}}(S,T).
\tag{L.108}
$$
If an additional calibration proves
$$
\eta_{\text{impl}}(S,T)\leq f(\eta_{\text{res}}(S,T))
$$
for a specified nondecreasing $f:[0,1]\to[0,1]$, then
$$
|\Delta P(i;S\to T)|
\leq
\text{CC}(S)f(\eta_{\text{res}}(S,T)).
$$
Proposition L.12.1 makes $\eta_{\text{res}}$ non-decreasing along context refinements. It does not define a universal function of the scalar mutual information alone.

*Proof.* The first inequality is Equation (L.106). Substitution of the calibration inequality gives the second. The refinement statement is exactly the policy-set inclusion proved in Proposition L.12.1. ∎

-----

### **L.12.9 The Entanglement-Mediated Channel**

The causal information framework extends first to the local-CPTP entanglement-correlation branch, where $S$ modulates preparation, measurement, or local context channels while preserving no-signaling marginal identities. A stronger nonlocal/state-mediated marginal-anomaly branch is not part of the core CC closure; it is absent from the exact pre-lightcone context-independence branch and would falsify that branch by Corollary 39c.1. As an external regular finite-window model, it requires the declared support, sampling, information-rate, and validation gates of Section 10 before any empirical claim. The branch analyzed here uses pre-existing entanglement in the global state $\omega_{AB}$ and local context-dependent modulation of joint statistics $\omega(A \otimes B)$.

**Definition L.12.2 (Entanglement Causal Information on the Operator-Schmidt Branch).** Let $\omega_{AB}$ be a bipartite density operator on finite-dimensional Hilbert spaces $\mathcal H_A\otimes\mathcal H_B$. Equivalently, in an infinite-dimensional representation, assume that
$$
X_{AB}:=\omega_{AB}-\omega_A\otimes\omega_B
$$
is Hilbert-Schmidt and admits an operator-Schmidt expansion
$$
X_{AB}=\sum_j s_j A_j\otimes B_j
$$
in orthonormal local Hilbert-Schmidt operator families. Let $\mathcal B_{AB}:=(\{A_j\},\{B_j\},\{s_j\})$ denote a chosen such record and set $\theta_{AB}:=(\omega_{AB},\mathcal B_{AB})$. The entanglement causal information is
$$
\mathcal I_{\text{ent}}(S,\omega_{AB})
:=
I_{\mathcal P_{\text{causal}}}
(\text{context}_S;\theta_{AB}).
\tag{L.109}
$$
For a general AQFT state outside this branch, Equation (L.109) requires a separately specified finite measurement record in place of $\mathcal B_{AB}$.

**Proposition L.12.2 (Pairwise Entanglement-Correlator Bound).** Let $\omega_0$ be a common baseline state and suppose two local-context outputs satisfy
$$
D(\omega_{C_{A,j}},\omega_0)\leq\mathrm{CC}(S_A),
\qquad j=1,2,
$$
where $D(\rho,\sigma):=\frac12\|\rho-\sigma\|_1$. For $\mathrm{CC}(S_A)>0$, define
$$
\eta_{ent}^{pair}:=
\frac{D(\omega_{C_{A,1}},\omega_{C_{A,2}})}
{2\mathrm{CC}(S_A)}\in[0,1],
$$
and set $\eta_{ent}^{pair}=0$ when $\mathrm{CC}(S_A)=0$. Then
$$
\left|\omega_{C_{A,1}}(A\otimes B)-
\omega_{C_{A,2}}(A\otimes B)\right|
\leq4\mathrm{CC}(S_A)\eta_{ent}^{pair}
\|A\|_\infty\|B\|_\infty.
\tag{L.110}
$$
Zero entanglement causal information implies no target-conditioned advantage over the best information-free local policy; it implies $\eta_{ent}^{pair}=0$ only under an additional zero-baseline hypothesis requiring all information-free context policies to induce the same joint state.

*Proof.* The triangle inequality gives
$$
D(\omega_{C_{A,1}},\omega_{C_{A,2}})
\leq D(\omega_{C_{A,1}},\omega_0)+D(\omega_0,\omega_{C_{A,2}})
\leq2\mathrm{CC}(S_A),
$$
so $\eta_{ent}^{pair}\in[0,1]$. With $\Delta\omega=\omega_{C_{A,1}}-\omega_{C_{A,2}}$, trace-norm Hölder gives
$$
|\operatorname{tr}(\Delta\omega\,A\otimes B)|
\leq\|\Delta\omega\|_1\|A\otimes B\|_\infty
=2D(\omega_{C_{A,1}},\omega_{C_{A,2}})
\|A\|_\infty\|B\|_\infty,
$$
which is Equation (L.110). ∎

**Theorem L.12.8 (Target-Conditioned Entanglement Advantage Requires Causal Information).** Let the local-CPTP entanglement branch satisfy the causal-separation hypotheses of Lemma L.12.1 with target parameter $\theta_{AB}$. If a context policy achieves expected joint-correlation performance strictly above the supremum attainable by policies independent of $\theta_{AB}$, then
$$
\mathcal I_{ent}(S,\omega_{AB})>0,
$$
and the aggregate's context shares a causal or common-cause history with the relevant entanglement record. The aggregate need not have participated in preparing $\omega_{AB}$ merely to apply a local channel that changes joint correlators. Every such local CPTP channel preserves Bob's marginal by Corollary L.12.8a.

*Proof.* If $\mathcal I_{ent}=0$, then $\text{context}_S$ and $\theta_{AB}$ are independent. The convex-mixture argument of Corollary L.12.4, with $\theta_T$ replaced by $\theta_{AB}$, shows that a context-dependent policy cannot exceed the optimal information-free expected performance. The contrapositive proves the first implication. Lemma L.12.1's causal-separation hypotheses convert positive mutual information into the existence of a causal or common-cause history. Corollary L.12.8a independently proves marginal invariance for every Alice-side CPTP channel. ∎

**Corollary L.12.8a (Core CC No-Signaling Branch).** The core CC mechanism in this appendix is the local-CPTP branch. For every bipartite state $\omega_{AB}$ and every Alice-side local context channel $\Phi_A^C$,
$$
\omega_{AB}^C=(\Phi_A^C\otimes \mathrm{id}_B)(\omega_{AB})
$$
satisfies
$$
\operatorname{tr}_A(\omega_{AB}^C)
=
\operatorname{tr}_A(\omega_{AB})
\tag{L.111}
$$
whenever $\Phi_A^C$ is completely positive and trace-preserving. Therefore Bob-side marginal shifts under late-randomized Alice context choices are not a consequence of core CC. They belong only to the separated nonlocal/state-mediated marginal-anomaly branch of Postulate 3. By Corollary 39c.1 such a shift is outside and would falsify the exact pre-lightcone context-independence branch; as an external regular finite-window model, it is subject to the zero-error, sample-complexity, information-rate, and validation gates of Section 10.

*Proof.* For any Bob-side observable $B$,
$$
\operatorname{tr}\!\left[(I_A\otimes B)(\Phi_A^C\otimes \mathrm{id}_B)(\omega_{AB})\right]
=
\operatorname{tr}\!\left[(\Phi_A^{C\,*}(I_A)\otimes B)\omega_{AB}\right].
$$
Because $\Phi_A^C$ is trace-preserving, its Heisenberg adjoint is unital:
$$
\Phi_A^{C\,*}(I_A)=I_A.
$$
Thus
$$
\operatorname{tr}\!\left[(I_A\otimes B)\omega_{AB}^C\right]
=
\operatorname{tr}\!\left[(I_A\otimes B)\omega_{AB}\right]
$$
for every $B$, which is exactly (L.111). Hence a Bob-side marginal anomaly cannot be produced by the local-CPTP core branch. ∎

**Remark L.12.5 (Entanglement Channel Temporal Engineering).** In the temporal-ontological description (Section L.12.3), the entanglement channel corresponds to modulating the perspective transition kernel $G_{\text{persp}}$ in region $\mathcal{O}_A$ in a way correlated with the operator-basis record $\mathcal{B}_{AB}$ for the joint state on $\mathcal{O}_A\cup\mathcal{O}_B$. On the local-CPTP branch, this modulation may alter joint correlators while Equation (L.111) preserves the $\mathcal O_B$ marginal.

-----

### **L.12.10 Summary**

The AC-Stark construction is a conditional implementation class. Under the causal-separation hypotheses, performance strictly above the optimal information-free baseline requires a causal or common-cause record carrying information about the target. This statement does not require direct participation in target preparation and does not turn an abstract model record into a physical carrier. The key results are:

- **Summary of Definition L.12.1 and Equations L.92–L.93:** Causal information $\mathcal{I}(S \to T,t)$ is defined as mutual information under $\mathcal{P}_{\text{causal}}$, satisfying the inequality chain $\mathcal{I}(S \to T) \leq I(S:T) \leq \mathcal{I}_{\text{rel}}(S)$ by data processing and subadditivity respectively. On a common $\mathfrak B_{mass}$ branch only, Theorem N.5 converts the relational-information upper scale into a target-mass upper scale; the information inequality itself is branch independent.


- **Summary of Corollary L.12.2:** On the declared arrow-of-time branch, only records in the causal past can contribute. The accessible interaction history is cumulative. The retained quantity $\mathcal I(S\to T,t)=I(\text{context}_S(t);\theta_T)$ is monotonically non-decreasing only on the lossless-refinement branch; it may decrease under compression, forgetting, or finite-memory overwrite.
- **Section L.12.3 (Temporal Engineering):** CC influence is modeled as modulation of $\tau(x_T,t)$ via the declared temporal-wave channels. Causal information governs modulation precision (Equation L.95) and perspective drift strength (Corollary L.12.3). On the Appendix N response/refresh branch plus the explicit $\mathfrak B_{\mathrm{CC-UCT}}$ allocation bridge, Equation (L.99) transfers the conditional reduction $C_a\le C_0$ to a non-increasing causal-information acquisition rate; acceleration alone does not imply that transfer.
- **Summary of Proposition L.12.1 and Equations L.101–L.102:** Resonance factor $\eta_{\text{res}}$ improves under refinement of causal information, proved via the coarse-graining/policy-set inclusion argument. Corollary L.12.4 establishes that any target-conditioned advantage beyond an information-free baseline requires $\mathcal{I}(S \to T) > 0$.
- **Summary of Theorem L.12.2 and Equations L.103–L.105:** A finite per-use capacity bounds the number of interactions needed to acquire $I_0$. Registered reset laws bound bath heat by $\sum_k H_{q_k}(P_k\mid R_k)$, with a positive linear floor only when $H_{q_k}(P_k\mid R_k)\ge h_{\min}>0$. Equation (L.105) converts the registered acquisition heat to mean power only after a duration is supplied, and the information-disturbance term of Theorem 33 enters only on its separately registered branch. These conditional bounds constrain a specified PCE objective but do not establish existence or uniqueness of an equilibrium $I_0^*$.
- **Summary of Corollary L.12.7 and Equation L.107:** The EM resonance reward is the posterior Bayes optimum jointly over polarization and frequency. The principal-eigenvector rule is exact only for the polarization-only factor, and the conditional mean is exact for squared frequency loss rather than the Lorentzian reward. Zero mutual information gives the optimal prior-only reward; reward one requires exact target identification and an admissible matching action.
- **Summary of Theorem L.12 (Conditional Locality):** Target-conditioned advantage is confined to a shared causal history when the causal-Markov, adaptedness, and exact-cone hypotheses hold. In the Appendix F continuum branch, the cone is identified with the geometric lightcone only under its bridge assumptions. Thermodynamic range cost supplies an optimization penalty and the arrow-of-time branch supplies directionality; neither alone proves exact locality.
- **Summary of Proposition L.12.2, Theorem L.12.8, and Corollary L.12.8a:** A strict target-conditioned joint-correlation advantage requires positive entanglement causal information under the causal-separation hypotheses; a generic local channel can change joint correlators without such information. Equation (L.110) is the trace-distance pairwise correlator bound with its stated factor, and Equation (L.111) preserves the remote marginal exactly on the local-CPTP branch. No Section 10 capacity bound follows without an additional channel model.

**Remark L.12.6 (Global Entangled Accounting).** The section has been written from the aggregate's vantage — what it must acquire, model, and do — but this framing risks a misreading: that the aggregate acts on the universe from outside, with the probability shift as the universe's reaction. Neither is correct within the PU framework, and the distinction matters.

The aggregate $S$ and target $T$ are subsystems of a common global state $\omega$, but entanglement alone is not a dynamical channel. On the core local-CPTP branch, a context-dependent operation on $S$ can change joint observables and conditional statistics revealed after comparison, while Corollary L.12.8a gives exact invariance of every spacelike target marginal. A target-local probability shift requires either a causal interaction reaching $T$ or the separately declared marginal-anomaly branch with the validation and causality gates of Section 10.

Every acquisition or control operation that includes a registered reset must appear in the conditional reset ledger of Theorem L.12.2. That accounting is necessary for the registered reset but does not itself derive a target response. Equation (L.106) applies only after a carrier-response map and resonance certificate connect the aggregate's context to the target dynamics. Thus the framework distinguishes three statements: local physical reconfiguration of $S$, changes in joint correlations of $\omega$, and changes in the local outcome law at $T$; none is identified with another solely from global entanglement.

Exact target-local causality follows on the branch with an exact propagation cone and an adapted causal model. Under the causal-separation hypotheses, a strict target-conditioned advantage additionally requires a causal or common-cause record. Thermodynamic range cost can make remote control PCE-disfavored, and the arrow-of-time branch supplies directionality, but neither is an independent proof of exact spatial locality.

## **L.13 Summary**

This appendix supplies conditional implementation theorems and accounting guardrails for the CC program; it does not derive a realized CC carrier or a nonzero outcome shift from complexity alone.

## **L.13.1 Foundational Results**

(1) **Interpretive layer.** Awareness-first language and the temporal-wave vocabulary organize the program but do not supply a physical carrier or response map.

(2) **Conditional electromagnetic branch (Theorem L.2).** A conserved radiating current, coherent source geometry, phase relation, Maxwell carrier, and context map yield the displayed electromagnetic field and stress tensor. These premises are implementation data.

(3) **Conditional gravitational branch (Theorem L.3).** Registered aggregate energy enters the complete stress tensor; a gravitational response follows only on the accepted metric-continuum and Einstein branches.

(4) **Undetermined channel ratio (Proposition L.5).** The scaling relations do not determine $\mathcal R=\delta_{\mathrm{EM}}/\delta_{\mathrm{grav}}$. A numerical comparison requires a common source model, target-response map, geometry, retention fraction, units, and uncertainty ledger.

(5) **Energy accounting (Theorem L.6).** Mutually exclusive power entries, boundary fluxes, and stored-energy changes are necessary for a non-double-counted ledger. Covariant conservation is a consistency condition on the complete tensor, not proof that the entries were exhaustively or uniquely assigned.

(6) **Conditional horizon thermodynamics (Theorem L.7).** Clausius, area, and Einstein conclusions retain the KMS, horizon, entropy-saturation, normalization, and metric-response premises cited by the theorem.

(7) **Temporal-modulation decomposition (Theorem L.8).** Fourier decomposition alone identifies neither an electromagnetic current nor a gravitational source and does not unify their response laws.

(8) **Conditional coupling-scale comparison (Theorem L.11).** The electron-scale ratio near $4.1\times10^{42}$ follows from the displayed branch inputs. No aggregate response ratio follows without an implementation efficiency and common target likelihood.

(9) **Implementation guardrails (Theorem L.9).** Threshold, energy, stress-energy, endpoint, causality, and optimization statements apply only at the status and under the physical records declared in their clauses.

(10) Conditional Spatiotemporal Estimates (Propositions L.9.3–L.9.5): If $|\Delta P(r)|=K_{\text{impl}}P_{\text{agg}}/r^2$ on a monotone far-field interval, then $R_{\text{eff}}=\sqrt{K_{\text{impl}}P_{\text{agg}}/\epsilon_{\text{detect}}}$ within that interval and the causal domain. If context correlations decay exponentially, $\tau_c=1/\Gamma_{\text{context}}$. Maintaining threshold response throughout that interval requires $E_{\text{agg}}\ge(\epsilon_{\text{detect}}/K_{\text{impl}})R_{\text{eff}}^2\tau_c$.

## **Biological Connections:**

    Multi-scale hypothesis (L.4.1.4.) connecting to Levin's observations of coordinated bioelectric patterns

    Differential observables (L.8.4) enabling experimental discrimination between interpretations

    Testable predictions for morphogenesis, gap junction optimization, and calorimetry

## **L.13.2 Experimental Program**

### **Near-term (engineered systems):**

    Coherent-charge carrier (Protocol L.1)

    Energy accounting (Protocol L.2)

    Dominance validation (Protocol L.3)

    Evidence adjudication for Protocols L.1-L.3 uses the preregistered Section 13.0a triage: support, null, and failure are assigned only by the fixed endpoint, artifact, sign, stopping-rule, and replication criteria stated there.

### **Medium-term (biological systems, if applicable):**

    Operational $C_{\text{agg}}$ proxy development

    Bioelectric coherence time measurements

    Calorimetry during morphogenesis (planarian test case)

    Multi-scale correlation studies

### **Long-term (quantum interface):**

    Direct quantum measurement during biological processes

    Validation or falsification of biological CC hypotheses

No integration-time forecast follows until a signal amplitude, noise model, endpoint likelihood, and sampling design are registered. Energy accounting tests closure of the physical ledger but does not validate a CC attribution by itself. At the stated sensitivity, the gravitational protocol predicts an unresolved result and cannot determine the electromagnetic-to-gravitational response ratio.

## **L.13.3 Theoretical Significance**

The dual-channel analysis gives a common accounting framework for separately certified electromagnetic and gravitational responses of an MPU aggregate. It establishes compatibility and no-double-counting conditions; it does not derive the two carriers, identify them as one mechanism, or complete the structure of physical law from awareness or PCE alone.

Propositions L.9.3-L.9.5 give finite spatiotemporal estimates only with a calibrated carrier response, declared coherence law, causal domain, and sustaining-energy ledger. Theorem L.11 gives the electron-scale dimensionless ratio near $4.1\times10^{42}$ only on its displayed branch. Neither result fixes an aggregate electromagnetic-to-gravitational response ratio.

The biological proposals of Section L.4.1 are empirical hypotheses. A result bears on a CC carrier only through the preregistered source, target, artifact, energy, sign, interval, and replication criteria; bioelectric organization or calorimetric closure alone does not identify CC influence.

Section L.11 defines a candidate coherent-charge AC-Stark implementation class for engineered systems. It yields a quantitative prediction only after a conserved source current, field geometry, valid differential polarizability, detuning regime, rate susceptibility, endpoint likelihood, and complete energy ledger are supplied. The present appendix does not establish that a high-complexity aggregate realizes those inputs or produces a nonzero quantum-outcome shift.

**Causality terminology rule.** Every endpoint, bias-strength, gravity-backreaction, or zero-error bound in this appendix is weaker than operational causality. Postulate 2 means exact pre-lightcone context independence by Theorem 39c; a late-randomized Bob-marginal shift lies outside that branch.
