# Appendix S: Resource Cost, Stress-Energy, and the Gravitational Self-Limitation of CC

The Predictive Universe framework predicts that any sustained context capable of biasing quantum outcome statistics (operational CC) carries a resource cost that manifests as stress-energy, producing a gravitational self-dephasing effect that limits its own efficacy. This appendix provides the quantitative analysis of this gravitational feedback mechanism, complementing the primary influence mechanisms (electromagnetic, biological) detailed in Appendix L. While electromagnetic coupling dominates practical CC influence by a factor of approximately $6\times10^{36}$ (Theorem L.5), the gravitational feedback analyzed here provides universal self-limitation and connects CC to fundamental spacetime structure.

## S.1 Resource Cost of the Context State

Let $\text{CC}(S)$ denote the operational bias capability of system $S$ (Definition 30). The framework's CC scaling law (Definition 32) is:
$$
\text{CC}(S) = \alpha_{CC,\max} \frac{C_{agg} - C_{op}}{C_{scale} + (C_{agg} - C_{op})}
\tag{S.1}
$$

Define the active context complexity above baseline as $C_{context} := C_{agg} - C_{op}$. Solving for $C_{context}$ in terms of $\text{CC}$ yields:
$$
C_{context} = C_{scale} \frac{\text{CC}}{\alpha_{CC,\max} - \text{CC}}
\tag{S.2}
$$

We adopt a quadratic operational cost function $R(C)$ expanded around the baseline $C_{op}$. PCE optimization (Theorem D.5) drives systems toward configurations that minimize the total potential $V(x)$, naturally positioning them near local cost minima where $R'(C_{op})$ vanishes or is absorbed into the baseline. The leading order expansion consistent with the convexity requirement (Definition 3) is:
$$
R(C) \approx R(C_{op}) + r_p (C - C_{op})^2, \quad \text{where } r_p = \tfrac{1}{2}R''(C_{op}) > 0
\tag{S.3}
$$

The additional power required to maintain the context is:
$$
P_{context} = R(C_{op} + C_{context}) - R(C_{op}) = r_p C_{context}^2 = r_p C_{scale}^2 \left[\frac{\text{CC}}{\alpha_{CC,\max} - \text{CC}}\right]^2
\tag{S.4}
$$

Defining the constant $A := r_p C_{scale}^2$ (dimensions of power) and setting $\alpha := \alpha_{CC,\max}$ for brevity, the power cost is:
$$
\boxed{P_{context}(\text{CC}) = A \left[\frac{\text{CC}}{\alpha - \text{CC}}\right]^2}
\tag{S.5}
$$

**Physical interpretation:** The power cost scales quadratically with context complexity above threshold, reflecting the increasing resource requirements for maintaining more refined internal states capable of greater quantum outcome bias. As $\text{CC} \to \alpha$, the power requirement diverges, enforcing a practical upper limit independent of the causality constraint.

**Connection to Appendix L:** This power $P_{context}$ is a component of the total aggregate power $P_{agg}$ analyzed in Appendix L (Theorem L.6). For systems implementing CC through electromagnetic field generation, $P_{context}$ contributes to both the radiated power $P_{EM}$ and internal operational costs $P_{other}$, with the complete energy accounting given by $P_{agg} = P_{EM} + P_{other}$ (Equation L.36).

## S.2 The CC-Context Stress-Energy Tensor $\Delta T_{\mu\nu}^{(CC)}$

Assume the context state occupies volume $V_S$. We model its effective stress-energy contribution as a fluid. Given that the internal signaling required for maintaining predictive coherence is likely relativistic (propagating at or near $c$), an equation-of-state parameter $w_c \approx 1/3$ (characteristic of a relativistic gas or radiation) is physically plausible. The energy density, time-averaged over the context coherence timescale $\tau_c$, is:
$$
u_{context} = \frac{P_{context} \tau_c}{V_S}, \qquad p_{context} = w_c u_{context}
\tag{S.6}
$$

In the rest frame of system $S$, the perfect-fluid stress-energy tensor (Landau & Lifshitz, 1975; Weinberg, 1972) is:
$$
\Delta T_{\mu\nu}^{(CC)} = \text{diag}(u_{context}, p_{context}, p_{context}, p_{context})
\tag{S.7}
$$

For the relativistic fluid case $w_c = 1/3$:
$$
\Delta T_{\mu\nu}^{(CC)} = u_{context} \cdot \text{diag}(1, 1/3, 1/3, 1/3)
\tag{S.8}
$$

This stress-energy contribution is properly incorporated into the total MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}$ as detailed in Appendix B (Definition B.8) and Appendix L (Theorem L.6). The decomposition is:
$$
T_{\mu\nu}^{(MPU)} = T_{\mu\nu}^{(baseline)} + \Delta T_{\mu\nu}^{(CC)} + T_{\mu\nu}^{(EM)}
\tag{S.9}
$$

where $T_{\mu\nu}^{(baseline)}$ represents the minimal operational state stress-energy ($C_{agg} = C_{op}$), $\Delta T_{\mu\nu}^{(CC)}$ is the additional matter contribution from maintaining high-complexity context, and $T_{\mu\nu}^{(EM)}$ accounts for any electromagnetic field generation (Theorem L.2).

**Result (Self-limiting CC bound under resource ceiling).** If an operational ceiling $u_{context} \le u_{\max}$ holds, then using $P_{context} \ge \Gamma_0 C_{context}/\tau_c$ (where $\Gamma_0$ is the power conversion factor, Definition 20), we have $u_{context} \ge \Gamma_0 C_{context}/V_S$ and hence:
$$
\boxed{\text{CC} \le \alpha_{CC,\max} \frac{u_{\max}}{u_{\max} + \kappa_* C_{scale}}}, \qquad \kappa_* := \Gamma_0/V_S
\tag{S.10}
$$

Higher available energy density raises the operational cap, while causal consistency still enforces $\text{CC} < \alpha_{CC,\max}$ (Theorem 39).

**Theorem S.1 (Local CC biases preserve no-signaling; gravitational bound).**

