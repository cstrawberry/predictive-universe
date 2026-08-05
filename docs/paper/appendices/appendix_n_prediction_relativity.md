# Appendix N: Prediction Relativity and the Unified Cost of Transgression

## N.1 Master Principle: The PCE Potential

On a registered finite-resolution branch, the PU variational grammar nominates a **PCE Potential** $V$ that balances declared operation and interaction costs against predictive benefit. Definition D.1 is a branch-indexed potential schema; it does not by itself construct a physical dynamics or prove that a global minimizer exists. For a single MPU $i$ interacting with its local environment, one admitted decomposition is

$$
V_i = \underbrace{V_{op}(i)}_{\text{Operational Cost}} + \underbrace{V_{prop}(i)}_{\text{Propagation Cost}} - \underbrace{V_{benefit}(i)}_{\text{Predictive Benefit}}
\tag{N.1}
$$

where each term is a rate only after the branch supplies a common unit and metering record:
*   **$V_{op}$**: The declared cost of maintaining and operating the MPU's internal complexity $C_i$, represented by the branch functions $R(C_i)$ and $R_I(C_i)$ [Def. 3].
*   **$V_{prop}$**: The declared cost of predictive links with neighbors, including any registered information-loss term and, on a physical reset branch, an implementation cost satisfying $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$. The structural log-cardinality $\varepsilon_0=\ln2$ is not itself a heat or power without the reset and unit bridges [Appx. C, D].
*   **$V_{benefit}$**: A branch reward functional built from the registered Predictive Performance record $PP$ [Def. 7, D.1].

Equation D.8 nominates the stochastic model
$$
dx_t=-\eta(x_t)\operatorname{grad}_gV(x_t)\,dt+\sigma(x_t)\,dW_t,
\qquad \sigma\sigma^*=2D,
$$
only on a branch fixing a finite-dimensional smooth state manifold $X$ (a vector space is allowed), a Riemannian metric $g$, tangent mobility $\eta_x:T_xX\to T_xX$, Brownian dimension $m$, a filtered probability space with an $m$-dimensional Brownian motion, a diffusion factor $\sigma_x:\mathbb R^m\to T_xX$ satisfying $\sigma_x\sigma_x^*=2D_x$, coefficient domains and regularity, boundary behavior, and either a Stratonovich convention or an Itô convention with the required connection/chart data. A common unit/metering record is also required. If a reset entropy enters a cost term, a registered reset frequency is required to make an entropy rate; physical power additionally requires the declared temperature/energy conversion. The equation alone proves neither well-posedness nor existence, attainment, or uniqueness of a global minimizer, and it does not prove convergence to one. Those conclusions require the separate existence, stability, ergodicity, low-noise, or attractor certificates stated in Appendix D. The principles below are therefore conditional inputs to this branch model rather than an unconditional evolution law of a frozen joint PU theory.

## N.2 Divergence Laws for Hardware and Software Limits

The PCE Potential incorporates costs that diverge as the system approaches fundamental physical or logical limits. Two such divergences are critical:

*   **Predictive Divergence** [Thm. 14]. Fix a preregistered target $\alpha_{\mathrm{tgt}}<\alpha_{SPAP}$ and set $\delta_{\text{SPAP}}:=\alpha_{SPAP}-\alpha_{\mathrm{tgt}}$. On a task class carrying the Bernoulli reduction, independence, confidence, and operation-count certificate $\mathfrak C_{B.2}$, Theorem 14 gives
    $$
    C_{\text{uni}}(\delta_{\text{SPAP}})
    =
    \Omega\left(\frac{\log(1/\delta_{\text{SPAP}})}{\delta_{\text{SPAP}}^2}\right).
    \tag{N.2}
    $$
    An observed $PP$ may replace $\alpha_{\mathrm{tgt}}$ only when the certificate registers that identification and retains its confidence condition. Transfer to a specific predictive-complexity notion such as $C_P$ requires the separate domination bridge on the same task family.

*   **Relativistic Divergence** (Special Relativity). The kinetic energy required to accelerate a particle of rest mass $m_0$ to a velocity $v$ diverges as $v$ approaches the invariant speed $c$:
    $$
    \mathcal{E}_{\text{kin}}(v) = m_0c^2(\gamma(v)-1), \qquad \gamma(v)=\frac{1}{\sqrt{1-v^2/c^2}}
    \tag{N.3}
    $$

## N.3 Conditional Response Models for Predictive Resource Costs

The UCT keeps endpoint kinetic work, SPAP complexity, proper-acceleration response, and internal implementation heating as distinct ledger entries. This section registers response models under which selected entries may be placed in one frame-consistent work functional. It does not identify their limiting operations or derive a common microscopic origin.

### N.3.1 Registered Temperature-Response Branch for Resource Costs

The physical operational cost function $R(C)$ (Definition 3) represents the power required to maintain and operate an implementation of predictive complexity $C$. On the temperature-response branch used below, evaluate this rate in the chosen local comoving frame, extend it to $R(C,T_{\mathrm{eff}})$, and assume over the admitted operating range that
$$
\frac{\partial R}{\partial T_{\mathrm{eff}}}\ge0,
\qquad
\frac{\partial^2R}{\partial C\,\partial T_{\mathrm{eff}}}\ge0.
$$
Strict inequalities may be imposed on ranges where the implementation certificate supports them. These monotonicities are branch hypotheses to be tested or supplied for the implementation; Landauer's bound alone does not prove them for every predictive system.

### N.3.2 Thermodynamic Costs of Physical Acceleration (Unruh Effect)

On the emergent-QFT branch, an idealized detector following a uniformly proper-accelerated trajectory in the Minkowski vacuum has a KMS response at the Unruh temperature [Unruh 1976]:
$$
T_U(a) = \frac{\hbar a}{2\pi c k_B}.
\tag{N.4}
$$
This is a detector-response statement. It does not by itself supply a literal ambient energy flux, a general thermal state for arbitrary trajectories, or a microscopic derivation from MPU reset dynamics. For the bookkeeping model used below, the additional assumptions that this response acts as an effective noise source and that temperatures may be combined as
$$
T_{\mathrm{eff}}(a):=T_{\mathrm{bath}}+T_U(a)
$$
define the declared additive-temperature branch. More general backgrounds and nonstationary trajectories require their detector response functions rather than this additive approximation.

### N.3.3 Internal Thermodynamic Costs from "Predictive Acceleration"

Internal implementation heating is distinct from the proper-acceleration/Unruh branch. Choose an operational throughput coordinate $A_{\mathrm{pred}}$ measured per unit proper time--for example a registered completed-reset rate or a separately defined complexity-update rate--and specify its implementation before comparing costs. Definition 28 and Definition J.1 register the binary structural quotient, and Theorem J.1 gives its log-cardinality $\varepsilon_0=\ln2$. On a separately registered physical-reset branch, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; conversion into heat requires the implementation's reset temperature, activity fraction, and dissipation ledger.

Suppose that implementation supplies a generated-heat rate $\dot Q_{\mathrm{gen}}(A_{\mathrm{pred}})$, a cooling law $\dot Q_{\mathrm{diss}}(T)$, and a finite thermal response. If the resulting internal temperature affects the prediction channel according to the monotonicity hypothesis of Lemma N.4, the associated implementation-specific overhead may be recorded as $C_{\mathrm{noise,internal}}(A_{\mathrm{pred}})$ inside $C_{\mathrm{req}}$. No such overhead follows from SPAP or Landauer alone without this heat-balance bridge.

### N.3.4 Effective Limits on the Rate of Predictive Acceleration

If a particular implementation has a finite maximum cooling rate and a monotone generated-heat law, define an implementation-dependent threshold, when it exists, by
$$
\left.\dot Q_{\mathrm{gen}}(A_{\mathrm{pred}})\right|_{A_{\mathrm{pred,crit}}}
=
\dot Q_{\mathrm{diss,max}}.
\tag{N.4a}
$$
Operation above that threshold may produce thermal runaway in that model. The quantity $A_{\mathrm{pred,crit}}$ is neither a universal speed limit nor a consequence of the SPAP boundary; it depends on the registered processor and cooling mechanism. PCE can favor operation below it only after this implementation-specific term has been incorporated into the relevant PCE potential.

## N.4 The Unified Cost of Transgression (UCT)

**Theorem N.UCT (Frame-Consistent Additive Work Bound).** Assume the payload starts from rest in the laboratory, begins and ends with invariant mass $m_0$ and the same internal stored energy, and leaves no unregistered recoverable field energy. Let
$$
R_{\mathrm{com}}(\tau):=R(C_{\mathrm{req}}(\tau),T_{\mathrm{eff}}(\tau))\ge0
$$
be exported predictive-loss energy per unit proper time in the instantaneous comoving frame. Assume its expected spatial momentum vanishes in that frame and that this ledger is disjoint from the payload kinetic-energy ledger. Then
$$
W_{\mathrm{tot}}^{\mathrm{lab}}\ge m_0c^2(\gamma_f-1)+\int_0^{\tau_f}\gamma(\tau)R_{\mathrm{com}}(\tau)\,d\tau.\tag{N.5}
$$
Changes of invariant mass, internal energy, anisotropic exported momentum, or recoverable field energy require their explicit four-momentum terms. ∎

> **Box N.1: Derived Scaling of Kinetic vs Predictive Contributions**
>
> Consider a trajectory segment with constant proper acceleration $a$ over a proper-time duration $\tau_f$. The final rapidity is $\eta=a\tau_f/c$, so that
>
> $$
> \gamma(v_f)=\cosh\eta,\qquad v_f=c\tanh\eta.
> $$
>
> The Unruh temperature is (Equation N.4)
>
> $$
> T_U(a)=\frac{\hbar a}{2\pi c k_B}.
> $$
>
> In the Landauer-saturating limit for a logically irreversible refresh of $C$ bits of predictive state (Theorem 31), the modeled acceleration-dependent incremental energy dissipation per refresh is (Theorem N.3)
>
> $$
> E_{\text{pred}}^{\mathrm{sat}}(a,C)
> =k_B T_U(a)\,(\ln 2)\,C
> =\frac{\hbar\ln 2}{2\pi c}\,a\,C.
> $$
>
> If such refreshes occur on a proper cycle time $\tau_{cycle}$ (Definition 27), the corresponding Landauer-saturating comoving predictive power is
>
> $$
> P_{\text{pred}}^{\mathrm{sat,com}}(a,C)
> =\frac{E_{\text{pred}}^{\mathrm{sat}}(a,C)}{\tau_{cycle}}
> =\frac{\lambda_{PM}}{\tau_{cycle}}\,a\,C,
> $$
>
> where $\lambda_{PM}=\hbar\ln 2/(2\pi c)$ (Definition N.4). Under the isotropic-export hypotheses of Theorem N.UCT, the associated saturation-branch laboratory work is
>
> $$
> W_{\text{pred}}^{\mathrm{sat,lab}}
> =\int_0^{\tau_f}\gamma(\tau)P_{\text{pred}}^{\mathrm{sat,com}}\,d\tau
> =\frac{\lambda_{PM}c}{\tau_{cycle}}\,C\sinh\eta.
> $$
>
> The kinetic work is (Lemma N.3)
>
> $$
> W_{\text{kin}}^{\mathrm{lab}}
> =m_0c^2(\gamma(v_f)-1)
> =m_0c^2(\cosh\eta-1).
> $$
>
> Their laboratory-frame ratio on this segment is therefore
>
> $$
> \frac{W_{\text{pred}}^{\mathrm{sat,lab}}}{W_{\text{kin}}^{\mathrm{lab}}}
> =\frac{\lambda_{PM}}{m_0c\,\tau_{cycle}}\;C\;\frac{\sinh\eta}{\cosh\eta-1}.
> $$
>
> This is a special Landauer-saturating, isotropic-export example. The full UCT bound (Equation N.5) adds background and internal contributions through $T_{eff}(\tau)$ and $C_{req}(\tau)$ and retains the same Lorentz factor in the laboratory energy ledger.


## N.5 Proof of the UCT Theorem

We restate the theorem (Equation N.5) for convenience before proceeding with the proof.

> **Restatement N.UCT (Frame-Consistent Form for Proof Use).**
> Under the invariant-mass, equal-internal-energy, isotropic-comoving-export, disjoint-ledger, and no-recoverable-field-energy hypotheses stated in Theorem N.UCT, let
> $$
> R_{\mathrm{com}}(\tau)
> :=
> R\!\left(C_{\mathrm{req}}(\tau),T_{\mathrm{eff}}(\tau)\right)
> $$
> be predictive-loss energy per unit proper time in the instantaneous comoving frame. Then the laboratory work obeys
> $$
> W_{\mathrm{tot}}^{\mathrm{lab}}
> \ge
> m_0c^2(\gamma_f-1)
> +
> \int_0^{\tau_f}\gamma(\tau)R_{\mathrm{com}}(\tau)\,d\tau.
> $$
> Additional invariant-mass, internal-energy, anisotropic-momentum, or recoverable-field-energy changes require the explicit four-momentum terms listed in the theorem.

### N.5.1 Preparatory Lemmas

**Lemma N.1 (Comoving Predictive Power Bound).** In the instantaneous comoving frame, the exported predictive-loss power required by the declared operational-cost model obeys
$$
P_{\mathrm{pred}}^{\mathrm{com}}(\tau)
\ge
R_{\mathrm{com}}(\tau)
:=
R\!\left(C_{\mathrm{req}}(\tau),T_{\mathrm{eff}}(\tau)\right).
$$
*Proof.* This is the temperature-dependent operational-cost assumption of Section N.3.1, evaluated in the instantaneous comoving frame. Transformation of the associated exported energy to another frame is a separate four-momentum step and is not contained in the definition of $R_{\mathrm{com}}$. ∎

**Lemma N.2 (Conditional transfer of the SPAP divergence bound).** Fix a target $\alpha_{\mathrm{tgt}}<\alpha_{\mathrm{SPAP}}$ and set $\delta_{\mathrm{SPAP}}:=\alpha_{\mathrm{SPAP}}-\alpha_{\mathrm{tgt}}\in(0,\delta_0]$. Suppose $\mathfrak C_{B.2}$ is accepted for the same task family and that
$$
C_{\mathrm{SPAP}}(\alpha_{\mathrm{tgt}})
\ge
C_{\mathrm{uni}}(\delta_{\mathrm{SPAP}}).
$$
Then
$$
C_{\mathrm{SPAP}}(\alpha_{\mathrm{tgt}})
\ge
c_{\mathrm{SPAP}}
\frac{\log(1/\delta_{\mathrm{SPAP}})}
{\delta_{\mathrm{SPAP}}^2}.
$$
An observed value $PP$ may be substituted for $\alpha_{\mathrm{tgt}}$ only when the certificate registers that identification and its confidence event.

*Proof.* Theorem 14 gives the displayed lower bound for $C_{\mathrm{uni}}(\delta_{\mathrm{SPAP}})$ on the certified task family. Transitivity with the domination hypothesis proves the claim. ∎

**Lemma N.3 (Relativistic work).** For a point particle of rest mass $m_0$, the minimum work required to accelerate it from rest to speed $v_f<c$, with no dissipative losses, is
$$
W_{\mathrm{kin}}(v_f)
=
m_0c^2(\gamma(v_f)-1).
$$

*Proof.* The relativistic energy at speed $v$ is $E(v)=\gamma(v)m_0c^2$. The work–energy theorem gives
$$
W_{\mathrm{kin}}
=
E(v_f)-E(0)
=
\gamma(v_f)m_0c^2-m_0c^2,
$$
which is the stated expression. Any dissipation can only increase the required input work. ∎

**Lemma N.4 (Complexity Cost of Environmental Noise).** Fix a prediction task and let $PP(C,T_{\text{eff}})$ denote the maximal predictive performance achievable at operational complexity $C$. Assume
$$
T_2\ge T_1
\quad\Longrightarrow\quad
PP(C,T_2)\le PP(C,T_1)
$$
for every admissible $C$. Fix $PP_{\text{op}}\in(\alpha,\beta)$ and a temperature domain $\mathcal T$ such that, for every $T\in\mathcal T$, the feasible set
$$
\mathcal F_T:=\{C\ge C_{op}:PP(C,T)\ge PP_{\text{op}}\}
$$
is nonempty and has finite infimum. Define $C^*(T):=\inf\mathcal F_T$. Then $C^*$ is non-decreasing on $\mathcal T$. For a chosen $T_{\text{base}}\in\mathcal T$,
$$
C_{\text{noise}}(T):=C^*(T)-C^*(T_{\text{base}})
$$
is finite and non-decreasing for $T\ge T_{\text{base}}$ in $\mathcal T$.

*Proof.* If $T_2\ge T_1$ and $C\in\mathcal F_{T_2}$, monotonicity gives
$$
PP(C,T_1)\ge PP(C,T_2)\ge PP_{\text{op}},
$$
so $C\in\mathcal F_{T_1}$. Thus $\mathcal F_{T_2}\subseteq\mathcal F_{T_1}$, and taking finite infima gives $C^*(T_2)\ge C^*(T_1)$. Subtracting the same finite baseline value preserves the inequality. ∎

### N.5.2 Proof of the Inequality (N.5)

*Proof of the Inequality (N.5).*

1.  **Registered Work Ledgers:** Under the theorem's hypotheses, endpoint kinetic work and isotropically exported predictive-loss work are disjoint contributions to the laboratory input ledger. Equation (N.5) is a lower bound on their sum; stored-energy changes, anisotropic momentum, recoverable field energy, or other work channels require their own explicit entries.

2.  **Lower Bound on Predictive Work:** The comoving predictive-loss rate at proper time $\tau$ is at least
    $$
    R_{\mathrm{com}}(\tau)
    =R(C_{\text{req}}(\tau),T_{\text{eff}}(\tau)).
    $$
    Under the theorem's isotropic-export hypothesis, an exported comoving energy increment $dE_{\mathrm{com}}=R_{\mathrm{com}}d\tau$ has four-momentum $(dE_{\mathrm{com}}/c,\mathbf0)$ and therefore laboratory energy $dE_{\mathrm{lab}}=\gamma(\tau)dE_{\mathrm{com}}$. Hence
    $$
    W_{\text{pred}}^{\mathrm{lab}}
    \ge
    \int_0^{\tau_f}\gamma(\tau)R(C_{\text{req}}(\tau),T_{\text{eff}}(\tau))\,d\tau,
    $$
    On the optional SPAP/noise decomposition branch, require a registered source-disjointness audit proving that the SPAP, external-noise, internal-noise, and $T_{\mathrm{eff}}$ entries do not charge the same physical mechanism twice. With $\alpha_{\mathrm{tgt}}(\tau)$ fixed by the registered task schedule, define
    $$
    C_{\text{req}}(\tau)
    =
    C_{\text{SPAP}}(\alpha_{\mathrm{tgt}}(\tau))
    +C_{\text{noise,external}}(a(\tau))
    +C_{\text{noise,internal}}(A_{\text{pred}}(\tau)).
    $$

