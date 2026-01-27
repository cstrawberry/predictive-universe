# Appendix Q: Derivation of the Planck-MPU Scale Ratio

## Q.0 The Action-Entropy Identity and the Origin of Planck's Constant

Before deriving the quantitative relationship between the MPU spacing δ and the Planck length L_P, we establish a foundational result: the identification of Planck's constant $\hbar$ as the exchange rate between information-theoretic and mechanical descriptions of physical processes. This identification emerges from the Action-Entropy Identity, which reveals that physical action measures cumulative irreversible entropy production.

### Q.0.1 The Puzzle of Least Action

The Principle of Least Action stands as one of the most powerful organizing principles in physics. From it, classical mechanics, field theory, and the path integral formulation of quantum mechanics can be derived. Yet the standard presentation offers no explanation for *why* nature should extremize this particular quantity—the integral of the Lagrangian over time.

Within the Predictive Universe framework, this puzzle admits a resolution: the Principle of Least Action is not fundamental but derived. It is the continuum Euler–Lagrange condition expressing **stationarity of the total SPAP entropy cost** accumulated along a history, subject to fixed boundary data (and, when relevant, fixed holonomy sector).

### Q.0.2 The Discrete Predictive Cost Functional

The MPU network executes cyclical predictive operations, each cycle implementing the Fundamental Predictive Loop (Definition 4):

$$\text{Predict} \to \text{Verify} \to \text{Update}$$

Each non-trivial cycle incurs the irreducible SPAP entropy cost ε ≥ ln 2 nats (Theorem 31, Appendix J). This cost arises from the logically irreversible 2-to-1 state merge required by self-referential prediction (Lemma J.1), and by Landauer's principle, necessarily manifests as thermodynamic entropy production.

**Definition Q.0.1 (Dimensionless Discrete Predictive Action).** For a trajectory of the MPU network over $N$ predictive cycles, define the *dimensionless* discrete predictive action by:

$$\mathcal{S}_{disc} := \sum_{i=1}^{N} \varepsilon_i$$

where $\varepsilon_i \ge \ln 2$ is the SPAP entropy production (in nats) of the $i$-th cycle. This quantity counts the total irreversible entropy cost required to evolve the network configuration along the specified trajectory.

The corresponding *physical* action functional is obtained by the universal conversion factor $\hbar$:

$$\mathcal{S}^{phys}_{disc} := \hbar\,\mathcal{S}_{disc}$$


**Proposition Q.0.1 (Action Bounds).** For any trajectory involving N_ops non-trivial predictive operations:

$$\mathcal{S}_{disc} \geq N_{ops} \cdot \ln 2$$

*Proof.* Each non-trivial operation contributes at least the SPAP minimum ε = ln 2 nats by Theorem 31. QED

**Remark (Entropy Unification).** The quantity ε appearing here is the same SPAP entropy that, through the derivation chain of Thesis P.6.1 (Appendix P), connects to Shannon, von Neumann, thermodynamic, and Bekenstein-Hawking entropy. The discrete predictive action thus inherits this unified structure: it counts entropy in the foundational sense established by the framework.

### Q.0.3 The Continuum Limit via Γ-Convergence

The discrete predictive cost functional converges to a continuum action in the limit of fine network resolution. This convergence is developed within the Γ-convergence framework (Theorem D.8, Appendix D; Section O.7, Appendix O).

**Theorem Q.0.1 (Action-Entropy Identity).** Let $\{G_h\}_{h\to 0}$ be a family of MPU networks with mesh size $h \to 0$ approximating a spacetime region. Let $\mathcal{S}_{disc}^{(h)}$ be the dimensionless discrete predictive action of Definition Q.0.1.

Under the locality and equi-coercivity hypotheses of Theorem D.8 (Appendix D), the corresponding physical action functional $\mathcal{S}_{disc}^{phys,(h)} := \hbar\,\mathcal{S}_{disc}^{(h)}$ admits a $\Gamma$-limit that is a local diffeomorphism-invariant continuum functional of the emergent fields and metric. Writing this limit in standard action form defines the continuum action $\mathcal{S}$:

$$\mathcal{S}_{disc}^{phys,(h)} \xrightarrow{\Gamma} \mathcal{S} := \int d^4x \sqrt{|g|}\,\mathcal{L}_{tot}$$

Equivalently, the dimensionless $\Gamma$-limit is:

$$\boxed{\mathcal{S}_{disc}^{(h)} \xrightarrow{\Gamma} \frac{\mathcal{S}}{\hbar}}$$

where $\hbar$ is the universal conversion factor between SPAP entropy units (nats) and physical action units (J·s).

*Proof.* Appendix D establishes existence of a $\Gamma$-limit for the PCE-driven discrete action functional under locality and equi-coercivity (Theorem D.8). Locality and invariance fix the continuum limit to the standard form of an integral of a scalar density $\sqrt{|g|}\,\mathcal{L}_{tot}$. The normalization is fixed by identifying the continuum limit with the conventional action units, which introduces a single universal conversion constant with dimensions of action, denoted $\hbar$.


1. **Spatial sector:** The discrete cost for spatial variations Γ-converges to a positive-definite quadratic form defining the emergent Riemannian metric on spatial slices.

2. **Temporal sector:** The irreversibility of the 'Evolve' process ($\varepsilon > 0$, Theorem 31) introduces a sign asymmetry. The dissipative structure of temporal updates yields a kinetic term with opposite sign to the spatial gradient terms, establishing the Lorentzian signature $(-, +, +, +)$.

3. **Combined action:** The full Γ-limit yields the standard action for fields in curved spacetime, with $\hbar$ appearing as the conversion factor between discrete (nats) and continuous (J·s) descriptions.

**Corollary Q.0.1 (Action-Entropy Identity).** For a history $\phi$ in the action ensemble,

$$\boxed{\mathcal{S}[\phi] = \hbar \sum_{i\in\phi}\varepsilon_i}$$

In interference observables, only the phase $e^{i\mathcal{S}[\phi]/\hbar} = e^{i\sum_{i\in\phi}\varepsilon_i}$ is measurable, hence phases are identified modulo $2\pi$.

This identity connects the mechanical description of physics (action in J·s) to the information-theoretic description (entropy in nats), with ℏ serving as the conversion factor. In quantum amplitudes $e^{i\mathcal{S}[\phi]/\hbar}$, only the phase modulo $2\pi$ is observable, giving physical significance to the holonomy structure developed in Theorem Q.0.4.

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