Let a bipartite system $AB$ be prepared in state $\rho_{AB}$. Let the local CC device on subsystem $A$ be described by a one-parameter family of completely positive, trace-preserving (CPTP) maps (Nielsen & Chuang, 2010; Watrous, 2018) $\{\Phi_A^{(\epsilon)}\}_{\epsilon}$ with $\|\Phi_A^{(\epsilon)} - \mathcal{E}_A\|_{1 \to 1} \le \alpha < 1/2$, where $\mathcal{E}_A$ is the baseline (zero-CC) channel and $\|\cdot\|_{1 \to 1}$ is the induced trace norm. Let this map act before a product measurement $\{E_i \otimes F_j\}$. Then the marginal on $B$ is unchanged for all $\epsilon$:
$$
\sum_i \text{tr}\!\left[(\Phi_A^{(\epsilon)} \otimes \text{id}_B)(\rho_{AB}) (E_i \otimes F_j)\right] = \text{tr}\!\left[\rho_B F_j\right]
\tag{S.11}
$$

Moreover, if the context stress-energy $\Delta T_{\mu\nu}^{(CC)}$ is perfect-fluid as in Equation S.8, the achievable bias obeys the self-limitation bound:
$$
|\Delta P| \le \min\left\{\alpha, c_1 \frac{G u_{context} L^2}{c^4}\right\}
\tag{S.12}
$$

where $L$ is the characteristic spatial scale (e.g., $L \sim c\tau_c$) and $c_1$ is a geometric factor of order unity.

*Proof.* CP-TP local maps commute with partial trace (Peres & Terno, 2004): $\text{tr}_A((\Phi_A^{(\epsilon)} \otimes \text{id}_B)(\rho_{AB})) = \text{tr}_A(\rho_{AB})$. Thus subsystem $B$'s marginal density operator is invariant under local operations on $A$, ensuring no deterministic signaling. The bound in Equation S.12 follows from translating the energy budget constraint (Equations S.5-S.6) into probability modifications via first-order perturbation theory in the weak-field limit. Positivity of the density operator and the norm bound on the channel difference $\|\Phi_A^{(\epsilon)} - \mathcal{E}_A\|_{1 \to 1} \le \alpha$ cap the operational effect. The completely bounded (diamond) norm (Kitaev, 1997; Aharonov et al., 1998) could also be used, but the induced trace norm is sufficient for this argument. $\square$

## S.3 Gravitational Self-Disruption

In the weak-field limit of General Relativity (Misner et al., 1973; Carroll, 2004), the effective source density for the Newtonian gravitational field is derived from the $00$-component of Einstein's equations (Theorem 50). From the trace of the stress-energy tensor in Einstein's equations (Misner et al., 1973; Wald, 1984), the gravitational mass density is:
$$
\rho_{source} = \frac{u_{context} + 3p_{context}}{c^2} = (1 + 3w_c) \frac{u_{context}}{c^2}
\tag{S.13}
$$

This follows from the $00$-component of Einstein's field equations in the Newtonian limit (Weinberg, 1972; Wald, 1984), where pressure contributes to gravitational mass. For $w_c = 1/3$:
$$
\rho_{source} = \frac{2u_{context}}{c^2}
\tag{S.14}
$$

For a uniform spherical distribution of radius $R_S$, the radial gravitational field strength at interior radius $r < R_S$ is:
$$
g_{CC}(r) = \frac{4\pi G}{3} \rho_{source} r = \frac{4\pi G}{3} (1 + 3w_c) \frac{u_{context}}{c^2} r
\tag{S.15}
$$

A target quantum system with linear spatial extent $L_q$ positioned at radius $r$ experiences a gravitational potential difference across its extent:
$$
\Delta\Phi_{diff} \approx g_{CC}(r) L_q = \frac{4\pi G}{3} (1 + 3w_c) \frac{u_{context}}{c^2} r L_q
\tag{S.16}
$$

Over the context coherence time $\tau_c$, this potential difference produces a differential proper time accumulation via gravitational time dilation (Pound & Rebka, 1960; Hafele & Keating, 1972):
$$
\Delta\tau_d = \frac{\Delta\Phi_{diff}}{c^2} \tau_c = \frac{4\pi G}{3c^4} (1 + 3w_c) \frac{P_{context} \tau_c}{V_S} r L_q \tau_c
\tag{S.17}
$$

Substituting Equation S.5:
$$
\boxed{\Delta\tau_d = K P_{context}(\text{CC})}
\tag{S.18}
$$

with the geometric factor:
$$
K := \frac{4\pi G}{3c^4} (1 + 3w_c) \frac{r L_q \tau_c^2}{V_S}
\tag{S.19}
$$

Define the effective dephasing coefficient:
$$
K_{eff} := \frac{K}{\tau_c} = \frac{4\pi G}{3c^4} (1 + 3w_c) \frac{r L_q \tau_c}{V_S}
\tag{S.20}
$$

**Physical interpretation:** The factor $K$ relates the context power directly to differential proper time accumulation. For $w_c = 1/3$, the numerical coefficient becomes $8\pi G/(3c^4)$. The geometric factors $r$, $L_q$, and $V_S$ reflect the spatial configuration, while $\tau_c^2$ arises from the time-averaged energy density combined with the coherence interval over which effects accumulate.

## S.4 PCE Optimization and Self-Limiting $\text{CC}^*$

The gravitational time dilation $\Delta\tau_d$ acts as a dephasing mechanism (detailed in Section S.7 below). The effective, achievable bias is reduced from the ideal value:
$$
\text{CC}_{eff} = \text{CC} \left(1 - \frac{\Delta\tau_d}{\tau_c}\right) = \text{CC}(1 - K_{eff} P_{context})
\tag{S.21}
$$

The Principle of Compression Efficiency (PCE, Definition 15) drives the system to an equilibrium that maximizes a net-benefit functional, balancing the utility of the bias against its costs. We model this as:
$$
B_{net}(\text{CC}) = k_b \text{CC}_{eff} - k_c P_{context} = k_b \text{CC} - (k_b K_{eff} \text{CC} + k_c) P_{context}
\tag{S.22}
$$

with positive coefficients $k_b, k_c$ determined by the specific predictive task and system architecture. The coefficient $k_b$ quantifies the predictive utility per unit of effective CC, while $k_c$ represents the resource scarcity factor (related to $\lambda$ in the global PCE potential, Definition D.1).

For $\text{CC} \ll \alpha$, we approximate $P_{context}(\text{CC}) \approx (A/\alpha^2) \text{CC}^2$ from Equation S.5. Substituting into Equation S.22:
$$
B_{net}(\text{CC}) = k_b \text{CC} - \left(k_b K_{eff} \text{CC} + k_c\right) \frac{A}{\alpha^2} \text{CC}^2
\tag{S.23}
$$