3.  **Explicit SPAP lower bound (optional form):** Assume one same-family $\mathfrak C_{B.2}$ and domination certificate supplies constants $c_{\text{SPAP}}>0$ and $\delta_0>0$ uniformly over the entire target schedule. By Lemma N.2, for $\delta(\tau)=\alpha_{\text{SPAP}}-\alpha_{\mathrm{tgt}}(\tau)\in(0,\delta_0]$,
    $$
    C_{\text{SPAP}}(\alpha_{\mathrm{tgt}}(\tau))
    \ge
    c_{\text{SPAP}}\,\frac{\log(1/\delta(\tau))}{\delta(\tau)^2}.
    $$
    Since $R(C,T)$ is non-decreasing in $C$ (Definition 3), this yields
    $$
    W_{\text{pred}}^{\mathrm{lab}}
    \ge
    \int_0^{\tau_f}\gamma(\tau)R\!\left(
    c_{\text{SPAP}}\frac{\log(1/\delta(\tau))}{\delta(\tau)^2}
    +C_{\text{noise,external}}(a(\tau))
    +C_{\text{noise,internal}}(A_{\text{pred}}(\tau)),
    T_{\text{eff}}(\tau)\right)\,d\tau.
    $$
    This transfer uses the same-family domination hypothesis of Lemma N.2. Replacing $\alpha_{\mathrm{tgt}}(\tau)$ by an observed $PP(\tau)$ additionally requires the registered confidence event.

4.  **Add Kinetic Work:** The laboratory kinetic work required to accelerate from rest to velocity $v_f$ is at least $W_{\text{kin}}^{\mathrm{lab}}\ge m_0c^2(\gamma_f-1)$ (Lemma N.3). The theorem's disjoint-ledger hypothesis permits addition, giving exactly (N.5). QED.

## N.6 Interpretation and Programme

*   **Two Costs in One Conditional Ledger:** Relativistic endpoint kinetic work and predictive-resource cost can be entered in the same work ledger, but velocity and proper acceleration are distinct variables. A body may coast inertially at high constant velocity with $a=0$ and therefore has no Unruh increment. On the detector-response, additive-temperature, and active-refresh branch, periods of nonzero proper acceleration can add a predictive-loss term; internal processing can add a separate self-heating term. The UCT combines these declared contributions without proving that the kinematic and SPAP limits have a common microscopic origin.

*   **No Simple Algebraic Lock:** There is no algebraic equality linking $v$ and $PP$, and proper acceleration rather than velocity activates the modeled Unruh increment. Within a specified trajectory class, fixed boundary data, and an accepted response/refresh branch, the right-hand side of (N.5) or (N.18) may be used as a conditional objective or lower-bound surrogate. A finite budget can then produce a trade-off between trajectory work and predictive resources, but the UCT alone does not force every system to lower $PP$, adopt a smoother path, or contract its predictive horizon. **Temporal Horizon Contraction** and **Predictive Resolution Contraction** label possible outputs of that registered optimization model. Incorporating the complete functional into the global PCE potential $V$ remains future work.

*   **Empirical Target:** On the registered detector-response, additive-temperature, active-refresh, and export branch, proper acceleration contributes a specified incremental refresh cost whose effect on predictive performance can be tested after baseline thermal and implementation costs are controlled. The UCT makes no universal claim about every accelerated system, and geodesic motion does not activate the proper-acceleration term without an additional orbital bridge. Laboratory, astrophysical, biological, or artificial-system tests must therefore certify the relevant response and refresh mechanism before interpreting a null or positive result as a UCT test.


## N.7 Ontological Interpretation of Prediction Relativity

The preceding sections construct a conditional work ledger using the standard detector-response form of the Unruh effect as an input. The relational account below is a proposed interpretation of that emergent-spacetime ledger. It neither derives the Unruh response from pre-geometric MPU dynamics nor establishes that predictive updating and physical acceleration share a microscopic mechanism.

### N.7.1 Motion as an Emergent Interpretation of a Predictive Process

At the most fundamental level of the PU framework, there is no pre-existing spacetime for an MPU to "move through." Reality consists of a relational network of interacting MPUs (Hypothesis 1). In this foundational view:

* "Position" is an emergent property defined by an MPU aggregate's pattern of predictive relationships with the rest of the network.

* "Motion" is the macroscopic interpretation of a continuous, coordinated evolution of this relational pattern.

* "Physical Acceleration" is therefore not a primary concept but the emergent description of a rapid, resource-intensive reconfiguration of the system's predictive relationships with the entire network. It is fundamentally an act of predictive work on a massive scale.

### N.7.2 Relational Interpretation of the Unruh Effect: Open Microscopic Bridge

The UCT uses the standard emergent-spacetime Unruh response as an input: a detector with proper acceleration $a$ has temperature $T_U=\hbar a/(2\pi c k_B)$. PU may interpret acceleration as rapid relational updating, but the stronger claim that microscopic MPU update heat produces the Unruh bath is not derived here.

A future microscopic bridge would have to specify, before comparison, the MPU update generator, the accelerated detector observable, the state and scaling limit, the KMS response, and an energy ledger showing that the relevant exported heat is neither double-counted with detector work nor with the standard field response. Only such a construction could identify update dissipation with the Unruh spectrum.

Accordingly, "processing heat" and the Unruh bath are presently analogous contributions to the UCT cost ledger, not proven identical mechanisms. If an independently defined serialized link-cycle time $\tau_{\mathrm{link}}$ is used to set $a_*:=c/\tau_{\mathrm{link}}$, substitution into the standard Unruh formula gives the formal identity
$$
\frac{\hbar}{k_B T_U(a_*)}=2\pi\tau_{\mathrm{link}}.
$$
This algebra does not derive $\tau_{\mathrm{link}}$, a universal minimum update time, or the Unruh effect from SPAP.

### N.7.3 Consistency of the Two Descriptive Layers

The ontological interpretation presented here is a proposed reading of the operational model, not an explanation or derivation of why quantum field theory has the Unruh response. Its microscopic validity remains contingent on the bridge specified in Section N.7.2.

On this proposed relational reading, "software" prediction and "hardware" motion may contribute to one resource ledger while remaining physically distinct processes. Their identification as facets of one microscopic mechanism is a hypothesis requiring the bridge specified in Section N.7.2, not a conclusion of the UCT theorem.

## N.8 A High-Precision Test for Predictive Drag in Binary Pulsars

The proper-acceleration active-refresh branch of the UCT supplies a conditional acceleration-dependent loss term. The centers of mass of an ideal gravitational binary follow geodesics and therefore do not possess the proper acceleration entering the standard Unruh formula. Binary-pulsar timing becomes a test of UCT only after the additional orbital-acceleration bridge of Definition N.12a is declared; its fitted factor $q_{\mathrm{act}}^{\mathrm{orb}}$ is not a prediction of the proper-acceleration theorem.

#### N.8.1 The Perfect Laboratory: Why Binary Pulsars?

Binary pulsars are ideal for this test for several key reasons:

*   **Extreme and Variable Accelerations:** The two neutron stars in the Double Pulsar system, PSR J0737–3039A/B, orbit each other every 2.45 hours on a mildly eccentric ($e \approx 0.088$) orbit with a semi-major axis of approximately $8.8 \times 10^8$ m (Kramer et al. 2021). This yields an average orbital speed of $v \approx 6.3 \times 10^5$ m/s (~0.2% $c$) and an average centripetal acceleration of $a_{avg} \approx 4.5 \times 10^2$ m/s² (~45 $g$). Crucially, the eccentricity causes the acceleration to vary predictably, ranging from approximately 38 $g$ at apastron (maximum separation) to approximately 54 $g$ at periastron (minimum separation), providing a strongly modulated, time-dependent signal for probing acceleration-dependent effects.

*   **Ultra-Precise Clocks:** By monitoring the pulses from PSR J0737–3039A over 16 years with a state-of-the-art timing model (such as the T2 model used in TEMPO2), the rate of orbital decay, $\dot{P}_b$, can be measured to a relative precision of 0.013%. This corresponds to an absolute uncertainty of order $1.6\times10^{-16}$ s/s, or about 0.16 femtoseconds per second (Kramer et al. 2021).

*   **Clean Gravitational System:** Unlike systems involving white dwarfs or main-sequence stars, the two compact neutron stars in PSR J0737–3039A/B experience negligible tidal dissipation or mass transfer at their separation. Any such unmodeled classical effects are predicted to be far below the current timing sensitivities, leaving gravity as the overwhelmingly dominant force governing the orbital dynamics (Kramer & Wex 2009).

*   **Precision GR Baseline:** The declared null model is a specified post-Newtonian timing and radiative model, with the quadrupole flux as its leading term and with kinematic, Galactic, propagation, and system-specific nuisance corrections included or bounded in the same fit. The cited comparisons test that complete baseline rather than an exact quadrupole-only formula:
    *   **PSR B1913+16 (Hulse–Taylor):** after the stated corrections, the measured $\dot P_b$ agrees with the registered GR timing prediction to within the quoted $0.2\%$ comparison precision (Weisberg et al. 2010).
    *   **PSR J0737–3039A/B (Double Pulsar):** the long-baseline timing analysis reports the quoted $0.013\%$ comparison precision within its specified timing model and correction ledger (Kramer et al. 2021). A UCT residual test must retain those nuisance and extrinsic terms in its null model.

#### N.8.2 Standard Model vs. Predictive Universe: A Tale of Two Energy Drains

**Declared GR null model:** The post-Newtonian timing/radiative model predicts the orbital decay, with Einstein's quadrupole flux as the leading radiation term. Any claim that gravitational radiation exhausts the fitted loss budget is conditional on the same model's higher-order terms and on the registered bounds or nuisance treatment for kinematic, Galactic, tidal, mass-transfer, propagation, and other system-specific effects. The comparator is therefore $(dP_b/dt)_{\mathrm{GR}}$ from that declared model, not an exact quadrupole-only law.

**Conditional Orbital-Bridge Model (GR + UCT bridge):** The proper-acceleration UCT theorem adds no center-of-mass loss channel for ideal geodesic motion. The alternative timing model below adds a channel only by postulating the orbital-acceleration bridge of Definition N.12a.

*   **The Conditional Mechanism:** The bridge admits the timing-model orbital acceleration as an effective relational variable and fits $q_{\mathrm{act}}^{\mathrm{orb}}$. It is not a claim that ordinary orbital coordinate acceleration gives either neutron star a standard Unruh bath. Any exported energy must also be entered explicitly and without double counting in the orbital ledger.
*   **The Model Energy Loss:** On that bridge the modeled loss rate is
$$
\frac{dE}{dt}_{\mathrm{model}}
=
\frac{dE}{dt}_{\mathrm{GR(GW)}}
+
P_{UCT}^{\mathrm{orb}}(t),
$$
where $P_{UCT}^{\mathrm{orb}}\ge0$ is the empirical bridge term defined below, not an unconditional consequence of Theorem N.UCT.

#### N.8.3 Conditional Orbital-Bridge Signature and Identifiability

The key to detecting this effect lies in the fact that the two energy loss mechanisms have different functional dependencies on the orbital parameters.

*   **The GR Signal:** The power radiated in GWs depends on the third time derivative of the system's quadrupole moment. For a binary orbit, this scales in a complex way with the stars' velocities and separation, but is characteristically strongest near periastron where both are maximized.
*   **The Conditional Bridge Signal:** On the proper-acceleration, active-refresh, and Landauer-saturating branch, the modeled comoving increment for a system $S$ is
    $$
    P_{UCT}(S;a)
    =
    \frac{\lambda_{PM}}{\tau_{cycle}}\,a\,C_{eff}
    =
    q_{\mathrm{act}}(S)\frac{c}{2\pi}m_Sa.
    $$
    This formula uses proper acceleration. For a geodesic binary it enters the timing model only after Definition N.12a replaces that input by its declared orbital variable and introduces the distinct fitted factor $q_{\mathrm{act}}^{\mathrm{orb}}$. The proper-acceleration factor $q_{\mathrm{act}}$, the orbital factor $q_{\mathrm{act}}^{\mathrm{orb}}$, and Proposition N.4's boundary utilization $q$ remain distinct unless an additional bridge equates them.

For a fixed orbital-bridge factor, the candidate correction follows the phase dependence of the acceleration combination specified in Definition N.12a and can perturb $\dot P_b$. Its distinguishability from GR, tidal, magnetospheric, and timing-model nuisance terms is an identifiability question for the fitted model. No unique temporal signature follows from Theorem N.UCT alone.

#### N.8.4 The Experimental Test: A Precision Timing Analysis

The search for this effect constitutes a high-precision data analysis challenge.

1.  **Acquire Data:** Utilize long-term, high-cadence timing data from the best-suited binary pulsar system, such as the Double Pulsar (PSR J0737−3039A/B).

2.  **Establish the Null Hypothesis (Model$_{GR}$):**
     *   Employ a state-of-the-art pulsar timing model (e.g., the T2 model used in TEMPO2 software) that incorporates all known relativistic effects, including orbital decay due to GW emission as predicted by GR.
     *   Fit this Model$_{GR}$ to the timing data to determine the system's parameters (masses, orbital elements, etc.) with the highest possible precision.
     *   Calculate the timing residuals: Residuals = Data $-$ Model$_{GR}$. If GR is the complete theory, these residuals should be statistically indistinguishable from random noise.

3.  **Construct the Alternative Hypothesis (Model$_{UCT}$):**
    *   Begin with the standard Model$_{GR}$.
    *   The proper-acceleration UCT amplitude is fixed by Section N.8.6 as
        $$
        \Xi(S)=q_{\mathrm{act}}(S)\,\frac{c^2m_S}{\hbar\ln2}.
        $$
        A binary-pulsar timing model may use this normalization only after adding the orbital-acceleration test bridge of Definition N.12a. On that bridge the cumulative anomalous energy loss is modeled by $P_{UCT}^{\mathrm{orb}}(t)$, with fitted parameter $q_{\mathrm{act}}^{\mathrm{orb}}$, rather than by an unconstrained dimensional amplitude $\Xi$.
    *   This defines a new, expanded timing model: Model$_{UCT}$ = Model$_{GR}$ + Correction$_{UCT}(q_{\mathrm{act}}^{\mathrm{orb}})$ on the orbital-acceleration bridge.

4.  **Perform a Bayesian Model Comparison:**
    *   Use a Bayesian inference framework (e.g., employing nested sampling or MCMC techniques) to simultaneously fit both Model$_{GR}$ and Model$_{UCT}$ to the dataset.
    *   This analysis will yield the posterior probability distributions for all parameters in both models. Crucially, it will also allow for the calculation of the **Bayesian evidence** (or marginal likelihood), $Z$, for each model.
    *   The test consists of comparing the evidence via the **Bayes factor**:
$$ B = \frac{Z(\text{Model}_{UCT})}{Z(\text{Model}_{GR})} $$

*   If $B\approx1$, the declared models have comparable marginal likelihood under the registered priors; this alone supplies no parameter bound. A one-sided limit on $q_{\mathrm{act}}^{\mathrm{orb}}$ requires the timing-likelihood and response certificates of Corollary N.12.2. No limit on $\Xi$ follows unless an additional typed bridge identifies it with the fitted orbital coefficient.
*   If $B\gg1$ under preregistered model priors, the data favor the declared UCT timing model relative to the declared GR model. Calling this a bridge detection additionally requires the registered decision threshold, posterior-predictive checks, nuisance and alternative-model audit, identifiability of the orbital template, and the stated replication rule; a Bayes factor alone does not establish the physical bridge.

#### N.8.5 Challenges and Outlook

This is an extraordinarily difficult measurement that pushes the boundaries of precision science.

*   **Magnitude Problem:** The published GR comparison motivates a search near the quoted $1.3\times10^{-4}$ fractional precision scale, but that scale is not a bound on $P_{UCT}^{\mathrm{orb}}/P_{GW}$ or on $q_{\mathrm{act}}^{\mathrm{orb}}$. Such a bound requires the accepted timing-likelihood and uniform response certificates of Corollary N.12.2.
*   **Degeneracy Problem:** The primary systematic challenge is ensuring that any detected signal isn't mimicking some other subtle, unmodeled physical effect. High-eccentricity systems are essential, as they provide a wide dynamic range of acceleration, which is key to tracing out the functional form of $P_{UCT}(a)$ and distinguishing it from other potential systematics. A full analysis must rigorously account for or model effects like tidal dissipation and magnetospheric interactions, even if they are expected to be negligible.

Despite these hurdles, the declared alternative defines a testable question once its branch and identifiability assumptions are registered. A positive result supports the orbital bridge only under the preregistered likelihood and alternative audit; a null result constrains $q_{\mathrm{act}}^{\mathrm{orb}}$ only through accepted timing-likelihood and uniform response certificates as in Corollary N.12.2.

#### N.8.6 Active-Refresh Normalization and Conditional Binary-Pulsar Bridge

**Definition N.12 (Proper-Acceleration Active-Refresh Factor).** For a system $S$ of inertial mass $m_S$ undergoing proper acceleration magnitude $a>0$, let $q_{\mathrm{act}}(S;a)\in[0,1]$ be an independently registered fraction of the certified boundary-update cycles activated by the acceleration response. Define the saturated Landauer lower-bound scale
$$
P_{\mathrm{UCT}}^{\mathrm{sat}}(S;a)
:=\frac{c}{2\pi}m_Sa,
\qquad
P_{\mathrm{UCT}}^{\mathrm{LB}}(S;a)
:=q_{\mathrm{act}}(S;a)P_{\mathrm{UCT}}^{\mathrm{sat}}(S;a).
$$
Every implementation on Theorem N.6's detector-response branch satisfies $\dot Q_{\mathrm{act}}\ge P_{\mathrm{UCT}}^{\mathrm{LB}}$. The model signal equality $P_{\mathrm{UCT}}=P_{\mathrm{UCT}}^{\mathrm{LB}}$ is available only on its additional same-rate reversible-limit overlap; dissipative overhead belongs to a separate heat ledger and is not absorbed into $q_{\mathrm{act}}$. The symbol $q_{\mathrm{act}}$ is not identified with the relational-utilization coordinate $q$ of Proposition N.4 unless an additional typed bridge proves that equality.

