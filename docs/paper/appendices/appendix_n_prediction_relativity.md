# Appendix N: Prediction Relativity and the Unified Cost of Transgression

## N.1 Master Principle: The PCE Potential

The foundational dynamical principle of the Predictive Universe (PU) framework is the minimization of the **PCE Potential**, $V$. This is a functional that quantifies the net resource cost rate of a given MPU network configuration, balancing the costs of operation and interaction against the benefits of predictive accuracy. The system's evolution is governed by a stochastic process that seeks the global minimum of this potential. For a single MPU $i$ interacting with its local environment, its contribution to the global potential is derived from the structure of $V$ as defined in the PU framework [**Appendix D**, Def. D.1]:

$$
V_i = \underbrace{V_{op}(i)}_{\text{Operational Cost}} + \underbrace{V_{prop}(i)}_{\text{Propagation Cost}} - \underbrace{V_{benefit}(i)}_{\text{Predictive Benefit}}
\tag{N.1}
$$

where each term is a rate (power):
*   **$V_{op}$**: The cost of maintaining and operating the MPU's internal complexity $C_i$, given by the PU cost functions $R(C_i)$ and $R_I(C_i)$ [Def. 3].
*   **$V_{prop}$**: The cost of maintaining coherent predictive links with neighbors, penalizing both information loss (decoherence) and the structural thermodynamic cost $\varepsilon_0=\ln2$, with physical implementation cost $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)\quad\text{on a registered reset branch}$, of interaction [Appx. C, D].
*   **$V_{benefit}$**: The reward for predictive accuracy, proportional to the MPU's success in predicting the states of its neighbors, derived from its Predictive Performance $PP$ [Def. 7, D.1].

The master equation of the PU framework is the stochastic differential equation describing the evolution of the network configuration $x$ as a gradient flow on this potential: $dx(t) = -\eta(x) \nabla V(x) dt + \sqrt{2D(x)} dW(t)$ [**Appendix D**, Equation D.8]. The principles explored in this section represent physical constraints that must be incorporated into the cost terms of the PCE potential $V$, thereby shaping the emergent dynamics of the system as it seeks to minimize this potential.

## N.2 Divergence Laws for Hardware and Software Limits

The PCE Potential incorporates costs that diverge as the system approaches fundamental physical or logical limits. Two such divergences are critical:

*   **Predictive Divergence** [Thm. 14]. For a self-referential task with performance gap $\delta_{\text{SPAP}}:=\alpha_{SPAP}-PP$, On a task class carrying the Bernoulli reduction, independence, confidence, and cost certificate $\mathfrak C_{B.2}$, Theorem 14 furnishes the lower bound:
    $$
    C_{\text{uni}}(PP) = \Omega\left(\frac{\log(1/(\alpha_{SPAP} - PP))}{(\alpha_{SPAP} - PP)^2}\right)
    \tag{N.2}
    $$
    Any transfer of this lower bound to a specific predictive-complexity notion such as $C_P$ requires the explicit bridge hypothesis that the operational predictive complexity dominates the universal SPAP complexity in the regime under study.

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

Internal implementation heating is distinct from the proper-acceleration/Unruh branch. Choose an operational throughput coordinate $A_{\mathrm{pred}}$ measured per unit proper time—for example a registered completed-reset rate or a separately defined complexity-update rate—and specify its implementation before comparing costs. Theorem 31 supplies the structural entropy statement $\varepsilon_0=\ln2$ and, on a registered reset branch, $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; conversion of that statement into heat requires the implementation's reset temperature, activity fraction, and dissipation ledger.

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

**Lemma N.2 (Conditional transfer of the SPAP divergence bound).** Let $\delta_{\text{SPAP}}=\alpha_{\text{SPAP}}-PP\in(0,\delta_0]$. If $\mathfrak C_{B.2}$ is accepted and
$$
C_{\text{SPAP}}(PP)\ge C_{\text{uni}}(PP),
$$
then
$$
C_{\text{SPAP}}(PP)
\ge
c_{\text{SPAP}}
\frac{\log(1/\delta_{\text{SPAP}})}
{\delta_{\text{SPAP}}^2}.
$$

*Proof.* Theorem 14 gives
$$
C_{\text{uni}}(PP)
\ge
c_{\text{SPAP}}
\frac{\log(1/\delta_{\text{SPAP}})}
{\delta_{\text{SPAP}}^2}.
$$
Combining this inequality with the bridge hypothesis by transitivity proves the claim. ∎

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
    where $C_{\text{req}}(\tau)=C_{\text{SPAP}}(PP(\tau))+C_{\text{noise,external}}(a(\tau))+C_{\text{noise,internal}}(A_{\text{pred}}(\tau))$ as in the theorem statement.

3.  **Explicit SPAP lower bound (optional form):** By Lemma N.2, for $\delta(\tau)=\alpha_{\text{SPAP}}-PP(\tau)\in(0,\delta_0]$,
    $$
    C_{\text{SPAP}}(PP(\tau)) \ge c_{\text{SPAP}}\,\frac{\log(1/\delta(\tau))}{\delta(\tau)^2}.
    $$
    Since $R(C,T)$ is non-decreasing in $C$ (Definition 3), this yields
    $$
    W_{\text{pred}}^{\mathrm{lab}} \ge \int_0^{\tau_f}\gamma(\tau) R\!\left(c_{\text{SPAP}}\,\frac{\log(1/\delta(\tau))}{\delta(\tau)^2}+C_{\text{noise,external}}(a(\tau))+C_{\text{noise,internal}}(A_{\text{pred}}(\tau)),\,T_{\text{eff}}(\tau)\right)\,d\tau.
    $$
    This transfer uses the bridge hypothesis of Lemma N.2; without it the lower bound remains a statement about $C_{\mathrm{uni}}$.

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

*   **Confirmed Baseline Prediction:** General Relativity (GR) makes an exact prediction for the orbital decay rate due to the emission of gravitational waves via the quadrupole formula. This prediction has been confirmed to stunning accuracy in multiple systems:
    *   **PSR B1913+16 (Hulse–Taylor):** The measured $\dot{P}_b$ agrees with the GR prediction to within 0.2% (Weisberg et al. 2010).
    *   **PSR J0737–3039A/B (Double Pulsar):** Long-term observation has improved this agreement to an incredible 0.013% (Kramer et al. 2021). This provides an incredibly solid and precisely measured baseline against which to search for any new, anomalous source of energy loss.

#### N.8.2 Standard Model vs. Predictive Universe: A Tale of Two Energy Drains

**Standard Picture (GR):** According to GR, the binary system loses energy solely through the emission of gravitational waves (GWs). This energy loss, given by Einstein's quadrupole formula, causes the two stars to gradually spiral closer, decreasing their orbital period $P_b$. The rate of this orbital decay, $(dP_b/dt)_{GW}$, is precisely predicted.

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

#### N.8.3 The Unique Observational Signature

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

*   If $B \approx 1$, the data show no preference for the more complex UCT model. GR remains the most efficient description. This would place stringent upper limits on the effective accelerated-complexity rate $\Xi=C_{eff}/\tau_{cycle}$.
*   If $B \gg 1$ (e.g., $B > 100$, conventionally "strong evidence"), this would indicate that the data *require* the additional UCT term to be explained. This would be a momentous discovery.

#### N.8.5 Challenges and Outlook

This is an extraordinarily difficult measurement that pushes the boundaries of precision science.

*   **Magnitude Problem:** The astounding success of GR implies that the $P_{UCT}$ term, if it exists, must be an extremely small fraction of the $P_{GW}$ term. We would be searching for a deviation at perhaps the 1-in-10,000 level or smaller of an already tiny effect.
*   **Degeneracy Problem:** The primary systematic challenge is ensuring that any detected signal isn't mimicking some other subtle, unmodeled physical effect. High-eccentricity systems are essential, as they provide a wide dynamic range of acceleration, which is key to tracing out the functional form of $P_{UCT}(a)$ and distinguishing it from other potential systematics. A full analysis must rigorously account for or model effects like tidal dissipation and magnetospheric interactions, even if they are expected to be negligible.

Despite these hurdles, this is a well-posed scientific question once its branch assumptions are stated explicitly. It transforms the abstract UCT principle into a search for a specific anomalous timing signature. A positive detection would provide evidence for an orbital-acceleration bridge between relational orbital dynamics and the thermodynamic cost of acceleration. A null result is equally valuable, placing direct empirical constraints on the orbital-bridge active-refresh factor $q_{\mathrm{act}}^{\mathrm{orb}}$ defined below.

#### N.8.6 Active-Refresh Normalization and Conditional Binary-Pulsar Bridge

**Definition N.12 (Proper-Acceleration Active-Refresh Factor).** For a system $S$ of inertial mass $m_S$ undergoing proper acceleration magnitude $a>0$, define
$$
q_{\mathrm{act}}(S;a)
:=
\frac{P_{UCT}(S;a)}
{P_{UCT}^{\mathrm{sat}}(S;a)},
\qquad
P_{UCT}^{\mathrm{sat}}(S;a):=\frac{c}{2\pi}m_Sa.
$$
The denominator is the saturated proper-acceleration active-refresh prediction of Theorem N.6 Step 5. On an active-fraction branch, $q_{\mathrm{act}}\in[0,1]$. The symbol $q_{\mathrm{act}}$ is not identified with the channel-utilization factor $q$ of Proposition N.4 unless an additional bridge theorem explicitly equates them.

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
*On the saturated proper-acceleration active-refresh branch, $q_{\mathrm{act}}=1$ and hence*
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

**Corollary N.12b (Proper-Acceleration Entropy Drag Observable).** On the proper-acceleration active-refresh branch of Definition N.12, the excess UCT power of a system $S$ of inertial mass $m_S$ undergoing proper acceleration magnitude $|a|$ is
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

**Corollary N.12.2 (Conditional Observational Bound on $q_{\mathrm{act}}^{\mathrm{orb}}$).** *Assume the leading-quadrupole, weak-field, adiabatic point-mass branch of the Peters (1964) orbital-decay formula for the same binary. Then*
$$
\langle P_{GW}\rangle
=
\frac{32}{5}
\frac{G^4(m_Am_B)^2(m_A+m_B)}
{c^5a_{\mathrm{orb}}^5}
f(e),
\qquad
f(e):=
\frac{1+\tfrac{73}{24}e^2+\tfrac{37}{96}e^4}{(1-e^2)^{7/2}},
$$
*with $f(0.0878)\approx1.0516$ and*
$$
\langle P_{GW}\rangle\approx2.36\times10^{25}\,\mathrm W.
$$
*On the orbital-acceleration bridge, both energy-loss channels enter the orbital-decay rate linearly while the binary parameters are held constant, so*
$$
\frac{\delta\dot P_b}{\dot P_b^{GR}}
\approx
q_{\mathrm{act}}^{\mathrm{orb}}
\frac{\langle P_{UCT}^{\mathrm{orb,sat}}\rangle}{\langle P_{GW}\rangle}
\approx
q_{\mathrm{act}}^{\mathrm{orb}}\,(2.316\times10^{15}).
$$
*The 16-year double-pulsar agreement with GR at fractional precision $1.3\times10^{-4}$ (Kramer et al. 2021) gives*
$$
q_{\mathrm{act}}^{\mathrm{orb}}(\mathrm{NS};a_{\mathrm{orb}})
<
\frac{1.3\times10^{-4}}{2.316\times10^{15}}
\approx
5.6\times10^{-20}.
$$

*Proof.* The hypotheses stated in the corollary are exactly the point-mass, weak-field, adiabatic, leading-quadrupole hypotheses under which the Peters (1964) power formula applies. Substitution of $e=0.0878$ gives
$$
f(e)
=\frac{1+(73/24)e^2+(37/96)e^4}{(1-e^2)^{7/2}}
=1.05157065\ldots.
$$
Using the masses and constants evaluated in Corollary N.12.1 gives
$$
\langle P_{GW}\rangle
=2.36060\times10^{25}\,\mathrm W.
$$
The ratio of the two powers is
$$
\frac{5.46809\times10^{40}}{2.36060\times10^{25}}
=2.31640\times10^{15}.
$$
Clause 3 of Definition N.12a makes the two losses additive in the orbital-energy balance. With the binary parameters held constant in the linearized comparison, the fractional period-decay correction is the same power ratio multiplied by $q_{\mathrm{act}}^{\mathrm{orb}}$. Hence the observational bound implies
$$
q_{\mathrm{act}}^{\mathrm{orb}}
<\frac{1.3\times10^{-4}}{2.31640\times10^{15}}
=5.61215\times10^{-20},
$$
which rounds to $5.6\times10^{-20}$. ∎

