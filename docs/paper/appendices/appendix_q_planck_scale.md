# Appendix Q: Derivation of the Planck-MPU Scale Ratio

## Q.0 Conditional Action-Ledger Calibration

This section separates a dimensionless predictive ledger from a mechanical action. Their proportionality scale $\kappa_A$ is independent; identifying $\kappa_A=\hbar$ requires calibration against quantum phase data.

### Q.0.1 The Puzzle of Least Action

The Principle of Least Action stands as one of the most powerful organizing principles in physics. From it, classical mechanics, field theory, and the path integral formulation of quantum mechanics can be derived. Yet the standard presentation offers no explanation for *why* nature should extremize this particular quantity—the integral of the Lagrangian over time.

**Principle Q.0.3a (Finite-to-Continuum Variational Closure).** On every fixed-boundary and fixed-holonomy admissible class used for a fundamental PU continuum limit, the discrete dimensionless ledgers $\mathcal L_h$ are equicoercive and $\Gamma$-converge to a lower-semicontinuous ledger $\mathcal L$. Each $\mathcal L_h$ has a minimizer $\phi_h$, every minimizing sequence has a convergent subsequence, and the continuum action is
$$
\mathcal S=\kappa_A\mathcal L
$$
for one registered constant $\kappa_A>0$. When an Euler–Lagrange statement is made, the admissible limit has a common tangent domain and $\mathcal L$ is Gâteaux differentiable on that domain. This is a physical continuum-closure principle and is independently testable by convergence of the retained discrete response functionals.

**Theorem Q.0.3a (Discrete Minimizers Give the Continuum Action Principle).** Under Principle Q.0.3a, every cluster point $\phi$ of discrete minimizers is a minimizer of $\mathcal L$ and of $\mathcal S$. If $\phi$ lies in the differentiable tangent domain, then
$$
D\mathcal L(\phi)[v]=0,
\qquad
D\mathcal S(\phi)[v]=0
$$
for every admissible two-sided variation $v$.

*Proof.* Equicoercivity gives a convergent subsequence $\phi_{h_j}\to\phi$. The fundamental theorem of $\Gamma$-convergence gives
$$
\mathcal L(\phi)=\min\mathcal L
=\lim_j\min\mathcal L_{h_j}.
$$
Multiplication by the positive constant $\kappa_A$ preserves minimizers. For every admissible two-sided variation, the scalar function $t\mapsto\mathcal L(\phi+tv)$ has a minimum at $t=0$ and is differentiable there, so its derivative vanishes. The action identity gives $D\mathcal S=\kappa_A D\mathcal L$. ∎

Nonminimizing discrete saddles require a separate first-variation or slope-convergence certificate; $\Gamma$-convergence alone does not transfer arbitrary stationary points.

**Theorem Q.0.3b (Quadratic Finite-Ledger Mosco and Stationarity Limit).** Let $H=L^2(0,1)$, fix $\lambda>0$ and $f\in L^2(0,1)$, and take the nested dyadic meshes $h_n=2^{-n}$. Let $V_n\subset H_0^1(0,1)$ be the continuous piecewise-affine functions on the $n$th mesh. Extend the finite ledger
$$
\mathcal L_n(u)
:=
\frac12\int_0^1|u'|^2dx
+\frac\lambda2\int_0^1|u|^2dx
-\int_0^1fu\,dx,
\qquad u\in V_n,
\tag{Q.0.3b.1}
$$
by $+\infty$ on $H\setminus V_n$, and define $\mathcal L$ by the same formula on $H_0^1(0,1)$ and by $+\infty$ elsewhere. Then:

1. $(\mathcal L_n)$ is equicoercive in the strong $L^2$ topology and Mosco-converges, hence $\Gamma$-converges, to $\mathcal L$ on $H$.
2. The unique stationary point $u_n\in V_n$ satisfies
   $$
   \int_0^1u_n'v_n'\,dx+\lambda\int_0^1u_nv_n\,dx
   =\int_0^1fv_n\,dx
   \quad(v_n\in V_n),
   \tag{Q.0.3b.2}
   $$
   and $u_n\to u$ strongly in $H_0^1(0,1)$, where $u$ is the unique weak solution of $-u''+\lambda u=f$ with zero boundary data.
3. Whenever $w_n\to w$ and $v_n\to v$ strongly in $H_0^1$ with $w_n,v_n\in V_n$,
   $$
   D\mathcal L_n(w_n)[v_n]\longrightarrow D\mathcal L(w)[v].
   \tag{Q.0.3b.3}
   $$
Multiplication by a fixed registered $\kappa_A>0$ gives the same statements for $\mathcal S_n=\kappa_A\mathcal L_n$ in action units.

*Proof.* Young's inequality and Poincaré's inequality give constants $c,C>0$, independent of $n$, such that $\mathcal L_n(u)\ge c\|u\|_{H^1}^2-C$. Rellich compactness makes every common sublevel precompact in $L^2$, proving equicoercivity. If $u_n\rightharpoonup u$ in $L^2$ and $\sup_n\mathcal L_n(u_n)<\infty$, the coercive bound supplies a subsequence weakly convergent in $H_0^1$ to the same $u$; weak lower semicontinuity of the two quadratic terms and weak continuity of the $f$ term give the Mosco liminf inequality. For $u\in H_0^1$, its nodal interpolants on the dyadic meshes converge strongly in $H_0^1$ after the standard density approximation by smooth functions, giving a strong $L^2$ recovery sequence and convergence of all three terms. If $u\notin H_0^1$, the recovery requirement is vacuous because $\mathcal L(u)=+\infty$. This proves Mosco convergence.

The bilinear form in (Q.0.3b.2) is uniformly coercive, so Lax--Milgram gives unique $u_n$ and $u$. Galerkin orthogonality and Céa's lemma give
$$
\|u-u_n\|_{H^1}
\le C_\lambda\inf_{v_n\in V_n}\|u-v_n\|_{H^1}\longrightarrow0.
$$
Finally, the derivative is the bilinear left side of (Q.0.3b.2) minus the $f$ pairing, so strong $H^1$ convergence of both arguments proves (Q.0.3b.3). Positive scalar multiplication preserves every assertion and supplies the declared units. ∎

**Resolution TV-Q-01-P1 (Metadata).** Exact domain: the dyadic one-dimensional quadratic finite-element ledgers (Q.0.3b.1). Premises: $\lambda>0$, $f\in L^2$ and fixed Dirichlet boundary data. Equivalence: equality as extended functionals on $L^2$. Budget: every mesh level and every admissible test pair in (Q.0.3b.3). Verifier: uniform coercivity, Mosco liminf, recovery, Galerkin residual and calibrated scalar multiplication. Falsifier: failure of any convergence assertion or a stationary sequence whose limit does not solve the displayed weak equation. Provenance class: source-internal explicit variational construction. Downstream consumers: Principle Q.0.3a and `TV-Q-01`. Theorem Q.0.3b gives `positive-discharge` for this quadratic finite-ledger class. Nonquadratic PU ledgers, nonminimizing saddles outside the common tangent domain and their physical realization remain in the broader target.

### Q.0.2 The Discrete Predictive Cost Functional

The MPU network executes cyclical predictive operations, each cycle implementing the Fundamental Predictive Loop (Definition 4):

$$\text{Predict} \to \text{Verify} \to \text{Update}$$

On the registered binary-support branch, the structural ledger value is exactly
$$
\varepsilon_0=\ln|\{0,1\}|=\ln2
$$
by Proposition 5, Definition 28, Definition J.1, and Theorem J.1. This is a log-cardinality theorem and is independent of the event distribution. If a reusable implementation additionally resets the prediction register under Theorem 31's thermodynamic hypotheses, its separate physical ledger obeys
$$
\varepsilon_{\mathrm{reset}}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}
\ge H_q(P\mid R),
\qquad
\varepsilon_{\mathrm{diss}}\ge0.
$$
A positive heat floor requires an independent lower bound on $H_q(P\mid R)$; structural log-cardinality alone implies neither heat nor mechanical action.

**Definition Q.0.1 (Dimensionless Discrete Predictive Ledger).** For a trajectory with finitely many registered steps, let
$$
\mathcal L_{\mathrm{disc}}:=\sum_{i=1}^N\ell_i
$$
be a declared dimensionless additive ledger. The values $\ell_i$ must be supplied by the relevant structural, stochastic-rate, or thermodynamic implementation record; they are not all identified with bath heat or total entropy production. Given an independent action scale $\kappa_A>0$, define
$$
\mathcal S_{\mathrm{disc}}:=\kappa_A\mathcal L_{\mathrm{disc}}.
$$

**Proposition Q.0.1 (Conditional Structural Count).** If a branch assigns exactly one binary structural label to each of $N_{\mathrm{ops}}$ registered steps and no other contribution to this ledger, then
$$
\mathcal L_{\mathrm{disc}}=N_{\mathrm{ops}}\ln2.
$$
This is an alphabet-counting identity, not a universal physical-action, heat, or entropy-production lower bound. ∎

**Remark Q.0.1a (Ledger Separation).** Registered reset heat obeys Theorem J.1 and depends on $H_q(P\mid R)$. A large-deviation rate functional and a mechanical action require their own bridge. The calibration $\kappa_A=\hbar$ is never inferred from $\ln2$.

### Q.0.3 The Continuum Limit via Γ-Convergence

The discrete predictive cost functional converges to a continuum action in the limit of fine network resolution. This convergence is developed within the Γ-convergence framework (Theorem D.6, Appendix D; Section O.7, Appendix O).

**Theorem Q.0.1 (Calibrated Continuum-Action Limit).** Let $\kappa_A>0$ be an independently supplied action scale. Assume the declared topology, equicoercivity, liminf inequality, and recovery sequences establish
$$
\mathcal L_h\xrightarrow{\Gamma}\mathcal L
$$
for a dimensionless discrete ledger. Then
$$
\mathcal S_h:=\kappa_A\mathcal L_h
\xrightarrow{\Gamma}
\mathcal S:=\kappa_A\mathcal L.
$$
The $\Gamma$-limit fixes the functional only relative to $\kappa_A$; it does not derive $\kappa_A=\hbar$. ∎

**Corollary Q.0.1 (Conditional Action--Entropy Calibration).** If $\kappa_A=\hbar$ is independently calibrated and a recovery sequence carries the additive history ledger, then
$$
\mathcal S[\phi]
=\hbar\lim_{h\to0}\sum_{i\in\phi_h}\varepsilon_i^{(h)}.
$$
This is a calibrated representation, not a derivation of $\hbar$. ∎

**Definition Q.0.1a (Predictive Large-Deviation Branch).** A predictive large-deviation branch is a family of finite ND-RID/PCE stochastic dynamics
$$
X^\eta_t,
\qquad
\eta>0,
$$
on a compact retained state space, with small effective noise parameter $\eta$, satisfying a good path-space large-deviation principle: for every admissible path set $\mathcal A$,
$$
-\inf_{\gamma\in\mathcal A^\circ} I_{\mathrm{PU}}[\gamma]
\le
\liminf_{\eta\downarrow0}
\eta\log\mathbb P_\eta(X^\eta_{[0,T]}\in\mathcal A)
\le
\limsup_{\eta\downarrow0}
\eta\log\mathbb P_\eta(X^\eta_{[0,T]}\in\mathcal A)
\le
-\inf_{\gamma\in\overline{\mathcal A}} I_{\mathrm{PU}}[\gamma].
\tag{Q.0.1a.1}
$$
The rate functional has local form
$$
I_{\mathrm{PU}}[\gamma]
=
\int_0^T
L_{\mathrm{PU}}(\gamma(t),\dot\gamma(t))\,dt
\tag{Q.0.1a.2}
$$
for absolutely continuous retained paths and is $+\infty$ otherwise. The physical action of the same retained path is
$$
\mathcal S_{\mathrm{PU}}[\gamma]
=
\kappa_A I_{\mathrm{PU}}[\gamma],
\tag{Q.0.1a.3}
$$

**Theorem Q.0.1b (Predictive Large-Deviation Variational Principle).** On a predictive large-deviation branch, the dominant rare transition from a closed retained basin $A$ to a closed retained basin $B$ over the time window $[0,T]$ is governed by the finite-time transition cost
$$
\mathcal I_{A\to B}
=
\inf_{\gamma(0)\in A,\ \gamma(T)\in B}
I_{\mathrm{PU}}[\gamma].
\tag{Q.0.1b.1}
$$
Let $\mathcal T_{A\to B}$ be a transition tube satisfying
$$
\inf_{\gamma\in\mathcal T_{A\to B}^{\circ}}I_{\mathrm{PU}}[\gamma]
=
\inf_{\gamma\in\overline{\mathcal T}_{A\to B}}I_{\mathrm{PU}}[\gamma]
=
\mathcal I_{A\to B}.
$$
Then
$$
\lim_{\eta\downarrow0}
\eta\log
\mathbb P_\eta(X^\eta_{[0,T]}\in\mathcal T_{A\to B})
=
-\mathcal I_{A\to B}.
\tag{Q.0.1b.2}
$$
On the accepted action-calibration branch,
$$
\frac{\mathcal S_{A\to B}^{\min}}{\kappa_A}
=
\mathcal I_{A\to B}.
\tag{Q.0.1b.3}
$$

*Proof.* Apply the path-space large-deviation lower bound to the tube interior and the upper bound to its closure. The three-way infimum hypothesis makes the two exponential bounds equal to $-\mathcal I_{A\to B}$, proving (Q.0.1b.2). Multiplication of the minimizing rate functional by the accepted action scale $\kappa_A$ proves (Q.0.1b.3). ∎

**Corollary Q.0.1c (Conditional Branch-Action Reconstruction).** Let a retained branch satisfy Definition Q.0.1a, and suppose an accepted reconstruction identifies the branch's dimensionless action $\mathcal S_{\mathrm{br}}/\kappa_A$ historywise with $I_{\mathrm{PU}}$ on the same admissible transition class and boundary data. Then a stationary or minimizing branch exponent is an instance of Theorem Q.0.1b. In particular, an Appendix-U or Appendix-Y exponent belongs to this common large-deviation ledger only when that reconstruction is certified for its retained paths.

*Proof.* Definition Q.0.1a supplies the path-space large-deviation principle. The reconstruction hypothesis identifies the cited branch action with the same rate functional on the matching boundary class, so Theorem Q.0.1b identifies its finite-time transition exponent with the corresponding infimum of $I_{\mathrm{PU}}$. Without the historywise reconstruction, two action functionals need not be the same rate functional and no consolidation follows. ∎

**Theorem Q.0.1d (Uniformly Elliptic ND--RID Diffusion Rate and Reconstruction Residual).** Let the retained state space be the flat torus $\mathbb T^d$, let $b:\mathbb T^d\to\mathbb R^d$ be Lipschitz, and let $\sigma$ be an invertible constant matrix with $a=\sigma\sigma^T$. Fix $x_0\in\mathbb T^d$. For $\eta>0$, define the retained stochastic dynamics
$$
dX_t^\eta=b(X_t^\eta)dt+\sqrt{2\eta}\,\sigma\,dW_t,
\qquad X_0^\eta=x_0,
\qquad
\mathcal G_\eta f=b\cdot\nabla f+\eta\,a:D^2f.
\tag{Q.0.1d.1}
$$
Its nonlinear generator satisfies
$$
\eta e^{-f/\eta}\mathcal G_\eta e^{f/\eta}
=b\cdot\nabla f+(\nabla f)^Ta\nabla f+\eta\,a:D^2f
\longrightarrow
H(x,\nabla f),
\tag{Q.0.1d.2}
$$
where $H(x,p)=b(x)\cdot p+p^Tap$. The path laws obey a good large-deviation principle on $C([0,T],\mathbb T^d)$ with rate
$$
I_{\mathrm{PU}}[\gamma]
=\frac14\int_0^T
(\dot\gamma-b(\gamma))^Ta^{-1}(\dot\gamma-b(\gamma))\,dt
\tag{Q.0.1d.3}
$$
for absolutely continuous paths with $\gamma(0)=x_0$ and $+\infty$ otherwise.

For any continuous claimed branch density $L_{\mathrm{br}}$ on a compact path domain
$$
K_V:=\{(x,v):x\in\mathbb T^d, |v|\le V\},
$$
define the registered reconstruction residual
$$
r_{\mathrm{br}}(x,v)
:=L_{\mathrm{br}}(x,v)
-\frac14(v-b(x))^Ta^{-1}(v-b(x)).
\tag{Q.0.1d.4}
$$
If $\|r_{\mathrm{br}}\|_{L^\infty(K_V)}\le\epsilon$, then every admissible path with $|\dot\gamma|\le V$ satisfies
$$
\left|
\int_0^TL_{\mathrm{br}}(\gamma,\dot\gamma)dt
-I_{\mathrm{PU}}[\gamma]
\right|
\le T\epsilon,
\tag{Q.0.1d.5}
$$
and, on every nonempty fixed-boundary admissible class for which both infima are finite, the corresponding infima differ by at most $T\epsilon$. In particular, $r_{\mathrm{br}}=0$ on $K_V$ is a sufficient certificate for exact historywise reconstruction on the displayed admissible path class. No converse from equality of the fixed-$x_0$ path functionals to pointwise equality of densities is asserted.

*Proof.* Direct differentiation of $e^{f/\eta}$ gives (Q.0.1d.2). The Legendre transform of $H(x,p)$ is
$$
\sup_p\{p\cdot v-H(x,p)\}
=\frac14(v-b(x))^Ta^{-1}(v-b(x)),
$$
because the maximizer is $p=\tfrac12a^{-1}(v-b)$. The Freidlin--Wentzell theorem applies on the compact torus under Lipschitz drift and uniform ellipticity and gives the good path-space rate (Q.0.1d.3). Integrating the pointwise residual bound proves (Q.0.1d.5), and a vanishing pointwise residual makes the two integrands, hence the two path functionals, equal. Taking infima preserves the same uniform error. ∎

**Resolution TV-Q-02-P1 (Metadata).** Exact domain: the uniformly elliptic torus diffusions (Q.0.1d.1) and bounded-speed reconstruction domain $K_V$. Premises: Lipschitz $b$, constant invertible $\sigma$, continuous $L_{\mathrm{br}}$, and fixed $T,V$. Equivalence: equality of the retained generator coefficients and boundary class. Budget: every absolutely continuous retained path with $|\dot\gamma|\le V$. Verifier: the nonlinear-generator limit, Legendre transform, Freidlin--Wentzell hypotheses and residual norm. Falsifier: a path-law exponent or reconstruction error violating (Q.0.1d.3) or (Q.0.1d.5). Provenance class: standard diffusion large-deviation theorem with a source-internal reconstruction bound. Downstream consumers: Definition Q.0.1a, Corollary Q.0.1c and `TV-Q-02`. This is `positive-discharge` for the displayed diffusion-generator class; jump generators, degenerate noise and the separate Appendix-U/Y sector maps remain outside this partial scope.

**Remark Q.0.1c.1 (Conditional Reset-Power Viability Inequality).** Let $r_j$ be registered reset-event rates with a common bath-temperature ledger, and let
$$
\nu:=\sum_jr_j,\qquad\overline{H_q(P\mid R)}:=\nu^{-1}\sum_jr_jH_{q_j}(P_j\mid R_j)
$$
when $\nu>0$. Sequential conditional Landauer gives
$$
R_{\mathrm{in}}\ge\dot{\mathcal L}_{\mathrm{reset}}+R_{\mathrm{loss}},\qquad\dot{\mathcal L}_{\mathrm{reset}}\ge\nu\,\overline{H_q(P\mid R)}.
$$
For $\nu=0$, set $\dot{\mathcal L}_{\mathrm{reset}}=0$. The specialization $\nu\ln2$ requires every registered binary record to be conditionally uniform. The structural value $\varepsilon_0=\ln2$ alone determines no maintenance power.

This is a necessary finite-resource viability condition for code-maintaining aggregates, not a complete biological classification theorem. A biological classification would require additional operational conditions such as boundary maintenance, metabolism, self-maintenance, reproduction or lineage persistence, and environmental coupling.

### Q.0.4 Action-Scale Calibration

**Convention Q.0.2x (Action-Scale Calibration).** The continuum action carries an independent positive scale $\kappa_A$ with units of action per dimensionless ledger unit. The identification $\kappa_A=\hbar$ is a calibration condition against quantum phase data, not a consequence of counting or dimensional analysis.

**Corollary Q.0.2 (Dimensional Role).** On a calibrated branch,
$$
\mathcal S=\kappa_A\mathcal L.
$$
If comparison with experiment selects $\kappa_A=\hbar$, then the familiar phase factor $e^{i\mathcal S/\hbar}$ is recovered. ∎

**Corollary Q.0.2b (Conditional Per-Cycle Action).** If one registered structural cycle contributes $\ln2$ to $\mathcal L$, then its calibrated action contribution is $\kappa_A\ln2$. This is not a universal minimum physical action. ∎

**Remark Q.0.1 (Status).** Neither $\ln2$ nor the variational limit fixes the empirical value of $\kappa_A$.

**Theorem Q.0.2e (Local Coherent-Phase Calibration and Geometric-Phase Separation).** On the independent reference carrier $\mathcal H_{\mathrm{ref}}=\operatorname{span}\{|0\rangle,|1\rangle\}$, implement, for every registered control value $\ell\in\mathbb R$,
$$
U_{\mathrm{ref}}(\ell)
=|0\rangle\!\langle0|+e^{i\ell}|1\rangle\!\langle1|.
\tag{Q.0.2e.1}
$$
Prepare $|+_x\rangle=(|0\rangle+|1\rangle)/\sqrt2$ and use the normalized projective readouts in the $x$ and $y$ bases, where $|+_y\rangle=(|0\rangle+i|1\rangle)/\sqrt2$. Their positive-outcome probabilities are
$$
p_x^+(\ell)=\frac{1+\cos\ell}{2},
\qquad
p_y^+(\ell)=\frac{1+\sin\ell}{2}.
\tag{Q.0.2e.1a}
$$
Thus the pair of normalized responses identifies $e^{i\ell}$ exactly and fixes the reference phase without using the PU ledger.

Suppose the same control family has a registered dimensionless PU ledger $\mathcal L(\ell)=\ell$ and candidate action $\mathcal S(\ell)=\kappa_A\ell$ with $\kappa_A>0$, and that its quantum action rule represents the relative phase by
$$
U_A(\ell)
=|0\rangle\!\langle0|
+e^{i\kappa_A\ell/\hbar}|1\rangle\!\langle1|.
\tag{Q.0.2e.2}
$$
Equality of the two coherent channels on any open interval about zero holds exactly when
$$
\kappa_A=\hbar.
\tag{Q.0.2e.3}
$$

In particular, after (Q.0.2e.3), the registered event value $\ell=N\ln2$ has relative phase $e^{iN\ln2}$ for every $N\in\mathbb Z$. For a registered closed adiabatic/semiclassical path on which the following data are defined, the total phase separates as
$$
\Theta
=\frac{\mathcal S}{\hbar}
+\gamma_{\mathrm B}
-\frac\pi2\mu
+\Theta_{\partial}
\pmod{2\pi},
\tag{Q.0.2e.4}
$$
where $\gamma_{\mathrm B}$ is the Berry holonomy, $\mu\in\mathbb Z$ is the Maslov index on a semiclassical branch, and $\Theta_{\partial}$ is a registered boundary/spin phase. On variations of $\ell$ that fix the eigenline loop, caustic class and boundary data, the last three terms are constant, so they do not alter the calibration (Q.0.2e.3). A change in any of those data is classified by its own summand in (Q.0.2e.4), rather than being absorbed into $\kappa_A$.

*Proof.* Direct Born-rule evaluation gives (Q.0.2e.1a); its two centered probabilities are $(\cos\ell,\sin\ell)$ and therefore recover the reference phase modulo $2\pi$. Both unitaries fix $|0\rangle$ and hence cannot differ by a nontrivial global phase. Equality gives $e^{i\ell}=e^{i(\kappa_A/\hbar)\ell}$ on an open interval. Differentiation at $\ell=0$ gives $1=\kappa_A/\hbar$. Conversely, (Q.0.2e.3) makes (Q.0.2e.1)--(Q.0.2e.2) identical. The adiabatic phase theorem gives the Berry holonomy, the semiclassical caustic contribution is $-\pi\mu/2$, and independent boundary or spin transport contributes $\Theta_\partial$. Holding their defining data fixed makes those terms locally constant in the calibration coordinate, so the action-phase slope remains $\kappa_A/\hbar$. ∎

**Resolution TV-Q-03-P1 (Metadata).** Exact domain: the real-parameter two-level coherent family, preparation and normalized $x/y$ readouts in (Q.0.2e.1)--(Q.0.2e.2), and closed adiabatic eigenline/semiclassical paths carrying the data in (Q.0.2e.4). Premises: the explicit reference control coordinate, the ledger identification $\mathcal L(\ell)=\ell$, exact equality of the PU and reference coherent channels on an open interval, $\kappa_A>0$, and fixed geometric/caustic/boundary data for the local slope comparison. Equivalence: equality of the complete normalized coherent response pair, with phases taken modulo $2\pi$. Budget: every real $\ell$, every integer event count $N$, both readout bases, and every registered phase summand. Verifier: normalization and (Q.0.2e.1a), channel equality on an open neighborhood of zero, the phase derivative at zero, the event-character substitution, and separate typing of Berry holonomy, integer Maslov index and boundary ledger. Falsifier: unequal response or phase slopes, a geometric or boundary contribution absorbed into $\kappa_A$, or failure of channel equality after (Q.0.2e.3). Provenance class: source-internal finite coherent preparation/control/readout construction conditional on the channel-identification bridge. Downstream consumers: Convention Q.0.2x, Definition Q.0.7e and `TV-Q-03`. Theorem Q.0.2e gives `positive-discharge` of the conditional coherent-channel calibration: once the two channels are identified, their response equality forces $\kappa_A=\hbar$. Constructing the common physical implementation that proves that identification, and populating the Berry--Maslov path data rather than merely separating their types, remain outside this partial scope.