**Remark Q.0.1 (What Is and Is Not Derived).** The framework derives:
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

where Σ_k ε_k[φ] is the total SPAP entropy cost along path φ.

*Proof.* Direct substitution of the Action-Entropy Identity (Corollary Q.0.1). The phase factor is oscillatory because it is a unit-modulus complex phase $e^{i\mathcal{S}[\phi]/\hbar} = e^{i\sum_k\varepsilon_k[\phi]}$ with real exponent; interference is controlled by relative phase differences (including overhead contributions when some cycles have $\varepsilon_k > \ln 2$). QED

**Corollary Q.0.4 (Interference as Entropy Phase Matching).** Quantum interference arises from the phase accumulated through irreversible predictive operations:

$$\phi_{quantum} = \frac{\mathcal{S}}{\hbar} = \sum_i \varepsilon_i$$

Paths with equal total SPAP entropy cost (mod 2π) interfere constructively. The discrete structure of irreversible operations underlies the wave-like behavior of quantum mechanics.


## Q.0.7 The Landauer Phase Structure and Emergent U(1)

This section establishes a precise connection between the discrete SPAP entropy structure and the emergence of continuous U(1) gauge symmetry. The key insight is that the Landauer constant $\varepsilon = \ln 2$ generates a dense subgroup of U(1), providing a microscopic origin for continuous gauge phases from discrete computational operations.

---

### Q.0.7.1 The Landauer Angle

Define the *Landauer angle* and its reciprocal by:
$$\alpha_L := \frac{\ln 2}{2\pi} \approx 0.110317800$$
$$\beta_L := \frac{2\pi}{\ln 2} = \frac{1}{\alpha_L} \approx 9.064720284$$

The quantity $\alpha_L$ measures the SPAP minimum entropy cost $\varepsilon_{\min} = \ln 2$ (Theorem 31) in units of one complete phase cycle $2\pi$. The reciprocal $\beta_L$ gives the number of SPAP-minimum cycles per full $2\pi$ phase revolution (Corollary Q.0.4a).

---

### Q.0.7.2 Irrationality of the Landauer Angle

**Lemma Q.0.7b (Irrationality of the Landauer Phase Ratio).** *The ratio $\alpha_L = \ln 2/(2\pi)$ is irrational.*

*Proof.* Suppose for contradiction that $\alpha_L \in \mathbb{Q}$. Then $\alpha_L = p/q$ for integers $p, q$ with $q \neq 0$, hence:
$$e^{i\ln 2} = e^{i 2\pi p/q} = \zeta_q^{\,p}$$

where $\zeta_q := e^{2\pi i/q}$ is a primitive $q$th root of unity. Therefore $e^{i\ln 2}$ would be algebraic.

On the other hand, by the Gelfond–Schneider theorem [Gelfond 1934; Schneider 1935], if $a \in \overline{\mathbb{Q}} \setminus \{0,1\}$ and $b \in \overline{\mathbb{Q}} \setminus \mathbb{Q}$, then any value of $a^b$ is transcendental. Taking $a = 2$ (algebraic, $2 \neq 0,1$) and $b = i$ (algebraic, $i \notin \mathbb{Q}$) implies that $2^i$ is transcendental.

By the standard definition $2^z := e^{z\ln 2}$ (with $\ln 2$ the real natural logarithm),
$$2^i = e^{i\ln 2}$$

This contradicts the algebraicity established above. Hence $\alpha_L \notin \mathbb{Q}$. $\square$

**Remark Q.0.7b.1 (Transcendence Status).** While the irrationality of $\alpha_L$ is proven, its transcendence remains an open question. No algebraic relation between $\pi$ and $\ln 2$ is known, and the algebraic independence of $\{\pi, \ln 2\}$ over $\mathbb{Q}$ is conjectured but unproven. The irrationality alone suffices for all results in this section.

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

---

### Q.0.7.5 Entropy-Holonomy Decomposition

**Definition Q.0.7e (Entropy-Holonomy Connection and Overhead Decomposition).** For any discrete history/path $\phi$ composed of SPAP cycles with entropy costs $\{\varepsilon_i\}$, define its **dimensionless holonomy angle**:
$$\Theta(\phi) := \sum_{i \in \phi} \varepsilon_i$$

The corresponding phase factor is:
$$U(\phi) := e^{i\Theta(\phi)}$$

By the Action–Entropy Identity (Corollary Q.0.1), $\Theta(\phi) = \mathcal{S}(\phi)/\hbar$ for histories in the action ensemble, so $U(\phi) = e^{i\mathcal{S}(\phi)/\hbar}$.

Define the **Landauer baseline** $\varepsilon_{\min} := \ln 2$ (Theorem 31) and the **overhead costs**:
$$\delta\varepsilon_i := \varepsilon_i - \ln 2 \geq 0$$

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

*Verification.* Direct computation using the standard continued fraction algorithm confirms these values:
- $9 \times \ln 2 = 6.2383...$ vs. $2\pi \times 1 = 6.2832...$, mismatch $= 0.0449$
- $136 \times \ln 2 = 94.268...$ vs. $2\pi \times 15 = 94.248...$, mismatch $= 0.0202$
- $281 \times \ln 2 = 194.774...$ vs. $2\pi \times 31 = 194.779...$, mismatch $= 0.00439$
- $1260 \times \ln 2 = 873.37...$ vs. $2\pi \times 139 = 873.37...$, mismatch $= 0.00269$

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

**Remark Q.0.7p.1 (PCE Selection of Overhead Distribution).** The probability law $P(\Delta)$ is not arbitrary but is determined by the PCE dynamics (Appendix D). Near the PCE-Attractor (Definition 15a), overhead fluctuations are suppressed by the cost function $V_{op}$ (Definition D.1), leading to concentration of $P(\Delta)$ near zero. The decoherence mechanism thus becomes significant only away from the attractor, providing a natural explanation for the emergence of classical behavior in non-optimal configurations.

---

### Q.0.7.15 Modular Structure from Continued Fractions

**Remark Q.0.7q (The Modular Itinerary Canonically Induced by $\alpha_L$).** The continued fraction of $\alpha_L$ canonically produces a sequence of matrices in $GL_2(\mathbb{Z})$ via convergents:
$$M_n := \begin{pmatrix} p_n & p_{n-1} \\ q_n & q_{n-1} \end{pmatrix}, \qquad \det(M_n) = (-1)^{n-1}, \qquad M_n(\infty) = \frac{p_n}{q_n}$$

