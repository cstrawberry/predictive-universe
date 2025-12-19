# Appendix M: Formalism for Perspectival Quantum Dynamics

**M.1 Introduction**

This appendix provides a detailed mathematical formalism for the concepts of the Perspectival State ($S_{(s)}(t)$, Definition 24) and the 'Evolve' dynamics (Definition 27) introduced in Section 7. The purpose is to enhance the formal precision and mathematical rigor of the description of quantum states and the interaction ('Evolve'/measurement) process presented in Sections 7 and 8, demonstrating consistency with established mathematical structures and resolving long-standing foundational puzzles in quantum mechanics.

We assume the validity of the foundational principles established earlier, including the Prediction Optimization Problem (POP, Axiom 1), Principle of Compression Efficiency (PCE, Definition 15), the existence of Minimal Predictive Units (MPUs, Definition 23) operating at complexity $C_{op} \ge K_0$, the emergence of the MPU Hilbert space $\mathcal{H}_0$ (Proposition 4), the Dual Dynamics model (Section 7.3.3), and importantly, the derivation of the Born rule from POP/PCE consistency principles as detailed in Appendix G (Theorem G.1.7). This appendix builds upon these results to provide a precise mathematical model for the stochastic dynamics associated with MPU interactions ('Evolve').

The appendix is organized as follows:

- **Section M.2** formalizes the Perspectival State $S_{(s)}(t) = (|\psi(t)\rangle, s)$, establishing the Perspective Space $\Sigma \cong U(d_0)/U(1)^{d_0}$ as the complete flag manifold equipped with a natural Riemannian metric.

