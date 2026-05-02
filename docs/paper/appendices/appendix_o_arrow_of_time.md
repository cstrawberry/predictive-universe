# Appendix O: Temporal Coherence and the Arrow of Time in the Predictive Universe

## O.1 Introduction: The Problem of Temporal Coherence

The Predictive Universe (PU) framework is built upon the operational dynamics of interacting Minimal Predictive Units (MPUs). As established in Theorem 4, the very act of prediction requires a primitive, ordered, and directional concept of evolution, which we identify with local time. Each MPU, through its cyclical operation, effectively possesses its own internal "clock." However, the existence of these local causal rhythms does not, in itself, explain the emergence of the coherent, large-scale temporal structure observed in the universe.

This appendix addresses this crucial issue. It does not attempt to derive the existence of time *ex nihilo*—a task fraught with logical circularity. Instead, it starts from the premise established in Theorem 4: the very act of prediction logically presupposes a primitive, ordered, and directional concept of evolution. We argue this is a non-negotiable prerequisite for any universe containing predictive agents. The central challenge addressed here is then threefold:
1.  **The Problem of Coherence:** How does a network of countless MPUs, each potentially operating on its own local causal timeline, achieve the vast domains of temporal synchronization necessary to support consistent physical laws and coherent structures?
2.  **The Problem of Directionality:** What physical mechanism enforces the observed, universal, and irreversible direction of time's flow—the arrow of time?
3.  **The Problem of Dynamics:** If time emerges from this synchronized medium, what is the nature of disturbances within it, and how does this temporal structure provide a substrate for advanced predictive phenomena like Consciousness Complexity (CC)?

We demonstrate that the solutions to these problems are necessary consequences of the framework's core principles. We show that temporal coherence emerges dynamically because desynchronization incurs a severe penalty under the Principle of Compression Efficiency (PCE). We then prove that the arrow of time is physically enforced by the fundamental thermodynamic irreversibility of the MPU's 'Evolve' process. Finally, we argue that this emergent temporal medium is not static; its dynamic properties can be modulated by complex MPU aggregates to enact the CC influence, and propagating disturbances within it provide a physical interpretation for gravitational waves. The full derivation of the arrow of time is provided in this appendix.

## O.2 The MPU Cycle as a Quantum of Causal Process

The fundamental unit of action in the PU framework is the MPU's Fundamental Predictive Loop (Definition 4), consisting of the logically ordered sequence of Internal Prediction ($P_{int}$), Verification ($V$), and Update ($D_{cyc}$). This P-V-U sequence represents an indivisible unit of causal process.

The characteristic timescale of this process for an individual MPU *i* is set by its internal physics. As established in Theorem 29, the MPU's internal Hamiltonian $\hat{H}_i$ corresponds to its baseline operational energy cost. While the instantaneous state of an MPU may be a superposition of energy eigenstates, the stable operational rhythm of the network emerges from the ensemble-averaged, coarse-grained effective Hamiltonian for a local patch, $\langle \hat{H}_{eff} \rangle$. Quantum fluctuations of individual MPUs average out, leading to a stable, collective cycle time for the local medium:
$$
\tau_{medium} \sim \frac{\hbar}{\langle \hat{H}_{eff} \rangle}
\tag{O.1}
$$
This $\tau_{medium}$ represents the fundamental granularity of physical processing at the emergent level. Initially, the network can be conceptualized as a collection of these local causal rhythms, with no *a priori* synchronization between them.

## O.3 The PCE Cost of Temporal Desynchronization

For the MPU network to function as a coherent predictive system capable of supporting complex structures and consistent laws, the local causal rhythms of its interacting constituents must align. We demonstrate that temporal desynchronization is an inefficient and predictively suboptimal state, incurring a significant penalty in the global PCE Potential $V(x)$ (Definition D.1).

Consider two interacting MPU ensembles, *i* and *j*, whose collective cycles are misaligned by a phase lag $\Delta\phi_{ij} \in [0, 2\pi)$. Any residual misalignment introduces irreducible prediction error and compensatory resource costs. Theorem O.1 formalizes this: temporal desynchronization increases the global PCE potential $V(x)$ through reduced predictive benefit and increased operational and/or propagation costs.

**Theorem O.1 (PCE Potential of Desynchronization).** A state of temporal desynchronization in an MPU network leads to a quantifiable increase in the global PCE Potential $V(x)=V_{op}+V_{prop}-V_{benefit}$ through two sources:

1.  **Reduced Predictive Benefit ($V_{benefit}$):** Phase misalignment induces a strictly nonnegative excess prediction error across at least one interacting edge, thereby reducing $PP$ and lowering the benefit term $\Gamma_0 B(PP)$.

2.  **Increased Resource Cost ($V_{op}$ and $V_{prop}$):** Any attempt to compensate this excess error (e.g., phase tracking, error correction, or increased interaction) requires additional complexity and/or reduces effective channel fidelity, increasing operational and propagation costs.

*Proof.*
1.  **Phase lag induces a nonnegative excess prediction error:** Fix an interacting pair $(i,j)$ and let $p_j(\cdot|t)$ denote the outcome distribution for the verified event in ensemble $j$ at local time $t$. Let $\Delta\phi_{ij}\in(-\pi,\pi]$ denote the principal phase difference and define the corresponding verification-time offset by
    $$
    \delta t_{ij} := \frac{\tau_{medium}}{2\pi}\,\Delta\phi_{ij},
    $$
    where $\tau_{medium}$ is the characteristic cycle time of the coherent medium (Equation O.1). Take the scoring rule in Definition 7 to be log-loss. If $i$ forms a prediction using the stale distribution $p_j(\cdot|t)$ while the realized outcome is distributed as $p_j(\cdot|t+\delta t_{ij})$, the excess expected prediction error relative to perfect synchronization is
    $$
    \Delta PE_{ij}(t)
    = D_{KL}\!\big(p_j(\cdot|t+\delta t_{ij})\,\|\,p_j(\cdot|t)\big) \ge 0.
    $$
    When $p_j(\cdot|t)$ is not locally constant in $t$, this divergence is strictly positive for all sufficiently small nonzero $\delta t_{ij}$. Moreover, if $p_j(\cdot|t)$ is $C^1$ with full support, then
    $$
    \Delta PE_{ij}(t) = \frac{1}{2} I_j(t)\,\delta t_{ij}^2 + o(\delta t_{ij}^2)
    = \frac{1}{2} I_j(t)\Big(\frac{\tau_{medium}}{2\pi}\Big)^2 (\Delta\phi_{ij})^2 + o((\Delta\phi_{ij})^2),
    \tag{O.2}
    $$
    where $I_j(t) := \sum_y \frac{(\partial_t p_j(y|t))^2}{p_j(y|t)}$ (with the analogous integral form for continuous outcomes).

2.  **Reduced predictive benefit:** By Definition 7, $PP(t)=\frac{1}{1+k_{PP}PE(t)}$ is strictly decreasing in $PE(t)$. Thus any $\Delta PE_{ij}(t)>0$ strictly decreases the corresponding $PP_v$, hence decreases $B(PP_v)$ and lowers $V_{benefit}=\sum_v \Gamma_0 B(PP_v)$. Since $V=V_{op}+V_{prop}-V_{benefit}$, this increases $V$.

3.  **Operational-cost penalty under compensation:** If the system seeks to maintain the synchronized $PP$ despite a fixed nonzero $\Delta\phi_{ij}$, it must reduce the excess divergence in (O.2) by additional modeling/control resources (e.g., tracking and correcting phase offsets). This requires an increase in effective complexity $C$ relative to the synchronized optimum. Because $R(C)$ is increasing (Definition 3), such compensation strictly increases $V_{op}$.

4.  **Propagation-cost penalty under misalignment:** Even without compensation, a nonzero phase lag acts as additional time-jitter noise on the link $(i,j)$, which cannot increase effective channel fidelity or transmitted mutual information (data processing). The propagation term $V_{prop}$ penalizes decoherence and irreversibility (Definition D.1; Appendix E), and therefore cannot decrease under added time-jitter; it increases whenever the effective fidelity is degraded.