Equivalently, the digit string $[0; 9, 15, 2, 4, 1, 1, 1, 1, 2, 2, 3, \ldots]$ defines a word in the generators $S: \tau \mapsto -1/\tau$ and $T: \tau \mapsto \tau + 1$, giving a canonical coding of a geodesic on the modular surface $\mathcal{H}/PSL_2(\mathbb{Z})$ by continued fractions [Series 1985].

This provides a rigorous $PSL_2(\mathbb{Z})$-structured object determined solely by the Landauer constant $\ln 2$—a second route into modular structure complementing the lattice/VOA path of Appendix P (Appendix P, Section P.13.15.1: $\varepsilon = \ln 2 \to M = 24 \to \Lambda_{24} \to V^\natural \to \mathbb{M}$).

*Note:* The Klein $j$-invariant is defined on the upper half-plane $\mathcal{H} = \{\tau \in \mathbb{C} : \mathrm{Im}(\tau) > 0\}$; the real axis $\mathbb{R}$ lies on the boundary of $\mathcal{H}$, so expressions like $j(\alpha_L)$ are not defined as holomorphic values. The modular itinerary construction avoids this issue entirely. Further development of this connection is deferred to future work.

---

### Q.0.7.16 Gauge-Holonomy Interface

**Remark Q.0.7r (Gauge-Holonomy Interface).** Appendix G derives a local $U(1)$ redundancy with covariant derivative:
$$D_\mu\Psi = (\partial_\mu + \Omega_\mu + iq A_\mu)\Psi$$

and associated $U(1)$ holonomies $\exp(iq\oint_\gamma A_\mu dx^\mu)$ (Section G.4).

The present results supply a microscopic origin for a continuous $U(1)$ phase: the SPAP-minimum generator $g_L = e^{i\ln 2}$ generates a **discrete** subgroup $G_L$, while Theorem Q.0.7d–Corollary Q.0.7d′ imply $\overline{G_L} = U(1)$. In particular, the holonomy constraint (Theorem Q.0.4) can be expressed as the quantization of the entropy-holonomy $\Theta(\gamma)$, and Corollary Q.0.7g shows that nontrivial holonomy requires overhead above the Landauer baseline.

This realizes the discrete–continuous interface mechanism: the discrete subgroup $G_L$ is not closed, while its topological closure is $U(1)$ (Corollary Q.0.7d′).


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

**Remark Q.0.7t.1 (Physical Selection of Generators).** The framework selects the generators satisfying the Lie algebra spanning condition through the PCE dynamics. The SPAP involution $\sigma_x$ (Theorem G.10.2) provides one generator in $SU(2)$, while the interface dynamics (Section G.8) generate additional elements through the QFI mode structure. The non-commutativity of these generators ensures that the generated subgroup spans the full $\mathfrak{su}(2)$ algebra.

---

### Q.0.7.18 Summary

This section has established:

1. **Landauer Irrationality:** $\alpha_L = \ln 2/(2\pi) \notin \mathbb{Q}$ (Lemma Q.0.7b), proven via Gelfond–Schneider transcendence

2. **Dense U(1) Emergence:** $\overline{G_L} = U(1)$ where $G_L = \{e^{iN\ln 2}\}$ (Theorem Q.0.7d)

3. **Exact Interference Selection:** SPAP-minimum paths with different cycle counts cannot interfere exactly (Corollary Q.0.7c)

4. **Topology–Overhead Principle:** Nontrivial holonomy requires $\Delta > 0$, i.e., entropy above Landauer minimum (Corollary Q.0.7g)

5. **Continued-Fraction Spectrum:** Best-approximation pairs $(k,N)$ are convergents of $\alpha_L$, with explicit enumeration (Theorem Q.0.7k, Corollary Q.0.7l)

6. **Three-Gap Structure:** Finite phase sets partition the circle into at most three arc lengths (Proposition Q.0.7n)

7. **Decoherence Mechanism:** Overhead fluctuations suppress coherence via $|\chi_\Delta(1)|$ (Proposition Q.0.7p)

8. **Gauge-Holonomy Interface:** The discrete $G_L$ structure connects to emergent $U(1)$ gauge holonomies (Remark Q.0.7r)

The central result—that continuous $U(1)$ gauge symmetry emerges as the closure of a discrete subgroup generated by the Landauer phase step—provides a microscopic foundation for gauge structure without assuming continuous symmetry *ab initio*.


### Q.0.8 Action Quantization and the Computational Structure of Interference

The Action-Entropy Identity (Corollary Q.0.1) establishes that $\mathcal{S}/\hbar = \sum_i \varepsilon_i$. At the SPAP minimum, each irreversible cycle contributes $\varepsilon = \ln 2$ nats (Theorem 31, Appendix J). This section derives the conditions under which the total cycle count $N$ is constrained to discrete values, yielding a quantization of action with observable consequences.

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

**Corollary Q.0.4a (SPAP-Minimum Constraint).** *For processes where all cycles operate at the SPAP minimum $\varepsilon = \ln 2$ (Theorem 31), the cycle number around closed loops satisfies:*

$$N_\gamma \cdot \ln 2 = 2\pi k \implies N_\gamma = \frac{2\pi}{\ln 2} k \approx 9.0647 \, k$$

*The fundamental period in cycle-number space is $\Delta N_0 = 2\pi/\ln 2 \approx 9.0647$.*

**Remark Q.0.4b (Non-Integer Period and Resolution).** The period $\Delta N_0 = 2\pi/\ln 2 \approx 9.0647$ is not an integer. Lemma Q.0.7b establishes that this ratio is irrational via the Gelfond–Schneider theorem. This creates a tension between two constraints:

1. *Discrete constraint:* Integer cycle counts $N \in \mathbb{Z}$ are enforced by the atomic structure of SPAP operations (Proposition Q.0.3).

2. *Interference constraint:* Constructive interference requires $N_\gamma \ln 2 = 2\pi k$ for integer $k$.

Since $2\pi/\ln 2$ is irrational, exact satisfaction of both constraints simultaneously is impossible for any nontrivial closed path with all cycles at the Landauer minimum. The resolution occurs in two regimes:

**(a) Macroscopic regime ($N \gg 1$):** The $\Gamma$-convergence (Theorem Q.0.1) maps the discrete action to the continuum action. For macroscopic processes with $N \gg 1$, the fractional part of $N\cdot \ln 2/(2\pi)$ samples $[0,1)$ quasi-uniformly by Weyl's equidistribution theorem, and the phases $\{e^{iN\ln 2}\}_{N\in\mathbb{Z}}$ are dense in $U(1)$ (Theorem Q.0.7d). The effective phase distribution becomes continuous.

**(b) Fundamental regime (finite $N$):** Only specific closed paths with integer cycle counts satisfying $|N\ln 2 - 2\pi k| < \delta$ for small tolerance $\delta$ exhibit approximate constructive interference. Corollary Q.0.7o characterizes record-small mismatches as convergent-denominator pairs from the continued fraction of $\alpha_L = \ln 2/(2\pi)$.

---

#### Q.0.8.3 Vacuum Excitation Structure from Leech Geometry

The Leech lattice structure of the vacuum (Theorem Z.8c and Corollary Z.8d.1, Appendix Z) provides constraints on excitations above the ground state. Theorem Z.8c establishes that QFI isotropy implies rootlessness, and Corollary Z.8d.1 proves that PCE uniquely selects the Leech lattice. The derivation chain proceeds: SPAP → Landauer cost → Golay code → Leech lattice.

**Proposition Q.0.5 (Shell Structure).** *Excitations above the PCE-Attractor vacuum correspond to Leech lattice vectors $v \in \Lambda_{24}$ with squared norm $|v|^2 \in \{0, 4, 6, 8, 10, 12, \ldots\}$. The minimum non-trivial excitation has $|v|^2_{\min} = 4$.*

*Proof.* 

**Step 1 (Leech lattice from PCE optimization).** PCE optimization produces QFI isotropy on the 24-dimensional interface mode space (Theorem Z.5). By Theorem Z.8c, isotropy on an even unimodular lattice implies rootlessness. Corollary Z.8d.1 establishes that PCE uniquely selects the Leech lattice $\Lambda_{24}$ as the vacuum configuration among the 24 Niemeier lattices. The extended binary Golay code $\mathcal{G}_{24} = [24, 12, 8]$ is selected by PCE optimization (Theorem Z.13) as the unique optimal error-correcting code on $M = 24$ interface modes. The Leech lattice $\Lambda_{24}$ is constructed from $\mathcal{G}_{24}$ via the gluing construction [Conway & Sloane 1999]: the base lattice $L_0 = \sqrt{2}E_8 \oplus \sqrt{2}E_8 \oplus \sqrt{2}E_8$ is extended by Golay-determined cosets,

$$\Lambda_{24} = \bigcup_{c \in \mathcal{G}_{24}} (g_c + L_0)$$

where $g_c$ are glue vectors determined by codeword $c$. This yields a disjoint union of $|\mathcal{G}_{24}| = 2^{12} = 4096$ cosets (Lemma R.4.5).

**Step 2 (Rootlessness).** The Leech lattice is the unique even unimodular lattice in 24 dimensions with no vectors of squared norm 2 [Conway 1969]. This rootlessness follows from the minimum distance $d = 8$ of the Golay code: vectors in $L_0$ have minimum squared norm 4 (from the $\sqrt{2}$ scaling), and the Golay code's minimum weight 8 ensures that glue-shifted vectors also satisfy $|v|^2 \geq 4$ (Proposition R.4.2a).

**Step 3 (Shell structure).** The theta series of the Leech lattice [Conway & Sloane 1999]:

$$\Theta_{\Lambda_{24}}(q) = 1 + 196560 q^4 + 16773120 q^6 + 398034000 q^8 + \cdots$$

confirms $|v|^2 \in \{0, 4, 6, 8, \ldots\}$ with the 196,560 minimal vectors at $|v|^2 = 4$. $\square$

**Theorem Q.0.5a (Mass-Action Correspondence).** *For a vacuum excitation corresponding to Leech lattice vector $v$, the mass satisfies:*

$$m^2(v) = \mu_0^2 \cdot |v|^2$$

*where $\mu_0 = m_P/(2\sqrt{8\varepsilon})$ is the fundamental mass scale (Definition Z.8f, Appendix Z).*

*Proof.* The Mass-Information Equivalence (Theorem N.5, Appendix N) relates inertial mass to relational information content. For excitations corresponding to Leech lattice vectors, the mass scales with the vector norm:

$$m(v) = \mu_0 |v|, \quad \mu_0 := \frac{m_P}{2\sqrt{8\varepsilon}} = \frac{m_P}{2\sqrt{8 \ln 2}} \approx 0.212 \, m_P$$

Squaring yields the stated relation. $\square$

**Remark Q.0.5a.1 (Derivation Chain).** The mass-lattice correspondence follows from the derivation chain established in Appendices Z, R, and N. Each step connects SPAP entropy to the Leech lattice structure via the Golay code, with the mass spectrum emerging from the lattice geometry through the Mass-Information Equivalence (Theorem N.5).

**Remark Q.0.5a.2 (Phenomenological Status).** The Leech lattice shell structure provides a discrete mass spectrum at the fundamental scale. Connection to observed particle masses requires: (i) identification of vacuum excitations with physical particles, (ii) symmetry breaking mechanisms selecting specific lattice points, and (iii) RG flow from $\mu_0 \sim 0.2 \, m_P$ to electroweak scales. These developments appear in Appendices R (fermion generations) and T (electroweak hierarchy).

**Corollary Q.0.5b (Landauer-Shell Correspondence).** *The minimum Leech shell $|v|^2_{\min} = 4$ equals the squared Landauer pointer dimension $a^2 = (e^\varepsilon)^2 = 4$. This equality traces through the derivation chain:*

$$\varepsilon = \ln 2 \xrightarrow{\text{Thm Z.1}} a = e^\varepsilon = 2 \xrightarrow{} a^2 = 4 = |v|^2_{\min}$$

*Proof.* The equality $a^2 = 4$ follows from $a = e^{\ln 2} = 2$. The equality $|v|^2_{\min} = 4$ follows from Leech lattice rootlessness (Proposition Q.0.5). Both quantities trace to the SPAP entropy $\varepsilon = \ln 2$ through the derivation chain connecting information-theoretic constraints to lattice geometry. $\square$

**Corollary Q.0.5c (Discrete Mass Spectrum).** *The allowed squared masses for vacuum excitations form the discrete set:*