### Q.0.5 Conditional Stationarity Transfer

**Definition Q.0.2a (Registered Phase Sector).** A phase sector is an equivalence class of admissible paths on which the independently registered differential-character/connection data and boundary data are fixed. The integer $k$ in Theorem Q.0.4 is the lift of an exact trivial-phase condition; it is a topological winding number only when a separate integral homotopy or cohomology certificate identifies it as such. Variations within a sector preserve the registered data.

**Corollary Q.0.3 (Conditional Stationarity Transfer).** On a fixed calibrated sector with constant $\kappa_A>0$ and $\mathcal S=\kappa_A\mathcal L$,
$$
\delta\mathcal S=0
\quad\Longleftrightarrow\quad
\delta\mathcal L=0.
$$
This equivalence is a scalar-rescaling identity; it neither selects $\kappa_A$ nor proves the existence of a continuum action. ∎

**Physical Interpretation:** Principle Q.0.3a and Theorem Q.0.3a make the continuum Euler–Lagrange equation the stationarity condition of the $\Gamma$-limit of the finite predictive ledger on the declared fixed-boundary and fixed-holonomy class. The conclusion is constructive: discrete PCE minimizers converge, their limit minimizes the continuum ledger, and differentiability then gives $\delta\mathcal S=0$. The independent constant $\kappa_A$ calibrates ledger units to action units. Nonminimizing saddles remain governed by the separately stated first-variation gate.

### Q.0.6 Connection to the Path Integral

On a branch carrying an independently defined quantum path amplitude and a historywise action--ledger calibration, its phase factor can be rewritten in ledger variables. This is an algebraic representation; it does not derive the Feynman measure or identify thermodynamic entropy with quantum phase.

**Proposition Q.0.2 (Conditional Ledger Representation of a Path Amplitude).** Suppose an independently defined quantum path amplitude has phase $e^{i\mathcal S[\phi]/\hbar}$ and a certified branch identifies
$$
\mathcal S[\phi]=\kappa_A\mathcal L[\phi].
$$
Then
$$
e^{i\mathcal S[\phi]/\hbar}
=e^{i(\kappa_A/\hbar)\mathcal L[\phi]}.
$$
Only on the additional calibration $\kappa_A=\hbar$ does this reduce to $e^{i\mathcal L[\phi]}$. This algebraic substitution neither derives the Feynman measure nor identifies thermodynamic entropy with quantum phase. ∎

**Proposition Q.0.2c (Finite Entropy Transform Duality).** Let $\mathcal H_\Lambda$ be a finite cutoff set of admissible histories and define
$$
E[\phi]:=\sum_{i\in\phi}\varepsilon_i,
\qquad
Z_\Lambda(z):=\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{-zE[\phi]},
$$
where $w_\phi\ge0$ are branch weights independent of $z$. Assume in addition that the accepted calibration certificate gives $E[\phi]=\mathcal S[\phi]/\hbar$ for every history in $\mathcal H_\Lambda$. Then $Z_\Lambda(z)$ is an entire function of $z$, and its two distinguished finite-cutoff evaluations are
$$
Z_\Lambda(1)=\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{-E[\phi]},
$$
the finite Gibbs/Laplace weight of the registered additive event ledger, and
$$
Z_\Lambda(-i)=\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{iE[\phi]}
=
\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{i\mathcal S[\phi]/\hbar},
$$
the finite path-amplitude weight of Proposition Q.0.2. For a countable history set $\mathcal H$, assume the same certificate gives $E[\phi]=\mathcal S[\phi]/\hbar$ for every $\phi\in\mathcal H$. The same analytic statement then holds on any domain on which
$$
Z(z)=\sum_{\phi\in\mathcal H}w_\phi e^{-zE[\phi]}
$$
converges normally on compact subsets. In particular, the Gibbs value at $z=1$ is defined whenever $1$ lies in such a domain, and the phase value at $z=-i$ is defined either when $-i$ lies in such a domain or as the limit of finite-cutoff oscillatory amplitudes whenever that limit exists.

*Proof.* For finite $\mathcal H_\Lambda$, each term $w_\phi e^{-zE[\phi]}$ is entire in $z$, and a finite sum of entire functions is entire. Substituting $z=1$ gives the Gibbs/Laplace weight. Substituting $z=-i$ gives $e^{iE[\phi]}$, and by the historywise calibration hypothesis of Proposition Q.0.2c,
$$
E[\phi]=\mathcal S[\phi]/\hbar\qquad\text{on the calibrated branch}.
$$
This gives the path-amplitude form. For countable $\mathcal H$, normal convergence on compact subsets gives analyticity by the Weierstrass theorem on the stated domain. Boundary or off-domain phase evaluations are not automatic; they are exactly the finite-cutoff oscillatory limits stated in the hypothesis. ∎

**Corollary Q.0.2d (Single Entropy-Transform Ledger).** Under Proposition Q.0.2c, including its historywise calibration $E[\phi]=\mathcal S[\phi]/\hbar$, the finite Gibbs/Laplace weight and the finite path-amplitude weight are two evaluations of the same finite entropy transform:
$$
Z_\Lambda(z)=\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{-zE[\phi]},
\qquad
E[\phi]=\sum_{i\in\phi}\varepsilon_i.
$$
In particular,
$$
Z_\Lambda(1)=\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{-E[\phi]},
\qquad
Z_\Lambda(-i)=\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{iE[\phi]}
=\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{i\mathcal S[\phi]/\hbar}.
$$
Thus, at finite cutoff, the two displayed weights are evaluations at $z=1$ and $z=-i$ of the same registered transform. This analytic-continuation identity does not identify a physical Gibbs ensemble with a quantum path integral or derive either ledger from SPAP; those interpretations require the independent weight, action-calibration, and quantum-phase hypotheses. For a countable history set, the statement holds only on domains of normal convergence or through the explicitly stated finite-cutoff oscillatory limit.

*Proof.* Proposition Q.0.2c defines the finite transform $Z_\Lambda(z)$ and proves it is entire. Evaluation at $z=1$ gives the Gibbs/Laplace weight. Evaluation at $z=-i$ gives $e^{iE[\phi]}$, and the historywise calibration hypothesis of Proposition Q.0.2c gives $E[\phi]=\mathcal S[\phi]/\hbar$. The countable case inherits exactly the normal-convergence and finite-cutoff-limit qualifications already stated in Proposition Q.0.2c. ∎

**Corollary Q.0.4 (Conditional Ledger Phase Matching).** Under Proposition Q.0.2 and the calibration $\kappa_A=\hbar$, relative phases are differences of the certified dimensionless ledger modulo $2\pi$. Without that bridge, equal structural or thermodynamic costs do not imply constructive quantum interference. ∎

### Q.0.6.1 Selected Update-Count Character Duality

**Convention Q.0.6a.0 (Character Status).** The character $N\mapsto e^{iN\ln2}$ is a mathematically selected character of the update-count group. It is a physical phase only after the independent action and quantum-phase calibrations above. Density of this character in $U(1)$ does not derive a gauge symmetry or select a gauge dynamics.

**Definition Q.0.6a.1 (Update-Count Group Completion).** Let $\mathbb N$ be the monoid of registered event counts under addition. Its Grothendieck group completion is $\mathbb Z$. A character of $\mathbb Z$ is a homomorphism
$$
\chi:\mathbb Z\to U(1).
$$
The Landauer character is
$$
\chi_L(N)=e^{iN\ln 2}.
\tag{Q.0.6a}
$$

**Theorem Q.0.6a.2 (Pontryagin Dual of Update Count).** The character group of the update-count completion is
$$
\widehat{\mathbb Z}\cong U(1),
\tag{Q.0.6b}
$$
with isomorphism determined by
$$
\theta\in\mathbb R/2\pi\mathbb Z
\quad\longmapsto\quad
\chi_\theta(N)=e^{iN\theta}.
$$
Under this identification, the Landauer character is the point $\theta=\ln2\pmod{2\pi}$, and its image
$$
G_L=\{\chi_L(N):N\in\mathbb Z\}
$$
is dense in $U(1)$.

*Proof.* A homomorphism $\chi:\mathbb Z\to U(1)$ is determined by $\chi(1)$. Conversely, every $z\in U(1)$ defines a homomorphism by $\chi_z(N)=z^N$. Thus $\widehat{\mathbb Z}\cong U(1)$. Writing $z=e^{i\theta}$ gives the displayed parameterization. The Landauer character has $z=e^{i\ln2}$. Density of its image is Theorem Q.0.7d, equivalently irrationality of $\ln2/(2\pi)$ from Lemma Q.0.7b. ∎

**Theorem Q.0.6a.3 (Selected-Character Fourier Sums of Update Histories).** Let $\mathcal H_\Lambda$ be a finite cutoff set of histories, with update count $N[\gamma]\in\mathbb Z$ and weights $w_\gamma\ge0$. Define the finite update-count measure
$$
\mu_\Lambda
=
\sum_{\gamma\in\mathcal H_\Lambda}
w_\gamma\,\delta_{N[\gamma]}.
\tag{Q.0.6c}
$$
Its Fourier transform at the selected Landauer character is the exact finite sum
$$
\widehat\mu_\Lambda(\chi_L)
=
\sum_{\gamma\in\mathcal H_\Lambda}
w_\gamma\,\chi_L(N[\gamma])
=
\sum_{\gamma\in\mathcal H_\Lambda}
w_\gamma e^{iN[\gamma]\ln2}.
\tag{Q.0.6d}
$$
Equation (Q.0.6d) is a selected-character Fourier sum. It is a physical path amplitude only on a branch satisfying Convention Q.0.6a.0's independent action and quantum-phase calibrations. If, in addition, every retained history has a certified equality
$$
\frac{\mathcal S[\gamma]}{\hbar}
=N[\gamma]\ln2+\Delta[\gamma],
$$
then its calibrated finite amplitude is
$$
\sum_{\gamma\in\mathcal H_\Lambda}
w_\gamma e^{i\Delta[\gamma]}\chi_L(N[\gamma]).
\tag{Q.0.6e}
$$

*Proof.* The Fourier transform of a finite measure on $\mathbb Z$ at a character $\chi$ is
$$
\widehat\mu(\chi)=\sum_N\mu(N)\chi(N).
$$
Substitution of (Q.0.6c) and $\chi=\chi_L$ gives (Q.0.6d). Under the separately certified historywise action equality, multiplication by $e^{i\Delta[\gamma]}$ gives (Q.0.6e). No physical-amplitude statement follows from the Fourier identity without those calibrations. ∎

**Corollary Q.0.6a.4 (Finite Cyclic-Character Orthogonality).** On the cyclic quotient $\mathbb Z/q\mathbb Z$, the characters
$$
\chi_j(n)=e^{2\pi ijn/q},
\qquad j=0,\ldots,q-1,
$$
satisfy
$$
\frac1q\sum_{n=0}^{q-1}
\chi_j(n)\overline{\chi_k(n)}
=
\delta_{jk}.
\tag{Q.0.6f}
$$

*Proof.* If $j=k$, every summand is $1$. If $j\ne k$, the sum is a geometric series with ratio $e^{2\pi i(j-k)/q}\ne1$ and therefore vanishes. Because $q\ln2\notin2\pi\mathbb Z$ for every $q\ge1$, $\chi_L$ does not descend to a nontrivial character of $\mathbb Z/q\mathbb Z$. Thus (Q.0.6f) is generic finite Fourier orthogonality; a physical interference rule additionally requires a separately realized coherent phase branch. ∎

## Q.0.7 Selected Update-Count Character and Its $U(1)$ Closure

This section studies the cyclic character generated by the chosen phase increment $\ln2$. Since $\ln2/(2\pi)$ is irrational, its image is dense in $U(1)$. Density is an arithmetic and topological statement; a physical phase assignment and any local gauge or Noether conclusion require the separate calibration and operational-symmetry branches.

---

### Q.0.7.1 The Landauer Angle

Define the *Landauer angle* and its reciprocal by:
$$\alpha_L := \frac{\ln 2}{2\pi} \approx 0.110317800$$
$$\beta_L := \frac{2\pi}{\ln 2} = \frac{1}{\alpha_L} \approx 9.064720284$$

The number $\alpha_L$ is the registered ratio $\ln2/(2\pi)$. Interpreting it as a physical phase per event requires the action--entropy and quantum-phase calibrations; Theorem 31 does not supply that identification.

---

### Q.0.7.2 Transcendence of the Landauer Angle

**Lemma Q.0.7b (Transcendence of the Landauer Phase Ratio).** *The ratio*
$$
\alpha_L = \frac{\ln 2}{2\pi}
$$
*is transcendental over $\mathbb{Q}$. In particular, it is irrational.*

*Proof.* Suppose for contradiction that $\alpha_L$ is algebraic. Define
$$
b := -2i\alpha_L.
$$
Then $b$ is algebraic. Since $\alpha_L>0$, $b$ is non-real and therefore $b\notin\mathbb{Q}$. By the Gelfond–Schneider theorem [Gelfond 1934; Schneider 1935], if $a\in\overline{\mathbb Q}\setminus\{0,1\}$ and $b\in\overline{\mathbb Q}\setminus\mathbb Q$, then every value of $a^b$ is transcendental. Taking $a=-1$ and using the branch $\log(-1)=i\pi$ gives one value
$$
(-1)^b
=
\exp(b\,i\pi)
=
\exp(2\pi\alpha_L)
=
\exp(\ln 2)
=
2.
$$
This value is algebraic, contradicting Gelfond–Schneider. Hence $\alpha_L$ is not algebraic, so it is transcendental and therefore irrational. $\square$

**Remark Q.0.7b.1: Scope of the Transcendence Statement.** The proof of Lemma Q.0.7b does not require algebraic independence of $\pi$ and $\ln 2$. It uses only the Gelfond–Schneider theorem and the identity $\exp(2\pi\alpha_L)=2$. The subsequent equidistribution and three-gap results require only irrationality, but the stronger transcendence statement rules out every rational or algebraic phase-locking replacement of $\alpha_L$.

---

### Q.0.7.3 Exact Matching for a Registered Irrational Phase Step

**Corollary Q.0.7c (Exact Matching for the Registered Irrational Phase Step).** *Assume that each event in the declared history family is independently assigned the phase increment $\ln2$, and assume Lemma Q.0.7b. Then the exact selected-character phase-matching condition*
$$(N[\phi_1] - N[\phi_2]) \cdot \ln 2 = 2\pi k \qquad (k \in \mathbb{Z})$$

*implies:*
$$N[\phi_1] = N[\phi_2] \quad \text{and} \quad k = 0$$

*Proof.* Dividing by $2\pi$:
$$(N[\phi_1] - N[\phi_2]) \alpha_L = k$$

If $N[\phi_1] - N[\phi_2] \neq 0$, then $\alpha_L = k/(N[\phi_1] - N[\phi_2]) \in \mathbb{Q}$, contradicting Lemma Q.0.7b. Hence $N[\phi_1] = N[\phi_2]$, and then $k = 0$. $\square$

**Interpretation.** On this registered phase-assignment branch, two paths with different integer event counts cannot have exactly equal phase modulo $2\pi$. This arithmetic selection rule does not derive the physical phase assignment, path amplitudes, or a continuous interference model from SPAP or reset heat.

---

### Q.0.7.4 Dense Cyclic Subgroup of $U(1)$

**Theorem Q.0.7d (Density of the Registered Phase Generator).** *On the branch that assigns phase $N\ln2$ to an integer registered event count $N$, define the generator*
$$g_L := e^{i\ln 2} \in U(1)$$

*The subgroup generated by integer powers of $g_L$:*
$$G_L := \{e^{iN\ln 2} : N \in \mathbb{Z}\} = \{g_L^N : N \in \mathbb{Z}\}$$

*is dense in $U(1)$. Equivalently, the sequence $\{N\alpha_L \bmod 1\}_{N \in \mathbb{Z}}$ is dense (and equidistributed) in $[0,1)$.*

*Proof.* By Lemma Q.0.7b, $\alpha_L$ is irrational. The one-dimensional case of Kronecker's approximation theorem [Kronecker 1884] states that for irrational $\alpha$, the set $\{N\alpha \bmod 1 : N \in \mathbb{Z}\}$ is dense in $\mathbb{R}/\mathbb{Z}$.

Applying this to $\alpha = \alpha_L$ implies $\{e^{2\pi i N\alpha_L}\}_{N \in \mathbb{Z}} = \{e^{iN\ln 2}\}_{N \in \mathbb{Z}}$ is dense in $U(1)$.

Moreover, Weyl's equidistribution theorem [Weyl 1916] strengthens this: for irrational $\alpha$, the sequence $\{N\alpha \bmod 1\}_{N=1}^{M}$ becomes uniformly distributed as $M \to \infty$:
$$\lim_{M \to \infty} \frac{1}{M} \#\{1 \leq N \leq M : N\alpha \bmod 1 \in [a,b)\} = b - a$$

for any $0 \leq a < b \leq 1$. $\square$

**Corollary Q.0.7d′ (Closure of the Registered Dense Cyclic Subgroup).** *The topological closure of the registered phase subgroup is the full circle group:*
$$\overline{G_L} = U(1)$$

*Equivalently, for every target phase $e^{i\theta} \in U(1)$ and every tolerance $\nu > 0$, there exists $N \in \mathbb{Z}$ such that:*
$$|e^{iN\ln 2} - e^{i\theta}| < \nu$$

*Proof.* The closure of a dense subset equals the ambient space. Apply Theorem Q.0.7d. $\square$

**Theorem Q.0.7d2 (Registered Phase-Action and Holonomy Completion).** Let
$$
G_L=\{e^{iN\ln2}:N\in\mathbb Z\}\subset U(1),
$$
which is dense by Theorem Q.0.7d, and let $(Y,d)$ be a complete metric space of finite-resolution response configurations. Suppose there is an isometric action
$$
\rho_L:G_L\longrightarrow\operatorname{Isom}(Y)
$$
such that every orbit map is uniformly continuous when $G_L$ carries the inherited circle metric. Then there is a unique continuous isometric action
$$
\overline\rho:U(1)\longrightarrow\operatorname{Isom}(Y)
$$
extending $\rho_L$. Every continuous $G_L$-invariant response functional is $\overline\rho(U(1))$-invariant. The same statement holds cellwise for a finite product cover. If a continuous $U(1)$ action is registered from the outset, the invariance conclusion follows directly from density and continuity, with no metric or isometry hypothesis.

If, in addition, $Y$ is smooth, $h:Z_1(Y)\to U(1)$ is a homomorphism, and a closed two-form $\Omega$ satisfies
$$
\left[\frac{\Omega}{2\pi}\right]
\in
\operatorname{im}\!\left(H^2(Y;\mathbb Z)\to H^2_{\mathrm{dR}}(Y;\mathbb R)\right),
\qquad
h(\partial C)=\exp\!\left(i\int_C\Omega\right),
\tag{Q.0.7d2.1}
$$
then $(h,\Omega)$ is a degree-two differential character. It determines, up to connection-preserving isomorphism, a principal $U(1)$ bundle with connection of curvature $\Omega$ and holonomy $h$. The physical charge convention is $\Omega=qF$.

*Proof.* For $z\in U(1)$ choose $g_n\in G_L$ with $g_n\to z$. Uniform continuity makes $\rho_L(g_n)y$ Cauchy; completeness supplies a limit independent of the approximating sequence. Define $\overline\rho(z)y$ by that limit. Passing to limits proves the isometry and group laws, while
$$
d(\overline\rho(z_n)y_n,\overline\rho(z)y)
\le d(y_n,y)+d(\overline\rho(z_n)y,\overline\rho(z)y)
$$
gives joint continuity. Density gives uniqueness and extends invariance. If the $U(1)$ action is registered and continuous, then for continuous $G_L$-invariant $Z$ and $g_m\to z$ in $G_L$, continuity of the action and of $Z$ give $Z(z\cdot y)=\lim_mZ(g_m\cdot y)=Z(y)$. The final assertion is the differential-character classification of principal $U(1)$ bundles with connection under the integral-period and boundary identities (Q.0.7d2.1). ∎

**Corollary Q.0.7d3 (Local Gauge and Noether Completion on the Registered Branch).** Assume the cellwise completed actions and differential characters are compatible under refinement and descent, and the continuum branch has the differentiable minimally coupled action and boundary hypotheses of Theorem G.6b. Then
$$
\phi\mapsto e^{iq\alpha(x)}\phi,
\qquad
A_\mu\mapsto A_\mu-\partial_\mu\alpha,
$$
and on shell
$$
\nabla_\mu J^\mu=0,
\qquad
J^\mu=-iq\bigl(\phi^*D^\mu\phi-(D^\mu\phi)^*\phi\bigr),
$$
in the sign convention of Theorem G.6b.

*Proof.* Refinement compatibility and differential-character descent produce one local $U(1)$ bundle with connection. Varying the differentiable invariant action by compactly supported $\alpha$ and integrating by parts gives the result. ∎

**Theorem Q.0.7d4 (Explicit Refining Event-Character Gauge and Ward Model).** Let $K$ be a finite oriented cell complex. Assign $U_e\in U(1)$ to every oriented edge with $U_{\bar e}=U_e^{-1}$ and $\phi_v\in\mathbb C$ to every vertex. For $z_v=e^{i\alpha_v}$ define
$$
\phi_v\longmapsto z_v\phi_v,
\qquad
U_e\longmapsto z_{t(e)}U_ez_{s(e)}^{-1}.
\tag{Q.0.7d4.1}
$$
For positive weights $w_e,\beta_f$ and any real $C^1$ function $V$ on $[0,\infty)$, the finite action
$$
S_K
=\sum_e w_e|\phi_{t(e)}-U_e\phi_{s(e)}|^2
+\sum_f\beta_f\bigl(1-\operatorname{Re}\operatorname{Hol}_{\partial f}(U)\bigr)
+\sum_vV(|\phi_v|^2)
\tag{Q.0.7d4.2}
$$
is invariant under (Q.0.7d4.1). If a refinement replaces $e$ by the oriented path $e_1\cdots e_r$, impose
$$
U_e=U_{e_r}\cdots U_{e_1}.
\tag{Q.0.7d4.3}
$$
Then every coarse-loop holonomy equals its refined-loop holonomy, and the rule is compatible with successive refinements.

Suppose the admitted oriented event loops carry an additive homological count
$$
N:H_1(K;\mathbb Z)\longrightarrow\mathbb Z.
$$
By the universal-coefficient isomorphism, choose an integral cellular cocycle $n\in Z^1(K;\mathbb Z)$ representing $N$. The background assignment
$$
U_e^{(N)}:=e^{i n(e)\ln2}
$$
then gives, simultaneously for every admitted loop $\gamma$,
$$
\operatorname{Hol}_\gamma(U^{(N)})=e^{iN([\gamma])\ln2}.
\tag{Q.0.7d4.4}
$$
Give every edge a unit parameter interval. On any subdivision, assign to a child interval $I$ the phase $\exp(i n(e)|I|\ln2)$, with the inherited orientation. Products over partitions recover $U_e^{(N)}$, and partition refinement is associative, so the whole event character has an explicit refinement-compatible connection representative.

Variation of the vertex phase gives the oriented edge current
$$
J_e:=2w_e\operatorname{Im}
\bigl(\overline{\phi_{t(e)}}U_e\phi_{s(e)}\bigr)
$$
and define $(\operatorname{div}J)_v:=\sum_{t(e)=v}J_e-\sum_{s(e)=v}J_e$. The matter Euler--Lagrange equation then gives the on-shell interior identity
$$
(\operatorname{div}J)_v=0.
\tag{Q.0.7d4.5}
$$
Summing over a vertex region $R$ gives the exact boundary Ward balance
$$
\sum_{v\in R}(\operatorname{div}J)_v
=\sum_{e\in\partial R}\operatorname{sgn}_R(e)J_e.
\tag{Q.0.7d4.6}
$$
The finite-dimensional reference measure $\prod_vd^2\phi_v\prod_edU_e$, with normalized Haar measure $dU_e$, is invariant under (Q.0.7d4.1); hence this bosonic finite realization has unit Jacobian and zero gauge anomaly. Fermionic determinant phases require a separate anomaly calculation.

*Proof.* Each covariant edge difference in (Q.0.7d4.2) is multiplied by $z_{t(e)}$, face holonomies are conjugated trivially in $U(1)$, and the potential depends only on $|\phi_v|$, proving invariance. Associativity of group multiplication proves refinement functoriality and holonomy preservation. Evaluation of the cocycle on a cycle is $N([\gamma])$, proving (Q.0.7d4.4) for all admitted loops at once; additivity of interval lengths proves the subdivision statement. Differentiating the $C^1$ action with respect to $\alpha_v$ gives (Q.0.7d4.5); cancellation of oppositely oriented interior edges gives (Q.0.7d4.6). Lebesgue rotations and Haar translations preserve the finite measure, so its change-of-variables Jacobian is one. ∎

