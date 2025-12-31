# Appendix Q: Derivation of the Planck-MPU Scale Ratio

## Q.0 The Action-Entropy Identity and the Origin of Planck's Constant

Before deriving the quantitative relationship between the MPU spacing δ and the Planck length L_P, we establish a foundational result: the identification of Planck's constant ℏ as the exchange rate between information-theoretic and mechanical descriptions of physical processes. This identification emerges from the Action-Entropy Identity, which reveals that physical action measures cumulative irreversible entropy production.

### Q.0.1 The Puzzle of Least Action

The Principle of Least Action stands as one of the most powerful organizing principles in physics. From it, classical mechanics, field theory, and the path integral formulation of quantum mechanics can be derived. Yet the standard presentation offers no explanation for *why* nature should extremize this particular quantity—the integral of the Lagrangian over time.

Within the Predictive Universe framework, this puzzle admits a resolution: the Principle of Least Action is not fundamental but derived. It is the continuous manifestation of a deeper principle: the **Principle of Minimum Entropy Production**, operating through the irreducible costs of predictive processing.

### Q.0.2 The Discrete Predictive Cost Functional

The MPU network executes cyclical predictive operations, each cycle implementing the Fundamental Predictive Loop (Definition 4):

$$\text{Predict} \to \text{Verify} \to \text{Update}$$

Each non-trivial cycle incurs the irreducible SPAP entropy cost ε ≥ ln 2 nats (Theorem 31, Appendix J). This cost arises from the logically irreversible 2-to-1 state merge required by self-referential prediction (Lemma Z.2), and by Landauer's principle, necessarily manifests as thermodynamic entropy production.

**Definition Q.0.1 (Discrete Predictive Action).** For a trajectory of the MPU network over N predictive cycles, the *discrete predictive action* is the cumulative SPAP entropy:

$$\mathcal{S}_{disc} := \sum_{i=1}^{N} \varepsilon_i$$

where ε_i ≥ ln 2 is the entropy production of the i-th cycle. This quantity counts the total irreversible entropy cost required to evolve the network configuration along the specified trajectory.

**Proposition Q.0.1 (Action Bounds).** For any trajectory involving N_ops non-trivial predictive operations:

$$\mathcal{S}_{disc} \geq N_{ops} \cdot \ln 2$$

*Proof.* Each non-trivial operation contributes at least the SPAP minimum ε = ln 2 nats by Theorem 31. QED

**Remark (Entropy Unification).** The quantity ε appearing here is the same SPAP entropy that, through the derivation chain of Thesis P.6.1 (Appendix P), connects to Shannon, von Neumann, thermodynamic, and Bekenstein-Hawking entropy. The discrete predictive action thus inherits this unified structure: it counts entropy in the foundational sense established by the framework.

### Q.0.3 The Continuum Limit via Γ-Convergence

The discrete predictive cost functional converges to a continuum action in the limit of fine network resolution. This convergence is established rigorously by the Γ-convergence framework (Theorem D.8, Appendix D; Section O.7, Appendix O).

**Theorem Q.0.1 (Action-Entropy Identity).** Let {G_h}_{h→0} be a family of MPU networks with mesh size h → 0 approximating a spacetime region. Under the conditions of equi-coercivity and locality (Theorem D.8), the discrete predictive action Γ-converges to the continuum action:

$$\mathcal{S}_{disc}^{(h)} \xrightarrow{\Gamma} \frac{1}{\hbar} \int d^4x \sqrt{|g|} \, \mathcal{L}(u, \partial_\mu u)$$

where L is the Lagrangian density and the factor 1/ℏ converts between nats and conventional action units.

The key elements of the proof (detailed in Appendices D and O) are:

1. **Spatial sector:** The discrete cost for spatial variations Γ-converges to a positive-definite quadratic form defining the emergent Riemannian metric on spatial slices.

2. **Temporal sector:** The irreversibility of the 'Evolve' process (ε > 0, Theorem 31) introduces a sign asymmetry. The dissipative structure of temporal updates yields a kinetic term with opposite sign to the spatial gradient terms, establishing the Lorentzian signature (−, +, +, +).

3. **Combined action:** The full Γ-limit yields the standard action for fields in curved spacetime, with ℏ appearing as the conversion factor between discrete (nats) and continuous (J·s) descriptions.

**Corollary Q.0.1 (Action-Entropy Identity).** Physical action, measured in units of ℏ, equals the total SPAP entropy production:

$$\boxed{\frac{\mathcal{S}}{\hbar} = \sum_{\text{cycles}} \varepsilon_i}$$

This identity connects the mechanical description of physics (action in J·s) to the information-theoretic description (entropy in nats), with ℏ serving as the conversion factor.

### Q.0.4 Planck's Constant as Exchange Rate

The Action-Entropy Identity reveals that ℏ serves as a conversion factor between two descriptions of the same physical process: the information-theoretic description (counting SPAP entropy in nats) and the mechanical description (measuring action in J·s). We now establish this identification without circularity.