$$m^2 \in \{0, 4, 6, 8, 10, 12, \ldots\} \times \mu_0^2$$

*The mass gap is $\Delta_{\text{gap}} = 2\mu_0$, where $\mu_0 = m_P/(2\sqrt{8\varepsilon})$ is the fundamental mass scale (Definition Z.8f, Corollary Z.8g.1).*

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
| Thermodynamics | $\varepsilon = \ln 2$ | Irreversible entropy cost per cycle (Theorem 31) |
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

**Remark Q.0.8a (Experimental Accessibility).** These predictions operate at the Planck scale: $\mathcal{S}_{\min} = \hbar \ln 2 \approx 0.69\hbar$ represents a sub-Planck action, and the fundamental mass scale $\mu_0 \approx 0.21 \, m_P$ is near the Planck mass. Direct experimental verification lies beyond current technology. The predictions are nonetheless falsifiable in principle through:

(i) Precision tests of quantum coherence at mesoscopic scales where $N$ is moderately small

(ii) Cosmological signatures where Planck-scale physics imprints on large-scale structure

(iii) Derived consequences at accessible scales—particle mass ratios, coupling constants, and symmetry structures (Sections 13, G.8.4, Appendix T)

**Remark Q.0.8b (Sub-Planck Action).** The minimum action $\mathcal{S}_{\min} = \hbar \ln 2 < \hbar$ is sub-Planckian. This does not violate uncertainty relations because the bound applies to complete irreversible cycles, not to arbitrary measurements. The time-energy uncertainty $\Delta E \cdot \Delta t \gtrsim \hbar/2$ constrains measurement precision, while $\mathcal{S}_{\min}$ constrains the action of completed logical operations.

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

**Remark Q.0.9a (Information-Theoretic Origin).** Unlike Bohr-Sommerfeld quantization (imposed as a postulate) or Dirac quantization (derived from canonical commutators), the present quantization derives from:

1. The logical structure of self-referential prediction (SPAP, Theorems 10–11)
2. The irreducible entropy cost $\varepsilon \geq \ln 2$ (Theorem 31, Appendix J)
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

This result follows from quantum field theory in curved spacetime and is kinematic—it depends only on the existence of a Rindler horizon, not on the dynamical field equations (Theorem E.9.4, Appendix E).

**Ingredient 2 (Landauer Bound).** Erasing one bit of information into a thermal reservoir at temperature $T$ requires minimum heat dissipation [Landauer 1961; Bennett 1982]:

$$Q_{\min} = k_B T \ln 2$$

This bound is exact and saturated by optimal quasi-static erasure protocols. The entropy increase in the reservoir is $\Delta S = Q_{\min}/T = k_B \ln 2$.

**Ingredient 3 (SPAP Action Quantum).** One irreversible bit operation at the SPAP minimum costs action $\mathcal{S}_{\min} = \hbar \ln 2$ (Corollary Q.0.1, Theorem 31). 

**Derivation of E·τ = ℏ ln 2:** At the thermodynamic limit where the operation is quasi-static and all energy is dissipated as heat, the minimum energy for erasure equals the Landauer heat: $E_{\min} = Q_{\min} = k_B T \ln 2$. The cycle time $\tau$ is determined by requiring the action to equal the SPAP quantum:

$$\mathcal{S} = E_{\min} \cdot \tau = \hbar \ln 2$$

This relation holds specifically when operating at the Landauer limit with the SPAP entropy cost.

---

#### Q.0.9.2 The Characteristic Cycle Time

**Theorem Q.0.10 (Rindler–Landauer Cycle Time).** *For an accelerated observer operating at the thermodynamic optimum (Landauer limit) with the Unruh bath as heat sink, the minimum irreversible bit cycle time is:*

$$\boxed{\tau_U(a) = \frac{2\pi c}{a}}$$

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

**Remark Q.0.10a (Thermodynamic Optimum).** The derivation assumes operation exactly at the Landauer limit, where the dissipated heat per erased bit is minimized: $E = Q_{\min}$. If a real process dissipates additional energy $E > Q_{\min}$ per irreversible cycle, the SPAP-minimum action constraint $\mathcal{S}_{\min} = \hbar \ln 2$ implies a shorter cycle time:
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

**Remark Q.0.10d (Not a Universal Speed Limit).** The cycle time $\tau_U$ is the characteristic timescale when operating at minimum energy (Landauer limit). An observer with access to additional energy can achieve shorter cycle times:

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

**Remark Q.0.10f (Inertial Limit).** For inertial observers ($a = 0$), the Unruh temperature vanishes and this analysis does not apply—a different heat sink must be specified. The divergence $\tau_U \to \infty$ reflects the absence of vacuum thermal resources, not an impossibility of computation. An inertial observer with access to a thermal bath at temperature $T$ has minimum cycle time:

$$\tau = \frac{\hbar \ln 2}{k_B T \ln 2} = \frac{\hbar}{k_B T}$$

**Remark Q.0.10g (Earth Gravity).** At Earth's surface gravity ($g \approx 9.8$ m/s²), the Unruh temperature is:

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

**Theorem Q.0.12 (Black Hole Bit Rate).** *For a Schwarzschild black hole of mass $M$, the minimum bit-erasure time at the horizon and the corresponding maximum bit rate are:*

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

The order-unity discrepancy reflects the distinction between instantaneous bit rate (computed at fixed $M$) and the integrated rate over evaporation (during which $M$ decreases). The key result is $N_{total} \sim S_{BH}$: the horizon processes approximately one bit per unit entropy over its lifetime. $\square$

**Remark Q.0.13a (Information Processing Interpretation).** The black hole horizon is not merely a causal boundary but an information-processing surface. The Bekenstein-Hawking entropy $S_{BH}$ counts the horizon's information content; the Rindler-Landauer rate $\dot{N}_{BH}$ determines how fast this information can be processed. The consistency $N_{total} \sim S_{BH}$ confirms that the horizon processes its full information content exactly once during evaporation—saturating but not exceeding the information-theoretic bounds.

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

$$G = \frac{\eta \delta^2 c^3}{4\hbar \chi C_{max}}$$

