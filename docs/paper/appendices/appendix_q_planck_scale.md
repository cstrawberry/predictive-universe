# Appendix Q: Derivation of the Planck-MPU Scale Ratio

## Q.0 Conditional Action-Ledger Calibration

This section separates a dimensionless predictive ledger from a mechanical action. Their proportionality scale $\kappa_A$ is independent; identifying $\kappa_A=\hbar$ requires calibration against quantum phase data.

### Q.0.1 The Puzzle of Least Action

The Principle of Least Action stands as one of the most powerful organizing principles in physics. From it, classical mechanics, field theory, and the path integral formulation of quantum mechanics can be derived. Yet the standard presentation offers no explanation for *why* nature should extremize this particular quantity—the integral of the Lagrangian over time.

Within the Predictive Universe framework, this puzzle admits a resolution: the Principle of Least Action is not fundamental but derived. It is the continuum Euler–Lagrange condition expressing **stationarity of the total SPAP entropy cost** accumulated along a history, subject to fixed boundary data (and, when relevant, fixed holonomy sector).

### Q.0.2 The Discrete Predictive Cost Functional

The MPU network executes cyclical predictive operations, each cycle implementing the Fundamental Predictive Loop (Definition 4):

$$\text{Predict} \to \text{Verify} \to \text{Update}$$

Each non-trivial cycle incurs the structural SPAP entropy cost $\varepsilon_0=\ln 2$ nats and physical implementation cost $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)\quad\text{on a registered reset branch}$ (Theorem 31, Appendix J). This cost arises from the logically irreversible 2-to-1 state merge required by self-referential prediction (Lemma J.1), and by Landauer's principle, necessarily manifests as thermodynamic entropy production.

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

**Theorem Q.0.1b (Predictive Large-Deviation Variational Principle).** On a predictive large-deviation branch, the dominant rare transition from a closed retained basin $A$ to a closed retained basin $B$ over the time window $[0,T]$ is governed by the quasipotential
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

**Corollary Q.0.1c (Instanton Ledger Consolidation).** Any branch exponent already expressed in PU as a stationary or minimizing action is an instance of Theorem Q.0.1b once its retained finite dynamics satisfies Definition Q.0.1a. In particular, the Coleman-type vacuum-decay exponent of Appendix U and the electroweak sphaleron/update exponent of Appendix Y are projections of the same action-entropy large-deviation ledger on their respective retained branches.

*Proof.* Appendix U and Appendix Y express their suppression exponents as finite action or action-derived complexity costs on specified retained branches. If the branch dynamics satisfies the path-space large-deviation hypothesis of Definition Q.0.1a, Theorem Q.0.1b says that the exponential suppression is the infimum of the same dimensionless action over paths with the corresponding boundary conditions. Hence those exponents are branch projections of the common variational ledger. ∎

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
### Q.0.5 Conditional Stationarity Transfer

**Definition Q.0.2a (Holonomy Sector).** A *holonomy sector* is an equivalence class of paths sharing the same topological winding number $k \in \mathbb{Z}$ (Theorem Q.0.4). Variations within a sector preserve $k$.

**Corollary Q.0.3 (Conditional Stationarity Transfer).** On a fixed calibrated sector with constant $\kappa_A>0$ and $\mathcal S=\kappa_A\mathcal L$,
$$
\delta\mathcal S=0
\quad\Longleftrightarrow\quad
\delta\mathcal L=0.
$$
This equivalence is a scalar-rescaling identity; it neither selects $\kappa_A$ nor proves the existence of a continuum action. ∎

**Physical Interpretation:** The action principle is the continuum Euler–Lagrange expression of stationarity of the total SPAP entropy cost under admissible variations. Whether a stationary history is a minimum depends on the usual second-variation conditions.

This resolves the foundational puzzle: the action principle is not an unexplained postulate but a consequence of the Principle of Compression Efficiency operating through the irreducible costs of predictive processing.

### Q.0.6 Connection to the Path Integral

The Action-Entropy Identity provides an information-theoretic interpretation of the Feynman path integral.

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
where $w_\phi\ge0$ are branch weights independent of $z$. Then $Z_\Lambda(z)$ is an entire function of $z$, and its two distinguished finite-cutoff evaluations are
$$
Z_\Lambda(1)=\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{-E[\phi]},
$$
the finite Gibbs/Laplace weight of the SPAP entropy functional, and
$$
Z_\Lambda(-i)=\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{iE[\phi]}
=
\sum_{\phi\in\mathcal H_\Lambda}w_\phi e^{i\mathcal S[\phi]/\hbar},
$$
the finite path-amplitude weight of Proposition Q.0.2. For a countable history set $\mathcal H$, the same analytic statement holds on any domain on which
$$
Z(z)=\sum_{\phi\in\mathcal H}w_\phi e^{-zE[\phi]}
$$
converges normally on compact subsets. In particular, the Gibbs value at $z=1$ is defined whenever $1$ lies in such a domain, and the phase value at $z=-i$ is defined either when $-i$ lies in such a domain or as the limit of finite-cutoff oscillatory amplitudes whenever that limit exists.

*Proof.* For finite $\mathcal H_\Lambda$, each term $w_\phi e^{-zE[\phi]}$ is entire in $z$, and a finite sum of entire functions is entire. Substituting $z=1$ gives the Gibbs/Laplace weight. Substituting $z=-i$ gives $e^{iE[\phi]}$, and by Corollary Q.0.1,
$$
E[\phi]=\mathcal S[\phi]/\hbar on the calibrated branch,
$$
giving the path-amplitude form. For countable $\mathcal H$, normal convergence on compact subsets gives analyticity by the Weierstrass theorem on the stated domain. Boundary or off-domain phase evaluations are not automatic; they are exactly the finite-cutoff oscillatory limits stated in the hypothesis. ∎

**Corollary Q.0.2d (Single Entropy-Transform Ledger).** Under Proposition Q.0.2c, the finite Gibbs/Laplace weight and the finite path-amplitude weight are two evaluations of the same finite entropy transform:
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
Thus, at finite cutoff, the statistical partition weight and the path-amplitude weight are not distinct primitive objects; they are distinct evaluations of one SPAP entropy ledger. For a countable history set, this identification holds only on domains of normal convergence or as the explicitly stated finite-cutoff oscillatory limit.

*Proof.* Proposition Q.0.2c defines the finite transform $Z_\Lambda(z)$ and proves it is entire. Evaluation at $z=1$ gives the Gibbs/Laplace weight. Evaluation at $z=-i$ gives $e^{iE[\phi]}$, and Corollary Q.0.1 gives $E[\phi]=\mathcal S[\phi]/\hbar$. The countable case inherits exactly the normal-convergence and finite-cutoff-limit qualifications already stated in Proposition Q.0.2c. ∎

**Corollary Q.0.4 (Conditional Ledger Phase Matching).** Under Proposition Q.0.2 and the calibration $\kappa_A=\hbar$, relative phases are differences of the certified dimensionless ledger modulo $2\pi$. Without that bridge, equal structural or thermodynamic costs do not imply constructive quantum interference. ∎

### Q.0.6.1 Landauer Character Duality

**Convention Q.0.6a.0 (Character Status).** The character $N\mapsto e^{iN\ln2}$ is a mathematically selected character of the update-count group. It is a physical phase only after the independent action and quantum-phase calibrations above. Density of this character in $U(1)$ does not derive a gauge symmetry or select a gauge dynamics.

**Definition Q.0.6a.1 (Update-Count Group Completion).** Let $\mathbb N$ be the monoid of irreversible SPAP update counts under addition. Its Grothendieck group completion is $\mathbb Z$. A character of $\mathbb Z$ is a homomorphism
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

**Theorem Q.0.6a.3 (Path Amplitudes as Fourier Transforms of Update Histories).** Let $\mathcal H_\Lambda$ be a finite cutoff set of histories, with update count $N[\gamma]\in\mathbb Z$ and weights $w_\gamma\ge0$. Define the finite update-count measure
$$
\mu_\Lambda
=
\sum_{\gamma\in\mathcal H_\Lambda}
w_\gamma\,\delta_{N[\gamma]}.
\tag{Q.0.6c}
$$
Then the baseline Landauer path amplitude is the Fourier transform of $\mu_\Lambda$ evaluated at the Landauer character:
$$
\widehat\mu_\Lambda(\chi_L)
=
\sum_{\gamma\in\mathcal H_\Lambda}
w_\gamma\,\chi_L(N[\gamma])
=
\sum_{\gamma\in\mathcal H_\Lambda}
w_\gamma\,e^{iN[\gamma]\ln2}.
\tag{Q.0.6d}
$$
If a history has overhead $\Delta[\gamma]$ so that
$$
\mathcal S[\gamma]/\hbar=N[\gamma]\ln2+\Delta[\gamma],
$$
then the full finite path amplitude is the twisted Fourier transform
$$
\sum_{\gamma\in\mathcal H_\Lambda}
w_\gamma e^{i\Delta[\gamma]}\chi_L(N[\gamma]).
\tag{Q.0.6e}
$$

*Proof.* The Fourier transform of a finite measure on $\mathbb Z$ at a character $\chi$ is
$$
\widehat\mu(\chi)=\sum_N\mu(N)\chi(N).
$$
Substituting (Q.0.6c) and $\chi=\chi_L$ gives (Q.0.6d). The overhead formula follows by multiplying each history weight by the unit-modulus phase $e^{i\Delta[\gamma]}$ and using the Action-Entropy Identity. ∎

**Corollary Q.0.6a.4 (Finite Interference Orthogonality).** On the cyclic quotient $\mathbb Z/q\mathbb Z$, the characters
$$
\chi_j(n)=e^{2\pi ijn/q},
\qquad j=0,\dots,q-1,
$$
satisfy
$$
\frac1q\sum_{n=0}^{q-1}
\chi_j(n)\overline{\chi_k(n)}
=
\delta_{jk}.
\tag{Q.0.6f}
$$
Thus finite interference selection is character orthogonality of update-count sectors.

*Proof.* If $j=k$, every summand equals $1$, so the average is $1$. If $j\ne k$, the sum is a finite geometric series with ratio $e^{2\pi i(j-k)/q}\ne1$, hence
$$
\sum_{n=0}^{q-1}e^{2\pi i(j-k)n/q}=0.
$$
This proves (Q.0.6f). ∎

## Q.0.7 Selected Update-Count Character and Its $U(1)$ Closure

This section establishes a precise connection between the discrete SPAP entropy structure and the emergence of continuous U(1) gauge symmetry. The key insight is that the Landauer constant $\varepsilon_0=\ln2$ generates a dense subgroup of U(1), providing a microscopic origin for continuous gauge phases from discrete computational operations.

---

### Q.0.7.1 The Landauer Angle

Define the *Landauer angle* and its reciprocal by:
$$\alpha_L := \frac{\ln 2}{2\pi} \approx 0.110317800$$
$$\beta_L := \frac{2\pi}{\ln 2} = \frac{1}{\alpha_L} \approx 9.064720284$$

The quantity $\alpha_L$ measures the SPAP minimum entropy cost $\varepsilon_{\min} = \ln 2$ (Theorem 31) in units of one complete phase cycle $2\pi$. The reciprocal $\beta_L$ gives the number of SPAP-minimum cycles per full $2\pi$ phase revolution (Corollary Q.0.4a).

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

### Q.0.7.3 Exact Interference Selection at SPAP Minimum

**Corollary Q.0.7c (Exact Interference Selection at SPAP Minimum).** *Under Lemma Q.0.7b, the constructive-interference condition (derived in Section Q.0.8.4, Corollary Q.0.6a):*
$$(N[\phi_1] - N[\phi_2]) \cdot \ln 2 = 2\pi k \qquad (k \in \mathbb{Z})$$