The stationarity condition $dB_{net}/d\text{CC} = 0$ becomes:
$$
k_b - \frac{A}{\alpha^2}\left[3k_b K_{eff} \text{CC}^2 + 2k_c \text{CC}\right] = 0
\tag{S.24}
$$

Simplifying:
$$
k_b = \frac{A}{\alpha^2}\left[3k_b K_{eff} \text{CC} + 2k_c\right] \text{CC}
\tag{S.25}
$$

Rearranging into standard quadratic form:
$$
\left(\frac{3A k_b K_{eff}}{\alpha^2}\right) (\text{CC}^*)^2 + \left(\frac{2A k_c}{\alpha^2}\right) \text{CC}^* - k_b = 0
\tag{S.26}
$$

The positive root gives the PCE-optimal bias:
$$
\boxed{\text{CC}^* = \frac{-k_c + \sqrt{k_c^2 + \frac{3K_{eff}\alpha^2 k_b^2}{A}}}{3k_b K_{eff}}}
\tag{S.27}
$$

**Physical interpretation:** This demonstrates that any attempt to increase CC by raising the power $P_{context}$ ultimately triggers self-gravity-induced dephasing that reduces the effective bias $\text{CC}_{eff}$. The PCE optimum balances the benefit of the bias against both its direct resource cost ($k_c P_{context}$) and its indirect gravitational self-sabotage ($k_b K_{eff} \text{CC} P_{context}$). Systems naturally converge to this equilibrium through the adaptation dynamics described in Appendix D (Theorem D.5).

**Limiting behavior:**
- **Low resource cost** ($k_c \ll k_b K_{eff}$): $\text{CC}^* \propto \alpha/\sqrt{A K_{eff}}$, limited primarily by gravitational feedback
- **High resource cost** ($k_c \gg k_b K_{eff}$): $\text{CC}^* \propto k_b/k_c$, limited primarily by direct resource constraints
- **Balanced regime**: Both effects comparable, yielding intermediate optimal CC

## S.5 Schwarzschild Interpretation of the CC Causality Bound

The causality constraint $\text{CC} < 0.5$ (Theorem 39) admits a gravitational interpretation that complements the information-theoretic derivation. From Equation S.5, as $\text{CC} \to \alpha_{CC,\max}$, the required context power diverges: $P_{context} \to \infty$. The total energy associated with maintaining this context over timescale $\tau_c$ is:
$$
E_{context} = P_{context} \tau_c
\tag{S.28}
$$

The Schwarzschild radius (Schwarzschild, 1916; Misner et al., 1973) corresponding to energy $E_{context}$ is:
$$
r_s = \frac{2G E_{context}}{c^2} = \frac{2G P_{context} \tau_c}{c^2}
\tag{S.29}
$$

Substituting Equation S.5:
$$
r_s = \frac{2G \tau_c}{c^2} A \left[\frac{\text{CC}}{\alpha - \text{CC}}\right]^2
\tag{S.30}
$$

**Physical viability condition:** For the system to remain a viable physical object rather than collapsing into a black hole, we require:
$$
r_s < R_S
\tag{S.31}
$$

where $R_S = (3V_S/4\pi)^{1/3}$ is the characteristic radius of the aggregate. As $\text{CC} \to \alpha$, the Schwarzschild radius diverges: $r_s \to \infty$. Therefore, the bound $\text{CC} < \alpha$ is simultaneously:

1. **Information-theoretic constraint** (Theorem 39): Prevents deterministic FTL signaling by ensuring $|\Delta P| < 0.5$
2. **Gravitational collapse limit**: Prevents black hole formation by ensuring $r_s < R_S$ remains satisfiable

The specific value $\alpha_{CC,\max} < 0.5$ ensures operation well below both thresholds. To see why this particular value emerges, consider the weak-field approximation validity condition:
$$
\frac{\Phi_{context}}{c^2} = \frac{G M_{context}}{c^2 R_S} \ll 1
\tag{S.32}
$$

For the gravitational time dilation mechanism (Section S.3) to remain in the perturbative regime where Equations S.15-S.18 hold, we require:
$$
\frac{\Delta\tau_d}{\tau_c} = K_{eff} P_{context} \ll 1
\tag{S.33}
$$

From Equation S.21, this is precisely the condition that $\text{CC}_{eff} \approx \text{CC}$, i.e., that gravitational self-dephasing remains a small correction rather than a dominant effect. The bound $\text{CC} < 0.5$ ensures substantial safety margin below the regime where:
- Gravitational effects become nonlinear (requiring full GR, not weak-field approximation)
- Schwarzschild radius approaches system size
- Deterministic signaling becomes possible

**Theorem S.2 (Unified causality-gravity bound).**

The operational bound $\alpha_{CC,\max} < 0.5$ is necessary to simultaneously ensure:

(i) **Operational causality** (Postulate 2): No deterministic FTL signaling via quantum outcome forcing (Theorem 39)

(ii) **Physical viability**: Schwarzschild radius remains well below system size: $r_s/R_S \ll 1$

(iii) **Perturbative regime**: Weak-field approximation for gravitational time dilation remains valid: $\Phi_{context}/c^2 \ll 1$

*Proof.* Part (i) is Theorem 39. For part (ii), assume $\text{CC} \ge 0.5$. From Equation S.5, this implies $P_{context} \ge A\left[\frac{0.5}{\alpha - 0.5}\right]^2$. Physical viability (Equations S.30–S.31) requires $P_{context} < \frac{c^2 R_S}{2G\tau_c}$. For $\alpha$ near $0.5$, the lower bound diverges and violates this upper bound, forcing $r_s \ge R_S$, violating physical viability. For part (iii), from Equation S.33, if $\text{CC}$ approaches $\alpha$, then $P_{context} \to \infty$, forcing $\Phi_{context}/c^2 \to \infty$, invalidating the weak-field expansion. Therefore $\alpha < 0.5$ is necessary. $\square$

**Corollary S.2.1 (No arbitrary CC enhancement).**

No system, regardless of available energy budget, can achieve $\text{CC} \ge 0.5$ without either:
- Violating causality (enabling paradoxes)
- Collapsing into a black hole
- Invalidating the framework's perturbative approximations