**Resolution TV-Q-04-R1 (Metadata).** Exact domain: finite oriented cell complexes, their edge-subdivision refinements, complex scalar matter, and additive homological event-count characters. Premises: positive weights, $V\in C^1([0,\infty))$, the connection rule (Q.0.7d4.3), an integral cocycle representing $N$, and the finite-dimensional invariant reference measure. Equivalence: vertex gauge transformations, cocycle representatives of the same cohomology class, and refinement maps preserving coarse holonomy. Budget: every vertex, edge, face, refinement and admitted event loop. Verifier: gauge invariance, simultaneous character evaluation, holonomy products, successive-refinement commutativity, current variation, boundary cancellation and measure Jacobian. Falsifier: two homologous loops receiving inconsistent phases, a refinement changing coarse holonomy, a failed Ward identity, an unrecorded boundary flux or a nonunit Jacobian in the declared matter class. Provenance class: source-internal finite lattice-gauge construction. Downstream consumers: Theorem Q.0.7d2, Corollary Q.0.7d3 and `TV-Q-04`. Theorem Q.0.7d4 gives `positive-discharge` of the exact event-character local gauge/Noether construction in its finite bosonic class, including boundary and anomaly control. Nonhomological event ledgers and fermionic matter retain their separate compatibility and anomaly conditions.

---

### Q.0.7.5 Registered Event-Phase Decomposition

**Definition Q.0.7e (Registered Forward Event-Phase Ledger and Overhead Decomposition).** Let $\phi$ be a concatenated forward history of registered events carrying dimensionless increments $\{\varepsilon_i\}_{i\in\phi}$, and define
$$
\Theta_{\mathrm{evt}}(\phi):=\sum_{i\in\phi}\varepsilon_i,
\qquad
U_{\mathrm{evt}}(\phi):=e^{i\Theta_{\mathrm{evt}}(\phi)}.
$$
If $\phi$ belongs to the calibrated action ensemble, then $\Theta_{\mathrm{evt}}(\phi)=\mathcal S(\phi)/\hbar$. If every registered event is assigned the structural phase reference $\varepsilon_0=\ln2$ and a certified phase overhead $\delta\varepsilon_i:=\varepsilon_i-\ln2\ge0$, then
$$
\Theta_{\mathrm{evt}}(\phi)
=N(\phi)\ln2+\Delta(\phi),
\qquad
\Delta(\phi):=\sum_{i\in\phi}\delta\varepsilon_i\ge0.
\tag{Q.0.7e.1}
$$
These are structural phase weights. Identifying $\varepsilon_i$ with a registered physical reset ledger requires the separate eventwise calibration
$$
\varepsilon_i=\varepsilon_{\mathrm{reset},i}=H_{q_i}(P_i\mid R_i)+\varepsilon_{\mathrm{diss},i}.
\tag{Q.0.7e.0}
$$
On the conditionally uniform branch $H_{q_i}(P_i\mid R_i)=\ln2$, this gives $\delta\varepsilon_i=\varepsilon_{\mathrm{diss},i}$. Without (Q.0.7e.0), structural phase overhead, reset entropy, and bath heat remain distinct.

On the joint branch where the action calibration is eventwise additive, (Q.0.7e.0) holds, $H_{q_i}(P_i\mid R_i)=\ln2$, and $\varepsilon_{\mathrm{diss},i}=0$, write $\Delta\mathcal S_i$ for one event's action increment and $T_i$ for its registered reset temperature. That event satisfies
$$
\frac{\Delta\mathcal S_i}{\hbar}
=
\frac{\langle Q_{\mathrm{bath},i}\rangle}{k_BT_i}
=
\varepsilon_i
=\ln2.
$$
These are three calibrated projections of one event. A source-exhaustive cost ledger counts that event once rather than summing the action, reset, and phase readings as independent costs. The equality supplies no calibration or common microscopic mechanism beyond the stated joint branch.

This additive positive ledger is not, by itself, connection holonomy: holonomy inverts under oriented path reversal, whereas entropy production of a physically reversed protocol need not. It becomes a holonomy representation only on a branch carrying the differential character of Theorem Q.0.7d2 and the explicit compatibility certificate
$$
h(\gamma)=e^{i\Theta_{\mathrm{evt}}(\gamma)}
\tag{Q.0.7e.2}
$$
for the admitted oriented loops. The formal inverse phase is distinct from the entropy ledger of a physically reversed process.

**Definition Q.0.7e′ (Arithmetic Phase-Defect Functionals).** For $x\in\mathbb R$, let $\|x\|_{\mathbb Z}:=\inf_{m\in\mathbb Z}|x-m|$. For $N\ge1$, define
$$
\delta_N
:=\min_{k\in\mathbb Z}|N\ln2-2\pi k|
=2\pi\left\|\frac{N\ln2}{2\pi}\right\|_{\mathbb Z}.
$$
For a fixed positive exact-closure integer $k$, define
$$
\Delta_k^*
:=\min_{N\in\mathbb Z_{\ge0}}|2\pi k-N\ln2|.
$$
These are arithmetic mismatch functionals. Neither is a topological invariant without an independent differential-character or homotopy certificate.

### Q.0.7.6 Exact-Closure Overhead Principle

**Proposition Q.0.7f (Registered Exact-Phase-Closure Identity).** Let $\gamma$ be a nonempty registered forward loop satisfying Definition Q.0.7e and the exact closure condition
$$
U_{\mathrm{evt}}(\gamma)=1.
$$
Then there is a unique integer lift $k\ge1$ such that
$$
\Theta_{\mathrm{evt}}(\gamma)=2\pi k,
$$
and
$$
\Delta[\gamma]
=2\pi k-N[\gamma]\ln2.
\tag{Q.0.7f.1}
$$
Consequently $\Delta[\gamma]\ge0$ implies $N[\gamma]\ln2\le2\pi k$. The integer $k$ is an exact-phase lift; it is topological only when the separate certificate (Q.0.7e.2) and a homotopy/cohomology identification are supplied.

*Proof.* Equation (Q.0.7e.1) and $U_{\mathrm{evt}}(\gamma)=1$ give $\Theta_{\mathrm{evt}}(\gamma)\in2\pi\mathbb Z$. Nonemptiness and $\varepsilon_i\ge\ln2>0$ make this phase lift positive. Substitution gives (Q.0.7f.1). ∎

**Corollary Q.0.7g (Strict Overhead on a Nonzero Exact-Closure Branch).** Under Proposition Q.0.7f,
$$
\Delta[\gamma]>0.
$$

*Proof.* If $\Delta[\gamma]=0$, then $N[\gamma]\ln2=2\pi k$ with positive integers $N[\gamma]$ and $k$, contradicting the irrationality of $\ln2/(2\pi)$. ∎

**Registered interpretation.** A nonempty forward event ledger that closes its selected phase exactly has positive structural phase overhead. It is a topological cost only when the differential-character and topological-identification premises are registered, and it is physical entropy production only when the eventwise reset equality (Q.0.7e.0) is certified.


**Definition Q.0.7g.1 (Closure-Lift Ledger $\mathfrak C_{\mathrm{ref}}$).** For a closed retained predictive loop $\gamma$ satisfying Proposition Q.0.7f, define
$$
q_{\mathrm{ref}}(\gamma)
:=\frac{\Theta_{\mathrm{evt}}(\gamma)}{2\pi}
\in\mathbb Z_{>0}.
$$
A closure-lift ledger is the finite record
$$
\mathfrak C_{\mathrm{ref}}
=
(\Gamma_{\mathrm{loop}},q_{\mathrm{ref}},N,\Delta,
\text{exact-closure domain},\text{deformation class},
\text{resolution window},\text{forward lock}).
$$
The integer is a topological or gauge charge only when the ledger also contains the differential-character compatibility and homotopy/cohomology identification of Definition Q.0.7e.

**Proposition Q.0.7g.2 (Closure-Lift Constancy on Continuous Exact-Closure Families).** Let a connected continuously parameterized family of loops remain in the exact-closure domain, and let $\Theta_{\mathrm{evt}}$ vary continuously on that family. Then $q_{\mathrm{ref}}$ is constant. A change of $q_{\mathrm{ref}}$ requires loss of exact closure or a discontinuity of the registered phase ledger. This is an integer-lift statement, not a universal local Noether-current law.

*Proof.* On the exact-closure family,
$$
q_{\mathrm{ref}}
=\Theta_{\mathrm{evt}}/(2\pi)
$$
is a continuous integer-valued function on a connected set and is therefore constant. Proposition Q.0.7f supplies the positive structural-overhead identity. A topological or gauge interpretation requires the additional identification certificate in Definition Q.0.7g.1, and a reset-entropy interpretation requires (Q.0.7e.0). ∎

---

### Q.0.7.7 Sector-Minimal Overhead

**Definition Q.0.7h (One-Sided and Symmetric Arithmetic Mismatches).** For $k\ge1$, define
$$
\Delta_k^+
:=
\min_{\substack{N\in\mathbb Z_{\ge0}\\N\ln2\le2\pi k}}
(2\pi k-N\ln2)
=
2\pi k-\left\lfloor\frac{2\pi k}{\ln2}\right\rfloor\ln2
$$
and
$$
\Delta_k^{\mathrm{sym}}
:=
\min_{N\in\mathbb Z}|2\pi k-N\ln2|.
$$
These are arithmetic mismatches. They equal the structural phase overhead of a realized loop only when an admitted exact-closure loop realizes the same pair $(k,N)$ under Definition Q.0.7e and Proposition Q.0.7f. Identifying that value with physical entropy production additionally requires the eventwise reset calibration (Q.0.7e.0).

**Proposition Q.0.7i (Bounds and Equidistribution of Arithmetic Mismatches).** For every $k\ge1$,
$$
0<\Delta_k^+<\ln2,
\qquad
0<\Delta_k^{\mathrm{sym}}<\frac{\ln2}{2}.
$$
With $\beta_L=2\pi/\ln2$,
$$
\frac{\Delta_k^+}{\ln2}=\{\beta_Lk\}\in(0,1),
$$
and $\{\Delta_k^+/\ln2\}_{k\ge1}$ is equidistributed in $(0,1)$.

*Proof.* The floor and nearest-integer definitions give $\Delta_k^+<\ln2$ and $\Delta_k^{\mathrm{sym}}\le\ln2/2$. Irrationality of $\beta_L$ makes both mismatches nonzero. Equality $\Delta_k^{\mathrm{sym}}=\ln2/2$ would make $\beta_Lk$ a half-integer and hence $\beta_L$ rational, which is impossible; therefore the symmetric upper bound is strict. Weyl's theorem applied to the irrational rotation $k\mapsto\{\beta_Lk\}$ gives equidistribution. ∎

---

### Q.0.7.8 Beatty Staircase Structure

**Proposition Q.0.7j (Beatty Staircase and the Two-Step Lower-Approximant Spectrum).** Let
$$
\beta_L=\frac{2\pi}{\ln2}\in(9,10),
\qquad
N_k^*:=\lfloor\beta_Lk\rfloor.
$$
Then:

1. $N_k^*$ is the largest integer $N$ satisfying $N\ln2\le2\pi k$.
2. $N_{k+1}^*-N_k^*\in\{9,10\}$.
3. The limiting frequencies of the $10$- and $9$-steps are $\beta_L-9$ and $10-\beta_L$, respectively.

These are statements about lower integer approximants. A cycle count or exact-closure loop is obtained only if the corresponding registered physical ledger realizes that integer pair.

*Proof.* Item 1 is the floor definition. Since $9<\beta_L<10$, consecutive floors differ by $9$ or $10$. The $10$-step occurs exactly when $\{\beta_Lk\}+\{\beta_L\}\ge1$; equidistribution from Proposition Q.0.7i gives limiting frequency $\{\beta_L\}=\beta_L-9$. ∎

---

### Q.0.7.9 Continued Fraction Spectrum

**Theorem Q.0.7k (Continued-Fraction Spectrum of Exceptional Phase Mismatch).** Let
$$
\alpha_L=\frac{\ln2}{2\pi}=[0;a_1,a_2,\ldots]
$$
and let $p_n/q_n$ be its convergents. Then:

1. for every $p\in\mathbb Z$ and $1\le q\le q_n$,
   $$
   \left|\alpha_L-\frac{p_n}{q_n}\right|
   \le
   \left|\alpha_L-\frac pq\right|,
   $$
   while the second-kind bound is
   $$
   |q_n\alpha_L-p_n|
   \le|q\alpha_L-p|
   \qquad(1\le q<q_{n+1});
   $$
2. 
   $$
   \left|\alpha_L-\frac{p_n}{q_n}\right|
   <\frac1{q_nq_{n+1}}
   \le\frac1{q_n^2},
   $$
   and therefore
   $$
   |2\pi p_n-q_n\ln2|
   <\frac{2\pi}{q_{n+1}}
   \le\frac{2\pi}{q_n};
   $$
3. if $\gcd(p,q)=1$ and
   $$
   \left|\alpha_L-\frac pq\right|<\frac1{2q^2},
   $$
   then $p/q$ is a convergent.

*Proof.* Irrationality of $\alpha_L$ gives an infinite simple continued fraction. Items 1 and 3 are the standard first-kind, second-kind, and Legendre theorems. For item 2, the complete-quotient identity gives
$$
\left|\alpha_L-\frac{p_n}{q_n}\right|
=
\frac1{q_n(q_n\alpha_{n+1}+q_{n-1})}
<
\frac1{q_nq_{n+1}}.
$$
Multiplication by $2\pi q_n$ proves the phase-mismatch bound. ∎

**Corollary Q.0.7k′ (Legendre Criterion for a Small Phase Mismatch).** Let $k,N\ge1$, put $d=\gcd(k,N)$, and set $(p,q)=(k/d,N/d)$. If
$$
\left|\alpha_L-\frac{k}{N}\right|<\frac1{2N^2},
$$
equivalently
$$
|N\ln2-2\pi k|<\frac\pi N,
$$
then $p/q$ is a convergent of $\alpha_L$.

*Proof.* Reduction gives
$$
\left|\alpha_L-\frac pq\right|
<\frac1{2N^2}
\le\frac1{2q^2},
$$
so Legendre's theorem applies. ∎

**Theorem Q.0.7k.1 (Landauer Arithmetic Index for Integer Phase Pairs).** For $(N,k)\in\mathbb Z^2$, define
$$
\mathfrak I_L(N,k):=N\alpha_L-k,
\qquad
\delta_L(N,k):=2\pi|\mathfrak I_L(N,k)|.
$$
Then:

1. $\mathfrak I_L$ is additive under addition of integer pairs:
   $$
   \mathfrak I_L(N_1+N_2,k_1+k_2)
   =
   \mathfrak I_L(N_1,k_1)+\mathfrak I_L(N_2,k_2).
   $$
   It represents loop composition only on a realized additive loop ledger.
2. If $(k_n,N_n)=(p_n,q_n)$ is a convergent pair, then
   $$
   |q_n\alpha_L-p_n|
   \le|N\alpha_L-k|
   \qquad(1\le N<q_{n+1}).
   $$
3. If $N\ge1$, $\gcd(k,N)=1$, and $\delta_L(N,k)<\pi/N$, then $k/N$ is a convergent.

*Proof.* Item 1 is direct algebra. Item 2 is the second-kind approximation theorem. Item 3 is Corollary Q.0.7k′. These statements classify integer pairs; physical loop realization is an independent premise. ∎

---

### Q.0.7.10 Explicit Low-Mismatch Pairs

**Corollary Q.0.7l (Explicit Low-Mismatch $(k,N)$ Pairs).** For $(k_n,N_n)=(p_n,q_n)$,
$$
|2\pi k_n-N_n\ln2|<\frac{2\pi}{N_n},
$$
and the sign of $2\pi k_n-N_n\ln2$ alternates. A positive sign is a candidate one-sided mismatch. It becomes structural phase overhead only if Definition Q.0.7e and Proposition Q.0.7f are satisfied by an independently realized loop with that pair; physical entropy production additionally requires (Q.0.7e.0).

The continued fraction begins
$$
\alpha_L=[0;9,15,2,4,1,1,1,1,2,2,3,1,1,1,1,3,4,\ldots].
$$
Its first convergent pairs are
$$
(k,N)\in
\{(1,9),(15,136),(31,281),(139,1260),(170,1541),
(309,2801),(479,4342),(788,7143),\ldots\}.
$$
They follow from
$$
p_n=a_np_{n-1}+p_{n-2},
\qquad
q_n=a_nq_{n-1}+q_{n-2},
$$
with $(p_{-1},p_0)=(1,0)$ and $(q_{-1},q_0)=(0,1)$. The first absolute mismatches are
$$
0.0448606821\ldots,\quad
0.0202369485\ldots,\quad
0.00438678522\ldots,\quad
0.00268980757\ldots.
$$

---

### Q.0.7.11 Universal Crossover Bounds

**Corollary Q.0.7m (Arbitrarily Small Positive Arithmetic Mismatches).** For every $\zeta>0$, there exist integers $N,k\ge1$ such that
$$
0<2\pi k-N\ln2<\zeta.
$$
No loop or physical sector is asserted by this arithmetic existence statement.

*Proof.* Set
$$
\eta:=\min\left\{\frac{\zeta}{2\pi},\frac12\right\}.
$$
Density of $\{N\alpha_L\bmod1:N\ge1\}$ gives an $N$ with
$$
\{N\alpha_L\}\in(1-\eta,1).
$$
With $k=\lceil N\alpha_L\rceil$,
$$
0<2\pi(k-N\alpha_L)<2\pi\eta\le\zeta.
$$
The interval excludes $0$, so $k\ge1$. ∎

**Corollary Q.0.7m′ (Universal Arithmetic Crossover Bound).** Hurwitz's theorem gives infinitely many integer pairs satisfying
$$
|2\pi k-N\ln2|<\frac{2\pi}{\sqrt5\,N}.
$$
Consequently, along this subsequence, $N>2\pi/(\sqrt5\,\zeta)$ implies mismatch below $\zeta$. The constant $\sqrt5$ is the optimal universal Hurwitz constant; it is not a primitive physical proportion.

---

### Q.0.7.12 Three-Gap Structure

**Proposition Q.0.7n (Three-Gap Structure for Finite Arithmetic Phase Sets).** For $N_{\max}\ge1$, the set
$$
\{e^{in\ln2}:0\le n<N_{\max}\}
$$
partitions the circle into arcs of at most three distinct lengths.

*Proof.* Apply the three-gap theorem to the irrational rotation by $\alpha_L$. ∎

**Interpretation.** This is a finite arithmetic phase set. It describes accessible physical phases only on a branch that realizes the corresponding update histories and calibrates their ledger values as phases.

---

### Q.0.7.13 Finite-Budget Phase-Mismatch Selection

**Corollary Q.0.7o (Finite-Budget Phase-Mismatch Selection Rule).** Define
$$
\Delta\theta(n)
:=
\min_{k\in\mathbb Z}|n\ln2-2\pi k|
=2\pi\|n\alpha_L\|_{\mathbb Z}.
$$
If $q_j\le N_{\max}<q_{j+1}$, then
$$
\min_{1\le n\le N_{\max}}\Delta\theta(n)
=\Delta\theta(q_j),
\qquad
\Delta\theta(q_j)<\frac{2\pi}{q_{j+1}}.
$$
If $k$ is a nearest integer to $n\alpha_L$, $\gcd(k,n)=1$, and $\Delta\theta(n)<\pi/n$, then $k/n$ is a convergent. These statements determine arithmetic phase positions. They constrain interference only for independently realized, phase-calibrated histories and do not determine amplitudes.

*Proof.* The second-kind best-approximation property gives
$$
\|q_j\alpha_L\|_{\mathbb Z}
\le\|n\alpha_L\|_{\mathbb Z}
\qquad(1\le n<q_{j+1}),
$$
and Theorem Q.0.7k gives the upper bound. The last statement is Legendre's criterion. ∎

---

### Q.0.7.14 Decoherence from Overhead Fluctuations

**Proposition Q.0.7p (Conditional Ensemble Dephasing from Phase-Overhead Fluctuations).** *Let a family of processes $\phi$ share the same baseline cycle count $N[\phi]=N$, let $\Delta[\phi]$ have probability law $P(\Delta)$, and assume the accepted phase calibration gives $\mathcal S[\phi]/\hbar=N\ln2+\Delta[\phi]$ for every member of the ensemble. Then the ensemble-averaged phase factor factorizes as:*
$$\langle e^{i\mathcal{S}[\phi]/\hbar} \rangle = e^{iN\ln 2} \langle e^{i\Delta[\phi]} \rangle = e^{iN\ln 2} \Phi_\Delta(1)$$

*where $\Phi_\Delta(t):=\langle e^{it\Delta}\rangle$ is the characteristic function of $\Delta$. If a registered coherence observable is multiplied by this ensemble average, its visibility is multiplied by $|\Phi_\Delta(1)|\le1$.*

Because Definition Q.0.7e requires $\Delta\ge0$, a nondegenerate Gaussian law is inadmissible. For example, if $\Delta$ has a Gamma law with shape $r>0$ and scale $\theta>0$ on $[0,\infty)$, then
$$
\Phi_\Delta(1)=(1-i\theta)^{-r},
\qquad
|\Phi_\Delta(1)|=(1+\theta^2)^{-r/2}.
$$
This is an exact supported-law example. It becomes a dephasing prediction only after the coherence observable, ensemble preparation, and pushforward law of Remark Q.0.7p.1 are registered.

**Remark Q.0.7p.1: Conditional PCE-Induced Overhead Distribution.** Let a specified PCE state process $X_t$ satisfy the hypotheses of the applicable Appendix D stationary-law theorem, and let the overhead be a measurable observable $\Delta=\Delta(X_t)$. The stationary law of $X_t$ then induces a pushforward law $P_\Delta$. Concentration of $P_\Delta$ near zero requires, in addition, that $\Delta$ vanish on the relevant minimizing set and that the Appendix D concentration estimate control excursions into states with $|\Delta|>\epsilon$. Without these hypotheses, PCE dynamics neither determines a unique overhead law nor implies concentration at zero.

---

### Q.0.7.15 Modular Structure from Continued Fractions

**Remark Q.0.7q: The Modular Itinerary Canonically Induced by $\alpha_L$.** The continued fraction of $\alpha_L$ canonically produces a sequence of matrices in $GL_2(\mathbb{Z})$ via convergents:
$$M_n := \begin{pmatrix} p_n & p_{n-1} \\ q_n & q_{n-1} \end{pmatrix}, \qquad \det(M_n) = (-1)^{n-1}, \qquad M_n(\infty) = \frac{p_n}{q_n}$$

Equivalently, the digit string $[0; 9, 15, 2, 4, 1, 1, 1, 1, 2, 2, 3, \ldots]$ defines a word in the generators $S: \tau \mapsto -1/\tau$ and $T: \tau \mapsto \tau + 1$, giving a canonical coding of a geodesic on the modular surface $\mathcal{H}/PSL_2(\mathbb{Z})$ by continued fractions [Series 1985].

This gives a rigorous $PSL_2(\mathbb Z)$-structured itinerary for the chosen irrational number $\alpha_L=\ln2/(2\pi)$. The arithmetic construction alone supplies no bridge to $M=24$, the Leech lattice, $V^\natural$, the Monster, or a physical modular symmetry.

*Note:* The Klein $j$-invariant is defined on the upper half-plane $\mathcal{H} = \{\tau \in \mathbb{C} : \mathrm{Im}(\tau) > 0\}$; the real axis $\mathbb{R}$ lies on the boundary of $\mathcal{H}$, so expressions like $j(\alpha_L)$ are not defined as holomorphic values. The modular itinerary construction avoids this issue entirely. Further development of this connection is deferred to future work.

---

### Q.0.7.16 Gauge-Holonomy Interface

**Remark Q.0.7r: Gauge-Holonomy Interface.** Appendix G derives a local $U(1)$ redundancy with covariant derivative:
$$D_\mu\Psi = (\partial_\mu + \Omega_\mu + iq A_\mu)\Psi$$

and associated $U(1)$ holonomies $\exp(iq\oint_\gamma A_\mu dx^\mu)$ (Section G.4).

The chosen structural phase increment $\ln2$ gives $g_L=e^{i\ln2}$, and the irrationality of $\ln2/(2\pi)$ makes the cyclic subgroup $G_L=\langle g_L\rangle$ dense in $U(1)$. This is a group-closure statement conditional on assigning that phase increment to the registered event family. It does not derive a local gauge redundancy, connection, Noether current, or microscopic $U(1)$ origin from SPAP or reset heat.

Theorem Q.0.7d2 supplies the separate operational completion: a uniformly continuous isometric $G_L$ action extends uniquely to $U(1)$, while genuine connection holonomy requires its differential-character certificate. On the additional compatibility branch $h(\gamma)=e^{i\Theta_{\mathrm{evt}}(\gamma)}$, the registered event phase represents holonomy; exact trivial phase then gives Proposition Q.0.7f's closure identity. Corollary Q.0.7g gives positive structural phase overhead for a nonzero exact-closure lift. The formal inverse phase is not identified with entropy production of a physically reversed protocol.

Accordingly, the exact finite-cycle object is the integer-indexed subgroup $G_L$; its continuous closure is used only on the registered action/continuity branch, and its local gauge interpretation only on the differential-character/descent branch.


