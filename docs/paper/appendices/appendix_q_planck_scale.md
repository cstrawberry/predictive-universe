# Appendix Q: Derivation of the Planck-MPU Scale Ratio

## Q.0 The Action-Entropy Identity and the Origin of Planck's Constant

Before deriving the quantitative relationship between the MPU spacing $\delta$ and the Planck length $L_P$, we establish a foundational result: the identification of Planck's constant $\hbar$ as the exchange rate between information-theoretic and mechanical descriptions of physical processes. This identification emerges from the Action-Entropy Identity, which reveals that physical action measures cumulative irreversible entropy production.

### Q.0.1 The Puzzle of Least Action

The Principle of Least Action stands as one of the most powerful organizing principles in physics. From it, classical mechanics, field theory, and the path integral formulation of quantum mechanics can be derived. Yet the standard presentation offers no explanation for *why* nature should extremize this particular quantity—the integral of the Lagrangian over time.

Within the Predictive Universe framework, this puzzle admits a resolution: the Principle of Least Action is not fundamental but derived. It is the continuum Euler–Lagrange condition expressing **stationarity of the total SPAP entropy cost** accumulated along a history, subject to fixed boundary data (and, when relevant, fixed holonomy sector).

### Q.0.2 The Discrete Predictive Cost Functional

The MPU network executes cyclical predictive operations, each cycle implementing the Fundamental Predictive Loop (Definition 4):

$$\text{Predict} \to \text{Verify} \to \text{Update}$$

Each non-trivial cycle incurs the structural SPAP entropy cost $\varepsilon_0=\ln 2$ nats and physical implementation cost $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0$ (Theorem 31, Appendix J). This cost arises from the logically irreversible 2-to-1 state merge required by self-referential prediction (Lemma J.1), and by Landauer's principle, necessarily manifests as thermodynamic entropy production.

**Definition Q.0.1 (Dimensionless Discrete Predictive Action).** For a trajectory of the MPU network over $N$ predictive cycles, define the *dimensionless* discrete predictive action by:

$$\mathcal{S}_{disc} := \sum_{i=1}^{N} \varepsilon_i$$

where $\varepsilon_i\ge\varepsilon_0=\ln2$ is the physical entropy production (in nats) of the $i$-th cycle, decomposed as $\varepsilon_i=\varepsilon_0+\varepsilon_{\mathrm{diss},i}$ with $\varepsilon_{\mathrm{diss},i}\ge0$. This quantity counts the total irreversible entropy cost required to evolve the network configuration along the specified trajectory.

The corresponding *physical* action functional is obtained by the universal conversion factor $\hbar$:

$$\mathcal{S}^{phys}_{disc} := \hbar\,\mathcal{S}_{disc}$$


**Proposition Q.0.1 (Action Bounds).** For any trajectory involving $N_{\text{ops}}$ non-trivial predictive operations:

$$\mathcal{S}_{disc} \geq N_{ops} \cdot \ln 2$$

*Proof.* Each non-trivial operation has physical cost $\varepsilon_i=\varepsilon_0+\varepsilon_{\mathrm{diss},i}\ge\varepsilon_0=\ln2$ by Theorem 31. Summing this lower bound over $N_{\text{ops}}$ operations gives the stated inequality. QED

**Remark Q.0.1a (Structural and Physical Entropy in the Action Ledger).** The structural quantity $\varepsilon_0$ appearing here is the same SPAP entropy quantum that, through the derivation chain of Thesis P.6.1 (Appendix P), connects to Shannon, von Neumann, thermodynamic, and Bekenstein-Hawking entropy. The physical trajectory costs $\varepsilon_i=\varepsilon_0+\varepsilon_{\mathrm{diss},i}$ add nonnegative overhead to this structural floor. The discrete predictive action thus inherits the unified entropy structure while still allowing implementation-dependent dissipation.

### Q.0.3 The Continuum Limit via Γ-Convergence

The discrete predictive cost functional converges to a continuum action in the limit of fine network resolution. This convergence is developed within the Γ-convergence framework (Theorem D.6, Appendix D; Section O.7, Appendix O).

**Theorem Q.0.1 (Action-Entropy Identity).** Let $\{G_h\}_{h\to 0}$ be a family of MPU networks with mesh size $h \to 0$ approximating a spacetime region. Let $\mathcal{S}_{disc}^{(h)}$ be the dimensionless discrete predictive action of Definition Q.0.1.

Under the locality and equi-coercivity hypotheses of Theorem D.6 (Appendix D), the corresponding physical action functional $\mathcal{S}_{disc}^{phys,(h)} := \hbar\,\mathcal{S}_{disc}^{(h)}$ admits a $\Gamma$-limit that is a local diffeomorphism-invariant continuum functional of the emergent fields and metric. Writing this limit in standard action form defines the continuum action $\mathcal{S}$:

$$\mathcal{S}_{disc}^{phys,(h)} \xrightarrow{\Gamma} \mathcal{S} := \int d^4x \sqrt{|g|}\,\mathcal{L}_{tot}$$

Equivalently, the dimensionless $\Gamma$-limit is:

$$\boxed{\mathcal{S}_{disc}^{(h)} \xrightarrow{\Gamma} \frac{\mathcal{S}}{\hbar}}$$

where $\hbar$ is the universal conversion factor between SPAP entropy units (nats) and physical action units (J·s).

*Proof.* Appendix D establishes existence of a $\Gamma$-limit for the PCE-driven discrete action functional under locality and equi-coercivity (Theorem D.6). Locality and invariance fix the continuum limit to the standard form of an integral of a scalar density $\sqrt{|g|}\,\mathcal{L}_{tot}$. The normalization is fixed by identifying the continuum limit with the conventional action units, which introduces a single universal conversion constant with dimensions of action, denoted $\hbar$.


1. **Spatial sector:** The discrete cost for spatial variations Γ-converges to a positive-definite quadratic form defining the emergent Riemannian metric on spatial slices.

2. **Temporal sector:** The irreversibility of the 'Evolve' process ($\varepsilon_0=\ln2$, $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0$, Theorem 31) supplies an entropy-selected time direction (Appendix O, §O.4) — Hypothesis O.7.2.2 of the Appendix O signature closure theorem. Promotion of the resulting operational causal frontier to a Lorentzian principal symbol with signature $(-, +, +, +)$ requires the additional hypotheses O.7.2.1, O.7.2.3, and O.7.2.4 (positive-definite spatial block, second-order continuum principal symbol, nondegenerate hyperbolic cone coinciding with the operational causal frontier). Under the full four-hypothesis package, Appendix O Theorem O.7a yields the Lorentzian signature; this matches the parallel Lorentzian-branch alignments at Theorem 46 / Corollary 46a in the main text and at Theorem P.8.5 in Appendix P.


3. **Combined action:** The full Γ-limit yields the standard action for fields in curved spacetime, with $\hbar$ appearing as the conversion factor between discrete (nats) and continuous (J·s) descriptions.

**Corollary Q.0.1 (Action-Entropy Identity).** For a history $\phi$ in the action ensemble,

$$\boxed{\mathcal{S}[\phi] = \hbar \sum_{i\in\phi}\varepsilon_i}$$

In interference observables, only the phase $e^{i\mathcal{S}[\phi]/\hbar} = e^{i\sum_{i\in\phi}\varepsilon_i}$ is measurable, hence phases are identified modulo $2\pi$.

This identity connects the mechanical description of physics (action in J·s) to the information-theoretic description (entropy in nats), with ℏ serving as the conversion factor. In quantum amplitudes $e^{i\mathcal{S}[\phi]/\hbar}$, only the phase modulo $2\pi$ is observable, giving physical significance to the holonomy structure developed in Theorem Q.0.4.

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
\hbar I_{\mathrm{PU}}[\gamma].
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
For every regular transition tube $\mathcal T_{A\to B}$ whose interior and closure have the same infimum,
$$
\lim_{\eta\downarrow0}
\eta\log
\mathbb P_\eta(X^\eta_{[0,T]}\in\mathcal T_{A\to B})
=
-\mathcal I_{A\to B}.
\tag{Q.0.1b.2}
$$
Equivalently, the physical suppression exponent is
$$
\frac{\mathcal S_{A\to B}^{\min}}{\hbar}
=
\mathcal I_{A\to B}.
\tag{Q.0.1b.3}
$$
Thus vacuum decay bounces, sphaleron transitions, metastability escape paths, rare perspective transitions, and finite phase-transition nucleation paths are the same variational object whenever the corresponding branch has been reduced to a retained finite ND-RID/PCE large-deviation dynamics.

*Proof.* Equation (Q.0.1a.1) is the large-deviation principle for the path family. Apply it to the transition tube $\mathcal T_{A\to B}$. The assumed regularity of the tube gives
$$
\inf_{\gamma\in\mathcal T_{A\to B}^\circ} I_{\mathrm{PU}}[\gamma]
=
\inf_{\gamma\in\overline{\mathcal T}_{A\to B}} I_{\mathrm{PU}}[\gamma]
=
\mathcal I_{A\to B}.
$$
The lower and upper bounds in (Q.0.1a.1) therefore coincide and give (Q.0.1b.2).

The minimizing exponent (Q.0.1b.1) is the variational statement that the least-cost retained path dominates the rare event at exponential order. Equation (Q.0.1b.3) follows from the Action-Entropy Identity, since Definition Q.0.1a identifies the dimensionless rate functional with the retained action in units of $\hbar$. The listed physical processes differ only in the retained coordinates, boundary conditions, and basins $A,B$; the variational calculation is the same. ∎

**Corollary Q.0.1c (Instanton Ledger Consolidation).** Any branch exponent already expressed in PU as a stationary or minimizing action is an instance of Theorem Q.0.1b once its retained finite dynamics satisfies Definition Q.0.1a. In particular, the Coleman-type vacuum-decay exponent of Appendix U and the electroweak sphaleron/update exponent of Appendix Y are projections of the same action-entropy large-deviation ledger on their respective retained branches.

*Proof.* Appendix U and Appendix Y express their suppression exponents as finite action or action-derived complexity costs on specified retained branches. If the branch dynamics satisfies the path-space large-deviation hypothesis of Definition Q.0.1a, Theorem Q.0.1b says that the exponential suppression is the infimum of the same dimensionless action over paths with the corresponding boundary conditions. Hence those exponents are branch projections of the common variational ledger. ∎

### Q.0.4 Planck's Constant as Exchange Rate

The Action-Entropy Identity reveals that $\hbar$ serves as a conversion factor between two descriptions of the same physical process: the information-theoretic description (counting SPAP entropy in nats) and the mechanical description (measuring action in J·s). 