This establishes the CC bound as a fundamental physical limit, not merely an engineering challenge.

## S.6 Non-Local Gravitational Influence via Entanglement

While the gravitational effects analyzed in Sections S.3-S.4 operate locally on the context-generating aggregate, for entangled systems the local gravitational field can affect distant measurement statistics without violating no-signaling. Unlike classical local hidden variable theories ruled out by Bell-type experiments (Bell, 1964; Clauser et al., 1969), the predictive substrate permits statistical correlations that respect no-signaling while allowing non-local influence through shared quantum states. This provides a concrete realization of the statistical FTL influence permitted by Postulate 3 and analyzed in Section 10.

**Setup:** Consider Alice and Bob sharing a maximally entangled two-qubit state:
$$
|\psi\rangle_{AB} = \frac{1}{\sqrt{2}}(|0\rangle_A|0\rangle_B + |1\rangle_A|1\rangle_B)
\tag{S.34}
$$

**Alice's action:** Alice creates a high-CC context state (Section 9, Definition L.1) that generates a local gravitational potential $\Phi_A$ in her spatial region. From Section S.3, this potential induces differential proper time accumulation between the ground state $|0\rangle_A$ and the excited state $|1\rangle_A$ (energy difference $\Delta E_A$). The relative quantum phase evolution for Alice's particle in this gravitational field acquires an additional contribution:
$$
\delta\phi_A = \frac{\Delta E_A \Phi_A t}{\hbar c^2}
\tag{S.35}
$$

where $\Delta E_A$ is the energy splitting of Alice's quantum system and $t$ is the interaction time.

**Modified entangled state:** After time $t$, only the excited component of Alice's particle has evolved a relative phase in the gravitational potential:
$$
|\psi(t)\rangle_{AB} = \frac{1}{\sqrt{2}}\left(|0\rangle_A|0\rangle_B + e^{i\delta\phi_A}|1\rangle_A|1\rangle_B\right)
\tag{S.36}
$$

**Bob's marginal statistics:** Computing Bob's reduced density operator:
$$
\rho_B = \text{tr}_A|\psi(t)\rangle\langle\psi(t)| = \frac{1}{2}(|0\rangle\langle 0| + |1\rangle\langle 1|)
\tag{S.37}
$$

This is unchanged from the initial state, confirming no-signaling: Bob cannot detect Alice's action through his local measurements alone.

**Joint measurement statistics:** However, joint measurements in the transverse basis ${|+\rangle, |-\rangle}$ (where $|\pm\rangle = \frac{1}{\sqrt{2}}(|0\rangle \pm |1\rangle)$) reveal correlation changes. For the outcome $|++\rangle$:
$$
\begin{aligned}
P(++|t) &= |\langle ++|\psi(t)\rangle|^2 = \left|\frac{1}{2\sqrt{2}}(1 + e^{i\delta\phi_A})\right|^2 \
&= \frac{1}{4}[1 + \cos(\delta\phi_A)]
\end{aligned}
\tag{S.38}
$$

Comparing to the initial correlations where $\delta\phi_A = 0$, $P(++|0) = 1/2$. The modification is:
$$
\Delta P(++) = P(++|t) - P(++|0) = \frac{1}{4}[\cos(\delta\phi_A) - 1]
\tag{S.39}
$$

For small gravitational phase $\delta\phi_A \ll 1$ (weak-field regime):
$$
\Delta P(++) \approx -\frac{\delta\phi_A^2}{8} \approx -\frac{1}{8}\left(\frac{\Delta E_A \Phi_A t}{\hbar c^2}\right)^2
\tag{S.40}
$$

Substituting the gravitational potential from the context state (Equations S.13-S.16):
$$
\Phi_A \sim \frac{2\pi G}{3} (1 + 3w_c) \frac{P_{context} \tau_c}{V_S c^2} r^2
\tag{S.41}
$$

Therefore:
$$
|\Delta P(++)| \sim \left(\frac{\Delta E_A t}{\hbar c^2}\right)^2 \left[\frac{2\pi G}{3} (1 + 3w_c) \frac{r^2}{V_S c^2}\right]^2 (P_{context} \tau_c)^2 \propto P_{context}^2
\tag{S.42}
$$

**Interpretation:** This is the *statistical FTL influence* mechanism described in Postulate 3:

1. Alice's local action (creating high-CC context) generates local gravitational field
2. Local gravitational field affects only Alice's particle (local interaction)
3. Because Alice's particle is entangled with Bob's, the global entanglement correlations are modified
4. Bob's marginal statistics remain unchanged (no-signaling preserved, Equation S.37)
5. Joint statistics $P(ij)$ are modified, detectable only through comparison between Alice and Bob
6. Effect is probabilistic, not deterministic: cannot force specific outcomes
7. Detection requires many samples: $N \gtrsim 1/|\Delta P|^2 \sim 1/P_{context}^4$

**Detection requirements:** From Theorem 40, detecting a bias of magnitude $|\Delta P|$ requires:
$$
N_{samples} \gtrsim \frac{1}{|\Delta P|^2} \sim \frac{1}{P_{context}^4}
\tag{S.43}
$$

Since $P_{context} \sim \text{CC}^2$ (Equation S.5 for small CC), this becomes:
$$
N_{samples} \gtrsim \frac{1}{\text{CC}^8}
\tag{S.44}
$$

For $\text{CC} \sim 0.1$, this requires $N \sim 10^8$ joint measurements. Crucially, these measurements must be:
- Spacelike-separated (ensuring no subluminal communication during measurement)
- Post-selected and compared (requiring classical communication afterward)
- Statistically aggregated (individual outcomes remain random)

**Distinguishing feature:** This mechanism is unique to gravity among fundamental interactions because:

- **Universal coupling:** Gravity couples to all systems via energy-momentum, requiring no specific quantum numbers or susceptibilities
- **Phase coherence preservation:** Gravitational time dilation modifies phase evolution without direct dissipation
- **Entanglement compatible:** Effect operates through phase shifts on individual subsystems, compatible with quantum coherence

Alternative mechanisms (e.g., electromagnetic, analyzed in Appendix L) can also create non-local correlations through entanglement, but require specific coupling structures (dipole moments, charge distributions). The gravitational channel provides a universal substrate for statistical influence that applies to any quantum system.

**Theorem S.3 (Gravitational non-local influence bounds).**