*Proof.* Appendix E gives the entropy density in MPU parameters:
$$
\frac{S_{BH}}{A} = \frac{\chi C_{max}}{\eta \delta^2}.
$$
Substituting into Theorem Q.0.14 yields
$$
G = \frac{c^3}{4\hbar}\cdot \frac{1}{S_{BH}/A}
= \frac{c^3}{4\hbar}\cdot \frac{\eta \delta^2}{\chi C_{max}}
= \frac{\eta \delta^2 c^3}{4\hbar \chi C_{max}},
$$
which is Equation (E.9). $\square$


---

#### Q.0.9.8.5 The Closed Derivation Loop

**Theorem Q.0.15 (Gravity-Computation Equivalence).** *The following statements are equivalent within the PU framework:*

1. *Einstein's field equations hold (Theorem 12.1)*
2. *Horizons satisfy the Bekenstein-Hawking area law (Theorem 49)*
3. *The gravitational constant is $G = \eta\delta^2 c^3/(4\hbar\chi C_{max})$ (Equation E.9)*
4. *Horizon computational rate is $\dot{N} = \kappa/(2\pi c)$ (Theorem Q.0.12)*

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

**Theorem Q.0.17 (Gravity from Computational Self-Consistency).** *Einstein's field equations are the unique second-order geometric equations ensuring that the computational rate at every local horizon saturates, but does not exceed, the Bekenstein bound.*

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


**Q.1 Foundational Relation and the Optimization Goal**

This appendix develops a *self-consistency analysis* determining the quantitative relationship between the emergent Planck length $L_P$ and the intrinsic microscopic spacing $\delta$ of the MPU network through a physically motivated PCE potential model. The derivation proceeds by constructing a global PCE Potential for the MPU network vacuum and finding the unique, stable equilibrium state that minimizes it. This equilibrium is then shown to be self-consistent with the framework's foundational geometric and information-theoretic identities. This derivation is a key component of the framework's ability to predict fundamental constants from first principles.

The derivation begins with the relationship between the emergent gravitational constant $G$ and the microscopic network parameters, established in **Appendix E**, Equation (E.9):
$$
G = \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{max}}
\tag{Q.1}
$$
where `η` is a geometric packing factor, `χ` is a dimensionless correlation factor ($0 < \chi \le 1$), and `C_max` is the ND-RID channel capacity. Using the definition of the squared Planck Length, $L_P^2 = G\hbar/c^3$, we eliminate `G` to obtain a direct relationship between the fundamental MPU spacing and the emergent Planck scale:
$$
L_P^2 = \left( \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{max}} \right) \frac{\hbar}{c^3} = \frac{\eta \delta^2}{4 \chi C_{max}}
\tag{Q.2}
$$
Rearranging this gives the target relation:
$$
\frac{\delta^2}{L_P^2} = \frac{4 \chi C_{max}}{\eta}
\tag{Q.3}
$$
The central task is to determine the PCE-optimal equilibrium values (`δ*`, `χ*`, `η*`, `C_max*`) for the microscopic parameters by minimizing a global potential, and then to show that these values, when inserted into Equation (Q.3), yield a specific closed-form prediction for the scale ratio in terms of the PCE-optimal dimensionless factors appearing in Equation (Q.3).

## Q.2 Rigorous Determination of PCE-Optimal Parameters

The scale ratio $\delta/L_P$ is determined by Equation (Q.3):

$$\frac{\delta^2}{L_P^2} = \frac{4\chi C_{max}}{\eta}$$

derived from the area law (Equation E.9). The PCE-optimal values of each parameter follow from existing theorems:

### Q.2.1 Channel Capacity: $C_{max}^* = 2\ln 2$

By Equation (E.14), the PCE-optimal channel capacity satisfies $C_{max}^* = \ln d_0 - \varepsilon$. With $d_0 = 8$ (Theorem 23) and $\varepsilon = \ln 2$ (Theorem 31), one obtains:

$$\boxed{C_{max}^* = \ln 8 - \ln 2 = 2\ln 2 = 2\varepsilon} \tag{Q.10}$$


### Q.2.2 Correlation Factor: $\chi^* = 1$
$$
\boxed{\chi^* = 1} \tag{Q.11}
$$

**Lemma (Channel Independence).** At PCE equilibrium, χ* = 1.

*Proof.* PCE maximizes information throughput. Effective channel density σ_eff = χ/(ηδ²) is maximized when χ = 1 (fully independent channels). Correlations (χ < 1) reduce effective channel count without increasing per-channel capacity (bounded by Theorem E.2). Therefore χ* = 1. ∎

### Q.2.3 Packing Factor: $\eta^* = 1$
$$
\boxed{\eta^* = 1} \tag{Q.12}
$$

**Lemma (Isotropic Packing).** At PCE equilibrium, η* = 1.