**Theorem N.12 (Forced Form of the Proper-Acceleration UCT Amplitude).** *If the N.8.3 proper-acceleration signal is written as*
$$
P_{UCT}(S;a)=\lambda_{PM}\,a\,\Xi(S),
\qquad
\lambda_{PM}=\frac{\hbar\ln2}{2\pi c},
$$
*then*
$$
\Xi(S)=q_{\mathrm{act}}(S;a)\,\frac{c^2m_S}{\hbar\ln2}.
$$
*On the saturated proper-acceleration active-refresh and same-rate reversible-limit overlap, $q_{\mathrm{act}}=1$ and hence*
$$
\Xi_{\mathrm{sat}}(S)=\frac{c^2m_S}{\hbar\ln2}.
$$

*Proof.* Equating $P_{UCT}=\lambda_{PM}a\Xi$ with Definition N.12 gives
$$
\frac{\hbar\ln2}{2\pi c}a\Xi
=
q_{\mathrm{act}}\frac{c}{2\pi}m_Sa.
$$
For $a>0$, cancellation and rearrangement give the displayed expression. $\square$

**Corollary N.12b (Proper-Acceleration Entropy Drag Observable).** On the proper-acceleration active-refresh, detector-response, and same-rate reversible-limit overlap of Definition N.12 and Theorem N.6, the registered UCT signal power of a system $S$ of inertial mass $m_S$ undergoing proper acceleration magnitude $|a|$ is
$$
\boxed{
P_{\mathrm{UCT}}(S;a)
=
q_{\mathrm{act}}(S;a)\frac{c}{2\pi}m_S|a|.
}
\tag{N.12b}
$$
Consequently the dimensionless calorimetric observable
$$
\boxed{
\mathcal Q_a
:=
\frac{2\pi P_{\mathrm{excess}}}{c\,m_S|a|}
}
\tag{N.12c}
$$
equals $q_{\mathrm{act}}$ after ordinary mechanical, electromagnetic, thermal, and material loss channels are subtracted:
$$
\mathcal Q_a=q_{\mathrm{act}}.
$$
For an ideal freely falling system whose center of mass follows a geodesic, the proper four-acceleration vanishes,
$$
a^\mu=u^\nu\nabla_\nu u^\mu=0,
$$
and the proper-acceleration UCT channel gives
$$
P_{\mathrm{UCT}}=0.
$$
Thus the branch predicts a proper-acceleration drag channel, not a coordinate-acceleration or gravitational-field channel.

*Proof.* Definition N.12 defines
$$
q_{\mathrm{act}}(S;a)
=
\frac{P_{UCT}(S;a)}
{P_{UCT}^{\mathrm{sat}}(S;a)}
$$
with
$$
P_{UCT}^{\mathrm{sat}}(S;a)=\frac{c}{2\pi}m_S|a|.
$$
Solving for $P_{UCT}$ gives Equation N.12b. Dividing Equation N.12b by $c\,m_S|a|/(2\pi)$ gives $\mathcal Q_a=q_{\mathrm{act}}$. The Unruh temperature entering Theorem N.3 depends on proper acceleration magnitude, not coordinate acceleration. For geodesic motion $a^\mu=0$, so $T_U=0$ for the acceleration-induced increment and the corresponding UCT power vanishes. ∎

**Definition N.12a (Orbital-Acceleration Test Bridge).** For a gravitationally bound binary whose centers of mass follow ideal geodesic motion, the coordinate or relative orbital acceleration is not the proper acceleration entering the Unruh temperature in Equation N.4. A binary-pulsar UCT timing test therefore requires the following additional **orbital-acceleration bridge**:

1. the timing-model orbital acceleration magnitudes $|a_A(t)|$ and $|a_B(t)|$ are admitted as effective relational acceleration variables for the UCT loss channel;
2. the UCT orbital loss is modeled by
$$
P_{UCT}^{\mathrm{orb}}(t)
=
q_{\mathrm{act}}^{\mathrm{orb}}\frac{c}{2\pi}
\left(m_A|a_A(t)|+m_B|a_B(t)|\right);
$$
3. this loss enters the orbital-energy balance additively with the gravitational-wave channel.

Absent this bridge, the proper-acceleration UCT term gives no center-of-mass double-pulsar bound for ideal geodesic orbital motion. The parameter $q_{\mathrm{act}}^{\mathrm{orb}}$ is a bridge parameter and is not automatically equal to the proper-acceleration factor $q_{\mathrm{act}}$.

**Corollary N.12.1 (Conditional Saturated-Bridge Power for the Double Pulsar).** *For PSR J0737–3039A/B with $m_A=1.338M_\odot$, $m_B=1.249M_\odot$, relative semi-major axis $a_{\mathrm{orb}}=8.79\times10^8$ m, and eccentricity $e=0.0878$ (Kramer et al. 2021), the orbit-averaged saturated orbital-bridge power is*
$$
\langle P_{UCT}^{\mathrm{orb,sat}}\rangle
=
\frac{c}{2\pi}
\left(
m_A\langle |a_A|\rangle + m_B\langle |a_B|\rangle
\right)
\approx
5.47\times10^{40}\,\mathrm W,
$$
*where*
$$
\langle r^{-2}\rangle_t=\frac{1}{a_{\mathrm{orb}}^2\sqrt{1-e^2}},
\qquad
\langle |a_A|\rangle=Gm_B\langle r^{-2}\rangle_t,
\qquad
\langle |a_B|\rangle=Gm_A\langle r^{-2}\rangle_t.
$$

*Proof.* Parametrize the Kepler ellipse by the eccentric anomaly $E$. Then
$$
r=a_{\mathrm{orb}}(1-e\cos E),
\qquad
dt=\frac{1-e\cos E}{n}\,dE,
\qquad
T=\frac{2\pi}{n}.
$$
Consequently
$$
\langle r^{-2}\rangle_t
=\frac1T\int_0^T\frac{dt}{r^2}
=\frac{1}{2\pi a_{\mathrm{orb}}^2}
\int_0^{2\pi}\frac{dE}{1-e\cos E}.
$$
With $u=\tan(E/2)$, splitting the integral at $E=\pi$ gives
$$
\int_0^{2\pi}\frac{dE}{1-e\cos E}
=2\int_{-\infty}^{\infty}
\frac{du}{(1-e)+(1+e)u^2}
=\frac{2\pi}{\sqrt{1-e^2}}.
$$
This proves the displayed time average. Newtonian center-of-mass kinematics gives
$$
|a_A|=\frac{Gm_B}{r^2},
\qquad
|a_B|=\frac{Gm_A}{r^2}.
$$
Using $M_\odot=1.98847\times10^{30}\,\mathrm{kg}$, $G=6.67430\times10^{-11}\,\mathrm{m^3kg^{-1}s^{-2}}$, and $c=2.99792458\times10^8\,\mathrm{m\,s^{-1}}$ gives
$$
m_A=2.66057\times10^{30}\,\mathrm{kg},
\qquad
m_B=2.48360\times10^{30}\,\mathrm{kg},
$$
and
$$
\langle r^{-2}\rangle_t
=1.29928\times10^{-18}\,\mathrm{m^{-2}}.
$$
Therefore
$$
\langle P_{UCT}^{\mathrm{orb,sat}}\rangle
=\frac{c}{2\pi}
\left(2Gm_Am_B\langle r^{-2}\rangle_t\right)
=5.46809\times10^{40}\,\mathrm W,
$$
which rounds to the stated value. ∎

**Corollary N.12.2 (Timing-Likelihood Promotion Gate and Leading Sensitivity).** For the same binary, the leading-quadrupole Peters comparator is
$$
\langle P_{GW}^{\mathrm{quad}}\rangle
=
\frac{32}{5}
\frac{G^4(m_Am_B)^2(m_A+m_B)}
{c^5a_{\mathrm{orb}}^5}
f(e),
\qquad
f(e):=
\frac{1+\tfrac{73}{24}e^2+\tfrac{37}{96}e^4}{(1-e^2)^{7/2}}.
$$
At $e=0.0878$,
$$
f(e)=1.05157065\ldots,
\qquad
\langle P_{GW}^{\mathrm{quad}}\rangle
=2.36060\times10^{25}\,\mathrm W,
$$
and hence the leading fixed-parameter response coefficient is
$$
K_{\mathrm{quad}}
:=
\frac{\langle P_{UCT}^{\mathrm{orb,sat}}\rangle}
{\langle P_{GW}^{\mathrm{quad}}\rangle}
=
\frac{5.46809\times10^{40}}{2.36060\times10^{25}}
=2.31640\times10^{15}.
\tag{N.12d}
$$

An observational upper bound requires two independently accepted records:

1. a timing-likelihood certificate $\mathfrak C_{\mathrm{tim}}$ fixing the data set, complete post-Newtonian timing and radiative null model, mass and ephemeris inputs, Galactic, kinematic, propagation, and system-specific nuisance parameters, priors or sampling rule, covariance, confidence construction, and numerical tolerance, and returning a one-sided $(1-\alpha)$ upper limit $r_+^{(1-\alpha)}$ for the nonnegative fractional anomalous orbital-decay response;
2. a response certificate $\mathfrak C_{\mathrm{resp}}$ fixing the UCT acceleration profile and its insertion into that same timing model and proving, uniformly over its declared nuisance and parameter domain,
$$
r(q,\nu)
:=
\frac{\dot P_b(q,\nu)-\dot P_b(0,\nu)}{\lvert\dot P_b^{\mathrm{GR}}(\nu)\rvert}
\ge K_-q,
\qquad K_->0,
\tag{N.12e}
$$
with the sign convention chosen so that an additional loss has $r\ge0$. The proof of (N.12e) must include the nonlinear remainder, refitting response, and all correlations with $\nu$; the leading comparator (N.12d) does not by itself establish $K_-=K_{\mathrm{quad}}$.

On the intersection of these records,
$$
\boxed{
q_{\mathrm{act}}^{\mathrm{orb}}
\le
\frac{r_+^{(1-\alpha)}}{K_-}
}
\tag{N.12f}
$$
at the confidence status declared by $\mathfrak C_{\mathrm{tim}}$.

*Proof.* Acceptance of $\mathfrak C_{\mathrm{tim}}$ gives
$r(q_{\mathrm{act}}^{\mathrm{orb}},\nu)\le r_+^{(1-\alpha)}$
under its declared decision rule. Acceptance of $\mathfrak C_{\mathrm{resp}}$ gives
$K_-q_{\mathrm{act}}^{\mathrm{orb}}\le r(q_{\mathrm{act}}^{\mathrm{orb}},\nu)$
uniformly over the same nuisance domain. Since $K_->0$, division gives (N.12f). The evaluations of $f(e)$, the quadrupole power, and $K_{\mathrm{quad}}$ are direct substitutions and establish only the leading fixed-parameter sensitivity. ∎

The quoted fractional comparison precision $1.3\times10^{-4}$ is not, merely by being a precision, a one-sided upper limit from $\mathfrak C_{\mathrm{tim}}$. If it is inserted only as a diagnostic scale and if $K_{\mathrm{quad}}$ is used only as the leading response comparator, then
$$
q_{\mathrm{sens}}
:=
\frac{1.3\times10^{-4}}{2.31640\times10^{15}}
=5.61215\times10^{-20}.
\tag{N.12g}
$$
This number becomes a bound only if the timing analysis independently certifies $r_+^{(1-\alpha)}=1.3\times10^{-4}$ under its stated convention and the response audit certifies $K_-=K_{\mathrm{quad}}$ over the fitted domain.

**Corollary N.12.3 (Conditional Saturated-Bridge Exclusion Criterion).** On the orbital-acceleration test bridge, the saturated branch $q_{\mathrm{act}}^{\mathrm{orb}}=1$ is excluded at the status declared by $\mathfrak C_{\mathrm{tim}}$ whenever accepted certificates satisfy
$$
\frac{r_+^{(1-\alpha)}}{K_-}<1.
$$
The currently quoted comparison precision and leading power ratio do not, without the two promotion certificates of Corollary N.12.2, establish that exclusion. This leaves the proper-acceleration factor $q_{\mathrm{act}}$ of Definition N.12 and the boundary-channel utilization factor $q$ of Proposition N.4 logically separate.

*Proof.* Equation (N.12f) and $r_+^{(1-\alpha)}/K_-<1$ are incompatible with $q_{\mathrm{act}}^{\mathrm{orb}}=1$. The parameter-separation statement follows from Definition N.12a. ∎

**Remark N.12.1 (Leading Active-Refresh Sensitivity).** Equation (N.12g) is a leading sensitivity to the orbital-bridge coefficient, not by itself a microscopic count of actively refreshed degrees of freedom. On the independent mass-normalization branch $\mathfrak B_{\mathrm{mass}}$, a neutron star with $m=1.338M_\odot$ has
$$
\mathcal I_{\mathrm{rel}}
=\frac{2c^2\tau_{\min}m}{\hbar}
\approx5.76\times10^{38}\ \text{nats}.
$$
Turning a certified bound on $q_{\mathrm{act}}^{\mathrm{orb}}$ into a bound on an active-information count additionally requires a microscopic activity map proving that this bridge coefficient is the corresponding information fraction and that its ledger is source-exhaustive and free of double counting.

**Corollary N.12.4 (Forward-Looking Diagnostic Sensitivity).** A prospective fractional timing scale of $10^{-5}$ with the leading comparator (N.12d) gives
$$
q_{\mathrm{sens}}^{\mathrm{future}}
=
\frac{10^{-5}}{2.31640\times10^{15}}
=4.31704\times10^{-21}
\approx4.3\times10^{-21}.
$$
This is a prospective diagnostic, not a forecasted bound. It becomes a same-system bound only if the future release supplies an accepted timing-likelihood certificate with the corresponding $r_+^{(1-\alpha)}$ and an accepted response certificate supplies $K_-$ in the same fitted model. An orbital-phase identification additionally requires the response certificate to distinguish the declared acceleration profile from every registered nuisance template.

## N.9 The UCT as a Strategic Choice Between Intensive and Extensive Knowledge Acquisition

The UCT does not by itself dictate a knowledge-acquisition strategy or establish a common physical origin for the motion and prediction limits. It permits a conditional finite-budget optimization only after a trajectory class, prediction task, response model, active-refresh mechanism, and non-double-counted work ledger have been registered.

1.  **Rindler Response and Sampling:** An ideal detector on an eternally uniformly accelerated worldline has a Rindler horizon and a KMS response characterized by $T_U=\hbar a/(2\pi c k_B)$. This detector-response statement is not a universal ambient thermal bath interacting with every accelerated system. Only on the declared response and refresh branch may the modeled increment enter the predictor's cost ledger. Broad sampling may also include inertial coasting, for which proper acceleration and the Unruh increment vanish.

2.  **The Prediction Coherence Boundary and the Cost of Modeling:** For a preregistered target schedule $\alpha_{\mathrm{tgt}}(\tau)<\alpha_{\mathrm{SPAP}}$ on task classes carrying $\mathfrak C_{B.2}$, Theorem 14 gives
    $$
    C_{\mathrm{uni}}(\delta_{\mathrm{SPAP}})
    =
    \Omega\!\left(
    \frac{\log(1/\delta_{\mathrm{SPAP}})}
    {\delta_{\mathrm{SPAP}}^2}
    \right),
    \qquad
    \delta_{\mathrm{SPAP}}
    :=
    \alpha_{\mathrm{SPAP}}-\alpha_{\mathrm{tgt}}.
    $$
    Transfer to $C_P$ or $C_{\mathrm{SPAP}}$ requires the same-family domination bridge of Lemma N.2. An observed $PP$ may instantiate the target only with the registered confidence event; no unconditional $C_P$ divergence follows from notation alone.

For a specified proper-time interval, suppose the baseline task power, the saturation-branch acceleration-refresh increment, endpoint kinetic work, and all other entries are disjoint and transformed to the laboratory ledger according to Theorem N.UCT. If the available laboratory work is $B_{\mathrm{lab}}$, a necessary feasibility condition is
$$
m_0c^2(\gamma_f-1)
+
\int_0^{\tau_f}\gamma(\tau)
\left[
P_{\mathrm{task}}^{\mathrm{com}}(PP(\tau))
+
P_{\mathrm{pred}}^{\mathrm{sat,com}}(a(\tau),C(\tau))
\right]d\tau
+
W_{\mathrm{other}}^{\mathrm{lab}}
\le B_{\mathrm{lab}},
$$
where
$$
P_{\mathrm{pred}}^{\mathrm{sat,com}}(a,C)
=
\frac{\lambda_{PM}aC}{\tau_{cycle}}.
$$
This is a conditional work-budget constraint, not the mixed-frame identity $P_{\mathrm{total}}=P_{\mathrm{kin}}(a)+P_{\mathrm{task}}+P_{\mathrm{noise}}$.

An intensive strategy may allocate more of this budget to task fidelity and less to endpoint or refresh work. An extensive strategy may allocate more to reaching additional sampling regions. Neither conclusion is forced: inertial coasting can provide spatial coverage without a continuous Unruh increment, and task performance need not fall unless the accepted finite budget and cost functions make the alternatives compete. PCE selects among such strategies only after the complete objective, trajectory constraints, and branch data have been supplied.

## N.10 Conditional Unruh–Landauer Acceleration–Refresh Formula

The following equation isolates the Landauer-saturating acceleration-dependent refresh increment on the declared detector-response branch. It is not a universal equation unifying prediction and motion.

### N.10.1 Saturating Acceleration–Refresh Formula

**Theorem N.3 (Predictive Energy Cost Under Acceleration).** On the detector-response and additive-temperature branch of Section N.3.2, suppose a logically irreversible refresh of $C$ predictive bits is performed in the instantaneous comoving frame and saturates the Landauer bound for the modeled Unruh-temperature increment. Then

