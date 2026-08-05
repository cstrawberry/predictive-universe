# Appendix S: Resource Cost, Stress-Energy, and the Gravitational Self-Limitation of CC

On the global quadratic-cost, retained-source, weak-field, dephasing, and coherence-response branches analyzed here, a sustained context capable of biasing quantum outcome statistics carries a registered resource cost whose retained energy contributes to stress-energy and produces gravitational self-dephasing that limits efficacy. This appendix quantifies that conditional feedback mechanism, complementing the electromagnetic and biological models in Appendix L. Proposition L.5 proves that the electromagnetic-to-gravitational response ratio remains undetermined until the carrier, target, geometry, retention, normalization, likelihood, covariance, and uncertainty inputs are registered in common units.

## S.1 Resource Cost of the Context State

Let $\text{CC}(S)$ denote the operational bias capability of system $S$ (Definition 30). The framework's CC scaling law (Definition 32) is:
$$
\text{CC}(S) = \alpha_{CC,max} \frac{C_{agg} - C_{op}}{C_{scale} + (C_{agg} - C_{op})}
\tag{S.1}
$$

Define the active context complexity above baseline as $C_{context} := C_{agg} - C_{op}$. Solving for $C_{context}$ in terms of $\text{CC}$ yields:
$$
C_{context} = C_{scale} \frac{\text{CC}}{\alpha_{CC,max} - \text{CC}}
\tag{S.2}
$$

On the quadratic operational-cost branch, assume
$$
R(C_{op}+x)-R(C_{op})=r_px^2,
\qquad r_p>0,
\qquad x\ge0.
\tag{S.3}
$$
This is a constitutive branch assumption. Convexity alone would give only a local Taylor formula with a remainder.

Using $x=C_{context}=C_{scale}\mathrm{CC}/(\alpha_{CC,max}-\mathrm{CC})$, the additional maintenance power is
$$
P_{context}
=r_pC_{context}^2
=r_pC_{scale}^2\left[\frac{\mathrm{CC}}{\alpha_{CC,max}-\mathrm{CC}}\right]^2.
\tag{S.4}
$$
With $A:=r_pC_{scale}^2$,
$$
\boxed{P_{context}(\mathrm{CC})
=A\left[\frac{\mathrm{CC}}{\alpha_{CC,max}-\mathrm{CC}}\right]^2.}
\tag{S.5}
$$
On this global quadratic branch, $P_{context}$ diverges as $\mathrm{CC}\uparrow\alpha_{CC,max}$. If S.3 is retained only as a local Taylor expansion, S.4–S.5 are valid only for $C_{context}$ inside the certified Taylor neighborhood and no endpoint divergence follows from that expansion.

**Connection to Appendix L:** This power $P_{context}$ is a component of the total aggregate power $P_{agg}$ analyzed in Appendix L (Theorem L.6). For systems implementing CC through electromagnetic field generation, $P_{context}$ contributes to both the radiated power $P_{EM}$ and internal operational costs $P_{other}$, with the complete energy accounting given by $P_{agg} = P_{EM} + P_{other}$ (Equation L.36).

## S.2 The CC-Context Stress-Energy Tensor $\Delta T_{\mu\nu}^{(CC)}$

Assume the context state occupies volume $V_S$. Model its effective stress-energy contribution as a perfect fluid with equation-of-state parameter $w_c:=p_{\mathrm{context}}/u_{\mathrm{context}}\in[0,1]$. On the retained-energy branch,
$$
E_{\mathrm{grav}}^{\mathrm{inst}}
=
\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c,
\qquad
0<\eta_{\mathrm{ret}}\le1,
$$
and therefore
$$
u_{\mathrm{context}}
=
\frac{\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c}{V_S},
\qquad
p_{\mathrm{context}}=w_cu_{\mathrm{context}}.
\tag{S.6}
$$
The ideal fully retained branch sets $\eta_{\mathrm{ret}}=1$. Cumulative work is not a local gravitational source unless the corresponding energy remains localized in the source region.

In the rest frame of system $S$, the perfect-fluid stress-energy tensor (Landau & Lifshitz, 1975; Weinberg, 1972) is:
$$
\Delta T_{\mu\nu}^{(CC)} = \operatorname{diag}(u_{context}, p_{context}, p_{context}, p_{context})
\tag{S.7}
$$

For the relativistic fluid case $w_c = 1/3$:
$$
\Delta T_{\mu\nu}^{(CC)} = u_{context} \cdot \operatorname{diag}(1, 1/3, 1/3, 1/3)
\tag{S.8}
$$

This stress-energy contribution is properly incorporated into the total MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}$ as detailed in Appendix B (Definition B.8) and Appendix L (Theorem L.6). The decomposition is:
$$
T_{\mu\nu}^{(MPU)} = T_{\mu\nu}^{(baseline)} + \Delta T_{\mu\nu}^{(CC)} + T_{\mu\nu}^{(EM)}
\tag{S.9}
$$

where $T_{\mu\nu}^{(baseline)}$ represents the minimal operational state stress-energy ($C_{agg} = C_{op}$), $\Delta T_{\mu\nu}^{(CC)}$ is the additional matter contribution from maintaining high-complexity context, and $T_{\mu\nu}^{(EM)}$ accounts for any electromagnetic field generation (Theorem L.2).

**Result (Self-limiting CC bound under resource ceiling).** Suppose $u_{\mathrm{context}}\le u_{\max}$ and
$$
P_{\mathrm{context}}\ge\frac{\Gamma_0 C_{\mathrm{context}}}{\tau_c}.
$$
Since
$$
u_{\mathrm{context}}
=\frac{\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c}{V_S},
$$
one has
$$
u_{\mathrm{context}}
\ge
\eta_{\mathrm{ret}}\frac{\Gamma_0}{V_S}C_{\mathrm{context}}
=\eta_{\mathrm{ret}}\kappa_*C_{\mathrm{context}},
\qquad
\kappa_*:=\frac{\Gamma_0}{V_S}.
$$
Combining this with
$$
\mathrm{CC}
=\alpha_{CC,\max}
\frac{C_{\mathrm{context}}}
{C_{\mathrm{context}}+C_{\mathrm{scale}}}
$$
gives
$$
\boxed{
\mathrm{CC}
\le
\alpha_{CC,\max}
\frac{u_{\max}}
{u_{\max}+\eta_{\mathrm{ret}}\kappa_*C_{\mathrm{scale}}}
}.
\tag{S.10}
$$

Higher available energy density raises the operational cap. Independently, the bounded-bias branch declares $\text{CC}<\alpha_{CC,max}<0.5$; Theorem 39 supplies its endpoint-complete consequence, while exact causal compliance requires Theorem 39c.

**Theorem S.1 (Local CPTP CC Branch: No-Signaling and Gravitational Bound).**

Let a bipartite system $AB$ be prepared in state $\rho_{AB}$. Let the local CC device on subsystem $A$ be described by a one-parameter family of completely positive, trace-preserving (CPTP) maps (Nielsen & Chuang, 2010; Watrous, 2018) $\{\Phi_A^{(\epsilon)}\}_{\epsilon}$ with $\|\Phi_A^{(\epsilon)} - \mathcal{E}_A\|_{\diamond} \le \alpha < 1/2$, where $\mathcal{E}_A$ is the baseline (zero-CC) channel and $\|\cdot\|_{\diamond}$ is the diamond norm — the appropriate channel norm for bipartite stability under tensoring with identity, since the induced trace norm $\|\cdot\|_{1 \to 1}$ does not in general bound $\|(\Phi - \mathcal{E}) \otimes \mathrm{id}\|_{1 \to 1}$ on entangled inputs (Watrous, 2018, §3.3).