*implies:*
$$N[\phi_1] = N[\phi_2] \quad \text{and} \quad k = 0$$

*Proof.* Dividing by $2\pi$:
$$(N[\phi_1] - N[\phi_2]) \alpha_L = k$$

If $N[\phi_1] - N[\phi_2] \neq 0$, then $\alpha_L = k/(N[\phi_1] - N[\phi_2]) \in \mathbb{Q}$, contradicting Lemma Q.0.7b. Hence $N[\phi_1] = N[\phi_2]$, and then $k = 0$. $\square$

**Physical Interpretation.** At the SPAP minimum, two paths with different cycle counts *cannot* interfere exactly constructively. Exact phase matching requires identical cycle numbers. This is the discrete-level selection rule that underlies the emergence of continuous interference in the macroscopic limit.

---

### Q.0.7.4 Dense U(1) Emergence

**Theorem Q.0.7d (Dense U(1) Emergence from the Landauer Step).** *Define the SPAP-minimum phase generator:*
$$g_L := e^{i\ln 2} \in U(1)$$

*The subgroup generated by integer powers of $g_L$:*
$$G_L := \{e^{iN\ln 2} : N \in \mathbb{Z}\} = \{g_L^N : N \in \mathbb{Z}\}$$

*is dense in $U(1)$. Equivalently, the sequence $\{N\alpha_L \bmod 1\}_{N \in \mathbb{Z}}$ is dense (and equidistributed) in $[0,1)$.*

*Proof.* By Lemma Q.0.7b, $\alpha_L$ is irrational. The one-dimensional case of Kronecker's approximation theorem [Kronecker 1884] states that for irrational $\alpha$, the set $\{N\alpha \bmod 1 : N \in \mathbb{Z}\}$ is dense in $\mathbb{R}/\mathbb{Z}$.

Applying this to $\alpha = \alpha_L$ implies $\{e^{2\pi i N\alpha_L}\}_{N \in \mathbb{Z}} = \{e^{iN\ln 2}\}_{N \in \mathbb{Z}}$ is dense in $U(1)$.

Moreover, Weyl's equidistribution theorem [Weyl 1916] strengthens this: for irrational $\alpha$, the sequence $\{N\alpha \bmod 1\}_{N=1}^{M}$ becomes uniformly distributed as $M \to \infty$:
$$\lim_{M \to \infty} \frac{1}{M} \#\{1 \leq N \leq M : N\alpha \bmod 1 \in [a,b)\} = b - a$$

for any $0 \leq a < b \leq 1$. $\square$

**Corollary Q.0.7d′ (Exact Emergent U(1) as a Closure).** *The topological closure of the SPAP-minimum phase subgroup equals the full continuous group:*
$$\overline{G_L} = U(1)$$

*Equivalently, for every target phase $e^{i\theta} \in U(1)$ and every tolerance $\nu > 0$, there exists $N \in \mathbb{Z}$ such that:*
$$|e^{iN\ln 2} - e^{i\theta}| < \nu$$

*Proof.* The closure of a dense subset equals the ambient space. Apply Theorem Q.0.7d. $\square$

**Theorem Q.0.7d2 (Landauer-Noether Closure Principle).** Let $Y$ be a topological space of finite-resolution source configurations with a continuous left action of $U(1)$,
$$
U(1)\times Y\to Y,
\qquad
(z,y)\mapsto z\cdot y.
$$
Let $Z:Y\to\mathbb C$ be a continuous predictive response functional. If $Z$ is invariant under the SPAP/Landauer subgroup
$$
G_L=\{e^{iN\ln2}:N\in\mathbb Z\},
$$
meaning
$$
Z(g\cdot y)=Z(y)
\qquad
\text{for all }g\in G_L,\ y\in Y,
$$
then $Z$ is invariant under the full closure $U(1)$:
$$
Z(z\cdot y)=Z(y)
\qquad
\text{for all }z\in U(1),\ y\in Y.
$$

More generally, for a finite operational cover with $n$ cells, if $Y_n$ carries a continuous $U(1)^n$ action and $Z_n:Y_n\to\mathbb C$ is continuous and invariant under
$$
G_L^n
=
\{(e^{iN_1\ln2},\dots,e^{iN_n\ln2}):N_j\in\mathbb Z\},
$$
then $Z_n$ is invariant under $U(1)^n$.

Thus exact effective continuous phase redundancy is the finite-resolution closure of discrete irreversible SPAP/Landauer phase updates. The substrate-level operation count remains integer-valued; the continuous gauge group is the operational closure seen by continuous finite-resolution response functionals.

This closure statement is a topological finite-resolution closure of response functionals. It does not by itself construct a nontrivial groupoid $2$-cocycle, a central extension, an integral curvature class, or a charge lattice; any use of such data downstream must enter through a separate finite branch certificate.

*Proof.* Fix $z\in U(1)$ and $y\in Y$. By Corollary Q.0.7d′, $G_L$ is dense in $U(1)$, so there exists a sequence $g_m\in G_L$ with
$$
g_m\to z.
$$
Continuity of the group action gives
$$
g_m\cdot y\to z\cdot y.
$$
Continuity of $Z$ then gives
$$
Z(z\cdot y)
=
\lim_{m\to\infty}Z(g_m\cdot y).
$$
By $G_L$-invariance, each term satisfies $Z(g_m\cdot y)=Z(y)$, hence
$$
Z(z\cdot y)=Z(y).
$$
Since $z$ and $y$ were arbitrary, $Z$ is $U(1)$-invariant.

For the finite-cover statement, Corollary Q.0.7d′ applied in each coordinate implies that $G_L^n$ is dense in $U(1)^n$ in the product topology. Repeating the same continuity argument with $g_m\in G_L^n$ converging to any $z\in U(1)^n$ proves $U(1)^n$-invariance. ∎

**Corollary Q.0.7d3 (Noether Current from Landauer Closure).** On a finite-resolution effective branch whose leading continuum limit has the minimally coupled matter-gauge form of Theorem G.6b, invariance under independent SPAP/Landauer phase updates in each cell implies invariance under the local $U(1)$ closure. In the continuum limit this gives the infinitesimal transformation
$$
\phi\mapsto e^{iq\alpha(x)}\phi,
\qquad
A_\mu\mapsto A_\mu-\partial_\mu\alpha,
$$
and the on-shell Noether identity
$$
\nabla_\mu J^\mu=0,
\qquad
J^\mu=iq\bigl(\phi^*D^\mu\phi-(D^\mu\phi)^*\phi\bigr).
$$
Thus the conserved $U(1)$ current of Appendix G is the Noether current of the Landauer-closed phase redundancy.

*Proof.* On a finite cover with $n$ cells, Theorem Q.0.7d2 upgrades invariance under $G_L^n$ to invariance under $U(1)^n$. The local continuum branch is obtained by refining the cover and retaining continuous test functions $\alpha(x)$ as the limit of cellwise phase parameters. Since the effective action is differentiable on the regular branch, invariance under the one-parameter subgroup generated by $\alpha$ gives
$$
\delta_\alpha S=0.
$$
For the minimally coupled continuum action of Theorem G.6b, the explicit variational calculation gives
$$
0
=
-\int d^Dx\,\sqrt{|g|}\,J^\mu\partial_\mu\alpha
=
\int d^Dx\,\sqrt{|g|}\,(\nabla_\mu J^\mu)\alpha
$$
on the matter-equation solution manifold. Since $\alpha$ is arbitrary, $\nabla_\mu J^\mu=0$. ∎

---

### Q.0.7.5 Entropy-Holonomy Decomposition

**Definition Q.0.7e (Entropy-Holonomy Connection and Overhead Decomposition).** For any discrete history/path $\phi$ composed of SPAP cycles with entropy costs $\{\varepsilon_i\}$, where $\varepsilon_i=\varepsilon_0+\varepsilon_{\mathrm{diss},i}$ and $\varepsilon_0=\ln2$, define its **dimensionless holonomy angle**:
$$\Theta(\phi) := \sum_{i \in \phi} \varepsilon_i$$

The corresponding phase factor is:
$$U(\phi) := e^{i\Theta(\phi)}$$

By the Action–Entropy Identity (Corollary Q.0.1), $\Theta(\phi) = \mathcal{S}(\phi)/\hbar$ for histories in the action ensemble, so $U(\phi) = e^{i\mathcal{S}(\phi)/\hbar}$.

Define the **structural Landauer baseline** $\varepsilon_0 := \ln 2$ (Theorem 31) and the **overhead costs**:
$$\delta\varepsilon_i := \varepsilon_i - \varepsilon_0 \geq 0$$

For a history with cycle number $N(\phi)$, the holonomy decomposes as:
$$\Theta(\phi) = N(\phi) \ln 2 + \Delta(\phi), \qquad \Delta(\phi) := \sum_{i \in \phi} \delta\varepsilon_i \geq 0$$

**Definition Q.0.7e′ (Phase Defect and Overhead Functionals).** For $x \in \mathbb{R}$, write:
$$\|x\| := \inf_{m \in \mathbb{Z}} |x - m|$$

(distance to the nearest integer).

For an integer cycle count $N \geq 1$, define the **minimal phase defect**:
$$\delta_N := \min_{k \in \mathbb{Z}} |N\ln 2 - 2\pi k| = 2\pi \|N\alpha_L\|$$

For a fixed holonomy sector $k \in \mathbb{Z}$, define the **sector overhead**:
$$\Delta_k^* := \min_{N \in \mathbb{Z}} |2\pi k - N\ln 2| = \ln 2 \cdot \|k\beta_L\|$$

*Remark.* The two functionals are dual: $\delta_N$ asks "given $N$ cycles, how close can we get to any holonomy?"; $\Delta_k^*$ asks "given holonomy $k$, what is the minimum overhead?"

---

### Q.0.7.6 Topology–Overhead Principle

**Proposition Q.0.7f (Topology–Overhead Identity).** *Let $\gamma$ be a closed path. For any closed loop $\gamma$ with holonomy index $k \in \mathbb{Z}$ (Theorem Q.0.4):*
$$\oint_\gamma \sum_i \varepsilon_i = 2\pi k$$

*the overhead satisfies the exact constraint:*
$$\Delta[\gamma] = 2\pi k - N[\gamma] \ln 2$$

*and hence $\Delta[\gamma] \geq 0$ forces $N[\gamma] \ln 2 \leq 2\pi k$ (for $k > 0$).*

*Proof.* Substitute Definition Q.0.7e into the holonomy quantization statement:
$$2\pi k = \oint_\gamma \sum_i \varepsilon_i = N[\gamma] \ln 2 + \Delta[\gamma]$$

Rearranging gives the result. $\square$

**Corollary Q.0.7g (Strict Overhead for Nontrivial Holonomy).** *If $k \neq 0$, then $\Delta[\gamma] > 0$. Equivalently: nontrivial holonomy forces at least one cycle with $\varepsilon_i > \ln 2$.*

*Proof.* If $\Delta[\gamma] = 0$, Proposition Q.0.7f gives $N[\gamma] \ln 2 = 2\pi k$, i.e., $\alpha_L = k/N[\gamma] \in \mathbb{Q}$, contradicting Lemma Q.0.7b unless $k = 0$. $\square$

**Physical Interpretation.** This is a fundamental result: the irrationality of the Landauer angle implies that *any nontrivial topological winding necessarily requires entropy production above the Landauer minimum*. Topology has an irreducible thermodynamic cost.