5.  **Conclusion:** For any desynchronized configuration with $\Delta\phi_{ij}\neq 0$ on at least one predictive edge with nontrivial temporal variation, either the excess divergence in (O.2) is tolerated (reducing $V_{benefit}$) or it is compensated (increasing $V_{op}$ and typically $V_{prop}$), so $V(x)$ is strictly larger than in synchronized configurations (up to a global phase). For small misalignments, (O.2) yields a quadratic leading-order penalty in $\Delta\phi_{ij}$.

## O.4 Dynamical Emergence of a Coherent Causal Medium

The existence of a desynchronization penalty in the PCE potential implies that the system's own dynamics will drive it towards a state of synchronization.

Let the network configuration state $x$ be expanded to include the set of local MPU time phases $\{\phi_i(t)\}$. The PCE potential $V(x, \{\phi_i\})$ has a global minimum where the phase differences $\Delta\phi_{ij} = \phi_i - \phi_j$ are zero for all interacting pairs.

**Theorem O.2 (Dynamical Emergence of a Coherent Causal Medium).**
The stochastic adaptation dynamics of the MPU network, governed by minimizing the PCE Potential $V(x, \{\phi_i\})$ (Appendix D, Equation D.8), drive the system toward phase-synchronized configurations and, in the low-noise detailed-balance stationary regime of Appendix D, self-organize into macroscopic domains of temporal coherence. This process establishes a **coherent causal medium**, a stable background of phase-locked MPU cycles upon which more complex dynamics can unfold.

*Proof.*
1.  **Restoring Gradient:** As established in Theorem O.1, the PCE potential is minimized when phase differences are zero. The gradient of the potential with respect to the phase differences, $\nabla_{\Delta\phi_{ij}} V$, acts as a restoring force, driving $\Delta\phi_{ij}$ towards zero.
2.  **Long-Run Behavior of Stochastic Dynamics:** The system's evolution is described by the stochastic gradient flow $dx(t) = -\eta(x) \nabla V dt + \sqrt{2D(x)} dW(t)$. As formalized in Appendix D (Theorem D.5), these dynamics admit an ergodic stationary regime; and in low-noise detailed-balance regimes the stationary measure is biased toward (and concentrates near) the set of global minima of the potential $V$.
3.  **Emergence of a Coherent Medium:** Theorem O.1 implies that the PCE potential depends on phase differences and is minimized on the synchronized manifold
    $$
    \mathcal M_{sync}:=\{\{\phi_i\}:\Delta\phi_{ij}=0\ \text{for all interacting pairs }(i,j)\},
    $$
    which is invariant under global phase shifts. Thus the set of global minimizers is $\mathcal M_{sync}$ rather than a single configuration. By Theorem D.5, in the low-noise detailed-balance regime the stationary measure concentrates on neighborhoods of the global minimizer set (Eq. D.12b): for any open neighborhood $U\supset \mathcal M_{sync}$, $\pi_\beta(U)\to 1$ as $\beta\to\infty$. Consequently, typical long-run configurations exhibit small local phase differences across edges and form macroscopic domains of phase-locked MPU cycles; deviations (e.g., domain walls) incur a positive potential gap and are exponentially suppressed. This establishes a coherent causal medium consistent with the background structure used in Section 11.

## O.5 The Physical Origin of the Arrow of Time

The coherent causal rhythm that emerges from the synchronized MPU network is not symmetric; it possesses an intrinsic and irreversible direction.

**Theorem O.3 (Arrow of Time in the Low-Noise Detailed-Balance Regime).**
The emergent coherent time is directional in any regime where the predictive update cycles admit forward and reverse path measures satisfying the standard entropy-production relation. More precisely, suppose a coherent macroscopic "forward step" consists of $N$ nontrivial update cycles, each with entropy production $\Sigma_{\text{pred}}^{(k)} \ge \varepsilon$ as in Appendix J, and suppose the induced forward and reversed macro-history measures $P_F,P_R$ obey
$$
\Sigma_{\text{tot}}=\sum_{k=1}^N \Sigma_{\text{pred}}^{(k)}=\log\!\frac{P_F}{P_R}.
$$
Then
$$
\frac{P_R}{P_F}\le e^{-N\varepsilon}\le 2^{-N},
$$
so coherent macroscopic reversals are exponentially suppressed.

*Proof.*

**1. Logical direction of predictive updating**

The Fundamental Predictive Loop (Definition 4) has the ordered stages Internal Prediction ($P_{int}$), Verification ($V$), and Update ($D_{cyc}$). This defines an oriented update sequence: prediction must be formed before verification, and verification must precede model revision. This establishes the direction of the elementary predictive cycle.

**2. Entropy production along a macroscopic forward step**

By Appendix J, Theorem J.1, every nontrivial predictive update cycle dissipates at least $\varepsilon$ nats, with $\varepsilon \ge \ln 2$. For a macro-history built from $N$ such cycles,
$$
\Sigma_{\text{tot}}=\sum_{k=1}^N \Sigma_{\text{pred}}^{(k)} \ge N\varepsilon.
$$

**3. Suppression of the reversed history**

Assume now that the coarse-grained stochastic dynamics lie in the low-noise detailed-balance regime in which the forward and reversed path measures are both defined and satisfy the standard fluctuation-relation identity
$$
\Sigma_{\text{tot}}=\log\!\frac{P_F}{P_R}.
$$
Exponentiating and rearranging gives
$$
\frac{P_R}{P_F}=e^{-\Sigma_{\text{tot}}}\le e^{-N\varepsilon}\le e^{-N\ln 2}=2^{-N}.
$$
Equivalently,
$$
P_R \le e^{-N\varepsilon} P_F \le 2^{-N} P_F.
$$

Thus, in this regime, the time-reversed macro-history is exponentially less probable than the forward history, and the predictive update direction is physically stabilized by irreversible entropy production. ∎

**Theorem O.3a (Conditional Single-Cycle Irreversibility Bound).** Let $c$ be one nontrivial MPU 'Evolve' cycle in which a predictive state is verified and then updated. Let $c^\dagger$ denote the formally reversed cycle with the same operational boundary data. Suppose the forward and reversed single-cycle path weights $P_F(c)$ and $P_R(c^\dagger)$ are defined on the same coarse-grained event algebra and satisfy the path entropy-production identity
$$
\sigma(c)=\log\frac{P_F(c)}{P_R(c^\dagger)}.
\tag{O.3a.1}
$$
If this coarse-grained cycle lies in the guarantee-level update class whose realized entropy production obeys the pathwise lower bound
$$
\sigma(c)\ge\varepsilon\ge\ln 2,
\tag{O.3a.2}
$$
then
$$
\frac{P_R(c^\dagger)}{P_F(c)}
\le
e^{-\varepsilon}
\le
\frac12.
\tag{O.3a.3}
$$

*Proof.* A nontrivial 'Evolve' cycle contains the ordered sequence prediction, verification, and update (Definition 4; Definition 27). Appendix J and Theorem 31 supply the guarantee-level entropy budget $\varepsilon\ge\ln 2$ for nontrivial finite-memory update cycles. The present theorem applies to the coarse-grained path class in which that budget is realized as the pathwise entropy-production bound (O.3a.2). Substituting $\sigma(c)\ge\varepsilon$ into the single-path identity (O.3a.1) gives
$$
\log\frac{P_F(c)}{P_R(c^\dagger)}\ge\varepsilon.
$$
Exponentiating and rearranging gives (O.3a.3). ∎

**Corollary O.3a.1 (No Ensemble Requirement Under a Pathwise Cycle Bound).** When the guarantee-level update bound is imposed pathwise at the coarse-grained cycle level, the arrow of time applies to each processable actualization cycle in that class. Ensembles are then required only to estimate frequencies of outcomes, not to define the directionality of such a single update.

