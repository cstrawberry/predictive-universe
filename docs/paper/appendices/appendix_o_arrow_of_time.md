# Appendix O: Temporal Coherence and the Arrow of Time in the Predictive Universe

## O.1 Introduction: The Problem of Temporal Coherence

The Predictive Universe (PU) framework is built upon the operational dynamics of interacting Minimal Predictive Units (MPUs). As established in Theorem 4, the very act of prediction requires a primitive, ordered, and directional concept of evolution, which we identify with local time. Each MPU, through its cyclical operation, effectively possesses its own internal "clock." However, the existence of these local causal rhythms does not, in itself, explain the emergence of the coherent, large-scale temporal structure observed in the universe.

This appendix addresses this crucial issue. It does not attempt to derive the existence of time *ex nihilo*—a task fraught with logical circularity. Instead, it starts from the premise established in Theorem 4: the very act of prediction logically presupposes a primitive, ordered, and directional concept of evolution. We argue this is a non-negotiable prerequisite for any universe containing predictive agents. The central challenge addressed here is then threefold:
1.  **The Problem of Coherence:** How does a network of countless MPUs, each potentially operating on its own local causal timeline, achieve the vast domains of temporal synchronization necessary to support consistent physical laws and coherent structures?
2.  **The Problem of Directionality:** What physical mechanism enforces the observed, universal, and irreversible direction of time's flow—the arrow of time?
3.  **The Problem of Dynamics:** If time emerges from this synchronized medium, what is the nature of disturbances within it, and how does this temporal structure provide a substrate for advanced predictive phenomena like Consciousness Complexity (CC)?

This appendix develops branch-conditional results for these three problems. Under the statistical and cost-ledger hypotheses of Theorem O.1 and the connected low-noise detailed-balance hypotheses of Theorem O.2, desynchronization is penalized and stationary measures concentrate near synchronized configurations. Under the independent pathwise entropy-production certificates of Theorems O.3 and O.3a, forward histories are exponentially favored over their reversals. Section O.6 proposes a CC-modulation interpretation of the coherent medium, while the identification of temporal disturbances with gravitational waves is restricted to the linearized Einstein/spin-2 branch stated in Remark O.4. Section O.7 derives Lorentzian signature only under its four explicit structural hypotheses.

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

**Theorem O.1 (Local PCE Penalty for Desynchronization).** Fix an interacting edge $(i,j)$. Assume log-loss; a finite outcome alphabet and a family $p_j(y|t)$ such that every $p_j(y|t)>0$ and each coordinate is twice continuously differentiable near the comparison time; finite, positive temporal Fisher information
$$
I_j(t)=\sum_y\frac{(\partial_tp_j(y|t))^2}{p_j(y|t)}>0;
$$
and a small principal phase lag
$$
\delta t_{ij}=\frac{\tau_{\mathrm{medium}}}{2\pi}\Delta\phi_{ij}.
$$
Assume also that the PCE cost ledger assigns nonnegative propagation cost to added timing jitter and strictly positive operational cost to any compensating control that restores the synchronized prediction. Then a nonzero sufficiently small lag either produces a strict predictive-benefit loss or a strict compensation cost, and the local PCE potential exceeds its synchronized value. Without compensation,
$$
\Delta PE_{ij}(t)
=
\frac12I_j(t)
\left(\frac{\tau_{\mathrm{medium}}}{2\pi}\right)^2
(\Delta\phi_{ij})^2
+o((\Delta\phi_{ij})^2).
\tag{O.2}
$$

*Proof.* Under log-loss, using $p_j(\cdot|t)$ when the outcome law is $p_j(\cdot|t+\delta t)$ incurs the excess
$$
D_{\mathrm{KL}}\!\left(p_j(\cdot|t+\delta t)\,\middle\|\,p_j(\cdot|t)\right).
$$
Write $p_y=p_y(t)$ and $h=\delta t$. Coordinatewise Taylor expansion and $\log(1+x)=x-x^2/2+o(x^2)$ give
$$
p_y(t+h)\log\frac{p_y(t+h)}{p_y(t)}
=h\dot p_y+\frac{h^2}{2}\ddot p_y+\frac{h^2}{2}\frac{\dot p_y^2}{p_y}+o(h^2).
$$
The alphabet is finite and every $p_y$ is positive, so the remainders may be summed. Differentiating $\sum_yp_y(t)=1$ twice gives $\sum_y\dot p_y=\sum_y\ddot p_y=0$. Hence
$$
D_{\mathrm{KL}}(p(t+h)\|p(t))
=\frac{h^2}{2}\sum_y\frac{\dot p_y^2}{p_y}+o(h^2)
=\frac12I_j(t)h^2+o(h^2).
$$ Since $I_j(t)>0$, the divergence is strictly positive for every sufficiently small nonzero $\delta t$. Definition 7 makes predictive performance strictly decrease with this excess loss, hence increases $V_{\mathrm{PCE}}$ through $-V_{\mathrm{benefit}}$. If the loss is removed by compensation, the declared cost-ledger hypothesis gives a strict increase of $V_{\mathrm{op}}$, while the jitter contribution to $V_{\mathrm{prop}}$ is nonnegative. Substituting the phase-to-time relation proves (O.2). ∎

## O.4 Dynamical Emergence of a Coherent Causal Medium

The existence of a desynchronization penalty in the PCE potential implies that the system's own dynamics will drive it towards a state of synchronization.

Let the network configuration state $x$ be expanded to include the set of local MPU time phases $\{\phi_i(t)\}$. The PCE potential $V(x, \{\phi_i\})$ has a global minimum where the phase differences $\Delta\phi_{ij} = \phi_i - \phi_j$ are zero for all interacting pairs.

**Theorem O.2 (Conditional Low-Noise Concentration Near Synchronization).** Assume that the interaction graph is connected, every edge phase penalty is nonnegative and vanishes exactly at zero phase difference modulo $2\pi$, and all remaining terms of the PCE potential are phase-independent. Assume further the compactness, ergodicity, detailed-balance, and low-noise concentration hypotheses of Appendix D. Then the phase-sector global minimizers form
$$
\mathcal M_{\mathrm{sync}}
=
\{\phi:\phi_i-\phi_j=0\pmod{2\pi}\text{ on every edge}\},
$$
which consists of global phase shifts of a synchronized configuration, and the stationary measures satisfy
$$
\pi_\beta(U)\longrightarrow1
$$
for every open neighborhood $U\supset\mathcal M_{\mathrm{sync}}$ as $\beta\to\infty$.

*Proof.* Nonnegativity and exact vanishing show that a phase configuration minimizes the phase-sector potential exactly when every edge difference is zero. Connectedness then implies $\phi_i=\phi_j$ modulo $2\pi$ for every pair of vertices, leaving only one global phase. The phase-independent terms do not change this minimizer set. Under the stated Appendix D hypotheses, its low-noise detailed-balance concentration theorem applies to the global minimizer set and gives the displayed limit. ∎

## O.5 The Physical Origin of the Arrow of Time

**Arrow-of-time boundary for Borchers use.** The retained-algebra arrow fixes which algebraic records are available to an observer before a commitment. It does not itself provide the half-sided modular inclusion, reflected extension, or positivity data required by $\mathfrak C_{\mathrm{Borch}}$. Thus Borchers-type reflection is an optional finite certificate layered over the arrow theorem, not an alternate proof of the arrow theorem.

The coherent causal rhythm that emerges from the synchronized MPU network is not symmetric; it possesses an intrinsic and irreversible direction.

**Principle O.3c0 (Autonomous Cyclic-Update Closure).** A registered coarse-grained Predict–Verify–Update sector admits an autonomous continuous-time Markov description on states $P,V,D$ with strictly positive rates
$$
P\mathop{\rightleftarrows}^{a}_{\bar a}V,
\qquad
V\mathop{\rightleftarrows}^{b}_{\bar b}D,
\qquad
D\mathop{\rightleftarrows}^{c}_{\bar c}P.
$$
The operational cycle orientation is the forward orientation and satisfies the testable nonequilibrium inequality
$$
abc>\bar a\bar b\bar c.
\tag{O.3c0.1}
$$

**Theorem O.3c0 (Strict Autonomous Arrow and Fluctuation Identity).** Under Principle O.3c0, the unique stationary cycle current and affinity are
$$
J
=
\frac{abc-\bar a\bar b\bar c}
{ab+a\bar b+ac+\bar a\bar b+\bar ac+\bar a\bar c+bc+b\bar c+\bar b\bar c},
\tag{O.3c0.2}
$$
$$
\mathcal A
=
\ln\frac{abc}{\bar a\bar b\bar c}>0.
\tag{O.3c0.3}
$$
The stationary entropy-production rate is
$$
\dot\sigma=J\mathcal A>0.
\tag{O.3c0.4}
$$
Let $\pi$ be the stationary distribution. For every finite stationary trajectory
$$
\gamma=(x_0\to x_1\to\cdots\to x_N),
$$
recorded together with its holding times, and its time reverse $\gamma^\dagger$, define the total entropy production
$$
\Sigma_{\mathrm{tot}}[\gamma]
:=
\ln\frac{\pi(x_0)}{\pi(x_N)}
+
\sum_{j=1}^{N}
\ln\frac{k_{x_{j-1}x_j}}{k_{x_jx_{j-1}}}.
$$
Then
$$
\ln\frac{\mathbb P_{\pi}[\gamma]}{\mathbb P_{\pi}[\gamma^\dagger]}
=
\Sigma_{\mathrm{tot}}[\gamma],
\qquad
\left\langle e^{-\Sigma_{\mathrm{tot}}}\right\rangle_{\pi}=1.
\tag{O.3c0.5}
$$
For a closed cycle $x_N=x_0$, the stationary endpoint term vanishes.
Hence forward-oriented histories are exponentially favored on positive-production trajectories. A bound by $\ln2$ per completed cycle follows only if the separate registered affinity bound $\mathcal A\ge\ln2$ is verified.

*Proof.* Solving the stationary master equations with normalization gives the common oriented edge current (O.3c0.2); its denominator is a sum of positive two-rate monomials. Equation (O.3c0.1) therefore gives $J>0$ and (O.3c0.3). Schnakenberg's cycle decomposition gives $\dot\sigma=J\mathcal A$. In the ratio of stationary path densities, the holding-time exponentials cancel because the reversed trajectory visits the same states for the same durations. The initial-density ratio contributes $\ln[\pi(x_0)/\pi(x_N)]$, and each jump contributes the logarithm of its forward/reverse rate ratio. Their sum is $\Sigma_{\mathrm{tot}}[\gamma]$. Hence
$$
\mathbb P_{\pi}[\gamma]e^{-\Sigma_{\mathrm{tot}}[\gamma]}
=\mathbb P_{\pi}[\gamma^\dagger].
$$
Time reversal is a bijection on the finite path space, so summation proves the integral fluctuation identity. ∎

**Theorem O.3 (Conditional Pathwise Arrow Bound).** Suppose a coherent macroscopic step consists of $N$ update cycles with forward and reversed path measures on the same event algebra and
$$
\Sigma_{\mathrm{tot}}
=
\log\frac{P_F}{P_R}
=
\sum_{k=1}^N\sigma_k.
$$
If $\sigma_k\ge h_{\min}>0$ for every selected cycle, then
$$
\frac{P_R}{P_F}\le e^{-Nh_{\min}}.
$$
If $h_{\min}\ge\ln2$, then $P_R/P_F\le2^{-N}$.

*Proof.* Summing the $N$ pathwise inequalities gives
$$
\log\frac{P_F}{P_R}
=
\sum_{k=1}^N\sigma_k
\ge
Nh_{\min}.
$$
Exponentiation gives $P_F/P_R\ge e^{Nh_{\min}}$, and inversion of positive probabilities gives the first conclusion. For $h_{\min}\ge\ln2$,
$$
e^{-Nh_{\min}}\le e^{-N\ln2}=2^{-N}.
$$
∎

**Theorem O.3a (Conditional Single-Cycle Irreversibility Bound).** Let $P_F(c)>0$ and $P_R(c^\dagger)>0$ be weights on the same event algebra and suppose
$$
\sigma(c)=\log\frac{P_F(c)}{P_R(c^\dagger)}
\ge h_{\min}>0.
\tag{O.3a.1}
$$
Then
$$
\frac{P_R(c^\dagger)}{P_F(c)}
\le
e^{-h_{\min}}.
\tag{O.3a.3}
$$
In particular, a factor $1/2$ follows if $h_{\min}\ge\ln2$.

*Proof.* Exponentiating the hypothesis gives
$$
\frac{P_F(c)}{P_R(c^\dagger)}
\ge
e^{h_{\min}}.
$$
Both weights are positive, so inversion proves (O.3a.3). If $h_{\min}\ge\ln2$, then $e^{-h_{\min}}\le1/2$. ∎

**Corollary O.3a.1 (No Ensemble Requirement Under a Pathwise Cycle Bound).** When the guarantee-level update bound is imposed pathwise at the coarse-grained cycle level, the arrow of time applies to each processable actualization cycle in that class. Ensembles are then required only to estimate frequencies of outcomes, not to define the directionality of such a single update.

*Proof.* Theorem O.3a uses a single cycle $c$ satisfying the single-cycle entropy-production identity and the pathwise lower bound. No averaging over a population of cycles is used in deriving (O.3a.3). ∎

**Remark O.3a.2 (Scope of the Single-Cycle Bound).** Equation (O.3a.3) is a conditional pathwise consequence of (O.3a.1). Without the pathwise lower bound in (O.3a.1), Appendix J supplies its declared cycle-cost ledger, but neither the single-cycle bound of Theorem O.3a nor the multi-cycle suppression of Theorem O.3 follows. Theorem O.3 requires the corresponding pathwise lower bound for every selected cycle.

**Remark O.3a.3 (Delayed-Choice Consistency).** In delayed-choice, quantum-eraser, and pre/post-selected weak-probe protocols, a later recorded event changes which conditional subensemble or verification channel becomes operationally relevant for the retained record. It does not reverse the P-V-U order of the actualized MPU cycle and does not alter unconditioned earlier marginals (Corollary M.6.14d). Each recorded event is still processed through a forward update, and whenever it lies in the pathwise guarantee-level class it obeys the single-cycle irreversibility bound (O.3a.3).

**Corollary O.3a.4 (Forward-Locked Orientation Ledger).**
Let $\mathcal E$ be a finite class of coarse-grained update events equipped with an involution $e\mapsto e^\dagger$ and an orientation character
$$
\chi:\mathcal E\to\{+1,-1\},
\qquad
\chi(e^\dagger)=-\chi(e).
\tag{O.3a.4.1}
$$
Suppose the forward and reversed path weights are defined on the same event algebra and obey
$$
\sigma(e)=\log\frac{P_F(e)}{P_R(e^\dagger)}.
\tag{O.3a.4.2}
$$
Then the forward-oriented expectation is the pairwise antisymmetric ledger
$$
\langle\chi\rangle_F
=
\sum_{[e]}
\chi(e)\big(P_F(e)-P_F(e^\dagger)\big),
\tag{O.3a.4.3}
$$
where the sum is over unordered involution pairs; the summand is independent of which member is chosen as representative. If the pathwise guarantee-level bound $\sigma(e)\ge\varepsilon_0=\ln2$ holds on a pair, then
$$
\frac{P_R(e^\dagger)}{P_F(e)}\le e^{-\varepsilon_0}\le\frac12.
\tag{O.3a.4.4}
$$
Thus Appendix O supplies an orientation gate for any later CP-odd or branch-odd transport ledger, while the existence and magnitude of the odd source remain separate branch data.