For an entangled bipartite system with Alice implementing CC capability $\text{CC}(S_A)$ through context state maintaining power $P_{context}$ over coherence time $\tau_c$, the modification to joint measurement statistics at Bob's location (spacelike-separated from Alice) satisfies:

$$
|\Delta P_{joint}| \lesssim \left(\frac{\Delta E_A \Phi_A t}{\hbar c^2}\right)^2 \lesssim \left(\frac{\Delta E_A t}{\hbar c^2}\right)^2 K_A^2 P_{context}^2 \lesssim \left(\frac{\Delta E_A t}{\hbar c^2}\right)^2 K_A^2 \left[\frac{\text{CC}(S_A)}{\alpha - \text{CC}(S_A)}\right]^4 A^2
\tag{S.45}
$$

where $K_A := \frac{2\pi G}{3} (1 + 3w_c)\frac{\tau_c r_A^2}{V_S c^2}$ is the geometric potential-to-power factor for Alice's system and $\Delta E_A$ is the energy splitting of the entangled states.

*Proof.*

**Step 1 (Gravitational phase to probability):** From Equation S.40, for small gravitational phase $\delta\phi_A \ll 1$:
$$
|\Delta P(++)| \approx \frac{\delta\phi_A^2}{8} = \frac{1}{8}\left(\frac{\Delta E_A \Phi_A t}{\hbar c^2}\right)^2
$$
This establishes the first inequality with implicit coefficient $1/8$.

**Step 2 (Potential to power):** From Equation S.41, the gravitational potential scales as:
$$
\Phi_A \sim \frac{2\pi G}{3} (1 + 3w_c) \frac{P_{context} \tau_c}{V_S c^2} r_A^2 = K_A P_{context}
$$
Substituting into the phase expression:
$$
\delta\phi_A = \frac{\Delta E_A t}{\hbar c^2} \Phi_A = \frac{\Delta E_A t}{\hbar c^2} K_A P_{context}
$$
This establishes the second inequality.

**Step 3 (Power to CC):** From Equation S.5, $P_{context} = A[\text{CC}/(\alpha - \text{CC})]^2$. For the scaling relation:
$$
P_{context}^2 = A^2 \left[\frac{\text{CC}(S_A)}{\alpha - \text{CC}(S_A)}\right]^4
$$
Substituting establishes the third inequality. $\square$

**Experimental implications:** This provides a concrete test distinguishing gravitational vs. purely electromagnetic CC mechanisms:

- **Pure EM prediction** (Appendix L): Non-local effects scale with radiated field strength $\propto P_{EM}$
- **Gravitational contribution** (this section): Non-local effects scale with total energy density $\propto P_{context}^2$
- **Test protocol:** Vary the ratio of radiated power to total power while maintaining constant CC capability; gravitational mechanism predicts correlation with total energy budget, EM mechanism predicts correlation with radiated power.

## S.7 Detailed Gravitational Decoherence Mechanism

The gravitational field produced by the context stress-energy induces time dilation gradients that decohere quantum superpositions (Zurek, 2003; Joos et al., 2003; Schlosshauer, 2007). This provides a distinct decoherence mechanism complementary to environmental interaction.

Section S.3 established that gravitational time dilation produces differential proper time accumulation $\Delta\tau_d = K P_{context}$. We now derive explicitly how this differential time accumulation causes decoherence, reducing the effective CC capability.

### S.7.1 Phase Decoherence from Time Dilation Gradients

Consider a quantum system with energy eigenstates $|i\rangle$ having energies $E_i$, positioned in the gravitational field of a high-CC aggregate. Different spatial locations within the system experience different gravitational potentials due to the gradient:
$$
\nabla\Phi(r) = g_{CC}(r) = \frac{4\pi G}{3} (1 + 3w_c) \frac{u_{context}}{c^2} r \hat{r}
\tag{S.46}
$$

For a quantum system with spatial extent $L_q$, the potential difference is $\Delta\Phi \approx |\nabla\Phi| L_q$ (Equation S.16). This creates differential proper time rates at different locations within the system:
$$
\frac{d\tau}{dt}\bigg|_{r} = 1 + \frac{\Phi(r)}{c^2}, \qquad \frac{d\tau}{dt}\bigg|_{r+L_q} = 1 + \frac{\Phi(r+L_q)}{c^2}
\tag{S.47}
$$

The difference in proper time rates is:
$$
\Delta\left(\frac{d\tau}{dt}\right) = \frac{\Delta\Phi}{c^2}
\tag{S.48}
$$

Over interaction time $\tau_c$, this produces differential proper time accumulation:
$$
\Delta\tau_{diff} = \frac{\Delta\Phi}{c^2} \tau_c
\tag{S.49}
$$

### S.7.2 Decoherence of Superposition States

For a quantum superposition state:
$$
|\psi\rangle = \sum_i c_i |i\rangle
\tag{S.50}
$$

the phase evolution in the gravitational field differs for each energy eigenstate. At spatial location $r$, the phase accumulation for state $|i\rangle$ is:
$$
\phi_i(r) = -\frac{E_i}{\hbar} \int_0^{\tau_c} \left[1 + \frac{\Phi(r,t)}{c^2}\right] dt \approx -\frac{E_i \tau_c}{\hbar} - \frac{E_i}{\hbar c^2} \int_0^{\tau_c} \Phi(r,t) dt
\tag{S.51}
$$

For quasi-static gravitational field, $\Phi(r,t) \approx \Phi(r)$:
$$
\phi_i(r) \approx -\frac{E_i \tau_c}{\hbar}\left[1 + \frac{\Phi(r)}{c^2}\right]
\tag{S.52}
$$

The differential phase accumulation between two energy eigenstates $|i\rangle$ and $|j\rangle$ across the spatial extent $L_q$ is:
$$
\Delta\phi_{ij} = \big[\phi_i(r+L_q)-\phi_j(r+L_q)\big]-\big[\phi_i(r)-\phi_j(r)\big]
= -\frac{(E_i - E_j)\Delta\Phi \tau_c}{\hbar c^2}
\tag{S.53}
$$

This isolates the gravitational contribution to the relative phase between $|i\rangle$ and $|j\rangle$ across the system's extent. For energy splitting $\Delta E_{ij} = E_i - E_j$:
$$
\Delta\phi_{ij}^{(grav)} = -\frac{\Delta E_{ij} \Delta\tau_{diff}}{\hbar} = -\frac{\Delta E_{ij}}{\hbar} \frac{\Delta\Phi \tau_c}{c^2}
\tag{S.54}
$$