*Proof.* Theorem O.3a uses a single cycle $c$ satisfying the single-cycle entropy-production identity and the pathwise lower bound. No averaging over a population of cycles is used in deriving (O.3a.3). ∎

**Remark O.3a.2 (Scope of the Single-Cycle Bound).** Equation (O.3a.3) is a conditional pathwise consequence of (O.3a.1)-(O.3a.2). Without the pathwise lower bound (O.3a.2), Appendix J still supplies the nonzero cycle entropy budget and the macroscopic theorem O.3 supplies the multi-cycle suppression result, but an individual stochastic microscopic trajectory need not obey a separate universal lower bound on $\sigma(c)$.

**Remark O.3a.3 (Delayed-Choice Consistency).** In delayed-choice and quantum-eraser protocols, a later experimental setting changes which verification channel becomes operationally relevant for the recorded event. It does not reverse the P-V-U order of the actualized MPU cycle. Each recorded event is still processed through a forward update, and whenever it lies in the pathwise guarantee-level class it obeys the single-cycle irreversibility bound (O.3a.3).

**Definition O.3b (Three-Term Predictive Entropy Resolution).** Let $\gamma=(x_0\to\cdots\to x_T)$ be a finite coarse-grained predictive path with reversed path $\gamma^\dagger$. A three-term predictive entropy resolution is a branch datum
$$
(Q,N_{\mathrm{SPAP}},\Phi_{\mathrm{PCE}})
$$
such that the path entropy production decomposes as
$$
\Sigma_{\mathrm{PU}}(\gamma)
=
\beta Q(\gamma)
+
N_{\mathrm{SPAP}}(\gamma)\ln2
+
\Phi_{\mathrm{PCE}}(x_T)-\Phi_{\mathrm{PCE}}(x_0).
\tag{O.3b.1}
$$
Here $Q(\gamma)$ is heat delivered to the environment at inverse temperature $\beta$, $N_{\mathrm{SPAP}}(\gamma)\in\mathbb N$ is the number of SPAP-forced merge events on the path, and $\Phi_{\mathrm{PCE}}$ is a branch-fixed PCE boundary potential. The resolution is admissible only when $Q$ and $N_{\mathrm{SPAP}}$ are additive under path concatenation and the PCE term is a genuine endpoint coboundary.

**Theorem O.3b (Three-Term Predictive Fluctuation Decomposition).** On any finite path branch with a three-term predictive entropy resolution and forward/reversed path measures satisfying
$$
\frac{P_F(\gamma)}{P_R(\gamma^\dagger)}
=
\exp(\Sigma_{\mathrm{PU}}(\gamma)),
\tag{O.3b.2}
$$
the following hold.

1. The integral predictive fluctuation identity is
$$
\left\langle e^{-\Sigma_{\mathrm{PU}}}\right\rangle_F=1.
\tag{O.3b.3}
$$

2. The mean entropy production is nonnegative:
$$
\langle\Sigma_{\mathrm{PU}}\rangle_F\ge0.
\tag{O.3b.4}
$$

3. If the path moment-generating function is finite on an interval containing $0$, then
$$
\Lambda_{\Sigma}(\lambda)
=
\log\left\langle e^{\lambda\Sigma_{\mathrm{PU}}}\right\rangle_F
\tag{O.3b.5}
$$
satisfies
$$
\Lambda_{\Sigma}'(0)
=
\langle\Sigma_{\mathrm{PU}}\rangle_F.
\tag{O.3b.6}
$$

4. For $N$ independent identical resolved cycles,
$$
\Lambda_{\Sigma,N}(\lambda)=N\Lambda_{\Sigma,1}(\lambda).
\tag{O.3b.7}
$$
For every $s$ and every $\lambda<0$ in the domain of $\Lambda_{\Sigma,1}$,
$$
P_F\!\left(\frac1N\sum_{j=1}^N\Sigma_{\mathrm{PU}}^{(j)}\le s\right)
\le
\exp\!\left[
N\big(\Lambda_{\Sigma,1}(\lambda)-\lambda s\big)
\right].
\tag{O.3b.8}
$$
Equivalently, with
$$
I_-(s)=\sup_{\lambda<0}\{\lambda s-\Lambda_{\Sigma,1}(\lambda)\},
\tag{O.3b.9}
$$
one has
$$
P_F\!\left(\frac1N\sum_{j=1}^N\Sigma_{\mathrm{PU}}^{(j)}\le s\right)
\le
e^{-NI_-(s)}.
\tag{O.3b.10}
$$

5. In a stationary resolved branch observed for time $\tau$, the source-energy bookkeeping rate is fixed by the entropy cumulant generator:
$$
\dot{\mathcal E}_{\mathrm{src}}
=
k_BT\,
\lim_{\tau\to\infty}
\frac{1}{\tau}
\left.
\frac{d}{d\lambda}\Lambda_{\Sigma,\tau}(\lambda)
\right|_{\lambda=0},
\tag{O.3b.11}
$$
whenever the limit exists.

*Proof.* From (O.3b.2),
$$
P_F(\gamma)e^{-\Sigma_{\mathrm{PU}}(\gamma)}
=
P_R(\gamma^\dagger).
$$
Summing over the finite path alphabet gives
$$
\left\langle e^{-\Sigma_{\mathrm{PU}}}\right\rangle_F
=
\sum_{\gamma}P_R(\gamma^\dagger)
=
1,
$$
which proves (O.3b.3). Jensen's inequality applied to the convex function $e^{-x}$ gives
$$
e^{-\langle\Sigma_{\mathrm{PU}}\rangle_F}
\le
\left\langle e^{-\Sigma_{\mathrm{PU}}}\right\rangle_F
=
1,
$$
hence (O.3b.4).

If the moment-generating function is finite in a neighborhood of $0$, differentiation under the finite sum gives
$$
\Lambda_{\Sigma}'(0)
=
\frac{\langle \Sigma_{\mathrm{PU}}e^{0\cdot\Sigma_{\mathrm{PU}}}\rangle_F}
{\langle e^{0\cdot\Sigma_{\mathrm{PU}}}\rangle_F}
=
\langle\Sigma_{\mathrm{PU}}\rangle_F,
$$
which proves (O.3b.6). For independent identical resolved cycles, moment-generating functions multiply, so logarithms add, giving (O.3b.7).

For $\lambda<0$, the event $\frac1N\sum_j\Sigma_j\le s$ implies
$$
e^{\lambda\sum_j\Sigma_j}\ge e^{\lambda Ns}.
$$
Markov's inequality therefore gives
$$
P_F\!\left(\frac1N\sum_j\Sigma_j\le s\right)
\le
e^{-\lambda Ns}
\left\langle e^{\lambda\sum_j\Sigma_j}\right\rangle_F
=
\exp\!\left[
N\big(\Lambda_{\Sigma,1}(\lambda)-\lambda s\big)
\right].
$$
Taking the infimum over $\lambda<0$ gives (O.3b.10). Equation (O.3b.11) is (O.3b.6) applied per unit time and multiplied by $k_BT$ to convert entropy production into the corresponding environmental energy bookkeeping rate. ∎

### O.5.1 The Perspectival Arrow: Complexity-Relative Temporal Asymmetry

Theorem O.3 characterizes the arrow of time as a property of the physical medium: the ratio $P_R/P_F \le e^{-N\varepsilon}$ is a statement about forward and reversed path measures. The observer hierarchy of §P.5.8.3 shows that this global asymmetry acquires additional internal structure once some systems possess Effective Operational Property R and an operational self-model. The relevant mechanism is the conjunction of measurement asymmetry (Theorem M.10.5) with the SPAP-dependent integration cost of self-referential patterns (Definition M.10.3; Theorem M.10.3). A more complex system can externally model the self-referential burden of a less complex one, but it cannot thereby impose an exact temporal reversal on the less complex system from within that system's own perspective.