This theorem applies on the local CPTP CC branch — under which CC is implemented as a strictly local CPTP perturbation of subsystem $A$. Such perturbations cannot realize Bob-side marginal shifts: they only modify joint correlations detectable after classical comparison of measurement records. The local CPTP CC branch is therefore a separate scope from any main-text claim of statistical Bob-marginal influence; reconciling those would require a different (non-CPTP, or non-local) mechanism rather than the model of this theorem. Let this map act before a product measurement $\{E_i \otimes F_j\}$. Then the marginal on $B$ is unchanged for all $\epsilon$:
$$
\sum_i \text{tr}\!\left[(\Phi_A^{(\epsilon)} \otimes \text{id}_B)(\rho_{AB}) (E_i \otimes F_j)\right] = \text{tr}\!\left[\rho_B F_j\right]
\tag{S.11}
$$

Moreover, assume a weak-field geometric bound
$$
\frac{|\Delta\Phi|}{c^2}
\le
C_{\mathrm{geom}}\frac{Gu_{\mathrm{context}}L^2}{c^4}
$$
and a calibrated local response channel $\mathcal D_{\Delta\Phi}$ satisfying
$$
\|\mathcal D_{\Delta\Phi}-\mathrm{id}\|_\diamond
\le
s_D\frac{|\Delta\Phi|}{c^2}
$$
throughout the stated operating regime. Then
$$
|\Delta P|
\le
\min\left\{
\alpha,\,
C_{\mathrm{geom}}s_D
\frac{Gu_{\mathrm{context}}L^2}{c^4}
\right\}.
\tag{S.12}
$$

*Proof.* Trace preservation of the local channel implies
$$
\operatorname{tr}_A[(\Phi_A^{(\epsilon)}\otimes\mathrm{id}_B)(\rho_{AB})]
=
\rho_B,
$$
so Bob's marginal probabilities are unchanged, proving (S.11). For any POVM effect $0\le M\le I$,
$$
|\Delta P|
\le
\|((\Phi_A^{(\epsilon)}-\mathcal E_A)\otimes\mathrm{id})(\rho_{AB})\|_1
\le
\|\Phi_A^{(\epsilon)}-\mathcal E_A\|_\diamond
\le\alpha.
$$
The calibrated gravitational response gives independently
$$
|\Delta P|
\le
\|\mathcal D_{\Delta\Phi}-\mathrm{id}\|_\diamond
\le
s_D\frac{|\Delta\Phi|}{c^2}
\le
C_{\mathrm{geom}}s_D\frac{Gu_{\mathrm{context}}L^2}{c^4}.
$$
Taking the smaller of the two bounds proves (S.12). A microscopic phase or dephasing model is part of the response calibration encoded by $s_D$. ∎

## S.3 Gravitational Self-Disruption

On the uniform spherical perfect-fluid source model assumed in Theorem S.3, and only after the complete conserved stress tensor—including any confinement or boundary stresses—is fixed, the weak-field active-density term is modeled as
$$
\rho_{\mathrm{source}}
=\frac{u_{\mathrm{context}}+3p_{\mathrm{context}}}{c^2}
=(1+3w_c)\frac{u_{\mathrm{context}}}{c^2}.
\tag{S.13}
$$
Equation (S.13) is a constitutive branch input for the calculation below, not a consequence of Theorem 50 for an arbitrary localized context-energy distribution. For $w_c = 1/3$:
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

Over the context coherence time $\tau_c$, this potential difference produces the weak-field differential proper-time accumulation
$$
\Delta\tau_d
=\frac{\Delta\Phi_{diff}}{c^2}\tau_c
=\frac{4\pi G}{3c^4}(1+3w_c)
\frac{\eta_{\mathrm{ret}}P_{context}\tau_c}{V_S}
rL_q\tau_c.
\tag{S.17}
$$
Thus
$$
\boxed{\Delta\tau_d=K P_{context}(\mathrm{CC})}
\tag{S.18}
$$
with
$$
K:=\frac{4\pi G}{3c^4}(1+3w_c)
\frac{\eta_{\mathrm{ret}}rL_q\tau_c^2}{V_S},
\tag{S.19}
$$
and
$$
K_{eff}:=\frac K{\tau_c}
=\frac{4\pi G}{3c^4}(1+3w_c)
\frac{\eta_{\mathrm{ret}}rL_q\tau_c}{V_S}.
\tag{S.20}
$$
The specialization $\eta_{\mathrm{ret}}=1$ is the fully retained estimate. For $w_c=1/3$, the prefactor is $8\pi G/(3c^4)$ times the displayed retention and geometry factors.

## S.4 PCE Optimization and Self-Limiting $\text{CC}^*$

Assume a calibrated unresolved-phase or noise ensemble converts the gravitational proper-time spread into an effective attenuation and that its small-response law is linear:
$$
\text{CC}_{eff}
=
\text{CC}
\left(
1-\frac{\Delta\tau_d}{\tau_c}
\right)
+O\!\left(
\left(\frac{\Delta\tau_d}{\tau_c}\right)^2
\right).
$$
Using $\Delta\tau_d/\tau_c=K_{\mathrm{eff}}P_{\mathrm{context}}$ gives
$$
\text{CC}_{eff}
=
\text{CC}(1-K_{\mathrm{eff}}P_{\mathrm{context}})
+O((K_{\mathrm{eff}}P_{\mathrm{context}})^2).
\tag{S.21}
$$
This formula is a phenomenological response branch; a deterministic tracked phase alone is not a dephasing channel.

On a phenomenological utility branch, let $k_b,k_c,A,K_{eff}>0$, write $\alpha:=\alpha_{CC,max}$, and define
$$
B_{net}(\mathrm{CC})
:=k_b\mathrm{CC}_{eff}-k_cP_{context}.
\tag{S.22}
$$
Assume $\mathrm{CC}\ll\alpha$ and $K_{eff}P_{context}\ll1$, so that $P_{context}=(A/\alpha^2)\mathrm{CC}^2$ and $\mathrm{CC}_{eff}=\mathrm{CC}(1-K_{eff}P_{context})$ are retained to the displayed order. Then
$$
B_{net}(\mathrm{CC})
=k_b\mathrm{CC}
-\frac A{\alpha^2}\left(k_bK_{eff}\mathrm{CC}^3+k_c\mathrm{CC}^2\right).
\tag{S.23}
$$
The stationarity equation is
$$
k_b-\frac A{\alpha^2}\left(3k_bK_{eff}\mathrm{CC}^2+2k_c\mathrm{CC}\right)=0,
\tag{S.24}
$$
equivalently
$$
\frac{3Ak_bK_{eff}}{\alpha^2}(\mathrm{CC}^*)^2
+\frac{2Ak_c}{\alpha^2}\mathrm{CC}^*-k_b=0.
\tag{S.26}
$$
Its positive root is
$$
\boxed{
\mathrm{CC}^*
=\frac{-k_c+\sqrt{k_c^2+3K_{eff}\alpha^2k_b^2/A}}
{3k_bK_{eff}}.
}
\tag{S.27}
$$
Moreover,
$$
B_{net}''(\mathrm{CC})
=-\frac A{\alpha^2}(6k_bK_{eff}\mathrm{CC}+2k_c)<0
$$
for $\mathrm{CC}\ge0$, so this root is the unique maximizer of the truncated utility when it lies inside the two assumed validity regimes. A stochastic concentration claim additionally requires $-B_{net}$ to be a declared component of the Appendix-D potential and requires the low-noise detailed-balance hypotheses of Theorem D.5.

**Limiting behavior:**
- **Low resource cost** ($k_c \ll k_b K_{eff}$): $\text{CC}^* \propto \alpha/\sqrt{A K_{eff}}$, limited primarily by gravitational feedback
- **High resource cost** ($k_c \gg k_b K_{eff}$): $\text{CC}^* \propto k_b/k_c$, limited primarily by direct resource constraints
- **Balanced regime**: Both effects comparable, yielding intermediate optimal CC

## S.5 Schwarzschild Interpretation of the CC Endpoint-Bias Bound