Substituting Equation S.18:
$$
\Delta\phi_{ij}^{(grav)} = -\frac{\Delta E_{ij}}{\hbar} K P_{context}
\tag{S.55}
$$

### S.7.3 Decoherence Rate and Coherence Time Suppression

When the gravitational phase shift becomes comparable to unity, $|\Delta\phi_{ij}^{(grav)}| \sim 1$, coherence between states $|i\rangle$ and $|j\rangle$ is lost. This defines an effective decoherence rate:
$$
\Gamma_{deco}^{(ij)} = \frac{1}{\tau_{deco}} \sim \frac{|\Delta\phi_{ij}^{(grav)}|}{\tau_c} \sim \frac{\Delta E_{ij}}{\hbar} K_{eff} P_{context}
\tag{S.56}
$$

where $K_{eff} = K/\tau_c$ (Equation S.20).

For a quantum system with characteristic energy splitting $\Delta E$ (e.g., typical level spacing or transition frequency), following standard decoherence theory (Zurek, 1991, 2003), the decoherence rate is:
$$
\boxed{\Gamma_{deco} = \frac{\Delta E}{\hbar} K_{eff} P_{context}}
\tag{S.57}
$$

The effective coherence time is reduced from its baseline value $\tau_{coh}^0$ (determined by environmental decoherence sources) by the gravitational contribution:
$$
\frac{1}{\tau_{coh}^{eff}} = \frac{1}{\tau_{coh}^0} + \Gamma_{deco} = \frac{1}{\tau_{coh}^0} + \frac{\Delta E}{\hbar} K_{eff} P_{context}
\tag{S.58}
$$

For $\Gamma_{deco} \tau_{coh}^0 \ll 1$ (weak gravitational decoherence):
$$
\tau_{coh}^{eff} \approx \tau_{coh}^0 \left(1 - \Gamma_{deco} \tau_{coh}^0\right) = \frac{\tau_{coh}^0}{1 + K_{\Gamma} P_{context}}
\tag{S.59}
$$

where:
$$
K_{\Gamma} := \frac{\Delta E}{\hbar} K_{eff} \tau_{coh}^0 = \frac{4\pi G}{3c^4} (1 + 3w_c) \frac{\Delta E}{\hbar} \frac{r L_q \tau_c \tau_{coh}^0}{V_S}
\tag{S.60}
$$

### S.7.4 Net Effective CC Including Decoherence

The achievable CC bias depends on maintaining quantum coherence over the interaction timescale. From Definition 30, the operational CC measures the maximum achievable probability modification. When coherence is reduced, the effective interaction time is limited:
$$
\tau_{eff} = \min(\tau_c, \tau_{coh}^{eff})
\tag{S.61}
$$

For context coherence time $\tau_c$ exceeding the gravitationally-limited quantum coherence time $\tau_{coh}^{eff}$, the net effective CC becomes:
$$
\text{CC}_{eff} = \text{CC}_{ideal} \cdot \frac{\tau_{coh}^{eff}}{\tau_c}
\tag{S.62}
$$

where $\text{CC}_{ideal}$ is the CC capability assuming perfect quantum coherence. Substituting Equation S.59:
$$
\boxed{\text{CC}_{eff} = \frac{\text{CC}_{ideal}}{1 + K_{\Gamma} P_{context}}}
\tag{S.63}
$$

For small gravitational effect $K_{\Gamma} P_{context} \ll 1$:
$$
\text{CC}_{eff} \approx \text{CC}_{ideal}(1 - K_{\Gamma} P_{context})
\tag{S.64}
$$

This is the decoherence-based derivation of the effective CC suppression asserted in Equation S.21. Substituting $P_{context}(\text{CC})$ from Equation S.5:
$$
\text{CC}_{eff} = \text{CC}_{ideal} \left[1 - K_{\Gamma} A \left(\frac{\text{CC}_{ideal}}{\alpha - \text{CC}_{ideal}}\right)^2\right]
\tag{S.65}
$$

**Physical mechanism summary:**

1. High-CC context requires power $P_{context} \sim \text{CC}^2$ (Equation S.5)
2. Power creates energy density $u_{context} = P_{context}\tau_c/V_S$ (Equation S.6)
3. Energy density sources gravitational field $\Phi \sim G u_{context} r$ (Equation S.15)
4. Gravitational gradient across quantum system creates $\Delta\Phi \sim g_{CC} L_q$ (Equation S.16)
5. Time dilation gradient produces differential phase evolution $\Delta\phi \sim \Delta E \Delta\Phi/(c^2 \hbar)$ (Equation S.54)
6. Phase gradient causes decoherence at rate $\Gamma_{deco} \sim \Delta E K_{eff} P_{context}/\hbar$ (Equation S.57)
7. Decoherence reduces effective coherence time $\tau_{coh}^{eff}$ (Equation S.59)
8. Reduced coherence time limits effective CC capability (Equation S.63)
9. PCE optimization balances utility against both direct cost and gravitational self-limitation (Section S.4)

**Comparison with Section S.4:** The simplified model in Section S.4 (Equation S.21) assumed $\text{CC}_{eff} = \text{CC}(1 - K_{eff}P_{context})$, equivalent to $\text{CC}(1 - \Delta\tau_d/\tau_c)$. This section provides the detailed quantum-mechanical derivation showing how $\Delta\tau_d$ causes decoherence through energy-dependent phase accumulation, yielding the equivalent result with explicit identification of the relevant energy scale $\Delta E$.

## S.8 Integration with Appendix L

This appendix analyzes gravitational feedback effects that limit CC efficacy. For comprehensive treatment of CC implementation mechanisms, energy accounting, and practical experimental protocols, see Appendix L. The relationship between these appendices is complementary, not competitive.

### S.8.1 Division of Labor

**Appendix L provides:**

1. **Primary influence mechanisms**
   - Electromagnetic coupling via AC Stark shifts (Theorem L.2, Corollary L.2.1)
   - Coherent charge oscillation mechanism (Section L.11)
   - Biological implementation pathways (Section L.4.1, speculative)
   - Universal temporal wave framework (Theorem L.8)