**Theorem Q.0.2 (Planck's Constant as Necessary Exchange Rate).** Any physical instantiation of the predictive framework requires a conversion factor $\hbar > 0$ between SPAP entropy (nats) and physical action (J·s). This constant is determined by the framework's fundamental scales.

*Proof.*

**Step 1 (Existence of Minimum Scales).** The SPAP cycle requires both minimum duration $\tau_{min} > 0$ and minimum energy $E_{min} > 0$ to maintain predictive coherence (Theorem 29). These scales are determined by the logical structure of self-reference and the requirement of physical instantiation (PPI, Definition P.6.2). Together they define a characteristic minimum-cycle action scale $\mathcal{S}_{min} = E_{min} \cdot \tau_{min} > 0$.

**Step 2 (Minimum Action).** Any complete predictive cycle has an associated physical action:

$$\mathcal{S}_{min} = E_{min} \cdot \tau_{min} > 0$$

This is the minimum "mechanical cost" of executing one irreversible predictive operation.

**Step 3 (Minimum Entropy).** The same cycle has SPAP entropy cost $\varepsilon_{min} = \ln 2$ nats (Theorem 31). This is the minimum "information-theoretic cost" of one irreversible operation, determined by the 2-to-1 state merge required by self-referential prediction (Lemma J.1).

**Step 4 (Conversion Factor).** Since both quantities describe the same physical process—one complete predictive cycle—a conversion factor must exist relating them:

$$\hbar := \frac{\mathcal{S}_{min}}{\varepsilon_{min}} = \frac{E_{min} \cdot \tau_{min}}{\ln 2}$$

This *defines* $\hbar$ as the action-per-nat of SPAP entropy—the exchange rate between mechanical and information-theoretic descriptions.

**Step 5 (Self-Consistency).** With $\hbar$ so defined, the minimum-cycle identity is

$$E_{min}\tau_{min} = \hbar \ln 2$$

so the characteristic energy-time scale satisfies $E_{min}\tau_{min} \sim \hbar$ up to factors of order unity. The uncertainty relation is a consequence of the discrete predictive structure, not a premise. $\square$


**Corollary Q.0.2 (Dimensional Identity).** Planck's constant has the dimensional role:

$$\boxed{\hbar = \frac{[\text{Action}]}{[\text{Entropy}]} = \frac{\text{J} \cdot \text{s}}{\text{nat}}}$$

It is the universal exchange rate between mechanical and information-theoretic descriptions of physical processes. This parallels the role of other fundamental constants as exchange rates (Section P.6.5.5): $k_B$ converts between temperature and energy, $c$ between space and time, and $\hbar$ between action and entropy.

**Corollary Q.0.2b (Minimal Physical Action per Irreversible Predictive Cycle).** For every nontrivial MPU cycle $i$, the physical action contribution associated with the discrete predictive cost is
$$
\Delta \mathcal{S}^{\mathrm{phys}}_i = \hbar\,\varepsilon_i \ge \hbar \ln 2.
$$
In particular, when a quasi-stationary cycle admits a positive operational-cost representation
$$
\Delta \mathcal{S}^{\mathrm{phys}}_i
=
\int_0^{\tau_i} E_{\mathrm{op},i}(t)\,dt
=
\bar E_i\tau_i,
$$
where $E_{\mathrm{op},i}(t)$ is the cycle's positive operational energy cost and $\bar E_i$ is its time average, it obeys
$$
\bar E_i\,\tau_i \ge \hbar \ln 2.
$$

*Proof.* From the action-entropy identity,
$$
\mathcal S^{\mathrm{phys}}=\hbar\sum_i \varepsilon_i,
$$
so a single cycle contributes $\Delta \mathcal S^{\mathrm{phys}}_i=\hbar\varepsilon_i$. By Theorem 31, $\varepsilon_i\ge \ln 2$. The quasi-stationary inequality follows from the stated positive operational-cost representation $\Delta\mathcal S^{\mathrm{phys}}_i=\bar E_i\tau_i$. ∎

**Remark Q.0.1: What Is and Is Not Derived.** The framework derives:
- The *existence* of $\hbar$ as a necessary conversion factor
- The *meaning* of $\hbar$ as action-per-nat of SPAP entropy  
- The *role* of $\hbar$ in connecting discrete and continuous descriptions

The framework does not derive the numerical value $\hbar \approx 1.055 \times 10^{-34}$ J·s from pure logic. This value is fixed by one measurement, just as the numerical value of $c$ requires measuring the speed of light. The framework explains *what* $\hbar$ is; experiment determines *how much* it is.


### Q.0.5 Stationary Action as Stationary SPAP Entropy

**Definition Q.0.2a (Holonomy Sector).** A *holonomy sector* is an equivalence class of paths sharing the same topological winding number $k \in \mathbb{Z}$ (Theorem Q.0.4). Variations within a sector preserve $k$.

**Corollary Q.0.3 (Stationary Action as Stationary Entropy).** Within a fixed holonomy sector (Definition Q.0.2a), the action stationarity condition

$$\delta \mathcal{S} = 0$$

is equivalent to stationarity of the total SPAP entropy production:

$$\delta \left( \sum_i \varepsilon_i \right) = 0$$

*Proof.* By Corollary Q.0.1, $\mathcal{S}/\hbar = \sum_i \varepsilon_i$ exactly. For variations within a fixed holonomy sector (where the topological winding number $k$ in Theorem Q.0.4 is constant), $\delta(\mathcal{S}/\hbar) = \delta(\sum_i \varepsilon_i)$, hence $\delta\mathcal{S} = 0 \iff \delta(\sum_i \varepsilon_i) = 0$. QED

**Physical Interpretation:** The action principle is the continuum Euler–Lagrange expression of stationarity of the total SPAP entropy cost under admissible variations. Whether a stationary history is a minimum depends on the usual second-variation conditions.

This resolves the foundational puzzle: the action principle is not an unexplained postulate but a consequence of the Principle of Compression Efficiency operating through the irreducible costs of predictive processing.

### Q.0.6 Connection to the Path Integral

The Action-Entropy Identity provides an information-theoretic interpretation of the Feynman path integral.

**Proposition Q.0.2 (Path Integral as Entropy Sum).** The path integral amplitude:

$$\langle \phi_f | \phi_i \rangle = \int \mathcal{D}\phi \, e^{i\mathcal{S}[\phi]/\hbar}$$

admits the interpretation:

$$\langle \phi_f | \phi_i \rangle = \int \mathcal{D}\phi \, e^{i \sum_k \varepsilon_k[\phi]}$$

where $\sum_k \varepsilon_k[\phi]$ is the total SPAP entropy cost along path $\phi$.

*Proof.* Direct substitution of the Action-Entropy Identity (Corollary Q.0.1). The phase factor is oscillatory because it is a unit-modulus complex phase $e^{i\mathcal{S}[\phi]/\hbar} = e^{i\sum_k\varepsilon_k[\phi]}$ with real exponent; interference is controlled by relative phase differences (including overhead contributions when some cycles have $\varepsilon_k > \ln 2$). QED

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
E[\phi]=\mathcal S[\phi]/\hbar,
$$
giving the path-amplitude form. For countable $\mathcal H$, normal convergence on compact subsets gives analyticity by the Weierstrass theorem on the stated domain. Boundary or off-domain phase evaluations are not automatic; they are exactly the finite-cutoff oscillatory limits stated in the hypothesis. ∎

**Corollary Q.0.4 (Interference as Entropy Phase Matching).** Quantum interference arises from the phase accumulated through irreversible predictive operations:

$$\phi_{quantum} = \frac{\mathcal{S}}{\hbar} = \sum_i \varepsilon_i$$

Paths with equal total SPAP entropy cost (mod 2π) interfere constructively. The discrete structure of irreversible operations underlies the wave-like behavior of quantum mechanics.


### Q.0.6.1 Landauer Character Duality

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

## Q.0.7 The Landauer Phase Structure and Emergent U(1)

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

**Theorem Q.0.7k (Continued-Fraction Spectrum of Exceptionally Low Overhead).** *Let:*
$$\alpha_L = \frac{\ln 2}{2\pi} = [0; a_1, a_2, a_3, \ldots]$$

*be the continued fraction expansion, and let $p_n/q_n$ be its convergents. Then:*

1. *(Best-approximation property) $p_n/q_n$ are best rational approximants: for all integers $p, q$ with $1 \leq q \leq q_n$:*
$$\left|\alpha_L - \frac{p_n}{q_n}\right| \leq \left|\alpha_L - \frac{p}{q}\right|$$
*Equivalently, $|q_n\alpha_L - p_n|$ is minimal among $1 \leq q \leq q_n$.*

2. *(Universal error bound):*
$$\left|\alpha_L - \frac{p_n}{q_n}\right| < \frac{1}{q_n^2}$$
*hence the associated holonomy mismatch obeys:*
$$|2\pi p_n - q_n \ln 2| = 2\pi q_n \left|\alpha_L - \frac{p_n}{q_n}\right| < \frac{2\pi}{q_n}$$

3. *(Converse characterization) If $|\alpha_L - p/q| < 1/(2q^2)$ with $\gcd(p,q) = 1$, then $p/q$ is a convergent of $\alpha_L$.*

*Proof.* Standard continued-fraction theory [Hardy & Wright 1979; Khinchin 1964]: (1) and (3) are the defining extremal property of convergents; (2) follows from the classical inequality $|\alpha - p_n/q_n| < 1/q_n^2$ for convergents. $\square$

**Corollary Q.0.7k′ (Legendre Criterion: When Small Overhead Forces a Convergent).** *If integers $k, N \geq 1$ satisfy:*
$$\left|\alpha_L - \frac{k}{N}\right| < \frac{1}{2N^2}$$

*equivalently:*
$$|N\ln 2 - 2\pi k| < \frac{\pi}{N}$$

*then $k/N$ is a convergent of $\alpha_L$.*

*Proof.* This is exactly Legendre's theorem on continued fractions [Hardy & Wright 1979, Theorem 184]. $\square$

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

*The constant $\sqrt{5}$ is optimal in the sense of Hurwitz (its extremizer is the golden ratio $\varphi = (1+\sqrt{5})/2$), explaining the universality of "golden-ratio crossover" bounds in discrete-to-continuum approximation.*

---

### Q.0.7.12 Three-Gap Structure

**Proposition Q.0.7n (Three-Gap Structure for Finite-$N$ Phase Sets).** *For any $N_{\max} \geq 1$, the finite set of points:*
$$\{e^{in\ln 2} : 0 \leq n < N_{\max}\} = \{e^{2\pi i n\alpha_L} : 0 \leq n < N_{\max}\}$$

*partitions the unit circle into arcs taking at most three distinct lengths (the three-gap / three-distance theorem).*

*Proof.* This is the Steinhaus–Sós–Świerczkowski three-gap theorem [Steinhaus 1957; Sós 1958; Świerczkowski 1958; Marklof & Strömbergsson 2017] applied to the irrational rotation by $\alpha_L$. $\square$

**Physical Interpretation.** At any finite cycle budget, the accessible phases cluster with a characteristic three-gap structure determined by the continued fraction of $\alpha_L$. This provides the microscopic mechanism underlying the transition from discrete to continuous phase distributions.

---

### Q.0.7.13 Finite-Budget Interference Selection

**Corollary Q.0.7o (Finite-Budget Interference Selection Rule).** *Let two SPAP-minimum paths have cycle difference $n := |N[\phi_1] - N[\phi_2]|$. The phase mismatch modulo $2\pi$ is:*
$$\Delta\theta(n) := \inf_{k \in \mathbb{Z}} |(n\ln 2) - 2\pi k| = 2\pi \|n\alpha_L\|$$

*Then:*

1. For a fixed cycle budget $1 \leq n \leq N_{\max}$, the smallest achievable mismatch is attained when $n$ is a convergent denominator $q_j \leq N_{\max}$ (including $q_0 = 1$ for the $0/1$ convergent), and satisfies:
$$\Delta\theta(q_j) = 2\pi \|q_j \alpha_L\| < \frac{2\pi}{q_{j+1}}$$

2. *Consequently, the near-constructive interference events under a finite $N_{\max}$ budget are dominated by differences $n$ in the convergent-denominator set $\{q_j\}$ (and their standard semiconvergent refinements), because these are precisely the indices that realize record-small $\|n\alpha_L\|$*

*Proof.* This is the standard "best approximation" extremality of continued-fraction convergents translated into the rotation mismatch $\|n\alpha_L\|$. $\square$

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

**Remark Q.0.7p.1: PCE Selection of Overhead Distribution.** The probability law $P(\Delta)$ is not arbitrary but is determined by the PCE dynamics (Appendix D). Near the PCE-Attractor (Definition 15a), overhead fluctuations are suppressed by the cost function $V_{op}$ (Definition D.1), leading to concentration of $P(\Delta)$ near zero. The decoherence mechanism thus becomes significant only away from the attractor, providing a natural explanation for the emergence of classical behavior in non-optimal configurations.

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

**Remark Q.0.7t.1: Physical Selection of Generators.** The framework selects the generators satisfying the Lie algebra spanning condition through the PCE dynamics. The SPAP involution $\sigma_x$ (Theorem G.10.2) provides one generator in $SU(2)$, while the interface dynamics (Section G.8) generate additional elements through the QFI mode structure. The non-commutativity of these generators ensures that the generated subgroup spans the full $\mathfrak{su}(2)$ algebra.

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

The central result—that continuous $U(1)$ gauge symmetry emerges as the operational closure of a discrete subgroup generated by the Landauer phase step—provides a microscopic foundation for gauge structure without assuming continuous symmetry *ab initio*.


### Q.0.8 Action Quantization and the Computational Structure of Interference

The Action-Entropy Identity (Corollary Q.0.1) establishes that $\mathcal{S}/\hbar = \sum_i \varepsilon_i$. At the SPAP minimum, each irreversible cycle contributes $\varepsilon_0=\ln2$ nats (Theorem 31, Appendix J). This section derives the conditions under which the total cycle count $N$ is constrained to discrete values, yielding a quantization of action with observable consequences.

---

#### Q.0.8.1 The Cycle Number

**Definition Q.0.2 (Cycle Number).** For a process $\phi$ in the MPU network, the *cycle number* is the total count of irreversible SPAP operations:

$$N[\phi] := \#\{\text{SPAP cycles along } \phi\}$$

When all cycles operate at the SPAP minimum (Theorem 31), the action associated with $\phi$ is:

$$\mathcal{S}[\phi] = N[\phi] \cdot \hbar \ln 2$$

More generally, for cycles with entropy costs $\varepsilon_i \geq \ln 2$:

$$\mathcal{S}[\phi] = \hbar \sum_{i=1}^{N[\phi]} \varepsilon_i \geq N[\phi] \cdot \hbar \ln 2$$

**Proposition Q.0.3 (Discrete Integrality).** *In the fundamental MPU network description, $N[\phi] \in \mathbb{Z}_{\geq 0}$ for all processes $\phi$.*

*Proof.* Each SPAP cycle is an atomic operation implementing the 2-to-1 state merge (Lemma J.1, Appendix J). The merge operation maps 4 logical input states $\{(\phi, p)\} = \{0,1\} \times \{0,1\}$ to 2 logical output states $\{0,1\} \times \{p_{\text{ready}}\}$ (Section J.2). A cycle either occurs or does not; fractional cycles have no operational meaning within the discrete network because the state merge is atomic—there is no intermediate state between the 4-state input space and the 2-state output space. The path integral over the discrete network sums over histories with well-defined integer cycle counts. $\square$

---

#### Q.0.8.2 Topological Quantization for Closed Paths

For processes forming closed loops in configuration space, single-valuedness of the quantum amplitude imposes quantization conditions.

**Theorem Q.0.4 (Holonomy Quantization).** *Let $\gamma$ be a closed path in the configuration space $\mathcal{M}$ of a physical system. If the amplitude $\langle \phi | \phi \rangle_\gamma$ around $\gamma$ must be single-valued, then the total phase satisfies:*

$$\oint_\gamma \frac{d\mathcal{S}}{\hbar} = 2\pi k, \quad k \in \mathbb{Z}$$

*By the Action-Entropy Identity (Corollary Q.0.1), this becomes:*

$$\oint_\gamma \sum_i \varepsilon_i = 2\pi k$$

*Proof.* Single-valuedness requires $e^{i\oint d\mathcal{S}/\hbar} = 1$, hence $\oint d\mathcal{S}/\hbar \in 2\pi\mathbb{Z}$. Substituting the Action-Entropy Identity gives the result. This is the standard Bohr-Sommerfeld-Wilson quantization condition [Sommerfeld 1916; Wilson 1915], here derived from the information-theoretic foundation. $\square$

**Corollary Q.0.4a (SPAP-Minimum Closed-Sector Obstruction).** *For processes where all cycles operate at the structural SPAP minimum $\varepsilon_i=\varepsilon_0=\ln 2$ (Theorem 31), an exact closed phase sector must satisfy*
$$
N_\gamma\ln2=2\pi k,
\qquad
N_\gamma,k\in\mathbb Z.
$$
*Since $\ln2/(2\pi)$ is irrational, the only exact solution is $N_\gamma=k=0$. Thus every nontrivial closed holonomy sector requires either positive overhead above the Landauer baseline or finite-resolution phase tolerance.*

*Proof.* If $N_\gamma\ln2=2\pi k$ with $N_\gamma\ne0$, then $\ln2/(2\pi)=k/N_\gamma$ would be rational, contradicting Lemma Q.0.7b. Hence $N_\gamma=0$, and then $k=0$. ∎

**Remark Q.0.4b: Non-Integer Period and Resolution.** The formal real-valued period $\Delta N_0=2\pi/\ln2\approx9.0647$ is not an admissible integer cycle period. Lemma Q.0.7b establishes that this ratio is irrational via the Gelfond–Schneider argument. This creates a tension between two constraints:

1. *Discrete constraint:* Integer cycle counts $N\in\mathbb Z$ are enforced by the atomic structure of SPAP operations (Proposition Q.0.3).

2. *Interference constraint:* Constructive interference requires $N_\gamma\ln2=2\pi k$ for integer $k$.

Since exact satisfaction of both constraints is impossible for any nontrivial closed path with all cycles at the Landauer minimum, the resolution occurs in two regimes:

**(a) Macroscopic regime ($N \gg 1$):** The $\Gamma$-convergence (Theorem Q.0.1) maps the discrete action to the continuum action. For macroscopic processes with $N \gg 1$, the fractional part of $N\cdot \ln 2/(2\pi)$ samples $[0,1)$ quasi-uniformly by Weyl's equidistribution theorem, and the phases $\{e^{iN\ln 2}\}_{N\in\mathbb{Z}}$ are dense in $U(1)$ (Theorem Q.0.7d). The effective phase distribution becomes continuous.

**(b) Fundamental regime (finite $N$):** Only specific closed paths with integer cycle counts satisfying $|N\ln 2 - 2\pi k| < \delta$ for small tolerance $\delta$ exhibit approximate constructive interference. Corollary Q.0.7o characterizes record-small mismatches as convergent-denominator pairs from the continued fraction of $\alpha_L = \ln 2/(2\pi)$.

---

#### Q.0.8.3 Vacuum Excitation Structure from Leech Geometry

The Leech lattice structure of the vacuum (Theorem Z.8c and Corollary Z.8d.1, Appendix Z) provides constraints on excitations above the ground state. Theorem Z.8c identifies the Leech lattice as the unique rootless even unimodular lattice in 24 dimensions, and Corollary Z.8d.1 links PCE optimization to selection of that confining vacuum. The derivation chain proceeds: SPAP → Landauer cost → Golay code → rootlessness → Leech lattice.

**Proposition Q.0.5 (Shell Structure).** *Excitations above the PCE-Attractor vacuum correspond to Leech lattice vectors $v \in \Lambda_{24}$ with squared norm $|v|^2 \in \{0, 4, 6, 8, 10, 12, \ldots\}$. The minimum non-trivial excitation has $|v|^2_{\min} = 4$.*

*Proof.* 

**Step 1 (Leech lattice from rootless uniqueness).** By Theorem Z.8c, the unique rootless even unimodular lattice in 24 dimensions is the Leech lattice $\Lambda_{24}$. Corollary Z.8d.1 establishes that PCE uniquely selects the Leech lattice $\Lambda_{24}$ as the vacuum configuration among the 24 Niemeier lattices. The extended binary Golay code $\mathcal{G}_{24} = [24, 12, 8]$ is selected by PCE optimization (Theorem Z.13) as the unique optimal error-correcting code on $M = 24$ interface modes. The Leech lattice $\Lambda_{24}$ is constructed from $\mathcal{G}_{24}$ via the gluing construction [Conway & Sloane 1999]: the base lattice $L_0 = \sqrt{2}E_8 \oplus \sqrt{2}E_8 \oplus \sqrt{2}E_8$ is extended by Golay-determined cosets,

$$\Lambda_{24} = \bigcup_{c \in \mathcal{G}_{24}} (g_c + L_0)$$

where $g_c$ are glue vectors determined by codeword $c$. This yields a disjoint union of $|\mathcal{G}_{24}| = 2^{12} = 4096$ cosets (Lemma R.4.5).

**Step 2 (Rootlessness).** The Leech lattice is the unique even unimodular lattice in 24 dimensions with no vectors of squared norm 2 [Conway 1969]. This rootlessness follows from the minimum distance $d = 8$ of the Golay code: vectors in $L_0$ have minimum squared norm 4 (from the $\sqrt{2}$ scaling), and the Golay code's minimum weight 8 ensures that glue-shifted vectors also satisfy $|v|^2 \geq 4$ (Proposition R.4.2a).

**Step 3 (Shell structure).** The theta series of the Leech lattice [Conway & Sloane 1999]:

$$\Theta_{\Lambda_{24}}(q) = 1 + 196560 q^4 + 16773120 q^6 + 398034000 q^8 + \cdots$$

confirms $|v|^2 \in \{0, 4, 6, 8, \ldots\}$ with the 196,560 minimal vectors at $|v|^2 = 4$. $\square$

**Theorem Q.0.5a (Mass-Action Correspondence on the Canonical Norm-Information and Saturated-Boundary Branches).** *On the canonical Leech norm-information calibration branch of Appendix Z (Definition Z.8f / Theorem Z.8g, under which $\mathcal{I}_{\mathrm{rel}}(v) = |v|$) and the saturated-boundary mass-information branch of Appendix N (Theorem N.5, under which $m = \mu_0 \mathcal{I}_{\mathrm{rel}}$), a vacuum excitation corresponding to Leech lattice vector $v$ satisfies:*

$$m^2(v) = \mu_0^2 \cdot |v|^2$$

*where $\mu_0 = m_P/(2\sqrt{8\varepsilon_0})$ is the structural fundamental mass scale (Definition Z.8f, Appendix Z).*

*Proof.* On the saturated-boundary mass-information branch, Theorem N.5 (Appendix N) gives $m = \mu_0 \mathcal{I}_{\mathrm{rel}}$ for inertial mass in terms of relational information content. On the canonical Leech norm-information calibration branch, the relational information content of an excitation labeled by $v \in \Lambda_{24}$ satisfies $\mathcal{I}_{\mathrm{rel}}(v) = |v|$. Combining these two branch identifications,

$$m(v) = \mu_0 |v|, \quad \mu_0 := \frac{m_P}{2\sqrt{8\varepsilon_0}} = \frac{m_P}{2\sqrt{8 \ln 2}} \approx 0.212 \, m_P,$$

and squaring yields the stated relation. Neither branch follows from Leech shell structure alone; the absolute mass scale and discrete spectrum inherit both branch dependencies. $\square$


**Remark Q.0.5a.1: Derivation Chain.** The mass-lattice correspondence follows from the derivation chain established in Appendices Z, R, and N. Each step connects SPAP entropy to the Leech lattice structure via the Golay code, with the mass spectrum emerging from the lattice geometry through the Mass-Information Equivalence (Theorem N.5).

**Remark Q.0.5a.2: Phenomenological Status.** The Leech lattice shell structure provides a discrete mass spectrum at the fundamental scale. Connection to observed particle masses requires: (i) identification of vacuum excitations with physical particles, (ii) symmetry breaking mechanisms selecting specific lattice points, and (iii) RG flow from $\mu_0 \sim 0.2 \, m_P$ to electroweak scales. These developments appear in Appendices R (fermion generations) and T (electroweak hierarchy).

**Corollary Q.0.5b (Landauer-Shell Correspondence).** *The minimum Leech shell $|v|^2_{\min} = 4$ equals the squared Landauer pointer dimension $a^2 = 4$. This equality traces through the derivation chain:*

$$\varepsilon_0=\ln 2 \xrightarrow{\text{Thm Z.1}} a = 2 \xrightarrow{} a^2 = 4 = |v|^2_{\min}$$

*Proof.* On the attractor-saturating branch, Theorem Z.1 gives $a = 2$, so $a^2 = 4$. The equality $|v|^2_{\min} = 4$ follows from Leech lattice rootlessness (Proposition Q.0.5). Both quantities therefore meet at the common value 4 on that branch. $\square$

**Corollary Q.0.5c (Discrete Mass Spectrum).** *The allowed squared masses for vacuum excitations form the discrete set:*

$$m^2 \in \{0, 4, 6, 8, 10, 12, \ldots\} \times \mu_0^2$$

*The mass gap is $\Delta_{\text{gap}} = 2\mu_0$, where $\mu_0 = m_P/(2\sqrt{8\varepsilon_0})$ is the fundamental mass scale (Definition Z.8f, Corollary Z.8g.1).*

---

#### Q.0.8.4 The Phase-Bit Correspondence

**Corollary Q.0.6 (Phase-Bit Correspondence).** *For processes at the SPAP minimum with cycle number $N$, the quantum phase factor admits the representation:*

$$\boxed{e^{i\mathcal{S}/\hbar} = e^{iN\ln 2} = 2^{iN}}$$

*Proof.* Direct substitution of $\mathcal{S} = N\hbar\ln 2$ (from the Action-Entropy Identity at SPAP minimum) into $e^{i\mathcal{S}/\hbar}$:

$$e^{i\mathcal{S}/\hbar} = e^{iN\hbar\ln 2/\hbar} = e^{iN\ln 2}$$

The identity $e^{iN\ln 2} = 2^{iN}$ follows from the definition $2^z := e^{z \ln 2}$ for complex $z$, which is the standard principal branch of the complex exponential. $\square$

**Physical Interpretation.** This correspondence unifies three domains:

| Domain | Quantity | Role in Correspondence |
|:-------|:---------|:-----------------------|
| Quantum mechanics | $e^{i\mathcal{S}/\hbar}$ | Phase factor governing interference |
| Thermodynamics | $\varepsilon_0=\ln 2$, $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0$ | Structural SPAP entropy quantum and physical implementation bound (Theorem 31) |
| Computation | $N$ | Count of irreversible logical operations |

The path integral sums phases $2^{iN}$ over histories, with $N$ counting irreversible computational steps. Interference arises from the complex arithmetic of these phase contributions.

**Corollary Q.0.6a (Constructive Interference Condition).** *Two paths $\phi_1, \phi_2$ with cycle numbers $N_1, N_2$ at the SPAP minimum interfere constructively when:*

$$2^{iN_1} + 2^{iN_2} \text{ is maximized} \iff (N_1 - N_2)\ln 2 = 2\pi k, \quad k \in \mathbb{Z}$$

*Proof.* Constructive interference requires $\arg(2^{iN_1}) = \arg(2^{iN_2}) \mod 2\pi$, i.e., $N_1 \ln 2 = N_2 \ln 2 + 2\pi k$. Rearranging gives $(N_1 - N_2) \ln 2 = 2\pi k$. Because $\alpha_L = \ln 2/(2\pi)$ is irrational (Lemma Q.0.7b), there is no nonzero integer $\Delta N = N_1 - N_2$ giving exact constructive matching; exact constructive interference at SPAP minimum occurs only for $\Delta N = 0$ (Corollary Q.0.7c). Finite-budget near-constructive events are controlled by the best rational approximants of $\alpha_L$ (Corollary Q.0.7o). $\square$

---

#### Q.0.8.5 Observable Consequences

**Theorem Q.0.7 (Conditions for Integer $N$).** *The cycle number $N$ is constrained to integer values under the following conditions:*

1. **Fundamental processes:** Any process in the discrete MPU network has $N \in \mathbb{Z}$ by construction (Proposition Q.0.3).

2. **Topological sectors:** Processes classified by discrete topological invariants (winding numbers, instanton numbers) have cycle counts related to the invariant structure through the holonomy condition (Theorem Q.0.4).

3. **Vacuum excitations at integer shells:** For Leech lattice excitations with $|v|^2 = 4n$ ($n \in \mathbb{Z}_{>0}$), the shell index $n$ is integral by lattice structure.

**Proposition Q.0.8 (Structural Predictions).** *The discrete structure predicts:*

1. **Mass spectrum discreteness:** Excitation masses satisfy $m^2 \propto |v|^2 \in \{4, 6, 8, \ldots\}$ (Theorem Q.0.5a), not a continuum. The mass gap $\Delta_{\text{gap}} = 2\mu_0$ arises from $|v|^2_{\min} = 4$.

2. **Phase coherence signatures:** Interference between paths differing by $\Delta N = 1$ (one SPAP cycle at the minimum) produces a phase shift of:
   $$\Delta\phi = \ln 2 \approx 0.6931 \text{ radians} \approx 39.71°$$

3. **Minimum action bound:** The minimum non-trivial action for a single irreversible operation is:
   $$\mathcal{S}_{\min} = \hbar \ln 2 \approx 7.31 \times 10^{-35} \text{ J·s}$$
   
   Processes requiring action below this threshold cannot involve irreversible predictive operations.

**Remark Q.0.8a: Experimental Accessibility.** These predictions operate at the Planck scale: $\mathcal{S}_{\min} = \hbar \ln 2 \approx 0.69\hbar$ represents a sub-Planck action, and the fundamental mass scale $\mu_0 \approx 0.21 \, m_P$ is near the Planck mass. Direct experimental verification lies beyond current technology. The predictions are nonetheless falsifiable in principle through:

(i) Precision tests of quantum coherence at mesoscopic scales where $N$ is moderately small

(ii) Cosmological signatures where Planck-scale physics imprints on large-scale structure

(iii) Derived consequences at accessible scales—particle mass ratios, coupling constants, and symmetry structures (Sections 13, G.8.4, Appendix T)

**Remark Q.0.8b: Sub-Planck Action.** The minimum action $\mathcal{S}_{\min} = \hbar \ln 2 < \hbar$ is sub-Planckian. This does not violate uncertainty relations because the bound applies to complete irreversible cycles, not to arbitrary measurements. The time-energy uncertainty $\Delta E \cdot \Delta t \gtrsim \hbar/2$ constrains measurement precision, while $\mathcal{S}_{\min}$ constrains the action of completed logical operations.

**Theorem Q.0.8c (Minimum Observable Mass).** For any finite-resource observational protocol $\mathcal{P}$ of total duration $T_{\mathcal{P}} < \infty$, the minimum mass distinguishable from zero by $\mathcal{P}$ satisfies

$$
m_{\min}(\mathcal{P}) \ge \frac{\pi\hbar}{2c^2 T_{\mathcal{P}}} > 0.
$$

*Proof.* To operationally distinguish a massive system ($m > 0$) from a massless one, the protocol must detect a dynamical difference attributable to the rest energy $E_0 = mc^2$ (Theorem 46). By the Margolus-Levitin quantum speed limit (derivable within PU from the bounded spectral structure of the MPU Hamiltonian, Theorem 29), a quantum system with energy $E$ requires time $t \geq \pi\hbar/(2E)$ to evolve to an orthogonal (operationally distinguishable) state. For the protocol to distinguish "mass $m$ present" from "mass $m$ absent" within duration $T_{\mathcal{P}}$, the rest energy must satisfy $mc^2 \geq \pi\hbar/(2T_{\mathcal{P}})$, yielding the bound. The strict positivity $m_{\min} > 0$ follows from $T_{\mathcal{P}} < \infty$. ∎

**Remark Q.0.8d (PCE-Attractor Mass Scale).** At the canonical PCE-Attractor protocol duration $T_{\mathcal{P}}^* = \delta/c = \sqrt{8\ln 2} \cdot L_P/c = \sqrt{8\ln 2} \cdot t_P$ (Eq. Q.18), Theorem Q.0.8c yields the lower bound $m_{\min}^* \ge \pi m_P/(2\sqrt{8\ln 2}) \approx 0.667 \, m_P$, providing a framework-internal minimum mass scale that depends only on the derived constants $\varepsilon_0=\ln2$ and $\delta = \sqrt{8\ln 2} \cdot L_P$, with no adjustable parameters. The conjecture that this value constitutes a universal mass gap for the framework requires the additional assumption that the PCE-Attractor canonical protocol is the physically realized protocol (Appendix Z).

---

#### Q.0.8.6 Relation to Standard Quantization

**Proposition Q.0.9 (Emergence of Bohr-Sommerfeld Quantization).** *The Bohr-Sommerfeld condition $\oint p \, dq = nh$ (with $h = 2\pi\hbar$) emerges as an effective description in regimes where:*

1. *The number of SPAP cycles is large: $N \gg 1$*
2. *The cycle-by-cycle discreteness is unresolvable*
3. *Topological constraints enforce phase coherence*

*Proof.* 

**Step 1 (Quantization unit ratio).** The ratio of the Bohr-Sommerfeld quantum to the SPAP quantum is:

$$\frac{h}{\hbar \ln 2} = \frac{2\pi\hbar}{\hbar \ln 2} = \frac{2\pi}{\ln 2} \approx 9.0647$$

**Step 2 (Cycle-action correspondence).** For a closed orbit with cycle count $N$ and per-cycle entropy costs $\varepsilon_i$, the action satisfies:
$$\frac{\mathcal{S}}{\hbar} = \sum_{i\in\gamma}\varepsilon_i = N\ln 2 + \Delta[\gamma]$$
where $\Delta[\gamma] := \sum_{i\in\gamma}(\varepsilon_i-\ln 2)\ge 0$ (Definition Q.0.7e). Holonomy quantization requires:
$$\frac{\mathcal{S}}{\hbar} = 2\pi k \quad\text{(Theorem Q.0.4)}$$
hence:
$$N\ln 2 + \Delta[\gamma] = 2\pi k$$
At strict SPAP minimum ($\Delta[\gamma]=0$), this would require $N = (2\pi/\ln 2)k$, which is impossible for integer $N$ when $k\ne 0$ because $2\pi/\ln 2$ is irrational (Lemma Q.0.7b). Therefore any nontrivial quantized loop sector $k\ne 0$ requires overhead $\Delta[\gamma]>0$ (Corollary Q.0.7g).

**Step 3 (Quantization from interference).** The interference condition (Theorem Q.0.4) requires the total phase around a closed orbit to satisfy $\mathcal{S}/\hbar = 2\pi k$ for integer $k$. Therefore the allowed actions are:

$$\mathcal{S} = 2\pi k \hbar = k h$$

where $h = 2\pi\hbar$ is Planck's constant and $k \in \mathbb{Z}_{>0}$ is the quantum number.

**Step 4 (Bohr-Sommerfeld emergence).** The result $\mathcal{S} = kh$ is the Bohr-Sommerfeld quantization condition $\oint p \, dq = kh$ with $k$ as the quantum number. For $k = 1$, the maximal baseline cycle count consistent with nonnegative overhead is:
$$N_1^* = \left\lfloor \frac{2\pi}{\ln 2} \right\rfloor = 9$$
with corresponding minimal sector overhead:
$$\Delta_1^+ = 2\pi - 9\ln 2 \approx 0.0449$$
Thus one quantum of action corresponds to $9$ SPAP-minimum cycles plus a small irreducible overhead.

**Step 5 (Geometric origin of $2\pi$).** The factor $2\pi$ arises because interference around a closed orbit requires phase coherence after one complete geometric cycle. The orbit's angular extent is $2\pi$ radians, introducing the geometric factor that converts the fundamental entropy unit $\ln 2$ to the orbital quantization unit $2\pi$. $\square$

**Remark Q.0.9a: Information-Theoretic Origin.** Unlike Bohr-Sommerfeld quantization (imposed as a postulate) or Dirac quantization (derived from canonical commutators), the present quantization derives from:

1. The logical structure of self-referential prediction (SPAP, Theorems 10–11)
2. The irreducible entropy cost $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$ (Theorem 31, Appendix J)
3. The PCE-optimal vacuum geometry (Leech lattice, Theorem Z.8c)

Action is quantized because physical processes are fundamentally computational, and computation has irreducible information-theoretic costs.

---

#### Q.0.8.7 Summary

This section has established:

1. **Discrete Integrality:** $N \in \mathbb{Z}$ at the fundamental (MPU network) level (Proposition Q.0.3)

2. **Phase-Bit Correspondence:** $e^{i\mathcal{S}/\hbar} = 2^{iN}$ at the SPAP minimum (Corollary Q.0.6)

3. **Topological Constraints:** Closed-path holonomies satisfy $\oint \sum_i \varepsilon_i = 2\pi k$ (Theorem Q.0.4)

4. **Vacuum Shell Structure:** Excitations have $m^2 = \mu_0^2 |v|^2$ with $|v|^2 \in \{4, 6, 8, \ldots\}$ from Leech geometry (Theorem Q.0.5a)

5. **Bohr-Sommerfeld Emergence:** Standard quantization in units of $h = 2\pi\hbar$ arises from the interference condition on closed orbits (Proposition Q.0.9)

6. **Structural Predictions:** Discrete mass spectrum, minimum action $\hbar \ln 2$, characteristic phase shift of 39.71° per cycle (Proposition Q.0.8)

The correspondence "interference = modular arithmetic of irreversible bits" is a quantitative consequence of the Action-Entropy Identity.

---

### Q.0.9 The Rindler–Landauer Cycle Time

This section derives a characteristic timescale for irreversible computation in the presence of a causal horizon, emerging from the intersection of horizon thermodynamics, information theory, and the Action-Entropy Identity.

---

#### Q.0.9.1 The Three Ingredients

The derivation combines three established results:

**Ingredient 1 (Unruh Temperature).** An observer undergoing constant proper acceleration $a$ perceives the Minkowski vacuum as a thermal bath at temperature [Unruh 1976]:

$$T_U(a) = \frac{\hbar a}{2\pi k_B c}$$

This result follows from quantum field theory in curved spacetime and is kinematic—it depends only on the existence of a Rindler horizon, not on the dynamical field equations (Theorem E.9.3, Appendix E).

**Ingredient 2 (Landauer Bound).** Erasing one bit of information into a thermal reservoir at temperature $T$ requires minimum heat dissipation [Landauer 1961; Bennett 1982]:

$$Q_{\min} = k_B T \ln 2$$

This bound is exact and saturated by optimal quasi-static erasure protocols. The entropy increase in the reservoir is $\Delta S = Q_{\min}/T = k_B \ln 2$.

**Ingredient 3 (SPAP Action Quantum).** One irreversible bit operation at the SPAP minimum costs action $\mathcal{S}_{\min} = \hbar \ln 2$ (Corollary Q.0.1, Theorem 31). 

**Derivation of E·τ = ℏ ln 2:** At the thermodynamic limit where the operation is quasi-static and all energy is dissipated as heat, the minimum energy for erasure equals the Landauer heat: $E_{\min} = Q_{\min} = k_B T \ln 2$. The cycle time $\tau$ is determined by requiring the action to equal the SPAP quantum:

$$\mathcal{S} = E_{\min} \cdot \tau = \hbar \ln 2$$

This relation holds specifically when operating at the Landauer limit with the SPAP entropy cost.

---

#### Q.0.9.2 The Characteristic Cycle Time

**Theorem Q.0.10 (Rindler–Landauer Cycle Time at the Thermodynamic Optimum).** *For an accelerated observer operating at the thermodynamic optimum (Landauer limit) with the Unruh bath as heat sink, the Landauer-saturating irreversible bit cycle time is:*

$$\boxed{\tau_U(a) = \frac{2\pi c}{a}}$$

*This is not an absolute minimum cycle time: by Remark Q.0.10a, processes dissipating $E > Q_{\min}$ per cycle achieve shorter cycle times $\tau = \hbar \ln 2 / E < \tau_U$. The formula gives the cycle time at minimum-energy / maximum-thermodynamic-efficiency operation.*


*All quantum and thermodynamic constants cancel. The result is purely geometric.*

*Proof.*

**Step 1 (Minimum heat dissipation).** With the Unruh bath at temperature $T_U(a)$ as heat sink, the Landauer bound (Ingredient 2) gives minimum heat per bit:

$$Q_{\min}(a) = k_B T_U(a) \ln 2 = k_B \cdot \frac{\hbar a}{2\pi k_B c} \cdot \ln 2 = \frac{\hbar a \ln 2}{2\pi c}$$

**Step 2 (Energy at Landauer limit).** At the thermodynamic optimum, all energy goes to heat dissipation. This idealization—operating exactly at the Landauer limit—gives:

$$E_{\min} = Q_{\min}(a) = \frac{\hbar a \ln 2}{2\pi c}$$

**Step 3 (Cycle time from action constraint).** By the Action-Entropy Identity at the SPAP minimum (Ingredient 3), the action for one bit operation is $\mathcal{S}_{\min} = \hbar \ln 2$. The corresponding cycle time is:

$$\tau_U = \frac{\mathcal{S}_{\min}}{E_{\min}} = \frac{\hbar \ln 2}{\hbar a \ln 2 / (2\pi c)} = \frac{\hbar \ln 2 \cdot 2\pi c}{\hbar a \ln 2} = \frac{2\pi c}{a}$$

**Step 4 (Cancellation verification).** The complete cancellation is verified algebraically:
- $\hbar$ cancels between numerator and denominator
- $\ln 2$ cancels between numerator and denominator  
- $k_B$ cancels within $Q_{\min}$

The result depends only on acceleration $a$ and the speed of light $c$. $\square$

**Remark Q.0.10a: Thermodynamic Optimum.** The derivation assumes operation exactly at the Landauer limit, where the dissipated heat per erased bit is minimized: $E = Q_{\min}$. If a real process dissipates additional energy $E > Q_{\min}$ per irreversible cycle, the SPAP-minimum action constraint $\mathcal{S}_{\min} = \hbar \ln 2$ implies a shorter cycle time:
$$
\tau = \frac{\mathcal{S}_{\min}}{E} = \frac{\hbar \ln 2}{E}
\le \frac{\hbar \ln 2}{Q_{\min}(a)} = \tau_U(a) = \frac{2\pi c}{a}.
$$
Equality is approached only in the quasi-static Landauer-saturating limit.

---

#### Q.0.9.3 Physical Interpretation

**Corollary Q.0.10b (Proper Time to Horizon).** *The cycle time $\tau_U = 2\pi c/a$ equals $2\pi$ times the light-crossing time to the Rindler horizon at proper distance $\ell_R = c^2/a$:*

$$\tau_U = 2\pi \cdot \frac{c}{a} = 2\pi \cdot \frac{\ell_R}{c}$$

*The factor $2\pi$ reflects the thermal periodicity of the Euclidean Rindler geometry [Unruh 1976; Gibbons & Hawking 1977].*

*Proof.* The Rindler horizon lies at proper distance $\ell_R = c^2/a$ from the accelerating observer. The light-crossing time is $\ell_R/c = c/a$. The Euclidean continuation of Rindler spacetime has periodicity $\beta = 2\pi c/a$ in imaginary time, corresponding to the inverse Unruh temperature:

$$\beta = \frac{\hbar}{k_B T_U} = \frac{\hbar}{k_B \cdot \hbar a/(2\pi k_B c)} = \frac{2\pi k_B c}{k_B \cdot a} = \frac{2\pi c}{a}$$

The cycle time $\tau_U = \beta$ inherits this thermal periodicity. $\square$

**Corollary Q.0.10c (Bit Rate at Thermodynamic Optimum).** *At the Landauer limit, the (Landauer-saturating) bit rate is:*
$$
\dot{N}_U = \frac{1}{\tau_U} = \frac{a}{2\pi c}.
$$

**Remark Q.0.10d: Not a Universal Speed Limit.** The cycle time $\tau_U$ is the characteristic timescale when operating at minimum energy (Landauer limit). An observer with access to additional energy can achieve shorter cycle times:

$$\tau = \frac{\hbar \ln 2}{E} < \tau_U \quad \text{when} \quad E > Q_{\min}(a)$$

The relation $\dot{N}_U = a/(2\pi c)$ applies specifically to thermodynamically optimal (Landauer-saturating) operation with the Unruh bath as heat sink. It is an efficiency-calibrated rate, not an absolute computational speed limit.

---

#### Q.0.9.4 The Cancellation Structure

**Proposition Q.0.10e (Structural Origin of Cancellation).** *The cancellation occurs because the three ingredients share a common origin in the information-thermodynamics of horizons:*

1. *Unruh temperature introduces $\hbar a / k_B$*
2. *Landauer bound introduces $k_B \ln 2$*
3. *Action-entropy identity introduces $\hbar \ln 2$*

*The product structure ensures exact cancellation.*

*Proof.* Computing explicitly:

$$\frac{Q_{\min}}{\hbar \ln 2} = \frac{k_B T_U \ln 2}{\hbar \ln 2} = \frac{k_B}{\hbar} \cdot T_U = \frac{k_B}{\hbar} \cdot \frac{\hbar a}{2\pi k_B c} = \frac{a}{2\pi c}$$

The cancellation is exact because all three quantities—Unruh temperature, Landauer bound, and SPAP action—derive from the same underlying structure: the thermodynamics of information at causal boundaries. The Unruh effect converts acceleration to temperature via $\hbar/k_B$; Landauer's principle converts temperature to energy via $k_B \ln 2$; the Action-Entropy Identity converts entropy to action via $\hbar \ln 2$. The three conversion factors compose to eliminate all non-geometric quantities. $\square$

---

#### Q.0.9.5 Limiting Cases

| Acceleration | Cycle Time $\tau_U$ | Bit Rate $\dot{N}_U$ | Physical Regime |
|:-------------|:--------------------|:---------------------|:----------------|
| $a \to 0$ | $\tau_U \to \infty$ | $\dot{N}_U \to 0$ | Inertial limit: Unruh bath vanishes |
| $a = c^2/L_P$ | $\tau_U = 2\pi t_P$ | $\dot{N}_U = 1/(2\pi t_P)$ | Planck acceleration |
| $a = g \approx 9.8$ m/s² | $\tau_U \approx 1.92 \times 10^{8}$ s | $\dot{N}_U \approx 5.2 \times 10^{-9}$ Hz | Earth surface gravity |

**Remark Q.0.10f: Inertial Limit.** For inertial observers ($a = 0$), the Unruh temperature vanishes and this analysis does not apply—a different heat sink must be specified. The divergence $\tau_U \to \infty$ reflects the absence of vacuum thermal resources, not an impossibility of computation. An inertial observer with access to a thermal bath at temperature $T$ has minimum cycle time:

$$\tau = \frac{\hbar \ln 2}{k_B T \ln 2} = \frac{\hbar}{k_B T}$$

**Remark Q.0.10g: Earth Gravity.** At Earth's surface gravity ($g \approx 9.8$ m/s²), the Unruh temperature is:

$$T_U = \frac{\hbar g}{2\pi k_B c} \approx 4.0 \times 10^{-20} \text{ K}$$

This corresponds to a cycle time of approximately 6 years ($1.92 \times 10^8$ s). The extremely slow rate reflects the minuscule thermal resources available from vacuum fluctuations at typical accelerations. Practical computation requires thermal baths at temperatures vastly exceeding the Unruh temperature.

---

#### Q.0.9.6 Connection to Horizon Information Bounds

**Proposition Q.0.10h (Consistency with Bekenstein Bound).** *The bit rate $\dot{N}_U = a/(2\pi c)$ is consistent with the Bekenstein bound [Bekenstein 1981] on information in a region of size $R = c^2/a$ (the Rindler horizon distance).*

*Proof.* The Bekenstein bound states $I \leq 2\pi ER/(\hbar c)$ for a system of energy $E$ confined to region of size $R$. Take the relevant energy scale to be the Landauer-minimum erasure heat into the Unruh bath,

$$E = Q_{min} = k_B T_U\ln 2,$$

and take the horizon distance scale $R=c^2/a$. Then the Bekenstein bound $I\le 2\pi E R/(\hbar c)$ gives
$$I_{\max} = \frac{2\pi (k_B T_U\ln 2)\,(c^2/a)}{\hbar c}
= \ln 2,$$
i.e., one bit (or $\ln 2$ nats) at the Landauer energy scale. The SPAP-minimum cycle dissipates $\ln 2$ nats per irreversible operation and therefore matches the bound’s scaling at the horizon energy scale. $\square$

---

#### Q.0.9.7 Summary

The Rindler–Landauer cycle time $\tau_U = 2\pi c/a$ emerges from combining:
- Horizon thermodynamics (Unruh temperature)
- Information thermodynamics (Landauer bound)  
- Quantum action (SPAP minimum)

The complete cancellation of $\hbar$, $k_B$, and $\ln 2$ reveals that **at causal boundaries, the computational cost of irreversibility is purely geometric**—determined only by acceleration and the speed of light.

This provides an information-theoretic interpretation of the Unruh effect: the vacuum thermal bath at temperature $T_U$ is precisely calibrated to support one irreversible bit operation per time $2\pi c/a$ at the thermodynamic optimum. The result is self-consistent with the Bekenstein bound (Proposition Q.0.10h), confirming that horizon thermodynamics and information theory share a common foundation in the framework's predictive structure.

---

### Q.0.9.8 Connection to Emergent Gravity

The Rindler-Landauer cycle time $\tau_U = 2\pi c/a$ is not merely a result about computation near horizons—it reveals the common geometric origin of gravity, thermodynamics, and information processing. This section establishes the precise connections to the framework's derivation of Einstein's field equations (Section 12).

---

#### Q.0.9.8.1 The Shared Structure

**Proposition Q.0.11 (Common Origin of Horizon Physics).** *The three quantities entering the Jacobson derivation of Einstein's equations (Section 12, Theorem 12.1) are identical to the three ingredients of the Rindler-Landauer cycle time (Theorem Q.0.10):*

| Jacobson Derivation | Rindler-Landauer Derivation | Common Origin |
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
3. SPAP action: $\mathcal{S}_{\min} = \hbar \ln 2$

Both derivations employ the same thermal structure (Unruh effect) and the same information-thermodynamic link (entropy cost of irreversible operations). The Jacobson derivation yields Einstein's equations; the Rindler-Landauer derivation yields $\tau_U = 2\pi c/a$. The shared ingredients ensure these results are not independent but manifestations of the same underlying structure. $\square$

---

#### Q.0.9.8.2 Black Hole Computational Rate

**Theorem Q.0.12 (Black Hole Bit Rate at the Thermodynamic Optimum).** *For a Schwarzschild black hole of mass $M$, the Landauer-saturating bit-erasure time at the horizon and the corresponding efficiency-calibrated bit rate are:*


$$\boxed{\tau_{BH} = \frac{8\pi GM}{c^3}, \qquad \dot{N}_{BH} = \frac{c^3}{8\pi GM}}$$

*Proof.* The surface gravity of a Schwarzschild black hole is $\kappa = c^4/(4GM)$. Substituting into the Rindler-Landauer formula (Theorem Q.0.10) with the equivalence principle identification $a \to \kappa$:

$$\tau_{BH} = \frac{2\pi c}{\kappa} = \frac{2\pi c \cdot 4GM}{c^4} = \frac{8\pi GM}{c^3}$$

The bit rate follows by inversion: $\dot{N}_{BH} = 1/\tau_{BH} = c^3/(8\pi GM)$. $\square$

**Corollary Q.0.12a (Mass-Rate Scaling).** *The black hole bit rate scales inversely with mass:*

$$\dot{N}_{BH} \propto M^{-1}$$

*Larger black holes compute slower. This follows from the temperature scaling $T_H \propto M^{-1}$: larger black holes are colder, providing fewer thermal resources for irreversible computation.*

**Corollary Q.0.12b (Numerical Values).**

| Black Hole Mass | $\tau_{BH}$ | $\dot{N}_{BH}$ |
|:----------------|:------------|:---------------|
| $M_\odot$ (solar) | $1.24 \times 10^{-4}$ s | $8.1 \times 10^{3}$ Hz |
| $10^6 M_\odot$ (galactic center) | $0.124$ s | $8.1$ Hz |
| $10^9 M_\odot$ (supermassive) | $124$ s | $8.1 \times 10^{-3}$ Hz |
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

#### Q.0.9.8.5 The Closed Derivation Loop

**Theorem Q.0.15 (Gravity-Computation Closed Chain on the Gravity-Bridge Package).** *On the gravity-bridge package — comprising (a) horizon saturation, (b) the local Rindler/KMS modular branch of Appendix F, (c) the Clausius relation $\delta Q = T \, dS$ at local Rindler horizons, and (d) the MPU stress-energy source construction of Appendix B — the following statements form a mutually consistent closed chain:*

1. *Einstein's field equations hold (Theorem 12.1)*
2. *Horizons satisfy the Bekenstein-Hawking area law (Theorem 49)*
3. *The gravitational constant is $G = \eta\delta^2 c^3/(4\hbar\chi C_{\max})$ (Equation E.9), on the area-law calibration and residual-budget branches*
4. *Horizon computational rate is $\dot{N} = \kappa/(2\pi c)$ (Theorem Q.0.12)*

*Each implication step uses one or more components of the bridge package; the closed-chain framing replaces the unconditional equivalence framing. This parallels the Theorem K.10.12 unified-origin chain in Appendix K, where the same gravity-bridge package is required for the channel-capacity-to-Einstein-equations route.*


*Proof.*

$(1) \Rightarrow (2)$: The Einstein equations, combined with the Raychaudhuri equation and horizon thermodynamics, yield the area law (Theorem 12.1, following Jacobson 1995).

$(2) \Rightarrow (3)$: The area law coefficient $1/(4G)$ is fixed by requiring Clausius consistency across all local Rindler horizons (Theorem E.5), yielding the expression for $G$ in terms of MPU parameters (Equation E.9).

$(3) \Rightarrow (4)$: Given $G$, the surface gravity $\kappa = c^4/(4GM)$ and Rindler-Landauer formula yield $\dot{N} = \kappa/(2\pi c)$ (Theorem Q.0.12).

$(4) \Rightarrow (1)$: The computational rate $\dot{N} = \kappa/(2\pi c)$, combined with the Bekenstein bound saturation (Proposition Q.0.10h), implies the entropy density $S/A = 1/(4L_P^2)$. This entropy density, via the Jacobson construction with the Clausius relation, yields the Einstein equations (Theorem 12.1). $\square$

**Corollary Q.0.15a (Self-Consistency).** *The PU framework's derivation of gravity is self-consistent: the gravitational constant derived from MPU information theory (Equation E.9) produces horizon computational rates (Theorem Q.0.12) that saturate the Bekenstein bound (Proposition Q.0.10h), which in turn requires the Einstein equations (Theorem 12.1) that define the horizons.*

---

#### Q.0.9.8.6 The Geometric Nature of Gravity

**Proposition Q.0.16 (Gravity as Geometric Computation).** *The cancellation of $\hbar$, $k_B$, and $\ln 2$ in the Rindler-Landauer formula demonstrates that at causal horizons, gravitational, thermodynamic, and information-theoretic descriptions reduce to pure geometry.*

*Proof.* The three cancelled quantities serve as inter-domain conversion factors:

| Constant | Converts | Appears in |
|:---------|:---------|:-----------|
| $\hbar$ | Action $\leftrightarrow$ Phase/Entropy | Unruh temperature, SPAP action |
| $k_B$ | Temperature $\leftrightarrow$ Energy | Unruh temperature, Landauer bound |
| $\ln 2$ | Bits $\leftrightarrow$ Nats | Landauer bound, SPAP action |

In the composition yielding $\tau_U$:
- Unruh effect introduces $\hbar/(k_B c)$
- Landauer bound introduces $k_B \ln 2$
- SPAP action introduces $\hbar \ln 2$

The product structure:

$$\tau_U = \frac{\hbar \ln 2}{k_B T_U \ln 2} = \frac{\hbar \ln 2}{k_B \cdot (\hbar a/2\pi k_B c) \cdot \ln 2} = \frac{2\pi c}{a}$$

exhibits exact cancellation because the three conversion factors form a closed loop in the space of physical quantities. At horizons—where gravity, thermodynamics, and information meet—the domain-specific descriptions collapse to geometry. $\square$

**Theorem Q.0.17 (Gravity from Computational Self-Consistency on the Gravity-Bridge Package).** *Given the local Rindler/KMS, Clausius, horizon-saturation, and MPU stress-energy assumptions of Theorem 12.1 (the gravity-bridge package of Theorem Q.0.15), and within the four-dimensional Lovelock hypothesis class, the Einstein field equations are the unique second-order geometric equations consistent with the requirement that the Landauer-saturating computational rate at every local Rindler horizon saturates, but does not exceed, the Bekenstein bound. Computational-rate saturation alone does not entail the Einstein equations without the bridge package; this theorem is a uniqueness statement within the Jacobson chain rather than as an independent derivation.*


*Proof.*

**Step 1 (Saturation requirement).** By Proposition Q.0.10h, the Rindler-Landauer rate $\dot{N}_U = a/(2\pi c)$ exactly saturates the Bekenstein bound for a horizon-sized region at thermal energy $k_B T_U$. This saturation must hold for all local Rindler horizons to maintain consistency between computational and information-theoretic descriptions.

**Step 2 (Geometric constraint).** Saturation of the Bekenstein bound at all local horizons requires the entropy density to equal $1/(4L_P^2)$ universally. This is the Bekenstein-Hawking value.

**Step 3 (Jacobson construction).** Universal Bekenstein-Hawking entropy density, combined with the Clausius relation $\delta Q = T \, \delta S$ at temperature $T = \kappa/(2\pi)$ for all local Rindler horizons, implies the Einstein equations (Theorem 12.1, following Jacobson 1995).

**Step 4 (Uniqueness).** By Lovelock's theorem, in four dimensions the Einstein tensor (plus cosmological constant) is the unique divergence-free symmetric tensor constructible from the metric and its first two derivatives. The Bekenstein-Hawking entropy density selects this tensor over higher-curvature alternatives (Uniqueness Lemma 12.1). $\square$

---

#### Q.0.9.8.7 Summary

| Result | Statement | Significance |
|:-------|:----------|:-------------|
| Proposition Q.0.11 | Jacobson and Rindler-Landauer share identical ingredients | Common origin established |
| Theorem Q.0.12 | $\tau_{BH} = 8\pi GM/c^3$ | Black hole computational timescale |
| Theorem Q.0.13 | $N_{total} \sim S_{BH}$ | Horizon processes its entropy |
| Theorem Q.0.14 | $G$ expressible via computational rate | Gravity-computation link |
| Theorem Q.0.15 | EFE $\Leftrightarrow$ Area law $\Leftrightarrow$ $G$ formula $\Leftrightarrow$ Computational rate | Closed equivalence loop |
| Proposition Q.0.16 | Constants cancel to pure geometry | Deep unity revealed |
| Theorem Q.0.17 | EFE from computational bound saturation | Gravity as self-consistency |

The Rindler-Landauer result $\tau_U = 2\pi c/a$ is not an isolated calculation but the computational face of the same structure that yields Einstein's equations. The cancellation of $\hbar$, $k_B$, and $\ln 2$ reveals that gravity, thermodynamics, and information theory are not three theories that happen to connect at horizons—they are three descriptions of a single geometric reality. The gravitational constant $G$, the Bekenstein-Hawking entropy, and the horizon computational rate are mutually determined by the requirement of self-consistency across all local causal boundaries.

---

#### Q.0.9.8.8 Effective Horizon MPU Count

**Theorem Q.0.18 (Effective Horizon MPU Count).** *For a Schwarzschild black hole of mass $M$, the horizon area measured in units of the PCE-optimal MPU area $\delta^2$ is*
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

**Corollary Q.0.18a (Entropy Decomposition at the PCE-Attractor).** *At the PCE-Attractor, the effective horizon MPU count and the per-channel capacity reproduce the Bekenstein-Hawking entropy:*
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

**Definition Q.0.7u (Horizon Closed-Loop Transfer Branch).** A horizon scattering mode lies on the **horizon closed-loop transfer branch** when the following additional bridge assumptions hold:

1. one near-horizon round trip of the mode is represented by a closed loop to which the Action–Entropy Identity and Holonomy Quantization clauses of Theorems Q.0.1 and Q.0.4 apply;
2. the dynamical round-trip phase is the dimensionless thermal phase
$$
x := \frac{\hbar\omega}{k_B T_H} = \omega\tau_H,
\qquad
\tau_H=\frac{2\pi c}{\kappa};
$$
3. on the PCE-Attractor branch, the MPU-cycle contribution to the same closed-loop phase is $N\ln 2$ modulo $2\pi$, with $N\in\mathbb Z_{\ge1}$;
4. resonant enhancement in the greybody response occurs at phase-matching points of the two descriptions.

This definition is a horizon-transfer branch condition. It is not a consequence of Theorems Q.0.1 and Q.0.4 alone.

**Lemma Q.0.7v (Thermal Phase Identity).** *For any horizon with Hawking temperature $k_B T_H=\hbar\kappa/(2\pi c)$ and Rindler–Landauer cycle time $\tau_H=2\pi c/\kappa$,*
$$
\frac{\hbar\omega}{k_B T_H}=\omega\tau_H.
$$

*Proof.* Multiplying $k_B T_H=\hbar\kappa/(2\pi c)$ by $\tau_H=2\pi c/\kappa$ gives $k_B T_H\,\tau_H=\hbar$. Dividing $\hbar\omega$ by $k_B T_H$ gives $\omega\tau_H$. $\square$

**Proposition Q.0.19 (Conditional Landauer Phase-Grid Signature).** *On the horizon closed-loop transfer branch of Definition Q.0.7u, resonant phase-matching points in the thermal variable $x=\hbar\omega/(k_B T_H)$ obey*
$$
x \equiv N\ln 2 \pmod{2\pi},
\qquad N\in\mathbb Z_{\ge1}.
$$
*Equivalently, after rescaling $x\mapsto x/(2\pi)$, the resonance grid is the irrational rotation orbit*
$$
\{N\alpha_L \bmod 1:N\in\mathbb Z_{\ge1}\},
\qquad
\alpha_L=\frac{\ln2}{2\pi}.
$$
*The orbit is dense and equidistributed in $[0,1)$, and every finite truncation partitions the circle into at most three distinct gap lengths.*

*Proof.* Definition Q.0.7u equates the dynamical closed-loop phase $x$ with the MPU-cycle phase $N\ln2$ modulo the single-valuedness period $2\pi$. Dividing by $2\pi$ gives the rotation by $\alpha_L$ on $\mathbb R/\mathbb Z$. Lemma Q.0.7b gives transcendence, hence irrationality, of $\alpha_L$. Irrational rotations are dense and equidistributed by Weyl equidistribution. The finite-truncation gap statement is Proposition Q.0.7n applied to the same orbit. $\square$

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

**Proposition Q.0.20 (Parameter-Free Phase Scales on the Transfer Branch).** *On the horizon closed-loop transfer branch, the phase-grid scales $(2\pi,\ln2)$ are fixed by the $U(1)$ closure period and the saturated SPAP cost. Therefore the grid in the dimensionless variable $x=\hbar\omega/(k_B T_H)$ is independent of horizon mass, charge, spin, and matter content at the level of phase positions. The response amplitudes, widths, and nonresonant envelope may still depend on the detailed greybody barrier and on the field species.*

*Proof.* The period $2\pi$ is the single-valuedness period of the phase. The step $\ln2$ is the saturated SPAP cost. Neither depends on horizon parameters. The final sentence follows because Definition Q.0.7u fixes only the phase-matching grid, not the full scattering amplitude. $\square$

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

This appendix determines the relationship between the emergent Planck length $L_P$ and the microscopic MPU spatial spacing $\delta$ by enforcing consistency between the ND-RID thermodynamic derivation of $G$ (Appendix E) and the PCE equilibrium values of the boundary-channel parameters. The key identity is Equation (Q.3),

The derivation begins with the relationship between the emergent gravitational constant $G$ and the microscopic network parameters, established in **Appendix E**, Equation (E.9):
$$
G = \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{\max}}
\tag{Q.1}
$$
where $\eta$ is a geometric packing factor, $\chi$ is a dimensionless correlation factor ($0 < \chi \le 1$), and $C_{\max}$ is the ND-RID channel capacity. Using the definition of the squared Planck Length, $L_P^2 = G\hbar/c^3$, we eliminate $G$ to obtain a direct relationship between the fundamental MPU spacing and the emergent Planck scale:
$$
L_P^2 = \left( \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{\max}} \right) \frac{\hbar}{c^3} = \frac{\eta \delta^2}{4 \chi C_{\max}}
\tag{Q.2}
$$
Rearranging this gives the target relation:
$$
\frac{\delta^2}{L_P^2} = \frac{4 \chi C_{\max}}{\eta}
\tag{Q.3}
$$
so the task reduces to fixing $C_{\max}^*$, $\chi^*$, and $\eta^*$ at PCE equilibrium and substituting them into (Q.3).