*Proof.* Equation (O.3a.4.3) is obtained by partitioning the finite set $\mathcal E$ into involution pairs and using $\chi(e^\dagger)=-\chi(e)$. If the representative is changed from $e$ to $e^\dagger$, the factor $\chi$ and the probability difference both change sign, so the product is unchanged. Equation (O.3a.4.2) gives
$$
\frac{P_R(e^\dagger)}{P_F(e)}=e^{-\sigma(e)}.
$$
Under the pathwise guarantee-level bound this ratio is at most $e^{-\varepsilon_0}\le1/2$, proving (O.3a.4.4). No CP-odd or baryon-number source is produced by this statement; it only supplies the finite orientation ledger used by such branches. ∎

**Definition O.3a.2 (Modular Thermal-Time Ledger).** The external thermal-time precedent is the Connes-Rovelli thermal-time hypothesis [Connes & Rovelli 1994]. On a finite faithful local branch, let $(\mathfrak A_O,\omega_O)$ be the local algebra-state pair for a retained region $O$, with modular Hamiltonian
$$
K_O:=-\log\rho_O
\tag{O.3a.2.1}
$$
as in Definition F.10.4b.1a. The modular thermal-time ledger is
$$
\mathfrak T_{\mathrm{mod}}(O)
=
\left(
\mathfrak A_O,
\omega_O,
K_O,
\sigma_t^{\omega_O},
\beta_O,
\chi_{\mathrm{mod}}
\right),
\tag{O.3a.2.2}
$$
where $\beta_O$ is the physical-time normalization on the KMS branch and $\chi_{\mathrm{mod}}$ records that the algebra, state, and normalization are fixed before using macroscopic clock data.

**Theorem O.3a.3 (Thermal Time as Modular Prediction Time).** On a local equilibrium branch carrying Definition O.3a.2 and satisfying the KMS hypothesis of Theorem F.10.4b.2,
$$
\sigma_t^{\omega_O}
=
\alpha_{\beta_O t},
\tag{O.3a.3.1}
$$
so local prediction time is the modular parameter scaled by the KMS inverse temperature:
$$
\tau=\beta_O t.
\tag{O.3a.3.2}
$$
If histories parametrized by this modular clock also carry the independent pathwise certificate of Theorem O.3, that theorem selects the orientation in which cumulative certified entropy production increases.

*Proof.* The identity (O.3a.3.1) is Theorem F.10.4b.2 applied to the local state $\omega_O$. Equation (O.3a.3.2) is the same equality written in the physical prediction-time parameter. These identities supply the modular clock but no orientation. Under the additional pathwise certificate $\sigma_k\ge h_{\min}>0$ on every selected cycle, Theorem O.3 gives $P_R/P_F\le e^{-Nh_{\min}}$ and therefore selects the forward orientation. ∎

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

**Definition O.3c (Retained-Algebra Conditioning Certificate $\mathfrak C_{\mathrm{ret}}$).** Fix an observer hierarchy level $q$ in the sense of §P.5.8.3. A retained-algebra conditioning certificate is a finite record
$$
\mathfrak C_{\mathrm{ret}}^{(q)}
=
(\mathcal A_{\mathrm{ret}}^{(q)}(t),\;\iota_{s,t},\;S_{\mathrm{ret}}^{(q)},\;\mathcal L_{\mathrm{anc}},\;\text{no-deletion or retention record},\;\text{forward lock})
$$
where $\mathcal A_{\mathrm{ret}}^{(q)}(t)$ is the PPI-retained response algebra generated by verified records available at level $q$ up to time $t$, $\iota_{s,t}:\mathcal A_{\mathrm{ret}}^{(q)}(s)\hookrightarrow\mathcal A_{\mathrm{ret}}^{(q)}(t)$ are inclusion maps for $s<t$, $S_{\mathrm{ret}}^{(q)}$ is the entropy functional restricted to that retained algebra, and $\mathcal L_{\mathrm{anc}}$ is a finite ledger-ancestry verifier for record chains. The certificate is level-relative: it does not assert an observer-independent entropy for response-null degrees of freedom.

**Proposition O.3d (Retained-Algebra Boundary Reading).** On a branch carrying $\mathfrak C_{\mathrm{ret}}^{(q)}$, the retained algebras form a monotone filtration,
$$
\mathcal A_{\mathrm{ret}}^{(q)}(s)\subseteq \mathcal A_{\mathrm{ret}}^{(q)}(t),
\qquad s<t,
$$
and at the first operational retained-record time $t_0$,
$$
S_{\mathrm{ret}}^{(q)}(t_0)
\le
\ln\dim\mathcal A_{\mathrm{ret}}^{(q)}(t_0).
$$
If $\dim\mathcal A_{\mathrm{ret}}^{(q)}(t_0)$ is minimal in the certified filtration, the low-retained-entropy boundary is a consequence of retained-record smallness at that level, not an additional absolute microscopic boundary condition. Record-shaped configurations lacking accepted ledger ancestry are outside this retained-conditioning class only when $\mathcal L_{\mathrm{anc}}$ distinguishes them by a finite response protocol.

*Proof.* Each accepted record appends a verified finite response after the relevant update cycle. By the certificate's forward-lock and no-deletion/retention entries, later algebras contain the earlier retained records, giving the inclusion maps. Entropy on a finite retained algebra is bounded by the logarithm of its dimension. The ancestry clause is a PPI statement: exclusion applies to the retained conditioning class exactly when a finite protocol distinguishes ancestry-bearing records from record-shaped states without such ancestry. No positive thermodynamic cost is needed for these conclusions; Theorem 31 supplies only the distribution-dependent reset ledger when its separate reset hypotheses hold. ∎

**Remark O.3e (Non-Redundancy with the Arrow Theorem).** Theorems O.3, O.3a, and O.3b derive directionality and fluctuation suppression. Proposition O.3d does not rederive that arrow. It supplies the separate retained-algebra reading of low-boundary and conditioning claims, and is therefore used only where the text discusses the Past Hypothesis or record-selection ambiguity.

**Definition O.3f (Retained Entropic Clock-Flow Certificate).** Fix a retained sector $R$ and observer level $q$ carrying $\mathfrak C_{\mathrm{ret}}^{(q)}$. A retained entropic clock-flow certificate is a finite record
$$
\mathfrak C_{\mathrm{ECF}}^{(R,q)}
=
(\mathfrak C_{\mathrm{ret}}^{(q)},\mathcal E_R,\sigma_R^{\mathrm{ECF}},\mathcal G_R,
\varepsilon_0,
\mathcal N_R,
\tau_R^{\mathrm{cyc}},
\chi_{\mathrm{ECF}})
\tag{O.3f.1}
$$
where $\mathcal E_R$ is the finite retained event alphabet, $\sigma_R^{\mathrm{ECF}}:\mathcal E_R\to[0,\infty)$ is the branch-fixed retained entropy-production increment, $\mathcal G_R\subseteq\mathcal E_R$ is the locked guarantee-level retained-update subset, $\varepsilon_0=\ln2$ is the binary structural log-cardinality supplied by Definition 28, Definition J.1, and Theorem J.1, $\mathcal N_R$ is the null-exchange and label-swap control ledger, $\tau_R^{\mathrm{cyc}}$ is either a fixed physical cycle-time calibration or the symbol $\bot$ when only dimensionless clock count is claimed, and $\chi_{\mathrm{ECF}}$ records that the event alphabet, retained entropy-increment estimator, guarantee-level subset, null controls, and calibration were fixed before the clock-flow comparison.

For $e\in\mathcal G_R$, the certificate independently records both that $e$ is the retained projection of a nontrivial update cycle and that its matched forward and reversed path weights satisfy Equation (O.3a.1) with $h_{\min}\ge\varepsilon_0=\ln2$. Hence
$$
\sigma_R^{\mathrm{ECF}}(e)\ge\varepsilon_0=\ln2.
\tag{O.3f.2}
$$
This lower bound is certificate data; it does not follow from SPAP or from the structural binary log-cardinality alone.
No such lower bound is claimed for events outside $\mathcal G_R$ unless they are separately certified.

For a retained event history $e_1,\ldots,e_n$ define
$$
\Sigma_R^{\mathrm{ECF}}(n)=
\sum_{j=1}^n\sigma_R^{\mathrm{ECF}}(e_j),
\qquad
\mathcal T_R(n)=
\frac{\Sigma_R^{\mathrm{ECF}}(n)}{\varepsilon_0}
=
\frac{\Sigma_R^{\mathrm{ECF}}(n)}{\ln2}.
\tag{O.3f.3}
$$
$\mathcal T_R$ is the dimensionless retained entropic clock count. If $\tau_R^{\mathrm{cyc}}\ne\bot$, the calibrated physical representative is
$$
t_R^{\mathrm{ECF}}(n)=
\tau_R^{\mathrm{cyc}}\mathcal T_R(n).
\tag{O.3f.4}
$$
When $e_j\in\mathcal G_R$, (O.3f.2) implies that the event advances $\mathcal T_R$ by at least one unit.

**Theorem O.3f (Retained Clock-Flow and Stall Law).** On any branch carrying $\mathfrak C_{\mathrm{ECF}}^{(R,q)}$, the retained entropic clock $\mathcal T_R$ is monotone. For any retained interval $I=[m,n]$,
$$
\Delta\mathcal T_R(I)
=
\frac{1}{\ln2}
\sum_{j=m+1}^n\sigma_R^{\mathrm{ECF}}(e_j).
\tag{O.3f.5}
$$
Therefore:

1. if the retained entropy/update flow vanishes on $I$, then $\Delta\mathcal T_R(I)=0$;
2. if $I$ contains $N_I$ events from the locked guarantee-level subset $\mathcal G_R$, then $\Delta\mathcal T_R(I)\ge N_I$;
3. if no independently registered non-entropic clock record is present in the retained presheaf, event-order refinements inside a zero-flow interval do not change the $\mathcal T_R$ coordinate and are response-null for the entropic-clock subtest of the $\mathfrak C_{\mathrm{ECF}}$ protocol.

*Proof.* The certificate requires $\sigma_R^{\mathrm{ECF}}(e_j)\ge0$ for each retained event, so $\Sigma_R^{\mathrm{ECF}}$ and $\mathcal T_R=\Sigma_R^{\mathrm{ECF}}/\ln2$ are monotone. Summing the certified increments across $I$ gives (O.3f.5). If every increment on $I$ is zero, the sum is zero. If $N_I$ interval events lie in $\mathcal G_R$, (O.3f.2) supplies $\sigma_R^{\mathrm{ECF}}(e_j)\ge\varepsilon_0=\ln2$ for each such event, and all other increments are nonnegative, so the normalized sum is at least $N_I$. The last clause is the PPI quotient clause for the entropic-clock coordinate: without a retained record that distinguishes two internal refinements, the refinements are not separate clock events for this protocol. ∎

**Corollary O.3g (Clock-Current TUR).** If $\mathcal T_R$ is estimated by a stationary finite Blackwell-PCE record current $J_T$ with $\langle J_T\rangle\ne0$ on a branch satisfying the predictive thermodynamic uncertainty relation of Theorem D.8.7f, and if
$$
\widehat{\Delta\mathcal T_R}=\gamma_T J_T,
\qquad \gamma_T>0,
\tag{O.3g.1}
$$
then
$$
\frac{\operatorname{Var}(\widehat{\Delta\mathcal T_R})}
{\langle\widehat{\Delta\mathcal T_R}\rangle^2}
\Sigma_T
\ge2.
\tag{O.3g.2}
$$

*Proof.* Multiplication of the current by the positive calibration $\gamma_T$ multiplies both the mean and standard deviation by $\gamma_T$, so the relative variance is unchanged. Substitution into Theorem D.8.7f gives (O.3g.2). ∎

**Remark O.3h (Closed-System and Two-Sector Reading).** In a closed total branch $R\cup\bar R$, the retained clock-flow law is a subsystem statement, not a violation of global closure. The total branch may conserve its accepted fine-grained invariant while a retained sector obtains an arrow and an internal clock from entropy/update exchange with its complement. When the exchange ledger is null, $\mathcal T_R$ stalls unless another retained clock certificate has been independently fixed. Thus two-sector analogue clocks test the PU chronometric projection only when the retained sector, complement controls, retained entropy-increment estimator, guarantee-level subset when used, and null windows are locked before comparison. Cold-atom bright/dark-sector entropic-time experiments such as Barontini [2026] are external analogue precedents for this two-sector operational architecture; they are not forward PU evidence for the $\ln2$ unit bridge unless the PU unit, retained entropy-increment estimator, null windows, guarantee-level subset when used, and witness locks are fixed before comparison.

### O.5.1 The Perspectival Arrow: Complexity-Relative Temporal Asymmetry

Theorem O.3 gives $P_R/P_F\le e^{-Nh_{\min}}$ only on the branch carrying common forward/reverse path measures and the pathwise certificate $\sigma_k\ge h_{\min}>0$. The observer hierarchy of §P.5.8.3 shows that this global asymmetry acquires additional internal structure once some systems possess Effective Operational Property R and an operational self-model. The relevant mechanism is the conjunction of measurement asymmetry (Theorem M.10.5) with the SPAP-dependent integration cost of self-referential patterns (Definition M.10.3; Theorem M.10.3). A more complex system can externally model the self-referential burden of a less complex one, but it cannot thereby impose an exact temporal reversal on the less complex system from within that system's own perspective.

**Theorem O.4 (Registered-History Separation from State Recurrence).** Let $B$ carry a retained-algebra conditioning certificate $\mathfrak C_{\mathrm{ret}}^{(q)}$ from Definition O.3c on a certified interval. Suppose an update record is retained at $t_1$ and the certificate supplies the injective inclusion $\iota_{t_1,t_2}:\mathcal A_{\mathrm{ret}}^{(q)}(t_1)\hookrightarrow\mathcal A_{\mathrm{ret}}^{(q)}(t_2)$ for $t_2>t_1$. If later processing returns the accessible state, a reduced state, or a declared response profile to its earlier value, that equality is a state or response recurrence; it does not delete the registered event from the forward-locked retained algebra. A directional path-probability conclusion additionally requires Theorem O.3a, and a reset-heat conclusion additionally requires a registered reset satisfying Theorem 31.

*Proof.* The injective inclusion preserves the earlier event as an element of the later retained algebra. Equality of an accessible state or declared response profile therefore does not identify the retained algebras or erase that element. The final two claims follow directly from the independent antecedents of Theorems O.3a and 31. ∎

**Corollary O.4.1 (No Erasure of a Forward-Locked History by Later Communication).** Under Theorem O.4's retention hypothesis, a later communicated description cannot erase the earlier registered event from the forward-locked ledger. It may nevertheless enable the physical state, a reduced state, or a declared finite response profile to recur; PU's self-reference theorems do not by themselves forbid such restoration.

*Proof.* The first conclusion is Theorem O.4. The second is a scope statement: SPAP excludes a universal exact predictor on its diagonal class, not a control map that returns a particular system to a prior accessible state. ∎

Theorem O.4 is compatible with global unitarity (Theorem E.9.5): it concerns persistence of a certified retained event, not a general impossibility of state, reduced-state, or response-profile recurrence.