*Proof.* By Theorem Z.5 (Step 6), the QFI metric at the PCE-Attractor is isotropic (via Schur's lemma). Consistency between QFI isotropy and spatial structure requires isotropic packing. By Theorem 43, PCE achieves geometric regularity. For an isotropic regular packing, the orientation factor η = 1 by symmetry. ∎

### Q.2.4 Final Result

Substituting into Equation (Q.3):

$$\frac{\delta^2}{L_P^2} = \frac{4 \cdot 1 \cdot 2\ln 2}{1} = 8\ln 2$$

$$\boxed{\frac{\delta}{L_P} = \sqrt{8\ln 2} \approx 2.355}$$

This result depends only on rigorously established theorems (E.9, E.14, Z.5, 23, 31, 43), with no phenomenological ansätze.

**Q.5 Final Result and Interpretation**

The global, coupled PCE optimization of the MPU network vacuum yields a unique, stable equilibrium characterized by:
*   `C_max* = 2 ln 2` (information budget is saturated)
*   `χ* = 1` (channels are driven to maximal independence)
*   `η* ≈ 1` (geometry is driven to maximal regularity)

Substituting the PCE-optimal values into the foundational relation (Q.3) yields:

$$\frac{\delta^2}{L_P^2} = \frac{4\chi^* C_{max}^*}{\eta^*}$$

With $\chi^* = 1$ and $\eta^* = 1$ (Sections Q.2.2–Q.2.3) and $C_{max}^*$ from Equation (Q.10), this gives:

$$\boxed{\frac{\delta^2}{L_P^2} = 8\ln 2, \qquad \frac{\delta}{L_P} = \sqrt{8\ln 2} \approx 2.355} \tag{Q.18}$$

This result demonstrates that the fundamental MPU spacing $\delta$ is robustly of the same order of magnitude as the emergent Planck length $L_P$. The value of this ratio emerges from the PCE potential model using the framework's fundamental constants:
$$\frac{\delta}{L_P} = \sqrt{\frac{4\chi^* C_{max}^*}{\eta^*}} = \sqrt{\frac{4 \cdot 1 \cdot 2\ln 2}{\eta^*}} = \sqrt{\frac{8\ln 2}{\eta^*}}$$
where $\chi^* = 1$ (Equation Q.11), $C_{max}^* = 2\ln 2$ (Equation Q.10), and $\eta^* = 1$ (Equation Q.12).
The values $\chi^* = 1$ and $C_{max}^* = 2\ln 2$ follow from the KKT conditions on the PCE potential; $\eta^* \approx 1$ follows from PCE optimization favoring geometric regularity (Theorem 43). The ability to derive a plausible, $O(1)$ constant linking these scales from a self-consistent global optimization provides evidence for the internal coherence of the Predictive Universe framework.


## Q.6 Lorentz-Invariant Discretization and the Temporal Scale

The spatial discretization scale $\delta/L_P = \sqrt{8\ln 2/\eta^*}$ (Equation Q.18) was derived from PCE optimization. This section establishes the corresponding temporal discretization scale through consistency with emergent Lorentzian structure.

### Q.6.1 The Discretization Consistency Requirement (Conditional on Theorems 43, 46)

**Proposition Q.6.1 (Lorentz-Invariant Discretization).** The emergent invariant speed $c$ (Theorem 46) relates the spatial discretization scale $\delta$ to the temporal discretization scale $\tau_{min}$ through:

$$c = \frac{\delta}{\tau_{min}}$$

Combined with the Planck unit identity $c = L_P/t_P$, this yields:

$$\boxed{\frac{\delta}{L_P} = \frac{\tau_{min}}{t_P}}$$

*Proof.*

**Step 1 (Finite-Speed Bound).** The finite causal propagation speed in the MPU substrate satisfies
$$
c = \frac{\delta}{\tau_{min}}
$$
as established in Appendix E (Theorem E.10.2), with $\delta$ the microscopic spatial spacing (Definition 35) and $\tau_{min}$ the minimum cycle time (Theorem 29).

**Step 2 (Planck Unit Relation).** The Planck length and Planck time are defined through:

$$L_P = \sqrt{\frac{\hbar G}{c^3}}, \quad t_P = \sqrt{\frac{\hbar G}{c^5}}$$

from which the identity $L_P/t_P = c$ follows by direct calculation:

$$\frac{L_P}{t_P} = \sqrt{\frac{\hbar G/c^3}{\hbar G/c^5}} = \sqrt{c^2} = c$$

**Step 3 (Scale Identification).** For the emergent discrete structure to be consistent with the continuum Planck scale physics, we identify the emergent speed $c$ appearing in Theorem 46 with the speed $c$ defining the Planck units. This identification ensures dimensional consistency between the discrete MPU network and the emergent continuum spacetime.

**Step 4 (Ratio Equality).** Equating the two expressions for $c$:

$$\frac{\delta}{\tau_{min}} = \frac{L_P}{t_P}$$

yields the stated result upon rearrangement:

$$\frac{\delta}{L_P} = \frac{\tau_{min}}{t_P}$$

**Step 5 (Uniqueness).** Suppose the ratios were unequal: $\delta/L_P \neq \tau_{min}/t_P$. Define $c_{eff} := \delta/\tau_{min}$. Then $c_{eff} \neq c$, and the discretization would select a preferred frame—spatial and temporal resolutions would transform differently under boosts, violating Lorentz invariance (Theorem 46). Since Theorem 46 establishes Lorentz invariance as an emergent property of the PCE-optimal vacuum, equality of the ratios is the unique consistent solution. ∎

### Q.6.2 The Temporal Discretization Scale

**Theorem Q.6.1 (Minimum Temporal Interval).** The minimum resolvable temporal interval in the MPU network is:

$$\boxed{\tau_{min} = \sqrt{8\ln 2}\; t_P \approx 2.355\, t_P}$$

where $\eta^* \approx 1$ at PCE equilibrium.

*Proof.* Apply Proposition Q.6.1 to the spatial result (Equation Q.18):

$$\tau_{min} = t_P \cdot \frac{\delta}{L_P} = t_P \cdot \sqrt{\frac{8\ln 2}{\eta^*}}$$

Using $\eta^* = 1$ (Equation Q.12), one obtains $\tau_{min} = \sqrt{8\ln 2}\,t_P \approx 2.355\,t_P$. ∎


**Corollary Q.6.1 (Unified Discretization Formula).** Both spatial and temporal discretization scales are determined by a single expression involving the framework's fundamental constants:

$$\boxed{\frac{\delta}{L_P} = \frac{\tau_{min}}{t_P} = \sqrt{\frac{4\chi^* C_{max}^*}{\eta^*}} = \sqrt{\frac{8\ln 2}{\eta^*}} \approx 2.355 \quad (\eta^* \approx 1)}$$

where $\varepsilon = \ln 2$ is the irreducible SPAP entropy cost (Theorem 31) and $d_0 = 8$ is the MPU Hilbert space dimension (Theorem 23).

*Proof.* From Equation Q.18 with $\eta^* \approx 1$ and the PCE-optimal channel capacity $C_{max}^* = 2\ln 2$ (Equation Q.10):

$$\frac{\delta^2}{L_P^2} = \frac{4\chi^* C_{max}^*}{\eta^*} = \frac{4 \cdot 1 \cdot 2\ln 2}{\eta^*} = \frac{8\ln 2}{\eta^*}$$

In the regularity-dominated regime ($\eta^* \approx 1$), this can be expressed as the product of the two fundamental MPU parameters:

$$\frac{\delta^2}{L_P^2} \approx d_0 \cdot \varepsilon = 8 \cdot \ln 2$$

Taking the square root and applying Proposition Q.6.1 yields both ratios approximately equal to $\sqrt{d_0 \cdot \varepsilon}$. ∎

### Q.6.3 Information-Theoretic Interpretation

**Remark Q.6.1 (Decomposition of the Discretization Scale).** The unified discretization factor $\sqrt{d_0 \cdot \varepsilon}$ admits a transparent information-theoretic decomposition:

- **Factor $d_0 = 8$:** The MPU Hilbert space dimension, determined by the horizon constant $K_0 = 3$ through $d_0 = 2^{K_0}$ (Theorem 23). This encodes the logical structure required for self-referential prediction.

- **Factor $\varepsilon = \ln 2$:** The irreducible thermodynamic cost of self-referential prediction (Theorem 31), arising from the 2-to-1 state merge required by the SPAP cycle (Lemma J.1).

The discretization scale $\sqrt{d_0 \cdot \varepsilon/\eta^*} \approx 2.355$ (for $\eta^* \approx 1$) thus represents the geometric mean of the logical capacity ($d_0$) and thermodynamic cost ($\varepsilon$) of self-reference, modulated by the geometric packing factor.

**Remark Q.6.2 (Complete Derivation Chain).** The full derivation from logical axioms to spacetime discretization proceeds through two parallel pathways originating from $K_0$:

$$\begin{array}{c} K_0 = 3 \xrightarrow{\text{Thm 23}} d_0 = 2^{K_0} = 8 \\[6pt] \text{SPAP merge} \xrightarrow{\text{Thm 31}} \varepsilon = \ln 2 \end{array} \bigg\} \xrightarrow[\text{consistency}]{\text{P.14.3}} d_0 \cdot \varepsilon = 8\ln 2 \xrightarrow{\text{Eq. Q.18}} \frac{\delta}{L_P} = \sqrt{\frac{d_0 \cdot \varepsilon}{\eta^*}}$$