**Corollary N.12.3 (Conditional Exclusion of Saturated Orbital-Bridge Refresh).** *On the orbital-acceleration test bridge of Definition N.12a, the bound*
$$
q_{\mathrm{act}}^{\mathrm{orb}}(\mathrm{NS};a_{\mathrm{orb}})<5.6\times10^{-20}
$$
*is incompatible with the saturated orbital-bridge branch $q_{\mathrm{act}}^{\mathrm{orb}}=1$ for macroscopic, gravitationally bound, thermalized neutron-star matter. This conclusion does not by itself falsify the proper-acceleration UCT branch of Theorem N.12 or the boundary-channel saturation branch of Proposition N.4, because $q_{\mathrm{act}}^{\mathrm{orb}}$, $q_{\mathrm{act}}$, and the Proposition N.4 utilization factor $q$ are distinct branch parameters unless additional bridges equate them.*

*Proof.* Since $5.6\times10^{-20}<1$, no real number can satisfy both $q_{\mathrm{act}}^{\mathrm{orb}}<5.6\times10^{-20}$ and $q_{\mathrm{act}}^{\mathrm{orb}}=1$. Definition N.12a declares $q_{\mathrm{act}}^{\mathrm{orb}}$ distinct from $q_{\mathrm{act}}$, and Proposition N.4 separately defines $q$. In the absence of an equality bridge, the contradiction concerns only the orbital-bridge parameter. ∎

**Remark N.12.1 (Locked-In versus Actively Refreshed Information).** On the orbital-acceleration bridge, the bound implies that only an extremely small fraction of the relational information associated with a neutron star can be paying the bridge-level Landauer refresh cost per relevant cycle under orbital acceleration. Using the equivalent Theorem N.5 form
$$
\mathcal I_{\mathrm{rel}}=\frac{2c^2\tau_{\min}m}{\hbar},
$$
a neutron star with $m=1.338M_\odot$ has $\mathcal I_{rel}\approx5.76\times10^{38}$ nats only on $\mathfrak B_{mass}$



**Corollary N.12.4 (Forward-Looking Conditional Sensitivity).** *If future pulsar timing reaches fractional precision $10^{-5}$ on $\dot P_b$ for PSR J0737–3039A/B while preserving the same system model and the orbital-acceleration bridge, the bound becomes*
$$
q_{\mathrm{act}}^{\mathrm{orb}}<\frac{10^{-5}}{2.316\times10^{15}}\approx4.3\times10^{-21}.
$$
*A detection within this window with the orbital-phase dependence of the acceleration profile would measure the orbital-bridge active-refresh factor rather than an unconstrained dimensional UCT amplitude.*

*Proof.* On the preserved bridge, Corollary N.12.2 gives
$$
\left|\frac{\delta\dot P_b}{\dot P_b^{GR}}\right|
\approx q_{\mathrm{act}}^{\mathrm{orb}}(2.316\times10^{15}).
$$
Imposing a fractional upper bound $10^{-5}$ and dividing by the positive coefficient gives
$$
q_{\mathrm{act}}^{\mathrm{orb}}
<\frac{10^{-5}}{2.316\times10^{15}}
=4.31779\times10^{-21},
$$
which rounds to $4.3\times10^{-21}$. The orbital-phase interpretation uses the assumed acceleration-profile bridge and therefore identifies this bridge parameter only. ∎

## N.9 The UCT as a Strategic Choice Between Intensive and Extensive Knowledge Acquisition

The UCT does not by itself dictate a knowledge-acquisition strategy or establish a common physical origin for the motion and prediction limits. It permits a conditional finite-budget optimization only after a trajectory class, prediction task, response model, active-refresh mechanism, and non-double-counted work ledger have been registered.

1.  **Rindler Response and Sampling:** An ideal detector on an eternally uniformly accelerated worldline has a Rindler horizon and a KMS response characterized by $T_U=\hbar a/(2\pi c k_B)$. This detector-response statement is not a universal ambient thermal bath interacting with every accelerated system. Only on the declared response and refresh branch may the modeled increment enter the predictor's cost ledger. Broad sampling may also include inertial coasting, for which proper acceleration and the Unruh increment vanish.

2.  **The Prediction Coherence Boundary and the Cost of Modeling:** For task classes carrying the certificate $\mathfrak C_{B.2}$, Theorem 14 gives
    $$
    C_{\mathrm{uni}}(PP)
    =
    \Omega\!\left(
    \frac{\log(1/\delta_{\mathrm{SPAP}})}
    {\delta_{\mathrm{SPAP}}^2}
    \right),
    \qquad
    \delta_{\mathrm{SPAP}}
    :=
    \alpha_{\mathrm{SPAP}}-PP.
    $$
    Transfer of this lower bound to the operational predictive complexity $C_P$ or $C_{\mathrm{SPAP}}$ requires the explicit domination bridge of Lemma N.2. No unconditional $C_P$ divergence follows merely by renaming $C_{\mathrm{uni}}$.

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

**Corollary N.3.2 (Conditional Comoving Predictive-Capacity Reduction Under Acceleration).**
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

The Unified Cost of Transgression places two distinct resource effects in one frame-consistent work ledger:

|Domain |Limit |Resource statement |Status |
|--------------|----------------------|-------------------------------------------------------------|---------------|
|**Kinematics**|$v \to c$ |$m_0c^2(\gamma-1)\to\infty$ |standard relativistic input |
|**Prediction**|$PP \to \alpha_{SPAP}$|$C_{\mathrm{uni}}\to\Omega\!\left(\log(1/\delta)/\delta^2\right)$ under $\mathfrak C_{B.2}$ |transfers to $C_P$ only with the bridge of Lemma N.2 |
|**Acceleration coupling**|$a\ne0$ |Unruh–Landauer incremental cost on the registered saturation/activation branch |conditional bridge |

Here $\delta=\alpha_{SPAP}-PP$. The shared laboratory work functional does not make the two limiting operations identical. It says that, when the Unruh response and predictive-refresh bridge are active, acceleration adds a prediction-related cost to the already distinct kinetic and SPAP ledgers.

Equation (N.17) recovers the same $c$ from the saturated Unruh–Landauer formula because that formula imports $c$ through the standard Unruh temperature. It is a consistency calibration, not a derivation of Lorentz causality from SPAP. Theorem 46 supplies only the independent uniform operational speed upper bound. An attained normalized frontier $c=\delta/\tau_{\min}$ requires the separate uniform-weight one-link-attainment branch, and its Lorentzian invariant-speed interpretation requires Corollary 46a and the full Appendix O package.

The coefficient $\lambda_{PM}=\hbar\varepsilon_0/(2\pi c)$ is therefore a dimensional coefficient on a conditional bridge. Its small SI value alone does not establish an observable or microscopic MPU mechanism; an experiment also requires an activation fraction, refresh rate, detector response, background subtraction, and a non-double-counted energy ledger.

## N.11 Inertial Mass as Relational Information

Section N.3 supplied a conditional acceleration–refresh cost on its registered detector-response branch, while Section N.7 proposed—but did not derive—a relational interpretation of motion. The mass construction below is a separate conditional ledger governed by its own $\mathfrak B_{\mathrm{mass}}$ hypotheses. It does not follow from the UCT coefficient or establish a common microscopic origin for acceleration, prediction, and inertia.

### N.11.1 The Relational Ontology of "Being"

In the PU framework, a system $S_{\mathrm{sys}}$ does not exist in isolation. Its identity—its distinction from vacuum fluctuations—consists entirely in the correlations it maintains with its environment $E_{\mathrm{env}}$ across a boundary $\partial S_{\mathrm{sys}}$. These correlations constitute the system's relational information.

**Definition N.6 (Relational Information Content).** The relational information content $\mathcal I_{\mathrm{rel}}(S_{\mathrm{sys}})$ of a system $S_{\mathrm{sys}}$ is the quantum mutual information between $S_{\mathrm{sys}}$ and its environment $E_{\mathrm{env}}$:

$$
\mathcal I_{\mathrm{rel}}(S_{\mathrm{sys}}) := I(S_{\mathrm{sys}}:E_{\mathrm{env}}) = S_{\mathrm{vN}}(\rho_{S_{\mathrm{sys}}}) + S_{\mathrm{vN}}(\rho_{E_{\mathrm{env}}}) - S_{\mathrm{vN}}(\rho_{S_{\mathrm{sys}}E_{\mathrm{env}}})
\tag{N.20}
$$

measured in nats, where $S_{\mathrm{vN}}(\rho):=-\operatorname{Tr}(\rho\ln\rho)$ is the von Neumann entropy [von Neumann 1932] and $\rho_{S_{\mathrm{sys}}E_{\mathrm{env}}}$ is the joint state of the system/environment pair.

This definition connects directly to the interpretation of entanglement as predictive coupling (Proposition 10, Section 8.6): entangled states maximize mutual information $I(A:B)$ relative to individual entropies for given subsystem mixedness, with maximally entangled pure states achieving $I(A:B) = 2S_{\mathrm{vN}}(\rho_A)$. The quantum mutual information $I(S_{\mathrm{sys}}:E_{\mathrm{env}})$ quantifies the total information that $S_{\mathrm{sys}}$ and $E_{\mathrm{env}}$ share about each other [Nielsen & Chuang 2010]—precisely the "predictive coupling" that enables each subsystem to anticipate the other's behavior. The relational information $\mathcal I_{\mathrm{rel}}$ thus measures the total predictive coupling between $S_{\mathrm{sys}}$ and the rest of the network.

**Proposition N.4 (Boundary Channel Saturation on the saturated-boundary branch).** For a system whose system-environment boundary lies on the PCE saturated-boundary branch, the relational information saturates the total channel capacity:

$$
\mathcal{I}_{rel}(S) = N_{\partial} \times C_{\max}
\tag{N.21}
$$

where $N_{\partial}$ is the number of independent ND-RID channels crossing the boundary $\partial S$ (Theorem E.3), and $C_{\max} < \ln d_0$ is the channel capacity per link (Theorem E.2). More generally, a utilization-factor formulation
$$
\mathcal{I}_{rel}(S) = q \cdot N_{\partial} \times C_{\max}, \qquad 0 < q \leq 1,
$$
captures the partial-utilization branch; the canonical saturated-boundary branch used throughout Appendix N corresponds to $q = 1$.


*Proof.* By Theorem E.3, the boundary supports $N_{\partial} = \sigma_{link} \times \mathcal{A}_{\partial}$ independent channels, where $\mathcal{A}_{\partial}$ is the boundary area and $\sigma_{link} = \chi/(\eta\delta^2)$ is the channel density. Each channel carries at most $C_{\max}$ nats of information (Theorem E.2). The total relational information satisfies the channel-capacity upper bound: 

$$
\mathcal{I}_{rel} = \sum_{i=1}^{N_{\partial}} C_i \leq N_{\partial} \times C_{\max}.
$$

PCE optimization drives the system toward maximum utilization of available channel capacity, giving a utilization factor $q \in (0, 1]$ with $\mathcal{I}_{rel} = q \cdot N_{\partial} \cdot C_{\max}$. On the saturated-boundary branch introduced in the statement of this proposition, $q = 1$ and the inequality is saturated:

$$
\mathcal{I}_{rel}(S) = N_{\partial} \times C_{\max}.
$$