**Remark Q.0.7r′ (Conditional Event-Phase/Connection Compatibility).** The event ledger does not define a connection. On the differential-character branch of Theorem Q.0.7d2, let $h$ be the registered holonomy character. If (Q.0.7e.2) is independently certified, then for every admitted oriented loop $\gamma$,
$$
h(\gamma)
=e^{i\Theta_{\mathrm{evt}}(\gamma)}
=e^{i(N(\gamma)\ln2+\Delta(\gamma))}.
$$
If the bundle is trivial over a neighborhood of $\gamma$ and $A$ is a chosen local connection form there, this may be written as
$$
h(\gamma)=e^{iq\oint_\gamma A};
$$
on a nontrivial bundle the transition functions are part of the holonomy. For exact closure, $h(\gamma)=1$ and $N\ln2+\Delta=2\pi k$. The quantity $\Delta$ is structural phase overhead and is physical entropy production only under the separate registered-reset calibration. Local changes of section change the local potential but not $h$.

---

### Q.0.7.17 Non-Abelian Extension

**Theorem Q.0.7s (Non-Abelian Density Mechanism from Near-Identity Generation).** *Let $G$ be a connected semisimple real Lie group with Lie algebra $\mathfrak{g}$. Then there exists an identity neighborhood $\Omega \subset G$ on which $\log = \exp^{-1}$ is defined such that for any $g_1, \ldots, g_m \in \Omega$, if the Lie algebra generated by $\log(g_1), \ldots, \log(g_m)$ equals $\mathfrak{g}$, then the subgroup $\Gamma := \langle g_1, \ldots, g_m \rangle$ is dense in $G$, i.e., $\overline{\Gamma} = G$.*

*Proof.* This is the near-identity density criterion of Breuillard–Gelander [Breuillard & Gelander 2003, Theorem 2.1]. $\square$

**Corollary Q.0.7t (SU(2) Case: Torus Density Plus Non-Normalizer Implies Density).** *Let $G = SU(2)$ and let $T \subset SU(2)$ be a maximal torus. Suppose $\Gamma$ contains an element $t \in T$ whose rotation angle is an irrational multiple of $\pi$ (so $\overline{\langle t\rangle} = T$). If $\Gamma$ also contains an element $g \notin N_{SU(2)}(T)$ (equivalently, $gTg^{-1} \ne T$), then $\overline{\Gamma} = SU(2)$.*

*Consequently, once dense $SU(2)$ holds, the Solovay–Kitaev theorem [Kitaev, Shen & Vyalyi 2002] implies efficient approximation of arbitrary $SU(2)$ elements by words in the generators, matching the universality requirement in Appendix A.*

*Justification.* Since $\overline{\langle t\rangle} = T$, the closure $\overline{\Gamma}$ contains $T$. The only proper closed subgroups of $SU(2)$ containing a maximal torus are $T$ itself and its normalizer $N_{SU(2)}(T)=T\sqcup jT\cong\operatorname{Pin}(2)$, where $j^2=-I$. Moreover $N_{SU(2)}(T)/T\cong\mathbb Z_2$ and $N_{SU(2)}(T)/\{\pm I\}\cong O(2)$. If $g\notin N_{SU(2)}(T)$, the closed subgroup generated by $T$ and $g$ is therefore all of $SU(2)$.

**Remark Q.0.7t.1: Registered Non-Normalizer Requirement.** For the standard diagonal torus,
$$
U_\iota=i\sigma_x
$$
satisfies $U_\iota T U_\iota^{-1}=T$, so $U_\iota\in N_{SU(2)}(T)$ and cannot be the element $g\notin N_{SU(2)}(T)$ required by Corollary Q.0.7t. Indeed a dense torus together with $i\sigma_x$ closes only to $N_{SU(2)}(T)\cong\operatorname{Pin}(2)$. Dense $SU(2)$ requires an additional registered element outside the normalizer, for example
$$
g_\beta=\exp(i\beta\sigma_x),
\qquad
\beta\notin(\pi/2)\mathbb Z,
$$
or near-identity generators whose logarithms are proved to span $\mathfrak{su}(2)$ as in Theorem Q.0.7s. QFI mode availability alone does not construct those retained group elements.

*Proof.* Conjugation by $i\sigma_x$ sends $\sigma_z$ to $-\sigma_z$ and $(i\sigma_x)^2=-I$, proving membership in the nonidentity normalizer component. Conjugation by $g_\beta$ sends $\sigma_z$ to $\cos(2\beta)\sigma_z+\sin(2\beta)\sigma_y$, which lies on the torus axis exactly when $\beta\in(\pi/2)\mathbb Z$. ∎

**Theorem Q.0.7t.2 (Minimal Two-Control Dense $SU(2)$ Holonomy Witness).** Choose nonzero $\alpha,\beta$ small enough that
$$
U_x=e^{i\alpha\sigma_x},
\qquad
U_z=e^{i\beta\sigma_z}
$$
belong to the logarithm neighborhood of Theorem Q.0.7s. Then $\log U_x=i\alpha\sigma_x$ and $\log U_z=i\beta\sigma_z$ generate $\mathfrak{su}(2)$ because their bracket is a nonzero multiple of $i\sigma_y$. Hence $\langle U_x,U_z\rangle$ is dense in $SU(2)$. No one-element set can be dense in $SU(2)$, because the closure of a cyclic subgroup is abelian. Thus two is the minimum number of near-identity generators for this carrier.

Let a two-valued control register have basis $|x\rangle,|z\rangle$ and define the controlled update
$$
U_{\mathrm{ctrl}}
=|x\rangle\!\langle x|\otimes U_x
+|z\rangle\!\langle z|\otimes U_z.
\tag{Q.0.7t.2.1}
$$
This is unitary. In the anti-Hermitian convention, each block is the holonomy of the constant $\mathfrak{su}(2)$ connection $i\alpha\sigma_x\,ds$ or $i\beta\sigma_z\,ds$ around a unit parameter loop, and finite control words realize exactly the subgroup generated by $U_x,U_z$. Parallel logarithms instead generate one torus, while adjoining only a torus-normalizer element gives the proper closed normalizer described in Remark Q.0.7t.1; either failure is a finite falsifier of density.

*Proof.* The Lie-bracket calculation and Theorem Q.0.7s prove density. Every cyclic subgroup is abelian, and closure preserves commutation, whereas $SU(2)$ is nonabelian, proving minimality. Orthogonal control projections make (Q.0.7t.2.1) a block-diagonal unitary. The path-ordered exponential of a constant connection is its ordinary exponential, proving the holonomy statement. The proper-closure alternatives follow from the one-dimensional Lie algebra and Corollary Q.0.7t. ∎

**Resolution TV-Q-05-P1 (Metadata).** Exact domain: the two-level $SU(2)$ carrier and sufficiently small nonzero $(\alpha,\beta)$. Premises: the logarithm neighborhood of Theorem Q.0.7s and orthogonal control states. Equivalence: simultaneous $SU(2)$ conjugacy and control-label exchange. Budget: both generators and every finite control word. Verifier: logarithms, Lie closure, controlled-unitary normalization and holonomy products. Falsifier: parallel logarithms, a generator in the torus normalizer without a non-normalizer, or any proper closure subgroup. Provenance class: source-internal finite non-Abelian construction. Downstream consumers: Theorem Q.0.7s, Appendix-A universality and `TV-Q-05`. This is `positive-discharge` of the minimal-generator and controlled-holonomy problem for $SU(2)$; other non-Abelian groups retain their group-specific minimal-generator classification.

---

### Q.0.7.18 Summary

This section shows that repeatedly adding the registered binary phase step fills the circle densely. Physical gauge symmetry and interference still require the separately stated dynamics and calibration records.

#### Technical binary-phase results ledger

This section has established:

1. **Landauer Irrationality:** $\alpha_L = \ln 2/(2\pi) \notin \mathbb{Q}$ (Lemma Q.0.7b), proven via Gelfond–Schneider transcendence

2. **Dense U(1) Emergence:** $\overline{G_L} = U(1)$ where $G_L = \{e^{iN\ln 2}\}$ (Theorem Q.0.7d)

3. **Exact Phase Separation:** On the registered action-calibrated branch, distinct update counts have distinct baseline phases; an interference claim additionally requires realized coherent histories and their amplitudes (Corollary Q.0.7c)

4. **Exact-Closure Overhead:** On the registered calibrated branch, every nonzero exact-closure lift has $\Delta>0$; a topological interpretation additionally requires the differential-character identification (Corollary Q.0.7g)

5. **Continued-Fraction Spectrum and Arithmetic Index:** Best-approximation integer pairs $(k,N)$ are convergents of $\alpha_L$; physical loop realization remains a separate certificate (Theorem Q.0.7k, Theorem Q.0.7k.1, Corollary Q.0.7l)

6. **Three-Gap Arithmetic:** Finite arithmetic phase sets partition the circle into at most three arc lengths; accessibility requires realized phase-calibrated histories (Proposition Q.0.7n)

7. **Conditional Dephasing:** On the calibrated coherent-ensemble branch, overhead fluctuations suppress the averaged phase by $|\Phi_\Delta(1)|$ (Proposition Q.0.7p)

8. **Conditional Gauge-Holonomy Interface:** The discrete $G_L$ action extends to $U(1)$ under the continuity hypotheses; connection holonomy additionally requires the differential-character compatibility certificate (Remark Q.0.7r)

9. **Landauer-Noether Closure:** Continuous finite-resolution response functionals invariant under $G_L$ are invariant under $U(1)$, and, on the separate local-coupling closure branch, the Noether current of Appendix G follows (Theorem Q.0.7d2; Corollary Q.0.7d3)

The closure of the selected irrational character is mathematically $U(1)$. A physical gauge symmetry follows only if a separate dynamics is invariant under that character and the required continuity and local-coupling hypotheses hold.


### Q.0.8 Conditional Update-Count Phase Structure

The count $N$ is integer by definition. The phase $e^{iN\ln2}$ is the selected character of Convention Q.0.6a.0 and becomes a quantum phase only under the declared action calibration and ledger-identification branch.

---

#### Q.0.8.1 The Cycle Number

**Definition Q.0.2 (Cycle Number).** For a registered finite history $\phi$, define
$$
N[\phi]:=\#\{\text{registered update events along }\phi\}\in\mathbb Z_{\ge0}.
$$
If the branch assigns the structural ledger value $\ln2$ to every counted event, then $\mathcal L_{\mathrm{disc}}=N[\phi]\ln2$. If it also supplies $\mathcal S=\kappa_A\mathcal L$ and $\kappa_A=\hbar$, then $\mathcal S=N[\phi]\hbar\ln2$. Each implication is conditional on its own ledger.

**Proposition Q.0.3 (Discrete Integrality).** The count $N[\phi]$ is a nonnegative integer. This is immediate from the cardinality definition and supplies no quantization of an independently defined mechanical action. ∎

#### Q.0.8.2 Topological Quantization for Closed Paths

For a closed-path branch on which the total transported amplitude is required to have trivial holonomy, the following conditional quantization identity holds.

**Theorem Q.0.4 (Conditional Phase-Holonomy Quantization).** Let $\vartheta$ be a locally defined action one-form on a closed path $\gamma$, and suppose parallel transport multiplies the amplitude by
$$
\exp\!\left(\frac{i}{\hbar}\oint_\gamma\vartheta\right).
$$
Requiring the transported amplitude to return to the same value gives
$$
\frac1\hbar\oint_\gamma\vartheta=2\pi k,
\qquad k\in\mathbb Z.
$$
If a separately calibrated phase ledger identifies $\hbar^{-1}\oint_\gamma\vartheta$ with $\sum_iq_i$, then $\sum_iq_i=2\pi k$. A globally single-valued scalar action instead satisfies $\oint_\gamma d\mathcal S=0$. ∎

**Corollary Q.0.4a (Selected-Character Closed-Sector Obstruction).** On the selected character branch $N\mapsto e^{iN\ln2}$, exact trivial holonomy requires
$$
N\ln2=2\pi k,
\qquad N,k\in\mathbb Z.
$$
Since $\ln2/(2\pi)$ is irrational, the only solution is $N=k=0$. This is a statement about the selected character, not a universal obstruction on physical cycles. ∎

**Remark Q.0.4b: Non-Integer Period and Resolution.** The formal real-valued period $\Delta N_0=2\pi/\ln2\approx9.0647$ is not an admissible integer count period. On the selected-character branch,
$$
e^{iN\ln2}=1
\quad\Longleftrightarrow\quad
N\ln2=2\pi k.
$$
Irrationality of $\ln2/(2\pi)$ implies $N=k=0$, so the character has no nonzero integer period. This is an arithmetic obstruction, not a physical tension requiring a dynamical resolution.

For consecutive integer labels, the orbit $\{e^{iN\ln2}\}$ is equidistributed in $U(1)$. A physical ensemble is uniform only if realized histories sample those labels with the required weights. At finite budget, convergent denominators give record-small arithmetic mismatches. Approximate interference additionally requires separately realized coherent histories, amplitudes, and an operational phase tolerance.

---

#### Q.0.8.3 Vacuum Excitation Structure from Leech Geometry

The Leech shell ledger is available only on a branch that independently registers an even unimodular rootless rank-$24$ lattice, or supplies the full discriminant-form and coset-minimum datum of Lemma R.4.5. The predictive-recovery selection of $\mathcal G_{24}$ alone does not construct that lattice.

**Proposition Q.0.5 (Conditional Leech Shell Structure).** Assume a registered discriminant-form, marking, and coset-minimum certificate of Lemma R.4.5 constructs an even unimodular rootless rank-$24$ lattice $\Lambda$. Then $\Lambda\cong\Lambda_{24}$ by a Euclidean isometry, its nonzero minimum squared norm is $4$, and its first shell norms are $4,6,8,\ldots$. The certificate fixes the marked representative; classification alone fixes only its isometry class.

*Proof.* The registered certificate supplies evenness, unimodularity, rank $24$, and rootlessness. Niemeier's classification identifies the unique Euclidean-isometry class with those properties as the class represented by $\Lambda_{24}$. In the convention used here, its theta series is [Conway & Sloane 1999]
$$
\Theta_{\Lambda_{24}}(q)
=
1+196560q^4+16773120q^6+398034000q^8+\cdots.
$$
The first nonconstant term therefore occurs at squared norm $4$, and the displayed subsequent terms give shell norms $6$ and $8$. Golay parameters alone do not supply the registered gluing or coset-minimum certificate. ∎

**Theorem Q.0.5a (Mass--Action Correspondence on the Canonical Norm--Information and $\mathfrak B_{mass}$ Branches).** On the canonical Leech norm--information calibration branch, where $\mathcal I_{rel}(v)=|v|$, and on the canonical mass--action branch $\mathfrak B_{mass}=\mathfrak B_{\mathrm{mass}}(1)$ of Appendix N, whose independent records include the certified relational-cut decomposition, additive concurrent saturated activity, $C_*^{\mathrm{rel}}=2\varepsilon_0$, stationarity on the integration interval (or the pointwise reading), the same-cycle action/update map, and the clock/spacing calibration, a vacuum excitation labeled by $v\in\Lambda_{24}$ satisfies
$$
m^2(v)=(\mu_0^{alg})^2|v|^2,
\qquad
\mu_0^{alg}:=\frac{m_P}{2\sqrt{8\varepsilon_0}}.
$$
The coefficient $\mu_0^{alg}$ is an algebraic normalization and becomes a physical mass coefficient only on $\mathfrak B_{mass}$.

*Proof.* On $\mathfrak B_{mass}$, Theorem N.5 gives $m=\mu_0^{alg}\mathcal I_{rel}$. The independent canonical norm--information certificate gives $\mathcal I_{rel}(v)=|v|$. Combining and squaring proves the formula. Neither branch follows from Leech shell structure alone. ∎

**Remark Q.0.5a.1: Conditional Derivation Chain.** A registered Lemma R.4.5 gluing/rootlessness certificate first identifies the Leech shell geometry. The physical mass map then additionally requires $\mathfrak B_{mass}$ and the norm--information calibration. Neither step follows from SPAP or Golay parameters alone.



**Remark Q.0.5a.2: Phenomenological Status.** Leech geometry provides a discrete norm spectrum. On $\mathfrak B_{mass}$ with canonical calibration it induces the stated conditional mass spectrum. Connecting that branch to observed particles requires an independently specified identification between lattice excitations and particle states.

**Theorem Q.0.5a.3 (Finite Marked Excitation Carrier and Unfixed Mass Scale).** Let $V=\{v_1,\ldots,v_r\}$ be any finite marked set of Leech vectors and let $\mathcal H_V$ have orthonormal basis $|v_j\rangle$. The map $v_j\mapsto|v_j\rangle$ is injective, the commuting projectors
$$
P_j:=|v_j\rangle\!\langle v_j|
$$
retain all concurrent marked labels, and for every $\mu>0$
$$
M_\mu^2
:=\mu^2\sum_{j=1}^r|v_j|^2P_j
\tag{Q.0.5a.3.1}
$$
is a positive self-adjoint finite mass-squared operator satisfying $M_\mu^2|v_j\rangle=\mu^2|v_j|^2|v_j\rangle$. Its positive square root is
$$
M_\mu:=\mu\sum_{j=1}^r|v_j|P_j.
\tag{Q.0.5a.3.2}
$$
The singleton effects $(P_j)_{j=1}^r$ form a normalized projection-valued measure because $\sum_jP_j=I_{\mathcal H_V}$, and every subset-label event is represented by the corresponding sum of projectors.

The dimensionless marked-lattice data do not select $\mu$. For any $c>0$, the models $(\mathcal H_V,P_j,M_\mu)$ and $(\mathcal H_V,P_j,M_{c\mu})$ have identical lattice norms, markings, label probabilities and automorphism relations, but every nonzero mass is multiplied by $c$. Therefore a target-independent physical mass unit is non-identifiable from the marked Leech carrier alone; it requires an additional dimensionful clock/action record such as $\mathfrak B_{mass}$.

*Proof.* Orthogonality proves injectivity, commutativity, normalization and positivity. Equations (Q.0.5a.3.1)--(Q.0.5a.3.2) are diagonal in the marked basis, give the stated eigenvalues, and satisfy $(M_\mu)^2=M_\mu^2$. Scaling $\mu$ changes no dimensionless lattice or projector datum and multiplies every nonzero eigenvalue of $M_\mu$ by $c$ (and of $M_\mu^2$ by $c^2$), producing two models indistinguishable by the registered lattice data. ∎

**Resolution TV-Q-06-P1 (Metadata).** Exact domain: every finite marked Leech-vector set $V$ and its finite carrier $\mathcal H_V$. Premises: an accepted marked Leech lattice and a chosen $\mu>0$. Equivalence: marked lattice isometries and unitary basis transport. Budget: every marked vector and every subset-label effect. Verifier: injectivity, projector normalization, positivity and the norm eigenvalue equation. Falsifier: a collided marked label, an unnormalized effect family or failure of (Q.0.5a.3.1). Provenance class: source-internal finite construction. Downstream consumers: Theorem Q.0.5a and `TV-Q-06`. The carrier, concurrent labels and mass operator receive `positive-discharge` on this finite marked class.

**Resolution TV-Q-06-N1 (Metadata).** Exact domain, equivalence and budget are those of TV-Q-06-P1 with no imported dimensionful record. Premises: only the dimensionless marked-lattice and normalized label data. Verifier: compare the $\mu$ and $c\mu$ models for arbitrary $c\ne1$. Falsifier: a dimensionless marked-lattice invariant that changes under this scale replacement and uniquely fixes a mass unit. Provenance class: source-internal scale-modulus countermodel. Downstream consumers: $\mathfrak B_{mass}$ and `TV-Q-06`. The paired models give `nonentailment` of a target-independent physical unit from the lattice data; the affirmative calibrated physical realization remains open.

**Corollary Q.0.5b (Numerical Cross-Check of Separate Record and Leech Branches).** On the structural record/capacity/no-surplus branch, $a=2$ and hence $a^2=4$. On a separately registered Leech gluing/rootlessness branch, $|v|_{min}^2=4$. Therefore
$$
a^2=|v|_{min}^2=4
$$
on the intersection of those branches.

*Proof.* Each equality follows from its own branch theorem. Their common numerical value supplies no implication from the record dimension to the lattice, no gluing construction, and no energy identification. ∎

**Corollary Q.0.5c (Conditional Discrete Mass Spectrum).** On the full branch of Theorem Q.0.5a,
$$
m^2
\in
\{0,4,6,8,10,12,\ldots\}
(\mu_0^{alg})^2.
$$
The first nonzero mass is $2\mu_0^{alg}$.

*Proof.* The registered Leech branch gives
$$
|v|^2\in\{0,4,6,8,10,12,\ldots\}.
$$
Theorem Q.0.5a gives $m^2(v)=(\mu_0^{alg})^2|v|^2$. Substitution proves the set, and the minimum nonzero norm $4$ gives $m_{\min}=2\mu_0^{alg}$. This is a physical gap only on $\mathfrak B_{mass}$ with the canonical norm-information calibration. ∎



---

#### Q.0.8.4 The Conditional Count-Character Correspondence

**Corollary Q.0.6 (Conditional Count-Character Representation).** On the branch $\mathcal S=N\hbar\ln2$,
$$
e^{i\mathcal S/\hbar}=e^{iN\ln2}=2^{iN}.
$$
This is a substitution identity under the stated calibration, not a derivation of quantum mechanics from thermodynamics. ∎

**Corollary Q.0.6a (Selected-Character Phase Matching).** Two selected-character values agree exactly when
$$
(N_1-N_2)\ln2=2\pi k,
\qquad k\in\mathbb Z.
$$
Irrationality implies $N_1=N_2$. Approximate matches are governed by the continued-fraction statements above. A physical interference claim additionally requires the phase-identification branch. ∎

#### Q.0.8.5 Observable Consequences

**Theorem Q.0.7 (Integer Counts and Separate Discrete Labels).**

1. If $N$ is the number of elementary cycles in a finite discrete MPU process, then $N\in\mathbb Z_{\ge0}$ by definition.
2. Winding and instanton numbers are integer topological labels. Equality or proportionality between such a label and $N$ requires a separately stated holonomy/count calibration.
3. On a registered Leech branch, squared norms are discrete even integers beginning $4,6,8,\ldots$. They are not restricted to $4\mathbb Z$, and no Leech shell index is identified with $N$ without an additional bridge.

*Proof.* Item 1 is the definition of a finite count. Item 2 follows from the integrality of the relevant homotopy or characteristic class, while the logical independence of two integer-valued quantities precludes identifying them without a map. Item 3 follows from Proposition Q.0.5's theta series, whose nonzero exponents include $6$. ∎

**Proposition Q.0.8 (Conditional Structural Consequences).**

1. Leech-lattice shell norms are discrete on the registered Leech branch.
2. The character $e^{iN\ln2}$ assigns a phase increment $\ln2$ per count by definition; a physical phase interpretation requires Convention Q.0.6a.0.
3. One stipulated binary structural step contributes $\kappa_A\ln2$ to the calibrated action ledger. This is not a universal minimum action, and $\kappa_A=\hbar$ is an independent calibration.
4. Mass statements require the complete branch of Theorem Q.0.5a.

No process is excluded merely because a mechanical action is smaller than $\hbar\ln2$. ∎

**Remark Q.0.8a: Experimental Accessibility.**

(i) Precision tests of quantum coherence at mesoscopic scales where $N$ is moderately small

(ii) Cosmological signatures where Planck-scale physics imprints on large-scale structure

(iii) Derived consequences at accessible scales—particle mass ratios, coupling constants, and symmetry structures (Sections 13, G.8.4, Appendix T)

**Remark Q.0.8b (Action-Scale Status).** The candidate value $\kappa_A\ln2$ exists only on a calibrated one-step structural-action branch. Choosing $\kappa_A=\hbar$ gives $\hbar\ln2$ by definition; it is not a universal minimum action.

**Theorem Q.0.8c (Conditional Exact-Discrimination Relative-Energy Bound).** Let a registered two-hypothesis protocol $\mathcal P$ admit an interaction picture in which the output under the mass hypothesis is
$$
|\psi_m(T_{\mathcal P})\rangle
=
e^{-iH_{\mathrm{rel}}(m)T_{\mathcal P}/\hbar}|\psi\rangle,
$$
while the zero-mass output is $|\psi\rangle$. Assume $H_{\mathrm{rel}}(m)$ is time independent and bounded below on the retained probe support, and that its ground-subtracted mean is
$$
E_{\mathrm{rel}}(m)
:=
\langle\psi|H_{\mathrm{rel}}(m)|\psi\rangle
-
\inf\operatorname{spec}H_{\mathrm{rel}}(m)
=
\kappa_{\mathcal P}mc^2,
\qquad
\kappa_{\mathcal P}>0.
\tag{Q.0.8c.1}
$$
If $\mathcal P$ achieves exact one-shot discrimination by making the two output rays orthogonal within duration $T_{\mathcal P}$, then
$$
m
\ge
\frac{\pi\hbar}{2\kappa_{\mathcal P}c^2T_{\mathcal P}}.
\tag{Q.0.8c.2}
$$

*Proof.* The two outputs are orthogonal exactly when the registered relative evolution orthogonalizes $|\psi\rangle$. The Margolus--Levitin inequality applied to $H_{\mathrm{rel}}(m)$ gives $T_{\mathcal P}\ge\pi\hbar/(2E_{\mathrm{rel}}(m))$. Substitution of (Q.0.8c.1) yields (Q.0.8c.2). ∎

**Remark Q.0.8d (Conditional Protocol Mass Scale).** Equation Q.18 determines the spatial length $\delta=\sqrt{8\ln2}\,L_P$ on its residual-budget, throughput-saturated, ideal-packing branch; it does not determine a protocol duration. If the serialized-frontier calibration of Proposition Q.6.1 is also imposed so that $T_{\mathcal P}=\delta/c$, Theorem Q.0.8c gives
$$
m\ge \frac{\pi}{2\kappa_{\mathcal P}\sqrt{8\ln2}}\,m_P.
$$
The numerical value $m\ge0.667\,m_P$ follows on the additional response calibration $\kappa_{\mathcal P}=1$. A universal mass gap would further require a theorem that this calibrated discrimination protocol is physically realized and that every massive excitation is subject to its one-shot orthogonalization bound.