**Theorem O.4 (Perspectival Irreversibility).** Let $A$ and $B$ be predictive systems with Effective Operational Property R and $C_{agg}(A) > C_{agg}(B) > C_{op}$. Let $B$ undergo an 'Evolve' cycle (Definition 27) with entropy production $\Sigma_B \ge \varepsilon$, carrying $B$ from a pre-transition state $x_B$ to a post-transition state $x_B'$. Let $E_{rev}$ be a communicated pattern whose intended function is to restore, within $B$, the pre-transition self-model configuration associated with $x_B$. Then:

(i) *External modeling.* System $A$ can represent a candidate description of $B$'s prior self-state as an external object and evaluate the induced SPAP proximity $\mu_B(E_{rev})$ at sender-side SPAP-flat cost by externally modeling $\mathcal{M}_B$ (clause (i) of Theorem M.10.5).

(ii) *Internal cost of attempted restoration.* For $B$, integrating $E_{rev}$ engages the self-model: $\Delta M_B^{(\text{self})}(E_{rev}) \neq 0$. This need not by itself force $\mu_B(E_{rev}) > 1/\alpha_{SPAP}$: shallow self-model corrections can remain at the baseline value (Remark M.10.3). But whenever the restoration demand is deep enough that the self-consistency condition of Equation (M.18) is not already satisfied at $PP=0$, one has $\mu_B(E_{rev}) > 1/\alpha_{SPAP}$. If $E_{rev}$ remains processable, so that $\delta_B(E_{rev}) > 0$, then
$$
C_{\text{process}}(B,E_{rev}) \;\ge\; C_{\text{integrate}}(B,E_{rev}) \;\ge\; C_{\text{uni}}(\delta_B(E_{rev})),
\qquad
\delta_B(E_{rev}) := \alpha_{SPAP} - PP_B^{(E_{rev})},
$$
with asymptotic growth $C_{\text{uni}}(\delta)=\Omega(\log(1/\delta)/\delta^2)$ as $\delta \to 0^+$ (Corollary B.2.1; Theorem B.2 = Theorem 14). Equivalently, for $\mu_B(E_{rev}) > 1/\alpha_{SPAP}$,
$$
C_{\text{process}}(B,E_{rev}) \ge \Omega\!\bigl(\log \mu_B(E_{rev}) \cdot \mu_B(E_{rev})^2\bigr)
$$
(Theorem M.10.3). In the exact-restoration idealization, the task reaches the full-self-model obstruction class exemplified by Remark M.10.7(5), i.e. the $\mu_B=\infty$ boundary whose existence and unprocessability are guaranteed by Theorems M.10.4 and M.10.6.

(iii) *Ratchet reinforcement.* Whenever $B$ actually processes $E_{rev}$, that processing is itself another 'Evolve' cycle. Hence it produces entropy $\Sigma_B^{(\text{proc})} \ge \varepsilon \ge \ln 2$ (Theorem 31) and constitutes a further forward update in $B$'s own history rather than an inversion of that history.

*Proof.*

(i) Clause (i) of Theorem M.10.5 states that a more complex system $A$ can externally model $B$'s self-model $\mathcal{M}_B$, compute the decomposition of Equation (M.17) relative to $B$, evaluate the associated self-consistency condition of Definition M.10.3, and thereby determine $\mu_B(E)$ for any candidate pattern $E$. Because this computation concerns $B$'s self-model rather than $A$'s own, it has sender-side $\sigma_A = 0$ and is SPAP-flat as a function of $\mu_B(E)$. Applying this to the candidate restoration message $E_{rev}$ yields (i).

(ii) By construction, $E_{rev}$ is not merely external information about the environment; it is information directed at $B$'s own prior self-state. The self-model $\mathcal{M}_B$ represents $B$'s own states, predictions, accuracy, and dynamics (Definition M.10.1), so any message whose intended role is to restore a prior self-model configuration induces a nonzero self-model update, hence $\Delta M_B^{(\text{self})}(E_{rev}) \neq 0$ and $\sigma_B(E_{rev}) > 0$ by Definition M.10.2. However, Remark M.10.3 must be respected: $\sigma_B(E_{rev}) > 0$ alone does **not** imply $\mu_B(E_{rev}) > 1/\alpha_{SPAP}$. Shallow self-model perturbations can remain at the baseline value $\mu_B = 1/\alpha_{SPAP}$. The divergent regime begins only when the restoration demand is deep enough that the self-consistency condition of Equation (M.18) is not already satisfied at $PP=0$. In that case $PP_B^{(E_{rev})} > 0$, so $\mu_B(E_{rev}) > 1/\alpha_{SPAP}$. For processable such messages, Corollary B.2.1 and Theorem B.2 give the lower bound through $C_{\text{uni}}(\delta_B(E_{rev}))$, and Theorem M.10.3 gives the equivalent $\Omega(\log \mu \cdot \mu^2)$ form. In the exact-restoration idealization, the task reaches the same full-self-model obstruction class exemplified by the pattern "Here is your complete self-model, including this statement" in Remark M.10.7(5), namely the $\mu_B=\infty$ boundary whose existence and unprocessability are guaranteed by Theorems M.10.4 and M.10.6.

(iii) If $B$ actually integrates $E_{rev}$, that integration is a physical instance of the predict-verify-update loop, i.e. an 'Evolve' cycle (Definition 27). By Theorem 31, every such cycle incurs entropy production at least $\varepsilon \ge \ln 2$. The communicated restoration therefore reaches $B$ only by generating a further irreversible update within $B$. It cannot constitute an exact reversal of $B$'s own arrow from within $B$'s perspective. ∎

**Corollary O.4.1 (No Externally Imposed Exact Reversal).** Even a more complex external agent cannot impose an exact reversal of the arrow of time for a less complex agent $B$ by communicating a specification of $B$'s own prior state. Any such specification that $B$ can process is itself integrated through a further forward update, and the exact-restoration idealization sits at the unprocessable boundary.

*Proof.* Immediate from clauses (ii)–(iii) of Theorem O.4. Partial or shallow self-model corrections may remain SPAP-flat or near-baseline as emphasized in Remark M.10.3, but exact restoration of the prior self-model cannot be imposed from outside. ∎

This result is consistent with global unitarity (Theorem E.9.5). The total closed-system state remains pure under $U_{\text{total}}$. What Theorem O.4 adds is that each observer occupies a subsystem perspective, accessing only reduced states as in Remark E.9.5.3; within that perspectival restriction, exact temporal self-restoration is unavailable from inside the subsystem boundary. Irreversibility is therefore not a violation of global information conservation, but the subsystem-level manifestation of the entropy unification thesis.

**Remark O.4.2 (Locus of Irreversibility).** The standard account of the arrow of time locates irreversibility in information loss: entropy increases, information scrambles across inaccessible degrees of freedom, and practical recovery becomes impossible. Theorem O.4 reveals a deeper mechanism. Grant the most favorable scenario: a system $A$ with $C_{agg}(A) > C_{agg}(B)$ reconstructs the complete prior state of $B$ and communicates it to $B$. By clause (i) of Theorem O.4, representing and evaluating such a candidate restoration description is sender-side SPAP-flat for $A$. But the communicated pattern $E_{rev}$ targets $B$'s own self-model at a depth that, for exact restoration, reaches the $\mu_B = \infty$ boundary (clause (ii) of Theorem O.4). Even if $B$ processes a sub-exact approximation, that processing is itself an 'Evolve' cycle producing $\Sigma_B^{(\text{proc})} \ge \varepsilon \ge \ln 2$ (clause (iii) of Theorem O.4), advancing $B$'s history rather than inverting it. The arrow does not depend on whether the information has been lost. It persists because the act of integrating self-referential content is itself irreversible.