$$
\boxed{E_{\text{pred}}^{\text{sat}}(a, C) = \frac{\hbar \ln 2}{2\pi c} \cdot a \cdot C}
\tag{N.14}
$$

This is a branch-conditional saturation value. A non-saturating implementation may dissipate more, and the theorem does not derive the Unruh detector response from microscopic MPU dynamics.

*Proof.* By Landauer's principle [Landauer 1961], the minimum energy dissipated to erase one bit of information in an environment at temperature $T$ is $k_B T \ln 2$. A logically irreversible refresh of $C$ predictive bits therefore has Landauer-saturating dissipation

$$
E_{\min}(T,C)=k_B T (\ln 2)\,C.
$$

For an MPU undergoing proper acceleration $a$, the effective Unruh temperature contribution is (Equation N.4)

$$
T_U(a)=\frac{\hbar a}{2\pi c k_B}.
$$

Isolating the acceleration-dependent (Unruh-induced) increment by setting $T=T_U(a)$ gives

$$
E_{\text{pred}}^{\mathrm{sat}}(a,C)=k_B T_U(a) (\ln 2)\,C
=\frac{\hbar \ln 2}{2\pi c}\,a\,C,
$$

which is the stated formula. ∎

**Remark N.10.1: Conditional Dimensional Analogy to $E=mc^2$.**
Equation (N.14) contains $c^{-1}$ because the accepted Unruh-temperature formula contains $c^{-1}$. On the detector-response and Landauer-saturating active-refresh branch, this yields a motion–refresh coefficient involving $\hbar$, $\ln2$, and $c$. The resemblance to a relativistic energy relation is dimensional and branch-conditional: it does not establish mass–prediction equivalence, a second causal barrier, or a common microscopic origin for the SPAP and kinematic limits.

### N.10.2 The Prediction-Motion Coupling Coefficient

**Definition N.4 (Prediction-Motion Coupling Coefficient).**
On the detector-response and Landauer-saturating active-refresh branch, define the acceleration–refresh coefficient

$$
\boxed{\lambda_{PM} \equiv \frac{\hbar \varepsilon_0}{2\pi c} = \frac{\hbar \ln 2}{2\pi c} \approx 3.88 \times 10^{-44} \text{ kg·m}}
\tag{N.15}
$$

This coefficient collects constants already consumed by that conditional bridge:

- **Quantum input** ($\hbar$): the imported quantum action scale;
- **Structural information input** ($\varepsilon_0=\ln2$): the exact binary structural coefficient, which is not by itself a physical dissipation energy;
- **Relativistic input** ($c$): the invariant-speed constant already present in the accepted Unruh formula.

Their appearance in one coefficient establishes no independent causal or microscopic coupling law. On the stated saturation branch, Equation (N.14) can be written

$$
E_{\text{pred}}^{\text{sat}} = \lambda_{PM} \cdot a \cdot C.
\tag{N.16}
$$

**Remark N.10.2: Dimensional Analysis.**
The coefficient $\lambda_{PM}$ has dimensions
$$
[\lambda_{PM}]
=
\frac{[\text{Energy}\cdot\text{Time}]}{[\text{Length}/\text{Time}]}
=
[ML].
$$
Thus
$$
[E_{\text{pred}}^{\text{sat}}]
=
[ML]\,[LT^{-2}]
=
[ML^2T^{-2}],
$$
as required for the conditional saturation energy.

**Remark N.10.3: Relation to Fundamental Scales.**
Using $m_P=\sqrt{\hbar c/G}$, $L_P=\sqrt{\hbar G/c^3}$, and the identity $m_PL_P=\hbar/c$ gives

$$
\lambda_{PM}
=
\frac{\ln2}{2\pi}\frac{\hbar}{c}
=
\frac{\ln2}{2\pi}m_PL_P.
$$

This is an algebraic rewriting of the branch coefficient, not evidence for a new fundamental constant or an independently derived prediction–motion interaction.

### N.10.3 Unruh–Landauer Saturation Calibration

**Definition N.5 (Unruh–Landauer Saturation Coefficient).**
Let $c_\gamma:=c$ denote the invariant speed already appearing in the Lorentz and Unruh formulas. On the Landauer-saturating branch of Theorem N.3, define
$$
E_{\mathrm{pred}}^{\mathrm{sat}}(a,C)
:=
\frac{\hbar\varepsilon_0}{2\pi c}\,aC
$$
and extract the denominator constant
$$
c_\varepsilon^{\mathrm{sat}}
:=
\frac{\hbar\varepsilon_0 aC}{2\pi E_{\mathrm{pred}}^{\mathrm{sat}}(a,C)}.
$$
Then
$$
\boxed{c_\gamma=c_\varepsilon^{\mathrm{sat}}=c.}
\tag{N.17}
$$

Equation (N.17) is a calibration identity on the Unruh–Landauer saturation branch. It follows because the standard Unruh temperature already contains the invariant speed $c$; it does not independently derive $c$, a second speed limit, or the Lorentz causal structure from SPAP. For a nonsaturating implementation with actual acceleration-dependent dissipation $E_{\mathrm{pred}}\ge E_{\mathrm{pred}}^{\mathrm{sat}}$, the same inferred ratio obeys
$$
\frac{\hbar\varepsilon_0 aC}{2\pi E_{\mathrm{pred}}}\le c,
$$
with equality only at saturation. Merely satisfying the additive UCT work bound does not force equality.

**Interpretation:** $c_\gamma$ is the kinematic invariant speed. The symbol $c_\varepsilon^{\mathrm{sat}}$ is a convenient readout of the same already-present constant from one conditional cost formula, not an independently established epistemic barrier.

**Proposition N.10.3a (No Margolus-Levitin/Gamma Product Bound from N.17).** Equation (N.17) records a coefficient comparison $c_\gamma=c_\varepsilon^{\mathrm{sat}}$ on the Landauer-saturating Unruh branch; it is not an independent operational measurement of a second invariant speed. It does not identify the limiting operation $v \to c$ with saturation of the Margolus-Levitin orthogonalization bound, and it does not imply any universal lower bound of the form
$$
\frac{E_{\mathrm{ML}}}{m c^2}\,\frac{1}{\gamma} \ge \text{constant independent of }m.
$$
The frame-covariant quantum-speed-limit statement on the unitary internal branch remains Corollary 29.1: for proper internal cycle time $\tau_0$ and mean excitation energy $E_{\mathrm{ML}} := \langle \hat H-E_0\rangle$,
$$
E_{\mathrm{ML}}\tau_0 \ge \frac{\pi\hbar}{2}.
$$
If the same internal cycle is described in an inertial lab frame in which the system has Lorentz factor $\gamma$, then $\tau_{\mathrm{lab}}=\gamma\tau_0$, hence
$$
E_{\mathrm{ML}}\frac{\tau_{\mathrm{lab}}}{\gamma} \ge \frac{\pi\hbar}{2}.
$$
Equivalently, using $\hbar=m_Pc^2t_P$,
$$
\frac{E_{\mathrm{ML}}}{m c^2} \ge \frac{\pi}{2}\frac{m_P}{m}\frac{t_P}{\tau_0}.
$$
The factor $m_P/m$ is unavoidable when the speed-limit energy is normalized by $m c^2$, and no additional factor $1/\gamma$ suppresses the proper-time bound. Empirical content resides in the conditional Unruh–Landauer law and the frame-consistent UCT work ledger, not in the coefficient identity by itself. In particular, neither Equation (N.17) nor the Margolus–Levitin bound implies $c=\delta/\tau_{\min}$.

*Proof.* Equation (N.17) follows by comparing the coefficient in the saturating Unruh–Landauer formula with the same $c$ already present in the imported Unruh temperature. It contains neither the spacing $\delta$ nor the cycle time $\tau_{\min}$. It contains no statement about the state-dependent Hamiltonian quantity $E_{\mathrm{ML}}$, no orthogonality condition, and no condition that the Lorentz limit $v\to c$ be reached. Corollary 29.1 supplies the only Margolus-Levitin input used inside PU, namely $E_{\mathrm{ML}}\tau_0\ge\pi\hbar/2$ in the system's proper internal time. Lorentz time dilation changes the coordinate duration of that internal cycle by $\tau_{\mathrm{lab}}=\gamma\tau_0$ and leaves the proper-time inequality unchanged. Rearranging the proper-time inequality and substituting $\hbar=m_Pc^2t_P$ gives the displayed PU-unit form. A bound with $(E_{\mathrm{ML}}/mc^2)/\gamma$ and a positive right-hand side independent of $m$ would be frame-dependent and would tend to zero under boosts of the same massive system, while the proper-time speed limit is invariant. Hence such a product bound is not derivable from Theorem N.3, Definition N.5, Equation (N.17), or Corollary 29.1. ∎

### N.10.4 Physical Consequences

**Corollary N.3.1 (Conditional Laboratory Work Functional for Predictive Trajectories).**
Under the hypotheses of Theorem N.UCT and on the Landauer-saturating refresh branch of Theorem N.3, define the comoving incremental predictive power
$$
P_{\text{pred}}^{\mathrm{sat,com}}(\tau)
=
\frac{\lambda_{PM}a(\tau)C(\tau)}{\tau_{cycle}(\tau)}.
\tag{N.18a}
$$
Then the corresponding simplified laboratory work bound is
$$
W_{\text{tot}}^{\mathrm{lab}}
\ge
m_0c^2(\gamma_f-1)
+
\int_0^{\tau_f}\gamma(\tau)P_{\text{pred}}^{\mathrm{sat,com}}(\tau)\,d\tau.
\tag{N.18}
$$
Here $\tau_{cycle}$ is a proper cycle time, and $[P_{\text{pred}}^{\mathrm{sat,com}}]=[ML^2T^{-3}]$. Additional background, internal-noise, nonsaturating, anisotropic-export, or stored-energy contributions remain in the full N.5 ledger. Within a specified trajectory class and boundary conditions, minimizing the right-hand-side functional defines the conditional optimal-trajectory problem.

*Proof.* Theorem N.3 supplies the saturated comoving energy per refresh, and division by the proper cycle time gives (N.18a). The boost of an isotropic comoving energy increment contributes the factor $\gamma(\tau)$ proved in Section N.5. Adding the disjoint laboratory kinetic ledger gives (N.18). ∎

Within a specified trajectory class, and only when the registered UCT response and refresh branch is active, minimizing (N.18) can favor smoother proper-acceleration profiles over sharper ones. Whether the full PCE potential selects such a path depends on the remaining background, internal-noise, stored-energy, and boundary-condition entries in the complete ledger.