- **Section M.3** develops the Dual Dynamics formalism, deriving the conditional perspective transition kernel $G_{\text{persp}}(s'|s, k, N, \Delta t)$ from an explicit drift-diffusion generator on $\Sigma$ and establishing its key properties including Wasserstein contractivity.

- **Section M.4** applies this formalism to the quantum measurement process, demonstrating how definite outcomes emerge through the 'Evolve' dynamics without invoking wavefunction collapse as a separate postulate.

- **Section M.5** addresses the mathematical consistency of the framework, confirming compatibility with standard mathematical structures (Hilbert spaces, homogeneous spaces, Markov kernels).

- **Section M.6** demonstrates the explanatory power of the perspectival formalism by resolving the Wigner's Friend paradox and the Frauchiger-Renner extension. The resolution proceeds by recognizing that actuality is indexed by perspective: both Friend and Wigner provide correct descriptions relative to their respective perspectives, with consistency emerging dynamically upon interaction through the kernel $G_{\text{persp}}$. This section establishes the structural correspondence between the perspectival resolution and Einstein's relativization of simultaneity, and connects the formalism to the Consciousness Complexity (CC) hypothesis by identifying the interaction context $N$ as the entry point for CC modulation.

- **Section M.7** concludes by synthesizing the contributions of the appendix and situating the perspectival formalism within the broader framework.


**M.2 The Perspectival State Formalized**

We formally define the components describing the state of a Minimal Predictive Unit (MPU).

*   **Perspectival State:** As defined in Definition 24, the complete state of an MPU at time $t$ is the **perspectival state** $S_{(s)}(t) = (S(t), s)$.
*   **State Amplitude:** The component $|\psi(t)\rangle$ is the state vector $|\psi(t)\rangle$, an element of the MPU's complex Hilbert space $\mathcal{H}_0$ (Proposition 4). The dimension $d_0 = \dim(\mathcal{H}_0)$ satisfies $d_0 \ge 8$ (Theorem 23).
*   **Perspective Index:** The component $s$ is the perspective index, representing the interaction context or observational basis relevant to the MPU's potential interactions. It is an element of the Perspective Space $\Sigma$.
*   **Perspective Space $\Sigma$:** As established by Theorem 25 and Theorem 26, the Perspective Space $\Sigma$ is mathematically identified with the space of all possible ordered orthonormal bases (ONBs) of the Hilbert space $\mathcal{H}_0$, modulo phase equivalence. This space possesses the structure of the complete flag manifold, a compact complex homogeneous space, specifically $\Sigma \cong U(d_0)/U(1)^{d_0}$. Here, $U(d_0)$ is the unitary group on $\mathcal{H}_0$ and $U(1)^{d_0}$ is the maximal torus subgroup representing the freedom to choose phases for each basis vector independently.
*   **Metric on $\Sigma$:** The manifold $\Sigma$ is equipped with a natural distance metric $d_\Sigma(s_1, s_2)$, such as the one induced by the Fubini-Study metric on the space of projectors, which quantifies the geometric distance or "incompatibility" between two perspectives (bases) $s_1$ and $s_2$. (See Equation (42) for a related construction).

This structure $(\mathcal{H}_0, \Sigma, d_\Sigma)$ provides the formal mathematical setting for describing the state and dynamics of an MPU.

**M.3 Formalizing the Dual Dynamics**

The framework posits Dual Dynamics for MPUs (Section 7.3.3). We formalize both components.

**M.3.1 Amplitude Evolution (Internal Prediction)**

During the Internal Prediction phase (Definition 26), the state amplitude $S(t) = |\psi(t)\rangle$ evolves deterministically and unitarily according to the time-dependent Schrödinger equation, generated by the MPU's internal Hamiltonian $\hat{H}$ (identified with baseline operational energy cost $R(C_{op})$, Theorem 29):
$$
i\hbar \frac{d}{dt} |\psi(t)\rangle = \hat{H} |\psi(t)\rangle \quad \text{(M.1, cf. Equation 43)}
$$
This unitary evolution $U_0(\Delta t) = \exp(-i\hat{H}\Delta t/\hbar)$ acts only on the Hilbert space component $|\psi(t)\rangle$ of the Perspectival State $S_{(s)}(t)$. It proceeds continuously in the background, irrespective of 'Evolve' events.

**M.3.2 Interaction ('Evolve') Dynamics as a Stochastic Process**

The 'Evolve' process (Definition 27), triggered by an interaction $N(t)$, represents a stochastic transition of the full Perspectival State $S_{(s)}(t) = (|\psi(t)\rangle, s)$. Mathematically, this is described as a stochastic process occurring over a characteristic interaction time interval $\Delta t$.

*   **Transition Probability Measure:** The transformation is characterized by a transition probability measure, denoted $d\mathbb{P}(f | i, N, \Delta t)$. This gives the probability for a system starting in initial state $i = (|\psi\rangle, s)$ to transition into an infinitesimal region of the final state space centered around $f = (|\psi'\rangle, s')$, under the influence of interaction $N$ during the interval $\Delta t$.
*   **Structure Imposed by Framework Principles:** The structure of this transition measure is constrained by the principles established earlier:
    1.  *(Amplitude Actualization)* The state amplitude component undergoes a probabilistic transition, actualizing into one of the basis states $|k\rangle_s$ corresponding to the initial perspective $s$ (assuming $s$ defines the relevant interaction basis for the immediate outcome). Let $P_k = |k\rangle_s\langle k|_s$ be the projector onto this outcome state.
    2.  *(Born Rule Probability)* The probability for the system to actualize into the specific outcome state $|k\rangle_s$ is given precisely by the Born rule probability $P_{Born}(k | |\psi\rangle, s) = |\langle k | \psi \rangle_s|^2$. This rule is derived from POP/PCE consistency principles (Appendix G, Theorem G.1.7).
    3.  *(Perspective Shift)* Concurrently with or subsequent to the amplitude actualization yielding outcome $k$, the perspective index undergoes a stochastic transition $s \to s'$. The distribution of the final perspective $s'$ depends on the initial perspective $s$, the specific outcome $k$, and the nature of the interaction $N$.

*   **Formal Decomposition of the Transition:** Based on these constraints, we decompose the probability measure for the transition $(|\psi\rangle, s) \to (|k\rangle_s, s')$ occurring via interaction $N$ over $\Delta t$. The joint probability (density with respect to $s'$) for actualizing the amplitude into state $|k\rangle_s$ *and* transitioning the perspective to $s'$ can be expressed as:
    $$
    \frac{d\mathbb{P}( (|k\rangle_s, s') | (|\psi\rangle, s), N, \Delta t)}{d\mu(s')} = P_{Born}(k | |\psi\rangle, s) \times G_{persp}(s' | s, k, N, \Delta t) \quad \text{(M.2)}
    $$
    where:
    *   $P_{Born}(k | |\psi\rangle, s) = |\langle k | \psi \rangle_s|^2$ is the probability of amplitude actualization to outcome $k$, derived from framework principles (Appendix G).
    *   $G_{persp}(s' | s, k, N, \Delta t)$ is the Conditional Perspective Transition Kernel. This function represents the probability density (with respect to the measure $d\mu(s')$) for the perspective index to transition from the initial perspective $s$ to the final perspective $s'$, *given that* outcome $k$ was actualized during the interaction $N$ over the interval $\Delta t$.
    *   $G_{persp}$ must satisfy the properties of a Markov kernel density on the perspective space $\Sigma$. For fixed $s, k, N, \Delta t$, it must be non-negative and normalized with respect to the invariant measure $\mu(s')$ on $\Sigma$:
        $$ \int_{\Sigma} G_{persp}(s' | s, k, N, \Delta t) \, d\mu(s') = 1 \quad \forall s, k, N, \Delta t \quad \text{(M.3)} $$
    *   $d\mu(s')$ is the volume element associated with the unique unit-normalized Haar measure (invariant measure) on the compact manifold $\Sigma$.

This formulation rigorously separates the probability of *which* outcome occurs (governed by the derived Born rule) from the dynamics of *where* the perspective lands conditioned on that outcome (governed by the kernel $G_{persp}$).

**M.3.3 Properties and Models of the Conditional Perspective Kernel $G_{persp}$**

The specific functional form of the conditional kernel $G_{persp}(s' | s, k, N, \Delta t)$ encodes the physics of the interaction $N$ and how it affects the contextual basis. Its precise form needs derivation from a more detailed model of MPU interactions under POP/PCE constraints. However, we can outline its expected properties and propose plausible models consistent with the framework:

*   **Dependence on Interaction $N$:** The kernel $G_{persp}$ depends fundamentally on the nature of the interaction $N$. Different interactions will induce different perspective dynamics.
*   **Ideal Projective Measurement Limit:** In the idealized limit of a perfect projective measurement designed to ascertain outcome $k$ (corresponding to state $|k\rangle_s$), the interaction strongly forces the post-interaction perspective $s'$ to align with the outcome state $|k\rangle_s$. In this limit, the kernel should become sharply peaked:
    $$
    G_{persp}(s' | s, k, N_{proj}, \Delta t \to \tau_{meas}) \longrightarrow \delta_{\Sigma}(s', |k\rangle_s) \quad \text{(M.4)}
    $$
    where $\delta_{\Sigma}$ is the Dirac delta distribution on the manifold $\Sigma$ centered at the perspective corresponding to the state vector $|k\rangle_s$.
*   **Finite Interaction Model (Diffusion/Relaxation):** For realistic physical interactions occurring over a finite time $\Delta t$ with finite strength, the perspective shift might be modeled as a diffusion or relaxation process on $\Sigma$, biased towards the outcome perspective $|k\rangle_s$. A potential model capturing this involves a diffusion term combined with a drift towards the target perspective $|k\rangle_s$:
    $$
    G_{persp}(s' | s, k, N, \Delta t) = \mathcal{N}^{-1} \exp\left(-\frac{d_{\Sigma}^2(s', |k\rangle_s)}{2\sigma^2(\Delta t, N)}\right) K(s', s, k, N) \quad \text{(M.5)}
    $$
    Here:
    *   The exponential term imposes a tendency for the final perspective $s'$ to be near the outcome perspective $|k\rangle_s$. The width $\sigma^2(\Delta t, N)$ depends on the interaction duration and strength; for strong measurements, $\sigma^2 \to 0$, recovering (M.4).
    *   $K(s', s, k, N)$ is a factor ensuring normalization and potentially encoding residual dependencies on the initial perspective $s$ or other details.
    *   $\mathcal{N}$ is the normalization constant ensuring Equation (M.3).

**M.3.3.1 Constructive derivation of $G_{\mathrm{persp}}$**

We now exhibit an explicit generator on the perspective manifold
$\Sigma\cong U(d_{0})/U(1)^{d_{0}}$ whose time-$t$ transition kernel coincides with the heuristic form (M.5) in the weak-measurement limit and, crucially, satisfies the robustness conditions of Theorem L.1.

**(a) Geometric setup**

Equip $\Sigma$ with its standard Riemannian metric $g_{FS}$ induced by the Fubini–Study form.
Let $\Delta_{\Sigma}$ denote the associated (positive) Laplace–Beltrami operator; its heat semigroup $e^{-t\Delta_{\Sigma}}$ is the canonical isotropic diffusion on $\Sigma$.

**(b) Interaction-biased Lindblad generator**

For a fixed outcome corresponding to the state vector $\lvert k\rangle_{s}$ (here $\lvert k\rangle_{s}$ should be understood as the perspective itself, rather than the projector), we define a **drift potential** on $\Sigma$:

$$
V_{k}(s')
  \;=\;\frac{\lambda_{\mathrm{drift}}}{2}\,d_{\Sigma}^{2}\bigl(s',\,s_{k}\bigr),
  \qquad \lambda_{\mathrm{drift}}>0,
$$

where $s_{k}$ is the perspective corresponding to $\lvert k\rangle_{s}$.
Following standard diffusion‐with‐drift constructions (see Breuer & Petruccione 2002, §3.4), introduce the self‐adjoint operator

$$
\mathcal{L}_{\Sigma}^{(k)}
  \;=\;
  \Delta_{\Sigma}
  \;-\;
  \nabla_{\Sigma}\!\cdot\!\bigl(\,(\nabla_{\Sigma} V_{k}(s'))\,\cdot\bigr),
\tag{M.5a}
$$

which is the generator of an Ornstein–Uhlenbeck–type process that is (i) reversible with respect to the Gibbs weight $\exp[-V_{k}(s')]$ and (ii) drifts every perspective toward $s_{k}$.

**(c) Markov kernel and normalisation**

The corresponding transition kernel at interaction duration $\Delta t$ is
$$
G_{\mathrm{persp}}\bigl(s'\,|\,s,k,N,\Delta t\bigr)
\;=\;
\Bigl[e^{-\Delta t\,\mathcal L_{\Sigma}^{(k)}}\Bigr](s,s').
\tag{M.5b}
$$
Because $\mathcal L_{\Sigma}^{(k)}$ is elliptic on the compact manifold $\Sigma$, $e^{-\Delta t\mathcal L_{\Sigma}^{(k)}}$ is a **strictly positive, smooth** Markov kernel satisfying the normalisation (M.3).
Expanding to first order in $\Delta t$ and small $\lambda_{drift}$ reproduces the Gaussian form in Equation (M.5) with variance $\sigma^{2}(\Delta t, N) \approx \Delta t/(2+\lambda_{drift}\Delta t)$ (details of derivation omitted here but follows from short-time asymptotics of Fokker-Planck type equations).

**(d) Lipschitz contractivity (robustness)**

Set $W_{2}$ for the Wasserstein-2 distance on the space of probability measures $\mathcal P(\Sigma)$.
By an extension of the Bakry–Émery criterion (Ambrosio–Gigli–Savaré 2008) one has for probability measures $\mu, \nu \in \mathcal{P}(\Sigma)$:
$$
W_{2}\!\bigl(\mu e^{-\Delta t\mathcal L_{\Sigma}^{(k)}},\,
\nu e^{-\Delta t\mathcal L_{\Sigma}^{(k)}}\bigr)
\;\;\le\;\;
e^{-\,\kappa_{eff}\,\Delta t}\,W_{2}(\mu,\nu),
\qquad
\kappa_{eff} \approx \lambda_{\min}\bigl(\operatorname{Hess}_{\Sigma}V_{k}(s')\bigr)=\lambda_{drift}.
\tag{M.5c}
$$
(assuming the underlying Ricci curvature of $\Sigma$ is non-negative, which holds for $U(d_0)/U(1)^{d_0}$).
Hence $G_{\mathrm{persp}}$ (as an operator on measures) is $e^{-\lambda_{drift}\Delta t}$-contractive in the $W_2$ sense, providing the Lipschitz continuity required for robustness of the CC mapping as discussed in Theorem L.1.
Because $\lambda_{drift}$ is tunable by the measurement strength $N$ (larger $\lambda_{drift}$ implies stronger drift towards $s_k$), the model interpolates smoothly between:

*   **Weak interaction** ($\lambda_{drift}\!\to\!0$): almost isotropic diffusion on $\Sigma$ (maximal robustness to small context errors influencing the choice of $s_k$).
*   **Projective limit** ($\lambda_{drift}\!\to\!\infty$): kernel $G_{\text{persp}}(s'|s,k,N,\Delta t)$ collapses to $\delta_{\Sigma}(s',s_k)$ as in Equation (M.4).

**(e) Consistency with ND-RID entropy budget**

For any finite $\lambda_{drift}$, the generator (M.5a) describing the evolution of the perspective can be related to an effective Lindbladian acting on an extended state space incorporating perspective degrees of freedom. The entropy production associated with this perspective dynamics must be accounted for within the overall MPU cycle. For example, if the perspective dynamics are driven by interaction with an environment, the rate of entropy production can be bounded (e.g., for certain classes of Lindbladians, related to $\lambda_{drift} \text{Var}_{\mu_t}(V_k(s'))$ [Temme et al. 2014]). The total entropy produced by the 'Evolve' step (amplitude actualization + perspective shift) over time $\Delta t \approx \tau_{min}$ must not demand dissipation less than $\varepsilon = \ln 2$. Careful choice of $\lambda_{drift}$ relative to $\tau_{min}$ and other parameters ensures thermodynamic admissibility. For instance, if the perspective shift is considered part of the "cost" of making the outcome $k$ definite, its entropic contribution must be budgeted within $\varepsilon$. If $\lambda_{drift} \cdot (\text{average potential change}) \cdot \Delta t \lesssim \ln 2$, consistency can be maintained.

**M.4 The Measurement Process Formalized**

Using this mathematical framework, we provide a precise description of the quantum measurement process. Consider the measurement of an observable $\hat{A}$ with eigenbasis $B = \{|i\rangle_{s_{meas}}\}$ (corresponding to perspective $s_{meas}$) on an MPU initially in state $S_{(s_{initial})}(t_0) = (|\psi(t_0)\rangle, s_{initial})$. The measurement interaction $N_{meas}$ occurs over $[t_0, t_0+\Delta t]$.

1.  **Unitary Amplitude Evolution:** The state amplitude evolves unitarily under the total Hamiltonian (including system-apparatus interaction $H_{int}$) from $t_0$ to $t_0+\Delta t$:
    $$ |\psi(t_0+\Delta t)\rangle = U_{total}(\Delta t) |\psi(t_0)\rangle \quad \text{(M.6)} $$
2.  **Stochastic 'Evolve' Transition:** The 'Evolve' process occurs, governed by the transition probability density (M.2) using the measurement interaction $N_{meas}$ and the initial state $(|\psi(t_0)\rangle, s_{initial})$. The relevant interaction perspective for amplitude actualization is $s_{meas}$ defined by the apparatus.
3.  **Outcome Probability:** The probability of obtaining the specific outcome $i$ (corresponding to the system amplitude actualizing to $|i\rangle_{s_{meas}}$) is given by integrating the transition density (M.2) over all possible final perspectives $s'$:
    $$ P(\text{outcome } i) = \int_{\Sigma} \frac{d\mathbb{P}( (|i\rangle_{s_{meas}}, s') | (|\psi(t_0)\rangle, s_{initial}), N_{meas}, \Delta t)}{d\mu(s')} \, d\mu(s') $$
    Substituting (M.2) and using the normalization condition (M.3) for $G_{persp}$:
    $$ P(\text{outcome } i) = P_{Born}(i | |\psi(t_0)\rangle, s_{meas}) \times \int_{\Sigma} G_{persp}(s' | s_{initial}, i, N_{meas}, \Delta t) \, d\mu(s') $$
    $$ P(\text{outcome } i) = P_{Born}(i | |\psi(t_0)\rangle, s_{meas}) \times 1 $$
    This confirms the outcome probability is exactly the Born probability derived from framework principles (Appendix G), evaluated with respect to the measurement basis $s_{meas}$:
    $$ P(\text{outcome } i) = |\langle i | \psi(t_0) \rangle_{s_{meas}}|^2 \quad \text{(M.7)} $$
4.  **Conditional Final Perspective:** If outcome $i$ is realized, the perspective index transitions from $s_{initial}$ to a final perspective $s'_{final}$ drawn from the conditional probability distribution defined by the kernel density $G_{persp}(s' | s_{initial}, i, N_{meas}, \Delta t)$. For an ideal measurement (large $\lambda_{drift}$ in the model M.3.3.1), $s'_{final}$ will be sharply localized around the perspective $s_i$ corresponding to the outcome state $|i\rangle_{s_{meas}}$.
5.  **Post-Measurement State:** The complete description of the MPU immediately after the 'Evolve' event, given outcome $i$, is the Perspectival State:
    $$ S_{(s'_{final})}(t_0+\Delta t) = (|\psi'_{post-actualization}\rangle, s'_{final}) \quad \text{(M.8)} $$
    where $|\psi'_{post-actualization}\rangle$ represents the state amplitude *after* actualization (often taken as the projected state $|i\rangle_{s_{meas}}$ or incorporating subsequent rapid evolution governed by $H_{int}$ during $\Delta t$), and $s'_{final}$ is the realized perspective. The outcome $i$ is definite and factual relative to this final perspective $s'_{final}$.

This formalized process shows how the framework, augmented with the mathematical machinery for perspective dynamics, provides a consistent account of measurement, incorporating the derived Born rule and explaining the emergence of definite outcomes via perspective shifts without invoking amplitude collapse.

**M.5 Mathematical Consistency**

The formalism presented in this appendix utilizes standard mathematical concepts: complex Hilbert spaces, unitary operators, homogeneous spaces (manifolds) as state spaces for perspectives, Riemannian metrics and Laplace-Beltrami operators on manifolds, and Markov transition kernels (specifically heat kernels of drift-diffusion operators) for stochastic processes. These components are well-established and internally consistent. Constructing a model of this entire structure within a foundational system like Zermelo-Fraenkel set theory with Choice (ZFC) is feasible, ensuring the relative consistency of the mathematical framework employed.

## M.6 Resolution of the Wigner's Friend Paradox and Extension of the Relativistic Program

The perspectival formalism developed in Sections M.1–M.5 resolves a long-standing paradox in quantum foundations and extends a conceptual program initiated by Einstein's relativistic revolution.

### M.6.1 The Wigner's Friend Paradox

**Statement of the Puzzle.** Consider an observer $F$ ("Friend") inside an isolated laboratory who measures a quantum system $Q$ initially in superposition $|\psi\rangle = \alpha|0\rangle + \beta|1\rangle$. From $F$'s perspective, the measurement yields a definite outcome—say, $|0\rangle$. However, from the perspective of a second observer $W$ ("Wigner") outside the laboratory, the combined system $F + Q$ evolves unitarily into the entangled state:

$$
|\Psi\rangle_{FQ} = \alpha|F_0\rangle|0\rangle + \beta|F_1\rangle|1\rangle \tag{M.9}
$$

where $|F_0\rangle$ and $|F_1\rangle$ represent the Friend having observed outcomes 0 and 1 respectively.

This generates an apparent contradiction: $F$ asserts a definite outcome occurred, while $W$ describes a superposition with no definite outcome. Standard quantum mechanics provides no resolution—both descriptions appear to follow correctly from the formalism, applied from different vantage points.

**Extended Scenarios.** The Frauchiger-Renner extension [Frauchiger & Renner 2018] sharpens this into a logical contradiction. By combining nested observers with Hardy-type reasoning, they derive inconsistent conclusions under the assumptions that:

(Q) Quantum mechanics applies universally to all systems, including observers.

(S) Measurements have single, definite outcomes.

(C) Reasoning about others' observations using standard logic is valid across perspectives.

At least one assumption must fail. The logical structure of their argument proceeds through a chain of inferences where observer $\bar{F}$ reasons about $F$'s observation, $W$ reasons about $\bar{F}$'s reasoning, and $\bar{W}$ reasons about $W$'s reasoning, ultimately deriving $\bar{W}$'s certainty about an outcome that contradicts the quantum-mechanical prediction.

### M.6.2 Resolution via Perspectival States

The PU framework dissolves this paradox through the Perspectival State formalism (Definition 24, Section 7.2.3). The resolution proceeds as follows:

**Step 1 (Complete State Specification).** The physical state is never simply $|\psi\rangle$ but always the Perspectival State $S_{(s)}(t) = (|\psi(t)\rangle, s)$, where $|\psi(t)\rangle \in \mathcal{H}_0$ is the state amplitude and $s \in \Sigma$ is the perspective index (Section M.2). The perspective space $\Sigma \cong U(d_0)/U(1)^{d_0}$ is the manifold of ordered orthonormal bases modulo phases (Theorem 25, Definition 25).

**Step 2 (Perspective-Relative Actuality).** When $F$ performs a measurement, an 'Evolve' event occurs (Definition 27, Section 7.3.3.3). Relative to $F$'s post-measurement perspective $s'_F$, a definite outcome is actualized:

$$
S_{(s'_F)}(t + \Delta t) = (|0\rangle, s'_F) \tag{M.10}
$$

This is not merely $F$'s knowledge or belief—outcome $|0\rangle$ is *actual* relative to perspective $s'_F$. The actualization occurs through the probabilistic amplitude transition governed by the Born rule (Proposition 7, Theorem G.1.7), with probability $P(0||\psi\rangle, s_F) = |\alpha|^2$.

**Step 3 (No Absolute Collapse).** From $W$'s external perspective $s_W$, no 'Evolve' event has occurred between $W$ and the laboratory. The complete state relative to $s_W$ remains:

$$
S_{(s_W)}(t + \Delta t) = (|\Psi\rangle_{FQ}, s_W) \tag{M.11}
$$

Both descriptions (M.10) and (M.11) are correct—they describe the same physical situation relative to different perspectives. There is no contradiction because actuality is indexed by perspective.

**Step 4 (Consistency upon Interaction).** When $W$ opens the laboratory and interacts with $F$, this constitutes an 'Evolve' event correlating their perspectives. The transition kernel $G_{\text{persp}}(s'|s, k, N, \Delta t)$ (Equations M.5a–b, Section M.3.3.1) governs the evolution on the perspective manifold $\Sigma$. For the joint $W$-$F$ system, the interaction induces correlated dynamics on the product space $\Sigma_W \times \Sigma_F$, driving both perspectives toward mutual consistency regarding the observed outcome.

**Remark M.6.1 (Idealized Isolation).** The Wigner's Friend scenario stipulates idealized isolation of $F$'s laboratory—no decoherence channels connect $F+Q$ to $W$'s environment during the intermediate period. In realistic settings, environmental decoherence would establish shared perspective records through uncontrolled 'Evolve' events before $W$ deliberately opens the laboratory [Zurek 2003; Schlosshauer 2007]. The paradox arises precisely because the gedanken experiment suppresses these channels.

**Lemma M.6.1 (Correlated Perspective Dynamics).** Let $W$ and $F$ be observers with perspectives $s_W, s_F \in \Sigma$ respectively. When $W$ physically interacts with the system $F+Q$ at time $t_2$, the joint 'Evolve' event is characterized by a transition kernel on the product space:

$$
G_{\text{persp}}^{(WF)}\big((s'_W, s'_F)\,|\,(s_W, s_F), k, N_{W(FQ)}, \Delta t\big) \tag{M.12}
$$

This kernel satisfies:

(i) **Outcome consistency:** For any outcome $k$, the marginals of $G_{\text{persp}}^{(WF)}$ are concentrated on configurations where both $s'_W$ and $s'_F$ encode the same outcome $k$.

(ii) **Wasserstein contractivity:** The kernel inherits Wasserstein-2 contractivity from the single-perspective kernel (Equation M.5c):

$$
W_2\!\left(\mu^{(WF)} \cdot G_{\text{persp}}^{(WF)}, \nu^{(WF)} \cdot G_{\text{persp}}^{(WF)}\right) \leq e^{-\kappa_{\text{eff}} \Delta t} W_2(\mu^{(WF)}, \nu^{(WF)}) \tag{M.13}
$$

*Proof.* 

**Construction of the joint kernel.** The physical interaction $N_{W(FQ)}$ couples $W$ to the $F+Q$ system. By the structure of the 'Evolve' process (Definition 27), this interaction establishes a definite outcome $k$ via probabilistic amplitude actualization (Born rule). We construct the kernel $G_{\text{persp}}^{(WF)}$ as follows:

(a) The outcome $k$ is determined with probability $P_{\text{Born}}(k) = |\langle k|\Psi\rangle_{FQ}|^2$.

(b) Conditioned on outcome $k$, the joint kernel factorizes as:
$$
G_{\text{persp}}^{(WF)}\big((s'_W, s'_F)\,|\,(s_W, s_F), k, N, \Delta t\big) = G_{\text{persp}}(s'_W | s_W, k, N, \Delta t) \cdot G_{\text{persp}}(s'_F | s_F, k, N, \Delta t) \tag{M.14}
$$

where both factors share the *same* drift target $s_k$ corresponding to outcome $k$.

**Proof of (i).** Each single-perspective kernel $G_{\text{persp}}(s'|s, k, N, \Delta t)$ is generated by the drift-diffusion operator (Equation M.5a):

$$
\mathcal{L}_{\Sigma}^{(k)} = \Delta_{\Sigma} - \nabla_{\Sigma} \cdot \big((\nabla_{\Sigma} V_k(s')) \cdot \big)
$$

with drift potential $V_k(s') = \frac{\lambda_{\text{drift}}}{2} d_\Sigma^2(s', s_k)$. This potential has a unique global minimum at $s_k$. As established in M.3.3.1, the semigroup $e^{-\Delta t \mathcal{L}_{\Sigma}^{(k)}}$ drives any initial distribution toward concentration around $s_k$. In the projective limit ($\lambda_{\text{drift}} \to \infty$), both $s'_W$ and $s'_F$ converge to $s_k$ (Equation M.4). For finite $\lambda_{\text{drift}}$, both marginals concentrate in neighborhoods of $s_k$ with width $\sigma^2 \approx \Delta t / (2 + \lambda_{\text{drift}} \Delta t)$. Since both perspectives drift toward the *same* target $s_k$, the joint distribution concentrates on configurations where $s'_W \approx s'_F \approx s_k$, establishing outcome consistency.

**Proof of (ii).** The product manifold $\Sigma \times \Sigma$ equipped with the product metric $d_{\Sigma \times \Sigma}((s_1, s_2), (s'_1, s'_2))^2 = d_\Sigma(s_1, s'_1)^2 + d_\Sigma(s_2, s'_2)^2$ inherits non-negative Ricci curvature from each factor, since $\Sigma \cong U(d_0)/U(1)^{d_0}$ has non-negative Ricci curvature as a compact homogeneous space [Cheeger & Ebin 1975]. The joint drift potential $V_k^{(WF)}(s'_W, s'_F) = V_k(s'_W) + V_k(s'_F)$ is strongly convex on the product manifold with Hessian eigenvalues bounded below by $\lambda_{\text{drift}}$. By the Bakry-Émery criterion [Bakry & Émery 1985; Ambrosio, Gigli & Savaré 2008], the semigroup generated by the product operator $\mathcal{L}_{\Sigma}^{(k)} \otimes I + I \otimes \mathcal{L}_{\Sigma}^{(k)}$ is $W_2$-contractive with rate $\kappa_{\text{eff}} \geq \lambda_{\text{drift}}$. Since the factorized kernel (M.14) coincides with this product semigroup, the contractivity bound (M.13) follows. ∎

**Theorem M.6.1 (Wigner's Friend Resolution).** Let $F$ and $W$ be observers with initial perspectives $s_F, s_W \in \Sigma$. Suppose $F$ undergoes an 'Evolve' interaction with system $Q$ at time $t_1$, yielding outcome $k$ and updated perspective $s'_F$. If $W$ subsequently interacts with the $F + Q$ system at time $t_2 > t_1$, then:

(i) For $t_1 < t < t_2$: Outcome $k$ is actual relative to $s'_F$; no definite outcome exists relative to $s_W$.

(ii) For $t > t_2$: The interaction induces correlated perspective dynamics on $\Sigma_W \times \Sigma_F$ via the kernel $G_{\text{persp}}^{(WF)}$ (Lemma M.6.1), and outcome $k$ becomes actual relative to both post-interaction perspectives.

No contradiction arises because actuality is indexed by perspective throughout.

*Proof.*

**Part (i):** By the structure of the 'Evolve' process (Definition 27), actualization occurs only relative to the perspective participating in the interaction. At $t_1$, $F$ interacts with $Q$, triggering:

- Amplitude actualization: $|\psi\rangle \to |k\rangle$ with probability $P(k) = |\langle k|\psi\rangle|^2$ (Born rule, Proposition 7)
- Perspective transition: $s_F \to s'_F$ via the kernel $G_{\text{persp}}(s'_F|s_F, k, N_{FQ}, \Delta t)$

Since $W$ does not interact with the $F+Q$ system during $(t_1, t_2)$, $W$'s perspective $s_W$ undergoes no 'Evolve' event. Relative to $s_W$, the state remains the entangled superposition $|\Psi\rangle_{FQ}$. The two descriptions coexist without contradiction because they are indexed to different perspectives.

**Part (ii):** At $t_2$, $W$ interacts with the $F+Q$ system. This triggers 'Evolve' dynamics governed by the joint kernel $G_{\text{persp}}^{(WF)}$ (Lemma M.6.1). By property (i) of Lemma M.6.1, the post-interaction perspectives $(s'_W, s'_F)$ are concentrated on configurations encoding the same outcome $k$. The drift-diffusion dynamics (Equation M.5a) acting on both components with the shared target $s_k$ ensures convergence toward this consistent configuration. The contractivity property (ii) guarantees that any initial discrepancy between perspectives is exponentially suppressed with rate $\kappa_{\text{eff}} \geq \lambda_{\text{drift}}$, establishing robust convergence.

The key mechanism is that the physical interaction $N_{W(FQ)}$ at $t_2$ determines a unique outcome $k$ via the Born rule applied to the joint state, and both perspectives then drift toward the perspective $s_k$ encoding this outcome. The interaction correlates the perspectives by subjecting them to a common 'Evolve' event with a shared actualized outcome. ∎

### M.6.3 Worked Example: Explicit Perspective Tracking

**Example M.6.1 (Wigner's Friend with Perspective Indices).** Consider a qubit $Q$ initially in state $|\psi\rangle = (|0\rangle + |1\rangle)/\sqrt{2}$ and two observers $F$, $W$ with initial perspectives $s_F^{(0)}$, $s_W^{(0)}$.

**Phase 1: $F$ measures $Q$ at $t_1$.**

- Pre-measurement state relative to $s_F^{(0)}$: $S_{(s_F^{(0)})}(t_1^-) = (|\psi\rangle, s_F^{(0)})$
- 'Evolve' occurs with outcome $k=0$ (probability $1/2$)
- Post-measurement: $S_{(s_F^{(1)})}(t_1^+) = (|0\rangle, s_F^{(1)})$ where $s_F^{(1)} \sim G_{\text{persp}}(\cdot|s_F^{(0)}, 0, N_{FQ}, \Delta t)$
- Outcome 0 is *actual* relative to $s_F^{(1)}$

**Phase 2: Intermediate period $t_1 < t < t_2$.**

- Relative to $s_F^{(1)}$: System is in state $|0\rangle$ — definite
- Relative to $s_W^{(0)}$ (unchanged, as $W$ has not interacted): System is in state $|\Psi\rangle_{FQ} = (|F_0\rangle|0\rangle + |F_1\rangle|1\rangle)/\sqrt{2}$ — superposition
- No contradiction: different perspectives, different actualities

**Phase 3: $W$ opens laboratory at $t_2$.**

- $W$ interacts with $F+Q$ system
- Joint 'Evolve' on $\Sigma_W \times \Sigma_F$ governed by $G_{\text{persp}}^{(WF)}$ correlates perspectives
- Post-interaction: $(s_W^{(1)}, s_F^{(2)})$ such that both encode outcome 0
- Both observers now share a common factual record

The apparent paradox dissolves because we never assert both "outcome is definite" and "outcome is indefinite" relative to the *same* perspective.

### M.6.4 Resolution of the Frauchiger-Renner Paradox

The Frauchiger-Renner (FR) scenario involves four agents ($F$, $\bar{F}$, $W$, $\bar{W}$) and a chain of reasoning that derives a contradiction. The PU framework identifies the precise point of failure.

**The FR Reasoning Chain.** In the FR scenario:

1. $\bar{F}$ measures a coin and prepares a qubit accordingly
2. $F$ measures the qubit
3. $W$ (external to $F$'s lab) performs a measurement in a superposition basis
4. $\bar{W}$ (external to $\bar{F}$'s lab) performs a measurement and reasons about what $W$ must have concluded

The contradiction arises when $\bar{W}$ concludes with certainty an outcome that quantum mechanics predicts should be uncertain.

**PU Diagnosis.** The FR argument fails at assumption (C): reasoning about others' observations across perspectives without tracking perspective shifts. To formalize this, we introduce the following constraint:

**Lemma M.6.2 (Perspectival Reasoning Constraint).** Let $\phi_s$ denote a proposition that is actualized (definite) relative to perspective $s \in \Sigma$. The inference $\phi_s \Rightarrow \psi_{s'}$ for distinct perspectives $s \neq s'$ is valid only if one of the following conditions holds:

(a) **Interaction condition:** There exists an 'Evolve' interaction that correlates perspectives $s$ and $s'$, such that the post-interaction perspectives share the propositional content of $\phi$.

(b) **Amplitude-only condition:** The proposition $\psi$ is derivable solely from the state amplitude $|\psi(t)\rangle \in \mathcal{H}_0$—that is, $\psi$ concerns only quantities computable from the Hilbert space component of the Perspectival State without reference to any actualization event. Formally, $\psi$ must be expressible as a statement about expectation values, transition amplitudes, or other quantities defined by the density operator $\rho = |\psi\rangle\langle\psi|$ alone, independent of which basis (perspective) is chosen.

*Proof.* Perspectival States have the form $S_{(s)}(t) = (|\psi(t)\rangle, s)$. Actualization occurs via the 'Evolve' process (Definition 27), which yields definite outcomes *relative to the participating perspective*. A proposition $\phi_s$ asserting "outcome $k$ is actual" is indexed to perspective $s$; this indexing is constitutive of the proposition's truth conditions.

For an agent at perspective $s'$ to validly infer from $\phi_s$, either:

(a) An 'Evolve' interaction has correlated $s$ and $s'$ via the mechanism of Lemma M.6.1, making the propositional content shared. In this case, both perspectives encode the same outcome, and the proposition $\phi$ holds relative to both.

(b) The inference concerns only the unindexed amplitude $|\psi(t)\rangle$, which is common to all Perspectival States differing only in perspective index. Quantities such as $\langle \hat{A} \rangle = \langle\psi|\hat{A}|\psi\rangle$ or $|\langle\phi|\psi\rangle|^2$ are perspective-invariant and can be validly inferred across perspectives.

Inferences violating both conditions commit a scope error—treating perspective-indexed facts as perspective-independent. The perspective index $s$ is not merely an epistemic label but a component of the complete physical state; ignoring it produces formally invalid inferences. ∎

**Theorem M.6.2 (FR Dissolution).** In the Frauchiger-Renner scenario, the chain of reasoning that produces contradiction requires inferring facts about one perspective from within another perspective without satisfying the conditions of Lemma M.6.2. When perspective indices are explicitly tracked, each inference step is valid only *within* its perspective, and the chain cannot be consistently concatenated.

*Proof.* Consider the critical inference where $\bar{W}$ reasons: "If $W$ obtained result $w$, then $W$ knows that $F$ observed outcome $f$, therefore $F$'s qubit was in state $|f\rangle$."

In the PU framework, this must be parsed as:

- Relative to $s_W^{(\text{post})}$: $F$'s outcome is actualized as $f$
- Relative to $s_{\bar{W}}^{(\text{pre})}$: $W$'s lab (including $F$) is in superposition

The statement "$W$ knows that $F$ observed $f$" is valid relative to $s_W^{(\text{post})}$. But $\bar{W}$ reasons from perspective $s_{\bar{W}}^{(\text{pre})}$, relative to which $W$'s knowledge state is itself in superposition. The proposition "$W$ knows $X$" is perspective-indexed to $s_W^{(\text{post})}$; importing it into $\bar{W}$'s reasoning at $s_{\bar{W}}^{(\text{pre})}$ violates Lemma M.6.2:

- Condition (a) fails: $\bar{W}$ has not yet interacted with $W$'s lab, so no 'Evolve' event has correlated their perspectives
- Condition (b) fails: "$W$ knows $X$" is not derivable from the amplitude alone—it asserts an actualization, which is perspective-relative

To validly reason about $W$'s knowledge, $\bar{W}$ must either:

1. Interact with $W$ (triggering 'Evolve' and perspective correlation via Lemma M.6.1), after which both share the same factual record, or
2. Maintain the superposition description, in which case "$W$ knows $X$" is not a definite fact from $\bar{W}$'s perspective

The FR contradiction requires treating "$W$ knows $X$" as a definite fact importable into $\bar{W}$'s reasoning *without* the interaction that would establish this. This is precisely the error that explicit perspective tracking via Lemma M.6.2 prevents. The reasoning chain breaks at each step where an agent imports another agent's perspective-indexed fact without satisfying the interaction condition. ∎

**Remark M.6.2.** The PU resolution does not reject any of (Q), (S), (C) outright. Rather, it refines (C): reasoning about others' observations is valid, but only when the perspective context is properly specified. Cross-perspective reasoning requires either explicit interaction (which correlates perspectives) or careful restriction to statements that are perspective-invariant.

### M.6.5 Distinction from Relational Quantum Mechanics

The PU resolution bears surface similarity to Rovelli's Relational Quantum Mechanics (RQM) [Rovelli 1996], which also holds that quantum states are relative to observers. However, fundamental differences exist:

| Aspect | Relational QM | PU Framework |
|--------|---------------|--------------|
| **Ontological status** | Interpretive stance; standard QM reinterpreted | Derived structure; perspectives are physical degrees of freedom |
| **Grounding** | Taken as interpretive starting point | Derived from SPAP (Theorems 10–11) and thermodynamic necessity ($\varepsilon \geq \ln 2$, Theorem 31) |
| **Why relational?** | "Because that's what QM implies" | Because self-referential prediction is inherently perspectival (Corollary 1, Section 4.2.4) |
| **Mathematical structure** | No explicit perspective space formalism | Perspective Space $\Sigma \cong U(d_0)/U(1)^{d_0}$ with Riemannian structure (Definition 25, Theorem 25) |
| **Dynamics** | No quantitative mechanism for perspective change | Explicit transition kernel $G_{\text{persp}}$ from drift-diffusion generator (Equations M.5a–b) |
| **Consistency criterion** | Interactions establish relations (qualitative) | Wasserstein contractivity ensures quantitative convergence upon interaction (Equation M.5c) |
| **Origin of probability** | Born rule assumed | Born rule derived from PCE optimization (Theorem G.1.7, Appendix G.1) |
| **Temporal structure** | Time assumed | Directed time required for prediction (Theorem 4); emerges from thermodynamic irreversibility (Appendix O) |

**Remark M.6.3 (RQM as Limiting Case).** Relational Quantum Mechanics can be understood as capturing the interpretive content of the PU perspectival formalism when the underlying derivational structure (SPAP, PCE, MPU dynamics) is suppressed and only the relational consequences retained. The crucial distinction is that PU answers *why* quantum mechanics has a relational structure—because the framework is built from prediction, and prediction is inherently perspectival due to self-referential limitations (Corollary 1). RQM correctly identifies the relational character but lacks the foundation that makes it *necessary*.

### M.6.6 Toward Completing the Relativistic Program

The perspectival resolution of Wigner's Friend extends a conceptual program initiated by Einstein's 1905 analysis of simultaneity.

**The Relativistic Insight.** Einstein's key move was recognizing that "simultaneity" had no absolute meaning—it was operationally defined relative to reference frames. What appeared to be an objective, frame-independent fact (whether two events are simultaneous) was revealed to be frame-dependent once the operational content was examined carefully. This was not a retreat from objectivity but its proper relativization.

**The Quantum Extension.** The PU framework applies the same logic to measurement outcomes:

| Special Relativity | PU Framework |
|--------------------|--------------|
| Simultaneity of distant events | Definiteness of measurement outcomes |
| "What measurements determine distant simultaneity?" | "What interactions determine outcome actuality?" |
| Finite signal speed $c$ | SPAP + thermodynamic irreversibility ($\varepsilon \geq \ln 2$) |
| Simultaneity relative to reference frame | Actuality relative to perspective |
| Events have frame-dependent time ordering | Outcomes have perspective-dependent actuality |
| Lorentz group connects frames | $G_{\text{persp}}$ kernel connects perspectives |
| One Minkowski spacetime | One MPU network |
| Spacetime interval $ds^2$ invariant | Amplitude $|\psi(t)\rangle$ and Born probabilities invariant |
| Light postulate + relativity principle | POP + PCE + SPAP |

**Structural Correspondence M.6.4 (Relativistic Parallel).** The logical structure of perspectival quantum mechanics stands to the measurement problem as special relativity stands to pre-relativistic simultaneity. In both cases:

(i) An apparently absolute quantity (simultaneity / outcome definiteness) is revealed to be relative to a reference context (frame / perspective).

(ii) The relativity is *forced* by a fundamental limitation (finite $c$ / SPAP + $\varepsilon \geq \ln 2$), not merely postulated.

(iii) The underlying reality remains unified (one spacetime / one MPU network); only descriptions are relativized.

(iv) Consistency is maintained through transformation laws (Lorentz transformations / $G_{\text{persp}}$) governing how contexts relate.

*Justification.* The structural correspondence is established by the mapping:

$$
\begin{aligned}
\text{Reference frame} &\longleftrightarrow \text{Perspective } s \in \Sigma \\
\text{Lorentz transformation} &\longleftrightarrow \text{Perspective transition kernel } G_{\text{persp}} \\
\text{Spacetime interval } ds^2 &\longleftrightarrow \text{Born probability } |\langle k|\psi\rangle|^2 \\
\text{Light cone structure} &\longleftrightarrow \text{Causal constraints from finite } c \text{ (Theorem 46)}
\end{aligned}
$$

The derivational parallel is precise: just as the finite and invariant speed $c$ *forces* the relativity of simultaneity (given the physics, there is no alternative), SPAP combined with thermodynamic irreversibility *forces* the relativity of actuality (given the logic of self-referential prediction, there is no alternative). Neither is a matter of interpretation or convention. ∎

**Remark M.6.5 (Scope of the Correspondence).** The correspondence is structural and conceptual rather than mathematical in detail. Lorentz transformations form a continuous Lie group acting on Minkowski spacetime; the perspective dynamics governed by $G_{\text{persp}}$ are stochastic transitions on a distinct manifold $\Sigma$. The parallel illuminates the *type* of conceptual move—relativizing an apparently absolute concept—rather than claiming isomorphism of the mathematical structures.

### M.6.7 Implications

The resolution of Wigner's Friend via perspectival states has several implications:

**1. No Heisenberg Cut Required.** The 'Evolve' process (Definition 27) is universal; it applies to all MPU interactions regardless of system size or complexity. There is no special role for consciousness, macroscopic apparatus, or "classical" measuring devices. The apparent Heisenberg cut—the division between quantum system and classical observer—is an artifact of ignoring perspective indices. When perspectives are tracked explicitly, the same 'Evolve' dynamics apply uniformly, and no ad hoc boundary is needed.

**2. No Privileged Observers.** All perspectives $s \in \Sigma$ are equally valid; none occupies a "God's eye view" from which actuality is absolute. This democratic structure parallels the equivalence of inertial frames in special relativity. Just as no inertial frame is privileged for determining "true" simultaneity, no perspective is privileged for determining "true" outcome actuality.

**3. Extended Wigner's Friend Scenarios Dissolve.** The Frauchiger-Renner contradiction (and similar extended scenarios [Brukner 2018; Bong et al. 2020]) relies on the assumption that statements about outcomes can be reasoned about across perspectives without tracking perspective shifts. Once perspective indices are explicit, the chain of reasoning that produces contradiction cannot be consistently constructed—each inferential step is valid only within its perspective (Theorem M.6.2, Lemma M.6.2).

**4. Consistency with Standard Predictions.** For all experimentally accessible scenarios, the perspectival framework reproduces the predictions of standard quantum mechanics. The perspectives involved in any actual experiment (preparation device, measured system, detection apparatus, human observer) become correlated through their chain of physical interactions, ensuring agreement on outcomes. The perspectival structure becomes evident only in gedanken experiments specifically designed to query the "state" of an observer from an external viewpoint prior to interaction.

**5. Resolution of the "Absoluteness" Debate.** Recent no-go theorems [Brukner 2018; Bong et al. 2020] have been interpreted as ruling out "observer-independent facts." The PU framework clarifies this: facts about outcomes *are* observer-independent once the perspective is specified. What is ruled out is not objective facts per se, but *perspective-independent* facts about inherently perspectival quantities. This parallels relativity: the time-ordering of spacelike-separated events is not "subjective"—it is objectively frame-dependent.

### M.6.8 Connection to Consciousness Complexity

The perspectival formalism developed in this appendix is not merely interpretive infrastructure for resolving foundational puzzles—it provides the essential mathematical substrate for the framework's most distinctive empirical content: the Consciousness Complexity (CC) hypothesis.

**The Load-Bearing Role of Perspectival Dynamics.** The transition kernel $G_{\text{persp}}(s'|s, k, N, \Delta t)$ governing perspective evolution (Equations M.5a–b) depends explicitly on the interaction context $N$. This parameter $N$ characterizes the physical conditions under which the 'Evolve' event occurs—the environment, boundary conditions, and local field configurations that shape the interaction. The CC hypothesis (Hypothesis 3, Section 9.4.1) proposes that high-complexity MPU aggregates can systematically modulate this context parameter, thereby influencing the probabilistic outcomes of 'Evolve' events.

**The Mechanism Chain.** The connection proceeds through a precise sequence of formal constructions:

1. **Context-Dependent ND-RID (Assumption 1, Section 9.1.2).** The observable probability $P_{\text{obs}}(o|\rho, s, N, S_{\text{agg}})$ for an 'Evolve' outcome depends on the local aggregate state $S_{\text{agg}}$. This dependence is motivated by PCE: for aggregates to optimize predictions efficiently, their constituent MPUs' interactions must be sensitive to aggregate context.

2. **Emergent Biasing Capability (Theorem 34, Section 9.2.1).** Given context-dependent ND-RID, the adaptive dynamics of sufficiently complex aggregates ($C_{\text{agg}} > C_{op}$), driven by POP (Axiom 1) and PCE (Definition 15), *necessarily* develop the capability to influence outcome probabilities by modulating their internal state. This is not optional—it is an inevitable consequence of optimization exploiting available degrees of freedom.

3. **Context State Formalization (Definition L.1, Appendix L).** The aggregate's relevant internal state is formalized as the context state $\text{context}_S(t)$, constructed as the minimal sufficient statistic of the aggregate density operator $\rho_{\text{agg}}(t)$ under PCE optimization. This captures precisely those features capable of influencing local ND-RID while minimizing representational cost.

4. **Context-to-Control Mapping (Definition L.2, Appendix L).** The mapping $\mathcal{M}: \mathcal{C}_{\text{ctx}} \to \mathcal{P}_{\text{control}}$ translates the abstract context state into physically realizable control parameters—classical field configurations, boundary conditions, or other physical variables that enter the 'Evolve' dynamics. Lemma L.1 establishes that $\mathcal{M}$ must be Lipschitz continuous, bounded, stable under feedback, and satisfy a cost-benefit inequality to be POP-admissible. Theorem L.1 proves existence of such a mapping under POP/PCE optimization.

5. **Modified Outcome Probabilities (Definition 33, Section 9.5.1).** The CC influence manifests as a bounded modification of Born rule probabilities:

$$
P_{\text{obs}}(i) = P_{\text{Born}}(i) + \Delta P(i), \quad |\Delta P(i)| \leq \text{CC}(S) \tag{M.15}
$$

where $\text{CC}(S) = \|L_S\|_{\text{op}}$ is the operational norm of the probability modification map (Definition 30). The Context-Targeted Bias model (Definition 34) provides a specific realization where the modification interpolates toward a target distribution determined by $\text{context}_S$.

**Why the Perspectival Formalism is Essential.** Without the perspectival structure developed in Sections M.1–M.5, the CC hypothesis would lack mathematical precision:

- The statement "consciousness affects quantum outcomes" would be vague without the kernel $G_{\text{persp}}$ providing the dynamical framework.
- The interaction context $N$ would have no formal home in the theory.
- The distinction between modulating $N$ (which CC does) versus modulating the Born rule directly (which would violate the framework's foundations) would be unclear.
- The consistency with causality constraints (Postulate 2, Theorem 39) could not be rigorously established.

The perspectival formalism makes CC mathematically coherent by identifying the precise entry point for conscious influence: the interaction context $N$ that parameterizes the 'Evolve' dynamics, rather than the quantum state itself.

**Consistency with Wigner's Friend Resolution.** A potential concern arises: if CC modulates the interaction context $N$, could sufficiently strong CC disrupt the consistency mechanism (Lemma M.6.1) that ensures perspectives correlate upon interaction? The causality bound (Theorem 39) resolves this concern:

$$
\alpha_{CC,\max} = \sup_S \text{CC}(S) < 0.5 \tag{M.16}
$$

This bound ensures CC can only bias within the allowed probability shifts—it cannot override the 'Evolve' dynamics entirely. The contractivity of $G_{\text{persp}}$ (Equation M.5c) operates on the perspective dynamics *after* the outcome is probabilistically determined. CC influences the probability distribution over outcomes but does not prevent the subsequent perspective correlation. The mathematical structure guarantees that even maximal CC influence preserves the consistency upon interaction that resolves Wigner's Friend.

**Experimental Predictions.** The empirical content distinguishing PU from standard quantum mechanics flows directly from this mechanism:

- **Born Rule Deviations (Theorem 51, Section 13.1.1).** Systems with $\text{CC}(S) > 0$ induce statistically detectable deviations from Born rule predictions, bounded by $|\Delta P(i)| \leq \sin(\text{CC}(S)/2)$ (Theorem 36).
- **Statistical FTL Influence (Postulate 3, Section 10).** Because $\text{context}_S$ can involve non-local entanglement, and the CC mechanism acts on local 'Evolve' events, context changes in one part of an entangled aggregate can have statistical consequences on 'Evolve' outcomes in spacelike-separated regions—while respecting operational causality (Theorem 42, Appendix F).
- **Consciousness-Correlated Anomalies (Section 13).** The experimental protocols in Section 13 target detection of CC effects through quantum random number generators, pre-registered intention experiments, and neurophysiological correlates.

**Physical Implementation.** The physical realization of the mapping $\mathcal{M}$ is analyzed in Appendix L. The dominant channel is electromagnetic: coherent charge oscillations within the aggregate generate classical fields that modulate local MPU interaction parameters (Theorem L.2). This electromagnetic channel dominates gravitational effects by a factor $\mathcal{R} \sim 10^{36}$ (Theorem L.5). However, gravitational self-limitation (Appendix S) provides an upper bound on achievable CC, as the stress-energy associated with generating high-CC contexts can disrupt the quantum coherence required for the effect.

**Unified Structure.** The perspectival resolution of Wigner's Friend (Sections M.6.1–M.6.4) and the CC hypothesis (Section 9) share a common mathematical foundation:

| Component | Role in Wigner's Friend | Role in CC |
|-----------|------------------------|------------|
| Perspectival State $S_{(s)}(t)$ | Indexes actuality to perspectives | Provides substrate for context-dependent dynamics |
| Perspective Space $\Sigma$ | Houses transformation laws between observers | Defines manifold on which $G_{\text{persp}}$ acts |
| Transition Kernel $G_{\text{persp}}$ | Ensures consistency upon interaction | Provides entry point for CC modulation via $N$ |
| 'Evolve' Process | Universal actualization mechanism | Target of CC influence |
| Interaction Context $N$ | Determines measurement basis | Modulated by $\mathcal{M}(\text{context}_S)$ |

This unity reflects the deeper coherence of the PU framework: the same structures that resolve interpretive puzzles in quantum foundations also generate the framework's novel empirical predictions.

### M.6.9 Synthesis

The perspectival resolution of quantum measurement represents not a retreat from realism but its appropriate generalization. Just as Einstein taught us that certain spatiotemporal facts require frame specification, the PU framework teaches that certain quantum facts require perspective specification.

The key elements of the resolution are:

1. **Complete state specification** includes perspective: $S_{(s)}(t) = (|\psi(t)\rangle, s)$

2. **Actuality is perspective-relative**: Outcomes are actual relative to the perspective participating in the 'Evolve' interaction

3. **Perspectives correlate through interaction**: The kernel $G_{\text{persp}}$ and its extension to joint systems (Lemma M.6.1) ensure consistency emerges dynamically

4. **Cross-perspective reasoning is constrained**: Valid inferences across perspectives require either interaction or restriction to perspective-invariant propositions (Lemma M.6.2)

5. **The framework is derived, not postulated**: SPAP and thermodynamic necessity force the perspectival structure

6. **The formalism generates empirical content**: The interaction context $N$ in $G_{\text{persp}}$ provides the entry point for CC modulation, yielding testable predictions (Section 13)

This extends the relativistic program for quantum mechanics: the measurement problem is resolved by recognizing that "measurement outcome" is a perspective-relative concept, just as "simultaneity" is a frame-relative concept. The underlying physical reality—the MPU network governed by POP and PCE—remains unified and objective. Only our descriptions, necessarily anchored to perspectives, exhibit the relativity that SPAP and thermodynamic irreversibility demand.

Crucially, this resolution is not merely philosophical. The same perspectival machinery that dissolves Wigner's Friend provides the mathematical substrate for the framework's most distinctive claim: that consciousness, operationalized as high-complexity predictive processing, can influence quantum outcomes through the context-dependence of 'Evolve' dynamics. The resolution of a foundational paradox and the generation of novel empirical predictions flow from a single, unified formal structure.

## M.7 Conclusion

This appendix has provided a rigorous mathematical framework for the Perspectival State and Dual Dynamics central to the PU framework's quantum mechanics.

**Formal Foundations (M.2–M.5).** The Perspective Space $\Sigma \cong U(d_0)/U(1)^{d_0}$ and the conditional transition kernel $G_{\text{persp}}$ generated by drift-diffusion dynamics (Equations M.5a–b) yield a precise description of quantum measurement. The Born rule, derived from PCE optimization (Theorem G.1.7), governs amplitude actualization, while definite outcomes emerge through stochastic perspective transitions. Wasserstein contractivity (Equation M.5c) ensures robustness.

**Resolution of Foundational Paradoxes (M.6).** The perspectival formalism resolves the Wigner's Friend and Frauchiger-Renner paradoxes:

- **Theorem M.6.1:** Outcome $k$ is actual relative to Friend's perspective $s'_F$ while remaining indefinite relative to Wigner's $s_W$—no contradiction arises because actuality is perspective-indexed.
- **Lemma M.6.1:** Upon interaction, the joint kernel $G_{\text{persp}}^{(WF)}$ drives perspectives toward consistent configurations with contractivity-guaranteed convergence.
- **Lemma M.6.2 & Theorem M.6.2:** Cross-perspective reasoning requires either prior interaction or restriction to perspective-invariant quantities; the FR contradiction traces to violating this constraint.
- **Structural Correspondence M.6.4:** Just as finite $c$ forces frame-relative simultaneity, SPAP + thermodynamic irreversibility ($\varepsilon \geq \ln 2$) forces perspective-relative actuality—extending the relativistic program to quantum mechanics.

**Connection to CC.** The interaction context $N$ in $G_{\text{persp}}(s'|s, k, N, \Delta t)$ provides the entry point for CC modulation (Hypothesis 3). High-complexity aggregates influence outcomes by modulating $N$ via the mapping $\mathcal{M}$ (Appendix L), yielding bounded Born rule deviations (Theorem 51). The causality bound $\alpha_{CC,\max} < 0.5$ (Theorem 39) preserves the consistency mechanism of Lemma M.6.1.

**Synthesis.** The perspectival formalism achieves mathematical precision for the 'Evolve' process, resolves foundational paradoxes by explicit perspective tracking, and generates empirical predictions through the CC mechanism. The resolution generalizes realism rather than retreating from it: the MPU network remains unified and objective, while descriptions exhibit the perspective-relativity that SPAP and thermodynamic irreversibility demand.