2. **Electromagnetic dominance**
   - Quantitative demonstration: $\mathcal{R} \sim 6 \times 10^{36}$ for external fields (Theorem L.5)
   - Worked example with realistic parameters (Section L.11.4)
   - Detection achievable in ~6 seconds with modern ion trap arrays

3. **Complete energy accounting**
   - Energy conservation: $P_{agg} = P_{EM} + P_{other}$ (Equation L.36)
   - Stress-energy decomposition: $T_{\mu\nu}^{(MPU)} = T_{\mu\nu}^{(baseline)} + \Delta T_{\mu\nu}^{(CC)} + T_{\mu\nu}^{(EM)}$ (Equation S.9)
   - No double-counting; covariant conservation $\nabla^\mu T_{\mu\nu}^{(MPU)} = 0$ (Theorem B.5)
   - Horizon thermodynamics consistency (Theorem L.7)

4. **Universal requirements**
   - Implementation-independent constraints (Theorem L.9)
   - Threshold behavior: $C_{agg} \le C_{op} \implies \text{CC} = 0$
   - POP/PCE optimization conditions (Lemma L.1, Theorem L.1)

5. **Experimental protocols**
   - Protocol L.1: Electromagnetic channel detection (feasible, 6-second integration)
   - Protocol L.2: Energy conservation verification (calorimetry)
   - Protocol L.3: Gravitational channel test (expects null result, confirming dominance)

**This appendix (Appendix S) provides:**

1. **Gravitational feedback analysis**
   - Resource cost to gravitational field mapping (Sections S.1-S.3)
   - Self-limiting feedback loop quantification (Section S.4)
   - PCE optimization including feedback (Equation S.27)

2. **Unique gravitational phenomena**
   - Entanglement non-local influence mechanism (Section S.6)
   - Schwarzschild interpretation of CC bound (Section S.5)
   - Detailed decoherence mechanism (Section S.7)

3. **Theoretical bounds and interpretations**
   - Unified causality-gravity constraint (Theorem S.2)
   - Physical viability limits (Corollary S.2.1)
   - Self-limitation prevents arbitrary CC enhancement

### S.8.2 Unified Physical Picture

Both appendices describe manifestations of the same underlying process—the conversion of information structure (high-complexity predictive states) into physical influence (quantum outcome bias)—viewed through different channels and analyzed at different scales.

**Energy flow (forward direction - Appendix L focus):**
$$
\text{Context state} \xrightarrow{\text{PCE-optimal mapping}} P_{agg} \to \begin{cases}
P_{EM} & \to \text{EM fields} \to \text{AC Stark shifts} \to \Delta P \\
P_{other} & \to \text{internal energy} \to \text{gravitational potential}
\end{cases}
$$

**Feedback constraint (reverse direction - Appendix S focus):**
$$
P_{context} \to u_{context} \to \Phi_{grav} \to \Delta\tau_d \to \Gamma_{deco} \to \tau_{coh}^{eff} \downarrow \to \text{CC}_{eff} \downarrow
$$

**Complete cycle:**
$$
\text{CC}_{desired} \xrightarrow{\text{requires}} P_{context} \xrightarrow{\text{creates}} \Phi_{grav} \xrightarrow{\text{limits}} \text{CC}_{eff} \xrightarrow{\text{PCE opt}} \text{CC}^*
$$

The equilibrium operational CC emerges from balancing forward drive (utility of bias) against backward constraint (cost + self-limitation).

### S.8.3 Channel Hierarchy and Frequency Decomposition

From Appendix L (Theorem L.8), the aggregate's temporal modulation of the causal medium admits frequency decomposition:
$$
\delta\tau(x,t) = \int_{-\infty}^{\infty} d\omega \, \tilde{\delta\tau}(x,\omega) e^{-i\omega t}
\tag{S.66}
$$

Different frequency regimes couple through different emergent channels:

**High-frequency regime** ($\omega \gg 1/\tau_{medium}$):
- Rapid phase modulation requires compensating gauge fields (Appendix G)
- Manifests as electromagnetic radiation (Appendix L, Theorem L.2)
- Coupling strength: $\alpha_{em} \sim 10^{-2}$ (Appendix Z)
- Dominates practical influence: $\mathcal{R} \sim 6\times10^{36}$ (Appendix L, Theorem L.5)


**Low-frequency regime** ($\omega \ll 1/\tau_{medium}$):
- Quasi-static energy density modification
- Sources gravitational potential (this appendix, Section S.3)
- Coupling strength: $\alpha_{grav} \sim 10^{-45}$ for electron mass (Appendix L, Equation L.85)
- Provides universal energy accounting and feedback limit

Both channels draw from the same power budget $P_{agg}$ and both contribute to the total stress-energy $T_{\mu\nu}^{(MPU)}$ (Theorem L.6). The hierarchy reflects the information-theoretic structure of the predictive substrate:
- EM coupling: local phase coherence (high information bandwidth, $\sim \alpha_{em}$)
- Gravitational coupling: global boundary entropy (low information bandwidth, $\sim \alpha_{grav}$)

The ratio $\alpha_{em}/\alpha_{grav} \sim 10^{43}$ (Appendix L, Equation L.86) emerges from framework fundamentals:
$$
\frac{\alpha_{em}}{\alpha_{grav}} \sim \frac{\text{gauge coherence optimization (App G, Z)}}{\text{horizon information density (App E)}}
\tag{S.67}
$$

### S.8.4 Experimental Complementarity

The experimental programs in Appendix L and this appendix address different aspects:

**Appendix L protocols test:**
- Whether CC influence exists and operates primarily through EM channel
- Energy conservation in CC processes (calorimetry)
- Whether gravitational channel is negligible (expects null result)
- Detection timescales: seconds to hours

**This appendix's implications test:**
- Self-limiting feedback loop existence (measure CC vs. $P_{context}$, should saturate)
- Entanglement non-local mechanism (Section S.6, requires spacelike-separated correlated measurements)
- Schwarzschild bound approach (attempt maximal CC, should fail before $r_s \to R_S$)
- Decoherence mechanism (measure $\tau_{coh}$ vs. local gravitational potential)

Both programs are necessary for complete framework validation. Appendix L establishes how CC works; this appendix establishes why CC is bounded and self-limiting.

### S.8.4a Experimental Discrimination: EM vs. Gravitational Channels