## Q.2 Rigorous Determination of PCE-Optimal Parameters

The scale ratio $\delta/L_P$ is determined by Equation (Q.3):

$$\frac{\delta^2}{L_P^2} = \frac{4\chi C_{\max}}{\eta}$$

derived from the area law (Equation E.9). The PCE-optimal values of each parameter follow from existing theorems:

### Q.2.1 Channel Capacity: $C_{\max}^* = 2\ln 2$ on the Residual-Budget Branch

On the residual-budget branch of Appendix E (Equation E.14, derived from the PCE resource-partition argument in which the SPAP cost $\varepsilon$ is subtracted from the total information potential $\ln d_0$ to give the available boundary channel capacity), the PCE-optimal channel capacity satisfies $C_{\max}^* = \ln d_0 - \varepsilon$. On the minimal Appendix Z branch one has $d_0 = 8$ (Theorem Z.2), and at the PCE-Attractor one has $\varepsilon_0=\ln2$ (Definition 15a; Theorem 31 gives the lower bound). Therefore:
$$\boxed{C_{\max}^* = \ln 8 - \ln 2 = 2\ln 2 = 2\varepsilon} \tag{Q.10}$$

The residual-budget branch is the load-bearing assumption: alternative resource-partition rules (e.g., one in which the SPAP cost is paid by internal processing without subtraction from external boundary capacity) would yield different values of $C_{\max}^*$ and correspondingly different values of $\delta/L_P$ in §Q.2.4 and §Q.5.