**Corollary N.3.2 (Conditional Comoving Predictive-Complexity Reduction Under Acceleration).**
Assume the detector-response, additive-temperature, active-refresh, and Landauer-saturating branch of Theorem N.3. Let a fixed comoving non-kinetic operational power budget $P_{\mathrm{avail}}^{\mathrm{com}}$ sustain baseline complexity $C_0$ through
$$
R(C_0)=P_{\mathrm{avail}}^{\mathrm{com}},
$$
where $R:[0,C_0]\to[0,P_{\mathrm{avail}}^{\mathrm{com}}]$ is continuously differentiable, $R(0)=0$, and $R'(C)>0$ on $[0,C_0]$. At constant proper acceleration $a\ge0$ and fixed proper cycle time $\tau_{cycle}$, define $C_a$ by
$$
R(C_a)+\frac{\lambda_{PM}aC_a}{\tau_{cycle}}
=P_{\mathrm{avail}}^{\mathrm{com}}.
\tag{N.19}
$$
Then $C_a\le C_0$, and implicit differentiation gives
$$
\frac{dC_a}{da}
=
-\frac{\lambda_{PM}C_a/\tau_{cycle}}
{R'(C_a)+\lambda_{PM}a/\tau_{cycle}}
\le0.
\tag{N.19a}
$$
Consequently, for small $a$,
$$
C_a-C_0
=
-\frac{P_{\mathrm{pred}}^{\mathrm{sat,com}}(a,C_0)}{R'(C_0)}
+o(a),
\qquad
P_{\mathrm{pred}}^{\mathrm{sat,com}}(a,C_0)
=
\frac{\lambda_{PM}aC_0}{\tau_{cycle}}.
\tag{N.19b}
$$

*Proof.* Strict monotonicity makes the left side of (N.19) strictly increasing in $C_a$ and no smaller than $R(C_a)$, proving existence/uniqueness on the admitted range and $C_a\le C_0$. Differentiating (N.19) proves (N.19a), and the first-order expansion at $a=0$ gives (N.19b). The $o(a)$ remainder follows from the stated continuous differentiability; an $O(a^2)$ remainder would require stronger regularity. The budget is entirely comoving and non-kinetic; laboratory endpoint kinetic work and the factor $\gamma$ enter separately through (N.18). Thus the contraction is conditional on proper acceleration and the retained response/refresh bridge, not on velocity alone. ∎

### N.10.5 Conceptual Summary

Relativistic motion and increasingly demanding prediction targets consume different resources. They can be compared in one work budget without treating them as the same physical limit.

**Technical ledger.**

The Unified Cost of Transgression places two distinct resource effects in one frame-consistent work ledger:

|Domain |Limit |Resource statement |Status |
|--------------|----------------------|-------------------------------------------------------------|---------------|
|**Kinematics**|$v \to c$ |$m_0c^2(\gamma-1)\to\infty$ |standard relativistic input |
|**Prediction target**|$\alpha_{\mathrm{tgt}}\uparrow\alpha_{\mathrm{SPAP}}$|$C_{\mathrm{uni}}(\delta)=\Omega\!\left(\log(1/\delta)/\delta^2\right)$ as $\delta\downarrow0$ under $\mathfrak C_{B.2}$ |transfers to $C_P$ only with the same-family bridge of Lemma N.2 |
|**Acceleration coupling**|$a\ne0$ |Unruh–Landauer incremental cost on the registered saturation/activation branch |conditional bridge |

Here $\delta=\alpha_{\mathrm{SPAP}}-\alpha_{\mathrm{tgt}}$. The shared laboratory work functional does not identify the two limiting operations. When the Unruh response and predictive-refresh bridge are active, acceleration adds a prediction-related term to the distinct kinetic and SPAP ledgers. Substitution of an observed $PP$ for the target requires the registered confidence event.

Equation (N.17) recovers the same $c$ from the saturated Unruh–Landauer formula because that formula imports $c$ through the standard Unruh temperature. It is a consistency calibration, not a derivation of Lorentz causality from SPAP. Theorem 46 supplies only the independent uniform operational speed upper bound. An attained normalized frontier $c=\delta/\tau_{\min}$ requires the separate uniform-weight one-link-attainment branch, and its Lorentzian invariant-speed interpretation requires Corollary 46a and the full Appendix O package.

The coefficient $\lambda_{PM}=\hbar\varepsilon_0/(2\pi c)$ is therefore a dimensional coefficient on a conditional bridge. Its small SI value alone does not establish an observable or microscopic MPU mechanism; an experiment also requires an activation fraction, refresh rate, detector response, background subtraction, and a non-double-counted energy ledger.

## N.11 Inertial Mass as Relational Information

Section N.3 supplied a conditional acceleration–refresh cost on its registered detector-response branch, while Section N.7 proposed—but did not derive—a relational interpretation of motion. The mass construction below is a separate conditional ledger governed by its own $\mathfrak B_{\mathrm{mass}}$ hypotheses. It does not follow from the UCT coefficient or establish a common microscopic origin for acceleration, prediction, and inertia.

### N.11.1 The Relational Ontology of "Being"

Appendix N studies a relational state ledger for a declared system--environment split. The ledger quantifies correlations across that split; it does not by definition exhaust every observable that distinguishes the system from a vacuum state. Operational vacuum equivalence requires a separate equality-of-response certificate on the retained observable algebra.

**Definition N.6 (Relational Information Content).** The relational information content $\mathcal I_{\mathrm{rel}}(S_{\mathrm{sys}})$ of a system $S_{\mathrm{sys}}$ is the quantum mutual information between $S_{\mathrm{sys}}$ and its environment $E_{\mathrm{env}}$:

$$
\mathcal I_{\mathrm{rel}}(S_{\mathrm{sys}}) := I(S_{\mathrm{sys}}:E_{\mathrm{env}}) = S_{\mathrm{vN}}(\rho_{S_{\mathrm{sys}}}) + S_{\mathrm{vN}}(\rho_{E_{\mathrm{env}}}) - S_{\mathrm{vN}}(\rho_{S_{\mathrm{sys}}E_{\mathrm{env}}})
\tag{N.20}
$$

measured in nats, where $S_{\mathrm{vN}}(\rho):=-\operatorname{Tr}(\rho\ln\rho)$ is the von Neumann entropy [von Neumann 1932] and $\rho_{S_{\mathrm{sys}}E_{\mathrm{env}}}$ is the joint state of the system/environment pair.

This definition connects directly to the interpretation of entanglement as predictive coupling (Proposition 10, Section 8.6): entangled states maximize mutual information $I(A:B)$ relative to individual entropies for given subsystem mixedness, with maximally entangled pure states achieving $I(A:B) = 2S_{\mathrm{vN}}(\rho_A)$. Quantum mutual information quantifies total correlation across the declared split. Calling that correlation predictive coupling is an interpretation; an operational anticipation claim additionally requires a specified prediction task, accessible observables, and a performance comparison.

**Proposition N.4 (Certified Boundary Decomposition of Relational Information).** Definition N.6 fixes $\mathcal I_{\mathrm{rel}}=I(S:E)$ as a state quantity. A boundary relational-normalization certificate is a finite record
$$
\mathfrak C_{\partial}
=
\left(
\{(S_i,E_i,\rho_i,I_i,C_i^{\mathrm{rel}},q_i)\}_{i=1}^{N_{\partial}},
\mathfrak A_{\partial},
\mathfrak O_{\partial}
\right),
$$
where $\mathfrak A_{\partial}$ is one of the following typed additivity records:

1. an exact factorization
   $$
   \rho_{SE}=\bigotimes_{i=1}^{N_{\partial}}\rho_{S_iE_i},
   \qquad I_i:=I(S_i:E_i)_{\rho_i};
   $$
2. an ordered environment decomposition $E=E_1\cdots E_{N_{\partial}}$ with
   $$
   I_i:=I(S:E_i\mid E_{<i})_\rho,
   \qquad
   I(S:E)_\rho=\sum_i I_i,
   $$
   verified by the quantum mutual-information chain rule.

The record $\mathfrak O_{\partial}$ proves source exhaustion and absence of double counting. Each $C_i^{\mathrm{rel}}>0$ is a registered relational normalization budget satisfying
$$
I_i\ge0,
\qquad I_i\le C_i^{\mathrm{rel}}<\infty,
\qquad
q_i:=\frac{I_i}{C_i^{\mathrm{rel}}}\in[0,1].
$$
Calling $C_i^{\mathrm{rel}}$ an operational capacity additionally requires a declared admissible class $\mathcal A_i$, a proof that
$$
C_i^{\mathrm{rel}}=\sup_{x\in\mathcal A_i}I_i(x),
$$
and either an attaining witness or an explicit approximation sequence with certified error. Without that record it is a normalization budget, and $C_i^{\mathrm{rel}}=2\varepsilon_0$ is a calibration rather than a capacity theorem.

Acceptance requires exact spectral identities proving
$$
\boxed{
\mathcal I_{\mathrm{rel}}
=\sum_{i=1}^{N_{\partial}}I_i
=\sum_{i=1}^{N_{\partial}}q_iC_i^{\mathrm{rel}}.
}
\tag{N.21}
$$
or interval-certified evaluations with declared residual bounds; on the interval route every displayed equality is replaced by, and propagated as, a two-sided error bound.
On the common-value branch $C_i^{\mathrm{rel}}=C_*^{\mathrm{rel}}$ and $q_i=q$, Equation (N.21) becomes
$$
\mathcal I_{\mathrm{rel}}=qN_{\partial}C_*^{\mathrm{rel}}.
$$
The saturated relational-boundary branch is the additional condition $q=1$.

The budgets $C_i^{\mathrm{rel}}$ are registered relational-cut normalizations, not the unassisted HSW capacities of Theorem E.2. If an operational-capacity route identifies them with entanglement-assisted capacities or finite-window cut-set bounds, the channel ensemble, assistance, admissible class, number of uses, coding error, upper-bound proof, and attainment or approximation convention are entries of $\mathfrak C_{\partial}$. No such identification follows from quantum mutual information alone.

*Proof.* Product-state additivity proves the first route. The quantum chain rule proves the second route, and strong subadditivity gives $I_i\ge0$. The source-exhaustion audit prevents a term from appearing twice. The definitions $I_i=q_iC_i^{\mathrm{rel}}$ give the second equality in (N.21), and common $C_i^{\mathrm{rel}}$ and $q_i$ give the specialization. This is a finite certificate theorem, not a PCE saturation theorem. Indeed, a maximally entangled $d\times d$ pure state has $I(S:E)=2\ln d$, while the unassisted classical capacity of the noiseless $d$-level identity channel is $\ln d$. Therefore the former cannot generally be bounded or decomposed by the latter. ∎


### N.11.2 Open-System Thermodynamics and the KMS Condition

The modular KMS identity of Theorem G.1.9.5 is a representation statement and does not by itself imply physical processing or a nonzero exchange rate. A physical steady-state exchange claim requires a separately registered open-system activity record.

**Theorem N.4 (Activity-Conditioned Steady-State Exchange Bound).** Assume a registered active boundary channel on which completed exchange cycles are serialized, so distinct cycles on that channel do not overlap in physical time, and whose physical-time certificate states that every completed cycle has duration at least $\tau_{\min}>0$. Let $N(T)$ count cycles wholly completed in $[0,T]$ and define
$$
r_e:=\limsup_{T\to\infty}\frac{N(T)}T.
$$
Then
$$
0\le r_e\le\frac1{\tau_{\min}}.
$$
Equality holds only on a separately registered saturated-activity branch; relational information, modular KMS status, detailed balance, and Theorem 29 alone prove neither the duration premise, positive activity, nor saturation.

*Proof.* On a faithful active-support state $\rho_a$, Theorem G.1.9.5 supplies the modular representation
$$
\sigma_t^{\rho_a}(A)=\rho_a^{it}A\rho_a^{-it}.
\tag{N.22}
$$
This identity supplies no physical clock. On the separate Equation-Q.18 and saturated-Proposition-Q.6.1 calibration branch one may register
$$
\tau_{\min}=\sqrt{8\ln2}\,t_P,
\tag{N.23}
$$
but only after accepting its response-active physical-time bridge. The serialized duration certificate gives $N(T)\tau_{\min}\le T$. Taking the declared limsup yields $r_e\le1/\tau_{\min}$; equality is precisely the additional saturated-activity condition. ∎

**Remark N.4.1: Open vs. Closed Systems.** An active open-system exchange is compatible with the second law only after the environment and all reset records are included in one entropy ledger. Theorem N.4 permits $r_e=0$ and asserts no entropy or heat flow merely from modular flow.

**Corollary N.4.1 (Boundary Update-Ledger Rate on the Certified Concurrent Branch).** Let an accepted $\mathfrak C_{\partial}$ have channels $i=1,\ldots,N_{\partial}$. For each channel, fix before comparison a completed-cycle structural increment $\varepsilon_i\ge0$, a duration $\tau_i>0$, and individual saturated activity $r_i=1/\tau_i$. Assume a concurrency certificate proving that these channel cycles can run simultaneously and that no shared server, clock, energy supply, or serialization bottleneck reduces the sum. Assume also an additive, source-exhaustive structural-update ledger proving that concurrent increments have no interaction or double-counted term. Then the structural boundary update rate is
$$
\boxed{
\dot\varepsilon_{\partial}
=\sum_{i=1}^{N_{\partial}}\frac{\varepsilon_i}{\tau_i}.
}
\tag{N.24}
$$
On the common-value branch
$$
\varepsilon_i=\varepsilon_0,
\qquad
\tau_i=\tau_{\min},
\qquad
C_i^{\mathrm{rel}}=C_*^{\mathrm{rel}},
\qquad
q_i=q\in(0,1],
$$
Proposition N.4 gives
$$
\dot\varepsilon_{\partial}
=\frac{\varepsilon_0N_{\partial}}{\tau_{\min}}
=\frac{\varepsilon_0\mathcal I_{\mathrm{rel}}}
{qC_*^{\mathrm{rel}}\tau_{\min}}.
$$
If an independent relational-normalization calibration verifies
$$
C_*^{\mathrm{rel}}=2\varepsilon_0,
$$
then
$$
\boxed{
\dot\varepsilon_{\partial}
=\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}.
}
\tag{N.25}
$$
The canonical saturated-boundary value is the specialization $q=1$. Boundary utilization does not prove $C_*^{\mathrm{rel}}=2\ln2$, and single-channel saturation does not prove concurrency.

Equation (N.24) is a structural update ledger. It becomes a physical entropy-production or heat ledger only on a further same-cycle identification certificate: every cycle is a registered reset with reset distribution $p_i$ and fixed $H_{p_i}(P_i\mid R_i)=\varepsilon_i$, the entropy source is exhaustive, and any heat statement carries its declared implementation and temperature. The reset law $p_i$ is distinct from the utilization coordinate $q_i$ unless a typed bridge proves otherwise. A conditionally uniform binary reset with no retained side information supplies $H_{p_i}(P_i\mid R_i)=\ln2$; the structural equality $\varepsilon_0=\ln2$ alone does not.

*Proof.* Individual saturated activity contributes $\varepsilon_ir_i=\varepsilon_i/\tau_i$. The concurrency and additive source-exhaustion certificates make the total the sum, proving (N.24). The common-value specialization, $q>0$, and Equation (N.21) give the second display. Substitution of $C_*^{\mathrm{rel}}=2\varepsilon_0$ gives (N.25). Every physical entropy or heat statement then follows only from the additional same-cycle reset and implementation records just listed. ∎

**Corollary N.4.2 (Certified Off-Reference Boundary-Rate Residual Decomposition).** Work on the common-value, concurrent, saturated-activity, relational-normalization-calibrated branch of Corollary N.4.1, so $q\in(0,1]$ and $\mathcal I_{\mathrm{rel}}>0$. Suppose a source-exhaustive rate certificate fixes nonnegative, same-unit entries $\sigma_{\mathrm{KMS}}$ and $\sigma_{\mathrm{oh}}$ and proves
$$
\dot\varepsilon_{\mathrm{pred}}
=\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}
+\sigma_{\mathrm{KMS}}+\sigma_{\mathrm{oh}}.
$$
Define the algebraic $q=1$ benchmark
$$
\mathcal R_N
:=
\dot\varepsilon_{\mathrm{pred}}
-\frac{\mathcal I_{\mathrm{rel}}}{2\tau_{\min}},
\tag{N.25a}
$$
and
$$
\Delta_q
:=
\frac{\mathcal I_{\mathrm{rel}}}{2\tau_{\min}}
\left(\frac1q-1\right).
\tag{N.25b}
$$
Then
$$
\boxed{
\mathcal R_N
=\Delta_q+\sigma_{\mathrm{KMS}}+\sigma_{\mathrm{oh}}
\ge0.
}
\tag{N.25c}
$$
Equality holds exactly when $q=1$ and both certified excess entries vanish. Interpreting the benchmark as a realizable comparison additionally requires a matched feasible $q=1$ witness with the same declared quantities; the sign identity itself is algebraic.

*Proof.* Subtract the $q=1$ reference rate from the source-exhaustive identity. Since $0<q\le1$, $\Delta_q\ge0$; the other two terms are nonnegative certificate entries. No sign conclusion is available for an unsaturated, bottlenecked, or source-incomplete branch. ∎

**Remark N.4.2.1 (Operational Signature).** The decomposition (N.25c) is independently testable by measuring the per-channel rates and auditing the named sources. A KMS representation alone neither defines $\sigma_{\mathrm{KMS}}$ nor makes it nonnegative in this ledger.


### N.11.3 Mass--Action Calibration from a Certified Relational Boundary Ledger

**Theorem N.5 (Mass--Action Calibration from a Certified Relational Boundary Ledger).** Let $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$ consist of:

1. an accepted common-value boundary certificate $\mathfrak C_{\partial}$ with $q_i=q\in(0,1]$;
2. the individual saturated-activity and concurrency certificate of Corollary N.4.1;
3. the independently verified calibration $C_*^{\mathrm{rel}}=2\varepsilon_0$; and
4. an accepted action/update identification for the same cycles,
   $$
   \left|\frac{d\mathcal S_{\mathrm{action}}}{d\tau}\right|
   =\hbar\dot\varepsilon_{\partial},
   $$
   obtained from Corollary Q.0.1 only after $\kappa_A=\hbar$, the recovery sequence, normalization, and source-overlap map are fixed.
5. stationarity of $\mathcal I_{\mathrm{rel}},q,C_*^{\mathrm{rel}},\tau_{\min}$ and the action coefficient over the proper-time interval used below; without stationarity the formulas are pointwise and must be integrated.

Then the coefficient of the rest-action ledger is
$$
\boxed{
m
=\frac{\hbar\mathcal I_{\mathrm{rel}}}
{2q c^2\tau_{\min}}.
}
\tag{N.26}
$$
Let $\mathfrak B_{\mathrm{mass}}(q)$ additionally include the Equation-Q.18/Proposition-Q.6.1 clock and spacing calibration
$$
\tau_{\min}=\sqrt{8\varepsilon_0}\,t_P,
\qquad
\delta=\sqrt{8\varepsilon_0}\,L_P.
$$
On that extended branch,
$$
m
=\frac{\mathcal I_{\mathrm{rel}}}{2q\sqrt{8\varepsilon_0}}m_P
=\frac{\mathcal I_{\mathrm{rel}}}{2q}\frac{L_P}{\delta}m_P.
$$
The canonical symbol $\mathfrak B_{\mathrm{mass}}$ denotes $\mathfrak B_{\mathrm{mass}}(1)$. With $\varepsilon_0=\ln2$, its coefficient is $0.212\ldots\,m_P$ per certified relational nat.

*Proof.* Corollary N.4.1 gives
$$
\dot\varepsilon_{\partial}
=\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}.
\tag{N.27}
$$
For the relativistic rest-action magnitude,
$$
|\mathcal S_{\mathrm{rest}}|=mc^2\tau.
\tag{N.28}
$$
Stationarity and the accepted action/update identification for the same source-exhaustive cycles give, over proper time $\tau$,
$$
\frac{|\mathcal S_{\mathrm{rest}}|}{\hbar}
=\dot\varepsilon_{\partial}\tau
=\frac{\mathcal I_{\mathrm{rel}}\tau}{2q\tau_{\min}}.
\tag{N.29}
$$
Canceling $\tau$ proves
$$
m=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2q c^2\tau_{\min}}.
\tag{N.30}
$$
Only on $\mathfrak B_{\mathrm{mass}}(q)$ may one substitute $\tau_{\min}=\sqrt{8\varepsilon_0}\,t_P$ and $m_Pc^2=\hbar/t_P$. With $\varepsilon_0=\ln2$,
$$
\frac1{2\sqrt{8\ln2}}=0.212330450\ldots,
\tag{N.31}
$$
which proves the calibrated specialization. ∎

**Remark N.5.1 (Branch Dependence and Interaction with Leech Norm--Information Calibration).** The base rate formula belongs to $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$; the Planck coefficient additionally requires $\mathfrak B_{\mathrm{mass}}(q)$; and the canonical absolute coefficient uses $q=1$. Define $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$ as $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$ plus the same-cycle reset law $p_i$, conditional-entropy/source-exhaustion record, equilibrium temperature, and Landauer implementation data. This branch proves Corollary N.5.2's heat inequality; exact heat equality requires the further same-rate reversible-limit convergence and compatibility certificate stated there. A separate Leech certificate may supply $\mathcal I_{\mathrm{rel}}(v)=\gamma|v|$. Absolute Leech masses require $\mathfrak B_{\mathrm{mass}}(q)$ and fixed $\gamma/q$; root geometry alone fixes only dimensionless norm ratios.

**Corollary N.5.1 (Rest Energy as Certified Relational Action Rate).** On $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$,
$$
E=mc^2
=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}.
\tag{N.32}
$$
On $\mathfrak B_{\mathrm{mass}}(q)$ this becomes
$$
E=\frac{\mathcal I_{\mathrm{rel}}}{2q\sqrt{8\varepsilon_0}}E_P.
$$

*Proof.* Multiply (N.26) by $c^2$. The Planck form uses the additional clock calibration and $E_P=\hbar/t_P$. ∎

**Remark N.5.1a (Energy as Proper-Time Action Rate).** Equation (N.32) has units of energy because it is action per proper time. It is not a power law. Without $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$ it is also not a heat or entropy-production statement.

**Corollary N.5.2 (Mass-Branch Action--Entropy--Heat Rate Ledger).** On $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$, let every certified update cycle be the same registered reset used in the physical entropy ledger, with reset law $p_i$ and $H_{p_i}(P_i\mid R_i)=\varepsilon_i$. For every physical implementation at $T_{\mathrm{eff}}$, conditional Landauer gives
$$
\boxed{
\mathcal E_{\mathrm{act}}
:=\left|\frac{d\mathcal S_{\mathrm{action}}}{d\tau}\right|
=\hbar\dot\varepsilon_{\partial}
=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}
=mc^2.
}
\tag{N.32a}
$$
and
$$
\boxed{
\dot\varepsilon_{\partial}
=\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}},
\qquad
\dot Q
\ge k_BT_{\mathrm{eff}}
\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}.
}
\tag{N.32b}
$$

Equality in the heat bound is an ideal reversible-limit statement. It may be written as an exact equality only if a protocol family is supplied for which the same-cycle rates converge to the displayed value, all overhead terms converge to zero, and the $\tau_{\min}$ activity/concurrency record remains compatible with that limit.

*Proof.* The action/update identity, same-cycle entropy identification, Corollary N.4.1, and Theorem N.5 refer to one source-exhaustive cycle family and give (N.32a). Conditional Landauer gives $\dot Q\ge k_BT_{\mathrm{eff}}\dot\varepsilon_{\partial}$, proving (N.32b). Reversible limiting equality requires precisely the additional convergence and compatibility record stated above. ∎

**Remark N.5.2a (Off-Branch Rate Residual).** Corollary N.4.2 supplies a nonnegative residual only on its source-exhaustive concurrent saturated-activity and relational-normalization certificate. Unsaturated activity, a shared bottleneck, or a ledger-identification failure has no unconditional residual sign.



### N.11.4 Conditional Mechanical Realization of Relational Inertia

**Theorem N.6 (Inertia as Relational Update Resistance).** On $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$, assume a mechanical-realization certificate $\mathfrak C_{\mathrm{mech}}$ that (i) maps changes of the declared relational pattern $\mathcal P(S)=\{\rho_{S,E_i}\}$ to the source-exhaustive cycles of $\mathfrak C_{\partial}$ and (ii) verifies that the coefficient $m$ of Equation (N.26) is the coefficient in the retained worldline momentum/acceleration response. Then the inertial coefficient is proportional to the certified relational information.

On the stronger $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$ and Landauer--Unruh detector-response branch, let $q_{\mathrm{act}}\in[0,1]$ be an independently registered active-cycle fraction. The Landauer lower-bound scale is
$$
P_{\mathrm{UCT}}^{\mathrm{LB}}(a)
:=q_{\mathrm{act}}k_BT_U\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}
=q_{\mathrm{act}}\frac{c}{2\pi}ma.
$$
Every physical implementation on that branch satisfies $\dot Q_{\mathrm{act}}\ge P_{\mathrm{UCT}}^{\mathrm{LB}}(a)$. The equality
$$
P_{\mathrm{UCT}}(a)=q_{\mathrm{act}}\frac{c}{2\pi}ma
$$
is available only on an additional same-rate reversible-limit certificate satisfying the equality and compatibility clause of Corollary N.5.2. These are compatibility statements, not independent derivations of $\mathfrak C_{\mathrm{mech}}$, the mechanical inertial coefficient, or a force law.

*Proof.* The mechanical-realization certificate identifies the retained response coefficient with the rest-action coefficient, and Theorem N.5 gives
$$
m=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2qc^2\tau_{\min}}.
$$
On the thermodynamic branch, Corollary N.5.2 and $k_BT_U=\hbar a/(2\pi c)$ give
$$
\dot Q_{\mathrm{act}}
\ge q_{\mathrm{act}}k_BT_U\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}
=q_{\mathrm{act}}\frac{\hbar a}{2\pi c}\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}
=q_{\mathrm{act}}\frac{c}{2\pi}ma.
$$
Equality is exactly the additional reversible-limit overlap condition. The final expression substitutes the already accepted mass coefficient and therefore proves compatibility only. ∎