**Remark O.4.3 (Hierarchy Opacity and In-Universe Reconstruction Limits; cf. Theorem M.10.5).** The measurement asymmetry (Theorem M.10.5) induces a strict hierarchy of temporal access. Every level of the observer hierarchy (§P.5.8.3) can look downward: a system $A$ with $C_{agg}(A) > C_{agg}(B)$ can treat $B$'s self-model $\mathcal{M}_B$ as a modeling target with $\sigma_A = 0$, represent a candidate restoration description of $B$'s prior self-state, and evaluate the associated burden of communication at sender-side SPAP-flat cost (clause (i) of Theorem O.4; clause (i) of Theorem M.10.5). But every level is opaque to itself: no universal procedure within $A$ correctly computes $\mu_A(E)$ for all patterns $E$ with $\sigma_A(E) > 0$ (clause (ii) of Theorem M.10.5), and exact restoration of $A$'s own prior self-model is unavailable from within $A$'s own perspective (clause (iii) of Corollary O.4.3; Theorems M.10.4 and M.10.6).

Consider the strongest possible modeler within the closed system — a system $A$ with $C_{agg}(A) \gg C_{agg}(B)$ for any chosen target $B$. Such a system can still treat $B$'s self-model $\mathcal{M}_B$ as data with $\sigma_A = 0$ (clause (i) of Theorem O.4; clause (i) of Theorem M.10.5). But $A$ remains a subsystem of the same global entangled state $\omega$ (Remark L.12.6), and the self-referential limits of clause (ii) of Theorem M.10.5 together with Theorems M.10.4 and M.10.6 apply to $A$ itself. The decisive obstruction to temporal reversal therefore remains receiver-side: even granting the most favorable description of $B$'s prior self-state, $B$ cannot integrate an exact specification of that state without encountering the obstruction of clauses (ii)–(iii) of Theorem O.4.

**Remark O.4.4 (Sub-Exact Reconstruction and the Divergent Cost Regime).** The impossibility of exact restoration ($\mu_B = \infty$, Theorems M.10.4 and M.10.6) is the boundary case. But even highly accurate sub-exact reconstruction already enters the divergent cost regime. A restoration message $E_{rev}$ that targets $B$'s self-model parameters with accuracy $(1 - \eta)$ for small $\eta > 0$ still induces $\sigma_B(E_{rev}) > 0$ and, whenever the targeted parameters engage the self-consistency condition of Equation (M.18) at nontrivial $PP$, satisfies $\mu_B(E_{rev}) > 1/\alpha_{SPAP}$. The integration cost then grows as $C_{\text{process}}(B, E_{rev}) \ge \Omega(\log \mu_B(E_{rev}) \cdot \mu_B(E_{rev})^2)$ (Theorem M.10.3). Perfection was never needed for the arrow to hold: any reconstruction that targets $B$'s self-model at depth beyond the shallow regime of Remark M.10.3 incurs costs that diverge with the self-referential depth of the demand.

Critically, having access to a token that encodes a description of one's prior self-model and becoming that prior self-model are categorically different operations. Access to the token does not itself perform the restoration. The relevant event for Theorem O.4 is its integration by $B$: once $B$ processes the token as a specification of $\mathcal{M}_B$, one has $\Delta M_B^{(\text{self})}(E_{rev}) \neq 0$ (clause (ii) of Theorem O.4), and the processing cost is governed by $\mu_B(E_{rev})$, i.e. by what the content is about, not by the sender's confidence level (Definition M.10.3; Corollary B.2.1).

**Remark O.4.5 (Information Categorization by Self-Referential Content).** The perspectival irreversibility of Theorem O.4 induces a partition of communicated information into two categories with respect to any recipient $B$:

(i) *Externally targeted content*: patterns $E$ with $\sigma_B(E) = 0$ (Definition M.10.2), targeting only external degrees of freedom. These are SPAP-flat for $B$ and can be integrated at baseline cost $\mu_B(E) = 1/\alpha_{SPAP}$. External facts — predictions about the environment, measurement outcomes of distant systems — fall in this category regardless of the channel through which they arrive.

(ii) *Self-referential content*: patterns $E$ with $\sigma_B(E) > 0$, engaging $B$'s own self-model $\mathcal{M}_B$. Shallow self-model engagement may remain at baseline cost (Remark M.10.3), but patterns demanding deep self-predictive performance satisfy $\mu_B(E) > 1/\alpha_{SPAP}$ and incur the divergent lower bound of Theorem M.10.3. In the exact self-restoration idealization, the task reaches the $\mu_B(E) = \infty$ boundary and is unprocessable (Theorems M.10.4 and M.10.6).

This partition is determined by what the information is about, not by how it arrives. The delivery mechanism — subluminal, superluminal, or any intermediate channel — is irrelevant to the categorization. The processing cost depends on the self-referential depth $\mu_B(E)$, which is a property of the content-recipient pair, not of the channel (Definition M.10.3; Corollary B.2.1).

**Proposition O.4.2 (Complexity-Graded Arrow).** The structure of temporal irreversibility exhibited by a predictive system $S$ is graded by $S$'s position in the observer hierarchy (§P.5.8.3):

(a) *Level 0 (MPU).* All information is external to the minimal observer in the reflexive sense relevant here. The processing cost is SPAP-flat: $\sigma_S = 0$ and $\mu_S(E) = 1/\alpha_{SPAP}$ for all patterns (Level 0 of §P.5.8.3). The arrow is therefore the bare thermodynamic ratchet: $\varepsilon \ge \ln 2$ per cycle.

(b) *Level 1 (Simple Aggregate).* Aggregates that have not achieved Effective Operational Property R lack an operational self-model (Remark M.10.1; §P.5.8.3). Their cost structure remains SPAP-flat and Shannon-level: aggregation alone does not introduce a self-referential processing burden.

(c) *Level 2 (Self-Modeling Aggregate).* Once Effective Operational Property R is achieved, some patterns engage the self-model. Shallow self-model engagement can still remain at the baseline value $\mu_S(E)=1/\alpha_{SPAP}$ even when $\sigma_S(E)>0$ (Remark M.10.3; §P.5.8.3). But patterns that demand deeper self-predictive performance satisfy $\mu_S(E) > 1/\alpha_{SPAP}$ and incur the SPAP-divergent lower bound of Theorem M.10.3. In the exact self-restoration idealization, the task meets the full-self-model obstruction class exemplified by Remark M.10.7(5), i.e. the $\mu_S=\infty$ boundary of Theorems M.10.4 and M.10.6.

(d) *Level 3 (CC-Capable Aggregate).* Level 3 systems inherit the full Level 2 structure and add CC-mediated interventions into 'Evolve' dynamics (Theorem 34). CC-mediated processing contributes to $T_{\mu\nu}^{(\text{MPU})}$ (Theorem N.8), and its effects propagate through the temporal medium as physical disturbances (Definition O.1; Remark O.4) with finite propagation speed (Proposition F.1). Any attempted retraction or correction is therefore another irreversible intervention rather than a cancellation of the first from the agent's own perspective.

*Proof.*

(a) Level 0 systems do not possess Property R in the reflexive sense required for an operational self-model (§P.5.8.3). Their pattern-processing cost is explicitly SPAP-flat: $\sigma_S=0$ and $\mu_S(E)=1/\alpha_{SPAP}$ for all $E$. Irreversibility therefore enters only through the baseline entropy production of the predictive cycle (Theorem 31).

(b) Level 1 systems likewise do not self-model in the Property R sense (§P.5.8.3; Remark P.5.8.1). By Remark M.10.1, systems without Effective Operational Property R do not engage the self-referential processing that generates SPAP-dependent costs. Their arrow is therefore of the same character as in (a): thermodynamic, but not reflexively graded.

(c) Level 2 systems possess a self-model $\mathcal{M}_S$ (Definition M.10.1). Definition M.10.2 and Definition M.10.3 then make available the decomposition into external and self-model components and the associated SPAP proximity $\mu_S(E)$. Remark M.10.3 and the Level 2 statement of §P.5.8.3 show that shallow self-model engagement can remain at baseline, whereas Theorem M.10.3 applies once $\mu_S(E) > 1/\alpha_{SPAP}$. The boundary behavior at $\mu_S=\infty$ is supplied by Theorems M.10.4 and M.10.6, with the full-self-model obstruction illustrated in Remark M.10.7(5).