**Remark Q.10.1 (Bit-Budget Characterization).** Since $d_0 = 2^{K_0}$ on the minimal branch and $\varepsilon_0=\ln2$ at the PCE-Attractor, the capacity-cost ratio has the structural form
$$
\frac{C_{\max}^*}{\varepsilon} = \frac{\ln(d_0)-\varepsilon}{\varepsilon} = K_0 - 1.
$$
At $K_0 = 3$ this gives $C_{\max}^*/\varepsilon = 2$: of the $K_0=3$ bits per MPU cycle, one bit pays the irreversible Landauer cost of the SPAP merge, leaving $K_0-1=2$ bits of residual channel capacity. This identity is the structural source of the ratio-2 appearances that explicitly use $C_{\max}/\varepsilon_0$ elsewhere in the framework, while downstream applications may impose additional local assumptions.

### Q.2.2 Correlation Factor: $\chi^* = 1$

**Lemma Q.2.2 (Channel Independence).** At PCE equilibrium, the independence factor saturates its upper bound:
$$
\boxed{\chi^* = 1.}
\tag{Q.11}
$$

*Proof.* By definition (Appendix E, Theorem E.3), the effective independent boundary-link count satisfies
$$
N_{eff_links}=\chi \, N_{geom_links}, \qquad 0<\chi\le 1.
$$
For fixed geometry $(\delta,\eta)$ and fixed per-link capacity bound $C_{\max}$, the ND-RID boundary throughput bound in one cycle is proportional to $N_{eff_links}$ and hence is strictly increasing in $\chi$. Therefore any throughput-saturated PCE equilibrium must attain the maximal feasible value of $\chi$. Since $0<\chi\le 1$, the maximizer is $\chi^*=1$. $\square$