The saturated-boundary branch is justified for causal/holographic boundaries by the holographic saturation attractor of Appendix E (Theorem E.8.3.4 and the boundary-encoding PCE minimum of Theorem E.8.3.2). For generic system-environment boundaries, saturation is a branch assumption of this proposition. The throughput-saturated and ideal-packing branches of Lemmas Q.2.2 and Q.2.3 provide compatible conditional saturation inputs, but Theorem Q.6.1 establishes only the temporal scale on a serialized-frontier branch and supplies no global mutual-information optimization theorem. Exact saturation for a generic boundary therefore remains an explicit hypothesis of this proposition. ∎


### N.11.2 Open-System Thermodynamics and the KMS Condition

The modular KMS identity of Theorem G.1.9.5 is a representation statement and does not by itself imply physical processing or a nonzero exchange rate. A physical steady-state exchange claim requires a separately registered open-system activity record.



**Theorem N.4 (Activity-Conditioned Steady-State Exchange Bound).** Assume a registered active boundary channel whose physical-time certificate states that every completed exchange cycle has duration at least $\tau_{\min}>0$. If $r_e$ is its completed-cycle rate, then
$$
0\le r_e\le\frac1{\tau_{\min}}.
$$
Equality holds only on a separately registered saturated-activity branch; relational information, modular KMS status, detailed balance, and Theorem 29 alone prove neither the duration premise, positive activity, nor saturation.

*Proof.*

**Step 1 (Modular representation).** On a faithful active-support state $\rho_a$, Theorem G.1.9.5 supplies the modular automorphism
$$
\sigma_t^{\rho_a}(A)=\rho_a^{it}A\rho_a^{-it}.
\tag{N.22}
$$
This representation identity establishes no physical exchange, activity, or clock-rate identification.

**Step 2 (Physical-realization gate).** Identifying modular flow with the physical `Evolve` process requires a response-active physical-time bridge. On the joint Eq. Q.18 and saturated Proposition Q.6.1 calibration branch, the registered value
$$
\tau_{\min}=\sqrt{8\ln2}\,t_P
\tag{N.23}
$$
is used only when that bridge and its duration certificate are accepted. A duration lower bound does not establish that a cycle occurs.

**Step 3 (Certificate-conditioned steady-state exchange).** Quantum detailed balance supplies reversibility on its stated branch but neither positive activity nor the clock certificate. The per-cycle structural cost likewise proves neither noise nor activity.

**Step 4 (Rate ceiling and saturation).** If $N(T)$ cycles complete in elapsed time $T$, the duration certificate gives $N(T)\tau_{\min}\le T$, hence $r_e=\limsup_{T\to\infty}N(T)/T\le1/\tau_{\min}$. Equality requires the separately registered saturated-activity branch. ∎

**Remark N.4.1: Open vs. Closed Systems.** On a registered active open-system branch, the exchange ledger is compatible with the second law because the environment is included in the total entropy accounting. Theorem N.4 also permits $r_e=0$; it asserts no continuous processing, entropy exchange, or steady-state maintenance outside the active branch.



**Corollary N.4.1 (Entropy-Flow Rate on the Joint Saturated Branch).** On the saturated-boundary branch of Proposition N.4 and the saturated-activity, completed-reset branch of Theorem N.4, the registered entropy-flow ledger is:



$$
\frac{d\mathcal{S}}{d\tau} = \frac{\varepsilon_0 \cdot N_{\partial}}{\tau_{\min}} = \frac{\varepsilon_0 \cdot \mathcal I_{\mathrm{rel}}}{C_{\max} \cdot \tau_{\min}}
\tag{N.24}
$$

*Proof.* Each of $N_{\partial}$ channels exchanges information at rate $1/\tau_{\min}$. Each exchange contributes $\varepsilon_0$ only to the declared structural ledger. Physical heat requires registered reset records and is bounded by their $H_q(P\mid R)$ values. On the saturated-boundary branch of Proposition N.4, $N_{\partial} = \mathcal I_{\mathrm{rel}}/C_{\max}$. Substituting:

$$
\frac{d\mathcal{S}}{d\tau} = N_{\partial} \times \frac{\varepsilon_0}{\tau_{\min}} = \frac{\mathcal I_{\mathrm{rel}}}{C_{\max}} \times \frac{\varepsilon_0}{\tau_{\min}}.
$$

At the PCE-optimal operating point, Equation E.15 gives $C_{\max}=2\ln2$. On the joint saturated-boundary/activity completed-reset branch:



$$
\frac{d\mathcal{S}}{d\tau} = \frac{\mathcal I_{\mathrm{rel}}}{2\tau_{\min}}.
\tag{N.25}
$$

On a partial-utilization branch with utilization factor $q < 1$, the rate becomes $\mathcal I_{\mathrm{rel}}/(2q\tau_{\min})$, scaling the mass-information coefficient in Theorem N.5 by $1/q$. ∎

**Corollary N.4.2 (Off-Branch Entropy-Flow Residual Decomposition at Saturated Activity).** On the saturated-activity completed-reset branch, suppose SPAP/Landauer admissibility is preserved but one or more of saturated-boundary utilization, a physical-equilibrium certificate, or overhead-free Landauer-saturating implementation fails. Let $q\in(0,1]$ be the retained boundary-utilization factor, and let $\sigma_{\mathrm{KMS}}\ge0$ and $\sigma_{\mathrm{oh}}\ge0$ be separately registered entropy-rate defects. Define
$$
\mathcal R_N
:=
\dot\varepsilon_{\mathrm{pred}}
-
\frac{\mathcal I_{rel}}{2\tau_{min}},
\tag{N.25a}
$$
and
$$
\Delta_q
:=
\frac{\mathcal I_{rel}}{2\tau_{min}}
\left(\frac1q-1\right).
\tag{N.25b}
$$
Then
$$
\boxed{
\mathcal R_N
=
\Delta_q+\sigma_{\mathrm{KMS}}+\sigma_{\mathrm{oh}}
\ge0,
\qquad 0<q\le1.
}
\tag{N.25c}
$$
Equality holds exactly on the joint saturated-activity/boundary, physically certified equilibrium, overhead-free branch.

*Proof.* At fixed retained relational content, the partial-utilization rate is $\mathcal I_{rel}/(2q\tau_{min})$ on the saturated-activity branch. Subtracting the $q=1$ value gives $\Delta_q\ge0$. The term $\sigma_{\mathrm{KMS}}$ is a separately registered nonnegative excess-production coordinate relative to the accepted physical-equilibrium reference; quantum detailed balance does not make arbitrary relaxation production vanish. The retained implementation overhead is recorded by $\sigma_{\mathrm{oh}}\ge0$. Adding the three nonnegative entries gives (N.25c), with equality exactly when all vanish. ∎

**Remark N.4.2.1 (Operational Signature).** The decomposition (N.25c) is a branch ledger, not an additional universal saturation claim:

$$
\mathcal R_N=0
\quad\text{on the joint saturated-activity/boundary, physically certified equilibrium, overhead-free branch},
\qquad
\mathcal R_N>0
\quad\text{when any retained deficit is present}.
$$

Thus the three entries $(\Delta_q,\sigma_{\mathrm{KMS}},\sigma_{\mathrm{oh}})$ refine the $1/q$ rescaling of Corollary N.4.1 by separating utilization, equilibrium, and implementation contributions.



### N.11.3 The Mass-Information Identity

**Theorem N.5 (Mass-Information Equivalence on the Joint Saturated-Boundary/Activity and Action--Entropy Branch).** On the saturated-boundary branch of Proposition N.4, the saturated-activity completed-reset branch of Theorem N.4, and the accepted action--entropy bridge of Corollary Q.0.1, the mass-information ledger assigns a system with relational information content $\mathcal I_{rel}$ the inertial mass
$$
\boxed{
m
=
\frac{\mathcal I_{rel}}{2\sqrt{8\varepsilon_0}}m_P
=
\frac{\mathcal I_{rel}}2\frac{L_P}{\delta}m_P
\approx0.212\,\mathcal I_{rel}m_P.
}
\tag{N.26}
$$
Here $\varepsilon_0=\ln2$, $\delta=\sqrt{8\ln2}\,L_P$, and $m_P=\sqrt{\hbar c/G}$. If saturated activity is retained while boundary utilization is $q<1$, the coefficient rescales by $1/q$; no absolute coefficient is asserted for unsaturated activity without an additional activity coordinate.

**Remark N.5.1 (Branch Dependence and Interaction with Leech Norm-Information Calibration).** Let $\mathfrak B_{mass}$ denote the joint saturated-boundary, saturated-activity completed-reset, and accepted action--entropy branch. The coefficient in (N.26) is physical only on $\mathfrak B_{mass}$. A separate canonical Leech norm--information certificate supplies $\mathcal I_{rel}(v)=\gamma|v|$ with canonical value $\gamma=1$. Absolute predictions, including the conditional mass gap $\Delta_{gap}=2\mu_0^{alg}$ and algebraic normalization $\mu_0^{alg}\approx0.212m_P$, require both $\mathfrak B_{mass}$ and $\gamma=1$; dimensionless ratios are independent of common $q$ and $\gamma$ rescalings.

*Proof.*

**Step 1 (Conditional action--entropy calibration).** Assume the independent calibration $\kappa_A=\hbar$ and a recovery sequence carrying the additive history ledger, as required by Corollary Q.0.1. On that branch,

$$
\frac{\mathcal{S}_{action}}{\hbar} = \sum_{\text{cycles}} \varepsilon_i.
\tag{N.27}
$$

Theorem Q.0.1 supplies Γ-convergence only after an action scale $\kappa_A>0$ is independently supplied; it does not derive $\kappa_A=\hbar$. Equation (N.27) is therefore a calibrated representation connecting the mechanical action ledger to the dimensionless additive history ledger, not a consequence of Γ-convergence alone.

**Step 2 (Rest action magnitude).** A system at rest with mass $m$ has rest energy $E = mc^2$ [Einstein 1905b]. Over proper time $\tau$, the magnitude of the accumulated action is:

$$
|\mathcal{S}_{rest}| = E \cdot \tau = mc^2\tau
\tag{N.28}
$$

The standard relativistic free-particle action carries a minus sign: $\mathcal{S} = -mc^2\int d\tau$. On its calibrated branch, Corollary Q.0.1 relates the action magnitude to the additive history ledger. Lorentzian signature is a separate conditional conclusion of Appendix O: Theorems O.7a–O.7b and Corollary O.7b.1 require a positive-definite spatial Γ-limit, an entropy-selected time orientation, a second-order continuum principal symbol, and a nondegenerate attained characteristic cone. Temporal irreversibility alone does not produce the signature $(-,+,+,+)$.

**Step 3 (Entropy flow).** On the joint saturated-boundary/activity completed-reset branch of Corollary N.4.1, the entropy flowing to the environment over proper time $\tau$ is:



$$
\sum_{\text{cycles}} \varepsilon_i = \frac{d\mathcal{S}}{d\tau} \times \tau = \frac{\mathcal{I}_{rel} \cdot \tau}{2\tau_{min}}
\tag{N.29}
$$

**Step 4 (Equating via Action-Entropy Identity).** Applying Equation (N.27):

$$
\frac{mc^2\tau}{\hbar} = \frac{\mathcal{I}_{rel} \cdot \tau}{2\tau_{min}}
$$

The proper time $\tau$ cancels. Solving for $m$:

$$
m = \frac{\hbar \cdot \mathcal{I}_{rel}}{2c^2 \cdot \tau_{min}}
\tag{N.30}
$$

**Step 5 (Substituting the conditional discretization scale).** On the joint Eq. Q.18 and saturated Proposition Q.6.1 calibration branch:

$$
\tau_{min} = \sqrt{8\varepsilon_0} \cdot t_P = \sqrt{8\varepsilon_0} \cdot \frac{\hbar}{m_P c^2}
$$

Therefore:

$$
m = \frac{\hbar \cdot \mathcal{I}_{rel}}{2c^2} \times \frac{m_P c^2}{\sqrt{8\varepsilon_0} \cdot \hbar} = \frac{\mathcal{I}_{rel}}{2\sqrt{8\varepsilon_0}} \cdot m_P
$$

**Step 6 (Numerical evaluation).** With $\varepsilon_0=\ln2$:

$$
\frac{1}{2\sqrt{8\varepsilon_0}} = \frac{1}{2\sqrt{8\ln 2}} \approx \frac{1}{4.71} \approx 0.212
$$

Therefore:

$$
m \approx 0.212 \cdot \mathcal{I}_{rel} \cdot m_P
\tag{N.31}
$$

where $\mathcal{I}_{rel}$ is measured in nats and $m_P \approx 2.18 \times 10^{-8}$ kg. ∎

**Corollary N.5.1 (Rest Energy as Information Maintenance on $\mathfrak B_{mass}$).** The rest energy $E = mc^2$ is the proper-time action-rate, equivalently the energy, assigned on $\mathfrak B_{mass}$:

$$
E = mc^2 = \frac{\hbar \cdot \mathcal{I}_{rel}}{2\tau_{min}}
= \frac{\mathcal{I}_{rel}}{2\sqrt{8\varepsilon_0}}\,E_P,
\qquad\text{on the joint Eq. Q.18, saturated Proposition Q.6.1, and }\mathfrak B_{\mathrm{mass}}\text{ branch.}
\tag{N.32}
$$

where $E_P = m_P c^2 \approx 1.96 \times 10^9$ J is the Planck energy.

*Proof.* Theorem N.5 gives
$$
m=\frac{\hbar\mathcal I_{rel}}{2c^2\tau_{min}}.
$$
Multiplication by $c^2$ yields
$$
E=mc^2=\frac{\hbar\mathcal I_{rel}}{2\tau_{min}}.
$$
Using $\tau_{min}=\sqrt{8\varepsilon_0}\,t_P$ and $E_P=\hbar/t_P=m_Pc^2$ gives
$$
E
=\frac{\hbar\mathcal I_{rel}}{2\sqrt{8\varepsilon_0}\,t_P}
=\frac{\mathcal I_{rel}}{2\sqrt{8\varepsilon_0}}E_P,
$$
which is Equation (N.32). ∎

**Remark N.5.1a (Energy as Proper-Time Action Rate).** Equation (N.32) is dimensionally an energy statement, not an independent power law. Since $\hbar$ has units of action and $\tau_{min}$ has units of time,
$$
\frac{\hbar\mathcal{I}_{rel}}{2\tau_{min}}
$$
has units of action per proper time, i.e. energy. The framework therefore identifies rest energy with the saturated proper-time rate at which relational action must be carried by the system's maintained predictive relations. Multiplying or dividing by an additional external duration would give work or power for a process; Corollary N.5.1 itself gives the rest-energy/action-rate assigned to the maintained state.

**Corollary N.5.2 (Mass-Branch Action--Entropy--Heat Rate Ledger).** On $\mathfrak B_{mass}$, with an accepted physical-equilibrium certificate and overhead-free Landauer-saturating refresh at effective temperature $T_{eff}$, define



$$
\mathcal E_{act}
:=
\left|\frac{d\mathcal S_{action}}{d\tau}\right|.
$$

Then

$$
\boxed{
\mathcal E_{act}
=
\hbar\dot\varepsilon_{\mathrm{pred}}
=
\frac{\hbar}{k_B T_{eff}}\dot Q_{\mathrm{Land}}
=
\frac{\hbar\mathcal{I}_{rel}}{2\tau_{min}}
=
mc^2.
}
\tag{N.32a}
$$

Equivalently,

$$
\boxed{
\dot\varepsilon_{\mathrm{pred}}
=
\frac{\mathcal{I}_{rel}}{2\tau_{min}},
\qquad
\dot Q_{\mathrm{Land}}
=
k_B T_{eff}\frac{\mathcal{I}_{rel}}{2\tau_{min}},
\qquad
\mathcal E_{act}
=
\hbar\frac{\mathcal{I}_{rel}}{2\tau_{min}}.
}
\tag{N.32b}
$$

*Proof.* Corollary Q.0.1 gives the action-entropy identity $\mathcal S_{action}/\hbar=\sum_i\varepsilon_i$. Taking the magnitude of the proper-time derivative on the retained ledger gives $|d\mathcal S_{action}/d\tau|=\hbar\dot\varepsilon_{\mathrm{pred}}$. On $\mathfrak B_{mass}$, Corollary N.4.1 gives $\dot\varepsilon_{\mathrm{pred}}=\mathcal I_{rel}/(2\tau_{min})$.

 Landauer-saturating refresh gives $\dot Q_{\mathrm{Land}}=k_B T_{eff}\dot\varepsilon_{\mathrm{pred}}$. Corollary N.5.1 gives $mc^2=\hbar\mathcal{I}_{rel}/(2\tau_{min})$. Combining these identities gives (N.32a) and (N.32b). ∎

**Remark N.5.2a (Off-Branch Rate Residual).**

On a saturated-activity branch where boundary utilization, the physical-equilibrium certificate, or overhead-free Landauer implementation fails, Corollary N.4.2 supplies the registered residual $\mathcal R_N\ge0$. Unsaturated activity requires a separate signed activity coordinate and carries no unconditional nonnegative-$\mathcal R_N$ conclusion.



### N.11.4 Resolution of the Origin of Inertia

**Theorem N.6 (Inertia as Relational Update Resistance).** On $\mathfrak B_{mass}$ of Theorem N.5, the inertial mass $m$ quantifies the registered thermodynamic cost of updating a system's relational state.



*Proof.*

**Step 1 (Position as relational pattern).** From Section N.7.1, a system's "position" is not a point in pre-existing space but an emergent property defined by its pattern of predictive relationships with the network. Let $\mathcal{P}(S) = \{\rho_{S,E_i}\}$ denote the set of correlations between $S$ and environmental subsystems $\{E_i\}$.

**Step 2 (Motion as pattern evolution).** "Motion" is the continuous evolution of this relational pattern. A displacement $\Delta x$ corresponds to updating the correlations: $\mathcal{P}(S) \to \mathcal{P}'(S)$.

**Step 3 (Acceleration as thermodynamic overhead).** On the joint saturated-boundary/activity completed-reset branch, Corollary N.4.1 gives the registered rate $d\mathcal S/d\tau=\mathcal I_{rel}/(2\tau_{min})$.



**Step 4 (Unruh-induced predictive power for relational maintenance).** The Unruh-induced incremental power required to maintain the relational state is therefore

$$
P_{UCT}(a)=k_B T_U(a)\,\frac{d\mathcal{S}}{d\tau}
=\frac{\hbar a}{2\pi c}\cdot\frac{\mathcal{I}_{rel}}{2\tau_{\text{min}}}.
$$

**Step 5 (Conditional proportionality identity).** Using Theorem N.5 in the equivalent form
$$
m=\frac{\hbar}{2c^2\tau_{\min}}\mathcal I_{rel},
$$
the saturated-refresh branch gives
$$
P_{UCT}(a)=\frac{c}{2\pi}ma.
$$
This is an algebraic identity between the mass coefficient already accepted on $\mathfrak B_{mass}$ and the stipulated Landauer-Unruh refresh ledger. With an active-refresh fraction $q_{\mathrm{act}}$, it becomes
$$
P_{UCT}(a)=q_{\mathrm{act}}\frac{c}{2\pi}ma.
$$
The relation concerns a modeled dissipation cost, not Unruh radiation power or a force law.

**Step 6 (Scope of the inertial interpretation).** On $\mathfrak B_{mass}$, $m$ is already the coefficient in
$$
S_{\mathrm{free}}=-mc^2\int d\tau.
$$
The calculation above shows that the same accepted coefficient appears in the saturated refresh-power identity. It supplies a relational thermodynamic interpretation of the inertial parameter, but no independent derivation that the thermodynamic coefficient equals the mechanical inertial coefficient. ∎

**Remark N.11.1: Resolution of Mach's Principle.** Mach [1883] proposed that inertia arises from interaction with distant matter, but provided no mechanism. Theorem N.6 quantifies this intuition: a system's inertia is proportional to its relational information $\mathcal{I}_{rel}$, which encodes correlations with the entire network. The "distant stars" contribute insofar as they are correlated with the system. A hypothetical system with $\mathcal{I}_{rel} = 0$ would have zero mass—but such a system would possess no correlations with any environment and would be operationally indistinguishable from vacuum. The Machian principle is thus realized: mass is constitutively relational, not an intrinsic property.

### N.11.5 The Weak Equivalence Principle

**Theorem N.7 (Weak Equivalence Principle from a Common Ledger on $\mathfrak B_{mass}$).** On the mass branch $\mathfrak B_{mass}$ of Theorem N.5, let simple systems share the same retained entropy-to-inertia and stress-energy source normalization. Then $m_I=m_G$ because both coefficients descend from the same relational-information ledger. Simplicity alone does not establish the branch or the common normalization.



*Proof.*

**Step 1 (Inertial mass).** On $\mathfrak B_{mass}$, Theorem N.5 gives:

$$
m_I = \frac{\mathcal{I}_{rel}}{2\sqrt{8\varepsilon_0}} \cdot m_P
$$

This is the mass appearing in Newton's second law $F = m_I a$, derived from the entropy cost of updating relational information.

**Step 2 (Gravitational mass from stress-energy).** The stress-energy tensor $T_{\mu\nu}^{(MPU)}$ (Definition B.8, Appendix B) sources spacetime curvature via Einstein's equations (Theorem 50):

$$
R_{\mu\nu} - \frac{1}{2}Rg_{\mu\nu} + \Lambda g_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu}^{(MPU)}
$$

In the rest frame of a localized system, $T_{00} = \rho c^2$ where $\rho = m_G/V$ is the gravitational mass density.

**Step 3 (Stress-energy from predictive processing).** From the construction in Appendix B (Theorem B.4), the stress-energy tensor is the coarse-grained expectation value:

$$
T_{\mu\nu}^{(MPU)}(x) = \omega(\hat{\Theta}_{\mu\nu}(x))
$$

On $\mathfrak B_{mass}$, the registered contribution to $T_{00}$ arises from the same operational ledger. Corollary N.5.1 gives:



$$
E = \frac{\hbar \cdot \mathcal{I}_{rel}}{2\tau_{min}}
$$

**Step 4 (Identity for simple systems).** For systems without high internal complexity ($C_{agg} \leq C_{op}$, Definition 30), assume the common source/response quotient ledger stated in the theorem. Then both $m_I$ and $m_G$ are projections of the same $\mathfrak B_{mass}$ coefficient:

 Both $m_I$ (from action accounting) and $m_G$ (from stress-energy sourcing) derive from the energy required to maintain $\mathcal{I}_{rel}$:

$$
m_I = m_G = m = \frac{\mathcal{I}_{rel}}{2\sqrt{8\varepsilon_0}} \cdot m_P
$$

∎

**Corollary N.7.1 (Universality of Free Fall on the Common-Ledger Branch).** Bodies satisfying Theorem N.7's common $\mathfrak B_{mass}$ ledger have the same test-body acceleration because $m_I=m_G$ on that branch.



*Proof.* Gravitational acceleration $g = -\nabla\Phi$ is determined by the total stress-energy distribution. For a test body, $F = m_G g$ and $a = F/m_I = (m_G/m_I)g = g$. The ratio $m_G/m_I = 1$ (Theorem N.7) ensures universality. ∎

This result is consistent with experimental tests of the weak equivalence principle, which constrain violations to the level of $|\eta| < 10^{-14}$ [Will 2014; Touboul et al. 2017].


### N.11.5a The Equivalence Principle as Universal ND-RID Coupling

Theorem N.7 establishes $m_I=m_G$ for simple systems only on the common $\mathfrak B_{mass}$ source/response ledger; simplicity alone is insufficient.



### N.11.5a.1 The Data Processing Inequality

**Definition N.11.1 (Distinguishability Monotone).** A distinguishability monotone $\mathcal{M}$ is a function on pairs of quantum states satisfying:

$$
\mathcal{M}(\mathcal{E}(\rho), \mathcal{E}(\sigma)) \leq \mathcal{M}(\rho, \sigma)
$$