---

**Proposition Q.0.9 (Zero-Additional-Phase Bohr--Sommerfeld Branch).** Assume a closed canonical orbit $\gamma$ has action $\oint_\gamma p\,dq$, and assume the transport law has no additional Maslov, Berry, boundary, or spin phase. Imposing trivial total transport holonomy then gives
$$
\oint_\gamma p\,dq=2\pi k\hbar=kh,
\qquad k\in\mathbb Z.
$$
If a dimensionless additional phase $\Phi_{\mathrm{add}}$ is present with the displayed sign convention, the applicable condition is
$$
\frac1\hbar\oint_\gamma p\,dq+\Phi_{\mathrm{add}}=2\pi k.
$$
Integer event counting does not supply either canonical-action identification. ∎
**Remark Q.0.9a (Quantization Scope).** Proposition Q.0.9 is the ordinary trivial-holonomy condition under explicit canonical-action and phase hypotheses. It is not derived from irreversible-bit counting.

---

#### Q.0.8.7 Summary

This section keeps event counting, action calibration, geometric shell values, mass interpretation, and orbital quantization as separate results. They combine only on the stated calibration branches.

##### Technical event-and-action results ledger

This section has established:

1. **Discrete Integrality:** $N \in \mathbb{Z}$ at the fundamental (MPU network) level (Proposition Q.0.3)

2. **Conditional Count-Character Identity:** On the separately calibrated branch $\mathcal S=N\hbar\ln2$, $e^{i\mathcal S/\hbar}=2^{iN}$ (Corollary Q.0.6)

3. **Topological Constraints:** The action one-form obeys Theorem Q.0.4 only under its trivial-total-holonomy hypothesis

4. **Vacuum Shell and Conditional Mass Structure:** Leech geometry fixes $|v|^2\in\{4,6,8,\ldots\}$; $m^2=(\mu_0^{alg})^2|v|^2$ additionally requires Theorem Q.0.5a's $\mathfrak B_{mass}$ and canonical-calibration branch



5. **Conditional Bohr--Sommerfeld Identity:** Under the canonical-action, trivial-total-holonomy, and zero-additional-phase hypotheses, $\oint p\,dq=kh$ (Proposition Q.0.9)

6. **Conditional Consequences:** Discrete shell norms and calibrated ledger phases/actions have the scope stated in Proposition Q.0.8

Any correspondence between update-count characters and physical interference is conditional on the independent calibration and phase-identification ledger.

---

### Q.0.9 The Conditional Rindler--Landauer Timescale

#### Q.0.9.1 Independent Ingredients

The Unruh temperature is
$$
T_U(a)=\frac{\hbar a}{2\pi k_Bc}.
$$
A conditionally uniform binary reset has quasistatic Landauer infimum $Q_{\mathrm{bath}}\ge k_BT_U\ln2$. Neither statement fixes a cycle duration. Introduce, as a separate calibration hypothesis, a protocol action-duration ledger
$$
E\tau=\kappa_A\ln2.
$$

#### Q.0.9.2 The Conditional Timescale

**Theorem Q.0.10 (Conditional Rindler--Landauer Timescale).** Assume a conditionally uniform binary reset into an Unruh bath, exact Landauer heat saturation, cyclic energy balance $E=Q_{\mathrm{bath}}$, and the independent action-duration equality $E\tau=\kappa_A\ln2$. Then
$$
\tau_U(a)=\frac{\kappa_A}{\hbar}\frac{2\pi c}{a}.
$$
On the separately calibrated branch $\kappa_A=\hbar$, this becomes $\tau_U=2\pi c/a$. The equality is conditional and is not a thermodynamic speed limit; exact quasistatic saturation is ordinarily an asymptotic ideal. ∎

**Remark Q.0.10a (No Energy--Time Monotonicity without a Protocol Law).** Increasing dissipated energy does not by itself imply a shorter duration. The relation $\tau=\kappa_A\ln2/E$ holds only while the independent action-duration equality remains valid for the changed protocol.

#### Q.0.9.3 Physical Interpretation

**Corollary Q.0.10b (Conditional Geometric Comparison).** On the full hypotheses of Theorem Q.0.10 with $\kappa_A=\hbar$, the numerical timescale $2\pi c/a$ equals $2\pi$ times the light-crossing time to the Rindler horizon. The KMS period $2\pi c/a$ is an imaginary-time periodicity; it does not by itself establish a real reset-cycle duration. ∎

**Corollary Q.0.10c (Conditional Rate).** If a real protocol independently realizes the duration in Theorem Q.0.10, its event rate is $a/(2\pi c)$. No rate follows from the Unruh temperature alone. ∎

**Remark Q.0.10d (No Universal Speed or Efficiency Law).** Extra energy need not shorten a protocol. Any energy--duration relation requires a separate speed-limit or control theorem.

**Definition Q.0.10d.1 (Margolus-Levitin Saturation Certificate).** A Margolus-Levitin saturation certificate for a finite-response branch is a finite record
$$
\mathfrak Q_{\mathrm{ML}}
=
(H,\rho,\mathcal C_\perp,E,\dot C_\perp,\mathcal O_\perp,\chi_{\mathrm{ML}})
\tag{Q.0.10d.1}
$$
where:

1. $H$ is the branch Hamiltonian with the ground energy subtracted and with the retained spectral domain fixed.
2. $\rho$ is the finite-response state or state family on which the rate is evaluated.
3. $E=\operatorname{Tr}(\rho H)$ is fixed before comparison.
4. $\mathcal C_\perp$ is a counted orthogonalization-event coordinate in the retained protocol units; it is not the static predictive complexity $C_P$.
5. $\dot C_\perp$ is the corresponding event rate.
6. $\mathcal O_\perp$ proves that the counted events are realized by orthogonalizing two-level geodesic components using the energy recorded in $E$, with no response-relevant idle sector included in the numerator.
7. $\chi_{\mathrm{ML}}=1$ records that the state, Hamiltonian, event coordinate, energy normalization, and comparison window were fixed before any rate comparison.

**Theorem Q.0.10d.2 (Conditional Margolus-Levitin Rate Equality).** On every finite-response branch satisfying the hypotheses of the Margolus-Levitin bound, the counted orthogonalization rate obeys
$$
\dot C_\perp\le \frac{2E}{\pi\hbar}.
\tag{Q.0.10d.2}
$$
Equality may be asserted only on a branch carrying an accepted certificate $\mathfrak Q_{\mathrm{ML}}$ whose entry $\mathcal O_\perp$ proves saturation for the counted events. PCE no-surplus selection alone does not imply equality in (Q.0.10d.2), does not imply autonomous positive complexity drift from $E>0$, and does not identify the Action-Entropy Identity with any Complexity=Action dictionary without an additional finite-response reconstruction map.

*Proof.* The Margolus-Levitin quantum speed limit gives the minimum time $\tau\ge\pi\hbar/(2E)$ for an orthogonalizing event at mean energy $E$ above the ground state, hence the counted event rate is at most $2E/(\pi\hbar)$. Equality requires the known equality conditions of the speed-limit problem to hold for the retained branch; these are exactly what $\mathcal O_\perp$ and $\chi_{\mathrm{ML}}$ record. PCE quotienting removes response-null surplus labels, but it is not a proof that all available energy is arranged in saturating orthogonalizing geodesics. ∎

**Theorem Q.0.10d.3 (No Common-Cycle Rindler-Action and Margolus--Levitin Saturation).** Let the same finite cycle use the same mean energy $E>0$ and duration $\tau>0$ in both the action-duration ledger
$$
E\tau=\kappa_A\ln2
\tag{Q.0.10d.3.1}
$$
and an orthogonalizing event subject to the Margolus--Levitin bound. Then necessarily
$$
\kappa_A\ln2\ge\frac{\pi\hbar}{2}.
\tag{Q.0.10d.3.2}
$$
Consequently the calibrated branch $\kappa_A=\hbar$ of Theorem Q.0.10 cannot carry a Margolus--Levitin-saturating event on that same energy and duration, because $\ln2<1<\pi/2$. Simultaneous equality would instead require
$$
\kappa_A=\frac{\pi\hbar}{2\ln2}.
\tag{Q.0.10d.3.3}
$$

Both component classes are nonempty. The two-level Hamiltonian $H=2E|1\rangle\langle1|$ and state $(|0\rangle+|1\rangle)/\sqrt2$ have mean energy $E$ and reach the orthogonal state at $\pi\hbar/(2E)$, saturating Margolus--Levitin. Separately, positive numbers $(E,\tau)$ satisfying (Q.0.10d.3.1) exist for every $E,\kappa_A>0$; they do not orthogonalize on the calibrated $\kappa_A=\hbar$ branch.

*Proof.* Margolus--Levitin gives $E\tau\ge\pi\hbar/2$. Substitution of (Q.0.10d.3.1) proves (Q.0.10d.3.2), and equality gives (Q.0.10d.3.3). The strict calibrated contradiction follows from $\ln2<1$ and $\pi>2$. For the displayed qubit,
$$
e^{-iH\tau/\hbar}\frac{|0\rangle+|1\rangle}{\sqrt2}
=\frac{|0\rangle-|1\rangle}{\sqrt2}
$$
at $\tau=\pi\hbar/(2E)$, proving nonvacuity. ∎

**Resolution TV-Q-07-R1 (Metadata).** Exact domain: finite cycles that assign one common $(E,\tau)$ to Theorem Q.0.10's calibrated action-duration equality and to a Margolus--Levitin orthogonalization event. Premises: $E,\tau>0$, $\kappa_A=\hbar$, and common energy/time ownership. Equivalence: equality of the ground-subtracted Hamiltonian, retained state, energy and cycle duration. Budget: every positive $E,\tau$ and every finite ML-saturating state. Verifier: (Q.0.10d.3.1), the ML inequality and common-owner identity. Falsifier: one common calibrated cycle satisfying both equalities. Provenance class: source-internal universal inequality with an explicit nonempty ML equality class. Downstream consumers: Theorem Q.0.10, $\mathfrak Q_{\mathrm{ML}}$ and `TV-Q-07`. Theorem Q.0.10d.3 gives `negative-refutation` of the exact registered joint-saturation proposition. Separate Rindler--Landauer scale comparisons and separate ML-saturating qubit protocols remain valid in their own ledgers; finite detector/reset optimization and realized-cycle construction remain outside this no-go's partial scope.

---

#### Q.0.9.4 Conditional Algebraic Cancellation

**Proposition Q.0.10e (Conditional Cancellation).** Under the full hypotheses of Theorem Q.0.10,
$$
\frac{\kappa_A\ln2}{k_BT_U\ln2}
=\frac{\kappa_A}{\hbar}\frac{2\pi c}{a}.
$$
The cancellation is algebraic. It does not show that Unruh thermality, Landauer reset heat, and a mechanical action have a common microscopic origin. ∎

#### Q.0.9.5 Limiting Cases

| Acceleration | Conditional $\tau_U$ | Conditional rate (if realized) | Comparison regime |
|:-------------|:--------------------|:---------------------|:----------------|
| $a \to 0$ | $\tau_U \to \infty$ | $\dot{N}_U \to 0$ | Inertial limit: Unruh bath vanishes |
| $a = c^2/L_P$ | $\tau_U = 2\pi t_P$ | $\dot{N}_U = 1/(2\pi t_P)$ | Planck acceleration |
| $a = g \approx 9.8$ m/s² | $\tau_U \approx 1.92 \times 10^{8}$ s | $\dot{N}_U \approx 5.2 \times 10^{-9}$ Hz | Earth surface gravity |

**Remark Q.0.10f (Inertial Limit).** At $a=0$ the Unruh bath is absent, so Theorem Q.0.10 does not apply. A separate thermal bath fixes a Landauer heat scale but no cycle duration without an independent action-duration or control law.

**Remark Q.0.10g: Earth Gravity.** At Earth's surface gravity ($g \approx 9.8$ m/s²), the Unruh temperature is:

$$T_U = \frac{\hbar g}{2\pi k_B c} \approx 4.0 \times 10^{-20} \text{ K}$$

On the full branch of Theorem Q.0.10 the same acceleration gives $\tau_U=2\pi c/g\approx1.92\times10^{8}$ s, the value tabulated in Section Q.0.9.5. The Unruh temperature alone fixes neither a real cycle duration nor a computation rate.

---

#### Q.0.9.6 Connection to Horizon Information Bounds

**Proposition Q.0.10h (Consistency with the Bekenstein Inequality).** Assume the Bekenstein bound in nat units,
$$
I\le\frac{2\pi ER}{\hbar c},
$$
and insert the comparison scales
$$
E=k_BT_U\ln2,
\qquad
R=\frac{c^2}{a}.
$$
Then
$$
I
\le
\frac{2\pi(k_BT_U\ln2)(c^2/a)}{\hbar c}
=
\ln2.
$$

*Proof.* Substitute $T_U=\hbar a/(2\pi k_Bc)$; every dimensional factor cancels and leaves the stated upper bound. Equality requires independent saturation of the Bekenstein inequality and is not implied by the scale substitution. ∎

---

#### Q.0.9.7 Summary

Under four independent calibration conditions, the model assigns one acceleration-based duration to a uniform one-bit reset cycle. The result is a consistency relation between the registered scales.

##### Technical status ledger

Under the full independent hypotheses of Theorem Q.0.10—uniform binary reset, exact Landauer saturation, cyclic energy balance, and the action-duration calibration with $\kappa_A=\hbar$—the conditional timescale is $\tau_U=2\pi c/a$.

The cancellation of $\hbar$, $k_B$, and $\ln2$ is algebraic. It does not show that the Unruh response is generated by MPU reset dynamics, that a real protocol attains this duration, or that horizon thermodynamics and SPAP have a common microscopic origin. Proposition Q.0.10h is a consistency comparison on the same conditional branch.

---

### Q.0.9.8 Conditional Comparison with Emergent Gravity

The branch-conditional Rindler–Landauer timescale $\tau_U=2\pi c/a$ shares formal ingredients with the emergent-gravity ledger. This section compares those ingredients without asserting a common microscopic origin or logical derivation between the two constructions.

---

#### Q.0.9.8.1 The Shared Structure

**Proposition Q.0.11 (Shared-Ingredient Comparison for Horizon Physics).** *On their separately declared branch packages, the Jacobson and conditional Rindler–Landauer constructions use formally corresponding thermal and information-theoretic ingredients. This comparison does not identify their microscopic mechanisms or make either construction a derivation of the other:*

| Jacobson construction | Conditional Rindler–Landauer construction | Shared formal ingredient |
|:--------------------|:----------------------------|:--------------|
| Unruh temperature $T = \hbar\kappa/(2\pi k_B c)$ for acceleration $\kappa$ | Unruh temperature $T_U = \hbar a/(2\pi k_B c)$ | Horizon thermal character |
| Area-law entropy $\delta S = \eta \, \delta\mathcal{A}$ | Registered reset: $\langle Q_{\mathrm{bath}}\rangle/(k_BT)\ge H_q(P\mid R)$; $\ln2$ equality only under the uniform-binary, no-copy, and zero-overhead hypotheses | Conditional reset ledger |
| Heat flux $\delta Q = T \, \delta S$ | Calibrated event step: $\mathcal S=\kappa_A\ln2$ only under the independently assumed action calibration | Conditional action ledger |

*The formula for $\tau_U$ follows only after the saturation, cyclic-balance, action-duration, and $\kappa_A$ calibration hypotheses of Theorem Q.0.10 are imposed; it is not a cancellation derived from SPAP.*

*Proof.* The Jacobson derivation (Theorem 12.1) combines:
1. Unruh temperature: $T = \hbar\kappa/(2\pi k_B c)$ (Definition 40)
2. Area-law entropy: $\delta S = (1/4G) \delta\mathcal{A}$ (Theorem 49)
3. Clausius relation: $\delta Q = T \, \delta S$

The Rindler-Landauer derivation (Theorem Q.0.10) combines:
1. Unruh temperature: $T_U = \hbar a/(2\pi k_B c)$
2. Landauer bound: $Q_{\min} = k_B T \ln 2$
3. SPAP action: $\kappa_A\ln2$ for one stipulated structural step on a calibrated branch

Both constructions import the Unruh response and use separately declared entropy/energy ledgers. The Jacobson result additionally requires its local Clausius, area-density, and metric-action hypotheses; the Rindler–Landauer equality additionally requires the saturation and action-duration hypotheses of Theorem Q.0.10. Shared formal ingredients do not establish a common microscopic origin or logical dependence. $\square$

---

#### Q.0.9.8.2 Conditional Schwarzschild-Horizon Protocol Rate

**Theorem Q.0.12 (Conditional Schwarzschild-Horizon Protocol Rate).** *Assume the complete hypotheses of Theorem Q.0.10: a conditionally uniform binary reset into the Unruh bath, exact Landauer heat saturation, cyclic energy balance, the independent action-duration equality, and the calibration $\kappa_A=\hbar$. Assume also that a real protocol realizes this duration and that an accepted horizon thermal/redshift bridge identifies the acceleration scale entering the conditional temperature formula with the asymptotically normalized Schwarzschild surface gravity $\kappa=c^4/(4GM)$. Then:*

$$\boxed{\tau_{BH} = \frac{8\pi GM}{c^3}, \qquad \dot{N}_{BH} = \frac{c^3}{8\pi GM}}$$

*Proof.* Theorem Q.0.10 gives $\tau=2\pi c/a$ under the stated protocol hypotheses. Substitution of the registered scale $a=\kappa=c^4/(4GM)$ yields

$$\tau_{BH} = \frac{2\pi c}{\kappa} = \frac{2\pi c \cdot 4GM}{c^4} = \frac{8\pi GM}{c^3}.$$

The realized protocol rate is its inverse, $\dot{N}_{BH}=c^3/(8\pi GM)$. $\square$

**Corollary Q.0.12a (Conditional Protocol Mass--Rate Scaling).** On the complete realized-protocol and thermal/redshift branch of Theorem Q.0.12,
$$
\dot N_{BH}\propto M^{-1}.
$$
This is the scaling of the stipulated surface-gravity protocol branch; Hawking-temperature scaling alone supplies no computation rate. ∎

**Corollary Q.0.12b (Conditional Numerical Protocol Values).** On the complete branch of Theorem Q.0.12:

| Black Hole Mass | Conditional $\tau_{BH}$ | Conditional $\dot{N}_{BH}$ if realized |
|:----------------|:------------|:---------------|
| $M_\odot$ (solar) | $1.24 \times 10^{-4}$ s | $8.1 \times 10^{3}$ Hz |
| $10^6 M_\odot$ (galactic center) | $1.24 \times 10^{2}$ s | $8.1 \times 10^{-3}$ Hz |
| $10^9 M_\odot$ (supermassive) | $1.24 \times 10^{5}$ s | $8.1 \times 10^{-6}$ Hz |
| $m_P$ (Planck mass) | $8\pi t_P$ | $(8\pi t_P)^{-1}$ |

---

#### Q.0.9.8.3 Fixed-Mass Conditional Rate--Lifetime Scaling

**Theorem Q.0.13 (Fixed-Mass Conditional Rate--Lifetime Scaling).** On the complete realized-protocol branch of Theorem Q.0.12, fix an initial mass $M_0$ and assume a registered evaporation model
$$
t_{\mathrm{evap}}(M_0)
=
C_{\mathrm{evap}}\frac{G^2M_0^3}{\hbar c^4},
\qquad
C_{\mathrm{evap}}>0,
$$
where $C_{\mathrm{evap}}$ records the particle-content and greybody conventions. Define the fixed-initial-mass surrogate
$$
N_{\mathrm{sur}}
:=
\dot N_{BH}(M_0)t_{\mathrm{evap}}(M_0).
$$
Then
$$
N_{\mathrm{sur}}
=
\frac{C_{\mathrm{evap}}}{32\pi^2}S_{BH}(M_0).
\tag{Q.0.13.1}
$$
For the explicitly adopted ideal blackbody coefficient $C_{\mathrm{evap}}=5120\pi$, this becomes
$$
N_{\mathrm{sur}}=\frac{160}{\pi}S_{BH}(M_0).
$$
The ideal coefficient is not a universal Page greybody/species coefficient, and $N_{\mathrm{sur}}$ is not an integrated evaporation count or a proof of physical bit erasure.

*Proof.* The conditional rate in Theorem Q.0.12 is
$$
\dot N_{BH}(M_0)=\frac{c^3}{8\pi GM_0},
$$
while
$$
S_{BH}(M_0)=\frac{4\pi GM_0^2}{\hbar c}.
$$
Therefore
$$
N_{\mathrm{sur}}
=
\frac{c^3}{8\pi GM_0}
C_{\mathrm{evap}}\frac{G^2M_0^3}{\hbar c^4}
=
\frac{C_{\mathrm{evap}}GM_0^2}{8\pi\hbar c}
=
\frac{C_{\mathrm{evap}}}{32\pi^2}S_{BH}(M_0).
$$
Substitution of $C_{\mathrm{evap}}=5120\pi$ gives $160/\pi$. An actual operation count would require a microscopic protocol and integration of its realized rate along $M(t)$. ∎

**Remark Q.0.13a (Scope of the Rate--Lifetime Surrogate).** The proportionality is conditional algebraic consistency. Establishing an actual horizon operation count requires a microscopic protocol, a particle-content/greybody evaporation law, and integration of its rate along $M(t)$; none follows from the area law or a lifetime formula.


---

#### Q.0.9.8.4 Algebraic Re-expression of the Gravitational Constant

**Theorem Q.0.14 (Algebraic Re-expression of $G$ on the Joint Horizon Branch).** On the joint hypotheses of Theorem Q.0.12 and the dimensionless Bekenstein--Hawking area law, solving the already calibrated identities for $G$ gives
$$
G=\frac{c^3\tau_{BH}}{8\pi M}
=
\frac{c^3}{4\hbar}\left(\frac{S_{BH}}{A}\right)^{-1}.
$$
These are algebraic re-expressions, not an independent derivation or measurement of $G$.

*Proof.* Theorem Q.0.12 assumes the Schwarzschild surface-gravity relation and yields $\tau_{BH}=8\pi GM/c^3$; solving gives the first expression. The area law already contains $G$ through $S_{BH}/A=c^3/(4G\hbar)$; solving gives the second. ∎

**Corollary Q.0.14a (Consistency with Equation E.9).** Substituting Appendix E's independently calibrated entropy-density identity
$$
\frac{S_{BH}}A=\frac{\chi C_{\max}}{\eta\delta^2}
$$
into the second re-expression gives
$$
G=\frac{\eta\delta^2c^3}{4\hbar\chi C_{\max}},
$$
which is Equation (E.9). This is a consistency substitution, not an independent derivation. ∎


---

#### Q.0.9.8.5 Joint Gravity--Computation Consistency Ledger

**Theorem Q.0.15 (Joint Gravity--Computation Consistency Ledger).** Assume simultaneously: (a) the local Rindler/KMS and Clausius hypotheses of Theorem 12.1; (b) the horizon-saturation, density-certificate, and area-law calibration hypotheses of Theorems E.5--E.6; (c) the MPU stress-energy source construction of Appendix B; and (d) the complete protocol hypotheses of Theorem Q.0.10 with $\kappa_A=\hbar$, a real protocol realizing the conditional duration, and the local identification $a=\kappa$. Then the following statements hold on that joint branch:

1. the Jacobson construction gives the Einstein equations (Theorem 12.1);
2. the calibrated horizon entropy obeys the Bekenstein--Hawking area law (Theorems E.5--E.6);
3. the calibration gives $G=\eta\delta^2c^3/(4\hbar\chi C_{\max})$ (Equation (E.9)); and
4. the independently realized conditional protocol has rate $\dot N=\kappa/(2\pi c)$ (Theorem Q.0.10 and Corollary Q.0.10c).

These are compatible projections of the stated joint hypothesis package. No implication among items 1--4 is asserted after removing the hypotheses used to establish the target item.

*Proof.* Items 1 and 2 follow from the local-Rindler, Clausius, horizon-saturation, density-certificate, and stress-energy hypotheses by Theorem 12.1 and Theorems E.5--E.6. Substitution of the calibrated entropy density into Equation (E.6c) gives item 3 algebraically. Under the independent reset, saturation, energy-balance, action-duration, real-protocol, and $a=\kappa$ hypotheses, Theorem Q.0.10 and Corollary Q.0.10c give item 4. Each conclusion therefore follows from the union of the hypotheses declared in the theorem, without using any conclusion to prove one of its own antecedents. $\square$

**Corollary Q.0.15a (No Closed Implication Loop).** On the hypotheses of Theorem Q.0.15, the gravity, area-law, coupling-calibration, and computational-rate ledgers are mutually consistent. The computational-rate identity alone implies neither the horizon entropy density nor the Einstein equations. $\square$

---

#### Q.0.9.8.6 Conditional Conversion-Factor Cancellation

**Proposition Q.0.16 (Conditional Conversion-Factor Cancellation).** Assume the complete reset, saturation, energy-balance, action-duration, real-protocol, and calibration hypotheses of Theorem Q.0.10, including $\kappa_A=\hbar$ and $a>0$. Then the realized duration obeys
$$
\tau_U
=\frac{\hbar\ln2}{k_BT_U\ln2}
=\frac{\hbar\ln2}{k_B(\hbar a/(2\pi k_Bc))\ln2}
=\frac{2\pi c}{a}.
$$
The cancellation is an algebraic consistency identity on this protocol branch. It does not imply that gravitational, thermodynamic, and information-theoretic theories are equivalent or that any output of Theorem Q.0.15 implies another.