### Q.2.3 Packing Factor: $\eta^* = 1$

**Lemma Q.2.3 (Isotropic Packing).** At PCE equilibrium, the geometric inefficiency factor saturates its lower bound:
$$
\boxed{\eta^* = 1.}
\tag{Q.12}
$$

*Proof.* By definition (Appendix E, Theorem E.3), $\sigma_{geom_link}=1/(\eta\delta^2)$ with $\eta\ge 1$, so at fixed $\delta$ the geometric link density is strictly decreasing in $\eta$ and the achievable ND-RID throughput bound in one cycle is strictly decreasing in $\eta$. Therefore any throughput-saturated PCE equilibrium must attain the minimal feasible value of $\eta$. Since $\eta\ge 1$, the minimizer is $\eta^*=1$. $\square$

### Q.2.4 Final Result

Substituting the equilibrium values $C_{\max}^*=2\ln2$, $\chi^*=1$, and $\eta^*=1$ into Equation (Q.3) yields the closed-form ratio reported in Equation (Q.18):
$$
\frac{\delta^2}{L_P^2}=8\ln 2,\qquad \frac{\delta}{L_P}=\sqrt{8\ln 2}\approx 2.355.
$$

## Q.5 Final Result and Interpretation

The global, coupled PCE optimization of the MPU network vacuum yields a unique, stable equilibrium characterized by:
* $C_{\max}^* = 2\ln 2$
* $\chi^* = 1$
* $\eta^* = 1$
* $\delta/L_P = \sqrt{8\ln 2} \approx 2.355$