The independently declared bounded-bias constraint $\alpha_{CC,\max}<0.5$ is weaker than exact causality and admits a separate gravitational interpretation. Theorem 39 supplies its endpoint-complete consequence; causal compliance still requires Theorem 39c. From Equation S.5, as $\text{CC} \to \alpha_{CC,\max}$, the required context power diverges: $P_{context} \to \infty$. The supplied work over the coherence interval is
$$
E_{\mathrm{context}}
=P_{\mathrm{context}}\tau_c.
\tag{S.28}
$$
Only the retained, localized part is assigned to the instantaneous gravitational source:
$$
E_{\mathrm{grav}}^{\mathrm{inst}}
=\eta_{\mathrm{ret}}E_{\mathrm{context}}
=\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c,
\qquad
0<\eta_{\mathrm{ret}}\le1.
$$
Accordingly, the Schwarzschild radius associated with the retained source energy is
$$
r_s
=\frac{2GE_{\mathrm{grav}}^{\mathrm{inst}}}{c^4}
=\frac{2G\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c}{c^4}.
\tag{S.29}
$$
The use of $c^4$ follows from $r_s=2GM/c^2$ and $M=E_{\mathrm{grav}}^{\mathrm{inst}}/c^2$.

Substituting Equation S.5:
$$
r_s = \frac{2G \eta_{\mathrm{ret}} \tau_c}{c^4} A \left[\frac{\text{CC}}{\alpha - \text{CC}}\right]^2
\tag{S.30}
$$

**Physical viability condition:** For the system to remain a viable physical object rather than collapsing into a black hole, we require:
$$
r_s < R_S
\tag{S.31}
$$

where $R_S=(3V_S/4\pi)^{1/3}$ is the characteristic radius of the aggregate. On the global quadratic-cost branch, $r_s\to\infty$ as $\mathrm{CC}\uparrow\alpha$. Two distinct restrictions apply:

1. The bounded-bias branch independently declares $\alpha_{CC,max}<1/2$. Theorem 39 proves that this gate excludes endpoint-complete binary forcing and that endpoint completion requires $\alpha_{CC,max}\ge1/2$; exact pre-lightcone causality separately requires Theorem 39c.
2. The inequality $r_s<R_S$ supplies a system-dependent collapse ceiling determined by $A$, $V_S$, $\tau_c$, and $\eta_{\mathrm{ret}}$.

Thus $\mathrm{CC}<\alpha$ does not by itself prevent collapse. The gravitational ceiling is the solution of S.31 for the declared source parameters and lies below $\alpha$ whenever those parameters are finite and positive. The weak-field calculation imposes the stronger perturbative requirement:
$$
\frac{\Phi_{context}}{c^2} = \frac{G M_{context}}{c^2 R_S} \ll 1
\tag{S.32}
$$

For the gravitational time dilation mechanism (Section S.3) to remain in the perturbative regime where Equations S.15-S.18 hold, we require:
$$
\frac{\Delta\tau_d}{\tau_c} = K_{eff} P_{context} \ll 1
\tag{S.33}
$$

Together with collapse avoidance $r_s<R_S$ (Equation S.31), these conditions enforce an effective operational ceiling $\text{CC}<\text{CC}_{grav}<\alpha$ for any finite system. Theorem S.2 makes this explicit.

**Theorem S.2 (Unified Bounded-Bias and Gravity Ceiling).**

On the bounded-bias CC branch, independently impose
$$
\alpha_{CC,\max}<0.5.
$$
Theorem 39 then excludes endpoint-complete forcing of both outcomes of any binary coarse-graining.
Independently, for any finite aggregate with the context-power law of Equation S.5 and finite positive $A,\tau_c,R_S,\eta_{\mathrm{ret}}$, assume a nondegenerate weak-field geometry with $K_{\mathrm{eff}}>0$, a declared tolerance $0<\delta_{\mathrm{WF}}\ll1$, and the strict perturbative requirement $K_{\mathrm{eff}}P_{\mathrm{context}}<\delta_{\mathrm{WF}}$. Together with collapse avoidance, these hypotheses impose
$$
\mathrm{CC}<\mathrm{CC}_{BH}<\alpha,
\qquad
\mathrm{CC}<\mathrm{CC}_{WF}<\alpha.
$$
Thus the admissible operating ceiling is
$$
\mathrm{CC}
<
\min\{\alpha_{CC,\max},\mathrm{CC}_{BH},\mathrm{CC}_{WF}\}.
\tag{S.34a}
$$
with $\alpha_{CC,\max}<0.5$ on the bounded-bias branch.

*Proof.* The strict ceiling is independent branch data. Theorem 39 proves that it is sufficient to exclude endpoint-complete forcing of both outcomes of any binary coarse-graining; it does not derive the ceiling or exclude every one-endpoint protocol.

For the gravitational-collapse ceiling, assume a spherically symmetric aggregate of areal radius $R_S$ and use Equations S.30–S.31:
$$
r_s
=
\frac{2G\eta_{\mathrm{ret}}\tau_c}{c^4}P_{context}(\mathrm{CC})
<R_S
\quad\Longleftrightarrow\quad
P_{context}(\mathrm{CC})
<
\frac{c^4R_S}{2G\eta_{\mathrm{ret}}\tau_c}.
$$
Substituting Equation S.5 gives
$$
A\left[\frac{\mathrm{CC}}{\alpha-\mathrm{CC}}\right]^2
<
\frac{c^4R_S}{2G\eta_{\mathrm{ret}}\tau_c}.
$$
Let
$$
B
:=
\frac{c^4R_S}{2G\eta_{\mathrm{ret}}\tau_cA}>0.
$$
Since all quantities are nonnegative and $\mathrm{CC}<\alpha$ on the branch domain, the inequality is equivalent to
$$
\frac{\mathrm{CC}}{\alpha-\mathrm{CC}}<\sqrt B.
$$
Solving gives
$$
\mathrm{CC}<\frac{\alpha\sqrt B}{1+\sqrt B}=:\mathrm{CC}_{BH}.
$$
For finite positive $A,\tau_c,R_S,\eta_{\mathrm{ret}}$,
$$
\mathrm{CC}_{BH}<\alpha.
$$

For the perturbative weak-field ceiling, impose the theorem's nondegenerate-geometry and strict-tolerance hypotheses
$$
K_{\mathrm{eff}}>0,
\qquad
K_{\mathrm{eff}}P_{\mathrm{context}}<\delta_{\mathrm{WF}}.
$$
Using Equation S.5,
$$
A\left[\frac{\mathrm{CC}}{\alpha-\mathrm{CC}}\right]^2
<
\frac{\delta_{\mathrm{WF}}}{K_{\mathrm{eff}}}.
$$
Let
$$
W
:=
\frac{\delta_{\mathrm{WF}}}{AK_{\mathrm{eff}}}>0.
$$
Then
$$
\frac{\mathrm{CC}}{\alpha-\mathrm{CC}}<\sqrt W,
$$
and hence
$$
\mathrm{CC}
<
\frac{\alpha\sqrt W}{1+\sqrt W}
=:\mathrm{CC}_{\mathrm{WF}}<\alpha.
$$

Combining the independent endpoint, collapse, and weak-field requirements gives (S.34a). ∎

**Corollary S.2.1 (No arbitrary CC enhancement on the bounded-bias branch).**

On the bounded-bias CC branch, no finite system can increase operational CC without encountering at least one of the following gates:
- the independently declared bounded-bias gate $\alpha_{CC,\max}<0.5$, whose endpoint-complete consequence is Theorem 39;
- the collapse-avoidance ceiling $\mathrm{CC}<\mathrm{CC}_{BH}$;
- the nondegenerate weak-field perturbative ceiling $\mathrm{CC}<\mathrm{CC}_{WF}$.

Thus arbitrary CC enhancement is excluded on the intersection of the independently bounded-bias branch and the two finite-system branches. The endpoint gate excludes endpoint-complete binary forcing, while the gravitational ceilings control physical viability and perturbative validity.

## S.6 Non-Local Gravitational Influence via Entanglement