*Proof.* Substitute $T_U=\hbar a/(2\pi k_Bc)$ into the conditional action-duration equality and cancel the nonzero factors $\hbar$, $k_B$, and $\ln2$. This gives the displayed duration. No field equation, entropy-density law, or converse implication occurs in the calculation. $\square$

**Theorem Q.0.17 (Conditional Four-Dimensional Metric Uniqueness on the Joint Horizon Branch).** Assume the complete joint package of Theorem Q.0.15 and the four-dimensional Lovelock hypothesis class. Then the Einstein equations already supplied by Theorem 12.1 are unique within that class. The conditional protocol-rate identity is compatible with the package but supplies no metric-equation selection.

*Proof.*

**Step 1 (Conditional information-bound comparison).** Proposition Q.0.10h gives only
$$
I\le\ln2
$$
after inserting the declared comparison scales. Equality requires separate saturation of the Bekenstein inequality, and no rate or universal horizon protocol follows.

**Step 2 (Independent entropy-density bridge).** The universal Bekenstein--Hawking entropy density is part of the horizon-saturation and area-law calibration package; it is not derived from the conditional protocol rate.

**Step 3 (Jacobson construction).** The independently supplied entropy density, local Clausius relation, Unruh/KMS input, stress-energy flux identification, and remaining hypotheses of Theorem 12.1 give the Einstein equations on the joint branch.

**Step 4 (Lovelock uniqueness).** Within the stated four-dimensional Lovelock class, the divergence-free second-order local metric tensor is the Einstein tensor plus a cosmological term. Thus Theorem 12.1's equation is unique in that class; the conditional protocol rate is not used in this uniqueness step. ∎

---

#### Q.0.9.8.7 Summary

The horizon and computation constructions use matching thermal, information, and rate ingredients on a joint branch. Their agreement is a compatibility result; none alone generates the others.

##### Technical compatibility ledger

| Result | Statement | Significance |
|:-------|:----------|:-------------|
| Proposition Q.0.11 | Jacobson and conditional Rindler–Landauer constructions share formal ingredients on separate branch packages | Comparison only; no common microscopic origin derived |
| Theorem Q.0.12 | $\tau_{BH} = 8\pi GM/c^3$ on its black-hole protocol branch | Conditional black-hole computational timescale |
| Theorem Q.0.13 | $N_{\mathrm{sur}} \sim S_{BH}$ on its evaporation-model branch | Conditional rate--lifetime surrogate proportionality |
| Theorem Q.0.14 | $G$ is algebraically expressible through the calibrated horizon rate on its stated branch | Conditional gravity-computation relation |
| Theorem Q.0.15 | EFE, the area law, the $G$ calibration, and the computational rate coexist on the joint gravity-computation package | Compatibility ledger; no reverse implication |
| Proposition Q.0.16 | The declared conversion factors cancel to a geometric identity on the common calibration branch | Conditional consistency identity |
| Theorem Q.0.17 | The Einstein equation supplied by Theorem 12.1 is unique within the declared four-dimensional Lovelock class on the full joint branch | The conditional protocol rate is compatible but supplies no selection |

On the joint branch of Theorem Q.0.15, the Rindler-Landauer rate is compatible with the local-horizon thermodynamic derivation and the area-density calibration. The cancellation of $\hbar$, $k_B$, and $\ln 2$ is an identity under the declared conversion and protocol hypotheses. The gravitational constant, horizon entropy, and computational rate retain their respective bridge and calibration premises; none of the three quantities alone determines the other two or the Einstein equations.

---

#### Q.0.9.8.8 Effective Horizon MPU Count

**Theorem Q.0.18 (Effective Horizon MPU Count on the Combined Spacing Branch).** *Assume a Schwarzschild black hole of mass $M$ and the residual-budget, throughput-saturated, ideal-packing branch on which Equation Q.18 gives $\delta^2=8\ln2\,L_P^2$. Then the horizon area measured in units of $\delta^2$ is*
$$
N_{\mathrm{MPU}}^{\mathrm{eff}}(M)
:=
\frac{\mathcal{A}_H}{\delta^2}
=
\frac{2\pi}{\ln 2}\left(\frac{M}{m_P}\right)^2.
$$
The superscript “eff” is essential: this area ratio need not be an integer and, without a separate horizon-cell realization or tiling certificate, is not a count of microscopic horizon units.

*Proof.* The Schwarzschild horizon area is
$$
\mathcal{A}_H = \frac{16\pi G^2 M^2}{c^4} = 16\pi \left(\frac{M}{m_P}\right)^2 L_P^2,
$$
using $m_P = \sqrt{\hbar c/G}$ and $L_P^2 = G\hbar/c^3$. Equation (E.16) gives $\delta^2 = 8\ln 2\,L_P^2$. Therefore
$$
N_{\mathrm{MPU}}^{\mathrm{eff}}(M)
=
\frac{\mathcal{A}_H}{\delta^2}
=
\frac{16\pi (M/m_P)^2 L_P^2}{8\ln 2\,L_P^2}
=
\frac{2\pi}{\ln 2}\left(\frac{M}{m_P}\right)^2.
$$
$\square$

**Corollary Q.0.18a (Conditional Horizon Entropy Decomposition).** *Assume the hypotheses of Theorem Q.0.18, the residual-capacity branch $C_{\max}^{*}=2\ln2$, and the dimensionless Bekenstein-Hawking normalization $S_{\mathrm{BH}}=\mathcal A_H/(4L_P^2)$. Then*
$$
N_{\mathrm{MPU}}^{\mathrm{eff}}(M)\,C_{\max}^{*}
=
\frac{\mathcal{A}_H}{4L_P^2}
=
S_{\mathrm{BH}}(M).
$$

*Proof.* Equation (E.15) gives $C_{\max}^{*} = 2\ln 2$. Using Theorem Q.0.18 and Equation (E.16),
$$
N_{\mathrm{MPU}}^{\mathrm{eff}}(M)\,C_{\max}^{*}
=
\frac{\mathcal{A}_H}{8\ln 2\,L_P^2}(2\ln 2)
=
\frac{\mathcal{A}_H}{4L_P^2}
=
S_{\mathrm{BH}}(M).
$$
At $M = m_P$, this gives $N_{\mathrm{MPU}}^{\mathrm{eff}}(m_P) = 2\pi/\ln 2$ and $S_{\mathrm{BH}}(m_P) = 4\pi$. $\square$

#### Q.0.9.8.9 Conditional Landauer Horizon Spectroscopy for Horizon Closed Loops

**Definition Q.0.7u (Horizon Closed-Loop Transfer Record).** A horizon scattering mode lies on the horizon closed-loop transfer branch exactly when the branch supplies an accepted finite record
$$
\mathfrak T_{\mathrm{hor}}
=
\left(
\mathfrak H_n^{\mathrm{ret}},
\mathcal S_\omega,
\mathcal M_{\mathrm{scat}},
T_H,
\tau_H,
\Theta_{\mathrm{dyn}},
\Theta_{\mathrm{MPU}},
\mathcal D_{\mathrm{loop}},
\mathcal P_{\mathrm{peak}},
\varepsilon_{\mathrm{peak}},
\chi_{\mathrm{T}}
\right)
\tag{Q.0.7u.1}
$$
with the following entries:

1. $\mathfrak H_n^{\mathrm{ret}}$ is the retained finite-response horizon channel of Definition E.9.5d.
2. $\mathcal S_\omega$ is the finite horizon scattering data and mode domain on which the transfer map is claimed.
3. $\mathcal M_{\mathrm{scat}}$ is the retained scattering map from near-horizon loop data to the reduced thermal phase coordinate.
4. $T_H$ is the Hawking temperature in the accepted metric branch, and the normalized thermal coordinate is derived as
$$
x=\frac{\hbar\omega}{k_BT_H}.
\tag{Q.0.7u.2}
$$
5. $\tau_H$ is the near-horizon loop time certified by the scattering record and satisfies
$$
x=\omega\tau_H,
\qquad
\tau_H=\frac{2\pi c}{\kappa}
\tag{Q.0.7u.3}
$$
when the branch uses the standard Rindler-Hawking normalization.
6. $\Theta_{\mathrm{dyn}}=x\ \mathrm{mod}\ 2\pi$ is the dynamical loop phase.
7. $\Theta_{\mathrm{MPU}}=N\ln2\ \mathrm{mod}\ 2\pi$ is an independently registered structural phase contribution for an integer $N\ge1$; its identification with the same closed-loop phase is part of the accepted transfer record, not a consequence of SPAP or reset heat.
8. $\mathcal D_{\mathrm{loop}}$ is the transfer-map domain, including boundary conditions, single-valuedness convention, and finite resolution.
9. $\mathcal P_{\mathrm{peak}}$ is the peak-identification protocol and $\varepsilon_{\mathrm{peak}}$ is the certified phase tolerance. These entries concern phase positions only; amplitudes, widths, greybody factors, and nonresonant envelopes are separate scattering observables.
10. $\chi_T$ records that the loop map, tolerance, and mode domain are fixed before spectral comparison.

Without an accepted $\mathfrak T_{\mathrm{hor}}$, the retained horizon algebra and Page/scrambling certificates do not imply the closed-loop transfer map.

**Lemma Q.0.7v (Thermal Phase Identity).** For any horizon with Hawking temperature $k_B T_H=\hbar\kappa/(2\pi c)$ and Rindler-Landauer cycle time $\tau_H=2\pi c/\kappa$,
$$
\frac{\hbar\omega}{k_B T_H}=\omega\tau_H.
$$

*Proof.* Multiplying $k_B T_H=\hbar\kappa/(2\pi c)$ by $\tau_H=2\pi c/\kappa$ gives $k_B T_H\tau_H=\hbar$. Dividing $\hbar\omega$ by $k_B T_H$ gives $\omega\tau_H$. $\square$

**Proposition Q.0.7v.1 (Explicit Finite Lossless Same-Loop Transfer Map).** Fix an accepted retained horizon channel $\mathfrak H_n^{\mathrm{ret}}$, a finite mode set $\Omega$, and the Rindler--Hawking entries $(T_H,\tau_H)$ of Definition Q.0.7u. On a one-dimensional retained scattering-mode fiber, define
$$
\mathcal S_\omega=e^{i\omega\tau_H},
\qquad
\mathcal M_{\mathrm{scat}}(\mathcal S_\omega)
:=[\omega\tau_H]_{2\pi}
=\left[\frac{\hbar\omega}{k_BT_H}\right]_{2\pi}.
\tag{Q.0.7v.1.1}
$$
For an independently registered structural label $N\ge1$, let the same loop fiber subsequently acquire the controlled phase $e^{-iN\ln2}$. The complete loop multiplier is therefore
$$
U_{\omega,N}
=e^{i(\omega\tau_H-N\ln2)},
\tag{Q.0.7v.1.2}
$$
so exact constructive interference occurs exactly when
$$
\omega\tau_H-N\ln2\in2\pi\mathbb Z.
\tag{Q.0.7v.1.3}
$$
Choose $\mathcal D_{\mathrm{loop}}=\Omega\times\{1,\ldots,N_{\max}\}$, let $\mathcal P_{\mathrm{peak}}$ accept modes with $\operatorname{dist}_{2\pi}(\omega\tau_H,N\ln2)\le\varepsilon_{\mathrm{peak}}$, and forward-lock $(\Omega,N_{\max},\varepsilon_{\mathrm{peak}})$. This populates every transfer-map, same-loop, phase-position and tolerance entry of Definition Q.0.7u for the finite lossless fiber. The retained horizon channel and its KMS/metric descent remain imported premises rather than consequences of this one-mode construction.

*Proof.* The scattering multiplier is unitary and its argument is the first expression in (Q.0.7v.1.1); Lemma Q.0.7v gives the thermal-coordinate equality. Serial phases on the same one-dimensional fiber multiply, proving (Q.0.7v.1.2). A unit complex number equals one exactly when its phase is in $2\pi\mathbb Z$, proving (Q.0.7v.1.3). The displayed finite domain and decision rule are normalized and fixed independently of any spectral data. ∎

**Resolution TV-Q-09-P1 (Metadata).** Exact domain: finite lossless one-mode fibers over an accepted $\mathfrak H_n^{\mathrm{ret}}$ and finite $(\Omega,N)$ domain. Premises: the accepted horizon channel, Rindler--Hawking $(T_H,\tau_H)$ and independently registered structural phase. Equivalence: unitary rephasing that preserves the complete loop multiplier. Budget: every $(\omega,N)$ in $\mathcal D_{\mathrm{loop}}$. Verifier: unitarity, the thermal identity, serial same-fiber multiplication and the locked tolerance rule. Falsifier: unequal dynamical and thermal phase coordinates, phases acting on different loop fibers, or a peak outside the locked tolerance. Provenance class: source-internal finite scattering construction conditional on the accepted horizon channel. Downstream consumers: Definition Q.0.7u, Proposition Q.0.19 and `TV-Q-09`. The proposition gives `positive-discharge` for the finite lossless transfer-map subclass. Derivation of the imported retained horizon/KMS channel and nontrivial greybody amplitudes remains outside this partial scope.

**Proposition Q.0.19 (Conditional Landauer Phase-Grid Signature).** On an accepted horizon closed-loop transfer record $\mathfrak T_{\mathrm{hor}}$, resonant phase-matching points in the thermal variable $x=\hbar\omega/(k_BT_H)$ obey
$$
\operatorname{dist}_{2\pi}(x,N\ln2)
:=
\min_{k\in\mathbb Z}|x-N\ln2-2\pi k|
\le\varepsilon_{\mathrm{peak}},
\qquad
N\in\mathbb Z_{\ge1}.
\tag{Q.0.19.1}
$$
Exact congruence is the special branch $\varepsilon_{\mathrm{peak}}=0$. Equivalently, after rescaling $x\mapsto x/(2\pi)$, the phase-position grid is the irrational rotation orbit
$$
\{N\alpha_L\bmod1:N\in\mathbb Z_{\ge1}\},
\qquad
\alpha_L=\frac{\ln2}{2\pi}.
\tag{Q.0.19.2}
$$
The orbit is dense and equidistributed in $[0,1)$, and every finite truncation partitions the circle into at most three distinct gap lengths. This proposition fixes only phase-grid positions; it does not fix amplitudes, widths, greybody factors, or nonresonant envelopes.

*Proof.* Definition Q.0.7u supplies the circular-distance bound (Q.0.19.1) between the dynamical loop phase $x$ and the MPU-cycle phase $N\ln2$ on the certified transfer domain. Dividing by $2\pi$ gives the rotation by $\alpha_L$ on $\mathbb R/\mathbb Z$. Lemma Q.0.7b gives transcendence, hence irrationality, of $\alpha_L$. Irrational rotations are dense and equidistributed by Weyl equidistribution. The finite-truncation gap statement is Proposition Q.0.7n applied to the same orbit. $\square$

**Corollary Q.0.19a (Beatty Staircase of Lower Phase Approximants).** For each $k\ge1$, define
$$
N_k^+:=\lfloor\beta_Lk\rfloor,
\qquad
\beta_L=\frac{2\pi}{\ln2},
$$
and
$$
\Delta_k^+:=2\pi k-N_k^+\ln2.
$$
Then
$$
0<\Delta_k^+<\ln2,
$$
and $N_{k+1}^+-N_k^+\in\{9,10\}$ with limiting $10$-step frequency $\beta_L-9$. These are arithmetic phase approximants. They are structural horizon-loop phase overheads only when an admitted loop satisfies Definition Q.0.7e and Proposition Q.0.7f for the same pair; physical entropy production additionally requires the eventwise reset calibration (Q.0.7e.0).

*Proof.* Proposition Q.0.7j gives the Beatty staircase. Irrationality of $\beta_L$ makes the lower mismatch strictly positive. The physical-status statement follows from Definition Q.0.7h. ∎

**Corollary Q.0.19b (Convergent Hierarchy of Smallest Phase Defects).** *Let $(k_n,N_n)=(p_n,q_n)$ be the continued-fraction convergents of $\alpha_L=\ln2/(2\pi)$. Then*
$$
\delta_{N_n}:=\min_{k\in\mathbb Z}|N_n\ln2-2\pi k|<\frac{2\pi}{N_n}.
$$
*The first low-defect pairs are*
$$
(k,N)\in\{(1,9),\ (15,136),\ (31,281),\ (139,1260),\ (170,1541),\ldots\}.
$$

*Proof.* This is Corollary Q.0.7l translated from $|N\alpha_L-k|$ to $|N\ln2-2\pi k|$ by multiplication by $2\pi$. $\square$

**Proposition Q.0.20 (Conditional Phase Scales on the Transfer Branch).** On an accepted horizon closed-loop transfer record $\mathfrak T_{\mathrm{hor}}$ that independently registers the phase step $\ln2$, the grid scales are $(2\pi,\ln2)$. Hence the grid in $x=\hbar\omega/(k_BT_H)$ is independent of horizon mass, charge, spin, and matter content at the level of phase positions, up to the certified tolerance $\varepsilon_{\mathrm{peak}}$. Amplitudes, widths, greybody factors, peak heights, and the nonresonant envelope remain separate outputs of $\mathcal M_{\mathrm{scat}}$.

*Proof.* The period $2\pi$ is the single-valuedness period, and $\ln2$ is an explicit phase-step entry of $\mathfrak T_{\mathrm{hor}}$. Neither varies with horizon parameters by the definition of that transfer branch. The phase step is not derived from SPAP or Theorem 31. $\square$

**Corollary Q.0.20a (Temperature-Normalized Cross-Horizon Collapse).** *Let $H_1$ and $H_2$ be two horizons satisfying the same closed-loop transfer branch of Definition Q.0.7u with peak tolerance $\varepsilon_{\mathrm{peak}}$, with Hawking temperatures $T_{H,1}$ and $T_{H,2}$. Define the reduced thermal phase map*
$$
\Pi(\omega,H)
:=
\left[
\frac{\hbar\omega}{k_B T_H}
\right]_{2\pi}
\in\mathbb R/(2\pi\mathbb Z).
$$
*If two resonant transfer peaks carry the same cycle label $N$, then*
$$
\operatorname{dist}_{2\pi}\!\left(\Pi(\omega_N^{(1)},H_1),\,\Pi(\omega_N^{(2)},H_2)\right)\le2\varepsilon_{\mathrm{peak}},
$$
*and on the exact-closure subbranch $\varepsilon_{\mathrm{peak}}=0$ both reduced phases equal $[N\ln2]_{2\pi}$. If a common lift $m\in\mathbb Z_{\ge0}$ is chosen so that*
$$
x_{N,m}:=N\ln2+2\pi m,
$$
*and $\varepsilon_{\mathrm{peak}}<x_{N,m}$, then the corresponding physical frequencies obey*
$$
\left|\frac{\omega_{N,m}^{(1)}}{\omega_{N,m}^{(2)}}-\frac{T_{H,1}}{T_{H,2}}\right|
\le
\frac{T_{H,1}}{T_{H,2}}\,
\frac{2\varepsilon_{\mathrm{peak}}}{x_{N,m}-\varepsilon_{\mathrm{peak}}},
$$
*with the exact ratio $\omega_{N,m}^{(1)}/\omega_{N,m}^{(2)}=T_{H,1}/T_{H,2}$ on the exact-closure subbranch. Thus the branch predicts a universal temperature-normalized phase ruler at tolerance $2\varepsilon_{\mathrm{peak}}$, while raw frequencies scale with horizon temperature.*

*Proof.* Proposition Q.0.19 gives
$$
\operatorname{dist}_{2\pi}\!\left(\frac{\hbar\omega_N^{(r)}}{k_B T_{H,r}},\,N\ln2\right)\le\varepsilon_{\mathrm{peak}}
$$
for each horizon $H_r$, and the triangle inequality in $\mathbb R/(2\pi\mathbb Z)$ gives the reduced-phase bound; at $\varepsilon_{\mathrm{peak}}=0$ both phases equal $[N\ln2]_{2\pi}$. For the lifted form write $\hbar\omega_{N,m}^{(r)}/(k_B T_{H,r})=x_{N,m}+e_r$ with $|e_r|\le\varepsilon_{\mathrm{peak}}$. Then
$$
\frac{\omega_{N,m}^{(1)}}{\omega_{N,m}^{(2)}}
=
\frac{T_{H,1}}{T_{H,2}}\cdot\frac{x_{N,m}+e_1}{x_{N,m}+e_2},
\qquad
\left|\frac{x_{N,m}+e_1}{x_{N,m}+e_2}-1\right|
\le
\frac{|e_1-e_2|}{x_{N,m}-\varepsilon_{\mathrm{peak}}}
\le
\frac{2\varepsilon_{\mathrm{peak}}}{x_{N,m}-\varepsilon_{\mathrm{peak}}},
$$
and at $\varepsilon_{\mathrm{peak}}=0$ the ratio is exactly $T_{H,1}/T_{H,2}$. $\square$

**Corollary Q.0.20b (Three-Gap Spectral Fingerprint).** *For a finite Landauer-spectroscopy truncation*
$$
\mathcal P_{N_{\max}}
:=
\{[N\ln2]_{2\pi}:1\le N\le N_{\max}\},
$$
*sort the points cyclically in $[0,2\pi)$ and let $\mathcal G_{N_{\max}}$ be the set of adjacent circular gap lengths. Then*
$$
|\mathcal G_{N_{\max}}|\le3.
$$
*Consequently, on the horizon closed-loop transfer branch, the phase positions of any peak set that realizes the first $N_{\max}$ Landauer labels have a three-gap finite-budget fingerprint after transforming frequencies to $x=\hbar\omega/(k_B T_H)$.*

*Proof.* Divide the phase points by $2\pi$. The set becomes
$$
\{N\alpha_L\bmod1:1\le N\le N_{\max}\},
\qquad
\alpha_L=\frac{\ln2}{2\pi}.
$$
By Lemma Q.0.7b, $\alpha_L$ is irrational. Proposition Q.0.7n applies to this finite irrational-rotation orbit and says that the adjacent circular gaps in $[0,1)$ have at most three lengths. Multiplication by $2\pi$ preserves the number of distinct gap lengths, proving the claim for $\mathcal P_{N_{\max}}$. The final sentence is Proposition Q.0.19 translated to measured thermal frequency phases. $\square$

**Proposition Q.0.20b.1 (Certified Landauer Phase-Grid Ledger).** On the horizon closed-loop transfer branch of Definition Q.0.7u, set
$$
\alpha_L:=\frac{\ln2}{2\pi},
\qquad
x_N:=[N\ln2]_{2\pi}=2\pi\{N\alpha_L\}.
$$
Assume an accepted finite certificate $\mathfrak C_{\mathrm{grid}}$ accompanies the ledger. It contains rational outward enclosures for $\ln2$, $\pi$, and $\alpha_L$; an interval-certified continued-fraction quotient transcript; exact integer recurrences for every displayed $(p_k,q_k)$; rational enclosures proving every displayed rounded error and discrepancy; and, for each finite gap row, a permutation whose interval-separated residues are in cyclic order together with exact gap multiplicities. Acceptance means that every interval operation is outward rounded, every asserted floor is constant on its input interval, every recurrence is an exact integer identity, and every displayed decimal interval rounds uniquely to the printed digits. The following finite ledger is recorded before any comparison with a horizon-transfer dataset and is conditional on acceptance of $\mathfrak C_{\mathrm{grid}}$.

1. **Grid ratio.**
$$
\alpha_L=0.11031780007632579669822821605899884549134487436482\ldots .
$$
Lemma Q.0.7b makes $\alpha_L$ transcendental and therefore irrational. Hence $N\mapsto x_N$ is injective on $\mathbb Z_{\ge1}$: if $x_N=x_M$ with $N\ne M$, then $(N-M)\ln2\in2\pi\mathbb Z$, contradicting irrationality of $\alpha_L$.

2. **Continued-fraction prefix.** Precision-doubling at 400 and 800 decimal digits gives the same first 40 partial quotients; the prefix used in the ledger is
$$
\alpha_L=[0;9,15,2,4,1,1,1,1,2,2,3,1,1,1,1,3,4,1,1,1,1,24,1,2,1,\ldots].
$$
In particular $\sum_{i=1}^{10}a_i=38$.

3. **Convergents and near-recurrences.** For the convergents $p_k/q_k$ of $\alpha_L$, the following entries are the best-approximation ladder used by Corollary Q.0.19b. Beyond the trivial $N=1$ entry, the listed denominators give the successive record-small phase defects over the displayed range.

