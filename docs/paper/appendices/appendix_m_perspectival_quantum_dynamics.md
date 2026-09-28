# Appendix M: Formalism for Perspectival Quantum Dynamics

## M.1 Introduction

This appendix models how quantum records depend on the perspective from which they are registered. Its central result identifies when one perspective may use another's record.

**Technical ledger.**

This appendix gives a mathematical formalism for the Perspectival State ($S_{(s)}(t)$, Definition 24) and the registered `Evolve` instruments of Definition 27. It constructs a conditional perspective-update model, proves its stated finite-dimensional properties, analyzes Wigner's-Friend-type records, and isolates a certificate-scoped obstruction to one cross-perspective import.

We use POP, PCE, the MPU of Definition 23, the full-context response closure of Principle 5b, the invariant SPAP response ledger of Principle 11b, and the quantum closure of Principles 8.0b–8.0c and Theorem 8.0d. Theorem 8.0d supplies $\mathcal H_0\cong\mathbb C^8$, the Born trace law, and a normalized quantum instrument for every registered verification; Principle 8.0c supplies the single retained outcome of each registered run. This appendix develops the remaining perspective dynamics of those registered instruments; its kernels do not re-postulate the carrier, Born weights, or actualization law.

The appendix is organized as follows:

- **Section M.2** formalizes the Perspectival State $S_{(s)}(t)=(\rho(t),s)$, with pure vectors as a special case, and equips the complete-flag Perspective Space $\Sigma\cong U(d_0)/U(1)^{d_0}$ with its declared Riemannian metric.