While the gravitational effects analyzed in Sections S.3-S.4 operate locally on the context-generating aggregate, for entangled systems the local gravitational field can modulate joint $A$-$B$ correlation statistics through standard local-unitary phase control: Alice's action changes joint correlations detectable only after classical comparison of measurement records, while Bob's marginal statistics remain unchanged, preserving no-signaling. Reconciliation with any main-text Postulate 3 statement asserting Bob-marginal statistical shifts would require a separate non-CPTP or non-local mechanism beyond the local gravitational dephasing analyzed here, and any mechanism producing such a shift would lie outside and falsify the exact pre-lightcone context-independence branch classified by Corollary 39c.1.

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
P(++|t) &= |\langle ++|\psi(t)\rangle|^2 = \left|\frac{1}{2\sqrt{2}}(1 + e^{i\delta\phi_A})\right|^2 \\
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

Substituting the retained gravitational source from Equations S.13–S.16 gives
$$
\Phi_A
\sim\frac{2\pi G}{3}(1+3w_c)
\frac{\eta_{\mathrm{ret}}P_{context}\tau_c}{V_Sc^2}r^2.
\tag{S.41}
$$
Therefore, on the weak-phase branch,
$$
|\Delta P(++)|
\sim\left(\frac{\Delta E_At}{\hbar c^2}\right)^2
\left[\frac{2\pi G}{3}(1+3w_c)
\frac{\eta_{\mathrm{ret}}r^2}{V_Sc^2}\right]^2
(P_{context}\tau_c)^2
\propto\eta_{\mathrm{ret}}^2P_{context}^2.
\tag{S.42}
$$

**Interpretation:** This is the *joint-correlation modulation* mechanism — local control of entangled joint statistics under no-signaling:

1. Alice's local action (creating high-CC context) generates local gravitational field
2. Local gravitational field affects only Alice's particle (local interaction)
3. Because Alice's particle is entangled with Bob's, the global entanglement correlations are modified
4. Bob's marginal statistics remain unchanged (no-signaling preserved, Equation S.37)
5. The local-unitary phase modifies the joint probabilities $P(ij)$; detecting the modification requires classical comparison of Alice's and Bob's measurement records.
6. The effect changes probabilities without selecting a specific outcome.
7. Detection requires a protocol-specific sample size whose leading small-CC scaling is proportional to $\mathrm{CC}^{-8}$ when the response coefficients are nonzero

**Detection requirements:** If Equation S.5 is written as
$$
P_{context}=A\left(\frac{\text{CC}}{\alpha_{CC,\max}-\text{CC}}\right)^2,
$$
define its small-CC coefficient $a_P:=A/\alpha_{CC,\max}^2$. Then the two response laws are
$$
P_{context}=a_P\,\text{CC}^2+o(\text{CC}^2),
\qquad
|\Delta P|=B P_{context}^2+o(P_{context}^2)
=C\,\text{CC}^4+o(\text{CC}^4),
\qquad C:=B a_P^2.
\tag{S.43}
$$
Here $a_P$ has units of power and $B$ has units of inverse power squared, so $C$ is dimensionless. For independent Bernoulli trials with null probability $p_0$, a two-sided normal-approximation design with type-I error $\alpha$ and power $1-\beta$ requires at leading order
$$
N_{samples}
\gtrsim
\frac{(z_{1-\alpha/2}+z_{1-\beta})^2p_0(1-p_0)}{C^2\,\text{CC}^8}.
\tag{S.44}
$$
Correlations, nuisance estimation, and post-selection replace $N_{samples}$ by the corresponding effective sample size.

For $\text{CC}=0.1$, the power-law factor is $\text{CC}^{-8}=10^8$. The absolute sample requirement also depends on $C$, the significance and power targets, the null variance, trial dependence, and post-selection efficiency. Crucially, these measurements must be:
- Spacelike-separated (ensuring no subluminal communication during measurement)
- Post-selected and compared (requiring classical communication afterward)
- Statistically aggregated (individual outcomes remain random)

**Conditional carrier comparison.** A gravitational carrier couples through a certified stress-energy and metric response, while an electromagnetic carrier couples through a certified current, field, and target susceptibility. Universal stress-energy coupling does not prove that the nominated gravitational phase channel is realizable, dominant, or uniquely attributable. The result below assumes a two-level energy gap, a retained source, and a local CPTP phase response; it does not apply automatically to every quantum system. Distinguishing carriers requires preregistered response surfaces, matched geometry and retention data, and nuisance-controlled likelihood comparison.

**Theorem S.3 (Conditional Gravitational Joint-Correlation Estimate).** Assume the uniform spherical perfect-fluid source model of S.3, the retained-energy law with $0<\eta_{\mathrm{ret}}\le1$, the global quadratic cost branch S.5, and a two-level subsystem $A$ with energy gap $\Delta E_A$. Assume that the gravitational interaction is represented by a local CPTP phase channel on $A$, that the chosen joint measurement has the response S.40, and that both the weak-field and weak-phase conditions hold. Define
$$
K_A:=\frac{2\pi G}{3}(1+3w_c)
\frac{\eta_{\mathrm{ret}}\tau_cr_A^2}{V_Sc^2}.
$$
Then Bob's marginal is unchanged, while the selected joint probability obeys the leading-order relation
$$
|\Delta P(++)|
=\frac18\left(\frac{\Delta E_At}{\hbar c^2}\right)^2
K_A^2A^2
\left[\frac{\mathrm{CC}(S_A)}{\alpha_{CC,max}-\mathrm{CC}(S_A)}\right]^4
+O(\delta\phi_A^4).
\tag{S.45}
$$

*Proof.* Equation S.41 and the definition of $K_A$ give $\Phi_A=K_AP_{context}$ to the retained weak-field order. Hence
$$
\delta\phi_A
=\frac{\Delta E_At}{\hbar c^2}K_AP_{context}.
$$
The assumed joint-measurement response S.40 gives
$$
|\Delta P(++)|=\frac18\delta\phi_A^2+O(\delta\phi_A^4).
$$
Finally, S.5 gives
$$
P_{context}^2
=A^2\left[\frac{\mathrm{CC}(S_A)}
{\alpha_{CC,max}-\mathrm{CC}(S_A)}\right]^4.
$$
Substitution proves S.45. Trace preservation of the local channel gives the unchanged Bob marginal by Theorem S.1. ∎

**Conditional carrier-discrimination protocol.** Preregister the electromagnetic and gravitational carrier response functions, nuisance controls, uncertainty model, and identifiability criterion. Vary radiated power and total retained power independently over a domain on which the two predicted response surfaces are distinguishable. Attribute support to one carrier branch only if the matched likelihood rejects the competing registered surface at the declared uncertainty level while ordinary electromagnetic, thermal, mechanical, and instrumental channels are controlled. Appendix L/S does not prove that the two carrier families are exhaustive or that correlation with raw power alone identifies either mechanism.

**Definition S.6.1a (Causally Implemented Metric-Phase Entanglement Certificate).** Fix the input $|+\rangle_A|+\rangle_B$, diagonal phase intervals, a causal mediator implementation, an ideal controlled-phase output $\sigma_\Phi$, and an actual output $\rho_{\mathrm{out}}$ satisfying
$$
\|\rho_{\mathrm{out}}-\sigma_\Phi\|_1\le\epsilon_N.
\tag{S.6.1a.1}
$$
For $I_\Phi=I_{00}+I_{11}-I_{01}-I_{10}$ require
$$
\frac12\inf_{\Phi\in I_\Phi}|\sin(\Phi/2)|-\epsilon_N>0.
\tag{S.6.1a.2}
$$

**Proposition S.6.1b (Robust Controlled-Phase Entanglement Witness).** The actual output has positive negativity. On the ideal branch,
$$
\mathcal N(\sigma_\Phi)=\frac12|\sin(\Phi/2)|.
\tag{S.6.1b.1}
$$