Substituting the PCE-optimal values into the foundational relation (Q.3) yields:

$$\frac{\delta^2}{L_P^2} = \frac{4\chi^* C_{\max}^*}{\eta^*}$$

With $\chi^* = 1$ and $\eta^* = 1$ (Sections Q.2.2–Q.2.3) and $C_{\max}^*$ from Equation (Q.10), this gives:

$$\boxed{\frac{\delta^2}{L_P^2} = 8\ln 2, \qquad \frac{\delta}{L_P} = \sqrt{8\ln 2} \approx 2.355} \tag{Q.18}$$

This result demonstrates that the fundamental MPU spatial scale $\delta$ is fixed in Planck units by a universal dimensionless constant on the combined branch of capacity-residual partition, throughput-saturation, and ideal packing. The value $C_{\max}^*=2\ln2$ follows from the residual-budget branch of Appendix E (Equation E.14, §Q.2.1), and the geometric/channel factors $\chi^*=1$ and $\eta^*=1$ follow from the throughput-saturated and ideal-packing branches of Lemmas Q.2.2 and Q.2.3. The resulting ratio $\delta/L_P = \sqrt{8\ln 2} \approx 2.355$ is uniquely fixed on this combined branch; removing the residual-budget branch would multiply $C_{\max}^*$ by a coefficient $\lambda_C$ and rescale $\delta/L_P$ by $\sqrt{\lambda_C}$. The branch-independent ratio $\delta/L_P$ is outside the stated residual-budget, throughput-saturated, ideal-packing hypotheses.