**Definition Q.0.7g.1 (Reflexive-Charge Ledger $\mathfrak C_{\mathrm{ref}}$).** For a closed retained predictive loop $\gamma$ satisfying the single-valued amplitude condition of Theorem Q.0.4, define its reflexive charge by
$$
q_{\mathrm{ref}}(\gamma):=k(\gamma)\in\mathbb Z,
$$
where $k$ is the holonomy index in
$$
\Theta(\gamma)=N[\gamma]\ln2+\Delta[\gamma]=2\pi k.
$$
A reflexive-charge ledger is a finite record
$$
\mathfrak C_{\mathrm{ref}}
=
(\Gamma_{\mathrm{loop}},q_{\mathrm{ref}},N,\Delta,\text{single-valuedness domain},\text{deformation class},\text{resolution window},\text{forward lock}),
$$
where $\Gamma_{\mathrm{loop}}$ lists the closed loops under comparison and the deformation class records which variations keep the loop inside the same retained configuration domain.

**Proposition Q.0.7g.2 (Reflexive-Charge Conservation on Fixed Loop Domains).** On a branch carrying $\mathfrak C_{\mathrm{ref}}$, $q_{\mathrm{ref}}$ is invariant under continuous deformations of $\gamma$ inside the recorded loop domain that preserve the single-valuedness condition and do not cross an actualization, singularity, boundary-change, or response-sector change. Changes of $q_{\mathrm{ref}}$ are therefore discrete branch changes in the retained ledger. The entropy-holonomy equation
$$
N[\gamma]\ln2+\Delta[\gamma]=2\pi q_{\mathrm{ref}}(\gamma)
$$
records the thermodynamic price of realizing the loop sector, and Corollary Q.0.7g gives the strict overhead condition for nonzero exact sectors. This is a sector-conservation statement, not a universal local Noether-current law for entropy production unless an additional local continuity equation for the chosen loop family is supplied.

*Proof.* The integer $k$ is the homotopy/holonomy index fixed by Theorem Q.0.4. Continuous deformations that remain inside the same single-valuedness domain cannot change an integer-valued continuous invariant, so $q_{\mathrm{ref}}$ is constant on the recorded deformation class. If the loop crosses a domain boundary, actualization cut, singularity, or response-sector change, the hypotheses defining the invariant have changed and the ledger records a discrete transition to a new sector. The entropy equation is Definition Q.0.7e together with Proposition Q.0.7f. Corollary Q.0.7g supplies the positive-overhead statement for $q_{\mathrm{ref}}\ne0$. ∎

---

### Q.0.7.7 Sector-Minimal Overhead

**Definition Q.0.7h (Sector-Minimal Overhead).** For $k \geq 1$, define the minimal realizable overhead in sector $k$ by:
$$\Delta_k^+ := \inf\{2\pi k - N\ln 2 : N \in \mathbb{Z}_{\geq 0}, \; N\ln 2 \leq 2\pi k\}$$

Equivalently:
$$\Delta_k^+ = 2\pi k - \left\lfloor \frac{2\pi k}{\ln 2} \right\rfloor \ln 2$$

Also define the symmetric mismatch:
$$\Delta_k^{\mathrm{sym}} := \inf_{N \in \mathbb{Z}} |2\pi k - N\ln 2|$$

**Proposition Q.0.7i (Boundedness and Equidistribution of Sector Costs).** *For every $k \geq 1$:*
$$0 < \Delta_k^+ < \ln 2, \qquad 0 < \Delta_k^{\mathrm{sym}} < \frac{\ln 2}{2}$$

*Moreover, letting $\beta_L = 2\pi/\ln 2$ (irrational by Lemma Q.0.7b), one has:*
$$\frac{\Delta_k^+}{\ln 2} = \{\beta_L k\} \in (0,1)$$

*where $\{x\}$ denotes the fractional part. The sequence $\{\Delta_k^+/\ln 2\}_{k \geq 1}$ is equidistributed in $(0,1)$.*

*Proof.* The inequalities follow from the division algorithm and the fact that $\beta_L k \notin \mathbb{Z}$ (Lemma Q.0.7b). Equidistribution follows from Weyl's theorem [Weyl 1916] applied to $\beta_L$. $\square$

---

### Q.0.7.8 Beatty Staircase Structure

**Proposition Q.0.7j (Beatty Staircase and the Two-Step Cycle Spectrum).** *Let $\beta_L = 2\pi/\ln 2 \in (9, 10)$ and define the maximal-minimum-cycle count in sector $k \geq 1$ by:*
$$N_k^* := \left\lfloor \beta_L k \right\rfloor$$

*Then:*

1. *$N_k^*$ is the largest integer $N$ for which a nonnegative overhead can satisfy Proposition Q.0.7f, i.e., $N\ln 2 \leq 2\pi k$.*

2. *The increment satisfies:*
$$N_{k+1}^* - N_k^* \in \{9, 10\} \qquad \text{for all } k \geq 1$$

3. *The asymptotic frequency of "10-steps" is $\beta_L - 9 \approx 0.0647$, and of "9-steps" is $10 - \beta_L \approx 0.9353$.*

*Proof.* (1) is immediate from $N\ln 2 \leq 2\pi k$. For (2), since $9 < \beta_L < 10$:
$$9 < \beta_L(k+1) - \beta_L k < 10$$

and taking floors yields a difference of either 9 or 10. For (3), count how often $\lfloor \beta_L(k+1) \rfloor - \lfloor \beta_L k \rfloor = 10$, which occurs precisely when $\{\beta_L k\} + \{\beta_L\} \geq 1$; by equidistribution of $\{\beta_L k\}$, this has limiting frequency $\{\beta_L\} = \beta_L - 9$. $\square$

---

### Q.0.7.9 Continued Fraction Spectrum

**Theorem Q.0.7k (Continued-Fraction Spectrum of Exceptionally Low Overhead).** *Let*
$$
\alpha_L=\frac{\ln2}{2\pi}=[0;a_1,a_2,a_3,\ldots]
$$
*and let $p_n/q_n$ be its convergents. Then:*

1. *(Best approximation.) For all integers $p,q$ with $1\le q\le q_n$,*
$$
\left|\alpha_L-\frac{p_n}{q_n}\right|
\le
\left|\alpha_L-\frac pq\right|.
$$
*Separately, the second-kind best-approximation property is*
$$
|q_n\alpha_L-p_n|
\le |q\alpha_L-p|
\qquad(1\le q<q_{n+1}).
$$

2. *(Universal error bound.)*
$$
\left|\alpha_L-\frac{p_n}{q_n}\right|<\frac1{q_nq_{n+1}}\le\frac1{q_n^2},
$$
*and therefore*
$$
|2\pi p_n-q_n\ln2|
=2\pi q_n\left|\alpha_L-\frac{p_n}{q_n}\right|
<\frac{2\pi}{q_{n+1}}
\le\frac{2\pi}{q_n}.
$$

3. *(Legendre converse.) If $\gcd(p,q)=1$ and*
$$
\left|\alpha_L-\frac pq\right|<\frac1{2q^2},
$$
*then $p/q$ is a convergent of $\alpha_L$.*

*Proof.* Lemma Q.0.7b makes $\alpha_L$ irrational, so its infinite simple continued fraction and all convergents are defined. The best-approximation theorems of the first and second kind for simple continued fractions (Khinchin 1964; Hardy and Wright 1979) apply to any irrational real number and give the two inequalities in item 1 with the displayed denominator ranges.

Let $\alpha_{n+1}=[a_{n+1};a_{n+2},\ldots]$ be the complete quotient. The convergent recurrences and determinant identity give
$$
\alpha_L
=\frac{p_n\alpha_{n+1}+p_{n-1}}
{q_n\alpha_{n+1}+q_{n-1}},
\qquad
|p_nq_{n-1}-p_{n-1}q_n|=1.
$$
Hence
$$
\left|\alpha_L-\frac{p_n}{q_n}\right|
=\frac1{q_n(q_n\alpha_{n+1}+q_{n-1})}.
$$
Since $\alpha_{n+1}>a_{n+1}$ and $q_{n+1}=a_{n+1}q_n+q_{n-1}$, the denominator is greater than $q_nq_{n+1}$, proving item 2. The holonomy inequalities follow by multiplying by $2\pi q_n$ and using $q_{n+1}\ge q_n$. Item 3 is Legendre's converse theorem (Legendre 1798; Hardy and Wright 1979); its hypotheses are exactly irrationality of $\alpha_L$, reduction of $p/q$, and the displayed strict error bound. $\square$

**Corollary Q.0.7k′ (Legendre Criterion: When Small Overhead Forces a Convergent).** *Let $k,N\ge1$, put $d=\gcd(k,N)$, and write $p=k/d$, $q=N/d$. If*
$$
\left|\alpha_L-\frac{k}{N}\right|<\frac1{2N^2},
$$
*equivalently if*
$$
|N\ln2-2\pi k|<\frac\pi N,
$$
*then the reduced fraction $p/q$ is a convergent of $\alpha_L$.*

*Proof.* Multiplication of the first inequality by $2\pi N>0$ gives the second inequality, and division reverses this calculation. Because $q=N/d\le N$,
$$
\left|\alpha_L-\frac pq\right|
=\left|\alpha_L-\frac kN\right|
<\frac1{2N^2}
\le\frac1{2q^2}.
$$
The fraction $p/q$ is reduced by construction, and $\alpha_L$ is irrational by Lemma Q.0.7b. Legendre's continued-fraction theorem (Legendre 1798; Hardy and Wright 1979, Theorem 184) therefore implies that $p/q$ is a convergent of $\alpha_L$. $\square$

**Theorem Q.0.7k.1 (Landauer Arithmetic Index for Low-Overhead Holonomy).** Define
$$
\mathfrak I_L(N,k):=N\alpha_L-k,
\qquad
\alpha_L=\frac{\ln2}{2\pi},
\qquad
(N,k)\in\mathbb Z_{\ge1}\times\mathbb Z,
$$
and
$$
\delta_L(N,k):=|N\ln2-2\pi k|=2\pi|\mathfrak I_L(N,k)|.
$$
Then:

1. $\mathfrak I_L$ is additive under loop composition:
$$
\mathfrak I_L(N_1+N_2,k_1+k_2)
=
\mathfrak I_L(N_1,k_1)+\mathfrak I_L(N_2,k_2).
$$

2. If $p_n/q_n$ is a continued-fraction convergent of $\alpha_L$, then the pair
$$
(k_n,N_n)=(p_n,q_n)
$$
minimizes $\delta_L(N,k)$ among all integer pairs with $1\le N<q_{n+1}$ in the standard best-approximation-of-the-second-kind sense:
$$
|q_n\alpha_L-p_n|
\le
|N\alpha_L-k|
\qquad
(1\le N<q_{n+1}).
$$

3. Conversely, if $\gcd(k,N)=1$ and
$$
\delta_L(N,k)<\frac{\pi}{N},
$$
then $k/N$ is a continued-fraction convergent of $\alpha_L$.

Therefore every primitive holonomy pair below the Landauer-Legendre gate is arithmetically indexed by the continued-fraction spectrum of $\ln2/(2\pi)$.

*Proof.* Additivity follows directly:
$$
\mathfrak I_L(N_1+N_2,k_1+k_2)
=
(N_1+N_2)\alpha_L-(k_1+k_2)
=
\mathfrak I_L(N_1,k_1)+\mathfrak I_L(N_2,k_2).
$$