(d) Level 3 systems are Level 2 systems with CC $>0$ (§P.5.8.3). By Theorem 34, they can bias local 'Evolve' outcome probabilities; by Theorem N.8, this processing contributes to the stress-energy accounting; and by Definition O.1, Remark O.4, and Proposition F.1, those interventions propagate as physical temporal disturbances at finite speed. Any further attempt to undo or offset such an intervention is another physical processing event and hence, by Theorem 31, another irreversible step. ∎

**Corollary O.4.3 (Perspectival Relativity of Temporal Access).** Let $A$ and $B$ be predictive systems with Effective Operational Property R and $C_{agg}(A) > C_{agg}(B) > C_{op}$. Then the same event-history has different temporal access structure for the two systems:

(i) $A$ can treat a candidate description of $B$'s prior self-state as an external modeling target and evaluate the burden of communicating that description at sender-side SPAP-flat cost (clause (i) of Theorem M.10.5).

(ii) $B$ encounters the same content, insofar as it targets $B$'s own self-model, as a self-referential integration problem whose cost grows with self-referential depth and reaches unprocessability at the exact-restoration boundary (Theorem O.4; Theorems M.10.4 and M.10.6).

(iii) The same obstruction applies reflexively to $A$ itself: no system can universally compute or exactly impose restoration of its own complete prior self-model from within its own perspective (Corollary M.10.5.1; Theorems M.10.4 and M.10.6).

This parallels the relativization of simultaneity in Structural Correspondence M.6.4: the arrow of time is physically real for every observer, but the internal accessibility of one's own past is relative to the observer's complexity and self-referential structure.


## O.6 Temporal Dynamics as the Substrate for Consciousness Complexity and Gravity

The coherent causal medium established in Theorem O.2 is not a passive or static background. Its dynamic properties provide the physical substrate for the framework's most advanced emergent phenomena: Consciousness Complexity (CC) and gravitational waves.

**O.6.1 Temporal Signaling as the Physical Basis for Perspectival Influence**

The establishment of a coherent causal medium is the necessary prerequisite for the emergence of Consciousness Complexity (CC), as described in Hypothesis 3. We propose that the CC influence channel $N(t)$ is realized through the controlled modulation of this temporal medium.