for all CPTP maps $\mathcal{E}$ and all density operators $\rho, \sigma$. Examples include the trace distance $D_{tr}(\rho, \sigma) = \frac{1}{2}\|\rho - \sigma\|_1$, the relative entropy $S(\rho \| \sigma) = \mathrm{tr}(\rho \ln \rho - \rho \ln \sigma)$ when $\text{supp}(\rho) \subseteq \text{supp}(\sigma)$, quantum fidelity-derived measures [Uhlmann 1976; Jozsa 1994], and generalized relative entropy monotones [Petz 1986; Ruskai 1994].

**Theorem N.10 (ND-RID Data Processing and Refresh-Branch Contractivity).** The 'Evolve' channel $\mathcal{E}_N$ implementing ND-RID dynamics (Definition 27) is CPTP and therefore satisfies the data processing inequality with non-expansive trace-distance factor $0\le f_{RID}\le1$. On refresh/minorization branches satisfying Lemma E.1 it is strictly contractive:

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
Consequently, if $f_r=f_s$ for all matter sectors and internal quantum preparations at the same coarse-graining scale, no equivalence-principle deviation can arise from quantum coherence, superposition, mixture, or entanglement through the DPI channel alone. On the non-compensation branch of Theorem N.11, any DPI-mediated Eötvös signal must be sourced by sector-dependent contractivity.

*Proof.* The first inequality is the assumed trace-distance contractivity divided by the positive number $D_{tr}(\rho,\sigma)$. Nonnegativity follows from nonnegativity of trace distance. The budget-difference identity is algebraic:
$$
|f_rD-f_sD|=|f_r-f_s|D,
\qquad
D:=D_{tr}(\rho,\sigma).
$$
The density-operator domain includes pure states, mixed states, coherent superpositions, and reduced states of entangled systems, so the same bound applies to all such internal preparations. If all sectors share the same value $f$, the DPI contraction budget is universal and cannot distinguish matter composition or internal quantum preparation. The final statement is exactly the converse direction of Theorem N.11 restricted to the non-compensation branch. ∎

### N.11.5a.2 Retained-Ledger Equivalence and Refresh-Branch DPI

The equivalence principle asserts that all matter couples to gravity universally—inertial and gravitational mass are identical. Within the PU framework, this universality emerges from the universality of the retained ND-RID coupling ledger: the same finite-transfer, entropy-flow, and stress-energy maps apply to all simple matter sectors at the same coarse-graining scale. Strict contractivity $f_{RID}<1$ is a refresh/minorization subbranch of this ledger, not the sole source of gravitational universality. The same statement gives a sharper separation principle: equivalence-principle behavior belongs to response channels whose source and response descend to one common retained ledger on the chosen probe class; response channels with retained charge, representation, material, preparation, or constitutive labels are sector-selective unless those labels are PPI-null or restricted to a constant-ratio subprobe class.

**Definition N.11.0 (Retained ND-RID Coupling Ledger).** For a simple matter sector $\mathfrak S_{\mathrm{mat}}$ at a specified coarse-graining scale, the retained ND-RID coupling ledger is the finite list of branch-defined data
$$
\lambda(\mathfrak S_{\mathrm{mat}})
=
\bigl(C_{\max}(\mathfrak S_{\mathrm{mat}}),\ \Sigma(\mathfrak S_{\mathrm{mat}}),\ T_{\mu\nu}^{(\mathrm{src})}(\mathfrak S_{\mathrm{mat}}),\ f_{RID}(\mathfrak S_{\mathrm{mat}})|_{\mathrm{ref}}\bigr)
$$
consisting of:
1. the reset-support per-link capacity datum $C_{\max}(\mathfrak S_{\mathrm{mat}})$ (Proposition E.2a);
2. the entropy-flow normalization $\Sigma(\mathfrak S_{\mathrm{mat}})$ entering Theorem N.7 (the per-cycle entropy-production-to-relational-information map);
3. the stress-energy source coefficients $T_{\mu\nu}^{(\mathrm{src})}(\mathfrak S_{\mathrm{mat}})$ entering the Appendix B stress-energy construction;
4. the refresh-branch contraction datum $f_{RID}(\mathfrak S_{\mathrm{mat}})$ when present, which is undefined off refresh/minorization subbranches.

The ledger is universal across sectors when each entry is sector-independent at the same coarse-graining scale.

**Definition N.11.0a (Retained Response Ledger and Equivalence Ratio).** Fix a retained effective response channel $\mathcal R$ on a fixed branch and coarse-graining scale $\mu$, and let $\mathfrak P_{\mathcal R}$ be the probe class on which that channel is being tested. For each retained probe $P\in\mathfrak P_{\mathcal R}$, let $I_{\mathcal R}(P)>0$ be the kinematic or state-update response coefficient and let $Q_{\mathcal R}(P)$ be the coefficient multiplying the channel source, gradient, curvature, holonomy, or constitutive drive in the first nonzero retained finite response. The equivalence ratio of the channel is
$$
\Xi_{\mathcal R}(P)
:=
\frac{Q_{\mathcal R}(P)}{I_{\mathcal R}(P)}.
$$
The channel is equivalence-principle-bearing on $\mathfrak P_{\mathcal R}$ when $\Xi_{\mathcal R}(P)$ is constant on $\mathfrak P_{\mathcal R}$ after the PPI quotient. It is constitutive/sector-selective when $\Xi_{\mathcal R}$ depends on a retained matter, representation, preparation, material, or constitutive label whose variation changes a finite protocol response.

**Definition N.11.0b (Metric-Universal Ledger).** A response channel $\mathcal R$ is metric-universal on $\mathfrak P_{\mathcal R}$ when all three conditions hold at the same coarse-graining scale:
1. every retained probe in $\mathfrak P_{\mathcal R}$ reconstructs the same operational metric $g_{\mu\nu}$ in the sense of Corollary 46e;
2. there is a single scalar retained ledger $L(P)$ and fixed branch normalizations $\alpha_{\mathcal R},\beta_{\mathcal R}$, independent of $P$, such that
$$
Q_{\mathcal R}(P)=\alpha_{\mathcal R}L(P),
\qquad
I_{\mathcal R}(P)=\beta_{\mathcal R}L(P);
$$
3. any proposed species-dependent metric, source coefficient, or response coefficient is either PPI-null or belongs to a separate finite-response branch with its own certificate.

For the simple gravitational branch on $\mathfrak B_{mass}$, $L(P)$ is the joint saturated-boundary/activity completed-reset and action--entropy relational-information mass ledger of Theorem N.5



**Theorem N.11a (Equivalence–Constitutive Separation Law).** Fix a retained response channel $\mathcal R$ at a fixed coarse-graining scale, and assume all compared probes are evaluated inside the same branch and PPI quotient.

(a) If $\mathcal R$ is metric-universal on $\mathfrak P_{\mathcal R}$, then $\mathcal R$ is equivalence-principle-bearing on $\mathfrak P_{\mathcal R}$.

(b) If a retained sector, representation, preparation, material, or constitutive label changes $\Xi_{\mathcal R}$ on the non-compensation branch, then $\mathcal R$ is not equivalence-principle-bearing on the full probe class. It may be equivalence-principle-bearing only on a restricted subprobe class where $\Xi_{\mathcal R}$ is constant.

(c) Conversely, on the non-compensation branch, if $\mathcal R$ is equivalence-principle-bearing on $\mathfrak P_{\mathcal R}$, then every retained source/response variation is either a common branch normalization, PPI-null, or restricted to a constant-ratio subprobe class. Hence equivalence-principle behavior is the signature of a common source/response quotient ledger, not of emergence by itself.

*Proof.*

**Step 1 (Finite-response quotient).** By Definition N.11.0a, the first nonzero retained response of a probe $P$ to the same external channel drive $X_{\mathcal R}$ has the quotient form
$$
I_{\mathcal R}(P)\,A_{\mathcal R}(P)
=
Q_{\mathcal R}(P)\,X_{\mathcal R},
\qquad
A_{\mathcal R}(P)=\Xi_{\mathcal R}(P)X_{\mathcal R},
$$
where $A_{\mathcal R}$ denotes the measured response coordinate: acceleration for a force-like test, phase/holonomy shift for an internal connection test, or the corresponding finite protocol-response coordinate for a constitutive channel. Equality of responses for all probes under the same drive is therefore equivalent to constancy of $\Xi_{\mathcal R}$ on the retained probe class.

**Step 2 (Metric-universal channels).** If $\mathcal R$ is metric-universal, Definition N.11.0b gives
$$
\Xi_{\mathcal R}(P)
=
\frac{\alpha_{\mathcal R}L(P)}{\beta_{\mathcal R}L(P)}
=
\frac{\alpha_{\mathcal R}}{\beta_{\mathcal R}},
$$
which is independent of $P$. Thus the response is universal on $\mathfrak P_{\mathcal R}$. For gravity on the simple common-ledger $\mathfrak B_{mass}$ branch, Theorem N.7 gives $\alpha_{\mathcal R}=\beta_{\mathcal R}$



**Step 3 (Retained constitutive or sector labels).** Suppose a retained label $z(P)$ changes $\Xi_{\mathcal R}$. Then there exist probes $P_1,P_2$ in the same branch with
$$
\Xi_{\mathcal R}(P_1)\ne\Xi_{\mathcal R}(P_2).
$$
For any drive $X_{\mathcal R}$ not in the response-null set, Step 1 gives different finite responses. The label is therefore not PPI-null. On the non-compensation branch no other retained source or response term cancels this difference, so the channel fails the equivalence-principle criterion on the full probe class. If one restricts to a subprobe class on which $\Xi_{\mathcal R}$ is constant, the same algebra gives a restricted equivalence principle for that subprobe class only.

**Step 4 (Converse).** Assume $\mathcal R$ is equivalence-principle-bearing on $\mathfrak P_{\mathcal R}$ and work on the non-compensation branch. Step 1 forces $\Xi_{\mathcal R}$ to be constant after the PPI quotient. Any retained variation that changes $Q_{\mathcal R}/I_{\mathcal R}$ would contradict that constancy by Step 3. Therefore every retained variation is either a common normalization multiplying both source and response, PPI-null, or confined to a restricted constant-ratio class. This is exactly descent to a common source/response quotient ledger on the tested probe class. ∎

**Corollary N.11a.1 (Gravity/Gauge/Constitutive Classification).** On the simple gravitational common-ledger $\mathfrak B_{mass}$ branch:

1. gravity is metric-universal because the source-to-response ratio is common to all probes in the branch;
2. gauge response is sector-selective because changing a non-null charge or representation changes the Wilson or connection response; and
3. a constitutive response obeys an equivalence principle only on a restricted probe class on which its retained material or preparation label leaves the source-to-response ratio constant.

*Proof.* The gravitational statement is Theorem N.7, Corollary 46e, and Theorem 12.3 applied to Definition N.11.0b. The gauge statement follows from Definition G.4.1 and Corollary G.4b.1. The constitutive statement is Step 3 of Theorem N.11a with $z$ equal to the material or preparation datum. ∎

**Remark N.11a.2 (Emergence Is Not the Equivalence Criterion).** The binary enforced by PU is not emergent versus irreducible. The enforced binary is metric-universal/common-ledger versus sector-selective/constitutive-ledger. A hydrodynamic or material medium can be emergent while carrying retained constitutive parameters; it is then not equivalence-principle-bearing on the full probe class. If a restricted excitation family reconstructs a common effective metric, the equivalence principle holds only inside that excitation family and only at the coarse-graining scale where the effective metric and constant equivalence ratio are certified.

**Theorem N.11 (Equivalence Principle from Universal ND-RID Coupling on $\mathfrak B_{mass}$; Converse on the Non-Compensation Branch).**

 Let $\mathcal{S}_1$ and $\mathcal{S}_2$ be two simple systems (with $C_{agg}\le C_{op}$, Definition 30) composed of different matter types.

(Sufficient direction.) If both systems instantiate the same retained ND-RID coupling ledger at the same coarse-graining scale — including the same reset-support capacity budget, entropy-flow normalization, and stress-energy source map — then on the joint $\mathfrak B_{mass}$ completed-reset and action--entropy branch the weak equivalence principle $(m_I/m_G)_1=(m_I/m_G)_2=1$ holds.