**Remark N.11.1: Scope of the Machian Interpretation.** Quantum mutual information satisfies $\mathcal I_{\mathrm{rel}}=0$ exactly when the state is a product across the declared split. On $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$, Equation (N.26) then assigns zero to this particular relational mass coefficient. It does not follow that the system is vacuum, that every retained observable vanishes, or that no other mass/source ledger is present. Operational indistinguishability from a specified vacuum requires a separate certificate proving equality of all retained response functionals. Thus the Machian reading is a branch interpretation of the certified relational contribution, not an unconditional ontology theorem.

### N.11.5 The Weak Equivalence Principle

**Theorem N.7 (Weak Equivalence Principle from a Common Ledger on $\mathfrak B_{mass}$).** Let a tested class of simple probes lie on canonical $\mathfrak B_{mass}$, and define its positive certified mass--action ledger
$$
L(P):=\frac{\mathcal I_{\mathrm{rel}}(P)}{2\sqrt{8\varepsilon_0}}m_P>0.
$$
Assume independently verified realization maps
$$
m_I(P)=\beta_I L(P),
\qquad
m_G(P)=\beta_G L(P),
\qquad \beta_I,\beta_G>0,
$$
with probe-independent coefficients, a common operational metric, and source exhaustion/no double counting. Then $m_G(P)/m_I(P)=\beta_G/\beta_I$ for every probe. If one independently calibrated reference probe $P_*$ satisfies $m_G(P_*)=m_I(P_*)$, then
$$
m_G(P)=m_I(P)
$$
for every probe in the class. Simplicity alone establishes none of these bridge premises.

*Proof.* Division is legitimate because $L,\beta_I,\beta_G>0$ and gives the probe-independent ratio $\beta_G/\beta_I$. Reference equality forces $\beta_G/\beta_I=1$, which then holds for the full tested class. No entropy or heat interpretation is used; that stronger reading requires $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(1)$. ∎

**Corollary N.7.1 (Universality of Free Fall on the Common-Ledger and Weak-Field Response Branch).** Let bodies satisfy Theorem N.7 and, on the same operational metric, an independently accepted weak-field test-body response law
$$
F=m_Gg,
\qquad
a=F/m_I,
$$
with negligible self-force and backreaction on the declared approximation domain. Then every such body has $a=g$.

*Proof.* Theorem N.7 gives $m_G/m_I=1$ after its reference calibration. Substitution in the registered response law gives $a=(m_G/m_I)g=g$. ∎

The conclusion is a branch theorem, not an empirical derivation. Testing the branch requires propagating the retained source and response maps into a signed composition-dependent Eötvös parameter and comparing that output with the cited equivalence-principle measurements; equality of the abstract coefficients alone supplies no experimental likelihood.


### N.11.5a Universal Certified Mass Ledgers and Typed Response Separation

Theorem N.7 establishes $m_I=m_G$ for simple systems only on the common $\mathfrak B_{mass}$ source/response ledger and its independently calibrated reference equality; simplicity alone is insufficient.



### N.11.5a.1 The Data Processing Inequality

**Definition N.11.1 (Distinguishability Monotone).** A distinguishability monotone $\mathcal{M}$ is a function on pairs of quantum states satisfying:

$$
\mathcal{M}(\mathcal{E}(\rho), \mathcal{E}(\sigma)) \leq \mathcal{M}(\rho, \sigma)
$$

for all CPTP maps $\mathcal{E}$ and all density operators $\rho, \sigma$. Examples include the trace distance $D_{tr}(\rho, \sigma) = \frac{1}{2}\|\rho - \sigma\|_1$, the relative entropy $S(\rho \| \sigma) = \mathrm{tr}(\rho \ln \rho - \rho \ln \sigma)$ when $\text{supp}(\rho) \subseteq \text{supp}(\sigma)$, quantum fidelity-derived measures [Uhlmann 1976; Jozsa 1994], and generalized relative entropy monotones [Petz 1986; Ruskai 1994].

**Theorem N.10 (ND-RID Data Processing and Refresh-Branch Contractivity).** On the Hilbert/instrument branch, assume that the averaged ND-RID `Evolve` update $\mathcal E_N$ is represented by a CPTP map and therefore satisfies the data processing inequality with non-expansive trace-distance factor $0\le f_{RID}\le1$. On refresh/minorization branches satisfying Lemma E.1 it is strictly contractive:

$$
D_{tr}(\mathcal{E}_N(\rho), \mathcal{E}_N(\sigma)) \leq f_{RID} \cdot D_{tr}(\rho, \sigma)
\tag{N.33}
$$

where $0 \leq f_{RID} < 1$ is the refresh-branch contractivity factor established in Lemma E.1. Without the refresh/minorization hypothesis, CPTP data processing still gives the non-expansive bound with $0\le f_{RID}\le1$, while Proposition E.2a supplies the completed reset-support capacity deficit.

*Proof.* By Lemma E.1, the averaged ND-RID 'Evolve' channel contains a nonzero input-independent refresh component, so it admits a decomposition
$$
\mathcal{E}_N=(1-p)\Psi+pT_{\sigma_{reset}},
\qquad p\in(0,1],
\qquad T_{\sigma_{reset}}(\rho)=\mathrm{Tr}(\rho)\sigma_{reset}.
$$
For $\Delta:=\rho-\sigma$ we have $\mathrm{Tr}(\Delta)=0$, hence $T_{\sigma_{reset}}(\Delta)=0$ and
$$
\mathcal{E}_N(\Delta)=(1-p)\Psi(\Delta).
$$
Since $\Psi$ is CPTP, it contracts trace distance, implying $\|\Psi(\Delta)\|_1\le \|\Delta\|_1$. Therefore
$$
D_{tr}(\mathcal{E}_N(\rho),\mathcal{E}_N(\sigma))
=\tfrac12\|\mathcal{E}_N(\Delta)\|_1
\le (1-p)\tfrac12\|\Delta\|_1
=(1-p)\,D_{tr}(\rho,\sigma),
$$
so (N.33) holds with $f_{RID}=1-p<1$. ∎

**Corollary N.10.1 (Relative Entropy Contractivity).** The ND-RID channel satisfies:

$$
S(\mathcal{E}_N(\rho) \| \mathcal{E}_N(\sigma)) \leq S(\rho \| \sigma).
\tag{N.34}
$$

If $\mathcal{E}_N$ has a nonzero refresh component $\mathcal{E}_N=(1-p)\Psi+pT_{\sigma_{reset}}$ with $p>0$ (Lemma E.1), then for all pairs with $S(\rho\|\sigma)<\infty$ one has the quantitative bound
$$
S(\mathcal{E}_N(\rho) \| \mathcal{E}_N(\sigma)) \le (1-p)\,S(\rho \| \sigma),
$$
hence strict inequality for all $\rho\neq\sigma$ with finite relative entropy.

*Proof.* The first inequality is the quantum data processing inequality for relative entropy [Lindblad 1975].

For the quantitative contraction, define the flagged channel
$$
\widetilde{\mathcal{E}}_N(\rho)=(1-p)\,\Psi(\rho)\otimes|0\rangle\langle0|+p\,\sigma_{reset}\otimes|1\rangle\langle1|.
$$
Tracing out the flag yields $\mathcal{E}_N=\mathrm{Tr}_F\circ \widetilde{\mathcal{E}}_N$, so by data processing,
$$
S(\mathcal{E}_N(\rho)\|\mathcal{E}_N(\sigma)) \le S(\widetilde{\mathcal{E}}_N(\rho)\|\widetilde{\mathcal{E}}_N(\sigma)).
$$
Since the flag distribution is input-independent, the relative entropy of the flagged outputs decomposes as
$$
S(\widetilde{\mathcal{E}}_N(\rho)\|\widetilde{\mathcal{E}}_N(\sigma))=(1-p)\,S(\Psi(\rho)\|\Psi(\sigma)).
$$
Applying data processing to $\Psi$ gives $S(\Psi(\rho)\|\Psi(\sigma))\le S(\rho\|\sigma)$, hence
$$
S(\mathcal{E}_N(\rho)\|\mathcal{E}_N(\sigma)) \le (1-p)\,S(\rho\|\sigma),
$$
which is strict whenever $p>0$ and $S(\rho\|\sigma)\in(0,\infty)$. ∎

**Proposition N.11.5a.1a (Quantum-State Contractivity Budget for Equivalence Tests).** Let $r$ label a matter sector or internal quantum preparation branch, and suppose its ND-RID channel satisfies
$$
D_{tr}(\mathcal E_r(\rho),\mathcal E_r(\sigma))
\le
f_rD_{tr}(\rho,\sigma),
\qquad
0\le f_r<1,
$$
for all density operators $\rho,\sigma$. For $D_{tr}(\rho,\sigma)>0$, define the realized distinguishability contraction ratio
$$
\mathfrak d_r(\rho,\sigma)
:=
\frac{D_{tr}(\mathcal E_r(\rho),\mathcal E_r(\sigma))}
{D_{tr}(\rho,\sigma)}.
$$
Then
$$
0\le\mathfrak d_r(\rho,\sigma)\le f_r.
$$
For two sectors $r,s$, the maximal DPI budgets differ by
$$
\left|
f_rD_{tr}(\rho,\sigma)-f_sD_{tr}(\rho,\sigma)
\right|
=
|f_r-f_s|D_{tr}(\rho,\sigma).
$$
Consequently, if $f_r=f_s$ for all matter sectors at the same coarse-graining scale, their certified worst-case DPI budgets coincide. This equality does not imply
$$
\mathfrak d_r(\rho,\sigma)=\mathfrak d_s(\rho,\sigma)
$$
for a particular state pair, nor does it identify the channels. Exclusion of a DPI-mediated equivalence-principle deviation requires equality of the realized contraction ratios on the registered probe class, or a stronger channel-level universality certificate. Sector-dependent values of $f_r$ are sufficient evidence of nonuniversal budgets but are not necessary for sector-dependent realized contraction.

*Proof.* The first inequality is the assumed trace-distance contractivity divided by the positive number $D_{tr}(\rho,\sigma)$. Nonnegativity follows from nonnegativity of trace distance. The budget-difference identity is algebraic:
$$
|f_rD-f_sD|=|f_r-f_s|D,
\qquad
D:=D_{tr}(\rho,\sigma).
$$
The density-operator domain includes pure states, mixed states, coherent superpositions, and reduced states of entangled systems, so the same bound applies to all such internal preparations. If all sectors share the same value $f$, the DPI contraction budget is universal and cannot distinguish matter composition or internal quantum preparation. These conclusions concern DPI budgets only. They enter Theorem N.11's converse only after a typed overlap map sends $f_r$ into $\beta_I$, $\beta_G$, or the common metric and the non-compensation audit applies. ∎

### N.11.5a.2 Retained-Ledger Equivalence and Refresh-Branch DPI

Equivalence-principle behavior is a common-source/common-response statement. The relational boundary coefficient used by Theorem N.5, the unassisted communication capacity of Theorem E.2, and a refresh contraction factor are distinct typed data unless an explicit overlap certificate relates them.

**Definition N.11.0 (Retained Typed Coupling Ledger).** For a simple matter sector at a fixed coarse-graining scale, define
$$
\lambda(\mathfrak S_{\mathrm{mat}})
=
\bigl(
C_*^{\mathrm{rel}},q,\tau_{\min},\lambda_A,
T_{\mu\nu}^{(\mathrm{src})},
C_{\mathrm{HSW}},f_{\mathrm{RID}},\mathfrak O_N
\bigr),
$$
where $C_*^{\mathrm{rel}},q,\tau_{\min}$ are the boundary-decomposition and activity entries of Proposition N.4 and Corollary N.4.1, $\lambda_A$ is the action-per-structural-update coefficient in units of $\hbar$, $T_{\mu\nu}^{(\mathrm{src})}$ is the retained gravitational source map, $C_{\mathrm{HSW}}$ and $f_{\mathrm{RID}}$ are optional communication/refresh entries, and $\mathfrak O_N$ is the type and no-double-counting audit. Entrywise equality of response-active entries is a sufficient certificate; response universality itself means constancy of $\Xi_{\mathcal R}$ on a common metric and permits registered common rescalings as in Definitions N.11.0a--b. No definition identifies $C_*^{\mathrm{rel}}$ with $C_{\mathrm{HSW}}$.

**Definition N.11.0a (Retained Response Ledger and Equivalence Ratio).** For a retained response channel $\mathcal R$ and probe $P$, let $I_{\mathcal R}(P)>0$ be the response coefficient and $Q_{\mathcal R}(P)$ the source coefficient in the first nonzero finite response. Define
$$
\Xi_{\mathcal R}(P):=\frac{Q_{\mathcal R}(P)}{I_{\mathcal R}(P)}.
$$
The channel is equivalence-principle-bearing on a probe class exactly when $\Xi_{\mathcal R}$ is constant after the PPI quotient. It is sector-selective when a retained label changes this ratio.

**Definition N.11.0b (Metric-Universal Ledger).** A response channel is metric-universal on a probe class when every retained probe reconstructs the same operational metric, and there is one scalar ledger $L(P)$ with probe-independent nonzero coefficients $\alpha_{\mathcal R},\beta_{\mathcal R}$ such that
$$
Q_{\mathcal R}(P)=\alpha_{\mathcal R}L(P),
\qquad
I_{\mathcal R}(P)=\beta_{\mathcal R}L(P),
$$
while every proposed species-dependent response is either PPI-null or assigned to a separate certificate. On the gravitational branch, $L(P)$ is the certified mass--action ledger of Theorem N.5, not an unassisted channel-capacity ledger.

The **non-compensation branch** is the subbranch on which the induced map from retained ledger records modulo PPI-null changes and common rescalings to $\Xi_{\mathcal R}$ is injective on the tested class. Equivalently, two accepted records with equal $\Xi_{\mathcal R}$ may differ only by a PPI-null entry or a registered common rescaling. This is a finite injectivity test on the declared probe family, not a verbal assumption that cancellations are absent.

**Theorem N.11a (Equivalence--Constitutive Separation Law).** On a fixed branch and coarse-graining scale:

1. metric universality implies equivalence-principle behavior;
2. a retained label that changes $\Xi_{\mathcal R}$ on the non-compensation branch excludes equivalence-principle behavior on the full probe class; and
3. conversely, on the non-compensation branch, equivalence-principle behavior forces every retained variation to be common, PPI-null, or restricted to a constant-ratio subprobe class.

*Proof.* Metric universality gives $\Xi_{\mathcal R}=\alpha_{\mathcal R}/\beta_{\mathcal R}$, independent of the probe. If a retained label changes the ratio, two probes have different responses to the same non-null drive. On the non-compensation branch this difference cannot be canceled. Conversely, constant response for all tested probes forces $Q_{\mathcal R}/I_{\mathcal R}$ to be constant after quotienting. ∎

**Corollary N.11a.1 (Gravity/Gauge/Constitutive Classification).** A gravitational branch is equivalence-principle-bearing only when its metric, inertial coefficient, and stress-source maps satisfy Definition N.11.0b. Gauge and constitutive channels are generally sector-selective; they obey an equivalence principle only on subprobe classes with constant retained source-to-response ratio.

*Proof.* Apply Theorem N.11a to the gravitational, gauge, and constitutive response ratios. A common word such as *emergent* supplies none of the required equalities. ∎

**Remark N.11a.2 (Emergence Is Not the Equivalence Criterion).** The operative distinction is metric-universal/common-ledger versus sector-selective/constitutive-ledger, not emergent versus fundamental.

**Theorem N.11 (Equivalence Principle from a Universal Certified Mass Ledger on $\mathfrak B_{\mathrm{mass}}$; Converse on the Non-Compensation Branch).** Let a tested probe class lie on canonical $\mathfrak B_{\mathrm{mass}}$, with positive certified mass--action ledger $L(P)>0$. Suppose independently checkable mechanical and gravitational realization maps satisfy
$$
m_I(P)=\beta_I L(P),
\qquad
m_G(P)=\beta_G L(P),
\qquad \beta_I,\beta_G>0,
$$
where $\beta_I,\beta_G$ are probe-independent, the operational metric is common, and the source audit is exhaustive and has no double counting. Then
$$
\frac{m_G(P)}{m_I(P)}=\frac{\beta_G}{\beta_I}
$$
for every probe, so the source-to-inertial ratio is universal. Universality of free fall additionally requires the common weak-field test-body response law of Corollary N.7.1. If one independently calibrated reference probe $P_*$ satisfies $m_G(P_*)=m_I(P_*)$, then the common ratio is $1$. Conversely, on the non-compensation branch of Definition N.11.0b, a retained ledger change outside the PPI-null/common-rescaling quotient changes this ratio and violates universality. Equality of $C_{\mathrm{HSW}}$ or $f_{\mathrm{RID}}$ alone is neither necessary nor sufficient.

*Proof.* Positivity permits division and cancels $L(P)$, giving the probe-independent ratio $\beta_G/\beta_I$. Reference equality forces $\beta_G=\beta_I$. The converse is the injectivity clause defining the non-compensation branch. Communication and refresh entries affect the result only through a separately certified map into $\beta_I$, $\beta_G$, or the common metric. ∎