- **Section M.3** decomposes a registered quantum instrument from the conditional perspective kernel $G_{\text{persp}}(s'|s,k,N,\Delta t)$, gives an explicit drift-diffusion realization on $\Sigma$, and registers an interrogative-efficiency branch (Section M.3.3.2) on which the realization's drift data are derived rather than supplied.

- **Section M.4** applies that conditional instrument model to measurement records, with the Born selector and single-run actualization supplied by the cited quantum branch.

- **Section M.5** records compatibility with finite-dimensional operator algebras, homogeneous spaces, and Markov kernels.

- **Section M.6** gives a perspectival analysis of Wigner's Friend and proves a certificate-scoped obstruction for an actualized record imported across distinct perspectives without a sharing or invariance certificate, and applies it to the complete four-laboratory Frauchiger--Renner certainty graph (Theorem M.6.2c). The section also identifies the interaction context $N$ as the conditional entry point for the independently certificate-gated CC program.

- **Section M.7** concludes by synthesizing the contributions of the appendix and situating the perspectival formalism within the broader framework.


## M.2 The Perspectival State Formalized

We formally define the components describing the state of a Minimal Predictive Unit (MPU).

*   **Perspectival State:** As defined in Definition 24, the complete operational quantum state is $S_{(s)}(t)=(\rho(t),s)$.
*   **Quantum component:** $\rho(t)$ is a positive trace-one operator on $\mathcal H_0$. Pure states are the special case $\rho(t)=|\psi(t)\rangle\langle\psi(t)|$. The dimension $d_0=\dim\mathcal H_0$ satisfies $d_0\ge8$ on the Theorem 23 branch.
*   **Perspective index:** $s\in\Sigma$ records the registered interaction context or labeled projective basis. It is not a replacement for $\rho$ and does not purify a mixed state.
*   **Perspective Space $\Sigma$:** On the ordered rank-one context branch of Theorem 25 and Corollary 26, the Perspective Space $\Sigma$ is mathematically identified with the space of all possible ordered orthonormal bases (ONBs) of the Hilbert space $\mathcal{H}_0$, modulo phase equivalence. This space possesses the structure of the complete flag manifold, a compact complex homogeneous space, specifically $\Sigma \cong U(d_0)/U(1)^{d_0}$. Here, $U(d_0)$ is the unitary group on $\mathcal{H}_0$ and $U(1)^{d_0}$ is the maximal torus subgroup representing the freedom to choose phases for each basis vector independently.
*   **Metric on $\Sigma$:** Fix the normal homogeneous metric on $\Sigma=U(d_0)/U(1)^{d_0}$ induced by the Ad-invariant inner product $\langle X,Y\rangle=-\tfrac12\operatorname{Tr}(XY)$ on the off-diagonal anti-Hermitian complement of the torus algebra, with the normalization of Definition 25 and Equation (42). Let $g_\Sigma$ and $d_\Sigma$ denote its Riemannian metric and geodesic distance. Any alternative weighted flag metric must be declared separately because it changes the Hessian, Ricci tensor, and Wasserstein distance used below.

This structure $(\mathcal{H}_0, \Sigma, d_\Sigma)$ provides the formal mathematical setting for describing the state and dynamics of an MPU.

## M.3 Formalizing the Dual Dynamics

The framework posits Dual Dynamics for MPUs (Section 7.3.3). We formalize both components.

### M.3.1 Quantum Evolution between Registered Interactions

On the finite-dimensional Hilbert branch satisfying the continuity and time-translation hypotheses of Theorem 8.7, reset-free evolution is generated by a time-independent self-adjoint Hamiltonian. On a separately specified time-dependent branch with continuous self-adjoint $\hat H(t)$, the unitary propagator is
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

Given an outcome $k$ with $p_k^N(\rho)>0$, let $G_{\mathrm{persp}}(s'|s,k,N,\Delta t)$ be the conditional perspective density. Retain the outcome label in the joint law:
$$
\mathbb P(\{k\}\times d\rho'\times ds'\mid(\rho,s),N,\Delta t)
=p_k^N(\rho)\,
\delta_{\rho_k^N}(d\rho')\,
G_{\mathrm{persp}}(s'|s,k,N,\Delta t)\,d\mu(s').
\tag{M.2}
$$
A zero-probability outcome contributes the zero measure and requires no normalized poststate. For each retained conditional kernel,
$$
G_{\mathrm{persp}}(s'|s,k,N,\Delta t)\ge0,
\qquad
\int_\Sigma G_{\mathrm{persp}}(s'|s,k,N,\Delta t)\,d\mu(s')=1.
\tag{M.3}
$$
Here $\mu$ is the normalized $U(d_0)$-invariant quotient probability measure induced by Haar measure. Summing (M.2) over the outcome labels gives the transition law on density operators and perspectives alone:
$$
\mathbb P(d\rho',ds'\mid(\rho,s),N,\Delta t)
=\sum_{k:p_k^N(\rho)>0}p_k^N(\rho)\,
\delta_{\rho_k^N}(d\rho')G_{\mathrm{persp}}(s'|s,k,N,\Delta t)\,d\mu(s').
$$
Distinct outcomes can have the same normalized poststate; their contributions then add. Integrating this measure gives $\sum_kp_k^N(\rho)=1$ by instrument normalization. The formulas apply to mixed, entangled-reduced and pure states. The Born trace law and single-run selection retain the independent premises of the registered quantum branch; perspective diffusion does not derive them.

### M.3.3 Properties and an Explicit Drift-Diffusion Realization of the Conditional Perspective Kernel $G_{persp}$

This section fixes the structural decomposition (M.2), the normalization requirement (M.3), the ideal projective limit (M.4), and an explicit drift-diffusion realization of the conditional kernel $G_{persp}(s' | s, k, N, \Delta t)$ whose short-time behavior matches the Gaussian-with-drift heuristic form and whose semigroup satisfies the robustness conditions used below. The detailed interaction dependence of the kernel encodes the physics of the interaction $N$ and can vary across admissible interaction models. We therefore begin by stating the generic properties and then present that constructive realization. Section M.3.3.2 then registers an interrogative-efficiency branch on which the realization's drift data are derived rather than supplied.

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
Here $0<\sigma^2(\Delta t,N)<\infty$, and $K(\cdot,s,k,N)$ is measurable and nonnegative. Require
$$
0<\mathcal N
:=\int_\Sigma
\exp\!\left[-\frac{d_\Sigma^2(s',s_k)}{2\sigma^2(\Delta t,N)}\right]
K(s',s,k,N)\,d\mu(s')
<\infty.
$$
Division by this positive finite normalizer gives a nonnegative probability density satisfying (M.3). Integrability alone does not exclude $K=0$ almost everywhere or a signed density. A strong-measurement limit as $\sigma^2\to0$ additionally requires proof that these normalized measures converge weakly to $\delta_{s_k}$.

#### M.3.3.1 Constructive realization of $G_{\mathrm{persp}}$

The following is an explicit generator on the perspective manifold
$\Sigma\cong U(d_{0})/U(1)^{d_{0}}$ whose time-$t$ transition kernel has the same short-time Gaussian-with-drift structure as the heuristic form (M.5) in the weak-measurement limit and satisfies the conditional Wasserstein estimate in item (d). Application of Lemma L.1 additionally requires a registered context-to-control map, its bounded range and physical cost, an invariant complete feedback domain, and the strict feedback contraction bound stated in that lemma.

**(a) Geometric setup**

Equip $\Sigma$ with the quotient Riemannian metric $g_\Sigma$ of Definition 25. Let $\Delta_{\Sigma}:=\operatorname{div}_{\Sigma}\nabla_{\Sigma}$ denote the corresponding **nonpositive** Laplace–Beltrami operator, so that $e^{t\Delta_{\Sigma}}$ is the heat semigroup on $\Sigma$.

**(b) Interaction-biased Markov diffusion generator**

Fix a complete target perspective $s_k\in\Sigma$, namely an ordered orthonormal flag selected by the measurement apparatus and carrying outcome label $k$. A single outcome ray is not sufficient to determine $s_k$. On the interrogative-efficiency branch of Section M.3.3.2, the pair $(s_k,\lambda_{\mathrm{drift}})$ is instead supplied by Definition M.3.3f and Proposition M.3.3h; either supply is admissible interaction-model data. In a convex normal neighborhood of this complete flag, define
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
On the declared diffusion-with-drift model for the perspective manifold $\Sigma$, introduce the backward generator in weighted-gradient form:

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
On the global smooth-potential branch, $\mathcal L_\Sigma^{(k)}$ is uniformly elliptic with smooth coefficients on compact connected $\Sigma$, so its positive-time kernel is smooth, strictly positive and normalized. Put $\mathcal V_\Sigma:=\operatorname{vol}_{g_\Sigma}(\Sigma)>0$. Invariance of the metric gives $d\mu=d\operatorname{vol}_{g_\Sigma}/\mathcal V_\Sigma$.

For the heat semigroup of $\Delta_\Sigma$, let $p_t^{\mathrm{vol}}(s,s')$ denote the density with respect to Riemannian volume. The Minakshisundaram–Pleijel expansion [Minakshisundaram & Pleijel 1949] gives, before the cut locus,
$$
p_t^{\mathrm{vol}}(s,s')
\sim\frac{e^{-d_\Sigma^2(s,s')/(4t)}}{(4\pi t)^{\dim\Sigma/2}}
\sum_{j=0}^{\infty}u_j(s,s')t^j,
\qquad
u_0(s,s')=\det(d\exp_s)^{-1/2}.
$$
The density in (M.3) uses $\mu$, so for this heat branch it is
$$
G_{\mathrm{heat}}(s'|s,t)=\mathcal V_\Sigma\,p_t^{\mathrm{vol}}(s,s').
$$
Indeed $G_{\mathrm{heat}}\,d\mu=p_t^{\mathrm{vol}}\,d\operatorname{vol}_{g_\Sigma}$, and both integrate to one. In the parabolic near-diagonal regime $d_\Sigma(s,s')=O(\sqrt t)$, the volume-density coefficient has $u_0=1+O(t)$; the density relative to $\mu$ has the additional constant $\mathcal V_\Sigma$. Adding smooth drift changes the transport coefficients while retaining the elliptic Gaussian scale and the same change-of-reference-measure factor. The local squared-distance generator requires a separately defined stopped or reflected process before its kernel can be called supported in a normal neighborhood.

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

#### M.3.3.2 The interrogative-efficiency branch: derived drift data

The drift data $(s_k,\lambda_{\mathrm{drift}})$ entering items (b)–(e) of Section M.3.3.1 may be supplied directly by the interaction model, as above, or derived on the registered branch constructed in this subsection, the interrogative-efficiency branch; the selection rule it registers is referred to as the Principle of Interrogative Efficiency (PIE). Throughout, fix the setting of Corollary 23c.1: a finite-dimensional smooth chart $\Theta$ of MPU protocol-response states and a $C^2$ family $\rho:\Theta\to\mathcal D(\mathcal H_0)$ on the retained Hilbert branch, read on a retained identifiable constant-rank support stratum with the pointwise SLD and positive-probability-sum conventions of that corollary, together with a registered operating point $\theta\in\Theta$ and a registered tangent direction $v$ with symmetric logarithmic derivative $L_v=v^aL_a$ there, so that $F^Q(v,v)=\operatorname{tr}(\rho(\theta)L_v^2)$ as recorded in the proof of Corollary 23c.1. When the kernel is conditioned on a registered outcome $k$, the registered operating point is the post-outcome retained state, so the derived drift data inherit the outcome dependence displayed in (M.2). Unlabeled state symbols $\rho$ below denote $\rho(\theta)$.

**Definition M.3.3c (Interrogative Benefit).** For $s\in\Sigma$ represented by an ordered orthonormal basis $\{|i\rangle_s\}_{i=1}^{d_0}$ (Theorem 24), with projectors $P_i^s=|i\rangle_s\langle i|_s$ and $p_i(\theta)=\operatorname{tr}(\rho(\theta)P_i^s)$, the interrogative benefit at the registered operating point and direction is
$$
B_{\mathrm{int}}(s):=\sum_{i:\,p_i(\theta)>0}\frac{\big(\partial_v p_i(\theta)\big)^2}{p_i(\theta)},
\tag{M.5d}
$$
with zero-probability outcomes omitted at the operating point, using the pointwise convention of Equation (23c.1). Limits across outcome-support or density-rank changes require separate assumptions and are not substituted into (M.5d) or (M.5e). Contracting (23c.1) twice with $v$ gives $B_{\mathrm{int}}(s)=v^aF^{(E(s))}_{ab}(\theta)v^b$ for the labeled complete rank-one projective context $E(s)=\{P_i^s\}$. On a retained-protocol branch containing these contexts, for instance on the full projection/effect coverage route of Definition 8.2b, $B_{\mathrm{int}}(s)$ is the directional classical Fisher information attainable by interrogating in context $s$.

**Lemma M.3.3d (Descent to $\Sigma$).** $B_{\mathrm{int}}$ is well defined on $\Sigma$: it depends on the representing ordered basis only through the projectors $P_i^s$ and is invariant under per-vector phases and outcome-label permutations.

*Proof.* Each $p_i(\theta)$ and $\partial_v p_i(\theta)$ depends only on $P_i^s$, which is unchanged by $|i\rangle_s\mapsto e^{i\phi_i}|i\rangle_s$, and the sum in (M.5d) is invariant under permutations of the index $i$. Theorem 24 identifies the ordered projector family with the flag $s\in\Sigma$. Permuting its labels can change the flag while preserving the value of $B_{\mathrm{int}}$. ∎

**Theorem M.3.3e (Attainable Interrogative Benefit).** Let $L_v$ be any symmetric logarithmic derivative for the registered direction $v$ at the registered operating point. Then
$$
\sup_{s\in\Sigma}B_{\mathrm{int}}(s)=F^Q(v,v)=\operatorname{tr}(\rho L_v^2),
\tag{M.5e}
$$
the value is independent of the admissible choice of $L_v$, and the supremum is attained at every eigenflag of $L_v$, that is, at every $s\in\Sigma$ represented by an ordered orthonormal eigenbasis of $L_v$.

*Proof.* Upper bound. Each labeled complete rank-one projective context is a POVM on the $C^2$ family, so the Braunstein–Caves information inequality, invoked in the proof of Corollary 23c.1 for every POVM on such a family, gives $F^{(E(s))}(\theta)\preceq F^Q(\theta)$; contracting twice with $v$ yields $B_{\mathrm{int}}(s)=v^aF^{(E(s))}_{ab}v^b\le v^aF^Q_{ab}v^b=F^Q(v,v)$ for every $s\in\Sigma$.

Attainment. Let $\{|l_i\rangle\}_{i=1}^{d_0}$ be an orthonormal eigenbasis of $L_v$ with $L_v|l_i\rangle=\lambda_i|l_i\rangle$, $\lambda_i\in\mathbb R$, and let $s_\star\in\Sigma$ be a flag it represents. Write $p_i=\langle l_i|\rho|l_i\rangle$. Hermiticity of $L_v$ gives $\langle l_i|L_v\rho|l_i\rangle=\lambda_i p_i=\langle l_i|\rho L_v|l_i\rangle$, so the defining relation $\partial_v\rho=\tfrac12(L_v\rho+\rho L_v)$ yields
$$
\partial_v p_i=\langle l_i|\partial_v\rho|l_i\rangle=\lambda_i p_i.
$$
Every index with $p_i=0$ therefore has $\partial_v p_i=0$ and contributes nothing under the stated convention, while the remaining indices give
$$
B_{\mathrm{int}}(s_\star)=\sum_{i:\,p_i>0}\lambda_i^2p_i=\sum_{i=1}^{d_0}\lambda_i^2\langle l_i|\rho|l_i\rangle=\operatorname{tr}(\rho L_v^2)=F^Q(v,v).
$$

Choice independence. If $L_v'$ also satisfies the defining relation, then $D:=L_v-L_v'$ obeys $D\rho+\rho D=0$. Multiplying on the right by $D$ and taking the trace gives $\operatorname{tr}(D\rho D)+\operatorname{tr}(\rho D^2)=0$, while cyclicity gives $\operatorname{tr}(D\rho D)=\operatorname{tr}(\rho D^2)$, so $\operatorname{tr}(D\rho D)=0$. Since $\operatorname{tr}(D\rho D)=\operatorname{tr}\big((\rho^{1/2}D)^\dagger(\rho^{1/2}D)\big)$, this forces $\rho^{1/2}D=0$, hence $\rho D=0$ and, taking adjoints, $D\rho=0$. Expanding $\operatorname{tr}(\rho L_v'^2)=\operatorname{tr}\big(\rho(L_v-D)^2\big)$, the terms $\operatorname{tr}(\rho DL_v)$, $\operatorname{tr}(\rho L_vD)=\operatorname{tr}(D\rho L_v)$, and $\operatorname{tr}(\rho D^2)$ all vanish because $\rho D=D\rho=0$, so $\operatorname{tr}(\rho L_v'^2)=\operatorname{tr}(\rho L_v^2)$, and the attainment computation applies verbatim to any admissible choice. ∎

**Definition M.3.3f (Interrogative-Efficiency Potential).** The interrogative-efficiency branch registers: a conversion factor $\gamma_{\mathrm{int}}>0$ carrying the reciprocal dimension of $B_{\mathrm{int}}$, playing for the interrogative sector the role the power conversion factor $\Gamma_0$ (Definition 20) plays for the complexity sector; a $C^\infty$ execution-cost profile $v_{\mathrm{exec}}:\Sigma\to[0,\infty)$, constant when no context-dependent execution cost is registered; and, optionally, on a branch carrying criterion (M.18)–(M.19) together with the correspondence of Remark M.10.2, a lower-semicontinuous self-model cost profile $v_{\mathrm{self}}:\Sigma\to[0,\infty]$, with $v_{\mathrm{self}}\equiv0$ when unregistered. The interrogative-efficiency potential is
$$
V_{\mathrm{PIE}}(s'):=-\gamma_{\mathrm{int}}B_{\mathrm{int}}(s')+v_{\mathrm{exec}}(s')+v_{\mathrm{self}}(s'),
\tag{M.5f}
$$
defined up to an additive constant, which the Gibbs normalization of item (e) removes. A smooth interrogative sub-branch additionally registers a function $V_{\mathrm{PIE}}^{\mathrm{sm}}\in C^\infty(\Sigma,\mathbb R)$ agreeing with $V_{\mathrm{PIE}}$ on a neighborhood of a registered minimizer $s_\star$ of $V_{\mathrm{PIE}}$; this mirrors the global smooth-potential choice of item (b). No separate transition-cost term enters (M.5f): at interaction duration $\Delta t$ the geometric transition cost is carried by the short-time Gaussian factor $e^{-d_\Sigma^2(s,s')/(4\Delta t)}$ of the kernel expansion in item (c).

**Corollary M.3.3g (Kernel Well-Posedness on the Smooth Interrogative Sub-Branch).** With $V_k:=V_{\mathrm{PIE}}^{\mathrm{sm}}$, the generator (M.5a) and kernel (M.5b) satisfy all conclusions of items (c) and (e): the positive-time kernel is smooth, strictly positive, and normalized, the invariant density is $Z^{-1}e^{-V_{\mathrm{PIE}}^{\mathrm{sm}}}d\mu$, and the relative-entropy decrease of item (e) holds. Item (d) holds under the corresponding bound $\operatorname{Ric}_\Sigma+\operatorname{Hess}_\Sigma V_{\mathrm{PIE}}^{\mathrm{sm}}\succeq\kappa_{\mathrm{eff}}g_\Sigma$.

*Proof.* The proofs of items (c), (d), and (e) use, respectively: smoothness of the coefficients and uniform ellipticity of (M.5a) on the compact connected manifold $\Sigma$ together with the Minakshisundaram–Pleijel expansion; the stated Bakry–Émery curvature-dimension bound; and reversibility of (M.5a) with respect to the Gibbs weight together with smoothness, positivity, and compactness. Each input holds verbatim with $V_k=V_{\mathrm{PIE}}^{\mathrm{sm}}\in C^\infty(\Sigma,\mathbb R)$. ∎

**Proposition M.3.3h (Second-Order Normal Form and Derived Drift Data).** Let $V\in C^2$ on a neighborhood of $s_\star\in\Sigma$ with $\nabla_\Sigma V(s_\star)=0$ and Riemannian Hessian $H:=\operatorname{Hess}_\Sigma V(s_\star)$. Then, for $v$ in a normal ball about $s_\star$,
$$
V(\exp_{s_\star}v)=V(s_\star)+\tfrac12H(v,v)+o\big(\|v\|_{g_\Sigma}^2\big),
\qquad
d_\Sigma(s_\star,\exp_{s_\star}v)=\|v\|_{g_\Sigma}.
\tag{M.5g}
$$
If moreover $H=\lambda_{\mathrm{drift}}\,g_\Sigma|_{s_\star}$ with $\lambda_{\mathrm{drift}}>0$, then
$$
V(s')=V(s_\star)+\frac{\lambda_{\mathrm{drift}}}{2}d_\Sigma^2(s',s_\star)+o\big(d_\Sigma^2(s',s_\star)\big),
$$
so the local model $V_k^{\mathrm{loc}}$ of item (b) with $s_k=s_\star$ is the second-order normal form of $V$ at $s_\star$. In particular, on a smooth interrogative sub-branch whose registered potential $V_{\mathrm{PIE}}^{\mathrm{sm}}$ has a unique global minimizer $s_\star$ that is nondegenerate with isotropic Hessian $\lambda_{\mathrm{drift}}\,g_\Sigma|_{s_\star}$: the drift data of items (b)–(e) are derived rather than supplied, with $s_k:=s_\star$ and $\lambda_{\mathrm{drift}}$ the stated isotropy scale; the substitution $V_k:=V_{\mathrm{PIE}}^{\mathrm{sm}}$ in (M.5a)–(M.5b) is admissible by Corollary M.3.3g; and when $v_{\mathrm{exec}}$ and $v_{\mathrm{self}}$ are constant on the agreement neighborhood, $V_{\mathrm{PIE}}^{\mathrm{sm}}$ and $-\gamma_{\mathrm{int}}B_{\mathrm{int}}$ differ there by a constant, so $s_\star$ is a local maximizer of $B_{\mathrm{int}}$ and $\lambda_{\mathrm{drift}}$ equals $\gamma_{\mathrm{int}}$ times the isotropy scale of the Hessian of $-B_{\mathrm{int}}$ at $s_\star$ computed through the smooth representative.

*Proof.* Work in geodesic normal coordinates $(x^1,\dots,x^m)$ centered at $s_\star$, $m=\dim\Sigma$; these exist on a normal ball because $(\Sigma,g_\Sigma)$ is a smooth Riemannian manifold. At the center, $g_{ij}(0)=\delta_{ij}$ and the Christoffel symbols vanish, so for the coordinate representation $\widetilde V(x):=V(\exp_{s_\star}(x^ie_i))$ the Riemannian Hessian at the critical point coincides with the coordinate Hessian: $H_{ij}=\partial_i\partial_j\widetilde V(0)-\Gamma_{ij}^k(0)\,\partial_k\widetilde V(0)=\partial_i\partial_j\widetilde V(0)$. Since $\nabla_\Sigma V(s_\star)=0$, $\partial_i\widetilde V(0)=0$, and the second-order Taylor theorem with Peano remainder for the $C^2$ function $\widetilde V$ gives the expansion in (M.5g). Radial geodesics from $s_\star$ are minimizing within the normal ball, so $d_\Sigma(s_\star,\exp_{s_\star}v)=\|v\|_{g_\Sigma}$ there. If $H=\lambda_{\mathrm{drift}}g_\Sigma|_{s_\star}$, then $H(v,v)=\lambda_{\mathrm{drift}}\|v\|_{g_\Sigma}^2=\lambda_{\mathrm{drift}}d_\Sigma^2(s_\star,\exp_{s_\star}v)$, giving the second display, whose right-hand side is $V(s_\star)+V_k^{\mathrm{loc}}(s')+o(d_\Sigma^2)$ with $s_k=s_\star$. Applying the expansion to $V=V_{\mathrm{PIE}}^{\mathrm{sm}}$ at its unique global nondegenerate minimizer, where $\nabla_\Sigma V_{\mathrm{PIE}}^{\mathrm{sm}}(s_\star)=0$ because $\Sigma$ is boundaryless, gives the derived identifications; the substitution statement is Corollary M.3.3g; and when the cost profiles are constant on the agreement neighborhood, $V_{\mathrm{PIE}}^{\mathrm{sm}}=-\gamma_{\mathrm{int}}B_{\mathrm{int}}+\mathrm{const}$ there, so the maximizer and Hessian statements follow by sign reversal and bilinearity of the Hessian. ∎

**Corollary M.3.3i (Isotropic Exploration Baseline).** If $B_{\mathrm{int}}$, $v_{\mathrm{exec}}$, and $v_{\mathrm{self}}$ are finite constants on $\Sigma$, then $V_{\mathrm{PIE}}$ is a finite constant, $\nabla_\Sigma V_{\mathrm{PIE}}=0$, and the generator (M.5a) with $V_k=V_{\mathrm{PIE}}$ is the isotropic heat generator $\Delta_\Sigma$. All three constant-profile premises are needed for this conclusion; a flat benefit profile alone does not remove gradients of the cost profiles.

*Proof.* Equation (M.5f) is a finite real constant under the stated premises. Its gradient vanishes, so (M.5a) reduces to $\Delta_\Sigma f$. The allowed extended profile $v_{\mathrm{self}}\equiv+\infty$ is outside this branch: it does not define a smooth real potential or a positive Gibbs normalizer. ∎

**Remark M.3.3j (Scope and Registration).** The branch derives drift data from registered benefit and cost profiles; it does not derive the registration itself. The chart, operating point, direction $v$, conversion factor $\gamma_{\mathrm{int}}$, cost profiles, and smooth representative are registered task data in the sense of Definition 8's task registration, so the branch is task-indexed. The Born trace law, single-run selector, and actualization instrument of Sections M.3.2 and M.4 retain their independent premises; nothing in this subsection derives them. The ideal projective limit, Equation (M.4), and the strong-readout transient limit retain the additional hypotheses stated in items (b) and (d). Multi-MPU consistency of derived kernels retains the descent condition of Corollary G.1.11c, and the self-model cost profile inherits the certificate structure of Theorems M.10.3 and M.10.7, including the divergence behavior recorded after (M.19). The benefit-minus-cost form of (M.5f) parallels the driving-force decomposition of Definition 20; no identification of $\gamma_{\mathrm{int}}$ with $\Gamma_0$ is made.

**Theorem M.3.3k (Complete Regular-Finite Covariant-Kernel Classification).** Let a finite group $G$ act on $\Sigma_G=G$ by left translation. A Markov kernel is $G$-covariant if and only if there is a unique probability law $q$ on $G$ with
$$
K_q(g,h)=q(g^{-1}h).
\tag{M.3.3k.1}
$$
Its exact total-variation contraction coefficient is
$$
\eta_{\mathrm{TV}}(K_q)=\frac12\max_{a\in G}\sum_{u\in G}|q(u)-q(a^{-1}u)|,
\tag{M.3.3k.2}
$$
Sampling $U\sim q$ independently of the input $g$ and setting the output to $gU$ realizes this Markov kernel as a mathematical random update. For $G=\mathbb Z_2$, the laws $q_p=(p,1-p)$ and $q_{1-p}$ give response-distinct kernels when $p\ne1/2$, the same contraction $|2p-1|$, one logical update per draw, and the same marginal draw entropy $H(U)=h_2(p)$. A physical reset cost requires a separately registered reset variable and retained information.

*Proof.* Covariance gives $K(g,h)=K(e,g^{-1}h)$, which identifies the unique $q(u)=K(e,u)$; this formula also proves the converse. For a one-element group the contraction coefficient is zero. Otherwise, for any two input laws let $t$ be their total-variation distance; $t=0$ gives identical output laws. If $t>0$, their difference is $t(\nu_+-\nu_-)$ for probability laws $\nu_\pm$. The output difference is therefore $t$ times a convex combination of differences of kernel rows. Its total variation is at most $t$ times the largest row distance, and input point masses on a maximizing pair attain that ratio. Writing $h=gu$ and $g'=ga$ gives the row distance
$$
\frac12\sum_{u\in G}|q(u)-q(a^{-1}u)|,
$$
which proves (M.3.3k.2). Sampling gives $\Pr(gU=h)=q(g^{-1}h)$. For $\mathbb Z_2$, the row difference has total variation $|2p-1|$ and $h_2(p)=h_2(1-p)$.

If the reset register is $U$ and its retained side information is $R$, the complete classical reset contract of Definition 28 gives the mean bath-heat lower bound $k_BT\,H(U|R)$ at a common temperature $T>0$. It equals $k_BT\,h_2(p)$ only on a branch where $H(U|R)=H(U)$. If both $g$ and $gU$ are retained, then $U=g^{-1}(gU)$ and $H(U|g,gU)=0$. Even equal conditional entropy bounds do not establish equal actual heat without an equal-excess or saturation certificate. ∎

**Scoped resolution TV-M-01-R1.** The finite regular-orbit classification and mathematical sampling realization are complete. The binary pair proves kernel nonuniqueness at equal contraction, logical update count and marginal draw entropy. An ND--RID implementation and any equality of physical reset costs retain the complete reset and implementation certificates. The continuous flag-manifold classification is outside this finite result, so TV-M-01 remains live.

**Theorem M.3.3l (Local-Detailed-Balance Realization and Source-Separated Reset Ledger).** Fix smooth $H_k:\Sigma\to\mathbb R$, $\beta,D>0$, and clock duration $\Delta t>0$. Put
$$
V_k=\beta H_k,
\quad
\mathcal L_{k,\beta}=D(\Delta_\Sigma-\beta\langle\nabla H_k,\nabla(\cdot)\rangle),
\quad
d\pi_{k,\beta}=Z^{-1}e^{-\beta H_k}d\mu.
\tag{M.3.3l.1}
$$
Its normalized kernel is reversible and hence, wherever the densities are nonzero,
$$
\pi(ds)p_t(s,ds')=\pi(ds')p_t(s',ds),
\qquad
\log\frac{p_t(s,s')}{p_t(s',s)}=\beta[H_k(s)-H_k(s')].
\tag{M.3.3l.2}
$$
Thus
$$
\Delta E_{\mathrm{persp}}=H_k(s')-H_k(s),
\quad W_{\mathrm{drive}}=0,
\quad Q_\Theta=H_k(s)-H_k(s'),
\quad \Delta E_{\mathrm{persp}}+Q_\Theta=0.
\tag{M.3.3l.3}
$$
The fixed-potential source $\mathsf S_H$ owns $H_k$ but performs no work, and $\Theta$ uniquely owns diffusion heat. Populate a separate degenerate record bit $P$, a trivial retained register $R=r_0$, and the exact pre-reset law
$$
q(P=0,R=r_0)=q(P=1,R=r_0)=\frac12.
\tag{M.3.3l.4}
$$
For a registered $\tau_{\mathrm{reset}}>0$, assume every hypothesis of Definition 28 and an admissible physical realization or justified limiting realization of the reset by a cyclic controller $K_{\mathrm{reset}}$ and work store $\mathsf W_{\mathrm{reset}}$. The logical ready-state map and its conditional heat bound are
$$
\mathscr R_P(X)=|0\rangle\!\langle0|_P\otimes\operatorname{Tr}_P X,
\qquad
Q_{\Theta_{\mathrm{reset}}}\ge k_BT_{\mathrm{reset}}\ln2,
\tag{M.3.3l.5}
$$
with $\Theta_{\mathrm{reset}}$ the unique reset-heat owner and $\mathsf W_{\mathrm{reset}}$ the unique reset-work owner. The controller and bit Hamiltonians return to their initial values. The diffusion owner set $\{\mathsf S_H,\Theta\}$ and reset owner set $\{K_{\mathrm{reset}},\mathsf W_{\mathrm{reset}},\Theta_{\mathrm{reset}}\}$ are disjoint, so relative-entropy decay is not counted again as reset heat.

*Proof.* The weighted-gradient divergence form is self-adjoint in $L^2(\pi_{k,\beta})$, proving detailed balance. Division gives (M.3.3l.2), and the first law for the time-independent Hamiltonian gives (M.3.3l.3). The map $\mathscr R_P$ is CPTP and sends both atoms of the displayed actual law to the ready state. The uniform binary law with trivial retained register has $H_q(P\mid R)=\ln2$. Under the complete Definition-28 contract and the assumed physical or justified limiting realization, the conditional heat bound gives (M.3.3l.5). CPTP normalization alone supplies no bath or auxiliary-resource certificate. ∎

**Resolution TV-M-02-R1 (Metadata).** Exact domain: all smooth time-independent $H_k$ on compact $\Sigma$, all $\beta,D>0$, positive clocks, and the populated uniform binary-reset branch (M.3.3l.4)--(M.3.3l.5) under its complete reset contract. Premises: the reversible diffusion generator and invariant law of Theorem M.3.3l, $V_k=\beta H_k$, a time-independent Hamiltonian source, a positive registered duration, the uniform two-atom bit law, every hypothesis of Definition 28, and an admissible physical or justified limiting realization of the reset. Equivalence: equality of the weighted diffusion kernel, clock, work/heat responses, reset law and complete owner ledger. Budget: every state and time in the compact diffusion, both reset-law atoms, the ready-state map and every diffusion/reset owner row. Verifier: kernel normalization, weighted-generator self-adjointness, first-law signs, both reset-law atoms, CPTP normalization, the complete Definition-28 and implementation/limit certificates, and disjoint owners. Falsifier: failed detailed balance, $V_k\ne\beta H_k$, a missing clock/reset atom or required reset certificate, noncyclic reset hardware, or heat double counting. Provenance class: source-internal diffusion and logical-channel construction with a conditional thermodynamic implication. Downstream consumers: the equilibrium perspective-diffusion ledger, Appendix O's stochastic arrow comparison and `TV-M-02`. Result: `positive-discharge` of the displayed diffusion/clock construction and conditional reset-heat ledger; the physical reset realization or justified limiting realization is required input.

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
If a nonempty positive-weight sharp record subfamily reports the same value $k_0$, $p(k_0)>0$, and each sharp record in that subfamily satisfies $L_r(k_0)=1$, $L_r(k)=0$ for $k\ne k_0$, then $q^*=\delta_{k_0}$. The premise $Z>0$ ensures that the other positive-weight records do not exclude $k_0$. If every positive-weight likelihood is a positive constant on the original support $\{k:p(k)>0\}$, then $q^*=p$. Constancy only on the smaller support left after zero-likelihood exclusions is insufficient.

For a Byzantine finite-record layer, suppose at most $f$ of the $N$ record labels are arbitrary, all nonfaulty record channels report the actualized value $k_0$, and
$$
N>3f.
\tag{M.4a.4}
$$
Then $k_0$ is the unique label with more than $2N/3$ record support. Hence the finite record layer has a unique supermajority consensus value before the likelihood merge (M.4a.3) is applied.

*Proof.* Omit zero-weight records and set
$$
\ell(k)=\prod_{r:w_r>0}L_r(k)^{w_r},
\qquad
S=\{k:p(k)\ell(k)>0\}.
$$
The positive finite normalizer makes $S$ nonempty and $q^*(k)=p(k)\ell(k)/Z$ a probability law supported on $S$. A law with mass outside $S$ has infinite objective under the declared support convention. For every law supported on $S$,
$$
\mathcal J(q)
=\sum_{k\in S}q(k)\log\frac{q(k)}{p(k)\ell(k)}
=D_{\mathrm{KL}}(q\Vert q^*)-\log Z.
$$
The convention $0\log0=0$ covers boundary points. The inequality $-\log x\ge1-x$ gives
$$
D_{\mathrm{KL}}(q\Vert q^*)
\ge 1-\sum_{k:q(k)>0}q^*(k)\ge0.
$$
Equality requires $q(k)=q^*(k)$ on the support of $q$ and no omitted positive mass of $q^*$, hence $q=q^*$. This proves existence and uniqueness throughout the simplex. Positive constant likelihoods on the original support cancel in the normalizer and preserve $p$. A positive-weight sharp record excludes every $k\ne k_0$, while $Z>0$ leaves $k_0$, giving the point mass. Finally, $N-f>2N/3$ records report $k_0$, whereas any incorrect label has at most $f<N/3$ supporters. This proves the unique supermajority assertion. ∎

An observer with high Consciousness Complexity is a high-resource record-integrating subsystem within this theorem. The theorem does not add a separate collapse postulate: the registered instrument supplies the outcome probability and conditional density-operator update, the independent selector supplies the single registered outcome, and consensus is the finite record-merging step that aligns durable records across perspectives.

## M.5 Mathematical Consistency

The finite-dimensional Hilbert spaces, compact homogeneous manifolds, Riemannian operators, and Markov kernels used in this appendix are formalizable in ZFC. Relative consistency of the manuscript's additional physical axioms is a separate statement, which requires an explicit model satisfying those axioms inside a background theory whose consistency is assumed.

## M.6 Perspectival Analysis of Wigner's Friend and Certificate-Scoped Cross-Perspective Imports

The following analysis supplies a branch-consistent semantics for Wigner's-Friend records and proves one exact typing obstruction for cross-perspective imports. It is a conditional interpretive model on the registered instrument branch.

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

At least one assumption must fail within the cited protocol. Its nested reasoning passes from $\bar F$ through $F$ and $\bar W$ to $W$. After $\bar W$ announces $\overline{ok}$, $W$ infers $w=fail$, although the joint event $(\overline{ok},ok)$ has positive Born probability.

### M.6.2 Conditional Record Semantics via Perspectival States

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

**Remark M.6.1: Idealized Isolation.** The Wigner's Friend scenario stipulates idealized isolation of $F$'s laboratory—no decoherence channels connect $F+Q$ to $W$'s environment during the intermediate period. Environmental interactions can suppress local interference and leave records in environmental degrees of freedom [Zurek 2003; Schlosshauer 2007]. Identifying such records with shared PU perspectives additionally requires a record-access map and the certified interaction hypotheses of Definition M.6.2 and Lemma M.6.1; environmental decoherence alone does not establish them. The paradox arises precisely because the gedanken experiment suppresses these channels.

**Lemma M.6.1 (Correlated Perspective Dynamics Under Certified Strong Readout).** Let $W$ and $F$ have perspectives $s_W,s_F\in\Sigma$ and condition on a registered record value $k$. Suppose: (a) the two post-registration noises are conditionally independent given $k$; (b) each one-perspective kernel $G_\lambda(s,\cdot)$ satisfies $G_\lambda(s,\cdot)\Rightarrow\delta_{s_k}$ as $\lambda\to\infty$ for the retained initial states; and (c) on the global contractive branch,
$$
G_\lambda(s,\cdot)=P_{\Delta t,\lambda}^{(k)}(s,\cdot),\quad P_{t,\lambda}^{(k)}=e^{t\mathcal L_{\Sigma,\lambda}^{(k)}},\quad \mathcal L_{\Sigma,\lambda}^{(k)}=\Delta_\Sigma-\langle\nabla V_{k,\lambda},\nabla(\cdot)\rangle,
$$
and one common $\kappa_{\mathrm{eff}}$ satisfies $\operatorname{Ric}_\Sigma+\operatorname{Hess}_\Sigma V_{k,\lambda}\succeq\kappa_{\mathrm{eff}}g_\Sigma$ globally for every retained $\lambda$. Alternatively, a separately defined stopped or reflected product process may be used only when its accepted boundary-condition record directly verifies the same Wasserstein estimate below. Then
$$
G_{\mathrm{persp}}^{(WF)}((s'_W,s'_F)\mid(s_W,s_F),k,N,\Delta t)=G_\lambda(s_W,ds'_W)G_\lambda(s_F,ds'_F),\tag{M.12}
$$
the joint strong-readout law converges weakly to $\delta_{(s_k,s_k)}$, and, with product metric,
$$W_2(\mu^{(WF)}G^{(WF)},\nu^{(WF)}G^{(WF)})\le e^{-\kappa_{\mathrm{eff}}\Delta t}W_2(\mu^{(WF)},\nu^{(WF)}).\tag{M.13}$$

*Proof.* Conditional independence gives the product kernel (M.12). If $\varphi$ is bounded and continuous on $\Sigma^2$, product weak convergence gives
$$
\int\varphi(s'_W,s'_F)\,G_\lambda(s_W,ds'_W)G_\lambda(s_F,ds'_F)
\longrightarrow
\varphi(s_k,s_k),
$$
which is precisely convergence to $\delta_{(s_k,s_k)}$. On the global diffusion branch, the product kernel is the time-$\Delta t$ semigroup of the product generator with potential
$$
V_{k,\lambda}^{(WF)}(x,y)=V_{k,\lambda}(x)+V_{k,\lambda}(y).
$$
Its Bakry--Émery tensor is
$$
\operatorname{Ric}_{\Sigma^2}+\operatorname{Hess}_{\Sigma^2}V_{k,\lambda}^{(WF)}=(\operatorname{Ric}_\Sigma+\operatorname{Hess}_\Sigma V_{k,\lambda})\oplus(\operatorname{Ric}_\Sigma+\operatorname{Hess}_\Sigma V_{k,\lambda})\succeq\kappa_{\mathrm{eff}}g_{\Sigma^2}.
$$
The Bakry--Émery Wasserstein contraction theorem gives (M.13). On the stopped/reflected alternative, (M.13) is exactly the independently verified product-process certificate required in clause (c). ∎

**Theorem M.6.1 (Conditional Same-Basis Record Consistency for Wigner--Friend Readout).** Work on a branch carrying an accepted normalized instrument, a certified Born selector on its retained effects, a registered single-outcome rule, and the declared perspective-indexed record semantics. Let $F$ and $W$ have initial perspectives $s_F,s_W\in\Sigma$. Suppose that at time $t_1$ a registered `Evolve` instrument event on $F+Q$ registers value $k$ for $F$ and updates its perspective to $s'_F$. Assume that at a later time $t_2>t_1$, $W$ performs a record-reading interaction on $F+Q$ in the same outcome basis and that the resulting joint kernel satisfies every strong-readout hypothesis of Lemma M.6.1. Then:

(i) For $t_1<t<t_2$, the declared semantics assigns the registered record proposition $k$ to $s'_F$; the event at $t_1$ alone forces no corresponding record proposition for $s_W$.

(ii) After the readout at $t_2$, the joint post-interaction perspective law on $\Sigma_W\times\Sigma_F$ is driven toward configurations encoding the same record value $k$; in the ideal strong-readout limit it converges weakly to the common $k$-flag configuration.

Thus the differently indexed pre-readout record propositions and the later correlated record proposition are jointly satisfiable within the declared semantics. The theorem neither selects that semantics as a unique ontology nor resolves protocols outside its same-basis strong-readout class.

*Proof.*

**Part (i).** By the theorem's accepted instrument, Born-selector, and single-outcome hypotheses, the event at $t_1$ registers $k$ for the participating $F+Q$ record and conditions the perspective transition
$$
s_F\to s'_F.
$$
Because no registered readout by $W$ occurs during $(t_1,t_2)$, the event at $t_1$ forces no corresponding $s_W$-indexed record. Hence the semantics assigns $k$ to $s'_F$ without assigning it to $s_W$.

**Part (ii).** Conditioned on $k$, Lemma M.6.1 supplies the joint kernel whose strong-readout limit is concentrated on configurations encoding $k$ for both records. Therefore the later same-basis readout correlates the two registered records and converges in the ideal limit to the common $k$-flag configuration.

The pre-readout propositions carry different perspective indices, and the post-readout proposition follows from a later certified correlation. They are therefore jointly satisfiable in the declared typed calculus. No claim about a unique outcome ontology or a protocol outside the theorem's hypotheses is used. ∎

**Theorem M.6.1a (Explicit Uniformly Contractive Same-Basis Readout).** Let $\{P_k\}_{k=1}^m$ be orthogonal projectors summing to the identity and let
$$
\mathcal I_k(\rho)=P_k\rho P_k
\tag{M.6.1a.1}
$$
be the Lüders outcome maps. They form a normalized CP instrument. Fix complete flags $s_k\in\Sigma$ carrying the corresponding record labels. For $0\le r_\lambda<1$, define
$$
G_{\lambda,k}(s,B)
=(1-r_\lambda)\mathbf1_B(s_k)+r_\lambda\mathbf1_B(s).
\tag{M.6.1a.2}
$$
Then $G_{\lambda,k}$ is normalized and, for all probability laws $\mu,\nu$,
$$
W_2(\mu G_{\lambda,k},\nu G_{\lambda,k})
\le\sqrt{r_\lambda}\,W_2(\mu,\nu).
\tag{M.6.1a.3}
$$
If $r_\lambda\to0$, the convergence to $\delta_{s_k}$ is uniform in the initial perspective. Two conditionally independent receivers using (M.6.1a.2) obey
$$
\Pr(S_W'=S_F'=s_k\mid k)\ge(1-r_\lambda)^2,
\qquad
\Pr((S_W',S_F')\ne(s_k,s_k)\mid k)\le2r_\lambda-r_\lambda^2.
\tag{M.6.1a.4}
$$
Thus persistent same-basis disagreement is excluded in the strong-readout limit.

*Proof.* Complete positivity is immediate and $\sum_k\operatorname{Tr}(P_k\rho P_k)=\operatorname{Tr}\rho$. Couple the common mass $1-r_\lambda$ at $s_k$ identically and use an optimal coupling of $\mu,\nu$ on the residual mass. Its squared transport cost is at most $r_\lambda W_2(\mu,\nu)^2$, proving (M.6.1a.3). Independence gives (M.6.1a.4). ∎

**Resolution TV-M-03-R1 (Metadata).** Exact domain: every finite same-basis projective readout, every initial perspective pair and every $0\le r_\lambda<1$. Premises: a finite normalized PVM, normalized initial perspective laws and the displayed readout/reset parameter. Equivalence: simultaneous outcome relabeling preserving the projective instrument and equality of the induced perspective endpoint laws. Budget: all outcomes, initial states and receiver pairs. Verifier: Kraus completeness, kernel mass one, the explicit coupling and both bounds in (M.6.1a.4). Falsifier: failed normalization, contraction larger than $\sqrt{r_\lambda}$, or disagreement bounded away from zero as $r_\lambda\to0$. Provenance class: source-internal constructive kernel. Downstream consumers: the G9CC-modulated perspective instrument, the strong-readout ledger and `TV-M-03`. Result: `positive-discharge` of the registered instrument, uniform contraction and quantified-consensus predicates.

### M.6.3 Worked Example: Explicit Perspective Tracking

**Example M.6.1 (Same-Basis Wigner--Friend Record Tracking).** Assume the instrument, Born-selector, single-outcome, external-state-assignment, and strong same-basis readout hypotheses of Theorem M.6.1 and Lemma M.6.1. Let $Q$ begin in $|\psi\rangle=(|0\rangle+|1\rangle)/\sqrt2$, and consider the registered run with $F$-record $k=0$.

**Phase 1: $F$ registers $Q$ at $t_1$.**

- Before the interaction, the declared $F$-indexed state is $S_{(s_F^{(0)})}(t_1^-)=(|\psi\rangle,s_F^{(0)})$.
- The accepted instrument registers $k=0$ with probability $1/2$ on this ideal branch and conditions the perspective transition.
- After registration, $S_{(s_F^{(1)})}(t_1^+)=(|0\rangle,s_F^{(1)})$, where $s_F^{(1)}\sim G_{\mathrm{persp}}(\cdot\mid s_F^{(0)},0,N_{FQ},\Delta t)$.

**Phase 2: $t_1<t<t_2$.**

- The retained $F$-indexed ledger contains the definite record $k=0$.
- No $W$-indexed record has yet been registered. If the accepted external unitary representation is used, $W$ assigns $|\Psi\rangle_{FQ}=(|F_0\rangle|0\rangle+|F_1\rangle|1\rangle)/\sqrt2$.
- These statements are jointly satisfiable in the declared typed calculus because one is an $F$-indexed record proposition and the other is a $W$-indexed pre-readout state assignment.

**Phase 3: $W$ performs the certified same-basis record readout at $t_2$.**

- The interaction is the same-record-basis readout required by Theorem M.6.1, with the joint-kernel hypotheses of Lemma M.6.1.
- The joint kernel $G_{\mathrm{persp}}^{(WF)}$ correlates the $W$ and $F$ record flags.
- In the ideal strong-readout limit, the post-interaction law is supported on configurations for which both retained flags equal $0$.

Thus the example proves conditional same-basis record consistency. External superposition-basis measurements are treated by the import obstruction of Section M.6.4.

### M.6.4 Certificate-Scoped Frauchiger--Renner Import Obstruction

The Frauchiger-Renner (FR) scenario involves four agents ($F$, $\bar{F}$, $W$, $\bar{W}$) and a chain of reasoning that derives a contradiction. The PU framework identifies the precise point of failure.

**The FR Reasoning Chain.** In the FR scenario:

1. $\bar{F}$ measures a coin and prepares a qubit accordingly
2. $F$ measures the qubit
3. $\bar{W}$ measures $\bar{F}$'s laboratory in a superposition basis and announces the result
4. $W$ measures $F$'s laboratory in a superposition basis

When $\bar W$ announces $\overline{ok}$, the nested certainty rule leads $W$ to predict $fail$, while the joint Born law permits $(\overline{ok},ok)$.

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
is proposed for import as a definite proposition at a distinct perspective $s_{\bar W}^{(\mathrm{pre})}\ne s_W^{(\mathrm{post})}$. Assume that the proposed import has neither (a) a record-sharing certificate supplied by an Evolve interaction or another registered channel nor (b) a perspective-invariance certificate in the sense of Definition M.6.2. Then the import is not well typed in the retained perspectival inference calculus.

*Proof.* The proposition $\phi_{s_W^{(\mathrm{post})}}$ asserts an actualized record and is indexed to $s_W^{(\mathrm{post})}$. Definition M.6.2 declares that an import of such a record to a distinct perspective is admitted only by a record-sharing certificate or a perspective-invariance certificate. The two hypotheses exclude those two generating rules. Hence no rule of the retained calculus types the proposed import at $s_{\bar W}^{(\mathrm{pre})}$. This proves the stated obstruction; Theorem M.6.2c applies it to both certainty routes of the complete four-laboratory protocol. ∎

**Theorem M.6.2c (Complete Typed Certainty Graph of the Four-Laboratory FR Protocol).** Use the standard unitary laboratory state after the two friends have registered their records,
$$
|\Psi\rangle
=
\frac1{\sqrt3}
\bigl(
|\bar h\rangle|d\rangle
+|\bar t\rangle|d\rangle
+|\bar t\rangle|u\rangle
\bigr),
\tag{M.6.2c.1}
$$
and the superobserver bases
$$
|\overline{ok}\rangle=\frac{|\bar h\rangle-|\bar t\rangle}{\sqrt2},
\quad
|\overline{fail}\rangle=\frac{|\bar h\rangle+|\bar t\rangle}{\sqrt2},
$$
$$
|ok\rangle=\frac{|d\rangle-|u\rangle}{\sqrt2},
\quad
|fail\rangle=\frac{|d\rangle+|u\rangle}{\sqrt2}.
\tag{M.6.2c.2}
$$
Among the eight elementary record propositions
$$
\bar F{:}\bar h,\ \bar F{:}\bar t,\ F{:}d,\ F{:}u,
\ \bar W{:}\overline{ok},\ \bar W{:}\overline{fail},\ W{:}ok,\ W{:}fail,
$$
the complete nontrivial probability-one implication graph obtained by conditioning (M.6.2c.1) in the registered measurement bases is
$$
\bar h\to d,
\quad d\to\overline{fail},
\quad\overline{ok}\to u,
\quad u\to\bar t,
\quad\bar t\to fail,
\quad ok\to\bar h.
\tag{M.6.2c.3}
$$
Moreover,
$$
\Pr(\bar W{:}\overline{ok},W{:}ok)
=
|\langle\overline{ok},ok|\Psi\rangle|^2
=
\frac1{12}.
\tag{M.6.2c.4}
$$
There are exactly two directed certainty routes from this positive-probability event to a complementary record: 
$$
\overline{ok}\to u\to\bar t\to fail
\quad\text{and}\quad
ok\to\bar h\to d\to\overline{fail}.
\tag{M.6.2c.5}
$$
Every edge in both routes changes the record owner. For the typed obstruction, additionally assume that each such edge connects distinct registered perspective indices for its source and target propositions. Under this premise, each route contains three cross-perspective imports governed by Definition M.6.2. If no record-sharing or perspective-invariance certificate is supplied for those imports, neither route is well typed and the contradiction cannot be derived through them in the retained calculus. A change of owner label alone does not establish inequality of the perspective indices. Conversely, a well-typed contradiction for this protocol that uses only exact probability-one record implications and avoids both routes would falsify the graph exhaustion.

*Proof.* Direct projection gives
$$
\langle\overline{ok}|\Psi\rangle=-\frac{|u\rangle}{\sqrt6},
\qquad
\langle ok|\Psi\rangle=\frac{|\bar h\rangle}{\sqrt6},
\tag{M.6.2c.6}
$$
which gives the third and sixth edges in (M.6.2c.3). The absent $|\bar h\rangle|u\rangle$ amplitude gives $u\to\bar t$ and $\bar h\to d$. Conditional on $\bar t$, the second laboratory is $(|d\rangle+|u\rangle)/\sqrt2=|fail\rangle$, while conditional on $d$ the first laboratory is $(|\bar h\rangle+|\bar t\rangle)/\sqrt2=|\overline{fail}\rangle$. These give the remaining two edges. Conditioning on each complementary source $\overline{fail}$ or $fail$ leaves nonzero support on both record alternatives, and the preceding six cases exhaust the eight possible sources; hence (M.6.2c.3) is the complete nontrivial certainty graph. Expanding (M.6.2c.1) in (M.6.2c.2) gives amplitude $1/(2\sqrt3)$ for $(\overline{ok},ok)$, proving (M.6.2c.4). Inspection of the six-edge graph gives exactly the two paths (M.6.2c.5). Their owner labels alternate at every edge, so Lemma M.6.2a applies to every traversal. ∎

**Resolution TV-M-04-R1.** In the already declared perspective-indexed inference semantics, Equations (M.6.2c.1)--(M.6.2c.6) give `positive-discharge` of the complete four-laboratory state, outcome probability, certainty-graph enumeration, import-route exhaustion, and typed obstruction.

**Remark M.6.2.** The PU resolution does not reject any of (Q), (S), (C) outright. Rather, it refines (C): reasoning about others' observations is valid, but only when the perspective context is properly specified. Cross-perspective reasoning requires either explicit interaction (which correlates perspectives) or careful restriction to statements that are perspective-invariant.

### M.6.4a Composable Tolerance Budgets for Certificate-Scoped Imports

**Definition M.6.2d (Registered Tolerance Maps).** A tolerance map is a monotone function $f:[0,\infty]\to[0,\infty]$ with $f(u)\ge u$. A certified unary inference carrying $f$ turns a premise uncertainty bound $u$ into the conclusion bound $f(u)$ in the same registered units. Exact local inferences and perspective-invariance certificates carry identity; record-sharing certificates carry their registered channel bounds. The constant $\top(u)=\infty$ records an unbounded tolerance. In derivation order,
$$
f\triangleright g=g\circ f,\qquad
\langle A_1,c_1\rangle\triangleright\langle A_2,c_2\rangle
=\langle A_1A_2,c_1A_2+c_2\rangle,
\tag{M.6.2d.1}
$$
where $\langle A,c\rangle(u)=Au+c$, $A\ge1$, $c\ge0$.

**Lemma M.6.2e (Composition on Unary Derivations).** The ordered composition $w_\pi$ of the maps along a well-typed unary path $\pi$ bounds its conclusion uncertainty. Composition is associative, has identity, and an inserted inference cannot decrease the bound. Every cross-perspective link carries the certificate required by Lemma M.6.2a. Multi-premise inferences require a monotone bound on their full tuple of premise uncertainties, or a registered scalar reduction including every side premise.

*Proof.* Induction on path length applies each link certificate to the preceding bound. Associativity and identity are those of function composition. For a prefix $p$, inserted inflationary map $c$, and monotone suffix $q$, $q(c(p(u)))\ge q(p(u))$. The import normal form supplies each cross-perspective certificate. ∎

**Definition M.6.2f (Closed Tolerance).** On a finite directed graph of records with finitely many registered unary rule instances, put
$$
D_{xy}(u)=\inf_{\pi:x\to y}w_\pi(u),
$$
with value $\infty$ when no path exists.

**Proposition M.6.2g (Pointwise Attainment and Triangle Law).** Every finite value is attained at each fixed $u$ by a path without repeated records. Moreover $D_{xx}(u)=u$ and
$$
D_{xz}(u)\le D_{yz}(D_{xy}(u)).
$$
For translations, $d(x,y)=D_{xy}(0)$ is a directed extended distance. If every valid link carries identity, $D_{xy}=\mathrm{id}$ exactly when $y$ is derivable from $x$; otherwise it is $\top$.

*Proof.* Delete cycles using Lemma M.6.2e's prefix-cycle-suffix inequality. A finite graph has finitely many simple paths, so their pointwise minimum is attained. The empty path and inflationarity give identity. Concatenate a path minimizing at $u$ with one minimizing at the resulting intermediate bound to obtain the triangle law. Translations compose by addition. Identity-labelled paths have identity weight, proving the final claim. ∎

A minimizing path can depend on $u$: the paths with weights $u+10$ and $2u$ exchange optimality at $u=10$. A well-typed path containing $\top$ remains derivable and carries an unbounded budget.

**Corollary M.6.2h (Certified Acceptance Horizon).** For an affine path of $N$ links,
$$
w_\pi(u_0)=u_0\prod_kA_k+\sum_kc_k\prod_{j>k}A_j.
$$
If $A_k\le e^{\lambda\tau_k}$, $c_k\le\delta$, $\lambda\ge0$, $\tau_k\ge0$, and $T=\sum_k\tau_k$, then
$$
w_\pi(u_0)\le e^{\lambda T}(u_0+N\delta).
$$
Put $v=u_0+N\delta$. For finite $u_0,\delta,T$ and a finite budget $B\ge0$, the condition $e^{\lambda T}v\le B$ suffices for acceptance. If $\lambda>0$, $v>0$ and $B>0$, it is equivalent to
$$
T\le\lambda^{-1}\ln\frac{B}{v}.
\tag{M.6.2h.1}
$$
Since $T\ge0$, this branch has an admissible duration only if $B\ge v$. If $B=0<v$, no nonnegative duration meets the sufficient criterion. If $v=0$, the upper bound is zero for every finite $T$, including at $B=0$. If $\lambda=0$, the criterion is $v\le B$. An infinite budget imposes no restriction on these finite upper bounds.

A necessary bound uses the different lower-amplification premise $\prod_kA_k\ge e^{\lambda T}$ with $u_0,\lambda>0$. Acceptance under a finite budget first implies $B\ge u_0>0$, and then
$$
T\le\lambda^{-1}\ln(B/u_0).
$$

*Proof.* Repeated affine composition gives the exact path formula. Nonnegativity of the durations and coefficients bounds every product in it by $e^{\lambda T}$, yielding the upper estimate. For positive $v,B,\lambda$, division and the increasing logarithm give (M.6.2h.1); the listed zero cases follow directly without logarithms. For the necessary bound, discard the nonnegative additive terms to obtain $B\ge w_\pi(u_0)\ge u_0e^{\lambda T}\ge u_0$, and then take the logarithm of positive quantities. ∎

**Remark M.6.2i (Orbit-Averaging Handoff Test).** A classical comparison can register a finite three-body trajectory, a fine integrator, an orbit-averaged surrogate, a fast-phase uncertainty at handoff, and certified tolerance maps for every transition. Compare uninterrupted fine integration, immediate averaging, and delayed averaging at the same terminal observables and cost. Report the composed bound, measured error, and actual budget decisions. This tests whether the lost phase and subsequent amplification explain an order effect. Application to an Evolve channel uses that channel's own tolerance certificate.

**Perspective Occupancy and Record Import.** Thesis P.2.3.1 describes the realized registration at a perspective as its occupancy. In the Wigner–friend setting, the friend's record event occurs at the friend's perspective; Wigner's later access is a separate readout with the interaction certificate of Definition M.6.2. The occupancy interpretation and the composable import budgets answer complementary questions: what is registered at each perspective, and what another perspective can infer with a specified tolerance. The import calculus derives its conclusions from the stated record-sharing certificates.

### M.6.5 Distinction from Relational Quantum Mechanics

The PU resolution bears surface similarity to Rovelli's Relational Quantum Mechanics (RQM) [Rovelli 1996], which also holds that quantum states are relative to observers. However, fundamental differences exist:

| Aspect | Relational QM | PU Framework |
|--------|---------------|--------------|
| **Ontological status** | Relative quantum information; reconstruction programme | Declared branch structure; physical perspectives require the registered perspective-space, instrument, and realization certificates |
| **Grounding** | Equivalent physical systems, quantum completeness, and information postulates | Conditional on SPAP together with the retained Hilbert/Born, update, and perspective records; a registered physical reset is a separate branch with $\varepsilon_{\mathrm{reset}}=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}\ge H_q(P\mid R)$ |
| **Why relational?** | Observer-dependent measurement descriptions | SPAP motivates perspective indexing on the declared response branch; Corollary 26 identifies the quantum perspective space on the ordered rank-one context branch |
| **Mathematical structure** | Quantum questions and Hilbert spaces; no PU perspective manifold | Perspective Space $\Sigma \cong U(d_0)/U(1)^{d_0}$ with Riemannian structure (Definition 25, Theorem 25) |
| **Dynamics** | Hamiltonian evolution and measurement interactions; no PU drift-diffusion kernel | Explicit drift-diffusion realization of $G_{\text{persp}}$ on $\Sigma$ (Equations M.5a–b) |
| **Consistency criterion** | Quantitative correlations under stated measurement dynamics | Bakry-Émery control yields $W_2$-contractive convergence for the constructed class (Equation M.5c) |
| **Origin of probability** | Reconstruction uses an additional superposition postulate | On the accepted carrier branch, Principle 11b fixes the invariant response ledger, Principle 8.0b and $\mathfrak C_{\mathrm{car}}$ fix the complex carrier, Theorem 8.2 and Lemma 8.2a give quotienting and retained additivity, and Definition 8.2b plus Theorem 8.3 give the unique trace representation on the accepted full-domain or finite informationally complete positive-reconstruction route; Principle 8.0c separately supplies irreducible registered single outcomes |
| **Temporal structure** | Time-indexed questions and unitary evolution | Directed order is required by Theorem 4; a thermodynamic arrow follows only on the independently certified Appendix O branch |

**Remark M.6.3: RQM Comparison.** Rovelli's relational formulation and PU use distinct additional premises. Corollary 1 excludes a uniformly exact predictor on its diagonal-closed model class; Definition 24 and the declared quantum branch supply PU's perspective-indexed representation and this appendix's dynamics.

### M.6.6 Toward Completing the Relativistic Program

The conditional same-basis record-consistency construction admits a structural comparison with Einstein's operational treatment of simultaneity.

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
| Spacetime interval $ds^2$ invariant | Born trace weight $\operatorname{Tr}(\rho E)$ unchanged for a common state and effect, or under their simultaneous unitary transport; varying the measurement alone need not preserve it |
| Light postulate + relativity principle | POP + PCE + SPAP |

**Structural Correspondence M.6.4 (Relativistic Parallel).** The logical structure of perspectival quantum mechanics stands to the measurement problem as special relativity stands to pre-relativistic simultaneity. In both cases:

(i) An apparently absolute quantity (simultaneity / outcome definiteness) is revealed to be relative to a reference context (frame / perspective).

(ii) Each relativization is branch-relative. Frame-relative simultaneity uses an accepted Lorentzian characteristic-cone branch; perspective-relative actuality uses the retained SPAP, Hilbert/Born, update, and perspective records. A registered reset, a full-state refresh channel, and a Lorentzian cone are independent additional gates.

(iii) On the nominated Hypothesis 1 branch, one registered MPU network supplies the common substrate, an ontological identification made by Hypothesis 1.

(iv) Lorentz transformations govern frame changes on the Lorentzian branch. A perspective kernel yields record consistency only on the certified strong-readout branch of Lemma M.6.1.

*Justification.* The comparison uses the following branch-relative correspondences:
$$
\begin{aligned}
\text{Reference frame}
&\longleftrightarrow \text{Perspective }s\in\Sigma,\\
\text{Lorentz transformation}
&\longleftrightarrow \text{Perspective transition kernel }G_{\mathrm{persp}},\\
\text{Spacetime interval }ds^2
&\longleftrightarrow \text{Born trace weight of a common or covariantly transported test},\\
\text{Lorentzian characteristic cone on the accepted Appendix O branch}
&\longleftrightarrow \text{perspective-update consistency on the retained quantum branch}.
\end{aligned}
$$
For a density operator $\rho$, an effect $0\le E\le I$ and a unitary $U$,
$$
\operatorname{Tr}\!\left[(U\rho U^\dagger)(UEU^\dagger)\right]
=\operatorname{Tr}(U\rho E U^\dagger)
=\operatorname{Tr}(\rho E).
$$
For a pure state and rank-one effect this trace is $|\langle k|\psi\rangle|^2$. No invariance under changing the effect alone follows.

Frame-relative simultaneity uses the accepted Lorentzian characteristic-cone branch, whose spacing, clock, serialization, frontier-attainment and Lorentzian-promotion data are independent of SPAP. Perspective-relative actuality uses SPAP together with the retained Hilbert/Born, update and perspective records; a registered thermodynamic reset is a separate gate. Thus neither relativization is derived here from a common SPAP/reset premise. ∎

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

The separately declared full-state refresh decomposition bounds the unassisted classical capacity of independent memoryless uses of $\mathcal E_N$. The input and output dimensions are $d_0>1$. Codes may use entangled block inputs and collective decoding, but have no preshared entanglement, message-bearing side channel or feedback resource outside this channel class. Let
$$
\mathcal E_N=(1-p)\Psi+pT_\sigma,
\qquad 0<p\le1,
$$
with $\Psi$ CPTP and $T_\sigma(\rho)=\sigma\operatorname{Tr}\rho$ for a density operator $\sigma$. Define the flagged channel
$$
\widetilde{\mathcal E}_N(\rho)
=(1-p)\Psi(\rho)\otimes|0\rangle\langle0|
+p\sigma\operatorname{Tr}\rho\otimes|1\rangle\langle1|.
$$
Discarding the flag recovers $\mathcal E_N$, so any code for $\mathcal E_N$ is also a code for the flagged channel.

*Proof.* Let $M$ be the classical message of an $n$-use code and let $B^n$ denote its quantum output. The iid flag sequence $F^n$ is independent of $M$. For a positive-probability flag pattern $f$ with $k(f)$ refreshes, the refreshed output factors are copies of $\sigma$, independent of the message and of the remaining factors. The remaining system has dimension $d_0^{\,n-k(f)}$, even when the block input is entangled. Its classical-quantum mutual information is its Holevo quantity and is bounded by its entropy, hence
$$
I(M;B^n\mid F^n=f)\le[n-k(f)]\ln d_0.
$$
Averaging this conditional bound, using $I(M;F^n)=0$ and $\mathbb E k(F^n)=np$, gives
$$
I(M;B^nF^n)
=\sum_f\Pr(F^n=f)I(M;B^n\mid F^n=f)
\le n(1-p)\ln d_0.
$$
For a uniform message set of size $m_n\ge2$ and a decoded message with error probability $\varepsilon_n$, data processing and the finite-message Fano inequality give
$$
(1-\varepsilon_n)\ln m_n
\le n(1-p)\ln d_0+h_2(\varepsilon_n).
$$
Here Fano follows by adjoining the error indicator: its entropy is at most $h_2(\varepsilon_n)$, and on an error there are at most $m_n-1$ possible messages. Along every code sequence with $\varepsilon_n\to0$, division by $n$ bounds the achievable rate by $(1-p)\ln d_0$. Therefore
$$
C(\mathcal E_N)\le C(\widetilde{\mathcal E}_N)
\le(1-p)\ln d_0<\ln d_0.
$$
For $p=1$ the output is constant and the capacity is zero. The capacity resource class is the unassisted memoryless branch of Theorem E.2. ∎

**4. Branch-II Registered Operational Timescale (Theorem 29).** Theorem 29 assumes an internal Hamiltonian and a registered cycle rate, and calibrates the mean excitation energy to the baseline power. Its cycle duration is supplied by that rate; it does not prove a universal positive minimum duration for every distinguishable transition. For an orthogonalization generated by a Hamiltonian with mean excitation $E>0$ and spectral width $\Delta_H$, the Margolus–Levitin bound gives
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

**1. No Primitive Heisenberg Cut on the Registered Instrument Branch.** On the separately assumed Hilbert/instrument/Born and actualization branch, a registered verification/update event is represented by the `Evolve` instrument of Definition 27 and Proposition 9. The same representation can be used across the qualifying implementations without inserting a size- or consciousness-based cut.

**2. Homogeneous Carrier Geometry and Registered Interaction Data.** The quotient perspective space assigns the same formal type to every $s\in\Sigma$, and the $U(d_0)$ action on this carrier is transitive. A registered interaction can nevertheless select a target $s_k$, potential $V_k$ and transition kernel, so equal formal type does not make that interaction invariant. Covariance requires simultaneous transport of all such data: for a group action $a$, a measurable set $A$ and registered data $\mathcal D$, the kernel must satisfy $K_{a\mathcal D}(as,aA)=K_{\mathcal D}(s,A)$. Invariance of one interaction is the stronger special case in which its data are preserved. These statements do not exclude an absolute or response-equivalent latent ontology.

**3. Certificate-Scoped Extended Wigner's-Friend Imports.** Definition M.6.2 requires a record-sharing or perspective-invariance certificate for an actualized record imported across distinct perspectives, and Lemma M.6.2a gives the corresponding import normal form. Theorem M.6.2b proves that the displayed Frauchiger–Renner-style import is ill typed when neither certificate exists. Any extended Wigner's-Friend argument containing an import that satisfies those hypotheses is blocked at that import, and Theorem M.6.2c shows that both certainty routes of the complete four-laboratory Frauchiger–Renner protocol pass through three such cross-perspective imports each when their edges connect distinct perspective indices.

**4. Registered laboratory branch.** With the standard instrument and Born selector supplied as premises, the perspectival kernel preserves the registered laboratory outcome law by construction while adding a conditional perspective record. Any CC-dependent deviation requires the separate G9CC realization certificate.

**5. Perspective-Indexed Account of the "Absoluteness" Debate.** Within the declared perspectival semantics, outcome propositions are objective only after their registered perspective is specified.

### M.6.8 Certificate-Gated Interface to Consciousness Complexity

Dependence of $G_{\mathrm{persp}}(s'|s,k,N,\Delta t)$ on the registered context $N$ supplies a typed interface at which a separately constructed physical control may enter. A physical CC branch must supply:

1. a causal map from an aggregate state to a realizable control $N$;
2. one normalized instrument family on which that control changes a registered outcome law, or a theorem that every admissible change is zero;
3. a forward-locked signed effect interval, with exact/hard-support or statistical status, separated from source leakage and artifacts;
4. complete source-energy, reset, and no-double-counting ledgers; and
5. pre-lightcone marginal invariance, or explicit classification of a response-active marginal as the external branch-(iii) falsifier of the sealed causal branch.

**Theorem M.6.8a (G9CC-Modulated Contractive Perspective Instrument).** Consume the complete finite witness of Theorem L.12.8b and write
$$
p_c(1)=c\sin^2(g\tau_{\mathrm{int}}),
\qquad p_c(0)=1-p_c(1).
\tag{M.6.8a.1}
$$
For context-dependent $0\le r_{c,\lambda}<1$, define the conditional perspective kernels and joint outcome-perspective instrument
$$
G_{c,\lambda,m}(s,B)
=(1-r_{c,\lambda})\mathbf1_B(s_m)+r_{c,\lambda}\mathbf1_B(s),
\qquad
\mathcal J_{c,\lambda}(m,B\mid s)
=p_c(m)G_{c,\lambda,m}(s,B).
\tag{M.6.8a.2}
$$
For every $c,s$, $\sum_m\mathcal J_{c,\lambda}(m,\Sigma\mid s)=1$. Conditional on $m$, its Wasserstein contraction coefficient is at most $\sqrt{r_{c,\lambda}}$; two independent readers have disagreement bound $2r_{c,\lambda}-r_{c,\lambda}^2$. If $\max_c r_{c,\lambda}\to0$, both contexts converge uniformly to the appropriate strong-readout flag. Nevertheless the locked intervention response remains
$$
\Pr(M=1\mid\operatorname{do}(C=1))
-\Pr(M=1\mid\operatorname{do}(C=0))
=\sin^2(g\tau_{\mathrm{int}})>0.
\tag{M.6.8a.3}
$$
All source, carrier, energy, reset, timing and locality owners are exactly those of Theorem L.12.8b; (M.6.8a.2) adds no duplicate physical owner.

*Proof.* Equation (M.6.8a.1) is the normalized CP-instrument law already proved in Theorem L.12.8b. Kernel normalization proves joint normalization. The coupling and product-law arguments of Theorem M.6.1a give contraction and consensus uniformly in $c$. Summing (M.6.8a.2) over the perspective endpoint recovers $p_c(m)$, proving (M.6.8a.3). ∎

**Resolution TV-M-07-R1 (Metadata).** Exact domain: both accepted G9CC contexts/outcomes and all initial perspectives for the family (M.6.8a.2). Premises: Theorem L.12.8b and $\max_cr_{c,\lambda}\to0$. Equivalence: unitary equivalence of the accepted finite G9CC carrier together with equality of the conditional perspective kernel and locked intervention response. Budget: both contexts, both target outcomes, every perspective endpoint, every initial perspective pair and the full strong-readout limit family. Verifier: joint mass one, the explicit coupling, product disagreement bound and (M.6.8a.3). Falsifier: lost normalization, noncontractive conditional kernels, failed strong readout or a nonpositive locked response. Provenance class: source-internal consumption of the accepted finite physical witness. Downstream consumers: the finite CC/perspective coexistence construction, the perspective-instrument ledger and `TV-M-07`. Result: `positive-discharge` of the registered G9CC perspective-instrument modulation. This consumes but is not recovered by `TV-L-07`, whose theorem contains no perspective kernel.

Theorems 39, 39a, and 51 constrain a nominated response after it exists, and Theorem L.12.8b supplies the accepted finite carrier and instrument used in Theorem M.6.8a.

### M.6.9 Synthesis

Quantum facts in this model are indexed to the perspective that records them, much as simultaneity is indexed to a frame. Consistency between perspectives depends on shared records and compatible readout dynamics.

**Technical ledger.**

The perspectival construction is a conditional semantics for registered quantum records. It establishes typed consistency on its accepted instrument and readout branches.

The key elements of the construction are:

1. **Complete operational state specification** includes both the density operator and the registered perspective: $S_{(s)}(t)=(\rho(t),s)$.

2. **Registered outcomes are perspective-indexed**: on the accepted instrument, Born-selector, and single-outcome branch, an outcome record is indexed to the perspective participating in the registered `Evolve` event

3. **Certified readout kernels correlate perspectives**: under every hypothesis of Lemma M.6.1, the joint strong-readout law converges to a common outcome flag; normalization alone does not imply consistency.

4. **Cross-perspective reasoning is certificate-governed**: Definition M.6.2 permits an actualized-record import across distinct perspectives only through a record-sharing or perspective-invariance certificate, and Lemma M.6.2a gives the corresponding normal form.

5. **The perspectival model is branch-conditional**: the perspective space, actualization instrument, and transition kernel are supplied by the retained Hilbert/Born and perspectival branch.

6. **The formalism exposes a conditional empirical interface**: The interaction context $N$ in $G_{\text{persp}}$ is a declared model variable. A CC-induced outcome shift requires the independent context-control, response, and physical-channel certificates used by the experimental predictions.

This provides a branch-indexed extension of the relativistic program for quantum mechanics: within the declared perspectival semantics, outcome propositions are indexed by perspective just as simultaneity statements are indexed by frame. On the Hypothesis 1 branch, the MPU network is the common physical substrate, while the specific Hilbert, actualization, transition-kernel, and consistency structures retain their stated branch hypotheses.

The same perspectival machinery supplies a mathematical interface for the CC hypothesis only after the independent context-modulation and response certificates are supplied. Theorem M.6.2b proves the certificate-absence obstruction for a displayed cross-perspective import, and Theorem M.6.2c applies it to both certainty routes of the complete four-laboratory Frauchiger–Renner protocol.

### M.6.10 The Cost Functional on the Perspective Space

Sections M.2–M.5 specify the geometric substrate for perspectival dynamics: the perspective space $\Sigma \cong U(d_0)/U(1)^{d_0}$, the metric $d_\Sigma$, and the transition kernel $G_{\text{persp}}$. Section M.6 studies quantum-measurement scenarios and the conditional CC interface within that apparatus. The receiver-pattern descriptor below is defined on systems carrying Effective Operational Property R. Its computational and thermodynamic readings require the reduction and registered-implementation certificates stated in Theorems M.10.3 and M.10.7.

Shannon entropy $H(X)=-\sum_xp(x)\ln p(x)$ is a functional of a specified probability distribution. Fisher information, Kolmogorov complexity, integrated-information quantities, and quantum entropies likewise require their respective mathematical inputs, and their computability depends on how those inputs are represented. The construction below defines the receiver-pattern descriptor $\mathcal P_S(E)=(\Delta Q_S,\mu_S(E),\sigma_S(E))$. Its established comparison result is non-determination of $\mu_S(E)$ by Shannon entropy on the branch of Theorem M.10.2. External evaluation is certificate-relative under Theorem M.10.5; no general computability ordering follows from aggregate complexity alone.

**Definition M.10.1 (Self-Model).** Let $S$ be a predictive system with $C_{agg}(S)>C_{op}$ possessing Effective Operational Property R. The self-model $\mathcal M_S$ is the component of $S$'s internal model that represents its own states, predictions, accuracy, and dynamics. On the perspectival branch it encodes an internal representation of the registered perspective $s\in\Sigma$ and density operator $\rho(t)$; vector notation is restricted to the pure-state shorthand of Definition 24.

**Remark M.10.1.** The definitions below apply to systems possessing Effective Operational Property R together with an operational self-model of the form specified in Definition M.10.1. They assign no SPAP-proximity value or cost law to systems outside that domain. Within the domain, Theorem M.10.3 gives an asymptotic computational lower bound only for families carrying its pattern-specific reduction certificate, and Theorem M.10.7 gives a physical reset signature only when its implementation certificate is supplied. Effective Operational Property R is therefore a domain condition. A parameter $\theta_S$ is not thereby a retained content object or a complete finite-budget candidate. Any persistence claim in the complete finite-budget quotient $\sim_B$ requires a registered encoder from the parameter domain into complete candidates carrying the response, update, verification, certificate, decoder, tolerance, and cost data of Definition P.16d.0.1; equality of the raw parameter follows from equality of retained quotient classes only when the composite quotient encoder is injective on the compared domain.

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

**Remark M.10.2 (Connection to perspectival dynamics).** On a branch carrying the registered perspective-extraction map of Proposition M.10.9, a self-model update $\delta\theta_S(E)$ whose endpoints remain in its declared neighborhood induces the perspective displacement between $\iota(\theta_S)$ and $\iota(\theta'_S)$. The quantity $PP_S^{(E)}$ remains the performance criterion of Definition M.10.3. Comparison of the Fisher metric on $\Theta_S$ with the flag-manifold metric $d_\Sigma$ (Definition 25, Equation 42) requires Proposition M.10.9's local-embedding and co-Lipschitz hypotheses; those data do not follow from the self-model update alone.

**Definition M.10.4 (Perspectival Profile).** The *perspectival profile* of $E$ relative to $S$ is the triple:
$$
\mathcal{P}_S(E) := \left(\Delta Q_S(E), \; \mu_S(E), \; \sigma_S(E)\right)
\tag{M.20}
$$
where:

- $\Delta Q_S(E) := \mathbb{E}[\Delta Q \mid E; M_S]$ is the *predictive relevance*: the expected improvement in predictive quality from processing $E$ (Definition 1). This may be positive, zero, or undefined if $E$ is unprocessable.
- $\mu_S(E)$ is the *SPAP proximity*: the inverse gap to the SPAP boundary required for full integration (Equation M.19).
- $\sigma_S(E) := \|\Delta M_S^{(\text{self})}(E)\|_{\mathcal{F}_S} / \|\Delta M_S(E)\|_{\mathcal{F}_S}$ is the *reflexivity fraction*: the proportion of the total model-change that modifies the self-model. The Fisher-orthogonality of the decomposition (Definition M.10.2) guarantees $\|\Delta M_S^{(\text{self})}\|_{\mathcal{F}_S} \leq \|\Delta M_S\|_{\mathcal{F}_S}$ via the Pythagorean identity, ensuring $\sigma_S \in [0, 1]$. When $\|\Delta M_S(E)\|_{\mathcal{F}_S} = 0$ (no model change), define $\sigma_S(E) := 0$.

The profile describes *perspectival information* on a branch where $\Delta Q_S(E)>0$, $\mu_S(E)<\infty$, and an admissible procedure within the system's task-specific resources realizes the positive improvement for a physically instantiated, relevant pattern as required by Definition 1. Finite $\mu_S(E)$ alone supplies no finite-cost implementation. When $\mu_S(E)=\infty$, no subboundary performance satisfies (M.18); exclusion of finite-cost completed integration additionally requires Theorem M.10.6's pattern-specific reduction certificate. That integration boundary does not by itself exclude every admissible partial use satisfying Definition 1.

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

**Theorem M.10.3 (Certificate-Relative Integration Complexity).** Let $(S_\lambda,E_\lambda)$ be an asymptotic family carrying the pattern-specific reduction certificate of Corollary B.2.1, and measure $C_{\mathrm{integrate}}$ in the same computational cost units as $C_{\mathrm{uni}}$. On the branch
$$
0<\mu_\lambda:=\mu_{S_\lambda}(E_\lambda)<\infty,
\qquad
\mu_\lambda\longrightarrow\infty,
$$
there are constants $c>0$ and $1<\mu_0<\infty$ such that
$$
C_{\mathrm{integrate}}(S_\lambda,E_\lambda)
\ge c(\log\mu_\lambda)\mu_\lambda^2
\tag{M.23}
$$
whenever $\mu_\lambda\ge\mu_0$.

*Proof.* The finite positive proximity gives $\delta_\lambda=1/\mu_\lambda>0$. The reduction certificate and Theorem B.2 supply constants $c>0$ and $\delta_0>0$ for which
$$
C_{\mathrm{integrate}}(S_\lambda,E_\lambda)
\ge C_{\mathrm{uni}}(\delta_\lambda)
\ge c\,\frac{\log(1/\delta_\lambda)}{\delta_\lambda^2}
$$
when $0<\delta_\lambda\le\delta_0$. Choosing $\mu_0>\max\{1,1/\delta_0\}$ and substituting proves (M.23). A thermodynamic lower bound requires an additional implementation ledger mapping the certified computation to physical resets or another calibrated resource. $\square$

**Corollary M.10.3a (Asymptotic Lower Exponent Without a Finite-Ladder Slope Law).** For any sequence of the finite-proximity branch of Theorem M.10.3 with $\mu_n\to\infty$,
$$
\liminf_{n\to\infty}
\frac{\log C_{\mathrm{integrate}}(S_{\lambda_n},E_{\lambda_n})}
{\log\mu_n}
\ge2.
\tag{M.23a}
$$
Costs may take the value $+\infty$, with $\log(+\infty)=+\infty$; the denominator is finite and positive for all sufficiently large $n$.

*Proof.* The positive lower bound (M.23) makes every sufficiently late cost positive. If a cost is finite, taking logarithms and dividing by $\log\mu_n>0$ gives
$$
\frac{\log C_{\mathrm{integrate}}}{\log\mu_n}
\ge2+\frac{\log c+\log\log\mu_n}{\log\mu_n}.
$$
For infinite cost the same inequality holds in the extended order. The final term tends to zero, proving the liminf assertion. A stage with $\mu=+\infty$ has zero gap and is not covered by the positive-gap certificate used here; it requires a separate endpoint argument and is not substituted into either logarithmic ratio. ∎

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

**Theorem M.10.4 (Existence of Divergent SPAP Proximity by Independent-Register Amplification).** Let $S$ be a system with Effective Operational Property R whose self-model contains $n_S$ Fisher-orthogonal addressable deterministic SPAP registers. Assume that, for each retained register, the two operational binary code states are represented by distinct parameter values at positive Fisher distance. Register the parameter chart and the metric-evaluation points used by the discrepancy in (M.18). For each retained register $j$, require a certified lower bound $\eta_{S,j}>0$ on the Fisher tangent norm of either nonzero binary code-state displacement at every metric-evaluation point used in the individual and joint boundary diagonal challenges. The geodesic distance between code states does not by itself certify this tangent-norm bound. Define

$$
D_1(S):=\min_{1\le j\le n_S}\eta_{S,j}>0
$$

and

$$
N^*(S):=\left\lceil\left(\frac{g(\alpha_{SPAP})}{D_1(S)}\right)^2\right\rceil+1.
$$

If $n_S\ge N^*(S)$, then the retained formal pattern language contains a joint diagonal challenge $E^*$ for which the constraint set in (M.18) is empty and hence $\mu_S(E^*)=\infty$ by definition. If an independent implementation certificate realizes that joint challenge as a physical pattern with the same register responses and Fisher geometry, the same conclusion holds for the realized pattern. For a scalable MPU-network product family, this conclusion applies at every family member for which $n_S\ge N^*(S)$ and such an implementation certificate is supplied. No family-wide unboundedness conclusion follows from block-diagonal Fisher geometry alone unless the family also satisfies a quantitative separation condition ensuring $\sqrt{n_S}D_1(S)>g(\alpha_{SPAP})$ along an unbounded subsequence.

*Proof.* The uniform register discrepancy is supplied by the certified tangent-norm bounds in the register antecedent. Theorem 15 supplies the deterministic SPAP core with finite binary roles capable of storing and comparing the predicted bit and the realized bit. The independent-register hypothesis supplies the two operational binary code states, their positive Fisher separation, and the registered lower bounds $\eta_{S,j}>0$ for the discrepancy norm used in (M.18). Since the retained register family used in the construction is finite, $D_1(S)=\min_j\eta_{S,j}>0$.

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

Choose $N=N^*(S)$ Fisher-orthogonal addressable registers from the available $n_S$ registers and construct $N$ diagonal challenges $S_{\mathrm{diag}}^{(j)}$, $j=1,\ldots,N$, one per register. §A.0.2 (Theorem A.0.1; Corollary A.0.1) supplies the finite diagonal closure for each retained challenge, and the theorem antecedent supplies the independent-register branch. Let $E^{(N)}$ be the joint pattern encoding those diagonal challenges simultaneously, and write $\theta_S'$ for the self-model state after attempting to integrate $E^{(N)}$. The register family is Fisher-orthogonal by the theorem antecedent. On an MPU-network realization, Theorem A.0.6 supplies its conditional computational capabilities and Theorem 15 supplies its finite SPAP core; a separate product-state and parameter-independence record must supply the Fisher-orthogonal register geometry. Therefore, by additivity of the Fisher metric on orthogonal parameter subspaces, for every $PP\in[0,\alpha_{SPAP})$,

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

**Remark M.10.5 (Terminological consistency with Definition 1).** For the pattern $E^*$ with $\mu_S(E^*)=\infty$, Theorem M.10.6 excludes a subboundary solution of (M.18). It excludes finite-cost completed integration only on its additional pattern-specific reduction branch. The profile $\mathcal P_S(E^*)$ therefore marks the boundary of that integration criterion. Whether an admissible partial-use procedure can produce the positive predictive improvement required by Definition 1 is a separate task-relative question.

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
is a sufficient register count for the displayed proof and is not asserted to be least. Neither theorem proves convergence to the endpoint as $N\uparrow N^*(S)$. Theorem M.10.4.2 attains every intermediate value in $(1/\alpha_{SPAP},\infty)$ in the formal one-coordinate class; physical realization of those values requires the implementation certificate. $\square$

**Theorem M.10.4.2 (Exact Attainable Range of Formal SPAP Proximity).** Fix $\alpha=\alpha_{SPAP}>0$. Across the smooth calibrated one-coordinate Fisher geometries admitted by Definition M.10.3 with $g(\delta)=\delta$, the exact attainable range is
$$
\left[\frac1\alpha,\infty\right].
\tag{M.10.4.2a}
$$
More precisely, let $\Theta=\mathbb R$ with its Euclidean Fisher metric and choose the candidate target $\theta'=0$. For any finite $\mu>1/\alpha$, put
$$
r=\alpha-\frac1\mu\in(0,\alpha),
$$
choose $q\in(r,\alpha)$ and
$$
0<k<\frac1{2\alpha-r-q},
\qquad
h(P)=\alpha-P+k(P-r)(P-q).
\tag{M.10.4.2b}
$$
Then $h$ is positive and strictly decreasing on $[0,\alpha]$. With $d=h(0)$, take the pre-update default $\theta_S=d$ (so the update displacement to $\theta'=0$ is $-d$), put $\tau(P)=h(P)/d$, and define
$$
\Pi^{(P)}(\theta)
=
(1-\tau(P))\theta+\tau(P)d.
\tag{M.10.4.2c}
$$
This family is smooth, $\Pi^{(0)}$ is the default $d$ independent of $\theta$, and
$$
|\Pi^{(P)}(\theta)-\theta|
=
\tau(P)|d-\theta|
\tag{M.10.4.2d}
$$
is nonincreasing in $P$ for every target. For $\theta'=0$, the criterion (M.18) is satisfied exactly for $P\in[r,q]$, so its infimum is $r$ and its proximity is the prescribed $\mu$.

The baseline $1/\alpha$ is attained by the zero-displacement construction of Corollary M.10.3.1. The endpoint $\infty$ is already attained with one coordinate: take $h(P)=\alpha-P+c$ for any $c>0$ and use (M.10.4.2c). Then $h(P)>\alpha-P$ for every $P$, the constraint set is empty, and Definition M.10.3 gives $\mu=\infty$.

*Proof.* Definition M.10.3 has $P\in[0,\alpha]$, so $\delta=\alpha-P\in[0,\alpha]$: positive $\delta$ gives $\mu\in[1/\alpha,\infty)$ and $\delta=0$ gives $\infty$. This proves the universal envelope. In (M.10.4.2b),
$$
h'(P)=-1+k(2P-r-q)<0
$$
by the bound on $k$, and $h(\alpha)=k(\alpha-r)(\alpha-q)>0$, so $h$ is positive and decreasing. Equations (M.10.4.2c)--(M.10.4.2d) verify every smoothness, default, and calibrated-order condition. Finally,
$$
h(P)\le\alpha-P
\quad\Longleftrightarrow\quad
(P-r)(P-q)\le0
\quad\Longleftrightarrow\quad
P\in[r,q].
$$
Thus $P^{(E)}=r$ and $1/(\alpha-r)=\mu$. The displayed endpoint function never satisfies the criterion, completing the range proof. ∎

**Resolution TV-M-09-R1.** Theorem M.10.4.2 gives `positive-discharge` of the exact definition-level reachable proximity interval and `negative-refutation` of both an interval gap and any universal multi-register lower bound in that full formal class. Theorem M.10.4's $N^*(S)$ remains a sufficient count for its particular independent binary-diagonal construction; admission of the one-coordinate maps above as physically realized SPAP patterns requires the usual implementation certificate.

**Theorem M.10.5 (Certificate-Relative External Evaluation).** Let $A$ hold an external representation of $B$'s self-model data for a specified pattern $E$. Assume that the representation includes:

1. effective finite descriptions of $\theta'_B(E)$, $g_B$, $g$, and $\Pi_B^{(PP)}$ with certified moduli of continuity on $[0,\alpha_{SPAP}]$;
2. a decision certificate that either isolates the infimum in (M.18) to any requested rational accuracy or certifies that the constraint set is empty; and
3. if a sender-side reflexive-cost conclusion is desired, an insulation certificate stating that this external computation leaves $A$'s self-model component unchanged.

Then $A$ can enclose $PP_B^{(E)}$ to the accuracy supplied by the decision certificate. On a branch with $PP_B^{(E)}<\alpha_{SPAP}$, certified infimum enclosures also compute the finite value $\mu_B(E)$ to any requested rational accuracy. An exact declaration $\mu_B(E)=\infty$ requires a certificate that the constraint set is empty or that its infimum equals $\alpha_{SPAP}$; arbitrarily narrow infimum enclosures alone do not supply that decision. The inequality $C_{agg}(A)>C_{agg}(B)$ is neither necessary nor sufficient for these conclusions by itself.

*Proof.* Define the continuous function
$$
F_E(PP)
=
\|\Pi_B^{(PP)}(\theta'_B(E))-\theta'_B(E)\|_{\mathcal F_B}
-g(\alpha_{SPAP}-PP).
$$
The effective descriptions and moduli permit certified evaluation of $F_E$ on rational interval enclosures. Item 2 either certifies that $\{PP:F_E(PP)\le0\}$ is empty or encloses its infimum. In the empty case Definition M.10.3 assigns $PP_B^{(E)}=\alpha_{SPAP}$ and $\mu_B(E)=\infty$. Write $p=PP_B^{(E)}$ and $\alpha=\alpha_{SPAP}$. If $p<\alpha$, sufficiently narrow certified enclosures $p\in[L,U]$ satisfy $U<\alpha$ and give
$$
\mu_B(E)\in
\left[\frac1{\alpha-L},\frac1{\alpha-U}\right].
$$
Their width is $(U-L)/[(\alpha-L)(\alpha-U)]$, which tends to zero as the infimum enclosure shrinks around $p<\alpha$. Refinement until this computable width is below the requested tolerance therefore terminates on that branch. At $p=\alpha$, this reciprocal estimate gives no finite error enclosure; an endpoint decision is separate. Under item 3, Definition M.10.2 gives $\sigma_A=0$ for the external-evaluation task; without item 3 no such sender-side conclusion follows. No universal reflexive or upward impossibility is proved by this argument. $\square$

**Corollary M.10.5.1 (No Universal Self-Evaluation on a Reduction-Certified Branch).** Fix a predictive system $S$ with Effective Operational Property R. Assume there is a total computable reduction $\mathcal R_S$ with the following property: from any internal procedure that returns the exact value of $\mu_S(E)$ for every represented pattern $E$ with $\sigma_S(E)>0$, $\mathcal R_S$ constructs a universal exact self-predictor for the diagonal class excluded by Theorem 10. Then no such universal internal evaluator of $\mu_S$ exists.

*Proof.* Suppose an internal evaluator $\mathcal P_S$ returned the exact value of $\mu_S(E)$ on every represented pattern with $\sigma_S(E)>0$. By the reduction hypothesis, $\mathcal R_S(\mathcal P_S)$ would be a universal exact self-predictor for the diagonal class of Theorem 10. Theorem 10 excludes that predictor. Hence $\mathcal P_S$ cannot exist. ∎

Theorem M.10.5 separately establishes certificate-relative external evaluation for specified represented patterns.

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

**Theorem M.10.7 (Conditional Registered-Reset Signature).** Let $(S_\lambda,E_\lambda)$ satisfy the pattern-specific reduction certificate of Corollary B.2.1 on stages with $0<\mu_\lambda:=\mu_{S_\lambda}(E_\lambda)<\infty$ and $\mu_\lambda\to\infty$. Suppose a physical implementation certificate assigns a deterministic finite number $n_\lambda$ of completed resets to each stage, with
$$
n_\lambda\ge c\,\log\mu_\lambda\,\mu_\lambda^2
$$
for some $c>0$ and all sufficiently large $\mu_\lambda$. For every counted reset $j$, conditional on its admitted pre-reset history $\mathcal H_{j-1}$, assume the complete classical reset contract of Definition 28: the actual logical and retained records have law $q_{j|\mathcal H_{j-1}}$, the retained records are unchanged, the logical register returns to its ready state, and the bath independence, resource closure and entropy-limit hypotheses hold. All counted baths have the same temperature $T>0$. Assume integrable mean heats $Q_j$ and define
$$
h_j:=\mathbb E\!\left[
H_{q_{j|\mathcal H_{j-1}}}(P_j\mid R_j)
\right],
\qquad
\Delta S_{\mathrm{export}}
:=
\frac1T\sum_{j=1}^{n_\lambda}\mathbb E Q_j.
$$
Here $\Delta S_{\mathrm{export}}$ is a mean heat-export ledger in entropy units. Then
$$
\frac{\Delta S_{\mathrm{export}}}{k_B}
\ge\sum_{j=1}^{n_\lambda}h_j.
\tag{M.25}
$$
If the certificate also supplies $h_j\ge h_{\min}>0$ for every counted reset, then
$$
\Delta S_{\mathrm{export}}
\ge k_Bh_{\min}n_\lambda
\ge k_Bh_{\min}c\,\log\mu_\lambda\,\mu_\lambda^2.
$$
A stress-energy conclusion additionally requires the local energy-density, support and coarse-graining bridge of Definition B.8.

*Proof.* Theorem 31, applied to each history-conditioned reset under the complete Definition 28 contract, gives
$$
\mathbb E[Q_j\mid\mathcal H_{j-1}]
\ge k_BT\,H_{q_{j|\mathcal H_{j-1}}}(P_j\mid R_j).
$$
Taking expectations and summing the finite deterministic sequence proves (M.25). The entropy floor and the independent implementation count bound give the second inequality chain. A positive entropy floor does not follow from register size or from computational complexity alone.

The ledger is neither a pathwise heat floor nor a total entropy-production floor. Identifying it with an actual finite bath's von Neumann entropy change requires an additional entropy-balance certificate; mean heat divided by temperature is not that entropy change by definition. Random stopping, unbounded reset counts, or infinite-resource limits require a justified conditional-summation and convergence certificate before the same conclusion is used. Definition B.8 consumes the physical localization bridge rather than deriving it here. $\square$

The conditional chain is
$$
\mu_\lambda
\xrightarrow{\text{pattern-specific reduction certificate}}
C_{\mathrm{integrate}}
\xrightarrow{\text{registered implementation certificate}}
\{(P_j,R_j,q_{j|\mathcal H_{j-1}})\}_{j=1}^{n_\lambda}
\xrightarrow{\text{conditional reset contract and finite summation}}
\frac{\Delta S_{\mathrm{export}}}{k_B}
\ge\sum_j h_j.
$$

**Theorem M.10.8 (Certificate-Relative Screening and Replay Bookkeeping).** Let $A$ hold the effective model-access and decision certificates of Theorem M.10.5 for each member of a finite family $\mathcal E=\{E_1,\ldots,E_N\}$. On each finite positive-gap branch of Theorem M.10.5, $A$ can compute finite-accuracy enclosures for $\mu_B(E_i)$; an independently certified infinite endpoint can be recorded as $\infty$. The system can form finite lookup tables using registered terminating rational or interval operations with certified output validity. An ordering is asserted only for comparisons decided by separated enclosures or by an additional comparison certificate. If an entry belongs to a reduction-certified asymptotic family covered by Theorem M.10.3 and its enclosure lies entirely at or above a certified threshold $\mu_0>1$ for that family's lower bound, the enclosure yields the corresponding computational lower bound. A claim that this screening is reflexively cost-free for $A$ additionally requires the insulation condition in Theorem M.10.5.

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

These are dimensionless geometric and distinguishability bounds. A physical-action conclusion additionally requires an independently calibrated action scale and a ledger-specific bridge to physical action; invoking Theorem Q.0.1 and Corollary Q.0.1 also requires their continuum-convergence and additive recovery-history hypotheses. Heat requires a registered reset ledger, and stress-energy requires the localization and projection hypotheses of Definition B.8. No bridge conclusion is available when the data of Definition M.10.9b are absent.

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

*Proof.* The first conclusions follow because every argument of each pattern-side functional is identical. Equation (M.10.9d.2), Definitions M.10.2 and M.10.4, and Corollary M.10.3.1 give (M.10.9d.3). The final scope sentence retains the reduction premise of Theorem M.10.3 and requires a registered implementation ledger; a reset-heat interpretation additionally retains Theorem M.10.7's implementation hypotheses. ∎

A register permutation alone does not establish (M.10.9d.2). The receiver-role certificate must prove that off-target addressing lies in the external Fisher component and that indirect propagation does not return a nonzero component to the self-model subspace.

### M.10.10 Static Entropic Perspective Coupling with Prescribed Endpoint Marginals

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

Let $\pi_0$ be a Borel probability reference measure on $\Sigma\times\Sigma$ and let $\varepsilon>0$. Assume that at least one coupling $\bar\pi\in\Pi(\mu_0,\nu)$ has $\operatorname{KL}(\bar\pi\Vert\pi_0)<\infty$. This holds on a finite carrier when $\pi_0$ assigns positive mass to every pair. The entropic perspective-transport plan is
$$
\pi^\star
=
\operatorname*{argmin}_{\pi\in\Pi(\mu_0,\nu)}
\left[
\int_{\Sigma\times\Sigma}c(s,s')\,d\pi(s,s')
+
\varepsilon\,\operatorname{KL}(\pi\Vert\pi_0)
\right].
\tag{M.10.10.1}
$$
Here $\Pi(\mu_0,\nu)$ denotes couplings with the stated marginals; absolute continuity without finite relative entropy is not the feasibility condition.

**Theorem M.10.10b (Existence, Uniqueness, and Conditional Born Endpoint Marginals).** Under Definition M.10.10a, the minimizer exists, is unique and has finite objective. If pairwise disjoint Borel outcome sectors $A_k$ satisfy $\nu_k(A_k)=1$ and $\nu_j(A_k)=0$ for $j\ne k$, then
$$
\pi^\star(\Sigma\times A_k)=p_k=\operatorname{Tr}(\rho P_k).
\tag{M.10.10.2}
$$

*Proof.* Compactness of $\Sigma$ makes $\Pi(\mu_0,\nu)$ weakly compact. The bounded continuous transport cost is weakly continuous. Relative entropy is weakly lower semicontinuous; its probability-measure variational formula expresses it as the supremum of the continuous functionals
$$
\pi\longmapsto\int f\,d\pi-\log\int e^f\,d\pi_0,
\qquad f\in C(\Sigma\times\Sigma).
$$
The finite-relative-entropy feasible coupling makes the objective proper, so the direct method gives a finite minimizer. On its finite domain, strict convexity of $x\log x$ gives strict convexity of relative entropy in the density relative to $\pi_0$. Two distinct minimizers would therefore have a midpoint of lower objective. Finally every admissible coupling has second marginal $\nu=\sum_jp_j\nu_j$, whence
$$
\pi^\star(\Sigma\times A_k)=\nu(A_k)
=\sum_jp_j\nu_j(A_k)=p_k.
$$
The Born weights are prescribed marginal inputs to this conclusion. $\square$

**Corollary M.10.10c (Entropic Transport Kernel with Prescribed Born Endpoint Law).** Let $A_k=\operatorname{supp}\nu_k$ be pairwise disjoint up to $\nu$-null sets, and disintegrate the unique finite-objective plan as
$$
\pi^\star(ds,ds')=\mu_0(ds)\,K^\star(ds'|s).
$$
Put $r_k(s)=K^\star(A_k|s)$. The endpoint weights satisfy
$$
\int_\Sigma r_k(s)\,\mu_0(ds)=p_k.
\tag{M.10.10.3}
$$
For $p_k>0$, the conditional transition kernel is
$$
G_{\mathrm{persp}}(B|s,k,N,\Delta t)
=
\frac{K^\star(B\cap A_k|s)}{r_k(s)}
\quad\text{when }r_k(s)>0.
\tag{M.10.10.4}
$$
Its value on $r_k(s)=0$ is arbitrary for the outcome-$k$ joint law. The starting-perspective law conditional on that outcome is
$$
\mu_{0|k}(ds)=\frac{r_k(s)}{p_k}\,\mu_0(ds),
$$
and the joint endpoint law decomposes as
$$
\pi^\star(ds,ds')
=
\sum_{k:p_k>0}p_k\,\mu_{0|k}(ds)\,
G_{\mathrm{persp}}(ds'|s,k,N,\Delta t).
$$
To use this same plan with the Born-first sampling rule that draws $s$ from $\mu_0$ and then draws $k$ with probability $p_k$ independent of $s$, additionally require
$$
r_k(s)=p_k
\quad\text{for $\mu_0$-almost every $s$ and every $k$}.
$$
Averaged endpoint weights alone do not supply this compatibility condition. The registered $N,\Delta t$ dependence is the indexed input dependence specified in Definition M.10.10a.

*Proof.* Compact standard-Borel $\Sigma$ admits a disintegration with
$$
\pi^\star(C\times B)=\int_C K^\star(B|s)\,\mu_0(ds).
$$
Taking $C=\Sigma$ and $B=A_k$ proves (M.10.10.3). Conditioning the joint law on the sector gives the stated density of $\mu_{0|k}$ and the normalized restriction (M.10.10.4). Multiplying these two expressions and summing the sectors recovers the disintegration; their union has full second-marginal measure. If $p_k=0$, nonnegativity implies $r_k=0$ almost everywhere, so this outcome contributes nothing. For $p_k>0$, the conditional starting law equals $\mu_0$ exactly when $r_k/p_k=1$ almost everywhere. Equivalently, the Born-first joint law agrees with the plan exactly when its starting-perspective/outcome marginal $p_k\mu_0(ds)$ equals $r_k(s)\mu_0(ds)$ for every $k$. This proves the additional compatibility criterion. No time-indexed path measure, reference Markov process, or Schrödinger bridge is constructed by the static problem. $\square$

**Theorem M.10.10c.1 (Complete Endpoint-Simplex Classification and Born Nonentailment).** Retain pairwise disjoint sectors $A_1,\ldots,A_m$ and normalized component laws $\nu_k$ with $\nu_j(A_k)=\delta_{jk}$. For every probability vector $q\in\Delta_{m-1}$ define
$$
\nu_q:=\sum_kq_k\nu_k.
\tag{M.10.10c.1.1}
$$
Then the sector-mixture map $q\mapsto\nu_q$ is affine and injective, with inverse
$$
q_k=\nu_q(A_k).
\tag{M.10.10c.1.2}
$$
For every $q$ for which Definition M.10.10a's finite-relative-entropy feasibility premise holds, the same strict-convexity proof gives a unique entropic transport plan with endpoint-sector weights exactly $q$. Consequently the transport cost, entropy regularizer, sector partition, and component maps do not select Born weights. They force $q=p$ if and only if an independent descent/marginal axiom fixes
$$
q_k=\operatorname{Tr}(\rho P_k).
\tag{M.10.10c.1.3}
$$
The registered comparison class contains the following fully populated response-distinct feasible instance. Restrict all transport measures to the two-point finite-resolution carrier $\Sigma_2=\{s_1,s_2\}\subset\Sigma$ and take
$$
A_k=\{s_k\},\qquad \nu_k=\delta_{s_k},\qquad
\mu_0=\tfrac12(\delta_{s_1}+\delta_{s_2}),
\tag{M.10.10c.1.4}
$$
Choose orthonormal $e_1,e_2\in\mathcal H_0$, set $P_1=|e_1\rangle\!\langle e_1|$, $P_2=I-P_1$, and take $\rho=(|e_1\rangle\!\langle e_1|+|e_2\rangle\!\langle e_2|)/2$; then $p=(1/2,1/2)$. Set $q=(1/3,2/3)$ and use the full-support reference and candidate couplings
$$
\pi_0=\mu_0\otimes\nu_p,
\qquad
\pi_q=\mu_0\otimes\nu_q.
\tag{M.10.10c.1.5}
$$
The reference gives mass $1/4$ to each atom of $\Sigma_2^2$, while $\pi_q$ gives masses $1/6$ and $1/3$ to $(s_i,s_1)$ and $(s_i,s_2)$, respectively. Hence $\pi_q\in\Pi(\mu_0,\nu_q)$, $\pi_q\ll\pi_0$, and, writing $d_{12}=d_\Sigma(s_1,s_2)$,
$$
\operatorname{KL}(\pi_q\Vert\pi_0)
=\frac13\log\frac23+\frac23\log\frac43<\infty,
\qquad
\int c\,d\pi_q=\frac12d_{12}^2<\infty.
\tag{M.10.10c.1.6}
$$
It therefore satisfies Definition M.10.10a for every $\varepsilon>0$, while $q\ne p$ and $\nu_q\ne\nu_p$. This refutes a derivation from the transport data alone.

*Proof.* Disjoint support gives $\nu_q(A_k)=q_k$, proving injectivity and (M.10.10c.1.2). The existence/uniqueness proof of Theorem M.10.10b uses only the prescribed second marginal and therefore applies with $\nu$ replaced by $\nu_q$ on the feasible domain. Every coupling has second marginal $\nu_q$, so its sector weights are $q$. Equation (M.10.10c.1.3) is therefore necessary and sufficient for the Born endpoint vector. Equations (M.10.10c.1.4)--(M.10.10c.1.6) verify that the feasible domain contains the displayed non-Born point. ∎

**Resolution TV-M-11-R1 (Metadata).** Exact domain: every finite disjoint sector family with normalized component laws and its feasible set
$$
\mathcal Q_{\mathrm{feas}}
:=\{q\in\Delta_{m-1}:\exists\pi\in\Pi(\mu_0,\nu_q),\ \operatorname{KL}(\pi\Vert\pi_0)<\infty\},
$$
including the fully populated two-point package (M.10.10c.1.4)--(M.10.10c.1.6). Premises: finitely many disjoint sectors, normalized component laws, fixed source/reference marginals, finite transport cost and relative entropy on the declared feasible set, with the displayed positive full-support reference for the explicit witness. Equivalence: equality of endpoint laws; disjoint sectors make this equality equivalent to equality of weight vectors. Budget: every $q\in\mathcal Q_{\mathrm{feas}}$, together with both marginals and all eight reference/candidate atom masses of the explicit witness; no claim is made for an infeasible simplex point. Verifier: sector evaluations, coupling marginals, the positive reference and candidate atom masses, finite relative entropy, finite cost and strict convexity. Falsifier: two different feasible vectors with the same endpoint law or transport data selecting one vector without a marginal axiom. Provenance class: source-internal exact classification. Downstream consumers: the endpoint-sector/Born-weight classification, subsequent perspective-role constructions and `TV-M-11`. Result: `negative-refutation` of an independent Born derivation and complete classification of the added axiom that forces it; this is terminal under the target's registered alternative-law clause.

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
\pi_S(c_1)=\pi_S(c_2)
$$
as elements of $\mathcal F_S$. An additional group action on $\mathcal F_S$ does not preserve this equivalence merely by being called an internal symmetry. Passing to its orbit quotient defines a coarser relation unless each orbit is a singleton in $\mathcal F_S$.

The perspectival profile
$$
\mathcal P_S(c)=(\Delta Q_S(c),\mu_S(c),\sigma_S(c))
$$
is a finite descriptor on the subset of $\mathcal F_S$ where it is well-defined. It need not separate all operational distinctions, so equality of profiles implies operational equivalence only on a branch where the profile is injective. Descent of the profile to any additional group-orbit quotient requires invariance under that action. The term “coordinate chart” is reserved for a proved injective local parametrization with the requisite topology.

*Proof.* The predictive role of $c$ is the natural-isomorphism class $[\mathcal R_c^S]_{\cong}$. The quotient defining $\mathcal F_S$ identifies exactly the contents in each such class, giving
$$
\pi_S(c)=[c]_{\mathrm{op}}=[\mathcal R_c^S]_{\cong}.
$$
Thus equality in $\mathcal F_S$ is equivalent to the declared operational equivalence. If a group element moves one point of $\mathcal F_S$ to another, its orbit quotient identifies two distinct operational classes; the original equivalence cannot also characterize equality in that further quotient. A function on $\mathcal F_S$ descends to the orbit quotient precisely when it is constant on every orbit. Finally, a finite tuple of descriptors need not be injective, so the profile implication requires the stated separating property. $\square$

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

**Theorem M.10.10d.2a (Profile-Fiber Classification and Global Collision).** Fix a finite retained content class $\mathcal C$ on which $\mathcal P_S$ is defined and invariant under $\equiv_{\mathrm{op}}^S$. Let
$$
Q_{\mathcal C}:=\mathcal C/\!\equiv_{\mathrm{op}}^S,
\qquad
r:\mathcal C\to Q_{\mathcal C},
$$
and let $\overline{\mathcal P}_S:Q_{\mathcal C}\to\mathbb R\times(0,\infty]\times[0,1]$ be the induced profile map. For each attained profile value $z$, write
$$
F_z:=\overline{\mathcal P}_S^{-1}(z).
\tag{M.10.10d.2a.1}
$$
Then a subclass $\mathcal E\subseteq\mathcal C$ is separating exactly when
$$
|r(\mathcal E)\cap F_z|\le1
\quad\text{for every attained }z.
\tag{M.10.10d.2a.2}
$$
The inclusion-maximal separating subclasses are exactly the saturated transversals
$$
\mathcal E=r^{-1}(T),
\qquad
|T\cap F_z|=1
\quad\text{for every attained }z.
\tag{M.10.10d.2a.3}
$$

The full profile map is nonseparating on an admissible finite model. Take an identifiable Fisher stratum whose external tangent summand contains orthonormal vectors $e_1,e_2$, impose the baseline-invariance condition $\Pi_S^{(0)}(\theta_S)=\theta_S$, and register two patterns $E_1,E_2$ with
$$
\Delta M_S^{(\mathrm{self})}(E_i)=0,
\qquad
\Delta M_S^{(\mathrm{ext})}(E_i)=e_i,
\qquad
\Delta Q_S(E_i)=0.
\tag{M.10.10d.2a.4}
$$
Work on the probabilistic response-presheaf branch and include one retained binary response probe $p$ whose outcome laws are $\delta_0$ on $E_1$ and $\tfrac12(\delta_0+\delta_1)$ on $E_2$. Then
$$
\mathcal P_S(E_1)=\mathcal P_S(E_2)
=\left(0,\frac1{\alpha_{SPAP}},0\right),
\qquad
E_1\not\equiv_{\mathrm{op}}^S E_2.
\tag{M.10.10d.2a.5}
$$

*Proof.* Invariance makes $\overline{\mathcal P}_S$ well defined. Definition M.10.10d.1 says that $\mathcal E$ is separating exactly when two roles represented in $r(\mathcal E)$ cannot lie in the same profile fiber, which is (M.10.10d.2a.2). If a separating class omits a content operationally equivalent to one it contains, adjoining that content preserves separation. If its role image misses a nonempty fiber, adjoining one role from that fiber also preserves separation. Hence every maximal separating class is saturated and meets every fiber. Conversely, a saturated class meeting every fiber in exactly one role obeys (M.10.10d.2a.2), and adjoining any omitted role creates a two-role intersection in its fiber. This proves (M.10.10d.2a.3).

For the displayed model, $\Delta M_S^{(\mathrm{self})}(E_i)=0$ leaves the updated self parameter equal to $\theta_S$. Baseline invariance makes $PP=0$ satisfy (M.18), so the infimum is zero and Definition M.10.3 gives $\mu_S(E_i)=1/\alpha_{SPAP}$. Fisher orthogonality and the nonzero external updates give $\sigma_S(E_i)=0$, while the registered predictive relevance is zero for both. Their profiles therefore agree. The two probability laws at probe $p$ are not isomorphic: a probability-preserving bijection cannot turn one atom of mass one into two atoms of mass one half. Therefore no natural isomorphism of the retained response presheaves exists, and Theorem M.10.10d places the patterns in different operational roles. This proves (M.10.10d.2a.5). ∎

**Resolution TV-M-12-R1 (Profile-Completeness Classification).** Exact domain: finite retained content classes on which the profile is defined and operationally invariant, together with the explicit two-pattern Fisher-stratum model in (M.10.10d.2a.4). Premises: Definitions M.10.2--M.10.4, the baseline-invariance condition, and Theorem M.10.10d's response-role quotient. Equivalence: natural isomorphism of retained response presheaves. Exhaustive budget: every operational-role fiber of every attained profile value in the declared finite class. Verifier: quotient the class by $\equiv_{\mathrm{op}}^S$, group the quotient by exact profile equality, and check (M.10.10d.2a.2)--(M.10.10d.2a.3); for the collision, evaluate the three coordinates and probe $p$. Falsifier: a separating subclass whose role image contains two members of one profile fiber, a maximal separating subclass omitting an attained fiber or part of a selected operational class, or operational equivalence of the two displayed probe responses. Provenance class: source-internal finite quotient classification and explicit countermodel. Nonvacuity: the two orthogonal external-update patterns in (M.10.10d.2a.4). Downstream consumers: Definition M.10.10d.1, Corollaries M.10.10d.2--M.10.10d.3, and `TV-M-12`. This is `positive-discharge` of the maximal separating-class classification and `negative-refutation` of global completeness for $(\Delta Q,\mu,\sigma)$.

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
| Theorem M.10.2 | Conditional non-determination by Shannon entropy | Corollary M.10.3.1 baseline; Theorem M.10.4 register branch; two equiprobable binary ensembles |
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
On a branch whose independent physical-action bridge identifies this finite ledger with $\mathcal S_{s\to s'}^{\mathrm{phys}}/\hbar$, the associated physical action is
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
The operator inequality (M.6.10a.2) makes $\xi_{\mathrm{PCE}}\ge0$, proving (M.6.10a.6). Equation (M.6.10a.7) is the independent physical-action identification assumed for this finite ledger. Theorem Q.0.1 and Corollary Q.0.1 provide a continuum scaling and calibrated history representation only when their convergence and recovery-history hypotheses are supplied. The final statement follows immediately from (M.6.10a.5). ∎

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
Let $\pi(\theta)>0$ be the registered prior on the finite preparation family. Discard record letters with $\sum_\theta\pi(\theta)p(r\mid\theta)=0$ and use $R$ for the remaining alphabet; also discard zero-probability outputs of any post-processing when comparing its retained distinctions. Since the prior has full support, a discarded record has $p(r\mid\theta)=0$ for every $\theta$, so this restriction changes no channel response. For each task $j\in\mathcal T$, let $A_j$ be its finite action set and let $\ell_j(\theta,a)$ be its loss. Define the predictive profile of each retained record $r$ by the complete conditional-loss vector
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

**Corollary M.6.11c (Classical-Record Quotient and Conditional PCE Minimality).** Given an independently registered classical finite record channel $\mathcal M:\Theta\to\Delta(R)$, its risk-equivalence quotient is exactly sufficient and has commutative output algebra $\ell^\infty(R/{\sim})$. If PCE cost is strictly increasing under every sufficient refinement that changes none of the registered task risks, the quotient is also the unique PCE-minimal sufficient record up to relabeling. A quantum interaction supplies such a classical record only after an independent instrument, dephasing, and readout bridge is registered.

*Proof.* Items 1--3 of Theorem M.6.11b give exact sufficiency. Item 4 identifies the quotient algebra as $\ell^\infty(R/{\sim})$, whose commutativity is inherited from the assumed classical record alphabet rather than derived from minimality. Under the strict-cost hypothesis, item 5 gives PCE minimality and uniqueness up to relabeling. ∎

**Definition M.6.11d (PPI-Objective Fragment Family).** Let $S$ be a finite system with PCE-minimal classical record alphabet $X$ selected by Theorem M.6.11b, and let $E_1,\dots,E_N$ be disjoint finite environmental fragments. A state on
$$
S E_1\cdots E_N
$$
is considered on the occurring record support when its conditional states are inferred from that state: each retained label then has $p_x>0$. A claim over an entire registered input alphabet, including labels absent from one input law, must supply normalized conditional states for those labels as independent family data. Such a family is provided explicitly in Theorem M.6.11g and cannot be inferred from the absent blocks of a single joint state. The state or supplied family is exactly PPI-objective for $X$ when:

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

**Theorem M.6.11e (Spectrum-Broadcast PPI Objectivity on the Dephased Branch).** Let $X$ be the risk-equivalence quotient output of $\mathcal M_{\min}$ in Theorem M.6.11b, and assume that PCE cost is strictly increasing under every sufficient record refinement that changes none of the registered risks. Assume also that the PCE-compressed joint state is invariant under dephasing in the selected record basis:
$$
(\Delta_X\otimes\operatorname{id}_{E_1\cdots E_N})(\rho)=\rho,
\qquad
\Delta_X(Y)=\sum_x|x\rangle\langle x|Y|x\rangle\langle x|.
$$
For the state-based equivalence, assume $p_x=\operatorname{Tr}[(|x\rangle\langle x|\otimes I)\rho]>0$ for every retained $x$. Then $X$ is exactly PPI-objective in the sense of Definition M.6.11d if and only if the joint state has the spectrum-broadcast form (M.6.11.8)–(M.6.11.9).

Thus the layered structure is:

1. Theorem G.1.7 fixes Born probabilities for a perspective.

2. Theorem M.6.11b selects the PCE-minimal classical record for one measurement context.

3. Theorem M.6.11e characterizes when that record becomes public across many disjoint perspectives.

*Proof.* Suppose first that the state has the spectrum-broadcast form. The system algebra generated by $|x\rangle\langle x|$ is $\ell^\infty(X)$. For fragment $E_i$, let $P_i^x$ be the support projection of $\rho_{E_i}^x$. Condition (M.6.11.9) makes these projections pairwise orthogonal, so
$$
C_i:=I_{E_i}-\sum_x P_i^x\ge0.
$$
Choose a retained label $x_0$ and define
$$
M_i^{x_0}=P_i^{x_0}+C_i,\qquad
M_i^x=P_i^x\quad(x\ne x_0).
$$
These positive effects sum to $I_{E_i}$. The complement $C_i$ annihilates every conditional-state support, so
$$
\operatorname{Tr}(M_i^x\rho_{E_i}^{x'})=\delta_{xx'}.
$$
Thus every fragment recovers $x$ exactly. The conditional product in (M.6.11.8) proves independence. The strict-cost hypothesis and Theorem M.6.11b exclude risk-preserving strict refinements at lower or equal cost. Hence the record is PPI-objective.

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

**Corollary M.6.11f (Objectivity Without Perspective-Independent Ontology).** Under Theorem M.6.11e's strict-cost and dephasing hypotheses, a classical fact shared by many perspectives is a PCE-minimal broadcast record. It is objective because many disjoint fragments independently recover the same minimal statistic $X$, not because the framework adds a perspective-free state of affairs.

*Proof.* Theorem M.6.11e identifies exact public objectivity with redundant fragment recovery and conditional independence in spectrum-broadcast form. Its strict-cost premise and Theorem M.6.11b(5) select $X$ as the unique PCE-minimal sufficient record up to relabeling. ∎

**Theorem M.6.11g (Finite Process-Tensor Construction of Minimal Spectrum Broadcast).** Let $X=\{1,\ldots,m\}$ be the PCE-minimal classical quotient of Theorem M.6.11b, with system basis $|x\rangle_S$. Prepare one discarded dephasing register $E_0$ and $N\ge1$ public fragments $E_1,\ldots,E_N$, each of dimension $m$, in $|0\rangle$. At successive fixed-order slots apply unitary extensions of
$$
U_i|x\rangle_S|0\rangle_{E_i}=|x\rangle_S|x\rangle_{E_i}
\qquad(i=0,\ldots,N),
\tag{M.6.11g.1}
$$
and discard $E_0$. These channels define a normalized deterministic process tensor by Theorem M.6.14b. For every input $\rho_S$, its retained output is
$$
\sum_{x=1}^m\langle x|\rho_S|x\rangle
|x\rangle\!\langle x|_S
\otimes
\bigotimes_{i=1}^N|x\rangle\!\langle x|_{E_i}.
\tag{M.6.11g.2}
$$
Thus the discarded copy derives exact dephasing, and the retained copies derive spectrum-broadcast structure. Every nonempty fragment subset recovers $X$ exactly, so the redundancy is $N$ and any $N-1$ fragments may be lost.

For the registered exact classical storage cost $C_{\log}(R)=\log|R|$, every record sufficient for all point-identification tasks on $X$ has at least $m$ values and cost at least $\log m$. A strict sufficient refinement has at least $m+1$ values and costs at least
$$
\log(m+1)-\log m>0
\tag{M.6.11g.3}
$$
more per refined record. Hence total public-fragment cost is at least $N\log m$, and (M.6.11g.2) saturates the bound.

*Proof.* Each displayed rule is an isometry on an $m$-dimensional subspace and extends to a unitary. Before tracing $E_0$, an off-diagonal $|x\rangle\langle x'|$ is accompanied by $|x\rangle\langle x'|_{E_0}$; its trace is zero for $x\ne x'$, giving (M.6.11g.2). Measuring any retained fragment in its displayed basis recovers $x$. Exact point identification requires an injective code and hence at least $m$ record values; a strict refinement splits at least one fiber and has at least $m+1$. ∎

**Resolution TV-M-14-R1 (Metadata).** Exact domain: every finite minimal alphabet $X$, every input state and every $N\ge1$. Premises: initialized environment fragments, the displayed fixed-order unitary copy process, discard of $E_0$, exact pointer-basis decoding and logarithmic record-cardinality cost. Equivalence: simultaneous alphabet permutation and unitary relabeling preserving the decoded statistic and every fragment response. Budget: all matrix units, all fixed-order slots and every nonempty fragment subset. Verifier: unitary extension, comb normalization, the partial trace yielding (M.6.11g.2), exact fragment decoding and integer cardinality bounds. Falsifier: surviving off-diagonal terms, a fragment that fails to decode, or a lower-cost exact sufficient refinement. Provenance class: source-internal finite process-tensor construction. Downstream consumers: the finite objectivity/redundancy ledger, Appendix M's record-cost results and `TV-M-14`. Result: `positive-discharge` of dephasing, spectrum broadcast, strict sufficient-refinement cost and redundancy bounds.

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

**Theorem M.6.12b (Minimal Sufficient Predictive Bottleneck).** For finite random variables $X,Y$, use the effective substrate alphabet $X_+=\{x:p(x)>0\}$ and discard zero-probability statistic outputs. Write $X$ for this effective alphabet in the quotient below; all claims of recovery or conditional equality are almost sure under the registered joint law. Define an equivalence relation on these substrate states by
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
For the finite reference system, let
$$
G_Q:=\overline{\{e^{-itQ_R}:t\in\mathbb R\}}\subseteq U(\mathcal H_R).
$$
This compact group has normalized Haar probability measure $d\nu(V)$. Define
$$
\mathcal A_Q(\sigma_R)
=
D\!\left(\sigma_R\Vert\mathcal G_Q(\sigma_R)\right),
\qquad
\mathcal G_Q(\sigma_R)
=
\int_{G_Q}V\sigma_RV^\dagger\,d\nu(V).
\tag{M.6.13.2}
$$
No commensurability of the charge eigenvalues is required. Finite-dimensional continuity extends covariance under all $e^{-itQ_R}$ to this closure.

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

**Corollary M.6.13c (Compatibility with Blackwell-PCE Classicality).** The classical record selected by Theorem M.6.11b reports information acquired by the registered measurement channel. On the product-input, charge-conserving unitary and charge-commuting-pointer branch of Theorem M.6.13b, its item 2 forbids exact sharp measurement of a noncommuting observable with a charge-invariant reference. Under the additional noise and positive finite variance hypotheses of item 3, the error obeys (M.6.13.4), including when the reference has nonzero asymmetry. Nonzero $\mathcal A_Q$ is neither a sufficient measurement certificate nor an exemption from that quantitative bound.

*Proof.* Theorem M.6.11b post-processes the actual classical record and cannot supply information absent from its channel. Items 2 and 3 of Theorem M.6.13b then apply under their respective implementation hypotheses. Mere CPTP covariance does not supply those unitary, input or pointer hypotheses. $\square$

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
The ledger measures asymmetry along the orbit $g\mapsto U_g\rho U_g^\dagger$. It is not a criterion for all physical information carried by a state or charge sector. Operational use of an orbit label additionally requires a registered finite protocol and its reference resources.

**Theorem M.6.13e (Finite Frameness and Symmetry-Orbit Labels).** For the continuous finite-dimensional unitary representation in Definition M.6.13d,
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
In this zero-frameness case, changing only the orbit parameter $g$ leaves the input state identical and hence changes no protocol response. PPI/PCE can remove that response-null orbit label. Distinct invariant states or charge sectors can nevertheless carry distinguishable information with zero frameness. Nonzero frameness records an asymmetry resource; it does not by itself certify that a retained protocol can read a proposed label. Theorem M.6.13b gives the charge-measurement restrictions under its separate input, dilation, pointer and variance hypotheses.

*Proof.* Normalized Haar averaging is CPTP, trace preserving, idempotent and invariant under the group. Put $\tau=\mathcal T_G(\rho)$ and $S=\operatorname{supp}\tau$. If $v\in\ker\tau$, then
$$
0=\langle v,\tau v\rangle
=\int_G\langle U_g^\dagger v,\rho U_g^\dagger v\rangle\,dg.
$$
The integrand is continuous and nonnegative, so it vanishes everywhere, including at the identity. Thus $\rho v=0$ and $\operatorname{supp}\rho\subseteq S$. The invariant operator $\tau$ has invariant support $S$ and a bounded logarithm on $S$. Using that logarithm, extended by zero on $S^\perp$, the Haar trace identity gives
$$
\operatorname{Tr}\rho\log(\tau|_S)
=
\operatorname{Tr}\tau\log(\tau|_S)
=
-S(\tau).
$$
Consequently,
$$
D(\rho\Vert\tau)
=-S(\rho)-\operatorname{Tr}\rho\log(\tau|_S)
=S(\tau)-S(\rho).
$$
Finite-dimensional relative-entropy positivity and its equality condition prove (M.6.13e.1)–(M.6.13e.2). Since $\tau$ is invariant, $\rho=\tau$ makes the entire group orbit constant. This establishes the response-null statement for changes of the orbit parameter alone.

For the distinction from invariant information, take $Q=\operatorname{diag}(0,1)$ and $\rho_0=|0\rangle\langle0|$, $\rho_1=|1\rangle\langle1|$. Both states are invariant under $e^{-itQ}$ and have zero frameness, but the charge measurement distinguishes them perfectly. They therefore cannot be identified merely because their frameness values vanish. The charge instance uses the normalized twirl over the compact closure specified in Definition M.6.13a; its measurement bounds retain all hypotheses of Theorem M.6.13b. $\square$

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

**Corollary M.6.14b.1 (Local Threshold Arming as a Process-Tensor Control).** Let $A_j$ be a finite classical arming or stopping register whose value is a registered function of classical data available in the branch's local past. These data may include retained records, ledger readings and a classically supplied model or estimate of the local reduced process tensor. A nonlinear function of an unknown quantum state or process is not an available control input merely because that state or process has a mathematical description. Adjoining this record-based control gives another causal process tensor satisfying Definition M.6.14a. If the conditional post-arming outcome kernel is unchanged, the Born weights of Theorem 28a are unchanged on that conditioned branch. On the local CPTP branch of Postulate 3(i), summing over all local control outcomes preserves remote unconditional marginals. Theorems 39 and 39a remain deterministic-endpoint and zero-error finite-window gates.

*Proof.* On a classical past-record basis, the map $r\mapsto(r,f(r))$ is an isometry and hence a CP, trace-preserving record extension. Controlled compositions of the registered local instruments are CP; summing their complete outcome family is trace preserving. Composing these instruments with the process tensor therefore preserves positivity and the partial-trace causality constraints. Local trace preservation leaves a remote unconditional marginal unchanged, whereas postselection on one control outcome need not do so. Equality of the conditional outcome kernel preserves its probabilities by definition. $\square$

**Remark M.6.14b.2 (No-Future-to-Past Condition for Metered Actualization).** A metered trigger uses only records available in the local past. Changing later complete trace-preserving choices leaves every earlier unconditional record marginal unchanged. It need not leave the full multi-time joint law unchanged, and conditioning on selected future outcomes is a distinct postselected experiment.


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

Assume for the Choi-rank statement that $\mathcal A_X=\mathcal B(\mathcal H_X)$ and $\mathcal A_Y=\mathcal B(\mathcal H_Y)$. The channel has a minimal Stinespring dilation whose environment dimension is $\operatorname{rank}J(\Phi_*)$, where $\Phi_*$ is the Schrödinger adjoint. For an instrument, define the flagged Schrödinger channel
$$
\widehat\Phi_*(\rho)
:=
\sum_r\Phi_{r,*}(\rho)\otimes|r\rangle\langle r|.
$$
It is completely positive, and it is trace preserving because $\sum_r\Phi_r(I)=I$. Its Heisenberg dual is
$$
\widehat\Phi\big((a_r)_r\big)=\sum_r\Phi_r(a_r).
$$
The minimal environment dimension is $\operatorname{rank}J(\widehat\Phi_*)$. Minimal dilations are unique up to a unitary on equal minimal environments, and every nonminimal dilation contains the minimal one through an isometry. If the PCE ledger assigns strictly greater cost to response-null environmental refinements, it selects this minimal dilation up to that unitary equivalence. No multi-time minimal-memory conclusion follows without a separately stated comb-memory optimization theorem.

*Proof.* The CP extension between $\mathcal A_Y$ and $\mathcal A_X$ is a hypothesis, so the finite-dimensional Choi matrix $J(\Phi)$ is positive. A rank decomposition
$$
J(\Phi)=\sum_{a=1}^r|v_a\rangle\langle v_a|
$$
with $r=\operatorname{rank}J(\Phi)$ yields $r$ Kraus operators and hence a Stinespring environment of dimension $r$. Conversely, tracing an environment of dimension $m$ gives at most $m$ linearly independent Kraus operators, so $m\ge\operatorname{rank}J(\Phi)$. This proves minimality. The standard minimal-Stinespring uniqueness argument identifies two minimal Kraus spans by a unitary; a nonminimal Kraus family is related by an isometry. The same argument applied to the flagged channel $\widehat\Phi_*$ proves the instrument statement. Strict PCE monotonicity removes only the stipulated response-null refinements. ∎

## M.7 Conclusion

The appendix provides a conditional model of perspective-dependent quantum records, their interactions, and their costs. Its conclusions apply when the stated state, readout, and physical-response assumptions hold.

**Technical ledger.**

This appendix provides a conditional mathematical model for Perspectival State and Dual Dynamics.

**Formal Foundations (M.2–M.5).** After the flag-manifold perspective space, normalized transition kernel, actualization instrument, drift, diffusion, and boundary data are specified, Equations M.5a–M.5b define a drift-diffusion realization. On the interrogative-efficiency branch of Section M.3.3.2, Theorem M.3.3e identifies the attainable directional benefit with the quantum Fisher bound. Proposition M.3.3h derives the target and scalar drift on the smooth sub-branch with a unique global nondegenerate minimizer and isotropic positive Hessian; its local drift model is the second-order normal form of that potential. On the finite-dimensional normalized noncontextual frame-function branch of Theorem G.1.3, the outcome probabilities have Born form. Definite retained outcomes require the declared instrument/readout branch, and Wasserstein contractivity holds for the constructed class only under its curvature and regularity hypotheses.

**Foundational Scenarios (M.6).** Within the stipulated perspective-indexed semantics and interaction kernel:

- **Summary of Theorem M.6.1:** Friend and Wigner records are indexed by different perspectives, so the model assigns no single unindexed proposition both definite and indefinite.
- **Summary of Lemma M.6.1:** Convergence to consistent configurations requires the strong-readout and contractive-kernel hypotheses.
- **Summary of Definition M.6.2, Lemma M.6.2a, and Theorem M.6.2b:** Actualized records may be imported across distinct perspectives only with a record-sharing or perspective-invariance certificate. Theorem M.6.2b proves that the displayed Frauchiger–Renner-style import is ill typed when both certificates are absent, and Theorem M.6.2c extends the obstruction to both certainty routes of the complete four-laboratory protocol when their edges connect distinct perspective indices.
- **Summary of Structural Correspondence M.6.4:** The comparison with frame-relative simultaneity is structural: perspective-relative actuality uses the retained SPAP, Hilbert/Born, update, and perspective records, while frame-relative simultaneity uses the accepted Lorentzian characteristic-cone branch.

**Connection to CC.** The variable $N$ is a typed interface for Hypothesis 3. An aggregate may influence an outcome through $N$ only on an accepted G9CC response certificate constructing the causal aggregate-to-control map and changed normalized instrument. Theorems 39 and 51 then bound the supplied response. Preservation of Lemma M.6.1 additionally requires the modulated readout kernel to remain in its strong-readout and contractive class.

**Cost Functional (M.6.10).** The perspectival profile $\mathcal{P}_S(E)=(\Delta Q_S,\mu_S,\sigma_S)$ is a receiver-pattern descriptor; its relation to $\Sigma$ requires the registered local bridge of Proposition M.10.9. The SPAP proximity $\mu_S(E)$ records the performance level required by criterion (M.18), while $\sigma_S(E)$ records the fraction of the update assigned to the self-model subspace. On an asymptotic family carrying the reduction certificate of Theorem M.10.3, $\mu_{S_\lambda}(E_\lambda)\to\infty$ gives the certified computational lower bound (M.23). Purely external patterns attain $\mu_S(E)=1/\alpha_{SPAP}$ only under the baseline-invariance hypothesis of Corollary M.10.3.1; neither statement alone fixes physical heat. External evaluation and finite-family screening require the effective model-access, decision, and optional insulation certificates of Theorems M.10.5 and M.10.8. A replay penalty is available only for an implementation defined to reproduce a specified target reset ledger, with nonnegative overhead imposed by that accounting convention. Theorem M.10.9 proves that $\mu_S(E)$ is not determined by Shannon entropy alone; comparisons with other information quantities require separately defined reduction maps.

**Synthesis.** On its declared instrument and perspective-kernel premises, the formalism types `Evolve` records and represents memory, causal-order, post-selection, and weak-probe histories through finite process tensors. It proves the stated cross-perspective import obstruction and applies it to the complete four-laboratory Frauchiger–Renner certainty graph. The CC variable $N$ is a conditional empirical interface whose physical realization remains G9CC. The framework thereby supplies a coherent branch model while retaining the independent carrier, actualization, thermodynamic, and realization obligations.

**Causality terminology rule.** Every endpoint, bias-strength, gravity-backreaction, or zero-error bound in this appendix is weaker than operational causality. Postulate 2 means exact pre-lightcone context independence by Theorem 39c; a late-randomized Bob-marginal shift lies outside that branch.