*Proof.* Local diagonal phases do not change entanglement, so the ideal output is locally equivalent to
$$
|\psi_\Phi\rangle
=\frac12\bigl(|00\rangle+|01\rangle+|10\rangle+e^{i\Phi}|11\rangle\bigr).
$$
Its coefficient matrix is
$$
C_\Phi=\frac12
\begin{pmatrix}
1&1\\
1&e^{i\Phi}
\end{pmatrix},
$$
and therefore
$$
2|\det C_\Phi|
=\frac12|e^{i\Phi}-1|
=|\sin(\Phi/2)|.
$$
If $s_1,s_2$ are the Schmidt coefficients, the eigenvalues of the partial transpose of $|\psi_\Phi\rangle\langle\psi_\Phi|$ are
$$
s_1^2,\quad s_2^2,\quad s_1s_2,\quad -s_1s_2.
$$
Thus
$$
\mathcal N(\sigma_\Phi)
=\frac{\lVert\sigma_\Phi^{T_B}\rVert_1-1}{2}
=s_1s_2
=|\det C_\Phi|
=\frac12|\sin(\Phi/2)|,
$$
which proves (S.6.1b.1).

For operators on $\mathbb C^2\otimes\mathbb C^2$, the induced trace-norm bound for partial transpose is
$$
\lVert X^{T_B}\rVert_1\le2\lVert X\rVert_1
$$
(Vidal and Werner 2002). Hence
$$
\begin{aligned}
|\mathcal N(\rho_{\mathrm{out}})-\mathcal N(\sigma_\Phi)|
&\le\frac12
\lVert(\rho_{\mathrm{out}}-\sigma_\Phi)^{T_B}\rVert_1\\
&\le\lVert\rho_{\mathrm{out}}-\sigma_\Phi\rVert_1
\le\epsilon_N.
\end{aligned}
$$
Because the certified phase satisfies $\Phi\in I_\Phi$,
$$
\mathcal N(\rho_{\mathrm{out}})
\ge\frac12\inf_{\varphi\in I_\Phi}|\sin(\varphi/2)|-\epsilon_N>0
$$
by (S.6.1a.2). ∎

**Definition S.6.1c (Classical-Mediator Implementation Class).** Fix finite-dimensional matter systems $A$ and $B$, a probe of mass $m>0$ with position operator $\hat{\mathbf r}=(\hat x,\hat y,\hat z)$ and axial momentum operator $\hat p_x$, and a protocol window $[0,t]$ with $t>0$. A mediator implementation belongs to the classical-mediator class $\mathfrak K_{\mathrm{cl}}$ if a finite record supplies entries 1 and 2; its probe sector is admissible if the record also supplies entries 3, 4, and 5.

1. *(Configuration entry.)* A measurable configuration space $(\Lambda,\mu)$ and a probability density $p(\lambda)$ whose elements label definite mediator configurations; $\lambda$ may be correlated with any source-preparation or classical communication record.

2. *(Product-response entry.)* For every $\lambda$, measurable trace-nonincreasing completely positive maps $\mathcal E_A^\lambda$ on $A$ and $\mathcal E_B^\lambda$ on $B$ such that, for every input $\rho_A\otimes\rho_B$ and every acceptance set $\Lambda_{\mathrm{acc}}\subseteq\Lambda$ for which the operator-valued integrand is trace-norm Bochner integrable and its accepted trace is finite and strictly positive, the selective matter output is
$$
\rho_{\mathrm{sel}}
=
\frac{\displaystyle\int_{\Lambda_{\mathrm{acc}}}p(\lambda)\bigl(\mathcal E_A^\lambda\otimes\mathcal E_B^\lambda\bigr)(\rho_A\otimes\rho_B)\,d\mu(\lambda)}
{\displaystyle\operatorname{tr}\int_{\Lambda_{\mathrm{acc}}}p(\lambda)\bigl(\mathcal E_A^\lambda\otimes\mathcal E_B^\lambda\bigr)(\rho_A\otimes\rho_B)\,d\mu(\lambda)}.
\tag{S.6.1c.1}
$$
Postselection on any classical record, including the mediator record itself, acts only through the choice of $\Lambda_{\mathrm{acc}}$ and the induced reweighting of $p$. An acceptance rule is probe-blind if $\Lambda_{\mathrm{acc}}$ is determined by $\lambda$ and by records generated without measuring the probe.