**Theorem Q.0.2 (Planck's Constant as Necessary Exchange Rate).** Any physical instantiation of the predictive framework requires a conversion factor ℏ > 0 between SPAP entropy (nats) and physical action (J·s). This constant is determined by the framework's fundamental scales.

*Proof.*

**Step 1 (Existence of Minimum Scales).** The SPAP cycle requires both minimum duration τ_min > 0 and minimum energy E_min > 0 to maintain predictive coherence (Theorem 29). These scales are determined by the logical structure of self-reference and the requirement of physical instantiation (PPI, Definition P.6.2). Crucially, their existence is established independently of any assumed value of ℏ.

**Step 2 (Minimum Action).** Any complete predictive cycle has an associated physical action:

$$\mathcal{S}_{min} = E_{min} \cdot \tau_{min} > 0$$

This is the minimum "mechanical cost" of executing one irreversible predictive operation.

**Step 3 (Minimum Entropy).** The same cycle has SPAP entropy cost ε_min = ln 2 nats (Theorem 31). This is the minimum "information-theoretic cost" of one irreversible operation, determined by the 2-to-1 state merge required by self-referential prediction (Lemma Z.2).

**Step 4 (Conversion Factor).** Since both quantities describe the same physical process—one complete predictive cycle—a conversion factor must exist relating them:

$$\hbar := \frac{\mathcal{S}_{min}}{\varepsilon_{min}} = \frac{E_{min} \cdot \tau_{min}}{\ln 2}$$

This *defines* ℏ as the action-per-nat of SPAP entropy—the exchange rate between mechanical and information-theoretic descriptions.

**Step 5 (Self-Consistency).** With ℏ so defined, the energy-time relation τ_min · E_min ~ ℏ follows as an identity (up to factors of order unity determined by the detailed dynamics), not as an input assumption. The uncertainty relation is a consequence of the discrete predictive structure, not a premise. QED

**Corollary Q.0.2 (Dimensional Identity).** Planck's constant has the dimensional role:

$$\boxed{\hbar = \frac{[\text{Action}]}{[\text{Entropy}]} = \frac{\text{J} \cdot \text{s}}{\text{nat}}}$$

It is the universal exchange rate between mechanical and information-theoretic descriptions of physical processes. This parallels the role of other fundamental constants as exchange rates (Section P.6.5.5): k_B converts between temperature and energy, c between space and time, and ℏ between action and entropy.

**Remark Q.0.1 (What Is and Is Not Derived).** The framework derives:
- The *existence* of ℏ as a necessary conversion factor
- The *meaning* of ℏ as action-per-nat of SPAP entropy  
- The *role* of ℏ in connecting discrete and continuous descriptions

The framework does not derive the numerical value ℏ ≈ 1.055 × 10⁻³⁴ J·s from pure logic. This value is fixed by one measurement, just as the numerical value of c requires measuring the speed of light. The framework explains *what* ℏ is; experiment determines *how much* it is.

### Q.0.5 The Principle of Least Entropy Production

**Corollary Q.0.3 (Least Action as Least Entropy).** The Principle of Least Action:

$$\delta \mathcal{S} = 0$$

is equivalent to the Principle of Minimum SPAP Entropy Production:

$$\delta \left( \sum_i \varepsilon_i \right) = 0$$

*Proof.* By the Action-Entropy Identity (Corollary Q.0.1), S/ℏ = Σ ε_i. Since ℏ > 0 is constant, extremizing S is equivalent to extremizing the total entropy cost. QED

**Physical Interpretation:** Nature "chooses" paths that minimize action because the universe, as a predictive system operating under PCE, minimizes the total irreversible entropy production required to evolve from one configuration to another. The path of least action is the path requiring minimum SPAP entropy—the path of maximum predictive efficiency.

This resolves the foundational puzzle: the action principle is not an unexplained postulate but a consequence of the Principle of Compression Efficiency operating through the irreducible costs of predictive processing.

### Q.0.6 Connection to the Path Integral

The Action-Entropy Identity provides an information-theoretic interpretation of the Feynman path integral.

**Proposition Q.0.2 (Path Integral as Entropy Sum).** The path integral amplitude:

$$\langle \phi_f | \phi_i \rangle = \int \mathcal{D}\phi \, e^{i\mathcal{S}[\phi]/\hbar}$$

admits the interpretation:

$$\langle \phi_f | \phi_i \rangle = \int \mathcal{D}\phi \, e^{i \sum_k \varepsilon_k[\phi]}$$

where Σ_k ε_k[φ] is the total SPAP entropy cost along path φ.

*Proof.* Direct substitution of the Action-Entropy Identity (Corollary Q.0.1). The Lorentzian action $\mathcal{S}[\phi]$ can take positive or negative values depending on the balance of kinetic and potential terms, yielding the oscillatory phase factor characteristic of quantum amplitudes. QED

**Corollary Q.0.4 (Interference as Entropy Phase Matching).** Quantum interference arises from the phase accumulated through irreversible predictive operations:

$$\phi_{quantum} = \frac{\mathcal{S}}{\hbar} = \sum_i \varepsilon_i$$

Paths with equal total SPAP entropy cost (mod 2π) interfere constructively. The discrete structure of irreversible operations underlies the wave-like behavior of quantum mechanics.

### Q.0.7 Summary: The Foundation for Planck-Scale Physics

This section has established:

1. **Action-Entropy Identity:** S/ℏ = Σ ε_i (physical action counts SPAP entropy)

2. **ℏ as Exchange Rate:** Planck's constant converts between nats and J·s, paralleling k_B, c, and G as inter-domain exchange rates

3. **Least Action Derived:** The action principle follows from PCE-driven minimization of irreversible entropy production

4. **Path Integral Interpretation:** Quantum phases are accumulated SPAP entropy costs

These results provide the conceptual foundation for the quantitative derivations that follow. In particular, the appearance of ℏ in the fundamental relation G = ηδ²c³/(4ℏχC_max) (Equation Q.1 below) is now understood: ℏ converts the information-theoretic channel capacity C_max (in nats) to the mechanical units required for the gravitational constant G. The constants ℏ, k_B, c, and G form a complete set of exchange rates connecting the operational domains of the framework (cf. Section P.6.5.5).

The remainder of this appendix derives the specific numerical relationship δ/L_P ≈ 2.355 by minimizing the global PCE potential subject to the framework's information-theoretic constraints.


### Q.0.8 Action Quantization and the Computational Structure of Interference

The Action-Entropy Identity (Corollary Q.0.1) establishes that $\mathcal{S}/\hbar = \sum_i \varepsilon_i$. At the SPAP minimum, each irreversible cycle contributes $\varepsilon = \ln 2$ nats (Theorem 31, Appendix J). This section derives the conditions under which the total cycle count $N$ is constrained to discrete values, yielding a quantization of action with observable consequences.

---

#### Q.0.8.1 The Cycle Number

**Definition Q.0.3 (Cycle Number).** For a process $\phi$ in the MPU network, the *cycle number* is the total count of irreversible SPAP operations:

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

**Remark Q.0.4b (Non-Integer Period and Resolution).** The period $2\pi/\ln 2 \approx 9.0647$ is not an integer and is believed to be irrational (no known algebraic relation between $\pi$ and $\ln 2$ would make the ratio rational). This creates a tension between two constraints:

1. *Discrete constraint:* Integer cycle counts $N \in \mathbb{Z}$ are enforced by the atomic structure of SPAP operations (Proposition Q.0.3).

2. *Interference constraint:* Constructive interference requires $N_\gamma \ln 2 = 2\pi k$ for integer $k$.

Assuming $2\pi/\ln 2$ is irrational (as expected from the absence of known algebraic relations), exact satisfaction of both constraints simultaneously is impossible for generic closed paths. The resolution occurs in two regimes:

**(a) Macroscopic regime ($N \gg 1$):** The Γ-convergence (Theorem Q.0.1) maps the discrete action to the continuum action. For macroscopic processes with $N \gg 1$, the fractional part of $N \cdot \ln 2 / (2\pi)$ samples the unit interval quasi-uniformly by Weyl's equidistribution theorem [Weyl 1916], provided $\ln 2/(2\pi)$ is irrational as expected. The effective phase distribution becomes continuous, recovering standard quantum mechanics.

**(b) Fundamental regime ($N \sim 1$):** Only specific closed paths with integer cycle counts satisfying $|N \ln 2 - 2\pi k| < \delta$ for small tolerance $\delta$ exhibit approximate constructive interference. This predicts that at Planck scales, not all closed paths support coherent quantum amplitudes—a falsifiable structural prediction.

---

#### Q.0.8.3 Vacuum Excitation Structure from Leech Geometry

The Leech lattice structure of the vacuum (Theorem Z.8c, Appendix Z) provides constraints on excitations above the ground state. The derivation chain proceeds: SPAP → Landauer cost → Golay code → Leech lattice.

**Proposition Q.0.5 (Shell Structure).** *Excitations above the PCE-Attractor vacuum correspond to Leech lattice vectors $v \in \Lambda_{24}$ with squared norm $|v|^2 \in \{0, 4, 6, 8, 10, 12, \ldots\}$. The minimum non-trivial excitation has $|v|^2_{\min} = 4$.*

*Proof.* 

**Step 1 (Leech lattice from Golay code).** The extended binary Golay code $\mathcal{G}_{24} = [24, 12, 8]$ is selected by PCE optimization (Theorem Z.13) as the unique optimal error-correcting code on $M = 24$ interface modes. The Leech lattice $\Lambda_{24}$ is constructed from $\mathcal{G}_{24}$ via the gluing construction [Conway & Sloane 1999]: the base lattice $L_0 = \sqrt{2}E_8 \oplus \sqrt{2}E_8 \oplus \sqrt{2}E_8$ is extended by Golay-determined cosets,

$$\Lambda_{24} = \bigcup_{c \in \mathcal{G}_{24}} (g_c + L_0)$$

where $g_c$ are glue vectors determined by codeword $c$. This yields a disjoint union of $|\mathcal{G}_{24}| = 2^{12} = 4096$ cosets (Lemma R.4.5).

**Step 2 (Rootlessness).** The Leech lattice is the unique even unimodular lattice in 24 dimensions with no vectors of squared norm 2 [Conway 1969]. This rootlessness follows from the minimum distance $d = 8$ of the Golay code: vectors in $L_0$ have minimum squared norm 4 (from the $\sqrt{2}$ scaling), and the Golay code's minimum weight 8 ensures that glue-shifted vectors also satisfy $|v|^2 \geq 4$ (Proposition R.4.2a).

**Step 3 (Shell structure).** The theta series of the Leech lattice [Conway & Sloane 1999]:

$$\Theta_{\Lambda_{24}}(q) = 1 + 196560 q^4 + 16773120 q^6 + 398034000 q^8 + \cdots$$

confirms $|v|^2 \in \{0, 4, 6, 8, \ldots\}$ with the 196,560 minimal vectors at $|v|^2 = 4$. $\square$

**Theorem Q.0.5a (Mass-Action Correspondence).** *For a vacuum excitation corresponding to Leech lattice vector $v$, the mass satisfies:*

$$m^2(v) = \mu_0^2 \cdot |v|^2$$

*where $\mu_0 = m_P/(2\sqrt{8\varepsilon})$ is the fundamental mass scale (Definition Z.8f, Appendix Z).*

*Proof.* From the Mass-Information Equivalence (Theorem N.5, Appendix N), a system with relational information content $\mathcal{I}_{\text{rel}}$ has inertial mass:

$$m = \frac{\mathcal{I}_{\text{rel}}}{2\sqrt{8\varepsilon}} \cdot m_P$$

For lattice configurations, the QFI isotropy (Theorem Z.5) implies $\mathcal{I}_{\text{rel}}(v) = |v|$ in natural units. Therefore:

$$m(v) = \mu_0 |v|, \quad \mu_0 := \frac{m_P}{2\sqrt{8\varepsilon}} = \frac{m_P}{2\sqrt{8 \ln 2}} \approx 0.212 \, m_P$$

Squaring yields the energy-norm relation. $\square$

**Remark Q.0.5a.1 (Derivation Chain).** The mass-lattice correspondence follows from the complete derivation chain:

$$\text{SPAP} \xrightarrow{\text{Thm 31}} \varepsilon = \ln 2 \xrightarrow{\text{Thm Z.1}} a = 2 \xrightarrow{\text{Thm Z.5}} M = 24 \xrightarrow{\text{Thm Z.13}} \mathcal{G}_{24} \xrightarrow{\text{Constr. A}} \Lambda_{24} \xrightarrow{\text{Thm N.5}} m^2 = \mu_0^2 |v|^2$$

Each step is derived from prior axioms with no free parameters. The correspondence is a structural prediction of the framework; empirical verification requires connecting the discrete spectrum to observed particle masses through the full RG analysis of Appendix T.

**Remark Q.0.5a.2 (Phenomenological Status).** The Leech lattice shell structure provides a discrete mass spectrum at the fundamental scale. Connection to observed particle masses requires: (i) identification of vacuum excitations with physical particles, (ii) symmetry breaking mechanisms selecting specific lattice points, and (iii) RG flow from $\mu_0 \sim 0.2 \, m_P$ to electroweak scales. These developments appear in Appendices R (fermion generations) and T (electroweak hierarchy).

**Corollary Q.0.5b (Landauer-Shell Correspondence).** *The minimum Leech shell $|v|^2_{\min} = 4$ equals the squared Landauer pointer dimension $a^2 = (e^\varepsilon)^2 = 4$. This equality traces through the derivation chain:*

$$\varepsilon = \ln 2 \xrightarrow{\text{Thm Z.1}} a = e^\varepsilon = 2 \xrightarrow{} a^2 = 4 = |v|^2_{\min}$$

*Proof.* The equality $a^2 = 4$ follows immediately from $a = e^{\ln 2} = 2$. The equality $|v|^2_{\min} = 4$ follows from Leech lattice rootlessness (Proposition Q.0.5), which in turn follows from the Golay code's minimum distance $d = 8$ via the gluing construction (Proposition R.4.2a). The coincidence $a^2 = |v|^2_{\min}$ is not accidental: both trace to the same source through different paths in the derivation chain. The relation $d = 8 = 2a^2$ connects the information-theoretic constraint (Golay distance) to the geometric constraint (minimum shell norm). $\square$

**Corollary Q.0.5c (Discrete Mass Spectrum).** *The allowed squared masses for vacuum excitations form the discrete set:*

$$m^2 \in \{0, 4, 6, 8, 10, 12, \ldots\} \times \mu_0^2$$

*The mass gap is $\Delta_{\text{gap}} = 2\mu_0$ (Corollary Z.8g.1).*

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

*The interference pattern depends on $\Delta N \mod (2\pi/\ln 2)$.*

*Proof.* Constructive interference requires $\arg(2^{iN_1}) = \arg(2^{iN_2}) \mod 2\pi$, i.e., $N_1 \ln 2 = N_2 \ln 2 + 2\pi k$. Rearranging gives $(N_1 - N_2) \ln 2 = 2\pi k$. $\square$

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

**Step 2 (Cycle-action correspondence).** For a closed orbit with $N$ cycles at the SPAP minimum, the action is $\mathcal{S} = N \hbar \ln 2$. Constructive interference requires $\mathcal{S} = 2\pi k \hbar$ (Theorem Q.0.4), giving:

$$N \ln 2 = 2\pi k \implies N = \frac{2\pi}{\ln 2} k \approx 9.0647 \, k$$

**Step 3 (Quantization from interference).** The interference condition (Theorem Q.0.4) requires the total phase around a closed orbit to satisfy $\mathcal{S}/\hbar = 2\pi k$ for integer $k$. Therefore the allowed actions are:

$$\mathcal{S} = 2\pi k \hbar = k h$$

where $h = 2\pi\hbar$ is Planck's constant and $k \in \mathbb{Z}_{>0}$ is the quantum number.

**Step 4 (Bohr-Sommerfeld emergence).** The result $\mathcal{S} = kh$ is the Bohr-Sommerfeld quantization condition $\oint p \, dq = kh$ with $k$ as the quantum number. For $k = 1$, the corresponding SPAP cycle count is $N = 2\pi/\ln 2 \approx 9.06$ cycles per fundamental quantum.

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

**Remark Q.0.10a (Thermodynamic Limit).** The derivation assumes operation exactly at the Landauer limit, where $E = Q_{\min}$. Real processes require $E > Q_{\min}$, with the excess energy available for useful work or faster operation. The cycle time $\tau_U$ is therefore a *lower bound* on cycle time when the Unruh bath is the only available heat sink:

$$\tau \geq \tau_U(a) = \frac{2\pi c}{a}$$

with equality achieved only in the quasi-static limit.

---

#### Q.0.9.3 Physical Interpretation

**Corollary Q.0.10b (Proper Time to Horizon).** *The cycle time $\tau_U = 2\pi c/a$ equals $2\pi$ times the light-crossing time to the Rindler horizon at proper distance $\ell_R = c^2/a$:*

$$\tau_U = 2\pi \cdot \frac{c}{a} = 2\pi \cdot \frac{\ell_R}{c}$$

*The factor $2\pi$ reflects the thermal periodicity of the Euclidean Rindler geometry [Gibbons & Hawking 1977].*

*Proof.* The Rindler horizon lies at proper distance $\ell_R = c^2/a$ from the accelerating observer. The light-crossing time is $\ell_R/c = c/a$. The Euclidean continuation of Rindler spacetime has periodicity $\beta = 2\pi c/a$ in imaginary time, corresponding to the inverse Unruh temperature:

$$\beta = \frac{\hbar}{k_B T_U} = \frac{\hbar}{k_B \cdot \hbar a/(2\pi k_B c)} = \frac{2\pi k_B c}{k_B \cdot a} = \frac{2\pi c}{a}$$

The cycle time $\tau_U = \beta$ inherits this thermal periodicity. $\square$

**Corollary Q.0.10c (Bit Rate at Thermodynamic Optimum).** *At the Landauer limit, the maximum bit rate is:*

$$\dot{N}_U = \frac{1}{\tau_U} = \frac{a}{2\pi c}$$

**Remark Q.0.10d (Not a Universal Speed Limit).** The cycle time $\tau_U$ is the characteristic timescale when operating at minimum energy (Landauer limit). An observer with access to additional energy can achieve shorter cycle times:

$$\tau = \frac{\hbar \ln 2}{E} < \tau_U \quad \text{when} \quad E > Q_{\min}(a)$$

The relation $\dot{N}_{\max} = a/(2\pi c)$ applies specifically to thermodynamically optimal operation with only the Unruh bath as heat sink. It is an *efficiency-limited* rate, not an absolute computational speed limit.

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

*Proof.* The Bekenstein bound states $I \leq 2\pi ER/(\hbar c)$ for a system of energy $E$ confined to region of size $R$. For $E = k_B T_U$ (energy per thermal degree of freedom) and $R = c^2/a$ (horizon distance):

$$I_{\max} = \frac{2\pi k_B T_U \cdot (c^2/a)}{\hbar c} = \frac{2\pi}{\hbar c} \cdot \frac{\hbar a}{2\pi k_B c} \cdot k_B \cdot \frac{c^2}{a} = \frac{2\pi \cdot \hbar a \cdot k_B \cdot c^2}{2\pi k_B c \cdot \hbar c \cdot a} = 1$$

The Bekenstein bound permits exactly one nat of information content in a horizon-sized region at thermal energy $k_B T_U$. The framework's derived rate processes one nat per thermal time $\tau_U$, saturating but not exceeding this bound. $\square$

---

#### Q.0.9.7 Summary

The Rindler–Landauer cycle time $\tau_U = 2\pi c/a$ emerges from combining:
- Horizon thermodynamics (Unruh temperature)
- Information thermodynamics (Landauer bound)  
- Quantum action (SPAP minimum)

The complete cancellation of $\hbar$, $k_B$, and $\ln 2$ reveals that **at causal boundaries, the computational cost of irreversibility is purely geometric**—determined only by acceleration and the speed of light.

This provides an information-theoretic interpretation of the Unruh effect: the vacuum thermal bath at temperature $T_U$ is precisely calibrated to support one irreversible bit operation per time $2\pi c/a$ at the thermodynamic optimum. The result is self-consistent with the Bekenstein bound (Proposition Q.0.10h), confirming that horizon thermodynamics and information theory share a common foundation in the framework's predictive structure.


**Q.1 Foundational Relation and the Optimization Goal**

This appendix provides an *ab initio* derivation of the quantitative relationship between the emergent Planck length `L_P` and the intrinsic microscopic spacing `δ` of the MPU network. The derivation proceeds by constructing a global PCE Potential for the MPU network vacuum and finding the unique, stable equilibrium state that minimizes it. This equilibrium is then shown to be self-consistent with the framework's foundational geometric and information-theoretic identities. This derivation is a key component of the framework's ability to predict fundamental constants from first principles.

The derivation begins with the rigorous relationship between the emergent gravitational constant `G` and the microscopic network parameters, as rigorously established in **Appendix E** (Theorem E.6):
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
The central task is to determine the PCE-optimal equilibrium values (`δ*`, `χ*`, `η*`, `C_max*`) for the microscopic parameters by minimizing a global potential, and then to show that these values, when inserted into Equation (Q.3), yield a specific, parameter-free prediction for the scale ratio.

**Q.2 The Global PCE Potential for the MPU Vacuum**

The Principle of Compression Efficiency (PCE, Definition 15) dictates that the MPU network vacuum state is the configuration that minimizes a global PCE Potential per unit volume, `V_vac`. This potential must balance the costs of constructing and maintaining the network's predictive infrastructure against the benefits derived from its information processing capacity. We construct a minimal, physically motivated model for `V_vac` that captures these fundamental trade-offs. The variables (`δ`, `χ`, `η`, `C_max`) are treated as coupled degrees of freedom to be optimized.

The total potential per unit volume is modeled as:
$$
V_{vac}(δ, χ, η, C_{max}) = V_{packing}(δ) + V_{corr}(χ, C_{max}) + V_{geom}(η) - V_{utility}(δ, χ, η, C_{max})
\tag{Q.4}
$$
The components are:

1.  **Packing Cost `V_packing`:** The cost of maintaining the network's structural integrity. A denser network (smaller `δ`) is more costly. A stiffness-like penalty against compression, scaling with curvature-squared in a 3D lattice, provides a minimal model:
$$
    V_{packing}(δ) = \frac{k_1}{δ^4}
    \tag{Q.5}
    $$
1.  **Correlation Cost `V_corr`:** The resource cost of managing correlations and performing error correction to ensure reliable information channels. Fully independent channels (`χ=1`) are the baseline (zero cost), while introducing correlations (`χ<1`) for error correction incurs a complexity cost. This cost is expected to be convex near `χ=1` and is mitigated by a larger available channel capacity `C_max`. The simplest convex model is:
$$
    V_{corr}(χ, C_{max}) = \frac{k_2 (1 − χ)^2}{C_{max}}
    \tag{Q.6}
    $$
1.  **Geometric Regularity Cost `V_geom`:** As established by Theorem 43, PCE strongly favors regular geometries. We model this with a potential that has a unique minimum at `η=1`, representing an isotropic, impedance-matched lattice:
$$
    V_{geom}(η) = k_4 ( η + η^{-1} − 2 )
    \tag{Q.7}
    $$
1.  **Predictive Utility `V_utility`:** The benefit derived from the network's information processing capacity. This is proportional to the surface density of independent channels (`σ_link ≈ χ / (η δ^2)`) and the net usable information capacity per channel, which is the raw capacity `C_max` minus the irreducible processing cost `ε`.
$$
    V_{utility}(δ, χ, η, C_{max}) = k_3 \left[ \frac{χ (C_{max} − ε)}{η δ^2} \right]
    \tag{Q.8}
    $$
The coefficients `k_i` are positive constants (in Planck units) whose ratios are determined by the underlying physics of PCE.

**Q.3 Coupled Minimization of the PCE Potential**

We find the equilibrium state (`δ*`, `χ*`, `η*`, `C_max*`) by minimizing `V_vac` subject to the framework's fundamental constraints:
*   **Information Budget:** The available capacity is limited by the MPU's structure. From the PCE-optimal partitioning argument (Appendix E.7, Equation E.14), `C_{max} ≤ \ln(d_0) - ε`. With the rigorously derived values `d_0=8` (Theorem 23) and `ε=ln(2)` (Theorem 31), this gives the hard constraint:
$$
    C_{max} ≤ 2 \ln(2)
    \tag{Q.9}
    $$
*   **Physical Ranges:** `δ > 0`, `0 < χ ≤ 1`, `η > 0`.

The minimization proceeds via Karush-Kuhn-Tucker (KKT) conditions for the constrained variables `C_max` and `χ`.

**(a) Optimization in `C_max`:**
The partial derivative is `∂V_vac/∂C_max = -k_2(1-χ)^2/C_{max}^2 - k_3[χ/(ηδ^2)]`. This derivative is strictly negative for all `χ>0`. Therefore, `V_vac` decreases monotonically with `C_max`, and the constrained optimum must lie at the upper boundary.
$$
C_{max}^{*} = 2 \ln(2)
\tag{Q.10}
$$

**(b) Optimization in `χ`:**
The partial derivative is `∂V_vac/∂χ = -2k_2(1-χ)/C_{max} - k_3[(C_{max}-ε)/(ηδ^2)]`. At the boundary `χ=1`, the first term is zero, and the second term is strictly negative. The gradient `∂V_vac/∂χ` is therefore negative at `χ=1`, indicating that the potential decreases as `χ` approaches 1. The KKT condition forces the optimum to the boundary.
$$
χ^{*} = 1
\tag{Q.11}
$$
The system saturates its information budget and favors maximal channel independence to maximize predictive utility, as the cost of perfect independence is zero in this model.

**(c) Coupled Optimization in `δ` and `η`:**
With `C_max* = 2 ln(2)` and `χ* = 1`, the potential simplifies to:
$$
V(δ, η) = \frac{k_1}{δ^4} - \frac{k_3 (\ln 2)}{η δ^2} + k_4 ( η + η^{-1} − 2 )
\tag{Q.12}
$$
We find the stationary point by setting `∂V/∂δ = 0` and `∂V/∂η = 0`.
From `∂V/∂δ = -4k_1/δ^5 + 2k_3(\ln 2)/(ηδ^3) = 0`, we get:
$$
δ^{*2} = \frac{2 k_1 η^{*}}{k_3 \ln 2}
\tag{Q.13}
$$
From `∂V/∂η = k_3(\ln 2)/(η^2 δ^2) + k_4(1 - η^{-2}) = 0`, we get:
$$
k_4 (η^{*2} - 1) = - \frac{k_3 \ln 2}{δ^{*2}}
\tag{Q.14}
$$
The second derivatives (`∂²V/∂δ²`, `∂²V/∂η²`) are positive at the stationary point, and the Hessian determinant is positive, confirming it is a stable local minimum. Given the boundary behavior of the potential, it is the unique global minimum.

**Q.4 Self-Consistency Condition and Determination of `δ/L_P`**

The framework now imposes a powerful self-consistency check. We have two independent expressions for the optimal spacing `δ*`: one from minimizing the potential (Equation Q.13) and one from the foundational geometric identity (Equation Q.3). For the framework to be self-consistent, these must be equal at the equilibrium point.

Evaluating Equation Q.3 at the optimum (`C_max* = 2 ln(2)`, `χ* = 1`):
$$
\frac{\delta^{*2}}{L_P^2} = \frac{4 (1) (2 \ln 2)}{η^{*}} = \frac{8 \ln 2}{η^{*}}
\tag{Q.15}
$$
Now, we set the two expressions for `δ*²` equal (in Planck units where `L_P=1`):
$$
\frac{2 k_1 η^{*}}{k_3 \ln 2} = \frac{8 \ln 2}{η^{*}}
\tag{Q.16}
$$
This allows us to solve for the ratio of the potential's parameters:
$$
\frac{k_1}{k_3} = \frac{4 (\ln 2)^2}{η^{*2}}
\tag{Q.17}
$$
This is not a free parameter; its value is fixed by the self-consistency of the theory.

Finally, we determine `η*`. Substitute Equation Q.15 into Equation Q.14:
$$
k_4 (η^{*2} - 1) = - \frac{k_3 \ln 2}{8 \ln 2 / η^{*}} = - \frac{k_3 η^{*}}{8} \implies η^{*2} + \frac{k_3}{8k_4}η^{*} - 1 = 0
$$
Since `η* > 0`, the solution is `η* = [-b + sqrt(b²+4)]/2` with `b=k_3/(8k_4)`. As argued in Appendix C and D, PCE's drive for regularity implies that the cost of geometric distortion is high, so `k_4 >> k_3`. In this limit, `b → 0` and `η* → 1`. Thus, the stable equilibrium robustly occurs at `η* ≈ 1`.

Substituting `η* ≈ 1` back into our primary result (Equation Q.15) gives the final prediction.

**Q.5 Final Result and Interpretation**

The global, coupled PCE optimization of the MPU network vacuum yields a unique, stable equilibrium characterized by:
*   `C_max* = 2 ln 2` (information budget is saturated)
*   `χ* = 1` (channels are driven to maximal independence)
*   `η* ≈ 1` (geometry is driven to maximal regularity)

Substituting these PCE-optimal values into the foundational relation (Q.15) yields the final result for the ratio of the MPU scale to the Planck scale:
$$
\frac{\delta^2}{L_P^2} \approx \frac{8\ln 2}{\eta^*}
$$
$$
\boxed{
\frac{\delta}{L_P} = \sqrt{\frac{8\ln 2}{\eta^*}} \approx 2.355
}
\tag{Q.18}
$$
This result demonstrates that the fundamental MPU spacing `δ` is robustly of the same order of magnitude as the emergent Planck length `L_P`. The value of this ratio is not a tunable parameter but is derived directly from the framework's most fundamental constants: the Hilbert space dimension `d₀=8` (from the logical necessity of `K_0=3` bits for self-reference) and the irreducible thermodynamic cost of that logic, `ε=ln(2)`. The ability to derive a plausible, `O(1)` constant linking these scales from a self-consistent global optimization provides powerful evidence for the internal coherence of the Predictive Universe framework.


## Q.6 Lorentz-Invariant Discretization and the Temporal Scale

The spatial discretization scale $\delta/L_P = \sqrt{8\ln 2/\eta^*}$ (Equation Q.18) was derived from PCE optimization. This section establishes the corresponding temporal discretization scale through consistency with emergent Lorentzian structure.

### Q.6.1 The Discretization Consistency Requirement (Conditional on Theorems 43, 46)

**Proposition Q.6.1 (Lorentz-Invariant Discretization).** The emergent invariant speed $c$ (Theorem 46) relates the spatial discretization scale $\delta$ to the temporal discretization scale $\tau_{min}$ through:

$$c = \frac{\delta}{\tau_{min}}$$

Combined with the Planck unit identity $c = L_P/t_P$, this yields:

$$\boxed{\frac{\delta}{L_P} = \frac{\tau_{min}}{t_P}}$$

*Proof.*

**Step 1 (Emergent Speed Structure).** Theorem 46 establishes that the finite MPU processing time $\tau_{min} > 0$ (Theorem 29) and finite MPU spacing $\delta$ (Definition 35) yield a bounded maximum causal speed:

$$c \leq \frac{\delta \cdot w_{max}}{\tau_{min}}$$

**Step 5 (Uniqueness).** Suppose the ratios were unequal: $\delta/L_P \neq \tau_{min}/t_P$. Define $c_{eff} := \delta/\tau_{min}$. Then $c_{eff} \neq c$, and the discretization would select a preferred frame—spatial and temporal resolutions would transform differently under boosts. This contradicts Theorem 46, which proves that Lorentz invariance emerges necessarily from the causal structure of ND-RID interactions at PCE equilibrium. Therefore, equality of the ratios is the unique consistent solution. ∎

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

$$\boxed{\tau_{min} = \sqrt{\frac{8\ln 2}{\eta^*}} \cdot t_P \approx 2.355 \, t_P}$$

where $\eta^* \approx 1$ at PCE equilibrium (Section Q.4).

*Proof.* Apply Proposition Q.6.1 to the spatial result (Equation Q.18):

$$\tau_{min} = t_P \cdot \frac{\delta}{L_P} = t_P \cdot \sqrt{\frac{8\ln 2}{\eta^*}}$$

Evaluating at $\eta^* = 1$: $\tau_{min} = \sqrt{8\ln 2} \cdot t_P \approx 2.355 \, t_P$. ∎

**Corollary Q.6.1 (Unified Discretization Formula).** Both spatial and temporal discretization scales are determined by a single expression involving the framework's fundamental constants:

$$\boxed{\frac{\delta}{L_P} = \frac{\tau_{min}}{t_P} = \sqrt{d_0 \cdot \varepsilon} = \sqrt{8\ln 2} \approx 2.355}$$

where $\varepsilon = \ln 2$ is the irreducible SPAP entropy cost (Theorem 31) and $d_0 = 8$ is the MPU Hilbert space dimension (Theorem 23).

*Proof.* From Equation Q.18 with $\eta^* = 1$ and the PCE-optimal channel capacity $C_{max}^* = 2\ln 2$ (Equation Q.10):

$$\frac{\delta^2}{L_P^2} = \frac{4\chi^* C_{max}^*}{\eta^*} = \frac{4 \cdot 1 \cdot 2\ln 2}{1} = 8\ln 2$$

This can be expressed as the product of the two fundamental MPU parameters:

$$\frac{\delta^2}{L_P^2} = d_0 \cdot \varepsilon = 8 \cdot \ln 2$$

Taking the square root and applying Proposition Q.6.1 yields both ratios equal to $\sqrt{d_0 \cdot \varepsilon}$. ∎

### Q.6.3 Information-Theoretic Interpretation

**Remark Q.6.1 (Decomposition of the Discretization Scale).** The unified discretization factor $\sqrt{d_0 \cdot \varepsilon}$ admits a transparent information-theoretic decomposition:

- **Factor $d_0 = 8$:** The MPU Hilbert space dimension, determined by the horizon constant $K_0 = 3$ through $d_0 = 2^{K_0}$ (Theorem 23). This encodes the logical structure required for self-referential prediction.

- **Factor $\varepsilon = \ln 2$:** The irreducible thermodynamic cost of self-referential prediction (Theorem 31), arising from the 2-to-1 state merge required by the SPAP cycle (Lemma J.1).

The discretization scale $\sqrt{d_0 \cdot \varepsilon} \approx 2.355$ thus represents the geometric mean of the logical capacity ($d_0$) and thermodynamic cost ($\varepsilon$) of self-reference.

**Remark Q.6.2 (Complete Derivation Chain).** The full derivation from logical axioms to spacetime discretization proceeds through two parallel pathways originating from $K_0$:

$$K_0 = 3 \begin{cases} \xrightarrow{\text{Thm 23}} d_0 = 2^{K_0} = 8 \\[6pt] \xrightarrow{\text{Thm 31}} \varepsilon = \ln 2 \end{cases} \xrightarrow{\text{Eq. Q.18}} \frac{\delta}{L_P} = \sqrt{d_0 \cdot \varepsilon} \xrightarrow{\text{Prop. Q.6.1}} \frac{\tau_{min}}{t_P} = \sqrt{d_0 \cdot \varepsilon}$$

The horizon constant $K_0 = 3$ (Theorem 15) gives rise to both:

1. **The Hilbert space dimension** $d_0 = 2^{K_0} = 8$ via Theorem 23, representing the minimum state space for encoding $K_0$ bits of self-referential structure.

2. **The entropy cost** $\varepsilon = \ln 2$ via Theorem 31, representing the irreducible thermodynamic price of the logically necessary 2-to-1 state merge in SPAP dynamics (Appendix J, Lemma J.1).

These two quantities, though both originating from $K_0$, arise through independent derivation chains—one algebraic (state counting), one thermodynamic (Landauer's principle). Their product $d_0 \cdot \varepsilon = 8 \ln 2$ determines the discretization scale through PCE optimization (Equation Q.18).

### Q.6.4 Experimental Predictions

**Prediction Q.6.1 (Modified Dispersion Isotropy).** Modified dispersion relations (MDRs) provide a generic phenomenological signature of quantum gravity scenarios with minimal length scales [Amelino-Camelia 2013, Mattingly 2005]. If spacetime discretization manifests in MDRs of the form:

$$E^2 = p^2c^2 + m^2c^4 + \xi_s \frac{p^3 c^3}{E_P} + \xi_t \frac{E^3}{E_P}$$

where $E_P = \hbar/t_P$ is the Planck energy, then the framework predicts:

$$\boxed{\xi_s = \xi_t}$$

*Derivation.* The coefficient $\xi_s$ parameterizes leading-order corrections from spatial discretization at scale $\delta$, while $\xi_t$ parameterizes corrections from temporal discretization at scale $\tau_{min}$. By Proposition Q.6.1, the equal ratios $\delta/L_P = \tau_{min}/t_P$ imply that spatial and temporal discretization effects enter at the same relative scale, yielding equal leading-order correction coefficients.

**Prediction Q.6.2 (Absence of Preferred Frame Effects).** Searches for Lorentz-violating effects in the photon sector should yield null results to the precision set by $(\delta/L_P)^{-1} \approx 0.42$ corrections at the Planck scale. Current constraints from gamma-ray burst observations [Vasileiou et al. 2013] and active galactic nuclei [MAGIC Collaboration 2008] constrain energy-dependent photon dispersion by placing lower bounds on the effective quantum-gravity scale $E_{QG}$ at linear and quadratic orders, with GRB limits reaching the Planck scale and beyond under conservative assumptions. These bounds ($E_{QG} \gtrsim E_P$) are consistent with Lorentz-invariant discretization.

*Derivation.* The framework predicts that discretization preserves Lorentz invariance (Proposition Q.6.1, Step 5). Preferred-frame effects would arise only from asymmetric spatial versus temporal discretization, which is excluded by the equal-ratio condition. The scale of any residual effects is set by the inverse discretization ratio $(\delta/L_P)^{-1} = 1/\sqrt{8\ln 2} \approx 0.42$.

### Q.6.5 Summary

| Quantity | Symbol | Value | Origin |
|:---------|:-------|:------|:-------|
| Spatial discretization | $\delta/L_P$ | $\sqrt{8\ln 2} \approx 2.355$ | PCE optimization (Q.5) |
| Temporal discretization | $\tau_{min}/t_P$ | $\sqrt{8\ln 2} \approx 2.355$ | Lorentz consistency (Q.6) |
| Information budget | $C_{max}^*$ | $2\ln 2$ | Capacity saturation (Q.3) |
| Hilbert space dimension | $d_0$ | $8 = 2^{K_0}$ | Theorem 23 |
| Irreducible entropy cost | $\varepsilon$ | $\ln 2$ | Theorem 31 |

The complete derivation chain from the horizon constant to spacetime discretization:

$$\boxed{K_0 = 3 \xrightarrow{\text{Thm 15}} \begin{pmatrix} d_0 = 8 \\ \varepsilon = \ln 2 \end{pmatrix} \xrightarrow{\text{Eq. Q.18}} \frac{\delta}{L_P} = \frac{\tau_{min}}{t_P} = \sqrt{8\ln 2} \approx 2.355}$$