For item 2, the continued-fraction best-approximation theorem gives
$$
|q_n\alpha_L-p_n|
\le
|N\alpha_L-k|
$$
for all integers $k,N$ with $1\le N<q_{n+1}$. Multiplying both sides by $2\pi$ gives
$$
\delta_L(q_n,p_n)\le\delta_L(N,k),
$$
so the convergent pair minimizes phase defect on that denominator range.

For item 3, the hypothesis is
$$
2\pi|N\alpha_L-k|<\frac{\pi}{N}.
$$
Dividing by $2\pi N$ gives
$$
\left|\alpha_L-\frac{k}{N}\right|<\frac{1}{2N^2}.
$$
Since $\gcd(k,N)=1$, Legendre's continued-fraction criterion applies, so $k/N$ is a convergent of $\alpha_L$. ∎

*Physical interpretation.* Unusually small phase defect is not accidental—it structurally forces the $(N, k)$ pair to be a convergent. This is a selection rule with number-theoretic teeth.

---

### Q.0.7.10 Explicit Low-Overhead Pairs

**Corollary Q.0.7l (Explicit Low-Mismatch $(k, N)$ Pairs).** *Let $(k_n, N_n) := (p_n, q_n)$. Then:*
$$|2\pi k_n - N_n \ln 2| < \frac{2\pi}{N_n}$$

*Moreover, the sign of $2\pi k_n - N_n\ln 2$ alternates with $n$. In particular, the subsequence with $k_n/N_n > \alpha_L$ satisfies $N_n\ln 2 < 2\pi k_n$ and therefore yields nonnegative physical overhead $\Delta = 2\pi k_n - N_n\ln 2$ in sector $k_n$ (Definition Q.0.7e and Proposition Q.0.7f).*

*The continued fraction expansion is:*
$$\alpha_L = [0; 9, 15, 2, 4, 1, 1, 1, 1, 2, 2, 3, 1, 1, 1, \ldots]$$

*The first convergents are:*

| $n$ | $a_n$ | $p_n$ (= $k_n$) | $q_n$ (= $N_n$) | $p_n/q_n$ | $\|q_n\alpha_L - p_n\|$ |
|:---:|:-----:|:---------------:|:---------------:|:---------:|:-----------------------:|
| 1 | 9 | 1 | 9 | 0.1111111 | 0.00714 |
| 2 | 15 | 15 | 136 | 0.1102941 | 0.00322 |
| 3 | 2 | 31 | 281 | 0.1103203 | 0.000698 |
| 4 | 4 | 139 | 1260 | 0.1103175 | 0.000428 |
| 5 | 1 | 170 | 1541 | 0.1103180 | 0.000270 |
| 6 | 1 | 309 | 2801 | 0.1103177 | 0.000158 |
| 7 | 1 | 479 | 4342 | 0.1103178 | 0.000112 |
| 8 | 1 | 788 | 7143 | 0.1103178 | 0.0000459 |

*Equivalently, the corresponding $\beta_L = 2\pi/\ln 2$ convergents are:*
$$\frac{N}{k} \in \left\{9, \; \frac{136}{15}, \; \frac{281}{31}, \; \frac{1260}{139}, \; \frac{1541}{170}, \; \frac{2801}{309}, \; \frac{4342}{479}, \; \frac{7143}{788}, \ldots \right\}$$

The displayed convergents follow from the standard recurrence
$$
p_{-1}=1,\quad p_0=0,\qquad q_{-1}=0,\quad q_0=1,
$$
$$
p_n=a_n p_{n-1}+p_{n-2},
\qquad
q_n=a_n q_{n-1}+q_{n-2}.
$$
For each row,
$$
2\pi k_n-N_n\ln2
=
2\pi(p_n-q_n\alpha_L),
$$
so the phase mismatch column is fixed directly by the continued-fraction data. The first mismatches are
$$
|2\pi-9\ln2|=0.0449\ldots,
$$
$$
|30\pi-136\ln2|=0.0202\ldots,
$$
$$
|62\pi-281\ln2|=0.00439\ldots,
$$
$$
|278\pi-1260\ln2|=0.00269\ldots.
$$

---

### Q.0.7.11 Universal Crossover Bounds

**Corollary Q.0.7m (Arbitrarily Small Total Overhead is Available).** *For every $\zeta > 0$, there exist integers $N \geq 1$ and $k \geq 1$ such that:*
$$0 < 2\pi k - N\ln 2 < \zeta$$

*Equivalently: there exist nontrivial closed-loop sectors whose required total overhead $\Delta(\gamma)$ is smaller than any prescribed threshold.*

*Proof.* Let $\alpha_L = \ln 2/(2\pi)$ and fix $\zeta > 0$. By Theorem Q.0.7d, the set $\{N\alpha_L \bmod 1 : N \in \mathbb{Z}\}$ is dense in $[0,1)$. Hence there exists $N \geq 1$ with:
$$\{N\alpha_L\} \in \left(1 - \frac{\zeta}{2\pi}, 1\right)$$

where $\{\cdot\}$ denotes fractional part. Set $k := \lceil N\alpha_L \rceil$, so that $0 < k - N\alpha_L < \zeta/(2\pi)$. Multiplying by $2\pi$ yields:
$$0 < 2\pi k - N\ln 2 < \zeta$$

By Definition Q.0.7e, the overhead required to meet $\Theta(\gamma) = 2\pi k$ with $N$ baseline cycles is precisely $\Delta(\gamma) = 2\pi k - N\ln 2$, proving the claim. $\square$

**Corollary Q.0.7m′ (Universal Crossover Bound and the Golden-Ratio Constant).** *For any tolerance $\zeta > 0$, there exist infinitely many integer pairs $(k, N)$ such that:*
$$|2\pi k - N\ln 2| < \zeta$$

*Moreover, Hurwitz's theorem [Hurwitz 1891] guarantees infinitely many $(k, N)$ with:*
$$\left|\alpha_L - \frac{k}{N}\right| < \frac{1}{\sqrt{5} N^2} \quad \Longrightarrow \quad |2\pi k - N\ln 2| < \frac{2\pi}{\sqrt{5} N}$$

*Hence it suffices to have:*
$$N > \frac{2\pi}{\sqrt{5}\,\zeta}$$

*to force $|2\pi k - N\ln 2| < \zeta$ along an infinite subsequence of $(k, N)$.*

*The constant $\sqrt{5}$ is optimal in the sense of Hurwitz, with a sharp extremizing class represented by the golden ratio $\varphi = (1+\sqrt{5})/2$. This is a number-theoretic extremal bound for phase approximation; it does not promote $\varphi$ to a primitive physical proportion constant.*

---

### Q.0.7.12 Three-Gap Structure

**Proposition Q.0.7n (Three-Gap Structure for Finite-$N$ Phase Sets).** *For any $N_{\max} \geq 1$, the finite set of points:*
$$\{e^{in\ln 2} : 0 \leq n < N_{\max}\} = \{e^{2\pi i n\alpha_L} : 0 \leq n < N_{\max}\}$$

*partitions the unit circle into arcs taking at most three distinct lengths (the three-gap / three-distance theorem).*

*Proof.* This is the Steinhaus–Sós–Świerczkowski three-gap theorem [Steinhaus 1957; Sós 1958; Świerczkowski 1958; Marklof & Strömbergsson 2017] applied to the irrational rotation by $\alpha_L$. $\square$

**Physical Interpretation.** At any finite cycle budget, the accessible phases cluster with a characteristic three-gap structure determined by the continued fraction of $\alpha_L$. This provides the microscopic mechanism underlying the transition from discrete to continuous phase distributions.

---

### Q.0.7.13 Finite-Budget Interference Selection

**Corollary Q.0.7o (Finite-Budget Phase-Mismatch Selection Rule).** *Let two SPAP-minimum paths have cycle difference $n:=|N[\phi_1]-N[\phi_2]|$ and define*
$$
\Delta\theta(n)
:=\inf_{k\in\mathbb Z}|n\ln2-2\pi k|
=2\pi\lVert n\alpha_L\rVert.
$$
*For $N_{\max}\ge1$, choose $j$ so that*
$$
q_j\le N_{\max}<q_{j+1}.
$$
*Then*
$$
\min_{1\le n\le N_{\max}}\Delta\theta(n)
=\Delta\theta(q_j),
\qquad
\Delta\theta(q_j)<\frac{2\pi}{q_{j+1}}.
$$
*Moreover, if $k$ is a nearest integer to $n\alpha_L$, $\gcd(k,n)=1$, and $\Delta\theta(n)<\pi/n$, then $k/n$ is a convergent of $\alpha_L$. These are arithmetic statements about phase positions; they do not determine interference amplitudes.*

*Proof.* For every $1\le n<q_{j+1}$ and integer $k$, the second-kind best-approximation statement in Theorem Q.0.7k gives
$$
\lVert q_j\alpha_L\rVert
=|q_j\alpha_L-p_j|
\le|n\alpha_L-k|.
$$
Minimizing the right-hand side over $k\in\mathbb Z$ and multiplying by $2\pi$ proves the finite-budget minimum. The error estimate in Theorem Q.0.7k gives
$$
\Delta\theta(q_j)
=2\pi q_j\left|\alpha_L-\frac{p_j}{q_j}\right|
<\frac{2\pi}{q_{j+1}}.
$$
For the final assertion,
$$
\left|\alpha_L-\frac kn\right|
=\frac{\Delta\theta(n)}{2\pi n}
<\frac1{2n^2}.
$$
The fraction is reduced by hypothesis and $\alpha_L$ is irrational by Lemma Q.0.7b, so Legendre's theorem in Theorem Q.0.7k makes $k/n$ a convergent. No amplitude statement follows from these inequalities. $\square$

---

### Q.0.7.14 Decoherence from Overhead Fluctuations

**Proposition Q.0.7p (Decoherence from Overhead Fluctuations).** *Let a family of processes $\phi$ share the same baseline cycle count $N[\phi] = N$, but have fluctuating overhead $\Delta[\phi]$ with some probability law $P(\Delta)$. Then the ensemble-averaged phase factor factorizes as:*
$$\langle e^{i\mathcal{S}[\phi]/\hbar} \rangle = e^{iN\ln 2} \langle e^{i\Delta[\phi]} \rangle = e^{iN\ln 2} \Phi_\Delta(1)$$

*where $\Phi_\Delta(t) := \langle e^{it\Delta} \rangle$ is the characteristic function of $\Delta$. Hence interference is suppressed by the modulus $|\Phi_\Delta(1)|$.*

In particular, if $\Delta$ is Gaussian with mean $\mu$ and variance $\sigma^2$, then:
$$
\Phi_\Delta(1) = \langle e^{i\Delta} \rangle = e^{i\mu} e^{-\sigma^2/2},
$$
so coherence decays exponentially with the overhead variance.

**Remark Q.0.7p.1: Conditional PCE-Induced Overhead Distribution.** Let a specified PCE state process $X_t$ satisfy the hypotheses of the applicable Appendix D stationary-law theorem, and let the overhead be a measurable observable $\Delta=\Delta(X_t)$. The stationary law of $X_t$ then induces a pushforward law $P_\Delta$. Concentration of $P_\Delta$ near zero requires, in addition, that $\Delta$ vanish on the relevant minimizing set and that the Appendix D concentration estimate control excursions into states with $|\Delta|>\epsilon$. Without these hypotheses, PCE dynamics neither determines a unique overhead law nor implies concentration at zero.

---

### Q.0.7.15 Modular Structure from Continued Fractions