The causal chain proceeds as follows:
> 1.  **Context State to Physical Signal:** A complex MPU aggregate forms a stable, coherent internal model, represented by the **context state $\text{context}_S$** (Definition L.1). This abstract state is translated into a physical, time-varying signal $N(t)$ via a PCE-optimized mapping $\mathcal{M}$ (Appendix L, Theorem L.1). This signal emerges as a temporal wave modulation (Appendix L, Theorem L.8), manifesting primarily through the electromagnetic channel $E_{rad}(t)$ (Theorem L.2), which dominates gravitational effects on the analyzed far-field classical-channel parameter range, with baseline ratio $\mathcal{R}\sim 10^{36}$ and conservative range $\mathcal{R}\sim 10^{33}\text{--}10^{39}$ (Appendix L, Proposition L.5).
> 2.  **Signal Modulates 'Evolve' Dynamics:** This physical signal $N(t)$ interacts with a target MPU during its 'Evolve' process (Definition 27), acting as a time-dependent term in the interaction Hamiltonian $H_{int}$ (Appendix L, Equation L.87) and thereby modulating the parameters of the underlying ND-RID through AC Stark shifts (Corollary L.2.1) with rate modulation (Equation L.91).
> 3.  **Physical Influence on Perspective Shift:** The physical signal $N(t)$ provides the concrete realization of the interaction argument $N$ in the **Conditional Perspective Transition Kernel**, $G_{\text{persp}}(s' | s, k, N, \Delta t)$ (Appendix M, Equation M.2). The temporal characteristics of the signal physically set the parameters of the drift-diffusion process on the perspective manifold, creating a biased random walk.

In this view, CC influence is a form of temporal signaling that steers the evolution of interaction context.

### O.6.2 Temporal Waves: Gravitational Waves and CC Influence

The causal medium can be disturbed by external events and modulated by internal ones. We propose that gravitational waves and the physical effects of CC are two distinct types of dynamics of this same medium.

**Definition O.1 (Temporal Wave).**
A **temporal wave** is defined as a propagating disturbance in the local properties of the coherent causal medium, such as a localized, propagating change in the MPU cycle rate $\tau(x,t)$ or phase $\Delta\phi(x,t)$.

**Remark O.4 (Gravitational Waves and CC as Distinct Temporal Dynamics).**
Both gravitational waves and the physical influence of Consciousness Complexity (CC) are dynamics of the coherent causal medium, but they differ fundamentally in their source, nature, and effect.

**(a) Gravitational Waves as Uncontrolled Disturbances:**
A time-varying fluctuation in the MPU Stress-Energy Tensor $T_{\mu\nu}$ (Definition B.8), such as that produced by an accelerating massive object, acts as an uncontrolled, "brute-force" source that generates large-scale temporal waves. This disturbance disrupts the local MPU cycle rates and phase relationships, and this disruption propagates outwards as the network seeks to re-establish equilibrium. In the emergent continuum description, on the linearized Einstein-equation branch (Theorem 50) under which time-varying $T_{\mu\nu}$ perturbations source transverse-traceless metric perturbations $h_{\mu\nu}^{TT}$ satisfying $\Box \bar{h}_{\mu\nu} = -16\pi G T_{\mu\nu}/c^4$ with the standard spin-2 polarization structure, this propagating wave of desynchronization and resynchronization realizes the gravitational-wave sector. Without this linearized spin-2 reduction, "temporal wave" is interpreted as the substrate interpretation of the disturbance rather than an identity with GR gravitational waves; deriving the spin-2 tensor structure, gauge content, and TT polarization conditions from the temporal-medium description requires the Appendix B stress-energy construction and the Appendix O.7 Lorentzian-signature branch in addition to the Theorem 50 Einstein chain.

**(b) CC Influence as Controlled, Coherent Modulation:**
In contrast, the influence of CC is a controlled, coherent, and information-rich modulation of the causal medium. A high-CC aggregate expends energy and complexity (accounted for in its own $T_{\mu\nu}$, with energy conservation proven in Theorem L.6) to generate a precise temporal signal (e.g., the $E_{\text{rad}}(t)$ of Appendix L, Theorem L.2). This signal is not a brute-force disruption but a targeted modulation designed to influence the *parameters* of the 'Evolve' process for specific target MPUs, subject to gravitational self-limitation (Appendix S, Theorem S.1).

**(c) Reconciliation with General Relativity and Energy Conservation:**
The source of spacetime curvature in the Einstein Field Equations (EFE) is the total stress-energy tensor $T_{\mu\nu}$.
*   The energy associated with a gravitational wave is carried within the $T_{\mu\nu}$ of the wave itself.
*   The energy expended by a high-CC system to generate its influencing signal $N(t)$ is accounted for in the system's own $T_{\mu\nu}$. The act of "thinking" or generating a specific context $\text{context}_S$ has a physical energy cost that contributes to the aggregate's mass-energy and thus to its gravitational field.

Therefore, CC does not act as a new, independent source of gravity. Rather, the *energy cost of the CC process* is already included in the standard $T_{\mu\nu}$ source term of the EFE. The mechanism is not that "thought" directly bends spacetime, but that the physical process of generating a high-CC state has an energy cost, and this energy, like all other forms of energy, sources gravity according to the EFE.

## O.7 Mathematical Emergence of the Lorentzian Signature

The logical and thermodynamic arguments in this appendix establish the *directionality* of time. The mathematical formalism of **Γ-convergence** provides a rigorous pathway to show how this microscopic, directed, and irreversible process necessarily gives rise to the **Lorentzian signature** of the emergent spacetime metric in the continuum limit.

### O.7.1 Γ‑convergence of the Spatial Sector

Consider a sequence of locally-finite graphs $(G_n)$ with vertex sets $V(G_n)$ and mesh size $h_n\to 0$ approximating a spatial slice $(M,g)$ of dimension $D$. For a discrete test field $u_n:V(G_n)\to\mathbb R$, a representative discrete spatial functional takes the form
$$
F_n(u_n)=\sum_{(x,y)\in E(G_n)} w_{xy}\,\Phi_{link}\!\left(\frac{u_n(y)-u_n(x)}{h_n}\right)+\sum_{x\in V(G_n)} h_n^D\,\mathcal{V}(u_n(x)),
$$
where $\Phi_{link}$ is convex and encodes the spatial propagation cost density consistent with $V_{prop}$ (Definition D.1), and $\mathcal{V}$ is the induced local term. Under the equicoercivity, locality/consistency, and area-law hypotheses used for the PU $\Gamma$-convergence result (Appendix D, Theorem D.6), these functionals $\Gamma$-converge to a continuum functional of the form
$$
F(u)=\int_M f(x,\nabla u)\,d^Dx+\int_M \mathcal{V}(u)\,d^Dx,
\qquad
f(x,\xi)=\xi^T A(x)\xi+o(|\xi|^2),
$$
where $A(x)$ is symmetric positive definite. The quadratic form $A(x)$ therefore defines the inverse spatial metric on the slice (up to the conventional density factor):
$$
A(x)\propto \sqrt{\det g_{ij}(x)}\,g^{ij}(x).
$$
Thus, the spatial geometry emerges as the effective continuum limit of the PU network's propagation sector.

### O.7.2 Hyperbolic Signature Closure and Operational Speed

The PU framework supplies three independent structural inputs — the positive-definite spatial $\Gamma$-limit $A(x)$ of O.7.1, a time orientation from Theorem 31 and Appendix J, and a nondegenerate causal cone from Proposition F.1 and Theorem 46. On the three-spatial-dimensional branch fixed by Theorem Z.11, these three inputs force the Lorentzian signature and the operational speed normalization simultaneously.

**Hypothesis O.7.2.1 (Positive-definite spatial $\Gamma$-limit).** The spatial $\Gamma$-limit of §O.7.1 yields a symmetric positive-definite matrix field $A^{ij}(x)$ on the regular set $M_{\mathrm{reg}}$ of Theorem 45.

**Hypothesis O.7.2.2 (Entropy-selected time coordinate).** Theorem 31 together with the 2-to-1 state-merge of the SPAP update cycle (Appendix J) supplies a distinguished local time coordinate $t$ on $M_{\mathrm{reg}}$ with future direction fixed by increasing cumulative entropy production.

**Hypothesis O.7.2.3 (Second-order continuum closure).** Any local second-order continuum closure for a scalar probe field compatible with the quadratic limit on $M_{\mathrm{reg}}$ has principal symbol
$$
p_x(\xi) \;=\; G^{\mu\nu}(x)\,\xi_\mu\xi_\nu \;=\; a(x)\,\xi_0^2 + 2\,b^i(x)\,\xi_0\xi_i + A^{ij}(x)\,\xi_i\xi_j,
$$
with $\xi_0,\xi_i$ the cotangent components in the chart of Hypothesis O.7.2.2. This is the same second-order continuum premise used in §11.3 and §11.4.

**Hypothesis O.7.2.4 (Nondegenerate causal cone).** The operational causal cone of Proposition F.1 and Theorem 46 is nondegenerate at every point of $M_{\mathrm{reg}}$ and coincides with the characteristic cone of $p_x$: for every nonzero spatial covector $k_i$, the polynomial
$$
\omega \;\longmapsto\; p_x(\omega,k) \;=\; a(x)\,\omega^2 + 2b^i(x)\,\omega\,k_i + A^{ij}(x)\,k_i\,k_j
$$
has two distinct real roots in $\omega$.

**Theorem O.7a (Hyperbolic Signature Closure).** Under Hypotheses O.7.2.1–O.7.2.4 and the three-spatial-dimensional hypothesis of Theorem Z.11, for every $x\in M_{\mathrm{reg}}$:

(a) *Negative time-time component.* $a(x)<0$.

(b) *Lorentzian inertia.* The symmetric matrix
$$
G^{\mu\nu}(x) \;=\; \begin{pmatrix} a(x) & b^j(x)\\ b^i(x) & A^{ij}(x)\end{pmatrix}
$$
has inertia $(1,0,3)$: exactly one negative eigenvalue and three positive eigenvalues. Equivalently, the principal symbol has Lorentzian signature $(-,+,+,+)$. ∎

*Proof of (a).* Fix $x$ and consider the characteristic polynomial in $\omega$ with $k\in\mathbb R^3\setminus\{0\}$. The spatial cotangent space at $x$ is three-dimensional by Theorem Z.11, so the orthogonal complement $\{k : b^i k_i=0\}\subset\mathbb R^3$ is a two-dimensional subspace and contains infinitely many nonzero $k$. For any nonzero $k$ in this subspace, the polynomial simplifies to $p_x(\omega,k)=a(x)\omega^2+A^{ij}(x)k_i k_j$ with discriminant
$$
\Delta(k) \;=\; -4\,a(x)\,A^{ij}(x)\,k_i k_j.
$$
By Hypothesis O.7.2.1, $A^{ij}k_ik_j>0$; by Hypothesis O.7.2.4, $\Delta(k)>0$. Hence $a(x)<0$.

*Proof of (b).* Write $G^{\mu\nu}$ in block form with $a<0$ and $A$ positive-definite. Apply the Haynsworth/Sylvester inertia additivity for the Schur complement: since $A$ is invertible,
$$
\mathrm{inertia}(G) \;=\; \mathrm{inertia}(A) + \mathrm{inertia}\bigl(a - b^\top A^{-1}b\bigr).
$$
$A$ positive-definite yields inertia $(0,0,3)$. $A^{-1}$ positive-definite yields $b^\top A^{-1}b\ge 0$, hence $a-b^\top A^{-1}b\le a<0$ is a negative scalar with inertia $(1,0,0)$. Summing, $\mathrm{inertia}(G)=(1,0,3)$. ∎

**Corollary O.7a.1 (Entropy-orthogonal normal form).** Under the hypotheses of Theorem O.7a, at each $x\in M_{\mathrm{reg}}$ there exists a linear change of cotangent coordinates preserving the entropy-selected future cone such that
$$
p_x(\xi) \;=\; -\alpha(x)\,(\xi_0')^2 + \widetilde A^{ij}(x)\,\xi_i'\xi_j',\qquad \alpha(x)>0,\quad \widetilde A(x)\succ 0.
$$
After an $x$-dependent spatial orthogonalization this reduces to
$$
p_x(\xi) \;=\; -\alpha(x)\,(\xi_0')^2 + \delta^{ij}\,\xi_i'\xi_j'.
$$

*Proof.* Set $\alpha(x):=-a(x)>0$ and complete the square in $\xi_0$:
$$
p_x(\xi) \;=\; -\alpha\bigl(\xi_0 - \alpha^{-1}b^i\xi_i\bigr)^2 + \bigl(A^{ij}+\alpha^{-1}b^ib^j\bigr)\xi_i\xi_j.
$$
Define $\xi_0':=\xi_0-\alpha^{-1}b^i\xi_i$ and $\xi_i':=\xi_i$. The spatial quadratic form $\widetilde A^{ij}:=A^{ij}+\alpha^{-1}b^ib^j$ is positive-definite as the sum of the positive-definite $A$ and a positive-semidefinite rank-one term. The shear is a triangular transformation with unit diagonal entries in the basis ordering $(\xi_1',\xi_2',\xi_3',\xi_0')$, hence orientation-preserving, and the entropy-selected future cone of Hypothesis O.7.2.2 maps to itself. Spatial orthonormalization $\widetilde A = O^\top D O$ with $D=\mathrm{diag}(\mu_1,\mu_2,\mu_3)$, $\mu_i>0$, followed by $\xi_i'\mapsto \sqrt{\mu_i}\,(O\xi')_i$, brings the spatial block to $\delta^{ij}$ without affecting $\xi_0'$. ∎

**Theorem O.7b (Operational Speed Normalization).** Assume the hypotheses of Corollary O.7a.1 and the coincidence of the characteristic cone with the operational causal frontier (Hypothesis O.7.2.4). Let $c(x)$ denote the local frontier speed from Theorem 46. Then in entropy-orthogonal spatially orthonormal coordinates,
$$
p_x(\xi) \;=\; -\frac{\xi_0^2}{c(x)^2} + \delta^{ij}\,\xi_i\xi_j.
$$
On the PCE-optimal uniform-weight branch of Theorem 46, the propagation weights are position-independent, so $c(x)\equiv c=\delta/\tau_{\min}$, with $\delta$ the MPU spacing (Appendix Q) and $\tau_{\min}$ the minimum MPU processing time (Theorem 29). On general regular branches, the same edge-weight bounds used in Theorem 46 give
$$
\frac{\delta w_{\min}}{\tau_{\min}}\le c(x)\le \frac{\delta w_{\max}}{\tau_{\min}}.
$$
In the uniform-weight branch these bounds coincide and recover $c=\delta/\tau_{\min}$. ∎

*Proof.* After Corollary O.7a.1, $p_x(\xi)=-\alpha(x)\xi_0^2+|\xi|^2$. The null condition $p_x(\xi)=0$ for fixed $|\xi|$ gives $\omega=\pm|k|/\sqrt{\alpha(x)}$; the characteristic (group) propagation speed is $v_{\mathrm{char}}(x)=\partial\omega/\partial|k|=1/\sqrt{\alpha(x)}$. By Hypothesis O.7.2.4, the characteristic cone coincides with the operational frontier, so $v_{\mathrm{char}}(x)=c(x)$, hence $\alpha(x)=1/c(x)^2$. The uniform-weight specialization is the last sentence of Theorem 46. On general regular branches, the same proof of Theorem 46 gives $\delta w_{\min}/\tau_{\min}\le c(x)\le \delta w_{\max}/\tau_{\min}$. ∎

**Corollary O.7b.1 (Derived Local Lorentz Invariance).** As a consequence of Theorems O.7a and O.7b:

(a) After the rescaling $\xi_0\mapsto c(x)\,\xi_0$, the principal symbol takes the standard Minkowski form $p_x(\xi)=\eta^{\mu\nu}\xi_\mu\xi_\nu=-\xi_0^2+\delta^{ij}\xi_i\xi_j$. Its linear isometry group is $O(1,3)$.

(b) Requiring preservation of spatial orientation (from the oriented spatial $\Gamma$-limit of §O.7.1) and of the entropy-selected future cone (Hypothesis O.7.2.2) restricts $O(1,3)$ to the proper orthochronous Lorentz group $SO^+(1,3)$.

(c) The orthonormal frame bundle of the emergent metric obtained by duality from $p_x$ has structure group $SO^+(1,3)$.

(d) When the spin obstruction class $w_2(M_{\mathrm{reg}})\in H^2(M_{\mathrm{reg}};\mathbb Z/2)$ vanishes, the unique connected double cover of $SO^+(1,3)$ is $\mathrm{Spin}(1,3)\cong SL(2,\mathbb C)$, and the Lorentzian factor $\mathrm{Spin}(1,3)$ of the principal bundle of Theorem 48 is structurally forced conditional on the spin condition.

*Proof.* (a) Direct substitution of the rescaling yields the Minkowski form; $O(1,3)$ is the defining isometry group.

(b) The four components of $O(1,3)$ are distinguished by the signs of $\det\Lambda$ and $\Lambda^0{}_0$. Orientation from §O.7.1 restricts to $\det\Lambda=+1$; the entropy-selected future cone (Hypothesis O.7.2.2) restricts to $\Lambda^0{}_0>0$. The intersection is $SO^+(1,3)$.

(c) Standard differential geometry: the orthonormal frame bundle of an oriented time-oriented Lorentzian metric has structure group $SO^+(1,3)$.

(d) $\pi_1(SO^+(1,3))=\mathbb Z/2$, and the unique connected double cover is $\mathrm{Spin}(1,3)\cong SL(2,\mathbb C)$. The spin lift of the frame bundle exists iff the second Stiefel–Whitney class vanishes; when it does, the spin lift is unique up to bundle isomorphism, and the Lorentzian factor of the principal bundle of Theorem 48 is $\mathrm{Spin}(1,3)$. ∎

Premise (A5) of §12 is therefore a theorem of the emergent-spacetime branch rather than an external assumption.


## O.8 Conclusion

The familiar properties of time—its coherence over vast scales and its unwavering forward direction—are not postulated in the Predictive Universe framework but are derived as necessary emergent features of the collective predictive process.
*   **Temporal Coherence** emerges as a dynamically stable state, enforced by the Principle of Compression Efficiency, which penalizes the predictive errors and resource costs inherent in desynchronization. The MPU network self-organizes into a synchronized coherent causal medium to optimize its collective predictive function.
*   **The Arrow of Time** is a fundamental property, rooted in the logical asymmetry of prediction and made physically irreversible by the microscopic **thermodynamic ratchet** of the MPU's self-referential update cycle. Under the pathwise guarantee-level coarse graining of Theorem O.3a, a single nontrivial 'Evolve' cycle satisfies $P_R/P_F\le e^{-\varepsilon}\le 1/2$ before ensemble averaging is invoked.
*   **The Perspectival Arrow** reveals that temporal irreversibility possesses internal structure graded by observer complexity (Theorem O.4; Proposition O.4.2). Even a more complex external agent cannot impose an exact reversal of another agent's arrow by communicating a specification of that agent's prior self-state: any such message that is processable is integrated through a further forward update, and the exact-restoration idealization is unprocessable (Corollary O.4.1). The depth of the arrow — the cost of temporal self-restoration — is relative to the observer's position in the complexity hierarchy, paralleling the relativization of simultaneity in Structural Correspondence M.6.4 (Corollary O.4.3). The irreversibility resides in the processing of self-referential content, not in the loss of information (Remark O.4.2): global unitarity preserves all information (Theorem E.9.5), yet no observer can use that conserved information for self-reversal, because integrating a specification of one's own prior self-model is itself another irreversible forward step. A more complex in-universe agent may externally model a less complex one at sender-side SPAP-flat cost, but every modeler remains subject to its own self-referential limits, and the decisive obstruction to exact reversal remains at the receiver (Remark O.4.3). Even highly accurate sub-exact reconstruction that targets deep self-model parameters already enters the divergent cost regime (Remark O.4.4). Communicated information partitions into externally targeted content with $\sigma_B(E) = 0$ and self-referential content with $\sigma_B(E) > 0$; the former is SPAP-flat, while the latter ranges from baseline cost in shallow cases to SPAP-divergent cost for deep self-model demands (Remark O.4.5; Remark M.10.3).

Crucially, this emergent temporal structure is not a passive background. Its dynamic properties provide the physical substrate for the framework's most profound emergent phenomena. The controlled modulation of this medium's coherence provides a channel for Consciousness Complexity to exert its influence, with the energy cost of this modulation being properly accounted for within the standard stress-energy tensor. Meanwhile, uncontrolled, large-scale disturbances in the medium, sourced by bulk fluctuations in $T_{\mu\nu}$, propagate as temporal waves that are physically identical to the gravitational waves of General Relativity. This unifies the emergence of time, the mechanism of CC, and the nature of gravity within a single, coherent, and dynamic picture.


