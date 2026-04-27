# Appendix M: Formalism for Perspectival Quantum Dynamics

## M.1 Introduction

This appendix provides a detailed mathematical formalism for the concepts of the Perspectival State ($S_{(s)}(t)$, Definition 24) and the 'Evolve' dynamics (Definition 27) introduced in Section 7. The purpose is to enhance the formal precision and mathematical rigor of the description of quantum states and the interaction ('Evolve'/measurement) process presented in Sections 7 and 8, demonstrating consistency with established mathematical structures and resolving long-standing foundational puzzles in quantum mechanics.

We assume the validity of the foundational principles established earlier, including the Prediction Optimization Problem (POP, Axiom 1), Principle of Compression Efficiency (PCE, Definition 15), the existence of Minimal Predictive Units (MPUs, Definition 23) operating at complexity $C_{op} \ge K_0$, the emergence of the MPU Hilbert space $\mathcal{H}_0$ (Proposition 4), the Dual Dynamics model (Section 7.3.3), and importantly, the derivation of the Born rule from POP/PCE consistency principles as detailed in Appendix G (Theorem G.1.7). This appendix builds upon these results to provide a precise mathematical model for the stochastic dynamics associated with MPU interactions ('Evolve').

The appendix is organized as follows:

- **Section M.2** formalizes the Perspectival State $S_{(s)}(t) = (|\psi(t)\rangle, s)$, establishing the Perspective Space $\Sigma \cong U(d_0)/U(1)^{d_0}$ as the complete flag manifold equipped with a natural Riemannian metric.