**Remark O.4.2 (Locus of Irreversibility).** Theorem O.4 locates its conclusion in the retained history ledger. A positive stochastic arrow requires Theorem O.3a's pathwise certificate, and positive reset heat requires a registered reset with positive $H_q(P\mid R)$. Processing self-referential content may carry the conditional complexity bounds of Appendix M, but self-reference alone supplies neither positive entropy production nor impossibility of state recurrence.

**Remark O.4.3 (Certificate-Relative External Evaluation; cf. Theorem M.10.5).** Theorem M.10.5 permits an external system $A$ to evaluate a specified pair $(B,E)$ only when $A$ holds the effective model-access and decision certificates stated there; sender-side SPAP-flatness additionally requires its insulation certificate. The inequality $C_{agg}(A)>C_{agg}(B)$ is neither necessary nor sufficient. Corollary M.10.5.1 excludes a universal internal evaluator only on its explicit reduction branch. These facts establish no strict hierarchy of temporal access and no universal obstruction to restoring a selected prior state.

**Remark O.4.4 (Certificate-Relative Reconstruction Cost).** Reconstruction accuracy alone does not determine $\mu_B(E)$ and does not imply the asymptotic lower bound of Theorem M.10.3. That bound applies only to an asymptotic family for which $\mu_{B_\lambda}(E_\lambda)\to\infty$ and the pattern-specific reduction certificate of Corollary B.2.1 is supplied. A token describing a prior state, its processing by $B$, and physical restoration of that state are distinct operations and require separately specified maps.

**Remark O.4.5 (Receiver-Pattern Classification).** On the identifiable Fisher stratum of Definition M.10.2, $\sigma_B(E)=0$ or $\sigma_B(E)>0$ classifies the registered update relative to $B$'s declared self-model splitting. Baseline proximity for $\sigma_B(E)=0$ additionally requires Corollary M.10.3.1's baseline-invariance hypothesis. A divergent integration-cost lower bound additionally requires an asymptotic family with $\mu_{B_\lambda}(E_\lambda)\to\infty$ and the pattern-specific reduction certificate of Theorem M.10.3. The classification is a property of the fully specified receiver, pattern, and update map; channel-independence does not follow unless those maps are themselves invariant under the compared delivery channels.

**Proposition O.4.2 (Complexity-Graded Self-Model Descriptors).** The observer levels of §P.5.8.3 grade which Appendix M descriptors are defined, not whether a thermodynamic arrow exists.

1. At Levels 0 and 1, the Appendix M self-model descriptor is not assigned unless Effective Operational Property R and the registered self-model splitting are independently supplied.
2. At Levels 2 and 3, the receiver-pattern quantities $\sigma_S(E)$ and $\mu_S(E)$ are available only on Definition M.10.2's identifiable Fisher stratum and Definition M.10.3's specified prediction-map branch.
3. At every level, a directional probability bound requires Theorem O.3 or O.3a, and a reset-heat bound requires Theorem 31. A CC intervention or a self-model update does not replace either certificate.

*Proof.* The first two clauses are the domain conditions of Definitions M.10.1–M.10.3 and Remark M.10.1. The third clause follows from the antecedents of Theorems O.3, O.3a, and 31. None of those antecedents is implied solely by an observer-level label. ∎

**Corollary O.4.3 (Certificate-Relative Asymmetry of Model Access).** Let $A$ and $B$ satisfy the effective model-access, decision, and insulation hypotheses of Theorem M.10.5 for a specified pattern $E$. Then $A$ may evaluate the certified enclosure of $\mu_B(E)$ while treating the computation as external to $A$'s self-model. A cost conclusion for $B$ follows only if the corresponding pattern-specific reduction certificate is also supplied. Aggregate-complexity ordering alone implies neither conclusion, and neither conclusion forbids state recurrence under Theorem O.4.

*Proof.* The evaluation statement is Theorem M.10.5, the cost statement is Theorem M.10.3, and the final scope statement is Theorem O.4. ∎

**Corollary O.4.3a (Orientation-Independent Certified Integration Boundary).** Let $S$ be an embedded Property-R predictive system, and let $\mathcal H^-$ be a past-labeled reconstruction or $\mathcal H^+$ a future-labeled simulation. If an integrated finite prefix $R_k$ has $\mu_S(R_k)=\infty$ and carries Theorem M.10.6's pattern-specific reduction certificate, then no finite-cost completed integration is certified for that prefix. The conclusion is independent of the temporal-origin label. A complete self-model record or an exact restoration instruction is covered only if a separate construction proves that its induced prefix satisfies these hypotheses.

*Proof.* Theorem M.10.11 makes the criterion depend on the receiver-pattern pair rather than the temporal-origin label. Theorem M.10.6 then gives the certified integration boundary under its reduction hypothesis. No further class of records may be inserted into that boundary without proving the required $\mu_S(R_k)=\infty$ and reduction premises. ∎

### O.5.2 Typed Computational-Thermodynamic Asymmetry and the P-versus-NP Boundary

Thermodynamic irreversibility, witness-generation difficulty, average-case inversion hardness, path-measure asymmetry, and SPAP diagonal obstruction all distinguish a forward task from a reverse or predictive task. That common verbal pattern does not make the quantities interchangeable. This section places them in one typed bookkeeping space, states the bridge conditions required to move between types, and isolates a sufficient certificate under which the proposed one-way-function route would imply $\mathsf{P}\ne\mathsf{NP}$. No claim in this section treats gravity as a fundamental computational field: gravity remains the emergent thermodynamic/equation-of-state structure developed elsewhere in PU.

**Definition O.5.2a (Typed Computational-Thermodynamic Asymmetry Profile).** A typed asymmetry profile is the five-coordinate product
$$
\mathsf{Asym}_{\mathrm{PU}}
=
\left(
\mathsf{Asym}_{\mathrm{diag}},
\mathsf{Asym}_{\mathrm{wit}},
\mathsf{Asym}_{\mathrm{inv}},
\mathsf{Asym}_{\mathrm{erase}},
\mathsf{Asym}_{\mathrm{path}}
\right),
\tag{O.5.2.1}
$$
where each coordinate is either a record of its declared type or the distinguished value $\bot$ when that coordinate has not been instantiated. The coordinate types are as follows.

1. $\mathsf{Asym}_{\mathrm{diag}}$ records a predictor class and a predictor-responsive construction, including the SPAP quantifier pattern: for each predictor in the declared class, a system may be constructed whose response depends on that predictor and defeats its exact universal prediction.
2. $\mathsf{Asym}_{\mathrm{wit}}$ records a polynomially balanced, polynomial-time decidable relation $\mathcal R_{\mathrm{wit}}(x,w)$, its decision language, and the resources required to output some valid witness rather than merely verify a supplied witness.
3. $\mathsf{Asym}_{\mathrm{inv}}$ records a single fixed public function family, its locked input ensemble, an inverter class, and the average success probability for returning any valid preimage.
4. $\mathsf{Asym}_{\mathrm{erase}}$ records a specified physical reset protocol: the register distribution, accessible side information, Hamiltonian or logical-state energetics, bath temperature $T_{\mathrm{bath}}$, controller and ancilla closure conditions, and heat or work convention.
5. $\mathsf{Asym}_{\mathrm{path}}$ records a specified forward path law and reverse path law, including their coarse-graining, time-reversal map, and log-likelihood ratio.

The set of individual one-coordinate records is the disjoint union of the five tagged strata; a complete profile lies in their typed product. Neither construction has a default scalar projection, equality, or order that identifies records from different strata.

An inter-coordinate bridge from a source coordinate to a target coordinate is *admissible* only when it supplies all of the following:

(i) one uniform encoder and decoder; (ii) polynomial input-length distortion and polynomial simulation overhead; (iii) preservation of totality and of the relevant success predicate; (iv) exact or quantitatively bounded transport of the declared input distribution; (v) a construction converting every target solver into a source solver with an explicit success-loss bound; (vi) a target family fixed independently of the solver to which the reduction is later applied; and (vii) a dependency ledger showing that the bridge does not assume the conclusion, a one-way function, or an equivalent hardness hypothesis. A common word such as *irreversible*, equality of two untyped symbols $\Omega$, or an analogy between two large spaces is not an admissible bridge.

For the witness coordinate, let
$$
\mathcal R_{\mathrm{wit}}(x,w)
\iff
V(x,w)=1,
\qquad
\mathcal R_{\mathrm{wit}}(x,w)\Longrightarrow |w|\le q(|x|),
\tag{O.5.2.2}
$$
where $V$ runs in polynomial time and $q$ is a polynomial. The associated language and search set are
$$
L_{\mathcal R}:=\{x:\exists w\,\mathcal R_{\mathrm{wit}}(x,w)\},
\qquad
F_{\mathcal R}(x):=\{w:\mathcal R_{\mathrm{wit}}(x,w)\}.
$$
The bound $|w|\le q(|x|)$ bounds the number of possible encodings by less than $2^{q(|x|)+1}$; it is not a lower bound on the time required to find a valid witness.

**Lemma O.5.2b (Counting-Entropy-Complexity Separation).** Let a finite classical register $W$ have law $p$ and support size $\Omega_W$. Its Shannon entropy in nats satisfies
$$
H_{\mathrm{Sh}}(W)
:=-\sum_w p(w)\ln p(w)
\le \ln\Omega_W,
\tag{O.5.2.3}
$$
with equality exactly when $p$ is uniform on its support. Consider the explicit symmetric-memory branch on which: the logical macrostates are local-equilibrium states with equal mean energy, equal internal entropy, and equal free energy; the memory Hamiltonian is restored at the endpoint; the declared joint state includes every correlation involving $W$; the bath begins thermal and acts as an ideal reservoir at temperature $T_{\mathrm{bath}}>0$; every auxiliary non-bath degree of freedom other than the target register $W$ is restored to its initial joint state, except for an ideal work source whose entropy and correlations remain unchanged and whose declared energy change is pure work; and no other declared or undeclared entropy, information, or nonequilibrium sink is available. Taking $Q_{\mathrm{env}}$ as signed heat, positive when delivered to the environment, if no side information about $W$ is retained, resetting $W$ to a fixed logical state obeys
$$
Q_{\mathrm{env}}
\ge k_B T_{\mathrm{bath}}H_{\mathrm{Sh}}(W).
\tag{O.5.2.4}
$$
If a classical side-information register $C$ is available as branchwise control, is preserved catalytically, and is returned with its full state and every pre-existing correlation with retained reference systems restored, while acquiring no new correlation with any bath, controller, work source, or other non-$C$ degree of freedom, the corresponding ideal conditional bound is $Q_{\mathrm{env}}\ge k_BT_{\mathrm{bath}}H_{\mathrm{Sh}}(W\mid C)$. Here preservation means preservation of the full declared side-information resource, not merely its marginal distribution. Neither bound is a computational running-time lower bound. If a nonideal battery or any other entropy-bearing resource is admitted, the bath-only inequality need not hold; that resource must be included in the complete entropy and nonequilibrium-free-energy balance. Under the corresponding standard assumptions of an initially thermal, uncorrelated bath and isothermal work accounting, the appropriate replacement outside the symmetric-memory branch is
$$
W_{\mathrm{in}}
\ge
F_{T_{\mathrm{bath}}}(\rho_{\mathrm{final}},H_{\mathrm{final}})
-F_{T_{\mathrm{bath}}}(\rho_{\mathrm{initial}},H_{\mathrm{initial}}),
$$
for the complete declared process, with signed $W_{\mathrm{in}}$ taken positive when work is supplied and $F_T(\rho,H):=\operatorname{Tr}(\rho H)-k_BT S_{\mathrm{vN}}(\rho)$ for dimensionless von Neumann entropy in nats. Correlated or nonthermal reservoirs require a more general resource ledger; neither case is governed by (O.5.2.4) alone.

*Proof.* Let $u$ be the uniform distribution on the support of $W$. Nonnegativity of relative entropy gives
$$
D_{\mathrm{KL}}(p\Vert u)
=\sum_w p(w)\ln\frac{p(w)}{1/\Omega_W}
=\ln\Omega_W-H_{\mathrm{Sh}}(W)
\ge0,
$$
with equality exactly for $p=u$. This proves (O.5.2.3). Under the stated symmetric-memory, cyclic, isothermal reset conditions, the decrease of logical entropy must be exported to the environment; the ordinary and side-information forms of Landauer's bound give (O.5.2.4) and its conditional version [Landauer 1961; Bennett 1973; Sagawa & Ueda 2009].

To separate counting from computation explicitly, fix any polynomial $q$ and define
$$
\mathcal R_0(x,w)\iff w=0^{q(|x|)}.
$$
There are $2^{q(|x|)}$ binary strings of the displayed length, but a generator outputs the unique witness $0^{q(|x|)}$ in $O(q(|x|))$ time. If a physical implementation first stores a uniformly random string of that length and then resets it under the symmetric-memory Landauer conditions above, the reset bound is $q(|x|)k_BT_{\mathrm{bath}}\ln2$, which is linear in the number of stored bits, not exponential in the number of candidate strings. Therefore exponential cardinality, logarithmic entropy, reset heat, and search time are distinct quantities. Conditioning a mathematical distribution on a successful witness is also not, by itself, a physical reset. ∎

**Proposition O.5.2c (Forecast Information and Algorithm-Conditional Dissipation).** Let $Z_h$ be a finite-valued future variable with alphabet $\mathcal Z_h$ of size $M_h\ge2$, let $C_h$ be finite classical side information, and let a finite classical prediction register $Y_h$ have alphabet $\mathcal Y_h$ of size $d_h$. Suppose a decoder $g_h:\mathcal Y_h\times\operatorname{supp}(C_h)\to\mathcal Z_h$ forms $\widehat Z_h=g_h(Y_h,C_h)$ with error probability $\epsilon_h=\Pr[\widehat Z_h\ne Z_h]$. Write
$$
h_2(\epsilon):=-\epsilon\ln\epsilon-(1-\epsilon)\ln(1-\epsilon)
$$
for $0<\epsilon<1$, with the continuous-extension convention $h_2(0)=h_2(1)=0$, and
$$
I_{\mathrm{req}}(h)
:=
\left[
H_{\mathrm{Sh}}(Z_h\mid C_h)
-h_2(\epsilon_h)
-\epsilon_h\ln(M_h-1)
\right]_+.
$$
Then
$$
\ln d_h
\ge H_{\mathrm{Sh}}(Y_h\mid C_h)
\ge I(Z_h;Y_h\mid C_h)
\ge I_{\mathrm{req}}(h).
\tag{O.5.2.5}
$$
If $Y_h$ is then reset under the symmetric conditional Landauer hypotheses of Lemma O.5.2b, with $C_h$ as the complete accessible retained side-information resource and with that resource catalytically restored, the declared reset heat obeys
$$
Q_{\mathrm{env}}^{(h)}
\ge k_BT_{\mathrm{bath}}H_{\mathrm{Sh}}(Y_h\mid C_h)
\ge k_BT_{\mathrm{bath}}I_{\mathrm{req}}(h).
\tag{O.5.2.6}
$$
For a sequence of declared reset events $j=1,\ldots,L(n)$, let $W_j$ be the register actually erased and let $C_j$ contain all side information accessible at that reset. If the individual protocols satisfy the same cyclic assumptions, then the heat attributable to those resets satisfies
$$
Q_{\mathrm{reset}}(n)
\ge
k_B\sum_{j=1}^{L(n)}T_jH_{\mathrm{Sh}}(W_j\mid C_j).
\tag{O.5.2.7}
$$
Consequently, if $T_j\ge T_{\min}>0$ and $H_{\mathrm{Sh}}(W_j\mid C_j)\ge h_{\min}^{\mathrm{erase}}>0$ for every declared reset, with $T_{\min}$ and $h_{\min}^{\mathrm{erase}}$ independent of $n$, then $Q_{\mathrm{reset}}(n)\ge k_BT_{\min}h_{\min}^{\mathrm{erase}}L(n)$. This uniform per-reset-floor route yields an exponential lower bound if an independent theorem proves exponentially many such resets. Candidate cardinality alone supplies no such theorem; other routes to exponential heat, such as separately established growth of temperature, erased entropy, or another energetic term, are outside this bound.