(Converse, on the non-compensation branch.) On the additional branch under which sector-dependent variations in any retained ND-RID coupling datum are not compensated by other sector-dependent terms in the entropy-flow / stress-energy map, such variations generically induce matter-dependent corrections to $m_I/m_G$ and therefore EP violations. Refresh-branch variations in $f_{RID}$ are one possible source of such deviations, but not the only one. Off the non-compensation branch, sector-dependent terms may cancel in the ratio $m_I/m_G$ and leave EP intact.


*Proof.*

**Step 1 (Inertial mass from entropy flow).** By Theorem N.5, inertial mass arises from the entropy cost of maintaining relational information:

$$
m_I = \frac{\mathcal{I}_{rel}}{2\sqrt{8\varepsilon_0}} \cdot m_P
$$

The entropy flow rate (Corollary N.4.1) depends on the channel capacity $C_{\max}$, which is bounded by contractivity (Theorem E.2):

$$
C_{\max}(f_{RID}) < \ln d_0
$$

**Step 2 (Gravitational mass from stress-energy).** By Theorem N.7 Step 3, gravitational mass arises from the stress-energy tensor $T_{\mu\nu}^{(MPU)}$, which encodes the operational costs of maintaining predictive states. These costs are determined by the same ND-RID channel structure.

**Step 3 (Universal retained coupling ledger implies universal coupling).** The retained ND-RID coupling ledger (Definition 27, Proposition E.2a, Theorem E.6, and the stress-energy construction of Theorem N.7) is determined by the fundamental MPU dynamics, which are matter-independent by construction on the simple-system branch. Suppose this retained ledger is universal across matter types. Then:
- the reset-support capacity budget entering the boundary entropy density is universal;
- the entropy-flow normalization is universal;
- the stress-energy source map is universal;
- refresh-branch contraction data, when present, are universal as part of the same ledger.

Therefore the entropy flow rate $d\mathcal S/d\tau$ depends only on the relational information $\mathcal I_{rel}$ and not on matter type, and both $m_I$ and $m_G$ reduce to the same function of $\mathcal I_{rel}$. By Theorem N.7, this yields $m_I=m_G$ for all simple matter types on the common-ledger $\mathfrak B_{mass}$ branch.



**Step 4 (Converse on the non-compensation branch).** Suppose a retained ND-RID coupling datum differs between matter sectors. This may be a reset-support capacity datum, an entropy-flow normalization, a stress-energy source coefficient, or, on refresh/minorization branches, a contractivity factor $f_{RID}^{(i)}$. At fixed $\mathcal I_{rel}$, the corresponding entropy-flow or stress-energy maps acquire sector-dependent contributions. On the non-compensation branch — under which these sector-dependent contributions are not exactly offset by matching sector-dependent terms elsewhere in the stress-energy or relational-information maps — the ratio $m_I/m_G$ acquires matter-dependent corrections, contradicting universal EP. Off the non-compensation branch, sector-dependent terms can in principle cancel between numerator and denominator of $m_I/m_G$, leaving EP undetected.

Therefore, on the non-compensation branch, EP holds if and only if the retained ND-RID coupling ledger is universal. ∎


**Corollary N.11.1 (EP Violations as First-Principles Coupling-Ledger Deviations).** Use the standard Eötvös convention of Theorem N.8.2,
$$
\eta_{AB}:=
2\frac{\lvert a_A-a_B\rvert}{a_A+a_B}
=
\left\lvert
\frac{m_G(A)}{m_I(A)}
-
\frac{m_G(B)}{m_I(B)}
\right\rvert
+O(\delta_A^2+\delta_B^2),
$$
where $\delta_S:=m_G(S)/m_I(S)-1$ is evaluated on the same finite-response branch and after the PPI quotient.

On the minimal residual-budget saturation subbranch of the saturated-boundary simple-system branch, define the first-principles baseline
$$
C_{\max}^*=\ln d_0-\ln2=2\ln2,
\qquad
\Sigma_*:=\frac{\varepsilon_0}{C_{\max}^*}=\frac12,
\qquad
m_0(S):=\frac{\hbar\mathcal I_{rel}(S)}{2c^2\tau_{\min}}.
$$
Here $d_0=8$ and $\varepsilon_0=\ln2$ on the minimal MPU branch. Let
$$
\lambda_C(S):=\frac{C_{\max}(S)}{C_{\max}^*},
\qquad
\lambda_\Sigma(S):=\frac{\Sigma(S)}{\Sigma_*},
\qquad
\Theta_T(S):=\frac{m_G(S)}{m_0(S)}
$$
be the reset-support capacity coordinate, entropy-flow normalization coordinate, and normalized stress-source coordinate. On the saturated entropy-flow branch these are not independent: Corollary N.4.1 gives $\Sigma(S)=\varepsilon_0/C_{\max}(S)$, hence
$$
\lambda_\Sigma(S)=\lambda_C(S)^{-1}.
$$
Therefore a first-order ledger expansion must choose either $\lambda_C$ or $\lambda_\Sigma$ as the independent inertia-side coordinate, but not both.

On the source-uncompensated branch the explicit mass maps are
$$
m_I(S)=m_0(S)\lambda_\Sigma(S)=m_0(S)\lambda_C(S)^{-1},
\qquad
m_G(S)=m_0(S)\Theta_T(S),
$$
so
$$
\frac{m_G(S)}{m_I(S)}
=
\frac{\Theta_T(S)}{\lambda_\Sigma(S)}
=
\Theta_T(S)\lambda_C(S).
$$
For two compared probes $A,B$, set $\Delta_{AB}\ln X:=\ln X(A)-\ln X(B)$. Then
$$
\delta_{\mathrm{EP},AB}
:=
\Delta_{AB}\ln\frac{m_G}{m_I}
=
\Delta_{AB}\ln\Theta_T
+
\Delta_{AB}\ln C_{\max}
=
\Delta_{AB}\ln\Theta_T
-
\Delta_{AB}\ln\Sigma,
$$
and hence
$$
\eta_{AB}
=
\left\lvert
\Delta_{AB}\ln\Theta_T
+
\Delta_{AB}\ln C_{\max}
\right\rvert
+O(\|\Delta\lambda\|^2)
=
\left\lvert
\Delta_{AB}\ln\Theta_T
-
\Delta_{AB}\ln\Sigma
\right\rvert
+O(\|\Delta\lambda\|^2).
\tag{N.35}
$$
Since $\Delta\ln X=\Delta X/X+O((\Delta X/X)^2)$, the first-principles signed linear coefficients are:

| Independent retained coordinate | Branch meaning | $\chi_{\mathrm{EP},a}$ |
|:---|:---|:---:|
| Common multiplicative ledger $\lambda_{\mathrm{com}}$ | multiplies $m_I$ and $m_G$ identically | $0$ |
| Reset-support capacity $C_{\max}$ | inertia-side entropy-flow variation with stress source uncompensated | $+1$ |
| Entropy-flow normalization $\Sigma$ | independent inertia-side normalization with stress source uncompensated | $-1$ |
| Stress-source coefficient $\Theta_T$ | normalized gravitational source variation with inertia uncompensated | $+1$ |
| Refresh factor $f_{RID}$ | branch with a certified map $C_{\max}=C_{\max}(f_{RID})$ | $d\ln C_{\max}/d\ln f_{RID}$ |

On the flagged-capacity saturation subbranch where the refresh certificate supplies
$$
C_{\max}(f_{RID})=f_{RID}\ln d_0,
$$
the refresh coefficient is fixed:
$$
\chi_{\mathrm{EP},f}=1.
$$
Matching this subbranch to the minimal saturated value $C_{\max}^*=2\ln2$ with $d_0=8$ gives
$$
f_*=\frac{C_{\max}^*}{\ln d_0}=\frac{2}{3},
\qquad
p_*:=1-f_*=\frac{1}{3}.
$$
Without the saturation certificate $C_{\max}=f_{RID}\ln d_0$, the first-principles result remains
$$
\chi_{\mathrm{EP},f}=\frac{d\ln C_{\max}}{d\ln f_{RID}},
$$
and $f_*$ is branch data rather than a universal MPU number.

*Proof.* The saturated entropy-flow equation gives $d\mathcal S/d\tau=(\varepsilon_0/C_{\max}\tau_{\min})\mathcal I_{rel}$, while Theorem N.5 fixes the baseline mass $m_0(S)=\hbar\mathcal I_{rel}(S)/(2c^2\tau_{\min})$ at $C_{\max}^*=2\ln2$. This yields $m_I=m_0\lambda_\Sigma=m_0\lambda_C^{-1}$. The normalized stress-source coordinate is defined by $m_G=m_0\Theta_T$. Dividing the two mass maps gives $m_G/m_I=\Theta_T\lambda_C=\Theta_T/\lambda_\Sigma$. Expanding its logarithm about the metric-universal point $\Theta_T=\lambda_\Sigma=\lambda_C=1$ gives the displayed coefficients. A common multiplicative ledger cancels because it multiplies numerator and denominator of $m_G/m_I$ in the same way. The refresh coefficient follows by the chain rule, $d\ln(m_G/m_I)/d\ln f_{RID}=(d\ln(m_G/m_I)/d\ln C_{\max})(d\ln C_{\max}/d\ln f_{RID})$, and the first factor equals $1$ on the capacity coordinate. On the flagged-capacity saturation subbranch $C_{\max}=f_{RID}\ln d_0$, this derivative is $1$, and the minimal value gives $f_*=2/3$. ∎


### N.11.5a.3 Information-Theoretic Interpretation

**Remark N.11.7: Finite-Response Coupling Universality.** The data processing inequality is a fundamental theorem of information theory: no CPTP processing can increase distinguishability without access to additional resources or side channels [Cover & Thomas 2006]. In PU, gravitational universality is the physical manifestation of a broader finite-response condition: all simple matter sectors share the same retained ND-RID coupling ledger. DPI and strict contractivity are the refresh-branch expression of this condition, while reset-support capacity is the completed-cycle expression.

The correspondence operates as follows:

| Information Theory | Gravity |
|:-------------------|:--------|
| CPTP channel $\mathcal E_N$ | ND-RID 'Evolve' process (Definition 27) |
| Reset-support capacity budget | Universal boundary entropy density contribution |
| Refresh-branch $f_{RID}<1$ | Strict reduced-channel contraction when the refresh branch is active |
| Universal retained coupling ledger | Universal gravitational coupling |
| Sector-dependent retained ledger | EP violation on the non-compensation branch |
| Side channels or non-universal response data | New physics / EP-violation source |

**Remark N.11.8: Testable Prediction.** Current experimental bounds on EP violation constrain the non-universality of the retained coupling ledger. If
$$
|\eta|<\eta_{\mathrm{exp}},
$$
then Equation (N.35) gives, using one independent inertia-side coordinate at a time,
$$
\left|
\Delta\ln\Theta_T+\Delta\ln C_{\max}
\right|
=
\left|
\Delta\ln\Theta_T-\Delta\ln\Sigma
\right|
<
\eta_{\mathrm{exp}}
+
O(\|\Delta\lambda\|^2).
\tag{N.36}
$$
On a one-parameter refresh subbranch with certified $C_{\max}=C_{\max}(f_{RID})$, this becomes
$$
\left|\frac{\Delta f_{RID}}{f_{RID}}\right|
<
\frac{\eta_{\mathrm{exp}}}{|\chi_{\mathrm{EP},f}|}
+
O(\eta_{\mathrm{exp}}^2),
\qquad
\chi_{\mathrm{EP},f}=\frac{d\ln C_{\max}}{d\ln f_{RID}}.
$$
On the flagged-capacity saturation branch $C_{\max}=f_{RID}\ln d_0$, this reduces to $|\Delta f_{RID}/f_{RID}|<\eta_{\mathrm{exp}}+O(\eta_{\mathrm{exp}}^2)$.