| $k$ | $p_k$ | $q_k$ | $\lvert\alpha_L-p_k/q_k\rvert$ | $q_k\lVert q_k\alpha_L\rVert$ | $\lvert q_k\ln2-2\pi p_k\rvert$ rad |
|---|---:|---:|---:|---:|---:|
| 1 | 1 | 9 | $7.93\times10^{-4}$ | $0.0643$ | $4.486\times10^{-2}$ |
| 2 | 15 | 136 | $2.37\times10^{-5}$ | $0.438$ | $2.024\times10^{-2}$ |
| 3 | 31 | 281 | $2.48\times10^{-6}$ | $0.196$ | $4.387\times10^{-3}$ |
| 4 | 139 | 1260 | $3.40\times10^{-7}$ | $0.539$ | $2.690\times10^{-3}$ |
| 5 | 170 | 1541 | $1.75\times10^{-7}$ | $0.416$ | $1.697\times10^{-3}$ |
| 6 | 309 | 2801 | $5.64\times10^{-8}$ | $0.443$ | $9.928\times10^{-4}$ |
| 7 | 479 | 4342 | $2.58\times10^{-8}$ | $0.487$ | $7.041\times10^{-4}$ |
| 8 | 788 | 7143 | $6.43\times10^{-9}$ | $0.328$ | $2.887\times10^{-4}$ |
| 9 | 2055 | 18628 | $1.08\times10^{-9}$ | $0.376$ | $1.268\times10^{-4}$ |
| 10 | 4898 | 44399 | $1.26\times10^{-10}$ | $0.248$ | $3.512\times10^{-5}$ |
| 11 | 16749 | 151825 | $2.25\times10^{-11}$ | $0.518$ | $2.144\times10^{-5}$ |
| 12 | 21647 | 196224 | $1.11\times10^{-11}$ | $0.427$ | $1.368\times10^{-5}$ |
| 13 | 38396 | 348049 | $3.55\times10^{-12}$ | $0.430$ | $7.759\times10^{-6}$ |
| 14 | 60043 | 544273 | $1.73\times10^{-12}$ | $0.513$ | $5.919\times10^{-6}$ |
| 15 | 98439 | 892322 | $3.28\times10^{-13}$ | $0.261$ | $1.840\times10^{-6}$ |

The finite table is not an asserted irrationality-measure theorem; it is the certified finite arithmetic record used by the branch.

4. **Window-counting bound.** Let $D_N^*$ be the star discrepancy of $\{\{j\alpha_L\}:1\le j\le N\}$. The standard continued-fraction discrepancy bound gives, for $q_k\le N<q_{k+1}$,
$$
N D_N^*\le C_0+\sum_{i=1}^{k+1}a_i,
\qquad C_0\le3.
$$
Therefore every $N\in[q_9,q_{10})=[18628,44399)$ satisfies
$$
D_N^*\le\frac{41}{N}.
$$
For any phase window of width $w$ radians, the count among the first $N$ grid points differs from $Nw/(2\pi)$ by at most $2ND_N^*$. Verified instances are
$$
D_{137}^*=0.0129410421831,
\qquad
D_{1000}^*=0.00294366579284,
\qquad
D_{18628}^*=5.36815450825\times10^{-5}.
$$

5. **Two-gap and three-gap rows.** At $N=q_k$, direct cyclic sorting gives exactly two gaps:
$$
\ell_1=\|q_{k-1}\alpha_L\|,
\qquad
\ell_2=\|q_{k-1}\alpha_L\|+\|q_k\alpha_L\|,
$$
as fractions of the circle, with multiplicities $q_k-q_{k-1}$ and $q_{k-1}$.

| $k$ | $q_k$ | gap lengths as fractions of the circle | multiplicities |
|---|---:|---:|---:|
| 2 | 136 | $0.0071397993$, $0.0103606097$ | $(127,9)$ |
| 9 | 18628 | $4.59451952\times10^{-5}$, $6.61233982\times10^{-5}$ | $(11485,7143)$ |
| 10 | 44399 | $2.01782031\times10^{-5}$, $2.57669921\times10^{-5}$ | $(25771,18628)$ |

For generic finite budgets the three-distance theorem gives at most three gaps; the following rows are direct finite checks, with the largest equal to the sum of the two smaller gaps whenever three gaps occur.

| $N$ | distinct gaps | lengths as fractions of the circle with multiplicities |
|---:|---:|---|
| 9 | 2 | $0.1103178\times8$, $0.1174576\times1$ |
| 24 | 3 | $0.00713980\times15$, $0.09603820\times5$, $0.10317800\times4$ |
| 137 | 3 | $0.00322081\times1$, $0.00713980\times128$, $0.01036061\times8$ |
| 1000 | 3 | $0.00069818\times719$, $0.00112627\times21$, $0.00182445\times260$ |
| 4111 | 3 | $0.00015801\times1310$, $0.00027008\times2570$, $0.00042810\times231$ |

The insertion order of the grid is the Sturmian word
$$
s_N=\lfloor(N+1)\alpha_L\rfloor-\lfloor N\alpha_L\rfloor\in\{0,1\},
$$
so the Beatty/convergent/three-gap ledger is completely determined by the finite continued-fraction record above.

*Proof.* The certificate enclosures for the two transcendental inputs can be checked using convergent series. The identity
$$
\ln2=2\sum_{m=0}^{\infty}\frac1{(2m+1)3^{2m+1}}
$$
has, after the terms $m=0,\ldots,M-1$, a positive remainder bounded by
$$
\frac{2}{2M+1}\frac{3^{-(2M+1)}}{1-3^{-2}}.
$$
Machin's identity
$$
\pi=16\arctan(1/5)-4\arctan(1/239)
$$
is verified by the tangent addition formula and the fact that both sides lie in $(3,4)$; each arctangent is enclosed by its alternating series, whose error is smaller than the first omitted term. Rational interval division then encloses $\alpha_L=\ln2/(2\pi)$ and verifies the printed prefix in item 1 by unique decimal rounding.

For item 2, begin with the certified interval for $y_0=\alpha_L$. At stage $j$, the certificate verifies that $y_j$ lies strictly inside one unit interval $(a_j,a_j+1)$ and forms an outward enclosure for
$$
y_{j+1}=\frac1{y_j-a_j}.
$$
Induction therefore proves every recorded partial quotient. The exact recurrences
$$
p_j=a_jp_{j-1}+p_{j-2},
\qquad
q_j=a_jq_{j-1}+q_{j-2},
$$
with $(p_{-1},p_0)=(1,0)$ and $(q_{-1},q_0)=(0,1)$ prove all integer entries in item 3. The certificate evaluates
$$
e_j=\left|\alpha_L-\frac{p_j}{q_j}\right|,
\qquad
q_j\lVert q_j\alpha_L\rVert=q_j|q_j\alpha_L-p_j|,
\qquad
|q_j\ln2-2\pi p_j|=2\pi|q_j\alpha_L-p_j|
$$
by outward interval arithmetic. Each resulting interval lies inside the rounding cell of the printed entry. Theorem Q.0.7k proves the record-minimum interpretation.

For item 4, the continued-fraction discrepancy theorem for an irrational rotation (Kuipers and Niederreiter 1974) applies because Lemma Q.0.7b proves irrationality and the exact recurrence verifies $q_k\le N<q_{k+1}$. It yields
$$
ND_N^*\le3+\sum_{i=1}^{k+1}a_i.
$$
The certified quotients give $\sum_{i=1}^{10}a_i=38$, hence $D_N^*\le41/N$ on the displayed range. If $0\le y_1\le\cdots\le y_N<1$ are the certified sorted residues, then
$$
D_N^*
=\max_{1\le i\le N}
\max\left\{\frac iN-y_i,\ y_i-\frac{i-1}{N}\right\}.
$$
The supplied permutations and interval comparisons prove the three displayed finite values by this formula. An arbitrary circular arc is a difference of at most two anchored intervals, so its counting error is at most $2ND_N^*$.

For item 5, the three-gap theorem for irrational rotations (Sós 1958; Świerczkowski 1958) applies to $\alpha_L$. Its convergent-denominator specialization (Slater 1967) gives the two lengths
$$
\lVert q_{k-1}\alpha_L\rVert,
\qquad
\lVert q_{k-1}\alpha_L\rVert+\lVert q_k\alpha_L\rVert
$$
with multiplicities $q_k-q_{k-1}$ and $q_{k-1}$; these sum to $q_k$. For every other displayed row, the certificate permutation places the intervals for $\{j\alpha_L\}$ in strict cyclic order. Subtracting successive intervals, including the wraparound gap, proves the listed lengths, multiplicities, and their sum-to-one check. Finally, $0<\alpha_L<1$ implies
$$
\lfloor(N+1)\alpha_L\rfloor-\lfloor N\alpha_L\rfloor\in\{0,1\},
$$
which proves the Sturmian insertion formula. No statement about amplitudes, widths, greybody factors, or nonresonant envelopes enters the certificate. $\square$

**Remark Q.0.20b.2 (Status Split for the Horizon Transfer Branch).** Proposition Q.0.20b.1 closes only the phase-grid arithmetic after an accepted transfer record $\mathfrak T_{\mathrm{hor}}$ is present. It fixes the positions, recurrence hierarchy, finite gap statistics, and window-counting bounds of the Landauer grid. It does not by itself derive the transfer map from retained horizon channel data, and it does not fix amplitudes, widths, greybody factors, nonresonant envelopes, or peak-identification tolerances.

**Theorem Q.0.20b.3 (Transfer-Map Separation Theorem).** The retained horizon channel $\mathfrak H_n^{\mathrm{ret}}$, deterministic exterior recovery certificate $\mathfrak S_{\mathrm{hor},n}$, and Page/design scrambling certificates prove retained conservation, exterior recovery, or Page-type entropy statements according to their own norms. They do not imply the tolerance-certified transfer law
$$
\operatorname{dist}_{2\pi}(x,N\ln2)\le\varepsilon_{\mathrm{peak}}
$$
unless an accepted horizon transfer record $\mathfrak T_{\mathrm{hor}}$ supplies the scattering map, loop time, MPU-cycle phase, domain, and phase tolerance of Definition Q.0.7u. Thus the closed-loop transfer map is a separate branch hypothesis until derived from finite horizon scattering data.

*Proof.* The records $\mathfrak H_n^{\mathrm{ret}}$, $\mathfrak S_{\mathrm{hor},n}$, and the Appendix K design certificates are maps between retained algebras, exterior coarse records, moment operators, and trace/entropy norms. None of their entries contains a near-horizon scattering phase map, a loop-time identification, or a peak-position tolerance. Two finite horizon branches can therefore agree on retained conservation, recovery, and Page data while differing on scattering phase positions. By Theorem P.14.1f, the phase transfer law is non-identifiable from those records alone. Definition Q.0.7u lists the additional finite entries that make the phase-grid branch theorem-level. ∎
**Corollary Q.0.20c (Landauer Horizon Spectroscopy Null Conditions).** *Within an independently validated Definition Q.0.7u transfer branch, the following observations falsify the Landauer phase-grid component of that branch:*

1. *a statistically resolved resonance phase set whose reduced positions cannot be matched to*
$$
[N\ln2]_{2\pi}
$$
*within the stated instrumental and greybody-model phase uncertainty;*

2. *a cross-horizon comparison in which matched labels fail the temperature-normalized collapse*
$$
\Pi(\omega_N,H)=[N\ln2]_{2\pi};
$$

3. *a finite-budget resolved label block whose adjacent reduced-phase gaps violate the three-gap bound.*

*Proof.* Item 1 contradicts Proposition Q.0.19. Item 2 contradicts Corollary Q.0.20a. Item 3 contradicts Corollary Q.0.20b. Each contradiction is conditional on the prior validation of Definition Q.0.7u; absent that branch, the null result rejects the transfer bridge rather than the SPAP/Landauer cost theorem itself. $\square$

**Remark Q.0.19.1 (Numerical Phase Locations).** Substituting $\ln2\approx0.6931472$ and $2\pi\approx6.2831853$, the first nine phase-grid locations are
$$
\{N\ln2\bmod2\pi\}_{N=1}^{9}
=
\{0.6931,\,1.3863,\,2.0794,\,2.7726,\,3.4657,\,4.1589,\,4.8520,\,5.5452,\,6.2383\}.
$$
The next point is $10\ln2\bmod2\pi\approx0.6483$. In sector $k=1$, the positive-overhead Beatty value is $N_1^+=9$ and $\Delta_1^+=2\pi-9\ln2\approx0.0449$.

**Remark Q.0.19.2 (Status Boundary for Landauer Horizon Spectroscopy).** Proposition Q.0.19 is a conditional phase-grid statement. It should not be read as a theorem that the full greybody correction is a universal function of $x$ alone. Standard greybody factors also carry angular-momentum, spin, polarization, dimension, and barrier-shape data. The framework-level prediction is the parameter-free phase grid on the closed-loop transfer branch.

## Q.1 Foundational Relation and the Optimization Goal

This appendix relates the emergent Planck length $L_P$ to the MPU spacing $\delta$ on the Appendix-E area-law branch and then evaluates the relation on a specified intersection of channel branches. Equation E.9 gives
$$
G=\frac{\eta\delta^2c^3}{4\hbar\chi C_{\max}}.
\tag{Q.1}
$$
Using $L_P^2=G\hbar/c^3$ yields
$$
L_P^2=\frac{\eta\delta^2}{4\chi C_{\max}},
\tag{Q.2}
$$
and hence
$$
\frac{\delta^2}{L_P^2}=\frac{4\chi C_{\max}}{\eta}.
\tag{Q.3}
$$

## Q.2 Conditional Boundary-Parameter Assignments

Equation Q.3 is evaluated below using three independent entries: the residual-budget capacity assignment, the throughput-saturated channel-independence selection with the other variables held constant, and the ideal-packing selection with the other variables held constant. Their simultaneous use defines the combined branch. The cited results do not establish a coupled global optimizer, its uniqueness, or its stability.

### Q.2.1 Channel Capacity: $C_{\max}^* = 2\ln 2$ on the Residual-Budget Branch

On the separately assumed residual-budget branch of Appendix E, Equation E.14 assigns
$$
C_{\max}^*=\ln d_0-\varepsilon_0.
$$
Combining the Theorem-Z.2 comparator value $d_0=8$ with the registered binary structural value $\varepsilon_0=\ln2$ from Definition 28, Definition J.1, and Theorem J.1 gives
$$
\boxed{C_{\max}^*=\ln8-\ln2=2\ln2=2\varepsilon_0}. \tag{Q.10}
$$
This is a conditional allocation identity, not a consequence of SPAP or of physical reset heat. Alternative resource-partition rules give different $C_{\max}^*$ and therefore different values of $\delta/L_P$ in Sections Q.2.4 and Q.5.


**Remark Q.10.1 (Bit-Budget Characterization).** Since $N_{\mathrm{vis}}^{\min}=2^{K_0}=8$ and the minimal complex Hilbert carrier saturates $d_0=N_{\mathrm{vis}}^{\min}$ on the minimal branch, while the PCE reference uses structural $\varepsilon_0=\ln2$, the capacity-cost ratio has the structural form
$$
\frac{C_{\max}^*}{\varepsilon} = \frac{\ln(d_0)-\varepsilon}{\varepsilon} = K_0 - 1.
$$
At $K_0=3$ this gives $C_{\max}^*/\varepsilon=2$: under the residual-budget rule, one structural bit is reserved and $K_0-1=2$ structural bits remain as residual channel capacity. This counting identity does not imply a physical Landauer cost without the independent reset hypotheses stated above.

### Q.2.2 Correlation Factor: $\chi^* = 1$

**Lemma Q.2.2 (Channel Independence on the Throughput-Saturated Branch).** Hold $(\delta,\eta,C_{\max})$ constant, assume the accepted objective is strictly increasing in the saturated ND-RID throughput, and assume $\chi=1$ is feasible. Then
$$
\boxed{\chi^*=1.}
\tag{Q.11}
$$

*Proof.* The effective link count is $N_{\mathrm{eff}}=\chi N_{\mathrm{geom}}$ with $0<\chi\le1$. With the remaining variables constant, the throughput is strictly increasing in $\chi$, so its feasible maximum is attained at $\chi=1$. ∎

### Q.2.3 Packing Factor: $\eta^* = 1$

**Lemma Q.2.3 (Ideal Packing on the Throughput-Saturated Branch).** Hold $(\delta,\chi,C_{\max})$ constant, assume the accepted objective is strictly increasing in the saturated ND-RID throughput, and assume $\eta=1$ is feasible. Then
$$
\boxed{\eta^*=1.}
\tag{Q.12}
$$

*Proof.* Since $\sigma_{\mathrm{geom}}=1/(\eta\delta^2)$ with $\eta\ge1$, the throughput is strictly decreasing in $\eta$ while the remaining variables are constant. Its feasible maximum is therefore attained at $\eta=1$. ∎

### Q.2.4 Final Result

Substituting the three independently selected branch values $C_{\max}^*=2\ln2$, $\chi^*=1$, and $\eta^*=1$ into Equation (Q.3) yields the closed-form ratio reported in Equation (Q.18):
$$
\frac{\delta^2}{L_P^2}=8\ln 2,\qquad \frac{\delta}{L_P}=\sqrt{8\ln 2}\approx 2.355.
$$

**Theorem Q.2.4a (Scale-Surface and Coupled-Objective Nonentailment).** Fix any $r>0$. On the declared parameter domain $C_{\max}>0$, $0<\chi\le1$, and $\eta\ge1$, Equation Q.3 with $\delta^2/L_P^2=r$ has the two-parameter solution surface
$$
\mathcal F_r
=\left\{
\left(\frac{r\eta}{4\chi},\chi,\eta\right):
0<\chi\le1,\ \eta\ge1
\right\}.
\tag{Q.2.4a.1}
$$
In particular, at $r=8\ln2$, both
$$
z_0=(2\ln2,1,1),
\qquad
z_1=(4\ln2,1,2)
\tag{Q.2.4a.2}
$$
give the same spacing ratio. For $j\in\{0,1\}$ the smooth objective completion on the ambient parameter domain
$$
J_j(z)=\|z-z_j\|_2^2
\tag{Q.2.4a.3}
$$
is strongly convex, has Hessian $2I$, and has the unique stable minimizer $z_j$. Thus Equation Q.3 and its spacing value do not select a coupled objective, a unique optimizer, or its stochastic dynamics. Hard-imposing the three separate branch assignments selects $z_0$ by premise, not by a coupled optimization theorem.

*Proof.* Solving $4\chi C_{\max}/\eta=r$ for $C_{\max}$ gives (Q.2.4a.1); substitution gives (Q.2.4a.2). The gradient and Hessian of (Q.2.4a.3) are $2(z-z_j)$ and $2I$, so $z_j$ is its unique global minimizer and is Lyapunov stable under the gradient flow $\dot z=-\nabla J_j(z)$. Since the two admissible completions share $r$ but select different minimizers, the scale relation cannot entail the missing coupled objective or optimizer. ∎

**Resolution TV-Q-10-N1 (Metadata).** Exact domain: the positive parameter domain and fixed-spacing surfaces (Q.2.4a.1), with smooth strongly convex objective completions. Premises: Equation Q.3 and no independently registered coupled PCE objective. Equivalence: equality of $(C_{\max},\chi,\eta)$ and the spacing response $4\chi C_{\max}/\eta$. Budget: every point of $\mathcal F_r$ and the two explicit completions (Q.2.4a.3). Verifier: substitution, gradients, Hessians and minimizer identities. Falsifier: a derivation from Equation Q.3 alone that forces the same objective and minimizer in both completions. Provenance class: source-internal continuum countermodel. Downstream consumers: Equation Q.18 and `TV-Q-10`. The two completions give `nonentailment` of a coupled optimizer from the scale relation alone. The separate coordinate assignments select $z_0$ only when hard-imposed; they still supply neither a coupled PCE objective nor its dynamics. A target-free feasible set and PCE objective derived from the retained dynamics, followed by complete minimizer and stochastic-stability classification, remain open.

**Conditional Horizon-Cell Spectrum.** On the joint residual-budget and ideal-packing branch, the identities are

$$
C_{\max}^*=\ln8-\ln2=\ln4,
\qquad \delta^2=4L_P^2\ln4.
$$

Section Z.6 gives a four-dimensional syndrome factor whose maximum entropy is $\ln4$. The canonical attractor has syndrome $00$ with certainty, so its actual syndrome entropy is zero. The four-state capacity and the entropy of a specified occupied state are distinct quantities. A horizon state with independent maximally mixed syndrome factors would have $S=N\ln4$; these are the occupancy and independence premises for that entropy.

**Area-spectrum hypothesis.** Assume an integer number of horizon cells, a fixed physical cell area $\delta^2$, an additive area operator, and transitions changing that cell number by one. This supplies an area spacing

$$
\Delta\mathcal A=4L_P^2\ln4.
$$

The spacing identity alone supplies an area scale. The integer-cell and transition hypotheses give it a spectral interpretation. Its observable spectrum is specified by allowed transitions, matrix elements, degeneracies and line broadening.

For a Schwarzschild state with $\mathcal A=16\pi G^2M^2/c^4$ and $0<\Delta\mathcal A\le\mathcal A$, loss of one area increment gives the exact emitted energy

$$
E=Mc^2\left[1-\sqrt{1-\Delta\mathcal A/\mathcal A}\right].
$$

For $\Delta\mathcal A/\mathcal A\ll1$,

$$
E=\frac{c^6\Delta\mathcal A}{32\pi G^2M}
\left[1+O(\Delta\mathcal A/\mathcal A)\right]
=k_BT_H\ln4\left[1+O(\Delta\mathcal A/\mathcal A)\right].
$$

The expansion follows from $1-\sqrt{1-x}=x/2+O(x^2)$ and $k_BT_H=\hbar c^3/(8\pi GM)$. Emitted transition energies and ringdown frequencies use distinct observable maps.

The proposed relation

$$
e^{\delta^2/(4L_P^2)}=(1+u^*)^M/2=d_0/a
$$

is retained on the conjunction of the spacing, binary active-rank, and saturation branches. It provides a check of shared normalizations.

## Q.5 Final Result and Interpretation

On the intersection of the residual-capacity, throughput-saturated, channel-independence, and ideal-packing branches, the registered values are:
* $C_{\max}^* = 2\ln 2$
* $\chi^* = 1$
* $\eta^* = 1$
* $\delta/L_P = \sqrt{8\ln 2} \approx 2.355$

These coordinate values do not by themselves establish existence, uniqueness, or dynamical stability of a global coupled PCE equilibrium.

Substituting the residual-capacity, throughput-saturated, and ideal-packing branch values into the foundational relation (Q.3) yields:

$$\frac{\delta^2}{L_P^2} = \frac{4\chi^* C_{\max}^*}{\eta^*}$$

With $\chi^*=1$, $\eta^*=1$, and $C_{\max}^*=2\ln2$ on those respective branches, this gives

$$\boxed{\frac{\delta^2}{L_P^2}=8\ln2,\qquad\frac{\delta}{L_P}=\sqrt{8\ln2}\approx2.355}.\tag{Q.18}$$

Thus the combined branch determines the dimensionless spatial ratio by the algebraic substitution
$$
\frac{\delta}{L_P}
=\sqrt{\frac{4\chi^*C_{\max}^*}{\eta^*}}
=\sqrt{\frac{4\cdot1\cdot2\ln2}{1}}
=\sqrt{8\ln2}.
$$
If the residual-capacity coefficient is replaced by $C_{\max}=2\lambda_C\ln2$, the same relation gives $\delta/L_P=\sqrt{8\lambda_C\ln2}$. These identities establish conditional compatibility; they do not establish existence, uniqueness, or stability of a global PCE optimizer.


## Q.6 Conditional Serialized-Frontier Calibration of the Temporal Scale

Equation Q.18 fixes the spatial ratio $\delta/L_P=\sqrt{8\ln2}$ only on its residual-budget, throughput-saturated, ideal-packing branch. A temporal ratio requires additional propagation and clock data.

### Q.6.1 Serialized-Frontier Calibration

**Proposition Q.6.1 (Conditional Serialized-Frontier Scale Calibration).** Assume:

1. a separately registered positive lower edge-update duration $\tau_{\min}$;
2. nonzero spacing $\delta$, edge-by-edge serialization, and bounded weights as in Theorem 46;
3. normalized uniform weights and one-link frontier attainment, so the attained speed is independently identified as
   $$
   c=\frac{\delta}{\tau_{\min}};
   $$
4. the Planck definitions, which give $c=L_P/t_P$.

Then
$$
\boxed{\frac{\delta}{L_P}=\frac{\tau_{\min}}{t_P}}.
$$

*Proof.* Under assumption 3 and the Planck identity,
$$
\frac{\delta}{\tau_{\min}}=c=\frac{L_P}{t_P}.
$$
Cross multiplication gives the displayed ratio. Theorem 29 does not supply assumption 1, Theorem 46 does not supply assumption 3, and Lorentzian promotion remains governed by Corollary 46a and Appendix O. ∎

**Proposition Q.6.1a (One-Link Clock-Rate Modulus).** Fix two cells at spacing $\delta>0$ and, for every rate $r>0$, let their continuous-time one-link dynamics have generator
$$
L_r
=r\begin{pmatrix}-1&1\\[2pt]1&-1\end{pmatrix}.
\tag{Q.6.1a.1}
$$
All members have the same adjacency, normalized uniform link weights, serialization class and spatial spacing. Starting in cell $0$, the probability of occupying cell $1$ at time $t$ is
$$
p_{01}^{(r)}(t)=\frac{1-e^{-2rt}}2.
\tag{Q.6.1a.2}
$$
For any forward-locked threshold $0<\theta<1/2$, the attained passage time and associated speed are
$$
\tau_\theta(r)
=-\frac{\ln(1-2\theta)}{2r},
\qquad
v_\theta(r)=\frac{\delta}{\tau_\theta(r)}.
\tag{Q.6.1a.3}
$$
Hence $r\mapsto\lambda r$ leaves every registered dimensionless graph and weight record unchanged while sending $\tau_\theta\mapsto\tau_\theta/\lambda$ and $v_\theta\mapsto\lambda v_\theta$. A dimensionful rate or clock calibration is therefore necessary to derive an attained frontier time from those structural records.