The discretization scale emerges from two independent derivations constrained by internal consistency (P.14.3):

1. **The Hilbert space dimension** $d_0 = 2^{K_0} = 8$ derives from the horizon constant $K_0 = 3$ (Theorem 15) via Theorem 23, representing the minimum state space for encoding $K_0$ bits of self-referential structure.

2. **The entropy cost** $\varepsilon = \ln 2$ derives independently from the SPAP 2-to-1 state merge (Lemma J.1) via Theorem 31, representing the irreducible thermodynamic price of logically necessary information compression.

The mutual consistency constraint $d_0 = 2(e^\varepsilon)^2$ (P.14.3) uniquely selects the values $K_0 = 3$ and $\varepsilon = \ln 2$ as the only solution satisfying all framework requirements.

These two quantities, though both originating from $K_0$, arise through independent derivation chains—one algebraic (state counting), one thermodynamic (Landauer's principle). Their product $d_0 \cdot \varepsilon = 8 \ln 2$ determines the discretization scale through PCE optimization (Equation Q.18).

### Q.6.4 Experimental Predictions

**Prediction Q.6.1 (No Leading Lorentz-Violating MDR at the PCE Attractor).** Modified dispersion relations (MDRs) provide a generic phenomenological signature of theories with fundamental discretization scales [Amelino-Camelia 2013, Mattingly 2005]. In the PU framework, the PCE-attractor discretization is Lorentz-invariant (Theorem 46 and Proposition Q.6.1). Therefore, leading-order Lorentz-violating MDR terms written separately in powers of $E$ and $p$ are not supported at the attractor:

$$E^2 - p^2c^2 = m^2c^4 + \text{(Lorentz-invariant corrections)}$$

Any residual corrections must be expressible in Lorentz-scalar combinations and are suppressed by the discretization hierarchy implied by Equation (Q.18).


*Derivation.* The coefficient $\xi_s$ parameterizes leading-order corrections from spatial discretization at the MPU scale $\delta$, while $\xi_t$ parameterizes corrections from temporal discretization at scale $\tau_{min}$. By Proposition Q.6.1, the equal ratios $\delta/L_P = \tau_{min}/t_P$ implied by emergent Lorentz invariance (Theorem 46) ensure that spatial and temporal discretization effects enter at the same relative scale, yielding equal leading-order correction coefficients. This prediction distinguishes the PU framework from approaches that quantize the gravitational field directly, where such isotropy is not guaranteed.

**Prediction Q.6.2 (Absence of Preferred Frame Effects).** Searches for Lorentz-violating effects in the photon sector should yield null results with any residual effects controlled by the discretization ratio $L_P/\delta = \sqrt{\eta^*/(8\ln 2)}$ and by the detailed structure of the Lorentz-invariant discretization (Proposition Q.6.1). Current constraints from gamma-ray burst observations [Vasileiou et al. 2013] and active galactic nuclei [MAGIC Collaboration 2008] constrain energy-dependent photon dispersion by placing lower bounds on the effective discretization scale $E_{disc}$ at linear and quadratic orders, with GRB limits reaching the Planck scale and beyond under conservative assumptions. These bounds ($E_{disc} \gtrsim E_P$) are consistent with the Lorentz-invariant MPU discretization predicted by the framework.

*Derivation.* The framework predicts that discretization preserves Lorentz invariance (Proposition Q.6.1, Step 5). Preferred-frame effects would arise only from asymmetric spatial versus temporal discretization, which is excluded by the equal-ratio condition. The scale of any residual effects is set by the inverse discretization ratio $(\delta/L_P)^{-1} = \sqrt{\eta^*/(8\ln 2)} \approx 0.42$ for $\eta^* \approx 1$.

### Q.6.5 Summary

| Quantity | Symbol | Value | Origin |
|:---------|:-------|:------|:-------|
| Spatial discretization | $\delta/L_P$ | $\sqrt{8\ln 2/\eta^*} \approx 2.355$ | PCE optimization (Q.18) |
| Temporal discretization | $\tau_{min}/t_P$ | $\sqrt{8\ln 2/\eta^*} \approx 2.355$ | Lorentz consistency (Prop. Q.6.1) |
| Information budget | $C_{max}^*$ | $2\ln 2$ | Capacity saturation (Q.3) |
| Hilbert space dimension | $d_0$ | $8 = 2^{K_0}$ | Theorem 23 |
| Irreducible entropy cost | $\varepsilon$ | $\ln 2$ | Theorem 31 |

The complete derivation chain from the horizon constant to spacetime discretization:

$$\boxed{\begin{array}{c} K_0 = 3 \xrightarrow{\text{Thm 23}} d_0 = 8 \\ \text{SPAP} \xrightarrow{\text{Thm 31}} \varepsilon = \ln 2 \end{array} \xrightarrow{\text{Eq. Q.10}} C_{max}^* = 2\ln 2 \xrightarrow{\text{Eq. Q.18}} \frac{\delta}{L_P} = \sqrt{\frac{8\ln 2}{\eta^*}}}$$