For complex systems satisfying $C_{\mathrm{agg}}>C_{\mathrm{op}}$ on the Theorem N.8 model branch, Equation (N.41) evaluates to $\delta_C\sim10^{-40}$ at the explicitly stipulated parameter point of Remark N.11.2a; this is not a parameter-independent prediction and lies far below present experimental sensitivity.

### N.11.5a.4 Connection to Horizon Thermodynamics

The retained-ledger equivalence formulation connects to the unified modular structure established in Appendix G (Theorem G.1.9.5), with DPI supplying the refresh-branch expression.

**Proposition N.6 (Horizons as Finite-Response Capacity Boundaries).** A causal horizon $\mathcal H$ is characterized information-theoretically as a boundary where the total retained boundary channel budget saturates. At saturation,
$$
C_{\mathrm{boundary}}(\mathcal H)
=
N_{\mathrm{eff\,links}}C_{\max}
=
\sigma_{\mathrm{eff}}\mathcal A+o(\mathcal A),
\tag{N.37}
$$
where $\mathcal A$ is the horizon area and $\sigma_{\mathrm{eff}}=1/(4G)$ in natural units on the density-certificate and saturation branch (Theorem E.6).

*Proof.* By Theorem E.6, the entropy associated with a causal boundary equals the total retained channel capacity crossing it on the density-certificate branch:
$$
S_{\max}(\mathcal A)
=
N_{\mathrm{eff\,links}}C_{\max}
=
\frac{\mathcal A}{4G}+o(\mathcal A).
$$
At a horizon, this boundary budget is maximized consistent with the geometric constraints, yielding the Bekenstein-Hawking entropy density in the local-horizon refinement limit. ∎

**Corollary N.11.2 (Common Input and Distinct Branches for the Equivalence Principle and Area Law).** The local equivalence-principle conclusion and the horizon area law both consume the finite-response ND-RID reset-support/capacity ledger, subject to distinct additional hypotheses:

- **EP (local):** the universal retained coupling ledger on the simple-system $\mathfrak B_{mass}$ branch gives universal matter-gravity coupling (Theorem N.11).
- **Area law (global):** the reset-support capacity budget together with the density certificate and boundary-saturation branch gives entropy proportional to area (Theorem E.6).
- **Refresh branch:** $f_{RID}<1$ supplies strict reduced-channel contraction only where the relevant mixing or data-processing budget requires it.

The area-law chain is
$$
\text{completed binary reset-support certificate}\xrightarrow{\text{Proposition E.2a}}
C_{\max}\le\ln d_0-\ln2
\xrightarrow{\text{Theorems E.3 and E.6}}
\text{area law}.
$$
The equivalence-principle chain additionally requires universality of the retained source and response maps in Theorem N.11. The common input does not make either conclusion a consequence of the other.

*Proof.* Proposition E.2a supplies the reset-support capacity bound. Theorems E.3 and E.6 combine that bound with the density and saturation hypotheses to obtain the area law. Separately, Theorem N.11 proves universal response only after the simple-system mass-information branch and the universal retained source/response ledger are assumed. Thus both chains contain the reset-support/capacity node, while their remaining antecedents differ. The strict-contraction statement is conditional on the $f_{RID}<1$ refresh branch by Theorem E.2. ∎


### N.11.6 Complexity-Dependent Equivalence Principle Violation

For systems with high internal complexity ($C_{agg} > C_{op}$), the equivalence principle receives corrections.

**Theorem N.8 (Complexity Correction to the Equivalence Principle on the CC-Gravitational Response Branch).** On the CC-gravitational response branch — comprising (a) the Appendix S gravitational-decoherence model with rate $\Gamma_{\mathrm{deco}} = (\Delta E/\hbar) K_{\mathrm{eff}} P_{context}$ at the system's boundary, (b) $\mathfrak B_{mass}$ (Theorem N.5) for the conditional inertial-mass coefficient, and (c) the retained-energy / instantaneous-stress-energy convention of Theorem L.3 for the gravitational source — assume that both induced mass corrections are small relative to the baseline inertial mass $m_I$. Then

$$
\frac{m_G^{(CC)}-m_I^{(CC)}}{m_I^{(CC)}}
=
\delta_C
=
\left[
\frac{\eta_{\mathrm{ret}}\tau_c}{m_Ic^2}
-
\frac{\Delta E}{\hbar}K_{\mathrm{eff}}\tau_{\min}
\right]P_{context}
+O(P_{context}^2).
\tag{N.38}
$$

The coefficient $K_\Gamma$ of Appendix S, Equation S.60, is a separately defined decoherence-response coefficient. Identifying the coefficient in (N.38) with $K_\Gamma$ requires the additional calibration
$$
\frac{\eta_{\mathrm{ret}}\tau_c}{m_Ic^2}
-
\frac{\Delta E}{\hbar}K_{\mathrm{eff}}\tau_{\min}
=K_\Gamma.
$$


*Proof.*

**Step 1 (CC modifies effective decoherence).** By Section S.7.3 (Appendix S), a high-CC system generates gravitational fields through its context power $P_{context}$. These fields create differential time dilation across the system's spatial extent, inducing decoherence at rate:

$$
\Gamma_{deco} = \frac{\Delta E}{\hbar} K_{eff} P_{context}
\tag{N.39}
$$

**Step 2 (Modified boundary dynamics).** The decoherence modifies the effective 'Evolve' rate at the system's boundary. The entropy flow rate becomes:

$$
\frac{d\mathcal{S}}{d\tau}\bigg|_{CC} = \frac{\mathcal{I}_{rel}}{2\tau_{min}} \cdot (1 + \Gamma_{deco} \cdot \tau_{min})
\tag{N.40}
$$

**Step 3 (Modified inertial mass).** The additional entropy flow contributes to rest energy:

$$
m_I^{(CC)} = m_I \cdot (1 + \Gamma_{deco} \cdot \tau_{min}) = m_I(1 + \delta_I)
$$

**Step 4 (Gravitational mass from total stress-energy on the retained-energy convention).** On the retained-energy convention of Theorem L.3 with $E_{\text{grav}}^{\text{inst}} = \eta_{\mathrm{ret}} P_{context} \tau_c$, the gravitational mass receives the CC contribution

$$
m_G^{(CC)} = m_I + \frac{\eta_{\mathrm{ret}} P_{context} \tau_c}{c^2} = m_I(1 + \delta_G),
$$

where $\tau_c$ is the context coherence time and $\eta_{\mathrm{ret}} \in (0,1]$ is the retention fraction (idealized fully retained estimate uses $\eta_{\mathrm{ret}} = 1$). In dissipative steady state, $\eta_{\mathrm{ret}}$ must be computed from the actual instantaneous stress-energy distribution rather than from cumulative throughput.


**Step 5 (Net deviation).** Equations (N.39)–(N.40) and the retained-energy mass ledger give
$$
\delta_I
=
\frac{\Delta E}{\hbar}K_{\mathrm{eff}}\tau_{\min}P_{context},
\qquad
\delta_G
=
\frac{\eta_{\mathrm{ret}}\tau_c}{m_Ic^2}P_{context}.
$$
Consequently,
$$
\delta_C
=
\frac{\delta_G-\delta_I}{1+\delta_I}
=
\left[
\frac{\eta_{\mathrm{ret}}\tau_c}{m_Ic^2}
-
\frac{\Delta E}{\hbar}K_{\mathrm{eff}}\tau_{\min}
\right]P_{context}
+O(P_{context}^2).
$$

The separately defined Appendix S response coefficient is
$$
K_\Gamma = \frac{4\pi G}{3c^4}(1+3w_c)\frac{\Delta E \cdot r L_q \tau_c \tau_{coh}^0}{\hbar V_S}.
\tag{N.41}
$$
At the illustrative parameter point of Remark N.11.2a, Equation (N.41) gives
$$
K_\Gamma P_{context}=9.9908\times10^{-41}.
$$
This number is not an evaluation of $\delta_C$ unless the coefficient-identification condition stated after Equation (N.38) is also certified.

∎

**Remark N.11.2: Distinguishing Prediction.** Standard physics predicts $\delta_C = 0$ exactly. Quantum-spacetime phenomenology commonly parameterizes potential new effects as Planck-suppressed corrections controlled by ratios such as $E/E_P$ (or $p/E_P$), without dependence on macroscopic computational activity [Amelino-Camelia 2013]. The PU prediction $\delta_C \propto P_{context}$ is distinctive: the deviation depends on the system's computational activity, not just its mass. This provides a qualitative signature even if the quantitative effect is unmeasurably small with current technology.

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
\left(\frac{P_{context}}{0.1\,\mathrm W}\right).
\end{aligned}
$$
These values are stipulated illustrative inputs, not quantities derived by PU and not an empirical characterization of a biological system. The calculation validates only the numerical evaluation and dimensions of Equation (N.41). It is an evaluation of $\delta_C$ only if the additional coefficient-identification calibration stated after Equation (N.38) is certified.

**Proposition N.8.1 (Conditional Self-Model Maintenance Energy Ledger).** Assume a certificate maps one maintenance cycle to $n_{\mathrm{reset}}$ sequential registered classical resets, proves
$$
n_{\mathrm{reset}}\ge c_-C_{\mathrm{uni}}(\delta_{\mathrm{maint}}),
\qquad H_{q_j}(P_j\mid R_j)\ge h_{\min}>0,
$$
and supplies a retained-energy coefficient $0\le\eta_{\mathrm{ret}}\le1$. Here $R_j$ contains all classical side information retained and unchanged through reset $j$, and the heat ledgers are additive. Then
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
Only $P_{\mathrm{ret}}$ enters a stress-energy source, and only through a separately certified coupling map.

*Proof.* Conditional Landauer for reset $j$ gives
$$
Q_j\ge k_BT_{\mathrm{eff}}H_{q_j}(P_j\mid R_j)
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
H_{q_j}(P_j\mid R_j)\ge\ln2
$$
for every registered reset, then
$$
P_{\mathrm{self}}
\ge
\frac{k_BT_{\mathrm{eff}}\ln2}{\tau_{\mathrm{cycle}}}
c_-\frac{\log(1/\delta_{\mathrm{maint}})}
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

**Theorem N.8.2 (Equivalence–Complexity Lock).** On $\mathfrak B_{mass}$ of Theorem N.5


$$
m_I(S)
=
\frac{\mathcal I_{\mathrm{rel}}(S)}{2\sqrt{8\varepsilon_0}}m_P
+
\Delta m_I(S),
$$
$$
m_G(S)
=
\frac{\mathcal I_{\mathrm{rel}}(S)}{2\sqrt{8\varepsilon_0}}m_P
+
\Delta m_G(S),
$$
and the Eötvös parameter for two systems $A,B$ in the same external field is
$$
\eta_{AB}
:=
2\frac{|a_A-a_B|}{a_A+a_B}
=
\left|
\frac{m_G(A)}{m_I(A)}
-
\frac{m_G(B)}{m_I(B)}
\right|
+
O(\delta_A^2+\delta_B^2),
$$
where
$$
\delta_S:=
\frac{\Delta m_G(S)-\Delta m_I(S)}
{\mathcal I_{\mathrm{rel}}(S)m_P/(2\sqrt{8\varepsilon_0})}.
$$
If the retained complexity fractions are linearly coupled on the tested branch,
$$
\delta_S=\zeta_{\mathrm{EP}}\chi_S,
$$
then
$$
\boxed{
\eta_{AB}
=
\zeta_{\mathrm{EP}}|\chi_A-\chi_B|
+
O(\chi_A^2+\chi_B^2).
}
\tag{N.46}
$$
Thus PU predicts exact universality when all predictive costs are covariantly included in both projections, and controlled equivalence-principle violation only when a branch retains different inertial and gravitational bookkeeping for internal complexity.