*Proof.* Exponentiating (Q.6.1a.1), or diagonalizing it into eigenvalues $0$ and $-2r$, gives (Q.6.1a.2). Solving $p_{01}^{(r)}(t)=\theta$ gives (Q.6.1a.3), and the rescaling identities are immediate. ∎

**Resolution TV-Q-11-N1 (Metadata).** Exact domain: the two-cell uniform one-link carrier (Q.6.1a.1), all $r>0$, and every fixed $0<\theta<1/2$. Premises: spacing, adjacency, normalized weights and serialization are registered, but no dimensionful rate is. Equivalence: equality of those dimensionless structural records and of $\delta$. Budget: every $r,\theta$ in the displayed domain. Verifier: generator normalization, the matrix exponential and the passage-time rescaling. Falsifier: a clock functional of the registered dimensionless records that distinguishes $L_r$ from $L_{\lambda r}$. Provenance class: source-internal finite Markov countermodel. Downstream consumers: Proposition Q.6.1, Theorem 46 and `TV-Q-11`. The rate family gives `nonentailment` of the attained clock and frontier speed from spacing, adjacency and normalized weights alone. Deriving the rate and uniform frontier from the same retained microdynamics remains open.

### Q.6.2 Temporal Scale on the Calibrated Branch

**Theorem Q.6.1 (Temporal Scale on the Serialized-Frontier Branch).** On the full branch of Proposition Q.6.1 and the spatial branch of Equation Q.18,
$$
\boxed{
\tau_{\min}=\sqrt{8\ln2}\,t_P\approx2.355\,t_P.
}
$$

*Proof.* Substitute $\delta/L_P=\sqrt{8\ln2}$ into the conditional ratio of Proposition Q.6.1. ∎

**Corollary Q.6.1 (Conditional Unified Discretization Formula).** On the same joint branch,
$$
\boxed{
\frac{\delta}{L_P}
=
\frac{\tau_{\min}}{t_P}
=
\sqrt{8\ln2}\approx2.355.
}
$$

Off the serialized-frontier calibration branch, Equation Q.18 fixes only the spatial ratio and the temporal ratio remains unclosed.

### Q.6.3 Information-Theoretic Interpretation

**Remark Q.6.1: Decomposition of the Discretization Scale.** The unified discretization factor $\sqrt{d_0 \cdot \varepsilon}$ admits a transparent information-theoretic decomposition:

- **Factor $d_0 = 8$:** Theorem 15 gives the finite operational-context floor $N_{\mathrm{vis}}^{\min}=2^{K_0}=8$; Theorem 23 gives the Hilbert-carrier lower bound $d_0\ge N_{\mathrm{vis}}^{\min}$; and the minimal PCE branch used in the Appendix Z backbone selects $d_0 = 8$ (Theorem Z.2). This encodes the logical structure required for self-referential prediction.

- **Factor $\varepsilon_0=\ln2$:** Definition 28 and Definition J.1 register the binary quotient, and Theorem J.1 supplies its structural log-cardinality. Lemma J.1 separately proves reset noninjectivity on its fixed-ready-state branch. Theorem 31 governs physical reset heat and is not used to define this factor.

The dimensionless value $\sqrt{d_0\varepsilon_0}=\sqrt{8\ln2}$ combines the selected carrier dimension with the structural binary reference on the stated saturation branch; it is not a universal thermodynamic cost of self-reference.

**Remark Q.6.2 (Complete Dependency Ledger).** The discretization formula uses two independently registered structural inputs:
$$
\left.
\begin{aligned}
(\mathrm{O1})\text{--}(\mathrm{O3})+(\mathrm{FC})
&\xrightarrow{\text{Thm 15}}K_0=3,\ N_{\mathrm{vis}}^{\min}=8
\xrightarrow{\text{Thm 23 + Hilbert distinguishability}}d_0\ge8
\xrightarrow{\text{Thm Z.2 comparator}}d_0=8,\\
\text{registered binary quotient}
&\xrightarrow{\text{Def 28; Def J.1; Thm J.1}}\varepsilon_0=\ln2
\end{aligned}
\right\}
\Longrightarrow
\frac{\delta}{L_P}
=
\sqrt{d_0\varepsilon_0}
=
\sqrt{8\ln2}
\quad\text{on Equation Q.18's branch.}
$$

The two inputs are recorded separately below; neither is derived from the other.

1. **The Hilbert space dimension** satisfies $d_0 \ge N_{\mathrm{vis}}^{\min}=8$ by Theorem 23, with equality $d_0=8$ on the minimal PCE branch (Theorem Z.2).

2. **The registered physical reset ledger** satisfies $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ by Theorem 31, with a positive uniform floor only if $H_q(P\mid R)\ge h_{\min}>0$. The structural reference $\varepsilon_0=\ln2$ instead comes from Definition 28, Definition J.1, and Theorem J.1; equality $\varepsilon_{\mathrm{reset}}=H_q(P\mid R)$ requires the overhead-free implementation branch.

The mutual consistency constraint relates the minimal-branch values $d_0 = 8$ and $a = 2$ through Theorem Z.2. It does not require the general identity $a = e^\varepsilon$.

### Q.6.4 Experimental Predictions

**Prediction Q.6.1 (No Leading Lorentz-Violating MDR at the PCE Attractor).** Modified dispersion relations (MDRs) provide a generic phenomenological signature of theories with fundamental discretization scales [Amelino-Camelia 2013, Mattingly 2005]. On the joint branch consisting of the serialized-frontier calibration of Proposition Q.6.1, the full Corollary 46a/Appendix O Lorentzian-promotion package, and cone sharing by the retained propagation sector with no appended preferred-frame operator, leading-order Lorentz-violating MDR terms written separately in powers of $E$ and $p$ are absent:
$$
E^2-p^2c^2=m^2c^4+\text{Lorentz-invariant corrections}.
$$
On that joint branch, the exact factor
$$
\frac{\delta}{L_P}=\frac{\tau_{\min}}{t_P}=\sqrt{8\ln 2}
$$
fixes the invariant MPU cutoff
$$
\Lambda_{\mathrm{MPU}}:=\frac{\hbar c}{\delta}=\frac{E_P}{\sqrt{8\ln 2}}\approx0.42466\,E_P,
$$
but it is not, by itself, an effective Lorentz-violation energy scale $E_{\mathrm{QG}}$.

*Derivation.* Proposition Q.6.1 calibrates the spatial and temporal scales only after the independent attained-frontier premise is accepted; it does not establish Lorentzian kinematics. The full Corollary 46a/Appendix O package supplies the Lorentzian principal symbol, while cone sharing and the absence of an appended preferred-frame operator exclude a sector-specific leading LIV term. Under those combined hypotheses the displayed dispersion relation is Lorentz invariant. If a non-attractor preferred-frame term is appended, its coefficient is instead governed by Prediction Q.6.2. Thus the null prediction belongs to the stated joint branch, not to Theorem 46 or Proposition Q.6.1 alone. $\square$

**Prediction Q.6.2 (Scale-Ledger Bound for Non-Attractor LIV Branches).** If an explicitly appended non-attractor propagation branch introduces a leading photon-speed correction
$$
\frac{\Delta v}{c}=\xi_n\left(\frac{E}{\Lambda_{\mathrm{MPU}}}\right)^n+O\!\left(\left(\frac{E}{\Lambda_{\mathrm{MPU}}}\right)^{n+1}\right),
\qquad n\in\{1,2\},
$$
then, in this convention, the corresponding effective quantum-gravity scale is
$$
E_{\mathrm{QG},n}=\Lambda_{\mathrm{MPU}}\,|\xi_n|^{-1/n}.
$$
Thus an observational lower bound $E_{\mathrm{QG},n}>B_n$ constrains the non-attractor branch coefficient by
$$
|\xi_n|<\left(\frac{\Lambda_{\mathrm{MPU}}}{B_n}\right)^n.
$$
Published photon time-of-flight limits therefore constrain only appended LIV branches, not the Lorentz-invariant attractor branch. In particular, an order-one linear branch with $E_{\mathrm{QG},1}=\Lambda_{\mathrm{MPU}}\approx0.42466E_P$ is incompatible with bounds above $E_P$ such as Vasileiou et al. (2013) and LHAASO Collaboration (2024). An order-one quadratic branch at $\Lambda_{\mathrm{MPU}}$ is not excluded by those quoted quadratic limits, because their published lower bounds are far below $0.42466E_P$.

*Derivation.* The first formula defines the appended branch coefficient $\xi_n$. Rewriting $|\xi_n|(E/\Lambda_{\mathrm{MPU}})^n$ as $(E/E_{\mathrm{QG},n})^n$ gives $E_{\mathrm{QG},n}=\Lambda_{\mathrm{MPU}}|\xi_n|^{-1/n}$. The observational inequality follows by monotonicity. Since the PCE-attractor branch has no leading Lorentz-violating coefficient in Prediction Q.6.1, setting $\xi_n=0$ makes $E_{\mathrm{QG},n}=\infty$ in this parametrization and evades finite lower-bound exclusions. $\square$

**Theorem Q.6.2a (Finite Rotational MDR Class and Coefficient Nonentailment).** Fix $J\ge2$. A real, translation-invariant, spatially rotation- and parity-invariant scalar quadratic propagation equation with a canonically normalized local time-kinetic term, no mixed time--space derivatives, and a polynomial spatial symbol of order at most $2J$ has Fourier dispersion
$$
\omega^2(k)
=\mu^2+c^2|k|^2
+c^2\sum_{j=2}^{J}b_j\delta^{2j-2}|k|^{2j},
\tag{Q.6.2a.1}
$$
after registering the low-energy coefficients $\mu^2$ and $c^2$. Conversely, every real coefficient vector $(b_2,\ldots,b_J)$ for which the right-hand side is nonnegative on the retained momentum window defines such a stable quadratic equation on that window. Neither the cutoff length $\delta$ nor the listed symmetries fixes any $b_j$.

On the massless branch, if $b_j$ is the first nonzero coefficient and $|b_j|(\delta|k|)^{2j-2}\ll1$, then
$$
\frac{v_g(k)}c
=1+\frac{2j-1}{2}b_j(\delta|k|)^{2j-2}
+O\!\left((\delta|k|)^{2j}\right)
+O\!\left(b_j^2(\delta|k|)^{4j-4}\right).
\tag{Q.6.2a.2}
$$
Thus the Lorentz-invariant choice $b_2=\cdots=b_J=0$ and, for example, any sufficiently small $b_2>0$ are response-distinct stable completions with the same cutoff and structural symmetries.

*Proof.* Translation invariance diagonalizes the operator in Fourier space. Rotation and parity invariance make its spatial polynomial symbol a real polynomial in $|k|^2$; the normalized local time-kinetic premise contributes exactly $-\omega^2$, and the no-mixed-derivative premise excludes momentum-dependent coefficients of that term. Registering the constant and quadratic terms leaves exactly (Q.6.2a.1), and nonnegativity is the modewise stability condition. Expanding the positive square root of (Q.6.2a.1) and differentiating with respect to $|k|$ gives (Q.6.2a.2). The two displayed coefficient choices prove nonuniqueness. ∎

**Resolution TV-Q-12-N1 (Metadata).** Exact domain: real translation-, rotation-, parity- and time-reversal-invariant scalar quadratic operators with a canonically normalized local time-kinetic term, no mixed time--space derivatives and spatial order at most $2J$, on a fixed retained momentum window. Premises: registered $(\delta,c,\mu,J)$ and no microscopic coefficient map. Equivalence: equality of the Fourier response on that window. Budget: every stable real coefficient vector and every retained momentum. Verifier: polynomial-symbol classification, positivity and the group-velocity expansion. Falsifier: a symmetry or cutoff identity that forces the same $(b_2,\ldots,b_J)$ in the zero and nonzero completions. Provenance class: source-internal effective-operator classification and countermodel. Downstream consumers: Predictions Q.6.1--Q.6.2, Theorem Q.6.2b and `TV-Q-12`. The theorem classifies the finite rotational polynomial propagation class and leaves its MDR coefficients free. Theorem Q.6.2b separately proves that a smooth $\Gamma^+$-invariant scalar symbol has no anisotropic Taylor component below degree six. An astrophysical bound additionally specifies the scalar-to-polarization observable map, nuisance model and uncertainty record.

**Theorem Q.6.2b (Rank-Six Anisotropy Floor for Shell-Symmetric Symbols).** Fix $J\ge1$. Let $\ell$ be a real polynomial of order at most $2J$ on the retained momentum window in $\mathbb R^4$ that is invariant under the group $\Gamma^{+}$ of Proposition C.6h; this polynomial premise holds for a registered Taylor truncation of the symbol of a real translation-invariant operator on the $D_4$ lattice whose coupling function is constant on $\Gamma^{+}$-orbits, in particular for equal-weight root-shell couplings, with finite support, or sufficient absolute moment bounds, and a controlled truncation remainder on the registered window as in Theorem Q.6.2a. Then every homogeneous component of $\ell$ of degree at most $5$ is a real multiple of a power of $|k|^2$, and the degree-$6$ component lies in the span of $|k|^6$ and $T_6(k)$ of (C.6h.1). In the normalization of (Q.6.2a.1), in which the degree-$2j$ stratum carries the prefactor $\delta^{2j-2}$ relative to the quadratic term, no coefficient choice within this class produces a rotation-noninvariant term at relative order $(\delta|k|)^0$ or $(\delta|k|)^2$: the lowest-order rotation-noninvariant contribution enters at relative order $(\delta|k|)^4$, is proportional to the single anisotropic pattern of $T_6$, and its two displayed equal-weight shell moments are the Lemma C.6f defects $-1/d_0$ and $+1/M$. Along every fixed direction $\hat k$ the restriction $\ell(|k|\hat k)$ is a polynomial in $|k|^2$ whose coefficients through $|k|^4$ are direction independent, with direction dependence first possible in the $|k|^6$ coefficient. On the joint branch of Prediction Q.6.1 extended by the registered premise that the retained propagation symbol is $\Gamma^{+}$-invariant, rotation-noninvariant dispersion terms at relative orders $(\delta|k|)^0$ and $(\delta|k|)^2$ are therefore absent, the first admissible one is the $T_6$ stratum at relative order $(\delta|k|)^4$. A propagation experiment tests this exclusion after its Lorentzian, polarization, and observable maps identify the measured coefficient with this scalar symbol. This supplies the anisotropic sector of the microscopic coefficient map of Resolution TV-Q-12-N1 on this branch: below rank six the anisotropic coefficients are not free parameters but vanish identically, while the isotropic coefficients remain nonentailed exactly as in Theorem Q.6.2a.

*Proof.* For a finite-support real coupling function $c$ constant on $\Gamma^{+}$-orbits of the $D_4$ lattice, the exact trigonometric symbol is $\ell(k)=\sum_xc(x)e^{ik\cdot x}$; the product of the four sign changes lies in $\Gamma^{+}$, so $c$ is even and $\ell(k)=\sum_xc(x)\cos(k\cdot x)$ is real, and for $g\in\Gamma^{+}$ the substitution $x=gy$, which permutes the lattice by Proposition C.6h item 1, gives $\ell(gk)=\sum_yc(gy)\cos\left(gk\cdot gy\right)=\sum_yc(y)\cos(k\cdot y)=\ell(k)$ by orthogonality and orbit constancy. Its registered Taylor truncation inherits this invariance term by term. The action of $\Gamma^{+}$ on polynomials is linear and degree preserving, so every homogeneous component of an invariant polynomial is invariant, and Proposition C.6h items 2 and 3 give the stated component structure through degree $6$. The degree-$2$ and degree-$4$ strata are multiples of $|k|^2$ and $|k|^4$ and hence rotation invariant, so with the (Q.6.2a.1) prefactors the relative orders $(\delta|k|)^0$ and $(\delta|k|)^2$ carry no rotation-noninvariant term, and the degree-$6$ stratum at relative order $(\delta|k|)^4$ is the first that can, its rotation-noninvariant direction being spanned by $T_6$ modulo $|k|^6$; its equal-weight shell moments are the Lemma C.6f defects because $\frac1MT_6$ is the full contraction of the equal-weight sixth-moment tensor, by Proposition C.6h. Evenness makes the ray restriction $\ell(|k|\hat k)$ a polynomial in $|k|^2$; its coefficients through $|k|^4$ come from strata that are multiples of powers of $|k|^2$ and are direction independent, while the $|k|^6$ coefficient acquires the direction-dependent contribution proportional to $T_6(\hat k)$, and $T_6$ is nonconstant on the unit sphere by the values $12$ and $18$ recorded in Proposition C.6h. On the extended joint branch the retained propagation symbol lies in the classified class, so the exclusion at relative orders $(\delta|k|)^0$ and $(\delta|k|)^2$ and the identification of the first admissible pattern follow from the classification, and an observation contradicting the exclusion contradicts membership in the class for every coefficient assignment, falsifying the branch. The classification constrains no isotropic coefficient, so the Theorem Q.6.2a nonentailment statement for them is unchanged, while the anisotropic entries of the Resolution TV-Q-12-N1 coefficient map are supplied identically zero below rank six on this branch. ∎

### Q.6.5 Summary

The branch fixes a spatial resolution of a little more than two Planck lengths. The same numerical time scale follows under the propagation calibration; capacity and geometry have their separately stated branch inputs.

#### Technical dependency ledger

| Quantity | Symbol | Value | Origin |
|:---------|:-------|:------|:-------|
| Spatial discretization | $\delta/L_P$ | $\sqrt{8\ln2}\approx2.355$ on the residual-budget, throughput-saturated, ideal-packing branch | Eq. Q.18 together with Eq. Q.10 and Lemmas Q.2.2–Q.2.3 |
| Temporal discretization | $\tau_{min}/t_P$ | $\sqrt{8\ln2}\approx2.355$ only after the serialized-frontier calibration | Proposition Q.6.1 plus Eq. Q.18 |
| Information budget | $C_{\max}^*$ | $2\ln2$ on the residual-capacity branch | Eq. Q.10 and its Appendix-E residual-budget premise |
| Hilbert space dimension | $d_0$ | $8$ on the minimal Hilbert-carrier branch | Theorem 23; Theorem Z.2 |
| Structural binary reference | $\varepsilon_0$ | $\ln2$ on the registered binary-support branch | Definition 28; Definition J.1; Theorem J.1; physical reset cost is separately ensemble-dependent under Theorem 31 |
| Independence factor | $\chi^*$ | $1$ on the throughput-saturated channel-independence branch | Lemma Q.2.2 |
| Geometric inefficiency | $\eta^*$ | $1$ on the ideal-packing branch | Lemma Q.2.3 |

The conditional dependency chain is
$$
\boxed{
\begin{array}{c}
K_0=3\xrightarrow{\text{Hilbert-carrier branch}}d_0=8,\\
\text{residual-capacity branch}\xrightarrow{\text{Eq. Q.10}}C_{\max}^*=2\ln2,\\
\text{throughput saturation}\xrightarrow{\text{Lemma Q.2.2}}\chi^*=1,\\
\text{ideal packing}\xrightarrow{\text{Lemma Q.2.3}}\eta^*=1
\end{array}
}
\xrightarrow{\text{Q.3}}
\frac{\delta}{L_P}=\sqrt{8\ln2}.
$$
The structural reference $\varepsilon_0=\ln2$ is compatible with the residual-capacity value but does not, by itself, imply that capacity assignment.

## Q.7 The Time-Quantum-to-Hubble Ratio

On the serialized-frontier calibration branch of Section Q.6, the registered edge-update duration satisfies $\tau_{\min}=\sqrt{8\ln2}\,t_P$. Adjoining the de Sitter definition of $t_H$ then gives the following conditional time-scale ratio. Off that propagation/clock branch, Appendix Q fixes only the spatial ratio and no microscopic temporal scale follows.

### Q.7.1 The Hubble Time on the de Sitter Branch

**Definition Q.7.1 (de Sitter Hubble Time).** On the cosmological branch with cosmological constant $\Lambda>0$, the de Sitter Hubble time is
$$
t_H\;:=\;\frac{1}{H_\Lambda}\;=\;\frac{1}{c}\sqrt{\frac{3}{\Lambda}},
$$
where $H_\Lambda=c\sqrt{\Lambda/3}$ is the de Sitter Hubble rate (Appendix E, Theorem E.9.3; Appendix H, Equation H.2).

### Q.7.2 The Closed-Form Ratio

**Theorem Q.7.1 (Time-Quantum-to-Hubble Identity).** On the full joint branch of Equation Q.18, Proposition Q.6.1, Theorem Q.6.1, and Definition Q.7.1, the ratio of the serialized-frontier update time to the de Sitter Hubble time is
$$
\boxed{\;\frac{\tau_{\min}}{t_H}\;=\;\sqrt{8\ln 2}\,\sqrt{\frac{\Lambda L_P^2}{3}}\;.}
$$

*Proof.* By Theorem Q.6.1, $\tau_{\min}=\sqrt{8\ln 2}\,t_P$. By the Planck unit identity $L_P/t_P=c$,
$$
\tau_{\min}\;=\;\sqrt{8\ln 2}\cdot\frac{L_P}{c}.
$$
By Definition Q.7.1, $t_H=\sqrt{3/\Lambda}/c$. Therefore
$$
\frac{\tau_{\min}}{t_H}\;=\;\sqrt{8\ln 2}\cdot\frac{L_P/c}{\sqrt{3/\Lambda}/c}\;=\;\sqrt{8\ln 2}\cdot L_P\sqrt{\frac{\Lambda}{3}}\;=\;\sqrt{8\ln 2}\,\sqrt{\frac{\Lambda L_P^2}{3}}.
$$
∎

**Corollary Q.7.2 (Conditional Reciprocal Hubble-to-Update Timescale Ratio).** On the same joint branch, the reciprocal timescale ratio is
$$
\frac{t_H}{\tau_{\min}}\;=\;\frac{1}{\sqrt{8\ln 2}}\,\sqrt{\frac{3}{\Lambda L_P^2}}.
$$

*Proof.* Taking the reciprocal of Theorem Q.7.1 gives the formula. Interpreting it as an executed cycle count additionally requires continuous attained-rate operation for the entire Hubble interval. ∎

**Proposition Q.7.2a (Executed-Count Schedule Nonentailment).** Fix a de Sitter interval of duration $t_H\ge\tau>0$ and an attained cycle duration $\tau$, and put $m=\lfloor t_H/\tau\rfloor\ge1$. The $m$ nonoverlapping slots
$$
[j\tau,(j+1)\tau),
\qquad j=0,\ldots,m-1,
\tag{Q.7.2a.1}
$$
all share the same cosmology and clock. For every integer $n\in\{0,\ldots,m\}$, executing the cycle on any $n$ of these slots gives actual count $N_{\mathrm{exec}}=n$. Therefore $(\Lambda,t_H,\tau)$ and the ratio $t_H/\tau$ do not determine an executed count. A continuous-duty schedule fixed in advance selects $m$ completed cycles; even then the real ratio $t_H/\tau$ is itself an integer count only when the endpoint divides exactly.

*Proof.* Every subset of $n$ slots in (Q.7.2a.1) is a valid nonoverlapping schedule, so all integers from $0$ through $m$ occur while the three registered scale entries remain fixed. The continuous-duty assertion follows from the definition of the floor. ∎

**Resolution TV-Q-13-N1 (Metadata).** Exact domain: finite-duration de Sitter histories with a fixed attained cycle time, $t_H\ge\tau>0$, and arbitrary nonoverlapping execution schedules. Premises: no duty-cycle or scheduling certificate. Equivalence: equality of $(\Lambda,t_H,\tau)$ while schedule records remain response-visible. Budget: all $2^m$ slot subsets. Verifier: interval disjointness and exact subset cardinality. Falsifier: a function of $(\Lambda,t_H,\tau)$ alone that equals the actual count for every schedule. Provenance class: source-internal finite scheduling countermodel. Downstream consumers: Theorem Q.7.1, Corollary Q.7.2 and `TV-Q-13`. The schedule family gives `nonentailment` of an executed count from the microscopic/Hubble timescale ratio. An independently certified cosmological branch, continuous attained clock and forward-locked duty schedule remain required.

### Q.7.3 Numerical Evaluation

Using the observed central value $\Lambda L_P^2=2.86599\times 10^{-122}$ from Equation V.5 (Appendix V), Theorem Q.7.1 gives
$$
\frac{\tau_{\min}}{t_H}\;=\;\sqrt{8\ln 2}\,\sqrt{\frac{2.86599\times 10^{-122}}{3}}\;\approx\;2.302\times 10^{-61}.
$$
The reciprocal conditional timescale ratio is
$$
\frac{t_H}{\tau_{\min}}\;\approx\;4.345\times 10^{60}.
$$

### Q.7.4 Status of the Identity

**Remark Q.7.1 (Status of Theorem Q.7.1).** Theorem Q.7.1 is algebraic only after three independent branch packages are accepted: the spatial ratio of Equation Q.18, the serialized-frontier clock calibration of Proposition Q.6.1, and the de Sitter definition of $t_H$. It is not a consequence of $K_0$, $\varepsilon_0$, $d_0$, and $\Lambda L_P^2$ alone, and it does not independently close either the temporal or cosmological branch.

**Remark Q.7.2 (Cosmological--Microscopic Bridge Scope).** Theorem Q.7.1 packages the conditional serialized-frontier update scale and de Sitter Hubble scale. Its numerical ratio also depends on the residual-budget, ideal-packing, channel-independence, and clock/frontier calibration premises; it is not determined by $K_0$, $\varepsilon_0$, and $\Lambda L_P^2$ alone.

