# Appendix M: Formalism for Perspectival Quantum Dynamics

## M.1 Introduction

This appendix models how quantum records depend on the perspective from which they are registered. Its central result identifies when one perspective may use another's record.

**Technical ledger.**

This appendix gives a mathematical formalism for the Perspectival State ($S_{(s)}(t)$, Definition 24) and the registered `Evolve` instruments of Definition 27. It constructs a conditional perspective-update model, proves its stated finite-dimensional properties, analyzes Wigner's-Friend-type records, and isolates a certificate-scoped obstruction to one cross-perspective import. It does not claim a proof of every extended Wigner's-Friend protocol.

We use POP, PCE, the MPU of Definition 23, the full-context response closure of Principle 5b, the invariant SPAP response ledger of Principle 11b, and the quantum closure of Principles 8.0b–8.0c and Theorem 8.0d. Theorem 8.0d supplies $\mathcal H_0\cong\mathbb C^8$, the Born trace law, and a normalized quantum instrument for every registered verification; Principle 8.0c supplies the single retained outcome of each registered run. This appendix develops the remaining perspective dynamics of those registered instruments; its kernels do not re-postulate the carrier, Born weights, or actualization law.

The appendix is organized as follows:

- **Section M.2** formalizes the Perspectival State $S_{(s)}(t)=(\rho(t),s)$, with pure vectors as a special case, and equips the complete-flag Perspective Space $\Sigma\cong U(d_0)/U(1)^{d_0}$ with its declared Riemannian metric.