**Remark Q.0.7q: The Modular Itinerary Canonically Induced by $\alpha_L$.** The continued fraction of $\alpha_L$ canonically produces a sequence of matrices in $GL_2(\mathbb{Z})$ via convergents:
$$M_n := \begin{pmatrix} p_n & p_{n-1} \\ q_n & q_{n-1} \end{pmatrix}, \qquad \det(M_n) = (-1)^{n-1}, \qquad M_n(\infty) = \frac{p_n}{q_n}$$

Equivalently, the digit string $[0; 9, 15, 2, 4, 1, 1, 1, 1, 2, 2, 3, \ldots]$ defines a word in the generators $S: \tau \mapsto -1/\tau$ and $T: \tau \mapsto \tau + 1$, giving a canonical coding of a geodesic on the modular surface $\mathcal{H}/PSL_2(\mathbb{Z})$ by continued fractions [Series 1985].

This provides a rigorous $PSL_2(\mathbb{Z})$-structured object determined solely by the Landauer constant $\ln 2$—a second route into modular structure complementing the lattice/VOA path of Appendix P (Appendix P, Section P.13.15.1: $\varepsilon_0=\ln2 \to M = 24 \to \Lambda_{24} \to V^\natural \to \mathbb{M}$).

*Note:* The Klein $j$-invariant is defined on the upper half-plane $\mathcal{H} = \{\tau \in \mathbb{C} : \mathrm{Im}(\tau) > 0\}$; the real axis $\mathbb{R}$ lies on the boundary of $\mathcal{H}$, so expressions like $j(\alpha_L)$ are not defined as holomorphic values. The modular itinerary construction avoids this issue entirely. Further development of this connection is deferred to future work.

---

### Q.0.7.16 Gauge-Holonomy Interface

**Remark Q.0.7r: Gauge-Holonomy Interface.** Appendix G derives a local $U(1)$ redundancy with covariant derivative:
$$D_\mu\Psi = (\partial_\mu + \Omega_\mu + iq A_\mu)\Psi$$

and associated $U(1)$ holonomies $\exp(iq\oint_\gamma A_\mu dx^\mu)$ (Section G.4).

The constant $\ln2$ entering the Landauer phase is the structural SPAP quantum $\varepsilon_0$ of Theorem 31, not the implementation-dependent $\varepsilon_{\mathrm{phys}}$. The dense $U(1)$ closure of $G_L$ depends only on the structural value.

The present results supply a microscopic origin for an effective continuous $U(1)$ phase: the SPAP-minimum generator $g_L = e^{i\ln 2}$ generates the countable cyclic subgroup $G_L$, while Theorem Q.0.7d–Corollary Q.0.7d′ imply $\overline{G_L} = U(1)$. The Landauer-Noether Closure Principle (Theorem Q.0.7d2) strengthens this from a topological statement to an operational symmetry statement: every continuous finite-resolution predictive functional invariant under the discrete SPAP/Landauer phase subgroup is invariant under the full effective $U(1)$ closure. In particular, the holonomy constraint (Theorem Q.0.4) can be expressed as the quantization of the entropy-holonomy $\Theta(\gamma)$, and Corollary Q.0.7g shows that nontrivial holonomy requires overhead above the Landauer baseline.

This realizes the discrete–continuous interface mechanism in the operational sense: the exact finite-cycle structure is the integer-indexed subgroup $G_L$, while its topological closure $U(1)$ is the continuum completion used by the effective gauge description. The physical claim is not that the substrate becomes an actual continuum, but that any finite phase tolerance can be met by sufficiently long Landauer-cycle approximants, so the effective gauge description uses the continuous closure.


**Remark Q.0.7r′ (Overhead 1-Form and U(1) Gauge Connection).** In the emergent gauge description, define a real 1-form $A$ on configuration space by requiring:
$$e^{i\mathcal{S}[\phi]/\hbar} = e^{iN[\phi]\ln 2} e^{iq\int_\gamma A}$$

so that the gauge holonomy phase is exactly the entropy overhead:
$$e^{iq\oint_\gamma A} = e^{i\Delta[\gamma]} = e^{i(2\pi k - N[\gamma]\ln 2)}$$

Under local rephasing $\Psi \mapsto e^{iq\theta(x)}\Psi$, this reproduces the standard gauge transformation $A \mapsto A - \partial\theta$, consistent with Equation (G.4.2) and the lattice transporter $\mathcal{U}_{v,\mu} = e^{iq\,\delta A_\mu(v)}$ in Appendix G.

---

### Q.0.7.17 Non-Abelian Extension

**Theorem Q.0.7s (Non-Abelian Density Mechanism from Near-Identity Generation).** *Let $G$ be a connected semisimple real Lie group with Lie algebra $\mathfrak{g}$. Then there exists an identity neighborhood $\Omega \subset G$ on which $\log = \exp^{-1}$ is defined such that for any $g_1, \ldots, g_m \in \Omega$, if the Lie algebra generated by $\log(g_1), \ldots, \log(g_m)$ equals $\mathfrak{g}$, then the subgroup $\Gamma := \langle g_1, \ldots, g_m \rangle$ is dense in $G$, i.e., $\overline{\Gamma} = G$.*

*Proof.* This is the near-identity density criterion of Breuillard–Gelander [Breuillard & Gelander 2003, Theorem 2.1]. $\square$

**Corollary Q.0.7t (SU(2) Case: Torus Density Plus Non-Normalizer Implies Density).** *Let $G = SU(2)$ and let $T \subset SU(2)$ be a maximal torus. Suppose $\Gamma$ contains an element $t \in T$ whose rotation angle is an irrational multiple of $\pi$ (so $\overline{\langle t\rangle} = T$). If $\Gamma$ also contains an element $g \notin N_{SU(2)}(T)$ (equivalently, $gTg^{-1} \ne T$), then $\overline{\Gamma} = SU(2)$.*

*Consequently, once dense $SU(2)$ holds, the Solovay–Kitaev theorem [Kitaev, Shen & Vyalyi 2002] implies efficient approximation of arbitrary $SU(2)$ elements by words in the generators, matching the universality requirement in Appendix A.*

*Justification.* Since $\overline{\langle t\rangle} = T$, the closure $\overline{\Gamma}$ contains $T$. The only proper closed subgroups of $SU(2)$ containing a maximal torus are $T$ itself and its normalizer $N_{SU(2)}(T) \cong O(2)$. If $g \notin N_{SU(2)}(T)$, the closed subgroup generated by $T$ and $g$ is therefore all of $SU(2)$.

**Remark Q.0.7t.1: Physical Selection of Generators.** The framework selects the generators satisfying the Lie algebra spanning condition through the PCE dynamics. The SPAP involution is a projective order-two operation whose determinant-one amplitude lift is $U_\iota=i\sigma_x\in SU(2)$ (Theorem G.10.2). Its associated infinitesimal axis is represented by the Hermitian Pauli direction $\sigma_x/2$, while the interface dynamics (Section G.8) generate additional noncommuting directions through the QFI mode structure. Once two independent noncommuting Pauli directions are retained, their commutator generates the third:
$$
[\sigma_i,\sigma_j]=2i\epsilon_{ijk}\sigma_k.
$$
Thus the generated Lie algebra spans $\mathfrak{su}(2)$.

---

### Q.0.7.18 Summary

This section has established:

1. **Landauer Irrationality:** $\alpha_L = \ln 2/(2\pi) \notin \mathbb{Q}$ (Lemma Q.0.7b), proven via Gelfond–Schneider transcendence

2. **Dense U(1) Emergence:** $\overline{G_L} = U(1)$ where $G_L = \{e^{iN\ln 2}\}$ (Theorem Q.0.7d)

3. **Exact Interference Selection:** SPAP-minimum paths with different cycle counts cannot interfere exactly (Corollary Q.0.7c)

4. **Topology–Overhead Principle:** Nontrivial holonomy requires $\Delta > 0$, i.e., entropy above Landauer minimum (Corollary Q.0.7g)

5. **Continued-Fraction Spectrum and Arithmetic Index:** Best-approximation pairs $(k,N)$ are convergents of $\alpha_L$, and every holonomy pair below the Landauer-Legendre overhead gate is indexed by this continued-fraction spectrum (Theorem Q.0.7k, Theorem Q.0.7k.1, Corollary Q.0.7l)

6. **Three-Gap Structure:** Finite phase sets partition the circle into at most three arc lengths (Proposition Q.0.7n)

7. **Decoherence Mechanism:** Overhead fluctuations suppress coherence via $|\chi_\Delta(1)|$ (Proposition Q.0.7p)

8. **Gauge-Holonomy Interface:** The discrete $G_L$ structure connects to emergent $U(1)$ gauge holonomies (Remark Q.0.7r)

9. **Landauer-Noether Closure:** Continuous finite-resolution response functionals invariant under $G_L$ are invariant under $U(1)$, and the local closure gives the Noether current of Appendix G (Theorem Q.0.7d2; Corollary Q.0.7d3)

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

For processes forming closed loops in configuration space, single-valuedness of the quantum amplitude imposes quantization conditions.

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

**Remark Q.0.4b: Non-Integer Period and Resolution.** The formal real-valued period $\Delta N_0=2\pi/\ln2\approx9.0647$ is not an admissible integer cycle period. Lemma Q.0.7b establishes that this ratio is irrational via the Gelfond–Schneider argument. This creates a tension between two constraints:

1. *Discrete constraint:* Integer cycle counts $N\in\mathbb Z$ are enforced by the atomic structure of SPAP operations (Proposition Q.0.3).

2. *Interference constraint:* Constructive interference requires $N_\gamma\ln2=2\pi k$ for integer $k$.

Since exact satisfaction of both constraints is impossible for any nontrivial closed path with all cycles at the Landauer minimum, the resolution occurs in two regimes:

**(a) Macroscopic regime ($N \gg 1$):** The $\Gamma$-convergence (Theorem Q.0.1) maps the discrete action to the continuum action. For macroscopic processes with $N \gg 1$, the fractional part of $N\cdot \ln 2/(2\pi)$ samples $[0,1)$ quasi-uniformly by Weyl's equidistribution theorem, and the phases $\{e^{iN\ln 2}\}_{N\in\mathbb{Z}}$ are dense in $U(1)$ (Theorem Q.0.7d). The effective phase distribution becomes continuous.

**(b) Fundamental regime (finite $N$):** Only specific closed paths with integer cycle counts satisfying $|N\ln 2 - 2\pi k| < \delta$ for small tolerance $\delta$ exhibit approximate constructive interference. Corollary Q.0.7o characterizes record-small mismatches as convergent-denominator pairs from the continued fraction of $\alpha_L = \ln 2/(2\pi)$.

---

#### Q.0.8.3 Vacuum Excitation Structure from Leech Geometry

The Leech shell ledger is available only on a branch that independently registers an even unimodular rootless rank-$24$ lattice, or supplies the full discriminant-form and coset-minimum datum of Lemma R.4.5. The predictive-recovery selection of $\mathcal G_{24}$ alone does not construct that lattice.

**Proposition Q.0.5 (Conditional Leech Shell Structure).** Assume a registered discriminant-form, marking, and coset-minimum certificate of Lemma R.4.5 constructs an even unimodular rootless rank-$24$ lattice. Then the lattice is the Leech lattice $\Lambda_{24}$, its nonzero minimum squared norm is $4$, and its first shell norms are $4,6,8,\ldots$.

*Proof.* The registered certificate supplies evenness, unimodularity, rank $24$, and rootlessness. Niemeier's classification identifies the unique lattice with those properties as $\Lambda_{24}$. In the convention used here, its theta series is [Conway & Sloane 1999]
$$
\Theta_{\Lambda_{24}}(q)
=
1+196560q^4+16773120q^6+398034000q^8+\cdots.
$$
The first nonconstant term therefore occurs at squared norm $4$, and the displayed subsequent terms give shell norms $6$ and $8$. Golay parameters alone do not supply the registered gluing or coset-minimum certificate. ∎