**Corollary N.11.1 (EP Violations as Certified Coupling-Ledger Deviations).** Fix $\varepsilon_0>0$ and a canonical reference with $q_*=1$, $C_*^{\mathrm{rel}}=2\varepsilon_0$, $\tau_*>0$, and $\lambda_{A,*}=1$. For every tested sector $S$, require
$$
\mathcal I_{\mathrm{rel}}(S),C_*^{\mathrm{rel}}(S),q(S),
\tau_{\min}(S),\lambda_A(S),\Theta_T(S)>0,
$$
the common-value additive/source-exhaustive branch of Corollary N.4.1, and the generalized same-cycle action map
$$
\left|\frac{d\mathcal S_{\mathrm{action}}}{d\tau}\right|
=\lambda_A(S)\hbar\dot\varepsilon_{\partial}(S).
$$
Accept its coefficient as $m_I(S)c^2$, and define
$$
m_0(S):=\frac{\hbar\mathcal I_{\mathrm{rel}}(S)}{2c^2\tau_*},
$$
$$
\lambda_I(S)
:=
\lambda_A(S)
\frac{2\varepsilon_0}{C_*^{\mathrm{rel}}(S)}
\frac{\tau_*}{q(S)\tau_{\min}(S)},
\qquad
\Theta_T(S):=\frac{m_G(S)}{m_0(S)}.
$$
The pre-calibration algebra of Corollary N.4.1 then gives
$$
m_I(S)
=\frac{\lambda_A(S)\hbar\varepsilon_0\mathcal I_{\mathrm{rel}}(S)}
{q(S)C_*^{\mathrm{rel}}(S)c^2\tau_{\min}(S)}
=m_0(S)\lambda_I(S),
$$
and hence
$$
\frac{m_G(S)}{m_I(S)}=\frac{\Theta_T(S)}{\lambda_I(S)}.
$$
For every positive same-unit quantity $X$, define
$$
\Delta_{AB}\ln X:=\ln\frac{X(A)}{X(B)}.
$$
Then, with $r_S:=m_G(S)/m_I(S)$,
$$
\boxed{
D_{AB}:=\ln\frac{r_A}{r_B}
=
\Delta_{AB}\ln\Theta_T
-\Delta_{AB}\ln\lambda_A
+\Delta_{AB}\ln C_*^{\mathrm{rel}}
+\Delta_{AB}\ln q
+\Delta_{AB}\ln\tau_{\min}.
}
\tag{N.35}
$$
For positive test-body accelerations in one common external field, additionally assume the registered response law $a_S=r_Sg$ with common $g>0$ and negligible self-force and backreaction. Then the Eötvös parameter obeys the exact identity
$$
\boxed{
\eta_{AB}
=\frac{2|r_A-r_B|}{r_A+r_B}
=2\tanh\frac{|D_{AB}|}{2}.
}
\tag{N.35a}
$$
Thus $\eta_{AB}=|D_{AB}|+O(|D_{AB}|^3)$ near zero. A refresh-coordinate term may be substituted only if an accepted differentiable overlap certificate fixes one displayed response-active entry as a function of $f_{\mathrm{RID}}$.

*Proof.* Additivity gives $\dot\varepsilon_\partial=\varepsilon_0\mathcal I_{\mathrm{rel}}/(qC_*^{\mathrm{rel}}\tau_{\min})$. The generalized action map and accepted rest-action identification give the displayed $m_I$. Substitute $\lambda_I$ into $r_S=\Theta_T/\lambda_I$ and take logarithms of ratios; common constants cancel, proving (N.35). The registered response law cancels the common $g$ in the Eötvös ratio. Setting $r_A/r_B=e^{D_{AB}}$ and simplifying $2|e^{D_{AB}}-1|/(e^{D_{AB}}+1)$ then gives (N.35a). ∎


### N.11.5a.3 Information-Theoretic Interpretation

**Remark N.11.7: Finite-Response Coupling Universality.** Data processing constrains distinguishability under a specified CPTP channel. Proposition N.4 instead decomposes state mutual information through a certified relational cut. Theorem N.11 concerns universality of the inertial/stress-source ratio, with value one only after reference calibration. These three statements can coexist, but none implies another without a typed overlap map.

| Ledger | Quantity | Role |
|:--|:--|:--|
| State correlation | $I(S:E)$ and $C_*^{\mathrm{rel}}$ | certified relational mass input |
| Communication | $C_{\mathrm{HSW}}$ | reliable unassisted transmission budget |
| Refresh | $f_{\mathrm{RID}}$ | distinguishability contraction bound |
| Gravity | $m_G/m_I$ | tested source-to-response ratio |

**Remark N.11.8: Exact Testable Bound.** If $0\le\eta_{AB}\le\eta_{\mathrm{exp}}<2$, then Equation (N.35a) gives the exact falsifier
$$
|D_{AB}|
\le2\operatorname{artanh}\!\left(\frac{\eta_{\mathrm{exp}}}{2}\right).
\tag{N.36}
$$
This bounds the full combination in Equation (N.35), not each coordinate separately. A bound on $f_{\mathrm{RID}}$ follows only after a forward-locked differentiable map from $f_{\mathrm{RID}}$ to one displayed coordinate is accepted.

### N.11.5a.4 Connection to Horizon Thermodynamics

The horizon package below is distinct from the equivalence and refresh packages; the comparison makes their optional typed overlap explicit.

**Proposition N.6 (Horizons as Finite-Response Capacity Boundaries).** Let a causal boundary $\mathcal H$ lie on the full Theorem-E.6 horizon package: a declared retained channel with capacity $C(\mathcal E_N)$, a capacity-achieving coding sequence, an entropy-saturating response distribution, an additive thermodynamic ledger, an effective-link density/refinement certificate, and the calibration defining $G_{\mathrm{op}}$. If the registered horizon branch saturates that certified boundary budget, define the dimensionless retained boundary ledger by
$$
C_{\mathrm{boundary}}(\mathcal H)
:=\frac{S_{\mathrm{rel}}(\mathcal A)}{k_B}.
$$
Then
$$
\boxed{
C_{\mathrm{boundary}}(\mathcal H)
=N_{\mathrm{eff\,links}}C(\mathcal E_N)
=\frac{c^3\mathcal A}{4G_{\mathrm{op}}\hbar}+r_E(\mathcal A)
=\frac{\mathcal A}{4L_{P,\mathrm{op}}^2}+r_E(\mathcal A),
}
\tag{N.37}
$$
where $L_{P,\mathrm{op}}^2:=G_{\mathrm{op}}\hbar/c^3$ and the density/refinement certificate requires
$$
\frac{r_E(\mathcal A)}{\mathcal A/\delta^2}\longrightarrow0
$$
in its declared macroscopic limit. Replacing $G_{\mathrm{op}}$ by measured $G$ requires the independent gravitational calibration of Theorem E.6. Horizonhood alone proves neither channel-capacity attainment nor entropy saturation.

*Proof.* The capacity-achieving, entropy-saturating, and additive-ledger records identify $S_{\mathrm{rel}}/k_B$ with the total retained channel budget. The density/refinement record and Theorem E.6 give the first two equalities in (N.37). The definition $L_{P,\mathrm{op}}^2=G_{\mathrm{op}}\hbar/c^3$ gives the last. Replacing $G_{\mathrm{op}}$ by measured $G$ is exactly the separate calibration clause. ∎

**Corollary N.11.2 (Typed Separation of Equivalence and Horizon-Area Certificates).** The equivalence-principle and horizon-area conclusions use distinct typed certificate packages:

- the equivalence-principle branch uses the relational cut ledger $C_*^{\mathrm{rel}}$, the mass--action coefficient, the inertial response, the retained stress-source map, source exhaustion, and a common operational metric;
- the area-law branch uses the registered unassisted classical capacity $C(\mathcal E_N)$; Proposition E.2a's reset-support bound may supply its numerical value only on a same-channel attainment certificate, together with effective-link density, boundary saturation, and refinement control; and
- the refresh branch uses the contraction factor $f_{\mathrm{RID}}$ only for the registered data-processing or mixing statement.

Neither $C_*^{\mathrm{rel}}=C_{\mathrm{HSW}}$ nor a shared microscopic carrier is implicit. The two conclusions coexist on an intersection branch only if an overlap certificate gives a type-correct map between their state, channel, and response records and proves absence of double counting. Even on that intersection, neither conclusion implies the other.

*Proof.* Theorem N.11 depends on probe-independent inertial and gravitational realization maps, a common metric, and source exhaustion; a reference equality is needed only to set their universal ratio to one. Theorems E.3 and E.6 depend instead on a channel-capacity density and horizon-saturation package. Proposition N.4 explicitly distinguishes quantum mutual information and its relational cut budget from unassisted channel capacity and its reset-support bound, while Theorem N.10 types $f_{\mathrm{RID}}$ as a contraction bound. Hence there is no common mathematical input without an additional overlap certificate. With such a certificate the antecedent packages can coexist; their distinct remaining premises still prevent either conclusion from entailing the other. ∎


### N.11.6 Complexity-Dependent Equivalence Principle Violation

For systems with $C_{agg}>C_{op}$, the explicit constitutive branch below defines a possible correction ledger. The complexity inequality alone implies no equivalence-principle violation.

**Theorem N.8 (Complexity Correction to the Equivalence Principle on the CC-Gravitational Response Branch).** Work on the saturated chronometric Appendix-S branch
$$
\Gamma_{\mathrm{deco}}
=\frac{|\Delta E|}{\hbar}K_{\mathrm{eff}}P_{\mathrm{context}},
\qquad K_{\mathrm{eff}}>0,
\tag{N.39}
$$
and on $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(1)$. Let $P:=P_{\mathrm{context}}\ge0$ be constant over the declared response window $\tau_c$, and assume the common-ledger baseline $m_I=m_G=m_0>0$. Hold the baseline relational-cut, clock, utilization, normalization, and action coefficients fixed over that window.

Assume independently a same-cycle incremental response certificate
$$
\dot\varepsilon_{\mathrm{CC}}
:=\frac1{k_B}\left.\frac{dS_{\mathrm{env}}^{\mathrm{reset}}}{d\tau}\right|_{\mathrm{CC}}
=\frac{\mathcal I_{\mathrm{rel}}}{2\tau_{\min}}
\left(1+\Gamma_{\mathrm{deco}}\tau_{\min}\right),
\tag{N.40}
$$
where $S_{\mathrm{env}}^{\mathrm{reset}}$ is the exported same-cycle reset entropy, and assume the action-overlap and mechanical-realization maps
$$
\left|\frac{d\mathcal S_{\mathrm{action}}^{\mathrm{CC}}}{d\tau}\right|
=\hbar\dot\varepsilon_{\mathrm{CC}},
\qquad
m_I^{(\mathrm{CC})}c^2
=\left|\frac{d\mathcal S_{\mathrm{action}}^{\mathrm{CC}}}{d\tau}\right|.
$$
Assume also the retained instantaneous source record and stress-source realization
$$
E_{\mathrm{grav}}^{\mathrm{inst}}
=\eta_{\mathrm{ret}}P\tau_c,
\qquad 0<\eta_{\mathrm{ret}}\le1,
\qquad
m_G^{(\mathrm{CC})}-m_0
=\frac{E_{\mathrm{grav}}^{\mathrm{inst}}}{c^2},
$$
and a source-exhaustion/no-double-counting certificate relating the Appendix-S source, decoherence response, inertial action increment, exported reset entropy, retained energy, and gravitational stress source. Define the independently measurable response coefficients
$$
a:=\frac{\eta_{\mathrm{ret}}\tau_c}{m_0c^2},
\qquad
b:=\frac{|\Delta E|}{\hbar}K_{\mathrm{eff}}\tau_{\min},
$$
which both have units $\mathrm W^{-1}$. Then
$$
m_I^{(\mathrm{CC})}=m_0(1+bP),
\qquad
m_G^{(\mathrm{CC})}=m_0(1+aP),
$$
and the exact fractional response is
$$
\boxed{
\delta_C
:=\frac{m_G^{(\mathrm{CC})}-m_I^{(\mathrm{CC})}}
{m_I^{(\mathrm{CC})}}
=\frac{(a-b)P}{1+bP}.
}
\tag{N.38}
$$
For $|bP|<1$,
$$
\delta_C=(a-b)P+R_2,
\qquad
|R_2|\le\frac{|b(a-b)|P^2}{1-|bP|}.
$$
Neither $C_{\mathrm{agg}}>C_{\mathrm{op}}$ nor the decoherence law proves any of the incremental-response, action-overlap, mechanical-realization, retained-source, stress-source-realization, baseline-equivalence, or no-double-counting premises.

*Proof.* Equation (N.40) differs from the baseline exported-reset entropy rate by the factor $1+\Gamma_{\mathrm{deco}}\tau_{\min}=1+bP$. The accepted same-cycle action and mechanical-realization maps give $m_I^{(\mathrm{CC})}=m_0(1+bP)$. The retained-source and stress-source-realization records add $\eta_{\mathrm{ret}}P\tau_c/c^2=m_0aP$ to the common gravitational baseline, giving $m_G^{(\mathrm{CC})}=m_0(1+aP)$. Direct subtraction and division prove (N.38). The remainder identity is
$$
R_2=-\frac{b(a-b)P^2}{1+bP},
$$
whose denominator is bounded below by $1-|bP|$. ∎

The separately defined Appendix-S coherence-response coefficient is
$$
K_\Gamma
=\frac{|\Delta E|}{\hbar}K_{\mathrm{eff}}\tau_{\mathrm{coh}}^0
=\frac{4\pi G}{3c^4}(1+3w_c)
\frac{|\Delta E|\,\eta_{\mathrm{ret}}rL_q\tau_c\tau_{\mathrm{coh}}^0}
{\hbar V_S}.
\tag{N.41}
$$
The coefficient $K_\Gamma$ is not the exact response coefficient in Equation (N.38). If an independent calibration gives $a-b=K_\Gamma$, then
$$
\delta_C=\frac{K_\Gamma P}{1+bP};
$$
therefore $K_\Gamma P$ is only the leading small-$|bP|$ term. At the explicitly stipulated fully retained point $\eta_{\mathrm{ret}}=1$ of Remark N.11.2a, Equation (N.41) gives $K_\Gamma P=9.9908\times10^{-41}$; this number is not an exact evaluation of $\delta_C$ without the calibration and denominator.

**Remark N.11.2: Distinguishing Prediction.** Standard physics predicts $\delta_C = 0$ exactly. Quantum-spacetime phenomenology commonly parameterizes potential new effects as Planck-suppressed corrections controlled by ratios such as $E/E_P$ (or $p/E_P$), without dependence on macroscopic computational activity [Amelino-Camelia 2013]. On the declared branch, the leading small-power signature is $\delta_C=(a-b)P_{\mathrm{context}}+R_2$, with the explicit remainder bound of Equation (N.38); the exact law is rational rather than proportional. It differs from a correction controlled only by an energy-to-Planck-scale ratio and becomes a PU prediction only after the decoherence, same-cycle response, mechanical-realization, retained-source, stress-source-realization, coefficient-calibration, and source-exhaustion records are independently accepted.

**Remark N.11.2a (Explicit Illustrative Parameter Point for Equation (N.41)).** To make the order-of-magnitude statement in Theorem N.8 reproducible, stipulate the following model inputs:
$$
\Delta E=1\,\mathrm{eV},
\quad
r=5\,\mathrm{cm},
\quad
L_q=10\,\mathrm{nm},
\quad
\tau_c=1\,\mathrm{s},
\quad
\tau_{coh}^0=1.9\times10^{-5}\,\mathrm{s},
$$
$$
V_S=10^{-3}\,\mathrm{m^3},
\quad
w_c=\frac13,
\quad
\eta_{\mathrm{ret}}=1,
\quad
P_{context}=0.1\,\mathrm W.
$$
Using the CODATA 2022 values of $G$ and $\hbar$, the exact SI value of $c$, and the exact SI electronvolt conversion [Mohr et al. 2025; NIST 2024], Equation (N.41) gives
$$
K_\Gamma=9.9908\times10^{-40}\,\mathrm{W^{-1}},
\qquad
K_\Gamma P_{context}=9.9908\times10^{-41}.
$$
Equivalently,
$$
\begin{aligned}
K_\Gamma P_{context}={}&(9.9908\times10^{-41})
\left(\frac{\Delta E}{1\,\mathrm{eV}}\right)
\left(\frac r{5\,\mathrm{cm}}\right)
\left(\frac{L_q}{10\,\mathrm{nm}}\right)
\left(\frac{\tau_c}{1\,\mathrm s}\right)\\
&\times
\left(\frac{\tau_{coh}^0}{1.9\times10^{-5}\,\mathrm s}\right)
\left(\frac{10^{-3}\,\mathrm{m^3}}{V_S}\right)
\left(\frac{1+3w_c}{2}\right)
\left(\frac{\eta_{\mathrm{ret}}}{1}\right)
\left(\frac{P_{context}}{0.1\,\mathrm W}\right).
\end{aligned}
$$
These values are stipulated illustrative inputs, not quantities derived by PU and not an empirical characterization of a biological system. The calculation validates only the numerical evaluation and dimensions of Equation (N.41). Under an accepted calibration $a-b=K_\Gamma$, the exact response is $\delta_C=K_\Gamma P_{\mathrm{context}}/(1+bP_{\mathrm{context}})$; the quoted $K_\Gamma P_{\mathrm{context}}$ is only its leading small-$|bP_{\mathrm{context}}|$ term.

**Proposition N.8.1 (Conditional Self-Model Maintenance Energy Ledger).** Assume a certificate maps one maintenance cycle to $n_{\mathrm{reset}}$ sequential registered classical resets, proves
$$
n_{\mathrm{reset}}\ge c_-C_{\mathrm{uni}}(\delta_{\mathrm{maint}}),
\qquad H_{p_j}(P_j\mid R_j)\ge h_{\min}>0,
$$
and supplies a retained-energy coefficient $0\le\eta_{\mathrm{ret}}\le1$. Here $p_j$ is the reset distribution, unrelated to the relational-utilization coordinate $q$ unless a typed bridge is supplied; $R_j$ contains all classical side information retained and unchanged through reset $j$, and the heat ledgers are additive. Then
$$
P_{\mathrm{reset}}
\ge
\frac{k_BT_{\mathrm{eff}}}{\tau_{\mathrm{cycle}}}
c_-h_{\min}C_{\mathrm{uni}}(\delta_{\mathrm{maint}}),
\qquad P_{\mathrm{ret}}:=\eta_{\mathrm{ret}}P_{\mathrm{reset}}.
\tag{N.44}
$$
If, along a worldline, the exported reset heat is isotropic in the instantaneous comoving frame, then its laboratory-frame work ledger obeys
$$
W_{\mathrm{reset}}^{\mathrm{lab}}\ge\int_0^{\tau_f}\gamma(\tau)P_{\mathrm{reset}}(\tau)\,d\tau.\tag{N.45}
$$
Only $P_{\mathrm{ret}}$ enters the declared local-system retained source. Exported heat belongs to the environment or radiation source, and both contributions require a source-exhaustive coupling map to prevent omission or double counting.