- **Section M.3** decomposes a registered quantum instrument from the conditional perspective kernel $G_{\text{persp}}(s'|s,k,N,\Delta t)$ and gives an explicit drift-diffusion realization on $\Sigma$.

- **Section M.4** applies that conditional instrument model to measurement records. The Born selector and single-run actualization remain inputs from the cited quantum branch rather than consequences of perspective diffusion.

- **Section M.5** records compatibility with finite-dimensional operator algebras, homogeneous spaces, and Markov kernels; it is not a consistency proof for the full physical theory.

- **Section M.6** gives a perspectival analysis of Wigner's Friend and proves a certificate-scoped obstruction for an actualized record imported across distinct perspectives without a sharing or invariance certificate. The complete Frauchiger--Renner protocol requires a separate formalization. The section also identifies the interaction context $N$ as the conditional entry point for the independently certificate-gated CC program.

- **Section M.7** concludes by synthesizing the contributions of the appendix and situating the perspectival formalism within the broader framework.


## M.2 The Perspectival State Formalized

We formally define the components describing the state of a Minimal Predictive Unit (MPU).

*   **Perspectival State:** As defined in Definition 24, the complete operational quantum state is $S_{(s)}(t)=(\rho(t),s)$.
*   **Quantum component:** $\rho(t)$ is a positive trace-one operator on $\mathcal H_0$. Pure states are the special case $\rho(t)=|\psi(t)\rangle\langle\psi(t)|$. The dimension $d_0=\dim\mathcal H_0$ satisfies $d_0\ge8$ on the Theorem 23 branch.
*   **Perspective index:** $s\in\Sigma$ records the registered interaction context or labeled projective basis. It is not a replacement for $\rho$ and does not purify a mixed state.
*   **Perspective Space $\Sigma$:** On the ordered rank-one context branch of Theorem 25 and Corollary 26, the Perspective Space $\Sigma$ is mathematically identified with the space of all possible ordered orthonormal bases (ONBs) of the Hilbert space $\mathcal{H}_0$, modulo phase equivalence. This space possesses the structure of the complete flag manifold, a compact complex homogeneous space, specifically $\Sigma \cong U(d_0)/U(1)^{d_0}$. Here, $U(d_0)$ is the unitary group on $\mathcal{H}_0$ and $U(1)^{d_0}$ is the maximal torus subgroup representing the freedom to choose phases for each basis vector independently.
*   **Metric on $\Sigma$:** Fix the normal homogeneous metric on $\Sigma=U(d_0)/U(1)^{d_0}$ induced by the Ad-invariant Hilbert–Schmidt inner product $\langle X,Y\rangle=-\operatorname{Tr}(XY)$ on the off-diagonal anti-Hermitian complement of the torus algebra. Let $g_\Sigma$ and $d_\Sigma$ denote its Riemannian metric and geodesic distance. Any alternative weighted flag metric must be declared separately because it changes the Hessian, Ricci tensor, and Wasserstein distance used below.

This structure $(\mathcal{H}_0, \Sigma, d_\Sigma)$ provides the formal mathematical setting for describing the state and dynamics of an MPU.

## M.3 Formalizing the Dual Dynamics

The framework posits Dual Dynamics for MPUs (Section 7.3.3). We formalize both components.

### M.3.1 Quantum Evolution between Registered Interactions

On the finite-dimensional Hilbert branch satisfying the continuity and time-translation hypotheses of Theorem 8.7, reset-free evolution is
$$
\rho(t_1)=U_0(t_1,t_0)\rho(t_0)U_0(t_1,t_0)^\dagger,
\qquad
U_0(t_1,t_0)
=
\mathcal T\exp\!\left[-\frac{i}{\hbar}\int_{t_0}^{t_1}\hat H(u)\,du\right].
$$
On a pure-state trajectory this is equivalent to
$$
i\hbar\frac{d}{dt}|\psi(t)\rangle=\hat H(t)|\psi(t)\rangle.
\tag{M.1}
$$
The unitary acts on $\rho$; the perspective label remains a separate registered component between `Evolve` events.

### M.3.2 Registered Instrument and Conditional Perspective Dynamics

Let the interaction record $N$ supply a normalized quantum instrument $\{\mathcal I_k^N\}_k$ on $\mathcal H_0$. For an initial state $\rho$ define
$$
p_k^N(\rho):=\operatorname{Tr}\mathcal I_k^N(\rho),
\qquad
\rho_k^N:=\frac{\mathcal I_k^N(\rho)}{p_k^N(\rho)}
$$
when $p_k^N(\rho)>0$. The instrument satisfies $\sum_k\mathcal I_k^N$ trace preserving. For a sharp projective Lüders instrument, $\mathcal I_k^N(\rho)=P_k\rho P_k$ and $p_k^N(\rho)=\operatorname{Tr}(\rho P_k)$.

Given outcome $k$, the perspective changes by a Markov kernel density $G_{\mathrm{persp}}(s'|s,k,N,\Delta t)$. The joint transition law is
$$
\frac{d\mathbb P\big((\rho_k^N,s')\mid(\rho,s),N,\Delta t\big)}{d\mu(s')}
=
p_k^N(\rho)\,
G_{\mathrm{persp}}(s'|s,k,N,\Delta t).
\tag{M.2}
$$
For every fixed $s,k,N,\Delta t$,
$$
G_{\mathrm{persp}}(s'|s,k,N,\Delta t)\ge0,
\qquad
\int_\Sigma G_{\mathrm{persp}}(s'|s,k,N,\Delta t)\,d\mu(s')=1.
\tag{M.3}
$$
Here $\mu$ is the normalized $U(d_0)$-invariant quotient probability measure on $\Sigma=U(d_0)/U(1)^{d_0}$ induced by normalized Haar measure on $U(d_0)$. Equation (M.2) separates the instrument probability from the conditional perspective kernel and applies to mixed, entangled-reduced, and pure states. The Born trace law and single-run selection retain the independent premises of the registered quantum branch; neither SPAP, PCE, nor the perspective diffusion derives them.

### M.3.3 Properties and an Explicit Drift-Diffusion Realization of the Conditional Perspective Kernel $G_{persp}$

The detailed interaction dependence of the conditional kernel $G_{persp}(s' | s, k, N, \Delta t)$ is not fixed uniquely at the present level of the framework: it encodes the physics of the interaction $N$ and may vary across admissible interaction models. What is fixed here is the structural decomposition (M.2), the normalization requirement (M.3), the ideal projective limit (M.4), and an explicit drift-diffusion realization whose short-time behavior matches the Gaussian-with-drift heuristic form and whose semigroup satisfies the robustness conditions used below. We therefore begin by stating the generic properties and then present that constructive realization.

*   **Dependence on Interaction $N$:** The kernel $G_{persp}$ depends fundamentally on the nature of the interaction $N$. Different interactions will induce different perspective dynamics.
*   **Ideal Projective Measurement Limit:** Let the apparatus record a complete outcome flag $s_k\in\Sigma$ whose distinguished ray is $[|k\rangle]$. A ray alone is not a point of the complete-flag manifold. In the idealized sharp limit the conditional kernel is required to converge weakly to
    $$
    G_{persp}(s' | s, k, N_{proj}, \Delta t \to \tau_{meas}) \Longrightarrow \delta_{\Sigma}(s',s_k) \quad \text{(M.4)}.
    $$

**Remark M.3.3a (Sharp-Projective Conditional Kernel and No Born Double Counting).** On the sharp projective perspective branch,
$$
G_{persp}(s'|s,k,N_{proj},\Delta t\to\tau_{meas})
=
\delta_\Sigma(s',s_k),
$$
where $\delta_\Sigma(\cdot,s_k)$ is the unique normalized Dirac Markov kernel supported at the apparatus-selected complete flag $s_k$. The Born factor remains outside $G_{persp}$ because the kernel is already conditional on the registered outcome $k$.

**Remark M.3.3b (Kolmogorov Kernel Reading).** On the standard-Borel finite-protocol branches, the instrument, perspective-update, Gibbs, and path laws are probability kernels on explicit measurable spaces. Finite histories have joint laws obtained by kernel composition; zero-measure fibers use regular conditional probabilities.
*   **Finite Interaction Model (Diffusion/Relaxation):** For a finite interaction, a candidate kernel may be biased toward $s_k$:
    $$
    G_{persp}(s' | s, k, N, \Delta t) = \mathcal{N}^{-1} \exp\left(-\frac{d_{\Sigma}^2(s',s_k)}{2\sigma^2(\Delta t, N)}\right) K(s', s, k, N) \quad \text{(M.5)}.
    $$
    Here $\sigma^2(\Delta t,N)$ is the declared width, $K$ records residual interaction dependence, and $\mathcal N$ is the finite normalizer when the displayed density is integrable. The strong-measurement statement $\sigma^2\to0$ is valid only on a branch whose normalized measures are proved to converge weakly to $\delta_{s_k}$.
    *   $\mathcal{N}$ is the normalization constant ensuring Equation (M.3).

#### M.3.3.1 Constructive realization of $G_{\mathrm{persp}}$

The following is an explicit generator on the perspective manifold
$\Sigma\cong U(d_{0})/U(1)^{d_{0}}$ whose time-$t$ transition kernel has the same short-time Gaussian-with-drift structure as the heuristic form (M.5) in the weak-measurement limit and, crucially, satisfies the robustness conditions of Lemma L.1.

**(a) Geometric setup**

Equip $\Sigma$ with the quotient Riemannian metric $g_\Sigma$ of Definition 25. Let $\Delta_{\Sigma}:=\operatorname{div}_{\Sigma}\nabla_{\Sigma}$ denote the corresponding **nonpositive** Laplace–Beltrami operator, so that $e^{t\Delta_{\Sigma}}$ is the heat semigroup on $\Sigma$.

**(b) Interaction-biased Markov diffusion generator**

Fix a complete target perspective $s_k\in\Sigma$, namely an ordered orthonormal flag selected by the measurement apparatus and carrying outcome label $k$. A single outcome ray is not sufficient to determine $s_k$. In a convex normal neighborhood of this complete flag, define
$$
V_k^{\mathrm{loc}}(s')
=
\frac{\lambda_{\mathrm{drift}}}{2}d_\Sigma^2(s',s_k),
\qquad
\lambda_{\mathrm{drift}}>0.
$$
For the global branch, choose as part of the interaction model a smooth function $V_{k,0}^{\mathrm{sm}}:\Sigma\to[0,\infty)$ with a unique global minimum at $s_k$ and with
$$
V_{k,0}^{\mathrm{sm}}(s')
=
\frac12d_\Sigma^2(s',s_k)
$$
on a sufficiently small normal neighborhood of $s_k$, and set $V_k^{\mathrm{sm}}=\lambda_{\mathrm{drift}}V_{k,0}^{\mathrm{sm}}$. The existence and choice of this global potential are interaction-model data. The notation $V_k$ denotes the local squared-distance potential on the local branch and the specified smooth potential on the global branch.
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
On the global smooth-potential branch, $\mathcal L_\Sigma^{(k)}$ is uniformly elliptic with smooth coefficients on compact connected $\Sigma$, so its positive-time kernel is smooth, strictly positive, and normalized. For the heat kernel of $\Delta_\Sigma$, the Minakshisundaram–Pleijel expansion [Minakshisundaram & Pleijel 1949] gives, before the cut locus,
$$
p_t(s,s')
\sim
\frac{e^{-d_\Sigma^2(s,s')/(4t)}}{(4\pi t)^{\dim\Sigma/2}}
\sum_{j=0}^{\infty}u_j(s,s')t^j,
$$
where
$$
u_0(s,s')=\det(d\exp_s)^{-1/2}
$$
in normal coordinates. On the parabolic near-diagonal regime $d_\Sigma(s,s')=O(\sqrt t)$, one has $u_0(s,s')=1+O(t)$, so the leading density is Gaussian with variance scale $\Theta(t)$. Adding the smooth drift changes the transport coefficients but retains the same elliptic short-time Gaussian scale. The local squared-distance generator requires a separately defined stopped or reflected process before its kernel can be called supported in a normal neighborhood.

**(d) Lipschitz contractivity (robustness)**

Let $W_2$ denote Wasserstein-2 distance on $\mathcal P(\Sigma)$. On the global smooth-potential branch, assume the global Bakry–Émery bound
$$
\operatorname{Ric}_\Sigma+\operatorname{Hess}_\Sigma V_k
\succeq
\kappa_{\mathrm{eff}}g_\Sigma
\qquad\text{on all of }\Sigma.
$$
Then the diffusion semigroup $P_t=e^{t\mathcal L_\Sigma^{(k)}}$ satisfies
$$
W_2(\mu P_t,\nu P_t)
\le
e^{-\kappa_{\mathrm{eff}}t}W_2(\mu,\nu)
\tag{M.5c}
$$
for all $\mu,\nu\in\mathcal P_2(\Sigma)$ [Bakry, Gentil & Ledoux 2014; Ambrosio, Gigli & Savaré 2008]. On a local normal-neighborhood branch, the same conclusion requires a separately defined stopped or reflected process and a curvature bound compatible with its boundary conditions. Equation (M.5c) is therefore conditional on the stated global bound, or on that separate local-process construction; no identification of $\kappa_{\mathrm{eff}}$ with $\lambda_{\mathrm{drift}}$ is made.
For $V_k=\lambda_{\mathrm{drift}}V_{k,0}$, the weak-interaction limit $\lambda_{\mathrm{drift}}\to0$ reduces the generator to the isotropic heat generator $\Delta_\Sigma$. If $V_{k,0}$ has the unique global minimizer $s_k$, its invariant measures
$$
d\pi_{k,\lambda}

=
Z_{k,\lambda}^{-1}e^{-\lambda V_{k,0}}\,d\mu
$$
converge weakly to $\delta_{s_k}$ as $\lambda\to\infty$. This equilibrium concentration does not establish the prescribed-duration kernel limit in Equation (M.4). That strong-readout transient limit is an additional interaction-model hypothesis unless a uniform singular-drift convergence theorem is supplied for the chosen $V_{k,0}$ and interaction-time scaling.

**(e) Consistency with ND-RID entropy budget**

For any finite $\lambda_{drift}$ on the global smooth-potential branch, the operator (M.5a) generates a Markov diffusion on the compact manifold $\Sigma$ with invariant density
$$
d\pi_k(s') = Z_k^{-1} e^{-V_k(s')}\,d\mu(s').
$$
Let $\mu_t\ll\pi_k$ denote the law of $s_t$ and write $f_t:=d\mu_t/d\pi_k$. For every $t>0$, elliptic smoothing makes $f_t$ smooth and positive. Reversibility and integration by parts on the compact boundaryless manifold give
$$
\begin{aligned}
\frac{d}{dt}H(\mu_t\mid\pi_k)
&=\int_\Sigma (1+\log f_t)\,\mathcal L_\Sigma^{(k),*}(f_t\pi_k)\\
&=\int_\Sigma (1+\log f_t)\,\mathcal L_\Sigma^{(k)}f_t\,d\pi_k\\
&=-\int_\Sigma \frac{\|\nabla_\Sigma f_t\|_{g_\Sigma}^2}{f_t}\,d\pi_k\\
&=-\int_\Sigma \|\nabla_\Sigma\log f_t\|_{g_\Sigma}^2\,d\mu_t\le0.
\end{aligned}
$$
Thus $H(\mu_0\mid\pi_k)-H(\mu_{\Delta t}\mid\pi_k)\ge0$ is a dimensionless relative-entropy decrease. It is not, by itself, heat or entropy exported to a physical environment. A thermodynamic interpretation requires a separately accepted local-detailed-balance certificate identifying $V_k=\beta H_k$ and recording the work and heat conventions. The registered-reset inequality $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ applies only when a physical reset with the stated conditional entropy is independently present; it does not follow from the diffusion identity.

## M.4 The Measurement Process Formalized

Let the initial perspectival state be $(\rho_0,s_{\mathrm{initial}})$ and let the registered interaction $N_{\mathrm{meas}}$ supply a normalized instrument $\{\mathcal I_i\}$ and a conditional perspective kernel. Unitary pre-interaction transport gives
$$
\rho_-
=
U_{\mathrm{total}}(t_0+\Delta t,t_0)\rho_0
U_{\mathrm{total}}(t_0+\Delta t,t_0)^\dagger.
\tag{M.6}
$$
For every outcome with $p_i>0$,
$$
p_i=\operatorname{Tr}\mathcal I_i(\rho_-),
\qquad
\rho_i'=\frac{\mathcal I_i(\rho_-)}{p_i}.
$$
Normalization of the conditional perspective kernel gives
$$
\begin{aligned}
P(\text{outcome }i)
&=
\int_\Sigma
p_iG_{\mathrm{persp}}
(s'|s_{\mathrm{initial}},i,N_{\mathrm{meas}},\Delta t)
\,d\mu(s')\\
&=p_i.
\end{aligned}
\tag{M.7}
$$
Given outcome $i$, draw $s'_{\mathrm{final}}$ from that kernel. The post-event state is
$$
S_{(s'_{\mathrm{final}})}(t_0+\Delta t)
=
(\rho_i',s'_{\mathrm{final}}).
\tag{M.8}
$$
For a sharp nondegenerate Lüders instrument and pure input, $\rho_i'=|i\rangle\langle i|$ and the pure-state shorthand of Definition 24 may be used. General instruments, degenerate outcomes, and reduced entangled states need not have vector poststates. The instrument, Born selector, single-run registration, and repeated-trial frequency law retain their independently stated quantum-branch premises; normalization of $G_{\mathrm{persp}}$ does not derive them.

**Theorem M.4a (Operational Record Consensus after Perspectival Actualization).**
Let $K$ be the finite outcome set of a registered instrument $\{\mathcal I_k\}_{k\in K}$ acting on the pre-event density operator $\rho_-$, and set
$$
p(k)=\operatorname{Tr}\mathcal I_k(\rho_-).
$$
This is the normalized outcome distribution supplied by Equation (M.7); for a nondegenerate sharp projective instrument and pure input it reduces to the usual vector Born formula. After a definite outcome has been registered relative to a participating perspective, let $r=1,\ldots,N$ be finite record channels carrying likelihood functions
$$
L_r:K\to[0,\infty)
$$
with the nonzero normalizer below, and let $w_r\ge0$ be fixed finite record weights. Zero-weight channels are omitted from support restrictions and from the product below. Define, on the probability simplex over $K$, the record-merging functional
$$
\mathcal J(q)
=
D_{\mathrm{KL}}(q\Vert p)
-
\sum_{r=1}^N w_r\sum_{k\in K}q(k)\log L_r(k),
\tag{M.4a.1}
$$
with zero positive-weight likelihoods handled by support restriction or by the limiting positive-likelihood approximation. If
$$
Z
:=
\sum_{k\in K}
p(k)
\prod_{r=1}^N L_r(k)^{w_r}
\tag{M.4a.2}
$$
is finite and positive, then the unique minimizer is
$$
q^*(k)
=
\frac{
p(k)\prod_{r=1}^NL_r(k)^{w_r}
}{
Z
}.
\tag{M.4a.3}
$$
If a nonempty positive-weight sharp record subfamily reports the same value $k_0$, $p(k_0)>0$, and each sharp record in that subfamily satisfies $L_r(k_0)=1$, $L_r(k)=0$ for $k\ne k_0$, then $q^*=\delta_{k_0}$ on the retained support. If there is no record evidence, so that every positive-weight $L_r$ is constant on the retained support, then $q^*=p$.

For a Byzantine finite-record layer, suppose at most $f$ of the $N$ record labels are arbitrary, all nonfaulty record channels report the actualized value $k_0$, and
$$
N>3f.
\tag{M.4a.4}
$$
Then $k_0$ is the unique label with more than $2N/3$ record support. Hence the finite record layer has a unique supermajority consensus value before the likelihood merge (M.4a.3) is applied.

*Proof.* On the relative interior of the retained support of $p$, $D_{\mathrm{KL}}(q\Vert p)$ is strictly convex in $q$, and the second term in (M.4a.1) is linear in $q$. Therefore $\mathcal J$ is strictly convex on the retained support and has at most one minimizer. Introducing a Lagrange multiplier $\lambda$ for $\sum_k q(k)=1$ gives
$$
0
=
\frac{\partial}{\partial q(k)}
\left[
\mathcal J(q)+\lambda\left(\sum_jq(j)-1\right)
\right]
=
\log\frac{q(k)}{p(k)}+1
-
\sum_r w_r\log L_r(k)
+\lambda.
$$
Solving for $q(k)$ and normalizing gives (M.4a.3). Constant positive-weight likelihoods cancel in the normalizer and return $q^*=p$. A positive-weight sharp record with value $k_0$ assigns zero likelihood to every $k\ne k_0$, so the retained support of the product in (M.4a.2) is contained in $\{k_0\}$. The conditions $p(k_0)>0$ and $Z>0$ leave exactly $k_0$, giving $q^*=\delta_{k_0}$. For the Byzantine layer, at least $N-f$ records report $k_0$. Since $N>3f$, one has $N-f>2N/3$, while any incorrect label can receive support from at most the $f<N/3$ arbitrary records. Thus $k_0$ is the unique supermajority label. ∎

An observer with high Consciousness Complexity is a high-resource record-integrating subsystem within this theorem. The theorem does not add a separate collapse postulate: the registered instrument supplies the outcome probability and conditional density-operator update, the independent selector supplies the single registered outcome, and consensus is the finite record-merging step that aligns durable records across perspectives.

## M.5 Mathematical Consistency

The finite-dimensional Hilbert spaces, compact homogeneous manifolds, Riemannian operators, and Markov kernels used in this appendix are formalizable in ZFC. This formalizability does not prove the consistency of ZFC or the joint consistency of the manuscript's additional physical axioms. A relative-consistency claim would require an explicit model satisfying those axioms inside a background theory whose consistency is assumed.

## M.6 Perspectival Analysis of Wigner's Friend and Certificate-Scoped Cross-Perspective Imports

The following analysis supplies a branch-consistent semantics for Wigner's-Friend records and proves one exact typing obstruction for cross-perspective imports. It is a conditional interpretive model on the registered instrument branch, not a proof that every extended Wigner's-Friend protocol is resolved.

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

On the registered perspectival-instrument branch, the two descriptions are typed as follows.

**Step 1 (Complete operational state).** The Perspectival State is $S_{(s)}(t)=(\rho(t),s)$, where $\rho$ may be mixed and $s\in\Sigma$ is the registered perspective.

**Step 2 (Friend record).** When $F$ performs the registered outcome-$0$ instrument event, the post-event state relative to $s'_F$ is
$$
S_{(s'_F)}(t+\Delta t)
=
(|0\rangle\langle0|,s'_F).
\tag{M.10}
$$
For the displayed pure input, the registered Born probability is $|\alpha|^2$.

**Step 3 (External laboratory state).** Before $W$ interacts with the laboratory, the branch assigns
$$
S_{(s_W)}(t+\Delta t)
=
(|\Psi\rangle_{FQ}\langle\Psi|,s_W).
\tag{M.11}
$$
Equations (M.10) and (M.11) are propositions with different perspective indices. Their joint consistency is a postulate of the declared semantics plus the registered interaction rules; it is not inferred from the ordered-pair notation alone.

**Step 4 (Certified consistency upon interaction).** When $W$ opens the laboratory, a joint `Evolve` record is registered. Correlation toward a common outcome flag follows only if its joint kernel satisfies the conditional-independence, strong-readout, and contractivity hypotheses of Lemma M.6.1; an arbitrary normalized interaction kernel need not produce that convergence.

**Remark M.6.1: Idealized Isolation.** The Wigner's Friend scenario stipulates idealized isolation of $F$'s laboratory—no decoherence channels connect $F+Q$ to $W$'s environment during the intermediate period. In realistic settings, environmental decoherence would establish shared perspective records through uncontrolled 'Evolve' events before $W$ deliberately opens the laboratory [Zurek 2003; Schlosshauer 2007]. The paradox arises precisely because the gedanken experiment suppresses these channels.

**Lemma M.6.1 (Correlated Perspective Dynamics Under Certified Strong Readout).** Let $W$ and $F$ have perspectives $s_W,s_F\in\Sigma$. Condition on a realized record value $k$ and suppose: (a) the two post-actualization noises are conditionally independent given $k$; (b) each one-perspective kernel $G_\lambda(s,\cdot)$ satisfies $G_\lambda(s,\cdot)\Rightarrow\delta_{s_k}$ as $\lambda\to\infty$ for the retained initial states; and (c) on the contractive branch,
$$
\operatorname{Ric}_\Sigma+\operatorname{Hess}_\Sigma V_k
\succeq\kappa_{\mathrm{eff}}g_\Sigma
$$
globally on $\Sigma$, or the corresponding bound holds for a separately defined invariant stopped process. Then
$$
G_{\mathrm{persp}}^{(WF)}((s'_W,s'_F)\mid(s_W,s_F),k,N,\Delta t)
=G_\lambda(s_W,ds'_W)G_\lambda(s_F,ds'_F),
\tag{M.12}
$$
the joint strong-readout law converges weakly to $\delta_{(s_k,s_k)}$, and, with the product metric,
$$
W_2(\mu^{(WF)}G^{(WF)},\nu^{(WF)}G^{(WF)})
\le e^{-\kappa_{\mathrm{eff}}\Delta t}W_2(\mu^{(WF)},\nu^{(WF)}).
\tag{M.13}
$$

*Proof.* Conditional independence gives the product kernel (M.12). If $\varphi$ is bounded and continuous on $\Sigma^2$, product weak convergence gives
$$
\int\varphi(s'_W,s'_F)\,G_\lambda(s_W,ds'_W)G_\lambda(s_F,ds'_F)
\longrightarrow
\varphi(s_k,s_k),
$$
which is precisely convergence to $\delta_{(s_k,s_k)}$. For the product potential $V_k^{(WF)}(x,y)=V_k(x)+V_k(y)$ and product metric,
$$
\operatorname{Ric}_{\Sigma^2}+\operatorname{Hess}_{\Sigma^2}V_k^{(WF)}
=
(\operatorname{Ric}_\Sigma+\operatorname{Hess}_\Sigma V_k)
\oplus
(\operatorname{Ric}_\Sigma+\operatorname{Hess}_\Sigma V_k)
\succeq
\kappa_{\mathrm{eff}}g_{\Sigma^2}.
$$
The Bakry–Émery Wasserstein contraction theorem therefore gives (M.13). ∎

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

### M.6.4 Certificate-Scoped Frauchiger--Renner Import Obstruction

The Frauchiger-Renner (FR) scenario involves four agents ($F$, $\bar{F}$, $W$, $\bar{W}$) and a chain of reasoning that derives a contradiction. The PU framework identifies the precise point of failure.

**The FR Reasoning Chain.** In the FR scenario:

1. $\bar{F}$ measures a coin and prepares a qubit accordingly
2. $F$ measures the qubit
3. $W$ (external to $F$'s lab) performs a measurement in a superposition basis
4. $\bar{W}$ (external to $\bar{F}$'s lab) performs a measurement and reasons about what $W$ must have concluded

The contradiction arises when $\bar{W}$ concludes with certainty an outcome that quantum mechanics predicts should be uncertain.

**PU Diagnosis.** The FR argument fails at assumption (C): reasoning about others' observations across perspectives without tracking perspective shifts. To formalize this, we introduce the following constraint:

**Definition M.6.2 (Retained Cross-Perspective Import Rule).** Let $\phi_s$ be a proposition asserting an actualized record relative to $s\in\Sigma$. Within the retained perspectival inference calculus, importing that record as a proposition at a distinct perspective $s'$ requires one of the following certificates:

(a) **Record-sharing certificate:** an Evolve interaction or other registered channel maps the record at $s$ to a correlated record at $s'$ with the stated error tolerance;

(b) **Perspective-invariance certificate:** the imported conclusion is proved to be independent of the actualization index. Functions of a shared density operator, such as registered expectation values or transition probabilities, are examples when their operators and basis conventions are also shared.

This is a typing rule of the perspectival semantics. It does not claim that every logically valid statement is state-only, nor that these certificates are derived from the ordered-pair notation $S_{(s)}=(\rho,s)$; the vector notation is only the pure-state shorthand of Definition 24.

**Lemma M.6.2a (Cross-Perspective Import Normal Form in the Retained Calculus).** In a derivation system whose cross-perspective import rules are exactly the two clauses of Definition M.6.2, every well-typed derivation that imports an actualized record from $s$ to $s'\ne s$ contains either a record-sharing certificate or a perspective-invariance certificate for that import.

*Proof.* Proceed by induction on the length of a well-typed derivation. A derivation of length one can import an actualized record across perspectives only by one of the two introduction rules in Definition M.6.2, so the required certificate is present. Assume the claim for derivations of length at most $n$ and consider a derivation of length $n+1$. If its final inference is local to one perspective, every cross-perspective import occurs in a premise derivation and has the required certificate by the induction hypothesis. If its final inference imports the record from $s$ to $s'$, the generating-rule hypothesis says that the final rule is either clause (a) or clause (b) of Definition M.6.2, which supplies the corresponding certificate. These cases exhaust the retained derivation rules. ∎

**Theorem M.6.2b (Certificate-Scoped Cross-Perspective Actualization Import).** Suppose that the proposition
$$
\phi_{s_W^{(\mathrm{post})}}
=
\text{``}W\text{ has actualized the record that }F\text{ observed }f\text{''}
$$
is proposed for import as a definite proposition at $s_{\bar W}^{(\mathrm{pre})}$. Assume that the proposed import has neither (a) a record-sharing certificate supplied by an Evolve interaction or another registered channel nor (b) a perspective-invariance certificate in the sense of Definition M.6.2. Then the import is not well typed in the retained perspectival inference calculus.

*Proof.* The proposition $\phi_{s_W^{(\mathrm{post})}}$ asserts an actualized record and is indexed to $s_W^{(\mathrm{post})}$. Definition M.6.2 declares that an import of such a record to a distinct perspective is admitted only by a record-sharing certificate or a perspective-invariance certificate. The two hypotheses exclude those two generating rules. Hence no rule of the retained calculus types the proposed import at $s_{\bar W}^{(\mathrm{pre})}$. This proves the stated obstruction. A claim about every step of the Frauchiger–Renner protocol requires a separate formalization of the complete protocol and is not asserted here. ∎

**Remark M.6.2.** The PU resolution does not reject any of (Q), (S), (C) outright. Rather, it refines (C): reasoning about others' observations is valid, but only when the perspective context is properly specified. Cross-perspective reasoning requires either explicit interaction (which correlates perspectives) or careful restriction to statements that are perspective-invariant.

### M.6.5 Distinction from Relational Quantum Mechanics

The PU resolution bears surface similarity to Rovelli's Relational Quantum Mechanics (RQM) [Rovelli 1996], which also holds that quantum states are relative to observers. However, fundamental differences exist:

| Aspect | Relational QM | PU Framework |
|--------|---------------|--------------|
| **Ontological status** | Interpretive stance; standard QM reinterpreted | Declared branch structure; physical perspectives require the registered perspective-space, instrument, and realization certificates |
| **Grounding** | Taken as interpretive starting point | Conditional on SPAP together with the retained Hilbert/Born, update, and perspective records; a registered physical reset is a separate branch with $\varepsilon_{\mathrm{reset}}=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}\ge H_q(P\mid R)$ |
| **Why relational?** | "Because that's what QM implies" | SPAP motivates perspective indexing on the declared response branch; it does not by itself derive the quantum perspective space or its physical realization |
| **Mathematical structure** | No explicit perspective space formalism | Perspective Space $\Sigma \cong U(d_0)/U(1)^{d_0}$ with Riemannian structure (Definition 25, Theorem 25) |
| **Dynamics** | No quantitative mechanism for perspective change | Explicit drift-diffusion realization of $G_{\text{persp}}$ on $\Sigma$ (Equations M.5a–b) |
| **Consistency criterion** | Interactions establish relations (qualitative) | Bakry-Émery control yields $W_2$-contractive convergence for the constructed class (Equation M.5c) |
| **Origin of probability** | Born rule assumed | On the accepted carrier branch, Principle 11b fixes the invariant response ledger, Principle 8.0b and $\mathfrak C_{\mathrm{car}}$ fix the complex carrier, and Theorems 8.2–8.3 give its unique Born trace representation from normalized additive/noncontextual effect probabilities; Principle 8.0c separately supplies irreducible registered single outcomes |
| **Temporal structure** | Time assumed | Directed order is required by Theorem 4; a thermodynamic arrow follows only on the independently certified Appendix O branch |

**Remark M.6.3: RQM as Limiting Case.** Relational Quantum Mechanics can be understood as capturing the interpretive content of the PU perspectival formalism when the underlying derivational structure (SPAP, PCE, MPU dynamics) is suppressed and only the relational consequences retained. The distinction is one of derivational route rather than certified necessity: on the declared response branch, PU represents prediction perspectivally (Corollary 1) and supplies an explicit perspective-space formalism and dynamics, while RQM takes the relational character as an interpretive starting point. PU's route is conditional on its stated branch records; it does not prove that quantum mechanics must be relational.

### M.6.6 Toward Completing the Relativistic Program

The perspectival resolution of Wigner's Friend extends a conceptual program initiated by Einstein's 1905 analysis of simultaneity.

**The Relativistic Insight.** Einstein's key move was recognizing that "simultaneity" had no absolute meaning—it was operationally defined relative to reference frames. What appeared to be an objective, frame-independent fact (whether two events are simultaneous) was revealed to be frame-dependent once the operational content was examined carefully. This was not a retreat from objectivity but its proper relativization.

**The Quantum Extension.** The PU framework applies the same logic to measurement outcomes:

| Special Relativity | PU Framework |
|--------------------|--------------|
| Simultaneity of distant events | Definiteness of measurement outcomes |
| "What measurements determine distant simultaneity?" | "What interactions determine outcome actuality?" |
| Finite signal-speed bound | Nonzero spacing, a registered positive edge-update duration, edge-by-edge serialization, and bounded weights; frontier attainment and Lorentzian promotion require separate records |
| Simultaneity relative to reference frame | Actuality relative to perspective |
| Events have frame-dependent time ordering | Outcomes have perspective-dependent actuality |
| Lorentz group connects frames | $G_{\text{persp}}$ kernel connects perspectives |
| One Minkowski spacetime | One MPU network |
| Spacetime interval $ds^2$ invariant | Amplitude $\lvert\psi(t)\rangle$ and Born probabilities invariant |
| Light postulate + relativity principle | POP + PCE + SPAP |

**Structural Correspondence M.6.4 (Relativistic Parallel).** The logical structure of perspectival quantum mechanics stands to the measurement problem as special relativity stands to pre-relativistic simultaneity. In both cases:

(i) An apparently absolute quantity (simultaneity / outcome definiteness) is revealed to be relative to a reference context (frame / perspective).

(ii) Each relativization is branch-relative. Frame-relative simultaneity uses an accepted Lorentzian characteristic-cone branch; perspective-relative actuality uses the retained SPAP, Hilbert/Born, update, and perspective records. A registered reset, a full-state refresh channel, and a Lorentzian cone are independent additional gates.

(iii) On the nominated Hypothesis 1 branch, one registered MPU network supplies the common substrate; this ontological identification is not derived by the perspectival semantics.

(iv) Lorentz transformations govern frame changes on the Lorentzian branch. A perspective kernel yields record consistency only on the certified strong-readout branch of Lemma M.6.1.

*Justification.* The structural correspondence is established by the mapping:

$$
\begin{aligned}
\text{Reference frame} &\longleftrightarrow \text{Perspective } s \in \Sigma \\
\text{Lorentz transformation} &\longleftrightarrow \text{Perspective transition kernel } G_{\text{persp}} \\
\text{Spacetime interval } ds^2 &\longleftrightarrow \text{Born probability } |\langle k|\psi\rangle|^2 \\
\text{Lorentzian characteristic cone on the accepted Appendix O branch}
&\longleftrightarrow
\text{perspective-update consistency on the retained quantum branch}
\end{aligned}
$$

The comparison is structural but branch-separated. Frame-relative simultaneity uses the accepted Lorentzian characteristic-cone branch, whose spacing, clock, serialization, frontier-attainment, and Lorentzian-promotion data are independent of SPAP. Perspective-relative actuality uses SPAP together with the retained Hilbert/Born, update, and perspective records; a registered thermodynamic reset is a separate gate. Thus neither relativization is derived here from the same SPAP/reset premise. ∎

**Remark M.6.5: Scope of the Correspondence.** The correspondence is structural and conceptual rather than mathematical in detail. Lorentz transformations form a continuous Lie group acting on Minkowski spacetime; the perspective dynamics governed by $G_{\text{persp}}$ are stochastic transitions on a distinct manifold $\Sigma$. The parallel illuminates the *type* of conceptual move—relativizing an apparently absolute concept—rather than claiming isomorphism of the mathematical structures.

**Definition M.6.5a (Covariant Perspectival-Actualization Certificate).** A covariant actualization certificate fixes a Hilbert representation carrier $\mathcal H$, a dense common core $\mathcal D\subseteq\mathcal H$, and a representation $\rho_{\mathrm{Spin}}(\Lambda)$ by bounded invertible operators on $\mathcal H$ leaving $\mathcal D$ invariant. It fixes a lift $\widehat G_{\mathrm{persp}}:\mathcal D\to\mathcal D$ and a bounded surjective linear PPI quotient map $\mathfrak q_{\mathrm{PPI}}:\mathcal H\to\mathcal R_{\mathrm{PPI}}$ whose kernel is $\rho_{\mathrm{Spin}}$-invariant, so
$$
\bar\rho_{\mathrm{Spin}}(\Lambda)\mathfrak q_{\mathrm{PPI}}(\psi)
:=\mathfrak q_{\mathrm{PPI}}(\rho_{\mathrm{Spin}}(\Lambda)\psi)
$$
defines the induced response-space representation. Separately, the certificate fixes an ordered Banach perspective-law carrier $\mathcal X_\Sigma$ with a closed generating cone and a continuous normalization functional, a dense domain $\mathcal D_\Sigma\subseteq\mathcal X_\Sigma$, and a closed generator $G_{\mathrm{persp}}^\Sigma:\mathcal D_\Sigma\to\mathcal X_\Sigma$ of a strongly continuous positive normalization-preserving semigroup. It fixes a bridge $J:\mathcal D\to\mathcal D_\Sigma$, a finite protocol set $\mathfrak P_{\mathrm{cov}}$, bounded real-linear readouts $s_P:\mathcal X_\Sigma\to\mathbb R$ and $\ell_P:\mathcal R_{\mathrm{PPI}}\to\mathbb R$, and tolerances $\epsilon_{\mathrm{br}}(P)\ge0$ satisfying, for $P\in\mathfrak P_{\mathrm{cov}}$ and $\psi\in\mathcal D$,
$$
\left|s_P(G_{\mathrm{persp}}^\Sigma J\psi)
-\ell_P\!\left(\mathfrak q_{\mathrm{PPI}}(\widehat G_{\mathrm{persp}}\psi)\right)\right|
\le\epsilon_{\mathrm{br}}(P)\|\psi\|.
\tag{M.6.5a.0}
$$
The covariance entry is
$$
\left\|
\mathfrak q_{\mathrm{PPI}}
\left(
\widehat G_{\mathrm{persp}}\rho_{\mathrm{Spin}}(\Lambda)
-\rho_{\mathrm{Spin}}(\Lambda)\widehat G_{\mathrm{persp}}
\right)\psi
\right\|
\le\epsilon_{\mathrm{cov}}(\Lambda)\|\psi\|
\tag{M.6.5a.1}
$$
for $\psi\in\mathcal D$, with $\epsilon_{\mathrm{cov}}(\Lambda)\ge0$. Without the invariant core, typed lift, and bridge, a commutator between the Markov generator and the spin representation is undefined and no covariance claim is made. A Lorentz-scalar metered rate additionally requires the stationary/metering record of Definition E.2a.8 and Corollary E.2a.9 to fix an invariant proper-time parameter $\tau$ on the same representation branch, to register $I_{\mathrm{acq}}$ as a scalar, and to define $\dot I=dI_{\mathrm{acq}}/d\tau$; without that clock entry, $\dot I/C_{\max}$ is only the rate in the selected meter clock. Order-independence of conditioned process functionals is a separate certificate entry.

**Theorem M.6.5b (Certificate-Relative Covariant Generator Responses).** On an accepted certificate, every registered readout obeys
$$
\begin{aligned}
&\left|s_P(G_{\mathrm{persp}}^\Sigma J\rho_{\mathrm{Spin}}(\Lambda)\psi)
-\ell_P\!\left(\mathfrak q_{\mathrm{PPI}}
(\rho_{\mathrm{Spin}}(\Lambda)\widehat G_{\mathrm{persp}}\psi)\right)\right|\\
&\qquad\le
\epsilon_{\mathrm{br}}(P)\|\rho_{\mathrm{Spin}}(\Lambda)\psi\|
+\|\ell_P\|\,\epsilon_{\mathrm{cov}}(\Lambda)\|\psi\|.
\end{aligned}
\tag{M.6.5b.1}
$$
If that invariant-clock metering record is also accepted, $\Gamma_{\mathrm{Evolve}}=\dot I/C_{\max}$ is a Lorentz scalar on that record. Spacelike order-independence holds only for process functionals covered by its independent entry.

*Proof.* Apply (M.6.5a.0) to $\rho_{\mathrm{Spin}}(\Lambda)\psi$, then add and subtract $\ell_P(\mathfrak q_{\mathrm{PPI}}(\widehat G_{\mathrm{persp}}\rho_{\mathrm{Spin}}(\Lambda)\psi))$. The triangle inequality, boundedness of $\ell_P$, and (M.6.5a.1) give (M.6.5b.1). The invariant-clock metering record defines $I_{\mathrm{acq}}$ and $C_{\max}>0$ as scalars and $\dot I=dI_{\mathrm{acq}}/d\tau$ with scalar proper time $\tau$; hence their quotient is a Lorentz scalar. The order-independence conclusion is restricted by definition to its separately listed process functionals. ∎

**Remark M.6.6 (Branch-Indexed Structural Relation Between the Two Relativizations).** Structural Correspondence M.6.4 compares two accepted branch outputs; it does not derive them from one premise. The registered binary architecture supplies the alphabet-count identity $\varepsilon_0=\ln2$ and, when a physical reset is declared, the ledger
$$
\varepsilon_{\mathrm{reset}}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}
\ge H_q(P\mid R).
$$
SPAP alone fixes neither the reset architecture nor the joint law $q(P,R)$. The perspective-actuality branch additionally requires the retained Hilbert/Born, update, and perspective records. The propagation branch separately requires nonzero spacing, a registered positive edge-update time, successive edge-by-edge serialized propagation in the propagation-cost metric, and bounded edge weights. Lorentzian kinematics further requires the complete Appendix O positive-spatial, entropy-time, second-order, and cone-coincidence package. Full-state refresh/minorization is another separate branch. No arrow in this ledger may be used in reverse or imported across branches without its stated certificate.


**Definition M.6.6a (Predictive-Equivalence Ledger $\mathfrak C_{\mathrm{PEq}}$).** A predictive-equivalence ledger for a finite observer or observer-pair comparison is a forward-locked record
$$
\mathfrak C_{\mathrm{PEq}}
=
(S_A,S_B,C_{\mathrm{agg}}^A,C_{\mathrm{agg}}^B,\Sigma_A,\Sigma_B,\mathcal R_{\mathrm{time}},\mathcal R_{\mathrm{act}},\mathcal R_{\hbar},\mathcal R_c,\mathcal R_G,\Pi_{\mathrm{proj}},\text{overlap audit},\text{forward lock}),
$$
where $C_{\mathrm{agg}}^A,C_{\mathrm{agg}}^B$ are the retained aggregate-complexity records, $\Sigma_A,\Sigma_B$ are the perspective-state domains, $\mathcal R_{\mathrm{time}}$ records the temporal-access or temporal-grain comparison, $\mathcal R_{\mathrm{act}}$ records the actuality/definiteness comparison, $\mathcal R_{\hbar}$ records the action-entropy unit bridge of Appendix Q, $\mathcal R_c$ records the finite-frontier branch, $\mathcal R_G$ records the capacity/area or stress-energy bridge when curvature is claimed, and $\Pi_{\mathrm{proj}}$ states which sector projection is being read. The ledger does not assert a Lorentz-group action on perspective space; it records shared cost data and their accepted projections.

**Proposition M.6.6b (Predictive Equivalence as a Projection Principle).** On a branch carrying $\mathfrak C_{\mathrm{PEq}}$, perspective-relative actuality, complexity-graded temporal access, action/energy phase, finite propagation, and curvature/source readings are admissible as projections of one retained predictive-update cost ledger only to the extent recorded by $\Pi_{\mathrm{proj}}$. In particular, $\hbar$ is consumed as the action-entropy exchange rate of Theorem Q.0.1 and Corollary Q.0.1, $c$ is consumed as a separately attained and normalized frontier, while Theorem 46 supplies only its uniform speed upper bound, and any gravitational reading consumes the Section 12 capacity/area/stress-energy bridge. The proposition therefore unifies the bookkeeping of the accepted projections; it does not make physical definiteness arbitrary, allow observers to choose laws by changing complexity, or replace the separate Hilbert, cone, KMS/Clausius, and gravity certificates.

*Proof.* Each listed projection is already branch-defined elsewhere: perspective-relative actuality is governed by Definition M.6.2 and Lemma M.6.2a, with the certificate-absence obstruction of Theorem M.6.2b; temporal access is Corollary O.4.3; the action-entropy bridge is Appendix Q; finite propagation is Theorem 46; and the curvature/source reading is the Section 12 gravity branch. The ledger asserts that the same finite predictive-update cost record and unit bridges are being used before projecting to these sectors. Thus the conclusion is a consistency and compression statement over accepted records, not a new derivation of any missing sector gate. ∎

---

### Step-by-Step Justification

**1. Conditional Binary-Reset Ledger.** On the registered conditionally uniform binary-reset architecture, the alphabet-count identity is $\varepsilon_0=\ln2$. A physical implementation instead obeys
$$
\varepsilon_{\mathrm{reset}}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}
\ge H_q(P\mid R),
$$
with equality to $\ln2$ only when the binary record is conditionally uniform and the excess dissipation vanishes. SPAP alone supplies neither this architecture nor the probability law $q(P,R)$.

**2. Independent Full-State Refresh Branch (Lemma E.1).** Reset of an ancillary register does not imply strict contraction of arbitrary full system states. On the separately declared branch
$$
\mathcal E_N=(1-p)\Psi+pT_\sigma,
\qquad
p\in(0,1],
$$
where $\Psi$ is CPTP and $T_\sigma(\rho)=\operatorname{Tr}(\rho)\sigma$ refreshes the full retained state, every traceless $\Delta$ satisfies $T_\sigma(\Delta)=0$. Trace-norm contractivity of $\Psi$ therefore gives
$$
D_{\mathrm{tr}}(\mathcal E_N(\rho_1),\mathcal E_N(\rho_2))
\le(1-p)D_{\mathrm{tr}}(\rho_1,\rho_2).
$$
If $\sigma\succ0$, the same declared decomposition makes $\mathcal E_N$ strictly positive and hence primitive. The reset-entropy bound alone supplies no $p>0$ and no full-state refresh decomposition.

**3. Branch-I Channel Capacity Bound (Theorem E.2)**

The separately declared full-state refresh decomposition bounds the classical channel capacity: $C_{\max}(\mathcal{E}_N) < \ln d_0$.

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

**4. Branch-II Registered Operational Timescale (Theorem 29).** Theorem 29 identifies the internal operational generator and its characteristic timescale; it does not by itself prove a universal positive minimum duration for every distinguishable transition. For an orthogonalization generated by a Hamiltonian with mean excitation $E>0$ and spectral width $\Delta_H$, the Margolus–Levitin bound gives
$$
t\ge\frac{\pi\hbar}{2E}
\ge\frac{\pi\hbar}{2\Delta_H}
$$
when $E\le\Delta_H$. A merely distinguishable, arbitrarily nearby target has no state-independent positive duration bound. The value $d_0=8$ belongs to the separate Appendix Z branch. The identity
$$
\tau_{\min}=\frac{\hbar\ln2}{\Delta_H}
$$
requires a declared action–entropy bridge and saturation record and is not a consequence of finite dimension alone.

**5. Branch-II Conditional Serialized Propagation Bound (Theorem E.10.2)**

Assume a nonzero link scale $\delta$, a separately registered positive lower edge-update duration $\tau_{\min}$, successive edge-by-edge serialization, and bounded weights $w_{xy}\le w_{\max}$. Then
$$
v\le c_*:=\frac{\delta w_{\max}}{\tau_{\min}}.
$$
Theorem 29 does not supply the edge-update premise. Equality with $\delta/\tau_{\min}$ additionally requires normalized uniform weights and one-link attainment.

**6. Bound, Frontier, and Lorentzian Promotion (Theorem 46 and Corollary 46a)**

Theorem 46 transports the preceding assumptions into a uniform operational causal-speed upper bound. It does not prove that the bound is attained, position-independent, or a Lorentzian characteristic cone. An attained frontier $c=\delta/\tau_{\min}$ is separate branch data, and Lorentzian signature and local Lorentz kinematics require Corollary 46a together with the full Appendix O package.

The Planck identity $L_P/t_P=c$ is definitional. Consequently,
$$
\frac{\delta}{L_P}=\frac{\tau_{\min}}{t_P}
$$
is an algebraic consequence only after the independent frontier calibration $c=\delta/\tau_{\min}$ has been accepted; it is not forced by dimensional consistency or Theorem 46 alone.

---

### Conditional Serialized Origin of the Finite Propagation-Speed Bound

A uniform finite propagation-speed upper bound on the retained network follows on the branch with nonzero link scale $\delta$, a positive registered time $\tau_{\min}$ per serialized edge update, successive edge-by-edge propagation in the propagation-cost metric, and uniformly bounded edge weights. For a path of $n$ edges,
$$
t\ge n\tau_{\min},
\qquad
d_{\mathcal N}\le n\delta w_{\max},
$$
hence $d_{\mathcal N}/t\le\delta w_{\max}/\tau_{\min}$. A reset ledger or PCE optimization alone does not prove locality, serialization, bounded weights, or cone saturation.

---

### The Unified Picture

The comparison table in Structural Correspondence M.6.4 should be read hierarchically rather than as independent parallels:

| Special Relativity | PU Framework | Relationship |
|:-------------------|:-------------|:-------------|
| Finite signal-speed bound | Nonzero spacing, registered edge-update duration, serialization, and bounded weights; equality/frontier and Lorentzian promotion require further branch data | **Conditional kinematic branch**, not derived from SPAP/reset data |
| Frame-relative simultaneity | Perspective-relative actuality | Structurally compared outputs of separately accepted branches |
| Lorentz covariance certificate | Perspective-consistency certificate | Independent covariance/consistency records; no common derivation is asserted |

Einstein's 1905 analysis [Einstein 1905a] revealed that simultaneity, often treated as absolute, is operationally defined relative to reference frames—a consequence of the finite and invariant speed $c$. The PU framework extends this program: actuality of measurement outcomes, often treated as absolute (or at least observer-independent), is operationally defined relative to perspectives—a consequence, on the retained quantum branch, of SPAP together with the Hilbert/Born, update, and perspective records; thermodynamic irreversibility is a separate physical-reset condition.

---

### Status of the Comparison

The epistemic and kinematic branches have different load-bearing inputs. SPAP participates in the epistemic branch, while the kinematic branch additionally requires locality, nonzero spacing, a registered edge-update clock, serialization, bounded weights, frontier attainment, and Lorentzian promotion. Margolus–Levitin does not furnish a universal positive duration for arbitrary updates.

Accordingly, frame-relative simultaneity and perspective-relative actuality remain a structural comparison rather than two consequences of one proved microscopic constraint. The equality $c=\delta/\tau_{\min}$ is available only on the separately accepted serialized-frontier calibration branch.



### M.6.7 Implications

The certificate-scoped perspectival analysis of Wigner's Friend has the following implications on its declared instrument and strong-readout branches:

**1. No Primitive Heisenberg Cut on the Registered Instrument Branch.** On the separately assumed Hilbert/instrument/Born and actualization branch, a registered verification/update event is represented by the `Evolve` instrument of Definition 27 and Proposition 9. The same representation can be used across the qualifying implementations without inserting a size- or consciousness-based cut. This does not make every MPU interaction an actualization event and does not derive the instrument or outcome ontology from SPAP or PCE.

**2. No Privileged Observers.** All perspectives $s \in \Sigma$ are equally valid; none occupies a "God's eye view" from which actuality is absolute. This democratic structure parallels the equivalence of inertial frames in special relativity. Just as no inertial frame is privileged for determining "true" simultaneity, no perspective is privileged for determining "true" outcome actuality.

**3. Certificate-Scoped Extended Wigner's-Friend Imports.** Definition M.6.2 requires a record-sharing or perspective-invariance certificate for an actualized record imported across distinct perspectives, and Lemma M.6.2a gives the corresponding import normal form. Theorem M.6.2b proves that the displayed Frauchiger–Renner-style import is ill typed when neither certificate exists. Any extended Wigner's-Friend argument containing an import that satisfies those hypotheses is blocked at that import; analysis of the complete Frauchiger–Renner protocol requires a separate formalization.

**4. Registered laboratory branch.** With the standard instrument and Born selector supplied as premises, the perspectival kernel preserves the registered laboratory outcome law by construction while adding a conditional perspective record. This establishes compatibility, not an independent derivation of quantum statistics or a novel effect. Any CC-dependent deviation requires the separate G9CC realization certificate.

**5. Perspective-Indexed Account of the "Absoluteness" Debate.** Within the declared perspectival semantics, outcome propositions are objective only after their registered perspective is specified. The cited no-go results do not by themselves prove PU's perspective space, actualization rule, or physical realization.

### M.6.8 Certificate-Gated Interface to Consciousness Complexity

Dependence of $G_{\mathrm{persp}}(s'|s,k,N,\Delta t)$ on the registered context $N$ supplies a typed interface at which a separately constructed physical control may enter. It proves no nonzero CC effect. A physical CC branch must supply:

1. a causal map from an aggregate state to a realizable control $N$;
2. one normalized instrument family on which that control changes a registered outcome law, or a theorem that every admissible change is zero;
3. a forward-locked signed effect interval, with exact/hard-support or statistical status, separated from source leakage and artifacts;
4. complete source-energy, reset, and no-double-counting ledgers; and
5. pre-lightcone marginal invariance, or explicit classification of a response-active marginal as the external branch-(iii) falsifier of the sealed causal branch.

Theorems 39, 39a, and 51 constrain a nominated response after it exists; they do not construct its carrier, sign, or magnitude. Appendix L supplies conditional electromagnetic and gravitational carrier models but derives no universal dominance ratio for an aggregate. Thus perspective dynamics provides a mathematical interface for the CC hypothesis, not its physical realization. G9CC in the completion program is the finite closure obligation.

### M.6.9 Synthesis

Quantum facts in this model are indexed to the perspective that records them, much as simultaneity is indexed to a frame. Consistency between perspectives depends on shared records and compatible readout dynamics.

**Technical ledger.**

The perspectival resolution of quantum measurement represents not a retreat from realism but its appropriate generalization. Just as Einstein taught us that certain spatiotemporal facts require frame specification, the PU framework teaches that certain quantum facts require perspective specification.

The key elements of the resolution are:

1. **Complete operational state specification** includes both the density operator and the registered perspective: $S_{(s)}(t)=(\rho(t),s)$.

2. **Actuality is perspective-relative**: Outcomes are actual relative to the perspective participating in the 'Evolve' interaction

3. **Certified readout kernels correlate perspectives**: under every hypothesis of Lemma M.6.1, the joint strong-readout law converges to a common outcome flag; normalization alone does not imply consistency.

4. **Cross-perspective reasoning is certificate-governed**: Definition M.6.2 permits an actualized-record import across distinct perspectives only through a record-sharing or perspective-invariance certificate, and Lemma M.6.2a gives the corresponding normal form.

5. **The perspectival model is branch-conditional**: SPAP and registered-reset thermodynamics do not by themselves derive the perspective space, actualization instrument, or transition kernel; those data belong to the retained Hilbert/Born and perspectival branch.

6. **The formalism exposes a conditional empirical interface**: The interaction context $N$ in $G_{\text{persp}}$ is a declared model variable. A CC-induced outcome shift requires the independent context-control, response, and physical-channel certificates used by the experimental predictions.

This provides a branch-indexed extension of the relativistic program for quantum mechanics: within the declared perspectival semantics, outcome propositions are indexed by perspective just as simultaneity statements are indexed by frame. The MPU network remains the common physical substrate, while the specific Hilbert, actualization, transition-kernel, and consistency structures retain their stated branch hypotheses.

The same perspectival machinery supplies a mathematical interface for the CC hypothesis only after the independent context-modulation and response certificates are supplied. Theorem M.6.2b proves one certificate-absence obstruction for a displayed cross-perspective import; it does not by itself dissolve every foundational protocol or derive a non-Born influence channel.

### M.6.10 The Cost Functional on the Perspective Space

Sections M.2–M.5 specify the geometric substrate for perspectival dynamics: the perspective space $\Sigma \cong U(d_0)/U(1)^{d_0}$, the metric $d_\Sigma$, and the transition kernel $G_{\text{persp}}$. Section M.6 studies quantum-measurement scenarios and the conditional CC interface within that apparatus. The receiver-pattern descriptor below is defined on systems carrying Effective Operational Property R. Its computational and thermodynamic readings require the reduction and registered-implementation certificates stated in Theorems M.10.3 and M.10.7.

Shannon entropy $H(X)=-\sum_xp(x)\ln p(x)$ is a functional of a specified probability distribution. Fisher information, Kolmogorov complexity, integrated-information quantities, and quantum entropies likewise require their respective mathematical inputs, and their computability depends on how those inputs are represented. The construction below defines the receiver-pattern descriptor $\mathcal P_S(E)=(\Delta Q_S,\mu_S(E),\sigma_S(E))$. Its established comparison result is non-determination of $\mu_S(E)$ by Shannon entropy on the branch of Theorem M.10.2. External evaluation is certificate-relative under Theorem M.10.5; no general computability ordering follows from aggregate complexity alone.

**Definition M.10.1 (Self-Model).** Let $S$ be a predictive system with $C_{agg}(S)>C_{op}$ possessing Effective Operational Property R. The self-model $\mathcal M_S$ is the component of $S$'s internal model that represents its own states, predictions, accuracy, and dynamics. On the perspectival branch it encodes an internal representation of the registered perspective $s\in\Sigma$ and density operator $\rho(t)$; vector notation is restricted to the pure-state shorthand of Definition 24.

**Remark M.10.1.** The definitions below apply to systems possessing Effective Operational Property R together with an operational self-model of the form specified in Definition M.10.1. They assign no SPAP-proximity value or cost law to systems outside that domain. Within the domain, Theorem M.10.3 gives an asymptotic computational lower bound only for families carrying its pattern-specific reduction certificate, and Theorem M.10.7 gives a physical reset signature only when its implementation certificate is supplied. Effective Operational Property R is therefore a domain condition, not by itself a divergence or thermodynamic-cost theorem. A parameter $\theta_S$ is not thereby a retained content object or a complete finite-budget candidate. Any persistence claim in the complete finite-budget quotient $\sim_B$ requires a registered encoder from the parameter domain into complete candidates carrying the response, update, verification, certificate, decoder, tolerance, and cost data of Definition P.16d.0.1; equality of the raw parameter follows from equality of retained quotient classes only when the composite quotient encoder is injective on the compared domain.

**Definition M.10.2 (Model-Change Decomposition on an Identifiable Fisher Stratum).** Let $E$ be a physical pattern and let $S$ have Effective Operational Property R. Assume that the retained parameter point lies on a finite-dimensional identifiable stratum on which the Fisher tensor $g_{\mathcal F_S}$ is positive definite, and assume the registered tangent splitting
$$
T_{M_S}\mathcal M_S
=
T^{(\mathrm{self})}_{M_S}\mathcal M_S
\oplus^{\perp_{g_{\mathcal F_S}}}
T^{(\mathrm{ext})}_{M_S}\mathcal M_S.
$$
Define the two components by the corresponding orthogonal projections:
$$
\Delta M_S(E)
=\Delta M_S^{(\mathrm{self})}(E)+\Delta M_S^{(\mathrm{ext})}(E).
\tag{M.17}
$$
Then
$$
\langle\Delta M_S^{(\mathrm{self})},\Delta M_S^{(\mathrm{ext})}\rangle_{\mathcal F_S}=0
$$
and
$$
\|\Delta M_S\|_{\mathcal F_S}^2
=\|\Delta M_S^{(\mathrm{self})}\|_{\mathcal F_S}^2
+\|\Delta M_S^{(\mathrm{ext})}\|_{\mathcal F_S}^2.
$$
Indirectly propagated changes are classified by their final tangent component. If the Fisher tensor is singular or the direct-sum splitting is absent, the projection and reflexivity fraction require a separately declared quotient or pseudometric construction.

**Definition M.10.3 (SPAP Proximity).** Let $S$ be a system with Effective Operational Property R and self-model $\mathcal{M}_S$ parameterized by $\theta_S \in \Theta_S \subseteq \mathbb{R}^{d_S}$, where $d_S$ is the self-model dimensionality. Processing $E$ induces a candidate updated parameter $\theta_S' = \theta_S + \delta\theta_S(E)$, where $\delta\theta_S(E)$ is determined by $\Delta M_S^{(\mathrm{self})}(E)$. Define the *required self-predictive performance* $PP_S^{(E)}$ as:

$$
PP_S^{(E)} := \inf\left\{PP \in [0, \alpha_{SPAP}] : \left\| \Pi_S^{(PP)}(\theta_S') - \theta_S' \right\|_{\mathcal F_S} \le g(\alpha_{SPAP} - PP) \right\}
\tag{M.18}
$$

where:

- $\Pi_S^{(PP)}(\theta_S')$ is the self-model prediction map at performance level $PP$: given a self-model configuration $\theta_S'$ and a specified performance level $PP \in [0, \alpha_{SPAP}]$, $\Pi_S^{(PP)}$ returns the configuration that $S$'s predictive process, constrained to operate at performance level $PP$, would assign to itself. The map $\Pi_S^{(PP)}$ is smooth in both arguments on $[0, \alpha_{SPAP}] \times \Theta_S$. At $PP=0$, the predictor makes no self-referential commitment: $\Pi_S^{(0)}(\theta_S')$ is $S$'s default self-model, independent of $\theta_S'$, so the discrepancy $\|\Pi_S^{(0)}(\theta_S') - \theta_S'\|_{\mathcal F_S}$ equals the full displacement $\|\delta\theta_S(E)\|_{\mathcal F_S}$. The performance coordinate is calibrated by nested attainable self-prediction classes: increasing $PP$ cannot make the best attainable self-model agreement worse. Hence, for each fixed target and each fixed register component, the corresponding optimal discrepancy is nonincreasing as $PP$ increases. For deterministic binary diagonal registers satisfying the positive Fisher-separation register hypothesis of Theorem M.10.4, the positive register discrepancy used there follows from SPAP's NOT construction, the specified binary code-state separation, and this calibrated performance ordering.
- $\|\cdot\|_{\mathcal F_S}$ is the norm induced by the Fisher information metric on $\Theta_S$: for tangent vectors $u,v\in T_\theta\Theta_S$, the metric is $g^{(\mathcal F)}_{ij}(\theta)=\mathbb E[(\partial_i\ln p(x|\theta))(\partial_j\ln p(x|\theta))]$, where $p(x|\theta)$ is the predictive distribution parameterized by $\theta$.
- $g:[0,\alpha_{SPAP}]\to[0,\infty)$ is continuous and monotone increasing, with $g(0)=0$ and $g(\delta)>0$ for $\delta>0$. The linear choice $g(\delta)=\delta$ suffices for all results below. The asymptotic divergence class in Theorem M.10.3 inherits from Theorem 14 independently of the particular continuous tolerance profile.

When the constraint set in Equation M.18 is nonempty, the infimum exists because $[0,\alpha_{SPAP}]$ is compact and the constraint set is closed: the left side is continuous in $PP$ by smoothness of $\Pi_S^{(PP)}$, the right side is continuous by continuity of $g$, and the constraint is the sublevel set of a continuous function. If the constraint set is empty—no performance level satisfies the self-consistency requirement—define $PP_S^{(E)}:=\alpha_{SPAP}$.

The self-consistency condition states that the updated self-model $\theta_S'$ must approximately equal $S$'s own prediction of what its self-model should be, with tolerance controlled by the gap to $\alpha_{SPAP}$. At $PP=\alpha_{SPAP}$, zero tolerance is required: $\Pi_S^{(\alpha_{SPAP})}(\theta_S')=\theta_S'$ exactly, demanding a fixed point of the self-model prediction map. SPAP (Theorem 10) prohibits that fixed point for the diagonal self-referential branch.

The *SPAP proximity* of pattern $E$ for system $S$ is
$$
\mu_S(E):=\frac{1}{\delta_S(E)},
\qquad
\delta_S(E):=\alpha_{SPAP}-PP_S^{(E)},
\tag{M.19}
$$
with the convention $1/0=\infty$. Thus $\mu_S(E)$ records the boundary behavior of the criterion (M.18). Physical processability and cost conclusions require the reduction and implementation certificates stated in Theorems M.10.3 and M.10.6. If $\Delta M_S^{(\mathrm{self})}(E)=0$ and the independent baseline-invariance condition $\Pi_S^{(0)}(\theta_S)=\theta_S$ holds, then $PP=0$ satisfies (M.18), so $PP_S^{(E)}=0$, $\delta_S(E)=\alpha_{SPAP}$, and $\mu_S(E)=1/\alpha_{SPAP}$.

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

**Theorem M.10.1 (Conditional Perspectival Dependence).** Let $S_1$ and $S_2$ have distinct operational self-model parameters in a retained coordinate $k$. Suppose the retained pattern language contains a binary assertion $E_k$ that is satisfied by $S_2$'s parameter and not by $S_1$'s parameter, and suppose the registered update rule leaves a satisfied parameter unchanged but changes the unsatisfied parameter by a nonzero Fisher-norm displacement. Then
$$
\mathcal P_{S_1}(E_k)\ne\mathcal P_{S_2}(E_k).
\tag{M.21}
$$

*Proof.* The update hypotheses give
$$
\|\Delta M_{S_1}^{(\mathrm{self})}(E_k)\|_{\mathcal F_{S_1}}>0,
\qquad
\Delta M_{S_2}^{(\mathrm{self})}(E_k)=0.
$$
The first inequality implies a nonzero total model change for $S_1$, hence $\sigma_{S_1}(E_k)>0$. Definition M.10.4 gives $\sigma_{S_2}(E_k)=0$. Since $\sigma$ is the third component of $\mathcal P_S$, the two profiles differ. The theorem is existential and certificate-relative; distinct self-models need not assign different profiles to every pattern. $\square$

**Theorem M.10.2 (Conditional Non-Determination by Shannon Entropy).** Let $S$ satisfy the baseline-invariance condition of Corollary M.10.3.1 and the independent-register hypotheses of Theorem M.10.4. Suppose the retained pattern class contains (i) a purely external binary message ensemble $E_1$ and (ii) the formal joint diagonal binary ensemble $E_2$, each with probabilities $(1/2,1/2)$. Then
$$
H(E_1)=H(E_2)=\ln2,
\qquad
\mu_S(E_1)=\frac1{\alpha_{SPAP}},
\qquad
\mu_S(E_2)=\infty.
\tag{M.22}
$$
Consequently $\mu_S$ is not a function of Shannon entropy alone on this branch.

*Proof.* For either equiprobable binary ensemble,
$$
H(E_i)=-2\left(\frac12\log\frac12\right)=\log2.
$$
The external ensemble has $\Delta M_S^{(\mathrm{self})}(E_1)=0$, so Corollary M.10.3.1 gives $\mu_S(E_1)=1/\alpha_{SPAP}$. Theorem M.10.4 gives an empty constraint set for the retained joint diagonal challenge $E_2$, hence $\mu_S(E_2)=\infty$ by (M.19). Equal entropies and unequal proximities prove the final assertion. $\square$

**Theorem M.10.3 (Certificate-Relative Integration Complexity).** Let $(S_\lambda,E_\lambda)$ be an asymptotic family carrying the pattern-specific reduction certificate of Corollary B.2.1, and measure $C_{\mathrm{integrate}}$ in the same computational cost units as $C_{\mathrm{uni}}$. If $\mu_{S_\lambda}(E_\lambda)\to\infty$, then there are constants $c>0$ and $\mu_0<\infty$ such that
$$
C_{\mathrm{integrate}}(S_\lambda,E_\lambda)
\ge
c\log\mu_{S_\lambda}(E_\lambda)\,\mu_{S_\lambda}(E_\lambda)^2
\tag{M.23}
$$
whenever $\mu_{S_\lambda}(E_\lambda)\ge\mu_0$.

*Proof.* Write $\delta_\lambda=1/\mu_{S_\lambda}(E_\lambda)$. The reduction certificate gives
$$
C_{\mathrm{integrate}}(S_\lambda,E_\lambda)
\ge C_{\mathrm{uni}}(\delta_\lambda).
$$
Theorem B.2 means that there are $c>0$ and $\delta_0>0$ for which
$$
C_{\mathrm{uni}}(\delta)
\ge c\frac{\log(1/\delta)}{\delta^2}
$$
for $0<\delta\le\delta_0$. Substituting $\delta_\lambda=1/\mu_{S_\lambda}(E_\lambda)$ and setting $\mu_0=1/\delta_0$ proves (M.23). A thermodynamic lower bound requires a separate implementation ledger mapping the certified computation to registered physical resets or another calibrated resource. $\square$

**Corollary M.10.3a (Asymptotic Lower Exponent Without a Finite-Ladder Slope Law).**

Let $\lambda_n$ be any sequence satisfying the hypotheses of Theorem M.10.3 and
$$
\mu_{S_{\lambda_n}}(E_{\lambda_n})\longrightarrow\infty.
$$
Then
$$
\liminf_{n\to\infty}
\frac{
\log C_{\mathrm{integrate}}(S_{\lambda_n},E_{\lambda_n})
}{
\log\mu_{S_{\lambda_n}}(E_{\lambda_n})
}
\ge2.
\tag{M.23a}
$$

*Proof.* For all sufficiently large $n$, Equation (M.23) gives
$$
\frac{\log C_{\mathrm{integrate}}}{\log\mu}
\ge
2+
\frac{\log c+\log\log\mu}{\log\mu}.
$$
The final quotient tends to zero as $\mu\to\infty$, proving (M.23a). ∎

Equation (M.23a) is an asymptotic lower exponent. It supplies no monotonicity, derivative, or ordinary-least-squares slope on a finite ladder. On any finite ladder, a constant cost chosen above every displayed lower bound has regression slope zero while satisfying all those pointwise bounds. Equation (M.23) also supplies no cost-ratio conclusion against a second receiver unless that receiver's cost has an independently registered upper bound.

**Remark M.10.4 (Cost decomposition).** If an implementation ledger supplies an additive decomposition $C_{\mathrm{process}}=C_{\mathrm{ext}}+C_{\mathrm{refl}}$ and identifies the certified integration subtask with $C_{\mathrm{refl}}$, then (M.23) bounds that reflexive component. No boundedness claim for $C_{\mathrm{ext}}$ follows from SPAP proximity alone.

**Corollary M.10.3.1 (Conditional SPAP Baseline).** Suppose $\sigma_S(E)=0$ and the baseline-invariance condition
$$
\Pi_S^{(0)}(\theta_S)=\theta_S
$$
holds. Then $PP_S^{(E)}=0$ and $\mu_S(E)=1/\alpha_{SPAP}$. If the implementation ledger defines the reflexive subtask solely by nonzero $\Delta M_S^{(\mathrm{self})}$, then $C_{\mathrm{refl}}(S,E)=0$. No upper bound or Shannon-only characterization of $C_{\mathrm{ext}}(S,E)$ follows.

*Proof.* The condition $\sigma_S(E)=0$ gives $\Delta M_S^{(\mathrm{self})}(E)=0$ and hence $\theta'_S=\theta_S$. At $PP=0$, baseline invariance yields
$$
\|\Pi_S^{(0)}(\theta'_S)-\theta'_S\|_{\mathcal F_S}=0
\le g(\alpha_{SPAP}).
$$
Thus $0$ belongs to the constraint set in (M.18). Since that set is contained in $[0,\alpha_{SPAP}]$, its infimum is $PP_S^{(E)}=0$, so $\delta_S(E)=\alpha_{SPAP}$ and $\mu_S(E)=1/\alpha_{SPAP}$. The ledger premise makes the reflexive subtask empty. $\square$

**Theorem M.10.4 (Existence of Divergent SPAP Proximity by Independent-Register Amplification).** Let $S$ be a system with Effective Operational Property R whose self-model contains $n_S$ Fisher-orthogonal addressable deterministic SPAP registers. Assume that, for each retained register, the two operational binary code states are represented by distinct parameter values at positive Fisher distance. For the $j$-th register, let $\eta_{S,j}>0$ denote the Fisher distance between those two code states. Define

$$
D_1(S):=\min_{1\le j\le n_S}\eta_{S,j}>0
$$

and

$$
N^*(S):=\left\lceil\left(\frac{g(\alpha_{SPAP})}{D_1(S)}\right)^2\right\rceil+1.
$$

If $n_S\ge N^*(S)$, then the retained formal pattern language contains a joint diagonal challenge $E^*$ for which the constraint set in (M.18) is empty and hence $\mu_S(E^*)=\infty$ by definition. If an independent implementation certificate realizes that joint challenge as a physical pattern with the same register responses and Fisher geometry, the same conclusion holds for the realized pattern. For a scalable MPU-network product family, this conclusion applies at every family member for which $n_S\ge N^*(S)$ and such an implementation certificate is supplied. No family-wide unboundedness conclusion follows from block-diagonal Fisher geometry alone unless the family also satisfies a quantitative separation condition ensuring $\sqrt{n_S}D_1(S)>g(\alpha_{SPAP})$ along an unbounded subsequence.

*Proof.* The uniform register discrepancy is supplied by the register antecedent. Theorem 15 supplies the deterministic SPAP core with finite binary roles capable of storing and comparing the predicted bit and the realized bit. The independent-register hypothesis further requires that each retained register instantiate those two operational binary code states as distinct parameter values with Fisher distance $\eta_{S,j}>0$. Since the retained register family used in the construction is finite, $D_1(S)=\min_j\eta_{S,j}>0$.

For a single retained register $j$, construct the deterministic SPAP diagonal challenge against the boundary self-prediction of $S$ on that register. If the boundary prediction map satisfied

$$
\left(\Pi_S^{(\alpha_{SPAP})}(\theta_{S,j}')\right)_j=(\theta_{S,j}')_j,
$$

then the predicted binary value and the realized binary value in the diagonal register would coincide. But the diagonal rule is

$$
\phi_{t+1}^{(j)}=\mathrm{NOT}(\hat\phi^{(j)}),
$$

so equality would imply $\hat\phi^{(j)}=\mathrm{NOT}(\hat\phi^{(j)})$, contradicting Theorem 10. Therefore the boundary discrepancy on register $j$ is at least the binary code-state separation:

$$
\left\|\left(\Pi_S^{(\alpha_{SPAP})}(\theta_{S,j}')-\theta_{S,j}'\right)_j\right\|_{\mathcal F_S}\ge \eta_{S,j}.
$$

By the calibrated performance ordering in Definition M.10.3, lowering $PP$ cannot improve the optimal self-model agreement beyond the boundary case. Hence, for every $PP\in[0,\alpha_{SPAP})$,

$$
\left\|\left(\Pi_S^{(PP)}(\theta_{S,j}')-\theta_{S,j}'\right)_j\right\|_{\mathcal F_S}
\ge
\eta_{S,j}
\ge
D_1(S).
$$

Now choose $N=N^*(S)$ Fisher-orthogonal addressable registers from the available $n_S$ registers and construct $N$ diagonal challenges $S_{\mathrm{diag}}^{(j)}$, $j=1,\ldots,N$, one per register. §A.0.2 (Theorem A.0.1; Corollary A.0.1) supplies the finite diagonal closure for each retained challenge, and the theorem antecedent supplies the independent-register branch. Let $E^{(N)}$ be the joint pattern encoding those diagonal challenges simultaneously, and write $\theta_S'$ for the self-model state after attempting to integrate $E^{(N)}$. The register family is Fisher-orthogonal by the theorem antecedent; in MPU-network product realizations this is supplied by the tensor-product/block-diagonal register construction of Theorem A.0.6 together with the finite $K_0$ SPAP core of Theorem 15. Therefore, by additivity of the Fisher metric on orthogonal parameter subspaces, for every $PP\in[0,\alpha_{SPAP})$,

$$
\left\|\Pi_S^{(PP)}(\theta_S')-\theta_S'\right\|_{\mathcal F_S}^2
\ge
\sum_{j=1}^{N}D_1(S)^2
=
N D_1(S)^2.
$$

Thus

$$
\left\|\Pi_S^{(PP)}(\theta_S')-\theta_S'\right\|_{\mathcal F_S}
\ge
\sqrt{N}\,D_1(S).
$$

For $N=N^*(S)$,

$$
\sqrt{N^*(S)}\,D_1(S)>g(\alpha_{SPAP}).
$$

Since $g$ is monotone and $0\le\alpha_{SPAP}-PP\le\alpha_{SPAP}$, $g(\alpha_{SPAP}-PP)\le g(\alpha_{SPAP})$ for all $PP\in[0,\alpha_{SPAP})$. Hence the self-consistency condition in Equation M.18 fails for every subboundary performance level:

$$
\left\|\Pi_S^{(PP)}(\theta_S')-\theta_S'\right\|_{\mathcal F_S}
>
g(\alpha_{SPAP})
\ge
g(\alpha_{SPAP}-PP).
$$

At the boundary $PP=\alpha_{SPAP}$, Equation M.18 requires zero tolerance because $g(0)=0$. The joint diagonal object would then require an exact fixed point of the self-prediction map on all retained diagonal registers, which SPAP excludes by Theorem 10. Thus the constraint set in Equation M.18 is empty. Consequently

$$
PP_S^{(E^{(N^*(S))})}=\alpha_{SPAP},
$$

$$
\delta_S(E^{(N^*(S))})=0,
$$

and

$$
\mu_S(E^{(N^*(S))})=\infty.
$$

Define $E^*:=E^{(N^*(S))}$. The diagonal construction of Theorem A.1.1 makes each $S_{\mathrm{diag}}^{(j)}$ constructible within $\mathcal M$ on the retained finite-program branch. Thus $E^*$ exists in the retained formal pattern language. It is a physical pattern only on a branch carrying an implementation certificate that realizes the joint register challenge with the assumed response and Fisher-separation properties. $\square$

**Remark M.10.5 (Terminological consistency with Definition 1).** The pattern $E^*$ with $\mu_S(E^*) = \infty$ is unprocessable by $S$ at finite cost (Theorem M.10.6 below). Since $S$ cannot process $E^*$, $E^*$ does not constitute *information for $S$* under Definition 1. The perspectival profile $\mathcal{P}_S(E^*)$ characterizes the boundary of the information regime — the point at which self-referential depth exceeds the system's processing capacity — rather than an instance of information.

**Corollary M.10.4.1 (Endpoint Range of SPAP Proximity).** For every retained pair $(S,E)$ satisfying Effective Operational Property R,
$$
\Delta M_S^{(\mathrm{self})}(E)=0,
\qquad
\Pi_S^{(0)}(\theta_S)=\theta_S,
$$
Corollary M.10.3.1 gives
$$
\mu_S(E)=\frac1{\alpha_{SPAP}}.
$$
This pointwise statement does not assert that every system realizes such a pattern. Under Theorem M.10.4's independent-register hypotheses there exists a formal boundary object $E^*$ with $\mu_S(E^*)=\infty$; a physical endpoint additionally requires that theorem's implementation certificate.

*Proof.* Corollary M.10.3.1 supplies the baseline for every pair satisfying its self-model and invariance premises, and Theorem M.10.4 supplies the formal boundary object under its register hypotheses. The integer
$$
N^*(S)
=
\left\lceil
\left(
\frac{g(\alpha_{SPAP})}{D_1(S)}
\right)^2
\right\rceil+1
$$
is a sufficient register count for the displayed proof and is not asserted to be least. Neither theorem proves convergence to the endpoint as $N\uparrow N^*(S)$ or realization of any intermediate value in $(1/\alpha_{SPAP},\infty)$. Either conclusion requires a separately registered interpolation-realization theorem. $\square$

**Theorem M.10.5 (Certificate-Relative External Evaluation).** Let $A$ hold an external representation of $B$'s self-model data for a specified pattern $E$. Assume that the representation includes:

1. effective finite descriptions of $\theta'_B(E)$, $g_B$, $g$, and $\Pi_B^{(PP)}$ with certified moduli of continuity on $[0,\alpha_{SPAP}]$;
2. a decision certificate that either isolates the infimum in (M.18) to any requested rational accuracy or certifies that the constraint set is empty; and
3. if a sender-side reflexive-cost conclusion is desired, an insulation certificate stating that this external computation leaves $A$'s self-model component unchanged.

Then $A$ can evaluate $PP_B^{(E)}$ and $\mu_B(E)$ to the accuracy supplied by the decision certificate. An exact value, including an exact declaration $\mu_B(E)=\infty$, requires an exact decision certificate. The inequality $C_{agg}(A)>C_{agg}(B)$ is neither necessary nor sufficient for these conclusions by itself.

*Proof.* Define the continuous function
$$
F_E(PP)
=
\|\Pi_B^{(PP)}(\theta'_B(E))-\theta'_B(E)\|_{\mathcal F_B}
-g(\alpha_{SPAP}-PP).
$$
The effective descriptions and moduli permit certified evaluation of $F_E$ on rational interval enclosures. The decision certificate either certifies that $\{PP:F_E(PP)\le0\}$ is empty or encloses its infimum to the requested accuracy. In the first case Definition M.10.3 assigns $PP_B^{(E)}=\alpha_{SPAP}$ and $\mu_B(E)=\infty$; in the second, substitution into $\mu_B(E)=1/(\alpha_{SPAP}-PP_B^{(E)})$ gives the corresponding certified enclosure whenever the denominator is separated from zero. Under item 3, Definition M.10.2 gives $\sigma_A=0$ for the external-evaluation task; without item 3 no such sender-side conclusion follows. No universal reflexive or upward impossibility is proved by this argument. $\square$

**Corollary M.10.5.1 (No Universal Self-Evaluation on a Reduction-Certified Branch).** Fix a predictive system $S$ with Effective Operational Property R. Assume there is a total computable reduction $\mathcal R_S$ with the following property: from any internal procedure that returns the exact value of $\mu_S(E)$ for every represented pattern $E$ with $\sigma_S(E)>0$, $\mathcal R_S$ constructs a universal exact self-predictor for the diagonal class excluded by Theorem 10. Then no such universal internal evaluator of $\mu_S$ exists.

*Proof.* Suppose an internal evaluator $\mathcal P_S$ returned the exact value of $\mu_S(E)$ on every represented pattern with $\sigma_S(E)>0$. By the reduction hypothesis, $\mathcal R_S(\mathcal P_S)$ would be a universal exact self-predictor for the diagonal class of Theorem 10. Theorem 10 excludes that predictor. Hence $\mathcal P_S$ cannot exist. ∎

Theorem M.10.5 separately establishes certificate-relative external evaluation for specified represented patterns. Aggregate-complexity order by itself implies neither universal downward computability nor impossibility of evaluating selected properties of a more complex system.

**Corollary M.10.5.2 (Conditional Physical Signature).** Theorem M.10.3 supplies only its certificate-relative abstract processing-cost lower bound. A physical heat signature follows only if the implementation records resets satisfying Theorem 31, and a stress-energy signature follows only if that implementation ledger satisfies the projection hypotheses of Definition B.8. Neither the computability scope of Theorem M.10.5 nor the computational lower bound alone determines entropy production, metabolic expenditure, or stress-energy.

**Theorem M.10.6 (Boundary of the Certified Integration Criterion).** Let $E$ satisfy $\mu_S(E)=\infty$. Then no $PP<\alpha_{SPAP}$ satisfies the integration criterion (M.18). If, in addition, a pattern-specific reduction certificate identifies every completed integration of $E$ with a certified task family of accuracy gap $\delta\downarrow0$ to which Theorem B.2 applies, the certified computational cost has no finite uniform upper bound:
$$
\liminf_{\delta\downarrow0}C_{\mathrm{integrate}}(S,E;\delta)=\infty.
\tag{M.24}
$$
This statement excludes a finite-cost completed integration on that certificate; it does not assert that an aborted physical run dissipates infinite energy.

*Proof.* By (M.19), $\mu_S(E)=\infty$ means $PP_S^{(E)}=\alpha_{SPAP}$. If a subboundary $PP$ satisfied (M.18), the infimum of the nonempty constraint set would be at most that $PP$ and hence strictly less than $\alpha_{SPAP}$, a contradiction. Thus no subboundary level satisfies the criterion. On the additional reduction branch,
$$
C_{\mathrm{integrate}}(S,E;\delta)
\ge C_{\mathrm{uni}}(\delta)
\ge c\frac{\log(1/\delta)}{\delta^2}
$$
for sufficiently small positive $\delta$. The right-hand side tends to infinity, proving (M.24). $\square$

**Remark M.10.6 (Comparison with Gödel).** The comparison with Gödel's First Incompleteness Theorem is structural rather than isomorphic. Gödel's theorem concerns provability in a formal system. Theorem M.10.6 concerns the boundary of the integration criterion (M.18) and excludes a finite-cost completed integration only when its pattern-specific reduction certificate is supplied; it does not assign unavoidable heat to an aborted physical run. Theorem M.10.4 supplies boundary objects on its independent-register amplification branch. A system $A$ holding the effective model-access and decision certificates of Theorem M.10.5 can evaluate the certified enclosure for a specified represented pair $(B,E)$. That evaluation is SPAP-flat for $A$ only under the insulation hypothesis of Theorem M.10.5. System $A$ remains subject to SPAP and may have its own boundary objects whenever the corresponding branch hypotheses hold.

**Theorem M.10.7 (Conditional Registered-Reset Signature).** Let $(S_\lambda,E_\lambda)$ be a family satisfying the pattern-specific reduction certificate of Corollary B.2.1, and suppose a physical implementation certificate assigns at least
$$
n_{\mathrm{reset}}(S_\lambda,E_\lambda)
\ge c\,\log\mu_{S_\lambda}(E_\lambda)\,\mu_{S_\lambda}(E_\lambda)^2
$$
registered resets to the certified integration computation for some $c>0$ and all sufficiently large $\mu_{S_\lambda}(E_\lambda)$. If reset $j$ has pre-reset logical variable $P_j$, retained side information $R_j$, and conditional entropy $H_{q_j}(P_j\mid R_j)$, then
$$
\frac{\Delta S_{\mathrm{bath}}}{k_B}
\ge
\sum_{j=1}^{n_{\mathrm{reset}}}H_{q_j}(P_j\mid R_j).
\tag{M.25}
$$
If the same certificate records $H_{q_j}(P_j\mid R_j)\ge h_{\min}>0$ for every counted reset, then
$$
\Delta S_{\mathrm{bath}}
\ge
k_Bh_{\min}n_{\mathrm{reset}}
\ge
k_Bh_{\min}c\,\log\mu_S(E)\,\mu_S(E)^2.
$$
A stress-energy conclusion requires, in addition, the local energy-density, support, and coarse-graining bridge of Definition B.8.

*Proof.* The registered-reset Landauer ledger gives
$$
\Delta S_{\mathrm{bath},j}/k_B\ge H_{q_j}(P_j\mid R_j)
$$
for each reset. Summing over the registered reset events proves (M.25). Under the uniform conditional-entropy floor, the sum is at least $h_{\min}n_{\mathrm{reset}}$; substitution of the certified reset-count lower bound proves the final inequality. No positive lower bound follows when the conditional entropies can vanish. The final sentence is a scope condition because Definition B.8 consumes, rather than derives, the physical localization bridge. $\square$

The valid conditional chain is
$$
\mu_S(E)
\xrightarrow{\text{pattern-specific reduction certificate}}
C_{\mathrm{integrate}}
\xrightarrow{\text{registered implementation certificate}}
\{(P_j,R_j,q_j)\}_{j=1}^{n_{\mathrm{reset}}}
\xrightarrow{\text{registered-reset Landauer ledger}}
\Delta S_{\mathrm{bath}}/k_B
\ge
\sum_jH_{q_j}(P_j\mid R_j).
$$

**Theorem M.10.8 (Certificate-Relative Screening and Replay Bookkeeping).** Let $A$ hold the effective model-access and decision certificates of Theorem M.10.5 for each member of a finite family $\mathcal E=\{E_1,\ldots,E_N\}$. Then $A$ can compute the certified enclosures for $\mu_B(E_i)$ supplied by those certificates and can form any finite lookup table whose entries are valid functions of those enclosures. If the pattern-specific reduction certificate of Theorem M.10.3 is also present, each enclosure separated from the baseline yields the corresponding certified computational lower bound. A claim that this screening is reflexively cost-free for $A$ additionally requires the insulation condition in Theorem M.10.5.

If “thermodynamically faithful replay” is defined to mean an implementation that reproduces a specified target reset ledger, its accounting may be written
$$
C_{\mathrm{replay}}
=C_{\mathrm{target\ ledger}}+C_{\mathrm{oh}},
\qquad C_{\mathrm{oh}}\ge0,
$$
where nonnegativity is part of that accounting convention. Substrate mismatch alone does not imply $C_{\mathrm{oh}}>0$ or a $k_BT\ln2$ cost per coordinate; such a bound requires a registered logically irreversible encoding with a positive conditional-entropy floor.

*Proof.* Apply Theorem M.10.5 separately to the finite list $E_1,\ldots,E_N$. A finite repetition of terminating certified evaluations terminates, and interval arithmetic preserves validity of any lookup entries formed from their enclosures. Theorem M.10.3 supplies a computational lower bound only on entries carrying its reduction certificate. The replay equation is definitional bookkeeping for implementations required to reproduce the target ledger. The registered-reset inequality bounds only irreversible encodings actually appearing in an implementation, by their conditional entropies; it supplies no positive cost from a difference of coordinate dimensions alone. $\square$

**Proposition M.10.9 (Conditional Local Comparison of Self-Model and Perspective Metrics).** Let $\iota:U\subseteq\Theta_S\to\Sigma$ be a registered $C^1$ perspective-extraction map on a Fisher-normal neighborhood $U$ of $\theta_S$. Assume that $\iota$ is a local embedding and that, on a smaller neighborhood $U_0\Subset U$, it is co-Lipschitz:
$$
d_\Sigma(\iota(\theta),\iota(\theta'))
\ge C_S d_{\mathcal F_S}(\theta,\theta')
\qquad(\theta,\theta'\in U_0)
$$
for a recorded constant $C_S>0$. Then every pattern whose self-model update remains in $U_0$ satisfies
$$
d_\Sigma(\iota(\theta_S),\iota(\theta'_S))
\ge C_Sd_{\mathcal F_S}(\theta_S,\theta'_S).
$$
At the differential level, if
$$
C_{S,0}:=\inf_{\theta\in U_0}\inf_{\|v\|_{\mathcal F_S}=1}\|d\iota_\theta v\|_\Sigma>0,
$$
then the metric inequality is
$$
\iota^*g_\Sigma\succeq C_{S,0}^2g_{\mathcal F_S}.
$$
The reflexivity fraction $\sigma_S(E)$ alone supplies neither injectivity nor either metric bound.

*Proof.* The endpoint inequality is the co-Lipschitz hypothesis evaluated at $\theta_S$ and $\theta'_S$. For every tangent vector $v$,
$$
(\iota^*g_\Sigma)_\theta(v,v)
=\|d\iota_\theta v\|_\Sigma^2
\ge C_{S,0}^2\|v\|_{\mathcal F_S}^2
=C_{S,0}^2g_{\mathcal F_S}(v,v),
$$
which proves the tensor inequality. $\square$

**Remark M.10.9a (Distinct Perspective Metrics and Divergences).**

The finite valuation pseudometric $d_{\mathcal A}$, the evidential $L^1$ metric $\Delta_{\mathcal P}$, the closure-profile discrepancies of Definition P.16b.12.8a, the flag-manifold metric $d_\Sigma$, the Wasserstein distance of the perspective-diffusion branch, the Fisher metric induced by $g_{\mathcal F_S}$, and the relative-entropy quantity $\mathcal C_{\mathrm{QRF}}$ have different carriers and types. The regularized objective of Definition M.10.10a is not itself a Wasserstein metric, and $\mathcal C_{\mathrm{QRF}}$ is a directed divergence rather than a metric. Proposition M.10.9, Corollary X.8a.1, and Corollary P.16b.11.2 supply no identification among these objects.

**Definition M.10.9b (Typed Semantic--Perspective Bridge Certificate).**

Let $\mathcal E_0\subseteq P$ be a declared comparison class in a Borel-registered semantic layer and define
$$
p\sim_\lambda q
\quad\Longleftrightarrow\quad
\Delta_{\mathrm{rel}}(p,q)=0.
$$
Write $\overline{\mathcal E}_0:=\mathcal E_0/\!\sim_\lambda$. A typed semantic--perspective bridge consists of:

1. an injective registered map
   $$
   \bar\iota_P:\overline{\mathcal E}_0\to\Sigma;
   $$
2. constants $0<c_P\le C_P<\infty$ such that, for every $p,q\in\mathcal E_0$,
   $$
   c_P\Delta_{\mathrm{rel}}(p,q)
   \le
   d_\Sigma\!\left(\bar\iota_P[p],\bar\iota_P[q]\right)
   \le
   C_P\Delta_{\mathrm{rel}}(p,q);
   \tag{M.10.9b.1}
   $$
3. a common finite shared active algebra $\mathfrak A_{\mathrm{sh}}$, faithful states
   $$
   \rho_{[p]}>0
   $$
   on that algebra representing $\bar\iota_P[p]$, and the finite frame-pair/channel ledger of Definition M.6.10a.1 for every ordered pair used;
4. one of the following uniform alternatives for every $p,q\in\mathcal E_0$: either a direct directed comparison
   $$
   D(\rho_{[p]}\Vert\rho_{[q]})
   \ge
   c_P^\rightarrow
   \overrightarrow{\Delta}_{\mathrm{rel}}(p\Vert q)
   \tag{M.10.9b.2}
   $$
   with $c_P^\rightarrow>0$, or a trace-separation comparison
   $$
   \|\rho_{[p]}-\rho_{[q]}\|_1
   \ge
   b_P^\rightarrow
   \overrightarrow{\Delta}_{\mathrm{rel}}(p\Vert q)
   \tag{M.10.9b.3}
   $$
   with $b_P^\rightarrow>0$.

The directed discrepancy is well defined on $\overline{\mathcal E}_0$, because replacing either closure profile by a $\lambda$-almost-everywhere equal profile does not change the measure of its set difference. No subset of $P$ is called open unless a compatible topology generating the registered Borel structure is separately chosen.

**Proposition M.10.9c (Conditional Transport Across the Typed Bridge).**

Under Definition M.10.9b,
$$
\Delta_{\mathrm{rel}}(p,q)\ge\epsilon
\Longrightarrow
d_\Sigma\!\left(\bar\iota_P[p],\bar\iota_P[q]\right)
\ge c_P\epsilon,
\tag{M.10.9c.1}
$$
and
$$
\Delta_{\mathrm{rel}}(p,q)\le M
\Longrightarrow
d_\Sigma\!\left(\bar\iota_P[p],\bar\iota_P[q]\right)
\le C_PM.
\tag{M.10.9c.2}
$$
On the direct directed branch,
$$
\mathcal C_{\mathrm{QRF}}
\!\left(
\bar\iota_P[p]\to\bar\iota_P[q]
\right)
\ge
c_P^\rightarrow
\overrightarrow{\Delta}_{\mathrm{rel}}(p\Vert q).
\tag{M.10.9c.3}
$$
On the trace-separation branch, quantum Pinsker gives
$$
\mathcal C_{\mathrm{QRF}}
\!\left(
\bar\iota_P[p]\to\bar\iota_P[q]
\right)
\ge
\frac{(b_P^\rightarrow)^2}{2}
\overrightarrow{\Delta}_{\mathrm{rel}}(p\Vert q)^2.
\tag{M.10.9c.4}
$$

*Proof.* Equations (M.10.9c.1)--(M.10.9c.3) are the corresponding registered inequalities evaluated at $p,q$. Under (M.10.9b.3),
$$
D(\rho_{[p]}\Vert\rho_{[q]})
\ge
\frac12\|\rho_{[p]}-\rho_{[q]}\|_1^2
$$
gives (M.10.9c.4). ∎

These are dimensionless geometric and distinguishability bounds. A physical-action conclusion additionally requires the action--entropy calibration certificate of Theorem Q.0.1, heat requires a registered reset ledger, and stress-energy requires the localization and projection hypotheses of Definition B.8. No bridge conclusion is available when the data of Definition M.10.9b are absent.

The SPAP proximity $\mu_S(E)$ is a dimensionless quantity defined by the receiver-pattern integration criterion (M.18). It does not by itself specify physical heat or entropy production.

- If $\sigma_S(E)=0$ and the baseline-invariance hypothesis of Corollary M.10.3.1 holds, then $\mu_S(E)=1/\alpha_{SPAP}$. No positive reset heat follows unless the implementation separately registers a reset with positive conditional entropy.
- If $\sigma_S(E)>0$, Equation (M.18) determines $\mu_S(E)$ from the specified self-model update. For an asymptotic family carrying the pattern-specific reduction certificate of Theorem M.10.3, $\mu_{S_\lambda}(E_\lambda)\to\infty$ gives the certified computational lower bound (M.23). A thermodynamic bound additionally requires the implementation certificate of Theorem M.10.7.

Perspective transitions of equal geometric distance can have different values of $\mu_S(E)$ because the geometric and self-model records are distinct. A corresponding difference in computational or thermodynamic cost follows only on the certificate branches of Theorems M.10.3 and M.10.7. Proposition M.10.9 supplies only its registered local metric comparison and does not convert $\mu_S$ into heat.

**Remark M.10.7 (Illustrative Profiles).** Assignments such as $\mu_B=O(10)$, $\mu_B\gg1$, or $\mu_B=\infty$ for informal sentences are examples only after a concrete self-model, update map, and criterion (M.18) have been specified. A system $C$ can evaluate certified enclosures for the represented pairs $(B,E_i)$ only when it holds the model-access and decision certificates of Theorem M.10.5; the evaluation is SPAP-flat for $C$ only under that theorem's insulation hypothesis. Boundary exclusion and divergent certified complexity retain the additional hypotheses of Theorem M.10.6.

**Theorem M.10.9 (Non-Determination by Shannon Entropy).** On any branch satisfying Theorem M.10.2, there is no single-valued function $f$ such that
$$
\mu_S(E)=f(H(E))
$$
for every retained pattern $E$.

*Proof.* Theorem M.10.2 supplies $E_1,E_2$ with $H(E_1)=H(E_2)$ and $\mu_S(E_1)\ne\mu_S(E_2)$. If such an $f$ existed, then
$$
\mu_S(E_1)=f(H(E_1))=f(H(E_2))=\mu_S(E_2),
$$
a contradiction. Comparisons with Fisher information, Kolmogorov complexity, quantum information, or integrated information require a separately defined reduction map and are not conclusions of this theorem. ∎

**Proposition M.10.9d (Matched-Encoding Invariance and Receiver-Relative Scope).**

Let $W$ be a finite serialized-pattern random variable with preregistered law $Q$, and let a fixed encoding $e$ assign a state $\rho_w$ to every realization $w$. Suppose the same realization $w$, with the same serialization and encoding, is delivered to receivers $S$ and $S'$.

Every registered functional whose arguments are confined to $(Q,e,w)$ has the same value in the two arms. In particular, the arms have the same Shannon entropy $H_Q(W)$, the same fixed-machine Kolmogorov complexity $K_U(w)$, the same fixed-code length, and the same von Neumann entropy of
$$
\bar\rho_Q
:=
\sum_wQ(w)\rho_w.
\tag{M.10.9d.1}
$$
Suppose additionally that a typed receiver-role certificate proves
$$
\Delta M_S^{(\mathrm{self})}(w)\ne0,
\qquad
\Delta M_{S'}^{(\mathrm{self})}(w)=0,
\tag{M.10.9d.2}
$$
and that $S'$ satisfies the baseline-invariance condition of Corollary M.10.3.1. Then
$$
\sigma_S(w)>0,
\qquad
\sigma_{S'}(w)=0,
\qquad
\mu_{S'}(w)=\frac1{\alpha_{SPAP}}.
\tag{M.10.9d.3}
$$
No value or divergence law for $\mu_S(w)$ follows without evaluating (M.18), and no measured-cost conclusion follows without Theorem M.10.3's reduction certificate and a registered implementation ledger.

*Proof.* The first conclusions follow because every argument of each pattern-side functional is identical. Equation (M.10.9d.2), Definitions M.10.2 and M.10.4, and Corollary M.10.3.1 give (M.10.9d.3). The final scope sentence retains the antecedents of Theorems M.10.3 and M.10.5. ∎

A register permutation alone does not establish (M.10.9d.2). The receiver-role certificate must prove that off-target addressing lies in the external Fisher component and that indirect propagation does not return a nonzero component to the self-model subspace.

### M.10.10 Measurement as Entropic Perspective Transport

**Definition M.10.10a (Entropic Perspective-Transport Problem).** Let $(\Sigma,d_\Sigma)$ be the compact perspective space of Appendix M and let $c(s,s')=d_\Sigma(s,s')^2$ be the quadratic perspective-transport cost. For a measurement partition $\{P_k\}$ and pre-measurement state $\rho$, let
$$
p_k=\operatorname{Tr}(\rho P_k)
$$
be the Born weights supplied by Theorem G.1.11b. Let $\mu_0$ be the pre-interaction perspective distribution and let $\nu_k$ be the normalized endpoint distribution concentrated on perspectives in which outcome $k$ is actual. Define the prescribed endpoint mixture
$$
\nu=\sum_kp_k\nu_k.
$$
Thus the Born weights are input marginal data for this transport problem. The minimization below can select a coupling between $\mu_0$ and $\nu$ but cannot derive the already prescribed coefficients $p_k$.

If the resulting endpoint kernel is used as $G_{\mathrm{persp}}(\,\cdot\,|s,k,N,\Delta t)$, the registered interaction record must fix $\mu_0^{N,\Delta t}$, $\pi_0^{N,\Delta t}$, $\varepsilon_{N,\Delta t}$, and $\nu_k^{N,\Delta t}$ before the minimization. Without those indexed inputs, the static transport problem defines no dependence on $N$ or $\Delta t$.

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

**Theorem M.10.10b (Existence, Uniqueness, and Conditional Born Endpoint Marginals).** Under Definition M.10.10a, the minimizer $\pi^\star$ exists and is unique. Suppose, in addition, that there are pairwise disjoint Borel outcome sectors $A_k\subseteq\Sigma$ satisfying
$$
\nu_k(A_k)=1,
\qquad
\nu_j(A_k)=0\quad(j\ne k).
$$
Then
$$
\pi^\star(\Sigma\times A_k)
=p_k
=\operatorname{Tr}(\rho P_k).
\tag{M.10.10.2}
$$

*Proof.* Compactness of $\Sigma$ makes $\Pi(\mu_0,\nu)$ weakly compact. The bounded continuous transport cost is weakly continuous, relative entropy is lower semicontinuous, and the absolute-continuity feasibility premise makes the objective proper. The direct method therefore gives a minimizer. On the finite-objective domain, relative entropy is strictly convex and the transport term is linear, so two distinct minimizers would have a midpoint with strictly smaller objective. Hence the minimizer is unique.

Every admissible coupling has second marginal $\nu=\sum_jp_j\nu_j$. Therefore
$$
\begin{aligned}
\pi^\star(\Sigma\times A_k)
&=\nu(A_k)\\
&=\sum_jp_j\nu_j(A_k)\\
&=p_k\\
&=\operatorname{Tr}(\rho P_k),
\end{aligned}
$$
which proves (M.10.10.2). ∎

**Corollary M.10.10c (Entropic Transport Kernel with Prescribed Born Endpoint Law).** Let
$$
A_k:=\operatorname{supp}\nu_k
$$
be the retained endpoint sector for outcome $k$, with the sectors pairwise disjoint up to null sets. Disintegrate the unique entropic transport plan as
$$
\pi^\star(ds,ds')=\mu_0(ds)\,K^\star(ds'|s).
$$
Then the unconditioned perspective-transition kernel is $K^\star(ds'|s)$. The Born endpoint weights are
$$
\int_\Sigma K^\star(A_k|s)\,\mu_0(ds)=p_k.
\tag{M.10.10.3}
$$
For $p_k>0$, the outcome-conditioned perspective kernel is the regular conditional restriction
$$
G_{\mathrm{persp}}(B|s,k,N,\Delta t)
=
\frac{K^\star(B\cap A_k|s)}{K^\star(A_k|s)}
\tag{M.10.10.4}
$$
for $\mu_0$-almost every $s$ with $K^\star(A_k|s)>0$. On the set where $K^\star(A_k|s)=0$, which is null for the outcome-$k$ joint measure $K^\star(A_k|s)\mu_0(ds)$, the conditional value is arbitrary because outcome $k$ has zero conditional weight from that starting perspective. Thus the endpoint coupling and its disintegrated endpoint kernel are selected by the unique static entropic transport plan, while the endpoint-sector weights remain the prescribed Born inputs. No time-indexed path measure, reference Markov process, or Schrödinger bridge is constructed by this static problem.

*Proof.* Since $\Sigma$ is compact and standard Borel, the disintegration theorem gives a Markov kernel $K^\star(ds'|s)$ satisfying
$$
\pi^\star(C\times B)=\int_C K^\star(B|s)\,\mu_0(ds)
$$
for all measurable $C,B\subseteq\Sigma$. Taking $C=\Sigma$ and $B=A_k$ gives
$$
\int_\Sigma K^\star(A_k|s)\,\mu_0(ds)
=
\pi^\star(\Sigma\times A_k).
$$
By Theorem M.10.10b,
$$
\pi^\star(\Sigma\times A_k)=p_k,
$$
which proves (M.10.10.3). For $p_k>0$, conditioning the endpoint kernel on the sector $A_k$ gives (M.10.10.4). The denominator is positive exactly on the starting perspectives from which the sector has nonzero conditional weight; outside that set the conditioning event has zero probability and does not affect any retained finite response. ∎

**Theorem M.10.10d (Predictive Role-Position Equivalence).** Let $S$ be a knowledge system on the predictive-function-space branch. Let $\mathsf{Cont}_S$ be its retained content class, and let
$$
\mathcal R_c^S:\mathsf P_S^{op}\to\mathbf{Set}
$$
or, on probabilistic branches,
$$
\mathcal R_c^S:\mathsf P_S^{op}\to\mathbf{Prob}_{\mathrm{fin}}
$$
be the operational response presheaf of a content item $c$. Define operational equivalence by
$$
c_1\equiv_{\mathrm{op}}^S c_2
\quad\Longleftrightarrow\quad
\mathcal R_{c_1}^S\cong\mathcal R_{c_2}^S,
$$
and define the predictive-function space
$$
\mathcal F_S:=\mathsf{Cont}_S/\!\equiv_{\mathrm{op}}^S,
\qquad
\pi_S(c)=[c]_{\mathrm{op}}.
$$
Then the quantitative position $\pi_S(c)$ and the qualitative predictive role of $c$ are the same operational invariant:
$$
\pi_S(c)
=
[c]_{\mathrm{op}}
=
[\mathcal R_c^S]_{\cong}
=
\operatorname{Role}_S(c).
$$
Consequently,
$$
c_1\equiv_{\mathrm{op}}^S c_2
\quad\Longleftrightarrow\quad
\pi_S(c_1)=\pi_S(c_2),
$$
with equality taken modulo retained internal symmetry if an internal symmetry group acts on $\mathcal F_S$.

The perspectival profile
$$
\mathcal P_S(c)=(\Delta Q_S(c),\mu_S(c),\sigma_S(c))
$$
is a finite descriptor on the subset of $\mathcal F_S$ where it is well-defined. It captures profile-visible role features but is not assumed to separate all operational distinctions. Therefore
$$
\mathcal P_S(c_1)=\mathcal P_S(c_2)
$$
does not imply $c_1\equiv_{\mathrm{op}}^S c_2$ unless a separating-profile branch is explicitly supplied. The term “coordinate chart” is reserved for a proved injective local parametrization with the requisite topology.

*Proof.* By definition, $\mathcal R_c^S$ records the finite responses produced by $S$ when content $c$ is engaged under retained protocols. Therefore the predictive role of $c$ is the natural-isomorphism class $[\mathcal R_c^S]_{\cong}$. The quotient defining $\mathcal F_S$ identifies exactly those contents whose response presheaves are naturally isomorphic, so
$$
\pi_S(c)=[c]_{\mathrm{op}}=[\mathcal R_c^S]_{\cong}.
$$
This proves the role-position identity. The equivalence between operational equivalence and equality of positions follows immediately from the quotient map. If an internal symmetry acts, physical equality is equality on the orbit quotient, giving the stated modulo-symmetry form.

The profile $\mathcal P_S$ assigns finitely many coordinates to the position $\pi_S(c)$. A finite chart need not be injective on the whole quotient space, so equality of profile tuples is not equality of operational roles unless injectivity is supplied on the retained content class. ∎

**Definition M.10.10d.1 (Separating-profile branch).** A profile is separating on a retained content class $\mathcal E\subseteq\mathsf{Cont}_S$ if
$$
\mathcal P_S(c_1)=\mathcal P_S(c_2)
\quad\Longrightarrow\quad
c_1\equiv_{\mathrm{op}}^S c_2
$$
for all $c_1,c_2\in\mathcal E$.

**Corollary M.10.10d.2 (Certificate-Relative Profile Completeness).** Let $\mathcal C$ be a declared class of patterns. If the separating-profile condition of Definition M.10.10d.1 has been proved on $\mathcal C$, then $(\Delta Q,\mu,\sigma)$ is a complete invariant on $\mathcal C$. If that certificate has not been supplied, the tuple remains a finite descriptor, but equality of descriptors does not license an inference of operational equivalence.

*Proof.* On a certified class, Definition M.10.10d.1 gives
$$
(\Delta Q,\mu,\sigma)(E_1)=(\Delta Q,\mu,\sigma)(E_2)
\Longrightarrow
E_1\sim_{\mathrm{op}}E_2,
$$
which is precisely completeness of the invariant. Without that implication as an available premise, the same conclusion cannot be inferred in a downstream proof. This is a certificate-scope statement and makes no claim that the implication is false on an uncertified class. ∎

**Corollary M.10.10d.3 (Compatibility with shape recognition).** Exact shape identity remains typed subdiagram isomorphism plus response-presheaf isomorphism. Predictive role-position equivalence supplies the role-level quotient of that structure; it does not reduce shape identity to equality of the finite tuple $(\Delta Q,\mu,\sigma)$.

*Proof.* Shape identity requires the subdiagram structure and the response-presheaf correspondence. Theorem M.10.10d identifies the role-level quotient represented by response presheaves. A coordinate chart on that quotient does not replace the full subdiagram and presheaf data. ∎

**Theorem M.10.11 (Receiver-Relative Simulation Criterion).** Let a finite simulation exposure to $S$ be
$$
\mathcal O_S(\mathcal H^\tau,I)=(E_1,\ldots,E_N),
\qquad
R_k:=E_1\oplus\cdots\oplus E_k.
$$
If SPAP-admissibility is defined by the existence of a subboundary performance level satisfying (M.18) for every integrated prefix, then
$$
\mathcal H^\tau\text{ admissible}
\quad\Longrightarrow\quad
\mu_S(R_k)<\infty
\quad(1\le k\le N).
$$
This criterion depends on the receiver-prefix pairs $(S,R_k)$ and not on the origin label $\tau$. If a family of prefixes also carries the pattern-specific reduction certificate of Theorem M.10.3 and $\mu_S(R_k)\to\infty$, its certified integration complexity obeys (M.23). If $\mu_S(R_k)=\infty$, Theorem M.10.6 excludes a completed integration only on its stated reduction branch.

*Proof.* Definition M.10.3 assigns $PP_S^{(R_k)}$ and $\mu_S(R_k)$ from the candidate update induced by the accumulated prefix. If $\mu_S(R_k)=\infty$, Theorem M.10.6 shows that no $PP<\alpha_{SPAP}$ satisfies (M.18), contradicting the stated admissibility criterion. Hence every admissible prefix has finite $\mu_S(R_k)$. The formula (M.18) contains $S$ and $R_k$ but no temporal-origin label $\tau$, proving origin-label independence. The final two conclusions are direct applications of Theorems M.10.3 and M.10.6 with their reduction hypotheses retained. ∎

**Protocol M.10.12 (Matched-Encoding Yoked-Receiver Audit).**

Let $n\mapsto(S_n,S_n',W_n)$ be a preregistered family of finite classical pattern experiments. For each $n$, the same realized serialization of $W_n$ is delivered to both receivers. An optional crossed extension introduces target labels $T\in\{0,1\}$ and patterns $W_{nT}$, with every realized $W_{nT}$ delivered to both receiver arms. A matched-encoding audit must register before cost data are inspected:

1. the serialization, sampling law, and encoding, with equality of the realized input verified across the two arms;
2. a common operation-count unit and calibrated meter, together with restored initial-state snapshots or an explicit carryover model;
3. a typed receiver-role certificate of the form (M.10.9d.2), including a no-leakage proof for indirect updates;
4. Theorem M.10.5 model-access and decision certificates, obtained independently of the cost measurements;
5. a *finite-proximity ladder certificate*
   $$
   \frac1{\alpha_{SPAP}}
   \le
   \mu_{S_n}(W_n)<\infty,
   \qquad
   \mu_{S_n}(W_n)\longrightarrow\infty;
   \tag{M.10.12.1}
   $$
6. the uniform pattern-specific reduction certificate of Theorem M.10.3 for the treatment arm;
7. if a ratio or subtractive divergence is claimed, an independent control-cost certificate
   $$
   C_{\mathrm{integrate}}(S_n',W_n)\le K
   \tag{M.10.12.2}
   $$
   with one finite $K$ for the registered family;
8. for a crossed receiver-target claim, randomized target and receiver labels together with role certificates in both target directions; every audit must include an exchange-isomorphism check for instruction semantics, address resolution, memory locality, cross-talk, and order effects.

Theorem M.10.4 does not supply item 5. Its endpoint object has $\mu=\infty$ and is not a completed finite-cost integration datapoint.

**Proposition M.10.12a (Conditional Divergence of the Yoked Cost Contrast).**

Assume Protocol M.10.12, including (M.10.12.1)--(M.10.12.2). Define
$$
D_n
:=
C_{\mathrm{integrate}}(S_n,W_n)
-
C_{\mathrm{integrate}}(S_n',W_n).
\tag{M.10.12.3}
$$
Then, for all sufficiently large $n$,
$$
D_n
\ge
c\log\mu_{S_n}(W_n)\,
\mu_{S_n}(W_n)^2
-K,
\tag{M.10.12.4}
$$
and therefore
$$
D_n\longrightarrow\infty.
\tag{M.10.12.5}
$$
If additionally
$$
0<C_{\mathrm{integrate}}(S_n',W_n)\le K,
$$
then the ratio
$$
\rho_n
:=
\frac{
C_{\mathrm{integrate}}(S_n,W_n)
}{
C_{\mathrm{integrate}}(S_n',W_n)
}
$$
satisfies
$$
\rho_n
\ge
\frac cK
\log\mu_{S_n}(W_n)\,
\mu_{S_n}(W_n)^2
\longrightarrow\infty.
\tag{M.10.12.6}
$$

*Proof.* Theorem M.10.3 and item 6 give the treatment-arm lower bound. Subtracting (M.10.12.2) gives (M.10.12.4), whose right-hand side diverges by (M.10.12.1). Under the positive-denominator condition, division by a number at most $K$ gives (M.10.12.6). ∎

**Remark M.10.12b (Inference Boundary).**

Identical serialization fixes only registered pattern-side functionals. It does not remove receiver state, implementation, carryover, address binding, or receiver-by-target interactions. A crossed arm swap tests fixed hardware asymmetry only when the exchange isomorphism in item 8 has been proved. A nonzero finite contrast establishes a receiver-target interaction for the registered implementation; it does not uniquely identify $\mu$, SPAP, CC, the perspectival quantum branch, gravity, or cosmology.

Neither $\mu_{S_n'}=1/\alpha_{SPAP}$ nor $C_{\mathrm{refl}}(S_n',W_n)=0$ supplies (M.10.12.2), because the external cost can remain unbounded. The lower bound (M.23) supplies the asymptotic exponent of Corollary M.10.3a, not a finite-ladder regression slope. Every finite observed ladder is bounded, so finite data cannot establish observed unboundedness. A finite contradiction must instead use the all-path upper-bound audit of Corollary B.2.2. Registered-reset calorimetry is a separate secondary branch requiring Theorem M.10.7's reset-count and conditional-entropy data.

**Table M.6.10.1: Scoped comparison of information quantities.**

| Quantity | Mathematical input | Dependence and bounds | Computational or physical-cost scope |
|----------|--------------------|-----------------------|--------------------------------------|
| Shannon entropy | A discrete probability distribution | Depends on the distribution; $0\le H(X)\le\log|\mathcal X|$ only for a specified finite $\mathcal X$ | Imposes no flat physical cost; erasure bounds depend on the implemented logical map and retained side information |
| Fisher information | A differentiable statistical model and parameter | Model- and parameter-dependent; may be singular or divergent | Computability depends on the representation of the model and integrals |
| Kolmogorov complexity | A finite string and a reference universal machine | Unbounded with string length and machine-dependent up to an additive constant | Not computable uniformly for all strings |
| Von Neumann entropy | A density operator | $0\le S(\rho)\le\log d$ for a specified finite dimension $d$ | Exact computability depends on how $\rho$ is represented; no flat cost per qubit follows |
| Integrated-information quantities | A specified version of an IIT model | Definition-, state-, and system-dependent | Bounds and computability depend on the selected formulation |
| SPAP proximity $\mu_S(E)$ | A receiver-pattern pair and the maps in (M.18) | Receiver- and pattern-dependent; may equal $\infty$ on the conditional diagonal branch | Evaluation and cost conclusions require the certificates in Theorems M.10.3, M.10.5, M.10.6, and M.10.7 |

**Technical result ledger (§M.6.10).**

| Result | Statement | Basis |
|--------|-----------|-------|
| Theorem M.10.1 | Perspectival dependence | Def M.10.2, M.10.4 |
| Theorem M.10.2 | Content dependence (Shannon-decoupled) | Def M.10.4 |
| Theorem M.10.3 | Certificate-relative asymptotic integration complexity | Corollary B.2.1 reduction certificate; Theorem B.2 |
| Corollary M.10.3a | Asymptotic lower exponent at least two, with no finite-ladder slope implication | Theorem M.10.3 |
| Theorem M.10.4 | Existence of $\mu_S = \infty$ on the independent-register amplification construction | SPAP diagonal; uniform Fisher-orthogonal $N$-register amplification |
| Theorem M.10.5 | Certificate-relative external evaluation | Effective model access and decision procedures; optional insulation certificate |
| Theorem M.10.6 | Boundary of the certified integration criterion | Equation (M.18); pattern-specific reduction certificate for divergence |
| Theorem M.10.7 | Conditional registered-reset signature | Theorem M.10.3; implementation reset-count and conditional-entropy certificates |
| Theorem M.10.8 | Certificate-relative screening and replay bookkeeping | Theorems M.10.5 and M.10.3; specified target reset ledger for replay |
| Proposition M.10.9 and Proposition M.10.9c | Typed local metric comparisons and certificate-relative semantic/physical transport | Registered embeddings, comparison constants, common active algebra, faithful states |
| Theorem M.10.9 | Non-determination by Shannon entropy | Theorem M.10.2 |
| Proposition M.10.9d | Matched encoding fixes pattern-side functionals but not receiver-relative profiles or costs | Fixed encoding; typed receiver-role and baseline certificates |
| Theorem M.10.10b | Entropic perspective transport | Compactness, strict convexity, Born descent |
| Theorem M.10.10d | Predictive role-position equivalence and profile overclaim guard | Response-presheaf quotient, separating-profile branch |
| Theorem M.10.11 | Perspectival simulation admissibility | Def M.10.3, Def P.16.1, Thm M.10.3, Thm M.10.6 |
| Protocol M.10.12 and Proposition M.10.12a | Matched-encoding receiver audit and conditional cost-contrast divergence | Finite-$\mu$ ladder, reduction, bounded-control, model-access, and exchange-isomorphism certificates |
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
On a branch carrying the action–entropy calibration certificate of Theorem Q.0.1 for this ledger, the associated physical action is
$$
\mathcal S_{s\to s'}^{\mathrm{phys}}
=
\hbar\,\mathcal L_{s\to s'}.
\tag{M.6.10a.7}
$$
Without that certificate, $\mathcal L_{s\to s'}$ is only the dimensionless relative-entropy ledger defined in (M.6.10a.3).
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
Fix a full-support prior on the finite preparation family $\Theta$. For each task $j\in\mathcal T$, let $A_j$ be its finite action set and let $\ell_j(\theta,a)$ be its loss. Define the predictive profile of record $r$ by the complete conditional-loss vector
$$
\Pi(r)
=
\left(
\mathbb E[\ell_j(\theta,a)\mid r]
\right)_{j\in\mathcal T,\,a\in A_j}.
\tag{M.6.11.1}
$$
Define
$$
r\sim r'
\quad\Longleftrightarrow\quad
\Pi(r)=\Pi(r').
\tag{M.6.11.2}
$$
A post-processed record $Z$ is exactly $\mathcal T$-sufficient for $\mathcal M$ when there is a function $h$ such that $\Pi(R)=h(Z)$ almost surely under the registered joint experiment.
The quotient record channel is
$$
\mathcal M_{\min}:\Theta\to\Delta(R/{\sim}),
\qquad
p([r]\mid\theta)=\sum_{r'\in[r]}p(r'\mid\theta).
\tag{M.6.11.3}
$$

**Theorem M.6.11b (Classical Quotient as the Minimal Sufficient Post-Processing).** For the finite task family $\mathcal T$ and the registered experiment $\mathcal M$:

1. $\mathcal M_{\min}$ preserves every conditional and Bayes risk in $\mathcal T$.
2. $\mathcal M\succeq_B\mathcal M_{\min}$.
3. If $\mathcal N$ is a stochastic post-processing of $\mathcal M$ and is exactly $\mathcal T$-sufficient in the sense of Definition M.6.11a, then $\mathcal N\succeq_B\mathcal M_{\min}$.
4. The output algebra is
$$
\ell^\infty(R/{\sim}).
\tag{M.6.11.5}
$$
5. If PCE cost is strictly increasing under sufficient record refinements that do not reduce any risk in $\mathcal T$, then $\mathcal M_{\min}$ is the unique PCE-minimal sufficient post-processing of $\mathcal M$, up to relabeling.

*Proof.* By (M.6.11.1), every conditional risk $\mathbb E[\ell_j(\theta,a)\mid r]$ is a component of $\Pi(r)$. It is constant on each equivalence class, so every action comparison, conditional optimum, and prior average is unchanged after replacing $r$ by $[r]$. This proves item 1.

The deterministic quotient map $q(r)=[r]$ satisfies $\mathcal M_{\min}=q\circ\mathcal M$, proving item 2. Let $Z$ be the output of a post-processing $\mathcal N$ as in item 3. Exact sufficiency gives $\Pi(R)=h(Z)$ almost surely. Since the equivalence class $[R]$ is precisely the level set label of $\Pi(R)$, there is a function $\bar h$ with $[R]=\bar h(Z)$ almost surely. Thus $\mathcal M_{\min}=\bar h\circ\mathcal N$, so $\mathcal N\succeq_B\mathcal M_{\min}$.

The observables of the finite classical quotient are all bounded functions on $R/{\sim}$, giving item 4. Finally, every exactly sufficient post-processing determines $[R]$ by item 3; any additional retained distinction is a refinement that changes none of the listed risks. Strict PCE monotonicity excludes every strict such refinement, leaving only relabelings of $R/{\sim}$. This proves item 5. ∎

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

**Theorem M.6.11e (Spectrum-Broadcast PPI Objectivity on the Dephased Branch).** Let $X$ satisfy Definition M.6.11d and assume that the PCE-compressed joint state is invariant under dephasing in the selected record basis:
$$
(\Delta_X\otimes\operatorname{id}_{E_1\cdots E_N})(\rho)=\rho,
\qquad
\Delta_X(Y)=\sum_x|x\rangle\langle x|Y|x\rangle\langle x|.
$$
Then $X$ is exactly PPI-objective if and only if the joint state has the spectrum-broadcast form (M.6.11.8)–(M.6.11.9).

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

Because $Z_*$ is a deterministic function of $Z$, the chain rule gives
$$
I(X;Z)
=I(X;Z,Z_*)
=I(X;Z_*)+I(X;Z\mid Z_*)
\ge I(X;Z_*).
$$
Equality holds if and only if $I(X;Z\mid Z_*)=0$, equivalently $X$ and $Z$ are conditionally independent given $Z_*$. Thus an equality case may add only conditionally independent random refinement or relabeling within a $Z_*$ class; such added data are operationally null for both $X$ and the retained prediction of $Y$. ∎

**Corollary M.6.12c (Lossless Predictive-Bottleneck Endpoint).** Among finite descriptions constrained to be exactly sufficient for $Y$, $Z_*=X/{\sim}$ minimizes $I(X;Z)$. It is therefore the lossless endpoint of the predictive bottleneck. For finite $\beta$, a minimizer of (M.6.12.1) may discard predictive information; identifying classical records, RG variables, effective fields, or perspective summaries with such a minimizer requires solving the corresponding model-specific bottleneck problem.

*Proof.* Theorem M.6.12b gives $I(X;Z)\ge I(X;Z_*)$ for every exactly sufficient $Z$. This proves the first two sentences. The Lagrangian (M.6.12.1) optimizes over all kernels $p(z\mid x)$, including insufficient ones, so the theorem supplies no characterization of its finite-$\beta$ minimizers. ∎

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

**Theorem M.6.13b (WAY-PCE Asymmetry Measurement Bound).** On a finite charge-covariant branch:

1. For every $Q$-covariant CPTP map $\mathcal N$,
$$
\mathcal A_Q(\mathcal N(\sigma_R))
\le\mathcal A_Q(\sigma_R).
\tag{M.6.13.3}
$$

2. Suppose $\sigma_R$ is $Q_R$-invariant and a charge-conserving measurement dilation has classical pointer effects $Z_x$ satisfying $[Z_x,Q_R]=0$. Then every induced system effect $E_x$ commutes with $Q_S$. Consequently an exact sharp measurement of $A=\sum_xa_xP_x$ is possible on this branch only if $[P_x,Q_S]=0$ for every $x$, and hence $[A,Q_S]=0$.

3. Suppose the initial state is $\rho_S\otimes\sigma_R$, the interaction is unitary with $[U,Q_S+Q_R]=0$, the pointer observable $M$ satisfies $[M,Q_R]=0$, and
$$
N:=U^*(I\otimes M)U-A\otimes I,
\qquad
\epsilon(A)^2:=\operatorname{Tr}[(\rho_S\otimes\sigma_R)N^2].
$$
If $0<(\Delta_{\rho_S}Q_S)^2+(\Delta_{\sigma_R}Q_R)^2<\infty$, then the WAY-Ozawa bound [Ozawa 2002] is
$$
\epsilon(A)^2
\ge
\frac{|\operatorname{Tr}\rho_S[A,Q_S]|^2}
{4(\Delta_{\rho_S}Q_S)^2+4(\Delta_{\sigma_R}Q_R)^2}.
\tag{M.6.13.4}
$$

*Proof.* Covariance gives $\mathcal N\mathcal G_Q=\mathcal G_Q\mathcal N$. Data processing for relative entropy therefore yields
$$
D(\mathcal N\sigma_R\Vert\mathcal G_Q\mathcal N\sigma_R)
=D(\mathcal N\sigma_R\Vert\mathcal N\mathcal G_Q\sigma_R)
\le D(\sigma_R\Vert\mathcal G_Q\sigma_R),
$$
proving item 1.

For item 2, the induced effect is
$$
E_x=\operatorname{Tr}_R[(I\otimes\sigma_R)U^*(I\otimes Z_x)U].
$$
Using invariance of $\sigma_R$, $[U,Q_S+Q_R]=0$, and $[Z_x,Q_R]=0$ gives
$$
e^{-itQ_S}E_xe^{itQ_S}=E_x
$$
for every $t$, hence $[E_x,Q_S]=0$. Exact sharp measurement requires $E_x=P_x$, proving item 2.

For item 3, charge conservation and the Yanase condition give
$$
[N,Q_S+Q_R]=-[A,Q_S]\otimes I.
$$
Robertson's inequality in the product input state, together with $(\Delta N)^2\le\langle N^2\rangle=\epsilon(A)^2$, gives
$$
\epsilon(A)^2\,\Delta(Q_S+Q_R)^2
\ge\frac14|\operatorname{Tr}\rho_S[A,Q_S]|^2.
$$
Product inputs have
$$
\Delta(Q_S+Q_R)^2=(\Delta_{\rho_S}Q_S)^2+(\Delta_{\sigma_R}Q_R)^2.
$$
Division by the positive finite variance proves (M.6.13.4). ∎

**Corollary M.6.13c (Compatibility with Blackwell-PCE Classicality).** The classical record selected by Theorem M.6.11b may report only the information that the covariant measurement branch can actually acquire. If the target observable is charge-asymmetric, the selected record either carries the WAY-limited error in (M.6.13.4) or the branch pays for a reference state with nonzero $\mathcal A_Q$.

*Proof.* Theorem M.6.11b selects a PCE-minimal sufficient statistic of the actual measurement channel. Theorem M.6.13b constrains which channel can be implemented under the conservation law. Therefore the Blackwell-PCE record cannot contain exact charge-asymmetric information unless the reference resource or error budget permits it. ∎

**Definition M.6.13d (Finite Frameness Ledger).** Let $G$ be a compact finite-response symmetry group represented by unitaries $U_g$ on a retained finite algebra, and let
$$
\mathcal T_G(\rho)
=
\int_G U_g\rho U_g^\dagger\,dg
\tag{M.6.13d.1}
$$
be the Haar-twirling channel. The finite frameness of $\rho$ relative to $G$ is
$$
\mathcal F_G(\rho)
:=
S(\mathcal T_G(\rho))-S(\rho)
=
D\bigl(\rho\Vert\mathcal T_G(\rho)\bigr).
\tag{M.6.13d.2}
$$
A label carried by a state, apparatus, charge sector, orientation, phase convention, or perspective coordinate is $G$-frame-physical on a retained branch only if some admissible finite protocol has a response that depends on a nonzero frameness resource.

**Theorem M.6.13e (Physical Labels are Finite Frameness Resources).** For every finite frameness ledger of Definition M.6.13d:
$$
\mathcal F_G(\rho)\ge0,
\tag{M.6.13e.1}
$$
and
$$
\mathcal F_G(\rho)=0
\quad\Longleftrightarrow\quad
\rho=\mathcal T_G(\rho).
\tag{M.6.13e.2}
$$
Consequently, on the retained $G$-covariant protocol family:

1. a $G$-label carried by a zero-frameness state changes no protocol response and is removed by PPI/PCE;

2. a relative phase, charge, orientation, or perspective label can survive only through a nonzero finite frameness resource that a registered protocol may consume, transfer, or bound;

3. the charge-covariant measurement bound of Theorem M.6.13b is the conserved-charge instance of this resource ledger.

*Proof.* The twirling map $\mathcal T_G$ is a finite conditional expectation onto the $G$-invariant subalgebra. It is CPTP and idempotent:
$$
\mathcal T_G^2=\mathcal T_G.
$$
For any state $\rho$,
$$
D(\rho\Vert\mathcal T_G(\rho))
=
-S(\rho)-\operatorname{Tr}\rho\log\mathcal T_G(\rho).
$$
Since $\log\mathcal T_G(\rho)$ is $G$-invariant, the conditional expectation identity gives
$$
\operatorname{Tr}\rho\log\mathcal T_G(\rho)
=
\operatorname{Tr}\mathcal T_G(\rho)\log\mathcal T_G(\rho)
=
-S(\mathcal T_G(\rho)).
$$
This proves (M.6.13d.2), hence nonnegativity.

Relative entropy vanishes if and only if its two arguments are equal on the finite faithful support, proving (M.6.13e.2). If $\rho=\mathcal T_G(\rho)$, every $G$-asymmetric label is averaged out in all invariant retained protocols. Such a label changes no protocol-response presheaf and is removed by PPI/PCE. If $\mathcal F_G(\rho)>0$, the state contains a finite asymmetry resource relative to $G$, so any protocol using the label must account for that resource. The charge-covariant measurement theorem is obtained by taking $G$ to be the one-parameter charge group generated by the conserved charge. ∎

**Definition M.6.14a (Finite ND-RID Process Tensor).** For a finite $n$-step ND-RID history with intervention times $0,\ldots,n$, let $\mathcal H_k^{\mathrm{in}}$ and $\mathcal H_k^{\mathrm{out}}$ be the retained input and output Hilbert spaces at step $k$. The process tensor is a positive Choi operator
$$
\Upsilon_{n:0}
\in
\mathcal B\left(
\bigotimes_{k=0}^{n}
\mathcal H_k^{\mathrm{out}}\otimes\mathcal H_k^{\mathrm{in}}
\right),
\qquad
\Upsilon_{n:0}\ge0,
\tag{M.6.14a.1}
$$
satisfying the causality constraints
$$
\operatorname{Tr}_{k^{\mathrm{out}}}\Upsilon_{k:0}
=
I_{k^{\mathrm{in}}}\otimes\Upsilon_{k-1:0}
\quad
(k=1,\ldots,n),
\tag{M.6.14a.2}
$$
with the explicit base normalization $\operatorname{Tr}_{0^{\mathrm{out}}}\Upsilon_{0:0}=I_{0^{\mathrm{in}}}$. Together with (M.6.14a.2), this excludes nonunit scalar multiples and fixes a deterministic comb. 

For a sequential tester outcome $\omega$, let $T_\omega\succeq0$ be the dual-comb Choi element obtained by linking the retained CP instrument outcomes to an explicitly normalized initial preparation, memory wiring, and terminal effect. All slotwise transposes dictated by the fixed Choi convention are included in $T_\omega$; it is not an arbitrary tensor product of CPTP Choi matrices. A family $\{T_\omega\}$ is complete exactly when $T_\Omega:=\sum_\omega T_\omega$ belongs to the normalized deterministic dual-tester cone,
$$
\operatorname{Tr}(\Upsilon T_\Omega)=1
\quad
\text{for every deterministic comb }\Upsilon\text{ satisfying Definition M.6.14a}.
$$
The generalized Born rule is then
$$
p(\omega)=\operatorname{Tr}(\Upsilon T_\omega),
\qquad
p(\omega)\ge0,
\qquad
\sum_\omega p(\omega)=1.
\tag{M.6.14a.3}
$$
This dual normalization is the missing boundary datum that prevents the raw channel--channel Choi contraction from being misread as a probability.



**Process-tensor compatibility for reflected modular records.** Whenever $\mathfrak C_{\mathrm{Borch}}$ is invoked inside a perspectival branch, the reflection map is compared only against interventions contained in the already retained local past. The process-tensor record must show that replacing a branch by its reflected modular representative preserves the deterministic-control/no-future-to-past condition used elsewhere in this appendix. This prevents the reflected extension from being used as a hidden future-input channel.

**Theorem M.6.14b (ND-RID Histories are Exactly Normalized Fixed-Order Process Tensors).** Every finite ND-RID history built from an initial state, retained CPTP update kernels, conditional instruments, and finite environment memory defines a unique process tensor satisfying Definition M.6.14a. Conversely, every positive operator satisfying the recursive trace identities and base normalization of Definition M.6.14a, together with the normalized dual-tester pairing of (M.6.14a.3), defines a normalized fixed-order operational history on the retained instruments. Two histories are PPI-equivalent for the retained protocol family if and only if their process tensors give the same multilinear functional (M.6.14a.3) on that family.

*Proof.* Compose the initial state, the finite ND-RID update channels, and the retained memory systems into the multilinear map that sends a sequence of intervention CP maps to the final probability. Applying the Choi-Jamiolkowski isomorphism to every input-output slot gives a unique operator $\Upsilon_{n:0}$. Complete positivity of each update and instrument implies positivity of the Choi operator. Trace preservation of the future update after summing over an intervention gives exactly the recursive partial-trace constraints (M.6.14a.2). This proves that every finite ND-RID history gives a process tensor.

Conversely, positivity makes every positive tester outcome nonnegative. The recursive and base constraints place $\Upsilon$ in the deterministic-comb cone, while normalization of the dual tester makes its complete outcome sum equal to one. The comb trace identities preserve every earlier marginal when a later tester stage is summed out. The normalized dual tester supplies the terminal unit probability. Together they yield a valid fixed-order process with no future-to-past control. Therefore the operator defines a valid finite operational process.

If two histories give the same process tensor on the retained instrument span, then (M.6.14a.3) gives the same probabilities for every retained finite protocol, so PPI identifies them. If they differ on some retained instrument sequence, the corresponding protocol distinguishes them and they are not PPI-equivalent. ∎

**Corollary M.6.14b.1 (Local Threshold Arming as a Process-Tensor Control).** Let $A_j$ be a finite classical arming or stopping register at step $j$ whose value is a deterministic function of the retained local reduced process tensor, local ledger variables, and prior local records. Adjoining $A_j$ as a classical control system yields another causal process tensor satisfying Definition M.6.14a. If the post-arming outcome kernel is unchanged, the Born weights of Theorem 28a are unchanged. On the local CPTP branch of Postulate 3(i), such local arming preserves remote unconditional marginals by the same trace-preservation/no-signaling argument; Theorems 39 and 39a remain deterministic-endpoint and zero-error finite-window gates, not the source of this marginal-preservation claim.

*Proof.* A deterministic finite control register is a classical CP instrument whose outcome is fixed by previously available local records. Composing that instrument with the retained process tensor preserves positivity and the partial-trace causality constraints (M.6.14a.2). Since the control is measurable with respect to the local past, summing over the controlled local instrument gives the same remote marginal on the local CPTP branch, while conditioning on an actualized local record only changes the locally selected branch. ∎

**Remark M.6.14b.2 (No-Future-to-Past Condition for Metered Actualization).** A metered trigger is evaluated only from records available in the branch's local past. The process tensor must remain invariant under changes to future choices once the retained meter record is fixed. This keeps a meter certificate from becoming a retrocausal trigger rule.


**Corollary M.6.14c (Markov, Memory, and Indefinite-Order Gates).** On the finite process-tensor branch:

1. Markovian multi-time dynamics is the tensor-factorization condition for $\Upsilon_{n:0}$ into one-step conditional channels;

2. failure of this factorization witnesses non-Markovian temporal correlations. A finite-memory realization additionally requires a finite ancillary-memory dilation certificate, while all fixed-order comb constraints remain satisfied;

3. coherent or classical control of internal operations within Definition M.6.14a remains a fixed external-order comb. A genuinely indefinite-order resource is outside this definition and requires a separately normalized process-matrix or higher-order-map branch with its own probability and no-loop certificate.

Items 1--2 remain normalized fixed-order histories and obey the same partial-trace comb constraints. Item 3 is a scope boundary, not an existence claim for an indefinite-order PU sector.

*Proof.* One-step Markov dynamics with no retained environment memory has a Choi representation given by the link product of adjacent conditional channels. Conversely, that factorization makes the future conditionally independent of the earlier past given the present slot. Failure of the factorization witnesses non-Markovian temporal correlation; a finite-memory realization additionally requires a finite ancillary dilation. Equation (M.6.14a.2) selects one external order, so every process satisfying it remains an externally ordered comb. A genuinely indefinite-order process belongs to a distinct process-matrix or higher-order-map normalization cone and is not asserted to satisfy (M.6.14a.2). ∎

**Theorem M.6.14c.1 (Temporal Operator-Schmidt Memory Bound).** Let $\Upsilon_{n:0}$ be a finite normalized process tensor and cut its Choi slots into a temporal past $P$ and future $F$. Let
$$
R_j
=
\operatorname{OSR}_{P|F}(\Upsilon_{n:0})
\tag{M.6.14c.1.1}
$$
be the minimum number of product operators in a decomposition across cut $j$. If every carrier of influence across that cut, including the through-going system when it crosses the cut, classical shared variables, and pre-correlated ancillas, is contained in one complete memory system $M_j$ of Hilbert dimension $d_{M_j}$, then
$$
R_j\le d_{M_j}^2,
\qquad
d_{M_j}\ge\left\lceil\sqrt{R_j}\right\rceil.
\tag{M.6.14c.1.2}
$$
Defining $d_M:=\max_j d_{M_j}$, every exact realization obeys
$$
d_M\ge
\max_j\left\lceil\sqrt{R_j}\right\rceil.
\tag{M.6.14c.1.3}
$$

*Proof.* All dependence crossing cut $j$ factors through $\mathcal B(M_j)$. Expanding that carrier in an operator basis $\{E_a\}_{a=1}^{d_{M_j}^2}$ writes the Choi operator as $\sum_aX_a^P\otimes Y_a^F$, so its operator-Schmidt rank is at most $d_{M_j}^2$. Rearrangement gives the lower bounds. ∎

**Remark M.6.14c.1a (Lower-Bound Scope).** Equation (M.6.14c.1.2) is not an achievability equality. Positivity, comb normalization, and classical nonnegative-factorization constraints may require larger memory. Omitting the through-going system, a classical seed, or a pre-correlated environment from $M_j$ invalidates the premise rather than evading the bound.

**Theorem M.6.14c.2 (Affine-Channel Determinant and Rank-Revival Witness).** Represent a finite-dimensional trace-preserving channel on the real affine space of density operators as
$$
x\longmapsto A_tx+b_t
\tag{M.6.14c.2.1}
$$
on traceless Hermitian coordinates reconstructed in one time-independent calibrated affine chart. Suppose $\Lambda_t=V_{t,s}\Lambda_s$ for $t\ge s$, where every $V_{t,s}$ is positive and trace preserving. Then
$$
|\det A_t|\le|\det A_s|,
\qquad
\operatorname{rank}A_t\le\operatorname{rank}A_s.
\tag{M.6.14c.2.2}
$$
Consequently an increase of $|\det A_t|$, revival after a rank loss, or a negative determinant reached continuously from $A_0=I$ witnesses failure of positive divisibility and therefore of CP divisibility, provided the change exceeds the registered tomography interval. Time-dependent coordinate changes are not admissible witnesses. On an absolutely continuous invertible branch with $A_0=I$ and bounded integrable traceless-coordinate generator $L_t$ defined by $\dot A_t=L_tA_t$,
$$
\det A_t
=
\exp\!\left(\int_0^t\operatorname{tr}_{\mathbb R}L_s\,ds\right)>0.
\tag{M.6.14c.2.3}
$$
None of the converse statements holds: nonnegative monotone determinant does not certify Markovianity, and determinant zero is inconclusive without the invertible-generator premise.

*Proof.* Positivity and trace preservation contract trace distance on Hermitian differences, so every eigenvalue of the induced traceless-space propagator has modulus at most one and $|\det A_{t,s}|\le1$. From $A_t=A_{t,s}A_s$, determinant multiplicativity and rank monotonicity prove (M.6.14c.2.2). A continuous determinant starting at $1$ cannot become negative without passing through zero; divisibility then forbids the required rank revival. Equation (M.6.14c.2.3) is Liouville's determinant formula for the fundamental solution of $\dot A_t=L_tA_t$. ∎

**Corollary M.6.14d (Post-Selection and Weak-Probe Conditioning Without Future Ontology).**


Let $\Upsilon_{n:0}$ be a deterministic comb of Definition M.6.14a and fix slot $j$. Let
$$
\mathfrak T[B_{>j},W_r,A_{<j}]
$$
denote the positive dual-tester element obtained by the normalized multilinear link map that joins the retained past outcome block $A_{<j}$, the probe outcome $W_r$, and the future event $B_{>j}$ to the fixed initial preparation, memory wiring, and terminal effect. The map $\mathfrak T$ is linear in every slot, includes the Choi transposes fixed in Definition M.6.14a, and is required to send every complete sequence of instruments to a normalized dual tester. It is not the raw tensor product of arbitrary Choi matrices.

If
$$
Z(B_{>j},A_{<j})
=
\sum_{r\in R}
\operatorname{Tr}\!\left[
\Upsilon_{n:0}\,\mathfrak T[B_{>j},W_r,A_{<j}]
\right]
>0,
\tag{M.6.14d.1}
$$
then post-selection is ordinary conditioning:
$$
p(r\mid B_{>j},A_{<j})
=
\frac{
\operatorname{Tr}[\Upsilon_{n:0}\mathfrak T[B_{>j},W_r,A_{<j}]]
}{
\sum_{r'\in R}\operatorname{Tr}[\Upsilon_{n:0}\mathfrak T[B_{>j},W_{r'},A_{<j}]]
}.
\tag{M.6.14d.2}
$$
If $\{B_{>j}^{(b)}\}_{b\in\mathcal B}$ is complete and unread, dual-tester compatibility with the comb recursion gives
$$
\sum_{b\in\mathcal B}
\operatorname{Tr}[\Upsilon_{n:0}\mathfrak T[B_{>j}^{(b)},W_r,A_{<j}]]
=
\operatorname{Tr}[\Upsilon_{j:0}\mathfrak T_j[W_r,A_{<j}]],
\tag{M.6.14d.3}
$$
where $\mathfrak T_j$ is the reduced normalized tester induced by the same link map. Hence a future choice cannot change an unread earlier marginal.

Let $\mathsf J_j$ be the identity intervention and suppose
$$
\operatorname{Tr}[\Upsilon_{n:0}\mathfrak T[B_{>j},\mathsf J_j,A_{<j}]]>0.
$$
For $W_r^{(\lambda)}=q_r\mathsf J_j+\lambda K_r+O(\lambda^2)$ with $q_r\ge0$, $\sum_rq_r=1$, $\sum_rK_r=0$, positive instrument elements for small $\lambda$, and a centered pointer $\sum_rq_rx_r=0$, multilinearity gives
$$
\mathbb E_\lambda[x\mid B_{>j},A_{<j}]
=
\lambda
\frac{
\sum_r x_r\operatorname{Tr}[\Upsilon_{n:0}\mathfrak T[B_{>j},K_r,A_{<j}]]
}{
\operatorname{Tr}[\Upsilon_{n:0}\mathfrak T[B_{>j},\mathsf J_j,A_{<j}]]
}
+O(\lambda^2).
\tag{M.6.14d.4}
$$
In the one-slot Lüders specialization with preselection $\rho_i$, bridges $U_{j:i},U_{f:j}$, projectors $P_r$, and final effect $E_f$, the tester contraction reduces to
$$
p(r\mid i,f)
=
\frac{
\operatorname{Tr}(E_fU_{f:j}P_rU_{j:i}\rho_iU_{j:i}^\dagger P_rU_{f:j}^\dagger)
}{
\sum_{r'}\operatorname{Tr}(E_fU_{f:j}P_{r'}U_{j:i}\rho_iU_{j:i}^\dagger P_{r'}U_{f:j}^\dagger)
}.
\tag{M.6.14d.5}
$$

*Proof.* Positivity of $\Upsilon$ and of every tester element gives nonnegative joint weights. Completeness of the dual tester gives unit total weight, so conditioning on the positive event $B_{>j}$ proves (M.6.14d.2). Summing an unread complete future block and applying the compatible comb/dual-comb recursion gives (M.6.14d.3). Linearity of $\mathfrak T$, $\sum_rK_r=0$, and pointer centering give the first-order quotient (M.6.14d.4). Substitution of the normalized preparation, Lüders maps, unitary links, and terminal effect gives (M.6.14d.5). No future outcome is inserted as an earlier dynamical input; it labels only the conditioned tester event. ∎

**Theorem M.6.14e (Conditional Minimal Stinespring Dilation for Finite Updates).** Let the response-null quotients be finite-dimensional operator systems $S_X,S_Y$. Assume that the Heisenberg dual of the retained update descends to a specified unital completely positive map
$$
\Phi:\mathcal A_Y\to\mathcal A_X
\tag{M.6.14e.1}
$$
between finite-dimensional $C^*$-algebras containing those operator systems. If outcome-resolved maps are retained, assume CP maps $\Phi_r:\mathcal A_Y\to\mathcal A_X$ with $\sum_r\Phi_r=\Phi$; these form the instrument. Without outcome-resolved data, the conclusion is the one-outcome channel $\Phi$.

The channel has a minimal Stinespring dilation whose environment dimension is $\operatorname{rank}J(\Phi)$. For an instrument, apply this statement to the channel
$$
\widetilde\Phi(a)=\bigoplus_r\Phi_r(a)
$$
including the classical outcome register. Minimal dilations are unique up to a unitary on equal minimal environments, and every nonminimal dilation contains the minimal one through an isometry. If the PCE ledger assigns strictly greater cost to response-null environmental refinements, it selects this minimal dilation up to that unitary equivalence. No multi-time minimal-memory conclusion follows without a separately stated comb-memory optimization theorem.

*Proof.* The CP extension between $\mathcal A_Y$ and $\mathcal A_X$ is a hypothesis, so the finite-dimensional Choi matrix $J(\Phi)$ is positive. A rank decomposition
$$
J(\Phi)=\sum_{a=1}^r|v_a\rangle\langle v_a|
$$
with $r=\operatorname{rank}J(\Phi)$ yields $r$ Kraus operators and hence a Stinespring environment of dimension $r$. Conversely, tracing an environment of dimension $m$ gives at most $m$ linearly independent Kraus operators, so $m\ge\operatorname{rank}J(\Phi)$. This proves minimality. The standard minimal-Stinespring uniqueness argument identifies two minimal Kraus spans by a unitary; a nonminimal Kraus family is related by an isometry. The same argument applied to $\widetilde\Phi$ proves the instrument statement. Strict PCE monotonicity removes only the stipulated response-null refinements. ∎

## M.7 Conclusion

The appendix provides a conditional model of perspective-dependent quantum records, their interactions, and their costs. Its conclusions apply when the stated state, readout, and physical-response assumptions hold.

**Technical ledger.**

This appendix provides a conditional mathematical model for Perspectival State and Dual Dynamics.

**Formal Foundations (M.2–M.5).** After the flag-manifold perspective space, normalized transition kernel, actualization instrument, drift, diffusion, and boundary data are specified, Equations M.5a–M.5b define a drift-diffusion realization. On the finite-dimensional normalized noncontextual frame-function branch of Theorem G.1.3, the outcome probabilities have Born form. Definite retained outcomes require the declared instrument/readout branch, and Wasserstein contractivity holds for the constructed class only under its curvature and regularity hypotheses.

**Foundational Scenarios (M.6).** Within the stipulated perspective-indexed semantics and interaction kernel:

- **Summary of Theorem M.6.1:** Friend and Wigner records are indexed by different perspectives, so the model assigns no single unindexed proposition both definite and indefinite.
- **Summary of Lemma M.6.1:** Convergence to consistent configurations requires the strong-readout and contractive-kernel hypotheses.
- **Summary of Definition M.6.2, Lemma M.6.2a, and Theorem M.6.2b:** Actualized records may be imported across distinct perspectives only with a record-sharing or perspective-invariance certificate. Theorem M.6.2b proves that the displayed Frauchiger–Renner-style import is ill typed when both certificates are absent; it does not claim a formal analysis of every step of the complete protocol.
- **Summary of Structural Correspondence M.6.4:** The comparison with frame-relative simultaneity is interpretive. SPAP and the registered-reset inequality do not derive the perspective space, actuality rule, transition kernel, or Lorentzian frame structure.

**Connection to CC.** The variable $N$ is a typed interface for Hypothesis 3. An aggregate may influence an outcome through $N$ only on an accepted G9CC response certificate constructing the causal aggregate-to-control map and changed normalized instrument. Theorems 39 and 51 then bound the supplied response; they neither prove it nonzero nor fix its effect size. Preservation of Lemma M.6.1 additionally requires the modulated readout kernel to remain in its strong-readout and contractive class.

**Cost Functional (M.6.10).** The perspectival profile $\mathcal{P}_S(E)=(\Delta Q_S,\mu_S,\sigma_S)$ is a receiver-pattern descriptor on $\Sigma$. The SPAP proximity $\mu_S(E)$ records the performance level required by criterion (M.18), while $\sigma_S(E)$ records the fraction of the update assigned to the self-model subspace. On an asymptotic family carrying the reduction certificate of Theorem M.10.3, $\mu_{S_\lambda}(E_\lambda)\to\infty$ gives the certified computational lower bound (M.23). Purely external patterns attain $\mu_S(E)=1/\alpha_{SPAP}$ only under the baseline-invariance hypothesis of Corollary M.10.3.1; neither statement alone fixes physical heat. External evaluation and finite-family screening require the effective model-access, decision, and optional insulation certificates of Theorems M.10.5 and M.10.8. A replay penalty is available only for an implementation defined to reproduce a specified target reset ledger, with nonnegative overhead imposed by that accounting convention. Theorem M.10.9 proves that $\mu_S(E)$ is not determined by Shannon entropy alone; comparisons with other information quantities require separately defined reduction maps.

**Synthesis.** On its declared instrument and perspective-kernel premises, the formalism types `Evolve` records and represents memory, causal-order, post-selection, and weak-probe histories through finite process tensors. It proves the stated cross-perspective import obstruction, not a resolution of every foundational protocol. The CC variable $N$ is a conditional empirical interface whose physical realization remains G9CC. The framework thereby supplies a coherent branch model while retaining the independent carrier, actualization, thermodynamic, and realization obligations.

**Causality terminology rule.** Every endpoint, bias-strength, gravity-backreaction, or zero-error bound in this appendix is weaker than operational causality. Postulate 2 means exact pre-lightcone context independence by Theorem 39c; a late-randomized Bob-marginal shift lies outside that branch.