*Proof.* Theorem N.5 gives the common baseline mass
$$
m_0(S)=\frac{\mathcal I_{\mathrm{rel}}(S)}{2\sqrt{8\varepsilon_0}}m_P.
$$
Theorem N.7 identifies inertial and gravitational mass for simple systems because both are this same baseline quantity. For a test body in a weak external field,
$$
a_S=\frac{m_G(S)}{m_I(S)}g.
$$
Therefore
$$
\eta_{AB}
=
2\frac{|m_G(A)m_I(B)-m_G(B)m_I(A)|}
{m_G(A)m_I(B)+m_G(B)m_I(A)}.
$$
Writing $m_G(S)=m_I(S)(1+\delta_S)$ and expanding to first order gives
$$
\eta_{AB}=|\delta_A-\delta_B|+O(\delta_A^2+\delta_B^2).
$$
If $\delta_S=\zeta_{\mathrm{EP}}\chi_S$, Equation N.46 follows. When the bookkeeping is covariant, $\Delta m_G(S)=\Delta m_I(S)$ for every $S$, hence every $\delta_S=0$ and $\eta_{AB}=0$. ∎

### N.11.7 Conditional Connection to Particle-Mass Hierarchies

**Proposition N.5 (Mass Ratios from Information Ratios).** On the saturated-boundary mass-information branch $\mathfrak B_{\mathrm{mass}}$ of Theorem N.5, let two systems have relational information contents $\mathcal I_1\ge0$ and $\mathcal I_2>0$. Then
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

**Theorem N.9 (Ordered Charged-Lepton Hierarchy on the Appendix T Calibration Branch).** Assume the saturated-boundary mass-information branch of Proposition N.5 and the ordered adjacent-edge hierarchy assignments of Appendix T for the path $\tau\to\mu\to e$. Then
$$
\ln\left(\frac{m_\tau}{m_\mu}\right)
=
\ln\left(\frac{\mathcal I_\tau}{\mathcal I_\mu}\right)
=
\alpha_{IR}d_{\tau\mu}^2,
\qquad
\ln\left(\frac{m_\mu}{m_e}\right)
=
\ln\left(\frac{\mathcal I_\mu}{\mathcal I_e}\right)
=
\alpha_{IR}d_{\mu e}^2,
\tag{N.43}
$$
and path additivity gives
$$
\ln\left(\frac{m_\tau}{m_e}\right)
=
\alpha_{IR}\left(d_{\tau\mu}^2+d_{\mu e}^2\right).
$$
For the stipulated triad $(d_{\tau\mu}^2,d_{\mu e}^2,d_{\tau e}^2)=(2,4,6)$, the last expression equals $\alpha_{IR}d_{\tau e}^2$. These are ordered hierarchy relations; no formula of the form $\ln(m_j/m_i)=\alpha_{IR}d_{ij}^2$ holds simultaneously for both orders of an arbitrary pair.

*Proof.* Proposition N.5 gives
$$
\ln\left(\frac{m_a}{m_b}\right)
=
\ln\left(\frac{\mathcal I_a}{\mathcal I_b}\right)
$$
on the saturated-boundary mass-information branch. Substituting the two ordered adjacent-edge assignments supplied by the Appendix T calibration branch proves (N.43). Multiplication of the adjacent ratios gives
$$
\frac{m_\tau}{m_e}
=
\frac{m_\tau}{m_\mu}\frac{m_\mu}{m_e};
$$
taking logarithms proves the additive formula. Finally, $2+4=6$ proves the displayed equality for the stipulated triad. ∎

**Corollary N.9.1 (Conditional Ordered Lepton-Ratio Invariant).** Under the hypotheses of Theorem N.9 and its stipulated ordered triad,
$$
\mathcal R_\ell
=
\frac{\ln(m_\tau/m_e)}{\ln(m_\tau/m_\mu)}
=
\frac{d_{\tau\mu}^2+d_{\mu e}^2}{d_{\tau\mu}^2}
=
\frac{2+4}{2}
=3.
$$
The hierarchy coefficient and the overall relational-information scale cancel, but the result remains conditional on the saturated mass-information branch and the ordered Appendix T calibration.

*Proof.* Operative Theorem N.9 gives
$$
\ln(m_\tau/m_\mu)=\alpha_{IR}d_{\tau\mu}^2
$$
and
$$
\ln(m_\tau/m_e)=\alpha_{IR}(d_{\tau\mu}^2+d_{\mu e}^2).
$$
Because $\alpha_{IR}>0$, division is defined and cancels $\alpha_{IR}$. Substitution of $(d_{\tau\mu}^2,d_{\mu e}^2)=(2,4)$ gives $6/2=3$. The observed value $\mathcal R_\ell^{obs}=2.889$ differs from this conditional leading value by $(3-2.889)/3=0.037=3.7\%$. ∎

### N.11.8 The Complete Derivation Chain

On the joint saturated-boundary/activity completed-reset and action--entropy branches, the conditional chain to inertial mass is:

$$
\boxed{K_0 = 3 \xrightarrow{\text{Thm 23}} d_0 = 8 \xrightarrow{\text{Thm 31}} \varepsilon_0 = \ln 2 \xrightarrow{\text{Eq Q.18}} \delta = \sqrt{8\varepsilon_0} \cdot L_P \xrightarrow{\text{Thm N.5}} m = \frac{\mathcal{I}_{rel}}{2\sqrt{8\varepsilon_0}} \cdot m_P}
$$

Steps 1--5 list the registered structural chain; Steps 6--9 are branch-conditional implications requiring the physical-time equilibrium, saturated-activity, saturated-boundary, and action--entropy certificates stated below:

| Step | Result | Origin |
|:-----|:-------|:-------|
| 1 | $K_0 = 3$ | Horizon Constant from SPAP encodability (Theorem 15) |
| 2 | $N_{\mathrm{vis}}^{\min}=8$, $d_0 = 8$ | Finite operational-context floor and minimal Hilbert-carrier saturation: $N_{\mathrm{vis}}^{\min}=2^{K_0}$ and $d_0=N_{\mathrm{vis}}^{\min}$ on the minimal complex branch (Theorem 15; Theorem 23) |
| 3 | $\varepsilon_0 = \ln 2$, $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$ | Structural SPAP cost and physical implementation bound (Theorem 31, Appendix J) |
| 4 | $\tau_{\min}=\sqrt{8\varepsilon_0}\,t_P$ | Conditional calibration on the joint Eq. Q.18 and saturated Proposition Q.6.1 branch |
| 5 | $C_{\max} = 2\varepsilon_0$ | PCE-optimal structural channel capacity (Equation E.15) |
| 6 | Modular KMS representation; physical equilibrium only with an independent selector | Theorems G.1.9.3c and G.1.9.5; no activity rate follows |


| 7 | $d\mathcal S/d\tau=\mathcal I_{rel}/(2\tau_{min})$ | Joint saturated-boundary/activity completed-reset premise (Corollary N.4.1) |


| 8 | $\mathcal{S}_{action}/\hbar = \Sigma\varepsilon_i$ | Action-Entropy Identity (Corollary Q.0.1) |
| 9 | $m=\mathcal I_{rel}m_P/(2\sqrt{8\varepsilon_0})$ | Conditional equality on the joint saturation and action--entropy branch (Theorem N.5) |



The logical structure fixes only the displayed conditional algebra. The system value $\mathcal I_{rel}$, physical-time/equilibrium selector, realized activity, boundary utilization, completed-reset ledger, action--entropy bridge, and any norm--information calibration are independent branch data; without the required certificates the final absolute-mass equality is not a theorem output.



### N.11.9 Physical Interpretation

**Remark N.11.3: Conditional Mass Interpretation.** On $\mathfrak B_{mass}$, Theorem N.5 assigns mass as a fixed multiple of relational information. Off that branch PU retains relational information but does not derive this absolute mass coefficient.



**Remark N.11.4: What Rest Energy Is.**

Corollary N.5.1 identifies rest energy as the conditional proper-time action-rate on $\mathfrak B_{mass}$, including the accepted action--entropy bridge.


- **Information-rate domain:** $\mathcal{I}_{rel}/(2\tau_{\min})$ nats per unit proper time
- **Energy/action-rate domain:** $\hbar\mathcal{I}_{rel}/(2\tau_{\min})$ joules

This parallels the role of $\hbar$ as the action-entropy exchange rate (Corollary Q.0.2).

**Remark N.11.5: Conditional Inertia Interpretation.** On $\mathfrak B_{mass}$, Theorem N.6 interprets the registered inertial coefficient as update resistance. Accelerating a system requires reconfiguring its correlations with the network. The more correlations ($\mathcal{I}_{rel}$), the more entropy must flow to the environment, the more energy required—hence greater resistance to acceleration.

**Remark N.11.6: Conditional Connection to UCT.** The UCT includes $m_0$ as an input. On $\mathfrak B_{mass}$, Theorem N.5 permits the substitution:



$$
m_0 = \frac{\mathcal{I}_{rel}}{2\sqrt{8\varepsilon_0}} \cdot m_P
$$

The UCT can then be rewritten in the same laboratory-frame ledger as

$$
W_{\mathrm{tot}}^{\mathrm{lab}}
\ge
\frac{\mathcal{I}_{rel}}{2\sqrt{8\varepsilon_0}}
\,E_P\,(\gamma_f-1)
+
\int_0^{\tau_f}
\gamma(\tau)R_{\mathrm{com}}(\tau)\,d\tau,
$$

where $R_{\mathrm{com}}(\tau)=R(C_{\mathrm{req}}(\tau),T_{\mathrm{eff}}(\tau))$. The first term uses the conditional mass substitution, while the second is the laboratory energy of the comoving exported-loss ledger.

### N.11.10 Summary

This section has established:

**Summary of Theorem N.5 on $\mathfrak B_{mass}$:**
$$
m = \frac{\mathcal{I}_{rel}}{2\sqrt{8\varepsilon_0}} \cdot m_P \approx 0.212 \cdot \mathcal{I}_{rel} \cdot m_P
$$

| Result | Physical Content | Reference |
|:-------|:-----------------|:----------|
| Theorem N.4 | Active channels obey $0\le r_e\le1/\tau_{min}$; equality is a saturated-activity premise | Activity-conditioned cycle ledger |


| Corollary N.4.1 | $d\mathcal S/d\tau=\mathcal I_{rel}/(2\tau_{min})$ only on the joint saturated-boundary/activity branch | Conditional completed-reset ledger |


| Theorem N.5 | $m=\mathcal I_{rel}m_P/(2\sqrt{8\varepsilon_0})$ on $\mathfrak B_{mass}$ | Conditional action--entropy ledger |


| Corollary N.5.1 | $E = mc^2$ = proper-time action-rate for maintained relational information | Rest energy derived |
| Theorem N.6 | Inertia = relational update resistance | Origin of inertia explained |
| Theorem N.7 | $m_I=m_G$ for simple systems on the common $\mathfrak B_{mass}$ ledger | Conditional equivalence principle |


| Theorem N.8 | $\delta_C \propto P_{context}$ for complex systems | Complexity-dependent deviation |
| Theorem N.9 | Conditional import gate for a fully registered Appendix T flavor model | No exact mass-ratio output without labels, coefficients, scheme, and remainder certificates |



**The Unified Picture:**

| Quantity | Standard Physics | Conditional PU ledger |
|:---------|:-----------------|:----------|
| Mass $m$ | Primitive property | Relational information (Thm N.5) |
| $E = mc^2$ | Empirical relation | Information maintenance (Cor N.5.1) |
| Inertia | Unexplained resistance | Update resistance (Thm N.6) |
| $m_I = m_G$ | Postulated equivalence | Both measure $\mathcal{I}_{rel}$ (Thm N.7) |
| Ordered charged-lepton ratios | Free parameters | Appendix-T calibrated $E_8$ path relations on the branch of Thm N.9 |

On $\mathfrak B_{mass}$, the mass, rest-energy, inertia, and common-ledger equivalence statements form one conditional relational-information package. Outside that branch, the network ontology and relational-information definition remain, but no absolute mass coefficient or equivalence equality follows from them alone.

The framework models the universe as a network of predictive relationships. On $\mathfrak B_{mass}$, mass is proportional to registered relational information, rest energy is the associated proper-time action-rate, and inertia is interpreted as resistance to updating the registered correlations. On the common-ledger branch of Theorem N.7, inertial and gravitational mass coincide because both use that same conditional coefficient. None of these absolute identifications follows from relational information alone outside the stated branches.

---