**Theorem Q.0.5a (Mass--Action Correspondence on the Canonical Norm--Information and $\mathfrak B_{mass}$ Branches).** On the canonical Leech norm--information calibration branch, where $\mathcal I_{rel}(v)=|v|$, and on the joint saturated-boundary/activity completed-reset and accepted action--entropy branch $\mathfrak B_{mass}$ of Appendix N, a vacuum excitation labeled by $v\in\Lambda_{24}$ satisfies
$$
m^2(v)=(\mu_0^{alg})^2|v|^2,
\qquad
\mu_0^{alg}:=\frac{m_P}{2\sqrt{8\varepsilon_0}}.
$$
The coefficient $\mu_0^{alg}$ is an algebraic normalization and becomes a physical mass coefficient only on $\mathfrak B_{mass}$.

*Proof.* On $\mathfrak B_{mass}$, Theorem N.5 gives $m=\mu_0^{alg}\mathcal I_{rel}$. The independent canonical norm--information certificate gives $\mathcal I_{rel}(v)=|v|$. Combining and squaring proves the formula. Neither branch follows from Leech shell structure alone. ∎

**Remark Q.0.5a.1: Conditional Derivation Chain.** A registered Lemma R.4.5 gluing/rootlessness certificate first identifies the Leech shell geometry. The physical mass map then additionally requires $\mathfrak B_{mass}$ and the norm--information calibration. Neither step follows from SPAP or Golay parameters alone.



**Remark Q.0.5a.2: Phenomenological Status.** Leech geometry provides a discrete norm spectrum. On $\mathfrak B_{mass}$ with canonical calibration it induces the stated conditional mass spectrum. Connecting that branch to observed particles requires an independently specified identification between lattice excitations and particle states.

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

This section has established:

1. **Discrete Integrality:** $N \in \mathbb{Z}$ at the fundamental (MPU network) level (Proposition Q.0.3)

2. **Phase-Bit Correspondence:** $e^{i\mathcal{S}/\hbar} = 2^{iN}$ at the SPAP minimum (Corollary Q.0.6)

3. **Topological Constraints:** The action one-form obeys Theorem Q.0.4 only under its trivial-total-holonomy hypothesis

4. **Vacuum Shell and Conditional Mass Structure:** Leech geometry fixes $|v|^2\in\{4,6,8,\ldots\}$; $m^2=(\mu_0^{alg})^2|v|^2$ additionally requires Theorem Q.0.5a's $\mathfrak B_{mass}$ and canonical-calibration branch



5. **Bohr-Sommerfeld Emergence:** Standard quantization in units of $h = 2\pi\hbar$ arises from the interference condition on closed orbits (Proposition Q.0.9)

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

---

#### Q.0.9.4 Conditional Algebraic Cancellation

**Proposition Q.0.10e (Conditional Cancellation).** Under the full hypotheses of Theorem Q.0.10,
$$
\frac{\kappa_A\ln2}{k_BT_U\ln2}
=\frac{\kappa_A}{\hbar}\frac{2\pi c}{a}.
$$
The cancellation is algebraic. It does not show that Unruh thermality, Landauer reset heat, and a mechanical action have a common microscopic origin. ∎

#### Q.0.9.5 Limiting Cases

| Acceleration | Cycle Time $\tau_U$ | Bit Rate $\dot{N}_U$ | Physical Regime |
|:-------------|:--------------------|:---------------------|:----------------|
| $a \to 0$ | $\tau_U \to \infty$ | $\dot{N}_U \to 0$ | Inertial limit: Unruh bath vanishes |
| $a = c^2/L_P$ | $\tau_U = 2\pi t_P$ | $\dot{N}_U = 1/(2\pi t_P)$ | Planck acceleration |
| $a = g \approx 9.8$ m/s² | $\tau_U \approx 1.92 \times 10^{8}$ s | $\dot{N}_U \approx 5.2 \times 10^{-9}$ Hz | Earth surface gravity |

**Remark Q.0.10f (Inertial Limit).** At $a=0$ the Unruh bath is absent, so Theorem Q.0.10 does not apply. A separate thermal bath fixes a Landauer heat scale but no cycle duration without an independent action-duration or control law.

**Remark Q.0.10g: Earth Gravity.** At Earth's surface gravity ($g \approx 9.8$ m/s²), the Unruh temperature is:

$$T_U = \frac{\hbar g}{2\pi k_B c} \approx 4.0 \times 10^{-20} \text{ K}$$

This corresponds to a cycle time of approximately 6 years ($1.92 \times 10^8$ s). The extremely slow rate reflects the minuscule thermal resources available from vacuum fluctuations at typical accelerations. Practical computation requires thermal baths at temperatures vastly exceeding the Unruh temperature.

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
| Unruh temperature $T = \kappa/(2\pi)$ | Unruh temperature $T_U = \hbar a/(2\pi k_B c)$ | Horizon thermal character |
| Area-law entropy $\delta S = \eta \, \delta\mathcal{A}$ | Landauer bound $Q = k_B T \ln 2$ | Information-thermodynamic equivalence |
| Heat flux $\delta Q = T \, \delta S$ | SPAP action $\mathcal{S} = \hbar \ln 2$ | Irreversible entropy cost |

*The cancellation in $\tau_U = 2\pi c/a$ occurs because these three components compose to eliminate all non-geometric quantities.*

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

#### Q.0.9.8.2 Black Hole Computational Rate

**Theorem Q.0.12 (Conditional Schwarzschild-Horizon Protocol Rate).** *Assume the complete hypotheses of Theorem Q.0.10: a conditionally uniform binary reset into the Unruh bath, exact Landauer heat saturation, cyclic energy balance, the independent action-duration equality, and the calibration $\kappa_A=\hbar$. Assume also that a real protocol realizes this duration and that its local proper-acceleration parameter is identified with the Schwarzschild surface gravity $a=\kappa=c^4/(4GM)$. Then:*

$$\boxed{\tau_{BH} = \frac{8\pi GM}{c^3}, \qquad \dot{N}_{BH} = \frac{c^3}{8\pi GM}}$$

*Proof.* Theorem Q.0.10 gives $\tau=2\pi c/a$ under the stated protocol hypotheses. Substitution of $a=\kappa=c^4/(4GM)$ yields

$$\tau_{BH} = \frac{2\pi c}{\kappa} = \frac{2\pi c \cdot 4GM}{c^4} = \frac{8\pi GM}{c^3}.$$

The realized protocol rate is its inverse, $\dot{N}_{BH}=c^3/(8\pi GM)$. $\square$

**Corollary Q.0.12a (Mass-Rate Scaling).** *The black hole bit rate scales inversely with mass:*

$$\dot{N}_{BH} \propto M^{-1}$$

*Larger black holes compute slower. This follows from the temperature scaling $T_H \propto M^{-1}$: larger black holes are colder, providing fewer thermal resources for irreversible computation.*

**Corollary Q.0.12b (Numerical Values).**

| Black Hole Mass | $\tau_{BH}$ | $\dot{N}_{BH}$ |
|:----------------|:------------|:---------------|
| $M_\odot$ (solar) | $1.24 \times 10^{-4}$ s | $8.1 \times 10^{3}$ Hz |
| $10^6 M_\odot$ (galactic center) | $1.24 \times 10^{2}$ s | $8.1 \times 10^{-3}$ Hz |
| $10^9 M_\odot$ (supermassive) | $1.24 \times 10^{5}$ s | $8.1 \times 10^{-6}$ Hz |
| $m_P$ (Planck mass) | $8\pi t_P$ | $(8\pi t_P)^{-1}$ |

---

#### Q.0.9.8.3 Consistency with Bekenstein-Hawking Entropy

**Theorem Q.0.13 (Entropy-Rate Proportionality in the Evaporation Model).** *Using the evaporation time formula quoted below and the Landauer-saturating horizon bit rate, the total number of irreversible bit erasures over the evaporation time is proportional to the Bekenstein-Hawking entropy:*
$$
N_{total} := \dot{N}_{BH} \, t_{evap} = \frac{160}{\pi}\, S_{BH}.
$$


*Proof.*

**Step 1 (Evaporation time).** The Page evaporation time for a Schwarzschild black hole is [Page 1976]:

$$t_{evap} = \frac{5120 \pi G^2 M^3}{\hbar c^4}$$

**Step 2 (Total bits processed).** Multiplying by the bit rate:

$$N_{total} = \dot{N}_{BH} \cdot t_{evap} = \frac{c^3}{8\pi GM} \cdot \frac{5120\pi G^2 M^3}{\hbar c^4} = \frac{640 GM^2}{\hbar c}$$

**Step 3 (Comparison with entropy).** The Bekenstein-Hawking entropy is:

$$S_{BH} = \frac{4\pi GM^2}{\hbar c}$$

**Step 4 (Ratio).** The ratio is:

$$\frac{N_{total}}{S_{BH}} = \frac{640 GM^2/(\hbar c)}{4\pi GM^2/(\hbar c)} = \frac{640}{4\pi} = \frac{160}{\pi} \approx 51$$

The displayed calculation multiplies the fixed-initial-mass Landauer-saturating rate $\dot{N}_{BH}(M)$ by the total Page evaporation time $t_{evap}(M)$, giving the coefficient $160/\pi \approx 51$. The key result is proportional scaling $N_{total} \propto S_{BH}$ between the total Landauer-saturating operation count and the Bekenstein-Hawking entropy, with the displayed coefficient reflecting the fixed-$M$/integrated-$M$ distinction noted above. The displayed calculation does not establish single-pass saturation: a properly integrated rate over the evaporating mass $M(t)$ would change the coefficient again, while preserving the proportionality $N \propto S$. $\square$


**Remark Q.0.13a: Information Processing Interpretation.** The black hole horizon is not merely a causal boundary but an information-processing surface. The Bekenstein-Hawking entropy $S_{BH}$ counts the horizon's information content; the Rindler-Landauer rate $\dot{N}_{BH}$ determines the Landauer-saturating processing rate. The proportional scaling $N_{total} \propto S_{BH}$ confirms that the horizon performs a number of Landauer-saturating operations proportional to its entropy during evaporation. The displayed coefficient $160/\pi$ does not establish exact single-pass saturation; demonstrating an exact one-erasure-per-entropy-unit relation would require a separate dynamical integration over the evaporating mass and a normalization argument absent from the displayed calculation.


---

#### Q.0.9.8.4 The Gravitational Constant from Computational Constraints

**Theorem Q.0.14 (G from Horizon Computation).** *The gravitational constant $G$ can be expressed in terms of the Rindler-Landauer cycle time and the Bekenstein-Hawking entropy density:*
$$
G = \frac{c^3 \tau_{BH}}{8\pi M}
= \frac{c^3}{4\hbar}\cdot \frac{1}{S_{BH}/A},
$$
where $S_{BH}/A = c^3/(4G\hbar)$ is the Bekenstein-Hawking entropy density for the dimensionless entropy $S_{BH}$ (in nats).


*Proof.* From Theorem Q.0.12, $\tau_{BH} = 8\pi GM/c^3$, so
$$
G = \frac{c^3 \tau_{BH}}{8\pi M}.
$$
For the dimensionless Bekenstein-Hawking entropy $S_{BH}$ (in nats), one has
$$
\frac{S_{BH}}{A} = \frac{c^3}{4G\hbar}.
$$
Solving for $G$ gives
$$
G = \frac{c^3}{4\hbar}\cdot \frac{1}{S_{BH}/A}.
$$
$\square$