*Proof.* Conditional Landauer for reset $j$ gives
$$
Q_j\ge k_BT_{\mathrm{eff}}H_{p_j}(P_j\mid R_j)
\ge k_BT_{\mathrm{eff}}h_{\min}.
$$
The additive heat hypothesis therefore gives, in one maintenance cycle,
$$
Q_{\mathrm{cycle}}
=\sum_{j=1}^{n_{\mathrm{reset}}}Q_j
\ge n_{\mathrm{reset}}k_BT_{\mathrm{eff}}h_{\min}
\ge k_BT_{\mathrm{eff}}h_{\min}
c_-C_{\mathrm{uni}}(\delta_{\mathrm{maint}}).
$$
Division by $\tau_{\mathrm{cycle}}>0$ proves the lower bound for $P_{\mathrm{reset}}$. The retained-power equality is the declared definition with $0\le\eta_{\mathrm{ret}}\le1$.

For an isotropic comoving heat increment,
$$
dE_{\mathrm{com}}=P_{\mathrm{reset}}(\tau)\,d\tau
$$
has four-momentum $(dE_{\mathrm{com}}/c,\mathbf0)$. A Lorentz boost to the laboratory gives $dE_{\mathrm{lab}}=\gamma(\tau)dE_{\mathrm{com}}$. Integration over proper time gives (N.45). The stress-energy clause is conditional on the separately assumed coupling map and asserts no source term without it. ∎

**Remark N.8.1 (Magnitude and Observability).** The self-model maintenance contribution to stress-energy (Equation N.44) is controlled by $\delta_{\text{maint}}$ and $\tau_{\text{cycle}}$, both of which are system-specific parameters not yet bounded from first principles within the framework. The final MICROSCOPE titanium--platinum result is $\eta(\mathrm{Ti},\mathrm{Pt})=(-1.5\pm2.3_{\mathrm{stat}}\pm1.5_{\mathrm{syst}})\times10^{-15}$ [Touboul et al. 2022]. Comparison with this result requires a model that maps the retained stress-energy contribution to a signed, composition-dependent Eötvös parameter and propagates the experimental statistical and systematic uncertainties. Determining that map and independently modeling $\delta_{\text{maint}}$ for specific physical systems (e.g., biological neural networks and crystalline solids of equal mass) constitute open problems.

**Definition N.8.1a (Self-Model Maintenance Window Certificate).** Fix $0<\delta_{\mathrm{maint}}<1$, $c_->0$, $C_{\mathrm{avail}}>0$, $T_{\mathrm{eff}}>0$, and $\tau_{\mathrm{cycle}}>0$. The temperature $T_{\mathrm{eff}}$ is the bath temperature used in Equation N.44. The record certifies
$$
C_{\mathrm{uni}}(\delta)\ge
c_-\frac{\log(1/\delta)}{\delta^2},
\qquad
C_{\mathrm{uni}}(\delta_{\mathrm{maint}})\le C_{\mathrm{avail}}.
\tag{N.8.1a.1}
$$

**Proposition N.8.1b (Maintenance Accuracy and Conditional Power Floor).** The certificate of Definition N.8.1a implies
$$
\delta_{\mathrm{maint}}
\ge
\left[
\frac{c_-}{2C_{\mathrm{avail}}}
W\!\left(\frac{2C_{\mathrm{avail}}}{c_-}\right)
\right]^{1/2}.
\tag{N.8.1b.1}
$$
If the record additionally certifies $n_{\mathrm{reset}}\ge c_-C_{\mathrm{uni}}$, an additive sequential registered-reset ledger, and
$$
H_{p_j}(P_j\mid R_j)\ge\ln2
$$
for every registered reset, then
$$
P_{\mathrm{self}}
\ge
\frac{k_BT_{\mathrm{eff}}\ln2}{\tau_{\mathrm{cycle}}}
c_-^2\frac{\log(1/\delta_{\mathrm{maint}})}
{\delta_{\mathrm{maint}}^2}.
\tag{N.8.1b.2}
$$

*Proof.* Set
$$
A=\frac{2C_{\mathrm{avail}}}{c_-}>0,
\qquad
u=\delta_{\mathrm{maint}}^{-2}>1.
$$
The certificate gives $u\log u\le A$. The function $u\mapsto u\log u$ is strictly increasing on $[1,\infty)$. Solving $u\log u=A$ gives $\log u=W(A)$ and $u=e^{W(A)}=A/W(A)$. Therefore
$$
\delta_{\mathrm{maint}}^2=\frac1u\ge\frac{W(A)}A
=\frac{c_-}{2C_{\mathrm{avail}}}W\!\left(\frac{2C_{\mathrm{avail}}}{c_-}\right).
$$
Positive square roots give (N.8.1b.1). Under the additional reset hypotheses, conditional Landauer and additivity give
$$
P_{\mathrm{self}}\tau_{\mathrm{cycle}}
\ge
k_BT_{\mathrm{eff}}n_{\mathrm{reset}}\ln2
\ge
k_BT_{\mathrm{eff}}c_-C_{\mathrm{uni}}\ln2,
$$
and the complexity lower bound proves (N.8.1b.2). ∎

**Theorem N.8.2 (Equivalence–Complexity Lock).** On canonical $\mathfrak B_{mass}$, let
$$
m_0(S):=\frac{\mathcal I_{\mathrm{rel}}(S)}{2\sqrt{8\varepsilon_0}}m_P>0,
$$
and let accepted mechanical and gravitational realization maps give positive coefficients
$$
m_I(S)=m_0(S)+\Delta m_I(S)>0,
\qquad
m_G(S)=m_0(S)+\Delta m_G(S)>0.
$$
For two test bodies $A,B$ in one common external weak field, assume the registered response law $a_S=[m_G(S)/m_I(S)]g$ and negligible self-force and backreaction. Define
$$
r_S:=\frac{m_G(S)}{m_I(S)},
\qquad
\delta_S:=\ln r_S.
$$
Then the Eötvös parameter obeys the exact identity
$$
\eta_{AB}
:=2\frac{|a_A-a_B|}{a_A+a_B}
=2\tanh\frac{|\delta_A-\delta_B|}{2}.
$$
If an independently accepted linear log-response certificate gives
$$
\delta_S=\zeta_{\mathrm{EP}}\chi_S,
$$
then
$$
\boxed{
\eta_{AB}
=2\tanh\!\left(
\frac{|\zeta_{\mathrm{EP}}|\,|\chi_A-\chi_B|}{2}
\right).
}
\tag{N.46}
$$
For $|\zeta_{\mathrm{EP}}(\chi_A-\chi_B)|\ll1$, this is
$$
\eta_{AB}
=|\zeta_{\mathrm{EP}}|\,|\chi_A-\chi_B|
+O\!\left(|\zeta_{\mathrm{EP}}(\chi_A-\chi_B)|^3\right).
$$
If the accepted source and response maps give $\Delta m_G(S)=\Delta m_I(S)$ for every $S$, then $r_S=1$ and $\eta_{AB}=0$. The complexity measure alone supplies neither the linear response nor a nonzero violation.

*Proof.* Positivity permits division. Substitution of $a_S=r_Sg$ into the Eötvös definition gives $2|r_A-r_B|/(r_A+r_B)$. Since $r_A/r_B=e^{\delta_A-\delta_B}$, elementary simplification gives the hyperbolic-tangent identity. The linear log-response substitution proves (N.46), and the Taylor expansion of $2\tanh(x/2)$ at $x=0$ has linear term $x$ and cubic remainder. Equal inertial and gravitational increments give $r_S=1$ directly. ∎

### N.11.7 Conditional Connection to Particle-Mass Hierarchies

**Proposition N.5 (Mass Ratios from Information Ratios).** On the canonical mass--action branch $\mathfrak B_{\mathrm{mass}}$ of Theorem N.5, let two systems have relational information contents $\mathcal I_1\ge0$ and $\mathcal I_2>0$. Then
$$
\frac{m_1}{m_2}=\frac{\mathcal I_1}{\mathcal I_2}.
\tag{N.42}
$$

*Proof.* Theorem N.5 gives, for $i=1,2$,
$$
m_i=K\mathcal I_i,
\qquad
K:=\frac{m_P}{2\sqrt{8\varepsilon_0}}>0.
$$
Since $\mathcal I_2>0$, one has $m_2=K\mathcal I_2>0$, and division is legitimate. Therefore
$$
\frac{m_1}{m_2}
=\frac{K\mathcal I_1}{K\mathcal I_2}
=\frac{\mathcal I_1}{\mathcal I_2}.
$$
∎

**Theorem N.9 (Information--Hierarchy Compatibility under a Common Mass Certificate).** Assume Proposition N.5 at one declared matching scale and an accepted Theorem-T.39 certificate that realizes the same charged-lepton sector matrix and verifies the residual-bearing Theorem-T.42.6 exponents $L_{\tau\mu}$ and $L_{\mu e}$. Then
$$
\log\frac{\mathcal I_\tau}{\mathcal I_\mu}
=\log\frac{m_\tau}{m_\mu}=L_{\tau\mu},
\qquad
\log\frac{\mathcal I_\mu}{\mathcal I_e}
=\log\frac{m_\mu}{m_e}=L_{\mu e}.
\tag{N.43}
$$
Consequently,
$$
\log\frac{\mathcal I_\tau}{\mathcal I_e}
=\log\frac{m_\tau}{m_e}
=L_{\tau e}:=L_{\tau\mu}+L_{\mu e}.
$$

*Proof.* Proposition N.5 gives equality of every positive mass ratio with the
corresponding information ratio. The accepted T.39 certificate supplies the
two common-scale mass/exponent equalities. Multiplication of adjacent positive
ratios and taking logarithms gives the final identity. ∎

**Corollary N.9.1 (Certificate-Gated Ordered Lepton-Ratio Invariant).** If
$L_{\tau\mu}\ne0$, the hypotheses of Theorem N.9 give
$$
\mathcal R_\ell
=\frac{\log(m_\tau/m_e)}{\log(m_\tau/m_\mu)}
=\frac{L_{\tau\mu}+L_{\mu e}}{L_{\tau\mu}}.
$$
On Theorem T.42.6's registered zero-remainder branch this diagnostic is
$$
\mathcal R_\ell^{\mathrm{model},(0)}
=2.922175196389323\ldots.
$$
The value $3$ occurs only in the leading quadratic subbranch with one common
coefficient and zero quartic and higher residuals. The information scale
cancels, but the physical equality remains gated by the common Proposition-N.5
and Theorem-T.39 certificate package. ∎

### N.11.8 Typed Dependency Chain and Independent Gates

The structural carrier route and the mass route meet only at explicitly certified entries. The carrier route gives
$$
(\mathrm{O1})\text{--}(\mathrm{O3})+(\mathrm{FC})
\Longrightarrow K_0=3,\quad N_{\mathrm{vis}}^{\min}=8,
\qquad
d_0=8\ \text{on the stated Hilbert/comparator branch},
$$
and the registered binary quotient independently gives $\varepsilon_0=\ln2$. These statements do not supply a relational-cut decomposition, a channel-activity record, or an action map.

The mass route is the typed conjunction
$$
\boxed{
\left.
\begin{gathered}
\mathfrak C_{\partial}:\quad
\mathcal I_{\mathrm{rel}}
=\sum_i I_i
=\sum_i q_iC_i^{\mathrm{rel}},\\
C_i^{\mathrm{rel}}=C_*^{\mathrm{rel}},\quad q_i=q\in(0,1],\\
r_i=1/\tau_i\ \text{with additive concurrent activity and no shared bottleneck},\\
\varepsilon_i=\varepsilon_0,\quad \tau_i=\tau_{\min},\\
C_*^{\mathrm{rel}}=2\varepsilon_0,\\
\mathcal I_{\mathrm{rel}},q,C_*^{\mathrm{rel}},\tau_{\min}
\text{ and the action coefficient are stationary on the integration interval},\\
\left|d\mathcal S_{\mathrm{action}}/d\tau\right|
=\hbar\dot\varepsilon_{\partial}
\end{gathered}
\right\}
\Longrightarrow
m=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2qc^2\tau_{\min}}.
}
$$
The Equation-Q.18/Proposition-Q.6.1 clock calibration then gives
$$
\tau_{\min}=\sqrt{8\varepsilon_0}\,t_P
\Longrightarrow
m=\frac{\mathcal I_{\mathrm{rel}}}{2q\sqrt{8\varepsilon_0}}m_P.
$$
The canonical branch is $q=1$. A physical entropy/heat reading is not part of this implication; it requires $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$, which identifies these same cycles with registered conditional-entropy resets and applies the Landauer inequality, with equality only on its separately certified reversible-limit protocol.

| Step | Result | Independent certificate |
|:--|:--|:--|
| 1 | $\mathcal I_{\mathrm{rel}}=\sum_iq_iC_i^{\mathrm{rel}}$ | relational split, exact product additivity or ordered QCMI chain rule, source exhaustion, no double counting |
| 2 | $\dot\varepsilon_{\partial}=\sum_i\varepsilon_i/\tau_i$ | per-channel saturated activity, additive concurrency, no shared bottleneck |
| 3 | $\dot\varepsilon_{\partial}=\mathcal I_{\mathrm{rel}}/(2q\tau_{\min})$ | common values and independent $C_*^{\mathrm{rel}}=2\varepsilon_0$ normalization calibration |
| 4 | $m=\hbar\mathcal I_{\mathrm{rel}}/(2qc^2\tau_{\min})$ | stationarity on the integration interval, same-cycle action/update map, and accepted rest-action ledger; without stationarity the relation is pointwise |
| 5 | Planck-normalized coefficient | clock/spacing calibration and $m_Pc^2=\hbar/t_P$ |
| 6 | entropy/heat inequality and limiting equality | stronger same-cycle reset, conditional-entropy, equilibrium, temperature, and Landauer protocol records |

The relational normalization budgets $C_i^{\mathrm{rel}}$, the registered unassisted capacity $C(\mathcal E_N)$ and its separately typed reset-support upper bound, and the refresh factor $f_{\mathrm{RID}}$ are distinct inputs. No equality among them is used in the mass derivation.



### N.11.9 Physical Interpretation

**Remark N.11.3: Conditional Mass Interpretation.** On $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$, Theorem N.5 assigns a rest-action coefficient to an accepted, source-exhaustive relational cut ledger. The Planck-normalized expression additionally requires $\mathfrak B_{\mathrm{mass}}(q)$, and the canonical coefficient uses $q=1$. Relational information outside those branches carries no absolute mass assignment.

**Remark N.11.4: What Rest Energy Is.** Corollary N.5.1 identifies rest energy with the certified proper-time action rate
$$
E=mc^2
=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}.
$$
The corresponding structural update rate is $\mathcal I_{\mathrm{rel}}/(2q\tau_{\min})$. Define $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$ as $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$ plus the same-cycle reset law $p_i$, conditional-entropy/source-exhaustion record, equilibrium temperature, and Landauer implementation data. That branch proves Corollary N.5.2's heat inequality; exact heat equality requires its further same-rate reversible-limit convergence and compatibility certificate.

**Remark N.11.5: Conditional Inertia Interpretation.** Theorem N.6 shows that the already accepted rest-action coefficient is compatible with a registered relational-update ledger and, on the stronger thermodynamic/Unruh branch, supplies a refresh-power lower-bound scale. Exact refresh-power equality additionally requires the same-rate reversible-limit certificate of Corollary N.5.2. It does not independently derive Newton's force law or prove that arbitrary correlations resist acceleration; those claims require a mechanical response map for the declared system--environment split.

**Remark N.11.6: Conditional Connection to UCT.** The UCT includes $m_0$ as an input. On canonical $\mathfrak B_{\mathrm{mass}}$, Theorem N.5 permits
$$
m_0
=\frac{\mathcal I_{\mathrm{rel}}}{2\sqrt{8\varepsilon_0}}m_P.
$$
The laboratory-frame ledger may then be written
$$
W_{\mathrm{tot}}^{\mathrm{lab}}
\ge
\frac{\mathcal I_{\mathrm{rel}}}{2\sqrt{8\varepsilon_0}}
E_P(\gamma_f-1)
+
\int_0^{\tau_f}\gamma(\tau)R_{\mathrm{com}}(\tau)\,d\tau.
$$
The first term is the conditional mass substitution. The second is the laboratory energy of the separately certified comoving exported-loss ledger; the two terms must pass the UCT source-overlap audit.

### N.11.10 Summary

Appendix N proves a typed family of branch theorems, not an unconditional identification of mass with every state correlation.

| Result | Proved content | Independent gate retained |
|:--|:--|:--|
| Proposition N.4 | finite certified decomposition of $I(S:E)$ through relational normalization budgets | split, additivity/chain rule, exact spectral identities or propagated interval residuals, exhaustion, no double counting |
| Theorem N.4 | $0\le r_e\le1/\tau_{\min}$ for serialized registered cycles | physical clock and duration record; saturation is additional |
| Corollary N.4.1 | $\dot\varepsilon_\partial=\sum_i\varepsilon_i/\tau_i$ and its common-value specialization | per-channel saturation, additive/source-exhaustive update ledger, concurrency, $C_*^{\mathrm{rel}}=2\varepsilon_0$ normalization |
| Theorem N.5 | $m=\hbar\mathcal I_{\mathrm{rel}}/(2qc^2\tau_{\min})$ | relational cut, source exhaustion, stationarity or pointwise reading, action/update map; Planck form needs the clock branch |
| Corollary N.5.1 | $E=mc^2$ as certified proper-time action rate | same mass branch; no thermodynamic meaning without $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$ |
| Theorem N.6 | compatibility of the accepted inertial coefficient with the relational update ledger and a refresh-power lower-bound scale | mechanical realization; thermodynamic and detector-response gates; same-rate reversible limit for equality |
| Theorems N.7 and N.11 | a universal $m_G/m_I$ ratio on a common metric/source/response ledger | retained stress-source map, common metric, source exhaustion; value one only after reference calibration |
| Theorem N.8 | exact rational constitutive response with a controlled first-order expansion | decoherence, thermodynamic overlap, incremental mechanical and stress-source realization, retained source, calibration, positive-retention, and no-double-counting records |
| Theorem N.9 | ordered charged-lepton relations on the Appendix T branch | physical labels, coefficient, scheme, running and remainder certificates |

The protected upstream result is the exact relational-state ledger $\mathcal I_{\mathrm{rel}}=I(S:E)$ and its accepted finite decompositions. The mass, thermodynamic, equivalence, complexity-response, and flavor readings are progressively stronger intersection branches. Failure of a downstream certificate removes only that reading; it does not invalidate the upstream correlation theorem.

---