- **Section M.3** develops the Dual Dynamics formalism, decomposing measurement into Born actualization together with a conditional perspective transition kernel $G_{\text{persp}}(s'|s, k, N, \Delta t)$, and then exhibiting an explicit drift-diffusion realization on $\Sigma$ whose constructed class satisfies the stated normalization and Wasserstein-contractivity properties.

- **Section M.4** applies this formalism to the quantum measurement process, demonstrating how definite outcomes emerge through the 'Evolve' dynamics without invoking wavefunction collapse as a separate postulate.

- **Section M.5** addresses the mathematical consistency of the framework, confirming compatibility with standard mathematical structures (Hilbert spaces, homogeneous spaces, Markov kernels).

- **Section M.6** demonstrates the explanatory power of the perspectival formalism by resolving the Wigner's Friend paradox and the Frauchiger-Renner extension. The resolution proceeds by recognizing that actuality is indexed by perspective: both Friend and Wigner provide correct descriptions relative to their respective perspectives, with consistency emerging dynamically upon interaction through the kernel $G_{\text{persp}}$. This section establishes the structural correspondence between the perspectival resolution and Einstein's relativization of simultaneity, and connects the formalism to the Consciousness Complexity (CC) hypothesis by identifying the interaction context $N$ as the entry point for CC modulation.

- **Section M.7** concludes by synthesizing the contributions of the appendix and situating the perspectival formalism within the broader framework.


## M.2 The Perspectival State Formalized

We formally define the components describing the state of a Minimal Predictive Unit (MPU).

*   **Perspectival State:** As defined in Definition 24, the complete state of an MPU at time $t$ is the **perspectival state** $S_{(s)}(t) = (S(t), s)$.
*   **State Amplitude:** The component $|\psi(t)\rangle$ is the state vector $|\psi(t)\rangle$, an element of the MPU's complex Hilbert space $\mathcal{H}_0$ (Proposition 4). The dimension $d_0 = \dim(\mathcal{H}_0)$ satisfies $d_0 \ge 8$ (Theorem 23).
*   **Perspective Index:** The component $s$ is the perspective index, representing the interaction context or observational basis relevant to the MPU's potential interactions. It is an element of the Perspective Space $\Sigma$.
*   **Perspective Space $\Sigma$:** As established by Theorem 25 and Theorem 26, the Perspective Space $\Sigma$ is mathematically identified with the space of all possible ordered orthonormal bases (ONBs) of the Hilbert space $\mathcal{H}_0$, modulo phase equivalence. This space possesses the structure of the complete flag manifold, a compact complex homogeneous space, specifically $\Sigma \cong U(d_0)/U(1)^{d_0}$. Here, $U(d_0)$ is the unitary group on $\mathcal{H}_0$ and $U(1)^{d_0}$ is the maximal torus subgroup representing the freedom to choose phases for each basis vector independently.
*   **Metric on $\Sigma$:** The manifold $\Sigma$ is equipped with a natural distance metric $d_\Sigma(s_1, s_2)$, such as the one induced by the Fubini-Study metric on the space of projectors, which quantifies the geometric distance or "incompatibility" between two perspectives (bases) $s_1$ and $s_2$. (See Equation (42) for a related construction).

This structure $(\mathcal{H}_0, \Sigma, d_\Sigma)$ provides the formal mathematical setting for describing the state and dynamics of an MPU.

## M.3 Formalizing the Dual Dynamics

The framework posits Dual Dynamics for MPUs (Section 7.3.3). We formalize both components.

### M.3.1 Amplitude Evolution (Internal Prediction)

During the Internal Prediction phase (Definition 26), the state amplitude $S(t) = |\psi(t)\rangle$ evolves deterministically and unitarily according to the time-dependent Schrödinger equation, generated by the MPU's internal Hamiltonian $\hat{H}$ (identified with baseline operational energy cost $R(C_{op})$, Theorem 29):
$$
i\hbar \frac{d}{dt} |\psi(t)\rangle = \hat{H} |\psi(t)\rangle \quad \text{(M.1, cf. Equation 43)}
$$
This unitary evolution $U_0(\Delta t) = \exp(-i\hat{H}\Delta t/\hbar)$ acts only on the Hilbert space component $|\psi(t)\rangle$ of the Perspectival State $S_{(s)}(t)$. It proceeds continuously in the background, irrespective of 'Evolve' events.

### M.3.2 Interaction ('Evolve') Dynamics as a Stochastic Process

The 'Evolve' process (Definition 27), triggered by an interaction $N(t)$, represents a stochastic transition of the full Perspectival State $S_{(s)}(t) = (|\psi(t)\rangle, s)$. Mathematically, this is described as a stochastic process occurring over a characteristic interaction time interval $\Delta t$.

*   **Transition Probability Measure:** The transformation is characterized by a transition probability measure, denoted $d\mathbb{P}(f | i, N, \Delta t)$. This gives the probability for a system starting in initial state $i = (|\psi\rangle, s)$ to transition into an infinitesimal region of the final state space centered around $f = (|\psi'\rangle, s')$, under the influence of interaction $N$ during the interval $\Delta t$.
*   **Structure Imposed by Framework Principles:** The structure of this transition measure is constrained by the principles established earlier:
    1.  *(Amplitude Actualization)* The state amplitude component undergoes a probabilistic transition, actualizing into one of the basis states $|k\rangle_{s_{\mathrm{int}}}$ corresponding to the interaction-selected perspective $s_{\mathrm{int}}=s_{\mathrm{int}}(N)$. For a measurement interaction, $s_{\mathrm{int}}=s_{meas}$ is fixed by the apparatus. Let $P_k = |k\rangle_{s_{\mathrm{int}}}\langle k|_{s_{\mathrm{int}}}$ be the projector onto this outcome state.
    2.  *(Born Rule Probability)* The probability for the system to actualize into the specific outcome state $|k\rangle_{s_{\mathrm{int}}}$ is given by
        $$
        P_{Born}(k | |\psi\rangle, s_{\mathrm{int}}) = |\langle k | \psi \rangle_{s_{\mathrm{int}}}|^2.
        $$
        This rule is derived from POP/PCE consistency principles (Appendix G, Theorem G.1.7).
    3.  *(Perspective Shift)* Concurrently with or subsequent to the amplitude actualization yielding outcome $k$, the perspective index undergoes a stochastic transition $s \to s'$. The distribution of the final perspective $s'$ depends on the initial perspective $s$, the specific outcome $k$, and the nature of the interaction $N$.

*   **Formal Decomposition of the Transition:** Based on these constraints, we decompose the probability measure for the transition $(|\psi\rangle, s) \to (|k\rangle_{s_{\mathrm{int}}}, s')$ occurring via interaction $N$ over $\Delta t$. The joint probability (density with respect to $s'$) for actualizing the amplitude into state $|k\rangle_{s_{\mathrm{int}}}$ *and* transitioning the perspective to $s'$ can be expressed as:
    $$
    \frac{d\mathbb{P}( (|k\rangle_{s_{\mathrm{int}}}, s') | (|\psi\rangle, s), N, \Delta t)}{d\mu(s')} = P_{Born}(k | |\psi\rangle, s_{\mathrm{int}}) \times G_{persp}(s' | s, k, N, \Delta t) \quad \text{(M.2)}
    $$
    where:
    *   $P_{Born}(k | |\psi\rangle, s_{\mathrm{int}})$ is the probability of amplitude actualization to outcome $k$ in the interaction-selected basis.
    *   $G_{persp}(s' | s, k, N, \Delta t)$ is the Conditional Perspective Transition Kernel. This function represents the probability density (with respect to the measure $d\mu(s')$) for the perspective index to transition from the initial perspective $s$ to the final perspective $s'$, *given that* outcome $k$ was actualized during the interaction $N$ over the interval $\Delta t$.
    *   $G_{persp}$ must satisfy the properties of a Markov kernel density on the perspective space $\Sigma$. For fixed $s, k, N, \Delta t$, it must be non-negative and normalized with respect to the invariant measure $\mu(s')$ on $\Sigma$:
        $$ \int_{\Sigma} G_{persp}(s' | s, k, N, \Delta t) \, d\mu(s') = 1 \quad \forall s, k, N, \Delta t \quad \text{(M.3)} $$
    *   $d\mu(s')$ is the volume element associated with the unique unit-normalized Haar measure (invariant measure) on the compact manifold $\Sigma$.

This formulation rigorously separates the probability of *which* outcome occurs (governed by the derived Born rule) from the dynamics of *where* the perspective lands conditioned on that outcome (governed by the kernel $G_{persp}$).

### M.3.3 Properties and an Explicit Drift-Diffusion Realization of the Conditional Perspective Kernel $G_{persp}$

The detailed interaction dependence of the conditional kernel $G_{persp}(s' | s, k, N, \Delta t)$ is not fixed uniquely at the present level of the framework: it encodes the physics of the interaction $N$ and may vary across admissible interaction models. What is fixed here is the structural decomposition (M.2), the normalization requirement (M.3), the ideal projective limit (M.4), and an explicit drift-diffusion realization whose short-time behavior matches the Gaussian-with-drift heuristic form and whose semigroup satisfies the robustness conditions used below. We therefore begin by stating the generic properties and then present that constructive realization.

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

#### M.3.3.1 Constructive realization of $G_{\mathrm{persp}}$

We now exhibit an explicit generator on the perspective manifold
$\Sigma\cong U(d_{0})/U(1)^{d_{0}}$ whose time-$t$ transition kernel has the same short-time Gaussian-with-drift structure as the heuristic form (M.5) in the weak-measurement limit and, crucially, satisfies the robustness conditions of Theorem L.1.

**(a) Geometric setup**

Equip $\Sigma$ with the quotient Riemannian metric $g_\Sigma$ of Definition 25. Let $\Delta_{\Sigma}:=\operatorname{div}_{\Sigma}\nabla_{\Sigma}$ denote the corresponding **nonpositive** Laplace–Beltrami operator, so that $e^{t\Delta_{\Sigma}}$ is the heat semigroup on $\Sigma$.

**(b) Interaction-biased Lindblad generator**

For a fixed outcome corresponding to the state vector $\lvert k\rangle_{s}$ (here $\lvert k\rangle_{s}$ denotes the perspective itself, rather than the projector), we define a **drift potential** on $\Sigma$. Locally, in a convex normal neighborhood of $s_k$ (where the squared distance function is smooth), one may take the natural form
$$
V_{k}^{\mathrm{loc}}(s') \;=\; \frac{\lambda_{\mathrm{drift}}}{2}\,d_{\Sigma}^{2}\bigl(s',\,s_{k}\bigr),
\qquad \lambda_{\mathrm{drift}}>0.
$$
For a globally smooth Markov generator on the compact manifold $\Sigma$, replace this by a smooth Morse-type potential $V_k^{\mathrm{sm}}(s')$ with a unique minimum at $s_k$, vanishing gradient at $s_k$, and quadratic Hessian $\lambda_{\mathrm{drift}} g_\Sigma$ near $s_k$ — for instance, the smooth projector-overlap surrogate $V_k^{\mathrm{sm}}(s') = \lambda_{\mathrm{drift}}[1-\langle s_k | \mathcal{P}(s') | s_k \rangle]$ via the perspective projector, after choosing the normalization so its quadratic Hessian agrees with $\lambda_{\mathrm{drift}} g_\Sigma$ at $s_k$. This surrogate agrees with $V_k^{\mathrm{loc}}$ to second order at $s_k$ and is smooth on all of $\Sigma$. The notation $V_k$ refers to either, with the local form valid in a convex normal neighborhood and the global form valid throughout the compact manifold; the two forms coincide to leading order near $s_k$ and the downstream short-time bounds use only this local agreement.
Following standard diffusion-with-drift constructions (see Breuer & Petruccione 2002, §3.4), we introduce the backward diffusion generator on $\Sigma$ in weighted-gradient form:

$$
\mathcal{L}_{\Sigma}^{(k)} f
  \;=\;
  \Delta_{\Sigma} f
  \;-\;
  \langle \nabla_{\Sigma} V_{k},\,\nabla_{\Sigma} f\rangle.
\tag{M.5a}
$$

This preserves constants ($\mathcal{L}_{\Sigma}^{(k)}1=0$) and generates a Markov semigroup. It is reversible with respect to the Gibbs weight $\exp[-V_{k}(s')]\,d\mathrm{vol}_{\Sigma}$ and drifts perspectives toward $s_{k}$. In divergence form,
$$
\mathcal{L}_{\Sigma}^{(k)} f
=
e^{V_k}\,\operatorname{div}_{\Sigma}\!\big(e^{-V_k}\,\nabla_{\Sigma} f\big).
$$

**(c) Markov kernel and normalisation**

The corresponding transition kernel at interaction duration $\Delta t$ is
$$
G_{\mathrm{persp}}\bigl(s'\,|\,s,k,N,\Delta t\bigr)
\;=\;
\Bigl[e^{\Delta t\,\mathcal L_{\Sigma}^{(k)}}\Bigr](s,s').
\tag{M.5b}
$$
On the global smooth-potential branch (using $V_k^{\mathrm{sm}}$ above), $\mathcal L_{\Sigma}^{(k)}$ is elliptic with smooth coefficients on the compact manifold $\Sigma$, so $e^{\Delta t\mathcal L_{\Sigma}^{(k)}}$ is a strictly positive, smooth Markov kernel satisfying the normalisation (M.3). On the local convex-neighborhood branch (using $V_k^{\mathrm{loc}}$), the kernel is well-defined within the support region but may fail to be smooth at the cut locus of $s_k$, where $V_k^{\mathrm{loc}}$ fails to be $C^2$. For small $\Delta t$, the kernel of the heat semigroup generated by $\Delta_{\Sigma}$ admits the standard short-time expansion in Riemannian normal coordinates about the initial point $s$:
$$
p_{\Delta t}(s,s')
\sim
\frac{1}{(4\pi\Delta t)^{\dim\Sigma/2}}
\exp\Big(-\frac{d_{\Sigma}^2(s,s')}{4\Delta t}\Big)\,(1+O(\Delta t)),
$$
see e.g. [Gray 2004]. The drift potential $V_k$ biases the diffusion toward the outcome-dependent region (here denoted by $|k\rangle_s$ in (M.5)), and in the regime where the transition remains within a convex normal neighborhood the resulting short-time transition density is well-approximated by a Gaussian in geodesic distance with width $\sigma^2=\Theta(\Delta t)$; no closed-form expression for $\sigma^2$ is required for subsequent bounds.

**(d) Lipschitz contractivity (robustness)**

Set $W_{2}$ for the Wasserstein-2 distance on the space of probability measures $\mathcal P(\Sigma)$.
A sufficient condition for $W_2$-contractivity of the diffusion semigroup generated by $\mathcal{L}_{\Sigma}^{(k)}$ is a Bakry–Émery lower bound
$$
\mathrm{Ric}_{\Sigma}+\mathrm{Hess}_{\Sigma}V_k\succeq \kappa_{\rm eff}\,g_{\rm FS}
$$
for some constant $\kappa_{\rm eff}$ on the region where the dynamics is supported; under this condition,
$$
W_2(\mu P_t,\nu P_t)\le e^{-\kappa_{\rm eff}t}W_2(\mu,\nu)
\tag{M.5c}
$$
for all probability measures $\mu,\nu$ supported in that region [Bakry et al. 2014; Ambrosio et al. 2005]. For $\Sigma \cong U(d_0)/U(1)^{d_0}$ the Ricci curvature is non-negative, so the bound requires only $\mathrm{Hess}_{\Sigma}V_k \succeq \kappa_{\rm eff}\,g_{\rm FS}$.
Hence $G_{\mathrm{persp}}$ (as an operator on measures) is $e^{-\kappa_{\rm eff}\Delta t}$-contractive in the $W_2$ sense, providing the Lipschitz continuity required for robustness of the CC mapping as discussed in Theorem L.1. The analysis below uses only the existence of some finite contractivity constant over a single-cycle time step $\Delta t$; no global identification $\kappa_{\rm eff}=\lambda_{\rm drift}$ is required.
Because $\lambda_{drift}$ is tunable by the measurement strength $N$ (larger $\lambda_{drift}$ implies stronger drift towards $s_k$), the model interpolates smoothly between:

*   **Weak interaction** ($\lambda_{drift}\!\to\!0$): almost isotropic diffusion on $\Sigma$ (maximal robustness to small context errors influencing the choice of $s_k$).
*   **Projective limit** ($\lambda_{drift}\!\to\!\infty$): kernel $G_{\text{persp}}(s'|s,k,N,\Delta t)$ collapses to $\delta_{\Sigma}(s',s_k)$ as in Equation (M.4).

**(e) Consistency with ND-RID entropy budget**

For any finite $\lambda_{drift}$, the operator (M.5a) generates a Markov diffusion on the compact manifold $\Sigma$ with smooth invariant density
$$
d\pi_k(s') = Z_k^{-1} e^{-V_k(s')}\,d\mu(s').
$$
Let $\mu_t$ denote the law of $s_t$ under this diffusion and write $f_t:=d\mu_t/d\pi_k$. The relative entropy
$$
H(\mu_t|\pi_k):=\int_\Sigma f_t\ln f_t\,d\pi_k
$$
satisfies the standard entropy-dissipation identity
$$
\frac{d}{dt}H(\mu_t|\pi_k) = -\int_\Sigma \|\nabla_\Sigma \ln f_t\|_{g_{\rm FS}}^2\,d\mu_t \le 0,
$$
so the entropy exported to the environment over an evolve step of duration $\Delta t$ is at least $H(\mu_0|\pi_k)-H(\mu_{\Delta t}|\pi_k)\ge 0$. Hence the perspective-update contribution can only increase the total irreversibility of the full 'Evolve' step; it does not require any entropy cost smaller than the irreducible floor $\varepsilon$ satisfying $\varepsilon \ge \ln 2$ (Theorem 31), with equality in the saturating MPU model. Quantitative decay-rate bounds compatible with (M.5c) follow from the same Bakry–Émery curvature condition via standard functional inequalities [Bakry et al. 2014], but no such rate bound is required for the present construction.

## M.4 The Measurement Process Formalized

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

## M.5 Mathematical Consistency

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

This is not merely $F$'s knowledge or belief—outcome $|0\rangle$ is *actual* relative to perspective $s'_F$. The actualization occurs through the probabilistic amplitude transition governed by the Born rule (Proposition 7, Theorem G.1.7), with probability $P(0|\,|\psi\rangle, s_F) = |\alpha|^2$.

**Step 3 (No Absolute Collapse).** From $W$'s external perspective $s_W$, no 'Evolve' event has occurred between $W$ and the laboratory. The complete state relative to $s_W$ remains:

$$
S_{(s_W)}(t + \Delta t) = (|\Psi\rangle_{FQ}, s_W) \tag{M.11}
$$

Both descriptions (M.10) and (M.11) are correct—they describe the same physical situation relative to different perspectives. There is no contradiction because actuality is indexed by perspective.

**Step 4 (Consistency upon Interaction).** When $W$ opens the laboratory and interacts with $F$, this constitutes an 'Evolve' event correlating their perspectives. The transition kernel $G_{\text{persp}}(s'|s, k, N, \Delta t)$ (Equations M.5a–b, Section M.3.3.1) governs the evolution on the perspective manifold $\Sigma$. For the joint $W$-$F$ system, the interaction induces correlated dynamics on the product space $\Sigma_W \times \Sigma_F$, driving both perspectives toward mutual consistency regarding the observed outcome.

**Remark M.6.1: Idealized Isolation.** The Wigner's Friend scenario stipulates idealized isolation of $F$'s laboratory—no decoherence channels connect $F+Q$ to $W$'s environment during the intermediate period. In realistic settings, environmental decoherence would establish shared perspective records through uncontrolled 'Evolve' events before $W$ deliberately opens the laboratory [Zurek 2003; Schlosshauer 2007]. The paradox arises precisely because the gedanken experiment suppresses these channels.

**Lemma M.6.1 (Correlated Perspective Dynamics in the Strong-Readout Limit).** Let $W$ and $F$ be observers with perspectives $s_W, s_F \in \Sigma$ respectively. Suppose that when $W$ physically interacts with the system $F+Q$ at time $t_2$, the realized record value is $k$, each single-perspective update is generated by $\mathcal L_\Sigma^{(k)}$, and the post-actualization perspective noises acting on $W$ and on $F$ are conditionally independent given $k$. Then the joint 'Evolve' event is characterized by the product transition kernel
$$
G_{\text{persp}}^{(WF)}\big((s'_W, s'_F)\,|\,(s_W, s_F), k, N_{W(FQ)}, \Delta t\big)
=
G_{\text{persp}}(s'_W | s_W, k, N, \Delta t)\,G_{\text{persp}}(s'_F | s_F, k, N, \Delta t).
\tag{M.12}
$$
Moreover:

(i) in the strong-readout limit $\lambda_{\text{drift}}\to\infty$, the joint law converges weakly to a measure concentrated on configurations for which both $s'_W$ and $s'_F$ encode the same outcome $k$;

(ii) on any region where
$$
\mathrm{Ric}_\Sigma+\mathrm{Hess}_\Sigma V_k\succeq \kappa_{\text{eff}}\,g_\Sigma,
$$
the product semigroup is Wasserstein-2 contractive:
$$
W_2\!\left(\mu^{(WF)} \cdot G_{\text{persp}}^{(WF)}, \nu^{(WF)} \cdot G_{\text{persp}}^{(WF)}\right) \leq e^{-\kappa_{\text{eff}} \Delta t} W_2(\mu^{(WF)}, \nu^{(WF)}).
\tag{M.13}
$$

*Proof.*

**Construction of the joint kernel.** Under the conditional-independence hypothesis, conditioning on the realized record value $k$ gives the product kernel displayed in (M.12). Equivalently, (M.12) is the transition kernel of the product semigroup generated by
$$
\mathcal L_{\Sigma\times\Sigma}^{(k)}:=\mathcal L_{\Sigma}^{(k)}\otimes I + I\otimes \mathcal L_{\Sigma}^{(k)}.
$$

**Proof of (i).** For each factor, the strong-readout limit $\lambda_{\text{drift}}\to\infty$ forces the single-perspective kernel to converge weakly to $\delta_\Sigma(\cdot,s_k)$. Therefore the product kernel converges weakly to
$$
\delta_{\Sigma\times\Sigma}((s'_W,s'_F),(s_k,s_k)),
$$
which is concentrated on shared-outcome configurations.

**Proof of (ii).** Equip $\Sigma\times\Sigma$ with the product metric
$$
d_{\Sigma \times \Sigma}^2((s_1,s_2),(s'_1,s'_2))
:=
d_\Sigma^2(s_1,s'_1)+d_\Sigma^2(s_2,s'_2).
$$
If the single-factor Bakry–Émery lower bound holds with constant $\kappa_{\text{eff}}$, then the product potential
$$
V_k^{(WF)}(s'_W,s'_F):=V_k(s'_W)+V_k(s'_F)
$$
satisfies the same lower bound on the product manifold. The Bakry–Émery criterion therefore yields the displayed $W_2$ contraction estimate for the product semigroup [Bakry & Émery 1985; Ambrosio, Gigli & Savaré 2008]. ∎

**Theorem M.6.1 (Wigner's Friend Resolution for Record-Reading Interactions).** Let $F$ and $W$ be observers with initial perspectives $s_F, s_W \in \Sigma$. Suppose that at time $t_1$ the observer $F$ undergoes an 'Evolve' interaction with system $Q$, yielding record value $k$ and updated perspective $s'_F$. Assume that at a later time $t_2>t_1$, $W$ performs a record-reading interaction on the $F+Q$ system in the same outcome basis, and that the strong-readout hypotheses of Lemma M.6.1 hold for the resulting joint kernel. Then:

(i) For $t_1 < t < t_2$, outcome $k$ is actual relative to $s'_F$, while no definite outcome need be actual relative to $s_W$.

(ii) After the readout interaction at $t_2$, the joint post-interaction perspective law on $\Sigma_W\times\Sigma_F$ becomes concentrated near configurations encoding the same record value $k$; in the ideal strong-readout limit it converges to a configuration with shared outcome label $k$.

No contradiction arises because actuality is indexed by perspective throughout.

*Proof.*

**Part (i).** By Definition 27, actualization occurs only relative to the perspective participating in the interaction. At $t_1$, $F$ interacts with $Q$, so the pair $(Q,F)$ undergoes amplitude actualization with Born probability in the measurement basis and a perspective transition
$$
s_F\to s'_F.
$$
Since $W$ does not interact with the $F+Q$ system during $(t_1,t_2)$, no corresponding actualization relative to $s_W$ is forced by this event alone. Hence $k$ is actual relative to $s'_F$ but not necessarily relative to $s_W$.

**Part (ii).** By assumption, the interaction at $t_2$ is a readout of the same record basis. Conditioned on the record value $k$, Lemma M.6.1 supplies a joint kernel on $\Sigma_W\times\Sigma_F$ whose strong-readout limit is concentrated on configurations encoding that same value $k$ for both observers. Therefore the post-interaction perspectives become correlated to the same record, and in the ideal limit they converge to a common outcome-labeled configuration. This is exactly the sense in which the later interaction produces inter-perspective consistency.

Because the two assertions are indexed to different perspectives before $t_2$ and to a later correlated interaction after $t_2$, there is no contradiction. ∎

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
| **Dynamics** | No quantitative mechanism for perspective change | Explicit drift-diffusion realization of $G_{\text{persp}}$ on $\Sigma$ (Equations M.5a–b) |
| **Consistency criterion** | Interactions establish relations (qualitative) | Bakry-Émery control yields $W_2$-contractive convergence for the constructed class (Equation M.5c) |
| **Origin of probability** | Born rule assumed | Born rule derived from PCE optimization (Theorem G.1.7, Appendix G.1) |
| **Temporal structure** | Time assumed | Directed time required for prediction (Theorem 4); emerges from thermodynamic irreversibility (Appendix O) |

**Remark M.6.3: RQM as Limiting Case.** Relational Quantum Mechanics can be understood as capturing the interpretive content of the PU perspectival formalism when the underlying derivational structure (SPAP, PCE, MPU dynamics) is suppressed and only the relational consequences retained. The crucial distinction is that PU answers *why* quantum mechanics has a relational structure—because the framework is built from prediction, and prediction is inherently perspectival due to self-referential limitations (Corollary 1). RQM correctly identifies the relational character but lacks the foundation that makes it *necessary*.

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

**Remark M.6.5: Scope of the Correspondence.** The correspondence is structural and conceptual rather than mathematical in detail. Lorentz transformations form a continuous Lie group acting on Minkowski spacetime; the perspective dynamics governed by $G_{\text{persp}}$ are stochastic transitions on a distinct manifold $\Sigma$. The parallel illuminates the *type* of conceptual move—relativizing an apparently absolute concept—rather than claiming isomorphism of the mathematical structures.

**Remark M.6.6 (Unified Origin of Both Relativizations).** The parallel between special relativity and perspectival quantum mechanics (Structural Correspondence M.6.4) is deeper than structural analogy: the finite invariant speed $c$ that forces frame-relative simultaneity is *itself* a consequence of the same SPAP + thermodynamic irreversibility that forces perspective-relative actuality.

**The Derivation Structure.** From Appendix E (Sections E.2–E.4) and Appendix E.10, the connection proceeds through two branches sharing a common thermodynamic origin in the SPAP entropy cost:

$$
\boxed{\text{SPAP} \;\xrightarrow{\text{Theorem 31}}\; \varepsilon \geq \ln 2}
$$

From this common source, two independent branches emerge:

**Branch I (Information Capacity):**
$$
\varepsilon \geq \ln 2 \;\xrightarrow{\text{Lemma E.1}}\; p>0 \;\xrightarrow{\text{Lemma E.1}}\; f_{RID}=1-p<1 \;\xrightarrow{\text{Theorem E.2}}\; C_{\max} < \ln d_0
$$

**Branch II (Propagation Velocity):**
$$
\text{SPAP structure} \;\xrightarrow{\text{Theorem 29}}\; \tau_{min} > 0 \;\xrightarrow[\text{Definition 35}]{\delta > 0}\; v_{max} = \frac{\delta}{\tau_{min}} \;\xrightarrow{\text{Theorem 46}}\; c
$$

These branches are *parallel consequences* of SPAP, not sequential implications. Branch I proceeds through the thermodynamic cost $\varepsilon \geq \ln 2$ to constrain how faithfully information can be preserved; Branch II proceeds through the computational complexity of the SPAP cycle to constrain how fast information can propagate. Both originate in the logical structure of self-referential prediction.

---

### Step-by-Step Justification

**1. Theorem 31 (Appendix J): Irreducible Entropy Cost ε ≥ ln 2**

The irreducible entropy cost $\varepsilon \geq \ln 2$ arises from the logically necessary 2-to-1 state merge in the SPAP update cycle. The SPAP cycle maps four input configurations $\{(\phi, p)\} = \{(0,0), (0,1), (1,0), (1,1)\}$ to two output configurations $\{(\phi', p_{ready})\} = \{(0, p_{ready}), (1, p_{ready})\}$.

*Landauer Conditions.* The SPAP cycle structure ensures the conditions for Landauer's principle [Landauer 1961] are satisfied: (i) the prediction register *must* reset to $p_{ready}$ before each new cycle can commence—this is not optional but logically required for the cycle to close; (ii) the system cannot retain side information about which of the merged input states led to the current output, because the reset erases precisely this information; (iii) the input distribution is effectively uniform over the merged states from the system's perspective post-reset. Under these conditions, Landauer's bound applies unconditionally: $\varepsilon = \ln(4/2) = \ln 2$ nats. This bound is exact and saturated by optimal erasure protocols [Landauer 1961; Bennett 1982].

**2. Lemma E.1 (Branch I): Strict Contractivity of the ND-RID Channel**

The entropy cost $\varepsilon > 0$ implies that the averaged ND-RID 'Evolve' channel $\mathcal{E}_N$ is strictly contractive in trace distance.

*Kraus Representation.* The 'Evolve' interaction (Definition 27) comprises a reversible reflexive update $U_{rev}$ and a logically irreversible ancilla reset. The explicit Kraus operators acting on $\mathcal{H}_0 = \mathcal{H}_{MP} \otimes \mathcal{H}_I$ are (Section 7.3.3.3):

$$E_0 = U_{rev} \otimes |0\rangle\langle 0|_I, \qquad E_1 = U_{rev} \otimes |0\rangle\langle 1|_I$$

Completeness follows by direct calculation:
$$E_0^\dagger E_0 + E_1^\dagger E_1 = (U_{rev}^\dagger U_{rev}) \otimes (|0\rangle\langle 0| + |1\rangle\langle 1|) = I_{MP} \otimes I_I$$

ensuring CPTP structure. The ancilla's reduced state after the map is $|0\rangle\langle 0|$ for any input, implementing a physical reset channel $T_\sigma(\rho) = \mathrm{tr}(\rho)\sigma$ with $\sigma = |0\rangle\langle 0|$.

*Channel Decomposition.* The averaged ND-RID 'Evolve' channel contains a nonzero input-independent refresh component (Lemma E.1), and can be written as
$$
\mathcal{E}_N = (1-p)\Psi + p\,T_\sigma,\qquad p\in(0,1],
$$
where $\Psi$ is CPTP and $T_\sigma(\rho)=\mathrm{Tr}(\rho)\sigma$ is an input-independent refresh to a fixed state $\sigma$. For traceless $\Delta$ we have $T_\sigma(\Delta)=0$, hence $\mathcal{E}_N(\Delta)=(1-p)\Psi(\Delta)$ and Lemma E.1 gives the uniform trace-distance contraction
$$
D_{tr}(\mathcal{E}_N(\rho_1),\mathcal{E}_N(\rho_2))\le (1-p)\,D_{tr}(\rho_1,\rho_2),
\qquad
f_{RID}=1-p<1.
$$
If additionally $\sigma\succ0$, then $\mathcal{E}_N(\rho)=(1-p)\Psi(\rho)+p\sigma\succ0$ for all states $\rho$, so $\mathcal{E}_N$ is strictly positive and hence primitive [Sanz et al. 2010]. No universal quantitative lower bound on $p$ follows from $\varepsilon$ alone without additional microscopic assumptions about how entropy production is partitioned between $\Psi$ and the refresh component.

**3. Theorem E.2 (Branch I): Channel Capacity Bound**

Strict contractivity bounds the classical channel capacity: $C_{\max}(\mathcal{E}_N) < \ln d_0$.

*Flagged (Erasure-Mixture) Capacity Bound.* Using the decomposition $\mathcal{E}_N=(1-p)\Psi+pT_\sigma$ with $p>0$, define the flagged channel
$$
\widetilde{\mathcal{E}}_N(\rho)=(1-p)\,\Psi(\rho)\otimes|0\rangle\langle0|+p\,\sigma\otimes|1\rangle\langle1|.
$$
Tracing out the flag recovers $\mathcal{E}_N$, i.e. $\mathcal{E}_N=\mathrm{Tr}_F\circ \widetilde{\mathcal{E}}_N$, so $\mathcal{E}_N$ is a degraded version of $\widetilde{\mathcal{E}}_N$ and therefore
$$
C(\mathcal{E}_N)\le C(\widetilde{\mathcal{E}}_N).
$$
For any block length $n$ and any message $M$, the flag sequence $F^n$ is independent of $M$, hence
$$
I(M;B^nF^n)=I(M;B^n\mid F^n).
$$
Conditioned on a particular flag pattern with $k$ refresh events (flag value $1$), only the remaining $n-k$ non-refresh uses can carry message information, and each such use transmits at most $\ln d_0$ nats. Therefore,
$$
I(M;B^n\mid F^n)\le (n-k)\ln d_0,
$$
and averaging over the i.i.d. flag process gives $I(M;B^nF^n)\le n(1-p)\ln d_0$. Dividing by $n$ and optimizing over codes yields
$$
C(\widetilde{\mathcal{E}}_N)\le (1-p)\ln d_0<\ln d_0,
$$
hence $C(\mathcal{E}_N)<\ln d_0$, as claimed in Theorem E.2.

**4. Theorem 29 (Branch II): Minimum MPU Cycle Time τ_min > 0**

The minimum MPU cycle time $\tau_{min} > 0$ arises from the finite complexity of the predictive update cycle combined with fundamental quantum speed limits.

*Margolus-Levitin Bound.* For any quantum system with Hamiltonian $\hat{H}$ evolving from initial state $|\psi_0\rangle$ to an orthogonal state $|\psi_\perp\rangle$, the minimum time required is bounded by [Margolus & Levitin 1998]:

$$\tau_{ML} \geq \frac{\pi\hbar}{2\langle E \rangle}$$

where $\langle E \rangle = \langle\psi_0|\hat{H}|\psi_0\rangle - E_{ground}$ is the mean energy above the ground state.

*Application to MPU Dynamics.* The MPU's internal Hamiltonian $\hat{H}_v$ (Definition 26, Equation 43) is a bounded, self-adjoint operator on the finite-dimensional Hilbert space $\mathcal{H}_{d_0}$ with $d_0 = 8$ (Theorem 23). The spectral structure of $\hat{H}_v$ determines a characteristic minimal processing timescale. For bounded $\hat{H}_v$ on finite-dimensional $\mathcal{H}_{d_0}$ with spectral width $\Delta_H := E_{max} - E_{ground}$:

$$\langle E \rangle \leq \Delta_H < \infty$$

The Fundamental Predictive Loop (Definition 4) requires transitioning between distinguishable states during the Predict → Verify → Update sequence. By the Margolus-Levitin bound:

$$\tau_{min} \geq \frac{\pi\hbar}{2\Delta_H} > 0$$

*Action-Entropy Derivation.* An independent derivation follows from the Action-Entropy Identity (Theorem Q.0.1). Each non-trivial predictive cycle has minimum action $\mathcal{S}_{min} = \hbar \cdot \varepsilon_{min} = \hbar \ln 2$. For action $\mathcal{S} = E \cdot \tau$ with finite spectral width $\Delta_H$:

$$\tau_{min} = \frac{\mathcal{S}_{min}}{\Delta_H} = \frac{\hbar \ln 2}{\Delta_H} > 0$$

Both derivations yield lower bounds ensuring $\tau_{min} > 0$ as a mathematical consequence of quantum mechanics applied to finite-dimensional systems with bounded Hamiltonians.

**5. Theorem E.10.2 (Branch II): Maximum Propagation Velocity**

The bounded cycle time $\tau_{min}$ and MPU spacing $\delta$ (Definition 35) yield a maximum propagation velocity $v_{max} = \delta/\tau_{min}$.

*Derivation.* Information traversing distance $R$ must cross $\lceil R/\delta \rceil$ links, each requiring time $\geq \tau_{min}$. In the continuum limit $R \gg \delta$, the minimum traversal time is $t_{min}(R) = (R/\delta)\tau_{min}$ and maximum velocity:

$$v_{max} = \frac{R}{t_{min}(R)} = \frac{\delta}{\tau_{min}}$$

**6. Theorem 46 (Branch II): Emergent Invariant Speed and Lorentz Structure**

The maximum causal velocity $v_{max} = \delta/\tau_{min}$ is identified with the invariant speed $c$ of the emergent Lorentzian spacetime.

*Definition of Emergent Speed.* Within the PU framework, the invariant speed is defined by:

$$c := v_{max} = \frac{\delta}{\tau_{min}}$$

This is the maximum speed at which causal influence can propagate through the MPU network, determined by the network's fundamental parameters: $\delta$ from PCE optimization (Appendix Q) and $\tau_{min}$ from the quantum speed limit on MPU dynamics.

*Planck Scale Calibration.* The Planck length and time are calibrated to the emergent scales:

$$L_P := \sqrt{\frac{\hbar G}{c^3}}, \qquad t_P := \sqrt{\frac{\hbar G}{c^5}}$$

where $c$ is the emergent invariant speed. The identity $L_P/t_P = c$ follows by construction. Proposition Q.6.1 establishes that Lorentz invariance of the emergent spacetime requires the discretization ratio:

$$\frac{\delta}{L_P} = \frac{\tau_{min}}{t_P}$$

This ratio equality follows from the definition of Planck units in terms of the emergent $c$, ensuring dimensional consistency between the discrete MPU network and the emergent continuum spacetime.

*Lorentz Invariance.* Theorem 46 establishes that the causal structure inherent in ND-RID interactions imposes a finite, invariant maximum speed for causal influence propagation across the emergent manifold $(M, g_{\mu\nu})$. The finite invariant speed $c$ geometrically defines null cones—the boundary of causal influence—requiring an indefinite (Lorentzian) metric signature $(-,+,+,+)$.

---

### Thermodynamic Origin of Locality

Locality is not a primitive axiom but emerges from:

1. **Finite entropy cost per link:** $\varepsilon \geq \ln 2$ (Theorem 31)
2. **Finite minimum cycle time:** $\tau_{min} > 0$ (Theorem 29)
3. **PCE optimization minimizing total entropy production** (Definition 15)

Superluminal propagation would require either $\varepsilon < \ln 2$ (violating Theorem 31) or $\tau < \tau_{min}$ (violating the Margolus-Levitin bound). Both are forbidden by the logical and quantum-mechanical structure of self-referential prediction established in Appendix J.

---

### The Unified Picture

The comparison table in Structural Correspondence M.6.4 should be read hierarchically rather than as independent parallels:

| Special Relativity | PU Framework | Relationship |
|:-------------------|:-------------|:-------------|
| Finite signal speed $c$ | SPAP + $\varepsilon \geq \ln 2$ + $\tau_{min} > 0$ | **Derived from** (Branch II) |
| Frame-relative simultaneity | Perspective-relative actuality | Both forced by constraints above |
| Lorentz invariance | Perspective consistency | Emerge from causal structure |

Einstein's 1905 analysis [Einstein 1905a] revealed that simultaneity, previously considered absolute, is operationally defined relative to reference frames—a consequence of the finite and invariant speed $c$. The PU framework extends this program: actuality of measurement outcomes, previously considered absolute (or at least observer-independent), is operationally defined relative to perspectives—a consequence of SPAP combined with thermodynamic irreversibility.

---

### The Deeper Unity

Both relativizations trace to a **single source**—the irreducible entropy cost of self-referential prediction. The light cone structure of spacetime and the perspectival structure of quantum measurement are dual manifestations of SPAP operating in different domains:

- **Kinematic domain** (Branch II): SPAP $\to$ finite cycle complexity $\to$ $\tau_{min} > 0$ (Margolus-Levitin) $\to$ finite $v_{max} = \delta/\tau_{min}$ $\to$ Lorentz invariance (Theorem 46) $\to$ $c \equiv v_{max}$ $\to$ frame-relative simultaneity

- **Epistemic domain** (Branch I): SPAP $\to$ $\varepsilon \geq \ln 2$ $\to$ nonzero refresh component in $\mathcal{E}_N$ ($p>0$, Lemma E.1) $\to$ $f_{RID}=1-p<1$ (strict trace-distance contraction) $\to$ no perfect state preservation $\to$ measurement disturbance unavoidable $\to$ perspective-dependent outcomes $\to$ perspective-relative actuality

The kinematic branch constrains how fast information can propagate through the MPU network. The epistemic branch constrains how faithfully information can be preserved through predictive processing. Both constraints originate in the logical structure of self-referential prediction.

---


### Completion of the Unification

Einstein's relativity of simultaneity and the PU framework's relativity of actuality are not merely analogous—they are consequences of the same underlying constraint on self-referential systems. The finite speed of light is not an independent postulate parallel to SPAP; within the framework's derivational structure, it emerges from SPAP through the thermodynamic and temporal limits on information propagation in the MPU network. The invariant speed $c = \delta/\tau_{min}$ is the geometric manifestation of the fundamental ratio between the network's spatial scale (set by PCE optimization of channel density) and temporal scale (set by the minimum time to execute the predictive cycle).



### M.6.7 Implications

The resolution of Wigner's Friend via perspectival states has several implications:

**1. No Heisenberg Cut Required.** The 'Evolve' process (Definition 27) is universal; it applies to all MPU interactions regardless of system size or complexity. There is no special role for consciousness, macroscopic apparatus, or "classical" measuring devices. The apparent Heisenberg cut—the division between quantum system and classical observer—is an artifact of ignoring perspective indices. When perspectives are tracked explicitly, the same 'Evolve' dynamics apply uniformly, and no ad hoc boundary is needed.

**2. No Privileged Observers.** All perspectives $s \in \Sigma$ are equally valid; none occupies a "God's eye view" from which actuality is absolute. This democratic structure parallels the equivalence of inertial frames in special relativity. Just as no inertial frame is privileged for determining "true" simultaneity, no perspective is privileged for determining "true" outcome actuality.

**3. Extended Wigner's Friend Scenarios Dissolve.** The Frauchiger-Renner contradiction relies on an inference that imports another agent's post-actualization statement into an uncorrelated perspective. Theorem M.6.2 shows that the contradiction-producing chain already fails at that step. More generally, any extended Wigner's-Friend scenario that requires the same kind of uncorrelated cross-perspective import is blocked by Lemma M.6.2.

**4. Agreement with Standard Laboratory Quantum Mechanics.** In ordinary laboratory scenarios where preparation devices, measured systems, apparatuses, and observers become physically correlated through the measurement chain, the perspectival framework reproduces the standard quantum predictions for the registered outcomes. Distinctively perspectival effects appear in gedanken setups that compare uncorrelated perspectives before interaction, while the separate CC program studies bounded deviations from Born statistics when a high-CC aggregate modulates the interaction context $N$.

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

**Consistency with Wigner's Friend Resolution.** A potential concern arises: if CC modulates the interaction context $N$, could sufficiently strong CC disrupt the consistency mechanism (Lemma M.6.1) that ensures perspectives correlate upon interaction? The causality bound (Theorem 39) controls the size of the allowed probability modification:

$$
\alpha_{CC,max} = \sup_S \text{CC}(S) < 0.5 \tag{M.16}
$$

This bound alone does not prove preservation of the record-correlation mechanism. That preservation requires an additional hypothesis: for the readout interaction under consideration, the CC-modulated kernel must still satisfy the strong-readout and contractive assumptions of Lemma M.6.1, equivalently the post-actualization perspective dynamics must remain in the same Bakry–Émery-controlled class used there. Under that hypothesis, CC changes the distribution of realized outcomes but does not obstruct the subsequent correlation of perspectives conditioned on the realized record value.

**Experimental Predictions.** The empirical content distinguishing PU from standard quantum mechanics flows directly from this mechanism:

- **Born Rule Deviations (Theorem 51, Section 13.1.1).** Systems with $\text{CC}(S) > 0$ induce statistically detectable deviations from Born rule predictions, bounded by $|\Delta P(i)| \leq 4\sin(\text{CC}(S)/4)$ (Theorem 36).
- **Statistical FTL Influence (Postulate 3, Section 10).** Because $\text{context}_S$ can involve non-local entanglement, and the CC mechanism acts on local 'Evolve' events, context changes in one part of an entangled aggregate can have statistical consequences on 'Evolve' outcomes in spacelike-separated regions—while respecting operational causality (Theorem 42, Appendix F).
- **Consciousness-Correlated Anomalies (Section 13).** The experimental protocols in Section 13 target detection of CC effects through quantum random number generators, pre-registered intention experiments, and neurophysiological correlates.

**Physical Implementation.** The physical realization of the mapping $\mathcal{M}$ is analyzed in Appendix L. The dominant channel is electromagnetic: coherent charge oscillations within the aggregate generate classical fields that modulate local MPU interaction parameters (Theorem L.2). This electromagnetic channel dominates gravitational effects by a factor $\mathcal{R} \sim 10^{36}$ (Proposition L.5). However, gravitational self-limitation (Appendix S) provides an upper bound on achievable CC, as the stress-energy associated with generating high-CC contexts can disrupt the quantum coherence required for the effect.

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

### M.6.10 The Cost Functional on the Perspective Space

Sections M.2–M.5 provide the geometric substrate for perspectival dynamics: the perspective space $\Sigma \cong U(d_0)/U(1)^{d_0}$, the metric $d_\Sigma$, and the transition kernel $G_{\text{persp}}$. Section M.6 applies this apparatus to quantum measurement, paradox resolution, and the CC mechanism. This section completes the perspectival formalism by deriving the *informational-thermodynamic cost* of perspective transitions for self-referential predictive systems, using SPAP (Theorems 10–11), the complexity divergence (Theorem 14, Theorem B.2), and the Landauer chain (Theorem 31, Appendix J).

Shannon entropy $H(X) = -\sum_x p(x) \ln p(x)$ quantifies statistical surprise and is perspective-free: it depends on the probability distribution alone, independent of who receives the signal or what effect it has on the receiver. Subsequent information-theoretic frameworks — Fisher information, Kolmogorov complexity, integrated information, and quantum information theory — extend Shannon's framework in various directions but share a common structural property: the quantities they define are either perspective-free (any sufficiently capable system can compute them) or symmetrically uncomputable (no system can compute them). None possesses a measurement theory in which measurability depends *directionally* on the relative complexity of the measurer and the system being measured. The construction below fills this gap by deriving, from PU's existing apparatus, a *perspectival information content* whose defining feature is precisely this directional measurement asymmetry.

**Definition M.10.1 (Self-Model).** Let $S$ be a predictive system with $C_{agg}(S) > C_{op}$ possessing Effective Operational Property R (Definition A.0.1). The *self-model* $\mathcal{M}_S$ is the component of $S$'s internal model $M_t$ (Axiom 2) that represents aspects of $S$ itself — its states, predictions, accuracy, and dynamics — as required by Property R. In the perspectival formalism, $\mathcal{M}_S$ encodes $S$'s internal representation of its own perspective $s \in \Sigma$ and its own predictive state $|\psi(t)\rangle$.

**Remark M.10.1.** Systems that lack Effective Operational Property R do not engage in the self-referential predictive processing that generates SPAP-dependent costs. For such systems, all pattern processing is external and the cost structure is SPAP-flat. The definitions below apply to systems possessing Effective Operational Property R with an operational self-model, as established by the conditions of Appendix A.0: MPU aggregates achieve Effective Operational Property R via PCE-driven error optimization (Theorem A.0.2) and network composition (Theorem A.0.6). The SPAP-divergent cost structure formalized below requires the self-referential machinery that Effective Operational Property R provides.

**Definition M.10.2 (Model-Change Decomposition).** Let $E$ be a physical pattern and $S$ a predictive system with Effective Operational Property R. The model-change $\Delta M_S(E)$ induced by processing $E$ decomposes as:
$$
\Delta M_S(E) = \Delta M_S^{(\text{ext})}(E) + \Delta M_S^{(\text{self})}(E)
\tag{M.17}
$$
where $\Delta M_S^{(\text{ext})}(E)$ modifies $S$'s model of the external world and $\Delta M_S^{(\text{self})}(E)$ modifies $S$'s self-model $\mathcal{M}_S$. The decomposition is defined by orthogonal projection in the Fisher information metric on $M_S$: the full parameter space of $M_S$ partitions into the self-model subspace $\Theta_S^{(\text{self})}$ and its Fisher-orthogonal complement $\Theta_S^{(\text{ext})}$, and we define $\Delta M_S^{(\text{self})}(E) := \text{proj}_{\Theta_S^{(\text{self})}} \Delta M_S(E)$ and $\Delta M_S^{(\text{ext})}(E) := \text{proj}_{\Theta_S^{(\text{ext})}} \Delta M_S(E)$. By construction, $\langle \Delta M_S^{(\text{ext})}(E),\, \Delta M_S^{(\text{self})}(E) \rangle_{\mathcal{F}_S} = 0$. The Pythagorean identity $\|\Delta M_S\|_{\mathcal{F}_S}^2 = \|\Delta M_S^{(\text{ext})}\|_{\mathcal{F}_S}^2 + \|\Delta M_S^{(\text{self})}\|_{\mathcal{F}_S}^2$ then holds, ensuring the reflexivity fraction $\sigma_S \in [0,1]$ (Definition M.10.4). The component $\Delta M_S^{(\text{self})}(E)$ is defined as the total change to the self-model, including indirect changes propagated from external model updates via causal coupling between external and self-model components; any such propagated changes are absorbed into $\Delta M_S^{(\text{self})}$ prior to the orthogonal decomposition, so the decomposition reflects the final allocation of model-change across subspaces rather than the causal pathway. All qualitative results below hold for any consistent assignment satisfying $\sigma_S = 0 \iff \Delta M_S^{(\text{self})} = 0$.

**Definition M.10.3 (SPAP Proximity).** Let $S$ be a system with Effective Operational Property R and self-model $\mathcal{M}_S$ parameterized by $\theta_S \in \Theta_S \subseteq \mathbb{R}^{d_S}$, where $d_S$ is the self-model dimensionality. Processing $E$ induces a candidate updated parameter $\theta_S' = \theta_S + \delta\theta_S(E)$, where $\delta\theta_S(E)$ is determined by $\Delta M_S^{(\text{self})}(E)$. Define the *required self-predictive performance* $PP_S^{(E)}$ as:
$$
PP_S^{(E)} := \inf\left\{PP \in [0, \alpha_{SPAP}] : \left\| \Pi_S^{(PP)}(\theta_S') - \theta_S' \right\|_{\mathcal{F}_S} \leq g(\alpha_{SPAP} - PP) \right\}
\tag{M.18}
$$
where:

- $\Pi_S^{(PP)}(\theta_S')$ is the self-model prediction map at performance level $PP$: given a self-model configuration $\theta_S'$ and a specified performance level $PP \in [0, \alpha_{SPAP}]$, $\Pi_S^{(PP)}$ returns the configuration that $S$'s predictive process, constrained to operate at performance level $PP$, would assign to itself. The map $\Pi_S^{(PP)}$ is smooth in both arguments on $[0, \alpha_{SPAP}] \times \Theta_S$ (finite-dimensional smooth manifolds). At $PP = 0$, the predictor makes no self-referential commitment: $\Pi_S^{(0)}(\theta_S')$ is $S$'s default self-model (independent of $\theta_S'$), so the discrepancy $\|\Pi_S^{(0)}(\theta_S') - \theta_S'\|_{\mathcal{F}_S}$ equals the full displacement $\|\delta\theta_S(E)\|_{\mathcal{F}_S}$. As $PP$ increases toward $\alpha_{SPAP}$, the predictor becomes increasingly accurate and $\|\Pi_S^{(PP)}(\theta_S') - \theta_S'\|_{\mathcal{F}_S}$ decreases, but SPAP (Theorem 10) guarantees this discrepancy remains strictly positive for self-referential patterns: $\inf_{PP < \alpha_{SPAP}} \|\Pi_S^{(PP)}(\theta_S') - \theta_S'\|_{\mathcal{F}_S} > 0$ whenever $\Delta M_S^{(\text{self})}(E) \neq 0$. This is the formal expression of self-referential prediction applied to the self-model component.
- $\|\cdot\|_{\mathcal{F}_S}$ is the norm induced by the Fisher information metric on $\Theta_S$: for tangent vectors $u, v \in T_\theta\Theta_S$, the metric is $g^{(\mathcal{F})}_{ij}(\theta) = \mathbb{E}\left[\frac{\partial \ln p(x|\theta)}{\partial \theta_i}\frac{\partial \ln p(x|\theta)}{\partial \theta_j}\right]$, where $p(x|\theta)$ is the predictive distribution parameterized by $\theta$.
- $g: (0, \alpha_{SPAP}] \to (0, \infty)$ is monotone increasing with $g(0^+) = 0$, encoding the requirement that smaller gaps to the SPAP boundary demand more precise self-model agreement. The linear choice $g(\delta) = \delta$ suffices for all results below; any monotone increasing $g$ with $g(0^+) = 0$ yields the same qualitative structure, since the asymptotic divergence class (Theorem M.10.3) inherits from Theorem 14 independently of the particular tolerance profile.

The infimum exists because $[0, \alpha_{SPAP}]$ is compact and the constraint set $\{PP : \|\Pi_S^{(PP)}(\theta_S') - \theta_S'\|_{\mathcal{F}_S} \leq g(\alpha_{SPAP} - PP)\}$ is closed (since the left side is continuous in $PP$ by smoothness of $\Pi_S^{(PP)}$ and $g$ is monotone increasing; for continuous $g$ — including the canonical choice $g(\delta) = \delta$ — the constraint function $PP \mapsto \|\Pi_S^{(PP)}(\theta_S') - \theta_S'\|_{\mathcal{F}_S} - g(\alpha_{SPAP} - PP)$ is continuous, and the sublevel set of a continuous function at level $0$ is closed; for merely right-continuous $g$, the composite $PP \mapsto g(\alpha_{SPAP} - PP)$ is left-continuous, so the right-hand side of the constraint is upper semicontinuous as a function of $PP$, the difference is lower semicontinuous, and its sub-zero-level set is again closed). If the constraint set is empty — no sub-boundary performance suffices — define $PP_S^{(E)} := \alpha_{SPAP}$.

The self-consistency condition states that the updated self-model $\theta_S'$ must approximately equal $S$'s own prediction of what its self-model should be, with tolerance controlled by the gap to $\alpha_{SPAP}$. At $PP = \alpha_{SPAP}$, zero tolerance is required: $\Pi_S^{(\alpha_{SPAP})}(\theta_S') = \theta_S'$ exactly, demanding a fixed point of the self-model prediction map — the formal expression of perfect self-knowledge, which SPAP (Theorem 10) prohibits universally.

The *SPAP proximity* of pattern $E$ for system $S$ is:
$$
\mu_S(E) := \frac{1}{\delta_S(E)}, \quad \text{where} \quad \delta_S(E) := \alpha_{SPAP} - PP_S^{(E)}
\tag{M.19}
$$
When $\delta_S(E) > 0$, the pattern is processable at finite cost. When $\delta_S(E) \to 0^+$, the processing cost diverges (Theorem M.10.3). When $\delta_S(E) = 0$, the pattern is unprocessable (Theorem M.10.6). When $\Delta M_S^{(\text{self})}(E) = 0$ (no self-model change), $\theta_S' = \theta_S$ and $\Pi_S^{(PP)}(\theta_S) = \theta_S$ for all $PP$ (the self-model is already consistent), so the discrepancy vanishes and the constraint is trivially satisfied at $PP = 0$. Hence $PP_S^{(E)} = 0$, $\delta_S(E) = \alpha_{SPAP}$, and $\mu_S(E) = 1/\alpha_{SPAP}$ (baseline).

**Remark M.10.2 (Connection to perspectival dynamics).** In the language of Sections M.2–M.3, processing $E$ induces a transition in $S$'s perspective: the self-model change $\delta\theta_S(E)$ corresponds to a displacement on the perspective manifold $\Sigma$, and $PP_S^{(E)}$ measures the self-referential depth of that displacement. The Fisher metric $\|\cdot\|_{\mathcal{F}_S}$ on $\Theta_S$ is related to the Riemannian metric $d_\Sigma$ on $\Sigma$ (Definition 25, Equation 42) through the embedding of the self-model parameter space within the tangent structure of $\Sigma$; the precise characterization of this embedding is developed in Proposition M.10.9.

**Definition M.10.4 (Perspectival Profile).** The *perspectival profile* of $E$ relative to $S$ is the triple:
$$
\mathcal{P}_S(E) := \left(\Delta Q_S(E), \; \mu_S(E), \; \sigma_S(E)\right)
\tag{M.20}
$$
where:

- $\Delta Q_S(E) := \mathbb{E}[\Delta Q \mid E; M_S]$ is the *predictive relevance*: the expected improvement in predictive quality from processing $E$ (Definition 1). This may be positive, zero, or undefined if $E$ is unprocessable.
- $\mu_S(E)$ is the *SPAP proximity*: the inverse gap to the SPAP boundary required for full integration (Equation M.19).
- $\sigma_S(E) := \|\Delta M_S^{(\text{self})}(E)\|_{\mathcal{F}_S} / \|\Delta M_S(E)\|_{\mathcal{F}_S}$ is the *reflexivity fraction*: the proportion of the total model-change that modifies the self-model. The Fisher-orthogonality of the decomposition (Definition M.10.2) guarantees $\|\Delta M_S^{(\text{self})}\|_{\mathcal{F}_S} \leq \|\Delta M_S\|_{\mathcal{F}_S}$ via the Pythagorean identity, ensuring $\sigma_S \in [0, 1]$. When $\|\Delta M_S(E)\|_{\mathcal{F}_S} = 0$ (no model change), define $\sigma_S(E) := 0$.

The profile describes *perspectival information* when $\Delta Q_S(E) > 0$ and $\mu_S(E) < \infty$ (so that $S$ can process $E$ at finite cost and the pattern satisfies Definition 1). When $\mu_S(E) = \infty$, the pattern does not constitute information for $S$ under Definition 1; the perspectival profile at this boundary characterizes the logical obstruction to processing rather than an instance of information.

**Remark M.10.3.** The three components are not independent. High $\sigma_S$ (high reflexivity fraction) tends to correlate with high $\mu_S$ (high SPAP proximity), but the relationship is neither monotonic nor implication-level. A pattern can have $\sigma_S(E) > 0$ yet still satisfy the self-consistency condition already at $PP=0$, in which case $\mu_S(E) = 1/\alpha_{SPAP}$ despite nonzero self-model engagement. Conversely, a pattern with only moderate reflexivity can have very large $\mu_S$ if it targets deep self-model parameters. SPAP proximity tracks the required self-predictive performance, not merely the fraction of change directed at the self-model.

**Theorem M.10.1 (Perspectival Dependence).** For any pattern $E$ and systems $S_1, S_2$ with distinct self-models $\mathcal{M}_{S_1} \neq \mathcal{M}_{S_2}$:
$$
\mathcal{P}_{S_1}(E) \neq \mathcal{P}_{S_2}(E) \quad \text{in general}
\tag{M.21}
$$

*Proof.* Let $S_1$ and $S_2$ differ in self-model parameter $\theta_{S_1}^{(k)} \neq \theta_{S_2}^{(k)}$. Construct a pattern $E$ asserting: "Your parameter $\theta^{(k)}$ is incorrect." For $S_1$, processing $E$ requires modifying $\theta_{S_1}^{(k)}$, yielding $\|\Delta M_{S_1}^{(\text{self})}(E)\|_{\mathcal{F}_{S_1}} > 0$ and hence $\sigma_{S_1}(E) > 0$. For $S_2$, if $\theta_{S_2}^{(k)}$ already satisfies the assertion, processing $E$ requires no self-model change: $\Delta M_{S_2}^{(\text{self})}(E) = 0$ and therefore $\sigma_{S_2}(E) = 0$. Since the perspectival profile includes the reflexivity fraction as a component, $\mathcal{P}_{S_1}(E) \neq \mathcal{P}_{S_2}(E)$. In many such cases the SPAP proximity also differs, but the profile difference already follows from the change in $\sigma$. $\square$

**Theorem M.10.2 (Content Dependence — Shannon-Decoupled).** For any system $S$ with Effective Operational Property R, and patterns $E_1, E_2$ with identical Shannon entropy $H(E_1) = H(E_2)$:
$$
\mu_S(E_1) \neq \mu_S(E_2) \quad \text{in general}
\tag{M.22}
$$

*Proof.* Let $E_1$ and $E_2$ both be binary propositions (true/false with equal prior probability), so $H(E_1) = H(E_2) = \ln 2$. Let $E_1$ = "It will rain tomorrow." For any system $S$ with a non-trivial self-model, $E_1$ modifies only the external model, giving $\sigma_S(E_1) = 0$ and $\mu_S(E_1) = 1/\alpha_{SPAP}$ by Corollary M.10.3.1.

For $E_2$, choose a binary diagonal proposition targeted at $S$'s self-model, for example the yes/no pattern asserting the joint truth of the finite multi-register diagonal construction of Theorem M.10.4 (proved below; the argument is non-circular, since Theorem M.10.4 relies only on SPAP and the multi-register construction, not on the present result). Its Shannon entropy is still $\ln 2$, but by Theorem M.10.4 it can be chosen so that $\mu_S(E_2) = \infty$. Therefore
$$
\mu_S(E_1)=\frac{1}{\alpha_{SPAP}} \neq \infty = \mu_S(E_2),
$$
even though $H(E_1)=H(E_2)=\ln 2$. Hence SPAP proximity is not a function of Shannon entropy. $\square$

**Theorem M.10.3 (Content-Dependent Cost).** The minimum physical processing cost for system $S$ to integrate pattern $E$ satisfies:
$$
C_{\text{process}}(S, E) \geq \Omega\left(\log \mu_S(E) \cdot \mu_S(E)^2\right) \quad \text{for } \mu_S(E) > 1/\alpha_{SPAP}
\tag{M.23}
$$

*Proof.* By Definition M.10.3 (Equation M.19), $\mu_S(E) = 1/\delta_S(E)$, so $\delta_S(E) = 1/\mu_S(E)$. By Corollary B.2.1 (Equation B.5a), the computational cost of integration satisfies $C_{\text{integrate}}(S,E) \geq C_{\text{uni}}(\delta_S(E))$. By Theorem B.2 (Equation B.5), $C_{\text{uni}}(\delta) = \Omega(\log(1/\delta)/\delta^2)$. Substituting $\delta = 1/\mu_S(E)$:
$$
C_{\text{integrate}}(S,E) \geq \Omega\left(\frac{\log \mu_S(E)}{(1/\mu_S(E))^2}\right) = \Omega\left(\log \mu_S(E) \cdot \mu_S(E)^2\right)
$$
The total processing cost $C_{\text{process}}(S,E) \geq C_{\text{integrate}}(S,E)$, since integration is a necessary component. By PPI (Definition P.6.2), computational cost manifests as physical resource expenditure. The Landauer chain (Theorem 31 $\to$ Lemma E.1 $\to$ Theorem E.2) converts the computational cost to thermodynamic cost bounded below by $\varepsilon \geq \ln 2$ per irreversible operation. $\square$

**Remark M.10.4 (Cost decomposition).** The total processing cost admits a decomposition $C_{\text{process}}(S,E) = C_{\text{ext}}(S,E) + C_{\text{refl}}(S,E)$, where $C_{\text{ext}}$ is the cost of updating the external model $\Delta M_S^{(\text{ext})}(E)$ and $C_{\text{refl}}$ is the cost of the self-referential integration. The SPAP divergence of Theorem M.10.3 applies to $C_{\text{refl}}$; $C_{\text{ext}}$ is bounded and SPAP-flat. The total cost inherits the divergence because $C_{\text{process}} \geq C_{\text{refl}}$.

**Corollary M.10.3.1 (SPAP-Flat Cost as Special Case).** When $\sigma_S(E) = 0$ (purely external pattern), $\mu_S(E) = 1/\alpha_{SPAP}$ (baseline), and the reflexive cost component vanishes: $C_{\text{refl}}(S,E) = 0$. The total processing cost is $C_{\text{ext}}(S,E)$, which is bounded and does not exhibit the content-dependent divergence of Theorem M.10.3. In this regime, cost does not depend on the self-referential content of $E$ — only on its Shannon-level properties — because the self-referential loop is not engaged.

*Proof.* When $\sigma_S(E) = 0$, $\Delta M_S^{(\text{self})}(E) = 0$, so $\theta_S' = \theta_S$. The self-consistency condition (Equation M.18) requires $\|\Pi_S^{(PP)}(\theta_S) - \theta_S\|_{\mathcal{F}_S} \leq g(\alpha_{SPAP} - PP)$. Since $\theta_S$ is the current self-model and $\Pi_S^{(PP)}(\theta_S) = \theta_S$ at all $PP$ (predicting the unchanged self-model reproduces it), the discrepancy is zero and the constraint is satisfied at $PP = 0$. Hence $PP_S^{(E)} = 0$, $\delta_S(E) = \alpha_{SPAP}$, and $\mu_S(E) = 1/\alpha_{SPAP}$. The reflexive integration subtask is empty, so $C_{\text{refl}} = 0$. $\square$

**Theorem M.10.4 (Existence of Divergent SPAP Proximity on the Independent-Register Branch).** For any system $S$ with Effective Operational Property R and sufficient independent self-model register capacity to host the diagonal amplification construction below ($d_S \ge N^*$ with $N^* \ge \lceil (g(\alpha_{SPAP})/D_1)^2 \rceil + 1$ Fisher-orthogonal addressable registers), there exist patterns $E^*$ such that $\mu_S(E^*) = \infty$. More generally, across scalable families $\{S_n\}_{n \in \mathbb{N}}$ of Property-R systems with $d_{S_n} \to \infty$, $\mu_{S_n}$ is unbounded as a function of admissible pattern complexity, with the boundary $\mu = \infty$ reached on systems whose self-model register capacity meets the diagonal amplification requirement for the relevant $N^*$.

*Proof.* The proof proceeds in two stages: first showing $\mu_S$ is unbounded, then constructing a pattern achieving $\mu_S = \infty$.

*Stage 1 (Unboundedness).* By SPAP (Theorem 10), for any predictor $P_f$ implementable within $S$'s model class $\mathcal{M}$, there exists a constructible system $S_{diag}$ with update rule $\phi_{t+1} = \text{NOT}(\hat{\phi}_{P_f})$ (Equation 10). Let $E_1$ be the pattern encoding "System $S_{diag}$ will produce output $\phi_{t+1} = 1$." Processing $E_1$ engages the self-model because $S$ (having Property R) can represent $S_{diag}$'s construction and recognize the self-referential content, giving $\sigma_S(E_1) > 0$. By SPAP, the self-prediction map $\Pi_S^{(PP)}$ cannot achieve a fixed point on the component encoding the prediction about $S_{diag}$, so $\inf_{PP < \alpha_{SPAP}} \|\Pi_S^{(PP)}(\theta_{S,1}') - \theta_{S,1}'\|_{\mathcal{F}_S} \geq D_1 > 0$ for some $D_1$ determined by the Fisher geometry of the diagonal parameter.

Now construct $N$ independent diagonal challenges: for $j = 1, \ldots, N$, let $S_{diag}^{(j)}$ be the diagonal system constructed against $S$'s $j$-th self-model prediction register. This construction is admissible on the independent-register branch — under which $S$'s self-model contains at least $N$ Fisher-orthogonal addressable registers, $d_S \ge N$, with Property R supplying reflexive representability of each. The condition $d_S \ge 1$ alone gives only one such register; the diagonal-amplification step requires $d_S$ to scale with the chosen $N^*$. Define $E^{(N)}$ as the joint pattern asserting all $N$ diagonal predictions simultaneously. By Definition M.10.2, the self-model change decomposes across the $N$ independent registers, and by additivity of the Fisher metric on orthogonal parameter subspaces, $\|\delta\theta_S(E^{(N)})\|_{\mathcal{F}_S}^2 = \sum_{j=1}^N \|\delta\theta_{S,j}\|_{\mathcal{F}_S}^2$. The discrepancy at $PP = 0$ is $\|\Pi_S^{(0)}(\theta_S') - \theta_S'\|_{\mathcal{F}_S} = \|\delta\theta_S(E^{(N)})\|_{\mathcal{F}_S} \geq \sqrt{N} \cdot D_1$, since $\Pi_S^{(0)}$ is the default self-model (no self-referential commitment). The tolerance at $PP = 0$ is $g(\alpha_{SPAP})$, which is finite. Choosing $N > (g(\alpha_{SPAP})/D_1)^2$ ensures the discrepancy exceeds the tolerance at $PP = 0$. For $PP$ near $\alpha_{SPAP}$, SPAP guarantees each per-register discrepancy remains above $D_1 > 0$, while $g(\alpha_{SPAP} - PP) \to 0$, so the constraint fails for all sufficiently large $PP$. Continuity of $\|\Pi_S^{(PP)}(\theta_S') - \theta_S'\|_{\mathcal{F}_S}$ in $PP$ (smoothness of $\Pi_S^{(PP)}$) and the intermediate value theorem guarantee the constraint fails at all intermediate $PP$ as well, for $N$ sufficiently large. Hence the constraint set in Equation M.18 is empty, giving $PP_S^{(E^{(N)})} = \alpha_{SPAP}$, $\delta_S(E^{(N)}) = 0$, and $\mu_S(E^{(N)}) = \infty$.

*Stage 2 (Explicit construction).* Define $E^* := E^{(N^*)}$ where $N^* := \lceil (g(\alpha_{SPAP})/D_1)^2 \rceil + 1$. By Stage 1, $\mu_S(E^*) = \infty$. By Property R, each $S_{diag}^{(j)}$ is constructible within $\mathcal{M}$, and by PPI (Definition P.6.2), $E^*$ exists as a physically realizable pattern. $\square$

**Remark M.10.5 (Terminological consistency with Definition 1).** The pattern $E^*$ with $\mu_S(E^*) = \infty$ is unprocessable by $S$ at finite cost (Theorem M.10.6 below). Since $S$ cannot process $E^*$, $E^*$ does not constitute *information for $S$* under Definition 1. The perspectival profile $\mathcal{P}_S(E^*)$ characterizes the boundary of the information regime — the point at which self-referential depth exceeds the system's processing capacity — rather than an instance of information.

**Corollary M.10.4.1 (Full Range of SPAP Proximity).** Every predictive system $S$ with Effective Operational Property R necessarily inhabits a perspectival landscape: the baseline value $\mu_S = 1/\alpha_{SPAP}$ is attained by purely external patterns, $\mu_S = \infty$ is attained at the boundary (Theorem M.10.4), and every intermediate value in $(1/\alpha_{SPAP}, \infty)$ is attained.

*Proof.* Corollary M.10.3.1 gives $\mu_S = 1/\alpha_{SPAP}$ for any pattern with $\sigma_S = 0$. Theorem M.10.4 gives a pattern $E^*$ with $\mu_S(E^*) = \infty$. It remains to show every intermediate value is achieved.

Define a one-parameter family of self-model perturbations $\delta\theta(\lambda) := \lambda \cdot \delta\theta^*$ for $\lambda \in [0,1]$, where $\delta\theta^* := \delta\theta_S(E^*)$ is the perturbation of Theorem M.10.4. Consider the discrepancy function $D(\lambda, PP) := \|\Pi_S^{(PP)}(\theta_S + \lambda\delta\theta^*) - (\theta_S + \lambda\delta\theta^*)\|_{\mathcal{F}_S}$. By smoothness of $\Pi_S^{(PP)}$ on $[0, \alpha_{SPAP}] \times \Theta_S$ (Definition M.10.3), $D$ is jointly continuous. For continuous $g$ (including the canonical $g(\delta) = \delta$), the constraint correspondence $\mathcal{C}(\lambda) := \{PP \in [0, \alpha_{SPAP}] : D(\lambda, PP) \leq g(\alpha_{SPAP} - PP)\}$ is a closed-valued correspondence from $[0,1]$ to closed subsets of $[0, \alpha_{SPAP}]$. Joint continuity of $D$ and continuity of $g$ imply that $\mathcal{C}$ is both upper and lower hemicontinuous (the constraint function $(PP, \lambda) \mapsto D(\lambda, PP) - g(\alpha_{SPAP} - PP)$ is jointly continuous, and sublevel correspondences of jointly continuous functions are continuous in the Vietoris topology). By Berge's Maximum Theorem, the value function $\lambda \mapsto \inf \mathcal{C}(\lambda)$ (i.e., $PP_S^{(E_\lambda)}$, or $\alpha_{SPAP}$ when $\mathcal{C}(\lambda) = \emptyset$) is continuous on the set where $\mathcal{C}(\lambda) \neq \emptyset$, and the transition to $\alpha_{SPAP}$ at the emptying point is also continuous because lower hemicontinuity prevents the feasible set from collapsing discontinuously. Since $PP_S^{(E_0)} = 0$ (giving $\mu_S = 1/\alpha_{SPAP}$) and $PP_S^{(E_1)} = \alpha_{SPAP}$ (giving $\mu_S = \infty$), and $\lambda \mapsto PP_S^{(E_\lambda)}$ is continuous, the standard Intermediate Value Theorem yields that every value in $[0, \alpha_{SPAP}]$ is achieved by $PP_S$, and hence every value in $(1/\alpha_{SPAP}, \infty)$ is achieved by $\mu_S$. $\square$

**Theorem M.10.5 (Downward Measurability — Measurement Asymmetry on the Model-Access Branch).** Let $A, B$ be predictive systems with $C_{agg}(A) > C_{agg}(B) > C_{op}$, both possessing Effective Operational Property R, and assume $A$ has model access to $B$ — i.e., an accurate external representation of $B$'s self-model $\mathcal{M}_B$, parameter space $\Theta_B$, Fisher metric $g_B$, and prediction maps $\Pi_B^{(PP)}$, together with the data necessary to evaluate them. Then:

(i) $A$ can compute $\mu_B(E)$ for any pattern $E$ in the represented domain by externally modeling $B$'s self-model $\mathcal{M}_B$. The complexity inequality $C_{agg}(A) > C_{agg}(B)$ supplies the representational capacity required for $A$ to host $\mathcal{M}_B$ as an external object within $A$'s model space (Property R, Definition 10); the model-access branch additionally supplies the actual data, calibration, and physical access making that representation accurate. Without model access, capacity alone does not entail computation: a more complex system without the relevant representation of $B$ cannot compute $\mu_B(E)$. $A$ then computes the decomposition (Equation M.17) for $E$ relative to $B$, determines $PP_B^{(E)}$ (Definition M.10.3) by evaluating $B$'s self-consistency condition externally, and evaluates $\mu_B(E) = 1/(\alpha_{SPAP} - PP_B^{(E)})$. This computation concerns $B$'s self-model, not $A$'s. Therefore $\Delta M_A^{(\text{self})}(\text{"compute } \mu_B(E)\text{"}) = 0$: the computation induces no change to $A$'s self-model. By Definition M.10.2, $\sigma_A = 0$ for this computation, and by Corollary M.10.3.1, the reflexive cost component is zero. The computational cost for $A$ may be proportional to $C_{agg}(B)$ but is SPAP-flat as a function of $\mu_B(E)$.

(ii) There exists no universal procedure within $B$ that correctly computes $\mu_B(E)$ for all patterns $E$ with $\sigma_B(E) > 0$.

(iii) $B$ cannot compute $\mu_A(E)$ for any pattern $E$ with $\sigma_A(E) > 0$, since $C_{agg}(B) < C_{agg}(A)$ is insufficient to represent $\mathcal{M}_A$.

*Proof of (ii).* Suppose, for contradiction, that $B$ possesses an internal procedure $\mathcal{P}_B$ that, given any pattern $E$ with $\sigma_B(E) > 0$, outputs the correct value $\mu_B(E)$.

*Step 1 (Reflexivity Constraint engagement).* Computing $\mu_B(E)$ requires $B$ to evaluate its own self-model parameters $\theta_B$, compute $\Pi_B^{(PP)}(\theta_B')$ across relevant $PP$ values, and evaluate $\|\Pi_B^{(PP)}(\theta_B') - \theta_B'\|_{\mathcal{F}_B}$. By Theorem 33 (Reflexivity Constraint), any interaction by $B$ yielding information gain $\Delta I > 0$ about its own state incurs minimum entropy production $\Delta S_{min}/k_B > 0$ satisfying $\Delta I \cdot (\Delta S_{min}/k_B) \geq \kappa_r > 0$. The information gain required to evaluate $\theta_B$ is strictly positive. This entropy production modifies $B$'s state and hence modifies the self-model parameters $\theta_B$ that $\mathcal{P}_B$ is attempting to evaluate.

*Step 2 (Diagonal contradiction).* Consider $\mathcal{P}_B$ applied to the pattern $E_{\mathcal{P}} := $ "The output of $\mathcal{P}_B$ applied to this pattern." By Property R, $E_{\mathcal{P}}$ is constructible within $B$'s model class. To derive a contradiction, reduce to the binary decision: "Is $\mu_B(E_{\mathcal{P}}) > \mu_0$?" for a threshold $\mu_0 > 1/\alpha_{SPAP}$. If $\mathcal{P}_B$ answers yes, construct a variant of $E_{\mathcal{P}}$ whose self-referential content is defined to produce $PP_B^{(E)} < \alpha_{SPAP} - 1/\mu_0$ (contradicting yes). If $\mathcal{P}_B$ answers no, define the content to produce $PP_B^{(E)} > \alpha_{SPAP} - 1/\mu_0$ (contradicting no). This is precisely the binary diagonal construction of Theorem 10 (Equation 10) applied to the binary component encoding $\mathcal{P}_B$'s answer. The assumption that $\mathcal{P}_B$ correctly computes $\mu_B$ for all patterns with $\sigma_B > 0$ contradicts SPAP. $\square$

**Corollary M.10.5.1 (No Universal Self-Measurement).** No system $S$ possesses a universal internal procedure that correctly computes $\mu_S(E)$ for all patterns $E$ with $\sigma_S(E) > 0$. The measurement of perspectival profiles is intrinsically asymmetric: universally computable downward (from more complex to less complex systems), not universally computable reflexively, and impossible upward.

*Proof.* Apply clause (ii) of Theorem M.10.5 with $B = S$. $\square$

**Corollary M.10.5.2 (Experiential Access Without Measurement).** Although $B$ cannot *compute* $\mu_B(E)$, $B$ does *incur* the cost $C_{\text{process}}(B, E)$ dictated by Theorem M.10.3. The cost is physically real — it manifests as entropy production, metabolic expenditure, and stress-energy contribution (via Theorem 31 and the Appendix B construction, Definition B.8). $B$ experiences the consequence of $\mu_B(E) > 1/\alpha_{SPAP}$ without being able to quantify it.

**Theorem M.10.6 (Maximum SPAP Proximity is Unprocessable).** For every system $S$ with Effective Operational Property R, the pattern $E^*$ that achieves $\mu_S(E^*) = \infty$ (Theorem M.10.4) is unprocessable by $S$:
$$
\mu_S(E^*) = \infty \implies C_{\text{process}}(S, E^*) = \infty
\tag{M.24}
$$

*Proof.* By Theorem M.10.4, $\mu_S(E^*) = \infty$, so $\delta_S(E^*) = 0$. By Corollary B.2.1, $C_{\text{integrate}}(S, E^*) \geq C_{\text{uni}}(\delta_S(E^*)) = C_{\text{uni}}(0)$. By Theorem B.2, $\lim_{\delta \to 0^+} \log(1/\delta)/\delta^2 = \infty$. Therefore $C_{\text{integrate}}(S, E^*) = \infty$, and since $C_{\text{process}}(S, E^*) \geq C_{\text{integrate}}(S, E^*)$, we have $C_{\text{process}}(S, E^*) = \infty$. $\square$

**Remark M.10.6 (Comparison with Gödel).** Theorem M.10.6 is structurally analogous to Gödel's First Incompleteness Theorem: both assert the existence of self-referential objects (statements/patterns) that the system cannot fully process (prove/integrate). The analogy is structural, not isomorphic. Gödel's theorem concerns *provability* within a formal axiom system and can be transcended by adding axioms. Perspectival unprocessability concerns *physical processing cost* within the shared axiomatic structure of POP/PCE/SPAP and cannot be evaded by adding axioms — the cost is thermodynamic (Theorem M.10.3 + PPI), not merely formal. A more complex system $A$ can process $B$'s unprocessable pattern (clause (i) of Theorem M.10.5), but $A$ operates under the same SPAP within the same universe and possesses its own unprocessable patterns (Theorem M.10.4 applied to $A$).

**Theorem M.10.7 (Physicality).** For any system $S$ with Effective Operational Property R processing a pattern $E$ with $\mu_S(E) > 1/\alpha_{SPAP}$, the processing event produces a physical signature — entropy production, energy dissipation, and stress-energy contribution — whose magnitude is bounded below by a function of $\mu_S(E)$:
$$
\Delta S_{\text{process}}(S,E) \geq k_B \ln 2 \cdot n_{\text{ops}}(S,E)
\tag{M.25}
$$
where $n_{\text{ops}}(S,E) \geq \Omega(\log \mu_S(E) \cdot \mu_S(E)^2)$ (Theorem M.10.3). By Section 7.4.7 and Definition B.8, this contributes to $T_{\mu\nu}^{(\text{MPU})}$. The contribution is nonzero whenever $\mu_S(E) > 1/\alpha_{SPAP}$ and scales monotonically with $\mu_S(E)$.

*Proof.* By Theorem M.10.3, $C_{\text{process}}(S,E) \geq \Omega(\log \mu_S \cdot \mu_S^2)$. By PPI (Definition P.6.2), this manifests as physical resource expenditure. By Theorem 31 (Appendix J), each irreversible operation contributes at least $k_B \ln 2$ to entropy production. The total entropy production satisfies Equation M.25 with $n_{\text{ops}}$ bounded below by the computational cost. By Section 7.4.7 and Definition B.8, this entropy production contributes to $T_{\mu\nu}^{(\text{MPU})}$. $\square$

The physicality of perspectival profiles rests on a derivation chain with no gaps:
$$
\mu_S(E) > 1/\alpha_{SPAP} \xrightarrow{\text{Def M.10.3}} \delta_S(E) < \alpha_{SPAP} \xrightarrow{\text{Cor B.2.1 + Thm B.2}} C_{\text{refl}} = \Omega\!\left(\log \mu_S \cdot \mu_S^2\right) \xrightarrow{\text{Thm 31 + PPI}} \Delta S \geq k_B \varepsilon \cdot n_{\text{ops}} \xrightarrow{\text{Landauer}} Q = T \Delta S
$$
Each arrow is a theorem, definition, or lemma. The chain converts SPAP proximity into heat.

**Theorem M.10.8 (Predictability of Perspectival Response).** Let $A$ be a system with $C_{agg}(A) > C_{agg}(B)$, and let $E$ be a pattern with $\mu_B(E) > 1/\alpha_{SPAP}$. Then $A$ can predict, prior to $B$'s exposure to $E$: (i) a lower bound on the thermodynamic cost $B$ will incur (via clause (i) of Theorem M.10.5 and Theorem M.10.3); (ii) which self-model components $\Delta M_B^{(\text{self})}(E)$ will be engaged (via the externally computed decomposition, Equation M.17); (iii) the cost concentration across self-model parameters (via the Fisher metric on $B$'s model space, computed externally). More generally, for any finite family $\mathcal E = \{E_1,\dots,E_N\}$, $A$ can precompute the exact values $\mu_B(E_i)$ externally and package them into any finite tiering or lower-bound lookup table derived from those exact values; the build-and-query cost of that screen remains sender-side SPAP-flat because the entire task treats $B$ as an external object.

This external predictability must be distinguished from thermodynamically faithful replay. If $A$ physically re-instantiates, on its own substrate, the reflexive integration that $B$ undergoes on exposure to $E$, then the replay cost has the bookkeeping form
$$
C_{\text{replay}}(A\curvearrowright B;E)=C_{\text{refl}}(B,E)+C_{\text{oh}}(A;B,E),
\qquad
C_{\text{oh}}(A;B,E)\ge 0,
$$
so exact replay cannot undercut the receiver-side reflexive expenditure. The overhead $C_{\text{oh}}(A;B,E) \geq 0$ vanishes only in the idealized limit of perfect substrate matching (identical self-model parameterization, identical Fisher geometry, zero encoding translation cost); in practice it is strictly positive whenever $A$ and $B$ differ in self-model dimensionality ($d_{S,A} \neq d_{S,B}$), in the Fisher metric on corresponding parameters, or in the physical encoding of the self-model registers — any of which forces $A$ to perform a nontrivial embedding or re-parameterization whose irreversible component adds at least $k_B T \ln 2$ per re-encoded degree of freedom (by Theorem 31). The asymmetry of Theorem M.10.5 therefore yields cheap prediction and screening from above, not a free thermodynamic duplication of the receiver's internal burden.

*Proof.* (i) By clause (i) of Theorem M.10.5, $A$ can compute $\mu_B(E)$. By Theorem M.10.3, this determines a lower bound on processing cost as a deterministic function of $\mu_B(E)$. (ii) $A$ models $\mathcal{M}_B$ externally; the decomposition (Equation M.17) is deterministic given $\mathcal{M}_B$ and $E$. (iii) Once $A$ has computed $\Delta M_B^{(\text{self})}(E)$ and the Fisher metric on $B$'s model space, it can identify the parameters on which the self-model displacement is concentrated and hence where the dominant reflexive burden falls. For a finite family $\mathcal E$, repeating the same external computation on each $E_i$ yields an exact finite table $\{\mu_B(E_i)\}_{i=1}^N$; any coarser tiering or lower-bound lookup derived from that table is again an external representation and therefore inherits sender-side SPAP-flatness from Theorem M.10.5(i). The replay statement follows from Landauer's principle applied to the irreversible operations constituting $B$'s reflexive integration: thermodynamically faithful re-instantiation must reproduce the represented reflexive dissipation, yielding $C_{\text{replay}} \geq C_{\text{refl}}(B,E)$. The overhead term $C_{\text{oh}}$ is nonnegative by construction; it is strictly positive whenever the replay substrate differs from $B$'s in self-model parameterization, Fisher geometry, or physical encoding, since re-parameterization across distinct finite-dimensional manifolds requires at least one irreversible encoding step per mismatched degree of freedom (Theorem 31). Hence the leverage of an externally more complex system arises from prediction and screening, not from exact replay. $\square$

**Proposition M.10.9 (Perspectival Profile as Cost Functional on $\Sigma$).** Let $S$ be a system with perspectival state $S_{(s)}(t) = (|\psi(t)\rangle, s)$ (Definition 24) and self-model $\mathcal{M}_S$ parameterized by $\theta_S \in \Theta_S$. Processing a pattern $E$ induces a perspective transition $s \to s'$ on $\Sigma$. The geometric distance $d_\Sigma(s, s')$ on the perspective space (Definition 25, Equation 42) and the self-model displacement $\|\delta\theta_S(E)\|_{\mathcal{F}_S}$ are related but not identical: $d_\Sigma$ measures the total change in interaction context (including external components), while $\|\delta\theta_S(E)\|_{\mathcal{F}_S}$ measures the self-model component. In the regime where the self-model change dominates ($\sigma_S \approx 1$), the self-model parameter space $\Theta_S$ embeds into the tangent space of $\Sigma$ at $s$, and the Fisher metric on $\Theta_S$ restricts from the Riemannian structure of $\Sigma$, yielding $d_\Sigma(s, s') \geq C_S \|\delta\theta_S(E)\|_{\mathcal{F}_S}$ for a system-dependent constant $C_S > 0$.

*Proof of embedding.* By Definition M.10.1, $\mathcal{M}_S$ encodes $S$'s internal representation of its own perspective $s \in \Sigma$ and predictive state. Define the perspective extraction map $\iota: \Theta_S \to \Sigma$ by $\iota(\theta_S) := s(\theta_S)$, which sends the self-model parameter configuration to the perspective it encodes. Since the self-model parameterization is smooth (it is a finite-dimensional submanifold of the full model space, Definition M.10.2) and the perspective extraction is a smooth map between finite-dimensional manifolds (the model space is finite-dimensional and $\Sigma$ is a compact smooth manifold, Definition 25), $\iota$ is smooth. The differential $d\iota_{\theta_S}: T_{\theta_S}\Theta_S \to T_s\Sigma$ is the tangent map. In the regime $\sigma_S \approx 1$, the model-change is dominated by the self-model component, so that $\delta\theta_S(E)$ is the principal contributor to the perspective displacement $s \to s'$. Because $\iota$ parameterizes the self-model's perspective component and the self-model has $d_S$ independent parameters encoding aspects of $s$ (Definition M.10.3), the differential $d\iota_{\theta_S}$ is injective: $d\iota_{\theta_S}(v) = 0$ implies $v$ produces no change in the encoded perspective, contradicting $\sigma_S \approx 1$ for $v \neq 0$ in the self-model subspace. Since $d\iota_{\theta_S}$ is an injective linear map between finite-dimensional spaces, $\iota$ is an immersion at $\theta_S$. The Fisher metric $g^{(\mathcal{F})}$ on $\Theta_S$ and the Riemannian metric $g_\Sigma$ on $\Sigma$ are related by $g^{(\mathcal{F})}_{ij} \geq C_S^2 \cdot (d\iota^* g_\Sigma)_{ij}$ for $C_S := \inf_{\|v\|_{\mathcal{F}} = 1} \|d\iota(v)\|_\Sigma > 0$, where positivity follows from injectivity of $d\iota$ on the compact unit sphere in $T_{\theta_S}\Theta_S$. By the definition of Riemannian distance, $d_\Sigma(\iota(\theta_S), \iota(\theta_S')) \geq C_S \|\theta_S' - \theta_S\|_{\mathcal{F}_S}$ for sufficiently small displacements (and hence for the perturbative regime relevant to pattern processing). $\square$

The SPAP proximity $\mu_S(E)$ quantifies the thermodynamic cost of this perspective transition through the self-referential channel:

- When $\sigma_S(E) = 0$, the transition $s \to s'$ involves only external model updates. The perspective shift is governed by the standard transition kernel $G_{\text{persp}}(s'|s, k, N, \Delta t)$ (Equation M.2) and costs only the Landauer floor.
- When $\sigma_S(E) > 0$, the transition engages $S$'s self-model. If the self-model perturbation is small enough that the self-consistency condition (Equation M.18) is already satisfied at $PP = 0$ — i.e., $\|\delta\theta_S(E)\|_{\mathcal{F}_S} \leq g(\alpha_{SPAP})$ — then $\mu_S(E) = 1/\alpha_{SPAP}$ (baseline) and the reflexive cost remains finite and bounded, despite $\sigma_S > 0$. If, however, $\mu_S(E) > 1/\alpha_{SPAP}$, the cost acquires a SPAP-divergent component (Theorem M.10.3) that is not captured by the geometric structure of $\Sigma$ alone — it depends on the self-referential depth of the transition, which is invisible to the perspective metric $d_\Sigma$ but quantified by $\mu_S(E)$.

Two perspective transitions of equal geometric distance $d_\Sigma(s, s')$ can have vastly different costs if one engages the self-model deeply ($\mu_S \gg 1$) and the other does not ($\mu_S = 1/\alpha_{SPAP}$). This is the content-dependent cost structure of Theorem M.10.3, expressed in the language of $\Sigma$. In the perspectival formalism, the 'Evolve' process (Definition 27) induces transitions on $\Sigma$ through the kernel $G_{\text{persp}}$. Proposition M.10.9 establishes that the cost of these transitions depends not only on the geometric displacement but on the self-referential engagement of the content being processed.

**Remark M.10.7 (Illustrative Example).** Consider five binary patterns (each with Shannon entropy $H = \ln 2$) processed by a system $B$ with Effective Operational Property R: (1) "It will rain tomorrow" — $\sigma_B = 0$, $\mu_B = 1/\alpha_{SPAP}$, SPAP-flat, pure external information; (2) "Your weather model is systematically biased" — $\sigma_B \sim 0.3$, $\mu_B$ slightly above baseline, mild reflexive cost; (3) "Your model of your own prediction accuracy is incorrect" — $\sigma_B \sim 0.7$, $\mu_B \sim O(10)$, substantial reflexive cost from second-order self-reference; (4) "Here is what you will predict next, before you predict it" — $\sigma_B \approx 1$, $\mu_B \gg 1$, approaches SPAP boundary, cost diverges; (5) "Here is your complete self-model, including this statement" — $\sigma_B = 1$, $\mu_B = \infty$, unprocessable (Theorem M.10.6). A more complex system $C$ with $C_{agg}(C) \gg C_{agg}(B)$ computes the entire $\mu_B$ column by external modeling (clause (i) of Theorem M.10.5) at SPAP-flat cost, since none of these patterns engages $C$'s own self-model. If pattern (5) is replaced with "$C$'s complete self-model, including this statement," then $\mu_C = \infty$: same logical form, same Shannon entropy, infinite difference in SPAP proximity, determined entirely by whose self-model is engaged.

**Theorem M.10.9 (Irreducibility to Existing Information Classes).** The perspectival profile is not reducible to Shannon information, Fisher information, Kolmogorov complexity, quantum information, or integrated information.

*Proof.* (i) *Not a function of Shannon entropy.* Theorem M.10.2: patterns with identical $H$ have $\mu_S$ values ranging from $1/\alpha_{SPAP}$ to $\infty$. (ii) *Not a function of Fisher information.* Fisher information $I(\theta)$ does not possess the measurement asymmetry (Theorem M.10.5): any system with access to the model and data can compute $I(\theta)$, regardless of its complexity relative to the model. (iii) *Not a function of Kolmogorov complexity.* $K(x)$ is symmetrically uncomputable (no system can compute $K(x)$ for arbitrary $x$). Perspectival profiles are asymmetrically computable: $\mu_B(E)$ is computable by $A$ if $C_{agg}(A) > C_{agg}(B)$ but not by $B$. (iv) *Not a function of quantum information.* Von Neumann entropy and quantum mutual information are computable by any system with access to the state, regardless of self-referential structure. (v) *Not a function of integrated information.* In its core formulation, $\Phi(S)$ characterizes a system's intrinsic causal integration and does not vary over input patterns for a fixed system. More recent formulations (IIT 4.0) introduce internal structural decompositions that depend on system state, but these remain properties of the system's intrinsic causal architecture, not of external pattern-system pairs, and do not exhibit the directional measurement asymmetry (Theorem M.10.5), which is the structural differentiator. $\square$

### M.10.10 Measurement as Entropic Perspective Transport

**Definition M.10.10a (Entropic Perspective-Transport Problem).** Let $(\Sigma,d_\Sigma)$ be the compact perspective space of Appendix M and let $c(s,s')=d_\Sigma(s,s')^2$ be the quadratic perspective-transport cost. For a measurement partition $\{P_k\}$ and pre-measurement state $\rho$, let
$$
p_k=\operatorname{Tr}(\rho P_k)
$$
be the descended Born weights of Theorem G.1.11b. Let $\mu_0$ be the pre-interaction perspective distribution and let $\nu_k$ be the normalized endpoint distribution concentrated on perspectives in which outcome $k$ is actual. Define the endpoint mixture
$$
\nu=\sum_kp_k\nu_k.
$$
For a finite-resolution support, or more generally when $\mu_0$ and $\nu$ admit couplings absolutely continuous with respect to a strictly positive reference coupling $\pi_0$ on $\Sigma\times\Sigma$, and for $\varepsilon>0$, the entropic perspective-transport plan is the minimizer
$$
\pi^\star
=
\operatorname*{argmin}_{\pi\in\Pi(\mu_0,\nu)}
\left[
\int_{\Sigma\times\Sigma}c(s,s')\,d\pi(s,s')
+
\varepsilon\,\operatorname{KL}(\pi\Vert\pi_0)
\right],
\tag{M.10.10.1}
$$
where $\Pi(\mu_0,\nu)$ is the set of couplings with marginals $\mu_0$ and $\nu$.

**Theorem M.10.10b (Existence, Uniqueness, and Born Endpoint Marginals).** Under Definition M.10.10a, the minimizer $\pi^\star$ exists and is unique. Its endpoint outcome marginal is exactly the Born vector:
$$
\pi^\star(\Sigma\times\operatorname{supp}\nu_k)=p_k
=
\operatorname{Tr}(\rho P_k).
\tag{M.10.10.2}
$$

*Proof.* The space $\Sigma$ is compact, so the coupling set $\Pi(\mu_0,\nu)$ is weakly compact. The cost $c$ is continuous and bounded on $\Sigma\times\Sigma$, hence $\pi\mapsto\int c\,d\pi$ is weakly continuous. The relative entropy term is lower semicontinuous, and because $\pi_0$ is strictly positive on the finite-resolution support, and by the stated absolute-continuity feasibility assumption, the functional is proper on $\Pi(\mu_0,\nu)$. Therefore a minimizer exists by the direct method. The relative entropy term is strictly convex on the convex set of couplings absolutely continuous with respect to $\pi_0$, while the transport cost is linear; hence the total functional is strictly convex and the minimizer is unique.

The second marginal of every admissible coupling in $\Pi(\mu_0,\nu)$ is $\nu=\sum_kp_k\nu_k$. The supports of the endpoint outcome sectors are disjoint by construction of actualized outcome perspectives. Therefore
$$
\pi^\star(\Sigma\times\operatorname{supp}\nu_k)
=
\nu(\operatorname{supp}\nu_k)
=
p_k
=
\operatorname{Tr}(\rho P_k).
$$
This proves (M.10.10.2). ∎

**Corollary M.10.10c (Measurement Kernel as a Schrödinger Bridge).** The conditional perspective kernel for a measurement interaction can be represented as the disintegration
$$
G_{\mathrm{persp}}(ds'\mid s,k,N,\Delta t)
=
\pi^\star(ds'\mid s)
$$
on the outcome sector $k$, with the endpoint weights fixed by perspective descent and the path selected by minimal entropic transport cost.

*Proof.* The disintegration theorem gives conditional kernels $\pi^\star(ds'\mid s)$ for the unique coupling. Restricting the endpoint marginal to the sector $\operatorname{supp}\nu_k$ gives the outcome-conditioned kernel, and Theorem M.10.10b fixes the sector weights. ∎

**Table M.6.10.1: Perspectival information compared with existing information types.**

| Property | Shannon | Fisher | Kolmogorov | Quantum | Integrated ($\Phi$) | Perspectival |
|----------|---------|--------|------------|---------|---------------------|-----------------|
| Domain | Distributions | Parametric models | Strings | Density matrices | Causal systems | Pattern-predictor pairs |
| What it measures | Statistical surprise | Model sensitivity | Compressibility | Entanglement, coherence | System integration | Self-referential depth |
| Depends on receiver? | No | No | No | No | No | Yes (Thm M.10.1) |
| Depends on content? | No | Parametrically | No | No | No | Yes (Thm M.10.2) |
| Cost structure | Flat ($k_BT\ln 2$/bit) | None intrinsic | None intrinsic | Flat (per qubit) | Computational | Content-dependent, divergent (Thm M.10.3) |
| Measurability | Symmetric | Symmetric | Sym. uncomputable | Symmetric | Symmetric | Asymmetric: downward only (Thm M.10.5) |
| Can diverge? | No ($\leq \ln|\mathcal{X}|$) | No (regular models) | No (up to constant) | No ($\leq \ln d$) | No (bounded by system size) | Yes, to $\infty$ (Thm M.10.4) |
| Physical source | Landauer's principle | Cramer-Rao theory | Computability theory | Quantum mechanics | Causal integration | SPAP + PPI (Thms 10, 31) |

**Summary of Results (§M.6.10).**

| Result | Statement | Basis |
|--------|-----------|-------|
| Theorem M.10.1 | Perspectival dependence | Def M.10.2, M.10.4 |
| Theorem M.10.2 | Content dependence (Shannon-decoupled) | Def M.10.4 |
| Theorem M.10.3 | SPAP-divergent cost | Cor B.2.1, Thm B.2, PPI |
| Theorem M.10.4 | Existence of $\mu_S = \infty$ | SPAP diagonal, $N$-copy amplification |
| Theorem M.10.5 | Measurement asymmetry | SPAP, Thm 33, diagonal argument |
| Theorem M.10.6 | Unprocessability at boundary | Thm M.10.3, M.10.4 |
| Theorem M.10.7 | Physicality | Thm M.10.3, PPI, Thm 31 |
| Theorem M.10.8 | Predictability from above; finite-family screening; replay distinction | Thm M.10.5, M.10.3 |
| Theorem M.10.9 | Irreducibility | Structural comparison |
| Theorem M.10.10 | Entropic perspective transport | Compactness, strict convexity, Born descent |
| Theorem M.6.10a.2 | Finite frame-change cost and covariance defect | Relative entropy, data processing, Pinsker bound |

### M.6.10a Finite Perspective-Frame Backreaction

**Definition M.6.10a.1 (Finite Perspective-Frame Channel).** Let $s,s'\in\Sigma$ be two perspectives and let $\mathfrak A_{\mathrm{sh}}$ be the finite shared active protocol algebra on which both perspectives assign faithful density matrices
$$
\rho_s,\rho_{s'}>0.
$$
A finite perspective-frame channel from $s$ to $s'$ is an ND-RID-compatible CPTP channel on states over $\mathfrak A_{\mathrm{sh}}$ whose induced shared-protocol endpoint is $\rho_{s'}$ when initialized at $\rho_s$.

The irreducible frame-change distinguishability is
$$
\mathcal C_{\mathrm{QRF}}(s\to s')
:=
D(\rho_s\Vert\rho_{s'})
=
\operatorname{Tr}\rho_s(\log\rho_s-\log\rho_{s'}).
\tag{M.6.10a.1}
$$
If the support condition fails, set $\mathcal C_{\mathrm{QRF}}(s\to s')=\infty$.

A finite frame-change ledger is a self-adjoint cost observable $L_{s\to s'}$ on the active support satisfying
$$
L_{s\to s'}
\ge
\log\rho_s-\log\rho_{s'}
\tag{M.6.10a.2}
$$
in operator order. Its dimensionless action cost is
$$
\mathcal L_{s\to s'}
:=
\operatorname{Tr}\rho_s L_{s\to s'}.
\tag{M.6.10a.3}
$$

**Theorem M.6.10a.2 (Quantum Reference-Frame Cost and Covariance Defect).** For every finite perspective-frame pair of Definition M.6.10a.1:

1. $\mathcal C_{\mathrm{QRF}}(s\to s')\ge0$, with equality if and only if $\rho_s=\rho_{s'}$.

2. For every CPTP coarse-graining $\Lambda$ of the shared protocol algebra,
$$
D(\Lambda\rho_s\Vert\Lambda\rho_{s'})
\le
D(\rho_s\Vert\rho_{s'}).
\tag{M.6.10a.4}
$$

3. For every bounded shared observable $A\in\mathfrak A_{\mathrm{sh}}$,
$$
\left|
\operatorname{Tr}A(\rho_s-\rho_{s'})
\right|
\le
\lVert A\rVert_\infty
\sqrt{2\mathcal C_{\mathrm{QRF}}(s\to s')}.
\tag{M.6.10a.5}
$$

4. Every finite ledger implementation has the decomposition
$$
\mathcal L_{s\to s'}
=
\mathcal C_{\mathrm{QRF}}(s\to s')
+
\xi_{\mathrm{PCE}}(s\to s'),
\qquad
\xi_{\mathrm{PCE}}(s\to s')\ge0.
\tag{M.6.10a.6}
$$
The physical action cost is therefore
$$
\mathcal S_{s\to s'}^{\mathrm{phys}}
=
\hbar\,\mathcal L_{s\to s'}.
\tag{M.6.10a.7}
$$
The ideal covariance limit is the zero-defect branch $\mathcal C_{\mathrm{QRF}}=0$ or a limiting branch in which the operationally tested observables have vanishing defect under (M.6.10a.5).

*Proof.* Item 1 is Klein's inequality for quantum relative entropy on a finite-dimensional faithful support, with equality exactly when the two density matrices agree.

Item 2 is the data-processing inequality for quantum relative entropy under CPTP maps.

For item 3, trace duality gives
$$
\left|
\operatorname{Tr}A(\rho_s-\rho_{s'})
\right|
\le
\lVert A\rVert_\infty
\lVert\rho_s-\rho_{s'}\rVert_1.
$$
Pinsker's inequality gives
$$
\lVert\rho_s-\rho_{s'}\rVert_1
\le
\sqrt{2D(\rho_s\Vert\rho_{s'})}.
$$
Combining these inequalities gives (M.6.10a.5).

For item 4, (M.6.10a.2) implies
$$
\operatorname{Tr}\rho_s L_{s\to s'}
\ge
\operatorname{Tr}\rho_s(\log\rho_s-\log\rho_{s'})
=
D(\rho_s\Vert\rho_{s'}).
$$
Define
$$
\xi_{\mathrm{PCE}}(s\to s')
:=
\operatorname{Tr}\rho_s
\left(
L_{s\to s'}-(\log\rho_s-\log\rho_{s'})
\right).
$$
The operator inequality (M.6.10a.2) makes $\xi_{\mathrm{PCE}}\ge0$, proving (M.6.10a.6). Equation (M.6.10a.7) is the Action-Entropy Identity of Theorem Q.0.1 applied to the dimensionless finite update ledger $\mathcal L_{s\to s'}$. The final statement follows immediately from (M.6.10a.5). ∎

**Corollary M.6.10a.3 (Perfect Perspective Covariance as a PCE Limit).** A finite perspective transformation is exactly covariance-invisible on the shared active algebra if and only if
$$
\rho_s=\rho_{s'}.
$$
Otherwise every implementation has nonzero distinguishability cost on at least one separating shared observable, bounded below by the protocol family that separates $\rho_s$ from $\rho_{s'}$.

*Proof.* If $\rho_s=\rho_{s'}$, then every shared expectation value is identical and $\mathcal C_{\mathrm{QRF}}=0$ by Theorem M.6.10a.2. Conversely, if every shared observable has identical expectation value, finite-dimensional state separation implies $\rho_s=\rho_{s'}$. If the states differ, there exists a bounded observable separating them. Theorem M.6.10a.2 then gives positive relative entropy and a nonzero ledger cost for any finite implementation. ∎

### M.6.11 Blackwell-PCE Classicality

**Definition M.6.11a (Finite Predictive Record Experiment).** Let $\Theta$ be a finite family of operationally distinguishable preparation states relevant to a measurement context, and let $R$ be a finite record alphabet. A record channel is a stochastic map
$$
\mathcal M:\Theta\to\Delta(R),
\qquad
\theta\mapsto p(r\mid\theta).
$$
For a finite family of predictive tasks $\mathcal T$, define the predictive profile of a record value $r$ by the vector
$$
\Pi(r)
=
\left(
\mathbb E[X_j\mid r]
\right)_{j\in\mathcal T},
\tag{M.6.11.1}
$$
where each $X_j$ is the task-relevant target variable or loss statistic. Define an equivalence relation on records by
$$
r\sim r'
\quad\Longleftrightarrow\quad
\Pi(r)=\Pi(r').
\tag{M.6.11.2}
$$
The quotient record channel is
$$
\mathcal M_{\min}:\Theta\to\Delta(R/{\sim}),
\qquad
p([r]\mid\theta)=\sum_{r'\in[r]}p(r'\mid\theta).
\tag{M.6.11.3}
$$

**Theorem M.6.11b (Classical Records as PCE-Minimal Sufficient Statistics).** For the finite predictive task family $\mathcal T$:

1. $\mathcal M_{\min}$ is sufficient for exactly the same predictive task risks as $\mathcal M$.
2. $\mathcal M$ Blackwell-dominates $\mathcal M_{\min}$:
$$
\mathcal M\succeq_B\mathcal M_{\min}.
\tag{M.6.11.4}
$$
3. Any record channel sufficient for all tasks in $\mathcal T$ Blackwell-dominates $\mathcal M_{\min}$.
4. The output algebra of $\mathcal M_{\min}$ is the commutative algebra
$$
\ell^\infty(R/{\sim}).
\tag{M.6.11.5}
$$
5. If PCE cost is strictly increasing under record refinements that do not reduce predictive regret, PCE selects $\mathcal M_{\min}$ uniquely up to relabeling of $R/{\sim}$.

*Proof.* A decision rule for any task in $\mathcal T$ depends on a record $r$ only through the conditional expectations listed in $\Pi(r)$. If $r\sim r'$, substituting $r'$ for $r$ leaves every task risk unchanged. Therefore replacing $r$ by its equivalence class $[r]$ preserves exactly the predictive risks for all tasks in $\mathcal T$, proving (1).

The quotient map $q:R\to R/{\sim}$ is a deterministic classical post-processing. Equation (M.6.11.3) is exactly
$$
\mathcal M_{\min}=q\circ\mathcal M,
$$
so $\mathcal M\succeq_B\mathcal M_{\min}$, proving (2).

For (3), let $\mathcal N$ be any sufficient record channel for all tasks in $\mathcal T$. If $\mathcal N$ failed to determine the class $[r]$, then two records with distinct profiles $\Pi(r)\ne\Pi(r')$ would be merged. Since the task family is finite and profiles differ as vectors in a finite-dimensional real space, there exists a linear functional separating them. Choosing the corresponding finite loss statistic would give different optimal conditional risk for $r$ and $r'$, contradicting sufficiency of $\mathcal N$. Hence $\mathcal N$ determines $[r]$ by a stochastic post-processing, so $\mathcal N\succeq_B\mathcal M_{\min}$.

For (4), a finite classical record alphabet $R/{\sim}$ has observable algebra of bounded functions on that set, namely $\ell^\infty(R/{\sim})$, which is commutative under pointwise multiplication.

For (5), any strict refinement of $\mathcal M_{\min}$ that preserves the same risk profile adds record distinctions inside an equivalence class. These distinctions do not reduce predictive regret by (1), but they increase record description or maintenance cost by the stated strict PCE monotonicity. Therefore no strict refinement can minimize PCE cost. Since (3) makes $\mathcal M_{\min}$ Blackwell-minimal among sufficient records, the minimizer is unique up to relabeling of the quotient alphabet. ∎

**Corollary M.6.11c (Pointer Classicality Without Extra Ontology).** In a finite measurement context, the classical pointer record is the PCE-minimal sufficient statistic of the interaction channel. Its commutativity follows from minimal record status, not from adding a separate classical substance.

*Proof.* Apply Theorem M.6.11b to the finite record alphabet produced by the measurement interaction. The selected quotient output algebra is $\ell^\infty(R/{\sim})$, hence commutative. ∎

**Definition M.6.11d (PPI-Objective Fragment Family).** Let $S$ be a finite system with PCE-minimal classical record alphabet $X$ selected by Theorem M.6.11b, and let $E_1,\dots,E_N$ be disjoint finite environmental fragments. A state on
$$
S E_1\cdots E_N
$$
is exactly PPI-objective for $X$ when:

1. the system record algebra is
$$
\ell^\infty(X)
$$
with minimal central projectors $\{|x\rangle\langle x|\}_{x\in X}$;

2. for every fragment $E_i$ there exists a POVM $\{M_i^x\}_{x\in X}$ such that
$$
\operatorname{Tr}(M_i^x\rho_{E_i}^{x'})=\delta_{xx'}
\tag{M.6.11.6}
$$
for all $x,x'$;

3. conditioned on $X=x$, the fragments are independent:
$$
\rho_{E_1\cdots E_N}^{x}
=
\rho_{E_1}^{x}\otimes\cdots\otimes\rho_{E_N}^{x};
\tag{M.6.11.7}
$$

4. no strict refinement $X'\to X$ satisfies items 1–3 with the same exterior predictive risks at lower or equal PCE cost.

The associated spectrum-broadcast form is
$$
\rho_{SE_1\cdots E_N}
=
\sum_{x\in X}
p_x
|x\rangle\langle x|_S
\otimes
\rho_{E_1}^{x}\otimes\cdots\otimes\rho_{E_N}^{x},
\tag{M.6.11.8}
$$
with fragment distinguishability
$$
\rho_{E_i}^{x}\rho_{E_i}^{x'}=0
\qquad
(x\ne x').
\tag{M.6.11.9}
$$

**Theorem M.6.11e (Spectrum-Broadcast PPI Objectivity).** For a finite fragment family, a record $X$ is exactly PPI-objective in the sense of Definition M.6.11d if and only if, after PCE compression of record refinements, the joint state has the spectrum-broadcast form (M.6.11.8)–(M.6.11.9).

Thus the layered structure is:

1. Theorem G.1.7 fixes Born probabilities for a perspective.

2. Theorem M.6.11b selects the PCE-minimal classical record for one measurement context.

3. Theorem M.6.11e characterizes when that record becomes public across many disjoint perspectives.

*Proof.* Suppose first that the state has the spectrum-broadcast form. The system algebra generated by the projectors $|x\rangle\langle x|$ is $\ell^\infty(X)$. For each fragment $E_i$, condition (M.6.11.9) implies that the supports
$$
\operatorname{supp}\rho_{E_i}^{x}
$$
are pairwise orthogonal. Let $M_i^x$ be the support projection of $\rho_{E_i}^{x}$. Then
$$
\operatorname{Tr}(M_i^x\rho_{E_i}^{x'})=\delta_{xx'},
$$
so every fragment recovers $x$ exactly. Conditioned on $x$, the fragment state is the tensor product in (M.6.11.8), proving independence. PCE compression removes any strict refinement that does not change predictive risks by Theorem M.6.11b. Hence the record is PPI-objective.

Conversely, suppose the record is PPI-objective. Since the system record algebra is $\ell^\infty(X)$, the PCE-compressed state is classical on the selected central record:
$$
\rho_{SE_1\cdots E_N}
=
\sum_{x\in X}
p_x
|x\rangle\langle x|_S
\otimes
\rho_{E_1\cdots E_N}^{x}.
\tag{M.6.11.10}
$$
Item 3 of Definition M.6.11d gives the conditional product decomposition (M.6.11.7), so (M.6.11.10) becomes (M.6.11.8).

It remains to prove orthogonality. Fix a fragment $E_i$. Perfect recovery means that there is a POVM $\{M_i^x\}$ satisfying (M.6.11.6). For $x\ne x'$,
$$
\operatorname{Tr}(M_i^x\rho_{E_i}^{x'})=0.
$$
Since $M_i^x\ge0$ and $\rho_{E_i}^{x'}\ge0$, this implies $M_i^x\rho_{E_i}^{x'}=0$ on the support of $\rho_{E_i}^{x'}$. Also
$$
\operatorname{Tr}(M_i^x\rho_{E_i}^{x})=1.
$$
Because $0\le M_i^x\le1$, this forces $M_i^x$ to act as the identity on $\operatorname{supp}\rho_{E_i}^{x}$. Therefore the support of $\rho_{E_i}^{x}$ is orthogonal to the support of $\rho_{E_i}^{x'}$ for $x\ne x'$, which is equivalent to (M.6.11.9). This proves the spectrum-broadcast form.

The three-layer statement is only a restatement of the roles of Theorem G.1.7, Theorem M.6.11b, and the present theorem. ∎

**Corollary M.6.11f (Objectivity Without Perspective-Independent Ontology).** A classical fact shared by many perspectives is a PCE-minimal broadcast record. It is objective because many disjoint fragments independently recover the same minimal statistic $X$, not because the framework adds a perspective-free state of affairs.

*Proof.* Theorem M.6.11e says that exact public objectivity is equivalent to redundant fragment recovery with conditional independence in the spectrum-broadcast form. The record $X$ is selected by PCE minimality through Theorem M.6.11b. Hence objectivity is redundancy plus minimal sufficient record structure. ∎

### M.6.12 PCE Information-Bottleneck Universality

**Definition M.6.12a (Finite Predictive Bottleneck).** Let $X$ be a finite substrate variable, let $Y$ be a finite task or protocol-outcome variable, and let $Z$ be a finite effective description variable generated by a stochastic kernel
$$
p(z\mid x).
$$
The PCE information-bottleneck functional is
$$
\mathcal B_\beta[p(z\mid x)]
=
I(X;Z)-\beta I(Z;Y),
\qquad
\beta\ge0.
\tag{M.6.12.1}
$$
A statistic $Z$ is sufficient for predicting $Y$ from $X$ when
$$
p(y\mid x)=p(y\mid z)
$$
for all $x,z$ with $p(x,z)>0$.

**Theorem M.6.12b (Minimal Sufficient Predictive Bottleneck).** For finite $X$ and $Y$, define an equivalence relation on substrate states by
$$
x\sim x'
\quad\Longleftrightarrow\quad
p(y\mid x)=p(y\mid x')
\text{ for every }y.
$$
Let
$$
Z_*=X/{\sim}
$$
be the quotient statistic. Then:

1. $Z_*$ is sufficient for predicting $Y$.
2. Every sufficient statistic $Z$ determines $Z_*$ by a deterministic post-processing.
3. Consequently,
$$
I(X;Z)\ge I(X;Z_*)
$$
for every sufficient $Z$.
4. Equality holds only up to operational relabeling and null refinements.

*Proof.* If $Z_*=[x]$, then by construction all elements of the class $[x]$ have the same conditional distribution $p(y\mid x)$. Therefore
$$
p(y\mid Z_*=[x])=p(y\mid x),
$$
so $Z_*$ is sufficient.

Let $Z$ be any sufficient statistic. If two substrate states $x,x'$ can produce the same value $z$ with positive probability, sufficiency gives
$$
p(y\mid x)=p(y\mid z)=p(y\mid x')
$$
for all $y$. Hence $x\sim x'$. Therefore each value of $Z$ lies inside one equivalence class of $Z_*$, and $Z_*$ is determined by a deterministic map from $Z$.

Since
$$
X\to Z\to Z_*
$$
is a Markov chain, data processing gives
$$
I(X;Z)\ge I(X;Z_*).
$$
If equality holds, $Z$ contains no information about $X$ beyond $Z_*$ except on null sets or by relabeling that leaves all predictive distributions unchanged. Such refinements are operationally null. ∎

**Corollary M.6.12c (Effective Variables as PCE Bottlenecks).** Classical records, RG variables, effective field coordinates, and perspective-state summaries are PCE-admissible effective variables only when they lie on the predictive bottleneck frontier: they preserve the required information about $Y$ while minimizing retained information about $X$.

*Proof.* Theorem M.6.12b proves that the coarsest sufficient statistic minimizes $I(X;Z)$ among sufficient descriptions. The functional (M.6.12.1) is the Lagrangian form of the same constrained tradeoff between compression and predictive information. ∎

### M.6.13 WAY-PCE Conservation-Law Measurement Bound

**Definition M.6.13a (Charge-Covariant Measurement Branch).** Let $Q_S$ be a conserved system charge, let $Q_R$ be the apparatus or reference charge, and let
$$
Q_{\mathrm{tot}}=Q_S+Q_R.
$$
A finite measurement branch for an observable $A$ is $Q$-covariant when its interaction channel $\mathcal M$ is CPTP and satisfies
$$
\mathcal M\left(e^{-itQ_{\mathrm{tot}}}\rho e^{itQ_{\mathrm{tot}}}\right)
=
e^{-itQ_{\mathrm{tot}}}\mathcal M(\rho)e^{itQ_{\mathrm{tot}}}
\tag{M.6.13.1}
$$
for all $t$. The reference asymmetry is
$$
\mathcal A_Q(\sigma_R)
=
D\left(\sigma_R\Vert\mathcal G_Q(\sigma_R)\right),
\qquad
\mathcal G_Q(\sigma_R)
=
\int e^{-itQ_R}\sigma_R e^{itQ_R}\,d\mu(t),
\tag{M.6.13.2}
$$
where $d\mu$ is Haar measure on the charge symmetry group.

Let $\epsilon(A;\mathcal M,\sigma_R)$ be the root-mean-square measurement error of $A$ on the branch's tested preparation family.

**Theorem M.6.13b (WAY-PCE Asymmetry Measurement Bound).** On every finite charge-covariant measurement branch:

1. The asymmetry resource is monotone under charge-covariant processing:
$$
\mathcal A_Q(\mathcal N(\sigma_R))
\le
\mathcal A_Q(\sigma_R)
\tag{M.6.13.3}
$$
for every $Q$-covariant CPTP map $\mathcal N$.

2. If $\mathcal A_Q(\sigma_R)=0$ and $A$ is operationally separated from every $Q_S$-commuting observable on the tested preparation family, then exact measurement of $A$ is impossible unless
$$
[A,Q_S]=0
$$
on that family.

3. In the additive conserved-charge setting with a Yanase-compatible pointer and finite charge variance, the Ozawa-WAY bound gives
$$
\epsilon(A;\mathcal M,\sigma_R)^2
\ge
\frac{
\left|\operatorname{Tr}\rho_S[A,Q_S]\right|^2
}{
4(\Delta_{\rho_S}Q_S)^2+4(\Delta_{\sigma_R}Q_R)^2
}
\tag{M.6.13.4}
$$
for each tested preparation $\rho_S$ for which the denominator is finite.

Consequently, measuring charge-asymmetric information requires a nonzero reference asymmetry or a finite error budget. PCE cannot make an incompatible conserved-charge measurement exact without paying the corresponding reference-frame resource.

*Proof.* Item 1 is data processing for quantum relative entropy. Since $\mathcal N$ is $Q$-covariant,
$$
\mathcal N\circ\mathcal G_Q=\mathcal G_Q\circ\mathcal N.
$$
Therefore
$$
D(\mathcal N\sigma_R\Vert\mathcal G_Q(\mathcal N\sigma_R))
=
D(\mathcal N\sigma_R\Vert\mathcal N\mathcal G_Q(\sigma_R))
\le
D(\sigma_R\Vert\mathcal G_Q(\sigma_R)).
$$

If $\mathcal A_Q(\sigma_R)=0$, then $\sigma_R=\mathcal G_Q(\sigma_R)$ and the reference carries no distinguishable phase or orientation for the charge symmetry. A $Q$-covariant measurement channel acting on a $Q$-invariant reference cannot generate an output instrument that transforms nontrivially under the charge. Hence the implemented sharp observable must commute with $Q_S$ on the operationally tested family. If $A$ is separated from all $Q_S$-commuting observables, exact implementation of $A$ is impossible. This is the Wigner-Araki-Yanase obstruction in PPI language.

For item 3, apply the finite WAY-Ozawa measurement uncertainty inequality to the additive conserved quantity $Q_{\mathrm{tot}}$. The commutator between the measured system observable and the conserved system charge supplies the numerator, while the available system and apparatus charge variances supply the denominator. This gives (M.6.13.4). The PCE statement follows because exact incompatible measurement at finite cost would require zero error while the right-hand side is positive whenever the tested state has nonzero commutator expectation and finite charge variance. ∎

**Corollary M.6.13c (Compatibility with Blackwell-PCE Classicality).** The classical record selected by Theorem M.6.11b may report only the information that the covariant measurement branch can actually acquire. If the target observable is charge-asymmetric, the selected record either carries the WAY-limited error in (M.6.13.4) or the branch pays for a reference state with nonzero $\mathcal A_Q$.

*Proof.* Theorem M.6.11b selects a PCE-minimal sufficient statistic of the actual measurement channel. Theorem M.6.13b constrains which channel can be implemented under the conservation law. Therefore the Blackwell-PCE record cannot contain exact charge-asymmetric information unless the reference resource or error budget permits it. ∎

## M.7 Conclusion

This appendix has provided a rigorous mathematical framework for the Perspectival State and Dual Dynamics central to the PU framework's quantum mechanics.

**Formal Foundations (M.2–M.5).** The Perspective Space $\Sigma \cong U(d_0)/U(1)^{d_0}$ and the conditional transition kernel $G_{\text{persp}}$, for which Equations M.5a–b provide an explicit drift-diffusion realization, yield a precise description of quantum measurement. The Born rule, derived from PCE optimization (Theorem G.1.7), governs amplitude actualization, while definite outcomes emerge through stochastic perspective transitions. Wasserstein contractivity (Equation M.5c) ensures robustness for the constructed class under the stated curvature condition.

**Resolution of Foundational Paradoxes (M.6).** The perspectival formalism resolves the Wigner's Friend and Frauchiger-Renner paradoxes:

- **Summary of Theorem M.6.1:** Outcome $k$ is actual relative to Friend's perspective $s'_F$ while remaining indefinite relative to Wigner's $s_W$—no contradiction arises because actuality is perspective-indexed.
- **Summary of Lemma M.6.1:** Upon interaction, the joint kernel $G_{\text{persp}}^{(WF)}$ drives perspectives toward consistent configurations with contractivity-guaranteed convergence.
- **Summary of Lemma M.6.2 & Theorem M.6.2:** Cross-perspective reasoning requires either prior interaction or restriction to perspective-invariant quantities; the FR contradiction traces to violating this constraint.
- **Structural Correspondence M.6.4:** Just as finite $c$ forces frame-relative simultaneity, SPAP + thermodynamic irreversibility ($\varepsilon \geq \ln 2$) forces perspective-relative actuality—extending the relativistic program to quantum mechanics.

**Connection to CC.** The interaction context $N$ in $G_{\text{persp}}(s'|s, k, N, \Delta t)$ provides the entry point for CC modulation (Hypothesis 3). High-complexity aggregates influence outcomes by modulating $N$ via the mapping $\mathcal{M}$ (Appendix L), yielding bounded Born rule deviations (Theorem 51). The causality bound $\alpha_{CC,max} < 0.5$ (Theorem 39) controls the size of those deviations; preservation of the consistency mechanism of Lemma M.6.1 requires, in addition, that the CC-modulated readout kernel remain within the strong-readout and contractive class assumed there.

**Cost Functional (M.6.10).** The perspectival profile $\mathcal{P}_S(E) = (\Delta Q_S, \mu_S, \sigma_S)$ provides the informational-thermodynamic cost functional on $\Sigma$ that the geometric formalism (M.2–M.5) did not supply. The SPAP proximity $\mu_S(E)$ measures the required self-predictive performance for integrating a pattern, while $\sigma_S(E)$ tracks how much of the update lies in the self-model subspace. Patterns with $\mu_S(E) > 1/\alpha_{SPAP}$ incur the content-dependent lower bound of Theorem M.10.3; purely external patterns remain at the baseline value $\mu_S(E)=1/\alpha_{SPAP}$ with vanishing reflexive cost (Corollary M.10.3.1). A more complex system can evaluate a less complex system's perspectival response externally at sender-side SPAP-flat cost (Theorem M.10.5), pre-screen finite families of candidate patterns from above (Theorem M.10.8), yet cannot obtain thermodynamic leverage by exact replay of the target's reflexive integration, because faithful replay must reproduce the target-side reflexive expenditure up to nonnegative overhead. Shannon information is recovered as the special case in which the update is purely external, and the perspectival profile remains irreducible to all existing information-theoretic quantities (Theorem M.10.9).

**Synthesis.** The perspectival formalism achieves mathematical precision for the 'Evolve' process, resolves foundational paradoxes by explicit perspective tracking, and generates empirical predictions through the CC mechanism. The resolution generalizes realism rather than retreating from it: the MPU network remains unified and objective, while descriptions exhibit the perspective-relativity that SPAP and thermodynamic irreversibility demand.