**Corollary Q.0.14a (Equivalence with Equation E.9).** *The expression for $G$ from horizon computation is equivalent to the MPU-derived formula (Equation E.9):*

$$G = \frac{\eta \delta^2 c^3}{4\hbar \chi C_{\max}}$$

*Proof.* Appendix E gives the entropy density in MPU parameters:
$$
\frac{S_{BH}}{A} = \frac{\chi C_{\max}}{\eta \delta^2}.
$$
Substituting into Theorem Q.0.14 yields
$$
G = \frac{c^3}{4\hbar}\cdot \frac{1}{S_{BH}/A}
= \frac{c^3}{4\hbar}\cdot \frac{\eta \delta^2}{\chi C_{\max}}
= \frac{\eta \delta^2 c^3}{4\hbar \chi C_{\max}},
$$
which is Equation (E.9). $\square$


---

#### Q.0.9.8.5 Joint Gravity--Computation Consistency Ledger

**Theorem Q.0.15 (Joint Gravity--Computation Consistency Ledger).** Assume simultaneously: (a) the local Rindler/KMS and Clausius hypotheses of Theorem 12.1; (b) the horizon-saturation, density-certificate, and area-law calibration hypotheses of Theorems E.5--E.6; (c) the MPU stress-energy source construction of Appendix B; and (d) the complete protocol hypotheses of Theorem Q.0.10 with $\kappa_A=\hbar$, a real protocol realizing the conditional duration, and the local identification $a=\kappa$. Then the following statements hold on that joint branch:

1. the Jacobson construction gives the Einstein equations (Theorem 12.1);
2. the calibrated horizon entropy obeys the Bekenstein--Hawking area law (Theorems E.5--E.6);
3. the calibration gives $G=\eta\delta^2c^3/(4\hbar\chi C_{\max})$ (Equation (E.9)); and
4. the independently realized conditional protocol has rate $\dot N=\kappa/(2\pi c)$ (Theorem Q.0.10 and Corollary Q.0.10c).

These are compatible projections of the stated joint hypothesis package. No implication among items 1--4 is asserted after removing the hypotheses used to establish the target item.

*Proof.* Items 1 and 2 follow from the local-Rindler, Clausius, horizon-saturation, density-certificate, and stress-energy hypotheses by Theorem 12.1 and Theorems E.5--E.6. Substitution of the calibrated entropy density into Definition (E.6c) gives item 3 algebraically. Under the independent reset, saturation, energy-balance, action-duration, real-protocol, and $a=\kappa$ hypotheses, Theorem Q.0.10 and Corollary Q.0.10c give item 4. Each conclusion therefore follows from the union of the hypotheses declared in the theorem, without using any conclusion to prove one of its own antecedents. $\square$

**Corollary Q.0.15a (No Closed Implication Loop).** On the hypotheses of Theorem Q.0.15, the gravity, area-law, coupling-calibration, and computational-rate ledgers are mutually consistent. The computational-rate identity alone implies neither the horizon entropy density nor the Einstein equations. $\square$

---

#### Q.0.9.8.6 The Geometric Nature of Gravity

**Proposition Q.0.16 (Conditional Conversion-Factor Cancellation).** Assume the complete reset, saturation, energy-balance, action-duration, real-protocol, and calibration hypotheses of Theorem Q.0.10, including $\kappa_A=\hbar$ and $a>0$. Then the realized duration obeys
$$
\tau_U
=\frac{\hbar\ln2}{k_BT_U\ln2}
=\frac{\hbar\ln2}{k_B(\hbar a/(2\pi k_Bc))\ln2}
=\frac{2\pi c}{a}.
$$
The cancellation is an algebraic consistency identity on this protocol branch. It does not imply that gravitational, thermodynamic, and information-theoretic theories are equivalent or that any output of Theorem Q.0.15 implies another.

*Proof.* Substitute $T_U=\hbar a/(2\pi k_Bc)$ into the conditional action-duration equality and cancel the nonzero factors $\hbar$, $k_B$, and $\ln2$. This gives the displayed duration. No field equation, entropy-density law, or converse implication occurs in the calculation. $\square$

**Theorem Q.0.17 (Conditional Gravity--Computation Uniqueness Ledger).** *Assume the complete joint hypothesis package of Theorem Q.0.15, including its local Rindler/KMS, Clausius, horizon-density, area-law calibration, MPU stress-energy, and realized protocol branches. Assume in addition the four-dimensional Lovelock hypothesis class and impose the stated Bekenstein-rate consistency condition at every local Rindler horizon. Then the Einstein field equations supplied by Theorem 12.1 are the unique second-order local metric equations within that class that satisfy the joint package. Computational-rate saturation alone entails neither the entropy density nor the Einstein equations.*


*Proof.*

**Step 1 (Conditional rate consistency).** Proposition Q.0.10h verifies equality with the Bekenstein rate only on its declared Rindler-sized, thermal-energy, saturated-protocol model. It does not imply that every local Rindler horizon realizes that protocol or saturates the bound.

**Step 2 (Independent entropy-density bridge).** Assume the universal Bekenstein--Hawking entropy density $1/(4L_P^2)$ as part of the horizon-saturation and area-law calibration package. It is not derived from the conditional rate equality alone.

**Step 3 (Jacobson construction).** The independently supplied universal entropy density, together with the local Clausius relation, Unruh/KMS input, stress-energy flux identification, and the remaining hypotheses of Theorem 12.1, implies the Einstein equations on that branch (Jacobson 1995).

**Step 4 (Uniqueness).** By Lovelock's theorem, in four dimensions the Einstein tensor (plus cosmological constant) is the unique divergence-free symmetric tensor constructible from the metric and its first two derivatives. The Bekenstein-Hawking entropy density selects this tensor over higher-curvature alternatives (Lemma 12.1). $\square$

---

#### Q.0.9.8.7 Summary

| Result | Statement | Significance |
|:-------|:----------|:-------------|
| Proposition Q.0.11 | Jacobson and conditional Rindler–Landauer constructions share formal ingredients on separate branch packages | Comparison only; no common microscopic origin derived |
| Theorem Q.0.12 | $\tau_{BH} = 8\pi GM/c^3$ on its black-hole protocol branch | Conditional black-hole computational timescale |
| Theorem Q.0.13 | $N_{total} \sim S_{BH}$ on its evaporation-model branch | Conditional entropy-rate proportionality |
| Theorem Q.0.14 | $G$ is algebraically expressible through the calibrated horizon rate on its stated branch | Conditional gravity-computation relation |
| Theorem Q.0.15 | EFE, the area law, the $G$ calibration, and the computational rate coexist on the joint gravity-computation package | Compatibility ledger; no reverse implication |
| Proposition Q.0.16 | The declared conversion factors cancel to a geometric identity on the common calibration branch | Conditional consistency identity |
| Theorem Q.0.17 | The Einstein equation is unique within the declared four-dimensional Lovelock class under the full gravity bridge | Computational saturation alone is insufficient |

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
7. $\Theta_{\mathrm{MPU}}=N\ln2\ \mathrm{mod}\ 2\pi$ is the MPU-cycle phase contribution for an integer $N\ge1$, derived from the same closed loop and the saturated SPAP cost.
8. $\mathcal D_{\mathrm{loop}}$ is the transfer-map domain, including boundary conditions, single-valuedness convention, and finite resolution.
9. $\mathcal P_{\mathrm{peak}}$ is the peak-identification protocol and $\varepsilon_{\mathrm{peak}}$ is the certified phase tolerance. These entries concern phase positions only; amplitudes, widths, greybody factors, and nonresonant envelopes are separate scattering observables.
10. $\chi_T$ records that the loop map, tolerance, and mode domain are fixed before spectral comparison.

Without an accepted $\mathfrak T_{\mathrm{hor}}$, the retained horizon algebra and Page/scrambling certificates do not imply the closed-loop transfer map.

**Lemma Q.0.7v (Thermal Phase Identity).** For any horizon with Hawking temperature $k_B T_H=\hbar\kappa/(2\pi c)$ and Rindler-Landauer cycle time $\tau_H=2\pi c/\kappa$,
$$
\frac{\hbar\omega}{k_B T_H}=\omega\tau_H.
$$

*Proof.* Multiplying $k_B T_H=\hbar\kappa/(2\pi c)$ by $\tau_H=2\pi c/\kappa$ gives $k_B T_H\tau_H=\hbar$. Dividing $\hbar\omega$ by $k_B T_H$ gives $\omega\tau_H$. $\square$

**Proposition Q.0.19 (Conditional Landauer Phase-Grid Signature).** On an accepted horizon closed-loop transfer record $\mathfrak T_{\mathrm{hor}}$, resonant phase-matching points in the thermal variable $x=\hbar\omega/(k_BT_H)$ obey
$$
x\equiv N\ln2\pmod{2\pi},
\qquad
N\in\mathbb Z_{\ge1},
\tag{Q.0.19.1}
$$
within the certified phase tolerance $\varepsilon_{\mathrm{peak}}$. Equivalently, after rescaling $x\mapsto x/(2\pi)$, the phase-position grid is the irrational rotation orbit
$$
\{N\alpha_L\bmod1:N\in\mathbb Z_{\ge1}\},
\qquad
\alpha_L=\frac{\ln2}{2\pi}.
\tag{Q.0.19.2}
$$
The orbit is dense and equidistributed in $[0,1)$, and every finite truncation partitions the circle into at most three distinct gap lengths. This proposition fixes only phase-grid positions; it does not fix amplitudes, widths, greybody factors, or nonresonant envelopes.

*Proof.* Definition Q.0.7u supplies the equality of the dynamical loop phase $x$ and the MPU-cycle phase $N\ln2$ modulo $2\pi$ on the certified transfer domain, up to the tolerance $\varepsilon_{\mathrm{peak}}$. Dividing by $2\pi$ gives the rotation by $\alpha_L$ on $\mathbb R/\mathbb Z$. Lemma Q.0.7b gives transcendence, hence irrationality, of $\alpha_L$. Irrational rotations are dense and equidistributed by Weyl equidistribution. The finite-truncation gap statement is Proposition Q.0.7n applied to the same orbit. $\square$

**Corollary Q.0.19a (Beatty Staircase of Positive-Overhead Sectors).** *For each holonomy sector $k\ge1$, the largest SPAP-minimum cycle count not overshooting the sector closure phase $2\pi k$ is*
$$
N_k^+ := \lfloor\beta_L k\rfloor,
\qquad
\beta_L=\frac{2\pi}{\ln2}.
$$
*The corresponding positive overhead is*
$$
\Delta_k^+ := 2\pi k-N_k^+\ln2\in[0,\ln2),
$$
*and the successor increments $N_{k+1}^+-N_k^+$ lie in $\{9,10\}$ with asymptotic 10-step frequency $\beta_L-9\approx0.0647$.*

*Proof.* This is exactly Proposition Q.0.7j and Definition Q.0.7h applied to the phase grid of Proposition Q.0.19. The interval bound follows from the floor definition. $\square$

**Corollary Q.0.19b (Convergent Hierarchy of Smallest Phase Defects).** *Let $(k_n,N_n)=(p_n,q_n)$ be the continued-fraction convergents of $\alpha_L=\ln2/(2\pi)$. Then*
$$
\delta_{N_n}:=\min_{k\in\mathbb Z}|N_n\ln2-2\pi k|<\frac{2\pi}{N_n}.
$$
*The first low-defect pairs are*
$$
(k,N)\in\{(1,9),\ (15,136),\ (31,281),\ (139,1260),\ (170,1541),\ldots\}.
$$