*Proof.* Since $Y_h$ has at most $d_h$ values, $H_{\mathrm{Sh}}(Y_h\mid C_h)\le\ln d_h$. Also $H_{\mathrm{Sh}}(Y_h\mid C_h)\ge I(Z_h;Y_h\mid C_h)$. Conditional data processing for $\widehat Z_h=g_h(Y_h,C_h)$ and conditional Fano inequality give
$$
I(Z_h;Y_h\mid C_h)
\ge I(Z_h;\widehat Z_h\mid C_h)
\ge H_{\mathrm{Sh}}(Z_h\mid C_h)-h_2(\epsilon_h)-\epsilon_h\ln(M_h-1).
$$
Mutual information is nonnegative, proving (O.5.2.5) [Cover & Thomas 2006]. Conditional Landauer erasure then gives (O.5.2.6), and summing only the explicitly declared reset contributions gives (O.5.2.7).

The side-information clause is essential. If an additional correlated register $D_h$ is available during reset, the physical entropy term is $H_{\mathrm{Sh}}(Y_h\mid C_h,D_h)$, and (O.5.2.6) must be rederived with the enlarged conditioning and full resource-restoration conditions. In particular, if the realized $Z_h$ later becomes available and $Y_h$ is a deterministic function of $(Z_h,C_h)$, reversible uncomputation can make the conditional reset entropy vanish. For a perfect forecast with $M_h=2^N$ and $Z_h$ uniform conditional on every supported value $C_h=c$, equivalently $H_{\mathrm{Sh}}(Z_h\mid C_h)=N\ln2$, (O.5.2.5) requires $N\ln2$ nats of record capacity and the stated reset branch costs at least $Nk_BT_{\mathrm{bath}}\ln2$: the dependence on $N$ is linear. For nonsymmetric memories or noncyclic protocols, the complete nonequilibrium free-energy inequality stated in Lemma O.5.2b replaces the simple heat formula. ∎

**Proposition O.5.2d (The P/NP Decision-Search Stratum).** For polynomially balanced, polynomial-time decidable witness relations, the following are equivalent:
$$
\mathsf{P}=\mathsf{NP}
\quad\Longleftrightarrow\quad
\forall(\mathcal R_{\mathrm{wit}},V,q)\;\exists G_{\mathcal R}\in\mathsf{FP}\;\forall x:
\quad
G_{\mathcal R}(x)
\in
\begin{cases}
F_{\mathcal R}(x),&F_{\mathcal R}(x)\ne\varnothing,\\
\{\bot\},&F_{\mathcal R}(x)=\varnothing,
\end{cases}
\tag{O.5.2.8}
$$
where the relation, its fixed verifier $V$, and its polynomial balance bound $q$ are fixed before the corresponding generator $G_{\mathcal R}$ is selected. Thus the decision-versus-witness-generation question is a well-defined stratum of $\mathsf{Asym}_{\mathrm{PU}}$, but its membership in the typed space supplies no separation theorem.

*Proof.* Assume $\mathsf{P}=\mathsf{NP}$. The language $L_{\mathcal R}$ is in $\mathsf{NP}$, hence decidable in polynomial time. On a yes-instance, maintain a prefix $u$ known to extend to a valid witness. If $\mathcal R_{\mathrm{wit}}(x,u)$ holds, output $u$. Otherwise query the prefix-extension language
$$
L_{\mathcal R}^{\mathrm{ext}}
:=
\{\langle x,u\rangle:\exists z,\ |uz|\le q(|x|)\text{ and }\mathcal R_{\mathrm{wit}}(x,uz)\}.
$$
This language is in $\mathsf{NP}$ because $z$ has polynomial length and $V$ verifies the completion. Query first with $u0$. If the answer is yes append $0$; otherwise append $1$, which must preserve the invariant. If no shorter prefix already satisfies the relation, then after at most $q(|x|)$ bit appends one has $|u|=q(|x|)$; output $u$, which satisfies $\mathcal R_{\mathrm{wit}}(x,u)$ by the invariant. On a no-instance return $\bot$. For the fixed relation this is a uniform polynomial-time generator $G_{\mathcal R}$.

Conversely, apply the assumed generator to the standard polynomially balanced satisfiability relation. It returns a satisfying assignment exactly on satisfiable formulas and $\bot$ otherwise, deciding SAT in polynomial time. Since SAT is $\mathsf{NP}$-complete, $\mathsf{P}=\mathsf{NP}$ [Cook 1971; Karp 1972]. ∎

**Theorem O.5.2e (No Separation by Untyped Asymmetry).** SPAP diagonal obstruction, a positive registered-reset cost, a thermodynamic arrow, and large physical or computational possibility spaces do not by themselves furnish or discharge the certificate $\mathfrak C_{\mathrm{OWF}}$ of Definition O.5.2f. No inference from these facts to one-wayness or $\mathsf{P}\ne\mathsf{NP}$ is licensed merely by placing them in $\mathsf{Asym}_{\mathrm{PU}}$ or identifying their untyped cardinalities. Moreover, any route using only the current common-oracle-relativizing SPAP construction is blocked as a $\mathsf{P}$-versus-$\mathsf{NP}$ separation proof. This theorem is a certificate-insufficiency and proof-route statement; it does not exclude a future explicit nonrelativizing bridge or a different separation method.

*Proof.* Four independent checks leave the proposed certificate undischarged.

First, the success predicates differ. A many-to-one map can erase distinctions and still be trivial to invert in the cryptographic sense. For example, $f_n^{\mathrm{const}}(x)=0^n$ has a maximally collapsed output, but the inverter that always outputs $0^n$ returns a valid preimage with probability one. The involution $f_n^{\mathrm{not}}(x)=\neg x$ and the identity $f_n^{\mathrm{id}}(x)=x$ are also exactly invertible in linear time. Conversely, an implementation of the identity may dissipate arbitrarily much energy through a wasteful controller. These counterexamples show that logical merging or physical dissipation, taken as untyped properties, cannot be relabeled as computational inversion hardness.

Second, the quantifiers differ. The relevant SPAP form is
$$
\forall\mathcal P\;\exists S_{\mathcal P}
\quad
\text{such that the predictor-responsive system }S_{\mathcal P}\text{ defeats }\mathcal P,
$$
whereas standard one-wayness has the form
$$
\exists f\;\forall\mathcal I\in\mathsf{PPT}\;\forall c\in\mathbb N_{>0}\;
\exists N_{\mathcal I,c}\;\forall n\ge N_{\mathcal I,c}:
\operatorname{Adv}^{\mathrm{inv}}_{f,\mathcal I}(n)<n^{-c}.
\tag{O.5.2.9}
$$
The SPAP target may depend on the predictor; the function $f$ must be one fixed public family chosen before the inverter. Exchanging $\forall\mathcal P\exists S_{\mathcal P}$ for $\exists f\forall\mathcal I$ is not a valid quantifier inference. SPAP also concerns a responsive diagonal interaction, while one-way inversion is a static input-output task under a locked average-case distribution.

Third, a physical phase-space volume is measure- and coarse-graining-dependent and generally carries units, while a finite witness count is a dimensionless encoding cardinality. Even after a normalization turns both into numbers, an equality of cardinalities gives no uniform reduction, no success-preservation theorem, and no running-time lower bound. Definition O.5.2a therefore forbids identifying physical phase-space volume with computational candidate count unless a complete admissible bridge is supplied.

Fourth, the current SPAP diagonal proof route is common-oracle relativizing. For any oracle $\mathcal O$ and any oracle predictor $\mathcal P^{\mathcal O}$, the responsive construction may query $\mathcal P^{\mathcal O}$ on its own proposed response and return the complementary bit; exact correctness would require a bit to equal its complement. Giving the same oracle to both sides therefore leaves the diagonal contradiction intact. Now choose a Baker-Gill-Solovay oracle $\mathcal O_{\mathrm{BGS}}$ for which $\mathsf{P}^{\mathcal O_{\mathrm{BGS}}}=\mathsf{NP}^{\mathcal O_{\mathrm{BGS}}}$ [Baker, Gill & Solovay 1975]. The common-oracle SPAP obstruction still holds. By contrast, the prefix construction of Theorem O.5.2g also relativizes for every length-indexed family $f_n:\{0,1\}^n\to\{0,1\}^{m(n)}$ with polynomially bounded $m(n)$, unary index $1^n$ supplied to the inverter, and one uniform evaluator in $\mathsf{FP}^{\mathcal O_{\mathrm{BGS}}}$. Its prefix-extension language lies in $\mathsf{NP}^{\mathcal O_{\mathrm{BGS}}}=\mathsf{P}^{\mathcal O_{\mathrm{BGS}}}$, so a uniform polynomial-time oracle inverter recovers a preimage for every output in the image. Thus no such indexed family is one-way against uniform $\mathsf{PPT}^{\mathcal O_{\mathrm{BGS}}}$ inverters. A common-oracle-relativizing derivation from the current SPAP fact to one-wayness or to $\mathsf{P}\ne\mathsf{NP}$ would therefore fail relative to $\mathcal O_{\mathrm{BGS}}$. This is a barrier for the stated route, not a claim that every future nonrelativizing PU bridge is impossible.

The counterexamples, quantifier mismatch, missing reduction data, and oracle construction prove the stated certificate insufficiency and relativization barrier. ∎

**Definition O.5.2f (PU One-Way-Function Bridge Certificate).** For the one-way-function route studied here, a PU one-way-function bridge certificate $\mathfrak C_{\mathrm{OWF}}$ is a finite proof-carrying record containing all of the following data. This certificate deliberately selects a length-preserving, setup-free sufficient subclass; it does not assert that every standard formulation of a one-way function must be length-preserving or lack auxiliary setup structure [Goldreich 2001].