To distinguish electromagnetic from gravitational CC mechanisms, the following differential tests apply:

**Test 1 (Power Partitioning):** Vary the ratio $P_{EM}/P_{agg}$ while maintaining constant $P_{context}$:
- EM prediction: $|\Delta P| \propto P_{EM}$ (Theorem L.2, field amplitude scaling)
- Gravitational prediction: $|\Delta P| \propto P_{context}^2$ (Equation S.42)
- Protocol: Use variable-efficiency radiators; measure correlation of CC effect with radiated vs. total power

**Test 2 (Distance Scaling):** Measure $|\Delta P(r)|$ at varying target distances:
- EM far-field: $|\Delta P| \propto 1/r^2$ (Equation L.80)
- EM near-field: $|\Delta P| \propto 1/r^3$ (evanescent regime)
- Gravitational: $|\Delta P| \propto 1/r^2$ but with coefficient $\sim 10^{-36}$ smaller (Theorem L.5)
- Protocol: Logarithmic distance scan; fit scaling exponent and amplitude

**Test 3 (Frequency Dependence):** Vary modulation frequency $\omega$ of context state:
- EM prediction: Strong resonance at $\omega \approx \omega_{TLS}$ (AC Stark, Corollary L.2.1)
- Gravitational prediction: Frequency-independent for $\omega \ll 1/\tau_{medium}$ (Theorem L.8)
- Protocol: Sweep $\omega_{rad}$ through target resonance; measure $|\Delta P(\omega)|$

**Test 4 (Shielding Response):** Apply selective shielding:
- EM shielding (Faraday cage): Should eliminate EM contribution
- Gravitational shielding: Not possible (equivalence principle)
- Protocol: Compare CC effect with/without EM shielding at constant $P_{context}$

**Expected Outcome:** EM dominance (Theorem L.5) predicts Tests 1-3 follow EM scaling, Test 4 shows strong shielding effect. Observation of gravitational-dominated behavior would require $\mathcal{R} \lesssim 1$, contradicting Theorem L.5 and indicating new physics.

### S.8.5 Theoretical Integration Points

Several framework elements require both appendices for complete understanding:

**1. CC causality bound ($\alpha_{CC,\max} < 0.5$)**
- Information-theoretic derivation: Theorem 39 (Section 10)
- Gravitational interpretation: Section S.5 (this appendix)
- Both perspectives necessary; neither sufficient alone

**2. Context power requirement**
- Scaling law: Equation S.5 (this appendix)
- Energy accounting: Theorem L.6 (Appendix L)
- Channel distribution: Theorem L.8 (Appendix L)

**3. Stress-energy tensor $T_{\mu\nu}^{(MPU)}$**
- Construction: Definition B.8 (Appendix B)
- Decomposition: Equation L.37 (Appendix L), refined as Equation S.9 (this appendix)
- CC contribution: $\Delta T_{\mu\nu}^{(CC)}$ (Section S.2, this appendix)
- Conservation: Theorem B.5 (Appendix B)

**4. Horizon thermodynamics**
- Area law derivation: Theorem 49, Appendix E
- Application to CC: Theorem L.7 (Appendix L)
- Self-limitation from thermodynamics: implicit throughout this appendix

**5. PCE optimization**
- General framework: Definition 15, Appendix D
- Complexity adaptation: Theorem D.8 (Appendix D)
- CC-specific optimization: Section S.4 (this appendix)
- Mapping existence: Theorem L.1 (Appendix L)

### S.8.6 Energy Accounting Consistency

Energy accounting between this appendix and Appendix L is established by Theorem L.6: the total power $P_{agg}$ decomposes into mutually exclusive channels (Equation L.40), each contributing exactly once to $T_{\mu\nu}^{(MPU)}$ (Equation L.38). The context power $P_{context}$ analyzed here partitions between radiated (entering $T_{\mu\nu}^{(EM)}$, dominating practical influence) and non-radiated components (entering $T_{\mu\nu}^{(matter)}$, sourcing gravitational feedback). Covariant conservation $\nabla^\mu T_{\mu\nu}^{(MPU)} = 0$ (Theorem B.5) guarantees consistency.

## S.9 Conclusion

This appendix has established the gravitational self-limitation mechanism for Consciousness Complexity through rigorous derivation from framework fundamentals:

**Key results:**

1. **Power cost scaling** (S.1): $P_{context} = A[\text{CC}/(\alpha - \text{CC})]^2$, diverging as CC approaches causality bound

2. **Stress-energy contribution** (S.2): Context state contributes $\Delta T_{\mu\nu}^{(CC)}$ to total MPU stress-energy, properly accounting for all energy flows

3. **Gravitational time dilation** (S.3): Power creates energy density sourcing gravitational field, producing differential proper time $\Delta\tau_d = K P_{context}$

4. **PCE-optimal equilibrium** (S.4): Natural selection for CC configuration balancing utility against cost plus self-limitation, yielding optimal $\text{CC}^*$

5. **Schwarzschild interpretation** (S.5): CC bound $\alpha < 0.5$ is simultaneously information-theoretic constraint and gravitational collapse limit

6. **Entanglement non-local influence** (S.6): Local gravitational field affects distant correlations without violating no-signaling, providing concrete realization of statistical FTL

7. **Decoherence mechanism** (S.7): Time dilation gradient causes phase decoherence at rate $\Gamma_{deco} \sim (\Delta E/\hbar) K_{eff} P_{context}$, reducing effective coherence time and limiting CC

8. **Integration with L** (S.8): Gravitational feedback complements electromagnetic dominance; both essential for complete framework consistency

**Physical picture:** High-CC contexts require power that necessarily creates gravitational fields. These fields feed back to disrupt the quantum coherence required for CC operation. PCE optimization drives systems to an equilibrium where:
- CC is high enough to provide predictive utility
- But not so high that gravitational self-disruption dominates
- Resource costs remain sustainable
- Causality is preserved

This self-limiting mechanism, operating alongside the electromagnetic dominance established in Appendix L, ensures CC remains a bounded, physically consistent capability that enhances predictive performance without violating fundamental constraints. The framework's unity—from awareness as fundamental (Appendix P) through MPU dynamics (Section 7) to spacetime emergence (Sections 11-12) to CC capability (Section 9) and finally to this gravitational feedback—demonstrates the deep consistency of deriving physical law from predictive optimization under thermodynamic limits.