*Proof.* This is Corollary Q.0.7l translated from $|N\alpha_L-k|$ to $|N\ln2-2\pi k|$ by multiplication by $2\pi$. $\square$

**Proposition Q.0.20 (Parameter-Free Phase Scales on the Transfer Branch).** On an accepted horizon closed-loop transfer record $\mathfrak T_{\mathrm{hor}}$, the phase-grid scales $(2\pi,\ln2)$ are fixed by the $U(1)$ closure period and the saturated SPAP cost. Therefore the grid in the dimensionless variable $x=\hbar\omega/(k_BT_H)$ is independent of horizon mass, charge, spin, and matter content at the level of phase positions, up to the certified phase tolerance $\varepsilon_{\mathrm{peak}}$. The response amplitudes, widths, greybody factors, peak heights, and nonresonant envelope remain separate scattering outputs of $\mathcal M_{\mathrm{scat}}$ and are not fixed by the phase grid.

*Proof.* The period $2\pi$ is the single-valuedness period of the phase. The step $\ln2$ is the saturated SPAP cost recorded by $\Theta_{\mathrm{MPU}}$ in Definition Q.0.7u. Neither depends on horizon parameters. The final sentence follows because $\mathfrak T_{\mathrm{hor}}$ fixes the phase-matching grid and tolerance only; scattering amplitudes and greybody data are distinct entries of the horizon scattering map. $\square$

**Corollary Q.0.20a (Temperature-Normalized Cross-Horizon Collapse).** *Let $H_1$ and $H_2$ be two horizons satisfying the same closed-loop transfer branch of Definition Q.0.7u, with Hawking temperatures $T_{H,1}$ and $T_{H,2}$. Define the reduced thermal phase map*
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
\Pi(\omega_N^{(1)},H_1)
=
\Pi(\omega_N^{(2)},H_2)
=
[N\ln2]_{2\pi}.
$$
*If a common lift $m\in\mathbb Z_{\ge0}$ is chosen so that*
$$
x_{N,m}:=N\ln2+2\pi m,
$$
*then the corresponding physical frequencies obey*
$$
\frac{\omega_{N,m}^{(1)}}{\omega_{N,m}^{(2)}}
=
\frac{T_{H,1}}{T_{H,2}}.
$$
*Thus the branch predicts a universal temperature-normalized phase ruler, while raw frequencies scale with horizon temperature.*

*Proof.* Proposition Q.0.19 gives
$$
\frac{\hbar\omega_N^{(r)}}{k_B T_{H,r}}
\equiv
N\ln2
\pmod{2\pi}
$$
for each horizon $H_r$. Applying the quotient map $[\cdot]_{2\pi}$ gives the equality of reduced phases. If a common lift $x_{N,m}$ is selected, then
$$
\omega_{N,m}^{(r)}
=
\frac{k_B T_{H,r}}{\hbar}x_{N,m}.
$$
Taking the ratio for $r=1,2$ cancels $x_{N,m}$ and gives $\omega_{N,m}^{(1)}/\omega_{N,m}^{(2)}=T_{H,1}/T_{H,2}$. $\square$

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

**Theorem Q.0.20b.3 (Transfer-Map Separation Theorem).** The retained horizon channel $\mathfrak H_n^{\mathrm{ret}}$, deterministic exterior recovery certificate $\mathfrak S_{\mathrm{hor},n}$, and Page/design scrambling certificates prove retained conservation, exterior recovery, or Page-type entropy statements according to their own norms. They do not imply
$$
x\equiv N\ln2\pmod{2\pi}
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

**Remark Q.0.19.2 (Status Boundary).** Proposition Q.0.19 is a conditional phase-grid statement. It should not be read as a theorem that the full greybody correction is a universal function of $x$ alone. Standard greybody factors also carry angular-momentum, spin, polarization, dimension, and barrier-shape data. The framework-level prediction is the parameter-free phase grid on the closed-loop transfer branch.

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

On the residual-budget branch of Appendix E (Equation E.14, derived from the PCE resource-partition argument in which the SPAP cost $\varepsilon$ is subtracted from the total information potential $\ln d_0$ to give the available boundary channel capacity), the PCE-optimal channel capacity satisfies $C_{\max}^* = \ln d_0 - \varepsilon$. On the minimal Appendix Z branch one has $d_0 = 8$ (Theorem Z.2), and at the PCE-Attractor one has $\varepsilon_0=\ln2$ (Definition 15a; Theorem 31 gives the lower bound). Therefore:
$$\boxed{C_{\max}^* = \ln 8 - \ln 2 = 2\ln 2 = 2\varepsilon} \tag{Q.10}$$

The residual-budget branch is the load-bearing assumption: alternative resource-partition rules (e.g., one in which the SPAP cost is paid by internal processing without subtraction from external boundary capacity) would yield different values of $C_{\max}^*$ and correspondingly different values of $\delta/L_P$ in §Q.2.4 and §Q.5.


**Remark Q.10.1 (Bit-Budget Characterization).** Since $N_{\mathrm{vis}}^{\min}=2^{K_0}=8$ and the minimal complex Hilbert carrier saturates $d_0=N_{\mathrm{vis}}^{\min}$ on the minimal branch, while the PCE reference uses structural $\varepsilon_0=\ln2$, the capacity-cost ratio has the structural form
$$
\frac{C_{\max}^*}{\varepsilon} = \frac{\ln(d_0)-\varepsilon}{\varepsilon} = K_0 - 1.
$$
At $K_0 = 3$ this gives $C_{\max}^*/\varepsilon = 2$: of the $K_0=3$ bits per MPU cycle, one bit pays the irreversible Landauer cost of the SPAP merge, leaving $K_0-1=2$ bits of residual channel capacity. This identity is the structural source of the ratio-2 appearances that explicitly use $C_{\max}/\varepsilon_0$ elsewhere in the framework, while downstream applications may impose additional local assumptions.

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

Substituting the equilibrium values $C_{\max}^*=2\ln2$, $\chi^*=1$, and $\eta^*=1$ into Equation (Q.3) yields the closed-form ratio reported in Equation (Q.18):
$$
\frac{\delta^2}{L_P^2}=8\ln 2,\qquad \frac{\delta}{L_P}=\sqrt{8\ln 2}\approx 2.355.
$$

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

- **Factor $\varepsilon_0=\ln2$:** Theorem 31 gives the irreducible thermodynamic lower bound $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$, and Definition 15a uses the structural reference $\varepsilon_0=\ln2$; physical equality requires the overhead-free implementation branch.

The discretization scale $\sqrt{d_0 \cdot \varepsilon} = \sqrt{8\ln 2} \approx 2.355$ thus represents the geometric mean of the logical capacity and thermodynamic cost of self-reference on the minimal/saturating branch.

**Remark Q.6.2: Complete Derivation Chain.** The full derivation from logical axioms to spacetime discretization proceeds through two parallel pathways originating from $K_0$:

$$\begin{array}{c} K_0 = 3 \xrightarrow{\text{Thm 15}} N_{\mathrm{vis}}^{\min}=2^{K_0}=8 \xrightarrow{\text{Thm 23}} d_0 \ge N_{\mathrm{vis}}^{\min} \xrightarrow{\text{Thm Z.2}} d_0 = 8 \\[6pt] \text{SPAP merge} \xrightarrow{\text{Thm 31}} \varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0) \xrightarrow{\text{Def 15a}} \varepsilon_0=\ln2 \end{array} \bigg\} \xrightarrow[\text{consistency}]{\text{P.14.3}} d_0 \cdot \varepsilon = 8\ln 2 \xrightarrow{\text{Eq. Q.18}} \frac{\delta}{L_P} = \sqrt{d_0 \cdot \varepsilon}$$

The discretization scale emerges from two independent derivations constrained by internal consistency (P.14.3):

1. **The Hilbert space dimension** satisfies $d_0 \ge N_{\mathrm{vis}}^{\min}=8$ by Theorem 23, with equality $d_0=8$ on the minimal PCE branch (Theorem Z.2).

2. **The entropy cost** satisfies $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$ by Theorem 31, with structural reference $\varepsilon_0=\ln2$ in Definition 15a; physical equality $\varepsilon_{\mathrm{phys}}=H_q(P\mid R)$ requires the overhead-free Landauer implementation branch.

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

### Q.6.5 Summary

| Quantity | Symbol | Value | Origin |
|:---------|:-------|:------|:-------|
| Spatial discretization | $\delta/L_P$ | $\sqrt{8\ln2}\approx2.355$ on the residual-budget, throughput-saturated, ideal-packing branch | Eq. Q.18 together with Eq. Q.10 and Lemmas Q.2.2–Q.2.3 |
| Temporal discretization | $\tau_{min}/t_P$ | $\sqrt{8\ln2}\approx2.355$ only after the serialized-frontier calibration | Proposition Q.6.1 plus Eq. Q.18 |
| Information budget | $C_{\max}^*$ | $2\ln2$ on the residual-capacity branch | Eq. Q.10 and its Appendix-E residual-budget premise |
| Hilbert space dimension | $d_0$ | $8$ on the minimal Hilbert-carrier branch | Theorem 23; Theorem Z.2 |
| Structural binary reference | $\varepsilon_0$ | $\ln2$ | Theorem 31; physical reset cost is ensemble-dependent |
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

**Theorem Q.7.1 (Time-Quantum-to-Hubble Identity).** On the minimal Appendix Z branch with PCE-saturated discretization (Section Q.6), the ratio of the minimum cycle time to the de Sitter Hubble time is
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

**Corollary Q.7.2 (Hubble-Cycle Count Per MPU at Saturation).** The number of MPU cycles per MPU per Hubble time on the minimal Appendix Z branch with PCE-saturated discretization is
$$
\frac{t_H}{\tau_{\min}}\;=\;\frac{1}{\sqrt{8\ln 2}}\,\sqrt{\frac{3}{\Lambda L_P^2}}.
$$

*Proof.* Reciprocal of Theorem Q.7.1. ∎

### Q.7.3 Numerical Evaluation

Using the observed central value $\Lambda L_P^2=2.86599\times 10^{-122}$ from Equation V.5 (Appendix V), Theorem Q.7.1 gives
$$
\frac{\tau_{\min}}{t_H}\;=\;\sqrt{8\ln 2}\,\sqrt{\frac{2.86599\times 10^{-122}}{3}}\;\approx\;2.302\times 10^{-61}.
$$
The reciprocal cycle count per MPU per Hubble time is
$$
\frac{t_H}{\tau_{\min}}\;\approx\;4.345\times 10^{60}.
$$

### Q.7.4 Status of the Identity

**Remark Q.7.1 (Status of Theorem Q.7.1).** Theorem Q.7.1 is algebraic only after three independent branch packages are accepted: the spatial ratio of Equation Q.18, the serialized-frontier clock calibration of Proposition Q.6.1, and the de Sitter definition of $t_H$. It is not a consequence of $K_0$, $\varepsilon_0$, $d_0$, and $\Lambda L_P^2$ alone, and it does not independently close either the temporal or cosmological branch.

**Remark Q.7.2 (Cosmological-Microscopic Bridge).** Theorem Q.7.1 packages the framework's smallest derived time scale (the MPU cycle time on the saturating branch) and the largest cosmological time scale (the de Sitter Hubble time) into a single dimensionless number determined by $K_0$, $\varepsilon_0$, and $\Lambda L_P^2$. This complements Equation Q.18 (which relates microscopic and Planck *length* scales by $K_0,\varepsilon_0$ alone) by extending the same construction to *temporal* scales once the cosmological-constant sector is adjoined.