1. The code of one deterministic uniform total evaluator $F$ defining a fixed length-preserving family $f_n:\{0,1\}^n\to\{0,1\}^n$ by $f_n(x)=F(1^n,x)$, together with a checked polynomial running-time bound. No instance-specific table, nonuniform advice, hidden trapdoor, or inaccessible physical constant is permitted.
2. The locked input ensemble $x\leftarrow U_n$, the uniform distribution on $\{0,1\}^n$. The output law is the pushforward $f_n(U_n)$, not the uniform law on the image of $f_n$.
3. The declared adversary class of uniform classical probabilistic polynomial-time inverters $\mathsf{PPT}$. For each fixed inverter $\mathcal I$, let the polynomial $\ell_{\mathcal I}(n)$ bound its random-coin use on security parameter $n$, padding unused coins if necessary. The any-preimage success functional is
$$
\operatorname{Adv}^{\mathrm{inv}}_{f,\mathcal I}(n)
:=
\Pr_{\substack{x\leftarrow U_n\\r\leftarrow U_{\ell_{\mathcal I}(n)}}}
\left[
\begin{array}{c}
x'=\mathcal I(1^n,f_n(x);r)\in\{0,1\}^n,\\
f_n(x')=f_n(x)
\end{array}
\right].
\tag{O.5.2.10}
$$
4. A named formal theory $\mathsf T_{\mathrm{cert}}$, a deterministic proof checker, a finite proof object for the full quantified statement (O.5.2.9), and an accepted metatheoretic soundness and standard-model interpretation warrant for the fragment used. Without that soundness warrant, acceptance establishes only derivability in $\mathsf T_{\mathrm{cert}}$, not the complexity statement. The proof must treat each fixed uniform inverter on one asymptotic tail. A pointwise quantity $\sup_{\mathcal I}\operatorname{Adv}^{\mathrm{inv}}_{f,\mathcal I}(n)$, with a different hard-coded uniform machine allowed at each $n$, is not an admissible substitute.
5. Polynomial encoders and decoders between computational strings and the declared PU state or protocol records. To transfer a PU physical hardness theorem to standard one-wayness, the certificate must map every uniform $\mathsf{PPT}$ inverter to a permitted PU realization with polynomial overhead and quantitatively controlled success loss. If equivalence between the physical and computational inverter classes is claimed, it must also map every covered PU inverter back to a uniform $\mathsf{PPT}$ inverter under the same controls. Reversible, parallel, and randomized implementations must be covered; if the forward physical dynamics uses a random seed, that seed must be made part of the deterministic function input or the primitive must be labeled differently.
6. A dependency ledger showing that the proof does not assume $\mathsf{P}\ne\mathsf{NP}$, an existing one-way function, average-case inversion hardness, or a renamed assumption with the same formal content. A record that uses any unresolved hardness hypothesis must be marked conditional on that hypothesis and does not count as unconditionally discharged for Theorem O.5.2g.

The certificate concerns uniform classical adversaries. It does not by itself claim security against nonuniform circuit families or quantum polynomial-time inverters. Collisions are allowed: inversion succeeds on any $x'$ of the locked input length with the same image.

**Theorem O.5.2g (Conditional One-Way Separation).** If $\mathfrak C_{\mathrm{OWF}}$ is accepted on an unconditional branch, with all clauses of Definition O.5.2f discharged and no unresolved hardness hypothesis in its dependency ledger, then the certified family is a standard one-way function and
$$
\mathsf{P}\ne\mathsf{NP}.
$$

*Proof.* The first conclusion follows from clauses 1–4 together with the accepted soundness and standard-model interpretation warrant. For the separation, suppose for contradiction that $\mathsf{P}=\mathsf{NP}$. Define the prefix-extension language
$$
L_{\mathrm{pref}}
:=
\left\{
\langle1^n,y,u\rangle:
|u|\le n
\text{ and }
\exists v\in\{0,1\}^{n-|u|}\;F(1^n,uv)=y
\right\}.
$$
This language is in $\mathsf{NP}$: the completion $v$ has length at most $n$, and the certified evaluator $F$ checks it in polynomial time. Under $\mathsf{P}=\mathsf{NP}$, let $D_{\mathrm{pref}}$ be a uniform deterministic polynomial-time decider for $L_{\mathrm{pref}}$.

Construct an inverter $\mathcal I_D$ on $(1^n,y)$. Let $\epsilon_{\mathrm{word}}$ denote the empty word. The inverter first queries $D_{\mathrm{pref}}(1^n,y,\epsilon_{\mathrm{word}})$. If the answer is no, it returns $\bot$. Otherwise initialize $u:=\epsilon_{\mathrm{word}}$. For $i=1,\ldots,n$, query whether $\langle1^n,y,u0\rangle\in L_{\mathrm{pref}}$. If yes replace $u$ by $u0$; if no replace $u$ by $u1$. The invariant is that the current prefix extends to a preimage of $y$. When the $0$ branch fails, the invariant guarantees that the $1$ branch succeeds. After exactly $n$ iterations, $u\in\{0,1\}^n$ and $f_n(u)=y$.

The algorithm makes $n+1$ polynomial-time queries on polynomial-length inputs, so $\mathcal I_D$ is a uniform deterministic polynomial-time inverter and hence belongs to $\mathsf{PPT}$. For every $y$ in the image of $f_n$, it returns some valid preimage; injectivity is not required. In particular, for $x\leftarrow U_n$,
$$
\operatorname{Adv}^{\mathrm{inv}}_{f,\mathcal I_D}(n)=1
$$
for every $n$. This contradicts (O.5.2.9), already for $c=1$. Therefore $\mathsf{P}\ne\mathsf{NP}$. ∎

**Corollary O.5.2g.1 (PU Separation Gate).** Theorems 10–11, Theorem J.1, Theorem O.3, and Theorem M.10.5 do not by themselves discharge $\mathfrak C_{\mathrm{OWF}}$. A PU proof through the one-way-function route of Theorem O.5.2g is unconditional only on a branch where one fixed family and the complete certificate of Definition O.5.2f have been unconditionally discharged, with neither unresolved nor circular hardness assumptions. For this route, there is presently no accepted certificate record:
$$
\boxed{\mathfrak C_{\mathrm{OWF}}=\varnothing_{\mathrm{cert}}\quad\text{(certificate pending)}.}
$$

Even after a valid $\mathsf{P}\ne\mathsf{NP}$ proof, one obtains a worst-case superpolynomial separation for some $\mathsf{NP}$ problems, not an automatic $2^{\Omega(n)}$ time lower bound, average-case hardness for a chosen forecasting distribution, or exponential physical energy cost. Those stronger conclusions require separate hypotheses such as an exponential-time assumption and a protocol-specific thermodynamic reduction.

*Proof.* The cited PU results establish, respectively, predictor-responsive diagonal obstruction, a conditional physical cost for a specified finite-memory reset, path-measure temporal asymmetry, and receiver-relative modeling limitations. By Theorem O.5.2e none supplies the fixed-family average-case quantifiers or success-preserving bridge required by Definition O.5.2f. The unconditional implication proved in Theorem O.5.2g applies once its full certificate antecedent is independently discharged. A certificate recorded under an unresolved hypothesis yields only the correspondingly conditional implication. Other logically possible routes to $\mathsf{P}\ne\mathsf{NP}$ are outside this certificate theorem. ∎

**Remark O.5.2h (Universe-as-Computation Boundary).** PU may use a common typed ledger to compare time's arrow, physical reset cost, witness generation, inversion, and self-reference. It may not identify them. The statement that the universe “computes itself” is an interpretive description of sequential physical evolution, not a theorem that the universe searches an exponentially large list, “knows” or fails to know its future, runs at a complexity-theoretic maximum speed, or derives time from $\mathsf{P}\ne\mathsf{NP}$. The defensible implication is the narrower conditional theorem: an independently certified $\mathfrak C_{\mathrm{OWF}}$ yields $\mathsf{P}\ne\mathsf{NP}$.

### O.5.3 Scoped Relativization Barrier, Certificate Status, and Restricted Inversion Theorems

Section O.5.2 proves that an unconditionally certified standard one-way function would imply $\mathsf{P}\ne\mathsf{NP}$, while SPAP, candidate counting, and physical reset cost do not supply that certificate by identification alone. This section adds four limited results: a relativization barrier for derivations whose premises are oracle-stable and whose computational steps are separately proved oracle-natural; a certificate-submission audit that preserves conditionality and incompleteness; two unconditional restricted inversion obstructions; and a quantitatively stated conditional physical-hardness branch. It does not assert that every admissible bridge relativizes, classify every conceivable PU derivation, discharge a standard one-way-function certificate, or resolve $\mathsf{P}$ versus $\mathsf{NP}$.

**Definition O.5.3a (Common-Oracle Reading and Oracle-Natural Bridge).** Let $\mathcal O\subseteq\{0,1\}^*$ be an oracle. The *common-oracle reading* of a computational statement replaces every declared machine, predictor, verifier, evaluator, solver, and inverter by its $\mathcal O$-oracle version and gives the same oracle to every interacting side. A statement is *oracle-stable* when its common-oracle reading is true for every $\mathcal O$.

Let $\mathcal B$ be an admissible bridge in the sense of Definition O.5.2a from a source task to a target task. The bridge is *oracle-natural* only if it additionally contains fixed oracle-machine encoders, decoders, and solver transformations, together with polynomials and success-loss functions independent of $\mathcal O$, such that for every common oracle:

1. the oracle encoders and decoders implement the declared instance and output maps with the same polynomial length distortion;
2. every target oracle solver is transformed into a source oracle solver with the declared polynomial overhead;
3. the success predicates and the locked input-distribution transport commute with the encoding; and
4. the same quantitative success and distribution-loss bounds hold after oracle augmentation.

Equivalently, the solver-reduction and distribution-transport diagrams commute after adjoining every common oracle. A derivation is *oracle-natural* when the same finite inference schema derives the common-oracle conclusion from the common-oracle premises for every $\mathcal O$; every nonlogical computational transformation used by that schema must carry its own oracle-naturality proof. Oracle-naturality is additional proof data. It does not follow merely from uniformity, polynomial overhead, or the seven admissibility clauses of Definition O.5.2a.

**Lemma O.5.3b (Registered Oracle-Stable Inputs).** The following schemas are oracle-stable on their stated readings.

(a) The deterministic and probabilistic SPAP diagonal statements are oracle-stable provided the common-oracle model class retains the represent/simulate/predicate-evaluate closure used by their diagonal constructions.

(b) Lemma O.5.2b and Proposition O.5.2c are unchanged by the common-oracle reading when their physical protocols, distributions, side information, and thermodynamic antecedents are held fixed, because their conclusions contain no oracle-dependent computational class.

(c) The decision-search equivalence relativizes:
$$
\mathsf{P}^{\mathcal O}=\mathsf{NP}^{\mathcal O}
\quad\Longleftrightarrow\quad
\text{every polynomially balanced }\mathsf{P}^{\mathcal O}\text{-decidable relation has an }\mathsf{FP}^{\mathcal O}\text{ total witness selector.}
$$

No unlisted PU statement is declared oracle-stable, and no bridge is declared oracle-natural, merely because it belongs to the PU scaffold.

*Proof.* For (a), give the nominated predictor and the responsive diagonal construction the same oracle. The construction still queries the predictor and applies the same fixed-point-free Boolean complement, so exact correctness still requires a bit to equal its complement. The probabilistic threshold construction is unchanged for the same reason. The conclusion is conditional on retention of the declared representation and oracle-simulation closure; oracle access does not establish that closure by itself.

For (b), the common-oracle operation has no machine class to replace in the locked entropy, reset, and forecast-information statements, so their readings are identical to the original conditional statements.

For (c), if the verifier is in $\mathsf{FP}^{\mathcal O}$, the prefix-extension language is in $\mathsf{NP}^{\mathcal O}$. Under $\mathsf{P}^{\mathcal O}=\mathsf{NP}^{\mathcal O}$, the same prefix search gives an $\mathsf{FP}^{\mathcal O}$ selector. Conversely, let $L$ be any language in $\mathsf{NP}^{\mathcal O}$ and apply the assumed selector to its polynomially balanced $\mathsf{P}^{\mathcal O}$-decidable verifier relation. The selector returns $\bot$ exactly off $L$ and a valid witness exactly on $L$, so $L\in\mathsf{P}^{\mathcal O}$. Hence $\mathsf{NP}^{\mathcal O}\subseteq\mathsf{P}^{\mathcal O}$, proving equality. ∎

**Theorem O.5.3c (Scoped Relativization Barrier).** Let $\Gamma$ be a set of oracle-stable premises. Let $D$ be an oracle-natural derivation from $\Gamma$, with every nonlogical computational bridge separately certified oracle-natural. Then $D$ cannot establish either of the following by that route:

(i) the common-oracle standard one-wayness assertion for a length-indexed family with polynomially bounded output length and one uniform oracle evaluator; or

(ii) the conclusion $\mathsf{P}\ne\mathsf{NP}$.

*Proof.* Choose a Baker-Gill-Solovay oracle $\mathcal O_{\mathrm{BGS}}$ satisfying
$$
\mathsf{P}^{\mathcal O_{\mathrm{BGS}}}
=
\mathsf{NP}^{\mathcal O_{\mathrm{BGS}}}
$$
[Baker, Gill & Solovay 1975]. Consider any family
$$
f_n^{\mathcal O_{\mathrm{BGS}}}:\{0,1\}^n\longrightarrow\{0,1\}^{m(n)}
$$
with polynomially bounded $m$, unary index $1^n$ supplied to the inverter, and one uniform evaluator in $\mathsf{FP}^{\mathcal O_{\mathrm{BGS}}}$. Its prefix-extension language is
$$
L_{\mathrm{pref}}^{\mathcal O_{\mathrm{BGS}}}
:=
\left\{
\langle1^n,y,u\rangle:
|u|\le n
\text{ and }
\exists v\in\{0,1\}^{n-|u|}\;
f_n^{\mathcal O_{\mathrm{BGS}}}(uv)=y
\right\}.
\tag{O.5.3.1}
$$
This language lies in $\mathsf{NP}^{\mathcal O_{\mathrm{BGS}}}=\mathsf{P}^{\mathcal O_{\mathrm{BGS}}}$. The prefix-search construction of Theorem O.5.2g therefore gives a uniform deterministic polynomial-time oracle inverter that returns a preimage for every image point. No such family is one-way against uniform $\mathsf{PPT}^{\mathcal O_{\mathrm{BGS}}}$ inverters.

Every premise in $\Gamma$ remains true at $\mathcal O_{\mathrm{BGS}}$, and oracle-naturality transports every step of $D$ to the common-oracle reading. A derived one-wayness conclusion would therefore hold at $\mathcal O_{\mathrm{BGS}}$, contradicting the perfect prefix inverter. Likewise, a derived separation would give $\mathsf{P}^{\mathcal O_{\mathrm{BGS}}}\ne\mathsf{NP}^{\mathcal O_{\mathrm{BGS}}}$, contradicting the choice of oracle. ∎

**Corollary O.5.3c.1 (Current Registered Route Only).** Any submitted derivation using only premises registered by Lemma O.5.3b and steps carrying the oracle-naturality record of Definition O.5.3a cannot discharge $\mathfrak C_{\mathrm{OWF}}$ or a direct $\mathsf{P}\ne\mathsf{NP}$ certificate. This corollary does not apply to a bridge lacking an oracle-naturality proof, a genuinely nonrelativizing argument, or a different future proof method.

*Proof.* Such a submitted derivation satisfies every hypothesis of Theorem O.5.3c. The scope exclusions are the negations of those hypotheses and therefore are not classified by the theorem. ∎

**Definition O.5.3d (Certificate-Submission Audit).** A submitted separation record is audited along the following non-exclusive dimensions.

1. A malformed inference, failed checker or soundness warrant, or missing required certificate field is not registered as a certificate.
2. A record containing an unresolved hypothesis $H$ is retained only on the branch conditional on $H$.
3. A record satisfying the hypotheses of Theorem O.5.3c is blocked from discharge by the scoped relativization barrier.
4. A proposed nonrelativizing step whose claimed lower bound has not been proved remains certificate-pending.
5. A certificate is discharged only when its finite proof object, named proof checker, standard-model soundness warrant, bridge obligations, and dependency ledger are all accepted with no unresolved assumption.

These are audit outcomes for submitted records, not an exhaustive classification of every informal or future idea. Write $\operatorname{Acc}_{\mathrm{cert}}(R)=1$ exactly when the submitted record $R$ passes item 5 under a named sound proof checker; merely naming or storing $R$ does not make this proposition true. Until an accepted proof object exists, the manuscript certificate ledger uses $\varnothing_{\mathrm{cert}}$ rather than introducing a positive theorem token. A machine-audited status additionally requires the executable and run package of Convention P.14.9a and Algorithm P.14.1m.0; Theorem P.14.1m.2 supplies only canonical encoding and round-trip.

**Definition O.5.3e (Direct Separation Certificate).** A direct separation certificate $\mathfrak C_{\mathrm{sep}}$ is a finite checked proof of $\mathsf{P}\ne\mathsf{NP}$ in a named formal theory $\mathsf T_{\mathrm{cert}}$, together with the accepted standard-model soundness warrant for the used fragment and a dependency ledger containing no unresolved assumption. It is a sufficient certificate format for a direct mathematical route that does not pass through one-wayness. This definition does not assert that every conceivable physical argument already has this form.

**Proposition O.5.3e.1 (Proof-Object Composition).** Suppose an accepted record contains a checked $\mathsf T_{\mathrm{cert}}$-derivation of $\mathsf{P}\ne\mathsf{NP}$ from finitely many premises $A_1,\ldots,A_r$ and, in the same interpreted theory, a checked proof of every $A_i$. Substitution of the premise proofs yields a checked $\mathsf T_{\mathrm{cert}}$-proof of $\mathsf{P}\ne\mathsf{NP}$ with no remaining premise $A_i$.

*Proof.* Replace each use of a premise rule introducing $A_i$ by the accepted finite derivation of $A_i$. Finiteness of the proof objects makes the substitution finite, and closure of the proof checker under composition verifies the resulting derivation. The conclusion is unchanged and has no undischarged $A_i$. ∎

**Corollary O.5.3e.2 (Marked Physical Hypotheses).** Let $\mathsf K$ be a named formal base theory supporting the deduction theorem, let $A$ be the declared formal translation of a physical hypothesis, and let $H$ denote the arithmetic sentence $\mathsf{P}\ne\mathsf{NP}$. If
$$
\mathsf K\cup\{A\}\vdash H,
$$
then
$$
\mathsf K\vdash A\rightarrow H.
$$
Without a proof $\mathsf K\vdash A$, the record is conditional on $A$ and does not establish $\mathsf K\vdash H$. If a proof of $A$ is later supplied in $\mathsf K$, modus ponens discharges the condition. No claim that $A$ is “at least as strong as” $H$ follows without a separate interpretation or conservativity theorem.

*Proof.* Let $\pi$ be the finite $\mathsf K\cup\{A\}$-derivation of $H$. Because $\mathsf K$ is assumed to support the deduction theorem, induction on the length of $\pi$ transforms every line $B$ of $\pi$ into a $\mathsf K$-derivation of $A\to B$: axioms of $\mathsf K$ are prefixed using propositional tautologies, the premise line $A$ becomes $A\to A$, and a modus-ponens step is transported by
$$
(A\to(B\to C))\to((A\to B)\to(A\to C)).
$$
Applying the transformation to the last line yields $\mathsf K\vdash A\to H$.

If $\mathsf K\nvdash A$, the transformed proof ends at $A\to H$ and supplies no rule deriving $H$ without the antecedent. If a derivation $\mathsf K\vdash A$ is supplied, combining it with $\mathsf K\vdash A\to H$ by modus ponens gives $\mathsf K\vdash H$. None of these syntactic steps defines an interpretation comparing the strength of $A$ and $H$, so no such comparison follows. ∎

**Proposition O.5.3f (Fixed-Exponent Deterministic All-Image Inversion Obstruction).** For every fixed $k\in\mathbb N$ there exists a length-preserving family $f^{(k)}=(f_n^{(k)})_{n\ge2}$ with one uniform polynomial-time evaluator such that every deterministic machine running in time $O(n^k)$ fails, at infinitely many input lengths, to return a valid preimage for at least one image point.

*Proof.* Fix $k$ and a universal multitape Turing machine whose binary program strings are interpreted under a total coding convention, with invalid strings assigned to one fixed dummy machine. Enumerate all binary program strings in length-lexicographic order and let $M_i$ be the machine represented by the $i$-th string. Every deterministic Turing machine has at least one index, the code of $M_i$ has length $O(\log i)$, and the index-to-code map is computable in time polynomial in $\log i$. Fix a universal simulator with running time bounded by a fixed polynomial in the simulated time, input length, and program length; for example, the standard multitape simulation bound $O(t\log t+\operatorname{poly}(|\langle M_i\rangle|+|w|))$ is sufficient. Define
$$
i_k(n):=\operatorname{ord}_2(n)+1,
$$
where $\operatorname{ord}_2(n)$ is the exponent of $2$ in $n$. Every machine index occurs at infinitely many lengths, and $i_k(n)\le1+\log_2 n$, so the selected program has length $O(\log\log n)$ and is recovered in time polynomial in $\log n$. On input $(1^n,x)$ with $x\in\{0,1\}^n$, the evaluator $F_k$ computes $i=i_k(n)$ and universally simulates $M_i(1^n,0^n)$ for $n^{k+1}$ simulated steps. If the simulation halts with an $n$-bit output, call it $z_n^{(k)}$; otherwise set $z_n^{(k)}:=1^n$. Define
$$
f_n^{(k)}(x)
:=
\begin{cases}
1^n,&x=z_n^{(k)},\\
0^n,&x\ne z_n^{(k)}.
\end{cases}
\tag{O.5.3.2}
$$
For fixed $k$, the declared simulation bound is polynomial in $n^{k+1}+n+|\langle M_i\rangle|$; index decoding is polynomial in $\log n$. Hence $F_k$ is one uniform polynomial-time evaluator. For $n\ge2$ there exists $x\ne z_n^{(k)}$, hence $0^n$ is always in the image.

Let $M=M_i$ run in at most $c n^k$ steps for all sufficiently large $n$. If it fails to return an $n$-bit candidate, it already fails inversion. Otherwise choose $n_0$ so that $c n^k\le n^{k+1}$ for $n\ge n_0$. At every sufficiently large length satisfying $i_k(n)=i$, the bounded simulation captures the actual output
$$
z_n^{(k)}=M(1^n,0^n).
$$
But $f_n^{(k)}(z_n^{(k)})=1^n$, so this candidate is not a preimage of the image point $0^n$. There are infinitely many such lengths. ∎

**Remark O.5.3f.1 (Exact Scope of the Residue).** Proposition O.5.3f has the quantifier form
$$
\forall k\;\exists f^{(k)}\;\forall M\in\operatorname{DTIME}(n^k)\;\exists^\infty n:
\quad
M(1^n,0^n)\notin\bigl(f_n^{(k)}\bigr)^{-1}(\{0^n\})
$$
with an adversarial image point. Standard one-wayness instead fixes one family before every polynomial-time randomized inverter and requires negligible average-case inversion success on the locked ensemble. Three independent upgrades are absent: one family for every polynomial exponent, deterministic-to-randomized security, and infinitely-often worst-case failure to negligible average-case success. The proposition is therefore a restricted diagonal obstruction, not a cryptographic one-way function and not progress on clause 4 of $\mathfrak C_{\mathrm{OWF}}$.

**Proposition O.5.3g (Weak $\mathsf{AC}^0$ Inversion Obstruction).** Define the prefix-difference bijection $g_n^{\oplus}:\{0,1\}^n\to\{0,1\}^n$ by
$$
g_n^{\oplus}(x)_1:=x_1,
\qquad
g_n^{\oplus}(x)_i:=x_{i-1}\oplus x_i
\quad(2\le i\le n).
\tag{O.5.3.3}
$$
Then:

(a) $g_n^{\oplus}$ is a bijection and
$$
(g_n^{\oplus})^{-1}(y)_i=y_1\oplus\cdots\oplus y_i;
$$

(b) no nonuniform polynomial-size constant-depth $\mathsf{AC}^0$ circuit family exactly inverts $g_n^{\oplus}$ on every input for all sufficiently large $n$; and

(c) let
$$
\delta_{d,s}^{\oplus}(n)
:=
\sup_{C\in\mathsf{AC}^0[d,s]}
\left|
\Pr_{y\leftarrow U_n}[C(y)=\operatorname{PARITY}_n(y)]-\frac12
\right|.
\tag{O.5.3.4}
$$
For every depth-$d$, size-$s(n)$, $n$-output circuit family $C_n$,
$$
\Pr_{y\leftarrow U_n}
\left[g_n^{\oplus}(C_n(y))=y\right]
\le
\frac12+\delta_{d,s(n)}^{\oplus}(n).
\tag{O.5.3.5}
$$
Håstad's parity-correlation theorem makes $\delta_{d,s(n)}^{\oplus}(n)$ negligible for fixed $d$ and polynomial $s(n)$ [Håstad 1986; Håstad 2014]. Randomized nonuniform circuits satisfy the same bound after fixing, at each length, a coin string attaining at least their average success.

*Proof.* Telescoping gives
$$
y_1\oplus\cdots\oplus y_i
=
x_1\oplus(x_1\oplus x_2)\oplus\cdots\oplus(x_{i-1}\oplus x_i)
=x_i,
$$
proving (a). If a circuit exactly inverted every $y$, its final output bit would compute $y_1\oplus\cdots\oplus y_n$, contradicting the $\mathsf{AC}^0$ parity lower bound [Furst, Saxe & Sipser 1984; Håstad 1986]. This proves (b). For (c), successful inversion of the full vector implies that the final output bit equals $\operatorname{PARITY}_n(y)$. The agreement probability of that output circuit is bounded by the definition of $\delta_{d,s}^{\oplus}$. If a randomized nonuniform circuit has success $p_n$ over inputs and coins, averaging supplies one fixed coin string with input success at least $p_n$, so the deterministic bound applies. ∎

**Corollary O.5.3g.1 (No Strong-One-Way Certificate from the Displayed Bound).** Equation (O.5.3.5) has upper bound $1/2+\operatorname{negl}(n)$ at fixed depth and polynomial size, not a negligible upper bound on inversion success. Therefore the displayed last-bit reduction does not by itself discharge the strong negligible-inversion clause of $\mathfrak C_{\mathrm{OWF}}$, even after replacing its adversary class by $\mathsf{AC}^0$. It also does not prove the opposite claim that full-vector inversion has non-negligible success. Any amplification claim requires a separately defined amplified family and a proved reduction preserving the declared circuit depth, size, input law, and any-preimage predicate.

*Proof.* A function bounded above by $1/2+\operatorname{negl}(n)$ need not be negligible. The bound is also only an upper bound and supplies no non-negligible lower bound. Hence neither strong one-wayness nor its negation follows from (O.5.3.5). ∎

**Definition O.5.3h (Physical Hardness Postulate and PPT-to-PU Simulation Certificate).** Fix one deterministic uniform length-preserving family
$$
f_{\mathrm{PHP},n}:\{0,1\}^n\to\{0,1\}^n
$$
with a checked polynomial-time evaluator, $X_n\leftarrow U_n$, and challenge $Y_n=f_{\mathrm{PHP},n}(X_n)$. For every $n$, declare physical input and output state spaces $\mathcal Z_n^{\mathrm{PHP}}$ and $\mathcal W_n^{\mathrm{PHP}}$, together with uniform maps
$$
\operatorname{Enc}^{\mathrm{PHP}}_n:
\{1^n\}\times\{0,1\}^n\to\mathcal Z_n^{\mathrm{PHP}},
\qquad
\operatorname{Dec}^{\mathrm{PHP}}_n:
\mathcal W_n^{\mathrm{PHP}}\to\{0,1\}^n\cup\{\bot\}.
$$
The encoder prepares the physical representation of the security parameter and challenge; the decoder returns either one candidate preimage or the failure symbol $\bot$. For each permitted uniform PU protocol family $\Pi$ with declared physical-randomness law $R_{\Pi,n}$, require the typed action
$$
\Pi_n:
\mathcal Z_n^{\mathrm{PHP}}\times\operatorname{supp}(R_{\Pi,n})
\to\mathcal W_n^{\mathrm{PHP}}.
$$
These section-local maps are not the sampling map $E_n$ or any other encoder or decoder already used elsewhere in PU. A uniform realization map assigns each protocol family and security parameter a physically realizable implementing microstate
$$
\operatorname{Real}_{\mathrm{PU}}(\Pi,n)=\mu_{\Pi,n}\in\mathcal S_{\mathrm{phys}}.
$$
The microstate includes the encoder, decoder, randomness source, error correction, repetitions, controller, workspace, and every other implementation component. Predictive Physical Complexity is applied only to that microstate, as $C_P(\mu_{\Pi,n})$, in accordance with Equation (1); it is not applied directly to the abstract protocol.

For such a protocol family $\Pi$, define
$$
\operatorname{Adv}^{\mathrm{PU}}_{f_{\mathrm{PHP}},\Pi}(n)
:=
\Pr_{\substack{X_n\leftarrow U_n\\\omega\leftarrow R_{\Pi,n}}}
\left[
\begin{array}{c}
x'=\operatorname{Dec}^{\mathrm{PHP}}_n\!\left(
\Pi_n\!\left(\operatorname{Enc}^{\mathrm{PHP}}_n(1^n,f_{\mathrm{PHP},n}(X_n)),\omega\right)
\right)\in\{0,1\}^n,\\
f_{\mathrm{PHP},n}(x')=f_{\mathrm{PHP},n}(X_n)
\end{array}
\right].
$$

A PPT-to-PU simulation certificate $\mathfrak C_{\mathrm{PPT}\to\mathrm{PU}}$ proves that for every fixed uniform $\mathsf{PPT}$ inverter $\mathcal I$ there are a uniform compiled PU protocol family $\Pi_{\mathcal I}$, polynomials $p_{\mathcal I}$ and $q_{\mathcal I}\ge1$, and a negligible function $\nu_{\mathcal I}$ such that, for all sufficiently large $n$,
$$
C_P(\mu_{\Pi_{\mathcal I},n})\le p_{\mathcal I}(n),
\qquad
\operatorname{Adv}^{\mathrm{PU}}_{f_{\mathrm{PHP}},\Pi_{\mathcal I}}(n)
\ge
\frac{\operatorname{Adv}^{\mathrm{inv}}_{f_{\mathrm{PHP}},\mathcal I}(n)}{q_{\mathcal I}(n)}
-\nu_{\mathcal I}(n).
\tag{O.5.3.6}
$$
The physical input is the encoding of $(1^n,Y_n)$; physical randomness has the same law as the inverter's coins or a declared negligible total-variation discrepancy absorbed into $\nu_{\mathcal I}$; and decoding uses the standard any-preimage predicate. The compiler may depend on the fixed inverter's code and polynomial clock, but not on the sampled challenge, a hidden trapdoor, nonuniform advice, or length-specific tables. The security parameter and every encoding and resource overhead change by at most a polynomial.

Let $\mathsf{PU}_{\mathrm{poly}}$ be the uniform permitted protocol families $\Pi$ for which $C_P(\mu_{\Pi,n})\le p_\Pi(n)$ eventually for some fixed polynomial $p_\Pi$. The marked Physical Hardness Postulate is
$$
[\mathrm{PHP}]_{f_{\mathrm{PHP}}}:
\quad
\forall\Pi\in\mathsf{PU}_{\mathrm{poly}}\;
\forall c\in\mathbb N_{>0}\;
\exists N_{\Pi,c}\;
\forall n\ge N_{\Pi,c}:
\operatorname{Adv}^{\mathrm{PU}}_{f_{\mathrm{PHP}},\Pi}(n)<n^{-c}.
\tag{O.5.3.7}
$$
The postulate is an unresolved physical hardness hypothesis unless it receives an independent accepted proof object. The simulation certificate has its own independent status; if it is assumed rather than proved, both entries remain in the dependency ledger.

**Theorem O.5.3h.1 (Conditional Physical-Hardness Implication).** In the extended theory containing $[\mathrm{PHP}]_{f_{\mathrm{PHP}}}$ and an accepted $\mathfrak C_{\mathrm{PPT}\to\mathrm{PU}}$,
$$
[\mathrm{PHP}]_{f_{\mathrm{PHP}}}
\wedge
\bigl[\operatorname{Acc}_{\mathrm{cert}}(\mathfrak C_{\mathrm{PPT}\to\mathrm{PU}})=1\bigr]
\quad\Longrightarrow\quad
f_{\mathrm{PHP}}\text{ is a standard one-way function}
\quad\Longrightarrow\quad
\mathsf{P}\ne\mathsf{NP}.
$$
The conclusion is conditional on every unresolved antecedent shown in the ledger.

*Proof.* Suppose a fixed uniform $\mathsf{PPT}$ inverter $\mathcal I$ has non-negligible inversion success. Then there is a polynomial $r_{\mathcal I}$ and infinitely many $n$ such that
$$
\operatorname{Adv}^{\mathrm{inv}}_{f_{\mathrm{PHP}},\mathcal I}(n)
\ge\frac1{r_{\mathcal I}(n)}.
$$
Equation (O.5.3.6) gives, on all sufficiently large lengths in this infinite set,
$$
\operatorname{Adv}^{\mathrm{PU}}_{f_{\mathrm{PHP}},\Pi_{\mathcal I}}(n)
\ge
\frac1{q_{\mathcal I}(n)r_{\mathcal I}(n)}-\nu_{\mathcal I}(n)
\ge
\frac1{2q_{\mathcal I}(n)r_{\mathcal I}(n)},
$$
because $\nu_{\mathcal I}$ is negligible. The compiled realization satisfies $C_P(\mu_{\Pi_{\mathcal I},n})\le p_{\mathcal I}(n)$ and has inverse-polynomial success at infinitely many lengths, contradicting (O.5.3.7). Thus every uniform $\mathsf{PPT}$ inverter has negligible success and $f_{\mathrm{PHP}}$ is one-way. The prefix-search proof of Theorem O.5.2g supplies the mathematical implication from one-way-function existence to $\mathsf{P}\ne\mathsf{NP}$. Here that proof is used under the displayed hypotheses; the unconditional certificate antecedent of Theorem O.5.2g is not asserted. ∎

**Corollary O.5.3h.2 (Formal Counterexamples and Finite-$n$ Tests).** On a branch with an accepted simulation certificate:

1. a uniform PU protocol family carrying proofs that $C_P(\mu_{\Pi,n})$ is polynomially bounded and that its asymptotic inversion success is non-negligible refutes $[\mathrm{PHP}]_{f_{\mathrm{PHP}}}$;
2. a uniform $\mathsf{PPT}$ inverter with non-negligible success, together with the verified simulation guarantee, yields such a PHP counterexample; and
3. a polynomial-time SAT decider yields a perfect polynomial-time inverter by prefix search and therefore yields the same contradiction through the simulation certificate.

An abstract inverter or SAT algorithm is a mathematical counterexample, not by itself an empirical falsifier. A finite laboratory run tests only separately registered finite-$n$ performance bounds; it does not establish or refute the asymptotic postulate without a uniform scalable protocol and its complexity and success certificates.

*Proof.* Clause 1 is the negation of the eventual-negligibility statement (O.5.3.7). Clause 2 follows from (O.5.3.6). For clause 3, a polynomial-time SAT decider implies $\mathsf{P}=\mathsf{NP}$ and the prefix construction returns a preimage for every image point; Equation (O.5.3.6) transports that success to the registered physical protocol. The finite-$n$ statement follows because finitely many samples cannot decide universal asymptotic quantifiers. ∎

**Remark O.5.3i (Exact Status).** The theorem-level conclusions of this section are precisely scoped:

1. oracle-natural derivations from registered oracle-stable premises cannot discharge standard one-wayness or $\mathsf{P}\ne\mathsf{NP}$;
2. Proposition O.5.3f gives a deterministic fixed-exponent, infinitely-often, all-image obstruction, not average-case one-wayness;
3. Proposition O.5.3g gives a weak $\mathsf{AC}^0$ inversion bound whose displayed reduction does not discharge negligible inversion; and
4. $[\mathrm{PHP}]_{f_{\mathrm{PHP}}}$ plus the quantified PPT-to-PU simulation certificate implies $\mathsf{P}\ne\mathsf{NP}$ only conditionally.

No accepted unconditional OWF or direct-separation proof object is supplied. The manuscript certificate ledger therefore remains
$$
\boxed{
\mathfrak C_{\mathrm{OWF}}=\varnothing_{\mathrm{cert}},
\qquad
\mathfrak C_{\mathrm{sep}}=\varnothing_{\mathrm{cert}},
\qquad
\mathfrak C_{\mathrm{PPT}\to\mathrm{PU}}=\varnothing_{\mathrm{cert}}.
}
$$
Nonrelativizing routes not covered by Theorem O.5.3c remain unclassified, not ruled out. Other proof barriers apply only after their separate hypotheses and their applicability to a proposed proof method are established; they are not promoted here to properties of a candidate function. The open mathematical problem is unchanged.

## O.6 Temporal Dynamics as the Substrate for Consciousness Complexity and Gravity

The coherent causal medium established in Theorem O.2 is not a passive or static background. Its dynamic properties provide the physical substrate for the framework's most advanced emergent phenomena: Consciousness Complexity (CC) and gravitational waves.

**O.6.1 Temporal Signaling as the Physical Basis for Perspectival Influence**

The establishment of a coherent causal medium is the necessary prerequisite for the emergence of Consciousness Complexity (CC), as described in Hypothesis 3. We propose that the CC influence channel $N(t)$ is realized through the controlled modulation of this temporal medium.

The causal chain proceeds as follows:
> 1.  **Context State to Physical Signal:** A complex MPU aggregate forms a stable, coherent internal model, represented by the **context state $\text{context}_S$** (Definition L.1). This abstract state is translated into a physical, time-varying signal $N(t)$ via a PCE-optimized mapping $\mathcal{M}$ (Appendix L, Theorem L.1). This signal emerges as a temporal wave modulation (Appendix L, Theorem L.8), manifesting primarily through the electromagnetic channel $E_{\mathrm{rad}}(t)$ (Theorem L.2), which dominates gravitational effects on the analyzed far-field classical-channel parameter range, with baseline ratio $\mathcal{R}\sim 10^{36}$ and conservative range $\mathcal{R}\sim 10^{33}\text{--}10^{39}$ (Appendix L, Proposition L.5).
> 2.  **Signal Modulates 'Evolve' Dynamics:** This physical signal $N(t)$ interacts with a target MPU during its 'Evolve' process (Definition 27), acting as a time-dependent term in the interaction Hamiltonian $H_{\mathrm{int}}$ (Appendix L, Equation L.87) and thereby modulating the parameters of the underlying ND-RID through AC Stark shifts (Corollary L.2.1) with rate modulation (Equation L.91).
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

Theorems O.3 and O.3a establish a time orientation on histories carrying their pathwise entropy-production certificates. Theorem O.7a derives Lorentzian signature on the separate branch carrying a rank-four positive Euclidean continuum tensor, a nonvanishing entropy-selected time covector whose kernel supplies the three-dimensional spatial subspace, a second-order continuum principal symbol, and a nondegenerate characteristic cone coinciding with an attained operational frontier.

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

The Appendix O signature closure is a four-input branch theorem: a rank-four positive-definite continuum tensor, a nonvanishing time covector oriented by Theorem 31 and Appendix J, a second-order continuum principal symbol, and a separately accepted nondegenerate characteristic cone coinciding with an attained operational frontier. Proposition F.1 supplies its stated discrete propagation cone and Theorem 46 supplies a uniform operational causal-speed upper bound; neither establishes frontier attainment or continuum cone coincidence. The fourth input may be supplied directly as Hypothesis O.7.2.4 or, for the retained sector family covered by a finite record, by an accepted cone-saturation certificate $\mathfrak C_{\mathrm{cone}}$ (Definition O.7.2.5) that explicitly includes attainment. On a branch combining Theorem Z.11's four-dimensional Euclidean carrier with a rank-four continuum realization and a separately accepted nonvanishing temporal covector, rank-nullity supplies the three-dimensional spatial kernel. These inputs then force the Lorentzian signature and normalize the characteristic speed to the separately accepted frontier.

**Remark O.7.2.0 (Second-Order Closure versus Signature Selection).** When the second-order and cone-coincidence inputs are supplied by finite certificates rather than by the direct hypotheses, the covered-sector signature reading is audited by the predictive well-posedness signature certificate $\mathfrak C_{\mathrm{sig}}$ of Definition 46a.1. The certificate excludes elliptic, ultrahyperbolic, constrained, higher-derivative, or nonlocal representatives that reproduce only a coarse finite-frontier behavior. Thus the finite-certificate implication used for covered sectors is
$$

\mathfrak C_2\wedge \mathfrak C_{\mathrm{cone}}\wedge \mathfrak C_{\mathrm{sig}}
\Longrightarrow
\text{one-time Lorentzian branch on the tested sector}.
$$
The direct Hypotheses O.7.2.1--O.7.2.4 remain the theorem-level route of Theorem O.7a.


**Hypothesis O.7.2.1 (Rank-Four Positive Continuum Tensor).** Assume the promoted continuum branch has a real rank-four tangent bundle on $M_{\mathrm{reg}}$ and carries the symmetric positive-definite Cheeger tensor $g^E$ of Theorem 45.

**Hypothesis O.7.2.2 (Entropy-Selected Time Coordinate, Spatial Kernel, and Propagation Identification).** Assume that $M_{\mathrm{reg}}$ carries a distinguished local time coordinate $t$ with $dt_x\ne0$ at every point and that retained histories carry Theorem O.3's independent pathwise certificate, with the future direction defined by increasing cumulative certified entropy production. Define
$$
S_x:=\ker dt_x.
$$
Then $\dim S_x=3$ by rank-nullity, and $g^E|_{S_x}$ is positive definite. Let $A_\Gamma^{ij}$ be the spatial propagation coefficient produced by the $\Gamma$-limit of §O.7.1. Require a registered common spatial frame and a specified positive density $\rho(x)>0$ such that
$$
A_\Gamma^{ij}(x)
=
\rho(x)\bigl(g^E|_{S_x}\bigr)^{-1,ij}.
\tag{O.7.2.2a}
$$
Write this registered coefficient as $A^{ij}$ in Hypotheses O.7.2.3--O.7.2.4. A fixed-ready-state reset and Theorem 31 may motivate the time orientation but do not construct the coordinate, discharge the pathwise certificate, or prove (O.7.2.2a); SPAP alone supplies none of them.

**Hypothesis O.7.2.3 (Second-order continuum closure).** Any local second-order continuum closure for a scalar probe field compatible with the quadratic limit on $M_{\mathrm{reg}}$ has principal symbol
$$
p_x(\xi) \;=\; G^{\mu\nu}(x)\,\xi_\mu\xi_\nu \;=\; a(x)\,\xi_0^2 + 2\,b^i(x)\,\xi_0\xi_i + A^{ij}(x)\,\xi_i\xi_j,
$$
with $\xi_0,\xi_i$ the cotangent components in the chart of Hypothesis O.7.2.2. This is the same second-order continuum premise used in §11.3 and §11.4.

**Definition O.7.2.3a (Second-Order Positivity Certificate $\mathfrak C_2$).** A second-order positivity certificate for a retained continuum sector is a finite record
$$
\mathfrak C_2
=
(\mathcal K_{\mathrm{CG}},\;\mathcal M_{\mathrm{Markov}},\;\mathcal R_{\mathrm{KM}},\;\mathcal R_{\mathrm{GKSL}},\;\mathcal N_{\mathrm{jump}},\;\mathcal R_\delta,\;\text{sector list},\;\text{forward lock})
$$
where $\mathcal K_{\mathrm{CG}}$ is the coarse-grained CP influence kernel, $\mathcal M_{\mathrm{Markov}}$ records the Markov diffusion reduction on the diagonal probability sector, $\mathcal R_{\mathrm{KM}}$ records the Kramers-Moyal expansion with finite second moments and locality/tightness bounds, $\mathcal R_{\mathrm{GKSL}}$ records the quantum CP-to-GKSL or quantum-Fokker-Planck reduction used for off-diagonal sectors, $\mathcal N_{\mathrm{jump}}$ certifies that retained jump, nonlocal, fractional, or infinite-order pseudodifferential sectors are absent from the claimed local field, and $\mathcal R_\delta$ certifies that all discarded higher-order response data are below the operational resolution and PPI-null.

**Proposition O.7.2.3b (Certificate Discharge of Second-Order Closure).** For any sector covered by an accepted $\mathfrak C_2$, Hypothesis O.7.2.3 is discharged for that sector. Complete positivity alone does not discharge the hypothesis, Pawula-type positivity applies only after the recorded Markov/Kramers-Moyal reduction, and finite resolution removes the infinite-order branch only when $\mathcal R_\delta$ proves the residual higher-order response is PPI-null.

*Proof.* On the recorded Markov diffusion branch, positivity of the diagonal probability kernel and the Kramers-Moyal hypotheses invoke the Pawula alternative: a positivity-preserving finite truncation is of order at most two unless the full infinite series is retained. The GKSL/Fokker-Planck record supplies the corresponding complete-positivity constraint for the quantum sector. The no-jump and no-nonlocal entries remove retained Lévy, jump, fractional, or pseudodifferential alternatives. Finally, $\mathcal R_\delta$ shows that any remaining all-orders terms carry no retained finite response at the operational resolution. Nondegeneracy then leaves the second-order principal symbol displayed in Hypothesis O.7.2.3 for propagating covered sectors. ∎

**Definition O.7.2.3c (Mixing Gaussian-Scaling Audit).** Augment an accepted second-order certificate by a centered stationary increment process, diffusive rescaling, the moment and strong-mixing summability required by named CLT/Berry-Esseen results, and constants $c_2>0$, $C_m<\infty$ satisfying
$$
a_2(v,v)\ge c_2\delta^2|v|^2,
\qquad \|a_m\|\le C_m\delta^m\quad(m\ge3).
\tag{O.7.2.3c.1}
$$

**Proposition O.7.2.3d (Higher-Order Symbol Bound at Observed Wavenumbers).** Under Definition O.7.2.3c, for every $m\ge3$ and
$$
0<|k|\le L_{\mathrm{obs}}^{-1},
$$
one has
$$
\frac{|a_m[k^{\otimes m}]|}{a_2[k,k]}
\le\frac{C_m}{c_2}
\left(\frac{\delta}{L_{\mathrm{obs}}}\right)^{m-2}.
\tag{O.7.2.3d.1}
$$
This is a deterministic higher-order-symbol estimate. A Gaussian convergence rate follows only if the audit record additionally identifies a particular central-limit or Berry--Esseen theorem and verifies all of that theorem's moment and mixing hypotheses.

*Proof.* The operator-norm bound in Definition O.7.2.3c gives
$$
|a_m[k^{\otimes m}]|
\le\lVert a_m\rVert |k|^m
\le C_m\delta^m|k|^m.
$$
The ellipticity bound gives
$$
a_2[k,k]\ge c_2\delta^2|k|^2>0.
$$
Division is therefore valid and yields
$$
\frac{|a_m[k^{\otimes m}]|}{a_2[k,k]}
\le
\frac{C_m}{c_2}(\delta|k|)^{m-2}
\le
\frac{C_m}{c_2}
\left(\frac{\delta}{L_{\mathrm{obs}}}\right)^{m-2},
$$
where the last inequality uses $m\ge3$ and $|k|\le L_{\mathrm{obs}}^{-1}$. No probability limit follows from these symbol inequalities alone. ∎

**Hypothesis O.7.2.4 (Nondegenerate causal cone).** Assume a separately established attained operational frontier whose speed obeys the uniform upper bound of Theorem 46 and whose discrete propagation compatibility is recorded by Proposition F.1. This frontier is nondegenerate at every point of $M_{\mathrm{reg}}$ and coincides with the characteristic cone of $p_x$: for every nonzero spatial covector $k_i$, the polynomial
$$
\omega \;\longmapsto\; p_x(\omega,k) \;=\; a(x)\,\omega^2 + 2b^i(x)\,\omega\,k_i + A^{ij}(x)\,k_i\,k_j
$$
has two distinct real roots in $\omega$.

**Definition O.7.2.5 (Cone-Saturation Certificate $\mathfrak C_{\mathrm{cone}}$).** A cone-saturation certificate for a retained sector family is a finite proof record
$$
\mathfrak C_{\mathrm{cone}}
=
(\Sigma_{\mathrm{sec}},\mathcal V_{\mathrm{front}},\mathcal A_{\mathrm{front}},\mathcal N_{\mathrm{char}},\mathcal I_{\mathrm{cone}},u\text{-datum},\mathcal A_{\mathrm{attr}},(H_{\xi\xi},D_{\xi\xi}),\xi_{\mathrm{res}},\text{forward lock}).
$$
Here $\Sigma_{\mathrm{sec}}$ lists the covered second-order symbols; $\mathcal V_{\mathrm{front}}$ identifies the common ND-RID protocol family and the positive speed function $c(x)$ subject to Theorem 46's upper bound; $\mathcal A_{\mathrm{front}}$ proves that this operational frontier is attained on the covered domain; $\mathcal N_{\mathrm{char}}$ proves that every covered symbol has two distinct real characteristic roots for every nonzero spatial covector; and $\mathcal I_{\mathrm{cone}}$ proves exact equality of each covered characteristic cone with that attained operational frontier. The remaining entries retain the utilization, attractor, Hessian/noise, residual, and forward-lock data.

An accepted certificate that discharges Hypothesis O.7.2.4 must certify
$$
\xi_{\mathrm{res}}=\xi_{\mathrm{cone}}(\Sigma_{\mathrm{sec}})=0
$$
and must contain accepted proof objects for $\mathcal A_{\mathrm{front}}$, $\mathcal N_{\mathrm{char}}$, and $\mathcal I_{\mathrm{cone}}$. A record proving only $0\le\xi_{\mathrm{cone}}\le\xi_{\mathrm{res}}$ with $\xi_{\mathrm{res}}>0$ is an approximate cone-audit record; it does not discharge attainment, nondegeneracy, or exact cone coincidence. The certificate covers only its listed sectors, domain, and resolution and does not discharge Hypothesis O.7.2.3.

**Definition O.7.2.5a (Desynchronization Cone-Rigidity Certificate).** For a finite sector graph, one forward-locked record fixes $c_A>0$, $\bar c_{AB}=(c_A+c_B)/2$, tolerances $\xi_{AB}\ge0$, and a single protocol family, resolution, and quotient map
$$
q_{\mathrm{resp}}:V_{\mathrm{sec}}\to\mathfrak Q_{\mathrm{front}}.
$$
Every edge obeys
$$
\left|\frac{c_A-c_B}{\bar c_{AB}}\right|\le\xi_{AB},
\qquad q_{\mathrm{resp}}(A)=q_{\mathrm{resp}}(B).
\tag{O.7.2.5a.1}
$$
Any nonadjacent numerical tolerance requires a separate path-accumulation ledger.

**Proposition O.7.2.5b (Connected Response Class).** A connected component maps to one element of $\mathfrak Q_{\mathrm{front}}$. Connectivity alone gives no uniform numerical tolerance between nonadjacent speeds.

*Proof.* Equality in a common quotient is transitive along a finite path; numerical edge errors may accumulate. ∎

**Remark O.7.2.6 (Finite Speed versus Cone Saturation).** Theorem 46 supplies a uniform operational causal-speed upper bound for serialized ND-RID substrate propagation. It does not establish an attained frontier, prove that every retained continuum sector saturates a frontier, or show that all sector characteristic cones coincide. Frontier attainment and sector-cone saturation are branch statements only when directly derived or supplied by accepted records. An accepted $\mathfrak C_{\mathrm{desync}}^{\mathrm{cone}}$ supplies only the edgewise finite-response quotient statement of Proposition O.7.2.5b unless its path and sector-coverage entries also discharge the full frontier-attainment and cone-saturation record.

**Theorem O.7a (Hyperbolic Signature Closure).** Under Hypotheses O.7.2.1–O.7.2.4, for every $x\in M_{\mathrm{reg}}$:

(a) *Negative time-time component.* $a(x)<0$.


(b) *Lorentzian inertia.* The symmetric matrix
$$
G^{\mu\nu}(x) \;=\; \begin{pmatrix} a(x) & b^j(x)\\ b^i(x) & A^{ij}(x)\end{pmatrix}
$$
has inertia $(1,0,3)$: exactly one negative eigenvalue and three positive eigenvalues. Equivalently, the principal symbol has Lorentzian signature $(-,+,+,+)$. ∎

The four-hypothesis package may be displayed as the antecedent
$$
\mathrm{EntropyTime}
\,\land\,
\mathrm{PositiveSpatialBlock}
\,\land\,
\mathrm{SecondOrderClosure}
\,\land\,
\mathrm{NondegenerateCone}
\;\Longrightarrow\;
\mathrm{LorentzianSignature}\ (-,+,+,+),
$$
with the four antecedents supplied by the rank-four continuum branch of Theorem 45, Theorem 31 plus §O.4 and Hypothesis O.7.2.2 (entropy-selected time and its rank-three spatial kernel), Hypothesis O.7.2.3 (second-order continuum closure), and Hypothesis O.7.2.4, whose operational-speed upper-bound input is supplied by Theorem 46 plus Theorem P.8.4, while its attained-frontier, nondegeneracy, and cone-coincidence inputs remain branch clauses of the characteristic principal symbol. The signature conclusion is conditional theorem-level on this branch; neither the Euclidean carrier dimension nor entropy-time selection alone forces the Lorentzian signature without the other structural inputs.

*Proof of (a).* Fix $x$ and consider the characteristic polynomial in $\omega$ with $k\in S_x^*\setminus\{0\}$. Hypotheses O.7.2.1–O.7.2.2 and rank-nullity give $\dim S_x^*=3$, so the orthogonal complement $\{k:b^ik_i=0\}\subset S_x^*$ is at least two-dimensional and contains nonzero $k$. For any such $k$, the polynomial simplifies to $p_x(\omega,k)=a(x)\omega^2+A^{ij}(x)k_i k_j$ with discriminant
$$
\Delta(k) \;=\; -4\,a(x)\,A^{ij}(x)\,k_i k_j.
$$

By Hypothesis O.7.2.1, $A^{ij}k_ik_j>0$; by Hypothesis O.7.2.4, $\Delta(k)>0$. Hence $a(x)<0$.

*Proof of (b).* For $t\in\mathbb R$ and $x\in\mathbb R^3$, the quadratic form of $G$ is
$$
q(t,x)=at^2+2t\,b^Tx+x^TAx.
$$
Since $A$ is positive-definite, it is invertible. Set
$$
y:=x+tA^{-1}b.
$$
Then
$$
y^TAy
=x^TAx+2t\,b^Tx+t^2b^TA^{-1}b,
$$
and consequently
$$
q(t,x)
=y^TAy+\bigl(a-b^TA^{-1}b\bigr)t^2.
$$
The map $(t,x)\mapsto(t,y)$ is invertible, so it preserves the maximal dimensions of positive and negative subspaces of the quadratic form. The first term has three positive directions because $A\succ0$. Moreover $A^{-1}\succ0$, so
$$
a-b^TA^{-1}b\le a<0,
$$
and the second term has one negative direction. There is no zero direction. Hence $G$ has exactly one negative and three positive eigenvalues, i.e. inertia $(1,0,3)$. ∎

**Corollary O.7a.1 (Entropy-orthogonal normal form).** Under the hypotheses of Theorem O.7a, at each $x\in M_{\mathrm{reg}}$ there is an orientation-preserving linear change of cotangent coordinates for which
$$
p_x(\xi)
=-\alpha(x)(\xi_0')^2
+\widetilde A^{ij}(x)\xi_i'\xi_j',
\qquad
\alpha(x)>0,
\qquad
\widetilde A(x)\succ0.
$$
After an orientation-preserving spatial orthonormalization,
$$
p_x(\xi)
=-\alpha(x)(\xi_0')^2
+\delta^{ij}\xi_i'\xi_j'.
$$
The algebraic normal-form construction preserves orientation. Preservation of a selected future cone is a separate restriction supplied by Hypothesis O.7.2.2; it does not follow from the determinant of the coordinate change.

*Proof.* Write the quadratic form as
$$
p_x(\xi)
=a\xi_0^2+2b^i\xi_0\xi_i+A^{ij}\xi_i\xi_j,
\qquad
a<0,
\qquad
A\succ0.
$$
Set $\alpha=-a>0$ and complete the square:
$$
p_x(\xi)
=-\alpha\left(\xi_0-\alpha^{-1}b^i\xi_i\right)^2
+\left(A^{ij}+\alpha^{-1}b^ib^j\right)\xi_i\xi_j.
$$
Thus
$$
\xi_0'
=\xi_0-\alpha^{-1}b^i\xi_i,
\qquad
\xi_i'=\xi_i,
\qquad
\widetilde A^{ij}
=A^{ij}+\alpha^{-1}b^ib^j.
$$
For every nonzero spatial covector $v$,
$$
v_i\widetilde A^{ij}v_j
=v_iA^{ij}v_j+\alpha^{-1}(b^iv_i)^2>0,
$$
so $\widetilde A\succ0$. The shear has determinant $1$. Choose an oriented orthonormalizing map $R\in GL^+(3,\mathbb R)$ with
$$
R^\top\widetilde A R=I_3;
$$
for example, take the positive-definite square root and, if necessary, an orientation-preserving orthogonal factor. Extending $R$ trivially in the time coordinate gives a positive-determinant four-dimensional change of coordinates and the displayed normal form. No step proves invariance of a designated cone under the coordinate change; that restriction is imposed separately by Hypothesis O.7.2.2. ∎

**Theorem O.7b (Operational Speed Normalization).** Assume the hypotheses of Corollary O.7a.1, a nondegenerate characteristic cone satisfying Hypothesis O.7.2.4, and a separately established attained local operational frontier with speed $c(x)>0$. Then in entropy-orthogonal, spatially orthonormal coordinates,
$$
p_x(\xi)=-\frac{\xi_0^2}{c(x)^2}+\delta^{ij}\xi_i\xi_j.
$$
Theorem 46 supplies only
$$
0<c(x)\le\frac{\delta w_{\max}}{\tau_{\min}}
$$
on such an attained-frontier branch; it supplies no uniform positive lower bound for $c(x)$. On the separately accepted normalized uniform-weight branch with an attained one-link frontier, $c(x)\equiv c=\delta/\tau_{\min}$.

*Proof.* Corollary O.7a.1 gives $p_x(\xi)=-\alpha(x)\xi_0^2+|\xi|^2$ with $\alpha(x)>0$. Its null relation has characteristic speed $1/\sqrt{\alpha(x)}$. Cone coincidence with the separately established attained frontier therefore gives $\alpha(x)=1/c(x)^2$. Theorem 46 gives the displayed upper bound. The normalized equality uses the additional uniform-weight and one-link-attainment hypotheses. A lower edge weight together with a lower traversal-time bound does not imply a positive lower speed. ∎

**Corollary O.7b.1 (Derived Tangent-Frame Lorentz Group and Local Lorentz Kinematics).** As a consequence of Theorems O.7a and O.7b:

(a) After the rescaling $\xi_0':=\xi_0/c(x)$, the principal symbol takes the standard Minkowski form $p_x(\xi)=\eta^{\mu\nu}\xi_\mu\xi_\nu=-\xi_0^2+\delta^{ij}\xi_i\xi_j$. Its linear isometry group is $O(1,3)$.


(b) Requiring preservation of spatial orientation (from the oriented spatial $\Gamma$-limit of §O.7.1) and of the entropy-selected future cone (Hypothesis O.7.2.2) restricts $O(1,3)$ to the proper orthochronous Lorentz group $SO^+(1,3)$.

(c) The orthonormal frame bundle of the emergent metric obtained by duality from $p_x$ has structure group $SO^+(1,3)$.

(d) When the spin obstruction class $w_2(M_{\mathrm{reg}})\in H^2(M_{\mathrm{reg}};\mathbb Z/2)$ vanishes, spin lifts exist and each has structure group equal to the unique connected double cover $\mathrm{Spin}(1,3)\cong SL(2,\mathbb C)$. The group factor is therefore fixed on the spin-admissible branch, but the global spin structure need not be unique.

These conclusions concern the principal symbol, causal cone, and tangent-frame bundle. Lorentz covariance of the full realized matter dynamics additionally requires a common cone for every response-active sector, covariant lower-order and interaction terms, and compatible tensor or spinor representations; it does not follow from the tangent-frame result alone.

*Proof.* (a) Theorem O.7b gives
$$

p_x(\xi)=-\frac{1}{c(x)^2}\xi_0^2+\delta^{ij}\xi_i\xi_j.
$$
Writing $\xi_0':=\xi_0/c(x)$ gives
$$
p_x(\xi)=-(\xi_0')^2+\delta^{ij}\xi_i\xi_j.
$$
The linear transformations preserving this quadratic form are, by definition, the elements of $O(1,3)$.

(b) For $\Lambda\in O(1,3)$, the sign of $\det\Lambda$ records four-dimensional orientation, while the sign of $\Lambda^0{}_0$ distinguishes preservation from reversal of the chosen time cone. After the future time orientation is fixed by $\Lambda^0{}_0>0$, the condition $\det\Lambda=1$ is equivalent to preservation of the induced spatial orientation. The orientation chosen in §O.7.1 imposes $\det\Lambda=1$, and Hypothesis O.7.2.2 imposes $\Lambda^0{}_0>0$. Their intersection is the identity component $SO^+(1,3)$.

(c) An orthonormal frame at $x$ is an ordered basis whose Gram matrix is $\operatorname{diag}(-1,1,1,1)$. Two such frames differ by an element of $O(1,3)$. Restricting to frames with the chosen spatial orientation and future time orientation restricts every transition function to $SO^+(1,3)$; hence the oriented, time-oriented orthonormal frame bundle has that structure group.

(d) The spin-obstruction theorem [Milnor & Stasheff 1974] applies to the oriented frame bundle from (c): its hypotheses are an oriented tangent bundle and the second Stiefel--Whitney class $w_2(M_{\mathrm{reg}})$. It states that a lift through the connected double cover exists exactly when $w_2(M_{\mathrm{reg}})=0$, and that the isomorphism classes of lifts, when nonempty, form a torsor for $H^1(M_{\mathrm{reg}};\mathbb Z/2)$. The connected double cover of $SO^+(1,3)$ is $\operatorname{Spin}(1,3)\cong SL(2,\mathbb C)$. Thus every lift has this structure group, whereas the global lift is unique only when the stated torsor has one element. ∎

**Corollary O.7b.2 (No Riemannian Replacement of the Causal Cone).** Under Hypotheses O.7.2.1–O.7.2.4, a positive-definite four-dimensional principal symbol cannot represent the separately accepted nondegenerate characteristic cone and attained operational frontier. If $H^{\mu\nu}$ is positive-definite, then
$$
H^{\mu\nu}\xi_\mu\xi_\nu>0
$$
for every nonzero covector $\xi$, so the characteristic set $H^{\mu\nu}\xi_\mu\xi_\nu=0$ is empty away from the zero covector and contains no nondegenerate two-sheet causal cone. Therefore a Riemannian symbol can enter the PU stack only as a Euclidean auxiliary description satisfying a separate reconstruction gate, such as the reflection-positivity gate of Appendix F; it cannot be the physical causal principal symbol of the regular branch.

*Proof.* The first claim is the definition of positive-definiteness applied to the quadratic symbol. A nondegenerate operational causal frontier requires nonzero characteristic covectors separating future and past propagation directions. A positive-definite symbol has no such nonzero null covectors, so it cannot satisfy Hypothesis O.7.2.4. Theorems O.7a and O.7b then leave only the Lorentzian signature branch under the stated hypotheses. ∎

Premise (A5) of §12 is therefore theorem-level only on the emergent-spacetime branch satisfying Hypotheses O.7.2.1–O.7.2.4, or on the retained-sector subbranch where an accepted $\mathfrak C_{\mathrm{cone}}$ supplies the cone-coincidence/nondegeneracy entry at the stated resolution.


## O.8 Conclusion

The framework obtains temporal coherence and a probabilistic forward orientation on explicitly certified branches.
*   **Temporal Coherence:** Under the statistical and ledger premises of Theorem O.1 and the connected low-noise detailed-balance hypotheses of Theorem O.2, stationary measures concentrate near synchronized phase configurations.
*   **The Arrow of Time:** Under the pathwise guarantee-level certificate of Theorem O.3a, a cycle satisfies $P_R/P_F\le e^{-h_{\min}}$; the factor $1/2$ requires the separate condition $h_{\min}\ge\ln2$. The registered binary-support and reset-cost ledgers do not by themselves establish this stochastic pathwise bound; SPAP alone does not require a physical state merge.
*   **Retained history and receiver-pattern scope:** Theorem O.4 distinguishes recurrence of an accessible state from deletion of a forward-locked retained history. Proposition O.4.2 grades the availability of Appendix M's receiver-pattern descriptors, not the existence of a thermodynamic arrow. External evaluation and integration-cost conclusions retain the model-access, decision, insulation, and pattern-specific reduction certificates of Theorems M.10.3 and M.10.5. None of these results forbids an external controller from restoring a selected accessible state.

The temporal-coherence and pathwise-arrow results can be combined with the CC and gravity sectors only on their common certified branch. A CC modulation requires the independent context-to-response and energy-accounting data of Appendices L and S. A gravitational-wave identification additionally requires the Appendix-B source tensor, the operational-continuum/AQFT bridge, the metric equation, and a linearized transverse-traceless propagation theorem. Appendix O supplies temporal ordering and, on Hypotheses O.7.2.1–O.7.2.4, a Lorentzian-signature branch; it does not by itself identify a temporal-coherence disturbance with a gravitational wave.