The value of this ratio emerges from the PCE equilibrium values using the framework's fundamental constants:
$$\frac{\delta}{L_P} = \sqrt{\frac{4\chi^* C_{\max}^*}{\eta^*}} = \sqrt{\frac{4 \cdot 1 \cdot 2\ln 2}{1}} = \sqrt{8\ln 2}$$
where $C_{\max}^* = 2\ln 2$ (Equation Q.10), $\chi^* = 1$ (Lemma Q.2.2), and $\eta^* = 1$ (Lemma Q.2.3). The ability to derive an $O(1)$ constant linking these scales from a self-consistent global optimization, with no adjustable parameters, provides evidence for the internal coherence of the Predictive Universe framework.


## Q.6 Lorentz-Invariant Discretization and the Temporal Scale

The spatial discretization scale $\delta/L_P = \sqrt{8\ln 2}$ (Equation Q.18) was derived from PCE optimization. This section establishes the corresponding temporal discretization scale through consistency with emergent Lorentzian structure.

### Q.6.1 The Discretization Consistency Requirement (Conditional on Theorems 43, 46)

**Proposition Q.6.1 (Lorentz-Invariant Discretization).** The emergent invariant speed $c$ (Theorem 46) relates the spatial discretization scale $\delta$ to the temporal discretization scale $\tau_{min}$ through:

$$c = \frac{\delta}{\tau_{min}}$$

Combined with the Planck unit identity $c = L_P/t_P$, this yields:

$$\boxed{\frac{\delta}{L_P} = \frac{\tau_{min}}{t_P}}$$

*Proof.*

**Step 1 (Reference speed identification).** In the serialized nearest-neighbor propagation regime of Appendix E, and with the same no-preferred-frame scale identification used in Theorem E.10.2, the emergent causal speed satisfies
$$
c = \frac{\delta}{\tau_{min}},
$$
with $\delta$ the microscopic spatial spacing (Definition 35) and $\tau_{min}$ the minimum cycle time (Theorem 29).

**Step 2 (Planck Unit Relation).** The Planck length and Planck time are defined through:

$$L_P = \sqrt{\frac{\hbar G}{c^3}}, \quad t_P = \sqrt{\frac{\hbar G}{c^5}}$$

from which the identity $L_P/t_P = c$ follows by direct calculation:

$$\frac{L_P}{t_P} = \sqrt{\frac{\hbar G/c^3}{\hbar G/c^5}} = \sqrt{c^2} = c$$

**Step 3 (Scale Identification).** The equality imported from Appendix E should therefore be read as a condition on the PCE-optimal continuum scaling of the serialized regime, not as a theorem independent of that hypothesis.

**Step 4 (Ratio Equality).** Under this identification,
$$
\frac{\delta}{\tau_{min}} = \frac{L_P}{t_P}.
$$

yields the stated result upon rearrangement:

$$\frac{\delta}{L_P} = \frac{\tau_{min}}{t_P}$$

**Step 5 (Uniqueness).** Suppose the ratios were unequal: $\delta/L_P \neq \tau_{min}/t_P$. Define $c_{eff} := \delta/\tau_{min}$. Then $c_{eff} \neq c$, and the discretization would select a preferred frame—spatial and temporal resolutions would transform differently under boosts, violating Lorentz invariance (Theorem 46). Since Theorem 46 establishes Lorentz invariance as an emergent property of the PCE-optimal vacuum, equality of the ratios is the unique consistent solution. ∎

### Q.6.2 The Temporal Discretization Scale

**Theorem Q.6.1 (Minimum Temporal Interval).** The minimum temporal interval $\tau_{\min}$ implied by Lorentz-invariant discretization is:
$$
\boxed{
\tau_{\min} = \sqrt{8\ln 2}\,t_P \approx 2.355\,t_P.
}
$$

*Proof.* Lorentz invariance requires:
$$
\frac{\tau_{\min}}{t_P} = \frac{\delta}{L_P}.
$$
Using (Q.18), $\delta/L_P=\sqrt{8\ln 2}$, gives $\tau_{\min}=t_P\sqrt{8\ln 2}$. $\square$


**Corollary Q.6.1 (Unified Discretization Formula).** The full PU discretization relation is:
$$
\boxed{
\frac{\delta}{L_P} = \frac{\tau_{\min}}{t_P} = \sqrt{8\ln 2} \approx 2.355.
}
$$

*Proof.* Combine (Q.18) with the Lorentz-invariance condition $\tau_{\min}/t_P=\delta/L_P$. $\square$

### Q.6.3 Information-Theoretic Interpretation

**Remark Q.6.1: Decomposition of the Discretization Scale.** The unified discretization factor $\sqrt{d_0 \cdot \varepsilon}$ admits a transparent information-theoretic decomposition:

- **Factor $d_0 = 8$:** Theorem 23 gives the lower bound $d_0 \ge 2^{K_0} = 8$, and the minimal PCE branch used in the Appendix Z backbone selects $d_0 = 8$ (Theorem Z.2). This encodes the logical structure required for self-referential prediction.

- **Factor $\varepsilon_0=\ln2$:** Theorem 31 gives the irreducible thermodynamic lower bound $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$, and the PCE-Attractor saturates that bound to $\varepsilon_0=\ln2$ (Definition 15a).

The discretization scale $\sqrt{d_0 \cdot \varepsilon} = \sqrt{8\ln 2} \approx 2.355$ thus represents the geometric mean of the logical capacity and thermodynamic cost of self-reference on the minimal/saturating branch.

**Remark Q.6.2: Complete Derivation Chain.** The full derivation from logical axioms to spacetime discretization proceeds through two parallel pathways originating from $K_0$:

$$\begin{array}{c} K_0 = 3 \xrightarrow{\text{Thm 23}} d_0 \ge 2^{K_0} = 8 \xrightarrow{\text{Thm Z.2}} d_0 = 8 \\[6pt] \text{SPAP merge} \xrightarrow{\text{Thm 31}} \varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2 \xrightarrow{\text{Def 15a}} \varepsilon_0=\ln2 \end{array} \bigg\} \xrightarrow[\text{consistency}]{\text{P.14.3}} d_0 \cdot \varepsilon = 8\ln 2 \xrightarrow{\text{Eq. Q.18}} \frac{\delta}{L_P} = \sqrt{d_0 \cdot \varepsilon}$$

The discretization scale emerges from two independent derivations constrained by internal consistency (P.14.3):

1. **The Hilbert space dimension** satisfies $d_0 \ge 2^{K_0}=8$ by Theorem 23, with equality $d_0=8$ on the minimal PCE branch (Theorem Z.2).

2. **The entropy cost** satisfies $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$ by Theorem 31, with equality $\varepsilon_0=\ln2$ on the attractor-saturating branch (Definition 15a).

The mutual consistency constraint relates the minimal-branch values $d_0 = 8$ and $a = 2$ through Theorem Z.2. It does not require the general identity $a = e^\varepsilon$.

### Q.6.4 Experimental Predictions

**Prediction Q.6.1 (No Leading Lorentz-Violating MDR at the PCE Attractor).** Modified dispersion relations (MDRs) provide a generic phenomenological signature of theories with fundamental discretization scales [Amelino-Camelia 2013, Mattingly 2005]. In the PU framework, the PCE-attractor discretization is Lorentz-invariant (Theorem 46 and Proposition Q.6.1). Therefore leading-order Lorentz-violating MDR terms written separately in powers of $E$ and $p$ are absent on the attractor branch:
$$
E^2-p^2c^2=m^2c^4+\text{Lorentz-invariant corrections}.
$$
The exact factor
$$
\frac{\delta}{L_P}=\frac{\tau_{\min}}{t_P}=\sqrt{8\ln 2}
$$
fixes the invariant MPU cutoff
$$
\Lambda_{\mathrm{MPU}}:=\frac{\hbar c}{\delta}=\frac{E_P}{\sqrt{8\ln 2}}\approx0.42466\,E_P,
$$
but it is not, by itself, an effective Lorentz-violation energy scale $E_{\mathrm{QG}}$.

*Derivation.* Proposition Q.6.1 imposes the equal-ratio condition $\delta/L_P=\tau_{\min}/t_P$ as the Lorentz-consistent scaling of the serialized MPU regime. A leading photon MDR of the form $\Delta v/c\propto(E/E_{\mathrm{QG}})^n$ would require a preferred-frame or non-attractor propagation branch specifying how the microscopic cutoff enters the continuum principal symbol. No such branch is part of Theorem 46 or Proposition Q.6.1. Hence the attractor branch gives a null prediction for leading Lorentz-violating MDR coefficients, while retaining the invariant UV cutoff $\Lambda_{\mathrm{MPU}}$. $\square$

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
| Spatial discretization | $\delta/L_P$ | $\sqrt{8\ln 2} \approx 2.355$ | PCE optimization (Q.18) |
| Temporal discretization | $\tau_{min}/t_P$ | $\sqrt{8\ln 2} \approx 2.355$ | Lorentz consistency (Prop. Q.6.1) |
| Information budget | $C_{\max}^*$ | $2\ln 2$ | Capacity saturation (Q.10) |
| Hilbert space dimension | $d_0$ | $8$ on the minimal branch | Theorem 23; Theorem Z.2 |
| Irreducible entropy cost | $\varepsilon$ | $\ln 2$ on the attractor branch | Theorem 31; Definition 15a |
| Independence factor | $\chi^*$ | $1$ | Lemma Q.2.2 |
| Geometric inefficiency | $\eta^*$ | $1$ | Lemma Q.2.3 |

The complete derivation chain from the horizon constant to spacetime discretization:

$$\boxed{\begin{array}{c} K_0 = 3 \xrightarrow{\text{Thm 23}} d_0 = 8 \\ \text{SPAP} \xrightarrow{\text{Thm 31}} \varepsilon_0=\ln2 \end{array} \xrightarrow{\text{Eq. Q.10}} C_{\max}^* = 2\ln 2 \xrightarrow{\text{Eq. Q.18}} \frac{\delta}{L_P} = \sqrt{8\ln 2}}$$