3. *(Source-positivity entry.)* Every $\lambda$ assigns a finite nonnegative source mass measure $\nu_\lambda$ on $\mathbb R^3$, and the probe evolves on $[0,t]$ under the gravitational potential
$$
V_\lambda(\mathbf r)=-Gm\int\frac{d\nu_\lambda(\mathbf r')}{|\mathbf r-\mathbf r'|}.
\tag{S.6.1c.2}
$$

4. *(Axial-separation entry.)* There exist $x_0\in\mathbb R$ and $\Delta>0$ with $\operatorname{supp}\nu_\lambda\subseteq\{\mathbf r':x'\le x_0-\Delta\}$ for every $\lambda\in\Lambda$, and the probe state $\psi_\tau^\lambda$ satisfies $\operatorname{supp}|\psi_\tau^\lambda|^2\subseteq\{\mathbf r:x\ge x_0\}$ for every $\lambda\in\Lambda$ and every $\tau\in[0,t]$.

5. *(Ehrenfest-regularity entry.)* For every $\lambda\in\Lambda$ the pair $(\psi_\tau^\lambda,V_\lambda)$ satisfies
$$
\frac{d}{d\tau}\langle\hat p_x\rangle_{\psi_\tau^\lambda}
=
\bigl\langle-\partial_xV_\lambda\bigr\rangle_{\psi_\tau^\lambda}
\qquad(\tau\in[0,t]).
\tag{S.6.1c.3}
$$

**Lemma S.6.1d (Classical-Mediator Response Bounds).** Let a mediator implementation lie in $\mathfrak K_{\mathrm{cl}}$.

(i) For every product input $\rho_A\otimes\rho_B$ and every acceptance set satisfying Definition S.6.1c(2), the selective output (S.6.1c.1) is separable and
$$
\mathcal N(\rho_{\mathrm{sel}})=0.
\tag{S.6.1d.1}
$$

(ii) If the probe sector is admissible, then for every probe-blind acceptance set with a measurable induced accepted density $\tilde p\ge0$ satisfying $\int_{\Lambda_{\mathrm{acc}}}\tilde p\,d\mu=1$,
$$
\langle\Delta p_x\rangle_{\mathrm{sel}}
:=
\int_{\Lambda_{\mathrm{acc}}}\tilde p(\lambda)
\Bigl(\langle\hat p_x\rangle_{\psi_t^\lambda}-\langle\hat p_x\rangle_{\psi_0^\lambda}\Bigr)d\mu(\lambda)
\le0,
\tag{S.6.1d.2}
$$
with strict inequality whenever $\nu_\lambda\neq0$ on a set of positive $\tilde p\,d\mu$ measure.

*Proof.* (i) Complete positivity gives $\mathcal E_A^\lambda(\rho_A)\ge0$ and $\mathcal E_B^\lambda(\rho_B)\ge0$, so each integrand in (S.6.1c.1) is a nonnegative multiple of a product state. The accepted integral is therefore an unnormalized separable operator, and division by its positive trace preserves separability; continuous mixtures are included because the accepted integral is a trace-norm limit of finite separable sums and the separable states form a trace-norm closed convex set in finite dimension. For a separable state $\sigma=\sum_r q_r\,\sigma_A^{(r)}\otimes\sigma_B^{(r)}$ with $q_r\ge0$, the partial transpose $\sigma^{T_B}=\sum_r q_r\,\sigma_A^{(r)}\otimes(\sigma_B^{(r)})^{T}$ is a sum of positive operators, hence positive with unit trace, so $\lVert\sigma^{T_B}\rVert_1=\operatorname{tr}\sigma^{T_B}=1$ and $\mathcal N(\sigma)=(\lVert\sigma^{T_B}\rVert_1-1)/2=0$ in the negativity convention of Proposition S.6.1b. Only the product form of the maps per configuration is used, so classical communication or feedforward folded into $\lambda$ leaves the conclusion unchanged.

(ii) Fix $\lambda\in\Lambda$. For $x\ge x_0$ the axial-separation entry gives $x-x'\ge\Delta>0$ for every $\mathbf r'\in\operatorname{supp}\nu_\lambda$, and $|x-x'|\,|\mathbf r-\mathbf r'|^{-3}\le|\mathbf r-\mathbf r'|^{-2}\le\Delta^{-2}$, so differentiation of (S.6.1c.2) under the integral is justified by dominated convergence and
$$
-\partial_xV_\lambda(\mathbf r)
=
-Gm\int\frac{x-x'}{|\mathbf r-\mathbf r'|^{3}}\,d\nu_\lambda(\mathbf r')
\le0
\qquad(x\ge x_0),
$$
with strict inequality when $\nu_\lambda\neq0$. Since $\operatorname{supp}|\psi_\tau^\lambda|^2\subseteq\{x\ge x_0\}$ for all $\tau\in[0,t]$, (S.6.1c.3) gives $\frac{d}{d\tau}\langle\hat p_x\rangle_{\psi_\tau^\lambda}\le0$ on $[0,t]$, and integration over $[0,t]$ gives $\langle\hat p_x\rangle_{\psi_t^\lambda}-\langle\hat p_x\rangle_{\psi_0^\lambda}\le0$ for every configuration, strictly when $\nu_\lambda\neq0$. A probe-blind acceptance rule replaces $p$ by $\tilde p\ge0$ without altering any per-configuration term, so (S.6.1d.2) is an average of nonpositive numbers, strictly negative under the stated nondegeneracy. ∎

**Corollary S.6.1e (Two Discharge Witnesses for Mediator Nonclassicality).** Consider a gravitational causal mediator implementation on the branch of Definition S.6.1a.

(a) Acceptance of (S.6.1a.1) and (S.6.1a.2) excludes every implementation in $\mathfrak K_{\mathrm{cl}}$: Proposition S.6.1b certifies $\mathcal N(\rho_{\mathrm{out}})>0$ for the product input $|+\rangle_A|+\rangle_B$, while Lemma S.6.1d(i) gives $\mathcal N(\rho_{\mathrm{sel}})=0$ for every selective output of the class from that input.

(b) Let a retained probe record carry the source-positivity and axial-separation geometry of Definition S.6.1c, a probe-blind acceptance rule, a force-provenance entry attributing the retained axial impulse to the gravitational interaction channel, and a certified conditional mean
$$
\langle\Delta p_x\rangle_{\mathrm{sel}}\ge\kappa>0
\tag{S.6.1e.1}
$$
after subtraction of the certified statistical and systematic error budget. Then every implementation in $\mathfrak K_{\mathrm{cl}}$ with admissible probe sector is excluded by Lemma S.6.1d(ii).

Either record excludes $\mathfrak K_{\mathrm{cl}}$ for the registered protocol. Neither record selects a particular nonclassical completion, and neither asserts any unconditioned or marginal anomaly.

*Proof.* Each part is a direct contradiction between the certified strict inequality and the corresponding bound of Lemma S.6.1d, quantified over all class members carrying the stated entries. The final statement holds because exclusion of $\mathfrak K_{\mathrm{cl}}$ is purely negative: any implementation outside the class, in particular any implementation whose mediator response is conditioned coherently on nonorthogonal source amplitudes, is compatible with both records, and both records are selective, so no unconditioned or marginal statement follows from them. ∎

**Remark S.6.1 (Selective Records and the Trace-Preserving Branch).** A record of the form (S.6.1e.1) is produced by a normalized selective operation and lies outside the trace-preserving channel hypotheses of Theorem S.1 and Theorem S.3; no marginal statement is asserted for it, consistent with the separation stated at the opening of Section S.6. Within $\mathfrak K_{\mathrm{cl}}$ the unconditioned ensemble mean obeys the nonpositive bound of Lemma S.6.1d(ii) with $\Lambda_{\mathrm{acc}}=\Lambda$. When $\Lambda_{\mathrm{acc}}\subsetneq\Lambda$, witness (b) is a proper selective-subensemble record and does not by itself assert an unconditional marginal effect. When $\Lambda_{\mathrm{acc}}=\Lambda$, it is a full-ensemble record and must separately satisfy the applicable marginal and no-signaling constraints. A spatially superposed source with probe-blind postselection in a nonorthogonal source basis is a candidate realization of (S.6.1e.1) on the coherent-mediator branch (Saldanha, Marletto and Vedral 2026); such an implementation lies outside $\mathfrak K_{\mathrm{cl}}$ precisely because its mediator response is not of the configuration-diagonal product form (S.6.1c.1).

## S.7 Conditional Gravitational Phase and Dephasing Mechanisms

A deterministic time-dilation gradient produces a coherent relative phase. Decay of off-diagonal density-matrix elements requires an additional phase-ensemble average, unresolved source fluctuation, source trace, or saturated chronometric ND-RID response law. These branches are distinguished below.

Section S.3 establishes the conditional proper-time difference $\Delta\tau_d=KP_{context}$. The following subsections first derive the associated coherent phase and then state the additional hypotheses under which that phase produces dephasing and limits effective CC capability.

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

### S.7.3 Dephasing Rate on the Phase-Uncertainty / Environmental-Tracing Branch

A deterministic, fully known gravitational phase shift $|\Delta\phi_{ij}^{(grav)}| \sim 1$ is a unitary phase rotation of the superposition $|i\rangle + |j\rangle$ and does not by itself suppress coherence: the off-diagonal density matrix elements rotate but do not decay. Genuine dephasing occurs only when the retained finite-resolution state does not resolve the relative chronometric phase. This happens on branches with an additional ingredient — either (a) the gravitational potential $\Phi$ (or equivalently $\Delta\tau_d$) fluctuates with variance $\mathrm{Var}(\Delta\phi)$ across unresolved degrees of freedom, (b) the spatial wavepacket components experience different gravitational potentials and become entangled with position degrees of freedom that are then traced out, (c) the gravitational substrate couples to environmental degrees of freedom whose state is traced out per Zurek-style decoherence (Zurek, 1991, 2003), or (d) the saturated chronometric ND-RID branch identifies unresolved proper-time phase slip with the minimal Markovian dephasing contraction rate.

On the phase-uncertainty / environmental-tracing branch where one of (a)–(c) supplies a phase variance $\mathrm{Var}(\Delta\phi_{ij})$ over the coherence interval $\tau_c$, the off-diagonal coherence is suppressed by the factor $\exp(-\mathrm{Var}(\Delta\phi_{ij})/2)$, defining the variance dephasing rate:
$$
\Gamma_{\mathrm{var}}^{(ij)}
=
\frac{1}{\tau_{\mathrm{deph}}}
=
\frac{\mathrm{Var}(\Delta\phi_{ij}^{(grav)})}{2\tau_c}
\quad
\text{on the Gaussian phase-noise branch.}
\tag{S.56}
$$

On the saturated chronometric ND-RID branch (d), define the chronometric phase-slip rate by
$$
\omega_{\mathrm{ch}}^{(ij)}
:=
\frac{|\Delta\phi_{ij}^{(grav)}|}{\tau_c}.
$$
The branch postulate is the minimal Markovian identification
$$
\Gamma_{\mathrm{ch}}^{(ij)}:=\omega_{\mathrm{ch}}^{(ij)}.
$$
Using Equation S.54 gives
$$
\boxed{
\Gamma_{\mathrm{ch}}^{(ij)}
=
\frac{|\Delta E_{ij}|}{\hbar}\frac{|\Delta\Phi|}{c^2}
=
\frac{|\Delta E_{ij}|}{\hbar}K_{\mathrm{eff}}P_{\mathrm{context}}
}
\tag{S.57}
$$
where the last equality uses $\Delta\tau_d/\tau_c=\Delta\Phi/c^2=K_{\mathrm{eff}}P_{\mathrm{context}}$ from Equations S.18-S.21. The deterministic tracked-phase branch has $\Gamma_{\mathrm{grav}}^{(ij)}=0$; the variance branch has $\Gamma_{\mathrm{grav}}^{(ij)}=\Gamma_{\mathrm{var}}^{(ij)}$; the saturated chronometric ND-RID branch has $\Gamma_{\mathrm{grav}}^{(ij)}=\Gamma_{\mathrm{ch}}^{(ij)}$.

**Theorem S.7.3a (Chronometric Dephasing Branch and Clock-Gap Scaling).** On the saturated chronometric ND-RID branch, the residual gravitational dephasing rate for an internal transition $i\leftrightarrow j$ satisfies
$$
\frac{\hbar\Gamma_{\mathrm{ch}}^{(ij)}}{|\Delta E_{ij}|}
=
\frac{|\Delta\Phi|}{c^2}.
$$
Therefore two transitions measured in the same geometry obey
$$
\frac{\Gamma_{\mathrm{ch}}^{(ij)}}{\Gamma_{\mathrm{ch}}^{(kl)}}
=
\frac{|\Delta E_{ij}|}{|\Delta E_{kl}|}.
$$
If the same branch pair is engineered so that the mass-density difference is held fixed while the internal energy splitting is changed, this linear clock-gap law is a PU chronometric signature distinct from any model whose rate depends only on branch mass-density difference.

*Proof.* Equation S.54 gives
$$
|\Delta\phi_{ij}^{(grav)}|
=
\frac{|\Delta E_{ij}|}{\hbar}\frac{|\Delta\Phi|}{c^2}\tau_c.
$$
Dividing by $\tau_c$ and applying the saturated chronometric branch identification $\Gamma_{\mathrm{ch}}^{(ij)}=|\Delta\phi_{ij}^{(grav)}|/\tau_c$ gives the first formula. For two transitions in the same geometry, the common factor $|\Delta\Phi|/c^2$ cancels, giving the ratio formula. ∎

Assume the baseline and gravitational decoherence channels are independent Markovian channels with exponential coherence factors
$$
e^{-t/\tau_{\mathrm{coh}}^0}
\quad\text{and}\quad
e^{-\Gamma_{\mathrm{grav}}^{(ij)}t}.
$$
Their product is exponential with
$$
\frac{1}{\tau_{\mathrm{coh}}^{\mathrm{eff}}}
=
\frac{1}{\tau_{\mathrm{coh}}^0}
+
\Gamma_{\mathrm{grav}}^{(ij)}.
\tag{S.58}
$$

Equation (S.58) gives the exact expression
$$
\tau_{\mathrm{coh}}^{\mathrm{eff}}
=
\frac{\tau_{\mathrm{coh}}^0}
{1+\Gamma_{\mathrm{grav}}^{(ij)}\tau_{\mathrm{coh}}^0}.
$$
For $\Gamma_{\mathrm{grav}}^{(ij)}\tau_{\mathrm{coh}}^0\ll1$,
$$
\tau_{\mathrm{coh}}^{\mathrm{eff}}
=
\tau_{\mathrm{coh}}^0
\left(
1-\Gamma_{\mathrm{grav}}^{(ij)}\tau_{\mathrm{coh}}^0
+O((\Gamma_{\mathrm{grav}}^{(ij)}\tau_{\mathrm{coh}}^0)^2)
\right).
\tag{S.59}
$$

On the saturated chronometric branch this can be written as
$$
\Gamma_{\mathrm{grav}}^{(ij)}\tau_{coh}^0
=
K_{\Gamma}^{(ij)}P_{\mathrm{context}},
\qquad
K_{\Gamma}^{(ij)}
:=
\frac{|\Delta E_{ij}|}{\hbar}K_{\mathrm{eff}}\tau_{coh}^0
=
\frac{4\pi G}{3c^4}(1+3w_c)\frac{|\Delta E_{ij}|}{\hbar}\frac{\eta_{\mathrm{ret}}rL_q\tau_c\tau_{coh}^0}{V_S}.
\tag{S.60}
$$

### S.7.4 Net Effective CC Including Decoherence

Define
$$
\tau_{\mathrm{eff}}
=
\min(\tau_c,\tau_{\mathrm{coh}}^{\mathrm{eff}}).
\tag{S.61}
$$
Assume the linear coherence-time response branch
$$
\mathrm{CC}_{\mathrm{eff}}
=
\mathrm{CC}_{\mathrm{ideal}}
\frac{\tau_{\mathrm{eff}}}{\tau_c}.
\tag{S.62}
$$
When $\tau_{\mathrm{coh}}^{\mathrm{eff}}<\tau_c$, Equations (S.59)–(S.60) then give
$$
\boxed{
\mathrm{CC}_{\mathrm{eff}}
=
\frac{\mathrm{CC}_{\mathrm{ideal}}}
{1+K_\Gamma P_{\mathrm{context}}}
}.
\tag{S.63}
$$
The proportional response in (S.62) is an independent constitutive assumption, not a consequence of Definition 30.

For small gravitational effect $K_{\Gamma} P_{context} \ll 1$:
$$
\text{CC}_{eff} \approx \text{CC}_{ideal}(1 - K_{\Gamma} P_{context})
\tag{S.64}
$$

Equation S.64 is the small-$K_\Gamma P_{context}$ expansion of the independently specified coherence-response law S.63. On the global quadratic-cost branch,
$$
\mathrm{CC}_{eff}
=\mathrm{CC}_{ideal}\left[1-K_\Gamma A
\left(\frac{\mathrm{CC}_{ideal}}
{\alpha-\mathrm{CC}_{ideal}}\right)^2\right]
+O((K_\Gamma P_{context})^2).
\tag{S.65}
$$

**Conditional mechanism ledger:**

1. S.5 maps CC to power only on the global quadratic-cost branch.
2. S.6 maps power to local source density through $u_{context}=\eta_{\mathrm{ret}}P_{context}\tau_c/V_S$.
3. S.15–S.16 use the uniform perfect-fluid and weak-field branches to obtain a potential gradient.
4. S.54 converts the proper-time difference into a coherent energy-gap-dependent phase.
5. Dephasing follows only on an unresolved phase-noise, source-trace, or saturated chronometric ND-RID branch.
6. S.63 additionally assumes that effective CC scales with the reduced coherence time.
7. Section S.4 additionally assumes the phenomenological utility $B_{net}$.

Equation S.21 and Equation S.64 have the same linear form only after the additional calibration $\mathrm{CC}_{ideal}=\mathrm{CC}$ and $K_\Gamma=K_{eff}$. Neither the deterministic phase calculation nor the coherence-response ansatz proves that calibration.

## S.8 Integration with Appendix L

This appendix analyzes gravitational feedback effects that limit CC efficacy. For comprehensive treatment of CC implementation mechanisms, energy accounting, and practical experimental protocols, see Appendix L.

### S.8.1 Division of Labor

**Appendix L provides:**

1. **Conditional carrier models**
   - Electromagnetic coupling via AC Stark level shifts only on the conserved-current, Maxwell-transfer, and target-response branches of Theorem L.2 and Corollary L.2.1
   - Coherent charge oscillation as a candidate source model (Section L.11)
   - Biological implementation pathways as certificate-pending hypotheses (Section L.4.1)
   - Conditional temporal-modulation channel decomposition (Theorem L.8)

2. **Carrier-comparison obligation**
   - Proposition L.5 proves that the registered scaling data do not determine a numerical or positive electromagnetic-to-gravitational response ratio
   - Any comparison requires one common carrier, target, geometry, retention, normalization, covariance, and uncertainty ledger fixed before evaluation
   - Worked examples and detection times are protocol diagnostics until those entries and a nonzero response interval are accepted

3. **Conditional energy accounting**
   - Channel decomposition: $P_{agg}=P_{EM}+P_{other}$ under the mutually exclusive ledger hypothesis of Equation L.36
   - Stress-energy decomposition: $T_{\mu\nu}^{(MPU)}=T_{\mu\nu}^{(baseline)}+\Delta T_{\mu\nu}^{(CC)}+T_{\mu\nu}^{(EM)}$ on the common L/S source convention of Equation S.9
   - Distributional covariant conservation $\nabla^\mu T_{\mu\nu}^{(MPU)}=0$ on the regular local-equilibrium branch of Theorem B.5; pointwise conservation on its smooth on-shell variational branch
   - Horizon thermodynamics consistency on the hypotheses of Theorem L.7

4. **Universal requirements**
   - Implementation-independent constraints (Theorem L.9)
   - Threshold behavior: $C_{agg} \le C_{op} \implies \text{CC} = 0$
   - POP/PCE optimization conditions (Lemma L.1, Theorem L.1)

5. **Experimental protocols**
   - Protocol L.1: registered electromagnetic source/field/target transfer test; its displayed integration time is branch-parameter arithmetic, not a feasibility certificate
   - Protocol L.2: source-exhaustive energy-conservation and calorimetry test
   - Protocol L.3: conditional gravitational-response test; no null or dominance expectation is defined before a common response/covariance certificate

**This appendix (Appendix S) provides:**

1. **Gravitational feedback analysis**
   - Resource cost to gravitational field mapping (Sections S.1-S.3)
   - Self-limiting feedback loop quantification (Section S.4)
   - PCE optimization including feedback (Equation S.27)

2. **Conditional gravitational branches**
   - retained-source metric-phase model (Section S.6)
   - Schwarzschild comparison on its localization and weak-field branch (Section S.5)
   - decoherence model on its declared noise and response branch (Section S.7)

3. **Theoretical bounds and interpretations**
   - Unified causality-gravity constraint (Theorem S.2)
   - Physical viability limits (Corollary S.2.1)
   - Self-limitation prevents arbitrary CC enhancement

### S.8.2 Conditional Branch Composition

Appendices L and S provide distinct conditional maps. They compose only when one physical implementation satisfies every premise in the chain.

**Source and channel ledger:**
$$
\text{context state}
\xrightarrow{\text{registered cost law}}P_{agg}
\xrightarrow{\text{energy-partition certificate}}
\begin{cases}
P_{EM}\to\text{EM response},\\
P_{other}\to\text{retained local source energy}
\end{cases}
$$

**Gravitational-response ledger:**
$$
P_{context}
\xrightarrow{\eta_{\mathrm{ret}}}u_{context}
\xrightarrow{\text{perfect-fluid, weak-field model}}\Phi_{grav}
\to\Delta\tau_d
\to\Theta_{ij}.
$$
A dephasing rate additionally requires an unresolved-noise, source-trace, or chronometric ND-RID branch; a decrease of $\mathrm{CC}_{eff}$ additionally requires the S.63 response law.

**Utility-selection ledger:**
$$
\mathrm{CC}_{ideal}
\xrightarrow{\text{S.5, S.63, and S.22 branch data}}
B_{net}
\xrightarrow{\text{interior validity and strict concavity}}
\mathrm{CC}^*.
$$
The resulting maximizer belongs to this phenomenological composition and is not an unconditional PCE equilibrium.

### S.8.3 Conditional Frequency Decomposition and Carrier Separation

For any registered temporal variable with the required integrability, Fourier decomposition is a mathematical representation. High- and low-frequency components do not identify electromagnetic and gravitational carriers. An electromagnetic reading requires Appendix L's conserved-current, multipole, field, target-susceptibility, geometry, and calibration records. A gravitational reading requires Appendix S's complete retained stress-energy, metric response, target phase map, localization, and calibration records.

If one implementation carries both packages, their source and power ledgers must be non-overlapping and source-exhaustive. Proposition L.5 proves no value or positive lower bound for an electromagnetic-to-gravitational response ratio from the framework constants alone. Consequently, no $10^{33}$--$10^{43}$ dominance range, bandwidth hierarchy, or common microscopic origin follows from frequency labels or coupling constants without a common source, target, geometry, retention, and uncertainty model.

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

### S.8.4a Experimental Discrimination of Registered Carrier Models

Fix common source, target, geometry, retention, timing, and uncertainty data. Preregister an electromagnetic response surface and a gravitational response surface, including all nuisance channels and the domain on which the two are identifiable. Vary radiated power, retained total power, distance, modulation frequency, and electromagnetic screening independently when feasible. Electromagnetic screening is a differential control for the declared EM path; the equivalence principle does not prove that every gravitational response is unshieldable in every effective or engineered model.

Compare the two models by a declared likelihood or finite-distance statistic with a stopping rule and multiplicity correction. A result supports one registered model only if it rejects the other within the shared uncertainty ledger. Proposition L.5 supplies neither a dominance expectation nor a numerical response ratio; nonidentifiability or rejection of both leaves the carrier question open.

### S.8.5 Theoretical Integration Points

Several framework elements require both appendices for complete understanding:

**1. Bounded-bias premise and endpoint-complete consequence**
- Branch premise: $\alpha_{CC,\max}<0.5$
- Endpoint-complete consequence: Theorem 39 (Section 10)
- Conditional gravitational interpretation: Section S.5 (this appendix)
- The branch premise, theorem consequence, and gravitational model remain logically distinct

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

Assume the mutually exclusive channel ledger of Theorem L.6 and Equations (L.38) and (L.40). Then $P_{agg}$ is partitioned so that each registered channel contributes once to $T_{\mu\nu}^{(MPU)}$, and $P_{context}$ splits into radiated and non-radiated components according to that ledger. If the common source also lies on the regular local-equilibrium branch of Theorem B.5, it is covariantly conserved in distributions; on the smooth on-shell variational branch the conservation equation holds pointwise. Channel exclusivity comes from the L.6 ledger, while conservation comes from the separate B.5 hypotheses.

## S.9 Conclusion

This appendix models gravitational feedback from contextual communication. On the stated branches, retained context energy produces weak timing changes, bounded optimization, and selected correlation effects while preserving the causal marginal.

### Technical conclusion ledger

This appendix develops a conditional gravitational-feedback model for operational CC.

**Branch-qualified results:**

1. **Power law:** S.5 follows on the global quadratic operational-cost branch. A local Taylor law does not imply endpoint divergence.
2. **Source term:** The context contribution to stress-energy uses the retained instantaneous energy $\eta_{\mathrm{ret}}P_{context}\tau_c$ and a specified perfect-fluid closure.
3. **Proper-time response:** $\Delta\tau_d=KP_{context}$ follows for the uniform spherical, weak-field geometry, with $K$ carrying $\eta_{\mathrm{ret}}$.
4. **Utility maximizer:** S.27 is the unique interior maximizer of the truncated phenomenological utility when its small-CC and weak-response conditions hold. Appendix-D concentration requires an additional potential-identification and detailed-balance package.
5. **Collapse ceiling:** $r_s<R_S$ gives a system-dependent ceiling distinct from the independently declared bounded-bias endpoint.
6. **Entangled statistics:** A local gravitational phase channel can change selected joint correlations while preserving Bob's marginal. It does not realize a late-randomized Bob-marginal anomaly.
7. **Phase and dephasing:** Deterministic time dilation gives coherent phase rotation. Dephasing requires unresolved noise, a source trace, or the saturated chronometric ND-RID response law.
8. **Appendix-L composition:** Electromagnetic and gravitational maps compose only for an implementation satisfying both source, partition, response, and causal certificates.

Accordingly, gravitational self-limitation is an admissible mechanism on the combined cost, source, geometry, dephasing, and response branches. It is not an unconditional consequence of CC, PCE, or thermodynamic limits alone.

**Causality terminology rule.** Every endpoint, bias-strength, gravity-backreaction, or zero-error bound in this appendix is weaker than operational causality. Postulate 2 means exact pre-lightcone context independence by Theorem 39c; a late-randomized Bob-marginal shift lies outside that branch.

